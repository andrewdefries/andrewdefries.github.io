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
-3.137387, 0.0952706, -0.2901637, 1, 0, 0, 1,
-2.781126, -0.7652084, -1.946626, 1, 0.007843138, 0, 1,
-2.769199, -0.1330112, -2.04887, 1, 0.01176471, 0, 1,
-2.668616, 0.9604283, -1.24698, 1, 0.01960784, 0, 1,
-2.634134, 0.7806606, -2.12742, 1, 0.02352941, 0, 1,
-2.610532, -0.796665, -2.054694, 1, 0.03137255, 0, 1,
-2.536168, 1.501934, -0.3188973, 1, 0.03529412, 0, 1,
-2.450952, -0.7297254, -1.445622, 1, 0.04313726, 0, 1,
-2.387087, 0.8909472, -1.792735, 1, 0.04705882, 0, 1,
-2.386929, 0.7222459, -1.446614, 1, 0.05490196, 0, 1,
-2.333057, -1.940615, -3.291009, 1, 0.05882353, 0, 1,
-2.327893, 0.4185121, -1.348165, 1, 0.06666667, 0, 1,
-2.286915, 1.450569, 0.1942507, 1, 0.07058824, 0, 1,
-2.231943, 1.999703, -1.433656, 1, 0.07843138, 0, 1,
-2.194293, 0.5208768, 0.7857018, 1, 0.08235294, 0, 1,
-2.151946, -0.9522474, -1.638446, 1, 0.09019608, 0, 1,
-2.141964, -0.2449314, -1.10503, 1, 0.09411765, 0, 1,
-2.121888, 0.9961751, -0.34972, 1, 0.1019608, 0, 1,
-2.087906, 0.2286869, 0.3706436, 1, 0.1098039, 0, 1,
-2.07775, -0.2653725, -1.977102, 1, 0.1137255, 0, 1,
-2.055321, -0.1116295, -0.3012736, 1, 0.1215686, 0, 1,
-2.052176, 1.911941, -1.136748, 1, 0.1254902, 0, 1,
-2.043197, -0.2132741, -1.267259, 1, 0.1333333, 0, 1,
-2.035474, 0.1801585, -1.144122, 1, 0.1372549, 0, 1,
-1.972737, -0.6512483, -0.8165133, 1, 0.145098, 0, 1,
-1.955971, 0.9230861, -1.238608, 1, 0.1490196, 0, 1,
-1.940779, -0.5665566, 1.286381, 1, 0.1568628, 0, 1,
-1.934947, 0.09842509, -2.112161, 1, 0.1607843, 0, 1,
-1.927475, -1.418513, -2.105559, 1, 0.1686275, 0, 1,
-1.92541, 1.387975, -0.5645796, 1, 0.172549, 0, 1,
-1.922735, -0.577479, -2.400793, 1, 0.1803922, 0, 1,
-1.903945, 0.694757, -2.574447, 1, 0.1843137, 0, 1,
-1.900454, -0.3664659, -2.639494, 1, 0.1921569, 0, 1,
-1.895825, -0.5994911, -2.380155, 1, 0.1960784, 0, 1,
-1.887366, -1.532797, -0.8549024, 1, 0.2039216, 0, 1,
-1.884851, 0.4237946, -0.2064674, 1, 0.2117647, 0, 1,
-1.865041, 2.469741, -1.725974, 1, 0.2156863, 0, 1,
-1.84851, -0.599116, -2.380457, 1, 0.2235294, 0, 1,
-1.845356, -0.1019704, -2.259008, 1, 0.227451, 0, 1,
-1.838917, 1.488411, -1.294077, 1, 0.2352941, 0, 1,
-1.836478, -0.7851942, -1.284384, 1, 0.2392157, 0, 1,
-1.812987, 1.427277, 0.06551862, 1, 0.2470588, 0, 1,
-1.808181, 0.2754336, -2.251594, 1, 0.2509804, 0, 1,
-1.797041, 0.1814769, -0.533626, 1, 0.2588235, 0, 1,
-1.781353, -0.2597742, -3.130913, 1, 0.2627451, 0, 1,
-1.778685, 1.399384, -2.127252, 1, 0.2705882, 0, 1,
-1.778496, -0.1781367, -0.8647698, 1, 0.2745098, 0, 1,
-1.770538, 0.6600764, -0.1280928, 1, 0.282353, 0, 1,
-1.748248, 0.6388854, -1.880223, 1, 0.2862745, 0, 1,
-1.743696, 0.8715721, -1.951628, 1, 0.2941177, 0, 1,
-1.719574, 1.507589, 0.4063868, 1, 0.3019608, 0, 1,
-1.717933, -0.3961651, -0.5542309, 1, 0.3058824, 0, 1,
-1.709643, -0.2035431, 0.03967577, 1, 0.3137255, 0, 1,
-1.70513, -0.1047741, -2.04789, 1, 0.3176471, 0, 1,
-1.701849, -1.55961, -2.114286, 1, 0.3254902, 0, 1,
-1.701658, 0.6194274, 0.5091412, 1, 0.3294118, 0, 1,
-1.695618, 0.4406733, -1.191857, 1, 0.3372549, 0, 1,
-1.689336, -0.3428681, -2.282771, 1, 0.3411765, 0, 1,
-1.686503, 0.8278441, -0.5324798, 1, 0.3490196, 0, 1,
-1.67936, 0.2400545, -2.701802, 1, 0.3529412, 0, 1,
-1.677281, -0.01312598, -2.122259, 1, 0.3607843, 0, 1,
-1.675002, 0.1171023, -2.70217, 1, 0.3647059, 0, 1,
-1.67135, -1.706615, -3.176132, 1, 0.372549, 0, 1,
-1.665349, -0.6588959, -2.080027, 1, 0.3764706, 0, 1,
-1.658095, -1.38137, -1.217931, 1, 0.3843137, 0, 1,
-1.654525, 0.8461813, 0.4946915, 1, 0.3882353, 0, 1,
-1.651069, -1.865496, 0.2006212, 1, 0.3960784, 0, 1,
-1.636689, 0.07220747, -1.682832, 1, 0.4039216, 0, 1,
-1.625381, 1.462628, -2.308136, 1, 0.4078431, 0, 1,
-1.611924, 0.1960946, -2.550244, 1, 0.4156863, 0, 1,
-1.607408, -1.449288, -0.7210933, 1, 0.4196078, 0, 1,
-1.60632, 0.1815264, -2.140804, 1, 0.427451, 0, 1,
-1.605202, 1.426732, -0.5752201, 1, 0.4313726, 0, 1,
-1.604012, 0.05901353, -1.196013, 1, 0.4392157, 0, 1,
-1.599861, -0.9940166, -3.799947, 1, 0.4431373, 0, 1,
-1.597099, 0.4975199, -0.6813455, 1, 0.4509804, 0, 1,
-1.593338, -0.7321485, -0.9102077, 1, 0.454902, 0, 1,
-1.577594, -0.352918, -2.530312, 1, 0.4627451, 0, 1,
-1.573201, -1.233776, -4.007304, 1, 0.4666667, 0, 1,
-1.570551, 0.365232, -0.4829816, 1, 0.4745098, 0, 1,
-1.565558, 0.3382435, -2.40833, 1, 0.4784314, 0, 1,
-1.542702, 1.063433, -1.315218, 1, 0.4862745, 0, 1,
-1.529592, -0.7635624, -0.2590557, 1, 0.4901961, 0, 1,
-1.51453, -0.3880088, -0.6793362, 1, 0.4980392, 0, 1,
-1.484666, 1.167387, -1.091741, 1, 0.5058824, 0, 1,
-1.480416, -0.5592033, -2.250648, 1, 0.509804, 0, 1,
-1.460339, -1.371301, -1.264151, 1, 0.5176471, 0, 1,
-1.457252, -1.700661, -3.214613, 1, 0.5215687, 0, 1,
-1.454314, 2.165809, -0.2728912, 1, 0.5294118, 0, 1,
-1.451978, -1.334803, -1.440083, 1, 0.5333334, 0, 1,
-1.442558, 0.323815, -0.9685131, 1, 0.5411765, 0, 1,
-1.42745, 0.5437978, 0.1105205, 1, 0.5450981, 0, 1,
-1.418523, 0.2730384, -1.948842, 1, 0.5529412, 0, 1,
-1.417538, -0.9031765, -2.597487, 1, 0.5568628, 0, 1,
-1.406825, 0.5071889, -2.152626, 1, 0.5647059, 0, 1,
-1.405641, 0.605911, -0.4520615, 1, 0.5686275, 0, 1,
-1.40224, 0.9374541, 0.1850869, 1, 0.5764706, 0, 1,
-1.396927, -1.109866, -2.432453, 1, 0.5803922, 0, 1,
-1.374583, 1.533469, 0.501798, 1, 0.5882353, 0, 1,
-1.364846, -1.254694, -1.325927, 1, 0.5921569, 0, 1,
-1.361344, 0.8931212, -1.552392, 1, 0.6, 0, 1,
-1.355299, 1.041701, -2.133451, 1, 0.6078432, 0, 1,
-1.351727, -0.6280789, -3.226594, 1, 0.6117647, 0, 1,
-1.349212, -0.5317477, -1.545275, 1, 0.6196079, 0, 1,
-1.349185, -1.817701, -3.371564, 1, 0.6235294, 0, 1,
-1.347594, 0.7740564, -1.457294, 1, 0.6313726, 0, 1,
-1.343806, 0.8317181, -0.7451479, 1, 0.6352941, 0, 1,
-1.342408, 0.9960087, 0.3464767, 1, 0.6431373, 0, 1,
-1.339435, 2.051202, -0.8125785, 1, 0.6470588, 0, 1,
-1.339013, -0.3471381, -3.839242, 1, 0.654902, 0, 1,
-1.336829, -0.2286082, -1.327302, 1, 0.6588235, 0, 1,
-1.334759, -1.460658, -3.71325, 1, 0.6666667, 0, 1,
-1.332553, -1.60819, -3.907272, 1, 0.6705883, 0, 1,
-1.329097, 0.4158108, -1.07784, 1, 0.6784314, 0, 1,
-1.321808, -0.2462925, -1.27468, 1, 0.682353, 0, 1,
-1.316929, 0.0685446, -2.774199, 1, 0.6901961, 0, 1,
-1.307698, -2.078049, -2.518518, 1, 0.6941177, 0, 1,
-1.306467, 0.3380807, 0.4808601, 1, 0.7019608, 0, 1,
-1.305263, 0.5305662, -0.1547983, 1, 0.7098039, 0, 1,
-1.293448, -0.05011613, -1.842492, 1, 0.7137255, 0, 1,
-1.290854, 0.8864321, -0.5941201, 1, 0.7215686, 0, 1,
-1.290163, -0.467634, -1.637979, 1, 0.7254902, 0, 1,
-1.285664, 0.1004687, -1.275352, 1, 0.7333333, 0, 1,
-1.279409, 0.8975432, -0.9111226, 1, 0.7372549, 0, 1,
-1.272449, -0.06410306, -0.4963492, 1, 0.7450981, 0, 1,
-1.267898, -1.330848, -2.902658, 1, 0.7490196, 0, 1,
-1.264768, -1.068439, -3.730991, 1, 0.7568628, 0, 1,
-1.25157, -0.03528129, -0.5034946, 1, 0.7607843, 0, 1,
-1.249813, 3.646263, -0.3118016, 1, 0.7686275, 0, 1,
-1.246197, 1.350775, -1.777012, 1, 0.772549, 0, 1,
-1.241891, 0.6166099, -0.5608081, 1, 0.7803922, 0, 1,
-1.236011, -0.6855099, -3.620302, 1, 0.7843137, 0, 1,
-1.222186, 0.1680176, 0.1630162, 1, 0.7921569, 0, 1,
-1.219663, -0.8835571, -3.798077, 1, 0.7960784, 0, 1,
-1.217674, 1.950844, 0.07854143, 1, 0.8039216, 0, 1,
-1.212789, 0.626535, -2.091507, 1, 0.8117647, 0, 1,
-1.212632, 0.2811931, -2.079021, 1, 0.8156863, 0, 1,
-1.207659, -0.2657505, -1.396492, 1, 0.8235294, 0, 1,
-1.197802, -1.679605, -2.820311, 1, 0.827451, 0, 1,
-1.195136, 0.5113494, -2.362135, 1, 0.8352941, 0, 1,
-1.192765, -0.4938132, -3.045756, 1, 0.8392157, 0, 1,
-1.189633, -0.7518277, -4.115225, 1, 0.8470588, 0, 1,
-1.187059, -0.4143047, -2.893307, 1, 0.8509804, 0, 1,
-1.186754, -0.2494071, -1.861346, 1, 0.8588235, 0, 1,
-1.183988, 0.5080958, -2.461165, 1, 0.8627451, 0, 1,
-1.176312, 0.6339169, -1.804264, 1, 0.8705882, 0, 1,
-1.170706, 0.004506226, -0.7871696, 1, 0.8745098, 0, 1,
-1.170505, 0.9640524, -0.3652475, 1, 0.8823529, 0, 1,
-1.16956, 1.122016, -0.05845388, 1, 0.8862745, 0, 1,
-1.153152, 0.05801334, -3.218045, 1, 0.8941177, 0, 1,
-1.152232, -0.7416223, -0.4321949, 1, 0.8980392, 0, 1,
-1.152147, 0.1726892, -2.806633, 1, 0.9058824, 0, 1,
-1.151943, 0.6301476, -1.856425, 1, 0.9137255, 0, 1,
-1.145391, -1.116181, -2.321702, 1, 0.9176471, 0, 1,
-1.138021, -1.520702, -1.442617, 1, 0.9254902, 0, 1,
-1.108708, 1.444057, -0.3011085, 1, 0.9294118, 0, 1,
-1.108427, -0.04576423, -1.604569, 1, 0.9372549, 0, 1,
-1.102818, -1.208735, -1.559399, 1, 0.9411765, 0, 1,
-1.0937, -0.08920301, -2.687827, 1, 0.9490196, 0, 1,
-1.089939, -1.861695, -2.733473, 1, 0.9529412, 0, 1,
-1.088676, -0.3031078, -1.705989, 1, 0.9607843, 0, 1,
-1.088529, -0.9879196, -2.259443, 1, 0.9647059, 0, 1,
-1.084565, -0.4016523, -1.688574, 1, 0.972549, 0, 1,
-1.082062, 1.275221, -0.4992429, 1, 0.9764706, 0, 1,
-1.080439, -0.4298869, -3.091048, 1, 0.9843137, 0, 1,
-1.077003, -0.2902636, -1.044362, 1, 0.9882353, 0, 1,
-1.071094, 1.743623, -3.184556, 1, 0.9960784, 0, 1,
-1.067189, -0.257463, -1.448329, 0.9960784, 1, 0, 1,
-1.061128, -0.2561487, -1.048087, 0.9921569, 1, 0, 1,
-1.060225, -0.08397518, -1.190398, 0.9843137, 1, 0, 1,
-1.05931, 0.5842084, 0.4225512, 0.9803922, 1, 0, 1,
-1.057956, -1.560136, -2.388124, 0.972549, 1, 0, 1,
-1.055083, 1.727036, -1.288598, 0.9686275, 1, 0, 1,
-1.04581, 0.08939862, -1.352402, 0.9607843, 1, 0, 1,
-1.038067, 0.5854976, -0.8761573, 0.9568627, 1, 0, 1,
-1.028797, -1.022735, -2.682253, 0.9490196, 1, 0, 1,
-1.028303, -0.1739094, -3.21987, 0.945098, 1, 0, 1,
-1.028085, -0.129449, -0.1910788, 0.9372549, 1, 0, 1,
-1.027579, -0.7020226, -2.139149, 0.9333333, 1, 0, 1,
-1.01936, -1.913373, -2.295919, 0.9254902, 1, 0, 1,
-1.014601, -0.8804413, -3.075266, 0.9215686, 1, 0, 1,
-1.014017, -0.3924393, -1.596419, 0.9137255, 1, 0, 1,
-1.007042, -0.5018111, -2.13667, 0.9098039, 1, 0, 1,
-1.007015, 0.7684903, -0.530347, 0.9019608, 1, 0, 1,
-1.005392, 1.530287, -1.001614, 0.8941177, 1, 0, 1,
-1.004641, 0.2884474, -2.104214, 0.8901961, 1, 0, 1,
-1.001373, 0.5684929, -0.8681884, 0.8823529, 1, 0, 1,
-0.9965444, 0.1139471, -1.819723, 0.8784314, 1, 0, 1,
-0.9913244, 0.3637199, -1.248835, 0.8705882, 1, 0, 1,
-0.985041, 0.8348382, 1.441787, 0.8666667, 1, 0, 1,
-0.9803327, -0.7116253, -1.390718, 0.8588235, 1, 0, 1,
-0.9736974, 0.2485356, -0.7665299, 0.854902, 1, 0, 1,
-0.9706538, 0.1196162, -1.424823, 0.8470588, 1, 0, 1,
-0.9701483, -0.9694492, -2.248631, 0.8431373, 1, 0, 1,
-0.9644348, 0.09376021, -0.720587, 0.8352941, 1, 0, 1,
-0.9547123, 0.8987334, -2.276824, 0.8313726, 1, 0, 1,
-0.9515487, 1.472063, -1.899765, 0.8235294, 1, 0, 1,
-0.9475715, -0.6746051, -1.758874, 0.8196079, 1, 0, 1,
-0.9422615, -0.09767441, -1.642824, 0.8117647, 1, 0, 1,
-0.9374701, -1.158808, -0.3345831, 0.8078431, 1, 0, 1,
-0.9322497, -0.775919, -2.147624, 0.8, 1, 0, 1,
-0.9312496, 0.9219404, 0.6090862, 0.7921569, 1, 0, 1,
-0.9276049, 0.3431532, -1.544187, 0.7882353, 1, 0, 1,
-0.922264, 0.4437837, -0.5795879, 0.7803922, 1, 0, 1,
-0.9133155, 0.04635645, -2.46961, 0.7764706, 1, 0, 1,
-0.9130423, 0.3622885, -0.7393375, 0.7686275, 1, 0, 1,
-0.9038675, -0.3517818, -2.063897, 0.7647059, 1, 0, 1,
-0.902339, 0.3354356, -0.8766665, 0.7568628, 1, 0, 1,
-0.8851926, 0.9083226, -0.3647567, 0.7529412, 1, 0, 1,
-0.8821102, 1.046399, -1.536954, 0.7450981, 1, 0, 1,
-0.8795246, 0.04291216, -1.844993, 0.7411765, 1, 0, 1,
-0.8706343, -0.47339, -2.048046, 0.7333333, 1, 0, 1,
-0.8684286, 0.1371962, -1.784376, 0.7294118, 1, 0, 1,
-0.8653449, -0.2648726, -1.51246, 0.7215686, 1, 0, 1,
-0.8624036, 2.192409, -2.978851, 0.7176471, 1, 0, 1,
-0.8592, -0.02514373, -1.990609, 0.7098039, 1, 0, 1,
-0.857718, 1.434686, -0.8328393, 0.7058824, 1, 0, 1,
-0.8431013, 2.151995, 2.403844, 0.6980392, 1, 0, 1,
-0.8422303, -0.3555785, -2.040486, 0.6901961, 1, 0, 1,
-0.8418407, -0.2580018, -2.910662, 0.6862745, 1, 0, 1,
-0.8416136, 0.91288, -0.4093535, 0.6784314, 1, 0, 1,
-0.8301466, 0.2720587, -2.470059, 0.6745098, 1, 0, 1,
-0.8300642, 0.6005138, -0.8928476, 0.6666667, 1, 0, 1,
-0.8290648, 1.564474, -2.379102, 0.6627451, 1, 0, 1,
-0.828796, 0.7643874, -2.45004, 0.654902, 1, 0, 1,
-0.8277712, -0.5777419, -2.212257, 0.6509804, 1, 0, 1,
-0.8262902, -0.3806694, -1.361021, 0.6431373, 1, 0, 1,
-0.8259618, 2.390807, 0.08375419, 0.6392157, 1, 0, 1,
-0.8158111, -0.114396, -2.749464, 0.6313726, 1, 0, 1,
-0.8074573, -1.297552, -2.036139, 0.627451, 1, 0, 1,
-0.7965594, 0.8320671, -1.518655, 0.6196079, 1, 0, 1,
-0.7948067, 0.4224624, -1.364336, 0.6156863, 1, 0, 1,
-0.7893515, -0.7120641, -1.412329, 0.6078432, 1, 0, 1,
-0.7823578, -1.285159, -2.384161, 0.6039216, 1, 0, 1,
-0.7813656, -2.180646, -3.799936, 0.5960785, 1, 0, 1,
-0.7775542, 0.7457248, -2.506735, 0.5882353, 1, 0, 1,
-0.7751039, 0.0422235, -1.872235, 0.5843138, 1, 0, 1,
-0.7699822, 0.7831405, -2.066692, 0.5764706, 1, 0, 1,
-0.7695622, -0.0794881, 0.1285436, 0.572549, 1, 0, 1,
-0.7681819, 0.61215, -3.035633, 0.5647059, 1, 0, 1,
-0.7576345, -0.5638788, -3.413958, 0.5607843, 1, 0, 1,
-0.7567191, -0.8293105, -3.421883, 0.5529412, 1, 0, 1,
-0.7518046, -0.9425229, -2.526526, 0.5490196, 1, 0, 1,
-0.7508857, 1.045887, -1.196966, 0.5411765, 1, 0, 1,
-0.7506046, 0.3094643, -1.932171, 0.5372549, 1, 0, 1,
-0.750356, 1.59943, -0.8465198, 0.5294118, 1, 0, 1,
-0.7498405, 0.3109159, 0.05482121, 0.5254902, 1, 0, 1,
-0.7442505, -0.3610131, -2.852747, 0.5176471, 1, 0, 1,
-0.740903, 0.8903747, -0.1099513, 0.5137255, 1, 0, 1,
-0.7295122, 0.2419156, -0.5015942, 0.5058824, 1, 0, 1,
-0.7218978, 0.6107233, -0.7596113, 0.5019608, 1, 0, 1,
-0.7215074, -0.09545301, -2.374686, 0.4941176, 1, 0, 1,
-0.713835, 0.6863377, -0.08732953, 0.4862745, 1, 0, 1,
-0.7071949, -1.438063, -2.509366, 0.4823529, 1, 0, 1,
-0.7061687, -0.8028197, -0.9872348, 0.4745098, 1, 0, 1,
-0.6991629, 1.228335, -0.3892, 0.4705882, 1, 0, 1,
-0.693976, -1.130854, -2.584367, 0.4627451, 1, 0, 1,
-0.6908577, -0.2280743, -2.161223, 0.4588235, 1, 0, 1,
-0.6888877, -0.3151711, -3.352733, 0.4509804, 1, 0, 1,
-0.6854953, -0.9726352, -2.455044, 0.4470588, 1, 0, 1,
-0.6845329, 1.320266, 1.278332, 0.4392157, 1, 0, 1,
-0.6801431, -1.986598, -4.009237, 0.4352941, 1, 0, 1,
-0.6663525, -1.189831, -2.110515, 0.427451, 1, 0, 1,
-0.6649121, 0.801292, 1.089073, 0.4235294, 1, 0, 1,
-0.6621052, 0.884814, 0.6725927, 0.4156863, 1, 0, 1,
-0.659682, 0.3054291, 0.854432, 0.4117647, 1, 0, 1,
-0.659448, 0.1790347, -0.8367832, 0.4039216, 1, 0, 1,
-0.6586585, 0.3817846, -2.684441, 0.3960784, 1, 0, 1,
-0.6479631, -0.6253307, -3.86002, 0.3921569, 1, 0, 1,
-0.6424176, -1.076038, -3.415419, 0.3843137, 1, 0, 1,
-0.6358538, 2.437599, 0.6137645, 0.3803922, 1, 0, 1,
-0.6341367, -0.6017479, -3.79198, 0.372549, 1, 0, 1,
-0.6339563, -0.6123017, -0.9476072, 0.3686275, 1, 0, 1,
-0.6314298, -1.125661, -2.031179, 0.3607843, 1, 0, 1,
-0.619312, -2.273407, -2.088085, 0.3568628, 1, 0, 1,
-0.6153266, 0.0551346, -2.206716, 0.3490196, 1, 0, 1,
-0.6143622, 0.3334211, 0.549612, 0.345098, 1, 0, 1,
-0.608966, -0.3645943, -1.49133, 0.3372549, 1, 0, 1,
-0.6052943, -0.8895693, -3.01673, 0.3333333, 1, 0, 1,
-0.6027648, 1.029198, -1.729064, 0.3254902, 1, 0, 1,
-0.6004239, -0.5770308, -2.751544, 0.3215686, 1, 0, 1,
-0.5993435, -2.274309, -3.482725, 0.3137255, 1, 0, 1,
-0.5944296, 0.3291482, -1.768404, 0.3098039, 1, 0, 1,
-0.5899628, -2.371378, -3.913171, 0.3019608, 1, 0, 1,
-0.5873005, 0.3097141, -1.009303, 0.2941177, 1, 0, 1,
-0.5848275, 0.9292842, 0.6501829, 0.2901961, 1, 0, 1,
-0.5784178, -0.05661031, -2.046174, 0.282353, 1, 0, 1,
-0.5775637, 0.3288489, -0.3411109, 0.2784314, 1, 0, 1,
-0.5712922, 1.02639, -2.018601, 0.2705882, 1, 0, 1,
-0.5668185, 0.06807688, 0.3194762, 0.2666667, 1, 0, 1,
-0.5645988, -0.8792307, -1.727225, 0.2588235, 1, 0, 1,
-0.5627113, -0.1373013, -1.195228, 0.254902, 1, 0, 1,
-0.5615637, -1.766026, -2.425599, 0.2470588, 1, 0, 1,
-0.5608793, -1.277004, -1.530944, 0.2431373, 1, 0, 1,
-0.558942, 0.9270198, 1.691348, 0.2352941, 1, 0, 1,
-0.5572536, 0.5059519, -0.4929658, 0.2313726, 1, 0, 1,
-0.545706, 0.0921897, 0.06058308, 0.2235294, 1, 0, 1,
-0.5442084, 0.7543088, -1.418341, 0.2196078, 1, 0, 1,
-0.5440273, 0.5503972, -1.767322, 0.2117647, 1, 0, 1,
-0.543977, 0.3707623, -0.3771259, 0.2078431, 1, 0, 1,
-0.5400495, 0.5690279, -0.5816435, 0.2, 1, 0, 1,
-0.5368835, 0.5248183, -0.9439838, 0.1921569, 1, 0, 1,
-0.5360798, 0.6811522, 0.3423797, 0.1882353, 1, 0, 1,
-0.5303038, 1.093314, -3.572724, 0.1803922, 1, 0, 1,
-0.5288082, 1.160856, -2.16396, 0.1764706, 1, 0, 1,
-0.5281187, -1.021791, -3.407736, 0.1686275, 1, 0, 1,
-0.526643, 0.9175913, -1.430049, 0.1647059, 1, 0, 1,
-0.5252852, 0.1268489, -1.755566, 0.1568628, 1, 0, 1,
-0.5233529, -0.4272155, -2.846392, 0.1529412, 1, 0, 1,
-0.5195359, 2.290425, -0.5168688, 0.145098, 1, 0, 1,
-0.517234, -0.001515046, -1.494554, 0.1411765, 1, 0, 1,
-0.506629, -1.684965, -4.177233, 0.1333333, 1, 0, 1,
-0.5018917, 0.8398206, 0.1150117, 0.1294118, 1, 0, 1,
-0.5017846, 2.019781, -1.515969, 0.1215686, 1, 0, 1,
-0.4979672, -0.3708166, -3.543865, 0.1176471, 1, 0, 1,
-0.4947768, -0.2932912, -2.539384, 0.1098039, 1, 0, 1,
-0.4928537, -0.6206545, -1.144506, 0.1058824, 1, 0, 1,
-0.4906804, 1.989836, -0.4558025, 0.09803922, 1, 0, 1,
-0.4894908, 0.5090297, -1.23238, 0.09019608, 1, 0, 1,
-0.4887805, -1.56282, -3.796118, 0.08627451, 1, 0, 1,
-0.4885012, 0.2013105, -2.672261, 0.07843138, 1, 0, 1,
-0.4837743, 1.315928, 0.936497, 0.07450981, 1, 0, 1,
-0.4788685, -1.274763, -4.417746, 0.06666667, 1, 0, 1,
-0.4770509, 0.7831714, -0.600614, 0.0627451, 1, 0, 1,
-0.4653096, -1.656752, -4.106148, 0.05490196, 1, 0, 1,
-0.4601933, 0.7943109, -0.2498877, 0.05098039, 1, 0, 1,
-0.4601283, -0.3985491, -3.788542, 0.04313726, 1, 0, 1,
-0.4570512, 2.811841, -0.7242196, 0.03921569, 1, 0, 1,
-0.4537279, 1.30005, 1.831628, 0.03137255, 1, 0, 1,
-0.4526292, 1.128603, -3.09388, 0.02745098, 1, 0, 1,
-0.4476562, 0.1624375, -0.6767041, 0.01960784, 1, 0, 1,
-0.4463666, -0.1223745, -3.105239, 0.01568628, 1, 0, 1,
-0.4459227, -1.50964, -2.389469, 0.007843138, 1, 0, 1,
-0.4444439, 0.06646277, -2.361135, 0.003921569, 1, 0, 1,
-0.4440963, 0.0572263, -0.9571018, 0, 1, 0.003921569, 1,
-0.4433704, 1.964647, -1.321237, 0, 1, 0.01176471, 1,
-0.4403746, -0.3811722, -1.983276, 0, 1, 0.01568628, 1,
-0.4347978, -1.169637, -3.367601, 0, 1, 0.02352941, 1,
-0.434505, 0.02207247, -2.708672, 0, 1, 0.02745098, 1,
-0.4282234, 0.5364856, -0.9749768, 0, 1, 0.03529412, 1,
-0.4189711, -1.547571, -2.178087, 0, 1, 0.03921569, 1,
-0.4058993, 0.8165168, 0.230368, 0, 1, 0.04705882, 1,
-0.4056446, 0.2601767, -1.613986, 0, 1, 0.05098039, 1,
-0.4047377, -0.5315632, -2.730268, 0, 1, 0.05882353, 1,
-0.4024163, 0.8161642, -1.593519, 0, 1, 0.0627451, 1,
-0.3988231, -0.1974306, -1.839889, 0, 1, 0.07058824, 1,
-0.3977685, 0.1996013, -0.8320168, 0, 1, 0.07450981, 1,
-0.3968145, 1.023998, 1.482415, 0, 1, 0.08235294, 1,
-0.3960259, -0.3881373, -3.712597, 0, 1, 0.08627451, 1,
-0.3847336, -0.5013888, -1.972855, 0, 1, 0.09411765, 1,
-0.3810204, -1.513757, -2.361415, 0, 1, 0.1019608, 1,
-0.3783259, 0.9451225, -0.378673, 0, 1, 0.1058824, 1,
-0.3762785, 0.7605088, -1.213334, 0, 1, 0.1137255, 1,
-0.3761967, 0.942945, -0.9419979, 0, 1, 0.1176471, 1,
-0.372451, -0.383065, -2.878278, 0, 1, 0.1254902, 1,
-0.3700432, 0.5800821, -0.3955798, 0, 1, 0.1294118, 1,
-0.3674269, -0.2471666, -0.9486334, 0, 1, 0.1372549, 1,
-0.3633339, -1.157688, -3.201057, 0, 1, 0.1411765, 1,
-0.3602571, -2.07425, -3.353258, 0, 1, 0.1490196, 1,
-0.3539623, -1.339717, -4.004272, 0, 1, 0.1529412, 1,
-0.3516322, 0.4704224, 0.1641923, 0, 1, 0.1607843, 1,
-0.3510936, -0.02501587, -0.6716124, 0, 1, 0.1647059, 1,
-0.3412236, 0.2101815, -0.8023115, 0, 1, 0.172549, 1,
-0.340727, -0.4885229, -3.945467, 0, 1, 0.1764706, 1,
-0.338582, -0.8834337, -3.483479, 0, 1, 0.1843137, 1,
-0.3345174, 0.02522581, -1.914757, 0, 1, 0.1882353, 1,
-0.3324591, 0.01255879, -3.916555, 0, 1, 0.1960784, 1,
-0.3323265, 0.858068, 0.2414403, 0, 1, 0.2039216, 1,
-0.3223705, -0.6894051, -2.48753, 0, 1, 0.2078431, 1,
-0.3187335, 0.4681067, -0.1716389, 0, 1, 0.2156863, 1,
-0.3092246, 0.9274165, 2.605661, 0, 1, 0.2196078, 1,
-0.3044754, -1.851559, -4.232083, 0, 1, 0.227451, 1,
-0.3037533, -0.05717732, -2.870654, 0, 1, 0.2313726, 1,
-0.3005346, -0.4704781, -3.42017, 0, 1, 0.2392157, 1,
-0.2963711, 0.3506822, -0.2002963, 0, 1, 0.2431373, 1,
-0.2942771, 1.567485, -0.6712701, 0, 1, 0.2509804, 1,
-0.2930314, 0.1547075, -1.597112, 0, 1, 0.254902, 1,
-0.2914068, -0.4968399, -2.560257, 0, 1, 0.2627451, 1,
-0.2909765, -0.04059318, 0.05121765, 0, 1, 0.2666667, 1,
-0.2905093, -0.02246455, 0.6687409, 0, 1, 0.2745098, 1,
-0.2885539, 1.017676, 1.057117, 0, 1, 0.2784314, 1,
-0.2875312, 0.4051395, -1.147854, 0, 1, 0.2862745, 1,
-0.2864423, -0.2339143, -2.672307, 0, 1, 0.2901961, 1,
-0.2829694, -0.01970071, -0.5683596, 0, 1, 0.2980392, 1,
-0.2812339, 1.737946, 1.637622, 0, 1, 0.3058824, 1,
-0.2789804, -0.6855553, -1.938822, 0, 1, 0.3098039, 1,
-0.2784502, 0.2156914, 0.03582024, 0, 1, 0.3176471, 1,
-0.2751998, 1.365249, 0.175172, 0, 1, 0.3215686, 1,
-0.2750859, 3.145285, 0.03035945, 0, 1, 0.3294118, 1,
-0.2723896, -0.5706567, -3.42188, 0, 1, 0.3333333, 1,
-0.2648671, 0.9670429, 1.218425, 0, 1, 0.3411765, 1,
-0.2639042, -1.329621, -3.625711, 0, 1, 0.345098, 1,
-0.2631662, -0.2956434, -3.012975, 0, 1, 0.3529412, 1,
-0.2592259, -0.2312016, -3.049668, 0, 1, 0.3568628, 1,
-0.2534028, 0.1235761, -2.194181, 0, 1, 0.3647059, 1,
-0.2511579, -0.3908002, -1.790794, 0, 1, 0.3686275, 1,
-0.2510491, -0.2655229, -2.677343, 0, 1, 0.3764706, 1,
-0.2506315, -0.5558884, -3.345646, 0, 1, 0.3803922, 1,
-0.2469748, -0.389953, -2.948864, 0, 1, 0.3882353, 1,
-0.2379087, 2.414389, 0.7895057, 0, 1, 0.3921569, 1,
-0.2330155, 0.9678627, 1.043247, 0, 1, 0.4, 1,
-0.2325756, -0.2584623, -1.398855, 0, 1, 0.4078431, 1,
-0.229073, -1.187507, -2.550073, 0, 1, 0.4117647, 1,
-0.2279966, 0.3553159, -0.01505883, 0, 1, 0.4196078, 1,
-0.2194055, 0.6651206, -1.212377, 0, 1, 0.4235294, 1,
-0.2188657, -0.6034441, -5.011748, 0, 1, 0.4313726, 1,
-0.2139506, 0.2936626, -0.2205704, 0, 1, 0.4352941, 1,
-0.2122019, -0.195757, -1.817921, 0, 1, 0.4431373, 1,
-0.2097435, 0.1245508, -1.011728, 0, 1, 0.4470588, 1,
-0.2039032, 1.010789, 0.1987782, 0, 1, 0.454902, 1,
-0.2017787, -2.64609, -1.99893, 0, 1, 0.4588235, 1,
-0.2016223, -0.09013856, 0.2938275, 0, 1, 0.4666667, 1,
-0.2002299, 0.3428333, -0.4052267, 0, 1, 0.4705882, 1,
-0.2000487, -0.4261816, -3.800353, 0, 1, 0.4784314, 1,
-0.1975654, -0.6565324, -2.655691, 0, 1, 0.4823529, 1,
-0.1938075, 1.678822, -0.4370438, 0, 1, 0.4901961, 1,
-0.192062, 1.374622, -0.6258352, 0, 1, 0.4941176, 1,
-0.1909538, -0.8387231, -2.290211, 0, 1, 0.5019608, 1,
-0.1876631, -0.1105621, -2.132492, 0, 1, 0.509804, 1,
-0.1853184, -1.310954, -3.125415, 0, 1, 0.5137255, 1,
-0.1834693, -0.471265, -3.723148, 0, 1, 0.5215687, 1,
-0.1812464, 1.506786, -0.2414422, 0, 1, 0.5254902, 1,
-0.1766253, 0.03885156, -0.9815142, 0, 1, 0.5333334, 1,
-0.1658471, -0.6792219, -4.206838, 0, 1, 0.5372549, 1,
-0.1612652, -1.25263, -3.883268, 0, 1, 0.5450981, 1,
-0.1611717, 0.2129702, -0.3979999, 0, 1, 0.5490196, 1,
-0.1581159, 0.08520705, -1.43843, 0, 1, 0.5568628, 1,
-0.1563016, -0.8696148, -1.701271, 0, 1, 0.5607843, 1,
-0.153162, -1.232851, -2.789432, 0, 1, 0.5686275, 1,
-0.1525244, 1.391078, 0.2116682, 0, 1, 0.572549, 1,
-0.1493202, 0.5819178, -0.7305592, 0, 1, 0.5803922, 1,
-0.1462047, 0.2404319, -1.889255, 0, 1, 0.5843138, 1,
-0.1386953, -0.5464509, -6.478056, 0, 1, 0.5921569, 1,
-0.1385998, -0.9253802, -3.117683, 0, 1, 0.5960785, 1,
-0.1366633, -0.7947487, -2.443582, 0, 1, 0.6039216, 1,
-0.134669, 1.119832, 0.5859822, 0, 1, 0.6117647, 1,
-0.1346438, 0.1308612, -0.3264396, 0, 1, 0.6156863, 1,
-0.1301045, 1.087124, -1.235664, 0, 1, 0.6235294, 1,
-0.1289756, 0.4896547, 0.9097338, 0, 1, 0.627451, 1,
-0.1261262, -2.56466, -3.581157, 0, 1, 0.6352941, 1,
-0.1257622, -0.3735229, -2.977645, 0, 1, 0.6392157, 1,
-0.1250234, -0.3205469, -1.979478, 0, 1, 0.6470588, 1,
-0.1247005, 0.7553434, -0.3204584, 0, 1, 0.6509804, 1,
-0.123271, -1.436148, -3.352888, 0, 1, 0.6588235, 1,
-0.122122, 0.6430342, 0.9243358, 0, 1, 0.6627451, 1,
-0.1208137, -0.2117861, -3.425822, 0, 1, 0.6705883, 1,
-0.1194066, 0.1365828, 0.5675992, 0, 1, 0.6745098, 1,
-0.1103407, -2.066852, -0.8685069, 0, 1, 0.682353, 1,
-0.1084356, -0.4964426, -4.478243, 0, 1, 0.6862745, 1,
-0.1068024, 0.2315933, -1.631806, 0, 1, 0.6941177, 1,
-0.1064938, -0.004036838, -2.112247, 0, 1, 0.7019608, 1,
-0.1062035, -0.4507599, -3.044788, 0, 1, 0.7058824, 1,
-0.1047152, -0.366698, -3.781928, 0, 1, 0.7137255, 1,
-0.1028321, -1.492242, -4.149995, 0, 1, 0.7176471, 1,
-0.09682507, -1.294865, -2.121692, 0, 1, 0.7254902, 1,
-0.09516065, 0.8217054, -1.308233, 0, 1, 0.7294118, 1,
-0.09118211, 0.6292778, -1.008399, 0, 1, 0.7372549, 1,
-0.09067973, 1.404452, 0.8161766, 0, 1, 0.7411765, 1,
-0.08381177, -0.9381781, -1.368469, 0, 1, 0.7490196, 1,
-0.08369494, 0.1800827, -1.335911, 0, 1, 0.7529412, 1,
-0.08112109, 1.617973, 1.355369, 0, 1, 0.7607843, 1,
-0.07721213, 1.414825, 0.2696268, 0, 1, 0.7647059, 1,
-0.07428264, 0.2663826, -0.7940753, 0, 1, 0.772549, 1,
-0.06959113, -0.8563535, -2.384015, 0, 1, 0.7764706, 1,
-0.06927308, -0.696179, -1.930811, 0, 1, 0.7843137, 1,
-0.06548122, 0.5216476, 0.1886171, 0, 1, 0.7882353, 1,
-0.06372208, -0.3042249, -3.289198, 0, 1, 0.7960784, 1,
-0.05803151, 1.090784, 0.2663427, 0, 1, 0.8039216, 1,
-0.05481379, 1.343644, 0.2372852, 0, 1, 0.8078431, 1,
-0.05458495, 0.09262261, 0.1423005, 0, 1, 0.8156863, 1,
-0.05324761, 0.1320332, -0.7815602, 0, 1, 0.8196079, 1,
-0.04948757, -0.4585614, -4.115385, 0, 1, 0.827451, 1,
-0.04640292, -0.9235231, -3.571711, 0, 1, 0.8313726, 1,
-0.0463344, 1.191231, 0.3030971, 0, 1, 0.8392157, 1,
-0.04028538, 0.1858746, -0.4911696, 0, 1, 0.8431373, 1,
-0.03826378, 1.511847, 0.7188894, 0, 1, 0.8509804, 1,
-0.03657321, -0.6316723, -2.423804, 0, 1, 0.854902, 1,
-0.03648756, -1.161135, -1.775718, 0, 1, 0.8627451, 1,
-0.03644644, 0.7715531, -1.141783, 0, 1, 0.8666667, 1,
-0.03258421, 0.4581491, 0.909298, 0, 1, 0.8745098, 1,
-0.02990991, -0.792462, -2.61199, 0, 1, 0.8784314, 1,
-0.02870961, -0.732701, -2.334365, 0, 1, 0.8862745, 1,
-0.0265831, -0.25296, -4.51645, 0, 1, 0.8901961, 1,
-0.02623645, 0.2323788, -0.02728351, 0, 1, 0.8980392, 1,
-0.02377946, 1.263292, -0.8976519, 0, 1, 0.9058824, 1,
-0.02334024, 1.967476, 1.677611, 0, 1, 0.9098039, 1,
-0.02303192, -0.6392884, -2.179986, 0, 1, 0.9176471, 1,
-0.02158724, 0.5013593, 0.7823838, 0, 1, 0.9215686, 1,
-0.0185976, 0.4446185, 1.753786, 0, 1, 0.9294118, 1,
-0.01228384, 0.4969179, -0.07865422, 0, 1, 0.9333333, 1,
-0.002028395, 1.230021, -0.3119299, 0, 1, 0.9411765, 1,
0.0004746324, -0.8214175, 3.659591, 0, 1, 0.945098, 1,
0.002026769, -1.184042, 2.887484, 0, 1, 0.9529412, 1,
0.005420234, -1.092634, 2.595428, 0, 1, 0.9568627, 1,
0.007562361, -1.523156, 1.829819, 0, 1, 0.9647059, 1,
0.01153783, 0.2792121, 0.02953352, 0, 1, 0.9686275, 1,
0.02402016, -0.3162684, 1.997077, 0, 1, 0.9764706, 1,
0.02663662, 0.8158894, 0.3292856, 0, 1, 0.9803922, 1,
0.02705788, -0.5126773, 1.818463, 0, 1, 0.9882353, 1,
0.02849379, -0.8884575, 3.412507, 0, 1, 0.9921569, 1,
0.03279072, -0.4844444, 0.989576, 0, 1, 1, 1,
0.0349544, 1.732525, -1.265227, 0, 0.9921569, 1, 1,
0.03983523, 0.1045818, -0.8132533, 0, 0.9882353, 1, 1,
0.04091602, 0.06893945, 0.5147932, 0, 0.9803922, 1, 1,
0.04632983, 1.340003, -1.537827, 0, 0.9764706, 1, 1,
0.04720747, 0.01453836, 1.872859, 0, 0.9686275, 1, 1,
0.0486182, 0.2990633, 1.005256, 0, 0.9647059, 1, 1,
0.04877263, -1.242008, 2.434836, 0, 0.9568627, 1, 1,
0.05274097, -1.652496, 4.070504, 0, 0.9529412, 1, 1,
0.05636328, -0.9425026, 3.617382, 0, 0.945098, 1, 1,
0.05980558, -0.3767488, 2.792333, 0, 0.9411765, 1, 1,
0.07378736, -1.129688, 2.128052, 0, 0.9333333, 1, 1,
0.07917331, -1.368035, 2.610131, 0, 0.9294118, 1, 1,
0.08364262, -1.063597, 2.394997, 0, 0.9215686, 1, 1,
0.08496942, -0.08012526, 1.731304, 0, 0.9176471, 1, 1,
0.08869553, 1.161492, 2.192812, 0, 0.9098039, 1, 1,
0.0911801, -0.7831957, 2.296306, 0, 0.9058824, 1, 1,
0.09168443, -1.246332, 5.244834, 0, 0.8980392, 1, 1,
0.09410934, 0.4113778, 2.030899, 0, 0.8901961, 1, 1,
0.09472835, 1.952389, 0.3544278, 0, 0.8862745, 1, 1,
0.0981317, 1.047597, 1.768551, 0, 0.8784314, 1, 1,
0.1004763, -1.391992, 3.576545, 0, 0.8745098, 1, 1,
0.1062342, -1.374435, 2.632324, 0, 0.8666667, 1, 1,
0.1072876, -1.178422, 4.203185, 0, 0.8627451, 1, 1,
0.1073272, 1.089969, 1.209981, 0, 0.854902, 1, 1,
0.1073664, 0.6996601, 0.3515055, 0, 0.8509804, 1, 1,
0.1096565, 0.1679494, 0.4288667, 0, 0.8431373, 1, 1,
0.1124984, 0.1859528, 2.343481, 0, 0.8392157, 1, 1,
0.114572, 1.00698, 0.7921755, 0, 0.8313726, 1, 1,
0.1148962, 1.22567, 0.8784277, 0, 0.827451, 1, 1,
0.1159485, 1.506304, -0.3069974, 0, 0.8196079, 1, 1,
0.1174624, -1.063948, 3.581182, 0, 0.8156863, 1, 1,
0.1215191, 0.7298207, 0.5873479, 0, 0.8078431, 1, 1,
0.1283979, -0.4548373, 4.570924, 0, 0.8039216, 1, 1,
0.1342857, -0.6863226, 3.889334, 0, 0.7960784, 1, 1,
0.1446027, 0.04054252, 2.297708, 0, 0.7882353, 1, 1,
0.1450436, 1.407543, -0.1960165, 0, 0.7843137, 1, 1,
0.1462855, 1.075396, -0.4775665, 0, 0.7764706, 1, 1,
0.1484071, -0.03067226, 2.81438, 0, 0.772549, 1, 1,
0.1489033, 0.6168076, -0.4253175, 0, 0.7647059, 1, 1,
0.1500822, -0.1867149, 4.773072, 0, 0.7607843, 1, 1,
0.155742, -0.7273559, 2.047739, 0, 0.7529412, 1, 1,
0.1572878, 1.998274, 1.192362, 0, 0.7490196, 1, 1,
0.1587076, 1.328289, 0.701817, 0, 0.7411765, 1, 1,
0.1591007, 0.1539315, 1.351177, 0, 0.7372549, 1, 1,
0.1599118, 0.6378574, -0.1910943, 0, 0.7294118, 1, 1,
0.1624386, 0.1652887, 2.063347, 0, 0.7254902, 1, 1,
0.1633969, 3.430497, -0.08293366, 0, 0.7176471, 1, 1,
0.164724, 0.241935, 1.336191, 0, 0.7137255, 1, 1,
0.1647271, 1.121972, -1.292598, 0, 0.7058824, 1, 1,
0.1663109, -0.4856572, 1.28248, 0, 0.6980392, 1, 1,
0.1697102, 2.789033, 0.5753086, 0, 0.6941177, 1, 1,
0.1705252, 0.2395823, 0.3518667, 0, 0.6862745, 1, 1,
0.1747914, -0.5005014, 3.180184, 0, 0.682353, 1, 1,
0.1770865, -0.1580579, 2.428348, 0, 0.6745098, 1, 1,
0.1782031, -1.164151, 3.759397, 0, 0.6705883, 1, 1,
0.1822875, -0.2508135, 2.859504, 0, 0.6627451, 1, 1,
0.1827149, -0.4429417, 2.165173, 0, 0.6588235, 1, 1,
0.1829469, 1.603158, 1.311058, 0, 0.6509804, 1, 1,
0.197333, 0.9794786, 1.011672, 0, 0.6470588, 1, 1,
0.1987812, 1.043225, 1.448352, 0, 0.6392157, 1, 1,
0.1995702, -1.598419, 2.586051, 0, 0.6352941, 1, 1,
0.2011797, 0.4924603, 0.6493903, 0, 0.627451, 1, 1,
0.2031332, 1.390892, 0.8485553, 0, 0.6235294, 1, 1,
0.2045987, -1.016502, 3.899846, 0, 0.6156863, 1, 1,
0.2098344, 0.6503514, 2.779358, 0, 0.6117647, 1, 1,
0.2098716, -0.120652, 5.021891, 0, 0.6039216, 1, 1,
0.2106125, -1.299083, 2.083519, 0, 0.5960785, 1, 1,
0.2109357, -1.01327, 2.267186, 0, 0.5921569, 1, 1,
0.2115445, 1.758751, -0.4668648, 0, 0.5843138, 1, 1,
0.2122415, -0.007923943, 0.4936751, 0, 0.5803922, 1, 1,
0.212899, -0.5806291, 3.441312, 0, 0.572549, 1, 1,
0.2164245, -0.8219973, 2.095716, 0, 0.5686275, 1, 1,
0.2170562, 0.2346915, 1.727097, 0, 0.5607843, 1, 1,
0.2172898, 0.8755397, 1.374659, 0, 0.5568628, 1, 1,
0.2198263, -0.2444588, 1.942353, 0, 0.5490196, 1, 1,
0.2232003, 0.1101365, 1.125972, 0, 0.5450981, 1, 1,
0.2257948, -1.319679, 5.648482, 0, 0.5372549, 1, 1,
0.2279523, -0.9346216, 3.104313, 0, 0.5333334, 1, 1,
0.2279584, 1.532246, 0.2930326, 0, 0.5254902, 1, 1,
0.2302811, -2.002674, 3.132143, 0, 0.5215687, 1, 1,
0.2306906, -1.463688, 3.192868, 0, 0.5137255, 1, 1,
0.2312894, -0.7543084, 2.053648, 0, 0.509804, 1, 1,
0.231379, -1.112961, 2.347823, 0, 0.5019608, 1, 1,
0.2356138, 0.05535577, 0.1373059, 0, 0.4941176, 1, 1,
0.2369514, 0.7453929, -0.2476114, 0, 0.4901961, 1, 1,
0.2425962, 1.136139, -0.1907586, 0, 0.4823529, 1, 1,
0.2474819, 0.6747789, 0.4902141, 0, 0.4784314, 1, 1,
0.2476898, 1.207043, 0.3528613, 0, 0.4705882, 1, 1,
0.2489176, -0.6037484, 4.774908, 0, 0.4666667, 1, 1,
0.2529059, 0.2324361, 2.374991, 0, 0.4588235, 1, 1,
0.2529108, -0.8870757, 2.368405, 0, 0.454902, 1, 1,
0.2532661, 2.250027, -0.2670567, 0, 0.4470588, 1, 1,
0.2549756, -0.7886727, 3.072625, 0, 0.4431373, 1, 1,
0.2583956, 0.3672692, 0.3856496, 0, 0.4352941, 1, 1,
0.2615928, -0.7621824, 2.584293, 0, 0.4313726, 1, 1,
0.2629816, -0.2987441, 0.2275579, 0, 0.4235294, 1, 1,
0.2639431, 1.495106, 0.4953323, 0, 0.4196078, 1, 1,
0.2679202, 0.5283111, 1.702299, 0, 0.4117647, 1, 1,
0.2708281, 1.237684, 2.037666, 0, 0.4078431, 1, 1,
0.2767831, 0.7097524, 0.1563072, 0, 0.4, 1, 1,
0.2781423, 0.006200352, 2.200628, 0, 0.3921569, 1, 1,
0.2781643, 0.132718, 0.5051376, 0, 0.3882353, 1, 1,
0.2782324, 2.445484, -0.6178188, 0, 0.3803922, 1, 1,
0.2791482, 0.3880951, 2.343792, 0, 0.3764706, 1, 1,
0.2792333, 0.6600568, 0.4032651, 0, 0.3686275, 1, 1,
0.2800004, -1.073005, 3.20037, 0, 0.3647059, 1, 1,
0.2851476, 0.3027031, 0.7311841, 0, 0.3568628, 1, 1,
0.2884417, 0.04928803, 0.5774483, 0, 0.3529412, 1, 1,
0.2887665, -0.2425544, 2.085353, 0, 0.345098, 1, 1,
0.290125, 0.3189565, 1.285746, 0, 0.3411765, 1, 1,
0.2960852, 0.6459205, 1.417122, 0, 0.3333333, 1, 1,
0.2969783, 0.06311172, 0.7609926, 0, 0.3294118, 1, 1,
0.2985582, 0.7531954, 0.2965713, 0, 0.3215686, 1, 1,
0.3026254, -1.441066, 1.456663, 0, 0.3176471, 1, 1,
0.3059072, 0.1211454, 0.1484975, 0, 0.3098039, 1, 1,
0.308149, -0.3797635, 2.003654, 0, 0.3058824, 1, 1,
0.3108669, 0.6315017, 1.387937, 0, 0.2980392, 1, 1,
0.3117152, -0.003876525, 0.8603536, 0, 0.2901961, 1, 1,
0.3134386, 2.375141, 0.3151899, 0, 0.2862745, 1, 1,
0.3142955, -1.236292, 1.835043, 0, 0.2784314, 1, 1,
0.3143445, -0.1522269, 3.112696, 0, 0.2745098, 1, 1,
0.3226874, -0.8430721, 3.169488, 0, 0.2666667, 1, 1,
0.3314961, -0.8693717, 1.319762, 0, 0.2627451, 1, 1,
0.3333733, 0.07732126, 1.794737, 0, 0.254902, 1, 1,
0.3343429, 1.222167, 0.8888319, 0, 0.2509804, 1, 1,
0.3343698, 0.7155574, 1.806718, 0, 0.2431373, 1, 1,
0.3362805, -1.171355, 0.08075137, 0, 0.2392157, 1, 1,
0.3402339, -1.379322, 3.979253, 0, 0.2313726, 1, 1,
0.3429258, -0.1192756, 3.315064, 0, 0.227451, 1, 1,
0.3486108, 1.485117, 0.527246, 0, 0.2196078, 1, 1,
0.3488166, -0.1159393, 2.563652, 0, 0.2156863, 1, 1,
0.3514867, -0.7231345, 4.335716, 0, 0.2078431, 1, 1,
0.3518584, -0.003021939, 1.381883, 0, 0.2039216, 1, 1,
0.3534792, 1.764369, -0.2477031, 0, 0.1960784, 1, 1,
0.3569809, 0.02589666, 1.128822, 0, 0.1882353, 1, 1,
0.3583005, -0.9684078, 4.222547, 0, 0.1843137, 1, 1,
0.3601836, 1.09592, 0.8661429, 0, 0.1764706, 1, 1,
0.3610592, -0.4956453, 2.791731, 0, 0.172549, 1, 1,
0.3637139, 1.516575, -0.4574812, 0, 0.1647059, 1, 1,
0.3662475, 0.7235497, -0.3589019, 0, 0.1607843, 1, 1,
0.3685854, 0.5881798, 0.02116277, 0, 0.1529412, 1, 1,
0.3698271, 0.5606055, 2.859053, 0, 0.1490196, 1, 1,
0.3736183, 1.219314, 0.4390092, 0, 0.1411765, 1, 1,
0.3842809, -0.571594, 1.954217, 0, 0.1372549, 1, 1,
0.3874123, -0.9437999, 2.949187, 0, 0.1294118, 1, 1,
0.3916916, -0.2701371, 0.5807949, 0, 0.1254902, 1, 1,
0.3922344, 1.185476, 0.8517396, 0, 0.1176471, 1, 1,
0.392854, -0.7846236, 2.662624, 0, 0.1137255, 1, 1,
0.3958718, -1.305048, 1.378918, 0, 0.1058824, 1, 1,
0.3981232, 0.2851697, 0.1529744, 0, 0.09803922, 1, 1,
0.4027387, -1.496713, 1.922514, 0, 0.09411765, 1, 1,
0.4063036, -0.2758917, 1.352825, 0, 0.08627451, 1, 1,
0.4065991, -0.07530077, 2.636546, 0, 0.08235294, 1, 1,
0.4076756, -1.022493, 4.491067, 0, 0.07450981, 1, 1,
0.4084291, -0.1650715, 1.068829, 0, 0.07058824, 1, 1,
0.4099412, 0.1457057, 0.9574688, 0, 0.0627451, 1, 1,
0.4100945, -0.8249968, 3.202569, 0, 0.05882353, 1, 1,
0.411371, -0.136868, 1.387208, 0, 0.05098039, 1, 1,
0.414427, 0.7146562, 0.009115889, 0, 0.04705882, 1, 1,
0.4160432, -0.4212989, 1.736575, 0, 0.03921569, 1, 1,
0.4189642, -0.9165335, 3.634428, 0, 0.03529412, 1, 1,
0.4203344, 1.086368, 0.5277938, 0, 0.02745098, 1, 1,
0.4296388, 0.4279762, 1.94248, 0, 0.02352941, 1, 1,
0.4322847, -0.5127335, 2.719051, 0, 0.01568628, 1, 1,
0.4329956, -0.004601233, 0.6672457, 0, 0.01176471, 1, 1,
0.4336021, 0.5145407, 1.807952, 0, 0.003921569, 1, 1,
0.433889, 1.878361, 2.255055, 0.003921569, 0, 1, 1,
0.436027, 0.12051, 0.6294357, 0.007843138, 0, 1, 1,
0.44078, 1.655668, -0.7722266, 0.01568628, 0, 1, 1,
0.4414415, 0.04825218, 2.070847, 0.01960784, 0, 1, 1,
0.4463658, 0.5364981, -0.1967209, 0.02745098, 0, 1, 1,
0.4465137, 0.4385819, 1.089981, 0.03137255, 0, 1, 1,
0.4471, 1.117152, -0.1817057, 0.03921569, 0, 1, 1,
0.4514616, -1.552875, 1.549811, 0.04313726, 0, 1, 1,
0.4549324, 2.215827, -0.515195, 0.05098039, 0, 1, 1,
0.4609923, -1.352657, 3.571539, 0.05490196, 0, 1, 1,
0.4668347, -0.8025991, 1.516745, 0.0627451, 0, 1, 1,
0.4689187, 0.8724993, -0.03956309, 0.06666667, 0, 1, 1,
0.4709701, 0.5475644, 0.1144211, 0.07450981, 0, 1, 1,
0.4712602, -1.459335, 2.985218, 0.07843138, 0, 1, 1,
0.4725635, -0.00962179, 1.491404, 0.08627451, 0, 1, 1,
0.4735105, 0.06392206, 0.4997256, 0.09019608, 0, 1, 1,
0.4891932, 0.6808063, -1.093281, 0.09803922, 0, 1, 1,
0.4894379, 1.607518, 0.5380178, 0.1058824, 0, 1, 1,
0.4970461, 0.1373975, 0.5952973, 0.1098039, 0, 1, 1,
0.4985051, 0.06904213, 1.705397, 0.1176471, 0, 1, 1,
0.4991476, 0.8170492, -0.6682325, 0.1215686, 0, 1, 1,
0.5020965, 1.347893, -1.614588, 0.1294118, 0, 1, 1,
0.5031974, 1.981821, 0.6066598, 0.1333333, 0, 1, 1,
0.5057151, 0.1532446, -0.08072057, 0.1411765, 0, 1, 1,
0.5084479, 0.8957242, 0.534434, 0.145098, 0, 1, 1,
0.5090997, 0.6234813, 0.9806041, 0.1529412, 0, 1, 1,
0.5151767, 0.9019935, 2.346717, 0.1568628, 0, 1, 1,
0.5182052, 2.034623, -1.145125, 0.1647059, 0, 1, 1,
0.5188664, 1.627115, -0.5833105, 0.1686275, 0, 1, 1,
0.5236992, -0.03221897, -0.2163839, 0.1764706, 0, 1, 1,
0.5239298, -0.229566, 0.1222303, 0.1803922, 0, 1, 1,
0.5256334, -0.1082015, 3.582644, 0.1882353, 0, 1, 1,
0.5284213, -1.805664, 4.63723, 0.1921569, 0, 1, 1,
0.5290269, -0.610333, 3.190472, 0.2, 0, 1, 1,
0.5307711, -0.7643857, 1.237947, 0.2078431, 0, 1, 1,
0.5361664, -0.2967642, 1.722316, 0.2117647, 0, 1, 1,
0.5368512, -1.120591, 3.714283, 0.2196078, 0, 1, 1,
0.5378644, -0.05483865, 0.9567772, 0.2235294, 0, 1, 1,
0.5440745, -0.1424716, 2.100024, 0.2313726, 0, 1, 1,
0.54557, 0.1300144, 1.204744, 0.2352941, 0, 1, 1,
0.5502684, -0.9217185, 1.635954, 0.2431373, 0, 1, 1,
0.550401, 0.4486856, -1.203017, 0.2470588, 0, 1, 1,
0.5551743, -0.136895, 1.10803, 0.254902, 0, 1, 1,
0.5556462, -2.408865, 3.644773, 0.2588235, 0, 1, 1,
0.5589524, -0.6632913, 2.612128, 0.2666667, 0, 1, 1,
0.5603101, -0.9359581, 3.283621, 0.2705882, 0, 1, 1,
0.5616493, -1.266228, 2.450849, 0.2784314, 0, 1, 1,
0.5690891, 0.2142948, 0.2301157, 0.282353, 0, 1, 1,
0.5698305, 1.011702, -0.01586155, 0.2901961, 0, 1, 1,
0.5723046, -2.082575, 3.865678, 0.2941177, 0, 1, 1,
0.5728558, -0.2052647, 1.912489, 0.3019608, 0, 1, 1,
0.5758752, -1.511947, 3.211534, 0.3098039, 0, 1, 1,
0.5759582, 0.04984744, 1.469197, 0.3137255, 0, 1, 1,
0.5762743, 0.3100618, 1.359679, 0.3215686, 0, 1, 1,
0.5789075, 0.1637822, -0.8885171, 0.3254902, 0, 1, 1,
0.5799091, 1.938077, 1.074011, 0.3333333, 0, 1, 1,
0.5801227, -0.772734, 3.113304, 0.3372549, 0, 1, 1,
0.5825217, 0.187007, 0.6625661, 0.345098, 0, 1, 1,
0.5827719, -0.5668539, 3.550238, 0.3490196, 0, 1, 1,
0.586295, 0.776432, 0.8620564, 0.3568628, 0, 1, 1,
0.5902157, -1.335707, 3.632278, 0.3607843, 0, 1, 1,
0.5928014, -0.3716241, 3.373078, 0.3686275, 0, 1, 1,
0.5979523, -1.749761, 1.812217, 0.372549, 0, 1, 1,
0.5995467, -0.4717326, 1.470026, 0.3803922, 0, 1, 1,
0.6010286, 0.1432605, 0.950601, 0.3843137, 0, 1, 1,
0.6027627, -2.099508, 0.972668, 0.3921569, 0, 1, 1,
0.6059682, 1.166294, 0.2099889, 0.3960784, 0, 1, 1,
0.6087887, -0.8274637, 2.520672, 0.4039216, 0, 1, 1,
0.6173866, 1.281179, -1.00956, 0.4117647, 0, 1, 1,
0.6177633, -1.1403, 1.536741, 0.4156863, 0, 1, 1,
0.6258122, -1.006872, 2.235499, 0.4235294, 0, 1, 1,
0.6335101, 0.1634935, 2.336786, 0.427451, 0, 1, 1,
0.6391442, -0.06867989, 0.7037251, 0.4352941, 0, 1, 1,
0.6462802, -0.3779691, 2.225468, 0.4392157, 0, 1, 1,
0.6487485, -0.4302053, 1.194682, 0.4470588, 0, 1, 1,
0.649027, -0.1394683, 3.378666, 0.4509804, 0, 1, 1,
0.649766, -1.297748, 2.753108, 0.4588235, 0, 1, 1,
0.6552181, 0.5547975, -1.151404, 0.4627451, 0, 1, 1,
0.6584576, -1.554405, 2.195868, 0.4705882, 0, 1, 1,
0.6619799, 0.980413, 0.2326506, 0.4745098, 0, 1, 1,
0.6624259, 2.190381, -0.2028952, 0.4823529, 0, 1, 1,
0.6649299, -1.077656, 3.216083, 0.4862745, 0, 1, 1,
0.6658249, 1.21875, -0.08786515, 0.4941176, 0, 1, 1,
0.6855772, 0.9283327, 1.660767, 0.5019608, 0, 1, 1,
0.6939582, -0.6488505, 2.602902, 0.5058824, 0, 1, 1,
0.6958491, 0.001017128, 2.358905, 0.5137255, 0, 1, 1,
0.6974181, -0.7776866, 1.199123, 0.5176471, 0, 1, 1,
0.6991383, 1.100328, 1.517036, 0.5254902, 0, 1, 1,
0.701229, -1.084696, 3.725861, 0.5294118, 0, 1, 1,
0.7016105, 0.3006923, 3.420147, 0.5372549, 0, 1, 1,
0.7027283, 0.9853262, 0.2398572, 0.5411765, 0, 1, 1,
0.7034457, -0.01334359, -0.02272178, 0.5490196, 0, 1, 1,
0.7042579, 0.7534809, -0.4661893, 0.5529412, 0, 1, 1,
0.7064188, 0.356514, 2.487354, 0.5607843, 0, 1, 1,
0.7073225, -0.3716121, 1.788804, 0.5647059, 0, 1, 1,
0.7080449, -0.2858731, 1.571659, 0.572549, 0, 1, 1,
0.7087826, 1.564276, 1.073376, 0.5764706, 0, 1, 1,
0.7097312, -2.15133, 2.306575, 0.5843138, 0, 1, 1,
0.7119452, 0.06269389, 2.002752, 0.5882353, 0, 1, 1,
0.7127742, -1.411653, 1.29156, 0.5960785, 0, 1, 1,
0.7156492, -2.344971, 2.056059, 0.6039216, 0, 1, 1,
0.7225761, 0.872696, 2.873236, 0.6078432, 0, 1, 1,
0.7241802, 0.4551749, 1.069447, 0.6156863, 0, 1, 1,
0.7245396, 1.354194, -0.06048504, 0.6196079, 0, 1, 1,
0.7249859, 0.9908798, -1.030584, 0.627451, 0, 1, 1,
0.7272868, 2.245993, -0.2786215, 0.6313726, 0, 1, 1,
0.7275583, 0.5784519, 2.426138, 0.6392157, 0, 1, 1,
0.734849, 0.2768811, 2.432132, 0.6431373, 0, 1, 1,
0.7472426, 0.5851819, 0.8147015, 0.6509804, 0, 1, 1,
0.7519228, 1.435865, 0.4094258, 0.654902, 0, 1, 1,
0.7643512, 1.301563, -1.191874, 0.6627451, 0, 1, 1,
0.7679774, -0.2537336, 3.788375, 0.6666667, 0, 1, 1,
0.7689412, -0.4765745, 2.359783, 0.6745098, 0, 1, 1,
0.7777153, 0.7601196, 1.035181, 0.6784314, 0, 1, 1,
0.7804297, -0.4787853, 2.508039, 0.6862745, 0, 1, 1,
0.7839425, 1.031585, 1.322064, 0.6901961, 0, 1, 1,
0.7849427, -1.783265, 3.572424, 0.6980392, 0, 1, 1,
0.784991, 0.3043259, 0.7946674, 0.7058824, 0, 1, 1,
0.791322, -0.7458681, 1.862716, 0.7098039, 0, 1, 1,
0.7972162, -1.791812, 3.078348, 0.7176471, 0, 1, 1,
0.7972897, 0.3222872, 2.625915, 0.7215686, 0, 1, 1,
0.8013965, 1.710697, -0.5679328, 0.7294118, 0, 1, 1,
0.8098849, -1.307748, 4.292001, 0.7333333, 0, 1, 1,
0.8206107, 1.22651, -0.9575547, 0.7411765, 0, 1, 1,
0.8440849, -0.3982921, 0.4440863, 0.7450981, 0, 1, 1,
0.8459901, -0.08946437, 0.5015674, 0.7529412, 0, 1, 1,
0.8494062, -1.628381, 1.882648, 0.7568628, 0, 1, 1,
0.8502968, 0.06498344, 1.176834, 0.7647059, 0, 1, 1,
0.8541098, -1.591364, 3.521876, 0.7686275, 0, 1, 1,
0.8554211, 0.3252258, 0.7514902, 0.7764706, 0, 1, 1,
0.8582187, 0.4223286, 0.3933404, 0.7803922, 0, 1, 1,
0.8594492, -1.386728, 1.575052, 0.7882353, 0, 1, 1,
0.8633096, -0.003957081, 1.617695, 0.7921569, 0, 1, 1,
0.866802, 0.1045058, 1.045643, 0.8, 0, 1, 1,
0.870374, -1.219275, 2.897575, 0.8078431, 0, 1, 1,
0.8714837, 0.7347846, 3.305884, 0.8117647, 0, 1, 1,
0.8724183, -1.640784, 3.980746, 0.8196079, 0, 1, 1,
0.8754594, -1.194495, 3.693831, 0.8235294, 0, 1, 1,
0.8761171, 1.675452, 1.556369, 0.8313726, 0, 1, 1,
0.8767001, 1.469807, 1.710023, 0.8352941, 0, 1, 1,
0.8786098, -1.163772, 1.704082, 0.8431373, 0, 1, 1,
0.8793672, 1.923724, 0.8184496, 0.8470588, 0, 1, 1,
0.8794172, 1.430765, 1.13325, 0.854902, 0, 1, 1,
0.8818828, -0.02483017, 1.330642, 0.8588235, 0, 1, 1,
0.8823009, -0.09954091, -0.06134975, 0.8666667, 0, 1, 1,
0.8829454, 1.9832, 1.656407, 0.8705882, 0, 1, 1,
0.8834629, -0.08881224, 2.770365, 0.8784314, 0, 1, 1,
0.8862509, 0.3321584, 0.00162471, 0.8823529, 0, 1, 1,
0.8893591, -0.8704008, 2.899798, 0.8901961, 0, 1, 1,
0.8927147, 0.4007075, 2.494399, 0.8941177, 0, 1, 1,
0.8956624, 1.369296, 0.7315002, 0.9019608, 0, 1, 1,
0.896706, 2.179241, 0.9811681, 0.9098039, 0, 1, 1,
0.8967513, -0.4344302, 0.2201485, 0.9137255, 0, 1, 1,
0.8968967, -0.05775416, 1.52273, 0.9215686, 0, 1, 1,
0.8974867, -1.573311, 1.51054, 0.9254902, 0, 1, 1,
0.9019573, 0.08675157, 1.6387, 0.9333333, 0, 1, 1,
0.9065628, 0.3574044, 1.680852, 0.9372549, 0, 1, 1,
0.912571, -1.533444, 2.355304, 0.945098, 0, 1, 1,
0.9127634, 0.5699521, -0.2664958, 0.9490196, 0, 1, 1,
0.9182522, -1.637496, 3.128093, 0.9568627, 0, 1, 1,
0.9201366, -0.3700303, 2.381642, 0.9607843, 0, 1, 1,
0.9289809, 0.00475973, 0.4928765, 0.9686275, 0, 1, 1,
0.9307915, -0.5035776, 1.082699, 0.972549, 0, 1, 1,
0.9321347, 1.542385, 0.04810086, 0.9803922, 0, 1, 1,
0.9331105, -1.260267, 0.410435, 0.9843137, 0, 1, 1,
0.9391905, -2.484704, 3.275386, 0.9921569, 0, 1, 1,
0.9471217, -2.37068, 4.871465, 0.9960784, 0, 1, 1,
0.9514782, 0.86146, 0.9558407, 1, 0, 0.9960784, 1,
0.9521607, 0.1988398, 1.521549, 1, 0, 0.9882353, 1,
0.9544256, 0.7944086, -0.3206952, 1, 0, 0.9843137, 1,
0.9603655, 0.09456546, 1.143322, 1, 0, 0.9764706, 1,
0.9668041, 1.115024, 1.424138, 1, 0, 0.972549, 1,
0.9706399, -0.6695787, 1.964118, 1, 0, 0.9647059, 1,
0.9748352, -0.7616401, 1.87272, 1, 0, 0.9607843, 1,
0.9801177, -0.2434701, 1.890465, 1, 0, 0.9529412, 1,
0.9814298, -0.07854691, 2.312003, 1, 0, 0.9490196, 1,
0.9875675, -1.916688, 3.276881, 1, 0, 0.9411765, 1,
0.9883602, 0.6781647, -0.4350934, 1, 0, 0.9372549, 1,
0.9897463, -1.056847, 1.995025, 1, 0, 0.9294118, 1,
0.993405, 1.217534, 1.240777, 1, 0, 0.9254902, 1,
0.9983827, 0.9321613, 1.274978, 1, 0, 0.9176471, 1,
1.005613, 0.2026533, 1.654302, 1, 0, 0.9137255, 1,
1.008026, 1.204132, 0.2203079, 1, 0, 0.9058824, 1,
1.008154, 0.7737347, 0.2537093, 1, 0, 0.9019608, 1,
1.01924, 0.4430036, 0.1710854, 1, 0, 0.8941177, 1,
1.023291, 2.030557, 0.8347911, 1, 0, 0.8862745, 1,
1.024958, 0.6331053, 2.24514, 1, 0, 0.8823529, 1,
1.03846, 0.9569647, 0.110434, 1, 0, 0.8745098, 1,
1.040759, 1.1152, 1.957983, 1, 0, 0.8705882, 1,
1.041024, -0.8227477, 1.485691, 1, 0, 0.8627451, 1,
1.044485, 0.9423869, 1.919641, 1, 0, 0.8588235, 1,
1.060458, -0.6038889, 1.498653, 1, 0, 0.8509804, 1,
1.060993, 0.09059982, 1.587943, 1, 0, 0.8470588, 1,
1.061995, -0.5769242, 2.801042, 1, 0, 0.8392157, 1,
1.068128, 0.1281275, 0.4469673, 1, 0, 0.8352941, 1,
1.0733, -0.6975809, 2.110323, 1, 0, 0.827451, 1,
1.07341, 0.3682224, 1.736002, 1, 0, 0.8235294, 1,
1.080752, 0.6091034, 0.4495725, 1, 0, 0.8156863, 1,
1.087173, 1.643027, -0.6414565, 1, 0, 0.8117647, 1,
1.09025, 0.4571005, 1.495005, 1, 0, 0.8039216, 1,
1.101674, -1.220474, 2.38226, 1, 0, 0.7960784, 1,
1.104044, -0.1545786, 3.001501, 1, 0, 0.7921569, 1,
1.106549, -0.6615353, 1.946658, 1, 0, 0.7843137, 1,
1.115249, -0.9427695, 3.041011, 1, 0, 0.7803922, 1,
1.117426, -1.474573, 3.009971, 1, 0, 0.772549, 1,
1.117746, 0.5181281, 1.228441, 1, 0, 0.7686275, 1,
1.12174, 0.3594153, 1.6744, 1, 0, 0.7607843, 1,
1.122274, 0.8461521, 0.9361845, 1, 0, 0.7568628, 1,
1.1283, -3.058232, 1.961305, 1, 0, 0.7490196, 1,
1.1365, 0.3176212, -0.1329307, 1, 0, 0.7450981, 1,
1.139368, -0.4397629, 0.09325464, 1, 0, 0.7372549, 1,
1.145417, -0.2721398, 1.930585, 1, 0, 0.7333333, 1,
1.151792, -0.4211446, 1.376174, 1, 0, 0.7254902, 1,
1.152836, 2.088756, -1.186033, 1, 0, 0.7215686, 1,
1.153677, -0.2520144, 1.308616, 1, 0, 0.7137255, 1,
1.161058, 1.877848, 1.028957, 1, 0, 0.7098039, 1,
1.168155, -0.4852109, 3.814219, 1, 0, 0.7019608, 1,
1.177726, -0.1395202, 3.664325, 1, 0, 0.6941177, 1,
1.180143, -1.260993, 3.302415, 1, 0, 0.6901961, 1,
1.184591, 1.404609, 0.2514828, 1, 0, 0.682353, 1,
1.189456, -0.8258883, 2.974356, 1, 0, 0.6784314, 1,
1.191755, 3.179154, -0.3074722, 1, 0, 0.6705883, 1,
1.19455, 0.9673444, 0.6756618, 1, 0, 0.6666667, 1,
1.20792, 0.4137947, 0.2326202, 1, 0, 0.6588235, 1,
1.213311, 1.270953, 1.46461, 1, 0, 0.654902, 1,
1.217831, -0.5293549, 1.791023, 1, 0, 0.6470588, 1,
1.226305, -0.9782409, 3.650379, 1, 0, 0.6431373, 1,
1.246149, -0.04495936, 0.8050567, 1, 0, 0.6352941, 1,
1.246536, 1.383501, 0.384623, 1, 0, 0.6313726, 1,
1.247921, -1.888401, 3.545212, 1, 0, 0.6235294, 1,
1.252267, -0.2531938, 2.556785, 1, 0, 0.6196079, 1,
1.262169, -0.5619659, 3.899704, 1, 0, 0.6117647, 1,
1.277075, -0.160152, 2.207091, 1, 0, 0.6078432, 1,
1.27888, 1.11897, 0.6550256, 1, 0, 0.6, 1,
1.282108, 0.8366533, 0.662806, 1, 0, 0.5921569, 1,
1.286142, 0.2187551, 0.1082247, 1, 0, 0.5882353, 1,
1.300524, 2.541567, -0.06192083, 1, 0, 0.5803922, 1,
1.306709, -3.558537, 2.743686, 1, 0, 0.5764706, 1,
1.323726, -0.8431622, 2.401056, 1, 0, 0.5686275, 1,
1.3267, 0.3166637, 1.864042, 1, 0, 0.5647059, 1,
1.338651, -0.08358529, 2.260332, 1, 0, 0.5568628, 1,
1.340087, 1.459466, 1.915544, 1, 0, 0.5529412, 1,
1.34199, 0.2651865, 1.989095, 1, 0, 0.5450981, 1,
1.349097, -1.154443, 1.650794, 1, 0, 0.5411765, 1,
1.354529, 0.3772583, 2.120193, 1, 0, 0.5333334, 1,
1.356089, 2.038856, 0.4956308, 1, 0, 0.5294118, 1,
1.362304, -0.2880691, 1.639405, 1, 0, 0.5215687, 1,
1.364198, -0.7956873, 2.434484, 1, 0, 0.5176471, 1,
1.364446, -1.211563, 1.743439, 1, 0, 0.509804, 1,
1.366294, -1.109602, 3.769363, 1, 0, 0.5058824, 1,
1.369769, -0.3121805, 2.376474, 1, 0, 0.4980392, 1,
1.375932, 1.275528, -0.3035911, 1, 0, 0.4901961, 1,
1.378225, -0.5895129, 3.450348, 1, 0, 0.4862745, 1,
1.380499, 0.2759764, 0.1293837, 1, 0, 0.4784314, 1,
1.380684, -0.2300259, 3.90785, 1, 0, 0.4745098, 1,
1.386306, 0.695179, 0.9860249, 1, 0, 0.4666667, 1,
1.389495, -0.9049233, 1.982631, 1, 0, 0.4627451, 1,
1.39871, -0.3775859, 3.363528, 1, 0, 0.454902, 1,
1.404311, 0.7783061, -0.16646, 1, 0, 0.4509804, 1,
1.407585, 0.7119355, 0.9716371, 1, 0, 0.4431373, 1,
1.437065, -0.7332698, 0.7946261, 1, 0, 0.4392157, 1,
1.442364, 0.5111025, 1.867871, 1, 0, 0.4313726, 1,
1.449887, 1.013335, -0.467281, 1, 0, 0.427451, 1,
1.453755, -1.06705, 1.650052, 1, 0, 0.4196078, 1,
1.456837, 0.8154321, -1.327451, 1, 0, 0.4156863, 1,
1.457282, 1.142147, 0.7712035, 1, 0, 0.4078431, 1,
1.460615, 1.636177, -0.2711513, 1, 0, 0.4039216, 1,
1.469302, 0.9483702, 1.257763, 1, 0, 0.3960784, 1,
1.473791, -1.07305, 1.662186, 1, 0, 0.3882353, 1,
1.477017, 0.9059762, 1.442284, 1, 0, 0.3843137, 1,
1.479866, 0.6316493, 2.002752, 1, 0, 0.3764706, 1,
1.530702, -0.4082285, 0.3677337, 1, 0, 0.372549, 1,
1.541285, -0.7405879, 2.41343, 1, 0, 0.3647059, 1,
1.542815, -0.437919, 2.320089, 1, 0, 0.3607843, 1,
1.549308, 0.8599141, 1.673312, 1, 0, 0.3529412, 1,
1.573335, 0.9686648, 1.066701, 1, 0, 0.3490196, 1,
1.575465, 0.1653561, 0.8669054, 1, 0, 0.3411765, 1,
1.578882, -1.433701, 4.026321, 1, 0, 0.3372549, 1,
1.582929, -1.291246, 2.934386, 1, 0, 0.3294118, 1,
1.586549, 1.082923, 0.1787777, 1, 0, 0.3254902, 1,
1.596184, -2.028503, 1.529591, 1, 0, 0.3176471, 1,
1.609954, -1.431061, 0.4111739, 1, 0, 0.3137255, 1,
1.618114, 0.8340231, 0.4747022, 1, 0, 0.3058824, 1,
1.633318, 0.1874611, 1.270277, 1, 0, 0.2980392, 1,
1.642832, -0.3987907, 1.601925, 1, 0, 0.2941177, 1,
1.648937, 1.074456, 0.2648439, 1, 0, 0.2862745, 1,
1.654646, -1.940966, 3.961761, 1, 0, 0.282353, 1,
1.671554, 0.4267506, -1.504369, 1, 0, 0.2745098, 1,
1.671984, 0.01294051, 0.6533163, 1, 0, 0.2705882, 1,
1.676681, -1.113593, 1.434317, 1, 0, 0.2627451, 1,
1.678079, 0.1946487, 1.957128, 1, 0, 0.2588235, 1,
1.688186, -0.01552291, -0.7877331, 1, 0, 0.2509804, 1,
1.693724, -0.6944605, 2.597258, 1, 0, 0.2470588, 1,
1.711036, -0.8362377, -0.08586995, 1, 0, 0.2392157, 1,
1.722593, -0.1524328, 0.2164222, 1, 0, 0.2352941, 1,
1.727144, -0.7195082, 2.766016, 1, 0, 0.227451, 1,
1.735377, 1.983139, 1.621052, 1, 0, 0.2235294, 1,
1.752885, -0.4707813, 0.7562336, 1, 0, 0.2156863, 1,
1.755657, -0.04972734, 1.819935, 1, 0, 0.2117647, 1,
1.767135, -0.2694649, 1.222966, 1, 0, 0.2039216, 1,
1.768005, 0.8680778, 2.837369, 1, 0, 0.1960784, 1,
1.778813, -1.050385, 3.423642, 1, 0, 0.1921569, 1,
1.780414, -0.1508093, 2.107413, 1, 0, 0.1843137, 1,
1.787186, 0.1011441, 2.930582, 1, 0, 0.1803922, 1,
1.819613, -3.729903, 2.379882, 1, 0, 0.172549, 1,
1.830342, -1.804354, 2.164479, 1, 0, 0.1686275, 1,
1.864111, -0.613624, 2.471699, 1, 0, 0.1607843, 1,
1.875553, 1.194178, 0.4836744, 1, 0, 0.1568628, 1,
1.890878, 1.747862, -0.6348117, 1, 0, 0.1490196, 1,
1.895179, -1.492606, 3.538417, 1, 0, 0.145098, 1,
1.905561, -1.168172, 2.029897, 1, 0, 0.1372549, 1,
1.932391, -0.9343591, 1.528301, 1, 0, 0.1333333, 1,
1.979664, -1.03191, 2.867051, 1, 0, 0.1254902, 1,
2.014041, -0.704306, 0.7847103, 1, 0, 0.1215686, 1,
2.021566, -0.3575042, 1.616173, 1, 0, 0.1137255, 1,
2.072854, -0.2767462, 1.024604, 1, 0, 0.1098039, 1,
2.07817, 3.241148, 1.912558, 1, 0, 0.1019608, 1,
2.117088, -1.187575, 0.3397855, 1, 0, 0.09411765, 1,
2.132998, -0.8750407, 2.438086, 1, 0, 0.09019608, 1,
2.133627, -0.7438827, 3.884492, 1, 0, 0.08235294, 1,
2.147443, -0.08855057, 1.437535, 1, 0, 0.07843138, 1,
2.187266, 0.6730739, 2.702987, 1, 0, 0.07058824, 1,
2.200279, 0.1329235, 3.078723, 1, 0, 0.06666667, 1,
2.249975, -0.6374664, 2.397271, 1, 0, 0.05882353, 1,
2.28998, 0.2563463, 3.515864, 1, 0, 0.05490196, 1,
2.380059, 0.1019967, 0.06127865, 1, 0, 0.04705882, 1,
2.437994, 0.06446788, 1.513649, 1, 0, 0.04313726, 1,
2.56637, 0.6268846, 0.660528, 1, 0, 0.03529412, 1,
2.651851, 0.04965127, 4.756019, 1, 0, 0.03137255, 1,
2.817008, 1.247284, 2.314039, 1, 0, 0.02352941, 1,
2.835439, -2.150279, 0.9095517, 1, 0, 0.01960784, 1,
3.006585, 1.352834, 2.301332, 1, 0, 0.01176471, 1,
3.022547, 0.8263392, -0.1940526, 1, 0, 0.007843138, 1
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
-0.0574199, -4.980163, -8.533504, 0, -0.5, 0.5, 0.5,
-0.0574199, -4.980163, -8.533504, 1, -0.5, 0.5, 0.5,
-0.0574199, -4.980163, -8.533504, 1, 1.5, 0.5, 0.5,
-0.0574199, -4.980163, -8.533504, 0, 1.5, 0.5, 0.5
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
-4.181496, -0.04181993, -8.533504, 0, -0.5, 0.5, 0.5,
-4.181496, -0.04181993, -8.533504, 1, -0.5, 0.5, 0.5,
-4.181496, -0.04181993, -8.533504, 1, 1.5, 0.5, 0.5,
-4.181496, -0.04181993, -8.533504, 0, 1.5, 0.5, 0.5
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
-4.181496, -4.980163, -0.4147873, 0, -0.5, 0.5, 0.5,
-4.181496, -4.980163, -0.4147873, 1, -0.5, 0.5, 0.5,
-4.181496, -4.980163, -0.4147873, 1, 1.5, 0.5, 0.5,
-4.181496, -4.980163, -0.4147873, 0, 1.5, 0.5, 0.5
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
-3, -3.840545, -6.659955,
3, -3.840545, -6.659955,
-3, -3.840545, -6.659955,
-3, -4.030481, -6.972213,
-2, -3.840545, -6.659955,
-2, -4.030481, -6.972213,
-1, -3.840545, -6.659955,
-1, -4.030481, -6.972213,
0, -3.840545, -6.659955,
0, -4.030481, -6.972213,
1, -3.840545, -6.659955,
1, -4.030481, -6.972213,
2, -3.840545, -6.659955,
2, -4.030481, -6.972213,
3, -3.840545, -6.659955,
3, -4.030481, -6.972213
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
-3, -4.410354, -7.59673, 0, -0.5, 0.5, 0.5,
-3, -4.410354, -7.59673, 1, -0.5, 0.5, 0.5,
-3, -4.410354, -7.59673, 1, 1.5, 0.5, 0.5,
-3, -4.410354, -7.59673, 0, 1.5, 0.5, 0.5,
-2, -4.410354, -7.59673, 0, -0.5, 0.5, 0.5,
-2, -4.410354, -7.59673, 1, -0.5, 0.5, 0.5,
-2, -4.410354, -7.59673, 1, 1.5, 0.5, 0.5,
-2, -4.410354, -7.59673, 0, 1.5, 0.5, 0.5,
-1, -4.410354, -7.59673, 0, -0.5, 0.5, 0.5,
-1, -4.410354, -7.59673, 1, -0.5, 0.5, 0.5,
-1, -4.410354, -7.59673, 1, 1.5, 0.5, 0.5,
-1, -4.410354, -7.59673, 0, 1.5, 0.5, 0.5,
0, -4.410354, -7.59673, 0, -0.5, 0.5, 0.5,
0, -4.410354, -7.59673, 1, -0.5, 0.5, 0.5,
0, -4.410354, -7.59673, 1, 1.5, 0.5, 0.5,
0, -4.410354, -7.59673, 0, 1.5, 0.5, 0.5,
1, -4.410354, -7.59673, 0, -0.5, 0.5, 0.5,
1, -4.410354, -7.59673, 1, -0.5, 0.5, 0.5,
1, -4.410354, -7.59673, 1, 1.5, 0.5, 0.5,
1, -4.410354, -7.59673, 0, 1.5, 0.5, 0.5,
2, -4.410354, -7.59673, 0, -0.5, 0.5, 0.5,
2, -4.410354, -7.59673, 1, -0.5, 0.5, 0.5,
2, -4.410354, -7.59673, 1, 1.5, 0.5, 0.5,
2, -4.410354, -7.59673, 0, 1.5, 0.5, 0.5,
3, -4.410354, -7.59673, 0, -0.5, 0.5, 0.5,
3, -4.410354, -7.59673, 1, -0.5, 0.5, 0.5,
3, -4.410354, -7.59673, 1, 1.5, 0.5, 0.5,
3, -4.410354, -7.59673, 0, 1.5, 0.5, 0.5
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
-3.229786, -2, -6.659955,
-3.229786, 2, -6.659955,
-3.229786, -2, -6.659955,
-3.388404, -2, -6.972213,
-3.229786, 0, -6.659955,
-3.388404, 0, -6.972213,
-3.229786, 2, -6.659955,
-3.388404, 2, -6.972213
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
-3.705641, -2, -7.59673, 0, -0.5, 0.5, 0.5,
-3.705641, -2, -7.59673, 1, -0.5, 0.5, 0.5,
-3.705641, -2, -7.59673, 1, 1.5, 0.5, 0.5,
-3.705641, -2, -7.59673, 0, 1.5, 0.5, 0.5,
-3.705641, 0, -7.59673, 0, -0.5, 0.5, 0.5,
-3.705641, 0, -7.59673, 1, -0.5, 0.5, 0.5,
-3.705641, 0, -7.59673, 1, 1.5, 0.5, 0.5,
-3.705641, 0, -7.59673, 0, 1.5, 0.5, 0.5,
-3.705641, 2, -7.59673, 0, -0.5, 0.5, 0.5,
-3.705641, 2, -7.59673, 1, -0.5, 0.5, 0.5,
-3.705641, 2, -7.59673, 1, 1.5, 0.5, 0.5,
-3.705641, 2, -7.59673, 0, 1.5, 0.5, 0.5
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
-3.229786, -3.840545, -6,
-3.229786, -3.840545, 4,
-3.229786, -3.840545, -6,
-3.388404, -4.030481, -6,
-3.229786, -3.840545, -4,
-3.388404, -4.030481, -4,
-3.229786, -3.840545, -2,
-3.388404, -4.030481, -2,
-3.229786, -3.840545, 0,
-3.388404, -4.030481, 0,
-3.229786, -3.840545, 2,
-3.388404, -4.030481, 2,
-3.229786, -3.840545, 4,
-3.388404, -4.030481, 4
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
-3.705641, -4.410354, -6, 0, -0.5, 0.5, 0.5,
-3.705641, -4.410354, -6, 1, -0.5, 0.5, 0.5,
-3.705641, -4.410354, -6, 1, 1.5, 0.5, 0.5,
-3.705641, -4.410354, -6, 0, 1.5, 0.5, 0.5,
-3.705641, -4.410354, -4, 0, -0.5, 0.5, 0.5,
-3.705641, -4.410354, -4, 1, -0.5, 0.5, 0.5,
-3.705641, -4.410354, -4, 1, 1.5, 0.5, 0.5,
-3.705641, -4.410354, -4, 0, 1.5, 0.5, 0.5,
-3.705641, -4.410354, -2, 0, -0.5, 0.5, 0.5,
-3.705641, -4.410354, -2, 1, -0.5, 0.5, 0.5,
-3.705641, -4.410354, -2, 1, 1.5, 0.5, 0.5,
-3.705641, -4.410354, -2, 0, 1.5, 0.5, 0.5,
-3.705641, -4.410354, 0, 0, -0.5, 0.5, 0.5,
-3.705641, -4.410354, 0, 1, -0.5, 0.5, 0.5,
-3.705641, -4.410354, 0, 1, 1.5, 0.5, 0.5,
-3.705641, -4.410354, 0, 0, 1.5, 0.5, 0.5,
-3.705641, -4.410354, 2, 0, -0.5, 0.5, 0.5,
-3.705641, -4.410354, 2, 1, -0.5, 0.5, 0.5,
-3.705641, -4.410354, 2, 1, 1.5, 0.5, 0.5,
-3.705641, -4.410354, 2, 0, 1.5, 0.5, 0.5,
-3.705641, -4.410354, 4, 0, -0.5, 0.5, 0.5,
-3.705641, -4.410354, 4, 1, -0.5, 0.5, 0.5,
-3.705641, -4.410354, 4, 1, 1.5, 0.5, 0.5,
-3.705641, -4.410354, 4, 0, 1.5, 0.5, 0.5
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
-3.229786, -3.840545, -6.659955,
-3.229786, 3.756905, -6.659955,
-3.229786, -3.840545, 5.83038,
-3.229786, 3.756905, 5.83038,
-3.229786, -3.840545, -6.659955,
-3.229786, -3.840545, 5.83038,
-3.229786, 3.756905, -6.659955,
-3.229786, 3.756905, 5.83038,
-3.229786, -3.840545, -6.659955,
3.114946, -3.840545, -6.659955,
-3.229786, -3.840545, 5.83038,
3.114946, -3.840545, 5.83038,
-3.229786, 3.756905, -6.659955,
3.114946, 3.756905, -6.659955,
-3.229786, 3.756905, 5.83038,
3.114946, 3.756905, 5.83038,
3.114946, -3.840545, -6.659955,
3.114946, 3.756905, -6.659955,
3.114946, -3.840545, 5.83038,
3.114946, 3.756905, 5.83038,
3.114946, -3.840545, -6.659955,
3.114946, -3.840545, 5.83038,
3.114946, 3.756905, -6.659955,
3.114946, 3.756905, 5.83038
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
var radius = 8.510004;
var distance = 37.86197;
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
mvMatrix.translate( 0.0574199, 0.04181993, 0.4147873 );
mvMatrix.scale( 1.450208, 1.211088, 0.7366643 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.86197);
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
Sodium_o-phenylpheno<-read.table("Sodium_o-phenylpheno.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sodium_o-phenylpheno$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
```

```r
y<-Sodium_o-phenylpheno$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
```

```r
z<-Sodium_o-phenylpheno$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
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
-3.137387, 0.0952706, -0.2901637, 0, 0, 1, 1, 1,
-2.781126, -0.7652084, -1.946626, 1, 0, 0, 1, 1,
-2.769199, -0.1330112, -2.04887, 1, 0, 0, 1, 1,
-2.668616, 0.9604283, -1.24698, 1, 0, 0, 1, 1,
-2.634134, 0.7806606, -2.12742, 1, 0, 0, 1, 1,
-2.610532, -0.796665, -2.054694, 1, 0, 0, 1, 1,
-2.536168, 1.501934, -0.3188973, 0, 0, 0, 1, 1,
-2.450952, -0.7297254, -1.445622, 0, 0, 0, 1, 1,
-2.387087, 0.8909472, -1.792735, 0, 0, 0, 1, 1,
-2.386929, 0.7222459, -1.446614, 0, 0, 0, 1, 1,
-2.333057, -1.940615, -3.291009, 0, 0, 0, 1, 1,
-2.327893, 0.4185121, -1.348165, 0, 0, 0, 1, 1,
-2.286915, 1.450569, 0.1942507, 0, 0, 0, 1, 1,
-2.231943, 1.999703, -1.433656, 1, 1, 1, 1, 1,
-2.194293, 0.5208768, 0.7857018, 1, 1, 1, 1, 1,
-2.151946, -0.9522474, -1.638446, 1, 1, 1, 1, 1,
-2.141964, -0.2449314, -1.10503, 1, 1, 1, 1, 1,
-2.121888, 0.9961751, -0.34972, 1, 1, 1, 1, 1,
-2.087906, 0.2286869, 0.3706436, 1, 1, 1, 1, 1,
-2.07775, -0.2653725, -1.977102, 1, 1, 1, 1, 1,
-2.055321, -0.1116295, -0.3012736, 1, 1, 1, 1, 1,
-2.052176, 1.911941, -1.136748, 1, 1, 1, 1, 1,
-2.043197, -0.2132741, -1.267259, 1, 1, 1, 1, 1,
-2.035474, 0.1801585, -1.144122, 1, 1, 1, 1, 1,
-1.972737, -0.6512483, -0.8165133, 1, 1, 1, 1, 1,
-1.955971, 0.9230861, -1.238608, 1, 1, 1, 1, 1,
-1.940779, -0.5665566, 1.286381, 1, 1, 1, 1, 1,
-1.934947, 0.09842509, -2.112161, 1, 1, 1, 1, 1,
-1.927475, -1.418513, -2.105559, 0, 0, 1, 1, 1,
-1.92541, 1.387975, -0.5645796, 1, 0, 0, 1, 1,
-1.922735, -0.577479, -2.400793, 1, 0, 0, 1, 1,
-1.903945, 0.694757, -2.574447, 1, 0, 0, 1, 1,
-1.900454, -0.3664659, -2.639494, 1, 0, 0, 1, 1,
-1.895825, -0.5994911, -2.380155, 1, 0, 0, 1, 1,
-1.887366, -1.532797, -0.8549024, 0, 0, 0, 1, 1,
-1.884851, 0.4237946, -0.2064674, 0, 0, 0, 1, 1,
-1.865041, 2.469741, -1.725974, 0, 0, 0, 1, 1,
-1.84851, -0.599116, -2.380457, 0, 0, 0, 1, 1,
-1.845356, -0.1019704, -2.259008, 0, 0, 0, 1, 1,
-1.838917, 1.488411, -1.294077, 0, 0, 0, 1, 1,
-1.836478, -0.7851942, -1.284384, 0, 0, 0, 1, 1,
-1.812987, 1.427277, 0.06551862, 1, 1, 1, 1, 1,
-1.808181, 0.2754336, -2.251594, 1, 1, 1, 1, 1,
-1.797041, 0.1814769, -0.533626, 1, 1, 1, 1, 1,
-1.781353, -0.2597742, -3.130913, 1, 1, 1, 1, 1,
-1.778685, 1.399384, -2.127252, 1, 1, 1, 1, 1,
-1.778496, -0.1781367, -0.8647698, 1, 1, 1, 1, 1,
-1.770538, 0.6600764, -0.1280928, 1, 1, 1, 1, 1,
-1.748248, 0.6388854, -1.880223, 1, 1, 1, 1, 1,
-1.743696, 0.8715721, -1.951628, 1, 1, 1, 1, 1,
-1.719574, 1.507589, 0.4063868, 1, 1, 1, 1, 1,
-1.717933, -0.3961651, -0.5542309, 1, 1, 1, 1, 1,
-1.709643, -0.2035431, 0.03967577, 1, 1, 1, 1, 1,
-1.70513, -0.1047741, -2.04789, 1, 1, 1, 1, 1,
-1.701849, -1.55961, -2.114286, 1, 1, 1, 1, 1,
-1.701658, 0.6194274, 0.5091412, 1, 1, 1, 1, 1,
-1.695618, 0.4406733, -1.191857, 0, 0, 1, 1, 1,
-1.689336, -0.3428681, -2.282771, 1, 0, 0, 1, 1,
-1.686503, 0.8278441, -0.5324798, 1, 0, 0, 1, 1,
-1.67936, 0.2400545, -2.701802, 1, 0, 0, 1, 1,
-1.677281, -0.01312598, -2.122259, 1, 0, 0, 1, 1,
-1.675002, 0.1171023, -2.70217, 1, 0, 0, 1, 1,
-1.67135, -1.706615, -3.176132, 0, 0, 0, 1, 1,
-1.665349, -0.6588959, -2.080027, 0, 0, 0, 1, 1,
-1.658095, -1.38137, -1.217931, 0, 0, 0, 1, 1,
-1.654525, 0.8461813, 0.4946915, 0, 0, 0, 1, 1,
-1.651069, -1.865496, 0.2006212, 0, 0, 0, 1, 1,
-1.636689, 0.07220747, -1.682832, 0, 0, 0, 1, 1,
-1.625381, 1.462628, -2.308136, 0, 0, 0, 1, 1,
-1.611924, 0.1960946, -2.550244, 1, 1, 1, 1, 1,
-1.607408, -1.449288, -0.7210933, 1, 1, 1, 1, 1,
-1.60632, 0.1815264, -2.140804, 1, 1, 1, 1, 1,
-1.605202, 1.426732, -0.5752201, 1, 1, 1, 1, 1,
-1.604012, 0.05901353, -1.196013, 1, 1, 1, 1, 1,
-1.599861, -0.9940166, -3.799947, 1, 1, 1, 1, 1,
-1.597099, 0.4975199, -0.6813455, 1, 1, 1, 1, 1,
-1.593338, -0.7321485, -0.9102077, 1, 1, 1, 1, 1,
-1.577594, -0.352918, -2.530312, 1, 1, 1, 1, 1,
-1.573201, -1.233776, -4.007304, 1, 1, 1, 1, 1,
-1.570551, 0.365232, -0.4829816, 1, 1, 1, 1, 1,
-1.565558, 0.3382435, -2.40833, 1, 1, 1, 1, 1,
-1.542702, 1.063433, -1.315218, 1, 1, 1, 1, 1,
-1.529592, -0.7635624, -0.2590557, 1, 1, 1, 1, 1,
-1.51453, -0.3880088, -0.6793362, 1, 1, 1, 1, 1,
-1.484666, 1.167387, -1.091741, 0, 0, 1, 1, 1,
-1.480416, -0.5592033, -2.250648, 1, 0, 0, 1, 1,
-1.460339, -1.371301, -1.264151, 1, 0, 0, 1, 1,
-1.457252, -1.700661, -3.214613, 1, 0, 0, 1, 1,
-1.454314, 2.165809, -0.2728912, 1, 0, 0, 1, 1,
-1.451978, -1.334803, -1.440083, 1, 0, 0, 1, 1,
-1.442558, 0.323815, -0.9685131, 0, 0, 0, 1, 1,
-1.42745, 0.5437978, 0.1105205, 0, 0, 0, 1, 1,
-1.418523, 0.2730384, -1.948842, 0, 0, 0, 1, 1,
-1.417538, -0.9031765, -2.597487, 0, 0, 0, 1, 1,
-1.406825, 0.5071889, -2.152626, 0, 0, 0, 1, 1,
-1.405641, 0.605911, -0.4520615, 0, 0, 0, 1, 1,
-1.40224, 0.9374541, 0.1850869, 0, 0, 0, 1, 1,
-1.396927, -1.109866, -2.432453, 1, 1, 1, 1, 1,
-1.374583, 1.533469, 0.501798, 1, 1, 1, 1, 1,
-1.364846, -1.254694, -1.325927, 1, 1, 1, 1, 1,
-1.361344, 0.8931212, -1.552392, 1, 1, 1, 1, 1,
-1.355299, 1.041701, -2.133451, 1, 1, 1, 1, 1,
-1.351727, -0.6280789, -3.226594, 1, 1, 1, 1, 1,
-1.349212, -0.5317477, -1.545275, 1, 1, 1, 1, 1,
-1.349185, -1.817701, -3.371564, 1, 1, 1, 1, 1,
-1.347594, 0.7740564, -1.457294, 1, 1, 1, 1, 1,
-1.343806, 0.8317181, -0.7451479, 1, 1, 1, 1, 1,
-1.342408, 0.9960087, 0.3464767, 1, 1, 1, 1, 1,
-1.339435, 2.051202, -0.8125785, 1, 1, 1, 1, 1,
-1.339013, -0.3471381, -3.839242, 1, 1, 1, 1, 1,
-1.336829, -0.2286082, -1.327302, 1, 1, 1, 1, 1,
-1.334759, -1.460658, -3.71325, 1, 1, 1, 1, 1,
-1.332553, -1.60819, -3.907272, 0, 0, 1, 1, 1,
-1.329097, 0.4158108, -1.07784, 1, 0, 0, 1, 1,
-1.321808, -0.2462925, -1.27468, 1, 0, 0, 1, 1,
-1.316929, 0.0685446, -2.774199, 1, 0, 0, 1, 1,
-1.307698, -2.078049, -2.518518, 1, 0, 0, 1, 1,
-1.306467, 0.3380807, 0.4808601, 1, 0, 0, 1, 1,
-1.305263, 0.5305662, -0.1547983, 0, 0, 0, 1, 1,
-1.293448, -0.05011613, -1.842492, 0, 0, 0, 1, 1,
-1.290854, 0.8864321, -0.5941201, 0, 0, 0, 1, 1,
-1.290163, -0.467634, -1.637979, 0, 0, 0, 1, 1,
-1.285664, 0.1004687, -1.275352, 0, 0, 0, 1, 1,
-1.279409, 0.8975432, -0.9111226, 0, 0, 0, 1, 1,
-1.272449, -0.06410306, -0.4963492, 0, 0, 0, 1, 1,
-1.267898, -1.330848, -2.902658, 1, 1, 1, 1, 1,
-1.264768, -1.068439, -3.730991, 1, 1, 1, 1, 1,
-1.25157, -0.03528129, -0.5034946, 1, 1, 1, 1, 1,
-1.249813, 3.646263, -0.3118016, 1, 1, 1, 1, 1,
-1.246197, 1.350775, -1.777012, 1, 1, 1, 1, 1,
-1.241891, 0.6166099, -0.5608081, 1, 1, 1, 1, 1,
-1.236011, -0.6855099, -3.620302, 1, 1, 1, 1, 1,
-1.222186, 0.1680176, 0.1630162, 1, 1, 1, 1, 1,
-1.219663, -0.8835571, -3.798077, 1, 1, 1, 1, 1,
-1.217674, 1.950844, 0.07854143, 1, 1, 1, 1, 1,
-1.212789, 0.626535, -2.091507, 1, 1, 1, 1, 1,
-1.212632, 0.2811931, -2.079021, 1, 1, 1, 1, 1,
-1.207659, -0.2657505, -1.396492, 1, 1, 1, 1, 1,
-1.197802, -1.679605, -2.820311, 1, 1, 1, 1, 1,
-1.195136, 0.5113494, -2.362135, 1, 1, 1, 1, 1,
-1.192765, -0.4938132, -3.045756, 0, 0, 1, 1, 1,
-1.189633, -0.7518277, -4.115225, 1, 0, 0, 1, 1,
-1.187059, -0.4143047, -2.893307, 1, 0, 0, 1, 1,
-1.186754, -0.2494071, -1.861346, 1, 0, 0, 1, 1,
-1.183988, 0.5080958, -2.461165, 1, 0, 0, 1, 1,
-1.176312, 0.6339169, -1.804264, 1, 0, 0, 1, 1,
-1.170706, 0.004506226, -0.7871696, 0, 0, 0, 1, 1,
-1.170505, 0.9640524, -0.3652475, 0, 0, 0, 1, 1,
-1.16956, 1.122016, -0.05845388, 0, 0, 0, 1, 1,
-1.153152, 0.05801334, -3.218045, 0, 0, 0, 1, 1,
-1.152232, -0.7416223, -0.4321949, 0, 0, 0, 1, 1,
-1.152147, 0.1726892, -2.806633, 0, 0, 0, 1, 1,
-1.151943, 0.6301476, -1.856425, 0, 0, 0, 1, 1,
-1.145391, -1.116181, -2.321702, 1, 1, 1, 1, 1,
-1.138021, -1.520702, -1.442617, 1, 1, 1, 1, 1,
-1.108708, 1.444057, -0.3011085, 1, 1, 1, 1, 1,
-1.108427, -0.04576423, -1.604569, 1, 1, 1, 1, 1,
-1.102818, -1.208735, -1.559399, 1, 1, 1, 1, 1,
-1.0937, -0.08920301, -2.687827, 1, 1, 1, 1, 1,
-1.089939, -1.861695, -2.733473, 1, 1, 1, 1, 1,
-1.088676, -0.3031078, -1.705989, 1, 1, 1, 1, 1,
-1.088529, -0.9879196, -2.259443, 1, 1, 1, 1, 1,
-1.084565, -0.4016523, -1.688574, 1, 1, 1, 1, 1,
-1.082062, 1.275221, -0.4992429, 1, 1, 1, 1, 1,
-1.080439, -0.4298869, -3.091048, 1, 1, 1, 1, 1,
-1.077003, -0.2902636, -1.044362, 1, 1, 1, 1, 1,
-1.071094, 1.743623, -3.184556, 1, 1, 1, 1, 1,
-1.067189, -0.257463, -1.448329, 1, 1, 1, 1, 1,
-1.061128, -0.2561487, -1.048087, 0, 0, 1, 1, 1,
-1.060225, -0.08397518, -1.190398, 1, 0, 0, 1, 1,
-1.05931, 0.5842084, 0.4225512, 1, 0, 0, 1, 1,
-1.057956, -1.560136, -2.388124, 1, 0, 0, 1, 1,
-1.055083, 1.727036, -1.288598, 1, 0, 0, 1, 1,
-1.04581, 0.08939862, -1.352402, 1, 0, 0, 1, 1,
-1.038067, 0.5854976, -0.8761573, 0, 0, 0, 1, 1,
-1.028797, -1.022735, -2.682253, 0, 0, 0, 1, 1,
-1.028303, -0.1739094, -3.21987, 0, 0, 0, 1, 1,
-1.028085, -0.129449, -0.1910788, 0, 0, 0, 1, 1,
-1.027579, -0.7020226, -2.139149, 0, 0, 0, 1, 1,
-1.01936, -1.913373, -2.295919, 0, 0, 0, 1, 1,
-1.014601, -0.8804413, -3.075266, 0, 0, 0, 1, 1,
-1.014017, -0.3924393, -1.596419, 1, 1, 1, 1, 1,
-1.007042, -0.5018111, -2.13667, 1, 1, 1, 1, 1,
-1.007015, 0.7684903, -0.530347, 1, 1, 1, 1, 1,
-1.005392, 1.530287, -1.001614, 1, 1, 1, 1, 1,
-1.004641, 0.2884474, -2.104214, 1, 1, 1, 1, 1,
-1.001373, 0.5684929, -0.8681884, 1, 1, 1, 1, 1,
-0.9965444, 0.1139471, -1.819723, 1, 1, 1, 1, 1,
-0.9913244, 0.3637199, -1.248835, 1, 1, 1, 1, 1,
-0.985041, 0.8348382, 1.441787, 1, 1, 1, 1, 1,
-0.9803327, -0.7116253, -1.390718, 1, 1, 1, 1, 1,
-0.9736974, 0.2485356, -0.7665299, 1, 1, 1, 1, 1,
-0.9706538, 0.1196162, -1.424823, 1, 1, 1, 1, 1,
-0.9701483, -0.9694492, -2.248631, 1, 1, 1, 1, 1,
-0.9644348, 0.09376021, -0.720587, 1, 1, 1, 1, 1,
-0.9547123, 0.8987334, -2.276824, 1, 1, 1, 1, 1,
-0.9515487, 1.472063, -1.899765, 0, 0, 1, 1, 1,
-0.9475715, -0.6746051, -1.758874, 1, 0, 0, 1, 1,
-0.9422615, -0.09767441, -1.642824, 1, 0, 0, 1, 1,
-0.9374701, -1.158808, -0.3345831, 1, 0, 0, 1, 1,
-0.9322497, -0.775919, -2.147624, 1, 0, 0, 1, 1,
-0.9312496, 0.9219404, 0.6090862, 1, 0, 0, 1, 1,
-0.9276049, 0.3431532, -1.544187, 0, 0, 0, 1, 1,
-0.922264, 0.4437837, -0.5795879, 0, 0, 0, 1, 1,
-0.9133155, 0.04635645, -2.46961, 0, 0, 0, 1, 1,
-0.9130423, 0.3622885, -0.7393375, 0, 0, 0, 1, 1,
-0.9038675, -0.3517818, -2.063897, 0, 0, 0, 1, 1,
-0.902339, 0.3354356, -0.8766665, 0, 0, 0, 1, 1,
-0.8851926, 0.9083226, -0.3647567, 0, 0, 0, 1, 1,
-0.8821102, 1.046399, -1.536954, 1, 1, 1, 1, 1,
-0.8795246, 0.04291216, -1.844993, 1, 1, 1, 1, 1,
-0.8706343, -0.47339, -2.048046, 1, 1, 1, 1, 1,
-0.8684286, 0.1371962, -1.784376, 1, 1, 1, 1, 1,
-0.8653449, -0.2648726, -1.51246, 1, 1, 1, 1, 1,
-0.8624036, 2.192409, -2.978851, 1, 1, 1, 1, 1,
-0.8592, -0.02514373, -1.990609, 1, 1, 1, 1, 1,
-0.857718, 1.434686, -0.8328393, 1, 1, 1, 1, 1,
-0.8431013, 2.151995, 2.403844, 1, 1, 1, 1, 1,
-0.8422303, -0.3555785, -2.040486, 1, 1, 1, 1, 1,
-0.8418407, -0.2580018, -2.910662, 1, 1, 1, 1, 1,
-0.8416136, 0.91288, -0.4093535, 1, 1, 1, 1, 1,
-0.8301466, 0.2720587, -2.470059, 1, 1, 1, 1, 1,
-0.8300642, 0.6005138, -0.8928476, 1, 1, 1, 1, 1,
-0.8290648, 1.564474, -2.379102, 1, 1, 1, 1, 1,
-0.828796, 0.7643874, -2.45004, 0, 0, 1, 1, 1,
-0.8277712, -0.5777419, -2.212257, 1, 0, 0, 1, 1,
-0.8262902, -0.3806694, -1.361021, 1, 0, 0, 1, 1,
-0.8259618, 2.390807, 0.08375419, 1, 0, 0, 1, 1,
-0.8158111, -0.114396, -2.749464, 1, 0, 0, 1, 1,
-0.8074573, -1.297552, -2.036139, 1, 0, 0, 1, 1,
-0.7965594, 0.8320671, -1.518655, 0, 0, 0, 1, 1,
-0.7948067, 0.4224624, -1.364336, 0, 0, 0, 1, 1,
-0.7893515, -0.7120641, -1.412329, 0, 0, 0, 1, 1,
-0.7823578, -1.285159, -2.384161, 0, 0, 0, 1, 1,
-0.7813656, -2.180646, -3.799936, 0, 0, 0, 1, 1,
-0.7775542, 0.7457248, -2.506735, 0, 0, 0, 1, 1,
-0.7751039, 0.0422235, -1.872235, 0, 0, 0, 1, 1,
-0.7699822, 0.7831405, -2.066692, 1, 1, 1, 1, 1,
-0.7695622, -0.0794881, 0.1285436, 1, 1, 1, 1, 1,
-0.7681819, 0.61215, -3.035633, 1, 1, 1, 1, 1,
-0.7576345, -0.5638788, -3.413958, 1, 1, 1, 1, 1,
-0.7567191, -0.8293105, -3.421883, 1, 1, 1, 1, 1,
-0.7518046, -0.9425229, -2.526526, 1, 1, 1, 1, 1,
-0.7508857, 1.045887, -1.196966, 1, 1, 1, 1, 1,
-0.7506046, 0.3094643, -1.932171, 1, 1, 1, 1, 1,
-0.750356, 1.59943, -0.8465198, 1, 1, 1, 1, 1,
-0.7498405, 0.3109159, 0.05482121, 1, 1, 1, 1, 1,
-0.7442505, -0.3610131, -2.852747, 1, 1, 1, 1, 1,
-0.740903, 0.8903747, -0.1099513, 1, 1, 1, 1, 1,
-0.7295122, 0.2419156, -0.5015942, 1, 1, 1, 1, 1,
-0.7218978, 0.6107233, -0.7596113, 1, 1, 1, 1, 1,
-0.7215074, -0.09545301, -2.374686, 1, 1, 1, 1, 1,
-0.713835, 0.6863377, -0.08732953, 0, 0, 1, 1, 1,
-0.7071949, -1.438063, -2.509366, 1, 0, 0, 1, 1,
-0.7061687, -0.8028197, -0.9872348, 1, 0, 0, 1, 1,
-0.6991629, 1.228335, -0.3892, 1, 0, 0, 1, 1,
-0.693976, -1.130854, -2.584367, 1, 0, 0, 1, 1,
-0.6908577, -0.2280743, -2.161223, 1, 0, 0, 1, 1,
-0.6888877, -0.3151711, -3.352733, 0, 0, 0, 1, 1,
-0.6854953, -0.9726352, -2.455044, 0, 0, 0, 1, 1,
-0.6845329, 1.320266, 1.278332, 0, 0, 0, 1, 1,
-0.6801431, -1.986598, -4.009237, 0, 0, 0, 1, 1,
-0.6663525, -1.189831, -2.110515, 0, 0, 0, 1, 1,
-0.6649121, 0.801292, 1.089073, 0, 0, 0, 1, 1,
-0.6621052, 0.884814, 0.6725927, 0, 0, 0, 1, 1,
-0.659682, 0.3054291, 0.854432, 1, 1, 1, 1, 1,
-0.659448, 0.1790347, -0.8367832, 1, 1, 1, 1, 1,
-0.6586585, 0.3817846, -2.684441, 1, 1, 1, 1, 1,
-0.6479631, -0.6253307, -3.86002, 1, 1, 1, 1, 1,
-0.6424176, -1.076038, -3.415419, 1, 1, 1, 1, 1,
-0.6358538, 2.437599, 0.6137645, 1, 1, 1, 1, 1,
-0.6341367, -0.6017479, -3.79198, 1, 1, 1, 1, 1,
-0.6339563, -0.6123017, -0.9476072, 1, 1, 1, 1, 1,
-0.6314298, -1.125661, -2.031179, 1, 1, 1, 1, 1,
-0.619312, -2.273407, -2.088085, 1, 1, 1, 1, 1,
-0.6153266, 0.0551346, -2.206716, 1, 1, 1, 1, 1,
-0.6143622, 0.3334211, 0.549612, 1, 1, 1, 1, 1,
-0.608966, -0.3645943, -1.49133, 1, 1, 1, 1, 1,
-0.6052943, -0.8895693, -3.01673, 1, 1, 1, 1, 1,
-0.6027648, 1.029198, -1.729064, 1, 1, 1, 1, 1,
-0.6004239, -0.5770308, -2.751544, 0, 0, 1, 1, 1,
-0.5993435, -2.274309, -3.482725, 1, 0, 0, 1, 1,
-0.5944296, 0.3291482, -1.768404, 1, 0, 0, 1, 1,
-0.5899628, -2.371378, -3.913171, 1, 0, 0, 1, 1,
-0.5873005, 0.3097141, -1.009303, 1, 0, 0, 1, 1,
-0.5848275, 0.9292842, 0.6501829, 1, 0, 0, 1, 1,
-0.5784178, -0.05661031, -2.046174, 0, 0, 0, 1, 1,
-0.5775637, 0.3288489, -0.3411109, 0, 0, 0, 1, 1,
-0.5712922, 1.02639, -2.018601, 0, 0, 0, 1, 1,
-0.5668185, 0.06807688, 0.3194762, 0, 0, 0, 1, 1,
-0.5645988, -0.8792307, -1.727225, 0, 0, 0, 1, 1,
-0.5627113, -0.1373013, -1.195228, 0, 0, 0, 1, 1,
-0.5615637, -1.766026, -2.425599, 0, 0, 0, 1, 1,
-0.5608793, -1.277004, -1.530944, 1, 1, 1, 1, 1,
-0.558942, 0.9270198, 1.691348, 1, 1, 1, 1, 1,
-0.5572536, 0.5059519, -0.4929658, 1, 1, 1, 1, 1,
-0.545706, 0.0921897, 0.06058308, 1, 1, 1, 1, 1,
-0.5442084, 0.7543088, -1.418341, 1, 1, 1, 1, 1,
-0.5440273, 0.5503972, -1.767322, 1, 1, 1, 1, 1,
-0.543977, 0.3707623, -0.3771259, 1, 1, 1, 1, 1,
-0.5400495, 0.5690279, -0.5816435, 1, 1, 1, 1, 1,
-0.5368835, 0.5248183, -0.9439838, 1, 1, 1, 1, 1,
-0.5360798, 0.6811522, 0.3423797, 1, 1, 1, 1, 1,
-0.5303038, 1.093314, -3.572724, 1, 1, 1, 1, 1,
-0.5288082, 1.160856, -2.16396, 1, 1, 1, 1, 1,
-0.5281187, -1.021791, -3.407736, 1, 1, 1, 1, 1,
-0.526643, 0.9175913, -1.430049, 1, 1, 1, 1, 1,
-0.5252852, 0.1268489, -1.755566, 1, 1, 1, 1, 1,
-0.5233529, -0.4272155, -2.846392, 0, 0, 1, 1, 1,
-0.5195359, 2.290425, -0.5168688, 1, 0, 0, 1, 1,
-0.517234, -0.001515046, -1.494554, 1, 0, 0, 1, 1,
-0.506629, -1.684965, -4.177233, 1, 0, 0, 1, 1,
-0.5018917, 0.8398206, 0.1150117, 1, 0, 0, 1, 1,
-0.5017846, 2.019781, -1.515969, 1, 0, 0, 1, 1,
-0.4979672, -0.3708166, -3.543865, 0, 0, 0, 1, 1,
-0.4947768, -0.2932912, -2.539384, 0, 0, 0, 1, 1,
-0.4928537, -0.6206545, -1.144506, 0, 0, 0, 1, 1,
-0.4906804, 1.989836, -0.4558025, 0, 0, 0, 1, 1,
-0.4894908, 0.5090297, -1.23238, 0, 0, 0, 1, 1,
-0.4887805, -1.56282, -3.796118, 0, 0, 0, 1, 1,
-0.4885012, 0.2013105, -2.672261, 0, 0, 0, 1, 1,
-0.4837743, 1.315928, 0.936497, 1, 1, 1, 1, 1,
-0.4788685, -1.274763, -4.417746, 1, 1, 1, 1, 1,
-0.4770509, 0.7831714, -0.600614, 1, 1, 1, 1, 1,
-0.4653096, -1.656752, -4.106148, 1, 1, 1, 1, 1,
-0.4601933, 0.7943109, -0.2498877, 1, 1, 1, 1, 1,
-0.4601283, -0.3985491, -3.788542, 1, 1, 1, 1, 1,
-0.4570512, 2.811841, -0.7242196, 1, 1, 1, 1, 1,
-0.4537279, 1.30005, 1.831628, 1, 1, 1, 1, 1,
-0.4526292, 1.128603, -3.09388, 1, 1, 1, 1, 1,
-0.4476562, 0.1624375, -0.6767041, 1, 1, 1, 1, 1,
-0.4463666, -0.1223745, -3.105239, 1, 1, 1, 1, 1,
-0.4459227, -1.50964, -2.389469, 1, 1, 1, 1, 1,
-0.4444439, 0.06646277, -2.361135, 1, 1, 1, 1, 1,
-0.4440963, 0.0572263, -0.9571018, 1, 1, 1, 1, 1,
-0.4433704, 1.964647, -1.321237, 1, 1, 1, 1, 1,
-0.4403746, -0.3811722, -1.983276, 0, 0, 1, 1, 1,
-0.4347978, -1.169637, -3.367601, 1, 0, 0, 1, 1,
-0.434505, 0.02207247, -2.708672, 1, 0, 0, 1, 1,
-0.4282234, 0.5364856, -0.9749768, 1, 0, 0, 1, 1,
-0.4189711, -1.547571, -2.178087, 1, 0, 0, 1, 1,
-0.4058993, 0.8165168, 0.230368, 1, 0, 0, 1, 1,
-0.4056446, 0.2601767, -1.613986, 0, 0, 0, 1, 1,
-0.4047377, -0.5315632, -2.730268, 0, 0, 0, 1, 1,
-0.4024163, 0.8161642, -1.593519, 0, 0, 0, 1, 1,
-0.3988231, -0.1974306, -1.839889, 0, 0, 0, 1, 1,
-0.3977685, 0.1996013, -0.8320168, 0, 0, 0, 1, 1,
-0.3968145, 1.023998, 1.482415, 0, 0, 0, 1, 1,
-0.3960259, -0.3881373, -3.712597, 0, 0, 0, 1, 1,
-0.3847336, -0.5013888, -1.972855, 1, 1, 1, 1, 1,
-0.3810204, -1.513757, -2.361415, 1, 1, 1, 1, 1,
-0.3783259, 0.9451225, -0.378673, 1, 1, 1, 1, 1,
-0.3762785, 0.7605088, -1.213334, 1, 1, 1, 1, 1,
-0.3761967, 0.942945, -0.9419979, 1, 1, 1, 1, 1,
-0.372451, -0.383065, -2.878278, 1, 1, 1, 1, 1,
-0.3700432, 0.5800821, -0.3955798, 1, 1, 1, 1, 1,
-0.3674269, -0.2471666, -0.9486334, 1, 1, 1, 1, 1,
-0.3633339, -1.157688, -3.201057, 1, 1, 1, 1, 1,
-0.3602571, -2.07425, -3.353258, 1, 1, 1, 1, 1,
-0.3539623, -1.339717, -4.004272, 1, 1, 1, 1, 1,
-0.3516322, 0.4704224, 0.1641923, 1, 1, 1, 1, 1,
-0.3510936, -0.02501587, -0.6716124, 1, 1, 1, 1, 1,
-0.3412236, 0.2101815, -0.8023115, 1, 1, 1, 1, 1,
-0.340727, -0.4885229, -3.945467, 1, 1, 1, 1, 1,
-0.338582, -0.8834337, -3.483479, 0, 0, 1, 1, 1,
-0.3345174, 0.02522581, -1.914757, 1, 0, 0, 1, 1,
-0.3324591, 0.01255879, -3.916555, 1, 0, 0, 1, 1,
-0.3323265, 0.858068, 0.2414403, 1, 0, 0, 1, 1,
-0.3223705, -0.6894051, -2.48753, 1, 0, 0, 1, 1,
-0.3187335, 0.4681067, -0.1716389, 1, 0, 0, 1, 1,
-0.3092246, 0.9274165, 2.605661, 0, 0, 0, 1, 1,
-0.3044754, -1.851559, -4.232083, 0, 0, 0, 1, 1,
-0.3037533, -0.05717732, -2.870654, 0, 0, 0, 1, 1,
-0.3005346, -0.4704781, -3.42017, 0, 0, 0, 1, 1,
-0.2963711, 0.3506822, -0.2002963, 0, 0, 0, 1, 1,
-0.2942771, 1.567485, -0.6712701, 0, 0, 0, 1, 1,
-0.2930314, 0.1547075, -1.597112, 0, 0, 0, 1, 1,
-0.2914068, -0.4968399, -2.560257, 1, 1, 1, 1, 1,
-0.2909765, -0.04059318, 0.05121765, 1, 1, 1, 1, 1,
-0.2905093, -0.02246455, 0.6687409, 1, 1, 1, 1, 1,
-0.2885539, 1.017676, 1.057117, 1, 1, 1, 1, 1,
-0.2875312, 0.4051395, -1.147854, 1, 1, 1, 1, 1,
-0.2864423, -0.2339143, -2.672307, 1, 1, 1, 1, 1,
-0.2829694, -0.01970071, -0.5683596, 1, 1, 1, 1, 1,
-0.2812339, 1.737946, 1.637622, 1, 1, 1, 1, 1,
-0.2789804, -0.6855553, -1.938822, 1, 1, 1, 1, 1,
-0.2784502, 0.2156914, 0.03582024, 1, 1, 1, 1, 1,
-0.2751998, 1.365249, 0.175172, 1, 1, 1, 1, 1,
-0.2750859, 3.145285, 0.03035945, 1, 1, 1, 1, 1,
-0.2723896, -0.5706567, -3.42188, 1, 1, 1, 1, 1,
-0.2648671, 0.9670429, 1.218425, 1, 1, 1, 1, 1,
-0.2639042, -1.329621, -3.625711, 1, 1, 1, 1, 1,
-0.2631662, -0.2956434, -3.012975, 0, 0, 1, 1, 1,
-0.2592259, -0.2312016, -3.049668, 1, 0, 0, 1, 1,
-0.2534028, 0.1235761, -2.194181, 1, 0, 0, 1, 1,
-0.2511579, -0.3908002, -1.790794, 1, 0, 0, 1, 1,
-0.2510491, -0.2655229, -2.677343, 1, 0, 0, 1, 1,
-0.2506315, -0.5558884, -3.345646, 1, 0, 0, 1, 1,
-0.2469748, -0.389953, -2.948864, 0, 0, 0, 1, 1,
-0.2379087, 2.414389, 0.7895057, 0, 0, 0, 1, 1,
-0.2330155, 0.9678627, 1.043247, 0, 0, 0, 1, 1,
-0.2325756, -0.2584623, -1.398855, 0, 0, 0, 1, 1,
-0.229073, -1.187507, -2.550073, 0, 0, 0, 1, 1,
-0.2279966, 0.3553159, -0.01505883, 0, 0, 0, 1, 1,
-0.2194055, 0.6651206, -1.212377, 0, 0, 0, 1, 1,
-0.2188657, -0.6034441, -5.011748, 1, 1, 1, 1, 1,
-0.2139506, 0.2936626, -0.2205704, 1, 1, 1, 1, 1,
-0.2122019, -0.195757, -1.817921, 1, 1, 1, 1, 1,
-0.2097435, 0.1245508, -1.011728, 1, 1, 1, 1, 1,
-0.2039032, 1.010789, 0.1987782, 1, 1, 1, 1, 1,
-0.2017787, -2.64609, -1.99893, 1, 1, 1, 1, 1,
-0.2016223, -0.09013856, 0.2938275, 1, 1, 1, 1, 1,
-0.2002299, 0.3428333, -0.4052267, 1, 1, 1, 1, 1,
-0.2000487, -0.4261816, -3.800353, 1, 1, 1, 1, 1,
-0.1975654, -0.6565324, -2.655691, 1, 1, 1, 1, 1,
-0.1938075, 1.678822, -0.4370438, 1, 1, 1, 1, 1,
-0.192062, 1.374622, -0.6258352, 1, 1, 1, 1, 1,
-0.1909538, -0.8387231, -2.290211, 1, 1, 1, 1, 1,
-0.1876631, -0.1105621, -2.132492, 1, 1, 1, 1, 1,
-0.1853184, -1.310954, -3.125415, 1, 1, 1, 1, 1,
-0.1834693, -0.471265, -3.723148, 0, 0, 1, 1, 1,
-0.1812464, 1.506786, -0.2414422, 1, 0, 0, 1, 1,
-0.1766253, 0.03885156, -0.9815142, 1, 0, 0, 1, 1,
-0.1658471, -0.6792219, -4.206838, 1, 0, 0, 1, 1,
-0.1612652, -1.25263, -3.883268, 1, 0, 0, 1, 1,
-0.1611717, 0.2129702, -0.3979999, 1, 0, 0, 1, 1,
-0.1581159, 0.08520705, -1.43843, 0, 0, 0, 1, 1,
-0.1563016, -0.8696148, -1.701271, 0, 0, 0, 1, 1,
-0.153162, -1.232851, -2.789432, 0, 0, 0, 1, 1,
-0.1525244, 1.391078, 0.2116682, 0, 0, 0, 1, 1,
-0.1493202, 0.5819178, -0.7305592, 0, 0, 0, 1, 1,
-0.1462047, 0.2404319, -1.889255, 0, 0, 0, 1, 1,
-0.1386953, -0.5464509, -6.478056, 0, 0, 0, 1, 1,
-0.1385998, -0.9253802, -3.117683, 1, 1, 1, 1, 1,
-0.1366633, -0.7947487, -2.443582, 1, 1, 1, 1, 1,
-0.134669, 1.119832, 0.5859822, 1, 1, 1, 1, 1,
-0.1346438, 0.1308612, -0.3264396, 1, 1, 1, 1, 1,
-0.1301045, 1.087124, -1.235664, 1, 1, 1, 1, 1,
-0.1289756, 0.4896547, 0.9097338, 1, 1, 1, 1, 1,
-0.1261262, -2.56466, -3.581157, 1, 1, 1, 1, 1,
-0.1257622, -0.3735229, -2.977645, 1, 1, 1, 1, 1,
-0.1250234, -0.3205469, -1.979478, 1, 1, 1, 1, 1,
-0.1247005, 0.7553434, -0.3204584, 1, 1, 1, 1, 1,
-0.123271, -1.436148, -3.352888, 1, 1, 1, 1, 1,
-0.122122, 0.6430342, 0.9243358, 1, 1, 1, 1, 1,
-0.1208137, -0.2117861, -3.425822, 1, 1, 1, 1, 1,
-0.1194066, 0.1365828, 0.5675992, 1, 1, 1, 1, 1,
-0.1103407, -2.066852, -0.8685069, 1, 1, 1, 1, 1,
-0.1084356, -0.4964426, -4.478243, 0, 0, 1, 1, 1,
-0.1068024, 0.2315933, -1.631806, 1, 0, 0, 1, 1,
-0.1064938, -0.004036838, -2.112247, 1, 0, 0, 1, 1,
-0.1062035, -0.4507599, -3.044788, 1, 0, 0, 1, 1,
-0.1047152, -0.366698, -3.781928, 1, 0, 0, 1, 1,
-0.1028321, -1.492242, -4.149995, 1, 0, 0, 1, 1,
-0.09682507, -1.294865, -2.121692, 0, 0, 0, 1, 1,
-0.09516065, 0.8217054, -1.308233, 0, 0, 0, 1, 1,
-0.09118211, 0.6292778, -1.008399, 0, 0, 0, 1, 1,
-0.09067973, 1.404452, 0.8161766, 0, 0, 0, 1, 1,
-0.08381177, -0.9381781, -1.368469, 0, 0, 0, 1, 1,
-0.08369494, 0.1800827, -1.335911, 0, 0, 0, 1, 1,
-0.08112109, 1.617973, 1.355369, 0, 0, 0, 1, 1,
-0.07721213, 1.414825, 0.2696268, 1, 1, 1, 1, 1,
-0.07428264, 0.2663826, -0.7940753, 1, 1, 1, 1, 1,
-0.06959113, -0.8563535, -2.384015, 1, 1, 1, 1, 1,
-0.06927308, -0.696179, -1.930811, 1, 1, 1, 1, 1,
-0.06548122, 0.5216476, 0.1886171, 1, 1, 1, 1, 1,
-0.06372208, -0.3042249, -3.289198, 1, 1, 1, 1, 1,
-0.05803151, 1.090784, 0.2663427, 1, 1, 1, 1, 1,
-0.05481379, 1.343644, 0.2372852, 1, 1, 1, 1, 1,
-0.05458495, 0.09262261, 0.1423005, 1, 1, 1, 1, 1,
-0.05324761, 0.1320332, -0.7815602, 1, 1, 1, 1, 1,
-0.04948757, -0.4585614, -4.115385, 1, 1, 1, 1, 1,
-0.04640292, -0.9235231, -3.571711, 1, 1, 1, 1, 1,
-0.0463344, 1.191231, 0.3030971, 1, 1, 1, 1, 1,
-0.04028538, 0.1858746, -0.4911696, 1, 1, 1, 1, 1,
-0.03826378, 1.511847, 0.7188894, 1, 1, 1, 1, 1,
-0.03657321, -0.6316723, -2.423804, 0, 0, 1, 1, 1,
-0.03648756, -1.161135, -1.775718, 1, 0, 0, 1, 1,
-0.03644644, 0.7715531, -1.141783, 1, 0, 0, 1, 1,
-0.03258421, 0.4581491, 0.909298, 1, 0, 0, 1, 1,
-0.02990991, -0.792462, -2.61199, 1, 0, 0, 1, 1,
-0.02870961, -0.732701, -2.334365, 1, 0, 0, 1, 1,
-0.0265831, -0.25296, -4.51645, 0, 0, 0, 1, 1,
-0.02623645, 0.2323788, -0.02728351, 0, 0, 0, 1, 1,
-0.02377946, 1.263292, -0.8976519, 0, 0, 0, 1, 1,
-0.02334024, 1.967476, 1.677611, 0, 0, 0, 1, 1,
-0.02303192, -0.6392884, -2.179986, 0, 0, 0, 1, 1,
-0.02158724, 0.5013593, 0.7823838, 0, 0, 0, 1, 1,
-0.0185976, 0.4446185, 1.753786, 0, 0, 0, 1, 1,
-0.01228384, 0.4969179, -0.07865422, 1, 1, 1, 1, 1,
-0.002028395, 1.230021, -0.3119299, 1, 1, 1, 1, 1,
0.0004746324, -0.8214175, 3.659591, 1, 1, 1, 1, 1,
0.002026769, -1.184042, 2.887484, 1, 1, 1, 1, 1,
0.005420234, -1.092634, 2.595428, 1, 1, 1, 1, 1,
0.007562361, -1.523156, 1.829819, 1, 1, 1, 1, 1,
0.01153783, 0.2792121, 0.02953352, 1, 1, 1, 1, 1,
0.02402016, -0.3162684, 1.997077, 1, 1, 1, 1, 1,
0.02663662, 0.8158894, 0.3292856, 1, 1, 1, 1, 1,
0.02705788, -0.5126773, 1.818463, 1, 1, 1, 1, 1,
0.02849379, -0.8884575, 3.412507, 1, 1, 1, 1, 1,
0.03279072, -0.4844444, 0.989576, 1, 1, 1, 1, 1,
0.0349544, 1.732525, -1.265227, 1, 1, 1, 1, 1,
0.03983523, 0.1045818, -0.8132533, 1, 1, 1, 1, 1,
0.04091602, 0.06893945, 0.5147932, 1, 1, 1, 1, 1,
0.04632983, 1.340003, -1.537827, 0, 0, 1, 1, 1,
0.04720747, 0.01453836, 1.872859, 1, 0, 0, 1, 1,
0.0486182, 0.2990633, 1.005256, 1, 0, 0, 1, 1,
0.04877263, -1.242008, 2.434836, 1, 0, 0, 1, 1,
0.05274097, -1.652496, 4.070504, 1, 0, 0, 1, 1,
0.05636328, -0.9425026, 3.617382, 1, 0, 0, 1, 1,
0.05980558, -0.3767488, 2.792333, 0, 0, 0, 1, 1,
0.07378736, -1.129688, 2.128052, 0, 0, 0, 1, 1,
0.07917331, -1.368035, 2.610131, 0, 0, 0, 1, 1,
0.08364262, -1.063597, 2.394997, 0, 0, 0, 1, 1,
0.08496942, -0.08012526, 1.731304, 0, 0, 0, 1, 1,
0.08869553, 1.161492, 2.192812, 0, 0, 0, 1, 1,
0.0911801, -0.7831957, 2.296306, 0, 0, 0, 1, 1,
0.09168443, -1.246332, 5.244834, 1, 1, 1, 1, 1,
0.09410934, 0.4113778, 2.030899, 1, 1, 1, 1, 1,
0.09472835, 1.952389, 0.3544278, 1, 1, 1, 1, 1,
0.0981317, 1.047597, 1.768551, 1, 1, 1, 1, 1,
0.1004763, -1.391992, 3.576545, 1, 1, 1, 1, 1,
0.1062342, -1.374435, 2.632324, 1, 1, 1, 1, 1,
0.1072876, -1.178422, 4.203185, 1, 1, 1, 1, 1,
0.1073272, 1.089969, 1.209981, 1, 1, 1, 1, 1,
0.1073664, 0.6996601, 0.3515055, 1, 1, 1, 1, 1,
0.1096565, 0.1679494, 0.4288667, 1, 1, 1, 1, 1,
0.1124984, 0.1859528, 2.343481, 1, 1, 1, 1, 1,
0.114572, 1.00698, 0.7921755, 1, 1, 1, 1, 1,
0.1148962, 1.22567, 0.8784277, 1, 1, 1, 1, 1,
0.1159485, 1.506304, -0.3069974, 1, 1, 1, 1, 1,
0.1174624, -1.063948, 3.581182, 1, 1, 1, 1, 1,
0.1215191, 0.7298207, 0.5873479, 0, 0, 1, 1, 1,
0.1283979, -0.4548373, 4.570924, 1, 0, 0, 1, 1,
0.1342857, -0.6863226, 3.889334, 1, 0, 0, 1, 1,
0.1446027, 0.04054252, 2.297708, 1, 0, 0, 1, 1,
0.1450436, 1.407543, -0.1960165, 1, 0, 0, 1, 1,
0.1462855, 1.075396, -0.4775665, 1, 0, 0, 1, 1,
0.1484071, -0.03067226, 2.81438, 0, 0, 0, 1, 1,
0.1489033, 0.6168076, -0.4253175, 0, 0, 0, 1, 1,
0.1500822, -0.1867149, 4.773072, 0, 0, 0, 1, 1,
0.155742, -0.7273559, 2.047739, 0, 0, 0, 1, 1,
0.1572878, 1.998274, 1.192362, 0, 0, 0, 1, 1,
0.1587076, 1.328289, 0.701817, 0, 0, 0, 1, 1,
0.1591007, 0.1539315, 1.351177, 0, 0, 0, 1, 1,
0.1599118, 0.6378574, -0.1910943, 1, 1, 1, 1, 1,
0.1624386, 0.1652887, 2.063347, 1, 1, 1, 1, 1,
0.1633969, 3.430497, -0.08293366, 1, 1, 1, 1, 1,
0.164724, 0.241935, 1.336191, 1, 1, 1, 1, 1,
0.1647271, 1.121972, -1.292598, 1, 1, 1, 1, 1,
0.1663109, -0.4856572, 1.28248, 1, 1, 1, 1, 1,
0.1697102, 2.789033, 0.5753086, 1, 1, 1, 1, 1,
0.1705252, 0.2395823, 0.3518667, 1, 1, 1, 1, 1,
0.1747914, -0.5005014, 3.180184, 1, 1, 1, 1, 1,
0.1770865, -0.1580579, 2.428348, 1, 1, 1, 1, 1,
0.1782031, -1.164151, 3.759397, 1, 1, 1, 1, 1,
0.1822875, -0.2508135, 2.859504, 1, 1, 1, 1, 1,
0.1827149, -0.4429417, 2.165173, 1, 1, 1, 1, 1,
0.1829469, 1.603158, 1.311058, 1, 1, 1, 1, 1,
0.197333, 0.9794786, 1.011672, 1, 1, 1, 1, 1,
0.1987812, 1.043225, 1.448352, 0, 0, 1, 1, 1,
0.1995702, -1.598419, 2.586051, 1, 0, 0, 1, 1,
0.2011797, 0.4924603, 0.6493903, 1, 0, 0, 1, 1,
0.2031332, 1.390892, 0.8485553, 1, 0, 0, 1, 1,
0.2045987, -1.016502, 3.899846, 1, 0, 0, 1, 1,
0.2098344, 0.6503514, 2.779358, 1, 0, 0, 1, 1,
0.2098716, -0.120652, 5.021891, 0, 0, 0, 1, 1,
0.2106125, -1.299083, 2.083519, 0, 0, 0, 1, 1,
0.2109357, -1.01327, 2.267186, 0, 0, 0, 1, 1,
0.2115445, 1.758751, -0.4668648, 0, 0, 0, 1, 1,
0.2122415, -0.007923943, 0.4936751, 0, 0, 0, 1, 1,
0.212899, -0.5806291, 3.441312, 0, 0, 0, 1, 1,
0.2164245, -0.8219973, 2.095716, 0, 0, 0, 1, 1,
0.2170562, 0.2346915, 1.727097, 1, 1, 1, 1, 1,
0.2172898, 0.8755397, 1.374659, 1, 1, 1, 1, 1,
0.2198263, -0.2444588, 1.942353, 1, 1, 1, 1, 1,
0.2232003, 0.1101365, 1.125972, 1, 1, 1, 1, 1,
0.2257948, -1.319679, 5.648482, 1, 1, 1, 1, 1,
0.2279523, -0.9346216, 3.104313, 1, 1, 1, 1, 1,
0.2279584, 1.532246, 0.2930326, 1, 1, 1, 1, 1,
0.2302811, -2.002674, 3.132143, 1, 1, 1, 1, 1,
0.2306906, -1.463688, 3.192868, 1, 1, 1, 1, 1,
0.2312894, -0.7543084, 2.053648, 1, 1, 1, 1, 1,
0.231379, -1.112961, 2.347823, 1, 1, 1, 1, 1,
0.2356138, 0.05535577, 0.1373059, 1, 1, 1, 1, 1,
0.2369514, 0.7453929, -0.2476114, 1, 1, 1, 1, 1,
0.2425962, 1.136139, -0.1907586, 1, 1, 1, 1, 1,
0.2474819, 0.6747789, 0.4902141, 1, 1, 1, 1, 1,
0.2476898, 1.207043, 0.3528613, 0, 0, 1, 1, 1,
0.2489176, -0.6037484, 4.774908, 1, 0, 0, 1, 1,
0.2529059, 0.2324361, 2.374991, 1, 0, 0, 1, 1,
0.2529108, -0.8870757, 2.368405, 1, 0, 0, 1, 1,
0.2532661, 2.250027, -0.2670567, 1, 0, 0, 1, 1,
0.2549756, -0.7886727, 3.072625, 1, 0, 0, 1, 1,
0.2583956, 0.3672692, 0.3856496, 0, 0, 0, 1, 1,
0.2615928, -0.7621824, 2.584293, 0, 0, 0, 1, 1,
0.2629816, -0.2987441, 0.2275579, 0, 0, 0, 1, 1,
0.2639431, 1.495106, 0.4953323, 0, 0, 0, 1, 1,
0.2679202, 0.5283111, 1.702299, 0, 0, 0, 1, 1,
0.2708281, 1.237684, 2.037666, 0, 0, 0, 1, 1,
0.2767831, 0.7097524, 0.1563072, 0, 0, 0, 1, 1,
0.2781423, 0.006200352, 2.200628, 1, 1, 1, 1, 1,
0.2781643, 0.132718, 0.5051376, 1, 1, 1, 1, 1,
0.2782324, 2.445484, -0.6178188, 1, 1, 1, 1, 1,
0.2791482, 0.3880951, 2.343792, 1, 1, 1, 1, 1,
0.2792333, 0.6600568, 0.4032651, 1, 1, 1, 1, 1,
0.2800004, -1.073005, 3.20037, 1, 1, 1, 1, 1,
0.2851476, 0.3027031, 0.7311841, 1, 1, 1, 1, 1,
0.2884417, 0.04928803, 0.5774483, 1, 1, 1, 1, 1,
0.2887665, -0.2425544, 2.085353, 1, 1, 1, 1, 1,
0.290125, 0.3189565, 1.285746, 1, 1, 1, 1, 1,
0.2960852, 0.6459205, 1.417122, 1, 1, 1, 1, 1,
0.2969783, 0.06311172, 0.7609926, 1, 1, 1, 1, 1,
0.2985582, 0.7531954, 0.2965713, 1, 1, 1, 1, 1,
0.3026254, -1.441066, 1.456663, 1, 1, 1, 1, 1,
0.3059072, 0.1211454, 0.1484975, 1, 1, 1, 1, 1,
0.308149, -0.3797635, 2.003654, 0, 0, 1, 1, 1,
0.3108669, 0.6315017, 1.387937, 1, 0, 0, 1, 1,
0.3117152, -0.003876525, 0.8603536, 1, 0, 0, 1, 1,
0.3134386, 2.375141, 0.3151899, 1, 0, 0, 1, 1,
0.3142955, -1.236292, 1.835043, 1, 0, 0, 1, 1,
0.3143445, -0.1522269, 3.112696, 1, 0, 0, 1, 1,
0.3226874, -0.8430721, 3.169488, 0, 0, 0, 1, 1,
0.3314961, -0.8693717, 1.319762, 0, 0, 0, 1, 1,
0.3333733, 0.07732126, 1.794737, 0, 0, 0, 1, 1,
0.3343429, 1.222167, 0.8888319, 0, 0, 0, 1, 1,
0.3343698, 0.7155574, 1.806718, 0, 0, 0, 1, 1,
0.3362805, -1.171355, 0.08075137, 0, 0, 0, 1, 1,
0.3402339, -1.379322, 3.979253, 0, 0, 0, 1, 1,
0.3429258, -0.1192756, 3.315064, 1, 1, 1, 1, 1,
0.3486108, 1.485117, 0.527246, 1, 1, 1, 1, 1,
0.3488166, -0.1159393, 2.563652, 1, 1, 1, 1, 1,
0.3514867, -0.7231345, 4.335716, 1, 1, 1, 1, 1,
0.3518584, -0.003021939, 1.381883, 1, 1, 1, 1, 1,
0.3534792, 1.764369, -0.2477031, 1, 1, 1, 1, 1,
0.3569809, 0.02589666, 1.128822, 1, 1, 1, 1, 1,
0.3583005, -0.9684078, 4.222547, 1, 1, 1, 1, 1,
0.3601836, 1.09592, 0.8661429, 1, 1, 1, 1, 1,
0.3610592, -0.4956453, 2.791731, 1, 1, 1, 1, 1,
0.3637139, 1.516575, -0.4574812, 1, 1, 1, 1, 1,
0.3662475, 0.7235497, -0.3589019, 1, 1, 1, 1, 1,
0.3685854, 0.5881798, 0.02116277, 1, 1, 1, 1, 1,
0.3698271, 0.5606055, 2.859053, 1, 1, 1, 1, 1,
0.3736183, 1.219314, 0.4390092, 1, 1, 1, 1, 1,
0.3842809, -0.571594, 1.954217, 0, 0, 1, 1, 1,
0.3874123, -0.9437999, 2.949187, 1, 0, 0, 1, 1,
0.3916916, -0.2701371, 0.5807949, 1, 0, 0, 1, 1,
0.3922344, 1.185476, 0.8517396, 1, 0, 0, 1, 1,
0.392854, -0.7846236, 2.662624, 1, 0, 0, 1, 1,
0.3958718, -1.305048, 1.378918, 1, 0, 0, 1, 1,
0.3981232, 0.2851697, 0.1529744, 0, 0, 0, 1, 1,
0.4027387, -1.496713, 1.922514, 0, 0, 0, 1, 1,
0.4063036, -0.2758917, 1.352825, 0, 0, 0, 1, 1,
0.4065991, -0.07530077, 2.636546, 0, 0, 0, 1, 1,
0.4076756, -1.022493, 4.491067, 0, 0, 0, 1, 1,
0.4084291, -0.1650715, 1.068829, 0, 0, 0, 1, 1,
0.4099412, 0.1457057, 0.9574688, 0, 0, 0, 1, 1,
0.4100945, -0.8249968, 3.202569, 1, 1, 1, 1, 1,
0.411371, -0.136868, 1.387208, 1, 1, 1, 1, 1,
0.414427, 0.7146562, 0.009115889, 1, 1, 1, 1, 1,
0.4160432, -0.4212989, 1.736575, 1, 1, 1, 1, 1,
0.4189642, -0.9165335, 3.634428, 1, 1, 1, 1, 1,
0.4203344, 1.086368, 0.5277938, 1, 1, 1, 1, 1,
0.4296388, 0.4279762, 1.94248, 1, 1, 1, 1, 1,
0.4322847, -0.5127335, 2.719051, 1, 1, 1, 1, 1,
0.4329956, -0.004601233, 0.6672457, 1, 1, 1, 1, 1,
0.4336021, 0.5145407, 1.807952, 1, 1, 1, 1, 1,
0.433889, 1.878361, 2.255055, 1, 1, 1, 1, 1,
0.436027, 0.12051, 0.6294357, 1, 1, 1, 1, 1,
0.44078, 1.655668, -0.7722266, 1, 1, 1, 1, 1,
0.4414415, 0.04825218, 2.070847, 1, 1, 1, 1, 1,
0.4463658, 0.5364981, -0.1967209, 1, 1, 1, 1, 1,
0.4465137, 0.4385819, 1.089981, 0, 0, 1, 1, 1,
0.4471, 1.117152, -0.1817057, 1, 0, 0, 1, 1,
0.4514616, -1.552875, 1.549811, 1, 0, 0, 1, 1,
0.4549324, 2.215827, -0.515195, 1, 0, 0, 1, 1,
0.4609923, -1.352657, 3.571539, 1, 0, 0, 1, 1,
0.4668347, -0.8025991, 1.516745, 1, 0, 0, 1, 1,
0.4689187, 0.8724993, -0.03956309, 0, 0, 0, 1, 1,
0.4709701, 0.5475644, 0.1144211, 0, 0, 0, 1, 1,
0.4712602, -1.459335, 2.985218, 0, 0, 0, 1, 1,
0.4725635, -0.00962179, 1.491404, 0, 0, 0, 1, 1,
0.4735105, 0.06392206, 0.4997256, 0, 0, 0, 1, 1,
0.4891932, 0.6808063, -1.093281, 0, 0, 0, 1, 1,
0.4894379, 1.607518, 0.5380178, 0, 0, 0, 1, 1,
0.4970461, 0.1373975, 0.5952973, 1, 1, 1, 1, 1,
0.4985051, 0.06904213, 1.705397, 1, 1, 1, 1, 1,
0.4991476, 0.8170492, -0.6682325, 1, 1, 1, 1, 1,
0.5020965, 1.347893, -1.614588, 1, 1, 1, 1, 1,
0.5031974, 1.981821, 0.6066598, 1, 1, 1, 1, 1,
0.5057151, 0.1532446, -0.08072057, 1, 1, 1, 1, 1,
0.5084479, 0.8957242, 0.534434, 1, 1, 1, 1, 1,
0.5090997, 0.6234813, 0.9806041, 1, 1, 1, 1, 1,
0.5151767, 0.9019935, 2.346717, 1, 1, 1, 1, 1,
0.5182052, 2.034623, -1.145125, 1, 1, 1, 1, 1,
0.5188664, 1.627115, -0.5833105, 1, 1, 1, 1, 1,
0.5236992, -0.03221897, -0.2163839, 1, 1, 1, 1, 1,
0.5239298, -0.229566, 0.1222303, 1, 1, 1, 1, 1,
0.5256334, -0.1082015, 3.582644, 1, 1, 1, 1, 1,
0.5284213, -1.805664, 4.63723, 1, 1, 1, 1, 1,
0.5290269, -0.610333, 3.190472, 0, 0, 1, 1, 1,
0.5307711, -0.7643857, 1.237947, 1, 0, 0, 1, 1,
0.5361664, -0.2967642, 1.722316, 1, 0, 0, 1, 1,
0.5368512, -1.120591, 3.714283, 1, 0, 0, 1, 1,
0.5378644, -0.05483865, 0.9567772, 1, 0, 0, 1, 1,
0.5440745, -0.1424716, 2.100024, 1, 0, 0, 1, 1,
0.54557, 0.1300144, 1.204744, 0, 0, 0, 1, 1,
0.5502684, -0.9217185, 1.635954, 0, 0, 0, 1, 1,
0.550401, 0.4486856, -1.203017, 0, 0, 0, 1, 1,
0.5551743, -0.136895, 1.10803, 0, 0, 0, 1, 1,
0.5556462, -2.408865, 3.644773, 0, 0, 0, 1, 1,
0.5589524, -0.6632913, 2.612128, 0, 0, 0, 1, 1,
0.5603101, -0.9359581, 3.283621, 0, 0, 0, 1, 1,
0.5616493, -1.266228, 2.450849, 1, 1, 1, 1, 1,
0.5690891, 0.2142948, 0.2301157, 1, 1, 1, 1, 1,
0.5698305, 1.011702, -0.01586155, 1, 1, 1, 1, 1,
0.5723046, -2.082575, 3.865678, 1, 1, 1, 1, 1,
0.5728558, -0.2052647, 1.912489, 1, 1, 1, 1, 1,
0.5758752, -1.511947, 3.211534, 1, 1, 1, 1, 1,
0.5759582, 0.04984744, 1.469197, 1, 1, 1, 1, 1,
0.5762743, 0.3100618, 1.359679, 1, 1, 1, 1, 1,
0.5789075, 0.1637822, -0.8885171, 1, 1, 1, 1, 1,
0.5799091, 1.938077, 1.074011, 1, 1, 1, 1, 1,
0.5801227, -0.772734, 3.113304, 1, 1, 1, 1, 1,
0.5825217, 0.187007, 0.6625661, 1, 1, 1, 1, 1,
0.5827719, -0.5668539, 3.550238, 1, 1, 1, 1, 1,
0.586295, 0.776432, 0.8620564, 1, 1, 1, 1, 1,
0.5902157, -1.335707, 3.632278, 1, 1, 1, 1, 1,
0.5928014, -0.3716241, 3.373078, 0, 0, 1, 1, 1,
0.5979523, -1.749761, 1.812217, 1, 0, 0, 1, 1,
0.5995467, -0.4717326, 1.470026, 1, 0, 0, 1, 1,
0.6010286, 0.1432605, 0.950601, 1, 0, 0, 1, 1,
0.6027627, -2.099508, 0.972668, 1, 0, 0, 1, 1,
0.6059682, 1.166294, 0.2099889, 1, 0, 0, 1, 1,
0.6087887, -0.8274637, 2.520672, 0, 0, 0, 1, 1,
0.6173866, 1.281179, -1.00956, 0, 0, 0, 1, 1,
0.6177633, -1.1403, 1.536741, 0, 0, 0, 1, 1,
0.6258122, -1.006872, 2.235499, 0, 0, 0, 1, 1,
0.6335101, 0.1634935, 2.336786, 0, 0, 0, 1, 1,
0.6391442, -0.06867989, 0.7037251, 0, 0, 0, 1, 1,
0.6462802, -0.3779691, 2.225468, 0, 0, 0, 1, 1,
0.6487485, -0.4302053, 1.194682, 1, 1, 1, 1, 1,
0.649027, -0.1394683, 3.378666, 1, 1, 1, 1, 1,
0.649766, -1.297748, 2.753108, 1, 1, 1, 1, 1,
0.6552181, 0.5547975, -1.151404, 1, 1, 1, 1, 1,
0.6584576, -1.554405, 2.195868, 1, 1, 1, 1, 1,
0.6619799, 0.980413, 0.2326506, 1, 1, 1, 1, 1,
0.6624259, 2.190381, -0.2028952, 1, 1, 1, 1, 1,
0.6649299, -1.077656, 3.216083, 1, 1, 1, 1, 1,
0.6658249, 1.21875, -0.08786515, 1, 1, 1, 1, 1,
0.6855772, 0.9283327, 1.660767, 1, 1, 1, 1, 1,
0.6939582, -0.6488505, 2.602902, 1, 1, 1, 1, 1,
0.6958491, 0.001017128, 2.358905, 1, 1, 1, 1, 1,
0.6974181, -0.7776866, 1.199123, 1, 1, 1, 1, 1,
0.6991383, 1.100328, 1.517036, 1, 1, 1, 1, 1,
0.701229, -1.084696, 3.725861, 1, 1, 1, 1, 1,
0.7016105, 0.3006923, 3.420147, 0, 0, 1, 1, 1,
0.7027283, 0.9853262, 0.2398572, 1, 0, 0, 1, 1,
0.7034457, -0.01334359, -0.02272178, 1, 0, 0, 1, 1,
0.7042579, 0.7534809, -0.4661893, 1, 0, 0, 1, 1,
0.7064188, 0.356514, 2.487354, 1, 0, 0, 1, 1,
0.7073225, -0.3716121, 1.788804, 1, 0, 0, 1, 1,
0.7080449, -0.2858731, 1.571659, 0, 0, 0, 1, 1,
0.7087826, 1.564276, 1.073376, 0, 0, 0, 1, 1,
0.7097312, -2.15133, 2.306575, 0, 0, 0, 1, 1,
0.7119452, 0.06269389, 2.002752, 0, 0, 0, 1, 1,
0.7127742, -1.411653, 1.29156, 0, 0, 0, 1, 1,
0.7156492, -2.344971, 2.056059, 0, 0, 0, 1, 1,
0.7225761, 0.872696, 2.873236, 0, 0, 0, 1, 1,
0.7241802, 0.4551749, 1.069447, 1, 1, 1, 1, 1,
0.7245396, 1.354194, -0.06048504, 1, 1, 1, 1, 1,
0.7249859, 0.9908798, -1.030584, 1, 1, 1, 1, 1,
0.7272868, 2.245993, -0.2786215, 1, 1, 1, 1, 1,
0.7275583, 0.5784519, 2.426138, 1, 1, 1, 1, 1,
0.734849, 0.2768811, 2.432132, 1, 1, 1, 1, 1,
0.7472426, 0.5851819, 0.8147015, 1, 1, 1, 1, 1,
0.7519228, 1.435865, 0.4094258, 1, 1, 1, 1, 1,
0.7643512, 1.301563, -1.191874, 1, 1, 1, 1, 1,
0.7679774, -0.2537336, 3.788375, 1, 1, 1, 1, 1,
0.7689412, -0.4765745, 2.359783, 1, 1, 1, 1, 1,
0.7777153, 0.7601196, 1.035181, 1, 1, 1, 1, 1,
0.7804297, -0.4787853, 2.508039, 1, 1, 1, 1, 1,
0.7839425, 1.031585, 1.322064, 1, 1, 1, 1, 1,
0.7849427, -1.783265, 3.572424, 1, 1, 1, 1, 1,
0.784991, 0.3043259, 0.7946674, 0, 0, 1, 1, 1,
0.791322, -0.7458681, 1.862716, 1, 0, 0, 1, 1,
0.7972162, -1.791812, 3.078348, 1, 0, 0, 1, 1,
0.7972897, 0.3222872, 2.625915, 1, 0, 0, 1, 1,
0.8013965, 1.710697, -0.5679328, 1, 0, 0, 1, 1,
0.8098849, -1.307748, 4.292001, 1, 0, 0, 1, 1,
0.8206107, 1.22651, -0.9575547, 0, 0, 0, 1, 1,
0.8440849, -0.3982921, 0.4440863, 0, 0, 0, 1, 1,
0.8459901, -0.08946437, 0.5015674, 0, 0, 0, 1, 1,
0.8494062, -1.628381, 1.882648, 0, 0, 0, 1, 1,
0.8502968, 0.06498344, 1.176834, 0, 0, 0, 1, 1,
0.8541098, -1.591364, 3.521876, 0, 0, 0, 1, 1,
0.8554211, 0.3252258, 0.7514902, 0, 0, 0, 1, 1,
0.8582187, 0.4223286, 0.3933404, 1, 1, 1, 1, 1,
0.8594492, -1.386728, 1.575052, 1, 1, 1, 1, 1,
0.8633096, -0.003957081, 1.617695, 1, 1, 1, 1, 1,
0.866802, 0.1045058, 1.045643, 1, 1, 1, 1, 1,
0.870374, -1.219275, 2.897575, 1, 1, 1, 1, 1,
0.8714837, 0.7347846, 3.305884, 1, 1, 1, 1, 1,
0.8724183, -1.640784, 3.980746, 1, 1, 1, 1, 1,
0.8754594, -1.194495, 3.693831, 1, 1, 1, 1, 1,
0.8761171, 1.675452, 1.556369, 1, 1, 1, 1, 1,
0.8767001, 1.469807, 1.710023, 1, 1, 1, 1, 1,
0.8786098, -1.163772, 1.704082, 1, 1, 1, 1, 1,
0.8793672, 1.923724, 0.8184496, 1, 1, 1, 1, 1,
0.8794172, 1.430765, 1.13325, 1, 1, 1, 1, 1,
0.8818828, -0.02483017, 1.330642, 1, 1, 1, 1, 1,
0.8823009, -0.09954091, -0.06134975, 1, 1, 1, 1, 1,
0.8829454, 1.9832, 1.656407, 0, 0, 1, 1, 1,
0.8834629, -0.08881224, 2.770365, 1, 0, 0, 1, 1,
0.8862509, 0.3321584, 0.00162471, 1, 0, 0, 1, 1,
0.8893591, -0.8704008, 2.899798, 1, 0, 0, 1, 1,
0.8927147, 0.4007075, 2.494399, 1, 0, 0, 1, 1,
0.8956624, 1.369296, 0.7315002, 1, 0, 0, 1, 1,
0.896706, 2.179241, 0.9811681, 0, 0, 0, 1, 1,
0.8967513, -0.4344302, 0.2201485, 0, 0, 0, 1, 1,
0.8968967, -0.05775416, 1.52273, 0, 0, 0, 1, 1,
0.8974867, -1.573311, 1.51054, 0, 0, 0, 1, 1,
0.9019573, 0.08675157, 1.6387, 0, 0, 0, 1, 1,
0.9065628, 0.3574044, 1.680852, 0, 0, 0, 1, 1,
0.912571, -1.533444, 2.355304, 0, 0, 0, 1, 1,
0.9127634, 0.5699521, -0.2664958, 1, 1, 1, 1, 1,
0.9182522, -1.637496, 3.128093, 1, 1, 1, 1, 1,
0.9201366, -0.3700303, 2.381642, 1, 1, 1, 1, 1,
0.9289809, 0.00475973, 0.4928765, 1, 1, 1, 1, 1,
0.9307915, -0.5035776, 1.082699, 1, 1, 1, 1, 1,
0.9321347, 1.542385, 0.04810086, 1, 1, 1, 1, 1,
0.9331105, -1.260267, 0.410435, 1, 1, 1, 1, 1,
0.9391905, -2.484704, 3.275386, 1, 1, 1, 1, 1,
0.9471217, -2.37068, 4.871465, 1, 1, 1, 1, 1,
0.9514782, 0.86146, 0.9558407, 1, 1, 1, 1, 1,
0.9521607, 0.1988398, 1.521549, 1, 1, 1, 1, 1,
0.9544256, 0.7944086, -0.3206952, 1, 1, 1, 1, 1,
0.9603655, 0.09456546, 1.143322, 1, 1, 1, 1, 1,
0.9668041, 1.115024, 1.424138, 1, 1, 1, 1, 1,
0.9706399, -0.6695787, 1.964118, 1, 1, 1, 1, 1,
0.9748352, -0.7616401, 1.87272, 0, 0, 1, 1, 1,
0.9801177, -0.2434701, 1.890465, 1, 0, 0, 1, 1,
0.9814298, -0.07854691, 2.312003, 1, 0, 0, 1, 1,
0.9875675, -1.916688, 3.276881, 1, 0, 0, 1, 1,
0.9883602, 0.6781647, -0.4350934, 1, 0, 0, 1, 1,
0.9897463, -1.056847, 1.995025, 1, 0, 0, 1, 1,
0.993405, 1.217534, 1.240777, 0, 0, 0, 1, 1,
0.9983827, 0.9321613, 1.274978, 0, 0, 0, 1, 1,
1.005613, 0.2026533, 1.654302, 0, 0, 0, 1, 1,
1.008026, 1.204132, 0.2203079, 0, 0, 0, 1, 1,
1.008154, 0.7737347, 0.2537093, 0, 0, 0, 1, 1,
1.01924, 0.4430036, 0.1710854, 0, 0, 0, 1, 1,
1.023291, 2.030557, 0.8347911, 0, 0, 0, 1, 1,
1.024958, 0.6331053, 2.24514, 1, 1, 1, 1, 1,
1.03846, 0.9569647, 0.110434, 1, 1, 1, 1, 1,
1.040759, 1.1152, 1.957983, 1, 1, 1, 1, 1,
1.041024, -0.8227477, 1.485691, 1, 1, 1, 1, 1,
1.044485, 0.9423869, 1.919641, 1, 1, 1, 1, 1,
1.060458, -0.6038889, 1.498653, 1, 1, 1, 1, 1,
1.060993, 0.09059982, 1.587943, 1, 1, 1, 1, 1,
1.061995, -0.5769242, 2.801042, 1, 1, 1, 1, 1,
1.068128, 0.1281275, 0.4469673, 1, 1, 1, 1, 1,
1.0733, -0.6975809, 2.110323, 1, 1, 1, 1, 1,
1.07341, 0.3682224, 1.736002, 1, 1, 1, 1, 1,
1.080752, 0.6091034, 0.4495725, 1, 1, 1, 1, 1,
1.087173, 1.643027, -0.6414565, 1, 1, 1, 1, 1,
1.09025, 0.4571005, 1.495005, 1, 1, 1, 1, 1,
1.101674, -1.220474, 2.38226, 1, 1, 1, 1, 1,
1.104044, -0.1545786, 3.001501, 0, 0, 1, 1, 1,
1.106549, -0.6615353, 1.946658, 1, 0, 0, 1, 1,
1.115249, -0.9427695, 3.041011, 1, 0, 0, 1, 1,
1.117426, -1.474573, 3.009971, 1, 0, 0, 1, 1,
1.117746, 0.5181281, 1.228441, 1, 0, 0, 1, 1,
1.12174, 0.3594153, 1.6744, 1, 0, 0, 1, 1,
1.122274, 0.8461521, 0.9361845, 0, 0, 0, 1, 1,
1.1283, -3.058232, 1.961305, 0, 0, 0, 1, 1,
1.1365, 0.3176212, -0.1329307, 0, 0, 0, 1, 1,
1.139368, -0.4397629, 0.09325464, 0, 0, 0, 1, 1,
1.145417, -0.2721398, 1.930585, 0, 0, 0, 1, 1,
1.151792, -0.4211446, 1.376174, 0, 0, 0, 1, 1,
1.152836, 2.088756, -1.186033, 0, 0, 0, 1, 1,
1.153677, -0.2520144, 1.308616, 1, 1, 1, 1, 1,
1.161058, 1.877848, 1.028957, 1, 1, 1, 1, 1,
1.168155, -0.4852109, 3.814219, 1, 1, 1, 1, 1,
1.177726, -0.1395202, 3.664325, 1, 1, 1, 1, 1,
1.180143, -1.260993, 3.302415, 1, 1, 1, 1, 1,
1.184591, 1.404609, 0.2514828, 1, 1, 1, 1, 1,
1.189456, -0.8258883, 2.974356, 1, 1, 1, 1, 1,
1.191755, 3.179154, -0.3074722, 1, 1, 1, 1, 1,
1.19455, 0.9673444, 0.6756618, 1, 1, 1, 1, 1,
1.20792, 0.4137947, 0.2326202, 1, 1, 1, 1, 1,
1.213311, 1.270953, 1.46461, 1, 1, 1, 1, 1,
1.217831, -0.5293549, 1.791023, 1, 1, 1, 1, 1,
1.226305, -0.9782409, 3.650379, 1, 1, 1, 1, 1,
1.246149, -0.04495936, 0.8050567, 1, 1, 1, 1, 1,
1.246536, 1.383501, 0.384623, 1, 1, 1, 1, 1,
1.247921, -1.888401, 3.545212, 0, 0, 1, 1, 1,
1.252267, -0.2531938, 2.556785, 1, 0, 0, 1, 1,
1.262169, -0.5619659, 3.899704, 1, 0, 0, 1, 1,
1.277075, -0.160152, 2.207091, 1, 0, 0, 1, 1,
1.27888, 1.11897, 0.6550256, 1, 0, 0, 1, 1,
1.282108, 0.8366533, 0.662806, 1, 0, 0, 1, 1,
1.286142, 0.2187551, 0.1082247, 0, 0, 0, 1, 1,
1.300524, 2.541567, -0.06192083, 0, 0, 0, 1, 1,
1.306709, -3.558537, 2.743686, 0, 0, 0, 1, 1,
1.323726, -0.8431622, 2.401056, 0, 0, 0, 1, 1,
1.3267, 0.3166637, 1.864042, 0, 0, 0, 1, 1,
1.338651, -0.08358529, 2.260332, 0, 0, 0, 1, 1,
1.340087, 1.459466, 1.915544, 0, 0, 0, 1, 1,
1.34199, 0.2651865, 1.989095, 1, 1, 1, 1, 1,
1.349097, -1.154443, 1.650794, 1, 1, 1, 1, 1,
1.354529, 0.3772583, 2.120193, 1, 1, 1, 1, 1,
1.356089, 2.038856, 0.4956308, 1, 1, 1, 1, 1,
1.362304, -0.2880691, 1.639405, 1, 1, 1, 1, 1,
1.364198, -0.7956873, 2.434484, 1, 1, 1, 1, 1,
1.364446, -1.211563, 1.743439, 1, 1, 1, 1, 1,
1.366294, -1.109602, 3.769363, 1, 1, 1, 1, 1,
1.369769, -0.3121805, 2.376474, 1, 1, 1, 1, 1,
1.375932, 1.275528, -0.3035911, 1, 1, 1, 1, 1,
1.378225, -0.5895129, 3.450348, 1, 1, 1, 1, 1,
1.380499, 0.2759764, 0.1293837, 1, 1, 1, 1, 1,
1.380684, -0.2300259, 3.90785, 1, 1, 1, 1, 1,
1.386306, 0.695179, 0.9860249, 1, 1, 1, 1, 1,
1.389495, -0.9049233, 1.982631, 1, 1, 1, 1, 1,
1.39871, -0.3775859, 3.363528, 0, 0, 1, 1, 1,
1.404311, 0.7783061, -0.16646, 1, 0, 0, 1, 1,
1.407585, 0.7119355, 0.9716371, 1, 0, 0, 1, 1,
1.437065, -0.7332698, 0.7946261, 1, 0, 0, 1, 1,
1.442364, 0.5111025, 1.867871, 1, 0, 0, 1, 1,
1.449887, 1.013335, -0.467281, 1, 0, 0, 1, 1,
1.453755, -1.06705, 1.650052, 0, 0, 0, 1, 1,
1.456837, 0.8154321, -1.327451, 0, 0, 0, 1, 1,
1.457282, 1.142147, 0.7712035, 0, 0, 0, 1, 1,
1.460615, 1.636177, -0.2711513, 0, 0, 0, 1, 1,
1.469302, 0.9483702, 1.257763, 0, 0, 0, 1, 1,
1.473791, -1.07305, 1.662186, 0, 0, 0, 1, 1,
1.477017, 0.9059762, 1.442284, 0, 0, 0, 1, 1,
1.479866, 0.6316493, 2.002752, 1, 1, 1, 1, 1,
1.530702, -0.4082285, 0.3677337, 1, 1, 1, 1, 1,
1.541285, -0.7405879, 2.41343, 1, 1, 1, 1, 1,
1.542815, -0.437919, 2.320089, 1, 1, 1, 1, 1,
1.549308, 0.8599141, 1.673312, 1, 1, 1, 1, 1,
1.573335, 0.9686648, 1.066701, 1, 1, 1, 1, 1,
1.575465, 0.1653561, 0.8669054, 1, 1, 1, 1, 1,
1.578882, -1.433701, 4.026321, 1, 1, 1, 1, 1,
1.582929, -1.291246, 2.934386, 1, 1, 1, 1, 1,
1.586549, 1.082923, 0.1787777, 1, 1, 1, 1, 1,
1.596184, -2.028503, 1.529591, 1, 1, 1, 1, 1,
1.609954, -1.431061, 0.4111739, 1, 1, 1, 1, 1,
1.618114, 0.8340231, 0.4747022, 1, 1, 1, 1, 1,
1.633318, 0.1874611, 1.270277, 1, 1, 1, 1, 1,
1.642832, -0.3987907, 1.601925, 1, 1, 1, 1, 1,
1.648937, 1.074456, 0.2648439, 0, 0, 1, 1, 1,
1.654646, -1.940966, 3.961761, 1, 0, 0, 1, 1,
1.671554, 0.4267506, -1.504369, 1, 0, 0, 1, 1,
1.671984, 0.01294051, 0.6533163, 1, 0, 0, 1, 1,
1.676681, -1.113593, 1.434317, 1, 0, 0, 1, 1,
1.678079, 0.1946487, 1.957128, 1, 0, 0, 1, 1,
1.688186, -0.01552291, -0.7877331, 0, 0, 0, 1, 1,
1.693724, -0.6944605, 2.597258, 0, 0, 0, 1, 1,
1.711036, -0.8362377, -0.08586995, 0, 0, 0, 1, 1,
1.722593, -0.1524328, 0.2164222, 0, 0, 0, 1, 1,
1.727144, -0.7195082, 2.766016, 0, 0, 0, 1, 1,
1.735377, 1.983139, 1.621052, 0, 0, 0, 1, 1,
1.752885, -0.4707813, 0.7562336, 0, 0, 0, 1, 1,
1.755657, -0.04972734, 1.819935, 1, 1, 1, 1, 1,
1.767135, -0.2694649, 1.222966, 1, 1, 1, 1, 1,
1.768005, 0.8680778, 2.837369, 1, 1, 1, 1, 1,
1.778813, -1.050385, 3.423642, 1, 1, 1, 1, 1,
1.780414, -0.1508093, 2.107413, 1, 1, 1, 1, 1,
1.787186, 0.1011441, 2.930582, 1, 1, 1, 1, 1,
1.819613, -3.729903, 2.379882, 1, 1, 1, 1, 1,
1.830342, -1.804354, 2.164479, 1, 1, 1, 1, 1,
1.864111, -0.613624, 2.471699, 1, 1, 1, 1, 1,
1.875553, 1.194178, 0.4836744, 1, 1, 1, 1, 1,
1.890878, 1.747862, -0.6348117, 1, 1, 1, 1, 1,
1.895179, -1.492606, 3.538417, 1, 1, 1, 1, 1,
1.905561, -1.168172, 2.029897, 1, 1, 1, 1, 1,
1.932391, -0.9343591, 1.528301, 1, 1, 1, 1, 1,
1.979664, -1.03191, 2.867051, 1, 1, 1, 1, 1,
2.014041, -0.704306, 0.7847103, 0, 0, 1, 1, 1,
2.021566, -0.3575042, 1.616173, 1, 0, 0, 1, 1,
2.072854, -0.2767462, 1.024604, 1, 0, 0, 1, 1,
2.07817, 3.241148, 1.912558, 1, 0, 0, 1, 1,
2.117088, -1.187575, 0.3397855, 1, 0, 0, 1, 1,
2.132998, -0.8750407, 2.438086, 1, 0, 0, 1, 1,
2.133627, -0.7438827, 3.884492, 0, 0, 0, 1, 1,
2.147443, -0.08855057, 1.437535, 0, 0, 0, 1, 1,
2.187266, 0.6730739, 2.702987, 0, 0, 0, 1, 1,
2.200279, 0.1329235, 3.078723, 0, 0, 0, 1, 1,
2.249975, -0.6374664, 2.397271, 0, 0, 0, 1, 1,
2.28998, 0.2563463, 3.515864, 0, 0, 0, 1, 1,
2.380059, 0.1019967, 0.06127865, 0, 0, 0, 1, 1,
2.437994, 0.06446788, 1.513649, 1, 1, 1, 1, 1,
2.56637, 0.6268846, 0.660528, 1, 1, 1, 1, 1,
2.651851, 0.04965127, 4.756019, 1, 1, 1, 1, 1,
2.817008, 1.247284, 2.314039, 1, 1, 1, 1, 1,
2.835439, -2.150279, 0.9095517, 1, 1, 1, 1, 1,
3.006585, 1.352834, 2.301332, 1, 1, 1, 1, 1,
3.022547, 0.8263392, -0.1940526, 1, 1, 1, 1, 1
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
var radius = 10.34901;
var distance = 36.35045;
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
mvMatrix.translate( 0.05742002, 0.04181981, 0.4147873 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.35045);
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
