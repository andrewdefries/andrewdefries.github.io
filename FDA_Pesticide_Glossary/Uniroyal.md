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
-3.064622, 1.17214, -0.9755587, 1, 0, 0, 1,
-2.945688, -1.014293, -1.347357, 1, 0.007843138, 0, 1,
-2.927693, -0.1544406, -2.858202, 1, 0.01176471, 0, 1,
-2.842261, -0.3352407, -1.47022, 1, 0.01960784, 0, 1,
-2.831547, 0.2801971, -0.8439021, 1, 0.02352941, 0, 1,
-2.823465, -0.4542106, -3.901664, 1, 0.03137255, 0, 1,
-2.736475, 1.960167, -0.6530743, 1, 0.03529412, 0, 1,
-2.693913, -1.622434, -3.312671, 1, 0.04313726, 0, 1,
-2.688149, -0.9445041, -2.3782, 1, 0.04705882, 0, 1,
-2.523943, -0.6550953, -2.18832, 1, 0.05490196, 0, 1,
-2.353972, 0.9245784, -2.51374, 1, 0.05882353, 0, 1,
-2.349363, 0.07027954, -2.933932, 1, 0.06666667, 0, 1,
-2.348142, -0.174702, -1.481103, 1, 0.07058824, 0, 1,
-2.337937, 0.7695992, -0.4504296, 1, 0.07843138, 0, 1,
-2.286698, -0.3877619, -1.30981, 1, 0.08235294, 0, 1,
-2.260906, 1.572542, -1.205397, 1, 0.09019608, 0, 1,
-2.230791, -0.8874993, -1.598407, 1, 0.09411765, 0, 1,
-2.163286, 0.1901159, -1.871827, 1, 0.1019608, 0, 1,
-2.142828, -0.7135087, -1.264228, 1, 0.1098039, 0, 1,
-2.133009, -0.3458781, -1.243872, 1, 0.1137255, 0, 1,
-2.12036, -0.9691825, -1.487395, 1, 0.1215686, 0, 1,
-2.079266, 0.3206644, -1.072053, 1, 0.1254902, 0, 1,
-2.055301, 0.1903574, 0.1742778, 1, 0.1333333, 0, 1,
-2.014536, 0.7167652, -2.010841, 1, 0.1372549, 0, 1,
-1.990856, -0.3921174, -0.4270792, 1, 0.145098, 0, 1,
-1.982245, -0.4059544, -1.399597, 1, 0.1490196, 0, 1,
-1.963146, -1.388722, -1.868083, 1, 0.1568628, 0, 1,
-1.960395, 0.4221672, -2.772965, 1, 0.1607843, 0, 1,
-1.955569, -0.6641571, -0.9780617, 1, 0.1686275, 0, 1,
-1.955154, -0.368176, -0.6274151, 1, 0.172549, 0, 1,
-1.914626, 1.156905, -0.6332884, 1, 0.1803922, 0, 1,
-1.911437, -1.524867, -4.882811, 1, 0.1843137, 0, 1,
-1.898071, 0.153403, -1.531981, 1, 0.1921569, 0, 1,
-1.891564, 0.4433436, -1.481663, 1, 0.1960784, 0, 1,
-1.864346, 1.346454, -2.278604, 1, 0.2039216, 0, 1,
-1.828569, 1.546662, 0.7397974, 1, 0.2117647, 0, 1,
-1.823231, 0.4492452, -0.8630759, 1, 0.2156863, 0, 1,
-1.812201, -0.217848, -1.765436, 1, 0.2235294, 0, 1,
-1.804146, -0.4826393, -1.198336, 1, 0.227451, 0, 1,
-1.800377, 0.4224509, -1.661318, 1, 0.2352941, 0, 1,
-1.791004, -0.9060408, -2.09706, 1, 0.2392157, 0, 1,
-1.776859, -1.369594, -2.087727, 1, 0.2470588, 0, 1,
-1.774901, -0.1295973, -2.061765, 1, 0.2509804, 0, 1,
-1.760642, 1.973035, -0.1275298, 1, 0.2588235, 0, 1,
-1.699849, -0.7317486, -2.643824, 1, 0.2627451, 0, 1,
-1.695337, -0.6586195, 0.2634512, 1, 0.2705882, 0, 1,
-1.687333, 0.5518487, -2.123481, 1, 0.2745098, 0, 1,
-1.68293, -0.3093767, -1.561441, 1, 0.282353, 0, 1,
-1.637643, -0.5756127, 0.1226433, 1, 0.2862745, 0, 1,
-1.636841, 0.2253871, -1.214473, 1, 0.2941177, 0, 1,
-1.633189, -0.5920087, -0.3595081, 1, 0.3019608, 0, 1,
-1.631322, 1.91559, -0.4620659, 1, 0.3058824, 0, 1,
-1.629994, 0.01593929, -3.35489, 1, 0.3137255, 0, 1,
-1.620899, -0.4740053, -1.288582, 1, 0.3176471, 0, 1,
-1.592055, 1.20446, -0.5754117, 1, 0.3254902, 0, 1,
-1.588236, 0.1232126, -1.479487, 1, 0.3294118, 0, 1,
-1.587601, -0.6376583, -0.5405667, 1, 0.3372549, 0, 1,
-1.587318, -0.489061, -1.792743, 1, 0.3411765, 0, 1,
-1.571292, 0.4903511, -0.87344, 1, 0.3490196, 0, 1,
-1.567435, 0.2865325, -1.344545, 1, 0.3529412, 0, 1,
-1.566299, 1.512535, 0.09293111, 1, 0.3607843, 0, 1,
-1.564462, 0.6543325, -1.135808, 1, 0.3647059, 0, 1,
-1.562359, -2.191608, -2.77272, 1, 0.372549, 0, 1,
-1.55722, 0.02731294, -1.330985, 1, 0.3764706, 0, 1,
-1.542302, -0.3031991, -2.008336, 1, 0.3843137, 0, 1,
-1.538025, 1.557325, -1.528481, 1, 0.3882353, 0, 1,
-1.531631, 0.8966292, -0.7024901, 1, 0.3960784, 0, 1,
-1.506281, -1.382255, -3.017954, 1, 0.4039216, 0, 1,
-1.503934, -0.2122479, -1.019096, 1, 0.4078431, 0, 1,
-1.503601, 0.1574056, -0.1825273, 1, 0.4156863, 0, 1,
-1.488783, 0.8291563, -1.011561, 1, 0.4196078, 0, 1,
-1.480015, -0.5916906, -1.381392, 1, 0.427451, 0, 1,
-1.475805, 2.005712, -0.08285406, 1, 0.4313726, 0, 1,
-1.47282, 1.011808, -1.382569, 1, 0.4392157, 0, 1,
-1.464342, 0.1847148, -1.437353, 1, 0.4431373, 0, 1,
-1.452581, -2.662927, -2.149557, 1, 0.4509804, 0, 1,
-1.45062, 0.3931221, 0.03445985, 1, 0.454902, 0, 1,
-1.449959, -1.192108, -0.7522071, 1, 0.4627451, 0, 1,
-1.442255, -2.643274, -2.489618, 1, 0.4666667, 0, 1,
-1.438828, -1.043625, -0.6634076, 1, 0.4745098, 0, 1,
-1.428018, 0.3781454, -2.020156, 1, 0.4784314, 0, 1,
-1.415597, 0.07445775, -1.422844, 1, 0.4862745, 0, 1,
-1.410143, 0.6227436, 0.09317209, 1, 0.4901961, 0, 1,
-1.408337, -0.6229756, -2.321824, 1, 0.4980392, 0, 1,
-1.40492, -1.524917, -2.096087, 1, 0.5058824, 0, 1,
-1.403264, 1.710861, -0.4036185, 1, 0.509804, 0, 1,
-1.3992, 1.346237, 1.186391, 1, 0.5176471, 0, 1,
-1.396941, -1.632323, -2.760546, 1, 0.5215687, 0, 1,
-1.392035, 3.254691, 0.3875898, 1, 0.5294118, 0, 1,
-1.391886, 0.3672601, -2.800242, 1, 0.5333334, 0, 1,
-1.382383, 0.9404677, -1.221072, 1, 0.5411765, 0, 1,
-1.369887, -0.4871748, -2.503359, 1, 0.5450981, 0, 1,
-1.366941, -0.864431, -2.624127, 1, 0.5529412, 0, 1,
-1.366344, -0.6495355, -2.123752, 1, 0.5568628, 0, 1,
-1.349987, 0.1828522, -2.869269, 1, 0.5647059, 0, 1,
-1.349928, -0.484941, -1.531808, 1, 0.5686275, 0, 1,
-1.345526, -0.1726316, -1.84214, 1, 0.5764706, 0, 1,
-1.344306, -0.05234712, -1.039384, 1, 0.5803922, 0, 1,
-1.331789, -2.392944, -1.413538, 1, 0.5882353, 0, 1,
-1.33124, 0.6307312, -1.684016, 1, 0.5921569, 0, 1,
-1.328826, 0.9482151, -1.506649, 1, 0.6, 0, 1,
-1.317595, 0.1877858, -1.623194, 1, 0.6078432, 0, 1,
-1.312758, -1.139854, -2.495291, 1, 0.6117647, 0, 1,
-1.311976, -0.3304538, -1.937321, 1, 0.6196079, 0, 1,
-1.30595, 0.6935909, 0.4939248, 1, 0.6235294, 0, 1,
-1.301255, -0.1944526, -1.590519, 1, 0.6313726, 0, 1,
-1.297442, 0.7204841, 0.8704004, 1, 0.6352941, 0, 1,
-1.292605, 0.2698005, -1.541114, 1, 0.6431373, 0, 1,
-1.285063, 0.6925704, -0.7832097, 1, 0.6470588, 0, 1,
-1.268683, 0.8862439, -1.860904, 1, 0.654902, 0, 1,
-1.26457, -0.5520543, -2.067179, 1, 0.6588235, 0, 1,
-1.262477, -0.1451539, -0.4032966, 1, 0.6666667, 0, 1,
-1.260131, -0.5595, -0.3700432, 1, 0.6705883, 0, 1,
-1.257438, -1.4181, -1.482545, 1, 0.6784314, 0, 1,
-1.25457, 1.459422, -1.798775, 1, 0.682353, 0, 1,
-1.253552, -0.4235422, -1.033313, 1, 0.6901961, 0, 1,
-1.236873, 0.202547, -1.928939, 1, 0.6941177, 0, 1,
-1.233841, 1.660076, -1.178628, 1, 0.7019608, 0, 1,
-1.230066, -0.7640375, -3.078194, 1, 0.7098039, 0, 1,
-1.22851, -0.1158968, -2.230608, 1, 0.7137255, 0, 1,
-1.218394, -1.603453, -2.734868, 1, 0.7215686, 0, 1,
-1.217804, 0.4115129, -2.132214, 1, 0.7254902, 0, 1,
-1.213456, -0.9752643, -2.016282, 1, 0.7333333, 0, 1,
-1.213287, -0.06456997, -1.84163, 1, 0.7372549, 0, 1,
-1.197718, -0.5654983, -1.697875, 1, 0.7450981, 0, 1,
-1.19591, 0.2278325, -1.052845, 1, 0.7490196, 0, 1,
-1.195333, -0.4249592, -1.754514, 1, 0.7568628, 0, 1,
-1.194055, -0.01504609, 0.6173163, 1, 0.7607843, 0, 1,
-1.188333, -0.6543744, -2.643068, 1, 0.7686275, 0, 1,
-1.187818, -2.575292, -2.122183, 1, 0.772549, 0, 1,
-1.182572, -2.050103, -1.766731, 1, 0.7803922, 0, 1,
-1.175944, -0.4020948, -1.226928, 1, 0.7843137, 0, 1,
-1.174078, 1.061391, -2.690437, 1, 0.7921569, 0, 1,
-1.173249, -2.17901, -2.57213, 1, 0.7960784, 0, 1,
-1.167907, -2.967155, -1.073278, 1, 0.8039216, 0, 1,
-1.163832, 0.5130352, 0.02761903, 1, 0.8117647, 0, 1,
-1.139535, 0.5326791, -2.054676, 1, 0.8156863, 0, 1,
-1.133933, 1.006729, -0.8071109, 1, 0.8235294, 0, 1,
-1.133074, 0.0227698, 0.09043367, 1, 0.827451, 0, 1,
-1.125469, -0.0984595, -0.8362024, 1, 0.8352941, 0, 1,
-1.11937, -0.3461552, -0.1903361, 1, 0.8392157, 0, 1,
-1.117377, 1.395471, -0.957489, 1, 0.8470588, 0, 1,
-1.112673, -0.9561648, -4.287298, 1, 0.8509804, 0, 1,
-1.108184, 1.584056, -0.964891, 1, 0.8588235, 0, 1,
-1.104731, 0.009569288, -1.407334, 1, 0.8627451, 0, 1,
-1.103809, -1.199939, -0.8296039, 1, 0.8705882, 0, 1,
-1.097, 0.9512891, -1.919376, 1, 0.8745098, 0, 1,
-1.092421, 1.011616, -0.4420797, 1, 0.8823529, 0, 1,
-1.092114, 0.3757723, -0.9144778, 1, 0.8862745, 0, 1,
-1.087695, 0.8736324, -2.22644, 1, 0.8941177, 0, 1,
-1.086182, -0.3581584, -1.461575, 1, 0.8980392, 0, 1,
-1.082573, -1.677526, -3.479105, 1, 0.9058824, 0, 1,
-1.082138, -1.534652, -2.189688, 1, 0.9137255, 0, 1,
-1.076279, 1.256077, -1.172621, 1, 0.9176471, 0, 1,
-1.074985, -1.715895, -1.555443, 1, 0.9254902, 0, 1,
-1.070462, 1.395381, -0.1891256, 1, 0.9294118, 0, 1,
-1.065887, -0.2496393, -2.432517, 1, 0.9372549, 0, 1,
-1.064691, 0.1646562, -0.6590448, 1, 0.9411765, 0, 1,
-1.062788, 0.184334, -2.483209, 1, 0.9490196, 0, 1,
-1.060808, -0.4212574, -1.256323, 1, 0.9529412, 0, 1,
-1.055074, -0.8090187, -2.973907, 1, 0.9607843, 0, 1,
-1.046617, 1.859399, -0.4911446, 1, 0.9647059, 0, 1,
-1.045843, 0.5884088, -1.473241, 1, 0.972549, 0, 1,
-1.044349, 1.305122, -2.201894, 1, 0.9764706, 0, 1,
-1.042553, -0.7725241, -2.234973, 1, 0.9843137, 0, 1,
-1.034702, -0.2182818, -2.448255, 1, 0.9882353, 0, 1,
-1.034589, -0.8677127, -2.959565, 1, 0.9960784, 0, 1,
-1.031982, 0.165591, 0.09833757, 0.9960784, 1, 0, 1,
-1.029772, 1.232609, 0.4588797, 0.9921569, 1, 0, 1,
-1.028384, 0.9768507, 0.1299456, 0.9843137, 1, 0, 1,
-1.023943, -0.9270523, -4.266861, 0.9803922, 1, 0, 1,
-1.020525, -0.8582084, -1.218514, 0.972549, 1, 0, 1,
-1.016263, 0.6006171, -1.074046, 0.9686275, 1, 0, 1,
-1.015799, -0.8434083, -2.821216, 0.9607843, 1, 0, 1,
-1.015212, 0.2247948, -2.571659, 0.9568627, 1, 0, 1,
-1.002298, -1.103639, -1.484171, 0.9490196, 1, 0, 1,
-0.9957908, -0.05650292, -2.142264, 0.945098, 1, 0, 1,
-0.992109, -1.29376, -2.957639, 0.9372549, 1, 0, 1,
-0.9914997, -0.607994, -3.036839, 0.9333333, 1, 0, 1,
-0.991034, 1.047616, -2.461185, 0.9254902, 1, 0, 1,
-0.987804, -0.3618142, -3.490453, 0.9215686, 1, 0, 1,
-0.9860918, 1.505496, -0.7858644, 0.9137255, 1, 0, 1,
-0.9848107, -0.3262552, -2.081018, 0.9098039, 1, 0, 1,
-0.9778245, -0.009085902, -1.976773, 0.9019608, 1, 0, 1,
-0.9777241, 1.357033, 0.07612941, 0.8941177, 1, 0, 1,
-0.9736697, 0.07862111, -0.3766282, 0.8901961, 1, 0, 1,
-0.9698482, 1.117998, -1.826933, 0.8823529, 1, 0, 1,
-0.9661781, -0.7082978, -2.673087, 0.8784314, 1, 0, 1,
-0.9637535, -0.5948172, -1.509101, 0.8705882, 1, 0, 1,
-0.9635018, -0.8031447, -3.364519, 0.8666667, 1, 0, 1,
-0.9590635, 1.039255, -0.3561764, 0.8588235, 1, 0, 1,
-0.9586619, 1.54063, -0.4760923, 0.854902, 1, 0, 1,
-0.9583567, 1.281114, -0.9915282, 0.8470588, 1, 0, 1,
-0.9558977, 1.82812, -2.398109, 0.8431373, 1, 0, 1,
-0.950348, 1.326011, -0.2376582, 0.8352941, 1, 0, 1,
-0.9460547, -0.8082486, -3.823659, 0.8313726, 1, 0, 1,
-0.9456177, -0.47441, -1.417803, 0.8235294, 1, 0, 1,
-0.9442931, -1.20654, -3.101896, 0.8196079, 1, 0, 1,
-0.9441938, 0.9448131, 0.3650674, 0.8117647, 1, 0, 1,
-0.9378215, 1.940915, 0.5235444, 0.8078431, 1, 0, 1,
-0.9344598, 0.2112389, -2.575336, 0.8, 1, 0, 1,
-0.931318, -0.3861891, 0.7918277, 0.7921569, 1, 0, 1,
-0.9291468, -0.329269, -2.404855, 0.7882353, 1, 0, 1,
-0.9271984, 0.833786, -0.09603462, 0.7803922, 1, 0, 1,
-0.921956, 1.089015, 0.3266154, 0.7764706, 1, 0, 1,
-0.916622, -1.196129, -1.290825, 0.7686275, 1, 0, 1,
-0.9132681, -0.9367356, -3.044325, 0.7647059, 1, 0, 1,
-0.9092415, 0.5808094, -0.7597739, 0.7568628, 1, 0, 1,
-0.9060384, 0.4943503, -0.8078272, 0.7529412, 1, 0, 1,
-0.9019086, -0.4478113, -2.038768, 0.7450981, 1, 0, 1,
-0.8981638, -0.3660896, -2.38078, 0.7411765, 1, 0, 1,
-0.8973757, 0.6073118, -1.350789, 0.7333333, 1, 0, 1,
-0.8969646, -0.7250249, -1.720853, 0.7294118, 1, 0, 1,
-0.8957895, 1.981099, 0.2680002, 0.7215686, 1, 0, 1,
-0.8918794, 1.71692, -0.8094296, 0.7176471, 1, 0, 1,
-0.8913407, 0.008942069, -1.910735, 0.7098039, 1, 0, 1,
-0.8845121, 0.522374, -2.855778, 0.7058824, 1, 0, 1,
-0.8834941, -0.5918599, -1.286877, 0.6980392, 1, 0, 1,
-0.8804783, 0.5150815, -1.950946, 0.6901961, 1, 0, 1,
-0.8742576, -0.4473153, -4.067218, 0.6862745, 1, 0, 1,
-0.8706917, -0.6050328, -2.247418, 0.6784314, 1, 0, 1,
-0.8703189, 0.5141904, 0.3079199, 0.6745098, 1, 0, 1,
-0.8556342, 2.472687, 0.7900171, 0.6666667, 1, 0, 1,
-0.8544642, 1.264897, -0.6077511, 0.6627451, 1, 0, 1,
-0.8444936, -2.541468, -2.214441, 0.654902, 1, 0, 1,
-0.8417135, 0.8818772, -1.916456, 0.6509804, 1, 0, 1,
-0.8386536, -0.8277879, -0.7021109, 0.6431373, 1, 0, 1,
-0.8357213, -0.2233014, -3.129299, 0.6392157, 1, 0, 1,
-0.8283505, 0.8282724, -1.344674, 0.6313726, 1, 0, 1,
-0.8220837, 1.730548, -1.966313, 0.627451, 1, 0, 1,
-0.8197294, -1.533966, -2.734596, 0.6196079, 1, 0, 1,
-0.8102818, -1.24489, -1.955358, 0.6156863, 1, 0, 1,
-0.8062996, -0.4238128, -1.160128, 0.6078432, 1, 0, 1,
-0.8050881, 0.6977987, -0.7085341, 0.6039216, 1, 0, 1,
-0.7981294, 0.9448924, -0.5616643, 0.5960785, 1, 0, 1,
-0.7920165, -1.974045, -1.723524, 0.5882353, 1, 0, 1,
-0.7893257, 0.9605718, -0.3747945, 0.5843138, 1, 0, 1,
-0.7871518, -0.8294566, -2.95697, 0.5764706, 1, 0, 1,
-0.7855742, 1.064287, 0.03020261, 0.572549, 1, 0, 1,
-0.7847513, 1.055874, -1.483656, 0.5647059, 1, 0, 1,
-0.7770352, 0.2895725, -1.848279, 0.5607843, 1, 0, 1,
-0.76378, 1.382724, -0.6724069, 0.5529412, 1, 0, 1,
-0.7634709, 1.612695, -0.09964971, 0.5490196, 1, 0, 1,
-0.7631954, 0.2839137, -0.2580192, 0.5411765, 1, 0, 1,
-0.7617024, -0.837086, -3.743616, 0.5372549, 1, 0, 1,
-0.7604633, 1.328746, 0.260638, 0.5294118, 1, 0, 1,
-0.753736, 0.4092088, -0.695805, 0.5254902, 1, 0, 1,
-0.7463731, -1.146871, -3.849311, 0.5176471, 1, 0, 1,
-0.7433916, 1.206674, -0.3012083, 0.5137255, 1, 0, 1,
-0.7417642, -1.934713, -2.693339, 0.5058824, 1, 0, 1,
-0.732947, 0.1529405, -0.6234457, 0.5019608, 1, 0, 1,
-0.7297999, 1.43407, 0.1227274, 0.4941176, 1, 0, 1,
-0.7291023, 1.186374, 0.811049, 0.4862745, 1, 0, 1,
-0.7268279, -1.355479, -1.975463, 0.4823529, 1, 0, 1,
-0.7262299, 0.01646316, -0.46561, 0.4745098, 1, 0, 1,
-0.7189191, 1.729357, -0.8820688, 0.4705882, 1, 0, 1,
-0.7179467, -1.212496, -3.392779, 0.4627451, 1, 0, 1,
-0.7179409, 0.1196912, -2.071781, 0.4588235, 1, 0, 1,
-0.7147967, -1.513392, -4.178938, 0.4509804, 1, 0, 1,
-0.7116091, -1.165963, -4.918381, 0.4470588, 1, 0, 1,
-0.7098992, -0.5126551, -3.34443, 0.4392157, 1, 0, 1,
-0.707064, -0.1610729, -1.750553, 0.4352941, 1, 0, 1,
-0.7057205, 0.1822968, -1.95866, 0.427451, 1, 0, 1,
-0.6950975, -0.6806344, -2.504578, 0.4235294, 1, 0, 1,
-0.6904678, 0.2892029, -1.555634, 0.4156863, 1, 0, 1,
-0.68103, 0.3015116, -1.855914, 0.4117647, 1, 0, 1,
-0.6798332, 0.4570262, -0.3771001, 0.4039216, 1, 0, 1,
-0.6714522, -1.02376, -2.232656, 0.3960784, 1, 0, 1,
-0.6710666, 1.580748, 1.854821, 0.3921569, 1, 0, 1,
-0.6674907, -0.7810352, -0.2162997, 0.3843137, 1, 0, 1,
-0.6648168, -0.09491415, -2.047437, 0.3803922, 1, 0, 1,
-0.6619104, 0.338227, -2.301676, 0.372549, 1, 0, 1,
-0.6604201, -1.257534, -2.799138, 0.3686275, 1, 0, 1,
-0.6593554, 0.8566797, -1.075824, 0.3607843, 1, 0, 1,
-0.6588925, 0.3379877, -1.90503, 0.3568628, 1, 0, 1,
-0.6559683, -0.09206232, -2.806086, 0.3490196, 1, 0, 1,
-0.649165, 1.834949, -0.5825832, 0.345098, 1, 0, 1,
-0.6471555, 0.069505, -2.288211, 0.3372549, 1, 0, 1,
-0.6436116, 1.18439, 0.2589138, 0.3333333, 1, 0, 1,
-0.6393526, -0.07502938, -3.377613, 0.3254902, 1, 0, 1,
-0.6365832, -0.8319182, -1.814273, 0.3215686, 1, 0, 1,
-0.6358358, 0.3301062, -2.415852, 0.3137255, 1, 0, 1,
-0.6306286, 0.3043019, -2.944669, 0.3098039, 1, 0, 1,
-0.6227477, -1.842261, -4.335252, 0.3019608, 1, 0, 1,
-0.6216187, 0.8903123, 0.02586496, 0.2941177, 1, 0, 1,
-0.6201122, 0.2756732, -1.070146, 0.2901961, 1, 0, 1,
-0.6192689, 0.8838991, -0.1465381, 0.282353, 1, 0, 1,
-0.6111865, -1.759148, -2.063257, 0.2784314, 1, 0, 1,
-0.6102995, 0.2727738, 0.7728236, 0.2705882, 1, 0, 1,
-0.6066037, -0.9477206, -1.096555, 0.2666667, 1, 0, 1,
-0.6045486, -1.141065, -1.443855, 0.2588235, 1, 0, 1,
-0.6039217, -1.606096, -1.093056, 0.254902, 1, 0, 1,
-0.6033899, -0.4932457, -1.493763, 0.2470588, 1, 0, 1,
-0.6032234, -0.4904726, -1.43448, 0.2431373, 1, 0, 1,
-0.6014505, 0.6285717, -0.08188051, 0.2352941, 1, 0, 1,
-0.5958637, -1.404095, -3.876905, 0.2313726, 1, 0, 1,
-0.593776, -1.557389, -0.261223, 0.2235294, 1, 0, 1,
-0.5920333, -1.71528, -5.59533, 0.2196078, 1, 0, 1,
-0.5914831, 0.9883635, -0.2676915, 0.2117647, 1, 0, 1,
-0.5795314, 1.303925, -1.812223, 0.2078431, 1, 0, 1,
-0.5731302, -0.5829271, -3.041111, 0.2, 1, 0, 1,
-0.5707408, 0.2366855, -1.668033, 0.1921569, 1, 0, 1,
-0.5681502, 0.9821425, -1.022441, 0.1882353, 1, 0, 1,
-0.5668695, -0.06437752, -2.234623, 0.1803922, 1, 0, 1,
-0.5618986, -0.02269395, -2.912224, 0.1764706, 1, 0, 1,
-0.5615581, -0.1969377, -0.8056629, 0.1686275, 1, 0, 1,
-0.5596102, -0.3609521, -3.238237, 0.1647059, 1, 0, 1,
-0.5568424, 0.2754166, -1.829643, 0.1568628, 1, 0, 1,
-0.5560751, 0.1990515, -2.709178, 0.1529412, 1, 0, 1,
-0.5550166, 0.7905465, -0.587331, 0.145098, 1, 0, 1,
-0.5520325, -0.4345584, -1.765511, 0.1411765, 1, 0, 1,
-0.5500942, -0.9219437, -1.150902, 0.1333333, 1, 0, 1,
-0.5474291, -0.2821089, -1.653537, 0.1294118, 1, 0, 1,
-0.5443162, -1.570417, -1.779722, 0.1215686, 1, 0, 1,
-0.5399348, 0.2359289, -2.060383, 0.1176471, 1, 0, 1,
-0.5377, -0.8082269, -0.8599041, 0.1098039, 1, 0, 1,
-0.5335751, -0.7911221, -2.835641, 0.1058824, 1, 0, 1,
-0.5329635, -0.7622158, -2.866964, 0.09803922, 1, 0, 1,
-0.532342, 1.250216, -0.04597395, 0.09019608, 1, 0, 1,
-0.5308571, -1.517731, -2.785746, 0.08627451, 1, 0, 1,
-0.5300911, -0.02801701, -2.78655, 0.07843138, 1, 0, 1,
-0.530031, 1.421396, 0.8860092, 0.07450981, 1, 0, 1,
-0.530006, 1.190984, 0.2832426, 0.06666667, 1, 0, 1,
-0.5286793, -1.37133, -3.221978, 0.0627451, 1, 0, 1,
-0.5246561, -0.7232971, -2.348683, 0.05490196, 1, 0, 1,
-0.5235927, -2.172791, -2.392672, 0.05098039, 1, 0, 1,
-0.5222119, -1.378397, -3.857299, 0.04313726, 1, 0, 1,
-0.5188103, 1.396027, -0.7885001, 0.03921569, 1, 0, 1,
-0.5168203, -1.690479, -3.024633, 0.03137255, 1, 0, 1,
-0.5149021, 0.1422689, -1.648678, 0.02745098, 1, 0, 1,
-0.5126303, 0.5677911, -2.219068, 0.01960784, 1, 0, 1,
-0.5090563, -1.89257, -3.029897, 0.01568628, 1, 0, 1,
-0.5079482, 1.490106, -0.7288548, 0.007843138, 1, 0, 1,
-0.5070271, 0.06176916, -2.939799, 0.003921569, 1, 0, 1,
-0.5065146, 0.3195817, -0.6324716, 0, 1, 0.003921569, 1,
-0.4992958, -0.6353935, -0.8035583, 0, 1, 0.01176471, 1,
-0.4989879, -0.2582237, -1.631895, 0, 1, 0.01568628, 1,
-0.4940374, 1.160284, -0.9689939, 0, 1, 0.02352941, 1,
-0.4891499, -0.5780602, -2.482112, 0, 1, 0.02745098, 1,
-0.4861903, -1.516356, -2.365708, 0, 1, 0.03529412, 1,
-0.4819748, -0.1718191, -0.6813704, 0, 1, 0.03921569, 1,
-0.4814521, -0.9284358, -2.340126, 0, 1, 0.04705882, 1,
-0.4792398, 0.03386537, -0.6794991, 0, 1, 0.05098039, 1,
-0.4755307, -1.951857, -2.68088, 0, 1, 0.05882353, 1,
-0.4738831, 0.1601107, -0.5650096, 0, 1, 0.0627451, 1,
-0.4710357, 0.9894399, 0.2163894, 0, 1, 0.07058824, 1,
-0.4642035, -1.851216, -3.687728, 0, 1, 0.07450981, 1,
-0.4495803, 0.07209842, -1.887755, 0, 1, 0.08235294, 1,
-0.4416023, 1.532221, -0.8817352, 0, 1, 0.08627451, 1,
-0.4356028, 0.9736212, -1.789171, 0, 1, 0.09411765, 1,
-0.4328481, 0.2375344, -1.739122, 0, 1, 0.1019608, 1,
-0.4248639, 1.308463, 0.463698, 0, 1, 0.1058824, 1,
-0.4229101, -0.3241852, -1.511074, 0, 1, 0.1137255, 1,
-0.4140526, 0.8155663, 0.7752393, 0, 1, 0.1176471, 1,
-0.4123807, -1.961094, -4.354767, 0, 1, 0.1254902, 1,
-0.4007208, -0.48988, -1.756584, 0, 1, 0.1294118, 1,
-0.3943411, -0.1969913, -3.474704, 0, 1, 0.1372549, 1,
-0.393678, -0.5516294, -4.709398, 0, 1, 0.1411765, 1,
-0.3936095, -0.8362789, -2.279895, 0, 1, 0.1490196, 1,
-0.393137, 0.3561058, 0.02606468, 0, 1, 0.1529412, 1,
-0.3915944, -0.0793958, -2.042293, 0, 1, 0.1607843, 1,
-0.3787324, -0.7827058, -3.192325, 0, 1, 0.1647059, 1,
-0.3750181, 1.272467, -0.4643633, 0, 1, 0.172549, 1,
-0.3742202, 0.7941759, 0.5417337, 0, 1, 0.1764706, 1,
-0.3699166, -0.01565399, 0.05109155, 0, 1, 0.1843137, 1,
-0.3651526, 2.335615, -0.572836, 0, 1, 0.1882353, 1,
-0.3648574, -0.8082892, -2.921033, 0, 1, 0.1960784, 1,
-0.3638377, 2.61921, 0.9194221, 0, 1, 0.2039216, 1,
-0.3634246, -1.029179, -3.038046, 0, 1, 0.2078431, 1,
-0.362957, -0.503266, -1.655123, 0, 1, 0.2156863, 1,
-0.3568314, -1.4396, -2.343285, 0, 1, 0.2196078, 1,
-0.3558668, -0.3570656, -2.371212, 0, 1, 0.227451, 1,
-0.3524199, -1.205132, -1.013855, 0, 1, 0.2313726, 1,
-0.3519597, 0.4267527, -1.910479, 0, 1, 0.2392157, 1,
-0.3484555, 0.3066855, -1.020473, 0, 1, 0.2431373, 1,
-0.3390846, 1.338677, 1.101507, 0, 1, 0.2509804, 1,
-0.3389876, 0.2579452, 0.0579568, 0, 1, 0.254902, 1,
-0.3376458, -0.5490681, -3.289761, 0, 1, 0.2627451, 1,
-0.3376132, 0.7050905, -1.001641, 0, 1, 0.2666667, 1,
-0.3319956, -2.667162, -3.126935, 0, 1, 0.2745098, 1,
-0.3299576, -0.7786646, -2.268153, 0, 1, 0.2784314, 1,
-0.3288234, 1.669127, -0.7867467, 0, 1, 0.2862745, 1,
-0.3227266, 0.8377261, -0.918564, 0, 1, 0.2901961, 1,
-0.3219742, 0.1741131, -0.3705465, 0, 1, 0.2980392, 1,
-0.3216819, 1.577543, -0.8421084, 0, 1, 0.3058824, 1,
-0.318959, 0.8983576, -1.028319, 0, 1, 0.3098039, 1,
-0.3107138, -0.969588, -1.232726, 0, 1, 0.3176471, 1,
-0.3106059, -1.118665, -2.64608, 0, 1, 0.3215686, 1,
-0.3095899, 1.639882, -1.092579, 0, 1, 0.3294118, 1,
-0.3062095, 0.4777478, -1.718944, 0, 1, 0.3333333, 1,
-0.3045467, 1.223639, -0.08721532, 0, 1, 0.3411765, 1,
-0.3044463, 1.198421, -0.9634664, 0, 1, 0.345098, 1,
-0.2898996, -0.2824734, -2.785993, 0, 1, 0.3529412, 1,
-0.2880706, 0.4636127, -1.656972, 0, 1, 0.3568628, 1,
-0.2816418, -0.3641408, -0.5392, 0, 1, 0.3647059, 1,
-0.2801951, -1.0474, -4.72888, 0, 1, 0.3686275, 1,
-0.2783849, -0.1571263, -2.028601, 0, 1, 0.3764706, 1,
-0.276808, 0.2015139, -1.034301, 0, 1, 0.3803922, 1,
-0.273609, -0.6917872, -2.967196, 0, 1, 0.3882353, 1,
-0.2731473, 0.09631418, 0.9266354, 0, 1, 0.3921569, 1,
-0.2659484, -0.5692959, -0.6803361, 0, 1, 0.4, 1,
-0.2636293, 0.1466966, 0.5679725, 0, 1, 0.4078431, 1,
-0.261741, 0.2856257, -0.6929387, 0, 1, 0.4117647, 1,
-0.260662, -0.1817879, -2.334596, 0, 1, 0.4196078, 1,
-0.2589046, 0.06423703, -0.3862161, 0, 1, 0.4235294, 1,
-0.2574461, -1.756606, -3.263664, 0, 1, 0.4313726, 1,
-0.2554128, -0.6386878, -2.989896, 0, 1, 0.4352941, 1,
-0.2553616, 0.7468606, -2.637436, 0, 1, 0.4431373, 1,
-0.2539259, 0.1143854, -0.02825864, 0, 1, 0.4470588, 1,
-0.2504874, 0.06369507, -1.846045, 0, 1, 0.454902, 1,
-0.2484744, 0.9970757, 1.299752, 0, 1, 0.4588235, 1,
-0.2475053, 0.7482235, -1.862107, 0, 1, 0.4666667, 1,
-0.244, -0.8658845, -3.298961, 0, 1, 0.4705882, 1,
-0.2364547, -0.06783332, -3.199458, 0, 1, 0.4784314, 1,
-0.2360731, -0.5790169, -2.098483, 0, 1, 0.4823529, 1,
-0.2318756, -0.02472736, -1.739791, 0, 1, 0.4901961, 1,
-0.2316675, 0.9063001, 1.55627, 0, 1, 0.4941176, 1,
-0.2302853, 1.551208, -2.032771, 0, 1, 0.5019608, 1,
-0.2252207, 0.8210461, 0.3189484, 0, 1, 0.509804, 1,
-0.2239212, 1.802742, 1.620187, 0, 1, 0.5137255, 1,
-0.2162026, 2.437054, 1.97271, 0, 1, 0.5215687, 1,
-0.2094912, 0.7278913, -0.4072337, 0, 1, 0.5254902, 1,
-0.2090092, -0.3741025, -2.407652, 0, 1, 0.5333334, 1,
-0.2007589, -0.774102, -3.041718, 0, 1, 0.5372549, 1,
-0.1991334, -2.420158, -2.205906, 0, 1, 0.5450981, 1,
-0.19651, -0.3432458, -4.114864, 0, 1, 0.5490196, 1,
-0.1957746, -0.2974202, -2.644048, 0, 1, 0.5568628, 1,
-0.1903578, -1.064534, -3.624669, 0, 1, 0.5607843, 1,
-0.1890075, -0.9270747, -2.813487, 0, 1, 0.5686275, 1,
-0.1887921, 1.932583, -0.9316242, 0, 1, 0.572549, 1,
-0.1882362, -0.2537642, -2.622733, 0, 1, 0.5803922, 1,
-0.1872669, -0.7080658, -1.335831, 0, 1, 0.5843138, 1,
-0.1870012, -0.2771399, -2.5483, 0, 1, 0.5921569, 1,
-0.1854604, 1.393881, 0.5933267, 0, 1, 0.5960785, 1,
-0.1786806, 0.6254619, 0.1057112, 0, 1, 0.6039216, 1,
-0.1702427, 0.8436244, -0.8376642, 0, 1, 0.6117647, 1,
-0.1674279, -1.315661, -1.759557, 0, 1, 0.6156863, 1,
-0.1648012, 0.5491088, -0.5290457, 0, 1, 0.6235294, 1,
-0.1587076, -0.2025426, -1.873689, 0, 1, 0.627451, 1,
-0.1582121, -0.2350125, -3.713316, 0, 1, 0.6352941, 1,
-0.1574285, -1.205125, -2.768518, 0, 1, 0.6392157, 1,
-0.1573718, -1.068967, -4.106158, 0, 1, 0.6470588, 1,
-0.1572829, 0.03965638, -1.313485, 0, 1, 0.6509804, 1,
-0.1532783, 0.8308596, 0.9865721, 0, 1, 0.6588235, 1,
-0.1505814, -0.3967349, -1.65598, 0, 1, 0.6627451, 1,
-0.1501395, -0.1009748, -1.914794, 0, 1, 0.6705883, 1,
-0.1475721, -1.358408, -2.737045, 0, 1, 0.6745098, 1,
-0.1454939, -0.120449, -2.086373, 0, 1, 0.682353, 1,
-0.1454582, 1.23234, -1.503747, 0, 1, 0.6862745, 1,
-0.1427777, -0.8801488, -3.367405, 0, 1, 0.6941177, 1,
-0.1389976, 0.4877122, -0.1383938, 0, 1, 0.7019608, 1,
-0.1304113, 1.412337, -1.189251, 0, 1, 0.7058824, 1,
-0.1302555, 0.6179348, 2.563801, 0, 1, 0.7137255, 1,
-0.128634, 1.784328, -0.1338542, 0, 1, 0.7176471, 1,
-0.1276779, -0.5927344, -2.139163, 0, 1, 0.7254902, 1,
-0.1228334, -0.3155487, -3.033461, 0, 1, 0.7294118, 1,
-0.1219663, -1.544078, -3.709095, 0, 1, 0.7372549, 1,
-0.1152571, 2.074711, 1.248247, 0, 1, 0.7411765, 1,
-0.1144952, 0.7920079, -0.08954573, 0, 1, 0.7490196, 1,
-0.1123429, 0.3168103, -1.115814, 0, 1, 0.7529412, 1,
-0.1096251, 0.2538587, -0.7855461, 0, 1, 0.7607843, 1,
-0.1076325, 0.8549302, -0.8213329, 0, 1, 0.7647059, 1,
-0.1073546, -1.974848, -3.440726, 0, 1, 0.772549, 1,
-0.1069131, -1.080739, -4.057595, 0, 1, 0.7764706, 1,
-0.1017768, 0.7785315, -2.233027, 0, 1, 0.7843137, 1,
-0.09788835, 0.05605998, -0.6390555, 0, 1, 0.7882353, 1,
-0.09462972, 0.2461273, -0.4731463, 0, 1, 0.7960784, 1,
-0.09408692, -0.2786019, -3.646094, 0, 1, 0.8039216, 1,
-0.09246039, 0.4171895, 1.687478, 0, 1, 0.8078431, 1,
-0.09237082, -0.1789224, -2.031429, 0, 1, 0.8156863, 1,
-0.09047493, -0.1539337, -2.787225, 0, 1, 0.8196079, 1,
-0.09000565, -0.1625097, -2.001751, 0, 1, 0.827451, 1,
-0.08335652, -1.088076, -2.128392, 0, 1, 0.8313726, 1,
-0.08261497, -0.4055372, -2.991114, 0, 1, 0.8392157, 1,
-0.07849067, 0.4220592, -0.5204164, 0, 1, 0.8431373, 1,
-0.07575994, -1.590426, -4.213556, 0, 1, 0.8509804, 1,
-0.07475226, 0.5863734, 0.1181398, 0, 1, 0.854902, 1,
-0.07131226, -0.4293601, -2.170508, 0, 1, 0.8627451, 1,
-0.06186957, 0.4884255, 0.1682236, 0, 1, 0.8666667, 1,
-0.06010671, 0.9305265, 0.8376604, 0, 1, 0.8745098, 1,
-0.05997461, 1.405944, -0.9894556, 0, 1, 0.8784314, 1,
-0.05962609, 1.070065, 0.5913139, 0, 1, 0.8862745, 1,
-0.05522323, 0.8808777, 0.02228507, 0, 1, 0.8901961, 1,
-0.05238374, -1.207522, -4.006962, 0, 1, 0.8980392, 1,
-0.04853483, 0.9695211, 0.3314466, 0, 1, 0.9058824, 1,
-0.04482703, 0.1209103, -1.123031, 0, 1, 0.9098039, 1,
-0.04473246, 0.1118947, -0.5514783, 0, 1, 0.9176471, 1,
-0.03964976, 1.164202, 2.048877, 0, 1, 0.9215686, 1,
-0.0367975, 1.455472, -0.5767102, 0, 1, 0.9294118, 1,
-0.03525206, 0.3457308, 2.051121, 0, 1, 0.9333333, 1,
-0.0310525, 0.2630971, 0.1775668, 0, 1, 0.9411765, 1,
-0.02854818, 1.137513, 1.199274, 0, 1, 0.945098, 1,
-0.02129691, 0.2396933, -1.009328, 0, 1, 0.9529412, 1,
-0.02117984, -0.8066837, -5.439206, 0, 1, 0.9568627, 1,
-0.01923809, 0.8494074, -0.2398361, 0, 1, 0.9647059, 1,
-0.009361882, -0.8150927, -4.732715, 0, 1, 0.9686275, 1,
-0.005760215, 0.550229, 0.5221048, 0, 1, 0.9764706, 1,
-0.005493613, -0.4940161, -0.1702886, 0, 1, 0.9803922, 1,
0.00493406, -1.2889, 2.910864, 0, 1, 0.9882353, 1,
0.008269762, 0.3688428, -0.9023324, 0, 1, 0.9921569, 1,
0.01459781, 1.49287, 1.42654, 0, 1, 1, 1,
0.01594596, 0.05886399, 0.3246199, 0, 0.9921569, 1, 1,
0.01796255, -1.114122, 4.649032, 0, 0.9882353, 1, 1,
0.02203432, -0.3297004, 3.422464, 0, 0.9803922, 1, 1,
0.02728387, -0.1876367, 3.414032, 0, 0.9764706, 1, 1,
0.02810469, -1.18226, 4.023801, 0, 0.9686275, 1, 1,
0.03037686, -0.6687188, 1.671284, 0, 0.9647059, 1, 1,
0.03824225, -0.9126784, 3.575971, 0, 0.9568627, 1, 1,
0.04104919, 0.2796938, 0.7817513, 0, 0.9529412, 1, 1,
0.04263552, -1.514485, 2.176381, 0, 0.945098, 1, 1,
0.04648445, 1.234641, 0.7294651, 0, 0.9411765, 1, 1,
0.04927225, 0.5075766, -0.3462592, 0, 0.9333333, 1, 1,
0.05036733, 0.3614427, 0.6658713, 0, 0.9294118, 1, 1,
0.05584193, 0.1918017, -0.5351018, 0, 0.9215686, 1, 1,
0.06069658, 0.295295, -0.3365231, 0, 0.9176471, 1, 1,
0.06270474, 0.6284559, 0.306095, 0, 0.9098039, 1, 1,
0.06491473, -1.348801, 3.771587, 0, 0.9058824, 1, 1,
0.0649922, -0.5588208, 2.499361, 0, 0.8980392, 1, 1,
0.06709459, -1.384005, 2.34803, 0, 0.8901961, 1, 1,
0.07056443, 0.05751372, 0.2416996, 0, 0.8862745, 1, 1,
0.07351173, -0.8804986, 2.395967, 0, 0.8784314, 1, 1,
0.07401513, -1.43944, 2.359902, 0, 0.8745098, 1, 1,
0.07773002, 0.05982824, -1.685225, 0, 0.8666667, 1, 1,
0.08195853, -0.4245734, 3.772214, 0, 0.8627451, 1, 1,
0.08239976, 1.189982, -0.2676415, 0, 0.854902, 1, 1,
0.08264156, -0.9026402, 4.318208, 0, 0.8509804, 1, 1,
0.0833313, -0.7999212, 2.830107, 0, 0.8431373, 1, 1,
0.08341438, -0.1907625, 1.605701, 0, 0.8392157, 1, 1,
0.08358902, 0.3100932, 0.6838971, 0, 0.8313726, 1, 1,
0.08455876, -0.7999417, 2.643554, 0, 0.827451, 1, 1,
0.08713253, 0.3439055, 0.02048454, 0, 0.8196079, 1, 1,
0.09105904, 1.351005, -1.422666, 0, 0.8156863, 1, 1,
0.09325875, 0.3511133, 0.1665337, 0, 0.8078431, 1, 1,
0.09697913, 0.222168, -0.5782681, 0, 0.8039216, 1, 1,
0.0973666, 0.7916673, 1.065723, 0, 0.7960784, 1, 1,
0.1042304, 0.8482101, -0.8416887, 0, 0.7882353, 1, 1,
0.1045787, -0.3261207, 1.736084, 0, 0.7843137, 1, 1,
0.1065884, 0.03844274, 1.14785, 0, 0.7764706, 1, 1,
0.107292, -1.002695, 5.31635, 0, 0.772549, 1, 1,
0.1084787, -0.6528449, 3.381222, 0, 0.7647059, 1, 1,
0.1085934, -0.3412905, 5.152564, 0, 0.7607843, 1, 1,
0.1107149, 1.467822, -0.5500048, 0, 0.7529412, 1, 1,
0.1111479, 1.406594, 1.566194, 0, 0.7490196, 1, 1,
0.1138886, 0.6079534, -1.131926, 0, 0.7411765, 1, 1,
0.1139508, 0.9286859, -1.509164, 0, 0.7372549, 1, 1,
0.1175976, -1.118477, 2.330259, 0, 0.7294118, 1, 1,
0.1179317, -1.571725, 2.222684, 0, 0.7254902, 1, 1,
0.124828, 0.053978, 0.8601464, 0, 0.7176471, 1, 1,
0.1261155, 1.185856, -0.4801261, 0, 0.7137255, 1, 1,
0.1277007, 2.210446, 1.289346, 0, 0.7058824, 1, 1,
0.1302243, -0.4745644, 4.516191, 0, 0.6980392, 1, 1,
0.1331306, -0.3685132, 2.671771, 0, 0.6941177, 1, 1,
0.134956, -0.7525063, 1.941999, 0, 0.6862745, 1, 1,
0.135712, -0.08220556, 2.105166, 0, 0.682353, 1, 1,
0.1365671, -0.2033495, 2.499245, 0, 0.6745098, 1, 1,
0.1373211, 0.8218102, 0.28724, 0, 0.6705883, 1, 1,
0.1374638, 0.01335888, 1.995371, 0, 0.6627451, 1, 1,
0.138391, -1.185748, 2.611914, 0, 0.6588235, 1, 1,
0.1438004, 1.386762, 1.021936, 0, 0.6509804, 1, 1,
0.1441423, -1.008576, 2.811509, 0, 0.6470588, 1, 1,
0.146797, 0.2245476, 0.05876125, 0, 0.6392157, 1, 1,
0.152975, 1.221319, 1.032461, 0, 0.6352941, 1, 1,
0.1541314, 0.6273074, 2.139337, 0, 0.627451, 1, 1,
0.1563598, -0.0007857326, 0.2954966, 0, 0.6235294, 1, 1,
0.1591745, -0.2228509, 2.998118, 0, 0.6156863, 1, 1,
0.1634865, 0.4717127, -0.5999267, 0, 0.6117647, 1, 1,
0.165667, -2.246478, 3.355798, 0, 0.6039216, 1, 1,
0.1673766, 0.5489615, 1.68636, 0, 0.5960785, 1, 1,
0.1681502, 0.3766694, 0.5781588, 0, 0.5921569, 1, 1,
0.1685012, 0.2352024, 0.2240458, 0, 0.5843138, 1, 1,
0.1727436, 0.34353, 0.7206805, 0, 0.5803922, 1, 1,
0.175369, 0.8507571, 0.7069532, 0, 0.572549, 1, 1,
0.1764843, -1.546847, 2.349886, 0, 0.5686275, 1, 1,
0.1767025, 1.703479, -1.017719, 0, 0.5607843, 1, 1,
0.1808474, -0.1144387, 1.65098, 0, 0.5568628, 1, 1,
0.1826678, 0.3859507, -0.08120733, 0, 0.5490196, 1, 1,
0.1892647, -1.632499, 1.753063, 0, 0.5450981, 1, 1,
0.1919934, 1.601968, -0.5063887, 0, 0.5372549, 1, 1,
0.1947525, -0.7125938, 2.950654, 0, 0.5333334, 1, 1,
0.1952177, 0.5024666, -0.7520164, 0, 0.5254902, 1, 1,
0.1952576, -0.1737116, 2.752945, 0, 0.5215687, 1, 1,
0.1955695, -0.4599406, 1.662128, 0, 0.5137255, 1, 1,
0.1960413, -1.887684, 0.9272441, 0, 0.509804, 1, 1,
0.1961973, -0.5270776, 3.339488, 0, 0.5019608, 1, 1,
0.1985907, 0.2235444, 0.01627478, 0, 0.4941176, 1, 1,
0.1990229, 0.9074018, 1.377, 0, 0.4901961, 1, 1,
0.2016768, -0.7904427, 3.944679, 0, 0.4823529, 1, 1,
0.2067926, -0.5162683, 3.462649, 0, 0.4784314, 1, 1,
0.2114206, 0.2543649, 0.8313028, 0, 0.4705882, 1, 1,
0.2114294, 1.180749, -1.182931, 0, 0.4666667, 1, 1,
0.2183336, -2.014839, 2.279358, 0, 0.4588235, 1, 1,
0.2249055, 1.660253, 1.662269, 0, 0.454902, 1, 1,
0.2266579, 0.1144949, 0.4099045, 0, 0.4470588, 1, 1,
0.2281591, -0.08204061, 1.141561, 0, 0.4431373, 1, 1,
0.2322646, -1.479003, 4.362267, 0, 0.4352941, 1, 1,
0.233878, -0.4737245, 2.627134, 0, 0.4313726, 1, 1,
0.2342457, -0.7178203, 3.701713, 0, 0.4235294, 1, 1,
0.2344355, -2.467916, 2.336584, 0, 0.4196078, 1, 1,
0.2372752, 0.07544106, 2.042072, 0, 0.4117647, 1, 1,
0.2413816, 0.1870969, 2.214167, 0, 0.4078431, 1, 1,
0.2415798, -0.6805047, 3.114764, 0, 0.4, 1, 1,
0.2425196, 0.7195547, 0.3190515, 0, 0.3921569, 1, 1,
0.2430533, 0.6386063, -0.3444346, 0, 0.3882353, 1, 1,
0.2449878, -0.8223214, 2.34968, 0, 0.3803922, 1, 1,
0.2451966, 2.710894, -0.2130254, 0, 0.3764706, 1, 1,
0.2502632, 0.3018184, 2.220476, 0, 0.3686275, 1, 1,
0.2504403, 0.6915265, 2.556415, 0, 0.3647059, 1, 1,
0.2536773, 0.9935654, -1.600786, 0, 0.3568628, 1, 1,
0.2539786, 0.6303608, -2.191567, 0, 0.3529412, 1, 1,
0.2567, -0.2892953, 2.071395, 0, 0.345098, 1, 1,
0.2599187, -0.7216545, 3.189952, 0, 0.3411765, 1, 1,
0.2611534, 0.1672354, 0.05461315, 0, 0.3333333, 1, 1,
0.2641635, 0.7683922, -0.9515181, 0, 0.3294118, 1, 1,
0.2675112, -0.133379, 2.587001, 0, 0.3215686, 1, 1,
0.2694782, -0.5768604, 3.112653, 0, 0.3176471, 1, 1,
0.2730979, 0.04209086, 1.121702, 0, 0.3098039, 1, 1,
0.273339, -0.06416105, -0.800687, 0, 0.3058824, 1, 1,
0.2761109, 0.5434685, 1.444652, 0, 0.2980392, 1, 1,
0.2769496, 0.6371978, -1.039912, 0, 0.2901961, 1, 1,
0.2809559, -0.7440122, 3.048029, 0, 0.2862745, 1, 1,
0.2821021, -1.338173, 4.482265, 0, 0.2784314, 1, 1,
0.2835355, -0.835238, 2.160206, 0, 0.2745098, 1, 1,
0.2876884, 0.05304611, 0.5672823, 0, 0.2666667, 1, 1,
0.2883866, -0.2802532, 2.61199, 0, 0.2627451, 1, 1,
0.2914529, 2.388948, 0.1764519, 0, 0.254902, 1, 1,
0.296102, -0.9445392, 3.439923, 0, 0.2509804, 1, 1,
0.300271, 1.3503, 0.8408225, 0, 0.2431373, 1, 1,
0.3007938, 1.00201, -0.700883, 0, 0.2392157, 1, 1,
0.3011957, 0.73831, 0.2205357, 0, 0.2313726, 1, 1,
0.3022767, 1.400979, -0.5369191, 0, 0.227451, 1, 1,
0.3041245, 0.2205946, 0.4973793, 0, 0.2196078, 1, 1,
0.3071946, 0.3942811, -0.8722554, 0, 0.2156863, 1, 1,
0.3083572, -1.097162, 1.829903, 0, 0.2078431, 1, 1,
0.3094651, 0.5385073, 0.9893589, 0, 0.2039216, 1, 1,
0.3151504, -0.8938059, 2.650877, 0, 0.1960784, 1, 1,
0.3161647, 0.7704986, 0.4397795, 0, 0.1882353, 1, 1,
0.3174596, -0.007873522, 1.302914, 0, 0.1843137, 1, 1,
0.3190844, 0.3740086, -0.7820321, 0, 0.1764706, 1, 1,
0.3210225, -0.7104673, 1.193863, 0, 0.172549, 1, 1,
0.3216549, -1.030348, 3.17213, 0, 0.1647059, 1, 1,
0.3218579, -0.2276643, 2.693275, 0, 0.1607843, 1, 1,
0.324594, 0.701249, 0.7634419, 0, 0.1529412, 1, 1,
0.3250023, -0.4944059, 4.80041, 0, 0.1490196, 1, 1,
0.3258803, 0.5806944, -0.2579104, 0, 0.1411765, 1, 1,
0.3334801, 0.4292618, 2.419098, 0, 0.1372549, 1, 1,
0.3342481, 0.5211047, 0.6536105, 0, 0.1294118, 1, 1,
0.335422, 0.2590572, 1.970948, 0, 0.1254902, 1, 1,
0.3363017, -0.5705436, 2.610991, 0, 0.1176471, 1, 1,
0.3403665, 1.768295, 0.6065966, 0, 0.1137255, 1, 1,
0.3454373, 0.8765856, -1.088511, 0, 0.1058824, 1, 1,
0.3538513, -0.2670471, 3.171201, 0, 0.09803922, 1, 1,
0.3607422, 0.9814715, 1.009973, 0, 0.09411765, 1, 1,
0.3615094, 0.4988807, -1.379967, 0, 0.08627451, 1, 1,
0.365706, -1.588042, 1.788608, 0, 0.08235294, 1, 1,
0.3671569, -0.003256501, 1.70727, 0, 0.07450981, 1, 1,
0.3723778, -0.1231548, 3.528079, 0, 0.07058824, 1, 1,
0.3724802, 1.204686, 0.2604911, 0, 0.0627451, 1, 1,
0.375193, 0.1937056, 0.7745867, 0, 0.05882353, 1, 1,
0.3768991, 0.5433391, 0.6042582, 0, 0.05098039, 1, 1,
0.3873101, -0.5398463, 0.2500436, 0, 0.04705882, 1, 1,
0.3873968, 0.8223118, 0.3007136, 0, 0.03921569, 1, 1,
0.3911774, -0.5101128, 3.060123, 0, 0.03529412, 1, 1,
0.3930636, 1.586075, 0.2165139, 0, 0.02745098, 1, 1,
0.3936231, 0.3651283, 0.7501802, 0, 0.02352941, 1, 1,
0.3948403, 2.083386, 0.8425254, 0, 0.01568628, 1, 1,
0.3956021, -1.716277, 1.774757, 0, 0.01176471, 1, 1,
0.3964318, -1.213787, 3.27745, 0, 0.003921569, 1, 1,
0.3975046, 1.132422, -0.04012122, 0.003921569, 0, 1, 1,
0.3996223, 1.183432, 2.218833, 0.007843138, 0, 1, 1,
0.406942, -1.664845, 2.686035, 0.01568628, 0, 1, 1,
0.4160922, -0.3773188, 2.908499, 0.01960784, 0, 1, 1,
0.4185922, 1.473858, -1.180798, 0.02745098, 0, 1, 1,
0.4228971, 0.535874, 1.611542, 0.03137255, 0, 1, 1,
0.4255376, -1.398671, 0.08408719, 0.03921569, 0, 1, 1,
0.4255922, 1.322777, 0.8624685, 0.04313726, 0, 1, 1,
0.4268409, 1.558084, -1.200036, 0.05098039, 0, 1, 1,
0.4268987, 0.6474963, -0.2816244, 0.05490196, 0, 1, 1,
0.4286957, 0.06139984, -1.626258, 0.0627451, 0, 1, 1,
0.4289637, -1.07805, 2.107249, 0.06666667, 0, 1, 1,
0.4333326, -0.3695967, 2.72982, 0.07450981, 0, 1, 1,
0.4342299, 0.0375506, 1.697485, 0.07843138, 0, 1, 1,
0.4358176, -1.746514, 2.684398, 0.08627451, 0, 1, 1,
0.4388308, 0.8441783, 0.9718445, 0.09019608, 0, 1, 1,
0.4398232, 0.1365578, 2.032829, 0.09803922, 0, 1, 1,
0.4416091, 1.332269, -0.4779779, 0.1058824, 0, 1, 1,
0.4423851, -0.714274, 3.013859, 0.1098039, 0, 1, 1,
0.4452822, 1.968905, 1.72913, 0.1176471, 0, 1, 1,
0.4538047, -2.480957, 4.040328, 0.1215686, 0, 1, 1,
0.4541519, -1.507394, 4.082575, 0.1294118, 0, 1, 1,
0.4588237, -0.0004262686, 2.688733, 0.1333333, 0, 1, 1,
0.4601946, -0.8310761, 2.86565, 0.1411765, 0, 1, 1,
0.47098, 2.136526, 2.963166, 0.145098, 0, 1, 1,
0.4718128, 0.2116042, 3.365389, 0.1529412, 0, 1, 1,
0.4749252, 0.2487587, 0.978489, 0.1568628, 0, 1, 1,
0.4766114, 1.390646, -0.1345978, 0.1647059, 0, 1, 1,
0.4794766, -0.1345373, 0.9905897, 0.1686275, 0, 1, 1,
0.4811829, -0.02605616, 3.023283, 0.1764706, 0, 1, 1,
0.484148, -0.8035697, 1.715441, 0.1803922, 0, 1, 1,
0.4883195, -1.031766, 3.222364, 0.1882353, 0, 1, 1,
0.4916124, -0.04986325, -0.5714277, 0.1921569, 0, 1, 1,
0.4971778, -0.3990132, 2.049021, 0.2, 0, 1, 1,
0.5010174, 1.387319, 1.222939, 0.2078431, 0, 1, 1,
0.5029595, -0.5892224, 3.917357, 0.2117647, 0, 1, 1,
0.505096, 1.146719, 1.31893, 0.2196078, 0, 1, 1,
0.5096782, -0.9615178, 2.518365, 0.2235294, 0, 1, 1,
0.5177003, -0.5670496, 3.989334, 0.2313726, 0, 1, 1,
0.5196637, -0.1455873, 1.000187, 0.2352941, 0, 1, 1,
0.519674, -0.7095616, 3.861832, 0.2431373, 0, 1, 1,
0.5203162, 0.8517958, -0.9028986, 0.2470588, 0, 1, 1,
0.5246524, -0.7318682, 2.541917, 0.254902, 0, 1, 1,
0.5252111, -0.5844233, 2.084543, 0.2588235, 0, 1, 1,
0.5264751, 0.6092215, 2.132894, 0.2666667, 0, 1, 1,
0.5304646, -0.2090707, 3.512229, 0.2705882, 0, 1, 1,
0.5437483, -0.2474711, 0.7225341, 0.2784314, 0, 1, 1,
0.5457472, -0.02644022, 2.662206, 0.282353, 0, 1, 1,
0.5503244, 0.5132169, 0.419747, 0.2901961, 0, 1, 1,
0.5514494, -0.4383517, 0.5965803, 0.2941177, 0, 1, 1,
0.5535308, -0.9477385, 3.854425, 0.3019608, 0, 1, 1,
0.5591702, 0.3945897, 0.6179919, 0.3098039, 0, 1, 1,
0.5636021, 2.526686, -0.3248886, 0.3137255, 0, 1, 1,
0.5700775, -1.192459, 3.288831, 0.3215686, 0, 1, 1,
0.5732473, -0.2621034, 2.405091, 0.3254902, 0, 1, 1,
0.5756924, -0.6409261, 2.895648, 0.3333333, 0, 1, 1,
0.5793375, -1.244667, 2.704693, 0.3372549, 0, 1, 1,
0.5793731, 1.024677, 1.564283, 0.345098, 0, 1, 1,
0.5861981, 0.3745865, -0.5273779, 0.3490196, 0, 1, 1,
0.586495, -0.5880551, 2.228451, 0.3568628, 0, 1, 1,
0.5893418, -0.06185546, 0.9137957, 0.3607843, 0, 1, 1,
0.5901398, -1.111234, 3.687474, 0.3686275, 0, 1, 1,
0.5907721, -0.08860146, 1.290775, 0.372549, 0, 1, 1,
0.5926811, -0.8101339, 2.887111, 0.3803922, 0, 1, 1,
0.5950587, -2.861747, 3.439885, 0.3843137, 0, 1, 1,
0.5951647, -0.1175925, 2.001214, 0.3921569, 0, 1, 1,
0.5958347, -0.4618545, 1.20655, 0.3960784, 0, 1, 1,
0.6029052, 1.343472, 2.058501, 0.4039216, 0, 1, 1,
0.6044541, -0.2051276, 0.9405653, 0.4117647, 0, 1, 1,
0.606547, 0.9222053, 1.107669, 0.4156863, 0, 1, 1,
0.613492, -1.26298, 3.356361, 0.4235294, 0, 1, 1,
0.6171816, -0.5792921, 1.120935, 0.427451, 0, 1, 1,
0.6251241, -0.7442757, 1.777295, 0.4352941, 0, 1, 1,
0.6265435, -1.249356, 1.91007, 0.4392157, 0, 1, 1,
0.6277171, -1.813583, 2.492046, 0.4470588, 0, 1, 1,
0.6298617, -0.302172, 2.82712, 0.4509804, 0, 1, 1,
0.6361468, 0.2158236, 2.203694, 0.4588235, 0, 1, 1,
0.637935, 1.32891, -0.8057095, 0.4627451, 0, 1, 1,
0.6518212, 1.203216, 0.6233312, 0.4705882, 0, 1, 1,
0.6554599, -0.7229553, 2.727062, 0.4745098, 0, 1, 1,
0.6560995, 0.4348094, 1.733727, 0.4823529, 0, 1, 1,
0.657406, 1.755568, 0.5040649, 0.4862745, 0, 1, 1,
0.6586516, -0.4371069, 2.752456, 0.4941176, 0, 1, 1,
0.6598494, -1.675851, 3.527704, 0.5019608, 0, 1, 1,
0.6663596, -0.6091577, 2.510103, 0.5058824, 0, 1, 1,
0.6672612, -0.02849835, 2.195891, 0.5137255, 0, 1, 1,
0.6698464, -0.4373122, 2.032825, 0.5176471, 0, 1, 1,
0.673839, -0.06596166, 1.793662, 0.5254902, 0, 1, 1,
0.6835995, 1.596177, -0.06182148, 0.5294118, 0, 1, 1,
0.6852079, 0.9460875, 2.00648, 0.5372549, 0, 1, 1,
0.6858853, -0.5218813, 2.363752, 0.5411765, 0, 1, 1,
0.6881591, 0.07359248, 0.666283, 0.5490196, 0, 1, 1,
0.6913813, 0.7581193, 0.5851827, 0.5529412, 0, 1, 1,
0.6928417, 0.04538772, 1.492973, 0.5607843, 0, 1, 1,
0.7004113, 1.70557, 1.317238, 0.5647059, 0, 1, 1,
0.7022655, 1.838446, 1.64758, 0.572549, 0, 1, 1,
0.7049816, 1.737184, 0.696191, 0.5764706, 0, 1, 1,
0.7066293, 1.073951, 1.048142, 0.5843138, 0, 1, 1,
0.7069854, 1.715674, 1.841613, 0.5882353, 0, 1, 1,
0.7085559, -0.8517985, 3.33715, 0.5960785, 0, 1, 1,
0.7108523, -0.7401075, 1.615036, 0.6039216, 0, 1, 1,
0.7127305, 0.2528019, 2.007855, 0.6078432, 0, 1, 1,
0.7166733, 0.6241654, 0.3140655, 0.6156863, 0, 1, 1,
0.7175137, -0.2289789, 1.356124, 0.6196079, 0, 1, 1,
0.7179197, -0.5065097, 2.361485, 0.627451, 0, 1, 1,
0.7217669, -1.351688, 1.996315, 0.6313726, 0, 1, 1,
0.7300514, 0.675005, -0.131164, 0.6392157, 0, 1, 1,
0.7405952, 0.1418951, 2.823084, 0.6431373, 0, 1, 1,
0.7416128, 0.8675846, 0.3148762, 0.6509804, 0, 1, 1,
0.750323, 1.845064, -1.595012, 0.654902, 0, 1, 1,
0.7521129, 0.2811061, 1.917798, 0.6627451, 0, 1, 1,
0.7527799, -2.67213, 3.759784, 0.6666667, 0, 1, 1,
0.7531305, -0.5659744, 1.947875, 0.6745098, 0, 1, 1,
0.7540397, 0.4041268, 1.607145, 0.6784314, 0, 1, 1,
0.7558346, -0.2326974, 1.363966, 0.6862745, 0, 1, 1,
0.7581561, -1.256412, 4.176157, 0.6901961, 0, 1, 1,
0.7710364, 0.1496276, 2.023634, 0.6980392, 0, 1, 1,
0.7785673, 1.480541, 1.041179, 0.7058824, 0, 1, 1,
0.7788296, 0.8521895, 0.4961453, 0.7098039, 0, 1, 1,
0.7853896, 0.362461, 0.3434511, 0.7176471, 0, 1, 1,
0.7857349, -0.05063985, 1.623873, 0.7215686, 0, 1, 1,
0.7976169, -0.0407443, 1.394251, 0.7294118, 0, 1, 1,
0.801072, -2.529634, 4.088064, 0.7333333, 0, 1, 1,
0.8018634, -0.6075202, 2.85821, 0.7411765, 0, 1, 1,
0.8032684, 2.022498, -0.08968429, 0.7450981, 0, 1, 1,
0.8074301, -0.1824843, 0.2465751, 0.7529412, 0, 1, 1,
0.8115665, -1.373866, 3.789928, 0.7568628, 0, 1, 1,
0.8137441, -0.2721002, 3.27716, 0.7647059, 0, 1, 1,
0.8218856, -0.05569293, 1.914358, 0.7686275, 0, 1, 1,
0.8241709, -1.814861, 1.811659, 0.7764706, 0, 1, 1,
0.8245098, -0.1201004, 2.297094, 0.7803922, 0, 1, 1,
0.831286, -0.7769781, 1.601842, 0.7882353, 0, 1, 1,
0.8381074, 1.075527, -0.5823592, 0.7921569, 0, 1, 1,
0.840107, 2.022142, 0.783843, 0.8, 0, 1, 1,
0.8471524, -0.7373018, 1.735527, 0.8078431, 0, 1, 1,
0.8511722, -0.9385447, 2.850662, 0.8117647, 0, 1, 1,
0.8523331, -1.258465, 0.7415884, 0.8196079, 0, 1, 1,
0.8530666, -0.06567988, 3.17407, 0.8235294, 0, 1, 1,
0.8561245, -0.4257964, 0.0894193, 0.8313726, 0, 1, 1,
0.8596966, -0.7956061, 1.967867, 0.8352941, 0, 1, 1,
0.8618734, 1.711367, 2.040029, 0.8431373, 0, 1, 1,
0.8713064, -0.2485091, 1.916333, 0.8470588, 0, 1, 1,
0.8737665, 0.2646531, 1.00925, 0.854902, 0, 1, 1,
0.8763393, 1.144914, 0.5178285, 0.8588235, 0, 1, 1,
0.8769342, 0.6389314, 0.7855493, 0.8666667, 0, 1, 1,
0.879464, 2.118455, 1.849552, 0.8705882, 0, 1, 1,
0.8804591, -0.56882, 2.874736, 0.8784314, 0, 1, 1,
0.8815008, 0.5029331, 0.1845199, 0.8823529, 0, 1, 1,
0.882776, 0.1718695, 1.734721, 0.8901961, 0, 1, 1,
0.8891498, 1.735816, -0.9552929, 0.8941177, 0, 1, 1,
0.8898903, -0.2173947, 2.243307, 0.9019608, 0, 1, 1,
0.8985558, -2.580444, 2.83657, 0.9098039, 0, 1, 1,
0.9024673, -2.221755, 2.575306, 0.9137255, 0, 1, 1,
0.9062518, -1.064066, 1.301226, 0.9215686, 0, 1, 1,
0.9087887, 0.6485687, 0.4238651, 0.9254902, 0, 1, 1,
0.9136243, 0.6870548, 1.582543, 0.9333333, 0, 1, 1,
0.9156993, 0.08352768, 0.3164251, 0.9372549, 0, 1, 1,
0.9241661, 1.005707, -1.378891, 0.945098, 0, 1, 1,
0.9277445, -0.4927906, 2.639056, 0.9490196, 0, 1, 1,
0.9284984, 0.3703908, 1.399385, 0.9568627, 0, 1, 1,
0.9353213, -0.2143378, 3.781233, 0.9607843, 0, 1, 1,
0.9384336, 0.009528974, 2.055135, 0.9686275, 0, 1, 1,
0.9386445, -0.5921403, 2.534939, 0.972549, 0, 1, 1,
0.9394248, -0.006438499, 2.243016, 0.9803922, 0, 1, 1,
0.9419985, -0.5664394, 1.627323, 0.9843137, 0, 1, 1,
0.9426902, -0.1547373, 2.041466, 0.9921569, 0, 1, 1,
0.9476122, 0.8094782, 2.416112, 0.9960784, 0, 1, 1,
0.9518705, -0.297938, 2.034278, 1, 0, 0.9960784, 1,
0.9543817, -0.5076785, 1.610054, 1, 0, 0.9882353, 1,
0.9596193, 0.1688909, 0.7535091, 1, 0, 0.9843137, 1,
0.9648433, -0.05605221, 2.548484, 1, 0, 0.9764706, 1,
0.9649929, 1.182246, 1.481091, 1, 0, 0.972549, 1,
0.9732901, 0.4265318, 1.531915, 1, 0, 0.9647059, 1,
0.9765074, 1.323052, 0.7547653, 1, 0, 0.9607843, 1,
0.9796305, -0.03653068, 2.208955, 1, 0, 0.9529412, 1,
0.9840829, -0.4609528, 3.631303, 1, 0, 0.9490196, 1,
0.9868994, -0.825001, 2.335649, 1, 0, 0.9411765, 1,
0.9927772, -0.9480997, 2.045297, 1, 0, 0.9372549, 1,
0.9936795, -1.257589, 1.645525, 1, 0, 0.9294118, 1,
0.9972891, 0.619283, 0.5159463, 1, 0, 0.9254902, 1,
1.001542, 0.4984996, 2.242216, 1, 0, 0.9176471, 1,
1.007949, -0.1249224, -0.3194466, 1, 0, 0.9137255, 1,
1.014131, -0.6381926, 2.170103, 1, 0, 0.9058824, 1,
1.01909, -1.668171, 2.245338, 1, 0, 0.9019608, 1,
1.021126, -0.1458967, 2.374176, 1, 0, 0.8941177, 1,
1.022781, 0.1571519, 1.606944, 1, 0, 0.8862745, 1,
1.025718, 0.0005066765, 0.6873192, 1, 0, 0.8823529, 1,
1.026571, -0.02627809, 0.1638751, 1, 0, 0.8745098, 1,
1.032687, 0.9638243, 0.06656089, 1, 0, 0.8705882, 1,
1.039289, -0.5307798, 2.355586, 1, 0, 0.8627451, 1,
1.04291, 1.134575, -1.902161, 1, 0, 0.8588235, 1,
1.043672, -0.9537861, 3.79855, 1, 0, 0.8509804, 1,
1.050622, -0.3118878, 2.138417, 1, 0, 0.8470588, 1,
1.051563, -0.6777253, 4.477731, 1, 0, 0.8392157, 1,
1.052783, -1.354659, 2.915002, 1, 0, 0.8352941, 1,
1.053114, 1.101122, -0.1620586, 1, 0, 0.827451, 1,
1.06227, 1.253802, 2.421964, 1, 0, 0.8235294, 1,
1.064304, 0.5294385, 1.066233, 1, 0, 0.8156863, 1,
1.071257, 0.4740822, 1.074676, 1, 0, 0.8117647, 1,
1.072188, -0.5424162, 1.64988, 1, 0, 0.8039216, 1,
1.073609, -0.5049887, 2.07713, 1, 0, 0.7960784, 1,
1.094356, 1.438407, 1.176179, 1, 0, 0.7921569, 1,
1.095146, -0.761502, 2.714809, 1, 0, 0.7843137, 1,
1.096301, -0.8629302, 1.804067, 1, 0, 0.7803922, 1,
1.106014, 1.452024, -0.4842895, 1, 0, 0.772549, 1,
1.109787, 0.3777549, 2.611138, 1, 0, 0.7686275, 1,
1.129223, -0.4053112, 1.884406, 1, 0, 0.7607843, 1,
1.145851, 0.6248479, -0.5477688, 1, 0, 0.7568628, 1,
1.146062, -0.3246523, 0.4985954, 1, 0, 0.7490196, 1,
1.147945, 0.9370567, 0.7586452, 1, 0, 0.7450981, 1,
1.16216, 2.07074, -0.03122101, 1, 0, 0.7372549, 1,
1.164489, -1.975075, 3.182941, 1, 0, 0.7333333, 1,
1.165598, 0.2530083, 2.499452, 1, 0, 0.7254902, 1,
1.18599, 2.021971, 0.2760351, 1, 0, 0.7215686, 1,
1.194076, -0.2090684, 0.8570879, 1, 0, 0.7137255, 1,
1.200132, -0.2944065, 3.754482, 1, 0, 0.7098039, 1,
1.211534, 0.1111306, 2.064849, 1, 0, 0.7019608, 1,
1.212256, -0.4617565, 2.327355, 1, 0, 0.6941177, 1,
1.213535, 1.454998, 2.184882, 1, 0, 0.6901961, 1,
1.21401, 1.63443, -0.896682, 1, 0, 0.682353, 1,
1.222246, -1.018978, 2.214073, 1, 0, 0.6784314, 1,
1.226888, -1.475642, 0.596034, 1, 0, 0.6705883, 1,
1.227288, -2.80912, 4.465867, 1, 0, 0.6666667, 1,
1.229567, -0.2063515, 1.374367, 1, 0, 0.6588235, 1,
1.242582, -0.6250383, 2.478889, 1, 0, 0.654902, 1,
1.254598, -1.214774, 2.744024, 1, 0, 0.6470588, 1,
1.268868, 0.6902041, 1.070836, 1, 0, 0.6431373, 1,
1.283941, -1.26204, 2.067578, 1, 0, 0.6352941, 1,
1.284547, -0.6275938, 2.675327, 1, 0, 0.6313726, 1,
1.294693, -0.6643724, 1.812812, 1, 0, 0.6235294, 1,
1.308182, -2.065558, 1.886537, 1, 0, 0.6196079, 1,
1.313151, 0.1836582, 1.766739, 1, 0, 0.6117647, 1,
1.314602, 0.3051513, 1.374189, 1, 0, 0.6078432, 1,
1.3151, -0.3197791, 1.646513, 1, 0, 0.6, 1,
1.315943, 0.2243306, 1.664966, 1, 0, 0.5921569, 1,
1.316644, 0.4568506, 1.234957, 1, 0, 0.5882353, 1,
1.324594, -0.4760206, 0.8689555, 1, 0, 0.5803922, 1,
1.331505, 0.8120153, 1.326319, 1, 0, 0.5764706, 1,
1.333153, 0.07344215, 1.587146, 1, 0, 0.5686275, 1,
1.335256, -0.5902069, -0.4218084, 1, 0, 0.5647059, 1,
1.341198, 0.7631721, -0.6048847, 1, 0, 0.5568628, 1,
1.345957, -0.1374164, -0.5747234, 1, 0, 0.5529412, 1,
1.351976, -0.9767461, 3.458457, 1, 0, 0.5450981, 1,
1.361333, -1.236937, 1.615405, 1, 0, 0.5411765, 1,
1.364383, -0.4315355, 1.800447, 1, 0, 0.5333334, 1,
1.384061, 0.6813483, -0.1855621, 1, 0, 0.5294118, 1,
1.391479, -0.07466809, 2.669993, 1, 0, 0.5215687, 1,
1.392726, 0.3342403, 0.3873899, 1, 0, 0.5176471, 1,
1.397243, 0.483584, -0.2173466, 1, 0, 0.509804, 1,
1.399675, -1.975457, 2.118203, 1, 0, 0.5058824, 1,
1.413695, 0.5270706, 0.4614734, 1, 0, 0.4980392, 1,
1.415831, 0.8671064, 1.689769, 1, 0, 0.4901961, 1,
1.417162, -0.7938475, 1.364925, 1, 0, 0.4862745, 1,
1.418499, 0.6548943, 1.318217, 1, 0, 0.4784314, 1,
1.424445, -0.2469837, -0.3347304, 1, 0, 0.4745098, 1,
1.425384, -1.035702, 3.209634, 1, 0, 0.4666667, 1,
1.451336, -0.9494487, 2.818058, 1, 0, 0.4627451, 1,
1.451561, 2.591601, 0.4519496, 1, 0, 0.454902, 1,
1.463649, -0.2848015, 1.107036, 1, 0, 0.4509804, 1,
1.464239, -0.4382428, -0.6834173, 1, 0, 0.4431373, 1,
1.480513, 1.212156, 1.402631, 1, 0, 0.4392157, 1,
1.495253, 0.4440591, 0.5769217, 1, 0, 0.4313726, 1,
1.501062, -2.645307, 3.065941, 1, 0, 0.427451, 1,
1.502727, 1.913921, 0.9372756, 1, 0, 0.4196078, 1,
1.512268, 0.6669574, 1.187324, 1, 0, 0.4156863, 1,
1.519237, 0.3574616, 2.179328, 1, 0, 0.4078431, 1,
1.526348, 0.8234537, 2.436913, 1, 0, 0.4039216, 1,
1.535468, -0.5069108, 0.9144374, 1, 0, 0.3960784, 1,
1.562804, -0.5213337, 2.362569, 1, 0, 0.3882353, 1,
1.565139, 0.1994118, 2.289774, 1, 0, 0.3843137, 1,
1.571051, -1.118929, 3.179806, 1, 0, 0.3764706, 1,
1.573538, 0.3769573, 1.512303, 1, 0, 0.372549, 1,
1.583516, 1.137846, 2.130598, 1, 0, 0.3647059, 1,
1.584682, -0.8741063, 0.6597571, 1, 0, 0.3607843, 1,
1.593147, 1.192743, 1.975592, 1, 0, 0.3529412, 1,
1.602324, 0.4210526, 2.049444, 1, 0, 0.3490196, 1,
1.605243, -0.02360849, 0.1212717, 1, 0, 0.3411765, 1,
1.629533, -0.02755027, 1.177362, 1, 0, 0.3372549, 1,
1.661153, 1.166663, 1.805776, 1, 0, 0.3294118, 1,
1.673826, 2.760202, 0.5912209, 1, 0, 0.3254902, 1,
1.678163, -0.1376088, 1.362626, 1, 0, 0.3176471, 1,
1.682158, 0.252221, 1.978139, 1, 0, 0.3137255, 1,
1.730488, -1.284051, 3.78767, 1, 0, 0.3058824, 1,
1.741009, 1.114358, -0.7990219, 1, 0, 0.2980392, 1,
1.761827, 0.990966, 2.746123, 1, 0, 0.2941177, 1,
1.780474, 0.6766887, 0.06285156, 1, 0, 0.2862745, 1,
1.790039, 0.2360621, -0.798009, 1, 0, 0.282353, 1,
1.79081, 2.81815, 1.115231, 1, 0, 0.2745098, 1,
1.791144, 1.323151, 0.02277575, 1, 0, 0.2705882, 1,
1.791581, -0.6975057, 0.914324, 1, 0, 0.2627451, 1,
1.804072, -0.6647233, 1.450317, 1, 0, 0.2588235, 1,
1.841944, -0.5423954, 2.521567, 1, 0, 0.2509804, 1,
1.859338, -0.1514903, 1.299351, 1, 0, 0.2470588, 1,
1.861055, -0.287553, 2.408358, 1, 0, 0.2392157, 1,
1.869489, -0.7202938, 1.647381, 1, 0, 0.2352941, 1,
1.878856, 0.00378225, 1.086013, 1, 0, 0.227451, 1,
1.893413, -0.154142, 0.5776423, 1, 0, 0.2235294, 1,
1.896185, 0.01665475, 2.036406, 1, 0, 0.2156863, 1,
1.904951, 0.3794416, 2.162715, 1, 0, 0.2117647, 1,
1.907881, -1.008776, 1.955076, 1, 0, 0.2039216, 1,
1.91534, 0.5112655, 1.161903, 1, 0, 0.1960784, 1,
1.931403, -0.3704416, 0.3123074, 1, 0, 0.1921569, 1,
1.937707, 1.116382, 1.061733, 1, 0, 0.1843137, 1,
1.960535, 0.4466047, 2.179122, 1, 0, 0.1803922, 1,
1.974259, 1.537799, -0.7748373, 1, 0, 0.172549, 1,
1.980926, -1.590434, 1.698562, 1, 0, 0.1686275, 1,
2.002979, 0.00137354, 1.044142, 1, 0, 0.1607843, 1,
2.023802, 0.7635424, 0.7386139, 1, 0, 0.1568628, 1,
2.045169, 0.4051863, 1.12725, 1, 0, 0.1490196, 1,
2.066457, 3.405475, 0.251658, 1, 0, 0.145098, 1,
2.092814, -0.6929333, 1.651832, 1, 0, 0.1372549, 1,
2.09876, 0.3760897, 0.8754878, 1, 0, 0.1333333, 1,
2.100194, 2.018938, 0.458175, 1, 0, 0.1254902, 1,
2.113359, 1.463844, 0.5496253, 1, 0, 0.1215686, 1,
2.117794, -0.7699404, 2.447648, 1, 0, 0.1137255, 1,
2.131871, -0.8513342, 3.74828, 1, 0, 0.1098039, 1,
2.134815, -1.687539, 0.2707029, 1, 0, 0.1019608, 1,
2.15341, 1.362154, -0.1505796, 1, 0, 0.09411765, 1,
2.159368, -0.2386993, 2.891949, 1, 0, 0.09019608, 1,
2.223319, 0.3417312, 1.305064, 1, 0, 0.08235294, 1,
2.224178, 0.5896785, 0.2615443, 1, 0, 0.07843138, 1,
2.242002, -0.1984827, 2.850513, 1, 0, 0.07058824, 1,
2.312213, 1.973935, -0.4977162, 1, 0, 0.06666667, 1,
2.34242, -1.444199, 2.630313, 1, 0, 0.05882353, 1,
2.409877, 0.5212499, 0.6663619, 1, 0, 0.05490196, 1,
2.4349, 0.5532476, 0.9671849, 1, 0, 0.04705882, 1,
2.449865, 0.3726474, 1.14434, 1, 0, 0.04313726, 1,
2.454028, -0.3897579, 2.111343, 1, 0, 0.03529412, 1,
2.481774, 0.94626, 0.9759882, 1, 0, 0.03137255, 1,
2.590683, 2.111599, 0.808, 1, 0, 0.02352941, 1,
2.645784, -0.1776574, 3.013897, 1, 0, 0.01960784, 1,
2.822143, 1.032396, 1.196976, 1, 0, 0.01176471, 1,
2.846752, 0.4089214, 0.3845417, 1, 0, 0.007843138, 1
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
-0.1089349, -4.047316, -7.44486, 0, -0.5, 0.5, 0.5,
-0.1089349, -4.047316, -7.44486, 1, -0.5, 0.5, 0.5,
-0.1089349, -4.047316, -7.44486, 1, 1.5, 0.5, 0.5,
-0.1089349, -4.047316, -7.44486, 0, 1.5, 0.5, 0.5
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
-4.0666, 0.21916, -7.44486, 0, -0.5, 0.5, 0.5,
-4.0666, 0.21916, -7.44486, 1, -0.5, 0.5, 0.5,
-4.0666, 0.21916, -7.44486, 1, 1.5, 0.5, 0.5,
-4.0666, 0.21916, -7.44486, 0, 1.5, 0.5, 0.5
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
-4.0666, -4.047316, -0.1394899, 0, -0.5, 0.5, 0.5,
-4.0666, -4.047316, -0.1394899, 1, -0.5, 0.5, 0.5,
-4.0666, -4.047316, -0.1394899, 1, 1.5, 0.5, 0.5,
-4.0666, -4.047316, -0.1394899, 0, 1.5, 0.5, 0.5
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
-3, -3.062744, -5.759006,
2, -3.062744, -5.759006,
-3, -3.062744, -5.759006,
-3, -3.22684, -6.039981,
-2, -3.062744, -5.759006,
-2, -3.22684, -6.039981,
-1, -3.062744, -5.759006,
-1, -3.22684, -6.039981,
0, -3.062744, -5.759006,
0, -3.22684, -6.039981,
1, -3.062744, -5.759006,
1, -3.22684, -6.039981,
2, -3.062744, -5.759006,
2, -3.22684, -6.039981
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
-3, -3.55503, -6.601933, 0, -0.5, 0.5, 0.5,
-3, -3.55503, -6.601933, 1, -0.5, 0.5, 0.5,
-3, -3.55503, -6.601933, 1, 1.5, 0.5, 0.5,
-3, -3.55503, -6.601933, 0, 1.5, 0.5, 0.5,
-2, -3.55503, -6.601933, 0, -0.5, 0.5, 0.5,
-2, -3.55503, -6.601933, 1, -0.5, 0.5, 0.5,
-2, -3.55503, -6.601933, 1, 1.5, 0.5, 0.5,
-2, -3.55503, -6.601933, 0, 1.5, 0.5, 0.5,
-1, -3.55503, -6.601933, 0, -0.5, 0.5, 0.5,
-1, -3.55503, -6.601933, 1, -0.5, 0.5, 0.5,
-1, -3.55503, -6.601933, 1, 1.5, 0.5, 0.5,
-1, -3.55503, -6.601933, 0, 1.5, 0.5, 0.5,
0, -3.55503, -6.601933, 0, -0.5, 0.5, 0.5,
0, -3.55503, -6.601933, 1, -0.5, 0.5, 0.5,
0, -3.55503, -6.601933, 1, 1.5, 0.5, 0.5,
0, -3.55503, -6.601933, 0, 1.5, 0.5, 0.5,
1, -3.55503, -6.601933, 0, -0.5, 0.5, 0.5,
1, -3.55503, -6.601933, 1, -0.5, 0.5, 0.5,
1, -3.55503, -6.601933, 1, 1.5, 0.5, 0.5,
1, -3.55503, -6.601933, 0, 1.5, 0.5, 0.5,
2, -3.55503, -6.601933, 0, -0.5, 0.5, 0.5,
2, -3.55503, -6.601933, 1, -0.5, 0.5, 0.5,
2, -3.55503, -6.601933, 1, 1.5, 0.5, 0.5,
2, -3.55503, -6.601933, 0, 1.5, 0.5, 0.5
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
-3.153293, -2, -5.759006,
-3.153293, 3, -5.759006,
-3.153293, -2, -5.759006,
-3.305511, -2, -6.039981,
-3.153293, -1, -5.759006,
-3.305511, -1, -6.039981,
-3.153293, 0, -5.759006,
-3.305511, 0, -6.039981,
-3.153293, 1, -5.759006,
-3.305511, 1, -6.039981,
-3.153293, 2, -5.759006,
-3.305511, 2, -6.039981,
-3.153293, 3, -5.759006,
-3.305511, 3, -6.039981
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
-3.609946, -2, -6.601933, 0, -0.5, 0.5, 0.5,
-3.609946, -2, -6.601933, 1, -0.5, 0.5, 0.5,
-3.609946, -2, -6.601933, 1, 1.5, 0.5, 0.5,
-3.609946, -2, -6.601933, 0, 1.5, 0.5, 0.5,
-3.609946, -1, -6.601933, 0, -0.5, 0.5, 0.5,
-3.609946, -1, -6.601933, 1, -0.5, 0.5, 0.5,
-3.609946, -1, -6.601933, 1, 1.5, 0.5, 0.5,
-3.609946, -1, -6.601933, 0, 1.5, 0.5, 0.5,
-3.609946, 0, -6.601933, 0, -0.5, 0.5, 0.5,
-3.609946, 0, -6.601933, 1, -0.5, 0.5, 0.5,
-3.609946, 0, -6.601933, 1, 1.5, 0.5, 0.5,
-3.609946, 0, -6.601933, 0, 1.5, 0.5, 0.5,
-3.609946, 1, -6.601933, 0, -0.5, 0.5, 0.5,
-3.609946, 1, -6.601933, 1, -0.5, 0.5, 0.5,
-3.609946, 1, -6.601933, 1, 1.5, 0.5, 0.5,
-3.609946, 1, -6.601933, 0, 1.5, 0.5, 0.5,
-3.609946, 2, -6.601933, 0, -0.5, 0.5, 0.5,
-3.609946, 2, -6.601933, 1, -0.5, 0.5, 0.5,
-3.609946, 2, -6.601933, 1, 1.5, 0.5, 0.5,
-3.609946, 2, -6.601933, 0, 1.5, 0.5, 0.5,
-3.609946, 3, -6.601933, 0, -0.5, 0.5, 0.5,
-3.609946, 3, -6.601933, 1, -0.5, 0.5, 0.5,
-3.609946, 3, -6.601933, 1, 1.5, 0.5, 0.5,
-3.609946, 3, -6.601933, 0, 1.5, 0.5, 0.5
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
-3.153293, -3.062744, -4,
-3.153293, -3.062744, 4,
-3.153293, -3.062744, -4,
-3.305511, -3.22684, -4,
-3.153293, -3.062744, -2,
-3.305511, -3.22684, -2,
-3.153293, -3.062744, 0,
-3.305511, -3.22684, 0,
-3.153293, -3.062744, 2,
-3.305511, -3.22684, 2,
-3.153293, -3.062744, 4,
-3.305511, -3.22684, 4
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
-3.609946, -3.55503, -4, 0, -0.5, 0.5, 0.5,
-3.609946, -3.55503, -4, 1, -0.5, 0.5, 0.5,
-3.609946, -3.55503, -4, 1, 1.5, 0.5, 0.5,
-3.609946, -3.55503, -4, 0, 1.5, 0.5, 0.5,
-3.609946, -3.55503, -2, 0, -0.5, 0.5, 0.5,
-3.609946, -3.55503, -2, 1, -0.5, 0.5, 0.5,
-3.609946, -3.55503, -2, 1, 1.5, 0.5, 0.5,
-3.609946, -3.55503, -2, 0, 1.5, 0.5, 0.5,
-3.609946, -3.55503, 0, 0, -0.5, 0.5, 0.5,
-3.609946, -3.55503, 0, 1, -0.5, 0.5, 0.5,
-3.609946, -3.55503, 0, 1, 1.5, 0.5, 0.5,
-3.609946, -3.55503, 0, 0, 1.5, 0.5, 0.5,
-3.609946, -3.55503, 2, 0, -0.5, 0.5, 0.5,
-3.609946, -3.55503, 2, 1, -0.5, 0.5, 0.5,
-3.609946, -3.55503, 2, 1, 1.5, 0.5, 0.5,
-3.609946, -3.55503, 2, 0, 1.5, 0.5, 0.5,
-3.609946, -3.55503, 4, 0, -0.5, 0.5, 0.5,
-3.609946, -3.55503, 4, 1, -0.5, 0.5, 0.5,
-3.609946, -3.55503, 4, 1, 1.5, 0.5, 0.5,
-3.609946, -3.55503, 4, 0, 1.5, 0.5, 0.5
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
-3.153293, -3.062744, -5.759006,
-3.153293, 3.501064, -5.759006,
-3.153293, -3.062744, 5.480026,
-3.153293, 3.501064, 5.480026,
-3.153293, -3.062744, -5.759006,
-3.153293, -3.062744, 5.480026,
-3.153293, 3.501064, -5.759006,
-3.153293, 3.501064, 5.480026,
-3.153293, -3.062744, -5.759006,
2.935423, -3.062744, -5.759006,
-3.153293, -3.062744, 5.480026,
2.935423, -3.062744, 5.480026,
-3.153293, 3.501064, -5.759006,
2.935423, 3.501064, -5.759006,
-3.153293, 3.501064, 5.480026,
2.935423, 3.501064, 5.480026,
2.935423, -3.062744, -5.759006,
2.935423, 3.501064, -5.759006,
2.935423, -3.062744, 5.480026,
2.935423, 3.501064, 5.480026,
2.935423, -3.062744, -5.759006,
2.935423, -3.062744, 5.480026,
2.935423, 3.501064, -5.759006,
2.935423, 3.501064, 5.480026
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
var radius = 7.672836;
var distance = 34.13731;
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
mvMatrix.translate( 0.1089349, -0.21916, 0.1394899 );
mvMatrix.scale( 1.362524, 1.263903, 0.7381437 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13731);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Uniroyal<-read.table("Uniroyal.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Uniroyal$V2
```

```
## Error in eval(expr, envir, enclos): object 'Uniroyal' not found
```

```r
y<-Uniroyal$V3
```

```
## Error in eval(expr, envir, enclos): object 'Uniroyal' not found
```

```r
z<-Uniroyal$V4
```

```
## Error in eval(expr, envir, enclos): object 'Uniroyal' not found
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
-3.064622, 1.17214, -0.9755587, 0, 0, 1, 1, 1,
-2.945688, -1.014293, -1.347357, 1, 0, 0, 1, 1,
-2.927693, -0.1544406, -2.858202, 1, 0, 0, 1, 1,
-2.842261, -0.3352407, -1.47022, 1, 0, 0, 1, 1,
-2.831547, 0.2801971, -0.8439021, 1, 0, 0, 1, 1,
-2.823465, -0.4542106, -3.901664, 1, 0, 0, 1, 1,
-2.736475, 1.960167, -0.6530743, 0, 0, 0, 1, 1,
-2.693913, -1.622434, -3.312671, 0, 0, 0, 1, 1,
-2.688149, -0.9445041, -2.3782, 0, 0, 0, 1, 1,
-2.523943, -0.6550953, -2.18832, 0, 0, 0, 1, 1,
-2.353972, 0.9245784, -2.51374, 0, 0, 0, 1, 1,
-2.349363, 0.07027954, -2.933932, 0, 0, 0, 1, 1,
-2.348142, -0.174702, -1.481103, 0, 0, 0, 1, 1,
-2.337937, 0.7695992, -0.4504296, 1, 1, 1, 1, 1,
-2.286698, -0.3877619, -1.30981, 1, 1, 1, 1, 1,
-2.260906, 1.572542, -1.205397, 1, 1, 1, 1, 1,
-2.230791, -0.8874993, -1.598407, 1, 1, 1, 1, 1,
-2.163286, 0.1901159, -1.871827, 1, 1, 1, 1, 1,
-2.142828, -0.7135087, -1.264228, 1, 1, 1, 1, 1,
-2.133009, -0.3458781, -1.243872, 1, 1, 1, 1, 1,
-2.12036, -0.9691825, -1.487395, 1, 1, 1, 1, 1,
-2.079266, 0.3206644, -1.072053, 1, 1, 1, 1, 1,
-2.055301, 0.1903574, 0.1742778, 1, 1, 1, 1, 1,
-2.014536, 0.7167652, -2.010841, 1, 1, 1, 1, 1,
-1.990856, -0.3921174, -0.4270792, 1, 1, 1, 1, 1,
-1.982245, -0.4059544, -1.399597, 1, 1, 1, 1, 1,
-1.963146, -1.388722, -1.868083, 1, 1, 1, 1, 1,
-1.960395, 0.4221672, -2.772965, 1, 1, 1, 1, 1,
-1.955569, -0.6641571, -0.9780617, 0, 0, 1, 1, 1,
-1.955154, -0.368176, -0.6274151, 1, 0, 0, 1, 1,
-1.914626, 1.156905, -0.6332884, 1, 0, 0, 1, 1,
-1.911437, -1.524867, -4.882811, 1, 0, 0, 1, 1,
-1.898071, 0.153403, -1.531981, 1, 0, 0, 1, 1,
-1.891564, 0.4433436, -1.481663, 1, 0, 0, 1, 1,
-1.864346, 1.346454, -2.278604, 0, 0, 0, 1, 1,
-1.828569, 1.546662, 0.7397974, 0, 0, 0, 1, 1,
-1.823231, 0.4492452, -0.8630759, 0, 0, 0, 1, 1,
-1.812201, -0.217848, -1.765436, 0, 0, 0, 1, 1,
-1.804146, -0.4826393, -1.198336, 0, 0, 0, 1, 1,
-1.800377, 0.4224509, -1.661318, 0, 0, 0, 1, 1,
-1.791004, -0.9060408, -2.09706, 0, 0, 0, 1, 1,
-1.776859, -1.369594, -2.087727, 1, 1, 1, 1, 1,
-1.774901, -0.1295973, -2.061765, 1, 1, 1, 1, 1,
-1.760642, 1.973035, -0.1275298, 1, 1, 1, 1, 1,
-1.699849, -0.7317486, -2.643824, 1, 1, 1, 1, 1,
-1.695337, -0.6586195, 0.2634512, 1, 1, 1, 1, 1,
-1.687333, 0.5518487, -2.123481, 1, 1, 1, 1, 1,
-1.68293, -0.3093767, -1.561441, 1, 1, 1, 1, 1,
-1.637643, -0.5756127, 0.1226433, 1, 1, 1, 1, 1,
-1.636841, 0.2253871, -1.214473, 1, 1, 1, 1, 1,
-1.633189, -0.5920087, -0.3595081, 1, 1, 1, 1, 1,
-1.631322, 1.91559, -0.4620659, 1, 1, 1, 1, 1,
-1.629994, 0.01593929, -3.35489, 1, 1, 1, 1, 1,
-1.620899, -0.4740053, -1.288582, 1, 1, 1, 1, 1,
-1.592055, 1.20446, -0.5754117, 1, 1, 1, 1, 1,
-1.588236, 0.1232126, -1.479487, 1, 1, 1, 1, 1,
-1.587601, -0.6376583, -0.5405667, 0, 0, 1, 1, 1,
-1.587318, -0.489061, -1.792743, 1, 0, 0, 1, 1,
-1.571292, 0.4903511, -0.87344, 1, 0, 0, 1, 1,
-1.567435, 0.2865325, -1.344545, 1, 0, 0, 1, 1,
-1.566299, 1.512535, 0.09293111, 1, 0, 0, 1, 1,
-1.564462, 0.6543325, -1.135808, 1, 0, 0, 1, 1,
-1.562359, -2.191608, -2.77272, 0, 0, 0, 1, 1,
-1.55722, 0.02731294, -1.330985, 0, 0, 0, 1, 1,
-1.542302, -0.3031991, -2.008336, 0, 0, 0, 1, 1,
-1.538025, 1.557325, -1.528481, 0, 0, 0, 1, 1,
-1.531631, 0.8966292, -0.7024901, 0, 0, 0, 1, 1,
-1.506281, -1.382255, -3.017954, 0, 0, 0, 1, 1,
-1.503934, -0.2122479, -1.019096, 0, 0, 0, 1, 1,
-1.503601, 0.1574056, -0.1825273, 1, 1, 1, 1, 1,
-1.488783, 0.8291563, -1.011561, 1, 1, 1, 1, 1,
-1.480015, -0.5916906, -1.381392, 1, 1, 1, 1, 1,
-1.475805, 2.005712, -0.08285406, 1, 1, 1, 1, 1,
-1.47282, 1.011808, -1.382569, 1, 1, 1, 1, 1,
-1.464342, 0.1847148, -1.437353, 1, 1, 1, 1, 1,
-1.452581, -2.662927, -2.149557, 1, 1, 1, 1, 1,
-1.45062, 0.3931221, 0.03445985, 1, 1, 1, 1, 1,
-1.449959, -1.192108, -0.7522071, 1, 1, 1, 1, 1,
-1.442255, -2.643274, -2.489618, 1, 1, 1, 1, 1,
-1.438828, -1.043625, -0.6634076, 1, 1, 1, 1, 1,
-1.428018, 0.3781454, -2.020156, 1, 1, 1, 1, 1,
-1.415597, 0.07445775, -1.422844, 1, 1, 1, 1, 1,
-1.410143, 0.6227436, 0.09317209, 1, 1, 1, 1, 1,
-1.408337, -0.6229756, -2.321824, 1, 1, 1, 1, 1,
-1.40492, -1.524917, -2.096087, 0, 0, 1, 1, 1,
-1.403264, 1.710861, -0.4036185, 1, 0, 0, 1, 1,
-1.3992, 1.346237, 1.186391, 1, 0, 0, 1, 1,
-1.396941, -1.632323, -2.760546, 1, 0, 0, 1, 1,
-1.392035, 3.254691, 0.3875898, 1, 0, 0, 1, 1,
-1.391886, 0.3672601, -2.800242, 1, 0, 0, 1, 1,
-1.382383, 0.9404677, -1.221072, 0, 0, 0, 1, 1,
-1.369887, -0.4871748, -2.503359, 0, 0, 0, 1, 1,
-1.366941, -0.864431, -2.624127, 0, 0, 0, 1, 1,
-1.366344, -0.6495355, -2.123752, 0, 0, 0, 1, 1,
-1.349987, 0.1828522, -2.869269, 0, 0, 0, 1, 1,
-1.349928, -0.484941, -1.531808, 0, 0, 0, 1, 1,
-1.345526, -0.1726316, -1.84214, 0, 0, 0, 1, 1,
-1.344306, -0.05234712, -1.039384, 1, 1, 1, 1, 1,
-1.331789, -2.392944, -1.413538, 1, 1, 1, 1, 1,
-1.33124, 0.6307312, -1.684016, 1, 1, 1, 1, 1,
-1.328826, 0.9482151, -1.506649, 1, 1, 1, 1, 1,
-1.317595, 0.1877858, -1.623194, 1, 1, 1, 1, 1,
-1.312758, -1.139854, -2.495291, 1, 1, 1, 1, 1,
-1.311976, -0.3304538, -1.937321, 1, 1, 1, 1, 1,
-1.30595, 0.6935909, 0.4939248, 1, 1, 1, 1, 1,
-1.301255, -0.1944526, -1.590519, 1, 1, 1, 1, 1,
-1.297442, 0.7204841, 0.8704004, 1, 1, 1, 1, 1,
-1.292605, 0.2698005, -1.541114, 1, 1, 1, 1, 1,
-1.285063, 0.6925704, -0.7832097, 1, 1, 1, 1, 1,
-1.268683, 0.8862439, -1.860904, 1, 1, 1, 1, 1,
-1.26457, -0.5520543, -2.067179, 1, 1, 1, 1, 1,
-1.262477, -0.1451539, -0.4032966, 1, 1, 1, 1, 1,
-1.260131, -0.5595, -0.3700432, 0, 0, 1, 1, 1,
-1.257438, -1.4181, -1.482545, 1, 0, 0, 1, 1,
-1.25457, 1.459422, -1.798775, 1, 0, 0, 1, 1,
-1.253552, -0.4235422, -1.033313, 1, 0, 0, 1, 1,
-1.236873, 0.202547, -1.928939, 1, 0, 0, 1, 1,
-1.233841, 1.660076, -1.178628, 1, 0, 0, 1, 1,
-1.230066, -0.7640375, -3.078194, 0, 0, 0, 1, 1,
-1.22851, -0.1158968, -2.230608, 0, 0, 0, 1, 1,
-1.218394, -1.603453, -2.734868, 0, 0, 0, 1, 1,
-1.217804, 0.4115129, -2.132214, 0, 0, 0, 1, 1,
-1.213456, -0.9752643, -2.016282, 0, 0, 0, 1, 1,
-1.213287, -0.06456997, -1.84163, 0, 0, 0, 1, 1,
-1.197718, -0.5654983, -1.697875, 0, 0, 0, 1, 1,
-1.19591, 0.2278325, -1.052845, 1, 1, 1, 1, 1,
-1.195333, -0.4249592, -1.754514, 1, 1, 1, 1, 1,
-1.194055, -0.01504609, 0.6173163, 1, 1, 1, 1, 1,
-1.188333, -0.6543744, -2.643068, 1, 1, 1, 1, 1,
-1.187818, -2.575292, -2.122183, 1, 1, 1, 1, 1,
-1.182572, -2.050103, -1.766731, 1, 1, 1, 1, 1,
-1.175944, -0.4020948, -1.226928, 1, 1, 1, 1, 1,
-1.174078, 1.061391, -2.690437, 1, 1, 1, 1, 1,
-1.173249, -2.17901, -2.57213, 1, 1, 1, 1, 1,
-1.167907, -2.967155, -1.073278, 1, 1, 1, 1, 1,
-1.163832, 0.5130352, 0.02761903, 1, 1, 1, 1, 1,
-1.139535, 0.5326791, -2.054676, 1, 1, 1, 1, 1,
-1.133933, 1.006729, -0.8071109, 1, 1, 1, 1, 1,
-1.133074, 0.0227698, 0.09043367, 1, 1, 1, 1, 1,
-1.125469, -0.0984595, -0.8362024, 1, 1, 1, 1, 1,
-1.11937, -0.3461552, -0.1903361, 0, 0, 1, 1, 1,
-1.117377, 1.395471, -0.957489, 1, 0, 0, 1, 1,
-1.112673, -0.9561648, -4.287298, 1, 0, 0, 1, 1,
-1.108184, 1.584056, -0.964891, 1, 0, 0, 1, 1,
-1.104731, 0.009569288, -1.407334, 1, 0, 0, 1, 1,
-1.103809, -1.199939, -0.8296039, 1, 0, 0, 1, 1,
-1.097, 0.9512891, -1.919376, 0, 0, 0, 1, 1,
-1.092421, 1.011616, -0.4420797, 0, 0, 0, 1, 1,
-1.092114, 0.3757723, -0.9144778, 0, 0, 0, 1, 1,
-1.087695, 0.8736324, -2.22644, 0, 0, 0, 1, 1,
-1.086182, -0.3581584, -1.461575, 0, 0, 0, 1, 1,
-1.082573, -1.677526, -3.479105, 0, 0, 0, 1, 1,
-1.082138, -1.534652, -2.189688, 0, 0, 0, 1, 1,
-1.076279, 1.256077, -1.172621, 1, 1, 1, 1, 1,
-1.074985, -1.715895, -1.555443, 1, 1, 1, 1, 1,
-1.070462, 1.395381, -0.1891256, 1, 1, 1, 1, 1,
-1.065887, -0.2496393, -2.432517, 1, 1, 1, 1, 1,
-1.064691, 0.1646562, -0.6590448, 1, 1, 1, 1, 1,
-1.062788, 0.184334, -2.483209, 1, 1, 1, 1, 1,
-1.060808, -0.4212574, -1.256323, 1, 1, 1, 1, 1,
-1.055074, -0.8090187, -2.973907, 1, 1, 1, 1, 1,
-1.046617, 1.859399, -0.4911446, 1, 1, 1, 1, 1,
-1.045843, 0.5884088, -1.473241, 1, 1, 1, 1, 1,
-1.044349, 1.305122, -2.201894, 1, 1, 1, 1, 1,
-1.042553, -0.7725241, -2.234973, 1, 1, 1, 1, 1,
-1.034702, -0.2182818, -2.448255, 1, 1, 1, 1, 1,
-1.034589, -0.8677127, -2.959565, 1, 1, 1, 1, 1,
-1.031982, 0.165591, 0.09833757, 1, 1, 1, 1, 1,
-1.029772, 1.232609, 0.4588797, 0, 0, 1, 1, 1,
-1.028384, 0.9768507, 0.1299456, 1, 0, 0, 1, 1,
-1.023943, -0.9270523, -4.266861, 1, 0, 0, 1, 1,
-1.020525, -0.8582084, -1.218514, 1, 0, 0, 1, 1,
-1.016263, 0.6006171, -1.074046, 1, 0, 0, 1, 1,
-1.015799, -0.8434083, -2.821216, 1, 0, 0, 1, 1,
-1.015212, 0.2247948, -2.571659, 0, 0, 0, 1, 1,
-1.002298, -1.103639, -1.484171, 0, 0, 0, 1, 1,
-0.9957908, -0.05650292, -2.142264, 0, 0, 0, 1, 1,
-0.992109, -1.29376, -2.957639, 0, 0, 0, 1, 1,
-0.9914997, -0.607994, -3.036839, 0, 0, 0, 1, 1,
-0.991034, 1.047616, -2.461185, 0, 0, 0, 1, 1,
-0.987804, -0.3618142, -3.490453, 0, 0, 0, 1, 1,
-0.9860918, 1.505496, -0.7858644, 1, 1, 1, 1, 1,
-0.9848107, -0.3262552, -2.081018, 1, 1, 1, 1, 1,
-0.9778245, -0.009085902, -1.976773, 1, 1, 1, 1, 1,
-0.9777241, 1.357033, 0.07612941, 1, 1, 1, 1, 1,
-0.9736697, 0.07862111, -0.3766282, 1, 1, 1, 1, 1,
-0.9698482, 1.117998, -1.826933, 1, 1, 1, 1, 1,
-0.9661781, -0.7082978, -2.673087, 1, 1, 1, 1, 1,
-0.9637535, -0.5948172, -1.509101, 1, 1, 1, 1, 1,
-0.9635018, -0.8031447, -3.364519, 1, 1, 1, 1, 1,
-0.9590635, 1.039255, -0.3561764, 1, 1, 1, 1, 1,
-0.9586619, 1.54063, -0.4760923, 1, 1, 1, 1, 1,
-0.9583567, 1.281114, -0.9915282, 1, 1, 1, 1, 1,
-0.9558977, 1.82812, -2.398109, 1, 1, 1, 1, 1,
-0.950348, 1.326011, -0.2376582, 1, 1, 1, 1, 1,
-0.9460547, -0.8082486, -3.823659, 1, 1, 1, 1, 1,
-0.9456177, -0.47441, -1.417803, 0, 0, 1, 1, 1,
-0.9442931, -1.20654, -3.101896, 1, 0, 0, 1, 1,
-0.9441938, 0.9448131, 0.3650674, 1, 0, 0, 1, 1,
-0.9378215, 1.940915, 0.5235444, 1, 0, 0, 1, 1,
-0.9344598, 0.2112389, -2.575336, 1, 0, 0, 1, 1,
-0.931318, -0.3861891, 0.7918277, 1, 0, 0, 1, 1,
-0.9291468, -0.329269, -2.404855, 0, 0, 0, 1, 1,
-0.9271984, 0.833786, -0.09603462, 0, 0, 0, 1, 1,
-0.921956, 1.089015, 0.3266154, 0, 0, 0, 1, 1,
-0.916622, -1.196129, -1.290825, 0, 0, 0, 1, 1,
-0.9132681, -0.9367356, -3.044325, 0, 0, 0, 1, 1,
-0.9092415, 0.5808094, -0.7597739, 0, 0, 0, 1, 1,
-0.9060384, 0.4943503, -0.8078272, 0, 0, 0, 1, 1,
-0.9019086, -0.4478113, -2.038768, 1, 1, 1, 1, 1,
-0.8981638, -0.3660896, -2.38078, 1, 1, 1, 1, 1,
-0.8973757, 0.6073118, -1.350789, 1, 1, 1, 1, 1,
-0.8969646, -0.7250249, -1.720853, 1, 1, 1, 1, 1,
-0.8957895, 1.981099, 0.2680002, 1, 1, 1, 1, 1,
-0.8918794, 1.71692, -0.8094296, 1, 1, 1, 1, 1,
-0.8913407, 0.008942069, -1.910735, 1, 1, 1, 1, 1,
-0.8845121, 0.522374, -2.855778, 1, 1, 1, 1, 1,
-0.8834941, -0.5918599, -1.286877, 1, 1, 1, 1, 1,
-0.8804783, 0.5150815, -1.950946, 1, 1, 1, 1, 1,
-0.8742576, -0.4473153, -4.067218, 1, 1, 1, 1, 1,
-0.8706917, -0.6050328, -2.247418, 1, 1, 1, 1, 1,
-0.8703189, 0.5141904, 0.3079199, 1, 1, 1, 1, 1,
-0.8556342, 2.472687, 0.7900171, 1, 1, 1, 1, 1,
-0.8544642, 1.264897, -0.6077511, 1, 1, 1, 1, 1,
-0.8444936, -2.541468, -2.214441, 0, 0, 1, 1, 1,
-0.8417135, 0.8818772, -1.916456, 1, 0, 0, 1, 1,
-0.8386536, -0.8277879, -0.7021109, 1, 0, 0, 1, 1,
-0.8357213, -0.2233014, -3.129299, 1, 0, 0, 1, 1,
-0.8283505, 0.8282724, -1.344674, 1, 0, 0, 1, 1,
-0.8220837, 1.730548, -1.966313, 1, 0, 0, 1, 1,
-0.8197294, -1.533966, -2.734596, 0, 0, 0, 1, 1,
-0.8102818, -1.24489, -1.955358, 0, 0, 0, 1, 1,
-0.8062996, -0.4238128, -1.160128, 0, 0, 0, 1, 1,
-0.8050881, 0.6977987, -0.7085341, 0, 0, 0, 1, 1,
-0.7981294, 0.9448924, -0.5616643, 0, 0, 0, 1, 1,
-0.7920165, -1.974045, -1.723524, 0, 0, 0, 1, 1,
-0.7893257, 0.9605718, -0.3747945, 0, 0, 0, 1, 1,
-0.7871518, -0.8294566, -2.95697, 1, 1, 1, 1, 1,
-0.7855742, 1.064287, 0.03020261, 1, 1, 1, 1, 1,
-0.7847513, 1.055874, -1.483656, 1, 1, 1, 1, 1,
-0.7770352, 0.2895725, -1.848279, 1, 1, 1, 1, 1,
-0.76378, 1.382724, -0.6724069, 1, 1, 1, 1, 1,
-0.7634709, 1.612695, -0.09964971, 1, 1, 1, 1, 1,
-0.7631954, 0.2839137, -0.2580192, 1, 1, 1, 1, 1,
-0.7617024, -0.837086, -3.743616, 1, 1, 1, 1, 1,
-0.7604633, 1.328746, 0.260638, 1, 1, 1, 1, 1,
-0.753736, 0.4092088, -0.695805, 1, 1, 1, 1, 1,
-0.7463731, -1.146871, -3.849311, 1, 1, 1, 1, 1,
-0.7433916, 1.206674, -0.3012083, 1, 1, 1, 1, 1,
-0.7417642, -1.934713, -2.693339, 1, 1, 1, 1, 1,
-0.732947, 0.1529405, -0.6234457, 1, 1, 1, 1, 1,
-0.7297999, 1.43407, 0.1227274, 1, 1, 1, 1, 1,
-0.7291023, 1.186374, 0.811049, 0, 0, 1, 1, 1,
-0.7268279, -1.355479, -1.975463, 1, 0, 0, 1, 1,
-0.7262299, 0.01646316, -0.46561, 1, 0, 0, 1, 1,
-0.7189191, 1.729357, -0.8820688, 1, 0, 0, 1, 1,
-0.7179467, -1.212496, -3.392779, 1, 0, 0, 1, 1,
-0.7179409, 0.1196912, -2.071781, 1, 0, 0, 1, 1,
-0.7147967, -1.513392, -4.178938, 0, 0, 0, 1, 1,
-0.7116091, -1.165963, -4.918381, 0, 0, 0, 1, 1,
-0.7098992, -0.5126551, -3.34443, 0, 0, 0, 1, 1,
-0.707064, -0.1610729, -1.750553, 0, 0, 0, 1, 1,
-0.7057205, 0.1822968, -1.95866, 0, 0, 0, 1, 1,
-0.6950975, -0.6806344, -2.504578, 0, 0, 0, 1, 1,
-0.6904678, 0.2892029, -1.555634, 0, 0, 0, 1, 1,
-0.68103, 0.3015116, -1.855914, 1, 1, 1, 1, 1,
-0.6798332, 0.4570262, -0.3771001, 1, 1, 1, 1, 1,
-0.6714522, -1.02376, -2.232656, 1, 1, 1, 1, 1,
-0.6710666, 1.580748, 1.854821, 1, 1, 1, 1, 1,
-0.6674907, -0.7810352, -0.2162997, 1, 1, 1, 1, 1,
-0.6648168, -0.09491415, -2.047437, 1, 1, 1, 1, 1,
-0.6619104, 0.338227, -2.301676, 1, 1, 1, 1, 1,
-0.6604201, -1.257534, -2.799138, 1, 1, 1, 1, 1,
-0.6593554, 0.8566797, -1.075824, 1, 1, 1, 1, 1,
-0.6588925, 0.3379877, -1.90503, 1, 1, 1, 1, 1,
-0.6559683, -0.09206232, -2.806086, 1, 1, 1, 1, 1,
-0.649165, 1.834949, -0.5825832, 1, 1, 1, 1, 1,
-0.6471555, 0.069505, -2.288211, 1, 1, 1, 1, 1,
-0.6436116, 1.18439, 0.2589138, 1, 1, 1, 1, 1,
-0.6393526, -0.07502938, -3.377613, 1, 1, 1, 1, 1,
-0.6365832, -0.8319182, -1.814273, 0, 0, 1, 1, 1,
-0.6358358, 0.3301062, -2.415852, 1, 0, 0, 1, 1,
-0.6306286, 0.3043019, -2.944669, 1, 0, 0, 1, 1,
-0.6227477, -1.842261, -4.335252, 1, 0, 0, 1, 1,
-0.6216187, 0.8903123, 0.02586496, 1, 0, 0, 1, 1,
-0.6201122, 0.2756732, -1.070146, 1, 0, 0, 1, 1,
-0.6192689, 0.8838991, -0.1465381, 0, 0, 0, 1, 1,
-0.6111865, -1.759148, -2.063257, 0, 0, 0, 1, 1,
-0.6102995, 0.2727738, 0.7728236, 0, 0, 0, 1, 1,
-0.6066037, -0.9477206, -1.096555, 0, 0, 0, 1, 1,
-0.6045486, -1.141065, -1.443855, 0, 0, 0, 1, 1,
-0.6039217, -1.606096, -1.093056, 0, 0, 0, 1, 1,
-0.6033899, -0.4932457, -1.493763, 0, 0, 0, 1, 1,
-0.6032234, -0.4904726, -1.43448, 1, 1, 1, 1, 1,
-0.6014505, 0.6285717, -0.08188051, 1, 1, 1, 1, 1,
-0.5958637, -1.404095, -3.876905, 1, 1, 1, 1, 1,
-0.593776, -1.557389, -0.261223, 1, 1, 1, 1, 1,
-0.5920333, -1.71528, -5.59533, 1, 1, 1, 1, 1,
-0.5914831, 0.9883635, -0.2676915, 1, 1, 1, 1, 1,
-0.5795314, 1.303925, -1.812223, 1, 1, 1, 1, 1,
-0.5731302, -0.5829271, -3.041111, 1, 1, 1, 1, 1,
-0.5707408, 0.2366855, -1.668033, 1, 1, 1, 1, 1,
-0.5681502, 0.9821425, -1.022441, 1, 1, 1, 1, 1,
-0.5668695, -0.06437752, -2.234623, 1, 1, 1, 1, 1,
-0.5618986, -0.02269395, -2.912224, 1, 1, 1, 1, 1,
-0.5615581, -0.1969377, -0.8056629, 1, 1, 1, 1, 1,
-0.5596102, -0.3609521, -3.238237, 1, 1, 1, 1, 1,
-0.5568424, 0.2754166, -1.829643, 1, 1, 1, 1, 1,
-0.5560751, 0.1990515, -2.709178, 0, 0, 1, 1, 1,
-0.5550166, 0.7905465, -0.587331, 1, 0, 0, 1, 1,
-0.5520325, -0.4345584, -1.765511, 1, 0, 0, 1, 1,
-0.5500942, -0.9219437, -1.150902, 1, 0, 0, 1, 1,
-0.5474291, -0.2821089, -1.653537, 1, 0, 0, 1, 1,
-0.5443162, -1.570417, -1.779722, 1, 0, 0, 1, 1,
-0.5399348, 0.2359289, -2.060383, 0, 0, 0, 1, 1,
-0.5377, -0.8082269, -0.8599041, 0, 0, 0, 1, 1,
-0.5335751, -0.7911221, -2.835641, 0, 0, 0, 1, 1,
-0.5329635, -0.7622158, -2.866964, 0, 0, 0, 1, 1,
-0.532342, 1.250216, -0.04597395, 0, 0, 0, 1, 1,
-0.5308571, -1.517731, -2.785746, 0, 0, 0, 1, 1,
-0.5300911, -0.02801701, -2.78655, 0, 0, 0, 1, 1,
-0.530031, 1.421396, 0.8860092, 1, 1, 1, 1, 1,
-0.530006, 1.190984, 0.2832426, 1, 1, 1, 1, 1,
-0.5286793, -1.37133, -3.221978, 1, 1, 1, 1, 1,
-0.5246561, -0.7232971, -2.348683, 1, 1, 1, 1, 1,
-0.5235927, -2.172791, -2.392672, 1, 1, 1, 1, 1,
-0.5222119, -1.378397, -3.857299, 1, 1, 1, 1, 1,
-0.5188103, 1.396027, -0.7885001, 1, 1, 1, 1, 1,
-0.5168203, -1.690479, -3.024633, 1, 1, 1, 1, 1,
-0.5149021, 0.1422689, -1.648678, 1, 1, 1, 1, 1,
-0.5126303, 0.5677911, -2.219068, 1, 1, 1, 1, 1,
-0.5090563, -1.89257, -3.029897, 1, 1, 1, 1, 1,
-0.5079482, 1.490106, -0.7288548, 1, 1, 1, 1, 1,
-0.5070271, 0.06176916, -2.939799, 1, 1, 1, 1, 1,
-0.5065146, 0.3195817, -0.6324716, 1, 1, 1, 1, 1,
-0.4992958, -0.6353935, -0.8035583, 1, 1, 1, 1, 1,
-0.4989879, -0.2582237, -1.631895, 0, 0, 1, 1, 1,
-0.4940374, 1.160284, -0.9689939, 1, 0, 0, 1, 1,
-0.4891499, -0.5780602, -2.482112, 1, 0, 0, 1, 1,
-0.4861903, -1.516356, -2.365708, 1, 0, 0, 1, 1,
-0.4819748, -0.1718191, -0.6813704, 1, 0, 0, 1, 1,
-0.4814521, -0.9284358, -2.340126, 1, 0, 0, 1, 1,
-0.4792398, 0.03386537, -0.6794991, 0, 0, 0, 1, 1,
-0.4755307, -1.951857, -2.68088, 0, 0, 0, 1, 1,
-0.4738831, 0.1601107, -0.5650096, 0, 0, 0, 1, 1,
-0.4710357, 0.9894399, 0.2163894, 0, 0, 0, 1, 1,
-0.4642035, -1.851216, -3.687728, 0, 0, 0, 1, 1,
-0.4495803, 0.07209842, -1.887755, 0, 0, 0, 1, 1,
-0.4416023, 1.532221, -0.8817352, 0, 0, 0, 1, 1,
-0.4356028, 0.9736212, -1.789171, 1, 1, 1, 1, 1,
-0.4328481, 0.2375344, -1.739122, 1, 1, 1, 1, 1,
-0.4248639, 1.308463, 0.463698, 1, 1, 1, 1, 1,
-0.4229101, -0.3241852, -1.511074, 1, 1, 1, 1, 1,
-0.4140526, 0.8155663, 0.7752393, 1, 1, 1, 1, 1,
-0.4123807, -1.961094, -4.354767, 1, 1, 1, 1, 1,
-0.4007208, -0.48988, -1.756584, 1, 1, 1, 1, 1,
-0.3943411, -0.1969913, -3.474704, 1, 1, 1, 1, 1,
-0.393678, -0.5516294, -4.709398, 1, 1, 1, 1, 1,
-0.3936095, -0.8362789, -2.279895, 1, 1, 1, 1, 1,
-0.393137, 0.3561058, 0.02606468, 1, 1, 1, 1, 1,
-0.3915944, -0.0793958, -2.042293, 1, 1, 1, 1, 1,
-0.3787324, -0.7827058, -3.192325, 1, 1, 1, 1, 1,
-0.3750181, 1.272467, -0.4643633, 1, 1, 1, 1, 1,
-0.3742202, 0.7941759, 0.5417337, 1, 1, 1, 1, 1,
-0.3699166, -0.01565399, 0.05109155, 0, 0, 1, 1, 1,
-0.3651526, 2.335615, -0.572836, 1, 0, 0, 1, 1,
-0.3648574, -0.8082892, -2.921033, 1, 0, 0, 1, 1,
-0.3638377, 2.61921, 0.9194221, 1, 0, 0, 1, 1,
-0.3634246, -1.029179, -3.038046, 1, 0, 0, 1, 1,
-0.362957, -0.503266, -1.655123, 1, 0, 0, 1, 1,
-0.3568314, -1.4396, -2.343285, 0, 0, 0, 1, 1,
-0.3558668, -0.3570656, -2.371212, 0, 0, 0, 1, 1,
-0.3524199, -1.205132, -1.013855, 0, 0, 0, 1, 1,
-0.3519597, 0.4267527, -1.910479, 0, 0, 0, 1, 1,
-0.3484555, 0.3066855, -1.020473, 0, 0, 0, 1, 1,
-0.3390846, 1.338677, 1.101507, 0, 0, 0, 1, 1,
-0.3389876, 0.2579452, 0.0579568, 0, 0, 0, 1, 1,
-0.3376458, -0.5490681, -3.289761, 1, 1, 1, 1, 1,
-0.3376132, 0.7050905, -1.001641, 1, 1, 1, 1, 1,
-0.3319956, -2.667162, -3.126935, 1, 1, 1, 1, 1,
-0.3299576, -0.7786646, -2.268153, 1, 1, 1, 1, 1,
-0.3288234, 1.669127, -0.7867467, 1, 1, 1, 1, 1,
-0.3227266, 0.8377261, -0.918564, 1, 1, 1, 1, 1,
-0.3219742, 0.1741131, -0.3705465, 1, 1, 1, 1, 1,
-0.3216819, 1.577543, -0.8421084, 1, 1, 1, 1, 1,
-0.318959, 0.8983576, -1.028319, 1, 1, 1, 1, 1,
-0.3107138, -0.969588, -1.232726, 1, 1, 1, 1, 1,
-0.3106059, -1.118665, -2.64608, 1, 1, 1, 1, 1,
-0.3095899, 1.639882, -1.092579, 1, 1, 1, 1, 1,
-0.3062095, 0.4777478, -1.718944, 1, 1, 1, 1, 1,
-0.3045467, 1.223639, -0.08721532, 1, 1, 1, 1, 1,
-0.3044463, 1.198421, -0.9634664, 1, 1, 1, 1, 1,
-0.2898996, -0.2824734, -2.785993, 0, 0, 1, 1, 1,
-0.2880706, 0.4636127, -1.656972, 1, 0, 0, 1, 1,
-0.2816418, -0.3641408, -0.5392, 1, 0, 0, 1, 1,
-0.2801951, -1.0474, -4.72888, 1, 0, 0, 1, 1,
-0.2783849, -0.1571263, -2.028601, 1, 0, 0, 1, 1,
-0.276808, 0.2015139, -1.034301, 1, 0, 0, 1, 1,
-0.273609, -0.6917872, -2.967196, 0, 0, 0, 1, 1,
-0.2731473, 0.09631418, 0.9266354, 0, 0, 0, 1, 1,
-0.2659484, -0.5692959, -0.6803361, 0, 0, 0, 1, 1,
-0.2636293, 0.1466966, 0.5679725, 0, 0, 0, 1, 1,
-0.261741, 0.2856257, -0.6929387, 0, 0, 0, 1, 1,
-0.260662, -0.1817879, -2.334596, 0, 0, 0, 1, 1,
-0.2589046, 0.06423703, -0.3862161, 0, 0, 0, 1, 1,
-0.2574461, -1.756606, -3.263664, 1, 1, 1, 1, 1,
-0.2554128, -0.6386878, -2.989896, 1, 1, 1, 1, 1,
-0.2553616, 0.7468606, -2.637436, 1, 1, 1, 1, 1,
-0.2539259, 0.1143854, -0.02825864, 1, 1, 1, 1, 1,
-0.2504874, 0.06369507, -1.846045, 1, 1, 1, 1, 1,
-0.2484744, 0.9970757, 1.299752, 1, 1, 1, 1, 1,
-0.2475053, 0.7482235, -1.862107, 1, 1, 1, 1, 1,
-0.244, -0.8658845, -3.298961, 1, 1, 1, 1, 1,
-0.2364547, -0.06783332, -3.199458, 1, 1, 1, 1, 1,
-0.2360731, -0.5790169, -2.098483, 1, 1, 1, 1, 1,
-0.2318756, -0.02472736, -1.739791, 1, 1, 1, 1, 1,
-0.2316675, 0.9063001, 1.55627, 1, 1, 1, 1, 1,
-0.2302853, 1.551208, -2.032771, 1, 1, 1, 1, 1,
-0.2252207, 0.8210461, 0.3189484, 1, 1, 1, 1, 1,
-0.2239212, 1.802742, 1.620187, 1, 1, 1, 1, 1,
-0.2162026, 2.437054, 1.97271, 0, 0, 1, 1, 1,
-0.2094912, 0.7278913, -0.4072337, 1, 0, 0, 1, 1,
-0.2090092, -0.3741025, -2.407652, 1, 0, 0, 1, 1,
-0.2007589, -0.774102, -3.041718, 1, 0, 0, 1, 1,
-0.1991334, -2.420158, -2.205906, 1, 0, 0, 1, 1,
-0.19651, -0.3432458, -4.114864, 1, 0, 0, 1, 1,
-0.1957746, -0.2974202, -2.644048, 0, 0, 0, 1, 1,
-0.1903578, -1.064534, -3.624669, 0, 0, 0, 1, 1,
-0.1890075, -0.9270747, -2.813487, 0, 0, 0, 1, 1,
-0.1887921, 1.932583, -0.9316242, 0, 0, 0, 1, 1,
-0.1882362, -0.2537642, -2.622733, 0, 0, 0, 1, 1,
-0.1872669, -0.7080658, -1.335831, 0, 0, 0, 1, 1,
-0.1870012, -0.2771399, -2.5483, 0, 0, 0, 1, 1,
-0.1854604, 1.393881, 0.5933267, 1, 1, 1, 1, 1,
-0.1786806, 0.6254619, 0.1057112, 1, 1, 1, 1, 1,
-0.1702427, 0.8436244, -0.8376642, 1, 1, 1, 1, 1,
-0.1674279, -1.315661, -1.759557, 1, 1, 1, 1, 1,
-0.1648012, 0.5491088, -0.5290457, 1, 1, 1, 1, 1,
-0.1587076, -0.2025426, -1.873689, 1, 1, 1, 1, 1,
-0.1582121, -0.2350125, -3.713316, 1, 1, 1, 1, 1,
-0.1574285, -1.205125, -2.768518, 1, 1, 1, 1, 1,
-0.1573718, -1.068967, -4.106158, 1, 1, 1, 1, 1,
-0.1572829, 0.03965638, -1.313485, 1, 1, 1, 1, 1,
-0.1532783, 0.8308596, 0.9865721, 1, 1, 1, 1, 1,
-0.1505814, -0.3967349, -1.65598, 1, 1, 1, 1, 1,
-0.1501395, -0.1009748, -1.914794, 1, 1, 1, 1, 1,
-0.1475721, -1.358408, -2.737045, 1, 1, 1, 1, 1,
-0.1454939, -0.120449, -2.086373, 1, 1, 1, 1, 1,
-0.1454582, 1.23234, -1.503747, 0, 0, 1, 1, 1,
-0.1427777, -0.8801488, -3.367405, 1, 0, 0, 1, 1,
-0.1389976, 0.4877122, -0.1383938, 1, 0, 0, 1, 1,
-0.1304113, 1.412337, -1.189251, 1, 0, 0, 1, 1,
-0.1302555, 0.6179348, 2.563801, 1, 0, 0, 1, 1,
-0.128634, 1.784328, -0.1338542, 1, 0, 0, 1, 1,
-0.1276779, -0.5927344, -2.139163, 0, 0, 0, 1, 1,
-0.1228334, -0.3155487, -3.033461, 0, 0, 0, 1, 1,
-0.1219663, -1.544078, -3.709095, 0, 0, 0, 1, 1,
-0.1152571, 2.074711, 1.248247, 0, 0, 0, 1, 1,
-0.1144952, 0.7920079, -0.08954573, 0, 0, 0, 1, 1,
-0.1123429, 0.3168103, -1.115814, 0, 0, 0, 1, 1,
-0.1096251, 0.2538587, -0.7855461, 0, 0, 0, 1, 1,
-0.1076325, 0.8549302, -0.8213329, 1, 1, 1, 1, 1,
-0.1073546, -1.974848, -3.440726, 1, 1, 1, 1, 1,
-0.1069131, -1.080739, -4.057595, 1, 1, 1, 1, 1,
-0.1017768, 0.7785315, -2.233027, 1, 1, 1, 1, 1,
-0.09788835, 0.05605998, -0.6390555, 1, 1, 1, 1, 1,
-0.09462972, 0.2461273, -0.4731463, 1, 1, 1, 1, 1,
-0.09408692, -0.2786019, -3.646094, 1, 1, 1, 1, 1,
-0.09246039, 0.4171895, 1.687478, 1, 1, 1, 1, 1,
-0.09237082, -0.1789224, -2.031429, 1, 1, 1, 1, 1,
-0.09047493, -0.1539337, -2.787225, 1, 1, 1, 1, 1,
-0.09000565, -0.1625097, -2.001751, 1, 1, 1, 1, 1,
-0.08335652, -1.088076, -2.128392, 1, 1, 1, 1, 1,
-0.08261497, -0.4055372, -2.991114, 1, 1, 1, 1, 1,
-0.07849067, 0.4220592, -0.5204164, 1, 1, 1, 1, 1,
-0.07575994, -1.590426, -4.213556, 1, 1, 1, 1, 1,
-0.07475226, 0.5863734, 0.1181398, 0, 0, 1, 1, 1,
-0.07131226, -0.4293601, -2.170508, 1, 0, 0, 1, 1,
-0.06186957, 0.4884255, 0.1682236, 1, 0, 0, 1, 1,
-0.06010671, 0.9305265, 0.8376604, 1, 0, 0, 1, 1,
-0.05997461, 1.405944, -0.9894556, 1, 0, 0, 1, 1,
-0.05962609, 1.070065, 0.5913139, 1, 0, 0, 1, 1,
-0.05522323, 0.8808777, 0.02228507, 0, 0, 0, 1, 1,
-0.05238374, -1.207522, -4.006962, 0, 0, 0, 1, 1,
-0.04853483, 0.9695211, 0.3314466, 0, 0, 0, 1, 1,
-0.04482703, 0.1209103, -1.123031, 0, 0, 0, 1, 1,
-0.04473246, 0.1118947, -0.5514783, 0, 0, 0, 1, 1,
-0.03964976, 1.164202, 2.048877, 0, 0, 0, 1, 1,
-0.0367975, 1.455472, -0.5767102, 0, 0, 0, 1, 1,
-0.03525206, 0.3457308, 2.051121, 1, 1, 1, 1, 1,
-0.0310525, 0.2630971, 0.1775668, 1, 1, 1, 1, 1,
-0.02854818, 1.137513, 1.199274, 1, 1, 1, 1, 1,
-0.02129691, 0.2396933, -1.009328, 1, 1, 1, 1, 1,
-0.02117984, -0.8066837, -5.439206, 1, 1, 1, 1, 1,
-0.01923809, 0.8494074, -0.2398361, 1, 1, 1, 1, 1,
-0.009361882, -0.8150927, -4.732715, 1, 1, 1, 1, 1,
-0.005760215, 0.550229, 0.5221048, 1, 1, 1, 1, 1,
-0.005493613, -0.4940161, -0.1702886, 1, 1, 1, 1, 1,
0.00493406, -1.2889, 2.910864, 1, 1, 1, 1, 1,
0.008269762, 0.3688428, -0.9023324, 1, 1, 1, 1, 1,
0.01459781, 1.49287, 1.42654, 1, 1, 1, 1, 1,
0.01594596, 0.05886399, 0.3246199, 1, 1, 1, 1, 1,
0.01796255, -1.114122, 4.649032, 1, 1, 1, 1, 1,
0.02203432, -0.3297004, 3.422464, 1, 1, 1, 1, 1,
0.02728387, -0.1876367, 3.414032, 0, 0, 1, 1, 1,
0.02810469, -1.18226, 4.023801, 1, 0, 0, 1, 1,
0.03037686, -0.6687188, 1.671284, 1, 0, 0, 1, 1,
0.03824225, -0.9126784, 3.575971, 1, 0, 0, 1, 1,
0.04104919, 0.2796938, 0.7817513, 1, 0, 0, 1, 1,
0.04263552, -1.514485, 2.176381, 1, 0, 0, 1, 1,
0.04648445, 1.234641, 0.7294651, 0, 0, 0, 1, 1,
0.04927225, 0.5075766, -0.3462592, 0, 0, 0, 1, 1,
0.05036733, 0.3614427, 0.6658713, 0, 0, 0, 1, 1,
0.05584193, 0.1918017, -0.5351018, 0, 0, 0, 1, 1,
0.06069658, 0.295295, -0.3365231, 0, 0, 0, 1, 1,
0.06270474, 0.6284559, 0.306095, 0, 0, 0, 1, 1,
0.06491473, -1.348801, 3.771587, 0, 0, 0, 1, 1,
0.0649922, -0.5588208, 2.499361, 1, 1, 1, 1, 1,
0.06709459, -1.384005, 2.34803, 1, 1, 1, 1, 1,
0.07056443, 0.05751372, 0.2416996, 1, 1, 1, 1, 1,
0.07351173, -0.8804986, 2.395967, 1, 1, 1, 1, 1,
0.07401513, -1.43944, 2.359902, 1, 1, 1, 1, 1,
0.07773002, 0.05982824, -1.685225, 1, 1, 1, 1, 1,
0.08195853, -0.4245734, 3.772214, 1, 1, 1, 1, 1,
0.08239976, 1.189982, -0.2676415, 1, 1, 1, 1, 1,
0.08264156, -0.9026402, 4.318208, 1, 1, 1, 1, 1,
0.0833313, -0.7999212, 2.830107, 1, 1, 1, 1, 1,
0.08341438, -0.1907625, 1.605701, 1, 1, 1, 1, 1,
0.08358902, 0.3100932, 0.6838971, 1, 1, 1, 1, 1,
0.08455876, -0.7999417, 2.643554, 1, 1, 1, 1, 1,
0.08713253, 0.3439055, 0.02048454, 1, 1, 1, 1, 1,
0.09105904, 1.351005, -1.422666, 1, 1, 1, 1, 1,
0.09325875, 0.3511133, 0.1665337, 0, 0, 1, 1, 1,
0.09697913, 0.222168, -0.5782681, 1, 0, 0, 1, 1,
0.0973666, 0.7916673, 1.065723, 1, 0, 0, 1, 1,
0.1042304, 0.8482101, -0.8416887, 1, 0, 0, 1, 1,
0.1045787, -0.3261207, 1.736084, 1, 0, 0, 1, 1,
0.1065884, 0.03844274, 1.14785, 1, 0, 0, 1, 1,
0.107292, -1.002695, 5.31635, 0, 0, 0, 1, 1,
0.1084787, -0.6528449, 3.381222, 0, 0, 0, 1, 1,
0.1085934, -0.3412905, 5.152564, 0, 0, 0, 1, 1,
0.1107149, 1.467822, -0.5500048, 0, 0, 0, 1, 1,
0.1111479, 1.406594, 1.566194, 0, 0, 0, 1, 1,
0.1138886, 0.6079534, -1.131926, 0, 0, 0, 1, 1,
0.1139508, 0.9286859, -1.509164, 0, 0, 0, 1, 1,
0.1175976, -1.118477, 2.330259, 1, 1, 1, 1, 1,
0.1179317, -1.571725, 2.222684, 1, 1, 1, 1, 1,
0.124828, 0.053978, 0.8601464, 1, 1, 1, 1, 1,
0.1261155, 1.185856, -0.4801261, 1, 1, 1, 1, 1,
0.1277007, 2.210446, 1.289346, 1, 1, 1, 1, 1,
0.1302243, -0.4745644, 4.516191, 1, 1, 1, 1, 1,
0.1331306, -0.3685132, 2.671771, 1, 1, 1, 1, 1,
0.134956, -0.7525063, 1.941999, 1, 1, 1, 1, 1,
0.135712, -0.08220556, 2.105166, 1, 1, 1, 1, 1,
0.1365671, -0.2033495, 2.499245, 1, 1, 1, 1, 1,
0.1373211, 0.8218102, 0.28724, 1, 1, 1, 1, 1,
0.1374638, 0.01335888, 1.995371, 1, 1, 1, 1, 1,
0.138391, -1.185748, 2.611914, 1, 1, 1, 1, 1,
0.1438004, 1.386762, 1.021936, 1, 1, 1, 1, 1,
0.1441423, -1.008576, 2.811509, 1, 1, 1, 1, 1,
0.146797, 0.2245476, 0.05876125, 0, 0, 1, 1, 1,
0.152975, 1.221319, 1.032461, 1, 0, 0, 1, 1,
0.1541314, 0.6273074, 2.139337, 1, 0, 0, 1, 1,
0.1563598, -0.0007857326, 0.2954966, 1, 0, 0, 1, 1,
0.1591745, -0.2228509, 2.998118, 1, 0, 0, 1, 1,
0.1634865, 0.4717127, -0.5999267, 1, 0, 0, 1, 1,
0.165667, -2.246478, 3.355798, 0, 0, 0, 1, 1,
0.1673766, 0.5489615, 1.68636, 0, 0, 0, 1, 1,
0.1681502, 0.3766694, 0.5781588, 0, 0, 0, 1, 1,
0.1685012, 0.2352024, 0.2240458, 0, 0, 0, 1, 1,
0.1727436, 0.34353, 0.7206805, 0, 0, 0, 1, 1,
0.175369, 0.8507571, 0.7069532, 0, 0, 0, 1, 1,
0.1764843, -1.546847, 2.349886, 0, 0, 0, 1, 1,
0.1767025, 1.703479, -1.017719, 1, 1, 1, 1, 1,
0.1808474, -0.1144387, 1.65098, 1, 1, 1, 1, 1,
0.1826678, 0.3859507, -0.08120733, 1, 1, 1, 1, 1,
0.1892647, -1.632499, 1.753063, 1, 1, 1, 1, 1,
0.1919934, 1.601968, -0.5063887, 1, 1, 1, 1, 1,
0.1947525, -0.7125938, 2.950654, 1, 1, 1, 1, 1,
0.1952177, 0.5024666, -0.7520164, 1, 1, 1, 1, 1,
0.1952576, -0.1737116, 2.752945, 1, 1, 1, 1, 1,
0.1955695, -0.4599406, 1.662128, 1, 1, 1, 1, 1,
0.1960413, -1.887684, 0.9272441, 1, 1, 1, 1, 1,
0.1961973, -0.5270776, 3.339488, 1, 1, 1, 1, 1,
0.1985907, 0.2235444, 0.01627478, 1, 1, 1, 1, 1,
0.1990229, 0.9074018, 1.377, 1, 1, 1, 1, 1,
0.2016768, -0.7904427, 3.944679, 1, 1, 1, 1, 1,
0.2067926, -0.5162683, 3.462649, 1, 1, 1, 1, 1,
0.2114206, 0.2543649, 0.8313028, 0, 0, 1, 1, 1,
0.2114294, 1.180749, -1.182931, 1, 0, 0, 1, 1,
0.2183336, -2.014839, 2.279358, 1, 0, 0, 1, 1,
0.2249055, 1.660253, 1.662269, 1, 0, 0, 1, 1,
0.2266579, 0.1144949, 0.4099045, 1, 0, 0, 1, 1,
0.2281591, -0.08204061, 1.141561, 1, 0, 0, 1, 1,
0.2322646, -1.479003, 4.362267, 0, 0, 0, 1, 1,
0.233878, -0.4737245, 2.627134, 0, 0, 0, 1, 1,
0.2342457, -0.7178203, 3.701713, 0, 0, 0, 1, 1,
0.2344355, -2.467916, 2.336584, 0, 0, 0, 1, 1,
0.2372752, 0.07544106, 2.042072, 0, 0, 0, 1, 1,
0.2413816, 0.1870969, 2.214167, 0, 0, 0, 1, 1,
0.2415798, -0.6805047, 3.114764, 0, 0, 0, 1, 1,
0.2425196, 0.7195547, 0.3190515, 1, 1, 1, 1, 1,
0.2430533, 0.6386063, -0.3444346, 1, 1, 1, 1, 1,
0.2449878, -0.8223214, 2.34968, 1, 1, 1, 1, 1,
0.2451966, 2.710894, -0.2130254, 1, 1, 1, 1, 1,
0.2502632, 0.3018184, 2.220476, 1, 1, 1, 1, 1,
0.2504403, 0.6915265, 2.556415, 1, 1, 1, 1, 1,
0.2536773, 0.9935654, -1.600786, 1, 1, 1, 1, 1,
0.2539786, 0.6303608, -2.191567, 1, 1, 1, 1, 1,
0.2567, -0.2892953, 2.071395, 1, 1, 1, 1, 1,
0.2599187, -0.7216545, 3.189952, 1, 1, 1, 1, 1,
0.2611534, 0.1672354, 0.05461315, 1, 1, 1, 1, 1,
0.2641635, 0.7683922, -0.9515181, 1, 1, 1, 1, 1,
0.2675112, -0.133379, 2.587001, 1, 1, 1, 1, 1,
0.2694782, -0.5768604, 3.112653, 1, 1, 1, 1, 1,
0.2730979, 0.04209086, 1.121702, 1, 1, 1, 1, 1,
0.273339, -0.06416105, -0.800687, 0, 0, 1, 1, 1,
0.2761109, 0.5434685, 1.444652, 1, 0, 0, 1, 1,
0.2769496, 0.6371978, -1.039912, 1, 0, 0, 1, 1,
0.2809559, -0.7440122, 3.048029, 1, 0, 0, 1, 1,
0.2821021, -1.338173, 4.482265, 1, 0, 0, 1, 1,
0.2835355, -0.835238, 2.160206, 1, 0, 0, 1, 1,
0.2876884, 0.05304611, 0.5672823, 0, 0, 0, 1, 1,
0.2883866, -0.2802532, 2.61199, 0, 0, 0, 1, 1,
0.2914529, 2.388948, 0.1764519, 0, 0, 0, 1, 1,
0.296102, -0.9445392, 3.439923, 0, 0, 0, 1, 1,
0.300271, 1.3503, 0.8408225, 0, 0, 0, 1, 1,
0.3007938, 1.00201, -0.700883, 0, 0, 0, 1, 1,
0.3011957, 0.73831, 0.2205357, 0, 0, 0, 1, 1,
0.3022767, 1.400979, -0.5369191, 1, 1, 1, 1, 1,
0.3041245, 0.2205946, 0.4973793, 1, 1, 1, 1, 1,
0.3071946, 0.3942811, -0.8722554, 1, 1, 1, 1, 1,
0.3083572, -1.097162, 1.829903, 1, 1, 1, 1, 1,
0.3094651, 0.5385073, 0.9893589, 1, 1, 1, 1, 1,
0.3151504, -0.8938059, 2.650877, 1, 1, 1, 1, 1,
0.3161647, 0.7704986, 0.4397795, 1, 1, 1, 1, 1,
0.3174596, -0.007873522, 1.302914, 1, 1, 1, 1, 1,
0.3190844, 0.3740086, -0.7820321, 1, 1, 1, 1, 1,
0.3210225, -0.7104673, 1.193863, 1, 1, 1, 1, 1,
0.3216549, -1.030348, 3.17213, 1, 1, 1, 1, 1,
0.3218579, -0.2276643, 2.693275, 1, 1, 1, 1, 1,
0.324594, 0.701249, 0.7634419, 1, 1, 1, 1, 1,
0.3250023, -0.4944059, 4.80041, 1, 1, 1, 1, 1,
0.3258803, 0.5806944, -0.2579104, 1, 1, 1, 1, 1,
0.3334801, 0.4292618, 2.419098, 0, 0, 1, 1, 1,
0.3342481, 0.5211047, 0.6536105, 1, 0, 0, 1, 1,
0.335422, 0.2590572, 1.970948, 1, 0, 0, 1, 1,
0.3363017, -0.5705436, 2.610991, 1, 0, 0, 1, 1,
0.3403665, 1.768295, 0.6065966, 1, 0, 0, 1, 1,
0.3454373, 0.8765856, -1.088511, 1, 0, 0, 1, 1,
0.3538513, -0.2670471, 3.171201, 0, 0, 0, 1, 1,
0.3607422, 0.9814715, 1.009973, 0, 0, 0, 1, 1,
0.3615094, 0.4988807, -1.379967, 0, 0, 0, 1, 1,
0.365706, -1.588042, 1.788608, 0, 0, 0, 1, 1,
0.3671569, -0.003256501, 1.70727, 0, 0, 0, 1, 1,
0.3723778, -0.1231548, 3.528079, 0, 0, 0, 1, 1,
0.3724802, 1.204686, 0.2604911, 0, 0, 0, 1, 1,
0.375193, 0.1937056, 0.7745867, 1, 1, 1, 1, 1,
0.3768991, 0.5433391, 0.6042582, 1, 1, 1, 1, 1,
0.3873101, -0.5398463, 0.2500436, 1, 1, 1, 1, 1,
0.3873968, 0.8223118, 0.3007136, 1, 1, 1, 1, 1,
0.3911774, -0.5101128, 3.060123, 1, 1, 1, 1, 1,
0.3930636, 1.586075, 0.2165139, 1, 1, 1, 1, 1,
0.3936231, 0.3651283, 0.7501802, 1, 1, 1, 1, 1,
0.3948403, 2.083386, 0.8425254, 1, 1, 1, 1, 1,
0.3956021, -1.716277, 1.774757, 1, 1, 1, 1, 1,
0.3964318, -1.213787, 3.27745, 1, 1, 1, 1, 1,
0.3975046, 1.132422, -0.04012122, 1, 1, 1, 1, 1,
0.3996223, 1.183432, 2.218833, 1, 1, 1, 1, 1,
0.406942, -1.664845, 2.686035, 1, 1, 1, 1, 1,
0.4160922, -0.3773188, 2.908499, 1, 1, 1, 1, 1,
0.4185922, 1.473858, -1.180798, 1, 1, 1, 1, 1,
0.4228971, 0.535874, 1.611542, 0, 0, 1, 1, 1,
0.4255376, -1.398671, 0.08408719, 1, 0, 0, 1, 1,
0.4255922, 1.322777, 0.8624685, 1, 0, 0, 1, 1,
0.4268409, 1.558084, -1.200036, 1, 0, 0, 1, 1,
0.4268987, 0.6474963, -0.2816244, 1, 0, 0, 1, 1,
0.4286957, 0.06139984, -1.626258, 1, 0, 0, 1, 1,
0.4289637, -1.07805, 2.107249, 0, 0, 0, 1, 1,
0.4333326, -0.3695967, 2.72982, 0, 0, 0, 1, 1,
0.4342299, 0.0375506, 1.697485, 0, 0, 0, 1, 1,
0.4358176, -1.746514, 2.684398, 0, 0, 0, 1, 1,
0.4388308, 0.8441783, 0.9718445, 0, 0, 0, 1, 1,
0.4398232, 0.1365578, 2.032829, 0, 0, 0, 1, 1,
0.4416091, 1.332269, -0.4779779, 0, 0, 0, 1, 1,
0.4423851, -0.714274, 3.013859, 1, 1, 1, 1, 1,
0.4452822, 1.968905, 1.72913, 1, 1, 1, 1, 1,
0.4538047, -2.480957, 4.040328, 1, 1, 1, 1, 1,
0.4541519, -1.507394, 4.082575, 1, 1, 1, 1, 1,
0.4588237, -0.0004262686, 2.688733, 1, 1, 1, 1, 1,
0.4601946, -0.8310761, 2.86565, 1, 1, 1, 1, 1,
0.47098, 2.136526, 2.963166, 1, 1, 1, 1, 1,
0.4718128, 0.2116042, 3.365389, 1, 1, 1, 1, 1,
0.4749252, 0.2487587, 0.978489, 1, 1, 1, 1, 1,
0.4766114, 1.390646, -0.1345978, 1, 1, 1, 1, 1,
0.4794766, -0.1345373, 0.9905897, 1, 1, 1, 1, 1,
0.4811829, -0.02605616, 3.023283, 1, 1, 1, 1, 1,
0.484148, -0.8035697, 1.715441, 1, 1, 1, 1, 1,
0.4883195, -1.031766, 3.222364, 1, 1, 1, 1, 1,
0.4916124, -0.04986325, -0.5714277, 1, 1, 1, 1, 1,
0.4971778, -0.3990132, 2.049021, 0, 0, 1, 1, 1,
0.5010174, 1.387319, 1.222939, 1, 0, 0, 1, 1,
0.5029595, -0.5892224, 3.917357, 1, 0, 0, 1, 1,
0.505096, 1.146719, 1.31893, 1, 0, 0, 1, 1,
0.5096782, -0.9615178, 2.518365, 1, 0, 0, 1, 1,
0.5177003, -0.5670496, 3.989334, 1, 0, 0, 1, 1,
0.5196637, -0.1455873, 1.000187, 0, 0, 0, 1, 1,
0.519674, -0.7095616, 3.861832, 0, 0, 0, 1, 1,
0.5203162, 0.8517958, -0.9028986, 0, 0, 0, 1, 1,
0.5246524, -0.7318682, 2.541917, 0, 0, 0, 1, 1,
0.5252111, -0.5844233, 2.084543, 0, 0, 0, 1, 1,
0.5264751, 0.6092215, 2.132894, 0, 0, 0, 1, 1,
0.5304646, -0.2090707, 3.512229, 0, 0, 0, 1, 1,
0.5437483, -0.2474711, 0.7225341, 1, 1, 1, 1, 1,
0.5457472, -0.02644022, 2.662206, 1, 1, 1, 1, 1,
0.5503244, 0.5132169, 0.419747, 1, 1, 1, 1, 1,
0.5514494, -0.4383517, 0.5965803, 1, 1, 1, 1, 1,
0.5535308, -0.9477385, 3.854425, 1, 1, 1, 1, 1,
0.5591702, 0.3945897, 0.6179919, 1, 1, 1, 1, 1,
0.5636021, 2.526686, -0.3248886, 1, 1, 1, 1, 1,
0.5700775, -1.192459, 3.288831, 1, 1, 1, 1, 1,
0.5732473, -0.2621034, 2.405091, 1, 1, 1, 1, 1,
0.5756924, -0.6409261, 2.895648, 1, 1, 1, 1, 1,
0.5793375, -1.244667, 2.704693, 1, 1, 1, 1, 1,
0.5793731, 1.024677, 1.564283, 1, 1, 1, 1, 1,
0.5861981, 0.3745865, -0.5273779, 1, 1, 1, 1, 1,
0.586495, -0.5880551, 2.228451, 1, 1, 1, 1, 1,
0.5893418, -0.06185546, 0.9137957, 1, 1, 1, 1, 1,
0.5901398, -1.111234, 3.687474, 0, 0, 1, 1, 1,
0.5907721, -0.08860146, 1.290775, 1, 0, 0, 1, 1,
0.5926811, -0.8101339, 2.887111, 1, 0, 0, 1, 1,
0.5950587, -2.861747, 3.439885, 1, 0, 0, 1, 1,
0.5951647, -0.1175925, 2.001214, 1, 0, 0, 1, 1,
0.5958347, -0.4618545, 1.20655, 1, 0, 0, 1, 1,
0.6029052, 1.343472, 2.058501, 0, 0, 0, 1, 1,
0.6044541, -0.2051276, 0.9405653, 0, 0, 0, 1, 1,
0.606547, 0.9222053, 1.107669, 0, 0, 0, 1, 1,
0.613492, -1.26298, 3.356361, 0, 0, 0, 1, 1,
0.6171816, -0.5792921, 1.120935, 0, 0, 0, 1, 1,
0.6251241, -0.7442757, 1.777295, 0, 0, 0, 1, 1,
0.6265435, -1.249356, 1.91007, 0, 0, 0, 1, 1,
0.6277171, -1.813583, 2.492046, 1, 1, 1, 1, 1,
0.6298617, -0.302172, 2.82712, 1, 1, 1, 1, 1,
0.6361468, 0.2158236, 2.203694, 1, 1, 1, 1, 1,
0.637935, 1.32891, -0.8057095, 1, 1, 1, 1, 1,
0.6518212, 1.203216, 0.6233312, 1, 1, 1, 1, 1,
0.6554599, -0.7229553, 2.727062, 1, 1, 1, 1, 1,
0.6560995, 0.4348094, 1.733727, 1, 1, 1, 1, 1,
0.657406, 1.755568, 0.5040649, 1, 1, 1, 1, 1,
0.6586516, -0.4371069, 2.752456, 1, 1, 1, 1, 1,
0.6598494, -1.675851, 3.527704, 1, 1, 1, 1, 1,
0.6663596, -0.6091577, 2.510103, 1, 1, 1, 1, 1,
0.6672612, -0.02849835, 2.195891, 1, 1, 1, 1, 1,
0.6698464, -0.4373122, 2.032825, 1, 1, 1, 1, 1,
0.673839, -0.06596166, 1.793662, 1, 1, 1, 1, 1,
0.6835995, 1.596177, -0.06182148, 1, 1, 1, 1, 1,
0.6852079, 0.9460875, 2.00648, 0, 0, 1, 1, 1,
0.6858853, -0.5218813, 2.363752, 1, 0, 0, 1, 1,
0.6881591, 0.07359248, 0.666283, 1, 0, 0, 1, 1,
0.6913813, 0.7581193, 0.5851827, 1, 0, 0, 1, 1,
0.6928417, 0.04538772, 1.492973, 1, 0, 0, 1, 1,
0.7004113, 1.70557, 1.317238, 1, 0, 0, 1, 1,
0.7022655, 1.838446, 1.64758, 0, 0, 0, 1, 1,
0.7049816, 1.737184, 0.696191, 0, 0, 0, 1, 1,
0.7066293, 1.073951, 1.048142, 0, 0, 0, 1, 1,
0.7069854, 1.715674, 1.841613, 0, 0, 0, 1, 1,
0.7085559, -0.8517985, 3.33715, 0, 0, 0, 1, 1,
0.7108523, -0.7401075, 1.615036, 0, 0, 0, 1, 1,
0.7127305, 0.2528019, 2.007855, 0, 0, 0, 1, 1,
0.7166733, 0.6241654, 0.3140655, 1, 1, 1, 1, 1,
0.7175137, -0.2289789, 1.356124, 1, 1, 1, 1, 1,
0.7179197, -0.5065097, 2.361485, 1, 1, 1, 1, 1,
0.7217669, -1.351688, 1.996315, 1, 1, 1, 1, 1,
0.7300514, 0.675005, -0.131164, 1, 1, 1, 1, 1,
0.7405952, 0.1418951, 2.823084, 1, 1, 1, 1, 1,
0.7416128, 0.8675846, 0.3148762, 1, 1, 1, 1, 1,
0.750323, 1.845064, -1.595012, 1, 1, 1, 1, 1,
0.7521129, 0.2811061, 1.917798, 1, 1, 1, 1, 1,
0.7527799, -2.67213, 3.759784, 1, 1, 1, 1, 1,
0.7531305, -0.5659744, 1.947875, 1, 1, 1, 1, 1,
0.7540397, 0.4041268, 1.607145, 1, 1, 1, 1, 1,
0.7558346, -0.2326974, 1.363966, 1, 1, 1, 1, 1,
0.7581561, -1.256412, 4.176157, 1, 1, 1, 1, 1,
0.7710364, 0.1496276, 2.023634, 1, 1, 1, 1, 1,
0.7785673, 1.480541, 1.041179, 0, 0, 1, 1, 1,
0.7788296, 0.8521895, 0.4961453, 1, 0, 0, 1, 1,
0.7853896, 0.362461, 0.3434511, 1, 0, 0, 1, 1,
0.7857349, -0.05063985, 1.623873, 1, 0, 0, 1, 1,
0.7976169, -0.0407443, 1.394251, 1, 0, 0, 1, 1,
0.801072, -2.529634, 4.088064, 1, 0, 0, 1, 1,
0.8018634, -0.6075202, 2.85821, 0, 0, 0, 1, 1,
0.8032684, 2.022498, -0.08968429, 0, 0, 0, 1, 1,
0.8074301, -0.1824843, 0.2465751, 0, 0, 0, 1, 1,
0.8115665, -1.373866, 3.789928, 0, 0, 0, 1, 1,
0.8137441, -0.2721002, 3.27716, 0, 0, 0, 1, 1,
0.8218856, -0.05569293, 1.914358, 0, 0, 0, 1, 1,
0.8241709, -1.814861, 1.811659, 0, 0, 0, 1, 1,
0.8245098, -0.1201004, 2.297094, 1, 1, 1, 1, 1,
0.831286, -0.7769781, 1.601842, 1, 1, 1, 1, 1,
0.8381074, 1.075527, -0.5823592, 1, 1, 1, 1, 1,
0.840107, 2.022142, 0.783843, 1, 1, 1, 1, 1,
0.8471524, -0.7373018, 1.735527, 1, 1, 1, 1, 1,
0.8511722, -0.9385447, 2.850662, 1, 1, 1, 1, 1,
0.8523331, -1.258465, 0.7415884, 1, 1, 1, 1, 1,
0.8530666, -0.06567988, 3.17407, 1, 1, 1, 1, 1,
0.8561245, -0.4257964, 0.0894193, 1, 1, 1, 1, 1,
0.8596966, -0.7956061, 1.967867, 1, 1, 1, 1, 1,
0.8618734, 1.711367, 2.040029, 1, 1, 1, 1, 1,
0.8713064, -0.2485091, 1.916333, 1, 1, 1, 1, 1,
0.8737665, 0.2646531, 1.00925, 1, 1, 1, 1, 1,
0.8763393, 1.144914, 0.5178285, 1, 1, 1, 1, 1,
0.8769342, 0.6389314, 0.7855493, 1, 1, 1, 1, 1,
0.879464, 2.118455, 1.849552, 0, 0, 1, 1, 1,
0.8804591, -0.56882, 2.874736, 1, 0, 0, 1, 1,
0.8815008, 0.5029331, 0.1845199, 1, 0, 0, 1, 1,
0.882776, 0.1718695, 1.734721, 1, 0, 0, 1, 1,
0.8891498, 1.735816, -0.9552929, 1, 0, 0, 1, 1,
0.8898903, -0.2173947, 2.243307, 1, 0, 0, 1, 1,
0.8985558, -2.580444, 2.83657, 0, 0, 0, 1, 1,
0.9024673, -2.221755, 2.575306, 0, 0, 0, 1, 1,
0.9062518, -1.064066, 1.301226, 0, 0, 0, 1, 1,
0.9087887, 0.6485687, 0.4238651, 0, 0, 0, 1, 1,
0.9136243, 0.6870548, 1.582543, 0, 0, 0, 1, 1,
0.9156993, 0.08352768, 0.3164251, 0, 0, 0, 1, 1,
0.9241661, 1.005707, -1.378891, 0, 0, 0, 1, 1,
0.9277445, -0.4927906, 2.639056, 1, 1, 1, 1, 1,
0.9284984, 0.3703908, 1.399385, 1, 1, 1, 1, 1,
0.9353213, -0.2143378, 3.781233, 1, 1, 1, 1, 1,
0.9384336, 0.009528974, 2.055135, 1, 1, 1, 1, 1,
0.9386445, -0.5921403, 2.534939, 1, 1, 1, 1, 1,
0.9394248, -0.006438499, 2.243016, 1, 1, 1, 1, 1,
0.9419985, -0.5664394, 1.627323, 1, 1, 1, 1, 1,
0.9426902, -0.1547373, 2.041466, 1, 1, 1, 1, 1,
0.9476122, 0.8094782, 2.416112, 1, 1, 1, 1, 1,
0.9518705, -0.297938, 2.034278, 1, 1, 1, 1, 1,
0.9543817, -0.5076785, 1.610054, 1, 1, 1, 1, 1,
0.9596193, 0.1688909, 0.7535091, 1, 1, 1, 1, 1,
0.9648433, -0.05605221, 2.548484, 1, 1, 1, 1, 1,
0.9649929, 1.182246, 1.481091, 1, 1, 1, 1, 1,
0.9732901, 0.4265318, 1.531915, 1, 1, 1, 1, 1,
0.9765074, 1.323052, 0.7547653, 0, 0, 1, 1, 1,
0.9796305, -0.03653068, 2.208955, 1, 0, 0, 1, 1,
0.9840829, -0.4609528, 3.631303, 1, 0, 0, 1, 1,
0.9868994, -0.825001, 2.335649, 1, 0, 0, 1, 1,
0.9927772, -0.9480997, 2.045297, 1, 0, 0, 1, 1,
0.9936795, -1.257589, 1.645525, 1, 0, 0, 1, 1,
0.9972891, 0.619283, 0.5159463, 0, 0, 0, 1, 1,
1.001542, 0.4984996, 2.242216, 0, 0, 0, 1, 1,
1.007949, -0.1249224, -0.3194466, 0, 0, 0, 1, 1,
1.014131, -0.6381926, 2.170103, 0, 0, 0, 1, 1,
1.01909, -1.668171, 2.245338, 0, 0, 0, 1, 1,
1.021126, -0.1458967, 2.374176, 0, 0, 0, 1, 1,
1.022781, 0.1571519, 1.606944, 0, 0, 0, 1, 1,
1.025718, 0.0005066765, 0.6873192, 1, 1, 1, 1, 1,
1.026571, -0.02627809, 0.1638751, 1, 1, 1, 1, 1,
1.032687, 0.9638243, 0.06656089, 1, 1, 1, 1, 1,
1.039289, -0.5307798, 2.355586, 1, 1, 1, 1, 1,
1.04291, 1.134575, -1.902161, 1, 1, 1, 1, 1,
1.043672, -0.9537861, 3.79855, 1, 1, 1, 1, 1,
1.050622, -0.3118878, 2.138417, 1, 1, 1, 1, 1,
1.051563, -0.6777253, 4.477731, 1, 1, 1, 1, 1,
1.052783, -1.354659, 2.915002, 1, 1, 1, 1, 1,
1.053114, 1.101122, -0.1620586, 1, 1, 1, 1, 1,
1.06227, 1.253802, 2.421964, 1, 1, 1, 1, 1,
1.064304, 0.5294385, 1.066233, 1, 1, 1, 1, 1,
1.071257, 0.4740822, 1.074676, 1, 1, 1, 1, 1,
1.072188, -0.5424162, 1.64988, 1, 1, 1, 1, 1,
1.073609, -0.5049887, 2.07713, 1, 1, 1, 1, 1,
1.094356, 1.438407, 1.176179, 0, 0, 1, 1, 1,
1.095146, -0.761502, 2.714809, 1, 0, 0, 1, 1,
1.096301, -0.8629302, 1.804067, 1, 0, 0, 1, 1,
1.106014, 1.452024, -0.4842895, 1, 0, 0, 1, 1,
1.109787, 0.3777549, 2.611138, 1, 0, 0, 1, 1,
1.129223, -0.4053112, 1.884406, 1, 0, 0, 1, 1,
1.145851, 0.6248479, -0.5477688, 0, 0, 0, 1, 1,
1.146062, -0.3246523, 0.4985954, 0, 0, 0, 1, 1,
1.147945, 0.9370567, 0.7586452, 0, 0, 0, 1, 1,
1.16216, 2.07074, -0.03122101, 0, 0, 0, 1, 1,
1.164489, -1.975075, 3.182941, 0, 0, 0, 1, 1,
1.165598, 0.2530083, 2.499452, 0, 0, 0, 1, 1,
1.18599, 2.021971, 0.2760351, 0, 0, 0, 1, 1,
1.194076, -0.2090684, 0.8570879, 1, 1, 1, 1, 1,
1.200132, -0.2944065, 3.754482, 1, 1, 1, 1, 1,
1.211534, 0.1111306, 2.064849, 1, 1, 1, 1, 1,
1.212256, -0.4617565, 2.327355, 1, 1, 1, 1, 1,
1.213535, 1.454998, 2.184882, 1, 1, 1, 1, 1,
1.21401, 1.63443, -0.896682, 1, 1, 1, 1, 1,
1.222246, -1.018978, 2.214073, 1, 1, 1, 1, 1,
1.226888, -1.475642, 0.596034, 1, 1, 1, 1, 1,
1.227288, -2.80912, 4.465867, 1, 1, 1, 1, 1,
1.229567, -0.2063515, 1.374367, 1, 1, 1, 1, 1,
1.242582, -0.6250383, 2.478889, 1, 1, 1, 1, 1,
1.254598, -1.214774, 2.744024, 1, 1, 1, 1, 1,
1.268868, 0.6902041, 1.070836, 1, 1, 1, 1, 1,
1.283941, -1.26204, 2.067578, 1, 1, 1, 1, 1,
1.284547, -0.6275938, 2.675327, 1, 1, 1, 1, 1,
1.294693, -0.6643724, 1.812812, 0, 0, 1, 1, 1,
1.308182, -2.065558, 1.886537, 1, 0, 0, 1, 1,
1.313151, 0.1836582, 1.766739, 1, 0, 0, 1, 1,
1.314602, 0.3051513, 1.374189, 1, 0, 0, 1, 1,
1.3151, -0.3197791, 1.646513, 1, 0, 0, 1, 1,
1.315943, 0.2243306, 1.664966, 1, 0, 0, 1, 1,
1.316644, 0.4568506, 1.234957, 0, 0, 0, 1, 1,
1.324594, -0.4760206, 0.8689555, 0, 0, 0, 1, 1,
1.331505, 0.8120153, 1.326319, 0, 0, 0, 1, 1,
1.333153, 0.07344215, 1.587146, 0, 0, 0, 1, 1,
1.335256, -0.5902069, -0.4218084, 0, 0, 0, 1, 1,
1.341198, 0.7631721, -0.6048847, 0, 0, 0, 1, 1,
1.345957, -0.1374164, -0.5747234, 0, 0, 0, 1, 1,
1.351976, -0.9767461, 3.458457, 1, 1, 1, 1, 1,
1.361333, -1.236937, 1.615405, 1, 1, 1, 1, 1,
1.364383, -0.4315355, 1.800447, 1, 1, 1, 1, 1,
1.384061, 0.6813483, -0.1855621, 1, 1, 1, 1, 1,
1.391479, -0.07466809, 2.669993, 1, 1, 1, 1, 1,
1.392726, 0.3342403, 0.3873899, 1, 1, 1, 1, 1,
1.397243, 0.483584, -0.2173466, 1, 1, 1, 1, 1,
1.399675, -1.975457, 2.118203, 1, 1, 1, 1, 1,
1.413695, 0.5270706, 0.4614734, 1, 1, 1, 1, 1,
1.415831, 0.8671064, 1.689769, 1, 1, 1, 1, 1,
1.417162, -0.7938475, 1.364925, 1, 1, 1, 1, 1,
1.418499, 0.6548943, 1.318217, 1, 1, 1, 1, 1,
1.424445, -0.2469837, -0.3347304, 1, 1, 1, 1, 1,
1.425384, -1.035702, 3.209634, 1, 1, 1, 1, 1,
1.451336, -0.9494487, 2.818058, 1, 1, 1, 1, 1,
1.451561, 2.591601, 0.4519496, 0, 0, 1, 1, 1,
1.463649, -0.2848015, 1.107036, 1, 0, 0, 1, 1,
1.464239, -0.4382428, -0.6834173, 1, 0, 0, 1, 1,
1.480513, 1.212156, 1.402631, 1, 0, 0, 1, 1,
1.495253, 0.4440591, 0.5769217, 1, 0, 0, 1, 1,
1.501062, -2.645307, 3.065941, 1, 0, 0, 1, 1,
1.502727, 1.913921, 0.9372756, 0, 0, 0, 1, 1,
1.512268, 0.6669574, 1.187324, 0, 0, 0, 1, 1,
1.519237, 0.3574616, 2.179328, 0, 0, 0, 1, 1,
1.526348, 0.8234537, 2.436913, 0, 0, 0, 1, 1,
1.535468, -0.5069108, 0.9144374, 0, 0, 0, 1, 1,
1.562804, -0.5213337, 2.362569, 0, 0, 0, 1, 1,
1.565139, 0.1994118, 2.289774, 0, 0, 0, 1, 1,
1.571051, -1.118929, 3.179806, 1, 1, 1, 1, 1,
1.573538, 0.3769573, 1.512303, 1, 1, 1, 1, 1,
1.583516, 1.137846, 2.130598, 1, 1, 1, 1, 1,
1.584682, -0.8741063, 0.6597571, 1, 1, 1, 1, 1,
1.593147, 1.192743, 1.975592, 1, 1, 1, 1, 1,
1.602324, 0.4210526, 2.049444, 1, 1, 1, 1, 1,
1.605243, -0.02360849, 0.1212717, 1, 1, 1, 1, 1,
1.629533, -0.02755027, 1.177362, 1, 1, 1, 1, 1,
1.661153, 1.166663, 1.805776, 1, 1, 1, 1, 1,
1.673826, 2.760202, 0.5912209, 1, 1, 1, 1, 1,
1.678163, -0.1376088, 1.362626, 1, 1, 1, 1, 1,
1.682158, 0.252221, 1.978139, 1, 1, 1, 1, 1,
1.730488, -1.284051, 3.78767, 1, 1, 1, 1, 1,
1.741009, 1.114358, -0.7990219, 1, 1, 1, 1, 1,
1.761827, 0.990966, 2.746123, 1, 1, 1, 1, 1,
1.780474, 0.6766887, 0.06285156, 0, 0, 1, 1, 1,
1.790039, 0.2360621, -0.798009, 1, 0, 0, 1, 1,
1.79081, 2.81815, 1.115231, 1, 0, 0, 1, 1,
1.791144, 1.323151, 0.02277575, 1, 0, 0, 1, 1,
1.791581, -0.6975057, 0.914324, 1, 0, 0, 1, 1,
1.804072, -0.6647233, 1.450317, 1, 0, 0, 1, 1,
1.841944, -0.5423954, 2.521567, 0, 0, 0, 1, 1,
1.859338, -0.1514903, 1.299351, 0, 0, 0, 1, 1,
1.861055, -0.287553, 2.408358, 0, 0, 0, 1, 1,
1.869489, -0.7202938, 1.647381, 0, 0, 0, 1, 1,
1.878856, 0.00378225, 1.086013, 0, 0, 0, 1, 1,
1.893413, -0.154142, 0.5776423, 0, 0, 0, 1, 1,
1.896185, 0.01665475, 2.036406, 0, 0, 0, 1, 1,
1.904951, 0.3794416, 2.162715, 1, 1, 1, 1, 1,
1.907881, -1.008776, 1.955076, 1, 1, 1, 1, 1,
1.91534, 0.5112655, 1.161903, 1, 1, 1, 1, 1,
1.931403, -0.3704416, 0.3123074, 1, 1, 1, 1, 1,
1.937707, 1.116382, 1.061733, 1, 1, 1, 1, 1,
1.960535, 0.4466047, 2.179122, 1, 1, 1, 1, 1,
1.974259, 1.537799, -0.7748373, 1, 1, 1, 1, 1,
1.980926, -1.590434, 1.698562, 1, 1, 1, 1, 1,
2.002979, 0.00137354, 1.044142, 1, 1, 1, 1, 1,
2.023802, 0.7635424, 0.7386139, 1, 1, 1, 1, 1,
2.045169, 0.4051863, 1.12725, 1, 1, 1, 1, 1,
2.066457, 3.405475, 0.251658, 1, 1, 1, 1, 1,
2.092814, -0.6929333, 1.651832, 1, 1, 1, 1, 1,
2.09876, 0.3760897, 0.8754878, 1, 1, 1, 1, 1,
2.100194, 2.018938, 0.458175, 1, 1, 1, 1, 1,
2.113359, 1.463844, 0.5496253, 0, 0, 1, 1, 1,
2.117794, -0.7699404, 2.447648, 1, 0, 0, 1, 1,
2.131871, -0.8513342, 3.74828, 1, 0, 0, 1, 1,
2.134815, -1.687539, 0.2707029, 1, 0, 0, 1, 1,
2.15341, 1.362154, -0.1505796, 1, 0, 0, 1, 1,
2.159368, -0.2386993, 2.891949, 1, 0, 0, 1, 1,
2.223319, 0.3417312, 1.305064, 0, 0, 0, 1, 1,
2.224178, 0.5896785, 0.2615443, 0, 0, 0, 1, 1,
2.242002, -0.1984827, 2.850513, 0, 0, 0, 1, 1,
2.312213, 1.973935, -0.4977162, 0, 0, 0, 1, 1,
2.34242, -1.444199, 2.630313, 0, 0, 0, 1, 1,
2.409877, 0.5212499, 0.6663619, 0, 0, 0, 1, 1,
2.4349, 0.5532476, 0.9671849, 0, 0, 0, 1, 1,
2.449865, 0.3726474, 1.14434, 1, 1, 1, 1, 1,
2.454028, -0.3897579, 2.111343, 1, 1, 1, 1, 1,
2.481774, 0.94626, 0.9759882, 1, 1, 1, 1, 1,
2.590683, 2.111599, 0.808, 1, 1, 1, 1, 1,
2.645784, -0.1776574, 3.013897, 1, 1, 1, 1, 1,
2.822143, 1.032396, 1.196976, 1, 1, 1, 1, 1,
2.846752, 0.4089214, 0.3845417, 1, 1, 1, 1, 1
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
var radius = 9.516784;
var distance = 33.4273;
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
mvMatrix.translate( 0.1089348, -0.2191598, 0.1394899 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4273);
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