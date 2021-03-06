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
-3.314861, -1.029778, -1.050593, 1, 0, 0, 1,
-3.195183, 0.814876, -3.961469, 1, 0.007843138, 0, 1,
-3.132751, 0.4465913, -0.7438169, 1, 0.01176471, 0, 1,
-2.949482, 1.114568, -0.418257, 1, 0.01960784, 0, 1,
-2.779037, -0.6830626, -3.125646, 1, 0.02352941, 0, 1,
-2.767848, -0.8858642, -2.776986, 1, 0.03137255, 0, 1,
-2.694211, -0.8577122, -1.365219, 1, 0.03529412, 0, 1,
-2.453197, 1.565542, -0.852402, 1, 0.04313726, 0, 1,
-2.4459, -0.5755714, -1.755445, 1, 0.04705882, 0, 1,
-2.423683, 0.2787624, -2.64618, 1, 0.05490196, 0, 1,
-2.35114, -0.8133582, -2.4388, 1, 0.05882353, 0, 1,
-2.320808, 0.05671185, -0.96975, 1, 0.06666667, 0, 1,
-2.206142, 1.846102, -0.8529559, 1, 0.07058824, 0, 1,
-2.186252, -0.725913, -2.56318, 1, 0.07843138, 0, 1,
-2.175555, 0.3668838, 0.3208818, 1, 0.08235294, 0, 1,
-2.169168, 0.7718367, -1.650512, 1, 0.09019608, 0, 1,
-2.123681, 1.075323, 2.316295, 1, 0.09411765, 0, 1,
-2.11074, -0.4552152, -2.230381, 1, 0.1019608, 0, 1,
-2.109681, 0.2964002, -1.426918, 1, 0.1098039, 0, 1,
-2.079599, -2.012577, -3.844956, 1, 0.1137255, 0, 1,
-2.057027, 1.127485, -1.695562, 1, 0.1215686, 0, 1,
-2.048124, -0.3765469, -0.9319908, 1, 0.1254902, 0, 1,
-2.034765, 0.3897203, -2.906441, 1, 0.1333333, 0, 1,
-1.988335, -0.02328743, -0.5160452, 1, 0.1372549, 0, 1,
-1.980088, -1.532933, -2.147815, 1, 0.145098, 0, 1,
-1.979875, 2.104139, -1.948872, 1, 0.1490196, 0, 1,
-1.973561, -1.262944, -0.6725168, 1, 0.1568628, 0, 1,
-1.964757, -1.664093, -2.674198, 1, 0.1607843, 0, 1,
-1.896526, 1.058209, -0.8385493, 1, 0.1686275, 0, 1,
-1.89591, 1.175948, -1.589138, 1, 0.172549, 0, 1,
-1.885171, -0.6639731, -0.9278971, 1, 0.1803922, 0, 1,
-1.850483, 1.352193, -2.528087, 1, 0.1843137, 0, 1,
-1.846464, -1.281174, -3.632878, 1, 0.1921569, 0, 1,
-1.846167, -0.05302211, -2.009774, 1, 0.1960784, 0, 1,
-1.839226, 0.4598056, -2.6045, 1, 0.2039216, 0, 1,
-1.814439, 0.8935345, -1.58901, 1, 0.2117647, 0, 1,
-1.812149, -1.22319, -1.764403, 1, 0.2156863, 0, 1,
-1.797393, -1.572211, -0.1375574, 1, 0.2235294, 0, 1,
-1.796864, -0.6209236, -1.901178, 1, 0.227451, 0, 1,
-1.783677, -0.4322227, -1.03692, 1, 0.2352941, 0, 1,
-1.770423, -0.5599788, -2.007267, 1, 0.2392157, 0, 1,
-1.75634, 0.09051161, -1.415262, 1, 0.2470588, 0, 1,
-1.754239, 0.1161844, -2.747611, 1, 0.2509804, 0, 1,
-1.734303, -0.1383999, -1.544203, 1, 0.2588235, 0, 1,
-1.725891, -0.07715427, -0.2789275, 1, 0.2627451, 0, 1,
-1.708967, 0.6529593, -0.9631296, 1, 0.2705882, 0, 1,
-1.675389, 0.9962593, 0.09598327, 1, 0.2745098, 0, 1,
-1.673691, -0.7462483, -0.7232557, 1, 0.282353, 0, 1,
-1.672228, -2.494926, -3.661103, 1, 0.2862745, 0, 1,
-1.664131, -0.01072096, -1.931522, 1, 0.2941177, 0, 1,
-1.661882, 0.4456099, -0.397707, 1, 0.3019608, 0, 1,
-1.647501, -0.600013, -1.779564, 1, 0.3058824, 0, 1,
-1.646916, -1.195552, -2.3789, 1, 0.3137255, 0, 1,
-1.636627, 0.8821564, -0.277083, 1, 0.3176471, 0, 1,
-1.631658, -0.4496554, -2.55474, 1, 0.3254902, 0, 1,
-1.610078, 0.7793936, -0.2816027, 1, 0.3294118, 0, 1,
-1.60014, 1.135157, -0.750822, 1, 0.3372549, 0, 1,
-1.597369, 0.06380109, -1.428145, 1, 0.3411765, 0, 1,
-1.58769, -0.4310795, -1.800031, 1, 0.3490196, 0, 1,
-1.583449, 0.3564893, -0.3809964, 1, 0.3529412, 0, 1,
-1.575166, -0.2391774, -1.887024, 1, 0.3607843, 0, 1,
-1.547972, -1.87802, -4.055892, 1, 0.3647059, 0, 1,
-1.54372, -0.8632061, -1.909222, 1, 0.372549, 0, 1,
-1.531942, 0.9817481, -0.4421169, 1, 0.3764706, 0, 1,
-1.531735, 1.581443, -1.007212, 1, 0.3843137, 0, 1,
-1.520098, 0.5380211, -1.072807, 1, 0.3882353, 0, 1,
-1.505997, 0.04200543, -1.262767, 1, 0.3960784, 0, 1,
-1.466296, -0.9552561, -2.730721, 1, 0.4039216, 0, 1,
-1.463143, -0.1697638, -2.026787, 1, 0.4078431, 0, 1,
-1.457158, 0.6938415, -0.8216224, 1, 0.4156863, 0, 1,
-1.451933, 1.318372, -0.674746, 1, 0.4196078, 0, 1,
-1.451612, -0.8317585, -3.279697, 1, 0.427451, 0, 1,
-1.447726, 2.877061, -1.272861, 1, 0.4313726, 0, 1,
-1.436744, 0.07290399, -2.078186, 1, 0.4392157, 0, 1,
-1.436128, -0.02850963, -1.914508, 1, 0.4431373, 0, 1,
-1.433165, 1.79509, -0.02649843, 1, 0.4509804, 0, 1,
-1.429375, 1.643713, -0.5114141, 1, 0.454902, 0, 1,
-1.424746, 0.3285089, -0.9012798, 1, 0.4627451, 0, 1,
-1.414661, 0.6765655, -1.476151, 1, 0.4666667, 0, 1,
-1.400692, -0.1915304, -1.321635, 1, 0.4745098, 0, 1,
-1.394137, 0.5773764, -0.3165385, 1, 0.4784314, 0, 1,
-1.392686, 1.607611, 0.3905553, 1, 0.4862745, 0, 1,
-1.383649, -0.8622627, -1.38248, 1, 0.4901961, 0, 1,
-1.37678, 0.4904264, -0.8133497, 1, 0.4980392, 0, 1,
-1.375823, 0.6353959, -1.565521, 1, 0.5058824, 0, 1,
-1.369319, -0.5178863, -2.04285, 1, 0.509804, 0, 1,
-1.369277, -0.9474988, -4.557138, 1, 0.5176471, 0, 1,
-1.35825, -0.1201304, -0.5095598, 1, 0.5215687, 0, 1,
-1.346559, 0.00930051, -2.426825, 1, 0.5294118, 0, 1,
-1.343661, -1.085585, -2.620734, 1, 0.5333334, 0, 1,
-1.343423, 1.240072, -0.800691, 1, 0.5411765, 0, 1,
-1.331587, -2.300269, -2.212194, 1, 0.5450981, 0, 1,
-1.309289, 0.2315918, -0.9403192, 1, 0.5529412, 0, 1,
-1.301754, -0.7272648, -2.700961, 1, 0.5568628, 0, 1,
-1.298171, -0.5238413, -4.336548, 1, 0.5647059, 0, 1,
-1.280278, -0.4870062, -1.220309, 1, 0.5686275, 0, 1,
-1.275561, 0.01215099, -1.967163, 1, 0.5764706, 0, 1,
-1.267194, 0.0459104, -2.224701, 1, 0.5803922, 0, 1,
-1.26456, -1.753142, -2.87983, 1, 0.5882353, 0, 1,
-1.250592, 0.1382566, -0.7398697, 1, 0.5921569, 0, 1,
-1.250273, 1.281598, -0.1060481, 1, 0.6, 0, 1,
-1.242494, -1.351265, -2.899823, 1, 0.6078432, 0, 1,
-1.235748, 1.096787, -1.648256, 1, 0.6117647, 0, 1,
-1.233235, -0.1687423, -1.972826, 1, 0.6196079, 0, 1,
-1.228185, 0.4509389, -3.18499, 1, 0.6235294, 0, 1,
-1.218562, 0.1908773, -3.042209, 1, 0.6313726, 0, 1,
-1.215543, 0.101575, -2.296604, 1, 0.6352941, 0, 1,
-1.214946, 2.347155, -1.622498, 1, 0.6431373, 0, 1,
-1.207723, -0.5927203, -1.737354, 1, 0.6470588, 0, 1,
-1.199769, -0.9521264, -0.9985027, 1, 0.654902, 0, 1,
-1.188246, -0.1280458, -1.879205, 1, 0.6588235, 0, 1,
-1.187826, 0.8155535, -1.753394, 1, 0.6666667, 0, 1,
-1.187699, -2.357949, -2.970194, 1, 0.6705883, 0, 1,
-1.17463, 0.01083382, -0.4413525, 1, 0.6784314, 0, 1,
-1.174283, -1.481724, -2.115075, 1, 0.682353, 0, 1,
-1.16957, 0.7591842, 0.3709561, 1, 0.6901961, 0, 1,
-1.16868, -0.2198951, -1.367351, 1, 0.6941177, 0, 1,
-1.165878, 0.2568444, -1.140288, 1, 0.7019608, 0, 1,
-1.160601, 0.9069471, -0.05144354, 1, 0.7098039, 0, 1,
-1.160106, -0.3426642, -0.705974, 1, 0.7137255, 0, 1,
-1.159767, 0.8774734, -4.032543, 1, 0.7215686, 0, 1,
-1.156234, 1.137818, -1.932655, 1, 0.7254902, 0, 1,
-1.153826, 0.1526434, -2.002665, 1, 0.7333333, 0, 1,
-1.152171, 0.9001864, -1.493606, 1, 0.7372549, 0, 1,
-1.148547, -1.742425, -2.200381, 1, 0.7450981, 0, 1,
-1.132104, 1.279123, -0.04417516, 1, 0.7490196, 0, 1,
-1.125433, 0.4910042, -0.6544873, 1, 0.7568628, 0, 1,
-1.123343, 0.2201138, -1.652286, 1, 0.7607843, 0, 1,
-1.108146, 0.910693, -0.7809108, 1, 0.7686275, 0, 1,
-1.10572, -0.4280523, -1.933331, 1, 0.772549, 0, 1,
-1.101125, 0.1104655, -0.777649, 1, 0.7803922, 0, 1,
-1.0995, 0.9225338, -0.4908108, 1, 0.7843137, 0, 1,
-1.097357, -1.180693, -2.548523, 1, 0.7921569, 0, 1,
-1.095123, -1.609502, -2.852369, 1, 0.7960784, 0, 1,
-1.094666, -1.255357, -2.224918, 1, 0.8039216, 0, 1,
-1.09123, 0.8899075, -0.4721972, 1, 0.8117647, 0, 1,
-1.090949, -0.3752257, -0.4051993, 1, 0.8156863, 0, 1,
-1.085026, -0.3136664, -2.439328, 1, 0.8235294, 0, 1,
-1.077812, -1.608023, -2.295179, 1, 0.827451, 0, 1,
-1.074492, 1.45179, 0.1372595, 1, 0.8352941, 0, 1,
-1.065344, 1.729204, -0.2809732, 1, 0.8392157, 0, 1,
-1.053578, 0.3902892, -0.3095927, 1, 0.8470588, 0, 1,
-1.051378, -0.0553639, -0.949908, 1, 0.8509804, 0, 1,
-1.037779, 0.1236414, -2.590952, 1, 0.8588235, 0, 1,
-1.030379, 0.1793987, -2.240988, 1, 0.8627451, 0, 1,
-1.02647, -1.690218, -2.415733, 1, 0.8705882, 0, 1,
-1.02317, 0.8073312, -1.803445, 1, 0.8745098, 0, 1,
-1.020339, -0.2783034, -4.200804, 1, 0.8823529, 0, 1,
-1.016808, 0.1032848, -1.709214, 1, 0.8862745, 0, 1,
-1.015136, -0.4022207, -1.805172, 1, 0.8941177, 0, 1,
-1.014542, 1.576279, -1.885347, 1, 0.8980392, 0, 1,
-1.010183, 2.351442, -1.449529, 1, 0.9058824, 0, 1,
-1.003946, 0.7130323, 0.7761316, 1, 0.9137255, 0, 1,
-1.00139, -0.8745953, -0.4642595, 1, 0.9176471, 0, 1,
-0.9954792, -0.004092347, -3.448983, 1, 0.9254902, 0, 1,
-0.9908707, 1.517415, -1.2043, 1, 0.9294118, 0, 1,
-0.9847875, 0.1940282, -0.3919095, 1, 0.9372549, 0, 1,
-0.9826051, 1.547718, -0.1607367, 1, 0.9411765, 0, 1,
-0.973947, -1.360525, -5.429204, 1, 0.9490196, 0, 1,
-0.9692208, 0.02348075, -2.251482, 1, 0.9529412, 0, 1,
-0.9554884, 0.3096624, -0.278315, 1, 0.9607843, 0, 1,
-0.9525473, 0.4278125, -0.6590616, 1, 0.9647059, 0, 1,
-0.9401863, -0.3748, -3.068931, 1, 0.972549, 0, 1,
-0.9313448, -0.07884094, -2.562095, 1, 0.9764706, 0, 1,
-0.931145, -0.5060992, -3.096427, 1, 0.9843137, 0, 1,
-0.9292631, -1.031772, -2.608942, 1, 0.9882353, 0, 1,
-0.9262801, 1.619923, 0.2730387, 1, 0.9960784, 0, 1,
-0.9262278, -1.221977, -3.59468, 0.9960784, 1, 0, 1,
-0.9143231, -1.024844, -2.604457, 0.9921569, 1, 0, 1,
-0.9053124, -0.9166715, -0.7100389, 0.9843137, 1, 0, 1,
-0.90038, 0.7940565, -3.185976, 0.9803922, 1, 0, 1,
-0.8952688, 1.009112, -0.943419, 0.972549, 1, 0, 1,
-0.8920422, 0.4764805, -1.485781, 0.9686275, 1, 0, 1,
-0.8868618, 0.4068012, -1.216186, 0.9607843, 1, 0, 1,
-0.8772572, 0.5633917, -1.643, 0.9568627, 1, 0, 1,
-0.8705581, -0.4160966, -1.506773, 0.9490196, 1, 0, 1,
-0.8667378, 0.4961506, -0.4204625, 0.945098, 1, 0, 1,
-0.8654357, -0.2138961, -4.305982, 0.9372549, 1, 0, 1,
-0.855213, 0.4385386, -0.9292657, 0.9333333, 1, 0, 1,
-0.8497597, 0.4094303, -0.6194172, 0.9254902, 1, 0, 1,
-0.8470318, 0.3994934, -1.503475, 0.9215686, 1, 0, 1,
-0.8420758, -1.701096, -2.65447, 0.9137255, 1, 0, 1,
-0.8332403, -0.2564024, -2.171405, 0.9098039, 1, 0, 1,
-0.8306515, 1.901582, 0.5093096, 0.9019608, 1, 0, 1,
-0.8300697, -0.1549408, -1.737974, 0.8941177, 1, 0, 1,
-0.8239344, -0.1675028, -2.113858, 0.8901961, 1, 0, 1,
-0.8226848, 1.252501, 0.3360312, 0.8823529, 1, 0, 1,
-0.8210033, 0.4744952, -0.8894795, 0.8784314, 1, 0, 1,
-0.8206632, -0.3543799, -2.73771, 0.8705882, 1, 0, 1,
-0.8194261, -0.1292168, -1.914982, 0.8666667, 1, 0, 1,
-0.8130055, 0.7571239, -0.9601421, 0.8588235, 1, 0, 1,
-0.8085002, 0.3207953, -2.243477, 0.854902, 1, 0, 1,
-0.8050126, 0.1013514, 0.03864427, 0.8470588, 1, 0, 1,
-0.8028392, 0.4609822, 0.1309417, 0.8431373, 1, 0, 1,
-0.8007228, -0.5978895, -3.470594, 0.8352941, 1, 0, 1,
-0.7997997, -0.8005619, -3.435686, 0.8313726, 1, 0, 1,
-0.7986514, 0.2950172, -2.374987, 0.8235294, 1, 0, 1,
-0.7910666, -0.7686132, -2.687364, 0.8196079, 1, 0, 1,
-0.7878146, -0.7337651, -3.862303, 0.8117647, 1, 0, 1,
-0.7855294, 1.33773, -0.5798075, 0.8078431, 1, 0, 1,
-0.7804082, 0.81366, -0.9136161, 0.8, 1, 0, 1,
-0.7733895, 0.3333431, -0.3065296, 0.7921569, 1, 0, 1,
-0.7693042, 1.842864, 0.1004621, 0.7882353, 1, 0, 1,
-0.7690997, -0.09590469, -0.5001927, 0.7803922, 1, 0, 1,
-0.7688695, 0.4349224, -0.9640216, 0.7764706, 1, 0, 1,
-0.765696, 0.838329, -1.32658, 0.7686275, 1, 0, 1,
-0.7644233, 0.1321391, -1.636584, 0.7647059, 1, 0, 1,
-0.763108, 1.64481, -1.098054, 0.7568628, 1, 0, 1,
-0.7585579, 0.01302302, 0.4745418, 0.7529412, 1, 0, 1,
-0.756805, 1.106648, -0.7373725, 0.7450981, 1, 0, 1,
-0.7564158, 1.550676, -0.2347602, 0.7411765, 1, 0, 1,
-0.7547086, 0.3486176, -1.996764, 0.7333333, 1, 0, 1,
-0.7527897, -1.33324, -3.17455, 0.7294118, 1, 0, 1,
-0.7513812, -0.2531031, -0.6513025, 0.7215686, 1, 0, 1,
-0.7513302, 0.3609695, 0.08274529, 0.7176471, 1, 0, 1,
-0.7453011, -0.4033631, -1.69184, 0.7098039, 1, 0, 1,
-0.7425086, -0.04526147, -3.068918, 0.7058824, 1, 0, 1,
-0.7424871, 1.320305, -0.8017796, 0.6980392, 1, 0, 1,
-0.7417843, -0.8576688, -2.241212, 0.6901961, 1, 0, 1,
-0.7400528, -0.4311839, -3.195355, 0.6862745, 1, 0, 1,
-0.736863, -0.5518812, -0.5928496, 0.6784314, 1, 0, 1,
-0.7360212, -1.333087, -3.429698, 0.6745098, 1, 0, 1,
-0.7333749, 0.1520007, -0.1586687, 0.6666667, 1, 0, 1,
-0.7314669, -0.2040861, -1.565996, 0.6627451, 1, 0, 1,
-0.7238215, 1.311412, 0.4159363, 0.654902, 1, 0, 1,
-0.722699, 1.818702, -1.885759, 0.6509804, 1, 0, 1,
-0.7220268, 0.5068999, 0.02425713, 0.6431373, 1, 0, 1,
-0.7199963, -1.301773, -2.526085, 0.6392157, 1, 0, 1,
-0.7194108, -0.1527609, -1.938533, 0.6313726, 1, 0, 1,
-0.7157894, 0.3085399, -0.9098434, 0.627451, 1, 0, 1,
-0.7131519, -0.6048155, -2.16243, 0.6196079, 1, 0, 1,
-0.7122917, 0.5513767, -0.9186815, 0.6156863, 1, 0, 1,
-0.7058825, -0.7733499, -0.4004499, 0.6078432, 1, 0, 1,
-0.7020695, 1.329412, 1.000139, 0.6039216, 1, 0, 1,
-0.7005675, -1.429728, -2.588725, 0.5960785, 1, 0, 1,
-0.6956947, 0.4946682, -1.955068, 0.5882353, 1, 0, 1,
-0.6931425, -0.04031708, -2.464232, 0.5843138, 1, 0, 1,
-0.6927062, -1.141073, -1.042882, 0.5764706, 1, 0, 1,
-0.6909124, -0.1422468, -1.021009, 0.572549, 1, 0, 1,
-0.6897829, -0.1746012, -2.596096, 0.5647059, 1, 0, 1,
-0.6837894, -0.9417138, -3.258584, 0.5607843, 1, 0, 1,
-0.6795998, 0.3000748, -0.1591374, 0.5529412, 1, 0, 1,
-0.6754546, 1.701433, 0.5998749, 0.5490196, 1, 0, 1,
-0.6730162, -0.8981717, -2.487137, 0.5411765, 1, 0, 1,
-0.6685199, 1.019416, -1.589678, 0.5372549, 1, 0, 1,
-0.6684466, 1.321065, -0.02335865, 0.5294118, 1, 0, 1,
-0.6681367, 0.7427388, 0.01461335, 0.5254902, 1, 0, 1,
-0.6671392, -0.7480344, -2.147466, 0.5176471, 1, 0, 1,
-0.6647228, 0.2412172, -2.3988, 0.5137255, 1, 0, 1,
-0.6630996, -1.437252, -3.749712, 0.5058824, 1, 0, 1,
-0.6620603, -0.7944657, -1.797563, 0.5019608, 1, 0, 1,
-0.6606753, -0.2845659, -0.04445602, 0.4941176, 1, 0, 1,
-0.6571612, -0.6534562, -2.22207, 0.4862745, 1, 0, 1,
-0.6554283, -0.3769186, -4.060156, 0.4823529, 1, 0, 1,
-0.6553079, 0.2457551, -0.5139895, 0.4745098, 1, 0, 1,
-0.6552805, -2.335537, -2.666884, 0.4705882, 1, 0, 1,
-0.6505349, 0.2741159, 0.510414, 0.4627451, 1, 0, 1,
-0.6471263, 1.366374, 0.03325219, 0.4588235, 1, 0, 1,
-0.643609, 0.117765, -2.969649, 0.4509804, 1, 0, 1,
-0.6400023, -0.330002, -2.859583, 0.4470588, 1, 0, 1,
-0.639577, -0.9567766, -3.119647, 0.4392157, 1, 0, 1,
-0.6372265, 0.1842644, -1.143632, 0.4352941, 1, 0, 1,
-0.6365192, -0.5418182, -3.314685, 0.427451, 1, 0, 1,
-0.635585, 1.465382, -0.109176, 0.4235294, 1, 0, 1,
-0.6314055, -1.19813, -4.214817, 0.4156863, 1, 0, 1,
-0.6288508, -0.3732845, -0.3254715, 0.4117647, 1, 0, 1,
-0.6209321, -0.5741166, -1.7375, 0.4039216, 1, 0, 1,
-0.6129059, 1.903104, 0.1825899, 0.3960784, 1, 0, 1,
-0.6069833, 0.9526491, -0.8193595, 0.3921569, 1, 0, 1,
-0.6005526, 0.8239636, -0.7030495, 0.3843137, 1, 0, 1,
-0.5983937, 0.521384, -0.872373, 0.3803922, 1, 0, 1,
-0.5975847, 1.009562, 0.6860523, 0.372549, 1, 0, 1,
-0.5890098, -1.350332, -3.287916, 0.3686275, 1, 0, 1,
-0.5784077, -0.5804512, -1.616923, 0.3607843, 1, 0, 1,
-0.5765449, -0.510021, -3.217001, 0.3568628, 1, 0, 1,
-0.5759624, -0.5269491, -2.354422, 0.3490196, 1, 0, 1,
-0.575655, 0.5915987, -1.340113, 0.345098, 1, 0, 1,
-0.574823, 1.842666, -0.289274, 0.3372549, 1, 0, 1,
-0.5727208, 0.631681, -1.347271, 0.3333333, 1, 0, 1,
-0.568077, -0.2760661, -1.896156, 0.3254902, 1, 0, 1,
-0.5649536, 0.1500281, -3.265295, 0.3215686, 1, 0, 1,
-0.5622054, 1.120241, -2.015615, 0.3137255, 1, 0, 1,
-0.5611961, -0.1069859, -1.571876, 0.3098039, 1, 0, 1,
-0.5574786, 0.3210133, -2.121419, 0.3019608, 1, 0, 1,
-0.5552725, 0.07951152, -0.6578003, 0.2941177, 1, 0, 1,
-0.5511149, 0.6852072, -0.2353491, 0.2901961, 1, 0, 1,
-0.5506442, -0.5603222, -3.713476, 0.282353, 1, 0, 1,
-0.5473977, 1.563865, -0.8187979, 0.2784314, 1, 0, 1,
-0.5436204, -0.2886986, -2.406364, 0.2705882, 1, 0, 1,
-0.5409036, -0.1737119, -0.8384025, 0.2666667, 1, 0, 1,
-0.5403743, 1.117789, -1.054215, 0.2588235, 1, 0, 1,
-0.5402421, 0.3201622, -3.185925, 0.254902, 1, 0, 1,
-0.5352831, -1.867989, -2.710028, 0.2470588, 1, 0, 1,
-0.5332471, 0.5957105, -0.5131382, 0.2431373, 1, 0, 1,
-0.5327251, 0.08016768, -3.29921, 0.2352941, 1, 0, 1,
-0.5309822, 0.9957523, -1.213834, 0.2313726, 1, 0, 1,
-0.5266839, 0.2577413, -0.0766242, 0.2235294, 1, 0, 1,
-0.5247557, 1.372959, -0.2898827, 0.2196078, 1, 0, 1,
-0.5243404, 0.7743229, -0.3173797, 0.2117647, 1, 0, 1,
-0.518494, -0.8351725, -2.139456, 0.2078431, 1, 0, 1,
-0.5163996, -0.8589726, -3.203056, 0.2, 1, 0, 1,
-0.5143646, 0.2471375, -2.017189, 0.1921569, 1, 0, 1,
-0.5127197, -0.9702877, -4.06238, 0.1882353, 1, 0, 1,
-0.5116977, 1.183721, 0.3576334, 0.1803922, 1, 0, 1,
-0.5103673, -0.2292961, -2.417549, 0.1764706, 1, 0, 1,
-0.5088755, 0.5546359, -0.6284851, 0.1686275, 1, 0, 1,
-0.5067264, 0.6826125, -2.530968, 0.1647059, 1, 0, 1,
-0.5047351, -1.458226, -4.185368, 0.1568628, 1, 0, 1,
-0.5035228, -1.268857, -2.413114, 0.1529412, 1, 0, 1,
-0.5016076, 0.3662955, -1.863348, 0.145098, 1, 0, 1,
-0.5015888, 0.4483668, 1.223118, 0.1411765, 1, 0, 1,
-0.5004231, -0.4683312, -1.706817, 0.1333333, 1, 0, 1,
-0.497892, 0.1329072, -2.274966, 0.1294118, 1, 0, 1,
-0.495496, -0.4666895, -1.658083, 0.1215686, 1, 0, 1,
-0.4937801, -0.9201003, -3.022694, 0.1176471, 1, 0, 1,
-0.4898438, -0.6900022, -1.101128, 0.1098039, 1, 0, 1,
-0.4897547, -0.3893047, 0.08862627, 0.1058824, 1, 0, 1,
-0.4878937, -0.5596415, -4.434625, 0.09803922, 1, 0, 1,
-0.4876268, 0.2211443, -0.5055019, 0.09019608, 1, 0, 1,
-0.4838258, 0.7812894, -1.202979, 0.08627451, 1, 0, 1,
-0.4816237, -2.371987, -2.269124, 0.07843138, 1, 0, 1,
-0.4812777, -1.092594, -2.339389, 0.07450981, 1, 0, 1,
-0.4801464, -0.004500503, -0.229119, 0.06666667, 1, 0, 1,
-0.4774744, -1.035168, -2.125318, 0.0627451, 1, 0, 1,
-0.4688817, 0.7380429, -1.023616, 0.05490196, 1, 0, 1,
-0.4609086, 1.011186, -0.3039566, 0.05098039, 1, 0, 1,
-0.4602444, -0.1474466, -4.276446, 0.04313726, 1, 0, 1,
-0.4586298, -2.939734, -4.659293, 0.03921569, 1, 0, 1,
-0.4573548, -0.1457715, -1.546992, 0.03137255, 1, 0, 1,
-0.4485205, -0.7665868, -1.559424, 0.02745098, 1, 0, 1,
-0.4456547, -0.406425, -1.254876, 0.01960784, 1, 0, 1,
-0.4371364, 0.2867614, -1.706566, 0.01568628, 1, 0, 1,
-0.4348923, -0.1418396, -2.244386, 0.007843138, 1, 0, 1,
-0.4256716, 2.371755, 0.7644392, 0.003921569, 1, 0, 1,
-0.4242681, 1.586891, -0.6938021, 0, 1, 0.003921569, 1,
-0.4219188, 0.4817267, -0.9364616, 0, 1, 0.01176471, 1,
-0.4168735, -0.2370214, -2.220451, 0, 1, 0.01568628, 1,
-0.4126092, -0.7158684, -2.990237, 0, 1, 0.02352941, 1,
-0.4125906, -1.460904, -2.463733, 0, 1, 0.02745098, 1,
-0.4104116, 1.193141, -0.1801544, 0, 1, 0.03529412, 1,
-0.4070337, 0.8269413, -0.9311075, 0, 1, 0.03921569, 1,
-0.406181, 0.3737646, -0.5965801, 0, 1, 0.04705882, 1,
-0.4004102, 0.01869001, -2.680288, 0, 1, 0.05098039, 1,
-0.4001352, -1.108218, -1.140814, 0, 1, 0.05882353, 1,
-0.3995121, -1.118927, -3.60513, 0, 1, 0.0627451, 1,
-0.3965837, -0.3006635, -2.94005, 0, 1, 0.07058824, 1,
-0.391752, -0.6294341, -2.215864, 0, 1, 0.07450981, 1,
-0.3893834, 0.6625701, -0.7935256, 0, 1, 0.08235294, 1,
-0.3842633, 0.3604745, -1.32558, 0, 1, 0.08627451, 1,
-0.3841228, 1.512321, -0.5009827, 0, 1, 0.09411765, 1,
-0.3791882, -0.8167436, -2.220434, 0, 1, 0.1019608, 1,
-0.3789623, 0.5769751, 0.1097213, 0, 1, 0.1058824, 1,
-0.3749812, 3.130353, -0.382807, 0, 1, 0.1137255, 1,
-0.3687602, -1.648664, -2.912766, 0, 1, 0.1176471, 1,
-0.3620084, 0.1576108, -2.911809, 0, 1, 0.1254902, 1,
-0.3581895, -0.7624041, -3.652023, 0, 1, 0.1294118, 1,
-0.3555357, -1.568077, -2.067087, 0, 1, 0.1372549, 1,
-0.3494472, 0.1000424, -0.700781, 0, 1, 0.1411765, 1,
-0.3490327, -0.6108618, -4.428451, 0, 1, 0.1490196, 1,
-0.3442793, 0.09805448, -2.038319, 0, 1, 0.1529412, 1,
-0.3380201, 0.2717503, -0.06896344, 0, 1, 0.1607843, 1,
-0.3369771, 0.2323716, -1.257716, 0, 1, 0.1647059, 1,
-0.3367856, -0.8408408, -2.849943, 0, 1, 0.172549, 1,
-0.3360521, -0.02644877, -2.278695, 0, 1, 0.1764706, 1,
-0.3339023, -0.1964717, -0.9847399, 0, 1, 0.1843137, 1,
-0.3334226, -0.1873996, -1.635284, 0, 1, 0.1882353, 1,
-0.3320934, -0.3064157, -1.14814, 0, 1, 0.1960784, 1,
-0.3208546, -0.1698626, -2.132544, 0, 1, 0.2039216, 1,
-0.3197985, 0.5595237, -1.305169, 0, 1, 0.2078431, 1,
-0.3163356, 0.4940328, 1.368874, 0, 1, 0.2156863, 1,
-0.3139324, -0.4234508, -2.315733, 0, 1, 0.2196078, 1,
-0.3131665, -0.6729709, -4.611364, 0, 1, 0.227451, 1,
-0.312611, 0.5387836, -1.300603, 0, 1, 0.2313726, 1,
-0.3121881, -0.4389867, -2.722314, 0, 1, 0.2392157, 1,
-0.3094022, -0.6182456, -1.546526, 0, 1, 0.2431373, 1,
-0.3063843, -0.561285, -1.526655, 0, 1, 0.2509804, 1,
-0.3043316, 0.4279726, -1.888283, 0, 1, 0.254902, 1,
-0.3043125, -1.061558, -3.714647, 0, 1, 0.2627451, 1,
-0.2998183, -0.8207257, -3.428732, 0, 1, 0.2666667, 1,
-0.2988692, 0.3339628, -1.347606, 0, 1, 0.2745098, 1,
-0.2966898, -0.1186957, -1.928298, 0, 1, 0.2784314, 1,
-0.2959943, -0.3192644, -1.18856, 0, 1, 0.2862745, 1,
-0.2945259, 0.2816944, -1.084747, 0, 1, 0.2901961, 1,
-0.2925706, 0.9451012, -2.169668, 0, 1, 0.2980392, 1,
-0.2873864, -0.1362815, -0.629555, 0, 1, 0.3058824, 1,
-0.2872088, 0.1976716, -0.7637177, 0, 1, 0.3098039, 1,
-0.2870908, -2.406704, -3.751323, 0, 1, 0.3176471, 1,
-0.2858757, 0.6262074, -1.263161, 0, 1, 0.3215686, 1,
-0.282246, -0.1625077, -1.322565, 0, 1, 0.3294118, 1,
-0.2800114, -0.4098704, -0.6634499, 0, 1, 0.3333333, 1,
-0.2796074, -0.2530835, -2.713652, 0, 1, 0.3411765, 1,
-0.2777435, 1.159271, -2.108713, 0, 1, 0.345098, 1,
-0.2704612, 1.611017, 0.8389181, 0, 1, 0.3529412, 1,
-0.2697364, -0.8608368, -2.529511, 0, 1, 0.3568628, 1,
-0.26927, -0.456524, -2.904881, 0, 1, 0.3647059, 1,
-0.2660536, 0.1701156, 0.1052927, 0, 1, 0.3686275, 1,
-0.2654957, 0.7044535, -0.3122907, 0, 1, 0.3764706, 1,
-0.2646746, -0.2281304, -3.286369, 0, 1, 0.3803922, 1,
-0.264557, 0.741213, 1.770853, 0, 1, 0.3882353, 1,
-0.252423, -0.2403742, -2.461041, 0, 1, 0.3921569, 1,
-0.2512118, -0.570591, -1.912674, 0, 1, 0.4, 1,
-0.2489163, 0.2727185, -0.2183596, 0, 1, 0.4078431, 1,
-0.246748, -0.1924542, -1.598808, 0, 1, 0.4117647, 1,
-0.2464581, -0.9319243, -2.529897, 0, 1, 0.4196078, 1,
-0.2455765, -0.695124, -2.753178, 0, 1, 0.4235294, 1,
-0.2417085, -0.3230113, -4.358799, 0, 1, 0.4313726, 1,
-0.2402486, 0.7231509, -0.4529024, 0, 1, 0.4352941, 1,
-0.2378223, 0.1725969, -2.590678, 0, 1, 0.4431373, 1,
-0.2370647, 0.3290238, -0.4961555, 0, 1, 0.4470588, 1,
-0.228472, -1.312861, -2.851941, 0, 1, 0.454902, 1,
-0.2273149, 2.515903, -1.479178, 0, 1, 0.4588235, 1,
-0.2273093, 0.0355588, -1.59685, 0, 1, 0.4666667, 1,
-0.22636, 0.01113937, -0.5755337, 0, 1, 0.4705882, 1,
-0.2208364, -0.4222373, -1.221152, 0, 1, 0.4784314, 1,
-0.2195759, 0.5744588, -1.022936, 0, 1, 0.4823529, 1,
-0.2168993, 0.107258, -0.7650244, 0, 1, 0.4901961, 1,
-0.2164684, -0.3758646, -4.160952, 0, 1, 0.4941176, 1,
-0.2162845, -0.4005982, -2.828386, 0, 1, 0.5019608, 1,
-0.2135066, 0.3123185, 0.5327623, 0, 1, 0.509804, 1,
-0.2129338, -0.9180598, -1.778781, 0, 1, 0.5137255, 1,
-0.212319, -1.563568, -3.82864, 0, 1, 0.5215687, 1,
-0.2108781, 1.072726, -0.7013416, 0, 1, 0.5254902, 1,
-0.2091748, 0.8559289, 0.9458339, 0, 1, 0.5333334, 1,
-0.2064887, -0.2936466, -2.777541, 0, 1, 0.5372549, 1,
-0.201675, 1.282592, 0.7909556, 0, 1, 0.5450981, 1,
-0.1986172, -0.699837, -4.439346, 0, 1, 0.5490196, 1,
-0.1975196, -0.6017804, -4.22046, 0, 1, 0.5568628, 1,
-0.1957908, -1.14717, -2.606391, 0, 1, 0.5607843, 1,
-0.19363, -0.1481828, -2.639974, 0, 1, 0.5686275, 1,
-0.1909263, 0.1415252, -2.522389, 0, 1, 0.572549, 1,
-0.1879577, 0.4436831, 1.026258, 0, 1, 0.5803922, 1,
-0.1857584, 0.8813855, -0.04710672, 0, 1, 0.5843138, 1,
-0.1849515, 1.549182, 1.857572, 0, 1, 0.5921569, 1,
-0.1834855, -0.3359468, -2.602122, 0, 1, 0.5960785, 1,
-0.1819676, -1.007816, -4.021655, 0, 1, 0.6039216, 1,
-0.1793714, -0.5701726, -2.093594, 0, 1, 0.6117647, 1,
-0.1745943, -1.021674, -3.438656, 0, 1, 0.6156863, 1,
-0.1740323, -0.908251, -3.03349, 0, 1, 0.6235294, 1,
-0.1722649, -1.157728, -2.627553, 0, 1, 0.627451, 1,
-0.1602676, 0.4689656, 0.276655, 0, 1, 0.6352941, 1,
-0.1589548, -1.258389, -2.646089, 0, 1, 0.6392157, 1,
-0.1588072, -1.416962, -3.641279, 0, 1, 0.6470588, 1,
-0.1583982, 1.928946, -1.726087, 0, 1, 0.6509804, 1,
-0.1581508, -0.4060621, -1.444108, 0, 1, 0.6588235, 1,
-0.1566263, 0.8755003, -0.4745831, 0, 1, 0.6627451, 1,
-0.1523001, 0.08824662, -2.314648, 0, 1, 0.6705883, 1,
-0.1519188, -0.5269625, -1.906627, 0, 1, 0.6745098, 1,
-0.1515069, 0.1393868, -0.4327436, 0, 1, 0.682353, 1,
-0.1511147, -0.5862897, -3.486042, 0, 1, 0.6862745, 1,
-0.1476624, 1.285165, -0.7188882, 0, 1, 0.6941177, 1,
-0.1440783, -1.698854, -5.305182, 0, 1, 0.7019608, 1,
-0.1406185, -1.242551, -1.224357, 0, 1, 0.7058824, 1,
-0.1399097, 0.2259264, 0.4871734, 0, 1, 0.7137255, 1,
-0.1355516, -1.869466, -4.477521, 0, 1, 0.7176471, 1,
-0.1335021, 1.054759, 1.210688, 0, 1, 0.7254902, 1,
-0.1315224, -1.75312, -2.810586, 0, 1, 0.7294118, 1,
-0.126985, -1.126088, -1.431196, 0, 1, 0.7372549, 1,
-0.1239621, 0.2366284, -2.504909, 0, 1, 0.7411765, 1,
-0.1237478, -0.230028, -2.45672, 0, 1, 0.7490196, 1,
-0.1229441, -0.79228, -2.830853, 0, 1, 0.7529412, 1,
-0.1227234, 0.9827533, 1.489185, 0, 1, 0.7607843, 1,
-0.1210103, -1.099565, -2.813643, 0, 1, 0.7647059, 1,
-0.1158999, -0.3451528, -2.423201, 0, 1, 0.772549, 1,
-0.1152241, -0.3269874, -4.709169, 0, 1, 0.7764706, 1,
-0.1146963, -1.456495, -2.854831, 0, 1, 0.7843137, 1,
-0.1133794, -0.1626198, -1.665411, 0, 1, 0.7882353, 1,
-0.1115164, 1.298936, -0.08456991, 0, 1, 0.7960784, 1,
-0.1107975, 0.2797167, 0.7062849, 0, 1, 0.8039216, 1,
-0.1102497, -0.1232209, -3.209502, 0, 1, 0.8078431, 1,
-0.1023382, -1.06559, -2.375364, 0, 1, 0.8156863, 1,
-0.1013566, 0.07551519, -0.8375714, 0, 1, 0.8196079, 1,
-0.1003152, 1.560506, -1.175001, 0, 1, 0.827451, 1,
-0.09794246, 1.058243, 0.2515833, 0, 1, 0.8313726, 1,
-0.09185109, 1.840424, 0.4418351, 0, 1, 0.8392157, 1,
-0.08940846, -0.913128, -1.911371, 0, 1, 0.8431373, 1,
-0.08680151, -0.1340633, -2.410425, 0, 1, 0.8509804, 1,
-0.08302444, 0.3386212, 0.123737, 0, 1, 0.854902, 1,
-0.082834, 0.2341185, 0.1225697, 0, 1, 0.8627451, 1,
-0.07878412, -0.7386834, -1.410041, 0, 1, 0.8666667, 1,
-0.07353668, -0.57705, -2.166983, 0, 1, 0.8745098, 1,
-0.07195687, -0.4060502, -2.275065, 0, 1, 0.8784314, 1,
-0.07163289, -2.560718, -1.691662, 0, 1, 0.8862745, 1,
-0.06985278, 0.8092059, 1.042879, 0, 1, 0.8901961, 1,
-0.06806421, 0.56552, -0.04352421, 0, 1, 0.8980392, 1,
-0.06784163, -0.2117114, -4.058698, 0, 1, 0.9058824, 1,
-0.0678184, 0.6860024, -0.4732433, 0, 1, 0.9098039, 1,
-0.06436265, 0.8132353, -0.9891886, 0, 1, 0.9176471, 1,
-0.06127892, -0.2503691, -3.321795, 0, 1, 0.9215686, 1,
-0.05981533, -0.8993419, -2.081634, 0, 1, 0.9294118, 1,
-0.05674767, 0.9215214, 2.14517, 0, 1, 0.9333333, 1,
-0.05602396, 1.295908, 1.508602, 0, 1, 0.9411765, 1,
-0.0560011, 0.1729499, -0.8169407, 0, 1, 0.945098, 1,
-0.05596036, 1.713214, 2.037809, 0, 1, 0.9529412, 1,
-0.05478679, -0.2956952, -4.142448, 0, 1, 0.9568627, 1,
-0.04792106, 1.550081, 0.2032152, 0, 1, 0.9647059, 1,
-0.04473585, -0.2682983, -4.134365, 0, 1, 0.9686275, 1,
-0.04362808, 1.246623, 0.6636661, 0, 1, 0.9764706, 1,
-0.04198239, 1.377275, 0.8321258, 0, 1, 0.9803922, 1,
-0.0415662, 0.4762682, -0.4554389, 0, 1, 0.9882353, 1,
-0.04045525, -0.1140121, -2.582922, 0, 1, 0.9921569, 1,
-0.03652695, 0.1230991, -1.031742, 0, 1, 1, 1,
-0.03513677, 1.138913, 0.1985379, 0, 0.9921569, 1, 1,
-0.03400743, -0.7178152, -1.961843, 0, 0.9882353, 1, 1,
-0.03246644, -1.189819, -2.725919, 0, 0.9803922, 1, 1,
-0.03135458, -0.5966131, -2.786332, 0, 0.9764706, 1, 1,
-0.01055249, 1.087494, -0.5773872, 0, 0.9686275, 1, 1,
-0.01004901, 0.2213891, 1.110724, 0, 0.9647059, 1, 1,
-0.007843674, 0.1142638, 1.078847, 0, 0.9568627, 1, 1,
-0.004093547, -1.416543, -4.522294, 0, 0.9529412, 1, 1,
-0.003887865, -2.050744, -2.0209, 0, 0.945098, 1, 1,
-5.65138e-05, -0.1096618, -3.775645, 0, 0.9411765, 1, 1,
0.0006627091, 2.591836, -2.103699, 0, 0.9333333, 1, 1,
0.003241985, -0.5308083, 2.508098, 0, 0.9294118, 1, 1,
0.004830692, 0.5249963, -1.042982, 0, 0.9215686, 1, 1,
0.005374746, 1.057043, 0.2547914, 0, 0.9176471, 1, 1,
0.009342209, -2.171001, 2.490691, 0, 0.9098039, 1, 1,
0.01020778, -0.9125606, 4.489089, 0, 0.9058824, 1, 1,
0.01299545, 0.04097106, -0.523553, 0, 0.8980392, 1, 1,
0.01426247, -1.062719, 4.133968, 0, 0.8901961, 1, 1,
0.01676807, -0.6031904, 3.20304, 0, 0.8862745, 1, 1,
0.0209702, -0.7467611, 3.228701, 0, 0.8784314, 1, 1,
0.02188558, 0.3518745, -0.2030067, 0, 0.8745098, 1, 1,
0.0224674, -0.5225065, 4.743743, 0, 0.8666667, 1, 1,
0.02353521, 0.1640167, 1.186066, 0, 0.8627451, 1, 1,
0.02921342, -0.7216281, 1.286018, 0, 0.854902, 1, 1,
0.03121775, -0.7664504, 3.232469, 0, 0.8509804, 1, 1,
0.03895646, 0.7033315, 1.85584, 0, 0.8431373, 1, 1,
0.04014809, -0.8929388, 2.945006, 0, 0.8392157, 1, 1,
0.04026748, -0.9196536, 2.457214, 0, 0.8313726, 1, 1,
0.04032654, -0.936228, 4.064999, 0, 0.827451, 1, 1,
0.04072463, 1.485335, 0.4136904, 0, 0.8196079, 1, 1,
0.04561272, 1.165236, 0.9701514, 0, 0.8156863, 1, 1,
0.04654786, 0.5033185, -1.818929, 0, 0.8078431, 1, 1,
0.04860907, -1.76347, 2.325696, 0, 0.8039216, 1, 1,
0.04927855, -1.825279, 2.928355, 0, 0.7960784, 1, 1,
0.0499638, 0.381802, 0.8686545, 0, 0.7882353, 1, 1,
0.0502455, -1.17982, 1.693607, 0, 0.7843137, 1, 1,
0.05387857, -0.5292383, 2.007867, 0, 0.7764706, 1, 1,
0.05585237, -1.63871, 4.093149, 0, 0.772549, 1, 1,
0.05855684, 0.9016452, 1.24843, 0, 0.7647059, 1, 1,
0.06531187, 0.8600584, -0.564558, 0, 0.7607843, 1, 1,
0.06623413, 0.6542262, -0.7781316, 0, 0.7529412, 1, 1,
0.06682944, -0.8377214, 1.477622, 0, 0.7490196, 1, 1,
0.06786991, -1.032344, 2.943199, 0, 0.7411765, 1, 1,
0.0690728, 0.3962737, 3.000728, 0, 0.7372549, 1, 1,
0.07402126, -0.1477763, 2.310086, 0, 0.7294118, 1, 1,
0.07583924, -0.2363626, 4.614899, 0, 0.7254902, 1, 1,
0.07772689, -0.6890894, 2.685359, 0, 0.7176471, 1, 1,
0.0791343, -0.8221046, 3.186444, 0, 0.7137255, 1, 1,
0.08025821, -1.223284, 2.507279, 0, 0.7058824, 1, 1,
0.0805884, 0.7779145, -0.2679318, 0, 0.6980392, 1, 1,
0.08262184, 0.1292053, -0.284546, 0, 0.6941177, 1, 1,
0.08286297, 0.646942, 0.9139151, 0, 0.6862745, 1, 1,
0.08406, 1.801479, 0.4035757, 0, 0.682353, 1, 1,
0.08808595, 1.100572, 1.614673, 0, 0.6745098, 1, 1,
0.09234202, 0.5227482, -1.208363, 0, 0.6705883, 1, 1,
0.09412687, 0.8049328, 1.189886, 0, 0.6627451, 1, 1,
0.09425431, 0.3711043, 1.577807, 0, 0.6588235, 1, 1,
0.09435188, -1.17048, 2.347959, 0, 0.6509804, 1, 1,
0.09795325, -0.7385345, 2.788338, 0, 0.6470588, 1, 1,
0.1005251, 0.8451657, -0.9697777, 0, 0.6392157, 1, 1,
0.1044175, 0.7319201, 0.502847, 0, 0.6352941, 1, 1,
0.1055041, -0.5657765, 2.070184, 0, 0.627451, 1, 1,
0.1059333, -0.3451008, 3.827793, 0, 0.6235294, 1, 1,
0.1098131, -2.541581, 2.943506, 0, 0.6156863, 1, 1,
0.1104026, 1.049877, 0.2500629, 0, 0.6117647, 1, 1,
0.1125827, -1.158225, 2.356256, 0, 0.6039216, 1, 1,
0.1162224, 1.188468, 1.294585, 0, 0.5960785, 1, 1,
0.1172602, 0.667802, -1.126751, 0, 0.5921569, 1, 1,
0.1184172, -0.08093155, 2.099216, 0, 0.5843138, 1, 1,
0.1200907, -0.3651653, 2.721378, 0, 0.5803922, 1, 1,
0.1230393, 0.1674401, 1.642974, 0, 0.572549, 1, 1,
0.1272117, -0.283356, 3.368086, 0, 0.5686275, 1, 1,
0.1328187, 1.550148, -0.2259438, 0, 0.5607843, 1, 1,
0.1383559, -0.8530053, 2.994065, 0, 0.5568628, 1, 1,
0.1390249, 0.8607184, 0.8371885, 0, 0.5490196, 1, 1,
0.139563, -1.072861, 4.641674, 0, 0.5450981, 1, 1,
0.1420897, -0.4412657, 3.104693, 0, 0.5372549, 1, 1,
0.1430319, 0.5428401, 0.8365042, 0, 0.5333334, 1, 1,
0.1444955, -0.7726117, 3.363592, 0, 0.5254902, 1, 1,
0.1451352, -1.116297, 4.251263, 0, 0.5215687, 1, 1,
0.1478479, 2.266422, 0.02440655, 0, 0.5137255, 1, 1,
0.1508206, -1.209088, 3.276411, 0, 0.509804, 1, 1,
0.1516763, -0.6392842, 0.971149, 0, 0.5019608, 1, 1,
0.1532552, -0.007002873, 0.9128695, 0, 0.4941176, 1, 1,
0.1584013, -1.122759, 4.417447, 0, 0.4901961, 1, 1,
0.170874, 0.7400296, -0.6622467, 0, 0.4823529, 1, 1,
0.1713376, 0.3467668, -0.2059784, 0, 0.4784314, 1, 1,
0.1721219, -0.4572619, 4.123851, 0, 0.4705882, 1, 1,
0.1725546, 1.028578, -0.9054692, 0, 0.4666667, 1, 1,
0.174676, -0.7919264, 2.262233, 0, 0.4588235, 1, 1,
0.1781415, 1.831709, 0.2624068, 0, 0.454902, 1, 1,
0.1871669, -0.8718613, 1.31827, 0, 0.4470588, 1, 1,
0.1885374, -0.7468237, 1.462178, 0, 0.4431373, 1, 1,
0.1926735, -0.9454391, 3.725534, 0, 0.4352941, 1, 1,
0.193661, 0.0891387, 1.419837, 0, 0.4313726, 1, 1,
0.1942876, 0.9349509, 1.375623, 0, 0.4235294, 1, 1,
0.1997083, -0.6773308, 3.131231, 0, 0.4196078, 1, 1,
0.2016155, 0.256356, 0.4289426, 0, 0.4117647, 1, 1,
0.2100933, -0.710884, 2.550566, 0, 0.4078431, 1, 1,
0.216486, 1.146336, 1.687614, 0, 0.4, 1, 1,
0.2174592, -1.585926, 3.458876, 0, 0.3921569, 1, 1,
0.2175226, 0.6148012, 1.936226, 0, 0.3882353, 1, 1,
0.2229161, -0.2135867, 2.207167, 0, 0.3803922, 1, 1,
0.2239662, 0.9979265, 0.6337495, 0, 0.3764706, 1, 1,
0.2250985, -0.8903952, 2.769186, 0, 0.3686275, 1, 1,
0.2284095, -0.7865283, 2.877064, 0, 0.3647059, 1, 1,
0.229352, 0.5335681, 1.502592, 0, 0.3568628, 1, 1,
0.2374145, 0.3587813, -0.06151249, 0, 0.3529412, 1, 1,
0.2463402, 0.2888901, 1.834464, 0, 0.345098, 1, 1,
0.2479867, -0.2773417, 3.281792, 0, 0.3411765, 1, 1,
0.2480406, -2.211065, 2.477989, 0, 0.3333333, 1, 1,
0.2484059, 0.4077045, 0.3120137, 0, 0.3294118, 1, 1,
0.249204, 1.119563, 0.6630291, 0, 0.3215686, 1, 1,
0.2505178, 0.3706265, -0.1105703, 0, 0.3176471, 1, 1,
0.2512814, -1.022459, 2.133786, 0, 0.3098039, 1, 1,
0.2580417, -0.4449607, 3.326892, 0, 0.3058824, 1, 1,
0.2630881, -0.5939817, 2.988315, 0, 0.2980392, 1, 1,
0.2634752, 0.2365304, 0.4509545, 0, 0.2901961, 1, 1,
0.269461, 0.03145454, 1.16962, 0, 0.2862745, 1, 1,
0.2745566, 2.009516, -0.5534553, 0, 0.2784314, 1, 1,
0.2756459, -0.05191104, 3.261667, 0, 0.2745098, 1, 1,
0.2783065, 0.6167001, 0.1556741, 0, 0.2666667, 1, 1,
0.2798763, 0.0290689, 1.779457, 0, 0.2627451, 1, 1,
0.2824124, -1.141379, 2.811326, 0, 0.254902, 1, 1,
0.2830261, -1.169071, 2.299291, 0, 0.2509804, 1, 1,
0.283291, 0.05772128, 1.471856, 0, 0.2431373, 1, 1,
0.2850339, -0.9271458, 1.849904, 0, 0.2392157, 1, 1,
0.2886261, 2.683397, 1.03655, 0, 0.2313726, 1, 1,
0.2896302, 0.4316517, 1.520465, 0, 0.227451, 1, 1,
0.2921101, 1.659853, -0.04261216, 0, 0.2196078, 1, 1,
0.295227, -0.08301043, 1.176115, 0, 0.2156863, 1, 1,
0.2979289, -0.6979966, 2.858653, 0, 0.2078431, 1, 1,
0.3072877, 0.1380223, 1.013942, 0, 0.2039216, 1, 1,
0.3137993, 0.002884345, 2.548856, 0, 0.1960784, 1, 1,
0.3138765, 0.7433658, -0.6630425, 0, 0.1882353, 1, 1,
0.3167352, 0.9052584, 1.536072, 0, 0.1843137, 1, 1,
0.3173377, -0.3717201, 1.536407, 0, 0.1764706, 1, 1,
0.3191037, 0.2126523, -0.1048249, 0, 0.172549, 1, 1,
0.3217742, 0.9079375, -0.2033978, 0, 0.1647059, 1, 1,
0.3256846, 1.038481, -0.05077634, 0, 0.1607843, 1, 1,
0.3268089, 0.5220166, 0.4338869, 0, 0.1529412, 1, 1,
0.3320368, 0.5603472, 1.174722, 0, 0.1490196, 1, 1,
0.332435, -0.9357414, 3.387248, 0, 0.1411765, 1, 1,
0.3341874, -1.449304, 2.284263, 0, 0.1372549, 1, 1,
0.3369831, -1.883306, 4.851676, 0, 0.1294118, 1, 1,
0.3413942, 0.8780752, 0.2624444, 0, 0.1254902, 1, 1,
0.3444356, -1.053658, 3.58002, 0, 0.1176471, 1, 1,
0.3444527, 0.335299, -0.4110783, 0, 0.1137255, 1, 1,
0.3489819, 1.381905, -0.4923459, 0, 0.1058824, 1, 1,
0.3492778, -0.01729956, 1.848662, 0, 0.09803922, 1, 1,
0.3527721, 0.01313736, 1.967457, 0, 0.09411765, 1, 1,
0.3537721, 1.159856, -0.5058633, 0, 0.08627451, 1, 1,
0.3619266, 0.9492762, 0.2338796, 0, 0.08235294, 1, 1,
0.3620428, -0.736548, 2.035639, 0, 0.07450981, 1, 1,
0.3621238, -0.1103776, 1.885746, 0, 0.07058824, 1, 1,
0.3622088, 0.4136616, -0.3823016, 0, 0.0627451, 1, 1,
0.3624985, 1.67087, -0.988448, 0, 0.05882353, 1, 1,
0.368606, -1.190277, 3.164582, 0, 0.05098039, 1, 1,
0.3701913, 0.6800166, -0.4198746, 0, 0.04705882, 1, 1,
0.3714862, 1.849248, -0.9433075, 0, 0.03921569, 1, 1,
0.373916, 1.161192, 0.5144282, 0, 0.03529412, 1, 1,
0.3749378, -1.300289, 3.051304, 0, 0.02745098, 1, 1,
0.3776848, 0.6450903, 0.206372, 0, 0.02352941, 1, 1,
0.380529, 1.098136, -0.05769265, 0, 0.01568628, 1, 1,
0.3810213, 0.5142622, 1.090963, 0, 0.01176471, 1, 1,
0.3821125, 0.2450648, 0.894543, 0, 0.003921569, 1, 1,
0.3869427, 0.3214629, 2.023479, 0.003921569, 0, 1, 1,
0.3948273, 1.899183, 1.822505, 0.007843138, 0, 1, 1,
0.3996457, 1.440098, -0.4974908, 0.01568628, 0, 1, 1,
0.4015613, 0.402831, -1.093577, 0.01960784, 0, 1, 1,
0.4017247, -2.012472, 3.313843, 0.02745098, 0, 1, 1,
0.4021264, -0.4934269, 2.775471, 0.03137255, 0, 1, 1,
0.4088405, -1.366964, 2.955365, 0.03921569, 0, 1, 1,
0.4168306, -0.427475, 3.197948, 0.04313726, 0, 1, 1,
0.4182586, 0.2013333, 0.9909633, 0.05098039, 0, 1, 1,
0.4206463, 0.105212, 0.4486164, 0.05490196, 0, 1, 1,
0.4210298, -0.1232823, 1.74885, 0.0627451, 0, 1, 1,
0.4250005, -0.7398559, 2.455209, 0.06666667, 0, 1, 1,
0.4256791, -1.100996, 1.691983, 0.07450981, 0, 1, 1,
0.4272961, 1.254469, 0.2474047, 0.07843138, 0, 1, 1,
0.4293208, 1.360517, -1.090249, 0.08627451, 0, 1, 1,
0.4322733, -1.509518, 2.214167, 0.09019608, 0, 1, 1,
0.4387251, -0.3150556, 1.81123, 0.09803922, 0, 1, 1,
0.4393675, 0.5428654, 0.1409099, 0.1058824, 0, 1, 1,
0.4409861, -0.6536444, 2.779474, 0.1098039, 0, 1, 1,
0.453234, 1.433518, -0.3202415, 0.1176471, 0, 1, 1,
0.4589964, -0.8184838, 2.284524, 0.1215686, 0, 1, 1,
0.4604913, 0.3366529, -0.4065658, 0.1294118, 0, 1, 1,
0.4621443, 0.4155872, -0.1660843, 0.1333333, 0, 1, 1,
0.4654002, 0.5687222, 0.2294332, 0.1411765, 0, 1, 1,
0.4656073, 1.110208, -1.229495, 0.145098, 0, 1, 1,
0.4658973, 0.2789543, 1.145019, 0.1529412, 0, 1, 1,
0.4678281, 1.156892, -1.123256, 0.1568628, 0, 1, 1,
0.4685528, 0.1729772, 0.2846695, 0.1647059, 0, 1, 1,
0.4686452, 0.7454317, -1.155632, 0.1686275, 0, 1, 1,
0.4691327, -0.3320256, 1.425762, 0.1764706, 0, 1, 1,
0.4731189, -0.5737275, 0.7112627, 0.1803922, 0, 1, 1,
0.4745776, 0.3131425, 2.895957, 0.1882353, 0, 1, 1,
0.480682, -0.1394353, 4.633085, 0.1921569, 0, 1, 1,
0.4870087, 0.5973458, 1.942706, 0.2, 0, 1, 1,
0.4879981, -0.2098414, 1.555836, 0.2078431, 0, 1, 1,
0.4905167, -1.849285, 3.345815, 0.2117647, 0, 1, 1,
0.4943117, -1.770802, 3.647296, 0.2196078, 0, 1, 1,
0.4980035, -0.09308539, 0.03289808, 0.2235294, 0, 1, 1,
0.5007191, -0.03571409, -0.3993999, 0.2313726, 0, 1, 1,
0.501519, 1.260139, 0.4883985, 0.2352941, 0, 1, 1,
0.5024619, -1.981695, 2.016558, 0.2431373, 0, 1, 1,
0.5031866, 0.5824559, -0.117283, 0.2470588, 0, 1, 1,
0.504755, -1.198426, 2.905306, 0.254902, 0, 1, 1,
0.5085038, -0.2147772, 1.443988, 0.2588235, 0, 1, 1,
0.5095887, -2.169373, 2.549168, 0.2666667, 0, 1, 1,
0.5103256, 0.5235195, -1.920618, 0.2705882, 0, 1, 1,
0.5280024, 0.3196815, 2.752225, 0.2784314, 0, 1, 1,
0.5333539, 0.436003, 0.6353812, 0.282353, 0, 1, 1,
0.534383, -0.8124856, 2.471937, 0.2901961, 0, 1, 1,
0.5374129, -0.9643348, 1.724111, 0.2941177, 0, 1, 1,
0.5395502, -1.182089, 3.855627, 0.3019608, 0, 1, 1,
0.5400795, 0.6117904, 0.8013271, 0.3098039, 0, 1, 1,
0.5427551, 1.042994, -1.550299, 0.3137255, 0, 1, 1,
0.5445876, -0.7340521, 1.092653, 0.3215686, 0, 1, 1,
0.5466787, -0.4155729, 2.028815, 0.3254902, 0, 1, 1,
0.5508599, -0.2200816, 2.330817, 0.3333333, 0, 1, 1,
0.5574345, 0.7988092, -0.9411947, 0.3372549, 0, 1, 1,
0.5632773, 1.165148, 0.2649105, 0.345098, 0, 1, 1,
0.5633911, -0.1876015, 0.1716502, 0.3490196, 0, 1, 1,
0.5711774, -0.3455729, 2.442315, 0.3568628, 0, 1, 1,
0.573294, 0.5962848, 0.8402101, 0.3607843, 0, 1, 1,
0.5734997, -0.4158257, 3.626317, 0.3686275, 0, 1, 1,
0.57821, -0.2422684, 2.532517, 0.372549, 0, 1, 1,
0.5792609, -0.711458, 2.394488, 0.3803922, 0, 1, 1,
0.5852435, -0.6101112, 1.506643, 0.3843137, 0, 1, 1,
0.585939, 0.4908944, -0.8977252, 0.3921569, 0, 1, 1,
0.5868194, -2.006849, 2.955669, 0.3960784, 0, 1, 1,
0.5909155, -0.08883245, 1.600474, 0.4039216, 0, 1, 1,
0.5933105, 2.573815, -1.30509, 0.4117647, 0, 1, 1,
0.6010844, 0.5060131, 0.6953292, 0.4156863, 0, 1, 1,
0.6023869, 0.05611296, 2.428293, 0.4235294, 0, 1, 1,
0.6069937, -0.4547025, 4.097964, 0.427451, 0, 1, 1,
0.6084094, 1.20049, -1.470886, 0.4352941, 0, 1, 1,
0.6102368, 0.1090555, 1.040507, 0.4392157, 0, 1, 1,
0.6129871, 1.739621, -0.3248716, 0.4470588, 0, 1, 1,
0.6148016, 0.1918744, 1.888497, 0.4509804, 0, 1, 1,
0.6174393, 1.31841, -1.603182, 0.4588235, 0, 1, 1,
0.6186946, -0.5069829, 0.4053926, 0.4627451, 0, 1, 1,
0.6222415, -0.2253784, 0.9664624, 0.4705882, 0, 1, 1,
0.6241916, 0.01495899, 0.2706322, 0.4745098, 0, 1, 1,
0.6321924, -1.715685, 2.883132, 0.4823529, 0, 1, 1,
0.6326019, -2.316194, 2.472492, 0.4862745, 0, 1, 1,
0.6340111, -2.195656, 1.253302, 0.4941176, 0, 1, 1,
0.6350374, 0.8834091, 0.7667251, 0.5019608, 0, 1, 1,
0.6377508, 0.4299421, 1.945521, 0.5058824, 0, 1, 1,
0.6462801, 0.7132594, 0.3826485, 0.5137255, 0, 1, 1,
0.6542489, -0.02436998, 0.6547463, 0.5176471, 0, 1, 1,
0.6558878, 1.764107, 0.6018747, 0.5254902, 0, 1, 1,
0.6667373, -0.1132634, 0.4448573, 0.5294118, 0, 1, 1,
0.6760064, 0.5815866, 1.053292, 0.5372549, 0, 1, 1,
0.6761602, -1.004984, 3.320446, 0.5411765, 0, 1, 1,
0.6764863, 0.9100055, 1.520093, 0.5490196, 0, 1, 1,
0.6767911, 0.2742984, 2.617851, 0.5529412, 0, 1, 1,
0.6820641, 0.1682143, 2.175355, 0.5607843, 0, 1, 1,
0.6826659, 1.251708, 1.666831, 0.5647059, 0, 1, 1,
0.6832539, 0.887406, -1.071846, 0.572549, 0, 1, 1,
0.6852899, 1.185614, 0.9265591, 0.5764706, 0, 1, 1,
0.685455, -0.9138175, 4.633781, 0.5843138, 0, 1, 1,
0.6863188, 0.6426905, 0.08193313, 0.5882353, 0, 1, 1,
0.6879787, 0.2626282, -0.9816675, 0.5960785, 0, 1, 1,
0.6882651, 0.4892268, -0.2159703, 0.6039216, 0, 1, 1,
0.6898966, -0.3474968, 1.40005, 0.6078432, 0, 1, 1,
0.6904182, -1.280952, 1.438422, 0.6156863, 0, 1, 1,
0.6972272, 1.412567, -1.187097, 0.6196079, 0, 1, 1,
0.6989094, -0.318913, 2.636881, 0.627451, 0, 1, 1,
0.704078, 1.9481, 0.577865, 0.6313726, 0, 1, 1,
0.7052999, -0.4658659, 1.649681, 0.6392157, 0, 1, 1,
0.7079451, 0.5796682, 2.216191, 0.6431373, 0, 1, 1,
0.7093473, 0.9145711, 0.5413752, 0.6509804, 0, 1, 1,
0.7094548, 0.4400559, 0.7086281, 0.654902, 0, 1, 1,
0.7156025, -0.5117222, 0.6561912, 0.6627451, 0, 1, 1,
0.715764, 0.4625363, 3.322773, 0.6666667, 0, 1, 1,
0.7216225, 0.1860876, -0.6038983, 0.6745098, 0, 1, 1,
0.7257549, -0.990571, 2.55851, 0.6784314, 0, 1, 1,
0.7282759, 0.7399731, 1.470693, 0.6862745, 0, 1, 1,
0.7289378, 0.3659779, 0.8536381, 0.6901961, 0, 1, 1,
0.7318966, 1.550094, 0.6003893, 0.6980392, 0, 1, 1,
0.7412372, 1.061002, 0.3483566, 0.7058824, 0, 1, 1,
0.7425108, 0.5777755, 1.712019, 0.7098039, 0, 1, 1,
0.7430444, -0.2974694, 1.271136, 0.7176471, 0, 1, 1,
0.7460832, 2.362424, -0.3250075, 0.7215686, 0, 1, 1,
0.748137, 0.7235519, 2.222471, 0.7294118, 0, 1, 1,
0.7510508, 0.5799164, 0.4319083, 0.7333333, 0, 1, 1,
0.7579927, -0.076209, 1.619879, 0.7411765, 0, 1, 1,
0.7609373, -0.8168731, 3.54149, 0.7450981, 0, 1, 1,
0.7642254, -0.5002559, 1.322232, 0.7529412, 0, 1, 1,
0.7702542, 1.08178, 0.06378145, 0.7568628, 0, 1, 1,
0.7717456, 0.1517277, 1.51548, 0.7647059, 0, 1, 1,
0.7718078, 0.02294471, 1.848692, 0.7686275, 0, 1, 1,
0.7760249, 1.232718, 1.059661, 0.7764706, 0, 1, 1,
0.7779788, -0.8250749, 2.606884, 0.7803922, 0, 1, 1,
0.7811719, 0.5519682, 0.3476472, 0.7882353, 0, 1, 1,
0.7829899, -0.1751705, 1.018402, 0.7921569, 0, 1, 1,
0.7896222, 0.6300851, 0.1732837, 0.8, 0, 1, 1,
0.7907135, 0.4413387, 1.842184, 0.8078431, 0, 1, 1,
0.8047845, -1.441513, 3.857745, 0.8117647, 0, 1, 1,
0.8083198, -1.178136, 3.515023, 0.8196079, 0, 1, 1,
0.8095432, 0.1392035, 0.7644625, 0.8235294, 0, 1, 1,
0.8139374, -1.248926, 1.282525, 0.8313726, 0, 1, 1,
0.8204146, -1.451954, 2.520522, 0.8352941, 0, 1, 1,
0.8223763, -2.278128, 1.754954, 0.8431373, 0, 1, 1,
0.8224751, -0.4061671, 2.516756, 0.8470588, 0, 1, 1,
0.8267129, -0.1406623, 0.4615006, 0.854902, 0, 1, 1,
0.8270158, 0.4159752, -0.6546406, 0.8588235, 0, 1, 1,
0.8313975, -0.2277842, 2.717938, 0.8666667, 0, 1, 1,
0.8435525, 0.195041, 1.077792, 0.8705882, 0, 1, 1,
0.8465061, 0.5540636, 0.6064444, 0.8784314, 0, 1, 1,
0.8487698, 0.8249153, 0.8433831, 0.8823529, 0, 1, 1,
0.8495089, 0.8875154, 0.7548019, 0.8901961, 0, 1, 1,
0.8629285, 0.04942339, 0.8533337, 0.8941177, 0, 1, 1,
0.8691287, -1.028862, 0.766006, 0.9019608, 0, 1, 1,
0.8705023, 0.2092585, 1.346263, 0.9098039, 0, 1, 1,
0.8737597, 0.08768117, 2.201835, 0.9137255, 0, 1, 1,
0.8798456, 0.7753485, 2.34898, 0.9215686, 0, 1, 1,
0.8863286, -0.8000716, 2.302937, 0.9254902, 0, 1, 1,
0.8866903, -0.2892643, 1.52197, 0.9333333, 0, 1, 1,
0.8916503, -0.9124252, 2.276961, 0.9372549, 0, 1, 1,
0.8945752, -0.06526659, 0.3594317, 0.945098, 0, 1, 1,
0.8961187, 0.3711164, -0.863243, 0.9490196, 0, 1, 1,
0.8984095, 0.4741016, 2.533695, 0.9568627, 0, 1, 1,
0.9169111, -0.04704569, 1.401385, 0.9607843, 0, 1, 1,
0.9179121, 1.193633, 1.603678, 0.9686275, 0, 1, 1,
0.922323, -2.478499, 3.019377, 0.972549, 0, 1, 1,
0.9285608, -0.5401346, 0.2894121, 0.9803922, 0, 1, 1,
0.9311994, -0.7617646, 2.883832, 0.9843137, 0, 1, 1,
0.9382274, 1.357104, 1.187248, 0.9921569, 0, 1, 1,
0.943253, 1.551956, 2.062277, 0.9960784, 0, 1, 1,
0.9541442, 1.445601, -0.3807414, 1, 0, 0.9960784, 1,
0.9589013, -1.704027, 4.021319, 1, 0, 0.9882353, 1,
0.9671534, 0.2414023, 0.7405698, 1, 0, 0.9843137, 1,
0.9764983, -0.5286236, 2.88513, 1, 0, 0.9764706, 1,
0.980193, -0.6174069, 1.713322, 1, 0, 0.972549, 1,
0.9814798, 0.8027986, -1.732115, 1, 0, 0.9647059, 1,
0.9823795, 1.820935, 0.0741296, 1, 0, 0.9607843, 1,
0.9847034, -0.541467, 1.25806, 1, 0, 0.9529412, 1,
0.9957101, -0.8260937, 2.814641, 1, 0, 0.9490196, 1,
0.9960292, -0.09040808, 1.898808, 1, 0, 0.9411765, 1,
1.00232, 0.5914314, 1.128871, 1, 0, 0.9372549, 1,
1.007452, -0.562122, 0.7820335, 1, 0, 0.9294118, 1,
1.01019, -0.3368353, 3.513639, 1, 0, 0.9254902, 1,
1.013889, 0.9806563, -0.5993424, 1, 0, 0.9176471, 1,
1.014657, -0.07177106, -0.5863009, 1, 0, 0.9137255, 1,
1.016256, 0.4170395, 1.79236, 1, 0, 0.9058824, 1,
1.020175, 0.7802083, 0.02150186, 1, 0, 0.9019608, 1,
1.025531, -0.1985094, 2.440718, 1, 0, 0.8941177, 1,
1.029148, -1.213857, 2.715729, 1, 0, 0.8862745, 1,
1.029529, 0.08520631, 1.4824, 1, 0, 0.8823529, 1,
1.037865, -0.7863131, 0.224818, 1, 0, 0.8745098, 1,
1.053216, -0.2291833, 2.152154, 1, 0, 0.8705882, 1,
1.061973, -1.200231, 1.956075, 1, 0, 0.8627451, 1,
1.082421, -0.2358123, 2.233163, 1, 0, 0.8588235, 1,
1.084191, -0.9794947, 2.106563, 1, 0, 0.8509804, 1,
1.086195, -0.3718359, -0.0264763, 1, 0, 0.8470588, 1,
1.08708, 0.1125066, 1.74165, 1, 0, 0.8392157, 1,
1.090073, -1.317004, 1.985719, 1, 0, 0.8352941, 1,
1.090297, -1.438011, 3.849537, 1, 0, 0.827451, 1,
1.093597, 0.5152773, 1.494506, 1, 0, 0.8235294, 1,
1.104457, -1.139389, 3.737792, 1, 0, 0.8156863, 1,
1.106229, -0.8483105, 2.672303, 1, 0, 0.8117647, 1,
1.10735, 0.4146818, 0.8832799, 1, 0, 0.8039216, 1,
1.107601, 0.2796226, 0.5583456, 1, 0, 0.7960784, 1,
1.108225, -1.365527, 2.492208, 1, 0, 0.7921569, 1,
1.118197, -0.5744308, 2.565967, 1, 0, 0.7843137, 1,
1.125973, -1.496405, 3.203399, 1, 0, 0.7803922, 1,
1.126887, -0.6027957, 2.442677, 1, 0, 0.772549, 1,
1.130819, 0.2112485, 0.3090735, 1, 0, 0.7686275, 1,
1.143481, -0.6735179, 1.882953, 1, 0, 0.7607843, 1,
1.145817, 0.1840487, 0.4620903, 1, 0, 0.7568628, 1,
1.146096, -1.645261, 2.597179, 1, 0, 0.7490196, 1,
1.146938, 0.04574414, -0.1175431, 1, 0, 0.7450981, 1,
1.156738, 0.4477596, 2.39465, 1, 0, 0.7372549, 1,
1.158589, -0.5461039, 2.748696, 1, 0, 0.7333333, 1,
1.159892, -0.5729251, 1.298151, 1, 0, 0.7254902, 1,
1.168021, -2.016287, 2.162071, 1, 0, 0.7215686, 1,
1.17058, 2.359921, -0.2125495, 1, 0, 0.7137255, 1,
1.17359, -1.465889, 1.631365, 1, 0, 0.7098039, 1,
1.183428, 0.5755612, 1.147807, 1, 0, 0.7019608, 1,
1.18805, 0.4685794, 3.164215, 1, 0, 0.6941177, 1,
1.191538, -0.6393061, 2.175869, 1, 0, 0.6901961, 1,
1.206252, -0.1557316, 2.111385, 1, 0, 0.682353, 1,
1.206853, 0.7124227, 2.536931, 1, 0, 0.6784314, 1,
1.212306, 1.441769, 0.6076155, 1, 0, 0.6705883, 1,
1.223998, -0.6039899, 0.9390615, 1, 0, 0.6666667, 1,
1.227648, -1.309028, 2.574508, 1, 0, 0.6588235, 1,
1.227994, -0.2855362, 3.205822, 1, 0, 0.654902, 1,
1.234542, -1.303566, 3.638008, 1, 0, 0.6470588, 1,
1.243996, -1.410016, 1.648284, 1, 0, 0.6431373, 1,
1.250536, -0.7360496, 2.17525, 1, 0, 0.6352941, 1,
1.262064, -0.2068465, 1.30374, 1, 0, 0.6313726, 1,
1.273341, -0.9507045, 3.869147, 1, 0, 0.6235294, 1,
1.277385, -0.0264859, 2.734504, 1, 0, 0.6196079, 1,
1.280262, 1.072304, 0.957972, 1, 0, 0.6117647, 1,
1.280268, 0.1057808, 2.537973, 1, 0, 0.6078432, 1,
1.280653, -0.3333791, 2.627604, 1, 0, 0.6, 1,
1.284355, 0.407591, 2.339786, 1, 0, 0.5921569, 1,
1.284685, -0.3937372, 1.26905, 1, 0, 0.5882353, 1,
1.289528, 0.3515548, 2.149868, 1, 0, 0.5803922, 1,
1.295747, 0.04854441, 0.6324033, 1, 0, 0.5764706, 1,
1.309118, -0.1078986, -0.2057904, 1, 0, 0.5686275, 1,
1.309838, 0.8155148, 0.4376155, 1, 0, 0.5647059, 1,
1.310084, -0.9168075, 2.547971, 1, 0, 0.5568628, 1,
1.318922, -1.100568, 2.886018, 1, 0, 0.5529412, 1,
1.330905, 0.928124, 1.774763, 1, 0, 0.5450981, 1,
1.351006, -2.518883, 3.974272, 1, 0, 0.5411765, 1,
1.35537, 1.23315, 1.20356, 1, 0, 0.5333334, 1,
1.370397, 0.2609577, -0.8072204, 1, 0, 0.5294118, 1,
1.372211, -2.151751, 1.181679, 1, 0, 0.5215687, 1,
1.373222, -0.2060508, 1.125231, 1, 0, 0.5176471, 1,
1.374964, -1.263568, 3.460268, 1, 0, 0.509804, 1,
1.375002, 0.512911, 1.508827, 1, 0, 0.5058824, 1,
1.377089, 0.8254921, 0.7397842, 1, 0, 0.4980392, 1,
1.377219, -1.15344, 2.287682, 1, 0, 0.4901961, 1,
1.381046, -1.155195, 4.162553, 1, 0, 0.4862745, 1,
1.383021, -1.130935, 1.485428, 1, 0, 0.4784314, 1,
1.404072, -0.9271633, 2.488603, 1, 0, 0.4745098, 1,
1.404658, 0.1879862, 2.032416, 1, 0, 0.4666667, 1,
1.433513, 0.5263105, 1.648494, 1, 0, 0.4627451, 1,
1.435577, 0.7439106, 1.449917, 1, 0, 0.454902, 1,
1.438561, 1.766513, 1.112811, 1, 0, 0.4509804, 1,
1.46006, 0.7817797, 0.04859951, 1, 0, 0.4431373, 1,
1.474692, 1.963477, 1.932961, 1, 0, 0.4392157, 1,
1.489113, -1.899275, 2.369905, 1, 0, 0.4313726, 1,
1.505071, -0.9661707, 2.216336, 1, 0, 0.427451, 1,
1.505839, 0.2973806, 1.598376, 1, 0, 0.4196078, 1,
1.509217, -1.562602, 2.976126, 1, 0, 0.4156863, 1,
1.509495, -0.5612106, 2.625943, 1, 0, 0.4078431, 1,
1.510157, 1.395396, 0.3052282, 1, 0, 0.4039216, 1,
1.515667, 1.114306, -0.469823, 1, 0, 0.3960784, 1,
1.519451, 1.03294, 1.39761, 1, 0, 0.3882353, 1,
1.526286, -0.7729869, 0.2960935, 1, 0, 0.3843137, 1,
1.540689, -0.1927392, 1.187016, 1, 0, 0.3764706, 1,
1.545243, -0.2531011, 0.4003461, 1, 0, 0.372549, 1,
1.550279, -1.598832, 2.80619, 1, 0, 0.3647059, 1,
1.555763, 1.77694, -0.03243151, 1, 0, 0.3607843, 1,
1.563715, -0.3586803, 2.497453, 1, 0, 0.3529412, 1,
1.579255, 1.116133, 2.315245, 1, 0, 0.3490196, 1,
1.58937, 0.4985764, 0.7542108, 1, 0, 0.3411765, 1,
1.597508, 1.244679, 2.809119, 1, 0, 0.3372549, 1,
1.604022, -1.49525, 1.959143, 1, 0, 0.3294118, 1,
1.61223, -1.583334, 3.023108, 1, 0, 0.3254902, 1,
1.620167, 1.449354, -0.718022, 1, 0, 0.3176471, 1,
1.624692, -0.9331182, 0.5225509, 1, 0, 0.3137255, 1,
1.62518, -1.08902, 2.544037, 1, 0, 0.3058824, 1,
1.641786, -1.367007, 2.521922, 1, 0, 0.2980392, 1,
1.643049, -0.1831522, 0.3104858, 1, 0, 0.2941177, 1,
1.643213, -1.132596, 0.3841786, 1, 0, 0.2862745, 1,
1.646197, 0.2525002, 1.385628, 1, 0, 0.282353, 1,
1.654776, -0.9681631, 3.108951, 1, 0, 0.2745098, 1,
1.665975, 0.09654774, 1.797146, 1, 0, 0.2705882, 1,
1.683718, -1.057971, 0.6367874, 1, 0, 0.2627451, 1,
1.688609, 0.145732, 2.228692, 1, 0, 0.2588235, 1,
1.703656, 0.2531451, 1.716662, 1, 0, 0.2509804, 1,
1.703759, -0.03720478, 1.264523, 1, 0, 0.2470588, 1,
1.720583, -1.437052, 3.540754, 1, 0, 0.2392157, 1,
1.798244, 1.11109, 0.8550517, 1, 0, 0.2352941, 1,
1.800985, 0.391085, 0.7894437, 1, 0, 0.227451, 1,
1.813979, -1.006131, -0.2649085, 1, 0, 0.2235294, 1,
1.820192, -1.391369, 1.519522, 1, 0, 0.2156863, 1,
1.860934, 0.06946124, 0.1009337, 1, 0, 0.2117647, 1,
1.867286, 1.652986, 0.621385, 1, 0, 0.2039216, 1,
1.869522, 0.8979633, 1.038791, 1, 0, 0.1960784, 1,
1.888107, -1.343182, 2.820006, 1, 0, 0.1921569, 1,
1.898595, 0.05979745, 1.554037, 1, 0, 0.1843137, 1,
1.930941, 0.6300121, -0.8331093, 1, 0, 0.1803922, 1,
1.93432, 1.485364, -1.156675, 1, 0, 0.172549, 1,
1.956134, 1.619222, -0.07164773, 1, 0, 0.1686275, 1,
2.019707, -0.09955533, 3.082924, 1, 0, 0.1607843, 1,
2.048976, 1.199629, -0.1250179, 1, 0, 0.1568628, 1,
2.065421, -0.2155349, -0.02831258, 1, 0, 0.1490196, 1,
2.081268, 2.142706, 1.308991, 1, 0, 0.145098, 1,
2.083161, 1.192786, 0.06411656, 1, 0, 0.1372549, 1,
2.104564, 0.3455699, 2.363133, 1, 0, 0.1333333, 1,
2.113936, -1.141234, 0.2320807, 1, 0, 0.1254902, 1,
2.167342, 1.404685, 1.780641, 1, 0, 0.1215686, 1,
2.170801, -1.364695, 2.058516, 1, 0, 0.1137255, 1,
2.172817, 0.2515405, 2.219531, 1, 0, 0.1098039, 1,
2.207726, -2.640773, 2.659271, 1, 0, 0.1019608, 1,
2.218186, -0.8941341, 1.146224, 1, 0, 0.09411765, 1,
2.258532, -0.7952, 2.589658, 1, 0, 0.09019608, 1,
2.258551, 0.7047276, 1.885565, 1, 0, 0.08235294, 1,
2.262751, -0.1761251, 1.479358, 1, 0, 0.07843138, 1,
2.278221, -1.520214, 1.211152, 1, 0, 0.07058824, 1,
2.315212, -0.712855, 0.7453406, 1, 0, 0.06666667, 1,
2.344286, -0.05152939, 1.437014, 1, 0, 0.05882353, 1,
2.349109, -0.7441583, 1.931458, 1, 0, 0.05490196, 1,
2.433405, -0.4393653, 2.038926, 1, 0, 0.04705882, 1,
2.433991, -0.1717301, 2.830617, 1, 0, 0.04313726, 1,
2.488112, 0.1986536, 2.704996, 1, 0, 0.03529412, 1,
2.574339, -0.3570626, 2.178751, 1, 0, 0.03137255, 1,
2.74565, -0.2958521, 1.188763, 1, 0, 0.02352941, 1,
2.755892, 0.2704844, -0.02433567, 1, 0, 0.01960784, 1,
2.795176, -0.1545714, 1.041326, 1, 0, 0.01176471, 1,
2.897374, -0.2506311, 1.391247, 1, 0, 0.007843138, 1
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
-0.2087435, -3.968614, -7.171813, 0, -0.5, 0.5, 0.5,
-0.2087435, -3.968614, -7.171813, 1, -0.5, 0.5, 0.5,
-0.2087435, -3.968614, -7.171813, 1, 1.5, 0.5, 0.5,
-0.2087435, -3.968614, -7.171813, 0, 1.5, 0.5, 0.5
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
-4.367835, 0.09530938, -7.171813, 0, -0.5, 0.5, 0.5,
-4.367835, 0.09530938, -7.171813, 1, -0.5, 0.5, 0.5,
-4.367835, 0.09530938, -7.171813, 1, 1.5, 0.5, 0.5,
-4.367835, 0.09530938, -7.171813, 0, 1.5, 0.5, 0.5
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
-4.367835, -3.968614, -0.2887638, 0, -0.5, 0.5, 0.5,
-4.367835, -3.968614, -0.2887638, 1, -0.5, 0.5, 0.5,
-4.367835, -3.968614, -0.2887638, 1, 1.5, 0.5, 0.5,
-4.367835, -3.968614, -0.2887638, 0, 1.5, 0.5, 0.5
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
-3, -3.030785, -5.583417,
2, -3.030785, -5.583417,
-3, -3.030785, -5.583417,
-3, -3.18709, -5.848149,
-2, -3.030785, -5.583417,
-2, -3.18709, -5.848149,
-1, -3.030785, -5.583417,
-1, -3.18709, -5.848149,
0, -3.030785, -5.583417,
0, -3.18709, -5.848149,
1, -3.030785, -5.583417,
1, -3.18709, -5.848149,
2, -3.030785, -5.583417,
2, -3.18709, -5.848149
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
-3, -3.4997, -6.377614, 0, -0.5, 0.5, 0.5,
-3, -3.4997, -6.377614, 1, -0.5, 0.5, 0.5,
-3, -3.4997, -6.377614, 1, 1.5, 0.5, 0.5,
-3, -3.4997, -6.377614, 0, 1.5, 0.5, 0.5,
-2, -3.4997, -6.377614, 0, -0.5, 0.5, 0.5,
-2, -3.4997, -6.377614, 1, -0.5, 0.5, 0.5,
-2, -3.4997, -6.377614, 1, 1.5, 0.5, 0.5,
-2, -3.4997, -6.377614, 0, 1.5, 0.5, 0.5,
-1, -3.4997, -6.377614, 0, -0.5, 0.5, 0.5,
-1, -3.4997, -6.377614, 1, -0.5, 0.5, 0.5,
-1, -3.4997, -6.377614, 1, 1.5, 0.5, 0.5,
-1, -3.4997, -6.377614, 0, 1.5, 0.5, 0.5,
0, -3.4997, -6.377614, 0, -0.5, 0.5, 0.5,
0, -3.4997, -6.377614, 1, -0.5, 0.5, 0.5,
0, -3.4997, -6.377614, 1, 1.5, 0.5, 0.5,
0, -3.4997, -6.377614, 0, 1.5, 0.5, 0.5,
1, -3.4997, -6.377614, 0, -0.5, 0.5, 0.5,
1, -3.4997, -6.377614, 1, -0.5, 0.5, 0.5,
1, -3.4997, -6.377614, 1, 1.5, 0.5, 0.5,
1, -3.4997, -6.377614, 0, 1.5, 0.5, 0.5,
2, -3.4997, -6.377614, 0, -0.5, 0.5, 0.5,
2, -3.4997, -6.377614, 1, -0.5, 0.5, 0.5,
2, -3.4997, -6.377614, 1, 1.5, 0.5, 0.5,
2, -3.4997, -6.377614, 0, 1.5, 0.5, 0.5
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
-3.408044, -2, -5.583417,
-3.408044, 3, -5.583417,
-3.408044, -2, -5.583417,
-3.568009, -2, -5.848149,
-3.408044, -1, -5.583417,
-3.568009, -1, -5.848149,
-3.408044, 0, -5.583417,
-3.568009, 0, -5.848149,
-3.408044, 1, -5.583417,
-3.568009, 1, -5.848149,
-3.408044, 2, -5.583417,
-3.568009, 2, -5.848149,
-3.408044, 3, -5.583417,
-3.568009, 3, -5.848149
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
-3.887939, -2, -6.377614, 0, -0.5, 0.5, 0.5,
-3.887939, -2, -6.377614, 1, -0.5, 0.5, 0.5,
-3.887939, -2, -6.377614, 1, 1.5, 0.5, 0.5,
-3.887939, -2, -6.377614, 0, 1.5, 0.5, 0.5,
-3.887939, -1, -6.377614, 0, -0.5, 0.5, 0.5,
-3.887939, -1, -6.377614, 1, -0.5, 0.5, 0.5,
-3.887939, -1, -6.377614, 1, 1.5, 0.5, 0.5,
-3.887939, -1, -6.377614, 0, 1.5, 0.5, 0.5,
-3.887939, 0, -6.377614, 0, -0.5, 0.5, 0.5,
-3.887939, 0, -6.377614, 1, -0.5, 0.5, 0.5,
-3.887939, 0, -6.377614, 1, 1.5, 0.5, 0.5,
-3.887939, 0, -6.377614, 0, 1.5, 0.5, 0.5,
-3.887939, 1, -6.377614, 0, -0.5, 0.5, 0.5,
-3.887939, 1, -6.377614, 1, -0.5, 0.5, 0.5,
-3.887939, 1, -6.377614, 1, 1.5, 0.5, 0.5,
-3.887939, 1, -6.377614, 0, 1.5, 0.5, 0.5,
-3.887939, 2, -6.377614, 0, -0.5, 0.5, 0.5,
-3.887939, 2, -6.377614, 1, -0.5, 0.5, 0.5,
-3.887939, 2, -6.377614, 1, 1.5, 0.5, 0.5,
-3.887939, 2, -6.377614, 0, 1.5, 0.5, 0.5,
-3.887939, 3, -6.377614, 0, -0.5, 0.5, 0.5,
-3.887939, 3, -6.377614, 1, -0.5, 0.5, 0.5,
-3.887939, 3, -6.377614, 1, 1.5, 0.5, 0.5,
-3.887939, 3, -6.377614, 0, 1.5, 0.5, 0.5
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
-3.408044, -3.030785, -4,
-3.408044, -3.030785, 4,
-3.408044, -3.030785, -4,
-3.568009, -3.18709, -4,
-3.408044, -3.030785, -2,
-3.568009, -3.18709, -2,
-3.408044, -3.030785, 0,
-3.568009, -3.18709, 0,
-3.408044, -3.030785, 2,
-3.568009, -3.18709, 2,
-3.408044, -3.030785, 4,
-3.568009, -3.18709, 4
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
-3.887939, -3.4997, -4, 0, -0.5, 0.5, 0.5,
-3.887939, -3.4997, -4, 1, -0.5, 0.5, 0.5,
-3.887939, -3.4997, -4, 1, 1.5, 0.5, 0.5,
-3.887939, -3.4997, -4, 0, 1.5, 0.5, 0.5,
-3.887939, -3.4997, -2, 0, -0.5, 0.5, 0.5,
-3.887939, -3.4997, -2, 1, -0.5, 0.5, 0.5,
-3.887939, -3.4997, -2, 1, 1.5, 0.5, 0.5,
-3.887939, -3.4997, -2, 0, 1.5, 0.5, 0.5,
-3.887939, -3.4997, 0, 0, -0.5, 0.5, 0.5,
-3.887939, -3.4997, 0, 1, -0.5, 0.5, 0.5,
-3.887939, -3.4997, 0, 1, 1.5, 0.5, 0.5,
-3.887939, -3.4997, 0, 0, 1.5, 0.5, 0.5,
-3.887939, -3.4997, 2, 0, -0.5, 0.5, 0.5,
-3.887939, -3.4997, 2, 1, -0.5, 0.5, 0.5,
-3.887939, -3.4997, 2, 1, 1.5, 0.5, 0.5,
-3.887939, -3.4997, 2, 0, 1.5, 0.5, 0.5,
-3.887939, -3.4997, 4, 0, -0.5, 0.5, 0.5,
-3.887939, -3.4997, 4, 1, -0.5, 0.5, 0.5,
-3.887939, -3.4997, 4, 1, 1.5, 0.5, 0.5,
-3.887939, -3.4997, 4, 0, 1.5, 0.5, 0.5
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
-3.408044, -3.030785, -5.583417,
-3.408044, 3.221404, -5.583417,
-3.408044, -3.030785, 5.005889,
-3.408044, 3.221404, 5.005889,
-3.408044, -3.030785, -5.583417,
-3.408044, -3.030785, 5.005889,
-3.408044, 3.221404, -5.583417,
-3.408044, 3.221404, 5.005889,
-3.408044, -3.030785, -5.583417,
2.990557, -3.030785, -5.583417,
-3.408044, -3.030785, 5.005889,
2.990557, -3.030785, 5.005889,
-3.408044, 3.221404, -5.583417,
2.990557, 3.221404, -5.583417,
-3.408044, 3.221404, 5.005889,
2.990557, 3.221404, 5.005889,
2.990557, -3.030785, -5.583417,
2.990557, 3.221404, -5.583417,
2.990557, -3.030785, 5.005889,
2.990557, 3.221404, 5.005889,
2.990557, -3.030785, -5.583417,
2.990557, -3.030785, 5.005889,
2.990557, 3.221404, -5.583417,
2.990557, 3.221404, 5.005889
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
var radius = 7.402238;
var distance = 32.9334;
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
mvMatrix.translate( 0.2087435, -0.09530938, 0.2887638 );
mvMatrix.scale( 1.250811, 1.280103, 0.7558045 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.9334);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


