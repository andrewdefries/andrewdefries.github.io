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
-3.346042, 2.655922, -0.4442411, 1, 0, 0, 1,
-3.18003, -0.4789115, -0.7139723, 1, 0.007843138, 0, 1,
-2.981243, 0.4079049, -3.424434, 1, 0.01176471, 0, 1,
-2.961208, -1.067729, -0.2503186, 1, 0.01960784, 0, 1,
-2.870774, 0.08009798, -0.6135615, 1, 0.02352941, 0, 1,
-2.7232, 0.4377455, -1.14057, 1, 0.03137255, 0, 1,
-2.400512, 0.1875549, -1.380209, 1, 0.03529412, 0, 1,
-2.316452, -0.8416928, -1.809883, 1, 0.04313726, 0, 1,
-2.293662, 0.4697978, -0.1757537, 1, 0.04705882, 0, 1,
-2.288244, 1.264068, -0.7915736, 1, 0.05490196, 0, 1,
-2.235943, 1.114974, -1.0768, 1, 0.05882353, 0, 1,
-2.217553, 0.401542, 0.02038959, 1, 0.06666667, 0, 1,
-2.200285, -0.2178478, -2.705941, 1, 0.07058824, 0, 1,
-2.193295, 0.675279, -0.9125797, 1, 0.07843138, 0, 1,
-2.166492, 0.9973515, -1.10067, 1, 0.08235294, 0, 1,
-2.165032, 0.6929529, -1.836791, 1, 0.09019608, 0, 1,
-2.164801, 0.02559757, -3.078332, 1, 0.09411765, 0, 1,
-2.15715, 0.7834632, -0.3877559, 1, 0.1019608, 0, 1,
-2.142567, 0.3346221, 0.6179612, 1, 0.1098039, 0, 1,
-2.105388, -1.277505, -2.39656, 1, 0.1137255, 0, 1,
-2.088114, -1.033266, -0.6048424, 1, 0.1215686, 0, 1,
-2.083772, 0.03428778, -1.704151, 1, 0.1254902, 0, 1,
-2.077456, -0.9301049, -1.527325, 1, 0.1333333, 0, 1,
-2.069982, 0.9075603, -0.9558277, 1, 0.1372549, 0, 1,
-2.01014, 1.272682, 1.358681, 1, 0.145098, 0, 1,
-1.982313, -0.9287621, -1.889921, 1, 0.1490196, 0, 1,
-1.938489, -0.2382012, -2.134561, 1, 0.1568628, 0, 1,
-1.936511, -1.180229, -0.9376442, 1, 0.1607843, 0, 1,
-1.923125, -0.7972842, -1.400418, 1, 0.1686275, 0, 1,
-1.89436, 0.09669281, -2.888924, 1, 0.172549, 0, 1,
-1.886764, 0.8635843, -3.396918, 1, 0.1803922, 0, 1,
-1.87759, -1.969077, -3.524117, 1, 0.1843137, 0, 1,
-1.867584, 0.02197411, -4.638564, 1, 0.1921569, 0, 1,
-1.836232, -0.2070531, -3.45376, 1, 0.1960784, 0, 1,
-1.828378, 0.6186513, 0.7774123, 1, 0.2039216, 0, 1,
-1.791863, 0.7882513, -0.3732527, 1, 0.2117647, 0, 1,
-1.766618, 1.592466, -0.2229243, 1, 0.2156863, 0, 1,
-1.756188, 0.05254949, -0.7181315, 1, 0.2235294, 0, 1,
-1.751825, -0.9490044, -3.167837, 1, 0.227451, 0, 1,
-1.735453, -0.3064967, -1.756504, 1, 0.2352941, 0, 1,
-1.721373, 0.6861671, -0.7099316, 1, 0.2392157, 0, 1,
-1.699409, -1.97614, -2.630039, 1, 0.2470588, 0, 1,
-1.68171, 0.5634237, -1.934441, 1, 0.2509804, 0, 1,
-1.675971, 0.9067494, -1.04567, 1, 0.2588235, 0, 1,
-1.664237, 1.24528, -0.4624727, 1, 0.2627451, 0, 1,
-1.652967, -0.8860728, -2.233238, 1, 0.2705882, 0, 1,
-1.644319, -0.1719337, -1.16895, 1, 0.2745098, 0, 1,
-1.641666, -0.2940537, -0.6146978, 1, 0.282353, 0, 1,
-1.621503, -0.3322068, -1.300158, 1, 0.2862745, 0, 1,
-1.616095, 0.9787002, -1.720121, 1, 0.2941177, 0, 1,
-1.613979, 1.079423, -0.9741878, 1, 0.3019608, 0, 1,
-1.612366, -1.018171, -3.53251, 1, 0.3058824, 0, 1,
-1.607904, -0.3504421, -1.21805, 1, 0.3137255, 0, 1,
-1.603549, 0.9177011, -0.4098619, 1, 0.3176471, 0, 1,
-1.574351, -1.361995, -1.59614, 1, 0.3254902, 0, 1,
-1.572219, 0.228975, -1.551993, 1, 0.3294118, 0, 1,
-1.564539, -1.279916, -2.602283, 1, 0.3372549, 0, 1,
-1.563398, 0.3615447, -0.384285, 1, 0.3411765, 0, 1,
-1.554544, -0.3834997, -3.103771, 1, 0.3490196, 0, 1,
-1.546808, -0.6148603, -2.156344, 1, 0.3529412, 0, 1,
-1.546203, 0.641123, -0.7367441, 1, 0.3607843, 0, 1,
-1.536658, -0.4777956, -2.066363, 1, 0.3647059, 0, 1,
-1.501969, -0.3732445, -1.889799, 1, 0.372549, 0, 1,
-1.501269, 0.5419421, -2.109684, 1, 0.3764706, 0, 1,
-1.499478, -0.4774454, -0.9237373, 1, 0.3843137, 0, 1,
-1.485335, 0.4439335, 0.0235035, 1, 0.3882353, 0, 1,
-1.484924, -0.6298684, -2.456853, 1, 0.3960784, 0, 1,
-1.481364, 1.33091, -2.899746, 1, 0.4039216, 0, 1,
-1.466335, 1.160796, -1.954981, 1, 0.4078431, 0, 1,
-1.461839, -0.144582, -0.5640376, 1, 0.4156863, 0, 1,
-1.460159, 0.6756982, -0.3780652, 1, 0.4196078, 0, 1,
-1.459213, -1.837098, -0.6280944, 1, 0.427451, 0, 1,
-1.459173, -1.253142, -1.792954, 1, 0.4313726, 0, 1,
-1.458685, -0.5064497, -2.257576, 1, 0.4392157, 0, 1,
-1.438244, -1.098819, -2.376562, 1, 0.4431373, 0, 1,
-1.42319, -1.663873, -3.23934, 1, 0.4509804, 0, 1,
-1.421772, -1.851105, -2.578033, 1, 0.454902, 0, 1,
-1.417817, -0.04957372, -0.07358505, 1, 0.4627451, 0, 1,
-1.410385, -1.613199, -2.230505, 1, 0.4666667, 0, 1,
-1.399575, 0.5782328, -1.450261, 1, 0.4745098, 0, 1,
-1.372426, 0.4428517, -2.605184, 1, 0.4784314, 0, 1,
-1.371453, 0.1374642, -1.143231, 1, 0.4862745, 0, 1,
-1.369715, -0.7608861, -3.796791, 1, 0.4901961, 0, 1,
-1.351624, 1.589451, -1.095451, 1, 0.4980392, 0, 1,
-1.333592, -0.1051218, -1.335682, 1, 0.5058824, 0, 1,
-1.327192, 0.6117987, -0.5008077, 1, 0.509804, 0, 1,
-1.296732, -0.04054429, -2.053029, 1, 0.5176471, 0, 1,
-1.288379, -0.102205, -2.287049, 1, 0.5215687, 0, 1,
-1.280969, 0.6150796, 0.006620362, 1, 0.5294118, 0, 1,
-1.276795, -0.9349743, -1.610056, 1, 0.5333334, 0, 1,
-1.274877, 0.9947819, -0.88822, 1, 0.5411765, 0, 1,
-1.26553, -0.5684045, -3.741463, 1, 0.5450981, 0, 1,
-1.252367, 1.164386, -0.9344673, 1, 0.5529412, 0, 1,
-1.25108, 1.009316, -0.751026, 1, 0.5568628, 0, 1,
-1.244348, 0.2608182, -1.104554, 1, 0.5647059, 0, 1,
-1.243982, 0.2019783, -1.383612, 1, 0.5686275, 0, 1,
-1.241418, -0.6591749, -4.300695, 1, 0.5764706, 0, 1,
-1.238592, 0.5031702, -0.6186403, 1, 0.5803922, 0, 1,
-1.2357, -0.5431077, -1.811652, 1, 0.5882353, 0, 1,
-1.22712, 0.779034, -1.045627, 1, 0.5921569, 0, 1,
-1.224693, -0.3765142, -3.209583, 1, 0.6, 0, 1,
-1.222349, 0.8004977, -2.364354, 1, 0.6078432, 0, 1,
-1.221203, -1.107692, -2.255611, 1, 0.6117647, 0, 1,
-1.218307, 1.472232, -2.208905, 1, 0.6196079, 0, 1,
-1.216552, -1.318409, -2.302492, 1, 0.6235294, 0, 1,
-1.210855, 0.180513, -1.695671, 1, 0.6313726, 0, 1,
-1.205681, -1.740704, -2.946513, 1, 0.6352941, 0, 1,
-1.202379, -1.018471, -0.5379961, 1, 0.6431373, 0, 1,
-1.19565, 1.208967, 3.871529, 1, 0.6470588, 0, 1,
-1.188167, 1.723948, 0.1207751, 1, 0.654902, 0, 1,
-1.18254, 0.002958958, -2.756952, 1, 0.6588235, 0, 1,
-1.165298, 0.5871798, -1.539611, 1, 0.6666667, 0, 1,
-1.163352, 0.3579974, -2.023513, 1, 0.6705883, 0, 1,
-1.163196, -1.199832, -2.368668, 1, 0.6784314, 0, 1,
-1.155629, -0.01483515, -3.194876, 1, 0.682353, 0, 1,
-1.150525, 0.6112158, -1.816643, 1, 0.6901961, 0, 1,
-1.139033, -0.4247302, -3.902703, 1, 0.6941177, 0, 1,
-1.137567, 0.003604586, -1.42086, 1, 0.7019608, 0, 1,
-1.137278, -1.053755, -1.104233, 1, 0.7098039, 0, 1,
-1.136539, 0.381909, -1.495095, 1, 0.7137255, 0, 1,
-1.129103, 0.5731028, -0.4054573, 1, 0.7215686, 0, 1,
-1.119559, 0.9330847, 0.2905382, 1, 0.7254902, 0, 1,
-1.110004, 0.9626206, -0.3354313, 1, 0.7333333, 0, 1,
-1.107992, -1.101539, -2.026365, 1, 0.7372549, 0, 1,
-1.105411, -0.2085919, -2.590614, 1, 0.7450981, 0, 1,
-1.104798, -0.9802163, -1.263011, 1, 0.7490196, 0, 1,
-1.104253, 0.2337095, -0.5332975, 1, 0.7568628, 0, 1,
-1.103383, 0.9822291, 0.4403075, 1, 0.7607843, 0, 1,
-1.079284, -0.6799608, -2.126236, 1, 0.7686275, 0, 1,
-1.077051, -0.2470453, -3.259017, 1, 0.772549, 0, 1,
-1.074792, -0.3801335, -3.005732, 1, 0.7803922, 0, 1,
-1.07222, -0.5636553, -1.237018, 1, 0.7843137, 0, 1,
-1.070459, -2.271679, -2.224389, 1, 0.7921569, 0, 1,
-1.065548, 1.244342, -1.148866, 1, 0.7960784, 0, 1,
-1.06004, -2.359936, -3.448779, 1, 0.8039216, 0, 1,
-1.057286, 0.7056984, 0.2120318, 1, 0.8117647, 0, 1,
-1.055614, -0.07436717, -2.541871, 1, 0.8156863, 0, 1,
-1.054926, -0.8881497, -2.726938, 1, 0.8235294, 0, 1,
-1.053519, 1.255829, -0.5887678, 1, 0.827451, 0, 1,
-1.048516, 0.1156051, -1.888845, 1, 0.8352941, 0, 1,
-1.04625, -2.221641, -2.506695, 1, 0.8392157, 0, 1,
-1.045938, -1.059904, -1.853114, 1, 0.8470588, 0, 1,
-1.041674, -1.20412, -2.094899, 1, 0.8509804, 0, 1,
-1.041311, -0.8169867, -2.443872, 1, 0.8588235, 0, 1,
-1.040912, -0.4551606, -2.663363, 1, 0.8627451, 0, 1,
-1.037918, 0.6686202, 1.084286, 1, 0.8705882, 0, 1,
-1.034491, -0.4803524, -1.955836, 1, 0.8745098, 0, 1,
-1.033885, -0.8446282, -2.611977, 1, 0.8823529, 0, 1,
-1.033451, 0.8036998, -2.691864, 1, 0.8862745, 0, 1,
-1.030145, -0.4074538, -1.487224, 1, 0.8941177, 0, 1,
-1.027637, -0.7063591, -3.893114, 1, 0.8980392, 0, 1,
-1.027084, 0.5173544, -2.48727, 1, 0.9058824, 0, 1,
-1.022426, 0.8767453, -0.7863429, 1, 0.9137255, 0, 1,
-1.020162, 0.1921344, -1.523061, 1, 0.9176471, 0, 1,
-1.017621, 1.285214, -1.247181, 1, 0.9254902, 0, 1,
-1.016824, -0.7007497, -1.775627, 1, 0.9294118, 0, 1,
-1.015693, 1.01, -0.4483116, 1, 0.9372549, 0, 1,
-1.015388, -0.8163338, -0.8092669, 1, 0.9411765, 0, 1,
-1.015331, -0.2103024, -1.857435, 1, 0.9490196, 0, 1,
-1.008436, 0.7510935, -0.04213157, 1, 0.9529412, 0, 1,
-1.002331, 2.206778, 0.2183438, 1, 0.9607843, 0, 1,
-0.9939699, 0.8502707, -0.07751875, 1, 0.9647059, 0, 1,
-0.9934637, 0.9536977, -1.158263, 1, 0.972549, 0, 1,
-0.9906703, -0.134113, -2.621504, 1, 0.9764706, 0, 1,
-0.9894142, -0.6833531, -1.182526, 1, 0.9843137, 0, 1,
-0.9863234, -0.9899557, -2.320121, 1, 0.9882353, 0, 1,
-0.9847282, 1.733673, -0.6151291, 1, 0.9960784, 0, 1,
-0.9752668, -0.08332323, -1.866602, 0.9960784, 1, 0, 1,
-0.9751884, -0.2482322, -1.396877, 0.9921569, 1, 0, 1,
-0.9646887, -1.752926, -2.85178, 0.9843137, 1, 0, 1,
-0.9638527, -1.860813, 0.2381207, 0.9803922, 1, 0, 1,
-0.9635473, 3.213861, -1.030839, 0.972549, 1, 0, 1,
-0.9487576, 0.8389473, -1.606553, 0.9686275, 1, 0, 1,
-0.9425577, -1.133538, -2.465795, 0.9607843, 1, 0, 1,
-0.9294496, -1.242084, -2.718228, 0.9568627, 1, 0, 1,
-0.9273459, 1.307217, -0.8648117, 0.9490196, 1, 0, 1,
-0.9209786, -0.8984109, -2.756409, 0.945098, 1, 0, 1,
-0.9203865, 0.2066305, -0.6783469, 0.9372549, 1, 0, 1,
-0.9184334, -2.769187, -3.245056, 0.9333333, 1, 0, 1,
-0.9175874, -1.134331, -2.325838, 0.9254902, 1, 0, 1,
-0.9151084, -1.239546, -2.943054, 0.9215686, 1, 0, 1,
-0.899923, -1.849709, -3.056925, 0.9137255, 1, 0, 1,
-0.8931382, -0.3820158, -1.164597, 0.9098039, 1, 0, 1,
-0.8884122, 0.8513117, -2.23059, 0.9019608, 1, 0, 1,
-0.8865635, 0.9799483, -0.4239575, 0.8941177, 1, 0, 1,
-0.8811667, -0.2714839, -3.639256, 0.8901961, 1, 0, 1,
-0.8787003, 1.094846, -0.3727598, 0.8823529, 1, 0, 1,
-0.8758284, -0.8365665, -2.96769, 0.8784314, 1, 0, 1,
-0.8734164, -1.140204, -0.0933432, 0.8705882, 1, 0, 1,
-0.8729472, -0.4881328, -2.335902, 0.8666667, 1, 0, 1,
-0.8705316, 0.3789531, -0.1204853, 0.8588235, 1, 0, 1,
-0.8655218, -0.8653837, -1.610625, 0.854902, 1, 0, 1,
-0.8624436, -0.02795623, -0.6815444, 0.8470588, 1, 0, 1,
-0.861244, -0.9280739, -2.985597, 0.8431373, 1, 0, 1,
-0.8386794, 0.6706055, -1.796321, 0.8352941, 1, 0, 1,
-0.8361771, -1.426972, -0.9080827, 0.8313726, 1, 0, 1,
-0.8355255, 0.4073778, -0.5160632, 0.8235294, 1, 0, 1,
-0.830543, -1.407149, -2.508089, 0.8196079, 1, 0, 1,
-0.8296478, -0.2061738, -3.098119, 0.8117647, 1, 0, 1,
-0.8295615, 1.898146, -0.4812652, 0.8078431, 1, 0, 1,
-0.8182877, 0.491591, -0.6857162, 0.8, 1, 0, 1,
-0.8180777, 0.3354034, -0.5721473, 0.7921569, 1, 0, 1,
-0.8104902, 1.298129, -0.06289096, 0.7882353, 1, 0, 1,
-0.8098241, -0.7805989, -2.459493, 0.7803922, 1, 0, 1,
-0.8036397, -1.090711, -3.752728, 0.7764706, 1, 0, 1,
-0.8010151, 0.3688446, -0.3992499, 0.7686275, 1, 0, 1,
-0.7966416, 0.4570267, 0.1763517, 0.7647059, 1, 0, 1,
-0.7932876, -0.1731834, -1.223727, 0.7568628, 1, 0, 1,
-0.791807, 0.04564126, -0.9636007, 0.7529412, 1, 0, 1,
-0.7894622, -1.256501, -2.745199, 0.7450981, 1, 0, 1,
-0.7881935, 0.3698938, -0.7197188, 0.7411765, 1, 0, 1,
-0.7870598, 0.1007491, -0.2765267, 0.7333333, 1, 0, 1,
-0.7816384, 0.2495255, -2.36044, 0.7294118, 1, 0, 1,
-0.7735463, 1.038491, -0.8017393, 0.7215686, 1, 0, 1,
-0.7542461, 0.006004026, -0.4824589, 0.7176471, 1, 0, 1,
-0.7520942, 1.03571, -0.08937345, 0.7098039, 1, 0, 1,
-0.7520391, -0.1647068, 0.4824824, 0.7058824, 1, 0, 1,
-0.7513961, -0.5834098, -3.856111, 0.6980392, 1, 0, 1,
-0.7449799, -0.009090911, -1.934588, 0.6901961, 1, 0, 1,
-0.7412329, 2.032376, -0.5185756, 0.6862745, 1, 0, 1,
-0.7365381, -0.8012834, -1.552889, 0.6784314, 1, 0, 1,
-0.735267, 0.2294381, -2.263405, 0.6745098, 1, 0, 1,
-0.7336025, 1.425507, 0.8290412, 0.6666667, 1, 0, 1,
-0.7288912, -1.500596, -2.952731, 0.6627451, 1, 0, 1,
-0.7247342, 1.470349, 0.04535123, 0.654902, 1, 0, 1,
-0.7238458, -1.186267, -2.934331, 0.6509804, 1, 0, 1,
-0.7207349, -0.1278394, -2.383268, 0.6431373, 1, 0, 1,
-0.7187862, 0.1563422, -2.380424, 0.6392157, 1, 0, 1,
-0.7186085, -1.373872, -2.814553, 0.6313726, 1, 0, 1,
-0.7140256, -0.07716468, -0.9409607, 0.627451, 1, 0, 1,
-0.7125779, 0.07051741, -2.638856, 0.6196079, 1, 0, 1,
-0.7067637, -0.1284719, -2.048589, 0.6156863, 1, 0, 1,
-0.6923428, 0.04360087, -1.240467, 0.6078432, 1, 0, 1,
-0.6874802, 1.462311, -1.56136, 0.6039216, 1, 0, 1,
-0.6865332, -0.2754702, -1.031413, 0.5960785, 1, 0, 1,
-0.6864872, -0.799799, -3.098034, 0.5882353, 1, 0, 1,
-0.6850398, -1.609562, -2.289433, 0.5843138, 1, 0, 1,
-0.6810083, 0.07500187, -1.931501, 0.5764706, 1, 0, 1,
-0.6741365, -0.1266593, -1.53097, 0.572549, 1, 0, 1,
-0.6728464, -0.7460821, -2.90534, 0.5647059, 1, 0, 1,
-0.6702285, 0.5468283, -1.122733, 0.5607843, 1, 0, 1,
-0.6693494, -2.191288, -2.669286, 0.5529412, 1, 0, 1,
-0.6658717, -1.977136, -2.209695, 0.5490196, 1, 0, 1,
-0.6657438, 1.616872, -2.220132, 0.5411765, 1, 0, 1,
-0.6626432, 0.7865769, -0.7095073, 0.5372549, 1, 0, 1,
-0.6513463, 1.682947, 0.1169172, 0.5294118, 1, 0, 1,
-0.6513458, 0.2347155, -2.271848, 0.5254902, 1, 0, 1,
-0.648506, 0.2515683, -2.139352, 0.5176471, 1, 0, 1,
-0.6461474, 1.869104, -1.110322, 0.5137255, 1, 0, 1,
-0.6453334, 1.288525, -0.4631141, 0.5058824, 1, 0, 1,
-0.6440776, -0.1765148, -2.623602, 0.5019608, 1, 0, 1,
-0.6419086, 0.35094, -0.8986535, 0.4941176, 1, 0, 1,
-0.6415662, 0.9511451, 0.3217433, 0.4862745, 1, 0, 1,
-0.6404869, -0.8628539, -2.362543, 0.4823529, 1, 0, 1,
-0.6388879, 0.333032, -2.972374, 0.4745098, 1, 0, 1,
-0.6361749, 0.1813605, -0.3193134, 0.4705882, 1, 0, 1,
-0.6351141, -1.014161, -1.729646, 0.4627451, 1, 0, 1,
-0.6349534, -1.032977, -2.147483, 0.4588235, 1, 0, 1,
-0.6345113, 0.06304609, -0.5454882, 0.4509804, 1, 0, 1,
-0.6318473, -0.08431814, -1.238776, 0.4470588, 1, 0, 1,
-0.6315182, 1.401821, 0.3509747, 0.4392157, 1, 0, 1,
-0.6314741, -0.1881721, -3.364801, 0.4352941, 1, 0, 1,
-0.630777, -0.03551653, -4.013924, 0.427451, 1, 0, 1,
-0.6266304, 0.8965642, -1.787855, 0.4235294, 1, 0, 1,
-0.6264802, 0.8178537, -1.23331, 0.4156863, 1, 0, 1,
-0.626295, -0.3047004, -3.084464, 0.4117647, 1, 0, 1,
-0.6249982, -1.106006, -1.400308, 0.4039216, 1, 0, 1,
-0.6236861, 0.4225945, -0.9775138, 0.3960784, 1, 0, 1,
-0.622165, 0.8333343, -0.9313399, 0.3921569, 1, 0, 1,
-0.6218105, 0.9931799, -0.167998, 0.3843137, 1, 0, 1,
-0.6170227, 1.237752, -2.201222, 0.3803922, 1, 0, 1,
-0.6167502, -0.1327803, -2.748276, 0.372549, 1, 0, 1,
-0.6162376, -0.8252701, -1.930552, 0.3686275, 1, 0, 1,
-0.6119391, 0.6315637, -2.9832, 0.3607843, 1, 0, 1,
-0.6105441, -1.992923, -3.841208, 0.3568628, 1, 0, 1,
-0.6076123, 0.2635249, -1.886824, 0.3490196, 1, 0, 1,
-0.606325, 1.095758, 0.4268323, 0.345098, 1, 0, 1,
-0.6014991, -1.985714, -4.225564, 0.3372549, 1, 0, 1,
-0.5966885, 0.5292131, -0.6336492, 0.3333333, 1, 0, 1,
-0.5962213, 2.253713, -0.3476483, 0.3254902, 1, 0, 1,
-0.5956883, 1.048474, 0.8052589, 0.3215686, 1, 0, 1,
-0.5922733, -1.742066, -1.66327, 0.3137255, 1, 0, 1,
-0.5911183, -0.8822407, -2.251972, 0.3098039, 1, 0, 1,
-0.5886024, 0.9563202, 0.1921489, 0.3019608, 1, 0, 1,
-0.5850078, -1.008766, -3.953216, 0.2941177, 1, 0, 1,
-0.58231, 0.2652175, -2.807621, 0.2901961, 1, 0, 1,
-0.5816219, 0.6297865, -1.449067, 0.282353, 1, 0, 1,
-0.5716542, -2.450958, -3.235774, 0.2784314, 1, 0, 1,
-0.5436636, -0.8440634, -2.570981, 0.2705882, 1, 0, 1,
-0.5436242, -0.7463133, -2.071063, 0.2666667, 1, 0, 1,
-0.5382866, 0.5729006, -0.5343164, 0.2588235, 1, 0, 1,
-0.5379376, 1.3936, 0.4801712, 0.254902, 1, 0, 1,
-0.5366107, -0.7205437, -0.6003895, 0.2470588, 1, 0, 1,
-0.5346645, 0.2094922, -1.069949, 0.2431373, 1, 0, 1,
-0.5337306, -0.4896572, -0.8383859, 0.2352941, 1, 0, 1,
-0.5219551, 0.5111845, -1.794237, 0.2313726, 1, 0, 1,
-0.5219526, 0.479133, -2.082421, 0.2235294, 1, 0, 1,
-0.5217846, -0.6342983, -2.493026, 0.2196078, 1, 0, 1,
-0.5192193, -0.4668993, -2.368555, 0.2117647, 1, 0, 1,
-0.5155717, 1.047493, -1.83013, 0.2078431, 1, 0, 1,
-0.5122984, -0.112086, -0.4903373, 0.2, 1, 0, 1,
-0.5033525, 0.4364595, -1.669876, 0.1921569, 1, 0, 1,
-0.5021932, -1.029073, -3.486196, 0.1882353, 1, 0, 1,
-0.502181, 0.2670538, -2.951445, 0.1803922, 1, 0, 1,
-0.5015296, -0.2339801, 0.6261226, 0.1764706, 1, 0, 1,
-0.5002251, -0.1904854, -2.534364, 0.1686275, 1, 0, 1,
-0.4980285, -0.343906, 0.03670686, 0.1647059, 1, 0, 1,
-0.4952253, 0.745101, 0.06038972, 0.1568628, 1, 0, 1,
-0.4895491, 1.032668, 0.3357047, 0.1529412, 1, 0, 1,
-0.489113, -0.145125, -3.607693, 0.145098, 1, 0, 1,
-0.4884298, 0.7883089, 0.52808, 0.1411765, 1, 0, 1,
-0.4877828, 0.07160535, 0.284051, 0.1333333, 1, 0, 1,
-0.4874513, -0.09795199, -0.9379957, 0.1294118, 1, 0, 1,
-0.4844095, -0.9956314, -3.458676, 0.1215686, 1, 0, 1,
-0.478024, 0.3569913, -1.20382, 0.1176471, 1, 0, 1,
-0.4774352, 0.1061247, -2.969076, 0.1098039, 1, 0, 1,
-0.4715454, 1.440987, 0.491484, 0.1058824, 1, 0, 1,
-0.4706061, -0.6722087, -2.314216, 0.09803922, 1, 0, 1,
-0.4704609, -0.7709889, -2.240898, 0.09019608, 1, 0, 1,
-0.4669719, -0.6579219, -3.292459, 0.08627451, 1, 0, 1,
-0.4631644, 0.3530526, 0.05890309, 0.07843138, 1, 0, 1,
-0.4623484, 0.6107879, -0.8453843, 0.07450981, 1, 0, 1,
-0.4607543, -1.135072, -2.131261, 0.06666667, 1, 0, 1,
-0.4586464, -1.065117, -2.470083, 0.0627451, 1, 0, 1,
-0.4570179, 2.020474, 0.3214749, 0.05490196, 1, 0, 1,
-0.4519409, 0.2473465, -0.3913669, 0.05098039, 1, 0, 1,
-0.4480419, -0.1828501, -2.755383, 0.04313726, 1, 0, 1,
-0.4464407, -0.2493723, -2.289403, 0.03921569, 1, 0, 1,
-0.4446223, 0.3081403, -1.870005, 0.03137255, 1, 0, 1,
-0.4438906, 0.4068938, -0.7996177, 0.02745098, 1, 0, 1,
-0.4428904, -2.44166, -3.549494, 0.01960784, 1, 0, 1,
-0.4415638, -2.234098, -1.70167, 0.01568628, 1, 0, 1,
-0.4408875, 0.2561345, -2.042267, 0.007843138, 1, 0, 1,
-0.4406967, -0.06039397, -2.178738, 0.003921569, 1, 0, 1,
-0.4380005, 2.231972, -0.398447, 0, 1, 0.003921569, 1,
-0.4366834, -0.6435485, -3.822469, 0, 1, 0.01176471, 1,
-0.4339416, 1.00979, -0.3642256, 0, 1, 0.01568628, 1,
-0.4319007, 0.08105513, -2.070226, 0, 1, 0.02352941, 1,
-0.4249431, -1.498433, -3.144747, 0, 1, 0.02745098, 1,
-0.4244672, 0.8667663, -0.7790903, 0, 1, 0.03529412, 1,
-0.4216096, 0.03839309, -0.1235213, 0, 1, 0.03921569, 1,
-0.4203219, -0.02300579, -2.043048, 0, 1, 0.04705882, 1,
-0.4156501, 0.8049381, 0.7535272, 0, 1, 0.05098039, 1,
-0.4149738, 0.9098178, -0.2204438, 0, 1, 0.05882353, 1,
-0.4085795, 0.6968836, -1.793218, 0, 1, 0.0627451, 1,
-0.4067416, 0.9539185, -1.416527, 0, 1, 0.07058824, 1,
-0.4065001, 0.07047462, 0.09908938, 0, 1, 0.07450981, 1,
-0.4059249, -0.7312698, -2.544889, 0, 1, 0.08235294, 1,
-0.4046111, -0.08590518, -3.71147, 0, 1, 0.08627451, 1,
-0.4011876, -1.267462, -2.469618, 0, 1, 0.09411765, 1,
-0.4009319, 1.307977, -0.7670893, 0, 1, 0.1019608, 1,
-0.3983614, 0.3143912, -0.2869878, 0, 1, 0.1058824, 1,
-0.3981209, -0.2583944, -2.65571, 0, 1, 0.1137255, 1,
-0.3899606, 0.7315586, -0.007502516, 0, 1, 0.1176471, 1,
-0.3880675, 1.774401, -0.5262075, 0, 1, 0.1254902, 1,
-0.3864665, 1.094941, 1.260538, 0, 1, 0.1294118, 1,
-0.3859683, -1.656278, -2.319625, 0, 1, 0.1372549, 1,
-0.3834341, 0.8474196, -0.142512, 0, 1, 0.1411765, 1,
-0.3809152, -1.040895, -2.30105, 0, 1, 0.1490196, 1,
-0.3807779, -0.1301677, -3.462186, 0, 1, 0.1529412, 1,
-0.372315, 0.5690044, -1.695624, 0, 1, 0.1607843, 1,
-0.3709111, -0.2331818, -1.49355, 0, 1, 0.1647059, 1,
-0.3676493, -1.924541, -3.498399, 0, 1, 0.172549, 1,
-0.3668794, 1.25377, 1.103176, 0, 1, 0.1764706, 1,
-0.3656447, 0.8076103, -0.9047242, 0, 1, 0.1843137, 1,
-0.3652878, 2.2151, -0.3250677, 0, 1, 0.1882353, 1,
-0.3580762, 0.1284004, -1.805332, 0, 1, 0.1960784, 1,
-0.3522884, 1.532051, 0.4463822, 0, 1, 0.2039216, 1,
-0.3504547, 0.5443997, -0.7641491, 0, 1, 0.2078431, 1,
-0.3495232, 0.2364096, -2.363579, 0, 1, 0.2156863, 1,
-0.347222, 0.6083639, -0.2125141, 0, 1, 0.2196078, 1,
-0.3417491, 1.305934, -0.8632951, 0, 1, 0.227451, 1,
-0.3365014, 0.6701471, -0.8066251, 0, 1, 0.2313726, 1,
-0.3298108, 0.4553566, -0.5889795, 0, 1, 0.2392157, 1,
-0.3278855, -0.4017529, -0.8748177, 0, 1, 0.2431373, 1,
-0.3245176, -0.743085, -2.021947, 0, 1, 0.2509804, 1,
-0.3193885, 0.8503848, 0.4608454, 0, 1, 0.254902, 1,
-0.3192786, -0.8836445, -2.469267, 0, 1, 0.2627451, 1,
-0.3182711, 0.8090476, -1.629402, 0, 1, 0.2666667, 1,
-0.3131389, 0.8844263, 0.1466233, 0, 1, 0.2745098, 1,
-0.31264, -0.07179534, -2.394731, 0, 1, 0.2784314, 1,
-0.3094431, -0.4965282, -3.433668, 0, 1, 0.2862745, 1,
-0.3057547, 0.3495397, 0.3628178, 0, 1, 0.2901961, 1,
-0.3051482, -1.36263, -1.951944, 0, 1, 0.2980392, 1,
-0.3023961, -1.004475, -2.487377, 0, 1, 0.3058824, 1,
-0.3011762, -0.0864184, -0.8345335, 0, 1, 0.3098039, 1,
-0.2976867, 0.4329872, -1.335699, 0, 1, 0.3176471, 1,
-0.2934047, 0.2798291, 0.6475658, 0, 1, 0.3215686, 1,
-0.2924728, 1.544862, -1.140296, 0, 1, 0.3294118, 1,
-0.2917344, -1.3709, -4.423266, 0, 1, 0.3333333, 1,
-0.2874223, 1.724954, -2.066924, 0, 1, 0.3411765, 1,
-0.2872599, -0.5239642, -2.949782, 0, 1, 0.345098, 1,
-0.2756243, 1.125228, -0.8527167, 0, 1, 0.3529412, 1,
-0.2755621, -0.4645249, -1.700225, 0, 1, 0.3568628, 1,
-0.2728354, 1.063379, 0.145682, 0, 1, 0.3647059, 1,
-0.2722647, -0.8257802, -4.916845, 0, 1, 0.3686275, 1,
-0.266497, 0.2638641, -2.640303, 0, 1, 0.3764706, 1,
-0.2646503, -0.2849187, -4.303787, 0, 1, 0.3803922, 1,
-0.2640688, -0.8866884, -1.100694, 0, 1, 0.3882353, 1,
-0.263406, -1.969588, -1.052266, 0, 1, 0.3921569, 1,
-0.2630565, 0.1126946, -1.347395, 0, 1, 0.4, 1,
-0.2610599, 0.2240335, -1.353118, 0, 1, 0.4078431, 1,
-0.2580076, -0.9397044, -5.583091, 0, 1, 0.4117647, 1,
-0.2578036, -0.6558307, -4.061692, 0, 1, 0.4196078, 1,
-0.2574666, -0.4010137, -2.192054, 0, 1, 0.4235294, 1,
-0.2571109, 0.5351046, 0.6776217, 0, 1, 0.4313726, 1,
-0.2566883, -0.6465681, -2.12929, 0, 1, 0.4352941, 1,
-0.2566787, 0.09707907, -1.237869, 0, 1, 0.4431373, 1,
-0.251112, 0.0187448, -2.428235, 0, 1, 0.4470588, 1,
-0.2500824, -0.03573644, -1.874888, 0, 1, 0.454902, 1,
-0.2476817, -0.2593631, -2.430302, 0, 1, 0.4588235, 1,
-0.2402934, 0.6269172, 1.16755, 0, 1, 0.4666667, 1,
-0.2388368, -0.4166034, -2.174822, 0, 1, 0.4705882, 1,
-0.2312875, 0.1161787, -0.6141026, 0, 1, 0.4784314, 1,
-0.2241343, -0.4872476, -2.849869, 0, 1, 0.4823529, 1,
-0.2198604, -1.139724, -1.954192, 0, 1, 0.4901961, 1,
-0.2153558, -1.446627, -2.474146, 0, 1, 0.4941176, 1,
-0.211228, -0.6519232, -2.946599, 0, 1, 0.5019608, 1,
-0.2097017, -0.8760428, -2.257063, 0, 1, 0.509804, 1,
-0.2088939, -0.4244336, -0.6009037, 0, 1, 0.5137255, 1,
-0.2023817, -1.261544, -3.11783, 0, 1, 0.5215687, 1,
-0.1978203, 0.1232475, -0.6936189, 0, 1, 0.5254902, 1,
-0.1937675, 0.3873945, -0.4672736, 0, 1, 0.5333334, 1,
-0.1927922, 0.4676008, 0.008210562, 0, 1, 0.5372549, 1,
-0.1918297, 0.494992, 0.3585281, 0, 1, 0.5450981, 1,
-0.1897678, 2.201253, 1.625142, 0, 1, 0.5490196, 1,
-0.1859141, -0.9564759, -4.444423, 0, 1, 0.5568628, 1,
-0.1815008, -0.8448274, -2.015026, 0, 1, 0.5607843, 1,
-0.1795749, 0.9105329, -0.2122109, 0, 1, 0.5686275, 1,
-0.1792858, -0.05428917, -1.85812, 0, 1, 0.572549, 1,
-0.177502, 0.2480721, -2.348075, 0, 1, 0.5803922, 1,
-0.1762642, 0.001611774, -4.234457, 0, 1, 0.5843138, 1,
-0.1729659, 2.060787, -0.2476133, 0, 1, 0.5921569, 1,
-0.1728542, 2.173077, 0.06146704, 0, 1, 0.5960785, 1,
-0.1725461, 1.204431, -2.256239, 0, 1, 0.6039216, 1,
-0.1704461, 0.6286622, -1.296604, 0, 1, 0.6117647, 1,
-0.1703458, -1.507326, -2.36342, 0, 1, 0.6156863, 1,
-0.1698966, 0.710647, -0.6647817, 0, 1, 0.6235294, 1,
-0.1690123, 0.7788821, -0.5676257, 0, 1, 0.627451, 1,
-0.1685138, -0.6013852, -3.397369, 0, 1, 0.6352941, 1,
-0.1673033, 0.4155422, -0.5397912, 0, 1, 0.6392157, 1,
-0.1612231, -0.7000703, -2.384534, 0, 1, 0.6470588, 1,
-0.1587911, -0.8804884, -3.43273, 0, 1, 0.6509804, 1,
-0.1577816, 0.04548062, -1.034097, 0, 1, 0.6588235, 1,
-0.1525793, 0.464675, -0.6714514, 0, 1, 0.6627451, 1,
-0.1515926, -0.3750094, -0.5223386, 0, 1, 0.6705883, 1,
-0.1500371, -1.118967, -3.068281, 0, 1, 0.6745098, 1,
-0.1422125, -1.342623, -6.024601, 0, 1, 0.682353, 1,
-0.1405034, 1.195634, 0.2285981, 0, 1, 0.6862745, 1,
-0.1365857, 0.1941978, -1.513578, 0, 1, 0.6941177, 1,
-0.1331743, 1.681391, -0.7437185, 0, 1, 0.7019608, 1,
-0.1290637, -1.009487, -2.766738, 0, 1, 0.7058824, 1,
-0.1275236, 1.067796, 0.4265653, 0, 1, 0.7137255, 1,
-0.1270005, 0.7950804, -0.5533059, 0, 1, 0.7176471, 1,
-0.1246693, 0.1846938, -1.154354, 0, 1, 0.7254902, 1,
-0.1219237, 0.2364244, -0.1701192, 0, 1, 0.7294118, 1,
-0.121816, -0.5372691, -3.219509, 0, 1, 0.7372549, 1,
-0.1182559, -0.8353387, -1.412108, 0, 1, 0.7411765, 1,
-0.1131914, 1.903779, 0.5233144, 0, 1, 0.7490196, 1,
-0.1102066, 0.7423835, -2.403425, 0, 1, 0.7529412, 1,
-0.1079426, -1.116446, -3.627538, 0, 1, 0.7607843, 1,
-0.1023212, 0.6053393, -0.4617543, 0, 1, 0.7647059, 1,
-0.09661926, -1.238713, -2.744546, 0, 1, 0.772549, 1,
-0.09654316, 0.9600886, 0.4473795, 0, 1, 0.7764706, 1,
-0.09345834, -0.7116991, -4.597916, 0, 1, 0.7843137, 1,
-0.09197423, 0.8117498, 0.2043676, 0, 1, 0.7882353, 1,
-0.08888336, -0.308895, -2.795878, 0, 1, 0.7960784, 1,
-0.08883275, -0.9077925, -3.23421, 0, 1, 0.8039216, 1,
-0.08684955, 1.152413, -1.148942, 0, 1, 0.8078431, 1,
-0.08395341, 0.8920045, -0.6964421, 0, 1, 0.8156863, 1,
-0.08224987, 0.6123251, -1.637571, 0, 1, 0.8196079, 1,
-0.07898334, -0.6443571, -3.363829, 0, 1, 0.827451, 1,
-0.0759916, 1.13307, 0.01683013, 0, 1, 0.8313726, 1,
-0.07091873, 0.1527717, -0.3704943, 0, 1, 0.8392157, 1,
-0.06793948, 0.749226, -0.3865653, 0, 1, 0.8431373, 1,
-0.06226122, -0.8529071, -3.780651, 0, 1, 0.8509804, 1,
-0.06138979, -1.698316, -3.558737, 0, 1, 0.854902, 1,
-0.06083542, -0.07347237, -2.900738, 0, 1, 0.8627451, 1,
-0.05554065, -1.88364, -3.542872, 0, 1, 0.8666667, 1,
-0.05311498, 0.8172843, -1.089285, 0, 1, 0.8745098, 1,
-0.05304323, -1.127188, -2.247842, 0, 1, 0.8784314, 1,
-0.05137809, -0.3132776, -2.038213, 0, 1, 0.8862745, 1,
-0.04883531, -0.6498393, -3.770934, 0, 1, 0.8901961, 1,
-0.04723492, -0.4759856, -4.439888, 0, 1, 0.8980392, 1,
-0.0451102, -0.1093062, -3.881833, 0, 1, 0.9058824, 1,
-0.04116184, 1.485501, -0.1189036, 0, 1, 0.9098039, 1,
-0.03714707, 0.3351182, -0.8246059, 0, 1, 0.9176471, 1,
-0.036858, -0.04499069, -3.832063, 0, 1, 0.9215686, 1,
-0.03667984, 0.2849673, 0.2440886, 0, 1, 0.9294118, 1,
-0.03662363, 1.027935, -0.4437902, 0, 1, 0.9333333, 1,
-0.0352477, -0.7408314, -2.170774, 0, 1, 0.9411765, 1,
-0.03442277, -0.5067557, -1.409475, 0, 1, 0.945098, 1,
-0.02484808, 0.1431698, 1.069727, 0, 1, 0.9529412, 1,
-0.02403022, 0.7320371, -0.4897234, 0, 1, 0.9568627, 1,
-0.02188133, 1.693756, 1.567917, 0, 1, 0.9647059, 1,
-0.02098724, -0.8079851, -2.80085, 0, 1, 0.9686275, 1,
-0.0203406, -1.764101, -2.898503, 0, 1, 0.9764706, 1,
-0.01610172, -1.13975, -3.141283, 0, 1, 0.9803922, 1,
-0.00953725, -0.7116233, -1.900209, 0, 1, 0.9882353, 1,
-0.008407545, 0.5647765, 0.313352, 0, 1, 0.9921569, 1,
-0.005084118, -0.009912802, -2.769767, 0, 1, 1, 1,
-1.428234e-05, 0.5563381, 0.1343267, 0, 0.9921569, 1, 1,
0.001957834, 0.1032712, 2.219512, 0, 0.9882353, 1, 1,
0.003385105, -0.8921108, 3.716099, 0, 0.9803922, 1, 1,
0.007806432, 1.932493, 1.178708, 0, 0.9764706, 1, 1,
0.009863351, -0.6615405, 3.451413, 0, 0.9686275, 1, 1,
0.01132121, 0.6411119, 0.9196396, 0, 0.9647059, 1, 1,
0.0126426, 1.432707, 0.02732264, 0, 0.9568627, 1, 1,
0.01767152, -0.4067826, 3.42379, 0, 0.9529412, 1, 1,
0.01869686, 0.6229127, 0.8784032, 0, 0.945098, 1, 1,
0.02006483, 0.1033951, -0.4893072, 0, 0.9411765, 1, 1,
0.02181069, -0.2618812, 4.208943, 0, 0.9333333, 1, 1,
0.02324307, 0.2415947, 1.115054, 0, 0.9294118, 1, 1,
0.03568394, -0.1558475, 2.090906, 0, 0.9215686, 1, 1,
0.04197406, 2.196938, -1.120502, 0, 0.9176471, 1, 1,
0.04710078, -1.447999, 3.194278, 0, 0.9098039, 1, 1,
0.05098422, -2.026716, 2.151636, 0, 0.9058824, 1, 1,
0.05233682, -0.5276518, 2.188859, 0, 0.8980392, 1, 1,
0.05349471, 0.2107103, 0.1324375, 0, 0.8901961, 1, 1,
0.05676173, -0.18312, 3.196274, 0, 0.8862745, 1, 1,
0.05789785, 0.5317699, -0.4580708, 0, 0.8784314, 1, 1,
0.06085813, -0.1868669, 3.783357, 0, 0.8745098, 1, 1,
0.06321441, 0.6086732, -0.007239454, 0, 0.8666667, 1, 1,
0.06338401, 0.2679375, -0.8428222, 0, 0.8627451, 1, 1,
0.0653463, 1.027732, -1.31681, 0, 0.854902, 1, 1,
0.06555188, 0.9392497, -1.787562, 0, 0.8509804, 1, 1,
0.06812512, -0.6205113, 3.098261, 0, 0.8431373, 1, 1,
0.07068434, -0.7448813, 2.883474, 0, 0.8392157, 1, 1,
0.07176727, 0.5310507, 0.5562637, 0, 0.8313726, 1, 1,
0.07295385, -0.09643238, 2.327506, 0, 0.827451, 1, 1,
0.07977743, 0.2625026, -0.09670211, 0, 0.8196079, 1, 1,
0.08706486, 0.7110846, 0.05175551, 0, 0.8156863, 1, 1,
0.08849168, 1.191166, -0.4682121, 0, 0.8078431, 1, 1,
0.09041011, 1.57889, 0.5568725, 0, 0.8039216, 1, 1,
0.09309054, 0.2550638, 0.1951157, 0, 0.7960784, 1, 1,
0.09410289, 0.1487202, 0.8474303, 0, 0.7882353, 1, 1,
0.09632023, 0.5886673, -0.8351749, 0, 0.7843137, 1, 1,
0.09758466, 0.6092868, -0.003053779, 0, 0.7764706, 1, 1,
0.09766404, -1.672599, 1.70951, 0, 0.772549, 1, 1,
0.1074327, -1.187762, 3.888662, 0, 0.7647059, 1, 1,
0.1089075, 1.211217, -0.1756083, 0, 0.7607843, 1, 1,
0.1103826, 0.1031764, 1.073563, 0, 0.7529412, 1, 1,
0.1121096, -0.02983579, 1.912792, 0, 0.7490196, 1, 1,
0.114675, -1.529563, 2.613224, 0, 0.7411765, 1, 1,
0.116556, -0.6524157, 3.215082, 0, 0.7372549, 1, 1,
0.1180754, -0.4196653, 2.692524, 0, 0.7294118, 1, 1,
0.1183996, 0.696663, 0.9194418, 0, 0.7254902, 1, 1,
0.1284073, 0.08744149, 0.8920686, 0, 0.7176471, 1, 1,
0.1341847, -1.05201, 1.120715, 0, 0.7137255, 1, 1,
0.1345359, -0.6971563, 3.116557, 0, 0.7058824, 1, 1,
0.1351146, 0.6967483, -1.282771, 0, 0.6980392, 1, 1,
0.1365665, -2.544568, 2.591578, 0, 0.6941177, 1, 1,
0.1385687, 0.7751657, -0.3801652, 0, 0.6862745, 1, 1,
0.1436268, 0.374319, -0.2669945, 0, 0.682353, 1, 1,
0.1439582, 0.191547, 0.6970282, 0, 0.6745098, 1, 1,
0.1484772, 0.6115794, 0.7477591, 0, 0.6705883, 1, 1,
0.1513565, 0.02241575, 2.000093, 0, 0.6627451, 1, 1,
0.1527648, -1.378518, 2.971037, 0, 0.6588235, 1, 1,
0.1531876, 0.05445496, 0.5857104, 0, 0.6509804, 1, 1,
0.1609032, -0.196806, 3.361448, 0, 0.6470588, 1, 1,
0.1609617, -0.5976247, 1.511255, 0, 0.6392157, 1, 1,
0.1622911, -0.4140451, 3.416632, 0, 0.6352941, 1, 1,
0.1631985, 1.142625, 0.8645588, 0, 0.627451, 1, 1,
0.1697317, -1.43128, 3.139639, 0, 0.6235294, 1, 1,
0.1706198, -0.7999339, 2.494555, 0, 0.6156863, 1, 1,
0.1749826, -1.227113, 3.982145, 0, 0.6117647, 1, 1,
0.1780453, 1.702589, -0.1081534, 0, 0.6039216, 1, 1,
0.1841094, -0.9666661, 3.33141, 0, 0.5960785, 1, 1,
0.1843618, 0.3599284, 1.698603, 0, 0.5921569, 1, 1,
0.1845465, 1.011578, -0.4940607, 0, 0.5843138, 1, 1,
0.1900019, -0.1323383, 4.656917, 0, 0.5803922, 1, 1,
0.1964921, 0.9126885, 1.222136, 0, 0.572549, 1, 1,
0.1998846, 1.137673, 0.02263716, 0, 0.5686275, 1, 1,
0.2024653, 0.1196602, 1.475612, 0, 0.5607843, 1, 1,
0.2030315, 0.3235876, 0.9073894, 0, 0.5568628, 1, 1,
0.2095496, 0.4331369, -0.0703001, 0, 0.5490196, 1, 1,
0.2108715, -0.603069, 1.218694, 0, 0.5450981, 1, 1,
0.2109138, -1.15655, 2.394267, 0, 0.5372549, 1, 1,
0.2124788, -1.154868, 2.114004, 0, 0.5333334, 1, 1,
0.2130427, 0.1016038, 2.438973, 0, 0.5254902, 1, 1,
0.2142139, 0.05486576, -0.282041, 0, 0.5215687, 1, 1,
0.2147121, 0.02235792, -0.1984933, 0, 0.5137255, 1, 1,
0.2178777, -1.280073, 3.401934, 0, 0.509804, 1, 1,
0.2191597, -1.461466, 3.311688, 0, 0.5019608, 1, 1,
0.2200056, 0.665674, -0.0134164, 0, 0.4941176, 1, 1,
0.2272666, 0.003190888, 1.042073, 0, 0.4901961, 1, 1,
0.2362638, -0.5161613, 2.942765, 0, 0.4823529, 1, 1,
0.2416863, 0.03326812, 2.945362, 0, 0.4784314, 1, 1,
0.2455486, -0.1743428, 2.10709, 0, 0.4705882, 1, 1,
0.2504409, -0.72346, 1.202436, 0, 0.4666667, 1, 1,
0.2537656, 1.585254, 1.350414, 0, 0.4588235, 1, 1,
0.2559704, -0.8878343, 2.527265, 0, 0.454902, 1, 1,
0.2619283, -1.494477, 2.557177, 0, 0.4470588, 1, 1,
0.2639132, -1.285755, 3.628603, 0, 0.4431373, 1, 1,
0.2648131, 0.6247486, 0.889869, 0, 0.4352941, 1, 1,
0.2651822, 0.1154081, 0.5941298, 0, 0.4313726, 1, 1,
0.2655353, 1.097596, 1.105809, 0, 0.4235294, 1, 1,
0.2682534, -0.6455554, 3.409302, 0, 0.4196078, 1, 1,
0.2711587, -0.006776535, 0.693442, 0, 0.4117647, 1, 1,
0.2725312, 0.4888784, 0.6322906, 0, 0.4078431, 1, 1,
0.2745675, -0.8875551, 4.443234, 0, 0.4, 1, 1,
0.2800573, -0.04097417, 0.7842154, 0, 0.3921569, 1, 1,
0.285152, 1.254164, 0.8550175, 0, 0.3882353, 1, 1,
0.2855687, -1.158274, 4.011461, 0, 0.3803922, 1, 1,
0.2857134, -1.735403, 3.706739, 0, 0.3764706, 1, 1,
0.2885707, 0.407539, 1.705141, 0, 0.3686275, 1, 1,
0.2958437, -1.056799, 0.9018679, 0, 0.3647059, 1, 1,
0.2965965, 1.277421, 2.975666, 0, 0.3568628, 1, 1,
0.3001506, -0.7127526, 3.87556, 0, 0.3529412, 1, 1,
0.3012739, 0.692403, 0.3093188, 0, 0.345098, 1, 1,
0.3056506, -0.579164, 3.444185, 0, 0.3411765, 1, 1,
0.3083048, -0.725321, 2.854074, 0, 0.3333333, 1, 1,
0.3084811, -1.837064, 3.847439, 0, 0.3294118, 1, 1,
0.3085632, 1.679461, -0.3069309, 0, 0.3215686, 1, 1,
0.3105131, -0.02856082, 0.7003198, 0, 0.3176471, 1, 1,
0.3111488, 1.004808, 1.827019, 0, 0.3098039, 1, 1,
0.3247733, -1.165491, 1.92207, 0, 0.3058824, 1, 1,
0.3252923, -0.8616939, 2.859362, 0, 0.2980392, 1, 1,
0.3280157, 0.07510668, 1.976722, 0, 0.2901961, 1, 1,
0.328327, -1.879185, 2.395447, 0, 0.2862745, 1, 1,
0.3330265, -0.1285287, 2.122644, 0, 0.2784314, 1, 1,
0.3333811, -0.5867684, 1.969811, 0, 0.2745098, 1, 1,
0.3379147, 0.7115747, -0.1202356, 0, 0.2666667, 1, 1,
0.3386419, -0.2658204, 2.037204, 0, 0.2627451, 1, 1,
0.3395837, 0.08430104, 2.311571, 0, 0.254902, 1, 1,
0.3440889, -0.3609228, 3.293652, 0, 0.2509804, 1, 1,
0.3452011, 0.9401231, -1.667916, 0, 0.2431373, 1, 1,
0.3455302, 0.7187633, 0.1250887, 0, 0.2392157, 1, 1,
0.3455797, -0.863764, 2.081774, 0, 0.2313726, 1, 1,
0.3527471, -0.01474454, 2.836278, 0, 0.227451, 1, 1,
0.3535787, 0.7099274, 1.181684, 0, 0.2196078, 1, 1,
0.3556636, -1.704258, 3.40734, 0, 0.2156863, 1, 1,
0.3567241, 1.213477, 1.22096, 0, 0.2078431, 1, 1,
0.356829, 0.2197534, 0.2503011, 0, 0.2039216, 1, 1,
0.3576121, 1.098902, 1.654101, 0, 0.1960784, 1, 1,
0.3583503, -1.043922, 3.989856, 0, 0.1882353, 1, 1,
0.3583537, 0.5845782, -0.5339052, 0, 0.1843137, 1, 1,
0.3598793, -1.209489, 2.100589, 0, 0.1764706, 1, 1,
0.3609555, 1.202304, -0.2987043, 0, 0.172549, 1, 1,
0.3613636, 1.28754, 0.2739384, 0, 0.1647059, 1, 1,
0.3617277, -1.149579, 1.467244, 0, 0.1607843, 1, 1,
0.3664733, -0.3222142, 1.128511, 0, 0.1529412, 1, 1,
0.3679641, -1.90206, 3.046962, 0, 0.1490196, 1, 1,
0.3729129, -1.780331, 2.867928, 0, 0.1411765, 1, 1,
0.3754166, -0.7678927, 2.185267, 0, 0.1372549, 1, 1,
0.3805957, 0.09232053, 1.998717, 0, 0.1294118, 1, 1,
0.3807008, -0.09268719, 2.380633, 0, 0.1254902, 1, 1,
0.380744, -0.4919761, 1.943467, 0, 0.1176471, 1, 1,
0.3869871, 1.032137, 0.5425166, 0, 0.1137255, 1, 1,
0.3870357, -0.7859756, 3.211645, 0, 0.1058824, 1, 1,
0.3907498, 0.5764887, 1.477086, 0, 0.09803922, 1, 1,
0.3945185, -0.1944717, 2.814238, 0, 0.09411765, 1, 1,
0.3995961, 1.278912, -1.351495, 0, 0.08627451, 1, 1,
0.3996054, -0.2837564, 4.278641, 0, 0.08235294, 1, 1,
0.401176, 0.4924733, 1.286397, 0, 0.07450981, 1, 1,
0.4078859, -1.2167, 1.682669, 0, 0.07058824, 1, 1,
0.4081336, -0.7239546, 2.15514, 0, 0.0627451, 1, 1,
0.4132319, -0.5243502, 2.642012, 0, 0.05882353, 1, 1,
0.4159636, -0.1176192, 2.049165, 0, 0.05098039, 1, 1,
0.4189701, 0.9253438, 1.315058, 0, 0.04705882, 1, 1,
0.4219927, -0.4515588, 2.029372, 0, 0.03921569, 1, 1,
0.4331065, 1.168494, 0.3977289, 0, 0.03529412, 1, 1,
0.4356926, 0.8917629, -1.439126, 0, 0.02745098, 1, 1,
0.4371549, 0.4106336, 2.023455, 0, 0.02352941, 1, 1,
0.4407931, 1.238087, -1.353196, 0, 0.01568628, 1, 1,
0.441006, -1.08409, 3.676967, 0, 0.01176471, 1, 1,
0.4428536, 0.5329567, 1.33908, 0, 0.003921569, 1, 1,
0.4449658, 0.2919076, 1.946202, 0.003921569, 0, 1, 1,
0.4472268, -0.9191184, 3.370603, 0.007843138, 0, 1, 1,
0.4494007, 0.4221258, 0.868182, 0.01568628, 0, 1, 1,
0.4502563, -0.7033166, 1.915073, 0.01960784, 0, 1, 1,
0.4564871, 0.5216259, 0.2736938, 0.02745098, 0, 1, 1,
0.4587059, 0.6328414, -0.09372806, 0.03137255, 0, 1, 1,
0.4728991, 0.9767729, 2.89675, 0.03921569, 0, 1, 1,
0.4746816, -1.628769, 3.01196, 0.04313726, 0, 1, 1,
0.4754498, -1.097795, 1.507359, 0.05098039, 0, 1, 1,
0.4775788, 0.2403187, 0.2103717, 0.05490196, 0, 1, 1,
0.4817645, 0.9304169, 0.8003193, 0.0627451, 0, 1, 1,
0.485244, 0.5654999, 0.6755736, 0.06666667, 0, 1, 1,
0.4871477, -1.448295, 3.524626, 0.07450981, 0, 1, 1,
0.4942125, -0.5310035, 3.2765, 0.07843138, 0, 1, 1,
0.496236, -0.9362503, 3.254515, 0.08627451, 0, 1, 1,
0.502324, 2.787034, 1.704024, 0.09019608, 0, 1, 1,
0.5033359, 1.3294, -0.868477, 0.09803922, 0, 1, 1,
0.5061332, 0.2046384, 0.002909867, 0.1058824, 0, 1, 1,
0.5066393, 1.426698, 1.061574, 0.1098039, 0, 1, 1,
0.5243922, 2.02463, 0.7566525, 0.1176471, 0, 1, 1,
0.5276719, -0.3072521, 2.040962, 0.1215686, 0, 1, 1,
0.5304044, -1.141656, 3.610915, 0.1294118, 0, 1, 1,
0.5367103, 0.4972973, 0.7367264, 0.1333333, 0, 1, 1,
0.5390929, 1.167498, 0.6921912, 0.1411765, 0, 1, 1,
0.5460101, 0.182663, 1.5495, 0.145098, 0, 1, 1,
0.5461967, 0.7751095, 1.362482, 0.1529412, 0, 1, 1,
0.5464917, 1.842133, 1.040025, 0.1568628, 0, 1, 1,
0.5481774, 0.5210094, 0.581749, 0.1647059, 0, 1, 1,
0.5498729, 0.6548034, 2.135684, 0.1686275, 0, 1, 1,
0.5498751, 1.932351, 1.438957, 0.1764706, 0, 1, 1,
0.5512984, -0.3379574, 1.933431, 0.1803922, 0, 1, 1,
0.5532696, 0.9700266, 1.654061, 0.1882353, 0, 1, 1,
0.5549973, 1.966442, 0.1599871, 0.1921569, 0, 1, 1,
0.5575754, -0.6858384, 3.90909, 0.2, 0, 1, 1,
0.5577708, 0.3159113, 1.864045, 0.2078431, 0, 1, 1,
0.5618247, 0.0008300633, 0.7636099, 0.2117647, 0, 1, 1,
0.5684727, -0.1304644, 1.330626, 0.2196078, 0, 1, 1,
0.56849, -0.7023807, 1.806839, 0.2235294, 0, 1, 1,
0.5700747, -1.577983, 3.08952, 0.2313726, 0, 1, 1,
0.5720723, -0.1482825, 1.871598, 0.2352941, 0, 1, 1,
0.5764672, -1.30933, 2.43597, 0.2431373, 0, 1, 1,
0.5768616, -0.1692939, 1.944421, 0.2470588, 0, 1, 1,
0.5789469, -1.434842, 1.674843, 0.254902, 0, 1, 1,
0.5816869, -0.9109442, 0.1127898, 0.2588235, 0, 1, 1,
0.5817458, -1.936395, 1.787006, 0.2666667, 0, 1, 1,
0.5878864, -0.1371191, 2.062366, 0.2705882, 0, 1, 1,
0.5906842, -0.100578, 3.234795, 0.2784314, 0, 1, 1,
0.593214, 1.054236, 1.014897, 0.282353, 0, 1, 1,
0.5933683, 1.18854, 3.05647, 0.2901961, 0, 1, 1,
0.5968498, -0.5169637, 1.906171, 0.2941177, 0, 1, 1,
0.5988663, -2.490933, 3.042537, 0.3019608, 0, 1, 1,
0.6016844, 0.3149203, 0.4647891, 0.3098039, 0, 1, 1,
0.6023595, 0.05180194, 2.663037, 0.3137255, 0, 1, 1,
0.603753, 0.1946229, 2.110442, 0.3215686, 0, 1, 1,
0.6060029, 1.201315, 1.544005, 0.3254902, 0, 1, 1,
0.6103792, 1.798675, 0.2039868, 0.3333333, 0, 1, 1,
0.618062, -0.3565217, 3.477241, 0.3372549, 0, 1, 1,
0.6188635, -0.4449049, 2.872332, 0.345098, 0, 1, 1,
0.6195018, -1.961348, 4.822768, 0.3490196, 0, 1, 1,
0.6199874, -0.5161291, 1.124337, 0.3568628, 0, 1, 1,
0.6208139, 1.629129, 1.020672, 0.3607843, 0, 1, 1,
0.6213711, -0.3646537, 2.750847, 0.3686275, 0, 1, 1,
0.6220977, 0.8677071, 1.994408, 0.372549, 0, 1, 1,
0.6233047, 0.7426654, 0.7273238, 0.3803922, 0, 1, 1,
0.6257309, 0.3631361, 1.494627, 0.3843137, 0, 1, 1,
0.6262975, 1.012882, 1.458427, 0.3921569, 0, 1, 1,
0.6292266, -0.03136535, 1.772459, 0.3960784, 0, 1, 1,
0.6351411, 0.7654997, -0.4194651, 0.4039216, 0, 1, 1,
0.6360568, 1.278793, 0.8514435, 0.4117647, 0, 1, 1,
0.6367906, 0.882887, 2.450972, 0.4156863, 0, 1, 1,
0.6392394, -1.061835, 1.176184, 0.4235294, 0, 1, 1,
0.6394804, -0.8589612, 3.53065, 0.427451, 0, 1, 1,
0.6404336, -0.0708857, 1.76986, 0.4352941, 0, 1, 1,
0.6420259, 1.021791, -0.07000777, 0.4392157, 0, 1, 1,
0.6438943, -1.292391, 2.711534, 0.4470588, 0, 1, 1,
0.6491092, -0.7692728, 3.734725, 0.4509804, 0, 1, 1,
0.6569964, -2.311366, 0.649543, 0.4588235, 0, 1, 1,
0.6578516, 1.145756, 0.4875581, 0.4627451, 0, 1, 1,
0.6583048, 0.2498944, 0.5481864, 0.4705882, 0, 1, 1,
0.6602728, 1.473449, -1.479527, 0.4745098, 0, 1, 1,
0.6614276, -1.444956, 3.176906, 0.4823529, 0, 1, 1,
0.664786, -0.3602019, 2.121243, 0.4862745, 0, 1, 1,
0.669517, -0.8432378, 2.577495, 0.4941176, 0, 1, 1,
0.6751027, 0.1782977, 1.455587, 0.5019608, 0, 1, 1,
0.6780238, -0.4713314, 4.300851, 0.5058824, 0, 1, 1,
0.6793054, 0.21672, 1.377058, 0.5137255, 0, 1, 1,
0.6813338, 1.955347, 0.2762415, 0.5176471, 0, 1, 1,
0.6822852, -0.9812777, 3.472967, 0.5254902, 0, 1, 1,
0.6834303, 0.6106434, 0.8903718, 0.5294118, 0, 1, 1,
0.6862849, 1.74769, 1.180682, 0.5372549, 0, 1, 1,
0.6973785, 1.591438, 0.2334667, 0.5411765, 0, 1, 1,
0.7016906, -0.1416481, 1.75699, 0.5490196, 0, 1, 1,
0.7036345, -1.4799, 4.271206, 0.5529412, 0, 1, 1,
0.7081103, 2.079821, 0.1365232, 0.5607843, 0, 1, 1,
0.7133685, -0.124829, 2.462788, 0.5647059, 0, 1, 1,
0.7167185, 1.923203, 1.068028, 0.572549, 0, 1, 1,
0.7174187, -2.858437, 3.29748, 0.5764706, 0, 1, 1,
0.7216023, 0.7681139, 1.535561, 0.5843138, 0, 1, 1,
0.7240114, 0.042135, 1.240327, 0.5882353, 0, 1, 1,
0.7252142, -1.201278, 3.076489, 0.5960785, 0, 1, 1,
0.7318457, -0.3664161, 1.584787, 0.6039216, 0, 1, 1,
0.7387249, 0.5577637, 1.759917, 0.6078432, 0, 1, 1,
0.7423744, -0.9761566, 2.816733, 0.6156863, 0, 1, 1,
0.7440516, 0.6115276, -0.3314211, 0.6196079, 0, 1, 1,
0.7457021, -0.6182486, 1.824238, 0.627451, 0, 1, 1,
0.7467157, 0.882481, 0.9205773, 0.6313726, 0, 1, 1,
0.7500453, -0.2872282, 1.258033, 0.6392157, 0, 1, 1,
0.7593436, -0.9645091, 2.318155, 0.6431373, 0, 1, 1,
0.7679365, 0.09592245, 1.541334, 0.6509804, 0, 1, 1,
0.7724257, 0.8504551, -0.1050759, 0.654902, 0, 1, 1,
0.7744761, 0.4591119, -0.8046659, 0.6627451, 0, 1, 1,
0.7853359, -0.8842937, 2.664711, 0.6666667, 0, 1, 1,
0.7889879, 1.002227, 1.741599, 0.6745098, 0, 1, 1,
0.7892019, 0.6092556, 0.4336453, 0.6784314, 0, 1, 1,
0.7897235, 0.4716265, 0.6052351, 0.6862745, 0, 1, 1,
0.7975768, -1.586005, 2.741939, 0.6901961, 0, 1, 1,
0.7995743, 1.577886, 0.01145621, 0.6980392, 0, 1, 1,
0.7999304, 0.6682824, -0.02034606, 0.7058824, 0, 1, 1,
0.8032385, 0.8159935, 1.161501, 0.7098039, 0, 1, 1,
0.8045844, 0.3043858, 1.78607, 0.7176471, 0, 1, 1,
0.8055153, 0.5488463, 0.3622884, 0.7215686, 0, 1, 1,
0.8057368, 0.4511383, 2.072576, 0.7294118, 0, 1, 1,
0.8111316, -2.2269, 3.372779, 0.7333333, 0, 1, 1,
0.8136495, -1.575035, 2.896492, 0.7411765, 0, 1, 1,
0.8151116, 0.1871824, 0.0871897, 0.7450981, 0, 1, 1,
0.8172659, 1.439345, -0.6751527, 0.7529412, 0, 1, 1,
0.8215113, 1.25449, 0.716461, 0.7568628, 0, 1, 1,
0.825215, 0.7787618, 0.9205255, 0.7647059, 0, 1, 1,
0.8257265, 0.778137, 0.2296076, 0.7686275, 0, 1, 1,
0.8264645, -0.01094637, 1.096261, 0.7764706, 0, 1, 1,
0.8266959, 1.933846, 0.1339201, 0.7803922, 0, 1, 1,
0.8275322, 0.1016293, -1.06225, 0.7882353, 0, 1, 1,
0.8275385, -0.9408936, 2.310899, 0.7921569, 0, 1, 1,
0.829739, -0.3525923, 3.174834, 0.8, 0, 1, 1,
0.8298213, -0.3224464, 1.347435, 0.8078431, 0, 1, 1,
0.8328391, -0.3855113, 1.938833, 0.8117647, 0, 1, 1,
0.8381515, 1.694322, 0.3117518, 0.8196079, 0, 1, 1,
0.8395808, -0.03003504, 3.47244, 0.8235294, 0, 1, 1,
0.8443862, 0.1878146, 0.7754752, 0.8313726, 0, 1, 1,
0.8445925, 0.3764321, 1.454717, 0.8352941, 0, 1, 1,
0.845589, -0.3341145, 0.727547, 0.8431373, 0, 1, 1,
0.8460248, 1.931147, 0.4916039, 0.8470588, 0, 1, 1,
0.8539949, -0.3160792, 0.6349388, 0.854902, 0, 1, 1,
0.857343, -1.091533, 3.153869, 0.8588235, 0, 1, 1,
0.8695139, 0.1484636, 1.488386, 0.8666667, 0, 1, 1,
0.8732917, 0.2083356, -0.6765175, 0.8705882, 0, 1, 1,
0.8814583, 1.121511, 0.01117955, 0.8784314, 0, 1, 1,
0.8858602, 0.1486722, 2.734931, 0.8823529, 0, 1, 1,
0.8875377, -0.8632012, 4.078694, 0.8901961, 0, 1, 1,
0.8924139, 0.33911, 1.285238, 0.8941177, 0, 1, 1,
0.8958064, 1.047662, 0.04774218, 0.9019608, 0, 1, 1,
0.9035422, 0.339952, 1.052256, 0.9098039, 0, 1, 1,
0.9105071, 0.120247, 3.217417, 0.9137255, 0, 1, 1,
0.9106361, -0.1564659, 3.728611, 0.9215686, 0, 1, 1,
0.915272, -0.39324, 0.3150537, 0.9254902, 0, 1, 1,
0.9177146, 0.265938, 1.070382, 0.9333333, 0, 1, 1,
0.9233389, -0.0544246, 1.954409, 0.9372549, 0, 1, 1,
0.9259233, 0.3431648, 2.057057, 0.945098, 0, 1, 1,
0.9266576, 0.6888433, 0.7183307, 0.9490196, 0, 1, 1,
0.927726, -0.5826577, 1.704945, 0.9568627, 0, 1, 1,
0.930541, 0.7191911, -0.4971823, 0.9607843, 0, 1, 1,
0.931608, -0.2984478, 3.972029, 0.9686275, 0, 1, 1,
0.9354516, -0.6715475, 3.511929, 0.972549, 0, 1, 1,
0.9410889, -0.7133001, 3.06866, 0.9803922, 0, 1, 1,
0.9449608, 0.9728649, -0.3179141, 0.9843137, 0, 1, 1,
0.9470451, -1.708548, 3.416792, 0.9921569, 0, 1, 1,
0.9673529, -0.6932378, 2.596201, 0.9960784, 0, 1, 1,
0.9744265, -0.7624949, 2.870251, 1, 0, 0.9960784, 1,
0.9782967, 0.6070201, 1.094969, 1, 0, 0.9882353, 1,
0.9785054, -0.2355135, 0.3082846, 1, 0, 0.9843137, 1,
0.9845635, -0.073199, 3.790391, 1, 0, 0.9764706, 1,
0.9909682, 1.176238, -0.02659699, 1, 0, 0.972549, 1,
0.9967217, 1.685821, -0.1809374, 1, 0, 0.9647059, 1,
0.9997732, 0.5756957, 1.782511, 1, 0, 0.9607843, 1,
1.017625, 0.3468597, 2.466407, 1, 0, 0.9529412, 1,
1.020408, -0.8221881, 2.193433, 1, 0, 0.9490196, 1,
1.021057, 1.945848, 0.4273063, 1, 0, 0.9411765, 1,
1.029537, 0.8506692, -0.4205935, 1, 0, 0.9372549, 1,
1.030573, 0.1109101, 0.7526703, 1, 0, 0.9294118, 1,
1.037943, 0.2688129, 0.8711991, 1, 0, 0.9254902, 1,
1.038262, -1.086747, 2.004755, 1, 0, 0.9176471, 1,
1.039696, 1.069739, 2.797372, 1, 0, 0.9137255, 1,
1.040452, 0.2686238, 1.974049, 1, 0, 0.9058824, 1,
1.041059, 0.6762248, 1.632455, 1, 0, 0.9019608, 1,
1.041839, -0.6138544, -0.01894508, 1, 0, 0.8941177, 1,
1.044463, -0.5438015, 1.18943, 1, 0, 0.8862745, 1,
1.056607, 0.8003473, 1.815522, 1, 0, 0.8823529, 1,
1.067628, 0.7710217, 2.448596, 1, 0, 0.8745098, 1,
1.06883, 0.3095442, 3.450957, 1, 0, 0.8705882, 1,
1.070643, 1.385124, -0.5097783, 1, 0, 0.8627451, 1,
1.071346, 0.1468226, 1.077517, 1, 0, 0.8588235, 1,
1.075352, 0.3227543, -0.4533575, 1, 0, 0.8509804, 1,
1.076898, 0.6354752, -1.424571, 1, 0, 0.8470588, 1,
1.077825, 0.07742926, 2.060039, 1, 0, 0.8392157, 1,
1.079838, -0.3546596, -0.9507365, 1, 0, 0.8352941, 1,
1.085117, 0.4663617, 0.276441, 1, 0, 0.827451, 1,
1.085506, -1.133916, 1.55569, 1, 0, 0.8235294, 1,
1.086009, 0.8684192, -0.1496722, 1, 0, 0.8156863, 1,
1.092257, 1.167658, 3.020256, 1, 0, 0.8117647, 1,
1.100736, -0.1583047, 1.614823, 1, 0, 0.8039216, 1,
1.101255, -0.7688035, 2.021621, 1, 0, 0.7960784, 1,
1.10174, -1.168164, 3.07402, 1, 0, 0.7921569, 1,
1.104947, 1.379699, 0.3999228, 1, 0, 0.7843137, 1,
1.106675, 0.4390688, -0.717245, 1, 0, 0.7803922, 1,
1.1099, 1.993361, 0.07469265, 1, 0, 0.772549, 1,
1.116267, -1.746278, 3.09449, 1, 0, 0.7686275, 1,
1.122942, 1.097878, 2.245799, 1, 0, 0.7607843, 1,
1.139192, -0.189516, 1.374098, 1, 0, 0.7568628, 1,
1.140528, 0.3321356, 0.4708011, 1, 0, 0.7490196, 1,
1.141359, -1.313837, 3.001014, 1, 0, 0.7450981, 1,
1.142927, 1.078076, 2.245389, 1, 0, 0.7372549, 1,
1.152223, -1.157267, 0.7082331, 1, 0, 0.7333333, 1,
1.153336, -0.3509161, 1.54026, 1, 0, 0.7254902, 1,
1.157405, 0.1355783, 2.969172, 1, 0, 0.7215686, 1,
1.15888, 0.9311051, -0.3802358, 1, 0, 0.7137255, 1,
1.169723, 1.036475, -0.118433, 1, 0, 0.7098039, 1,
1.176879, -0.5765427, 1.163025, 1, 0, 0.7019608, 1,
1.180891, 0.4842253, 2.933473, 1, 0, 0.6941177, 1,
1.193713, 0.8485965, -0.1518804, 1, 0, 0.6901961, 1,
1.20327, 0.482316, -0.6804621, 1, 0, 0.682353, 1,
1.205799, -0.5566888, 4.284882, 1, 0, 0.6784314, 1,
1.210027, 1.490343, -0.5537713, 1, 0, 0.6705883, 1,
1.212089, 0.07264821, 2.640091, 1, 0, 0.6666667, 1,
1.222539, 0.279937, 0.3627001, 1, 0, 0.6588235, 1,
1.229042, 0.2127132, 0.8527227, 1, 0, 0.654902, 1,
1.233107, 0.8934356, 1.222208, 1, 0, 0.6470588, 1,
1.234248, -0.5364847, 2.488794, 1, 0, 0.6431373, 1,
1.246452, 0.502662, -0.2630942, 1, 0, 0.6352941, 1,
1.249324, -1.113685, 3.271754, 1, 0, 0.6313726, 1,
1.251567, 1.198331, 1.815907, 1, 0, 0.6235294, 1,
1.265926, -0.6599502, 1.018321, 1, 0, 0.6196079, 1,
1.269895, -0.7679226, 2.576834, 1, 0, 0.6117647, 1,
1.279829, 0.3502412, 1.314502, 1, 0, 0.6078432, 1,
1.292346, 0.6967846, 2.392874, 1, 0, 0.6, 1,
1.295516, -2.143458, 3.334955, 1, 0, 0.5921569, 1,
1.300113, -2.019471, 2.719828, 1, 0, 0.5882353, 1,
1.30841, 1.067571, 2.704267, 1, 0, 0.5803922, 1,
1.310108, -0.005195722, 0.4650367, 1, 0, 0.5764706, 1,
1.310672, -1.086277, 4.578918, 1, 0, 0.5686275, 1,
1.320446, 1.933847, 1.159901, 1, 0, 0.5647059, 1,
1.324739, -0.363678, -0.3609937, 1, 0, 0.5568628, 1,
1.326341, -0.7299512, 3.254226, 1, 0, 0.5529412, 1,
1.339012, -0.7497676, 3.100016, 1, 0, 0.5450981, 1,
1.339727, 1.06425, 2.990981, 1, 0, 0.5411765, 1,
1.35586, -0.4360555, -0.2666621, 1, 0, 0.5333334, 1,
1.359048, 0.6803778, 0.3699766, 1, 0, 0.5294118, 1,
1.361983, -3.082502, 3.432896, 1, 0, 0.5215687, 1,
1.363594, 1.004469, 1.049023, 1, 0, 0.5176471, 1,
1.366486, 1.529736, 1.78597, 1, 0, 0.509804, 1,
1.4226, -0.3167997, 2.590993, 1, 0, 0.5058824, 1,
1.439336, 1.602827, 1.735149, 1, 0, 0.4980392, 1,
1.44128, -0.7786644, 2.475517, 1, 0, 0.4901961, 1,
1.448763, -0.7064399, 2.196815, 1, 0, 0.4862745, 1,
1.478497, -0.1819978, 3.159362, 1, 0, 0.4784314, 1,
1.480153, 0.812946, 0.03481865, 1, 0, 0.4745098, 1,
1.489372, 0.7645424, 2.561992, 1, 0, 0.4666667, 1,
1.490126, -0.6543444, 2.434586, 1, 0, 0.4627451, 1,
1.491382, 1.611751, 0.4701119, 1, 0, 0.454902, 1,
1.492268, 2.311072, -1.700574, 1, 0, 0.4509804, 1,
1.497924, -1.767848, 3.414599, 1, 0, 0.4431373, 1,
1.498141, 1.742341, 1.040541, 1, 0, 0.4392157, 1,
1.503122, 0.430858, -0.6300251, 1, 0, 0.4313726, 1,
1.503259, -0.3808817, 1.865803, 1, 0, 0.427451, 1,
1.505692, 0.5727746, -0.3053541, 1, 0, 0.4196078, 1,
1.514266, 0.9370499, 0.4788623, 1, 0, 0.4156863, 1,
1.514372, -0.9609289, 2.082581, 1, 0, 0.4078431, 1,
1.517244, 2.116347, 0.6937822, 1, 0, 0.4039216, 1,
1.527423, 0.7789844, 1.669705, 1, 0, 0.3960784, 1,
1.529985, 1.536097, -1.480375, 1, 0, 0.3882353, 1,
1.537742, 0.9397394, 0.309009, 1, 0, 0.3843137, 1,
1.575202, -0.9018282, 3.065844, 1, 0, 0.3764706, 1,
1.57939, 0.5114971, 2.179485, 1, 0, 0.372549, 1,
1.585279, 0.007104944, 0.3637612, 1, 0, 0.3647059, 1,
1.636338, 0.2489338, 1.427597, 1, 0, 0.3607843, 1,
1.636665, -0.1986118, 1.08542, 1, 0, 0.3529412, 1,
1.638111, -1.060318, 1.62993, 1, 0, 0.3490196, 1,
1.650557, -0.09989658, 2.233909, 1, 0, 0.3411765, 1,
1.652054, -0.04999411, 1.303227, 1, 0, 0.3372549, 1,
1.658597, 0.8383198, 2.908451, 1, 0, 0.3294118, 1,
1.671677, -0.6381569, 3.252007, 1, 0, 0.3254902, 1,
1.684975, 1.73779, 0.3225921, 1, 0, 0.3176471, 1,
1.687598, 1.674405, 4.507952, 1, 0, 0.3137255, 1,
1.702355, -0.2564948, 2.450264, 1, 0, 0.3058824, 1,
1.708772, -0.1315118, 1.134839, 1, 0, 0.2980392, 1,
1.713104, -1.295711, 2.080507, 1, 0, 0.2941177, 1,
1.754696, -1.016559, 2.271969, 1, 0, 0.2862745, 1,
1.788267, -1.067275, 2.557424, 1, 0, 0.282353, 1,
1.790309, -0.4030759, 2.090044, 1, 0, 0.2745098, 1,
1.794395, -1.647357, 1.522995, 1, 0, 0.2705882, 1,
1.816206, -0.2734044, 1.749995, 1, 0, 0.2627451, 1,
1.823759, 0.4053184, 1.766272, 1, 0, 0.2588235, 1,
1.824229, 1.251748, 1.186403, 1, 0, 0.2509804, 1,
1.828467, 1.879176, 1.603978, 1, 0, 0.2470588, 1,
1.831236, -0.6128733, 2.32826, 1, 0, 0.2392157, 1,
1.845693, 1.341198, 0.8548064, 1, 0, 0.2352941, 1,
1.870986, -1.896082, 0.8137527, 1, 0, 0.227451, 1,
1.875845, 0.6791725, 1.122066, 1, 0, 0.2235294, 1,
1.882775, -1.901172, 4.113425, 1, 0, 0.2156863, 1,
1.909557, 0.6831275, 0.1715085, 1, 0, 0.2117647, 1,
1.933754, 0.5229298, 1.745104, 1, 0, 0.2039216, 1,
1.954535, 0.2137309, 1.81759, 1, 0, 0.1960784, 1,
1.977254, -0.5576123, 1.727717, 1, 0, 0.1921569, 1,
1.986604, 0.03642439, 1.109047, 1, 0, 0.1843137, 1,
1.990499, -1.348287, 3.884881, 1, 0, 0.1803922, 1,
1.993551, -0.6227949, 2.629393, 1, 0, 0.172549, 1,
2.007498, -0.5955687, 1.757435, 1, 0, 0.1686275, 1,
2.025999, -2.401551, 2.0941, 1, 0, 0.1607843, 1,
2.037096, 1.282077, 0.8991207, 1, 0, 0.1568628, 1,
2.059658, 1.232304, 1.699438, 1, 0, 0.1490196, 1,
2.086889, -0.2726142, 0.4016714, 1, 0, 0.145098, 1,
2.089393, 0.5030274, 0.7824643, 1, 0, 0.1372549, 1,
2.109492, 0.34387, 2.761989, 1, 0, 0.1333333, 1,
2.132473, 0.1680993, 0.9800659, 1, 0, 0.1254902, 1,
2.201086, 0.3415294, 1.923903, 1, 0, 0.1215686, 1,
2.309584, -0.4394631, 2.065591, 1, 0, 0.1137255, 1,
2.310548, 0.5628182, 1.493593, 1, 0, 0.1098039, 1,
2.314827, 0.9803893, 1.928142, 1, 0, 0.1019608, 1,
2.319955, -0.2073399, 1.694571, 1, 0, 0.09411765, 1,
2.343951, -0.7051561, 1.288938, 1, 0, 0.09019608, 1,
2.347251, -0.03894049, -0.3084328, 1, 0, 0.08235294, 1,
2.37736, 0.8951908, 0.8322181, 1, 0, 0.07843138, 1,
2.385818, 1.789694, 2.829309, 1, 0, 0.07058824, 1,
2.417205, 0.2929989, 0.7667526, 1, 0, 0.06666667, 1,
2.460214, 1.389726, 1.828513, 1, 0, 0.05882353, 1,
2.484369, -0.4271152, 0.8998399, 1, 0, 0.05490196, 1,
2.49017, 0.4803426, 2.014975, 1, 0, 0.04705882, 1,
2.504014, -1.034105, 2.402721, 1, 0, 0.04313726, 1,
2.535003, -1.447855, 2.121857, 1, 0, 0.03529412, 1,
2.541635, 0.1916569, 0.8866147, 1, 0, 0.03137255, 1,
2.558877, -0.04623395, 2.459743, 1, 0, 0.02352941, 1,
2.594036, 0.2044696, 1.224945, 1, 0, 0.01960784, 1,
2.668258, -1.159727, 2.383286, 1, 0, 0.01176471, 1,
2.795616, 0.03860798, 2.019915, 1, 0, 0.007843138, 1
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
-0.2752131, -4.149735, -7.86323, 0, -0.5, 0.5, 0.5,
-0.2752131, -4.149735, -7.86323, 1, -0.5, 0.5, 0.5,
-0.2752131, -4.149735, -7.86323, 1, 1.5, 0.5, 0.5,
-0.2752131, -4.149735, -7.86323, 0, 1.5, 0.5, 0.5
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
-4.387053, 0.06567931, -7.86323, 0, -0.5, 0.5, 0.5,
-4.387053, 0.06567931, -7.86323, 1, -0.5, 0.5, 0.5,
-4.387053, 0.06567931, -7.86323, 1, 1.5, 0.5, 0.5,
-4.387053, 0.06567931, -7.86323, 0, 1.5, 0.5, 0.5
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
-4.387053, -4.149735, -0.6009166, 0, -0.5, 0.5, 0.5,
-4.387053, -4.149735, -0.6009166, 1, -0.5, 0.5, 0.5,
-4.387053, -4.149735, -0.6009166, 1, 1.5, 0.5, 0.5,
-4.387053, -4.149735, -0.6009166, 0, 1.5, 0.5, 0.5
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
-3, -3.176947, -6.187312,
2, -3.176947, -6.187312,
-3, -3.176947, -6.187312,
-3, -3.339079, -6.466631,
-2, -3.176947, -6.187312,
-2, -3.339079, -6.466631,
-1, -3.176947, -6.187312,
-1, -3.339079, -6.466631,
0, -3.176947, -6.187312,
0, -3.339079, -6.466631,
1, -3.176947, -6.187312,
1, -3.339079, -6.466631,
2, -3.176947, -6.187312,
2, -3.339079, -6.466631
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
-3, -3.663341, -7.025271, 0, -0.5, 0.5, 0.5,
-3, -3.663341, -7.025271, 1, -0.5, 0.5, 0.5,
-3, -3.663341, -7.025271, 1, 1.5, 0.5, 0.5,
-3, -3.663341, -7.025271, 0, 1.5, 0.5, 0.5,
-2, -3.663341, -7.025271, 0, -0.5, 0.5, 0.5,
-2, -3.663341, -7.025271, 1, -0.5, 0.5, 0.5,
-2, -3.663341, -7.025271, 1, 1.5, 0.5, 0.5,
-2, -3.663341, -7.025271, 0, 1.5, 0.5, 0.5,
-1, -3.663341, -7.025271, 0, -0.5, 0.5, 0.5,
-1, -3.663341, -7.025271, 1, -0.5, 0.5, 0.5,
-1, -3.663341, -7.025271, 1, 1.5, 0.5, 0.5,
-1, -3.663341, -7.025271, 0, 1.5, 0.5, 0.5,
0, -3.663341, -7.025271, 0, -0.5, 0.5, 0.5,
0, -3.663341, -7.025271, 1, -0.5, 0.5, 0.5,
0, -3.663341, -7.025271, 1, 1.5, 0.5, 0.5,
0, -3.663341, -7.025271, 0, 1.5, 0.5, 0.5,
1, -3.663341, -7.025271, 0, -0.5, 0.5, 0.5,
1, -3.663341, -7.025271, 1, -0.5, 0.5, 0.5,
1, -3.663341, -7.025271, 1, 1.5, 0.5, 0.5,
1, -3.663341, -7.025271, 0, 1.5, 0.5, 0.5,
2, -3.663341, -7.025271, 0, -0.5, 0.5, 0.5,
2, -3.663341, -7.025271, 1, -0.5, 0.5, 0.5,
2, -3.663341, -7.025271, 1, 1.5, 0.5, 0.5,
2, -3.663341, -7.025271, 0, 1.5, 0.5, 0.5
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
-3.438167, -3, -6.187312,
-3.438167, 3, -6.187312,
-3.438167, -3, -6.187312,
-3.596314, -3, -6.466631,
-3.438167, -2, -6.187312,
-3.596314, -2, -6.466631,
-3.438167, -1, -6.187312,
-3.596314, -1, -6.466631,
-3.438167, 0, -6.187312,
-3.596314, 0, -6.466631,
-3.438167, 1, -6.187312,
-3.596314, 1, -6.466631,
-3.438167, 2, -6.187312,
-3.596314, 2, -6.466631,
-3.438167, 3, -6.187312,
-3.596314, 3, -6.466631
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
-3.91261, -3, -7.025271, 0, -0.5, 0.5, 0.5,
-3.91261, -3, -7.025271, 1, -0.5, 0.5, 0.5,
-3.91261, -3, -7.025271, 1, 1.5, 0.5, 0.5,
-3.91261, -3, -7.025271, 0, 1.5, 0.5, 0.5,
-3.91261, -2, -7.025271, 0, -0.5, 0.5, 0.5,
-3.91261, -2, -7.025271, 1, -0.5, 0.5, 0.5,
-3.91261, -2, -7.025271, 1, 1.5, 0.5, 0.5,
-3.91261, -2, -7.025271, 0, 1.5, 0.5, 0.5,
-3.91261, -1, -7.025271, 0, -0.5, 0.5, 0.5,
-3.91261, -1, -7.025271, 1, -0.5, 0.5, 0.5,
-3.91261, -1, -7.025271, 1, 1.5, 0.5, 0.5,
-3.91261, -1, -7.025271, 0, 1.5, 0.5, 0.5,
-3.91261, 0, -7.025271, 0, -0.5, 0.5, 0.5,
-3.91261, 0, -7.025271, 1, -0.5, 0.5, 0.5,
-3.91261, 0, -7.025271, 1, 1.5, 0.5, 0.5,
-3.91261, 0, -7.025271, 0, 1.5, 0.5, 0.5,
-3.91261, 1, -7.025271, 0, -0.5, 0.5, 0.5,
-3.91261, 1, -7.025271, 1, -0.5, 0.5, 0.5,
-3.91261, 1, -7.025271, 1, 1.5, 0.5, 0.5,
-3.91261, 1, -7.025271, 0, 1.5, 0.5, 0.5,
-3.91261, 2, -7.025271, 0, -0.5, 0.5, 0.5,
-3.91261, 2, -7.025271, 1, -0.5, 0.5, 0.5,
-3.91261, 2, -7.025271, 1, 1.5, 0.5, 0.5,
-3.91261, 2, -7.025271, 0, 1.5, 0.5, 0.5,
-3.91261, 3, -7.025271, 0, -0.5, 0.5, 0.5,
-3.91261, 3, -7.025271, 1, -0.5, 0.5, 0.5,
-3.91261, 3, -7.025271, 1, 1.5, 0.5, 0.5,
-3.91261, 3, -7.025271, 0, 1.5, 0.5, 0.5
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
-3.438167, -3.176947, -6,
-3.438167, -3.176947, 4,
-3.438167, -3.176947, -6,
-3.596314, -3.339079, -6,
-3.438167, -3.176947, -4,
-3.596314, -3.339079, -4,
-3.438167, -3.176947, -2,
-3.596314, -3.339079, -2,
-3.438167, -3.176947, 0,
-3.596314, -3.339079, 0,
-3.438167, -3.176947, 2,
-3.596314, -3.339079, 2,
-3.438167, -3.176947, 4,
-3.596314, -3.339079, 4
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
-3.91261, -3.663341, -6, 0, -0.5, 0.5, 0.5,
-3.91261, -3.663341, -6, 1, -0.5, 0.5, 0.5,
-3.91261, -3.663341, -6, 1, 1.5, 0.5, 0.5,
-3.91261, -3.663341, -6, 0, 1.5, 0.5, 0.5,
-3.91261, -3.663341, -4, 0, -0.5, 0.5, 0.5,
-3.91261, -3.663341, -4, 1, -0.5, 0.5, 0.5,
-3.91261, -3.663341, -4, 1, 1.5, 0.5, 0.5,
-3.91261, -3.663341, -4, 0, 1.5, 0.5, 0.5,
-3.91261, -3.663341, -2, 0, -0.5, 0.5, 0.5,
-3.91261, -3.663341, -2, 1, -0.5, 0.5, 0.5,
-3.91261, -3.663341, -2, 1, 1.5, 0.5, 0.5,
-3.91261, -3.663341, -2, 0, 1.5, 0.5, 0.5,
-3.91261, -3.663341, 0, 0, -0.5, 0.5, 0.5,
-3.91261, -3.663341, 0, 1, -0.5, 0.5, 0.5,
-3.91261, -3.663341, 0, 1, 1.5, 0.5, 0.5,
-3.91261, -3.663341, 0, 0, 1.5, 0.5, 0.5,
-3.91261, -3.663341, 2, 0, -0.5, 0.5, 0.5,
-3.91261, -3.663341, 2, 1, -0.5, 0.5, 0.5,
-3.91261, -3.663341, 2, 1, 1.5, 0.5, 0.5,
-3.91261, -3.663341, 2, 0, 1.5, 0.5, 0.5,
-3.91261, -3.663341, 4, 0, -0.5, 0.5, 0.5,
-3.91261, -3.663341, 4, 1, -0.5, 0.5, 0.5,
-3.91261, -3.663341, 4, 1, 1.5, 0.5, 0.5,
-3.91261, -3.663341, 4, 0, 1.5, 0.5, 0.5
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
-3.438167, -3.176947, -6.187312,
-3.438167, 3.308306, -6.187312,
-3.438167, -3.176947, 4.985478,
-3.438167, 3.308306, 4.985478,
-3.438167, -3.176947, -6.187312,
-3.438167, -3.176947, 4.985478,
-3.438167, 3.308306, -6.187312,
-3.438167, 3.308306, 4.985478,
-3.438167, -3.176947, -6.187312,
2.887741, -3.176947, -6.187312,
-3.438167, -3.176947, 4.985478,
2.887741, -3.176947, 4.985478,
-3.438167, 3.308306, -6.187312,
2.887741, 3.308306, -6.187312,
-3.438167, 3.308306, 4.985478,
2.887741, 3.308306, 4.985478,
2.887741, -3.176947, -6.187312,
2.887741, 3.308306, -6.187312,
2.887741, -3.176947, 4.985478,
2.887741, 3.308306, 4.985478,
2.887741, -3.176947, -6.187312,
2.887741, -3.176947, 4.985478,
2.887741, 3.308306, -6.187312,
2.887741, 3.308306, 4.985478
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
var radius = 7.680914;
var distance = 34.17326;
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
mvMatrix.translate( 0.2752131, -0.06567931, 0.6009166 );
mvMatrix.scale( 1.312816, 1.28056, 0.7433018 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.17326);
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
Telar<-read.table("Telar.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Telar$V2
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
```

```r
y<-Telar$V3
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
```

```r
z<-Telar$V4
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
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
-3.346042, 2.655922, -0.4442411, 0, 0, 1, 1, 1,
-3.18003, -0.4789115, -0.7139723, 1, 0, 0, 1, 1,
-2.981243, 0.4079049, -3.424434, 1, 0, 0, 1, 1,
-2.961208, -1.067729, -0.2503186, 1, 0, 0, 1, 1,
-2.870774, 0.08009798, -0.6135615, 1, 0, 0, 1, 1,
-2.7232, 0.4377455, -1.14057, 1, 0, 0, 1, 1,
-2.400512, 0.1875549, -1.380209, 0, 0, 0, 1, 1,
-2.316452, -0.8416928, -1.809883, 0, 0, 0, 1, 1,
-2.293662, 0.4697978, -0.1757537, 0, 0, 0, 1, 1,
-2.288244, 1.264068, -0.7915736, 0, 0, 0, 1, 1,
-2.235943, 1.114974, -1.0768, 0, 0, 0, 1, 1,
-2.217553, 0.401542, 0.02038959, 0, 0, 0, 1, 1,
-2.200285, -0.2178478, -2.705941, 0, 0, 0, 1, 1,
-2.193295, 0.675279, -0.9125797, 1, 1, 1, 1, 1,
-2.166492, 0.9973515, -1.10067, 1, 1, 1, 1, 1,
-2.165032, 0.6929529, -1.836791, 1, 1, 1, 1, 1,
-2.164801, 0.02559757, -3.078332, 1, 1, 1, 1, 1,
-2.15715, 0.7834632, -0.3877559, 1, 1, 1, 1, 1,
-2.142567, 0.3346221, 0.6179612, 1, 1, 1, 1, 1,
-2.105388, -1.277505, -2.39656, 1, 1, 1, 1, 1,
-2.088114, -1.033266, -0.6048424, 1, 1, 1, 1, 1,
-2.083772, 0.03428778, -1.704151, 1, 1, 1, 1, 1,
-2.077456, -0.9301049, -1.527325, 1, 1, 1, 1, 1,
-2.069982, 0.9075603, -0.9558277, 1, 1, 1, 1, 1,
-2.01014, 1.272682, 1.358681, 1, 1, 1, 1, 1,
-1.982313, -0.9287621, -1.889921, 1, 1, 1, 1, 1,
-1.938489, -0.2382012, -2.134561, 1, 1, 1, 1, 1,
-1.936511, -1.180229, -0.9376442, 1, 1, 1, 1, 1,
-1.923125, -0.7972842, -1.400418, 0, 0, 1, 1, 1,
-1.89436, 0.09669281, -2.888924, 1, 0, 0, 1, 1,
-1.886764, 0.8635843, -3.396918, 1, 0, 0, 1, 1,
-1.87759, -1.969077, -3.524117, 1, 0, 0, 1, 1,
-1.867584, 0.02197411, -4.638564, 1, 0, 0, 1, 1,
-1.836232, -0.2070531, -3.45376, 1, 0, 0, 1, 1,
-1.828378, 0.6186513, 0.7774123, 0, 0, 0, 1, 1,
-1.791863, 0.7882513, -0.3732527, 0, 0, 0, 1, 1,
-1.766618, 1.592466, -0.2229243, 0, 0, 0, 1, 1,
-1.756188, 0.05254949, -0.7181315, 0, 0, 0, 1, 1,
-1.751825, -0.9490044, -3.167837, 0, 0, 0, 1, 1,
-1.735453, -0.3064967, -1.756504, 0, 0, 0, 1, 1,
-1.721373, 0.6861671, -0.7099316, 0, 0, 0, 1, 1,
-1.699409, -1.97614, -2.630039, 1, 1, 1, 1, 1,
-1.68171, 0.5634237, -1.934441, 1, 1, 1, 1, 1,
-1.675971, 0.9067494, -1.04567, 1, 1, 1, 1, 1,
-1.664237, 1.24528, -0.4624727, 1, 1, 1, 1, 1,
-1.652967, -0.8860728, -2.233238, 1, 1, 1, 1, 1,
-1.644319, -0.1719337, -1.16895, 1, 1, 1, 1, 1,
-1.641666, -0.2940537, -0.6146978, 1, 1, 1, 1, 1,
-1.621503, -0.3322068, -1.300158, 1, 1, 1, 1, 1,
-1.616095, 0.9787002, -1.720121, 1, 1, 1, 1, 1,
-1.613979, 1.079423, -0.9741878, 1, 1, 1, 1, 1,
-1.612366, -1.018171, -3.53251, 1, 1, 1, 1, 1,
-1.607904, -0.3504421, -1.21805, 1, 1, 1, 1, 1,
-1.603549, 0.9177011, -0.4098619, 1, 1, 1, 1, 1,
-1.574351, -1.361995, -1.59614, 1, 1, 1, 1, 1,
-1.572219, 0.228975, -1.551993, 1, 1, 1, 1, 1,
-1.564539, -1.279916, -2.602283, 0, 0, 1, 1, 1,
-1.563398, 0.3615447, -0.384285, 1, 0, 0, 1, 1,
-1.554544, -0.3834997, -3.103771, 1, 0, 0, 1, 1,
-1.546808, -0.6148603, -2.156344, 1, 0, 0, 1, 1,
-1.546203, 0.641123, -0.7367441, 1, 0, 0, 1, 1,
-1.536658, -0.4777956, -2.066363, 1, 0, 0, 1, 1,
-1.501969, -0.3732445, -1.889799, 0, 0, 0, 1, 1,
-1.501269, 0.5419421, -2.109684, 0, 0, 0, 1, 1,
-1.499478, -0.4774454, -0.9237373, 0, 0, 0, 1, 1,
-1.485335, 0.4439335, 0.0235035, 0, 0, 0, 1, 1,
-1.484924, -0.6298684, -2.456853, 0, 0, 0, 1, 1,
-1.481364, 1.33091, -2.899746, 0, 0, 0, 1, 1,
-1.466335, 1.160796, -1.954981, 0, 0, 0, 1, 1,
-1.461839, -0.144582, -0.5640376, 1, 1, 1, 1, 1,
-1.460159, 0.6756982, -0.3780652, 1, 1, 1, 1, 1,
-1.459213, -1.837098, -0.6280944, 1, 1, 1, 1, 1,
-1.459173, -1.253142, -1.792954, 1, 1, 1, 1, 1,
-1.458685, -0.5064497, -2.257576, 1, 1, 1, 1, 1,
-1.438244, -1.098819, -2.376562, 1, 1, 1, 1, 1,
-1.42319, -1.663873, -3.23934, 1, 1, 1, 1, 1,
-1.421772, -1.851105, -2.578033, 1, 1, 1, 1, 1,
-1.417817, -0.04957372, -0.07358505, 1, 1, 1, 1, 1,
-1.410385, -1.613199, -2.230505, 1, 1, 1, 1, 1,
-1.399575, 0.5782328, -1.450261, 1, 1, 1, 1, 1,
-1.372426, 0.4428517, -2.605184, 1, 1, 1, 1, 1,
-1.371453, 0.1374642, -1.143231, 1, 1, 1, 1, 1,
-1.369715, -0.7608861, -3.796791, 1, 1, 1, 1, 1,
-1.351624, 1.589451, -1.095451, 1, 1, 1, 1, 1,
-1.333592, -0.1051218, -1.335682, 0, 0, 1, 1, 1,
-1.327192, 0.6117987, -0.5008077, 1, 0, 0, 1, 1,
-1.296732, -0.04054429, -2.053029, 1, 0, 0, 1, 1,
-1.288379, -0.102205, -2.287049, 1, 0, 0, 1, 1,
-1.280969, 0.6150796, 0.006620362, 1, 0, 0, 1, 1,
-1.276795, -0.9349743, -1.610056, 1, 0, 0, 1, 1,
-1.274877, 0.9947819, -0.88822, 0, 0, 0, 1, 1,
-1.26553, -0.5684045, -3.741463, 0, 0, 0, 1, 1,
-1.252367, 1.164386, -0.9344673, 0, 0, 0, 1, 1,
-1.25108, 1.009316, -0.751026, 0, 0, 0, 1, 1,
-1.244348, 0.2608182, -1.104554, 0, 0, 0, 1, 1,
-1.243982, 0.2019783, -1.383612, 0, 0, 0, 1, 1,
-1.241418, -0.6591749, -4.300695, 0, 0, 0, 1, 1,
-1.238592, 0.5031702, -0.6186403, 1, 1, 1, 1, 1,
-1.2357, -0.5431077, -1.811652, 1, 1, 1, 1, 1,
-1.22712, 0.779034, -1.045627, 1, 1, 1, 1, 1,
-1.224693, -0.3765142, -3.209583, 1, 1, 1, 1, 1,
-1.222349, 0.8004977, -2.364354, 1, 1, 1, 1, 1,
-1.221203, -1.107692, -2.255611, 1, 1, 1, 1, 1,
-1.218307, 1.472232, -2.208905, 1, 1, 1, 1, 1,
-1.216552, -1.318409, -2.302492, 1, 1, 1, 1, 1,
-1.210855, 0.180513, -1.695671, 1, 1, 1, 1, 1,
-1.205681, -1.740704, -2.946513, 1, 1, 1, 1, 1,
-1.202379, -1.018471, -0.5379961, 1, 1, 1, 1, 1,
-1.19565, 1.208967, 3.871529, 1, 1, 1, 1, 1,
-1.188167, 1.723948, 0.1207751, 1, 1, 1, 1, 1,
-1.18254, 0.002958958, -2.756952, 1, 1, 1, 1, 1,
-1.165298, 0.5871798, -1.539611, 1, 1, 1, 1, 1,
-1.163352, 0.3579974, -2.023513, 0, 0, 1, 1, 1,
-1.163196, -1.199832, -2.368668, 1, 0, 0, 1, 1,
-1.155629, -0.01483515, -3.194876, 1, 0, 0, 1, 1,
-1.150525, 0.6112158, -1.816643, 1, 0, 0, 1, 1,
-1.139033, -0.4247302, -3.902703, 1, 0, 0, 1, 1,
-1.137567, 0.003604586, -1.42086, 1, 0, 0, 1, 1,
-1.137278, -1.053755, -1.104233, 0, 0, 0, 1, 1,
-1.136539, 0.381909, -1.495095, 0, 0, 0, 1, 1,
-1.129103, 0.5731028, -0.4054573, 0, 0, 0, 1, 1,
-1.119559, 0.9330847, 0.2905382, 0, 0, 0, 1, 1,
-1.110004, 0.9626206, -0.3354313, 0, 0, 0, 1, 1,
-1.107992, -1.101539, -2.026365, 0, 0, 0, 1, 1,
-1.105411, -0.2085919, -2.590614, 0, 0, 0, 1, 1,
-1.104798, -0.9802163, -1.263011, 1, 1, 1, 1, 1,
-1.104253, 0.2337095, -0.5332975, 1, 1, 1, 1, 1,
-1.103383, 0.9822291, 0.4403075, 1, 1, 1, 1, 1,
-1.079284, -0.6799608, -2.126236, 1, 1, 1, 1, 1,
-1.077051, -0.2470453, -3.259017, 1, 1, 1, 1, 1,
-1.074792, -0.3801335, -3.005732, 1, 1, 1, 1, 1,
-1.07222, -0.5636553, -1.237018, 1, 1, 1, 1, 1,
-1.070459, -2.271679, -2.224389, 1, 1, 1, 1, 1,
-1.065548, 1.244342, -1.148866, 1, 1, 1, 1, 1,
-1.06004, -2.359936, -3.448779, 1, 1, 1, 1, 1,
-1.057286, 0.7056984, 0.2120318, 1, 1, 1, 1, 1,
-1.055614, -0.07436717, -2.541871, 1, 1, 1, 1, 1,
-1.054926, -0.8881497, -2.726938, 1, 1, 1, 1, 1,
-1.053519, 1.255829, -0.5887678, 1, 1, 1, 1, 1,
-1.048516, 0.1156051, -1.888845, 1, 1, 1, 1, 1,
-1.04625, -2.221641, -2.506695, 0, 0, 1, 1, 1,
-1.045938, -1.059904, -1.853114, 1, 0, 0, 1, 1,
-1.041674, -1.20412, -2.094899, 1, 0, 0, 1, 1,
-1.041311, -0.8169867, -2.443872, 1, 0, 0, 1, 1,
-1.040912, -0.4551606, -2.663363, 1, 0, 0, 1, 1,
-1.037918, 0.6686202, 1.084286, 1, 0, 0, 1, 1,
-1.034491, -0.4803524, -1.955836, 0, 0, 0, 1, 1,
-1.033885, -0.8446282, -2.611977, 0, 0, 0, 1, 1,
-1.033451, 0.8036998, -2.691864, 0, 0, 0, 1, 1,
-1.030145, -0.4074538, -1.487224, 0, 0, 0, 1, 1,
-1.027637, -0.7063591, -3.893114, 0, 0, 0, 1, 1,
-1.027084, 0.5173544, -2.48727, 0, 0, 0, 1, 1,
-1.022426, 0.8767453, -0.7863429, 0, 0, 0, 1, 1,
-1.020162, 0.1921344, -1.523061, 1, 1, 1, 1, 1,
-1.017621, 1.285214, -1.247181, 1, 1, 1, 1, 1,
-1.016824, -0.7007497, -1.775627, 1, 1, 1, 1, 1,
-1.015693, 1.01, -0.4483116, 1, 1, 1, 1, 1,
-1.015388, -0.8163338, -0.8092669, 1, 1, 1, 1, 1,
-1.015331, -0.2103024, -1.857435, 1, 1, 1, 1, 1,
-1.008436, 0.7510935, -0.04213157, 1, 1, 1, 1, 1,
-1.002331, 2.206778, 0.2183438, 1, 1, 1, 1, 1,
-0.9939699, 0.8502707, -0.07751875, 1, 1, 1, 1, 1,
-0.9934637, 0.9536977, -1.158263, 1, 1, 1, 1, 1,
-0.9906703, -0.134113, -2.621504, 1, 1, 1, 1, 1,
-0.9894142, -0.6833531, -1.182526, 1, 1, 1, 1, 1,
-0.9863234, -0.9899557, -2.320121, 1, 1, 1, 1, 1,
-0.9847282, 1.733673, -0.6151291, 1, 1, 1, 1, 1,
-0.9752668, -0.08332323, -1.866602, 1, 1, 1, 1, 1,
-0.9751884, -0.2482322, -1.396877, 0, 0, 1, 1, 1,
-0.9646887, -1.752926, -2.85178, 1, 0, 0, 1, 1,
-0.9638527, -1.860813, 0.2381207, 1, 0, 0, 1, 1,
-0.9635473, 3.213861, -1.030839, 1, 0, 0, 1, 1,
-0.9487576, 0.8389473, -1.606553, 1, 0, 0, 1, 1,
-0.9425577, -1.133538, -2.465795, 1, 0, 0, 1, 1,
-0.9294496, -1.242084, -2.718228, 0, 0, 0, 1, 1,
-0.9273459, 1.307217, -0.8648117, 0, 0, 0, 1, 1,
-0.9209786, -0.8984109, -2.756409, 0, 0, 0, 1, 1,
-0.9203865, 0.2066305, -0.6783469, 0, 0, 0, 1, 1,
-0.9184334, -2.769187, -3.245056, 0, 0, 0, 1, 1,
-0.9175874, -1.134331, -2.325838, 0, 0, 0, 1, 1,
-0.9151084, -1.239546, -2.943054, 0, 0, 0, 1, 1,
-0.899923, -1.849709, -3.056925, 1, 1, 1, 1, 1,
-0.8931382, -0.3820158, -1.164597, 1, 1, 1, 1, 1,
-0.8884122, 0.8513117, -2.23059, 1, 1, 1, 1, 1,
-0.8865635, 0.9799483, -0.4239575, 1, 1, 1, 1, 1,
-0.8811667, -0.2714839, -3.639256, 1, 1, 1, 1, 1,
-0.8787003, 1.094846, -0.3727598, 1, 1, 1, 1, 1,
-0.8758284, -0.8365665, -2.96769, 1, 1, 1, 1, 1,
-0.8734164, -1.140204, -0.0933432, 1, 1, 1, 1, 1,
-0.8729472, -0.4881328, -2.335902, 1, 1, 1, 1, 1,
-0.8705316, 0.3789531, -0.1204853, 1, 1, 1, 1, 1,
-0.8655218, -0.8653837, -1.610625, 1, 1, 1, 1, 1,
-0.8624436, -0.02795623, -0.6815444, 1, 1, 1, 1, 1,
-0.861244, -0.9280739, -2.985597, 1, 1, 1, 1, 1,
-0.8386794, 0.6706055, -1.796321, 1, 1, 1, 1, 1,
-0.8361771, -1.426972, -0.9080827, 1, 1, 1, 1, 1,
-0.8355255, 0.4073778, -0.5160632, 0, 0, 1, 1, 1,
-0.830543, -1.407149, -2.508089, 1, 0, 0, 1, 1,
-0.8296478, -0.2061738, -3.098119, 1, 0, 0, 1, 1,
-0.8295615, 1.898146, -0.4812652, 1, 0, 0, 1, 1,
-0.8182877, 0.491591, -0.6857162, 1, 0, 0, 1, 1,
-0.8180777, 0.3354034, -0.5721473, 1, 0, 0, 1, 1,
-0.8104902, 1.298129, -0.06289096, 0, 0, 0, 1, 1,
-0.8098241, -0.7805989, -2.459493, 0, 0, 0, 1, 1,
-0.8036397, -1.090711, -3.752728, 0, 0, 0, 1, 1,
-0.8010151, 0.3688446, -0.3992499, 0, 0, 0, 1, 1,
-0.7966416, 0.4570267, 0.1763517, 0, 0, 0, 1, 1,
-0.7932876, -0.1731834, -1.223727, 0, 0, 0, 1, 1,
-0.791807, 0.04564126, -0.9636007, 0, 0, 0, 1, 1,
-0.7894622, -1.256501, -2.745199, 1, 1, 1, 1, 1,
-0.7881935, 0.3698938, -0.7197188, 1, 1, 1, 1, 1,
-0.7870598, 0.1007491, -0.2765267, 1, 1, 1, 1, 1,
-0.7816384, 0.2495255, -2.36044, 1, 1, 1, 1, 1,
-0.7735463, 1.038491, -0.8017393, 1, 1, 1, 1, 1,
-0.7542461, 0.006004026, -0.4824589, 1, 1, 1, 1, 1,
-0.7520942, 1.03571, -0.08937345, 1, 1, 1, 1, 1,
-0.7520391, -0.1647068, 0.4824824, 1, 1, 1, 1, 1,
-0.7513961, -0.5834098, -3.856111, 1, 1, 1, 1, 1,
-0.7449799, -0.009090911, -1.934588, 1, 1, 1, 1, 1,
-0.7412329, 2.032376, -0.5185756, 1, 1, 1, 1, 1,
-0.7365381, -0.8012834, -1.552889, 1, 1, 1, 1, 1,
-0.735267, 0.2294381, -2.263405, 1, 1, 1, 1, 1,
-0.7336025, 1.425507, 0.8290412, 1, 1, 1, 1, 1,
-0.7288912, -1.500596, -2.952731, 1, 1, 1, 1, 1,
-0.7247342, 1.470349, 0.04535123, 0, 0, 1, 1, 1,
-0.7238458, -1.186267, -2.934331, 1, 0, 0, 1, 1,
-0.7207349, -0.1278394, -2.383268, 1, 0, 0, 1, 1,
-0.7187862, 0.1563422, -2.380424, 1, 0, 0, 1, 1,
-0.7186085, -1.373872, -2.814553, 1, 0, 0, 1, 1,
-0.7140256, -0.07716468, -0.9409607, 1, 0, 0, 1, 1,
-0.7125779, 0.07051741, -2.638856, 0, 0, 0, 1, 1,
-0.7067637, -0.1284719, -2.048589, 0, 0, 0, 1, 1,
-0.6923428, 0.04360087, -1.240467, 0, 0, 0, 1, 1,
-0.6874802, 1.462311, -1.56136, 0, 0, 0, 1, 1,
-0.6865332, -0.2754702, -1.031413, 0, 0, 0, 1, 1,
-0.6864872, -0.799799, -3.098034, 0, 0, 0, 1, 1,
-0.6850398, -1.609562, -2.289433, 0, 0, 0, 1, 1,
-0.6810083, 0.07500187, -1.931501, 1, 1, 1, 1, 1,
-0.6741365, -0.1266593, -1.53097, 1, 1, 1, 1, 1,
-0.6728464, -0.7460821, -2.90534, 1, 1, 1, 1, 1,
-0.6702285, 0.5468283, -1.122733, 1, 1, 1, 1, 1,
-0.6693494, -2.191288, -2.669286, 1, 1, 1, 1, 1,
-0.6658717, -1.977136, -2.209695, 1, 1, 1, 1, 1,
-0.6657438, 1.616872, -2.220132, 1, 1, 1, 1, 1,
-0.6626432, 0.7865769, -0.7095073, 1, 1, 1, 1, 1,
-0.6513463, 1.682947, 0.1169172, 1, 1, 1, 1, 1,
-0.6513458, 0.2347155, -2.271848, 1, 1, 1, 1, 1,
-0.648506, 0.2515683, -2.139352, 1, 1, 1, 1, 1,
-0.6461474, 1.869104, -1.110322, 1, 1, 1, 1, 1,
-0.6453334, 1.288525, -0.4631141, 1, 1, 1, 1, 1,
-0.6440776, -0.1765148, -2.623602, 1, 1, 1, 1, 1,
-0.6419086, 0.35094, -0.8986535, 1, 1, 1, 1, 1,
-0.6415662, 0.9511451, 0.3217433, 0, 0, 1, 1, 1,
-0.6404869, -0.8628539, -2.362543, 1, 0, 0, 1, 1,
-0.6388879, 0.333032, -2.972374, 1, 0, 0, 1, 1,
-0.6361749, 0.1813605, -0.3193134, 1, 0, 0, 1, 1,
-0.6351141, -1.014161, -1.729646, 1, 0, 0, 1, 1,
-0.6349534, -1.032977, -2.147483, 1, 0, 0, 1, 1,
-0.6345113, 0.06304609, -0.5454882, 0, 0, 0, 1, 1,
-0.6318473, -0.08431814, -1.238776, 0, 0, 0, 1, 1,
-0.6315182, 1.401821, 0.3509747, 0, 0, 0, 1, 1,
-0.6314741, -0.1881721, -3.364801, 0, 0, 0, 1, 1,
-0.630777, -0.03551653, -4.013924, 0, 0, 0, 1, 1,
-0.6266304, 0.8965642, -1.787855, 0, 0, 0, 1, 1,
-0.6264802, 0.8178537, -1.23331, 0, 0, 0, 1, 1,
-0.626295, -0.3047004, -3.084464, 1, 1, 1, 1, 1,
-0.6249982, -1.106006, -1.400308, 1, 1, 1, 1, 1,
-0.6236861, 0.4225945, -0.9775138, 1, 1, 1, 1, 1,
-0.622165, 0.8333343, -0.9313399, 1, 1, 1, 1, 1,
-0.6218105, 0.9931799, -0.167998, 1, 1, 1, 1, 1,
-0.6170227, 1.237752, -2.201222, 1, 1, 1, 1, 1,
-0.6167502, -0.1327803, -2.748276, 1, 1, 1, 1, 1,
-0.6162376, -0.8252701, -1.930552, 1, 1, 1, 1, 1,
-0.6119391, 0.6315637, -2.9832, 1, 1, 1, 1, 1,
-0.6105441, -1.992923, -3.841208, 1, 1, 1, 1, 1,
-0.6076123, 0.2635249, -1.886824, 1, 1, 1, 1, 1,
-0.606325, 1.095758, 0.4268323, 1, 1, 1, 1, 1,
-0.6014991, -1.985714, -4.225564, 1, 1, 1, 1, 1,
-0.5966885, 0.5292131, -0.6336492, 1, 1, 1, 1, 1,
-0.5962213, 2.253713, -0.3476483, 1, 1, 1, 1, 1,
-0.5956883, 1.048474, 0.8052589, 0, 0, 1, 1, 1,
-0.5922733, -1.742066, -1.66327, 1, 0, 0, 1, 1,
-0.5911183, -0.8822407, -2.251972, 1, 0, 0, 1, 1,
-0.5886024, 0.9563202, 0.1921489, 1, 0, 0, 1, 1,
-0.5850078, -1.008766, -3.953216, 1, 0, 0, 1, 1,
-0.58231, 0.2652175, -2.807621, 1, 0, 0, 1, 1,
-0.5816219, 0.6297865, -1.449067, 0, 0, 0, 1, 1,
-0.5716542, -2.450958, -3.235774, 0, 0, 0, 1, 1,
-0.5436636, -0.8440634, -2.570981, 0, 0, 0, 1, 1,
-0.5436242, -0.7463133, -2.071063, 0, 0, 0, 1, 1,
-0.5382866, 0.5729006, -0.5343164, 0, 0, 0, 1, 1,
-0.5379376, 1.3936, 0.4801712, 0, 0, 0, 1, 1,
-0.5366107, -0.7205437, -0.6003895, 0, 0, 0, 1, 1,
-0.5346645, 0.2094922, -1.069949, 1, 1, 1, 1, 1,
-0.5337306, -0.4896572, -0.8383859, 1, 1, 1, 1, 1,
-0.5219551, 0.5111845, -1.794237, 1, 1, 1, 1, 1,
-0.5219526, 0.479133, -2.082421, 1, 1, 1, 1, 1,
-0.5217846, -0.6342983, -2.493026, 1, 1, 1, 1, 1,
-0.5192193, -0.4668993, -2.368555, 1, 1, 1, 1, 1,
-0.5155717, 1.047493, -1.83013, 1, 1, 1, 1, 1,
-0.5122984, -0.112086, -0.4903373, 1, 1, 1, 1, 1,
-0.5033525, 0.4364595, -1.669876, 1, 1, 1, 1, 1,
-0.5021932, -1.029073, -3.486196, 1, 1, 1, 1, 1,
-0.502181, 0.2670538, -2.951445, 1, 1, 1, 1, 1,
-0.5015296, -0.2339801, 0.6261226, 1, 1, 1, 1, 1,
-0.5002251, -0.1904854, -2.534364, 1, 1, 1, 1, 1,
-0.4980285, -0.343906, 0.03670686, 1, 1, 1, 1, 1,
-0.4952253, 0.745101, 0.06038972, 1, 1, 1, 1, 1,
-0.4895491, 1.032668, 0.3357047, 0, 0, 1, 1, 1,
-0.489113, -0.145125, -3.607693, 1, 0, 0, 1, 1,
-0.4884298, 0.7883089, 0.52808, 1, 0, 0, 1, 1,
-0.4877828, 0.07160535, 0.284051, 1, 0, 0, 1, 1,
-0.4874513, -0.09795199, -0.9379957, 1, 0, 0, 1, 1,
-0.4844095, -0.9956314, -3.458676, 1, 0, 0, 1, 1,
-0.478024, 0.3569913, -1.20382, 0, 0, 0, 1, 1,
-0.4774352, 0.1061247, -2.969076, 0, 0, 0, 1, 1,
-0.4715454, 1.440987, 0.491484, 0, 0, 0, 1, 1,
-0.4706061, -0.6722087, -2.314216, 0, 0, 0, 1, 1,
-0.4704609, -0.7709889, -2.240898, 0, 0, 0, 1, 1,
-0.4669719, -0.6579219, -3.292459, 0, 0, 0, 1, 1,
-0.4631644, 0.3530526, 0.05890309, 0, 0, 0, 1, 1,
-0.4623484, 0.6107879, -0.8453843, 1, 1, 1, 1, 1,
-0.4607543, -1.135072, -2.131261, 1, 1, 1, 1, 1,
-0.4586464, -1.065117, -2.470083, 1, 1, 1, 1, 1,
-0.4570179, 2.020474, 0.3214749, 1, 1, 1, 1, 1,
-0.4519409, 0.2473465, -0.3913669, 1, 1, 1, 1, 1,
-0.4480419, -0.1828501, -2.755383, 1, 1, 1, 1, 1,
-0.4464407, -0.2493723, -2.289403, 1, 1, 1, 1, 1,
-0.4446223, 0.3081403, -1.870005, 1, 1, 1, 1, 1,
-0.4438906, 0.4068938, -0.7996177, 1, 1, 1, 1, 1,
-0.4428904, -2.44166, -3.549494, 1, 1, 1, 1, 1,
-0.4415638, -2.234098, -1.70167, 1, 1, 1, 1, 1,
-0.4408875, 0.2561345, -2.042267, 1, 1, 1, 1, 1,
-0.4406967, -0.06039397, -2.178738, 1, 1, 1, 1, 1,
-0.4380005, 2.231972, -0.398447, 1, 1, 1, 1, 1,
-0.4366834, -0.6435485, -3.822469, 1, 1, 1, 1, 1,
-0.4339416, 1.00979, -0.3642256, 0, 0, 1, 1, 1,
-0.4319007, 0.08105513, -2.070226, 1, 0, 0, 1, 1,
-0.4249431, -1.498433, -3.144747, 1, 0, 0, 1, 1,
-0.4244672, 0.8667663, -0.7790903, 1, 0, 0, 1, 1,
-0.4216096, 0.03839309, -0.1235213, 1, 0, 0, 1, 1,
-0.4203219, -0.02300579, -2.043048, 1, 0, 0, 1, 1,
-0.4156501, 0.8049381, 0.7535272, 0, 0, 0, 1, 1,
-0.4149738, 0.9098178, -0.2204438, 0, 0, 0, 1, 1,
-0.4085795, 0.6968836, -1.793218, 0, 0, 0, 1, 1,
-0.4067416, 0.9539185, -1.416527, 0, 0, 0, 1, 1,
-0.4065001, 0.07047462, 0.09908938, 0, 0, 0, 1, 1,
-0.4059249, -0.7312698, -2.544889, 0, 0, 0, 1, 1,
-0.4046111, -0.08590518, -3.71147, 0, 0, 0, 1, 1,
-0.4011876, -1.267462, -2.469618, 1, 1, 1, 1, 1,
-0.4009319, 1.307977, -0.7670893, 1, 1, 1, 1, 1,
-0.3983614, 0.3143912, -0.2869878, 1, 1, 1, 1, 1,
-0.3981209, -0.2583944, -2.65571, 1, 1, 1, 1, 1,
-0.3899606, 0.7315586, -0.007502516, 1, 1, 1, 1, 1,
-0.3880675, 1.774401, -0.5262075, 1, 1, 1, 1, 1,
-0.3864665, 1.094941, 1.260538, 1, 1, 1, 1, 1,
-0.3859683, -1.656278, -2.319625, 1, 1, 1, 1, 1,
-0.3834341, 0.8474196, -0.142512, 1, 1, 1, 1, 1,
-0.3809152, -1.040895, -2.30105, 1, 1, 1, 1, 1,
-0.3807779, -0.1301677, -3.462186, 1, 1, 1, 1, 1,
-0.372315, 0.5690044, -1.695624, 1, 1, 1, 1, 1,
-0.3709111, -0.2331818, -1.49355, 1, 1, 1, 1, 1,
-0.3676493, -1.924541, -3.498399, 1, 1, 1, 1, 1,
-0.3668794, 1.25377, 1.103176, 1, 1, 1, 1, 1,
-0.3656447, 0.8076103, -0.9047242, 0, 0, 1, 1, 1,
-0.3652878, 2.2151, -0.3250677, 1, 0, 0, 1, 1,
-0.3580762, 0.1284004, -1.805332, 1, 0, 0, 1, 1,
-0.3522884, 1.532051, 0.4463822, 1, 0, 0, 1, 1,
-0.3504547, 0.5443997, -0.7641491, 1, 0, 0, 1, 1,
-0.3495232, 0.2364096, -2.363579, 1, 0, 0, 1, 1,
-0.347222, 0.6083639, -0.2125141, 0, 0, 0, 1, 1,
-0.3417491, 1.305934, -0.8632951, 0, 0, 0, 1, 1,
-0.3365014, 0.6701471, -0.8066251, 0, 0, 0, 1, 1,
-0.3298108, 0.4553566, -0.5889795, 0, 0, 0, 1, 1,
-0.3278855, -0.4017529, -0.8748177, 0, 0, 0, 1, 1,
-0.3245176, -0.743085, -2.021947, 0, 0, 0, 1, 1,
-0.3193885, 0.8503848, 0.4608454, 0, 0, 0, 1, 1,
-0.3192786, -0.8836445, -2.469267, 1, 1, 1, 1, 1,
-0.3182711, 0.8090476, -1.629402, 1, 1, 1, 1, 1,
-0.3131389, 0.8844263, 0.1466233, 1, 1, 1, 1, 1,
-0.31264, -0.07179534, -2.394731, 1, 1, 1, 1, 1,
-0.3094431, -0.4965282, -3.433668, 1, 1, 1, 1, 1,
-0.3057547, 0.3495397, 0.3628178, 1, 1, 1, 1, 1,
-0.3051482, -1.36263, -1.951944, 1, 1, 1, 1, 1,
-0.3023961, -1.004475, -2.487377, 1, 1, 1, 1, 1,
-0.3011762, -0.0864184, -0.8345335, 1, 1, 1, 1, 1,
-0.2976867, 0.4329872, -1.335699, 1, 1, 1, 1, 1,
-0.2934047, 0.2798291, 0.6475658, 1, 1, 1, 1, 1,
-0.2924728, 1.544862, -1.140296, 1, 1, 1, 1, 1,
-0.2917344, -1.3709, -4.423266, 1, 1, 1, 1, 1,
-0.2874223, 1.724954, -2.066924, 1, 1, 1, 1, 1,
-0.2872599, -0.5239642, -2.949782, 1, 1, 1, 1, 1,
-0.2756243, 1.125228, -0.8527167, 0, 0, 1, 1, 1,
-0.2755621, -0.4645249, -1.700225, 1, 0, 0, 1, 1,
-0.2728354, 1.063379, 0.145682, 1, 0, 0, 1, 1,
-0.2722647, -0.8257802, -4.916845, 1, 0, 0, 1, 1,
-0.266497, 0.2638641, -2.640303, 1, 0, 0, 1, 1,
-0.2646503, -0.2849187, -4.303787, 1, 0, 0, 1, 1,
-0.2640688, -0.8866884, -1.100694, 0, 0, 0, 1, 1,
-0.263406, -1.969588, -1.052266, 0, 0, 0, 1, 1,
-0.2630565, 0.1126946, -1.347395, 0, 0, 0, 1, 1,
-0.2610599, 0.2240335, -1.353118, 0, 0, 0, 1, 1,
-0.2580076, -0.9397044, -5.583091, 0, 0, 0, 1, 1,
-0.2578036, -0.6558307, -4.061692, 0, 0, 0, 1, 1,
-0.2574666, -0.4010137, -2.192054, 0, 0, 0, 1, 1,
-0.2571109, 0.5351046, 0.6776217, 1, 1, 1, 1, 1,
-0.2566883, -0.6465681, -2.12929, 1, 1, 1, 1, 1,
-0.2566787, 0.09707907, -1.237869, 1, 1, 1, 1, 1,
-0.251112, 0.0187448, -2.428235, 1, 1, 1, 1, 1,
-0.2500824, -0.03573644, -1.874888, 1, 1, 1, 1, 1,
-0.2476817, -0.2593631, -2.430302, 1, 1, 1, 1, 1,
-0.2402934, 0.6269172, 1.16755, 1, 1, 1, 1, 1,
-0.2388368, -0.4166034, -2.174822, 1, 1, 1, 1, 1,
-0.2312875, 0.1161787, -0.6141026, 1, 1, 1, 1, 1,
-0.2241343, -0.4872476, -2.849869, 1, 1, 1, 1, 1,
-0.2198604, -1.139724, -1.954192, 1, 1, 1, 1, 1,
-0.2153558, -1.446627, -2.474146, 1, 1, 1, 1, 1,
-0.211228, -0.6519232, -2.946599, 1, 1, 1, 1, 1,
-0.2097017, -0.8760428, -2.257063, 1, 1, 1, 1, 1,
-0.2088939, -0.4244336, -0.6009037, 1, 1, 1, 1, 1,
-0.2023817, -1.261544, -3.11783, 0, 0, 1, 1, 1,
-0.1978203, 0.1232475, -0.6936189, 1, 0, 0, 1, 1,
-0.1937675, 0.3873945, -0.4672736, 1, 0, 0, 1, 1,
-0.1927922, 0.4676008, 0.008210562, 1, 0, 0, 1, 1,
-0.1918297, 0.494992, 0.3585281, 1, 0, 0, 1, 1,
-0.1897678, 2.201253, 1.625142, 1, 0, 0, 1, 1,
-0.1859141, -0.9564759, -4.444423, 0, 0, 0, 1, 1,
-0.1815008, -0.8448274, -2.015026, 0, 0, 0, 1, 1,
-0.1795749, 0.9105329, -0.2122109, 0, 0, 0, 1, 1,
-0.1792858, -0.05428917, -1.85812, 0, 0, 0, 1, 1,
-0.177502, 0.2480721, -2.348075, 0, 0, 0, 1, 1,
-0.1762642, 0.001611774, -4.234457, 0, 0, 0, 1, 1,
-0.1729659, 2.060787, -0.2476133, 0, 0, 0, 1, 1,
-0.1728542, 2.173077, 0.06146704, 1, 1, 1, 1, 1,
-0.1725461, 1.204431, -2.256239, 1, 1, 1, 1, 1,
-0.1704461, 0.6286622, -1.296604, 1, 1, 1, 1, 1,
-0.1703458, -1.507326, -2.36342, 1, 1, 1, 1, 1,
-0.1698966, 0.710647, -0.6647817, 1, 1, 1, 1, 1,
-0.1690123, 0.7788821, -0.5676257, 1, 1, 1, 1, 1,
-0.1685138, -0.6013852, -3.397369, 1, 1, 1, 1, 1,
-0.1673033, 0.4155422, -0.5397912, 1, 1, 1, 1, 1,
-0.1612231, -0.7000703, -2.384534, 1, 1, 1, 1, 1,
-0.1587911, -0.8804884, -3.43273, 1, 1, 1, 1, 1,
-0.1577816, 0.04548062, -1.034097, 1, 1, 1, 1, 1,
-0.1525793, 0.464675, -0.6714514, 1, 1, 1, 1, 1,
-0.1515926, -0.3750094, -0.5223386, 1, 1, 1, 1, 1,
-0.1500371, -1.118967, -3.068281, 1, 1, 1, 1, 1,
-0.1422125, -1.342623, -6.024601, 1, 1, 1, 1, 1,
-0.1405034, 1.195634, 0.2285981, 0, 0, 1, 1, 1,
-0.1365857, 0.1941978, -1.513578, 1, 0, 0, 1, 1,
-0.1331743, 1.681391, -0.7437185, 1, 0, 0, 1, 1,
-0.1290637, -1.009487, -2.766738, 1, 0, 0, 1, 1,
-0.1275236, 1.067796, 0.4265653, 1, 0, 0, 1, 1,
-0.1270005, 0.7950804, -0.5533059, 1, 0, 0, 1, 1,
-0.1246693, 0.1846938, -1.154354, 0, 0, 0, 1, 1,
-0.1219237, 0.2364244, -0.1701192, 0, 0, 0, 1, 1,
-0.121816, -0.5372691, -3.219509, 0, 0, 0, 1, 1,
-0.1182559, -0.8353387, -1.412108, 0, 0, 0, 1, 1,
-0.1131914, 1.903779, 0.5233144, 0, 0, 0, 1, 1,
-0.1102066, 0.7423835, -2.403425, 0, 0, 0, 1, 1,
-0.1079426, -1.116446, -3.627538, 0, 0, 0, 1, 1,
-0.1023212, 0.6053393, -0.4617543, 1, 1, 1, 1, 1,
-0.09661926, -1.238713, -2.744546, 1, 1, 1, 1, 1,
-0.09654316, 0.9600886, 0.4473795, 1, 1, 1, 1, 1,
-0.09345834, -0.7116991, -4.597916, 1, 1, 1, 1, 1,
-0.09197423, 0.8117498, 0.2043676, 1, 1, 1, 1, 1,
-0.08888336, -0.308895, -2.795878, 1, 1, 1, 1, 1,
-0.08883275, -0.9077925, -3.23421, 1, 1, 1, 1, 1,
-0.08684955, 1.152413, -1.148942, 1, 1, 1, 1, 1,
-0.08395341, 0.8920045, -0.6964421, 1, 1, 1, 1, 1,
-0.08224987, 0.6123251, -1.637571, 1, 1, 1, 1, 1,
-0.07898334, -0.6443571, -3.363829, 1, 1, 1, 1, 1,
-0.0759916, 1.13307, 0.01683013, 1, 1, 1, 1, 1,
-0.07091873, 0.1527717, -0.3704943, 1, 1, 1, 1, 1,
-0.06793948, 0.749226, -0.3865653, 1, 1, 1, 1, 1,
-0.06226122, -0.8529071, -3.780651, 1, 1, 1, 1, 1,
-0.06138979, -1.698316, -3.558737, 0, 0, 1, 1, 1,
-0.06083542, -0.07347237, -2.900738, 1, 0, 0, 1, 1,
-0.05554065, -1.88364, -3.542872, 1, 0, 0, 1, 1,
-0.05311498, 0.8172843, -1.089285, 1, 0, 0, 1, 1,
-0.05304323, -1.127188, -2.247842, 1, 0, 0, 1, 1,
-0.05137809, -0.3132776, -2.038213, 1, 0, 0, 1, 1,
-0.04883531, -0.6498393, -3.770934, 0, 0, 0, 1, 1,
-0.04723492, -0.4759856, -4.439888, 0, 0, 0, 1, 1,
-0.0451102, -0.1093062, -3.881833, 0, 0, 0, 1, 1,
-0.04116184, 1.485501, -0.1189036, 0, 0, 0, 1, 1,
-0.03714707, 0.3351182, -0.8246059, 0, 0, 0, 1, 1,
-0.036858, -0.04499069, -3.832063, 0, 0, 0, 1, 1,
-0.03667984, 0.2849673, 0.2440886, 0, 0, 0, 1, 1,
-0.03662363, 1.027935, -0.4437902, 1, 1, 1, 1, 1,
-0.0352477, -0.7408314, -2.170774, 1, 1, 1, 1, 1,
-0.03442277, -0.5067557, -1.409475, 1, 1, 1, 1, 1,
-0.02484808, 0.1431698, 1.069727, 1, 1, 1, 1, 1,
-0.02403022, 0.7320371, -0.4897234, 1, 1, 1, 1, 1,
-0.02188133, 1.693756, 1.567917, 1, 1, 1, 1, 1,
-0.02098724, -0.8079851, -2.80085, 1, 1, 1, 1, 1,
-0.0203406, -1.764101, -2.898503, 1, 1, 1, 1, 1,
-0.01610172, -1.13975, -3.141283, 1, 1, 1, 1, 1,
-0.00953725, -0.7116233, -1.900209, 1, 1, 1, 1, 1,
-0.008407545, 0.5647765, 0.313352, 1, 1, 1, 1, 1,
-0.005084118, -0.009912802, -2.769767, 1, 1, 1, 1, 1,
-1.428234e-05, 0.5563381, 0.1343267, 1, 1, 1, 1, 1,
0.001957834, 0.1032712, 2.219512, 1, 1, 1, 1, 1,
0.003385105, -0.8921108, 3.716099, 1, 1, 1, 1, 1,
0.007806432, 1.932493, 1.178708, 0, 0, 1, 1, 1,
0.009863351, -0.6615405, 3.451413, 1, 0, 0, 1, 1,
0.01132121, 0.6411119, 0.9196396, 1, 0, 0, 1, 1,
0.0126426, 1.432707, 0.02732264, 1, 0, 0, 1, 1,
0.01767152, -0.4067826, 3.42379, 1, 0, 0, 1, 1,
0.01869686, 0.6229127, 0.8784032, 1, 0, 0, 1, 1,
0.02006483, 0.1033951, -0.4893072, 0, 0, 0, 1, 1,
0.02181069, -0.2618812, 4.208943, 0, 0, 0, 1, 1,
0.02324307, 0.2415947, 1.115054, 0, 0, 0, 1, 1,
0.03568394, -0.1558475, 2.090906, 0, 0, 0, 1, 1,
0.04197406, 2.196938, -1.120502, 0, 0, 0, 1, 1,
0.04710078, -1.447999, 3.194278, 0, 0, 0, 1, 1,
0.05098422, -2.026716, 2.151636, 0, 0, 0, 1, 1,
0.05233682, -0.5276518, 2.188859, 1, 1, 1, 1, 1,
0.05349471, 0.2107103, 0.1324375, 1, 1, 1, 1, 1,
0.05676173, -0.18312, 3.196274, 1, 1, 1, 1, 1,
0.05789785, 0.5317699, -0.4580708, 1, 1, 1, 1, 1,
0.06085813, -0.1868669, 3.783357, 1, 1, 1, 1, 1,
0.06321441, 0.6086732, -0.007239454, 1, 1, 1, 1, 1,
0.06338401, 0.2679375, -0.8428222, 1, 1, 1, 1, 1,
0.0653463, 1.027732, -1.31681, 1, 1, 1, 1, 1,
0.06555188, 0.9392497, -1.787562, 1, 1, 1, 1, 1,
0.06812512, -0.6205113, 3.098261, 1, 1, 1, 1, 1,
0.07068434, -0.7448813, 2.883474, 1, 1, 1, 1, 1,
0.07176727, 0.5310507, 0.5562637, 1, 1, 1, 1, 1,
0.07295385, -0.09643238, 2.327506, 1, 1, 1, 1, 1,
0.07977743, 0.2625026, -0.09670211, 1, 1, 1, 1, 1,
0.08706486, 0.7110846, 0.05175551, 1, 1, 1, 1, 1,
0.08849168, 1.191166, -0.4682121, 0, 0, 1, 1, 1,
0.09041011, 1.57889, 0.5568725, 1, 0, 0, 1, 1,
0.09309054, 0.2550638, 0.1951157, 1, 0, 0, 1, 1,
0.09410289, 0.1487202, 0.8474303, 1, 0, 0, 1, 1,
0.09632023, 0.5886673, -0.8351749, 1, 0, 0, 1, 1,
0.09758466, 0.6092868, -0.003053779, 1, 0, 0, 1, 1,
0.09766404, -1.672599, 1.70951, 0, 0, 0, 1, 1,
0.1074327, -1.187762, 3.888662, 0, 0, 0, 1, 1,
0.1089075, 1.211217, -0.1756083, 0, 0, 0, 1, 1,
0.1103826, 0.1031764, 1.073563, 0, 0, 0, 1, 1,
0.1121096, -0.02983579, 1.912792, 0, 0, 0, 1, 1,
0.114675, -1.529563, 2.613224, 0, 0, 0, 1, 1,
0.116556, -0.6524157, 3.215082, 0, 0, 0, 1, 1,
0.1180754, -0.4196653, 2.692524, 1, 1, 1, 1, 1,
0.1183996, 0.696663, 0.9194418, 1, 1, 1, 1, 1,
0.1284073, 0.08744149, 0.8920686, 1, 1, 1, 1, 1,
0.1341847, -1.05201, 1.120715, 1, 1, 1, 1, 1,
0.1345359, -0.6971563, 3.116557, 1, 1, 1, 1, 1,
0.1351146, 0.6967483, -1.282771, 1, 1, 1, 1, 1,
0.1365665, -2.544568, 2.591578, 1, 1, 1, 1, 1,
0.1385687, 0.7751657, -0.3801652, 1, 1, 1, 1, 1,
0.1436268, 0.374319, -0.2669945, 1, 1, 1, 1, 1,
0.1439582, 0.191547, 0.6970282, 1, 1, 1, 1, 1,
0.1484772, 0.6115794, 0.7477591, 1, 1, 1, 1, 1,
0.1513565, 0.02241575, 2.000093, 1, 1, 1, 1, 1,
0.1527648, -1.378518, 2.971037, 1, 1, 1, 1, 1,
0.1531876, 0.05445496, 0.5857104, 1, 1, 1, 1, 1,
0.1609032, -0.196806, 3.361448, 1, 1, 1, 1, 1,
0.1609617, -0.5976247, 1.511255, 0, 0, 1, 1, 1,
0.1622911, -0.4140451, 3.416632, 1, 0, 0, 1, 1,
0.1631985, 1.142625, 0.8645588, 1, 0, 0, 1, 1,
0.1697317, -1.43128, 3.139639, 1, 0, 0, 1, 1,
0.1706198, -0.7999339, 2.494555, 1, 0, 0, 1, 1,
0.1749826, -1.227113, 3.982145, 1, 0, 0, 1, 1,
0.1780453, 1.702589, -0.1081534, 0, 0, 0, 1, 1,
0.1841094, -0.9666661, 3.33141, 0, 0, 0, 1, 1,
0.1843618, 0.3599284, 1.698603, 0, 0, 0, 1, 1,
0.1845465, 1.011578, -0.4940607, 0, 0, 0, 1, 1,
0.1900019, -0.1323383, 4.656917, 0, 0, 0, 1, 1,
0.1964921, 0.9126885, 1.222136, 0, 0, 0, 1, 1,
0.1998846, 1.137673, 0.02263716, 0, 0, 0, 1, 1,
0.2024653, 0.1196602, 1.475612, 1, 1, 1, 1, 1,
0.2030315, 0.3235876, 0.9073894, 1, 1, 1, 1, 1,
0.2095496, 0.4331369, -0.0703001, 1, 1, 1, 1, 1,
0.2108715, -0.603069, 1.218694, 1, 1, 1, 1, 1,
0.2109138, -1.15655, 2.394267, 1, 1, 1, 1, 1,
0.2124788, -1.154868, 2.114004, 1, 1, 1, 1, 1,
0.2130427, 0.1016038, 2.438973, 1, 1, 1, 1, 1,
0.2142139, 0.05486576, -0.282041, 1, 1, 1, 1, 1,
0.2147121, 0.02235792, -0.1984933, 1, 1, 1, 1, 1,
0.2178777, -1.280073, 3.401934, 1, 1, 1, 1, 1,
0.2191597, -1.461466, 3.311688, 1, 1, 1, 1, 1,
0.2200056, 0.665674, -0.0134164, 1, 1, 1, 1, 1,
0.2272666, 0.003190888, 1.042073, 1, 1, 1, 1, 1,
0.2362638, -0.5161613, 2.942765, 1, 1, 1, 1, 1,
0.2416863, 0.03326812, 2.945362, 1, 1, 1, 1, 1,
0.2455486, -0.1743428, 2.10709, 0, 0, 1, 1, 1,
0.2504409, -0.72346, 1.202436, 1, 0, 0, 1, 1,
0.2537656, 1.585254, 1.350414, 1, 0, 0, 1, 1,
0.2559704, -0.8878343, 2.527265, 1, 0, 0, 1, 1,
0.2619283, -1.494477, 2.557177, 1, 0, 0, 1, 1,
0.2639132, -1.285755, 3.628603, 1, 0, 0, 1, 1,
0.2648131, 0.6247486, 0.889869, 0, 0, 0, 1, 1,
0.2651822, 0.1154081, 0.5941298, 0, 0, 0, 1, 1,
0.2655353, 1.097596, 1.105809, 0, 0, 0, 1, 1,
0.2682534, -0.6455554, 3.409302, 0, 0, 0, 1, 1,
0.2711587, -0.006776535, 0.693442, 0, 0, 0, 1, 1,
0.2725312, 0.4888784, 0.6322906, 0, 0, 0, 1, 1,
0.2745675, -0.8875551, 4.443234, 0, 0, 0, 1, 1,
0.2800573, -0.04097417, 0.7842154, 1, 1, 1, 1, 1,
0.285152, 1.254164, 0.8550175, 1, 1, 1, 1, 1,
0.2855687, -1.158274, 4.011461, 1, 1, 1, 1, 1,
0.2857134, -1.735403, 3.706739, 1, 1, 1, 1, 1,
0.2885707, 0.407539, 1.705141, 1, 1, 1, 1, 1,
0.2958437, -1.056799, 0.9018679, 1, 1, 1, 1, 1,
0.2965965, 1.277421, 2.975666, 1, 1, 1, 1, 1,
0.3001506, -0.7127526, 3.87556, 1, 1, 1, 1, 1,
0.3012739, 0.692403, 0.3093188, 1, 1, 1, 1, 1,
0.3056506, -0.579164, 3.444185, 1, 1, 1, 1, 1,
0.3083048, -0.725321, 2.854074, 1, 1, 1, 1, 1,
0.3084811, -1.837064, 3.847439, 1, 1, 1, 1, 1,
0.3085632, 1.679461, -0.3069309, 1, 1, 1, 1, 1,
0.3105131, -0.02856082, 0.7003198, 1, 1, 1, 1, 1,
0.3111488, 1.004808, 1.827019, 1, 1, 1, 1, 1,
0.3247733, -1.165491, 1.92207, 0, 0, 1, 1, 1,
0.3252923, -0.8616939, 2.859362, 1, 0, 0, 1, 1,
0.3280157, 0.07510668, 1.976722, 1, 0, 0, 1, 1,
0.328327, -1.879185, 2.395447, 1, 0, 0, 1, 1,
0.3330265, -0.1285287, 2.122644, 1, 0, 0, 1, 1,
0.3333811, -0.5867684, 1.969811, 1, 0, 0, 1, 1,
0.3379147, 0.7115747, -0.1202356, 0, 0, 0, 1, 1,
0.3386419, -0.2658204, 2.037204, 0, 0, 0, 1, 1,
0.3395837, 0.08430104, 2.311571, 0, 0, 0, 1, 1,
0.3440889, -0.3609228, 3.293652, 0, 0, 0, 1, 1,
0.3452011, 0.9401231, -1.667916, 0, 0, 0, 1, 1,
0.3455302, 0.7187633, 0.1250887, 0, 0, 0, 1, 1,
0.3455797, -0.863764, 2.081774, 0, 0, 0, 1, 1,
0.3527471, -0.01474454, 2.836278, 1, 1, 1, 1, 1,
0.3535787, 0.7099274, 1.181684, 1, 1, 1, 1, 1,
0.3556636, -1.704258, 3.40734, 1, 1, 1, 1, 1,
0.3567241, 1.213477, 1.22096, 1, 1, 1, 1, 1,
0.356829, 0.2197534, 0.2503011, 1, 1, 1, 1, 1,
0.3576121, 1.098902, 1.654101, 1, 1, 1, 1, 1,
0.3583503, -1.043922, 3.989856, 1, 1, 1, 1, 1,
0.3583537, 0.5845782, -0.5339052, 1, 1, 1, 1, 1,
0.3598793, -1.209489, 2.100589, 1, 1, 1, 1, 1,
0.3609555, 1.202304, -0.2987043, 1, 1, 1, 1, 1,
0.3613636, 1.28754, 0.2739384, 1, 1, 1, 1, 1,
0.3617277, -1.149579, 1.467244, 1, 1, 1, 1, 1,
0.3664733, -0.3222142, 1.128511, 1, 1, 1, 1, 1,
0.3679641, -1.90206, 3.046962, 1, 1, 1, 1, 1,
0.3729129, -1.780331, 2.867928, 1, 1, 1, 1, 1,
0.3754166, -0.7678927, 2.185267, 0, 0, 1, 1, 1,
0.3805957, 0.09232053, 1.998717, 1, 0, 0, 1, 1,
0.3807008, -0.09268719, 2.380633, 1, 0, 0, 1, 1,
0.380744, -0.4919761, 1.943467, 1, 0, 0, 1, 1,
0.3869871, 1.032137, 0.5425166, 1, 0, 0, 1, 1,
0.3870357, -0.7859756, 3.211645, 1, 0, 0, 1, 1,
0.3907498, 0.5764887, 1.477086, 0, 0, 0, 1, 1,
0.3945185, -0.1944717, 2.814238, 0, 0, 0, 1, 1,
0.3995961, 1.278912, -1.351495, 0, 0, 0, 1, 1,
0.3996054, -0.2837564, 4.278641, 0, 0, 0, 1, 1,
0.401176, 0.4924733, 1.286397, 0, 0, 0, 1, 1,
0.4078859, -1.2167, 1.682669, 0, 0, 0, 1, 1,
0.4081336, -0.7239546, 2.15514, 0, 0, 0, 1, 1,
0.4132319, -0.5243502, 2.642012, 1, 1, 1, 1, 1,
0.4159636, -0.1176192, 2.049165, 1, 1, 1, 1, 1,
0.4189701, 0.9253438, 1.315058, 1, 1, 1, 1, 1,
0.4219927, -0.4515588, 2.029372, 1, 1, 1, 1, 1,
0.4331065, 1.168494, 0.3977289, 1, 1, 1, 1, 1,
0.4356926, 0.8917629, -1.439126, 1, 1, 1, 1, 1,
0.4371549, 0.4106336, 2.023455, 1, 1, 1, 1, 1,
0.4407931, 1.238087, -1.353196, 1, 1, 1, 1, 1,
0.441006, -1.08409, 3.676967, 1, 1, 1, 1, 1,
0.4428536, 0.5329567, 1.33908, 1, 1, 1, 1, 1,
0.4449658, 0.2919076, 1.946202, 1, 1, 1, 1, 1,
0.4472268, -0.9191184, 3.370603, 1, 1, 1, 1, 1,
0.4494007, 0.4221258, 0.868182, 1, 1, 1, 1, 1,
0.4502563, -0.7033166, 1.915073, 1, 1, 1, 1, 1,
0.4564871, 0.5216259, 0.2736938, 1, 1, 1, 1, 1,
0.4587059, 0.6328414, -0.09372806, 0, 0, 1, 1, 1,
0.4728991, 0.9767729, 2.89675, 1, 0, 0, 1, 1,
0.4746816, -1.628769, 3.01196, 1, 0, 0, 1, 1,
0.4754498, -1.097795, 1.507359, 1, 0, 0, 1, 1,
0.4775788, 0.2403187, 0.2103717, 1, 0, 0, 1, 1,
0.4817645, 0.9304169, 0.8003193, 1, 0, 0, 1, 1,
0.485244, 0.5654999, 0.6755736, 0, 0, 0, 1, 1,
0.4871477, -1.448295, 3.524626, 0, 0, 0, 1, 1,
0.4942125, -0.5310035, 3.2765, 0, 0, 0, 1, 1,
0.496236, -0.9362503, 3.254515, 0, 0, 0, 1, 1,
0.502324, 2.787034, 1.704024, 0, 0, 0, 1, 1,
0.5033359, 1.3294, -0.868477, 0, 0, 0, 1, 1,
0.5061332, 0.2046384, 0.002909867, 0, 0, 0, 1, 1,
0.5066393, 1.426698, 1.061574, 1, 1, 1, 1, 1,
0.5243922, 2.02463, 0.7566525, 1, 1, 1, 1, 1,
0.5276719, -0.3072521, 2.040962, 1, 1, 1, 1, 1,
0.5304044, -1.141656, 3.610915, 1, 1, 1, 1, 1,
0.5367103, 0.4972973, 0.7367264, 1, 1, 1, 1, 1,
0.5390929, 1.167498, 0.6921912, 1, 1, 1, 1, 1,
0.5460101, 0.182663, 1.5495, 1, 1, 1, 1, 1,
0.5461967, 0.7751095, 1.362482, 1, 1, 1, 1, 1,
0.5464917, 1.842133, 1.040025, 1, 1, 1, 1, 1,
0.5481774, 0.5210094, 0.581749, 1, 1, 1, 1, 1,
0.5498729, 0.6548034, 2.135684, 1, 1, 1, 1, 1,
0.5498751, 1.932351, 1.438957, 1, 1, 1, 1, 1,
0.5512984, -0.3379574, 1.933431, 1, 1, 1, 1, 1,
0.5532696, 0.9700266, 1.654061, 1, 1, 1, 1, 1,
0.5549973, 1.966442, 0.1599871, 1, 1, 1, 1, 1,
0.5575754, -0.6858384, 3.90909, 0, 0, 1, 1, 1,
0.5577708, 0.3159113, 1.864045, 1, 0, 0, 1, 1,
0.5618247, 0.0008300633, 0.7636099, 1, 0, 0, 1, 1,
0.5684727, -0.1304644, 1.330626, 1, 0, 0, 1, 1,
0.56849, -0.7023807, 1.806839, 1, 0, 0, 1, 1,
0.5700747, -1.577983, 3.08952, 1, 0, 0, 1, 1,
0.5720723, -0.1482825, 1.871598, 0, 0, 0, 1, 1,
0.5764672, -1.30933, 2.43597, 0, 0, 0, 1, 1,
0.5768616, -0.1692939, 1.944421, 0, 0, 0, 1, 1,
0.5789469, -1.434842, 1.674843, 0, 0, 0, 1, 1,
0.5816869, -0.9109442, 0.1127898, 0, 0, 0, 1, 1,
0.5817458, -1.936395, 1.787006, 0, 0, 0, 1, 1,
0.5878864, -0.1371191, 2.062366, 0, 0, 0, 1, 1,
0.5906842, -0.100578, 3.234795, 1, 1, 1, 1, 1,
0.593214, 1.054236, 1.014897, 1, 1, 1, 1, 1,
0.5933683, 1.18854, 3.05647, 1, 1, 1, 1, 1,
0.5968498, -0.5169637, 1.906171, 1, 1, 1, 1, 1,
0.5988663, -2.490933, 3.042537, 1, 1, 1, 1, 1,
0.6016844, 0.3149203, 0.4647891, 1, 1, 1, 1, 1,
0.6023595, 0.05180194, 2.663037, 1, 1, 1, 1, 1,
0.603753, 0.1946229, 2.110442, 1, 1, 1, 1, 1,
0.6060029, 1.201315, 1.544005, 1, 1, 1, 1, 1,
0.6103792, 1.798675, 0.2039868, 1, 1, 1, 1, 1,
0.618062, -0.3565217, 3.477241, 1, 1, 1, 1, 1,
0.6188635, -0.4449049, 2.872332, 1, 1, 1, 1, 1,
0.6195018, -1.961348, 4.822768, 1, 1, 1, 1, 1,
0.6199874, -0.5161291, 1.124337, 1, 1, 1, 1, 1,
0.6208139, 1.629129, 1.020672, 1, 1, 1, 1, 1,
0.6213711, -0.3646537, 2.750847, 0, 0, 1, 1, 1,
0.6220977, 0.8677071, 1.994408, 1, 0, 0, 1, 1,
0.6233047, 0.7426654, 0.7273238, 1, 0, 0, 1, 1,
0.6257309, 0.3631361, 1.494627, 1, 0, 0, 1, 1,
0.6262975, 1.012882, 1.458427, 1, 0, 0, 1, 1,
0.6292266, -0.03136535, 1.772459, 1, 0, 0, 1, 1,
0.6351411, 0.7654997, -0.4194651, 0, 0, 0, 1, 1,
0.6360568, 1.278793, 0.8514435, 0, 0, 0, 1, 1,
0.6367906, 0.882887, 2.450972, 0, 0, 0, 1, 1,
0.6392394, -1.061835, 1.176184, 0, 0, 0, 1, 1,
0.6394804, -0.8589612, 3.53065, 0, 0, 0, 1, 1,
0.6404336, -0.0708857, 1.76986, 0, 0, 0, 1, 1,
0.6420259, 1.021791, -0.07000777, 0, 0, 0, 1, 1,
0.6438943, -1.292391, 2.711534, 1, 1, 1, 1, 1,
0.6491092, -0.7692728, 3.734725, 1, 1, 1, 1, 1,
0.6569964, -2.311366, 0.649543, 1, 1, 1, 1, 1,
0.6578516, 1.145756, 0.4875581, 1, 1, 1, 1, 1,
0.6583048, 0.2498944, 0.5481864, 1, 1, 1, 1, 1,
0.6602728, 1.473449, -1.479527, 1, 1, 1, 1, 1,
0.6614276, -1.444956, 3.176906, 1, 1, 1, 1, 1,
0.664786, -0.3602019, 2.121243, 1, 1, 1, 1, 1,
0.669517, -0.8432378, 2.577495, 1, 1, 1, 1, 1,
0.6751027, 0.1782977, 1.455587, 1, 1, 1, 1, 1,
0.6780238, -0.4713314, 4.300851, 1, 1, 1, 1, 1,
0.6793054, 0.21672, 1.377058, 1, 1, 1, 1, 1,
0.6813338, 1.955347, 0.2762415, 1, 1, 1, 1, 1,
0.6822852, -0.9812777, 3.472967, 1, 1, 1, 1, 1,
0.6834303, 0.6106434, 0.8903718, 1, 1, 1, 1, 1,
0.6862849, 1.74769, 1.180682, 0, 0, 1, 1, 1,
0.6973785, 1.591438, 0.2334667, 1, 0, 0, 1, 1,
0.7016906, -0.1416481, 1.75699, 1, 0, 0, 1, 1,
0.7036345, -1.4799, 4.271206, 1, 0, 0, 1, 1,
0.7081103, 2.079821, 0.1365232, 1, 0, 0, 1, 1,
0.7133685, -0.124829, 2.462788, 1, 0, 0, 1, 1,
0.7167185, 1.923203, 1.068028, 0, 0, 0, 1, 1,
0.7174187, -2.858437, 3.29748, 0, 0, 0, 1, 1,
0.7216023, 0.7681139, 1.535561, 0, 0, 0, 1, 1,
0.7240114, 0.042135, 1.240327, 0, 0, 0, 1, 1,
0.7252142, -1.201278, 3.076489, 0, 0, 0, 1, 1,
0.7318457, -0.3664161, 1.584787, 0, 0, 0, 1, 1,
0.7387249, 0.5577637, 1.759917, 0, 0, 0, 1, 1,
0.7423744, -0.9761566, 2.816733, 1, 1, 1, 1, 1,
0.7440516, 0.6115276, -0.3314211, 1, 1, 1, 1, 1,
0.7457021, -0.6182486, 1.824238, 1, 1, 1, 1, 1,
0.7467157, 0.882481, 0.9205773, 1, 1, 1, 1, 1,
0.7500453, -0.2872282, 1.258033, 1, 1, 1, 1, 1,
0.7593436, -0.9645091, 2.318155, 1, 1, 1, 1, 1,
0.7679365, 0.09592245, 1.541334, 1, 1, 1, 1, 1,
0.7724257, 0.8504551, -0.1050759, 1, 1, 1, 1, 1,
0.7744761, 0.4591119, -0.8046659, 1, 1, 1, 1, 1,
0.7853359, -0.8842937, 2.664711, 1, 1, 1, 1, 1,
0.7889879, 1.002227, 1.741599, 1, 1, 1, 1, 1,
0.7892019, 0.6092556, 0.4336453, 1, 1, 1, 1, 1,
0.7897235, 0.4716265, 0.6052351, 1, 1, 1, 1, 1,
0.7975768, -1.586005, 2.741939, 1, 1, 1, 1, 1,
0.7995743, 1.577886, 0.01145621, 1, 1, 1, 1, 1,
0.7999304, 0.6682824, -0.02034606, 0, 0, 1, 1, 1,
0.8032385, 0.8159935, 1.161501, 1, 0, 0, 1, 1,
0.8045844, 0.3043858, 1.78607, 1, 0, 0, 1, 1,
0.8055153, 0.5488463, 0.3622884, 1, 0, 0, 1, 1,
0.8057368, 0.4511383, 2.072576, 1, 0, 0, 1, 1,
0.8111316, -2.2269, 3.372779, 1, 0, 0, 1, 1,
0.8136495, -1.575035, 2.896492, 0, 0, 0, 1, 1,
0.8151116, 0.1871824, 0.0871897, 0, 0, 0, 1, 1,
0.8172659, 1.439345, -0.6751527, 0, 0, 0, 1, 1,
0.8215113, 1.25449, 0.716461, 0, 0, 0, 1, 1,
0.825215, 0.7787618, 0.9205255, 0, 0, 0, 1, 1,
0.8257265, 0.778137, 0.2296076, 0, 0, 0, 1, 1,
0.8264645, -0.01094637, 1.096261, 0, 0, 0, 1, 1,
0.8266959, 1.933846, 0.1339201, 1, 1, 1, 1, 1,
0.8275322, 0.1016293, -1.06225, 1, 1, 1, 1, 1,
0.8275385, -0.9408936, 2.310899, 1, 1, 1, 1, 1,
0.829739, -0.3525923, 3.174834, 1, 1, 1, 1, 1,
0.8298213, -0.3224464, 1.347435, 1, 1, 1, 1, 1,
0.8328391, -0.3855113, 1.938833, 1, 1, 1, 1, 1,
0.8381515, 1.694322, 0.3117518, 1, 1, 1, 1, 1,
0.8395808, -0.03003504, 3.47244, 1, 1, 1, 1, 1,
0.8443862, 0.1878146, 0.7754752, 1, 1, 1, 1, 1,
0.8445925, 0.3764321, 1.454717, 1, 1, 1, 1, 1,
0.845589, -0.3341145, 0.727547, 1, 1, 1, 1, 1,
0.8460248, 1.931147, 0.4916039, 1, 1, 1, 1, 1,
0.8539949, -0.3160792, 0.6349388, 1, 1, 1, 1, 1,
0.857343, -1.091533, 3.153869, 1, 1, 1, 1, 1,
0.8695139, 0.1484636, 1.488386, 1, 1, 1, 1, 1,
0.8732917, 0.2083356, -0.6765175, 0, 0, 1, 1, 1,
0.8814583, 1.121511, 0.01117955, 1, 0, 0, 1, 1,
0.8858602, 0.1486722, 2.734931, 1, 0, 0, 1, 1,
0.8875377, -0.8632012, 4.078694, 1, 0, 0, 1, 1,
0.8924139, 0.33911, 1.285238, 1, 0, 0, 1, 1,
0.8958064, 1.047662, 0.04774218, 1, 0, 0, 1, 1,
0.9035422, 0.339952, 1.052256, 0, 0, 0, 1, 1,
0.9105071, 0.120247, 3.217417, 0, 0, 0, 1, 1,
0.9106361, -0.1564659, 3.728611, 0, 0, 0, 1, 1,
0.915272, -0.39324, 0.3150537, 0, 0, 0, 1, 1,
0.9177146, 0.265938, 1.070382, 0, 0, 0, 1, 1,
0.9233389, -0.0544246, 1.954409, 0, 0, 0, 1, 1,
0.9259233, 0.3431648, 2.057057, 0, 0, 0, 1, 1,
0.9266576, 0.6888433, 0.7183307, 1, 1, 1, 1, 1,
0.927726, -0.5826577, 1.704945, 1, 1, 1, 1, 1,
0.930541, 0.7191911, -0.4971823, 1, 1, 1, 1, 1,
0.931608, -0.2984478, 3.972029, 1, 1, 1, 1, 1,
0.9354516, -0.6715475, 3.511929, 1, 1, 1, 1, 1,
0.9410889, -0.7133001, 3.06866, 1, 1, 1, 1, 1,
0.9449608, 0.9728649, -0.3179141, 1, 1, 1, 1, 1,
0.9470451, -1.708548, 3.416792, 1, 1, 1, 1, 1,
0.9673529, -0.6932378, 2.596201, 1, 1, 1, 1, 1,
0.9744265, -0.7624949, 2.870251, 1, 1, 1, 1, 1,
0.9782967, 0.6070201, 1.094969, 1, 1, 1, 1, 1,
0.9785054, -0.2355135, 0.3082846, 1, 1, 1, 1, 1,
0.9845635, -0.073199, 3.790391, 1, 1, 1, 1, 1,
0.9909682, 1.176238, -0.02659699, 1, 1, 1, 1, 1,
0.9967217, 1.685821, -0.1809374, 1, 1, 1, 1, 1,
0.9997732, 0.5756957, 1.782511, 0, 0, 1, 1, 1,
1.017625, 0.3468597, 2.466407, 1, 0, 0, 1, 1,
1.020408, -0.8221881, 2.193433, 1, 0, 0, 1, 1,
1.021057, 1.945848, 0.4273063, 1, 0, 0, 1, 1,
1.029537, 0.8506692, -0.4205935, 1, 0, 0, 1, 1,
1.030573, 0.1109101, 0.7526703, 1, 0, 0, 1, 1,
1.037943, 0.2688129, 0.8711991, 0, 0, 0, 1, 1,
1.038262, -1.086747, 2.004755, 0, 0, 0, 1, 1,
1.039696, 1.069739, 2.797372, 0, 0, 0, 1, 1,
1.040452, 0.2686238, 1.974049, 0, 0, 0, 1, 1,
1.041059, 0.6762248, 1.632455, 0, 0, 0, 1, 1,
1.041839, -0.6138544, -0.01894508, 0, 0, 0, 1, 1,
1.044463, -0.5438015, 1.18943, 0, 0, 0, 1, 1,
1.056607, 0.8003473, 1.815522, 1, 1, 1, 1, 1,
1.067628, 0.7710217, 2.448596, 1, 1, 1, 1, 1,
1.06883, 0.3095442, 3.450957, 1, 1, 1, 1, 1,
1.070643, 1.385124, -0.5097783, 1, 1, 1, 1, 1,
1.071346, 0.1468226, 1.077517, 1, 1, 1, 1, 1,
1.075352, 0.3227543, -0.4533575, 1, 1, 1, 1, 1,
1.076898, 0.6354752, -1.424571, 1, 1, 1, 1, 1,
1.077825, 0.07742926, 2.060039, 1, 1, 1, 1, 1,
1.079838, -0.3546596, -0.9507365, 1, 1, 1, 1, 1,
1.085117, 0.4663617, 0.276441, 1, 1, 1, 1, 1,
1.085506, -1.133916, 1.55569, 1, 1, 1, 1, 1,
1.086009, 0.8684192, -0.1496722, 1, 1, 1, 1, 1,
1.092257, 1.167658, 3.020256, 1, 1, 1, 1, 1,
1.100736, -0.1583047, 1.614823, 1, 1, 1, 1, 1,
1.101255, -0.7688035, 2.021621, 1, 1, 1, 1, 1,
1.10174, -1.168164, 3.07402, 0, 0, 1, 1, 1,
1.104947, 1.379699, 0.3999228, 1, 0, 0, 1, 1,
1.106675, 0.4390688, -0.717245, 1, 0, 0, 1, 1,
1.1099, 1.993361, 0.07469265, 1, 0, 0, 1, 1,
1.116267, -1.746278, 3.09449, 1, 0, 0, 1, 1,
1.122942, 1.097878, 2.245799, 1, 0, 0, 1, 1,
1.139192, -0.189516, 1.374098, 0, 0, 0, 1, 1,
1.140528, 0.3321356, 0.4708011, 0, 0, 0, 1, 1,
1.141359, -1.313837, 3.001014, 0, 0, 0, 1, 1,
1.142927, 1.078076, 2.245389, 0, 0, 0, 1, 1,
1.152223, -1.157267, 0.7082331, 0, 0, 0, 1, 1,
1.153336, -0.3509161, 1.54026, 0, 0, 0, 1, 1,
1.157405, 0.1355783, 2.969172, 0, 0, 0, 1, 1,
1.15888, 0.9311051, -0.3802358, 1, 1, 1, 1, 1,
1.169723, 1.036475, -0.118433, 1, 1, 1, 1, 1,
1.176879, -0.5765427, 1.163025, 1, 1, 1, 1, 1,
1.180891, 0.4842253, 2.933473, 1, 1, 1, 1, 1,
1.193713, 0.8485965, -0.1518804, 1, 1, 1, 1, 1,
1.20327, 0.482316, -0.6804621, 1, 1, 1, 1, 1,
1.205799, -0.5566888, 4.284882, 1, 1, 1, 1, 1,
1.210027, 1.490343, -0.5537713, 1, 1, 1, 1, 1,
1.212089, 0.07264821, 2.640091, 1, 1, 1, 1, 1,
1.222539, 0.279937, 0.3627001, 1, 1, 1, 1, 1,
1.229042, 0.2127132, 0.8527227, 1, 1, 1, 1, 1,
1.233107, 0.8934356, 1.222208, 1, 1, 1, 1, 1,
1.234248, -0.5364847, 2.488794, 1, 1, 1, 1, 1,
1.246452, 0.502662, -0.2630942, 1, 1, 1, 1, 1,
1.249324, -1.113685, 3.271754, 1, 1, 1, 1, 1,
1.251567, 1.198331, 1.815907, 0, 0, 1, 1, 1,
1.265926, -0.6599502, 1.018321, 1, 0, 0, 1, 1,
1.269895, -0.7679226, 2.576834, 1, 0, 0, 1, 1,
1.279829, 0.3502412, 1.314502, 1, 0, 0, 1, 1,
1.292346, 0.6967846, 2.392874, 1, 0, 0, 1, 1,
1.295516, -2.143458, 3.334955, 1, 0, 0, 1, 1,
1.300113, -2.019471, 2.719828, 0, 0, 0, 1, 1,
1.30841, 1.067571, 2.704267, 0, 0, 0, 1, 1,
1.310108, -0.005195722, 0.4650367, 0, 0, 0, 1, 1,
1.310672, -1.086277, 4.578918, 0, 0, 0, 1, 1,
1.320446, 1.933847, 1.159901, 0, 0, 0, 1, 1,
1.324739, -0.363678, -0.3609937, 0, 0, 0, 1, 1,
1.326341, -0.7299512, 3.254226, 0, 0, 0, 1, 1,
1.339012, -0.7497676, 3.100016, 1, 1, 1, 1, 1,
1.339727, 1.06425, 2.990981, 1, 1, 1, 1, 1,
1.35586, -0.4360555, -0.2666621, 1, 1, 1, 1, 1,
1.359048, 0.6803778, 0.3699766, 1, 1, 1, 1, 1,
1.361983, -3.082502, 3.432896, 1, 1, 1, 1, 1,
1.363594, 1.004469, 1.049023, 1, 1, 1, 1, 1,
1.366486, 1.529736, 1.78597, 1, 1, 1, 1, 1,
1.4226, -0.3167997, 2.590993, 1, 1, 1, 1, 1,
1.439336, 1.602827, 1.735149, 1, 1, 1, 1, 1,
1.44128, -0.7786644, 2.475517, 1, 1, 1, 1, 1,
1.448763, -0.7064399, 2.196815, 1, 1, 1, 1, 1,
1.478497, -0.1819978, 3.159362, 1, 1, 1, 1, 1,
1.480153, 0.812946, 0.03481865, 1, 1, 1, 1, 1,
1.489372, 0.7645424, 2.561992, 1, 1, 1, 1, 1,
1.490126, -0.6543444, 2.434586, 1, 1, 1, 1, 1,
1.491382, 1.611751, 0.4701119, 0, 0, 1, 1, 1,
1.492268, 2.311072, -1.700574, 1, 0, 0, 1, 1,
1.497924, -1.767848, 3.414599, 1, 0, 0, 1, 1,
1.498141, 1.742341, 1.040541, 1, 0, 0, 1, 1,
1.503122, 0.430858, -0.6300251, 1, 0, 0, 1, 1,
1.503259, -0.3808817, 1.865803, 1, 0, 0, 1, 1,
1.505692, 0.5727746, -0.3053541, 0, 0, 0, 1, 1,
1.514266, 0.9370499, 0.4788623, 0, 0, 0, 1, 1,
1.514372, -0.9609289, 2.082581, 0, 0, 0, 1, 1,
1.517244, 2.116347, 0.6937822, 0, 0, 0, 1, 1,
1.527423, 0.7789844, 1.669705, 0, 0, 0, 1, 1,
1.529985, 1.536097, -1.480375, 0, 0, 0, 1, 1,
1.537742, 0.9397394, 0.309009, 0, 0, 0, 1, 1,
1.575202, -0.9018282, 3.065844, 1, 1, 1, 1, 1,
1.57939, 0.5114971, 2.179485, 1, 1, 1, 1, 1,
1.585279, 0.007104944, 0.3637612, 1, 1, 1, 1, 1,
1.636338, 0.2489338, 1.427597, 1, 1, 1, 1, 1,
1.636665, -0.1986118, 1.08542, 1, 1, 1, 1, 1,
1.638111, -1.060318, 1.62993, 1, 1, 1, 1, 1,
1.650557, -0.09989658, 2.233909, 1, 1, 1, 1, 1,
1.652054, -0.04999411, 1.303227, 1, 1, 1, 1, 1,
1.658597, 0.8383198, 2.908451, 1, 1, 1, 1, 1,
1.671677, -0.6381569, 3.252007, 1, 1, 1, 1, 1,
1.684975, 1.73779, 0.3225921, 1, 1, 1, 1, 1,
1.687598, 1.674405, 4.507952, 1, 1, 1, 1, 1,
1.702355, -0.2564948, 2.450264, 1, 1, 1, 1, 1,
1.708772, -0.1315118, 1.134839, 1, 1, 1, 1, 1,
1.713104, -1.295711, 2.080507, 1, 1, 1, 1, 1,
1.754696, -1.016559, 2.271969, 0, 0, 1, 1, 1,
1.788267, -1.067275, 2.557424, 1, 0, 0, 1, 1,
1.790309, -0.4030759, 2.090044, 1, 0, 0, 1, 1,
1.794395, -1.647357, 1.522995, 1, 0, 0, 1, 1,
1.816206, -0.2734044, 1.749995, 1, 0, 0, 1, 1,
1.823759, 0.4053184, 1.766272, 1, 0, 0, 1, 1,
1.824229, 1.251748, 1.186403, 0, 0, 0, 1, 1,
1.828467, 1.879176, 1.603978, 0, 0, 0, 1, 1,
1.831236, -0.6128733, 2.32826, 0, 0, 0, 1, 1,
1.845693, 1.341198, 0.8548064, 0, 0, 0, 1, 1,
1.870986, -1.896082, 0.8137527, 0, 0, 0, 1, 1,
1.875845, 0.6791725, 1.122066, 0, 0, 0, 1, 1,
1.882775, -1.901172, 4.113425, 0, 0, 0, 1, 1,
1.909557, 0.6831275, 0.1715085, 1, 1, 1, 1, 1,
1.933754, 0.5229298, 1.745104, 1, 1, 1, 1, 1,
1.954535, 0.2137309, 1.81759, 1, 1, 1, 1, 1,
1.977254, -0.5576123, 1.727717, 1, 1, 1, 1, 1,
1.986604, 0.03642439, 1.109047, 1, 1, 1, 1, 1,
1.990499, -1.348287, 3.884881, 1, 1, 1, 1, 1,
1.993551, -0.6227949, 2.629393, 1, 1, 1, 1, 1,
2.007498, -0.5955687, 1.757435, 1, 1, 1, 1, 1,
2.025999, -2.401551, 2.0941, 1, 1, 1, 1, 1,
2.037096, 1.282077, 0.8991207, 1, 1, 1, 1, 1,
2.059658, 1.232304, 1.699438, 1, 1, 1, 1, 1,
2.086889, -0.2726142, 0.4016714, 1, 1, 1, 1, 1,
2.089393, 0.5030274, 0.7824643, 1, 1, 1, 1, 1,
2.109492, 0.34387, 2.761989, 1, 1, 1, 1, 1,
2.132473, 0.1680993, 0.9800659, 1, 1, 1, 1, 1,
2.201086, 0.3415294, 1.923903, 0, 0, 1, 1, 1,
2.309584, -0.4394631, 2.065591, 1, 0, 0, 1, 1,
2.310548, 0.5628182, 1.493593, 1, 0, 0, 1, 1,
2.314827, 0.9803893, 1.928142, 1, 0, 0, 1, 1,
2.319955, -0.2073399, 1.694571, 1, 0, 0, 1, 1,
2.343951, -0.7051561, 1.288938, 1, 0, 0, 1, 1,
2.347251, -0.03894049, -0.3084328, 0, 0, 0, 1, 1,
2.37736, 0.8951908, 0.8322181, 0, 0, 0, 1, 1,
2.385818, 1.789694, 2.829309, 0, 0, 0, 1, 1,
2.417205, 0.2929989, 0.7667526, 0, 0, 0, 1, 1,
2.460214, 1.389726, 1.828513, 0, 0, 0, 1, 1,
2.484369, -0.4271152, 0.8998399, 0, 0, 0, 1, 1,
2.49017, 0.4803426, 2.014975, 0, 0, 0, 1, 1,
2.504014, -1.034105, 2.402721, 1, 1, 1, 1, 1,
2.535003, -1.447855, 2.121857, 1, 1, 1, 1, 1,
2.541635, 0.1916569, 0.8866147, 1, 1, 1, 1, 1,
2.558877, -0.04623395, 2.459743, 1, 1, 1, 1, 1,
2.594036, 0.2044696, 1.224945, 1, 1, 1, 1, 1,
2.668258, -1.159727, 2.383286, 1, 1, 1, 1, 1,
2.795616, 0.03860798, 2.019915, 1, 1, 1, 1, 1
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
var radius = 9.528996;
var distance = 33.47019;
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
mvMatrix.translate( 0.275213, -0.06567931, 0.6009166 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47019);
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
