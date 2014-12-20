---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.327271, -0.7925353, -2.419548, 1, 0, 0, 1,
-2.984139, 0.1090567, -2.730123, 1, 0.007843138, 0, 1,
-2.883899, 0.004692117, -1.677856, 1, 0.01176471, 0, 1,
-2.794015, -0.06792046, -1.422792, 1, 0.01960784, 0, 1,
-2.431609, -0.535249, -3.716733, 1, 0.02352941, 0, 1,
-2.425285, -0.03887649, -0.8196247, 1, 0.03137255, 0, 1,
-2.418591, 0.8559396, -2.507071, 1, 0.03529412, 0, 1,
-2.290555, 0.1972914, -0.888873, 1, 0.04313726, 0, 1,
-2.284968, -0.4359429, 0.3850507, 1, 0.04705882, 0, 1,
-2.254748, 0.6409795, -0.8465566, 1, 0.05490196, 0, 1,
-2.209566, -0.1680086, -1.040611, 1, 0.05882353, 0, 1,
-2.194257, 0.7692353, -0.8063412, 1, 0.06666667, 0, 1,
-2.1841, -1.312459, -2.54014, 1, 0.07058824, 0, 1,
-2.14447, -1.074122, -3.112746, 1, 0.07843138, 0, 1,
-2.140858, -0.5026962, -1.905874, 1, 0.08235294, 0, 1,
-2.117863, -0.07251154, -1.463233, 1, 0.09019608, 0, 1,
-2.052788, 0.9072474, -1.249225, 1, 0.09411765, 0, 1,
-2.045236, -0.1179371, -2.245472, 1, 0.1019608, 0, 1,
-2.020383, 0.02471019, -1.045808, 1, 0.1098039, 0, 1,
-2.019136, -1.01679, -2.345509, 1, 0.1137255, 0, 1,
-1.985439, 0.1025813, -2.852947, 1, 0.1215686, 0, 1,
-1.964204, 0.7904325, -2.46694, 1, 0.1254902, 0, 1,
-1.956294, -1.749162, -2.51023, 1, 0.1333333, 0, 1,
-1.948947, 0.3207732, -2.248889, 1, 0.1372549, 0, 1,
-1.904907, 0.1145373, 0.2483785, 1, 0.145098, 0, 1,
-1.902621, 0.960494, 0.9126108, 1, 0.1490196, 0, 1,
-1.898201, -0.7280211, -1.794203, 1, 0.1568628, 0, 1,
-1.879365, 0.425415, -1.675295, 1, 0.1607843, 0, 1,
-1.872575, 0.7121196, -2.301339, 1, 0.1686275, 0, 1,
-1.871273, 0.01157851, -1.727228, 1, 0.172549, 0, 1,
-1.848669, -1.360591, -2.606552, 1, 0.1803922, 0, 1,
-1.830836, 0.2583939, -1.195175, 1, 0.1843137, 0, 1,
-1.82642, 0.5914617, -1.184965, 1, 0.1921569, 0, 1,
-1.795234, 0.0160924, -2.204744, 1, 0.1960784, 0, 1,
-1.751725, 0.3966659, -1.385306, 1, 0.2039216, 0, 1,
-1.749499, -0.567279, -1.373544, 1, 0.2117647, 0, 1,
-1.738292, -0.08103137, -0.8623692, 1, 0.2156863, 0, 1,
-1.731119, 1.238076, -1.390102, 1, 0.2235294, 0, 1,
-1.724844, 0.7016048, -0.5320177, 1, 0.227451, 0, 1,
-1.720031, 0.6509861, 0.8009244, 1, 0.2352941, 0, 1,
-1.697609, 0.4646858, -2.087331, 1, 0.2392157, 0, 1,
-1.692599, -0.5618256, -1.791521, 1, 0.2470588, 0, 1,
-1.688884, 0.5631397, -1.149578, 1, 0.2509804, 0, 1,
-1.682195, -0.01551126, -1.086048, 1, 0.2588235, 0, 1,
-1.624937, 1.930722, -1.116024, 1, 0.2627451, 0, 1,
-1.620134, -1.65633, -4.876971, 1, 0.2705882, 0, 1,
-1.611804, -0.5422331, -1.362001, 1, 0.2745098, 0, 1,
-1.600724, 1.073927, -2.304091, 1, 0.282353, 0, 1,
-1.600069, 0.3684243, -2.199412, 1, 0.2862745, 0, 1,
-1.593133, -0.5277913, -0.3025057, 1, 0.2941177, 0, 1,
-1.592575, -0.5075702, -1.860469, 1, 0.3019608, 0, 1,
-1.590865, 0.007632627, -3.730991, 1, 0.3058824, 0, 1,
-1.534261, 1.852939, -0.3249542, 1, 0.3137255, 0, 1,
-1.533072, 0.3199958, -1.265842, 1, 0.3176471, 0, 1,
-1.524039, 0.02640543, -1.168193, 1, 0.3254902, 0, 1,
-1.519719, 0.5033814, -3.517254, 1, 0.3294118, 0, 1,
-1.517033, 0.6054459, -0.9493623, 1, 0.3372549, 0, 1,
-1.503208, 2.434412, 0.05853071, 1, 0.3411765, 0, 1,
-1.502675, -0.4355242, -0.8660408, 1, 0.3490196, 0, 1,
-1.502077, -2.06672, -3.814453, 1, 0.3529412, 0, 1,
-1.490969, 1.791475, -0.1718412, 1, 0.3607843, 0, 1,
-1.490825, -0.008053325, -2.292173, 1, 0.3647059, 0, 1,
-1.483744, 1.974324, -0.8539609, 1, 0.372549, 0, 1,
-1.477627, -0.1517094, -2.017343, 1, 0.3764706, 0, 1,
-1.468294, -1.374805, -2.137803, 1, 0.3843137, 0, 1,
-1.464266, -0.6251827, -1.345621, 1, 0.3882353, 0, 1,
-1.462144, -0.04838512, -2.753891, 1, 0.3960784, 0, 1,
-1.435168, 0.6077368, -0.0873665, 1, 0.4039216, 0, 1,
-1.423158, -0.4712165, -2.06883, 1, 0.4078431, 0, 1,
-1.421437, -0.5546249, -2.034975, 1, 0.4156863, 0, 1,
-1.414136, -0.352061, -1.07765, 1, 0.4196078, 0, 1,
-1.410635, 0.4008168, -0.9663162, 1, 0.427451, 0, 1,
-1.406243, -0.3322136, -3.593953, 1, 0.4313726, 0, 1,
-1.399374, -0.4858676, -0.9701334, 1, 0.4392157, 0, 1,
-1.397236, -0.2577043, 0.8364335, 1, 0.4431373, 0, 1,
-1.386102, -0.06106804, -4.359241, 1, 0.4509804, 0, 1,
-1.385164, -0.4360685, -2.174114, 1, 0.454902, 0, 1,
-1.372134, 1.211122, -0.1458961, 1, 0.4627451, 0, 1,
-1.36509, -1.672334, -1.966778, 1, 0.4666667, 0, 1,
-1.357301, -0.3222259, 0.0208968, 1, 0.4745098, 0, 1,
-1.341389, 0.8930184, -1.46086, 1, 0.4784314, 0, 1,
-1.319337, -0.9601573, -1.308356, 1, 0.4862745, 0, 1,
-1.30915, 1.331278, -1.063926, 1, 0.4901961, 0, 1,
-1.305326, 0.1839309, -1.247509, 1, 0.4980392, 0, 1,
-1.30415, 0.4717676, -1.614014, 1, 0.5058824, 0, 1,
-1.300384, 0.2602834, -1.712141, 1, 0.509804, 0, 1,
-1.295322, 0.5197856, -2.032026, 1, 0.5176471, 0, 1,
-1.291728, -0.9264103, -2.339773, 1, 0.5215687, 0, 1,
-1.286932, 0.309817, -0.3238578, 1, 0.5294118, 0, 1,
-1.284286, -0.7546672, -0.2353833, 1, 0.5333334, 0, 1,
-1.268695, -1.265291, -3.310513, 1, 0.5411765, 0, 1,
-1.263078, -0.2018575, -2.492795, 1, 0.5450981, 0, 1,
-1.258999, 2.230969, 1.05741, 1, 0.5529412, 0, 1,
-1.248113, 0.3132717, -0.4896234, 1, 0.5568628, 0, 1,
-1.247719, 1.63975, -0.3584364, 1, 0.5647059, 0, 1,
-1.244504, 0.1293294, -0.9663529, 1, 0.5686275, 0, 1,
-1.232733, -0.676788, 0.09286382, 1, 0.5764706, 0, 1,
-1.229282, 1.415483, -1.423373, 1, 0.5803922, 0, 1,
-1.222309, -1.157104, -2.24796, 1, 0.5882353, 0, 1,
-1.222142, -0.517765, -0.9271035, 1, 0.5921569, 0, 1,
-1.22102, 0.4148098, -2.480893, 1, 0.6, 0, 1,
-1.218215, 1.063528, -0.3593753, 1, 0.6078432, 0, 1,
-1.212867, 0.3131907, -0.6064339, 1, 0.6117647, 0, 1,
-1.200666, 0.6421946, 0.04675436, 1, 0.6196079, 0, 1,
-1.199853, 1.010958, 0.1856224, 1, 0.6235294, 0, 1,
-1.195793, 0.8842878, -0.282249, 1, 0.6313726, 0, 1,
-1.192647, 0.3975717, 0.4027089, 1, 0.6352941, 0, 1,
-1.187923, 0.3256249, -2.150986, 1, 0.6431373, 0, 1,
-1.184215, 0.3295416, -2.146013, 1, 0.6470588, 0, 1,
-1.184039, -0.9633769, -3.064944, 1, 0.654902, 0, 1,
-1.178463, 1.635468, -1.550145, 1, 0.6588235, 0, 1,
-1.178194, -0.2688085, -1.612561, 1, 0.6666667, 0, 1,
-1.166762, -2.059339, -2.039535, 1, 0.6705883, 0, 1,
-1.159732, -1.172262, -3.160199, 1, 0.6784314, 0, 1,
-1.155867, -0.4316557, -1.612085, 1, 0.682353, 0, 1,
-1.145825, 0.7592044, -0.2577524, 1, 0.6901961, 0, 1,
-1.145273, 0.2949181, 0.3268314, 1, 0.6941177, 0, 1,
-1.133071, -0.5601625, -3.666077, 1, 0.7019608, 0, 1,
-1.129364, 0.5345541, -1.897319, 1, 0.7098039, 0, 1,
-1.124771, 0.7702356, -1.036076, 1, 0.7137255, 0, 1,
-1.1162, 0.5830893, -2.665856, 1, 0.7215686, 0, 1,
-1.11446, -0.198051, -1.701688, 1, 0.7254902, 0, 1,
-1.110597, -0.3486065, -1.614131, 1, 0.7333333, 0, 1,
-1.105471, -1.246486, -2.360638, 1, 0.7372549, 0, 1,
-1.101591, 1.108826, -1.715286, 1, 0.7450981, 0, 1,
-1.087947, -0.05884195, -2.938346, 1, 0.7490196, 0, 1,
-1.083689, -0.9202013, -0.3235103, 1, 0.7568628, 0, 1,
-1.08045, 3.037762, -1.141221, 1, 0.7607843, 0, 1,
-1.076845, 0.8323496, 0.6474986, 1, 0.7686275, 0, 1,
-1.068373, 0.8641169, -0.6881704, 1, 0.772549, 0, 1,
-1.064902, 0.3040729, 0.5377551, 1, 0.7803922, 0, 1,
-1.062675, -0.1250171, -2.796415, 1, 0.7843137, 0, 1,
-1.06073, -0.2382509, -1.836206, 1, 0.7921569, 0, 1,
-1.05916, 0.0812711, -1.27513, 1, 0.7960784, 0, 1,
-1.043596, -1.01659, -3.478779, 1, 0.8039216, 0, 1,
-1.032425, -1.168893, -3.266471, 1, 0.8117647, 0, 1,
-1.020817, 0.5500895, -1.014227, 1, 0.8156863, 0, 1,
-1.013076, -0.3891206, -1.520993, 1, 0.8235294, 0, 1,
-1.009278, -1.466705, -3.800007, 1, 0.827451, 0, 1,
-1.007538, -1.599918, -4.566607, 1, 0.8352941, 0, 1,
-1.001012, -0.5578745, -2.638308, 1, 0.8392157, 0, 1,
-0.9943773, 2.385255, 0.06087867, 1, 0.8470588, 0, 1,
-0.9935443, -0.8173736, -1.885639, 1, 0.8509804, 0, 1,
-0.9932166, -0.5839049, -1.843242, 1, 0.8588235, 0, 1,
-0.9931164, -0.6085252, -2.138576, 1, 0.8627451, 0, 1,
-0.9899132, -1.407767, -1.623087, 1, 0.8705882, 0, 1,
-0.985629, -0.213238, -1.77739, 1, 0.8745098, 0, 1,
-0.9838189, -1.009013, -3.371153, 1, 0.8823529, 0, 1,
-0.9814538, 0.9797316, -2.333706, 1, 0.8862745, 0, 1,
-0.9808373, -0.241262, -1.39193, 1, 0.8941177, 0, 1,
-0.9741623, -1.380538, -3.273476, 1, 0.8980392, 0, 1,
-0.9738075, 0.06740681, -0.8231382, 1, 0.9058824, 0, 1,
-0.9666399, -0.4913722, -2.450894, 1, 0.9137255, 0, 1,
-0.9653909, 0.4436319, -1.269193, 1, 0.9176471, 0, 1,
-0.9626958, 0.3295676, -1.511663, 1, 0.9254902, 0, 1,
-0.9622025, -0.2535341, -1.019243, 1, 0.9294118, 0, 1,
-0.9614581, -1.137373, -1.225384, 1, 0.9372549, 0, 1,
-0.9610488, 2.50624, -1.235816, 1, 0.9411765, 0, 1,
-0.955451, -0.3685808, -1.493092, 1, 0.9490196, 0, 1,
-0.9544964, -0.449281, -3.799421, 1, 0.9529412, 0, 1,
-0.9514998, 0.2445546, -1.228418, 1, 0.9607843, 0, 1,
-0.9490493, -1.706827, -1.186194, 1, 0.9647059, 0, 1,
-0.9472075, 1.67921, -0.6408541, 1, 0.972549, 0, 1,
-0.9455214, -0.2602082, 0.03808338, 1, 0.9764706, 0, 1,
-0.9430978, -1.010879, -3.94541, 1, 0.9843137, 0, 1,
-0.9405925, -1.136692, -2.996081, 1, 0.9882353, 0, 1,
-0.9398898, 0.2271392, -0.8645915, 1, 0.9960784, 0, 1,
-0.9343235, -1.132646, -0.6520429, 0.9960784, 1, 0, 1,
-0.9342833, -0.0146349, -0.2459002, 0.9921569, 1, 0, 1,
-0.9330431, 0.2778635, -2.620131, 0.9843137, 1, 0, 1,
-0.9282586, 1.730977, -0.8222691, 0.9803922, 1, 0, 1,
-0.9194978, -0.5603783, -2.05512, 0.972549, 1, 0, 1,
-0.9132898, -0.5182229, -2.008916, 0.9686275, 1, 0, 1,
-0.9119319, -0.3379, -2.44267, 0.9607843, 1, 0, 1,
-0.9074161, 1.480355, 0.7394739, 0.9568627, 1, 0, 1,
-0.9064854, -0.09701087, -1.100715, 0.9490196, 1, 0, 1,
-0.9034083, 0.5669598, -1.880269, 0.945098, 1, 0, 1,
-0.8981747, 0.6440887, 0.6178246, 0.9372549, 1, 0, 1,
-0.89666, -0.6627728, -2.327575, 0.9333333, 1, 0, 1,
-0.8958262, -0.05171203, -0.2746049, 0.9254902, 1, 0, 1,
-0.8939809, -0.8719858, -1.352757, 0.9215686, 1, 0, 1,
-0.8937058, -0.7877258, -2.607689, 0.9137255, 1, 0, 1,
-0.8795386, -0.5089209, -2.54057, 0.9098039, 1, 0, 1,
-0.8790462, -0.6330468, -1.554684, 0.9019608, 1, 0, 1,
-0.8783306, -0.4399451, -3.342839, 0.8941177, 1, 0, 1,
-0.8773972, 2.350524, -0.8480141, 0.8901961, 1, 0, 1,
-0.8765335, 0.8979525, 1.909953, 0.8823529, 1, 0, 1,
-0.8756332, -0.8635644, -3.752232, 0.8784314, 1, 0, 1,
-0.8724545, -1.457012, -1.757955, 0.8705882, 1, 0, 1,
-0.8567032, -0.2885953, -3.014825, 0.8666667, 1, 0, 1,
-0.8524233, 0.1403358, -2.323769, 0.8588235, 1, 0, 1,
-0.845946, -0.4265869, -3.558467, 0.854902, 1, 0, 1,
-0.8448238, 0.4769949, -0.04394308, 0.8470588, 1, 0, 1,
-0.8446926, -0.7190638, -2.75768, 0.8431373, 1, 0, 1,
-0.8445445, 0.03398002, -0.1510936, 0.8352941, 1, 0, 1,
-0.8407732, 0.6741167, -0.2683077, 0.8313726, 1, 0, 1,
-0.8404734, 0.4734095, -1.126006, 0.8235294, 1, 0, 1,
-0.8371208, 0.9065002, -2.251595, 0.8196079, 1, 0, 1,
-0.8292214, 1.502381, -0.8663495, 0.8117647, 1, 0, 1,
-0.8286211, -0.2062057, -3.204914, 0.8078431, 1, 0, 1,
-0.8173898, 1.230144, -0.9302419, 0.8, 1, 0, 1,
-0.8170453, 1.256206, 0.03583649, 0.7921569, 1, 0, 1,
-0.8143828, -0.264941, -2.671622, 0.7882353, 1, 0, 1,
-0.814243, 0.3762099, -1.602461, 0.7803922, 1, 0, 1,
-0.8126744, 0.7494646, -1.806295, 0.7764706, 1, 0, 1,
-0.8079778, 0.1250547, 0.2965002, 0.7686275, 1, 0, 1,
-0.8065389, -0.5972747, -2.045574, 0.7647059, 1, 0, 1,
-0.8047229, 1.197802, 0.3233642, 0.7568628, 1, 0, 1,
-0.7829946, 0.2484269, -1.694227, 0.7529412, 1, 0, 1,
-0.7791752, 0.1618268, -1.351899, 0.7450981, 1, 0, 1,
-0.7751219, 0.4650765, 0.6360327, 0.7411765, 1, 0, 1,
-0.7648731, 1.227306, -1.498741, 0.7333333, 1, 0, 1,
-0.7613342, -0.1783105, -1.315194, 0.7294118, 1, 0, 1,
-0.7578668, -2.675259, -1.677784, 0.7215686, 1, 0, 1,
-0.7544929, 0.5641946, 1.515205, 0.7176471, 1, 0, 1,
-0.7527096, -0.823687, -1.725162, 0.7098039, 1, 0, 1,
-0.7524414, 1.339838, 0.8699412, 0.7058824, 1, 0, 1,
-0.7495436, -1.505337, -3.567575, 0.6980392, 1, 0, 1,
-0.7442564, -1.012609, -1.843401, 0.6901961, 1, 0, 1,
-0.7421132, -1.399768, -2.854007, 0.6862745, 1, 0, 1,
-0.7418497, -2.379284, -3.097522, 0.6784314, 1, 0, 1,
-0.7350971, 0.3216896, -0.9082399, 0.6745098, 1, 0, 1,
-0.7315298, 1.739721, -0.4386934, 0.6666667, 1, 0, 1,
-0.731482, -1.084825, -0.3149443, 0.6627451, 1, 0, 1,
-0.7293698, -0.2730215, -3.890668, 0.654902, 1, 0, 1,
-0.7229803, -1.998681, -3.048382, 0.6509804, 1, 0, 1,
-0.7221483, 1.240931, 0.01286163, 0.6431373, 1, 0, 1,
-0.711062, 1.050199, 0.9096053, 0.6392157, 1, 0, 1,
-0.7047062, -1.042761, -2.709734, 0.6313726, 1, 0, 1,
-0.7015375, -1.118344, -2.06454, 0.627451, 1, 0, 1,
-0.6966081, 0.3685756, -1.016204, 0.6196079, 1, 0, 1,
-0.6951492, -0.8183933, -3.502003, 0.6156863, 1, 0, 1,
-0.6946295, 1.362556, 0.05415622, 0.6078432, 1, 0, 1,
-0.6904485, -1.356933, -1.443819, 0.6039216, 1, 0, 1,
-0.6831861, -0.2840202, -2.22406, 0.5960785, 1, 0, 1,
-0.675307, -0.4064028, -2.882448, 0.5882353, 1, 0, 1,
-0.6646546, 1.54851, -1.649911, 0.5843138, 1, 0, 1,
-0.6631238, -0.01363473, -0.847157, 0.5764706, 1, 0, 1,
-0.6579437, 1.140416, -2.756963, 0.572549, 1, 0, 1,
-0.6577445, -0.3574175, -0.2452546, 0.5647059, 1, 0, 1,
-0.6554098, 1.076088, 0.6831095, 0.5607843, 1, 0, 1,
-0.6541201, 0.3927353, -0.6337103, 0.5529412, 1, 0, 1,
-0.6520864, -0.7831978, -2.268621, 0.5490196, 1, 0, 1,
-0.6519835, 0.2679158, -0.3173993, 0.5411765, 1, 0, 1,
-0.6463841, -0.2310077, -3.067856, 0.5372549, 1, 0, 1,
-0.6434229, -2.530763, -3.011645, 0.5294118, 1, 0, 1,
-0.6404744, 1.864861, -0.8166514, 0.5254902, 1, 0, 1,
-0.6393596, -0.04197638, -0.3759695, 0.5176471, 1, 0, 1,
-0.6388216, 0.18304, -0.08286042, 0.5137255, 1, 0, 1,
-0.6368595, -0.6727408, -2.296575, 0.5058824, 1, 0, 1,
-0.634707, 0.6487737, 0.6779326, 0.5019608, 1, 0, 1,
-0.6343996, -0.9350504, -1.018475, 0.4941176, 1, 0, 1,
-0.63358, 0.557847, -0.6849942, 0.4862745, 1, 0, 1,
-0.6330592, 0.421059, 0.2614281, 0.4823529, 1, 0, 1,
-0.627579, 0.2188031, -2.011522, 0.4745098, 1, 0, 1,
-0.6272087, -0.1859789, -1.427632, 0.4705882, 1, 0, 1,
-0.6225272, -1.109043, -1.713699, 0.4627451, 1, 0, 1,
-0.6174638, 0.02649926, -1.220614, 0.4588235, 1, 0, 1,
-0.6163748, -0.4478139, -4.294873, 0.4509804, 1, 0, 1,
-0.6118042, 0.9673877, -1.143159, 0.4470588, 1, 0, 1,
-0.6105368, -0.01851785, -2.613405, 0.4392157, 1, 0, 1,
-0.6104348, -0.8761781, -3.306259, 0.4352941, 1, 0, 1,
-0.606797, 0.9109985, -0.7601466, 0.427451, 1, 0, 1,
-0.6067479, -0.7385781, -3.486472, 0.4235294, 1, 0, 1,
-0.604632, -0.002024077, -0.5748002, 0.4156863, 1, 0, 1,
-0.6031121, -0.9153799, -3.501102, 0.4117647, 1, 0, 1,
-0.6022915, 1.0633, -0.509765, 0.4039216, 1, 0, 1,
-0.6016875, -0.6418002, -2.051926, 0.3960784, 1, 0, 1,
-0.599768, -0.3543147, -3.061994, 0.3921569, 1, 0, 1,
-0.5975866, -0.6942284, -1.746225, 0.3843137, 1, 0, 1,
-0.5944419, 0.08208866, -0.6981008, 0.3803922, 1, 0, 1,
-0.5902333, -2.109442, -2.639313, 0.372549, 1, 0, 1,
-0.5876904, -0.3838863, 0.2374778, 0.3686275, 1, 0, 1,
-0.5812904, 2.173594, -0.5109493, 0.3607843, 1, 0, 1,
-0.5793263, 0.2181943, -2.732346, 0.3568628, 1, 0, 1,
-0.5755427, 0.457244, -1.125287, 0.3490196, 1, 0, 1,
-0.5751531, 0.8575894, -0.5935634, 0.345098, 1, 0, 1,
-0.5719688, -0.0781403, -1.282691, 0.3372549, 1, 0, 1,
-0.5672389, -2.520922, -2.733268, 0.3333333, 1, 0, 1,
-0.5668449, 0.5744686, -1.759795, 0.3254902, 1, 0, 1,
-0.5664008, -0.8655459, -2.763736, 0.3215686, 1, 0, 1,
-0.556801, 0.221684, 0.3548957, 0.3137255, 1, 0, 1,
-0.5546811, 0.2611606, -1.744739, 0.3098039, 1, 0, 1,
-0.5541948, -0.2183486, -0.789633, 0.3019608, 1, 0, 1,
-0.5486394, -0.3141266, -1.952206, 0.2941177, 1, 0, 1,
-0.5485012, 0.07998072, -0.9917612, 0.2901961, 1, 0, 1,
-0.5476032, 1.027685, -0.9439872, 0.282353, 1, 0, 1,
-0.5471087, -1.525302, -1.989097, 0.2784314, 1, 0, 1,
-0.5388068, 0.2796222, -2.754985, 0.2705882, 1, 0, 1,
-0.5385384, 0.4812002, -1.937851, 0.2666667, 1, 0, 1,
-0.5372566, -0.7233003, -3.010256, 0.2588235, 1, 0, 1,
-0.5350818, 1.080682, -1.454409, 0.254902, 1, 0, 1,
-0.5315661, 0.1612742, -0.2842228, 0.2470588, 1, 0, 1,
-0.5229631, -0.7695299, -2.445485, 0.2431373, 1, 0, 1,
-0.5214677, 0.05258466, -1.212042, 0.2352941, 1, 0, 1,
-0.5182157, -1.122396, -0.6725035, 0.2313726, 1, 0, 1,
-0.5150765, 0.8007836, 0.5482295, 0.2235294, 1, 0, 1,
-0.5080582, 0.3869531, -2.109879, 0.2196078, 1, 0, 1,
-0.5056821, -0.841037, -0.7082571, 0.2117647, 1, 0, 1,
-0.5019497, 0.3164056, -1.161167, 0.2078431, 1, 0, 1,
-0.5009954, -0.1073755, -1.921043, 0.2, 1, 0, 1,
-0.500598, 0.08675863, -0.6577953, 0.1921569, 1, 0, 1,
-0.4986755, 0.8709211, -1.207674, 0.1882353, 1, 0, 1,
-0.4977818, -1.116551, -2.822382, 0.1803922, 1, 0, 1,
-0.4969844, -0.6803252, -1.951981, 0.1764706, 1, 0, 1,
-0.4967086, 0.4940319, -0.6741236, 0.1686275, 1, 0, 1,
-0.4928518, -1.335995, -2.467919, 0.1647059, 1, 0, 1,
-0.4802096, 0.1050656, -1.657943, 0.1568628, 1, 0, 1,
-0.4763804, 1.406312, -0.3730527, 0.1529412, 1, 0, 1,
-0.4723605, 0.04264842, -0.7586601, 0.145098, 1, 0, 1,
-0.4715248, 0.0777632, -1.567082, 0.1411765, 1, 0, 1,
-0.4699427, 0.6783273, 0.4488357, 0.1333333, 1, 0, 1,
-0.4691786, 0.4170433, 0.2521428, 0.1294118, 1, 0, 1,
-0.4688783, -1.055057, 0.05786291, 0.1215686, 1, 0, 1,
-0.4665835, -0.09604747, -1.755274, 0.1176471, 1, 0, 1,
-0.4665771, -0.3125336, -2.914011, 0.1098039, 1, 0, 1,
-0.458715, -0.1577333, 0.09494276, 0.1058824, 1, 0, 1,
-0.4574944, 1.21779, -0.04932725, 0.09803922, 1, 0, 1,
-0.4567363, -0.2704045, -2.020775, 0.09019608, 1, 0, 1,
-0.4549579, -0.8224952, -2.013196, 0.08627451, 1, 0, 1,
-0.4531414, -0.6477134, -1.223583, 0.07843138, 1, 0, 1,
-0.4522668, -0.600686, -1.57393, 0.07450981, 1, 0, 1,
-0.4511193, -1.391931, -3.941043, 0.06666667, 1, 0, 1,
-0.44358, 1.879026, 1.112475, 0.0627451, 1, 0, 1,
-0.436663, -0.5553728, -3.206924, 0.05490196, 1, 0, 1,
-0.4300179, -0.5957078, -1.661058, 0.05098039, 1, 0, 1,
-0.4256216, -0.196808, -0.6323817, 0.04313726, 1, 0, 1,
-0.4251484, 1.242627, -1.338168, 0.03921569, 1, 0, 1,
-0.4247723, 0.2301182, -2.321152, 0.03137255, 1, 0, 1,
-0.4235976, 1.274935, -1.183233, 0.02745098, 1, 0, 1,
-0.4167122, -0.2707905, -2.257421, 0.01960784, 1, 0, 1,
-0.4161269, 0.7343233, -2.061899, 0.01568628, 1, 0, 1,
-0.4095016, -1.997557, -2.552636, 0.007843138, 1, 0, 1,
-0.40838, -1.048838, -2.094608, 0.003921569, 1, 0, 1,
-0.4077834, -0.6376194, -2.780128, 0, 1, 0.003921569, 1,
-0.4029277, 2.120569, -1.622491, 0, 1, 0.01176471, 1,
-0.4028361, -0.3283313, -2.197814, 0, 1, 0.01568628, 1,
-0.3934357, -0.009306469, -3.026849, 0, 1, 0.02352941, 1,
-0.3898792, 0.9306231, -0.4021066, 0, 1, 0.02745098, 1,
-0.3872621, 0.4443835, -2.681595, 0, 1, 0.03529412, 1,
-0.3840762, -0.2536573, -1.455043, 0, 1, 0.03921569, 1,
-0.3785788, -0.02331852, -0.6667364, 0, 1, 0.04705882, 1,
-0.3727623, 0.6226141, -0.9325114, 0, 1, 0.05098039, 1,
-0.372236, -0.3635021, -2.782156, 0, 1, 0.05882353, 1,
-0.3721957, -0.1213594, -2.444134, 0, 1, 0.0627451, 1,
-0.3712322, 3.288488, 0.4277852, 0, 1, 0.07058824, 1,
-0.3653564, -0.04313419, -1.448387, 0, 1, 0.07450981, 1,
-0.3624741, -0.7682443, -2.364938, 0, 1, 0.08235294, 1,
-0.3587696, -1.332278, -4.01342, 0, 1, 0.08627451, 1,
-0.3570452, -0.09072728, -2.88341, 0, 1, 0.09411765, 1,
-0.3555636, 0.351918, -0.6942518, 0, 1, 0.1019608, 1,
-0.3543472, 1.536442, 1.731174, 0, 1, 0.1058824, 1,
-0.3540149, 1.95365, 0.1945795, 0, 1, 0.1137255, 1,
-0.3520391, -0.0382826, -0.9435214, 0, 1, 0.1176471, 1,
-0.3490168, -0.6346738, -2.184118, 0, 1, 0.1254902, 1,
-0.3488854, 0.1606248, -1.38042, 0, 1, 0.1294118, 1,
-0.3476328, -0.3498843, -3.563609, 0, 1, 0.1372549, 1,
-0.3463334, 1.146515, 0.6640009, 0, 1, 0.1411765, 1,
-0.3380691, -0.6623175, -3.684244, 0, 1, 0.1490196, 1,
-0.3370681, 0.2933634, -1.400617, 0, 1, 0.1529412, 1,
-0.3316366, 1.072489, -1.285287, 0, 1, 0.1607843, 1,
-0.3298395, 1.445903, 0.9803972, 0, 1, 0.1647059, 1,
-0.3221129, -0.4936551, -2.583333, 0, 1, 0.172549, 1,
-0.3207776, 1.219913, -2.413351, 0, 1, 0.1764706, 1,
-0.318851, -0.07330547, -1.441837, 0, 1, 0.1843137, 1,
-0.3140589, 1.60299, 0.4263013, 0, 1, 0.1882353, 1,
-0.3138556, 1.004733, -0.8077945, 0, 1, 0.1960784, 1,
-0.3128611, 0.7985845, -1.739157, 0, 1, 0.2039216, 1,
-0.3107105, -0.2951458, -3.672826, 0, 1, 0.2078431, 1,
-0.3091739, 1.619146, -0.09975414, 0, 1, 0.2156863, 1,
-0.3087962, -1.144536, -3.486015, 0, 1, 0.2196078, 1,
-0.3012903, 0.7235394, 1.606542, 0, 1, 0.227451, 1,
-0.3010321, 0.07730412, -2.494873, 0, 1, 0.2313726, 1,
-0.2993899, 1.586908, -1.733258, 0, 1, 0.2392157, 1,
-0.2988334, -0.8823678, -1.754426, 0, 1, 0.2431373, 1,
-0.2984725, -0.1078377, -1.708372, 0, 1, 0.2509804, 1,
-0.2950842, 1.133527, 0.8479915, 0, 1, 0.254902, 1,
-0.2946942, 1.152982, 0.4372263, 0, 1, 0.2627451, 1,
-0.2910241, 0.8826014, -0.5836583, 0, 1, 0.2666667, 1,
-0.2895044, 0.5252677, -0.8389269, 0, 1, 0.2745098, 1,
-0.2889259, -1.677689, -2.565076, 0, 1, 0.2784314, 1,
-0.2849132, 1.173241, 0.3766041, 0, 1, 0.2862745, 1,
-0.2789922, -0.3653481, -1.569027, 0, 1, 0.2901961, 1,
-0.272457, 0.470957, -0.5276711, 0, 1, 0.2980392, 1,
-0.2699829, 0.5324374, 0.2539877, 0, 1, 0.3058824, 1,
-0.2683884, -0.4959598, -3.761986, 0, 1, 0.3098039, 1,
-0.2677293, -0.4190482, -1.065891, 0, 1, 0.3176471, 1,
-0.2631052, 0.6606675, -0.0009885661, 0, 1, 0.3215686, 1,
-0.2626295, 0.006551545, -0.629482, 0, 1, 0.3294118, 1,
-0.2614547, -0.4348567, -2.318976, 0, 1, 0.3333333, 1,
-0.2604941, -2.198231, -2.216434, 0, 1, 0.3411765, 1,
-0.2496848, -0.7273636, -3.591972, 0, 1, 0.345098, 1,
-0.2450889, -0.2855403, -2.247563, 0, 1, 0.3529412, 1,
-0.2392388, 0.6528167, -0.1248614, 0, 1, 0.3568628, 1,
-0.2379476, 0.1850483, -1.602707, 0, 1, 0.3647059, 1,
-0.2363592, -2.168568, -4.562311, 0, 1, 0.3686275, 1,
-0.2362781, 0.4161457, -1.809926, 0, 1, 0.3764706, 1,
-0.2347087, 0.171087, -1.317594, 0, 1, 0.3803922, 1,
-0.2256762, 1.946701, -0.3318551, 0, 1, 0.3882353, 1,
-0.2225563, -0.4585592, -2.346384, 0, 1, 0.3921569, 1,
-0.2207927, 1.414283, -1.302575, 0, 1, 0.4, 1,
-0.2149159, -1.442971, -4.177538, 0, 1, 0.4078431, 1,
-0.2144171, -0.7484131, -3.51403, 0, 1, 0.4117647, 1,
-0.2126884, -0.8511738, -2.9001, 0, 1, 0.4196078, 1,
-0.2117568, -1.616575, -2.550536, 0, 1, 0.4235294, 1,
-0.2114406, 0.7927442, -0.5642446, 0, 1, 0.4313726, 1,
-0.2104794, 1.064288, 1.292971, 0, 1, 0.4352941, 1,
-0.2104306, -1.334543, -2.036628, 0, 1, 0.4431373, 1,
-0.2051423, -1.939357, -4.389684, 0, 1, 0.4470588, 1,
-0.2043179, 1.248036, 1.010346, 0, 1, 0.454902, 1,
-0.2038827, 0.2958674, -0.462511, 0, 1, 0.4588235, 1,
-0.2028566, 0.6805637, -0.0749703, 0, 1, 0.4666667, 1,
-0.2027501, 1.422465, 0.8496357, 0, 1, 0.4705882, 1,
-0.1967454, -0.6138714, -1.218795, 0, 1, 0.4784314, 1,
-0.1897006, -0.9592835, -1.90288, 0, 1, 0.4823529, 1,
-0.1872987, -0.1255796, -2.334456, 0, 1, 0.4901961, 1,
-0.1846276, 0.1472405, -1.375317, 0, 1, 0.4941176, 1,
-0.1829625, 1.416359, -0.3701825, 0, 1, 0.5019608, 1,
-0.1821548, 0.6632594, 0.2251591, 0, 1, 0.509804, 1,
-0.1801652, -0.09009283, -1.459774, 0, 1, 0.5137255, 1,
-0.1801011, 0.111368, -0.1583532, 0, 1, 0.5215687, 1,
-0.1710738, -0.01377131, -1.263509, 0, 1, 0.5254902, 1,
-0.1694517, 0.412842, -1.303038, 0, 1, 0.5333334, 1,
-0.1676972, -1.371664, -3.274126, 0, 1, 0.5372549, 1,
-0.167645, -0.7343068, -1.402292, 0, 1, 0.5450981, 1,
-0.1639324, -0.02414629, -1.565152, 0, 1, 0.5490196, 1,
-0.1625654, -0.1620045, -2.627039, 0, 1, 0.5568628, 1,
-0.1620003, 0.09525201, -3.015623, 0, 1, 0.5607843, 1,
-0.1597236, 0.5057317, -1.098406, 0, 1, 0.5686275, 1,
-0.1581509, -0.2898509, -1.486362, 0, 1, 0.572549, 1,
-0.1564815, -0.7681858, -3.602879, 0, 1, 0.5803922, 1,
-0.1555786, 0.156872, -0.390356, 0, 1, 0.5843138, 1,
-0.1448057, 0.7345831, -0.5310405, 0, 1, 0.5921569, 1,
-0.1444469, 0.8362313, 1.214876, 0, 1, 0.5960785, 1,
-0.1375547, -0.8524665, -3.239168, 0, 1, 0.6039216, 1,
-0.1350613, 0.4031794, 1.057556, 0, 1, 0.6117647, 1,
-0.1316789, -0.6476538, -3.276101, 0, 1, 0.6156863, 1,
-0.1280888, 0.3136184, -1.890178, 0, 1, 0.6235294, 1,
-0.127864, -0.3181379, -4.347854, 0, 1, 0.627451, 1,
-0.1276882, -0.1750682, -1.420356, 0, 1, 0.6352941, 1,
-0.1223308, -1.298239, -2.655921, 0, 1, 0.6392157, 1,
-0.1222445, 2.20525, 2.445546, 0, 1, 0.6470588, 1,
-0.1204098, 1.426529, 0.1310347, 0, 1, 0.6509804, 1,
-0.1201768, 0.07827516, -0.9193263, 0, 1, 0.6588235, 1,
-0.116748, 1.442502, 0.07214601, 0, 1, 0.6627451, 1,
-0.1165465, 0.3414204, -0.1437893, 0, 1, 0.6705883, 1,
-0.1146753, 0.7939891, -0.06850861, 0, 1, 0.6745098, 1,
-0.1041914, -1.890225, -3.877639, 0, 1, 0.682353, 1,
-0.1020575, 1.089295, 0.9547485, 0, 1, 0.6862745, 1,
-0.09824384, 0.03235454, -1.06567, 0, 1, 0.6941177, 1,
-0.09639033, -0.1580444, -2.590944, 0, 1, 0.7019608, 1,
-0.0900792, 0.008868161, 0.124875, 0, 1, 0.7058824, 1,
-0.08877064, -0.5700276, -2.470108, 0, 1, 0.7137255, 1,
-0.08725414, -0.7973318, -3.571956, 0, 1, 0.7176471, 1,
-0.08682698, 0.5292127, 2.593403, 0, 1, 0.7254902, 1,
-0.08141641, -0.03927794, -2.643452, 0, 1, 0.7294118, 1,
-0.07897773, 0.2985451, -1.136619, 0, 1, 0.7372549, 1,
-0.07374789, -1.368667, -3.72676, 0, 1, 0.7411765, 1,
-0.07073794, -0.8614303, -3.07922, 0, 1, 0.7490196, 1,
-0.06872653, 0.140923, -2.217931, 0, 1, 0.7529412, 1,
-0.06826297, -1.811177, -4.617926, 0, 1, 0.7607843, 1,
-0.06632601, -0.3632697, -2.570466, 0, 1, 0.7647059, 1,
-0.06589092, -0.09522335, -3.958322, 0, 1, 0.772549, 1,
-0.05947101, 1.322157, 0.6984988, 0, 1, 0.7764706, 1,
-0.05806183, 0.7210422, -0.8730301, 0, 1, 0.7843137, 1,
-0.05725284, -0.7491134, -1.610501, 0, 1, 0.7882353, 1,
-0.05467355, 0.4913003, 1.90191, 0, 1, 0.7960784, 1,
-0.05198, -0.8097184, -0.6598824, 0, 1, 0.8039216, 1,
-0.0519557, -0.3903688, -3.268579, 0, 1, 0.8078431, 1,
-0.04965467, -1.041953, -3.376504, 0, 1, 0.8156863, 1,
-0.04605604, 2.192961, 0.9246984, 0, 1, 0.8196079, 1,
-0.04482305, 1.530088, -0.9666455, 0, 1, 0.827451, 1,
-0.03956701, 0.358135, -0.9648319, 0, 1, 0.8313726, 1,
-0.03922813, -0.2911115, -2.047923, 0, 1, 0.8392157, 1,
-0.03903642, 0.9996793, -0.745891, 0, 1, 0.8431373, 1,
-0.03887552, -1.272471, -4.04193, 0, 1, 0.8509804, 1,
-0.03854435, -1.335216, -4.254312, 0, 1, 0.854902, 1,
-0.03572963, 0.3351908, 0.9491361, 0, 1, 0.8627451, 1,
-0.0354102, -1.204816, -2.401347, 0, 1, 0.8666667, 1,
-0.03085769, 0.709057, -0.126689, 0, 1, 0.8745098, 1,
-0.03039544, 0.7989408, 0.3776507, 0, 1, 0.8784314, 1,
-0.02661378, 0.9140697, 0.2334654, 0, 1, 0.8862745, 1,
-0.02542289, -2.311618, -3.677755, 0, 1, 0.8901961, 1,
-0.02499756, -0.3644095, -2.521116, 0, 1, 0.8980392, 1,
-0.02325887, -0.6885521, -2.698107, 0, 1, 0.9058824, 1,
-0.0207275, 2.506356, 0.7615819, 0, 1, 0.9098039, 1,
-0.02040919, -0.9892576, -5.192269, 0, 1, 0.9176471, 1,
-0.008017744, -0.329156, -1.443774, 0, 1, 0.9215686, 1,
-0.006582915, -0.6341778, -1.910578, 0, 1, 0.9294118, 1,
-0.006187566, -0.03353749, -2.519836, 0, 1, 0.9333333, 1,
-0.00541056, 0.6165397, -0.2009615, 0, 1, 0.9411765, 1,
-0.002065305, -0.328503, -1.340295, 0, 1, 0.945098, 1,
-0.001259232, -1.109262, -3.210812, 0, 1, 0.9529412, 1,
0.002034797, -0.3655684, 3.427351, 0, 1, 0.9568627, 1,
0.002916517, -0.1422965, 2.701465, 0, 1, 0.9647059, 1,
0.003014925, 0.5669668, 1.94481, 0, 1, 0.9686275, 1,
0.003027114, -0.0797959, 1.675119, 0, 1, 0.9764706, 1,
0.004861471, 0.6615479, 0.2958952, 0, 1, 0.9803922, 1,
0.005388066, 0.1469033, -0.1263279, 0, 1, 0.9882353, 1,
0.007480175, 0.7250851, 0.9388276, 0, 1, 0.9921569, 1,
0.009045048, -0.07942311, 3.07684, 0, 1, 1, 1,
0.009866836, 0.04511552, 0.01191736, 0, 0.9921569, 1, 1,
0.0163397, 0.5064965, 0.0982508, 0, 0.9882353, 1, 1,
0.01916857, 0.5090133, 1.208912, 0, 0.9803922, 1, 1,
0.01984106, -0.8638964, 1.861096, 0, 0.9764706, 1, 1,
0.02252598, -0.4223105, 2.481575, 0, 0.9686275, 1, 1,
0.02441837, 0.3277927, -0.2040557, 0, 0.9647059, 1, 1,
0.02739951, 1.053324, -0.8573557, 0, 0.9568627, 1, 1,
0.02834257, 0.4643833, 0.4189793, 0, 0.9529412, 1, 1,
0.0317759, -0.05255916, 4.375642, 0, 0.945098, 1, 1,
0.03202935, -1.467193, 2.738116, 0, 0.9411765, 1, 1,
0.0327049, 0.05774783, -0.3541451, 0, 0.9333333, 1, 1,
0.03454317, -0.8786893, 2.527657, 0, 0.9294118, 1, 1,
0.03630627, -0.09803895, 4.271315, 0, 0.9215686, 1, 1,
0.0363618, 0.777357, 0.9339588, 0, 0.9176471, 1, 1,
0.0388074, 0.2174387, -0.4781693, 0, 0.9098039, 1, 1,
0.03960457, 0.8695391, -1.978065, 0, 0.9058824, 1, 1,
0.04209013, 0.8865916, 0.6294185, 0, 0.8980392, 1, 1,
0.04506304, -1.442044, 2.669717, 0, 0.8901961, 1, 1,
0.0465204, 0.08155567, -0.4671956, 0, 0.8862745, 1, 1,
0.04690921, -0.1675292, 3.131822, 0, 0.8784314, 1, 1,
0.04733148, 0.4066449, 0.152717, 0, 0.8745098, 1, 1,
0.04767858, -0.440208, 2.676898, 0, 0.8666667, 1, 1,
0.05300445, -1.482551, 2.455433, 0, 0.8627451, 1, 1,
0.05540587, 0.1777705, 1.371694, 0, 0.854902, 1, 1,
0.05666019, 0.2333845, -1.296525, 0, 0.8509804, 1, 1,
0.05981761, 0.3204454, 1.090446, 0, 0.8431373, 1, 1,
0.06227812, 0.4673375, 1.402917, 0, 0.8392157, 1, 1,
0.0623095, 0.6011452, 0.0938568, 0, 0.8313726, 1, 1,
0.0667378, -0.7169276, 3.603592, 0, 0.827451, 1, 1,
0.06920151, -0.6578408, 1.435359, 0, 0.8196079, 1, 1,
0.08465136, 0.4520694, 0.1599123, 0, 0.8156863, 1, 1,
0.08692535, 0.9423268, -0.11511, 0, 0.8078431, 1, 1,
0.08976912, -1.146603, 3.146163, 0, 0.8039216, 1, 1,
0.09185147, 0.3558117, 0.09184026, 0, 0.7960784, 1, 1,
0.09309961, -1.00195, 2.146214, 0, 0.7882353, 1, 1,
0.09539469, -0.5169083, 1.565623, 0, 0.7843137, 1, 1,
0.09905494, -1.116725, 5.809541, 0, 0.7764706, 1, 1,
0.1005662, -0.3278837, 2.752711, 0, 0.772549, 1, 1,
0.1018307, -1.75225, 4.799973, 0, 0.7647059, 1, 1,
0.1053237, -0.3175082, 3.371548, 0, 0.7607843, 1, 1,
0.1055673, 0.07422799, 2.587961, 0, 0.7529412, 1, 1,
0.107932, 0.3144887, 0.9236335, 0, 0.7490196, 1, 1,
0.1096991, 0.08128233, -0.3675134, 0, 0.7411765, 1, 1,
0.1097915, -0.5141454, 0.8411348, 0, 0.7372549, 1, 1,
0.1115585, 1.130306, 0.5312419, 0, 0.7294118, 1, 1,
0.1133293, 0.7185881, 0.1128303, 0, 0.7254902, 1, 1,
0.1133789, 0.4780118, 1.622212, 0, 0.7176471, 1, 1,
0.1141428, -0.2778621, 2.159431, 0, 0.7137255, 1, 1,
0.1187813, 0.227857, 1.571061, 0, 0.7058824, 1, 1,
0.1196369, -0.2831741, 4.228006, 0, 0.6980392, 1, 1,
0.1202059, 0.1790397, 0.3369532, 0, 0.6941177, 1, 1,
0.1209998, -0.5338733, 3.09738, 0, 0.6862745, 1, 1,
0.1228417, 1.309923, -0.8044134, 0, 0.682353, 1, 1,
0.1237698, -0.6593412, 1.913973, 0, 0.6745098, 1, 1,
0.1250772, -0.2519127, 2.443793, 0, 0.6705883, 1, 1,
0.135665, 2.052419, -1.330482, 0, 0.6627451, 1, 1,
0.1385078, 0.4527815, 0.9800453, 0, 0.6588235, 1, 1,
0.1404193, -0.4749903, 1.8638, 0, 0.6509804, 1, 1,
0.1416604, 1.085227, 0.4199732, 0, 0.6470588, 1, 1,
0.1501681, 0.317502, 1.08924, 0, 0.6392157, 1, 1,
0.1505328, 0.2613566, 2.109774, 0, 0.6352941, 1, 1,
0.150598, -0.1015437, 3.062553, 0, 0.627451, 1, 1,
0.1566427, 0.7321015, 1.656897, 0, 0.6235294, 1, 1,
0.1569112, -1.772321, 3.202925, 0, 0.6156863, 1, 1,
0.1570073, -0.08361436, 2.808583, 0, 0.6117647, 1, 1,
0.1570123, -0.3816011, 3.60848, 0, 0.6039216, 1, 1,
0.1575085, -0.9953425, 1.73398, 0, 0.5960785, 1, 1,
0.1685954, -1.585105, 3.37543, 0, 0.5921569, 1, 1,
0.1692511, -0.5711264, 3.61526, 0, 0.5843138, 1, 1,
0.1703942, -1.084042, 2.687958, 0, 0.5803922, 1, 1,
0.1730088, 0.7659029, -0.9937695, 0, 0.572549, 1, 1,
0.177534, 0.480581, 2.139511, 0, 0.5686275, 1, 1,
0.1790079, -1.935151, 3.480068, 0, 0.5607843, 1, 1,
0.1855947, -0.8487522, 2.492879, 0, 0.5568628, 1, 1,
0.1861941, -1.022522, 4.056797, 0, 0.5490196, 1, 1,
0.1873652, -0.5809788, 2.604301, 0, 0.5450981, 1, 1,
0.187609, 1.851127, 0.4046373, 0, 0.5372549, 1, 1,
0.187641, -0.2700773, 1.650996, 0, 0.5333334, 1, 1,
0.1907132, 1.170805, 1.482231, 0, 0.5254902, 1, 1,
0.1936668, 0.706104, 0.1072722, 0, 0.5215687, 1, 1,
0.1942146, 0.8274727, -1.478845, 0, 0.5137255, 1, 1,
0.2047177, 0.2756339, -0.399415, 0, 0.509804, 1, 1,
0.2083376, 0.6231514, 0.7997363, 0, 0.5019608, 1, 1,
0.2085849, -2.184404, 3.413349, 0, 0.4941176, 1, 1,
0.2113367, -0.3055057, 2.920144, 0, 0.4901961, 1, 1,
0.2156566, 0.5421149, 2.027599, 0, 0.4823529, 1, 1,
0.2206665, 0.1554883, 1.727483, 0, 0.4784314, 1, 1,
0.2226914, -0.7516775, 2.124504, 0, 0.4705882, 1, 1,
0.2254568, -0.1002091, 2.218643, 0, 0.4666667, 1, 1,
0.2264835, -0.2858368, 1.751846, 0, 0.4588235, 1, 1,
0.2275072, -0.9002298, 1.719157, 0, 0.454902, 1, 1,
0.229297, -0.4826885, 4.15345, 0, 0.4470588, 1, 1,
0.2316418, 1.063518, 0.5427545, 0, 0.4431373, 1, 1,
0.2328638, -2.365856, 2.120739, 0, 0.4352941, 1, 1,
0.234946, 0.5975276, 1.193042, 0, 0.4313726, 1, 1,
0.2370037, -1.705957, 3.559882, 0, 0.4235294, 1, 1,
0.2393848, 1.46581, 1.094406, 0, 0.4196078, 1, 1,
0.2409913, -1.428612, 2.106724, 0, 0.4117647, 1, 1,
0.2544809, 0.6019117, 0.9223546, 0, 0.4078431, 1, 1,
0.2551739, -1.315466, 1.978233, 0, 0.4, 1, 1,
0.2634265, -1.932954, 4.19733, 0, 0.3921569, 1, 1,
0.2646153, 0.8966996, -0.965148, 0, 0.3882353, 1, 1,
0.2687398, 0.5105191, 1.22068, 0, 0.3803922, 1, 1,
0.2768609, 0.9297926, -1.548732, 0, 0.3764706, 1, 1,
0.2774522, -0.3171992, 1.308733, 0, 0.3686275, 1, 1,
0.2832143, 0.215561, 1.436804, 0, 0.3647059, 1, 1,
0.2835864, 0.7955027, -0.1284175, 0, 0.3568628, 1, 1,
0.2915154, 0.07222625, -0.3015696, 0, 0.3529412, 1, 1,
0.2948893, -0.3454123, 1.887139, 0, 0.345098, 1, 1,
0.3003599, -0.05625075, 3.750786, 0, 0.3411765, 1, 1,
0.3074397, 0.4191882, -0.6033292, 0, 0.3333333, 1, 1,
0.3104167, -0.9090896, 2.786317, 0, 0.3294118, 1, 1,
0.3121386, -0.1533743, 2.729338, 0, 0.3215686, 1, 1,
0.3121541, 0.6087282, -0.6901563, 0, 0.3176471, 1, 1,
0.3129642, 0.9257408, 0.4949124, 0, 0.3098039, 1, 1,
0.3137934, 1.972175, -1.304889, 0, 0.3058824, 1, 1,
0.313994, -0.1372576, 1.906054, 0, 0.2980392, 1, 1,
0.3149541, -0.3489216, 2.341978, 0, 0.2901961, 1, 1,
0.3166818, 1.566235, -0.8714159, 0, 0.2862745, 1, 1,
0.3175599, -0.007951219, 1.19999, 0, 0.2784314, 1, 1,
0.3180844, -0.4460698, 2.026531, 0, 0.2745098, 1, 1,
0.3184453, 0.3531038, 0.2766005, 0, 0.2666667, 1, 1,
0.318884, 0.04327645, 3.055324, 0, 0.2627451, 1, 1,
0.3206708, -0.1664742, 1.853942, 0, 0.254902, 1, 1,
0.3207631, 1.507797, -0.005858793, 0, 0.2509804, 1, 1,
0.3213049, -1.136978, 1.675968, 0, 0.2431373, 1, 1,
0.3251379, -0.6743513, 2.31477, 0, 0.2392157, 1, 1,
0.3267651, 0.1613995, 1.969473, 0, 0.2313726, 1, 1,
0.3306028, -0.8801271, 2.792417, 0, 0.227451, 1, 1,
0.3317958, -1.25382, 3.201072, 0, 0.2196078, 1, 1,
0.3339762, 1.013156, 1.345729, 0, 0.2156863, 1, 1,
0.3347981, -0.3100556, 0.7371397, 0, 0.2078431, 1, 1,
0.3366615, 0.4007224, 1.292263, 0, 0.2039216, 1, 1,
0.339817, -1.021809, 2.810465, 0, 0.1960784, 1, 1,
0.3413037, 0.700299, 1.161141, 0, 0.1882353, 1, 1,
0.341804, -0.7475321, 2.820811, 0, 0.1843137, 1, 1,
0.3420202, -0.665826, 3.94745, 0, 0.1764706, 1, 1,
0.3442584, 0.217315, 0.2792827, 0, 0.172549, 1, 1,
0.3467126, -0.2027202, 1.814933, 0, 0.1647059, 1, 1,
0.3486451, 2.601428, 0.7464393, 0, 0.1607843, 1, 1,
0.3486778, 0.001678219, 1.488316, 0, 0.1529412, 1, 1,
0.3495201, 0.4558641, 0.1007899, 0, 0.1490196, 1, 1,
0.3503997, -2.369588, 1.774019, 0, 0.1411765, 1, 1,
0.3565887, 0.09427974, 0.7547433, 0, 0.1372549, 1, 1,
0.3582734, 0.2238334, 0.3826131, 0, 0.1294118, 1, 1,
0.3599882, 0.7726792, 0.9826738, 0, 0.1254902, 1, 1,
0.360497, -2.094223, 1.741141, 0, 0.1176471, 1, 1,
0.3622315, 0.3346719, 0.2299745, 0, 0.1137255, 1, 1,
0.3636065, 0.7919043, 0.8065567, 0, 0.1058824, 1, 1,
0.3643677, -0.2997857, 1.518763, 0, 0.09803922, 1, 1,
0.3670069, -1.018162, 3.13518, 0, 0.09411765, 1, 1,
0.3736422, 0.3780347, 1.198032, 0, 0.08627451, 1, 1,
0.3744805, 0.3173767, -0.5793024, 0, 0.08235294, 1, 1,
0.3747204, 0.4502156, 0.7945047, 0, 0.07450981, 1, 1,
0.3754784, -0.8917927, 1.423151, 0, 0.07058824, 1, 1,
0.3764023, -1.306638, 4.60167, 0, 0.0627451, 1, 1,
0.3785892, 0.4439868, 1.09495, 0, 0.05882353, 1, 1,
0.3791158, -2.187982, 3.643158, 0, 0.05098039, 1, 1,
0.3805471, 1.492169, 0.802321, 0, 0.04705882, 1, 1,
0.3807395, 0.4957018, 1.407731, 0, 0.03921569, 1, 1,
0.3829846, 1.487906, 0.0112523, 0, 0.03529412, 1, 1,
0.384848, -0.8072866, 3.143815, 0, 0.02745098, 1, 1,
0.388502, -1.225525, 3.963085, 0, 0.02352941, 1, 1,
0.3943807, -0.663804, 2.616807, 0, 0.01568628, 1, 1,
0.3992819, -0.1595637, 0.885198, 0, 0.01176471, 1, 1,
0.4029243, -1.51622, 2.288895, 0, 0.003921569, 1, 1,
0.4106714, 0.1892586, 1.117753, 0.003921569, 0, 1, 1,
0.4116091, 2.177536, 0.5638565, 0.007843138, 0, 1, 1,
0.4170202, 0.1359925, 1.250583, 0.01568628, 0, 1, 1,
0.4173759, -0.5461076, 3.85222, 0.01960784, 0, 1, 1,
0.4183325, 1.270823, 0.4305405, 0.02745098, 0, 1, 1,
0.4215685, -0.5271751, 3.170355, 0.03137255, 0, 1, 1,
0.4255261, -0.1423257, 1.148024, 0.03921569, 0, 1, 1,
0.4306383, 1.353226, -0.7820958, 0.04313726, 0, 1, 1,
0.4329347, -1.487852, 3.414729, 0.05098039, 0, 1, 1,
0.434076, 1.090951, 0.7036887, 0.05490196, 0, 1, 1,
0.4380542, 0.2870622, 2.581695, 0.0627451, 0, 1, 1,
0.4398237, -2.14423, 2.774188, 0.06666667, 0, 1, 1,
0.4430038, 0.351377, -0.3762275, 0.07450981, 0, 1, 1,
0.446124, 1.695318, 0.6972289, 0.07843138, 0, 1, 1,
0.4513859, -1.320722, 3.964746, 0.08627451, 0, 1, 1,
0.4530403, 0.02483093, 1.195031, 0.09019608, 0, 1, 1,
0.4571013, -0.6618889, 1.094375, 0.09803922, 0, 1, 1,
0.4572703, 0.3725685, 1.690646, 0.1058824, 0, 1, 1,
0.4581285, -1.053896, 2.04583, 0.1098039, 0, 1, 1,
0.460485, 0.6031597, 0.1745264, 0.1176471, 0, 1, 1,
0.4634751, -0.5537775, 1.684714, 0.1215686, 0, 1, 1,
0.4647541, 0.05776861, 1.038977, 0.1294118, 0, 1, 1,
0.4651432, -0.7127813, 1.791644, 0.1333333, 0, 1, 1,
0.4653935, 0.277582, 1.061766, 0.1411765, 0, 1, 1,
0.4666828, 0.8290449, 0.5648018, 0.145098, 0, 1, 1,
0.4697796, 0.2661732, 2.725733, 0.1529412, 0, 1, 1,
0.4737603, -0.1513404, 2.18958, 0.1568628, 0, 1, 1,
0.474112, -0.3480209, 3.296444, 0.1647059, 0, 1, 1,
0.4805135, 0.3215826, 1.590752, 0.1686275, 0, 1, 1,
0.4806192, -1.127241, 1.150334, 0.1764706, 0, 1, 1,
0.4873307, -1.329203, 2.228652, 0.1803922, 0, 1, 1,
0.488665, 0.6627086, 2.282161, 0.1882353, 0, 1, 1,
0.4906535, -0.1102088, 2.566044, 0.1921569, 0, 1, 1,
0.4971468, 0.7648619, -0.9883432, 0.2, 0, 1, 1,
0.497346, -0.1240802, -0.1982927, 0.2078431, 0, 1, 1,
0.4988057, 0.4928189, 2.148007, 0.2117647, 0, 1, 1,
0.5024868, 0.03082761, 1.437631, 0.2196078, 0, 1, 1,
0.5025561, 1.238024, 0.2449436, 0.2235294, 0, 1, 1,
0.5043185, -0.7739758, 1.778652, 0.2313726, 0, 1, 1,
0.5080655, -1.174942, 3.819613, 0.2352941, 0, 1, 1,
0.5091902, 0.1077912, 1.817311, 0.2431373, 0, 1, 1,
0.5112805, -0.6955108, 3.034888, 0.2470588, 0, 1, 1,
0.5149359, -0.7241547, 3.120035, 0.254902, 0, 1, 1,
0.517892, -0.9975373, 2.195701, 0.2588235, 0, 1, 1,
0.5208557, 0.9573122, 0.2845949, 0.2666667, 0, 1, 1,
0.5263988, 0.1540518, 1.490115, 0.2705882, 0, 1, 1,
0.527931, -1.164548, 1.674079, 0.2784314, 0, 1, 1,
0.5323572, 0.2007909, 1.377526, 0.282353, 0, 1, 1,
0.5337349, 0.07382581, 1.941375, 0.2901961, 0, 1, 1,
0.5475364, 0.7247478, -0.01325212, 0.2941177, 0, 1, 1,
0.5482161, 2.112074, -0.806159, 0.3019608, 0, 1, 1,
0.5509409, -1.700643, 2.427367, 0.3098039, 0, 1, 1,
0.5535353, 0.7074031, 1.018473, 0.3137255, 0, 1, 1,
0.5797307, -0.1768495, 1.926298, 0.3215686, 0, 1, 1,
0.583666, 0.3252167, 1.332874, 0.3254902, 0, 1, 1,
0.5881379, 0.504899, 0.4699746, 0.3333333, 0, 1, 1,
0.5921303, 0.2284807, 0.5523683, 0.3372549, 0, 1, 1,
0.5933583, -0.3751466, 0.9212492, 0.345098, 0, 1, 1,
0.5951455, -0.6590022, 3.078658, 0.3490196, 0, 1, 1,
0.5964571, 1.088568, -0.2075216, 0.3568628, 0, 1, 1,
0.5984846, 0.0111419, -0.06902844, 0.3607843, 0, 1, 1,
0.5997111, -0.02635696, 0.01491773, 0.3686275, 0, 1, 1,
0.6028103, 0.7397085, 2.08053, 0.372549, 0, 1, 1,
0.6030653, 1.316553, 0.8624958, 0.3803922, 0, 1, 1,
0.6032414, -0.8685323, 0.9736795, 0.3843137, 0, 1, 1,
0.6091845, -0.08641312, 1.939701, 0.3921569, 0, 1, 1,
0.612381, -0.05722839, 0.8927801, 0.3960784, 0, 1, 1,
0.6125023, -3.448982, 4.438846, 0.4039216, 0, 1, 1,
0.6152295, 2.119098, 0.2917512, 0.4117647, 0, 1, 1,
0.619315, -0.7129574, 3.629017, 0.4156863, 0, 1, 1,
0.6205139, 0.6759352, 0.1578252, 0.4235294, 0, 1, 1,
0.6231462, -1.433145, 1.019765, 0.427451, 0, 1, 1,
0.6274619, 0.3287773, 0.7777129, 0.4352941, 0, 1, 1,
0.631996, 0.9723045, 0.8462198, 0.4392157, 0, 1, 1,
0.6346064, -0.4559963, -0.3381257, 0.4470588, 0, 1, 1,
0.6381139, 0.4435134, -0.6342072, 0.4509804, 0, 1, 1,
0.6389096, 1.227491, 0.9462124, 0.4588235, 0, 1, 1,
0.6412038, 0.8225052, -0.1223301, 0.4627451, 0, 1, 1,
0.6441497, 0.53335, 1.239969, 0.4705882, 0, 1, 1,
0.645448, -0.4763204, 1.266292, 0.4745098, 0, 1, 1,
0.6600414, 0.6196666, 1.37984, 0.4823529, 0, 1, 1,
0.6621284, 1.505402, 0.5118584, 0.4862745, 0, 1, 1,
0.665594, 1.036464, 1.26182, 0.4941176, 0, 1, 1,
0.6668057, -0.5505211, 1.72851, 0.5019608, 0, 1, 1,
0.6705999, 1.48413, 1.235727, 0.5058824, 0, 1, 1,
0.6708142, 0.401819, 1.416499, 0.5137255, 0, 1, 1,
0.6809816, -0.4541025, 2.028569, 0.5176471, 0, 1, 1,
0.6858267, 0.3641195, 0.8621759, 0.5254902, 0, 1, 1,
0.6864871, -0.5886815, 2.162103, 0.5294118, 0, 1, 1,
0.6870586, -0.1399533, 1.353909, 0.5372549, 0, 1, 1,
0.6870916, -0.3039654, 2.006772, 0.5411765, 0, 1, 1,
0.690026, 0.3059005, 1.648165, 0.5490196, 0, 1, 1,
0.6910885, -1.346353, 3.620857, 0.5529412, 0, 1, 1,
0.7013445, 0.4561169, -0.3718922, 0.5607843, 0, 1, 1,
0.7041451, 1.456667, -0.3770936, 0.5647059, 0, 1, 1,
0.7046576, 1.576883, -0.8801409, 0.572549, 0, 1, 1,
0.7076083, 0.168969, 0.7868681, 0.5764706, 0, 1, 1,
0.7139919, -0.4290287, 1.394644, 0.5843138, 0, 1, 1,
0.7156815, -1.123111, 1.377028, 0.5882353, 0, 1, 1,
0.7157527, -1.24926, 2.350818, 0.5960785, 0, 1, 1,
0.7178429, -1.716783, 2.640237, 0.6039216, 0, 1, 1,
0.7194107, -2.088209, 3.276168, 0.6078432, 0, 1, 1,
0.7230172, -0.01068741, 2.288284, 0.6156863, 0, 1, 1,
0.7236738, 0.7841411, 1.135835, 0.6196079, 0, 1, 1,
0.7264279, -0.2442517, 2.395006, 0.627451, 0, 1, 1,
0.7301323, -1.457607, 3.522107, 0.6313726, 0, 1, 1,
0.7347805, 0.3264567, 1.945768, 0.6392157, 0, 1, 1,
0.7373261, -1.66408, 3.327188, 0.6431373, 0, 1, 1,
0.7425236, -0.6532944, 0.8606008, 0.6509804, 0, 1, 1,
0.7457667, -0.947553, 3.581433, 0.654902, 0, 1, 1,
0.7486842, 0.6777231, 1.58924, 0.6627451, 0, 1, 1,
0.753727, 0.8653553, 1.279997, 0.6666667, 0, 1, 1,
0.7559338, 0.9289541, 1.326064, 0.6745098, 0, 1, 1,
0.764249, 0.8557534, 1.10229, 0.6784314, 0, 1, 1,
0.769121, 2.132861, 0.7959495, 0.6862745, 0, 1, 1,
0.7698016, -0.5452589, 3.294067, 0.6901961, 0, 1, 1,
0.7724265, 0.3277838, 0.4270595, 0.6980392, 0, 1, 1,
0.7728936, 0.04344575, 1.664347, 0.7058824, 0, 1, 1,
0.7742021, -0.3792548, 2.439842, 0.7098039, 0, 1, 1,
0.7747166, -0.03788208, 2.407873, 0.7176471, 0, 1, 1,
0.7786308, 0.4786929, 2.160498, 0.7215686, 0, 1, 1,
0.7827875, -0.4114163, 1.599467, 0.7294118, 0, 1, 1,
0.7832921, -0.9153472, 2.125271, 0.7333333, 0, 1, 1,
0.7844797, -0.2885347, 1.70059, 0.7411765, 0, 1, 1,
0.7862347, -1.066387, 2.625626, 0.7450981, 0, 1, 1,
0.793081, 0.4576644, -0.3409879, 0.7529412, 0, 1, 1,
0.7945294, 0.7019153, -0.01017073, 0.7568628, 0, 1, 1,
0.7981982, -0.166929, 2.18071, 0.7647059, 0, 1, 1,
0.799441, -2.348873, 2.97746, 0.7686275, 0, 1, 1,
0.8018422, -1.290033, 2.827311, 0.7764706, 0, 1, 1,
0.8108877, -1.075987, 4.961705, 0.7803922, 0, 1, 1,
0.8128085, 0.9172721, 1.625313, 0.7882353, 0, 1, 1,
0.8135468, -0.6980506, 2.000536, 0.7921569, 0, 1, 1,
0.8187659, 0.1035879, 0.6010733, 0.8, 0, 1, 1,
0.8212242, 1.526291, 0.6659626, 0.8078431, 0, 1, 1,
0.824544, -0.4163951, 2.476604, 0.8117647, 0, 1, 1,
0.8318769, -0.4112599, 2.332234, 0.8196079, 0, 1, 1,
0.8406719, 0.0974052, 0.9229416, 0.8235294, 0, 1, 1,
0.8450667, -2.225259, 0.8681702, 0.8313726, 0, 1, 1,
0.8465921, -1.64667, 2.722861, 0.8352941, 0, 1, 1,
0.8476301, 0.5877517, 0.2528219, 0.8431373, 0, 1, 1,
0.8500344, 0.2161979, 0.6594661, 0.8470588, 0, 1, 1,
0.8512037, -0.3047414, 2.633889, 0.854902, 0, 1, 1,
0.8567766, -0.9496303, 3.538774, 0.8588235, 0, 1, 1,
0.8595722, -0.8817954, 2.245143, 0.8666667, 0, 1, 1,
0.8609506, -0.08712336, 1.529713, 0.8705882, 0, 1, 1,
0.8646399, -0.4260422, -0.6456456, 0.8784314, 0, 1, 1,
0.8663068, 0.1873355, 2.887862, 0.8823529, 0, 1, 1,
0.880334, -1.73045, 1.92266, 0.8901961, 0, 1, 1,
0.8881043, -0.7546785, 3.480725, 0.8941177, 0, 1, 1,
0.8891958, -0.4939407, 1.548128, 0.9019608, 0, 1, 1,
0.8907955, -0.4966547, 3.303493, 0.9098039, 0, 1, 1,
0.8915241, -0.1931624, 0.9251553, 0.9137255, 0, 1, 1,
0.9070299, 0.4460868, 0.7662271, 0.9215686, 0, 1, 1,
0.9120584, 1.342981, 0.3926399, 0.9254902, 0, 1, 1,
0.9145192, 0.5080679, 0.575564, 0.9333333, 0, 1, 1,
0.9190191, -2.104095, 3.804707, 0.9372549, 0, 1, 1,
0.9216347, 0.0810915, 2.365956, 0.945098, 0, 1, 1,
0.9255903, -1.413417, 1.592815, 0.9490196, 0, 1, 1,
0.9271905, -0.2628713, 2.990029, 0.9568627, 0, 1, 1,
0.9306809, -1.725019, 1.368454, 0.9607843, 0, 1, 1,
0.9334378, -0.05842999, 1.46975, 0.9686275, 0, 1, 1,
0.935472, -0.8385597, 1.956643, 0.972549, 0, 1, 1,
0.9461066, 1.724978, 1.224743, 0.9803922, 0, 1, 1,
0.9476848, 0.2929004, 2.191656, 0.9843137, 0, 1, 1,
0.9537013, -1.068166, 0.3877098, 0.9921569, 0, 1, 1,
0.9540197, 0.2763248, 2.42858, 0.9960784, 0, 1, 1,
0.9589284, -2.787426, 1.055687, 1, 0, 0.9960784, 1,
0.9604167, -1.430408, 2.885138, 1, 0, 0.9882353, 1,
0.9635153, -0.6074592, 4.536316, 1, 0, 0.9843137, 1,
0.9709334, -0.1961789, 1.570758, 1, 0, 0.9764706, 1,
0.9763572, 2.224794, 0.9528686, 1, 0, 0.972549, 1,
0.9799489, 1.199811, 1.126477, 1, 0, 0.9647059, 1,
0.9824868, -0.633274, 0.9706965, 1, 0, 0.9607843, 1,
0.9838644, 0.1573992, -0.04563807, 1, 0, 0.9529412, 1,
0.9875042, -1.336091, 2.620899, 1, 0, 0.9490196, 1,
0.992336, -1.979993, 1.780851, 1, 0, 0.9411765, 1,
0.9939397, -0.2650144, 1.487219, 1, 0, 0.9372549, 1,
0.994105, -0.04751321, 1.316211, 1, 0, 0.9294118, 1,
0.9960661, 1.002555, 2.675287, 1, 0, 0.9254902, 1,
0.9969829, -1.193373, 2.070908, 1, 0, 0.9176471, 1,
1.007561, 0.9606718, 0.7478731, 1, 0, 0.9137255, 1,
1.008656, -0.1103667, 3.355041, 1, 0, 0.9058824, 1,
1.009058, 0.6405097, 0.4539484, 1, 0, 0.9019608, 1,
1.009323, -0.816882, 1.516595, 1, 0, 0.8941177, 1,
1.021322, -0.5434222, 2.25959, 1, 0, 0.8862745, 1,
1.021549, 0.132422, 0.1687483, 1, 0, 0.8823529, 1,
1.034523, -0.08255299, 1.812156, 1, 0, 0.8745098, 1,
1.034947, 3.012463, -0.1779151, 1, 0, 0.8705882, 1,
1.040536, -1.205671, 2.334777, 1, 0, 0.8627451, 1,
1.042809, 0.7292153, 0.8557255, 1, 0, 0.8588235, 1,
1.045442, 0.006568822, 1.774263, 1, 0, 0.8509804, 1,
1.049485, 1.347152, 0.4469775, 1, 0, 0.8470588, 1,
1.049564, 2.115729, 1.570781, 1, 0, 0.8392157, 1,
1.053329, -1.140666, 2.60477, 1, 0, 0.8352941, 1,
1.054528, -0.7319075, 2.28083, 1, 0, 0.827451, 1,
1.057078, -0.07256256, 2.39961, 1, 0, 0.8235294, 1,
1.07696, -1.602883, 3.594802, 1, 0, 0.8156863, 1,
1.077052, 1.027443, -0.3445385, 1, 0, 0.8117647, 1,
1.082859, -1.285522, 1.554846, 1, 0, 0.8039216, 1,
1.084429, 0.123625, 2.30705, 1, 0, 0.7960784, 1,
1.085288, 0.8405754, 0.8445058, 1, 0, 0.7921569, 1,
1.089653, -1.136647, 4.112602, 1, 0, 0.7843137, 1,
1.095628, -1.122362, 2.596086, 1, 0, 0.7803922, 1,
1.099719, -0.4695035, 1.209684, 1, 0, 0.772549, 1,
1.103839, 1.048936, 0.9105769, 1, 0, 0.7686275, 1,
1.104169, -2.36482, 3.042268, 1, 0, 0.7607843, 1,
1.104622, 0.5276933, 1.466498, 1, 0, 0.7568628, 1,
1.120736, -1.901808, 1.473246, 1, 0, 0.7490196, 1,
1.136926, -0.4491382, 1.031199, 1, 0, 0.7450981, 1,
1.147273, 0.6471552, 0.7212445, 1, 0, 0.7372549, 1,
1.147917, 0.7834762, -0.7936026, 1, 0, 0.7333333, 1,
1.156649, 0.9739803, 0.2235922, 1, 0, 0.7254902, 1,
1.165971, -0.07585145, 0.9029728, 1, 0, 0.7215686, 1,
1.166818, -0.24962, 1.595243, 1, 0, 0.7137255, 1,
1.170159, 0.3797568, 2.157102, 1, 0, 0.7098039, 1,
1.176934, 2.634792, -0.7731601, 1, 0, 0.7019608, 1,
1.178587, 0.4736263, -0.2277298, 1, 0, 0.6941177, 1,
1.184495, -1.328685, 2.697387, 1, 0, 0.6901961, 1,
1.189608, 0.5662293, 1.272527, 1, 0, 0.682353, 1,
1.193846, 1.209134, 2.01109, 1, 0, 0.6784314, 1,
1.196463, 1.700615, 1.067742, 1, 0, 0.6705883, 1,
1.196504, 1.247803, 0.350128, 1, 0, 0.6666667, 1,
1.197711, 0.02486867, 0.4501673, 1, 0, 0.6588235, 1,
1.201771, -0.3479461, 0.298988, 1, 0, 0.654902, 1,
1.209989, 0.3880082, -0.2191429, 1, 0, 0.6470588, 1,
1.21334, 1.171897, -0.7737992, 1, 0, 0.6431373, 1,
1.219906, -0.8956963, 1.664553, 1, 0, 0.6352941, 1,
1.230724, -0.6303641, 3.388827, 1, 0, 0.6313726, 1,
1.235012, 0.4656727, 0.8244141, 1, 0, 0.6235294, 1,
1.241787, -0.5400383, 3.047925, 1, 0, 0.6196079, 1,
1.244627, 0.1916532, 2.676939, 1, 0, 0.6117647, 1,
1.250048, 1.178855, 1.90236, 1, 0, 0.6078432, 1,
1.250741, -0.7771518, 1.789037, 1, 0, 0.6, 1,
1.267815, -1.068341, 3.17673, 1, 0, 0.5921569, 1,
1.285978, -0.006762858, 2.178811, 1, 0, 0.5882353, 1,
1.288296, 0.5182074, 0.7011335, 1, 0, 0.5803922, 1,
1.302118, 0.3652996, 0.4466328, 1, 0, 0.5764706, 1,
1.31024, -1.316913, 1.823349, 1, 0, 0.5686275, 1,
1.311121, 0.3232802, 1.257086, 1, 0, 0.5647059, 1,
1.311947, -0.3709619, 1.625757, 1, 0, 0.5568628, 1,
1.312267, -0.6589449, 3.562169, 1, 0, 0.5529412, 1,
1.327025, 0.7059869, 1.174073, 1, 0, 0.5450981, 1,
1.354114, -0.2272812, 2.841659, 1, 0, 0.5411765, 1,
1.366533, 0.1655984, 3.422344, 1, 0, 0.5333334, 1,
1.374597, -1.746351, 2.159765, 1, 0, 0.5294118, 1,
1.377076, 0.07910206, 1.672257, 1, 0, 0.5215687, 1,
1.380415, 0.09776783, 0.1916665, 1, 0, 0.5176471, 1,
1.383457, -1.323299, 3.10177, 1, 0, 0.509804, 1,
1.38681, 1.227496, 1.29773, 1, 0, 0.5058824, 1,
1.389041, 0.04176113, 1.623214, 1, 0, 0.4980392, 1,
1.389405, -0.4471705, 4.38946, 1, 0, 0.4901961, 1,
1.393089, 1.785576, 2.660516, 1, 0, 0.4862745, 1,
1.395839, 0.7701063, 2.054793, 1, 0, 0.4784314, 1,
1.397078, -0.201042, -0.7306454, 1, 0, 0.4745098, 1,
1.400289, -0.7584764, 3.338722, 1, 0, 0.4666667, 1,
1.402541, -0.3973204, 2.481153, 1, 0, 0.4627451, 1,
1.405024, -0.9565889, 3.116424, 1, 0, 0.454902, 1,
1.40757, 0.5106939, 2.062238, 1, 0, 0.4509804, 1,
1.409255, 0.7038819, 1.458924, 1, 0, 0.4431373, 1,
1.411642, -0.8913811, 2.393905, 1, 0, 0.4392157, 1,
1.41787, -0.4679188, 1.594225, 1, 0, 0.4313726, 1,
1.419322, 0.6325049, 1.158893, 1, 0, 0.427451, 1,
1.44629, -0.2607912, 1.896239, 1, 0, 0.4196078, 1,
1.447206, 0.4357165, 1.190044, 1, 0, 0.4156863, 1,
1.449459, 0.5908223, 0.4530997, 1, 0, 0.4078431, 1,
1.453955, 1.219818, 1.064749, 1, 0, 0.4039216, 1,
1.455038, 0.5060859, 2.15555, 1, 0, 0.3960784, 1,
1.472364, 0.9681239, 0.01142048, 1, 0, 0.3882353, 1,
1.51256, -1.23885, 2.345284, 1, 0, 0.3843137, 1,
1.514135, -1.890746, 1.399404, 1, 0, 0.3764706, 1,
1.518341, -0.2738771, 2.434286, 1, 0, 0.372549, 1,
1.519446, -0.1947639, 1.579702, 1, 0, 0.3647059, 1,
1.523772, -0.7135073, 0.8228453, 1, 0, 0.3607843, 1,
1.533442, 0.5464034, 2.15473, 1, 0, 0.3529412, 1,
1.535924, -0.1840622, 1.944828, 1, 0, 0.3490196, 1,
1.550685, 0.3144096, 1.129479, 1, 0, 0.3411765, 1,
1.556337, 0.5022414, 1.487129, 1, 0, 0.3372549, 1,
1.557207, 0.5792689, 1.757943, 1, 0, 0.3294118, 1,
1.570379, 1.006992, 1.006081, 1, 0, 0.3254902, 1,
1.570963, 0.2205904, 1.24619, 1, 0, 0.3176471, 1,
1.585176, -0.2712688, 1.631052, 1, 0, 0.3137255, 1,
1.592584, -0.9023322, 2.042025, 1, 0, 0.3058824, 1,
1.600198, -0.3899965, -1.163152, 1, 0, 0.2980392, 1,
1.60397, -0.1647601, 1.285717, 1, 0, 0.2941177, 1,
1.608278, 0.0302179, 0.5910732, 1, 0, 0.2862745, 1,
1.61121, -0.9380934, 2.050623, 1, 0, 0.282353, 1,
1.627649, 0.6009223, 1.777261, 1, 0, 0.2745098, 1,
1.630763, 0.7271768, 1.384025, 1, 0, 0.2705882, 1,
1.661378, 0.7301253, -0.6413671, 1, 0, 0.2627451, 1,
1.672491, -0.3329264, 3.268359, 1, 0, 0.2588235, 1,
1.672829, 0.7255581, 1.776418, 1, 0, 0.2509804, 1,
1.676452, 1.677033, 1.978528, 1, 0, 0.2470588, 1,
1.688441, 0.355146, 1.092056, 1, 0, 0.2392157, 1,
1.691466, 0.104535, 2.058933, 1, 0, 0.2352941, 1,
1.696329, -1.838098, 4.51526, 1, 0, 0.227451, 1,
1.704247, 1.287597, -1.517008, 1, 0, 0.2235294, 1,
1.705527, 2.231523, 0.2373316, 1, 0, 0.2156863, 1,
1.706944, 1.263159, 0.3323769, 1, 0, 0.2117647, 1,
1.714678, -0.05620903, 1.64782, 1, 0, 0.2039216, 1,
1.719013, 0.74475, 0.4759882, 1, 0, 0.1960784, 1,
1.7277, -1.238646, 3.040698, 1, 0, 0.1921569, 1,
1.729508, -0.33114, 2.364902, 1, 0, 0.1843137, 1,
1.751208, -0.1010742, 2.238552, 1, 0, 0.1803922, 1,
1.767397, -0.345503, 1.512709, 1, 0, 0.172549, 1,
1.806894, -1.087593, 2.345482, 1, 0, 0.1686275, 1,
1.820875, 0.9218053, 1.313666, 1, 0, 0.1607843, 1,
1.84468, -0.1957854, 0.1558699, 1, 0, 0.1568628, 1,
1.854217, -1.132079, 2.605161, 1, 0, 0.1490196, 1,
1.857785, 0.8329444, 2.567424, 1, 0, 0.145098, 1,
1.865104, 0.3799488, 1.50761, 1, 0, 0.1372549, 1,
1.877308, 0.01737902, 0.8846408, 1, 0, 0.1333333, 1,
1.879477, 0.3832514, 3.543094, 1, 0, 0.1254902, 1,
1.880324, -0.803054, 1.984221, 1, 0, 0.1215686, 1,
1.912644, -1.469247, 3.564059, 1, 0, 0.1137255, 1,
1.914591, -2.115274, 2.13868, 1, 0, 0.1098039, 1,
1.925004, -0.8982525, 3.215902, 1, 0, 0.1019608, 1,
1.956057, -2.533628, 1.402252, 1, 0, 0.09411765, 1,
1.97529, 1.348472, 1.403914, 1, 0, 0.09019608, 1,
1.981262, 0.1068388, 0.538565, 1, 0, 0.08235294, 1,
1.990882, -0.1259306, 0.6423479, 1, 0, 0.07843138, 1,
2.064908, -1.763721, 2.776448, 1, 0, 0.07058824, 1,
2.082755, 0.5733854, -0.706179, 1, 0, 0.06666667, 1,
2.111852, 0.9506473, 1.664812, 1, 0, 0.05882353, 1,
2.11937, -0.5676054, 1.680699, 1, 0, 0.05490196, 1,
2.121565, -0.1913384, 1.416466, 1, 0, 0.04705882, 1,
2.229063, -1.361012, 2.873837, 1, 0, 0.04313726, 1,
2.372021, -0.5972787, 1.617931, 1, 0, 0.03529412, 1,
2.433874, 1.07134, 2.095575, 1, 0, 0.03137255, 1,
2.514107, 0.8406954, 0.1100043, 1, 0, 0.02352941, 1,
2.521137, 0.003465253, 1.354307, 1, 0, 0.01960784, 1,
2.724816, -0.5188303, 3.326182, 1, 0, 0.01176471, 1,
2.900217, -0.5536272, 2.541453, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.213527, -4.590982, -7.057076, 0, -0.5, 0.5, 0.5,
-0.213527, -4.590982, -7.057076, 1, -0.5, 0.5, 0.5,
-0.213527, -4.590982, -7.057076, 1, 1.5, 0.5, 0.5,
-0.213527, -4.590982, -7.057076, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.38283, -0.08024669, -7.057076, 0, -0.5, 0.5, 0.5,
-4.38283, -0.08024669, -7.057076, 1, -0.5, 0.5, 0.5,
-4.38283, -0.08024669, -7.057076, 1, 1.5, 0.5, 0.5,
-4.38283, -0.08024669, -7.057076, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.38283, -4.590982, 0.3086357, 0, -0.5, 0.5, 0.5,
-4.38283, -4.590982, 0.3086357, 1, -0.5, 0.5, 0.5,
-4.38283, -4.590982, 0.3086357, 1, 1.5, 0.5, 0.5,
-4.38283, -4.590982, 0.3086357, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.550044, -5.357296,
2, -3.550044, -5.357296,
-3, -3.550044, -5.357296,
-3, -3.723533, -5.640593,
-2, -3.550044, -5.357296,
-2, -3.723533, -5.640593,
-1, -3.550044, -5.357296,
-1, -3.723533, -5.640593,
0, -3.550044, -5.357296,
0, -3.723533, -5.640593,
1, -3.550044, -5.357296,
1, -3.723533, -5.640593,
2, -3.550044, -5.357296,
2, -3.723533, -5.640593
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.070513, -6.207186, 0, -0.5, 0.5, 0.5,
-3, -4.070513, -6.207186, 1, -0.5, 0.5, 0.5,
-3, -4.070513, -6.207186, 1, 1.5, 0.5, 0.5,
-3, -4.070513, -6.207186, 0, 1.5, 0.5, 0.5,
-2, -4.070513, -6.207186, 0, -0.5, 0.5, 0.5,
-2, -4.070513, -6.207186, 1, -0.5, 0.5, 0.5,
-2, -4.070513, -6.207186, 1, 1.5, 0.5, 0.5,
-2, -4.070513, -6.207186, 0, 1.5, 0.5, 0.5,
-1, -4.070513, -6.207186, 0, -0.5, 0.5, 0.5,
-1, -4.070513, -6.207186, 1, -0.5, 0.5, 0.5,
-1, -4.070513, -6.207186, 1, 1.5, 0.5, 0.5,
-1, -4.070513, -6.207186, 0, 1.5, 0.5, 0.5,
0, -4.070513, -6.207186, 0, -0.5, 0.5, 0.5,
0, -4.070513, -6.207186, 1, -0.5, 0.5, 0.5,
0, -4.070513, -6.207186, 1, 1.5, 0.5, 0.5,
0, -4.070513, -6.207186, 0, 1.5, 0.5, 0.5,
1, -4.070513, -6.207186, 0, -0.5, 0.5, 0.5,
1, -4.070513, -6.207186, 1, -0.5, 0.5, 0.5,
1, -4.070513, -6.207186, 1, 1.5, 0.5, 0.5,
1, -4.070513, -6.207186, 0, 1.5, 0.5, 0.5,
2, -4.070513, -6.207186, 0, -0.5, 0.5, 0.5,
2, -4.070513, -6.207186, 1, -0.5, 0.5, 0.5,
2, -4.070513, -6.207186, 1, 1.5, 0.5, 0.5,
2, -4.070513, -6.207186, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.420683, -3, -5.357296,
-3.420683, 3, -5.357296,
-3.420683, -3, -5.357296,
-3.581041, -3, -5.640593,
-3.420683, -2, -5.357296,
-3.581041, -2, -5.640593,
-3.420683, -1, -5.357296,
-3.581041, -1, -5.640593,
-3.420683, 0, -5.357296,
-3.581041, 0, -5.640593,
-3.420683, 1, -5.357296,
-3.581041, 1, -5.640593,
-3.420683, 2, -5.357296,
-3.581041, 2, -5.640593,
-3.420683, 3, -5.357296,
-3.581041, 3, -5.640593
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.901757, -3, -6.207186, 0, -0.5, 0.5, 0.5,
-3.901757, -3, -6.207186, 1, -0.5, 0.5, 0.5,
-3.901757, -3, -6.207186, 1, 1.5, 0.5, 0.5,
-3.901757, -3, -6.207186, 0, 1.5, 0.5, 0.5,
-3.901757, -2, -6.207186, 0, -0.5, 0.5, 0.5,
-3.901757, -2, -6.207186, 1, -0.5, 0.5, 0.5,
-3.901757, -2, -6.207186, 1, 1.5, 0.5, 0.5,
-3.901757, -2, -6.207186, 0, 1.5, 0.5, 0.5,
-3.901757, -1, -6.207186, 0, -0.5, 0.5, 0.5,
-3.901757, -1, -6.207186, 1, -0.5, 0.5, 0.5,
-3.901757, -1, -6.207186, 1, 1.5, 0.5, 0.5,
-3.901757, -1, -6.207186, 0, 1.5, 0.5, 0.5,
-3.901757, 0, -6.207186, 0, -0.5, 0.5, 0.5,
-3.901757, 0, -6.207186, 1, -0.5, 0.5, 0.5,
-3.901757, 0, -6.207186, 1, 1.5, 0.5, 0.5,
-3.901757, 0, -6.207186, 0, 1.5, 0.5, 0.5,
-3.901757, 1, -6.207186, 0, -0.5, 0.5, 0.5,
-3.901757, 1, -6.207186, 1, -0.5, 0.5, 0.5,
-3.901757, 1, -6.207186, 1, 1.5, 0.5, 0.5,
-3.901757, 1, -6.207186, 0, 1.5, 0.5, 0.5,
-3.901757, 2, -6.207186, 0, -0.5, 0.5, 0.5,
-3.901757, 2, -6.207186, 1, -0.5, 0.5, 0.5,
-3.901757, 2, -6.207186, 1, 1.5, 0.5, 0.5,
-3.901757, 2, -6.207186, 0, 1.5, 0.5, 0.5,
-3.901757, 3, -6.207186, 0, -0.5, 0.5, 0.5,
-3.901757, 3, -6.207186, 1, -0.5, 0.5, 0.5,
-3.901757, 3, -6.207186, 1, 1.5, 0.5, 0.5,
-3.901757, 3, -6.207186, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.420683, -3.550044, -4,
-3.420683, -3.550044, 4,
-3.420683, -3.550044, -4,
-3.581041, -3.723533, -4,
-3.420683, -3.550044, -2,
-3.581041, -3.723533, -2,
-3.420683, -3.550044, 0,
-3.581041, -3.723533, 0,
-3.420683, -3.550044, 2,
-3.581041, -3.723533, 2,
-3.420683, -3.550044, 4,
-3.581041, -3.723533, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.901757, -4.070513, -4, 0, -0.5, 0.5, 0.5,
-3.901757, -4.070513, -4, 1, -0.5, 0.5, 0.5,
-3.901757, -4.070513, -4, 1, 1.5, 0.5, 0.5,
-3.901757, -4.070513, -4, 0, 1.5, 0.5, 0.5,
-3.901757, -4.070513, -2, 0, -0.5, 0.5, 0.5,
-3.901757, -4.070513, -2, 1, -0.5, 0.5, 0.5,
-3.901757, -4.070513, -2, 1, 1.5, 0.5, 0.5,
-3.901757, -4.070513, -2, 0, 1.5, 0.5, 0.5,
-3.901757, -4.070513, 0, 0, -0.5, 0.5, 0.5,
-3.901757, -4.070513, 0, 1, -0.5, 0.5, 0.5,
-3.901757, -4.070513, 0, 1, 1.5, 0.5, 0.5,
-3.901757, -4.070513, 0, 0, 1.5, 0.5, 0.5,
-3.901757, -4.070513, 2, 0, -0.5, 0.5, 0.5,
-3.901757, -4.070513, 2, 1, -0.5, 0.5, 0.5,
-3.901757, -4.070513, 2, 1, 1.5, 0.5, 0.5,
-3.901757, -4.070513, 2, 0, 1.5, 0.5, 0.5,
-3.901757, -4.070513, 4, 0, -0.5, 0.5, 0.5,
-3.901757, -4.070513, 4, 1, -0.5, 0.5, 0.5,
-3.901757, -4.070513, 4, 1, 1.5, 0.5, 0.5,
-3.901757, -4.070513, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.420683, -3.550044, -5.357296,
-3.420683, 3.38955, -5.357296,
-3.420683, -3.550044, 5.974568,
-3.420683, 3.38955, 5.974568,
-3.420683, -3.550044, -5.357296,
-3.420683, -3.550044, 5.974568,
-3.420683, 3.38955, -5.357296,
-3.420683, 3.38955, 5.974568,
-3.420683, -3.550044, -5.357296,
2.993629, -3.550044, -5.357296,
-3.420683, -3.550044, 5.974568,
2.993629, -3.550044, 5.974568,
-3.420683, 3.38955, -5.357296,
2.993629, 3.38955, -5.357296,
-3.420683, 3.38955, 5.974568,
2.993629, 3.38955, 5.974568,
2.993629, -3.550044, -5.357296,
2.993629, 3.38955, -5.357296,
2.993629, -3.550044, 5.974568,
2.993629, 3.38955, 5.974568,
2.993629, -3.550044, -5.357296,
2.993629, -3.550044, 5.974568,
2.993629, 3.38955, -5.357296,
2.993629, 3.38955, 5.974568
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.878929;
var distance = 35.05424;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.213527, 0.08024669, -0.3086357 );
mvMatrix.scale( 1.328101, 1.227572, 0.7517608 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.05424);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
haloxyfop-methyl<-read.table("haloxyfop-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-haloxyfop-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
y<-haloxyfop-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
z<-haloxyfop-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.327271, -0.7925353, -2.419548, 0, 0, 1, 1, 1,
-2.984139, 0.1090567, -2.730123, 1, 0, 0, 1, 1,
-2.883899, 0.004692117, -1.677856, 1, 0, 0, 1, 1,
-2.794015, -0.06792046, -1.422792, 1, 0, 0, 1, 1,
-2.431609, -0.535249, -3.716733, 1, 0, 0, 1, 1,
-2.425285, -0.03887649, -0.8196247, 1, 0, 0, 1, 1,
-2.418591, 0.8559396, -2.507071, 0, 0, 0, 1, 1,
-2.290555, 0.1972914, -0.888873, 0, 0, 0, 1, 1,
-2.284968, -0.4359429, 0.3850507, 0, 0, 0, 1, 1,
-2.254748, 0.6409795, -0.8465566, 0, 0, 0, 1, 1,
-2.209566, -0.1680086, -1.040611, 0, 0, 0, 1, 1,
-2.194257, 0.7692353, -0.8063412, 0, 0, 0, 1, 1,
-2.1841, -1.312459, -2.54014, 0, 0, 0, 1, 1,
-2.14447, -1.074122, -3.112746, 1, 1, 1, 1, 1,
-2.140858, -0.5026962, -1.905874, 1, 1, 1, 1, 1,
-2.117863, -0.07251154, -1.463233, 1, 1, 1, 1, 1,
-2.052788, 0.9072474, -1.249225, 1, 1, 1, 1, 1,
-2.045236, -0.1179371, -2.245472, 1, 1, 1, 1, 1,
-2.020383, 0.02471019, -1.045808, 1, 1, 1, 1, 1,
-2.019136, -1.01679, -2.345509, 1, 1, 1, 1, 1,
-1.985439, 0.1025813, -2.852947, 1, 1, 1, 1, 1,
-1.964204, 0.7904325, -2.46694, 1, 1, 1, 1, 1,
-1.956294, -1.749162, -2.51023, 1, 1, 1, 1, 1,
-1.948947, 0.3207732, -2.248889, 1, 1, 1, 1, 1,
-1.904907, 0.1145373, 0.2483785, 1, 1, 1, 1, 1,
-1.902621, 0.960494, 0.9126108, 1, 1, 1, 1, 1,
-1.898201, -0.7280211, -1.794203, 1, 1, 1, 1, 1,
-1.879365, 0.425415, -1.675295, 1, 1, 1, 1, 1,
-1.872575, 0.7121196, -2.301339, 0, 0, 1, 1, 1,
-1.871273, 0.01157851, -1.727228, 1, 0, 0, 1, 1,
-1.848669, -1.360591, -2.606552, 1, 0, 0, 1, 1,
-1.830836, 0.2583939, -1.195175, 1, 0, 0, 1, 1,
-1.82642, 0.5914617, -1.184965, 1, 0, 0, 1, 1,
-1.795234, 0.0160924, -2.204744, 1, 0, 0, 1, 1,
-1.751725, 0.3966659, -1.385306, 0, 0, 0, 1, 1,
-1.749499, -0.567279, -1.373544, 0, 0, 0, 1, 1,
-1.738292, -0.08103137, -0.8623692, 0, 0, 0, 1, 1,
-1.731119, 1.238076, -1.390102, 0, 0, 0, 1, 1,
-1.724844, 0.7016048, -0.5320177, 0, 0, 0, 1, 1,
-1.720031, 0.6509861, 0.8009244, 0, 0, 0, 1, 1,
-1.697609, 0.4646858, -2.087331, 0, 0, 0, 1, 1,
-1.692599, -0.5618256, -1.791521, 1, 1, 1, 1, 1,
-1.688884, 0.5631397, -1.149578, 1, 1, 1, 1, 1,
-1.682195, -0.01551126, -1.086048, 1, 1, 1, 1, 1,
-1.624937, 1.930722, -1.116024, 1, 1, 1, 1, 1,
-1.620134, -1.65633, -4.876971, 1, 1, 1, 1, 1,
-1.611804, -0.5422331, -1.362001, 1, 1, 1, 1, 1,
-1.600724, 1.073927, -2.304091, 1, 1, 1, 1, 1,
-1.600069, 0.3684243, -2.199412, 1, 1, 1, 1, 1,
-1.593133, -0.5277913, -0.3025057, 1, 1, 1, 1, 1,
-1.592575, -0.5075702, -1.860469, 1, 1, 1, 1, 1,
-1.590865, 0.007632627, -3.730991, 1, 1, 1, 1, 1,
-1.534261, 1.852939, -0.3249542, 1, 1, 1, 1, 1,
-1.533072, 0.3199958, -1.265842, 1, 1, 1, 1, 1,
-1.524039, 0.02640543, -1.168193, 1, 1, 1, 1, 1,
-1.519719, 0.5033814, -3.517254, 1, 1, 1, 1, 1,
-1.517033, 0.6054459, -0.9493623, 0, 0, 1, 1, 1,
-1.503208, 2.434412, 0.05853071, 1, 0, 0, 1, 1,
-1.502675, -0.4355242, -0.8660408, 1, 0, 0, 1, 1,
-1.502077, -2.06672, -3.814453, 1, 0, 0, 1, 1,
-1.490969, 1.791475, -0.1718412, 1, 0, 0, 1, 1,
-1.490825, -0.008053325, -2.292173, 1, 0, 0, 1, 1,
-1.483744, 1.974324, -0.8539609, 0, 0, 0, 1, 1,
-1.477627, -0.1517094, -2.017343, 0, 0, 0, 1, 1,
-1.468294, -1.374805, -2.137803, 0, 0, 0, 1, 1,
-1.464266, -0.6251827, -1.345621, 0, 0, 0, 1, 1,
-1.462144, -0.04838512, -2.753891, 0, 0, 0, 1, 1,
-1.435168, 0.6077368, -0.0873665, 0, 0, 0, 1, 1,
-1.423158, -0.4712165, -2.06883, 0, 0, 0, 1, 1,
-1.421437, -0.5546249, -2.034975, 1, 1, 1, 1, 1,
-1.414136, -0.352061, -1.07765, 1, 1, 1, 1, 1,
-1.410635, 0.4008168, -0.9663162, 1, 1, 1, 1, 1,
-1.406243, -0.3322136, -3.593953, 1, 1, 1, 1, 1,
-1.399374, -0.4858676, -0.9701334, 1, 1, 1, 1, 1,
-1.397236, -0.2577043, 0.8364335, 1, 1, 1, 1, 1,
-1.386102, -0.06106804, -4.359241, 1, 1, 1, 1, 1,
-1.385164, -0.4360685, -2.174114, 1, 1, 1, 1, 1,
-1.372134, 1.211122, -0.1458961, 1, 1, 1, 1, 1,
-1.36509, -1.672334, -1.966778, 1, 1, 1, 1, 1,
-1.357301, -0.3222259, 0.0208968, 1, 1, 1, 1, 1,
-1.341389, 0.8930184, -1.46086, 1, 1, 1, 1, 1,
-1.319337, -0.9601573, -1.308356, 1, 1, 1, 1, 1,
-1.30915, 1.331278, -1.063926, 1, 1, 1, 1, 1,
-1.305326, 0.1839309, -1.247509, 1, 1, 1, 1, 1,
-1.30415, 0.4717676, -1.614014, 0, 0, 1, 1, 1,
-1.300384, 0.2602834, -1.712141, 1, 0, 0, 1, 1,
-1.295322, 0.5197856, -2.032026, 1, 0, 0, 1, 1,
-1.291728, -0.9264103, -2.339773, 1, 0, 0, 1, 1,
-1.286932, 0.309817, -0.3238578, 1, 0, 0, 1, 1,
-1.284286, -0.7546672, -0.2353833, 1, 0, 0, 1, 1,
-1.268695, -1.265291, -3.310513, 0, 0, 0, 1, 1,
-1.263078, -0.2018575, -2.492795, 0, 0, 0, 1, 1,
-1.258999, 2.230969, 1.05741, 0, 0, 0, 1, 1,
-1.248113, 0.3132717, -0.4896234, 0, 0, 0, 1, 1,
-1.247719, 1.63975, -0.3584364, 0, 0, 0, 1, 1,
-1.244504, 0.1293294, -0.9663529, 0, 0, 0, 1, 1,
-1.232733, -0.676788, 0.09286382, 0, 0, 0, 1, 1,
-1.229282, 1.415483, -1.423373, 1, 1, 1, 1, 1,
-1.222309, -1.157104, -2.24796, 1, 1, 1, 1, 1,
-1.222142, -0.517765, -0.9271035, 1, 1, 1, 1, 1,
-1.22102, 0.4148098, -2.480893, 1, 1, 1, 1, 1,
-1.218215, 1.063528, -0.3593753, 1, 1, 1, 1, 1,
-1.212867, 0.3131907, -0.6064339, 1, 1, 1, 1, 1,
-1.200666, 0.6421946, 0.04675436, 1, 1, 1, 1, 1,
-1.199853, 1.010958, 0.1856224, 1, 1, 1, 1, 1,
-1.195793, 0.8842878, -0.282249, 1, 1, 1, 1, 1,
-1.192647, 0.3975717, 0.4027089, 1, 1, 1, 1, 1,
-1.187923, 0.3256249, -2.150986, 1, 1, 1, 1, 1,
-1.184215, 0.3295416, -2.146013, 1, 1, 1, 1, 1,
-1.184039, -0.9633769, -3.064944, 1, 1, 1, 1, 1,
-1.178463, 1.635468, -1.550145, 1, 1, 1, 1, 1,
-1.178194, -0.2688085, -1.612561, 1, 1, 1, 1, 1,
-1.166762, -2.059339, -2.039535, 0, 0, 1, 1, 1,
-1.159732, -1.172262, -3.160199, 1, 0, 0, 1, 1,
-1.155867, -0.4316557, -1.612085, 1, 0, 0, 1, 1,
-1.145825, 0.7592044, -0.2577524, 1, 0, 0, 1, 1,
-1.145273, 0.2949181, 0.3268314, 1, 0, 0, 1, 1,
-1.133071, -0.5601625, -3.666077, 1, 0, 0, 1, 1,
-1.129364, 0.5345541, -1.897319, 0, 0, 0, 1, 1,
-1.124771, 0.7702356, -1.036076, 0, 0, 0, 1, 1,
-1.1162, 0.5830893, -2.665856, 0, 0, 0, 1, 1,
-1.11446, -0.198051, -1.701688, 0, 0, 0, 1, 1,
-1.110597, -0.3486065, -1.614131, 0, 0, 0, 1, 1,
-1.105471, -1.246486, -2.360638, 0, 0, 0, 1, 1,
-1.101591, 1.108826, -1.715286, 0, 0, 0, 1, 1,
-1.087947, -0.05884195, -2.938346, 1, 1, 1, 1, 1,
-1.083689, -0.9202013, -0.3235103, 1, 1, 1, 1, 1,
-1.08045, 3.037762, -1.141221, 1, 1, 1, 1, 1,
-1.076845, 0.8323496, 0.6474986, 1, 1, 1, 1, 1,
-1.068373, 0.8641169, -0.6881704, 1, 1, 1, 1, 1,
-1.064902, 0.3040729, 0.5377551, 1, 1, 1, 1, 1,
-1.062675, -0.1250171, -2.796415, 1, 1, 1, 1, 1,
-1.06073, -0.2382509, -1.836206, 1, 1, 1, 1, 1,
-1.05916, 0.0812711, -1.27513, 1, 1, 1, 1, 1,
-1.043596, -1.01659, -3.478779, 1, 1, 1, 1, 1,
-1.032425, -1.168893, -3.266471, 1, 1, 1, 1, 1,
-1.020817, 0.5500895, -1.014227, 1, 1, 1, 1, 1,
-1.013076, -0.3891206, -1.520993, 1, 1, 1, 1, 1,
-1.009278, -1.466705, -3.800007, 1, 1, 1, 1, 1,
-1.007538, -1.599918, -4.566607, 1, 1, 1, 1, 1,
-1.001012, -0.5578745, -2.638308, 0, 0, 1, 1, 1,
-0.9943773, 2.385255, 0.06087867, 1, 0, 0, 1, 1,
-0.9935443, -0.8173736, -1.885639, 1, 0, 0, 1, 1,
-0.9932166, -0.5839049, -1.843242, 1, 0, 0, 1, 1,
-0.9931164, -0.6085252, -2.138576, 1, 0, 0, 1, 1,
-0.9899132, -1.407767, -1.623087, 1, 0, 0, 1, 1,
-0.985629, -0.213238, -1.77739, 0, 0, 0, 1, 1,
-0.9838189, -1.009013, -3.371153, 0, 0, 0, 1, 1,
-0.9814538, 0.9797316, -2.333706, 0, 0, 0, 1, 1,
-0.9808373, -0.241262, -1.39193, 0, 0, 0, 1, 1,
-0.9741623, -1.380538, -3.273476, 0, 0, 0, 1, 1,
-0.9738075, 0.06740681, -0.8231382, 0, 0, 0, 1, 1,
-0.9666399, -0.4913722, -2.450894, 0, 0, 0, 1, 1,
-0.9653909, 0.4436319, -1.269193, 1, 1, 1, 1, 1,
-0.9626958, 0.3295676, -1.511663, 1, 1, 1, 1, 1,
-0.9622025, -0.2535341, -1.019243, 1, 1, 1, 1, 1,
-0.9614581, -1.137373, -1.225384, 1, 1, 1, 1, 1,
-0.9610488, 2.50624, -1.235816, 1, 1, 1, 1, 1,
-0.955451, -0.3685808, -1.493092, 1, 1, 1, 1, 1,
-0.9544964, -0.449281, -3.799421, 1, 1, 1, 1, 1,
-0.9514998, 0.2445546, -1.228418, 1, 1, 1, 1, 1,
-0.9490493, -1.706827, -1.186194, 1, 1, 1, 1, 1,
-0.9472075, 1.67921, -0.6408541, 1, 1, 1, 1, 1,
-0.9455214, -0.2602082, 0.03808338, 1, 1, 1, 1, 1,
-0.9430978, -1.010879, -3.94541, 1, 1, 1, 1, 1,
-0.9405925, -1.136692, -2.996081, 1, 1, 1, 1, 1,
-0.9398898, 0.2271392, -0.8645915, 1, 1, 1, 1, 1,
-0.9343235, -1.132646, -0.6520429, 1, 1, 1, 1, 1,
-0.9342833, -0.0146349, -0.2459002, 0, 0, 1, 1, 1,
-0.9330431, 0.2778635, -2.620131, 1, 0, 0, 1, 1,
-0.9282586, 1.730977, -0.8222691, 1, 0, 0, 1, 1,
-0.9194978, -0.5603783, -2.05512, 1, 0, 0, 1, 1,
-0.9132898, -0.5182229, -2.008916, 1, 0, 0, 1, 1,
-0.9119319, -0.3379, -2.44267, 1, 0, 0, 1, 1,
-0.9074161, 1.480355, 0.7394739, 0, 0, 0, 1, 1,
-0.9064854, -0.09701087, -1.100715, 0, 0, 0, 1, 1,
-0.9034083, 0.5669598, -1.880269, 0, 0, 0, 1, 1,
-0.8981747, 0.6440887, 0.6178246, 0, 0, 0, 1, 1,
-0.89666, -0.6627728, -2.327575, 0, 0, 0, 1, 1,
-0.8958262, -0.05171203, -0.2746049, 0, 0, 0, 1, 1,
-0.8939809, -0.8719858, -1.352757, 0, 0, 0, 1, 1,
-0.8937058, -0.7877258, -2.607689, 1, 1, 1, 1, 1,
-0.8795386, -0.5089209, -2.54057, 1, 1, 1, 1, 1,
-0.8790462, -0.6330468, -1.554684, 1, 1, 1, 1, 1,
-0.8783306, -0.4399451, -3.342839, 1, 1, 1, 1, 1,
-0.8773972, 2.350524, -0.8480141, 1, 1, 1, 1, 1,
-0.8765335, 0.8979525, 1.909953, 1, 1, 1, 1, 1,
-0.8756332, -0.8635644, -3.752232, 1, 1, 1, 1, 1,
-0.8724545, -1.457012, -1.757955, 1, 1, 1, 1, 1,
-0.8567032, -0.2885953, -3.014825, 1, 1, 1, 1, 1,
-0.8524233, 0.1403358, -2.323769, 1, 1, 1, 1, 1,
-0.845946, -0.4265869, -3.558467, 1, 1, 1, 1, 1,
-0.8448238, 0.4769949, -0.04394308, 1, 1, 1, 1, 1,
-0.8446926, -0.7190638, -2.75768, 1, 1, 1, 1, 1,
-0.8445445, 0.03398002, -0.1510936, 1, 1, 1, 1, 1,
-0.8407732, 0.6741167, -0.2683077, 1, 1, 1, 1, 1,
-0.8404734, 0.4734095, -1.126006, 0, 0, 1, 1, 1,
-0.8371208, 0.9065002, -2.251595, 1, 0, 0, 1, 1,
-0.8292214, 1.502381, -0.8663495, 1, 0, 0, 1, 1,
-0.8286211, -0.2062057, -3.204914, 1, 0, 0, 1, 1,
-0.8173898, 1.230144, -0.9302419, 1, 0, 0, 1, 1,
-0.8170453, 1.256206, 0.03583649, 1, 0, 0, 1, 1,
-0.8143828, -0.264941, -2.671622, 0, 0, 0, 1, 1,
-0.814243, 0.3762099, -1.602461, 0, 0, 0, 1, 1,
-0.8126744, 0.7494646, -1.806295, 0, 0, 0, 1, 1,
-0.8079778, 0.1250547, 0.2965002, 0, 0, 0, 1, 1,
-0.8065389, -0.5972747, -2.045574, 0, 0, 0, 1, 1,
-0.8047229, 1.197802, 0.3233642, 0, 0, 0, 1, 1,
-0.7829946, 0.2484269, -1.694227, 0, 0, 0, 1, 1,
-0.7791752, 0.1618268, -1.351899, 1, 1, 1, 1, 1,
-0.7751219, 0.4650765, 0.6360327, 1, 1, 1, 1, 1,
-0.7648731, 1.227306, -1.498741, 1, 1, 1, 1, 1,
-0.7613342, -0.1783105, -1.315194, 1, 1, 1, 1, 1,
-0.7578668, -2.675259, -1.677784, 1, 1, 1, 1, 1,
-0.7544929, 0.5641946, 1.515205, 1, 1, 1, 1, 1,
-0.7527096, -0.823687, -1.725162, 1, 1, 1, 1, 1,
-0.7524414, 1.339838, 0.8699412, 1, 1, 1, 1, 1,
-0.7495436, -1.505337, -3.567575, 1, 1, 1, 1, 1,
-0.7442564, -1.012609, -1.843401, 1, 1, 1, 1, 1,
-0.7421132, -1.399768, -2.854007, 1, 1, 1, 1, 1,
-0.7418497, -2.379284, -3.097522, 1, 1, 1, 1, 1,
-0.7350971, 0.3216896, -0.9082399, 1, 1, 1, 1, 1,
-0.7315298, 1.739721, -0.4386934, 1, 1, 1, 1, 1,
-0.731482, -1.084825, -0.3149443, 1, 1, 1, 1, 1,
-0.7293698, -0.2730215, -3.890668, 0, 0, 1, 1, 1,
-0.7229803, -1.998681, -3.048382, 1, 0, 0, 1, 1,
-0.7221483, 1.240931, 0.01286163, 1, 0, 0, 1, 1,
-0.711062, 1.050199, 0.9096053, 1, 0, 0, 1, 1,
-0.7047062, -1.042761, -2.709734, 1, 0, 0, 1, 1,
-0.7015375, -1.118344, -2.06454, 1, 0, 0, 1, 1,
-0.6966081, 0.3685756, -1.016204, 0, 0, 0, 1, 1,
-0.6951492, -0.8183933, -3.502003, 0, 0, 0, 1, 1,
-0.6946295, 1.362556, 0.05415622, 0, 0, 0, 1, 1,
-0.6904485, -1.356933, -1.443819, 0, 0, 0, 1, 1,
-0.6831861, -0.2840202, -2.22406, 0, 0, 0, 1, 1,
-0.675307, -0.4064028, -2.882448, 0, 0, 0, 1, 1,
-0.6646546, 1.54851, -1.649911, 0, 0, 0, 1, 1,
-0.6631238, -0.01363473, -0.847157, 1, 1, 1, 1, 1,
-0.6579437, 1.140416, -2.756963, 1, 1, 1, 1, 1,
-0.6577445, -0.3574175, -0.2452546, 1, 1, 1, 1, 1,
-0.6554098, 1.076088, 0.6831095, 1, 1, 1, 1, 1,
-0.6541201, 0.3927353, -0.6337103, 1, 1, 1, 1, 1,
-0.6520864, -0.7831978, -2.268621, 1, 1, 1, 1, 1,
-0.6519835, 0.2679158, -0.3173993, 1, 1, 1, 1, 1,
-0.6463841, -0.2310077, -3.067856, 1, 1, 1, 1, 1,
-0.6434229, -2.530763, -3.011645, 1, 1, 1, 1, 1,
-0.6404744, 1.864861, -0.8166514, 1, 1, 1, 1, 1,
-0.6393596, -0.04197638, -0.3759695, 1, 1, 1, 1, 1,
-0.6388216, 0.18304, -0.08286042, 1, 1, 1, 1, 1,
-0.6368595, -0.6727408, -2.296575, 1, 1, 1, 1, 1,
-0.634707, 0.6487737, 0.6779326, 1, 1, 1, 1, 1,
-0.6343996, -0.9350504, -1.018475, 1, 1, 1, 1, 1,
-0.63358, 0.557847, -0.6849942, 0, 0, 1, 1, 1,
-0.6330592, 0.421059, 0.2614281, 1, 0, 0, 1, 1,
-0.627579, 0.2188031, -2.011522, 1, 0, 0, 1, 1,
-0.6272087, -0.1859789, -1.427632, 1, 0, 0, 1, 1,
-0.6225272, -1.109043, -1.713699, 1, 0, 0, 1, 1,
-0.6174638, 0.02649926, -1.220614, 1, 0, 0, 1, 1,
-0.6163748, -0.4478139, -4.294873, 0, 0, 0, 1, 1,
-0.6118042, 0.9673877, -1.143159, 0, 0, 0, 1, 1,
-0.6105368, -0.01851785, -2.613405, 0, 0, 0, 1, 1,
-0.6104348, -0.8761781, -3.306259, 0, 0, 0, 1, 1,
-0.606797, 0.9109985, -0.7601466, 0, 0, 0, 1, 1,
-0.6067479, -0.7385781, -3.486472, 0, 0, 0, 1, 1,
-0.604632, -0.002024077, -0.5748002, 0, 0, 0, 1, 1,
-0.6031121, -0.9153799, -3.501102, 1, 1, 1, 1, 1,
-0.6022915, 1.0633, -0.509765, 1, 1, 1, 1, 1,
-0.6016875, -0.6418002, -2.051926, 1, 1, 1, 1, 1,
-0.599768, -0.3543147, -3.061994, 1, 1, 1, 1, 1,
-0.5975866, -0.6942284, -1.746225, 1, 1, 1, 1, 1,
-0.5944419, 0.08208866, -0.6981008, 1, 1, 1, 1, 1,
-0.5902333, -2.109442, -2.639313, 1, 1, 1, 1, 1,
-0.5876904, -0.3838863, 0.2374778, 1, 1, 1, 1, 1,
-0.5812904, 2.173594, -0.5109493, 1, 1, 1, 1, 1,
-0.5793263, 0.2181943, -2.732346, 1, 1, 1, 1, 1,
-0.5755427, 0.457244, -1.125287, 1, 1, 1, 1, 1,
-0.5751531, 0.8575894, -0.5935634, 1, 1, 1, 1, 1,
-0.5719688, -0.0781403, -1.282691, 1, 1, 1, 1, 1,
-0.5672389, -2.520922, -2.733268, 1, 1, 1, 1, 1,
-0.5668449, 0.5744686, -1.759795, 1, 1, 1, 1, 1,
-0.5664008, -0.8655459, -2.763736, 0, 0, 1, 1, 1,
-0.556801, 0.221684, 0.3548957, 1, 0, 0, 1, 1,
-0.5546811, 0.2611606, -1.744739, 1, 0, 0, 1, 1,
-0.5541948, -0.2183486, -0.789633, 1, 0, 0, 1, 1,
-0.5486394, -0.3141266, -1.952206, 1, 0, 0, 1, 1,
-0.5485012, 0.07998072, -0.9917612, 1, 0, 0, 1, 1,
-0.5476032, 1.027685, -0.9439872, 0, 0, 0, 1, 1,
-0.5471087, -1.525302, -1.989097, 0, 0, 0, 1, 1,
-0.5388068, 0.2796222, -2.754985, 0, 0, 0, 1, 1,
-0.5385384, 0.4812002, -1.937851, 0, 0, 0, 1, 1,
-0.5372566, -0.7233003, -3.010256, 0, 0, 0, 1, 1,
-0.5350818, 1.080682, -1.454409, 0, 0, 0, 1, 1,
-0.5315661, 0.1612742, -0.2842228, 0, 0, 0, 1, 1,
-0.5229631, -0.7695299, -2.445485, 1, 1, 1, 1, 1,
-0.5214677, 0.05258466, -1.212042, 1, 1, 1, 1, 1,
-0.5182157, -1.122396, -0.6725035, 1, 1, 1, 1, 1,
-0.5150765, 0.8007836, 0.5482295, 1, 1, 1, 1, 1,
-0.5080582, 0.3869531, -2.109879, 1, 1, 1, 1, 1,
-0.5056821, -0.841037, -0.7082571, 1, 1, 1, 1, 1,
-0.5019497, 0.3164056, -1.161167, 1, 1, 1, 1, 1,
-0.5009954, -0.1073755, -1.921043, 1, 1, 1, 1, 1,
-0.500598, 0.08675863, -0.6577953, 1, 1, 1, 1, 1,
-0.4986755, 0.8709211, -1.207674, 1, 1, 1, 1, 1,
-0.4977818, -1.116551, -2.822382, 1, 1, 1, 1, 1,
-0.4969844, -0.6803252, -1.951981, 1, 1, 1, 1, 1,
-0.4967086, 0.4940319, -0.6741236, 1, 1, 1, 1, 1,
-0.4928518, -1.335995, -2.467919, 1, 1, 1, 1, 1,
-0.4802096, 0.1050656, -1.657943, 1, 1, 1, 1, 1,
-0.4763804, 1.406312, -0.3730527, 0, 0, 1, 1, 1,
-0.4723605, 0.04264842, -0.7586601, 1, 0, 0, 1, 1,
-0.4715248, 0.0777632, -1.567082, 1, 0, 0, 1, 1,
-0.4699427, 0.6783273, 0.4488357, 1, 0, 0, 1, 1,
-0.4691786, 0.4170433, 0.2521428, 1, 0, 0, 1, 1,
-0.4688783, -1.055057, 0.05786291, 1, 0, 0, 1, 1,
-0.4665835, -0.09604747, -1.755274, 0, 0, 0, 1, 1,
-0.4665771, -0.3125336, -2.914011, 0, 0, 0, 1, 1,
-0.458715, -0.1577333, 0.09494276, 0, 0, 0, 1, 1,
-0.4574944, 1.21779, -0.04932725, 0, 0, 0, 1, 1,
-0.4567363, -0.2704045, -2.020775, 0, 0, 0, 1, 1,
-0.4549579, -0.8224952, -2.013196, 0, 0, 0, 1, 1,
-0.4531414, -0.6477134, -1.223583, 0, 0, 0, 1, 1,
-0.4522668, -0.600686, -1.57393, 1, 1, 1, 1, 1,
-0.4511193, -1.391931, -3.941043, 1, 1, 1, 1, 1,
-0.44358, 1.879026, 1.112475, 1, 1, 1, 1, 1,
-0.436663, -0.5553728, -3.206924, 1, 1, 1, 1, 1,
-0.4300179, -0.5957078, -1.661058, 1, 1, 1, 1, 1,
-0.4256216, -0.196808, -0.6323817, 1, 1, 1, 1, 1,
-0.4251484, 1.242627, -1.338168, 1, 1, 1, 1, 1,
-0.4247723, 0.2301182, -2.321152, 1, 1, 1, 1, 1,
-0.4235976, 1.274935, -1.183233, 1, 1, 1, 1, 1,
-0.4167122, -0.2707905, -2.257421, 1, 1, 1, 1, 1,
-0.4161269, 0.7343233, -2.061899, 1, 1, 1, 1, 1,
-0.4095016, -1.997557, -2.552636, 1, 1, 1, 1, 1,
-0.40838, -1.048838, -2.094608, 1, 1, 1, 1, 1,
-0.4077834, -0.6376194, -2.780128, 1, 1, 1, 1, 1,
-0.4029277, 2.120569, -1.622491, 1, 1, 1, 1, 1,
-0.4028361, -0.3283313, -2.197814, 0, 0, 1, 1, 1,
-0.3934357, -0.009306469, -3.026849, 1, 0, 0, 1, 1,
-0.3898792, 0.9306231, -0.4021066, 1, 0, 0, 1, 1,
-0.3872621, 0.4443835, -2.681595, 1, 0, 0, 1, 1,
-0.3840762, -0.2536573, -1.455043, 1, 0, 0, 1, 1,
-0.3785788, -0.02331852, -0.6667364, 1, 0, 0, 1, 1,
-0.3727623, 0.6226141, -0.9325114, 0, 0, 0, 1, 1,
-0.372236, -0.3635021, -2.782156, 0, 0, 0, 1, 1,
-0.3721957, -0.1213594, -2.444134, 0, 0, 0, 1, 1,
-0.3712322, 3.288488, 0.4277852, 0, 0, 0, 1, 1,
-0.3653564, -0.04313419, -1.448387, 0, 0, 0, 1, 1,
-0.3624741, -0.7682443, -2.364938, 0, 0, 0, 1, 1,
-0.3587696, -1.332278, -4.01342, 0, 0, 0, 1, 1,
-0.3570452, -0.09072728, -2.88341, 1, 1, 1, 1, 1,
-0.3555636, 0.351918, -0.6942518, 1, 1, 1, 1, 1,
-0.3543472, 1.536442, 1.731174, 1, 1, 1, 1, 1,
-0.3540149, 1.95365, 0.1945795, 1, 1, 1, 1, 1,
-0.3520391, -0.0382826, -0.9435214, 1, 1, 1, 1, 1,
-0.3490168, -0.6346738, -2.184118, 1, 1, 1, 1, 1,
-0.3488854, 0.1606248, -1.38042, 1, 1, 1, 1, 1,
-0.3476328, -0.3498843, -3.563609, 1, 1, 1, 1, 1,
-0.3463334, 1.146515, 0.6640009, 1, 1, 1, 1, 1,
-0.3380691, -0.6623175, -3.684244, 1, 1, 1, 1, 1,
-0.3370681, 0.2933634, -1.400617, 1, 1, 1, 1, 1,
-0.3316366, 1.072489, -1.285287, 1, 1, 1, 1, 1,
-0.3298395, 1.445903, 0.9803972, 1, 1, 1, 1, 1,
-0.3221129, -0.4936551, -2.583333, 1, 1, 1, 1, 1,
-0.3207776, 1.219913, -2.413351, 1, 1, 1, 1, 1,
-0.318851, -0.07330547, -1.441837, 0, 0, 1, 1, 1,
-0.3140589, 1.60299, 0.4263013, 1, 0, 0, 1, 1,
-0.3138556, 1.004733, -0.8077945, 1, 0, 0, 1, 1,
-0.3128611, 0.7985845, -1.739157, 1, 0, 0, 1, 1,
-0.3107105, -0.2951458, -3.672826, 1, 0, 0, 1, 1,
-0.3091739, 1.619146, -0.09975414, 1, 0, 0, 1, 1,
-0.3087962, -1.144536, -3.486015, 0, 0, 0, 1, 1,
-0.3012903, 0.7235394, 1.606542, 0, 0, 0, 1, 1,
-0.3010321, 0.07730412, -2.494873, 0, 0, 0, 1, 1,
-0.2993899, 1.586908, -1.733258, 0, 0, 0, 1, 1,
-0.2988334, -0.8823678, -1.754426, 0, 0, 0, 1, 1,
-0.2984725, -0.1078377, -1.708372, 0, 0, 0, 1, 1,
-0.2950842, 1.133527, 0.8479915, 0, 0, 0, 1, 1,
-0.2946942, 1.152982, 0.4372263, 1, 1, 1, 1, 1,
-0.2910241, 0.8826014, -0.5836583, 1, 1, 1, 1, 1,
-0.2895044, 0.5252677, -0.8389269, 1, 1, 1, 1, 1,
-0.2889259, -1.677689, -2.565076, 1, 1, 1, 1, 1,
-0.2849132, 1.173241, 0.3766041, 1, 1, 1, 1, 1,
-0.2789922, -0.3653481, -1.569027, 1, 1, 1, 1, 1,
-0.272457, 0.470957, -0.5276711, 1, 1, 1, 1, 1,
-0.2699829, 0.5324374, 0.2539877, 1, 1, 1, 1, 1,
-0.2683884, -0.4959598, -3.761986, 1, 1, 1, 1, 1,
-0.2677293, -0.4190482, -1.065891, 1, 1, 1, 1, 1,
-0.2631052, 0.6606675, -0.0009885661, 1, 1, 1, 1, 1,
-0.2626295, 0.006551545, -0.629482, 1, 1, 1, 1, 1,
-0.2614547, -0.4348567, -2.318976, 1, 1, 1, 1, 1,
-0.2604941, -2.198231, -2.216434, 1, 1, 1, 1, 1,
-0.2496848, -0.7273636, -3.591972, 1, 1, 1, 1, 1,
-0.2450889, -0.2855403, -2.247563, 0, 0, 1, 1, 1,
-0.2392388, 0.6528167, -0.1248614, 1, 0, 0, 1, 1,
-0.2379476, 0.1850483, -1.602707, 1, 0, 0, 1, 1,
-0.2363592, -2.168568, -4.562311, 1, 0, 0, 1, 1,
-0.2362781, 0.4161457, -1.809926, 1, 0, 0, 1, 1,
-0.2347087, 0.171087, -1.317594, 1, 0, 0, 1, 1,
-0.2256762, 1.946701, -0.3318551, 0, 0, 0, 1, 1,
-0.2225563, -0.4585592, -2.346384, 0, 0, 0, 1, 1,
-0.2207927, 1.414283, -1.302575, 0, 0, 0, 1, 1,
-0.2149159, -1.442971, -4.177538, 0, 0, 0, 1, 1,
-0.2144171, -0.7484131, -3.51403, 0, 0, 0, 1, 1,
-0.2126884, -0.8511738, -2.9001, 0, 0, 0, 1, 1,
-0.2117568, -1.616575, -2.550536, 0, 0, 0, 1, 1,
-0.2114406, 0.7927442, -0.5642446, 1, 1, 1, 1, 1,
-0.2104794, 1.064288, 1.292971, 1, 1, 1, 1, 1,
-0.2104306, -1.334543, -2.036628, 1, 1, 1, 1, 1,
-0.2051423, -1.939357, -4.389684, 1, 1, 1, 1, 1,
-0.2043179, 1.248036, 1.010346, 1, 1, 1, 1, 1,
-0.2038827, 0.2958674, -0.462511, 1, 1, 1, 1, 1,
-0.2028566, 0.6805637, -0.0749703, 1, 1, 1, 1, 1,
-0.2027501, 1.422465, 0.8496357, 1, 1, 1, 1, 1,
-0.1967454, -0.6138714, -1.218795, 1, 1, 1, 1, 1,
-0.1897006, -0.9592835, -1.90288, 1, 1, 1, 1, 1,
-0.1872987, -0.1255796, -2.334456, 1, 1, 1, 1, 1,
-0.1846276, 0.1472405, -1.375317, 1, 1, 1, 1, 1,
-0.1829625, 1.416359, -0.3701825, 1, 1, 1, 1, 1,
-0.1821548, 0.6632594, 0.2251591, 1, 1, 1, 1, 1,
-0.1801652, -0.09009283, -1.459774, 1, 1, 1, 1, 1,
-0.1801011, 0.111368, -0.1583532, 0, 0, 1, 1, 1,
-0.1710738, -0.01377131, -1.263509, 1, 0, 0, 1, 1,
-0.1694517, 0.412842, -1.303038, 1, 0, 0, 1, 1,
-0.1676972, -1.371664, -3.274126, 1, 0, 0, 1, 1,
-0.167645, -0.7343068, -1.402292, 1, 0, 0, 1, 1,
-0.1639324, -0.02414629, -1.565152, 1, 0, 0, 1, 1,
-0.1625654, -0.1620045, -2.627039, 0, 0, 0, 1, 1,
-0.1620003, 0.09525201, -3.015623, 0, 0, 0, 1, 1,
-0.1597236, 0.5057317, -1.098406, 0, 0, 0, 1, 1,
-0.1581509, -0.2898509, -1.486362, 0, 0, 0, 1, 1,
-0.1564815, -0.7681858, -3.602879, 0, 0, 0, 1, 1,
-0.1555786, 0.156872, -0.390356, 0, 0, 0, 1, 1,
-0.1448057, 0.7345831, -0.5310405, 0, 0, 0, 1, 1,
-0.1444469, 0.8362313, 1.214876, 1, 1, 1, 1, 1,
-0.1375547, -0.8524665, -3.239168, 1, 1, 1, 1, 1,
-0.1350613, 0.4031794, 1.057556, 1, 1, 1, 1, 1,
-0.1316789, -0.6476538, -3.276101, 1, 1, 1, 1, 1,
-0.1280888, 0.3136184, -1.890178, 1, 1, 1, 1, 1,
-0.127864, -0.3181379, -4.347854, 1, 1, 1, 1, 1,
-0.1276882, -0.1750682, -1.420356, 1, 1, 1, 1, 1,
-0.1223308, -1.298239, -2.655921, 1, 1, 1, 1, 1,
-0.1222445, 2.20525, 2.445546, 1, 1, 1, 1, 1,
-0.1204098, 1.426529, 0.1310347, 1, 1, 1, 1, 1,
-0.1201768, 0.07827516, -0.9193263, 1, 1, 1, 1, 1,
-0.116748, 1.442502, 0.07214601, 1, 1, 1, 1, 1,
-0.1165465, 0.3414204, -0.1437893, 1, 1, 1, 1, 1,
-0.1146753, 0.7939891, -0.06850861, 1, 1, 1, 1, 1,
-0.1041914, -1.890225, -3.877639, 1, 1, 1, 1, 1,
-0.1020575, 1.089295, 0.9547485, 0, 0, 1, 1, 1,
-0.09824384, 0.03235454, -1.06567, 1, 0, 0, 1, 1,
-0.09639033, -0.1580444, -2.590944, 1, 0, 0, 1, 1,
-0.0900792, 0.008868161, 0.124875, 1, 0, 0, 1, 1,
-0.08877064, -0.5700276, -2.470108, 1, 0, 0, 1, 1,
-0.08725414, -0.7973318, -3.571956, 1, 0, 0, 1, 1,
-0.08682698, 0.5292127, 2.593403, 0, 0, 0, 1, 1,
-0.08141641, -0.03927794, -2.643452, 0, 0, 0, 1, 1,
-0.07897773, 0.2985451, -1.136619, 0, 0, 0, 1, 1,
-0.07374789, -1.368667, -3.72676, 0, 0, 0, 1, 1,
-0.07073794, -0.8614303, -3.07922, 0, 0, 0, 1, 1,
-0.06872653, 0.140923, -2.217931, 0, 0, 0, 1, 1,
-0.06826297, -1.811177, -4.617926, 0, 0, 0, 1, 1,
-0.06632601, -0.3632697, -2.570466, 1, 1, 1, 1, 1,
-0.06589092, -0.09522335, -3.958322, 1, 1, 1, 1, 1,
-0.05947101, 1.322157, 0.6984988, 1, 1, 1, 1, 1,
-0.05806183, 0.7210422, -0.8730301, 1, 1, 1, 1, 1,
-0.05725284, -0.7491134, -1.610501, 1, 1, 1, 1, 1,
-0.05467355, 0.4913003, 1.90191, 1, 1, 1, 1, 1,
-0.05198, -0.8097184, -0.6598824, 1, 1, 1, 1, 1,
-0.0519557, -0.3903688, -3.268579, 1, 1, 1, 1, 1,
-0.04965467, -1.041953, -3.376504, 1, 1, 1, 1, 1,
-0.04605604, 2.192961, 0.9246984, 1, 1, 1, 1, 1,
-0.04482305, 1.530088, -0.9666455, 1, 1, 1, 1, 1,
-0.03956701, 0.358135, -0.9648319, 1, 1, 1, 1, 1,
-0.03922813, -0.2911115, -2.047923, 1, 1, 1, 1, 1,
-0.03903642, 0.9996793, -0.745891, 1, 1, 1, 1, 1,
-0.03887552, -1.272471, -4.04193, 1, 1, 1, 1, 1,
-0.03854435, -1.335216, -4.254312, 0, 0, 1, 1, 1,
-0.03572963, 0.3351908, 0.9491361, 1, 0, 0, 1, 1,
-0.0354102, -1.204816, -2.401347, 1, 0, 0, 1, 1,
-0.03085769, 0.709057, -0.126689, 1, 0, 0, 1, 1,
-0.03039544, 0.7989408, 0.3776507, 1, 0, 0, 1, 1,
-0.02661378, 0.9140697, 0.2334654, 1, 0, 0, 1, 1,
-0.02542289, -2.311618, -3.677755, 0, 0, 0, 1, 1,
-0.02499756, -0.3644095, -2.521116, 0, 0, 0, 1, 1,
-0.02325887, -0.6885521, -2.698107, 0, 0, 0, 1, 1,
-0.0207275, 2.506356, 0.7615819, 0, 0, 0, 1, 1,
-0.02040919, -0.9892576, -5.192269, 0, 0, 0, 1, 1,
-0.008017744, -0.329156, -1.443774, 0, 0, 0, 1, 1,
-0.006582915, -0.6341778, -1.910578, 0, 0, 0, 1, 1,
-0.006187566, -0.03353749, -2.519836, 1, 1, 1, 1, 1,
-0.00541056, 0.6165397, -0.2009615, 1, 1, 1, 1, 1,
-0.002065305, -0.328503, -1.340295, 1, 1, 1, 1, 1,
-0.001259232, -1.109262, -3.210812, 1, 1, 1, 1, 1,
0.002034797, -0.3655684, 3.427351, 1, 1, 1, 1, 1,
0.002916517, -0.1422965, 2.701465, 1, 1, 1, 1, 1,
0.003014925, 0.5669668, 1.94481, 1, 1, 1, 1, 1,
0.003027114, -0.0797959, 1.675119, 1, 1, 1, 1, 1,
0.004861471, 0.6615479, 0.2958952, 1, 1, 1, 1, 1,
0.005388066, 0.1469033, -0.1263279, 1, 1, 1, 1, 1,
0.007480175, 0.7250851, 0.9388276, 1, 1, 1, 1, 1,
0.009045048, -0.07942311, 3.07684, 1, 1, 1, 1, 1,
0.009866836, 0.04511552, 0.01191736, 1, 1, 1, 1, 1,
0.0163397, 0.5064965, 0.0982508, 1, 1, 1, 1, 1,
0.01916857, 0.5090133, 1.208912, 1, 1, 1, 1, 1,
0.01984106, -0.8638964, 1.861096, 0, 0, 1, 1, 1,
0.02252598, -0.4223105, 2.481575, 1, 0, 0, 1, 1,
0.02441837, 0.3277927, -0.2040557, 1, 0, 0, 1, 1,
0.02739951, 1.053324, -0.8573557, 1, 0, 0, 1, 1,
0.02834257, 0.4643833, 0.4189793, 1, 0, 0, 1, 1,
0.0317759, -0.05255916, 4.375642, 1, 0, 0, 1, 1,
0.03202935, -1.467193, 2.738116, 0, 0, 0, 1, 1,
0.0327049, 0.05774783, -0.3541451, 0, 0, 0, 1, 1,
0.03454317, -0.8786893, 2.527657, 0, 0, 0, 1, 1,
0.03630627, -0.09803895, 4.271315, 0, 0, 0, 1, 1,
0.0363618, 0.777357, 0.9339588, 0, 0, 0, 1, 1,
0.0388074, 0.2174387, -0.4781693, 0, 0, 0, 1, 1,
0.03960457, 0.8695391, -1.978065, 0, 0, 0, 1, 1,
0.04209013, 0.8865916, 0.6294185, 1, 1, 1, 1, 1,
0.04506304, -1.442044, 2.669717, 1, 1, 1, 1, 1,
0.0465204, 0.08155567, -0.4671956, 1, 1, 1, 1, 1,
0.04690921, -0.1675292, 3.131822, 1, 1, 1, 1, 1,
0.04733148, 0.4066449, 0.152717, 1, 1, 1, 1, 1,
0.04767858, -0.440208, 2.676898, 1, 1, 1, 1, 1,
0.05300445, -1.482551, 2.455433, 1, 1, 1, 1, 1,
0.05540587, 0.1777705, 1.371694, 1, 1, 1, 1, 1,
0.05666019, 0.2333845, -1.296525, 1, 1, 1, 1, 1,
0.05981761, 0.3204454, 1.090446, 1, 1, 1, 1, 1,
0.06227812, 0.4673375, 1.402917, 1, 1, 1, 1, 1,
0.0623095, 0.6011452, 0.0938568, 1, 1, 1, 1, 1,
0.0667378, -0.7169276, 3.603592, 1, 1, 1, 1, 1,
0.06920151, -0.6578408, 1.435359, 1, 1, 1, 1, 1,
0.08465136, 0.4520694, 0.1599123, 1, 1, 1, 1, 1,
0.08692535, 0.9423268, -0.11511, 0, 0, 1, 1, 1,
0.08976912, -1.146603, 3.146163, 1, 0, 0, 1, 1,
0.09185147, 0.3558117, 0.09184026, 1, 0, 0, 1, 1,
0.09309961, -1.00195, 2.146214, 1, 0, 0, 1, 1,
0.09539469, -0.5169083, 1.565623, 1, 0, 0, 1, 1,
0.09905494, -1.116725, 5.809541, 1, 0, 0, 1, 1,
0.1005662, -0.3278837, 2.752711, 0, 0, 0, 1, 1,
0.1018307, -1.75225, 4.799973, 0, 0, 0, 1, 1,
0.1053237, -0.3175082, 3.371548, 0, 0, 0, 1, 1,
0.1055673, 0.07422799, 2.587961, 0, 0, 0, 1, 1,
0.107932, 0.3144887, 0.9236335, 0, 0, 0, 1, 1,
0.1096991, 0.08128233, -0.3675134, 0, 0, 0, 1, 1,
0.1097915, -0.5141454, 0.8411348, 0, 0, 0, 1, 1,
0.1115585, 1.130306, 0.5312419, 1, 1, 1, 1, 1,
0.1133293, 0.7185881, 0.1128303, 1, 1, 1, 1, 1,
0.1133789, 0.4780118, 1.622212, 1, 1, 1, 1, 1,
0.1141428, -0.2778621, 2.159431, 1, 1, 1, 1, 1,
0.1187813, 0.227857, 1.571061, 1, 1, 1, 1, 1,
0.1196369, -0.2831741, 4.228006, 1, 1, 1, 1, 1,
0.1202059, 0.1790397, 0.3369532, 1, 1, 1, 1, 1,
0.1209998, -0.5338733, 3.09738, 1, 1, 1, 1, 1,
0.1228417, 1.309923, -0.8044134, 1, 1, 1, 1, 1,
0.1237698, -0.6593412, 1.913973, 1, 1, 1, 1, 1,
0.1250772, -0.2519127, 2.443793, 1, 1, 1, 1, 1,
0.135665, 2.052419, -1.330482, 1, 1, 1, 1, 1,
0.1385078, 0.4527815, 0.9800453, 1, 1, 1, 1, 1,
0.1404193, -0.4749903, 1.8638, 1, 1, 1, 1, 1,
0.1416604, 1.085227, 0.4199732, 1, 1, 1, 1, 1,
0.1501681, 0.317502, 1.08924, 0, 0, 1, 1, 1,
0.1505328, 0.2613566, 2.109774, 1, 0, 0, 1, 1,
0.150598, -0.1015437, 3.062553, 1, 0, 0, 1, 1,
0.1566427, 0.7321015, 1.656897, 1, 0, 0, 1, 1,
0.1569112, -1.772321, 3.202925, 1, 0, 0, 1, 1,
0.1570073, -0.08361436, 2.808583, 1, 0, 0, 1, 1,
0.1570123, -0.3816011, 3.60848, 0, 0, 0, 1, 1,
0.1575085, -0.9953425, 1.73398, 0, 0, 0, 1, 1,
0.1685954, -1.585105, 3.37543, 0, 0, 0, 1, 1,
0.1692511, -0.5711264, 3.61526, 0, 0, 0, 1, 1,
0.1703942, -1.084042, 2.687958, 0, 0, 0, 1, 1,
0.1730088, 0.7659029, -0.9937695, 0, 0, 0, 1, 1,
0.177534, 0.480581, 2.139511, 0, 0, 0, 1, 1,
0.1790079, -1.935151, 3.480068, 1, 1, 1, 1, 1,
0.1855947, -0.8487522, 2.492879, 1, 1, 1, 1, 1,
0.1861941, -1.022522, 4.056797, 1, 1, 1, 1, 1,
0.1873652, -0.5809788, 2.604301, 1, 1, 1, 1, 1,
0.187609, 1.851127, 0.4046373, 1, 1, 1, 1, 1,
0.187641, -0.2700773, 1.650996, 1, 1, 1, 1, 1,
0.1907132, 1.170805, 1.482231, 1, 1, 1, 1, 1,
0.1936668, 0.706104, 0.1072722, 1, 1, 1, 1, 1,
0.1942146, 0.8274727, -1.478845, 1, 1, 1, 1, 1,
0.2047177, 0.2756339, -0.399415, 1, 1, 1, 1, 1,
0.2083376, 0.6231514, 0.7997363, 1, 1, 1, 1, 1,
0.2085849, -2.184404, 3.413349, 1, 1, 1, 1, 1,
0.2113367, -0.3055057, 2.920144, 1, 1, 1, 1, 1,
0.2156566, 0.5421149, 2.027599, 1, 1, 1, 1, 1,
0.2206665, 0.1554883, 1.727483, 1, 1, 1, 1, 1,
0.2226914, -0.7516775, 2.124504, 0, 0, 1, 1, 1,
0.2254568, -0.1002091, 2.218643, 1, 0, 0, 1, 1,
0.2264835, -0.2858368, 1.751846, 1, 0, 0, 1, 1,
0.2275072, -0.9002298, 1.719157, 1, 0, 0, 1, 1,
0.229297, -0.4826885, 4.15345, 1, 0, 0, 1, 1,
0.2316418, 1.063518, 0.5427545, 1, 0, 0, 1, 1,
0.2328638, -2.365856, 2.120739, 0, 0, 0, 1, 1,
0.234946, 0.5975276, 1.193042, 0, 0, 0, 1, 1,
0.2370037, -1.705957, 3.559882, 0, 0, 0, 1, 1,
0.2393848, 1.46581, 1.094406, 0, 0, 0, 1, 1,
0.2409913, -1.428612, 2.106724, 0, 0, 0, 1, 1,
0.2544809, 0.6019117, 0.9223546, 0, 0, 0, 1, 1,
0.2551739, -1.315466, 1.978233, 0, 0, 0, 1, 1,
0.2634265, -1.932954, 4.19733, 1, 1, 1, 1, 1,
0.2646153, 0.8966996, -0.965148, 1, 1, 1, 1, 1,
0.2687398, 0.5105191, 1.22068, 1, 1, 1, 1, 1,
0.2768609, 0.9297926, -1.548732, 1, 1, 1, 1, 1,
0.2774522, -0.3171992, 1.308733, 1, 1, 1, 1, 1,
0.2832143, 0.215561, 1.436804, 1, 1, 1, 1, 1,
0.2835864, 0.7955027, -0.1284175, 1, 1, 1, 1, 1,
0.2915154, 0.07222625, -0.3015696, 1, 1, 1, 1, 1,
0.2948893, -0.3454123, 1.887139, 1, 1, 1, 1, 1,
0.3003599, -0.05625075, 3.750786, 1, 1, 1, 1, 1,
0.3074397, 0.4191882, -0.6033292, 1, 1, 1, 1, 1,
0.3104167, -0.9090896, 2.786317, 1, 1, 1, 1, 1,
0.3121386, -0.1533743, 2.729338, 1, 1, 1, 1, 1,
0.3121541, 0.6087282, -0.6901563, 1, 1, 1, 1, 1,
0.3129642, 0.9257408, 0.4949124, 1, 1, 1, 1, 1,
0.3137934, 1.972175, -1.304889, 0, 0, 1, 1, 1,
0.313994, -0.1372576, 1.906054, 1, 0, 0, 1, 1,
0.3149541, -0.3489216, 2.341978, 1, 0, 0, 1, 1,
0.3166818, 1.566235, -0.8714159, 1, 0, 0, 1, 1,
0.3175599, -0.007951219, 1.19999, 1, 0, 0, 1, 1,
0.3180844, -0.4460698, 2.026531, 1, 0, 0, 1, 1,
0.3184453, 0.3531038, 0.2766005, 0, 0, 0, 1, 1,
0.318884, 0.04327645, 3.055324, 0, 0, 0, 1, 1,
0.3206708, -0.1664742, 1.853942, 0, 0, 0, 1, 1,
0.3207631, 1.507797, -0.005858793, 0, 0, 0, 1, 1,
0.3213049, -1.136978, 1.675968, 0, 0, 0, 1, 1,
0.3251379, -0.6743513, 2.31477, 0, 0, 0, 1, 1,
0.3267651, 0.1613995, 1.969473, 0, 0, 0, 1, 1,
0.3306028, -0.8801271, 2.792417, 1, 1, 1, 1, 1,
0.3317958, -1.25382, 3.201072, 1, 1, 1, 1, 1,
0.3339762, 1.013156, 1.345729, 1, 1, 1, 1, 1,
0.3347981, -0.3100556, 0.7371397, 1, 1, 1, 1, 1,
0.3366615, 0.4007224, 1.292263, 1, 1, 1, 1, 1,
0.339817, -1.021809, 2.810465, 1, 1, 1, 1, 1,
0.3413037, 0.700299, 1.161141, 1, 1, 1, 1, 1,
0.341804, -0.7475321, 2.820811, 1, 1, 1, 1, 1,
0.3420202, -0.665826, 3.94745, 1, 1, 1, 1, 1,
0.3442584, 0.217315, 0.2792827, 1, 1, 1, 1, 1,
0.3467126, -0.2027202, 1.814933, 1, 1, 1, 1, 1,
0.3486451, 2.601428, 0.7464393, 1, 1, 1, 1, 1,
0.3486778, 0.001678219, 1.488316, 1, 1, 1, 1, 1,
0.3495201, 0.4558641, 0.1007899, 1, 1, 1, 1, 1,
0.3503997, -2.369588, 1.774019, 1, 1, 1, 1, 1,
0.3565887, 0.09427974, 0.7547433, 0, 0, 1, 1, 1,
0.3582734, 0.2238334, 0.3826131, 1, 0, 0, 1, 1,
0.3599882, 0.7726792, 0.9826738, 1, 0, 0, 1, 1,
0.360497, -2.094223, 1.741141, 1, 0, 0, 1, 1,
0.3622315, 0.3346719, 0.2299745, 1, 0, 0, 1, 1,
0.3636065, 0.7919043, 0.8065567, 1, 0, 0, 1, 1,
0.3643677, -0.2997857, 1.518763, 0, 0, 0, 1, 1,
0.3670069, -1.018162, 3.13518, 0, 0, 0, 1, 1,
0.3736422, 0.3780347, 1.198032, 0, 0, 0, 1, 1,
0.3744805, 0.3173767, -0.5793024, 0, 0, 0, 1, 1,
0.3747204, 0.4502156, 0.7945047, 0, 0, 0, 1, 1,
0.3754784, -0.8917927, 1.423151, 0, 0, 0, 1, 1,
0.3764023, -1.306638, 4.60167, 0, 0, 0, 1, 1,
0.3785892, 0.4439868, 1.09495, 1, 1, 1, 1, 1,
0.3791158, -2.187982, 3.643158, 1, 1, 1, 1, 1,
0.3805471, 1.492169, 0.802321, 1, 1, 1, 1, 1,
0.3807395, 0.4957018, 1.407731, 1, 1, 1, 1, 1,
0.3829846, 1.487906, 0.0112523, 1, 1, 1, 1, 1,
0.384848, -0.8072866, 3.143815, 1, 1, 1, 1, 1,
0.388502, -1.225525, 3.963085, 1, 1, 1, 1, 1,
0.3943807, -0.663804, 2.616807, 1, 1, 1, 1, 1,
0.3992819, -0.1595637, 0.885198, 1, 1, 1, 1, 1,
0.4029243, -1.51622, 2.288895, 1, 1, 1, 1, 1,
0.4106714, 0.1892586, 1.117753, 1, 1, 1, 1, 1,
0.4116091, 2.177536, 0.5638565, 1, 1, 1, 1, 1,
0.4170202, 0.1359925, 1.250583, 1, 1, 1, 1, 1,
0.4173759, -0.5461076, 3.85222, 1, 1, 1, 1, 1,
0.4183325, 1.270823, 0.4305405, 1, 1, 1, 1, 1,
0.4215685, -0.5271751, 3.170355, 0, 0, 1, 1, 1,
0.4255261, -0.1423257, 1.148024, 1, 0, 0, 1, 1,
0.4306383, 1.353226, -0.7820958, 1, 0, 0, 1, 1,
0.4329347, -1.487852, 3.414729, 1, 0, 0, 1, 1,
0.434076, 1.090951, 0.7036887, 1, 0, 0, 1, 1,
0.4380542, 0.2870622, 2.581695, 1, 0, 0, 1, 1,
0.4398237, -2.14423, 2.774188, 0, 0, 0, 1, 1,
0.4430038, 0.351377, -0.3762275, 0, 0, 0, 1, 1,
0.446124, 1.695318, 0.6972289, 0, 0, 0, 1, 1,
0.4513859, -1.320722, 3.964746, 0, 0, 0, 1, 1,
0.4530403, 0.02483093, 1.195031, 0, 0, 0, 1, 1,
0.4571013, -0.6618889, 1.094375, 0, 0, 0, 1, 1,
0.4572703, 0.3725685, 1.690646, 0, 0, 0, 1, 1,
0.4581285, -1.053896, 2.04583, 1, 1, 1, 1, 1,
0.460485, 0.6031597, 0.1745264, 1, 1, 1, 1, 1,
0.4634751, -0.5537775, 1.684714, 1, 1, 1, 1, 1,
0.4647541, 0.05776861, 1.038977, 1, 1, 1, 1, 1,
0.4651432, -0.7127813, 1.791644, 1, 1, 1, 1, 1,
0.4653935, 0.277582, 1.061766, 1, 1, 1, 1, 1,
0.4666828, 0.8290449, 0.5648018, 1, 1, 1, 1, 1,
0.4697796, 0.2661732, 2.725733, 1, 1, 1, 1, 1,
0.4737603, -0.1513404, 2.18958, 1, 1, 1, 1, 1,
0.474112, -0.3480209, 3.296444, 1, 1, 1, 1, 1,
0.4805135, 0.3215826, 1.590752, 1, 1, 1, 1, 1,
0.4806192, -1.127241, 1.150334, 1, 1, 1, 1, 1,
0.4873307, -1.329203, 2.228652, 1, 1, 1, 1, 1,
0.488665, 0.6627086, 2.282161, 1, 1, 1, 1, 1,
0.4906535, -0.1102088, 2.566044, 1, 1, 1, 1, 1,
0.4971468, 0.7648619, -0.9883432, 0, 0, 1, 1, 1,
0.497346, -0.1240802, -0.1982927, 1, 0, 0, 1, 1,
0.4988057, 0.4928189, 2.148007, 1, 0, 0, 1, 1,
0.5024868, 0.03082761, 1.437631, 1, 0, 0, 1, 1,
0.5025561, 1.238024, 0.2449436, 1, 0, 0, 1, 1,
0.5043185, -0.7739758, 1.778652, 1, 0, 0, 1, 1,
0.5080655, -1.174942, 3.819613, 0, 0, 0, 1, 1,
0.5091902, 0.1077912, 1.817311, 0, 0, 0, 1, 1,
0.5112805, -0.6955108, 3.034888, 0, 0, 0, 1, 1,
0.5149359, -0.7241547, 3.120035, 0, 0, 0, 1, 1,
0.517892, -0.9975373, 2.195701, 0, 0, 0, 1, 1,
0.5208557, 0.9573122, 0.2845949, 0, 0, 0, 1, 1,
0.5263988, 0.1540518, 1.490115, 0, 0, 0, 1, 1,
0.527931, -1.164548, 1.674079, 1, 1, 1, 1, 1,
0.5323572, 0.2007909, 1.377526, 1, 1, 1, 1, 1,
0.5337349, 0.07382581, 1.941375, 1, 1, 1, 1, 1,
0.5475364, 0.7247478, -0.01325212, 1, 1, 1, 1, 1,
0.5482161, 2.112074, -0.806159, 1, 1, 1, 1, 1,
0.5509409, -1.700643, 2.427367, 1, 1, 1, 1, 1,
0.5535353, 0.7074031, 1.018473, 1, 1, 1, 1, 1,
0.5797307, -0.1768495, 1.926298, 1, 1, 1, 1, 1,
0.583666, 0.3252167, 1.332874, 1, 1, 1, 1, 1,
0.5881379, 0.504899, 0.4699746, 1, 1, 1, 1, 1,
0.5921303, 0.2284807, 0.5523683, 1, 1, 1, 1, 1,
0.5933583, -0.3751466, 0.9212492, 1, 1, 1, 1, 1,
0.5951455, -0.6590022, 3.078658, 1, 1, 1, 1, 1,
0.5964571, 1.088568, -0.2075216, 1, 1, 1, 1, 1,
0.5984846, 0.0111419, -0.06902844, 1, 1, 1, 1, 1,
0.5997111, -0.02635696, 0.01491773, 0, 0, 1, 1, 1,
0.6028103, 0.7397085, 2.08053, 1, 0, 0, 1, 1,
0.6030653, 1.316553, 0.8624958, 1, 0, 0, 1, 1,
0.6032414, -0.8685323, 0.9736795, 1, 0, 0, 1, 1,
0.6091845, -0.08641312, 1.939701, 1, 0, 0, 1, 1,
0.612381, -0.05722839, 0.8927801, 1, 0, 0, 1, 1,
0.6125023, -3.448982, 4.438846, 0, 0, 0, 1, 1,
0.6152295, 2.119098, 0.2917512, 0, 0, 0, 1, 1,
0.619315, -0.7129574, 3.629017, 0, 0, 0, 1, 1,
0.6205139, 0.6759352, 0.1578252, 0, 0, 0, 1, 1,
0.6231462, -1.433145, 1.019765, 0, 0, 0, 1, 1,
0.6274619, 0.3287773, 0.7777129, 0, 0, 0, 1, 1,
0.631996, 0.9723045, 0.8462198, 0, 0, 0, 1, 1,
0.6346064, -0.4559963, -0.3381257, 1, 1, 1, 1, 1,
0.6381139, 0.4435134, -0.6342072, 1, 1, 1, 1, 1,
0.6389096, 1.227491, 0.9462124, 1, 1, 1, 1, 1,
0.6412038, 0.8225052, -0.1223301, 1, 1, 1, 1, 1,
0.6441497, 0.53335, 1.239969, 1, 1, 1, 1, 1,
0.645448, -0.4763204, 1.266292, 1, 1, 1, 1, 1,
0.6600414, 0.6196666, 1.37984, 1, 1, 1, 1, 1,
0.6621284, 1.505402, 0.5118584, 1, 1, 1, 1, 1,
0.665594, 1.036464, 1.26182, 1, 1, 1, 1, 1,
0.6668057, -0.5505211, 1.72851, 1, 1, 1, 1, 1,
0.6705999, 1.48413, 1.235727, 1, 1, 1, 1, 1,
0.6708142, 0.401819, 1.416499, 1, 1, 1, 1, 1,
0.6809816, -0.4541025, 2.028569, 1, 1, 1, 1, 1,
0.6858267, 0.3641195, 0.8621759, 1, 1, 1, 1, 1,
0.6864871, -0.5886815, 2.162103, 1, 1, 1, 1, 1,
0.6870586, -0.1399533, 1.353909, 0, 0, 1, 1, 1,
0.6870916, -0.3039654, 2.006772, 1, 0, 0, 1, 1,
0.690026, 0.3059005, 1.648165, 1, 0, 0, 1, 1,
0.6910885, -1.346353, 3.620857, 1, 0, 0, 1, 1,
0.7013445, 0.4561169, -0.3718922, 1, 0, 0, 1, 1,
0.7041451, 1.456667, -0.3770936, 1, 0, 0, 1, 1,
0.7046576, 1.576883, -0.8801409, 0, 0, 0, 1, 1,
0.7076083, 0.168969, 0.7868681, 0, 0, 0, 1, 1,
0.7139919, -0.4290287, 1.394644, 0, 0, 0, 1, 1,
0.7156815, -1.123111, 1.377028, 0, 0, 0, 1, 1,
0.7157527, -1.24926, 2.350818, 0, 0, 0, 1, 1,
0.7178429, -1.716783, 2.640237, 0, 0, 0, 1, 1,
0.7194107, -2.088209, 3.276168, 0, 0, 0, 1, 1,
0.7230172, -0.01068741, 2.288284, 1, 1, 1, 1, 1,
0.7236738, 0.7841411, 1.135835, 1, 1, 1, 1, 1,
0.7264279, -0.2442517, 2.395006, 1, 1, 1, 1, 1,
0.7301323, -1.457607, 3.522107, 1, 1, 1, 1, 1,
0.7347805, 0.3264567, 1.945768, 1, 1, 1, 1, 1,
0.7373261, -1.66408, 3.327188, 1, 1, 1, 1, 1,
0.7425236, -0.6532944, 0.8606008, 1, 1, 1, 1, 1,
0.7457667, -0.947553, 3.581433, 1, 1, 1, 1, 1,
0.7486842, 0.6777231, 1.58924, 1, 1, 1, 1, 1,
0.753727, 0.8653553, 1.279997, 1, 1, 1, 1, 1,
0.7559338, 0.9289541, 1.326064, 1, 1, 1, 1, 1,
0.764249, 0.8557534, 1.10229, 1, 1, 1, 1, 1,
0.769121, 2.132861, 0.7959495, 1, 1, 1, 1, 1,
0.7698016, -0.5452589, 3.294067, 1, 1, 1, 1, 1,
0.7724265, 0.3277838, 0.4270595, 1, 1, 1, 1, 1,
0.7728936, 0.04344575, 1.664347, 0, 0, 1, 1, 1,
0.7742021, -0.3792548, 2.439842, 1, 0, 0, 1, 1,
0.7747166, -0.03788208, 2.407873, 1, 0, 0, 1, 1,
0.7786308, 0.4786929, 2.160498, 1, 0, 0, 1, 1,
0.7827875, -0.4114163, 1.599467, 1, 0, 0, 1, 1,
0.7832921, -0.9153472, 2.125271, 1, 0, 0, 1, 1,
0.7844797, -0.2885347, 1.70059, 0, 0, 0, 1, 1,
0.7862347, -1.066387, 2.625626, 0, 0, 0, 1, 1,
0.793081, 0.4576644, -0.3409879, 0, 0, 0, 1, 1,
0.7945294, 0.7019153, -0.01017073, 0, 0, 0, 1, 1,
0.7981982, -0.166929, 2.18071, 0, 0, 0, 1, 1,
0.799441, -2.348873, 2.97746, 0, 0, 0, 1, 1,
0.8018422, -1.290033, 2.827311, 0, 0, 0, 1, 1,
0.8108877, -1.075987, 4.961705, 1, 1, 1, 1, 1,
0.8128085, 0.9172721, 1.625313, 1, 1, 1, 1, 1,
0.8135468, -0.6980506, 2.000536, 1, 1, 1, 1, 1,
0.8187659, 0.1035879, 0.6010733, 1, 1, 1, 1, 1,
0.8212242, 1.526291, 0.6659626, 1, 1, 1, 1, 1,
0.824544, -0.4163951, 2.476604, 1, 1, 1, 1, 1,
0.8318769, -0.4112599, 2.332234, 1, 1, 1, 1, 1,
0.8406719, 0.0974052, 0.9229416, 1, 1, 1, 1, 1,
0.8450667, -2.225259, 0.8681702, 1, 1, 1, 1, 1,
0.8465921, -1.64667, 2.722861, 1, 1, 1, 1, 1,
0.8476301, 0.5877517, 0.2528219, 1, 1, 1, 1, 1,
0.8500344, 0.2161979, 0.6594661, 1, 1, 1, 1, 1,
0.8512037, -0.3047414, 2.633889, 1, 1, 1, 1, 1,
0.8567766, -0.9496303, 3.538774, 1, 1, 1, 1, 1,
0.8595722, -0.8817954, 2.245143, 1, 1, 1, 1, 1,
0.8609506, -0.08712336, 1.529713, 0, 0, 1, 1, 1,
0.8646399, -0.4260422, -0.6456456, 1, 0, 0, 1, 1,
0.8663068, 0.1873355, 2.887862, 1, 0, 0, 1, 1,
0.880334, -1.73045, 1.92266, 1, 0, 0, 1, 1,
0.8881043, -0.7546785, 3.480725, 1, 0, 0, 1, 1,
0.8891958, -0.4939407, 1.548128, 1, 0, 0, 1, 1,
0.8907955, -0.4966547, 3.303493, 0, 0, 0, 1, 1,
0.8915241, -0.1931624, 0.9251553, 0, 0, 0, 1, 1,
0.9070299, 0.4460868, 0.7662271, 0, 0, 0, 1, 1,
0.9120584, 1.342981, 0.3926399, 0, 0, 0, 1, 1,
0.9145192, 0.5080679, 0.575564, 0, 0, 0, 1, 1,
0.9190191, -2.104095, 3.804707, 0, 0, 0, 1, 1,
0.9216347, 0.0810915, 2.365956, 0, 0, 0, 1, 1,
0.9255903, -1.413417, 1.592815, 1, 1, 1, 1, 1,
0.9271905, -0.2628713, 2.990029, 1, 1, 1, 1, 1,
0.9306809, -1.725019, 1.368454, 1, 1, 1, 1, 1,
0.9334378, -0.05842999, 1.46975, 1, 1, 1, 1, 1,
0.935472, -0.8385597, 1.956643, 1, 1, 1, 1, 1,
0.9461066, 1.724978, 1.224743, 1, 1, 1, 1, 1,
0.9476848, 0.2929004, 2.191656, 1, 1, 1, 1, 1,
0.9537013, -1.068166, 0.3877098, 1, 1, 1, 1, 1,
0.9540197, 0.2763248, 2.42858, 1, 1, 1, 1, 1,
0.9589284, -2.787426, 1.055687, 1, 1, 1, 1, 1,
0.9604167, -1.430408, 2.885138, 1, 1, 1, 1, 1,
0.9635153, -0.6074592, 4.536316, 1, 1, 1, 1, 1,
0.9709334, -0.1961789, 1.570758, 1, 1, 1, 1, 1,
0.9763572, 2.224794, 0.9528686, 1, 1, 1, 1, 1,
0.9799489, 1.199811, 1.126477, 1, 1, 1, 1, 1,
0.9824868, -0.633274, 0.9706965, 0, 0, 1, 1, 1,
0.9838644, 0.1573992, -0.04563807, 1, 0, 0, 1, 1,
0.9875042, -1.336091, 2.620899, 1, 0, 0, 1, 1,
0.992336, -1.979993, 1.780851, 1, 0, 0, 1, 1,
0.9939397, -0.2650144, 1.487219, 1, 0, 0, 1, 1,
0.994105, -0.04751321, 1.316211, 1, 0, 0, 1, 1,
0.9960661, 1.002555, 2.675287, 0, 0, 0, 1, 1,
0.9969829, -1.193373, 2.070908, 0, 0, 0, 1, 1,
1.007561, 0.9606718, 0.7478731, 0, 0, 0, 1, 1,
1.008656, -0.1103667, 3.355041, 0, 0, 0, 1, 1,
1.009058, 0.6405097, 0.4539484, 0, 0, 0, 1, 1,
1.009323, -0.816882, 1.516595, 0, 0, 0, 1, 1,
1.021322, -0.5434222, 2.25959, 0, 0, 0, 1, 1,
1.021549, 0.132422, 0.1687483, 1, 1, 1, 1, 1,
1.034523, -0.08255299, 1.812156, 1, 1, 1, 1, 1,
1.034947, 3.012463, -0.1779151, 1, 1, 1, 1, 1,
1.040536, -1.205671, 2.334777, 1, 1, 1, 1, 1,
1.042809, 0.7292153, 0.8557255, 1, 1, 1, 1, 1,
1.045442, 0.006568822, 1.774263, 1, 1, 1, 1, 1,
1.049485, 1.347152, 0.4469775, 1, 1, 1, 1, 1,
1.049564, 2.115729, 1.570781, 1, 1, 1, 1, 1,
1.053329, -1.140666, 2.60477, 1, 1, 1, 1, 1,
1.054528, -0.7319075, 2.28083, 1, 1, 1, 1, 1,
1.057078, -0.07256256, 2.39961, 1, 1, 1, 1, 1,
1.07696, -1.602883, 3.594802, 1, 1, 1, 1, 1,
1.077052, 1.027443, -0.3445385, 1, 1, 1, 1, 1,
1.082859, -1.285522, 1.554846, 1, 1, 1, 1, 1,
1.084429, 0.123625, 2.30705, 1, 1, 1, 1, 1,
1.085288, 0.8405754, 0.8445058, 0, 0, 1, 1, 1,
1.089653, -1.136647, 4.112602, 1, 0, 0, 1, 1,
1.095628, -1.122362, 2.596086, 1, 0, 0, 1, 1,
1.099719, -0.4695035, 1.209684, 1, 0, 0, 1, 1,
1.103839, 1.048936, 0.9105769, 1, 0, 0, 1, 1,
1.104169, -2.36482, 3.042268, 1, 0, 0, 1, 1,
1.104622, 0.5276933, 1.466498, 0, 0, 0, 1, 1,
1.120736, -1.901808, 1.473246, 0, 0, 0, 1, 1,
1.136926, -0.4491382, 1.031199, 0, 0, 0, 1, 1,
1.147273, 0.6471552, 0.7212445, 0, 0, 0, 1, 1,
1.147917, 0.7834762, -0.7936026, 0, 0, 0, 1, 1,
1.156649, 0.9739803, 0.2235922, 0, 0, 0, 1, 1,
1.165971, -0.07585145, 0.9029728, 0, 0, 0, 1, 1,
1.166818, -0.24962, 1.595243, 1, 1, 1, 1, 1,
1.170159, 0.3797568, 2.157102, 1, 1, 1, 1, 1,
1.176934, 2.634792, -0.7731601, 1, 1, 1, 1, 1,
1.178587, 0.4736263, -0.2277298, 1, 1, 1, 1, 1,
1.184495, -1.328685, 2.697387, 1, 1, 1, 1, 1,
1.189608, 0.5662293, 1.272527, 1, 1, 1, 1, 1,
1.193846, 1.209134, 2.01109, 1, 1, 1, 1, 1,
1.196463, 1.700615, 1.067742, 1, 1, 1, 1, 1,
1.196504, 1.247803, 0.350128, 1, 1, 1, 1, 1,
1.197711, 0.02486867, 0.4501673, 1, 1, 1, 1, 1,
1.201771, -0.3479461, 0.298988, 1, 1, 1, 1, 1,
1.209989, 0.3880082, -0.2191429, 1, 1, 1, 1, 1,
1.21334, 1.171897, -0.7737992, 1, 1, 1, 1, 1,
1.219906, -0.8956963, 1.664553, 1, 1, 1, 1, 1,
1.230724, -0.6303641, 3.388827, 1, 1, 1, 1, 1,
1.235012, 0.4656727, 0.8244141, 0, 0, 1, 1, 1,
1.241787, -0.5400383, 3.047925, 1, 0, 0, 1, 1,
1.244627, 0.1916532, 2.676939, 1, 0, 0, 1, 1,
1.250048, 1.178855, 1.90236, 1, 0, 0, 1, 1,
1.250741, -0.7771518, 1.789037, 1, 0, 0, 1, 1,
1.267815, -1.068341, 3.17673, 1, 0, 0, 1, 1,
1.285978, -0.006762858, 2.178811, 0, 0, 0, 1, 1,
1.288296, 0.5182074, 0.7011335, 0, 0, 0, 1, 1,
1.302118, 0.3652996, 0.4466328, 0, 0, 0, 1, 1,
1.31024, -1.316913, 1.823349, 0, 0, 0, 1, 1,
1.311121, 0.3232802, 1.257086, 0, 0, 0, 1, 1,
1.311947, -0.3709619, 1.625757, 0, 0, 0, 1, 1,
1.312267, -0.6589449, 3.562169, 0, 0, 0, 1, 1,
1.327025, 0.7059869, 1.174073, 1, 1, 1, 1, 1,
1.354114, -0.2272812, 2.841659, 1, 1, 1, 1, 1,
1.366533, 0.1655984, 3.422344, 1, 1, 1, 1, 1,
1.374597, -1.746351, 2.159765, 1, 1, 1, 1, 1,
1.377076, 0.07910206, 1.672257, 1, 1, 1, 1, 1,
1.380415, 0.09776783, 0.1916665, 1, 1, 1, 1, 1,
1.383457, -1.323299, 3.10177, 1, 1, 1, 1, 1,
1.38681, 1.227496, 1.29773, 1, 1, 1, 1, 1,
1.389041, 0.04176113, 1.623214, 1, 1, 1, 1, 1,
1.389405, -0.4471705, 4.38946, 1, 1, 1, 1, 1,
1.393089, 1.785576, 2.660516, 1, 1, 1, 1, 1,
1.395839, 0.7701063, 2.054793, 1, 1, 1, 1, 1,
1.397078, -0.201042, -0.7306454, 1, 1, 1, 1, 1,
1.400289, -0.7584764, 3.338722, 1, 1, 1, 1, 1,
1.402541, -0.3973204, 2.481153, 1, 1, 1, 1, 1,
1.405024, -0.9565889, 3.116424, 0, 0, 1, 1, 1,
1.40757, 0.5106939, 2.062238, 1, 0, 0, 1, 1,
1.409255, 0.7038819, 1.458924, 1, 0, 0, 1, 1,
1.411642, -0.8913811, 2.393905, 1, 0, 0, 1, 1,
1.41787, -0.4679188, 1.594225, 1, 0, 0, 1, 1,
1.419322, 0.6325049, 1.158893, 1, 0, 0, 1, 1,
1.44629, -0.2607912, 1.896239, 0, 0, 0, 1, 1,
1.447206, 0.4357165, 1.190044, 0, 0, 0, 1, 1,
1.449459, 0.5908223, 0.4530997, 0, 0, 0, 1, 1,
1.453955, 1.219818, 1.064749, 0, 0, 0, 1, 1,
1.455038, 0.5060859, 2.15555, 0, 0, 0, 1, 1,
1.472364, 0.9681239, 0.01142048, 0, 0, 0, 1, 1,
1.51256, -1.23885, 2.345284, 0, 0, 0, 1, 1,
1.514135, -1.890746, 1.399404, 1, 1, 1, 1, 1,
1.518341, -0.2738771, 2.434286, 1, 1, 1, 1, 1,
1.519446, -0.1947639, 1.579702, 1, 1, 1, 1, 1,
1.523772, -0.7135073, 0.8228453, 1, 1, 1, 1, 1,
1.533442, 0.5464034, 2.15473, 1, 1, 1, 1, 1,
1.535924, -0.1840622, 1.944828, 1, 1, 1, 1, 1,
1.550685, 0.3144096, 1.129479, 1, 1, 1, 1, 1,
1.556337, 0.5022414, 1.487129, 1, 1, 1, 1, 1,
1.557207, 0.5792689, 1.757943, 1, 1, 1, 1, 1,
1.570379, 1.006992, 1.006081, 1, 1, 1, 1, 1,
1.570963, 0.2205904, 1.24619, 1, 1, 1, 1, 1,
1.585176, -0.2712688, 1.631052, 1, 1, 1, 1, 1,
1.592584, -0.9023322, 2.042025, 1, 1, 1, 1, 1,
1.600198, -0.3899965, -1.163152, 1, 1, 1, 1, 1,
1.60397, -0.1647601, 1.285717, 1, 1, 1, 1, 1,
1.608278, 0.0302179, 0.5910732, 0, 0, 1, 1, 1,
1.61121, -0.9380934, 2.050623, 1, 0, 0, 1, 1,
1.627649, 0.6009223, 1.777261, 1, 0, 0, 1, 1,
1.630763, 0.7271768, 1.384025, 1, 0, 0, 1, 1,
1.661378, 0.7301253, -0.6413671, 1, 0, 0, 1, 1,
1.672491, -0.3329264, 3.268359, 1, 0, 0, 1, 1,
1.672829, 0.7255581, 1.776418, 0, 0, 0, 1, 1,
1.676452, 1.677033, 1.978528, 0, 0, 0, 1, 1,
1.688441, 0.355146, 1.092056, 0, 0, 0, 1, 1,
1.691466, 0.104535, 2.058933, 0, 0, 0, 1, 1,
1.696329, -1.838098, 4.51526, 0, 0, 0, 1, 1,
1.704247, 1.287597, -1.517008, 0, 0, 0, 1, 1,
1.705527, 2.231523, 0.2373316, 0, 0, 0, 1, 1,
1.706944, 1.263159, 0.3323769, 1, 1, 1, 1, 1,
1.714678, -0.05620903, 1.64782, 1, 1, 1, 1, 1,
1.719013, 0.74475, 0.4759882, 1, 1, 1, 1, 1,
1.7277, -1.238646, 3.040698, 1, 1, 1, 1, 1,
1.729508, -0.33114, 2.364902, 1, 1, 1, 1, 1,
1.751208, -0.1010742, 2.238552, 1, 1, 1, 1, 1,
1.767397, -0.345503, 1.512709, 1, 1, 1, 1, 1,
1.806894, -1.087593, 2.345482, 1, 1, 1, 1, 1,
1.820875, 0.9218053, 1.313666, 1, 1, 1, 1, 1,
1.84468, -0.1957854, 0.1558699, 1, 1, 1, 1, 1,
1.854217, -1.132079, 2.605161, 1, 1, 1, 1, 1,
1.857785, 0.8329444, 2.567424, 1, 1, 1, 1, 1,
1.865104, 0.3799488, 1.50761, 1, 1, 1, 1, 1,
1.877308, 0.01737902, 0.8846408, 1, 1, 1, 1, 1,
1.879477, 0.3832514, 3.543094, 1, 1, 1, 1, 1,
1.880324, -0.803054, 1.984221, 0, 0, 1, 1, 1,
1.912644, -1.469247, 3.564059, 1, 0, 0, 1, 1,
1.914591, -2.115274, 2.13868, 1, 0, 0, 1, 1,
1.925004, -0.8982525, 3.215902, 1, 0, 0, 1, 1,
1.956057, -2.533628, 1.402252, 1, 0, 0, 1, 1,
1.97529, 1.348472, 1.403914, 1, 0, 0, 1, 1,
1.981262, 0.1068388, 0.538565, 0, 0, 0, 1, 1,
1.990882, -0.1259306, 0.6423479, 0, 0, 0, 1, 1,
2.064908, -1.763721, 2.776448, 0, 0, 0, 1, 1,
2.082755, 0.5733854, -0.706179, 0, 0, 0, 1, 1,
2.111852, 0.9506473, 1.664812, 0, 0, 0, 1, 1,
2.11937, -0.5676054, 1.680699, 0, 0, 0, 1, 1,
2.121565, -0.1913384, 1.416466, 0, 0, 0, 1, 1,
2.229063, -1.361012, 2.873837, 1, 1, 1, 1, 1,
2.372021, -0.5972787, 1.617931, 1, 1, 1, 1, 1,
2.433874, 1.07134, 2.095575, 1, 1, 1, 1, 1,
2.514107, 0.8406954, 0.1100043, 1, 1, 1, 1, 1,
2.521137, 0.003465253, 1.354307, 1, 1, 1, 1, 1,
2.724816, -0.5188303, 3.326182, 1, 1, 1, 1, 1,
2.900217, -0.5536272, 2.541453, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.731768;
var distance = 34.18242;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.213527, 0.08024645, -0.3086357 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18242);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
