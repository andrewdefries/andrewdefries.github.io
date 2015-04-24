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
-3.373178, -1.03723, -1.434807, 1, 0, 0, 1,
-3.370997, -0.6075591, -1.605692, 1, 0.007843138, 0, 1,
-3.024161, 2.359097, -1.255644, 1, 0.01176471, 0, 1,
-2.80355, -0.148169, -2.037701, 1, 0.01960784, 0, 1,
-2.704826, -1.118347, -1.439705, 1, 0.02352941, 0, 1,
-2.612398, -0.1741361, -0.4337097, 1, 0.03137255, 0, 1,
-2.478692, 0.5554465, -2.452403, 1, 0.03529412, 0, 1,
-2.472777, 0.2370628, -1.874632, 1, 0.04313726, 0, 1,
-2.467748, 0.4337312, -2.224186, 1, 0.04705882, 0, 1,
-2.465937, -1.657964, -2.433159, 1, 0.05490196, 0, 1,
-2.405372, -0.1848026, -1.086271, 1, 0.05882353, 0, 1,
-2.24452, -2.421016, -1.669329, 1, 0.06666667, 0, 1,
-2.206599, 0.47892, -1.218562, 1, 0.07058824, 0, 1,
-2.122367, 1.001946, -1.466713, 1, 0.07843138, 0, 1,
-2.112766, -0.849578, -3.37083, 1, 0.08235294, 0, 1,
-2.080476, -0.7130926, -1.858311, 1, 0.09019608, 0, 1,
-2.073556, 0.2266113, -2.206021, 1, 0.09411765, 0, 1,
-2.006911, -0.07608718, -2.041038, 1, 0.1019608, 0, 1,
-1.971082, 0.3156438, -2.105981, 1, 0.1098039, 0, 1,
-1.903431, 1.666338, -0.4442634, 1, 0.1137255, 0, 1,
-1.885312, 0.3396968, -2.064792, 1, 0.1215686, 0, 1,
-1.875794, 0.1653454, -1.782674, 1, 0.1254902, 0, 1,
-1.872992, -0.3323374, -2.74589, 1, 0.1333333, 0, 1,
-1.872791, 0.510408, -1.301326, 1, 0.1372549, 0, 1,
-1.854565, 0.4965197, -1.429795, 1, 0.145098, 0, 1,
-1.849418, 0.4695726, -2.103671, 1, 0.1490196, 0, 1,
-1.84086, -0.1326527, -1.820325, 1, 0.1568628, 0, 1,
-1.832715, -0.2037146, -1.728533, 1, 0.1607843, 0, 1,
-1.799584, 1.535573, -1.138636, 1, 0.1686275, 0, 1,
-1.793342, -0.5724974, -1.154773, 1, 0.172549, 0, 1,
-1.786214, -1.110316, -2.149583, 1, 0.1803922, 0, 1,
-1.763319, 1.149554, -0.0248144, 1, 0.1843137, 0, 1,
-1.757988, -1.544281, -1.374373, 1, 0.1921569, 0, 1,
-1.757743, -0.5405958, -2.028361, 1, 0.1960784, 0, 1,
-1.721541, -0.6008662, -1.606828, 1, 0.2039216, 0, 1,
-1.714121, -0.1121532, -1.829941, 1, 0.2117647, 0, 1,
-1.699109, -0.4408461, -1.240588, 1, 0.2156863, 0, 1,
-1.695968, 0.9684846, -1.638384, 1, 0.2235294, 0, 1,
-1.6873, 0.1301935, -0.754937, 1, 0.227451, 0, 1,
-1.677897, 0.2766345, -0.7852243, 1, 0.2352941, 0, 1,
-1.670447, -0.8881801, -2.08437, 1, 0.2392157, 0, 1,
-1.661814, 0.230675, -1.756886, 1, 0.2470588, 0, 1,
-1.651633, 0.1694515, -1.054373, 1, 0.2509804, 0, 1,
-1.648425, 0.5839983, -1.784512, 1, 0.2588235, 0, 1,
-1.640546, 0.6186367, -0.07001319, 1, 0.2627451, 0, 1,
-1.636439, -1.8199, -0.908609, 1, 0.2705882, 0, 1,
-1.588393, 0.2571597, -2.339177, 1, 0.2745098, 0, 1,
-1.576337, -1.079191, -2.88795, 1, 0.282353, 0, 1,
-1.567781, -2.148227, -2.287388, 1, 0.2862745, 0, 1,
-1.562249, -0.9732797, -1.202135, 1, 0.2941177, 0, 1,
-1.561832, 0.2027927, -1.395289, 1, 0.3019608, 0, 1,
-1.559566, -0.6594947, -3.500226, 1, 0.3058824, 0, 1,
-1.557544, 1.686006, -1.237324, 1, 0.3137255, 0, 1,
-1.555343, 0.4551471, -0.8318633, 1, 0.3176471, 0, 1,
-1.553693, 2.635128, -0.8732649, 1, 0.3254902, 0, 1,
-1.539921, -0.630942, -1.200114, 1, 0.3294118, 0, 1,
-1.539732, 0.2335665, -0.259416, 1, 0.3372549, 0, 1,
-1.538327, 0.6360351, 0.05795707, 1, 0.3411765, 0, 1,
-1.53763, 0.114795, -1.563445, 1, 0.3490196, 0, 1,
-1.531018, -0.08689088, -1.691443, 1, 0.3529412, 0, 1,
-1.521057, -0.6842536, -0.4634557, 1, 0.3607843, 0, 1,
-1.516843, -0.3000947, -1.940073, 1, 0.3647059, 0, 1,
-1.515104, 1.630635, -0.7858012, 1, 0.372549, 0, 1,
-1.494386, -0.8708371, -3.032135, 1, 0.3764706, 0, 1,
-1.492745, 0.6507005, -2.534545, 1, 0.3843137, 0, 1,
-1.487319, 0.08345592, 0.1480158, 1, 0.3882353, 0, 1,
-1.485542, 0.2726555, -1.939975, 1, 0.3960784, 0, 1,
-1.479208, -0.3464611, -1.838285, 1, 0.4039216, 0, 1,
-1.475583, -0.3876781, -1.94236, 1, 0.4078431, 0, 1,
-1.462831, -2.180856, -1.290936, 1, 0.4156863, 0, 1,
-1.457507, -1.872431, -5.260595, 1, 0.4196078, 0, 1,
-1.457368, -0.1595382, -1.302161, 1, 0.427451, 0, 1,
-1.456882, 0.4211073, -0.9217196, 1, 0.4313726, 0, 1,
-1.449058, -1.704095, -1.195999, 1, 0.4392157, 0, 1,
-1.445168, -0.8149298, -1.63344, 1, 0.4431373, 0, 1,
-1.440362, 1.542032, -2.26995, 1, 0.4509804, 0, 1,
-1.436323, 1.631867, 1.182814, 1, 0.454902, 0, 1,
-1.436297, 0.1451661, -2.132391, 1, 0.4627451, 0, 1,
-1.433478, -0.5242499, -3.449782, 1, 0.4666667, 0, 1,
-1.41262, 0.2403087, -1.442021, 1, 0.4745098, 0, 1,
-1.387293, -0.3642851, -1.743649, 1, 0.4784314, 0, 1,
-1.381853, 0.6179574, -2.547869, 1, 0.4862745, 0, 1,
-1.381321, 0.3752029, -1.001523, 1, 0.4901961, 0, 1,
-1.372228, -0.229274, -1.646568, 1, 0.4980392, 0, 1,
-1.360477, 0.2969884, -1.411481, 1, 0.5058824, 0, 1,
-1.357364, -1.735732, -2.106559, 1, 0.509804, 0, 1,
-1.347733, -1.33761, -1.627803, 1, 0.5176471, 0, 1,
-1.33591, 0.5414026, 0.6212503, 1, 0.5215687, 0, 1,
-1.310138, -0.1491462, -0.7811871, 1, 0.5294118, 0, 1,
-1.308936, 0.2787367, -3.758382, 1, 0.5333334, 0, 1,
-1.295277, -1.84444, -3.764759, 1, 0.5411765, 0, 1,
-1.292917, 0.07019765, -1.726547, 1, 0.5450981, 0, 1,
-1.28624, -1.055893, -2.064705, 1, 0.5529412, 0, 1,
-1.280529, 0.429247, -2.411049, 1, 0.5568628, 0, 1,
-1.271429, 1.70654, 0.08529874, 1, 0.5647059, 0, 1,
-1.26325, -0.4722853, -2.988428, 1, 0.5686275, 0, 1,
-1.258969, 0.3176984, -0.966485, 1, 0.5764706, 0, 1,
-1.244361, -1.083441, -1.983191, 1, 0.5803922, 0, 1,
-1.243091, -0.8078153, -1.504926, 1, 0.5882353, 0, 1,
-1.241594, 0.6637603, -1.014185, 1, 0.5921569, 0, 1,
-1.238641, 0.2748555, -1.8396, 1, 0.6, 0, 1,
-1.236634, 0.4466012, -2.691423, 1, 0.6078432, 0, 1,
-1.225807, 0.3566185, -3.948396, 1, 0.6117647, 0, 1,
-1.218249, -0.5409897, -1.160023, 1, 0.6196079, 0, 1,
-1.210746, 1.700526, -0.9742732, 1, 0.6235294, 0, 1,
-1.201004, 0.7916583, 0.03819866, 1, 0.6313726, 0, 1,
-1.189722, -0.3244742, -1.013601, 1, 0.6352941, 0, 1,
-1.189373, 2.19097, -1.147858, 1, 0.6431373, 0, 1,
-1.188513, -1.69041, -3.221959, 1, 0.6470588, 0, 1,
-1.186321, -0.4254854, -3.029943, 1, 0.654902, 0, 1,
-1.184306, -0.5405665, -1.383082, 1, 0.6588235, 0, 1,
-1.178464, 0.7482231, -0.8210965, 1, 0.6666667, 0, 1,
-1.174832, -0.1058134, -1.210893, 1, 0.6705883, 0, 1,
-1.172569, -0.3757011, -2.072147, 1, 0.6784314, 0, 1,
-1.166142, -0.8738555, -1.734872, 1, 0.682353, 0, 1,
-1.165141, -0.6621296, -1.464012, 1, 0.6901961, 0, 1,
-1.161767, -0.6334237, -3.54589, 1, 0.6941177, 0, 1,
-1.161701, 1.276135, -0.5515107, 1, 0.7019608, 0, 1,
-1.160713, -0.4608042, -3.284789, 1, 0.7098039, 0, 1,
-1.154456, -0.753402, -2.692158, 1, 0.7137255, 0, 1,
-1.148147, -1.077958, -3.006633, 1, 0.7215686, 0, 1,
-1.146722, -0.4071125, -2.8933, 1, 0.7254902, 0, 1,
-1.143211, -0.8344321, -1.292905, 1, 0.7333333, 0, 1,
-1.138489, -0.8297842, -2.09813, 1, 0.7372549, 0, 1,
-1.137623, -0.4886463, -0.7405583, 1, 0.7450981, 0, 1,
-1.135098, 0.4685772, -2.503868, 1, 0.7490196, 0, 1,
-1.130351, 0.41061, 0.2870593, 1, 0.7568628, 0, 1,
-1.11941, -1.799292, -2.583327, 1, 0.7607843, 0, 1,
-1.118084, 0.5602579, -1.409434, 1, 0.7686275, 0, 1,
-1.112729, 0.8426597, -1.91818, 1, 0.772549, 0, 1,
-1.111347, -1.043246, -2.359035, 1, 0.7803922, 0, 1,
-1.110953, -0.4264061, -0.5102097, 1, 0.7843137, 0, 1,
-1.109755, 0.8789238, -0.3651668, 1, 0.7921569, 0, 1,
-1.108595, -0.4077176, 0.3622608, 1, 0.7960784, 0, 1,
-1.102944, -0.417228, -0.6755552, 1, 0.8039216, 0, 1,
-1.1029, -0.7398324, -1.492357, 1, 0.8117647, 0, 1,
-1.102728, -0.5639029, -2.936028, 1, 0.8156863, 0, 1,
-1.102252, -0.585047, -1.566765, 1, 0.8235294, 0, 1,
-1.102164, 0.1242569, -2.195599, 1, 0.827451, 0, 1,
-1.096555, 1.497042, 0.2693952, 1, 0.8352941, 0, 1,
-1.089447, 0.6795518, -1.668959, 1, 0.8392157, 0, 1,
-1.084359, -0.03510407, -1.786869, 1, 0.8470588, 0, 1,
-1.083031, -1.098147, -3.232164, 1, 0.8509804, 0, 1,
-1.079726, 0.2698341, -1.954318, 1, 0.8588235, 0, 1,
-1.078912, 0.4294482, -1.89555, 1, 0.8627451, 0, 1,
-1.069899, 0.2920073, -1.675816, 1, 0.8705882, 0, 1,
-1.058237, -0.637208, -2.268781, 1, 0.8745098, 0, 1,
-1.056239, 0.255356, -3.631967, 1, 0.8823529, 0, 1,
-1.048833, 0.4234157, -1.841725, 1, 0.8862745, 0, 1,
-1.047258, 1.897294, -1.270523, 1, 0.8941177, 0, 1,
-1.044886, 0.387735, -2.815122, 1, 0.8980392, 0, 1,
-1.044521, 0.1128723, -0.5844073, 1, 0.9058824, 0, 1,
-1.037354, 1.194282, -0.5293228, 1, 0.9137255, 0, 1,
-1.030789, 0.9269093, -2.734293, 1, 0.9176471, 0, 1,
-1.022033, 1.622019, 0.1854395, 1, 0.9254902, 0, 1,
-1.020726, -1.116756, -1.462301, 1, 0.9294118, 0, 1,
-1.017526, 0.09301437, -1.448762, 1, 0.9372549, 0, 1,
-1.015194, 0.6575586, -0.2780872, 1, 0.9411765, 0, 1,
-1.010283, 1.63278, 0.4177337, 1, 0.9490196, 0, 1,
-1.006271, 0.8357797, 0.0007418448, 1, 0.9529412, 0, 1,
-1.00356, 0.0493142, -1.391018, 1, 0.9607843, 0, 1,
-1.003431, 0.07330444, -1.812105, 1, 0.9647059, 0, 1,
-1.001375, 0.3081168, -2.505967, 1, 0.972549, 0, 1,
-0.9973117, -1.904438, -2.666245, 1, 0.9764706, 0, 1,
-0.9933473, -3.158014, -2.705768, 1, 0.9843137, 0, 1,
-0.9914547, 1.256748, -0.8070738, 1, 0.9882353, 0, 1,
-0.9793945, 0.9843635, -1.290361, 1, 0.9960784, 0, 1,
-0.9775426, -0.2812079, -1.757881, 0.9960784, 1, 0, 1,
-0.9750223, 1.17193, -1.029239, 0.9921569, 1, 0, 1,
-0.9722222, 0.07886435, -0.04038896, 0.9843137, 1, 0, 1,
-0.9658613, -0.6937643, -1.758745, 0.9803922, 1, 0, 1,
-0.9655824, -1.775651, -3.342945, 0.972549, 1, 0, 1,
-0.9617425, 0.9084842, -1.363095, 0.9686275, 1, 0, 1,
-0.9590578, 0.05025434, -1.623498, 0.9607843, 1, 0, 1,
-0.9588087, 0.1567798, -1.496216, 0.9568627, 1, 0, 1,
-0.9550892, -0.8471234, -2.063376, 0.9490196, 1, 0, 1,
-0.9539709, 0.01685146, -0.5524803, 0.945098, 1, 0, 1,
-0.9407252, -1.292134, -0.8974574, 0.9372549, 1, 0, 1,
-0.9385844, 0.4755761, -0.5905904, 0.9333333, 1, 0, 1,
-0.935313, -0.6519541, -2.138768, 0.9254902, 1, 0, 1,
-0.9248731, 0.7816381, 0.9581222, 0.9215686, 1, 0, 1,
-0.9187441, -0.2305947, -1.90583, 0.9137255, 1, 0, 1,
-0.9183788, -1.017111, -2.23978, 0.9098039, 1, 0, 1,
-0.9139845, -0.5737079, -2.812453, 0.9019608, 1, 0, 1,
-0.9123333, 1.22922, -1.410675, 0.8941177, 1, 0, 1,
-0.910687, 0.5030987, 0.9081556, 0.8901961, 1, 0, 1,
-0.8957643, 1.28656, -0.7296062, 0.8823529, 1, 0, 1,
-0.895642, -0.1937241, -1.168929, 0.8784314, 1, 0, 1,
-0.8952172, 0.6501397, -2.398957, 0.8705882, 1, 0, 1,
-0.8863729, 0.8939931, -0.5049632, 0.8666667, 1, 0, 1,
-0.8814467, 0.1070341, -0.9617674, 0.8588235, 1, 0, 1,
-0.8670675, -0.9104205, -2.863617, 0.854902, 1, 0, 1,
-0.8660914, -2.214087, -2.387503, 0.8470588, 1, 0, 1,
-0.8598825, -0.7874787, -1.381586, 0.8431373, 1, 0, 1,
-0.8548551, 0.2802491, -3.270265, 0.8352941, 1, 0, 1,
-0.8547227, -0.4752735, -2.704522, 0.8313726, 1, 0, 1,
-0.8499101, 0.7915623, -2.439533, 0.8235294, 1, 0, 1,
-0.8479508, 0.9189402, -0.7295325, 0.8196079, 1, 0, 1,
-0.8458998, -0.2782919, -1.840857, 0.8117647, 1, 0, 1,
-0.8361383, -0.8202948, -1.848631, 0.8078431, 1, 0, 1,
-0.8358939, 0.3337699, -0.7336872, 0.8, 1, 0, 1,
-0.8340135, 0.3550942, -0.2686453, 0.7921569, 1, 0, 1,
-0.8316312, -0.7648827, -2.096957, 0.7882353, 1, 0, 1,
-0.8312927, -1.54569, -2.483997, 0.7803922, 1, 0, 1,
-0.8264834, -0.2141684, -1.389744, 0.7764706, 1, 0, 1,
-0.8212935, -0.7653435, -1.796307, 0.7686275, 1, 0, 1,
-0.8199585, -0.485775, -4.216713, 0.7647059, 1, 0, 1,
-0.8194189, -0.997347, -2.793707, 0.7568628, 1, 0, 1,
-0.818952, -0.2888212, -1.723319, 0.7529412, 1, 0, 1,
-0.8172164, -1.219009, -3.918741, 0.7450981, 1, 0, 1,
-0.8121961, -0.4587769, -1.422805, 0.7411765, 1, 0, 1,
-0.8120564, 0.5887151, -0.359652, 0.7333333, 1, 0, 1,
-0.8104117, -0.6186367, -2.278709, 0.7294118, 1, 0, 1,
-0.8102951, 0.6855072, -0.8714719, 0.7215686, 1, 0, 1,
-0.8038436, -1.037812, -1.333642, 0.7176471, 1, 0, 1,
-0.8030816, -0.4997129, -1.74133, 0.7098039, 1, 0, 1,
-0.7950903, 0.8594816, -1.211853, 0.7058824, 1, 0, 1,
-0.7950658, 0.433154, -1.182424, 0.6980392, 1, 0, 1,
-0.7949966, 0.2057401, -1.491697, 0.6901961, 1, 0, 1,
-0.7797807, -0.4334681, -3.063079, 0.6862745, 1, 0, 1,
-0.7768787, -0.7732237, -4.546941, 0.6784314, 1, 0, 1,
-0.7749727, 0.4803577, -2.117972, 0.6745098, 1, 0, 1,
-0.7744914, 0.6239842, -1.908864, 0.6666667, 1, 0, 1,
-0.770179, 1.385345, -1.163448, 0.6627451, 1, 0, 1,
-0.7678646, -0.1945781, -2.123119, 0.654902, 1, 0, 1,
-0.7640241, 1.771822, -1.361154, 0.6509804, 1, 0, 1,
-0.7630373, 1.357678, -0.8202072, 0.6431373, 1, 0, 1,
-0.7611927, -2.504114, -2.063544, 0.6392157, 1, 0, 1,
-0.7510647, 0.4428655, -0.4590101, 0.6313726, 1, 0, 1,
-0.7477251, -0.9906712, -2.905025, 0.627451, 1, 0, 1,
-0.7475983, 0.344137, -3.163528, 0.6196079, 1, 0, 1,
-0.7468552, -0.8880694, -2.184497, 0.6156863, 1, 0, 1,
-0.7396423, 0.9549811, -0.2243728, 0.6078432, 1, 0, 1,
-0.7376998, -0.7175325, -3.281943, 0.6039216, 1, 0, 1,
-0.7369689, 1.654904, 1.004133, 0.5960785, 1, 0, 1,
-0.7360733, -0.833257, -1.479188, 0.5882353, 1, 0, 1,
-0.7277923, 1.414232, -0.2788031, 0.5843138, 1, 0, 1,
-0.723964, -0.8056498, -0.3419828, 0.5764706, 1, 0, 1,
-0.7239134, -0.3789635, -2.572135, 0.572549, 1, 0, 1,
-0.7217303, -0.8093038, -1.341012, 0.5647059, 1, 0, 1,
-0.7192354, 0.483375, -0.424006, 0.5607843, 1, 0, 1,
-0.7165433, -0.2671571, -0.7647688, 0.5529412, 1, 0, 1,
-0.7148327, 0.7236142, -1.495058, 0.5490196, 1, 0, 1,
-0.7089593, -2.602937, -2.422546, 0.5411765, 1, 0, 1,
-0.6963291, 2.04243, -1.273481, 0.5372549, 1, 0, 1,
-0.6962028, -0.05669729, 0.2760284, 0.5294118, 1, 0, 1,
-0.696153, -1.462538, -3.533028, 0.5254902, 1, 0, 1,
-0.6895386, -0.3336169, -2.609036, 0.5176471, 1, 0, 1,
-0.6879752, -0.7640266, -2.329765, 0.5137255, 1, 0, 1,
-0.6869887, 1.342989, -1.70888, 0.5058824, 1, 0, 1,
-0.6846918, 0.8915492, -1.445108, 0.5019608, 1, 0, 1,
-0.6834143, 0.7747458, -1.487269, 0.4941176, 1, 0, 1,
-0.6785858, -0.4358401, -2.238031, 0.4862745, 1, 0, 1,
-0.6703893, 0.02743526, -3.328314, 0.4823529, 1, 0, 1,
-0.6689935, 1.134602, -2.262852, 0.4745098, 1, 0, 1,
-0.649126, 0.03995166, -0.03168201, 0.4705882, 1, 0, 1,
-0.6475219, 1.450126, 0.7437634, 0.4627451, 1, 0, 1,
-0.6469206, 1.813638, 0.3378824, 0.4588235, 1, 0, 1,
-0.6436871, -0.7359077, -3.043523, 0.4509804, 1, 0, 1,
-0.6425234, 1.885761, -0.9347618, 0.4470588, 1, 0, 1,
-0.6401145, 0.6839013, -2.168723, 0.4392157, 1, 0, 1,
-0.6385424, 0.07837668, -1.685373, 0.4352941, 1, 0, 1,
-0.6364628, 0.5170897, -0.4451796, 0.427451, 1, 0, 1,
-0.6350381, 1.153518, -1.86718, 0.4235294, 1, 0, 1,
-0.6309673, 0.6441971, -2.579257, 0.4156863, 1, 0, 1,
-0.6305537, -0.5797147, -1.966199, 0.4117647, 1, 0, 1,
-0.6304723, -0.1329956, -2.246478, 0.4039216, 1, 0, 1,
-0.6287509, 0.9884411, 0.4108379, 0.3960784, 1, 0, 1,
-0.6248276, -1.503419, -2.037574, 0.3921569, 1, 0, 1,
-0.6199984, -0.4578061, -2.750331, 0.3843137, 1, 0, 1,
-0.6199565, -0.6126236, -2.958557, 0.3803922, 1, 0, 1,
-0.6172051, -0.3091692, -1.071954, 0.372549, 1, 0, 1,
-0.6096553, 0.719418, 0.6709175, 0.3686275, 1, 0, 1,
-0.6087945, 0.2181603, -0.3264196, 0.3607843, 1, 0, 1,
-0.6084935, -0.6156951, -1.790266, 0.3568628, 1, 0, 1,
-0.6047322, 2.638265, -1.547085, 0.3490196, 1, 0, 1,
-0.5960425, 0.5977891, -1.614966, 0.345098, 1, 0, 1,
-0.5953332, 1.232492, -0.6667201, 0.3372549, 1, 0, 1,
-0.5912117, -0.1926296, -1.581109, 0.3333333, 1, 0, 1,
-0.588516, 0.374917, 0.7505362, 0.3254902, 1, 0, 1,
-0.5829935, 0.1841938, -1.27775, 0.3215686, 1, 0, 1,
-0.5811343, 1.178489, 2.466907, 0.3137255, 1, 0, 1,
-0.5775054, 0.2038845, -3.479048, 0.3098039, 1, 0, 1,
-0.5756142, -0.3240672, -2.173764, 0.3019608, 1, 0, 1,
-0.5723609, 1.757986, 1.220931, 0.2941177, 1, 0, 1,
-0.5715324, -0.0605236, -0.3361955, 0.2901961, 1, 0, 1,
-0.5711854, 1.268979, -2.486532, 0.282353, 1, 0, 1,
-0.5692827, 0.3828244, -1.578341, 0.2784314, 1, 0, 1,
-0.5669026, -0.8356017, -3.646405, 0.2705882, 1, 0, 1,
-0.5551319, -0.7153265, -3.526916, 0.2666667, 1, 0, 1,
-0.5538388, 1.243531, -0.5779909, 0.2588235, 1, 0, 1,
-0.5498224, 0.06778212, -1.283151, 0.254902, 1, 0, 1,
-0.5476095, 0.5462022, -0.8136476, 0.2470588, 1, 0, 1,
-0.5424439, -0.4357902, -1.009727, 0.2431373, 1, 0, 1,
-0.5396383, -0.4006524, -3.163708, 0.2352941, 1, 0, 1,
-0.5388636, -0.771807, -3.4973, 0.2313726, 1, 0, 1,
-0.538107, 0.1416055, -1.254403, 0.2235294, 1, 0, 1,
-0.5264069, -1.013516, 0.1300134, 0.2196078, 1, 0, 1,
-0.5227097, 0.3603729, -2.738059, 0.2117647, 1, 0, 1,
-0.5209014, -0.7761773, -3.559223, 0.2078431, 1, 0, 1,
-0.5188113, 0.04977255, -1.786415, 0.2, 1, 0, 1,
-0.5143952, -0.06446283, -0.3480054, 0.1921569, 1, 0, 1,
-0.5118663, 0.2537667, -2.273692, 0.1882353, 1, 0, 1,
-0.5110136, -0.5988238, -1.877504, 0.1803922, 1, 0, 1,
-0.5082697, 1.591821, -1.466166, 0.1764706, 1, 0, 1,
-0.5070402, -0.9371338, -3.053758, 0.1686275, 1, 0, 1,
-0.5049178, 0.1685354, -0.9271775, 0.1647059, 1, 0, 1,
-0.5034943, -0.5315664, -0.8983896, 0.1568628, 1, 0, 1,
-0.5001404, 1.379068, -1.154813, 0.1529412, 1, 0, 1,
-0.4975775, -1.584714, -3.398601, 0.145098, 1, 0, 1,
-0.4944283, -1.353291, -3.144006, 0.1411765, 1, 0, 1,
-0.4932674, -0.01600502, 0.4555137, 0.1333333, 1, 0, 1,
-0.4920911, 0.5509864, -2.024549, 0.1294118, 1, 0, 1,
-0.4874386, 1.602518, -0.4164405, 0.1215686, 1, 0, 1,
-0.4856525, 0.2192655, -2.507685, 0.1176471, 1, 0, 1,
-0.4833958, -0.8296319, -2.82583, 0.1098039, 1, 0, 1,
-0.4745407, 3.245858, 0.4236233, 0.1058824, 1, 0, 1,
-0.4689361, -1.318405, -0.7031705, 0.09803922, 1, 0, 1,
-0.4687157, -0.8868518, -4.749773, 0.09019608, 1, 0, 1,
-0.4650254, -0.6787405, -1.232974, 0.08627451, 1, 0, 1,
-0.4480526, 1.128372, 1.242866, 0.07843138, 1, 0, 1,
-0.4452984, 0.005937949, -1.901778, 0.07450981, 1, 0, 1,
-0.445017, -0.2287444, -1.907244, 0.06666667, 1, 0, 1,
-0.443595, 1.301259, -2.311211, 0.0627451, 1, 0, 1,
-0.4431599, -0.887989, -2.746805, 0.05490196, 1, 0, 1,
-0.442244, 1.034175, 0.6082044, 0.05098039, 1, 0, 1,
-0.4396492, -0.3545004, -2.731215, 0.04313726, 1, 0, 1,
-0.4358858, -1.451308, -0.5074492, 0.03921569, 1, 0, 1,
-0.4355604, -0.7475303, -2.099777, 0.03137255, 1, 0, 1,
-0.4354046, -1.868963, -3.1904, 0.02745098, 1, 0, 1,
-0.4352061, 0.6541222, -1.420573, 0.01960784, 1, 0, 1,
-0.4299442, 0.5582947, -0.1602136, 0.01568628, 1, 0, 1,
-0.4263685, 0.3800811, -1.46321, 0.007843138, 1, 0, 1,
-0.4238978, -1.54602, -3.291617, 0.003921569, 1, 0, 1,
-0.4226182, 1.493998, 0.6671029, 0, 1, 0.003921569, 1,
-0.42076, -1.299468, -2.386401, 0, 1, 0.01176471, 1,
-0.4176875, -0.7032255, -3.606925, 0, 1, 0.01568628, 1,
-0.417493, -0.5571124, -3.557349, 0, 1, 0.02352941, 1,
-0.4172709, 1.606198, -0.6357818, 0, 1, 0.02745098, 1,
-0.4171563, 3.218366, 0.6763968, 0, 1, 0.03529412, 1,
-0.4171148, -0.8383314, -3.540713, 0, 1, 0.03921569, 1,
-0.4105435, -0.08492652, -1.652328, 0, 1, 0.04705882, 1,
-0.403505, -0.5522086, -2.155416, 0, 1, 0.05098039, 1,
-0.3993823, -0.8838997, -2.706759, 0, 1, 0.05882353, 1,
-0.3970585, -0.8314726, -1.908005, 0, 1, 0.0627451, 1,
-0.3955808, 0.7045368, 0.2990715, 0, 1, 0.07058824, 1,
-0.3948264, 0.513331, -1.495661, 0, 1, 0.07450981, 1,
-0.3946497, -0.0001471911, -0.6818578, 0, 1, 0.08235294, 1,
-0.3944553, 0.9607701, 0.04000949, 0, 1, 0.08627451, 1,
-0.3924442, 0.7839612, -0.03668008, 0, 1, 0.09411765, 1,
-0.3916459, 0.6196164, -1.184644, 0, 1, 0.1019608, 1,
-0.3901257, 0.3381197, -0.840405, 0, 1, 0.1058824, 1,
-0.3892571, 1.032958, -1.000593, 0, 1, 0.1137255, 1,
-0.3888736, -1.999173, -2.936059, 0, 1, 0.1176471, 1,
-0.3881639, 0.008353995, -1.406752, 0, 1, 0.1254902, 1,
-0.3879519, 0.187216, -2.782971, 0, 1, 0.1294118, 1,
-0.3871143, -1.532736, -3.243121, 0, 1, 0.1372549, 1,
-0.3864673, 0.5047554, -0.9709693, 0, 1, 0.1411765, 1,
-0.3818067, -0.1739567, -3.534531, 0, 1, 0.1490196, 1,
-0.3800309, -0.1653999, -2.22655, 0, 1, 0.1529412, 1,
-0.3790691, 1.386669, -1.886121, 0, 1, 0.1607843, 1,
-0.378705, -0.1113852, -3.741185, 0, 1, 0.1647059, 1,
-0.3765495, -0.8838608, -3.78967, 0, 1, 0.172549, 1,
-0.3741699, 0.1692079, -1.707975, 0, 1, 0.1764706, 1,
-0.3717275, 0.9686508, 0.5891036, 0, 1, 0.1843137, 1,
-0.3716218, -0.3592904, -3.025801, 0, 1, 0.1882353, 1,
-0.3702693, 2.076212, 0.8597915, 0, 1, 0.1960784, 1,
-0.3630883, 0.09379428, -1.22729, 0, 1, 0.2039216, 1,
-0.3599983, -1.747123, -2.949831, 0, 1, 0.2078431, 1,
-0.3572585, 1.042143, 0.3609228, 0, 1, 0.2156863, 1,
-0.3548949, 0.6859732, -0.6406512, 0, 1, 0.2196078, 1,
-0.3509157, 0.945118, -1.675888, 0, 1, 0.227451, 1,
-0.3502808, -0.7820107, -0.1895853, 0, 1, 0.2313726, 1,
-0.3496865, -0.0522669, -3.353625, 0, 1, 0.2392157, 1,
-0.3447004, -1.377583, -3.751704, 0, 1, 0.2431373, 1,
-0.3437175, 0.0189747, 0.945259, 0, 1, 0.2509804, 1,
-0.3422457, 1.208886, 0.699605, 0, 1, 0.254902, 1,
-0.3403096, 1.967017, -0.0141085, 0, 1, 0.2627451, 1,
-0.3390558, -0.7276837, -1.899945, 0, 1, 0.2666667, 1,
-0.3335564, -0.2643664, -2.679084, 0, 1, 0.2745098, 1,
-0.3323984, -0.1307609, -2.756505, 0, 1, 0.2784314, 1,
-0.3314612, -0.5541158, -2.191547, 0, 1, 0.2862745, 1,
-0.3183111, -0.545798, -4.83687, 0, 1, 0.2901961, 1,
-0.3170465, 0.07465863, -1.646542, 0, 1, 0.2980392, 1,
-0.3147697, 0.3523402, -2.386959, 0, 1, 0.3058824, 1,
-0.3125829, -0.4547757, -1.139751, 0, 1, 0.3098039, 1,
-0.3098402, 1.232075, -0.09565667, 0, 1, 0.3176471, 1,
-0.3032224, 0.6640559, 1.459931, 0, 1, 0.3215686, 1,
-0.3005268, -1.07932, -2.464185, 0, 1, 0.3294118, 1,
-0.2992578, 0.8874763, -0.03851418, 0, 1, 0.3333333, 1,
-0.2979632, 0.8346224, 0.9367839, 0, 1, 0.3411765, 1,
-0.2962638, -0.004991973, -1.2576, 0, 1, 0.345098, 1,
-0.2954921, 0.3420011, -1.700822, 0, 1, 0.3529412, 1,
-0.2932412, -0.2297643, -1.552463, 0, 1, 0.3568628, 1,
-0.2897328, 0.6091655, -1.035332, 0, 1, 0.3647059, 1,
-0.2873745, -1.49959, -3.320474, 0, 1, 0.3686275, 1,
-0.2848618, 0.4620628, 1.223206, 0, 1, 0.3764706, 1,
-0.2768673, 1.424218, 0.8705367, 0, 1, 0.3803922, 1,
-0.2720188, 1.092342, 0.5540218, 0, 1, 0.3882353, 1,
-0.2696183, 0.4112346, -0.4691797, 0, 1, 0.3921569, 1,
-0.2670347, 0.4871769, -1.063048, 0, 1, 0.4, 1,
-0.2667661, 1.059152, -1.263716, 0, 1, 0.4078431, 1,
-0.2622248, 1.295086, -0.8506918, 0, 1, 0.4117647, 1,
-0.2606911, 0.1953319, 0.02284297, 0, 1, 0.4196078, 1,
-0.2587495, 0.6086188, -1.86425, 0, 1, 0.4235294, 1,
-0.2543517, -1.382937, -3.108729, 0, 1, 0.4313726, 1,
-0.2535104, -1.140593, 0.06852054, 0, 1, 0.4352941, 1,
-0.2490934, 0.2411328, -0.4296292, 0, 1, 0.4431373, 1,
-0.2445739, 1.214207, 1.983456, 0, 1, 0.4470588, 1,
-0.2422516, -0.04047204, -2.314399, 0, 1, 0.454902, 1,
-0.2412948, -0.4501159, -1.985733, 0, 1, 0.4588235, 1,
-0.240508, -0.6814299, -2.72666, 0, 1, 0.4666667, 1,
-0.2397231, -0.2348228, -1.785658, 0, 1, 0.4705882, 1,
-0.2388852, 2.383333, 0.8044903, 0, 1, 0.4784314, 1,
-0.2356437, 0.5339599, -1.545579, 0, 1, 0.4823529, 1,
-0.2348662, 1.134212, -0.7751479, 0, 1, 0.4901961, 1,
-0.229952, -0.05399319, -1.797864, 0, 1, 0.4941176, 1,
-0.2299011, 0.0129324, -2.788241, 0, 1, 0.5019608, 1,
-0.2292235, 0.02474142, -1.616647, 0, 1, 0.509804, 1,
-0.2289265, -0.6002908, -3.938688, 0, 1, 0.5137255, 1,
-0.2286783, 0.5067371, -1.065548, 0, 1, 0.5215687, 1,
-0.2275366, 0.3533147, -1.206272, 0, 1, 0.5254902, 1,
-0.2192481, -0.6818521, -4.281837, 0, 1, 0.5333334, 1,
-0.2151078, -0.5169125, -2.911899, 0, 1, 0.5372549, 1,
-0.2141679, -0.5020331, -0.7980055, 0, 1, 0.5450981, 1,
-0.2137982, 0.8437274, 0.5854399, 0, 1, 0.5490196, 1,
-0.2136121, 0.9619134, -0.09341782, 0, 1, 0.5568628, 1,
-0.2121291, 0.111604, -2.244347, 0, 1, 0.5607843, 1,
-0.2081138, -0.5113968, -2.96015, 0, 1, 0.5686275, 1,
-0.199632, -0.243727, -0.655236, 0, 1, 0.572549, 1,
-0.1976622, -1.370652, -2.204803, 0, 1, 0.5803922, 1,
-0.1975496, 0.551141, -0.4433906, 0, 1, 0.5843138, 1,
-0.1895781, -0.1464152, -3.851565, 0, 1, 0.5921569, 1,
-0.1804378, -0.2730384, -2.371672, 0, 1, 0.5960785, 1,
-0.1776665, 0.8973193, -0.9601555, 0, 1, 0.6039216, 1,
-0.1698789, -0.3251722, -2.235454, 0, 1, 0.6117647, 1,
-0.1690682, -0.3144459, -3.254174, 0, 1, 0.6156863, 1,
-0.165292, 1.788186, -0.6102818, 0, 1, 0.6235294, 1,
-0.1591626, 0.5181399, -1.377651, 0, 1, 0.627451, 1,
-0.1578094, -0.5961527, -3.561122, 0, 1, 0.6352941, 1,
-0.1571614, -0.3755148, -2.112074, 0, 1, 0.6392157, 1,
-0.1531173, -1.022195, -3.659655, 0, 1, 0.6470588, 1,
-0.1439495, 0.40515, 0.04501524, 0, 1, 0.6509804, 1,
-0.1428313, -1.757437, -1.289949, 0, 1, 0.6588235, 1,
-0.1422228, 1.387849, -0.05592699, 0, 1, 0.6627451, 1,
-0.1408839, -1.114566, -1.249383, 0, 1, 0.6705883, 1,
-0.1408037, 0.3314485, 0.4009152, 0, 1, 0.6745098, 1,
-0.1333217, 0.140104, -2.090029, 0, 1, 0.682353, 1,
-0.1323039, -0.7292792, -4.033686, 0, 1, 0.6862745, 1,
-0.1298724, -0.187864, -2.564536, 0, 1, 0.6941177, 1,
-0.1279391, -0.3126059, -1.565451, 0, 1, 0.7019608, 1,
-0.1276555, -2.246135, -1.790877, 0, 1, 0.7058824, 1,
-0.1215657, 1.451523, -0.882722, 0, 1, 0.7137255, 1,
-0.1209028, 0.6139587, -0.4711606, 0, 1, 0.7176471, 1,
-0.1176971, 0.9327308, 0.5316328, 0, 1, 0.7254902, 1,
-0.1166826, 0.5244405, 0.3532114, 0, 1, 0.7294118, 1,
-0.1145623, -1.587578, -2.365446, 0, 1, 0.7372549, 1,
-0.1067752, -0.7936705, -3.657965, 0, 1, 0.7411765, 1,
-0.1055254, 0.07212549, -1.447915, 0, 1, 0.7490196, 1,
-0.1033928, 1.40205, -2.027942, 0, 1, 0.7529412, 1,
-0.1021804, 0.4787315, -0.03442848, 0, 1, 0.7607843, 1,
-0.1009404, -1.1853, -1.959027, 0, 1, 0.7647059, 1,
-0.1008543, -0.4148721, -3.318001, 0, 1, 0.772549, 1,
-0.09884651, 1.000608, 0.6084411, 0, 1, 0.7764706, 1,
-0.09783272, -0.06533332, -2.667185, 0, 1, 0.7843137, 1,
-0.0911748, -3.696713, -1.737802, 0, 1, 0.7882353, 1,
-0.08659328, -0.3899622, -2.780742, 0, 1, 0.7960784, 1,
-0.08371068, -0.05154502, -0.05223945, 0, 1, 0.8039216, 1,
-0.08143242, -0.579684, -4.675246, 0, 1, 0.8078431, 1,
-0.0789137, 0.1543931, -0.9014561, 0, 1, 0.8156863, 1,
-0.0781094, 1.469595, 0.4524529, 0, 1, 0.8196079, 1,
-0.07255096, 0.7031024, 0.2973226, 0, 1, 0.827451, 1,
-0.07019077, 1.210772, 0.6316649, 0, 1, 0.8313726, 1,
-0.07014884, -0.008928862, -0.6957621, 0, 1, 0.8392157, 1,
-0.06906334, 1.450883, -1.427415, 0, 1, 0.8431373, 1,
-0.06449779, 0.1309578, -0.4576754, 0, 1, 0.8509804, 1,
-0.06184848, -0.434644, -0.8435624, 0, 1, 0.854902, 1,
-0.05920409, 1.400963, 0.4394893, 0, 1, 0.8627451, 1,
-0.05820495, -1.080665, -2.921033, 0, 1, 0.8666667, 1,
-0.05678827, 0.6112902, 1.439703, 0, 1, 0.8745098, 1,
-0.05570137, -1.731168, -2.536781, 0, 1, 0.8784314, 1,
-0.05542707, -0.1885445, -4.050039, 0, 1, 0.8862745, 1,
-0.05347017, 0.9948987, -1.233078, 0, 1, 0.8901961, 1,
-0.0531804, -1.006315, -2.174253, 0, 1, 0.8980392, 1,
-0.04536565, -1.264082, -2.527305, 0, 1, 0.9058824, 1,
-0.0452549, -1.061773, -3.451857, 0, 1, 0.9098039, 1,
-0.04353366, 0.4632828, -0.3491552, 0, 1, 0.9176471, 1,
-0.03873932, -0.3413172, -3.949641, 0, 1, 0.9215686, 1,
-0.03370686, 1.151733, 0.05125634, 0, 1, 0.9294118, 1,
-0.03286577, -1.391115, -4.770453, 0, 1, 0.9333333, 1,
-0.03275965, -1.599298, -4.024483, 0, 1, 0.9411765, 1,
-0.02905948, 0.03760859, -0.1339694, 0, 1, 0.945098, 1,
-0.02900765, -0.455386, -2.302126, 0, 1, 0.9529412, 1,
-0.02833057, 0.5122494, -2.149347, 0, 1, 0.9568627, 1,
-0.02608612, -0.4680054, -3.534282, 0, 1, 0.9647059, 1,
-0.02515453, -0.8746046, -2.940773, 0, 1, 0.9686275, 1,
-0.02048427, 0.4772163, -0.5178273, 0, 1, 0.9764706, 1,
-0.016403, 0.905821, 0.2058681, 0, 1, 0.9803922, 1,
-0.01398915, -1.260242, -1.373588, 0, 1, 0.9882353, 1,
-0.009382294, 1.648527, -1.171414, 0, 1, 0.9921569, 1,
-0.008914742, -0.301516, -3.001341, 0, 1, 1, 1,
-0.008882061, 1.316761, -1.32339, 0, 0.9921569, 1, 1,
-0.007511454, 0.1189129, 0.135656, 0, 0.9882353, 1, 1,
-0.006897985, -0.3812506, -3.444102, 0, 0.9803922, 1, 1,
-0.006547725, 0.2989728, 0.8279504, 0, 0.9764706, 1, 1,
-0.003239298, -1.179059, -4.280242, 0, 0.9686275, 1, 1,
0.007357578, -0.6714002, 3.708032, 0, 0.9647059, 1, 1,
0.008353554, 1.034098, 0.5290287, 0, 0.9568627, 1, 1,
0.01158338, -0.8139869, 2.006798, 0, 0.9529412, 1, 1,
0.01411572, 2.059983, 0.5114138, 0, 0.945098, 1, 1,
0.01647334, -0.0627766, 2.667161, 0, 0.9411765, 1, 1,
0.01714047, 0.2033727, -1.547785, 0, 0.9333333, 1, 1,
0.02022653, 0.2108204, -0.1165126, 0, 0.9294118, 1, 1,
0.02051933, -0.4246511, 2.193129, 0, 0.9215686, 1, 1,
0.02892249, -0.2708455, 2.434818, 0, 0.9176471, 1, 1,
0.03610173, 0.7043059, 0.1783148, 0, 0.9098039, 1, 1,
0.0364057, -1.54059, 4.347827, 0, 0.9058824, 1, 1,
0.03903342, 1.197629, 0.1887725, 0, 0.8980392, 1, 1,
0.04117651, -0.03482974, 1.236691, 0, 0.8901961, 1, 1,
0.04553714, -0.04509252, 2.619872, 0, 0.8862745, 1, 1,
0.04633312, -0.2128931, 4.443244, 0, 0.8784314, 1, 1,
0.04986941, -0.7103997, 2.676361, 0, 0.8745098, 1, 1,
0.05237788, 0.6793292, -0.7333861, 0, 0.8666667, 1, 1,
0.05414962, -0.5033255, 3.0388, 0, 0.8627451, 1, 1,
0.05639848, 0.893133, -0.7950304, 0, 0.854902, 1, 1,
0.06257306, 0.7749788, 1.010304, 0, 0.8509804, 1, 1,
0.06371089, 1.040171, -2.445032, 0, 0.8431373, 1, 1,
0.06527639, 0.4605549, 0.5831506, 0, 0.8392157, 1, 1,
0.06573402, -0.7967959, 3.782848, 0, 0.8313726, 1, 1,
0.06657242, -0.4254905, 3.352064, 0, 0.827451, 1, 1,
0.06866499, -1.842796, 2.696879, 0, 0.8196079, 1, 1,
0.07029587, 0.6698931, 1.610096, 0, 0.8156863, 1, 1,
0.07200678, -1.174058, 3.712945, 0, 0.8078431, 1, 1,
0.07472361, -0.5028513, 2.760349, 0, 0.8039216, 1, 1,
0.07495965, -1.412528, 5.211944, 0, 0.7960784, 1, 1,
0.07558978, -0.6781858, 3.827191, 0, 0.7882353, 1, 1,
0.07638598, -0.8040162, 1.684941, 0, 0.7843137, 1, 1,
0.07750769, 0.3271815, -0.934767, 0, 0.7764706, 1, 1,
0.08027457, -1.618226, 3.875136, 0, 0.772549, 1, 1,
0.08365724, 0.3231771, 0.02286876, 0, 0.7647059, 1, 1,
0.08469801, -0.8180093, 2.796212, 0, 0.7607843, 1, 1,
0.09144843, -0.01002608, 1.705403, 0, 0.7529412, 1, 1,
0.09326299, 0.2993663, 1.796207, 0, 0.7490196, 1, 1,
0.1074428, 1.031744, 0.5969202, 0, 0.7411765, 1, 1,
0.1078691, 0.5722645, 1.26025, 0, 0.7372549, 1, 1,
0.1092273, 2.298272, 1.852173, 0, 0.7294118, 1, 1,
0.1104226, -0.4868621, 2.752762, 0, 0.7254902, 1, 1,
0.1137659, 0.2515286, -0.458067, 0, 0.7176471, 1, 1,
0.1191396, 0.3031266, -0.003234571, 0, 0.7137255, 1, 1,
0.119313, -0.5689608, 3.560272, 0, 0.7058824, 1, 1,
0.1207343, -0.7651507, 1.656602, 0, 0.6980392, 1, 1,
0.1219481, 0.6777753, 0.1140927, 0, 0.6941177, 1, 1,
0.1260244, -1.581858, 1.953192, 0, 0.6862745, 1, 1,
0.1288894, 0.03776788, -1.128685, 0, 0.682353, 1, 1,
0.1291374, -0.4097255, 3.149465, 0, 0.6745098, 1, 1,
0.1336561, 0.2289553, -0.08641227, 0, 0.6705883, 1, 1,
0.1406541, 2.218195, 0.4030811, 0, 0.6627451, 1, 1,
0.1426498, 1.130092, 0.005114136, 0, 0.6588235, 1, 1,
0.1455675, 0.02377286, 2.353438, 0, 0.6509804, 1, 1,
0.1465162, -0.6741738, 3.195915, 0, 0.6470588, 1, 1,
0.1493724, 0.94837, 0.8419442, 0, 0.6392157, 1, 1,
0.1508913, -1.157247, 2.601761, 0, 0.6352941, 1, 1,
0.1511394, 1.716543, -0.8381877, 0, 0.627451, 1, 1,
0.1541098, 0.2749779, -1.8377, 0, 0.6235294, 1, 1,
0.155116, 2.367914, -0.4381609, 0, 0.6156863, 1, 1,
0.1583356, -0.5373782, 2.531106, 0, 0.6117647, 1, 1,
0.1615324, 0.3920627, -0.4527447, 0, 0.6039216, 1, 1,
0.161943, -1.06043, 3.349114, 0, 0.5960785, 1, 1,
0.1629438, -0.4286022, 1.490636, 0, 0.5921569, 1, 1,
0.1652827, -1.451027, 2.283165, 0, 0.5843138, 1, 1,
0.1729003, -0.8259146, 4.081353, 0, 0.5803922, 1, 1,
0.1759439, 2.268485, -0.04872039, 0, 0.572549, 1, 1,
0.1773745, -0.6858991, 2.838622, 0, 0.5686275, 1, 1,
0.1792773, -0.2984893, 2.64449, 0, 0.5607843, 1, 1,
0.181211, -2.136839, 1.927372, 0, 0.5568628, 1, 1,
0.1828999, 0.7495868, 0.883495, 0, 0.5490196, 1, 1,
0.1857869, 0.2976897, -1.390466, 0, 0.5450981, 1, 1,
0.1867927, 0.3380347, 0.3193777, 0, 0.5372549, 1, 1,
0.1923006, 0.5249845, 2.380979, 0, 0.5333334, 1, 1,
0.1988876, -0.08824479, 2.968221, 0, 0.5254902, 1, 1,
0.2000835, -0.431778, 3.652428, 0, 0.5215687, 1, 1,
0.2037631, 1.097301, -0.3203539, 0, 0.5137255, 1, 1,
0.2039162, 0.7609974, 0.3383132, 0, 0.509804, 1, 1,
0.2067336, -0.6882398, 1.870735, 0, 0.5019608, 1, 1,
0.2075637, -2.298777, 3.432462, 0, 0.4941176, 1, 1,
0.208363, -0.06030066, 1.96005, 0, 0.4901961, 1, 1,
0.2109325, -0.8635725, 2.037253, 0, 0.4823529, 1, 1,
0.2190869, 0.1768705, -2.404767, 0, 0.4784314, 1, 1,
0.233282, -0.4235198, 3.258503, 0, 0.4705882, 1, 1,
0.2342674, 0.8447579, 0.2167154, 0, 0.4666667, 1, 1,
0.2360096, 1.511956, -0.3036682, 0, 0.4588235, 1, 1,
0.239105, -0.7718739, 2.619348, 0, 0.454902, 1, 1,
0.2398322, 0.2857355, -1.894263, 0, 0.4470588, 1, 1,
0.2404388, -1.943834, 1.616028, 0, 0.4431373, 1, 1,
0.2499127, 0.6846857, 0.07400161, 0, 0.4352941, 1, 1,
0.2507104, 0.4141791, -0.8556516, 0, 0.4313726, 1, 1,
0.2523193, 1.51733, 1.063741, 0, 0.4235294, 1, 1,
0.255224, -1.485215, 4.676483, 0, 0.4196078, 1, 1,
0.2552617, -0.431987, 1.27709, 0, 0.4117647, 1, 1,
0.2577135, -1.334324, 0.6927058, 0, 0.4078431, 1, 1,
0.2578039, -0.8219482, 3.466224, 0, 0.4, 1, 1,
0.2582228, -1.369958, 5.055786, 0, 0.3921569, 1, 1,
0.2597165, -1.307881, 2.389022, 0, 0.3882353, 1, 1,
0.2605702, 0.8933744, -0.9907572, 0, 0.3803922, 1, 1,
0.2616971, 0.1321267, -0.01934952, 0, 0.3764706, 1, 1,
0.2630405, 1.261322, 0.2814191, 0, 0.3686275, 1, 1,
0.2655586, 0.803243, 1.295948, 0, 0.3647059, 1, 1,
0.2755613, 0.5737134, 0.670146, 0, 0.3568628, 1, 1,
0.2756399, -1.256747, 2.679403, 0, 0.3529412, 1, 1,
0.2782682, 0.1100786, 0.5341325, 0, 0.345098, 1, 1,
0.2787995, 1.579537, 0.7530859, 0, 0.3411765, 1, 1,
0.2794236, 0.3276522, 0.8116835, 0, 0.3333333, 1, 1,
0.2844336, 0.1397249, 1.586767, 0, 0.3294118, 1, 1,
0.2845823, 0.421253, 1.892225, 0, 0.3215686, 1, 1,
0.286409, 0.9223171, 0.04276261, 0, 0.3176471, 1, 1,
0.288785, -0.8859822, 2.869323, 0, 0.3098039, 1, 1,
0.2909915, -1.72512, 3.03692, 0, 0.3058824, 1, 1,
0.2922063, -0.6483557, 4.542004, 0, 0.2980392, 1, 1,
0.2929848, -1.258053, 3.215168, 0, 0.2901961, 1, 1,
0.29313, -0.3068497, 3.868777, 0, 0.2862745, 1, 1,
0.298612, 1.145247, -0.6208234, 0, 0.2784314, 1, 1,
0.3022031, 0.1402092, 1.952761, 0, 0.2745098, 1, 1,
0.3025136, 0.5904958, 0.6054689, 0, 0.2666667, 1, 1,
0.3040124, -0.6057614, 3.677563, 0, 0.2627451, 1, 1,
0.3097978, 0.8531536, 0.8575835, 0, 0.254902, 1, 1,
0.312956, 0.7148047, 1.63804, 0, 0.2509804, 1, 1,
0.3131222, 0.3388774, 1.1823, 0, 0.2431373, 1, 1,
0.3148937, -0.3714779, 5.042216, 0, 0.2392157, 1, 1,
0.3157015, 0.07977427, 2.139548, 0, 0.2313726, 1, 1,
0.3162405, 0.6699618, -0.04664816, 0, 0.227451, 1, 1,
0.3243768, -0.560213, 1.806358, 0, 0.2196078, 1, 1,
0.3254038, -1.825734, 2.06412, 0, 0.2156863, 1, 1,
0.328889, -1.47779, 3.290977, 0, 0.2078431, 1, 1,
0.3348226, -0.8627541, 3.382663, 0, 0.2039216, 1, 1,
0.3385458, -0.7165235, 2.294041, 0, 0.1960784, 1, 1,
0.3405994, 0.4513309, -0.6481562, 0, 0.1882353, 1, 1,
0.3412175, -0.4122993, 1.151971, 0, 0.1843137, 1, 1,
0.3440409, 0.4983293, 1.344846, 0, 0.1764706, 1, 1,
0.3479488, -2.033094, 2.594053, 0, 0.172549, 1, 1,
0.3494629, -1.33264, 1.587256, 0, 0.1647059, 1, 1,
0.3506007, 0.2532232, 2.229497, 0, 0.1607843, 1, 1,
0.3506736, -1.036003, 2.174709, 0, 0.1529412, 1, 1,
0.3536988, -0.6033401, 1.449167, 0, 0.1490196, 1, 1,
0.3554759, 1.455763, 1.328304, 0, 0.1411765, 1, 1,
0.3576637, 1.899006, 1.074373, 0, 0.1372549, 1, 1,
0.3623345, 0.3264681, -1.414989, 0, 0.1294118, 1, 1,
0.366326, 0.7388482, 0.8626578, 0, 0.1254902, 1, 1,
0.3752989, -0.8116142, 3.479, 0, 0.1176471, 1, 1,
0.3768713, 0.5464346, 0.1053063, 0, 0.1137255, 1, 1,
0.3769204, -1.642292, 4.132484, 0, 0.1058824, 1, 1,
0.3781392, -0.09485333, 2.732116, 0, 0.09803922, 1, 1,
0.3823694, -1.044421, 2.409075, 0, 0.09411765, 1, 1,
0.3845321, -0.7845663, 0.8270404, 0, 0.08627451, 1, 1,
0.3845618, -0.5380138, 2.586702, 0, 0.08235294, 1, 1,
0.3854655, 0.1570153, 2.419654, 0, 0.07450981, 1, 1,
0.3860513, -0.167789, 2.873652, 0, 0.07058824, 1, 1,
0.3889298, -0.6191894, 2.319303, 0, 0.0627451, 1, 1,
0.3896395, 1.324525, 1.088367, 0, 0.05882353, 1, 1,
0.4087835, -0.5057904, 2.18286, 0, 0.05098039, 1, 1,
0.4210587, 0.4848169, 2.964666, 0, 0.04705882, 1, 1,
0.4239067, -0.5191035, 1.716142, 0, 0.03921569, 1, 1,
0.4239404, 0.4063677, 0.708271, 0, 0.03529412, 1, 1,
0.430638, 0.924823, 0.7390283, 0, 0.02745098, 1, 1,
0.4313111, 1.621753, 1.050866, 0, 0.02352941, 1, 1,
0.4357046, -0.8063332, 4.440325, 0, 0.01568628, 1, 1,
0.436222, -1.371634, 3.105594, 0, 0.01176471, 1, 1,
0.4365285, -1.134993, 0.1904192, 0, 0.003921569, 1, 1,
0.4374059, 0.8778421, 1.43821, 0.003921569, 0, 1, 1,
0.4386882, -0.4437389, 1.573377, 0.007843138, 0, 1, 1,
0.4404641, -0.4576842, 1.852007, 0.01568628, 0, 1, 1,
0.4499288, -0.6719506, 3.504513, 0.01960784, 0, 1, 1,
0.4523281, -0.328209, 2.410005, 0.02745098, 0, 1, 1,
0.4560746, -0.4898663, 1.916627, 0.03137255, 0, 1, 1,
0.457114, -1.412577, 1.633843, 0.03921569, 0, 1, 1,
0.4591714, 0.393748, 1.274669, 0.04313726, 0, 1, 1,
0.4596777, 0.5004795, -0.3239502, 0.05098039, 0, 1, 1,
0.4610265, -0.0296238, 3.421229, 0.05490196, 0, 1, 1,
0.4618565, -0.1493662, 2.836344, 0.0627451, 0, 1, 1,
0.4619463, -0.2634785, 1.781594, 0.06666667, 0, 1, 1,
0.462869, -0.6918771, 1.7437, 0.07450981, 0, 1, 1,
0.4635813, 0.2489996, 1.470916, 0.07843138, 0, 1, 1,
0.4637778, 0.8450664, -0.5605494, 0.08627451, 0, 1, 1,
0.4646284, 0.5725572, 2.470362, 0.09019608, 0, 1, 1,
0.4669508, -0.423414, 1.36507, 0.09803922, 0, 1, 1,
0.4671199, -0.3239689, 2.122489, 0.1058824, 0, 1, 1,
0.4695248, -0.8233076, 1.937268, 0.1098039, 0, 1, 1,
0.4744626, 1.196658, 0.7745391, 0.1176471, 0, 1, 1,
0.4798397, -0.7276459, 1.116461, 0.1215686, 0, 1, 1,
0.4806584, 0.05038813, 0.1764544, 0.1294118, 0, 1, 1,
0.4846163, 0.5673679, 1.719464, 0.1333333, 0, 1, 1,
0.493701, -1.219938, 4.439075, 0.1411765, 0, 1, 1,
0.4949439, 0.08160661, 0.6126481, 0.145098, 0, 1, 1,
0.5002875, -1.431006, 3.088879, 0.1529412, 0, 1, 1,
0.5037941, -0.5771775, 3.341384, 0.1568628, 0, 1, 1,
0.5064636, 1.470846, 1.071794, 0.1647059, 0, 1, 1,
0.5143923, 0.2809551, 2.318197, 0.1686275, 0, 1, 1,
0.515779, -0.2484255, 2.666561, 0.1764706, 0, 1, 1,
0.5198943, -0.9618388, 2.444571, 0.1803922, 0, 1, 1,
0.5211378, -1.216447, 3.840431, 0.1882353, 0, 1, 1,
0.522967, -0.3487363, 2.747523, 0.1921569, 0, 1, 1,
0.5242655, -0.335808, 0.7609478, 0.2, 0, 1, 1,
0.5249568, -0.183442, 1.548484, 0.2078431, 0, 1, 1,
0.526687, -1.077298, 3.887721, 0.2117647, 0, 1, 1,
0.5275972, 1.956273, -0.7461868, 0.2196078, 0, 1, 1,
0.530892, 1.64657, -0.7074731, 0.2235294, 0, 1, 1,
0.5346735, 0.3265467, 2.805194, 0.2313726, 0, 1, 1,
0.5366189, -1.550602, 2.776313, 0.2352941, 0, 1, 1,
0.5375688, -0.3783494, 3.989949, 0.2431373, 0, 1, 1,
0.538342, -1.450927, 2.775413, 0.2470588, 0, 1, 1,
0.5403174, 1.216475, -0.5160339, 0.254902, 0, 1, 1,
0.5421251, -1.789821, 3.924323, 0.2588235, 0, 1, 1,
0.54259, 0.1201601, 3.218666, 0.2666667, 0, 1, 1,
0.5494026, -1.160522, 2.052962, 0.2705882, 0, 1, 1,
0.5524545, -0.8136235, 1.613568, 0.2784314, 0, 1, 1,
0.5557318, -1.241928, 2.823024, 0.282353, 0, 1, 1,
0.5559486, -0.5263981, 2.701063, 0.2901961, 0, 1, 1,
0.5560837, 0.04023985, 1.932657, 0.2941177, 0, 1, 1,
0.5627436, 1.155444, -0.911374, 0.3019608, 0, 1, 1,
0.5721985, 0.2357771, 1.623809, 0.3098039, 0, 1, 1,
0.5732818, 1.630276, -0.6478938, 0.3137255, 0, 1, 1,
0.5798486, -0.7028953, 2.524165, 0.3215686, 0, 1, 1,
0.5801621, 0.1978573, 2.159272, 0.3254902, 0, 1, 1,
0.5828033, -0.3855393, 1.596291, 0.3333333, 0, 1, 1,
0.5850469, -0.3268958, 4.414681, 0.3372549, 0, 1, 1,
0.5897716, -0.2973643, 1.280916, 0.345098, 0, 1, 1,
0.6025039, 0.7070493, 2.325276, 0.3490196, 0, 1, 1,
0.6122463, -0.1662313, 2.783481, 0.3568628, 0, 1, 1,
0.61318, 0.969908, -1.337132, 0.3607843, 0, 1, 1,
0.6148463, -1.626774, 2.095344, 0.3686275, 0, 1, 1,
0.6149566, -0.4933366, 1.026114, 0.372549, 0, 1, 1,
0.6160209, 0.655108, 2.3282, 0.3803922, 0, 1, 1,
0.6161283, 1.18969, 2.939696, 0.3843137, 0, 1, 1,
0.6186137, -1.214119, 4.426757, 0.3921569, 0, 1, 1,
0.6223816, -0.2160517, 1.473475, 0.3960784, 0, 1, 1,
0.6224654, -0.04811378, 0.6915084, 0.4039216, 0, 1, 1,
0.6244355, -0.04460636, 1.781503, 0.4117647, 0, 1, 1,
0.6291265, 0.9414412, 0.1408236, 0.4156863, 0, 1, 1,
0.6350642, 0.4018579, -0.2774394, 0.4235294, 0, 1, 1,
0.6351309, -0.8543736, 4.243742, 0.427451, 0, 1, 1,
0.6380331, 1.065461, -1.291437, 0.4352941, 0, 1, 1,
0.6402079, 0.5033976, 2.225237, 0.4392157, 0, 1, 1,
0.6462923, -1.090312, 2.221187, 0.4470588, 0, 1, 1,
0.6473111, 0.1617748, 1.475624, 0.4509804, 0, 1, 1,
0.656515, -0.08400816, 1.309332, 0.4588235, 0, 1, 1,
0.6584197, 0.5722895, 1.601308, 0.4627451, 0, 1, 1,
0.6619581, -1.189092, 1.354309, 0.4705882, 0, 1, 1,
0.6656653, -0.2954964, 1.399771, 0.4745098, 0, 1, 1,
0.6686998, 1.3667, 1.43501, 0.4823529, 0, 1, 1,
0.677178, 0.4602754, 0.7309759, 0.4862745, 0, 1, 1,
0.6778002, 0.7397557, 1.254522, 0.4941176, 0, 1, 1,
0.6807246, 0.3063716, 1.716609, 0.5019608, 0, 1, 1,
0.6837102, -0.9138306, 4.862278, 0.5058824, 0, 1, 1,
0.6860152, 0.1522448, 1.008183, 0.5137255, 0, 1, 1,
0.6864601, 0.104521, 3.352545, 0.5176471, 0, 1, 1,
0.6905268, -0.7035658, 4.411642, 0.5254902, 0, 1, 1,
0.6944965, -2.360445, 3.821096, 0.5294118, 0, 1, 1,
0.696458, -0.8447539, 2.253849, 0.5372549, 0, 1, 1,
0.6979886, 0.1901215, 2.596127, 0.5411765, 0, 1, 1,
0.6992338, 0.2899251, 0.1361025, 0.5490196, 0, 1, 1,
0.7011861, 0.8290607, 0.1455075, 0.5529412, 0, 1, 1,
0.70249, -2.488722, 3.261898, 0.5607843, 0, 1, 1,
0.7028619, -1.009925, 3.081374, 0.5647059, 0, 1, 1,
0.7066359, 1.402226, 1.103372, 0.572549, 0, 1, 1,
0.7149596, 0.4820085, 1.425392, 0.5764706, 0, 1, 1,
0.7163402, -0.0005047222, 2.869014, 0.5843138, 0, 1, 1,
0.7164665, 1.057244, -0.260522, 0.5882353, 0, 1, 1,
0.7188751, -0.9873778, 1.684942, 0.5960785, 0, 1, 1,
0.7190688, -1.258704, 2.378638, 0.6039216, 0, 1, 1,
0.7221565, -0.2682006, 1.48098, 0.6078432, 0, 1, 1,
0.7257854, 0.3892352, 0.8780218, 0.6156863, 0, 1, 1,
0.730305, 0.558987, -0.1168915, 0.6196079, 0, 1, 1,
0.7335508, -0.8990788, 2.331705, 0.627451, 0, 1, 1,
0.7335835, 0.3651626, -1.60742, 0.6313726, 0, 1, 1,
0.7423688, -0.7448875, 2.124983, 0.6392157, 0, 1, 1,
0.7444567, 0.7127168, -0.5671666, 0.6431373, 0, 1, 1,
0.748309, -1.186606, 2.046953, 0.6509804, 0, 1, 1,
0.7504036, -1.523033, 4.007035, 0.654902, 0, 1, 1,
0.7529919, 2.130609, -0.4613972, 0.6627451, 0, 1, 1,
0.7534257, 0.2258243, 1.434419, 0.6666667, 0, 1, 1,
0.7540916, 0.6173769, 0.7127908, 0.6745098, 0, 1, 1,
0.7549145, 0.6033513, -0.6662331, 0.6784314, 0, 1, 1,
0.7574276, -0.6487395, 1.719525, 0.6862745, 0, 1, 1,
0.7583172, 0.6156029, 1.50939, 0.6901961, 0, 1, 1,
0.7591856, 1.769348, 2.162096, 0.6980392, 0, 1, 1,
0.7603952, 0.3270405, 0.2646466, 0.7058824, 0, 1, 1,
0.762078, -0.04687722, 2.498431, 0.7098039, 0, 1, 1,
0.7624839, -0.5479345, 1.216371, 0.7176471, 0, 1, 1,
0.7653904, -0.3441294, 0.5724112, 0.7215686, 0, 1, 1,
0.7653982, -0.2197929, 0.08309228, 0.7294118, 0, 1, 1,
0.766939, -1.369928, 1.438927, 0.7333333, 0, 1, 1,
0.7676618, -0.3509524, 1.740064, 0.7411765, 0, 1, 1,
0.7698658, 0.121677, 1.950079, 0.7450981, 0, 1, 1,
0.7707103, -0.7353023, 3.923319, 0.7529412, 0, 1, 1,
0.7753652, -0.9875693, 1.901458, 0.7568628, 0, 1, 1,
0.7779361, 0.7835919, 0.8681309, 0.7647059, 0, 1, 1,
0.7820846, -0.3552746, 2.125991, 0.7686275, 0, 1, 1,
0.7835962, 1.15061, 0.008990761, 0.7764706, 0, 1, 1,
0.7925716, -1.537059, 3.172681, 0.7803922, 0, 1, 1,
0.7941012, -1.736001, 2.82507, 0.7882353, 0, 1, 1,
0.7968453, 3.965641, -1.15581, 0.7921569, 0, 1, 1,
0.7981293, -0.3966721, 3.025968, 0.8, 0, 1, 1,
0.79896, -0.5644606, 2.186315, 0.8078431, 0, 1, 1,
0.8051104, -1.247027, 4.117932, 0.8117647, 0, 1, 1,
0.8098791, -0.9515079, 1.976771, 0.8196079, 0, 1, 1,
0.8112811, 1.037059, -0.8870577, 0.8235294, 0, 1, 1,
0.8169665, -0.925377, 1.31645, 0.8313726, 0, 1, 1,
0.8191984, 0.7781654, 1.944734, 0.8352941, 0, 1, 1,
0.8204229, 0.7789643, 0.9521654, 0.8431373, 0, 1, 1,
0.8223371, -0.2575769, 0.7191927, 0.8470588, 0, 1, 1,
0.8302677, -0.5905718, 1.646302, 0.854902, 0, 1, 1,
0.8305513, -0.8779532, 2.107984, 0.8588235, 0, 1, 1,
0.8349143, -0.8825985, 4.366612, 0.8666667, 0, 1, 1,
0.8388737, -0.1886535, 3.406903, 0.8705882, 0, 1, 1,
0.8402838, 0.8949736, 2.587761, 0.8784314, 0, 1, 1,
0.8403891, -0.6574202, 1.047706, 0.8823529, 0, 1, 1,
0.8497219, 0.3749754, -0.643682, 0.8901961, 0, 1, 1,
0.8553708, -0.06497436, 1.076423, 0.8941177, 0, 1, 1,
0.8612747, -1.435284, 3.471517, 0.9019608, 0, 1, 1,
0.8633949, -0.1921471, 0.4708905, 0.9098039, 0, 1, 1,
0.8694467, -0.7675816, 0.4793943, 0.9137255, 0, 1, 1,
0.8730919, 1.67749, -1.159928, 0.9215686, 0, 1, 1,
0.8736794, -0.541914, 1.69623, 0.9254902, 0, 1, 1,
0.8744624, 0.8135841, 1.555295, 0.9333333, 0, 1, 1,
0.8792251, -0.6785713, 2.617861, 0.9372549, 0, 1, 1,
0.8935164, -0.8406521, 1.358142, 0.945098, 0, 1, 1,
0.8975478, -0.3278577, 3.9772, 0.9490196, 0, 1, 1,
0.9038578, -1.881184, 1.32951, 0.9568627, 0, 1, 1,
0.92101, -1.579712, 1.265328, 0.9607843, 0, 1, 1,
0.9285914, -1.149831, 3.637259, 0.9686275, 0, 1, 1,
0.9305618, 0.4836778, 0.5207524, 0.972549, 0, 1, 1,
0.9318172, 0.4876875, 1.185992, 0.9803922, 0, 1, 1,
0.9352825, 0.01343261, 1.94632, 0.9843137, 0, 1, 1,
0.9362435, -0.9049982, 3.824459, 0.9921569, 0, 1, 1,
0.9409326, -1.382655, 2.933825, 0.9960784, 0, 1, 1,
0.9412679, -0.2106322, 1.856691, 1, 0, 0.9960784, 1,
0.9414423, 0.6919951, 2.159418, 1, 0, 0.9882353, 1,
0.9505678, -0.4829701, 1.679884, 1, 0, 0.9843137, 1,
0.9541003, 0.3794582, -0.563738, 1, 0, 0.9764706, 1,
0.9569982, 1.608708, -0.01385423, 1, 0, 0.972549, 1,
0.9578956, 0.1004677, 2.826363, 1, 0, 0.9647059, 1,
0.9654256, 0.5320603, 0.1532371, 1, 0, 0.9607843, 1,
0.9783417, 1.138382, -0.320989, 1, 0, 0.9529412, 1,
0.9786801, 0.1412498, 0.8737445, 1, 0, 0.9490196, 1,
0.9814774, -0.6160365, 1.024587, 1, 0, 0.9411765, 1,
0.9943569, 0.7480839, 1.142906, 1, 0, 0.9372549, 1,
1.000026, -0.3681267, 2.13949, 1, 0, 0.9294118, 1,
1.004553, -1.101996, 2.613187, 1, 0, 0.9254902, 1,
1.016282, -0.3896859, 2.7696, 1, 0, 0.9176471, 1,
1.029913, -0.3357047, 1.193321, 1, 0, 0.9137255, 1,
1.031515, -0.09353933, 1.925325, 1, 0, 0.9058824, 1,
1.032765, 0.6267959, -0.2174715, 1, 0, 0.9019608, 1,
1.034358, -1.065333, 1.055269, 1, 0, 0.8941177, 1,
1.036298, 0.6726667, 1.045714, 1, 0, 0.8862745, 1,
1.049674, 1.265023, 2.076279, 1, 0, 0.8823529, 1,
1.052732, 1.185006, 0.554916, 1, 0, 0.8745098, 1,
1.065228, 0.6820107, 0.6877847, 1, 0, 0.8705882, 1,
1.065289, -1.992604, 3.13388, 1, 0, 0.8627451, 1,
1.068965, -0.9606354, 2.523947, 1, 0, 0.8588235, 1,
1.073619, -1.478503, 1.107727, 1, 0, 0.8509804, 1,
1.074038, 1.58414, 1.268026, 1, 0, 0.8470588, 1,
1.084757, 1.063828, -0.7173734, 1, 0, 0.8392157, 1,
1.086988, -0.439005, 1.855598, 1, 0, 0.8352941, 1,
1.090358, 1.311873, 0.1913848, 1, 0, 0.827451, 1,
1.090855, -1.109768, 3.159645, 1, 0, 0.8235294, 1,
1.092696, -0.3970743, 2.912305, 1, 0, 0.8156863, 1,
1.098233, -0.1523327, 1.656906, 1, 0, 0.8117647, 1,
1.102857, -0.4956987, 3.159911, 1, 0, 0.8039216, 1,
1.106001, 0.2947197, 1.634994, 1, 0, 0.7960784, 1,
1.108274, 0.9890709, -0.2715981, 1, 0, 0.7921569, 1,
1.111923, 0.6791903, 1.682703, 1, 0, 0.7843137, 1,
1.115837, 1.118039, 0.785121, 1, 0, 0.7803922, 1,
1.125164, 0.002887353, 1.022752, 1, 0, 0.772549, 1,
1.127545, -0.4683948, 2.445168, 1, 0, 0.7686275, 1,
1.130984, 0.7798926, -0.3567207, 1, 0, 0.7607843, 1,
1.144594, 0.1358049, 0.8125283, 1, 0, 0.7568628, 1,
1.145504, -0.9805527, 1.62651, 1, 0, 0.7490196, 1,
1.154328, 0.4095825, 0.824378, 1, 0, 0.7450981, 1,
1.158863, 0.3875034, -0.7813653, 1, 0, 0.7372549, 1,
1.160408, 0.7345674, 0.4930039, 1, 0, 0.7333333, 1,
1.161433, 1.167062, -1.132336, 1, 0, 0.7254902, 1,
1.169449, 0.3138501, 2.998567, 1, 0, 0.7215686, 1,
1.170415, 0.9661146, 2.81592, 1, 0, 0.7137255, 1,
1.179026, -1.738713, 2.811543, 1, 0, 0.7098039, 1,
1.181909, 0.3063058, 0.5928347, 1, 0, 0.7019608, 1,
1.183696, -0.129224, 2.846986, 1, 0, 0.6941177, 1,
1.185797, -2.166504, 1.640643, 1, 0, 0.6901961, 1,
1.1894, 0.7735645, 2.882071, 1, 0, 0.682353, 1,
1.193023, 0.590598, 1.987249, 1, 0, 0.6784314, 1,
1.194661, -0.8644233, 0.4726108, 1, 0, 0.6705883, 1,
1.197655, -0.7069814, 0.5844926, 1, 0, 0.6666667, 1,
1.19789, 1.282779, 1.397575, 1, 0, 0.6588235, 1,
1.203628, 0.4584976, -0.5790945, 1, 0, 0.654902, 1,
1.210094, 0.1921739, 1.180147, 1, 0, 0.6470588, 1,
1.216766, -0.2833315, 2.634683, 1, 0, 0.6431373, 1,
1.218126, 0.3847418, 0.4103489, 1, 0, 0.6352941, 1,
1.2226, 1.004453, -0.4696466, 1, 0, 0.6313726, 1,
1.23324, -0.5611576, 0.8588881, 1, 0, 0.6235294, 1,
1.24373, -0.9580436, 4.022612, 1, 0, 0.6196079, 1,
1.248162, -0.6491866, 1.078913, 1, 0, 0.6117647, 1,
1.25019, -1.494207, 1.811467, 1, 0, 0.6078432, 1,
1.255468, 1.298729, 1.318334, 1, 0, 0.6, 1,
1.258341, 0.08414247, -0.03597208, 1, 0, 0.5921569, 1,
1.270967, 2.207955, -1.028025, 1, 0, 0.5882353, 1,
1.275311, -0.5903212, 2.033355, 1, 0, 0.5803922, 1,
1.279519, 1.306228, 0.1334333, 1, 0, 0.5764706, 1,
1.284865, 0.1626852, 0.6889304, 1, 0, 0.5686275, 1,
1.285147, -1.51794, 2.702304, 1, 0, 0.5647059, 1,
1.295025, 0.02852053, 1.651037, 1, 0, 0.5568628, 1,
1.311494, -0.06016289, 1.405293, 1, 0, 0.5529412, 1,
1.331739, 0.213326, 1.225213, 1, 0, 0.5450981, 1,
1.333927, -1.208191, 1.90319, 1, 0, 0.5411765, 1,
1.349828, 0.1932677, 1.34287, 1, 0, 0.5333334, 1,
1.349896, 0.1388712, 1.953117, 1, 0, 0.5294118, 1,
1.351166, -1.069172, 3.598347, 1, 0, 0.5215687, 1,
1.358399, 0.1746063, 1.160035, 1, 0, 0.5176471, 1,
1.360322, -0.7785207, 2.501122, 1, 0, 0.509804, 1,
1.367865, -0.1413419, -0.04013646, 1, 0, 0.5058824, 1,
1.377647, -2.297414, 4.367675, 1, 0, 0.4980392, 1,
1.386493, -0.336563, 3.663502, 1, 0, 0.4901961, 1,
1.40819, 0.4033606, 2.172948, 1, 0, 0.4862745, 1,
1.428807, -0.2484763, -0.1708986, 1, 0, 0.4784314, 1,
1.435927, 0.7363355, 0.1845497, 1, 0, 0.4745098, 1,
1.448571, -1.291903, 4.091156, 1, 0, 0.4666667, 1,
1.461352, 0.2024948, 1.126864, 1, 0, 0.4627451, 1,
1.471854, -1.712987, 1.888236, 1, 0, 0.454902, 1,
1.473523, 0.6517279, 0.08572928, 1, 0, 0.4509804, 1,
1.479128, 0.1902279, 2.461775, 1, 0, 0.4431373, 1,
1.485092, -0.01949927, 1.369635, 1, 0, 0.4392157, 1,
1.487031, -0.7237879, 1.184394, 1, 0, 0.4313726, 1,
1.495891, -1.267557, 1.179541, 1, 0, 0.427451, 1,
1.508278, 0.06101952, 1.25675, 1, 0, 0.4196078, 1,
1.512531, -0.186049, 1.452899, 1, 0, 0.4156863, 1,
1.513591, -0.1003352, 1.701365, 1, 0, 0.4078431, 1,
1.523044, 1.217131, 0.6703241, 1, 0, 0.4039216, 1,
1.532715, 0.491829, 3.443743, 1, 0, 0.3960784, 1,
1.538577, 1.872972, 0.6208398, 1, 0, 0.3882353, 1,
1.539138, -0.7030287, 1.259204, 1, 0, 0.3843137, 1,
1.542367, -1.565851, 3.568564, 1, 0, 0.3764706, 1,
1.546092, 2.442734, 3.789221, 1, 0, 0.372549, 1,
1.564, -1.224507, 4.182051, 1, 0, 0.3647059, 1,
1.565239, -0.8238306, 2.995042, 1, 0, 0.3607843, 1,
1.566442, -1.207298, 1.007978, 1, 0, 0.3529412, 1,
1.569317, -0.3625301, 1.844017, 1, 0, 0.3490196, 1,
1.571364, -0.09481466, 1.666115, 1, 0, 0.3411765, 1,
1.571787, 0.4001167, 0.583344, 1, 0, 0.3372549, 1,
1.572477, 0.7076771, 0.5156075, 1, 0, 0.3294118, 1,
1.5955, 1.989951, 0.6499736, 1, 0, 0.3254902, 1,
1.599855, 0.7549755, 0.9737561, 1, 0, 0.3176471, 1,
1.623219, 1.175887, 3.905697, 1, 0, 0.3137255, 1,
1.639385, 0.723667, 0.6400189, 1, 0, 0.3058824, 1,
1.64957, 0.1876452, 0.8012386, 1, 0, 0.2980392, 1,
1.682238, -0.7840455, 3.025904, 1, 0, 0.2941177, 1,
1.693277, -1.815386, 3.126528, 1, 0, 0.2862745, 1,
1.694141, -0.8204952, 2.476409, 1, 0, 0.282353, 1,
1.702283, -0.8404513, 1.865324, 1, 0, 0.2745098, 1,
1.704838, 0.07115103, 1.198003, 1, 0, 0.2705882, 1,
1.712562, -0.6333331, 1.217405, 1, 0, 0.2627451, 1,
1.71698, 0.0641904, 0.9990051, 1, 0, 0.2588235, 1,
1.738181, -0.4962203, 2.836303, 1, 0, 0.2509804, 1,
1.745217, -1.810876, 2.737144, 1, 0, 0.2470588, 1,
1.77876, 1.267384, 1.364646, 1, 0, 0.2392157, 1,
1.779754, -0.4251253, 2.447392, 1, 0, 0.2352941, 1,
1.788073, 1.223547, 0.1676472, 1, 0, 0.227451, 1,
1.808748, 0.3455322, 1.612955, 1, 0, 0.2235294, 1,
1.80957, -0.5833347, 1.864038, 1, 0, 0.2156863, 1,
1.829623, -2.229849, 1.753961, 1, 0, 0.2117647, 1,
1.843423, -0.2914188, 1.939718, 1, 0, 0.2039216, 1,
1.851399, -0.6570206, 2.074178, 1, 0, 0.1960784, 1,
1.861951, 0.05785984, 1.930436, 1, 0, 0.1921569, 1,
1.914139, 0.01145233, 3.007119, 1, 0, 0.1843137, 1,
1.927311, 1.311297, 1.02832, 1, 0, 0.1803922, 1,
1.948067, 0.4812259, 0.6825952, 1, 0, 0.172549, 1,
1.957379, 0.1158937, 1.660637, 1, 0, 0.1686275, 1,
1.966883, -0.6939834, 1.438217, 1, 0, 0.1607843, 1,
1.968841, 0.01880491, 0.6926773, 1, 0, 0.1568628, 1,
1.975976, -0.9753485, 2.706677, 1, 0, 0.1490196, 1,
1.980004, -0.3443048, 1.338467, 1, 0, 0.145098, 1,
1.980238, -2.251075, 1.726153, 1, 0, 0.1372549, 1,
1.980648, 0.923556, -1.309097, 1, 0, 0.1333333, 1,
1.985894, -2.115567, 4.507184, 1, 0, 0.1254902, 1,
2.046129, 1.070343, 2.043375, 1, 0, 0.1215686, 1,
2.062021, -0.8965931, 2.369604, 1, 0, 0.1137255, 1,
2.066679, 0.06497715, 1.59834, 1, 0, 0.1098039, 1,
2.088138, -0.3515882, 1.150501, 1, 0, 0.1019608, 1,
2.117877, -0.5956098, 0.4493526, 1, 0, 0.09411765, 1,
2.175993, -0.7190874, 3.081826, 1, 0, 0.09019608, 1,
2.243882, 1.560782, 1.495062, 1, 0, 0.08235294, 1,
2.265894, -1.222634, 2.285928, 1, 0, 0.07843138, 1,
2.30292, -0.8587121, 2.043565, 1, 0, 0.07058824, 1,
2.317105, 0.6543375, 2.540763, 1, 0, 0.06666667, 1,
2.327689, -0.3351246, 1.059238, 1, 0, 0.05882353, 1,
2.360803, -0.550923, 0.5190479, 1, 0, 0.05490196, 1,
2.457965, 0.600265, 0.5334188, 1, 0, 0.04705882, 1,
2.528451, -0.4709752, 0.5497302, 1, 0, 0.04313726, 1,
2.538086, -0.9853187, 2.266054, 1, 0, 0.03529412, 1,
2.609822, 0.08512703, 0.8901747, 1, 0, 0.03137255, 1,
2.660517, 0.4316458, 1.809385, 1, 0, 0.02352941, 1,
2.687232, 0.9980026, -0.9387097, 1, 0, 0.01960784, 1,
2.807436, 1.930148, 0.7834841, 1, 0, 0.01176471, 1,
3.014603, 0.8194881, 2.863445, 1, 0, 0.007843138, 1
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
-0.1792878, -4.995481, -7.03569, 0, -0.5, 0.5, 0.5,
-0.1792878, -4.995481, -7.03569, 1, -0.5, 0.5, 0.5,
-0.1792878, -4.995481, -7.03569, 1, 1.5, 0.5, 0.5,
-0.1792878, -4.995481, -7.03569, 0, 1.5, 0.5, 0.5
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
-4.455907, 0.1344639, -7.03569, 0, -0.5, 0.5, 0.5,
-4.455907, 0.1344639, -7.03569, 1, -0.5, 0.5, 0.5,
-4.455907, 0.1344639, -7.03569, 1, 1.5, 0.5, 0.5,
-4.455907, 0.1344639, -7.03569, 0, 1.5, 0.5, 0.5
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
-4.455907, -4.995481, -0.02432537, 0, -0.5, 0.5, 0.5,
-4.455907, -4.995481, -0.02432537, 1, -0.5, 0.5, 0.5,
-4.455907, -4.995481, -0.02432537, 1, 1.5, 0.5, 0.5,
-4.455907, -4.995481, -0.02432537, 0, 1.5, 0.5, 0.5
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
-3, -3.811648, -5.417683,
3, -3.811648, -5.417683,
-3, -3.811648, -5.417683,
-3, -4.008954, -5.687351,
-2, -3.811648, -5.417683,
-2, -4.008954, -5.687351,
-1, -3.811648, -5.417683,
-1, -4.008954, -5.687351,
0, -3.811648, -5.417683,
0, -4.008954, -5.687351,
1, -3.811648, -5.417683,
1, -4.008954, -5.687351,
2, -3.811648, -5.417683,
2, -4.008954, -5.687351,
3, -3.811648, -5.417683,
3, -4.008954, -5.687351
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
-3, -4.403565, -6.226686, 0, -0.5, 0.5, 0.5,
-3, -4.403565, -6.226686, 1, -0.5, 0.5, 0.5,
-3, -4.403565, -6.226686, 1, 1.5, 0.5, 0.5,
-3, -4.403565, -6.226686, 0, 1.5, 0.5, 0.5,
-2, -4.403565, -6.226686, 0, -0.5, 0.5, 0.5,
-2, -4.403565, -6.226686, 1, -0.5, 0.5, 0.5,
-2, -4.403565, -6.226686, 1, 1.5, 0.5, 0.5,
-2, -4.403565, -6.226686, 0, 1.5, 0.5, 0.5,
-1, -4.403565, -6.226686, 0, -0.5, 0.5, 0.5,
-1, -4.403565, -6.226686, 1, -0.5, 0.5, 0.5,
-1, -4.403565, -6.226686, 1, 1.5, 0.5, 0.5,
-1, -4.403565, -6.226686, 0, 1.5, 0.5, 0.5,
0, -4.403565, -6.226686, 0, -0.5, 0.5, 0.5,
0, -4.403565, -6.226686, 1, -0.5, 0.5, 0.5,
0, -4.403565, -6.226686, 1, 1.5, 0.5, 0.5,
0, -4.403565, -6.226686, 0, 1.5, 0.5, 0.5,
1, -4.403565, -6.226686, 0, -0.5, 0.5, 0.5,
1, -4.403565, -6.226686, 1, -0.5, 0.5, 0.5,
1, -4.403565, -6.226686, 1, 1.5, 0.5, 0.5,
1, -4.403565, -6.226686, 0, 1.5, 0.5, 0.5,
2, -4.403565, -6.226686, 0, -0.5, 0.5, 0.5,
2, -4.403565, -6.226686, 1, -0.5, 0.5, 0.5,
2, -4.403565, -6.226686, 1, 1.5, 0.5, 0.5,
2, -4.403565, -6.226686, 0, 1.5, 0.5, 0.5,
3, -4.403565, -6.226686, 0, -0.5, 0.5, 0.5,
3, -4.403565, -6.226686, 1, -0.5, 0.5, 0.5,
3, -4.403565, -6.226686, 1, 1.5, 0.5, 0.5,
3, -4.403565, -6.226686, 0, 1.5, 0.5, 0.5
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
-3.468995, -2, -5.417683,
-3.468995, 2, -5.417683,
-3.468995, -2, -5.417683,
-3.63348, -2, -5.687351,
-3.468995, 0, -5.417683,
-3.63348, 0, -5.687351,
-3.468995, 2, -5.417683,
-3.63348, 2, -5.687351
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
"0",
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
-3.962451, -2, -6.226686, 0, -0.5, 0.5, 0.5,
-3.962451, -2, -6.226686, 1, -0.5, 0.5, 0.5,
-3.962451, -2, -6.226686, 1, 1.5, 0.5, 0.5,
-3.962451, -2, -6.226686, 0, 1.5, 0.5, 0.5,
-3.962451, 0, -6.226686, 0, -0.5, 0.5, 0.5,
-3.962451, 0, -6.226686, 1, -0.5, 0.5, 0.5,
-3.962451, 0, -6.226686, 1, 1.5, 0.5, 0.5,
-3.962451, 0, -6.226686, 0, 1.5, 0.5, 0.5,
-3.962451, 2, -6.226686, 0, -0.5, 0.5, 0.5,
-3.962451, 2, -6.226686, 1, -0.5, 0.5, 0.5,
-3.962451, 2, -6.226686, 1, 1.5, 0.5, 0.5,
-3.962451, 2, -6.226686, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.468995, -3.811648, -4,
-3.468995, -3.811648, 4,
-3.468995, -3.811648, -4,
-3.63348, -4.008954, -4,
-3.468995, -3.811648, -2,
-3.63348, -4.008954, -2,
-3.468995, -3.811648, 0,
-3.63348, -4.008954, 0,
-3.468995, -3.811648, 2,
-3.63348, -4.008954, 2,
-3.468995, -3.811648, 4,
-3.63348, -4.008954, 4
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
-3.962451, -4.403565, -4, 0, -0.5, 0.5, 0.5,
-3.962451, -4.403565, -4, 1, -0.5, 0.5, 0.5,
-3.962451, -4.403565, -4, 1, 1.5, 0.5, 0.5,
-3.962451, -4.403565, -4, 0, 1.5, 0.5, 0.5,
-3.962451, -4.403565, -2, 0, -0.5, 0.5, 0.5,
-3.962451, -4.403565, -2, 1, -0.5, 0.5, 0.5,
-3.962451, -4.403565, -2, 1, 1.5, 0.5, 0.5,
-3.962451, -4.403565, -2, 0, 1.5, 0.5, 0.5,
-3.962451, -4.403565, 0, 0, -0.5, 0.5, 0.5,
-3.962451, -4.403565, 0, 1, -0.5, 0.5, 0.5,
-3.962451, -4.403565, 0, 1, 1.5, 0.5, 0.5,
-3.962451, -4.403565, 0, 0, 1.5, 0.5, 0.5,
-3.962451, -4.403565, 2, 0, -0.5, 0.5, 0.5,
-3.962451, -4.403565, 2, 1, -0.5, 0.5, 0.5,
-3.962451, -4.403565, 2, 1, 1.5, 0.5, 0.5,
-3.962451, -4.403565, 2, 0, 1.5, 0.5, 0.5,
-3.962451, -4.403565, 4, 0, -0.5, 0.5, 0.5,
-3.962451, -4.403565, 4, 1, -0.5, 0.5, 0.5,
-3.962451, -4.403565, 4, 1, 1.5, 0.5, 0.5,
-3.962451, -4.403565, 4, 0, 1.5, 0.5, 0.5
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
-3.468995, -3.811648, -5.417683,
-3.468995, 4.080576, -5.417683,
-3.468995, -3.811648, 5.369032,
-3.468995, 4.080576, 5.369032,
-3.468995, -3.811648, -5.417683,
-3.468995, -3.811648, 5.369032,
-3.468995, 4.080576, -5.417683,
-3.468995, 4.080576, 5.369032,
-3.468995, -3.811648, -5.417683,
3.110419, -3.811648, -5.417683,
-3.468995, -3.811648, 5.369032,
3.110419, -3.811648, 5.369032,
-3.468995, 4.080576, -5.417683,
3.110419, 4.080576, -5.417683,
-3.468995, 4.080576, 5.369032,
3.110419, 4.080576, 5.369032,
3.110419, -3.811648, -5.417683,
3.110419, 4.080576, -5.417683,
3.110419, -3.811648, 5.369032,
3.110419, 4.080576, 5.369032,
3.110419, -3.811648, -5.417683,
3.110419, -3.811648, 5.369032,
3.110419, 4.080576, -5.417683,
3.110419, 4.080576, 5.369032
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
var radius = 7.954861;
var distance = 35.39207;
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
mvMatrix.translate( 0.1792878, -0.1344639, 0.02432537 );
mvMatrix.scale( 1.307252, 1.089801, 0.7973652 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.39207);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Pyraclostrobin<-read.table("Pyraclostrobin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pyraclostrobin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
```

```r
y<-Pyraclostrobin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
```

```r
z<-Pyraclostrobin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
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
-3.373178, -1.03723, -1.434807, 0, 0, 1, 1, 1,
-3.370997, -0.6075591, -1.605692, 1, 0, 0, 1, 1,
-3.024161, 2.359097, -1.255644, 1, 0, 0, 1, 1,
-2.80355, -0.148169, -2.037701, 1, 0, 0, 1, 1,
-2.704826, -1.118347, -1.439705, 1, 0, 0, 1, 1,
-2.612398, -0.1741361, -0.4337097, 1, 0, 0, 1, 1,
-2.478692, 0.5554465, -2.452403, 0, 0, 0, 1, 1,
-2.472777, 0.2370628, -1.874632, 0, 0, 0, 1, 1,
-2.467748, 0.4337312, -2.224186, 0, 0, 0, 1, 1,
-2.465937, -1.657964, -2.433159, 0, 0, 0, 1, 1,
-2.405372, -0.1848026, -1.086271, 0, 0, 0, 1, 1,
-2.24452, -2.421016, -1.669329, 0, 0, 0, 1, 1,
-2.206599, 0.47892, -1.218562, 0, 0, 0, 1, 1,
-2.122367, 1.001946, -1.466713, 1, 1, 1, 1, 1,
-2.112766, -0.849578, -3.37083, 1, 1, 1, 1, 1,
-2.080476, -0.7130926, -1.858311, 1, 1, 1, 1, 1,
-2.073556, 0.2266113, -2.206021, 1, 1, 1, 1, 1,
-2.006911, -0.07608718, -2.041038, 1, 1, 1, 1, 1,
-1.971082, 0.3156438, -2.105981, 1, 1, 1, 1, 1,
-1.903431, 1.666338, -0.4442634, 1, 1, 1, 1, 1,
-1.885312, 0.3396968, -2.064792, 1, 1, 1, 1, 1,
-1.875794, 0.1653454, -1.782674, 1, 1, 1, 1, 1,
-1.872992, -0.3323374, -2.74589, 1, 1, 1, 1, 1,
-1.872791, 0.510408, -1.301326, 1, 1, 1, 1, 1,
-1.854565, 0.4965197, -1.429795, 1, 1, 1, 1, 1,
-1.849418, 0.4695726, -2.103671, 1, 1, 1, 1, 1,
-1.84086, -0.1326527, -1.820325, 1, 1, 1, 1, 1,
-1.832715, -0.2037146, -1.728533, 1, 1, 1, 1, 1,
-1.799584, 1.535573, -1.138636, 0, 0, 1, 1, 1,
-1.793342, -0.5724974, -1.154773, 1, 0, 0, 1, 1,
-1.786214, -1.110316, -2.149583, 1, 0, 0, 1, 1,
-1.763319, 1.149554, -0.0248144, 1, 0, 0, 1, 1,
-1.757988, -1.544281, -1.374373, 1, 0, 0, 1, 1,
-1.757743, -0.5405958, -2.028361, 1, 0, 0, 1, 1,
-1.721541, -0.6008662, -1.606828, 0, 0, 0, 1, 1,
-1.714121, -0.1121532, -1.829941, 0, 0, 0, 1, 1,
-1.699109, -0.4408461, -1.240588, 0, 0, 0, 1, 1,
-1.695968, 0.9684846, -1.638384, 0, 0, 0, 1, 1,
-1.6873, 0.1301935, -0.754937, 0, 0, 0, 1, 1,
-1.677897, 0.2766345, -0.7852243, 0, 0, 0, 1, 1,
-1.670447, -0.8881801, -2.08437, 0, 0, 0, 1, 1,
-1.661814, 0.230675, -1.756886, 1, 1, 1, 1, 1,
-1.651633, 0.1694515, -1.054373, 1, 1, 1, 1, 1,
-1.648425, 0.5839983, -1.784512, 1, 1, 1, 1, 1,
-1.640546, 0.6186367, -0.07001319, 1, 1, 1, 1, 1,
-1.636439, -1.8199, -0.908609, 1, 1, 1, 1, 1,
-1.588393, 0.2571597, -2.339177, 1, 1, 1, 1, 1,
-1.576337, -1.079191, -2.88795, 1, 1, 1, 1, 1,
-1.567781, -2.148227, -2.287388, 1, 1, 1, 1, 1,
-1.562249, -0.9732797, -1.202135, 1, 1, 1, 1, 1,
-1.561832, 0.2027927, -1.395289, 1, 1, 1, 1, 1,
-1.559566, -0.6594947, -3.500226, 1, 1, 1, 1, 1,
-1.557544, 1.686006, -1.237324, 1, 1, 1, 1, 1,
-1.555343, 0.4551471, -0.8318633, 1, 1, 1, 1, 1,
-1.553693, 2.635128, -0.8732649, 1, 1, 1, 1, 1,
-1.539921, -0.630942, -1.200114, 1, 1, 1, 1, 1,
-1.539732, 0.2335665, -0.259416, 0, 0, 1, 1, 1,
-1.538327, 0.6360351, 0.05795707, 1, 0, 0, 1, 1,
-1.53763, 0.114795, -1.563445, 1, 0, 0, 1, 1,
-1.531018, -0.08689088, -1.691443, 1, 0, 0, 1, 1,
-1.521057, -0.6842536, -0.4634557, 1, 0, 0, 1, 1,
-1.516843, -0.3000947, -1.940073, 1, 0, 0, 1, 1,
-1.515104, 1.630635, -0.7858012, 0, 0, 0, 1, 1,
-1.494386, -0.8708371, -3.032135, 0, 0, 0, 1, 1,
-1.492745, 0.6507005, -2.534545, 0, 0, 0, 1, 1,
-1.487319, 0.08345592, 0.1480158, 0, 0, 0, 1, 1,
-1.485542, 0.2726555, -1.939975, 0, 0, 0, 1, 1,
-1.479208, -0.3464611, -1.838285, 0, 0, 0, 1, 1,
-1.475583, -0.3876781, -1.94236, 0, 0, 0, 1, 1,
-1.462831, -2.180856, -1.290936, 1, 1, 1, 1, 1,
-1.457507, -1.872431, -5.260595, 1, 1, 1, 1, 1,
-1.457368, -0.1595382, -1.302161, 1, 1, 1, 1, 1,
-1.456882, 0.4211073, -0.9217196, 1, 1, 1, 1, 1,
-1.449058, -1.704095, -1.195999, 1, 1, 1, 1, 1,
-1.445168, -0.8149298, -1.63344, 1, 1, 1, 1, 1,
-1.440362, 1.542032, -2.26995, 1, 1, 1, 1, 1,
-1.436323, 1.631867, 1.182814, 1, 1, 1, 1, 1,
-1.436297, 0.1451661, -2.132391, 1, 1, 1, 1, 1,
-1.433478, -0.5242499, -3.449782, 1, 1, 1, 1, 1,
-1.41262, 0.2403087, -1.442021, 1, 1, 1, 1, 1,
-1.387293, -0.3642851, -1.743649, 1, 1, 1, 1, 1,
-1.381853, 0.6179574, -2.547869, 1, 1, 1, 1, 1,
-1.381321, 0.3752029, -1.001523, 1, 1, 1, 1, 1,
-1.372228, -0.229274, -1.646568, 1, 1, 1, 1, 1,
-1.360477, 0.2969884, -1.411481, 0, 0, 1, 1, 1,
-1.357364, -1.735732, -2.106559, 1, 0, 0, 1, 1,
-1.347733, -1.33761, -1.627803, 1, 0, 0, 1, 1,
-1.33591, 0.5414026, 0.6212503, 1, 0, 0, 1, 1,
-1.310138, -0.1491462, -0.7811871, 1, 0, 0, 1, 1,
-1.308936, 0.2787367, -3.758382, 1, 0, 0, 1, 1,
-1.295277, -1.84444, -3.764759, 0, 0, 0, 1, 1,
-1.292917, 0.07019765, -1.726547, 0, 0, 0, 1, 1,
-1.28624, -1.055893, -2.064705, 0, 0, 0, 1, 1,
-1.280529, 0.429247, -2.411049, 0, 0, 0, 1, 1,
-1.271429, 1.70654, 0.08529874, 0, 0, 0, 1, 1,
-1.26325, -0.4722853, -2.988428, 0, 0, 0, 1, 1,
-1.258969, 0.3176984, -0.966485, 0, 0, 0, 1, 1,
-1.244361, -1.083441, -1.983191, 1, 1, 1, 1, 1,
-1.243091, -0.8078153, -1.504926, 1, 1, 1, 1, 1,
-1.241594, 0.6637603, -1.014185, 1, 1, 1, 1, 1,
-1.238641, 0.2748555, -1.8396, 1, 1, 1, 1, 1,
-1.236634, 0.4466012, -2.691423, 1, 1, 1, 1, 1,
-1.225807, 0.3566185, -3.948396, 1, 1, 1, 1, 1,
-1.218249, -0.5409897, -1.160023, 1, 1, 1, 1, 1,
-1.210746, 1.700526, -0.9742732, 1, 1, 1, 1, 1,
-1.201004, 0.7916583, 0.03819866, 1, 1, 1, 1, 1,
-1.189722, -0.3244742, -1.013601, 1, 1, 1, 1, 1,
-1.189373, 2.19097, -1.147858, 1, 1, 1, 1, 1,
-1.188513, -1.69041, -3.221959, 1, 1, 1, 1, 1,
-1.186321, -0.4254854, -3.029943, 1, 1, 1, 1, 1,
-1.184306, -0.5405665, -1.383082, 1, 1, 1, 1, 1,
-1.178464, 0.7482231, -0.8210965, 1, 1, 1, 1, 1,
-1.174832, -0.1058134, -1.210893, 0, 0, 1, 1, 1,
-1.172569, -0.3757011, -2.072147, 1, 0, 0, 1, 1,
-1.166142, -0.8738555, -1.734872, 1, 0, 0, 1, 1,
-1.165141, -0.6621296, -1.464012, 1, 0, 0, 1, 1,
-1.161767, -0.6334237, -3.54589, 1, 0, 0, 1, 1,
-1.161701, 1.276135, -0.5515107, 1, 0, 0, 1, 1,
-1.160713, -0.4608042, -3.284789, 0, 0, 0, 1, 1,
-1.154456, -0.753402, -2.692158, 0, 0, 0, 1, 1,
-1.148147, -1.077958, -3.006633, 0, 0, 0, 1, 1,
-1.146722, -0.4071125, -2.8933, 0, 0, 0, 1, 1,
-1.143211, -0.8344321, -1.292905, 0, 0, 0, 1, 1,
-1.138489, -0.8297842, -2.09813, 0, 0, 0, 1, 1,
-1.137623, -0.4886463, -0.7405583, 0, 0, 0, 1, 1,
-1.135098, 0.4685772, -2.503868, 1, 1, 1, 1, 1,
-1.130351, 0.41061, 0.2870593, 1, 1, 1, 1, 1,
-1.11941, -1.799292, -2.583327, 1, 1, 1, 1, 1,
-1.118084, 0.5602579, -1.409434, 1, 1, 1, 1, 1,
-1.112729, 0.8426597, -1.91818, 1, 1, 1, 1, 1,
-1.111347, -1.043246, -2.359035, 1, 1, 1, 1, 1,
-1.110953, -0.4264061, -0.5102097, 1, 1, 1, 1, 1,
-1.109755, 0.8789238, -0.3651668, 1, 1, 1, 1, 1,
-1.108595, -0.4077176, 0.3622608, 1, 1, 1, 1, 1,
-1.102944, -0.417228, -0.6755552, 1, 1, 1, 1, 1,
-1.1029, -0.7398324, -1.492357, 1, 1, 1, 1, 1,
-1.102728, -0.5639029, -2.936028, 1, 1, 1, 1, 1,
-1.102252, -0.585047, -1.566765, 1, 1, 1, 1, 1,
-1.102164, 0.1242569, -2.195599, 1, 1, 1, 1, 1,
-1.096555, 1.497042, 0.2693952, 1, 1, 1, 1, 1,
-1.089447, 0.6795518, -1.668959, 0, 0, 1, 1, 1,
-1.084359, -0.03510407, -1.786869, 1, 0, 0, 1, 1,
-1.083031, -1.098147, -3.232164, 1, 0, 0, 1, 1,
-1.079726, 0.2698341, -1.954318, 1, 0, 0, 1, 1,
-1.078912, 0.4294482, -1.89555, 1, 0, 0, 1, 1,
-1.069899, 0.2920073, -1.675816, 1, 0, 0, 1, 1,
-1.058237, -0.637208, -2.268781, 0, 0, 0, 1, 1,
-1.056239, 0.255356, -3.631967, 0, 0, 0, 1, 1,
-1.048833, 0.4234157, -1.841725, 0, 0, 0, 1, 1,
-1.047258, 1.897294, -1.270523, 0, 0, 0, 1, 1,
-1.044886, 0.387735, -2.815122, 0, 0, 0, 1, 1,
-1.044521, 0.1128723, -0.5844073, 0, 0, 0, 1, 1,
-1.037354, 1.194282, -0.5293228, 0, 0, 0, 1, 1,
-1.030789, 0.9269093, -2.734293, 1, 1, 1, 1, 1,
-1.022033, 1.622019, 0.1854395, 1, 1, 1, 1, 1,
-1.020726, -1.116756, -1.462301, 1, 1, 1, 1, 1,
-1.017526, 0.09301437, -1.448762, 1, 1, 1, 1, 1,
-1.015194, 0.6575586, -0.2780872, 1, 1, 1, 1, 1,
-1.010283, 1.63278, 0.4177337, 1, 1, 1, 1, 1,
-1.006271, 0.8357797, 0.0007418448, 1, 1, 1, 1, 1,
-1.00356, 0.0493142, -1.391018, 1, 1, 1, 1, 1,
-1.003431, 0.07330444, -1.812105, 1, 1, 1, 1, 1,
-1.001375, 0.3081168, -2.505967, 1, 1, 1, 1, 1,
-0.9973117, -1.904438, -2.666245, 1, 1, 1, 1, 1,
-0.9933473, -3.158014, -2.705768, 1, 1, 1, 1, 1,
-0.9914547, 1.256748, -0.8070738, 1, 1, 1, 1, 1,
-0.9793945, 0.9843635, -1.290361, 1, 1, 1, 1, 1,
-0.9775426, -0.2812079, -1.757881, 1, 1, 1, 1, 1,
-0.9750223, 1.17193, -1.029239, 0, 0, 1, 1, 1,
-0.9722222, 0.07886435, -0.04038896, 1, 0, 0, 1, 1,
-0.9658613, -0.6937643, -1.758745, 1, 0, 0, 1, 1,
-0.9655824, -1.775651, -3.342945, 1, 0, 0, 1, 1,
-0.9617425, 0.9084842, -1.363095, 1, 0, 0, 1, 1,
-0.9590578, 0.05025434, -1.623498, 1, 0, 0, 1, 1,
-0.9588087, 0.1567798, -1.496216, 0, 0, 0, 1, 1,
-0.9550892, -0.8471234, -2.063376, 0, 0, 0, 1, 1,
-0.9539709, 0.01685146, -0.5524803, 0, 0, 0, 1, 1,
-0.9407252, -1.292134, -0.8974574, 0, 0, 0, 1, 1,
-0.9385844, 0.4755761, -0.5905904, 0, 0, 0, 1, 1,
-0.935313, -0.6519541, -2.138768, 0, 0, 0, 1, 1,
-0.9248731, 0.7816381, 0.9581222, 0, 0, 0, 1, 1,
-0.9187441, -0.2305947, -1.90583, 1, 1, 1, 1, 1,
-0.9183788, -1.017111, -2.23978, 1, 1, 1, 1, 1,
-0.9139845, -0.5737079, -2.812453, 1, 1, 1, 1, 1,
-0.9123333, 1.22922, -1.410675, 1, 1, 1, 1, 1,
-0.910687, 0.5030987, 0.9081556, 1, 1, 1, 1, 1,
-0.8957643, 1.28656, -0.7296062, 1, 1, 1, 1, 1,
-0.895642, -0.1937241, -1.168929, 1, 1, 1, 1, 1,
-0.8952172, 0.6501397, -2.398957, 1, 1, 1, 1, 1,
-0.8863729, 0.8939931, -0.5049632, 1, 1, 1, 1, 1,
-0.8814467, 0.1070341, -0.9617674, 1, 1, 1, 1, 1,
-0.8670675, -0.9104205, -2.863617, 1, 1, 1, 1, 1,
-0.8660914, -2.214087, -2.387503, 1, 1, 1, 1, 1,
-0.8598825, -0.7874787, -1.381586, 1, 1, 1, 1, 1,
-0.8548551, 0.2802491, -3.270265, 1, 1, 1, 1, 1,
-0.8547227, -0.4752735, -2.704522, 1, 1, 1, 1, 1,
-0.8499101, 0.7915623, -2.439533, 0, 0, 1, 1, 1,
-0.8479508, 0.9189402, -0.7295325, 1, 0, 0, 1, 1,
-0.8458998, -0.2782919, -1.840857, 1, 0, 0, 1, 1,
-0.8361383, -0.8202948, -1.848631, 1, 0, 0, 1, 1,
-0.8358939, 0.3337699, -0.7336872, 1, 0, 0, 1, 1,
-0.8340135, 0.3550942, -0.2686453, 1, 0, 0, 1, 1,
-0.8316312, -0.7648827, -2.096957, 0, 0, 0, 1, 1,
-0.8312927, -1.54569, -2.483997, 0, 0, 0, 1, 1,
-0.8264834, -0.2141684, -1.389744, 0, 0, 0, 1, 1,
-0.8212935, -0.7653435, -1.796307, 0, 0, 0, 1, 1,
-0.8199585, -0.485775, -4.216713, 0, 0, 0, 1, 1,
-0.8194189, -0.997347, -2.793707, 0, 0, 0, 1, 1,
-0.818952, -0.2888212, -1.723319, 0, 0, 0, 1, 1,
-0.8172164, -1.219009, -3.918741, 1, 1, 1, 1, 1,
-0.8121961, -0.4587769, -1.422805, 1, 1, 1, 1, 1,
-0.8120564, 0.5887151, -0.359652, 1, 1, 1, 1, 1,
-0.8104117, -0.6186367, -2.278709, 1, 1, 1, 1, 1,
-0.8102951, 0.6855072, -0.8714719, 1, 1, 1, 1, 1,
-0.8038436, -1.037812, -1.333642, 1, 1, 1, 1, 1,
-0.8030816, -0.4997129, -1.74133, 1, 1, 1, 1, 1,
-0.7950903, 0.8594816, -1.211853, 1, 1, 1, 1, 1,
-0.7950658, 0.433154, -1.182424, 1, 1, 1, 1, 1,
-0.7949966, 0.2057401, -1.491697, 1, 1, 1, 1, 1,
-0.7797807, -0.4334681, -3.063079, 1, 1, 1, 1, 1,
-0.7768787, -0.7732237, -4.546941, 1, 1, 1, 1, 1,
-0.7749727, 0.4803577, -2.117972, 1, 1, 1, 1, 1,
-0.7744914, 0.6239842, -1.908864, 1, 1, 1, 1, 1,
-0.770179, 1.385345, -1.163448, 1, 1, 1, 1, 1,
-0.7678646, -0.1945781, -2.123119, 0, 0, 1, 1, 1,
-0.7640241, 1.771822, -1.361154, 1, 0, 0, 1, 1,
-0.7630373, 1.357678, -0.8202072, 1, 0, 0, 1, 1,
-0.7611927, -2.504114, -2.063544, 1, 0, 0, 1, 1,
-0.7510647, 0.4428655, -0.4590101, 1, 0, 0, 1, 1,
-0.7477251, -0.9906712, -2.905025, 1, 0, 0, 1, 1,
-0.7475983, 0.344137, -3.163528, 0, 0, 0, 1, 1,
-0.7468552, -0.8880694, -2.184497, 0, 0, 0, 1, 1,
-0.7396423, 0.9549811, -0.2243728, 0, 0, 0, 1, 1,
-0.7376998, -0.7175325, -3.281943, 0, 0, 0, 1, 1,
-0.7369689, 1.654904, 1.004133, 0, 0, 0, 1, 1,
-0.7360733, -0.833257, -1.479188, 0, 0, 0, 1, 1,
-0.7277923, 1.414232, -0.2788031, 0, 0, 0, 1, 1,
-0.723964, -0.8056498, -0.3419828, 1, 1, 1, 1, 1,
-0.7239134, -0.3789635, -2.572135, 1, 1, 1, 1, 1,
-0.7217303, -0.8093038, -1.341012, 1, 1, 1, 1, 1,
-0.7192354, 0.483375, -0.424006, 1, 1, 1, 1, 1,
-0.7165433, -0.2671571, -0.7647688, 1, 1, 1, 1, 1,
-0.7148327, 0.7236142, -1.495058, 1, 1, 1, 1, 1,
-0.7089593, -2.602937, -2.422546, 1, 1, 1, 1, 1,
-0.6963291, 2.04243, -1.273481, 1, 1, 1, 1, 1,
-0.6962028, -0.05669729, 0.2760284, 1, 1, 1, 1, 1,
-0.696153, -1.462538, -3.533028, 1, 1, 1, 1, 1,
-0.6895386, -0.3336169, -2.609036, 1, 1, 1, 1, 1,
-0.6879752, -0.7640266, -2.329765, 1, 1, 1, 1, 1,
-0.6869887, 1.342989, -1.70888, 1, 1, 1, 1, 1,
-0.6846918, 0.8915492, -1.445108, 1, 1, 1, 1, 1,
-0.6834143, 0.7747458, -1.487269, 1, 1, 1, 1, 1,
-0.6785858, -0.4358401, -2.238031, 0, 0, 1, 1, 1,
-0.6703893, 0.02743526, -3.328314, 1, 0, 0, 1, 1,
-0.6689935, 1.134602, -2.262852, 1, 0, 0, 1, 1,
-0.649126, 0.03995166, -0.03168201, 1, 0, 0, 1, 1,
-0.6475219, 1.450126, 0.7437634, 1, 0, 0, 1, 1,
-0.6469206, 1.813638, 0.3378824, 1, 0, 0, 1, 1,
-0.6436871, -0.7359077, -3.043523, 0, 0, 0, 1, 1,
-0.6425234, 1.885761, -0.9347618, 0, 0, 0, 1, 1,
-0.6401145, 0.6839013, -2.168723, 0, 0, 0, 1, 1,
-0.6385424, 0.07837668, -1.685373, 0, 0, 0, 1, 1,
-0.6364628, 0.5170897, -0.4451796, 0, 0, 0, 1, 1,
-0.6350381, 1.153518, -1.86718, 0, 0, 0, 1, 1,
-0.6309673, 0.6441971, -2.579257, 0, 0, 0, 1, 1,
-0.6305537, -0.5797147, -1.966199, 1, 1, 1, 1, 1,
-0.6304723, -0.1329956, -2.246478, 1, 1, 1, 1, 1,
-0.6287509, 0.9884411, 0.4108379, 1, 1, 1, 1, 1,
-0.6248276, -1.503419, -2.037574, 1, 1, 1, 1, 1,
-0.6199984, -0.4578061, -2.750331, 1, 1, 1, 1, 1,
-0.6199565, -0.6126236, -2.958557, 1, 1, 1, 1, 1,
-0.6172051, -0.3091692, -1.071954, 1, 1, 1, 1, 1,
-0.6096553, 0.719418, 0.6709175, 1, 1, 1, 1, 1,
-0.6087945, 0.2181603, -0.3264196, 1, 1, 1, 1, 1,
-0.6084935, -0.6156951, -1.790266, 1, 1, 1, 1, 1,
-0.6047322, 2.638265, -1.547085, 1, 1, 1, 1, 1,
-0.5960425, 0.5977891, -1.614966, 1, 1, 1, 1, 1,
-0.5953332, 1.232492, -0.6667201, 1, 1, 1, 1, 1,
-0.5912117, -0.1926296, -1.581109, 1, 1, 1, 1, 1,
-0.588516, 0.374917, 0.7505362, 1, 1, 1, 1, 1,
-0.5829935, 0.1841938, -1.27775, 0, 0, 1, 1, 1,
-0.5811343, 1.178489, 2.466907, 1, 0, 0, 1, 1,
-0.5775054, 0.2038845, -3.479048, 1, 0, 0, 1, 1,
-0.5756142, -0.3240672, -2.173764, 1, 0, 0, 1, 1,
-0.5723609, 1.757986, 1.220931, 1, 0, 0, 1, 1,
-0.5715324, -0.0605236, -0.3361955, 1, 0, 0, 1, 1,
-0.5711854, 1.268979, -2.486532, 0, 0, 0, 1, 1,
-0.5692827, 0.3828244, -1.578341, 0, 0, 0, 1, 1,
-0.5669026, -0.8356017, -3.646405, 0, 0, 0, 1, 1,
-0.5551319, -0.7153265, -3.526916, 0, 0, 0, 1, 1,
-0.5538388, 1.243531, -0.5779909, 0, 0, 0, 1, 1,
-0.5498224, 0.06778212, -1.283151, 0, 0, 0, 1, 1,
-0.5476095, 0.5462022, -0.8136476, 0, 0, 0, 1, 1,
-0.5424439, -0.4357902, -1.009727, 1, 1, 1, 1, 1,
-0.5396383, -0.4006524, -3.163708, 1, 1, 1, 1, 1,
-0.5388636, -0.771807, -3.4973, 1, 1, 1, 1, 1,
-0.538107, 0.1416055, -1.254403, 1, 1, 1, 1, 1,
-0.5264069, -1.013516, 0.1300134, 1, 1, 1, 1, 1,
-0.5227097, 0.3603729, -2.738059, 1, 1, 1, 1, 1,
-0.5209014, -0.7761773, -3.559223, 1, 1, 1, 1, 1,
-0.5188113, 0.04977255, -1.786415, 1, 1, 1, 1, 1,
-0.5143952, -0.06446283, -0.3480054, 1, 1, 1, 1, 1,
-0.5118663, 0.2537667, -2.273692, 1, 1, 1, 1, 1,
-0.5110136, -0.5988238, -1.877504, 1, 1, 1, 1, 1,
-0.5082697, 1.591821, -1.466166, 1, 1, 1, 1, 1,
-0.5070402, -0.9371338, -3.053758, 1, 1, 1, 1, 1,
-0.5049178, 0.1685354, -0.9271775, 1, 1, 1, 1, 1,
-0.5034943, -0.5315664, -0.8983896, 1, 1, 1, 1, 1,
-0.5001404, 1.379068, -1.154813, 0, 0, 1, 1, 1,
-0.4975775, -1.584714, -3.398601, 1, 0, 0, 1, 1,
-0.4944283, -1.353291, -3.144006, 1, 0, 0, 1, 1,
-0.4932674, -0.01600502, 0.4555137, 1, 0, 0, 1, 1,
-0.4920911, 0.5509864, -2.024549, 1, 0, 0, 1, 1,
-0.4874386, 1.602518, -0.4164405, 1, 0, 0, 1, 1,
-0.4856525, 0.2192655, -2.507685, 0, 0, 0, 1, 1,
-0.4833958, -0.8296319, -2.82583, 0, 0, 0, 1, 1,
-0.4745407, 3.245858, 0.4236233, 0, 0, 0, 1, 1,
-0.4689361, -1.318405, -0.7031705, 0, 0, 0, 1, 1,
-0.4687157, -0.8868518, -4.749773, 0, 0, 0, 1, 1,
-0.4650254, -0.6787405, -1.232974, 0, 0, 0, 1, 1,
-0.4480526, 1.128372, 1.242866, 0, 0, 0, 1, 1,
-0.4452984, 0.005937949, -1.901778, 1, 1, 1, 1, 1,
-0.445017, -0.2287444, -1.907244, 1, 1, 1, 1, 1,
-0.443595, 1.301259, -2.311211, 1, 1, 1, 1, 1,
-0.4431599, -0.887989, -2.746805, 1, 1, 1, 1, 1,
-0.442244, 1.034175, 0.6082044, 1, 1, 1, 1, 1,
-0.4396492, -0.3545004, -2.731215, 1, 1, 1, 1, 1,
-0.4358858, -1.451308, -0.5074492, 1, 1, 1, 1, 1,
-0.4355604, -0.7475303, -2.099777, 1, 1, 1, 1, 1,
-0.4354046, -1.868963, -3.1904, 1, 1, 1, 1, 1,
-0.4352061, 0.6541222, -1.420573, 1, 1, 1, 1, 1,
-0.4299442, 0.5582947, -0.1602136, 1, 1, 1, 1, 1,
-0.4263685, 0.3800811, -1.46321, 1, 1, 1, 1, 1,
-0.4238978, -1.54602, -3.291617, 1, 1, 1, 1, 1,
-0.4226182, 1.493998, 0.6671029, 1, 1, 1, 1, 1,
-0.42076, -1.299468, -2.386401, 1, 1, 1, 1, 1,
-0.4176875, -0.7032255, -3.606925, 0, 0, 1, 1, 1,
-0.417493, -0.5571124, -3.557349, 1, 0, 0, 1, 1,
-0.4172709, 1.606198, -0.6357818, 1, 0, 0, 1, 1,
-0.4171563, 3.218366, 0.6763968, 1, 0, 0, 1, 1,
-0.4171148, -0.8383314, -3.540713, 1, 0, 0, 1, 1,
-0.4105435, -0.08492652, -1.652328, 1, 0, 0, 1, 1,
-0.403505, -0.5522086, -2.155416, 0, 0, 0, 1, 1,
-0.3993823, -0.8838997, -2.706759, 0, 0, 0, 1, 1,
-0.3970585, -0.8314726, -1.908005, 0, 0, 0, 1, 1,
-0.3955808, 0.7045368, 0.2990715, 0, 0, 0, 1, 1,
-0.3948264, 0.513331, -1.495661, 0, 0, 0, 1, 1,
-0.3946497, -0.0001471911, -0.6818578, 0, 0, 0, 1, 1,
-0.3944553, 0.9607701, 0.04000949, 0, 0, 0, 1, 1,
-0.3924442, 0.7839612, -0.03668008, 1, 1, 1, 1, 1,
-0.3916459, 0.6196164, -1.184644, 1, 1, 1, 1, 1,
-0.3901257, 0.3381197, -0.840405, 1, 1, 1, 1, 1,
-0.3892571, 1.032958, -1.000593, 1, 1, 1, 1, 1,
-0.3888736, -1.999173, -2.936059, 1, 1, 1, 1, 1,
-0.3881639, 0.008353995, -1.406752, 1, 1, 1, 1, 1,
-0.3879519, 0.187216, -2.782971, 1, 1, 1, 1, 1,
-0.3871143, -1.532736, -3.243121, 1, 1, 1, 1, 1,
-0.3864673, 0.5047554, -0.9709693, 1, 1, 1, 1, 1,
-0.3818067, -0.1739567, -3.534531, 1, 1, 1, 1, 1,
-0.3800309, -0.1653999, -2.22655, 1, 1, 1, 1, 1,
-0.3790691, 1.386669, -1.886121, 1, 1, 1, 1, 1,
-0.378705, -0.1113852, -3.741185, 1, 1, 1, 1, 1,
-0.3765495, -0.8838608, -3.78967, 1, 1, 1, 1, 1,
-0.3741699, 0.1692079, -1.707975, 1, 1, 1, 1, 1,
-0.3717275, 0.9686508, 0.5891036, 0, 0, 1, 1, 1,
-0.3716218, -0.3592904, -3.025801, 1, 0, 0, 1, 1,
-0.3702693, 2.076212, 0.8597915, 1, 0, 0, 1, 1,
-0.3630883, 0.09379428, -1.22729, 1, 0, 0, 1, 1,
-0.3599983, -1.747123, -2.949831, 1, 0, 0, 1, 1,
-0.3572585, 1.042143, 0.3609228, 1, 0, 0, 1, 1,
-0.3548949, 0.6859732, -0.6406512, 0, 0, 0, 1, 1,
-0.3509157, 0.945118, -1.675888, 0, 0, 0, 1, 1,
-0.3502808, -0.7820107, -0.1895853, 0, 0, 0, 1, 1,
-0.3496865, -0.0522669, -3.353625, 0, 0, 0, 1, 1,
-0.3447004, -1.377583, -3.751704, 0, 0, 0, 1, 1,
-0.3437175, 0.0189747, 0.945259, 0, 0, 0, 1, 1,
-0.3422457, 1.208886, 0.699605, 0, 0, 0, 1, 1,
-0.3403096, 1.967017, -0.0141085, 1, 1, 1, 1, 1,
-0.3390558, -0.7276837, -1.899945, 1, 1, 1, 1, 1,
-0.3335564, -0.2643664, -2.679084, 1, 1, 1, 1, 1,
-0.3323984, -0.1307609, -2.756505, 1, 1, 1, 1, 1,
-0.3314612, -0.5541158, -2.191547, 1, 1, 1, 1, 1,
-0.3183111, -0.545798, -4.83687, 1, 1, 1, 1, 1,
-0.3170465, 0.07465863, -1.646542, 1, 1, 1, 1, 1,
-0.3147697, 0.3523402, -2.386959, 1, 1, 1, 1, 1,
-0.3125829, -0.4547757, -1.139751, 1, 1, 1, 1, 1,
-0.3098402, 1.232075, -0.09565667, 1, 1, 1, 1, 1,
-0.3032224, 0.6640559, 1.459931, 1, 1, 1, 1, 1,
-0.3005268, -1.07932, -2.464185, 1, 1, 1, 1, 1,
-0.2992578, 0.8874763, -0.03851418, 1, 1, 1, 1, 1,
-0.2979632, 0.8346224, 0.9367839, 1, 1, 1, 1, 1,
-0.2962638, -0.004991973, -1.2576, 1, 1, 1, 1, 1,
-0.2954921, 0.3420011, -1.700822, 0, 0, 1, 1, 1,
-0.2932412, -0.2297643, -1.552463, 1, 0, 0, 1, 1,
-0.2897328, 0.6091655, -1.035332, 1, 0, 0, 1, 1,
-0.2873745, -1.49959, -3.320474, 1, 0, 0, 1, 1,
-0.2848618, 0.4620628, 1.223206, 1, 0, 0, 1, 1,
-0.2768673, 1.424218, 0.8705367, 1, 0, 0, 1, 1,
-0.2720188, 1.092342, 0.5540218, 0, 0, 0, 1, 1,
-0.2696183, 0.4112346, -0.4691797, 0, 0, 0, 1, 1,
-0.2670347, 0.4871769, -1.063048, 0, 0, 0, 1, 1,
-0.2667661, 1.059152, -1.263716, 0, 0, 0, 1, 1,
-0.2622248, 1.295086, -0.8506918, 0, 0, 0, 1, 1,
-0.2606911, 0.1953319, 0.02284297, 0, 0, 0, 1, 1,
-0.2587495, 0.6086188, -1.86425, 0, 0, 0, 1, 1,
-0.2543517, -1.382937, -3.108729, 1, 1, 1, 1, 1,
-0.2535104, -1.140593, 0.06852054, 1, 1, 1, 1, 1,
-0.2490934, 0.2411328, -0.4296292, 1, 1, 1, 1, 1,
-0.2445739, 1.214207, 1.983456, 1, 1, 1, 1, 1,
-0.2422516, -0.04047204, -2.314399, 1, 1, 1, 1, 1,
-0.2412948, -0.4501159, -1.985733, 1, 1, 1, 1, 1,
-0.240508, -0.6814299, -2.72666, 1, 1, 1, 1, 1,
-0.2397231, -0.2348228, -1.785658, 1, 1, 1, 1, 1,
-0.2388852, 2.383333, 0.8044903, 1, 1, 1, 1, 1,
-0.2356437, 0.5339599, -1.545579, 1, 1, 1, 1, 1,
-0.2348662, 1.134212, -0.7751479, 1, 1, 1, 1, 1,
-0.229952, -0.05399319, -1.797864, 1, 1, 1, 1, 1,
-0.2299011, 0.0129324, -2.788241, 1, 1, 1, 1, 1,
-0.2292235, 0.02474142, -1.616647, 1, 1, 1, 1, 1,
-0.2289265, -0.6002908, -3.938688, 1, 1, 1, 1, 1,
-0.2286783, 0.5067371, -1.065548, 0, 0, 1, 1, 1,
-0.2275366, 0.3533147, -1.206272, 1, 0, 0, 1, 1,
-0.2192481, -0.6818521, -4.281837, 1, 0, 0, 1, 1,
-0.2151078, -0.5169125, -2.911899, 1, 0, 0, 1, 1,
-0.2141679, -0.5020331, -0.7980055, 1, 0, 0, 1, 1,
-0.2137982, 0.8437274, 0.5854399, 1, 0, 0, 1, 1,
-0.2136121, 0.9619134, -0.09341782, 0, 0, 0, 1, 1,
-0.2121291, 0.111604, -2.244347, 0, 0, 0, 1, 1,
-0.2081138, -0.5113968, -2.96015, 0, 0, 0, 1, 1,
-0.199632, -0.243727, -0.655236, 0, 0, 0, 1, 1,
-0.1976622, -1.370652, -2.204803, 0, 0, 0, 1, 1,
-0.1975496, 0.551141, -0.4433906, 0, 0, 0, 1, 1,
-0.1895781, -0.1464152, -3.851565, 0, 0, 0, 1, 1,
-0.1804378, -0.2730384, -2.371672, 1, 1, 1, 1, 1,
-0.1776665, 0.8973193, -0.9601555, 1, 1, 1, 1, 1,
-0.1698789, -0.3251722, -2.235454, 1, 1, 1, 1, 1,
-0.1690682, -0.3144459, -3.254174, 1, 1, 1, 1, 1,
-0.165292, 1.788186, -0.6102818, 1, 1, 1, 1, 1,
-0.1591626, 0.5181399, -1.377651, 1, 1, 1, 1, 1,
-0.1578094, -0.5961527, -3.561122, 1, 1, 1, 1, 1,
-0.1571614, -0.3755148, -2.112074, 1, 1, 1, 1, 1,
-0.1531173, -1.022195, -3.659655, 1, 1, 1, 1, 1,
-0.1439495, 0.40515, 0.04501524, 1, 1, 1, 1, 1,
-0.1428313, -1.757437, -1.289949, 1, 1, 1, 1, 1,
-0.1422228, 1.387849, -0.05592699, 1, 1, 1, 1, 1,
-0.1408839, -1.114566, -1.249383, 1, 1, 1, 1, 1,
-0.1408037, 0.3314485, 0.4009152, 1, 1, 1, 1, 1,
-0.1333217, 0.140104, -2.090029, 1, 1, 1, 1, 1,
-0.1323039, -0.7292792, -4.033686, 0, 0, 1, 1, 1,
-0.1298724, -0.187864, -2.564536, 1, 0, 0, 1, 1,
-0.1279391, -0.3126059, -1.565451, 1, 0, 0, 1, 1,
-0.1276555, -2.246135, -1.790877, 1, 0, 0, 1, 1,
-0.1215657, 1.451523, -0.882722, 1, 0, 0, 1, 1,
-0.1209028, 0.6139587, -0.4711606, 1, 0, 0, 1, 1,
-0.1176971, 0.9327308, 0.5316328, 0, 0, 0, 1, 1,
-0.1166826, 0.5244405, 0.3532114, 0, 0, 0, 1, 1,
-0.1145623, -1.587578, -2.365446, 0, 0, 0, 1, 1,
-0.1067752, -0.7936705, -3.657965, 0, 0, 0, 1, 1,
-0.1055254, 0.07212549, -1.447915, 0, 0, 0, 1, 1,
-0.1033928, 1.40205, -2.027942, 0, 0, 0, 1, 1,
-0.1021804, 0.4787315, -0.03442848, 0, 0, 0, 1, 1,
-0.1009404, -1.1853, -1.959027, 1, 1, 1, 1, 1,
-0.1008543, -0.4148721, -3.318001, 1, 1, 1, 1, 1,
-0.09884651, 1.000608, 0.6084411, 1, 1, 1, 1, 1,
-0.09783272, -0.06533332, -2.667185, 1, 1, 1, 1, 1,
-0.0911748, -3.696713, -1.737802, 1, 1, 1, 1, 1,
-0.08659328, -0.3899622, -2.780742, 1, 1, 1, 1, 1,
-0.08371068, -0.05154502, -0.05223945, 1, 1, 1, 1, 1,
-0.08143242, -0.579684, -4.675246, 1, 1, 1, 1, 1,
-0.0789137, 0.1543931, -0.9014561, 1, 1, 1, 1, 1,
-0.0781094, 1.469595, 0.4524529, 1, 1, 1, 1, 1,
-0.07255096, 0.7031024, 0.2973226, 1, 1, 1, 1, 1,
-0.07019077, 1.210772, 0.6316649, 1, 1, 1, 1, 1,
-0.07014884, -0.008928862, -0.6957621, 1, 1, 1, 1, 1,
-0.06906334, 1.450883, -1.427415, 1, 1, 1, 1, 1,
-0.06449779, 0.1309578, -0.4576754, 1, 1, 1, 1, 1,
-0.06184848, -0.434644, -0.8435624, 0, 0, 1, 1, 1,
-0.05920409, 1.400963, 0.4394893, 1, 0, 0, 1, 1,
-0.05820495, -1.080665, -2.921033, 1, 0, 0, 1, 1,
-0.05678827, 0.6112902, 1.439703, 1, 0, 0, 1, 1,
-0.05570137, -1.731168, -2.536781, 1, 0, 0, 1, 1,
-0.05542707, -0.1885445, -4.050039, 1, 0, 0, 1, 1,
-0.05347017, 0.9948987, -1.233078, 0, 0, 0, 1, 1,
-0.0531804, -1.006315, -2.174253, 0, 0, 0, 1, 1,
-0.04536565, -1.264082, -2.527305, 0, 0, 0, 1, 1,
-0.0452549, -1.061773, -3.451857, 0, 0, 0, 1, 1,
-0.04353366, 0.4632828, -0.3491552, 0, 0, 0, 1, 1,
-0.03873932, -0.3413172, -3.949641, 0, 0, 0, 1, 1,
-0.03370686, 1.151733, 0.05125634, 0, 0, 0, 1, 1,
-0.03286577, -1.391115, -4.770453, 1, 1, 1, 1, 1,
-0.03275965, -1.599298, -4.024483, 1, 1, 1, 1, 1,
-0.02905948, 0.03760859, -0.1339694, 1, 1, 1, 1, 1,
-0.02900765, -0.455386, -2.302126, 1, 1, 1, 1, 1,
-0.02833057, 0.5122494, -2.149347, 1, 1, 1, 1, 1,
-0.02608612, -0.4680054, -3.534282, 1, 1, 1, 1, 1,
-0.02515453, -0.8746046, -2.940773, 1, 1, 1, 1, 1,
-0.02048427, 0.4772163, -0.5178273, 1, 1, 1, 1, 1,
-0.016403, 0.905821, 0.2058681, 1, 1, 1, 1, 1,
-0.01398915, -1.260242, -1.373588, 1, 1, 1, 1, 1,
-0.009382294, 1.648527, -1.171414, 1, 1, 1, 1, 1,
-0.008914742, -0.301516, -3.001341, 1, 1, 1, 1, 1,
-0.008882061, 1.316761, -1.32339, 1, 1, 1, 1, 1,
-0.007511454, 0.1189129, 0.135656, 1, 1, 1, 1, 1,
-0.006897985, -0.3812506, -3.444102, 1, 1, 1, 1, 1,
-0.006547725, 0.2989728, 0.8279504, 0, 0, 1, 1, 1,
-0.003239298, -1.179059, -4.280242, 1, 0, 0, 1, 1,
0.007357578, -0.6714002, 3.708032, 1, 0, 0, 1, 1,
0.008353554, 1.034098, 0.5290287, 1, 0, 0, 1, 1,
0.01158338, -0.8139869, 2.006798, 1, 0, 0, 1, 1,
0.01411572, 2.059983, 0.5114138, 1, 0, 0, 1, 1,
0.01647334, -0.0627766, 2.667161, 0, 0, 0, 1, 1,
0.01714047, 0.2033727, -1.547785, 0, 0, 0, 1, 1,
0.02022653, 0.2108204, -0.1165126, 0, 0, 0, 1, 1,
0.02051933, -0.4246511, 2.193129, 0, 0, 0, 1, 1,
0.02892249, -0.2708455, 2.434818, 0, 0, 0, 1, 1,
0.03610173, 0.7043059, 0.1783148, 0, 0, 0, 1, 1,
0.0364057, -1.54059, 4.347827, 0, 0, 0, 1, 1,
0.03903342, 1.197629, 0.1887725, 1, 1, 1, 1, 1,
0.04117651, -0.03482974, 1.236691, 1, 1, 1, 1, 1,
0.04553714, -0.04509252, 2.619872, 1, 1, 1, 1, 1,
0.04633312, -0.2128931, 4.443244, 1, 1, 1, 1, 1,
0.04986941, -0.7103997, 2.676361, 1, 1, 1, 1, 1,
0.05237788, 0.6793292, -0.7333861, 1, 1, 1, 1, 1,
0.05414962, -0.5033255, 3.0388, 1, 1, 1, 1, 1,
0.05639848, 0.893133, -0.7950304, 1, 1, 1, 1, 1,
0.06257306, 0.7749788, 1.010304, 1, 1, 1, 1, 1,
0.06371089, 1.040171, -2.445032, 1, 1, 1, 1, 1,
0.06527639, 0.4605549, 0.5831506, 1, 1, 1, 1, 1,
0.06573402, -0.7967959, 3.782848, 1, 1, 1, 1, 1,
0.06657242, -0.4254905, 3.352064, 1, 1, 1, 1, 1,
0.06866499, -1.842796, 2.696879, 1, 1, 1, 1, 1,
0.07029587, 0.6698931, 1.610096, 1, 1, 1, 1, 1,
0.07200678, -1.174058, 3.712945, 0, 0, 1, 1, 1,
0.07472361, -0.5028513, 2.760349, 1, 0, 0, 1, 1,
0.07495965, -1.412528, 5.211944, 1, 0, 0, 1, 1,
0.07558978, -0.6781858, 3.827191, 1, 0, 0, 1, 1,
0.07638598, -0.8040162, 1.684941, 1, 0, 0, 1, 1,
0.07750769, 0.3271815, -0.934767, 1, 0, 0, 1, 1,
0.08027457, -1.618226, 3.875136, 0, 0, 0, 1, 1,
0.08365724, 0.3231771, 0.02286876, 0, 0, 0, 1, 1,
0.08469801, -0.8180093, 2.796212, 0, 0, 0, 1, 1,
0.09144843, -0.01002608, 1.705403, 0, 0, 0, 1, 1,
0.09326299, 0.2993663, 1.796207, 0, 0, 0, 1, 1,
0.1074428, 1.031744, 0.5969202, 0, 0, 0, 1, 1,
0.1078691, 0.5722645, 1.26025, 0, 0, 0, 1, 1,
0.1092273, 2.298272, 1.852173, 1, 1, 1, 1, 1,
0.1104226, -0.4868621, 2.752762, 1, 1, 1, 1, 1,
0.1137659, 0.2515286, -0.458067, 1, 1, 1, 1, 1,
0.1191396, 0.3031266, -0.003234571, 1, 1, 1, 1, 1,
0.119313, -0.5689608, 3.560272, 1, 1, 1, 1, 1,
0.1207343, -0.7651507, 1.656602, 1, 1, 1, 1, 1,
0.1219481, 0.6777753, 0.1140927, 1, 1, 1, 1, 1,
0.1260244, -1.581858, 1.953192, 1, 1, 1, 1, 1,
0.1288894, 0.03776788, -1.128685, 1, 1, 1, 1, 1,
0.1291374, -0.4097255, 3.149465, 1, 1, 1, 1, 1,
0.1336561, 0.2289553, -0.08641227, 1, 1, 1, 1, 1,
0.1406541, 2.218195, 0.4030811, 1, 1, 1, 1, 1,
0.1426498, 1.130092, 0.005114136, 1, 1, 1, 1, 1,
0.1455675, 0.02377286, 2.353438, 1, 1, 1, 1, 1,
0.1465162, -0.6741738, 3.195915, 1, 1, 1, 1, 1,
0.1493724, 0.94837, 0.8419442, 0, 0, 1, 1, 1,
0.1508913, -1.157247, 2.601761, 1, 0, 0, 1, 1,
0.1511394, 1.716543, -0.8381877, 1, 0, 0, 1, 1,
0.1541098, 0.2749779, -1.8377, 1, 0, 0, 1, 1,
0.155116, 2.367914, -0.4381609, 1, 0, 0, 1, 1,
0.1583356, -0.5373782, 2.531106, 1, 0, 0, 1, 1,
0.1615324, 0.3920627, -0.4527447, 0, 0, 0, 1, 1,
0.161943, -1.06043, 3.349114, 0, 0, 0, 1, 1,
0.1629438, -0.4286022, 1.490636, 0, 0, 0, 1, 1,
0.1652827, -1.451027, 2.283165, 0, 0, 0, 1, 1,
0.1729003, -0.8259146, 4.081353, 0, 0, 0, 1, 1,
0.1759439, 2.268485, -0.04872039, 0, 0, 0, 1, 1,
0.1773745, -0.6858991, 2.838622, 0, 0, 0, 1, 1,
0.1792773, -0.2984893, 2.64449, 1, 1, 1, 1, 1,
0.181211, -2.136839, 1.927372, 1, 1, 1, 1, 1,
0.1828999, 0.7495868, 0.883495, 1, 1, 1, 1, 1,
0.1857869, 0.2976897, -1.390466, 1, 1, 1, 1, 1,
0.1867927, 0.3380347, 0.3193777, 1, 1, 1, 1, 1,
0.1923006, 0.5249845, 2.380979, 1, 1, 1, 1, 1,
0.1988876, -0.08824479, 2.968221, 1, 1, 1, 1, 1,
0.2000835, -0.431778, 3.652428, 1, 1, 1, 1, 1,
0.2037631, 1.097301, -0.3203539, 1, 1, 1, 1, 1,
0.2039162, 0.7609974, 0.3383132, 1, 1, 1, 1, 1,
0.2067336, -0.6882398, 1.870735, 1, 1, 1, 1, 1,
0.2075637, -2.298777, 3.432462, 1, 1, 1, 1, 1,
0.208363, -0.06030066, 1.96005, 1, 1, 1, 1, 1,
0.2109325, -0.8635725, 2.037253, 1, 1, 1, 1, 1,
0.2190869, 0.1768705, -2.404767, 1, 1, 1, 1, 1,
0.233282, -0.4235198, 3.258503, 0, 0, 1, 1, 1,
0.2342674, 0.8447579, 0.2167154, 1, 0, 0, 1, 1,
0.2360096, 1.511956, -0.3036682, 1, 0, 0, 1, 1,
0.239105, -0.7718739, 2.619348, 1, 0, 0, 1, 1,
0.2398322, 0.2857355, -1.894263, 1, 0, 0, 1, 1,
0.2404388, -1.943834, 1.616028, 1, 0, 0, 1, 1,
0.2499127, 0.6846857, 0.07400161, 0, 0, 0, 1, 1,
0.2507104, 0.4141791, -0.8556516, 0, 0, 0, 1, 1,
0.2523193, 1.51733, 1.063741, 0, 0, 0, 1, 1,
0.255224, -1.485215, 4.676483, 0, 0, 0, 1, 1,
0.2552617, -0.431987, 1.27709, 0, 0, 0, 1, 1,
0.2577135, -1.334324, 0.6927058, 0, 0, 0, 1, 1,
0.2578039, -0.8219482, 3.466224, 0, 0, 0, 1, 1,
0.2582228, -1.369958, 5.055786, 1, 1, 1, 1, 1,
0.2597165, -1.307881, 2.389022, 1, 1, 1, 1, 1,
0.2605702, 0.8933744, -0.9907572, 1, 1, 1, 1, 1,
0.2616971, 0.1321267, -0.01934952, 1, 1, 1, 1, 1,
0.2630405, 1.261322, 0.2814191, 1, 1, 1, 1, 1,
0.2655586, 0.803243, 1.295948, 1, 1, 1, 1, 1,
0.2755613, 0.5737134, 0.670146, 1, 1, 1, 1, 1,
0.2756399, -1.256747, 2.679403, 1, 1, 1, 1, 1,
0.2782682, 0.1100786, 0.5341325, 1, 1, 1, 1, 1,
0.2787995, 1.579537, 0.7530859, 1, 1, 1, 1, 1,
0.2794236, 0.3276522, 0.8116835, 1, 1, 1, 1, 1,
0.2844336, 0.1397249, 1.586767, 1, 1, 1, 1, 1,
0.2845823, 0.421253, 1.892225, 1, 1, 1, 1, 1,
0.286409, 0.9223171, 0.04276261, 1, 1, 1, 1, 1,
0.288785, -0.8859822, 2.869323, 1, 1, 1, 1, 1,
0.2909915, -1.72512, 3.03692, 0, 0, 1, 1, 1,
0.2922063, -0.6483557, 4.542004, 1, 0, 0, 1, 1,
0.2929848, -1.258053, 3.215168, 1, 0, 0, 1, 1,
0.29313, -0.3068497, 3.868777, 1, 0, 0, 1, 1,
0.298612, 1.145247, -0.6208234, 1, 0, 0, 1, 1,
0.3022031, 0.1402092, 1.952761, 1, 0, 0, 1, 1,
0.3025136, 0.5904958, 0.6054689, 0, 0, 0, 1, 1,
0.3040124, -0.6057614, 3.677563, 0, 0, 0, 1, 1,
0.3097978, 0.8531536, 0.8575835, 0, 0, 0, 1, 1,
0.312956, 0.7148047, 1.63804, 0, 0, 0, 1, 1,
0.3131222, 0.3388774, 1.1823, 0, 0, 0, 1, 1,
0.3148937, -0.3714779, 5.042216, 0, 0, 0, 1, 1,
0.3157015, 0.07977427, 2.139548, 0, 0, 0, 1, 1,
0.3162405, 0.6699618, -0.04664816, 1, 1, 1, 1, 1,
0.3243768, -0.560213, 1.806358, 1, 1, 1, 1, 1,
0.3254038, -1.825734, 2.06412, 1, 1, 1, 1, 1,
0.328889, -1.47779, 3.290977, 1, 1, 1, 1, 1,
0.3348226, -0.8627541, 3.382663, 1, 1, 1, 1, 1,
0.3385458, -0.7165235, 2.294041, 1, 1, 1, 1, 1,
0.3405994, 0.4513309, -0.6481562, 1, 1, 1, 1, 1,
0.3412175, -0.4122993, 1.151971, 1, 1, 1, 1, 1,
0.3440409, 0.4983293, 1.344846, 1, 1, 1, 1, 1,
0.3479488, -2.033094, 2.594053, 1, 1, 1, 1, 1,
0.3494629, -1.33264, 1.587256, 1, 1, 1, 1, 1,
0.3506007, 0.2532232, 2.229497, 1, 1, 1, 1, 1,
0.3506736, -1.036003, 2.174709, 1, 1, 1, 1, 1,
0.3536988, -0.6033401, 1.449167, 1, 1, 1, 1, 1,
0.3554759, 1.455763, 1.328304, 1, 1, 1, 1, 1,
0.3576637, 1.899006, 1.074373, 0, 0, 1, 1, 1,
0.3623345, 0.3264681, -1.414989, 1, 0, 0, 1, 1,
0.366326, 0.7388482, 0.8626578, 1, 0, 0, 1, 1,
0.3752989, -0.8116142, 3.479, 1, 0, 0, 1, 1,
0.3768713, 0.5464346, 0.1053063, 1, 0, 0, 1, 1,
0.3769204, -1.642292, 4.132484, 1, 0, 0, 1, 1,
0.3781392, -0.09485333, 2.732116, 0, 0, 0, 1, 1,
0.3823694, -1.044421, 2.409075, 0, 0, 0, 1, 1,
0.3845321, -0.7845663, 0.8270404, 0, 0, 0, 1, 1,
0.3845618, -0.5380138, 2.586702, 0, 0, 0, 1, 1,
0.3854655, 0.1570153, 2.419654, 0, 0, 0, 1, 1,
0.3860513, -0.167789, 2.873652, 0, 0, 0, 1, 1,
0.3889298, -0.6191894, 2.319303, 0, 0, 0, 1, 1,
0.3896395, 1.324525, 1.088367, 1, 1, 1, 1, 1,
0.4087835, -0.5057904, 2.18286, 1, 1, 1, 1, 1,
0.4210587, 0.4848169, 2.964666, 1, 1, 1, 1, 1,
0.4239067, -0.5191035, 1.716142, 1, 1, 1, 1, 1,
0.4239404, 0.4063677, 0.708271, 1, 1, 1, 1, 1,
0.430638, 0.924823, 0.7390283, 1, 1, 1, 1, 1,
0.4313111, 1.621753, 1.050866, 1, 1, 1, 1, 1,
0.4357046, -0.8063332, 4.440325, 1, 1, 1, 1, 1,
0.436222, -1.371634, 3.105594, 1, 1, 1, 1, 1,
0.4365285, -1.134993, 0.1904192, 1, 1, 1, 1, 1,
0.4374059, 0.8778421, 1.43821, 1, 1, 1, 1, 1,
0.4386882, -0.4437389, 1.573377, 1, 1, 1, 1, 1,
0.4404641, -0.4576842, 1.852007, 1, 1, 1, 1, 1,
0.4499288, -0.6719506, 3.504513, 1, 1, 1, 1, 1,
0.4523281, -0.328209, 2.410005, 1, 1, 1, 1, 1,
0.4560746, -0.4898663, 1.916627, 0, 0, 1, 1, 1,
0.457114, -1.412577, 1.633843, 1, 0, 0, 1, 1,
0.4591714, 0.393748, 1.274669, 1, 0, 0, 1, 1,
0.4596777, 0.5004795, -0.3239502, 1, 0, 0, 1, 1,
0.4610265, -0.0296238, 3.421229, 1, 0, 0, 1, 1,
0.4618565, -0.1493662, 2.836344, 1, 0, 0, 1, 1,
0.4619463, -0.2634785, 1.781594, 0, 0, 0, 1, 1,
0.462869, -0.6918771, 1.7437, 0, 0, 0, 1, 1,
0.4635813, 0.2489996, 1.470916, 0, 0, 0, 1, 1,
0.4637778, 0.8450664, -0.5605494, 0, 0, 0, 1, 1,
0.4646284, 0.5725572, 2.470362, 0, 0, 0, 1, 1,
0.4669508, -0.423414, 1.36507, 0, 0, 0, 1, 1,
0.4671199, -0.3239689, 2.122489, 0, 0, 0, 1, 1,
0.4695248, -0.8233076, 1.937268, 1, 1, 1, 1, 1,
0.4744626, 1.196658, 0.7745391, 1, 1, 1, 1, 1,
0.4798397, -0.7276459, 1.116461, 1, 1, 1, 1, 1,
0.4806584, 0.05038813, 0.1764544, 1, 1, 1, 1, 1,
0.4846163, 0.5673679, 1.719464, 1, 1, 1, 1, 1,
0.493701, -1.219938, 4.439075, 1, 1, 1, 1, 1,
0.4949439, 0.08160661, 0.6126481, 1, 1, 1, 1, 1,
0.5002875, -1.431006, 3.088879, 1, 1, 1, 1, 1,
0.5037941, -0.5771775, 3.341384, 1, 1, 1, 1, 1,
0.5064636, 1.470846, 1.071794, 1, 1, 1, 1, 1,
0.5143923, 0.2809551, 2.318197, 1, 1, 1, 1, 1,
0.515779, -0.2484255, 2.666561, 1, 1, 1, 1, 1,
0.5198943, -0.9618388, 2.444571, 1, 1, 1, 1, 1,
0.5211378, -1.216447, 3.840431, 1, 1, 1, 1, 1,
0.522967, -0.3487363, 2.747523, 1, 1, 1, 1, 1,
0.5242655, -0.335808, 0.7609478, 0, 0, 1, 1, 1,
0.5249568, -0.183442, 1.548484, 1, 0, 0, 1, 1,
0.526687, -1.077298, 3.887721, 1, 0, 0, 1, 1,
0.5275972, 1.956273, -0.7461868, 1, 0, 0, 1, 1,
0.530892, 1.64657, -0.7074731, 1, 0, 0, 1, 1,
0.5346735, 0.3265467, 2.805194, 1, 0, 0, 1, 1,
0.5366189, -1.550602, 2.776313, 0, 0, 0, 1, 1,
0.5375688, -0.3783494, 3.989949, 0, 0, 0, 1, 1,
0.538342, -1.450927, 2.775413, 0, 0, 0, 1, 1,
0.5403174, 1.216475, -0.5160339, 0, 0, 0, 1, 1,
0.5421251, -1.789821, 3.924323, 0, 0, 0, 1, 1,
0.54259, 0.1201601, 3.218666, 0, 0, 0, 1, 1,
0.5494026, -1.160522, 2.052962, 0, 0, 0, 1, 1,
0.5524545, -0.8136235, 1.613568, 1, 1, 1, 1, 1,
0.5557318, -1.241928, 2.823024, 1, 1, 1, 1, 1,
0.5559486, -0.5263981, 2.701063, 1, 1, 1, 1, 1,
0.5560837, 0.04023985, 1.932657, 1, 1, 1, 1, 1,
0.5627436, 1.155444, -0.911374, 1, 1, 1, 1, 1,
0.5721985, 0.2357771, 1.623809, 1, 1, 1, 1, 1,
0.5732818, 1.630276, -0.6478938, 1, 1, 1, 1, 1,
0.5798486, -0.7028953, 2.524165, 1, 1, 1, 1, 1,
0.5801621, 0.1978573, 2.159272, 1, 1, 1, 1, 1,
0.5828033, -0.3855393, 1.596291, 1, 1, 1, 1, 1,
0.5850469, -0.3268958, 4.414681, 1, 1, 1, 1, 1,
0.5897716, -0.2973643, 1.280916, 1, 1, 1, 1, 1,
0.6025039, 0.7070493, 2.325276, 1, 1, 1, 1, 1,
0.6122463, -0.1662313, 2.783481, 1, 1, 1, 1, 1,
0.61318, 0.969908, -1.337132, 1, 1, 1, 1, 1,
0.6148463, -1.626774, 2.095344, 0, 0, 1, 1, 1,
0.6149566, -0.4933366, 1.026114, 1, 0, 0, 1, 1,
0.6160209, 0.655108, 2.3282, 1, 0, 0, 1, 1,
0.6161283, 1.18969, 2.939696, 1, 0, 0, 1, 1,
0.6186137, -1.214119, 4.426757, 1, 0, 0, 1, 1,
0.6223816, -0.2160517, 1.473475, 1, 0, 0, 1, 1,
0.6224654, -0.04811378, 0.6915084, 0, 0, 0, 1, 1,
0.6244355, -0.04460636, 1.781503, 0, 0, 0, 1, 1,
0.6291265, 0.9414412, 0.1408236, 0, 0, 0, 1, 1,
0.6350642, 0.4018579, -0.2774394, 0, 0, 0, 1, 1,
0.6351309, -0.8543736, 4.243742, 0, 0, 0, 1, 1,
0.6380331, 1.065461, -1.291437, 0, 0, 0, 1, 1,
0.6402079, 0.5033976, 2.225237, 0, 0, 0, 1, 1,
0.6462923, -1.090312, 2.221187, 1, 1, 1, 1, 1,
0.6473111, 0.1617748, 1.475624, 1, 1, 1, 1, 1,
0.656515, -0.08400816, 1.309332, 1, 1, 1, 1, 1,
0.6584197, 0.5722895, 1.601308, 1, 1, 1, 1, 1,
0.6619581, -1.189092, 1.354309, 1, 1, 1, 1, 1,
0.6656653, -0.2954964, 1.399771, 1, 1, 1, 1, 1,
0.6686998, 1.3667, 1.43501, 1, 1, 1, 1, 1,
0.677178, 0.4602754, 0.7309759, 1, 1, 1, 1, 1,
0.6778002, 0.7397557, 1.254522, 1, 1, 1, 1, 1,
0.6807246, 0.3063716, 1.716609, 1, 1, 1, 1, 1,
0.6837102, -0.9138306, 4.862278, 1, 1, 1, 1, 1,
0.6860152, 0.1522448, 1.008183, 1, 1, 1, 1, 1,
0.6864601, 0.104521, 3.352545, 1, 1, 1, 1, 1,
0.6905268, -0.7035658, 4.411642, 1, 1, 1, 1, 1,
0.6944965, -2.360445, 3.821096, 1, 1, 1, 1, 1,
0.696458, -0.8447539, 2.253849, 0, 0, 1, 1, 1,
0.6979886, 0.1901215, 2.596127, 1, 0, 0, 1, 1,
0.6992338, 0.2899251, 0.1361025, 1, 0, 0, 1, 1,
0.7011861, 0.8290607, 0.1455075, 1, 0, 0, 1, 1,
0.70249, -2.488722, 3.261898, 1, 0, 0, 1, 1,
0.7028619, -1.009925, 3.081374, 1, 0, 0, 1, 1,
0.7066359, 1.402226, 1.103372, 0, 0, 0, 1, 1,
0.7149596, 0.4820085, 1.425392, 0, 0, 0, 1, 1,
0.7163402, -0.0005047222, 2.869014, 0, 0, 0, 1, 1,
0.7164665, 1.057244, -0.260522, 0, 0, 0, 1, 1,
0.7188751, -0.9873778, 1.684942, 0, 0, 0, 1, 1,
0.7190688, -1.258704, 2.378638, 0, 0, 0, 1, 1,
0.7221565, -0.2682006, 1.48098, 0, 0, 0, 1, 1,
0.7257854, 0.3892352, 0.8780218, 1, 1, 1, 1, 1,
0.730305, 0.558987, -0.1168915, 1, 1, 1, 1, 1,
0.7335508, -0.8990788, 2.331705, 1, 1, 1, 1, 1,
0.7335835, 0.3651626, -1.60742, 1, 1, 1, 1, 1,
0.7423688, -0.7448875, 2.124983, 1, 1, 1, 1, 1,
0.7444567, 0.7127168, -0.5671666, 1, 1, 1, 1, 1,
0.748309, -1.186606, 2.046953, 1, 1, 1, 1, 1,
0.7504036, -1.523033, 4.007035, 1, 1, 1, 1, 1,
0.7529919, 2.130609, -0.4613972, 1, 1, 1, 1, 1,
0.7534257, 0.2258243, 1.434419, 1, 1, 1, 1, 1,
0.7540916, 0.6173769, 0.7127908, 1, 1, 1, 1, 1,
0.7549145, 0.6033513, -0.6662331, 1, 1, 1, 1, 1,
0.7574276, -0.6487395, 1.719525, 1, 1, 1, 1, 1,
0.7583172, 0.6156029, 1.50939, 1, 1, 1, 1, 1,
0.7591856, 1.769348, 2.162096, 1, 1, 1, 1, 1,
0.7603952, 0.3270405, 0.2646466, 0, 0, 1, 1, 1,
0.762078, -0.04687722, 2.498431, 1, 0, 0, 1, 1,
0.7624839, -0.5479345, 1.216371, 1, 0, 0, 1, 1,
0.7653904, -0.3441294, 0.5724112, 1, 0, 0, 1, 1,
0.7653982, -0.2197929, 0.08309228, 1, 0, 0, 1, 1,
0.766939, -1.369928, 1.438927, 1, 0, 0, 1, 1,
0.7676618, -0.3509524, 1.740064, 0, 0, 0, 1, 1,
0.7698658, 0.121677, 1.950079, 0, 0, 0, 1, 1,
0.7707103, -0.7353023, 3.923319, 0, 0, 0, 1, 1,
0.7753652, -0.9875693, 1.901458, 0, 0, 0, 1, 1,
0.7779361, 0.7835919, 0.8681309, 0, 0, 0, 1, 1,
0.7820846, -0.3552746, 2.125991, 0, 0, 0, 1, 1,
0.7835962, 1.15061, 0.008990761, 0, 0, 0, 1, 1,
0.7925716, -1.537059, 3.172681, 1, 1, 1, 1, 1,
0.7941012, -1.736001, 2.82507, 1, 1, 1, 1, 1,
0.7968453, 3.965641, -1.15581, 1, 1, 1, 1, 1,
0.7981293, -0.3966721, 3.025968, 1, 1, 1, 1, 1,
0.79896, -0.5644606, 2.186315, 1, 1, 1, 1, 1,
0.8051104, -1.247027, 4.117932, 1, 1, 1, 1, 1,
0.8098791, -0.9515079, 1.976771, 1, 1, 1, 1, 1,
0.8112811, 1.037059, -0.8870577, 1, 1, 1, 1, 1,
0.8169665, -0.925377, 1.31645, 1, 1, 1, 1, 1,
0.8191984, 0.7781654, 1.944734, 1, 1, 1, 1, 1,
0.8204229, 0.7789643, 0.9521654, 1, 1, 1, 1, 1,
0.8223371, -0.2575769, 0.7191927, 1, 1, 1, 1, 1,
0.8302677, -0.5905718, 1.646302, 1, 1, 1, 1, 1,
0.8305513, -0.8779532, 2.107984, 1, 1, 1, 1, 1,
0.8349143, -0.8825985, 4.366612, 1, 1, 1, 1, 1,
0.8388737, -0.1886535, 3.406903, 0, 0, 1, 1, 1,
0.8402838, 0.8949736, 2.587761, 1, 0, 0, 1, 1,
0.8403891, -0.6574202, 1.047706, 1, 0, 0, 1, 1,
0.8497219, 0.3749754, -0.643682, 1, 0, 0, 1, 1,
0.8553708, -0.06497436, 1.076423, 1, 0, 0, 1, 1,
0.8612747, -1.435284, 3.471517, 1, 0, 0, 1, 1,
0.8633949, -0.1921471, 0.4708905, 0, 0, 0, 1, 1,
0.8694467, -0.7675816, 0.4793943, 0, 0, 0, 1, 1,
0.8730919, 1.67749, -1.159928, 0, 0, 0, 1, 1,
0.8736794, -0.541914, 1.69623, 0, 0, 0, 1, 1,
0.8744624, 0.8135841, 1.555295, 0, 0, 0, 1, 1,
0.8792251, -0.6785713, 2.617861, 0, 0, 0, 1, 1,
0.8935164, -0.8406521, 1.358142, 0, 0, 0, 1, 1,
0.8975478, -0.3278577, 3.9772, 1, 1, 1, 1, 1,
0.9038578, -1.881184, 1.32951, 1, 1, 1, 1, 1,
0.92101, -1.579712, 1.265328, 1, 1, 1, 1, 1,
0.9285914, -1.149831, 3.637259, 1, 1, 1, 1, 1,
0.9305618, 0.4836778, 0.5207524, 1, 1, 1, 1, 1,
0.9318172, 0.4876875, 1.185992, 1, 1, 1, 1, 1,
0.9352825, 0.01343261, 1.94632, 1, 1, 1, 1, 1,
0.9362435, -0.9049982, 3.824459, 1, 1, 1, 1, 1,
0.9409326, -1.382655, 2.933825, 1, 1, 1, 1, 1,
0.9412679, -0.2106322, 1.856691, 1, 1, 1, 1, 1,
0.9414423, 0.6919951, 2.159418, 1, 1, 1, 1, 1,
0.9505678, -0.4829701, 1.679884, 1, 1, 1, 1, 1,
0.9541003, 0.3794582, -0.563738, 1, 1, 1, 1, 1,
0.9569982, 1.608708, -0.01385423, 1, 1, 1, 1, 1,
0.9578956, 0.1004677, 2.826363, 1, 1, 1, 1, 1,
0.9654256, 0.5320603, 0.1532371, 0, 0, 1, 1, 1,
0.9783417, 1.138382, -0.320989, 1, 0, 0, 1, 1,
0.9786801, 0.1412498, 0.8737445, 1, 0, 0, 1, 1,
0.9814774, -0.6160365, 1.024587, 1, 0, 0, 1, 1,
0.9943569, 0.7480839, 1.142906, 1, 0, 0, 1, 1,
1.000026, -0.3681267, 2.13949, 1, 0, 0, 1, 1,
1.004553, -1.101996, 2.613187, 0, 0, 0, 1, 1,
1.016282, -0.3896859, 2.7696, 0, 0, 0, 1, 1,
1.029913, -0.3357047, 1.193321, 0, 0, 0, 1, 1,
1.031515, -0.09353933, 1.925325, 0, 0, 0, 1, 1,
1.032765, 0.6267959, -0.2174715, 0, 0, 0, 1, 1,
1.034358, -1.065333, 1.055269, 0, 0, 0, 1, 1,
1.036298, 0.6726667, 1.045714, 0, 0, 0, 1, 1,
1.049674, 1.265023, 2.076279, 1, 1, 1, 1, 1,
1.052732, 1.185006, 0.554916, 1, 1, 1, 1, 1,
1.065228, 0.6820107, 0.6877847, 1, 1, 1, 1, 1,
1.065289, -1.992604, 3.13388, 1, 1, 1, 1, 1,
1.068965, -0.9606354, 2.523947, 1, 1, 1, 1, 1,
1.073619, -1.478503, 1.107727, 1, 1, 1, 1, 1,
1.074038, 1.58414, 1.268026, 1, 1, 1, 1, 1,
1.084757, 1.063828, -0.7173734, 1, 1, 1, 1, 1,
1.086988, -0.439005, 1.855598, 1, 1, 1, 1, 1,
1.090358, 1.311873, 0.1913848, 1, 1, 1, 1, 1,
1.090855, -1.109768, 3.159645, 1, 1, 1, 1, 1,
1.092696, -0.3970743, 2.912305, 1, 1, 1, 1, 1,
1.098233, -0.1523327, 1.656906, 1, 1, 1, 1, 1,
1.102857, -0.4956987, 3.159911, 1, 1, 1, 1, 1,
1.106001, 0.2947197, 1.634994, 1, 1, 1, 1, 1,
1.108274, 0.9890709, -0.2715981, 0, 0, 1, 1, 1,
1.111923, 0.6791903, 1.682703, 1, 0, 0, 1, 1,
1.115837, 1.118039, 0.785121, 1, 0, 0, 1, 1,
1.125164, 0.002887353, 1.022752, 1, 0, 0, 1, 1,
1.127545, -0.4683948, 2.445168, 1, 0, 0, 1, 1,
1.130984, 0.7798926, -0.3567207, 1, 0, 0, 1, 1,
1.144594, 0.1358049, 0.8125283, 0, 0, 0, 1, 1,
1.145504, -0.9805527, 1.62651, 0, 0, 0, 1, 1,
1.154328, 0.4095825, 0.824378, 0, 0, 0, 1, 1,
1.158863, 0.3875034, -0.7813653, 0, 0, 0, 1, 1,
1.160408, 0.7345674, 0.4930039, 0, 0, 0, 1, 1,
1.161433, 1.167062, -1.132336, 0, 0, 0, 1, 1,
1.169449, 0.3138501, 2.998567, 0, 0, 0, 1, 1,
1.170415, 0.9661146, 2.81592, 1, 1, 1, 1, 1,
1.179026, -1.738713, 2.811543, 1, 1, 1, 1, 1,
1.181909, 0.3063058, 0.5928347, 1, 1, 1, 1, 1,
1.183696, -0.129224, 2.846986, 1, 1, 1, 1, 1,
1.185797, -2.166504, 1.640643, 1, 1, 1, 1, 1,
1.1894, 0.7735645, 2.882071, 1, 1, 1, 1, 1,
1.193023, 0.590598, 1.987249, 1, 1, 1, 1, 1,
1.194661, -0.8644233, 0.4726108, 1, 1, 1, 1, 1,
1.197655, -0.7069814, 0.5844926, 1, 1, 1, 1, 1,
1.19789, 1.282779, 1.397575, 1, 1, 1, 1, 1,
1.203628, 0.4584976, -0.5790945, 1, 1, 1, 1, 1,
1.210094, 0.1921739, 1.180147, 1, 1, 1, 1, 1,
1.216766, -0.2833315, 2.634683, 1, 1, 1, 1, 1,
1.218126, 0.3847418, 0.4103489, 1, 1, 1, 1, 1,
1.2226, 1.004453, -0.4696466, 1, 1, 1, 1, 1,
1.23324, -0.5611576, 0.8588881, 0, 0, 1, 1, 1,
1.24373, -0.9580436, 4.022612, 1, 0, 0, 1, 1,
1.248162, -0.6491866, 1.078913, 1, 0, 0, 1, 1,
1.25019, -1.494207, 1.811467, 1, 0, 0, 1, 1,
1.255468, 1.298729, 1.318334, 1, 0, 0, 1, 1,
1.258341, 0.08414247, -0.03597208, 1, 0, 0, 1, 1,
1.270967, 2.207955, -1.028025, 0, 0, 0, 1, 1,
1.275311, -0.5903212, 2.033355, 0, 0, 0, 1, 1,
1.279519, 1.306228, 0.1334333, 0, 0, 0, 1, 1,
1.284865, 0.1626852, 0.6889304, 0, 0, 0, 1, 1,
1.285147, -1.51794, 2.702304, 0, 0, 0, 1, 1,
1.295025, 0.02852053, 1.651037, 0, 0, 0, 1, 1,
1.311494, -0.06016289, 1.405293, 0, 0, 0, 1, 1,
1.331739, 0.213326, 1.225213, 1, 1, 1, 1, 1,
1.333927, -1.208191, 1.90319, 1, 1, 1, 1, 1,
1.349828, 0.1932677, 1.34287, 1, 1, 1, 1, 1,
1.349896, 0.1388712, 1.953117, 1, 1, 1, 1, 1,
1.351166, -1.069172, 3.598347, 1, 1, 1, 1, 1,
1.358399, 0.1746063, 1.160035, 1, 1, 1, 1, 1,
1.360322, -0.7785207, 2.501122, 1, 1, 1, 1, 1,
1.367865, -0.1413419, -0.04013646, 1, 1, 1, 1, 1,
1.377647, -2.297414, 4.367675, 1, 1, 1, 1, 1,
1.386493, -0.336563, 3.663502, 1, 1, 1, 1, 1,
1.40819, 0.4033606, 2.172948, 1, 1, 1, 1, 1,
1.428807, -0.2484763, -0.1708986, 1, 1, 1, 1, 1,
1.435927, 0.7363355, 0.1845497, 1, 1, 1, 1, 1,
1.448571, -1.291903, 4.091156, 1, 1, 1, 1, 1,
1.461352, 0.2024948, 1.126864, 1, 1, 1, 1, 1,
1.471854, -1.712987, 1.888236, 0, 0, 1, 1, 1,
1.473523, 0.6517279, 0.08572928, 1, 0, 0, 1, 1,
1.479128, 0.1902279, 2.461775, 1, 0, 0, 1, 1,
1.485092, -0.01949927, 1.369635, 1, 0, 0, 1, 1,
1.487031, -0.7237879, 1.184394, 1, 0, 0, 1, 1,
1.495891, -1.267557, 1.179541, 1, 0, 0, 1, 1,
1.508278, 0.06101952, 1.25675, 0, 0, 0, 1, 1,
1.512531, -0.186049, 1.452899, 0, 0, 0, 1, 1,
1.513591, -0.1003352, 1.701365, 0, 0, 0, 1, 1,
1.523044, 1.217131, 0.6703241, 0, 0, 0, 1, 1,
1.532715, 0.491829, 3.443743, 0, 0, 0, 1, 1,
1.538577, 1.872972, 0.6208398, 0, 0, 0, 1, 1,
1.539138, -0.7030287, 1.259204, 0, 0, 0, 1, 1,
1.542367, -1.565851, 3.568564, 1, 1, 1, 1, 1,
1.546092, 2.442734, 3.789221, 1, 1, 1, 1, 1,
1.564, -1.224507, 4.182051, 1, 1, 1, 1, 1,
1.565239, -0.8238306, 2.995042, 1, 1, 1, 1, 1,
1.566442, -1.207298, 1.007978, 1, 1, 1, 1, 1,
1.569317, -0.3625301, 1.844017, 1, 1, 1, 1, 1,
1.571364, -0.09481466, 1.666115, 1, 1, 1, 1, 1,
1.571787, 0.4001167, 0.583344, 1, 1, 1, 1, 1,
1.572477, 0.7076771, 0.5156075, 1, 1, 1, 1, 1,
1.5955, 1.989951, 0.6499736, 1, 1, 1, 1, 1,
1.599855, 0.7549755, 0.9737561, 1, 1, 1, 1, 1,
1.623219, 1.175887, 3.905697, 1, 1, 1, 1, 1,
1.639385, 0.723667, 0.6400189, 1, 1, 1, 1, 1,
1.64957, 0.1876452, 0.8012386, 1, 1, 1, 1, 1,
1.682238, -0.7840455, 3.025904, 1, 1, 1, 1, 1,
1.693277, -1.815386, 3.126528, 0, 0, 1, 1, 1,
1.694141, -0.8204952, 2.476409, 1, 0, 0, 1, 1,
1.702283, -0.8404513, 1.865324, 1, 0, 0, 1, 1,
1.704838, 0.07115103, 1.198003, 1, 0, 0, 1, 1,
1.712562, -0.6333331, 1.217405, 1, 0, 0, 1, 1,
1.71698, 0.0641904, 0.9990051, 1, 0, 0, 1, 1,
1.738181, -0.4962203, 2.836303, 0, 0, 0, 1, 1,
1.745217, -1.810876, 2.737144, 0, 0, 0, 1, 1,
1.77876, 1.267384, 1.364646, 0, 0, 0, 1, 1,
1.779754, -0.4251253, 2.447392, 0, 0, 0, 1, 1,
1.788073, 1.223547, 0.1676472, 0, 0, 0, 1, 1,
1.808748, 0.3455322, 1.612955, 0, 0, 0, 1, 1,
1.80957, -0.5833347, 1.864038, 0, 0, 0, 1, 1,
1.829623, -2.229849, 1.753961, 1, 1, 1, 1, 1,
1.843423, -0.2914188, 1.939718, 1, 1, 1, 1, 1,
1.851399, -0.6570206, 2.074178, 1, 1, 1, 1, 1,
1.861951, 0.05785984, 1.930436, 1, 1, 1, 1, 1,
1.914139, 0.01145233, 3.007119, 1, 1, 1, 1, 1,
1.927311, 1.311297, 1.02832, 1, 1, 1, 1, 1,
1.948067, 0.4812259, 0.6825952, 1, 1, 1, 1, 1,
1.957379, 0.1158937, 1.660637, 1, 1, 1, 1, 1,
1.966883, -0.6939834, 1.438217, 1, 1, 1, 1, 1,
1.968841, 0.01880491, 0.6926773, 1, 1, 1, 1, 1,
1.975976, -0.9753485, 2.706677, 1, 1, 1, 1, 1,
1.980004, -0.3443048, 1.338467, 1, 1, 1, 1, 1,
1.980238, -2.251075, 1.726153, 1, 1, 1, 1, 1,
1.980648, 0.923556, -1.309097, 1, 1, 1, 1, 1,
1.985894, -2.115567, 4.507184, 1, 1, 1, 1, 1,
2.046129, 1.070343, 2.043375, 0, 0, 1, 1, 1,
2.062021, -0.8965931, 2.369604, 1, 0, 0, 1, 1,
2.066679, 0.06497715, 1.59834, 1, 0, 0, 1, 1,
2.088138, -0.3515882, 1.150501, 1, 0, 0, 1, 1,
2.117877, -0.5956098, 0.4493526, 1, 0, 0, 1, 1,
2.175993, -0.7190874, 3.081826, 1, 0, 0, 1, 1,
2.243882, 1.560782, 1.495062, 0, 0, 0, 1, 1,
2.265894, -1.222634, 2.285928, 0, 0, 0, 1, 1,
2.30292, -0.8587121, 2.043565, 0, 0, 0, 1, 1,
2.317105, 0.6543375, 2.540763, 0, 0, 0, 1, 1,
2.327689, -0.3351246, 1.059238, 0, 0, 0, 1, 1,
2.360803, -0.550923, 0.5190479, 0, 0, 0, 1, 1,
2.457965, 0.600265, 0.5334188, 0, 0, 0, 1, 1,
2.528451, -0.4709752, 0.5497302, 1, 1, 1, 1, 1,
2.538086, -0.9853187, 2.266054, 1, 1, 1, 1, 1,
2.609822, 0.08512703, 0.8901747, 1, 1, 1, 1, 1,
2.660517, 0.4316458, 1.809385, 1, 1, 1, 1, 1,
2.687232, 0.9980026, -0.9387097, 1, 1, 1, 1, 1,
2.807436, 1.930148, 0.7834841, 1, 1, 1, 1, 1,
3.014603, 0.8194881, 2.863445, 1, 1, 1, 1, 1
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
var radius = 9.827627;
var distance = 34.51912;
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
mvMatrix.translate( 0.1792879, -0.134464, 0.02432537 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.51912);
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