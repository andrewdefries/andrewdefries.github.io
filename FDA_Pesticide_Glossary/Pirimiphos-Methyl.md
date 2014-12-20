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
-2.816747, -0.7091792, -1.86666, 1, 0, 0, 1,
-2.632769, 0.7767793, -0.7287279, 1, 0.007843138, 0, 1,
-2.632128, 0.5655479, -2.881219, 1, 0.01176471, 0, 1,
-2.609613, -0.3381732, 0.01795792, 1, 0.01960784, 0, 1,
-2.60439, 0.3532143, -0.1685592, 1, 0.02352941, 0, 1,
-2.508425, -0.4633434, -3.516444, 1, 0.03137255, 0, 1,
-2.424541, -0.3825448, 0.2794689, 1, 0.03529412, 0, 1,
-2.369364, -2.048016, -0.4071632, 1, 0.04313726, 0, 1,
-2.347928, 2.587485, -0.1994205, 1, 0.04705882, 0, 1,
-2.306939, -1.464969, -3.561445, 1, 0.05490196, 0, 1,
-2.285726, -1.47012, -3.754626, 1, 0.05882353, 0, 1,
-2.27273, 0.3326855, -0.3573031, 1, 0.06666667, 0, 1,
-2.265304, -1.288398, -1.287277, 1, 0.07058824, 0, 1,
-2.264992, 2.139503, -1.409968, 1, 0.07843138, 0, 1,
-2.247324, -0.3062916, -2.567811, 1, 0.08235294, 0, 1,
-2.211987, 1.882199, 1.66231, 1, 0.09019608, 0, 1,
-2.168137, -0.07725822, -2.691909, 1, 0.09411765, 0, 1,
-2.064976, 0.05054552, -1.878378, 1, 0.1019608, 0, 1,
-2.048113, -0.8120132, -1.445337, 1, 0.1098039, 0, 1,
-2.038401, 0.6169138, -1.558766, 1, 0.1137255, 0, 1,
-2.026966, -0.1699222, -1.720641, 1, 0.1215686, 0, 1,
-2.016103, 0.7128133, -1.490468, 1, 0.1254902, 0, 1,
-2.001904, 0.452914, -0.7824461, 1, 0.1333333, 0, 1,
-1.994755, -1.296374, -2.552905, 1, 0.1372549, 0, 1,
-1.974762, -0.4320881, -0.2531664, 1, 0.145098, 0, 1,
-1.959527, 0.03092061, -0.7271217, 1, 0.1490196, 0, 1,
-1.944687, -1.711097, -2.371783, 1, 0.1568628, 0, 1,
-1.944552, -0.7826548, -1.128137, 1, 0.1607843, 0, 1,
-1.942524, 0.1741597, -0.03635556, 1, 0.1686275, 0, 1,
-1.912095, 1.482836, -2.303264, 1, 0.172549, 0, 1,
-1.902473, 0.5002615, -1.890169, 1, 0.1803922, 0, 1,
-1.897693, 0.7351018, -3.141047, 1, 0.1843137, 0, 1,
-1.891343, -0.6112263, -2.575992, 1, 0.1921569, 0, 1,
-1.879029, -0.4091345, -3.055874, 1, 0.1960784, 0, 1,
-1.789067, -0.4182467, -3.598805, 1, 0.2039216, 0, 1,
-1.774949, -1.207549, -3.452596, 1, 0.2117647, 0, 1,
-1.746507, 0.6701015, -0.1527549, 1, 0.2156863, 0, 1,
-1.725779, -1.202855, -1.457012, 1, 0.2235294, 0, 1,
-1.719682, 0.1434415, -0.8784236, 1, 0.227451, 0, 1,
-1.694625, -2.335652, -2.152313, 1, 0.2352941, 0, 1,
-1.692319, -0.1034004, -0.6449878, 1, 0.2392157, 0, 1,
-1.691902, -1.048647, -0.9183195, 1, 0.2470588, 0, 1,
-1.666166, 1.448156, -1.189992, 1, 0.2509804, 0, 1,
-1.661068, -0.9057004, -2.101725, 1, 0.2588235, 0, 1,
-1.651314, 1.943404, -1.594871, 1, 0.2627451, 0, 1,
-1.65063, 0.8876679, 0.7772345, 1, 0.2705882, 0, 1,
-1.629386, 0.3402708, -0.92934, 1, 0.2745098, 0, 1,
-1.627272, -0.3891748, -2.544282, 1, 0.282353, 0, 1,
-1.623975, 0.07026524, -3.772102, 1, 0.2862745, 0, 1,
-1.613339, -0.253484, -3.999449, 1, 0.2941177, 0, 1,
-1.609128, 0.5564693, -0.8069791, 1, 0.3019608, 0, 1,
-1.596712, -1.016976, -3.132367, 1, 0.3058824, 0, 1,
-1.595281, -0.5224434, -1.080816, 1, 0.3137255, 0, 1,
-1.593333, 1.045112, -1.378132, 1, 0.3176471, 0, 1,
-1.587051, 1.139316, 0.1991701, 1, 0.3254902, 0, 1,
-1.580965, 0.5575964, -1.904566, 1, 0.3294118, 0, 1,
-1.580491, -0.2626998, -2.878549, 1, 0.3372549, 0, 1,
-1.580302, 0.9251451, -1.643431, 1, 0.3411765, 0, 1,
-1.568424, 0.06836204, -1.83523, 1, 0.3490196, 0, 1,
-1.555964, 1.956044, 0.7661953, 1, 0.3529412, 0, 1,
-1.553785, -0.9900367, -1.473264, 1, 0.3607843, 0, 1,
-1.543852, 1.065056, -0.8346506, 1, 0.3647059, 0, 1,
-1.540793, -0.925364, -1.901363, 1, 0.372549, 0, 1,
-1.528026, -0.3306189, -0.9909598, 1, 0.3764706, 0, 1,
-1.52112, -0.1248691, -0.8022493, 1, 0.3843137, 0, 1,
-1.513594, 1.295871, -2.52114, 1, 0.3882353, 0, 1,
-1.499127, 0.03484443, -1.473117, 1, 0.3960784, 0, 1,
-1.491439, 0.6974027, -0.1087438, 1, 0.4039216, 0, 1,
-1.486491, -0.8901151, -1.329331, 1, 0.4078431, 0, 1,
-1.4862, -2.868202, -3.355655, 1, 0.4156863, 0, 1,
-1.48576, -0.7153947, -1.864691, 1, 0.4196078, 0, 1,
-1.482796, 0.2838156, -1.93065, 1, 0.427451, 0, 1,
-1.462036, 0.3950506, -1.480101, 1, 0.4313726, 0, 1,
-1.459054, -1.583979, -3.344985, 1, 0.4392157, 0, 1,
-1.449996, 0.4401534, -1.193439, 1, 0.4431373, 0, 1,
-1.448446, -2.04016, -2.418083, 1, 0.4509804, 0, 1,
-1.441921, 0.2536721, -1.338622, 1, 0.454902, 0, 1,
-1.440518, -0.1840492, -1.739294, 1, 0.4627451, 0, 1,
-1.439006, 0.2326493, -1.311872, 1, 0.4666667, 0, 1,
-1.430715, -1.515812, -2.503747, 1, 0.4745098, 0, 1,
-1.428548, 1.146019, -0.9005219, 1, 0.4784314, 0, 1,
-1.421379, 1.704171, -1.317436, 1, 0.4862745, 0, 1,
-1.421044, 0.5940191, -0.5820013, 1, 0.4901961, 0, 1,
-1.418839, 1.389783, -1.497579, 1, 0.4980392, 0, 1,
-1.411799, -1.640949, -4.48466, 1, 0.5058824, 0, 1,
-1.411448, -2.012186, -3.476413, 1, 0.509804, 0, 1,
-1.4051, 0.8899164, -0.4966642, 1, 0.5176471, 0, 1,
-1.405088, -1.18572, -2.446122, 1, 0.5215687, 0, 1,
-1.399679, 0.416583, -1.628346, 1, 0.5294118, 0, 1,
-1.396902, -1.458935, -1.804581, 1, 0.5333334, 0, 1,
-1.391296, 0.2375412, 0.392249, 1, 0.5411765, 0, 1,
-1.375229, 0.04198116, -0.6242786, 1, 0.5450981, 0, 1,
-1.367456, -0.01449866, 0.3506868, 1, 0.5529412, 0, 1,
-1.359703, -1.406695, -2.235447, 1, 0.5568628, 0, 1,
-1.358227, 1.092551, 1.293595, 1, 0.5647059, 0, 1,
-1.354937, 1.073755, -0.7092446, 1, 0.5686275, 0, 1,
-1.351, 2.041917, -0.01632676, 1, 0.5764706, 0, 1,
-1.350399, -0.1068653, -2.639646, 1, 0.5803922, 0, 1,
-1.344735, -1.280231, -2.925605, 1, 0.5882353, 0, 1,
-1.342552, 1.521505, 1.211271, 1, 0.5921569, 0, 1,
-1.338678, 1.333351, -2.036798, 1, 0.6, 0, 1,
-1.329375, -0.2074513, -2.679014, 1, 0.6078432, 0, 1,
-1.327095, 0.3737139, -2.229188, 1, 0.6117647, 0, 1,
-1.324379, -1.762647, -1.534516, 1, 0.6196079, 0, 1,
-1.319592, -0.5513018, -3.552573, 1, 0.6235294, 0, 1,
-1.319411, -0.1004703, -0.1157471, 1, 0.6313726, 0, 1,
-1.306996, -1.41282, -2.521698, 1, 0.6352941, 0, 1,
-1.305377, 0.9219947, -0.3833388, 1, 0.6431373, 0, 1,
-1.297536, -0.2453295, -1.39468, 1, 0.6470588, 0, 1,
-1.284683, -3.01257, -2.552237, 1, 0.654902, 0, 1,
-1.280322, 0.1748758, -1.934874, 1, 0.6588235, 0, 1,
-1.277334, -1.16443, -2.824189, 1, 0.6666667, 0, 1,
-1.277239, 0.623032, -0.958725, 1, 0.6705883, 0, 1,
-1.273283, -1.280839, -0.911762, 1, 0.6784314, 0, 1,
-1.273218, 0.8893549, -1.310173, 1, 0.682353, 0, 1,
-1.270202, -1.786599, -2.949364, 1, 0.6901961, 0, 1,
-1.269333, 0.5060954, -2.888401, 1, 0.6941177, 0, 1,
-1.26802, 0.4649274, -2.285846, 1, 0.7019608, 0, 1,
-1.252217, 0.7252103, -0.01554591, 1, 0.7098039, 0, 1,
-1.246454, -0.1217182, -2.001118, 1, 0.7137255, 0, 1,
-1.225312, 0.09526748, -0.9524909, 1, 0.7215686, 0, 1,
-1.22146, 0.3121795, -1.619687, 1, 0.7254902, 0, 1,
-1.216637, -0.2253019, -0.8840117, 1, 0.7333333, 0, 1,
-1.208021, 1.323879, 1.217571, 1, 0.7372549, 0, 1,
-1.192133, 0.5236547, -0.817638, 1, 0.7450981, 0, 1,
-1.183236, -0.4584782, -0.3743072, 1, 0.7490196, 0, 1,
-1.161844, -1.563861, -2.948958, 1, 0.7568628, 0, 1,
-1.160921, -1.672101, -2.065481, 1, 0.7607843, 0, 1,
-1.153306, 0.06157891, -0.5255259, 1, 0.7686275, 0, 1,
-1.152126, 1.552234, -1.496226, 1, 0.772549, 0, 1,
-1.151364, -1.878188, -2.306159, 1, 0.7803922, 0, 1,
-1.149767, -0.5719056, -2.746144, 1, 0.7843137, 0, 1,
-1.147769, 0.3690785, -3.428801, 1, 0.7921569, 0, 1,
-1.138894, -1.168932, -2.240377, 1, 0.7960784, 0, 1,
-1.137761, 1.559906, 0.1292554, 1, 0.8039216, 0, 1,
-1.128143, 0.9992937, -1.264399, 1, 0.8117647, 0, 1,
-1.123917, 0.5903935, -1.311894, 1, 0.8156863, 0, 1,
-1.11233, 0.7295479, -0.1734437, 1, 0.8235294, 0, 1,
-1.108774, -1.024797, -1.171427, 1, 0.827451, 0, 1,
-1.101892, -1.582231, -1.627675, 1, 0.8352941, 0, 1,
-1.100381, 0.179978, -0.4511769, 1, 0.8392157, 0, 1,
-1.091461, 0.2386341, 0.2639814, 1, 0.8470588, 0, 1,
-1.084895, -0.5323235, -1.074624, 1, 0.8509804, 0, 1,
-1.084281, 0.9103675, 1.418293, 1, 0.8588235, 0, 1,
-1.062014, 0.8893715, -1.168859, 1, 0.8627451, 0, 1,
-1.059739, -0.4667331, -1.644154, 1, 0.8705882, 0, 1,
-1.055257, 0.2419948, -2.306519, 1, 0.8745098, 0, 1,
-1.03308, -0.1826151, 0.02416994, 1, 0.8823529, 0, 1,
-1.031741, 2.017923, -0.4483492, 1, 0.8862745, 0, 1,
-1.0286, 0.0600666, -0.3796521, 1, 0.8941177, 0, 1,
-1.027957, -0.5179394, -2.36905, 1, 0.8980392, 0, 1,
-1.024816, -0.1261869, -1.814992, 1, 0.9058824, 0, 1,
-1.018321, -1.419729, -3.320705, 1, 0.9137255, 0, 1,
-1.015106, -0.8879172, -0.8677802, 1, 0.9176471, 0, 1,
-1.012271, -0.9195672, -1.762657, 1, 0.9254902, 0, 1,
-1.010505, -0.6743967, -2.653068, 1, 0.9294118, 0, 1,
-1.00963, 2.362261, -2.238893, 1, 0.9372549, 0, 1,
-1.00847, -0.3246243, -1.153263, 1, 0.9411765, 0, 1,
-1.008188, -0.1085601, -0.9608782, 1, 0.9490196, 0, 1,
-1.007513, 0.6745178, -1.008617, 1, 0.9529412, 0, 1,
-1.0051, 1.091767, -0.3805311, 1, 0.9607843, 0, 1,
-1.002637, 1.499003, -1.038191, 1, 0.9647059, 0, 1,
-0.9944808, 0.6065364, -0.9644017, 1, 0.972549, 0, 1,
-0.9902443, 1.132972, -2.014088, 1, 0.9764706, 0, 1,
-0.9867101, 0.2358682, -2.561826, 1, 0.9843137, 0, 1,
-0.9863586, 0.1088479, -1.534552, 1, 0.9882353, 0, 1,
-0.9860594, -0.3192552, -2.151621, 1, 0.9960784, 0, 1,
-0.9830115, 0.2282035, -1.788272, 0.9960784, 1, 0, 1,
-0.9806243, -0.1164217, -2.633871, 0.9921569, 1, 0, 1,
-0.9781833, -0.03911602, -1.10106, 0.9843137, 1, 0, 1,
-0.9746187, 0.08252747, -2.043748, 0.9803922, 1, 0, 1,
-0.9733714, -0.4497543, -3.825926, 0.972549, 1, 0, 1,
-0.9628698, 0.003092068, -0.9861335, 0.9686275, 1, 0, 1,
-0.959073, 1.938317, -1.743615, 0.9607843, 1, 0, 1,
-0.9572552, 1.74677, 0.2908391, 0.9568627, 1, 0, 1,
-0.9531871, -0.7039985, -2.307555, 0.9490196, 1, 0, 1,
-0.9369566, 0.06864018, -0.6496385, 0.945098, 1, 0, 1,
-0.9292859, 1.015538, -1.132243, 0.9372549, 1, 0, 1,
-0.9259049, -0.5600149, -2.758141, 0.9333333, 1, 0, 1,
-0.9193282, -0.2773334, -2.644214, 0.9254902, 1, 0, 1,
-0.9189487, 0.1207611, -3.674192, 0.9215686, 1, 0, 1,
-0.9182321, 0.4543712, 0.1329323, 0.9137255, 1, 0, 1,
-0.9154139, -0.04869388, -1.572735, 0.9098039, 1, 0, 1,
-0.9102386, -1.408703, -2.748388, 0.9019608, 1, 0, 1,
-0.8967407, -0.02137032, -1.955009, 0.8941177, 1, 0, 1,
-0.8943352, -1.260699, -3.579274, 0.8901961, 1, 0, 1,
-0.892435, -1.241513, -3.250989, 0.8823529, 1, 0, 1,
-0.8915191, 1.533912, -0.4535768, 0.8784314, 1, 0, 1,
-0.8853492, -0.7587101, -2.88902, 0.8705882, 1, 0, 1,
-0.8818404, -0.8936679, -2.714544, 0.8666667, 1, 0, 1,
-0.8766287, -1.44805, -2.840065, 0.8588235, 1, 0, 1,
-0.8748972, -0.7014918, -1.775329, 0.854902, 1, 0, 1,
-0.8745437, -0.8320571, -3.974127, 0.8470588, 1, 0, 1,
-0.8711581, 0.5049664, -0.2900636, 0.8431373, 1, 0, 1,
-0.8696133, -0.9315007, -4.001487, 0.8352941, 1, 0, 1,
-0.8692565, -1.3274, -1.364098, 0.8313726, 1, 0, 1,
-0.8625085, -0.112519, -2.009503, 0.8235294, 1, 0, 1,
-0.8597034, -0.9088486, -5.054496, 0.8196079, 1, 0, 1,
-0.8555518, 1.155751, 0.08607712, 0.8117647, 1, 0, 1,
-0.8543788, 0.6290635, -1.308975, 0.8078431, 1, 0, 1,
-0.8536941, 0.1643233, -1.564852, 0.8, 1, 0, 1,
-0.8517475, -0.1542176, -2.858729, 0.7921569, 1, 0, 1,
-0.8500536, -0.3566959, 1.299276, 0.7882353, 1, 0, 1,
-0.8423982, -0.6123801, -2.840214, 0.7803922, 1, 0, 1,
-0.8412746, 0.2574467, -1.145435, 0.7764706, 1, 0, 1,
-0.8387321, -0.5599158, -0.4295517, 0.7686275, 1, 0, 1,
-0.8254375, 0.2331152, -2.594942, 0.7647059, 1, 0, 1,
-0.816376, -0.7204944, -2.940954, 0.7568628, 1, 0, 1,
-0.8154813, -0.9736834, -1.466268, 0.7529412, 1, 0, 1,
-0.8116132, -0.8251003, -1.506929, 0.7450981, 1, 0, 1,
-0.8098045, 1.478028, -1.806097, 0.7411765, 1, 0, 1,
-0.8095418, 0.6315991, -1.114453, 0.7333333, 1, 0, 1,
-0.8066372, 0.6654852, -2.50894, 0.7294118, 1, 0, 1,
-0.8030736, -0.5186219, -3.812115, 0.7215686, 1, 0, 1,
-0.7962689, -1.063342, -2.565871, 0.7176471, 1, 0, 1,
-0.7863284, -0.0951528, -1.86157, 0.7098039, 1, 0, 1,
-0.7855409, -0.007804132, -0.9968521, 0.7058824, 1, 0, 1,
-0.7720804, 0.1778699, -0.1595057, 0.6980392, 1, 0, 1,
-0.7694681, 0.2739358, -1.177245, 0.6901961, 1, 0, 1,
-0.7686759, 0.4724964, 0.908668, 0.6862745, 1, 0, 1,
-0.7671543, -0.9913931, -3.313428, 0.6784314, 1, 0, 1,
-0.7641501, 1.900061, 0.666303, 0.6745098, 1, 0, 1,
-0.7612666, 0.01574208, -2.275982, 0.6666667, 1, 0, 1,
-0.7570294, 0.05759316, -2.146685, 0.6627451, 1, 0, 1,
-0.7472906, -0.5267156, -2.770601, 0.654902, 1, 0, 1,
-0.7411069, -1.59567, -2.901987, 0.6509804, 1, 0, 1,
-0.7400689, -1.192824, -0.5536433, 0.6431373, 1, 0, 1,
-0.7397826, 1.311094, -1.087885, 0.6392157, 1, 0, 1,
-0.7313516, -0.2523418, -1.653848, 0.6313726, 1, 0, 1,
-0.7105708, -0.8543202, -3.022509, 0.627451, 1, 0, 1,
-0.7065544, 0.2979614, -1.915228, 0.6196079, 1, 0, 1,
-0.7063348, 1.430167, -1.807782, 0.6156863, 1, 0, 1,
-0.7013318, 1.156217, -0.9721352, 0.6078432, 1, 0, 1,
-0.6977805, -1.199769, -1.900092, 0.6039216, 1, 0, 1,
-0.6922771, 0.5759824, 1.197244, 0.5960785, 1, 0, 1,
-0.6907026, -1.044995, -3.929939, 0.5882353, 1, 0, 1,
-0.6895768, 0.7769379, -0.6989189, 0.5843138, 1, 0, 1,
-0.6844206, 0.8108892, 0.4392932, 0.5764706, 1, 0, 1,
-0.678902, -0.7237087, -2.431947, 0.572549, 1, 0, 1,
-0.67685, -0.2076724, -1.422821, 0.5647059, 1, 0, 1,
-0.6724281, 1.238467, 0.2963801, 0.5607843, 1, 0, 1,
-0.6703811, 0.7379608, -0.8536223, 0.5529412, 1, 0, 1,
-0.6668789, -1.343544, -1.323404, 0.5490196, 1, 0, 1,
-0.6649598, -0.5479912, -2.68818, 0.5411765, 1, 0, 1,
-0.6636626, -0.5720053, -1.366818, 0.5372549, 1, 0, 1,
-0.6585558, 0.1722934, -0.1214552, 0.5294118, 1, 0, 1,
-0.6541674, 0.161635, -1.484034, 0.5254902, 1, 0, 1,
-0.6506972, -0.6257547, -1.123978, 0.5176471, 1, 0, 1,
-0.6498939, -0.02587517, -1.914552, 0.5137255, 1, 0, 1,
-0.6498049, 0.09419521, -0.8350275, 0.5058824, 1, 0, 1,
-0.6474713, -0.559164, -2.092098, 0.5019608, 1, 0, 1,
-0.6452441, -0.17796, -3.381323, 0.4941176, 1, 0, 1,
-0.6431288, -0.9107538, -2.957649, 0.4862745, 1, 0, 1,
-0.6418979, -1.646583, -2.035923, 0.4823529, 1, 0, 1,
-0.6370836, 1.136646, -0.3342375, 0.4745098, 1, 0, 1,
-0.6362176, -0.4522913, -1.912328, 0.4705882, 1, 0, 1,
-0.6329833, 0.6860084, -0.1057738, 0.4627451, 1, 0, 1,
-0.6309581, -0.3827708, -2.417853, 0.4588235, 1, 0, 1,
-0.6291977, 0.4052577, 0.9983174, 0.4509804, 1, 0, 1,
-0.6290672, 0.7748432, -1.548311, 0.4470588, 1, 0, 1,
-0.6254646, 1.206185, -1.478008, 0.4392157, 1, 0, 1,
-0.6212188, 0.5135501, -0.7318472, 0.4352941, 1, 0, 1,
-0.618639, 1.800479, -1.076881, 0.427451, 1, 0, 1,
-0.6177569, -0.07606477, -0.304024, 0.4235294, 1, 0, 1,
-0.6174996, -0.6444269, -1.768854, 0.4156863, 1, 0, 1,
-0.6145481, 1.154404, -0.5692493, 0.4117647, 1, 0, 1,
-0.6122838, 0.8371133, -1.547341, 0.4039216, 1, 0, 1,
-0.6090737, 1.284164, -1.12115, 0.3960784, 1, 0, 1,
-0.6090043, -0.3828385, 0.2138397, 0.3921569, 1, 0, 1,
-0.6057673, -1.020031, -1.603647, 0.3843137, 1, 0, 1,
-0.6047931, 1.938703, 0.06544962, 0.3803922, 1, 0, 1,
-0.6018556, -0.1171484, -3.723266, 0.372549, 1, 0, 1,
-0.6008754, -0.9583256, -2.480396, 0.3686275, 1, 0, 1,
-0.599984, 1.30902, 0.923907, 0.3607843, 1, 0, 1,
-0.5935227, -0.7700457, -1.707381, 0.3568628, 1, 0, 1,
-0.5925574, 1.362249, -0.2381507, 0.3490196, 1, 0, 1,
-0.588504, -1.150944, -2.227348, 0.345098, 1, 0, 1,
-0.5883679, -2.426887, -2.417978, 0.3372549, 1, 0, 1,
-0.5775126, -0.6045325, -2.397829, 0.3333333, 1, 0, 1,
-0.5737965, -0.7910272, -1.76282, 0.3254902, 1, 0, 1,
-0.569698, -0.4962584, -1.529139, 0.3215686, 1, 0, 1,
-0.5635287, -0.06376059, -2.484771, 0.3137255, 1, 0, 1,
-0.5524807, -0.1464506, -1.20526, 0.3098039, 1, 0, 1,
-0.5522493, 0.07618543, -2.751434, 0.3019608, 1, 0, 1,
-0.5502952, -0.3859183, -1.639206, 0.2941177, 1, 0, 1,
-0.5467697, -1.467232, -4.331832, 0.2901961, 1, 0, 1,
-0.5439699, -1.36246, -4.551909, 0.282353, 1, 0, 1,
-0.5430863, 0.3188897, -1.760077, 0.2784314, 1, 0, 1,
-0.5394929, -0.7710931, -3.358516, 0.2705882, 1, 0, 1,
-0.535391, -1.318353, -2.830247, 0.2666667, 1, 0, 1,
-0.5314043, -0.254302, -1.195808, 0.2588235, 1, 0, 1,
-0.5313143, 0.2946053, -2.129338, 0.254902, 1, 0, 1,
-0.5311666, 1.455702, 0.3692799, 0.2470588, 1, 0, 1,
-0.5278921, 0.09308165, -2.132504, 0.2431373, 1, 0, 1,
-0.5261638, -0.6863812, -2.0912, 0.2352941, 1, 0, 1,
-0.5260317, 0.8334666, -0.9192613, 0.2313726, 1, 0, 1,
-0.5218187, 1.256906, -1.159335, 0.2235294, 1, 0, 1,
-0.5187519, 1.433843, -0.9217009, 0.2196078, 1, 0, 1,
-0.5161638, 0.4660936, -1.635342, 0.2117647, 1, 0, 1,
-0.5160394, -1.267921, -3.406481, 0.2078431, 1, 0, 1,
-0.515343, -0.1017023, -1.045658, 0.2, 1, 0, 1,
-0.5125991, 0.2690875, -1.288628, 0.1921569, 1, 0, 1,
-0.5084075, -0.7110248, -1.685727, 0.1882353, 1, 0, 1,
-0.5077745, 1.062529, -0.7336228, 0.1803922, 1, 0, 1,
-0.5074359, 1.000332, -0.9091089, 0.1764706, 1, 0, 1,
-0.5062696, -1.46742, -2.107948, 0.1686275, 1, 0, 1,
-0.5019242, -2.155627, -1.22541, 0.1647059, 1, 0, 1,
-0.4945184, 1.375966, -0.2707849, 0.1568628, 1, 0, 1,
-0.4942731, 0.1342439, -0.02521535, 0.1529412, 1, 0, 1,
-0.4935917, -1.971113, -2.278568, 0.145098, 1, 0, 1,
-0.4878939, -0.400276, -2.990386, 0.1411765, 1, 0, 1,
-0.4877306, -0.3565262, -0.9787393, 0.1333333, 1, 0, 1,
-0.480053, -0.5904793, -1.730984, 0.1294118, 1, 0, 1,
-0.4797011, 1.753904, 0.1046711, 0.1215686, 1, 0, 1,
-0.4748299, -0.5843746, -3.849608, 0.1176471, 1, 0, 1,
-0.4712787, 2.030074, -1.52355, 0.1098039, 1, 0, 1,
-0.4664325, 0.780673, 1.177203, 0.1058824, 1, 0, 1,
-0.4656774, -0.06982839, -2.255805, 0.09803922, 1, 0, 1,
-0.4638636, -1.173296, -3.604544, 0.09019608, 1, 0, 1,
-0.4626733, -1.595094, -2.442728, 0.08627451, 1, 0, 1,
-0.454136, 1.707705, 0.1901628, 0.07843138, 1, 0, 1,
-0.4507453, -0.7175536, -4.258474, 0.07450981, 1, 0, 1,
-0.4477046, 0.5096455, -1.544019, 0.06666667, 1, 0, 1,
-0.4473132, -0.1436597, -1.846381, 0.0627451, 1, 0, 1,
-0.4462261, -0.005361745, -0.8655564, 0.05490196, 1, 0, 1,
-0.4430691, 0.3936513, -2.263597, 0.05098039, 1, 0, 1,
-0.4315243, 0.4220527, -1.284764, 0.04313726, 1, 0, 1,
-0.4260778, -1.354075, -1.263032, 0.03921569, 1, 0, 1,
-0.4260415, 0.6498706, -0.5803003, 0.03137255, 1, 0, 1,
-0.4214441, -0.4471566, -2.315521, 0.02745098, 1, 0, 1,
-0.421024, -0.02366248, -0.7161329, 0.01960784, 1, 0, 1,
-0.4192662, -0.156855, -0.7389154, 0.01568628, 1, 0, 1,
-0.4176319, 1.206379, 0.1247612, 0.007843138, 1, 0, 1,
-0.4115227, -1.452449, -3.986289, 0.003921569, 1, 0, 1,
-0.405103, 0.5952789, -2.823431, 0, 1, 0.003921569, 1,
-0.4033919, -0.8976103, 0.6714861, 0, 1, 0.01176471, 1,
-0.399973, -0.5182852, -1.996119, 0, 1, 0.01568628, 1,
-0.3970601, 0.2389679, 0.9169781, 0, 1, 0.02352941, 1,
-0.3961362, 0.6406541, -1.32758, 0, 1, 0.02745098, 1,
-0.3929176, -1.846135, -2.379877, 0, 1, 0.03529412, 1,
-0.3839505, -1.496827, -3.211456, 0, 1, 0.03921569, 1,
-0.3794504, 0.9538079, 0.714735, 0, 1, 0.04705882, 1,
-0.3780483, -1.532395, -3.038724, 0, 1, 0.05098039, 1,
-0.3763422, -0.5163453, -1.186941, 0, 1, 0.05882353, 1,
-0.3652077, 0.09653998, -1.799555, 0, 1, 0.0627451, 1,
-0.3646302, -0.8396215, -1.081507, 0, 1, 0.07058824, 1,
-0.3642604, 1.189286, 0.7793303, 0, 1, 0.07450981, 1,
-0.3633778, 0.4034924, -1.961384, 0, 1, 0.08235294, 1,
-0.355208, -1.855075, -2.422841, 0, 1, 0.08627451, 1,
-0.3503593, 0.6280785, 0.3218492, 0, 1, 0.09411765, 1,
-0.3465334, 0.6971582, 0.7381085, 0, 1, 0.1019608, 1,
-0.3431629, 0.9214883, 1.822381, 0, 1, 0.1058824, 1,
-0.342237, -0.5618722, -3.404392, 0, 1, 0.1137255, 1,
-0.3412953, -1.770899, -3.221986, 0, 1, 0.1176471, 1,
-0.3394615, 0.4754834, -0.5419284, 0, 1, 0.1254902, 1,
-0.3390713, -0.1806059, -3.256535, 0, 1, 0.1294118, 1,
-0.3377376, -2.057208, -2.406644, 0, 1, 0.1372549, 1,
-0.3349944, 1.393009, 0.01833996, 0, 1, 0.1411765, 1,
-0.3221515, 0.7071924, 0.7985435, 0, 1, 0.1490196, 1,
-0.3141882, 0.7415968, -0.6116353, 0, 1, 0.1529412, 1,
-0.3036475, -1.507978, -1.360259, 0, 1, 0.1607843, 1,
-0.3031095, 0.2204014, -0.4989375, 0, 1, 0.1647059, 1,
-0.3017473, 1.185886, 1.506348, 0, 1, 0.172549, 1,
-0.301569, 0.234697, -1.961358, 0, 1, 0.1764706, 1,
-0.3008901, -0.6740237, -2.176678, 0, 1, 0.1843137, 1,
-0.2998538, 0.3942415, -1.102685, 0, 1, 0.1882353, 1,
-0.2941898, -1.937017, -3.094015, 0, 1, 0.1960784, 1,
-0.2915207, 0.1112675, -0.9990268, 0, 1, 0.2039216, 1,
-0.2901043, 0.5590252, -0.4627239, 0, 1, 0.2078431, 1,
-0.2858424, 1.634075, -0.251032, 0, 1, 0.2156863, 1,
-0.2835724, 0.7487755, -0.8855692, 0, 1, 0.2196078, 1,
-0.2812649, 0.5443591, 0.1870421, 0, 1, 0.227451, 1,
-0.2811242, 0.2679181, -1.783977, 0, 1, 0.2313726, 1,
-0.2801677, 0.07673124, -1.186919, 0, 1, 0.2392157, 1,
-0.2793099, 1.650686, -0.09089293, 0, 1, 0.2431373, 1,
-0.2773518, 0.4916196, -1.736976, 0, 1, 0.2509804, 1,
-0.2745865, -0.4409602, -3.858673, 0, 1, 0.254902, 1,
-0.2744144, -0.138211, -1.111812, 0, 1, 0.2627451, 1,
-0.2739632, -0.8590263, -4.517226, 0, 1, 0.2666667, 1,
-0.270008, -0.4277788, -2.889613, 0, 1, 0.2745098, 1,
-0.2640833, 1.156671, 0.3376732, 0, 1, 0.2784314, 1,
-0.2629726, -0.5499927, -1.916345, 0, 1, 0.2862745, 1,
-0.2626552, 1.346323, 1.309605, 0, 1, 0.2901961, 1,
-0.2616732, 1.388843, -0.03117178, 0, 1, 0.2980392, 1,
-0.2591956, 0.5249665, 0.9709532, 0, 1, 0.3058824, 1,
-0.2577329, -1.056787, -2.240971, 0, 1, 0.3098039, 1,
-0.2558497, -0.09688073, -1.915454, 0, 1, 0.3176471, 1,
-0.2553489, -1.08995, -2.547596, 0, 1, 0.3215686, 1,
-0.2549233, -0.6384557, -3.513946, 0, 1, 0.3294118, 1,
-0.2497509, -1.490147, -6.088318, 0, 1, 0.3333333, 1,
-0.2493336, -0.6015854, -3.331611, 0, 1, 0.3411765, 1,
-0.248389, -0.8543514, -4.319127, 0, 1, 0.345098, 1,
-0.2385181, 1.944805, 1.132157, 0, 1, 0.3529412, 1,
-0.2378813, -1.024956, -2.65239, 0, 1, 0.3568628, 1,
-0.2357507, -0.932135, -3.45154, 0, 1, 0.3647059, 1,
-0.234335, -0.4637893, -2.869422, 0, 1, 0.3686275, 1,
-0.233906, 0.684726, 1.135642, 0, 1, 0.3764706, 1,
-0.233727, 0.1712415, -1.59188, 0, 1, 0.3803922, 1,
-0.2331361, 1.205781, -1.105578, 0, 1, 0.3882353, 1,
-0.2326376, 1.013405, -0.4994467, 0, 1, 0.3921569, 1,
-0.2293511, 0.2543154, -0.01244512, 0, 1, 0.4, 1,
-0.2279052, 1.724452, 0.5851969, 0, 1, 0.4078431, 1,
-0.2278084, 1.909146, 1.051732, 0, 1, 0.4117647, 1,
-0.2256494, 2.021358, 0.8918626, 0, 1, 0.4196078, 1,
-0.2255665, -0.02482396, -0.9486755, 0, 1, 0.4235294, 1,
-0.2214793, 0.290457, -1.905568, 0, 1, 0.4313726, 1,
-0.2207178, 0.05633337, -1.707144, 0, 1, 0.4352941, 1,
-0.218144, -0.2697935, -2.579265, 0, 1, 0.4431373, 1,
-0.2170556, -1.059536, -2.690993, 0, 1, 0.4470588, 1,
-0.2144272, -1.339627, -3.772159, 0, 1, 0.454902, 1,
-0.2082833, -0.3089253, -1.774558, 0, 1, 0.4588235, 1,
-0.2052377, 1.341063, -1.520272, 0, 1, 0.4666667, 1,
-0.1971718, 1.111169, 1.038554, 0, 1, 0.4705882, 1,
-0.1930591, 0.8609159, -0.1725437, 0, 1, 0.4784314, 1,
-0.1920254, 0.7098441, 0.7177532, 0, 1, 0.4823529, 1,
-0.1918326, -0.4790738, -3.105453, 0, 1, 0.4901961, 1,
-0.1895231, -1.093336, -3.275605, 0, 1, 0.4941176, 1,
-0.183898, 0.3350648, -0.09543021, 0, 1, 0.5019608, 1,
-0.1832051, -0.04683188, -2.880818, 0, 1, 0.509804, 1,
-0.1760312, 1.343852, -0.8569283, 0, 1, 0.5137255, 1,
-0.1748301, -0.6870284, -2.568559, 0, 1, 0.5215687, 1,
-0.1745379, -0.6847747, -3.827617, 0, 1, 0.5254902, 1,
-0.1736126, 0.6605453, -0.1828721, 0, 1, 0.5333334, 1,
-0.1721784, -0.703275, -3.238356, 0, 1, 0.5372549, 1,
-0.1674263, 0.2242187, 0.8549602, 0, 1, 0.5450981, 1,
-0.163148, 0.07907747, -1.689186, 0, 1, 0.5490196, 1,
-0.1630099, -0.6431473, -4.397203, 0, 1, 0.5568628, 1,
-0.1598082, -0.4047326, -4.917277, 0, 1, 0.5607843, 1,
-0.1583941, 1.904455, 0.1613051, 0, 1, 0.5686275, 1,
-0.157838, 0.8160144, 0.1856937, 0, 1, 0.572549, 1,
-0.1574645, 0.7443147, 0.9334627, 0, 1, 0.5803922, 1,
-0.1550853, -0.658788, -2.694175, 0, 1, 0.5843138, 1,
-0.1540246, 0.5725898, -0.5070048, 0, 1, 0.5921569, 1,
-0.1506559, 0.5654258, 0.2173384, 0, 1, 0.5960785, 1,
-0.1499532, -0.5499038, -1.778451, 0, 1, 0.6039216, 1,
-0.1497047, -1.107357, -2.84345, 0, 1, 0.6117647, 1,
-0.136969, 0.7511244, -1.087205, 0, 1, 0.6156863, 1,
-0.1322015, -0.06269479, -1.639588, 0, 1, 0.6235294, 1,
-0.1314862, 0.05117461, -0.5678929, 0, 1, 0.627451, 1,
-0.1289088, 0.1303657, 0.4210102, 0, 1, 0.6352941, 1,
-0.1242938, 1.640551, -0.6779655, 0, 1, 0.6392157, 1,
-0.1228086, 2.149693, 2.136422, 0, 1, 0.6470588, 1,
-0.1222728, -0.9751492, -2.054829, 0, 1, 0.6509804, 1,
-0.1172294, 1.47514, -0.08132387, 0, 1, 0.6588235, 1,
-0.1143723, -0.7003207, -1.941359, 0, 1, 0.6627451, 1,
-0.1121384, -0.612018, -3.401478, 0, 1, 0.6705883, 1,
-0.1115294, 1.062586, -0.535661, 0, 1, 0.6745098, 1,
-0.1112308, -1.694136, -2.831642, 0, 1, 0.682353, 1,
-0.1080075, 1.795408, -1.12798, 0, 1, 0.6862745, 1,
-0.1068869, 1.649048, -1.649285, 0, 1, 0.6941177, 1,
-0.1067919, -2.266301, -2.898576, 0, 1, 0.7019608, 1,
-0.1032815, -1.116192, -3.802196, 0, 1, 0.7058824, 1,
-0.1008183, -0.1488199, -3.560568, 0, 1, 0.7137255, 1,
-0.09722478, 0.3431332, 1.901933, 0, 1, 0.7176471, 1,
-0.09278815, -1.627079, -5.81361, 0, 1, 0.7254902, 1,
-0.09193054, 1.049833, -0.4206848, 0, 1, 0.7294118, 1,
-0.09056389, 1.571713, 0.3645737, 0, 1, 0.7372549, 1,
-0.0823452, -0.2355517, -3.721739, 0, 1, 0.7411765, 1,
-0.08154964, 1.448158, -0.005642474, 0, 1, 0.7490196, 1,
-0.07949447, -0.5014411, -4.411622, 0, 1, 0.7529412, 1,
-0.07878037, 1.064459, -0.4308072, 0, 1, 0.7607843, 1,
-0.06941549, 0.1356488, -1.418213, 0, 1, 0.7647059, 1,
-0.06935313, 0.4654054, 1.01755, 0, 1, 0.772549, 1,
-0.05435943, -1.854334, -2.787578, 0, 1, 0.7764706, 1,
-0.052464, -0.8959197, -3.811699, 0, 1, 0.7843137, 1,
-0.05180399, 0.468179, -0.7346091, 0, 1, 0.7882353, 1,
-0.05160042, -2.315977, -2.443765, 0, 1, 0.7960784, 1,
-0.05110566, -0.8089489, -2.508673, 0, 1, 0.8039216, 1,
-0.04649032, 0.6445566, -0.710932, 0, 1, 0.8078431, 1,
-0.04403463, -0.3747032, -3.249473, 0, 1, 0.8156863, 1,
-0.03545995, 1.33282, 1.462486, 0, 1, 0.8196079, 1,
-0.03424335, -0.9524348, -3.462192, 0, 1, 0.827451, 1,
-0.03384874, -1.501564, -4.235283, 0, 1, 0.8313726, 1,
-0.02903732, 1.266972, 0.6923404, 0, 1, 0.8392157, 1,
-0.02764398, 0.2788672, 1.724398, 0, 1, 0.8431373, 1,
-0.02380233, 1.226779, 0.8212816, 0, 1, 0.8509804, 1,
-0.02334604, 2.884483, 0.06259875, 0, 1, 0.854902, 1,
-0.02325857, -0.6565524, -2.073537, 0, 1, 0.8627451, 1,
-0.0219713, -0.8002784, -1.099476, 0, 1, 0.8666667, 1,
-0.01483644, 0.5652378, 1.351961, 0, 1, 0.8745098, 1,
-0.01081336, -0.5841779, -4.049031, 0, 1, 0.8784314, 1,
-0.006406984, -0.9938724, -2.311648, 0, 1, 0.8862745, 1,
-0.004564958, 0.09657643, -1.134166, 0, 1, 0.8901961, 1,
0.002197378, 0.03852081, 1.846968, 0, 1, 0.8980392, 1,
0.01115182, 0.2143215, -0.7965503, 0, 1, 0.9058824, 1,
0.01148911, -0.006740251, 2.445309, 0, 1, 0.9098039, 1,
0.01619736, 0.8268892, 1.442875, 0, 1, 0.9176471, 1,
0.01811893, -1.420259, 2.975239, 0, 1, 0.9215686, 1,
0.02354135, -0.2715646, 1.974813, 0, 1, 0.9294118, 1,
0.02590943, -1.843748, 2.127083, 0, 1, 0.9333333, 1,
0.02617436, 0.03735276, 1.419146, 0, 1, 0.9411765, 1,
0.03063383, -0.02907976, 2.556324, 0, 1, 0.945098, 1,
0.03140687, 0.7966136, 0.4914609, 0, 1, 0.9529412, 1,
0.03152598, -0.1552205, 4.065398, 0, 1, 0.9568627, 1,
0.03176897, -0.1254623, 3.893383, 0, 1, 0.9647059, 1,
0.03221579, 0.575771, -0.03497494, 0, 1, 0.9686275, 1,
0.03261483, -0.07789323, 2.786597, 0, 1, 0.9764706, 1,
0.03374442, 0.383994, 0.7043446, 0, 1, 0.9803922, 1,
0.03769565, 0.5614993, 0.445825, 0, 1, 0.9882353, 1,
0.04025425, 0.7495549, 0.8438908, 0, 1, 0.9921569, 1,
0.04063173, -1.248785, 3.301229, 0, 1, 1, 1,
0.04114847, -0.1268748, 2.334201, 0, 0.9921569, 1, 1,
0.04199738, -0.9146973, 3.051836, 0, 0.9882353, 1, 1,
0.0424789, 0.6074917, 0.9926325, 0, 0.9803922, 1, 1,
0.04307936, -1.632851, 1.774795, 0, 0.9764706, 1, 1,
0.04345657, 0.8812858, 0.2252619, 0, 0.9686275, 1, 1,
0.04388401, 0.7956349, 1.069621, 0, 0.9647059, 1, 1,
0.04561647, -0.2775272, 2.273489, 0, 0.9568627, 1, 1,
0.04664657, -0.625801, 3.181485, 0, 0.9529412, 1, 1,
0.05310132, -0.6390868, 1.797541, 0, 0.945098, 1, 1,
0.05423642, 0.05220552, 1.271078, 0, 0.9411765, 1, 1,
0.05484132, 0.7998688, 0.9350777, 0, 0.9333333, 1, 1,
0.05707378, -0.4290806, 2.843904, 0, 0.9294118, 1, 1,
0.05864699, -1.284245, 3.826166, 0, 0.9215686, 1, 1,
0.06024716, 0.5255865, 0.1069548, 0, 0.9176471, 1, 1,
0.06200039, 0.7065282, 1.976268, 0, 0.9098039, 1, 1,
0.06289001, 1.922177, 0.4614534, 0, 0.9058824, 1, 1,
0.06688292, 0.7723647, -0.5561531, 0, 0.8980392, 1, 1,
0.07441341, -0.8411922, 4.716021, 0, 0.8901961, 1, 1,
0.07467747, 1.130517, -0.120111, 0, 0.8862745, 1, 1,
0.07973314, -1.062413, 2.10626, 0, 0.8784314, 1, 1,
0.08063335, -0.673775, 2.112083, 0, 0.8745098, 1, 1,
0.08141377, -0.9195314, 2.580742, 0, 0.8666667, 1, 1,
0.08490355, -0.9106629, 3.248583, 0, 0.8627451, 1, 1,
0.08599345, 1.027634, 0.5575004, 0, 0.854902, 1, 1,
0.0869234, -0.252092, 4.978712, 0, 0.8509804, 1, 1,
0.08751511, -1.670622, 2.331383, 0, 0.8431373, 1, 1,
0.09436251, 0.7290788, 1.481721, 0, 0.8392157, 1, 1,
0.09622977, 1.305599, 0.1019952, 0, 0.8313726, 1, 1,
0.09645033, 1.099816, -1.188431, 0, 0.827451, 1, 1,
0.09905479, -0.2841032, 1.04347, 0, 0.8196079, 1, 1,
0.09950917, -1.141554, 1.690703, 0, 0.8156863, 1, 1,
0.1005925, 0.4074083, 0.7796609, 0, 0.8078431, 1, 1,
0.1030026, 0.2065159, 0.9394858, 0, 0.8039216, 1, 1,
0.1048768, -0.637848, 4.135155, 0, 0.7960784, 1, 1,
0.1049989, -1.493702, 2.640229, 0, 0.7882353, 1, 1,
0.1050927, 2.722118, 0.944322, 0, 0.7843137, 1, 1,
0.1061535, 0.2816228, 2.24494, 0, 0.7764706, 1, 1,
0.1077649, -0.7914408, 2.5754, 0, 0.772549, 1, 1,
0.1081646, 0.3949352, 0.7159728, 0, 0.7647059, 1, 1,
0.1098939, 1.776963, 0.8552586, 0, 0.7607843, 1, 1,
0.1128356, -0.3540829, 2.497739, 0, 0.7529412, 1, 1,
0.1154078, 2.716812, 0.6070991, 0, 0.7490196, 1, 1,
0.1206919, 0.8131936, -1.246115, 0, 0.7411765, 1, 1,
0.1326766, 0.05684171, 1.833083, 0, 0.7372549, 1, 1,
0.1338318, 0.2255072, 1.470663, 0, 0.7294118, 1, 1,
0.1369913, 0.861026, 0.3022144, 0, 0.7254902, 1, 1,
0.1391295, 0.1336257, 0.6594533, 0, 0.7176471, 1, 1,
0.1436463, -0.1016072, 2.372195, 0, 0.7137255, 1, 1,
0.1438121, -0.4378746, 1.367579, 0, 0.7058824, 1, 1,
0.143815, -0.7132565, 3.030185, 0, 0.6980392, 1, 1,
0.1446759, -1.989586, 3.687907, 0, 0.6941177, 1, 1,
0.1451807, -0.2255691, 1.707342, 0, 0.6862745, 1, 1,
0.1472827, -0.4015913, 4.137455, 0, 0.682353, 1, 1,
0.1489736, 0.3531442, -0.513795, 0, 0.6745098, 1, 1,
0.15047, 0.23649, 0.03894218, 0, 0.6705883, 1, 1,
0.155632, 1.550712, 0.3725386, 0, 0.6627451, 1, 1,
0.1562878, 0.09819464, 2.234413, 0, 0.6588235, 1, 1,
0.1583442, 0.3860146, 0.09854058, 0, 0.6509804, 1, 1,
0.1588876, -0.3528458, 2.877103, 0, 0.6470588, 1, 1,
0.1597633, 0.3457373, -0.5067811, 0, 0.6392157, 1, 1,
0.1609289, -0.3695129, 2.465148, 0, 0.6352941, 1, 1,
0.1620866, 0.3363951, -0.2491128, 0, 0.627451, 1, 1,
0.1635996, -1.63521, 0.8753956, 0, 0.6235294, 1, 1,
0.1690865, -0.7920622, 3.056201, 0, 0.6156863, 1, 1,
0.1700591, 1.888543, 0.001592269, 0, 0.6117647, 1, 1,
0.17355, -1.371094, 1.348189, 0, 0.6039216, 1, 1,
0.174899, -0.905351, 3.331807, 0, 0.5960785, 1, 1,
0.1766887, -0.4020956, 2.22707, 0, 0.5921569, 1, 1,
0.1771382, -0.02154208, 0.2695778, 0, 0.5843138, 1, 1,
0.178664, 1.087789, -0.09750893, 0, 0.5803922, 1, 1,
0.1789853, -0.08635486, 2.467098, 0, 0.572549, 1, 1,
0.1796038, 1.325101, 1.098956, 0, 0.5686275, 1, 1,
0.1818277, -0.4188448, 2.92092, 0, 0.5607843, 1, 1,
0.1825081, 0.6616885, 0.08176936, 0, 0.5568628, 1, 1,
0.1830363, 1.798863, -0.7065601, 0, 0.5490196, 1, 1,
0.1850262, 0.7691298, -0.7066845, 0, 0.5450981, 1, 1,
0.1854617, 0.9216954, 1.732498, 0, 0.5372549, 1, 1,
0.1909962, 1.167547, 0.1184983, 0, 0.5333334, 1, 1,
0.1912474, 1.146417, 0.6496539, 0, 0.5254902, 1, 1,
0.1919102, -0.765542, 3.413811, 0, 0.5215687, 1, 1,
0.1978718, 0.0539148, 1.261167, 0, 0.5137255, 1, 1,
0.1984025, 1.242362, 0.286164, 0, 0.509804, 1, 1,
0.1999407, -0.5892553, 3.4182, 0, 0.5019608, 1, 1,
0.201553, -0.6366454, 2.113418, 0, 0.4941176, 1, 1,
0.2039497, 0.6439558, -0.8040392, 0, 0.4901961, 1, 1,
0.2043626, -0.8374359, 3.690902, 0, 0.4823529, 1, 1,
0.2065419, 0.5128439, -1.131156, 0, 0.4784314, 1, 1,
0.2079483, -1.648434, 2.63976, 0, 0.4705882, 1, 1,
0.2224417, 0.5645968, 1.618743, 0, 0.4666667, 1, 1,
0.2283276, -0.01567362, 2.340877, 0, 0.4588235, 1, 1,
0.2328108, -0.4149201, 3.45543, 0, 0.454902, 1, 1,
0.2334355, 0.6201373, 2.433466, 0, 0.4470588, 1, 1,
0.2353663, 1.850397, 1.142928, 0, 0.4431373, 1, 1,
0.2385319, -0.08976635, 0.05453017, 0, 0.4352941, 1, 1,
0.2436234, 0.6979067, 0.2130274, 0, 0.4313726, 1, 1,
0.2448321, 0.8943215, 0.09017801, 0, 0.4235294, 1, 1,
0.2497718, 0.9603853, 0.5633272, 0, 0.4196078, 1, 1,
0.2540893, 0.2074009, 1.805337, 0, 0.4117647, 1, 1,
0.256803, 1.824936, 0.6075395, 0, 0.4078431, 1, 1,
0.2587346, 0.0125338, 0.7726791, 0, 0.4, 1, 1,
0.262899, 0.08350354, 1.302313, 0, 0.3921569, 1, 1,
0.2629153, -0.4794624, 2.662516, 0, 0.3882353, 1, 1,
0.2635133, -0.6817608, 2.045273, 0, 0.3803922, 1, 1,
0.2637644, 1.825547, -0.08326253, 0, 0.3764706, 1, 1,
0.2643448, 0.2521386, 1.205459, 0, 0.3686275, 1, 1,
0.2645365, -0.08822878, 1.411479, 0, 0.3647059, 1, 1,
0.2649572, -0.7819903, 2.064555, 0, 0.3568628, 1, 1,
0.2681977, 1.196796, 0.06066941, 0, 0.3529412, 1, 1,
0.2742093, -0.01923997, 0.9193501, 0, 0.345098, 1, 1,
0.2786689, -1.541663, 2.461761, 0, 0.3411765, 1, 1,
0.2789191, -0.6997464, 3.097532, 0, 0.3333333, 1, 1,
0.2824147, -0.312696, 2.717381, 0, 0.3294118, 1, 1,
0.2829326, -0.7487324, 1.611667, 0, 0.3215686, 1, 1,
0.2833317, -0.9587062, 2.934484, 0, 0.3176471, 1, 1,
0.2850546, -0.08387205, 2.595767, 0, 0.3098039, 1, 1,
0.2872325, 1.1972, -0.6283462, 0, 0.3058824, 1, 1,
0.3024779, 1.158739, 0.3413699, 0, 0.2980392, 1, 1,
0.3037045, 0.1125122, 1.346982, 0, 0.2901961, 1, 1,
0.3053716, -0.4470871, 2.388967, 0, 0.2862745, 1, 1,
0.3086306, -0.7153997, 2.265012, 0, 0.2784314, 1, 1,
0.3110309, 0.8019852, -0.4587113, 0, 0.2745098, 1, 1,
0.3168705, -1.102448, 2.764789, 0, 0.2666667, 1, 1,
0.3184527, -1.063622, 2.000952, 0, 0.2627451, 1, 1,
0.3197766, -0.5283123, 0.9435188, 0, 0.254902, 1, 1,
0.3201508, 0.2571195, 1.088588, 0, 0.2509804, 1, 1,
0.3208326, 0.5434473, 1.030349, 0, 0.2431373, 1, 1,
0.3215676, 0.2536417, -0.7183789, 0, 0.2392157, 1, 1,
0.3219886, 2.701578, -0.4657108, 0, 0.2313726, 1, 1,
0.3259459, 0.1881306, 1.545413, 0, 0.227451, 1, 1,
0.3286179, -1.066479, 1.891549, 0, 0.2196078, 1, 1,
0.3302598, 0.5286812, 1.154852, 0, 0.2156863, 1, 1,
0.3314889, -0.7868149, 4.693403, 0, 0.2078431, 1, 1,
0.3325649, 1.616278, 1.111577, 0, 0.2039216, 1, 1,
0.3356186, 0.1430368, 0.9602776, 0, 0.1960784, 1, 1,
0.3358832, -0.5509627, 1.997888, 0, 0.1882353, 1, 1,
0.3407315, -0.6425337, 2.698189, 0, 0.1843137, 1, 1,
0.3478044, 0.5002369, 0.7278879, 0, 0.1764706, 1, 1,
0.3499116, -0.6719474, 2.608137, 0, 0.172549, 1, 1,
0.3505075, 1.108225, -0.6920892, 0, 0.1647059, 1, 1,
0.3520924, 0.1437063, 1.289591, 0, 0.1607843, 1, 1,
0.3533897, 0.08166138, 0.6527374, 0, 0.1529412, 1, 1,
0.354143, 1.828057, 0.2315259, 0, 0.1490196, 1, 1,
0.3565654, -0.7510212, 1.335005, 0, 0.1411765, 1, 1,
0.3605429, -1.022709, 2.048679, 0, 0.1372549, 1, 1,
0.3608032, -0.6583284, 3.235573, 0, 0.1294118, 1, 1,
0.3623378, -0.4773583, 3.44756, 0, 0.1254902, 1, 1,
0.3711789, 0.7358555, 1.406237, 0, 0.1176471, 1, 1,
0.3728679, -0.06802594, 0.8596392, 0, 0.1137255, 1, 1,
0.3813071, 0.5424544, 0.4853772, 0, 0.1058824, 1, 1,
0.3815086, 0.833859, -0.6971391, 0, 0.09803922, 1, 1,
0.3836257, 1.61333, -1.150828, 0, 0.09411765, 1, 1,
0.3842988, -0.8716494, 3.270057, 0, 0.08627451, 1, 1,
0.3868408, -0.4761437, 0.7216496, 0, 0.08235294, 1, 1,
0.3910638, 1.283869, 0.1583165, 0, 0.07450981, 1, 1,
0.3920204, -0.343826, 2.684622, 0, 0.07058824, 1, 1,
0.4003583, 0.4382212, 0.2154899, 0, 0.0627451, 1, 1,
0.4057185, -0.1212615, 1.44644, 0, 0.05882353, 1, 1,
0.4082609, 0.3129964, 1.061377, 0, 0.05098039, 1, 1,
0.4096072, -0.1289314, 1.10534, 0, 0.04705882, 1, 1,
0.4133069, -0.1090502, 1.42863, 0, 0.03921569, 1, 1,
0.418709, -0.3113123, 2.146886, 0, 0.03529412, 1, 1,
0.4204032, 0.8483046, 3.580439, 0, 0.02745098, 1, 1,
0.4204203, 0.2941958, 1.435292, 0, 0.02352941, 1, 1,
0.4220969, 0.7128633, 1.442096, 0, 0.01568628, 1, 1,
0.4222093, -0.7395769, 2.918192, 0, 0.01176471, 1, 1,
0.4224971, -0.4611744, 3.102623, 0, 0.003921569, 1, 1,
0.4262857, 0.7617334, 1.462027, 0.003921569, 0, 1, 1,
0.435398, 0.9416298, 0.6482509, 0.007843138, 0, 1, 1,
0.4435985, -0.2710218, 2.259865, 0.01568628, 0, 1, 1,
0.4444427, 1.726123, -0.06482521, 0.01960784, 0, 1, 1,
0.4486107, 0.1641983, 1.493402, 0.02745098, 0, 1, 1,
0.4527546, 0.2240507, 1.64126, 0.03137255, 0, 1, 1,
0.4570145, 1.167243, 1.098889, 0.03921569, 0, 1, 1,
0.4575324, 0.1685954, 1.502321, 0.04313726, 0, 1, 1,
0.457942, 1.800658, 1.164056, 0.05098039, 0, 1, 1,
0.4585398, -0.1752026, 2.340224, 0.05490196, 0, 1, 1,
0.4585998, 0.4264118, 0.7579654, 0.0627451, 0, 1, 1,
0.4601411, 2.731961, 0.762292, 0.06666667, 0, 1, 1,
0.4626419, 0.2161839, 2.971322, 0.07450981, 0, 1, 1,
0.4630412, 0.2267097, 2.363938, 0.07843138, 0, 1, 1,
0.4655416, -0.2278477, 1.13917, 0.08627451, 0, 1, 1,
0.4676204, 1.322568, 0.1814407, 0.09019608, 0, 1, 1,
0.4677247, 1.148019, -0.2845695, 0.09803922, 0, 1, 1,
0.4679076, 0.7480893, 2.715863, 0.1058824, 0, 1, 1,
0.4688103, 0.07437562, 2.871718, 0.1098039, 0, 1, 1,
0.4688432, -2.080219, 1.929856, 0.1176471, 0, 1, 1,
0.4726533, -0.2203275, 0.3372157, 0.1215686, 0, 1, 1,
0.4728849, 0.5364256, 2.683508, 0.1294118, 0, 1, 1,
0.474277, 1.696965, -1.035137, 0.1333333, 0, 1, 1,
0.4755452, -0.5925241, 4.140963, 0.1411765, 0, 1, 1,
0.4768192, 1.218192, 1.805991, 0.145098, 0, 1, 1,
0.4846382, -0.866774, 1.805715, 0.1529412, 0, 1, 1,
0.48792, 0.7726395, 1.292283, 0.1568628, 0, 1, 1,
0.4897261, 1.176177, 0.8116912, 0.1647059, 0, 1, 1,
0.4908164, 0.05659827, -0.5517058, 0.1686275, 0, 1, 1,
0.4930076, -0.006144306, 0.9098451, 0.1764706, 0, 1, 1,
0.4941995, -0.1147925, 0.7885558, 0.1803922, 0, 1, 1,
0.4964766, 0.8398211, 2.784182, 0.1882353, 0, 1, 1,
0.5008876, 0.926297, 1.243934, 0.1921569, 0, 1, 1,
0.5050736, -0.02996897, 2.381594, 0.2, 0, 1, 1,
0.5057575, 0.2472371, 2.807516, 0.2078431, 0, 1, 1,
0.5097478, 0.9655416, 0.2799327, 0.2117647, 0, 1, 1,
0.5098531, 0.3004332, 0.6191375, 0.2196078, 0, 1, 1,
0.5108743, 0.3420525, 1.892644, 0.2235294, 0, 1, 1,
0.5230631, -0.345853, 2.518402, 0.2313726, 0, 1, 1,
0.5299184, -0.3024506, 0.6841446, 0.2352941, 0, 1, 1,
0.5347566, 0.3810013, -0.2530837, 0.2431373, 0, 1, 1,
0.5353438, 0.609568, 1.1197, 0.2470588, 0, 1, 1,
0.5357503, 1.48736, 0.9897673, 0.254902, 0, 1, 1,
0.5365437, 0.3000593, 0.8268788, 0.2588235, 0, 1, 1,
0.5385734, 0.4377261, 2.999831, 0.2666667, 0, 1, 1,
0.5467911, -0.1205648, 1.542125, 0.2705882, 0, 1, 1,
0.5468711, 0.2419325, 0.06130402, 0.2784314, 0, 1, 1,
0.5491447, -1.172391, 2.739033, 0.282353, 0, 1, 1,
0.5518935, 0.7263428, -0.1858589, 0.2901961, 0, 1, 1,
0.5520391, -1.000184, 1.778799, 0.2941177, 0, 1, 1,
0.5520945, -0.009719885, 2.470122, 0.3019608, 0, 1, 1,
0.556419, -0.6719029, 1.465419, 0.3098039, 0, 1, 1,
0.562956, -0.03099095, 2.048973, 0.3137255, 0, 1, 1,
0.5682523, 0.5690914, 2.346321, 0.3215686, 0, 1, 1,
0.5720071, 0.1659263, 0.644197, 0.3254902, 0, 1, 1,
0.5755008, -0.677691, 2.638556, 0.3333333, 0, 1, 1,
0.5791597, 0.2198234, -0.5458065, 0.3372549, 0, 1, 1,
0.5844232, -0.4209942, 3.043057, 0.345098, 0, 1, 1,
0.588294, 0.814684, -0.8421342, 0.3490196, 0, 1, 1,
0.5886631, -1.330822, 2.550617, 0.3568628, 0, 1, 1,
0.5907733, 1.533755, -0.9201539, 0.3607843, 0, 1, 1,
0.5914647, 1.708344, -0.4748479, 0.3686275, 0, 1, 1,
0.59157, -0.01243776, 4.329145, 0.372549, 0, 1, 1,
0.5934962, -1.603809, 3.808335, 0.3803922, 0, 1, 1,
0.5939415, 0.5613982, -0.01568478, 0.3843137, 0, 1, 1,
0.5968444, -0.8096782, 2.292836, 0.3921569, 0, 1, 1,
0.6001468, -0.5961194, 3.956697, 0.3960784, 0, 1, 1,
0.6059637, 0.6049182, 1.09361, 0.4039216, 0, 1, 1,
0.6060466, 1.470767, 0.780694, 0.4117647, 0, 1, 1,
0.6067764, 2.050621, -0.8133197, 0.4156863, 0, 1, 1,
0.6119655, -0.2216711, 1.987377, 0.4235294, 0, 1, 1,
0.621819, -1.02081, 3.29416, 0.427451, 0, 1, 1,
0.621859, 0.7894083, 0.4120577, 0.4352941, 0, 1, 1,
0.624333, 1.939093, -0.3097555, 0.4392157, 0, 1, 1,
0.6267037, 0.6511849, 0.5558705, 0.4470588, 0, 1, 1,
0.6268499, 1.533295, 0.502127, 0.4509804, 0, 1, 1,
0.6325592, 1.224454, 0.05144729, 0.4588235, 0, 1, 1,
0.6366796, -0.7240623, 2.773481, 0.4627451, 0, 1, 1,
0.6367976, -0.3264468, 2.448987, 0.4705882, 0, 1, 1,
0.6393391, -0.6016078, 2.887173, 0.4745098, 0, 1, 1,
0.6404878, 0.2863848, 1.811591, 0.4823529, 0, 1, 1,
0.6440978, 1.328664, 0.193136, 0.4862745, 0, 1, 1,
0.6454734, -0.3085406, 1.570927, 0.4941176, 0, 1, 1,
0.6543674, -0.06185967, 1.410931, 0.5019608, 0, 1, 1,
0.6590442, -0.006509848, 2.150715, 0.5058824, 0, 1, 1,
0.6602669, 1.355, 0.5439967, 0.5137255, 0, 1, 1,
0.6624851, -0.5245394, 1.49053, 0.5176471, 0, 1, 1,
0.6648836, -1.277952, 1.272387, 0.5254902, 0, 1, 1,
0.6651226, -1.542405, 2.469614, 0.5294118, 0, 1, 1,
0.6681992, 1.285719, -1.506204, 0.5372549, 0, 1, 1,
0.6775738, -0.7845322, 1.813601, 0.5411765, 0, 1, 1,
0.678816, -0.06239361, 2.557818, 0.5490196, 0, 1, 1,
0.6789617, 1.242239, 2.677035, 0.5529412, 0, 1, 1,
0.6791731, 0.7855537, 1.928668, 0.5607843, 0, 1, 1,
0.6828331, 0.1642006, -0.2353566, 0.5647059, 0, 1, 1,
0.689545, 2.507479, -1.388925, 0.572549, 0, 1, 1,
0.6902074, -0.01425488, 2.308682, 0.5764706, 0, 1, 1,
0.690249, 0.798458, 0.7078249, 0.5843138, 0, 1, 1,
0.6921671, 0.6754601, 0.8683038, 0.5882353, 0, 1, 1,
0.7052488, 0.07159635, 0.7490326, 0.5960785, 0, 1, 1,
0.7073537, -1.333794, 1.219371, 0.6039216, 0, 1, 1,
0.7100683, -0.315509, 1.349442, 0.6078432, 0, 1, 1,
0.7165027, -0.3834395, 2.324441, 0.6156863, 0, 1, 1,
0.7233309, -0.1215627, 1.01006, 0.6196079, 0, 1, 1,
0.724006, 0.5671086, 2.694764, 0.627451, 0, 1, 1,
0.7290523, 1.467374, 0.8971912, 0.6313726, 0, 1, 1,
0.7394295, 1.093421, 0.5114226, 0.6392157, 0, 1, 1,
0.7395881, -2.168552, 3.957341, 0.6431373, 0, 1, 1,
0.7458099, -1.212831, 4.108669, 0.6509804, 0, 1, 1,
0.7466198, 0.9890795, -0.5807823, 0.654902, 0, 1, 1,
0.7487836, -1.701796, 2.60226, 0.6627451, 0, 1, 1,
0.7537577, -0.3057951, 2.611086, 0.6666667, 0, 1, 1,
0.7553046, -0.1760152, 1.921601, 0.6745098, 0, 1, 1,
0.7567319, 0.9636719, 0.251517, 0.6784314, 0, 1, 1,
0.7602441, -1.658672, 1.82502, 0.6862745, 0, 1, 1,
0.7639967, 0.7750527, 1.576242, 0.6901961, 0, 1, 1,
0.7690058, 0.7809486, 0.3759923, 0.6980392, 0, 1, 1,
0.7712129, -0.5181133, 3.434684, 0.7058824, 0, 1, 1,
0.7752749, 0.06265865, 1.080929, 0.7098039, 0, 1, 1,
0.7754534, 0.3553905, 1.223866, 0.7176471, 0, 1, 1,
0.7823731, -0.7999531, 3.45962, 0.7215686, 0, 1, 1,
0.7828512, -1.472259, 3.911314, 0.7294118, 0, 1, 1,
0.7840944, -0.6656728, 1.673588, 0.7333333, 0, 1, 1,
0.7863014, -0.4617224, 2.131394, 0.7411765, 0, 1, 1,
0.7881793, 0.6138811, 1.084396, 0.7450981, 0, 1, 1,
0.7977222, -2.425699, 1.360261, 0.7529412, 0, 1, 1,
0.7980123, -0.2559254, 3.425177, 0.7568628, 0, 1, 1,
0.8084111, 0.02180037, 1.857628, 0.7647059, 0, 1, 1,
0.8139558, -0.05110916, 1.924312, 0.7686275, 0, 1, 1,
0.8205915, 0.0866081, -0.0763101, 0.7764706, 0, 1, 1,
0.8223645, 0.7212585, 0.4470696, 0.7803922, 0, 1, 1,
0.8236438, 0.7655389, -0.4460132, 0.7882353, 0, 1, 1,
0.8298696, -0.7950886, 1.722109, 0.7921569, 0, 1, 1,
0.8359687, -0.02031869, 1.879983, 0.8, 0, 1, 1,
0.838447, -1.658013, 2.165964, 0.8078431, 0, 1, 1,
0.8389726, -0.3731717, 0.5434045, 0.8117647, 0, 1, 1,
0.8393252, 0.7191989, 1.693394, 0.8196079, 0, 1, 1,
0.8394431, 0.6318217, 0.2280008, 0.8235294, 0, 1, 1,
0.8406941, 0.4277314, -0.04609115, 0.8313726, 0, 1, 1,
0.8429671, -0.08721744, 2.260988, 0.8352941, 0, 1, 1,
0.8524806, -0.781457, 2.80564, 0.8431373, 0, 1, 1,
0.856335, 0.8632105, -0.0588421, 0.8470588, 0, 1, 1,
0.8627423, -2.287267, 2.706031, 0.854902, 0, 1, 1,
0.8669848, 0.3757404, 0.01491785, 0.8588235, 0, 1, 1,
0.8686727, 0.09396207, 0.2660107, 0.8666667, 0, 1, 1,
0.8692614, 0.2662644, 4.310691, 0.8705882, 0, 1, 1,
0.8806196, 0.1886877, 0.77627, 0.8784314, 0, 1, 1,
0.8909966, -0.7833496, 0.9336668, 0.8823529, 0, 1, 1,
0.8973777, -1.753803, 2.033623, 0.8901961, 0, 1, 1,
0.9000312, 0.8370239, 1.012769, 0.8941177, 0, 1, 1,
0.9125781, -0.5525519, 2.698037, 0.9019608, 0, 1, 1,
0.9163581, 0.0950117, 2.822782, 0.9098039, 0, 1, 1,
0.9177523, -1.704536, 3.535768, 0.9137255, 0, 1, 1,
0.9190505, 0.6970884, 1.304221, 0.9215686, 0, 1, 1,
0.9192848, -1.177318, 2.118279, 0.9254902, 0, 1, 1,
0.9249269, -0.2390489, 2.039242, 0.9333333, 0, 1, 1,
0.925286, -1.524192, 2.871934, 0.9372549, 0, 1, 1,
0.926549, 1.027098, -0.1049147, 0.945098, 0, 1, 1,
0.926857, 0.713724, -0.5007358, 0.9490196, 0, 1, 1,
0.9374183, -0.8249041, 2.258013, 0.9568627, 0, 1, 1,
0.938669, 0.4933268, 0.6805659, 0.9607843, 0, 1, 1,
0.9423141, -1.060979, 3.130885, 0.9686275, 0, 1, 1,
0.9592879, -0.8821945, 3.340025, 0.972549, 0, 1, 1,
0.9593393, -0.498582, 0.8936867, 0.9803922, 0, 1, 1,
0.9750406, -0.3374862, 1.826132, 0.9843137, 0, 1, 1,
0.978946, 0.228083, 3.497171, 0.9921569, 0, 1, 1,
0.9813097, -0.2702586, 2.365998, 0.9960784, 0, 1, 1,
0.9813928, -1.417271, 1.332361, 1, 0, 0.9960784, 1,
0.9865691, 1.550119, -1.15444, 1, 0, 0.9882353, 1,
0.9903857, -1.084522, 3.316359, 1, 0, 0.9843137, 1,
0.9935514, -1.17784, -0.07299645, 1, 0, 0.9764706, 1,
0.9946736, 0.5600619, 2.787893, 1, 0, 0.972549, 1,
0.9963076, -1.550902, 2.5884, 1, 0, 0.9647059, 1,
0.9972753, 1.298988, -0.9890122, 1, 0, 0.9607843, 1,
1.001763, 0.5766174, 1.254272, 1, 0, 0.9529412, 1,
1.001943, 1.792216, 1.443897, 1, 0, 0.9490196, 1,
1.011395, 0.7055079, 2.701732, 1, 0, 0.9411765, 1,
1.01192, -1.457975, 0.5182052, 1, 0, 0.9372549, 1,
1.013647, 0.16521, 1.807418, 1, 0, 0.9294118, 1,
1.017189, 1.367735, 1.656704, 1, 0, 0.9254902, 1,
1.017225, 0.09789108, 1.378269, 1, 0, 0.9176471, 1,
1.020523, -0.4914246, 1.567105, 1, 0, 0.9137255, 1,
1.021119, -1.678566, 1.10869, 1, 0, 0.9058824, 1,
1.023955, -1.859396, 3.084906, 1, 0, 0.9019608, 1,
1.025523, -0.3950038, 0.6367919, 1, 0, 0.8941177, 1,
1.027382, 0.9833923, 0.779673, 1, 0, 0.8862745, 1,
1.030731, 0.4555015, 0.1207341, 1, 0, 0.8823529, 1,
1.031392, 0.2888406, 1.489343, 1, 0, 0.8745098, 1,
1.034434, 0.8374668, 0.7395711, 1, 0, 0.8705882, 1,
1.03665, 0.4521441, 0.644855, 1, 0, 0.8627451, 1,
1.041429, -0.1524751, 4.060064, 1, 0, 0.8588235, 1,
1.043735, -0.01243047, 2.224538, 1, 0, 0.8509804, 1,
1.058216, 1.120945, 0.5306483, 1, 0, 0.8470588, 1,
1.061808, -0.8420162, 2.709885, 1, 0, 0.8392157, 1,
1.065307, 1.270273, -0.9569753, 1, 0, 0.8352941, 1,
1.079654, 1.100082, -0.1327342, 1, 0, 0.827451, 1,
1.083399, -0.9849952, 2.893231, 1, 0, 0.8235294, 1,
1.090885, 0.0433251, 1.74119, 1, 0, 0.8156863, 1,
1.092284, 1.274204, 0.1495215, 1, 0, 0.8117647, 1,
1.093801, -0.3811825, 3.165483, 1, 0, 0.8039216, 1,
1.097907, -0.0657569, 0.9171175, 1, 0, 0.7960784, 1,
1.112578, 2.810091, 0.7257016, 1, 0, 0.7921569, 1,
1.114495, 0.685003, 2.196918, 1, 0, 0.7843137, 1,
1.11464, 1.214762, -0.5035439, 1, 0, 0.7803922, 1,
1.127172, -0.2823377, 0.6913533, 1, 0, 0.772549, 1,
1.128999, 1.308641, -0.1759883, 1, 0, 0.7686275, 1,
1.130051, 1.209658, 0.2344759, 1, 0, 0.7607843, 1,
1.132069, -0.686632, 2.026335, 1, 0, 0.7568628, 1,
1.132433, 0.2063701, 1.598133, 1, 0, 0.7490196, 1,
1.133957, 0.3723811, 3.733142, 1, 0, 0.7450981, 1,
1.133994, -0.4801962, 2.002251, 1, 0, 0.7372549, 1,
1.134412, 1.355171, -0.8538812, 1, 0, 0.7333333, 1,
1.139246, -0.5938676, -0.1055286, 1, 0, 0.7254902, 1,
1.140241, -0.9076529, 2.060773, 1, 0, 0.7215686, 1,
1.142702, -0.415652, 1.846524, 1, 0, 0.7137255, 1,
1.143578, -1.197003, 3.674721, 1, 0, 0.7098039, 1,
1.155119, 0.2754317, 1.634516, 1, 0, 0.7019608, 1,
1.156751, 0.9516384, 0.26149, 1, 0, 0.6941177, 1,
1.158266, -1.039267, 3.215906, 1, 0, 0.6901961, 1,
1.16008, 0.8091543, 0.1496227, 1, 0, 0.682353, 1,
1.161069, -0.2135542, 1.987274, 1, 0, 0.6784314, 1,
1.166381, -0.2024982, 1.243775, 1, 0, 0.6705883, 1,
1.168976, 1.305434, 2.01422, 1, 0, 0.6666667, 1,
1.173784, 0.6814806, 1.61856, 1, 0, 0.6588235, 1,
1.177614, 0.4545814, 2.140925, 1, 0, 0.654902, 1,
1.181805, 0.5398251, 1.073337, 1, 0, 0.6470588, 1,
1.182885, -0.2155455, 1.542906, 1, 0, 0.6431373, 1,
1.186074, 0.2564872, 2.555941, 1, 0, 0.6352941, 1,
1.193578, 1.815168, 1.41202, 1, 0, 0.6313726, 1,
1.194673, 1.705262, 2.114415, 1, 0, 0.6235294, 1,
1.197064, -1.248541, 0.779708, 1, 0, 0.6196079, 1,
1.204924, -2.059319, 3.0154, 1, 0, 0.6117647, 1,
1.211505, 0.4492193, 0.842011, 1, 0, 0.6078432, 1,
1.226353, 0.3723273, 2.240353, 1, 0, 0.6, 1,
1.230729, -0.5778441, 2.884173, 1, 0, 0.5921569, 1,
1.235328, 1.205194, 2.014823, 1, 0, 0.5882353, 1,
1.235583, 0.6300219, 1.463565, 1, 0, 0.5803922, 1,
1.239612, 0.0189617, 2.183268, 1, 0, 0.5764706, 1,
1.239883, 0.127684, 2.865071, 1, 0, 0.5686275, 1,
1.250625, -1.629032, 2.677776, 1, 0, 0.5647059, 1,
1.252578, 1.132098, -0.609516, 1, 0, 0.5568628, 1,
1.266215, -0.9498217, 0.6204066, 1, 0, 0.5529412, 1,
1.267913, -0.8562037, 3.534068, 1, 0, 0.5450981, 1,
1.268947, 0.6709935, 2.49075, 1, 0, 0.5411765, 1,
1.269305, -0.5032694, 2.839771, 1, 0, 0.5333334, 1,
1.272954, 0.4414493, 0.06073323, 1, 0, 0.5294118, 1,
1.275717, 0.4673181, 0.9423903, 1, 0, 0.5215687, 1,
1.278031, -0.03150865, 0.6726707, 1, 0, 0.5176471, 1,
1.282602, -0.07590442, 0.8149719, 1, 0, 0.509804, 1,
1.282796, 0.2962157, 0.4870327, 1, 0, 0.5058824, 1,
1.290384, 0.7408094, -1.242218, 1, 0, 0.4980392, 1,
1.290575, -0.9768475, 2.384617, 1, 0, 0.4901961, 1,
1.294731, -0.0656675, 2.52568, 1, 0, 0.4862745, 1,
1.299181, 0.5100325, -0.6630074, 1, 0, 0.4784314, 1,
1.305069, 1.074766, 1.11031, 1, 0, 0.4745098, 1,
1.32474, 0.8027303, 1.970408, 1, 0, 0.4666667, 1,
1.335706, -1.399547, 3.945455, 1, 0, 0.4627451, 1,
1.337358, -1.518368, 1.516967, 1, 0, 0.454902, 1,
1.339329, -0.2850424, 1.338491, 1, 0, 0.4509804, 1,
1.342778, 0.4164324, -0.421093, 1, 0, 0.4431373, 1,
1.349367, 0.7794032, 1.598641, 1, 0, 0.4392157, 1,
1.354824, -0.2378889, 1.918645, 1, 0, 0.4313726, 1,
1.356415, 0.7496307, 0.1935838, 1, 0, 0.427451, 1,
1.370569, 1.146465, 0.7667621, 1, 0, 0.4196078, 1,
1.375615, 1.210057, 0.7972164, 1, 0, 0.4156863, 1,
1.386034, 0.5005242, 0.9270608, 1, 0, 0.4078431, 1,
1.404244, -1.396272, 1.788261, 1, 0, 0.4039216, 1,
1.424164, -1.419416, 2.897691, 1, 0, 0.3960784, 1,
1.43285, 1.177561, 1.362154, 1, 0, 0.3882353, 1,
1.438031, 0.0459552, 1.774194, 1, 0, 0.3843137, 1,
1.444646, 0.6423861, 1.300547, 1, 0, 0.3764706, 1,
1.445635, 1.715717, 0.1412683, 1, 0, 0.372549, 1,
1.450585, -1.091275, 1.825559, 1, 0, 0.3647059, 1,
1.528615, 0.7883322, 0.3159592, 1, 0, 0.3607843, 1,
1.543769, -0.8284843, 1.707901, 1, 0, 0.3529412, 1,
1.552396, 0.2954015, 1.403309, 1, 0, 0.3490196, 1,
1.564167, 0.267702, 0.7884852, 1, 0, 0.3411765, 1,
1.569277, 0.7619655, 4.260961, 1, 0, 0.3372549, 1,
1.577557, 2.312817, 2.733605, 1, 0, 0.3294118, 1,
1.579255, -0.3479966, 3.30037, 1, 0, 0.3254902, 1,
1.58627, 0.676964, -0.2474367, 1, 0, 0.3176471, 1,
1.633448, 0.5409907, 0.884339, 1, 0, 0.3137255, 1,
1.634742, 2.323675, -0.5451082, 1, 0, 0.3058824, 1,
1.640664, 0.1025172, 0.867589, 1, 0, 0.2980392, 1,
1.660972, -2.174161, 2.212066, 1, 0, 0.2941177, 1,
1.661467, 0.2173712, 3.0503, 1, 0, 0.2862745, 1,
1.676212, 0.8197914, -0.3026637, 1, 0, 0.282353, 1,
1.682176, -0.5511643, 1.321588, 1, 0, 0.2745098, 1,
1.705919, 2.320735, 2.010695, 1, 0, 0.2705882, 1,
1.712772, -1.200245, -0.3716056, 1, 0, 0.2627451, 1,
1.725989, 0.3776167, 0.4069368, 1, 0, 0.2588235, 1,
1.731092, 0.1534584, 1.921755, 1, 0, 0.2509804, 1,
1.745726, -1.757478, 2.238708, 1, 0, 0.2470588, 1,
1.75517, 0.1975695, -0.2184329, 1, 0, 0.2392157, 1,
1.770177, 0.7802182, 1.894594, 1, 0, 0.2352941, 1,
1.781528, -0.2702201, 1.228044, 1, 0, 0.227451, 1,
1.795325, -0.2339812, 3.114773, 1, 0, 0.2235294, 1,
1.801326, 0.4895125, 1.473998, 1, 0, 0.2156863, 1,
1.81368, -1.291561, 0.9030623, 1, 0, 0.2117647, 1,
1.822137, -1.029993, 1.531613, 1, 0, 0.2039216, 1,
1.823516, 1.379509, -0.7014158, 1, 0, 0.1960784, 1,
1.836189, 1.097423, 0.3075117, 1, 0, 0.1921569, 1,
1.858355, -0.9613244, 1.310295, 1, 0, 0.1843137, 1,
1.870199, 0.2126286, 1.907369, 1, 0, 0.1803922, 1,
1.905753, 0.9756964, 1.910481, 1, 0, 0.172549, 1,
1.928152, -0.1907709, 2.87638, 1, 0, 0.1686275, 1,
1.93353, 0.2999186, 0.7765587, 1, 0, 0.1607843, 1,
1.947566, 0.2860013, -1.093375, 1, 0, 0.1568628, 1,
1.948009, 2.16583, 1.362038, 1, 0, 0.1490196, 1,
1.961577, -1.252849, 1.087629, 1, 0, 0.145098, 1,
2.064058, 0.1997782, 1.102843, 1, 0, 0.1372549, 1,
2.077101, -0.3822514, 0.9185144, 1, 0, 0.1333333, 1,
2.101969, -0.5942876, 0.6277558, 1, 0, 0.1254902, 1,
2.111684, 0.3672153, 1.453634, 1, 0, 0.1215686, 1,
2.163046, 0.6820792, 1.715562, 1, 0, 0.1137255, 1,
2.232573, 1.040034, 1.14055, 1, 0, 0.1098039, 1,
2.275978, -0.1159135, 0.6997408, 1, 0, 0.1019608, 1,
2.290589, -0.4570702, 1.086295, 1, 0, 0.09411765, 1,
2.307095, -0.06984314, 1.599501, 1, 0, 0.09019608, 1,
2.310907, -0.4362181, 0.8616121, 1, 0, 0.08235294, 1,
2.32074, -0.5957118, 1.959568, 1, 0, 0.07843138, 1,
2.322444, -0.4583728, 3.201372, 1, 0, 0.07058824, 1,
2.341877, 0.4518014, 0.1643467, 1, 0, 0.06666667, 1,
2.470417, -0.8697622, 2.126511, 1, 0, 0.05882353, 1,
2.521049, 0.9133093, 2.876404, 1, 0, 0.05490196, 1,
2.702974, 1.842686, -0.3685237, 1, 0, 0.04705882, 1,
2.78591, -0.6409867, 0.2092951, 1, 0, 0.04313726, 1,
3.022512, -0.8195688, 0.2308383, 1, 0, 0.03529412, 1,
3.045511, 0.6455294, 2.430862, 1, 0, 0.03137255, 1,
3.058229, -0.592352, 0.795917, 1, 0, 0.02352941, 1,
3.067671, 1.047384, 1.49304, 1, 0, 0.01960784, 1,
3.22997, 1.131389, 0.6940317, 1, 0, 0.01176471, 1,
3.233571, -0.4332459, 1.438744, 1, 0, 0.007843138, 1
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
0.2084121, -4.012121, -7.96418, 0, -0.5, 0.5, 0.5,
0.2084121, -4.012121, -7.96418, 1, -0.5, 0.5, 0.5,
0.2084121, -4.012121, -7.96418, 1, 1.5, 0.5, 0.5,
0.2084121, -4.012121, -7.96418, 0, 1.5, 0.5, 0.5
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
-3.842276, -0.06404376, -7.96418, 0, -0.5, 0.5, 0.5,
-3.842276, -0.06404376, -7.96418, 1, -0.5, 0.5, 0.5,
-3.842276, -0.06404376, -7.96418, 1, 1.5, 0.5, 0.5,
-3.842276, -0.06404376, -7.96418, 0, 1.5, 0.5, 0.5
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
-3.842276, -4.012121, -0.5548034, 0, -0.5, 0.5, 0.5,
-3.842276, -4.012121, -0.5548034, 1, -0.5, 0.5, 0.5,
-3.842276, -4.012121, -0.5548034, 1, 1.5, 0.5, 0.5,
-3.842276, -4.012121, -0.5548034, 0, 1.5, 0.5, 0.5
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
-2, -3.101026, -6.254324,
3, -3.101026, -6.254324,
-2, -3.101026, -6.254324,
-2, -3.252875, -6.5393,
-1, -3.101026, -6.254324,
-1, -3.252875, -6.5393,
0, -3.101026, -6.254324,
0, -3.252875, -6.5393,
1, -3.101026, -6.254324,
1, -3.252875, -6.5393,
2, -3.101026, -6.254324,
2, -3.252875, -6.5393,
3, -3.101026, -6.254324,
3, -3.252875, -6.5393
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
-2, -3.556573, -7.109252, 0, -0.5, 0.5, 0.5,
-2, -3.556573, -7.109252, 1, -0.5, 0.5, 0.5,
-2, -3.556573, -7.109252, 1, 1.5, 0.5, 0.5,
-2, -3.556573, -7.109252, 0, 1.5, 0.5, 0.5,
-1, -3.556573, -7.109252, 0, -0.5, 0.5, 0.5,
-1, -3.556573, -7.109252, 1, -0.5, 0.5, 0.5,
-1, -3.556573, -7.109252, 1, 1.5, 0.5, 0.5,
-1, -3.556573, -7.109252, 0, 1.5, 0.5, 0.5,
0, -3.556573, -7.109252, 0, -0.5, 0.5, 0.5,
0, -3.556573, -7.109252, 1, -0.5, 0.5, 0.5,
0, -3.556573, -7.109252, 1, 1.5, 0.5, 0.5,
0, -3.556573, -7.109252, 0, 1.5, 0.5, 0.5,
1, -3.556573, -7.109252, 0, -0.5, 0.5, 0.5,
1, -3.556573, -7.109252, 1, -0.5, 0.5, 0.5,
1, -3.556573, -7.109252, 1, 1.5, 0.5, 0.5,
1, -3.556573, -7.109252, 0, 1.5, 0.5, 0.5,
2, -3.556573, -7.109252, 0, -0.5, 0.5, 0.5,
2, -3.556573, -7.109252, 1, -0.5, 0.5, 0.5,
2, -3.556573, -7.109252, 1, 1.5, 0.5, 0.5,
2, -3.556573, -7.109252, 0, 1.5, 0.5, 0.5,
3, -3.556573, -7.109252, 0, -0.5, 0.5, 0.5,
3, -3.556573, -7.109252, 1, -0.5, 0.5, 0.5,
3, -3.556573, -7.109252, 1, 1.5, 0.5, 0.5,
3, -3.556573, -7.109252, 0, 1.5, 0.5, 0.5
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
-2.907502, -3, -6.254324,
-2.907502, 2, -6.254324,
-2.907502, -3, -6.254324,
-3.063298, -3, -6.5393,
-2.907502, -2, -6.254324,
-3.063298, -2, -6.5393,
-2.907502, -1, -6.254324,
-3.063298, -1, -6.5393,
-2.907502, 0, -6.254324,
-3.063298, 0, -6.5393,
-2.907502, 1, -6.254324,
-3.063298, 1, -6.5393,
-2.907502, 2, -6.254324,
-3.063298, 2, -6.5393
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
-3.374889, -3, -7.109252, 0, -0.5, 0.5, 0.5,
-3.374889, -3, -7.109252, 1, -0.5, 0.5, 0.5,
-3.374889, -3, -7.109252, 1, 1.5, 0.5, 0.5,
-3.374889, -3, -7.109252, 0, 1.5, 0.5, 0.5,
-3.374889, -2, -7.109252, 0, -0.5, 0.5, 0.5,
-3.374889, -2, -7.109252, 1, -0.5, 0.5, 0.5,
-3.374889, -2, -7.109252, 1, 1.5, 0.5, 0.5,
-3.374889, -2, -7.109252, 0, 1.5, 0.5, 0.5,
-3.374889, -1, -7.109252, 0, -0.5, 0.5, 0.5,
-3.374889, -1, -7.109252, 1, -0.5, 0.5, 0.5,
-3.374889, -1, -7.109252, 1, 1.5, 0.5, 0.5,
-3.374889, -1, -7.109252, 0, 1.5, 0.5, 0.5,
-3.374889, 0, -7.109252, 0, -0.5, 0.5, 0.5,
-3.374889, 0, -7.109252, 1, -0.5, 0.5, 0.5,
-3.374889, 0, -7.109252, 1, 1.5, 0.5, 0.5,
-3.374889, 0, -7.109252, 0, 1.5, 0.5, 0.5,
-3.374889, 1, -7.109252, 0, -0.5, 0.5, 0.5,
-3.374889, 1, -7.109252, 1, -0.5, 0.5, 0.5,
-3.374889, 1, -7.109252, 1, 1.5, 0.5, 0.5,
-3.374889, 1, -7.109252, 0, 1.5, 0.5, 0.5,
-3.374889, 2, -7.109252, 0, -0.5, 0.5, 0.5,
-3.374889, 2, -7.109252, 1, -0.5, 0.5, 0.5,
-3.374889, 2, -7.109252, 1, 1.5, 0.5, 0.5,
-3.374889, 2, -7.109252, 0, 1.5, 0.5, 0.5
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
-2.907502, -3.101026, -6,
-2.907502, -3.101026, 4,
-2.907502, -3.101026, -6,
-3.063298, -3.252875, -6,
-2.907502, -3.101026, -4,
-3.063298, -3.252875, -4,
-2.907502, -3.101026, -2,
-3.063298, -3.252875, -2,
-2.907502, -3.101026, 0,
-3.063298, -3.252875, 0,
-2.907502, -3.101026, 2,
-3.063298, -3.252875, 2,
-2.907502, -3.101026, 4,
-3.063298, -3.252875, 4
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
-3.374889, -3.556573, -6, 0, -0.5, 0.5, 0.5,
-3.374889, -3.556573, -6, 1, -0.5, 0.5, 0.5,
-3.374889, -3.556573, -6, 1, 1.5, 0.5, 0.5,
-3.374889, -3.556573, -6, 0, 1.5, 0.5, 0.5,
-3.374889, -3.556573, -4, 0, -0.5, 0.5, 0.5,
-3.374889, -3.556573, -4, 1, -0.5, 0.5, 0.5,
-3.374889, -3.556573, -4, 1, 1.5, 0.5, 0.5,
-3.374889, -3.556573, -4, 0, 1.5, 0.5, 0.5,
-3.374889, -3.556573, -2, 0, -0.5, 0.5, 0.5,
-3.374889, -3.556573, -2, 1, -0.5, 0.5, 0.5,
-3.374889, -3.556573, -2, 1, 1.5, 0.5, 0.5,
-3.374889, -3.556573, -2, 0, 1.5, 0.5, 0.5,
-3.374889, -3.556573, 0, 0, -0.5, 0.5, 0.5,
-3.374889, -3.556573, 0, 1, -0.5, 0.5, 0.5,
-3.374889, -3.556573, 0, 1, 1.5, 0.5, 0.5,
-3.374889, -3.556573, 0, 0, 1.5, 0.5, 0.5,
-3.374889, -3.556573, 2, 0, -0.5, 0.5, 0.5,
-3.374889, -3.556573, 2, 1, -0.5, 0.5, 0.5,
-3.374889, -3.556573, 2, 1, 1.5, 0.5, 0.5,
-3.374889, -3.556573, 2, 0, 1.5, 0.5, 0.5,
-3.374889, -3.556573, 4, 0, -0.5, 0.5, 0.5,
-3.374889, -3.556573, 4, 1, -0.5, 0.5, 0.5,
-3.374889, -3.556573, 4, 1, 1.5, 0.5, 0.5,
-3.374889, -3.556573, 4, 0, 1.5, 0.5, 0.5
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
-2.907502, -3.101026, -6.254324,
-2.907502, 2.972938, -6.254324,
-2.907502, -3.101026, 5.144717,
-2.907502, 2.972938, 5.144717,
-2.907502, -3.101026, -6.254324,
-2.907502, -3.101026, 5.144717,
-2.907502, 2.972938, -6.254324,
-2.907502, 2.972938, 5.144717,
-2.907502, -3.101026, -6.254324,
3.324326, -3.101026, -6.254324,
-2.907502, -3.101026, 5.144717,
3.324326, -3.101026, 5.144717,
-2.907502, 2.972938, -6.254324,
3.324326, 2.972938, -6.254324,
-2.907502, 2.972938, 5.144717,
3.324326, 2.972938, 5.144717,
3.324326, -3.101026, -6.254324,
3.324326, 2.972938, -6.254324,
3.324326, -3.101026, 5.144717,
3.324326, 2.972938, 5.144717,
3.324326, -3.101026, -6.254324,
3.324326, -3.101026, 5.144717,
3.324326, 2.972938, -6.254324,
3.324326, 2.972938, 5.144717
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
var radius = 7.657864;
var distance = 34.0707;
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
mvMatrix.translate( -0.2084121, 0.06404376, 0.5548034 );
mvMatrix.scale( 1.328636, 1.363168, 0.7263622 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.0707);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Pirimiphos-Methyl<-read.table("Pirimiphos-Methyl.xyz")
```

```
## Error in read.table("Pirimiphos-Methyl.xyz"): no lines available in input
```

```r
x<-Pirimiphos-Methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
```

```r
y<-Pirimiphos-Methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
```

```r
z<-Pirimiphos-Methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
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
-2.816747, -0.7091792, -1.86666, 0, 0, 1, 1, 1,
-2.632769, 0.7767793, -0.7287279, 1, 0, 0, 1, 1,
-2.632128, 0.5655479, -2.881219, 1, 0, 0, 1, 1,
-2.609613, -0.3381732, 0.01795792, 1, 0, 0, 1, 1,
-2.60439, 0.3532143, -0.1685592, 1, 0, 0, 1, 1,
-2.508425, -0.4633434, -3.516444, 1, 0, 0, 1, 1,
-2.424541, -0.3825448, 0.2794689, 0, 0, 0, 1, 1,
-2.369364, -2.048016, -0.4071632, 0, 0, 0, 1, 1,
-2.347928, 2.587485, -0.1994205, 0, 0, 0, 1, 1,
-2.306939, -1.464969, -3.561445, 0, 0, 0, 1, 1,
-2.285726, -1.47012, -3.754626, 0, 0, 0, 1, 1,
-2.27273, 0.3326855, -0.3573031, 0, 0, 0, 1, 1,
-2.265304, -1.288398, -1.287277, 0, 0, 0, 1, 1,
-2.264992, 2.139503, -1.409968, 1, 1, 1, 1, 1,
-2.247324, -0.3062916, -2.567811, 1, 1, 1, 1, 1,
-2.211987, 1.882199, 1.66231, 1, 1, 1, 1, 1,
-2.168137, -0.07725822, -2.691909, 1, 1, 1, 1, 1,
-2.064976, 0.05054552, -1.878378, 1, 1, 1, 1, 1,
-2.048113, -0.8120132, -1.445337, 1, 1, 1, 1, 1,
-2.038401, 0.6169138, -1.558766, 1, 1, 1, 1, 1,
-2.026966, -0.1699222, -1.720641, 1, 1, 1, 1, 1,
-2.016103, 0.7128133, -1.490468, 1, 1, 1, 1, 1,
-2.001904, 0.452914, -0.7824461, 1, 1, 1, 1, 1,
-1.994755, -1.296374, -2.552905, 1, 1, 1, 1, 1,
-1.974762, -0.4320881, -0.2531664, 1, 1, 1, 1, 1,
-1.959527, 0.03092061, -0.7271217, 1, 1, 1, 1, 1,
-1.944687, -1.711097, -2.371783, 1, 1, 1, 1, 1,
-1.944552, -0.7826548, -1.128137, 1, 1, 1, 1, 1,
-1.942524, 0.1741597, -0.03635556, 0, 0, 1, 1, 1,
-1.912095, 1.482836, -2.303264, 1, 0, 0, 1, 1,
-1.902473, 0.5002615, -1.890169, 1, 0, 0, 1, 1,
-1.897693, 0.7351018, -3.141047, 1, 0, 0, 1, 1,
-1.891343, -0.6112263, -2.575992, 1, 0, 0, 1, 1,
-1.879029, -0.4091345, -3.055874, 1, 0, 0, 1, 1,
-1.789067, -0.4182467, -3.598805, 0, 0, 0, 1, 1,
-1.774949, -1.207549, -3.452596, 0, 0, 0, 1, 1,
-1.746507, 0.6701015, -0.1527549, 0, 0, 0, 1, 1,
-1.725779, -1.202855, -1.457012, 0, 0, 0, 1, 1,
-1.719682, 0.1434415, -0.8784236, 0, 0, 0, 1, 1,
-1.694625, -2.335652, -2.152313, 0, 0, 0, 1, 1,
-1.692319, -0.1034004, -0.6449878, 0, 0, 0, 1, 1,
-1.691902, -1.048647, -0.9183195, 1, 1, 1, 1, 1,
-1.666166, 1.448156, -1.189992, 1, 1, 1, 1, 1,
-1.661068, -0.9057004, -2.101725, 1, 1, 1, 1, 1,
-1.651314, 1.943404, -1.594871, 1, 1, 1, 1, 1,
-1.65063, 0.8876679, 0.7772345, 1, 1, 1, 1, 1,
-1.629386, 0.3402708, -0.92934, 1, 1, 1, 1, 1,
-1.627272, -0.3891748, -2.544282, 1, 1, 1, 1, 1,
-1.623975, 0.07026524, -3.772102, 1, 1, 1, 1, 1,
-1.613339, -0.253484, -3.999449, 1, 1, 1, 1, 1,
-1.609128, 0.5564693, -0.8069791, 1, 1, 1, 1, 1,
-1.596712, -1.016976, -3.132367, 1, 1, 1, 1, 1,
-1.595281, -0.5224434, -1.080816, 1, 1, 1, 1, 1,
-1.593333, 1.045112, -1.378132, 1, 1, 1, 1, 1,
-1.587051, 1.139316, 0.1991701, 1, 1, 1, 1, 1,
-1.580965, 0.5575964, -1.904566, 1, 1, 1, 1, 1,
-1.580491, -0.2626998, -2.878549, 0, 0, 1, 1, 1,
-1.580302, 0.9251451, -1.643431, 1, 0, 0, 1, 1,
-1.568424, 0.06836204, -1.83523, 1, 0, 0, 1, 1,
-1.555964, 1.956044, 0.7661953, 1, 0, 0, 1, 1,
-1.553785, -0.9900367, -1.473264, 1, 0, 0, 1, 1,
-1.543852, 1.065056, -0.8346506, 1, 0, 0, 1, 1,
-1.540793, -0.925364, -1.901363, 0, 0, 0, 1, 1,
-1.528026, -0.3306189, -0.9909598, 0, 0, 0, 1, 1,
-1.52112, -0.1248691, -0.8022493, 0, 0, 0, 1, 1,
-1.513594, 1.295871, -2.52114, 0, 0, 0, 1, 1,
-1.499127, 0.03484443, -1.473117, 0, 0, 0, 1, 1,
-1.491439, 0.6974027, -0.1087438, 0, 0, 0, 1, 1,
-1.486491, -0.8901151, -1.329331, 0, 0, 0, 1, 1,
-1.4862, -2.868202, -3.355655, 1, 1, 1, 1, 1,
-1.48576, -0.7153947, -1.864691, 1, 1, 1, 1, 1,
-1.482796, 0.2838156, -1.93065, 1, 1, 1, 1, 1,
-1.462036, 0.3950506, -1.480101, 1, 1, 1, 1, 1,
-1.459054, -1.583979, -3.344985, 1, 1, 1, 1, 1,
-1.449996, 0.4401534, -1.193439, 1, 1, 1, 1, 1,
-1.448446, -2.04016, -2.418083, 1, 1, 1, 1, 1,
-1.441921, 0.2536721, -1.338622, 1, 1, 1, 1, 1,
-1.440518, -0.1840492, -1.739294, 1, 1, 1, 1, 1,
-1.439006, 0.2326493, -1.311872, 1, 1, 1, 1, 1,
-1.430715, -1.515812, -2.503747, 1, 1, 1, 1, 1,
-1.428548, 1.146019, -0.9005219, 1, 1, 1, 1, 1,
-1.421379, 1.704171, -1.317436, 1, 1, 1, 1, 1,
-1.421044, 0.5940191, -0.5820013, 1, 1, 1, 1, 1,
-1.418839, 1.389783, -1.497579, 1, 1, 1, 1, 1,
-1.411799, -1.640949, -4.48466, 0, 0, 1, 1, 1,
-1.411448, -2.012186, -3.476413, 1, 0, 0, 1, 1,
-1.4051, 0.8899164, -0.4966642, 1, 0, 0, 1, 1,
-1.405088, -1.18572, -2.446122, 1, 0, 0, 1, 1,
-1.399679, 0.416583, -1.628346, 1, 0, 0, 1, 1,
-1.396902, -1.458935, -1.804581, 1, 0, 0, 1, 1,
-1.391296, 0.2375412, 0.392249, 0, 0, 0, 1, 1,
-1.375229, 0.04198116, -0.6242786, 0, 0, 0, 1, 1,
-1.367456, -0.01449866, 0.3506868, 0, 0, 0, 1, 1,
-1.359703, -1.406695, -2.235447, 0, 0, 0, 1, 1,
-1.358227, 1.092551, 1.293595, 0, 0, 0, 1, 1,
-1.354937, 1.073755, -0.7092446, 0, 0, 0, 1, 1,
-1.351, 2.041917, -0.01632676, 0, 0, 0, 1, 1,
-1.350399, -0.1068653, -2.639646, 1, 1, 1, 1, 1,
-1.344735, -1.280231, -2.925605, 1, 1, 1, 1, 1,
-1.342552, 1.521505, 1.211271, 1, 1, 1, 1, 1,
-1.338678, 1.333351, -2.036798, 1, 1, 1, 1, 1,
-1.329375, -0.2074513, -2.679014, 1, 1, 1, 1, 1,
-1.327095, 0.3737139, -2.229188, 1, 1, 1, 1, 1,
-1.324379, -1.762647, -1.534516, 1, 1, 1, 1, 1,
-1.319592, -0.5513018, -3.552573, 1, 1, 1, 1, 1,
-1.319411, -0.1004703, -0.1157471, 1, 1, 1, 1, 1,
-1.306996, -1.41282, -2.521698, 1, 1, 1, 1, 1,
-1.305377, 0.9219947, -0.3833388, 1, 1, 1, 1, 1,
-1.297536, -0.2453295, -1.39468, 1, 1, 1, 1, 1,
-1.284683, -3.01257, -2.552237, 1, 1, 1, 1, 1,
-1.280322, 0.1748758, -1.934874, 1, 1, 1, 1, 1,
-1.277334, -1.16443, -2.824189, 1, 1, 1, 1, 1,
-1.277239, 0.623032, -0.958725, 0, 0, 1, 1, 1,
-1.273283, -1.280839, -0.911762, 1, 0, 0, 1, 1,
-1.273218, 0.8893549, -1.310173, 1, 0, 0, 1, 1,
-1.270202, -1.786599, -2.949364, 1, 0, 0, 1, 1,
-1.269333, 0.5060954, -2.888401, 1, 0, 0, 1, 1,
-1.26802, 0.4649274, -2.285846, 1, 0, 0, 1, 1,
-1.252217, 0.7252103, -0.01554591, 0, 0, 0, 1, 1,
-1.246454, -0.1217182, -2.001118, 0, 0, 0, 1, 1,
-1.225312, 0.09526748, -0.9524909, 0, 0, 0, 1, 1,
-1.22146, 0.3121795, -1.619687, 0, 0, 0, 1, 1,
-1.216637, -0.2253019, -0.8840117, 0, 0, 0, 1, 1,
-1.208021, 1.323879, 1.217571, 0, 0, 0, 1, 1,
-1.192133, 0.5236547, -0.817638, 0, 0, 0, 1, 1,
-1.183236, -0.4584782, -0.3743072, 1, 1, 1, 1, 1,
-1.161844, -1.563861, -2.948958, 1, 1, 1, 1, 1,
-1.160921, -1.672101, -2.065481, 1, 1, 1, 1, 1,
-1.153306, 0.06157891, -0.5255259, 1, 1, 1, 1, 1,
-1.152126, 1.552234, -1.496226, 1, 1, 1, 1, 1,
-1.151364, -1.878188, -2.306159, 1, 1, 1, 1, 1,
-1.149767, -0.5719056, -2.746144, 1, 1, 1, 1, 1,
-1.147769, 0.3690785, -3.428801, 1, 1, 1, 1, 1,
-1.138894, -1.168932, -2.240377, 1, 1, 1, 1, 1,
-1.137761, 1.559906, 0.1292554, 1, 1, 1, 1, 1,
-1.128143, 0.9992937, -1.264399, 1, 1, 1, 1, 1,
-1.123917, 0.5903935, -1.311894, 1, 1, 1, 1, 1,
-1.11233, 0.7295479, -0.1734437, 1, 1, 1, 1, 1,
-1.108774, -1.024797, -1.171427, 1, 1, 1, 1, 1,
-1.101892, -1.582231, -1.627675, 1, 1, 1, 1, 1,
-1.100381, 0.179978, -0.4511769, 0, 0, 1, 1, 1,
-1.091461, 0.2386341, 0.2639814, 1, 0, 0, 1, 1,
-1.084895, -0.5323235, -1.074624, 1, 0, 0, 1, 1,
-1.084281, 0.9103675, 1.418293, 1, 0, 0, 1, 1,
-1.062014, 0.8893715, -1.168859, 1, 0, 0, 1, 1,
-1.059739, -0.4667331, -1.644154, 1, 0, 0, 1, 1,
-1.055257, 0.2419948, -2.306519, 0, 0, 0, 1, 1,
-1.03308, -0.1826151, 0.02416994, 0, 0, 0, 1, 1,
-1.031741, 2.017923, -0.4483492, 0, 0, 0, 1, 1,
-1.0286, 0.0600666, -0.3796521, 0, 0, 0, 1, 1,
-1.027957, -0.5179394, -2.36905, 0, 0, 0, 1, 1,
-1.024816, -0.1261869, -1.814992, 0, 0, 0, 1, 1,
-1.018321, -1.419729, -3.320705, 0, 0, 0, 1, 1,
-1.015106, -0.8879172, -0.8677802, 1, 1, 1, 1, 1,
-1.012271, -0.9195672, -1.762657, 1, 1, 1, 1, 1,
-1.010505, -0.6743967, -2.653068, 1, 1, 1, 1, 1,
-1.00963, 2.362261, -2.238893, 1, 1, 1, 1, 1,
-1.00847, -0.3246243, -1.153263, 1, 1, 1, 1, 1,
-1.008188, -0.1085601, -0.9608782, 1, 1, 1, 1, 1,
-1.007513, 0.6745178, -1.008617, 1, 1, 1, 1, 1,
-1.0051, 1.091767, -0.3805311, 1, 1, 1, 1, 1,
-1.002637, 1.499003, -1.038191, 1, 1, 1, 1, 1,
-0.9944808, 0.6065364, -0.9644017, 1, 1, 1, 1, 1,
-0.9902443, 1.132972, -2.014088, 1, 1, 1, 1, 1,
-0.9867101, 0.2358682, -2.561826, 1, 1, 1, 1, 1,
-0.9863586, 0.1088479, -1.534552, 1, 1, 1, 1, 1,
-0.9860594, -0.3192552, -2.151621, 1, 1, 1, 1, 1,
-0.9830115, 0.2282035, -1.788272, 1, 1, 1, 1, 1,
-0.9806243, -0.1164217, -2.633871, 0, 0, 1, 1, 1,
-0.9781833, -0.03911602, -1.10106, 1, 0, 0, 1, 1,
-0.9746187, 0.08252747, -2.043748, 1, 0, 0, 1, 1,
-0.9733714, -0.4497543, -3.825926, 1, 0, 0, 1, 1,
-0.9628698, 0.003092068, -0.9861335, 1, 0, 0, 1, 1,
-0.959073, 1.938317, -1.743615, 1, 0, 0, 1, 1,
-0.9572552, 1.74677, 0.2908391, 0, 0, 0, 1, 1,
-0.9531871, -0.7039985, -2.307555, 0, 0, 0, 1, 1,
-0.9369566, 0.06864018, -0.6496385, 0, 0, 0, 1, 1,
-0.9292859, 1.015538, -1.132243, 0, 0, 0, 1, 1,
-0.9259049, -0.5600149, -2.758141, 0, 0, 0, 1, 1,
-0.9193282, -0.2773334, -2.644214, 0, 0, 0, 1, 1,
-0.9189487, 0.1207611, -3.674192, 0, 0, 0, 1, 1,
-0.9182321, 0.4543712, 0.1329323, 1, 1, 1, 1, 1,
-0.9154139, -0.04869388, -1.572735, 1, 1, 1, 1, 1,
-0.9102386, -1.408703, -2.748388, 1, 1, 1, 1, 1,
-0.8967407, -0.02137032, -1.955009, 1, 1, 1, 1, 1,
-0.8943352, -1.260699, -3.579274, 1, 1, 1, 1, 1,
-0.892435, -1.241513, -3.250989, 1, 1, 1, 1, 1,
-0.8915191, 1.533912, -0.4535768, 1, 1, 1, 1, 1,
-0.8853492, -0.7587101, -2.88902, 1, 1, 1, 1, 1,
-0.8818404, -0.8936679, -2.714544, 1, 1, 1, 1, 1,
-0.8766287, -1.44805, -2.840065, 1, 1, 1, 1, 1,
-0.8748972, -0.7014918, -1.775329, 1, 1, 1, 1, 1,
-0.8745437, -0.8320571, -3.974127, 1, 1, 1, 1, 1,
-0.8711581, 0.5049664, -0.2900636, 1, 1, 1, 1, 1,
-0.8696133, -0.9315007, -4.001487, 1, 1, 1, 1, 1,
-0.8692565, -1.3274, -1.364098, 1, 1, 1, 1, 1,
-0.8625085, -0.112519, -2.009503, 0, 0, 1, 1, 1,
-0.8597034, -0.9088486, -5.054496, 1, 0, 0, 1, 1,
-0.8555518, 1.155751, 0.08607712, 1, 0, 0, 1, 1,
-0.8543788, 0.6290635, -1.308975, 1, 0, 0, 1, 1,
-0.8536941, 0.1643233, -1.564852, 1, 0, 0, 1, 1,
-0.8517475, -0.1542176, -2.858729, 1, 0, 0, 1, 1,
-0.8500536, -0.3566959, 1.299276, 0, 0, 0, 1, 1,
-0.8423982, -0.6123801, -2.840214, 0, 0, 0, 1, 1,
-0.8412746, 0.2574467, -1.145435, 0, 0, 0, 1, 1,
-0.8387321, -0.5599158, -0.4295517, 0, 0, 0, 1, 1,
-0.8254375, 0.2331152, -2.594942, 0, 0, 0, 1, 1,
-0.816376, -0.7204944, -2.940954, 0, 0, 0, 1, 1,
-0.8154813, -0.9736834, -1.466268, 0, 0, 0, 1, 1,
-0.8116132, -0.8251003, -1.506929, 1, 1, 1, 1, 1,
-0.8098045, 1.478028, -1.806097, 1, 1, 1, 1, 1,
-0.8095418, 0.6315991, -1.114453, 1, 1, 1, 1, 1,
-0.8066372, 0.6654852, -2.50894, 1, 1, 1, 1, 1,
-0.8030736, -0.5186219, -3.812115, 1, 1, 1, 1, 1,
-0.7962689, -1.063342, -2.565871, 1, 1, 1, 1, 1,
-0.7863284, -0.0951528, -1.86157, 1, 1, 1, 1, 1,
-0.7855409, -0.007804132, -0.9968521, 1, 1, 1, 1, 1,
-0.7720804, 0.1778699, -0.1595057, 1, 1, 1, 1, 1,
-0.7694681, 0.2739358, -1.177245, 1, 1, 1, 1, 1,
-0.7686759, 0.4724964, 0.908668, 1, 1, 1, 1, 1,
-0.7671543, -0.9913931, -3.313428, 1, 1, 1, 1, 1,
-0.7641501, 1.900061, 0.666303, 1, 1, 1, 1, 1,
-0.7612666, 0.01574208, -2.275982, 1, 1, 1, 1, 1,
-0.7570294, 0.05759316, -2.146685, 1, 1, 1, 1, 1,
-0.7472906, -0.5267156, -2.770601, 0, 0, 1, 1, 1,
-0.7411069, -1.59567, -2.901987, 1, 0, 0, 1, 1,
-0.7400689, -1.192824, -0.5536433, 1, 0, 0, 1, 1,
-0.7397826, 1.311094, -1.087885, 1, 0, 0, 1, 1,
-0.7313516, -0.2523418, -1.653848, 1, 0, 0, 1, 1,
-0.7105708, -0.8543202, -3.022509, 1, 0, 0, 1, 1,
-0.7065544, 0.2979614, -1.915228, 0, 0, 0, 1, 1,
-0.7063348, 1.430167, -1.807782, 0, 0, 0, 1, 1,
-0.7013318, 1.156217, -0.9721352, 0, 0, 0, 1, 1,
-0.6977805, -1.199769, -1.900092, 0, 0, 0, 1, 1,
-0.6922771, 0.5759824, 1.197244, 0, 0, 0, 1, 1,
-0.6907026, -1.044995, -3.929939, 0, 0, 0, 1, 1,
-0.6895768, 0.7769379, -0.6989189, 0, 0, 0, 1, 1,
-0.6844206, 0.8108892, 0.4392932, 1, 1, 1, 1, 1,
-0.678902, -0.7237087, -2.431947, 1, 1, 1, 1, 1,
-0.67685, -0.2076724, -1.422821, 1, 1, 1, 1, 1,
-0.6724281, 1.238467, 0.2963801, 1, 1, 1, 1, 1,
-0.6703811, 0.7379608, -0.8536223, 1, 1, 1, 1, 1,
-0.6668789, -1.343544, -1.323404, 1, 1, 1, 1, 1,
-0.6649598, -0.5479912, -2.68818, 1, 1, 1, 1, 1,
-0.6636626, -0.5720053, -1.366818, 1, 1, 1, 1, 1,
-0.6585558, 0.1722934, -0.1214552, 1, 1, 1, 1, 1,
-0.6541674, 0.161635, -1.484034, 1, 1, 1, 1, 1,
-0.6506972, -0.6257547, -1.123978, 1, 1, 1, 1, 1,
-0.6498939, -0.02587517, -1.914552, 1, 1, 1, 1, 1,
-0.6498049, 0.09419521, -0.8350275, 1, 1, 1, 1, 1,
-0.6474713, -0.559164, -2.092098, 1, 1, 1, 1, 1,
-0.6452441, -0.17796, -3.381323, 1, 1, 1, 1, 1,
-0.6431288, -0.9107538, -2.957649, 0, 0, 1, 1, 1,
-0.6418979, -1.646583, -2.035923, 1, 0, 0, 1, 1,
-0.6370836, 1.136646, -0.3342375, 1, 0, 0, 1, 1,
-0.6362176, -0.4522913, -1.912328, 1, 0, 0, 1, 1,
-0.6329833, 0.6860084, -0.1057738, 1, 0, 0, 1, 1,
-0.6309581, -0.3827708, -2.417853, 1, 0, 0, 1, 1,
-0.6291977, 0.4052577, 0.9983174, 0, 0, 0, 1, 1,
-0.6290672, 0.7748432, -1.548311, 0, 0, 0, 1, 1,
-0.6254646, 1.206185, -1.478008, 0, 0, 0, 1, 1,
-0.6212188, 0.5135501, -0.7318472, 0, 0, 0, 1, 1,
-0.618639, 1.800479, -1.076881, 0, 0, 0, 1, 1,
-0.6177569, -0.07606477, -0.304024, 0, 0, 0, 1, 1,
-0.6174996, -0.6444269, -1.768854, 0, 0, 0, 1, 1,
-0.6145481, 1.154404, -0.5692493, 1, 1, 1, 1, 1,
-0.6122838, 0.8371133, -1.547341, 1, 1, 1, 1, 1,
-0.6090737, 1.284164, -1.12115, 1, 1, 1, 1, 1,
-0.6090043, -0.3828385, 0.2138397, 1, 1, 1, 1, 1,
-0.6057673, -1.020031, -1.603647, 1, 1, 1, 1, 1,
-0.6047931, 1.938703, 0.06544962, 1, 1, 1, 1, 1,
-0.6018556, -0.1171484, -3.723266, 1, 1, 1, 1, 1,
-0.6008754, -0.9583256, -2.480396, 1, 1, 1, 1, 1,
-0.599984, 1.30902, 0.923907, 1, 1, 1, 1, 1,
-0.5935227, -0.7700457, -1.707381, 1, 1, 1, 1, 1,
-0.5925574, 1.362249, -0.2381507, 1, 1, 1, 1, 1,
-0.588504, -1.150944, -2.227348, 1, 1, 1, 1, 1,
-0.5883679, -2.426887, -2.417978, 1, 1, 1, 1, 1,
-0.5775126, -0.6045325, -2.397829, 1, 1, 1, 1, 1,
-0.5737965, -0.7910272, -1.76282, 1, 1, 1, 1, 1,
-0.569698, -0.4962584, -1.529139, 0, 0, 1, 1, 1,
-0.5635287, -0.06376059, -2.484771, 1, 0, 0, 1, 1,
-0.5524807, -0.1464506, -1.20526, 1, 0, 0, 1, 1,
-0.5522493, 0.07618543, -2.751434, 1, 0, 0, 1, 1,
-0.5502952, -0.3859183, -1.639206, 1, 0, 0, 1, 1,
-0.5467697, -1.467232, -4.331832, 1, 0, 0, 1, 1,
-0.5439699, -1.36246, -4.551909, 0, 0, 0, 1, 1,
-0.5430863, 0.3188897, -1.760077, 0, 0, 0, 1, 1,
-0.5394929, -0.7710931, -3.358516, 0, 0, 0, 1, 1,
-0.535391, -1.318353, -2.830247, 0, 0, 0, 1, 1,
-0.5314043, -0.254302, -1.195808, 0, 0, 0, 1, 1,
-0.5313143, 0.2946053, -2.129338, 0, 0, 0, 1, 1,
-0.5311666, 1.455702, 0.3692799, 0, 0, 0, 1, 1,
-0.5278921, 0.09308165, -2.132504, 1, 1, 1, 1, 1,
-0.5261638, -0.6863812, -2.0912, 1, 1, 1, 1, 1,
-0.5260317, 0.8334666, -0.9192613, 1, 1, 1, 1, 1,
-0.5218187, 1.256906, -1.159335, 1, 1, 1, 1, 1,
-0.5187519, 1.433843, -0.9217009, 1, 1, 1, 1, 1,
-0.5161638, 0.4660936, -1.635342, 1, 1, 1, 1, 1,
-0.5160394, -1.267921, -3.406481, 1, 1, 1, 1, 1,
-0.515343, -0.1017023, -1.045658, 1, 1, 1, 1, 1,
-0.5125991, 0.2690875, -1.288628, 1, 1, 1, 1, 1,
-0.5084075, -0.7110248, -1.685727, 1, 1, 1, 1, 1,
-0.5077745, 1.062529, -0.7336228, 1, 1, 1, 1, 1,
-0.5074359, 1.000332, -0.9091089, 1, 1, 1, 1, 1,
-0.5062696, -1.46742, -2.107948, 1, 1, 1, 1, 1,
-0.5019242, -2.155627, -1.22541, 1, 1, 1, 1, 1,
-0.4945184, 1.375966, -0.2707849, 1, 1, 1, 1, 1,
-0.4942731, 0.1342439, -0.02521535, 0, 0, 1, 1, 1,
-0.4935917, -1.971113, -2.278568, 1, 0, 0, 1, 1,
-0.4878939, -0.400276, -2.990386, 1, 0, 0, 1, 1,
-0.4877306, -0.3565262, -0.9787393, 1, 0, 0, 1, 1,
-0.480053, -0.5904793, -1.730984, 1, 0, 0, 1, 1,
-0.4797011, 1.753904, 0.1046711, 1, 0, 0, 1, 1,
-0.4748299, -0.5843746, -3.849608, 0, 0, 0, 1, 1,
-0.4712787, 2.030074, -1.52355, 0, 0, 0, 1, 1,
-0.4664325, 0.780673, 1.177203, 0, 0, 0, 1, 1,
-0.4656774, -0.06982839, -2.255805, 0, 0, 0, 1, 1,
-0.4638636, -1.173296, -3.604544, 0, 0, 0, 1, 1,
-0.4626733, -1.595094, -2.442728, 0, 0, 0, 1, 1,
-0.454136, 1.707705, 0.1901628, 0, 0, 0, 1, 1,
-0.4507453, -0.7175536, -4.258474, 1, 1, 1, 1, 1,
-0.4477046, 0.5096455, -1.544019, 1, 1, 1, 1, 1,
-0.4473132, -0.1436597, -1.846381, 1, 1, 1, 1, 1,
-0.4462261, -0.005361745, -0.8655564, 1, 1, 1, 1, 1,
-0.4430691, 0.3936513, -2.263597, 1, 1, 1, 1, 1,
-0.4315243, 0.4220527, -1.284764, 1, 1, 1, 1, 1,
-0.4260778, -1.354075, -1.263032, 1, 1, 1, 1, 1,
-0.4260415, 0.6498706, -0.5803003, 1, 1, 1, 1, 1,
-0.4214441, -0.4471566, -2.315521, 1, 1, 1, 1, 1,
-0.421024, -0.02366248, -0.7161329, 1, 1, 1, 1, 1,
-0.4192662, -0.156855, -0.7389154, 1, 1, 1, 1, 1,
-0.4176319, 1.206379, 0.1247612, 1, 1, 1, 1, 1,
-0.4115227, -1.452449, -3.986289, 1, 1, 1, 1, 1,
-0.405103, 0.5952789, -2.823431, 1, 1, 1, 1, 1,
-0.4033919, -0.8976103, 0.6714861, 1, 1, 1, 1, 1,
-0.399973, -0.5182852, -1.996119, 0, 0, 1, 1, 1,
-0.3970601, 0.2389679, 0.9169781, 1, 0, 0, 1, 1,
-0.3961362, 0.6406541, -1.32758, 1, 0, 0, 1, 1,
-0.3929176, -1.846135, -2.379877, 1, 0, 0, 1, 1,
-0.3839505, -1.496827, -3.211456, 1, 0, 0, 1, 1,
-0.3794504, 0.9538079, 0.714735, 1, 0, 0, 1, 1,
-0.3780483, -1.532395, -3.038724, 0, 0, 0, 1, 1,
-0.3763422, -0.5163453, -1.186941, 0, 0, 0, 1, 1,
-0.3652077, 0.09653998, -1.799555, 0, 0, 0, 1, 1,
-0.3646302, -0.8396215, -1.081507, 0, 0, 0, 1, 1,
-0.3642604, 1.189286, 0.7793303, 0, 0, 0, 1, 1,
-0.3633778, 0.4034924, -1.961384, 0, 0, 0, 1, 1,
-0.355208, -1.855075, -2.422841, 0, 0, 0, 1, 1,
-0.3503593, 0.6280785, 0.3218492, 1, 1, 1, 1, 1,
-0.3465334, 0.6971582, 0.7381085, 1, 1, 1, 1, 1,
-0.3431629, 0.9214883, 1.822381, 1, 1, 1, 1, 1,
-0.342237, -0.5618722, -3.404392, 1, 1, 1, 1, 1,
-0.3412953, -1.770899, -3.221986, 1, 1, 1, 1, 1,
-0.3394615, 0.4754834, -0.5419284, 1, 1, 1, 1, 1,
-0.3390713, -0.1806059, -3.256535, 1, 1, 1, 1, 1,
-0.3377376, -2.057208, -2.406644, 1, 1, 1, 1, 1,
-0.3349944, 1.393009, 0.01833996, 1, 1, 1, 1, 1,
-0.3221515, 0.7071924, 0.7985435, 1, 1, 1, 1, 1,
-0.3141882, 0.7415968, -0.6116353, 1, 1, 1, 1, 1,
-0.3036475, -1.507978, -1.360259, 1, 1, 1, 1, 1,
-0.3031095, 0.2204014, -0.4989375, 1, 1, 1, 1, 1,
-0.3017473, 1.185886, 1.506348, 1, 1, 1, 1, 1,
-0.301569, 0.234697, -1.961358, 1, 1, 1, 1, 1,
-0.3008901, -0.6740237, -2.176678, 0, 0, 1, 1, 1,
-0.2998538, 0.3942415, -1.102685, 1, 0, 0, 1, 1,
-0.2941898, -1.937017, -3.094015, 1, 0, 0, 1, 1,
-0.2915207, 0.1112675, -0.9990268, 1, 0, 0, 1, 1,
-0.2901043, 0.5590252, -0.4627239, 1, 0, 0, 1, 1,
-0.2858424, 1.634075, -0.251032, 1, 0, 0, 1, 1,
-0.2835724, 0.7487755, -0.8855692, 0, 0, 0, 1, 1,
-0.2812649, 0.5443591, 0.1870421, 0, 0, 0, 1, 1,
-0.2811242, 0.2679181, -1.783977, 0, 0, 0, 1, 1,
-0.2801677, 0.07673124, -1.186919, 0, 0, 0, 1, 1,
-0.2793099, 1.650686, -0.09089293, 0, 0, 0, 1, 1,
-0.2773518, 0.4916196, -1.736976, 0, 0, 0, 1, 1,
-0.2745865, -0.4409602, -3.858673, 0, 0, 0, 1, 1,
-0.2744144, -0.138211, -1.111812, 1, 1, 1, 1, 1,
-0.2739632, -0.8590263, -4.517226, 1, 1, 1, 1, 1,
-0.270008, -0.4277788, -2.889613, 1, 1, 1, 1, 1,
-0.2640833, 1.156671, 0.3376732, 1, 1, 1, 1, 1,
-0.2629726, -0.5499927, -1.916345, 1, 1, 1, 1, 1,
-0.2626552, 1.346323, 1.309605, 1, 1, 1, 1, 1,
-0.2616732, 1.388843, -0.03117178, 1, 1, 1, 1, 1,
-0.2591956, 0.5249665, 0.9709532, 1, 1, 1, 1, 1,
-0.2577329, -1.056787, -2.240971, 1, 1, 1, 1, 1,
-0.2558497, -0.09688073, -1.915454, 1, 1, 1, 1, 1,
-0.2553489, -1.08995, -2.547596, 1, 1, 1, 1, 1,
-0.2549233, -0.6384557, -3.513946, 1, 1, 1, 1, 1,
-0.2497509, -1.490147, -6.088318, 1, 1, 1, 1, 1,
-0.2493336, -0.6015854, -3.331611, 1, 1, 1, 1, 1,
-0.248389, -0.8543514, -4.319127, 1, 1, 1, 1, 1,
-0.2385181, 1.944805, 1.132157, 0, 0, 1, 1, 1,
-0.2378813, -1.024956, -2.65239, 1, 0, 0, 1, 1,
-0.2357507, -0.932135, -3.45154, 1, 0, 0, 1, 1,
-0.234335, -0.4637893, -2.869422, 1, 0, 0, 1, 1,
-0.233906, 0.684726, 1.135642, 1, 0, 0, 1, 1,
-0.233727, 0.1712415, -1.59188, 1, 0, 0, 1, 1,
-0.2331361, 1.205781, -1.105578, 0, 0, 0, 1, 1,
-0.2326376, 1.013405, -0.4994467, 0, 0, 0, 1, 1,
-0.2293511, 0.2543154, -0.01244512, 0, 0, 0, 1, 1,
-0.2279052, 1.724452, 0.5851969, 0, 0, 0, 1, 1,
-0.2278084, 1.909146, 1.051732, 0, 0, 0, 1, 1,
-0.2256494, 2.021358, 0.8918626, 0, 0, 0, 1, 1,
-0.2255665, -0.02482396, -0.9486755, 0, 0, 0, 1, 1,
-0.2214793, 0.290457, -1.905568, 1, 1, 1, 1, 1,
-0.2207178, 0.05633337, -1.707144, 1, 1, 1, 1, 1,
-0.218144, -0.2697935, -2.579265, 1, 1, 1, 1, 1,
-0.2170556, -1.059536, -2.690993, 1, 1, 1, 1, 1,
-0.2144272, -1.339627, -3.772159, 1, 1, 1, 1, 1,
-0.2082833, -0.3089253, -1.774558, 1, 1, 1, 1, 1,
-0.2052377, 1.341063, -1.520272, 1, 1, 1, 1, 1,
-0.1971718, 1.111169, 1.038554, 1, 1, 1, 1, 1,
-0.1930591, 0.8609159, -0.1725437, 1, 1, 1, 1, 1,
-0.1920254, 0.7098441, 0.7177532, 1, 1, 1, 1, 1,
-0.1918326, -0.4790738, -3.105453, 1, 1, 1, 1, 1,
-0.1895231, -1.093336, -3.275605, 1, 1, 1, 1, 1,
-0.183898, 0.3350648, -0.09543021, 1, 1, 1, 1, 1,
-0.1832051, -0.04683188, -2.880818, 1, 1, 1, 1, 1,
-0.1760312, 1.343852, -0.8569283, 1, 1, 1, 1, 1,
-0.1748301, -0.6870284, -2.568559, 0, 0, 1, 1, 1,
-0.1745379, -0.6847747, -3.827617, 1, 0, 0, 1, 1,
-0.1736126, 0.6605453, -0.1828721, 1, 0, 0, 1, 1,
-0.1721784, -0.703275, -3.238356, 1, 0, 0, 1, 1,
-0.1674263, 0.2242187, 0.8549602, 1, 0, 0, 1, 1,
-0.163148, 0.07907747, -1.689186, 1, 0, 0, 1, 1,
-0.1630099, -0.6431473, -4.397203, 0, 0, 0, 1, 1,
-0.1598082, -0.4047326, -4.917277, 0, 0, 0, 1, 1,
-0.1583941, 1.904455, 0.1613051, 0, 0, 0, 1, 1,
-0.157838, 0.8160144, 0.1856937, 0, 0, 0, 1, 1,
-0.1574645, 0.7443147, 0.9334627, 0, 0, 0, 1, 1,
-0.1550853, -0.658788, -2.694175, 0, 0, 0, 1, 1,
-0.1540246, 0.5725898, -0.5070048, 0, 0, 0, 1, 1,
-0.1506559, 0.5654258, 0.2173384, 1, 1, 1, 1, 1,
-0.1499532, -0.5499038, -1.778451, 1, 1, 1, 1, 1,
-0.1497047, -1.107357, -2.84345, 1, 1, 1, 1, 1,
-0.136969, 0.7511244, -1.087205, 1, 1, 1, 1, 1,
-0.1322015, -0.06269479, -1.639588, 1, 1, 1, 1, 1,
-0.1314862, 0.05117461, -0.5678929, 1, 1, 1, 1, 1,
-0.1289088, 0.1303657, 0.4210102, 1, 1, 1, 1, 1,
-0.1242938, 1.640551, -0.6779655, 1, 1, 1, 1, 1,
-0.1228086, 2.149693, 2.136422, 1, 1, 1, 1, 1,
-0.1222728, -0.9751492, -2.054829, 1, 1, 1, 1, 1,
-0.1172294, 1.47514, -0.08132387, 1, 1, 1, 1, 1,
-0.1143723, -0.7003207, -1.941359, 1, 1, 1, 1, 1,
-0.1121384, -0.612018, -3.401478, 1, 1, 1, 1, 1,
-0.1115294, 1.062586, -0.535661, 1, 1, 1, 1, 1,
-0.1112308, -1.694136, -2.831642, 1, 1, 1, 1, 1,
-0.1080075, 1.795408, -1.12798, 0, 0, 1, 1, 1,
-0.1068869, 1.649048, -1.649285, 1, 0, 0, 1, 1,
-0.1067919, -2.266301, -2.898576, 1, 0, 0, 1, 1,
-0.1032815, -1.116192, -3.802196, 1, 0, 0, 1, 1,
-0.1008183, -0.1488199, -3.560568, 1, 0, 0, 1, 1,
-0.09722478, 0.3431332, 1.901933, 1, 0, 0, 1, 1,
-0.09278815, -1.627079, -5.81361, 0, 0, 0, 1, 1,
-0.09193054, 1.049833, -0.4206848, 0, 0, 0, 1, 1,
-0.09056389, 1.571713, 0.3645737, 0, 0, 0, 1, 1,
-0.0823452, -0.2355517, -3.721739, 0, 0, 0, 1, 1,
-0.08154964, 1.448158, -0.005642474, 0, 0, 0, 1, 1,
-0.07949447, -0.5014411, -4.411622, 0, 0, 0, 1, 1,
-0.07878037, 1.064459, -0.4308072, 0, 0, 0, 1, 1,
-0.06941549, 0.1356488, -1.418213, 1, 1, 1, 1, 1,
-0.06935313, 0.4654054, 1.01755, 1, 1, 1, 1, 1,
-0.05435943, -1.854334, -2.787578, 1, 1, 1, 1, 1,
-0.052464, -0.8959197, -3.811699, 1, 1, 1, 1, 1,
-0.05180399, 0.468179, -0.7346091, 1, 1, 1, 1, 1,
-0.05160042, -2.315977, -2.443765, 1, 1, 1, 1, 1,
-0.05110566, -0.8089489, -2.508673, 1, 1, 1, 1, 1,
-0.04649032, 0.6445566, -0.710932, 1, 1, 1, 1, 1,
-0.04403463, -0.3747032, -3.249473, 1, 1, 1, 1, 1,
-0.03545995, 1.33282, 1.462486, 1, 1, 1, 1, 1,
-0.03424335, -0.9524348, -3.462192, 1, 1, 1, 1, 1,
-0.03384874, -1.501564, -4.235283, 1, 1, 1, 1, 1,
-0.02903732, 1.266972, 0.6923404, 1, 1, 1, 1, 1,
-0.02764398, 0.2788672, 1.724398, 1, 1, 1, 1, 1,
-0.02380233, 1.226779, 0.8212816, 1, 1, 1, 1, 1,
-0.02334604, 2.884483, 0.06259875, 0, 0, 1, 1, 1,
-0.02325857, -0.6565524, -2.073537, 1, 0, 0, 1, 1,
-0.0219713, -0.8002784, -1.099476, 1, 0, 0, 1, 1,
-0.01483644, 0.5652378, 1.351961, 1, 0, 0, 1, 1,
-0.01081336, -0.5841779, -4.049031, 1, 0, 0, 1, 1,
-0.006406984, -0.9938724, -2.311648, 1, 0, 0, 1, 1,
-0.004564958, 0.09657643, -1.134166, 0, 0, 0, 1, 1,
0.002197378, 0.03852081, 1.846968, 0, 0, 0, 1, 1,
0.01115182, 0.2143215, -0.7965503, 0, 0, 0, 1, 1,
0.01148911, -0.006740251, 2.445309, 0, 0, 0, 1, 1,
0.01619736, 0.8268892, 1.442875, 0, 0, 0, 1, 1,
0.01811893, -1.420259, 2.975239, 0, 0, 0, 1, 1,
0.02354135, -0.2715646, 1.974813, 0, 0, 0, 1, 1,
0.02590943, -1.843748, 2.127083, 1, 1, 1, 1, 1,
0.02617436, 0.03735276, 1.419146, 1, 1, 1, 1, 1,
0.03063383, -0.02907976, 2.556324, 1, 1, 1, 1, 1,
0.03140687, 0.7966136, 0.4914609, 1, 1, 1, 1, 1,
0.03152598, -0.1552205, 4.065398, 1, 1, 1, 1, 1,
0.03176897, -0.1254623, 3.893383, 1, 1, 1, 1, 1,
0.03221579, 0.575771, -0.03497494, 1, 1, 1, 1, 1,
0.03261483, -0.07789323, 2.786597, 1, 1, 1, 1, 1,
0.03374442, 0.383994, 0.7043446, 1, 1, 1, 1, 1,
0.03769565, 0.5614993, 0.445825, 1, 1, 1, 1, 1,
0.04025425, 0.7495549, 0.8438908, 1, 1, 1, 1, 1,
0.04063173, -1.248785, 3.301229, 1, 1, 1, 1, 1,
0.04114847, -0.1268748, 2.334201, 1, 1, 1, 1, 1,
0.04199738, -0.9146973, 3.051836, 1, 1, 1, 1, 1,
0.0424789, 0.6074917, 0.9926325, 1, 1, 1, 1, 1,
0.04307936, -1.632851, 1.774795, 0, 0, 1, 1, 1,
0.04345657, 0.8812858, 0.2252619, 1, 0, 0, 1, 1,
0.04388401, 0.7956349, 1.069621, 1, 0, 0, 1, 1,
0.04561647, -0.2775272, 2.273489, 1, 0, 0, 1, 1,
0.04664657, -0.625801, 3.181485, 1, 0, 0, 1, 1,
0.05310132, -0.6390868, 1.797541, 1, 0, 0, 1, 1,
0.05423642, 0.05220552, 1.271078, 0, 0, 0, 1, 1,
0.05484132, 0.7998688, 0.9350777, 0, 0, 0, 1, 1,
0.05707378, -0.4290806, 2.843904, 0, 0, 0, 1, 1,
0.05864699, -1.284245, 3.826166, 0, 0, 0, 1, 1,
0.06024716, 0.5255865, 0.1069548, 0, 0, 0, 1, 1,
0.06200039, 0.7065282, 1.976268, 0, 0, 0, 1, 1,
0.06289001, 1.922177, 0.4614534, 0, 0, 0, 1, 1,
0.06688292, 0.7723647, -0.5561531, 1, 1, 1, 1, 1,
0.07441341, -0.8411922, 4.716021, 1, 1, 1, 1, 1,
0.07467747, 1.130517, -0.120111, 1, 1, 1, 1, 1,
0.07973314, -1.062413, 2.10626, 1, 1, 1, 1, 1,
0.08063335, -0.673775, 2.112083, 1, 1, 1, 1, 1,
0.08141377, -0.9195314, 2.580742, 1, 1, 1, 1, 1,
0.08490355, -0.9106629, 3.248583, 1, 1, 1, 1, 1,
0.08599345, 1.027634, 0.5575004, 1, 1, 1, 1, 1,
0.0869234, -0.252092, 4.978712, 1, 1, 1, 1, 1,
0.08751511, -1.670622, 2.331383, 1, 1, 1, 1, 1,
0.09436251, 0.7290788, 1.481721, 1, 1, 1, 1, 1,
0.09622977, 1.305599, 0.1019952, 1, 1, 1, 1, 1,
0.09645033, 1.099816, -1.188431, 1, 1, 1, 1, 1,
0.09905479, -0.2841032, 1.04347, 1, 1, 1, 1, 1,
0.09950917, -1.141554, 1.690703, 1, 1, 1, 1, 1,
0.1005925, 0.4074083, 0.7796609, 0, 0, 1, 1, 1,
0.1030026, 0.2065159, 0.9394858, 1, 0, 0, 1, 1,
0.1048768, -0.637848, 4.135155, 1, 0, 0, 1, 1,
0.1049989, -1.493702, 2.640229, 1, 0, 0, 1, 1,
0.1050927, 2.722118, 0.944322, 1, 0, 0, 1, 1,
0.1061535, 0.2816228, 2.24494, 1, 0, 0, 1, 1,
0.1077649, -0.7914408, 2.5754, 0, 0, 0, 1, 1,
0.1081646, 0.3949352, 0.7159728, 0, 0, 0, 1, 1,
0.1098939, 1.776963, 0.8552586, 0, 0, 0, 1, 1,
0.1128356, -0.3540829, 2.497739, 0, 0, 0, 1, 1,
0.1154078, 2.716812, 0.6070991, 0, 0, 0, 1, 1,
0.1206919, 0.8131936, -1.246115, 0, 0, 0, 1, 1,
0.1326766, 0.05684171, 1.833083, 0, 0, 0, 1, 1,
0.1338318, 0.2255072, 1.470663, 1, 1, 1, 1, 1,
0.1369913, 0.861026, 0.3022144, 1, 1, 1, 1, 1,
0.1391295, 0.1336257, 0.6594533, 1, 1, 1, 1, 1,
0.1436463, -0.1016072, 2.372195, 1, 1, 1, 1, 1,
0.1438121, -0.4378746, 1.367579, 1, 1, 1, 1, 1,
0.143815, -0.7132565, 3.030185, 1, 1, 1, 1, 1,
0.1446759, -1.989586, 3.687907, 1, 1, 1, 1, 1,
0.1451807, -0.2255691, 1.707342, 1, 1, 1, 1, 1,
0.1472827, -0.4015913, 4.137455, 1, 1, 1, 1, 1,
0.1489736, 0.3531442, -0.513795, 1, 1, 1, 1, 1,
0.15047, 0.23649, 0.03894218, 1, 1, 1, 1, 1,
0.155632, 1.550712, 0.3725386, 1, 1, 1, 1, 1,
0.1562878, 0.09819464, 2.234413, 1, 1, 1, 1, 1,
0.1583442, 0.3860146, 0.09854058, 1, 1, 1, 1, 1,
0.1588876, -0.3528458, 2.877103, 1, 1, 1, 1, 1,
0.1597633, 0.3457373, -0.5067811, 0, 0, 1, 1, 1,
0.1609289, -0.3695129, 2.465148, 1, 0, 0, 1, 1,
0.1620866, 0.3363951, -0.2491128, 1, 0, 0, 1, 1,
0.1635996, -1.63521, 0.8753956, 1, 0, 0, 1, 1,
0.1690865, -0.7920622, 3.056201, 1, 0, 0, 1, 1,
0.1700591, 1.888543, 0.001592269, 1, 0, 0, 1, 1,
0.17355, -1.371094, 1.348189, 0, 0, 0, 1, 1,
0.174899, -0.905351, 3.331807, 0, 0, 0, 1, 1,
0.1766887, -0.4020956, 2.22707, 0, 0, 0, 1, 1,
0.1771382, -0.02154208, 0.2695778, 0, 0, 0, 1, 1,
0.178664, 1.087789, -0.09750893, 0, 0, 0, 1, 1,
0.1789853, -0.08635486, 2.467098, 0, 0, 0, 1, 1,
0.1796038, 1.325101, 1.098956, 0, 0, 0, 1, 1,
0.1818277, -0.4188448, 2.92092, 1, 1, 1, 1, 1,
0.1825081, 0.6616885, 0.08176936, 1, 1, 1, 1, 1,
0.1830363, 1.798863, -0.7065601, 1, 1, 1, 1, 1,
0.1850262, 0.7691298, -0.7066845, 1, 1, 1, 1, 1,
0.1854617, 0.9216954, 1.732498, 1, 1, 1, 1, 1,
0.1909962, 1.167547, 0.1184983, 1, 1, 1, 1, 1,
0.1912474, 1.146417, 0.6496539, 1, 1, 1, 1, 1,
0.1919102, -0.765542, 3.413811, 1, 1, 1, 1, 1,
0.1978718, 0.0539148, 1.261167, 1, 1, 1, 1, 1,
0.1984025, 1.242362, 0.286164, 1, 1, 1, 1, 1,
0.1999407, -0.5892553, 3.4182, 1, 1, 1, 1, 1,
0.201553, -0.6366454, 2.113418, 1, 1, 1, 1, 1,
0.2039497, 0.6439558, -0.8040392, 1, 1, 1, 1, 1,
0.2043626, -0.8374359, 3.690902, 1, 1, 1, 1, 1,
0.2065419, 0.5128439, -1.131156, 1, 1, 1, 1, 1,
0.2079483, -1.648434, 2.63976, 0, 0, 1, 1, 1,
0.2224417, 0.5645968, 1.618743, 1, 0, 0, 1, 1,
0.2283276, -0.01567362, 2.340877, 1, 0, 0, 1, 1,
0.2328108, -0.4149201, 3.45543, 1, 0, 0, 1, 1,
0.2334355, 0.6201373, 2.433466, 1, 0, 0, 1, 1,
0.2353663, 1.850397, 1.142928, 1, 0, 0, 1, 1,
0.2385319, -0.08976635, 0.05453017, 0, 0, 0, 1, 1,
0.2436234, 0.6979067, 0.2130274, 0, 0, 0, 1, 1,
0.2448321, 0.8943215, 0.09017801, 0, 0, 0, 1, 1,
0.2497718, 0.9603853, 0.5633272, 0, 0, 0, 1, 1,
0.2540893, 0.2074009, 1.805337, 0, 0, 0, 1, 1,
0.256803, 1.824936, 0.6075395, 0, 0, 0, 1, 1,
0.2587346, 0.0125338, 0.7726791, 0, 0, 0, 1, 1,
0.262899, 0.08350354, 1.302313, 1, 1, 1, 1, 1,
0.2629153, -0.4794624, 2.662516, 1, 1, 1, 1, 1,
0.2635133, -0.6817608, 2.045273, 1, 1, 1, 1, 1,
0.2637644, 1.825547, -0.08326253, 1, 1, 1, 1, 1,
0.2643448, 0.2521386, 1.205459, 1, 1, 1, 1, 1,
0.2645365, -0.08822878, 1.411479, 1, 1, 1, 1, 1,
0.2649572, -0.7819903, 2.064555, 1, 1, 1, 1, 1,
0.2681977, 1.196796, 0.06066941, 1, 1, 1, 1, 1,
0.2742093, -0.01923997, 0.9193501, 1, 1, 1, 1, 1,
0.2786689, -1.541663, 2.461761, 1, 1, 1, 1, 1,
0.2789191, -0.6997464, 3.097532, 1, 1, 1, 1, 1,
0.2824147, -0.312696, 2.717381, 1, 1, 1, 1, 1,
0.2829326, -0.7487324, 1.611667, 1, 1, 1, 1, 1,
0.2833317, -0.9587062, 2.934484, 1, 1, 1, 1, 1,
0.2850546, -0.08387205, 2.595767, 1, 1, 1, 1, 1,
0.2872325, 1.1972, -0.6283462, 0, 0, 1, 1, 1,
0.3024779, 1.158739, 0.3413699, 1, 0, 0, 1, 1,
0.3037045, 0.1125122, 1.346982, 1, 0, 0, 1, 1,
0.3053716, -0.4470871, 2.388967, 1, 0, 0, 1, 1,
0.3086306, -0.7153997, 2.265012, 1, 0, 0, 1, 1,
0.3110309, 0.8019852, -0.4587113, 1, 0, 0, 1, 1,
0.3168705, -1.102448, 2.764789, 0, 0, 0, 1, 1,
0.3184527, -1.063622, 2.000952, 0, 0, 0, 1, 1,
0.3197766, -0.5283123, 0.9435188, 0, 0, 0, 1, 1,
0.3201508, 0.2571195, 1.088588, 0, 0, 0, 1, 1,
0.3208326, 0.5434473, 1.030349, 0, 0, 0, 1, 1,
0.3215676, 0.2536417, -0.7183789, 0, 0, 0, 1, 1,
0.3219886, 2.701578, -0.4657108, 0, 0, 0, 1, 1,
0.3259459, 0.1881306, 1.545413, 1, 1, 1, 1, 1,
0.3286179, -1.066479, 1.891549, 1, 1, 1, 1, 1,
0.3302598, 0.5286812, 1.154852, 1, 1, 1, 1, 1,
0.3314889, -0.7868149, 4.693403, 1, 1, 1, 1, 1,
0.3325649, 1.616278, 1.111577, 1, 1, 1, 1, 1,
0.3356186, 0.1430368, 0.9602776, 1, 1, 1, 1, 1,
0.3358832, -0.5509627, 1.997888, 1, 1, 1, 1, 1,
0.3407315, -0.6425337, 2.698189, 1, 1, 1, 1, 1,
0.3478044, 0.5002369, 0.7278879, 1, 1, 1, 1, 1,
0.3499116, -0.6719474, 2.608137, 1, 1, 1, 1, 1,
0.3505075, 1.108225, -0.6920892, 1, 1, 1, 1, 1,
0.3520924, 0.1437063, 1.289591, 1, 1, 1, 1, 1,
0.3533897, 0.08166138, 0.6527374, 1, 1, 1, 1, 1,
0.354143, 1.828057, 0.2315259, 1, 1, 1, 1, 1,
0.3565654, -0.7510212, 1.335005, 1, 1, 1, 1, 1,
0.3605429, -1.022709, 2.048679, 0, 0, 1, 1, 1,
0.3608032, -0.6583284, 3.235573, 1, 0, 0, 1, 1,
0.3623378, -0.4773583, 3.44756, 1, 0, 0, 1, 1,
0.3711789, 0.7358555, 1.406237, 1, 0, 0, 1, 1,
0.3728679, -0.06802594, 0.8596392, 1, 0, 0, 1, 1,
0.3813071, 0.5424544, 0.4853772, 1, 0, 0, 1, 1,
0.3815086, 0.833859, -0.6971391, 0, 0, 0, 1, 1,
0.3836257, 1.61333, -1.150828, 0, 0, 0, 1, 1,
0.3842988, -0.8716494, 3.270057, 0, 0, 0, 1, 1,
0.3868408, -0.4761437, 0.7216496, 0, 0, 0, 1, 1,
0.3910638, 1.283869, 0.1583165, 0, 0, 0, 1, 1,
0.3920204, -0.343826, 2.684622, 0, 0, 0, 1, 1,
0.4003583, 0.4382212, 0.2154899, 0, 0, 0, 1, 1,
0.4057185, -0.1212615, 1.44644, 1, 1, 1, 1, 1,
0.4082609, 0.3129964, 1.061377, 1, 1, 1, 1, 1,
0.4096072, -0.1289314, 1.10534, 1, 1, 1, 1, 1,
0.4133069, -0.1090502, 1.42863, 1, 1, 1, 1, 1,
0.418709, -0.3113123, 2.146886, 1, 1, 1, 1, 1,
0.4204032, 0.8483046, 3.580439, 1, 1, 1, 1, 1,
0.4204203, 0.2941958, 1.435292, 1, 1, 1, 1, 1,
0.4220969, 0.7128633, 1.442096, 1, 1, 1, 1, 1,
0.4222093, -0.7395769, 2.918192, 1, 1, 1, 1, 1,
0.4224971, -0.4611744, 3.102623, 1, 1, 1, 1, 1,
0.4262857, 0.7617334, 1.462027, 1, 1, 1, 1, 1,
0.435398, 0.9416298, 0.6482509, 1, 1, 1, 1, 1,
0.4435985, -0.2710218, 2.259865, 1, 1, 1, 1, 1,
0.4444427, 1.726123, -0.06482521, 1, 1, 1, 1, 1,
0.4486107, 0.1641983, 1.493402, 1, 1, 1, 1, 1,
0.4527546, 0.2240507, 1.64126, 0, 0, 1, 1, 1,
0.4570145, 1.167243, 1.098889, 1, 0, 0, 1, 1,
0.4575324, 0.1685954, 1.502321, 1, 0, 0, 1, 1,
0.457942, 1.800658, 1.164056, 1, 0, 0, 1, 1,
0.4585398, -0.1752026, 2.340224, 1, 0, 0, 1, 1,
0.4585998, 0.4264118, 0.7579654, 1, 0, 0, 1, 1,
0.4601411, 2.731961, 0.762292, 0, 0, 0, 1, 1,
0.4626419, 0.2161839, 2.971322, 0, 0, 0, 1, 1,
0.4630412, 0.2267097, 2.363938, 0, 0, 0, 1, 1,
0.4655416, -0.2278477, 1.13917, 0, 0, 0, 1, 1,
0.4676204, 1.322568, 0.1814407, 0, 0, 0, 1, 1,
0.4677247, 1.148019, -0.2845695, 0, 0, 0, 1, 1,
0.4679076, 0.7480893, 2.715863, 0, 0, 0, 1, 1,
0.4688103, 0.07437562, 2.871718, 1, 1, 1, 1, 1,
0.4688432, -2.080219, 1.929856, 1, 1, 1, 1, 1,
0.4726533, -0.2203275, 0.3372157, 1, 1, 1, 1, 1,
0.4728849, 0.5364256, 2.683508, 1, 1, 1, 1, 1,
0.474277, 1.696965, -1.035137, 1, 1, 1, 1, 1,
0.4755452, -0.5925241, 4.140963, 1, 1, 1, 1, 1,
0.4768192, 1.218192, 1.805991, 1, 1, 1, 1, 1,
0.4846382, -0.866774, 1.805715, 1, 1, 1, 1, 1,
0.48792, 0.7726395, 1.292283, 1, 1, 1, 1, 1,
0.4897261, 1.176177, 0.8116912, 1, 1, 1, 1, 1,
0.4908164, 0.05659827, -0.5517058, 1, 1, 1, 1, 1,
0.4930076, -0.006144306, 0.9098451, 1, 1, 1, 1, 1,
0.4941995, -0.1147925, 0.7885558, 1, 1, 1, 1, 1,
0.4964766, 0.8398211, 2.784182, 1, 1, 1, 1, 1,
0.5008876, 0.926297, 1.243934, 1, 1, 1, 1, 1,
0.5050736, -0.02996897, 2.381594, 0, 0, 1, 1, 1,
0.5057575, 0.2472371, 2.807516, 1, 0, 0, 1, 1,
0.5097478, 0.9655416, 0.2799327, 1, 0, 0, 1, 1,
0.5098531, 0.3004332, 0.6191375, 1, 0, 0, 1, 1,
0.5108743, 0.3420525, 1.892644, 1, 0, 0, 1, 1,
0.5230631, -0.345853, 2.518402, 1, 0, 0, 1, 1,
0.5299184, -0.3024506, 0.6841446, 0, 0, 0, 1, 1,
0.5347566, 0.3810013, -0.2530837, 0, 0, 0, 1, 1,
0.5353438, 0.609568, 1.1197, 0, 0, 0, 1, 1,
0.5357503, 1.48736, 0.9897673, 0, 0, 0, 1, 1,
0.5365437, 0.3000593, 0.8268788, 0, 0, 0, 1, 1,
0.5385734, 0.4377261, 2.999831, 0, 0, 0, 1, 1,
0.5467911, -0.1205648, 1.542125, 0, 0, 0, 1, 1,
0.5468711, 0.2419325, 0.06130402, 1, 1, 1, 1, 1,
0.5491447, -1.172391, 2.739033, 1, 1, 1, 1, 1,
0.5518935, 0.7263428, -0.1858589, 1, 1, 1, 1, 1,
0.5520391, -1.000184, 1.778799, 1, 1, 1, 1, 1,
0.5520945, -0.009719885, 2.470122, 1, 1, 1, 1, 1,
0.556419, -0.6719029, 1.465419, 1, 1, 1, 1, 1,
0.562956, -0.03099095, 2.048973, 1, 1, 1, 1, 1,
0.5682523, 0.5690914, 2.346321, 1, 1, 1, 1, 1,
0.5720071, 0.1659263, 0.644197, 1, 1, 1, 1, 1,
0.5755008, -0.677691, 2.638556, 1, 1, 1, 1, 1,
0.5791597, 0.2198234, -0.5458065, 1, 1, 1, 1, 1,
0.5844232, -0.4209942, 3.043057, 1, 1, 1, 1, 1,
0.588294, 0.814684, -0.8421342, 1, 1, 1, 1, 1,
0.5886631, -1.330822, 2.550617, 1, 1, 1, 1, 1,
0.5907733, 1.533755, -0.9201539, 1, 1, 1, 1, 1,
0.5914647, 1.708344, -0.4748479, 0, 0, 1, 1, 1,
0.59157, -0.01243776, 4.329145, 1, 0, 0, 1, 1,
0.5934962, -1.603809, 3.808335, 1, 0, 0, 1, 1,
0.5939415, 0.5613982, -0.01568478, 1, 0, 0, 1, 1,
0.5968444, -0.8096782, 2.292836, 1, 0, 0, 1, 1,
0.6001468, -0.5961194, 3.956697, 1, 0, 0, 1, 1,
0.6059637, 0.6049182, 1.09361, 0, 0, 0, 1, 1,
0.6060466, 1.470767, 0.780694, 0, 0, 0, 1, 1,
0.6067764, 2.050621, -0.8133197, 0, 0, 0, 1, 1,
0.6119655, -0.2216711, 1.987377, 0, 0, 0, 1, 1,
0.621819, -1.02081, 3.29416, 0, 0, 0, 1, 1,
0.621859, 0.7894083, 0.4120577, 0, 0, 0, 1, 1,
0.624333, 1.939093, -0.3097555, 0, 0, 0, 1, 1,
0.6267037, 0.6511849, 0.5558705, 1, 1, 1, 1, 1,
0.6268499, 1.533295, 0.502127, 1, 1, 1, 1, 1,
0.6325592, 1.224454, 0.05144729, 1, 1, 1, 1, 1,
0.6366796, -0.7240623, 2.773481, 1, 1, 1, 1, 1,
0.6367976, -0.3264468, 2.448987, 1, 1, 1, 1, 1,
0.6393391, -0.6016078, 2.887173, 1, 1, 1, 1, 1,
0.6404878, 0.2863848, 1.811591, 1, 1, 1, 1, 1,
0.6440978, 1.328664, 0.193136, 1, 1, 1, 1, 1,
0.6454734, -0.3085406, 1.570927, 1, 1, 1, 1, 1,
0.6543674, -0.06185967, 1.410931, 1, 1, 1, 1, 1,
0.6590442, -0.006509848, 2.150715, 1, 1, 1, 1, 1,
0.6602669, 1.355, 0.5439967, 1, 1, 1, 1, 1,
0.6624851, -0.5245394, 1.49053, 1, 1, 1, 1, 1,
0.6648836, -1.277952, 1.272387, 1, 1, 1, 1, 1,
0.6651226, -1.542405, 2.469614, 1, 1, 1, 1, 1,
0.6681992, 1.285719, -1.506204, 0, 0, 1, 1, 1,
0.6775738, -0.7845322, 1.813601, 1, 0, 0, 1, 1,
0.678816, -0.06239361, 2.557818, 1, 0, 0, 1, 1,
0.6789617, 1.242239, 2.677035, 1, 0, 0, 1, 1,
0.6791731, 0.7855537, 1.928668, 1, 0, 0, 1, 1,
0.6828331, 0.1642006, -0.2353566, 1, 0, 0, 1, 1,
0.689545, 2.507479, -1.388925, 0, 0, 0, 1, 1,
0.6902074, -0.01425488, 2.308682, 0, 0, 0, 1, 1,
0.690249, 0.798458, 0.7078249, 0, 0, 0, 1, 1,
0.6921671, 0.6754601, 0.8683038, 0, 0, 0, 1, 1,
0.7052488, 0.07159635, 0.7490326, 0, 0, 0, 1, 1,
0.7073537, -1.333794, 1.219371, 0, 0, 0, 1, 1,
0.7100683, -0.315509, 1.349442, 0, 0, 0, 1, 1,
0.7165027, -0.3834395, 2.324441, 1, 1, 1, 1, 1,
0.7233309, -0.1215627, 1.01006, 1, 1, 1, 1, 1,
0.724006, 0.5671086, 2.694764, 1, 1, 1, 1, 1,
0.7290523, 1.467374, 0.8971912, 1, 1, 1, 1, 1,
0.7394295, 1.093421, 0.5114226, 1, 1, 1, 1, 1,
0.7395881, -2.168552, 3.957341, 1, 1, 1, 1, 1,
0.7458099, -1.212831, 4.108669, 1, 1, 1, 1, 1,
0.7466198, 0.9890795, -0.5807823, 1, 1, 1, 1, 1,
0.7487836, -1.701796, 2.60226, 1, 1, 1, 1, 1,
0.7537577, -0.3057951, 2.611086, 1, 1, 1, 1, 1,
0.7553046, -0.1760152, 1.921601, 1, 1, 1, 1, 1,
0.7567319, 0.9636719, 0.251517, 1, 1, 1, 1, 1,
0.7602441, -1.658672, 1.82502, 1, 1, 1, 1, 1,
0.7639967, 0.7750527, 1.576242, 1, 1, 1, 1, 1,
0.7690058, 0.7809486, 0.3759923, 1, 1, 1, 1, 1,
0.7712129, -0.5181133, 3.434684, 0, 0, 1, 1, 1,
0.7752749, 0.06265865, 1.080929, 1, 0, 0, 1, 1,
0.7754534, 0.3553905, 1.223866, 1, 0, 0, 1, 1,
0.7823731, -0.7999531, 3.45962, 1, 0, 0, 1, 1,
0.7828512, -1.472259, 3.911314, 1, 0, 0, 1, 1,
0.7840944, -0.6656728, 1.673588, 1, 0, 0, 1, 1,
0.7863014, -0.4617224, 2.131394, 0, 0, 0, 1, 1,
0.7881793, 0.6138811, 1.084396, 0, 0, 0, 1, 1,
0.7977222, -2.425699, 1.360261, 0, 0, 0, 1, 1,
0.7980123, -0.2559254, 3.425177, 0, 0, 0, 1, 1,
0.8084111, 0.02180037, 1.857628, 0, 0, 0, 1, 1,
0.8139558, -0.05110916, 1.924312, 0, 0, 0, 1, 1,
0.8205915, 0.0866081, -0.0763101, 0, 0, 0, 1, 1,
0.8223645, 0.7212585, 0.4470696, 1, 1, 1, 1, 1,
0.8236438, 0.7655389, -0.4460132, 1, 1, 1, 1, 1,
0.8298696, -0.7950886, 1.722109, 1, 1, 1, 1, 1,
0.8359687, -0.02031869, 1.879983, 1, 1, 1, 1, 1,
0.838447, -1.658013, 2.165964, 1, 1, 1, 1, 1,
0.8389726, -0.3731717, 0.5434045, 1, 1, 1, 1, 1,
0.8393252, 0.7191989, 1.693394, 1, 1, 1, 1, 1,
0.8394431, 0.6318217, 0.2280008, 1, 1, 1, 1, 1,
0.8406941, 0.4277314, -0.04609115, 1, 1, 1, 1, 1,
0.8429671, -0.08721744, 2.260988, 1, 1, 1, 1, 1,
0.8524806, -0.781457, 2.80564, 1, 1, 1, 1, 1,
0.856335, 0.8632105, -0.0588421, 1, 1, 1, 1, 1,
0.8627423, -2.287267, 2.706031, 1, 1, 1, 1, 1,
0.8669848, 0.3757404, 0.01491785, 1, 1, 1, 1, 1,
0.8686727, 0.09396207, 0.2660107, 1, 1, 1, 1, 1,
0.8692614, 0.2662644, 4.310691, 0, 0, 1, 1, 1,
0.8806196, 0.1886877, 0.77627, 1, 0, 0, 1, 1,
0.8909966, -0.7833496, 0.9336668, 1, 0, 0, 1, 1,
0.8973777, -1.753803, 2.033623, 1, 0, 0, 1, 1,
0.9000312, 0.8370239, 1.012769, 1, 0, 0, 1, 1,
0.9125781, -0.5525519, 2.698037, 1, 0, 0, 1, 1,
0.9163581, 0.0950117, 2.822782, 0, 0, 0, 1, 1,
0.9177523, -1.704536, 3.535768, 0, 0, 0, 1, 1,
0.9190505, 0.6970884, 1.304221, 0, 0, 0, 1, 1,
0.9192848, -1.177318, 2.118279, 0, 0, 0, 1, 1,
0.9249269, -0.2390489, 2.039242, 0, 0, 0, 1, 1,
0.925286, -1.524192, 2.871934, 0, 0, 0, 1, 1,
0.926549, 1.027098, -0.1049147, 0, 0, 0, 1, 1,
0.926857, 0.713724, -0.5007358, 1, 1, 1, 1, 1,
0.9374183, -0.8249041, 2.258013, 1, 1, 1, 1, 1,
0.938669, 0.4933268, 0.6805659, 1, 1, 1, 1, 1,
0.9423141, -1.060979, 3.130885, 1, 1, 1, 1, 1,
0.9592879, -0.8821945, 3.340025, 1, 1, 1, 1, 1,
0.9593393, -0.498582, 0.8936867, 1, 1, 1, 1, 1,
0.9750406, -0.3374862, 1.826132, 1, 1, 1, 1, 1,
0.978946, 0.228083, 3.497171, 1, 1, 1, 1, 1,
0.9813097, -0.2702586, 2.365998, 1, 1, 1, 1, 1,
0.9813928, -1.417271, 1.332361, 1, 1, 1, 1, 1,
0.9865691, 1.550119, -1.15444, 1, 1, 1, 1, 1,
0.9903857, -1.084522, 3.316359, 1, 1, 1, 1, 1,
0.9935514, -1.17784, -0.07299645, 1, 1, 1, 1, 1,
0.9946736, 0.5600619, 2.787893, 1, 1, 1, 1, 1,
0.9963076, -1.550902, 2.5884, 1, 1, 1, 1, 1,
0.9972753, 1.298988, -0.9890122, 0, 0, 1, 1, 1,
1.001763, 0.5766174, 1.254272, 1, 0, 0, 1, 1,
1.001943, 1.792216, 1.443897, 1, 0, 0, 1, 1,
1.011395, 0.7055079, 2.701732, 1, 0, 0, 1, 1,
1.01192, -1.457975, 0.5182052, 1, 0, 0, 1, 1,
1.013647, 0.16521, 1.807418, 1, 0, 0, 1, 1,
1.017189, 1.367735, 1.656704, 0, 0, 0, 1, 1,
1.017225, 0.09789108, 1.378269, 0, 0, 0, 1, 1,
1.020523, -0.4914246, 1.567105, 0, 0, 0, 1, 1,
1.021119, -1.678566, 1.10869, 0, 0, 0, 1, 1,
1.023955, -1.859396, 3.084906, 0, 0, 0, 1, 1,
1.025523, -0.3950038, 0.6367919, 0, 0, 0, 1, 1,
1.027382, 0.9833923, 0.779673, 0, 0, 0, 1, 1,
1.030731, 0.4555015, 0.1207341, 1, 1, 1, 1, 1,
1.031392, 0.2888406, 1.489343, 1, 1, 1, 1, 1,
1.034434, 0.8374668, 0.7395711, 1, 1, 1, 1, 1,
1.03665, 0.4521441, 0.644855, 1, 1, 1, 1, 1,
1.041429, -0.1524751, 4.060064, 1, 1, 1, 1, 1,
1.043735, -0.01243047, 2.224538, 1, 1, 1, 1, 1,
1.058216, 1.120945, 0.5306483, 1, 1, 1, 1, 1,
1.061808, -0.8420162, 2.709885, 1, 1, 1, 1, 1,
1.065307, 1.270273, -0.9569753, 1, 1, 1, 1, 1,
1.079654, 1.100082, -0.1327342, 1, 1, 1, 1, 1,
1.083399, -0.9849952, 2.893231, 1, 1, 1, 1, 1,
1.090885, 0.0433251, 1.74119, 1, 1, 1, 1, 1,
1.092284, 1.274204, 0.1495215, 1, 1, 1, 1, 1,
1.093801, -0.3811825, 3.165483, 1, 1, 1, 1, 1,
1.097907, -0.0657569, 0.9171175, 1, 1, 1, 1, 1,
1.112578, 2.810091, 0.7257016, 0, 0, 1, 1, 1,
1.114495, 0.685003, 2.196918, 1, 0, 0, 1, 1,
1.11464, 1.214762, -0.5035439, 1, 0, 0, 1, 1,
1.127172, -0.2823377, 0.6913533, 1, 0, 0, 1, 1,
1.128999, 1.308641, -0.1759883, 1, 0, 0, 1, 1,
1.130051, 1.209658, 0.2344759, 1, 0, 0, 1, 1,
1.132069, -0.686632, 2.026335, 0, 0, 0, 1, 1,
1.132433, 0.2063701, 1.598133, 0, 0, 0, 1, 1,
1.133957, 0.3723811, 3.733142, 0, 0, 0, 1, 1,
1.133994, -0.4801962, 2.002251, 0, 0, 0, 1, 1,
1.134412, 1.355171, -0.8538812, 0, 0, 0, 1, 1,
1.139246, -0.5938676, -0.1055286, 0, 0, 0, 1, 1,
1.140241, -0.9076529, 2.060773, 0, 0, 0, 1, 1,
1.142702, -0.415652, 1.846524, 1, 1, 1, 1, 1,
1.143578, -1.197003, 3.674721, 1, 1, 1, 1, 1,
1.155119, 0.2754317, 1.634516, 1, 1, 1, 1, 1,
1.156751, 0.9516384, 0.26149, 1, 1, 1, 1, 1,
1.158266, -1.039267, 3.215906, 1, 1, 1, 1, 1,
1.16008, 0.8091543, 0.1496227, 1, 1, 1, 1, 1,
1.161069, -0.2135542, 1.987274, 1, 1, 1, 1, 1,
1.166381, -0.2024982, 1.243775, 1, 1, 1, 1, 1,
1.168976, 1.305434, 2.01422, 1, 1, 1, 1, 1,
1.173784, 0.6814806, 1.61856, 1, 1, 1, 1, 1,
1.177614, 0.4545814, 2.140925, 1, 1, 1, 1, 1,
1.181805, 0.5398251, 1.073337, 1, 1, 1, 1, 1,
1.182885, -0.2155455, 1.542906, 1, 1, 1, 1, 1,
1.186074, 0.2564872, 2.555941, 1, 1, 1, 1, 1,
1.193578, 1.815168, 1.41202, 1, 1, 1, 1, 1,
1.194673, 1.705262, 2.114415, 0, 0, 1, 1, 1,
1.197064, -1.248541, 0.779708, 1, 0, 0, 1, 1,
1.204924, -2.059319, 3.0154, 1, 0, 0, 1, 1,
1.211505, 0.4492193, 0.842011, 1, 0, 0, 1, 1,
1.226353, 0.3723273, 2.240353, 1, 0, 0, 1, 1,
1.230729, -0.5778441, 2.884173, 1, 0, 0, 1, 1,
1.235328, 1.205194, 2.014823, 0, 0, 0, 1, 1,
1.235583, 0.6300219, 1.463565, 0, 0, 0, 1, 1,
1.239612, 0.0189617, 2.183268, 0, 0, 0, 1, 1,
1.239883, 0.127684, 2.865071, 0, 0, 0, 1, 1,
1.250625, -1.629032, 2.677776, 0, 0, 0, 1, 1,
1.252578, 1.132098, -0.609516, 0, 0, 0, 1, 1,
1.266215, -0.9498217, 0.6204066, 0, 0, 0, 1, 1,
1.267913, -0.8562037, 3.534068, 1, 1, 1, 1, 1,
1.268947, 0.6709935, 2.49075, 1, 1, 1, 1, 1,
1.269305, -0.5032694, 2.839771, 1, 1, 1, 1, 1,
1.272954, 0.4414493, 0.06073323, 1, 1, 1, 1, 1,
1.275717, 0.4673181, 0.9423903, 1, 1, 1, 1, 1,
1.278031, -0.03150865, 0.6726707, 1, 1, 1, 1, 1,
1.282602, -0.07590442, 0.8149719, 1, 1, 1, 1, 1,
1.282796, 0.2962157, 0.4870327, 1, 1, 1, 1, 1,
1.290384, 0.7408094, -1.242218, 1, 1, 1, 1, 1,
1.290575, -0.9768475, 2.384617, 1, 1, 1, 1, 1,
1.294731, -0.0656675, 2.52568, 1, 1, 1, 1, 1,
1.299181, 0.5100325, -0.6630074, 1, 1, 1, 1, 1,
1.305069, 1.074766, 1.11031, 1, 1, 1, 1, 1,
1.32474, 0.8027303, 1.970408, 1, 1, 1, 1, 1,
1.335706, -1.399547, 3.945455, 1, 1, 1, 1, 1,
1.337358, -1.518368, 1.516967, 0, 0, 1, 1, 1,
1.339329, -0.2850424, 1.338491, 1, 0, 0, 1, 1,
1.342778, 0.4164324, -0.421093, 1, 0, 0, 1, 1,
1.349367, 0.7794032, 1.598641, 1, 0, 0, 1, 1,
1.354824, -0.2378889, 1.918645, 1, 0, 0, 1, 1,
1.356415, 0.7496307, 0.1935838, 1, 0, 0, 1, 1,
1.370569, 1.146465, 0.7667621, 0, 0, 0, 1, 1,
1.375615, 1.210057, 0.7972164, 0, 0, 0, 1, 1,
1.386034, 0.5005242, 0.9270608, 0, 0, 0, 1, 1,
1.404244, -1.396272, 1.788261, 0, 0, 0, 1, 1,
1.424164, -1.419416, 2.897691, 0, 0, 0, 1, 1,
1.43285, 1.177561, 1.362154, 0, 0, 0, 1, 1,
1.438031, 0.0459552, 1.774194, 0, 0, 0, 1, 1,
1.444646, 0.6423861, 1.300547, 1, 1, 1, 1, 1,
1.445635, 1.715717, 0.1412683, 1, 1, 1, 1, 1,
1.450585, -1.091275, 1.825559, 1, 1, 1, 1, 1,
1.528615, 0.7883322, 0.3159592, 1, 1, 1, 1, 1,
1.543769, -0.8284843, 1.707901, 1, 1, 1, 1, 1,
1.552396, 0.2954015, 1.403309, 1, 1, 1, 1, 1,
1.564167, 0.267702, 0.7884852, 1, 1, 1, 1, 1,
1.569277, 0.7619655, 4.260961, 1, 1, 1, 1, 1,
1.577557, 2.312817, 2.733605, 1, 1, 1, 1, 1,
1.579255, -0.3479966, 3.30037, 1, 1, 1, 1, 1,
1.58627, 0.676964, -0.2474367, 1, 1, 1, 1, 1,
1.633448, 0.5409907, 0.884339, 1, 1, 1, 1, 1,
1.634742, 2.323675, -0.5451082, 1, 1, 1, 1, 1,
1.640664, 0.1025172, 0.867589, 1, 1, 1, 1, 1,
1.660972, -2.174161, 2.212066, 1, 1, 1, 1, 1,
1.661467, 0.2173712, 3.0503, 0, 0, 1, 1, 1,
1.676212, 0.8197914, -0.3026637, 1, 0, 0, 1, 1,
1.682176, -0.5511643, 1.321588, 1, 0, 0, 1, 1,
1.705919, 2.320735, 2.010695, 1, 0, 0, 1, 1,
1.712772, -1.200245, -0.3716056, 1, 0, 0, 1, 1,
1.725989, 0.3776167, 0.4069368, 1, 0, 0, 1, 1,
1.731092, 0.1534584, 1.921755, 0, 0, 0, 1, 1,
1.745726, -1.757478, 2.238708, 0, 0, 0, 1, 1,
1.75517, 0.1975695, -0.2184329, 0, 0, 0, 1, 1,
1.770177, 0.7802182, 1.894594, 0, 0, 0, 1, 1,
1.781528, -0.2702201, 1.228044, 0, 0, 0, 1, 1,
1.795325, -0.2339812, 3.114773, 0, 0, 0, 1, 1,
1.801326, 0.4895125, 1.473998, 0, 0, 0, 1, 1,
1.81368, -1.291561, 0.9030623, 1, 1, 1, 1, 1,
1.822137, -1.029993, 1.531613, 1, 1, 1, 1, 1,
1.823516, 1.379509, -0.7014158, 1, 1, 1, 1, 1,
1.836189, 1.097423, 0.3075117, 1, 1, 1, 1, 1,
1.858355, -0.9613244, 1.310295, 1, 1, 1, 1, 1,
1.870199, 0.2126286, 1.907369, 1, 1, 1, 1, 1,
1.905753, 0.9756964, 1.910481, 1, 1, 1, 1, 1,
1.928152, -0.1907709, 2.87638, 1, 1, 1, 1, 1,
1.93353, 0.2999186, 0.7765587, 1, 1, 1, 1, 1,
1.947566, 0.2860013, -1.093375, 1, 1, 1, 1, 1,
1.948009, 2.16583, 1.362038, 1, 1, 1, 1, 1,
1.961577, -1.252849, 1.087629, 1, 1, 1, 1, 1,
2.064058, 0.1997782, 1.102843, 1, 1, 1, 1, 1,
2.077101, -0.3822514, 0.9185144, 1, 1, 1, 1, 1,
2.101969, -0.5942876, 0.6277558, 1, 1, 1, 1, 1,
2.111684, 0.3672153, 1.453634, 0, 0, 1, 1, 1,
2.163046, 0.6820792, 1.715562, 1, 0, 0, 1, 1,
2.232573, 1.040034, 1.14055, 1, 0, 0, 1, 1,
2.275978, -0.1159135, 0.6997408, 1, 0, 0, 1, 1,
2.290589, -0.4570702, 1.086295, 1, 0, 0, 1, 1,
2.307095, -0.06984314, 1.599501, 1, 0, 0, 1, 1,
2.310907, -0.4362181, 0.8616121, 0, 0, 0, 1, 1,
2.32074, -0.5957118, 1.959568, 0, 0, 0, 1, 1,
2.322444, -0.4583728, 3.201372, 0, 0, 0, 1, 1,
2.341877, 0.4518014, 0.1643467, 0, 0, 0, 1, 1,
2.470417, -0.8697622, 2.126511, 0, 0, 0, 1, 1,
2.521049, 0.9133093, 2.876404, 0, 0, 0, 1, 1,
2.702974, 1.842686, -0.3685237, 0, 0, 0, 1, 1,
2.78591, -0.6409867, 0.2092951, 1, 1, 1, 1, 1,
3.022512, -0.8195688, 0.2308383, 1, 1, 1, 1, 1,
3.045511, 0.6455294, 2.430862, 1, 1, 1, 1, 1,
3.058229, -0.592352, 0.795917, 1, 1, 1, 1, 1,
3.067671, 1.047384, 1.49304, 1, 1, 1, 1, 1,
3.22997, 1.131389, 0.6940317, 1, 1, 1, 1, 1,
3.233571, -0.4332459, 1.438744, 1, 1, 1, 1, 1
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
var radius = 9.493171;
var distance = 33.34436;
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
mvMatrix.translate( -0.2084119, 0.06404388, 0.5548034 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.34436);
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
