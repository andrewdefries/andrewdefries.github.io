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
-3.369051, 1.647568, -2.161887, 1, 0, 0, 1,
-3.158243, -0.1901912, -1.237722, 1, 0.007843138, 0, 1,
-2.865483, 1.880193, -0.4497622, 1, 0.01176471, 0, 1,
-2.834396, -0.72041, -1.554996, 1, 0.01960784, 0, 1,
-2.516526, 0.007537371, -2.06439, 1, 0.02352941, 0, 1,
-2.467993, 0.2000667, -0.736827, 1, 0.03137255, 0, 1,
-2.421682, 0.2848545, -1.208498, 1, 0.03529412, 0, 1,
-2.406045, -1.376051, -1.982355, 1, 0.04313726, 0, 1,
-2.385058, -0.2072132, -1.356542, 1, 0.04705882, 0, 1,
-2.346044, -1.961012, -1.878008, 1, 0.05490196, 0, 1,
-2.30807, 0.7199451, -2.372238, 1, 0.05882353, 0, 1,
-2.299449, -0.2438666, -1.470281, 1, 0.06666667, 0, 1,
-2.282737, -1.596595, -3.079759, 1, 0.07058824, 0, 1,
-2.276104, -0.3600973, -0.005516586, 1, 0.07843138, 0, 1,
-2.266498, 0.4947282, -0.8985577, 1, 0.08235294, 0, 1,
-2.23836, 0.9361631, -2.180568, 1, 0.09019608, 0, 1,
-2.183371, -0.4678091, -4.423429, 1, 0.09411765, 0, 1,
-2.108028, -1.554998, -3.926923, 1, 0.1019608, 0, 1,
-2.103346, -0.3653911, -1.926341, 1, 0.1098039, 0, 1,
-2.060227, -0.04277757, -2.045351, 1, 0.1137255, 0, 1,
-2.021832, 1.134573, -1.363398, 1, 0.1215686, 0, 1,
-1.998367, 1.029015, -2.513442, 1, 0.1254902, 0, 1,
-1.997375, 0.4784554, -0.8883964, 1, 0.1333333, 0, 1,
-1.937635, -1.771909, -0.0450465, 1, 0.1372549, 0, 1,
-1.936909, -0.4316438, 1.279306, 1, 0.145098, 0, 1,
-1.920838, 0.7707753, -1.653274, 1, 0.1490196, 0, 1,
-1.899801, -0.8085541, -2.890136, 1, 0.1568628, 0, 1,
-1.897541, -0.04534237, 1.402331, 1, 0.1607843, 0, 1,
-1.873032, -0.3473222, -0.4149944, 1, 0.1686275, 0, 1,
-1.847366, 0.8904799, -0.9291017, 1, 0.172549, 0, 1,
-1.837283, -0.5609076, -1.516807, 1, 0.1803922, 0, 1,
-1.777337, -1.4793, -1.423039, 1, 0.1843137, 0, 1,
-1.770966, 1.068168, 0.05733304, 1, 0.1921569, 0, 1,
-1.735668, 0.5113005, -0.2483151, 1, 0.1960784, 0, 1,
-1.733602, -2.203176, -2.99984, 1, 0.2039216, 0, 1,
-1.726863, 0.2757899, -2.272733, 1, 0.2117647, 0, 1,
-1.674861, 0.2444949, 0.09745765, 1, 0.2156863, 0, 1,
-1.663321, 0.3031322, -0.4673771, 1, 0.2235294, 0, 1,
-1.650702, -0.6597142, -3.95968, 1, 0.227451, 0, 1,
-1.632378, 0.417684, -1.864134, 1, 0.2352941, 0, 1,
-1.631734, -0.1883598, -0.8608916, 1, 0.2392157, 0, 1,
-1.628072, -0.212977, -2.73806, 1, 0.2470588, 0, 1,
-1.625891, 0.656145, -1.389, 1, 0.2509804, 0, 1,
-1.620017, -0.5257999, -1.614488, 1, 0.2588235, 0, 1,
-1.614868, 0.934698, -2.372011, 1, 0.2627451, 0, 1,
-1.60835, -1.189747, -2.518495, 1, 0.2705882, 0, 1,
-1.607033, 0.7434172, -1.321311, 1, 0.2745098, 0, 1,
-1.603067, 1.302277, -2.751442, 1, 0.282353, 0, 1,
-1.599327, 0.9957418, -0.8905617, 1, 0.2862745, 0, 1,
-1.596836, 1.485637, 1.258066, 1, 0.2941177, 0, 1,
-1.595905, 1.413345, -0.5103694, 1, 0.3019608, 0, 1,
-1.57836, -0.08524356, -0.2969571, 1, 0.3058824, 0, 1,
-1.55214, -0.6873624, -1.007399, 1, 0.3137255, 0, 1,
-1.534848, -1.197478, -0.8485084, 1, 0.3176471, 0, 1,
-1.522905, 0.4258079, -2.524612, 1, 0.3254902, 0, 1,
-1.520068, 0.1103739, -0.7538077, 1, 0.3294118, 0, 1,
-1.517766, -1.030652, -1.923592, 1, 0.3372549, 0, 1,
-1.440492, 1.203484, -0.5309783, 1, 0.3411765, 0, 1,
-1.439539, -0.6381654, -3.214843, 1, 0.3490196, 0, 1,
-1.431704, -0.3774864, -2.437522, 1, 0.3529412, 0, 1,
-1.423174, 1.69507, 0.007755634, 1, 0.3607843, 0, 1,
-1.421625, -0.6651188, -0.1693527, 1, 0.3647059, 0, 1,
-1.407177, 0.6375663, 0.03643106, 1, 0.372549, 0, 1,
-1.400216, -0.1000649, -1.527205, 1, 0.3764706, 0, 1,
-1.399734, -0.7031662, -2.24579, 1, 0.3843137, 0, 1,
-1.385148, 0.4185756, -0.9489626, 1, 0.3882353, 0, 1,
-1.36545, 0.7758419, -2.636525, 1, 0.3960784, 0, 1,
-1.36074, -0.3706527, -2.038255, 1, 0.4039216, 0, 1,
-1.356448, 2.099782, -1.036602, 1, 0.4078431, 0, 1,
-1.350271, 0.5362757, -1.095904, 1, 0.4156863, 0, 1,
-1.347338, 0.008994206, -2.004069, 1, 0.4196078, 0, 1,
-1.339836, -0.05741207, -0.6774487, 1, 0.427451, 0, 1,
-1.335876, -0.5506347, -3.154251, 1, 0.4313726, 0, 1,
-1.333033, 1.741369, -0.6749386, 1, 0.4392157, 0, 1,
-1.315813, 1.633201, 0.03810332, 1, 0.4431373, 0, 1,
-1.311631, 0.01564593, -2.441182, 1, 0.4509804, 0, 1,
-1.296403, 0.9115141, -0.952922, 1, 0.454902, 0, 1,
-1.289548, 1.210209, -1.015863, 1, 0.4627451, 0, 1,
-1.281658, 0.3802023, -0.9772689, 1, 0.4666667, 0, 1,
-1.267107, -0.09126192, -1.585282, 1, 0.4745098, 0, 1,
-1.266617, 0.3626018, 0.7240041, 1, 0.4784314, 0, 1,
-1.26564, 0.382112, -0.9510144, 1, 0.4862745, 0, 1,
-1.264091, -1.707924, -1.896084, 1, 0.4901961, 0, 1,
-1.260622, 1.013643, 0.3397325, 1, 0.4980392, 0, 1,
-1.256863, 0.1982882, -0.247189, 1, 0.5058824, 0, 1,
-1.25633, -0.9683081, -2.269155, 1, 0.509804, 0, 1,
-1.241711, 0.6662844, -1.997626, 1, 0.5176471, 0, 1,
-1.240949, -0.1223011, -3.887837, 1, 0.5215687, 0, 1,
-1.240149, -1.572298, -1.886836, 1, 0.5294118, 0, 1,
-1.229786, -0.03919354, -1.253245, 1, 0.5333334, 0, 1,
-1.226899, -0.9389832, -2.962116, 1, 0.5411765, 0, 1,
-1.224029, -1.087137, -2.462369, 1, 0.5450981, 0, 1,
-1.220662, -0.5223462, -3.604625, 1, 0.5529412, 0, 1,
-1.219983, 0.7611871, -2.051921, 1, 0.5568628, 0, 1,
-1.218441, -0.6810007, -2.013244, 1, 0.5647059, 0, 1,
-1.217305, -1.073507, -3.022156, 1, 0.5686275, 0, 1,
-1.200215, -2.510981, -2.07803, 1, 0.5764706, 0, 1,
-1.191754, 0.3268697, -3.073874, 1, 0.5803922, 0, 1,
-1.190922, -0.06543463, -1.155765, 1, 0.5882353, 0, 1,
-1.187542, 2.149371, -1.664611, 1, 0.5921569, 0, 1,
-1.186899, -0.04787384, -1.124526, 1, 0.6, 0, 1,
-1.186163, -2.766802, -2.268916, 1, 0.6078432, 0, 1,
-1.185286, 0.3791664, -0.4051172, 1, 0.6117647, 0, 1,
-1.180263, -0.3437482, -1.863708, 1, 0.6196079, 0, 1,
-1.179983, -1.001038, -1.672095, 1, 0.6235294, 0, 1,
-1.163564, 0.273643, -0.08498758, 1, 0.6313726, 0, 1,
-1.153977, -0.9137902, -3.324126, 1, 0.6352941, 0, 1,
-1.14906, -0.8860815, -3.778583, 1, 0.6431373, 0, 1,
-1.1397, -0.3681623, -2.399032, 1, 0.6470588, 0, 1,
-1.137979, 0.5810601, -1.91209, 1, 0.654902, 0, 1,
-1.131109, -0.2137881, -1.122848, 1, 0.6588235, 0, 1,
-1.118034, 0.3042748, -1.446159, 1, 0.6666667, 0, 1,
-1.113513, -2.041161, -3.619023, 1, 0.6705883, 0, 1,
-1.109992, -2.239443, -4.170394, 1, 0.6784314, 0, 1,
-1.109113, -2.789095, -2.985001, 1, 0.682353, 0, 1,
-1.107697, -0.6788402, -2.469305, 1, 0.6901961, 0, 1,
-1.107563, 0.1367034, -1.607183, 1, 0.6941177, 0, 1,
-1.10025, 2.049163, -1.861867, 1, 0.7019608, 0, 1,
-1.09628, 2.421183, 0.2687108, 1, 0.7098039, 0, 1,
-1.095783, 0.278488, -1.88938, 1, 0.7137255, 0, 1,
-1.092445, 0.7625533, -0.7676171, 1, 0.7215686, 0, 1,
-1.073364, -2.053833, -3.652364, 1, 0.7254902, 0, 1,
-1.072211, 0.4907426, -0.4385936, 1, 0.7333333, 0, 1,
-1.068147, 0.8340964, -1.932945, 1, 0.7372549, 0, 1,
-1.063846, 1.57519, -0.1797726, 1, 0.7450981, 0, 1,
-1.063479, -0.3988639, -2.457133, 1, 0.7490196, 0, 1,
-1.055752, 0.596729, 0.2784524, 1, 0.7568628, 0, 1,
-1.052549, -0.8756027, -2.433376, 1, 0.7607843, 0, 1,
-1.043933, -0.09630568, -1.838343, 1, 0.7686275, 0, 1,
-1.03969, -0.8160181, -1.828627, 1, 0.772549, 0, 1,
-1.03831, 2.029097, -0.9707996, 1, 0.7803922, 0, 1,
-1.037695, -1.637212, -2.079699, 1, 0.7843137, 0, 1,
-1.031903, -1.134364, -2.747698, 1, 0.7921569, 0, 1,
-1.024872, -0.5116852, -1.196605, 1, 0.7960784, 0, 1,
-1.024449, 1.341032, -0.04177765, 1, 0.8039216, 0, 1,
-1.022608, -0.8334752, -3.504151, 1, 0.8117647, 0, 1,
-1.021324, -0.8186176, -0.4587856, 1, 0.8156863, 0, 1,
-1.020638, -0.9630551, -3.279111, 1, 0.8235294, 0, 1,
-1.019829, 0.6910231, -0.9836541, 1, 0.827451, 0, 1,
-1.01448, 0.9959571, -0.5610999, 1, 0.8352941, 0, 1,
-1.010945, 0.1025292, -2.37096, 1, 0.8392157, 0, 1,
-1.006357, -1.591176, -3.360042, 1, 0.8470588, 0, 1,
-1.006314, 0.1847655, -1.997647, 1, 0.8509804, 0, 1,
-1.006107, 0.6794983, -0.7680131, 1, 0.8588235, 0, 1,
-1.000437, 0.7735323, -0.6661893, 1, 0.8627451, 0, 1,
-0.9986175, -0.2105787, -4.18922, 1, 0.8705882, 0, 1,
-0.9856281, 0.1668762, 0.05326222, 1, 0.8745098, 0, 1,
-0.9826501, 0.3676166, -0.3863283, 1, 0.8823529, 0, 1,
-0.9809912, 0.864472, -2.399606, 1, 0.8862745, 0, 1,
-0.9784851, -0.192499, -0.1246598, 1, 0.8941177, 0, 1,
-0.9779805, -1.202961, -1.962773, 1, 0.8980392, 0, 1,
-0.9773852, 0.7860012, -1.022923, 1, 0.9058824, 0, 1,
-0.9766102, -1.311331, -4.345387, 1, 0.9137255, 0, 1,
-0.970112, 0.4504617, -0.7346349, 1, 0.9176471, 0, 1,
-0.9621149, -0.499054, -1.526387, 1, 0.9254902, 0, 1,
-0.9480737, -0.4502345, -1.834186, 1, 0.9294118, 0, 1,
-0.9477164, -1.296857, -0.3648347, 1, 0.9372549, 0, 1,
-0.9451169, 0.8049593, -1.42287, 1, 0.9411765, 0, 1,
-0.9447051, -0.1055227, 0.5660315, 1, 0.9490196, 0, 1,
-0.9369201, 0.05283788, -2.331217, 1, 0.9529412, 0, 1,
-0.9359522, 0.7912172, -0.03882257, 1, 0.9607843, 0, 1,
-0.9319636, 1.417802, -0.1894019, 1, 0.9647059, 0, 1,
-0.9191944, -0.7255731, -2.861757, 1, 0.972549, 0, 1,
-0.9170528, -0.3952873, -2.452535, 1, 0.9764706, 0, 1,
-0.9146271, 0.2768731, -0.3600306, 1, 0.9843137, 0, 1,
-0.9131844, 0.6036913, -1.751472, 1, 0.9882353, 0, 1,
-0.91049, -0.0278041, -0.3711613, 1, 0.9960784, 0, 1,
-0.9096916, 0.3192442, -3.148577, 0.9960784, 1, 0, 1,
-0.9094259, -1.24512, -1.994973, 0.9921569, 1, 0, 1,
-0.905264, -1.324888, -4.837606, 0.9843137, 1, 0, 1,
-0.9052477, -1.110029, -2.694799, 0.9803922, 1, 0, 1,
-0.9034727, -1.439783, -2.207545, 0.972549, 1, 0, 1,
-0.9034267, 0.4517198, -0.1323123, 0.9686275, 1, 0, 1,
-0.9005316, 0.3123935, -0.8485298, 0.9607843, 1, 0, 1,
-0.8998954, -0.4814546, -1.894466, 0.9568627, 1, 0, 1,
-0.8996983, 0.6104212, -0.7626361, 0.9490196, 1, 0, 1,
-0.8984315, -1.323846, -1.222212, 0.945098, 1, 0, 1,
-0.8939101, -0.2263022, -0.2752804, 0.9372549, 1, 0, 1,
-0.8937072, -0.3566534, -2.090578, 0.9333333, 1, 0, 1,
-0.8884587, -1.302366, -2.478568, 0.9254902, 1, 0, 1,
-0.8849154, 0.0158867, -0.4327436, 0.9215686, 1, 0, 1,
-0.8752277, -0.432712, -0.4343376, 0.9137255, 1, 0, 1,
-0.8747377, -0.6123799, -2.577279, 0.9098039, 1, 0, 1,
-0.8699756, 0.2202793, -2.313068, 0.9019608, 1, 0, 1,
-0.8680914, 0.9200422, -1.294346, 0.8941177, 1, 0, 1,
-0.8625993, 1.470481, 1.257035, 0.8901961, 1, 0, 1,
-0.8607821, 0.3304492, -1.884321, 0.8823529, 1, 0, 1,
-0.859562, 0.3863417, -0.7428584, 0.8784314, 1, 0, 1,
-0.8588274, -0.6802722, -3.40806, 0.8705882, 1, 0, 1,
-0.8552635, -1.007022, -2.351845, 0.8666667, 1, 0, 1,
-0.8545675, -0.7988986, -3.368168, 0.8588235, 1, 0, 1,
-0.8544312, -0.5958139, -2.356262, 0.854902, 1, 0, 1,
-0.852598, -0.5980268, -2.291157, 0.8470588, 1, 0, 1,
-0.847025, -0.2740244, -2.700326, 0.8431373, 1, 0, 1,
-0.8464121, 1.898625, -1.15373, 0.8352941, 1, 0, 1,
-0.8408328, 0.9403807, -1.750518, 0.8313726, 1, 0, 1,
-0.8373637, -0.1560101, 0.8441406, 0.8235294, 1, 0, 1,
-0.8372297, -0.1866347, -2.925986, 0.8196079, 1, 0, 1,
-0.8369859, -0.08771385, -1.127493, 0.8117647, 1, 0, 1,
-0.8311898, -1.027397, -1.498157, 0.8078431, 1, 0, 1,
-0.8201026, 0.1254079, -0.571422, 0.8, 1, 0, 1,
-0.8172947, -0.2637625, -1.286966, 0.7921569, 1, 0, 1,
-0.8146545, 1.258011, -0.4592571, 0.7882353, 1, 0, 1,
-0.8097109, 0.8991188, -0.1422896, 0.7803922, 1, 0, 1,
-0.8072094, 0.7179191, -1.200173, 0.7764706, 1, 0, 1,
-0.8007574, 1.145333, -0.6279854, 0.7686275, 1, 0, 1,
-0.7958643, -0.6745003, -1.9717, 0.7647059, 1, 0, 1,
-0.7950298, -0.2310787, -0.604311, 0.7568628, 1, 0, 1,
-0.7883847, 0.4546361, -0.048023, 0.7529412, 1, 0, 1,
-0.7845922, -0.6133562, -2.304452, 0.7450981, 1, 0, 1,
-0.7840912, -1.15458, -3.01984, 0.7411765, 1, 0, 1,
-0.7832587, -1.181963, -3.096397, 0.7333333, 1, 0, 1,
-0.7811637, -1.365904, -2.162045, 0.7294118, 1, 0, 1,
-0.7799033, 0.2259856, -1.417999, 0.7215686, 1, 0, 1,
-0.779276, -0.9762173, -0.1201116, 0.7176471, 1, 0, 1,
-0.7779773, 0.1570891, -1.077487, 0.7098039, 1, 0, 1,
-0.7664853, -1.305, -4.373531, 0.7058824, 1, 0, 1,
-0.7648678, 0.3496841, -1.533666, 0.6980392, 1, 0, 1,
-0.7627988, 1.678523, -0.04472064, 0.6901961, 1, 0, 1,
-0.7589225, 0.9611602, 1.361093, 0.6862745, 1, 0, 1,
-0.7589142, 1.071262, 0.4344535, 0.6784314, 1, 0, 1,
-0.7546754, -2.362334, -1.825007, 0.6745098, 1, 0, 1,
-0.7510362, 0.1299044, -2.242502, 0.6666667, 1, 0, 1,
-0.7506919, 0.822183, -0.5546883, 0.6627451, 1, 0, 1,
-0.7503288, 0.2876535, -1.645701, 0.654902, 1, 0, 1,
-0.7503235, -1.554012, -2.457429, 0.6509804, 1, 0, 1,
-0.7413626, -0.2013518, -3.322582, 0.6431373, 1, 0, 1,
-0.7409055, 0.7196723, -1.350075, 0.6392157, 1, 0, 1,
-0.7378429, 0.436592, 0.5203751, 0.6313726, 1, 0, 1,
-0.7372081, -0.08505469, -2.932057, 0.627451, 1, 0, 1,
-0.726272, 0.5211799, -2.221774, 0.6196079, 1, 0, 1,
-0.7203974, -1.589636, -2.212973, 0.6156863, 1, 0, 1,
-0.7176928, -0.9328447, -2.147007, 0.6078432, 1, 0, 1,
-0.716513, -0.04851286, -1.489562, 0.6039216, 1, 0, 1,
-0.7164313, -0.5298639, -1.682834, 0.5960785, 1, 0, 1,
-0.7140267, -0.7522197, -2.856255, 0.5882353, 1, 0, 1,
-0.7100557, -0.3474783, -1.94625, 0.5843138, 1, 0, 1,
-0.7095417, -0.3987066, -2.259524, 0.5764706, 1, 0, 1,
-0.6985063, 1.185423, -0.4890585, 0.572549, 1, 0, 1,
-0.6906807, -0.974105, -0.7099465, 0.5647059, 1, 0, 1,
-0.6876963, -0.1403656, -1.778772, 0.5607843, 1, 0, 1,
-0.6876572, 0.3014191, -1.168856, 0.5529412, 1, 0, 1,
-0.6852568, 1.806633, 0.08755825, 0.5490196, 1, 0, 1,
-0.679593, 0.9195986, -1.64409, 0.5411765, 1, 0, 1,
-0.6769255, -0.3343466, -2.354312, 0.5372549, 1, 0, 1,
-0.6696373, 1.109987, -0.738344, 0.5294118, 1, 0, 1,
-0.6648443, -0.8431532, -1.556907, 0.5254902, 1, 0, 1,
-0.6635879, 0.8043239, 0.7382454, 0.5176471, 1, 0, 1,
-0.6629585, -0.7918668, -1.630065, 0.5137255, 1, 0, 1,
-0.6607903, -0.3246084, -1.108736, 0.5058824, 1, 0, 1,
-0.6590207, 0.4874046, -0.02350939, 0.5019608, 1, 0, 1,
-0.658959, 1.422546, -0.05484322, 0.4941176, 1, 0, 1,
-0.6497078, -0.7980717, -3.582977, 0.4862745, 1, 0, 1,
-0.6495471, -0.6321918, -1.436055, 0.4823529, 1, 0, 1,
-0.6494769, 0.7777556, -0.3374668, 0.4745098, 1, 0, 1,
-0.6490469, 1.071821, -2.083184, 0.4705882, 1, 0, 1,
-0.6489195, 0.877578, -2.450424, 0.4627451, 1, 0, 1,
-0.6467193, -0.1818487, -1.553373, 0.4588235, 1, 0, 1,
-0.6454875, -1.224684, -0.5623242, 0.4509804, 1, 0, 1,
-0.6373904, 1.416405, -1.382868, 0.4470588, 1, 0, 1,
-0.6363475, 0.9111367, -0.07738613, 0.4392157, 1, 0, 1,
-0.635151, -0.4071768, -2.612596, 0.4352941, 1, 0, 1,
-0.6337636, 1.281854, -0.9988607, 0.427451, 1, 0, 1,
-0.6321586, -0.1315232, -1.275, 0.4235294, 1, 0, 1,
-0.6278259, -2.06143, -1.719386, 0.4156863, 1, 0, 1,
-0.6270589, -0.2552306, -1.173733, 0.4117647, 1, 0, 1,
-0.6263663, 0.6011148, -1.029581, 0.4039216, 1, 0, 1,
-0.623686, 0.2577789, -0.7971594, 0.3960784, 1, 0, 1,
-0.6232097, -1.174672, -2.985573, 0.3921569, 1, 0, 1,
-0.6224656, -0.4128795, -2.346605, 0.3843137, 1, 0, 1,
-0.6216926, -2.360048, -3.412994, 0.3803922, 1, 0, 1,
-0.6205278, 1.354431, -1.566383, 0.372549, 1, 0, 1,
-0.618127, -0.5473912, -1.948129, 0.3686275, 1, 0, 1,
-0.6114887, 0.5576843, 0.2198946, 0.3607843, 1, 0, 1,
-0.6088775, 0.119216, -0.2673949, 0.3568628, 1, 0, 1,
-0.6071124, 0.9740609, -1.0393, 0.3490196, 1, 0, 1,
-0.6034942, 1.360183, -0.1548022, 0.345098, 1, 0, 1,
-0.6015067, -0.2189342, -0.5356415, 0.3372549, 1, 0, 1,
-0.6005274, 1.05685, 0.1589753, 0.3333333, 1, 0, 1,
-0.5978567, -0.3274982, -1.366629, 0.3254902, 1, 0, 1,
-0.5974064, -0.1548937, -2.097916, 0.3215686, 1, 0, 1,
-0.5870116, -0.4274988, -1.249183, 0.3137255, 1, 0, 1,
-0.5867342, -0.2969633, -3.233394, 0.3098039, 1, 0, 1,
-0.5865071, 0.4716366, -0.1120704, 0.3019608, 1, 0, 1,
-0.5813122, -0.211046, -1.461045, 0.2941177, 1, 0, 1,
-0.5787702, 0.5291277, -1.735182, 0.2901961, 1, 0, 1,
-0.5695453, -1.258356, -3.620958, 0.282353, 1, 0, 1,
-0.5690643, -0.4979889, -2.62418, 0.2784314, 1, 0, 1,
-0.5680381, -1.345595, -3.980053, 0.2705882, 1, 0, 1,
-0.5672961, -0.8471419, -3.301466, 0.2666667, 1, 0, 1,
-0.5647379, 0.2932089, 0.09518775, 0.2588235, 1, 0, 1,
-0.5613597, 1.5156, -1.27435, 0.254902, 1, 0, 1,
-0.5535353, 0.7184929, 2.528761, 0.2470588, 1, 0, 1,
-0.5511491, 1.568394, -0.07807114, 0.2431373, 1, 0, 1,
-0.5510938, -0.8902183, -2.102531, 0.2352941, 1, 0, 1,
-0.5506582, 0.3979873, -0.9780004, 0.2313726, 1, 0, 1,
-0.5441242, -2.0862, -2.506924, 0.2235294, 1, 0, 1,
-0.5428697, -0.2106015, -3.258263, 0.2196078, 1, 0, 1,
-0.5421985, 0.589259, -1.548628, 0.2117647, 1, 0, 1,
-0.5374247, -1.002951, -2.49714, 0.2078431, 1, 0, 1,
-0.5245522, -2.028219, -4.082642, 0.2, 1, 0, 1,
-0.5239405, 2.064348, 0.5035539, 0.1921569, 1, 0, 1,
-0.5235466, -0.529089, -4.679264, 0.1882353, 1, 0, 1,
-0.5177693, 0.9536155, -1.962129, 0.1803922, 1, 0, 1,
-0.5144169, -2.395314, -3.167423, 0.1764706, 1, 0, 1,
-0.5128775, 0.9013559, 0.9780743, 0.1686275, 1, 0, 1,
-0.5101709, 0.9878021, 0.2163522, 0.1647059, 1, 0, 1,
-0.5093839, -0.6345557, -3.164447, 0.1568628, 1, 0, 1,
-0.5092678, -1.757767, -2.586468, 0.1529412, 1, 0, 1,
-0.5092425, -0.06655198, 0.00918552, 0.145098, 1, 0, 1,
-0.5067826, -1.631051, -2.714973, 0.1411765, 1, 0, 1,
-0.5066588, -0.987688, -2.238237, 0.1333333, 1, 0, 1,
-0.5063723, 0.5791484, 0.5036382, 0.1294118, 1, 0, 1,
-0.5059341, 0.04019341, -1.419515, 0.1215686, 1, 0, 1,
-0.5054798, -0.8326667, -3.643734, 0.1176471, 1, 0, 1,
-0.5053302, -1.007683, -2.193606, 0.1098039, 1, 0, 1,
-0.5032786, -1.290873, -2.720105, 0.1058824, 1, 0, 1,
-0.5031596, -0.9130527, -1.751905, 0.09803922, 1, 0, 1,
-0.5010532, -0.9208587, -3.724056, 0.09019608, 1, 0, 1,
-0.499762, -0.4634804, -3.377066, 0.08627451, 1, 0, 1,
-0.4955448, 1.417637, -1.097414, 0.07843138, 1, 0, 1,
-0.4924509, 0.3188162, -0.8977653, 0.07450981, 1, 0, 1,
-0.4887947, -0.3497544, -2.566501, 0.06666667, 1, 0, 1,
-0.4881435, 2.098456, -1.817383, 0.0627451, 1, 0, 1,
-0.4868177, 0.77213, 1.164319, 0.05490196, 1, 0, 1,
-0.4865383, 1.866324, 0.07363533, 0.05098039, 1, 0, 1,
-0.4842478, -0.8557739, -2.209579, 0.04313726, 1, 0, 1,
-0.48042, -1.878168, -1.82137, 0.03921569, 1, 0, 1,
-0.4779404, 0.9097391, -0.5779943, 0.03137255, 1, 0, 1,
-0.4756714, 0.1479021, -1.805011, 0.02745098, 1, 0, 1,
-0.4741233, 0.07899789, -0.5587512, 0.01960784, 1, 0, 1,
-0.4735903, -0.402171, -2.574157, 0.01568628, 1, 0, 1,
-0.47341, -0.1123074, -0.8104293, 0.007843138, 1, 0, 1,
-0.4726995, -1.466713, -2.35177, 0.003921569, 1, 0, 1,
-0.469927, -0.5932276, -1.968983, 0, 1, 0.003921569, 1,
-0.4684597, -0.2105145, -2.786112, 0, 1, 0.01176471, 1,
-0.4682296, 0.3315516, -1.515057, 0, 1, 0.01568628, 1,
-0.4679188, -0.3908264, -2.57184, 0, 1, 0.02352941, 1,
-0.4660871, -1.161712, -2.308052, 0, 1, 0.02745098, 1,
-0.4655539, 1.642864, 2.162394, 0, 1, 0.03529412, 1,
-0.4561746, 0.1477597, -1.489676, 0, 1, 0.03921569, 1,
-0.4541174, 0.5664361, -0.3663096, 0, 1, 0.04705882, 1,
-0.452177, -0.5284878, -1.36659, 0, 1, 0.05098039, 1,
-0.4507976, 0.1852902, -3.258669, 0, 1, 0.05882353, 1,
-0.4487855, -0.7337922, -2.164765, 0, 1, 0.0627451, 1,
-0.4423174, -0.715744, -4.374047, 0, 1, 0.07058824, 1,
-0.4406382, 0.1033498, 0.24953, 0, 1, 0.07450981, 1,
-0.4402152, -0.4288555, -2.591074, 0, 1, 0.08235294, 1,
-0.4215541, -0.2337057, -1.756147, 0, 1, 0.08627451, 1,
-0.4178358, 0.008913165, -1.806613, 0, 1, 0.09411765, 1,
-0.417413, 1.316874, -0.849403, 0, 1, 0.1019608, 1,
-0.4149867, -1.28953, -4.231639, 0, 1, 0.1058824, 1,
-0.414183, 0.1784943, -1.456725, 0, 1, 0.1137255, 1,
-0.4126208, 0.4631909, -0.6466836, 0, 1, 0.1176471, 1,
-0.4095098, 0.3133979, -0.9510819, 0, 1, 0.1254902, 1,
-0.4081576, -0.5569186, -2.318783, 0, 1, 0.1294118, 1,
-0.4056276, -0.7406086, -2.291672, 0, 1, 0.1372549, 1,
-0.4046683, -0.9915095, -3.318312, 0, 1, 0.1411765, 1,
-0.4018327, -0.7479854, -2.290093, 0, 1, 0.1490196, 1,
-0.3997234, 0.1238961, 0.64901, 0, 1, 0.1529412, 1,
-0.3967746, 0.2741417, -1.102514, 0, 1, 0.1607843, 1,
-0.3951312, 0.3053637, -0.7397491, 0, 1, 0.1647059, 1,
-0.3946135, -0.6614642, -4.135262, 0, 1, 0.172549, 1,
-0.3941868, -0.8209252, -3.791397, 0, 1, 0.1764706, 1,
-0.389897, -0.3128279, -0.1811737, 0, 1, 0.1843137, 1,
-0.3876087, 0.1713716, -2.315379, 0, 1, 0.1882353, 1,
-0.382697, 0.005228764, -0.2308656, 0, 1, 0.1960784, 1,
-0.3770362, 0.05724411, 0.7267397, 0, 1, 0.2039216, 1,
-0.3758166, -1.563348, -3.451088, 0, 1, 0.2078431, 1,
-0.3740323, -0.9464102, -0.3786123, 0, 1, 0.2156863, 1,
-0.3736412, -0.6806688, -3.830316, 0, 1, 0.2196078, 1,
-0.3732952, -1.093733, -3.533829, 0, 1, 0.227451, 1,
-0.3730349, 0.8833762, -2.557674, 0, 1, 0.2313726, 1,
-0.3726311, -1.20624, -3.511954, 0, 1, 0.2392157, 1,
-0.3681874, -1.073328, -4.218724, 0, 1, 0.2431373, 1,
-0.3681599, 0.4237852, -1.357262, 0, 1, 0.2509804, 1,
-0.3669299, 0.5580408, -0.003115731, 0, 1, 0.254902, 1,
-0.3653002, -1.802364, -2.821618, 0, 1, 0.2627451, 1,
-0.3610736, -0.6489553, -2.818429, 0, 1, 0.2666667, 1,
-0.3606604, -1.050305, -4.200886, 0, 1, 0.2745098, 1,
-0.3603468, 0.07985792, -0.9256509, 0, 1, 0.2784314, 1,
-0.3583764, 0.8873293, -1.169, 0, 1, 0.2862745, 1,
-0.3554967, -0.1275614, -1.301817, 0, 1, 0.2901961, 1,
-0.3512114, -0.2257216, -1.313001, 0, 1, 0.2980392, 1,
-0.3508898, -0.1783705, -1.208676, 0, 1, 0.3058824, 1,
-0.3497289, -1.088476, -1.861662, 0, 1, 0.3098039, 1,
-0.346089, -0.4634871, -3.083567, 0, 1, 0.3176471, 1,
-0.3450591, -0.7498046, -2.390422, 0, 1, 0.3215686, 1,
-0.3444461, -0.7405252, -1.007412, 0, 1, 0.3294118, 1,
-0.3433168, -0.3447397, -2.317259, 0, 1, 0.3333333, 1,
-0.3420746, 1.611069, -0.009206025, 0, 1, 0.3411765, 1,
-0.341017, -0.7938602, -5.062002, 0, 1, 0.345098, 1,
-0.3373242, -0.9155873, -3.724395, 0, 1, 0.3529412, 1,
-0.3281172, 0.6164652, 0.2323368, 0, 1, 0.3568628, 1,
-0.3250163, -0.9768363, -3.701457, 0, 1, 0.3647059, 1,
-0.324294, 0.7207058, -0.5750073, 0, 1, 0.3686275, 1,
-0.3189299, 2.281262, 1.118412, 0, 1, 0.3764706, 1,
-0.3149583, 0.9197783, -0.5118967, 0, 1, 0.3803922, 1,
-0.3139428, -1.210215, -3.030236, 0, 1, 0.3882353, 1,
-0.3101169, 0.7196491, -0.494364, 0, 1, 0.3921569, 1,
-0.304967, -0.2659847, -2.648872, 0, 1, 0.4, 1,
-0.295225, 0.9192411, 0.6153413, 0, 1, 0.4078431, 1,
-0.2913429, 0.9892488, 1.073929, 0, 1, 0.4117647, 1,
-0.2904553, 2.563023, 0.03050773, 0, 1, 0.4196078, 1,
-0.2897945, 0.3846712, -0.7028272, 0, 1, 0.4235294, 1,
-0.2879126, 0.3701313, 0.4564141, 0, 1, 0.4313726, 1,
-0.2870553, 0.5518573, -0.8259927, 0, 1, 0.4352941, 1,
-0.2851878, -0.3495728, -4.227467, 0, 1, 0.4431373, 1,
-0.2831231, 1.347806, 0.3256663, 0, 1, 0.4470588, 1,
-0.2796077, -0.765669, -1.789035, 0, 1, 0.454902, 1,
-0.2739561, 0.9294924, -0.959231, 0, 1, 0.4588235, 1,
-0.2639032, -1.666006, -1.436699, 0, 1, 0.4666667, 1,
-0.2638346, 0.381071, -1.753008, 0, 1, 0.4705882, 1,
-0.2628765, -0.2189405, -2.150354, 0, 1, 0.4784314, 1,
-0.2624092, 0.2876908, -0.4172094, 0, 1, 0.4823529, 1,
-0.2622156, -1.889668, -2.864883, 0, 1, 0.4901961, 1,
-0.2620767, 0.2864209, -1.047405, 0, 1, 0.4941176, 1,
-0.2613512, -0.5769324, -2.525501, 0, 1, 0.5019608, 1,
-0.2581098, -2.868782, -5.250681, 0, 1, 0.509804, 1,
-0.2550785, -1.095354, -3.118675, 0, 1, 0.5137255, 1,
-0.2546229, 0.8774112, -1.724574, 0, 1, 0.5215687, 1,
-0.2492407, 0.06445175, -1.287298, 0, 1, 0.5254902, 1,
-0.2464236, 1.124043, -2.072159, 0, 1, 0.5333334, 1,
-0.2421358, 0.9927039, -0.4530696, 0, 1, 0.5372549, 1,
-0.2391331, -0.134116, -1.145298, 0, 1, 0.5450981, 1,
-0.2387884, 1.741341, 0.1363148, 0, 1, 0.5490196, 1,
-0.2370881, -1.681904, -3.309284, 0, 1, 0.5568628, 1,
-0.2361379, -0.3581537, -2.560702, 0, 1, 0.5607843, 1,
-0.2338462, -0.06832501, -2.276653, 0, 1, 0.5686275, 1,
-0.2225033, 2.077675, 0.5161427, 0, 1, 0.572549, 1,
-0.2222881, 0.6504594, -0.7682858, 0, 1, 0.5803922, 1,
-0.2187517, -0.03877054, -0.7809943, 0, 1, 0.5843138, 1,
-0.2160842, -0.4725447, -1.587688, 0, 1, 0.5921569, 1,
-0.2146677, -1.021357, -4.112655, 0, 1, 0.5960785, 1,
-0.1983935, -0.4922186, -3.407698, 0, 1, 0.6039216, 1,
-0.1943337, 0.3449667, -1.676577, 0, 1, 0.6117647, 1,
-0.1933081, -1.587412, -1.348905, 0, 1, 0.6156863, 1,
-0.1919926, 2.471094, 0.4106408, 0, 1, 0.6235294, 1,
-0.1918795, 1.032987, -0.1515413, 0, 1, 0.627451, 1,
-0.1877652, 1.271807, -0.08559716, 0, 1, 0.6352941, 1,
-0.1709687, -0.3312895, -1.866465, 0, 1, 0.6392157, 1,
-0.1707106, -1.353658, -2.178515, 0, 1, 0.6470588, 1,
-0.1695955, 1.157706, 0.005421509, 0, 1, 0.6509804, 1,
-0.166926, -0.5604025, -2.360428, 0, 1, 0.6588235, 1,
-0.1651147, 0.2919695, -1.146334, 0, 1, 0.6627451, 1,
-0.164813, -0.4474297, -2.271143, 0, 1, 0.6705883, 1,
-0.1637549, -0.3281288, -4.423523, 0, 1, 0.6745098, 1,
-0.1615337, 1.316918, 0.5791174, 0, 1, 0.682353, 1,
-0.1540657, 1.559227, 1.395581, 0, 1, 0.6862745, 1,
-0.1473661, -0.8069823, -3.04291, 0, 1, 0.6941177, 1,
-0.1428275, 1.958313, 0.488633, 0, 1, 0.7019608, 1,
-0.1404772, 0.6505988, 0.8500078, 0, 1, 0.7058824, 1,
-0.1396928, 0.1627399, -1.29511, 0, 1, 0.7137255, 1,
-0.1392588, -1.179165, -1.892603, 0, 1, 0.7176471, 1,
-0.1373754, -0.01851592, -0.7680862, 0, 1, 0.7254902, 1,
-0.1359646, 0.442232, -1.899914, 0, 1, 0.7294118, 1,
-0.1358676, 1.609062, 0.1078293, 0, 1, 0.7372549, 1,
-0.1354807, 1.114128, -0.3314412, 0, 1, 0.7411765, 1,
-0.1353958, 1.129302, -1.232057, 0, 1, 0.7490196, 1,
-0.1319971, 0.3185091, -0.117039, 0, 1, 0.7529412, 1,
-0.129471, -1.279839, -0.9419674, 0, 1, 0.7607843, 1,
-0.1268199, -0.1892559, -2.75251, 0, 1, 0.7647059, 1,
-0.1223099, 0.3543461, -0.9763707, 0, 1, 0.772549, 1,
-0.1221515, -1.134495, -4.21914, 0, 1, 0.7764706, 1,
-0.1198179, 0.7170549, -1.322796, 0, 1, 0.7843137, 1,
-0.1159373, -1.718454, -3.462241, 0, 1, 0.7882353, 1,
-0.1127096, -0.2934239, -2.799942, 0, 1, 0.7960784, 1,
-0.1092619, -0.8740343, -1.357876, 0, 1, 0.8039216, 1,
-0.09942837, 0.6864058, 0.5440548, 0, 1, 0.8078431, 1,
-0.09597342, -2.003357, -3.0117, 0, 1, 0.8156863, 1,
-0.09498915, 0.006812964, -1.523558, 0, 1, 0.8196079, 1,
-0.09084529, -0.05593979, 0.08069295, 0, 1, 0.827451, 1,
-0.08611035, -0.8435932, -4.271084, 0, 1, 0.8313726, 1,
-0.08481335, 0.4868013, -0.7674449, 0, 1, 0.8392157, 1,
-0.07917468, -1.022124, -3.971995, 0, 1, 0.8431373, 1,
-0.07869907, 0.904447, 1.298566, 0, 1, 0.8509804, 1,
-0.07336839, -1.549893, -1.805878, 0, 1, 0.854902, 1,
-0.07241301, -0.2189345, -3.656212, 0, 1, 0.8627451, 1,
-0.07086567, 0.455464, -0.1818412, 0, 1, 0.8666667, 1,
-0.0640565, -1.302345, -0.6817172, 0, 1, 0.8745098, 1,
-0.06386951, 0.3153527, -1.756844, 0, 1, 0.8784314, 1,
-0.06229001, -0.7803829, -2.459902, 0, 1, 0.8862745, 1,
-0.05846915, -0.05429262, -2.528875, 0, 1, 0.8901961, 1,
-0.05523243, 0.007801556, -3.191936, 0, 1, 0.8980392, 1,
-0.05379914, 0.5735061, -0.4380344, 0, 1, 0.9058824, 1,
-0.05035011, 0.1184837, 0.1105739, 0, 1, 0.9098039, 1,
-0.04791909, 0.5593461, -0.1785075, 0, 1, 0.9176471, 1,
-0.04716043, 0.2961752, 0.2603409, 0, 1, 0.9215686, 1,
-0.04564139, -0.1649917, -3.374856, 0, 1, 0.9294118, 1,
-0.04507179, -0.5634967, -4.37664, 0, 1, 0.9333333, 1,
-0.04487264, 0.5791188, -0.3407971, 0, 1, 0.9411765, 1,
-0.04385591, -0.1902635, -1.896069, 0, 1, 0.945098, 1,
-0.04295664, -0.3029403, -4.716423, 0, 1, 0.9529412, 1,
-0.04104982, -0.1875228, -3.437199, 0, 1, 0.9568627, 1,
-0.03988587, 0.7420259, 0.9316995, 0, 1, 0.9647059, 1,
-0.0306364, 0.4632493, 0.5486857, 0, 1, 0.9686275, 1,
-0.02985642, 0.6486716, -0.3688019, 0, 1, 0.9764706, 1,
-0.02812392, 2.403199, 1.721257, 0, 1, 0.9803922, 1,
-0.02597035, 0.2129204, 1.042008, 0, 1, 0.9882353, 1,
-0.02118081, -0.4427241, -3.650474, 0, 1, 0.9921569, 1,
-0.01813868, 0.9874511, 1.756571, 0, 1, 1, 1,
-0.01393537, 0.3478277, 1.069755, 0, 0.9921569, 1, 1,
-0.004182255, -1.174081, -3.859798, 0, 0.9882353, 1, 1,
0.0009628069, -0.656824, 1.779178, 0, 0.9803922, 1, 1,
0.002369868, 0.1846779, -0.3440709, 0, 0.9764706, 1, 1,
0.004869044, 0.5070906, 1.230766, 0, 0.9686275, 1, 1,
0.005425386, 0.3184876, 0.1528166, 0, 0.9647059, 1, 1,
0.01266677, -0.989188, 2.416678, 0, 0.9568627, 1, 1,
0.0129739, -0.5346466, 2.443704, 0, 0.9529412, 1, 1,
0.01330773, 0.5965032, 0.2049142, 0, 0.945098, 1, 1,
0.02073774, -1.479329, 2.146093, 0, 0.9411765, 1, 1,
0.02620783, -1.137342, 3.983284, 0, 0.9333333, 1, 1,
0.02674931, 0.4366455, 0.2741018, 0, 0.9294118, 1, 1,
0.02865265, -0.6263467, 2.692141, 0, 0.9215686, 1, 1,
0.02884788, -0.05228908, 2.26965, 0, 0.9176471, 1, 1,
0.03205537, -0.6500555, 1.905592, 0, 0.9098039, 1, 1,
0.03280757, -0.773726, 2.299183, 0, 0.9058824, 1, 1,
0.03316995, -0.3978848, 1.670164, 0, 0.8980392, 1, 1,
0.03412775, -0.2631471, 3.179185, 0, 0.8901961, 1, 1,
0.03842785, 1.238983, -0.01215088, 0, 0.8862745, 1, 1,
0.04107524, -0.4824908, 2.671287, 0, 0.8784314, 1, 1,
0.04179195, -0.9547614, 2.617876, 0, 0.8745098, 1, 1,
0.04361188, -0.4071501, 3.80103, 0, 0.8666667, 1, 1,
0.04366126, -2.094775, 3.298377, 0, 0.8627451, 1, 1,
0.04468421, -0.4369825, 3.724531, 0, 0.854902, 1, 1,
0.04480722, 1.052357, -0.3015803, 0, 0.8509804, 1, 1,
0.0460461, 0.5580447, 0.6419193, 0, 0.8431373, 1, 1,
0.05073416, 0.4811461, 0.5655407, 0, 0.8392157, 1, 1,
0.0536606, -1.814882, 2.692817, 0, 0.8313726, 1, 1,
0.06050902, -0.7236294, 2.227088, 0, 0.827451, 1, 1,
0.06256241, -1.545989, 2.32609, 0, 0.8196079, 1, 1,
0.06422942, 0.2739421, 0.8310794, 0, 0.8156863, 1, 1,
0.06509045, 0.5347391, 0.6201284, 0, 0.8078431, 1, 1,
0.06516305, -1.447636, 1.974557, 0, 0.8039216, 1, 1,
0.06523456, -1.821215, 3.265002, 0, 0.7960784, 1, 1,
0.06584065, 1.39278, -0.8379764, 0, 0.7882353, 1, 1,
0.06721297, -0.7909504, 4.610292, 0, 0.7843137, 1, 1,
0.07001331, 1.341047, -0.8924949, 0, 0.7764706, 1, 1,
0.07014713, 0.85963, -0.6031098, 0, 0.772549, 1, 1,
0.0709653, 0.3904922, -1.466539, 0, 0.7647059, 1, 1,
0.07197598, -0.8720721, 3.193769, 0, 0.7607843, 1, 1,
0.07428765, -0.4507462, 4.428287, 0, 0.7529412, 1, 1,
0.07588679, 0.152808, 1.727806, 0, 0.7490196, 1, 1,
0.08263708, -0.2079049, 3.154649, 0, 0.7411765, 1, 1,
0.08457661, 0.4196269, 0.1348533, 0, 0.7372549, 1, 1,
0.08459286, -0.2812969, 2.549962, 0, 0.7294118, 1, 1,
0.08492908, 0.1904616, -0.6337746, 0, 0.7254902, 1, 1,
0.08591345, 0.6842844, -0.9609789, 0, 0.7176471, 1, 1,
0.08687692, 2.279155, 0.40659, 0, 0.7137255, 1, 1,
0.09171654, 0.9439566, 0.32572, 0, 0.7058824, 1, 1,
0.102255, 0.2529238, 1.926225, 0, 0.6980392, 1, 1,
0.1071962, -0.1660528, 3.79441, 0, 0.6941177, 1, 1,
0.1097736, -1.260273, 4.368379, 0, 0.6862745, 1, 1,
0.1101315, -0.9824808, 3.898316, 0, 0.682353, 1, 1,
0.1116266, 0.9574941, 1.071328, 0, 0.6745098, 1, 1,
0.1286264, 0.7056545, 0.1591246, 0, 0.6705883, 1, 1,
0.1304438, 1.863832, 1.446916, 0, 0.6627451, 1, 1,
0.1309117, 0.8559327, -0.3189497, 0, 0.6588235, 1, 1,
0.1315535, -1.131781, 1.369303, 0, 0.6509804, 1, 1,
0.1332587, 0.6935948, -0.1506031, 0, 0.6470588, 1, 1,
0.1356436, -0.3879197, 2.229387, 0, 0.6392157, 1, 1,
0.1414805, -1.922167, 3.503382, 0, 0.6352941, 1, 1,
0.1430711, 0.5056779, 0.6312349, 0, 0.627451, 1, 1,
0.1450258, -0.9653805, 1.687818, 0, 0.6235294, 1, 1,
0.1497056, 0.205108, 1.826428, 0, 0.6156863, 1, 1,
0.1510489, -1.013724, 0.9521073, 0, 0.6117647, 1, 1,
0.1517823, -1.604224, 2.300534, 0, 0.6039216, 1, 1,
0.160299, 0.5118783, -1.14411, 0, 0.5960785, 1, 1,
0.16061, 0.3327285, 0.510481, 0, 0.5921569, 1, 1,
0.1614663, 1.077046, 0.6039162, 0, 0.5843138, 1, 1,
0.1636726, -0.608084, 2.028581, 0, 0.5803922, 1, 1,
0.1659179, 1.348802, 0.1772631, 0, 0.572549, 1, 1,
0.1686354, -1.425732, 2.344128, 0, 0.5686275, 1, 1,
0.1696396, 1.335981, 2.486527, 0, 0.5607843, 1, 1,
0.1712197, 0.1960006, 1.119915, 0, 0.5568628, 1, 1,
0.1737522, 1.027165, 0.08576052, 0, 0.5490196, 1, 1,
0.1786216, -1.217788, 1.155614, 0, 0.5450981, 1, 1,
0.1801583, 0.5794869, 0.595348, 0, 0.5372549, 1, 1,
0.1812034, -2.098355, 1.192918, 0, 0.5333334, 1, 1,
0.1826414, -0.7878838, 2.419684, 0, 0.5254902, 1, 1,
0.1848075, 1.71603, -0.07165702, 0, 0.5215687, 1, 1,
0.1874121, 1.614346, 0.2266654, 0, 0.5137255, 1, 1,
0.1902605, 1.051708, 0.5131075, 0, 0.509804, 1, 1,
0.1930759, -1.400863, 3.303389, 0, 0.5019608, 1, 1,
0.2025099, 0.8472263, 0.4230948, 0, 0.4941176, 1, 1,
0.2072599, 0.4416239, 1.910871, 0, 0.4901961, 1, 1,
0.2142978, -1.296675, 3.239735, 0, 0.4823529, 1, 1,
0.216945, -0.400297, 1.853425, 0, 0.4784314, 1, 1,
0.2173137, 0.5906973, -0.02937603, 0, 0.4705882, 1, 1,
0.2229002, 0.3975641, 0.5869688, 0, 0.4666667, 1, 1,
0.2235352, -0.5429159, 3.187519, 0, 0.4588235, 1, 1,
0.2290355, -2.189333, 2.688055, 0, 0.454902, 1, 1,
0.2301049, -0.9889838, 1.930069, 0, 0.4470588, 1, 1,
0.2322039, -0.185271, 1.145669, 0, 0.4431373, 1, 1,
0.2328503, 0.9607546, -0.3157877, 0, 0.4352941, 1, 1,
0.2336399, -0.7484567, 2.67612, 0, 0.4313726, 1, 1,
0.23366, -0.6874912, 2.516617, 0, 0.4235294, 1, 1,
0.2347696, -1.095434, 3.933066, 0, 0.4196078, 1, 1,
0.2352519, 0.14817, 1.47506, 0, 0.4117647, 1, 1,
0.2355805, 1.428865, 0.4068036, 0, 0.4078431, 1, 1,
0.2375676, -1.513546, 5.880362, 0, 0.4, 1, 1,
0.2383789, 1.525619, 1.280072, 0, 0.3921569, 1, 1,
0.2427991, -0.860849, 2.936881, 0, 0.3882353, 1, 1,
0.2454144, 0.2030509, -0.6136029, 0, 0.3803922, 1, 1,
0.2463535, 0.8255079, 0.3543235, 0, 0.3764706, 1, 1,
0.2496822, 0.332649, -0.01812532, 0, 0.3686275, 1, 1,
0.2503489, 0.6276335, 0.9361231, 0, 0.3647059, 1, 1,
0.2549911, 0.6893873, 1.449958, 0, 0.3568628, 1, 1,
0.2577471, -0.7018116, 2.668999, 0, 0.3529412, 1, 1,
0.2653869, -2.438136, 3.436193, 0, 0.345098, 1, 1,
0.2670456, -0.6728554, 3.053746, 0, 0.3411765, 1, 1,
0.2677547, -0.3920811, 3.826549, 0, 0.3333333, 1, 1,
0.2687113, 0.05242559, 3.184164, 0, 0.3294118, 1, 1,
0.2725938, 1.475988, 0.2959995, 0, 0.3215686, 1, 1,
0.2730682, 1.364656, -0.97727, 0, 0.3176471, 1, 1,
0.2744186, -1.499138, 3.997504, 0, 0.3098039, 1, 1,
0.2745348, -0.05907154, 1.935132, 0, 0.3058824, 1, 1,
0.2765125, -0.9875826, 3.954365, 0, 0.2980392, 1, 1,
0.2780753, 0.3491934, 0.2879167, 0, 0.2901961, 1, 1,
0.2804999, 1.427278, -0.07994735, 0, 0.2862745, 1, 1,
0.2814308, 0.3371369, 2.217119, 0, 0.2784314, 1, 1,
0.2816079, 0.7762062, -1.51468, 0, 0.2745098, 1, 1,
0.2872518, 1.188077, 0.0764973, 0, 0.2666667, 1, 1,
0.2921412, -0.9232575, 3.231826, 0, 0.2627451, 1, 1,
0.2935904, -0.06795547, 3.271513, 0, 0.254902, 1, 1,
0.2999705, 1.997092, -0.2497881, 0, 0.2509804, 1, 1,
0.3007339, -0.4365089, 2.106152, 0, 0.2431373, 1, 1,
0.3025174, -0.3447684, 1.264757, 0, 0.2392157, 1, 1,
0.3063813, -0.3733687, 2.65049, 0, 0.2313726, 1, 1,
0.3064676, -0.9832118, 2.476858, 0, 0.227451, 1, 1,
0.3081183, -0.06344825, 1.869475, 0, 0.2196078, 1, 1,
0.3112765, 0.3157163, 1.554411, 0, 0.2156863, 1, 1,
0.3142962, -0.9486148, 2.743328, 0, 0.2078431, 1, 1,
0.3154277, -0.8506954, 1.263917, 0, 0.2039216, 1, 1,
0.3167928, 0.00544667, 0.6828763, 0, 0.1960784, 1, 1,
0.3193319, -1.564896, 2.415109, 0, 0.1882353, 1, 1,
0.3277341, -0.7011809, 4.604143, 0, 0.1843137, 1, 1,
0.3331577, 0.817636, -0.2200567, 0, 0.1764706, 1, 1,
0.3362749, -0.2642506, 2.662156, 0, 0.172549, 1, 1,
0.3374861, -0.1255642, 0.6562814, 0, 0.1647059, 1, 1,
0.3380227, -0.6067587, 3.213609, 0, 0.1607843, 1, 1,
0.3387741, -0.04201716, 3.035199, 0, 0.1529412, 1, 1,
0.3408332, 0.01541735, 2.398613, 0, 0.1490196, 1, 1,
0.3415923, -1.202578, 2.598659, 0, 0.1411765, 1, 1,
0.3472741, 0.126138, 0.07334623, 0, 0.1372549, 1, 1,
0.3537814, 0.6276389, -0.8270481, 0, 0.1294118, 1, 1,
0.3586882, 0.6720836, 0.4352855, 0, 0.1254902, 1, 1,
0.3665525, 1.023345, 1.834716, 0, 0.1176471, 1, 1,
0.3690736, -0.3178154, 2.437863, 0, 0.1137255, 1, 1,
0.3707529, -0.6568965, 3.828998, 0, 0.1058824, 1, 1,
0.3778434, 0.1733934, 1.00129, 0, 0.09803922, 1, 1,
0.3849365, 1.582419, 0.8822676, 0, 0.09411765, 1, 1,
0.3854974, -0.8389202, 5.063607, 0, 0.08627451, 1, 1,
0.3883342, 2.741459, 0.6025257, 0, 0.08235294, 1, 1,
0.3884803, 0.2991477, 1.928903, 0, 0.07450981, 1, 1,
0.3890387, -0.4725275, 2.164141, 0, 0.07058824, 1, 1,
0.3912291, -0.1913766, 2.763121, 0, 0.0627451, 1, 1,
0.3971242, -1.36951, 4.136609, 0, 0.05882353, 1, 1,
0.4003302, -0.05949173, 0.4579592, 0, 0.05098039, 1, 1,
0.4020836, -1.076042, 3.835064, 0, 0.04705882, 1, 1,
0.4037558, -1.254689, 1.646629, 0, 0.03921569, 1, 1,
0.4051368, -2.642143, 3.926207, 0, 0.03529412, 1, 1,
0.4052172, 0.3138863, 0.8241923, 0, 0.02745098, 1, 1,
0.4172032, 0.5591386, 0.9223877, 0, 0.02352941, 1, 1,
0.4179432, 0.2088959, 1.053958, 0, 0.01568628, 1, 1,
0.4194513, 0.5934935, 1.255058, 0, 0.01176471, 1, 1,
0.4219597, -0.9853425, 4.949621, 0, 0.003921569, 1, 1,
0.4220452, -1.291646, 3.092274, 0.003921569, 0, 1, 1,
0.4227865, -0.4529516, 1.923069, 0.007843138, 0, 1, 1,
0.4229288, -0.3156303, 2.872995, 0.01568628, 0, 1, 1,
0.4262683, 0.5960777, 1.927479, 0.01960784, 0, 1, 1,
0.4287259, -0.4430326, 3.113874, 0.02745098, 0, 1, 1,
0.4326303, 0.07857076, 0.4225718, 0.03137255, 0, 1, 1,
0.4338275, -1.120554, 2.790031, 0.03921569, 0, 1, 1,
0.4347142, -1.750827, 0.8803598, 0.04313726, 0, 1, 1,
0.4368891, 0.2770514, 2.118491, 0.05098039, 0, 1, 1,
0.4370136, -0.2104554, 2.992918, 0.05490196, 0, 1, 1,
0.439896, 0.7274533, -0.6320149, 0.0627451, 0, 1, 1,
0.442204, -0.1328748, 1.19524, 0.06666667, 0, 1, 1,
0.4422303, -0.5570512, -0.01809188, 0.07450981, 0, 1, 1,
0.4426576, -1.444809, 2.118894, 0.07843138, 0, 1, 1,
0.4432995, 1.268019, -2.092132, 0.08627451, 0, 1, 1,
0.4464174, -1.217839, 1.991217, 0.09019608, 0, 1, 1,
0.4474889, -0.1137059, 2.639956, 0.09803922, 0, 1, 1,
0.4541764, 0.2527538, -0.7669482, 0.1058824, 0, 1, 1,
0.4549407, 0.5580989, 1.781414, 0.1098039, 0, 1, 1,
0.4584586, 1.071437, 0.3369416, 0.1176471, 0, 1, 1,
0.4584609, 1.307631, 0.3298295, 0.1215686, 0, 1, 1,
0.4591404, 1.830487, -1.425138, 0.1294118, 0, 1, 1,
0.4591534, -1.178777, 2.496663, 0.1333333, 0, 1, 1,
0.460348, 0.5646989, 1.719726, 0.1411765, 0, 1, 1,
0.4620416, 1.481401, 1.860309, 0.145098, 0, 1, 1,
0.4622545, 1.47807, 0.4083501, 0.1529412, 0, 1, 1,
0.4632502, -1.425305, 1.604767, 0.1568628, 0, 1, 1,
0.466332, -0.9108913, 1.434578, 0.1647059, 0, 1, 1,
0.4668229, -1.125646, 2.317602, 0.1686275, 0, 1, 1,
0.4674565, -0.2577924, 0.337492, 0.1764706, 0, 1, 1,
0.4682041, -0.481578, 4.538468, 0.1803922, 0, 1, 1,
0.4719564, -1.345637, 2.307877, 0.1882353, 0, 1, 1,
0.4720836, -0.1533408, 2.145389, 0.1921569, 0, 1, 1,
0.4759151, 0.4281332, 0.8425245, 0.2, 0, 1, 1,
0.4799003, 1.131613, -1.735103, 0.2078431, 0, 1, 1,
0.4863697, 0.2743362, 0.2671535, 0.2117647, 0, 1, 1,
0.4874124, -1.319922, 0.4179152, 0.2196078, 0, 1, 1,
0.4968607, 0.7648361, 0.2427356, 0.2235294, 0, 1, 1,
0.4971269, -0.596074, 1.277695, 0.2313726, 0, 1, 1,
0.5004518, -0.1794136, 1.768498, 0.2352941, 0, 1, 1,
0.5180113, 0.01098058, 1.804052, 0.2431373, 0, 1, 1,
0.5203099, 0.2382333, 0.668896, 0.2470588, 0, 1, 1,
0.5232251, 0.3363125, 2.658553, 0.254902, 0, 1, 1,
0.5254218, 0.587018, 0.7242085, 0.2588235, 0, 1, 1,
0.5271164, 0.2200434, 0.6044037, 0.2666667, 0, 1, 1,
0.5326738, -1.242971, 2.730757, 0.2705882, 0, 1, 1,
0.5358686, 1.027388, 0.919758, 0.2784314, 0, 1, 1,
0.5373657, 0.7960601, 0.4312185, 0.282353, 0, 1, 1,
0.5374709, -0.158621, 3.133578, 0.2901961, 0, 1, 1,
0.5438209, 1.038778, 0.5641813, 0.2941177, 0, 1, 1,
0.5438248, 0.2417095, 0.2390001, 0.3019608, 0, 1, 1,
0.5453141, -0.8128563, 2.273086, 0.3098039, 0, 1, 1,
0.554806, 0.3568372, -1.165822, 0.3137255, 0, 1, 1,
0.5572247, 0.8918467, -0.9853464, 0.3215686, 0, 1, 1,
0.5633488, 0.6556889, 0.9680328, 0.3254902, 0, 1, 1,
0.5650311, 1.251315, -0.3996438, 0.3333333, 0, 1, 1,
0.5656679, 2.023644, 0.5802371, 0.3372549, 0, 1, 1,
0.5695501, 0.01577408, 0.4773723, 0.345098, 0, 1, 1,
0.5763713, -1.099346, 3.012747, 0.3490196, 0, 1, 1,
0.5763959, -2.112179, 2.764753, 0.3568628, 0, 1, 1,
0.5845393, 1.454355, 0.03434613, 0.3607843, 0, 1, 1,
0.5891866, 1.043793, 1.060989, 0.3686275, 0, 1, 1,
0.5916362, -0.8967938, 4.392564, 0.372549, 0, 1, 1,
0.597693, -1.023933, 3.719942, 0.3803922, 0, 1, 1,
0.6012349, 0.752095, 0.7474396, 0.3843137, 0, 1, 1,
0.6036755, -2.848003, 2.641389, 0.3921569, 0, 1, 1,
0.6103499, -0.8417059, 4.118134, 0.3960784, 0, 1, 1,
0.6163419, 0.1882244, 2.376665, 0.4039216, 0, 1, 1,
0.6187306, 0.273075, -0.3182577, 0.4117647, 0, 1, 1,
0.6381595, -0.2416739, 1.462035, 0.4156863, 0, 1, 1,
0.63859, 0.5110646, -0.8839431, 0.4235294, 0, 1, 1,
0.6434907, -0.8250973, 3.148774, 0.427451, 0, 1, 1,
0.652756, 1.400999, 3.684216, 0.4352941, 0, 1, 1,
0.656074, -0.8546984, 2.23947, 0.4392157, 0, 1, 1,
0.6601177, 0.1848248, 3.031255, 0.4470588, 0, 1, 1,
0.6670555, -0.0791979, 0.8739591, 0.4509804, 0, 1, 1,
0.6678128, 0.6752463, 0.9480193, 0.4588235, 0, 1, 1,
0.6680773, -1.557255, 1.592233, 0.4627451, 0, 1, 1,
0.668655, -1.749313, 4.963666, 0.4705882, 0, 1, 1,
0.6711438, -0.04915406, 1.427242, 0.4745098, 0, 1, 1,
0.6740036, -0.1927278, 0.8991806, 0.4823529, 0, 1, 1,
0.6752448, 0.0914521, 2.01418, 0.4862745, 0, 1, 1,
0.676588, -0.06347989, 2.047158, 0.4941176, 0, 1, 1,
0.6770979, -1.218943, 1.709323, 0.5019608, 0, 1, 1,
0.6797326, -0.579604, 3.072785, 0.5058824, 0, 1, 1,
0.6808425, 0.07528545, -1.143689, 0.5137255, 0, 1, 1,
0.6816033, 0.2193769, 0.9936926, 0.5176471, 0, 1, 1,
0.6895082, -1.1598, 2.998569, 0.5254902, 0, 1, 1,
0.6904561, -1.38391, 3.328583, 0.5294118, 0, 1, 1,
0.6962878, -1.647555, 2.777881, 0.5372549, 0, 1, 1,
0.6991378, 0.7182745, 1.370053, 0.5411765, 0, 1, 1,
0.7054824, 0.7559014, -1.708731, 0.5490196, 0, 1, 1,
0.7073979, -0.5087852, 1.838136, 0.5529412, 0, 1, 1,
0.7086659, 1.082004, -0.05108682, 0.5607843, 0, 1, 1,
0.7090676, -0.1243389, 0.03058079, 0.5647059, 0, 1, 1,
0.710661, -1.795905, 2.32706, 0.572549, 0, 1, 1,
0.7118053, 0.7316725, 2.681779, 0.5764706, 0, 1, 1,
0.7119976, 1.237732, 0.3047412, 0.5843138, 0, 1, 1,
0.7156845, -0.8247734, 2.843934, 0.5882353, 0, 1, 1,
0.7161063, 1.087539, 0.07568576, 0.5960785, 0, 1, 1,
0.7179645, -0.5196518, 3.635258, 0.6039216, 0, 1, 1,
0.7192771, 0.8548788, 1.132671, 0.6078432, 0, 1, 1,
0.7235667, -1.01661, 1.638255, 0.6156863, 0, 1, 1,
0.7258738, 0.8828066, 2.141442, 0.6196079, 0, 1, 1,
0.7274942, -0.1354001, 1.611122, 0.627451, 0, 1, 1,
0.7284202, -1.596294, 2.929579, 0.6313726, 0, 1, 1,
0.7337244, 0.8887644, 0.4143816, 0.6392157, 0, 1, 1,
0.7397678, -0.5873485, 0.964386, 0.6431373, 0, 1, 1,
0.7672633, 0.663105, -0.02693504, 0.6509804, 0, 1, 1,
0.7684321, -0.2669906, 3.361355, 0.654902, 0, 1, 1,
0.7714624, -0.4439978, 1.426879, 0.6627451, 0, 1, 1,
0.7747155, 1.070358, 0.03697906, 0.6666667, 0, 1, 1,
0.777009, 0.9172178, 1.084295, 0.6745098, 0, 1, 1,
0.7807337, 0.03926146, 2.477005, 0.6784314, 0, 1, 1,
0.7860761, -0.0161084, 3.736044, 0.6862745, 0, 1, 1,
0.7877411, 1.959579, 0.3530428, 0.6901961, 0, 1, 1,
0.7896798, 0.3480656, 0.2770293, 0.6980392, 0, 1, 1,
0.7912037, 0.350435, 1.042144, 0.7058824, 0, 1, 1,
0.7949027, -0.4571387, 0.6449676, 0.7098039, 0, 1, 1,
0.8016486, -0.4044949, 2.971335, 0.7176471, 0, 1, 1,
0.8023083, 0.7956263, 1.325763, 0.7215686, 0, 1, 1,
0.8079497, -0.6648961, 3.537435, 0.7294118, 0, 1, 1,
0.8084002, -1.4146, 1.448171, 0.7333333, 0, 1, 1,
0.8122545, 0.5667006, -0.5719184, 0.7411765, 0, 1, 1,
0.8156104, -0.3891466, 2.061567, 0.7450981, 0, 1, 1,
0.8195483, -0.8092594, 4.136978, 0.7529412, 0, 1, 1,
0.8203953, 2.049021, 0.6879064, 0.7568628, 0, 1, 1,
0.8209727, -3.424174, 1.212389, 0.7647059, 0, 1, 1,
0.8253586, -0.7010739, 1.682448, 0.7686275, 0, 1, 1,
0.8270558, 0.7245206, 1.434643, 0.7764706, 0, 1, 1,
0.8271479, 1.217847, -1.107742, 0.7803922, 0, 1, 1,
0.8280313, 1.967945, -0.3740972, 0.7882353, 0, 1, 1,
0.8313501, 1.345974, 0.3165683, 0.7921569, 0, 1, 1,
0.8336714, 0.3256335, 0.5789057, 0.8, 0, 1, 1,
0.8418269, -0.2978569, 1.012324, 0.8078431, 0, 1, 1,
0.8495966, -1.209185, 1.661908, 0.8117647, 0, 1, 1,
0.8497554, -0.04806245, 1.487042, 0.8196079, 0, 1, 1,
0.8584474, -0.1905322, 1.055286, 0.8235294, 0, 1, 1,
0.8648579, -1.71492, 3.653843, 0.8313726, 0, 1, 1,
0.8698977, 0.5719575, -0.7792651, 0.8352941, 0, 1, 1,
0.8734152, -1.385669, 1.680516, 0.8431373, 0, 1, 1,
0.8740262, 1.509941, 1.290604, 0.8470588, 0, 1, 1,
0.8805212, -0.5154822, 5.571356, 0.854902, 0, 1, 1,
0.8877423, -0.3298949, 1.808594, 0.8588235, 0, 1, 1,
0.8883289, 1.21848, 0.5360242, 0.8666667, 0, 1, 1,
0.8906687, 0.1398696, 1.250072, 0.8705882, 0, 1, 1,
0.8925888, -0.5676906, 2.896591, 0.8784314, 0, 1, 1,
0.8946455, -0.5362059, 2.651698, 0.8823529, 0, 1, 1,
0.9015785, 0.5338691, 2.359398, 0.8901961, 0, 1, 1,
0.9027828, -1.35211, 3.071643, 0.8941177, 0, 1, 1,
0.9028524, 0.08286678, 2.809457, 0.9019608, 0, 1, 1,
0.908793, -0.6977593, 4.144352, 0.9098039, 0, 1, 1,
0.9097158, -0.4111252, 2.52362, 0.9137255, 0, 1, 1,
0.9124684, 0.8654122, 2.320502, 0.9215686, 0, 1, 1,
0.9224099, -0.4563251, 1.251581, 0.9254902, 0, 1, 1,
0.9243664, -0.6681787, 4.14321, 0.9333333, 0, 1, 1,
0.9313594, 0.2263898, 2.272524, 0.9372549, 0, 1, 1,
0.9330111, -2.042588, 1.39648, 0.945098, 0, 1, 1,
0.9363397, -0.2853483, 1.224533, 0.9490196, 0, 1, 1,
0.9418559, 0.3530909, 1.931849, 0.9568627, 0, 1, 1,
0.9514849, -0.6464619, 3.056261, 0.9607843, 0, 1, 1,
0.9753806, -1.092751, 2.225354, 0.9686275, 0, 1, 1,
0.986888, -0.1558689, 2.399707, 0.972549, 0, 1, 1,
0.993719, -1.251191, 3.142612, 0.9803922, 0, 1, 1,
0.9952638, 0.3056133, 2.384501, 0.9843137, 0, 1, 1,
0.9982539, 0.6320995, 0.2545718, 0.9921569, 0, 1, 1,
1.015348, -0.1845147, 0.1114597, 0.9960784, 0, 1, 1,
1.016218, 2.306504, -2.724715, 1, 0, 0.9960784, 1,
1.016964, 0.2652197, 1.518259, 1, 0, 0.9882353, 1,
1.01904, -0.6961653, 3.106668, 1, 0, 0.9843137, 1,
1.025206, 0.03892631, 3.310379, 1, 0, 0.9764706, 1,
1.028552, 1.434373, 1.003255, 1, 0, 0.972549, 1,
1.035514, -0.09090559, 1.797072, 1, 0, 0.9647059, 1,
1.039727, -0.9949012, 1.216297, 1, 0, 0.9607843, 1,
1.044625, 0.3074912, -0.5064443, 1, 0, 0.9529412, 1,
1.045907, 0.2126709, -0.7472432, 1, 0, 0.9490196, 1,
1.0647, -0.1750938, 2.613845, 1, 0, 0.9411765, 1,
1.064727, 0.6189788, 1.166365, 1, 0, 0.9372549, 1,
1.079665, -0.1832966, 1.355151, 1, 0, 0.9294118, 1,
1.090858, 0.08526506, 1.920413, 1, 0, 0.9254902, 1,
1.095428, -0.5665723, 1.422638, 1, 0, 0.9176471, 1,
1.095738, -0.303526, 2.142094, 1, 0, 0.9137255, 1,
1.096907, -0.3618084, 1.174469, 1, 0, 0.9058824, 1,
1.09956, 0.815129, 0.7462976, 1, 0, 0.9019608, 1,
1.101433, 1.520324, 0.3183904, 1, 0, 0.8941177, 1,
1.106431, 1.451964, 1.330589, 1, 0, 0.8862745, 1,
1.106904, -0.07678836, 0.5009557, 1, 0, 0.8823529, 1,
1.108484, 0.06020427, 1.962974, 1, 0, 0.8745098, 1,
1.112485, 0.74352, 2.904462, 1, 0, 0.8705882, 1,
1.113432, -0.7538505, 1.206449, 1, 0, 0.8627451, 1,
1.119454, -1.201609, 2.838139, 1, 0, 0.8588235, 1,
1.127692, -1.043441, 2.183601, 1, 0, 0.8509804, 1,
1.128464, -1.511847, 1.23062, 1, 0, 0.8470588, 1,
1.131092, 0.1750045, 2.801844, 1, 0, 0.8392157, 1,
1.137809, -0.9295184, 3.571215, 1, 0, 0.8352941, 1,
1.149796, 0.7186507, 1.956911, 1, 0, 0.827451, 1,
1.151803, 1.863278, -0.0320034, 1, 0, 0.8235294, 1,
1.156127, -0.1497596, 1.375664, 1, 0, 0.8156863, 1,
1.16106, 0.781384, 1.699866, 1, 0, 0.8117647, 1,
1.166045, -0.991756, 2.47256, 1, 0, 0.8039216, 1,
1.167068, -0.2848397, 1.875405, 1, 0, 0.7960784, 1,
1.170282, 1.422992, 0.5850216, 1, 0, 0.7921569, 1,
1.170792, 0.7568004, -1.121206, 1, 0, 0.7843137, 1,
1.177833, -1.177906, 1.137437, 1, 0, 0.7803922, 1,
1.179058, -0.1264084, 3.473189, 1, 0, 0.772549, 1,
1.179916, 1.738307, 0.3999416, 1, 0, 0.7686275, 1,
1.183504, -1.265511, 2.556437, 1, 0, 0.7607843, 1,
1.189153, 0.153973, 1.542938, 1, 0, 0.7568628, 1,
1.190636, 0.3998535, -1.412657, 1, 0, 0.7490196, 1,
1.190861, -0.5602337, 2.8213, 1, 0, 0.7450981, 1,
1.191293, -1.885921, 3.130302, 1, 0, 0.7372549, 1,
1.192468, 0.2388858, 0.6481522, 1, 0, 0.7333333, 1,
1.193095, -0.1382655, 0.721437, 1, 0, 0.7254902, 1,
1.197753, 0.156243, 1.837522, 1, 0, 0.7215686, 1,
1.211283, 1.779562, 0.6692801, 1, 0, 0.7137255, 1,
1.211887, -2.102339, 3.279998, 1, 0, 0.7098039, 1,
1.213018, 1.295961, 1.668881, 1, 0, 0.7019608, 1,
1.215497, 0.1632537, 1.99588, 1, 0, 0.6941177, 1,
1.216871, -0.8780286, 2.894147, 1, 0, 0.6901961, 1,
1.219303, -0.06785265, 2.945014, 1, 0, 0.682353, 1,
1.231862, 0.07144657, 1.808407, 1, 0, 0.6784314, 1,
1.235597, -1.1573, 3.356407, 1, 0, 0.6705883, 1,
1.247727, 0.07498566, 1.823984, 1, 0, 0.6666667, 1,
1.247893, 1.200098, 2.260888, 1, 0, 0.6588235, 1,
1.248611, -1.058033, 1.472174, 1, 0, 0.654902, 1,
1.253081, -1.542986, 3.202051, 1, 0, 0.6470588, 1,
1.257553, 0.8137308, 0.3181351, 1, 0, 0.6431373, 1,
1.258324, -0.6740366, 3.63086, 1, 0, 0.6352941, 1,
1.26087, 1.465659, 1.594183, 1, 0, 0.6313726, 1,
1.261857, 0.01317716, 2.928089, 1, 0, 0.6235294, 1,
1.264682, -1.688044, 2.251916, 1, 0, 0.6196079, 1,
1.282914, -0.14773, 1.632298, 1, 0, 0.6117647, 1,
1.287678, -1.706964, 1.583656, 1, 0, 0.6078432, 1,
1.290532, -0.1734675, -0.1212423, 1, 0, 0.6, 1,
1.298363, -0.4915694, 2.343117, 1, 0, 0.5921569, 1,
1.299169, -1.001438, 2.551816, 1, 0, 0.5882353, 1,
1.300691, 2.128163, 1.165658, 1, 0, 0.5803922, 1,
1.302229, -2.025442, 1.866372, 1, 0, 0.5764706, 1,
1.304017, 1.029841, 1.822595, 1, 0, 0.5686275, 1,
1.30642, -1.245885, 1.104491, 1, 0, 0.5647059, 1,
1.306674, -1.180865, 2.153404, 1, 0, 0.5568628, 1,
1.308201, -0.2463229, 2.761248, 1, 0, 0.5529412, 1,
1.308384, 0.8811895, -0.9312307, 1, 0, 0.5450981, 1,
1.319438, -0.522737, 0.6671517, 1, 0, 0.5411765, 1,
1.328605, -1.358337, 1.125803, 1, 0, 0.5333334, 1,
1.343903, 2.300108, -1.825229, 1, 0, 0.5294118, 1,
1.347704, 0.9067605, 1.401324, 1, 0, 0.5215687, 1,
1.350537, -0.4926578, 0.6456155, 1, 0, 0.5176471, 1,
1.355888, 0.04704499, -0.04838722, 1, 0, 0.509804, 1,
1.3636, 2.140753, 1.201487, 1, 0, 0.5058824, 1,
1.37495, -0.8736334, 0.0639523, 1, 0, 0.4980392, 1,
1.383296, -0.4405359, 2.178433, 1, 0, 0.4901961, 1,
1.387052, -1.02862, 2.718317, 1, 0, 0.4862745, 1,
1.39008, 0.7405795, 1.477358, 1, 0, 0.4784314, 1,
1.392509, -0.883057, 1.005427, 1, 0, 0.4745098, 1,
1.412572, 0.006620638, 1.398255, 1, 0, 0.4666667, 1,
1.41501, -0.9558015, 2.405151, 1, 0, 0.4627451, 1,
1.426591, -0.1329041, -0.4358472, 1, 0, 0.454902, 1,
1.428651, 1.412567, 0.8164504, 1, 0, 0.4509804, 1,
1.430175, 0.2391938, 1.870608, 1, 0, 0.4431373, 1,
1.430928, 2.359653, 1.517727, 1, 0, 0.4392157, 1,
1.441754, -1.865406, 5.961204, 1, 0, 0.4313726, 1,
1.458418, -0.5050025, 1.528304, 1, 0, 0.427451, 1,
1.479426, -0.8127064, 3.164527, 1, 0, 0.4196078, 1,
1.489832, 0.5530513, 1.490405, 1, 0, 0.4156863, 1,
1.509017, -1.646229, 4.11351, 1, 0, 0.4078431, 1,
1.511265, 0.3135417, 0.7876585, 1, 0, 0.4039216, 1,
1.523443, -0.8096626, 0.6706811, 1, 0, 0.3960784, 1,
1.529334, 0.9716058, 0.173269, 1, 0, 0.3882353, 1,
1.533043, 0.2981256, -0.4299085, 1, 0, 0.3843137, 1,
1.53601, 0.94702, 1.89811, 1, 0, 0.3764706, 1,
1.556407, -0.4620427, 1.834985, 1, 0, 0.372549, 1,
1.560357, 0.08703699, 0.6664838, 1, 0, 0.3647059, 1,
1.583082, 0.4786361, 2.20998, 1, 0, 0.3607843, 1,
1.614295, 1.841921, 0.8552303, 1, 0, 0.3529412, 1,
1.620599, -0.2965457, 1.785519, 1, 0, 0.3490196, 1,
1.6396, -0.8188336, 2.02474, 1, 0, 0.3411765, 1,
1.650432, 2.49737, -0.1680054, 1, 0, 0.3372549, 1,
1.693314, -0.818093, 2.690156, 1, 0, 0.3294118, 1,
1.695194, 0.2933756, -0.09089366, 1, 0, 0.3254902, 1,
1.709453, 0.2055331, 2.035196, 1, 0, 0.3176471, 1,
1.711669, 0.7658319, 1.735715, 1, 0, 0.3137255, 1,
1.711775, 0.8261214, 2.50584, 1, 0, 0.3058824, 1,
1.735859, 0.5340265, 1.12463, 1, 0, 0.2980392, 1,
1.742204, 0.5314184, 1.004475, 1, 0, 0.2941177, 1,
1.773123, -0.9287247, 3.625186, 1, 0, 0.2862745, 1,
1.7837, -0.9011918, 2.002244, 1, 0, 0.282353, 1,
1.791619, -1.420126, 3.161891, 1, 0, 0.2745098, 1,
1.794243, -0.5279528, -0.2511731, 1, 0, 0.2705882, 1,
1.794444, -0.8636675, 0.5512624, 1, 0, 0.2627451, 1,
1.794845, 1.276653, 1.37461, 1, 0, 0.2588235, 1,
1.817602, -0.5248345, 0.7347766, 1, 0, 0.2509804, 1,
1.817928, -0.7813339, 1.897581, 1, 0, 0.2470588, 1,
1.832309, -1.511953, 2.818414, 1, 0, 0.2392157, 1,
1.840864, 0.6578279, 2.037225, 1, 0, 0.2352941, 1,
1.860946, 1.668462, -0.6132478, 1, 0, 0.227451, 1,
1.862871, -2.150046, 1.709867, 1, 0, 0.2235294, 1,
1.864951, 0.04393703, 3.037226, 1, 0, 0.2156863, 1,
1.866776, -1.823827, 2.561893, 1, 0, 0.2117647, 1,
1.877028, -0.1383598, 1.178172, 1, 0, 0.2039216, 1,
1.877896, 0.6520129, 2.742046, 1, 0, 0.1960784, 1,
1.903426, 0.190776, 1.975603, 1, 0, 0.1921569, 1,
1.905553, 1.495565, 0.5649467, 1, 0, 0.1843137, 1,
1.911369, 0.7456858, 0.5629436, 1, 0, 0.1803922, 1,
1.929881, 1.3717, 0.2641394, 1, 0, 0.172549, 1,
1.946688, 1.849002, 1.133627, 1, 0, 0.1686275, 1,
1.981528, 0.5542398, 0.3724387, 1, 0, 0.1607843, 1,
1.983129, -1.116899, 2.080095, 1, 0, 0.1568628, 1,
1.984824, -0.04695527, 0.7547042, 1, 0, 0.1490196, 1,
1.995488, -0.711949, 2.421967, 1, 0, 0.145098, 1,
2.032613, 0.1658599, -0.08578356, 1, 0, 0.1372549, 1,
2.040303, -0.866013, 1.194369, 1, 0, 0.1333333, 1,
2.070149, 0.6815635, 0.2043289, 1, 0, 0.1254902, 1,
2.070958, -0.5452428, 2.405988, 1, 0, 0.1215686, 1,
2.082201, 1.265111, 0.4945371, 1, 0, 0.1137255, 1,
2.110964, 0.6138063, 2.736975, 1, 0, 0.1098039, 1,
2.114361, 0.9528047, 1.91258, 1, 0, 0.1019608, 1,
2.162979, 0.5611174, 1.924071, 1, 0, 0.09411765, 1,
2.227335, 0.1173426, -0.1688843, 1, 0, 0.09019608, 1,
2.239709, -0.4615302, 1.422701, 1, 0, 0.08235294, 1,
2.27247, -0.08928136, 0.8737828, 1, 0, 0.07843138, 1,
2.344864, 0.4410689, 1.313236, 1, 0, 0.07058824, 1,
2.458725, 1.147998, 2.270998, 1, 0, 0.06666667, 1,
2.489215, 0.3840563, 1.004281, 1, 0, 0.05882353, 1,
2.497374, 0.3278907, 2.924383, 1, 0, 0.05490196, 1,
2.605691, -1.309125, 2.285694, 1, 0, 0.04705882, 1,
2.62483, -0.08229292, 2.043615, 1, 0, 0.04313726, 1,
2.633518, -0.4018759, 2.866461, 1, 0, 0.03529412, 1,
2.64981, 1.775785, 1.290148, 1, 0, 0.03137255, 1,
2.702529, -1.079918, 2.683854, 1, 0, 0.02352941, 1,
2.740392, -0.5443894, 2.663144, 1, 0, 0.01960784, 1,
3.037666, -0.8831654, 0.7792016, 1, 0, 0.01176471, 1,
3.524026, 0.5482017, 1.526858, 1, 0, 0.007843138, 1
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
0.07748771, -4.469248, -7.151096, 0, -0.5, 0.5, 0.5,
0.07748771, -4.469248, -7.151096, 1, -0.5, 0.5, 0.5,
0.07748771, -4.469248, -7.151096, 1, 1.5, 0.5, 0.5,
0.07748771, -4.469248, -7.151096, 0, 1.5, 0.5, 0.5
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
-4.537427, -0.3413575, -7.151096, 0, -0.5, 0.5, 0.5,
-4.537427, -0.3413575, -7.151096, 1, -0.5, 0.5, 0.5,
-4.537427, -0.3413575, -7.151096, 1, 1.5, 0.5, 0.5,
-4.537427, -0.3413575, -7.151096, 0, 1.5, 0.5, 0.5
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
-4.537427, -4.469248, 0.3552613, 0, -0.5, 0.5, 0.5,
-4.537427, -4.469248, 0.3552613, 1, -0.5, 0.5, 0.5,
-4.537427, -4.469248, 0.3552613, 1, 1.5, 0.5, 0.5,
-4.537427, -4.469248, 0.3552613, 0, 1.5, 0.5, 0.5
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
-3, -3.516658, -5.418859,
3, -3.516658, -5.418859,
-3, -3.516658, -5.418859,
-3, -3.675423, -5.707566,
-2, -3.516658, -5.418859,
-2, -3.675423, -5.707566,
-1, -3.516658, -5.418859,
-1, -3.675423, -5.707566,
0, -3.516658, -5.418859,
0, -3.675423, -5.707566,
1, -3.516658, -5.418859,
1, -3.675423, -5.707566,
2, -3.516658, -5.418859,
2, -3.675423, -5.707566,
3, -3.516658, -5.418859,
3, -3.675423, -5.707566
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
-3, -3.992953, -6.284978, 0, -0.5, 0.5, 0.5,
-3, -3.992953, -6.284978, 1, -0.5, 0.5, 0.5,
-3, -3.992953, -6.284978, 1, 1.5, 0.5, 0.5,
-3, -3.992953, -6.284978, 0, 1.5, 0.5, 0.5,
-2, -3.992953, -6.284978, 0, -0.5, 0.5, 0.5,
-2, -3.992953, -6.284978, 1, -0.5, 0.5, 0.5,
-2, -3.992953, -6.284978, 1, 1.5, 0.5, 0.5,
-2, -3.992953, -6.284978, 0, 1.5, 0.5, 0.5,
-1, -3.992953, -6.284978, 0, -0.5, 0.5, 0.5,
-1, -3.992953, -6.284978, 1, -0.5, 0.5, 0.5,
-1, -3.992953, -6.284978, 1, 1.5, 0.5, 0.5,
-1, -3.992953, -6.284978, 0, 1.5, 0.5, 0.5,
0, -3.992953, -6.284978, 0, -0.5, 0.5, 0.5,
0, -3.992953, -6.284978, 1, -0.5, 0.5, 0.5,
0, -3.992953, -6.284978, 1, 1.5, 0.5, 0.5,
0, -3.992953, -6.284978, 0, 1.5, 0.5, 0.5,
1, -3.992953, -6.284978, 0, -0.5, 0.5, 0.5,
1, -3.992953, -6.284978, 1, -0.5, 0.5, 0.5,
1, -3.992953, -6.284978, 1, 1.5, 0.5, 0.5,
1, -3.992953, -6.284978, 0, 1.5, 0.5, 0.5,
2, -3.992953, -6.284978, 0, -0.5, 0.5, 0.5,
2, -3.992953, -6.284978, 1, -0.5, 0.5, 0.5,
2, -3.992953, -6.284978, 1, 1.5, 0.5, 0.5,
2, -3.992953, -6.284978, 0, 1.5, 0.5, 0.5,
3, -3.992953, -6.284978, 0, -0.5, 0.5, 0.5,
3, -3.992953, -6.284978, 1, -0.5, 0.5, 0.5,
3, -3.992953, -6.284978, 1, 1.5, 0.5, 0.5,
3, -3.992953, -6.284978, 0, 1.5, 0.5, 0.5
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
-3.472447, -3, -5.418859,
-3.472447, 2, -5.418859,
-3.472447, -3, -5.418859,
-3.649943, -3, -5.707566,
-3.472447, -2, -5.418859,
-3.649943, -2, -5.707566,
-3.472447, -1, -5.418859,
-3.649943, -1, -5.707566,
-3.472447, 0, -5.418859,
-3.649943, 0, -5.707566,
-3.472447, 1, -5.418859,
-3.649943, 1, -5.707566,
-3.472447, 2, -5.418859,
-3.649943, 2, -5.707566
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
-4.004937, -3, -6.284978, 0, -0.5, 0.5, 0.5,
-4.004937, -3, -6.284978, 1, -0.5, 0.5, 0.5,
-4.004937, -3, -6.284978, 1, 1.5, 0.5, 0.5,
-4.004937, -3, -6.284978, 0, 1.5, 0.5, 0.5,
-4.004937, -2, -6.284978, 0, -0.5, 0.5, 0.5,
-4.004937, -2, -6.284978, 1, -0.5, 0.5, 0.5,
-4.004937, -2, -6.284978, 1, 1.5, 0.5, 0.5,
-4.004937, -2, -6.284978, 0, 1.5, 0.5, 0.5,
-4.004937, -1, -6.284978, 0, -0.5, 0.5, 0.5,
-4.004937, -1, -6.284978, 1, -0.5, 0.5, 0.5,
-4.004937, -1, -6.284978, 1, 1.5, 0.5, 0.5,
-4.004937, -1, -6.284978, 0, 1.5, 0.5, 0.5,
-4.004937, 0, -6.284978, 0, -0.5, 0.5, 0.5,
-4.004937, 0, -6.284978, 1, -0.5, 0.5, 0.5,
-4.004937, 0, -6.284978, 1, 1.5, 0.5, 0.5,
-4.004937, 0, -6.284978, 0, 1.5, 0.5, 0.5,
-4.004937, 1, -6.284978, 0, -0.5, 0.5, 0.5,
-4.004937, 1, -6.284978, 1, -0.5, 0.5, 0.5,
-4.004937, 1, -6.284978, 1, 1.5, 0.5, 0.5,
-4.004937, 1, -6.284978, 0, 1.5, 0.5, 0.5,
-4.004937, 2, -6.284978, 0, -0.5, 0.5, 0.5,
-4.004937, 2, -6.284978, 1, -0.5, 0.5, 0.5,
-4.004937, 2, -6.284978, 1, 1.5, 0.5, 0.5,
-4.004937, 2, -6.284978, 0, 1.5, 0.5, 0.5
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
-3.472447, -3.516658, -4,
-3.472447, -3.516658, 4,
-3.472447, -3.516658, -4,
-3.649943, -3.675423, -4,
-3.472447, -3.516658, -2,
-3.649943, -3.675423, -2,
-3.472447, -3.516658, 0,
-3.649943, -3.675423, 0,
-3.472447, -3.516658, 2,
-3.649943, -3.675423, 2,
-3.472447, -3.516658, 4,
-3.649943, -3.675423, 4
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
-4.004937, -3.992953, -4, 0, -0.5, 0.5, 0.5,
-4.004937, -3.992953, -4, 1, -0.5, 0.5, 0.5,
-4.004937, -3.992953, -4, 1, 1.5, 0.5, 0.5,
-4.004937, -3.992953, -4, 0, 1.5, 0.5, 0.5,
-4.004937, -3.992953, -2, 0, -0.5, 0.5, 0.5,
-4.004937, -3.992953, -2, 1, -0.5, 0.5, 0.5,
-4.004937, -3.992953, -2, 1, 1.5, 0.5, 0.5,
-4.004937, -3.992953, -2, 0, 1.5, 0.5, 0.5,
-4.004937, -3.992953, 0, 0, -0.5, 0.5, 0.5,
-4.004937, -3.992953, 0, 1, -0.5, 0.5, 0.5,
-4.004937, -3.992953, 0, 1, 1.5, 0.5, 0.5,
-4.004937, -3.992953, 0, 0, 1.5, 0.5, 0.5,
-4.004937, -3.992953, 2, 0, -0.5, 0.5, 0.5,
-4.004937, -3.992953, 2, 1, -0.5, 0.5, 0.5,
-4.004937, -3.992953, 2, 1, 1.5, 0.5, 0.5,
-4.004937, -3.992953, 2, 0, 1.5, 0.5, 0.5,
-4.004937, -3.992953, 4, 0, -0.5, 0.5, 0.5,
-4.004937, -3.992953, 4, 1, -0.5, 0.5, 0.5,
-4.004937, -3.992953, 4, 1, 1.5, 0.5, 0.5,
-4.004937, -3.992953, 4, 0, 1.5, 0.5, 0.5
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
-3.472447, -3.516658, -5.418859,
-3.472447, 2.833943, -5.418859,
-3.472447, -3.516658, 6.129382,
-3.472447, 2.833943, 6.129382,
-3.472447, -3.516658, -5.418859,
-3.472447, -3.516658, 6.129382,
-3.472447, 2.833943, -5.418859,
-3.472447, 2.833943, 6.129382,
-3.472447, -3.516658, -5.418859,
3.627422, -3.516658, -5.418859,
-3.472447, -3.516658, 6.129382,
3.627422, -3.516658, 6.129382,
-3.472447, 2.833943, -5.418859,
3.627422, 2.833943, -5.418859,
-3.472447, 2.833943, 6.129382,
3.627422, 2.833943, 6.129382,
3.627422, -3.516658, -5.418859,
3.627422, 2.833943, -5.418859,
3.627422, -3.516658, 6.129382,
3.627422, 2.833943, 6.129382,
3.627422, -3.516658, -5.418859,
3.627422, -3.516658, 6.129382,
3.627422, 2.833943, -5.418859,
3.627422, 2.833943, 6.129382
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
var radius = 7.993676;
var distance = 35.56477;
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
mvMatrix.translate( -0.07748771, 0.3413575, -0.3552613 );
mvMatrix.scale( 1.217335, 1.360961, 0.7484186 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.56477);
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
acequinocyl<-read.table("acequinocyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acequinocyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
```

```r
y<-acequinocyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
```

```r
z<-acequinocyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
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
-3.369051, 1.647568, -2.161887, 0, 0, 1, 1, 1,
-3.158243, -0.1901912, -1.237722, 1, 0, 0, 1, 1,
-2.865483, 1.880193, -0.4497622, 1, 0, 0, 1, 1,
-2.834396, -0.72041, -1.554996, 1, 0, 0, 1, 1,
-2.516526, 0.007537371, -2.06439, 1, 0, 0, 1, 1,
-2.467993, 0.2000667, -0.736827, 1, 0, 0, 1, 1,
-2.421682, 0.2848545, -1.208498, 0, 0, 0, 1, 1,
-2.406045, -1.376051, -1.982355, 0, 0, 0, 1, 1,
-2.385058, -0.2072132, -1.356542, 0, 0, 0, 1, 1,
-2.346044, -1.961012, -1.878008, 0, 0, 0, 1, 1,
-2.30807, 0.7199451, -2.372238, 0, 0, 0, 1, 1,
-2.299449, -0.2438666, -1.470281, 0, 0, 0, 1, 1,
-2.282737, -1.596595, -3.079759, 0, 0, 0, 1, 1,
-2.276104, -0.3600973, -0.005516586, 1, 1, 1, 1, 1,
-2.266498, 0.4947282, -0.8985577, 1, 1, 1, 1, 1,
-2.23836, 0.9361631, -2.180568, 1, 1, 1, 1, 1,
-2.183371, -0.4678091, -4.423429, 1, 1, 1, 1, 1,
-2.108028, -1.554998, -3.926923, 1, 1, 1, 1, 1,
-2.103346, -0.3653911, -1.926341, 1, 1, 1, 1, 1,
-2.060227, -0.04277757, -2.045351, 1, 1, 1, 1, 1,
-2.021832, 1.134573, -1.363398, 1, 1, 1, 1, 1,
-1.998367, 1.029015, -2.513442, 1, 1, 1, 1, 1,
-1.997375, 0.4784554, -0.8883964, 1, 1, 1, 1, 1,
-1.937635, -1.771909, -0.0450465, 1, 1, 1, 1, 1,
-1.936909, -0.4316438, 1.279306, 1, 1, 1, 1, 1,
-1.920838, 0.7707753, -1.653274, 1, 1, 1, 1, 1,
-1.899801, -0.8085541, -2.890136, 1, 1, 1, 1, 1,
-1.897541, -0.04534237, 1.402331, 1, 1, 1, 1, 1,
-1.873032, -0.3473222, -0.4149944, 0, 0, 1, 1, 1,
-1.847366, 0.8904799, -0.9291017, 1, 0, 0, 1, 1,
-1.837283, -0.5609076, -1.516807, 1, 0, 0, 1, 1,
-1.777337, -1.4793, -1.423039, 1, 0, 0, 1, 1,
-1.770966, 1.068168, 0.05733304, 1, 0, 0, 1, 1,
-1.735668, 0.5113005, -0.2483151, 1, 0, 0, 1, 1,
-1.733602, -2.203176, -2.99984, 0, 0, 0, 1, 1,
-1.726863, 0.2757899, -2.272733, 0, 0, 0, 1, 1,
-1.674861, 0.2444949, 0.09745765, 0, 0, 0, 1, 1,
-1.663321, 0.3031322, -0.4673771, 0, 0, 0, 1, 1,
-1.650702, -0.6597142, -3.95968, 0, 0, 0, 1, 1,
-1.632378, 0.417684, -1.864134, 0, 0, 0, 1, 1,
-1.631734, -0.1883598, -0.8608916, 0, 0, 0, 1, 1,
-1.628072, -0.212977, -2.73806, 1, 1, 1, 1, 1,
-1.625891, 0.656145, -1.389, 1, 1, 1, 1, 1,
-1.620017, -0.5257999, -1.614488, 1, 1, 1, 1, 1,
-1.614868, 0.934698, -2.372011, 1, 1, 1, 1, 1,
-1.60835, -1.189747, -2.518495, 1, 1, 1, 1, 1,
-1.607033, 0.7434172, -1.321311, 1, 1, 1, 1, 1,
-1.603067, 1.302277, -2.751442, 1, 1, 1, 1, 1,
-1.599327, 0.9957418, -0.8905617, 1, 1, 1, 1, 1,
-1.596836, 1.485637, 1.258066, 1, 1, 1, 1, 1,
-1.595905, 1.413345, -0.5103694, 1, 1, 1, 1, 1,
-1.57836, -0.08524356, -0.2969571, 1, 1, 1, 1, 1,
-1.55214, -0.6873624, -1.007399, 1, 1, 1, 1, 1,
-1.534848, -1.197478, -0.8485084, 1, 1, 1, 1, 1,
-1.522905, 0.4258079, -2.524612, 1, 1, 1, 1, 1,
-1.520068, 0.1103739, -0.7538077, 1, 1, 1, 1, 1,
-1.517766, -1.030652, -1.923592, 0, 0, 1, 1, 1,
-1.440492, 1.203484, -0.5309783, 1, 0, 0, 1, 1,
-1.439539, -0.6381654, -3.214843, 1, 0, 0, 1, 1,
-1.431704, -0.3774864, -2.437522, 1, 0, 0, 1, 1,
-1.423174, 1.69507, 0.007755634, 1, 0, 0, 1, 1,
-1.421625, -0.6651188, -0.1693527, 1, 0, 0, 1, 1,
-1.407177, 0.6375663, 0.03643106, 0, 0, 0, 1, 1,
-1.400216, -0.1000649, -1.527205, 0, 0, 0, 1, 1,
-1.399734, -0.7031662, -2.24579, 0, 0, 0, 1, 1,
-1.385148, 0.4185756, -0.9489626, 0, 0, 0, 1, 1,
-1.36545, 0.7758419, -2.636525, 0, 0, 0, 1, 1,
-1.36074, -0.3706527, -2.038255, 0, 0, 0, 1, 1,
-1.356448, 2.099782, -1.036602, 0, 0, 0, 1, 1,
-1.350271, 0.5362757, -1.095904, 1, 1, 1, 1, 1,
-1.347338, 0.008994206, -2.004069, 1, 1, 1, 1, 1,
-1.339836, -0.05741207, -0.6774487, 1, 1, 1, 1, 1,
-1.335876, -0.5506347, -3.154251, 1, 1, 1, 1, 1,
-1.333033, 1.741369, -0.6749386, 1, 1, 1, 1, 1,
-1.315813, 1.633201, 0.03810332, 1, 1, 1, 1, 1,
-1.311631, 0.01564593, -2.441182, 1, 1, 1, 1, 1,
-1.296403, 0.9115141, -0.952922, 1, 1, 1, 1, 1,
-1.289548, 1.210209, -1.015863, 1, 1, 1, 1, 1,
-1.281658, 0.3802023, -0.9772689, 1, 1, 1, 1, 1,
-1.267107, -0.09126192, -1.585282, 1, 1, 1, 1, 1,
-1.266617, 0.3626018, 0.7240041, 1, 1, 1, 1, 1,
-1.26564, 0.382112, -0.9510144, 1, 1, 1, 1, 1,
-1.264091, -1.707924, -1.896084, 1, 1, 1, 1, 1,
-1.260622, 1.013643, 0.3397325, 1, 1, 1, 1, 1,
-1.256863, 0.1982882, -0.247189, 0, 0, 1, 1, 1,
-1.25633, -0.9683081, -2.269155, 1, 0, 0, 1, 1,
-1.241711, 0.6662844, -1.997626, 1, 0, 0, 1, 1,
-1.240949, -0.1223011, -3.887837, 1, 0, 0, 1, 1,
-1.240149, -1.572298, -1.886836, 1, 0, 0, 1, 1,
-1.229786, -0.03919354, -1.253245, 1, 0, 0, 1, 1,
-1.226899, -0.9389832, -2.962116, 0, 0, 0, 1, 1,
-1.224029, -1.087137, -2.462369, 0, 0, 0, 1, 1,
-1.220662, -0.5223462, -3.604625, 0, 0, 0, 1, 1,
-1.219983, 0.7611871, -2.051921, 0, 0, 0, 1, 1,
-1.218441, -0.6810007, -2.013244, 0, 0, 0, 1, 1,
-1.217305, -1.073507, -3.022156, 0, 0, 0, 1, 1,
-1.200215, -2.510981, -2.07803, 0, 0, 0, 1, 1,
-1.191754, 0.3268697, -3.073874, 1, 1, 1, 1, 1,
-1.190922, -0.06543463, -1.155765, 1, 1, 1, 1, 1,
-1.187542, 2.149371, -1.664611, 1, 1, 1, 1, 1,
-1.186899, -0.04787384, -1.124526, 1, 1, 1, 1, 1,
-1.186163, -2.766802, -2.268916, 1, 1, 1, 1, 1,
-1.185286, 0.3791664, -0.4051172, 1, 1, 1, 1, 1,
-1.180263, -0.3437482, -1.863708, 1, 1, 1, 1, 1,
-1.179983, -1.001038, -1.672095, 1, 1, 1, 1, 1,
-1.163564, 0.273643, -0.08498758, 1, 1, 1, 1, 1,
-1.153977, -0.9137902, -3.324126, 1, 1, 1, 1, 1,
-1.14906, -0.8860815, -3.778583, 1, 1, 1, 1, 1,
-1.1397, -0.3681623, -2.399032, 1, 1, 1, 1, 1,
-1.137979, 0.5810601, -1.91209, 1, 1, 1, 1, 1,
-1.131109, -0.2137881, -1.122848, 1, 1, 1, 1, 1,
-1.118034, 0.3042748, -1.446159, 1, 1, 1, 1, 1,
-1.113513, -2.041161, -3.619023, 0, 0, 1, 1, 1,
-1.109992, -2.239443, -4.170394, 1, 0, 0, 1, 1,
-1.109113, -2.789095, -2.985001, 1, 0, 0, 1, 1,
-1.107697, -0.6788402, -2.469305, 1, 0, 0, 1, 1,
-1.107563, 0.1367034, -1.607183, 1, 0, 0, 1, 1,
-1.10025, 2.049163, -1.861867, 1, 0, 0, 1, 1,
-1.09628, 2.421183, 0.2687108, 0, 0, 0, 1, 1,
-1.095783, 0.278488, -1.88938, 0, 0, 0, 1, 1,
-1.092445, 0.7625533, -0.7676171, 0, 0, 0, 1, 1,
-1.073364, -2.053833, -3.652364, 0, 0, 0, 1, 1,
-1.072211, 0.4907426, -0.4385936, 0, 0, 0, 1, 1,
-1.068147, 0.8340964, -1.932945, 0, 0, 0, 1, 1,
-1.063846, 1.57519, -0.1797726, 0, 0, 0, 1, 1,
-1.063479, -0.3988639, -2.457133, 1, 1, 1, 1, 1,
-1.055752, 0.596729, 0.2784524, 1, 1, 1, 1, 1,
-1.052549, -0.8756027, -2.433376, 1, 1, 1, 1, 1,
-1.043933, -0.09630568, -1.838343, 1, 1, 1, 1, 1,
-1.03969, -0.8160181, -1.828627, 1, 1, 1, 1, 1,
-1.03831, 2.029097, -0.9707996, 1, 1, 1, 1, 1,
-1.037695, -1.637212, -2.079699, 1, 1, 1, 1, 1,
-1.031903, -1.134364, -2.747698, 1, 1, 1, 1, 1,
-1.024872, -0.5116852, -1.196605, 1, 1, 1, 1, 1,
-1.024449, 1.341032, -0.04177765, 1, 1, 1, 1, 1,
-1.022608, -0.8334752, -3.504151, 1, 1, 1, 1, 1,
-1.021324, -0.8186176, -0.4587856, 1, 1, 1, 1, 1,
-1.020638, -0.9630551, -3.279111, 1, 1, 1, 1, 1,
-1.019829, 0.6910231, -0.9836541, 1, 1, 1, 1, 1,
-1.01448, 0.9959571, -0.5610999, 1, 1, 1, 1, 1,
-1.010945, 0.1025292, -2.37096, 0, 0, 1, 1, 1,
-1.006357, -1.591176, -3.360042, 1, 0, 0, 1, 1,
-1.006314, 0.1847655, -1.997647, 1, 0, 0, 1, 1,
-1.006107, 0.6794983, -0.7680131, 1, 0, 0, 1, 1,
-1.000437, 0.7735323, -0.6661893, 1, 0, 0, 1, 1,
-0.9986175, -0.2105787, -4.18922, 1, 0, 0, 1, 1,
-0.9856281, 0.1668762, 0.05326222, 0, 0, 0, 1, 1,
-0.9826501, 0.3676166, -0.3863283, 0, 0, 0, 1, 1,
-0.9809912, 0.864472, -2.399606, 0, 0, 0, 1, 1,
-0.9784851, -0.192499, -0.1246598, 0, 0, 0, 1, 1,
-0.9779805, -1.202961, -1.962773, 0, 0, 0, 1, 1,
-0.9773852, 0.7860012, -1.022923, 0, 0, 0, 1, 1,
-0.9766102, -1.311331, -4.345387, 0, 0, 0, 1, 1,
-0.970112, 0.4504617, -0.7346349, 1, 1, 1, 1, 1,
-0.9621149, -0.499054, -1.526387, 1, 1, 1, 1, 1,
-0.9480737, -0.4502345, -1.834186, 1, 1, 1, 1, 1,
-0.9477164, -1.296857, -0.3648347, 1, 1, 1, 1, 1,
-0.9451169, 0.8049593, -1.42287, 1, 1, 1, 1, 1,
-0.9447051, -0.1055227, 0.5660315, 1, 1, 1, 1, 1,
-0.9369201, 0.05283788, -2.331217, 1, 1, 1, 1, 1,
-0.9359522, 0.7912172, -0.03882257, 1, 1, 1, 1, 1,
-0.9319636, 1.417802, -0.1894019, 1, 1, 1, 1, 1,
-0.9191944, -0.7255731, -2.861757, 1, 1, 1, 1, 1,
-0.9170528, -0.3952873, -2.452535, 1, 1, 1, 1, 1,
-0.9146271, 0.2768731, -0.3600306, 1, 1, 1, 1, 1,
-0.9131844, 0.6036913, -1.751472, 1, 1, 1, 1, 1,
-0.91049, -0.0278041, -0.3711613, 1, 1, 1, 1, 1,
-0.9096916, 0.3192442, -3.148577, 1, 1, 1, 1, 1,
-0.9094259, -1.24512, -1.994973, 0, 0, 1, 1, 1,
-0.905264, -1.324888, -4.837606, 1, 0, 0, 1, 1,
-0.9052477, -1.110029, -2.694799, 1, 0, 0, 1, 1,
-0.9034727, -1.439783, -2.207545, 1, 0, 0, 1, 1,
-0.9034267, 0.4517198, -0.1323123, 1, 0, 0, 1, 1,
-0.9005316, 0.3123935, -0.8485298, 1, 0, 0, 1, 1,
-0.8998954, -0.4814546, -1.894466, 0, 0, 0, 1, 1,
-0.8996983, 0.6104212, -0.7626361, 0, 0, 0, 1, 1,
-0.8984315, -1.323846, -1.222212, 0, 0, 0, 1, 1,
-0.8939101, -0.2263022, -0.2752804, 0, 0, 0, 1, 1,
-0.8937072, -0.3566534, -2.090578, 0, 0, 0, 1, 1,
-0.8884587, -1.302366, -2.478568, 0, 0, 0, 1, 1,
-0.8849154, 0.0158867, -0.4327436, 0, 0, 0, 1, 1,
-0.8752277, -0.432712, -0.4343376, 1, 1, 1, 1, 1,
-0.8747377, -0.6123799, -2.577279, 1, 1, 1, 1, 1,
-0.8699756, 0.2202793, -2.313068, 1, 1, 1, 1, 1,
-0.8680914, 0.9200422, -1.294346, 1, 1, 1, 1, 1,
-0.8625993, 1.470481, 1.257035, 1, 1, 1, 1, 1,
-0.8607821, 0.3304492, -1.884321, 1, 1, 1, 1, 1,
-0.859562, 0.3863417, -0.7428584, 1, 1, 1, 1, 1,
-0.8588274, -0.6802722, -3.40806, 1, 1, 1, 1, 1,
-0.8552635, -1.007022, -2.351845, 1, 1, 1, 1, 1,
-0.8545675, -0.7988986, -3.368168, 1, 1, 1, 1, 1,
-0.8544312, -0.5958139, -2.356262, 1, 1, 1, 1, 1,
-0.852598, -0.5980268, -2.291157, 1, 1, 1, 1, 1,
-0.847025, -0.2740244, -2.700326, 1, 1, 1, 1, 1,
-0.8464121, 1.898625, -1.15373, 1, 1, 1, 1, 1,
-0.8408328, 0.9403807, -1.750518, 1, 1, 1, 1, 1,
-0.8373637, -0.1560101, 0.8441406, 0, 0, 1, 1, 1,
-0.8372297, -0.1866347, -2.925986, 1, 0, 0, 1, 1,
-0.8369859, -0.08771385, -1.127493, 1, 0, 0, 1, 1,
-0.8311898, -1.027397, -1.498157, 1, 0, 0, 1, 1,
-0.8201026, 0.1254079, -0.571422, 1, 0, 0, 1, 1,
-0.8172947, -0.2637625, -1.286966, 1, 0, 0, 1, 1,
-0.8146545, 1.258011, -0.4592571, 0, 0, 0, 1, 1,
-0.8097109, 0.8991188, -0.1422896, 0, 0, 0, 1, 1,
-0.8072094, 0.7179191, -1.200173, 0, 0, 0, 1, 1,
-0.8007574, 1.145333, -0.6279854, 0, 0, 0, 1, 1,
-0.7958643, -0.6745003, -1.9717, 0, 0, 0, 1, 1,
-0.7950298, -0.2310787, -0.604311, 0, 0, 0, 1, 1,
-0.7883847, 0.4546361, -0.048023, 0, 0, 0, 1, 1,
-0.7845922, -0.6133562, -2.304452, 1, 1, 1, 1, 1,
-0.7840912, -1.15458, -3.01984, 1, 1, 1, 1, 1,
-0.7832587, -1.181963, -3.096397, 1, 1, 1, 1, 1,
-0.7811637, -1.365904, -2.162045, 1, 1, 1, 1, 1,
-0.7799033, 0.2259856, -1.417999, 1, 1, 1, 1, 1,
-0.779276, -0.9762173, -0.1201116, 1, 1, 1, 1, 1,
-0.7779773, 0.1570891, -1.077487, 1, 1, 1, 1, 1,
-0.7664853, -1.305, -4.373531, 1, 1, 1, 1, 1,
-0.7648678, 0.3496841, -1.533666, 1, 1, 1, 1, 1,
-0.7627988, 1.678523, -0.04472064, 1, 1, 1, 1, 1,
-0.7589225, 0.9611602, 1.361093, 1, 1, 1, 1, 1,
-0.7589142, 1.071262, 0.4344535, 1, 1, 1, 1, 1,
-0.7546754, -2.362334, -1.825007, 1, 1, 1, 1, 1,
-0.7510362, 0.1299044, -2.242502, 1, 1, 1, 1, 1,
-0.7506919, 0.822183, -0.5546883, 1, 1, 1, 1, 1,
-0.7503288, 0.2876535, -1.645701, 0, 0, 1, 1, 1,
-0.7503235, -1.554012, -2.457429, 1, 0, 0, 1, 1,
-0.7413626, -0.2013518, -3.322582, 1, 0, 0, 1, 1,
-0.7409055, 0.7196723, -1.350075, 1, 0, 0, 1, 1,
-0.7378429, 0.436592, 0.5203751, 1, 0, 0, 1, 1,
-0.7372081, -0.08505469, -2.932057, 1, 0, 0, 1, 1,
-0.726272, 0.5211799, -2.221774, 0, 0, 0, 1, 1,
-0.7203974, -1.589636, -2.212973, 0, 0, 0, 1, 1,
-0.7176928, -0.9328447, -2.147007, 0, 0, 0, 1, 1,
-0.716513, -0.04851286, -1.489562, 0, 0, 0, 1, 1,
-0.7164313, -0.5298639, -1.682834, 0, 0, 0, 1, 1,
-0.7140267, -0.7522197, -2.856255, 0, 0, 0, 1, 1,
-0.7100557, -0.3474783, -1.94625, 0, 0, 0, 1, 1,
-0.7095417, -0.3987066, -2.259524, 1, 1, 1, 1, 1,
-0.6985063, 1.185423, -0.4890585, 1, 1, 1, 1, 1,
-0.6906807, -0.974105, -0.7099465, 1, 1, 1, 1, 1,
-0.6876963, -0.1403656, -1.778772, 1, 1, 1, 1, 1,
-0.6876572, 0.3014191, -1.168856, 1, 1, 1, 1, 1,
-0.6852568, 1.806633, 0.08755825, 1, 1, 1, 1, 1,
-0.679593, 0.9195986, -1.64409, 1, 1, 1, 1, 1,
-0.6769255, -0.3343466, -2.354312, 1, 1, 1, 1, 1,
-0.6696373, 1.109987, -0.738344, 1, 1, 1, 1, 1,
-0.6648443, -0.8431532, -1.556907, 1, 1, 1, 1, 1,
-0.6635879, 0.8043239, 0.7382454, 1, 1, 1, 1, 1,
-0.6629585, -0.7918668, -1.630065, 1, 1, 1, 1, 1,
-0.6607903, -0.3246084, -1.108736, 1, 1, 1, 1, 1,
-0.6590207, 0.4874046, -0.02350939, 1, 1, 1, 1, 1,
-0.658959, 1.422546, -0.05484322, 1, 1, 1, 1, 1,
-0.6497078, -0.7980717, -3.582977, 0, 0, 1, 1, 1,
-0.6495471, -0.6321918, -1.436055, 1, 0, 0, 1, 1,
-0.6494769, 0.7777556, -0.3374668, 1, 0, 0, 1, 1,
-0.6490469, 1.071821, -2.083184, 1, 0, 0, 1, 1,
-0.6489195, 0.877578, -2.450424, 1, 0, 0, 1, 1,
-0.6467193, -0.1818487, -1.553373, 1, 0, 0, 1, 1,
-0.6454875, -1.224684, -0.5623242, 0, 0, 0, 1, 1,
-0.6373904, 1.416405, -1.382868, 0, 0, 0, 1, 1,
-0.6363475, 0.9111367, -0.07738613, 0, 0, 0, 1, 1,
-0.635151, -0.4071768, -2.612596, 0, 0, 0, 1, 1,
-0.6337636, 1.281854, -0.9988607, 0, 0, 0, 1, 1,
-0.6321586, -0.1315232, -1.275, 0, 0, 0, 1, 1,
-0.6278259, -2.06143, -1.719386, 0, 0, 0, 1, 1,
-0.6270589, -0.2552306, -1.173733, 1, 1, 1, 1, 1,
-0.6263663, 0.6011148, -1.029581, 1, 1, 1, 1, 1,
-0.623686, 0.2577789, -0.7971594, 1, 1, 1, 1, 1,
-0.6232097, -1.174672, -2.985573, 1, 1, 1, 1, 1,
-0.6224656, -0.4128795, -2.346605, 1, 1, 1, 1, 1,
-0.6216926, -2.360048, -3.412994, 1, 1, 1, 1, 1,
-0.6205278, 1.354431, -1.566383, 1, 1, 1, 1, 1,
-0.618127, -0.5473912, -1.948129, 1, 1, 1, 1, 1,
-0.6114887, 0.5576843, 0.2198946, 1, 1, 1, 1, 1,
-0.6088775, 0.119216, -0.2673949, 1, 1, 1, 1, 1,
-0.6071124, 0.9740609, -1.0393, 1, 1, 1, 1, 1,
-0.6034942, 1.360183, -0.1548022, 1, 1, 1, 1, 1,
-0.6015067, -0.2189342, -0.5356415, 1, 1, 1, 1, 1,
-0.6005274, 1.05685, 0.1589753, 1, 1, 1, 1, 1,
-0.5978567, -0.3274982, -1.366629, 1, 1, 1, 1, 1,
-0.5974064, -0.1548937, -2.097916, 0, 0, 1, 1, 1,
-0.5870116, -0.4274988, -1.249183, 1, 0, 0, 1, 1,
-0.5867342, -0.2969633, -3.233394, 1, 0, 0, 1, 1,
-0.5865071, 0.4716366, -0.1120704, 1, 0, 0, 1, 1,
-0.5813122, -0.211046, -1.461045, 1, 0, 0, 1, 1,
-0.5787702, 0.5291277, -1.735182, 1, 0, 0, 1, 1,
-0.5695453, -1.258356, -3.620958, 0, 0, 0, 1, 1,
-0.5690643, -0.4979889, -2.62418, 0, 0, 0, 1, 1,
-0.5680381, -1.345595, -3.980053, 0, 0, 0, 1, 1,
-0.5672961, -0.8471419, -3.301466, 0, 0, 0, 1, 1,
-0.5647379, 0.2932089, 0.09518775, 0, 0, 0, 1, 1,
-0.5613597, 1.5156, -1.27435, 0, 0, 0, 1, 1,
-0.5535353, 0.7184929, 2.528761, 0, 0, 0, 1, 1,
-0.5511491, 1.568394, -0.07807114, 1, 1, 1, 1, 1,
-0.5510938, -0.8902183, -2.102531, 1, 1, 1, 1, 1,
-0.5506582, 0.3979873, -0.9780004, 1, 1, 1, 1, 1,
-0.5441242, -2.0862, -2.506924, 1, 1, 1, 1, 1,
-0.5428697, -0.2106015, -3.258263, 1, 1, 1, 1, 1,
-0.5421985, 0.589259, -1.548628, 1, 1, 1, 1, 1,
-0.5374247, -1.002951, -2.49714, 1, 1, 1, 1, 1,
-0.5245522, -2.028219, -4.082642, 1, 1, 1, 1, 1,
-0.5239405, 2.064348, 0.5035539, 1, 1, 1, 1, 1,
-0.5235466, -0.529089, -4.679264, 1, 1, 1, 1, 1,
-0.5177693, 0.9536155, -1.962129, 1, 1, 1, 1, 1,
-0.5144169, -2.395314, -3.167423, 1, 1, 1, 1, 1,
-0.5128775, 0.9013559, 0.9780743, 1, 1, 1, 1, 1,
-0.5101709, 0.9878021, 0.2163522, 1, 1, 1, 1, 1,
-0.5093839, -0.6345557, -3.164447, 1, 1, 1, 1, 1,
-0.5092678, -1.757767, -2.586468, 0, 0, 1, 1, 1,
-0.5092425, -0.06655198, 0.00918552, 1, 0, 0, 1, 1,
-0.5067826, -1.631051, -2.714973, 1, 0, 0, 1, 1,
-0.5066588, -0.987688, -2.238237, 1, 0, 0, 1, 1,
-0.5063723, 0.5791484, 0.5036382, 1, 0, 0, 1, 1,
-0.5059341, 0.04019341, -1.419515, 1, 0, 0, 1, 1,
-0.5054798, -0.8326667, -3.643734, 0, 0, 0, 1, 1,
-0.5053302, -1.007683, -2.193606, 0, 0, 0, 1, 1,
-0.5032786, -1.290873, -2.720105, 0, 0, 0, 1, 1,
-0.5031596, -0.9130527, -1.751905, 0, 0, 0, 1, 1,
-0.5010532, -0.9208587, -3.724056, 0, 0, 0, 1, 1,
-0.499762, -0.4634804, -3.377066, 0, 0, 0, 1, 1,
-0.4955448, 1.417637, -1.097414, 0, 0, 0, 1, 1,
-0.4924509, 0.3188162, -0.8977653, 1, 1, 1, 1, 1,
-0.4887947, -0.3497544, -2.566501, 1, 1, 1, 1, 1,
-0.4881435, 2.098456, -1.817383, 1, 1, 1, 1, 1,
-0.4868177, 0.77213, 1.164319, 1, 1, 1, 1, 1,
-0.4865383, 1.866324, 0.07363533, 1, 1, 1, 1, 1,
-0.4842478, -0.8557739, -2.209579, 1, 1, 1, 1, 1,
-0.48042, -1.878168, -1.82137, 1, 1, 1, 1, 1,
-0.4779404, 0.9097391, -0.5779943, 1, 1, 1, 1, 1,
-0.4756714, 0.1479021, -1.805011, 1, 1, 1, 1, 1,
-0.4741233, 0.07899789, -0.5587512, 1, 1, 1, 1, 1,
-0.4735903, -0.402171, -2.574157, 1, 1, 1, 1, 1,
-0.47341, -0.1123074, -0.8104293, 1, 1, 1, 1, 1,
-0.4726995, -1.466713, -2.35177, 1, 1, 1, 1, 1,
-0.469927, -0.5932276, -1.968983, 1, 1, 1, 1, 1,
-0.4684597, -0.2105145, -2.786112, 1, 1, 1, 1, 1,
-0.4682296, 0.3315516, -1.515057, 0, 0, 1, 1, 1,
-0.4679188, -0.3908264, -2.57184, 1, 0, 0, 1, 1,
-0.4660871, -1.161712, -2.308052, 1, 0, 0, 1, 1,
-0.4655539, 1.642864, 2.162394, 1, 0, 0, 1, 1,
-0.4561746, 0.1477597, -1.489676, 1, 0, 0, 1, 1,
-0.4541174, 0.5664361, -0.3663096, 1, 0, 0, 1, 1,
-0.452177, -0.5284878, -1.36659, 0, 0, 0, 1, 1,
-0.4507976, 0.1852902, -3.258669, 0, 0, 0, 1, 1,
-0.4487855, -0.7337922, -2.164765, 0, 0, 0, 1, 1,
-0.4423174, -0.715744, -4.374047, 0, 0, 0, 1, 1,
-0.4406382, 0.1033498, 0.24953, 0, 0, 0, 1, 1,
-0.4402152, -0.4288555, -2.591074, 0, 0, 0, 1, 1,
-0.4215541, -0.2337057, -1.756147, 0, 0, 0, 1, 1,
-0.4178358, 0.008913165, -1.806613, 1, 1, 1, 1, 1,
-0.417413, 1.316874, -0.849403, 1, 1, 1, 1, 1,
-0.4149867, -1.28953, -4.231639, 1, 1, 1, 1, 1,
-0.414183, 0.1784943, -1.456725, 1, 1, 1, 1, 1,
-0.4126208, 0.4631909, -0.6466836, 1, 1, 1, 1, 1,
-0.4095098, 0.3133979, -0.9510819, 1, 1, 1, 1, 1,
-0.4081576, -0.5569186, -2.318783, 1, 1, 1, 1, 1,
-0.4056276, -0.7406086, -2.291672, 1, 1, 1, 1, 1,
-0.4046683, -0.9915095, -3.318312, 1, 1, 1, 1, 1,
-0.4018327, -0.7479854, -2.290093, 1, 1, 1, 1, 1,
-0.3997234, 0.1238961, 0.64901, 1, 1, 1, 1, 1,
-0.3967746, 0.2741417, -1.102514, 1, 1, 1, 1, 1,
-0.3951312, 0.3053637, -0.7397491, 1, 1, 1, 1, 1,
-0.3946135, -0.6614642, -4.135262, 1, 1, 1, 1, 1,
-0.3941868, -0.8209252, -3.791397, 1, 1, 1, 1, 1,
-0.389897, -0.3128279, -0.1811737, 0, 0, 1, 1, 1,
-0.3876087, 0.1713716, -2.315379, 1, 0, 0, 1, 1,
-0.382697, 0.005228764, -0.2308656, 1, 0, 0, 1, 1,
-0.3770362, 0.05724411, 0.7267397, 1, 0, 0, 1, 1,
-0.3758166, -1.563348, -3.451088, 1, 0, 0, 1, 1,
-0.3740323, -0.9464102, -0.3786123, 1, 0, 0, 1, 1,
-0.3736412, -0.6806688, -3.830316, 0, 0, 0, 1, 1,
-0.3732952, -1.093733, -3.533829, 0, 0, 0, 1, 1,
-0.3730349, 0.8833762, -2.557674, 0, 0, 0, 1, 1,
-0.3726311, -1.20624, -3.511954, 0, 0, 0, 1, 1,
-0.3681874, -1.073328, -4.218724, 0, 0, 0, 1, 1,
-0.3681599, 0.4237852, -1.357262, 0, 0, 0, 1, 1,
-0.3669299, 0.5580408, -0.003115731, 0, 0, 0, 1, 1,
-0.3653002, -1.802364, -2.821618, 1, 1, 1, 1, 1,
-0.3610736, -0.6489553, -2.818429, 1, 1, 1, 1, 1,
-0.3606604, -1.050305, -4.200886, 1, 1, 1, 1, 1,
-0.3603468, 0.07985792, -0.9256509, 1, 1, 1, 1, 1,
-0.3583764, 0.8873293, -1.169, 1, 1, 1, 1, 1,
-0.3554967, -0.1275614, -1.301817, 1, 1, 1, 1, 1,
-0.3512114, -0.2257216, -1.313001, 1, 1, 1, 1, 1,
-0.3508898, -0.1783705, -1.208676, 1, 1, 1, 1, 1,
-0.3497289, -1.088476, -1.861662, 1, 1, 1, 1, 1,
-0.346089, -0.4634871, -3.083567, 1, 1, 1, 1, 1,
-0.3450591, -0.7498046, -2.390422, 1, 1, 1, 1, 1,
-0.3444461, -0.7405252, -1.007412, 1, 1, 1, 1, 1,
-0.3433168, -0.3447397, -2.317259, 1, 1, 1, 1, 1,
-0.3420746, 1.611069, -0.009206025, 1, 1, 1, 1, 1,
-0.341017, -0.7938602, -5.062002, 1, 1, 1, 1, 1,
-0.3373242, -0.9155873, -3.724395, 0, 0, 1, 1, 1,
-0.3281172, 0.6164652, 0.2323368, 1, 0, 0, 1, 1,
-0.3250163, -0.9768363, -3.701457, 1, 0, 0, 1, 1,
-0.324294, 0.7207058, -0.5750073, 1, 0, 0, 1, 1,
-0.3189299, 2.281262, 1.118412, 1, 0, 0, 1, 1,
-0.3149583, 0.9197783, -0.5118967, 1, 0, 0, 1, 1,
-0.3139428, -1.210215, -3.030236, 0, 0, 0, 1, 1,
-0.3101169, 0.7196491, -0.494364, 0, 0, 0, 1, 1,
-0.304967, -0.2659847, -2.648872, 0, 0, 0, 1, 1,
-0.295225, 0.9192411, 0.6153413, 0, 0, 0, 1, 1,
-0.2913429, 0.9892488, 1.073929, 0, 0, 0, 1, 1,
-0.2904553, 2.563023, 0.03050773, 0, 0, 0, 1, 1,
-0.2897945, 0.3846712, -0.7028272, 0, 0, 0, 1, 1,
-0.2879126, 0.3701313, 0.4564141, 1, 1, 1, 1, 1,
-0.2870553, 0.5518573, -0.8259927, 1, 1, 1, 1, 1,
-0.2851878, -0.3495728, -4.227467, 1, 1, 1, 1, 1,
-0.2831231, 1.347806, 0.3256663, 1, 1, 1, 1, 1,
-0.2796077, -0.765669, -1.789035, 1, 1, 1, 1, 1,
-0.2739561, 0.9294924, -0.959231, 1, 1, 1, 1, 1,
-0.2639032, -1.666006, -1.436699, 1, 1, 1, 1, 1,
-0.2638346, 0.381071, -1.753008, 1, 1, 1, 1, 1,
-0.2628765, -0.2189405, -2.150354, 1, 1, 1, 1, 1,
-0.2624092, 0.2876908, -0.4172094, 1, 1, 1, 1, 1,
-0.2622156, -1.889668, -2.864883, 1, 1, 1, 1, 1,
-0.2620767, 0.2864209, -1.047405, 1, 1, 1, 1, 1,
-0.2613512, -0.5769324, -2.525501, 1, 1, 1, 1, 1,
-0.2581098, -2.868782, -5.250681, 1, 1, 1, 1, 1,
-0.2550785, -1.095354, -3.118675, 1, 1, 1, 1, 1,
-0.2546229, 0.8774112, -1.724574, 0, 0, 1, 1, 1,
-0.2492407, 0.06445175, -1.287298, 1, 0, 0, 1, 1,
-0.2464236, 1.124043, -2.072159, 1, 0, 0, 1, 1,
-0.2421358, 0.9927039, -0.4530696, 1, 0, 0, 1, 1,
-0.2391331, -0.134116, -1.145298, 1, 0, 0, 1, 1,
-0.2387884, 1.741341, 0.1363148, 1, 0, 0, 1, 1,
-0.2370881, -1.681904, -3.309284, 0, 0, 0, 1, 1,
-0.2361379, -0.3581537, -2.560702, 0, 0, 0, 1, 1,
-0.2338462, -0.06832501, -2.276653, 0, 0, 0, 1, 1,
-0.2225033, 2.077675, 0.5161427, 0, 0, 0, 1, 1,
-0.2222881, 0.6504594, -0.7682858, 0, 0, 0, 1, 1,
-0.2187517, -0.03877054, -0.7809943, 0, 0, 0, 1, 1,
-0.2160842, -0.4725447, -1.587688, 0, 0, 0, 1, 1,
-0.2146677, -1.021357, -4.112655, 1, 1, 1, 1, 1,
-0.1983935, -0.4922186, -3.407698, 1, 1, 1, 1, 1,
-0.1943337, 0.3449667, -1.676577, 1, 1, 1, 1, 1,
-0.1933081, -1.587412, -1.348905, 1, 1, 1, 1, 1,
-0.1919926, 2.471094, 0.4106408, 1, 1, 1, 1, 1,
-0.1918795, 1.032987, -0.1515413, 1, 1, 1, 1, 1,
-0.1877652, 1.271807, -0.08559716, 1, 1, 1, 1, 1,
-0.1709687, -0.3312895, -1.866465, 1, 1, 1, 1, 1,
-0.1707106, -1.353658, -2.178515, 1, 1, 1, 1, 1,
-0.1695955, 1.157706, 0.005421509, 1, 1, 1, 1, 1,
-0.166926, -0.5604025, -2.360428, 1, 1, 1, 1, 1,
-0.1651147, 0.2919695, -1.146334, 1, 1, 1, 1, 1,
-0.164813, -0.4474297, -2.271143, 1, 1, 1, 1, 1,
-0.1637549, -0.3281288, -4.423523, 1, 1, 1, 1, 1,
-0.1615337, 1.316918, 0.5791174, 1, 1, 1, 1, 1,
-0.1540657, 1.559227, 1.395581, 0, 0, 1, 1, 1,
-0.1473661, -0.8069823, -3.04291, 1, 0, 0, 1, 1,
-0.1428275, 1.958313, 0.488633, 1, 0, 0, 1, 1,
-0.1404772, 0.6505988, 0.8500078, 1, 0, 0, 1, 1,
-0.1396928, 0.1627399, -1.29511, 1, 0, 0, 1, 1,
-0.1392588, -1.179165, -1.892603, 1, 0, 0, 1, 1,
-0.1373754, -0.01851592, -0.7680862, 0, 0, 0, 1, 1,
-0.1359646, 0.442232, -1.899914, 0, 0, 0, 1, 1,
-0.1358676, 1.609062, 0.1078293, 0, 0, 0, 1, 1,
-0.1354807, 1.114128, -0.3314412, 0, 0, 0, 1, 1,
-0.1353958, 1.129302, -1.232057, 0, 0, 0, 1, 1,
-0.1319971, 0.3185091, -0.117039, 0, 0, 0, 1, 1,
-0.129471, -1.279839, -0.9419674, 0, 0, 0, 1, 1,
-0.1268199, -0.1892559, -2.75251, 1, 1, 1, 1, 1,
-0.1223099, 0.3543461, -0.9763707, 1, 1, 1, 1, 1,
-0.1221515, -1.134495, -4.21914, 1, 1, 1, 1, 1,
-0.1198179, 0.7170549, -1.322796, 1, 1, 1, 1, 1,
-0.1159373, -1.718454, -3.462241, 1, 1, 1, 1, 1,
-0.1127096, -0.2934239, -2.799942, 1, 1, 1, 1, 1,
-0.1092619, -0.8740343, -1.357876, 1, 1, 1, 1, 1,
-0.09942837, 0.6864058, 0.5440548, 1, 1, 1, 1, 1,
-0.09597342, -2.003357, -3.0117, 1, 1, 1, 1, 1,
-0.09498915, 0.006812964, -1.523558, 1, 1, 1, 1, 1,
-0.09084529, -0.05593979, 0.08069295, 1, 1, 1, 1, 1,
-0.08611035, -0.8435932, -4.271084, 1, 1, 1, 1, 1,
-0.08481335, 0.4868013, -0.7674449, 1, 1, 1, 1, 1,
-0.07917468, -1.022124, -3.971995, 1, 1, 1, 1, 1,
-0.07869907, 0.904447, 1.298566, 1, 1, 1, 1, 1,
-0.07336839, -1.549893, -1.805878, 0, 0, 1, 1, 1,
-0.07241301, -0.2189345, -3.656212, 1, 0, 0, 1, 1,
-0.07086567, 0.455464, -0.1818412, 1, 0, 0, 1, 1,
-0.0640565, -1.302345, -0.6817172, 1, 0, 0, 1, 1,
-0.06386951, 0.3153527, -1.756844, 1, 0, 0, 1, 1,
-0.06229001, -0.7803829, -2.459902, 1, 0, 0, 1, 1,
-0.05846915, -0.05429262, -2.528875, 0, 0, 0, 1, 1,
-0.05523243, 0.007801556, -3.191936, 0, 0, 0, 1, 1,
-0.05379914, 0.5735061, -0.4380344, 0, 0, 0, 1, 1,
-0.05035011, 0.1184837, 0.1105739, 0, 0, 0, 1, 1,
-0.04791909, 0.5593461, -0.1785075, 0, 0, 0, 1, 1,
-0.04716043, 0.2961752, 0.2603409, 0, 0, 0, 1, 1,
-0.04564139, -0.1649917, -3.374856, 0, 0, 0, 1, 1,
-0.04507179, -0.5634967, -4.37664, 1, 1, 1, 1, 1,
-0.04487264, 0.5791188, -0.3407971, 1, 1, 1, 1, 1,
-0.04385591, -0.1902635, -1.896069, 1, 1, 1, 1, 1,
-0.04295664, -0.3029403, -4.716423, 1, 1, 1, 1, 1,
-0.04104982, -0.1875228, -3.437199, 1, 1, 1, 1, 1,
-0.03988587, 0.7420259, 0.9316995, 1, 1, 1, 1, 1,
-0.0306364, 0.4632493, 0.5486857, 1, 1, 1, 1, 1,
-0.02985642, 0.6486716, -0.3688019, 1, 1, 1, 1, 1,
-0.02812392, 2.403199, 1.721257, 1, 1, 1, 1, 1,
-0.02597035, 0.2129204, 1.042008, 1, 1, 1, 1, 1,
-0.02118081, -0.4427241, -3.650474, 1, 1, 1, 1, 1,
-0.01813868, 0.9874511, 1.756571, 1, 1, 1, 1, 1,
-0.01393537, 0.3478277, 1.069755, 1, 1, 1, 1, 1,
-0.004182255, -1.174081, -3.859798, 1, 1, 1, 1, 1,
0.0009628069, -0.656824, 1.779178, 1, 1, 1, 1, 1,
0.002369868, 0.1846779, -0.3440709, 0, 0, 1, 1, 1,
0.004869044, 0.5070906, 1.230766, 1, 0, 0, 1, 1,
0.005425386, 0.3184876, 0.1528166, 1, 0, 0, 1, 1,
0.01266677, -0.989188, 2.416678, 1, 0, 0, 1, 1,
0.0129739, -0.5346466, 2.443704, 1, 0, 0, 1, 1,
0.01330773, 0.5965032, 0.2049142, 1, 0, 0, 1, 1,
0.02073774, -1.479329, 2.146093, 0, 0, 0, 1, 1,
0.02620783, -1.137342, 3.983284, 0, 0, 0, 1, 1,
0.02674931, 0.4366455, 0.2741018, 0, 0, 0, 1, 1,
0.02865265, -0.6263467, 2.692141, 0, 0, 0, 1, 1,
0.02884788, -0.05228908, 2.26965, 0, 0, 0, 1, 1,
0.03205537, -0.6500555, 1.905592, 0, 0, 0, 1, 1,
0.03280757, -0.773726, 2.299183, 0, 0, 0, 1, 1,
0.03316995, -0.3978848, 1.670164, 1, 1, 1, 1, 1,
0.03412775, -0.2631471, 3.179185, 1, 1, 1, 1, 1,
0.03842785, 1.238983, -0.01215088, 1, 1, 1, 1, 1,
0.04107524, -0.4824908, 2.671287, 1, 1, 1, 1, 1,
0.04179195, -0.9547614, 2.617876, 1, 1, 1, 1, 1,
0.04361188, -0.4071501, 3.80103, 1, 1, 1, 1, 1,
0.04366126, -2.094775, 3.298377, 1, 1, 1, 1, 1,
0.04468421, -0.4369825, 3.724531, 1, 1, 1, 1, 1,
0.04480722, 1.052357, -0.3015803, 1, 1, 1, 1, 1,
0.0460461, 0.5580447, 0.6419193, 1, 1, 1, 1, 1,
0.05073416, 0.4811461, 0.5655407, 1, 1, 1, 1, 1,
0.0536606, -1.814882, 2.692817, 1, 1, 1, 1, 1,
0.06050902, -0.7236294, 2.227088, 1, 1, 1, 1, 1,
0.06256241, -1.545989, 2.32609, 1, 1, 1, 1, 1,
0.06422942, 0.2739421, 0.8310794, 1, 1, 1, 1, 1,
0.06509045, 0.5347391, 0.6201284, 0, 0, 1, 1, 1,
0.06516305, -1.447636, 1.974557, 1, 0, 0, 1, 1,
0.06523456, -1.821215, 3.265002, 1, 0, 0, 1, 1,
0.06584065, 1.39278, -0.8379764, 1, 0, 0, 1, 1,
0.06721297, -0.7909504, 4.610292, 1, 0, 0, 1, 1,
0.07001331, 1.341047, -0.8924949, 1, 0, 0, 1, 1,
0.07014713, 0.85963, -0.6031098, 0, 0, 0, 1, 1,
0.0709653, 0.3904922, -1.466539, 0, 0, 0, 1, 1,
0.07197598, -0.8720721, 3.193769, 0, 0, 0, 1, 1,
0.07428765, -0.4507462, 4.428287, 0, 0, 0, 1, 1,
0.07588679, 0.152808, 1.727806, 0, 0, 0, 1, 1,
0.08263708, -0.2079049, 3.154649, 0, 0, 0, 1, 1,
0.08457661, 0.4196269, 0.1348533, 0, 0, 0, 1, 1,
0.08459286, -0.2812969, 2.549962, 1, 1, 1, 1, 1,
0.08492908, 0.1904616, -0.6337746, 1, 1, 1, 1, 1,
0.08591345, 0.6842844, -0.9609789, 1, 1, 1, 1, 1,
0.08687692, 2.279155, 0.40659, 1, 1, 1, 1, 1,
0.09171654, 0.9439566, 0.32572, 1, 1, 1, 1, 1,
0.102255, 0.2529238, 1.926225, 1, 1, 1, 1, 1,
0.1071962, -0.1660528, 3.79441, 1, 1, 1, 1, 1,
0.1097736, -1.260273, 4.368379, 1, 1, 1, 1, 1,
0.1101315, -0.9824808, 3.898316, 1, 1, 1, 1, 1,
0.1116266, 0.9574941, 1.071328, 1, 1, 1, 1, 1,
0.1286264, 0.7056545, 0.1591246, 1, 1, 1, 1, 1,
0.1304438, 1.863832, 1.446916, 1, 1, 1, 1, 1,
0.1309117, 0.8559327, -0.3189497, 1, 1, 1, 1, 1,
0.1315535, -1.131781, 1.369303, 1, 1, 1, 1, 1,
0.1332587, 0.6935948, -0.1506031, 1, 1, 1, 1, 1,
0.1356436, -0.3879197, 2.229387, 0, 0, 1, 1, 1,
0.1414805, -1.922167, 3.503382, 1, 0, 0, 1, 1,
0.1430711, 0.5056779, 0.6312349, 1, 0, 0, 1, 1,
0.1450258, -0.9653805, 1.687818, 1, 0, 0, 1, 1,
0.1497056, 0.205108, 1.826428, 1, 0, 0, 1, 1,
0.1510489, -1.013724, 0.9521073, 1, 0, 0, 1, 1,
0.1517823, -1.604224, 2.300534, 0, 0, 0, 1, 1,
0.160299, 0.5118783, -1.14411, 0, 0, 0, 1, 1,
0.16061, 0.3327285, 0.510481, 0, 0, 0, 1, 1,
0.1614663, 1.077046, 0.6039162, 0, 0, 0, 1, 1,
0.1636726, -0.608084, 2.028581, 0, 0, 0, 1, 1,
0.1659179, 1.348802, 0.1772631, 0, 0, 0, 1, 1,
0.1686354, -1.425732, 2.344128, 0, 0, 0, 1, 1,
0.1696396, 1.335981, 2.486527, 1, 1, 1, 1, 1,
0.1712197, 0.1960006, 1.119915, 1, 1, 1, 1, 1,
0.1737522, 1.027165, 0.08576052, 1, 1, 1, 1, 1,
0.1786216, -1.217788, 1.155614, 1, 1, 1, 1, 1,
0.1801583, 0.5794869, 0.595348, 1, 1, 1, 1, 1,
0.1812034, -2.098355, 1.192918, 1, 1, 1, 1, 1,
0.1826414, -0.7878838, 2.419684, 1, 1, 1, 1, 1,
0.1848075, 1.71603, -0.07165702, 1, 1, 1, 1, 1,
0.1874121, 1.614346, 0.2266654, 1, 1, 1, 1, 1,
0.1902605, 1.051708, 0.5131075, 1, 1, 1, 1, 1,
0.1930759, -1.400863, 3.303389, 1, 1, 1, 1, 1,
0.2025099, 0.8472263, 0.4230948, 1, 1, 1, 1, 1,
0.2072599, 0.4416239, 1.910871, 1, 1, 1, 1, 1,
0.2142978, -1.296675, 3.239735, 1, 1, 1, 1, 1,
0.216945, -0.400297, 1.853425, 1, 1, 1, 1, 1,
0.2173137, 0.5906973, -0.02937603, 0, 0, 1, 1, 1,
0.2229002, 0.3975641, 0.5869688, 1, 0, 0, 1, 1,
0.2235352, -0.5429159, 3.187519, 1, 0, 0, 1, 1,
0.2290355, -2.189333, 2.688055, 1, 0, 0, 1, 1,
0.2301049, -0.9889838, 1.930069, 1, 0, 0, 1, 1,
0.2322039, -0.185271, 1.145669, 1, 0, 0, 1, 1,
0.2328503, 0.9607546, -0.3157877, 0, 0, 0, 1, 1,
0.2336399, -0.7484567, 2.67612, 0, 0, 0, 1, 1,
0.23366, -0.6874912, 2.516617, 0, 0, 0, 1, 1,
0.2347696, -1.095434, 3.933066, 0, 0, 0, 1, 1,
0.2352519, 0.14817, 1.47506, 0, 0, 0, 1, 1,
0.2355805, 1.428865, 0.4068036, 0, 0, 0, 1, 1,
0.2375676, -1.513546, 5.880362, 0, 0, 0, 1, 1,
0.2383789, 1.525619, 1.280072, 1, 1, 1, 1, 1,
0.2427991, -0.860849, 2.936881, 1, 1, 1, 1, 1,
0.2454144, 0.2030509, -0.6136029, 1, 1, 1, 1, 1,
0.2463535, 0.8255079, 0.3543235, 1, 1, 1, 1, 1,
0.2496822, 0.332649, -0.01812532, 1, 1, 1, 1, 1,
0.2503489, 0.6276335, 0.9361231, 1, 1, 1, 1, 1,
0.2549911, 0.6893873, 1.449958, 1, 1, 1, 1, 1,
0.2577471, -0.7018116, 2.668999, 1, 1, 1, 1, 1,
0.2653869, -2.438136, 3.436193, 1, 1, 1, 1, 1,
0.2670456, -0.6728554, 3.053746, 1, 1, 1, 1, 1,
0.2677547, -0.3920811, 3.826549, 1, 1, 1, 1, 1,
0.2687113, 0.05242559, 3.184164, 1, 1, 1, 1, 1,
0.2725938, 1.475988, 0.2959995, 1, 1, 1, 1, 1,
0.2730682, 1.364656, -0.97727, 1, 1, 1, 1, 1,
0.2744186, -1.499138, 3.997504, 1, 1, 1, 1, 1,
0.2745348, -0.05907154, 1.935132, 0, 0, 1, 1, 1,
0.2765125, -0.9875826, 3.954365, 1, 0, 0, 1, 1,
0.2780753, 0.3491934, 0.2879167, 1, 0, 0, 1, 1,
0.2804999, 1.427278, -0.07994735, 1, 0, 0, 1, 1,
0.2814308, 0.3371369, 2.217119, 1, 0, 0, 1, 1,
0.2816079, 0.7762062, -1.51468, 1, 0, 0, 1, 1,
0.2872518, 1.188077, 0.0764973, 0, 0, 0, 1, 1,
0.2921412, -0.9232575, 3.231826, 0, 0, 0, 1, 1,
0.2935904, -0.06795547, 3.271513, 0, 0, 0, 1, 1,
0.2999705, 1.997092, -0.2497881, 0, 0, 0, 1, 1,
0.3007339, -0.4365089, 2.106152, 0, 0, 0, 1, 1,
0.3025174, -0.3447684, 1.264757, 0, 0, 0, 1, 1,
0.3063813, -0.3733687, 2.65049, 0, 0, 0, 1, 1,
0.3064676, -0.9832118, 2.476858, 1, 1, 1, 1, 1,
0.3081183, -0.06344825, 1.869475, 1, 1, 1, 1, 1,
0.3112765, 0.3157163, 1.554411, 1, 1, 1, 1, 1,
0.3142962, -0.9486148, 2.743328, 1, 1, 1, 1, 1,
0.3154277, -0.8506954, 1.263917, 1, 1, 1, 1, 1,
0.3167928, 0.00544667, 0.6828763, 1, 1, 1, 1, 1,
0.3193319, -1.564896, 2.415109, 1, 1, 1, 1, 1,
0.3277341, -0.7011809, 4.604143, 1, 1, 1, 1, 1,
0.3331577, 0.817636, -0.2200567, 1, 1, 1, 1, 1,
0.3362749, -0.2642506, 2.662156, 1, 1, 1, 1, 1,
0.3374861, -0.1255642, 0.6562814, 1, 1, 1, 1, 1,
0.3380227, -0.6067587, 3.213609, 1, 1, 1, 1, 1,
0.3387741, -0.04201716, 3.035199, 1, 1, 1, 1, 1,
0.3408332, 0.01541735, 2.398613, 1, 1, 1, 1, 1,
0.3415923, -1.202578, 2.598659, 1, 1, 1, 1, 1,
0.3472741, 0.126138, 0.07334623, 0, 0, 1, 1, 1,
0.3537814, 0.6276389, -0.8270481, 1, 0, 0, 1, 1,
0.3586882, 0.6720836, 0.4352855, 1, 0, 0, 1, 1,
0.3665525, 1.023345, 1.834716, 1, 0, 0, 1, 1,
0.3690736, -0.3178154, 2.437863, 1, 0, 0, 1, 1,
0.3707529, -0.6568965, 3.828998, 1, 0, 0, 1, 1,
0.3778434, 0.1733934, 1.00129, 0, 0, 0, 1, 1,
0.3849365, 1.582419, 0.8822676, 0, 0, 0, 1, 1,
0.3854974, -0.8389202, 5.063607, 0, 0, 0, 1, 1,
0.3883342, 2.741459, 0.6025257, 0, 0, 0, 1, 1,
0.3884803, 0.2991477, 1.928903, 0, 0, 0, 1, 1,
0.3890387, -0.4725275, 2.164141, 0, 0, 0, 1, 1,
0.3912291, -0.1913766, 2.763121, 0, 0, 0, 1, 1,
0.3971242, -1.36951, 4.136609, 1, 1, 1, 1, 1,
0.4003302, -0.05949173, 0.4579592, 1, 1, 1, 1, 1,
0.4020836, -1.076042, 3.835064, 1, 1, 1, 1, 1,
0.4037558, -1.254689, 1.646629, 1, 1, 1, 1, 1,
0.4051368, -2.642143, 3.926207, 1, 1, 1, 1, 1,
0.4052172, 0.3138863, 0.8241923, 1, 1, 1, 1, 1,
0.4172032, 0.5591386, 0.9223877, 1, 1, 1, 1, 1,
0.4179432, 0.2088959, 1.053958, 1, 1, 1, 1, 1,
0.4194513, 0.5934935, 1.255058, 1, 1, 1, 1, 1,
0.4219597, -0.9853425, 4.949621, 1, 1, 1, 1, 1,
0.4220452, -1.291646, 3.092274, 1, 1, 1, 1, 1,
0.4227865, -0.4529516, 1.923069, 1, 1, 1, 1, 1,
0.4229288, -0.3156303, 2.872995, 1, 1, 1, 1, 1,
0.4262683, 0.5960777, 1.927479, 1, 1, 1, 1, 1,
0.4287259, -0.4430326, 3.113874, 1, 1, 1, 1, 1,
0.4326303, 0.07857076, 0.4225718, 0, 0, 1, 1, 1,
0.4338275, -1.120554, 2.790031, 1, 0, 0, 1, 1,
0.4347142, -1.750827, 0.8803598, 1, 0, 0, 1, 1,
0.4368891, 0.2770514, 2.118491, 1, 0, 0, 1, 1,
0.4370136, -0.2104554, 2.992918, 1, 0, 0, 1, 1,
0.439896, 0.7274533, -0.6320149, 1, 0, 0, 1, 1,
0.442204, -0.1328748, 1.19524, 0, 0, 0, 1, 1,
0.4422303, -0.5570512, -0.01809188, 0, 0, 0, 1, 1,
0.4426576, -1.444809, 2.118894, 0, 0, 0, 1, 1,
0.4432995, 1.268019, -2.092132, 0, 0, 0, 1, 1,
0.4464174, -1.217839, 1.991217, 0, 0, 0, 1, 1,
0.4474889, -0.1137059, 2.639956, 0, 0, 0, 1, 1,
0.4541764, 0.2527538, -0.7669482, 0, 0, 0, 1, 1,
0.4549407, 0.5580989, 1.781414, 1, 1, 1, 1, 1,
0.4584586, 1.071437, 0.3369416, 1, 1, 1, 1, 1,
0.4584609, 1.307631, 0.3298295, 1, 1, 1, 1, 1,
0.4591404, 1.830487, -1.425138, 1, 1, 1, 1, 1,
0.4591534, -1.178777, 2.496663, 1, 1, 1, 1, 1,
0.460348, 0.5646989, 1.719726, 1, 1, 1, 1, 1,
0.4620416, 1.481401, 1.860309, 1, 1, 1, 1, 1,
0.4622545, 1.47807, 0.4083501, 1, 1, 1, 1, 1,
0.4632502, -1.425305, 1.604767, 1, 1, 1, 1, 1,
0.466332, -0.9108913, 1.434578, 1, 1, 1, 1, 1,
0.4668229, -1.125646, 2.317602, 1, 1, 1, 1, 1,
0.4674565, -0.2577924, 0.337492, 1, 1, 1, 1, 1,
0.4682041, -0.481578, 4.538468, 1, 1, 1, 1, 1,
0.4719564, -1.345637, 2.307877, 1, 1, 1, 1, 1,
0.4720836, -0.1533408, 2.145389, 1, 1, 1, 1, 1,
0.4759151, 0.4281332, 0.8425245, 0, 0, 1, 1, 1,
0.4799003, 1.131613, -1.735103, 1, 0, 0, 1, 1,
0.4863697, 0.2743362, 0.2671535, 1, 0, 0, 1, 1,
0.4874124, -1.319922, 0.4179152, 1, 0, 0, 1, 1,
0.4968607, 0.7648361, 0.2427356, 1, 0, 0, 1, 1,
0.4971269, -0.596074, 1.277695, 1, 0, 0, 1, 1,
0.5004518, -0.1794136, 1.768498, 0, 0, 0, 1, 1,
0.5180113, 0.01098058, 1.804052, 0, 0, 0, 1, 1,
0.5203099, 0.2382333, 0.668896, 0, 0, 0, 1, 1,
0.5232251, 0.3363125, 2.658553, 0, 0, 0, 1, 1,
0.5254218, 0.587018, 0.7242085, 0, 0, 0, 1, 1,
0.5271164, 0.2200434, 0.6044037, 0, 0, 0, 1, 1,
0.5326738, -1.242971, 2.730757, 0, 0, 0, 1, 1,
0.5358686, 1.027388, 0.919758, 1, 1, 1, 1, 1,
0.5373657, 0.7960601, 0.4312185, 1, 1, 1, 1, 1,
0.5374709, -0.158621, 3.133578, 1, 1, 1, 1, 1,
0.5438209, 1.038778, 0.5641813, 1, 1, 1, 1, 1,
0.5438248, 0.2417095, 0.2390001, 1, 1, 1, 1, 1,
0.5453141, -0.8128563, 2.273086, 1, 1, 1, 1, 1,
0.554806, 0.3568372, -1.165822, 1, 1, 1, 1, 1,
0.5572247, 0.8918467, -0.9853464, 1, 1, 1, 1, 1,
0.5633488, 0.6556889, 0.9680328, 1, 1, 1, 1, 1,
0.5650311, 1.251315, -0.3996438, 1, 1, 1, 1, 1,
0.5656679, 2.023644, 0.5802371, 1, 1, 1, 1, 1,
0.5695501, 0.01577408, 0.4773723, 1, 1, 1, 1, 1,
0.5763713, -1.099346, 3.012747, 1, 1, 1, 1, 1,
0.5763959, -2.112179, 2.764753, 1, 1, 1, 1, 1,
0.5845393, 1.454355, 0.03434613, 1, 1, 1, 1, 1,
0.5891866, 1.043793, 1.060989, 0, 0, 1, 1, 1,
0.5916362, -0.8967938, 4.392564, 1, 0, 0, 1, 1,
0.597693, -1.023933, 3.719942, 1, 0, 0, 1, 1,
0.6012349, 0.752095, 0.7474396, 1, 0, 0, 1, 1,
0.6036755, -2.848003, 2.641389, 1, 0, 0, 1, 1,
0.6103499, -0.8417059, 4.118134, 1, 0, 0, 1, 1,
0.6163419, 0.1882244, 2.376665, 0, 0, 0, 1, 1,
0.6187306, 0.273075, -0.3182577, 0, 0, 0, 1, 1,
0.6381595, -0.2416739, 1.462035, 0, 0, 0, 1, 1,
0.63859, 0.5110646, -0.8839431, 0, 0, 0, 1, 1,
0.6434907, -0.8250973, 3.148774, 0, 0, 0, 1, 1,
0.652756, 1.400999, 3.684216, 0, 0, 0, 1, 1,
0.656074, -0.8546984, 2.23947, 0, 0, 0, 1, 1,
0.6601177, 0.1848248, 3.031255, 1, 1, 1, 1, 1,
0.6670555, -0.0791979, 0.8739591, 1, 1, 1, 1, 1,
0.6678128, 0.6752463, 0.9480193, 1, 1, 1, 1, 1,
0.6680773, -1.557255, 1.592233, 1, 1, 1, 1, 1,
0.668655, -1.749313, 4.963666, 1, 1, 1, 1, 1,
0.6711438, -0.04915406, 1.427242, 1, 1, 1, 1, 1,
0.6740036, -0.1927278, 0.8991806, 1, 1, 1, 1, 1,
0.6752448, 0.0914521, 2.01418, 1, 1, 1, 1, 1,
0.676588, -0.06347989, 2.047158, 1, 1, 1, 1, 1,
0.6770979, -1.218943, 1.709323, 1, 1, 1, 1, 1,
0.6797326, -0.579604, 3.072785, 1, 1, 1, 1, 1,
0.6808425, 0.07528545, -1.143689, 1, 1, 1, 1, 1,
0.6816033, 0.2193769, 0.9936926, 1, 1, 1, 1, 1,
0.6895082, -1.1598, 2.998569, 1, 1, 1, 1, 1,
0.6904561, -1.38391, 3.328583, 1, 1, 1, 1, 1,
0.6962878, -1.647555, 2.777881, 0, 0, 1, 1, 1,
0.6991378, 0.7182745, 1.370053, 1, 0, 0, 1, 1,
0.7054824, 0.7559014, -1.708731, 1, 0, 0, 1, 1,
0.7073979, -0.5087852, 1.838136, 1, 0, 0, 1, 1,
0.7086659, 1.082004, -0.05108682, 1, 0, 0, 1, 1,
0.7090676, -0.1243389, 0.03058079, 1, 0, 0, 1, 1,
0.710661, -1.795905, 2.32706, 0, 0, 0, 1, 1,
0.7118053, 0.7316725, 2.681779, 0, 0, 0, 1, 1,
0.7119976, 1.237732, 0.3047412, 0, 0, 0, 1, 1,
0.7156845, -0.8247734, 2.843934, 0, 0, 0, 1, 1,
0.7161063, 1.087539, 0.07568576, 0, 0, 0, 1, 1,
0.7179645, -0.5196518, 3.635258, 0, 0, 0, 1, 1,
0.7192771, 0.8548788, 1.132671, 0, 0, 0, 1, 1,
0.7235667, -1.01661, 1.638255, 1, 1, 1, 1, 1,
0.7258738, 0.8828066, 2.141442, 1, 1, 1, 1, 1,
0.7274942, -0.1354001, 1.611122, 1, 1, 1, 1, 1,
0.7284202, -1.596294, 2.929579, 1, 1, 1, 1, 1,
0.7337244, 0.8887644, 0.4143816, 1, 1, 1, 1, 1,
0.7397678, -0.5873485, 0.964386, 1, 1, 1, 1, 1,
0.7672633, 0.663105, -0.02693504, 1, 1, 1, 1, 1,
0.7684321, -0.2669906, 3.361355, 1, 1, 1, 1, 1,
0.7714624, -0.4439978, 1.426879, 1, 1, 1, 1, 1,
0.7747155, 1.070358, 0.03697906, 1, 1, 1, 1, 1,
0.777009, 0.9172178, 1.084295, 1, 1, 1, 1, 1,
0.7807337, 0.03926146, 2.477005, 1, 1, 1, 1, 1,
0.7860761, -0.0161084, 3.736044, 1, 1, 1, 1, 1,
0.7877411, 1.959579, 0.3530428, 1, 1, 1, 1, 1,
0.7896798, 0.3480656, 0.2770293, 1, 1, 1, 1, 1,
0.7912037, 0.350435, 1.042144, 0, 0, 1, 1, 1,
0.7949027, -0.4571387, 0.6449676, 1, 0, 0, 1, 1,
0.8016486, -0.4044949, 2.971335, 1, 0, 0, 1, 1,
0.8023083, 0.7956263, 1.325763, 1, 0, 0, 1, 1,
0.8079497, -0.6648961, 3.537435, 1, 0, 0, 1, 1,
0.8084002, -1.4146, 1.448171, 1, 0, 0, 1, 1,
0.8122545, 0.5667006, -0.5719184, 0, 0, 0, 1, 1,
0.8156104, -0.3891466, 2.061567, 0, 0, 0, 1, 1,
0.8195483, -0.8092594, 4.136978, 0, 0, 0, 1, 1,
0.8203953, 2.049021, 0.6879064, 0, 0, 0, 1, 1,
0.8209727, -3.424174, 1.212389, 0, 0, 0, 1, 1,
0.8253586, -0.7010739, 1.682448, 0, 0, 0, 1, 1,
0.8270558, 0.7245206, 1.434643, 0, 0, 0, 1, 1,
0.8271479, 1.217847, -1.107742, 1, 1, 1, 1, 1,
0.8280313, 1.967945, -0.3740972, 1, 1, 1, 1, 1,
0.8313501, 1.345974, 0.3165683, 1, 1, 1, 1, 1,
0.8336714, 0.3256335, 0.5789057, 1, 1, 1, 1, 1,
0.8418269, -0.2978569, 1.012324, 1, 1, 1, 1, 1,
0.8495966, -1.209185, 1.661908, 1, 1, 1, 1, 1,
0.8497554, -0.04806245, 1.487042, 1, 1, 1, 1, 1,
0.8584474, -0.1905322, 1.055286, 1, 1, 1, 1, 1,
0.8648579, -1.71492, 3.653843, 1, 1, 1, 1, 1,
0.8698977, 0.5719575, -0.7792651, 1, 1, 1, 1, 1,
0.8734152, -1.385669, 1.680516, 1, 1, 1, 1, 1,
0.8740262, 1.509941, 1.290604, 1, 1, 1, 1, 1,
0.8805212, -0.5154822, 5.571356, 1, 1, 1, 1, 1,
0.8877423, -0.3298949, 1.808594, 1, 1, 1, 1, 1,
0.8883289, 1.21848, 0.5360242, 1, 1, 1, 1, 1,
0.8906687, 0.1398696, 1.250072, 0, 0, 1, 1, 1,
0.8925888, -0.5676906, 2.896591, 1, 0, 0, 1, 1,
0.8946455, -0.5362059, 2.651698, 1, 0, 0, 1, 1,
0.9015785, 0.5338691, 2.359398, 1, 0, 0, 1, 1,
0.9027828, -1.35211, 3.071643, 1, 0, 0, 1, 1,
0.9028524, 0.08286678, 2.809457, 1, 0, 0, 1, 1,
0.908793, -0.6977593, 4.144352, 0, 0, 0, 1, 1,
0.9097158, -0.4111252, 2.52362, 0, 0, 0, 1, 1,
0.9124684, 0.8654122, 2.320502, 0, 0, 0, 1, 1,
0.9224099, -0.4563251, 1.251581, 0, 0, 0, 1, 1,
0.9243664, -0.6681787, 4.14321, 0, 0, 0, 1, 1,
0.9313594, 0.2263898, 2.272524, 0, 0, 0, 1, 1,
0.9330111, -2.042588, 1.39648, 0, 0, 0, 1, 1,
0.9363397, -0.2853483, 1.224533, 1, 1, 1, 1, 1,
0.9418559, 0.3530909, 1.931849, 1, 1, 1, 1, 1,
0.9514849, -0.6464619, 3.056261, 1, 1, 1, 1, 1,
0.9753806, -1.092751, 2.225354, 1, 1, 1, 1, 1,
0.986888, -0.1558689, 2.399707, 1, 1, 1, 1, 1,
0.993719, -1.251191, 3.142612, 1, 1, 1, 1, 1,
0.9952638, 0.3056133, 2.384501, 1, 1, 1, 1, 1,
0.9982539, 0.6320995, 0.2545718, 1, 1, 1, 1, 1,
1.015348, -0.1845147, 0.1114597, 1, 1, 1, 1, 1,
1.016218, 2.306504, -2.724715, 1, 1, 1, 1, 1,
1.016964, 0.2652197, 1.518259, 1, 1, 1, 1, 1,
1.01904, -0.6961653, 3.106668, 1, 1, 1, 1, 1,
1.025206, 0.03892631, 3.310379, 1, 1, 1, 1, 1,
1.028552, 1.434373, 1.003255, 1, 1, 1, 1, 1,
1.035514, -0.09090559, 1.797072, 1, 1, 1, 1, 1,
1.039727, -0.9949012, 1.216297, 0, 0, 1, 1, 1,
1.044625, 0.3074912, -0.5064443, 1, 0, 0, 1, 1,
1.045907, 0.2126709, -0.7472432, 1, 0, 0, 1, 1,
1.0647, -0.1750938, 2.613845, 1, 0, 0, 1, 1,
1.064727, 0.6189788, 1.166365, 1, 0, 0, 1, 1,
1.079665, -0.1832966, 1.355151, 1, 0, 0, 1, 1,
1.090858, 0.08526506, 1.920413, 0, 0, 0, 1, 1,
1.095428, -0.5665723, 1.422638, 0, 0, 0, 1, 1,
1.095738, -0.303526, 2.142094, 0, 0, 0, 1, 1,
1.096907, -0.3618084, 1.174469, 0, 0, 0, 1, 1,
1.09956, 0.815129, 0.7462976, 0, 0, 0, 1, 1,
1.101433, 1.520324, 0.3183904, 0, 0, 0, 1, 1,
1.106431, 1.451964, 1.330589, 0, 0, 0, 1, 1,
1.106904, -0.07678836, 0.5009557, 1, 1, 1, 1, 1,
1.108484, 0.06020427, 1.962974, 1, 1, 1, 1, 1,
1.112485, 0.74352, 2.904462, 1, 1, 1, 1, 1,
1.113432, -0.7538505, 1.206449, 1, 1, 1, 1, 1,
1.119454, -1.201609, 2.838139, 1, 1, 1, 1, 1,
1.127692, -1.043441, 2.183601, 1, 1, 1, 1, 1,
1.128464, -1.511847, 1.23062, 1, 1, 1, 1, 1,
1.131092, 0.1750045, 2.801844, 1, 1, 1, 1, 1,
1.137809, -0.9295184, 3.571215, 1, 1, 1, 1, 1,
1.149796, 0.7186507, 1.956911, 1, 1, 1, 1, 1,
1.151803, 1.863278, -0.0320034, 1, 1, 1, 1, 1,
1.156127, -0.1497596, 1.375664, 1, 1, 1, 1, 1,
1.16106, 0.781384, 1.699866, 1, 1, 1, 1, 1,
1.166045, -0.991756, 2.47256, 1, 1, 1, 1, 1,
1.167068, -0.2848397, 1.875405, 1, 1, 1, 1, 1,
1.170282, 1.422992, 0.5850216, 0, 0, 1, 1, 1,
1.170792, 0.7568004, -1.121206, 1, 0, 0, 1, 1,
1.177833, -1.177906, 1.137437, 1, 0, 0, 1, 1,
1.179058, -0.1264084, 3.473189, 1, 0, 0, 1, 1,
1.179916, 1.738307, 0.3999416, 1, 0, 0, 1, 1,
1.183504, -1.265511, 2.556437, 1, 0, 0, 1, 1,
1.189153, 0.153973, 1.542938, 0, 0, 0, 1, 1,
1.190636, 0.3998535, -1.412657, 0, 0, 0, 1, 1,
1.190861, -0.5602337, 2.8213, 0, 0, 0, 1, 1,
1.191293, -1.885921, 3.130302, 0, 0, 0, 1, 1,
1.192468, 0.2388858, 0.6481522, 0, 0, 0, 1, 1,
1.193095, -0.1382655, 0.721437, 0, 0, 0, 1, 1,
1.197753, 0.156243, 1.837522, 0, 0, 0, 1, 1,
1.211283, 1.779562, 0.6692801, 1, 1, 1, 1, 1,
1.211887, -2.102339, 3.279998, 1, 1, 1, 1, 1,
1.213018, 1.295961, 1.668881, 1, 1, 1, 1, 1,
1.215497, 0.1632537, 1.99588, 1, 1, 1, 1, 1,
1.216871, -0.8780286, 2.894147, 1, 1, 1, 1, 1,
1.219303, -0.06785265, 2.945014, 1, 1, 1, 1, 1,
1.231862, 0.07144657, 1.808407, 1, 1, 1, 1, 1,
1.235597, -1.1573, 3.356407, 1, 1, 1, 1, 1,
1.247727, 0.07498566, 1.823984, 1, 1, 1, 1, 1,
1.247893, 1.200098, 2.260888, 1, 1, 1, 1, 1,
1.248611, -1.058033, 1.472174, 1, 1, 1, 1, 1,
1.253081, -1.542986, 3.202051, 1, 1, 1, 1, 1,
1.257553, 0.8137308, 0.3181351, 1, 1, 1, 1, 1,
1.258324, -0.6740366, 3.63086, 1, 1, 1, 1, 1,
1.26087, 1.465659, 1.594183, 1, 1, 1, 1, 1,
1.261857, 0.01317716, 2.928089, 0, 0, 1, 1, 1,
1.264682, -1.688044, 2.251916, 1, 0, 0, 1, 1,
1.282914, -0.14773, 1.632298, 1, 0, 0, 1, 1,
1.287678, -1.706964, 1.583656, 1, 0, 0, 1, 1,
1.290532, -0.1734675, -0.1212423, 1, 0, 0, 1, 1,
1.298363, -0.4915694, 2.343117, 1, 0, 0, 1, 1,
1.299169, -1.001438, 2.551816, 0, 0, 0, 1, 1,
1.300691, 2.128163, 1.165658, 0, 0, 0, 1, 1,
1.302229, -2.025442, 1.866372, 0, 0, 0, 1, 1,
1.304017, 1.029841, 1.822595, 0, 0, 0, 1, 1,
1.30642, -1.245885, 1.104491, 0, 0, 0, 1, 1,
1.306674, -1.180865, 2.153404, 0, 0, 0, 1, 1,
1.308201, -0.2463229, 2.761248, 0, 0, 0, 1, 1,
1.308384, 0.8811895, -0.9312307, 1, 1, 1, 1, 1,
1.319438, -0.522737, 0.6671517, 1, 1, 1, 1, 1,
1.328605, -1.358337, 1.125803, 1, 1, 1, 1, 1,
1.343903, 2.300108, -1.825229, 1, 1, 1, 1, 1,
1.347704, 0.9067605, 1.401324, 1, 1, 1, 1, 1,
1.350537, -0.4926578, 0.6456155, 1, 1, 1, 1, 1,
1.355888, 0.04704499, -0.04838722, 1, 1, 1, 1, 1,
1.3636, 2.140753, 1.201487, 1, 1, 1, 1, 1,
1.37495, -0.8736334, 0.0639523, 1, 1, 1, 1, 1,
1.383296, -0.4405359, 2.178433, 1, 1, 1, 1, 1,
1.387052, -1.02862, 2.718317, 1, 1, 1, 1, 1,
1.39008, 0.7405795, 1.477358, 1, 1, 1, 1, 1,
1.392509, -0.883057, 1.005427, 1, 1, 1, 1, 1,
1.412572, 0.006620638, 1.398255, 1, 1, 1, 1, 1,
1.41501, -0.9558015, 2.405151, 1, 1, 1, 1, 1,
1.426591, -0.1329041, -0.4358472, 0, 0, 1, 1, 1,
1.428651, 1.412567, 0.8164504, 1, 0, 0, 1, 1,
1.430175, 0.2391938, 1.870608, 1, 0, 0, 1, 1,
1.430928, 2.359653, 1.517727, 1, 0, 0, 1, 1,
1.441754, -1.865406, 5.961204, 1, 0, 0, 1, 1,
1.458418, -0.5050025, 1.528304, 1, 0, 0, 1, 1,
1.479426, -0.8127064, 3.164527, 0, 0, 0, 1, 1,
1.489832, 0.5530513, 1.490405, 0, 0, 0, 1, 1,
1.509017, -1.646229, 4.11351, 0, 0, 0, 1, 1,
1.511265, 0.3135417, 0.7876585, 0, 0, 0, 1, 1,
1.523443, -0.8096626, 0.6706811, 0, 0, 0, 1, 1,
1.529334, 0.9716058, 0.173269, 0, 0, 0, 1, 1,
1.533043, 0.2981256, -0.4299085, 0, 0, 0, 1, 1,
1.53601, 0.94702, 1.89811, 1, 1, 1, 1, 1,
1.556407, -0.4620427, 1.834985, 1, 1, 1, 1, 1,
1.560357, 0.08703699, 0.6664838, 1, 1, 1, 1, 1,
1.583082, 0.4786361, 2.20998, 1, 1, 1, 1, 1,
1.614295, 1.841921, 0.8552303, 1, 1, 1, 1, 1,
1.620599, -0.2965457, 1.785519, 1, 1, 1, 1, 1,
1.6396, -0.8188336, 2.02474, 1, 1, 1, 1, 1,
1.650432, 2.49737, -0.1680054, 1, 1, 1, 1, 1,
1.693314, -0.818093, 2.690156, 1, 1, 1, 1, 1,
1.695194, 0.2933756, -0.09089366, 1, 1, 1, 1, 1,
1.709453, 0.2055331, 2.035196, 1, 1, 1, 1, 1,
1.711669, 0.7658319, 1.735715, 1, 1, 1, 1, 1,
1.711775, 0.8261214, 2.50584, 1, 1, 1, 1, 1,
1.735859, 0.5340265, 1.12463, 1, 1, 1, 1, 1,
1.742204, 0.5314184, 1.004475, 1, 1, 1, 1, 1,
1.773123, -0.9287247, 3.625186, 0, 0, 1, 1, 1,
1.7837, -0.9011918, 2.002244, 1, 0, 0, 1, 1,
1.791619, -1.420126, 3.161891, 1, 0, 0, 1, 1,
1.794243, -0.5279528, -0.2511731, 1, 0, 0, 1, 1,
1.794444, -0.8636675, 0.5512624, 1, 0, 0, 1, 1,
1.794845, 1.276653, 1.37461, 1, 0, 0, 1, 1,
1.817602, -0.5248345, 0.7347766, 0, 0, 0, 1, 1,
1.817928, -0.7813339, 1.897581, 0, 0, 0, 1, 1,
1.832309, -1.511953, 2.818414, 0, 0, 0, 1, 1,
1.840864, 0.6578279, 2.037225, 0, 0, 0, 1, 1,
1.860946, 1.668462, -0.6132478, 0, 0, 0, 1, 1,
1.862871, -2.150046, 1.709867, 0, 0, 0, 1, 1,
1.864951, 0.04393703, 3.037226, 0, 0, 0, 1, 1,
1.866776, -1.823827, 2.561893, 1, 1, 1, 1, 1,
1.877028, -0.1383598, 1.178172, 1, 1, 1, 1, 1,
1.877896, 0.6520129, 2.742046, 1, 1, 1, 1, 1,
1.903426, 0.190776, 1.975603, 1, 1, 1, 1, 1,
1.905553, 1.495565, 0.5649467, 1, 1, 1, 1, 1,
1.911369, 0.7456858, 0.5629436, 1, 1, 1, 1, 1,
1.929881, 1.3717, 0.2641394, 1, 1, 1, 1, 1,
1.946688, 1.849002, 1.133627, 1, 1, 1, 1, 1,
1.981528, 0.5542398, 0.3724387, 1, 1, 1, 1, 1,
1.983129, -1.116899, 2.080095, 1, 1, 1, 1, 1,
1.984824, -0.04695527, 0.7547042, 1, 1, 1, 1, 1,
1.995488, -0.711949, 2.421967, 1, 1, 1, 1, 1,
2.032613, 0.1658599, -0.08578356, 1, 1, 1, 1, 1,
2.040303, -0.866013, 1.194369, 1, 1, 1, 1, 1,
2.070149, 0.6815635, 0.2043289, 1, 1, 1, 1, 1,
2.070958, -0.5452428, 2.405988, 0, 0, 1, 1, 1,
2.082201, 1.265111, 0.4945371, 1, 0, 0, 1, 1,
2.110964, 0.6138063, 2.736975, 1, 0, 0, 1, 1,
2.114361, 0.9528047, 1.91258, 1, 0, 0, 1, 1,
2.162979, 0.5611174, 1.924071, 1, 0, 0, 1, 1,
2.227335, 0.1173426, -0.1688843, 1, 0, 0, 1, 1,
2.239709, -0.4615302, 1.422701, 0, 0, 0, 1, 1,
2.27247, -0.08928136, 0.8737828, 0, 0, 0, 1, 1,
2.344864, 0.4410689, 1.313236, 0, 0, 0, 1, 1,
2.458725, 1.147998, 2.270998, 0, 0, 0, 1, 1,
2.489215, 0.3840563, 1.004281, 0, 0, 0, 1, 1,
2.497374, 0.3278907, 2.924383, 0, 0, 0, 1, 1,
2.605691, -1.309125, 2.285694, 0, 0, 0, 1, 1,
2.62483, -0.08229292, 2.043615, 1, 1, 1, 1, 1,
2.633518, -0.4018759, 2.866461, 1, 1, 1, 1, 1,
2.64981, 1.775785, 1.290148, 1, 1, 1, 1, 1,
2.702529, -1.079918, 2.683854, 1, 1, 1, 1, 1,
2.740392, -0.5443894, 2.663144, 1, 1, 1, 1, 1,
3.037666, -0.8831654, 0.7792016, 1, 1, 1, 1, 1,
3.524026, 0.5482017, 1.526858, 1, 1, 1, 1, 1
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
var radius = 9.843591;
var distance = 34.5752;
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
mvMatrix.translate( -0.07748771, 0.3413574, -0.3552613 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.5752);
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
