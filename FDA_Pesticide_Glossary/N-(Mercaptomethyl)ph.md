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
-2.960667, -1.622291, -0.9303721, 1, 0, 0, 1,
-2.921173, 1.67141, -2.015469, 1, 0.007843138, 0, 1,
-2.87191, -0.2962309, -1.436832, 1, 0.01176471, 0, 1,
-2.831896, 0.788494, -3.592869, 1, 0.01960784, 0, 1,
-2.573178, 0.8654107, -0.990817, 1, 0.02352941, 0, 1,
-2.450593, -1.088955, -0.6475734, 1, 0.03137255, 0, 1,
-2.448218, -1.94545, -1.417665, 1, 0.03529412, 0, 1,
-2.364239, -2.516982, -2.695737, 1, 0.04313726, 0, 1,
-2.356611, -0.3825594, -0.8334398, 1, 0.04705882, 0, 1,
-2.337105, -0.1154484, -2.115361, 1, 0.05490196, 0, 1,
-2.330052, 0.1204432, -0.6001785, 1, 0.05882353, 0, 1,
-2.312311, -0.5636909, -2.139888, 1, 0.06666667, 0, 1,
-2.272649, 0.39226, -3.8678, 1, 0.07058824, 0, 1,
-2.271577, -0.4648804, -1.892597, 1, 0.07843138, 0, 1,
-2.202342, 1.04833, -2.269557, 1, 0.08235294, 0, 1,
-2.185202, -1.54324, -2.212333, 1, 0.09019608, 0, 1,
-2.140355, 1.598835, -1.473714, 1, 0.09411765, 0, 1,
-2.136876, 0.4857833, -1.719997, 1, 0.1019608, 0, 1,
-2.125807, 1.721636, -2.041824, 1, 0.1098039, 0, 1,
-2.124867, -2.124724, -1.999256, 1, 0.1137255, 0, 1,
-2.085942, 0.1214713, -1.548793, 1, 0.1215686, 0, 1,
-2.078773, 0.4339068, -1.78143, 1, 0.1254902, 0, 1,
-2.027311, 0.1865192, -0.0457905, 1, 0.1333333, 0, 1,
-2.015702, -2.616614, -2.624656, 1, 0.1372549, 0, 1,
-1.957485, -0.1911144, -2.829033, 1, 0.145098, 0, 1,
-1.920257, -0.1501589, -0.8379839, 1, 0.1490196, 0, 1,
-1.902231, -0.8914161, -0.7182474, 1, 0.1568628, 0, 1,
-1.893019, 0.53747, -0.3880325, 1, 0.1607843, 0, 1,
-1.887283, 1.579149, -1.283582, 1, 0.1686275, 0, 1,
-1.872968, -0.1140414, -2.063217, 1, 0.172549, 0, 1,
-1.870542, -0.6791092, -1.351247, 1, 0.1803922, 0, 1,
-1.856753, -1.268254, -0.8976672, 1, 0.1843137, 0, 1,
-1.850426, -0.1442789, -2.941678, 1, 0.1921569, 0, 1,
-1.831117, -0.2159945, -1.030251, 1, 0.1960784, 0, 1,
-1.811329, -0.1517715, -0.03944337, 1, 0.2039216, 0, 1,
-1.803165, -0.427485, -1.186865, 1, 0.2117647, 0, 1,
-1.802529, 2.288708, -1.133284, 1, 0.2156863, 0, 1,
-1.771795, -0.2353398, -1.934142, 1, 0.2235294, 0, 1,
-1.763059, 0.3094461, -0.2323585, 1, 0.227451, 0, 1,
-1.748128, 1.843714, -2.016567, 1, 0.2352941, 0, 1,
-1.746325, 0.6863559, 1.042147, 1, 0.2392157, 0, 1,
-1.745825, 1.107745, -0.945561, 1, 0.2470588, 0, 1,
-1.72172, 1.375236, -0.8480723, 1, 0.2509804, 0, 1,
-1.70749, -0.6052037, -0.8376455, 1, 0.2588235, 0, 1,
-1.703976, -2.004578, -1.495763, 1, 0.2627451, 0, 1,
-1.702655, 0.5922119, -0.4997222, 1, 0.2705882, 0, 1,
-1.681749, -0.1134739, -1.237018, 1, 0.2745098, 0, 1,
-1.674968, 0.7132509, -0.4210403, 1, 0.282353, 0, 1,
-1.657419, -0.04802766, -0.8675233, 1, 0.2862745, 0, 1,
-1.652567, -0.7321103, -3.250073, 1, 0.2941177, 0, 1,
-1.641996, -0.1803453, -1.5778, 1, 0.3019608, 0, 1,
-1.625162, -0.7139273, -3.037178, 1, 0.3058824, 0, 1,
-1.608821, 0.8712161, -2.280067, 1, 0.3137255, 0, 1,
-1.605901, 0.3907893, -1.290727, 1, 0.3176471, 0, 1,
-1.585119, 0.9458612, -0.3871823, 1, 0.3254902, 0, 1,
-1.582812, -0.5773974, -1.173447, 1, 0.3294118, 0, 1,
-1.580097, 0.02689434, -2.386211, 1, 0.3372549, 0, 1,
-1.579135, -0.9595267, -3.098915, 1, 0.3411765, 0, 1,
-1.572357, -1.500212, -3.284776, 1, 0.3490196, 0, 1,
-1.566885, -0.4042465, -1.38563, 1, 0.3529412, 0, 1,
-1.565197, -0.6887143, -0.9522128, 1, 0.3607843, 0, 1,
-1.55835, -0.1594924, 0.4765195, 1, 0.3647059, 0, 1,
-1.539352, -1.781982, -2.760142, 1, 0.372549, 0, 1,
-1.532834, -0.4869878, -2.11604, 1, 0.3764706, 0, 1,
-1.526906, 0.6387469, -1.590783, 1, 0.3843137, 0, 1,
-1.515886, 1.267812, -0.2979473, 1, 0.3882353, 0, 1,
-1.512839, -0.8704308, 0.5357499, 1, 0.3960784, 0, 1,
-1.493852, -0.7105147, -1.768139, 1, 0.4039216, 0, 1,
-1.478779, -1.230987, -2.882276, 1, 0.4078431, 0, 1,
-1.478608, -0.911579, -0.5919661, 1, 0.4156863, 0, 1,
-1.478015, -0.6045442, -2.94759, 1, 0.4196078, 0, 1,
-1.473429, 0.7941487, -0.5641344, 1, 0.427451, 0, 1,
-1.455927, 0.5509158, -2.195909, 1, 0.4313726, 0, 1,
-1.455231, -0.1583217, -0.6913841, 1, 0.4392157, 0, 1,
-1.454366, 0.6225873, -2.327971, 1, 0.4431373, 0, 1,
-1.43512, -0.3101801, -1.649144, 1, 0.4509804, 0, 1,
-1.429341, -0.8191523, -3.538639, 1, 0.454902, 0, 1,
-1.428212, -2.074331, -2.58659, 1, 0.4627451, 0, 1,
-1.400031, -0.6326059, -3.674109, 1, 0.4666667, 0, 1,
-1.397731, 1.165319, -1.463284, 1, 0.4745098, 0, 1,
-1.391693, -1.225323, -2.379704, 1, 0.4784314, 0, 1,
-1.384042, -0.1599154, -0.6869097, 1, 0.4862745, 0, 1,
-1.379994, -0.8243376, -2.022791, 1, 0.4901961, 0, 1,
-1.379927, 0.8862872, -1.725121, 1, 0.4980392, 0, 1,
-1.374952, 1.385173, 0.8992543, 1, 0.5058824, 0, 1,
-1.370262, 0.4785734, -3.077329, 1, 0.509804, 0, 1,
-1.365856, -0.1875003, -0.7316518, 1, 0.5176471, 0, 1,
-1.361076, 0.427893, -2.354939, 1, 0.5215687, 0, 1,
-1.35839, 0.4032976, -0.2435353, 1, 0.5294118, 0, 1,
-1.344723, -1.581937, -3.817545, 1, 0.5333334, 0, 1,
-1.344215, -0.6371336, -2.182817, 1, 0.5411765, 0, 1,
-1.341828, -0.3630359, -0.3302566, 1, 0.5450981, 0, 1,
-1.332178, -1.230247, -4.466429, 1, 0.5529412, 0, 1,
-1.326241, -0.9597809, -2.086299, 1, 0.5568628, 0, 1,
-1.324282, -0.1151766, -1.585534, 1, 0.5647059, 0, 1,
-1.32425, -0.9113718, -0.4812934, 1, 0.5686275, 0, 1,
-1.323556, 0.3353015, 1.116608, 1, 0.5764706, 0, 1,
-1.320545, 0.5122021, -1.68103, 1, 0.5803922, 0, 1,
-1.318535, -0.9644236, -1.445343, 1, 0.5882353, 0, 1,
-1.305606, -0.7903579, -4.094642, 1, 0.5921569, 0, 1,
-1.29753, 1.739682, -0.6741377, 1, 0.6, 0, 1,
-1.281527, -0.3503107, -1.062349, 1, 0.6078432, 0, 1,
-1.277087, 0.1320116, -0.8789871, 1, 0.6117647, 0, 1,
-1.275439, -1.972829, -2.950238, 1, 0.6196079, 0, 1,
-1.25201, 1.264452, -1.149634, 1, 0.6235294, 0, 1,
-1.236494, -0.5847687, -1.989402, 1, 0.6313726, 0, 1,
-1.219925, 0.6315453, -0.4901277, 1, 0.6352941, 0, 1,
-1.218217, -0.1580392, -1.312415, 1, 0.6431373, 0, 1,
-1.211488, -0.4268498, -2.630101, 1, 0.6470588, 0, 1,
-1.210477, 1.045614, -1.194488, 1, 0.654902, 0, 1,
-1.208501, -1.213245, 0.3525303, 1, 0.6588235, 0, 1,
-1.198809, 0.5919777, -2.365734, 1, 0.6666667, 0, 1,
-1.192715, -1.292645, -1.877487, 1, 0.6705883, 0, 1,
-1.192543, 0.5022718, -1.094816, 1, 0.6784314, 0, 1,
-1.191079, -0.0968136, -1.100529, 1, 0.682353, 0, 1,
-1.190639, -0.6563908, -1.369306, 1, 0.6901961, 0, 1,
-1.167478, 0.8441424, 0.1206387, 1, 0.6941177, 0, 1,
-1.16267, 0.6163759, -1.898867, 1, 0.7019608, 0, 1,
-1.153881, -1.612761, -2.593565, 1, 0.7098039, 0, 1,
-1.148486, 0.04202371, -2.191403, 1, 0.7137255, 0, 1,
-1.143129, -0.06667861, -0.132146, 1, 0.7215686, 0, 1,
-1.134106, -2.476334, -2.034803, 1, 0.7254902, 0, 1,
-1.1321, -0.1107805, -2.33577, 1, 0.7333333, 0, 1,
-1.127479, 0.1682083, -2.095154, 1, 0.7372549, 0, 1,
-1.127305, 1.405328, -1.905817, 1, 0.7450981, 0, 1,
-1.11727, 0.4390435, 0.7167217, 1, 0.7490196, 0, 1,
-1.116992, -1.45644, -2.826713, 1, 0.7568628, 0, 1,
-1.116578, -0.6926359, -1.599447, 1, 0.7607843, 0, 1,
-1.115063, 1.02508, -1.649082, 1, 0.7686275, 0, 1,
-1.113708, 1.224251, -0.309241, 1, 0.772549, 0, 1,
-1.112777, -0.1603132, -1.021995, 1, 0.7803922, 0, 1,
-1.110983, 0.8050719, 1.238218, 1, 0.7843137, 0, 1,
-1.104954, 0.3586336, -1.246173, 1, 0.7921569, 0, 1,
-1.100379, -0.8590264, 0.2004708, 1, 0.7960784, 0, 1,
-1.095305, -2.525424, -2.76721, 1, 0.8039216, 0, 1,
-1.089169, 1.214239, -0.6339076, 1, 0.8117647, 0, 1,
-1.083269, -0.7209703, -0.7385466, 1, 0.8156863, 0, 1,
-1.082525, -0.1909199, -1.248422, 1, 0.8235294, 0, 1,
-1.071406, 0.5361887, -0.8963481, 1, 0.827451, 0, 1,
-1.068339, -0.4538333, -2.392674, 1, 0.8352941, 0, 1,
-1.06775, 0.1629239, -0.4684437, 1, 0.8392157, 0, 1,
-1.063999, 1.597699, -1.575012, 1, 0.8470588, 0, 1,
-1.06073, -0.2279908, -1.056372, 1, 0.8509804, 0, 1,
-1.059497, 0.0260208, -1.094548, 1, 0.8588235, 0, 1,
-1.054346, -1.576217, -1.723444, 1, 0.8627451, 0, 1,
-1.051616, -0.3672994, -1.202997, 1, 0.8705882, 0, 1,
-1.050575, 0.9949504, -0.5335425, 1, 0.8745098, 0, 1,
-1.048662, -1.450445, -3.101121, 1, 0.8823529, 0, 1,
-1.048199, 0.1946509, -1.411405, 1, 0.8862745, 0, 1,
-1.038994, 0.8829986, -1.384407, 1, 0.8941177, 0, 1,
-1.038668, -0.5476479, -2.849617, 1, 0.8980392, 0, 1,
-1.031506, -0.9180869, -0.5975697, 1, 0.9058824, 0, 1,
-1.023759, 1.66449, 1.242658, 1, 0.9137255, 0, 1,
-1.016291, -0.633085, -1.616576, 1, 0.9176471, 0, 1,
-1.002576, -0.4067642, -2.479512, 1, 0.9254902, 0, 1,
-1.000976, 0.4573779, -1.858806, 1, 0.9294118, 0, 1,
-0.9961737, 0.8525039, -1.079452, 1, 0.9372549, 0, 1,
-0.9957987, -0.1790082, -2.295691, 1, 0.9411765, 0, 1,
-0.9936126, 0.443895, -1.789659, 1, 0.9490196, 0, 1,
-0.9925649, -0.7656831, -2.578819, 1, 0.9529412, 0, 1,
-0.9906853, -0.5001125, -2.245367, 1, 0.9607843, 0, 1,
-0.9851763, 0.8959373, -1.215177, 1, 0.9647059, 0, 1,
-0.9670172, 0.2759073, -1.598686, 1, 0.972549, 0, 1,
-0.9669404, -1.256612, -2.102151, 1, 0.9764706, 0, 1,
-0.9636912, -0.3464133, -1.415965, 1, 0.9843137, 0, 1,
-0.9633614, -0.3651454, -1.663757, 1, 0.9882353, 0, 1,
-0.9633167, 0.5892585, -0.2876793, 1, 0.9960784, 0, 1,
-0.9529254, 1.275784, -0.3734722, 0.9960784, 1, 0, 1,
-0.9412366, 0.910674, -1.693281, 0.9921569, 1, 0, 1,
-0.9399224, 0.473729, -1.906918, 0.9843137, 1, 0, 1,
-0.9300467, -0.09441738, -0.9468318, 0.9803922, 1, 0, 1,
-0.9282966, -0.487519, -2.148618, 0.972549, 1, 0, 1,
-0.9158508, 0.3013193, 0.6274655, 0.9686275, 1, 0, 1,
-0.909207, 0.6814724, -0.537802, 0.9607843, 1, 0, 1,
-0.9005662, 1.726903, -3.100217, 0.9568627, 1, 0, 1,
-0.8993421, -2.194444, -1.989445, 0.9490196, 1, 0, 1,
-0.8959034, 0.7926484, 0.6392411, 0.945098, 1, 0, 1,
-0.8956074, -1.896706, -1.698888, 0.9372549, 1, 0, 1,
-0.893613, 0.6910539, -1.247949, 0.9333333, 1, 0, 1,
-0.8926101, -0.5620188, -0.9571341, 0.9254902, 1, 0, 1,
-0.8869151, 1.374157, -1.788065, 0.9215686, 1, 0, 1,
-0.886085, -1.079603, -3.080417, 0.9137255, 1, 0, 1,
-0.8848023, -0.1215946, -0.6623483, 0.9098039, 1, 0, 1,
-0.8763236, -1.139928, -2.503985, 0.9019608, 1, 0, 1,
-0.8699092, 0.06920431, -2.103028, 0.8941177, 1, 0, 1,
-0.8698304, 0.2069853, -1.417062, 0.8901961, 1, 0, 1,
-0.8689427, -0.4765283, -3.190651, 0.8823529, 1, 0, 1,
-0.8636528, 1.278597, 0.386797, 0.8784314, 1, 0, 1,
-0.8576675, 0.6525567, -0.9723868, 0.8705882, 1, 0, 1,
-0.8562304, 0.847681, 1.244484, 0.8666667, 1, 0, 1,
-0.8341976, -0.5431378, -2.408019, 0.8588235, 1, 0, 1,
-0.8315994, -0.5648628, -1.457193, 0.854902, 1, 0, 1,
-0.8280739, 0.4769301, -0.3955782, 0.8470588, 1, 0, 1,
-0.821655, 1.554972, -0.06304581, 0.8431373, 1, 0, 1,
-0.8203564, 0.5162896, -1.626523, 0.8352941, 1, 0, 1,
-0.8177555, -0.1590622, -2.051657, 0.8313726, 1, 0, 1,
-0.8137212, -0.3707486, -1.872823, 0.8235294, 1, 0, 1,
-0.8108151, 1.554062, 0.2224958, 0.8196079, 1, 0, 1,
-0.8060077, 1.76281, -1.50951, 0.8117647, 1, 0, 1,
-0.8024123, 0.8591642, -1.523206, 0.8078431, 1, 0, 1,
-0.802081, 0.6129608, -3.631568, 0.8, 1, 0, 1,
-0.8015068, -0.321032, -1.325704, 0.7921569, 1, 0, 1,
-0.799365, -0.2421319, -1.31486, 0.7882353, 1, 0, 1,
-0.7992979, 0.580326, -1.30267, 0.7803922, 1, 0, 1,
-0.7961482, 0.1870352, -0.7302586, 0.7764706, 1, 0, 1,
-0.794769, 0.2052208, -0.7651899, 0.7686275, 1, 0, 1,
-0.7823496, 0.0331672, -0.9900444, 0.7647059, 1, 0, 1,
-0.7804666, 0.3009426, -1.755316, 0.7568628, 1, 0, 1,
-0.779765, -0.009893393, -2.435464, 0.7529412, 1, 0, 1,
-0.7787493, -1.278722, -2.939852, 0.7450981, 1, 0, 1,
-0.7777476, 0.8405996, -1.397975, 0.7411765, 1, 0, 1,
-0.7689346, 0.1056269, -0.4971631, 0.7333333, 1, 0, 1,
-0.767356, 1.414887, 0.0787599, 0.7294118, 1, 0, 1,
-0.7665051, 0.8260462, -2.256984, 0.7215686, 1, 0, 1,
-0.7615091, 0.3885756, 0.9329551, 0.7176471, 1, 0, 1,
-0.7607532, 0.6275227, 0.1853074, 0.7098039, 1, 0, 1,
-0.7581229, 0.4227549, -1.763809, 0.7058824, 1, 0, 1,
-0.7540538, -1.069453, -2.727499, 0.6980392, 1, 0, 1,
-0.7533168, -0.38521, -2.479713, 0.6901961, 1, 0, 1,
-0.7517377, 1.108076, -0.2248915, 0.6862745, 1, 0, 1,
-0.7501236, 0.3369654, -1.404349, 0.6784314, 1, 0, 1,
-0.7483391, -1.364492, -1.041916, 0.6745098, 1, 0, 1,
-0.7427527, -1.236317, -2.832508, 0.6666667, 1, 0, 1,
-0.7406923, 0.4786316, -1.604192, 0.6627451, 1, 0, 1,
-0.7366763, -1.047297, -1.205048, 0.654902, 1, 0, 1,
-0.7355602, 0.6266356, -1.285413, 0.6509804, 1, 0, 1,
-0.7322202, -1.391427, -2.977476, 0.6431373, 1, 0, 1,
-0.7280043, 0.06067404, -3.5624, 0.6392157, 1, 0, 1,
-0.7271899, -0.367789, 0.1151092, 0.6313726, 1, 0, 1,
-0.7256358, -0.8843402, -1.132352, 0.627451, 1, 0, 1,
-0.7208317, 1.883992, -0.3406922, 0.6196079, 1, 0, 1,
-0.7183045, -0.1752004, -0.6801494, 0.6156863, 1, 0, 1,
-0.7149212, 1.068237, -0.5039823, 0.6078432, 1, 0, 1,
-0.7059211, -0.694835, -2.012048, 0.6039216, 1, 0, 1,
-0.7028967, -0.1097244, -2.751674, 0.5960785, 1, 0, 1,
-0.6976742, -0.8152484, -3.431985, 0.5882353, 1, 0, 1,
-0.6971776, -0.6750885, -1.512904, 0.5843138, 1, 0, 1,
-0.6971413, 0.8833273, -0.2924139, 0.5764706, 1, 0, 1,
-0.6959254, -0.8390182, -2.264205, 0.572549, 1, 0, 1,
-0.6951115, -1.912258, -3.013963, 0.5647059, 1, 0, 1,
-0.6944835, 0.2213044, -3.011872, 0.5607843, 1, 0, 1,
-0.6938233, 0.2638126, -0.7851844, 0.5529412, 1, 0, 1,
-0.6907278, 2.078269, -0.9984624, 0.5490196, 1, 0, 1,
-0.6727957, -0.003479389, -0.7980251, 0.5411765, 1, 0, 1,
-0.6723397, -1.559137, -4.041926, 0.5372549, 1, 0, 1,
-0.6701073, 0.006348047, -1.730567, 0.5294118, 1, 0, 1,
-0.6629763, -1.107047, -3.559021, 0.5254902, 1, 0, 1,
-0.6592892, 1.329585, -0.8482487, 0.5176471, 1, 0, 1,
-0.6542397, 0.938062, -1.682042, 0.5137255, 1, 0, 1,
-0.6499688, 0.3058604, -1.617784, 0.5058824, 1, 0, 1,
-0.6446083, -1.443052, -2.750035, 0.5019608, 1, 0, 1,
-0.6367698, 1.101798, 0.21924, 0.4941176, 1, 0, 1,
-0.6357538, 0.1085262, -0.5302204, 0.4862745, 1, 0, 1,
-0.6326342, 0.9280176, -0.03212721, 0.4823529, 1, 0, 1,
-0.6271776, 0.831111, -0.4917332, 0.4745098, 1, 0, 1,
-0.6240416, 0.5825846, -0.2924342, 0.4705882, 1, 0, 1,
-0.6235231, 2.504209, -1.068982, 0.4627451, 1, 0, 1,
-0.6231576, 0.7082418, 1.095614, 0.4588235, 1, 0, 1,
-0.6213613, 0.02651529, -2.037704, 0.4509804, 1, 0, 1,
-0.6160301, -0.3718125, -2.587267, 0.4470588, 1, 0, 1,
-0.6141055, -0.1447233, -2.204414, 0.4392157, 1, 0, 1,
-0.6125047, -0.3029653, -2.637895, 0.4352941, 1, 0, 1,
-0.6090822, -1.046559, -4.46719, 0.427451, 1, 0, 1,
-0.6061494, 1.389064, -0.5344865, 0.4235294, 1, 0, 1,
-0.6048479, -0.04216543, -1.672131, 0.4156863, 1, 0, 1,
-0.6014408, -1.012396, -3.638615, 0.4117647, 1, 0, 1,
-0.5992049, 1.376368, -0.843617, 0.4039216, 1, 0, 1,
-0.5981501, -1.569879, -2.903779, 0.3960784, 1, 0, 1,
-0.5953248, -0.1435395, -2.210027, 0.3921569, 1, 0, 1,
-0.589498, 0.291306, 0.03833571, 0.3843137, 1, 0, 1,
-0.5867118, 1.216241, 0.383931, 0.3803922, 1, 0, 1,
-0.5839821, -0.7903616, -3.870732, 0.372549, 1, 0, 1,
-0.5802332, 0.4322343, -0.8358168, 0.3686275, 1, 0, 1,
-0.5744177, 0.02142499, -3.244239, 0.3607843, 1, 0, 1,
-0.5723504, 0.3578727, -2.714125, 0.3568628, 1, 0, 1,
-0.5681234, -0.6946845, -5.033917, 0.3490196, 1, 0, 1,
-0.5633644, 0.5536674, -3.105845, 0.345098, 1, 0, 1,
-0.562498, 0.6864111, -2.299169, 0.3372549, 1, 0, 1,
-0.561042, 0.8423246, -1.514047, 0.3333333, 1, 0, 1,
-0.5598297, -0.4643155, -1.91189, 0.3254902, 1, 0, 1,
-0.5584237, 1.228199, 0.7721383, 0.3215686, 1, 0, 1,
-0.5498516, 2.098567, -0.8198254, 0.3137255, 1, 0, 1,
-0.5497894, -1.193586, -1.856245, 0.3098039, 1, 0, 1,
-0.544329, 2.042921, 0.2416933, 0.3019608, 1, 0, 1,
-0.5426211, 1.69829, -0.5904679, 0.2941177, 1, 0, 1,
-0.5361086, -0.3427677, -1.902517, 0.2901961, 1, 0, 1,
-0.5352773, 0.06755917, 1.133921, 0.282353, 1, 0, 1,
-0.5298876, -0.319063, -3.590411, 0.2784314, 1, 0, 1,
-0.5297288, -0.203953, -2.907555, 0.2705882, 1, 0, 1,
-0.5285177, -0.8274164, -2.179672, 0.2666667, 1, 0, 1,
-0.5281734, -1.000298, -2.991356, 0.2588235, 1, 0, 1,
-0.5275392, 0.9506928, -0.2869498, 0.254902, 1, 0, 1,
-0.5271652, -0.3597225, -2.276916, 0.2470588, 1, 0, 1,
-0.526759, 0.9951646, 1.108489, 0.2431373, 1, 0, 1,
-0.5229952, 1.13227, -1.086612, 0.2352941, 1, 0, 1,
-0.5221713, 0.0324246, -0.5515316, 0.2313726, 1, 0, 1,
-0.5183936, 1.375291, -0.449927, 0.2235294, 1, 0, 1,
-0.5141985, 0.204084, -2.10708, 0.2196078, 1, 0, 1,
-0.5128621, -1.35133, -3.085309, 0.2117647, 1, 0, 1,
-0.5113704, -0.6676534, -2.240131, 0.2078431, 1, 0, 1,
-0.5093003, 0.8226199, -0.2963071, 0.2, 1, 0, 1,
-0.5086012, -2.454379, -2.426641, 0.1921569, 1, 0, 1,
-0.4939149, -1.159927, -3.934951, 0.1882353, 1, 0, 1,
-0.4932567, -1.271323, -3.594923, 0.1803922, 1, 0, 1,
-0.4922354, -0.4277652, -2.520804, 0.1764706, 1, 0, 1,
-0.4906487, 0.5499458, 0.3334883, 0.1686275, 1, 0, 1,
-0.4900399, 1.854733, -1.204454, 0.1647059, 1, 0, 1,
-0.485833, 1.214112, -0.3676934, 0.1568628, 1, 0, 1,
-0.4830869, -1.607691, -0.7398805, 0.1529412, 1, 0, 1,
-0.4776301, -0.2454739, -2.303825, 0.145098, 1, 0, 1,
-0.4709422, -1.859388, -2.471902, 0.1411765, 1, 0, 1,
-0.4703203, -0.9830986, -3.624245, 0.1333333, 1, 0, 1,
-0.4677995, -0.03502502, -1.966643, 0.1294118, 1, 0, 1,
-0.4671889, 0.3765977, 0.6126817, 0.1215686, 1, 0, 1,
-0.465187, 0.1010573, 1.055892, 0.1176471, 1, 0, 1,
-0.4563403, -2.546593, -2.728876, 0.1098039, 1, 0, 1,
-0.4543015, 1.021395, 0.07743673, 0.1058824, 1, 0, 1,
-0.4488298, -0.747818, -2.806546, 0.09803922, 1, 0, 1,
-0.4421104, 0.2175257, -1.275324, 0.09019608, 1, 0, 1,
-0.4398325, 0.7242693, -1.605108, 0.08627451, 1, 0, 1,
-0.4398305, -0.4332441, -2.991786, 0.07843138, 1, 0, 1,
-0.4324124, -0.4221098, -2.947807, 0.07450981, 1, 0, 1,
-0.4323609, 0.747346, 0.9409147, 0.06666667, 1, 0, 1,
-0.4322708, -0.7954642, -2.463425, 0.0627451, 1, 0, 1,
-0.4312946, -0.9269965, -3.191564, 0.05490196, 1, 0, 1,
-0.4297538, 2.221869, 1.180052, 0.05098039, 1, 0, 1,
-0.4260254, -0.2013757, -0.4267878, 0.04313726, 1, 0, 1,
-0.4254551, 0.7599705, 0.01396725, 0.03921569, 1, 0, 1,
-0.4247104, -0.3354547, 0.1730158, 0.03137255, 1, 0, 1,
-0.4154134, -2.544005, -3.214644, 0.02745098, 1, 0, 1,
-0.4080455, -0.9857427, -3.247395, 0.01960784, 1, 0, 1,
-0.4067301, -0.1101865, -2.376594, 0.01568628, 1, 0, 1,
-0.406332, -1.824153, -1.989108, 0.007843138, 1, 0, 1,
-0.4006303, -0.8023701, -0.399979, 0.003921569, 1, 0, 1,
-0.3946336, 0.1840666, -2.444815, 0, 1, 0.003921569, 1,
-0.3945904, -0.5678258, -2.816159, 0, 1, 0.01176471, 1,
-0.3928301, -1.146119, -2.683929, 0, 1, 0.01568628, 1,
-0.3905461, -0.3814029, -3.822528, 0, 1, 0.02352941, 1,
-0.3886066, -0.185955, -1.998795, 0, 1, 0.02745098, 1,
-0.3856044, 0.3440232, 2.009827, 0, 1, 0.03529412, 1,
-0.3848329, -1.827816, -1.803698, 0, 1, 0.03921569, 1,
-0.3841153, -0.51553, -2.725908, 0, 1, 0.04705882, 1,
-0.3836601, -0.6169482, -0.223399, 0, 1, 0.05098039, 1,
-0.378226, -1.044932, -3.868401, 0, 1, 0.05882353, 1,
-0.3767248, 0.12411, -2.129206, 0, 1, 0.0627451, 1,
-0.3765954, 1.277485, 1.085187, 0, 1, 0.07058824, 1,
-0.3762147, -2.417765, -1.754186, 0, 1, 0.07450981, 1,
-0.3727276, 1.523093, -0.1880286, 0, 1, 0.08235294, 1,
-0.3699598, 0.2149591, -1.856112, 0, 1, 0.08627451, 1,
-0.3625238, -0.534649, -1.011555, 0, 1, 0.09411765, 1,
-0.3581712, -0.721127, -3.560923, 0, 1, 0.1019608, 1,
-0.3567724, -0.2662473, -2.99813, 0, 1, 0.1058824, 1,
-0.3556355, -0.8724726, -4.458028, 0, 1, 0.1137255, 1,
-0.3494065, -0.3705944, -3.591863, 0, 1, 0.1176471, 1,
-0.3482226, -2.014044, -3.603541, 0, 1, 0.1254902, 1,
-0.345754, 0.9490122, -1.781601, 0, 1, 0.1294118, 1,
-0.3386466, 0.4164715, -1.010789, 0, 1, 0.1372549, 1,
-0.3384439, -1.11395, -1.736102, 0, 1, 0.1411765, 1,
-0.3384006, 0.07966176, -0.6378981, 0, 1, 0.1490196, 1,
-0.3377178, 1.595138, -0.3759664, 0, 1, 0.1529412, 1,
-0.3330409, 0.05840075, -0.9042478, 0, 1, 0.1607843, 1,
-0.3302165, 0.050951, -2.57672, 0, 1, 0.1647059, 1,
-0.3277105, -1.210564, -2.85378, 0, 1, 0.172549, 1,
-0.3251263, -0.3057902, -2.436058, 0, 1, 0.1764706, 1,
-0.3197557, 0.7424247, -0.6918094, 0, 1, 0.1843137, 1,
-0.3186546, -0.1230967, -2.024514, 0, 1, 0.1882353, 1,
-0.3183002, -0.7150047, -1.008472, 0, 1, 0.1960784, 1,
-0.316764, -2.446528, -2.095292, 0, 1, 0.2039216, 1,
-0.313691, -0.5761285, -1.456974, 0, 1, 0.2078431, 1,
-0.3132637, -1.117122, -2.4789, 0, 1, 0.2156863, 1,
-0.3080451, -0.4262005, -3.213219, 0, 1, 0.2196078, 1,
-0.3063486, -1.331535, -4.687146, 0, 1, 0.227451, 1,
-0.3036147, 0.4587873, 0.6292982, 0, 1, 0.2313726, 1,
-0.3011404, 0.707444, 0.2268708, 0, 1, 0.2392157, 1,
-0.3003853, -0.7160889, -3.474786, 0, 1, 0.2431373, 1,
-0.300247, 0.2798128, 1.353381, 0, 1, 0.2509804, 1,
-0.297668, -0.5170403, -2.27782, 0, 1, 0.254902, 1,
-0.2917049, 0.4130107, -0.956662, 0, 1, 0.2627451, 1,
-0.2911355, -0.6767204, -5.335773, 0, 1, 0.2666667, 1,
-0.2883297, -0.4838136, -2.293931, 0, 1, 0.2745098, 1,
-0.2874251, 2.007559, -1.519115, 0, 1, 0.2784314, 1,
-0.2870014, 2.2425, 0.3196767, 0, 1, 0.2862745, 1,
-0.2861021, -0.06438393, -4.305699, 0, 1, 0.2901961, 1,
-0.2853115, 0.7962598, -2.144578, 0, 1, 0.2980392, 1,
-0.2756981, -0.9279858, -3.566247, 0, 1, 0.3058824, 1,
-0.2756097, 0.05260045, -2.395794, 0, 1, 0.3098039, 1,
-0.2736077, 0.7646915, 0.5488145, 0, 1, 0.3176471, 1,
-0.2712859, -1.580759, -2.931419, 0, 1, 0.3215686, 1,
-0.2700764, 0.290715, -0.1791971, 0, 1, 0.3294118, 1,
-0.2654129, 2.50824, -1.822521, 0, 1, 0.3333333, 1,
-0.2645722, -1.150759, -2.576416, 0, 1, 0.3411765, 1,
-0.2620716, 0.2272173, 0.3522498, 0, 1, 0.345098, 1,
-0.2607748, -0.3319518, -1.235995, 0, 1, 0.3529412, 1,
-0.2605674, -1.545902, -2.305693, 0, 1, 0.3568628, 1,
-0.2584662, -0.3196734, -2.173698, 0, 1, 0.3647059, 1,
-0.2570124, 1.086183, -0.3972467, 0, 1, 0.3686275, 1,
-0.2562101, -1.479696, -4.018703, 0, 1, 0.3764706, 1,
-0.2560109, 0.179746, -0.1410928, 0, 1, 0.3803922, 1,
-0.2527117, 0.2516801, -0.6714702, 0, 1, 0.3882353, 1,
-0.2507249, 0.4235709, 0.1160174, 0, 1, 0.3921569, 1,
-0.2502885, 0.463462, 0.2307831, 0, 1, 0.4, 1,
-0.2500732, -1.730288, -2.964034, 0, 1, 0.4078431, 1,
-0.2496219, -0.6088722, -3.542382, 0, 1, 0.4117647, 1,
-0.2468529, 1.488373, -0.007606091, 0, 1, 0.4196078, 1,
-0.2466535, 1.314125, -0.8303877, 0, 1, 0.4235294, 1,
-0.2455888, 0.306513, -0.7502778, 0, 1, 0.4313726, 1,
-0.2444887, -0.1117771, -2.778869, 0, 1, 0.4352941, 1,
-0.2423551, 0.3532526, -2.01809, 0, 1, 0.4431373, 1,
-0.236293, -0.5646009, -2.004318, 0, 1, 0.4470588, 1,
-0.2356548, -1.392048, -2.210648, 0, 1, 0.454902, 1,
-0.2326956, 0.07298971, -1.055771, 0, 1, 0.4588235, 1,
-0.2326839, -1.586812, -5.045573, 0, 1, 0.4666667, 1,
-0.2315792, -0.5026798, -1.734071, 0, 1, 0.4705882, 1,
-0.2314398, -0.6773676, -2.203209, 0, 1, 0.4784314, 1,
-0.2309267, 1.777799, -1.163275, 0, 1, 0.4823529, 1,
-0.2294529, 0.6849, -1.056831, 0, 1, 0.4901961, 1,
-0.2286211, 0.6658124, 2.04459, 0, 1, 0.4941176, 1,
-0.2276097, -0.5958043, -1.537729, 0, 1, 0.5019608, 1,
-0.2194392, 1.857847, -1.84126, 0, 1, 0.509804, 1,
-0.2147606, 0.7232838, 0.3475031, 0, 1, 0.5137255, 1,
-0.2071944, -0.113638, -2.281943, 0, 1, 0.5215687, 1,
-0.197186, 1.213463, -1.140009, 0, 1, 0.5254902, 1,
-0.1968131, -0.7150589, -3.099582, 0, 1, 0.5333334, 1,
-0.1958412, 0.4098505, 0.07655393, 0, 1, 0.5372549, 1,
-0.1906815, -0.0545132, -0.5828076, 0, 1, 0.5450981, 1,
-0.187258, 0.7606701, 0.8828484, 0, 1, 0.5490196, 1,
-0.1834294, 0.8354408, -0.3788065, 0, 1, 0.5568628, 1,
-0.1808277, 0.1421997, -2.339698, 0, 1, 0.5607843, 1,
-0.1797088, 1.002349, -2.004322, 0, 1, 0.5686275, 1,
-0.1796997, 0.5225932, 0.7661349, 0, 1, 0.572549, 1,
-0.1765365, -1.638041, -2.712492, 0, 1, 0.5803922, 1,
-0.1746252, 0.7962399, -0.9617682, 0, 1, 0.5843138, 1,
-0.1729052, 0.09747463, -3.462129, 0, 1, 0.5921569, 1,
-0.170309, -1.428575, -1.325836, 0, 1, 0.5960785, 1,
-0.1684638, -0.1604947, -3.50233, 0, 1, 0.6039216, 1,
-0.1671714, -0.7371529, -2.245832, 0, 1, 0.6117647, 1,
-0.1636361, -0.3381819, -1.175971, 0, 1, 0.6156863, 1,
-0.1628758, -0.3733235, -3.440957, 0, 1, 0.6235294, 1,
-0.1586227, 1.672262, 0.4580776, 0, 1, 0.627451, 1,
-0.1579822, -1.018639, -3.157166, 0, 1, 0.6352941, 1,
-0.157691, 0.1605291, -0.2470465, 0, 1, 0.6392157, 1,
-0.1576625, 0.3316892, -0.06040323, 0, 1, 0.6470588, 1,
-0.1570297, -0.1307654, -2.836457, 0, 1, 0.6509804, 1,
-0.1556993, 0.7667086, -1.288201, 0, 1, 0.6588235, 1,
-0.1537261, -1.923731, -5.098641, 0, 1, 0.6627451, 1,
-0.1516594, -1.254464, -4.189923, 0, 1, 0.6705883, 1,
-0.1506528, -0.890583, -2.660805, 0, 1, 0.6745098, 1,
-0.1460316, -1.548476, -1.528061, 0, 1, 0.682353, 1,
-0.1457823, -0.6597268, -2.509357, 0, 1, 0.6862745, 1,
-0.1441595, 0.07783908, -1.997594, 0, 1, 0.6941177, 1,
-0.1432198, 1.327369, 2.473359, 0, 1, 0.7019608, 1,
-0.1417758, 0.008328513, -1.768307, 0, 1, 0.7058824, 1,
-0.1412507, -0.1094761, -2.699735, 0, 1, 0.7137255, 1,
-0.1408608, 0.4754441, -1.283982, 0, 1, 0.7176471, 1,
-0.1407687, -0.4271063, -2.603526, 0, 1, 0.7254902, 1,
-0.1398621, 0.1785863, -1.745582, 0, 1, 0.7294118, 1,
-0.1395345, 0.4314768, 0.8362604, 0, 1, 0.7372549, 1,
-0.1331264, 1.429227, -0.479024, 0, 1, 0.7411765, 1,
-0.1321517, -2.007236, -3.613979, 0, 1, 0.7490196, 1,
-0.1258685, 1.259003, 0.6768993, 0, 1, 0.7529412, 1,
-0.1223714, 0.7586761, -0.2234825, 0, 1, 0.7607843, 1,
-0.1220981, -2.647656, -3.336081, 0, 1, 0.7647059, 1,
-0.1208757, -2.34405, -3.884036, 0, 1, 0.772549, 1,
-0.1202336, 0.38722, -2.018522, 0, 1, 0.7764706, 1,
-0.1183431, -1.525234, -2.295105, 0, 1, 0.7843137, 1,
-0.1162151, -0.3644276, -4.87519, 0, 1, 0.7882353, 1,
-0.1152579, 0.8963405, 0.542772, 0, 1, 0.7960784, 1,
-0.1131398, 0.1929772, -0.7204539, 0, 1, 0.8039216, 1,
-0.1117008, 1.104267, 0.6695792, 0, 1, 0.8078431, 1,
-0.1092773, 1.056889, -0.0373921, 0, 1, 0.8156863, 1,
-0.1081627, 0.3622162, -2.804419, 0, 1, 0.8196079, 1,
-0.1063479, 0.5872709, -0.4195154, 0, 1, 0.827451, 1,
-0.1056356, -2.095628, -2.335864, 0, 1, 0.8313726, 1,
-0.105316, 0.9128157, 0.6996443, 0, 1, 0.8392157, 1,
-0.1040799, 1.008309, -0.9947744, 0, 1, 0.8431373, 1,
-0.1020345, -1.585297, -3.302574, 0, 1, 0.8509804, 1,
-0.09380614, 2.42847, -1.160241, 0, 1, 0.854902, 1,
-0.09372185, -0.6703529, -3.592751, 0, 1, 0.8627451, 1,
-0.09204252, -0.0001507483, -2.381649, 0, 1, 0.8666667, 1,
-0.09074406, -1.73013, -2.91995, 0, 1, 0.8745098, 1,
-0.0896694, 1.246151, 0.6809598, 0, 1, 0.8784314, 1,
-0.08931933, 0.6947454, -1.609512, 0, 1, 0.8862745, 1,
-0.08876006, -1.677433, -4.689826, 0, 1, 0.8901961, 1,
-0.07982866, 0.6350376, -1.81937, 0, 1, 0.8980392, 1,
-0.07843906, -0.3556155, -2.653698, 0, 1, 0.9058824, 1,
-0.07765621, 1.705721, -2.097284, 0, 1, 0.9098039, 1,
-0.0700237, -1.189582, -1.056182, 0, 1, 0.9176471, 1,
-0.06232678, -0.2541462, -3.011189, 0, 1, 0.9215686, 1,
-0.06080151, 0.6697736, 0.3112997, 0, 1, 0.9294118, 1,
-0.06052544, 0.1698253, -0.5764102, 0, 1, 0.9333333, 1,
-0.06039491, 0.0443169, -2.868319, 0, 1, 0.9411765, 1,
-0.05816883, -3.529968, -3.283226, 0, 1, 0.945098, 1,
-0.05808879, 0.3863057, 0.0042581, 0, 1, 0.9529412, 1,
-0.05732164, -0.5281937, -4.578782, 0, 1, 0.9568627, 1,
-0.05581306, -0.9518203, -4.55861, 0, 1, 0.9647059, 1,
-0.05427896, 0.1744785, -0.4894745, 0, 1, 0.9686275, 1,
-0.04986022, 1.396425, -0.213562, 0, 1, 0.9764706, 1,
-0.04890635, 0.3191502, 1.108175, 0, 1, 0.9803922, 1,
-0.04826057, -0.08014573, -3.530209, 0, 1, 0.9882353, 1,
-0.04666013, -0.01563875, -3.085204, 0, 1, 0.9921569, 1,
-0.04563056, -0.9279585, -1.823627, 0, 1, 1, 1,
-0.04359866, 0.2546121, -0.8715429, 0, 0.9921569, 1, 1,
-0.04249087, -1.100618, -3.396658, 0, 0.9882353, 1, 1,
-0.03730424, -1.741606, -3.597147, 0, 0.9803922, 1, 1,
-0.03648091, 0.248597, -0.1335201, 0, 0.9764706, 1, 1,
-0.03386264, 0.2498369, -0.889327, 0, 0.9686275, 1, 1,
-0.03056454, -0.1277175, -2.224168, 0, 0.9647059, 1, 1,
-0.02488027, -0.8505735, -3.938025, 0, 0.9568627, 1, 1,
-0.02053873, -0.2359361, -3.711496, 0, 0.9529412, 1, 1,
-0.01962919, -1.15188, -3.035101, 0, 0.945098, 1, 1,
-0.01909511, 0.1721206, -0.9477183, 0, 0.9411765, 1, 1,
-0.01855141, 1.79772, 1.666736, 0, 0.9333333, 1, 1,
-0.01535754, 0.3204926, -0.7594325, 0, 0.9294118, 1, 1,
-0.01458865, -0.3260661, -3.410486, 0, 0.9215686, 1, 1,
-0.01283423, -1.423896, -2.531678, 0, 0.9176471, 1, 1,
-0.01205681, -0.348306, -2.154175, 0, 0.9098039, 1, 1,
-0.009122002, 1.8113, 1.592155, 0, 0.9058824, 1, 1,
-0.008695574, 0.8552151, -1.169525, 0, 0.8980392, 1, 1,
-0.005647739, 0.819307, 0.1802838, 0, 0.8901961, 1, 1,
-0.002997932, -0.06558622, -2.262666, 0, 0.8862745, 1, 1,
0.0004396184, 0.2622947, 1.332963, 0, 0.8784314, 1, 1,
0.008412629, 0.0665748, -0.2051277, 0, 0.8745098, 1, 1,
0.01187729, 1.767669, 1.062482, 0, 0.8666667, 1, 1,
0.01208049, -0.0609451, 2.555962, 0, 0.8627451, 1, 1,
0.01476598, -0.9411055, 3.908479, 0, 0.854902, 1, 1,
0.01681106, -0.4610193, 3.668893, 0, 0.8509804, 1, 1,
0.01851525, -0.4989647, 3.231466, 0, 0.8431373, 1, 1,
0.01852029, 0.3500091, -1.444181, 0, 0.8392157, 1, 1,
0.02319429, -0.746504, 2.319763, 0, 0.8313726, 1, 1,
0.0246549, 0.4565032, -0.2670363, 0, 0.827451, 1, 1,
0.02574539, -1.186724, 2.47009, 0, 0.8196079, 1, 1,
0.02654225, -0.635018, 0.8658983, 0, 0.8156863, 1, 1,
0.02723105, -0.7251636, 4.526397, 0, 0.8078431, 1, 1,
0.03439445, -0.7804299, 3.969076, 0, 0.8039216, 1, 1,
0.03449572, -0.2619614, 1.274854, 0, 0.7960784, 1, 1,
0.03451214, 0.7849805, 0.6951292, 0, 0.7882353, 1, 1,
0.0352133, 1.409889, -1.637062, 0, 0.7843137, 1, 1,
0.03528651, -0.9408039, 3.903209, 0, 0.7764706, 1, 1,
0.03730595, -0.1191331, 3.944471, 0, 0.772549, 1, 1,
0.04542157, 0.4421164, 0.08316568, 0, 0.7647059, 1, 1,
0.04627382, -0.1811637, 3.274519, 0, 0.7607843, 1, 1,
0.04998112, 0.6543179, -0.8325365, 0, 0.7529412, 1, 1,
0.05266169, 0.6262652, -0.6254421, 0, 0.7490196, 1, 1,
0.05303835, 1.30479, 0.9913122, 0, 0.7411765, 1, 1,
0.05395487, 0.734724, 0.4717692, 0, 0.7372549, 1, 1,
0.05529023, -1.00058, 2.320126, 0, 0.7294118, 1, 1,
0.05895245, 0.7929302, 1.639681, 0, 0.7254902, 1, 1,
0.06289941, 0.6409756, -0.5829703, 0, 0.7176471, 1, 1,
0.06406213, 0.335905, 0.2435105, 0, 0.7137255, 1, 1,
0.0644725, 0.4119907, -1.762881, 0, 0.7058824, 1, 1,
0.06996097, 0.8209076, 0.1665487, 0, 0.6980392, 1, 1,
0.07135609, 0.05166907, 1.962525, 0, 0.6941177, 1, 1,
0.0714823, 0.1689739, 2.256632, 0, 0.6862745, 1, 1,
0.07153599, -0.5171708, 3.549588, 0, 0.682353, 1, 1,
0.07383921, -0.6501541, 2.866847, 0, 0.6745098, 1, 1,
0.07430153, 0.6422271, 0.9845805, 0, 0.6705883, 1, 1,
0.0761153, 0.5068678, 0.01317698, 0, 0.6627451, 1, 1,
0.07687325, -0.6717536, 4.553837, 0, 0.6588235, 1, 1,
0.07802945, -0.4365371, 2.109084, 0, 0.6509804, 1, 1,
0.08342475, 0.236184, -1.550967, 0, 0.6470588, 1, 1,
0.08659363, -2.644625, 5.115944, 0, 0.6392157, 1, 1,
0.08837409, 0.9976763, 0.9681158, 0, 0.6352941, 1, 1,
0.08978951, 0.132087, 1.519215, 0, 0.627451, 1, 1,
0.09370688, -0.9381356, 5.670496, 0, 0.6235294, 1, 1,
0.09375057, 1.009734, -0.02827851, 0, 0.6156863, 1, 1,
0.09568875, 0.09790889, 0.2539767, 0, 0.6117647, 1, 1,
0.0978654, -0.04411641, 2.431864, 0, 0.6039216, 1, 1,
0.1009667, -1.092727, 2.926303, 0, 0.5960785, 1, 1,
0.1011014, -0.261562, 1.71045, 0, 0.5921569, 1, 1,
0.1064627, 1.01083, -0.8255149, 0, 0.5843138, 1, 1,
0.1085572, -1.076187, 1.855011, 0, 0.5803922, 1, 1,
0.1117829, -0.2924781, 2.201167, 0, 0.572549, 1, 1,
0.1140765, 1.224192, 0.5463628, 0, 0.5686275, 1, 1,
0.11965, 0.08012597, 0.4308019, 0, 0.5607843, 1, 1,
0.1206241, -0.1302938, 1.100573, 0, 0.5568628, 1, 1,
0.1212689, -1.308747, 5.985312, 0, 0.5490196, 1, 1,
0.1216049, -1.334651, 3.660998, 0, 0.5450981, 1, 1,
0.1221306, -0.06376594, 2.580107, 0, 0.5372549, 1, 1,
0.123969, -0.5805988, 3.306347, 0, 0.5333334, 1, 1,
0.1251138, -0.1138484, 0.09741112, 0, 0.5254902, 1, 1,
0.1255408, 0.4031787, 1.143365, 0, 0.5215687, 1, 1,
0.1255935, 0.02605543, 1.854328, 0, 0.5137255, 1, 1,
0.1350457, -0.7211804, 2.730141, 0, 0.509804, 1, 1,
0.1353747, 0.5367415, 0.3381946, 0, 0.5019608, 1, 1,
0.1358378, -1.661983, 2.609805, 0, 0.4941176, 1, 1,
0.1394957, 0.4189487, -0.6703126, 0, 0.4901961, 1, 1,
0.141209, 1.073877, -1.590609, 0, 0.4823529, 1, 1,
0.1423724, -0.3290011, 3.032403, 0, 0.4784314, 1, 1,
0.1478025, 1.652868, 0.4179374, 0, 0.4705882, 1, 1,
0.1507085, 1.014132, 0.9443254, 0, 0.4666667, 1, 1,
0.1610313, -1.464902, 3.370451, 0, 0.4588235, 1, 1,
0.1655904, 0.7345527, -1.202699, 0, 0.454902, 1, 1,
0.1656892, 0.8500447, -0.2005256, 0, 0.4470588, 1, 1,
0.1661426, 2.073295, -0.4154999, 0, 0.4431373, 1, 1,
0.1686535, -0.6138365, 1.66283, 0, 0.4352941, 1, 1,
0.1688741, 1.24592, 0.175175, 0, 0.4313726, 1, 1,
0.1696648, 0.5937152, 0.3535218, 0, 0.4235294, 1, 1,
0.1748073, -0.5851474, 3.588904, 0, 0.4196078, 1, 1,
0.1768996, -0.4333368, 2.558987, 0, 0.4117647, 1, 1,
0.1790272, -0.484482, 2.718823, 0, 0.4078431, 1, 1,
0.1828736, -0.6056358, 3.205246, 0, 0.4, 1, 1,
0.1833714, -0.7493805, 2.474072, 0, 0.3921569, 1, 1,
0.1866552, 2.451212, -0.7175686, 0, 0.3882353, 1, 1,
0.1873138, -0.4792944, 2.35611, 0, 0.3803922, 1, 1,
0.1880535, 0.8346462, 0.829873, 0, 0.3764706, 1, 1,
0.1942145, -0.8055311, 3.946828, 0, 0.3686275, 1, 1,
0.1952397, 0.9857273, -1.195199, 0, 0.3647059, 1, 1,
0.1965787, 0.9937618, -1.941919, 0, 0.3568628, 1, 1,
0.19695, -0.2984454, 3.300768, 0, 0.3529412, 1, 1,
0.1999325, 1.566447, -0.6844647, 0, 0.345098, 1, 1,
0.2029342, -0.002286622, 1.600422, 0, 0.3411765, 1, 1,
0.2187426, -0.5651006, 0.7683424, 0, 0.3333333, 1, 1,
0.2216054, -2.204669, 2.023492, 0, 0.3294118, 1, 1,
0.2235755, 0.2937273, 1.389201, 0, 0.3215686, 1, 1,
0.2241189, 1.604623, -1.50324, 0, 0.3176471, 1, 1,
0.2246825, 1.791567, 0.3723009, 0, 0.3098039, 1, 1,
0.2260294, -0.7065104, 3.138492, 0, 0.3058824, 1, 1,
0.2280295, 2.118981, 0.3400717, 0, 0.2980392, 1, 1,
0.2298496, 0.6281984, 0.02616469, 0, 0.2901961, 1, 1,
0.2345883, -0.02182717, -0.09724879, 0, 0.2862745, 1, 1,
0.2362364, 0.3592965, 0.1484611, 0, 0.2784314, 1, 1,
0.2374033, -0.7698849, 3.105019, 0, 0.2745098, 1, 1,
0.2389356, 0.8624178, -0.170763, 0, 0.2666667, 1, 1,
0.2396038, 1.513322, 1.838201, 0, 0.2627451, 1, 1,
0.240841, 1.264041, 0.400998, 0, 0.254902, 1, 1,
0.2410133, 0.1850147, 2.499846, 0, 0.2509804, 1, 1,
0.2458995, -0.3737415, 1.735729, 0, 0.2431373, 1, 1,
0.2494828, -0.3840986, 1.112604, 0, 0.2392157, 1, 1,
0.2502758, 1.297232, -0.6175918, 0, 0.2313726, 1, 1,
0.2578531, -0.02648561, 1.376971, 0, 0.227451, 1, 1,
0.258028, 0.7847862, -1.12781, 0, 0.2196078, 1, 1,
0.2589253, 0.1783518, 0.4755455, 0, 0.2156863, 1, 1,
0.2609884, 1.082058, 3.529116, 0, 0.2078431, 1, 1,
0.2662365, 0.297083, 2.299094, 0, 0.2039216, 1, 1,
0.2688257, -0.6293894, 1.693116, 0, 0.1960784, 1, 1,
0.2727045, 0.7791064, 1.723514, 0, 0.1882353, 1, 1,
0.2743922, 0.009243573, 0.9125333, 0, 0.1843137, 1, 1,
0.2768242, -2.303799, 3.268416, 0, 0.1764706, 1, 1,
0.2782359, 0.2781985, -0.4547381, 0, 0.172549, 1, 1,
0.2806021, -0.2553835, 1.080282, 0, 0.1647059, 1, 1,
0.286513, -0.7488315, 3.988061, 0, 0.1607843, 1, 1,
0.2874892, -0.2188722, 1.493376, 0, 0.1529412, 1, 1,
0.2966449, -0.3978422, 3.826722, 0, 0.1490196, 1, 1,
0.2970017, -2.167508, 4.785071, 0, 0.1411765, 1, 1,
0.2985684, 1.559952, 1.064834, 0, 0.1372549, 1, 1,
0.2993828, 1.059881, -0.0835053, 0, 0.1294118, 1, 1,
0.3037564, -0.2809795, 3.150063, 0, 0.1254902, 1, 1,
0.3060001, -0.8923633, 2.050413, 0, 0.1176471, 1, 1,
0.3088302, -1.344203, 1.031372, 0, 0.1137255, 1, 1,
0.3096448, -0.8361427, 1.875155, 0, 0.1058824, 1, 1,
0.3099878, 0.5821998, 0.3867533, 0, 0.09803922, 1, 1,
0.3156257, 0.1398573, 0.8756243, 0, 0.09411765, 1, 1,
0.322268, 1.372749, 1.62207, 0, 0.08627451, 1, 1,
0.3322299, 1.078506, 1.634971, 0, 0.08235294, 1, 1,
0.3411947, 1.163077, 0.9577196, 0, 0.07450981, 1, 1,
0.3436957, 0.365307, 1.686042, 0, 0.07058824, 1, 1,
0.3441018, 0.4615497, 1.059163, 0, 0.0627451, 1, 1,
0.3462381, 0.798569, -0.8067797, 0, 0.05882353, 1, 1,
0.3465307, -0.2008525, 2.420611, 0, 0.05098039, 1, 1,
0.3481569, -0.3163592, 3.108931, 0, 0.04705882, 1, 1,
0.3518662, -1.502872, 2.578066, 0, 0.03921569, 1, 1,
0.3528579, -0.3942046, 2.876229, 0, 0.03529412, 1, 1,
0.3551094, -0.5409033, 2.970561, 0, 0.02745098, 1, 1,
0.3638334, -0.8353158, 2.395162, 0, 0.02352941, 1, 1,
0.3701616, 1.136221, -0.4225352, 0, 0.01568628, 1, 1,
0.3736197, 1.470617, 0.6729719, 0, 0.01176471, 1, 1,
0.3745331, 1.264007, -1.110252, 0, 0.003921569, 1, 1,
0.3789558, -0.783835, 1.235801, 0.003921569, 0, 1, 1,
0.3791213, 0.6372048, 0.5099674, 0.007843138, 0, 1, 1,
0.3799985, 0.01044464, 2.301784, 0.01568628, 0, 1, 1,
0.3819743, 0.2555178, -1.297411, 0.01960784, 0, 1, 1,
0.3880739, 1.165391, 0.8233894, 0.02745098, 0, 1, 1,
0.3972288, 0.5812953, -0.02877218, 0.03137255, 0, 1, 1,
0.400338, 1.87396, -0.1358618, 0.03921569, 0, 1, 1,
0.4016587, 0.3575636, 0.9710329, 0.04313726, 0, 1, 1,
0.4019004, 0.5231432, -0.5329098, 0.05098039, 0, 1, 1,
0.4019479, -1.196687, 2.784997, 0.05490196, 0, 1, 1,
0.4039759, 0.3285224, 2.742597, 0.0627451, 0, 1, 1,
0.4075788, -2.157073, 3.16167, 0.06666667, 0, 1, 1,
0.4083259, -0.2180595, 1.941488, 0.07450981, 0, 1, 1,
0.4087447, 0.04339273, 0.6003607, 0.07843138, 0, 1, 1,
0.4095456, -0.8615576, 3.547974, 0.08627451, 0, 1, 1,
0.4154133, -0.3065003, 2.460547, 0.09019608, 0, 1, 1,
0.4189462, 1.544569, 0.1617937, 0.09803922, 0, 1, 1,
0.4218559, 1.249427, -0.1981765, 0.1058824, 0, 1, 1,
0.424266, 0.04114447, 1.756539, 0.1098039, 0, 1, 1,
0.4250757, -0.3673406, 2.848193, 0.1176471, 0, 1, 1,
0.4293403, -0.4228131, 0.9426566, 0.1215686, 0, 1, 1,
0.4355731, -0.9140726, 3.890001, 0.1294118, 0, 1, 1,
0.4411664, -0.7585, 3.576388, 0.1333333, 0, 1, 1,
0.4431439, 1.328717, 1.028079, 0.1411765, 0, 1, 1,
0.4438547, -1.140527, 3.043318, 0.145098, 0, 1, 1,
0.4444712, -0.9750193, 2.10362, 0.1529412, 0, 1, 1,
0.4475402, 0.9863284, -0.7018406, 0.1568628, 0, 1, 1,
0.465909, 0.05595776, 1.413622, 0.1647059, 0, 1, 1,
0.469848, -0.6271946, 0.5007457, 0.1686275, 0, 1, 1,
0.4711595, -2.084198, 2.387741, 0.1764706, 0, 1, 1,
0.4719444, 0.09177535, 2.663681, 0.1803922, 0, 1, 1,
0.4741262, 1.678928, 0.9247305, 0.1882353, 0, 1, 1,
0.4796771, -1.483632, 2.796947, 0.1921569, 0, 1, 1,
0.4893023, 1.201571, -0.163493, 0.2, 0, 1, 1,
0.4898509, -1.521081, 3.012051, 0.2078431, 0, 1, 1,
0.4949479, 0.867564, 0.513468, 0.2117647, 0, 1, 1,
0.4951441, -0.1642585, 2.227563, 0.2196078, 0, 1, 1,
0.4988035, -0.01478556, 3.047561, 0.2235294, 0, 1, 1,
0.499624, -1.357696, 2.966156, 0.2313726, 0, 1, 1,
0.501026, 0.1872513, 1.51592, 0.2352941, 0, 1, 1,
0.5052682, -0.8259712, 2.510996, 0.2431373, 0, 1, 1,
0.5064067, 0.08479686, 1.267172, 0.2470588, 0, 1, 1,
0.5112723, 0.09568273, 1.237275, 0.254902, 0, 1, 1,
0.5145717, 1.635878, -0.2491852, 0.2588235, 0, 1, 1,
0.5154296, -1.055768, 3.804346, 0.2666667, 0, 1, 1,
0.5156992, -1.282917, 3.072535, 0.2705882, 0, 1, 1,
0.5172078, 1.387553, 1.00834, 0.2784314, 0, 1, 1,
0.5183157, 0.8502971, 0.5620725, 0.282353, 0, 1, 1,
0.5215274, -0.3267749, 0.8158439, 0.2901961, 0, 1, 1,
0.5226393, 0.3835582, 0.7326016, 0.2941177, 0, 1, 1,
0.52584, 0.3207742, 0.5022985, 0.3019608, 0, 1, 1,
0.526607, 0.5539895, 0.7653959, 0.3098039, 0, 1, 1,
0.5280337, 0.7772693, 1.325372, 0.3137255, 0, 1, 1,
0.5281816, 0.1195542, 2.203637, 0.3215686, 0, 1, 1,
0.5282107, -1.163347, 1.943523, 0.3254902, 0, 1, 1,
0.5295379, -1.095119, 0.419354, 0.3333333, 0, 1, 1,
0.5308067, -0.6176935, 2.654123, 0.3372549, 0, 1, 1,
0.5326908, -0.891178, 2.421462, 0.345098, 0, 1, 1,
0.5327711, 0.9576387, 1.990722, 0.3490196, 0, 1, 1,
0.5381153, 1.388924, 2.170243, 0.3568628, 0, 1, 1,
0.5440076, -0.7884932, 2.181834, 0.3607843, 0, 1, 1,
0.5614552, 0.589156, -1.544546, 0.3686275, 0, 1, 1,
0.5631181, -0.376069, 2.14163, 0.372549, 0, 1, 1,
0.5646796, -0.8823436, 4.611971, 0.3803922, 0, 1, 1,
0.5682138, 0.01080124, 0.3845843, 0.3843137, 0, 1, 1,
0.5712252, 1.814925, 1.003487, 0.3921569, 0, 1, 1,
0.5738615, 0.06232076, 3.964146, 0.3960784, 0, 1, 1,
0.5761049, -0.3678692, 1.008939, 0.4039216, 0, 1, 1,
0.5762052, 0.126718, -0.2518021, 0.4117647, 0, 1, 1,
0.5782572, 1.393719, 1.350125, 0.4156863, 0, 1, 1,
0.5816703, 0.7077867, 0.9711732, 0.4235294, 0, 1, 1,
0.5819931, -0.06149339, 1.463609, 0.427451, 0, 1, 1,
0.583612, -0.7651026, 2.320741, 0.4352941, 0, 1, 1,
0.5842529, -0.9491826, 2.503183, 0.4392157, 0, 1, 1,
0.584839, 1.155882, -0.5628508, 0.4470588, 0, 1, 1,
0.5997219, 0.7648373, -0.8905321, 0.4509804, 0, 1, 1,
0.6006357, -0.1132379, 1.312987, 0.4588235, 0, 1, 1,
0.602849, -0.230831, 1.399213, 0.4627451, 0, 1, 1,
0.6077263, -1.268385, 3.255388, 0.4705882, 0, 1, 1,
0.6122565, 0.7176589, -0.1255775, 0.4745098, 0, 1, 1,
0.6199601, -0.2588, 2.741633, 0.4823529, 0, 1, 1,
0.6217132, 0.5317601, 0.5412492, 0.4862745, 0, 1, 1,
0.6220714, 0.7262599, 1.240885, 0.4941176, 0, 1, 1,
0.6227837, 1.050832, -1.240637, 0.5019608, 0, 1, 1,
0.6260169, 0.07600272, -0.7473049, 0.5058824, 0, 1, 1,
0.6262989, 1.297063, 0.1741287, 0.5137255, 0, 1, 1,
0.6298319, -1.099741, 3.394102, 0.5176471, 0, 1, 1,
0.6320744, 1.133787, -0.4050547, 0.5254902, 0, 1, 1,
0.6370063, -1.273838, 2.313541, 0.5294118, 0, 1, 1,
0.642641, -0.9526344, 4.378413, 0.5372549, 0, 1, 1,
0.6428056, 1.189987, -0.5692331, 0.5411765, 0, 1, 1,
0.6430622, 0.8101754, 1.096685, 0.5490196, 0, 1, 1,
0.6435805, 0.6849831, 0.4564208, 0.5529412, 0, 1, 1,
0.6448916, -0.1921488, 0.4535412, 0.5607843, 0, 1, 1,
0.6449615, -0.2640843, 2.458221, 0.5647059, 0, 1, 1,
0.6464044, -2.446149, 3.28754, 0.572549, 0, 1, 1,
0.6471364, -1.192803, 2.544125, 0.5764706, 0, 1, 1,
0.6485841, -0.4984546, 4.515623, 0.5843138, 0, 1, 1,
0.6503638, 0.3588709, 0.8676804, 0.5882353, 0, 1, 1,
0.6514556, 1.080849, 1.102087, 0.5960785, 0, 1, 1,
0.6529146, -0.6409951, 2.319479, 0.6039216, 0, 1, 1,
0.6581512, 1.337815, -0.8265819, 0.6078432, 0, 1, 1,
0.6597443, -0.5053348, 1.805375, 0.6156863, 0, 1, 1,
0.6649117, 0.49207, 1.96606, 0.6196079, 0, 1, 1,
0.6715626, 0.277364, 1.723358, 0.627451, 0, 1, 1,
0.6730118, -0.4667782, 2.484545, 0.6313726, 0, 1, 1,
0.6740649, 0.8424867, 0.9498347, 0.6392157, 0, 1, 1,
0.674571, -0.7321206, 3.493001, 0.6431373, 0, 1, 1,
0.6779926, -0.6669422, 1.216613, 0.6509804, 0, 1, 1,
0.6822886, 0.4838549, 0.7930906, 0.654902, 0, 1, 1,
0.6862981, -0.4496288, 2.836629, 0.6627451, 0, 1, 1,
0.6865306, -0.2566337, 3.419621, 0.6666667, 0, 1, 1,
0.6885836, -0.4285925, 1.886243, 0.6745098, 0, 1, 1,
0.6937507, 1.294124, 2.759752, 0.6784314, 0, 1, 1,
0.7024437, -1.011711, 1.495595, 0.6862745, 0, 1, 1,
0.7094845, -0.2019852, 2.684463, 0.6901961, 0, 1, 1,
0.7127734, 0.8046651, 3.453022, 0.6980392, 0, 1, 1,
0.713048, 0.686564, -0.9420325, 0.7058824, 0, 1, 1,
0.7155706, 0.2798133, 1.870423, 0.7098039, 0, 1, 1,
0.7184649, 2.51155, -0.7672582, 0.7176471, 0, 1, 1,
0.7185458, 1.483991, 0.07505956, 0.7215686, 0, 1, 1,
0.7224504, -0.156478, 2.336565, 0.7294118, 0, 1, 1,
0.7292266, -0.3849807, 1.702596, 0.7333333, 0, 1, 1,
0.729287, 2.087168, 1.463234, 0.7411765, 0, 1, 1,
0.7323831, 1.855092, 1.678494, 0.7450981, 0, 1, 1,
0.7340968, -0.8340749, 2.539337, 0.7529412, 0, 1, 1,
0.7348443, -0.6368981, 0.331113, 0.7568628, 0, 1, 1,
0.7351312, -0.03213371, 2.295865, 0.7647059, 0, 1, 1,
0.7359931, -0.1779341, 2.372232, 0.7686275, 0, 1, 1,
0.7365385, 0.07210905, 0.5269758, 0.7764706, 0, 1, 1,
0.7382982, -0.8599957, 3.355884, 0.7803922, 0, 1, 1,
0.738476, 0.7681859, 0.06007256, 0.7882353, 0, 1, 1,
0.7470706, 0.5686589, 0.1071753, 0.7921569, 0, 1, 1,
0.7492306, 0.3636808, 1.479752, 0.8, 0, 1, 1,
0.7528424, -0.4092476, 2.285424, 0.8078431, 0, 1, 1,
0.756512, -0.2369879, 1.916918, 0.8117647, 0, 1, 1,
0.7616767, 0.166635, 0.8964747, 0.8196079, 0, 1, 1,
0.7620707, 0.8222527, 0.3683864, 0.8235294, 0, 1, 1,
0.764461, -0.7280777, 4.531529, 0.8313726, 0, 1, 1,
0.7716185, -0.2091893, 2.745401, 0.8352941, 0, 1, 1,
0.7746795, 1.658185, -0.5364559, 0.8431373, 0, 1, 1,
0.7747851, 0.05326246, 1.790099, 0.8470588, 0, 1, 1,
0.7798243, -0.3428925, 1.672784, 0.854902, 0, 1, 1,
0.7930803, -0.02680323, 0.2408001, 0.8588235, 0, 1, 1,
0.7962252, 0.194173, 0.3211595, 0.8666667, 0, 1, 1,
0.7965943, -0.8811487, 0.01867626, 0.8705882, 0, 1, 1,
0.7970279, -1.62802, 2.46283, 0.8784314, 0, 1, 1,
0.7981199, -0.4803653, 1.063994, 0.8823529, 0, 1, 1,
0.8096969, 0.02901858, 1.527612, 0.8901961, 0, 1, 1,
0.8121988, 0.1962097, -1.415075, 0.8941177, 0, 1, 1,
0.8126285, 0.909074, 1.809107, 0.9019608, 0, 1, 1,
0.8140566, -0.6882313, 2.708547, 0.9098039, 0, 1, 1,
0.8169006, 0.6659229, -0.484564, 0.9137255, 0, 1, 1,
0.8169385, 1.236633, 1.206046, 0.9215686, 0, 1, 1,
0.8173631, 1.788508, 1.221543, 0.9254902, 0, 1, 1,
0.8243772, 0.2110795, 0.009173246, 0.9333333, 0, 1, 1,
0.8262439, -0.4462588, 0.6658261, 0.9372549, 0, 1, 1,
0.8273364, 0.6689747, -0.7742472, 0.945098, 0, 1, 1,
0.8331785, -0.9148656, 4.157126, 0.9490196, 0, 1, 1,
0.8503124, -1.56111, 3.709371, 0.9568627, 0, 1, 1,
0.8513293, 0.3594784, 1.201997, 0.9607843, 0, 1, 1,
0.8538287, -0.2759362, 3.234237, 0.9686275, 0, 1, 1,
0.8577936, -1.248081, 3.017199, 0.972549, 0, 1, 1,
0.8666596, 0.1539561, 1.698806, 0.9803922, 0, 1, 1,
0.8671097, 0.3188797, 3.459844, 0.9843137, 0, 1, 1,
0.8734031, -0.9712316, 2.084635, 0.9921569, 0, 1, 1,
0.8792541, -1.922727, 3.099627, 0.9960784, 0, 1, 1,
0.8855006, 0.5361423, 1.065983, 1, 0, 0.9960784, 1,
0.8867283, -0.7140908, 2.373229, 1, 0, 0.9882353, 1,
0.8871246, 0.2752223, 0.9669273, 1, 0, 0.9843137, 1,
0.8909928, -1.281285, 3.094495, 1, 0, 0.9764706, 1,
0.895088, 0.8244228, 1.428686, 1, 0, 0.972549, 1,
0.8977388, 0.16935, 2.656951, 1, 0, 0.9647059, 1,
0.8985921, -0.6773997, 1.314088, 1, 0, 0.9607843, 1,
0.9013112, -1.560766, 2.695711, 1, 0, 0.9529412, 1,
0.9047587, -1.505639, 2.68969, 1, 0, 0.9490196, 1,
0.9129539, 0.7639996, 1.199022, 1, 0, 0.9411765, 1,
0.9155175, 0.4654697, 0.9765273, 1, 0, 0.9372549, 1,
0.9186166, 1.370207, 1.354424, 1, 0, 0.9294118, 1,
0.9333392, -0.1424055, 1.315921, 1, 0, 0.9254902, 1,
0.9335812, -0.662776, 2.446321, 1, 0, 0.9176471, 1,
0.9339495, 0.7559828, 2.617036, 1, 0, 0.9137255, 1,
0.9359098, 1.346132, 0.966745, 1, 0, 0.9058824, 1,
0.941115, -0.3969567, 2.761345, 1, 0, 0.9019608, 1,
0.9414685, 0.363775, 1.526647, 1, 0, 0.8941177, 1,
0.9484109, 0.6974736, 1.219916, 1, 0, 0.8862745, 1,
0.9576991, 0.1781684, 1.36117, 1, 0, 0.8823529, 1,
0.9606085, -0.5215341, 0.5220476, 1, 0, 0.8745098, 1,
0.9629009, -0.7397319, 1.755227, 1, 0, 0.8705882, 1,
0.9676448, 0.117557, 1.860035, 1, 0, 0.8627451, 1,
0.9701378, 1.368387, 0.4669627, 1, 0, 0.8588235, 1,
0.9715833, -0.2210801, 1.716276, 1, 0, 0.8509804, 1,
0.9717895, -0.921103, 3.645802, 1, 0, 0.8470588, 1,
0.9758233, 1.418183, 0.1584433, 1, 0, 0.8392157, 1,
0.9850386, -0.3510121, 2.016071, 1, 0, 0.8352941, 1,
0.9853269, -0.055477, 1.909896, 1, 0, 0.827451, 1,
0.9932334, 2.521315, 0.8349551, 1, 0, 0.8235294, 1,
0.9941611, -0.194046, 1.513878, 1, 0, 0.8156863, 1,
0.9992939, 1.686485, 0.8875668, 1, 0, 0.8117647, 1,
1.004556, 1.480148, -1.25189, 1, 0, 0.8039216, 1,
1.009936, -1.189493, 1.129888, 1, 0, 0.7960784, 1,
1.011993, 1.004716, 1.092734, 1, 0, 0.7921569, 1,
1.013799, 1.155324, 0.7564604, 1, 0, 0.7843137, 1,
1.016428, -2.176855, 1.537209, 1, 0, 0.7803922, 1,
1.019229, -1.165467, 0.1353484, 1, 0, 0.772549, 1,
1.02066, -0.3266729, 2.528224, 1, 0, 0.7686275, 1,
1.025464, -1.09466, 3.687416, 1, 0, 0.7607843, 1,
1.028262, -0.5445176, 2.666862, 1, 0, 0.7568628, 1,
1.029069, -0.9760877, 1.037851, 1, 0, 0.7490196, 1,
1.033943, -1.834015, 3.645259, 1, 0, 0.7450981, 1,
1.040948, -1.835321, 3.632117, 1, 0, 0.7372549, 1,
1.042884, -0.3012299, -0.474464, 1, 0, 0.7333333, 1,
1.043784, 0.2011267, 1.967513, 1, 0, 0.7254902, 1,
1.0534, 0.5271041, 0.3911804, 1, 0, 0.7215686, 1,
1.054139, -1.881411, 2.229925, 1, 0, 0.7137255, 1,
1.055046, 3.139931, 0.2874821, 1, 0, 0.7098039, 1,
1.058057, -2.010614, 1.919016, 1, 0, 0.7019608, 1,
1.058522, -1.580732, 4.346668, 1, 0, 0.6941177, 1,
1.065328, 1.591301, 0.4128214, 1, 0, 0.6901961, 1,
1.065758, -1.090234, 2.871993, 1, 0, 0.682353, 1,
1.066474, -0.2744783, 2.334076, 1, 0, 0.6784314, 1,
1.070655, -1.18427, 1.050684, 1, 0, 0.6705883, 1,
1.075349, 0.2032621, 1.507664, 1, 0, 0.6666667, 1,
1.07656, -0.9343658, -0.3088484, 1, 0, 0.6588235, 1,
1.085791, -0.8323166, 3.577432, 1, 0, 0.654902, 1,
1.087229, -0.7741577, 2.897498, 1, 0, 0.6470588, 1,
1.096703, -0.5069525, 3.318178, 1, 0, 0.6431373, 1,
1.097295, 0.3373304, 2.390045, 1, 0, 0.6352941, 1,
1.100765, -1.837461, 2.881379, 1, 0, 0.6313726, 1,
1.10181, -1.266906, 2.811488, 1, 0, 0.6235294, 1,
1.116972, -0.6898471, 2.816188, 1, 0, 0.6196079, 1,
1.122471, 0.9045558, -0.2238896, 1, 0, 0.6117647, 1,
1.122472, 0.7445132, -0.1987393, 1, 0, 0.6078432, 1,
1.124015, 0.4962797, 1.481585, 1, 0, 0.6, 1,
1.124965, 1.182609, 1.656031, 1, 0, 0.5921569, 1,
1.130858, -0.3883934, 0.01393596, 1, 0, 0.5882353, 1,
1.144368, -1.337115, 1.46541, 1, 0, 0.5803922, 1,
1.145672, -1.147846, 0.3307368, 1, 0, 0.5764706, 1,
1.158095, 0.5599689, 0.9738414, 1, 0, 0.5686275, 1,
1.164013, 0.9372729, 0.05151347, 1, 0, 0.5647059, 1,
1.165007, 0.9311258, 2.088511, 1, 0, 0.5568628, 1,
1.186043, -0.01350138, 0.7372652, 1, 0, 0.5529412, 1,
1.193652, -0.01025015, 1.129037, 1, 0, 0.5450981, 1,
1.216986, 0.7987248, 0.8511169, 1, 0, 0.5411765, 1,
1.22205, 0.4037898, 0.0150595, 1, 0, 0.5333334, 1,
1.226925, 1.498612, 0.3407097, 1, 0, 0.5294118, 1,
1.231753, -1.593137, 1.328176, 1, 0, 0.5215687, 1,
1.236877, 0.6943977, -1.561046, 1, 0, 0.5176471, 1,
1.241505, 2.589311, 0.2772293, 1, 0, 0.509804, 1,
1.24447, -0.4514513, 1.865553, 1, 0, 0.5058824, 1,
1.253294, 0.9169438, 1.09903, 1, 0, 0.4980392, 1,
1.261939, -0.1176204, 1.923686, 1, 0, 0.4901961, 1,
1.267847, 1.396691, -1.157825, 1, 0, 0.4862745, 1,
1.300683, 0.03845412, 3.035429, 1, 0, 0.4784314, 1,
1.303118, 0.3924426, 0.6746549, 1, 0, 0.4745098, 1,
1.306787, 0.7754656, 0.09052403, 1, 0, 0.4666667, 1,
1.318928, 1.712106, 0.9029537, 1, 0, 0.4627451, 1,
1.328649, -0.2484616, 3.515746, 1, 0, 0.454902, 1,
1.330821, -0.09818314, 2.693861, 1, 0, 0.4509804, 1,
1.337011, -0.4246964, 2.626245, 1, 0, 0.4431373, 1,
1.338058, 2.719378, -0.509376, 1, 0, 0.4392157, 1,
1.341254, 0.4768218, 1.397318, 1, 0, 0.4313726, 1,
1.349542, -1.837147, 1.634458, 1, 0, 0.427451, 1,
1.354527, -0.02477499, 4.925871, 1, 0, 0.4196078, 1,
1.378506, 0.7503611, 0.615992, 1, 0, 0.4156863, 1,
1.379788, -0.9682235, 1.321576, 1, 0, 0.4078431, 1,
1.382651, 0.2887277, -0.6174532, 1, 0, 0.4039216, 1,
1.397247, 0.6661049, 0.06038324, 1, 0, 0.3960784, 1,
1.411062, -1.876591, 0.1151327, 1, 0, 0.3882353, 1,
1.435582, 0.3540296, 2.252248, 1, 0, 0.3843137, 1,
1.453099, -0.9052314, 2.075553, 1, 0, 0.3764706, 1,
1.457821, -0.5409707, 1.777771, 1, 0, 0.372549, 1,
1.467509, -0.2516558, 1.358856, 1, 0, 0.3647059, 1,
1.46966, 1.292095, -1.02151, 1, 0, 0.3607843, 1,
1.469726, -1.084688, 1.308099, 1, 0, 0.3529412, 1,
1.480928, 0.6313842, 0.8371858, 1, 0, 0.3490196, 1,
1.50194, 0.6546983, 2.086215, 1, 0, 0.3411765, 1,
1.518515, 0.008141819, 0.6550773, 1, 0, 0.3372549, 1,
1.518962, 0.9483474, -0.2461132, 1, 0, 0.3294118, 1,
1.522215, 0.6582592, 2.339281, 1, 0, 0.3254902, 1,
1.529921, -0.4731972, 1.154734, 1, 0, 0.3176471, 1,
1.537507, -0.24247, -0.3413663, 1, 0, 0.3137255, 1,
1.544784, -0.2130094, -0.8023169, 1, 0, 0.3058824, 1,
1.564378, 2.380916, -1.384003, 1, 0, 0.2980392, 1,
1.615653, 1.197811, 2.081041, 1, 0, 0.2941177, 1,
1.626305, 1.283052, 2.007879, 1, 0, 0.2862745, 1,
1.645236, -0.7703807, 0.9584401, 1, 0, 0.282353, 1,
1.650825, -0.8672009, 1.968664, 1, 0, 0.2745098, 1,
1.674581, 1.107697, 1.812201, 1, 0, 0.2705882, 1,
1.679701, -0.004663255, 3.900057, 1, 0, 0.2627451, 1,
1.685189, 0.8996942, 0.251844, 1, 0, 0.2588235, 1,
1.689552, 1.089504, -0.1265945, 1, 0, 0.2509804, 1,
1.698733, -0.2301655, 2.221842, 1, 0, 0.2470588, 1,
1.715704, 1.520035, -0.3608835, 1, 0, 0.2392157, 1,
1.721959, 0.3005255, 0.6483728, 1, 0, 0.2352941, 1,
1.722393, -1.799732, 1.306947, 1, 0, 0.227451, 1,
1.728624, -1.144493, 3.948908, 1, 0, 0.2235294, 1,
1.731125, -0.3555129, 2.191031, 1, 0, 0.2156863, 1,
1.755458, 0.684108, 0.4204776, 1, 0, 0.2117647, 1,
1.772566, 0.4197553, 0.6958879, 1, 0, 0.2039216, 1,
1.775658, -0.7755888, 0.8890185, 1, 0, 0.1960784, 1,
1.780914, 0.8415138, 0.5812491, 1, 0, 0.1921569, 1,
1.781495, 1.594783, 0.701802, 1, 0, 0.1843137, 1,
1.782267, 0.4178853, 2.010959, 1, 0, 0.1803922, 1,
1.789964, -0.6372432, 2.895131, 1, 0, 0.172549, 1,
1.817924, 1.580014, 0.9954582, 1, 0, 0.1686275, 1,
1.826362, 0.9454691, 2.932816, 1, 0, 0.1607843, 1,
1.833771, 1.745127, 0.2615935, 1, 0, 0.1568628, 1,
1.83474, 1.712018, 0.623206, 1, 0, 0.1490196, 1,
1.85684, -1.149729, 2.63814, 1, 0, 0.145098, 1,
1.867245, -1.410351, 3.034406, 1, 0, 0.1372549, 1,
1.894191, -0.7106065, 3.38549, 1, 0, 0.1333333, 1,
1.923745, -1.024177, 2.344242, 1, 0, 0.1254902, 1,
1.938861, 0.7618876, 2.283105, 1, 0, 0.1215686, 1,
1.956663, 0.5411146, 0.2604335, 1, 0, 0.1137255, 1,
1.968786, -1.195858, 1.908894, 1, 0, 0.1098039, 1,
1.983695, 0.6743528, 0.9381282, 1, 0, 0.1019608, 1,
2.004178, 0.4073865, -0.02225797, 1, 0, 0.09411765, 1,
2.034886, -0.1539161, 1.245256, 1, 0, 0.09019608, 1,
2.085265, 0.8405673, 2.088711, 1, 0, 0.08235294, 1,
2.166495, 2.031848, -0.1115728, 1, 0, 0.07843138, 1,
2.175393, 0.1676277, 0.9913729, 1, 0, 0.07058824, 1,
2.191872, -1.563814, 2.609354, 1, 0, 0.06666667, 1,
2.303164, -1.153208, 1.145958, 1, 0, 0.05882353, 1,
2.371288, -1.204831, 2.274838, 1, 0, 0.05490196, 1,
2.455837, 2.339829, -0.6393654, 1, 0, 0.04705882, 1,
2.530444, 2.946383, 0.5731413, 1, 0, 0.04313726, 1,
2.561146, 0.8249143, 2.089122, 1, 0, 0.03529412, 1,
2.561805, -1.216622, 2.136366, 1, 0, 0.03137255, 1,
2.621842, 0.2666851, 3.259314, 1, 0, 0.02352941, 1,
2.664669, 0.01323383, 0.1858987, 1, 0, 0.01960784, 1,
2.712232, 0.9136655, -0.5860433, 1, 0, 0.01176471, 1,
2.759256, 0.8405428, 2.607559, 1, 0, 0.007843138, 1
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
-0.1007057, -4.660516, -7.254697, 0, -0.5, 0.5, 0.5,
-0.1007057, -4.660516, -7.254697, 1, -0.5, 0.5, 0.5,
-0.1007057, -4.660516, -7.254697, 1, 1.5, 0.5, 0.5,
-0.1007057, -4.660516, -7.254697, 0, 1.5, 0.5, 0.5
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
-3.930194, -0.1950185, -7.254697, 0, -0.5, 0.5, 0.5,
-3.930194, -0.1950185, -7.254697, 1, -0.5, 0.5, 0.5,
-3.930194, -0.1950185, -7.254697, 1, 1.5, 0.5, 0.5,
-3.930194, -0.1950185, -7.254697, 0, 1.5, 0.5, 0.5
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
-3.930194, -4.660516, 0.324769, 0, -0.5, 0.5, 0.5,
-3.930194, -4.660516, 0.324769, 1, -0.5, 0.5, 0.5,
-3.930194, -4.660516, 0.324769, 1, 1.5, 0.5, 0.5,
-3.930194, -4.660516, 0.324769, 0, 1.5, 0.5, 0.5
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
-2, -3.630017, -5.50559,
2, -3.630017, -5.50559,
-2, -3.630017, -5.50559,
-2, -3.801767, -5.797108,
-1, -3.630017, -5.50559,
-1, -3.801767, -5.797108,
0, -3.630017, -5.50559,
0, -3.801767, -5.797108,
1, -3.630017, -5.50559,
1, -3.801767, -5.797108,
2, -3.630017, -5.50559,
2, -3.801767, -5.797108
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
-2, -4.145267, -6.380144, 0, -0.5, 0.5, 0.5,
-2, -4.145267, -6.380144, 1, -0.5, 0.5, 0.5,
-2, -4.145267, -6.380144, 1, 1.5, 0.5, 0.5,
-2, -4.145267, -6.380144, 0, 1.5, 0.5, 0.5,
-1, -4.145267, -6.380144, 0, -0.5, 0.5, 0.5,
-1, -4.145267, -6.380144, 1, -0.5, 0.5, 0.5,
-1, -4.145267, -6.380144, 1, 1.5, 0.5, 0.5,
-1, -4.145267, -6.380144, 0, 1.5, 0.5, 0.5,
0, -4.145267, -6.380144, 0, -0.5, 0.5, 0.5,
0, -4.145267, -6.380144, 1, -0.5, 0.5, 0.5,
0, -4.145267, -6.380144, 1, 1.5, 0.5, 0.5,
0, -4.145267, -6.380144, 0, 1.5, 0.5, 0.5,
1, -4.145267, -6.380144, 0, -0.5, 0.5, 0.5,
1, -4.145267, -6.380144, 1, -0.5, 0.5, 0.5,
1, -4.145267, -6.380144, 1, 1.5, 0.5, 0.5,
1, -4.145267, -6.380144, 0, 1.5, 0.5, 0.5,
2, -4.145267, -6.380144, 0, -0.5, 0.5, 0.5,
2, -4.145267, -6.380144, 1, -0.5, 0.5, 0.5,
2, -4.145267, -6.380144, 1, 1.5, 0.5, 0.5,
2, -4.145267, -6.380144, 0, 1.5, 0.5, 0.5
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
-3.046466, -3, -5.50559,
-3.046466, 3, -5.50559,
-3.046466, -3, -5.50559,
-3.193754, -3, -5.797108,
-3.046466, -2, -5.50559,
-3.193754, -2, -5.797108,
-3.046466, -1, -5.50559,
-3.193754, -1, -5.797108,
-3.046466, 0, -5.50559,
-3.193754, 0, -5.797108,
-3.046466, 1, -5.50559,
-3.193754, 1, -5.797108,
-3.046466, 2, -5.50559,
-3.193754, 2, -5.797108,
-3.046466, 3, -5.50559,
-3.193754, 3, -5.797108
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
-3.48833, -3, -6.380144, 0, -0.5, 0.5, 0.5,
-3.48833, -3, -6.380144, 1, -0.5, 0.5, 0.5,
-3.48833, -3, -6.380144, 1, 1.5, 0.5, 0.5,
-3.48833, -3, -6.380144, 0, 1.5, 0.5, 0.5,
-3.48833, -2, -6.380144, 0, -0.5, 0.5, 0.5,
-3.48833, -2, -6.380144, 1, -0.5, 0.5, 0.5,
-3.48833, -2, -6.380144, 1, 1.5, 0.5, 0.5,
-3.48833, -2, -6.380144, 0, 1.5, 0.5, 0.5,
-3.48833, -1, -6.380144, 0, -0.5, 0.5, 0.5,
-3.48833, -1, -6.380144, 1, -0.5, 0.5, 0.5,
-3.48833, -1, -6.380144, 1, 1.5, 0.5, 0.5,
-3.48833, -1, -6.380144, 0, 1.5, 0.5, 0.5,
-3.48833, 0, -6.380144, 0, -0.5, 0.5, 0.5,
-3.48833, 0, -6.380144, 1, -0.5, 0.5, 0.5,
-3.48833, 0, -6.380144, 1, 1.5, 0.5, 0.5,
-3.48833, 0, -6.380144, 0, 1.5, 0.5, 0.5,
-3.48833, 1, -6.380144, 0, -0.5, 0.5, 0.5,
-3.48833, 1, -6.380144, 1, -0.5, 0.5, 0.5,
-3.48833, 1, -6.380144, 1, 1.5, 0.5, 0.5,
-3.48833, 1, -6.380144, 0, 1.5, 0.5, 0.5,
-3.48833, 2, -6.380144, 0, -0.5, 0.5, 0.5,
-3.48833, 2, -6.380144, 1, -0.5, 0.5, 0.5,
-3.48833, 2, -6.380144, 1, 1.5, 0.5, 0.5,
-3.48833, 2, -6.380144, 0, 1.5, 0.5, 0.5,
-3.48833, 3, -6.380144, 0, -0.5, 0.5, 0.5,
-3.48833, 3, -6.380144, 1, -0.5, 0.5, 0.5,
-3.48833, 3, -6.380144, 1, 1.5, 0.5, 0.5,
-3.48833, 3, -6.380144, 0, 1.5, 0.5, 0.5
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
-3.046466, -3.630017, -4,
-3.046466, -3.630017, 4,
-3.046466, -3.630017, -4,
-3.193754, -3.801767, -4,
-3.046466, -3.630017, -2,
-3.193754, -3.801767, -2,
-3.046466, -3.630017, 0,
-3.193754, -3.801767, 0,
-3.046466, -3.630017, 2,
-3.193754, -3.801767, 2,
-3.046466, -3.630017, 4,
-3.193754, -3.801767, 4
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
-3.48833, -4.145267, -4, 0, -0.5, 0.5, 0.5,
-3.48833, -4.145267, -4, 1, -0.5, 0.5, 0.5,
-3.48833, -4.145267, -4, 1, 1.5, 0.5, 0.5,
-3.48833, -4.145267, -4, 0, 1.5, 0.5, 0.5,
-3.48833, -4.145267, -2, 0, -0.5, 0.5, 0.5,
-3.48833, -4.145267, -2, 1, -0.5, 0.5, 0.5,
-3.48833, -4.145267, -2, 1, 1.5, 0.5, 0.5,
-3.48833, -4.145267, -2, 0, 1.5, 0.5, 0.5,
-3.48833, -4.145267, 0, 0, -0.5, 0.5, 0.5,
-3.48833, -4.145267, 0, 1, -0.5, 0.5, 0.5,
-3.48833, -4.145267, 0, 1, 1.5, 0.5, 0.5,
-3.48833, -4.145267, 0, 0, 1.5, 0.5, 0.5,
-3.48833, -4.145267, 2, 0, -0.5, 0.5, 0.5,
-3.48833, -4.145267, 2, 1, -0.5, 0.5, 0.5,
-3.48833, -4.145267, 2, 1, 1.5, 0.5, 0.5,
-3.48833, -4.145267, 2, 0, 1.5, 0.5, 0.5,
-3.48833, -4.145267, 4, 0, -0.5, 0.5, 0.5,
-3.48833, -4.145267, 4, 1, -0.5, 0.5, 0.5,
-3.48833, -4.145267, 4, 1, 1.5, 0.5, 0.5,
-3.48833, -4.145267, 4, 0, 1.5, 0.5, 0.5
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
-3.046466, -3.630017, -5.50559,
-3.046466, 3.23998, -5.50559,
-3.046466, -3.630017, 6.155128,
-3.046466, 3.23998, 6.155128,
-3.046466, -3.630017, -5.50559,
-3.046466, -3.630017, 6.155128,
-3.046466, 3.23998, -5.50559,
-3.046466, 3.23998, 6.155128,
-3.046466, -3.630017, -5.50559,
2.845055, -3.630017, -5.50559,
-3.046466, -3.630017, 6.155128,
2.845055, -3.630017, 6.155128,
-3.046466, 3.23998, -5.50559,
2.845055, 3.23998, -5.50559,
-3.046466, 3.23998, 6.155128,
2.845055, 3.23998, 6.155128,
2.845055, -3.630017, -5.50559,
2.845055, 3.23998, -5.50559,
2.845055, -3.630017, 6.155128,
2.845055, 3.23998, 6.155128,
2.845055, -3.630017, -5.50559,
2.845055, -3.630017, 6.155128,
2.845055, 3.23998, -5.50559,
2.845055, 3.23998, 6.155128
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
var radius = 7.881944;
var distance = 35.06766;
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
mvMatrix.translate( 0.1007057, 0.1950185, -0.324769 );
mvMatrix.scale( 1.446505, 1.240483, 0.7308394 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06766);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


