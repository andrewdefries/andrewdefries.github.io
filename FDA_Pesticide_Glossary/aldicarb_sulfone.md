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
-2.915655, -0.159252, -2.143393, 1, 0, 0, 1,
-2.890402, 0.05288331, -1.653299, 1, 0.007843138, 0, 1,
-2.676002, -1.220494, 0.496208, 1, 0.01176471, 0, 1,
-2.587065, -0.7046818, -2.579662, 1, 0.01960784, 0, 1,
-2.528756, 0.3170768, -1.467942, 1, 0.02352941, 0, 1,
-2.518645, -0.1888142, -2.423808, 1, 0.03137255, 0, 1,
-2.455831, 0.3212935, 0.5122074, 1, 0.03529412, 0, 1,
-2.399667, -0.1065261, -0.1778097, 1, 0.04313726, 0, 1,
-2.235129, -1.628143, -3.678581, 1, 0.04705882, 0, 1,
-2.159897, 0.5639126, -1.555496, 1, 0.05490196, 0, 1,
-2.137808, -0.9537369, -2.37301, 1, 0.05882353, 0, 1,
-2.128926, -0.513493, -3.476311, 1, 0.06666667, 0, 1,
-2.066779, 0.8111861, -2.053102, 1, 0.07058824, 0, 1,
-2.043257, -0.07769177, -1.247372, 1, 0.07843138, 0, 1,
-2.035824, 1.09717, 1.120962, 1, 0.08235294, 0, 1,
-2.0309, 0.7104282, -1.650759, 1, 0.09019608, 0, 1,
-2.005733, 1.070444, -0.5003949, 1, 0.09411765, 0, 1,
-2.002645, -0.6270653, -1.893956, 1, 0.1019608, 0, 1,
-1.997017, 0.57662, -0.8756691, 1, 0.1098039, 0, 1,
-1.967742, 1.344798, -1.392703, 1, 0.1137255, 0, 1,
-1.957349, 0.1999328, -1.367324, 1, 0.1215686, 0, 1,
-1.953676, 1.004626, 0.1005825, 1, 0.1254902, 0, 1,
-1.94777, -0.9777277, -3.610006, 1, 0.1333333, 0, 1,
-1.914231, 1.066977, -3.368356, 1, 0.1372549, 0, 1,
-1.913565, -0.1423336, -2.393156, 1, 0.145098, 0, 1,
-1.903642, -0.1241704, -1.390434, 1, 0.1490196, 0, 1,
-1.9033, 0.7843497, -1.443484, 1, 0.1568628, 0, 1,
-1.892965, 0.6426487, -1.640762, 1, 0.1607843, 0, 1,
-1.891062, 1.522209, -1.463607, 1, 0.1686275, 0, 1,
-1.87253, 0.6738402, -2.152997, 1, 0.172549, 0, 1,
-1.860973, 0.541193, -3.344671, 1, 0.1803922, 0, 1,
-1.857603, -1.386003, -0.4566186, 1, 0.1843137, 0, 1,
-1.852544, 0.2847918, -1.681446, 1, 0.1921569, 0, 1,
-1.83892, 0.4535524, -0.6701518, 1, 0.1960784, 0, 1,
-1.833948, 0.8394488, 0.7665085, 1, 0.2039216, 0, 1,
-1.828981, 0.1418058, -0.5889616, 1, 0.2117647, 0, 1,
-1.763244, -0.6980058, -1.613415, 1, 0.2156863, 0, 1,
-1.754074, -0.1699628, -1.591439, 1, 0.2235294, 0, 1,
-1.741675, -0.2683627, -1.766788, 1, 0.227451, 0, 1,
-1.734983, 0.9161806, -1.349615, 1, 0.2352941, 0, 1,
-1.734936, -0.251475, -2.209421, 1, 0.2392157, 0, 1,
-1.733773, 0.1842928, -1.868948, 1, 0.2470588, 0, 1,
-1.726483, -0.347863, -3.421603, 1, 0.2509804, 0, 1,
-1.726461, 0.204088, -0.4426567, 1, 0.2588235, 0, 1,
-1.709466, -0.3672016, -3.115399, 1, 0.2627451, 0, 1,
-1.703793, 0.8599029, -1.010722, 1, 0.2705882, 0, 1,
-1.70379, -0.0752617, -2.938659, 1, 0.2745098, 0, 1,
-1.696501, -0.2784001, -1.45556, 1, 0.282353, 0, 1,
-1.679039, 0.2470026, -3.518957, 1, 0.2862745, 0, 1,
-1.660157, 1.365435, -0.9248087, 1, 0.2941177, 0, 1,
-1.653053, 0.1588566, -2.292213, 1, 0.3019608, 0, 1,
-1.636544, -1.800794, -2.719818, 1, 0.3058824, 0, 1,
-1.629927, -0.3939185, -2.138219, 1, 0.3137255, 0, 1,
-1.628051, -0.5887032, -2.269048, 1, 0.3176471, 0, 1,
-1.618142, -0.02120312, -1.999639, 1, 0.3254902, 0, 1,
-1.610623, -1.422002, -1.547571, 1, 0.3294118, 0, 1,
-1.605986, 0.3371561, -1.374889, 1, 0.3372549, 0, 1,
-1.594043, 1.803672, 0.07903942, 1, 0.3411765, 0, 1,
-1.590199, 0.996537, -0.2892841, 1, 0.3490196, 0, 1,
-1.56759, -1.665827, -4.088719, 1, 0.3529412, 0, 1,
-1.564225, -0.8633559, -1.611795, 1, 0.3607843, 0, 1,
-1.559898, -0.313985, -1.706515, 1, 0.3647059, 0, 1,
-1.557973, -0.4038536, -1.62198, 1, 0.372549, 0, 1,
-1.555163, -0.4981112, -1.683703, 1, 0.3764706, 0, 1,
-1.545509, 0.1724103, -1.481337, 1, 0.3843137, 0, 1,
-1.542696, 0.7592157, 0.7028714, 1, 0.3882353, 0, 1,
-1.538456, -0.8523196, -1.47821, 1, 0.3960784, 0, 1,
-1.537238, 0.8887122, -0.7534583, 1, 0.4039216, 0, 1,
-1.530973, 0.1085504, -2.455066, 1, 0.4078431, 0, 1,
-1.527724, -0.7225159, -2.255458, 1, 0.4156863, 0, 1,
-1.501045, 0.9727234, -1.620701, 1, 0.4196078, 0, 1,
-1.498268, 0.03192393, -0.8000373, 1, 0.427451, 0, 1,
-1.492739, -1.816601, -4.480718, 1, 0.4313726, 0, 1,
-1.485888, 1.667184, -0.5549697, 1, 0.4392157, 0, 1,
-1.477669, -0.2315094, -1.16496, 1, 0.4431373, 0, 1,
-1.466966, 0.5724984, -1.556511, 1, 0.4509804, 0, 1,
-1.465708, -0.4992712, -2.693401, 1, 0.454902, 0, 1,
-1.463534, -0.3926108, -1.521829, 1, 0.4627451, 0, 1,
-1.457615, 0.34513, -1.422186, 1, 0.4666667, 0, 1,
-1.449236, -0.7710953, -2.257731, 1, 0.4745098, 0, 1,
-1.443819, 0.7012587, -0.5099288, 1, 0.4784314, 0, 1,
-1.442288, -0.99259, -1.135926, 1, 0.4862745, 0, 1,
-1.43859, -1.44869, -1.373196, 1, 0.4901961, 0, 1,
-1.43119, 0.4666665, -1.166426, 1, 0.4980392, 0, 1,
-1.430612, 0.008720709, -0.5893039, 1, 0.5058824, 0, 1,
-1.427468, -0.4901237, -2.071773, 1, 0.509804, 0, 1,
-1.425742, 0.4517409, -2.432083, 1, 0.5176471, 0, 1,
-1.423896, -0.3997514, -3.391179, 1, 0.5215687, 0, 1,
-1.41195, 0.7176089, 0.1719238, 1, 0.5294118, 0, 1,
-1.405368, 0.8927593, -0.2456679, 1, 0.5333334, 0, 1,
-1.405046, -0.6712896, -2.508617, 1, 0.5411765, 0, 1,
-1.403184, -0.4498746, -1.509841, 1, 0.5450981, 0, 1,
-1.402812, 0.5743617, 0.7449663, 1, 0.5529412, 0, 1,
-1.399575, 0.4795615, -2.012934, 1, 0.5568628, 0, 1,
-1.388351, 0.7022298, -2.91516, 1, 0.5647059, 0, 1,
-1.381121, -0.4486958, -2.767587, 1, 0.5686275, 0, 1,
-1.371844, 0.8826318, 1.320084, 1, 0.5764706, 0, 1,
-1.370578, -0.8955032, -0.2998678, 1, 0.5803922, 0, 1,
-1.346179, -0.9185354, -3.538564, 1, 0.5882353, 0, 1,
-1.342358, 0.1291237, -1.499339, 1, 0.5921569, 0, 1,
-1.341444, 0.8953813, -2.374331, 1, 0.6, 0, 1,
-1.333597, -0.772391, -0.6213416, 1, 0.6078432, 0, 1,
-1.316762, -0.03273173, -2.179245, 1, 0.6117647, 0, 1,
-1.303039, 0.2651914, -1.799516, 1, 0.6196079, 0, 1,
-1.284264, -0.3074232, -2.669697, 1, 0.6235294, 0, 1,
-1.283696, 0.2728192, -2.055058, 1, 0.6313726, 0, 1,
-1.281902, -0.09693776, -0.5156938, 1, 0.6352941, 0, 1,
-1.281731, 0.01493582, -1.65022, 1, 0.6431373, 0, 1,
-1.263736, 0.2935792, -1.769606, 1, 0.6470588, 0, 1,
-1.218896, 1.591921, -2.179569, 1, 0.654902, 0, 1,
-1.21723, -0.1399107, -0.8837721, 1, 0.6588235, 0, 1,
-1.216389, -0.3470806, -1.189837, 1, 0.6666667, 0, 1,
-1.214592, -0.46895, -0.5966225, 1, 0.6705883, 0, 1,
-1.210177, 0.8775265, -0.1703447, 1, 0.6784314, 0, 1,
-1.21015, -0.04134925, 0.6936462, 1, 0.682353, 0, 1,
-1.20305, 0.2526675, -1.372353, 1, 0.6901961, 0, 1,
-1.200675, 1.963961, 0.5248986, 1, 0.6941177, 0, 1,
-1.196266, -1.135039, -2.586367, 1, 0.7019608, 0, 1,
-1.196155, -0.08837092, -3.225792, 1, 0.7098039, 0, 1,
-1.193219, 1.005953, -2.314603, 1, 0.7137255, 0, 1,
-1.190943, -0.6470388, -0.5106311, 1, 0.7215686, 0, 1,
-1.19065, -1.681624, -2.55756, 1, 0.7254902, 0, 1,
-1.189787, -0.3600448, -2.845263, 1, 0.7333333, 0, 1,
-1.189107, -1.05291, -1.567527, 1, 0.7372549, 0, 1,
-1.167644, 0.499294, -2.183964, 1, 0.7450981, 0, 1,
-1.16559, -0.5590824, -0.975715, 1, 0.7490196, 0, 1,
-1.165145, -1.575867, -2.257036, 1, 0.7568628, 0, 1,
-1.164157, -0.2795156, -2.04404, 1, 0.7607843, 0, 1,
-1.163631, -1.066072, -3.246654, 1, 0.7686275, 0, 1,
-1.161294, 1.993483, 0.4266762, 1, 0.772549, 0, 1,
-1.158447, 1.014468, -1.018535, 1, 0.7803922, 0, 1,
-1.154004, 0.8540489, -0.5554196, 1, 0.7843137, 0, 1,
-1.150056, -0.4708208, -1.706448, 1, 0.7921569, 0, 1,
-1.128758, -1.230177, -3.090094, 1, 0.7960784, 0, 1,
-1.124238, 0.4717714, -2.062269, 1, 0.8039216, 0, 1,
-1.115864, 0.4432074, -1.801014, 1, 0.8117647, 0, 1,
-1.107216, 0.8841482, -2.162808, 1, 0.8156863, 0, 1,
-1.105396, -1.11983, -4.697155, 1, 0.8235294, 0, 1,
-1.103739, 0.162121, -1.405184, 1, 0.827451, 0, 1,
-1.101825, -1.026697, -2.482467, 1, 0.8352941, 0, 1,
-1.099558, -0.5771244, -0.849025, 1, 0.8392157, 0, 1,
-1.094428, -0.1055764, -1.008062, 1, 0.8470588, 0, 1,
-1.093731, 1.628427, 0.06684305, 1, 0.8509804, 0, 1,
-1.090609, -0.4085193, -2.953322, 1, 0.8588235, 0, 1,
-1.088962, 0.7584569, -0.5813196, 1, 0.8627451, 0, 1,
-1.084581, 0.6828101, -0.7362198, 1, 0.8705882, 0, 1,
-1.080528, -0.8101022, -0.5132785, 1, 0.8745098, 0, 1,
-1.078394, 0.5406332, 0.9787794, 1, 0.8823529, 0, 1,
-1.072528, 0.05783733, -1.778873, 1, 0.8862745, 0, 1,
-1.072119, -0.6272656, -2.693426, 1, 0.8941177, 0, 1,
-1.071962, 0.5341604, -1.838869, 1, 0.8980392, 0, 1,
-1.069549, 0.1119726, -0.5135544, 1, 0.9058824, 0, 1,
-1.062955, -0.6772988, -2.663444, 1, 0.9137255, 0, 1,
-1.042539, 0.4357807, -1.047749, 1, 0.9176471, 0, 1,
-1.04015, -1.349443, -2.675609, 1, 0.9254902, 0, 1,
-1.037016, -1.89216, -2.829572, 1, 0.9294118, 0, 1,
-1.031348, -1.507317, -1.618609, 1, 0.9372549, 0, 1,
-1.020217, 0.9301057, 1.40942, 1, 0.9411765, 0, 1,
-1.019427, -0.4249933, -1.178087, 1, 0.9490196, 0, 1,
-1.013374, -1.678745, -4.897675, 1, 0.9529412, 0, 1,
-1.011248, -0.6452534, -1.26524, 1, 0.9607843, 0, 1,
-1.005019, 1.275943, 0.5062732, 1, 0.9647059, 0, 1,
-1.004224, 0.9933758, 0.07121348, 1, 0.972549, 0, 1,
-0.9954025, 0.9716021, 0.3529546, 1, 0.9764706, 0, 1,
-0.9910464, 0.3754296, -2.197713, 1, 0.9843137, 0, 1,
-0.9875229, -2.121022, -2.278409, 1, 0.9882353, 0, 1,
-0.9874139, 0.7757947, -1.21882, 1, 0.9960784, 0, 1,
-0.9872591, -0.06353424, -3.110848, 0.9960784, 1, 0, 1,
-0.9704185, -0.140194, -1.768501, 0.9921569, 1, 0, 1,
-0.9675545, 1.103913, -1.051335, 0.9843137, 1, 0, 1,
-0.9668314, -0.08205038, -1.690208, 0.9803922, 1, 0, 1,
-0.966346, -1.328621, -0.09527513, 0.972549, 1, 0, 1,
-0.9641514, -2.488498, -3.447215, 0.9686275, 1, 0, 1,
-0.9632484, 0.006163642, -1.946865, 0.9607843, 1, 0, 1,
-0.963151, -1.210465, -3.058047, 0.9568627, 1, 0, 1,
-0.9609717, -0.8985742, -1.802236, 0.9490196, 1, 0, 1,
-0.9604465, -1.346635, -2.288037, 0.945098, 1, 0, 1,
-0.9602679, -0.4048679, 0.3646695, 0.9372549, 1, 0, 1,
-0.9536759, -1.932031, -3.829923, 0.9333333, 1, 0, 1,
-0.944082, 2.664528, 0.5808741, 0.9254902, 1, 0, 1,
-0.9411356, -0.2444409, -2.288668, 0.9215686, 1, 0, 1,
-0.9354199, -1.435396, -2.032288, 0.9137255, 1, 0, 1,
-0.9332496, 0.3423989, -0.9400858, 0.9098039, 1, 0, 1,
-0.9317527, -1.17235, -3.430675, 0.9019608, 1, 0, 1,
-0.9301171, -1.966494, -2.086937, 0.8941177, 1, 0, 1,
-0.9222584, -1.032495, -0.4260591, 0.8901961, 1, 0, 1,
-0.9185897, -0.1433558, -3.62817, 0.8823529, 1, 0, 1,
-0.9145637, -0.03824858, -2.189011, 0.8784314, 1, 0, 1,
-0.9054766, -0.7300493, -2.944371, 0.8705882, 1, 0, 1,
-0.9034318, -0.9770759, -2.905119, 0.8666667, 1, 0, 1,
-0.9000389, -0.07986014, 0.2060433, 0.8588235, 1, 0, 1,
-0.8978952, 0.5739157, 1.828855, 0.854902, 1, 0, 1,
-0.8937474, -0.8447915, -2.341308, 0.8470588, 1, 0, 1,
-0.888978, -1.269705, -1.598518, 0.8431373, 1, 0, 1,
-0.8875459, -1.33448, -0.3232108, 0.8352941, 1, 0, 1,
-0.880349, -1.98797, 0.1176719, 0.8313726, 1, 0, 1,
-0.8744275, -0.9366599, -3.102149, 0.8235294, 1, 0, 1,
-0.871949, 0.4808884, -1.101689, 0.8196079, 1, 0, 1,
-0.8695698, 1.075073, -2.228099, 0.8117647, 1, 0, 1,
-0.8661591, -2.198028, -1.550294, 0.8078431, 1, 0, 1,
-0.8633727, 0.2043524, -2.729298, 0.8, 1, 0, 1,
-0.8610258, -0.188235, -0.8491752, 0.7921569, 1, 0, 1,
-0.8570783, 1.415133, -0.5293999, 0.7882353, 1, 0, 1,
-0.8526014, 0.3292528, -0.2849684, 0.7803922, 1, 0, 1,
-0.8520382, 0.1147392, 1.096062, 0.7764706, 1, 0, 1,
-0.8443393, 0.1079145, -2.285854, 0.7686275, 1, 0, 1,
-0.8374983, 2.714994, -0.09050948, 0.7647059, 1, 0, 1,
-0.8323696, 0.7134955, 0.006697447, 0.7568628, 1, 0, 1,
-0.8321594, 1.214571, -0.4941572, 0.7529412, 1, 0, 1,
-0.8267155, 0.3726028, 0.5318447, 0.7450981, 1, 0, 1,
-0.8263624, -0.5164873, -2.921916, 0.7411765, 1, 0, 1,
-0.8237106, 1.160612, -0.08435871, 0.7333333, 1, 0, 1,
-0.8236589, 0.005493664, -2.097855, 0.7294118, 1, 0, 1,
-0.8229164, 0.1958646, -2.366591, 0.7215686, 1, 0, 1,
-0.8203301, -0.1999529, -2.142017, 0.7176471, 1, 0, 1,
-0.8176143, -0.5686923, -2.599938, 0.7098039, 1, 0, 1,
-0.8058813, -0.1292927, -2.496207, 0.7058824, 1, 0, 1,
-0.8037518, -1.110393, -4.91201, 0.6980392, 1, 0, 1,
-0.8006382, -1.024048, -4.755302, 0.6901961, 1, 0, 1,
-0.7989978, -1.044451, -3.452787, 0.6862745, 1, 0, 1,
-0.7874109, 0.1706323, -2.994552, 0.6784314, 1, 0, 1,
-0.7870306, 0.3495716, -2.161528, 0.6745098, 1, 0, 1,
-0.7795576, -0.5449462, -1.747242, 0.6666667, 1, 0, 1,
-0.7778264, -1.955078, -2.105708, 0.6627451, 1, 0, 1,
-0.7736006, 1.049298, -1.774335, 0.654902, 1, 0, 1,
-0.7632506, 0.2882845, -2.102822, 0.6509804, 1, 0, 1,
-0.7566994, -0.3681959, -3.077638, 0.6431373, 1, 0, 1,
-0.7524216, 0.1089887, -0.3212216, 0.6392157, 1, 0, 1,
-0.7494177, 0.9700558, -2.407081, 0.6313726, 1, 0, 1,
-0.7470126, 0.3102631, -1.951131, 0.627451, 1, 0, 1,
-0.7450238, -0.9759034, -2.918719, 0.6196079, 1, 0, 1,
-0.7427157, 0.5764205, -2.071771, 0.6156863, 1, 0, 1,
-0.7421408, 0.2991305, -1.278558, 0.6078432, 1, 0, 1,
-0.7295449, -0.3567354, -0.3874446, 0.6039216, 1, 0, 1,
-0.7143257, -0.6844276, -1.461674, 0.5960785, 1, 0, 1,
-0.7132393, -0.7617151, -2.677911, 0.5882353, 1, 0, 1,
-0.7131625, -0.07242762, -0.8608601, 0.5843138, 1, 0, 1,
-0.705281, 0.6902135, -3.436604, 0.5764706, 1, 0, 1,
-0.7050582, -1.267544, -2.990367, 0.572549, 1, 0, 1,
-0.6949089, -0.5091896, -2.10408, 0.5647059, 1, 0, 1,
-0.6900407, 1.681965, -0.1313196, 0.5607843, 1, 0, 1,
-0.6877242, -0.5661358, -1.692042, 0.5529412, 1, 0, 1,
-0.6870471, 0.3092908, -0.3421617, 0.5490196, 1, 0, 1,
-0.6821985, 0.2552379, 0.5701278, 0.5411765, 1, 0, 1,
-0.6815921, 1.988009, -0.6154963, 0.5372549, 1, 0, 1,
-0.6763235, 0.5464651, -1.563094, 0.5294118, 1, 0, 1,
-0.6731721, -0.6101385, -1.308084, 0.5254902, 1, 0, 1,
-0.6728695, 1.35443, -1.929271, 0.5176471, 1, 0, 1,
-0.6716964, -0.1447833, -2.527615, 0.5137255, 1, 0, 1,
-0.6675363, -0.6971782, -2.496192, 0.5058824, 1, 0, 1,
-0.6672307, -0.6686126, -2.391988, 0.5019608, 1, 0, 1,
-0.6608058, -0.464059, -2.191154, 0.4941176, 1, 0, 1,
-0.6597703, 2.514494, -1.404597, 0.4862745, 1, 0, 1,
-0.6581022, -0.3826323, -0.8104301, 0.4823529, 1, 0, 1,
-0.6521891, 0.9635381, 0.3617291, 0.4745098, 1, 0, 1,
-0.6433842, 0.6218048, -0.6632339, 0.4705882, 1, 0, 1,
-0.640076, 2.690544, 0.5292785, 0.4627451, 1, 0, 1,
-0.6348428, 0.3319431, -0.1041459, 0.4588235, 1, 0, 1,
-0.6323185, 0.259073, 0.3639584, 0.4509804, 1, 0, 1,
-0.6282461, -0.6848001, -1.197589, 0.4470588, 1, 0, 1,
-0.6264315, 1.557975, -1.452649, 0.4392157, 1, 0, 1,
-0.6248692, 0.5708917, -1.581146, 0.4352941, 1, 0, 1,
-0.6194701, -0.8169376, -2.451349, 0.427451, 1, 0, 1,
-0.6193436, 0.5269945, -1.564113, 0.4235294, 1, 0, 1,
-0.6114811, 0.4789059, -2.074537, 0.4156863, 1, 0, 1,
-0.6095788, -0.6534891, -1.836387, 0.4117647, 1, 0, 1,
-0.6095607, 0.05484422, -4.193764, 0.4039216, 1, 0, 1,
-0.6070093, -1.051107, -1.743062, 0.3960784, 1, 0, 1,
-0.596065, 0.02616472, -0.8007126, 0.3921569, 1, 0, 1,
-0.5944477, 1.535783, 0.02906322, 0.3843137, 1, 0, 1,
-0.5942633, -2.223399, -1.301089, 0.3803922, 1, 0, 1,
-0.59217, 0.01114944, -1.778684, 0.372549, 1, 0, 1,
-0.5741089, 0.16891, -3.074756, 0.3686275, 1, 0, 1,
-0.5728763, -0.5810612, -2.805673, 0.3607843, 1, 0, 1,
-0.5678204, 1.240016, -1.757049, 0.3568628, 1, 0, 1,
-0.5639747, -0.3512068, -0.126592, 0.3490196, 1, 0, 1,
-0.5566906, 0.6406075, 1.008545, 0.345098, 1, 0, 1,
-0.5557891, -1.304687, -1.819268, 0.3372549, 1, 0, 1,
-0.5549427, -0.05905804, -3.221619, 0.3333333, 1, 0, 1,
-0.5462565, 2.923233, 0.01810475, 0.3254902, 1, 0, 1,
-0.5455049, 1.308977, -0.7250339, 0.3215686, 1, 0, 1,
-0.5394049, 0.8657328, -0.09582149, 0.3137255, 1, 0, 1,
-0.5391014, 2.000234, -1.222991, 0.3098039, 1, 0, 1,
-0.5302793, -0.4254602, -2.35197, 0.3019608, 1, 0, 1,
-0.5277923, 0.7634194, -0.009447719, 0.2941177, 1, 0, 1,
-0.5178915, -2.520628, -2.650521, 0.2901961, 1, 0, 1,
-0.5160007, -0.2228466, -2.609841, 0.282353, 1, 0, 1,
-0.5147813, -0.3667928, -3.021601, 0.2784314, 1, 0, 1,
-0.5084847, 1.533222, 1.213645, 0.2705882, 1, 0, 1,
-0.5069672, 0.4069406, -1.373552, 0.2666667, 1, 0, 1,
-0.5037563, -1.103097, -1.560497, 0.2588235, 1, 0, 1,
-0.503621, -0.7286733, -2.714588, 0.254902, 1, 0, 1,
-0.4937454, 0.03189241, -0.08153491, 0.2470588, 1, 0, 1,
-0.4937082, -1.112, -1.974632, 0.2431373, 1, 0, 1,
-0.4894428, -0.31315, -0.850563, 0.2352941, 1, 0, 1,
-0.4886442, 0.2484525, -1.653394, 0.2313726, 1, 0, 1,
-0.4874757, -0.7717023, -2.4852, 0.2235294, 1, 0, 1,
-0.4796433, -0.1181877, -1.930599, 0.2196078, 1, 0, 1,
-0.4758665, -0.2287345, -2.1283, 0.2117647, 1, 0, 1,
-0.4682592, 1.560745, -1.595535, 0.2078431, 1, 0, 1,
-0.4661163, 0.8550918, -0.8442792, 0.2, 1, 0, 1,
-0.4639572, -1.800092, -3.84176, 0.1921569, 1, 0, 1,
-0.4621958, -0.9955772, -3.864574, 0.1882353, 1, 0, 1,
-0.4610349, -0.5254811, -2.34501, 0.1803922, 1, 0, 1,
-0.4595776, 0.183176, -1.291497, 0.1764706, 1, 0, 1,
-0.4583199, -1.064423, -2.424064, 0.1686275, 1, 0, 1,
-0.4563721, 1.070734, -0.7083549, 0.1647059, 1, 0, 1,
-0.4515843, -1.455516, -2.612249, 0.1568628, 1, 0, 1,
-0.4501064, -0.08036014, -2.225098, 0.1529412, 1, 0, 1,
-0.4493316, -0.5013811, -1.064212, 0.145098, 1, 0, 1,
-0.4446866, 1.36089, 0.4878367, 0.1411765, 1, 0, 1,
-0.4445814, 0.1040632, 0.1996993, 0.1333333, 1, 0, 1,
-0.4443012, -1.207581, -2.933299, 0.1294118, 1, 0, 1,
-0.4431539, 0.8023685, 0.9393927, 0.1215686, 1, 0, 1,
-0.4410932, -0.136005, -3.689597, 0.1176471, 1, 0, 1,
-0.4395821, 1.022598, -1.846978, 0.1098039, 1, 0, 1,
-0.4380562, 0.7760029, -0.6433807, 0.1058824, 1, 0, 1,
-0.4325391, -1.439655, -1.92547, 0.09803922, 1, 0, 1,
-0.4199163, 1.576201, 1.306531, 0.09019608, 1, 0, 1,
-0.4159094, -0.2840677, -3.553288, 0.08627451, 1, 0, 1,
-0.4115543, -1.216681, -1.555539, 0.07843138, 1, 0, 1,
-0.4106734, -0.6026556, -2.238991, 0.07450981, 1, 0, 1,
-0.4093594, -0.1282104, -2.009543, 0.06666667, 1, 0, 1,
-0.4085249, -1.577101, -3.471426, 0.0627451, 1, 0, 1,
-0.408166, -0.9356618, -2.929562, 0.05490196, 1, 0, 1,
-0.4068484, 0.4939848, -1.223604, 0.05098039, 1, 0, 1,
-0.4018758, -1.006617, -3.629217, 0.04313726, 1, 0, 1,
-0.4009638, -1.594038, -2.737411, 0.03921569, 1, 0, 1,
-0.3938007, 0.9462492, -0.4654886, 0.03137255, 1, 0, 1,
-0.3931358, 0.2374486, -0.3484604, 0.02745098, 1, 0, 1,
-0.3887356, 0.08431112, -1.260468, 0.01960784, 1, 0, 1,
-0.3881099, 0.2222133, 1.569247, 0.01568628, 1, 0, 1,
-0.3864098, 0.07775711, -0.9205873, 0.007843138, 1, 0, 1,
-0.3759045, 1.18233, 0.3914024, 0.003921569, 1, 0, 1,
-0.3740604, 0.209, -0.9379848, 0, 1, 0.003921569, 1,
-0.3720678, 1.614984, 1.281846, 0, 1, 0.01176471, 1,
-0.3712628, -1.48515, -3.710932, 0, 1, 0.01568628, 1,
-0.3711674, 0.1348565, -1.529579, 0, 1, 0.02352941, 1,
-0.3685555, -0.3377134, -2.615468, 0, 1, 0.02745098, 1,
-0.3597476, 0.5292359, -0.6547674, 0, 1, 0.03529412, 1,
-0.3593159, 0.2399309, -2.157165, 0, 1, 0.03921569, 1,
-0.3584114, 0.8476162, -0.8805467, 0, 1, 0.04705882, 1,
-0.3560682, -0.855675, -4.562778, 0, 1, 0.05098039, 1,
-0.3545985, 0.3510226, -0.2013506, 0, 1, 0.05882353, 1,
-0.3521599, -0.508141, -3.962738, 0, 1, 0.0627451, 1,
-0.3505768, 0.435216, -0.4908399, 0, 1, 0.07058824, 1,
-0.3491111, 0.4107742, 0.5188282, 0, 1, 0.07450981, 1,
-0.3486916, 0.7094216, -0.2476052, 0, 1, 0.08235294, 1,
-0.3472406, -2.032879, -3.974934, 0, 1, 0.08627451, 1,
-0.3468695, 0.04242413, -1.94009, 0, 1, 0.09411765, 1,
-0.3464279, -2.109543, -2.484797, 0, 1, 0.1019608, 1,
-0.3451072, -1.053036, -3.058737, 0, 1, 0.1058824, 1,
-0.3441663, -0.9134251, -2.106221, 0, 1, 0.1137255, 1,
-0.3431125, -0.2270367, -0.9431416, 0, 1, 0.1176471, 1,
-0.3413139, -1.496023, -3.682906, 0, 1, 0.1254902, 1,
-0.3393216, 0.809245, -0.07652204, 0, 1, 0.1294118, 1,
-0.3386956, 0.4154599, -1.976289, 0, 1, 0.1372549, 1,
-0.3386832, -0.1492087, -1.281227, 0, 1, 0.1411765, 1,
-0.3383329, -0.09455684, -2.70251, 0, 1, 0.1490196, 1,
-0.3358903, 0.118401, -0.8020335, 0, 1, 0.1529412, 1,
-0.3338251, -1.535346, -3.431362, 0, 1, 0.1607843, 1,
-0.332441, 0.6328365, 0.2091946, 0, 1, 0.1647059, 1,
-0.3320076, -0.4233619, -3.64471, 0, 1, 0.172549, 1,
-0.3300856, -0.9637372, -1.459933, 0, 1, 0.1764706, 1,
-0.3293972, 2.205604, 0.1759018, 0, 1, 0.1843137, 1,
-0.3286792, -1.272986, -1.586255, 0, 1, 0.1882353, 1,
-0.3190247, 1.544369, 0.141631, 0, 1, 0.1960784, 1,
-0.3170968, 0.086204, -2.660546, 0, 1, 0.2039216, 1,
-0.3149975, 0.713164, -0.1091528, 0, 1, 0.2078431, 1,
-0.3119889, 1.209329, 0.1386037, 0, 1, 0.2156863, 1,
-0.3106616, 1.139488, 0.9942393, 0, 1, 0.2196078, 1,
-0.3063731, 0.4480256, -1.147308, 0, 1, 0.227451, 1,
-0.3057254, 0.5985563, -1.517461, 0, 1, 0.2313726, 1,
-0.30419, -0.7010033, -2.771625, 0, 1, 0.2392157, 1,
-0.3008559, 1.355404, 0.03798756, 0, 1, 0.2431373, 1,
-0.2977289, 1.676765, -0.397509, 0, 1, 0.2509804, 1,
-0.2961647, -1.112989, -3.732456, 0, 1, 0.254902, 1,
-0.2929574, 0.01131691, -2.965443, 0, 1, 0.2627451, 1,
-0.2840406, -0.8331451, -1.10522, 0, 1, 0.2666667, 1,
-0.2819176, -1.328728, -2.629853, 0, 1, 0.2745098, 1,
-0.2752064, -1.169287, -4.555458, 0, 1, 0.2784314, 1,
-0.2706281, 0.8192466, -0.2838764, 0, 1, 0.2862745, 1,
-0.2680623, 0.1737719, 0.5869277, 0, 1, 0.2901961, 1,
-0.2671895, -0.8430387, -2.916483, 0, 1, 0.2980392, 1,
-0.2653719, 1.480679, -0.1629471, 0, 1, 0.3058824, 1,
-0.2619595, 0.9092678, -0.1270425, 0, 1, 0.3098039, 1,
-0.261117, -2.881308, -1.990356, 0, 1, 0.3176471, 1,
-0.2610033, 0.2581194, -0.3720385, 0, 1, 0.3215686, 1,
-0.2593401, -0.7518669, -2.788032, 0, 1, 0.3294118, 1,
-0.2590926, 0.7082075, -0.4147525, 0, 1, 0.3333333, 1,
-0.2492908, -1.318779, -1.053696, 0, 1, 0.3411765, 1,
-0.2447324, -0.7183973, -1.373911, 0, 1, 0.345098, 1,
-0.2443882, 1.07849, -0.70737, 0, 1, 0.3529412, 1,
-0.243603, -0.1270561, -2.457132, 0, 1, 0.3568628, 1,
-0.2412008, -0.8067029, -2.813972, 0, 1, 0.3647059, 1,
-0.2381282, -0.06618836, -0.2970994, 0, 1, 0.3686275, 1,
-0.2366876, -0.3238632, -1.497311, 0, 1, 0.3764706, 1,
-0.2326643, -0.2431206, -3.981709, 0, 1, 0.3803922, 1,
-0.2315064, -1.033494, -2.024917, 0, 1, 0.3882353, 1,
-0.2294772, 0.4216282, 3.376631, 0, 1, 0.3921569, 1,
-0.2235674, 1.337147, 0.07264072, 0, 1, 0.4, 1,
-0.2202821, -1.594877, -2.872384, 0, 1, 0.4078431, 1,
-0.218905, -0.4188122, -1.880004, 0, 1, 0.4117647, 1,
-0.2186605, 1.284123, 1.603207, 0, 1, 0.4196078, 1,
-0.2136748, -0.8431966, -2.66117, 0, 1, 0.4235294, 1,
-0.2081559, -0.9589605, -1.936766, 0, 1, 0.4313726, 1,
-0.2073344, -0.4280166, -1.749511, 0, 1, 0.4352941, 1,
-0.2031668, -0.4678918, -3.446727, 0, 1, 0.4431373, 1,
-0.1935299, -1.539314, -1.822478, 0, 1, 0.4470588, 1,
-0.1929701, 0.5987541, -0.0316264, 0, 1, 0.454902, 1,
-0.1886089, 0.9251665, 0.5355637, 0, 1, 0.4588235, 1,
-0.1848298, -1.177885, -3.608378, 0, 1, 0.4666667, 1,
-0.1809543, -1.957546, -3.672538, 0, 1, 0.4705882, 1,
-0.1800832, 0.3896463, -0.7315688, 0, 1, 0.4784314, 1,
-0.1791432, -0.9337653, -2.422269, 0, 1, 0.4823529, 1,
-0.1777261, -1.208155, -2.63572, 0, 1, 0.4901961, 1,
-0.1755214, -0.3554194, -3.849943, 0, 1, 0.4941176, 1,
-0.1733514, -2.032564, -2.726015, 0, 1, 0.5019608, 1,
-0.1722266, 0.860293, -0.2442813, 0, 1, 0.509804, 1,
-0.1700268, -1.324904, -3.780609, 0, 1, 0.5137255, 1,
-0.1689885, -0.7656072, -1.930619, 0, 1, 0.5215687, 1,
-0.1670287, -0.467064, -3.590086, 0, 1, 0.5254902, 1,
-0.1662347, -0.3690382, -2.927926, 0, 1, 0.5333334, 1,
-0.1646896, -0.6259125, -2.640495, 0, 1, 0.5372549, 1,
-0.1639793, -0.2541177, -2.817553, 0, 1, 0.5450981, 1,
-0.1639491, -0.7811499, -2.864497, 0, 1, 0.5490196, 1,
-0.1568583, -0.7477455, -3.62869, 0, 1, 0.5568628, 1,
-0.1564588, 0.04406295, -1.038485, 0, 1, 0.5607843, 1,
-0.1547691, 0.8935686, -1.850272, 0, 1, 0.5686275, 1,
-0.1513914, 0.8083349, 1.930874, 0, 1, 0.572549, 1,
-0.1513652, 0.3472544, 0.2297044, 0, 1, 0.5803922, 1,
-0.1491677, 0.3998558, -3.749312, 0, 1, 0.5843138, 1,
-0.1476311, 1.321641, -1.632452, 0, 1, 0.5921569, 1,
-0.1470915, -0.2935867, -1.691645, 0, 1, 0.5960785, 1,
-0.1467951, 0.5682231, 1.186021, 0, 1, 0.6039216, 1,
-0.1452769, -0.09664057, -2.309289, 0, 1, 0.6117647, 1,
-0.1451407, -0.8136604, -4.320859, 0, 1, 0.6156863, 1,
-0.1434555, -0.216721, -2.073995, 0, 1, 0.6235294, 1,
-0.1423456, -0.8791644, -3.658423, 0, 1, 0.627451, 1,
-0.141827, -0.4019972, -3.303704, 0, 1, 0.6352941, 1,
-0.132679, 0.3266678, 0.864347, 0, 1, 0.6392157, 1,
-0.1326618, -1.069325, -3.467458, 0, 1, 0.6470588, 1,
-0.1314775, -1.2208, -2.975522, 0, 1, 0.6509804, 1,
-0.1287933, 0.3201437, 0.7414988, 0, 1, 0.6588235, 1,
-0.1284501, 1.022468, -0.4635813, 0, 1, 0.6627451, 1,
-0.1280073, 0.06911904, -0.4542815, 0, 1, 0.6705883, 1,
-0.1269699, 0.5655586, -0.1354624, 0, 1, 0.6745098, 1,
-0.1218836, 0.1779593, -2.130358, 0, 1, 0.682353, 1,
-0.1217908, -0.02193519, -0.4815929, 0, 1, 0.6862745, 1,
-0.1195187, -0.3780843, -1.659167, 0, 1, 0.6941177, 1,
-0.113831, -0.3825569, -2.348826, 0, 1, 0.7019608, 1,
-0.1070481, 1.354885, 0.09614832, 0, 1, 0.7058824, 1,
-0.1058235, 0.565259, -1.682363, 0, 1, 0.7137255, 1,
-0.1026464, 0.3935017, -0.3510072, 0, 1, 0.7176471, 1,
-0.1019943, 0.07849932, -0.3615535, 0, 1, 0.7254902, 1,
-0.09994082, 0.4523199, 2.045002, 0, 1, 0.7294118, 1,
-0.09719477, -0.5453013, -1.139073, 0, 1, 0.7372549, 1,
-0.09552044, -0.267983, -0.3577569, 0, 1, 0.7411765, 1,
-0.0889755, 1.768908, -1.099266, 0, 1, 0.7490196, 1,
-0.08849005, 0.0387969, -0.3243357, 0, 1, 0.7529412, 1,
-0.08617629, 0.7082415, -0.7287521, 0, 1, 0.7607843, 1,
-0.08438192, 1.672177, -1.966016, 0, 1, 0.7647059, 1,
-0.08313488, -1.610713, -2.39217, 0, 1, 0.772549, 1,
-0.07872512, -1.366422, -3.783716, 0, 1, 0.7764706, 1,
-0.07647475, 0.02251808, -1.6099, 0, 1, 0.7843137, 1,
-0.0750233, 1.165, 0.7644172, 0, 1, 0.7882353, 1,
-0.07397866, 0.4826401, -0.8845208, 0, 1, 0.7960784, 1,
-0.07244333, 0.6686633, 1.418151, 0, 1, 0.8039216, 1,
-0.07104295, 0.3972865, -2.059046, 0, 1, 0.8078431, 1,
-0.06841676, -3.119637, -3.721373, 0, 1, 0.8156863, 1,
-0.06450281, -1.802153, -3.553123, 0, 1, 0.8196079, 1,
-0.06374996, -1.111136, -3.031123, 0, 1, 0.827451, 1,
-0.06091452, -1.769043, 0.4850501, 0, 1, 0.8313726, 1,
-0.05829326, 2.551936, 0.9760789, 0, 1, 0.8392157, 1,
-0.05481688, 0.5244214, 0.540588, 0, 1, 0.8431373, 1,
-0.05404375, 0.4846819, -1.074833, 0, 1, 0.8509804, 1,
-0.05335024, 0.197441, -0.5972932, 0, 1, 0.854902, 1,
-0.05146208, 0.796963, 0.988951, 0, 1, 0.8627451, 1,
-0.05011287, 0.08619335, -0.6712236, 0, 1, 0.8666667, 1,
-0.04496504, 0.7180455, 0.9541913, 0, 1, 0.8745098, 1,
-0.03914415, 0.105183, 0.8290765, 0, 1, 0.8784314, 1,
-0.03756179, -1.521511, -2.240162, 0, 1, 0.8862745, 1,
-0.0374104, 0.631471, -0.07098878, 0, 1, 0.8901961, 1,
-0.03669824, -0.6055286, -3.555762, 0, 1, 0.8980392, 1,
-0.03592472, -0.1976552, -3.536427, 0, 1, 0.9058824, 1,
-0.03569748, 0.4260945, 0.2372928, 0, 1, 0.9098039, 1,
-0.034256, -1.307449, -2.334561, 0, 1, 0.9176471, 1,
-0.03341922, 1.385429, 0.2388694, 0, 1, 0.9215686, 1,
-0.02762712, 1.701176, 0.1681687, 0, 1, 0.9294118, 1,
-0.02726619, -0.3530589, -4.063579, 0, 1, 0.9333333, 1,
-0.02521563, -0.6132077, -2.855812, 0, 1, 0.9411765, 1,
-0.01793138, 0.3314679, 0.6044666, 0, 1, 0.945098, 1,
-0.01730823, 2.070534, -0.6862255, 0, 1, 0.9529412, 1,
-0.01560757, -0.8470599, -4.517528, 0, 1, 0.9568627, 1,
-0.01198725, 0.06602896, -0.9584701, 0, 1, 0.9647059, 1,
-0.009086466, 1.454868, -0.8946582, 0, 1, 0.9686275, 1,
-0.007933611, 1.486529, -1.137326, 0, 1, 0.9764706, 1,
-0.007907231, 1.036914, 0.535, 0, 1, 0.9803922, 1,
-0.004608382, -0.6019689, -0.9708685, 0, 1, 0.9882353, 1,
-0.003270108, 1.928598, 0.4309415, 0, 1, 0.9921569, 1,
-0.001422355, -0.4208151, -0.9892889, 0, 1, 1, 1,
0.002963676, -0.6743263, 2.891027, 0, 0.9921569, 1, 1,
0.004486038, -0.8129535, 1.896266, 0, 0.9882353, 1, 1,
0.007007477, -0.7579323, 3.436463, 0, 0.9803922, 1, 1,
0.008487796, 0.7420225, 1.316472, 0, 0.9764706, 1, 1,
0.01160366, 0.09702293, -0.2781822, 0, 0.9686275, 1, 1,
0.01888228, 1.168982, 0.5594237, 0, 0.9647059, 1, 1,
0.02175192, -0.02215508, 2.687903, 0, 0.9568627, 1, 1,
0.02227396, -0.6629224, 3.564593, 0, 0.9529412, 1, 1,
0.02727253, -0.163551, 1.534188, 0, 0.945098, 1, 1,
0.02758496, 0.2788142, 0.1002506, 0, 0.9411765, 1, 1,
0.0305853, -0.6549044, 3.508913, 0, 0.9333333, 1, 1,
0.03103421, 0.6036821, 0.4578101, 0, 0.9294118, 1, 1,
0.0318863, 0.3284999, 2.397222, 0, 0.9215686, 1, 1,
0.03268031, -0.3178585, 1.127565, 0, 0.9176471, 1, 1,
0.03690537, 2.001148, -0.03223842, 0, 0.9098039, 1, 1,
0.03989539, -0.07553615, 2.357981, 0, 0.9058824, 1, 1,
0.04155799, 0.70652, 0.6681218, 0, 0.8980392, 1, 1,
0.04432412, -1.199314, 1.17486, 0, 0.8901961, 1, 1,
0.05001992, 1.154788, -0.4982781, 0, 0.8862745, 1, 1,
0.06780072, -1.744469, 2.945221, 0, 0.8784314, 1, 1,
0.06856637, 0.2960187, 0.8958844, 0, 0.8745098, 1, 1,
0.07089259, -0.1962513, 1.111172, 0, 0.8666667, 1, 1,
0.07532658, 0.660702, 1.074825, 0, 0.8627451, 1, 1,
0.07654285, 0.8322136, 0.4789609, 0, 0.854902, 1, 1,
0.08255734, 0.1820212, 1.496924, 0, 0.8509804, 1, 1,
0.08367596, 0.4901429, 0.9288415, 0, 0.8431373, 1, 1,
0.08503988, 1.154224, -0.2539693, 0, 0.8392157, 1, 1,
0.08608209, -1.668738, 3.175679, 0, 0.8313726, 1, 1,
0.08749346, 1.94165, -0.1807094, 0, 0.827451, 1, 1,
0.08944985, 0.2886383, 0.3554935, 0, 0.8196079, 1, 1,
0.09092406, 0.2757622, -0.754481, 0, 0.8156863, 1, 1,
0.09477206, 0.009850988, 1.549459, 0, 0.8078431, 1, 1,
0.09512659, 0.7221777, 0.4619464, 0, 0.8039216, 1, 1,
0.09622145, -1.128527, 1.441478, 0, 0.7960784, 1, 1,
0.1055385, 1.162259, 0.7492892, 0, 0.7882353, 1, 1,
0.1067191, 1.701167, -0.2152625, 0, 0.7843137, 1, 1,
0.1166351, 0.0899561, 0.7735477, 0, 0.7764706, 1, 1,
0.1200206, -0.936509, 2.418986, 0, 0.772549, 1, 1,
0.1223008, 0.6743881, 0.6181444, 0, 0.7647059, 1, 1,
0.122754, 0.4083629, -1.278578, 0, 0.7607843, 1, 1,
0.1267574, 2.618018, 0.5078847, 0, 0.7529412, 1, 1,
0.1284983, 0.8596046, -0.2683117, 0, 0.7490196, 1, 1,
0.135568, 1.380447, -0.1225922, 0, 0.7411765, 1, 1,
0.1369668, 1.035479, 1.8221, 0, 0.7372549, 1, 1,
0.1376256, 1.076797, 0.2765599, 0, 0.7294118, 1, 1,
0.1421965, -1.071497, 3.631288, 0, 0.7254902, 1, 1,
0.1456336, 0.8778843, -1.492819, 0, 0.7176471, 1, 1,
0.1483069, 1.750472, 0.6757714, 0, 0.7137255, 1, 1,
0.1483828, 0.1289322, 3.655257, 0, 0.7058824, 1, 1,
0.1486333, -1.446764, 3.321154, 0, 0.6980392, 1, 1,
0.1508822, 0.4228134, 1.837336, 0, 0.6941177, 1, 1,
0.1521029, 0.2020005, 0.7767966, 0, 0.6862745, 1, 1,
0.1529616, -1.113447, 3.117875, 0, 0.682353, 1, 1,
0.1533133, -2.77472, 2.768564, 0, 0.6745098, 1, 1,
0.1561138, -0.3467484, 1.186376, 0, 0.6705883, 1, 1,
0.1570282, 0.2011987, 0.67953, 0, 0.6627451, 1, 1,
0.1600493, -1.568986, 3.136341, 0, 0.6588235, 1, 1,
0.1668183, -0.5725946, 2.795986, 0, 0.6509804, 1, 1,
0.1697637, 0.5702569, -1.191387, 0, 0.6470588, 1, 1,
0.1771807, -2.765069, 2.76154, 0, 0.6392157, 1, 1,
0.1792208, 0.1821501, 1.984557, 0, 0.6352941, 1, 1,
0.18054, -1.424673, 4.135918, 0, 0.627451, 1, 1,
0.1805752, 0.2685904, 0.592531, 0, 0.6235294, 1, 1,
0.1811595, -1.533776, 3.625501, 0, 0.6156863, 1, 1,
0.1824564, 1.14119, -0.1891758, 0, 0.6117647, 1, 1,
0.1842448, -0.342315, 2.686495, 0, 0.6039216, 1, 1,
0.1926049, -0.1297393, 2.737245, 0, 0.5960785, 1, 1,
0.1940157, -0.5519713, 2.697281, 0, 0.5921569, 1, 1,
0.1986615, 1.458498, 0.1206215, 0, 0.5843138, 1, 1,
0.1997666, 0.007040799, 1.351386, 0, 0.5803922, 1, 1,
0.2026454, -0.480983, 3.491953, 0, 0.572549, 1, 1,
0.2183585, -1.618717, 3.354932, 0, 0.5686275, 1, 1,
0.2197908, -0.3207928, 1.00693, 0, 0.5607843, 1, 1,
0.2230349, -1.609705, 2.221941, 0, 0.5568628, 1, 1,
0.2252972, -0.2173437, 3.021139, 0, 0.5490196, 1, 1,
0.2263927, -0.0913322, 0.5499496, 0, 0.5450981, 1, 1,
0.2301035, 0.1239635, 2.824401, 0, 0.5372549, 1, 1,
0.2310366, -1.4987, 2.454564, 0, 0.5333334, 1, 1,
0.231057, -0.4539873, 3.080704, 0, 0.5254902, 1, 1,
0.2321664, 1.474764, -0.6431904, 0, 0.5215687, 1, 1,
0.2324848, 0.2090351, 1.965031, 0, 0.5137255, 1, 1,
0.2336582, 1.352997, -0.8217328, 0, 0.509804, 1, 1,
0.235198, -0.927276, 2.627715, 0, 0.5019608, 1, 1,
0.2363584, 0.2245848, 0.8542781, 0, 0.4941176, 1, 1,
0.2376513, -0.499245, 5.275086, 0, 0.4901961, 1, 1,
0.2519989, 0.9542507, -1.05577, 0, 0.4823529, 1, 1,
0.2522329, 0.08306143, 1.641276, 0, 0.4784314, 1, 1,
0.2548013, 2.847241, -0.969889, 0, 0.4705882, 1, 1,
0.2571529, -1.346908, 4.00456, 0, 0.4666667, 1, 1,
0.2587142, 1.136578, -1.37773, 0, 0.4588235, 1, 1,
0.2604647, -0.2840095, 3.120818, 0, 0.454902, 1, 1,
0.2681926, -0.08129909, 2.54598, 0, 0.4470588, 1, 1,
0.270377, -2.130219, 3.098862, 0, 0.4431373, 1, 1,
0.2798218, 1.12342, 0.1173142, 0, 0.4352941, 1, 1,
0.2801697, 0.9315829, 0.8958004, 0, 0.4313726, 1, 1,
0.284521, -0.3097789, 4.127175, 0, 0.4235294, 1, 1,
0.2934356, -0.02898608, 2.502292, 0, 0.4196078, 1, 1,
0.2951963, -0.1044343, 2.092308, 0, 0.4117647, 1, 1,
0.2967271, 1.241615, 0.1524891, 0, 0.4078431, 1, 1,
0.2980227, 0.7862399, 0.4103819, 0, 0.4, 1, 1,
0.2995475, -0.3056876, 2.637836, 0, 0.3921569, 1, 1,
0.3033223, 0.2646299, 1.672335, 0, 0.3882353, 1, 1,
0.3053673, -1.229492, 3.848896, 0, 0.3803922, 1, 1,
0.3055629, 0.8201165, 1.116064, 0, 0.3764706, 1, 1,
0.3122135, -1.416198, 3.332573, 0, 0.3686275, 1, 1,
0.3146723, 0.2226109, 0.7414869, 0, 0.3647059, 1, 1,
0.3155222, -1.115466, 2.345958, 0, 0.3568628, 1, 1,
0.3155692, 0.5069844, 1.34731, 0, 0.3529412, 1, 1,
0.3163631, 0.245486, 1.168915, 0, 0.345098, 1, 1,
0.3199315, 0.006027194, 0.8961486, 0, 0.3411765, 1, 1,
0.3203641, -0.9474906, 3.404337, 0, 0.3333333, 1, 1,
0.3218736, -1.109725, 1.926316, 0, 0.3294118, 1, 1,
0.3230855, 1.551469, 1.521951, 0, 0.3215686, 1, 1,
0.3258981, 0.1819642, 2.128869, 0, 0.3176471, 1, 1,
0.3351932, -0.2027029, 2.51024, 0, 0.3098039, 1, 1,
0.336998, 0.1694988, 0.05218101, 0, 0.3058824, 1, 1,
0.3377124, 0.8748245, 0.2477889, 0, 0.2980392, 1, 1,
0.3400372, -0.3738832, 3.628622, 0, 0.2901961, 1, 1,
0.3449483, -1.02686, 1.488536, 0, 0.2862745, 1, 1,
0.3452272, 0.4789589, 1.282735, 0, 0.2784314, 1, 1,
0.34558, -1.376839, 2.955842, 0, 0.2745098, 1, 1,
0.345685, 0.5457221, -0.3268907, 0, 0.2666667, 1, 1,
0.3500134, 1.005022, -0.3819377, 0, 0.2627451, 1, 1,
0.3510899, -1.875875, 3.803961, 0, 0.254902, 1, 1,
0.3533597, -0.09606154, 2.403618, 0, 0.2509804, 1, 1,
0.3585991, 0.9582873, 1.242436, 0, 0.2431373, 1, 1,
0.3609077, 1.242762, -0.6556011, 0, 0.2392157, 1, 1,
0.3617523, 0.2559188, 2.394876, 0, 0.2313726, 1, 1,
0.3644789, -1.015848, 2.953956, 0, 0.227451, 1, 1,
0.3725288, -1.548516, 2.065154, 0, 0.2196078, 1, 1,
0.3754442, -0.5228766, 2.167678, 0, 0.2156863, 1, 1,
0.3774226, 2.670708, 0.266704, 0, 0.2078431, 1, 1,
0.3868818, -1.150502, 1.692147, 0, 0.2039216, 1, 1,
0.3961074, -0.399631, 1.224111, 0, 0.1960784, 1, 1,
0.3968006, 0.8506441, 1.500261, 0, 0.1882353, 1, 1,
0.396862, 1.200093, 0.6950529, 0, 0.1843137, 1, 1,
0.407362, -1.695445, 2.347565, 0, 0.1764706, 1, 1,
0.4091161, -0.7279781, 3.819129, 0, 0.172549, 1, 1,
0.409624, -0.03193412, 0.8668485, 0, 0.1647059, 1, 1,
0.4106912, -0.4477168, 2.786141, 0, 0.1607843, 1, 1,
0.4136125, 2.155641, 0.1324058, 0, 0.1529412, 1, 1,
0.4157295, 0.4136269, 0.982124, 0, 0.1490196, 1, 1,
0.4180818, -0.1664664, 0.5512287, 0, 0.1411765, 1, 1,
0.4185651, 0.331702, 0.2788481, 0, 0.1372549, 1, 1,
0.4194089, -0.1238965, 1.529975, 0, 0.1294118, 1, 1,
0.4211918, 1.136992, 1.418826, 0, 0.1254902, 1, 1,
0.424163, -0.4783075, 2.602278, 0, 0.1176471, 1, 1,
0.4286711, 0.04943553, 0.6984059, 0, 0.1137255, 1, 1,
0.4299165, -0.01321976, 1.709389, 0, 0.1058824, 1, 1,
0.4339927, 0.9996616, 0.247666, 0, 0.09803922, 1, 1,
0.4342934, 0.198585, 1.994085, 0, 0.09411765, 1, 1,
0.4348894, -1.917219, 4.624942, 0, 0.08627451, 1, 1,
0.4460013, -0.8823177, 3.765144, 0, 0.08235294, 1, 1,
0.4461746, -1.909472, 4.312789, 0, 0.07450981, 1, 1,
0.4509057, 1.180938, 0.1670917, 0, 0.07058824, 1, 1,
0.4533799, 2.409048, -0.7677545, 0, 0.0627451, 1, 1,
0.4553923, 1.199359, -0.0906856, 0, 0.05882353, 1, 1,
0.4568154, 0.2875791, 1.247659, 0, 0.05098039, 1, 1,
0.4568656, -0.5058913, 1.893838, 0, 0.04705882, 1, 1,
0.460071, 0.9002333, -0.2611521, 0, 0.03921569, 1, 1,
0.4603156, 0.4397148, 0.1374724, 0, 0.03529412, 1, 1,
0.4604777, 0.4675099, 1.369516, 0, 0.02745098, 1, 1,
0.4623179, 0.1434415, 0.9698377, 0, 0.02352941, 1, 1,
0.4641572, -0.2081549, 1.799875, 0, 0.01568628, 1, 1,
0.4661952, 0.7671555, 0.3255787, 0, 0.01176471, 1, 1,
0.4664445, -1.265947, 4.339718, 0, 0.003921569, 1, 1,
0.4716832, -1.430184, 4.114882, 0.003921569, 0, 1, 1,
0.4739749, 0.6535005, 1.878001, 0.007843138, 0, 1, 1,
0.4755024, 0.4882334, 2.368932, 0.01568628, 0, 1, 1,
0.4832104, -0.7852083, 2.49111, 0.01960784, 0, 1, 1,
0.4834033, 1.255628, -0.1166516, 0.02745098, 0, 1, 1,
0.4847092, 1.213503, -0.5432745, 0.03137255, 0, 1, 1,
0.4856999, 0.1524469, 2.511746, 0.03921569, 0, 1, 1,
0.4925939, -1.1965, 2.890267, 0.04313726, 0, 1, 1,
0.4947579, -0.5730088, 1.185078, 0.05098039, 0, 1, 1,
0.5129466, 0.3858281, 2.141784, 0.05490196, 0, 1, 1,
0.5141772, 0.8567948, -0.4447649, 0.0627451, 0, 1, 1,
0.5147755, -0.4798214, 0.6342357, 0.06666667, 0, 1, 1,
0.5193601, -1.171671, 1.395504, 0.07450981, 0, 1, 1,
0.5268519, 0.7237778, 1.171852, 0.07843138, 0, 1, 1,
0.5268747, 1.291981, 0.9097586, 0.08627451, 0, 1, 1,
0.528407, 0.9157881, 0.7421148, 0.09019608, 0, 1, 1,
0.529673, 0.4357122, -0.4465468, 0.09803922, 0, 1, 1,
0.530669, -1.070084, 1.603188, 0.1058824, 0, 1, 1,
0.5325894, 1.448041, 0.6692718, 0.1098039, 0, 1, 1,
0.5326408, -0.4809007, 1.713701, 0.1176471, 0, 1, 1,
0.5349004, 0.3626122, 1.271036, 0.1215686, 0, 1, 1,
0.5431785, -0.5451186, 2.78375, 0.1294118, 0, 1, 1,
0.5442039, -0.1328275, 3.451742, 0.1333333, 0, 1, 1,
0.5460382, -0.3598152, 2.425569, 0.1411765, 0, 1, 1,
0.5476534, -0.2520397, 4.766443, 0.145098, 0, 1, 1,
0.5495595, 0.3952881, 1.511814, 0.1529412, 0, 1, 1,
0.5527364, -0.3921028, 4.719799, 0.1568628, 0, 1, 1,
0.5539038, -1.158994, 3.789963, 0.1647059, 0, 1, 1,
0.5682427, -0.6677585, 1.436233, 0.1686275, 0, 1, 1,
0.5684244, -0.9905125, 2.221277, 0.1764706, 0, 1, 1,
0.5737499, 0.9474773, 1.49823, 0.1803922, 0, 1, 1,
0.5807002, 0.9262236, 0.8459913, 0.1882353, 0, 1, 1,
0.5893285, 0.5844894, 2.592456, 0.1921569, 0, 1, 1,
0.5908132, 0.4253034, 0.7364727, 0.2, 0, 1, 1,
0.5942001, 0.4948287, 1.033101, 0.2078431, 0, 1, 1,
0.5944604, 0.5523745, 2.134844, 0.2117647, 0, 1, 1,
0.5992803, -1.340553, 0.7386022, 0.2196078, 0, 1, 1,
0.6029946, -0.02380977, 0.8869287, 0.2235294, 0, 1, 1,
0.6035839, -0.2563584, 1.70516, 0.2313726, 0, 1, 1,
0.6045087, 0.0110587, 1.553288, 0.2352941, 0, 1, 1,
0.6066118, -0.9373036, 3.128204, 0.2431373, 0, 1, 1,
0.6067286, 0.5227513, 0.03097176, 0.2470588, 0, 1, 1,
0.6090268, 0.1059863, 1.301632, 0.254902, 0, 1, 1,
0.6135812, 0.5683144, 0.5294441, 0.2588235, 0, 1, 1,
0.614065, -0.5905065, 0.7892069, 0.2666667, 0, 1, 1,
0.6149904, -0.8889799, 1.893105, 0.2705882, 0, 1, 1,
0.6165302, 0.8315079, 1.873746, 0.2784314, 0, 1, 1,
0.6230544, 1.621522, -0.1694412, 0.282353, 0, 1, 1,
0.6363056, -0.6530624, 1.832675, 0.2901961, 0, 1, 1,
0.6389448, -0.8094028, 1.146553, 0.2941177, 0, 1, 1,
0.63933, -0.7597701, 2.447038, 0.3019608, 0, 1, 1,
0.6399246, 0.0937121, 1.156565, 0.3098039, 0, 1, 1,
0.6422978, -0.6890733, 2.979405, 0.3137255, 0, 1, 1,
0.6423684, 1.964492, -0.4857253, 0.3215686, 0, 1, 1,
0.6462649, 0.3562398, 0.8115194, 0.3254902, 0, 1, 1,
0.6484247, 0.7421647, -0.6137478, 0.3333333, 0, 1, 1,
0.6493971, -2.328013, 0.1600455, 0.3372549, 0, 1, 1,
0.6557927, -1.733709, 3.752648, 0.345098, 0, 1, 1,
0.6580495, 0.1252663, 1.03896, 0.3490196, 0, 1, 1,
0.6602779, -0.2535994, 1.904227, 0.3568628, 0, 1, 1,
0.6629114, -0.8084602, 3.332972, 0.3607843, 0, 1, 1,
0.6653023, 0.04439486, 2.205169, 0.3686275, 0, 1, 1,
0.666564, -1.595461, 3.837049, 0.372549, 0, 1, 1,
0.6707358, -0.9699253, 3.678257, 0.3803922, 0, 1, 1,
0.6790307, -0.2132308, 2.246876, 0.3843137, 0, 1, 1,
0.6811276, 0.7236356, 0.8068005, 0.3921569, 0, 1, 1,
0.6849456, 1.380977, -2.161992, 0.3960784, 0, 1, 1,
0.6856147, 0.3601688, 2.573072, 0.4039216, 0, 1, 1,
0.6876148, 0.3086551, 0.2018234, 0.4117647, 0, 1, 1,
0.6904183, -0.1688081, 2.025017, 0.4156863, 0, 1, 1,
0.6943071, -0.4064119, 1.484374, 0.4235294, 0, 1, 1,
0.6952747, 0.8343751, 0.1927448, 0.427451, 0, 1, 1,
0.7000722, 0.1109359, 2.174588, 0.4352941, 0, 1, 1,
0.7022405, -0.4579928, 1.565846, 0.4392157, 0, 1, 1,
0.7032802, -0.5269481, 2.576938, 0.4470588, 0, 1, 1,
0.7036023, 1.966933, 0.564647, 0.4509804, 0, 1, 1,
0.7056196, -0.2371482, -0.8316374, 0.4588235, 0, 1, 1,
0.7120655, -1.039933, 2.755301, 0.4627451, 0, 1, 1,
0.7195551, -1.976747, 1.587423, 0.4705882, 0, 1, 1,
0.7199582, -1.589879, 1.899166, 0.4745098, 0, 1, 1,
0.7227197, -0.3538466, 0.1332272, 0.4823529, 0, 1, 1,
0.7237448, -0.07658692, 0.1657796, 0.4862745, 0, 1, 1,
0.7278662, -0.2815036, 0.1491987, 0.4941176, 0, 1, 1,
0.7300473, -0.2867056, 1.927595, 0.5019608, 0, 1, 1,
0.7316623, 1.109453, 2.134223, 0.5058824, 0, 1, 1,
0.7374454, 0.5563707, 1.005918, 0.5137255, 0, 1, 1,
0.7392541, 0.2612005, 1.946167, 0.5176471, 0, 1, 1,
0.7393118, 0.3663126, 1.406248, 0.5254902, 0, 1, 1,
0.7402825, 1.095334, 0.129406, 0.5294118, 0, 1, 1,
0.7443101, -1.443784, 3.09836, 0.5372549, 0, 1, 1,
0.7444953, 1.415042, -0.02259759, 0.5411765, 0, 1, 1,
0.7525306, 0.1938433, 2.187019, 0.5490196, 0, 1, 1,
0.7547969, 0.8337291, 1.018685, 0.5529412, 0, 1, 1,
0.7559926, -2.606807, 4.437187, 0.5607843, 0, 1, 1,
0.7563964, -1.390068, 4.245773, 0.5647059, 0, 1, 1,
0.7647029, 0.744157, 0.3642268, 0.572549, 0, 1, 1,
0.7647917, -0.05377657, 1.015409, 0.5764706, 0, 1, 1,
0.7740677, 0.6052082, 0.4325979, 0.5843138, 0, 1, 1,
0.7746142, 1.46128, -0.08485705, 0.5882353, 0, 1, 1,
0.7766544, 0.5434428, -1.130108, 0.5960785, 0, 1, 1,
0.7771089, -0.06303494, 1.450566, 0.6039216, 0, 1, 1,
0.7836989, 0.9487783, 1.421374, 0.6078432, 0, 1, 1,
0.7841687, -0.6598282, 2.957008, 0.6156863, 0, 1, 1,
0.7902507, 0.5658635, 0.6252856, 0.6196079, 0, 1, 1,
0.7909693, -1.613999, 2.562523, 0.627451, 0, 1, 1,
0.7931329, 1.793283, 0.4793801, 0.6313726, 0, 1, 1,
0.7933093, -0.5830811, 2.099966, 0.6392157, 0, 1, 1,
0.7936721, -0.7139073, 1.096579, 0.6431373, 0, 1, 1,
0.7960349, 0.8048748, 0.7200744, 0.6509804, 0, 1, 1,
0.7976395, -1.278502, 0.6936303, 0.654902, 0, 1, 1,
0.8001262, -0.5361371, 1.728641, 0.6627451, 0, 1, 1,
0.8080307, -0.8377681, 2.7749, 0.6666667, 0, 1, 1,
0.8093004, 0.9602431, 0.8947534, 0.6745098, 0, 1, 1,
0.8121328, -0.6868268, 3.153066, 0.6784314, 0, 1, 1,
0.8205397, 0.2127315, 1.163288, 0.6862745, 0, 1, 1,
0.831325, 1.669783, 2.473231, 0.6901961, 0, 1, 1,
0.8326626, 0.01624571, 1.648486, 0.6980392, 0, 1, 1,
0.8340514, -1.11259, 1.625565, 0.7058824, 0, 1, 1,
0.8351058, -1.532696, 0.8271425, 0.7098039, 0, 1, 1,
0.8380275, 0.533011, 1.190165, 0.7176471, 0, 1, 1,
0.8394123, -0.6950866, 1.560398, 0.7215686, 0, 1, 1,
0.8424292, 0.5906952, 0.1947539, 0.7294118, 0, 1, 1,
0.8426219, -0.510269, 1.73096, 0.7333333, 0, 1, 1,
0.8438573, 1.561173, 0.1174398, 0.7411765, 0, 1, 1,
0.8488142, -1.484812, 3.308182, 0.7450981, 0, 1, 1,
0.8510264, 1.363815, 1.482155, 0.7529412, 0, 1, 1,
0.8555028, -1.073276, 1.378632, 0.7568628, 0, 1, 1,
0.8589746, 0.5524929, 0.7367327, 0.7647059, 0, 1, 1,
0.8591927, -0.2634421, 1.904915, 0.7686275, 0, 1, 1,
0.865464, 2.038864, 1.788217, 0.7764706, 0, 1, 1,
0.8662379, -0.1742919, 3.075625, 0.7803922, 0, 1, 1,
0.8666607, -0.0762677, 2.585885, 0.7882353, 0, 1, 1,
0.8696327, -0.6222585, 1.166025, 0.7921569, 0, 1, 1,
0.8754117, 1.141691, -0.3074036, 0.8, 0, 1, 1,
0.8758637, -0.4742799, 1.157407, 0.8078431, 0, 1, 1,
0.8945463, -0.5795781, 0.7951565, 0.8117647, 0, 1, 1,
0.9014622, -0.4161535, 1.888008, 0.8196079, 0, 1, 1,
0.9053287, -0.04972165, 0.1925016, 0.8235294, 0, 1, 1,
0.9089938, -1.260879, 0.9235961, 0.8313726, 0, 1, 1,
0.919651, -1.227722, 3.341467, 0.8352941, 0, 1, 1,
0.9204105, -1.392607, 1.626503, 0.8431373, 0, 1, 1,
0.9210456, 0.2445463, 2.971558, 0.8470588, 0, 1, 1,
0.9226736, 0.8714859, -0.2969797, 0.854902, 0, 1, 1,
0.9240119, 0.5482369, 0.2115869, 0.8588235, 0, 1, 1,
0.9282207, 0.3550489, 0.04122578, 0.8666667, 0, 1, 1,
0.9352378, -0.3045011, 1.077881, 0.8705882, 0, 1, 1,
0.9412231, 0.4917225, 2.1906, 0.8784314, 0, 1, 1,
0.9480221, -0.3902884, 0.3854133, 0.8823529, 0, 1, 1,
0.9547008, 0.3067378, 1.06587, 0.8901961, 0, 1, 1,
0.9560674, 0.7026949, 1.438566, 0.8941177, 0, 1, 1,
0.9586691, -0.5809291, 0.8915088, 0.9019608, 0, 1, 1,
0.9600406, 0.5950189, 1.900053, 0.9098039, 0, 1, 1,
0.9670749, 0.576447, 1.665946, 0.9137255, 0, 1, 1,
0.9673989, 1.158136, 2.275829, 0.9215686, 0, 1, 1,
0.9674876, 1.549003, -1.167898, 0.9254902, 0, 1, 1,
0.9679851, 0.8459442, 0.540244, 0.9333333, 0, 1, 1,
0.9745443, 0.3063955, 0.3489944, 0.9372549, 0, 1, 1,
0.980747, 0.3720167, 1.785416, 0.945098, 0, 1, 1,
0.9821974, 0.2814285, 2.557179, 0.9490196, 0, 1, 1,
0.982623, -0.8856839, 2.092968, 0.9568627, 0, 1, 1,
0.9859554, 1.320268, 0.2281443, 0.9607843, 0, 1, 1,
0.9932373, -0.1064363, 0.8779379, 0.9686275, 0, 1, 1,
0.9964525, -0.7467561, 3.167957, 0.972549, 0, 1, 1,
1.005986, -0.4416091, 1.284683, 0.9803922, 0, 1, 1,
1.010016, -0.3509843, 4.194615, 0.9843137, 0, 1, 1,
1.021029, -0.7763572, 3.189255, 0.9921569, 0, 1, 1,
1.032751, 1.119824, 0.8690624, 0.9960784, 0, 1, 1,
1.033624, -1.385223, 2.263809, 1, 0, 0.9960784, 1,
1.036607, 0.1825906, 1.325654, 1, 0, 0.9882353, 1,
1.046447, -0.713819, 2.026472, 1, 0, 0.9843137, 1,
1.051666, 0.2173404, 0.1870363, 1, 0, 0.9764706, 1,
1.067937, -1.362318, -1.158424, 1, 0, 0.972549, 1,
1.070929, -0.4138517, 2.066803, 1, 0, 0.9647059, 1,
1.071036, 1.08018, 2.601726, 1, 0, 0.9607843, 1,
1.071175, 0.09069201, -0.103812, 1, 0, 0.9529412, 1,
1.07496, 0.7580068, 1.229036, 1, 0, 0.9490196, 1,
1.078533, 0.4492322, 2.201025, 1, 0, 0.9411765, 1,
1.090915, 0.397469, 1.825119, 1, 0, 0.9372549, 1,
1.092179, -0.9518463, 3.524161, 1, 0, 0.9294118, 1,
1.092707, 0.08114864, 0.05052982, 1, 0, 0.9254902, 1,
1.093243, 1.637705, -0.3414322, 1, 0, 0.9176471, 1,
1.098189, 1.022345, 0.4036212, 1, 0, 0.9137255, 1,
1.098847, -0.1240167, 0.8438563, 1, 0, 0.9058824, 1,
1.100412, 1.136644, 0.09503759, 1, 0, 0.9019608, 1,
1.118447, -0.06886256, 1.332955, 1, 0, 0.8941177, 1,
1.119284, -0.8201911, 1.74237, 1, 0, 0.8862745, 1,
1.12157, 0.5183054, 0.6640027, 1, 0, 0.8823529, 1,
1.125159, -1.185187, 1.650464, 1, 0, 0.8745098, 1,
1.125866, -0.0187857, 2.483856, 1, 0, 0.8705882, 1,
1.134204, -1.598248, 2.123557, 1, 0, 0.8627451, 1,
1.145243, 1.059785, 1.05638, 1, 0, 0.8588235, 1,
1.145916, 0.491901, 0.04643936, 1, 0, 0.8509804, 1,
1.146245, -1.205038, 3.825053, 1, 0, 0.8470588, 1,
1.149638, -1.081469, 2.885865, 1, 0, 0.8392157, 1,
1.15279, 0.3142769, 1.481264, 1, 0, 0.8352941, 1,
1.159947, -1.361727, 2.737518, 1, 0, 0.827451, 1,
1.160456, 1.560829, 0.5383579, 1, 0, 0.8235294, 1,
1.161554, -0.02898402, 1.94124, 1, 0, 0.8156863, 1,
1.16614, -0.7523969, 2.045769, 1, 0, 0.8117647, 1,
1.173552, 0.7028095, 0.6839516, 1, 0, 0.8039216, 1,
1.176209, 0.1413499, 0.150931, 1, 0, 0.7960784, 1,
1.179967, -0.4205888, 1.493059, 1, 0, 0.7921569, 1,
1.18124, 0.3684306, 4.36877, 1, 0, 0.7843137, 1,
1.187011, -0.8749192, 1.755306, 1, 0, 0.7803922, 1,
1.189185, -0.4002606, 1.790222, 1, 0, 0.772549, 1,
1.19959, 0.6307057, -0.3619242, 1, 0, 0.7686275, 1,
1.206194, 0.4143315, 2.710324, 1, 0, 0.7607843, 1,
1.208853, -1.342646, 3.20021, 1, 0, 0.7568628, 1,
1.211632, 0.5794815, 1.902256, 1, 0, 0.7490196, 1,
1.215552, 1.37085, 0.4435808, 1, 0, 0.7450981, 1,
1.218307, -0.3755353, 2.16418, 1, 0, 0.7372549, 1,
1.224229, -0.5163202, 1.542187, 1, 0, 0.7333333, 1,
1.23096, 1.63844, 1.175629, 1, 0, 0.7254902, 1,
1.255284, -0.4527017, 2.228402, 1, 0, 0.7215686, 1,
1.260228, 0.1203587, 1.872293, 1, 0, 0.7137255, 1,
1.267285, -0.05174263, 0.6225655, 1, 0, 0.7098039, 1,
1.267698, -2.273269, 5.050192, 1, 0, 0.7019608, 1,
1.268567, -1.064969, 2.149392, 1, 0, 0.6941177, 1,
1.271615, 0.7760112, 0.03720863, 1, 0, 0.6901961, 1,
1.284271, 0.1418098, -0.9512421, 1, 0, 0.682353, 1,
1.286993, -0.4041736, 2.120429, 1, 0, 0.6784314, 1,
1.298592, 2.227896, 0.5349725, 1, 0, 0.6705883, 1,
1.300712, 0.1821854, 0.4673716, 1, 0, 0.6666667, 1,
1.305966, -0.8463035, -0.3917288, 1, 0, 0.6588235, 1,
1.306712, -0.57869, 1.272593, 1, 0, 0.654902, 1,
1.314201, -0.4795078, 1.327462, 1, 0, 0.6470588, 1,
1.318889, 0.1170765, 1.943988, 1, 0, 0.6431373, 1,
1.318898, -0.239099, 1.703174, 1, 0, 0.6352941, 1,
1.321203, 1.964865, 2.377216, 1, 0, 0.6313726, 1,
1.324841, -1.906068, 3.551382, 1, 0, 0.6235294, 1,
1.338967, -1.383946, 1.348763, 1, 0, 0.6196079, 1,
1.340153, -2.038276, 2.483153, 1, 0, 0.6117647, 1,
1.346959, -0.4368849, 0.6134576, 1, 0, 0.6078432, 1,
1.349179, 1.453275, 0.08281442, 1, 0, 0.6, 1,
1.350695, 0.1386645, 1.295344, 1, 0, 0.5921569, 1,
1.350737, 0.7297023, 0.8765222, 1, 0, 0.5882353, 1,
1.366815, 0.4489593, 0.3445825, 1, 0, 0.5803922, 1,
1.368214, 1.036875, -0.03217504, 1, 0, 0.5764706, 1,
1.368333, -0.2086439, 2.401002, 1, 0, 0.5686275, 1,
1.384106, 1.35832, -0.1828363, 1, 0, 0.5647059, 1,
1.388278, -0.08824389, 2.109088, 1, 0, 0.5568628, 1,
1.395602, 0.15966, 0.7351124, 1, 0, 0.5529412, 1,
1.397281, 0.9919511, 0.4650102, 1, 0, 0.5450981, 1,
1.399102, -0.253915, 0.5047155, 1, 0, 0.5411765, 1,
1.399915, -1.428237, 2.589638, 1, 0, 0.5333334, 1,
1.401468, 0.7888251, 1.887944, 1, 0, 0.5294118, 1,
1.404308, 0.6185824, 1.066036, 1, 0, 0.5215687, 1,
1.407351, 0.155675, -1.189418, 1, 0, 0.5176471, 1,
1.407722, -1.241541, 2.327386, 1, 0, 0.509804, 1,
1.422147, 0.8523574, 0.2410617, 1, 0, 0.5058824, 1,
1.434859, 1.264552, 0.1663986, 1, 0, 0.4980392, 1,
1.438562, 0.6245067, 1.24112, 1, 0, 0.4901961, 1,
1.44637, 0.7520488, 2.439673, 1, 0, 0.4862745, 1,
1.450838, -0.5986066, 2.005552, 1, 0, 0.4784314, 1,
1.454512, -0.8177425, 3.821834, 1, 0, 0.4745098, 1,
1.455331, 0.8324259, -0.1513524, 1, 0, 0.4666667, 1,
1.467752, 0.4958937, 1.348182, 1, 0, 0.4627451, 1,
1.468693, 1.069943, 1.945964, 1, 0, 0.454902, 1,
1.472044, -0.8885641, 2.816703, 1, 0, 0.4509804, 1,
1.473139, -0.2798505, 0.5242251, 1, 0, 0.4431373, 1,
1.474643, -0.9332416, 1.690516, 1, 0, 0.4392157, 1,
1.481427, 0.4979597, 0.2098279, 1, 0, 0.4313726, 1,
1.487081, 0.1958673, 1.34644, 1, 0, 0.427451, 1,
1.487336, 2.091623, 1.250657, 1, 0, 0.4196078, 1,
1.489276, 0.4616882, -0.2517969, 1, 0, 0.4156863, 1,
1.502921, -0.5078783, 3.141629, 1, 0, 0.4078431, 1,
1.511902, 0.2651553, 1.982655, 1, 0, 0.4039216, 1,
1.516474, 0.2214704, 2.094235, 1, 0, 0.3960784, 1,
1.52758, -0.2046905, 1.836827, 1, 0, 0.3882353, 1,
1.528024, 0.2705503, 1.320459, 1, 0, 0.3843137, 1,
1.534443, -0.3057402, 0.2800902, 1, 0, 0.3764706, 1,
1.535962, 2.083166, -0.5025942, 1, 0, 0.372549, 1,
1.557207, -1.697698, 3.046224, 1, 0, 0.3647059, 1,
1.566783, 0.3291351, -0.1116815, 1, 0, 0.3607843, 1,
1.569649, -0.3425421, 1.980147, 1, 0, 0.3529412, 1,
1.593821, -2.500084, 3.221061, 1, 0, 0.3490196, 1,
1.611377, -0.7791244, 2.329764, 1, 0, 0.3411765, 1,
1.649248, 0.2474821, 0.2444782, 1, 0, 0.3372549, 1,
1.656829, 0.1599284, 0.7514983, 1, 0, 0.3294118, 1,
1.658273, 1.63351, 1.969555, 1, 0, 0.3254902, 1,
1.670367, 0.522437, -1.028323, 1, 0, 0.3176471, 1,
1.67053, -0.4188299, 3.012274, 1, 0, 0.3137255, 1,
1.675262, 0.1342854, 1.564264, 1, 0, 0.3058824, 1,
1.702928, 0.8966933, 0.3231472, 1, 0, 0.2980392, 1,
1.708494, -0.4554017, 2.420892, 1, 0, 0.2941177, 1,
1.719374, -1.408413, 3.46901, 1, 0, 0.2862745, 1,
1.724311, 0.3984204, 1.153658, 1, 0, 0.282353, 1,
1.734036, -0.4878256, 1.164161, 1, 0, 0.2745098, 1,
1.736564, 1.065765, 1.399865, 1, 0, 0.2705882, 1,
1.754055, 1.02179, 0.8241302, 1, 0, 0.2627451, 1,
1.762726, -0.6088089, 2.649951, 1, 0, 0.2588235, 1,
1.782176, -1.211922, 1.752968, 1, 0, 0.2509804, 1,
1.802514, 1.070008, 2.746834, 1, 0, 0.2470588, 1,
1.804365, -1.119944, 2.857295, 1, 0, 0.2392157, 1,
1.807447, 0.7278491, 1.930609, 1, 0, 0.2352941, 1,
1.831599, -0.09056721, 1.290249, 1, 0, 0.227451, 1,
1.844924, -1.099177, 3.568826, 1, 0, 0.2235294, 1,
1.852187, 1.02315, 0.2902687, 1, 0, 0.2156863, 1,
1.859059, 1.205383, 1.81275, 1, 0, 0.2117647, 1,
1.864097, 0.1787018, 2.386258, 1, 0, 0.2039216, 1,
1.871612, -0.09634563, 2.092967, 1, 0, 0.1960784, 1,
1.881441, -1.221048, 0.926088, 1, 0, 0.1921569, 1,
1.884989, -0.1085243, 2.010706, 1, 0, 0.1843137, 1,
1.885997, -1.891819, 1.617369, 1, 0, 0.1803922, 1,
1.90345, -1.796382, 2.07666, 1, 0, 0.172549, 1,
1.906531, 0.2099722, 3.186022, 1, 0, 0.1686275, 1,
1.906645, 0.4946321, 3.166606, 1, 0, 0.1607843, 1,
1.921662, 0.565793, 1.576901, 1, 0, 0.1568628, 1,
1.922183, -0.8599119, 0.9936049, 1, 0, 0.1490196, 1,
1.956824, 0.8103335, 0.6832631, 1, 0, 0.145098, 1,
1.967849, 0.8277906, 0.5299817, 1, 0, 0.1372549, 1,
1.973337, -1.726872, 2.057974, 1, 0, 0.1333333, 1,
1.989099, -2.592473, 2.989741, 1, 0, 0.1254902, 1,
2.002951, -1.687722, 1.900075, 1, 0, 0.1215686, 1,
2.052177, 1.638682, 0.972762, 1, 0, 0.1137255, 1,
2.0665, -1.118103, 1.133311, 1, 0, 0.1098039, 1,
2.14669, -0.5519518, 2.098747, 1, 0, 0.1019608, 1,
2.14706, -0.239564, 2.272036, 1, 0, 0.09411765, 1,
2.161053, -1.447945, 2.707638, 1, 0, 0.09019608, 1,
2.207536, -0.1815948, -0.8286013, 1, 0, 0.08235294, 1,
2.220634, -0.4628505, 2.760644, 1, 0, 0.07843138, 1,
2.230049, 0.5816715, 0.8874298, 1, 0, 0.07058824, 1,
2.272439, 1.321172, 1.853587, 1, 0, 0.06666667, 1,
2.308599, 0.7221557, 0.2896245, 1, 0, 0.05882353, 1,
2.439579, 0.5241902, 2.231154, 1, 0, 0.05490196, 1,
2.511775, 1.40268, -1.853333, 1, 0, 0.04705882, 1,
2.66039, -0.922778, -0.3638099, 1, 0, 0.04313726, 1,
2.741045, 0.141248, 1.304531, 1, 0, 0.03529412, 1,
2.775442, -0.8398281, 2.302073, 1, 0, 0.03137255, 1,
3.037054, 0.7606092, 1.547712, 1, 0, 0.02352941, 1,
3.062649, -0.9437056, 3.140594, 1, 0, 0.01960784, 1,
3.114624, 0.07035862, 2.787591, 1, 0, 0.01176471, 1,
3.654137, 1.863107, 0.9616095, 1, 0, 0.007843138, 1
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
0.3692412, -4.143904, -6.638723, 0, -0.5, 0.5, 0.5,
0.3692412, -4.143904, -6.638723, 1, -0.5, 0.5, 0.5,
0.3692412, -4.143904, -6.638723, 1, 1.5, 0.5, 0.5,
0.3692412, -4.143904, -6.638723, 0, 1.5, 0.5, 0.5
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
-4.029235, -0.09820223, -6.638723, 0, -0.5, 0.5, 0.5,
-4.029235, -0.09820223, -6.638723, 1, -0.5, 0.5, 0.5,
-4.029235, -0.09820223, -6.638723, 1, 1.5, 0.5, 0.5,
-4.029235, -0.09820223, -6.638723, 0, 1.5, 0.5, 0.5
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
-4.029235, -4.143904, 0.1815381, 0, -0.5, 0.5, 0.5,
-4.029235, -4.143904, 0.1815381, 1, -0.5, 0.5, 0.5,
-4.029235, -4.143904, 0.1815381, 1, 1.5, 0.5, 0.5,
-4.029235, -4.143904, 0.1815381, 0, 1.5, 0.5, 0.5
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
-2, -3.210281, -5.064816,
3, -3.210281, -5.064816,
-2, -3.210281, -5.064816,
-2, -3.365885, -5.327135,
-1, -3.210281, -5.064816,
-1, -3.365885, -5.327135,
0, -3.210281, -5.064816,
0, -3.365885, -5.327135,
1, -3.210281, -5.064816,
1, -3.365885, -5.327135,
2, -3.210281, -5.064816,
2, -3.365885, -5.327135,
3, -3.210281, -5.064816,
3, -3.365885, -5.327135
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
-2, -3.677092, -5.85177, 0, -0.5, 0.5, 0.5,
-2, -3.677092, -5.85177, 1, -0.5, 0.5, 0.5,
-2, -3.677092, -5.85177, 1, 1.5, 0.5, 0.5,
-2, -3.677092, -5.85177, 0, 1.5, 0.5, 0.5,
-1, -3.677092, -5.85177, 0, -0.5, 0.5, 0.5,
-1, -3.677092, -5.85177, 1, -0.5, 0.5, 0.5,
-1, -3.677092, -5.85177, 1, 1.5, 0.5, 0.5,
-1, -3.677092, -5.85177, 0, 1.5, 0.5, 0.5,
0, -3.677092, -5.85177, 0, -0.5, 0.5, 0.5,
0, -3.677092, -5.85177, 1, -0.5, 0.5, 0.5,
0, -3.677092, -5.85177, 1, 1.5, 0.5, 0.5,
0, -3.677092, -5.85177, 0, 1.5, 0.5, 0.5,
1, -3.677092, -5.85177, 0, -0.5, 0.5, 0.5,
1, -3.677092, -5.85177, 1, -0.5, 0.5, 0.5,
1, -3.677092, -5.85177, 1, 1.5, 0.5, 0.5,
1, -3.677092, -5.85177, 0, 1.5, 0.5, 0.5,
2, -3.677092, -5.85177, 0, -0.5, 0.5, 0.5,
2, -3.677092, -5.85177, 1, -0.5, 0.5, 0.5,
2, -3.677092, -5.85177, 1, 1.5, 0.5, 0.5,
2, -3.677092, -5.85177, 0, 1.5, 0.5, 0.5,
3, -3.677092, -5.85177, 0, -0.5, 0.5, 0.5,
3, -3.677092, -5.85177, 1, -0.5, 0.5, 0.5,
3, -3.677092, -5.85177, 1, 1.5, 0.5, 0.5,
3, -3.677092, -5.85177, 0, 1.5, 0.5, 0.5
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
-3.014202, -3, -5.064816,
-3.014202, 2, -5.064816,
-3.014202, -3, -5.064816,
-3.183374, -3, -5.327135,
-3.014202, -2, -5.064816,
-3.183374, -2, -5.327135,
-3.014202, -1, -5.064816,
-3.183374, -1, -5.327135,
-3.014202, 0, -5.064816,
-3.183374, 0, -5.327135,
-3.014202, 1, -5.064816,
-3.183374, 1, -5.327135,
-3.014202, 2, -5.064816,
-3.183374, 2, -5.327135
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
-3.521718, -3, -5.85177, 0, -0.5, 0.5, 0.5,
-3.521718, -3, -5.85177, 1, -0.5, 0.5, 0.5,
-3.521718, -3, -5.85177, 1, 1.5, 0.5, 0.5,
-3.521718, -3, -5.85177, 0, 1.5, 0.5, 0.5,
-3.521718, -2, -5.85177, 0, -0.5, 0.5, 0.5,
-3.521718, -2, -5.85177, 1, -0.5, 0.5, 0.5,
-3.521718, -2, -5.85177, 1, 1.5, 0.5, 0.5,
-3.521718, -2, -5.85177, 0, 1.5, 0.5, 0.5,
-3.521718, -1, -5.85177, 0, -0.5, 0.5, 0.5,
-3.521718, -1, -5.85177, 1, -0.5, 0.5, 0.5,
-3.521718, -1, -5.85177, 1, 1.5, 0.5, 0.5,
-3.521718, -1, -5.85177, 0, 1.5, 0.5, 0.5,
-3.521718, 0, -5.85177, 0, -0.5, 0.5, 0.5,
-3.521718, 0, -5.85177, 1, -0.5, 0.5, 0.5,
-3.521718, 0, -5.85177, 1, 1.5, 0.5, 0.5,
-3.521718, 0, -5.85177, 0, 1.5, 0.5, 0.5,
-3.521718, 1, -5.85177, 0, -0.5, 0.5, 0.5,
-3.521718, 1, -5.85177, 1, -0.5, 0.5, 0.5,
-3.521718, 1, -5.85177, 1, 1.5, 0.5, 0.5,
-3.521718, 1, -5.85177, 0, 1.5, 0.5, 0.5,
-3.521718, 2, -5.85177, 0, -0.5, 0.5, 0.5,
-3.521718, 2, -5.85177, 1, -0.5, 0.5, 0.5,
-3.521718, 2, -5.85177, 1, 1.5, 0.5, 0.5,
-3.521718, 2, -5.85177, 0, 1.5, 0.5, 0.5
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
-3.014202, -3.210281, -4,
-3.014202, -3.210281, 4,
-3.014202, -3.210281, -4,
-3.183374, -3.365885, -4,
-3.014202, -3.210281, -2,
-3.183374, -3.365885, -2,
-3.014202, -3.210281, 0,
-3.183374, -3.365885, 0,
-3.014202, -3.210281, 2,
-3.183374, -3.365885, 2,
-3.014202, -3.210281, 4,
-3.183374, -3.365885, 4
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
-3.521718, -3.677092, -4, 0, -0.5, 0.5, 0.5,
-3.521718, -3.677092, -4, 1, -0.5, 0.5, 0.5,
-3.521718, -3.677092, -4, 1, 1.5, 0.5, 0.5,
-3.521718, -3.677092, -4, 0, 1.5, 0.5, 0.5,
-3.521718, -3.677092, -2, 0, -0.5, 0.5, 0.5,
-3.521718, -3.677092, -2, 1, -0.5, 0.5, 0.5,
-3.521718, -3.677092, -2, 1, 1.5, 0.5, 0.5,
-3.521718, -3.677092, -2, 0, 1.5, 0.5, 0.5,
-3.521718, -3.677092, 0, 0, -0.5, 0.5, 0.5,
-3.521718, -3.677092, 0, 1, -0.5, 0.5, 0.5,
-3.521718, -3.677092, 0, 1, 1.5, 0.5, 0.5,
-3.521718, -3.677092, 0, 0, 1.5, 0.5, 0.5,
-3.521718, -3.677092, 2, 0, -0.5, 0.5, 0.5,
-3.521718, -3.677092, 2, 1, -0.5, 0.5, 0.5,
-3.521718, -3.677092, 2, 1, 1.5, 0.5, 0.5,
-3.521718, -3.677092, 2, 0, 1.5, 0.5, 0.5,
-3.521718, -3.677092, 4, 0, -0.5, 0.5, 0.5,
-3.521718, -3.677092, 4, 1, -0.5, 0.5, 0.5,
-3.521718, -3.677092, 4, 1, 1.5, 0.5, 0.5,
-3.521718, -3.677092, 4, 0, 1.5, 0.5, 0.5
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
-3.014202, -3.210281, -5.064816,
-3.014202, 3.013876, -5.064816,
-3.014202, -3.210281, 5.427893,
-3.014202, 3.013876, 5.427893,
-3.014202, -3.210281, -5.064816,
-3.014202, -3.210281, 5.427893,
-3.014202, 3.013876, -5.064816,
-3.014202, 3.013876, 5.427893,
-3.014202, -3.210281, -5.064816,
3.752684, -3.210281, -5.064816,
-3.014202, -3.210281, 5.427893,
3.752684, -3.210281, 5.427893,
-3.014202, 3.013876, -5.064816,
3.752684, 3.013876, -5.064816,
-3.014202, 3.013876, 5.427893,
3.752684, 3.013876, 5.427893,
3.752684, -3.210281, -5.064816,
3.752684, 3.013876, -5.064816,
3.752684, -3.210281, 5.427893,
3.752684, 3.013876, 5.427893,
3.752684, -3.210281, -5.064816,
3.752684, -3.210281, 5.427893,
3.752684, 3.013876, -5.064816,
3.752684, 3.013876, 5.427893
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
var radius = 7.449514;
var distance = 33.14373;
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
mvMatrix.translate( -0.3692412, 0.09820223, -0.1815381 );
mvMatrix.scale( 1.190291, 1.294081, 0.767634 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.14373);
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
aldicarb_sulfone<-read.table("aldicarb_sulfone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aldicarb_sulfone$V2
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
```

```r
y<-aldicarb_sulfone$V3
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
```

```r
z<-aldicarb_sulfone$V4
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
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
-2.915655, -0.159252, -2.143393, 0, 0, 1, 1, 1,
-2.890402, 0.05288331, -1.653299, 1, 0, 0, 1, 1,
-2.676002, -1.220494, 0.496208, 1, 0, 0, 1, 1,
-2.587065, -0.7046818, -2.579662, 1, 0, 0, 1, 1,
-2.528756, 0.3170768, -1.467942, 1, 0, 0, 1, 1,
-2.518645, -0.1888142, -2.423808, 1, 0, 0, 1, 1,
-2.455831, 0.3212935, 0.5122074, 0, 0, 0, 1, 1,
-2.399667, -0.1065261, -0.1778097, 0, 0, 0, 1, 1,
-2.235129, -1.628143, -3.678581, 0, 0, 0, 1, 1,
-2.159897, 0.5639126, -1.555496, 0, 0, 0, 1, 1,
-2.137808, -0.9537369, -2.37301, 0, 0, 0, 1, 1,
-2.128926, -0.513493, -3.476311, 0, 0, 0, 1, 1,
-2.066779, 0.8111861, -2.053102, 0, 0, 0, 1, 1,
-2.043257, -0.07769177, -1.247372, 1, 1, 1, 1, 1,
-2.035824, 1.09717, 1.120962, 1, 1, 1, 1, 1,
-2.0309, 0.7104282, -1.650759, 1, 1, 1, 1, 1,
-2.005733, 1.070444, -0.5003949, 1, 1, 1, 1, 1,
-2.002645, -0.6270653, -1.893956, 1, 1, 1, 1, 1,
-1.997017, 0.57662, -0.8756691, 1, 1, 1, 1, 1,
-1.967742, 1.344798, -1.392703, 1, 1, 1, 1, 1,
-1.957349, 0.1999328, -1.367324, 1, 1, 1, 1, 1,
-1.953676, 1.004626, 0.1005825, 1, 1, 1, 1, 1,
-1.94777, -0.9777277, -3.610006, 1, 1, 1, 1, 1,
-1.914231, 1.066977, -3.368356, 1, 1, 1, 1, 1,
-1.913565, -0.1423336, -2.393156, 1, 1, 1, 1, 1,
-1.903642, -0.1241704, -1.390434, 1, 1, 1, 1, 1,
-1.9033, 0.7843497, -1.443484, 1, 1, 1, 1, 1,
-1.892965, 0.6426487, -1.640762, 1, 1, 1, 1, 1,
-1.891062, 1.522209, -1.463607, 0, 0, 1, 1, 1,
-1.87253, 0.6738402, -2.152997, 1, 0, 0, 1, 1,
-1.860973, 0.541193, -3.344671, 1, 0, 0, 1, 1,
-1.857603, -1.386003, -0.4566186, 1, 0, 0, 1, 1,
-1.852544, 0.2847918, -1.681446, 1, 0, 0, 1, 1,
-1.83892, 0.4535524, -0.6701518, 1, 0, 0, 1, 1,
-1.833948, 0.8394488, 0.7665085, 0, 0, 0, 1, 1,
-1.828981, 0.1418058, -0.5889616, 0, 0, 0, 1, 1,
-1.763244, -0.6980058, -1.613415, 0, 0, 0, 1, 1,
-1.754074, -0.1699628, -1.591439, 0, 0, 0, 1, 1,
-1.741675, -0.2683627, -1.766788, 0, 0, 0, 1, 1,
-1.734983, 0.9161806, -1.349615, 0, 0, 0, 1, 1,
-1.734936, -0.251475, -2.209421, 0, 0, 0, 1, 1,
-1.733773, 0.1842928, -1.868948, 1, 1, 1, 1, 1,
-1.726483, -0.347863, -3.421603, 1, 1, 1, 1, 1,
-1.726461, 0.204088, -0.4426567, 1, 1, 1, 1, 1,
-1.709466, -0.3672016, -3.115399, 1, 1, 1, 1, 1,
-1.703793, 0.8599029, -1.010722, 1, 1, 1, 1, 1,
-1.70379, -0.0752617, -2.938659, 1, 1, 1, 1, 1,
-1.696501, -0.2784001, -1.45556, 1, 1, 1, 1, 1,
-1.679039, 0.2470026, -3.518957, 1, 1, 1, 1, 1,
-1.660157, 1.365435, -0.9248087, 1, 1, 1, 1, 1,
-1.653053, 0.1588566, -2.292213, 1, 1, 1, 1, 1,
-1.636544, -1.800794, -2.719818, 1, 1, 1, 1, 1,
-1.629927, -0.3939185, -2.138219, 1, 1, 1, 1, 1,
-1.628051, -0.5887032, -2.269048, 1, 1, 1, 1, 1,
-1.618142, -0.02120312, -1.999639, 1, 1, 1, 1, 1,
-1.610623, -1.422002, -1.547571, 1, 1, 1, 1, 1,
-1.605986, 0.3371561, -1.374889, 0, 0, 1, 1, 1,
-1.594043, 1.803672, 0.07903942, 1, 0, 0, 1, 1,
-1.590199, 0.996537, -0.2892841, 1, 0, 0, 1, 1,
-1.56759, -1.665827, -4.088719, 1, 0, 0, 1, 1,
-1.564225, -0.8633559, -1.611795, 1, 0, 0, 1, 1,
-1.559898, -0.313985, -1.706515, 1, 0, 0, 1, 1,
-1.557973, -0.4038536, -1.62198, 0, 0, 0, 1, 1,
-1.555163, -0.4981112, -1.683703, 0, 0, 0, 1, 1,
-1.545509, 0.1724103, -1.481337, 0, 0, 0, 1, 1,
-1.542696, 0.7592157, 0.7028714, 0, 0, 0, 1, 1,
-1.538456, -0.8523196, -1.47821, 0, 0, 0, 1, 1,
-1.537238, 0.8887122, -0.7534583, 0, 0, 0, 1, 1,
-1.530973, 0.1085504, -2.455066, 0, 0, 0, 1, 1,
-1.527724, -0.7225159, -2.255458, 1, 1, 1, 1, 1,
-1.501045, 0.9727234, -1.620701, 1, 1, 1, 1, 1,
-1.498268, 0.03192393, -0.8000373, 1, 1, 1, 1, 1,
-1.492739, -1.816601, -4.480718, 1, 1, 1, 1, 1,
-1.485888, 1.667184, -0.5549697, 1, 1, 1, 1, 1,
-1.477669, -0.2315094, -1.16496, 1, 1, 1, 1, 1,
-1.466966, 0.5724984, -1.556511, 1, 1, 1, 1, 1,
-1.465708, -0.4992712, -2.693401, 1, 1, 1, 1, 1,
-1.463534, -0.3926108, -1.521829, 1, 1, 1, 1, 1,
-1.457615, 0.34513, -1.422186, 1, 1, 1, 1, 1,
-1.449236, -0.7710953, -2.257731, 1, 1, 1, 1, 1,
-1.443819, 0.7012587, -0.5099288, 1, 1, 1, 1, 1,
-1.442288, -0.99259, -1.135926, 1, 1, 1, 1, 1,
-1.43859, -1.44869, -1.373196, 1, 1, 1, 1, 1,
-1.43119, 0.4666665, -1.166426, 1, 1, 1, 1, 1,
-1.430612, 0.008720709, -0.5893039, 0, 0, 1, 1, 1,
-1.427468, -0.4901237, -2.071773, 1, 0, 0, 1, 1,
-1.425742, 0.4517409, -2.432083, 1, 0, 0, 1, 1,
-1.423896, -0.3997514, -3.391179, 1, 0, 0, 1, 1,
-1.41195, 0.7176089, 0.1719238, 1, 0, 0, 1, 1,
-1.405368, 0.8927593, -0.2456679, 1, 0, 0, 1, 1,
-1.405046, -0.6712896, -2.508617, 0, 0, 0, 1, 1,
-1.403184, -0.4498746, -1.509841, 0, 0, 0, 1, 1,
-1.402812, 0.5743617, 0.7449663, 0, 0, 0, 1, 1,
-1.399575, 0.4795615, -2.012934, 0, 0, 0, 1, 1,
-1.388351, 0.7022298, -2.91516, 0, 0, 0, 1, 1,
-1.381121, -0.4486958, -2.767587, 0, 0, 0, 1, 1,
-1.371844, 0.8826318, 1.320084, 0, 0, 0, 1, 1,
-1.370578, -0.8955032, -0.2998678, 1, 1, 1, 1, 1,
-1.346179, -0.9185354, -3.538564, 1, 1, 1, 1, 1,
-1.342358, 0.1291237, -1.499339, 1, 1, 1, 1, 1,
-1.341444, 0.8953813, -2.374331, 1, 1, 1, 1, 1,
-1.333597, -0.772391, -0.6213416, 1, 1, 1, 1, 1,
-1.316762, -0.03273173, -2.179245, 1, 1, 1, 1, 1,
-1.303039, 0.2651914, -1.799516, 1, 1, 1, 1, 1,
-1.284264, -0.3074232, -2.669697, 1, 1, 1, 1, 1,
-1.283696, 0.2728192, -2.055058, 1, 1, 1, 1, 1,
-1.281902, -0.09693776, -0.5156938, 1, 1, 1, 1, 1,
-1.281731, 0.01493582, -1.65022, 1, 1, 1, 1, 1,
-1.263736, 0.2935792, -1.769606, 1, 1, 1, 1, 1,
-1.218896, 1.591921, -2.179569, 1, 1, 1, 1, 1,
-1.21723, -0.1399107, -0.8837721, 1, 1, 1, 1, 1,
-1.216389, -0.3470806, -1.189837, 1, 1, 1, 1, 1,
-1.214592, -0.46895, -0.5966225, 0, 0, 1, 1, 1,
-1.210177, 0.8775265, -0.1703447, 1, 0, 0, 1, 1,
-1.21015, -0.04134925, 0.6936462, 1, 0, 0, 1, 1,
-1.20305, 0.2526675, -1.372353, 1, 0, 0, 1, 1,
-1.200675, 1.963961, 0.5248986, 1, 0, 0, 1, 1,
-1.196266, -1.135039, -2.586367, 1, 0, 0, 1, 1,
-1.196155, -0.08837092, -3.225792, 0, 0, 0, 1, 1,
-1.193219, 1.005953, -2.314603, 0, 0, 0, 1, 1,
-1.190943, -0.6470388, -0.5106311, 0, 0, 0, 1, 1,
-1.19065, -1.681624, -2.55756, 0, 0, 0, 1, 1,
-1.189787, -0.3600448, -2.845263, 0, 0, 0, 1, 1,
-1.189107, -1.05291, -1.567527, 0, 0, 0, 1, 1,
-1.167644, 0.499294, -2.183964, 0, 0, 0, 1, 1,
-1.16559, -0.5590824, -0.975715, 1, 1, 1, 1, 1,
-1.165145, -1.575867, -2.257036, 1, 1, 1, 1, 1,
-1.164157, -0.2795156, -2.04404, 1, 1, 1, 1, 1,
-1.163631, -1.066072, -3.246654, 1, 1, 1, 1, 1,
-1.161294, 1.993483, 0.4266762, 1, 1, 1, 1, 1,
-1.158447, 1.014468, -1.018535, 1, 1, 1, 1, 1,
-1.154004, 0.8540489, -0.5554196, 1, 1, 1, 1, 1,
-1.150056, -0.4708208, -1.706448, 1, 1, 1, 1, 1,
-1.128758, -1.230177, -3.090094, 1, 1, 1, 1, 1,
-1.124238, 0.4717714, -2.062269, 1, 1, 1, 1, 1,
-1.115864, 0.4432074, -1.801014, 1, 1, 1, 1, 1,
-1.107216, 0.8841482, -2.162808, 1, 1, 1, 1, 1,
-1.105396, -1.11983, -4.697155, 1, 1, 1, 1, 1,
-1.103739, 0.162121, -1.405184, 1, 1, 1, 1, 1,
-1.101825, -1.026697, -2.482467, 1, 1, 1, 1, 1,
-1.099558, -0.5771244, -0.849025, 0, 0, 1, 1, 1,
-1.094428, -0.1055764, -1.008062, 1, 0, 0, 1, 1,
-1.093731, 1.628427, 0.06684305, 1, 0, 0, 1, 1,
-1.090609, -0.4085193, -2.953322, 1, 0, 0, 1, 1,
-1.088962, 0.7584569, -0.5813196, 1, 0, 0, 1, 1,
-1.084581, 0.6828101, -0.7362198, 1, 0, 0, 1, 1,
-1.080528, -0.8101022, -0.5132785, 0, 0, 0, 1, 1,
-1.078394, 0.5406332, 0.9787794, 0, 0, 0, 1, 1,
-1.072528, 0.05783733, -1.778873, 0, 0, 0, 1, 1,
-1.072119, -0.6272656, -2.693426, 0, 0, 0, 1, 1,
-1.071962, 0.5341604, -1.838869, 0, 0, 0, 1, 1,
-1.069549, 0.1119726, -0.5135544, 0, 0, 0, 1, 1,
-1.062955, -0.6772988, -2.663444, 0, 0, 0, 1, 1,
-1.042539, 0.4357807, -1.047749, 1, 1, 1, 1, 1,
-1.04015, -1.349443, -2.675609, 1, 1, 1, 1, 1,
-1.037016, -1.89216, -2.829572, 1, 1, 1, 1, 1,
-1.031348, -1.507317, -1.618609, 1, 1, 1, 1, 1,
-1.020217, 0.9301057, 1.40942, 1, 1, 1, 1, 1,
-1.019427, -0.4249933, -1.178087, 1, 1, 1, 1, 1,
-1.013374, -1.678745, -4.897675, 1, 1, 1, 1, 1,
-1.011248, -0.6452534, -1.26524, 1, 1, 1, 1, 1,
-1.005019, 1.275943, 0.5062732, 1, 1, 1, 1, 1,
-1.004224, 0.9933758, 0.07121348, 1, 1, 1, 1, 1,
-0.9954025, 0.9716021, 0.3529546, 1, 1, 1, 1, 1,
-0.9910464, 0.3754296, -2.197713, 1, 1, 1, 1, 1,
-0.9875229, -2.121022, -2.278409, 1, 1, 1, 1, 1,
-0.9874139, 0.7757947, -1.21882, 1, 1, 1, 1, 1,
-0.9872591, -0.06353424, -3.110848, 1, 1, 1, 1, 1,
-0.9704185, -0.140194, -1.768501, 0, 0, 1, 1, 1,
-0.9675545, 1.103913, -1.051335, 1, 0, 0, 1, 1,
-0.9668314, -0.08205038, -1.690208, 1, 0, 0, 1, 1,
-0.966346, -1.328621, -0.09527513, 1, 0, 0, 1, 1,
-0.9641514, -2.488498, -3.447215, 1, 0, 0, 1, 1,
-0.9632484, 0.006163642, -1.946865, 1, 0, 0, 1, 1,
-0.963151, -1.210465, -3.058047, 0, 0, 0, 1, 1,
-0.9609717, -0.8985742, -1.802236, 0, 0, 0, 1, 1,
-0.9604465, -1.346635, -2.288037, 0, 0, 0, 1, 1,
-0.9602679, -0.4048679, 0.3646695, 0, 0, 0, 1, 1,
-0.9536759, -1.932031, -3.829923, 0, 0, 0, 1, 1,
-0.944082, 2.664528, 0.5808741, 0, 0, 0, 1, 1,
-0.9411356, -0.2444409, -2.288668, 0, 0, 0, 1, 1,
-0.9354199, -1.435396, -2.032288, 1, 1, 1, 1, 1,
-0.9332496, 0.3423989, -0.9400858, 1, 1, 1, 1, 1,
-0.9317527, -1.17235, -3.430675, 1, 1, 1, 1, 1,
-0.9301171, -1.966494, -2.086937, 1, 1, 1, 1, 1,
-0.9222584, -1.032495, -0.4260591, 1, 1, 1, 1, 1,
-0.9185897, -0.1433558, -3.62817, 1, 1, 1, 1, 1,
-0.9145637, -0.03824858, -2.189011, 1, 1, 1, 1, 1,
-0.9054766, -0.7300493, -2.944371, 1, 1, 1, 1, 1,
-0.9034318, -0.9770759, -2.905119, 1, 1, 1, 1, 1,
-0.9000389, -0.07986014, 0.2060433, 1, 1, 1, 1, 1,
-0.8978952, 0.5739157, 1.828855, 1, 1, 1, 1, 1,
-0.8937474, -0.8447915, -2.341308, 1, 1, 1, 1, 1,
-0.888978, -1.269705, -1.598518, 1, 1, 1, 1, 1,
-0.8875459, -1.33448, -0.3232108, 1, 1, 1, 1, 1,
-0.880349, -1.98797, 0.1176719, 1, 1, 1, 1, 1,
-0.8744275, -0.9366599, -3.102149, 0, 0, 1, 1, 1,
-0.871949, 0.4808884, -1.101689, 1, 0, 0, 1, 1,
-0.8695698, 1.075073, -2.228099, 1, 0, 0, 1, 1,
-0.8661591, -2.198028, -1.550294, 1, 0, 0, 1, 1,
-0.8633727, 0.2043524, -2.729298, 1, 0, 0, 1, 1,
-0.8610258, -0.188235, -0.8491752, 1, 0, 0, 1, 1,
-0.8570783, 1.415133, -0.5293999, 0, 0, 0, 1, 1,
-0.8526014, 0.3292528, -0.2849684, 0, 0, 0, 1, 1,
-0.8520382, 0.1147392, 1.096062, 0, 0, 0, 1, 1,
-0.8443393, 0.1079145, -2.285854, 0, 0, 0, 1, 1,
-0.8374983, 2.714994, -0.09050948, 0, 0, 0, 1, 1,
-0.8323696, 0.7134955, 0.006697447, 0, 0, 0, 1, 1,
-0.8321594, 1.214571, -0.4941572, 0, 0, 0, 1, 1,
-0.8267155, 0.3726028, 0.5318447, 1, 1, 1, 1, 1,
-0.8263624, -0.5164873, -2.921916, 1, 1, 1, 1, 1,
-0.8237106, 1.160612, -0.08435871, 1, 1, 1, 1, 1,
-0.8236589, 0.005493664, -2.097855, 1, 1, 1, 1, 1,
-0.8229164, 0.1958646, -2.366591, 1, 1, 1, 1, 1,
-0.8203301, -0.1999529, -2.142017, 1, 1, 1, 1, 1,
-0.8176143, -0.5686923, -2.599938, 1, 1, 1, 1, 1,
-0.8058813, -0.1292927, -2.496207, 1, 1, 1, 1, 1,
-0.8037518, -1.110393, -4.91201, 1, 1, 1, 1, 1,
-0.8006382, -1.024048, -4.755302, 1, 1, 1, 1, 1,
-0.7989978, -1.044451, -3.452787, 1, 1, 1, 1, 1,
-0.7874109, 0.1706323, -2.994552, 1, 1, 1, 1, 1,
-0.7870306, 0.3495716, -2.161528, 1, 1, 1, 1, 1,
-0.7795576, -0.5449462, -1.747242, 1, 1, 1, 1, 1,
-0.7778264, -1.955078, -2.105708, 1, 1, 1, 1, 1,
-0.7736006, 1.049298, -1.774335, 0, 0, 1, 1, 1,
-0.7632506, 0.2882845, -2.102822, 1, 0, 0, 1, 1,
-0.7566994, -0.3681959, -3.077638, 1, 0, 0, 1, 1,
-0.7524216, 0.1089887, -0.3212216, 1, 0, 0, 1, 1,
-0.7494177, 0.9700558, -2.407081, 1, 0, 0, 1, 1,
-0.7470126, 0.3102631, -1.951131, 1, 0, 0, 1, 1,
-0.7450238, -0.9759034, -2.918719, 0, 0, 0, 1, 1,
-0.7427157, 0.5764205, -2.071771, 0, 0, 0, 1, 1,
-0.7421408, 0.2991305, -1.278558, 0, 0, 0, 1, 1,
-0.7295449, -0.3567354, -0.3874446, 0, 0, 0, 1, 1,
-0.7143257, -0.6844276, -1.461674, 0, 0, 0, 1, 1,
-0.7132393, -0.7617151, -2.677911, 0, 0, 0, 1, 1,
-0.7131625, -0.07242762, -0.8608601, 0, 0, 0, 1, 1,
-0.705281, 0.6902135, -3.436604, 1, 1, 1, 1, 1,
-0.7050582, -1.267544, -2.990367, 1, 1, 1, 1, 1,
-0.6949089, -0.5091896, -2.10408, 1, 1, 1, 1, 1,
-0.6900407, 1.681965, -0.1313196, 1, 1, 1, 1, 1,
-0.6877242, -0.5661358, -1.692042, 1, 1, 1, 1, 1,
-0.6870471, 0.3092908, -0.3421617, 1, 1, 1, 1, 1,
-0.6821985, 0.2552379, 0.5701278, 1, 1, 1, 1, 1,
-0.6815921, 1.988009, -0.6154963, 1, 1, 1, 1, 1,
-0.6763235, 0.5464651, -1.563094, 1, 1, 1, 1, 1,
-0.6731721, -0.6101385, -1.308084, 1, 1, 1, 1, 1,
-0.6728695, 1.35443, -1.929271, 1, 1, 1, 1, 1,
-0.6716964, -0.1447833, -2.527615, 1, 1, 1, 1, 1,
-0.6675363, -0.6971782, -2.496192, 1, 1, 1, 1, 1,
-0.6672307, -0.6686126, -2.391988, 1, 1, 1, 1, 1,
-0.6608058, -0.464059, -2.191154, 1, 1, 1, 1, 1,
-0.6597703, 2.514494, -1.404597, 0, 0, 1, 1, 1,
-0.6581022, -0.3826323, -0.8104301, 1, 0, 0, 1, 1,
-0.6521891, 0.9635381, 0.3617291, 1, 0, 0, 1, 1,
-0.6433842, 0.6218048, -0.6632339, 1, 0, 0, 1, 1,
-0.640076, 2.690544, 0.5292785, 1, 0, 0, 1, 1,
-0.6348428, 0.3319431, -0.1041459, 1, 0, 0, 1, 1,
-0.6323185, 0.259073, 0.3639584, 0, 0, 0, 1, 1,
-0.6282461, -0.6848001, -1.197589, 0, 0, 0, 1, 1,
-0.6264315, 1.557975, -1.452649, 0, 0, 0, 1, 1,
-0.6248692, 0.5708917, -1.581146, 0, 0, 0, 1, 1,
-0.6194701, -0.8169376, -2.451349, 0, 0, 0, 1, 1,
-0.6193436, 0.5269945, -1.564113, 0, 0, 0, 1, 1,
-0.6114811, 0.4789059, -2.074537, 0, 0, 0, 1, 1,
-0.6095788, -0.6534891, -1.836387, 1, 1, 1, 1, 1,
-0.6095607, 0.05484422, -4.193764, 1, 1, 1, 1, 1,
-0.6070093, -1.051107, -1.743062, 1, 1, 1, 1, 1,
-0.596065, 0.02616472, -0.8007126, 1, 1, 1, 1, 1,
-0.5944477, 1.535783, 0.02906322, 1, 1, 1, 1, 1,
-0.5942633, -2.223399, -1.301089, 1, 1, 1, 1, 1,
-0.59217, 0.01114944, -1.778684, 1, 1, 1, 1, 1,
-0.5741089, 0.16891, -3.074756, 1, 1, 1, 1, 1,
-0.5728763, -0.5810612, -2.805673, 1, 1, 1, 1, 1,
-0.5678204, 1.240016, -1.757049, 1, 1, 1, 1, 1,
-0.5639747, -0.3512068, -0.126592, 1, 1, 1, 1, 1,
-0.5566906, 0.6406075, 1.008545, 1, 1, 1, 1, 1,
-0.5557891, -1.304687, -1.819268, 1, 1, 1, 1, 1,
-0.5549427, -0.05905804, -3.221619, 1, 1, 1, 1, 1,
-0.5462565, 2.923233, 0.01810475, 1, 1, 1, 1, 1,
-0.5455049, 1.308977, -0.7250339, 0, 0, 1, 1, 1,
-0.5394049, 0.8657328, -0.09582149, 1, 0, 0, 1, 1,
-0.5391014, 2.000234, -1.222991, 1, 0, 0, 1, 1,
-0.5302793, -0.4254602, -2.35197, 1, 0, 0, 1, 1,
-0.5277923, 0.7634194, -0.009447719, 1, 0, 0, 1, 1,
-0.5178915, -2.520628, -2.650521, 1, 0, 0, 1, 1,
-0.5160007, -0.2228466, -2.609841, 0, 0, 0, 1, 1,
-0.5147813, -0.3667928, -3.021601, 0, 0, 0, 1, 1,
-0.5084847, 1.533222, 1.213645, 0, 0, 0, 1, 1,
-0.5069672, 0.4069406, -1.373552, 0, 0, 0, 1, 1,
-0.5037563, -1.103097, -1.560497, 0, 0, 0, 1, 1,
-0.503621, -0.7286733, -2.714588, 0, 0, 0, 1, 1,
-0.4937454, 0.03189241, -0.08153491, 0, 0, 0, 1, 1,
-0.4937082, -1.112, -1.974632, 1, 1, 1, 1, 1,
-0.4894428, -0.31315, -0.850563, 1, 1, 1, 1, 1,
-0.4886442, 0.2484525, -1.653394, 1, 1, 1, 1, 1,
-0.4874757, -0.7717023, -2.4852, 1, 1, 1, 1, 1,
-0.4796433, -0.1181877, -1.930599, 1, 1, 1, 1, 1,
-0.4758665, -0.2287345, -2.1283, 1, 1, 1, 1, 1,
-0.4682592, 1.560745, -1.595535, 1, 1, 1, 1, 1,
-0.4661163, 0.8550918, -0.8442792, 1, 1, 1, 1, 1,
-0.4639572, -1.800092, -3.84176, 1, 1, 1, 1, 1,
-0.4621958, -0.9955772, -3.864574, 1, 1, 1, 1, 1,
-0.4610349, -0.5254811, -2.34501, 1, 1, 1, 1, 1,
-0.4595776, 0.183176, -1.291497, 1, 1, 1, 1, 1,
-0.4583199, -1.064423, -2.424064, 1, 1, 1, 1, 1,
-0.4563721, 1.070734, -0.7083549, 1, 1, 1, 1, 1,
-0.4515843, -1.455516, -2.612249, 1, 1, 1, 1, 1,
-0.4501064, -0.08036014, -2.225098, 0, 0, 1, 1, 1,
-0.4493316, -0.5013811, -1.064212, 1, 0, 0, 1, 1,
-0.4446866, 1.36089, 0.4878367, 1, 0, 0, 1, 1,
-0.4445814, 0.1040632, 0.1996993, 1, 0, 0, 1, 1,
-0.4443012, -1.207581, -2.933299, 1, 0, 0, 1, 1,
-0.4431539, 0.8023685, 0.9393927, 1, 0, 0, 1, 1,
-0.4410932, -0.136005, -3.689597, 0, 0, 0, 1, 1,
-0.4395821, 1.022598, -1.846978, 0, 0, 0, 1, 1,
-0.4380562, 0.7760029, -0.6433807, 0, 0, 0, 1, 1,
-0.4325391, -1.439655, -1.92547, 0, 0, 0, 1, 1,
-0.4199163, 1.576201, 1.306531, 0, 0, 0, 1, 1,
-0.4159094, -0.2840677, -3.553288, 0, 0, 0, 1, 1,
-0.4115543, -1.216681, -1.555539, 0, 0, 0, 1, 1,
-0.4106734, -0.6026556, -2.238991, 1, 1, 1, 1, 1,
-0.4093594, -0.1282104, -2.009543, 1, 1, 1, 1, 1,
-0.4085249, -1.577101, -3.471426, 1, 1, 1, 1, 1,
-0.408166, -0.9356618, -2.929562, 1, 1, 1, 1, 1,
-0.4068484, 0.4939848, -1.223604, 1, 1, 1, 1, 1,
-0.4018758, -1.006617, -3.629217, 1, 1, 1, 1, 1,
-0.4009638, -1.594038, -2.737411, 1, 1, 1, 1, 1,
-0.3938007, 0.9462492, -0.4654886, 1, 1, 1, 1, 1,
-0.3931358, 0.2374486, -0.3484604, 1, 1, 1, 1, 1,
-0.3887356, 0.08431112, -1.260468, 1, 1, 1, 1, 1,
-0.3881099, 0.2222133, 1.569247, 1, 1, 1, 1, 1,
-0.3864098, 0.07775711, -0.9205873, 1, 1, 1, 1, 1,
-0.3759045, 1.18233, 0.3914024, 1, 1, 1, 1, 1,
-0.3740604, 0.209, -0.9379848, 1, 1, 1, 1, 1,
-0.3720678, 1.614984, 1.281846, 1, 1, 1, 1, 1,
-0.3712628, -1.48515, -3.710932, 0, 0, 1, 1, 1,
-0.3711674, 0.1348565, -1.529579, 1, 0, 0, 1, 1,
-0.3685555, -0.3377134, -2.615468, 1, 0, 0, 1, 1,
-0.3597476, 0.5292359, -0.6547674, 1, 0, 0, 1, 1,
-0.3593159, 0.2399309, -2.157165, 1, 0, 0, 1, 1,
-0.3584114, 0.8476162, -0.8805467, 1, 0, 0, 1, 1,
-0.3560682, -0.855675, -4.562778, 0, 0, 0, 1, 1,
-0.3545985, 0.3510226, -0.2013506, 0, 0, 0, 1, 1,
-0.3521599, -0.508141, -3.962738, 0, 0, 0, 1, 1,
-0.3505768, 0.435216, -0.4908399, 0, 0, 0, 1, 1,
-0.3491111, 0.4107742, 0.5188282, 0, 0, 0, 1, 1,
-0.3486916, 0.7094216, -0.2476052, 0, 0, 0, 1, 1,
-0.3472406, -2.032879, -3.974934, 0, 0, 0, 1, 1,
-0.3468695, 0.04242413, -1.94009, 1, 1, 1, 1, 1,
-0.3464279, -2.109543, -2.484797, 1, 1, 1, 1, 1,
-0.3451072, -1.053036, -3.058737, 1, 1, 1, 1, 1,
-0.3441663, -0.9134251, -2.106221, 1, 1, 1, 1, 1,
-0.3431125, -0.2270367, -0.9431416, 1, 1, 1, 1, 1,
-0.3413139, -1.496023, -3.682906, 1, 1, 1, 1, 1,
-0.3393216, 0.809245, -0.07652204, 1, 1, 1, 1, 1,
-0.3386956, 0.4154599, -1.976289, 1, 1, 1, 1, 1,
-0.3386832, -0.1492087, -1.281227, 1, 1, 1, 1, 1,
-0.3383329, -0.09455684, -2.70251, 1, 1, 1, 1, 1,
-0.3358903, 0.118401, -0.8020335, 1, 1, 1, 1, 1,
-0.3338251, -1.535346, -3.431362, 1, 1, 1, 1, 1,
-0.332441, 0.6328365, 0.2091946, 1, 1, 1, 1, 1,
-0.3320076, -0.4233619, -3.64471, 1, 1, 1, 1, 1,
-0.3300856, -0.9637372, -1.459933, 1, 1, 1, 1, 1,
-0.3293972, 2.205604, 0.1759018, 0, 0, 1, 1, 1,
-0.3286792, -1.272986, -1.586255, 1, 0, 0, 1, 1,
-0.3190247, 1.544369, 0.141631, 1, 0, 0, 1, 1,
-0.3170968, 0.086204, -2.660546, 1, 0, 0, 1, 1,
-0.3149975, 0.713164, -0.1091528, 1, 0, 0, 1, 1,
-0.3119889, 1.209329, 0.1386037, 1, 0, 0, 1, 1,
-0.3106616, 1.139488, 0.9942393, 0, 0, 0, 1, 1,
-0.3063731, 0.4480256, -1.147308, 0, 0, 0, 1, 1,
-0.3057254, 0.5985563, -1.517461, 0, 0, 0, 1, 1,
-0.30419, -0.7010033, -2.771625, 0, 0, 0, 1, 1,
-0.3008559, 1.355404, 0.03798756, 0, 0, 0, 1, 1,
-0.2977289, 1.676765, -0.397509, 0, 0, 0, 1, 1,
-0.2961647, -1.112989, -3.732456, 0, 0, 0, 1, 1,
-0.2929574, 0.01131691, -2.965443, 1, 1, 1, 1, 1,
-0.2840406, -0.8331451, -1.10522, 1, 1, 1, 1, 1,
-0.2819176, -1.328728, -2.629853, 1, 1, 1, 1, 1,
-0.2752064, -1.169287, -4.555458, 1, 1, 1, 1, 1,
-0.2706281, 0.8192466, -0.2838764, 1, 1, 1, 1, 1,
-0.2680623, 0.1737719, 0.5869277, 1, 1, 1, 1, 1,
-0.2671895, -0.8430387, -2.916483, 1, 1, 1, 1, 1,
-0.2653719, 1.480679, -0.1629471, 1, 1, 1, 1, 1,
-0.2619595, 0.9092678, -0.1270425, 1, 1, 1, 1, 1,
-0.261117, -2.881308, -1.990356, 1, 1, 1, 1, 1,
-0.2610033, 0.2581194, -0.3720385, 1, 1, 1, 1, 1,
-0.2593401, -0.7518669, -2.788032, 1, 1, 1, 1, 1,
-0.2590926, 0.7082075, -0.4147525, 1, 1, 1, 1, 1,
-0.2492908, -1.318779, -1.053696, 1, 1, 1, 1, 1,
-0.2447324, -0.7183973, -1.373911, 1, 1, 1, 1, 1,
-0.2443882, 1.07849, -0.70737, 0, 0, 1, 1, 1,
-0.243603, -0.1270561, -2.457132, 1, 0, 0, 1, 1,
-0.2412008, -0.8067029, -2.813972, 1, 0, 0, 1, 1,
-0.2381282, -0.06618836, -0.2970994, 1, 0, 0, 1, 1,
-0.2366876, -0.3238632, -1.497311, 1, 0, 0, 1, 1,
-0.2326643, -0.2431206, -3.981709, 1, 0, 0, 1, 1,
-0.2315064, -1.033494, -2.024917, 0, 0, 0, 1, 1,
-0.2294772, 0.4216282, 3.376631, 0, 0, 0, 1, 1,
-0.2235674, 1.337147, 0.07264072, 0, 0, 0, 1, 1,
-0.2202821, -1.594877, -2.872384, 0, 0, 0, 1, 1,
-0.218905, -0.4188122, -1.880004, 0, 0, 0, 1, 1,
-0.2186605, 1.284123, 1.603207, 0, 0, 0, 1, 1,
-0.2136748, -0.8431966, -2.66117, 0, 0, 0, 1, 1,
-0.2081559, -0.9589605, -1.936766, 1, 1, 1, 1, 1,
-0.2073344, -0.4280166, -1.749511, 1, 1, 1, 1, 1,
-0.2031668, -0.4678918, -3.446727, 1, 1, 1, 1, 1,
-0.1935299, -1.539314, -1.822478, 1, 1, 1, 1, 1,
-0.1929701, 0.5987541, -0.0316264, 1, 1, 1, 1, 1,
-0.1886089, 0.9251665, 0.5355637, 1, 1, 1, 1, 1,
-0.1848298, -1.177885, -3.608378, 1, 1, 1, 1, 1,
-0.1809543, -1.957546, -3.672538, 1, 1, 1, 1, 1,
-0.1800832, 0.3896463, -0.7315688, 1, 1, 1, 1, 1,
-0.1791432, -0.9337653, -2.422269, 1, 1, 1, 1, 1,
-0.1777261, -1.208155, -2.63572, 1, 1, 1, 1, 1,
-0.1755214, -0.3554194, -3.849943, 1, 1, 1, 1, 1,
-0.1733514, -2.032564, -2.726015, 1, 1, 1, 1, 1,
-0.1722266, 0.860293, -0.2442813, 1, 1, 1, 1, 1,
-0.1700268, -1.324904, -3.780609, 1, 1, 1, 1, 1,
-0.1689885, -0.7656072, -1.930619, 0, 0, 1, 1, 1,
-0.1670287, -0.467064, -3.590086, 1, 0, 0, 1, 1,
-0.1662347, -0.3690382, -2.927926, 1, 0, 0, 1, 1,
-0.1646896, -0.6259125, -2.640495, 1, 0, 0, 1, 1,
-0.1639793, -0.2541177, -2.817553, 1, 0, 0, 1, 1,
-0.1639491, -0.7811499, -2.864497, 1, 0, 0, 1, 1,
-0.1568583, -0.7477455, -3.62869, 0, 0, 0, 1, 1,
-0.1564588, 0.04406295, -1.038485, 0, 0, 0, 1, 1,
-0.1547691, 0.8935686, -1.850272, 0, 0, 0, 1, 1,
-0.1513914, 0.8083349, 1.930874, 0, 0, 0, 1, 1,
-0.1513652, 0.3472544, 0.2297044, 0, 0, 0, 1, 1,
-0.1491677, 0.3998558, -3.749312, 0, 0, 0, 1, 1,
-0.1476311, 1.321641, -1.632452, 0, 0, 0, 1, 1,
-0.1470915, -0.2935867, -1.691645, 1, 1, 1, 1, 1,
-0.1467951, 0.5682231, 1.186021, 1, 1, 1, 1, 1,
-0.1452769, -0.09664057, -2.309289, 1, 1, 1, 1, 1,
-0.1451407, -0.8136604, -4.320859, 1, 1, 1, 1, 1,
-0.1434555, -0.216721, -2.073995, 1, 1, 1, 1, 1,
-0.1423456, -0.8791644, -3.658423, 1, 1, 1, 1, 1,
-0.141827, -0.4019972, -3.303704, 1, 1, 1, 1, 1,
-0.132679, 0.3266678, 0.864347, 1, 1, 1, 1, 1,
-0.1326618, -1.069325, -3.467458, 1, 1, 1, 1, 1,
-0.1314775, -1.2208, -2.975522, 1, 1, 1, 1, 1,
-0.1287933, 0.3201437, 0.7414988, 1, 1, 1, 1, 1,
-0.1284501, 1.022468, -0.4635813, 1, 1, 1, 1, 1,
-0.1280073, 0.06911904, -0.4542815, 1, 1, 1, 1, 1,
-0.1269699, 0.5655586, -0.1354624, 1, 1, 1, 1, 1,
-0.1218836, 0.1779593, -2.130358, 1, 1, 1, 1, 1,
-0.1217908, -0.02193519, -0.4815929, 0, 0, 1, 1, 1,
-0.1195187, -0.3780843, -1.659167, 1, 0, 0, 1, 1,
-0.113831, -0.3825569, -2.348826, 1, 0, 0, 1, 1,
-0.1070481, 1.354885, 0.09614832, 1, 0, 0, 1, 1,
-0.1058235, 0.565259, -1.682363, 1, 0, 0, 1, 1,
-0.1026464, 0.3935017, -0.3510072, 1, 0, 0, 1, 1,
-0.1019943, 0.07849932, -0.3615535, 0, 0, 0, 1, 1,
-0.09994082, 0.4523199, 2.045002, 0, 0, 0, 1, 1,
-0.09719477, -0.5453013, -1.139073, 0, 0, 0, 1, 1,
-0.09552044, -0.267983, -0.3577569, 0, 0, 0, 1, 1,
-0.0889755, 1.768908, -1.099266, 0, 0, 0, 1, 1,
-0.08849005, 0.0387969, -0.3243357, 0, 0, 0, 1, 1,
-0.08617629, 0.7082415, -0.7287521, 0, 0, 0, 1, 1,
-0.08438192, 1.672177, -1.966016, 1, 1, 1, 1, 1,
-0.08313488, -1.610713, -2.39217, 1, 1, 1, 1, 1,
-0.07872512, -1.366422, -3.783716, 1, 1, 1, 1, 1,
-0.07647475, 0.02251808, -1.6099, 1, 1, 1, 1, 1,
-0.0750233, 1.165, 0.7644172, 1, 1, 1, 1, 1,
-0.07397866, 0.4826401, -0.8845208, 1, 1, 1, 1, 1,
-0.07244333, 0.6686633, 1.418151, 1, 1, 1, 1, 1,
-0.07104295, 0.3972865, -2.059046, 1, 1, 1, 1, 1,
-0.06841676, -3.119637, -3.721373, 1, 1, 1, 1, 1,
-0.06450281, -1.802153, -3.553123, 1, 1, 1, 1, 1,
-0.06374996, -1.111136, -3.031123, 1, 1, 1, 1, 1,
-0.06091452, -1.769043, 0.4850501, 1, 1, 1, 1, 1,
-0.05829326, 2.551936, 0.9760789, 1, 1, 1, 1, 1,
-0.05481688, 0.5244214, 0.540588, 1, 1, 1, 1, 1,
-0.05404375, 0.4846819, -1.074833, 1, 1, 1, 1, 1,
-0.05335024, 0.197441, -0.5972932, 0, 0, 1, 1, 1,
-0.05146208, 0.796963, 0.988951, 1, 0, 0, 1, 1,
-0.05011287, 0.08619335, -0.6712236, 1, 0, 0, 1, 1,
-0.04496504, 0.7180455, 0.9541913, 1, 0, 0, 1, 1,
-0.03914415, 0.105183, 0.8290765, 1, 0, 0, 1, 1,
-0.03756179, -1.521511, -2.240162, 1, 0, 0, 1, 1,
-0.0374104, 0.631471, -0.07098878, 0, 0, 0, 1, 1,
-0.03669824, -0.6055286, -3.555762, 0, 0, 0, 1, 1,
-0.03592472, -0.1976552, -3.536427, 0, 0, 0, 1, 1,
-0.03569748, 0.4260945, 0.2372928, 0, 0, 0, 1, 1,
-0.034256, -1.307449, -2.334561, 0, 0, 0, 1, 1,
-0.03341922, 1.385429, 0.2388694, 0, 0, 0, 1, 1,
-0.02762712, 1.701176, 0.1681687, 0, 0, 0, 1, 1,
-0.02726619, -0.3530589, -4.063579, 1, 1, 1, 1, 1,
-0.02521563, -0.6132077, -2.855812, 1, 1, 1, 1, 1,
-0.01793138, 0.3314679, 0.6044666, 1, 1, 1, 1, 1,
-0.01730823, 2.070534, -0.6862255, 1, 1, 1, 1, 1,
-0.01560757, -0.8470599, -4.517528, 1, 1, 1, 1, 1,
-0.01198725, 0.06602896, -0.9584701, 1, 1, 1, 1, 1,
-0.009086466, 1.454868, -0.8946582, 1, 1, 1, 1, 1,
-0.007933611, 1.486529, -1.137326, 1, 1, 1, 1, 1,
-0.007907231, 1.036914, 0.535, 1, 1, 1, 1, 1,
-0.004608382, -0.6019689, -0.9708685, 1, 1, 1, 1, 1,
-0.003270108, 1.928598, 0.4309415, 1, 1, 1, 1, 1,
-0.001422355, -0.4208151, -0.9892889, 1, 1, 1, 1, 1,
0.002963676, -0.6743263, 2.891027, 1, 1, 1, 1, 1,
0.004486038, -0.8129535, 1.896266, 1, 1, 1, 1, 1,
0.007007477, -0.7579323, 3.436463, 1, 1, 1, 1, 1,
0.008487796, 0.7420225, 1.316472, 0, 0, 1, 1, 1,
0.01160366, 0.09702293, -0.2781822, 1, 0, 0, 1, 1,
0.01888228, 1.168982, 0.5594237, 1, 0, 0, 1, 1,
0.02175192, -0.02215508, 2.687903, 1, 0, 0, 1, 1,
0.02227396, -0.6629224, 3.564593, 1, 0, 0, 1, 1,
0.02727253, -0.163551, 1.534188, 1, 0, 0, 1, 1,
0.02758496, 0.2788142, 0.1002506, 0, 0, 0, 1, 1,
0.0305853, -0.6549044, 3.508913, 0, 0, 0, 1, 1,
0.03103421, 0.6036821, 0.4578101, 0, 0, 0, 1, 1,
0.0318863, 0.3284999, 2.397222, 0, 0, 0, 1, 1,
0.03268031, -0.3178585, 1.127565, 0, 0, 0, 1, 1,
0.03690537, 2.001148, -0.03223842, 0, 0, 0, 1, 1,
0.03989539, -0.07553615, 2.357981, 0, 0, 0, 1, 1,
0.04155799, 0.70652, 0.6681218, 1, 1, 1, 1, 1,
0.04432412, -1.199314, 1.17486, 1, 1, 1, 1, 1,
0.05001992, 1.154788, -0.4982781, 1, 1, 1, 1, 1,
0.06780072, -1.744469, 2.945221, 1, 1, 1, 1, 1,
0.06856637, 0.2960187, 0.8958844, 1, 1, 1, 1, 1,
0.07089259, -0.1962513, 1.111172, 1, 1, 1, 1, 1,
0.07532658, 0.660702, 1.074825, 1, 1, 1, 1, 1,
0.07654285, 0.8322136, 0.4789609, 1, 1, 1, 1, 1,
0.08255734, 0.1820212, 1.496924, 1, 1, 1, 1, 1,
0.08367596, 0.4901429, 0.9288415, 1, 1, 1, 1, 1,
0.08503988, 1.154224, -0.2539693, 1, 1, 1, 1, 1,
0.08608209, -1.668738, 3.175679, 1, 1, 1, 1, 1,
0.08749346, 1.94165, -0.1807094, 1, 1, 1, 1, 1,
0.08944985, 0.2886383, 0.3554935, 1, 1, 1, 1, 1,
0.09092406, 0.2757622, -0.754481, 1, 1, 1, 1, 1,
0.09477206, 0.009850988, 1.549459, 0, 0, 1, 1, 1,
0.09512659, 0.7221777, 0.4619464, 1, 0, 0, 1, 1,
0.09622145, -1.128527, 1.441478, 1, 0, 0, 1, 1,
0.1055385, 1.162259, 0.7492892, 1, 0, 0, 1, 1,
0.1067191, 1.701167, -0.2152625, 1, 0, 0, 1, 1,
0.1166351, 0.0899561, 0.7735477, 1, 0, 0, 1, 1,
0.1200206, -0.936509, 2.418986, 0, 0, 0, 1, 1,
0.1223008, 0.6743881, 0.6181444, 0, 0, 0, 1, 1,
0.122754, 0.4083629, -1.278578, 0, 0, 0, 1, 1,
0.1267574, 2.618018, 0.5078847, 0, 0, 0, 1, 1,
0.1284983, 0.8596046, -0.2683117, 0, 0, 0, 1, 1,
0.135568, 1.380447, -0.1225922, 0, 0, 0, 1, 1,
0.1369668, 1.035479, 1.8221, 0, 0, 0, 1, 1,
0.1376256, 1.076797, 0.2765599, 1, 1, 1, 1, 1,
0.1421965, -1.071497, 3.631288, 1, 1, 1, 1, 1,
0.1456336, 0.8778843, -1.492819, 1, 1, 1, 1, 1,
0.1483069, 1.750472, 0.6757714, 1, 1, 1, 1, 1,
0.1483828, 0.1289322, 3.655257, 1, 1, 1, 1, 1,
0.1486333, -1.446764, 3.321154, 1, 1, 1, 1, 1,
0.1508822, 0.4228134, 1.837336, 1, 1, 1, 1, 1,
0.1521029, 0.2020005, 0.7767966, 1, 1, 1, 1, 1,
0.1529616, -1.113447, 3.117875, 1, 1, 1, 1, 1,
0.1533133, -2.77472, 2.768564, 1, 1, 1, 1, 1,
0.1561138, -0.3467484, 1.186376, 1, 1, 1, 1, 1,
0.1570282, 0.2011987, 0.67953, 1, 1, 1, 1, 1,
0.1600493, -1.568986, 3.136341, 1, 1, 1, 1, 1,
0.1668183, -0.5725946, 2.795986, 1, 1, 1, 1, 1,
0.1697637, 0.5702569, -1.191387, 1, 1, 1, 1, 1,
0.1771807, -2.765069, 2.76154, 0, 0, 1, 1, 1,
0.1792208, 0.1821501, 1.984557, 1, 0, 0, 1, 1,
0.18054, -1.424673, 4.135918, 1, 0, 0, 1, 1,
0.1805752, 0.2685904, 0.592531, 1, 0, 0, 1, 1,
0.1811595, -1.533776, 3.625501, 1, 0, 0, 1, 1,
0.1824564, 1.14119, -0.1891758, 1, 0, 0, 1, 1,
0.1842448, -0.342315, 2.686495, 0, 0, 0, 1, 1,
0.1926049, -0.1297393, 2.737245, 0, 0, 0, 1, 1,
0.1940157, -0.5519713, 2.697281, 0, 0, 0, 1, 1,
0.1986615, 1.458498, 0.1206215, 0, 0, 0, 1, 1,
0.1997666, 0.007040799, 1.351386, 0, 0, 0, 1, 1,
0.2026454, -0.480983, 3.491953, 0, 0, 0, 1, 1,
0.2183585, -1.618717, 3.354932, 0, 0, 0, 1, 1,
0.2197908, -0.3207928, 1.00693, 1, 1, 1, 1, 1,
0.2230349, -1.609705, 2.221941, 1, 1, 1, 1, 1,
0.2252972, -0.2173437, 3.021139, 1, 1, 1, 1, 1,
0.2263927, -0.0913322, 0.5499496, 1, 1, 1, 1, 1,
0.2301035, 0.1239635, 2.824401, 1, 1, 1, 1, 1,
0.2310366, -1.4987, 2.454564, 1, 1, 1, 1, 1,
0.231057, -0.4539873, 3.080704, 1, 1, 1, 1, 1,
0.2321664, 1.474764, -0.6431904, 1, 1, 1, 1, 1,
0.2324848, 0.2090351, 1.965031, 1, 1, 1, 1, 1,
0.2336582, 1.352997, -0.8217328, 1, 1, 1, 1, 1,
0.235198, -0.927276, 2.627715, 1, 1, 1, 1, 1,
0.2363584, 0.2245848, 0.8542781, 1, 1, 1, 1, 1,
0.2376513, -0.499245, 5.275086, 1, 1, 1, 1, 1,
0.2519989, 0.9542507, -1.05577, 1, 1, 1, 1, 1,
0.2522329, 0.08306143, 1.641276, 1, 1, 1, 1, 1,
0.2548013, 2.847241, -0.969889, 0, 0, 1, 1, 1,
0.2571529, -1.346908, 4.00456, 1, 0, 0, 1, 1,
0.2587142, 1.136578, -1.37773, 1, 0, 0, 1, 1,
0.2604647, -0.2840095, 3.120818, 1, 0, 0, 1, 1,
0.2681926, -0.08129909, 2.54598, 1, 0, 0, 1, 1,
0.270377, -2.130219, 3.098862, 1, 0, 0, 1, 1,
0.2798218, 1.12342, 0.1173142, 0, 0, 0, 1, 1,
0.2801697, 0.9315829, 0.8958004, 0, 0, 0, 1, 1,
0.284521, -0.3097789, 4.127175, 0, 0, 0, 1, 1,
0.2934356, -0.02898608, 2.502292, 0, 0, 0, 1, 1,
0.2951963, -0.1044343, 2.092308, 0, 0, 0, 1, 1,
0.2967271, 1.241615, 0.1524891, 0, 0, 0, 1, 1,
0.2980227, 0.7862399, 0.4103819, 0, 0, 0, 1, 1,
0.2995475, -0.3056876, 2.637836, 1, 1, 1, 1, 1,
0.3033223, 0.2646299, 1.672335, 1, 1, 1, 1, 1,
0.3053673, -1.229492, 3.848896, 1, 1, 1, 1, 1,
0.3055629, 0.8201165, 1.116064, 1, 1, 1, 1, 1,
0.3122135, -1.416198, 3.332573, 1, 1, 1, 1, 1,
0.3146723, 0.2226109, 0.7414869, 1, 1, 1, 1, 1,
0.3155222, -1.115466, 2.345958, 1, 1, 1, 1, 1,
0.3155692, 0.5069844, 1.34731, 1, 1, 1, 1, 1,
0.3163631, 0.245486, 1.168915, 1, 1, 1, 1, 1,
0.3199315, 0.006027194, 0.8961486, 1, 1, 1, 1, 1,
0.3203641, -0.9474906, 3.404337, 1, 1, 1, 1, 1,
0.3218736, -1.109725, 1.926316, 1, 1, 1, 1, 1,
0.3230855, 1.551469, 1.521951, 1, 1, 1, 1, 1,
0.3258981, 0.1819642, 2.128869, 1, 1, 1, 1, 1,
0.3351932, -0.2027029, 2.51024, 1, 1, 1, 1, 1,
0.336998, 0.1694988, 0.05218101, 0, 0, 1, 1, 1,
0.3377124, 0.8748245, 0.2477889, 1, 0, 0, 1, 1,
0.3400372, -0.3738832, 3.628622, 1, 0, 0, 1, 1,
0.3449483, -1.02686, 1.488536, 1, 0, 0, 1, 1,
0.3452272, 0.4789589, 1.282735, 1, 0, 0, 1, 1,
0.34558, -1.376839, 2.955842, 1, 0, 0, 1, 1,
0.345685, 0.5457221, -0.3268907, 0, 0, 0, 1, 1,
0.3500134, 1.005022, -0.3819377, 0, 0, 0, 1, 1,
0.3510899, -1.875875, 3.803961, 0, 0, 0, 1, 1,
0.3533597, -0.09606154, 2.403618, 0, 0, 0, 1, 1,
0.3585991, 0.9582873, 1.242436, 0, 0, 0, 1, 1,
0.3609077, 1.242762, -0.6556011, 0, 0, 0, 1, 1,
0.3617523, 0.2559188, 2.394876, 0, 0, 0, 1, 1,
0.3644789, -1.015848, 2.953956, 1, 1, 1, 1, 1,
0.3725288, -1.548516, 2.065154, 1, 1, 1, 1, 1,
0.3754442, -0.5228766, 2.167678, 1, 1, 1, 1, 1,
0.3774226, 2.670708, 0.266704, 1, 1, 1, 1, 1,
0.3868818, -1.150502, 1.692147, 1, 1, 1, 1, 1,
0.3961074, -0.399631, 1.224111, 1, 1, 1, 1, 1,
0.3968006, 0.8506441, 1.500261, 1, 1, 1, 1, 1,
0.396862, 1.200093, 0.6950529, 1, 1, 1, 1, 1,
0.407362, -1.695445, 2.347565, 1, 1, 1, 1, 1,
0.4091161, -0.7279781, 3.819129, 1, 1, 1, 1, 1,
0.409624, -0.03193412, 0.8668485, 1, 1, 1, 1, 1,
0.4106912, -0.4477168, 2.786141, 1, 1, 1, 1, 1,
0.4136125, 2.155641, 0.1324058, 1, 1, 1, 1, 1,
0.4157295, 0.4136269, 0.982124, 1, 1, 1, 1, 1,
0.4180818, -0.1664664, 0.5512287, 1, 1, 1, 1, 1,
0.4185651, 0.331702, 0.2788481, 0, 0, 1, 1, 1,
0.4194089, -0.1238965, 1.529975, 1, 0, 0, 1, 1,
0.4211918, 1.136992, 1.418826, 1, 0, 0, 1, 1,
0.424163, -0.4783075, 2.602278, 1, 0, 0, 1, 1,
0.4286711, 0.04943553, 0.6984059, 1, 0, 0, 1, 1,
0.4299165, -0.01321976, 1.709389, 1, 0, 0, 1, 1,
0.4339927, 0.9996616, 0.247666, 0, 0, 0, 1, 1,
0.4342934, 0.198585, 1.994085, 0, 0, 0, 1, 1,
0.4348894, -1.917219, 4.624942, 0, 0, 0, 1, 1,
0.4460013, -0.8823177, 3.765144, 0, 0, 0, 1, 1,
0.4461746, -1.909472, 4.312789, 0, 0, 0, 1, 1,
0.4509057, 1.180938, 0.1670917, 0, 0, 0, 1, 1,
0.4533799, 2.409048, -0.7677545, 0, 0, 0, 1, 1,
0.4553923, 1.199359, -0.0906856, 1, 1, 1, 1, 1,
0.4568154, 0.2875791, 1.247659, 1, 1, 1, 1, 1,
0.4568656, -0.5058913, 1.893838, 1, 1, 1, 1, 1,
0.460071, 0.9002333, -0.2611521, 1, 1, 1, 1, 1,
0.4603156, 0.4397148, 0.1374724, 1, 1, 1, 1, 1,
0.4604777, 0.4675099, 1.369516, 1, 1, 1, 1, 1,
0.4623179, 0.1434415, 0.9698377, 1, 1, 1, 1, 1,
0.4641572, -0.2081549, 1.799875, 1, 1, 1, 1, 1,
0.4661952, 0.7671555, 0.3255787, 1, 1, 1, 1, 1,
0.4664445, -1.265947, 4.339718, 1, 1, 1, 1, 1,
0.4716832, -1.430184, 4.114882, 1, 1, 1, 1, 1,
0.4739749, 0.6535005, 1.878001, 1, 1, 1, 1, 1,
0.4755024, 0.4882334, 2.368932, 1, 1, 1, 1, 1,
0.4832104, -0.7852083, 2.49111, 1, 1, 1, 1, 1,
0.4834033, 1.255628, -0.1166516, 1, 1, 1, 1, 1,
0.4847092, 1.213503, -0.5432745, 0, 0, 1, 1, 1,
0.4856999, 0.1524469, 2.511746, 1, 0, 0, 1, 1,
0.4925939, -1.1965, 2.890267, 1, 0, 0, 1, 1,
0.4947579, -0.5730088, 1.185078, 1, 0, 0, 1, 1,
0.5129466, 0.3858281, 2.141784, 1, 0, 0, 1, 1,
0.5141772, 0.8567948, -0.4447649, 1, 0, 0, 1, 1,
0.5147755, -0.4798214, 0.6342357, 0, 0, 0, 1, 1,
0.5193601, -1.171671, 1.395504, 0, 0, 0, 1, 1,
0.5268519, 0.7237778, 1.171852, 0, 0, 0, 1, 1,
0.5268747, 1.291981, 0.9097586, 0, 0, 0, 1, 1,
0.528407, 0.9157881, 0.7421148, 0, 0, 0, 1, 1,
0.529673, 0.4357122, -0.4465468, 0, 0, 0, 1, 1,
0.530669, -1.070084, 1.603188, 0, 0, 0, 1, 1,
0.5325894, 1.448041, 0.6692718, 1, 1, 1, 1, 1,
0.5326408, -0.4809007, 1.713701, 1, 1, 1, 1, 1,
0.5349004, 0.3626122, 1.271036, 1, 1, 1, 1, 1,
0.5431785, -0.5451186, 2.78375, 1, 1, 1, 1, 1,
0.5442039, -0.1328275, 3.451742, 1, 1, 1, 1, 1,
0.5460382, -0.3598152, 2.425569, 1, 1, 1, 1, 1,
0.5476534, -0.2520397, 4.766443, 1, 1, 1, 1, 1,
0.5495595, 0.3952881, 1.511814, 1, 1, 1, 1, 1,
0.5527364, -0.3921028, 4.719799, 1, 1, 1, 1, 1,
0.5539038, -1.158994, 3.789963, 1, 1, 1, 1, 1,
0.5682427, -0.6677585, 1.436233, 1, 1, 1, 1, 1,
0.5684244, -0.9905125, 2.221277, 1, 1, 1, 1, 1,
0.5737499, 0.9474773, 1.49823, 1, 1, 1, 1, 1,
0.5807002, 0.9262236, 0.8459913, 1, 1, 1, 1, 1,
0.5893285, 0.5844894, 2.592456, 1, 1, 1, 1, 1,
0.5908132, 0.4253034, 0.7364727, 0, 0, 1, 1, 1,
0.5942001, 0.4948287, 1.033101, 1, 0, 0, 1, 1,
0.5944604, 0.5523745, 2.134844, 1, 0, 0, 1, 1,
0.5992803, -1.340553, 0.7386022, 1, 0, 0, 1, 1,
0.6029946, -0.02380977, 0.8869287, 1, 0, 0, 1, 1,
0.6035839, -0.2563584, 1.70516, 1, 0, 0, 1, 1,
0.6045087, 0.0110587, 1.553288, 0, 0, 0, 1, 1,
0.6066118, -0.9373036, 3.128204, 0, 0, 0, 1, 1,
0.6067286, 0.5227513, 0.03097176, 0, 0, 0, 1, 1,
0.6090268, 0.1059863, 1.301632, 0, 0, 0, 1, 1,
0.6135812, 0.5683144, 0.5294441, 0, 0, 0, 1, 1,
0.614065, -0.5905065, 0.7892069, 0, 0, 0, 1, 1,
0.6149904, -0.8889799, 1.893105, 0, 0, 0, 1, 1,
0.6165302, 0.8315079, 1.873746, 1, 1, 1, 1, 1,
0.6230544, 1.621522, -0.1694412, 1, 1, 1, 1, 1,
0.6363056, -0.6530624, 1.832675, 1, 1, 1, 1, 1,
0.6389448, -0.8094028, 1.146553, 1, 1, 1, 1, 1,
0.63933, -0.7597701, 2.447038, 1, 1, 1, 1, 1,
0.6399246, 0.0937121, 1.156565, 1, 1, 1, 1, 1,
0.6422978, -0.6890733, 2.979405, 1, 1, 1, 1, 1,
0.6423684, 1.964492, -0.4857253, 1, 1, 1, 1, 1,
0.6462649, 0.3562398, 0.8115194, 1, 1, 1, 1, 1,
0.6484247, 0.7421647, -0.6137478, 1, 1, 1, 1, 1,
0.6493971, -2.328013, 0.1600455, 1, 1, 1, 1, 1,
0.6557927, -1.733709, 3.752648, 1, 1, 1, 1, 1,
0.6580495, 0.1252663, 1.03896, 1, 1, 1, 1, 1,
0.6602779, -0.2535994, 1.904227, 1, 1, 1, 1, 1,
0.6629114, -0.8084602, 3.332972, 1, 1, 1, 1, 1,
0.6653023, 0.04439486, 2.205169, 0, 0, 1, 1, 1,
0.666564, -1.595461, 3.837049, 1, 0, 0, 1, 1,
0.6707358, -0.9699253, 3.678257, 1, 0, 0, 1, 1,
0.6790307, -0.2132308, 2.246876, 1, 0, 0, 1, 1,
0.6811276, 0.7236356, 0.8068005, 1, 0, 0, 1, 1,
0.6849456, 1.380977, -2.161992, 1, 0, 0, 1, 1,
0.6856147, 0.3601688, 2.573072, 0, 0, 0, 1, 1,
0.6876148, 0.3086551, 0.2018234, 0, 0, 0, 1, 1,
0.6904183, -0.1688081, 2.025017, 0, 0, 0, 1, 1,
0.6943071, -0.4064119, 1.484374, 0, 0, 0, 1, 1,
0.6952747, 0.8343751, 0.1927448, 0, 0, 0, 1, 1,
0.7000722, 0.1109359, 2.174588, 0, 0, 0, 1, 1,
0.7022405, -0.4579928, 1.565846, 0, 0, 0, 1, 1,
0.7032802, -0.5269481, 2.576938, 1, 1, 1, 1, 1,
0.7036023, 1.966933, 0.564647, 1, 1, 1, 1, 1,
0.7056196, -0.2371482, -0.8316374, 1, 1, 1, 1, 1,
0.7120655, -1.039933, 2.755301, 1, 1, 1, 1, 1,
0.7195551, -1.976747, 1.587423, 1, 1, 1, 1, 1,
0.7199582, -1.589879, 1.899166, 1, 1, 1, 1, 1,
0.7227197, -0.3538466, 0.1332272, 1, 1, 1, 1, 1,
0.7237448, -0.07658692, 0.1657796, 1, 1, 1, 1, 1,
0.7278662, -0.2815036, 0.1491987, 1, 1, 1, 1, 1,
0.7300473, -0.2867056, 1.927595, 1, 1, 1, 1, 1,
0.7316623, 1.109453, 2.134223, 1, 1, 1, 1, 1,
0.7374454, 0.5563707, 1.005918, 1, 1, 1, 1, 1,
0.7392541, 0.2612005, 1.946167, 1, 1, 1, 1, 1,
0.7393118, 0.3663126, 1.406248, 1, 1, 1, 1, 1,
0.7402825, 1.095334, 0.129406, 1, 1, 1, 1, 1,
0.7443101, -1.443784, 3.09836, 0, 0, 1, 1, 1,
0.7444953, 1.415042, -0.02259759, 1, 0, 0, 1, 1,
0.7525306, 0.1938433, 2.187019, 1, 0, 0, 1, 1,
0.7547969, 0.8337291, 1.018685, 1, 0, 0, 1, 1,
0.7559926, -2.606807, 4.437187, 1, 0, 0, 1, 1,
0.7563964, -1.390068, 4.245773, 1, 0, 0, 1, 1,
0.7647029, 0.744157, 0.3642268, 0, 0, 0, 1, 1,
0.7647917, -0.05377657, 1.015409, 0, 0, 0, 1, 1,
0.7740677, 0.6052082, 0.4325979, 0, 0, 0, 1, 1,
0.7746142, 1.46128, -0.08485705, 0, 0, 0, 1, 1,
0.7766544, 0.5434428, -1.130108, 0, 0, 0, 1, 1,
0.7771089, -0.06303494, 1.450566, 0, 0, 0, 1, 1,
0.7836989, 0.9487783, 1.421374, 0, 0, 0, 1, 1,
0.7841687, -0.6598282, 2.957008, 1, 1, 1, 1, 1,
0.7902507, 0.5658635, 0.6252856, 1, 1, 1, 1, 1,
0.7909693, -1.613999, 2.562523, 1, 1, 1, 1, 1,
0.7931329, 1.793283, 0.4793801, 1, 1, 1, 1, 1,
0.7933093, -0.5830811, 2.099966, 1, 1, 1, 1, 1,
0.7936721, -0.7139073, 1.096579, 1, 1, 1, 1, 1,
0.7960349, 0.8048748, 0.7200744, 1, 1, 1, 1, 1,
0.7976395, -1.278502, 0.6936303, 1, 1, 1, 1, 1,
0.8001262, -0.5361371, 1.728641, 1, 1, 1, 1, 1,
0.8080307, -0.8377681, 2.7749, 1, 1, 1, 1, 1,
0.8093004, 0.9602431, 0.8947534, 1, 1, 1, 1, 1,
0.8121328, -0.6868268, 3.153066, 1, 1, 1, 1, 1,
0.8205397, 0.2127315, 1.163288, 1, 1, 1, 1, 1,
0.831325, 1.669783, 2.473231, 1, 1, 1, 1, 1,
0.8326626, 0.01624571, 1.648486, 1, 1, 1, 1, 1,
0.8340514, -1.11259, 1.625565, 0, 0, 1, 1, 1,
0.8351058, -1.532696, 0.8271425, 1, 0, 0, 1, 1,
0.8380275, 0.533011, 1.190165, 1, 0, 0, 1, 1,
0.8394123, -0.6950866, 1.560398, 1, 0, 0, 1, 1,
0.8424292, 0.5906952, 0.1947539, 1, 0, 0, 1, 1,
0.8426219, -0.510269, 1.73096, 1, 0, 0, 1, 1,
0.8438573, 1.561173, 0.1174398, 0, 0, 0, 1, 1,
0.8488142, -1.484812, 3.308182, 0, 0, 0, 1, 1,
0.8510264, 1.363815, 1.482155, 0, 0, 0, 1, 1,
0.8555028, -1.073276, 1.378632, 0, 0, 0, 1, 1,
0.8589746, 0.5524929, 0.7367327, 0, 0, 0, 1, 1,
0.8591927, -0.2634421, 1.904915, 0, 0, 0, 1, 1,
0.865464, 2.038864, 1.788217, 0, 0, 0, 1, 1,
0.8662379, -0.1742919, 3.075625, 1, 1, 1, 1, 1,
0.8666607, -0.0762677, 2.585885, 1, 1, 1, 1, 1,
0.8696327, -0.6222585, 1.166025, 1, 1, 1, 1, 1,
0.8754117, 1.141691, -0.3074036, 1, 1, 1, 1, 1,
0.8758637, -0.4742799, 1.157407, 1, 1, 1, 1, 1,
0.8945463, -0.5795781, 0.7951565, 1, 1, 1, 1, 1,
0.9014622, -0.4161535, 1.888008, 1, 1, 1, 1, 1,
0.9053287, -0.04972165, 0.1925016, 1, 1, 1, 1, 1,
0.9089938, -1.260879, 0.9235961, 1, 1, 1, 1, 1,
0.919651, -1.227722, 3.341467, 1, 1, 1, 1, 1,
0.9204105, -1.392607, 1.626503, 1, 1, 1, 1, 1,
0.9210456, 0.2445463, 2.971558, 1, 1, 1, 1, 1,
0.9226736, 0.8714859, -0.2969797, 1, 1, 1, 1, 1,
0.9240119, 0.5482369, 0.2115869, 1, 1, 1, 1, 1,
0.9282207, 0.3550489, 0.04122578, 1, 1, 1, 1, 1,
0.9352378, -0.3045011, 1.077881, 0, 0, 1, 1, 1,
0.9412231, 0.4917225, 2.1906, 1, 0, 0, 1, 1,
0.9480221, -0.3902884, 0.3854133, 1, 0, 0, 1, 1,
0.9547008, 0.3067378, 1.06587, 1, 0, 0, 1, 1,
0.9560674, 0.7026949, 1.438566, 1, 0, 0, 1, 1,
0.9586691, -0.5809291, 0.8915088, 1, 0, 0, 1, 1,
0.9600406, 0.5950189, 1.900053, 0, 0, 0, 1, 1,
0.9670749, 0.576447, 1.665946, 0, 0, 0, 1, 1,
0.9673989, 1.158136, 2.275829, 0, 0, 0, 1, 1,
0.9674876, 1.549003, -1.167898, 0, 0, 0, 1, 1,
0.9679851, 0.8459442, 0.540244, 0, 0, 0, 1, 1,
0.9745443, 0.3063955, 0.3489944, 0, 0, 0, 1, 1,
0.980747, 0.3720167, 1.785416, 0, 0, 0, 1, 1,
0.9821974, 0.2814285, 2.557179, 1, 1, 1, 1, 1,
0.982623, -0.8856839, 2.092968, 1, 1, 1, 1, 1,
0.9859554, 1.320268, 0.2281443, 1, 1, 1, 1, 1,
0.9932373, -0.1064363, 0.8779379, 1, 1, 1, 1, 1,
0.9964525, -0.7467561, 3.167957, 1, 1, 1, 1, 1,
1.005986, -0.4416091, 1.284683, 1, 1, 1, 1, 1,
1.010016, -0.3509843, 4.194615, 1, 1, 1, 1, 1,
1.021029, -0.7763572, 3.189255, 1, 1, 1, 1, 1,
1.032751, 1.119824, 0.8690624, 1, 1, 1, 1, 1,
1.033624, -1.385223, 2.263809, 1, 1, 1, 1, 1,
1.036607, 0.1825906, 1.325654, 1, 1, 1, 1, 1,
1.046447, -0.713819, 2.026472, 1, 1, 1, 1, 1,
1.051666, 0.2173404, 0.1870363, 1, 1, 1, 1, 1,
1.067937, -1.362318, -1.158424, 1, 1, 1, 1, 1,
1.070929, -0.4138517, 2.066803, 1, 1, 1, 1, 1,
1.071036, 1.08018, 2.601726, 0, 0, 1, 1, 1,
1.071175, 0.09069201, -0.103812, 1, 0, 0, 1, 1,
1.07496, 0.7580068, 1.229036, 1, 0, 0, 1, 1,
1.078533, 0.4492322, 2.201025, 1, 0, 0, 1, 1,
1.090915, 0.397469, 1.825119, 1, 0, 0, 1, 1,
1.092179, -0.9518463, 3.524161, 1, 0, 0, 1, 1,
1.092707, 0.08114864, 0.05052982, 0, 0, 0, 1, 1,
1.093243, 1.637705, -0.3414322, 0, 0, 0, 1, 1,
1.098189, 1.022345, 0.4036212, 0, 0, 0, 1, 1,
1.098847, -0.1240167, 0.8438563, 0, 0, 0, 1, 1,
1.100412, 1.136644, 0.09503759, 0, 0, 0, 1, 1,
1.118447, -0.06886256, 1.332955, 0, 0, 0, 1, 1,
1.119284, -0.8201911, 1.74237, 0, 0, 0, 1, 1,
1.12157, 0.5183054, 0.6640027, 1, 1, 1, 1, 1,
1.125159, -1.185187, 1.650464, 1, 1, 1, 1, 1,
1.125866, -0.0187857, 2.483856, 1, 1, 1, 1, 1,
1.134204, -1.598248, 2.123557, 1, 1, 1, 1, 1,
1.145243, 1.059785, 1.05638, 1, 1, 1, 1, 1,
1.145916, 0.491901, 0.04643936, 1, 1, 1, 1, 1,
1.146245, -1.205038, 3.825053, 1, 1, 1, 1, 1,
1.149638, -1.081469, 2.885865, 1, 1, 1, 1, 1,
1.15279, 0.3142769, 1.481264, 1, 1, 1, 1, 1,
1.159947, -1.361727, 2.737518, 1, 1, 1, 1, 1,
1.160456, 1.560829, 0.5383579, 1, 1, 1, 1, 1,
1.161554, -0.02898402, 1.94124, 1, 1, 1, 1, 1,
1.16614, -0.7523969, 2.045769, 1, 1, 1, 1, 1,
1.173552, 0.7028095, 0.6839516, 1, 1, 1, 1, 1,
1.176209, 0.1413499, 0.150931, 1, 1, 1, 1, 1,
1.179967, -0.4205888, 1.493059, 0, 0, 1, 1, 1,
1.18124, 0.3684306, 4.36877, 1, 0, 0, 1, 1,
1.187011, -0.8749192, 1.755306, 1, 0, 0, 1, 1,
1.189185, -0.4002606, 1.790222, 1, 0, 0, 1, 1,
1.19959, 0.6307057, -0.3619242, 1, 0, 0, 1, 1,
1.206194, 0.4143315, 2.710324, 1, 0, 0, 1, 1,
1.208853, -1.342646, 3.20021, 0, 0, 0, 1, 1,
1.211632, 0.5794815, 1.902256, 0, 0, 0, 1, 1,
1.215552, 1.37085, 0.4435808, 0, 0, 0, 1, 1,
1.218307, -0.3755353, 2.16418, 0, 0, 0, 1, 1,
1.224229, -0.5163202, 1.542187, 0, 0, 0, 1, 1,
1.23096, 1.63844, 1.175629, 0, 0, 0, 1, 1,
1.255284, -0.4527017, 2.228402, 0, 0, 0, 1, 1,
1.260228, 0.1203587, 1.872293, 1, 1, 1, 1, 1,
1.267285, -0.05174263, 0.6225655, 1, 1, 1, 1, 1,
1.267698, -2.273269, 5.050192, 1, 1, 1, 1, 1,
1.268567, -1.064969, 2.149392, 1, 1, 1, 1, 1,
1.271615, 0.7760112, 0.03720863, 1, 1, 1, 1, 1,
1.284271, 0.1418098, -0.9512421, 1, 1, 1, 1, 1,
1.286993, -0.4041736, 2.120429, 1, 1, 1, 1, 1,
1.298592, 2.227896, 0.5349725, 1, 1, 1, 1, 1,
1.300712, 0.1821854, 0.4673716, 1, 1, 1, 1, 1,
1.305966, -0.8463035, -0.3917288, 1, 1, 1, 1, 1,
1.306712, -0.57869, 1.272593, 1, 1, 1, 1, 1,
1.314201, -0.4795078, 1.327462, 1, 1, 1, 1, 1,
1.318889, 0.1170765, 1.943988, 1, 1, 1, 1, 1,
1.318898, -0.239099, 1.703174, 1, 1, 1, 1, 1,
1.321203, 1.964865, 2.377216, 1, 1, 1, 1, 1,
1.324841, -1.906068, 3.551382, 0, 0, 1, 1, 1,
1.338967, -1.383946, 1.348763, 1, 0, 0, 1, 1,
1.340153, -2.038276, 2.483153, 1, 0, 0, 1, 1,
1.346959, -0.4368849, 0.6134576, 1, 0, 0, 1, 1,
1.349179, 1.453275, 0.08281442, 1, 0, 0, 1, 1,
1.350695, 0.1386645, 1.295344, 1, 0, 0, 1, 1,
1.350737, 0.7297023, 0.8765222, 0, 0, 0, 1, 1,
1.366815, 0.4489593, 0.3445825, 0, 0, 0, 1, 1,
1.368214, 1.036875, -0.03217504, 0, 0, 0, 1, 1,
1.368333, -0.2086439, 2.401002, 0, 0, 0, 1, 1,
1.384106, 1.35832, -0.1828363, 0, 0, 0, 1, 1,
1.388278, -0.08824389, 2.109088, 0, 0, 0, 1, 1,
1.395602, 0.15966, 0.7351124, 0, 0, 0, 1, 1,
1.397281, 0.9919511, 0.4650102, 1, 1, 1, 1, 1,
1.399102, -0.253915, 0.5047155, 1, 1, 1, 1, 1,
1.399915, -1.428237, 2.589638, 1, 1, 1, 1, 1,
1.401468, 0.7888251, 1.887944, 1, 1, 1, 1, 1,
1.404308, 0.6185824, 1.066036, 1, 1, 1, 1, 1,
1.407351, 0.155675, -1.189418, 1, 1, 1, 1, 1,
1.407722, -1.241541, 2.327386, 1, 1, 1, 1, 1,
1.422147, 0.8523574, 0.2410617, 1, 1, 1, 1, 1,
1.434859, 1.264552, 0.1663986, 1, 1, 1, 1, 1,
1.438562, 0.6245067, 1.24112, 1, 1, 1, 1, 1,
1.44637, 0.7520488, 2.439673, 1, 1, 1, 1, 1,
1.450838, -0.5986066, 2.005552, 1, 1, 1, 1, 1,
1.454512, -0.8177425, 3.821834, 1, 1, 1, 1, 1,
1.455331, 0.8324259, -0.1513524, 1, 1, 1, 1, 1,
1.467752, 0.4958937, 1.348182, 1, 1, 1, 1, 1,
1.468693, 1.069943, 1.945964, 0, 0, 1, 1, 1,
1.472044, -0.8885641, 2.816703, 1, 0, 0, 1, 1,
1.473139, -0.2798505, 0.5242251, 1, 0, 0, 1, 1,
1.474643, -0.9332416, 1.690516, 1, 0, 0, 1, 1,
1.481427, 0.4979597, 0.2098279, 1, 0, 0, 1, 1,
1.487081, 0.1958673, 1.34644, 1, 0, 0, 1, 1,
1.487336, 2.091623, 1.250657, 0, 0, 0, 1, 1,
1.489276, 0.4616882, -0.2517969, 0, 0, 0, 1, 1,
1.502921, -0.5078783, 3.141629, 0, 0, 0, 1, 1,
1.511902, 0.2651553, 1.982655, 0, 0, 0, 1, 1,
1.516474, 0.2214704, 2.094235, 0, 0, 0, 1, 1,
1.52758, -0.2046905, 1.836827, 0, 0, 0, 1, 1,
1.528024, 0.2705503, 1.320459, 0, 0, 0, 1, 1,
1.534443, -0.3057402, 0.2800902, 1, 1, 1, 1, 1,
1.535962, 2.083166, -0.5025942, 1, 1, 1, 1, 1,
1.557207, -1.697698, 3.046224, 1, 1, 1, 1, 1,
1.566783, 0.3291351, -0.1116815, 1, 1, 1, 1, 1,
1.569649, -0.3425421, 1.980147, 1, 1, 1, 1, 1,
1.593821, -2.500084, 3.221061, 1, 1, 1, 1, 1,
1.611377, -0.7791244, 2.329764, 1, 1, 1, 1, 1,
1.649248, 0.2474821, 0.2444782, 1, 1, 1, 1, 1,
1.656829, 0.1599284, 0.7514983, 1, 1, 1, 1, 1,
1.658273, 1.63351, 1.969555, 1, 1, 1, 1, 1,
1.670367, 0.522437, -1.028323, 1, 1, 1, 1, 1,
1.67053, -0.4188299, 3.012274, 1, 1, 1, 1, 1,
1.675262, 0.1342854, 1.564264, 1, 1, 1, 1, 1,
1.702928, 0.8966933, 0.3231472, 1, 1, 1, 1, 1,
1.708494, -0.4554017, 2.420892, 1, 1, 1, 1, 1,
1.719374, -1.408413, 3.46901, 0, 0, 1, 1, 1,
1.724311, 0.3984204, 1.153658, 1, 0, 0, 1, 1,
1.734036, -0.4878256, 1.164161, 1, 0, 0, 1, 1,
1.736564, 1.065765, 1.399865, 1, 0, 0, 1, 1,
1.754055, 1.02179, 0.8241302, 1, 0, 0, 1, 1,
1.762726, -0.6088089, 2.649951, 1, 0, 0, 1, 1,
1.782176, -1.211922, 1.752968, 0, 0, 0, 1, 1,
1.802514, 1.070008, 2.746834, 0, 0, 0, 1, 1,
1.804365, -1.119944, 2.857295, 0, 0, 0, 1, 1,
1.807447, 0.7278491, 1.930609, 0, 0, 0, 1, 1,
1.831599, -0.09056721, 1.290249, 0, 0, 0, 1, 1,
1.844924, -1.099177, 3.568826, 0, 0, 0, 1, 1,
1.852187, 1.02315, 0.2902687, 0, 0, 0, 1, 1,
1.859059, 1.205383, 1.81275, 1, 1, 1, 1, 1,
1.864097, 0.1787018, 2.386258, 1, 1, 1, 1, 1,
1.871612, -0.09634563, 2.092967, 1, 1, 1, 1, 1,
1.881441, -1.221048, 0.926088, 1, 1, 1, 1, 1,
1.884989, -0.1085243, 2.010706, 1, 1, 1, 1, 1,
1.885997, -1.891819, 1.617369, 1, 1, 1, 1, 1,
1.90345, -1.796382, 2.07666, 1, 1, 1, 1, 1,
1.906531, 0.2099722, 3.186022, 1, 1, 1, 1, 1,
1.906645, 0.4946321, 3.166606, 1, 1, 1, 1, 1,
1.921662, 0.565793, 1.576901, 1, 1, 1, 1, 1,
1.922183, -0.8599119, 0.9936049, 1, 1, 1, 1, 1,
1.956824, 0.8103335, 0.6832631, 1, 1, 1, 1, 1,
1.967849, 0.8277906, 0.5299817, 1, 1, 1, 1, 1,
1.973337, -1.726872, 2.057974, 1, 1, 1, 1, 1,
1.989099, -2.592473, 2.989741, 1, 1, 1, 1, 1,
2.002951, -1.687722, 1.900075, 0, 0, 1, 1, 1,
2.052177, 1.638682, 0.972762, 1, 0, 0, 1, 1,
2.0665, -1.118103, 1.133311, 1, 0, 0, 1, 1,
2.14669, -0.5519518, 2.098747, 1, 0, 0, 1, 1,
2.14706, -0.239564, 2.272036, 1, 0, 0, 1, 1,
2.161053, -1.447945, 2.707638, 1, 0, 0, 1, 1,
2.207536, -0.1815948, -0.8286013, 0, 0, 0, 1, 1,
2.220634, -0.4628505, 2.760644, 0, 0, 0, 1, 1,
2.230049, 0.5816715, 0.8874298, 0, 0, 0, 1, 1,
2.272439, 1.321172, 1.853587, 0, 0, 0, 1, 1,
2.308599, 0.7221557, 0.2896245, 0, 0, 0, 1, 1,
2.439579, 0.5241902, 2.231154, 0, 0, 0, 1, 1,
2.511775, 1.40268, -1.853333, 0, 0, 0, 1, 1,
2.66039, -0.922778, -0.3638099, 1, 1, 1, 1, 1,
2.741045, 0.141248, 1.304531, 1, 1, 1, 1, 1,
2.775442, -0.8398281, 2.302073, 1, 1, 1, 1, 1,
3.037054, 0.7606092, 1.547712, 1, 1, 1, 1, 1,
3.062649, -0.9437056, 3.140594, 1, 1, 1, 1, 1,
3.114624, 0.07035862, 2.787591, 1, 1, 1, 1, 1,
3.654137, 1.863107, 0.9616095, 1, 1, 1, 1, 1
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
var radius = 9.31198;
var distance = 32.70793;
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
mvMatrix.translate( -0.3692414, 0.09820223, -0.1815381 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.70793);
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
