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
-3.071291, 0.3146643, -0.6797158, 1, 0, 0, 1,
-3.015075, -0.1468879, -2.088339, 1, 0.007843138, 0, 1,
-3.013837, -1.548106, -2.500623, 1, 0.01176471, 0, 1,
-3.011236, 0.2548006, -0.6733595, 1, 0.01960784, 0, 1,
-2.980492, -0.4148938, -2.244935, 1, 0.02352941, 0, 1,
-2.679553, -0.3593342, -1.605703, 1, 0.03137255, 0, 1,
-2.659939, 0.2885986, -0.4726264, 1, 0.03529412, 0, 1,
-2.554164, -0.3105798, -1.895173, 1, 0.04313726, 0, 1,
-2.413294, 0.1036726, -3.725331, 1, 0.04705882, 0, 1,
-2.388689, 0.1924293, -1.724326, 1, 0.05490196, 0, 1,
-2.323174, -1.502046, -1.340028, 1, 0.05882353, 0, 1,
-2.30582, -0.7610185, -3.100494, 1, 0.06666667, 0, 1,
-2.302148, -0.4203442, -2.059163, 1, 0.07058824, 0, 1,
-2.297235, -1.180098, -3.529155, 1, 0.07843138, 0, 1,
-2.272329, -1.195115, -1.33268, 1, 0.08235294, 0, 1,
-2.263834, 0.09422351, -0.01458605, 1, 0.09019608, 0, 1,
-2.255791, -0.4544828, -1.632249, 1, 0.09411765, 0, 1,
-2.24404, 0.4524639, -1.789193, 1, 0.1019608, 0, 1,
-2.225346, -1.172468, -1.925242, 1, 0.1098039, 0, 1,
-2.217351, -0.8126357, -1.470298, 1, 0.1137255, 0, 1,
-2.199174, -1.403061, -2.558174, 1, 0.1215686, 0, 1,
-2.180408, 0.2877339, -1.125779, 1, 0.1254902, 0, 1,
-2.105618, 0.3729387, -0.8431523, 1, 0.1333333, 0, 1,
-2.088105, 0.2604587, -0.9905025, 1, 0.1372549, 0, 1,
-2.070695, 1.233926, 0.3320034, 1, 0.145098, 0, 1,
-2.066712, 0.4579002, -0.6374922, 1, 0.1490196, 0, 1,
-2.015047, -1.490836, -0.6445913, 1, 0.1568628, 0, 1,
-2.00481, 1.256446, 1.10556, 1, 0.1607843, 0, 1,
-1.99916, 0.5258887, -1.993148, 1, 0.1686275, 0, 1,
-1.997227, 0.09232465, -1.016631, 1, 0.172549, 0, 1,
-1.967085, 1.449405, -1.137992, 1, 0.1803922, 0, 1,
-1.948044, -1.01301, -0.8565825, 1, 0.1843137, 0, 1,
-1.94053, -0.7482821, -1.692714, 1, 0.1921569, 0, 1,
-1.937699, -1.202615, -3.511026, 1, 0.1960784, 0, 1,
-1.931322, 0.5147831, -2.543438, 1, 0.2039216, 0, 1,
-1.930674, -0.860071, -1.954468, 1, 0.2117647, 0, 1,
-1.929669, 0.8994827, -0.3504845, 1, 0.2156863, 0, 1,
-1.920735, 0.4094532, -1.282651, 1, 0.2235294, 0, 1,
-1.915189, 1.788835, -0.3565934, 1, 0.227451, 0, 1,
-1.909986, 0.04166023, -0.2930583, 1, 0.2352941, 0, 1,
-1.909169, 1.819534, -0.9439828, 1, 0.2392157, 0, 1,
-1.909088, -0.3365638, -2.088207, 1, 0.2470588, 0, 1,
-1.895153, -0.6822008, -1.558042, 1, 0.2509804, 0, 1,
-1.872678, -1.107802, -1.245259, 1, 0.2588235, 0, 1,
-1.870266, 1.496346, -2.022752, 1, 0.2627451, 0, 1,
-1.865225, 0.9075503, 0.7470453, 1, 0.2705882, 0, 1,
-1.841781, -0.3860394, -1.720956, 1, 0.2745098, 0, 1,
-1.840419, -0.4526778, -2.07728, 1, 0.282353, 0, 1,
-1.804085, -0.01504352, -2.743448, 1, 0.2862745, 0, 1,
-1.799402, -0.07103074, -1.055098, 1, 0.2941177, 0, 1,
-1.773499, -0.07584769, -2.231243, 1, 0.3019608, 0, 1,
-1.768276, 1.207192, 0.1181095, 1, 0.3058824, 0, 1,
-1.762911, -1.102173, -2.744894, 1, 0.3137255, 0, 1,
-1.754586, 0.1861311, -1.305787, 1, 0.3176471, 0, 1,
-1.754455, -0.1566439, -2.177664, 1, 0.3254902, 0, 1,
-1.752234, -0.3368665, -2.831596, 1, 0.3294118, 0, 1,
-1.748458, 0.1232151, 0.04028787, 1, 0.3372549, 0, 1,
-1.747206, -1.062825, -2.984569, 1, 0.3411765, 0, 1,
-1.737454, -0.5786327, -2.18972, 1, 0.3490196, 0, 1,
-1.737319, 0.3882009, -2.40893, 1, 0.3529412, 0, 1,
-1.721592, 0.471326, 0.2076728, 1, 0.3607843, 0, 1,
-1.707977, 1.451049, -1.833076, 1, 0.3647059, 0, 1,
-1.700702, 0.3695801, 0.2698718, 1, 0.372549, 0, 1,
-1.677164, 0.0232437, -2.644937, 1, 0.3764706, 0, 1,
-1.676443, -1.330394, -1.673472, 1, 0.3843137, 0, 1,
-1.668787, 0.3400901, -2.016274, 1, 0.3882353, 0, 1,
-1.644884, -0.4172949, -2.384579, 1, 0.3960784, 0, 1,
-1.621883, -0.1767098, -1.519591, 1, 0.4039216, 0, 1,
-1.611264, 0.7843843, -2.378588, 1, 0.4078431, 0, 1,
-1.591468, 1.018472, 0.227473, 1, 0.4156863, 0, 1,
-1.573087, -0.5255392, -1.317774, 1, 0.4196078, 0, 1,
-1.571199, -0.8521236, -2.308759, 1, 0.427451, 0, 1,
-1.570256, -1.450394, -2.815126, 1, 0.4313726, 0, 1,
-1.544933, 0.5722139, -0.6210224, 1, 0.4392157, 0, 1,
-1.540111, 0.9955666, 0.3407125, 1, 0.4431373, 0, 1,
-1.538539, -1.344083, -2.028986, 1, 0.4509804, 0, 1,
-1.527643, -0.1005173, -0.9567189, 1, 0.454902, 0, 1,
-1.523592, 0.9867374, -0.8009366, 1, 0.4627451, 0, 1,
-1.510861, 0.07962942, -0.1371444, 1, 0.4666667, 0, 1,
-1.504459, -0.8330411, -2.579476, 1, 0.4745098, 0, 1,
-1.499222, 0.9976385, 0.9265001, 1, 0.4784314, 0, 1,
-1.499144, 1.098778, -0.02675514, 1, 0.4862745, 0, 1,
-1.493933, 0.7491807, 0.689471, 1, 0.4901961, 0, 1,
-1.492372, 0.8479537, -1.500176, 1, 0.4980392, 0, 1,
-1.489078, 0.8927164, -2.638269, 1, 0.5058824, 0, 1,
-1.478923, 1.555645, -0.4440105, 1, 0.509804, 0, 1,
-1.47504, -0.5135997, -3.49229, 1, 0.5176471, 0, 1,
-1.454767, 0.4076263, -1.103545, 1, 0.5215687, 0, 1,
-1.452542, 0.08257991, -1.524624, 1, 0.5294118, 0, 1,
-1.449845, 0.001864506, -1.321185, 1, 0.5333334, 0, 1,
-1.437091, -1.004426, -2.128665, 1, 0.5411765, 0, 1,
-1.433845, 0.4547859, -0.8632053, 1, 0.5450981, 0, 1,
-1.433512, -1.363918, -2.652587, 1, 0.5529412, 0, 1,
-1.429307, -2.917427, -2.726793, 1, 0.5568628, 0, 1,
-1.419337, 1.034918, 1.495565, 1, 0.5647059, 0, 1,
-1.4148, -3.066909, -3.736152, 1, 0.5686275, 0, 1,
-1.413076, 1.404513, -0.4008312, 1, 0.5764706, 0, 1,
-1.409225, -0.9493181, -3.309876, 1, 0.5803922, 0, 1,
-1.405269, -1.863049, -0.4502934, 1, 0.5882353, 0, 1,
-1.400789, -1.039499, -3.219136, 1, 0.5921569, 0, 1,
-1.383384, 0.08977284, -2.242153, 1, 0.6, 0, 1,
-1.371319, 0.2773171, -1.197245, 1, 0.6078432, 0, 1,
-1.366381, 0.162964, -2.716875, 1, 0.6117647, 0, 1,
-1.365636, 1.080346, -0.6201889, 1, 0.6196079, 0, 1,
-1.365266, 0.3622536, -1.279267, 1, 0.6235294, 0, 1,
-1.319498, -0.02464511, -2.639998, 1, 0.6313726, 0, 1,
-1.299537, 0.0759747, -0.926089, 1, 0.6352941, 0, 1,
-1.285676, -1.341854, -1.369323, 1, 0.6431373, 0, 1,
-1.274372, 0.9129134, -1.509313, 1, 0.6470588, 0, 1,
-1.273856, -1.253495, -2.80821, 1, 0.654902, 0, 1,
-1.257717, -0.2611331, -2.069952, 1, 0.6588235, 0, 1,
-1.256456, -1.365886, -2.239306, 1, 0.6666667, 0, 1,
-1.246997, 2.427571, -0.6994345, 1, 0.6705883, 0, 1,
-1.24083, -1.534737, -2.366854, 1, 0.6784314, 0, 1,
-1.224188, -1.557613, -2.085371, 1, 0.682353, 0, 1,
-1.219708, 0.6249035, -0.001518651, 1, 0.6901961, 0, 1,
-1.218396, 1.254512, -1.596571, 1, 0.6941177, 0, 1,
-1.216618, 0.3654045, 0.4566539, 1, 0.7019608, 0, 1,
-1.200165, 0.1897754, -0.5509406, 1, 0.7098039, 0, 1,
-1.194801, -0.6579529, -2.681717, 1, 0.7137255, 0, 1,
-1.188425, -0.4550007, -0.5458795, 1, 0.7215686, 0, 1,
-1.18748, 2.133318, 0.05696901, 1, 0.7254902, 0, 1,
-1.187139, 0.9732975, 0.3997043, 1, 0.7333333, 0, 1,
-1.185459, 0.410132, -1.288595, 1, 0.7372549, 0, 1,
-1.184341, 0.878239, -1.303329, 1, 0.7450981, 0, 1,
-1.181823, 0.05467457, -0.4085011, 1, 0.7490196, 0, 1,
-1.177204, -0.4793079, -1.628935, 1, 0.7568628, 0, 1,
-1.17235, -0.5805889, -0.5900144, 1, 0.7607843, 0, 1,
-1.170383, -0.6258369, -3.939432, 1, 0.7686275, 0, 1,
-1.17016, -0.5593001, 0.1686624, 1, 0.772549, 0, 1,
-1.159536, 0.0695862, -1.998945, 1, 0.7803922, 0, 1,
-1.159509, -0.2883797, -2.174848, 1, 0.7843137, 0, 1,
-1.159491, 1.295426, 0.662805, 1, 0.7921569, 0, 1,
-1.159088, 0.3346841, -2.279031, 1, 0.7960784, 0, 1,
-1.157977, 0.2537489, -0.3395821, 1, 0.8039216, 0, 1,
-1.152893, -1.124051, -2.76717, 1, 0.8117647, 0, 1,
-1.152343, -0.4742431, -1.949146, 1, 0.8156863, 0, 1,
-1.151638, -0.5454647, -2.450217, 1, 0.8235294, 0, 1,
-1.147301, 0.4399425, -1.247984, 1, 0.827451, 0, 1,
-1.146378, -0.5398803, -2.587758, 1, 0.8352941, 0, 1,
-1.128846, -1.318892, -2.988297, 1, 0.8392157, 0, 1,
-1.125515, -1.092493, -3.671809, 1, 0.8470588, 0, 1,
-1.124387, 1.424377, -0.5006025, 1, 0.8509804, 0, 1,
-1.12064, 0.5054466, -1.421279, 1, 0.8588235, 0, 1,
-1.100923, 1.31802, -3.554389, 1, 0.8627451, 0, 1,
-1.100081, -0.2533039, -2.050559, 1, 0.8705882, 0, 1,
-1.09846, -0.2433003, -0.8756638, 1, 0.8745098, 0, 1,
-1.094255, 0.7849072, 0.8486073, 1, 0.8823529, 0, 1,
-1.085273, -0.3311301, -0.4822, 1, 0.8862745, 0, 1,
-1.068558, -2.412013, -1.523507, 1, 0.8941177, 0, 1,
-1.064099, -0.501368, -0.7624695, 1, 0.8980392, 0, 1,
-1.057923, -2.013258, -3.627157, 1, 0.9058824, 0, 1,
-1.054382, -0.2210422, -2.153983, 1, 0.9137255, 0, 1,
-1.051264, 0.3778706, -2.682555, 1, 0.9176471, 0, 1,
-1.049945, -0.4372344, -0.7969378, 1, 0.9254902, 0, 1,
-1.045821, 0.2754985, -0.1856284, 1, 0.9294118, 0, 1,
-1.044881, 0.405893, -1.739976, 1, 0.9372549, 0, 1,
-1.037388, -0.8597339, -3.574414, 1, 0.9411765, 0, 1,
-1.033852, -0.1581215, -0.9328697, 1, 0.9490196, 0, 1,
-1.032148, 0.2714102, -1.636529, 1, 0.9529412, 0, 1,
-1.032069, -0.4138916, -2.356789, 1, 0.9607843, 0, 1,
-1.018363, -0.1061727, -3.244968, 1, 0.9647059, 0, 1,
-1.017831, 0.8705725, -0.1401466, 1, 0.972549, 0, 1,
-1.01169, -0.3297971, -1.666777, 1, 0.9764706, 0, 1,
-1.001642, 0.9600384, -0.1305571, 1, 0.9843137, 0, 1,
-1.000533, 0.5678653, -0.2802042, 1, 0.9882353, 0, 1,
-0.9867956, 1.566829, -1.517577, 1, 0.9960784, 0, 1,
-0.9864858, -0.05164164, -1.685463, 0.9960784, 1, 0, 1,
-0.9806272, -0.1956673, -3.375261, 0.9921569, 1, 0, 1,
-0.9701956, 0.5797845, -2.595224, 0.9843137, 1, 0, 1,
-0.9681696, 1.267312, -0.07075037, 0.9803922, 1, 0, 1,
-0.9656709, 0.9230189, -2.081364, 0.972549, 1, 0, 1,
-0.9637634, -0.8447856, -3.539109, 0.9686275, 1, 0, 1,
-0.9633769, -0.9657528, -2.303862, 0.9607843, 1, 0, 1,
-0.9574227, 0.7388778, -1.376196, 0.9568627, 1, 0, 1,
-0.9573283, 0.2245313, -2.076583, 0.9490196, 1, 0, 1,
-0.9572565, 1.037271, -0.3395102, 0.945098, 1, 0, 1,
-0.9363576, 0.08498883, -1.466487, 0.9372549, 1, 0, 1,
-0.9242728, 0.2002458, -1.343603, 0.9333333, 1, 0, 1,
-0.9195533, 0.2386968, -1.964411, 0.9254902, 1, 0, 1,
-0.9084783, 0.4898121, -3.289588, 0.9215686, 1, 0, 1,
-0.9066289, -0.1775589, -1.407796, 0.9137255, 1, 0, 1,
-0.9049944, 1.105795, -2.187831, 0.9098039, 1, 0, 1,
-0.9048877, -0.41973, -3.028389, 0.9019608, 1, 0, 1,
-0.9044579, 0.1141111, -0.3948747, 0.8941177, 1, 0, 1,
-0.9033076, -0.3752507, -1.445887, 0.8901961, 1, 0, 1,
-0.897074, -0.6200966, -2.347007, 0.8823529, 1, 0, 1,
-0.8955366, 0.01464582, -0.6868451, 0.8784314, 1, 0, 1,
-0.8857562, -1.628899, -2.254746, 0.8705882, 1, 0, 1,
-0.8848897, -0.3847512, -1.956524, 0.8666667, 1, 0, 1,
-0.8840026, 0.7617884, 0.3044767, 0.8588235, 1, 0, 1,
-0.877821, -0.2176208, -0.613323, 0.854902, 1, 0, 1,
-0.8776369, 0.9809769, 0.08473808, 0.8470588, 1, 0, 1,
-0.8715235, -2.47365, -1.565001, 0.8431373, 1, 0, 1,
-0.8658551, -0.1623149, -0.3654609, 0.8352941, 1, 0, 1,
-0.8561897, -0.8621507, -2.180345, 0.8313726, 1, 0, 1,
-0.8538418, 0.1946136, -0.5120327, 0.8235294, 1, 0, 1,
-0.8500712, 0.3310973, 0.333483, 0.8196079, 1, 0, 1,
-0.8331266, 0.3028273, -0.26108, 0.8117647, 1, 0, 1,
-0.8330094, -1.020801, 0.05632389, 0.8078431, 1, 0, 1,
-0.8278502, 0.4397028, -2.523253, 0.8, 1, 0, 1,
-0.8225981, -0.4503032, -2.644612, 0.7921569, 1, 0, 1,
-0.8181794, -0.1482757, -1.013008, 0.7882353, 1, 0, 1,
-0.8092614, 0.1965709, -1.115065, 0.7803922, 1, 0, 1,
-0.8074063, -0.3250804, -1.931744, 0.7764706, 1, 0, 1,
-0.7945144, 0.1820997, -1.532108, 0.7686275, 1, 0, 1,
-0.7940906, -1.129873, -2.135744, 0.7647059, 1, 0, 1,
-0.7924149, -1.46366, -3.413362, 0.7568628, 1, 0, 1,
-0.7917292, 0.6768703, -0.4249392, 0.7529412, 1, 0, 1,
-0.7901234, -0.9725165, -0.2940843, 0.7450981, 1, 0, 1,
-0.7832695, 0.9017738, 0.1131887, 0.7411765, 1, 0, 1,
-0.7824211, -1.05405, -3.868964, 0.7333333, 1, 0, 1,
-0.7796863, -0.2071822, -2.900534, 0.7294118, 1, 0, 1,
-0.7796273, -0.1883198, 0.199115, 0.7215686, 1, 0, 1,
-0.7730674, -0.8348603, -1.883794, 0.7176471, 1, 0, 1,
-0.7684024, -0.6863831, -2.309167, 0.7098039, 1, 0, 1,
-0.7655356, 0.6626256, -0.6434075, 0.7058824, 1, 0, 1,
-0.7592813, 1.410588, 0.1812029, 0.6980392, 1, 0, 1,
-0.7580636, -0.1089537, -0.4625852, 0.6901961, 1, 0, 1,
-0.7473686, 1.30735, -3.080998, 0.6862745, 1, 0, 1,
-0.7350346, -0.5759717, -4.203887, 0.6784314, 1, 0, 1,
-0.7350131, 0.1523191, -1.941561, 0.6745098, 1, 0, 1,
-0.7333641, -0.4297914, -1.524414, 0.6666667, 1, 0, 1,
-0.7278557, -0.110721, -1.735821, 0.6627451, 1, 0, 1,
-0.7251147, -0.5222457, -2.213424, 0.654902, 1, 0, 1,
-0.7149346, 0.7818533, -1.567617, 0.6509804, 1, 0, 1,
-0.712799, -0.2803975, -2.877604, 0.6431373, 1, 0, 1,
-0.698523, -0.8682076, -1.766854, 0.6392157, 1, 0, 1,
-0.697625, -1.050588, -2.173042, 0.6313726, 1, 0, 1,
-0.6887397, -0.4171326, -2.08283, 0.627451, 1, 0, 1,
-0.6854564, -1.380419, -3.008731, 0.6196079, 1, 0, 1,
-0.6853092, -0.3176413, -0.07975718, 0.6156863, 1, 0, 1,
-0.6836476, -0.5696108, -3.77059, 0.6078432, 1, 0, 1,
-0.6828705, 0.5483984, -1.094782, 0.6039216, 1, 0, 1,
-0.6802146, -0.1287258, 0.4402752, 0.5960785, 1, 0, 1,
-0.6801383, -0.9232179, -1.338706, 0.5882353, 1, 0, 1,
-0.6781762, 0.7748034, -1.984097, 0.5843138, 1, 0, 1,
-0.6764262, 0.9181811, -2.055296, 0.5764706, 1, 0, 1,
-0.6664571, 0.6681747, -2.646673, 0.572549, 1, 0, 1,
-0.664468, -0.7719314, -3.636938, 0.5647059, 1, 0, 1,
-0.6639137, -0.3962567, -2.322706, 0.5607843, 1, 0, 1,
-0.6614509, 1.219971, -0.7640498, 0.5529412, 1, 0, 1,
-0.6606376, -1.455334, -2.471941, 0.5490196, 1, 0, 1,
-0.6597235, -1.872882, -2.462059, 0.5411765, 1, 0, 1,
-0.6583731, -0.6715646, -3.208332, 0.5372549, 1, 0, 1,
-0.6497663, -1.26324, -3.282717, 0.5294118, 1, 0, 1,
-0.6490936, 0.8478277, -1.861357, 0.5254902, 1, 0, 1,
-0.6456081, -1.536792, -3.090717, 0.5176471, 1, 0, 1,
-0.64166, 1.670865, 0.46415, 0.5137255, 1, 0, 1,
-0.6355499, 0.9998764, -0.396135, 0.5058824, 1, 0, 1,
-0.6316637, -1.015001, -2.926821, 0.5019608, 1, 0, 1,
-0.6304458, 0.3034495, -1.306428, 0.4941176, 1, 0, 1,
-0.6285756, -0.2114708, -2.475523, 0.4862745, 1, 0, 1,
-0.6202525, 0.8753082, 0.2184093, 0.4823529, 1, 0, 1,
-0.6148453, 0.4418906, 0.2416084, 0.4745098, 1, 0, 1,
-0.6145358, -0.7228917, -2.896459, 0.4705882, 1, 0, 1,
-0.6138031, 0.4427508, -0.4480936, 0.4627451, 1, 0, 1,
-0.6093956, 0.3578313, -0.6216701, 0.4588235, 1, 0, 1,
-0.6049342, 0.4264465, -0.9359872, 0.4509804, 1, 0, 1,
-0.5999911, 2.705517, -2.056133, 0.4470588, 1, 0, 1,
-0.59981, -0.6313425, -1.360901, 0.4392157, 1, 0, 1,
-0.5954393, 0.6727508, 0.1797193, 0.4352941, 1, 0, 1,
-0.5948833, 0.03293398, 1.050338, 0.427451, 1, 0, 1,
-0.5946418, 0.1465038, -0.1610698, 0.4235294, 1, 0, 1,
-0.5929688, 2.855799, -1.547963, 0.4156863, 1, 0, 1,
-0.592245, 0.08602739, -2.316135, 0.4117647, 1, 0, 1,
-0.5784672, 0.9305505, -0.1041074, 0.4039216, 1, 0, 1,
-0.5750393, 1.023731, -0.9714642, 0.3960784, 1, 0, 1,
-0.5702742, 0.5494462, -1.473253, 0.3921569, 1, 0, 1,
-0.5673198, 0.1791588, -1.087187, 0.3843137, 1, 0, 1,
-0.5664832, 1.485583, 1.126814, 0.3803922, 1, 0, 1,
-0.5644151, -0.9522209, -1.527087, 0.372549, 1, 0, 1,
-0.5631751, -1.876917, -3.391893, 0.3686275, 1, 0, 1,
-0.5612402, 0.33766, -1.46136, 0.3607843, 1, 0, 1,
-0.5605847, -1.042051, -2.219039, 0.3568628, 1, 0, 1,
-0.5566775, 0.3567054, -1.337867, 0.3490196, 1, 0, 1,
-0.5555334, -0.9390011, -3.676287, 0.345098, 1, 0, 1,
-0.5552472, -0.5396282, -3.652333, 0.3372549, 1, 0, 1,
-0.551868, 0.04059529, -2.684101, 0.3333333, 1, 0, 1,
-0.5481057, -0.1817231, -0.5876122, 0.3254902, 1, 0, 1,
-0.546434, -0.2067776, -3.37347, 0.3215686, 1, 0, 1,
-0.5431123, -2.316187, -5.811965, 0.3137255, 1, 0, 1,
-0.5403183, -0.4168652, -4.035102, 0.3098039, 1, 0, 1,
-0.5344588, 0.08235409, -0.8966641, 0.3019608, 1, 0, 1,
-0.5326803, -1.650734, -1.557275, 0.2941177, 1, 0, 1,
-0.5322072, 1.515263, -1.365295, 0.2901961, 1, 0, 1,
-0.5272757, 1.255059, 2.076716, 0.282353, 1, 0, 1,
-0.5272742, 0.08087698, -2.309073, 0.2784314, 1, 0, 1,
-0.5269023, -0.9302439, -1.797583, 0.2705882, 1, 0, 1,
-0.5245935, 0.5428336, 0.9382442, 0.2666667, 1, 0, 1,
-0.523285, -0.3736171, -2.320821, 0.2588235, 1, 0, 1,
-0.5188754, -0.01268525, -1.460465, 0.254902, 1, 0, 1,
-0.5156471, -2.429623, -3.426121, 0.2470588, 1, 0, 1,
-0.5147972, 0.1829568, -0.7958747, 0.2431373, 1, 0, 1,
-0.5138615, 0.1729776, -0.6448151, 0.2352941, 1, 0, 1,
-0.5070057, -1.029983, -2.520274, 0.2313726, 1, 0, 1,
-0.5067275, 0.2241656, -0.04513927, 0.2235294, 1, 0, 1,
-0.5054504, -0.6254698, -2.498162, 0.2196078, 1, 0, 1,
-0.5018927, 1.618595, -0.4082916, 0.2117647, 1, 0, 1,
-0.4966947, -0.009644686, -0.4962535, 0.2078431, 1, 0, 1,
-0.4945203, 0.4991397, -0.6048414, 0.2, 1, 0, 1,
-0.4926828, -0.02813534, -3.666393, 0.1921569, 1, 0, 1,
-0.4872569, -0.6213558, -2.621743, 0.1882353, 1, 0, 1,
-0.4834509, 0.3257065, -0.1274537, 0.1803922, 1, 0, 1,
-0.4824903, 1.181457, 0.2118121, 0.1764706, 1, 0, 1,
-0.4817795, -1.487552, -3.811733, 0.1686275, 1, 0, 1,
-0.4816683, -0.5543495, -1.469532, 0.1647059, 1, 0, 1,
-0.4787456, 0.03797666, -2.112038, 0.1568628, 1, 0, 1,
-0.4783699, -0.1899483, -1.559186, 0.1529412, 1, 0, 1,
-0.4693275, -1.056499, -3.294546, 0.145098, 1, 0, 1,
-0.4686699, -0.03371477, -2.561069, 0.1411765, 1, 0, 1,
-0.466772, 0.163343, 0.03671473, 0.1333333, 1, 0, 1,
-0.4645702, 0.7740335, -0.5578301, 0.1294118, 1, 0, 1,
-0.4629043, -1.74708, -2.261403, 0.1215686, 1, 0, 1,
-0.4536346, -0.2258523, -1.668818, 0.1176471, 1, 0, 1,
-0.4518082, -0.2887658, -1.614764, 0.1098039, 1, 0, 1,
-0.4503107, -0.4326986, -0.9525622, 0.1058824, 1, 0, 1,
-0.4472458, 1.995771, 0.4089968, 0.09803922, 1, 0, 1,
-0.4454593, -0.7789756, -1.574669, 0.09019608, 1, 0, 1,
-0.4440556, -1.038002, -2.236036, 0.08627451, 1, 0, 1,
-0.4413613, -1.064532, -0.7835156, 0.07843138, 1, 0, 1,
-0.4344393, -0.3289623, -0.9607761, 0.07450981, 1, 0, 1,
-0.4320818, -0.07939231, -2.159984, 0.06666667, 1, 0, 1,
-0.4201691, -1.593683, -3.799906, 0.0627451, 1, 0, 1,
-0.4163246, 0.08831602, -2.430846, 0.05490196, 1, 0, 1,
-0.4151022, 0.2882213, -1.271942, 0.05098039, 1, 0, 1,
-0.4128521, -0.8461668, -3.357233, 0.04313726, 1, 0, 1,
-0.4106222, -1.91113, -2.887527, 0.03921569, 1, 0, 1,
-0.4021705, 0.2744538, -1.377893, 0.03137255, 1, 0, 1,
-0.4014627, -0.2963673, -2.076936, 0.02745098, 1, 0, 1,
-0.400884, 0.8984598, -0.04089471, 0.01960784, 1, 0, 1,
-0.399578, 1.561672, -0.1499228, 0.01568628, 1, 0, 1,
-0.397975, -1.243604, -2.854785, 0.007843138, 1, 0, 1,
-0.3926124, -0.2950763, -2.313293, 0.003921569, 1, 0, 1,
-0.3883682, -0.6990652, -2.654183, 0, 1, 0.003921569, 1,
-0.3875078, 1.115876, -0.1941978, 0, 1, 0.01176471, 1,
-0.3869221, -0.9696409, -2.548476, 0, 1, 0.01568628, 1,
-0.3852818, -0.5432476, -1.879047, 0, 1, 0.02352941, 1,
-0.3845209, -0.7250762, -2.369557, 0, 1, 0.02745098, 1,
-0.3841139, 0.7983241, -0.9712815, 0, 1, 0.03529412, 1,
-0.3810831, -1.317929, -1.264984, 0, 1, 0.03921569, 1,
-0.3792111, -0.02572254, 0.123787, 0, 1, 0.04705882, 1,
-0.3781098, -0.3259987, -1.929836, 0, 1, 0.05098039, 1,
-0.3745271, -0.4681493, -2.69705, 0, 1, 0.05882353, 1,
-0.3737311, 0.1349854, -1.241538, 0, 1, 0.0627451, 1,
-0.3728465, 0.0635548, -1.923356, 0, 1, 0.07058824, 1,
-0.3700582, -0.8651925, -1.754168, 0, 1, 0.07450981, 1,
-0.3676525, 1.822733, 0.2395813, 0, 1, 0.08235294, 1,
-0.367071, 0.6570246, -0.7281276, 0, 1, 0.08627451, 1,
-0.3650197, 0.3378512, -0.593228, 0, 1, 0.09411765, 1,
-0.3638796, -0.1298757, -3.017429, 0, 1, 0.1019608, 1,
-0.3636543, -2.746571, -1.48121, 0, 1, 0.1058824, 1,
-0.3631704, -0.529525, -2.795786, 0, 1, 0.1137255, 1,
-0.359637, -0.06539712, -2.098164, 0, 1, 0.1176471, 1,
-0.3545666, -0.8768802, -2.76187, 0, 1, 0.1254902, 1,
-0.3490916, 1.369851, -0.5810745, 0, 1, 0.1294118, 1,
-0.3482989, 0.6044395, -1.081167, 0, 1, 0.1372549, 1,
-0.3443887, 0.2991226, -0.08317059, 0, 1, 0.1411765, 1,
-0.3436851, -0.989006, -3.423581, 0, 1, 0.1490196, 1,
-0.342973, -0.2987987, -2.085262, 0, 1, 0.1529412, 1,
-0.340316, -0.0193677, -1.340539, 0, 1, 0.1607843, 1,
-0.3382682, -1.180811, -2.768841, 0, 1, 0.1647059, 1,
-0.3343439, 0.9409738, 0.04320522, 0, 1, 0.172549, 1,
-0.3302773, -1.398266, -2.131179, 0, 1, 0.1764706, 1,
-0.3277181, -1.998747, -2.735772, 0, 1, 0.1843137, 1,
-0.3220184, -1.893825, -3.621802, 0, 1, 0.1882353, 1,
-0.3212305, 0.8181893, 0.2003996, 0, 1, 0.1960784, 1,
-0.3200888, 0.5162628, -0.5453689, 0, 1, 0.2039216, 1,
-0.3193044, -1.284744, -4.290705, 0, 1, 0.2078431, 1,
-0.3191551, -0.06575928, -1.30905, 0, 1, 0.2156863, 1,
-0.3128861, 0.9108112, 1.298337, 0, 1, 0.2196078, 1,
-0.311893, 0.683788, -1.220361, 0, 1, 0.227451, 1,
-0.3107517, 0.7653499, -0.7083702, 0, 1, 0.2313726, 1,
-0.3101921, 0.4220754, -0.2084573, 0, 1, 0.2392157, 1,
-0.307291, 2.089823, 1.010256, 0, 1, 0.2431373, 1,
-0.3021727, -0.4186679, -2.528697, 0, 1, 0.2509804, 1,
-0.3020223, -0.6583185, -4.019325, 0, 1, 0.254902, 1,
-0.2949081, 0.5161989, 0.07676408, 0, 1, 0.2627451, 1,
-0.2943283, -1.284458, -4.163106, 0, 1, 0.2666667, 1,
-0.2942894, -1.510997, -3.525, 0, 1, 0.2745098, 1,
-0.2939707, -1.756392, -2.957249, 0, 1, 0.2784314, 1,
-0.2914893, -0.2531885, -1.950878, 0, 1, 0.2862745, 1,
-0.2902567, -0.9853069, -4.824594, 0, 1, 0.2901961, 1,
-0.2898575, 1.447789, -0.5798187, 0, 1, 0.2980392, 1,
-0.2825774, -0.8474921, -3.449567, 0, 1, 0.3058824, 1,
-0.2746533, 0.1924988, 0.3858694, 0, 1, 0.3098039, 1,
-0.2743884, -0.01580406, -1.844391, 0, 1, 0.3176471, 1,
-0.273752, -0.9020797, -1.868649, 0, 1, 0.3215686, 1,
-0.2695235, -0.3756015, -2.444056, 0, 1, 0.3294118, 1,
-0.2680995, -0.4943869, -2.446249, 0, 1, 0.3333333, 1,
-0.2588666, -0.3219998, -3.664842, 0, 1, 0.3411765, 1,
-0.2558968, -1.23919, -4.575049, 0, 1, 0.345098, 1,
-0.2553895, 0.3507136, -0.6950823, 0, 1, 0.3529412, 1,
-0.2483927, -1.110683, -3.374496, 0, 1, 0.3568628, 1,
-0.2483188, -0.7405271, -3.318769, 0, 1, 0.3647059, 1,
-0.2424333, 1.300243, 0.5298203, 0, 1, 0.3686275, 1,
-0.2383919, -0.5348583, -2.134885, 0, 1, 0.3764706, 1,
-0.2353639, 0.8913985, -1.013803, 0, 1, 0.3803922, 1,
-0.2343211, 0.5882995, -2.270967, 0, 1, 0.3882353, 1,
-0.2343001, 1.505314, -0.4793907, 0, 1, 0.3921569, 1,
-0.2323819, 0.9212409, 1.419271, 0, 1, 0.4, 1,
-0.2317303, -0.5351437, -1.613299, 0, 1, 0.4078431, 1,
-0.2282967, 0.06202512, -0.6765824, 0, 1, 0.4117647, 1,
-0.2260638, 0.455117, -1.929952, 0, 1, 0.4196078, 1,
-0.2161538, 0.42091, -0.2503278, 0, 1, 0.4235294, 1,
-0.2143563, 1.160081, -0.4718055, 0, 1, 0.4313726, 1,
-0.2136539, -0.2464213, -3.464313, 0, 1, 0.4352941, 1,
-0.2129624, 0.3298633, -0.9187788, 0, 1, 0.4431373, 1,
-0.2100453, -2.441032, -1.861797, 0, 1, 0.4470588, 1,
-0.2078228, -0.5768984, -3.70975, 0, 1, 0.454902, 1,
-0.1961494, 0.09533567, -1.617372, 0, 1, 0.4588235, 1,
-0.1953751, 0.7293416, -1.153484, 0, 1, 0.4666667, 1,
-0.1945168, -2.605967, -2.617727, 0, 1, 0.4705882, 1,
-0.1935453, 0.5212791, 0.6708558, 0, 1, 0.4784314, 1,
-0.1898133, 0.1428876, 0.1211926, 0, 1, 0.4823529, 1,
-0.1861176, 0.3420975, 0.3859279, 0, 1, 0.4901961, 1,
-0.1836185, 0.585063, -0.4957052, 0, 1, 0.4941176, 1,
-0.1788594, 0.1678695, -0.8550907, 0, 1, 0.5019608, 1,
-0.1779705, 0.8073174, -0.3304221, 0, 1, 0.509804, 1,
-0.1738178, -0.7982295, -4.769948, 0, 1, 0.5137255, 1,
-0.1730745, 0.8906775, 1.285801, 0, 1, 0.5215687, 1,
-0.171562, -0.4188998, -0.9967698, 0, 1, 0.5254902, 1,
-0.17065, -0.9763809, -3.257323, 0, 1, 0.5333334, 1,
-0.1651207, -0.2002601, -2.63492, 0, 1, 0.5372549, 1,
-0.1642432, 1.028962, -0.9869394, 0, 1, 0.5450981, 1,
-0.1631734, 1.186704, -1.209789, 0, 1, 0.5490196, 1,
-0.1478729, 0.1033668, -1.004547, 0, 1, 0.5568628, 1,
-0.144953, 0.6283247, -0.4499583, 0, 1, 0.5607843, 1,
-0.1438677, -0.6938667, -4.376227, 0, 1, 0.5686275, 1,
-0.1422877, -1.52091, -3.738139, 0, 1, 0.572549, 1,
-0.1402568, 0.08041695, -1.759401, 0, 1, 0.5803922, 1,
-0.1361642, 1.495923, -0.1567412, 0, 1, 0.5843138, 1,
-0.1336079, 2.454442, -1.443004, 0, 1, 0.5921569, 1,
-0.1325442, -0.5866705, -3.498549, 0, 1, 0.5960785, 1,
-0.1320894, 2.014107, 0.16523, 0, 1, 0.6039216, 1,
-0.129511, 0.3093742, -0.6138023, 0, 1, 0.6117647, 1,
-0.1294325, -0.9946097, -3.814626, 0, 1, 0.6156863, 1,
-0.1264648, 0.484345, -0.7433913, 0, 1, 0.6235294, 1,
-0.1225992, 0.3032325, 0.1325614, 0, 1, 0.627451, 1,
-0.1214327, -2.174118, -3.506831, 0, 1, 0.6352941, 1,
-0.1212166, 0.5276927, -0.8071615, 0, 1, 0.6392157, 1,
-0.1208332, 0.6957571, -0.3332655, 0, 1, 0.6470588, 1,
-0.1190198, -0.7438915, -2.019772, 0, 1, 0.6509804, 1,
-0.1152796, -0.8155307, -1.341688, 0, 1, 0.6588235, 1,
-0.1144299, -0.7607278, -2.287234, 0, 1, 0.6627451, 1,
-0.1079362, -0.401713, -3.060631, 0, 1, 0.6705883, 1,
-0.1044983, -1.297253, -3.529, 0, 1, 0.6745098, 1,
-0.1035173, -0.686549, -1.964216, 0, 1, 0.682353, 1,
-0.1006452, 0.6740493, -0.3477475, 0, 1, 0.6862745, 1,
-0.0985224, -0.2415544, -1.820745, 0, 1, 0.6941177, 1,
-0.09577087, -1.434683, -2.434047, 0, 1, 0.7019608, 1,
-0.09220547, 0.7356189, -1.136863, 0, 1, 0.7058824, 1,
-0.0921581, 1.459166, -1.257524, 0, 1, 0.7137255, 1,
-0.09088281, -0.3912145, -1.145349, 0, 1, 0.7176471, 1,
-0.09015671, 0.6237953, -3.08087, 0, 1, 0.7254902, 1,
-0.09010649, -0.4593838, -2.465994, 0, 1, 0.7294118, 1,
-0.08837702, 0.4945891, -0.3627708, 0, 1, 0.7372549, 1,
-0.08675554, 0.07248619, -3.054595, 0, 1, 0.7411765, 1,
-0.08587969, -0.338086, -1.953858, 0, 1, 0.7490196, 1,
-0.07896191, 0.509989, -0.7870417, 0, 1, 0.7529412, 1,
-0.07762183, -2.118847, -0.6768112, 0, 1, 0.7607843, 1,
-0.07630225, 1.289527, 0.4692401, 0, 1, 0.7647059, 1,
-0.06156261, -0.8436956, -3.737016, 0, 1, 0.772549, 1,
-0.0562772, -0.2673235, -3.259465, 0, 1, 0.7764706, 1,
-0.05490722, -1.385369, -3.891874, 0, 1, 0.7843137, 1,
-0.05447925, 0.2509529, -1.867094, 0, 1, 0.7882353, 1,
-0.0541544, 0.969192, -0.4678949, 0, 1, 0.7960784, 1,
-0.05185669, -0.9871826, -3.190235, 0, 1, 0.8039216, 1,
-0.05047328, -0.4683825, -3.588857, 0, 1, 0.8078431, 1,
-0.04888583, -1.664847, -2.69277, 0, 1, 0.8156863, 1,
-0.04420623, 0.8877715, -0.5530764, 0, 1, 0.8196079, 1,
-0.04253277, -0.2363936, -5.362341, 0, 1, 0.827451, 1,
-0.0400716, 0.04014635, 1.269312, 0, 1, 0.8313726, 1,
-0.03881407, -1.471099, -3.462398, 0, 1, 0.8392157, 1,
-0.03237412, 1.101647, 0.5935401, 0, 1, 0.8431373, 1,
-0.02988989, -0.8713735, -1.73995, 0, 1, 0.8509804, 1,
-0.0289426, 1.236469, -0.9725758, 0, 1, 0.854902, 1,
-0.02774733, 0.11345, -0.9815891, 0, 1, 0.8627451, 1,
-0.02614257, -1.245942, -3.653096, 0, 1, 0.8666667, 1,
-0.02460226, 0.6811662, 0.614532, 0, 1, 0.8745098, 1,
-0.01682171, -1.175052, -1.636065, 0, 1, 0.8784314, 1,
-0.01655648, -1.032901, -2.896558, 0, 1, 0.8862745, 1,
-0.009683727, 0.1198404, -1.090143, 0, 1, 0.8901961, 1,
-0.004632408, 0.6280241, -1.06566, 0, 1, 0.8980392, 1,
-0.002643177, 1.409423, 0.04609361, 0, 1, 0.9058824, 1,
-0.001127457, 0.12221, -0.002809936, 0, 1, 0.9098039, 1,
0.001207304, -2.517117, 3.712189, 0, 1, 0.9176471, 1,
0.003853244, 2.222254, -0.3337324, 0, 1, 0.9215686, 1,
0.00579993, -3.588613, 2.019113, 0, 1, 0.9294118, 1,
0.009426363, 0.1375925, -0.6557716, 0, 1, 0.9333333, 1,
0.01133533, 2.7472, 0.5523002, 0, 1, 0.9411765, 1,
0.01154085, -0.4023502, 2.909631, 0, 1, 0.945098, 1,
0.01388417, -1.173066, 3.780614, 0, 1, 0.9529412, 1,
0.01425411, 0.3719667, -0.6203763, 0, 1, 0.9568627, 1,
0.01533752, 2.348264, -0.4054579, 0, 1, 0.9647059, 1,
0.01920858, -0.2222537, 3.951851, 0, 1, 0.9686275, 1,
0.02331589, -0.7289563, 4.077155, 0, 1, 0.9764706, 1,
0.02511255, 0.9930977, 1.021521, 0, 1, 0.9803922, 1,
0.02642875, -1.04753, 3.315282, 0, 1, 0.9882353, 1,
0.02695657, 0.7631599, 1.386484, 0, 1, 0.9921569, 1,
0.0299815, 0.8092643, 1.03407, 0, 1, 1, 1,
0.03403302, 0.2519423, -0.3406864, 0, 0.9921569, 1, 1,
0.03436266, 2.539095, 0.495803, 0, 0.9882353, 1, 1,
0.03437031, -1.514459, 2.91821, 0, 0.9803922, 1, 1,
0.03685906, -0.6739076, 3.306468, 0, 0.9764706, 1, 1,
0.0401074, -0.001311585, 2.419089, 0, 0.9686275, 1, 1,
0.04378604, -0.1382446, 3.456063, 0, 0.9647059, 1, 1,
0.04587036, -0.4316571, 2.312228, 0, 0.9568627, 1, 1,
0.05098052, -0.03052284, 1.050578, 0, 0.9529412, 1, 1,
0.05296163, -0.6276478, 3.748247, 0, 0.945098, 1, 1,
0.05731662, 0.2596901, -0.001225857, 0, 0.9411765, 1, 1,
0.0598398, -0.6568264, 4.704894, 0, 0.9333333, 1, 1,
0.06121877, 2.379018, -0.4932452, 0, 0.9294118, 1, 1,
0.06348514, 0.5236279, -0.2640312, 0, 0.9215686, 1, 1,
0.06352904, -2.042844, 3.101803, 0, 0.9176471, 1, 1,
0.06388828, 0.704415, 0.2479801, 0, 0.9098039, 1, 1,
0.06405921, -0.4920161, 3.050359, 0, 0.9058824, 1, 1,
0.06821777, 0.4251384, -0.6680143, 0, 0.8980392, 1, 1,
0.06844774, 0.4193853, 0.3067668, 0, 0.8901961, 1, 1,
0.06853875, 1.356864, -2.771229, 0, 0.8862745, 1, 1,
0.0695839, 0.5671349, 0.4313583, 0, 0.8784314, 1, 1,
0.06976323, -0.196713, 2.718625, 0, 0.8745098, 1, 1,
0.07419793, -1.608002, 3.129958, 0, 0.8666667, 1, 1,
0.07966555, 0.7298886, 0.4978564, 0, 0.8627451, 1, 1,
0.08003246, 0.2310717, 0.7480553, 0, 0.854902, 1, 1,
0.08102053, -0.8888906, 3.304429, 0, 0.8509804, 1, 1,
0.08151986, -0.2817824, 3.874552, 0, 0.8431373, 1, 1,
0.08664428, 0.4827186, 0.6038883, 0, 0.8392157, 1, 1,
0.09168497, -1.413477, 3.903469, 0, 0.8313726, 1, 1,
0.09242305, -0.9496441, 1.860098, 0, 0.827451, 1, 1,
0.09406928, 0.04620751, 3.995378, 0, 0.8196079, 1, 1,
0.09593023, 1.323054, 1.755614, 0, 0.8156863, 1, 1,
0.09618544, 1.936681, -0.3424841, 0, 0.8078431, 1, 1,
0.09741204, 0.01100361, 1.511813, 0, 0.8039216, 1, 1,
0.09968299, 0.2994015, -0.4674006, 0, 0.7960784, 1, 1,
0.1022179, -1.935074, 4.606264, 0, 0.7882353, 1, 1,
0.1044887, -0.7143753, 3.145793, 0, 0.7843137, 1, 1,
0.1050354, -0.8607593, 1.244116, 0, 0.7764706, 1, 1,
0.1056569, 0.6013375, -0.2134382, 0, 0.772549, 1, 1,
0.1072495, 0.09977992, 0.400887, 0, 0.7647059, 1, 1,
0.1095653, 0.5280164, 2.153015, 0, 0.7607843, 1, 1,
0.1140524, 0.5490627, 1.678717, 0, 0.7529412, 1, 1,
0.1184496, 0.5938659, 1.795721, 0, 0.7490196, 1, 1,
0.1202815, 0.3648531, 0.8466915, 0, 0.7411765, 1, 1,
0.1250515, 0.3996695, 0.5409295, 0, 0.7372549, 1, 1,
0.1280599, -1.101861, 0.6933502, 0, 0.7294118, 1, 1,
0.1320282, -0.02692496, 2.416988, 0, 0.7254902, 1, 1,
0.1350356, -1.65549, 2.543288, 0, 0.7176471, 1, 1,
0.1359075, 0.2058008, 3.500086, 0, 0.7137255, 1, 1,
0.1373567, 0.7707251, -0.06719203, 0, 0.7058824, 1, 1,
0.138227, -0.6497234, 1.762767, 0, 0.6980392, 1, 1,
0.1402073, 1.786345, -1.745722, 0, 0.6941177, 1, 1,
0.143737, 0.6872384, 0.6432057, 0, 0.6862745, 1, 1,
0.1465989, 0.912909, -1.957125, 0, 0.682353, 1, 1,
0.1502526, -0.02451996, 1.710847, 0, 0.6745098, 1, 1,
0.1519696, 0.5939506, 1.634505, 0, 0.6705883, 1, 1,
0.156436, 0.606104, 1.332519, 0, 0.6627451, 1, 1,
0.1582913, -1.533017, 2.957106, 0, 0.6588235, 1, 1,
0.1585267, 0.7940452, -0.07566585, 0, 0.6509804, 1, 1,
0.1593576, 1.890363, 0.4834613, 0, 0.6470588, 1, 1,
0.1603479, 0.2612678, 0.4660111, 0, 0.6392157, 1, 1,
0.1609365, -0.340478, 2.524018, 0, 0.6352941, 1, 1,
0.1630416, 0.8407797, -0.8739071, 0, 0.627451, 1, 1,
0.1656669, -0.1561304, 1.613369, 0, 0.6235294, 1, 1,
0.1667214, -0.5912937, 2.897595, 0, 0.6156863, 1, 1,
0.167355, 2.054678, 0.5983669, 0, 0.6117647, 1, 1,
0.1702363, 1.749582, 0.2149357, 0, 0.6039216, 1, 1,
0.1730925, 1.053448, 0.4879249, 0, 0.5960785, 1, 1,
0.1731475, 0.8335647, -1.867701, 0, 0.5921569, 1, 1,
0.1736853, -1.155506, 2.871535, 0, 0.5843138, 1, 1,
0.1773611, -1.867587, 1.886488, 0, 0.5803922, 1, 1,
0.1776508, 1.653518, 0.9975386, 0, 0.572549, 1, 1,
0.180489, -0.3098042, 3.369062, 0, 0.5686275, 1, 1,
0.180951, -1.885845, 4.31019, 0, 0.5607843, 1, 1,
0.1827772, -0.7337742, 2.34235, 0, 0.5568628, 1, 1,
0.1851579, -0.216154, 1.032793, 0, 0.5490196, 1, 1,
0.1942373, -0.8386274, 4.406299, 0, 0.5450981, 1, 1,
0.1943902, 0.9980063, 0.01912604, 0, 0.5372549, 1, 1,
0.1971346, -2.47192, 4.519303, 0, 0.5333334, 1, 1,
0.2028394, 0.1666033, 0.4297613, 0, 0.5254902, 1, 1,
0.2050716, -0.3772149, 4.835155, 0, 0.5215687, 1, 1,
0.206889, 0.07057971, 2.100383, 0, 0.5137255, 1, 1,
0.2071266, -0.6627135, 1.796024, 0, 0.509804, 1, 1,
0.2071455, -0.64862, 1.779303, 0, 0.5019608, 1, 1,
0.2134557, -2.808379, 3.360575, 0, 0.4941176, 1, 1,
0.2153013, 2.433429, 0.6846704, 0, 0.4901961, 1, 1,
0.2197865, 0.9342499, -0.9255103, 0, 0.4823529, 1, 1,
0.2198451, -1.417353, 3.577917, 0, 0.4784314, 1, 1,
0.2206836, -1.139761, 2.043988, 0, 0.4705882, 1, 1,
0.2221344, -0.1510773, 0.4111875, 0, 0.4666667, 1, 1,
0.2235556, -0.3100351, 2.469157, 0, 0.4588235, 1, 1,
0.2362349, 0.9600369, -0.3489069, 0, 0.454902, 1, 1,
0.2381914, 0.4388313, 0.5061482, 0, 0.4470588, 1, 1,
0.2392371, 0.8389301, 0.2274291, 0, 0.4431373, 1, 1,
0.2394983, -1.593434, 4.428689, 0, 0.4352941, 1, 1,
0.2400395, 1.649728, 1.165016, 0, 0.4313726, 1, 1,
0.2408509, 0.6752752, 0.7436004, 0, 0.4235294, 1, 1,
0.2498552, -0.6592249, 3.132616, 0, 0.4196078, 1, 1,
0.2543231, 1.726915, 1.546252, 0, 0.4117647, 1, 1,
0.2561712, -0.0290509, 2.508239, 0, 0.4078431, 1, 1,
0.2565134, -0.9335367, 3.843288, 0, 0.4, 1, 1,
0.2610122, -1.234533, 2.806414, 0, 0.3921569, 1, 1,
0.2642748, -1.517286, 3.179962, 0, 0.3882353, 1, 1,
0.2674178, -1.488181, 5.098593, 0, 0.3803922, 1, 1,
0.2738831, 1.26316, 1.128744, 0, 0.3764706, 1, 1,
0.2769389, 0.9081095, -2.727282, 0, 0.3686275, 1, 1,
0.2790487, -0.8250711, 3.266017, 0, 0.3647059, 1, 1,
0.2838435, 0.06433064, 0.8038395, 0, 0.3568628, 1, 1,
0.2848191, -1.228511, 2.610984, 0, 0.3529412, 1, 1,
0.2860968, 0.3424965, -0.2904288, 0, 0.345098, 1, 1,
0.2897578, 0.6427348, 1.66671, 0, 0.3411765, 1, 1,
0.2930383, -0.8161306, 3.16242, 0, 0.3333333, 1, 1,
0.2942704, 0.5362588, 1.698361, 0, 0.3294118, 1, 1,
0.2967806, -0.5532086, 2.161417, 0, 0.3215686, 1, 1,
0.2996188, 0.8896071, 0.6275473, 0, 0.3176471, 1, 1,
0.3032518, -0.5520114, 3.708835, 0, 0.3098039, 1, 1,
0.3056329, 1.237302, 0.6175956, 0, 0.3058824, 1, 1,
0.3080559, 0.2183617, 1.664206, 0, 0.2980392, 1, 1,
0.3137331, -0.1553862, 3.069859, 0, 0.2901961, 1, 1,
0.3146498, -0.3597383, 2.480117, 0, 0.2862745, 1, 1,
0.314966, 0.9526241, -0.4344787, 0, 0.2784314, 1, 1,
0.320032, -0.06963214, 2.279891, 0, 0.2745098, 1, 1,
0.322275, -0.3859358, 3.64525, 0, 0.2666667, 1, 1,
0.3230017, -1.607458, 2.72733, 0, 0.2627451, 1, 1,
0.3352267, 1.449843, 1.761315, 0, 0.254902, 1, 1,
0.3366146, 1.045927, -0.07732463, 0, 0.2509804, 1, 1,
0.3389706, -0.4339097, 3.358337, 0, 0.2431373, 1, 1,
0.3402514, -2.304995, 4.042075, 0, 0.2392157, 1, 1,
0.3404094, -1.060057, 3.39195, 0, 0.2313726, 1, 1,
0.3409162, 0.1633729, 0.5960521, 0, 0.227451, 1, 1,
0.346858, -1.368085, 2.571137, 0, 0.2196078, 1, 1,
0.3472702, -0.3365697, 3.475141, 0, 0.2156863, 1, 1,
0.347636, 0.01880159, 0.9708573, 0, 0.2078431, 1, 1,
0.3537165, 0.8974925, 0.5633593, 0, 0.2039216, 1, 1,
0.3566453, -1.240899, 2.303054, 0, 0.1960784, 1, 1,
0.3581792, -1.663651, 2.693431, 0, 0.1882353, 1, 1,
0.3608797, -0.9685151, 2.500551, 0, 0.1843137, 1, 1,
0.3648766, -0.01241139, 4.85372, 0, 0.1764706, 1, 1,
0.3711532, 0.8268091, 0.03937725, 0, 0.172549, 1, 1,
0.3731374, -1.506607, 2.086698, 0, 0.1647059, 1, 1,
0.3741206, 0.124544, 0.743827, 0, 0.1607843, 1, 1,
0.3752123, -0.1679108, 3.127049, 0, 0.1529412, 1, 1,
0.3763127, -0.6877006, 1.024502, 0, 0.1490196, 1, 1,
0.3779274, -0.409033, 2.044039, 0, 0.1411765, 1, 1,
0.3820677, -1.405516, 1.606061, 0, 0.1372549, 1, 1,
0.3826792, 1.222768, 0.8950306, 0, 0.1294118, 1, 1,
0.38367, -1.115642, 3.18315, 0, 0.1254902, 1, 1,
0.384965, -1.781522, 2.839742, 0, 0.1176471, 1, 1,
0.3854056, 0.9427372, -0.02818409, 0, 0.1137255, 1, 1,
0.392019, 0.6793492, -1.118033, 0, 0.1058824, 1, 1,
0.3962876, 1.155348, 3.061343, 0, 0.09803922, 1, 1,
0.3997271, -1.902993, 3.929952, 0, 0.09411765, 1, 1,
0.4068415, -0.3173317, 1.170704, 0, 0.08627451, 1, 1,
0.4108079, 1.620148, -1.166073, 0, 0.08235294, 1, 1,
0.4115579, -0.1774277, 3.589628, 0, 0.07450981, 1, 1,
0.4135784, 0.1834071, 0.6508374, 0, 0.07058824, 1, 1,
0.416122, -0.8512539, -0.6121678, 0, 0.0627451, 1, 1,
0.4278711, 0.3312831, 0.8563886, 0, 0.05882353, 1, 1,
0.4354354, 0.1600616, 1.836067, 0, 0.05098039, 1, 1,
0.4441476, -0.1211113, 1.209018, 0, 0.04705882, 1, 1,
0.4470539, 0.6330178, 0.5757779, 0, 0.03921569, 1, 1,
0.448789, -0.007196194, 0.6956283, 0, 0.03529412, 1, 1,
0.4534955, -1.096929, 3.730597, 0, 0.02745098, 1, 1,
0.4575962, 0.3950663, 1.629449, 0, 0.02352941, 1, 1,
0.4585543, -1.407775, 3.55528, 0, 0.01568628, 1, 1,
0.4588251, 0.9169399, 0.2831946, 0, 0.01176471, 1, 1,
0.4602129, 0.8973493, 0.6091156, 0, 0.003921569, 1, 1,
0.4610216, 0.8725464, 0.8497936, 0.003921569, 0, 1, 1,
0.4678285, 0.2982441, 2.787931, 0.007843138, 0, 1, 1,
0.4696868, 1.576407, -0.5460295, 0.01568628, 0, 1, 1,
0.4755239, -0.7532041, 2.979805, 0.01960784, 0, 1, 1,
0.4785001, -1.405494, 3.115831, 0.02745098, 0, 1, 1,
0.4786664, -0.845593, 3.202835, 0.03137255, 0, 1, 1,
0.4812871, 0.9056247, 2.626093, 0.03921569, 0, 1, 1,
0.4833184, -0.001439598, 1.718409, 0.04313726, 0, 1, 1,
0.4878556, 1.215826, -0.621465, 0.05098039, 0, 1, 1,
0.488032, 1.194008, -0.5307227, 0.05490196, 0, 1, 1,
0.4895515, -0.2308497, 2.452303, 0.0627451, 0, 1, 1,
0.4913657, 1.00762, 0.5689961, 0.06666667, 0, 1, 1,
0.4954128, -0.1793728, 2.672541, 0.07450981, 0, 1, 1,
0.4963543, 1.365901, 2.602549, 0.07843138, 0, 1, 1,
0.5056271, 1.753673, 0.3501743, 0.08627451, 0, 1, 1,
0.5084134, 0.5192159, 1.929998, 0.09019608, 0, 1, 1,
0.5106534, -1.37949, 2.42082, 0.09803922, 0, 1, 1,
0.5116729, -1.001697, 2.508015, 0.1058824, 0, 1, 1,
0.5120438, 0.2629491, -1.553732, 0.1098039, 0, 1, 1,
0.5126198, -0.8454077, 3.231931, 0.1176471, 0, 1, 1,
0.5140632, 0.07693882, 2.076447, 0.1215686, 0, 1, 1,
0.5149848, -1.770483, 2.806629, 0.1294118, 0, 1, 1,
0.5151058, 0.6138654, 2.039842, 0.1333333, 0, 1, 1,
0.5204256, -0.2552949, 1.36337, 0.1411765, 0, 1, 1,
0.5209659, 0.1516409, 1.00181, 0.145098, 0, 1, 1,
0.521098, 0.6997389, 0.5036771, 0.1529412, 0, 1, 1,
0.5211582, -2.208495, 2.309104, 0.1568628, 0, 1, 1,
0.5254942, 1.114457, 0.463211, 0.1647059, 0, 1, 1,
0.5265661, -1.224136, 0.5510662, 0.1686275, 0, 1, 1,
0.5291042, -1.300981, 2.508736, 0.1764706, 0, 1, 1,
0.5291309, 1.87667, 0.5295018, 0.1803922, 0, 1, 1,
0.5297614, -1.002351, 3.390749, 0.1882353, 0, 1, 1,
0.5298719, 1.888551, -0.1396796, 0.1921569, 0, 1, 1,
0.5323135, 1.001191, -0.2953171, 0.2, 0, 1, 1,
0.5328782, -1.450348, 2.917374, 0.2078431, 0, 1, 1,
0.5398845, 1.160422, 1.22867, 0.2117647, 0, 1, 1,
0.5421625, -0.1265361, 0.66327, 0.2196078, 0, 1, 1,
0.5430362, 1.956864, 2.079648, 0.2235294, 0, 1, 1,
0.548601, -0.3921829, 1.859177, 0.2313726, 0, 1, 1,
0.5490887, 0.9229121, 0.6916993, 0.2352941, 0, 1, 1,
0.5499775, -2.575314, 2.23016, 0.2431373, 0, 1, 1,
0.5513327, -1.110779, 4.650953, 0.2470588, 0, 1, 1,
0.5557318, -1.55165, 5.010632, 0.254902, 0, 1, 1,
0.5577743, -0.6555524, 2.456106, 0.2588235, 0, 1, 1,
0.5589287, -0.6132892, 4.588299, 0.2666667, 0, 1, 1,
0.5638648, 0.2010268, 0.9838438, 0.2705882, 0, 1, 1,
0.5638974, 2.36094, -0.2091072, 0.2784314, 0, 1, 1,
0.5717068, 1.115058, -0.9998115, 0.282353, 0, 1, 1,
0.5725535, 0.5208473, 0.0207705, 0.2901961, 0, 1, 1,
0.5730063, 0.9071034, 1.2773, 0.2941177, 0, 1, 1,
0.5733649, 1.081115, 0.8914388, 0.3019608, 0, 1, 1,
0.5781827, 2.475927, -0.04409776, 0.3098039, 0, 1, 1,
0.5787854, -0.8676467, 2.897892, 0.3137255, 0, 1, 1,
0.5795848, -0.2478382, 3.100591, 0.3215686, 0, 1, 1,
0.5806013, 0.002869475, 0.397705, 0.3254902, 0, 1, 1,
0.5910347, 0.7900237, 1.35033, 0.3333333, 0, 1, 1,
0.5932882, -1.326932, 2.452731, 0.3372549, 0, 1, 1,
0.5939359, 0.4878815, 1.00041, 0.345098, 0, 1, 1,
0.6011572, -1.31736, 2.408257, 0.3490196, 0, 1, 1,
0.6018047, 1.043306, 0.3705329, 0.3568628, 0, 1, 1,
0.6021389, -0.2052372, 2.945552, 0.3607843, 0, 1, 1,
0.6024504, -0.3991061, 2.081344, 0.3686275, 0, 1, 1,
0.61731, 0.7973175, 1.427153, 0.372549, 0, 1, 1,
0.6206439, -0.7805685, 3.096061, 0.3803922, 0, 1, 1,
0.621786, 1.377747, -0.2314247, 0.3843137, 0, 1, 1,
0.6367128, 1.718954, 0.1901397, 0.3921569, 0, 1, 1,
0.6418667, -0.4778358, 3.271199, 0.3960784, 0, 1, 1,
0.643542, -0.04400995, 0.7236837, 0.4039216, 0, 1, 1,
0.6469679, -0.05898479, 1.038477, 0.4117647, 0, 1, 1,
0.6502492, -0.1582329, 2.1105, 0.4156863, 0, 1, 1,
0.6548602, -0.6423535, 0.1652031, 0.4235294, 0, 1, 1,
0.6560535, -1.105513, 2.681368, 0.427451, 0, 1, 1,
0.6605482, -0.3433079, 2.717929, 0.4352941, 0, 1, 1,
0.6667956, 0.139042, 1.505015, 0.4392157, 0, 1, 1,
0.6693642, 0.6529112, 1.478836, 0.4470588, 0, 1, 1,
0.6723474, 0.6698154, -0.4105583, 0.4509804, 0, 1, 1,
0.6775276, -0.7892654, 1.506597, 0.4588235, 0, 1, 1,
0.6909123, 0.7811088, 1.669183, 0.4627451, 0, 1, 1,
0.6912302, -0.3397852, 1.423817, 0.4705882, 0, 1, 1,
0.6921834, 1.095334, 0.9801992, 0.4745098, 0, 1, 1,
0.6942668, 0.6719239, 1.123393, 0.4823529, 0, 1, 1,
0.700411, -1.239427, 3.543547, 0.4862745, 0, 1, 1,
0.7026418, -0.3718459, 1.725059, 0.4941176, 0, 1, 1,
0.7039196, -0.2139648, 0.9286429, 0.5019608, 0, 1, 1,
0.7043946, 0.6403658, 0.7770268, 0.5058824, 0, 1, 1,
0.7116496, -0.4121341, 3.199595, 0.5137255, 0, 1, 1,
0.7116991, -1.116384, 2.869994, 0.5176471, 0, 1, 1,
0.7134809, 2.226566, 0.4329714, 0.5254902, 0, 1, 1,
0.717992, -0.6785718, 3.806268, 0.5294118, 0, 1, 1,
0.7213718, 0.8462621, 0.2361339, 0.5372549, 0, 1, 1,
0.7231053, -0.7372916, 2.982803, 0.5411765, 0, 1, 1,
0.7245578, 0.214393, -1.264537, 0.5490196, 0, 1, 1,
0.726204, 0.5720133, -0.9529203, 0.5529412, 0, 1, 1,
0.7274893, -0.8573852, 3.275795, 0.5607843, 0, 1, 1,
0.7368476, 0.8848172, 2.042055, 0.5647059, 0, 1, 1,
0.7380807, -0.9148306, 2.664129, 0.572549, 0, 1, 1,
0.7390814, -1.161605, 1.722277, 0.5764706, 0, 1, 1,
0.7424294, -0.4195381, 1.924115, 0.5843138, 0, 1, 1,
0.7427869, 1.189747, -0.6794229, 0.5882353, 0, 1, 1,
0.7437398, -0.3369382, 1.957498, 0.5960785, 0, 1, 1,
0.7437991, 1.369523, -0.8421184, 0.6039216, 0, 1, 1,
0.7444436, 1.379007, 1.036973, 0.6078432, 0, 1, 1,
0.7447996, 1.105763, 0.8950338, 0.6156863, 0, 1, 1,
0.7453723, 0.5461348, -0.07238496, 0.6196079, 0, 1, 1,
0.7457998, 0.9702396, -0.1243733, 0.627451, 0, 1, 1,
0.7471302, 0.9205803, 1.188191, 0.6313726, 0, 1, 1,
0.7479132, -1.348228, 2.924839, 0.6392157, 0, 1, 1,
0.7485863, -1.398902, 3.713593, 0.6431373, 0, 1, 1,
0.751604, 0.6019112, -0.6001915, 0.6509804, 0, 1, 1,
0.7583847, -0.7551293, 1.93818, 0.654902, 0, 1, 1,
0.7602404, 0.3424421, 1.332686, 0.6627451, 0, 1, 1,
0.761197, 0.9986762, 0.6362832, 0.6666667, 0, 1, 1,
0.7615403, -0.3379835, 3.322095, 0.6745098, 0, 1, 1,
0.7619886, -0.5794338, 1.192692, 0.6784314, 0, 1, 1,
0.7687684, 0.6297607, 2.134749, 0.6862745, 0, 1, 1,
0.7717007, -1.599707, 4.156768, 0.6901961, 0, 1, 1,
0.7779709, 0.1979571, 0.2145741, 0.6980392, 0, 1, 1,
0.7944237, -2.257026, 2.373373, 0.7058824, 0, 1, 1,
0.8003269, -0.02229186, 4.356359, 0.7098039, 0, 1, 1,
0.8015202, -0.7974271, 1.24227, 0.7176471, 0, 1, 1,
0.8070781, -0.3012522, 1.801722, 0.7215686, 0, 1, 1,
0.8085197, -0.4516006, 4.047411, 0.7294118, 0, 1, 1,
0.8128437, -1.114303, 3.129978, 0.7333333, 0, 1, 1,
0.8190833, 0.7731182, -0.6614492, 0.7411765, 0, 1, 1,
0.8237745, -0.6809404, 2.645578, 0.7450981, 0, 1, 1,
0.8263924, 1.030498, 0.9033307, 0.7529412, 0, 1, 1,
0.8278283, 0.08775128, 2.179151, 0.7568628, 0, 1, 1,
0.8296499, -0.7121376, 1.793431, 0.7647059, 0, 1, 1,
0.8398169, 0.8605973, 1.759351, 0.7686275, 0, 1, 1,
0.8453498, 0.2095457, 0.112656, 0.7764706, 0, 1, 1,
0.8578269, 0.6742415, -1.190597, 0.7803922, 0, 1, 1,
0.8615772, -1.424097, 1.924579, 0.7882353, 0, 1, 1,
0.8651255, -0.7769251, 0.9088479, 0.7921569, 0, 1, 1,
0.882135, 0.8732475, -0.9881005, 0.8, 0, 1, 1,
0.8827925, 0.7803293, 0.5884371, 0.8078431, 0, 1, 1,
0.8833288, -1.570982, 2.162586, 0.8117647, 0, 1, 1,
0.8847301, 0.3327198, 2.082354, 0.8196079, 0, 1, 1,
0.8934794, 1.782875, 1.294571, 0.8235294, 0, 1, 1,
0.8957604, 0.05868434, 1.292553, 0.8313726, 0, 1, 1,
0.9038959, -0.4123796, 2.479024, 0.8352941, 0, 1, 1,
0.9087692, -0.3629441, 2.705896, 0.8431373, 0, 1, 1,
0.9166319, -2.378864, 1.819866, 0.8470588, 0, 1, 1,
0.9175293, 0.969315, 0.7349004, 0.854902, 0, 1, 1,
0.9223111, -0.1229891, 0.6109774, 0.8588235, 0, 1, 1,
0.9233479, -0.587252, 3.182012, 0.8666667, 0, 1, 1,
0.9278642, 1.343357, 1.32636, 0.8705882, 0, 1, 1,
0.9286633, -1.994, 2.380584, 0.8784314, 0, 1, 1,
0.9305964, 0.4851756, -0.2869608, 0.8823529, 0, 1, 1,
0.9324274, -0.5888458, 2.695103, 0.8901961, 0, 1, 1,
0.9362929, -0.04810167, 1.993929, 0.8941177, 0, 1, 1,
0.9377022, 1.657172, 0.1048929, 0.9019608, 0, 1, 1,
0.9435635, -0.06267487, 1.778151, 0.9098039, 0, 1, 1,
0.9494551, 2.147685, 2.390899, 0.9137255, 0, 1, 1,
0.9529898, -0.9384155, 4.358021, 0.9215686, 0, 1, 1,
0.9601974, -0.08897613, 1.947636, 0.9254902, 0, 1, 1,
0.9709628, 1.002681, -0.2799991, 0.9333333, 0, 1, 1,
0.9712847, -1.072697, 4.002512, 0.9372549, 0, 1, 1,
0.9806288, -1.947689, 1.673428, 0.945098, 0, 1, 1,
0.9864925, 0.4706349, -0.6145075, 0.9490196, 0, 1, 1,
0.9866746, 0.9577951, -0.7051342, 0.9568627, 0, 1, 1,
0.9934366, -2.645809, 2.679208, 0.9607843, 0, 1, 1,
1.00748, -0.988956, 4.000631, 0.9686275, 0, 1, 1,
1.007761, 1.01206, -0.06553195, 0.972549, 0, 1, 1,
1.008895, 0.2846649, 1.289457, 0.9803922, 0, 1, 1,
1.011168, -0.6912291, 3.60289, 0.9843137, 0, 1, 1,
1.014692, -1.197998, 1.516636, 0.9921569, 0, 1, 1,
1.01656, 1.189498, 1.849213, 0.9960784, 0, 1, 1,
1.017277, -0.9081749, 3.22876, 1, 0, 0.9960784, 1,
1.018417, -0.4333053, 2.353766, 1, 0, 0.9882353, 1,
1.026118, 0.67536, 3.227049, 1, 0, 0.9843137, 1,
1.032638, 0.1922002, 0.3489037, 1, 0, 0.9764706, 1,
1.044927, -0.9088155, 1.946167, 1, 0, 0.972549, 1,
1.045856, 0.7221908, 1.308142, 1, 0, 0.9647059, 1,
1.048561, 0.1749222, 2.816869, 1, 0, 0.9607843, 1,
1.051473, -0.6756345, 1.705771, 1, 0, 0.9529412, 1,
1.053168, -0.9577507, 0.9638938, 1, 0, 0.9490196, 1,
1.053386, 0.1893863, 0.2356924, 1, 0, 0.9411765, 1,
1.055104, -0.1998009, 3.822419, 1, 0, 0.9372549, 1,
1.059937, -0.1171112, 1.640128, 1, 0, 0.9294118, 1,
1.061765, -1.142267, 3.866167, 1, 0, 0.9254902, 1,
1.063346, 2.75457, 1.846477, 1, 0, 0.9176471, 1,
1.063731, 0.6173747, 2.088897, 1, 0, 0.9137255, 1,
1.063888, 0.7124555, 1.163774, 1, 0, 0.9058824, 1,
1.065169, -1.616847, 2.17912, 1, 0, 0.9019608, 1,
1.06643, 1.227287, 0.7110438, 1, 0, 0.8941177, 1,
1.068648, -0.3745204, 1.575121, 1, 0, 0.8862745, 1,
1.073115, 0.9099674, 2.417533, 1, 0, 0.8823529, 1,
1.075986, 0.724938, -0.1071589, 1, 0, 0.8745098, 1,
1.07887, -1.057919, 3.613796, 1, 0, 0.8705882, 1,
1.082042, 1.550501, 1.089978, 1, 0, 0.8627451, 1,
1.0867, -0.5402077, 1.027676, 1, 0, 0.8588235, 1,
1.09784, 0.3156394, 1.502962, 1, 0, 0.8509804, 1,
1.101361, 2.178205, 0.02705761, 1, 0, 0.8470588, 1,
1.108997, 1.125108, -0.1570813, 1, 0, 0.8392157, 1,
1.116051, 1.037087, 0.6938756, 1, 0, 0.8352941, 1,
1.121988, -0.8023437, 4.67188, 1, 0, 0.827451, 1,
1.124009, 0.9076202, 2.851921, 1, 0, 0.8235294, 1,
1.130336, -0.1133755, 1.970196, 1, 0, 0.8156863, 1,
1.141504, 1.653289, 0.193311, 1, 0, 0.8117647, 1,
1.144088, 0.7946025, 2.503312, 1, 0, 0.8039216, 1,
1.144964, -0.5474404, 1.793427, 1, 0, 0.7960784, 1,
1.148052, -0.7450335, 3.239066, 1, 0, 0.7921569, 1,
1.150091, -1.116247, 1.577383, 1, 0, 0.7843137, 1,
1.151491, 1.508236, -0.1964768, 1, 0, 0.7803922, 1,
1.166878, -0.1148197, 2.199841, 1, 0, 0.772549, 1,
1.166894, -1.598608, 0.7526695, 1, 0, 0.7686275, 1,
1.167443, 0.3241304, 1.480503, 1, 0, 0.7607843, 1,
1.16877, -1.657902, 3.657838, 1, 0, 0.7568628, 1,
1.172583, 0.2891491, 2.140598, 1, 0, 0.7490196, 1,
1.173514, -0.3972203, 2.327479, 1, 0, 0.7450981, 1,
1.175612, 0.9463904, -0.3204555, 1, 0, 0.7372549, 1,
1.176482, -1.001011, 3.594613, 1, 0, 0.7333333, 1,
1.180898, 1.33951, -0.0266767, 1, 0, 0.7254902, 1,
1.180921, -0.4838544, 2.37182, 1, 0, 0.7215686, 1,
1.181878, -0.6896214, 3.337496, 1, 0, 0.7137255, 1,
1.182634, -0.1680581, 2.464734, 1, 0, 0.7098039, 1,
1.184048, 1.233211, -0.6177054, 1, 0, 0.7019608, 1,
1.195935, 0.7913558, 0.7766157, 1, 0, 0.6941177, 1,
1.199189, -0.7284798, 3.344838, 1, 0, 0.6901961, 1,
1.201048, -0.6373063, 2.443788, 1, 0, 0.682353, 1,
1.207339, 0.2525259, 1.876856, 1, 0, 0.6784314, 1,
1.208194, -0.3797139, 2.697258, 1, 0, 0.6705883, 1,
1.208489, -0.7721184, 1.140536, 1, 0, 0.6666667, 1,
1.214067, 0.2195484, 2.300712, 1, 0, 0.6588235, 1,
1.217163, 0.664082, 0.8904806, 1, 0, 0.654902, 1,
1.217197, 0.2247035, 0.9694255, 1, 0, 0.6470588, 1,
1.219307, 0.3961603, 2.557536, 1, 0, 0.6431373, 1,
1.220586, -0.2306127, 1.342942, 1, 0, 0.6352941, 1,
1.223752, 1.861223, 0.0709724, 1, 0, 0.6313726, 1,
1.236158, -1.669737, 3.524038, 1, 0, 0.6235294, 1,
1.249593, -0.8545522, 1.568896, 1, 0, 0.6196079, 1,
1.250608, 0.1576474, -0.09637645, 1, 0, 0.6117647, 1,
1.252531, 0.03041371, -1.444869, 1, 0, 0.6078432, 1,
1.265074, 0.592952, 1.648217, 1, 0, 0.6, 1,
1.269311, -1.995318, 3.399826, 1, 0, 0.5921569, 1,
1.276526, -0.752468, 2.531867, 1, 0, 0.5882353, 1,
1.290503, -0.4477697, 2.209137, 1, 0, 0.5803922, 1,
1.296504, -1.813386, 1.753723, 1, 0, 0.5764706, 1,
1.301432, -0.5080508, 2.747128, 1, 0, 0.5686275, 1,
1.302523, 1.872436, 0.8799862, 1, 0, 0.5647059, 1,
1.306659, -1.03254, 2.634321, 1, 0, 0.5568628, 1,
1.307895, -1.074327, 2.096949, 1, 0, 0.5529412, 1,
1.312522, -1.068128, 2.206596, 1, 0, 0.5450981, 1,
1.314098, 2.267083, 1.05591, 1, 0, 0.5411765, 1,
1.321418, 0.2221938, 0.5145664, 1, 0, 0.5333334, 1,
1.323573, 0.1298903, 2.551206, 1, 0, 0.5294118, 1,
1.332471, -2.876239, 1.399969, 1, 0, 0.5215687, 1,
1.340485, 0.8507751, 1.79452, 1, 0, 0.5176471, 1,
1.351821, -0.9913375, 1.711612, 1, 0, 0.509804, 1,
1.356246, -0.5169863, 1.758142, 1, 0, 0.5058824, 1,
1.371676, 0.4519752, 0.47965, 1, 0, 0.4980392, 1,
1.377632, -1.181834, 2.699996, 1, 0, 0.4901961, 1,
1.382937, -0.6031882, 1.947842, 1, 0, 0.4862745, 1,
1.383527, 1.007054, 0.7039384, 1, 0, 0.4784314, 1,
1.386521, -1.441672, 3.051688, 1, 0, 0.4745098, 1,
1.393055, -1.008285, 2.374082, 1, 0, 0.4666667, 1,
1.402506, 0.7225578, 1.136317, 1, 0, 0.4627451, 1,
1.405355, 1.289088, 0.08629646, 1, 0, 0.454902, 1,
1.411014, 0.1076309, -0.4902429, 1, 0, 0.4509804, 1,
1.433482, -0.8711799, 3.192587, 1, 0, 0.4431373, 1,
1.436331, 0.2313931, 2.357158, 1, 0, 0.4392157, 1,
1.441853, 0.5707583, 1.675646, 1, 0, 0.4313726, 1,
1.447799, 1.823368, 0.9053748, 1, 0, 0.427451, 1,
1.448238, -1.471163, 2.640846, 1, 0, 0.4196078, 1,
1.463877, -1.797472, 1.385914, 1, 0, 0.4156863, 1,
1.469114, 0.923446, 0.892821, 1, 0, 0.4078431, 1,
1.471927, 1.612718, -1.720281, 1, 0, 0.4039216, 1,
1.473286, 1.135847, -0.1273163, 1, 0, 0.3960784, 1,
1.476521, -0.3710514, 0.9754287, 1, 0, 0.3882353, 1,
1.490398, 0.2360841, 1.809699, 1, 0, 0.3843137, 1,
1.506237, 0.7760025, 0.903603, 1, 0, 0.3764706, 1,
1.53115, -2.613092, 3.56991, 1, 0, 0.372549, 1,
1.538296, -0.6544207, 1.442507, 1, 0, 0.3647059, 1,
1.539831, -0.2472725, 0.6140012, 1, 0, 0.3607843, 1,
1.545906, -1.075917, 1.936038, 1, 0, 0.3529412, 1,
1.560236, 1.877391, -0.2445751, 1, 0, 0.3490196, 1,
1.564471, -0.9037788, 1.69074, 1, 0, 0.3411765, 1,
1.568918, 0.0481885, 2.927803, 1, 0, 0.3372549, 1,
1.612141, -0.6530977, 1.28046, 1, 0, 0.3294118, 1,
1.614642, 0.1142499, -0.3390783, 1, 0, 0.3254902, 1,
1.618197, 0.3085653, 1.536677, 1, 0, 0.3176471, 1,
1.618323, -0.03210435, 0.8293785, 1, 0, 0.3137255, 1,
1.618755, 1.248618, 0.9161163, 1, 0, 0.3058824, 1,
1.634088, 0.2807689, 0.8917776, 1, 0, 0.2980392, 1,
1.640075, -0.1843379, 0.6441146, 1, 0, 0.2941177, 1,
1.673052, -0.4311327, 0.4796332, 1, 0, 0.2862745, 1,
1.691428, 0.1609637, 0.8173907, 1, 0, 0.282353, 1,
1.697993, -0.1959509, 0.9820349, 1, 0, 0.2745098, 1,
1.70559, 0.4940861, 2.047682, 1, 0, 0.2705882, 1,
1.721934, -0.5627747, 3.694579, 1, 0, 0.2627451, 1,
1.758178, 0.2130557, 0.4700133, 1, 0, 0.2588235, 1,
1.789427, -0.7169254, 1.487371, 1, 0, 0.2509804, 1,
1.828384, -0.3624291, 1.62896, 1, 0, 0.2470588, 1,
1.83471, -0.6757384, -0.4923447, 1, 0, 0.2392157, 1,
1.840411, 0.7943041, 0.8340725, 1, 0, 0.2352941, 1,
1.847828, 0.58005, 0.169051, 1, 0, 0.227451, 1,
1.866226, -0.7049347, 0.7848902, 1, 0, 0.2235294, 1,
1.879232, 0.5204543, 2.766055, 1, 0, 0.2156863, 1,
1.880131, -0.05767145, 1.705525, 1, 0, 0.2117647, 1,
1.891381, -1.135407, 1.217079, 1, 0, 0.2039216, 1,
1.901086, -0.6488738, 0.6625137, 1, 0, 0.1960784, 1,
1.910144, 0.2310372, 1.204652, 1, 0, 0.1921569, 1,
1.91018, -1.095441, 3.204251, 1, 0, 0.1843137, 1,
1.917373, 1.198412, 3.075457, 1, 0, 0.1803922, 1,
1.947345, -1.263743, 2.574216, 1, 0, 0.172549, 1,
1.949826, 0.2523958, -0.408911, 1, 0, 0.1686275, 1,
1.959374, 0.8282992, 1.465241, 1, 0, 0.1607843, 1,
1.964375, 0.3636561, 2.261269, 1, 0, 0.1568628, 1,
1.96572, -0.5290034, 2.316767, 1, 0, 0.1490196, 1,
1.976203, 0.9846747, 1.169398, 1, 0, 0.145098, 1,
1.983742, -0.5531815, 2.628872, 1, 0, 0.1372549, 1,
2.034076, -0.9486645, 1.330291, 1, 0, 0.1333333, 1,
2.053621, -0.1112942, 2.654804, 1, 0, 0.1254902, 1,
2.062706, 0.4224943, 1.931376, 1, 0, 0.1215686, 1,
2.072393, 1.546411, 0.3060028, 1, 0, 0.1137255, 1,
2.083835, -0.9683181, 3.097312, 1, 0, 0.1098039, 1,
2.13586, 0.1587627, 2.423536, 1, 0, 0.1019608, 1,
2.173428, 1.186134, 2.065075, 1, 0, 0.09411765, 1,
2.18744, -0.174647, 1.72218, 1, 0, 0.09019608, 1,
2.208931, 0.8405722, 2.144628, 1, 0, 0.08235294, 1,
2.209715, 0.3519309, 1.930365, 1, 0, 0.07843138, 1,
2.213936, -0.9958811, 2.037887, 1, 0, 0.07058824, 1,
2.230978, 0.9222161, 0.8180224, 1, 0, 0.06666667, 1,
2.281441, -0.7720103, 2.717048, 1, 0, 0.05882353, 1,
2.332915, 0.3069947, 1.920051, 1, 0, 0.05490196, 1,
2.335277, -0.08622094, 1.955102, 1, 0, 0.04705882, 1,
2.372005, -0.6904335, 2.614694, 1, 0, 0.04313726, 1,
2.540436, -0.1540912, 0.9270629, 1, 0, 0.03529412, 1,
2.600583, -1.753486, -0.870122, 1, 0, 0.03137255, 1,
2.626479, -1.269168, 3.441189, 1, 0, 0.02352941, 1,
2.887466, 0.7248564, 0.6692397, 1, 0, 0.01960784, 1,
3.301187, 0.5436006, -0.08557868, 1, 0, 0.01176471, 1,
3.356171, 0.01236649, 2.712851, 1, 0, 0.007843138, 1
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
0.1424401, -4.680941, -7.661305, 0, -0.5, 0.5, 0.5,
0.1424401, -4.680941, -7.661305, 1, -0.5, 0.5, 0.5,
0.1424401, -4.680941, -7.661305, 1, 1.5, 0.5, 0.5,
0.1424401, -4.680941, -7.661305, 0, 1.5, 0.5, 0.5
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
-4.160746, -0.3664069, -7.661305, 0, -0.5, 0.5, 0.5,
-4.160746, -0.3664069, -7.661305, 1, -0.5, 0.5, 0.5,
-4.160746, -0.3664069, -7.661305, 1, 1.5, 0.5, 0.5,
-4.160746, -0.3664069, -7.661305, 0, 1.5, 0.5, 0.5
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
-4.160746, -4.680941, -0.3566861, 0, -0.5, 0.5, 0.5,
-4.160746, -4.680941, -0.3566861, 1, -0.5, 0.5, 0.5,
-4.160746, -4.680941, -0.3566861, 1, 1.5, 0.5, 0.5,
-4.160746, -4.680941, -0.3566861, 0, 1.5, 0.5, 0.5
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
-3, -3.685279, -5.975624,
3, -3.685279, -5.975624,
-3, -3.685279, -5.975624,
-3, -3.851223, -6.256571,
-2, -3.685279, -5.975624,
-2, -3.851223, -6.256571,
-1, -3.685279, -5.975624,
-1, -3.851223, -6.256571,
0, -3.685279, -5.975624,
0, -3.851223, -6.256571,
1, -3.685279, -5.975624,
1, -3.851223, -6.256571,
2, -3.685279, -5.975624,
2, -3.851223, -6.256571,
3, -3.685279, -5.975624,
3, -3.851223, -6.256571
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
"2",
"3"
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
-3, -4.18311, -6.818464, 0, -0.5, 0.5, 0.5,
-3, -4.18311, -6.818464, 1, -0.5, 0.5, 0.5,
-3, -4.18311, -6.818464, 1, 1.5, 0.5, 0.5,
-3, -4.18311, -6.818464, 0, 1.5, 0.5, 0.5,
-2, -4.18311, -6.818464, 0, -0.5, 0.5, 0.5,
-2, -4.18311, -6.818464, 1, -0.5, 0.5, 0.5,
-2, -4.18311, -6.818464, 1, 1.5, 0.5, 0.5,
-2, -4.18311, -6.818464, 0, 1.5, 0.5, 0.5,
-1, -4.18311, -6.818464, 0, -0.5, 0.5, 0.5,
-1, -4.18311, -6.818464, 1, -0.5, 0.5, 0.5,
-1, -4.18311, -6.818464, 1, 1.5, 0.5, 0.5,
-1, -4.18311, -6.818464, 0, 1.5, 0.5, 0.5,
0, -4.18311, -6.818464, 0, -0.5, 0.5, 0.5,
0, -4.18311, -6.818464, 1, -0.5, 0.5, 0.5,
0, -4.18311, -6.818464, 1, 1.5, 0.5, 0.5,
0, -4.18311, -6.818464, 0, 1.5, 0.5, 0.5,
1, -4.18311, -6.818464, 0, -0.5, 0.5, 0.5,
1, -4.18311, -6.818464, 1, -0.5, 0.5, 0.5,
1, -4.18311, -6.818464, 1, 1.5, 0.5, 0.5,
1, -4.18311, -6.818464, 0, 1.5, 0.5, 0.5,
2, -4.18311, -6.818464, 0, -0.5, 0.5, 0.5,
2, -4.18311, -6.818464, 1, -0.5, 0.5, 0.5,
2, -4.18311, -6.818464, 1, 1.5, 0.5, 0.5,
2, -4.18311, -6.818464, 0, 1.5, 0.5, 0.5,
3, -4.18311, -6.818464, 0, -0.5, 0.5, 0.5,
3, -4.18311, -6.818464, 1, -0.5, 0.5, 0.5,
3, -4.18311, -6.818464, 1, 1.5, 0.5, 0.5,
3, -4.18311, -6.818464, 0, 1.5, 0.5, 0.5
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
-3.167703, -3, -5.975624,
-3.167703, 2, -5.975624,
-3.167703, -3, -5.975624,
-3.33321, -3, -6.256571,
-3.167703, -2, -5.975624,
-3.33321, -2, -6.256571,
-3.167703, -1, -5.975624,
-3.33321, -1, -6.256571,
-3.167703, 0, -5.975624,
-3.33321, 0, -6.256571,
-3.167703, 1, -5.975624,
-3.33321, 1, -6.256571,
-3.167703, 2, -5.975624,
-3.33321, 2, -6.256571
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
-3.664225, -3, -6.818464, 0, -0.5, 0.5, 0.5,
-3.664225, -3, -6.818464, 1, -0.5, 0.5, 0.5,
-3.664225, -3, -6.818464, 1, 1.5, 0.5, 0.5,
-3.664225, -3, -6.818464, 0, 1.5, 0.5, 0.5,
-3.664225, -2, -6.818464, 0, -0.5, 0.5, 0.5,
-3.664225, -2, -6.818464, 1, -0.5, 0.5, 0.5,
-3.664225, -2, -6.818464, 1, 1.5, 0.5, 0.5,
-3.664225, -2, -6.818464, 0, 1.5, 0.5, 0.5,
-3.664225, -1, -6.818464, 0, -0.5, 0.5, 0.5,
-3.664225, -1, -6.818464, 1, -0.5, 0.5, 0.5,
-3.664225, -1, -6.818464, 1, 1.5, 0.5, 0.5,
-3.664225, -1, -6.818464, 0, 1.5, 0.5, 0.5,
-3.664225, 0, -6.818464, 0, -0.5, 0.5, 0.5,
-3.664225, 0, -6.818464, 1, -0.5, 0.5, 0.5,
-3.664225, 0, -6.818464, 1, 1.5, 0.5, 0.5,
-3.664225, 0, -6.818464, 0, 1.5, 0.5, 0.5,
-3.664225, 1, -6.818464, 0, -0.5, 0.5, 0.5,
-3.664225, 1, -6.818464, 1, -0.5, 0.5, 0.5,
-3.664225, 1, -6.818464, 1, 1.5, 0.5, 0.5,
-3.664225, 1, -6.818464, 0, 1.5, 0.5, 0.5,
-3.664225, 2, -6.818464, 0, -0.5, 0.5, 0.5,
-3.664225, 2, -6.818464, 1, -0.5, 0.5, 0.5,
-3.664225, 2, -6.818464, 1, 1.5, 0.5, 0.5,
-3.664225, 2, -6.818464, 0, 1.5, 0.5, 0.5
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
-3.167703, -3.685279, -4,
-3.167703, -3.685279, 4,
-3.167703, -3.685279, -4,
-3.33321, -3.851223, -4,
-3.167703, -3.685279, -2,
-3.33321, -3.851223, -2,
-3.167703, -3.685279, 0,
-3.33321, -3.851223, 0,
-3.167703, -3.685279, 2,
-3.33321, -3.851223, 2,
-3.167703, -3.685279, 4,
-3.33321, -3.851223, 4
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
-3.664225, -4.18311, -4, 0, -0.5, 0.5, 0.5,
-3.664225, -4.18311, -4, 1, -0.5, 0.5, 0.5,
-3.664225, -4.18311, -4, 1, 1.5, 0.5, 0.5,
-3.664225, -4.18311, -4, 0, 1.5, 0.5, 0.5,
-3.664225, -4.18311, -2, 0, -0.5, 0.5, 0.5,
-3.664225, -4.18311, -2, 1, -0.5, 0.5, 0.5,
-3.664225, -4.18311, -2, 1, 1.5, 0.5, 0.5,
-3.664225, -4.18311, -2, 0, 1.5, 0.5, 0.5,
-3.664225, -4.18311, 0, 0, -0.5, 0.5, 0.5,
-3.664225, -4.18311, 0, 1, -0.5, 0.5, 0.5,
-3.664225, -4.18311, 0, 1, 1.5, 0.5, 0.5,
-3.664225, -4.18311, 0, 0, 1.5, 0.5, 0.5,
-3.664225, -4.18311, 2, 0, -0.5, 0.5, 0.5,
-3.664225, -4.18311, 2, 1, -0.5, 0.5, 0.5,
-3.664225, -4.18311, 2, 1, 1.5, 0.5, 0.5,
-3.664225, -4.18311, 2, 0, 1.5, 0.5, 0.5,
-3.664225, -4.18311, 4, 0, -0.5, 0.5, 0.5,
-3.664225, -4.18311, 4, 1, -0.5, 0.5, 0.5,
-3.664225, -4.18311, 4, 1, 1.5, 0.5, 0.5,
-3.664225, -4.18311, 4, 0, 1.5, 0.5, 0.5
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
-3.167703, -3.685279, -5.975624,
-3.167703, 2.952465, -5.975624,
-3.167703, -3.685279, 5.262252,
-3.167703, 2.952465, 5.262252,
-3.167703, -3.685279, -5.975624,
-3.167703, -3.685279, 5.262252,
-3.167703, 2.952465, -5.975624,
-3.167703, 2.952465, 5.262252,
-3.167703, -3.685279, -5.975624,
3.452583, -3.685279, -5.975624,
-3.167703, -3.685279, 5.262252,
3.452583, -3.685279, 5.262252,
-3.167703, 2.952465, -5.975624,
3.452583, 2.952465, -5.975624,
-3.167703, 2.952465, 5.262252,
3.452583, 2.952465, 5.262252,
3.452583, -3.685279, -5.975624,
3.452583, 2.952465, -5.975624,
3.452583, -3.685279, 5.262252,
3.452583, 2.952465, 5.262252,
3.452583, -3.685279, -5.975624,
3.452583, -3.685279, 5.262252,
3.452583, 2.952465, -5.975624,
3.452583, 2.952465, 5.262252
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
var radius = 7.814705;
var distance = 34.76851;
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
mvMatrix.translate( -0.1424401, 0.3664069, 0.3566861 );
mvMatrix.scale( 1.276291, 1.272934, 0.7518691 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76851);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Phencyclidine<-read.table("Phencyclidine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phencyclidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phencyclidine' not found
```

```r
y<-Phencyclidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phencyclidine' not found
```

```r
z<-Phencyclidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phencyclidine' not found
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
-3.071291, 0.3146643, -0.6797158, 0, 0, 1, 1, 1,
-3.015075, -0.1468879, -2.088339, 1, 0, 0, 1, 1,
-3.013837, -1.548106, -2.500623, 1, 0, 0, 1, 1,
-3.011236, 0.2548006, -0.6733595, 1, 0, 0, 1, 1,
-2.980492, -0.4148938, -2.244935, 1, 0, 0, 1, 1,
-2.679553, -0.3593342, -1.605703, 1, 0, 0, 1, 1,
-2.659939, 0.2885986, -0.4726264, 0, 0, 0, 1, 1,
-2.554164, -0.3105798, -1.895173, 0, 0, 0, 1, 1,
-2.413294, 0.1036726, -3.725331, 0, 0, 0, 1, 1,
-2.388689, 0.1924293, -1.724326, 0, 0, 0, 1, 1,
-2.323174, -1.502046, -1.340028, 0, 0, 0, 1, 1,
-2.30582, -0.7610185, -3.100494, 0, 0, 0, 1, 1,
-2.302148, -0.4203442, -2.059163, 0, 0, 0, 1, 1,
-2.297235, -1.180098, -3.529155, 1, 1, 1, 1, 1,
-2.272329, -1.195115, -1.33268, 1, 1, 1, 1, 1,
-2.263834, 0.09422351, -0.01458605, 1, 1, 1, 1, 1,
-2.255791, -0.4544828, -1.632249, 1, 1, 1, 1, 1,
-2.24404, 0.4524639, -1.789193, 1, 1, 1, 1, 1,
-2.225346, -1.172468, -1.925242, 1, 1, 1, 1, 1,
-2.217351, -0.8126357, -1.470298, 1, 1, 1, 1, 1,
-2.199174, -1.403061, -2.558174, 1, 1, 1, 1, 1,
-2.180408, 0.2877339, -1.125779, 1, 1, 1, 1, 1,
-2.105618, 0.3729387, -0.8431523, 1, 1, 1, 1, 1,
-2.088105, 0.2604587, -0.9905025, 1, 1, 1, 1, 1,
-2.070695, 1.233926, 0.3320034, 1, 1, 1, 1, 1,
-2.066712, 0.4579002, -0.6374922, 1, 1, 1, 1, 1,
-2.015047, -1.490836, -0.6445913, 1, 1, 1, 1, 1,
-2.00481, 1.256446, 1.10556, 1, 1, 1, 1, 1,
-1.99916, 0.5258887, -1.993148, 0, 0, 1, 1, 1,
-1.997227, 0.09232465, -1.016631, 1, 0, 0, 1, 1,
-1.967085, 1.449405, -1.137992, 1, 0, 0, 1, 1,
-1.948044, -1.01301, -0.8565825, 1, 0, 0, 1, 1,
-1.94053, -0.7482821, -1.692714, 1, 0, 0, 1, 1,
-1.937699, -1.202615, -3.511026, 1, 0, 0, 1, 1,
-1.931322, 0.5147831, -2.543438, 0, 0, 0, 1, 1,
-1.930674, -0.860071, -1.954468, 0, 0, 0, 1, 1,
-1.929669, 0.8994827, -0.3504845, 0, 0, 0, 1, 1,
-1.920735, 0.4094532, -1.282651, 0, 0, 0, 1, 1,
-1.915189, 1.788835, -0.3565934, 0, 0, 0, 1, 1,
-1.909986, 0.04166023, -0.2930583, 0, 0, 0, 1, 1,
-1.909169, 1.819534, -0.9439828, 0, 0, 0, 1, 1,
-1.909088, -0.3365638, -2.088207, 1, 1, 1, 1, 1,
-1.895153, -0.6822008, -1.558042, 1, 1, 1, 1, 1,
-1.872678, -1.107802, -1.245259, 1, 1, 1, 1, 1,
-1.870266, 1.496346, -2.022752, 1, 1, 1, 1, 1,
-1.865225, 0.9075503, 0.7470453, 1, 1, 1, 1, 1,
-1.841781, -0.3860394, -1.720956, 1, 1, 1, 1, 1,
-1.840419, -0.4526778, -2.07728, 1, 1, 1, 1, 1,
-1.804085, -0.01504352, -2.743448, 1, 1, 1, 1, 1,
-1.799402, -0.07103074, -1.055098, 1, 1, 1, 1, 1,
-1.773499, -0.07584769, -2.231243, 1, 1, 1, 1, 1,
-1.768276, 1.207192, 0.1181095, 1, 1, 1, 1, 1,
-1.762911, -1.102173, -2.744894, 1, 1, 1, 1, 1,
-1.754586, 0.1861311, -1.305787, 1, 1, 1, 1, 1,
-1.754455, -0.1566439, -2.177664, 1, 1, 1, 1, 1,
-1.752234, -0.3368665, -2.831596, 1, 1, 1, 1, 1,
-1.748458, 0.1232151, 0.04028787, 0, 0, 1, 1, 1,
-1.747206, -1.062825, -2.984569, 1, 0, 0, 1, 1,
-1.737454, -0.5786327, -2.18972, 1, 0, 0, 1, 1,
-1.737319, 0.3882009, -2.40893, 1, 0, 0, 1, 1,
-1.721592, 0.471326, 0.2076728, 1, 0, 0, 1, 1,
-1.707977, 1.451049, -1.833076, 1, 0, 0, 1, 1,
-1.700702, 0.3695801, 0.2698718, 0, 0, 0, 1, 1,
-1.677164, 0.0232437, -2.644937, 0, 0, 0, 1, 1,
-1.676443, -1.330394, -1.673472, 0, 0, 0, 1, 1,
-1.668787, 0.3400901, -2.016274, 0, 0, 0, 1, 1,
-1.644884, -0.4172949, -2.384579, 0, 0, 0, 1, 1,
-1.621883, -0.1767098, -1.519591, 0, 0, 0, 1, 1,
-1.611264, 0.7843843, -2.378588, 0, 0, 0, 1, 1,
-1.591468, 1.018472, 0.227473, 1, 1, 1, 1, 1,
-1.573087, -0.5255392, -1.317774, 1, 1, 1, 1, 1,
-1.571199, -0.8521236, -2.308759, 1, 1, 1, 1, 1,
-1.570256, -1.450394, -2.815126, 1, 1, 1, 1, 1,
-1.544933, 0.5722139, -0.6210224, 1, 1, 1, 1, 1,
-1.540111, 0.9955666, 0.3407125, 1, 1, 1, 1, 1,
-1.538539, -1.344083, -2.028986, 1, 1, 1, 1, 1,
-1.527643, -0.1005173, -0.9567189, 1, 1, 1, 1, 1,
-1.523592, 0.9867374, -0.8009366, 1, 1, 1, 1, 1,
-1.510861, 0.07962942, -0.1371444, 1, 1, 1, 1, 1,
-1.504459, -0.8330411, -2.579476, 1, 1, 1, 1, 1,
-1.499222, 0.9976385, 0.9265001, 1, 1, 1, 1, 1,
-1.499144, 1.098778, -0.02675514, 1, 1, 1, 1, 1,
-1.493933, 0.7491807, 0.689471, 1, 1, 1, 1, 1,
-1.492372, 0.8479537, -1.500176, 1, 1, 1, 1, 1,
-1.489078, 0.8927164, -2.638269, 0, 0, 1, 1, 1,
-1.478923, 1.555645, -0.4440105, 1, 0, 0, 1, 1,
-1.47504, -0.5135997, -3.49229, 1, 0, 0, 1, 1,
-1.454767, 0.4076263, -1.103545, 1, 0, 0, 1, 1,
-1.452542, 0.08257991, -1.524624, 1, 0, 0, 1, 1,
-1.449845, 0.001864506, -1.321185, 1, 0, 0, 1, 1,
-1.437091, -1.004426, -2.128665, 0, 0, 0, 1, 1,
-1.433845, 0.4547859, -0.8632053, 0, 0, 0, 1, 1,
-1.433512, -1.363918, -2.652587, 0, 0, 0, 1, 1,
-1.429307, -2.917427, -2.726793, 0, 0, 0, 1, 1,
-1.419337, 1.034918, 1.495565, 0, 0, 0, 1, 1,
-1.4148, -3.066909, -3.736152, 0, 0, 0, 1, 1,
-1.413076, 1.404513, -0.4008312, 0, 0, 0, 1, 1,
-1.409225, -0.9493181, -3.309876, 1, 1, 1, 1, 1,
-1.405269, -1.863049, -0.4502934, 1, 1, 1, 1, 1,
-1.400789, -1.039499, -3.219136, 1, 1, 1, 1, 1,
-1.383384, 0.08977284, -2.242153, 1, 1, 1, 1, 1,
-1.371319, 0.2773171, -1.197245, 1, 1, 1, 1, 1,
-1.366381, 0.162964, -2.716875, 1, 1, 1, 1, 1,
-1.365636, 1.080346, -0.6201889, 1, 1, 1, 1, 1,
-1.365266, 0.3622536, -1.279267, 1, 1, 1, 1, 1,
-1.319498, -0.02464511, -2.639998, 1, 1, 1, 1, 1,
-1.299537, 0.0759747, -0.926089, 1, 1, 1, 1, 1,
-1.285676, -1.341854, -1.369323, 1, 1, 1, 1, 1,
-1.274372, 0.9129134, -1.509313, 1, 1, 1, 1, 1,
-1.273856, -1.253495, -2.80821, 1, 1, 1, 1, 1,
-1.257717, -0.2611331, -2.069952, 1, 1, 1, 1, 1,
-1.256456, -1.365886, -2.239306, 1, 1, 1, 1, 1,
-1.246997, 2.427571, -0.6994345, 0, 0, 1, 1, 1,
-1.24083, -1.534737, -2.366854, 1, 0, 0, 1, 1,
-1.224188, -1.557613, -2.085371, 1, 0, 0, 1, 1,
-1.219708, 0.6249035, -0.001518651, 1, 0, 0, 1, 1,
-1.218396, 1.254512, -1.596571, 1, 0, 0, 1, 1,
-1.216618, 0.3654045, 0.4566539, 1, 0, 0, 1, 1,
-1.200165, 0.1897754, -0.5509406, 0, 0, 0, 1, 1,
-1.194801, -0.6579529, -2.681717, 0, 0, 0, 1, 1,
-1.188425, -0.4550007, -0.5458795, 0, 0, 0, 1, 1,
-1.18748, 2.133318, 0.05696901, 0, 0, 0, 1, 1,
-1.187139, 0.9732975, 0.3997043, 0, 0, 0, 1, 1,
-1.185459, 0.410132, -1.288595, 0, 0, 0, 1, 1,
-1.184341, 0.878239, -1.303329, 0, 0, 0, 1, 1,
-1.181823, 0.05467457, -0.4085011, 1, 1, 1, 1, 1,
-1.177204, -0.4793079, -1.628935, 1, 1, 1, 1, 1,
-1.17235, -0.5805889, -0.5900144, 1, 1, 1, 1, 1,
-1.170383, -0.6258369, -3.939432, 1, 1, 1, 1, 1,
-1.17016, -0.5593001, 0.1686624, 1, 1, 1, 1, 1,
-1.159536, 0.0695862, -1.998945, 1, 1, 1, 1, 1,
-1.159509, -0.2883797, -2.174848, 1, 1, 1, 1, 1,
-1.159491, 1.295426, 0.662805, 1, 1, 1, 1, 1,
-1.159088, 0.3346841, -2.279031, 1, 1, 1, 1, 1,
-1.157977, 0.2537489, -0.3395821, 1, 1, 1, 1, 1,
-1.152893, -1.124051, -2.76717, 1, 1, 1, 1, 1,
-1.152343, -0.4742431, -1.949146, 1, 1, 1, 1, 1,
-1.151638, -0.5454647, -2.450217, 1, 1, 1, 1, 1,
-1.147301, 0.4399425, -1.247984, 1, 1, 1, 1, 1,
-1.146378, -0.5398803, -2.587758, 1, 1, 1, 1, 1,
-1.128846, -1.318892, -2.988297, 0, 0, 1, 1, 1,
-1.125515, -1.092493, -3.671809, 1, 0, 0, 1, 1,
-1.124387, 1.424377, -0.5006025, 1, 0, 0, 1, 1,
-1.12064, 0.5054466, -1.421279, 1, 0, 0, 1, 1,
-1.100923, 1.31802, -3.554389, 1, 0, 0, 1, 1,
-1.100081, -0.2533039, -2.050559, 1, 0, 0, 1, 1,
-1.09846, -0.2433003, -0.8756638, 0, 0, 0, 1, 1,
-1.094255, 0.7849072, 0.8486073, 0, 0, 0, 1, 1,
-1.085273, -0.3311301, -0.4822, 0, 0, 0, 1, 1,
-1.068558, -2.412013, -1.523507, 0, 0, 0, 1, 1,
-1.064099, -0.501368, -0.7624695, 0, 0, 0, 1, 1,
-1.057923, -2.013258, -3.627157, 0, 0, 0, 1, 1,
-1.054382, -0.2210422, -2.153983, 0, 0, 0, 1, 1,
-1.051264, 0.3778706, -2.682555, 1, 1, 1, 1, 1,
-1.049945, -0.4372344, -0.7969378, 1, 1, 1, 1, 1,
-1.045821, 0.2754985, -0.1856284, 1, 1, 1, 1, 1,
-1.044881, 0.405893, -1.739976, 1, 1, 1, 1, 1,
-1.037388, -0.8597339, -3.574414, 1, 1, 1, 1, 1,
-1.033852, -0.1581215, -0.9328697, 1, 1, 1, 1, 1,
-1.032148, 0.2714102, -1.636529, 1, 1, 1, 1, 1,
-1.032069, -0.4138916, -2.356789, 1, 1, 1, 1, 1,
-1.018363, -0.1061727, -3.244968, 1, 1, 1, 1, 1,
-1.017831, 0.8705725, -0.1401466, 1, 1, 1, 1, 1,
-1.01169, -0.3297971, -1.666777, 1, 1, 1, 1, 1,
-1.001642, 0.9600384, -0.1305571, 1, 1, 1, 1, 1,
-1.000533, 0.5678653, -0.2802042, 1, 1, 1, 1, 1,
-0.9867956, 1.566829, -1.517577, 1, 1, 1, 1, 1,
-0.9864858, -0.05164164, -1.685463, 1, 1, 1, 1, 1,
-0.9806272, -0.1956673, -3.375261, 0, 0, 1, 1, 1,
-0.9701956, 0.5797845, -2.595224, 1, 0, 0, 1, 1,
-0.9681696, 1.267312, -0.07075037, 1, 0, 0, 1, 1,
-0.9656709, 0.9230189, -2.081364, 1, 0, 0, 1, 1,
-0.9637634, -0.8447856, -3.539109, 1, 0, 0, 1, 1,
-0.9633769, -0.9657528, -2.303862, 1, 0, 0, 1, 1,
-0.9574227, 0.7388778, -1.376196, 0, 0, 0, 1, 1,
-0.9573283, 0.2245313, -2.076583, 0, 0, 0, 1, 1,
-0.9572565, 1.037271, -0.3395102, 0, 0, 0, 1, 1,
-0.9363576, 0.08498883, -1.466487, 0, 0, 0, 1, 1,
-0.9242728, 0.2002458, -1.343603, 0, 0, 0, 1, 1,
-0.9195533, 0.2386968, -1.964411, 0, 0, 0, 1, 1,
-0.9084783, 0.4898121, -3.289588, 0, 0, 0, 1, 1,
-0.9066289, -0.1775589, -1.407796, 1, 1, 1, 1, 1,
-0.9049944, 1.105795, -2.187831, 1, 1, 1, 1, 1,
-0.9048877, -0.41973, -3.028389, 1, 1, 1, 1, 1,
-0.9044579, 0.1141111, -0.3948747, 1, 1, 1, 1, 1,
-0.9033076, -0.3752507, -1.445887, 1, 1, 1, 1, 1,
-0.897074, -0.6200966, -2.347007, 1, 1, 1, 1, 1,
-0.8955366, 0.01464582, -0.6868451, 1, 1, 1, 1, 1,
-0.8857562, -1.628899, -2.254746, 1, 1, 1, 1, 1,
-0.8848897, -0.3847512, -1.956524, 1, 1, 1, 1, 1,
-0.8840026, 0.7617884, 0.3044767, 1, 1, 1, 1, 1,
-0.877821, -0.2176208, -0.613323, 1, 1, 1, 1, 1,
-0.8776369, 0.9809769, 0.08473808, 1, 1, 1, 1, 1,
-0.8715235, -2.47365, -1.565001, 1, 1, 1, 1, 1,
-0.8658551, -0.1623149, -0.3654609, 1, 1, 1, 1, 1,
-0.8561897, -0.8621507, -2.180345, 1, 1, 1, 1, 1,
-0.8538418, 0.1946136, -0.5120327, 0, 0, 1, 1, 1,
-0.8500712, 0.3310973, 0.333483, 1, 0, 0, 1, 1,
-0.8331266, 0.3028273, -0.26108, 1, 0, 0, 1, 1,
-0.8330094, -1.020801, 0.05632389, 1, 0, 0, 1, 1,
-0.8278502, 0.4397028, -2.523253, 1, 0, 0, 1, 1,
-0.8225981, -0.4503032, -2.644612, 1, 0, 0, 1, 1,
-0.8181794, -0.1482757, -1.013008, 0, 0, 0, 1, 1,
-0.8092614, 0.1965709, -1.115065, 0, 0, 0, 1, 1,
-0.8074063, -0.3250804, -1.931744, 0, 0, 0, 1, 1,
-0.7945144, 0.1820997, -1.532108, 0, 0, 0, 1, 1,
-0.7940906, -1.129873, -2.135744, 0, 0, 0, 1, 1,
-0.7924149, -1.46366, -3.413362, 0, 0, 0, 1, 1,
-0.7917292, 0.6768703, -0.4249392, 0, 0, 0, 1, 1,
-0.7901234, -0.9725165, -0.2940843, 1, 1, 1, 1, 1,
-0.7832695, 0.9017738, 0.1131887, 1, 1, 1, 1, 1,
-0.7824211, -1.05405, -3.868964, 1, 1, 1, 1, 1,
-0.7796863, -0.2071822, -2.900534, 1, 1, 1, 1, 1,
-0.7796273, -0.1883198, 0.199115, 1, 1, 1, 1, 1,
-0.7730674, -0.8348603, -1.883794, 1, 1, 1, 1, 1,
-0.7684024, -0.6863831, -2.309167, 1, 1, 1, 1, 1,
-0.7655356, 0.6626256, -0.6434075, 1, 1, 1, 1, 1,
-0.7592813, 1.410588, 0.1812029, 1, 1, 1, 1, 1,
-0.7580636, -0.1089537, -0.4625852, 1, 1, 1, 1, 1,
-0.7473686, 1.30735, -3.080998, 1, 1, 1, 1, 1,
-0.7350346, -0.5759717, -4.203887, 1, 1, 1, 1, 1,
-0.7350131, 0.1523191, -1.941561, 1, 1, 1, 1, 1,
-0.7333641, -0.4297914, -1.524414, 1, 1, 1, 1, 1,
-0.7278557, -0.110721, -1.735821, 1, 1, 1, 1, 1,
-0.7251147, -0.5222457, -2.213424, 0, 0, 1, 1, 1,
-0.7149346, 0.7818533, -1.567617, 1, 0, 0, 1, 1,
-0.712799, -0.2803975, -2.877604, 1, 0, 0, 1, 1,
-0.698523, -0.8682076, -1.766854, 1, 0, 0, 1, 1,
-0.697625, -1.050588, -2.173042, 1, 0, 0, 1, 1,
-0.6887397, -0.4171326, -2.08283, 1, 0, 0, 1, 1,
-0.6854564, -1.380419, -3.008731, 0, 0, 0, 1, 1,
-0.6853092, -0.3176413, -0.07975718, 0, 0, 0, 1, 1,
-0.6836476, -0.5696108, -3.77059, 0, 0, 0, 1, 1,
-0.6828705, 0.5483984, -1.094782, 0, 0, 0, 1, 1,
-0.6802146, -0.1287258, 0.4402752, 0, 0, 0, 1, 1,
-0.6801383, -0.9232179, -1.338706, 0, 0, 0, 1, 1,
-0.6781762, 0.7748034, -1.984097, 0, 0, 0, 1, 1,
-0.6764262, 0.9181811, -2.055296, 1, 1, 1, 1, 1,
-0.6664571, 0.6681747, -2.646673, 1, 1, 1, 1, 1,
-0.664468, -0.7719314, -3.636938, 1, 1, 1, 1, 1,
-0.6639137, -0.3962567, -2.322706, 1, 1, 1, 1, 1,
-0.6614509, 1.219971, -0.7640498, 1, 1, 1, 1, 1,
-0.6606376, -1.455334, -2.471941, 1, 1, 1, 1, 1,
-0.6597235, -1.872882, -2.462059, 1, 1, 1, 1, 1,
-0.6583731, -0.6715646, -3.208332, 1, 1, 1, 1, 1,
-0.6497663, -1.26324, -3.282717, 1, 1, 1, 1, 1,
-0.6490936, 0.8478277, -1.861357, 1, 1, 1, 1, 1,
-0.6456081, -1.536792, -3.090717, 1, 1, 1, 1, 1,
-0.64166, 1.670865, 0.46415, 1, 1, 1, 1, 1,
-0.6355499, 0.9998764, -0.396135, 1, 1, 1, 1, 1,
-0.6316637, -1.015001, -2.926821, 1, 1, 1, 1, 1,
-0.6304458, 0.3034495, -1.306428, 1, 1, 1, 1, 1,
-0.6285756, -0.2114708, -2.475523, 0, 0, 1, 1, 1,
-0.6202525, 0.8753082, 0.2184093, 1, 0, 0, 1, 1,
-0.6148453, 0.4418906, 0.2416084, 1, 0, 0, 1, 1,
-0.6145358, -0.7228917, -2.896459, 1, 0, 0, 1, 1,
-0.6138031, 0.4427508, -0.4480936, 1, 0, 0, 1, 1,
-0.6093956, 0.3578313, -0.6216701, 1, 0, 0, 1, 1,
-0.6049342, 0.4264465, -0.9359872, 0, 0, 0, 1, 1,
-0.5999911, 2.705517, -2.056133, 0, 0, 0, 1, 1,
-0.59981, -0.6313425, -1.360901, 0, 0, 0, 1, 1,
-0.5954393, 0.6727508, 0.1797193, 0, 0, 0, 1, 1,
-0.5948833, 0.03293398, 1.050338, 0, 0, 0, 1, 1,
-0.5946418, 0.1465038, -0.1610698, 0, 0, 0, 1, 1,
-0.5929688, 2.855799, -1.547963, 0, 0, 0, 1, 1,
-0.592245, 0.08602739, -2.316135, 1, 1, 1, 1, 1,
-0.5784672, 0.9305505, -0.1041074, 1, 1, 1, 1, 1,
-0.5750393, 1.023731, -0.9714642, 1, 1, 1, 1, 1,
-0.5702742, 0.5494462, -1.473253, 1, 1, 1, 1, 1,
-0.5673198, 0.1791588, -1.087187, 1, 1, 1, 1, 1,
-0.5664832, 1.485583, 1.126814, 1, 1, 1, 1, 1,
-0.5644151, -0.9522209, -1.527087, 1, 1, 1, 1, 1,
-0.5631751, -1.876917, -3.391893, 1, 1, 1, 1, 1,
-0.5612402, 0.33766, -1.46136, 1, 1, 1, 1, 1,
-0.5605847, -1.042051, -2.219039, 1, 1, 1, 1, 1,
-0.5566775, 0.3567054, -1.337867, 1, 1, 1, 1, 1,
-0.5555334, -0.9390011, -3.676287, 1, 1, 1, 1, 1,
-0.5552472, -0.5396282, -3.652333, 1, 1, 1, 1, 1,
-0.551868, 0.04059529, -2.684101, 1, 1, 1, 1, 1,
-0.5481057, -0.1817231, -0.5876122, 1, 1, 1, 1, 1,
-0.546434, -0.2067776, -3.37347, 0, 0, 1, 1, 1,
-0.5431123, -2.316187, -5.811965, 1, 0, 0, 1, 1,
-0.5403183, -0.4168652, -4.035102, 1, 0, 0, 1, 1,
-0.5344588, 0.08235409, -0.8966641, 1, 0, 0, 1, 1,
-0.5326803, -1.650734, -1.557275, 1, 0, 0, 1, 1,
-0.5322072, 1.515263, -1.365295, 1, 0, 0, 1, 1,
-0.5272757, 1.255059, 2.076716, 0, 0, 0, 1, 1,
-0.5272742, 0.08087698, -2.309073, 0, 0, 0, 1, 1,
-0.5269023, -0.9302439, -1.797583, 0, 0, 0, 1, 1,
-0.5245935, 0.5428336, 0.9382442, 0, 0, 0, 1, 1,
-0.523285, -0.3736171, -2.320821, 0, 0, 0, 1, 1,
-0.5188754, -0.01268525, -1.460465, 0, 0, 0, 1, 1,
-0.5156471, -2.429623, -3.426121, 0, 0, 0, 1, 1,
-0.5147972, 0.1829568, -0.7958747, 1, 1, 1, 1, 1,
-0.5138615, 0.1729776, -0.6448151, 1, 1, 1, 1, 1,
-0.5070057, -1.029983, -2.520274, 1, 1, 1, 1, 1,
-0.5067275, 0.2241656, -0.04513927, 1, 1, 1, 1, 1,
-0.5054504, -0.6254698, -2.498162, 1, 1, 1, 1, 1,
-0.5018927, 1.618595, -0.4082916, 1, 1, 1, 1, 1,
-0.4966947, -0.009644686, -0.4962535, 1, 1, 1, 1, 1,
-0.4945203, 0.4991397, -0.6048414, 1, 1, 1, 1, 1,
-0.4926828, -0.02813534, -3.666393, 1, 1, 1, 1, 1,
-0.4872569, -0.6213558, -2.621743, 1, 1, 1, 1, 1,
-0.4834509, 0.3257065, -0.1274537, 1, 1, 1, 1, 1,
-0.4824903, 1.181457, 0.2118121, 1, 1, 1, 1, 1,
-0.4817795, -1.487552, -3.811733, 1, 1, 1, 1, 1,
-0.4816683, -0.5543495, -1.469532, 1, 1, 1, 1, 1,
-0.4787456, 0.03797666, -2.112038, 1, 1, 1, 1, 1,
-0.4783699, -0.1899483, -1.559186, 0, 0, 1, 1, 1,
-0.4693275, -1.056499, -3.294546, 1, 0, 0, 1, 1,
-0.4686699, -0.03371477, -2.561069, 1, 0, 0, 1, 1,
-0.466772, 0.163343, 0.03671473, 1, 0, 0, 1, 1,
-0.4645702, 0.7740335, -0.5578301, 1, 0, 0, 1, 1,
-0.4629043, -1.74708, -2.261403, 1, 0, 0, 1, 1,
-0.4536346, -0.2258523, -1.668818, 0, 0, 0, 1, 1,
-0.4518082, -0.2887658, -1.614764, 0, 0, 0, 1, 1,
-0.4503107, -0.4326986, -0.9525622, 0, 0, 0, 1, 1,
-0.4472458, 1.995771, 0.4089968, 0, 0, 0, 1, 1,
-0.4454593, -0.7789756, -1.574669, 0, 0, 0, 1, 1,
-0.4440556, -1.038002, -2.236036, 0, 0, 0, 1, 1,
-0.4413613, -1.064532, -0.7835156, 0, 0, 0, 1, 1,
-0.4344393, -0.3289623, -0.9607761, 1, 1, 1, 1, 1,
-0.4320818, -0.07939231, -2.159984, 1, 1, 1, 1, 1,
-0.4201691, -1.593683, -3.799906, 1, 1, 1, 1, 1,
-0.4163246, 0.08831602, -2.430846, 1, 1, 1, 1, 1,
-0.4151022, 0.2882213, -1.271942, 1, 1, 1, 1, 1,
-0.4128521, -0.8461668, -3.357233, 1, 1, 1, 1, 1,
-0.4106222, -1.91113, -2.887527, 1, 1, 1, 1, 1,
-0.4021705, 0.2744538, -1.377893, 1, 1, 1, 1, 1,
-0.4014627, -0.2963673, -2.076936, 1, 1, 1, 1, 1,
-0.400884, 0.8984598, -0.04089471, 1, 1, 1, 1, 1,
-0.399578, 1.561672, -0.1499228, 1, 1, 1, 1, 1,
-0.397975, -1.243604, -2.854785, 1, 1, 1, 1, 1,
-0.3926124, -0.2950763, -2.313293, 1, 1, 1, 1, 1,
-0.3883682, -0.6990652, -2.654183, 1, 1, 1, 1, 1,
-0.3875078, 1.115876, -0.1941978, 1, 1, 1, 1, 1,
-0.3869221, -0.9696409, -2.548476, 0, 0, 1, 1, 1,
-0.3852818, -0.5432476, -1.879047, 1, 0, 0, 1, 1,
-0.3845209, -0.7250762, -2.369557, 1, 0, 0, 1, 1,
-0.3841139, 0.7983241, -0.9712815, 1, 0, 0, 1, 1,
-0.3810831, -1.317929, -1.264984, 1, 0, 0, 1, 1,
-0.3792111, -0.02572254, 0.123787, 1, 0, 0, 1, 1,
-0.3781098, -0.3259987, -1.929836, 0, 0, 0, 1, 1,
-0.3745271, -0.4681493, -2.69705, 0, 0, 0, 1, 1,
-0.3737311, 0.1349854, -1.241538, 0, 0, 0, 1, 1,
-0.3728465, 0.0635548, -1.923356, 0, 0, 0, 1, 1,
-0.3700582, -0.8651925, -1.754168, 0, 0, 0, 1, 1,
-0.3676525, 1.822733, 0.2395813, 0, 0, 0, 1, 1,
-0.367071, 0.6570246, -0.7281276, 0, 0, 0, 1, 1,
-0.3650197, 0.3378512, -0.593228, 1, 1, 1, 1, 1,
-0.3638796, -0.1298757, -3.017429, 1, 1, 1, 1, 1,
-0.3636543, -2.746571, -1.48121, 1, 1, 1, 1, 1,
-0.3631704, -0.529525, -2.795786, 1, 1, 1, 1, 1,
-0.359637, -0.06539712, -2.098164, 1, 1, 1, 1, 1,
-0.3545666, -0.8768802, -2.76187, 1, 1, 1, 1, 1,
-0.3490916, 1.369851, -0.5810745, 1, 1, 1, 1, 1,
-0.3482989, 0.6044395, -1.081167, 1, 1, 1, 1, 1,
-0.3443887, 0.2991226, -0.08317059, 1, 1, 1, 1, 1,
-0.3436851, -0.989006, -3.423581, 1, 1, 1, 1, 1,
-0.342973, -0.2987987, -2.085262, 1, 1, 1, 1, 1,
-0.340316, -0.0193677, -1.340539, 1, 1, 1, 1, 1,
-0.3382682, -1.180811, -2.768841, 1, 1, 1, 1, 1,
-0.3343439, 0.9409738, 0.04320522, 1, 1, 1, 1, 1,
-0.3302773, -1.398266, -2.131179, 1, 1, 1, 1, 1,
-0.3277181, -1.998747, -2.735772, 0, 0, 1, 1, 1,
-0.3220184, -1.893825, -3.621802, 1, 0, 0, 1, 1,
-0.3212305, 0.8181893, 0.2003996, 1, 0, 0, 1, 1,
-0.3200888, 0.5162628, -0.5453689, 1, 0, 0, 1, 1,
-0.3193044, -1.284744, -4.290705, 1, 0, 0, 1, 1,
-0.3191551, -0.06575928, -1.30905, 1, 0, 0, 1, 1,
-0.3128861, 0.9108112, 1.298337, 0, 0, 0, 1, 1,
-0.311893, 0.683788, -1.220361, 0, 0, 0, 1, 1,
-0.3107517, 0.7653499, -0.7083702, 0, 0, 0, 1, 1,
-0.3101921, 0.4220754, -0.2084573, 0, 0, 0, 1, 1,
-0.307291, 2.089823, 1.010256, 0, 0, 0, 1, 1,
-0.3021727, -0.4186679, -2.528697, 0, 0, 0, 1, 1,
-0.3020223, -0.6583185, -4.019325, 0, 0, 0, 1, 1,
-0.2949081, 0.5161989, 0.07676408, 1, 1, 1, 1, 1,
-0.2943283, -1.284458, -4.163106, 1, 1, 1, 1, 1,
-0.2942894, -1.510997, -3.525, 1, 1, 1, 1, 1,
-0.2939707, -1.756392, -2.957249, 1, 1, 1, 1, 1,
-0.2914893, -0.2531885, -1.950878, 1, 1, 1, 1, 1,
-0.2902567, -0.9853069, -4.824594, 1, 1, 1, 1, 1,
-0.2898575, 1.447789, -0.5798187, 1, 1, 1, 1, 1,
-0.2825774, -0.8474921, -3.449567, 1, 1, 1, 1, 1,
-0.2746533, 0.1924988, 0.3858694, 1, 1, 1, 1, 1,
-0.2743884, -0.01580406, -1.844391, 1, 1, 1, 1, 1,
-0.273752, -0.9020797, -1.868649, 1, 1, 1, 1, 1,
-0.2695235, -0.3756015, -2.444056, 1, 1, 1, 1, 1,
-0.2680995, -0.4943869, -2.446249, 1, 1, 1, 1, 1,
-0.2588666, -0.3219998, -3.664842, 1, 1, 1, 1, 1,
-0.2558968, -1.23919, -4.575049, 1, 1, 1, 1, 1,
-0.2553895, 0.3507136, -0.6950823, 0, 0, 1, 1, 1,
-0.2483927, -1.110683, -3.374496, 1, 0, 0, 1, 1,
-0.2483188, -0.7405271, -3.318769, 1, 0, 0, 1, 1,
-0.2424333, 1.300243, 0.5298203, 1, 0, 0, 1, 1,
-0.2383919, -0.5348583, -2.134885, 1, 0, 0, 1, 1,
-0.2353639, 0.8913985, -1.013803, 1, 0, 0, 1, 1,
-0.2343211, 0.5882995, -2.270967, 0, 0, 0, 1, 1,
-0.2343001, 1.505314, -0.4793907, 0, 0, 0, 1, 1,
-0.2323819, 0.9212409, 1.419271, 0, 0, 0, 1, 1,
-0.2317303, -0.5351437, -1.613299, 0, 0, 0, 1, 1,
-0.2282967, 0.06202512, -0.6765824, 0, 0, 0, 1, 1,
-0.2260638, 0.455117, -1.929952, 0, 0, 0, 1, 1,
-0.2161538, 0.42091, -0.2503278, 0, 0, 0, 1, 1,
-0.2143563, 1.160081, -0.4718055, 1, 1, 1, 1, 1,
-0.2136539, -0.2464213, -3.464313, 1, 1, 1, 1, 1,
-0.2129624, 0.3298633, -0.9187788, 1, 1, 1, 1, 1,
-0.2100453, -2.441032, -1.861797, 1, 1, 1, 1, 1,
-0.2078228, -0.5768984, -3.70975, 1, 1, 1, 1, 1,
-0.1961494, 0.09533567, -1.617372, 1, 1, 1, 1, 1,
-0.1953751, 0.7293416, -1.153484, 1, 1, 1, 1, 1,
-0.1945168, -2.605967, -2.617727, 1, 1, 1, 1, 1,
-0.1935453, 0.5212791, 0.6708558, 1, 1, 1, 1, 1,
-0.1898133, 0.1428876, 0.1211926, 1, 1, 1, 1, 1,
-0.1861176, 0.3420975, 0.3859279, 1, 1, 1, 1, 1,
-0.1836185, 0.585063, -0.4957052, 1, 1, 1, 1, 1,
-0.1788594, 0.1678695, -0.8550907, 1, 1, 1, 1, 1,
-0.1779705, 0.8073174, -0.3304221, 1, 1, 1, 1, 1,
-0.1738178, -0.7982295, -4.769948, 1, 1, 1, 1, 1,
-0.1730745, 0.8906775, 1.285801, 0, 0, 1, 1, 1,
-0.171562, -0.4188998, -0.9967698, 1, 0, 0, 1, 1,
-0.17065, -0.9763809, -3.257323, 1, 0, 0, 1, 1,
-0.1651207, -0.2002601, -2.63492, 1, 0, 0, 1, 1,
-0.1642432, 1.028962, -0.9869394, 1, 0, 0, 1, 1,
-0.1631734, 1.186704, -1.209789, 1, 0, 0, 1, 1,
-0.1478729, 0.1033668, -1.004547, 0, 0, 0, 1, 1,
-0.144953, 0.6283247, -0.4499583, 0, 0, 0, 1, 1,
-0.1438677, -0.6938667, -4.376227, 0, 0, 0, 1, 1,
-0.1422877, -1.52091, -3.738139, 0, 0, 0, 1, 1,
-0.1402568, 0.08041695, -1.759401, 0, 0, 0, 1, 1,
-0.1361642, 1.495923, -0.1567412, 0, 0, 0, 1, 1,
-0.1336079, 2.454442, -1.443004, 0, 0, 0, 1, 1,
-0.1325442, -0.5866705, -3.498549, 1, 1, 1, 1, 1,
-0.1320894, 2.014107, 0.16523, 1, 1, 1, 1, 1,
-0.129511, 0.3093742, -0.6138023, 1, 1, 1, 1, 1,
-0.1294325, -0.9946097, -3.814626, 1, 1, 1, 1, 1,
-0.1264648, 0.484345, -0.7433913, 1, 1, 1, 1, 1,
-0.1225992, 0.3032325, 0.1325614, 1, 1, 1, 1, 1,
-0.1214327, -2.174118, -3.506831, 1, 1, 1, 1, 1,
-0.1212166, 0.5276927, -0.8071615, 1, 1, 1, 1, 1,
-0.1208332, 0.6957571, -0.3332655, 1, 1, 1, 1, 1,
-0.1190198, -0.7438915, -2.019772, 1, 1, 1, 1, 1,
-0.1152796, -0.8155307, -1.341688, 1, 1, 1, 1, 1,
-0.1144299, -0.7607278, -2.287234, 1, 1, 1, 1, 1,
-0.1079362, -0.401713, -3.060631, 1, 1, 1, 1, 1,
-0.1044983, -1.297253, -3.529, 1, 1, 1, 1, 1,
-0.1035173, -0.686549, -1.964216, 1, 1, 1, 1, 1,
-0.1006452, 0.6740493, -0.3477475, 0, 0, 1, 1, 1,
-0.0985224, -0.2415544, -1.820745, 1, 0, 0, 1, 1,
-0.09577087, -1.434683, -2.434047, 1, 0, 0, 1, 1,
-0.09220547, 0.7356189, -1.136863, 1, 0, 0, 1, 1,
-0.0921581, 1.459166, -1.257524, 1, 0, 0, 1, 1,
-0.09088281, -0.3912145, -1.145349, 1, 0, 0, 1, 1,
-0.09015671, 0.6237953, -3.08087, 0, 0, 0, 1, 1,
-0.09010649, -0.4593838, -2.465994, 0, 0, 0, 1, 1,
-0.08837702, 0.4945891, -0.3627708, 0, 0, 0, 1, 1,
-0.08675554, 0.07248619, -3.054595, 0, 0, 0, 1, 1,
-0.08587969, -0.338086, -1.953858, 0, 0, 0, 1, 1,
-0.07896191, 0.509989, -0.7870417, 0, 0, 0, 1, 1,
-0.07762183, -2.118847, -0.6768112, 0, 0, 0, 1, 1,
-0.07630225, 1.289527, 0.4692401, 1, 1, 1, 1, 1,
-0.06156261, -0.8436956, -3.737016, 1, 1, 1, 1, 1,
-0.0562772, -0.2673235, -3.259465, 1, 1, 1, 1, 1,
-0.05490722, -1.385369, -3.891874, 1, 1, 1, 1, 1,
-0.05447925, 0.2509529, -1.867094, 1, 1, 1, 1, 1,
-0.0541544, 0.969192, -0.4678949, 1, 1, 1, 1, 1,
-0.05185669, -0.9871826, -3.190235, 1, 1, 1, 1, 1,
-0.05047328, -0.4683825, -3.588857, 1, 1, 1, 1, 1,
-0.04888583, -1.664847, -2.69277, 1, 1, 1, 1, 1,
-0.04420623, 0.8877715, -0.5530764, 1, 1, 1, 1, 1,
-0.04253277, -0.2363936, -5.362341, 1, 1, 1, 1, 1,
-0.0400716, 0.04014635, 1.269312, 1, 1, 1, 1, 1,
-0.03881407, -1.471099, -3.462398, 1, 1, 1, 1, 1,
-0.03237412, 1.101647, 0.5935401, 1, 1, 1, 1, 1,
-0.02988989, -0.8713735, -1.73995, 1, 1, 1, 1, 1,
-0.0289426, 1.236469, -0.9725758, 0, 0, 1, 1, 1,
-0.02774733, 0.11345, -0.9815891, 1, 0, 0, 1, 1,
-0.02614257, -1.245942, -3.653096, 1, 0, 0, 1, 1,
-0.02460226, 0.6811662, 0.614532, 1, 0, 0, 1, 1,
-0.01682171, -1.175052, -1.636065, 1, 0, 0, 1, 1,
-0.01655648, -1.032901, -2.896558, 1, 0, 0, 1, 1,
-0.009683727, 0.1198404, -1.090143, 0, 0, 0, 1, 1,
-0.004632408, 0.6280241, -1.06566, 0, 0, 0, 1, 1,
-0.002643177, 1.409423, 0.04609361, 0, 0, 0, 1, 1,
-0.001127457, 0.12221, -0.002809936, 0, 0, 0, 1, 1,
0.001207304, -2.517117, 3.712189, 0, 0, 0, 1, 1,
0.003853244, 2.222254, -0.3337324, 0, 0, 0, 1, 1,
0.00579993, -3.588613, 2.019113, 0, 0, 0, 1, 1,
0.009426363, 0.1375925, -0.6557716, 1, 1, 1, 1, 1,
0.01133533, 2.7472, 0.5523002, 1, 1, 1, 1, 1,
0.01154085, -0.4023502, 2.909631, 1, 1, 1, 1, 1,
0.01388417, -1.173066, 3.780614, 1, 1, 1, 1, 1,
0.01425411, 0.3719667, -0.6203763, 1, 1, 1, 1, 1,
0.01533752, 2.348264, -0.4054579, 1, 1, 1, 1, 1,
0.01920858, -0.2222537, 3.951851, 1, 1, 1, 1, 1,
0.02331589, -0.7289563, 4.077155, 1, 1, 1, 1, 1,
0.02511255, 0.9930977, 1.021521, 1, 1, 1, 1, 1,
0.02642875, -1.04753, 3.315282, 1, 1, 1, 1, 1,
0.02695657, 0.7631599, 1.386484, 1, 1, 1, 1, 1,
0.0299815, 0.8092643, 1.03407, 1, 1, 1, 1, 1,
0.03403302, 0.2519423, -0.3406864, 1, 1, 1, 1, 1,
0.03436266, 2.539095, 0.495803, 1, 1, 1, 1, 1,
0.03437031, -1.514459, 2.91821, 1, 1, 1, 1, 1,
0.03685906, -0.6739076, 3.306468, 0, 0, 1, 1, 1,
0.0401074, -0.001311585, 2.419089, 1, 0, 0, 1, 1,
0.04378604, -0.1382446, 3.456063, 1, 0, 0, 1, 1,
0.04587036, -0.4316571, 2.312228, 1, 0, 0, 1, 1,
0.05098052, -0.03052284, 1.050578, 1, 0, 0, 1, 1,
0.05296163, -0.6276478, 3.748247, 1, 0, 0, 1, 1,
0.05731662, 0.2596901, -0.001225857, 0, 0, 0, 1, 1,
0.0598398, -0.6568264, 4.704894, 0, 0, 0, 1, 1,
0.06121877, 2.379018, -0.4932452, 0, 0, 0, 1, 1,
0.06348514, 0.5236279, -0.2640312, 0, 0, 0, 1, 1,
0.06352904, -2.042844, 3.101803, 0, 0, 0, 1, 1,
0.06388828, 0.704415, 0.2479801, 0, 0, 0, 1, 1,
0.06405921, -0.4920161, 3.050359, 0, 0, 0, 1, 1,
0.06821777, 0.4251384, -0.6680143, 1, 1, 1, 1, 1,
0.06844774, 0.4193853, 0.3067668, 1, 1, 1, 1, 1,
0.06853875, 1.356864, -2.771229, 1, 1, 1, 1, 1,
0.0695839, 0.5671349, 0.4313583, 1, 1, 1, 1, 1,
0.06976323, -0.196713, 2.718625, 1, 1, 1, 1, 1,
0.07419793, -1.608002, 3.129958, 1, 1, 1, 1, 1,
0.07966555, 0.7298886, 0.4978564, 1, 1, 1, 1, 1,
0.08003246, 0.2310717, 0.7480553, 1, 1, 1, 1, 1,
0.08102053, -0.8888906, 3.304429, 1, 1, 1, 1, 1,
0.08151986, -0.2817824, 3.874552, 1, 1, 1, 1, 1,
0.08664428, 0.4827186, 0.6038883, 1, 1, 1, 1, 1,
0.09168497, -1.413477, 3.903469, 1, 1, 1, 1, 1,
0.09242305, -0.9496441, 1.860098, 1, 1, 1, 1, 1,
0.09406928, 0.04620751, 3.995378, 1, 1, 1, 1, 1,
0.09593023, 1.323054, 1.755614, 1, 1, 1, 1, 1,
0.09618544, 1.936681, -0.3424841, 0, 0, 1, 1, 1,
0.09741204, 0.01100361, 1.511813, 1, 0, 0, 1, 1,
0.09968299, 0.2994015, -0.4674006, 1, 0, 0, 1, 1,
0.1022179, -1.935074, 4.606264, 1, 0, 0, 1, 1,
0.1044887, -0.7143753, 3.145793, 1, 0, 0, 1, 1,
0.1050354, -0.8607593, 1.244116, 1, 0, 0, 1, 1,
0.1056569, 0.6013375, -0.2134382, 0, 0, 0, 1, 1,
0.1072495, 0.09977992, 0.400887, 0, 0, 0, 1, 1,
0.1095653, 0.5280164, 2.153015, 0, 0, 0, 1, 1,
0.1140524, 0.5490627, 1.678717, 0, 0, 0, 1, 1,
0.1184496, 0.5938659, 1.795721, 0, 0, 0, 1, 1,
0.1202815, 0.3648531, 0.8466915, 0, 0, 0, 1, 1,
0.1250515, 0.3996695, 0.5409295, 0, 0, 0, 1, 1,
0.1280599, -1.101861, 0.6933502, 1, 1, 1, 1, 1,
0.1320282, -0.02692496, 2.416988, 1, 1, 1, 1, 1,
0.1350356, -1.65549, 2.543288, 1, 1, 1, 1, 1,
0.1359075, 0.2058008, 3.500086, 1, 1, 1, 1, 1,
0.1373567, 0.7707251, -0.06719203, 1, 1, 1, 1, 1,
0.138227, -0.6497234, 1.762767, 1, 1, 1, 1, 1,
0.1402073, 1.786345, -1.745722, 1, 1, 1, 1, 1,
0.143737, 0.6872384, 0.6432057, 1, 1, 1, 1, 1,
0.1465989, 0.912909, -1.957125, 1, 1, 1, 1, 1,
0.1502526, -0.02451996, 1.710847, 1, 1, 1, 1, 1,
0.1519696, 0.5939506, 1.634505, 1, 1, 1, 1, 1,
0.156436, 0.606104, 1.332519, 1, 1, 1, 1, 1,
0.1582913, -1.533017, 2.957106, 1, 1, 1, 1, 1,
0.1585267, 0.7940452, -0.07566585, 1, 1, 1, 1, 1,
0.1593576, 1.890363, 0.4834613, 1, 1, 1, 1, 1,
0.1603479, 0.2612678, 0.4660111, 0, 0, 1, 1, 1,
0.1609365, -0.340478, 2.524018, 1, 0, 0, 1, 1,
0.1630416, 0.8407797, -0.8739071, 1, 0, 0, 1, 1,
0.1656669, -0.1561304, 1.613369, 1, 0, 0, 1, 1,
0.1667214, -0.5912937, 2.897595, 1, 0, 0, 1, 1,
0.167355, 2.054678, 0.5983669, 1, 0, 0, 1, 1,
0.1702363, 1.749582, 0.2149357, 0, 0, 0, 1, 1,
0.1730925, 1.053448, 0.4879249, 0, 0, 0, 1, 1,
0.1731475, 0.8335647, -1.867701, 0, 0, 0, 1, 1,
0.1736853, -1.155506, 2.871535, 0, 0, 0, 1, 1,
0.1773611, -1.867587, 1.886488, 0, 0, 0, 1, 1,
0.1776508, 1.653518, 0.9975386, 0, 0, 0, 1, 1,
0.180489, -0.3098042, 3.369062, 0, 0, 0, 1, 1,
0.180951, -1.885845, 4.31019, 1, 1, 1, 1, 1,
0.1827772, -0.7337742, 2.34235, 1, 1, 1, 1, 1,
0.1851579, -0.216154, 1.032793, 1, 1, 1, 1, 1,
0.1942373, -0.8386274, 4.406299, 1, 1, 1, 1, 1,
0.1943902, 0.9980063, 0.01912604, 1, 1, 1, 1, 1,
0.1971346, -2.47192, 4.519303, 1, 1, 1, 1, 1,
0.2028394, 0.1666033, 0.4297613, 1, 1, 1, 1, 1,
0.2050716, -0.3772149, 4.835155, 1, 1, 1, 1, 1,
0.206889, 0.07057971, 2.100383, 1, 1, 1, 1, 1,
0.2071266, -0.6627135, 1.796024, 1, 1, 1, 1, 1,
0.2071455, -0.64862, 1.779303, 1, 1, 1, 1, 1,
0.2134557, -2.808379, 3.360575, 1, 1, 1, 1, 1,
0.2153013, 2.433429, 0.6846704, 1, 1, 1, 1, 1,
0.2197865, 0.9342499, -0.9255103, 1, 1, 1, 1, 1,
0.2198451, -1.417353, 3.577917, 1, 1, 1, 1, 1,
0.2206836, -1.139761, 2.043988, 0, 0, 1, 1, 1,
0.2221344, -0.1510773, 0.4111875, 1, 0, 0, 1, 1,
0.2235556, -0.3100351, 2.469157, 1, 0, 0, 1, 1,
0.2362349, 0.9600369, -0.3489069, 1, 0, 0, 1, 1,
0.2381914, 0.4388313, 0.5061482, 1, 0, 0, 1, 1,
0.2392371, 0.8389301, 0.2274291, 1, 0, 0, 1, 1,
0.2394983, -1.593434, 4.428689, 0, 0, 0, 1, 1,
0.2400395, 1.649728, 1.165016, 0, 0, 0, 1, 1,
0.2408509, 0.6752752, 0.7436004, 0, 0, 0, 1, 1,
0.2498552, -0.6592249, 3.132616, 0, 0, 0, 1, 1,
0.2543231, 1.726915, 1.546252, 0, 0, 0, 1, 1,
0.2561712, -0.0290509, 2.508239, 0, 0, 0, 1, 1,
0.2565134, -0.9335367, 3.843288, 0, 0, 0, 1, 1,
0.2610122, -1.234533, 2.806414, 1, 1, 1, 1, 1,
0.2642748, -1.517286, 3.179962, 1, 1, 1, 1, 1,
0.2674178, -1.488181, 5.098593, 1, 1, 1, 1, 1,
0.2738831, 1.26316, 1.128744, 1, 1, 1, 1, 1,
0.2769389, 0.9081095, -2.727282, 1, 1, 1, 1, 1,
0.2790487, -0.8250711, 3.266017, 1, 1, 1, 1, 1,
0.2838435, 0.06433064, 0.8038395, 1, 1, 1, 1, 1,
0.2848191, -1.228511, 2.610984, 1, 1, 1, 1, 1,
0.2860968, 0.3424965, -0.2904288, 1, 1, 1, 1, 1,
0.2897578, 0.6427348, 1.66671, 1, 1, 1, 1, 1,
0.2930383, -0.8161306, 3.16242, 1, 1, 1, 1, 1,
0.2942704, 0.5362588, 1.698361, 1, 1, 1, 1, 1,
0.2967806, -0.5532086, 2.161417, 1, 1, 1, 1, 1,
0.2996188, 0.8896071, 0.6275473, 1, 1, 1, 1, 1,
0.3032518, -0.5520114, 3.708835, 1, 1, 1, 1, 1,
0.3056329, 1.237302, 0.6175956, 0, 0, 1, 1, 1,
0.3080559, 0.2183617, 1.664206, 1, 0, 0, 1, 1,
0.3137331, -0.1553862, 3.069859, 1, 0, 0, 1, 1,
0.3146498, -0.3597383, 2.480117, 1, 0, 0, 1, 1,
0.314966, 0.9526241, -0.4344787, 1, 0, 0, 1, 1,
0.320032, -0.06963214, 2.279891, 1, 0, 0, 1, 1,
0.322275, -0.3859358, 3.64525, 0, 0, 0, 1, 1,
0.3230017, -1.607458, 2.72733, 0, 0, 0, 1, 1,
0.3352267, 1.449843, 1.761315, 0, 0, 0, 1, 1,
0.3366146, 1.045927, -0.07732463, 0, 0, 0, 1, 1,
0.3389706, -0.4339097, 3.358337, 0, 0, 0, 1, 1,
0.3402514, -2.304995, 4.042075, 0, 0, 0, 1, 1,
0.3404094, -1.060057, 3.39195, 0, 0, 0, 1, 1,
0.3409162, 0.1633729, 0.5960521, 1, 1, 1, 1, 1,
0.346858, -1.368085, 2.571137, 1, 1, 1, 1, 1,
0.3472702, -0.3365697, 3.475141, 1, 1, 1, 1, 1,
0.347636, 0.01880159, 0.9708573, 1, 1, 1, 1, 1,
0.3537165, 0.8974925, 0.5633593, 1, 1, 1, 1, 1,
0.3566453, -1.240899, 2.303054, 1, 1, 1, 1, 1,
0.3581792, -1.663651, 2.693431, 1, 1, 1, 1, 1,
0.3608797, -0.9685151, 2.500551, 1, 1, 1, 1, 1,
0.3648766, -0.01241139, 4.85372, 1, 1, 1, 1, 1,
0.3711532, 0.8268091, 0.03937725, 1, 1, 1, 1, 1,
0.3731374, -1.506607, 2.086698, 1, 1, 1, 1, 1,
0.3741206, 0.124544, 0.743827, 1, 1, 1, 1, 1,
0.3752123, -0.1679108, 3.127049, 1, 1, 1, 1, 1,
0.3763127, -0.6877006, 1.024502, 1, 1, 1, 1, 1,
0.3779274, -0.409033, 2.044039, 1, 1, 1, 1, 1,
0.3820677, -1.405516, 1.606061, 0, 0, 1, 1, 1,
0.3826792, 1.222768, 0.8950306, 1, 0, 0, 1, 1,
0.38367, -1.115642, 3.18315, 1, 0, 0, 1, 1,
0.384965, -1.781522, 2.839742, 1, 0, 0, 1, 1,
0.3854056, 0.9427372, -0.02818409, 1, 0, 0, 1, 1,
0.392019, 0.6793492, -1.118033, 1, 0, 0, 1, 1,
0.3962876, 1.155348, 3.061343, 0, 0, 0, 1, 1,
0.3997271, -1.902993, 3.929952, 0, 0, 0, 1, 1,
0.4068415, -0.3173317, 1.170704, 0, 0, 0, 1, 1,
0.4108079, 1.620148, -1.166073, 0, 0, 0, 1, 1,
0.4115579, -0.1774277, 3.589628, 0, 0, 0, 1, 1,
0.4135784, 0.1834071, 0.6508374, 0, 0, 0, 1, 1,
0.416122, -0.8512539, -0.6121678, 0, 0, 0, 1, 1,
0.4278711, 0.3312831, 0.8563886, 1, 1, 1, 1, 1,
0.4354354, 0.1600616, 1.836067, 1, 1, 1, 1, 1,
0.4441476, -0.1211113, 1.209018, 1, 1, 1, 1, 1,
0.4470539, 0.6330178, 0.5757779, 1, 1, 1, 1, 1,
0.448789, -0.007196194, 0.6956283, 1, 1, 1, 1, 1,
0.4534955, -1.096929, 3.730597, 1, 1, 1, 1, 1,
0.4575962, 0.3950663, 1.629449, 1, 1, 1, 1, 1,
0.4585543, -1.407775, 3.55528, 1, 1, 1, 1, 1,
0.4588251, 0.9169399, 0.2831946, 1, 1, 1, 1, 1,
0.4602129, 0.8973493, 0.6091156, 1, 1, 1, 1, 1,
0.4610216, 0.8725464, 0.8497936, 1, 1, 1, 1, 1,
0.4678285, 0.2982441, 2.787931, 1, 1, 1, 1, 1,
0.4696868, 1.576407, -0.5460295, 1, 1, 1, 1, 1,
0.4755239, -0.7532041, 2.979805, 1, 1, 1, 1, 1,
0.4785001, -1.405494, 3.115831, 1, 1, 1, 1, 1,
0.4786664, -0.845593, 3.202835, 0, 0, 1, 1, 1,
0.4812871, 0.9056247, 2.626093, 1, 0, 0, 1, 1,
0.4833184, -0.001439598, 1.718409, 1, 0, 0, 1, 1,
0.4878556, 1.215826, -0.621465, 1, 0, 0, 1, 1,
0.488032, 1.194008, -0.5307227, 1, 0, 0, 1, 1,
0.4895515, -0.2308497, 2.452303, 1, 0, 0, 1, 1,
0.4913657, 1.00762, 0.5689961, 0, 0, 0, 1, 1,
0.4954128, -0.1793728, 2.672541, 0, 0, 0, 1, 1,
0.4963543, 1.365901, 2.602549, 0, 0, 0, 1, 1,
0.5056271, 1.753673, 0.3501743, 0, 0, 0, 1, 1,
0.5084134, 0.5192159, 1.929998, 0, 0, 0, 1, 1,
0.5106534, -1.37949, 2.42082, 0, 0, 0, 1, 1,
0.5116729, -1.001697, 2.508015, 0, 0, 0, 1, 1,
0.5120438, 0.2629491, -1.553732, 1, 1, 1, 1, 1,
0.5126198, -0.8454077, 3.231931, 1, 1, 1, 1, 1,
0.5140632, 0.07693882, 2.076447, 1, 1, 1, 1, 1,
0.5149848, -1.770483, 2.806629, 1, 1, 1, 1, 1,
0.5151058, 0.6138654, 2.039842, 1, 1, 1, 1, 1,
0.5204256, -0.2552949, 1.36337, 1, 1, 1, 1, 1,
0.5209659, 0.1516409, 1.00181, 1, 1, 1, 1, 1,
0.521098, 0.6997389, 0.5036771, 1, 1, 1, 1, 1,
0.5211582, -2.208495, 2.309104, 1, 1, 1, 1, 1,
0.5254942, 1.114457, 0.463211, 1, 1, 1, 1, 1,
0.5265661, -1.224136, 0.5510662, 1, 1, 1, 1, 1,
0.5291042, -1.300981, 2.508736, 1, 1, 1, 1, 1,
0.5291309, 1.87667, 0.5295018, 1, 1, 1, 1, 1,
0.5297614, -1.002351, 3.390749, 1, 1, 1, 1, 1,
0.5298719, 1.888551, -0.1396796, 1, 1, 1, 1, 1,
0.5323135, 1.001191, -0.2953171, 0, 0, 1, 1, 1,
0.5328782, -1.450348, 2.917374, 1, 0, 0, 1, 1,
0.5398845, 1.160422, 1.22867, 1, 0, 0, 1, 1,
0.5421625, -0.1265361, 0.66327, 1, 0, 0, 1, 1,
0.5430362, 1.956864, 2.079648, 1, 0, 0, 1, 1,
0.548601, -0.3921829, 1.859177, 1, 0, 0, 1, 1,
0.5490887, 0.9229121, 0.6916993, 0, 0, 0, 1, 1,
0.5499775, -2.575314, 2.23016, 0, 0, 0, 1, 1,
0.5513327, -1.110779, 4.650953, 0, 0, 0, 1, 1,
0.5557318, -1.55165, 5.010632, 0, 0, 0, 1, 1,
0.5577743, -0.6555524, 2.456106, 0, 0, 0, 1, 1,
0.5589287, -0.6132892, 4.588299, 0, 0, 0, 1, 1,
0.5638648, 0.2010268, 0.9838438, 0, 0, 0, 1, 1,
0.5638974, 2.36094, -0.2091072, 1, 1, 1, 1, 1,
0.5717068, 1.115058, -0.9998115, 1, 1, 1, 1, 1,
0.5725535, 0.5208473, 0.0207705, 1, 1, 1, 1, 1,
0.5730063, 0.9071034, 1.2773, 1, 1, 1, 1, 1,
0.5733649, 1.081115, 0.8914388, 1, 1, 1, 1, 1,
0.5781827, 2.475927, -0.04409776, 1, 1, 1, 1, 1,
0.5787854, -0.8676467, 2.897892, 1, 1, 1, 1, 1,
0.5795848, -0.2478382, 3.100591, 1, 1, 1, 1, 1,
0.5806013, 0.002869475, 0.397705, 1, 1, 1, 1, 1,
0.5910347, 0.7900237, 1.35033, 1, 1, 1, 1, 1,
0.5932882, -1.326932, 2.452731, 1, 1, 1, 1, 1,
0.5939359, 0.4878815, 1.00041, 1, 1, 1, 1, 1,
0.6011572, -1.31736, 2.408257, 1, 1, 1, 1, 1,
0.6018047, 1.043306, 0.3705329, 1, 1, 1, 1, 1,
0.6021389, -0.2052372, 2.945552, 1, 1, 1, 1, 1,
0.6024504, -0.3991061, 2.081344, 0, 0, 1, 1, 1,
0.61731, 0.7973175, 1.427153, 1, 0, 0, 1, 1,
0.6206439, -0.7805685, 3.096061, 1, 0, 0, 1, 1,
0.621786, 1.377747, -0.2314247, 1, 0, 0, 1, 1,
0.6367128, 1.718954, 0.1901397, 1, 0, 0, 1, 1,
0.6418667, -0.4778358, 3.271199, 1, 0, 0, 1, 1,
0.643542, -0.04400995, 0.7236837, 0, 0, 0, 1, 1,
0.6469679, -0.05898479, 1.038477, 0, 0, 0, 1, 1,
0.6502492, -0.1582329, 2.1105, 0, 0, 0, 1, 1,
0.6548602, -0.6423535, 0.1652031, 0, 0, 0, 1, 1,
0.6560535, -1.105513, 2.681368, 0, 0, 0, 1, 1,
0.6605482, -0.3433079, 2.717929, 0, 0, 0, 1, 1,
0.6667956, 0.139042, 1.505015, 0, 0, 0, 1, 1,
0.6693642, 0.6529112, 1.478836, 1, 1, 1, 1, 1,
0.6723474, 0.6698154, -0.4105583, 1, 1, 1, 1, 1,
0.6775276, -0.7892654, 1.506597, 1, 1, 1, 1, 1,
0.6909123, 0.7811088, 1.669183, 1, 1, 1, 1, 1,
0.6912302, -0.3397852, 1.423817, 1, 1, 1, 1, 1,
0.6921834, 1.095334, 0.9801992, 1, 1, 1, 1, 1,
0.6942668, 0.6719239, 1.123393, 1, 1, 1, 1, 1,
0.700411, -1.239427, 3.543547, 1, 1, 1, 1, 1,
0.7026418, -0.3718459, 1.725059, 1, 1, 1, 1, 1,
0.7039196, -0.2139648, 0.9286429, 1, 1, 1, 1, 1,
0.7043946, 0.6403658, 0.7770268, 1, 1, 1, 1, 1,
0.7116496, -0.4121341, 3.199595, 1, 1, 1, 1, 1,
0.7116991, -1.116384, 2.869994, 1, 1, 1, 1, 1,
0.7134809, 2.226566, 0.4329714, 1, 1, 1, 1, 1,
0.717992, -0.6785718, 3.806268, 1, 1, 1, 1, 1,
0.7213718, 0.8462621, 0.2361339, 0, 0, 1, 1, 1,
0.7231053, -0.7372916, 2.982803, 1, 0, 0, 1, 1,
0.7245578, 0.214393, -1.264537, 1, 0, 0, 1, 1,
0.726204, 0.5720133, -0.9529203, 1, 0, 0, 1, 1,
0.7274893, -0.8573852, 3.275795, 1, 0, 0, 1, 1,
0.7368476, 0.8848172, 2.042055, 1, 0, 0, 1, 1,
0.7380807, -0.9148306, 2.664129, 0, 0, 0, 1, 1,
0.7390814, -1.161605, 1.722277, 0, 0, 0, 1, 1,
0.7424294, -0.4195381, 1.924115, 0, 0, 0, 1, 1,
0.7427869, 1.189747, -0.6794229, 0, 0, 0, 1, 1,
0.7437398, -0.3369382, 1.957498, 0, 0, 0, 1, 1,
0.7437991, 1.369523, -0.8421184, 0, 0, 0, 1, 1,
0.7444436, 1.379007, 1.036973, 0, 0, 0, 1, 1,
0.7447996, 1.105763, 0.8950338, 1, 1, 1, 1, 1,
0.7453723, 0.5461348, -0.07238496, 1, 1, 1, 1, 1,
0.7457998, 0.9702396, -0.1243733, 1, 1, 1, 1, 1,
0.7471302, 0.9205803, 1.188191, 1, 1, 1, 1, 1,
0.7479132, -1.348228, 2.924839, 1, 1, 1, 1, 1,
0.7485863, -1.398902, 3.713593, 1, 1, 1, 1, 1,
0.751604, 0.6019112, -0.6001915, 1, 1, 1, 1, 1,
0.7583847, -0.7551293, 1.93818, 1, 1, 1, 1, 1,
0.7602404, 0.3424421, 1.332686, 1, 1, 1, 1, 1,
0.761197, 0.9986762, 0.6362832, 1, 1, 1, 1, 1,
0.7615403, -0.3379835, 3.322095, 1, 1, 1, 1, 1,
0.7619886, -0.5794338, 1.192692, 1, 1, 1, 1, 1,
0.7687684, 0.6297607, 2.134749, 1, 1, 1, 1, 1,
0.7717007, -1.599707, 4.156768, 1, 1, 1, 1, 1,
0.7779709, 0.1979571, 0.2145741, 1, 1, 1, 1, 1,
0.7944237, -2.257026, 2.373373, 0, 0, 1, 1, 1,
0.8003269, -0.02229186, 4.356359, 1, 0, 0, 1, 1,
0.8015202, -0.7974271, 1.24227, 1, 0, 0, 1, 1,
0.8070781, -0.3012522, 1.801722, 1, 0, 0, 1, 1,
0.8085197, -0.4516006, 4.047411, 1, 0, 0, 1, 1,
0.8128437, -1.114303, 3.129978, 1, 0, 0, 1, 1,
0.8190833, 0.7731182, -0.6614492, 0, 0, 0, 1, 1,
0.8237745, -0.6809404, 2.645578, 0, 0, 0, 1, 1,
0.8263924, 1.030498, 0.9033307, 0, 0, 0, 1, 1,
0.8278283, 0.08775128, 2.179151, 0, 0, 0, 1, 1,
0.8296499, -0.7121376, 1.793431, 0, 0, 0, 1, 1,
0.8398169, 0.8605973, 1.759351, 0, 0, 0, 1, 1,
0.8453498, 0.2095457, 0.112656, 0, 0, 0, 1, 1,
0.8578269, 0.6742415, -1.190597, 1, 1, 1, 1, 1,
0.8615772, -1.424097, 1.924579, 1, 1, 1, 1, 1,
0.8651255, -0.7769251, 0.9088479, 1, 1, 1, 1, 1,
0.882135, 0.8732475, -0.9881005, 1, 1, 1, 1, 1,
0.8827925, 0.7803293, 0.5884371, 1, 1, 1, 1, 1,
0.8833288, -1.570982, 2.162586, 1, 1, 1, 1, 1,
0.8847301, 0.3327198, 2.082354, 1, 1, 1, 1, 1,
0.8934794, 1.782875, 1.294571, 1, 1, 1, 1, 1,
0.8957604, 0.05868434, 1.292553, 1, 1, 1, 1, 1,
0.9038959, -0.4123796, 2.479024, 1, 1, 1, 1, 1,
0.9087692, -0.3629441, 2.705896, 1, 1, 1, 1, 1,
0.9166319, -2.378864, 1.819866, 1, 1, 1, 1, 1,
0.9175293, 0.969315, 0.7349004, 1, 1, 1, 1, 1,
0.9223111, -0.1229891, 0.6109774, 1, 1, 1, 1, 1,
0.9233479, -0.587252, 3.182012, 1, 1, 1, 1, 1,
0.9278642, 1.343357, 1.32636, 0, 0, 1, 1, 1,
0.9286633, -1.994, 2.380584, 1, 0, 0, 1, 1,
0.9305964, 0.4851756, -0.2869608, 1, 0, 0, 1, 1,
0.9324274, -0.5888458, 2.695103, 1, 0, 0, 1, 1,
0.9362929, -0.04810167, 1.993929, 1, 0, 0, 1, 1,
0.9377022, 1.657172, 0.1048929, 1, 0, 0, 1, 1,
0.9435635, -0.06267487, 1.778151, 0, 0, 0, 1, 1,
0.9494551, 2.147685, 2.390899, 0, 0, 0, 1, 1,
0.9529898, -0.9384155, 4.358021, 0, 0, 0, 1, 1,
0.9601974, -0.08897613, 1.947636, 0, 0, 0, 1, 1,
0.9709628, 1.002681, -0.2799991, 0, 0, 0, 1, 1,
0.9712847, -1.072697, 4.002512, 0, 0, 0, 1, 1,
0.9806288, -1.947689, 1.673428, 0, 0, 0, 1, 1,
0.9864925, 0.4706349, -0.6145075, 1, 1, 1, 1, 1,
0.9866746, 0.9577951, -0.7051342, 1, 1, 1, 1, 1,
0.9934366, -2.645809, 2.679208, 1, 1, 1, 1, 1,
1.00748, -0.988956, 4.000631, 1, 1, 1, 1, 1,
1.007761, 1.01206, -0.06553195, 1, 1, 1, 1, 1,
1.008895, 0.2846649, 1.289457, 1, 1, 1, 1, 1,
1.011168, -0.6912291, 3.60289, 1, 1, 1, 1, 1,
1.014692, -1.197998, 1.516636, 1, 1, 1, 1, 1,
1.01656, 1.189498, 1.849213, 1, 1, 1, 1, 1,
1.017277, -0.9081749, 3.22876, 1, 1, 1, 1, 1,
1.018417, -0.4333053, 2.353766, 1, 1, 1, 1, 1,
1.026118, 0.67536, 3.227049, 1, 1, 1, 1, 1,
1.032638, 0.1922002, 0.3489037, 1, 1, 1, 1, 1,
1.044927, -0.9088155, 1.946167, 1, 1, 1, 1, 1,
1.045856, 0.7221908, 1.308142, 1, 1, 1, 1, 1,
1.048561, 0.1749222, 2.816869, 0, 0, 1, 1, 1,
1.051473, -0.6756345, 1.705771, 1, 0, 0, 1, 1,
1.053168, -0.9577507, 0.9638938, 1, 0, 0, 1, 1,
1.053386, 0.1893863, 0.2356924, 1, 0, 0, 1, 1,
1.055104, -0.1998009, 3.822419, 1, 0, 0, 1, 1,
1.059937, -0.1171112, 1.640128, 1, 0, 0, 1, 1,
1.061765, -1.142267, 3.866167, 0, 0, 0, 1, 1,
1.063346, 2.75457, 1.846477, 0, 0, 0, 1, 1,
1.063731, 0.6173747, 2.088897, 0, 0, 0, 1, 1,
1.063888, 0.7124555, 1.163774, 0, 0, 0, 1, 1,
1.065169, -1.616847, 2.17912, 0, 0, 0, 1, 1,
1.06643, 1.227287, 0.7110438, 0, 0, 0, 1, 1,
1.068648, -0.3745204, 1.575121, 0, 0, 0, 1, 1,
1.073115, 0.9099674, 2.417533, 1, 1, 1, 1, 1,
1.075986, 0.724938, -0.1071589, 1, 1, 1, 1, 1,
1.07887, -1.057919, 3.613796, 1, 1, 1, 1, 1,
1.082042, 1.550501, 1.089978, 1, 1, 1, 1, 1,
1.0867, -0.5402077, 1.027676, 1, 1, 1, 1, 1,
1.09784, 0.3156394, 1.502962, 1, 1, 1, 1, 1,
1.101361, 2.178205, 0.02705761, 1, 1, 1, 1, 1,
1.108997, 1.125108, -0.1570813, 1, 1, 1, 1, 1,
1.116051, 1.037087, 0.6938756, 1, 1, 1, 1, 1,
1.121988, -0.8023437, 4.67188, 1, 1, 1, 1, 1,
1.124009, 0.9076202, 2.851921, 1, 1, 1, 1, 1,
1.130336, -0.1133755, 1.970196, 1, 1, 1, 1, 1,
1.141504, 1.653289, 0.193311, 1, 1, 1, 1, 1,
1.144088, 0.7946025, 2.503312, 1, 1, 1, 1, 1,
1.144964, -0.5474404, 1.793427, 1, 1, 1, 1, 1,
1.148052, -0.7450335, 3.239066, 0, 0, 1, 1, 1,
1.150091, -1.116247, 1.577383, 1, 0, 0, 1, 1,
1.151491, 1.508236, -0.1964768, 1, 0, 0, 1, 1,
1.166878, -0.1148197, 2.199841, 1, 0, 0, 1, 1,
1.166894, -1.598608, 0.7526695, 1, 0, 0, 1, 1,
1.167443, 0.3241304, 1.480503, 1, 0, 0, 1, 1,
1.16877, -1.657902, 3.657838, 0, 0, 0, 1, 1,
1.172583, 0.2891491, 2.140598, 0, 0, 0, 1, 1,
1.173514, -0.3972203, 2.327479, 0, 0, 0, 1, 1,
1.175612, 0.9463904, -0.3204555, 0, 0, 0, 1, 1,
1.176482, -1.001011, 3.594613, 0, 0, 0, 1, 1,
1.180898, 1.33951, -0.0266767, 0, 0, 0, 1, 1,
1.180921, -0.4838544, 2.37182, 0, 0, 0, 1, 1,
1.181878, -0.6896214, 3.337496, 1, 1, 1, 1, 1,
1.182634, -0.1680581, 2.464734, 1, 1, 1, 1, 1,
1.184048, 1.233211, -0.6177054, 1, 1, 1, 1, 1,
1.195935, 0.7913558, 0.7766157, 1, 1, 1, 1, 1,
1.199189, -0.7284798, 3.344838, 1, 1, 1, 1, 1,
1.201048, -0.6373063, 2.443788, 1, 1, 1, 1, 1,
1.207339, 0.2525259, 1.876856, 1, 1, 1, 1, 1,
1.208194, -0.3797139, 2.697258, 1, 1, 1, 1, 1,
1.208489, -0.7721184, 1.140536, 1, 1, 1, 1, 1,
1.214067, 0.2195484, 2.300712, 1, 1, 1, 1, 1,
1.217163, 0.664082, 0.8904806, 1, 1, 1, 1, 1,
1.217197, 0.2247035, 0.9694255, 1, 1, 1, 1, 1,
1.219307, 0.3961603, 2.557536, 1, 1, 1, 1, 1,
1.220586, -0.2306127, 1.342942, 1, 1, 1, 1, 1,
1.223752, 1.861223, 0.0709724, 1, 1, 1, 1, 1,
1.236158, -1.669737, 3.524038, 0, 0, 1, 1, 1,
1.249593, -0.8545522, 1.568896, 1, 0, 0, 1, 1,
1.250608, 0.1576474, -0.09637645, 1, 0, 0, 1, 1,
1.252531, 0.03041371, -1.444869, 1, 0, 0, 1, 1,
1.265074, 0.592952, 1.648217, 1, 0, 0, 1, 1,
1.269311, -1.995318, 3.399826, 1, 0, 0, 1, 1,
1.276526, -0.752468, 2.531867, 0, 0, 0, 1, 1,
1.290503, -0.4477697, 2.209137, 0, 0, 0, 1, 1,
1.296504, -1.813386, 1.753723, 0, 0, 0, 1, 1,
1.301432, -0.5080508, 2.747128, 0, 0, 0, 1, 1,
1.302523, 1.872436, 0.8799862, 0, 0, 0, 1, 1,
1.306659, -1.03254, 2.634321, 0, 0, 0, 1, 1,
1.307895, -1.074327, 2.096949, 0, 0, 0, 1, 1,
1.312522, -1.068128, 2.206596, 1, 1, 1, 1, 1,
1.314098, 2.267083, 1.05591, 1, 1, 1, 1, 1,
1.321418, 0.2221938, 0.5145664, 1, 1, 1, 1, 1,
1.323573, 0.1298903, 2.551206, 1, 1, 1, 1, 1,
1.332471, -2.876239, 1.399969, 1, 1, 1, 1, 1,
1.340485, 0.8507751, 1.79452, 1, 1, 1, 1, 1,
1.351821, -0.9913375, 1.711612, 1, 1, 1, 1, 1,
1.356246, -0.5169863, 1.758142, 1, 1, 1, 1, 1,
1.371676, 0.4519752, 0.47965, 1, 1, 1, 1, 1,
1.377632, -1.181834, 2.699996, 1, 1, 1, 1, 1,
1.382937, -0.6031882, 1.947842, 1, 1, 1, 1, 1,
1.383527, 1.007054, 0.7039384, 1, 1, 1, 1, 1,
1.386521, -1.441672, 3.051688, 1, 1, 1, 1, 1,
1.393055, -1.008285, 2.374082, 1, 1, 1, 1, 1,
1.402506, 0.7225578, 1.136317, 1, 1, 1, 1, 1,
1.405355, 1.289088, 0.08629646, 0, 0, 1, 1, 1,
1.411014, 0.1076309, -0.4902429, 1, 0, 0, 1, 1,
1.433482, -0.8711799, 3.192587, 1, 0, 0, 1, 1,
1.436331, 0.2313931, 2.357158, 1, 0, 0, 1, 1,
1.441853, 0.5707583, 1.675646, 1, 0, 0, 1, 1,
1.447799, 1.823368, 0.9053748, 1, 0, 0, 1, 1,
1.448238, -1.471163, 2.640846, 0, 0, 0, 1, 1,
1.463877, -1.797472, 1.385914, 0, 0, 0, 1, 1,
1.469114, 0.923446, 0.892821, 0, 0, 0, 1, 1,
1.471927, 1.612718, -1.720281, 0, 0, 0, 1, 1,
1.473286, 1.135847, -0.1273163, 0, 0, 0, 1, 1,
1.476521, -0.3710514, 0.9754287, 0, 0, 0, 1, 1,
1.490398, 0.2360841, 1.809699, 0, 0, 0, 1, 1,
1.506237, 0.7760025, 0.903603, 1, 1, 1, 1, 1,
1.53115, -2.613092, 3.56991, 1, 1, 1, 1, 1,
1.538296, -0.6544207, 1.442507, 1, 1, 1, 1, 1,
1.539831, -0.2472725, 0.6140012, 1, 1, 1, 1, 1,
1.545906, -1.075917, 1.936038, 1, 1, 1, 1, 1,
1.560236, 1.877391, -0.2445751, 1, 1, 1, 1, 1,
1.564471, -0.9037788, 1.69074, 1, 1, 1, 1, 1,
1.568918, 0.0481885, 2.927803, 1, 1, 1, 1, 1,
1.612141, -0.6530977, 1.28046, 1, 1, 1, 1, 1,
1.614642, 0.1142499, -0.3390783, 1, 1, 1, 1, 1,
1.618197, 0.3085653, 1.536677, 1, 1, 1, 1, 1,
1.618323, -0.03210435, 0.8293785, 1, 1, 1, 1, 1,
1.618755, 1.248618, 0.9161163, 1, 1, 1, 1, 1,
1.634088, 0.2807689, 0.8917776, 1, 1, 1, 1, 1,
1.640075, -0.1843379, 0.6441146, 1, 1, 1, 1, 1,
1.673052, -0.4311327, 0.4796332, 0, 0, 1, 1, 1,
1.691428, 0.1609637, 0.8173907, 1, 0, 0, 1, 1,
1.697993, -0.1959509, 0.9820349, 1, 0, 0, 1, 1,
1.70559, 0.4940861, 2.047682, 1, 0, 0, 1, 1,
1.721934, -0.5627747, 3.694579, 1, 0, 0, 1, 1,
1.758178, 0.2130557, 0.4700133, 1, 0, 0, 1, 1,
1.789427, -0.7169254, 1.487371, 0, 0, 0, 1, 1,
1.828384, -0.3624291, 1.62896, 0, 0, 0, 1, 1,
1.83471, -0.6757384, -0.4923447, 0, 0, 0, 1, 1,
1.840411, 0.7943041, 0.8340725, 0, 0, 0, 1, 1,
1.847828, 0.58005, 0.169051, 0, 0, 0, 1, 1,
1.866226, -0.7049347, 0.7848902, 0, 0, 0, 1, 1,
1.879232, 0.5204543, 2.766055, 0, 0, 0, 1, 1,
1.880131, -0.05767145, 1.705525, 1, 1, 1, 1, 1,
1.891381, -1.135407, 1.217079, 1, 1, 1, 1, 1,
1.901086, -0.6488738, 0.6625137, 1, 1, 1, 1, 1,
1.910144, 0.2310372, 1.204652, 1, 1, 1, 1, 1,
1.91018, -1.095441, 3.204251, 1, 1, 1, 1, 1,
1.917373, 1.198412, 3.075457, 1, 1, 1, 1, 1,
1.947345, -1.263743, 2.574216, 1, 1, 1, 1, 1,
1.949826, 0.2523958, -0.408911, 1, 1, 1, 1, 1,
1.959374, 0.8282992, 1.465241, 1, 1, 1, 1, 1,
1.964375, 0.3636561, 2.261269, 1, 1, 1, 1, 1,
1.96572, -0.5290034, 2.316767, 1, 1, 1, 1, 1,
1.976203, 0.9846747, 1.169398, 1, 1, 1, 1, 1,
1.983742, -0.5531815, 2.628872, 1, 1, 1, 1, 1,
2.034076, -0.9486645, 1.330291, 1, 1, 1, 1, 1,
2.053621, -0.1112942, 2.654804, 1, 1, 1, 1, 1,
2.062706, 0.4224943, 1.931376, 0, 0, 1, 1, 1,
2.072393, 1.546411, 0.3060028, 1, 0, 0, 1, 1,
2.083835, -0.9683181, 3.097312, 1, 0, 0, 1, 1,
2.13586, 0.1587627, 2.423536, 1, 0, 0, 1, 1,
2.173428, 1.186134, 2.065075, 1, 0, 0, 1, 1,
2.18744, -0.174647, 1.72218, 1, 0, 0, 1, 1,
2.208931, 0.8405722, 2.144628, 0, 0, 0, 1, 1,
2.209715, 0.3519309, 1.930365, 0, 0, 0, 1, 1,
2.213936, -0.9958811, 2.037887, 0, 0, 0, 1, 1,
2.230978, 0.9222161, 0.8180224, 0, 0, 0, 1, 1,
2.281441, -0.7720103, 2.717048, 0, 0, 0, 1, 1,
2.332915, 0.3069947, 1.920051, 0, 0, 0, 1, 1,
2.335277, -0.08622094, 1.955102, 0, 0, 0, 1, 1,
2.372005, -0.6904335, 2.614694, 1, 1, 1, 1, 1,
2.540436, -0.1540912, 0.9270629, 1, 1, 1, 1, 1,
2.600583, -1.753486, -0.870122, 1, 1, 1, 1, 1,
2.626479, -1.269168, 3.441189, 1, 1, 1, 1, 1,
2.887466, 0.7248564, 0.6692397, 1, 1, 1, 1, 1,
3.301187, 0.5436006, -0.08557868, 1, 1, 1, 1, 1,
3.356171, 0.01236649, 2.712851, 1, 1, 1, 1, 1
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
var radius = 9.668317;
var distance = 33.95955;
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
mvMatrix.translate( -0.1424403, 0.3664068, 0.3566861 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95955);
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