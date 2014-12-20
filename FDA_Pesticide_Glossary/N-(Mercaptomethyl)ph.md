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
-3.565121, -0.7246906, -1.157317, 1, 0, 0, 1,
-2.718304, 0.07628778, -0.2273542, 1, 0.007843138, 0, 1,
-2.637676, 0.3935973, -1.214789, 1, 0.01176471, 0, 1,
-2.603794, -2.195406, -2.008839, 1, 0.01960784, 0, 1,
-2.541, -0.7359117, -1.886475, 1, 0.02352941, 0, 1,
-2.363017, 1.073757, -1.767048, 1, 0.03137255, 0, 1,
-2.337024, 0.7494148, -1.955078, 1, 0.03529412, 0, 1,
-2.326136, -0.2647223, -0.6302516, 1, 0.04313726, 0, 1,
-2.322193, 0.8430784, -0.5351233, 1, 0.04705882, 0, 1,
-2.265426, 0.2585432, -0.4808438, 1, 0.05490196, 0, 1,
-2.246773, 0.09049786, -2.376662, 1, 0.05882353, 0, 1,
-2.209469, 0.8524448, -0.2149799, 1, 0.06666667, 0, 1,
-2.196688, 1.502474, -0.0487894, 1, 0.07058824, 0, 1,
-2.168649, 0.9928634, -0.1499255, 1, 0.07843138, 0, 1,
-2.130371, -0.1499331, -2.968347, 1, 0.08235294, 0, 1,
-2.114116, 0.4159031, -0.1261219, 1, 0.09019608, 0, 1,
-2.113577, 0.2813783, -1.287035, 1, 0.09411765, 0, 1,
-2.112946, -0.04074255, -2.141152, 1, 0.1019608, 0, 1,
-2.1111, -0.1724636, -1.018527, 1, 0.1098039, 0, 1,
-2.10628, 1.373243, -1.389329, 1, 0.1137255, 0, 1,
-2.013259, 0.5698318, -1.402347, 1, 0.1215686, 0, 1,
-1.997097, 0.4565954, -2.850062, 1, 0.1254902, 0, 1,
-1.969104, 1.215533, -2.095072, 1, 0.1333333, 0, 1,
-1.967279, -0.7439513, -1.768464, 1, 0.1372549, 0, 1,
-1.91658, 1.260535, -2.656911, 1, 0.145098, 0, 1,
-1.907681, -0.6293036, -2.585208, 1, 0.1490196, 0, 1,
-1.905503, 0.5354964, 0.02979196, 1, 0.1568628, 0, 1,
-1.904209, 0.5478917, -0.3695717, 1, 0.1607843, 0, 1,
-1.89737, 0.2751268, -1.364138, 1, 0.1686275, 0, 1,
-1.856959, -0.1877217, -2.37124, 1, 0.172549, 0, 1,
-1.836614, 0.06542121, -2.070127, 1, 0.1803922, 0, 1,
-1.827596, -1.415675, -1.993262, 1, 0.1843137, 0, 1,
-1.826892, -0.499904, -1.370525, 1, 0.1921569, 0, 1,
-1.77583, -0.7089239, -1.233429, 1, 0.1960784, 0, 1,
-1.774469, 0.6062667, -2.4906, 1, 0.2039216, 0, 1,
-1.764002, -0.4894193, -2.227674, 1, 0.2117647, 0, 1,
-1.757444, 0.5200964, -1.30206, 1, 0.2156863, 0, 1,
-1.757121, -0.7808837, -3.273602, 1, 0.2235294, 0, 1,
-1.747483, 2.115965, -1.160416, 1, 0.227451, 0, 1,
-1.734198, -0.8187964, -1.059672, 1, 0.2352941, 0, 1,
-1.730648, 0.009435058, -1.252626, 1, 0.2392157, 0, 1,
-1.721337, -0.1827369, -1.399833, 1, 0.2470588, 0, 1,
-1.717785, -0.1778943, -1.938015, 1, 0.2509804, 0, 1,
-1.70324, 0.5518287, -0.2843843, 1, 0.2588235, 0, 1,
-1.700939, -0.6398457, -1.957339, 1, 0.2627451, 0, 1,
-1.693761, 0.3208804, -2.238495, 1, 0.2705882, 0, 1,
-1.688974, 0.3640507, 0.134183, 1, 0.2745098, 0, 1,
-1.65842, -1.586986, -2.233484, 1, 0.282353, 0, 1,
-1.646222, 1.272819, -1.588319, 1, 0.2862745, 0, 1,
-1.636393, 0.1538767, -1.879884, 1, 0.2941177, 0, 1,
-1.609039, -0.982503, -2.20956, 1, 0.3019608, 0, 1,
-1.597469, -0.2481181, -2.871312, 1, 0.3058824, 0, 1,
-1.593223, -0.5408431, -2.762945, 1, 0.3137255, 0, 1,
-1.587607, 0.2536032, -1.397061, 1, 0.3176471, 0, 1,
-1.585322, 0.4720189, -2.604812, 1, 0.3254902, 0, 1,
-1.584415, 1.080882, -1.48468, 1, 0.3294118, 0, 1,
-1.58168, 0.1958855, -0.1796668, 1, 0.3372549, 0, 1,
-1.575348, 0.828711, -2.386618, 1, 0.3411765, 0, 1,
-1.573614, -0.7022251, -3.120123, 1, 0.3490196, 0, 1,
-1.570666, 0.2379023, -1.888798, 1, 0.3529412, 0, 1,
-1.56139, -0.7434478, -2.126469, 1, 0.3607843, 0, 1,
-1.559226, -0.39934, -3.050423, 1, 0.3647059, 0, 1,
-1.541224, 1.327618, -1.459026, 1, 0.372549, 0, 1,
-1.538296, -0.08688651, -3.333072, 1, 0.3764706, 0, 1,
-1.531509, 0.5084093, -0.3665588, 1, 0.3843137, 0, 1,
-1.52951, -0.2113259, -1.049507, 1, 0.3882353, 0, 1,
-1.527254, 1.03832, -2.825032, 1, 0.3960784, 0, 1,
-1.523375, -0.5730963, -3.493138, 1, 0.4039216, 0, 1,
-1.52246, 0.8874514, -0.1211842, 1, 0.4078431, 0, 1,
-1.516193, 0.4038794, -0.8432887, 1, 0.4156863, 0, 1,
-1.513702, -1.045676, -2.143366, 1, 0.4196078, 0, 1,
-1.50762, 0.8909311, -2.416281, 1, 0.427451, 0, 1,
-1.494232, -0.7915812, -2.746602, 1, 0.4313726, 0, 1,
-1.485417, 1.338103, -0.8048648, 1, 0.4392157, 0, 1,
-1.481402, -0.848044, -3.16966, 1, 0.4431373, 0, 1,
-1.475545, -0.4147231, -1.837964, 1, 0.4509804, 0, 1,
-1.469479, 0.2372639, -0.4821177, 1, 0.454902, 0, 1,
-1.45908, -2.569505, -3.86782, 1, 0.4627451, 0, 1,
-1.458958, -1.982655, -1.261957, 1, 0.4666667, 0, 1,
-1.450282, -0.8207694, -2.116759, 1, 0.4745098, 0, 1,
-1.448798, -0.7734876, -2.541879, 1, 0.4784314, 0, 1,
-1.440941, -1.006664, -3.140637, 1, 0.4862745, 0, 1,
-1.423979, 0.5213906, 0.03495953, 1, 0.4901961, 0, 1,
-1.423499, 0.2766722, 0.3860368, 1, 0.4980392, 0, 1,
-1.41872, 0.9765644, -0.3327219, 1, 0.5058824, 0, 1,
-1.406578, -0.3333531, -0.4064177, 1, 0.509804, 0, 1,
-1.39637, 0.6046022, -0.332026, 1, 0.5176471, 0, 1,
-1.394836, 0.1022545, -0.09172186, 1, 0.5215687, 0, 1,
-1.377944, -0.9571998, -0.8662794, 1, 0.5294118, 0, 1,
-1.367478, -2.163446, -2.108827, 1, 0.5333334, 0, 1,
-1.36124, 0.7036032, -1.469957, 1, 0.5411765, 0, 1,
-1.358271, -0.6960977, -1.610918, 1, 0.5450981, 0, 1,
-1.357309, 0.3841777, -1.559343, 1, 0.5529412, 0, 1,
-1.333964, 1.783773, -1.41146, 1, 0.5568628, 0, 1,
-1.330621, -0.2468006, 0.07797924, 1, 0.5647059, 0, 1,
-1.32886, 0.9474471, -2.555456, 1, 0.5686275, 0, 1,
-1.325383, -1.763514, -2.34515, 1, 0.5764706, 0, 1,
-1.322897, 1.489609, -2.3588, 1, 0.5803922, 0, 1,
-1.321146, -1.750579, -2.536666, 1, 0.5882353, 0, 1,
-1.31722, -0.172237, -1.482121, 1, 0.5921569, 0, 1,
-1.296134, 0.5427327, -0.04077347, 1, 0.6, 0, 1,
-1.289991, -1.077438, -2.021168, 1, 0.6078432, 0, 1,
-1.286718, 0.2516635, 0.2359865, 1, 0.6117647, 0, 1,
-1.285246, -1.984101, -2.540535, 1, 0.6196079, 0, 1,
-1.276162, -1.262276, -2.404903, 1, 0.6235294, 0, 1,
-1.262345, -0.6968662, -2.935005, 1, 0.6313726, 0, 1,
-1.261811, 0.297311, -1.716884, 1, 0.6352941, 0, 1,
-1.255874, -0.5569283, -1.8667, 1, 0.6431373, 0, 1,
-1.252555, 0.8224497, -1.828899, 1, 0.6470588, 0, 1,
-1.249524, 0.1068942, -1.614146, 1, 0.654902, 0, 1,
-1.249442, 0.02545857, -1.194469, 1, 0.6588235, 0, 1,
-1.244898, -1.389475, -2.29679, 1, 0.6666667, 0, 1,
-1.23805, -0.03242616, -1.934343, 1, 0.6705883, 0, 1,
-1.232063, 0.3885635, -0.6963106, 1, 0.6784314, 0, 1,
-1.231358, -1.675557, -2.592762, 1, 0.682353, 0, 1,
-1.220422, 0.3302428, -0.8683938, 1, 0.6901961, 0, 1,
-1.213667, -0.05101181, -1.749367, 1, 0.6941177, 0, 1,
-1.213132, 0.8900367, 0.3543975, 1, 0.7019608, 0, 1,
-1.212684, 2.20995, -2.224406, 1, 0.7098039, 0, 1,
-1.211976, -0.4861108, -2.658142, 1, 0.7137255, 0, 1,
-1.200174, -0.3850816, -1.430243, 1, 0.7215686, 0, 1,
-1.191307, 0.3013115, -0.02098013, 1, 0.7254902, 0, 1,
-1.166261, 0.2878082, -1.516511, 1, 0.7333333, 0, 1,
-1.165265, -0.3215929, -1.403633, 1, 0.7372549, 0, 1,
-1.160293, -1.16658, -1.54511, 1, 0.7450981, 0, 1,
-1.150728, -0.7741703, -2.824348, 1, 0.7490196, 0, 1,
-1.15072, 0.8272188, -1.08332, 1, 0.7568628, 0, 1,
-1.148951, -0.9011695, -2.149311, 1, 0.7607843, 0, 1,
-1.147132, 0.009889253, -1.030685, 1, 0.7686275, 0, 1,
-1.136696, 0.03487027, -2.248755, 1, 0.772549, 0, 1,
-1.134565, 0.5013525, -1.091099, 1, 0.7803922, 0, 1,
-1.134401, 0.1793404, -0.7703415, 1, 0.7843137, 0, 1,
-1.131534, 0.9514338, -2.203356, 1, 0.7921569, 0, 1,
-1.131499, -2.4001, -1.727388, 1, 0.7960784, 0, 1,
-1.130183, 0.6545318, -1.254717, 1, 0.8039216, 0, 1,
-1.120597, 0.1790331, -1.063443, 1, 0.8117647, 0, 1,
-1.104768, 1.735644, -1.813338, 1, 0.8156863, 0, 1,
-1.102122, -0.2627421, -1.656108, 1, 0.8235294, 0, 1,
-1.100735, 0.8200203, -0.2946458, 1, 0.827451, 0, 1,
-1.099734, 0.3135496, -0.5927942, 1, 0.8352941, 0, 1,
-1.099617, -1.262135, -1.777578, 1, 0.8392157, 0, 1,
-1.092183, 0.2679714, -0.715395, 1, 0.8470588, 0, 1,
-1.090585, -0.08884813, -3.389202, 1, 0.8509804, 0, 1,
-1.08708, -0.8301336, -1.879517, 1, 0.8588235, 0, 1,
-1.084204, 1.185948, -0.5641957, 1, 0.8627451, 0, 1,
-1.079095, 0.5695463, -0.3440863, 1, 0.8705882, 0, 1,
-1.077929, -1.269178, -3.590738, 1, 0.8745098, 0, 1,
-1.07278, 1.680482, -0.03626746, 1, 0.8823529, 0, 1,
-1.06907, -0.2083813, -0.8906331, 1, 0.8862745, 0, 1,
-1.06527, 0.03206586, -0.8623099, 1, 0.8941177, 0, 1,
-1.058899, -0.04092854, -3.444932, 1, 0.8980392, 0, 1,
-1.052869, -1.312963, -3.647704, 1, 0.9058824, 0, 1,
-1.050719, -0.4294861, -1.354438, 1, 0.9137255, 0, 1,
-1.043676, -0.09966081, -2.186609, 1, 0.9176471, 0, 1,
-1.02692, -1.178698, -1.957947, 1, 0.9254902, 0, 1,
-1.025488, -1.064672, -3.692477, 1, 0.9294118, 0, 1,
-1.023187, 0.9135453, -1.416637, 1, 0.9372549, 0, 1,
-1.021248, -0.05731021, -3.213674, 1, 0.9411765, 0, 1,
-1.012241, -0.9380566, -3.119578, 1, 0.9490196, 0, 1,
-1.007505, -0.5568398, -2.196422, 1, 0.9529412, 0, 1,
-1.007269, -0.5819299, -0.7516953, 1, 0.9607843, 0, 1,
-1.000691, 0.3580835, -2.131004, 1, 0.9647059, 0, 1,
-0.9949339, -0.8932533, -2.539524, 1, 0.972549, 0, 1,
-0.9927248, 1.17031, -0.4451323, 1, 0.9764706, 0, 1,
-0.99129, 1.257611, -1.259115, 1, 0.9843137, 0, 1,
-0.9869958, -1.009157, -1.461968, 1, 0.9882353, 0, 1,
-0.9855195, 1.432523, -1.652542, 1, 0.9960784, 0, 1,
-0.979449, 0.7829479, -3.051199, 0.9960784, 1, 0, 1,
-0.9751964, 0.8018308, -0.01738688, 0.9921569, 1, 0, 1,
-0.9652056, 0.678185, -0.3771082, 0.9843137, 1, 0, 1,
-0.9639217, -0.4481632, -1.460966, 0.9803922, 1, 0, 1,
-0.9630396, 1.505701, 0.2798913, 0.972549, 1, 0, 1,
-0.9589226, 0.6191769, -0.004022098, 0.9686275, 1, 0, 1,
-0.9546126, 0.05474956, -0.8668441, 0.9607843, 1, 0, 1,
-0.9512674, -0.2210913, -1.227421, 0.9568627, 1, 0, 1,
-0.9483445, -0.2908383, -1.359071, 0.9490196, 1, 0, 1,
-0.9463912, -1.612007, -1.574039, 0.945098, 1, 0, 1,
-0.9405945, 0.6132401, -1.493032, 0.9372549, 1, 0, 1,
-0.9295973, -0.5980001, -2.573596, 0.9333333, 1, 0, 1,
-0.9264579, 0.7378389, 1.584985, 0.9254902, 1, 0, 1,
-0.9240608, 1.068996, -1.930984, 0.9215686, 1, 0, 1,
-0.9138244, 1.746689, -2.086104, 0.9137255, 1, 0, 1,
-0.91226, -1.354826, -2.480388, 0.9098039, 1, 0, 1,
-0.9111019, 1.177322, 0.03551253, 0.9019608, 1, 0, 1,
-0.8998314, 0.585358, -1.69085, 0.8941177, 1, 0, 1,
-0.8977534, 0.3440655, -0.9993677, 0.8901961, 1, 0, 1,
-0.8923429, -1.500853, -1.075828, 0.8823529, 1, 0, 1,
-0.8920782, -0.9780903, -2.576626, 0.8784314, 1, 0, 1,
-0.8895271, 0.8668815, -0.6338883, 0.8705882, 1, 0, 1,
-0.8891416, -1.207528, -2.693815, 0.8666667, 1, 0, 1,
-0.8866172, 0.9104629, -0.3262829, 0.8588235, 1, 0, 1,
-0.8837734, 0.5151681, -1.72985, 0.854902, 1, 0, 1,
-0.8804471, -0.2604733, 0.0380405, 0.8470588, 1, 0, 1,
-0.8751586, -0.2116801, -1.484196, 0.8431373, 1, 0, 1,
-0.8691837, -0.6025406, -2.19382, 0.8352941, 1, 0, 1,
-0.8691154, 1.285143, -0.00621462, 0.8313726, 1, 0, 1,
-0.865653, -0.5587378, -1.105655, 0.8235294, 1, 0, 1,
-0.8655741, 0.02657394, -1.476925, 0.8196079, 1, 0, 1,
-0.8637859, -0.0693519, -0.3498656, 0.8117647, 1, 0, 1,
-0.8571547, -0.9957699, -1.986166, 0.8078431, 1, 0, 1,
-0.8524322, -0.7818241, -2.032058, 0.8, 1, 0, 1,
-0.8472666, 0.3331711, -2.938878, 0.7921569, 1, 0, 1,
-0.844632, 1.682926, -2.841092, 0.7882353, 1, 0, 1,
-0.8404916, 0.9394105, -1.082646, 0.7803922, 1, 0, 1,
-0.837944, 0.2033993, -0.8373923, 0.7764706, 1, 0, 1,
-0.8376928, 0.7937906, -0.8711139, 0.7686275, 1, 0, 1,
-0.8367181, 0.8768824, -0.7842049, 0.7647059, 1, 0, 1,
-0.8338361, -1.286414, -3.626874, 0.7568628, 1, 0, 1,
-0.8313426, -1.22674, -4.170601, 0.7529412, 1, 0, 1,
-0.8210272, 0.8789671, -1.557574, 0.7450981, 1, 0, 1,
-0.820519, -0.2627908, -2.934182, 0.7411765, 1, 0, 1,
-0.817489, 0.4136985, 1.191013, 0.7333333, 1, 0, 1,
-0.808027, 0.07470118, -0.7824442, 0.7294118, 1, 0, 1,
-0.8068997, 0.8081201, -1.645444, 0.7215686, 1, 0, 1,
-0.800684, 0.1588489, -3.053574, 0.7176471, 1, 0, 1,
-0.7997524, 0.4966084, -2.367943, 0.7098039, 1, 0, 1,
-0.7943999, -0.1342562, -1.140563, 0.7058824, 1, 0, 1,
-0.7933353, 0.420175, -0.8197845, 0.6980392, 1, 0, 1,
-0.7929618, -1.110443, -2.119298, 0.6901961, 1, 0, 1,
-0.7874675, -0.04507283, -1.999729, 0.6862745, 1, 0, 1,
-0.7873412, -2.901811, -2.21625, 0.6784314, 1, 0, 1,
-0.7864934, 0.6182851, 0.004610206, 0.6745098, 1, 0, 1,
-0.7846791, -0.8972762, -2.491176, 0.6666667, 1, 0, 1,
-0.7835281, 0.4891166, -1.194174, 0.6627451, 1, 0, 1,
-0.7686637, 1.414774, -1.222334, 0.654902, 1, 0, 1,
-0.768647, -1.001215, -3.332981, 0.6509804, 1, 0, 1,
-0.7671211, -0.4857229, -1.794235, 0.6431373, 1, 0, 1,
-0.7641237, -1.59726, -3.268614, 0.6392157, 1, 0, 1,
-0.7636002, -1.355789, -1.391986, 0.6313726, 1, 0, 1,
-0.7633225, -0.3094769, -0.6303043, 0.627451, 1, 0, 1,
-0.7632161, 0.4059233, -1.378403, 0.6196079, 1, 0, 1,
-0.7631488, -0.4060955, -1.413635, 0.6156863, 1, 0, 1,
-0.7575948, 0.1751745, 0.4232574, 0.6078432, 1, 0, 1,
-0.7559482, -0.03365748, -2.382405, 0.6039216, 1, 0, 1,
-0.7423759, -0.6252306, -2.356994, 0.5960785, 1, 0, 1,
-0.7332115, 0.7112778, -1.758221, 0.5882353, 1, 0, 1,
-0.7280054, 2.079184, -0.331794, 0.5843138, 1, 0, 1,
-0.7246312, -0.1935273, -1.127703, 0.5764706, 1, 0, 1,
-0.7243381, -0.4581288, -1.977114, 0.572549, 1, 0, 1,
-0.7212213, 0.6190479, -1.850733, 0.5647059, 1, 0, 1,
-0.721067, 1.158666, -1.974131, 0.5607843, 1, 0, 1,
-0.7209764, 1.810282, 0.8910689, 0.5529412, 1, 0, 1,
-0.7182585, -0.8958929, -1.003279, 0.5490196, 1, 0, 1,
-0.7154412, -0.6867881, -1.425657, 0.5411765, 1, 0, 1,
-0.7151021, -0.7191495, -1.48412, 0.5372549, 1, 0, 1,
-0.7127014, 0.3917388, -0.3425824, 0.5294118, 1, 0, 1,
-0.7120189, 0.3377879, -0.7255418, 0.5254902, 1, 0, 1,
-0.7097487, 0.09383717, -0.1381453, 0.5176471, 1, 0, 1,
-0.7085639, -0.4673674, -2.465647, 0.5137255, 1, 0, 1,
-0.697312, 0.3811528, -1.615975, 0.5058824, 1, 0, 1,
-0.6889672, 1.117579, -0.8103744, 0.5019608, 1, 0, 1,
-0.6828703, -1.691481, -1.607533, 0.4941176, 1, 0, 1,
-0.6813751, 0.2183703, 0.2596752, 0.4862745, 1, 0, 1,
-0.6805734, 0.86227, -0.8822108, 0.4823529, 1, 0, 1,
-0.6801434, -1.006712, -1.178661, 0.4745098, 1, 0, 1,
-0.6680544, 0.8514374, -1.859374, 0.4705882, 1, 0, 1,
-0.6674849, -0.04516964, -2.572082, 0.4627451, 1, 0, 1,
-0.6636143, 0.9327996, -2.196649, 0.4588235, 1, 0, 1,
-0.6610803, 0.6619239, -0.02464063, 0.4509804, 1, 0, 1,
-0.6564125, -1.380901, -1.777187, 0.4470588, 1, 0, 1,
-0.6556264, 1.209526, -1.527882, 0.4392157, 1, 0, 1,
-0.6485346, 0.715484, 0.5075004, 0.4352941, 1, 0, 1,
-0.6465842, -0.826355, -2.013584, 0.427451, 1, 0, 1,
-0.6442774, -0.8011641, -3.361457, 0.4235294, 1, 0, 1,
-0.6363682, -0.3986885, -1.642101, 0.4156863, 1, 0, 1,
-0.6340854, 0.8482462, -0.7128621, 0.4117647, 1, 0, 1,
-0.6332138, -0.4341336, -1.422103, 0.4039216, 1, 0, 1,
-0.6278927, -0.2203235, -2.741136, 0.3960784, 1, 0, 1,
-0.6274672, -0.5073888, -0.09205529, 0.3921569, 1, 0, 1,
-0.6265206, -1.271166, -3.102065, 0.3843137, 1, 0, 1,
-0.6160256, 0.7486671, 0.7250606, 0.3803922, 1, 0, 1,
-0.6141122, -0.2068197, -1.615628, 0.372549, 1, 0, 1,
-0.6140131, -0.9068857, 0.2743548, 0.3686275, 1, 0, 1,
-0.6127418, 0.1496039, -1.279182, 0.3607843, 1, 0, 1,
-0.6123998, 0.5396239, -1.456527, 0.3568628, 1, 0, 1,
-0.6100171, 0.295197, -0.29484, 0.3490196, 1, 0, 1,
-0.606191, -0.2778314, -1.557221, 0.345098, 1, 0, 1,
-0.6059507, -0.7753394, -3.807907, 0.3372549, 1, 0, 1,
-0.6057406, 1.145729, -0.9394825, 0.3333333, 1, 0, 1,
-0.5983368, 0.2698056, 0.3089218, 0.3254902, 1, 0, 1,
-0.5971859, 0.6631501, -0.5948775, 0.3215686, 1, 0, 1,
-0.5966238, 0.3068753, -1.073583, 0.3137255, 1, 0, 1,
-0.5935577, -1.027061, -2.800454, 0.3098039, 1, 0, 1,
-0.5919027, -2.429978, -2.556861, 0.3019608, 1, 0, 1,
-0.5906473, 0.5729781, -1.179399, 0.2941177, 1, 0, 1,
-0.5891712, -1.54799, -3.891741, 0.2901961, 1, 0, 1,
-0.5883945, 0.3427611, -0.5035109, 0.282353, 1, 0, 1,
-0.5871331, 0.02950966, -1.734999, 0.2784314, 1, 0, 1,
-0.5839317, 0.1089026, -1.895199, 0.2705882, 1, 0, 1,
-0.5834282, 0.7066661, -1.033125, 0.2666667, 1, 0, 1,
-0.5798355, -1.616816, -2.724092, 0.2588235, 1, 0, 1,
-0.5794994, -0.005428786, -2.239414, 0.254902, 1, 0, 1,
-0.5786968, -0.2124116, -1.470227, 0.2470588, 1, 0, 1,
-0.5774006, 0.7348652, -1.559306, 0.2431373, 1, 0, 1,
-0.5752173, -0.4294209, -1.33228, 0.2352941, 1, 0, 1,
-0.5743731, -0.5456281, -3.166743, 0.2313726, 1, 0, 1,
-0.5736542, -0.5911806, -2.157011, 0.2235294, 1, 0, 1,
-0.573625, 0.7239822, -0.719448, 0.2196078, 1, 0, 1,
-0.5724843, -0.1329637, -1.698577, 0.2117647, 1, 0, 1,
-0.5716883, -1.748825, -2.48543, 0.2078431, 1, 0, 1,
-0.5643795, 0.9368033, 0.07714411, 0.2, 1, 0, 1,
-0.553641, 1.161112, -1.116117, 0.1921569, 1, 0, 1,
-0.5506064, 0.4036072, 1.013984, 0.1882353, 1, 0, 1,
-0.5397963, -0.6347384, -3.173932, 0.1803922, 1, 0, 1,
-0.5356506, 0.3672743, -0.07693492, 0.1764706, 1, 0, 1,
-0.528986, -2.658253, -2.773445, 0.1686275, 1, 0, 1,
-0.5284349, 0.7532775, -2.047495, 0.1647059, 1, 0, 1,
-0.5230589, -0.7145437, -3.189547, 0.1568628, 1, 0, 1,
-0.5221288, 0.1137481, -0.3763953, 0.1529412, 1, 0, 1,
-0.5197693, 0.7895874, 1.061345, 0.145098, 1, 0, 1,
-0.5153332, 0.8490171, -0.7085236, 0.1411765, 1, 0, 1,
-0.5080681, 1.677362, 0.1592758, 0.1333333, 1, 0, 1,
-0.5064238, -0.9508191, -2.451029, 0.1294118, 1, 0, 1,
-0.505487, -0.8333446, -4.373807, 0.1215686, 1, 0, 1,
-0.5043828, -1.228286, -3.606417, 0.1176471, 1, 0, 1,
-0.504043, -0.6449928, -1.856939, 0.1098039, 1, 0, 1,
-0.4982635, -0.2248102, -0.7464572, 0.1058824, 1, 0, 1,
-0.4963082, 0.0245565, -0.8407317, 0.09803922, 1, 0, 1,
-0.4942071, -0.3393841, -0.322886, 0.09019608, 1, 0, 1,
-0.4905879, 0.7536648, -0.03832685, 0.08627451, 1, 0, 1,
-0.4892758, 0.0004564248, -1.914432, 0.07843138, 1, 0, 1,
-0.4852747, -0.7153271, -1.03875, 0.07450981, 1, 0, 1,
-0.4761938, -1.584526, -2.985922, 0.06666667, 1, 0, 1,
-0.4742189, -0.5222272, -3.053855, 0.0627451, 1, 0, 1,
-0.4736159, 1.15396, 0.2908944, 0.05490196, 1, 0, 1,
-0.4712088, -1.754676, -2.801553, 0.05098039, 1, 0, 1,
-0.4684402, -1.139045, -0.8007818, 0.04313726, 1, 0, 1,
-0.4664699, -1.056126, -3.621513, 0.03921569, 1, 0, 1,
-0.466135, -0.9475198, -2.525511, 0.03137255, 1, 0, 1,
-0.4614567, 1.005988, -1.149122, 0.02745098, 1, 0, 1,
-0.4596601, -1.255783, -2.102691, 0.01960784, 1, 0, 1,
-0.4587831, -0.3565434, -2.629066, 0.01568628, 1, 0, 1,
-0.4583013, -1.893876, -3.052637, 0.007843138, 1, 0, 1,
-0.4532432, 0.4469854, -0.3155369, 0.003921569, 1, 0, 1,
-0.4496543, -0.5406611, -1.586729, 0, 1, 0.003921569, 1,
-0.4490052, 0.2424348, -1.579767, 0, 1, 0.01176471, 1,
-0.448735, -0.7377274, -2.480194, 0, 1, 0.01568628, 1,
-0.4469907, 0.2023387, -0.4232314, 0, 1, 0.02352941, 1,
-0.4456409, 0.02003759, -1.24463, 0, 1, 0.02745098, 1,
-0.4454169, 0.9850077, 0.5615035, 0, 1, 0.03529412, 1,
-0.4305617, 1.243096, 1.043676, 0, 1, 0.03921569, 1,
-0.4287632, 0.01391747, -2.600238, 0, 1, 0.04705882, 1,
-0.4282306, 0.6956069, -1.459425, 0, 1, 0.05098039, 1,
-0.4270884, -0.4967907, -3.282107, 0, 1, 0.05882353, 1,
-0.4235972, 0.9947502, -1.457434, 0, 1, 0.0627451, 1,
-0.4212196, 1.041961, 0.7354739, 0, 1, 0.07058824, 1,
-0.4152544, 1.003629, 0.275768, 0, 1, 0.07450981, 1,
-0.4138334, 0.8828944, 1.909313, 0, 1, 0.08235294, 1,
-0.4135163, -0.06778893, -1.97994, 0, 1, 0.08627451, 1,
-0.4130072, 1.761187, 0.4621172, 0, 1, 0.09411765, 1,
-0.4086567, 0.3025273, -0.4629273, 0, 1, 0.1019608, 1,
-0.4083168, -1.550969, -3.092754, 0, 1, 0.1058824, 1,
-0.4073198, -0.05700389, -1.433959, 0, 1, 0.1137255, 1,
-0.4064364, 0.2298905, -0.9928901, 0, 1, 0.1176471, 1,
-0.4045769, -2.13755, -1.234046, 0, 1, 0.1254902, 1,
-0.4038523, -1.273595, -2.127758, 0, 1, 0.1294118, 1,
-0.4033005, 0.6249228, -1.111275, 0, 1, 0.1372549, 1,
-0.402836, -0.7797482, -2.447218, 0, 1, 0.1411765, 1,
-0.3962759, -0.6666139, -3.371409, 0, 1, 0.1490196, 1,
-0.3921242, 1.145294, -1.04232, 0, 1, 0.1529412, 1,
-0.3915698, -1.079863, -5.304882, 0, 1, 0.1607843, 1,
-0.3847125, 0.3031474, 0.8251516, 0, 1, 0.1647059, 1,
-0.3804397, 1.525523, -0.8689923, 0, 1, 0.172549, 1,
-0.3774341, 0.5620654, 1.502527, 0, 1, 0.1764706, 1,
-0.3770591, 0.2611789, -2.135758, 0, 1, 0.1843137, 1,
-0.3753982, 0.5814096, -1.269958, 0, 1, 0.1882353, 1,
-0.3743613, 0.08262154, -0.0914754, 0, 1, 0.1960784, 1,
-0.3734964, 1.258045, 0.5763699, 0, 1, 0.2039216, 1,
-0.3679912, 1.051069, -1.374395, 0, 1, 0.2078431, 1,
-0.3648463, 0.5791187, -1.551128, 0, 1, 0.2156863, 1,
-0.3596984, 1.419484, -0.5132867, 0, 1, 0.2196078, 1,
-0.3579646, -1.15334, -3.786834, 0, 1, 0.227451, 1,
-0.3557938, 1.337821, -1.073358, 0, 1, 0.2313726, 1,
-0.3546883, 0.7059171, -0.8911, 0, 1, 0.2392157, 1,
-0.354524, 0.6898916, -1.01829, 0, 1, 0.2431373, 1,
-0.3509714, 0.7455918, -0.08296265, 0, 1, 0.2509804, 1,
-0.3474123, 0.4457955, -0.4695827, 0, 1, 0.254902, 1,
-0.3474077, 0.04622116, -0.5683557, 0, 1, 0.2627451, 1,
-0.3463546, -1.212573, -2.133665, 0, 1, 0.2666667, 1,
-0.3396182, -0.02036615, -3.524185, 0, 1, 0.2745098, 1,
-0.3335357, 0.5307805, -0.2327254, 0, 1, 0.2784314, 1,
-0.3306844, 1.667524, 0.1504549, 0, 1, 0.2862745, 1,
-0.3302604, 0.6184208, -1.24178, 0, 1, 0.2901961, 1,
-0.3270662, -2.473609, 0.1558623, 0, 1, 0.2980392, 1,
-0.3263951, -1.614685, -3.393138, 0, 1, 0.3058824, 1,
-0.3235986, -0.763519, -3.402754, 0, 1, 0.3098039, 1,
-0.321826, 0.9435079, -0.6184117, 0, 1, 0.3176471, 1,
-0.319372, 0.01386402, -1.077617, 0, 1, 0.3215686, 1,
-0.3191093, -1.274831, -4.897484, 0, 1, 0.3294118, 1,
-0.3190724, -0.09438731, -2.574275, 0, 1, 0.3333333, 1,
-0.3188394, -0.5800941, -0.7741341, 0, 1, 0.3411765, 1,
-0.3133543, 0.3131544, -0.9420364, 0, 1, 0.345098, 1,
-0.312943, 0.9735188, -0.02954792, 0, 1, 0.3529412, 1,
-0.3103816, -0.8821933, -2.736314, 0, 1, 0.3568628, 1,
-0.3099799, -0.2109285, -3.773845, 0, 1, 0.3647059, 1,
-0.3085833, -1.328476, -1.037737, 0, 1, 0.3686275, 1,
-0.3081661, 0.9072064, 0.7251014, 0, 1, 0.3764706, 1,
-0.3068317, 0.9531758, 0.02433126, 0, 1, 0.3803922, 1,
-0.3058316, 0.1262038, -2.213941, 0, 1, 0.3882353, 1,
-0.3049316, 0.9198796, -0.4620024, 0, 1, 0.3921569, 1,
-0.3022568, 0.2118127, -1.194689, 0, 1, 0.4, 1,
-0.2969342, -0.6043447, -3.159443, 0, 1, 0.4078431, 1,
-0.2909048, -0.7913141, -1.593943, 0, 1, 0.4117647, 1,
-0.2891784, -0.8097954, -1.808671, 0, 1, 0.4196078, 1,
-0.2888265, -0.6736417, -2.633402, 0, 1, 0.4235294, 1,
-0.2868895, 1.466306, -1.312875, 0, 1, 0.4313726, 1,
-0.2837106, -1.456827, -2.926763, 0, 1, 0.4352941, 1,
-0.2785327, -0.02202952, -1.199943, 0, 1, 0.4431373, 1,
-0.2782258, -1.505074, -3.624115, 0, 1, 0.4470588, 1,
-0.2770499, 2.738057, -0.8929669, 0, 1, 0.454902, 1,
-0.2752153, -1.352019, -2.129467, 0, 1, 0.4588235, 1,
-0.2658745, 0.2278622, -0.9762563, 0, 1, 0.4666667, 1,
-0.2406312, 0.2754613, -0.2375741, 0, 1, 0.4705882, 1,
-0.2391079, -0.8918527, -3.573626, 0, 1, 0.4784314, 1,
-0.2357475, -0.2226587, -1.793715, 0, 1, 0.4823529, 1,
-0.2353137, -0.8083988, -2.130188, 0, 1, 0.4901961, 1,
-0.2352054, -0.4755961, -2.001457, 0, 1, 0.4941176, 1,
-0.2329111, -0.742476, -1.959632, 0, 1, 0.5019608, 1,
-0.2267465, -1.225724, -2.711602, 0, 1, 0.509804, 1,
-0.2241094, -0.3682584, -1.706232, 0, 1, 0.5137255, 1,
-0.2239743, -0.6793752, -2.761038, 0, 1, 0.5215687, 1,
-0.2187888, -0.2168925, -2.184595, 0, 1, 0.5254902, 1,
-0.2148362, 1.697571, -0.4040437, 0, 1, 0.5333334, 1,
-0.210744, -0.4684461, -1.517502, 0, 1, 0.5372549, 1,
-0.2089285, 0.1683844, 0.3406057, 0, 1, 0.5450981, 1,
-0.2086568, -0.3909566, -1.315124, 0, 1, 0.5490196, 1,
-0.2036465, 0.2514699, 0.8225001, 0, 1, 0.5568628, 1,
-0.2026722, 1.19362, -1.292448, 0, 1, 0.5607843, 1,
-0.1979871, -0.6639396, -1.424338, 0, 1, 0.5686275, 1,
-0.1926148, 0.04627903, -0.8187405, 0, 1, 0.572549, 1,
-0.1906375, 2.362977, -0.3589904, 0, 1, 0.5803922, 1,
-0.185272, 0.7402573, -2.564245, 0, 1, 0.5843138, 1,
-0.1813896, -1.412975, -4.785828, 0, 1, 0.5921569, 1,
-0.1805222, 0.4845716, -2.008023, 0, 1, 0.5960785, 1,
-0.1792051, -1.134335, -2.83482, 0, 1, 0.6039216, 1,
-0.1783744, 0.6824402, -0.2724456, 0, 1, 0.6117647, 1,
-0.1768775, -0.1568079, -2.689231, 0, 1, 0.6156863, 1,
-0.1741259, -1.719774, -6.683602, 0, 1, 0.6235294, 1,
-0.1727037, -0.310455, -2.859434, 0, 1, 0.627451, 1,
-0.1726545, 0.004521253, -3.557443, 0, 1, 0.6352941, 1,
-0.1698466, 0.7063163, -0.3093723, 0, 1, 0.6392157, 1,
-0.1697511, -0.9873767, -3.871185, 0, 1, 0.6470588, 1,
-0.1681739, 1.304065, 1.658505, 0, 1, 0.6509804, 1,
-0.1643759, 1.735015, 0.6102928, 0, 1, 0.6588235, 1,
-0.1620185, -1.007934, -1.86883, 0, 1, 0.6627451, 1,
-0.1611642, -1.173062, -1.937794, 0, 1, 0.6705883, 1,
-0.1601385, -0.7874902, -2.176702, 0, 1, 0.6745098, 1,
-0.1549855, -0.5104912, -2.388901, 0, 1, 0.682353, 1,
-0.1548394, -0.06914351, -2.680115, 0, 1, 0.6862745, 1,
-0.1543712, 1.522972, -2.436449, 0, 1, 0.6941177, 1,
-0.1499079, 1.235382, 1.354922, 0, 1, 0.7019608, 1,
-0.1459866, 0.1847767, -0.7643861, 0, 1, 0.7058824, 1,
-0.1425566, 0.5512519, -0.3193731, 0, 1, 0.7137255, 1,
-0.1386468, -0.09025545, -1.058951, 0, 1, 0.7176471, 1,
-0.1360947, -0.006566583, -1.739395, 0, 1, 0.7254902, 1,
-0.13142, 0.3435673, -0.08481098, 0, 1, 0.7294118, 1,
-0.1282264, -2.173665, -2.797936, 0, 1, 0.7372549, 1,
-0.1277153, -0.7011182, -2.510991, 0, 1, 0.7411765, 1,
-0.1246488, -0.7306318, -2.20322, 0, 1, 0.7490196, 1,
-0.1241198, 1.740459, -1.689119, 0, 1, 0.7529412, 1,
-0.1230582, -0.5789557, -3.198381, 0, 1, 0.7607843, 1,
-0.1206938, -1.355577, -2.628432, 0, 1, 0.7647059, 1,
-0.1187666, -0.2321202, -2.832031, 0, 1, 0.772549, 1,
-0.1150721, 0.1005514, -1.415854, 0, 1, 0.7764706, 1,
-0.1120455, 1.504511, -0.5094269, 0, 1, 0.7843137, 1,
-0.1064528, 0.1625963, 0.2091934, 0, 1, 0.7882353, 1,
-0.1039343, -1.329979, -2.203022, 0, 1, 0.7960784, 1,
-0.1026108, -0.7968314, -4.101318, 0, 1, 0.8039216, 1,
-0.09113067, 0.8650836, 0.9036793, 0, 1, 0.8078431, 1,
-0.08869807, -0.04043955, -2.124921, 0, 1, 0.8156863, 1,
-0.08796898, -0.2920835, -3.080073, 0, 1, 0.8196079, 1,
-0.08472552, -1.040927, -2.517127, 0, 1, 0.827451, 1,
-0.08442746, 0.4418136, 0.4896689, 0, 1, 0.8313726, 1,
-0.08399099, -1.128496, -2.617432, 0, 1, 0.8392157, 1,
-0.07846271, 0.5180269, -0.5889413, 0, 1, 0.8431373, 1,
-0.07360058, 0.1889904, -0.9346795, 0, 1, 0.8509804, 1,
-0.07147871, -0.4727768, -2.675729, 0, 1, 0.854902, 1,
-0.07006332, -0.30252, -3.368541, 0, 1, 0.8627451, 1,
-0.06749203, -0.8750412, -1.953302, 0, 1, 0.8666667, 1,
-0.06598548, -1.310137, -2.195785, 0, 1, 0.8745098, 1,
-0.06461357, 1.360484, -1.598015, 0, 1, 0.8784314, 1,
-0.06253812, 0.3828915, -0.2289077, 0, 1, 0.8862745, 1,
-0.06143445, 0.462256, 0.9424223, 0, 1, 0.8901961, 1,
-0.06102128, 0.8520873, 1.394241, 0, 1, 0.8980392, 1,
-0.05563605, -0.356149, -3.961705, 0, 1, 0.9058824, 1,
-0.05535914, 0.9844585, 1.105392, 0, 1, 0.9098039, 1,
-0.05498039, 1.584394, 0.4926794, 0, 1, 0.9176471, 1,
-0.05066135, -1.452252, -3.145448, 0, 1, 0.9215686, 1,
-0.04928261, 0.482944, 1.264765, 0, 1, 0.9294118, 1,
-0.04222807, 0.2289546, 0.6601198, 0, 1, 0.9333333, 1,
-0.03801676, -0.1716503, -0.2898419, 0, 1, 0.9411765, 1,
-0.03516341, -0.4999795, -4.134652, 0, 1, 0.945098, 1,
-0.03451906, -1.427868, -3.861828, 0, 1, 0.9529412, 1,
-0.03285598, -0.5964219, -3.376117, 0, 1, 0.9568627, 1,
-0.02464872, -0.2413195, -1.363899, 0, 1, 0.9647059, 1,
-0.02464275, 0.2631729, -0.03127767, 0, 1, 0.9686275, 1,
-0.02425975, -1.045835, -3.926255, 0, 1, 0.9764706, 1,
-0.02257329, 0.3268332, 0.6423019, 0, 1, 0.9803922, 1,
-0.02232811, 1.478516, -0.9079759, 0, 1, 0.9882353, 1,
-0.0209162, -0.9945617, -3.499947, 0, 1, 0.9921569, 1,
-0.02075828, -0.1698197, -3.221602, 0, 1, 1, 1,
-0.01855423, -1.614716, -4.050608, 0, 0.9921569, 1, 1,
-0.01607922, -0.8162808, -1.20773, 0, 0.9882353, 1, 1,
-0.008833029, -0.008408207, 0.7241759, 0, 0.9803922, 1, 1,
-0.008556675, -0.6455553, -2.760655, 0, 0.9764706, 1, 1,
-0.006739639, 0.3534729, 0.3607657, 0, 0.9686275, 1, 1,
0.003125731, -0.003053629, 1.373778, 0, 0.9647059, 1, 1,
0.0053243, 1.343521, 0.9108714, 0, 0.9568627, 1, 1,
0.007930112, -1.10494, 2.770582, 0, 0.9529412, 1, 1,
0.00841117, 1.314379, -0.931164, 0, 0.945098, 1, 1,
0.01530452, -0.6719061, 4.32553, 0, 0.9411765, 1, 1,
0.01907754, -0.8072159, 3.856413, 0, 0.9333333, 1, 1,
0.0195728, -0.1678196, 0.5394698, 0, 0.9294118, 1, 1,
0.02337593, -1.086538, 2.308931, 0, 0.9215686, 1, 1,
0.02713061, 0.04178949, 1.064809, 0, 0.9176471, 1, 1,
0.0390909, 0.2717355, -0.5204014, 0, 0.9098039, 1, 1,
0.04937138, 0.6099563, 0.2713169, 0, 0.9058824, 1, 1,
0.05194389, 0.8374326, -1.845268, 0, 0.8980392, 1, 1,
0.05203295, 0.8985572, 0.9564615, 0, 0.8901961, 1, 1,
0.05250547, -1.136115, 2.219067, 0, 0.8862745, 1, 1,
0.05289137, 1.161526, -0.3020308, 0, 0.8784314, 1, 1,
0.05361142, 1.601222, -0.4582272, 0, 0.8745098, 1, 1,
0.0575416, 1.673098, -1.407752, 0, 0.8666667, 1, 1,
0.0611255, -0.07009722, 1.482719, 0, 0.8627451, 1, 1,
0.06124548, -1.086759, 4.448388, 0, 0.854902, 1, 1,
0.06137035, 0.1539313, 0.5129775, 0, 0.8509804, 1, 1,
0.06330671, 0.8247332, 1.547604, 0, 0.8431373, 1, 1,
0.06743469, 0.7878509, 0.1744909, 0, 0.8392157, 1, 1,
0.07206319, -1.045243, 3.326164, 0, 0.8313726, 1, 1,
0.07521065, -0.5093449, 3.039835, 0, 0.827451, 1, 1,
0.07970394, -1.060385, 0.4171396, 0, 0.8196079, 1, 1,
0.08357418, 0.1299693, 0.8993235, 0, 0.8156863, 1, 1,
0.08493666, 0.5757259, -0.9592904, 0, 0.8078431, 1, 1,
0.08495342, -0.3447096, 2.467246, 0, 0.8039216, 1, 1,
0.08624078, 0.1032471, 1.491723, 0, 0.7960784, 1, 1,
0.09208366, -0.5294073, 4.9474, 0, 0.7882353, 1, 1,
0.09763125, -1.033406, 1.992531, 0, 0.7843137, 1, 1,
0.09790571, 1.790627, 1.099694, 0, 0.7764706, 1, 1,
0.09885414, 0.1589776, 0.07675073, 0, 0.772549, 1, 1,
0.1057317, -2.464416, 4.136559, 0, 0.7647059, 1, 1,
0.107467, 0.3149663, 1.582552, 0, 0.7607843, 1, 1,
0.10998, -0.7745733, 3.150691, 0, 0.7529412, 1, 1,
0.1132983, 0.6612946, -0.9917136, 0, 0.7490196, 1, 1,
0.1176971, -1.505034, 1.443363, 0, 0.7411765, 1, 1,
0.1202637, -0.7498801, 2.433588, 0, 0.7372549, 1, 1,
0.1203609, -0.4577896, 2.372932, 0, 0.7294118, 1, 1,
0.1266574, 0.6836151, -0.8736447, 0, 0.7254902, 1, 1,
0.1285259, -0.8952154, 3.294995, 0, 0.7176471, 1, 1,
0.1287495, 0.3342196, 0.2268456, 0, 0.7137255, 1, 1,
0.1288539, 0.643294, -1.145859, 0, 0.7058824, 1, 1,
0.1397996, -1.969799, 2.919847, 0, 0.6980392, 1, 1,
0.1410132, -0.03574545, -0.2813602, 0, 0.6941177, 1, 1,
0.1445453, -0.6087211, 3.663126, 0, 0.6862745, 1, 1,
0.1448602, -2.312792, 4.066857, 0, 0.682353, 1, 1,
0.1452011, -0.1287125, 1.747799, 0, 0.6745098, 1, 1,
0.146672, -2.043054, 4.597836, 0, 0.6705883, 1, 1,
0.1493814, -1.029837, 2.223521, 0, 0.6627451, 1, 1,
0.1494355, -1.416295, 4.875814, 0, 0.6588235, 1, 1,
0.1508062, -0.9445438, 2.677816, 0, 0.6509804, 1, 1,
0.1553407, 0.4707209, 0.259954, 0, 0.6470588, 1, 1,
0.1609716, 0.16779, -0.7876751, 0, 0.6392157, 1, 1,
0.161841, -0.9299109, 2.324243, 0, 0.6352941, 1, 1,
0.1618881, -0.2524743, 3.368253, 0, 0.627451, 1, 1,
0.164452, -0.5389484, 2.487652, 0, 0.6235294, 1, 1,
0.1698158, -0.7019796, 2.972999, 0, 0.6156863, 1, 1,
0.1731211, 1.22976, -0.1162678, 0, 0.6117647, 1, 1,
0.1740273, 1.434096, -0.8824506, 0, 0.6039216, 1, 1,
0.1851405, -0.3172649, 1.322047, 0, 0.5960785, 1, 1,
0.1902372, 0.8019395, 0.515835, 0, 0.5921569, 1, 1,
0.1955938, 0.06420848, 1.09265, 0, 0.5843138, 1, 1,
0.1968759, 0.3504785, -0.3446192, 0, 0.5803922, 1, 1,
0.1969373, 0.005814904, 1.436599, 0, 0.572549, 1, 1,
0.1995708, 0.7208705, 0.4070939, 0, 0.5686275, 1, 1,
0.2045135, 0.452462, -0.4112084, 0, 0.5607843, 1, 1,
0.2066337, 1.031403, 2.347765, 0, 0.5568628, 1, 1,
0.2070156, 1.804839, -1.233563, 0, 0.5490196, 1, 1,
0.2075785, -0.9485189, 1.625594, 0, 0.5450981, 1, 1,
0.2091002, -2.609473, 2.918332, 0, 0.5372549, 1, 1,
0.2152694, -1.494534, 3.654375, 0, 0.5333334, 1, 1,
0.220184, -1.02048, 2.152035, 0, 0.5254902, 1, 1,
0.2210734, 0.8677465, -0.06299558, 0, 0.5215687, 1, 1,
0.2225613, 0.1710387, 0.159017, 0, 0.5137255, 1, 1,
0.2286489, -0.1983827, 3.578393, 0, 0.509804, 1, 1,
0.229898, 0.7245698, 1.860244, 0, 0.5019608, 1, 1,
0.2316317, -1.074575, 2.039416, 0, 0.4941176, 1, 1,
0.2351257, -0.65367, 4.299541, 0, 0.4901961, 1, 1,
0.2391828, -0.3512064, 4.203377, 0, 0.4823529, 1, 1,
0.239792, 1.020075, 1.108284, 0, 0.4784314, 1, 1,
0.2443637, -0.6600983, 1.524525, 0, 0.4705882, 1, 1,
0.2487503, 0.3262848, -0.2638882, 0, 0.4666667, 1, 1,
0.2601291, -2.153267, 3.607326, 0, 0.4588235, 1, 1,
0.2613863, -0.3282008, 0.7837375, 0, 0.454902, 1, 1,
0.2636454, 0.7019801, 0.6005339, 0, 0.4470588, 1, 1,
0.2642375, 0.2451754, -1.406233, 0, 0.4431373, 1, 1,
0.2643691, -0.8159351, 1.127852, 0, 0.4352941, 1, 1,
0.2658563, -0.5903983, 2.026227, 0, 0.4313726, 1, 1,
0.2673894, -0.9356453, 3.471969, 0, 0.4235294, 1, 1,
0.2676387, -0.3746355, 2.826219, 0, 0.4196078, 1, 1,
0.2709523, 0.1541013, 0.226728, 0, 0.4117647, 1, 1,
0.2726817, 1.042425, 1.042135, 0, 0.4078431, 1, 1,
0.2755718, 0.5336875, 1.562667, 0, 0.4, 1, 1,
0.2762302, 0.6634925, 0.6080164, 0, 0.3921569, 1, 1,
0.2769732, 0.8568101, -0.6038144, 0, 0.3882353, 1, 1,
0.2789688, 0.04459931, 1.508228, 0, 0.3803922, 1, 1,
0.2795593, 1.369536, -0.305226, 0, 0.3764706, 1, 1,
0.2836979, 1.209488, -0.5809696, 0, 0.3686275, 1, 1,
0.2838136, -0.9582627, 2.66603, 0, 0.3647059, 1, 1,
0.2839166, -0.7528684, 2.029252, 0, 0.3568628, 1, 1,
0.2871001, -0.6561585, 2.402594, 0, 0.3529412, 1, 1,
0.2968214, -1.062636, 2.782007, 0, 0.345098, 1, 1,
0.2971116, 0.3722807, -0.1702481, 0, 0.3411765, 1, 1,
0.3009431, -1.882601, 5.431207, 0, 0.3333333, 1, 1,
0.3020858, 0.5947476, -1.33687, 0, 0.3294118, 1, 1,
0.3030159, 0.2155737, 0.8575478, 0, 0.3215686, 1, 1,
0.3058515, -0.6212459, 3.173474, 0, 0.3176471, 1, 1,
0.3069153, -0.08230322, 2.51406, 0, 0.3098039, 1, 1,
0.3106203, -0.4916337, 3.635461, 0, 0.3058824, 1, 1,
0.3126551, -0.835786, 3.150945, 0, 0.2980392, 1, 1,
0.3149022, -0.04701052, 1.567402, 0, 0.2901961, 1, 1,
0.3151104, -0.8920305, 1.391037, 0, 0.2862745, 1, 1,
0.3177167, 0.1146371, 2.780329, 0, 0.2784314, 1, 1,
0.3181666, -0.1404769, 1.663797, 0, 0.2745098, 1, 1,
0.3312005, 0.2366845, 1.12426, 0, 0.2666667, 1, 1,
0.3367246, -1.227266, 1.284149, 0, 0.2627451, 1, 1,
0.3391235, -0.3698308, 2.821814, 0, 0.254902, 1, 1,
0.3394921, -0.1883681, 2.660362, 0, 0.2509804, 1, 1,
0.3433598, -0.4478044, 4.102899, 0, 0.2431373, 1, 1,
0.3480526, 0.3257145, 1.467696, 0, 0.2392157, 1, 1,
0.3492615, 0.9424577, 0.6944982, 0, 0.2313726, 1, 1,
0.3501881, 0.04953562, 0.0481141, 0, 0.227451, 1, 1,
0.3554698, 0.5079783, 2.030092, 0, 0.2196078, 1, 1,
0.3556854, -1.317248, 2.936384, 0, 0.2156863, 1, 1,
0.3558951, -0.07868797, 1.60869, 0, 0.2078431, 1, 1,
0.3574542, 1.00576, -0.3275679, 0, 0.2039216, 1, 1,
0.3602762, 1.31163, 1.23584, 0, 0.1960784, 1, 1,
0.3675056, -0.9794827, 3.28208, 0, 0.1882353, 1, 1,
0.3719566, -0.1247366, 1.88851, 0, 0.1843137, 1, 1,
0.3762535, -0.1078591, 2.324405, 0, 0.1764706, 1, 1,
0.384705, 0.8493569, -0.03760819, 0, 0.172549, 1, 1,
0.3859264, 0.4807991, -0.3664427, 0, 0.1647059, 1, 1,
0.3871228, 2.042299, 1.201607, 0, 0.1607843, 1, 1,
0.3897635, -1.188753, 1.755205, 0, 0.1529412, 1, 1,
0.3899139, 0.06750266, 1.883813, 0, 0.1490196, 1, 1,
0.3904721, -0.3321298, 2.894526, 0, 0.1411765, 1, 1,
0.3906437, 0.9294368, 0.5213687, 0, 0.1372549, 1, 1,
0.3916607, 0.2219325, 0.7134706, 0, 0.1294118, 1, 1,
0.4010631, -1.700119, 4.500392, 0, 0.1254902, 1, 1,
0.4020201, -0.8173854, 1.915486, 0, 0.1176471, 1, 1,
0.4070292, 1.45672, 1.245738, 0, 0.1137255, 1, 1,
0.4080868, 0.4824075, -0.9858375, 0, 0.1058824, 1, 1,
0.4120035, -1.19192, 2.989428, 0, 0.09803922, 1, 1,
0.4128338, 1.448601, 0.4071149, 0, 0.09411765, 1, 1,
0.4146529, -0.8188308, 4.167202, 0, 0.08627451, 1, 1,
0.4161009, -0.05842892, 1.593255, 0, 0.08235294, 1, 1,
0.4186679, 0.0766123, 0.4463589, 0, 0.07450981, 1, 1,
0.4191335, -0.3100668, 1.178417, 0, 0.07058824, 1, 1,
0.4205458, 0.4690771, 1.103979, 0, 0.0627451, 1, 1,
0.4280543, -0.1636443, 1.783835, 0, 0.05882353, 1, 1,
0.4287691, -1.491872, 1.52774, 0, 0.05098039, 1, 1,
0.4294991, 1.428349, -0.0499467, 0, 0.04705882, 1, 1,
0.4303186, 0.1478267, 2.647912, 0, 0.03921569, 1, 1,
0.4396107, -1.066012, 0.164771, 0, 0.03529412, 1, 1,
0.440025, -1.721306, 2.376367, 0, 0.02745098, 1, 1,
0.4514183, -1.546203, 3.65322, 0, 0.02352941, 1, 1,
0.4571154, 0.4897732, 1.424974, 0, 0.01568628, 1, 1,
0.4575982, -0.005615097, 3.172603, 0, 0.01176471, 1, 1,
0.4580294, 0.3475788, -0.157283, 0, 0.003921569, 1, 1,
0.4608087, 1.112204, 2.032276, 0.003921569, 0, 1, 1,
0.4648388, 0.9920211, 2.479496, 0.007843138, 0, 1, 1,
0.4712054, -0.2464108, 2.43634, 0.01568628, 0, 1, 1,
0.4761803, -1.713392, 2.483959, 0.01960784, 0, 1, 1,
0.4762828, 1.39088, 0.3622908, 0.02745098, 0, 1, 1,
0.4839575, 0.9063243, 3.018907, 0.03137255, 0, 1, 1,
0.4840371, 1.016525, -1.496757, 0.03921569, 0, 1, 1,
0.4845088, -0.6112396, 2.393694, 0.04313726, 0, 1, 1,
0.4861592, 0.4328709, -0.3645507, 0.05098039, 0, 1, 1,
0.493764, -1.058255, 2.695828, 0.05490196, 0, 1, 1,
0.4980753, -0.4079361, 1.8757, 0.0627451, 0, 1, 1,
0.4991092, -0.3972364, 2.612081, 0.06666667, 0, 1, 1,
0.4996046, -0.7242083, 1.546772, 0.07450981, 0, 1, 1,
0.4996468, -0.2075779, 1.382102, 0.07843138, 0, 1, 1,
0.5096828, 2.757739, 2.474115, 0.08627451, 0, 1, 1,
0.5103223, 0.8371906, 0.3012586, 0.09019608, 0, 1, 1,
0.5104814, -0.04388393, 2.401461, 0.09803922, 0, 1, 1,
0.5115273, -1.094973, 1.0897, 0.1058824, 0, 1, 1,
0.5123553, 1.175454, 1.161167, 0.1098039, 0, 1, 1,
0.5155149, -2.098653, 2.24578, 0.1176471, 0, 1, 1,
0.5167637, 0.7873138, 0.9739912, 0.1215686, 0, 1, 1,
0.5178167, -0.4588353, 1.817744, 0.1294118, 0, 1, 1,
0.519386, 0.2844028, 0.3488833, 0.1333333, 0, 1, 1,
0.520947, 1.372493, -1.546407, 0.1411765, 0, 1, 1,
0.5236391, 0.5262017, 1.672681, 0.145098, 0, 1, 1,
0.5264782, -0.1204546, 1.507038, 0.1529412, 0, 1, 1,
0.5275044, 2.250227, 1.502377, 0.1568628, 0, 1, 1,
0.5313253, -0.2906117, 2.477358, 0.1647059, 0, 1, 1,
0.5321632, -0.2879768, 1.853883, 0.1686275, 0, 1, 1,
0.5342948, 1.595283, -1.338281, 0.1764706, 0, 1, 1,
0.5355512, 1.51794, 1.432146, 0.1803922, 0, 1, 1,
0.5373847, -1.634761, 3.407995, 0.1882353, 0, 1, 1,
0.5401726, -1.063768, 4.153936, 0.1921569, 0, 1, 1,
0.5449339, 0.912945, 0.6644092, 0.2, 0, 1, 1,
0.5479127, -1.462055, 4.534677, 0.2078431, 0, 1, 1,
0.5484467, 0.5487036, 0.9846811, 0.2117647, 0, 1, 1,
0.5500349, -0.4152913, 1.621202, 0.2196078, 0, 1, 1,
0.5506998, -0.7268761, 1.992233, 0.2235294, 0, 1, 1,
0.5515525, 0.9907129, 1.221712, 0.2313726, 0, 1, 1,
0.5559537, 0.0867772, 0.4416204, 0.2352941, 0, 1, 1,
0.5585829, -0.03734398, 2.118148, 0.2431373, 0, 1, 1,
0.5630183, -0.2480118, 2.875411, 0.2470588, 0, 1, 1,
0.5634532, -1.901098, 2.432609, 0.254902, 0, 1, 1,
0.5657458, -0.1593172, 2.700495, 0.2588235, 0, 1, 1,
0.5688014, -0.6510882, 3.461776, 0.2666667, 0, 1, 1,
0.5694715, 0.9924169, 1.063488, 0.2705882, 0, 1, 1,
0.5699942, 1.088381, -0.286834, 0.2784314, 0, 1, 1,
0.5756832, 0.7616895, -0.3615508, 0.282353, 0, 1, 1,
0.576139, 0.3365293, 2.076713, 0.2901961, 0, 1, 1,
0.5805083, -1.813141, 3.204437, 0.2941177, 0, 1, 1,
0.5880628, 0.8042175, -0.1385938, 0.3019608, 0, 1, 1,
0.5902134, -0.1374245, 0.9980562, 0.3098039, 0, 1, 1,
0.5904114, -2.231056, 3.982006, 0.3137255, 0, 1, 1,
0.5936177, 0.3598435, 3.582089, 0.3215686, 0, 1, 1,
0.5969064, 0.9731425, -0.005022371, 0.3254902, 0, 1, 1,
0.5969701, -0.198983, 1.520811, 0.3333333, 0, 1, 1,
0.5984313, 0.08812211, 3.237434, 0.3372549, 0, 1, 1,
0.598595, 0.3860402, 0.7737108, 0.345098, 0, 1, 1,
0.5986102, 1.098099, -0.8177959, 0.3490196, 0, 1, 1,
0.5997432, 0.3929964, 1.654915, 0.3568628, 0, 1, 1,
0.6074592, 0.2084469, 1.083366, 0.3607843, 0, 1, 1,
0.6095566, 1.914379, -1.430743, 0.3686275, 0, 1, 1,
0.6114277, -0.7891743, 2.953468, 0.372549, 0, 1, 1,
0.6139548, 1.590465, 1.263517, 0.3803922, 0, 1, 1,
0.6147614, -0.8389931, 3.325375, 0.3843137, 0, 1, 1,
0.616007, -0.3687722, 3.177413, 0.3921569, 0, 1, 1,
0.6165916, 0.6527398, 1.080623, 0.3960784, 0, 1, 1,
0.6197779, -0.9430464, 3.759264, 0.4039216, 0, 1, 1,
0.6199601, 0.4243336, 2.264536, 0.4117647, 0, 1, 1,
0.6263873, -1.517716, 4.741578, 0.4156863, 0, 1, 1,
0.6300183, -0.08130657, 2.481578, 0.4235294, 0, 1, 1,
0.6329178, -2.278413, 5.490182, 0.427451, 0, 1, 1,
0.6364862, 0.7117957, 1.043376, 0.4352941, 0, 1, 1,
0.6371081, -1.161442, 3.43129, 0.4392157, 0, 1, 1,
0.6415569, -0.3507684, 1.816646, 0.4470588, 0, 1, 1,
0.6448894, 0.8240581, 0.6904956, 0.4509804, 0, 1, 1,
0.6497276, 0.3608247, 0.46935, 0.4588235, 0, 1, 1,
0.6516747, 0.4486716, 1.903258, 0.4627451, 0, 1, 1,
0.6535522, -1.630103, 2.450134, 0.4705882, 0, 1, 1,
0.667856, -2.330907, 1.697112, 0.4745098, 0, 1, 1,
0.6721599, -0.8330112, 2.32919, 0.4823529, 0, 1, 1,
0.6745774, 1.274613, -0.9778312, 0.4862745, 0, 1, 1,
0.675488, 0.3537616, 2.00581, 0.4941176, 0, 1, 1,
0.6820014, -0.7209955, 3.508044, 0.5019608, 0, 1, 1,
0.6849535, -0.2525509, 3.190272, 0.5058824, 0, 1, 1,
0.6860634, 2.402435, -0.3086486, 0.5137255, 0, 1, 1,
0.6863888, -0.7242783, 1.307327, 0.5176471, 0, 1, 1,
0.7082995, -0.2418656, 2.425609, 0.5254902, 0, 1, 1,
0.7158015, 1.048901, 0.7923144, 0.5294118, 0, 1, 1,
0.7163851, -0.3717663, 2.831326, 0.5372549, 0, 1, 1,
0.7164082, -0.1334942, 2.180009, 0.5411765, 0, 1, 1,
0.718639, 2.234344, 0.1268561, 0.5490196, 0, 1, 1,
0.7289521, 0.2138898, 1.45024, 0.5529412, 0, 1, 1,
0.7321537, -1.354982, 3.868392, 0.5607843, 0, 1, 1,
0.7328783, 0.3086542, 0.59284, 0.5647059, 0, 1, 1,
0.7341133, -1.845077, 2.745375, 0.572549, 0, 1, 1,
0.7378053, 0.09234446, 0.2194122, 0.5764706, 0, 1, 1,
0.7411528, -0.6683841, 1.344466, 0.5843138, 0, 1, 1,
0.7457853, -1.507926, 0.1231612, 0.5882353, 0, 1, 1,
0.753348, 1.026902, 1.587719, 0.5960785, 0, 1, 1,
0.7595704, -0.05080351, 0.8076116, 0.6039216, 0, 1, 1,
0.7612109, -0.213415, 2.519759, 0.6078432, 0, 1, 1,
0.7618889, 1.556488, -0.09618749, 0.6156863, 0, 1, 1,
0.7632464, -0.5245066, 2.650899, 0.6196079, 0, 1, 1,
0.7636316, 1.890258, 1.090777, 0.627451, 0, 1, 1,
0.7667738, -2.905019, 2.710831, 0.6313726, 0, 1, 1,
0.7679336, 0.8760989, 0.5932186, 0.6392157, 0, 1, 1,
0.7684147, 0.111552, 1.608386, 0.6431373, 0, 1, 1,
0.7757477, -1.701707, 3.198917, 0.6509804, 0, 1, 1,
0.7759749, 1.859153, -0.7654969, 0.654902, 0, 1, 1,
0.7779546, -0.5667061, 2.613356, 0.6627451, 0, 1, 1,
0.7807903, -0.03787921, 2.537677, 0.6666667, 0, 1, 1,
0.7849181, -1.132321, 3.025575, 0.6745098, 0, 1, 1,
0.7921882, 0.2377945, 2.719761, 0.6784314, 0, 1, 1,
0.7964281, 1.311632, -0.526219, 0.6862745, 0, 1, 1,
0.7973325, 0.03728024, 2.089272, 0.6901961, 0, 1, 1,
0.7985181, 0.2310393, 0.1836183, 0.6980392, 0, 1, 1,
0.8004656, 1.221303, 0.2797896, 0.7058824, 0, 1, 1,
0.8019125, -0.6272388, 1.81328, 0.7098039, 0, 1, 1,
0.8051397, -0.2922132, 2.527101, 0.7176471, 0, 1, 1,
0.8072963, 1.308258, -0.2812751, 0.7215686, 0, 1, 1,
0.8115924, 0.1770726, 0.8149915, 0.7294118, 0, 1, 1,
0.8138344, 1.454912, 0.9276622, 0.7333333, 0, 1, 1,
0.8153089, -0.9385995, 3.018565, 0.7411765, 0, 1, 1,
0.8192946, 2.450744, 0.7340634, 0.7450981, 0, 1, 1,
0.8239039, 0.4385131, 0.6903859, 0.7529412, 0, 1, 1,
0.8429962, 1.708872, 2.221634, 0.7568628, 0, 1, 1,
0.8467708, -0.3834389, 1.672337, 0.7647059, 0, 1, 1,
0.8477195, -1.094438, 0.8641787, 0.7686275, 0, 1, 1,
0.8511173, 0.4098291, 1.042859, 0.7764706, 0, 1, 1,
0.8527619, -0.237901, 2.059585, 0.7803922, 0, 1, 1,
0.8547255, 2.02163, -0.3822758, 0.7882353, 0, 1, 1,
0.8554769, 0.2892972, 0.7919374, 0.7921569, 0, 1, 1,
0.8594526, -0.2108837, 0.8078782, 0.8, 0, 1, 1,
0.8594593, 1.802857, 0.8491282, 0.8078431, 0, 1, 1,
0.8601355, 1.15772, 1.324398, 0.8117647, 0, 1, 1,
0.8634584, 0.4090652, 1.83518, 0.8196079, 0, 1, 1,
0.8638256, 0.1080791, 2.721986, 0.8235294, 0, 1, 1,
0.86598, 1.359579, 1.406315, 0.8313726, 0, 1, 1,
0.8703081, -0.5060079, 2.728494, 0.8352941, 0, 1, 1,
0.872808, -1.175359, 4.271834, 0.8431373, 0, 1, 1,
0.8743096, 0.7133625, 1.822779, 0.8470588, 0, 1, 1,
0.8744197, 1.525092, -0.1253787, 0.854902, 0, 1, 1,
0.8747143, -1.129274, 3.144229, 0.8588235, 0, 1, 1,
0.8832539, 0.1886034, -0.3517517, 0.8666667, 0, 1, 1,
0.8854851, 2.396673, 0.3679247, 0.8705882, 0, 1, 1,
0.8874294, -0.5523875, 1.751415, 0.8784314, 0, 1, 1,
0.891513, 0.8898998, -0.6256366, 0.8823529, 0, 1, 1,
0.8992484, -0.7097635, 1.888163, 0.8901961, 0, 1, 1,
0.8998663, 0.7753989, 0.6094375, 0.8941177, 0, 1, 1,
0.9002463, 0.1740486, 2.106874, 0.9019608, 0, 1, 1,
0.9004107, -1.885319, 2.738937, 0.9098039, 0, 1, 1,
0.9058568, 1.141453, 2.30586, 0.9137255, 0, 1, 1,
0.9084655, 0.2195201, 2.024057, 0.9215686, 0, 1, 1,
0.9189251, -1.726484, 0.9288389, 0.9254902, 0, 1, 1,
0.9263664, 0.9463461, 1.279455, 0.9333333, 0, 1, 1,
0.9272842, 0.8069788, 1.387505, 0.9372549, 0, 1, 1,
0.9283404, -1.016998, 3.608338, 0.945098, 0, 1, 1,
0.9293333, -1.057193, 2.678676, 0.9490196, 0, 1, 1,
0.9297909, 1.017733, 1.434981, 0.9568627, 0, 1, 1,
0.9381301, 0.0564681, 1.280193, 0.9607843, 0, 1, 1,
0.9404749, -0.9682456, 2.852921, 0.9686275, 0, 1, 1,
0.9494143, 1.03562, 0.6740582, 0.972549, 0, 1, 1,
0.9528951, 0.6135189, -0.06995326, 0.9803922, 0, 1, 1,
0.9533654, -1.501179, 4.650567, 0.9843137, 0, 1, 1,
0.9541387, -2.392256, 4.056952, 0.9921569, 0, 1, 1,
0.9560931, -1.6633, 1.868666, 0.9960784, 0, 1, 1,
0.966864, 1.032542, 0.6525264, 1, 0, 0.9960784, 1,
0.9678578, -0.5994548, 2.999025, 1, 0, 0.9882353, 1,
0.9681055, 0.8861221, 0.6974623, 1, 0, 0.9843137, 1,
0.97009, 0.08529992, 1.47269, 1, 0, 0.9764706, 1,
0.9734445, 0.5474175, 1.753987, 1, 0, 0.972549, 1,
0.974187, 1.099964, 2.38659, 1, 0, 0.9647059, 1,
0.9769854, 1.644037, 0.5614668, 1, 0, 0.9607843, 1,
0.9780387, -0.5864852, 3.025087, 1, 0, 0.9529412, 1,
0.9785551, 1.34723, 0.1098827, 1, 0, 0.9490196, 1,
1.001801, 0.297754, 1.65054, 1, 0, 0.9411765, 1,
1.002825, 0.8932309, 0.7233706, 1, 0, 0.9372549, 1,
1.003746, -1.442353, 2.983513, 1, 0, 0.9294118, 1,
1.004744, -0.6652886, 2.28738, 1, 0, 0.9254902, 1,
1.004768, 0.5057492, 2.506688, 1, 0, 0.9176471, 1,
1.008126, 0.8079185, 3.145846, 1, 0, 0.9137255, 1,
1.008825, 1.032945, 2.495773, 1, 0, 0.9058824, 1,
1.021702, 0.5944542, 0.7713068, 1, 0, 0.9019608, 1,
1.022233, -0.8493553, 1.427346, 1, 0, 0.8941177, 1,
1.025291, -1.793741, 1.761617, 1, 0, 0.8862745, 1,
1.03019, 0.7640588, 0.187491, 1, 0, 0.8823529, 1,
1.032236, 1.560146, -1.288865, 1, 0, 0.8745098, 1,
1.056345, 1.457047, 0.7753244, 1, 0, 0.8705882, 1,
1.067385, -2.268877, 4.064952, 1, 0, 0.8627451, 1,
1.07113, 0.3780059, 0.5494499, 1, 0, 0.8588235, 1,
1.073715, -0.6929369, 2.763586, 1, 0, 0.8509804, 1,
1.077727, 0.3542537, 2.501812, 1, 0, 0.8470588, 1,
1.079413, 0.9282369, 2.410301, 1, 0, 0.8392157, 1,
1.086278, -1.679336, 2.822347, 1, 0, 0.8352941, 1,
1.086444, -0.807894, 2.797864, 1, 0, 0.827451, 1,
1.092769, 1.523985, 0.8029574, 1, 0, 0.8235294, 1,
1.095646, -0.5343111, 2.494543, 1, 0, 0.8156863, 1,
1.09835, 2.273029, -0.3474236, 1, 0, 0.8117647, 1,
1.100711, 0.2572118, 2.445184, 1, 0, 0.8039216, 1,
1.100936, 0.6142322, 3.683935, 1, 0, 0.7960784, 1,
1.10113, 1.750754, -0.3207181, 1, 0, 0.7921569, 1,
1.102776, 1.428436, 0.3834426, 1, 0, 0.7843137, 1,
1.1037, -0.5632923, 1.51882, 1, 0, 0.7803922, 1,
1.103999, -0.337648, 0.09082004, 1, 0, 0.772549, 1,
1.105279, 0.8076907, 2.184406, 1, 0, 0.7686275, 1,
1.113216, -0.6803926, 1.334818, 1, 0, 0.7607843, 1,
1.116104, 0.6443141, 0.8951972, 1, 0, 0.7568628, 1,
1.116509, -1.402198, 1.819744, 1, 0, 0.7490196, 1,
1.116943, -0.6103957, 1.841442, 1, 0, 0.7450981, 1,
1.1202, -1.154053, 1.078286, 1, 0, 0.7372549, 1,
1.123516, 0.7964523, 1.529407, 1, 0, 0.7333333, 1,
1.12492, 0.4437347, -0.1742511, 1, 0, 0.7254902, 1,
1.126423, -1.297299, 2.857152, 1, 0, 0.7215686, 1,
1.134825, 1.473213, -0.9233692, 1, 0, 0.7137255, 1,
1.139982, 0.7566396, -1.252757, 1, 0, 0.7098039, 1,
1.14589, -1.115816, 1.448151, 1, 0, 0.7019608, 1,
1.148295, -0.3183807, 1.13316, 1, 0, 0.6941177, 1,
1.155195, 1.186808, -0.4297804, 1, 0, 0.6901961, 1,
1.165934, -0.1431893, 0.9782289, 1, 0, 0.682353, 1,
1.166227, -0.9220158, 4.537443, 1, 0, 0.6784314, 1,
1.169188, 0.3712317, -0.6053548, 1, 0, 0.6705883, 1,
1.175574, -0.9426654, 2.928532, 1, 0, 0.6666667, 1,
1.182614, -0.07996897, -0.04181892, 1, 0, 0.6588235, 1,
1.183279, 1.408203, -0.5355982, 1, 0, 0.654902, 1,
1.18376, 0.2169774, 0.6050599, 1, 0, 0.6470588, 1,
1.190907, 0.0429966, 1.643023, 1, 0, 0.6431373, 1,
1.194668, -1.18568, 1.474669, 1, 0, 0.6352941, 1,
1.211653, -0.1515226, 1.430083, 1, 0, 0.6313726, 1,
1.212187, -0.3713751, 0.9428316, 1, 0, 0.6235294, 1,
1.22118, -2.267762, 2.257197, 1, 0, 0.6196079, 1,
1.223896, 0.2470169, 0.9812492, 1, 0, 0.6117647, 1,
1.228178, -0.6706492, 1.869336, 1, 0, 0.6078432, 1,
1.229099, -0.2033907, 0.6838206, 1, 0, 0.6, 1,
1.230761, 0.1102931, 1.508446, 1, 0, 0.5921569, 1,
1.244362, -1.506447, 2.498556, 1, 0, 0.5882353, 1,
1.251088, -1.417352, 3.05258, 1, 0, 0.5803922, 1,
1.256333, 1.396381, 0.1291267, 1, 0, 0.5764706, 1,
1.257944, -0.3481838, 0.6018784, 1, 0, 0.5686275, 1,
1.257967, -0.2183171, 2.136136, 1, 0, 0.5647059, 1,
1.267396, -0.8170592, 1.300146, 1, 0, 0.5568628, 1,
1.275518, -0.4483413, 2.10327, 1, 0, 0.5529412, 1,
1.275901, 2.056299, 1.142797, 1, 0, 0.5450981, 1,
1.2783, 1.401902, 0.6561838, 1, 0, 0.5411765, 1,
1.288676, -1.184574, 2.33769, 1, 0, 0.5333334, 1,
1.293631, 0.2888376, -0.01536674, 1, 0, 0.5294118, 1,
1.305515, 0.6961099, -0.02570508, 1, 0, 0.5215687, 1,
1.307709, 0.5176599, 0.9953937, 1, 0, 0.5176471, 1,
1.309193, -1.248693, 2.961091, 1, 0, 0.509804, 1,
1.310287, -0.01784859, -0.31923, 1, 0, 0.5058824, 1,
1.310961, -0.1269866, 1.673461, 1, 0, 0.4980392, 1,
1.316526, 0.5473757, 0.995106, 1, 0, 0.4901961, 1,
1.317101, 2.02807, 0.5684225, 1, 0, 0.4862745, 1,
1.323722, -0.02002457, 2.442051, 1, 0, 0.4784314, 1,
1.323962, -1.334537, 2.4688, 1, 0, 0.4745098, 1,
1.329608, -0.3807396, 2.736842, 1, 0, 0.4666667, 1,
1.329854, -0.4604684, 2.31739, 1, 0, 0.4627451, 1,
1.334804, -0.9255878, 0.5180874, 1, 0, 0.454902, 1,
1.338654, -0.3247518, 1.738666, 1, 0, 0.4509804, 1,
1.349875, -0.3346354, 2.337713, 1, 0, 0.4431373, 1,
1.354081, -1.492907, 3.597315, 1, 0, 0.4392157, 1,
1.35595, 0.1164788, 1.293674, 1, 0, 0.4313726, 1,
1.357607, 0.6071425, 1.139305, 1, 0, 0.427451, 1,
1.370226, 0.7018806, 2.366924, 1, 0, 0.4196078, 1,
1.39091, 0.640969, 0.682968, 1, 0, 0.4156863, 1,
1.392696, 0.6047761, 0.8486091, 1, 0, 0.4078431, 1,
1.420397, 0.932353, -0.1306076, 1, 0, 0.4039216, 1,
1.439716, 0.2429777, 1.624997, 1, 0, 0.3960784, 1,
1.456636, 1.60788, 0.9284377, 1, 0, 0.3882353, 1,
1.465733, -1.804817, 1.876318, 1, 0, 0.3843137, 1,
1.467635, 0.2216228, 1.077409, 1, 0, 0.3764706, 1,
1.469132, -0.2237902, 1.669474, 1, 0, 0.372549, 1,
1.493816, 0.5897782, 1.429074, 1, 0, 0.3647059, 1,
1.496066, -0.5679573, 1.755708, 1, 0, 0.3607843, 1,
1.502992, -1.128405, 2.49919, 1, 0, 0.3529412, 1,
1.511416, 0.1877726, 1.211459, 1, 0, 0.3490196, 1,
1.523831, -0.8088773, 3.698916, 1, 0, 0.3411765, 1,
1.526676, -1.991114, 1.098959, 1, 0, 0.3372549, 1,
1.535818, -0.1481661, 1.172117, 1, 0, 0.3294118, 1,
1.544935, -1.033787, 1.091851, 1, 0, 0.3254902, 1,
1.55311, -2.647921, 1.456269, 1, 0, 0.3176471, 1,
1.566462, 1.71654, -1.245033, 1, 0, 0.3137255, 1,
1.573967, -0.3711576, 2.23109, 1, 0, 0.3058824, 1,
1.575855, 0.3366902, 2.534573, 1, 0, 0.2980392, 1,
1.579388, 0.18895, 1.12309, 1, 0, 0.2941177, 1,
1.593997, 0.6250893, 1.398171, 1, 0, 0.2862745, 1,
1.597447, 0.008944371, -0.5239508, 1, 0, 0.282353, 1,
1.604625, 0.9168632, 1.890622, 1, 0, 0.2745098, 1,
1.621543, -0.438691, 2.300364, 1, 0, 0.2705882, 1,
1.629952, -0.8396779, 2.054249, 1, 0, 0.2627451, 1,
1.644881, -0.5839846, 1.305763, 1, 0, 0.2588235, 1,
1.657642, 0.8161774, 2.13756, 1, 0, 0.2509804, 1,
1.660761, -1.021963, 2.659908, 1, 0, 0.2470588, 1,
1.664407, -0.906324, 1.683568, 1, 0, 0.2392157, 1,
1.664712, -0.6126454, 3.431033, 1, 0, 0.2352941, 1,
1.674452, 1.126418, -0.04801108, 1, 0, 0.227451, 1,
1.678816, -0.942766, 2.018779, 1, 0, 0.2235294, 1,
1.692591, 1.030739, 1.225408, 1, 0, 0.2156863, 1,
1.710202, 0.9154034, 0.4495915, 1, 0, 0.2117647, 1,
1.724802, -2.775722, 1.009215, 1, 0, 0.2039216, 1,
1.727776, -1.527706, 1.581031, 1, 0, 0.1960784, 1,
1.735618, 0.7033556, 1.323087, 1, 0, 0.1921569, 1,
1.753092, -1.012287, 0.5993624, 1, 0, 0.1843137, 1,
1.757442, -0.5191756, 3.132298, 1, 0, 0.1803922, 1,
1.763358, 1.700367, -0.08046167, 1, 0, 0.172549, 1,
1.770222, 1.166681, -0.6662017, 1, 0, 0.1686275, 1,
1.786476, -0.4584275, 1.962457, 1, 0, 0.1607843, 1,
1.788645, 0.2414524, 0.9846631, 1, 0, 0.1568628, 1,
1.806072, 2.539194, -1.116148, 1, 0, 0.1490196, 1,
1.838558, 0.5511093, 1.173079, 1, 0, 0.145098, 1,
1.842612, -0.1145741, 2.01347, 1, 0, 0.1372549, 1,
1.845938, -2.210435, 3.600758, 1, 0, 0.1333333, 1,
1.861882, -1.46572, 2.313464, 1, 0, 0.1254902, 1,
1.872813, -1.08594, 2.174537, 1, 0, 0.1215686, 1,
1.873738, -0.1039328, 1.86791, 1, 0, 0.1137255, 1,
1.886374, -1.951845, -0.1270458, 1, 0, 0.1098039, 1,
1.928511, 1.36607, 1.542837, 1, 0, 0.1019608, 1,
1.964925, -0.1395398, 3.517349, 1, 0, 0.09411765, 1,
1.970014, -2.715915, 1.725207, 1, 0, 0.09019608, 1,
2.009639, -1.414507, 1.683467, 1, 0, 0.08235294, 1,
2.064756, -0.7053775, 0.8401223, 1, 0, 0.07843138, 1,
2.074177, 0.289825, 1.489659, 1, 0, 0.07058824, 1,
2.08882, -0.06653411, 0.9159971, 1, 0, 0.06666667, 1,
2.109458, 0.6779273, 0.560726, 1, 0, 0.05882353, 1,
2.111715, -0.803418, 1.950497, 1, 0, 0.05490196, 1,
2.13517, -2.051605, 2.325891, 1, 0, 0.04705882, 1,
2.140448, -0.7719385, 1.867977, 1, 0, 0.04313726, 1,
2.188301, -0.02985848, 0.9507734, 1, 0, 0.03529412, 1,
2.26068, -1.438609, 2.674398, 1, 0, 0.03137255, 1,
2.288717, 0.0313131, 1.889773, 1, 0, 0.02352941, 1,
2.373126, -0.8155577, 2.473356, 1, 0, 0.01960784, 1,
2.470374, 1.059415, 1.490786, 1, 0, 0.01176471, 1,
2.888206, -2.799618, 2.088501, 1, 0, 0.007843138, 1
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
-0.3384571, -3.864856, -8.747058, 0, -0.5, 0.5, 0.5,
-0.3384571, -3.864856, -8.747058, 1, -0.5, 0.5, 0.5,
-0.3384571, -3.864856, -8.747058, 1, 1.5, 0.5, 0.5,
-0.3384571, -3.864856, -8.747058, 0, 1.5, 0.5, 0.5
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
-4.65896, -0.07364011, -8.747058, 0, -0.5, 0.5, 0.5,
-4.65896, -0.07364011, -8.747058, 1, -0.5, 0.5, 0.5,
-4.65896, -0.07364011, -8.747058, 1, 1.5, 0.5, 0.5,
-4.65896, -0.07364011, -8.747058, 0, 1.5, 0.5, 0.5
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
-4.65896, -3.864856, -0.5967097, 0, -0.5, 0.5, 0.5,
-4.65896, -3.864856, -0.5967097, 1, -0.5, 0.5, 0.5,
-4.65896, -3.864856, -0.5967097, 1, 1.5, 0.5, 0.5,
-4.65896, -3.864856, -0.5967097, 0, 1.5, 0.5, 0.5
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
-3, -2.98996, -6.866209,
2, -2.98996, -6.866209,
-3, -2.98996, -6.866209,
-3, -3.135776, -7.179684,
-2, -2.98996, -6.866209,
-2, -3.135776, -7.179684,
-1, -2.98996, -6.866209,
-1, -3.135776, -7.179684,
0, -2.98996, -6.866209,
0, -3.135776, -7.179684,
1, -2.98996, -6.866209,
1, -3.135776, -7.179684,
2, -2.98996, -6.866209,
2, -3.135776, -7.179684
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
-3, -3.427408, -7.806633, 0, -0.5, 0.5, 0.5,
-3, -3.427408, -7.806633, 1, -0.5, 0.5, 0.5,
-3, -3.427408, -7.806633, 1, 1.5, 0.5, 0.5,
-3, -3.427408, -7.806633, 0, 1.5, 0.5, 0.5,
-2, -3.427408, -7.806633, 0, -0.5, 0.5, 0.5,
-2, -3.427408, -7.806633, 1, -0.5, 0.5, 0.5,
-2, -3.427408, -7.806633, 1, 1.5, 0.5, 0.5,
-2, -3.427408, -7.806633, 0, 1.5, 0.5, 0.5,
-1, -3.427408, -7.806633, 0, -0.5, 0.5, 0.5,
-1, -3.427408, -7.806633, 1, -0.5, 0.5, 0.5,
-1, -3.427408, -7.806633, 1, 1.5, 0.5, 0.5,
-1, -3.427408, -7.806633, 0, 1.5, 0.5, 0.5,
0, -3.427408, -7.806633, 0, -0.5, 0.5, 0.5,
0, -3.427408, -7.806633, 1, -0.5, 0.5, 0.5,
0, -3.427408, -7.806633, 1, 1.5, 0.5, 0.5,
0, -3.427408, -7.806633, 0, 1.5, 0.5, 0.5,
1, -3.427408, -7.806633, 0, -0.5, 0.5, 0.5,
1, -3.427408, -7.806633, 1, -0.5, 0.5, 0.5,
1, -3.427408, -7.806633, 1, 1.5, 0.5, 0.5,
1, -3.427408, -7.806633, 0, 1.5, 0.5, 0.5,
2, -3.427408, -7.806633, 0, -0.5, 0.5, 0.5,
2, -3.427408, -7.806633, 1, -0.5, 0.5, 0.5,
2, -3.427408, -7.806633, 1, 1.5, 0.5, 0.5,
2, -3.427408, -7.806633, 0, 1.5, 0.5, 0.5
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
-3.661921, -2, -6.866209,
-3.661921, 2, -6.866209,
-3.661921, -2, -6.866209,
-3.828094, -2, -7.179684,
-3.661921, -1, -6.866209,
-3.828094, -1, -7.179684,
-3.661921, 0, -6.866209,
-3.828094, 0, -7.179684,
-3.661921, 1, -6.866209,
-3.828094, 1, -7.179684,
-3.661921, 2, -6.866209,
-3.828094, 2, -7.179684
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
"-2",
"-1",
"0",
"1",
"2"
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
-4.16044, -2, -7.806633, 0, -0.5, 0.5, 0.5,
-4.16044, -2, -7.806633, 1, -0.5, 0.5, 0.5,
-4.16044, -2, -7.806633, 1, 1.5, 0.5, 0.5,
-4.16044, -2, -7.806633, 0, 1.5, 0.5, 0.5,
-4.16044, -1, -7.806633, 0, -0.5, 0.5, 0.5,
-4.16044, -1, -7.806633, 1, -0.5, 0.5, 0.5,
-4.16044, -1, -7.806633, 1, 1.5, 0.5, 0.5,
-4.16044, -1, -7.806633, 0, 1.5, 0.5, 0.5,
-4.16044, 0, -7.806633, 0, -0.5, 0.5, 0.5,
-4.16044, 0, -7.806633, 1, -0.5, 0.5, 0.5,
-4.16044, 0, -7.806633, 1, 1.5, 0.5, 0.5,
-4.16044, 0, -7.806633, 0, 1.5, 0.5, 0.5,
-4.16044, 1, -7.806633, 0, -0.5, 0.5, 0.5,
-4.16044, 1, -7.806633, 1, -0.5, 0.5, 0.5,
-4.16044, 1, -7.806633, 1, 1.5, 0.5, 0.5,
-4.16044, 1, -7.806633, 0, 1.5, 0.5, 0.5,
-4.16044, 2, -7.806633, 0, -0.5, 0.5, 0.5,
-4.16044, 2, -7.806633, 1, -0.5, 0.5, 0.5,
-4.16044, 2, -7.806633, 1, 1.5, 0.5, 0.5,
-4.16044, 2, -7.806633, 0, 1.5, 0.5, 0.5
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
-3.661921, -2.98996, -6,
-3.661921, -2.98996, 4,
-3.661921, -2.98996, -6,
-3.828094, -3.135776, -6,
-3.661921, -2.98996, -4,
-3.828094, -3.135776, -4,
-3.661921, -2.98996, -2,
-3.828094, -3.135776, -2,
-3.661921, -2.98996, 0,
-3.828094, -3.135776, 0,
-3.661921, -2.98996, 2,
-3.828094, -3.135776, 2,
-3.661921, -2.98996, 4,
-3.828094, -3.135776, 4
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
"-6",
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
-4.16044, -3.427408, -6, 0, -0.5, 0.5, 0.5,
-4.16044, -3.427408, -6, 1, -0.5, 0.5, 0.5,
-4.16044, -3.427408, -6, 1, 1.5, 0.5, 0.5,
-4.16044, -3.427408, -6, 0, 1.5, 0.5, 0.5,
-4.16044, -3.427408, -4, 0, -0.5, 0.5, 0.5,
-4.16044, -3.427408, -4, 1, -0.5, 0.5, 0.5,
-4.16044, -3.427408, -4, 1, 1.5, 0.5, 0.5,
-4.16044, -3.427408, -4, 0, 1.5, 0.5, 0.5,
-4.16044, -3.427408, -2, 0, -0.5, 0.5, 0.5,
-4.16044, -3.427408, -2, 1, -0.5, 0.5, 0.5,
-4.16044, -3.427408, -2, 1, 1.5, 0.5, 0.5,
-4.16044, -3.427408, -2, 0, 1.5, 0.5, 0.5,
-4.16044, -3.427408, 0, 0, -0.5, 0.5, 0.5,
-4.16044, -3.427408, 0, 1, -0.5, 0.5, 0.5,
-4.16044, -3.427408, 0, 1, 1.5, 0.5, 0.5,
-4.16044, -3.427408, 0, 0, 1.5, 0.5, 0.5,
-4.16044, -3.427408, 2, 0, -0.5, 0.5, 0.5,
-4.16044, -3.427408, 2, 1, -0.5, 0.5, 0.5,
-4.16044, -3.427408, 2, 1, 1.5, 0.5, 0.5,
-4.16044, -3.427408, 2, 0, 1.5, 0.5, 0.5,
-4.16044, -3.427408, 4, 0, -0.5, 0.5, 0.5,
-4.16044, -3.427408, 4, 1, -0.5, 0.5, 0.5,
-4.16044, -3.427408, 4, 1, 1.5, 0.5, 0.5,
-4.16044, -3.427408, 4, 0, 1.5, 0.5, 0.5
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
-3.661921, -2.98996, -6.866209,
-3.661921, 2.84268, -6.866209,
-3.661921, -2.98996, 5.672789,
-3.661921, 2.84268, 5.672789,
-3.661921, -2.98996, -6.866209,
-3.661921, -2.98996, 5.672789,
-3.661921, 2.84268, -6.866209,
-3.661921, 2.84268, 5.672789,
-3.661921, -2.98996, -6.866209,
2.985006, -2.98996, -6.866209,
-3.661921, -2.98996, 5.672789,
2.985006, -2.98996, 5.672789,
-3.661921, 2.84268, -6.866209,
2.985006, 2.84268, -6.866209,
-3.661921, 2.84268, 5.672789,
2.985006, 2.84268, 5.672789,
2.985006, -2.98996, -6.866209,
2.985006, 2.84268, -6.866209,
2.985006, -2.98996, 5.672789,
2.985006, 2.84268, 5.672789,
2.985006, -2.98996, -6.866209,
2.985006, -2.98996, 5.672789,
2.985006, 2.84268, -6.866209,
2.985006, 2.84268, 5.672789
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
var radius = 8.193215;
var distance = 36.45254;
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
mvMatrix.translate( 0.3384571, 0.07364011, 0.5967097 );
mvMatrix.scale( 1.332746, 1.518809, 0.706489 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.45254);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


