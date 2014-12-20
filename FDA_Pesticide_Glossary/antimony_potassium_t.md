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
-3.290544, 0.6204392, -2.252861, 1, 0, 0, 1,
-3.109478, 1.053999, -1.483863, 1, 0.007843138, 0, 1,
-2.860305, 0.2178585, -1.211773, 1, 0.01176471, 0, 1,
-2.763426, 1.727415, -1.658622, 1, 0.01960784, 0, 1,
-2.729472, 1.635799, -1.339912, 1, 0.02352941, 0, 1,
-2.588968, -0.8719047, -1.865836, 1, 0.03137255, 0, 1,
-2.428719, -2.64241, -0.9652207, 1, 0.03529412, 0, 1,
-2.394824, 0.5857757, -1.841363, 1, 0.04313726, 0, 1,
-2.377186, -0.2875506, -0.8912047, 1, 0.04705882, 0, 1,
-2.354039, -2.013926, -1.153242, 1, 0.05490196, 0, 1,
-2.346198, -0.8307604, -1.94062, 1, 0.05882353, 0, 1,
-2.246602, -0.7648057, -1.397314, 1, 0.06666667, 0, 1,
-2.216864, 0.8392137, -1.146274, 1, 0.07058824, 0, 1,
-2.182025, 1.525067, -1.754598, 1, 0.07843138, 0, 1,
-2.176361, 1.377233, -0.3691987, 1, 0.08235294, 0, 1,
-2.172824, -1.217875, -2.851894, 1, 0.09019608, 0, 1,
-2.129578, -1.254766, -3.848281, 1, 0.09411765, 0, 1,
-2.099271, -0.4151881, -2.281987, 1, 0.1019608, 0, 1,
-2.083231, 0.4149427, -1.787376, 1, 0.1098039, 0, 1,
-2.055185, -0.4995955, -2.475602, 1, 0.1137255, 0, 1,
-2.014061, -0.2420125, -1.722571, 1, 0.1215686, 0, 1,
-2.008878, 0.2994445, -2.065971, 1, 0.1254902, 0, 1,
-2.002694, -0.2336209, -0.9173407, 1, 0.1333333, 0, 1,
-1.993441, -1.382156, -2.049295, 1, 0.1372549, 0, 1,
-1.988402, -0.3994862, -2.302435, 1, 0.145098, 0, 1,
-1.98002, -0.8700451, -3.297121, 1, 0.1490196, 0, 1,
-1.978959, -0.387825, -2.310978, 1, 0.1568628, 0, 1,
-1.97522, -0.8514934, -0.5448903, 1, 0.1607843, 0, 1,
-1.970507, 0.6693634, -1.193629, 1, 0.1686275, 0, 1,
-1.960715, 0.1591342, -1.463826, 1, 0.172549, 0, 1,
-1.958818, 2.872805, -0.05749499, 1, 0.1803922, 0, 1,
-1.924678, 0.08319371, -0.7519687, 1, 0.1843137, 0, 1,
-1.91399, 1.246244, -2.07546, 1, 0.1921569, 0, 1,
-1.895549, -0.426867, -0.5505632, 1, 0.1960784, 0, 1,
-1.894513, 1.192523, -1.461116, 1, 0.2039216, 0, 1,
-1.894409, -0.5072458, -1.017056, 1, 0.2117647, 0, 1,
-1.883164, 0.3903053, -1.267484, 1, 0.2156863, 0, 1,
-1.876616, 0.457381, -1.760221, 1, 0.2235294, 0, 1,
-1.86647, 1.32446, -0.4503035, 1, 0.227451, 0, 1,
-1.81992, 0.2163117, -0.504062, 1, 0.2352941, 0, 1,
-1.818601, -1.165057, -3.217299, 1, 0.2392157, 0, 1,
-1.808461, 0.4058008, -0.4690946, 1, 0.2470588, 0, 1,
-1.800953, -1.720503, -2.245943, 1, 0.2509804, 0, 1,
-1.78246, 0.1545064, -0.991261, 1, 0.2588235, 0, 1,
-1.773838, -0.6096321, -1.231036, 1, 0.2627451, 0, 1,
-1.771955, -0.07374124, -2.105257, 1, 0.2705882, 0, 1,
-1.759163, -0.2450782, -1.894311, 1, 0.2745098, 0, 1,
-1.735223, -0.1814035, -1.497604, 1, 0.282353, 0, 1,
-1.726404, 1.020291, -3.154825, 1, 0.2862745, 0, 1,
-1.714022, -1.376778, -1.751354, 1, 0.2941177, 0, 1,
-1.713216, -0.814491, -1.285487, 1, 0.3019608, 0, 1,
-1.708126, 0.1401698, -1.829703, 1, 0.3058824, 0, 1,
-1.695462, -0.838753, -2.048334, 1, 0.3137255, 0, 1,
-1.684913, 1.799769, 0.4715287, 1, 0.3176471, 0, 1,
-1.683184, 0.4994383, 0.6757369, 1, 0.3254902, 0, 1,
-1.683106, 1.012841, -1.186068, 1, 0.3294118, 0, 1,
-1.674929, -1.970775, -1.843751, 1, 0.3372549, 0, 1,
-1.668928, -0.6895137, -1.844911, 1, 0.3411765, 0, 1,
-1.668754, -0.6803526, -2.533409, 1, 0.3490196, 0, 1,
-1.640203, 0.03765669, 0.2393367, 1, 0.3529412, 0, 1,
-1.633911, -0.2318779, -1.572999, 1, 0.3607843, 0, 1,
-1.623463, 0.1024289, -1.293419, 1, 0.3647059, 0, 1,
-1.621253, -0.9162793, -2.629797, 1, 0.372549, 0, 1,
-1.620744, 0.1459689, -1.765417, 1, 0.3764706, 0, 1,
-1.607549, 1.733021, -1.58804, 1, 0.3843137, 0, 1,
-1.606731, 0.3369477, -1.002441, 1, 0.3882353, 0, 1,
-1.595636, 0.5150577, -1.779559, 1, 0.3960784, 0, 1,
-1.579894, 1.645429, -1.10936, 1, 0.4039216, 0, 1,
-1.578105, 0.6650702, -0.9062717, 1, 0.4078431, 0, 1,
-1.568941, 1.021793, -0.4863105, 1, 0.4156863, 0, 1,
-1.559679, 0.7015824, -2.540091, 1, 0.4196078, 0, 1,
-1.553965, -0.6602795, -1.004897, 1, 0.427451, 0, 1,
-1.551827, 0.2704381, -1.049437, 1, 0.4313726, 0, 1,
-1.54223, 0.6916472, -2.496865, 1, 0.4392157, 0, 1,
-1.534046, -0.9943221, -1.790907, 1, 0.4431373, 0, 1,
-1.527256, -1.006045, -1.283249, 1, 0.4509804, 0, 1,
-1.516551, -1.024106, -4.229558, 1, 0.454902, 0, 1,
-1.511518, 1.715778, -2.489603, 1, 0.4627451, 0, 1,
-1.501587, -0.5810037, -4.217298, 1, 0.4666667, 0, 1,
-1.49665, 0.1059121, -1.696443, 1, 0.4745098, 0, 1,
-1.485469, 0.4155874, -2.162866, 1, 0.4784314, 0, 1,
-1.48533, 0.1262569, 1.125801, 1, 0.4862745, 0, 1,
-1.474831, -0.4797659, -3.446476, 1, 0.4901961, 0, 1,
-1.468223, 0.1690859, -1.537799, 1, 0.4980392, 0, 1,
-1.459512, 1.297153, 0.9823136, 1, 0.5058824, 0, 1,
-1.452298, 0.5851924, -1.872183, 1, 0.509804, 0, 1,
-1.451486, -0.3233098, -3.224025, 1, 0.5176471, 0, 1,
-1.442659, 0.4264732, -1.790321, 1, 0.5215687, 0, 1,
-1.44021, -0.7268912, -1.896741, 1, 0.5294118, 0, 1,
-1.428682, -1.35978, -1.93532, 1, 0.5333334, 0, 1,
-1.427747, 0.2132181, -1.327721, 1, 0.5411765, 0, 1,
-1.401094, -0.2768727, -3.166117, 1, 0.5450981, 0, 1,
-1.38784, -1.476872, -2.436197, 1, 0.5529412, 0, 1,
-1.379677, -0.3739718, -1.388036, 1, 0.5568628, 0, 1,
-1.367993, -0.1201893, -1.522172, 1, 0.5647059, 0, 1,
-1.360987, 1.482737, -1.275196, 1, 0.5686275, 0, 1,
-1.360733, 0.7868019, -1.202981, 1, 0.5764706, 0, 1,
-1.333172, -0.5395568, -4.995697, 1, 0.5803922, 0, 1,
-1.331135, -0.1894669, -2.380685, 1, 0.5882353, 0, 1,
-1.317275, -1.193117, -2.159231, 1, 0.5921569, 0, 1,
-1.312824, 0.4012345, -1.226178, 1, 0.6, 0, 1,
-1.307671, 1.213962, -0.7399969, 1, 0.6078432, 0, 1,
-1.306042, 0.1217001, -0.8901436, 1, 0.6117647, 0, 1,
-1.305032, 1.043872, -2.353896, 1, 0.6196079, 0, 1,
-1.304294, 0.8567476, -1.573302, 1, 0.6235294, 0, 1,
-1.302799, -0.95439, -1.87533, 1, 0.6313726, 0, 1,
-1.292694, 1.012024, 0.9868822, 1, 0.6352941, 0, 1,
-1.286104, -1.074159, -3.088307, 1, 0.6431373, 0, 1,
-1.280839, 0.3651964, -1.785136, 1, 0.6470588, 0, 1,
-1.277947, -0.03448164, -2.163149, 1, 0.654902, 0, 1,
-1.277074, 0.7775725, -1.011553, 1, 0.6588235, 0, 1,
-1.276789, 1.978122, -0.6950133, 1, 0.6666667, 0, 1,
-1.256928, -1.740407, -2.233855, 1, 0.6705883, 0, 1,
-1.238198, 0.9072635, -0.8151689, 1, 0.6784314, 0, 1,
-1.230898, -0.3041336, -2.090375, 1, 0.682353, 0, 1,
-1.229535, -0.08465752, -0.8270352, 1, 0.6901961, 0, 1,
-1.222881, 1.809413, 0.008870944, 1, 0.6941177, 0, 1,
-1.221721, 0.3823606, -0.1996248, 1, 0.7019608, 0, 1,
-1.208619, -0.7769637, -2.513813, 1, 0.7098039, 0, 1,
-1.202274, 0.9791894, 0.5344132, 1, 0.7137255, 0, 1,
-1.198262, 1.044235, -0.5706022, 1, 0.7215686, 0, 1,
-1.193239, 0.628688, -0.7231879, 1, 0.7254902, 0, 1,
-1.18798, -1.044011, -3.460903, 1, 0.7333333, 0, 1,
-1.187514, 0.6616668, -1.564171, 1, 0.7372549, 0, 1,
-1.179827, 0.7628266, -1.755781, 1, 0.7450981, 0, 1,
-1.17328, -0.5558275, -0.4990805, 1, 0.7490196, 0, 1,
-1.161258, 0.02186474, -1.463134, 1, 0.7568628, 0, 1,
-1.157146, 0.6335022, -0.3290071, 1, 0.7607843, 0, 1,
-1.156787, -0.07748289, -1.125705, 1, 0.7686275, 0, 1,
-1.146931, 0.362942, 0.5646856, 1, 0.772549, 0, 1,
-1.146148, -0.2185726, -1.849881, 1, 0.7803922, 0, 1,
-1.144625, -0.3371018, -2.115769, 1, 0.7843137, 0, 1,
-1.144002, -1.176866, -3.267437, 1, 0.7921569, 0, 1,
-1.128586, -0.01286711, -2.05882, 1, 0.7960784, 0, 1,
-1.125577, -0.08194075, -0.7528993, 1, 0.8039216, 0, 1,
-1.125121, 0.7295732, -0.7063814, 1, 0.8117647, 0, 1,
-1.11944, -1.023903, -2.331849, 1, 0.8156863, 0, 1,
-1.115076, 0.04728803, -1.734601, 1, 0.8235294, 0, 1,
-1.109359, -0.6499761, -3.952323, 1, 0.827451, 0, 1,
-1.103924, 0.8057088, 0.0714566, 1, 0.8352941, 0, 1,
-1.103277, 1.122099, -0.1960072, 1, 0.8392157, 0, 1,
-1.101301, -1.314225, -1.876297, 1, 0.8470588, 0, 1,
-1.092833, -1.270616, -3.527796, 1, 0.8509804, 0, 1,
-1.088539, 1.152625, -0.8660119, 1, 0.8588235, 0, 1,
-1.085736, 1.257034, -1.275642, 1, 0.8627451, 0, 1,
-1.084512, -2.353413, -2.465713, 1, 0.8705882, 0, 1,
-1.083213, -0.3002735, -1.380458, 1, 0.8745098, 0, 1,
-1.073984, 0.02755396, -0.6715919, 1, 0.8823529, 0, 1,
-1.066864, 1.343849, 1.036708, 1, 0.8862745, 0, 1,
-1.051582, 2.885072, 0.1288232, 1, 0.8941177, 0, 1,
-1.044418, 0.2262001, 0.08445872, 1, 0.8980392, 0, 1,
-1.02969, -0.6242142, -2.627728, 1, 0.9058824, 0, 1,
-1.026147, 2.246969, 0.2929165, 1, 0.9137255, 0, 1,
-1.024112, 0.4608853, -0.921436, 1, 0.9176471, 0, 1,
-1.02013, -0.3854496, -1.434385, 1, 0.9254902, 0, 1,
-1.014874, 0.8150765, 1.02153, 1, 0.9294118, 0, 1,
-1.011385, 2.015258, -0.08593214, 1, 0.9372549, 0, 1,
-1.002421, -0.746739, -1.800934, 1, 0.9411765, 0, 1,
-0.996582, -0.7207872, -3.429254, 1, 0.9490196, 0, 1,
-0.9950215, -0.2205043, -3.021507, 1, 0.9529412, 0, 1,
-0.9882981, -0.03835334, 0.2077835, 1, 0.9607843, 0, 1,
-0.9821032, 1.904266, -0.2516964, 1, 0.9647059, 0, 1,
-0.9733873, 0.5586539, -0.4231513, 1, 0.972549, 0, 1,
-0.9661981, -1.01201, -3.514029, 1, 0.9764706, 0, 1,
-0.9588189, -0.3119611, -3.371391, 1, 0.9843137, 0, 1,
-0.9477344, -0.5259913, -1.274744, 1, 0.9882353, 0, 1,
-0.9413093, 0.5660082, -2.081777, 1, 0.9960784, 0, 1,
-0.9255224, -0.3821983, -2.004295, 0.9960784, 1, 0, 1,
-0.922555, 0.8959332, -0.9383898, 0.9921569, 1, 0, 1,
-0.9222821, -0.5884476, -3.143598, 0.9843137, 1, 0, 1,
-0.920393, 0.3980778, 0.09914628, 0.9803922, 1, 0, 1,
-0.8998524, -0.2649536, -3.374762, 0.972549, 1, 0, 1,
-0.8941956, -1.383669, -3.042728, 0.9686275, 1, 0, 1,
-0.8927748, 1.568922, -1.115652, 0.9607843, 1, 0, 1,
-0.8918393, 2.033187, 0.1393875, 0.9568627, 1, 0, 1,
-0.8873857, 0.4538067, -2.919568, 0.9490196, 1, 0, 1,
-0.8852875, 2.455817, -1.392445, 0.945098, 1, 0, 1,
-0.8847634, -0.4583752, -2.213661, 0.9372549, 1, 0, 1,
-0.8830083, -1.520647, -2.106405, 0.9333333, 1, 0, 1,
-0.881882, -0.2449245, -1.259047, 0.9254902, 1, 0, 1,
-0.8803898, -0.9942024, -2.81369, 0.9215686, 1, 0, 1,
-0.8741408, 0.8206753, 0.006959665, 0.9137255, 1, 0, 1,
-0.865999, -0.3566213, -1.406733, 0.9098039, 1, 0, 1,
-0.8620992, 0.6173052, -2.043319, 0.9019608, 1, 0, 1,
-0.8608689, -1.271091, -3.143795, 0.8941177, 1, 0, 1,
-0.8594098, 0.04334689, -1.198767, 0.8901961, 1, 0, 1,
-0.8550344, 0.2348973, 0.2613945, 0.8823529, 1, 0, 1,
-0.8530199, 0.8181633, -1.048199, 0.8784314, 1, 0, 1,
-0.8527935, 1.446817, -0.7633498, 0.8705882, 1, 0, 1,
-0.8401507, 0.2758377, -0.7376357, 0.8666667, 1, 0, 1,
-0.8340681, -0.4399304, -1.878743, 0.8588235, 1, 0, 1,
-0.832377, 0.792488, -0.5173933, 0.854902, 1, 0, 1,
-0.8312621, -0.2513193, -2.036529, 0.8470588, 1, 0, 1,
-0.8247813, 0.7972172, -1.185731, 0.8431373, 1, 0, 1,
-0.8169318, -0.07071583, -2.347094, 0.8352941, 1, 0, 1,
-0.8160609, 0.242655, -0.8773926, 0.8313726, 1, 0, 1,
-0.8106957, -0.1890215, -1.687444, 0.8235294, 1, 0, 1,
-0.8096859, 1.625827, 0.2330429, 0.8196079, 1, 0, 1,
-0.8082249, -0.1495441, -1.57999, 0.8117647, 1, 0, 1,
-0.8053914, -0.9414739, -1.821944, 0.8078431, 1, 0, 1,
-0.804163, -0.1616284, -1.432795, 0.8, 1, 0, 1,
-0.8017634, 0.07897835, -0.762308, 0.7921569, 1, 0, 1,
-0.801466, 0.392708, -0.6855759, 0.7882353, 1, 0, 1,
-0.7944787, 0.2719616, -0.8985423, 0.7803922, 1, 0, 1,
-0.7905532, 0.5556479, -0.5002066, 0.7764706, 1, 0, 1,
-0.7862844, -0.968942, -1.436891, 0.7686275, 1, 0, 1,
-0.7819042, -0.7641845, -3.673565, 0.7647059, 1, 0, 1,
-0.7815611, 2.038372, -0.2677289, 0.7568628, 1, 0, 1,
-0.780244, 0.004520549, -0.9582683, 0.7529412, 1, 0, 1,
-0.7793822, 1.557795, -2.977117, 0.7450981, 1, 0, 1,
-0.7758605, -0.4071784, -0.21961, 0.7411765, 1, 0, 1,
-0.7741345, -1.122559, -2.851889, 0.7333333, 1, 0, 1,
-0.7689241, -0.09500352, -1.072805, 0.7294118, 1, 0, 1,
-0.7584072, 0.2952575, -1.496095, 0.7215686, 1, 0, 1,
-0.750007, -0.4612367, -0.8613763, 0.7176471, 1, 0, 1,
-0.749962, 0.3634618, -2.19316, 0.7098039, 1, 0, 1,
-0.7480107, -0.996322, -0.9330561, 0.7058824, 1, 0, 1,
-0.74581, -0.1091088, -3.564298, 0.6980392, 1, 0, 1,
-0.7456895, -0.449303, -2.222642, 0.6901961, 1, 0, 1,
-0.740889, 1.311232, -1.026575, 0.6862745, 1, 0, 1,
-0.73255, 0.9981716, -1.707242, 0.6784314, 1, 0, 1,
-0.7314762, -0.7818414, -2.821667, 0.6745098, 1, 0, 1,
-0.7310461, -1.174613, -0.9811335, 0.6666667, 1, 0, 1,
-0.7307692, -0.261941, -3.303517, 0.6627451, 1, 0, 1,
-0.7287338, -0.08985864, -2.840393, 0.654902, 1, 0, 1,
-0.7216134, 1.64225, -0.7318555, 0.6509804, 1, 0, 1,
-0.7212649, -0.8188879, -3.61075, 0.6431373, 1, 0, 1,
-0.7129472, 0.4938546, -1.97129, 0.6392157, 1, 0, 1,
-0.7089006, -0.8298954, -2.390879, 0.6313726, 1, 0, 1,
-0.6984988, 0.4185014, 1.757985, 0.627451, 1, 0, 1,
-0.6964231, -0.4955647, -2.123563, 0.6196079, 1, 0, 1,
-0.6915302, 0.4524574, -2.227777, 0.6156863, 1, 0, 1,
-0.6875598, -0.3107767, -1.261013, 0.6078432, 1, 0, 1,
-0.684712, -1.574581, -2.562239, 0.6039216, 1, 0, 1,
-0.6798819, 0.03733017, -0.3520346, 0.5960785, 1, 0, 1,
-0.6797517, -0.2453229, -1.82249, 0.5882353, 1, 0, 1,
-0.6790922, 0.910026, 0.2383821, 0.5843138, 1, 0, 1,
-0.6757759, -0.6436648, -0.8411391, 0.5764706, 1, 0, 1,
-0.6744602, 0.1671152, -1.974068, 0.572549, 1, 0, 1,
-0.6739652, -1.317849, -4.198508, 0.5647059, 1, 0, 1,
-0.6730587, -0.70006, -0.06818843, 0.5607843, 1, 0, 1,
-0.671716, 0.2098581, -0.5613586, 0.5529412, 1, 0, 1,
-0.6692674, -1.449677, -3.936435, 0.5490196, 1, 0, 1,
-0.6658689, 1.086261, -1.706123, 0.5411765, 1, 0, 1,
-0.6566756, -0.3380927, -0.7021876, 0.5372549, 1, 0, 1,
-0.6556299, -1.478161, -2.328427, 0.5294118, 1, 0, 1,
-0.6512225, -0.156121, -2.277917, 0.5254902, 1, 0, 1,
-0.6486238, 0.1542896, -1.058628, 0.5176471, 1, 0, 1,
-0.644571, -0.7797196, -1.665611, 0.5137255, 1, 0, 1,
-0.6436165, 0.4441974, 0.3710233, 0.5058824, 1, 0, 1,
-0.6432281, 1.401571, -0.7568612, 0.5019608, 1, 0, 1,
-0.6392218, 0.4506351, -1.820187, 0.4941176, 1, 0, 1,
-0.6357192, -0.6123634, -3.249131, 0.4862745, 1, 0, 1,
-0.6267711, -0.3815731, -2.190176, 0.4823529, 1, 0, 1,
-0.6262324, -0.2379317, -2.099552, 0.4745098, 1, 0, 1,
-0.6253285, 0.199897, -1.768906, 0.4705882, 1, 0, 1,
-0.6229696, 1.213048, -0.7741438, 0.4627451, 1, 0, 1,
-0.6160893, 1.408926, -2.389174, 0.4588235, 1, 0, 1,
-0.6151915, 0.1706483, -0.9471313, 0.4509804, 1, 0, 1,
-0.6033204, -0.1324283, -1.69664, 0.4470588, 1, 0, 1,
-0.6020588, 1.282797, -2.898499, 0.4392157, 1, 0, 1,
-0.5944374, -0.7758831, -3.191003, 0.4352941, 1, 0, 1,
-0.5887447, 0.08001622, 0.1431112, 0.427451, 1, 0, 1,
-0.5865048, -0.3498002, -1.221844, 0.4235294, 1, 0, 1,
-0.5851435, 0.106996, -2.71014, 0.4156863, 1, 0, 1,
-0.5839645, 0.6927799, -0.3999375, 0.4117647, 1, 0, 1,
-0.5826072, 0.2818361, 0.4146182, 0.4039216, 1, 0, 1,
-0.5738367, -1.924586, -4.110929, 0.3960784, 1, 0, 1,
-0.5735974, -0.1595784, -2.737787, 0.3921569, 1, 0, 1,
-0.5730134, 1.059963, -1.61213, 0.3843137, 1, 0, 1,
-0.570657, 1.681564, 0.8809409, 0.3803922, 1, 0, 1,
-0.5670272, -0.01575319, -0.2488903, 0.372549, 1, 0, 1,
-0.5650784, 0.5714915, -1.747321, 0.3686275, 1, 0, 1,
-0.5637811, -0.4120099, -1.256868, 0.3607843, 1, 0, 1,
-0.5636556, -1.123006, -1.712919, 0.3568628, 1, 0, 1,
-0.5623757, -0.3057371, -2.41529, 0.3490196, 1, 0, 1,
-0.5608385, 0.3650311, -0.1405144, 0.345098, 1, 0, 1,
-0.5553083, -0.3683497, -1.175282, 0.3372549, 1, 0, 1,
-0.5532282, -0.4622931, -1.759988, 0.3333333, 1, 0, 1,
-0.5527341, -1.019541, -2.413493, 0.3254902, 1, 0, 1,
-0.5523515, 1.391103, 0.0418958, 0.3215686, 1, 0, 1,
-0.5509573, 0.8624069, -1.247181, 0.3137255, 1, 0, 1,
-0.5475418, -0.9395915, -1.690995, 0.3098039, 1, 0, 1,
-0.5460919, -0.03668077, -2.358986, 0.3019608, 1, 0, 1,
-0.5402846, -0.9498374, -1.166479, 0.2941177, 1, 0, 1,
-0.5393685, 0.2153458, -1.586785, 0.2901961, 1, 0, 1,
-0.5387705, -1.102702, -1.973006, 0.282353, 1, 0, 1,
-0.5333695, 0.602909, 0.8510493, 0.2784314, 1, 0, 1,
-0.5311868, 0.4236284, 0.8907043, 0.2705882, 1, 0, 1,
-0.5302274, 0.4827516, 0.3011493, 0.2666667, 1, 0, 1,
-0.529563, 0.8614047, -2.428958, 0.2588235, 1, 0, 1,
-0.5287113, -0.7465805, -4.690809, 0.254902, 1, 0, 1,
-0.5214178, 0.6426713, -1.502608, 0.2470588, 1, 0, 1,
-0.5181499, 1.240344, 0.1154132, 0.2431373, 1, 0, 1,
-0.5178326, -0.9392018, -3.050173, 0.2352941, 1, 0, 1,
-0.5162461, 0.5614021, -0.5597875, 0.2313726, 1, 0, 1,
-0.5153748, 0.1567632, 0.6132354, 0.2235294, 1, 0, 1,
-0.5127073, 0.8224438, -1.354424, 0.2196078, 1, 0, 1,
-0.5046961, 0.1266056, 0.1461207, 0.2117647, 1, 0, 1,
-0.5027471, 0.3581911, 0.6422537, 0.2078431, 1, 0, 1,
-0.5000188, 0.9550277, -0.5929692, 0.2, 1, 0, 1,
-0.4992304, 0.4073034, -0.06683341, 0.1921569, 1, 0, 1,
-0.4984739, -0.3357581, 0.9900529, 0.1882353, 1, 0, 1,
-0.494181, 0.187226, -1.700451, 0.1803922, 1, 0, 1,
-0.4932424, 2.190804, -0.08506951, 0.1764706, 1, 0, 1,
-0.4893495, 0.2837619, -0.712867, 0.1686275, 1, 0, 1,
-0.4798163, -0.4123001, -1.904647, 0.1647059, 1, 0, 1,
-0.4782919, 1.73703, -0.8864156, 0.1568628, 1, 0, 1,
-0.4753033, 1.551731, 0.6229737, 0.1529412, 1, 0, 1,
-0.4742857, 0.1695207, -2.900178, 0.145098, 1, 0, 1,
-0.4735462, -0.5013809, -3.08072, 0.1411765, 1, 0, 1,
-0.4672606, -1.257441, -4.133233, 0.1333333, 1, 0, 1,
-0.4661355, 2.007703, -1.505545, 0.1294118, 1, 0, 1,
-0.4615237, -0.8629708, -3.624306, 0.1215686, 1, 0, 1,
-0.4596666, 2.443453, 0.4458208, 0.1176471, 1, 0, 1,
-0.4565436, 0.3838678, -1.764788, 0.1098039, 1, 0, 1,
-0.4541652, 1.263115, -0.8453436, 0.1058824, 1, 0, 1,
-0.4521613, -0.1582564, -0.152354, 0.09803922, 1, 0, 1,
-0.4489562, -0.32656, -2.202519, 0.09019608, 1, 0, 1,
-0.4477709, -2.369434, -2.893155, 0.08627451, 1, 0, 1,
-0.4460298, -0.4273176, -2.829457, 0.07843138, 1, 0, 1,
-0.4410108, -0.8751532, -1.699553, 0.07450981, 1, 0, 1,
-0.4403362, 0.6293663, -3.400924, 0.06666667, 1, 0, 1,
-0.4372236, 0.5795229, -0.7376423, 0.0627451, 1, 0, 1,
-0.4330601, 0.3136008, -3.420689, 0.05490196, 1, 0, 1,
-0.4316373, -0.6914669, -3.787313, 0.05098039, 1, 0, 1,
-0.4290549, 0.6150279, -2.281463, 0.04313726, 1, 0, 1,
-0.4272547, 0.2581717, -0.5277117, 0.03921569, 1, 0, 1,
-0.4209937, 0.4789536, -0.3477413, 0.03137255, 1, 0, 1,
-0.4104496, 1.424402, -1.043, 0.02745098, 1, 0, 1,
-0.4103826, 0.4195731, -0.7901047, 0.01960784, 1, 0, 1,
-0.4042398, 1.867899, -0.4574187, 0.01568628, 1, 0, 1,
-0.4028618, 0.8538064, -0.681601, 0.007843138, 1, 0, 1,
-0.4018922, -0.2357258, -3.28096, 0.003921569, 1, 0, 1,
-0.3980436, -0.07099663, -0.9410569, 0, 1, 0.003921569, 1,
-0.3967195, -0.4246063, -2.024832, 0, 1, 0.01176471, 1,
-0.3913488, -1.96479, -2.409342, 0, 1, 0.01568628, 1,
-0.3883824, 0.8069689, 1.880843, 0, 1, 0.02352941, 1,
-0.3866724, 0.1372208, -0.0830883, 0, 1, 0.02745098, 1,
-0.3855708, 0.7304453, -0.2016834, 0, 1, 0.03529412, 1,
-0.382975, 0.5998462, -1.072768, 0, 1, 0.03921569, 1,
-0.3813767, 1.309687, 0.6158809, 0, 1, 0.04705882, 1,
-0.3759937, 1.503628, -1.411333, 0, 1, 0.05098039, 1,
-0.3746413, 0.1056432, 0.4510387, 0, 1, 0.05882353, 1,
-0.3714813, -0.3887713, -2.175294, 0, 1, 0.0627451, 1,
-0.3681919, 0.2075003, -0.7463261, 0, 1, 0.07058824, 1,
-0.3675066, 0.5043072, 0.1893698, 0, 1, 0.07450981, 1,
-0.3666011, 0.391121, -2.487157, 0, 1, 0.08235294, 1,
-0.3664643, 0.7431642, 0.5720881, 0, 1, 0.08627451, 1,
-0.3660517, -0.4642265, -0.317591, 0, 1, 0.09411765, 1,
-0.3634749, 0.6985573, -0.4743331, 0, 1, 0.1019608, 1,
-0.3610642, -1.573263, -4.474152, 0, 1, 0.1058824, 1,
-0.3522371, -1.29134, -1.284604, 0, 1, 0.1137255, 1,
-0.3513803, -0.0853989, -1.114097, 0, 1, 0.1176471, 1,
-0.3510135, -1.556252, -1.994917, 0, 1, 0.1254902, 1,
-0.3473596, -0.02529659, -2.265319, 0, 1, 0.1294118, 1,
-0.3438465, -0.9686775, -2.370648, 0, 1, 0.1372549, 1,
-0.3417751, -1.066363, -3.361418, 0, 1, 0.1411765, 1,
-0.3404925, -0.4452039, -2.198489, 0, 1, 0.1490196, 1,
-0.3372615, 2.323154, -0.2146244, 0, 1, 0.1529412, 1,
-0.3360992, 1.180001, 0.1422357, 0, 1, 0.1607843, 1,
-0.3349636, -2.190404, -5.38648, 0, 1, 0.1647059, 1,
-0.3267951, 1.930639, -0.669385, 0, 1, 0.172549, 1,
-0.3239544, -0.543196, -2.366188, 0, 1, 0.1764706, 1,
-0.322406, -0.7396927, -2.122442, 0, 1, 0.1843137, 1,
-0.3192559, -0.9664014, -3.520829, 0, 1, 0.1882353, 1,
-0.3188222, 1.009921, -0.0535773, 0, 1, 0.1960784, 1,
-0.3178532, -1.08522, -5.54555, 0, 1, 0.2039216, 1,
-0.3151136, 0.05446972, -1.508641, 0, 1, 0.2078431, 1,
-0.3132478, -1.495605, -1.716487, 0, 1, 0.2156863, 1,
-0.2992492, -0.01521239, -1.431697, 0, 1, 0.2196078, 1,
-0.299098, -2.022867, -1.004581, 0, 1, 0.227451, 1,
-0.2989465, -1.356784, -2.619842, 0, 1, 0.2313726, 1,
-0.2971874, 0.8978152, -0.9118251, 0, 1, 0.2392157, 1,
-0.2965364, 1.166422, 0.4862264, 0, 1, 0.2431373, 1,
-0.2961971, 1.626596, 0.3952758, 0, 1, 0.2509804, 1,
-0.294923, -0.6557637, -3.185006, 0, 1, 0.254902, 1,
-0.2946908, 1.232748, -0.2095335, 0, 1, 0.2627451, 1,
-0.2812227, 1.190947, 1.032179, 0, 1, 0.2666667, 1,
-0.2685747, 1.208581, -0.2724493, 0, 1, 0.2745098, 1,
-0.2683055, -0.6082616, -2.896746, 0, 1, 0.2784314, 1,
-0.2649969, 0.3301084, -0.8871151, 0, 1, 0.2862745, 1,
-0.2628646, 0.4347658, 0.7729275, 0, 1, 0.2901961, 1,
-0.2624488, 2.554255, -1.03369, 0, 1, 0.2980392, 1,
-0.2585386, 0.01873991, -2.850606, 0, 1, 0.3058824, 1,
-0.2552046, -0.4657527, -3.098271, 0, 1, 0.3098039, 1,
-0.2491582, -0.180392, 0.1301447, 0, 1, 0.3176471, 1,
-0.24038, -1.334188, -2.168412, 0, 1, 0.3215686, 1,
-0.2400613, -0.7095208, -3.590657, 0, 1, 0.3294118, 1,
-0.2390448, -0.05169104, 0.9595656, 0, 1, 0.3333333, 1,
-0.2385332, -0.5385481, -3.588166, 0, 1, 0.3411765, 1,
-0.2374042, -0.9332848, -1.693701, 0, 1, 0.345098, 1,
-0.2372898, -0.8097437, -2.510164, 0, 1, 0.3529412, 1,
-0.2306165, 0.9374959, -1.656108, 0, 1, 0.3568628, 1,
-0.2299137, -2.354076, -2.128381, 0, 1, 0.3647059, 1,
-0.2272949, -0.07426614, -0.7135217, 0, 1, 0.3686275, 1,
-0.22145, -0.6178676, -3.109563, 0, 1, 0.3764706, 1,
-0.2207665, 0.7659919, 0.3632617, 0, 1, 0.3803922, 1,
-0.2205119, 0.2619359, -0.9247347, 0, 1, 0.3882353, 1,
-0.2186352, 0.07057811, 0.3493088, 0, 1, 0.3921569, 1,
-0.2176043, -1.88418, -3.619187, 0, 1, 0.4, 1,
-0.2152991, 0.452278, -2.122249, 0, 1, 0.4078431, 1,
-0.2121809, -1.013796, -3.287355, 0, 1, 0.4117647, 1,
-0.2028791, 1.320664, 0.8607571, 0, 1, 0.4196078, 1,
-0.2001011, 0.5645387, -0.07401348, 0, 1, 0.4235294, 1,
-0.1996282, 0.3889326, -1.051614, 0, 1, 0.4313726, 1,
-0.1975473, 0.2394465, -0.03926267, 0, 1, 0.4352941, 1,
-0.1914068, -0.6789657, -3.235207, 0, 1, 0.4431373, 1,
-0.1902402, 0.5060611, -0.5233055, 0, 1, 0.4470588, 1,
-0.1900992, -2.381322, -2.919338, 0, 1, 0.454902, 1,
-0.1900605, 0.5285442, 0.4576744, 0, 1, 0.4588235, 1,
-0.1898579, 0.404854, -1.452949, 0, 1, 0.4666667, 1,
-0.188548, -0.8564909, -5.209764, 0, 1, 0.4705882, 1,
-0.1872396, -1.075276, -2.164501, 0, 1, 0.4784314, 1,
-0.1849913, 1.152024, -1.009006, 0, 1, 0.4823529, 1,
-0.1840578, -0.4478578, -3.311855, 0, 1, 0.4901961, 1,
-0.1715149, 0.7505324, 1.07072, 0, 1, 0.4941176, 1,
-0.1714806, -0.6388177, -1.609461, 0, 1, 0.5019608, 1,
-0.1701307, -2.063891, -3.349125, 0, 1, 0.509804, 1,
-0.1694079, -0.5146092, -3.691774, 0, 1, 0.5137255, 1,
-0.1639993, 0.8657168, -0.02322585, 0, 1, 0.5215687, 1,
-0.1625912, 0.00614679, -2.963916, 0, 1, 0.5254902, 1,
-0.1554327, 0.3480422, 1.803158, 0, 1, 0.5333334, 1,
-0.1510162, -0.4426672, -1.356774, 0, 1, 0.5372549, 1,
-0.1496784, 0.836737, 1.321306, 0, 1, 0.5450981, 1,
-0.1405197, 1.335064, 1.269177, 0, 1, 0.5490196, 1,
-0.1383373, 0.4754349, 0.3404467, 0, 1, 0.5568628, 1,
-0.1381077, -0.402936, -2.608282, 0, 1, 0.5607843, 1,
-0.1375689, -0.7205386, -3.006345, 0, 1, 0.5686275, 1,
-0.1352684, 0.3432527, -0.3423347, 0, 1, 0.572549, 1,
-0.1341963, 0.4717195, 0.5841208, 0, 1, 0.5803922, 1,
-0.1332095, 0.5474619, 0.3578912, 0, 1, 0.5843138, 1,
-0.1313805, -1.219159, -3.726067, 0, 1, 0.5921569, 1,
-0.1288734, 0.1124886, 0.08399276, 0, 1, 0.5960785, 1,
-0.1269666, 0.2344395, 0.4339831, 0, 1, 0.6039216, 1,
-0.1261496, 0.9353902, -1.242619, 0, 1, 0.6117647, 1,
-0.1203106, 0.4205801, -0.03097581, 0, 1, 0.6156863, 1,
-0.1185889, 1.327923, 1.609566, 0, 1, 0.6235294, 1,
-0.1174974, 0.2739351, -1.08951, 0, 1, 0.627451, 1,
-0.1168233, 2.093685, -1.729832, 0, 1, 0.6352941, 1,
-0.11457, 0.1713531, -0.5775461, 0, 1, 0.6392157, 1,
-0.1120731, -0.006506754, -2.029398, 0, 1, 0.6470588, 1,
-0.1078082, -1.481006, -2.653017, 0, 1, 0.6509804, 1,
-0.1042217, -0.1047688, -3.205978, 0, 1, 0.6588235, 1,
-0.1010218, 0.01905586, -1.786459, 0, 1, 0.6627451, 1,
-0.1007274, 0.3131151, -0.4106884, 0, 1, 0.6705883, 1,
-0.09350137, 0.120322, -1.967861, 0, 1, 0.6745098, 1,
-0.09319171, -0.01279635, -0.7769473, 0, 1, 0.682353, 1,
-0.09127812, -1.529424, -3.445338, 0, 1, 0.6862745, 1,
-0.08642823, -0.5752195, -4.717288, 0, 1, 0.6941177, 1,
-0.08348937, 0.3527629, -1.220112, 0, 1, 0.7019608, 1,
-0.07748698, 1.210329, 0.1082356, 0, 1, 0.7058824, 1,
-0.07327115, 1.405624, 0.1334044, 0, 1, 0.7137255, 1,
-0.07100913, 0.3862332, 0.5072086, 0, 1, 0.7176471, 1,
-0.07002739, 0.873328, 2.076835, 0, 1, 0.7254902, 1,
-0.06737223, 0.7497934, -0.3645374, 0, 1, 0.7294118, 1,
-0.06656697, -0.9710359, -2.904295, 0, 1, 0.7372549, 1,
-0.06306032, 0.184024, 0.6356533, 0, 1, 0.7411765, 1,
-0.05519224, 0.5363286, 0.6044651, 0, 1, 0.7490196, 1,
-0.05380375, 0.2286529, -1.092825, 0, 1, 0.7529412, 1,
-0.05247273, 0.6790639, -0.7557339, 0, 1, 0.7607843, 1,
-0.05210041, -1.375078, -3.562082, 0, 1, 0.7647059, 1,
-0.05033417, 0.3569426, -1.758567, 0, 1, 0.772549, 1,
-0.04971622, 0.5573382, -1.593367, 0, 1, 0.7764706, 1,
-0.04888843, 0.6442528, -0.2867603, 0, 1, 0.7843137, 1,
-0.04860912, 1.272557, -0.1509691, 0, 1, 0.7882353, 1,
-0.04563544, -1.286355, -3.795785, 0, 1, 0.7960784, 1,
-0.04524907, -0.5324486, -1.693117, 0, 1, 0.8039216, 1,
-0.04463932, -0.6719096, -3.850587, 0, 1, 0.8078431, 1,
-0.03175794, -0.8597646, -1.514971, 0, 1, 0.8156863, 1,
-0.02972773, -0.5014492, -2.016999, 0, 1, 0.8196079, 1,
-0.02754082, 1.026553, -1.900214, 0, 1, 0.827451, 1,
-0.02163919, -1.211497, -3.770407, 0, 1, 0.8313726, 1,
-0.0197726, 1.470483, 0.8553936, 0, 1, 0.8392157, 1,
-0.01843674, -0.01513249, -2.496946, 0, 1, 0.8431373, 1,
-0.01716164, 0.9275466, -0.2010197, 0, 1, 0.8509804, 1,
-0.01645654, 0.78394, 1.164805, 0, 1, 0.854902, 1,
-0.01582578, 0.210279, 0.07142246, 0, 1, 0.8627451, 1,
-0.01487029, -0.2525638, -2.684442, 0, 1, 0.8666667, 1,
-0.01418164, 1.590525, -0.2337534, 0, 1, 0.8745098, 1,
-0.01073487, 0.3976031, -1.345303, 0, 1, 0.8784314, 1,
-0.002115814, 0.8296303, -1.824435, 0, 1, 0.8862745, 1,
-0.001789588, 0.5463716, 1.633557, 0, 1, 0.8901961, 1,
-0.0004014465, 0.3059626, -0.1831398, 0, 1, 0.8980392, 1,
0.000665777, 0.5188338, 0.225279, 0, 1, 0.9058824, 1,
0.003522301, -0.595347, 2.983108, 0, 1, 0.9098039, 1,
0.005703372, 0.3022066, -0.7852058, 0, 1, 0.9176471, 1,
0.008032143, 1.519905, 0.672752, 0, 1, 0.9215686, 1,
0.01223554, 1.397268, -0.05382538, 0, 1, 0.9294118, 1,
0.01377274, -0.9010482, 2.147862, 0, 1, 0.9333333, 1,
0.0202045, 1.963387, -0.4851939, 0, 1, 0.9411765, 1,
0.02203783, -0.1395013, 4.101063, 0, 1, 0.945098, 1,
0.02834477, -1.542026, 2.14249, 0, 1, 0.9529412, 1,
0.03175357, 0.7509304, -0.119761, 0, 1, 0.9568627, 1,
0.03226965, -1.445469, 1.950529, 0, 1, 0.9647059, 1,
0.03493294, 0.8041399, -0.8504257, 0, 1, 0.9686275, 1,
0.03791988, -0.4456047, 3.765163, 0, 1, 0.9764706, 1,
0.04414204, -2.61432, 2.519101, 0, 1, 0.9803922, 1,
0.04478516, -1.290956, 2.924447, 0, 1, 0.9882353, 1,
0.04491525, -0.1334206, 2.613865, 0, 1, 0.9921569, 1,
0.04679626, 0.9847198, 0.6540619, 0, 1, 1, 1,
0.04734587, -0.7352883, 4.505806, 0, 0.9921569, 1, 1,
0.04840979, -0.5142813, 2.537623, 0, 0.9882353, 1, 1,
0.05044161, -1.738238, 1.972089, 0, 0.9803922, 1, 1,
0.05396475, 0.9346963, -0.3152863, 0, 0.9764706, 1, 1,
0.05699509, -0.7552125, 3.729648, 0, 0.9686275, 1, 1,
0.06314555, 1.636001, -1.924604, 0, 0.9647059, 1, 1,
0.06685438, -1.500425, 5.820007, 0, 0.9568627, 1, 1,
0.06892239, -1.026721, 2.557169, 0, 0.9529412, 1, 1,
0.06943324, 0.4972597, -0.8353876, 0, 0.945098, 1, 1,
0.07009073, 1.499984, 0.9779279, 0, 0.9411765, 1, 1,
0.07114336, 0.09887527, -0.2169084, 0, 0.9333333, 1, 1,
0.07273084, 0.01610932, 2.624141, 0, 0.9294118, 1, 1,
0.07412555, -0.8110829, 3.859952, 0, 0.9215686, 1, 1,
0.0778231, 1.759241, -1.122863, 0, 0.9176471, 1, 1,
0.08350341, 0.151481, 0.3357773, 0, 0.9098039, 1, 1,
0.08742393, -1.969921, 2.022222, 0, 0.9058824, 1, 1,
0.08852957, 0.4299713, 0.4395323, 0, 0.8980392, 1, 1,
0.08942495, 1.990128, 0.5961152, 0, 0.8901961, 1, 1,
0.09008219, -0.4080704, 3.213234, 0, 0.8862745, 1, 1,
0.09288093, 0.6766399, 1.264993, 0, 0.8784314, 1, 1,
0.09473328, 1.019238, 1.25696, 0, 0.8745098, 1, 1,
0.09673771, -0.4310671, 3.066806, 0, 0.8666667, 1, 1,
0.09710813, -1.054935, 0.3480445, 0, 0.8627451, 1, 1,
0.09737975, 0.2701015, -0.5905065, 0, 0.854902, 1, 1,
0.1075753, 0.6814622, 0.6708723, 0, 0.8509804, 1, 1,
0.1080587, 0.3484017, 0.5107712, 0, 0.8431373, 1, 1,
0.109658, 0.3218171, 1.279796, 0, 0.8392157, 1, 1,
0.1140747, 1.471538, 0.4438171, 0, 0.8313726, 1, 1,
0.1160785, 0.4190063, -1.431881, 0, 0.827451, 1, 1,
0.1172601, 0.9604247, -0.3117011, 0, 0.8196079, 1, 1,
0.118692, 0.6613402, -0.8618448, 0, 0.8156863, 1, 1,
0.1214141, -0.2808973, 3.181111, 0, 0.8078431, 1, 1,
0.1262049, 0.9905503, 2.056866, 0, 0.8039216, 1, 1,
0.1268564, -1.424107, 2.680106, 0, 0.7960784, 1, 1,
0.1275693, 0.3992737, -0.7670069, 0, 0.7882353, 1, 1,
0.1277553, -0.7954424, 2.544616, 0, 0.7843137, 1, 1,
0.1278705, -0.3151609, 1.366174, 0, 0.7764706, 1, 1,
0.1299946, 1.059432, 1.616483, 0, 0.772549, 1, 1,
0.1350073, 1.062058, -0.02056765, 0, 0.7647059, 1, 1,
0.135643, -1.702352, 1.949805, 0, 0.7607843, 1, 1,
0.138991, 0.09237894, -0.2459201, 0, 0.7529412, 1, 1,
0.1434477, 0.4402339, 1.777303, 0, 0.7490196, 1, 1,
0.1436423, -0.9086152, 1.534453, 0, 0.7411765, 1, 1,
0.1441998, 1.144728, 1.129552, 0, 0.7372549, 1, 1,
0.1485487, -2.027408, 2.407676, 0, 0.7294118, 1, 1,
0.1493969, -0.32356, 1.105693, 0, 0.7254902, 1, 1,
0.153982, 0.1359168, 0.1964302, 0, 0.7176471, 1, 1,
0.154822, -0.1452001, 3.922418, 0, 0.7137255, 1, 1,
0.1549467, 0.7885743, 0.5426147, 0, 0.7058824, 1, 1,
0.15614, -0.1527043, 1.5147, 0, 0.6980392, 1, 1,
0.1612977, -1.113431, 2.976051, 0, 0.6941177, 1, 1,
0.1638811, 0.1395297, -0.09835884, 0, 0.6862745, 1, 1,
0.1649612, -0.7157181, 2.650241, 0, 0.682353, 1, 1,
0.1696493, 1.072224, -1.134993, 0, 0.6745098, 1, 1,
0.1697756, -0.2511764, 2.452915, 0, 0.6705883, 1, 1,
0.172107, 1.28892, 0.210828, 0, 0.6627451, 1, 1,
0.1751046, 1.061959, -0.6875275, 0, 0.6588235, 1, 1,
0.1770248, 0.1136075, 0.8306388, 0, 0.6509804, 1, 1,
0.1795951, -2.331764, 2.567718, 0, 0.6470588, 1, 1,
0.1802578, -1.7243, 3.383514, 0, 0.6392157, 1, 1,
0.1843296, 1.684407, 0.1806568, 0, 0.6352941, 1, 1,
0.1894364, 1.068852, 0.4818358, 0, 0.627451, 1, 1,
0.1901656, -0.9194862, 2.164645, 0, 0.6235294, 1, 1,
0.1945431, 1.260012, -1.181062, 0, 0.6156863, 1, 1,
0.1960069, -0.7839503, 3.347248, 0, 0.6117647, 1, 1,
0.1986872, -1.3482, 3.273415, 0, 0.6039216, 1, 1,
0.1988166, -0.8302112, 3.017691, 0, 0.5960785, 1, 1,
0.201324, 1.185462, 0.8048252, 0, 0.5921569, 1, 1,
0.2013892, 0.3228579, 0.4729953, 0, 0.5843138, 1, 1,
0.2061162, 0.6912388, -0.958707, 0, 0.5803922, 1, 1,
0.2074556, 2.96966, 1.17466, 0, 0.572549, 1, 1,
0.2076217, -0.5138502, 1.175437, 0, 0.5686275, 1, 1,
0.2090096, 0.9907368, 1.583309, 0, 0.5607843, 1, 1,
0.213057, -1.072946, 3.734788, 0, 0.5568628, 1, 1,
0.2131701, 0.4359571, 0.5095356, 0, 0.5490196, 1, 1,
0.2149574, -1.00618, 1.654686, 0, 0.5450981, 1, 1,
0.2168476, 1.244176, -0.3719203, 0, 0.5372549, 1, 1,
0.2193437, -2.125542, 3.516239, 0, 0.5333334, 1, 1,
0.2201253, -2.086, 1.405034, 0, 0.5254902, 1, 1,
0.2237436, -0.1589118, 1.235171, 0, 0.5215687, 1, 1,
0.2273466, 0.2026309, 0.7578304, 0, 0.5137255, 1, 1,
0.2294123, 0.2867282, 0.7073981, 0, 0.509804, 1, 1,
0.2306912, -0.8885931, 2.42254, 0, 0.5019608, 1, 1,
0.2311084, -0.958871, 0.9751896, 0, 0.4941176, 1, 1,
0.2316732, -0.5661461, 3.321097, 0, 0.4901961, 1, 1,
0.2318934, -1.529433, 1.95459, 0, 0.4823529, 1, 1,
0.2326145, -0.2237082, 1.05953, 0, 0.4784314, 1, 1,
0.2329633, 1.140693, -0.744471, 0, 0.4705882, 1, 1,
0.2359383, -0.3869001, 4.316677, 0, 0.4666667, 1, 1,
0.2437879, -0.9893541, 2.366322, 0, 0.4588235, 1, 1,
0.2487284, -0.3487055, 2.136467, 0, 0.454902, 1, 1,
0.2532072, 0.8553683, 0.5399218, 0, 0.4470588, 1, 1,
0.2646984, -0.243638, 3.350552, 0, 0.4431373, 1, 1,
0.267106, 0.6437509, 0.07451844, 0, 0.4352941, 1, 1,
0.2698217, -1.406632, 3.141953, 0, 0.4313726, 1, 1,
0.2740767, -0.847872, 2.743481, 0, 0.4235294, 1, 1,
0.2787178, 1.395212, 2.874833, 0, 0.4196078, 1, 1,
0.2791728, -0.4713879, 3.770332, 0, 0.4117647, 1, 1,
0.2802466, -1.30968, 3.054673, 0, 0.4078431, 1, 1,
0.2803214, 0.4419289, 2.285236, 0, 0.4, 1, 1,
0.2875517, -0.6426483, 4.059848, 0, 0.3921569, 1, 1,
0.2923103, 0.4118361, -0.2348854, 0, 0.3882353, 1, 1,
0.2928096, 0.4107192, 0.8878488, 0, 0.3803922, 1, 1,
0.2979183, -1.454837, 1.43662, 0, 0.3764706, 1, 1,
0.3035564, -1.92558, 1.218614, 0, 0.3686275, 1, 1,
0.3060441, -0.7183654, 4.765066, 0, 0.3647059, 1, 1,
0.3077368, -0.9487428, 1.866843, 0, 0.3568628, 1, 1,
0.3086985, -1.661075, 2.693169, 0, 0.3529412, 1, 1,
0.3117991, -0.37016, 2.154249, 0, 0.345098, 1, 1,
0.3124439, 0.3362369, 0.8205455, 0, 0.3411765, 1, 1,
0.312612, 0.6802283, 0.1600477, 0, 0.3333333, 1, 1,
0.3139038, -1.381086, 4.163494, 0, 0.3294118, 1, 1,
0.3302661, 1.926178, -1.736156, 0, 0.3215686, 1, 1,
0.3308379, -1.791689, 3.632481, 0, 0.3176471, 1, 1,
0.3411422, 0.4565191, 0.7137011, 0, 0.3098039, 1, 1,
0.3411646, 0.03819314, 0.1682288, 0, 0.3058824, 1, 1,
0.342277, -1.212135, 2.572008, 0, 0.2980392, 1, 1,
0.3468818, 2.651148, 0.1064331, 0, 0.2901961, 1, 1,
0.3469082, -1.356717, 3.488295, 0, 0.2862745, 1, 1,
0.3482294, 1.042746, -0.4672025, 0, 0.2784314, 1, 1,
0.3499648, -0.1757341, 0.05696494, 0, 0.2745098, 1, 1,
0.3506488, 1.263341, 1.216182, 0, 0.2666667, 1, 1,
0.3513772, -0.4274162, 0.5594402, 0, 0.2627451, 1, 1,
0.3525165, 0.2487859, 1.739359, 0, 0.254902, 1, 1,
0.3543285, 0.8542905, 2.353285, 0, 0.2509804, 1, 1,
0.3600405, 1.316295, -0.06191863, 0, 0.2431373, 1, 1,
0.3610474, -0.02126925, 1.433708, 0, 0.2392157, 1, 1,
0.3611296, -0.6767788, 1.891131, 0, 0.2313726, 1, 1,
0.3637636, -1.407687, 3.37455, 0, 0.227451, 1, 1,
0.3649887, 0.7985431, -1.440168, 0, 0.2196078, 1, 1,
0.3686394, 0.1590937, 1.387674, 0, 0.2156863, 1, 1,
0.3727671, 0.03055594, 1.350037, 0, 0.2078431, 1, 1,
0.3757039, -0.7948058, 3.538713, 0, 0.2039216, 1, 1,
0.3760724, -0.5492595, 3.092638, 0, 0.1960784, 1, 1,
0.3766429, 0.00368988, 0.01021043, 0, 0.1882353, 1, 1,
0.3780925, 0.2159168, 1.467337, 0, 0.1843137, 1, 1,
0.3781661, 1.211946, -0.8318549, 0, 0.1764706, 1, 1,
0.3781674, -0.9686695, 2.84211, 0, 0.172549, 1, 1,
0.3799331, -0.3592833, 2.823706, 0, 0.1647059, 1, 1,
0.3810855, 0.9058549, 0.669322, 0, 0.1607843, 1, 1,
0.38183, 0.7187871, 0.1922524, 0, 0.1529412, 1, 1,
0.3819942, 1.318147, 1.386948, 0, 0.1490196, 1, 1,
0.3880711, 1.214102, 0.9193206, 0, 0.1411765, 1, 1,
0.3885002, 0.6962426, 0.5785816, 0, 0.1372549, 1, 1,
0.3891397, 0.6484014, 0.8442293, 0, 0.1294118, 1, 1,
0.3942008, -1.482441, 3.463851, 0, 0.1254902, 1, 1,
0.3953407, -0.836255, 2.286371, 0, 0.1176471, 1, 1,
0.3962934, 0.1008056, 2.148279, 0, 0.1137255, 1, 1,
0.3977183, 0.05483141, 0.5763398, 0, 0.1058824, 1, 1,
0.4011763, -0.5799693, 2.484779, 0, 0.09803922, 1, 1,
0.413885, 1.566267, 0.2565579, 0, 0.09411765, 1, 1,
0.4157204, -0.2862051, 2.097636, 0, 0.08627451, 1, 1,
0.4230767, -0.07499067, 0.1487523, 0, 0.08235294, 1, 1,
0.4270512, -1.469788, 1.962855, 0, 0.07450981, 1, 1,
0.4385388, -1.351651, 3.673724, 0, 0.07058824, 1, 1,
0.4430421, 1.158521, 0.1650129, 0, 0.0627451, 1, 1,
0.448222, 0.9366959, 1.658491, 0, 0.05882353, 1, 1,
0.4529245, -0.8344305, 2.742151, 0, 0.05098039, 1, 1,
0.4530913, 1.042782, -0.06737486, 0, 0.04705882, 1, 1,
0.4539846, 0.583528, -2.261891, 0, 0.03921569, 1, 1,
0.4545704, 0.2417008, 0.9516774, 0, 0.03529412, 1, 1,
0.4571581, -0.6200883, 2.096149, 0, 0.02745098, 1, 1,
0.4597148, -0.3214079, 2.353701, 0, 0.02352941, 1, 1,
0.4604076, 1.554404, -1.60152, 0, 0.01568628, 1, 1,
0.4621672, 1.453708, 2.511926, 0, 0.01176471, 1, 1,
0.4715982, -0.8365899, 4.011945, 0, 0.003921569, 1, 1,
0.47497, -2.930945, 3.95146, 0.003921569, 0, 1, 1,
0.4770101, 1.06737, -0.5514362, 0.007843138, 0, 1, 1,
0.4783483, -0.1601996, 1.85704, 0.01568628, 0, 1, 1,
0.4922612, -0.6393888, 1.843296, 0.01960784, 0, 1, 1,
0.4968068, 0.4866239, 0.1251974, 0.02745098, 0, 1, 1,
0.4982636, -2.126585, 0.9431636, 0.03137255, 0, 1, 1,
0.5003101, 1.101736, 1.207091, 0.03921569, 0, 1, 1,
0.5036786, 0.8046494, 0.8163497, 0.04313726, 0, 1, 1,
0.5060473, -1.971533, 1.239952, 0.05098039, 0, 1, 1,
0.5111247, -0.5896686, 1.998245, 0.05490196, 0, 1, 1,
0.5118233, -0.1526574, 1.775442, 0.0627451, 0, 1, 1,
0.5131583, 1.002618, -0.4853773, 0.06666667, 0, 1, 1,
0.513308, -1.353961, 4.293454, 0.07450981, 0, 1, 1,
0.5136358, -0.9026107, 3.575047, 0.07843138, 0, 1, 1,
0.5142131, 0.2776236, -0.8966802, 0.08627451, 0, 1, 1,
0.5143454, -0.9718502, 2.384487, 0.09019608, 0, 1, 1,
0.5154952, 0.1789163, 2.2037, 0.09803922, 0, 1, 1,
0.5192642, -0.8803402, 2.021636, 0.1058824, 0, 1, 1,
0.5198191, 1.631525, 1.16185, 0.1098039, 0, 1, 1,
0.524776, 0.3800074, 0.6050934, 0.1176471, 0, 1, 1,
0.5251715, 0.5668619, 1.947307, 0.1215686, 0, 1, 1,
0.5255512, 0.3249136, 0.3739546, 0.1294118, 0, 1, 1,
0.5278918, 0.505478, 0.5166087, 0.1333333, 0, 1, 1,
0.5290436, -0.272298, 2.260495, 0.1411765, 0, 1, 1,
0.5343826, 0.9506757, -0.6924216, 0.145098, 0, 1, 1,
0.5408314, 0.6671852, 1.159143, 0.1529412, 0, 1, 1,
0.5445862, -0.5575204, 1.483856, 0.1568628, 0, 1, 1,
0.5454008, 0.8872814, -0.4944862, 0.1647059, 0, 1, 1,
0.5486624, -0.3967903, 0.06508636, 0.1686275, 0, 1, 1,
0.5506689, -0.2849912, 1.524271, 0.1764706, 0, 1, 1,
0.5518591, 0.04232039, 0.609408, 0.1803922, 0, 1, 1,
0.5540595, 1.199252, 0.3566307, 0.1882353, 0, 1, 1,
0.5567091, -1.369118, 2.139986, 0.1921569, 0, 1, 1,
0.559481, -0.6424627, 0.4127171, 0.2, 0, 1, 1,
0.5596272, 1.44137, 0.2917678, 0.2078431, 0, 1, 1,
0.5609266, -2.13527, 2.932427, 0.2117647, 0, 1, 1,
0.5681812, -1.127384, 3.793755, 0.2196078, 0, 1, 1,
0.5744835, -0.2342179, 1.55937, 0.2235294, 0, 1, 1,
0.5769841, 1.188652, 1.428015, 0.2313726, 0, 1, 1,
0.5800404, -0.0464198, 1.854748, 0.2352941, 0, 1, 1,
0.5854447, 1.331098, -0.83698, 0.2431373, 0, 1, 1,
0.5924308, -0.9062006, 4.239458, 0.2470588, 0, 1, 1,
0.5937003, -0.3342604, 1.486865, 0.254902, 0, 1, 1,
0.593938, 0.4257647, -0.07383473, 0.2588235, 0, 1, 1,
0.5965243, 0.902223, 0.0921976, 0.2666667, 0, 1, 1,
0.5989994, -0.03005294, -1.127431, 0.2705882, 0, 1, 1,
0.6004688, 1.231955, -0.6366514, 0.2784314, 0, 1, 1,
0.6071029, 0.6964777, 0.4209439, 0.282353, 0, 1, 1,
0.6081966, 0.8701536, 1.171413, 0.2901961, 0, 1, 1,
0.608934, -0.4089269, 0.0639746, 0.2941177, 0, 1, 1,
0.6103387, 2.232687, 2.313084, 0.3019608, 0, 1, 1,
0.6120068, -0.1415551, 1.848039, 0.3098039, 0, 1, 1,
0.6120602, -0.2499852, 1.546614, 0.3137255, 0, 1, 1,
0.6123348, -0.5709594, -0.1208864, 0.3215686, 0, 1, 1,
0.6160449, -1.667903, 3.398033, 0.3254902, 0, 1, 1,
0.6176577, 0.9859065, 0.6215757, 0.3333333, 0, 1, 1,
0.6229583, -0.5620372, 1.835266, 0.3372549, 0, 1, 1,
0.6277733, -0.2803798, 2.10043, 0.345098, 0, 1, 1,
0.6277999, 1.15181, 1.484022, 0.3490196, 0, 1, 1,
0.6342338, 0.2315327, -0.2352455, 0.3568628, 0, 1, 1,
0.635437, 1.103905, 1.034888, 0.3607843, 0, 1, 1,
0.63683, -0.2759022, 3.47072, 0.3686275, 0, 1, 1,
0.6406374, -0.8331727, 3.443697, 0.372549, 0, 1, 1,
0.6441594, 0.6524904, 0.04552855, 0.3803922, 0, 1, 1,
0.6446996, 0.1360411, 0.9269295, 0.3843137, 0, 1, 1,
0.6465843, -0.5943791, 3.482268, 0.3921569, 0, 1, 1,
0.6467886, 1.448985, 0.01456809, 0.3960784, 0, 1, 1,
0.6472211, -0.3156017, 2.007115, 0.4039216, 0, 1, 1,
0.6479802, 0.1256475, 0.9755703, 0.4117647, 0, 1, 1,
0.6554629, -0.1835662, 2.496402, 0.4156863, 0, 1, 1,
0.6567073, -0.6468738, 2.020408, 0.4235294, 0, 1, 1,
0.6593012, -1.51167, 1.788699, 0.427451, 0, 1, 1,
0.6595628, 0.7644471, 1.040305, 0.4352941, 0, 1, 1,
0.6719042, 0.09083001, 1.418037, 0.4392157, 0, 1, 1,
0.6729783, 0.2711921, 0.9832543, 0.4470588, 0, 1, 1,
0.6849975, -0.5981125, 4.256862, 0.4509804, 0, 1, 1,
0.6970829, 0.1520403, -0.2547938, 0.4588235, 0, 1, 1,
0.701194, 0.4712795, 0.5090476, 0.4627451, 0, 1, 1,
0.7016692, 0.1088708, 2.182749, 0.4705882, 0, 1, 1,
0.7019884, -0.04210924, 2.091578, 0.4745098, 0, 1, 1,
0.702623, -0.7701469, 1.856541, 0.4823529, 0, 1, 1,
0.7042936, 0.2391069, -1.00367, 0.4862745, 0, 1, 1,
0.704905, -1.692909, 2.486074, 0.4941176, 0, 1, 1,
0.7059335, -1.685896, 4.04981, 0.5019608, 0, 1, 1,
0.7084923, 0.2034843, 2.842961, 0.5058824, 0, 1, 1,
0.7093958, -1.427769, 3.163862, 0.5137255, 0, 1, 1,
0.7119801, -0.4522515, 2.573972, 0.5176471, 0, 1, 1,
0.7130862, -1.501864, 2.496543, 0.5254902, 0, 1, 1,
0.7148506, 0.003351339, 2.468349, 0.5294118, 0, 1, 1,
0.7193176, -1.907043, 2.150865, 0.5372549, 0, 1, 1,
0.7193779, 0.6232262, 0.329742, 0.5411765, 0, 1, 1,
0.7233642, 1.268764, -0.7754754, 0.5490196, 0, 1, 1,
0.7257752, -1.870811, 3.253652, 0.5529412, 0, 1, 1,
0.7279167, 0.2037803, 2.580147, 0.5607843, 0, 1, 1,
0.7306412, 1.542266, -0.229519, 0.5647059, 0, 1, 1,
0.7391307, -0.6161734, 3.388175, 0.572549, 0, 1, 1,
0.7424508, 0.882158, 0.04281716, 0.5764706, 0, 1, 1,
0.7458624, -0.9402855, 1.260001, 0.5843138, 0, 1, 1,
0.7471049, 0.3605619, 0.02734415, 0.5882353, 0, 1, 1,
0.7482855, -0.7814779, 3.049923, 0.5960785, 0, 1, 1,
0.7493599, 0.6355023, 2.141235, 0.6039216, 0, 1, 1,
0.7525089, 0.8122319, -0.03834173, 0.6078432, 0, 1, 1,
0.7543016, 0.3016977, 1.668633, 0.6156863, 0, 1, 1,
0.7587798, -0.4118287, 1.759847, 0.6196079, 0, 1, 1,
0.7588814, -0.8414971, 0.7482033, 0.627451, 0, 1, 1,
0.7590201, -1.812953, 2.584709, 0.6313726, 0, 1, 1,
0.7665313, -1.50442, 0.7510971, 0.6392157, 0, 1, 1,
0.7740005, 1.287237, -0.5356461, 0.6431373, 0, 1, 1,
0.7770886, 0.7793395, -0.1202788, 0.6509804, 0, 1, 1,
0.7785458, -0.7537178, 2.348829, 0.654902, 0, 1, 1,
0.7790436, -0.3364009, 1.572996, 0.6627451, 0, 1, 1,
0.7798387, -1.093149, 2.139465, 0.6666667, 0, 1, 1,
0.7840186, -1.237401, 1.71545, 0.6745098, 0, 1, 1,
0.7841188, 0.0192492, 2.270047, 0.6784314, 0, 1, 1,
0.7855888, -0.1957952, 1.556115, 0.6862745, 0, 1, 1,
0.7863046, 1.112068, 1.077844, 0.6901961, 0, 1, 1,
0.7911196, 1.043025, -0.5631239, 0.6980392, 0, 1, 1,
0.7961344, -0.1449886, 1.330538, 0.7058824, 0, 1, 1,
0.8011597, 0.5441614, 2.215582, 0.7098039, 0, 1, 1,
0.802618, -0.9711978, 4.108028, 0.7176471, 0, 1, 1,
0.8042341, -0.1281115, 2.494104, 0.7215686, 0, 1, 1,
0.8058519, 1.252756, -0.6413291, 0.7294118, 0, 1, 1,
0.8081957, 1.170035, 1.326309, 0.7333333, 0, 1, 1,
0.809959, -1.435097, 2.878395, 0.7411765, 0, 1, 1,
0.8124647, -0.1184611, 2.695144, 0.7450981, 0, 1, 1,
0.814526, 0.2023866, 1.386435, 0.7529412, 0, 1, 1,
0.8152944, -1.068492, 0.5478286, 0.7568628, 0, 1, 1,
0.8219711, 2.767758, 0.6103819, 0.7647059, 0, 1, 1,
0.8228624, 2.222605, -0.6958806, 0.7686275, 0, 1, 1,
0.8271715, -1.497041, 2.088468, 0.7764706, 0, 1, 1,
0.8295918, -0.9153042, 1.034485, 0.7803922, 0, 1, 1,
0.8332771, 0.8787981, 0.2578256, 0.7882353, 0, 1, 1,
0.8380134, 1.761174, -1.006871, 0.7921569, 0, 1, 1,
0.8417541, 0.6737664, 1.335868, 0.8, 0, 1, 1,
0.8466092, -1.180009, 3.742782, 0.8078431, 0, 1, 1,
0.8490775, -0.3721975, 2.258659, 0.8117647, 0, 1, 1,
0.8526467, -0.5454624, 1.719545, 0.8196079, 0, 1, 1,
0.8545152, 1.017277, 1.736131, 0.8235294, 0, 1, 1,
0.8590771, 0.6574543, 0.2775819, 0.8313726, 0, 1, 1,
0.8616675, -0.3908309, 3.458164, 0.8352941, 0, 1, 1,
0.8631266, -1.461593, 2.393016, 0.8431373, 0, 1, 1,
0.8678586, -1.040195, 2.760581, 0.8470588, 0, 1, 1,
0.8711126, 1.432478, 0.5809367, 0.854902, 0, 1, 1,
0.8743058, -0.3074986, 1.417999, 0.8588235, 0, 1, 1,
0.8775103, 2.087298, 0.7743077, 0.8666667, 0, 1, 1,
0.880675, 0.7986668, 1.607194, 0.8705882, 0, 1, 1,
0.8879088, 1.786307, 1.562581, 0.8784314, 0, 1, 1,
0.8902841, 0.6168799, 1.536054, 0.8823529, 0, 1, 1,
0.8922316, 1.457293, 1.694073, 0.8901961, 0, 1, 1,
0.9004581, 0.5045267, 1.025586, 0.8941177, 0, 1, 1,
0.9010866, -0.1041489, 3.907131, 0.9019608, 0, 1, 1,
0.9060417, 0.2011113, 1.709588, 0.9098039, 0, 1, 1,
0.9134883, 1.121585, -0.3676695, 0.9137255, 0, 1, 1,
0.9213433, 0.1958947, 0.7805213, 0.9215686, 0, 1, 1,
0.9250187, -1.659143, 2.429439, 0.9254902, 0, 1, 1,
0.9250333, 0.1740719, 0.3198514, 0.9333333, 0, 1, 1,
0.9310934, 1.67907, -0.793709, 0.9372549, 0, 1, 1,
0.9431719, -0.7083988, 1.272828, 0.945098, 0, 1, 1,
0.9467357, 1.4236, 1.463827, 0.9490196, 0, 1, 1,
0.9526179, -0.002491564, 2.930791, 0.9568627, 0, 1, 1,
0.9599096, -0.5232167, 2.348461, 0.9607843, 0, 1, 1,
0.966099, 0.6142258, 2.029623, 0.9686275, 0, 1, 1,
0.9710314, -1.407607, 3.247426, 0.972549, 0, 1, 1,
0.9722198, -1.021924, 3.69133, 0.9803922, 0, 1, 1,
0.9839195, -0.8629413, 2.808389, 0.9843137, 0, 1, 1,
0.9911218, 0.5867681, -0.5339605, 0.9921569, 0, 1, 1,
0.9942491, 0.06171804, 3.550375, 0.9960784, 0, 1, 1,
0.9953987, 1.148579, 2.521574, 1, 0, 0.9960784, 1,
1.011489, 0.3264465, 0.5102879, 1, 0, 0.9882353, 1,
1.011874, -1.573574, 2.260007, 1, 0, 0.9843137, 1,
1.014674, -1.428329, 3.415522, 1, 0, 0.9764706, 1,
1.026185, 2.191835, 0.1557305, 1, 0, 0.972549, 1,
1.02867, 0.2642266, 0.7364339, 1, 0, 0.9647059, 1,
1.029954, 0.3662842, -0.1813697, 1, 0, 0.9607843, 1,
1.031716, -1.529205, 3.778644, 1, 0, 0.9529412, 1,
1.03239, -1.088262, 2.191749, 1, 0, 0.9490196, 1,
1.034435, -0.1852282, 1.830997, 1, 0, 0.9411765, 1,
1.03782, 1.110959, 0.498644, 1, 0, 0.9372549, 1,
1.042147, 1.773975, -0.9696164, 1, 0, 0.9294118, 1,
1.042485, -1.523354, 1.261812, 1, 0, 0.9254902, 1,
1.043629, -0.9737765, 1.792687, 1, 0, 0.9176471, 1,
1.049528, 0.1485801, 1.84956, 1, 0, 0.9137255, 1,
1.052254, 0.6812112, -1.253722, 1, 0, 0.9058824, 1,
1.061319, -0.3849891, 2.462192, 1, 0, 0.9019608, 1,
1.061526, 1.615982, 1.001307, 1, 0, 0.8941177, 1,
1.068071, 0.6719068, 1.985023, 1, 0, 0.8862745, 1,
1.077115, 0.5651684, 0.2874544, 1, 0, 0.8823529, 1,
1.079768, 1.503103, 0.8878522, 1, 0, 0.8745098, 1,
1.086459, -0.3690033, 0.3042044, 1, 0, 0.8705882, 1,
1.08854, -0.3956626, 1.922141, 1, 0, 0.8627451, 1,
1.097925, 1.85982, -0.4383084, 1, 0, 0.8588235, 1,
1.099276, -1.794648, 2.486535, 1, 0, 0.8509804, 1,
1.099939, 0.8322716, 0.4910609, 1, 0, 0.8470588, 1,
1.101452, 0.9671528, 0.6506576, 1, 0, 0.8392157, 1,
1.103091, 0.1510026, 2.11519, 1, 0, 0.8352941, 1,
1.10382, -0.4473576, 2.01848, 1, 0, 0.827451, 1,
1.106448, 0.8942161, -0.2509162, 1, 0, 0.8235294, 1,
1.107723, -0.9375473, 0.3249064, 1, 0, 0.8156863, 1,
1.118003, -0.6230502, 1.346667, 1, 0, 0.8117647, 1,
1.118295, -1.00855, 1.848099, 1, 0, 0.8039216, 1,
1.119378, -0.7442633, 1.416052, 1, 0, 0.7960784, 1,
1.124761, 1.284796, 0.6260355, 1, 0, 0.7921569, 1,
1.124897, -0.4190208, 0.9020477, 1, 0, 0.7843137, 1,
1.129231, 1.747912, -0.9418293, 1, 0, 0.7803922, 1,
1.142937, 0.4588808, 0.08158796, 1, 0, 0.772549, 1,
1.157218, -0.4533498, 2.61535, 1, 0, 0.7686275, 1,
1.158552, 0.2989634, 1.434014, 1, 0, 0.7607843, 1,
1.189605, 0.001324453, 1.220397, 1, 0, 0.7568628, 1,
1.196439, -2.343708, 3.698763, 1, 0, 0.7490196, 1,
1.202904, -1.154267, 2.582448, 1, 0, 0.7450981, 1,
1.210478, -0.4037066, 0.9731603, 1, 0, 0.7372549, 1,
1.218175, 0.2229428, 2.182478, 1, 0, 0.7333333, 1,
1.219636, 0.5103495, 0.1887395, 1, 0, 0.7254902, 1,
1.226531, 0.6729994, 1.684132, 1, 0, 0.7215686, 1,
1.2269, 0.3091438, 2.226502, 1, 0, 0.7137255, 1,
1.229029, -0.4259017, 1.055489, 1, 0, 0.7098039, 1,
1.229678, 1.297327, -0.1860842, 1, 0, 0.7019608, 1,
1.238613, -0.3759928, 2.583312, 1, 0, 0.6941177, 1,
1.248596, 0.09219451, 0.7890993, 1, 0, 0.6901961, 1,
1.254849, 0.7056212, -0.04231313, 1, 0, 0.682353, 1,
1.261142, 0.2206452, 2.18767, 1, 0, 0.6784314, 1,
1.270837, 0.1014405, 0.3339443, 1, 0, 0.6705883, 1,
1.276556, -0.3344667, 2.297272, 1, 0, 0.6666667, 1,
1.277605, 0.2837828, 2.378256, 1, 0, 0.6588235, 1,
1.278533, -0.1829093, 1.735701, 1, 0, 0.654902, 1,
1.281668, 1.291936, 1.012038, 1, 0, 0.6470588, 1,
1.293456, -0.3805086, 2.431686, 1, 0, 0.6431373, 1,
1.298793, 0.552862, 1.935838, 1, 0, 0.6352941, 1,
1.307418, 1.785286, 0.713912, 1, 0, 0.6313726, 1,
1.307587, -0.7183051, 2.560048, 1, 0, 0.6235294, 1,
1.3091, -2.780759, 1.626876, 1, 0, 0.6196079, 1,
1.312393, 2.114379, -0.3530262, 1, 0, 0.6117647, 1,
1.315079, -0.5761684, 1.347696, 1, 0, 0.6078432, 1,
1.320992, 0.02086039, 1.305688, 1, 0, 0.6, 1,
1.325095, -1.806162, 0.1855353, 1, 0, 0.5921569, 1,
1.331765, 0.5423432, 3.172568, 1, 0, 0.5882353, 1,
1.346856, 0.2264879, 1.238878, 1, 0, 0.5803922, 1,
1.351067, 1.537663, -0.219962, 1, 0, 0.5764706, 1,
1.358177, 1.317558, 0.5755465, 1, 0, 0.5686275, 1,
1.378583, -0.2671653, 2.835544, 1, 0, 0.5647059, 1,
1.381321, 0.3479629, 1.023165, 1, 0, 0.5568628, 1,
1.383008, -0.5947223, 2.19469, 1, 0, 0.5529412, 1,
1.390296, -0.3105576, 1.72728, 1, 0, 0.5450981, 1,
1.401074, 0.6487437, 3.331297, 1, 0, 0.5411765, 1,
1.40352, -0.4406288, 1.909293, 1, 0, 0.5333334, 1,
1.423706, -1.256408, 1.93765, 1, 0, 0.5294118, 1,
1.440295, 0.7394992, -0.2209892, 1, 0, 0.5215687, 1,
1.442353, -0.01185431, 0.3252337, 1, 0, 0.5176471, 1,
1.448679, -0.5171443, 1.384082, 1, 0, 0.509804, 1,
1.459419, 1.901916, 0.0361182, 1, 0, 0.5058824, 1,
1.460708, 0.4130423, 0.5563344, 1, 0, 0.4980392, 1,
1.46329, 0.1609998, 1.733218, 1, 0, 0.4901961, 1,
1.467107, 0.1629817, 2.431169, 1, 0, 0.4862745, 1,
1.487266, -1.961802, 2.356892, 1, 0, 0.4784314, 1,
1.497993, -0.1864014, 1.442593, 1, 0, 0.4745098, 1,
1.499903, -0.0137663, 0.434956, 1, 0, 0.4666667, 1,
1.504584, 1.960314, 1.511635, 1, 0, 0.4627451, 1,
1.511205, -1.734671, 3.019407, 1, 0, 0.454902, 1,
1.511442, -0.718444, 2.090258, 1, 0, 0.4509804, 1,
1.51163, 0.2885229, 0.6604635, 1, 0, 0.4431373, 1,
1.51587, 0.641591, 0.9530376, 1, 0, 0.4392157, 1,
1.530936, 0.1862766, 1.932632, 1, 0, 0.4313726, 1,
1.534204, 0.1632565, 4.249462, 1, 0, 0.427451, 1,
1.534594, 0.2570963, 1.316928, 1, 0, 0.4196078, 1,
1.544112, -0.3476196, 2.482735, 1, 0, 0.4156863, 1,
1.560594, 0.2730854, 1.945621, 1, 0, 0.4078431, 1,
1.579754, 0.06449984, 1.449189, 1, 0, 0.4039216, 1,
1.580487, -0.8590407, 1.662842, 1, 0, 0.3960784, 1,
1.581645, -0.8292872, 1.648068, 1, 0, 0.3882353, 1,
1.589046, 0.5630898, 1.887169, 1, 0, 0.3843137, 1,
1.589814, 0.2867959, 2.322438, 1, 0, 0.3764706, 1,
1.599686, -0.6548811, 1.163919, 1, 0, 0.372549, 1,
1.605463, -1.494575, 1.527655, 1, 0, 0.3647059, 1,
1.60577, -1.521803, 3.623069, 1, 0, 0.3607843, 1,
1.606071, -1.328985, 3.737621, 1, 0, 0.3529412, 1,
1.622377, -1.299175, 2.261388, 1, 0, 0.3490196, 1,
1.627225, -0.9405707, 2.08147, 1, 0, 0.3411765, 1,
1.637899, -2.067005, 4.378465, 1, 0, 0.3372549, 1,
1.655427, -0.3280571, 2.703285, 1, 0, 0.3294118, 1,
1.658666, -0.564898, 1.410786, 1, 0, 0.3254902, 1,
1.668202, 0.879014, 0.6633967, 1, 0, 0.3176471, 1,
1.670703, -0.02188396, 1.815453, 1, 0, 0.3137255, 1,
1.674617, -0.5331722, 0.9343388, 1, 0, 0.3058824, 1,
1.688076, 0.4690268, -1.235892, 1, 0, 0.2980392, 1,
1.692054, -0.3305239, 2.07425, 1, 0, 0.2941177, 1,
1.716166, 1.222341, 0.3217286, 1, 0, 0.2862745, 1,
1.726372, -0.8087304, 3.620074, 1, 0, 0.282353, 1,
1.726991, 1.229084, 1.299069, 1, 0, 0.2745098, 1,
1.728042, 1.343936, 0.597178, 1, 0, 0.2705882, 1,
1.73279, -0.6307719, 1.17187, 1, 0, 0.2627451, 1,
1.768974, -2.179626, 2.603826, 1, 0, 0.2588235, 1,
1.77019, -0.9282802, 1.977247, 1, 0, 0.2509804, 1,
1.783746, -1.537079, 3.69989, 1, 0, 0.2470588, 1,
1.786396, -0.4710354, 1.293499, 1, 0, 0.2392157, 1,
1.788866, -0.4152311, 2.027375, 1, 0, 0.2352941, 1,
1.811741, 0.8427761, -0.3288454, 1, 0, 0.227451, 1,
1.813155, 0.4169458, 1.98817, 1, 0, 0.2235294, 1,
1.840854, 0.1956379, 1.49715, 1, 0, 0.2156863, 1,
1.844973, -0.5819249, 1.83206, 1, 0, 0.2117647, 1,
1.859731, 0.07198392, -0.4256907, 1, 0, 0.2039216, 1,
1.864973, -0.2602526, 1.767329, 1, 0, 0.1960784, 1,
1.868939, 0.8041892, 1.554487, 1, 0, 0.1921569, 1,
1.871857, 0.9318514, 2.258366, 1, 0, 0.1843137, 1,
1.896358, 0.3530413, 0.6995231, 1, 0, 0.1803922, 1,
1.948112, -0.5865449, 2.109498, 1, 0, 0.172549, 1,
1.9569, 0.9962124, 1.598401, 1, 0, 0.1686275, 1,
2.000152, 1.341657, 1.968358, 1, 0, 0.1607843, 1,
2.003177, -0.2419145, 1.724804, 1, 0, 0.1568628, 1,
2.004386, 0.4787918, 2.128285, 1, 0, 0.1490196, 1,
2.014605, 0.3594999, 2.366596, 1, 0, 0.145098, 1,
2.028009, 1.484464, -0.2240278, 1, 0, 0.1372549, 1,
2.05031, -1.194105, 2.863504, 1, 0, 0.1333333, 1,
2.057397, 1.435541, -0.5774434, 1, 0, 0.1254902, 1,
2.099091, 0.3774326, 1.239041, 1, 0, 0.1215686, 1,
2.10143, -0.2441947, 3.453688, 1, 0, 0.1137255, 1,
2.101822, -1.585068, 2.501384, 1, 0, 0.1098039, 1,
2.111294, 0.7653697, 0.5410126, 1, 0, 0.1019608, 1,
2.167493, -0.3021137, 1.938366, 1, 0, 0.09411765, 1,
2.173753, -0.8790877, 2.417093, 1, 0, 0.09019608, 1,
2.20338, -0.9613935, 1.358549, 1, 0, 0.08235294, 1,
2.226343, -1.411965, 1.677065, 1, 0, 0.07843138, 1,
2.272639, 1.408709, 1.830437, 1, 0, 0.07058824, 1,
2.301424, -0.3636098, 3.031019, 1, 0, 0.06666667, 1,
2.303657, -0.39309, 1.77391, 1, 0, 0.05882353, 1,
2.323026, 0.06435467, 3.056184, 1, 0, 0.05490196, 1,
2.32433, -0.8349268, 1.259889, 1, 0, 0.04705882, 1,
2.404764, 1.416948, 3.073914, 1, 0, 0.04313726, 1,
2.564924, -0.3075765, 2.287076, 1, 0, 0.03529412, 1,
2.586195, 1.152238, 0.2119849, 1, 0, 0.03137255, 1,
2.627669, -0.2416925, 2.948995, 1, 0, 0.02352941, 1,
2.668825, 1.380615, 1.321118, 1, 0, 0.01960784, 1,
2.82099, -0.5595971, 0.7490444, 1, 0, 0.01176471, 1,
3.261314, -1.950323, 2.139193, 1, 0, 0.007843138, 1
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
-0.01461506, -3.931097, -7.472013, 0, -0.5, 0.5, 0.5,
-0.01461506, -3.931097, -7.472013, 1, -0.5, 0.5, 0.5,
-0.01461506, -3.931097, -7.472013, 1, 1.5, 0.5, 0.5,
-0.01461506, -3.931097, -7.472013, 0, 1.5, 0.5, 0.5
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
-4.401084, 0.01935744, -7.472013, 0, -0.5, 0.5, 0.5,
-4.401084, 0.01935744, -7.472013, 1, -0.5, 0.5, 0.5,
-4.401084, 0.01935744, -7.472013, 1, 1.5, 0.5, 0.5,
-4.401084, 0.01935744, -7.472013, 0, 1.5, 0.5, 0.5
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
-4.401084, -3.931097, 0.1372283, 0, -0.5, 0.5, 0.5,
-4.401084, -3.931097, 0.1372283, 1, -0.5, 0.5, 0.5,
-4.401084, -3.931097, 0.1372283, 1, 1.5, 0.5, 0.5,
-4.401084, -3.931097, 0.1372283, 0, 1.5, 0.5, 0.5
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
-3, -3.019454, -5.716034,
3, -3.019454, -5.716034,
-3, -3.019454, -5.716034,
-3, -3.171394, -6.008697,
-2, -3.019454, -5.716034,
-2, -3.171394, -6.008697,
-1, -3.019454, -5.716034,
-1, -3.171394, -6.008697,
0, -3.019454, -5.716034,
0, -3.171394, -6.008697,
1, -3.019454, -5.716034,
1, -3.171394, -6.008697,
2, -3.019454, -5.716034,
2, -3.171394, -6.008697,
3, -3.019454, -5.716034,
3, -3.171394, -6.008697
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
-3, -3.475276, -6.594023, 0, -0.5, 0.5, 0.5,
-3, -3.475276, -6.594023, 1, -0.5, 0.5, 0.5,
-3, -3.475276, -6.594023, 1, 1.5, 0.5, 0.5,
-3, -3.475276, -6.594023, 0, 1.5, 0.5, 0.5,
-2, -3.475276, -6.594023, 0, -0.5, 0.5, 0.5,
-2, -3.475276, -6.594023, 1, -0.5, 0.5, 0.5,
-2, -3.475276, -6.594023, 1, 1.5, 0.5, 0.5,
-2, -3.475276, -6.594023, 0, 1.5, 0.5, 0.5,
-1, -3.475276, -6.594023, 0, -0.5, 0.5, 0.5,
-1, -3.475276, -6.594023, 1, -0.5, 0.5, 0.5,
-1, -3.475276, -6.594023, 1, 1.5, 0.5, 0.5,
-1, -3.475276, -6.594023, 0, 1.5, 0.5, 0.5,
0, -3.475276, -6.594023, 0, -0.5, 0.5, 0.5,
0, -3.475276, -6.594023, 1, -0.5, 0.5, 0.5,
0, -3.475276, -6.594023, 1, 1.5, 0.5, 0.5,
0, -3.475276, -6.594023, 0, 1.5, 0.5, 0.5,
1, -3.475276, -6.594023, 0, -0.5, 0.5, 0.5,
1, -3.475276, -6.594023, 1, -0.5, 0.5, 0.5,
1, -3.475276, -6.594023, 1, 1.5, 0.5, 0.5,
1, -3.475276, -6.594023, 0, 1.5, 0.5, 0.5,
2, -3.475276, -6.594023, 0, -0.5, 0.5, 0.5,
2, -3.475276, -6.594023, 1, -0.5, 0.5, 0.5,
2, -3.475276, -6.594023, 1, 1.5, 0.5, 0.5,
2, -3.475276, -6.594023, 0, 1.5, 0.5, 0.5,
3, -3.475276, -6.594023, 0, -0.5, 0.5, 0.5,
3, -3.475276, -6.594023, 1, -0.5, 0.5, 0.5,
3, -3.475276, -6.594023, 1, 1.5, 0.5, 0.5,
3, -3.475276, -6.594023, 0, 1.5, 0.5, 0.5
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
-3.388822, -2, -5.716034,
-3.388822, 2, -5.716034,
-3.388822, -2, -5.716034,
-3.557533, -2, -6.008697,
-3.388822, -1, -5.716034,
-3.557533, -1, -6.008697,
-3.388822, 0, -5.716034,
-3.557533, 0, -6.008697,
-3.388822, 1, -5.716034,
-3.557533, 1, -6.008697,
-3.388822, 2, -5.716034,
-3.557533, 2, -6.008697
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
-3.894953, -2, -6.594023, 0, -0.5, 0.5, 0.5,
-3.894953, -2, -6.594023, 1, -0.5, 0.5, 0.5,
-3.894953, -2, -6.594023, 1, 1.5, 0.5, 0.5,
-3.894953, -2, -6.594023, 0, 1.5, 0.5, 0.5,
-3.894953, -1, -6.594023, 0, -0.5, 0.5, 0.5,
-3.894953, -1, -6.594023, 1, -0.5, 0.5, 0.5,
-3.894953, -1, -6.594023, 1, 1.5, 0.5, 0.5,
-3.894953, -1, -6.594023, 0, 1.5, 0.5, 0.5,
-3.894953, 0, -6.594023, 0, -0.5, 0.5, 0.5,
-3.894953, 0, -6.594023, 1, -0.5, 0.5, 0.5,
-3.894953, 0, -6.594023, 1, 1.5, 0.5, 0.5,
-3.894953, 0, -6.594023, 0, 1.5, 0.5, 0.5,
-3.894953, 1, -6.594023, 0, -0.5, 0.5, 0.5,
-3.894953, 1, -6.594023, 1, -0.5, 0.5, 0.5,
-3.894953, 1, -6.594023, 1, 1.5, 0.5, 0.5,
-3.894953, 1, -6.594023, 0, 1.5, 0.5, 0.5,
-3.894953, 2, -6.594023, 0, -0.5, 0.5, 0.5,
-3.894953, 2, -6.594023, 1, -0.5, 0.5, 0.5,
-3.894953, 2, -6.594023, 1, 1.5, 0.5, 0.5,
-3.894953, 2, -6.594023, 0, 1.5, 0.5, 0.5
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
-3.388822, -3.019454, -4,
-3.388822, -3.019454, 4,
-3.388822, -3.019454, -4,
-3.557533, -3.171394, -4,
-3.388822, -3.019454, -2,
-3.557533, -3.171394, -2,
-3.388822, -3.019454, 0,
-3.557533, -3.171394, 0,
-3.388822, -3.019454, 2,
-3.557533, -3.171394, 2,
-3.388822, -3.019454, 4,
-3.557533, -3.171394, 4
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
-3.894953, -3.475276, -4, 0, -0.5, 0.5, 0.5,
-3.894953, -3.475276, -4, 1, -0.5, 0.5, 0.5,
-3.894953, -3.475276, -4, 1, 1.5, 0.5, 0.5,
-3.894953, -3.475276, -4, 0, 1.5, 0.5, 0.5,
-3.894953, -3.475276, -2, 0, -0.5, 0.5, 0.5,
-3.894953, -3.475276, -2, 1, -0.5, 0.5, 0.5,
-3.894953, -3.475276, -2, 1, 1.5, 0.5, 0.5,
-3.894953, -3.475276, -2, 0, 1.5, 0.5, 0.5,
-3.894953, -3.475276, 0, 0, -0.5, 0.5, 0.5,
-3.894953, -3.475276, 0, 1, -0.5, 0.5, 0.5,
-3.894953, -3.475276, 0, 1, 1.5, 0.5, 0.5,
-3.894953, -3.475276, 0, 0, 1.5, 0.5, 0.5,
-3.894953, -3.475276, 2, 0, -0.5, 0.5, 0.5,
-3.894953, -3.475276, 2, 1, -0.5, 0.5, 0.5,
-3.894953, -3.475276, 2, 1, 1.5, 0.5, 0.5,
-3.894953, -3.475276, 2, 0, 1.5, 0.5, 0.5,
-3.894953, -3.475276, 4, 0, -0.5, 0.5, 0.5,
-3.894953, -3.475276, 4, 1, -0.5, 0.5, 0.5,
-3.894953, -3.475276, 4, 1, 1.5, 0.5, 0.5,
-3.894953, -3.475276, 4, 0, 1.5, 0.5, 0.5
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
-3.388822, -3.019454, -5.716034,
-3.388822, 3.058169, -5.716034,
-3.388822, -3.019454, 5.99049,
-3.388822, 3.058169, 5.99049,
-3.388822, -3.019454, -5.716034,
-3.388822, -3.019454, 5.99049,
-3.388822, 3.058169, -5.716034,
-3.388822, 3.058169, 5.99049,
-3.388822, -3.019454, -5.716034,
3.359592, -3.019454, -5.716034,
-3.388822, -3.019454, 5.99049,
3.359592, -3.019454, 5.99049,
-3.388822, 3.058169, -5.716034,
3.359592, 3.058169, -5.716034,
-3.388822, 3.058169, 5.99049,
3.359592, 3.058169, 5.99049,
3.359592, -3.019454, -5.716034,
3.359592, 3.058169, -5.716034,
3.359592, -3.019454, 5.99049,
3.359592, 3.058169, 5.99049,
3.359592, -3.019454, -5.716034,
3.359592, -3.019454, 5.99049,
3.359592, 3.058169, -5.716034,
3.359592, 3.058169, 5.99049
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
var radius = 7.91159;
var distance = 35.19956;
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
mvMatrix.translate( 0.01461506, -0.01935744, -0.1372283 );
mvMatrix.scale( 1.267582, 1.407486, 0.7307179 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.19956);
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
antimony_potassium_t<-read.table("antimony_potassium_t.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-antimony_potassium_t$V2
```

```
## Error in eval(expr, envir, enclos): object 'antimony_potassium_t' not found
```

```r
y<-antimony_potassium_t$V3
```

```
## Error in eval(expr, envir, enclos): object 'antimony_potassium_t' not found
```

```r
z<-antimony_potassium_t$V4
```

```
## Error in eval(expr, envir, enclos): object 'antimony_potassium_t' not found
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
-3.290544, 0.6204392, -2.252861, 0, 0, 1, 1, 1,
-3.109478, 1.053999, -1.483863, 1, 0, 0, 1, 1,
-2.860305, 0.2178585, -1.211773, 1, 0, 0, 1, 1,
-2.763426, 1.727415, -1.658622, 1, 0, 0, 1, 1,
-2.729472, 1.635799, -1.339912, 1, 0, 0, 1, 1,
-2.588968, -0.8719047, -1.865836, 1, 0, 0, 1, 1,
-2.428719, -2.64241, -0.9652207, 0, 0, 0, 1, 1,
-2.394824, 0.5857757, -1.841363, 0, 0, 0, 1, 1,
-2.377186, -0.2875506, -0.8912047, 0, 0, 0, 1, 1,
-2.354039, -2.013926, -1.153242, 0, 0, 0, 1, 1,
-2.346198, -0.8307604, -1.94062, 0, 0, 0, 1, 1,
-2.246602, -0.7648057, -1.397314, 0, 0, 0, 1, 1,
-2.216864, 0.8392137, -1.146274, 0, 0, 0, 1, 1,
-2.182025, 1.525067, -1.754598, 1, 1, 1, 1, 1,
-2.176361, 1.377233, -0.3691987, 1, 1, 1, 1, 1,
-2.172824, -1.217875, -2.851894, 1, 1, 1, 1, 1,
-2.129578, -1.254766, -3.848281, 1, 1, 1, 1, 1,
-2.099271, -0.4151881, -2.281987, 1, 1, 1, 1, 1,
-2.083231, 0.4149427, -1.787376, 1, 1, 1, 1, 1,
-2.055185, -0.4995955, -2.475602, 1, 1, 1, 1, 1,
-2.014061, -0.2420125, -1.722571, 1, 1, 1, 1, 1,
-2.008878, 0.2994445, -2.065971, 1, 1, 1, 1, 1,
-2.002694, -0.2336209, -0.9173407, 1, 1, 1, 1, 1,
-1.993441, -1.382156, -2.049295, 1, 1, 1, 1, 1,
-1.988402, -0.3994862, -2.302435, 1, 1, 1, 1, 1,
-1.98002, -0.8700451, -3.297121, 1, 1, 1, 1, 1,
-1.978959, -0.387825, -2.310978, 1, 1, 1, 1, 1,
-1.97522, -0.8514934, -0.5448903, 1, 1, 1, 1, 1,
-1.970507, 0.6693634, -1.193629, 0, 0, 1, 1, 1,
-1.960715, 0.1591342, -1.463826, 1, 0, 0, 1, 1,
-1.958818, 2.872805, -0.05749499, 1, 0, 0, 1, 1,
-1.924678, 0.08319371, -0.7519687, 1, 0, 0, 1, 1,
-1.91399, 1.246244, -2.07546, 1, 0, 0, 1, 1,
-1.895549, -0.426867, -0.5505632, 1, 0, 0, 1, 1,
-1.894513, 1.192523, -1.461116, 0, 0, 0, 1, 1,
-1.894409, -0.5072458, -1.017056, 0, 0, 0, 1, 1,
-1.883164, 0.3903053, -1.267484, 0, 0, 0, 1, 1,
-1.876616, 0.457381, -1.760221, 0, 0, 0, 1, 1,
-1.86647, 1.32446, -0.4503035, 0, 0, 0, 1, 1,
-1.81992, 0.2163117, -0.504062, 0, 0, 0, 1, 1,
-1.818601, -1.165057, -3.217299, 0, 0, 0, 1, 1,
-1.808461, 0.4058008, -0.4690946, 1, 1, 1, 1, 1,
-1.800953, -1.720503, -2.245943, 1, 1, 1, 1, 1,
-1.78246, 0.1545064, -0.991261, 1, 1, 1, 1, 1,
-1.773838, -0.6096321, -1.231036, 1, 1, 1, 1, 1,
-1.771955, -0.07374124, -2.105257, 1, 1, 1, 1, 1,
-1.759163, -0.2450782, -1.894311, 1, 1, 1, 1, 1,
-1.735223, -0.1814035, -1.497604, 1, 1, 1, 1, 1,
-1.726404, 1.020291, -3.154825, 1, 1, 1, 1, 1,
-1.714022, -1.376778, -1.751354, 1, 1, 1, 1, 1,
-1.713216, -0.814491, -1.285487, 1, 1, 1, 1, 1,
-1.708126, 0.1401698, -1.829703, 1, 1, 1, 1, 1,
-1.695462, -0.838753, -2.048334, 1, 1, 1, 1, 1,
-1.684913, 1.799769, 0.4715287, 1, 1, 1, 1, 1,
-1.683184, 0.4994383, 0.6757369, 1, 1, 1, 1, 1,
-1.683106, 1.012841, -1.186068, 1, 1, 1, 1, 1,
-1.674929, -1.970775, -1.843751, 0, 0, 1, 1, 1,
-1.668928, -0.6895137, -1.844911, 1, 0, 0, 1, 1,
-1.668754, -0.6803526, -2.533409, 1, 0, 0, 1, 1,
-1.640203, 0.03765669, 0.2393367, 1, 0, 0, 1, 1,
-1.633911, -0.2318779, -1.572999, 1, 0, 0, 1, 1,
-1.623463, 0.1024289, -1.293419, 1, 0, 0, 1, 1,
-1.621253, -0.9162793, -2.629797, 0, 0, 0, 1, 1,
-1.620744, 0.1459689, -1.765417, 0, 0, 0, 1, 1,
-1.607549, 1.733021, -1.58804, 0, 0, 0, 1, 1,
-1.606731, 0.3369477, -1.002441, 0, 0, 0, 1, 1,
-1.595636, 0.5150577, -1.779559, 0, 0, 0, 1, 1,
-1.579894, 1.645429, -1.10936, 0, 0, 0, 1, 1,
-1.578105, 0.6650702, -0.9062717, 0, 0, 0, 1, 1,
-1.568941, 1.021793, -0.4863105, 1, 1, 1, 1, 1,
-1.559679, 0.7015824, -2.540091, 1, 1, 1, 1, 1,
-1.553965, -0.6602795, -1.004897, 1, 1, 1, 1, 1,
-1.551827, 0.2704381, -1.049437, 1, 1, 1, 1, 1,
-1.54223, 0.6916472, -2.496865, 1, 1, 1, 1, 1,
-1.534046, -0.9943221, -1.790907, 1, 1, 1, 1, 1,
-1.527256, -1.006045, -1.283249, 1, 1, 1, 1, 1,
-1.516551, -1.024106, -4.229558, 1, 1, 1, 1, 1,
-1.511518, 1.715778, -2.489603, 1, 1, 1, 1, 1,
-1.501587, -0.5810037, -4.217298, 1, 1, 1, 1, 1,
-1.49665, 0.1059121, -1.696443, 1, 1, 1, 1, 1,
-1.485469, 0.4155874, -2.162866, 1, 1, 1, 1, 1,
-1.48533, 0.1262569, 1.125801, 1, 1, 1, 1, 1,
-1.474831, -0.4797659, -3.446476, 1, 1, 1, 1, 1,
-1.468223, 0.1690859, -1.537799, 1, 1, 1, 1, 1,
-1.459512, 1.297153, 0.9823136, 0, 0, 1, 1, 1,
-1.452298, 0.5851924, -1.872183, 1, 0, 0, 1, 1,
-1.451486, -0.3233098, -3.224025, 1, 0, 0, 1, 1,
-1.442659, 0.4264732, -1.790321, 1, 0, 0, 1, 1,
-1.44021, -0.7268912, -1.896741, 1, 0, 0, 1, 1,
-1.428682, -1.35978, -1.93532, 1, 0, 0, 1, 1,
-1.427747, 0.2132181, -1.327721, 0, 0, 0, 1, 1,
-1.401094, -0.2768727, -3.166117, 0, 0, 0, 1, 1,
-1.38784, -1.476872, -2.436197, 0, 0, 0, 1, 1,
-1.379677, -0.3739718, -1.388036, 0, 0, 0, 1, 1,
-1.367993, -0.1201893, -1.522172, 0, 0, 0, 1, 1,
-1.360987, 1.482737, -1.275196, 0, 0, 0, 1, 1,
-1.360733, 0.7868019, -1.202981, 0, 0, 0, 1, 1,
-1.333172, -0.5395568, -4.995697, 1, 1, 1, 1, 1,
-1.331135, -0.1894669, -2.380685, 1, 1, 1, 1, 1,
-1.317275, -1.193117, -2.159231, 1, 1, 1, 1, 1,
-1.312824, 0.4012345, -1.226178, 1, 1, 1, 1, 1,
-1.307671, 1.213962, -0.7399969, 1, 1, 1, 1, 1,
-1.306042, 0.1217001, -0.8901436, 1, 1, 1, 1, 1,
-1.305032, 1.043872, -2.353896, 1, 1, 1, 1, 1,
-1.304294, 0.8567476, -1.573302, 1, 1, 1, 1, 1,
-1.302799, -0.95439, -1.87533, 1, 1, 1, 1, 1,
-1.292694, 1.012024, 0.9868822, 1, 1, 1, 1, 1,
-1.286104, -1.074159, -3.088307, 1, 1, 1, 1, 1,
-1.280839, 0.3651964, -1.785136, 1, 1, 1, 1, 1,
-1.277947, -0.03448164, -2.163149, 1, 1, 1, 1, 1,
-1.277074, 0.7775725, -1.011553, 1, 1, 1, 1, 1,
-1.276789, 1.978122, -0.6950133, 1, 1, 1, 1, 1,
-1.256928, -1.740407, -2.233855, 0, 0, 1, 1, 1,
-1.238198, 0.9072635, -0.8151689, 1, 0, 0, 1, 1,
-1.230898, -0.3041336, -2.090375, 1, 0, 0, 1, 1,
-1.229535, -0.08465752, -0.8270352, 1, 0, 0, 1, 1,
-1.222881, 1.809413, 0.008870944, 1, 0, 0, 1, 1,
-1.221721, 0.3823606, -0.1996248, 1, 0, 0, 1, 1,
-1.208619, -0.7769637, -2.513813, 0, 0, 0, 1, 1,
-1.202274, 0.9791894, 0.5344132, 0, 0, 0, 1, 1,
-1.198262, 1.044235, -0.5706022, 0, 0, 0, 1, 1,
-1.193239, 0.628688, -0.7231879, 0, 0, 0, 1, 1,
-1.18798, -1.044011, -3.460903, 0, 0, 0, 1, 1,
-1.187514, 0.6616668, -1.564171, 0, 0, 0, 1, 1,
-1.179827, 0.7628266, -1.755781, 0, 0, 0, 1, 1,
-1.17328, -0.5558275, -0.4990805, 1, 1, 1, 1, 1,
-1.161258, 0.02186474, -1.463134, 1, 1, 1, 1, 1,
-1.157146, 0.6335022, -0.3290071, 1, 1, 1, 1, 1,
-1.156787, -0.07748289, -1.125705, 1, 1, 1, 1, 1,
-1.146931, 0.362942, 0.5646856, 1, 1, 1, 1, 1,
-1.146148, -0.2185726, -1.849881, 1, 1, 1, 1, 1,
-1.144625, -0.3371018, -2.115769, 1, 1, 1, 1, 1,
-1.144002, -1.176866, -3.267437, 1, 1, 1, 1, 1,
-1.128586, -0.01286711, -2.05882, 1, 1, 1, 1, 1,
-1.125577, -0.08194075, -0.7528993, 1, 1, 1, 1, 1,
-1.125121, 0.7295732, -0.7063814, 1, 1, 1, 1, 1,
-1.11944, -1.023903, -2.331849, 1, 1, 1, 1, 1,
-1.115076, 0.04728803, -1.734601, 1, 1, 1, 1, 1,
-1.109359, -0.6499761, -3.952323, 1, 1, 1, 1, 1,
-1.103924, 0.8057088, 0.0714566, 1, 1, 1, 1, 1,
-1.103277, 1.122099, -0.1960072, 0, 0, 1, 1, 1,
-1.101301, -1.314225, -1.876297, 1, 0, 0, 1, 1,
-1.092833, -1.270616, -3.527796, 1, 0, 0, 1, 1,
-1.088539, 1.152625, -0.8660119, 1, 0, 0, 1, 1,
-1.085736, 1.257034, -1.275642, 1, 0, 0, 1, 1,
-1.084512, -2.353413, -2.465713, 1, 0, 0, 1, 1,
-1.083213, -0.3002735, -1.380458, 0, 0, 0, 1, 1,
-1.073984, 0.02755396, -0.6715919, 0, 0, 0, 1, 1,
-1.066864, 1.343849, 1.036708, 0, 0, 0, 1, 1,
-1.051582, 2.885072, 0.1288232, 0, 0, 0, 1, 1,
-1.044418, 0.2262001, 0.08445872, 0, 0, 0, 1, 1,
-1.02969, -0.6242142, -2.627728, 0, 0, 0, 1, 1,
-1.026147, 2.246969, 0.2929165, 0, 0, 0, 1, 1,
-1.024112, 0.4608853, -0.921436, 1, 1, 1, 1, 1,
-1.02013, -0.3854496, -1.434385, 1, 1, 1, 1, 1,
-1.014874, 0.8150765, 1.02153, 1, 1, 1, 1, 1,
-1.011385, 2.015258, -0.08593214, 1, 1, 1, 1, 1,
-1.002421, -0.746739, -1.800934, 1, 1, 1, 1, 1,
-0.996582, -0.7207872, -3.429254, 1, 1, 1, 1, 1,
-0.9950215, -0.2205043, -3.021507, 1, 1, 1, 1, 1,
-0.9882981, -0.03835334, 0.2077835, 1, 1, 1, 1, 1,
-0.9821032, 1.904266, -0.2516964, 1, 1, 1, 1, 1,
-0.9733873, 0.5586539, -0.4231513, 1, 1, 1, 1, 1,
-0.9661981, -1.01201, -3.514029, 1, 1, 1, 1, 1,
-0.9588189, -0.3119611, -3.371391, 1, 1, 1, 1, 1,
-0.9477344, -0.5259913, -1.274744, 1, 1, 1, 1, 1,
-0.9413093, 0.5660082, -2.081777, 1, 1, 1, 1, 1,
-0.9255224, -0.3821983, -2.004295, 1, 1, 1, 1, 1,
-0.922555, 0.8959332, -0.9383898, 0, 0, 1, 1, 1,
-0.9222821, -0.5884476, -3.143598, 1, 0, 0, 1, 1,
-0.920393, 0.3980778, 0.09914628, 1, 0, 0, 1, 1,
-0.8998524, -0.2649536, -3.374762, 1, 0, 0, 1, 1,
-0.8941956, -1.383669, -3.042728, 1, 0, 0, 1, 1,
-0.8927748, 1.568922, -1.115652, 1, 0, 0, 1, 1,
-0.8918393, 2.033187, 0.1393875, 0, 0, 0, 1, 1,
-0.8873857, 0.4538067, -2.919568, 0, 0, 0, 1, 1,
-0.8852875, 2.455817, -1.392445, 0, 0, 0, 1, 1,
-0.8847634, -0.4583752, -2.213661, 0, 0, 0, 1, 1,
-0.8830083, -1.520647, -2.106405, 0, 0, 0, 1, 1,
-0.881882, -0.2449245, -1.259047, 0, 0, 0, 1, 1,
-0.8803898, -0.9942024, -2.81369, 0, 0, 0, 1, 1,
-0.8741408, 0.8206753, 0.006959665, 1, 1, 1, 1, 1,
-0.865999, -0.3566213, -1.406733, 1, 1, 1, 1, 1,
-0.8620992, 0.6173052, -2.043319, 1, 1, 1, 1, 1,
-0.8608689, -1.271091, -3.143795, 1, 1, 1, 1, 1,
-0.8594098, 0.04334689, -1.198767, 1, 1, 1, 1, 1,
-0.8550344, 0.2348973, 0.2613945, 1, 1, 1, 1, 1,
-0.8530199, 0.8181633, -1.048199, 1, 1, 1, 1, 1,
-0.8527935, 1.446817, -0.7633498, 1, 1, 1, 1, 1,
-0.8401507, 0.2758377, -0.7376357, 1, 1, 1, 1, 1,
-0.8340681, -0.4399304, -1.878743, 1, 1, 1, 1, 1,
-0.832377, 0.792488, -0.5173933, 1, 1, 1, 1, 1,
-0.8312621, -0.2513193, -2.036529, 1, 1, 1, 1, 1,
-0.8247813, 0.7972172, -1.185731, 1, 1, 1, 1, 1,
-0.8169318, -0.07071583, -2.347094, 1, 1, 1, 1, 1,
-0.8160609, 0.242655, -0.8773926, 1, 1, 1, 1, 1,
-0.8106957, -0.1890215, -1.687444, 0, 0, 1, 1, 1,
-0.8096859, 1.625827, 0.2330429, 1, 0, 0, 1, 1,
-0.8082249, -0.1495441, -1.57999, 1, 0, 0, 1, 1,
-0.8053914, -0.9414739, -1.821944, 1, 0, 0, 1, 1,
-0.804163, -0.1616284, -1.432795, 1, 0, 0, 1, 1,
-0.8017634, 0.07897835, -0.762308, 1, 0, 0, 1, 1,
-0.801466, 0.392708, -0.6855759, 0, 0, 0, 1, 1,
-0.7944787, 0.2719616, -0.8985423, 0, 0, 0, 1, 1,
-0.7905532, 0.5556479, -0.5002066, 0, 0, 0, 1, 1,
-0.7862844, -0.968942, -1.436891, 0, 0, 0, 1, 1,
-0.7819042, -0.7641845, -3.673565, 0, 0, 0, 1, 1,
-0.7815611, 2.038372, -0.2677289, 0, 0, 0, 1, 1,
-0.780244, 0.004520549, -0.9582683, 0, 0, 0, 1, 1,
-0.7793822, 1.557795, -2.977117, 1, 1, 1, 1, 1,
-0.7758605, -0.4071784, -0.21961, 1, 1, 1, 1, 1,
-0.7741345, -1.122559, -2.851889, 1, 1, 1, 1, 1,
-0.7689241, -0.09500352, -1.072805, 1, 1, 1, 1, 1,
-0.7584072, 0.2952575, -1.496095, 1, 1, 1, 1, 1,
-0.750007, -0.4612367, -0.8613763, 1, 1, 1, 1, 1,
-0.749962, 0.3634618, -2.19316, 1, 1, 1, 1, 1,
-0.7480107, -0.996322, -0.9330561, 1, 1, 1, 1, 1,
-0.74581, -0.1091088, -3.564298, 1, 1, 1, 1, 1,
-0.7456895, -0.449303, -2.222642, 1, 1, 1, 1, 1,
-0.740889, 1.311232, -1.026575, 1, 1, 1, 1, 1,
-0.73255, 0.9981716, -1.707242, 1, 1, 1, 1, 1,
-0.7314762, -0.7818414, -2.821667, 1, 1, 1, 1, 1,
-0.7310461, -1.174613, -0.9811335, 1, 1, 1, 1, 1,
-0.7307692, -0.261941, -3.303517, 1, 1, 1, 1, 1,
-0.7287338, -0.08985864, -2.840393, 0, 0, 1, 1, 1,
-0.7216134, 1.64225, -0.7318555, 1, 0, 0, 1, 1,
-0.7212649, -0.8188879, -3.61075, 1, 0, 0, 1, 1,
-0.7129472, 0.4938546, -1.97129, 1, 0, 0, 1, 1,
-0.7089006, -0.8298954, -2.390879, 1, 0, 0, 1, 1,
-0.6984988, 0.4185014, 1.757985, 1, 0, 0, 1, 1,
-0.6964231, -0.4955647, -2.123563, 0, 0, 0, 1, 1,
-0.6915302, 0.4524574, -2.227777, 0, 0, 0, 1, 1,
-0.6875598, -0.3107767, -1.261013, 0, 0, 0, 1, 1,
-0.684712, -1.574581, -2.562239, 0, 0, 0, 1, 1,
-0.6798819, 0.03733017, -0.3520346, 0, 0, 0, 1, 1,
-0.6797517, -0.2453229, -1.82249, 0, 0, 0, 1, 1,
-0.6790922, 0.910026, 0.2383821, 0, 0, 0, 1, 1,
-0.6757759, -0.6436648, -0.8411391, 1, 1, 1, 1, 1,
-0.6744602, 0.1671152, -1.974068, 1, 1, 1, 1, 1,
-0.6739652, -1.317849, -4.198508, 1, 1, 1, 1, 1,
-0.6730587, -0.70006, -0.06818843, 1, 1, 1, 1, 1,
-0.671716, 0.2098581, -0.5613586, 1, 1, 1, 1, 1,
-0.6692674, -1.449677, -3.936435, 1, 1, 1, 1, 1,
-0.6658689, 1.086261, -1.706123, 1, 1, 1, 1, 1,
-0.6566756, -0.3380927, -0.7021876, 1, 1, 1, 1, 1,
-0.6556299, -1.478161, -2.328427, 1, 1, 1, 1, 1,
-0.6512225, -0.156121, -2.277917, 1, 1, 1, 1, 1,
-0.6486238, 0.1542896, -1.058628, 1, 1, 1, 1, 1,
-0.644571, -0.7797196, -1.665611, 1, 1, 1, 1, 1,
-0.6436165, 0.4441974, 0.3710233, 1, 1, 1, 1, 1,
-0.6432281, 1.401571, -0.7568612, 1, 1, 1, 1, 1,
-0.6392218, 0.4506351, -1.820187, 1, 1, 1, 1, 1,
-0.6357192, -0.6123634, -3.249131, 0, 0, 1, 1, 1,
-0.6267711, -0.3815731, -2.190176, 1, 0, 0, 1, 1,
-0.6262324, -0.2379317, -2.099552, 1, 0, 0, 1, 1,
-0.6253285, 0.199897, -1.768906, 1, 0, 0, 1, 1,
-0.6229696, 1.213048, -0.7741438, 1, 0, 0, 1, 1,
-0.6160893, 1.408926, -2.389174, 1, 0, 0, 1, 1,
-0.6151915, 0.1706483, -0.9471313, 0, 0, 0, 1, 1,
-0.6033204, -0.1324283, -1.69664, 0, 0, 0, 1, 1,
-0.6020588, 1.282797, -2.898499, 0, 0, 0, 1, 1,
-0.5944374, -0.7758831, -3.191003, 0, 0, 0, 1, 1,
-0.5887447, 0.08001622, 0.1431112, 0, 0, 0, 1, 1,
-0.5865048, -0.3498002, -1.221844, 0, 0, 0, 1, 1,
-0.5851435, 0.106996, -2.71014, 0, 0, 0, 1, 1,
-0.5839645, 0.6927799, -0.3999375, 1, 1, 1, 1, 1,
-0.5826072, 0.2818361, 0.4146182, 1, 1, 1, 1, 1,
-0.5738367, -1.924586, -4.110929, 1, 1, 1, 1, 1,
-0.5735974, -0.1595784, -2.737787, 1, 1, 1, 1, 1,
-0.5730134, 1.059963, -1.61213, 1, 1, 1, 1, 1,
-0.570657, 1.681564, 0.8809409, 1, 1, 1, 1, 1,
-0.5670272, -0.01575319, -0.2488903, 1, 1, 1, 1, 1,
-0.5650784, 0.5714915, -1.747321, 1, 1, 1, 1, 1,
-0.5637811, -0.4120099, -1.256868, 1, 1, 1, 1, 1,
-0.5636556, -1.123006, -1.712919, 1, 1, 1, 1, 1,
-0.5623757, -0.3057371, -2.41529, 1, 1, 1, 1, 1,
-0.5608385, 0.3650311, -0.1405144, 1, 1, 1, 1, 1,
-0.5553083, -0.3683497, -1.175282, 1, 1, 1, 1, 1,
-0.5532282, -0.4622931, -1.759988, 1, 1, 1, 1, 1,
-0.5527341, -1.019541, -2.413493, 1, 1, 1, 1, 1,
-0.5523515, 1.391103, 0.0418958, 0, 0, 1, 1, 1,
-0.5509573, 0.8624069, -1.247181, 1, 0, 0, 1, 1,
-0.5475418, -0.9395915, -1.690995, 1, 0, 0, 1, 1,
-0.5460919, -0.03668077, -2.358986, 1, 0, 0, 1, 1,
-0.5402846, -0.9498374, -1.166479, 1, 0, 0, 1, 1,
-0.5393685, 0.2153458, -1.586785, 1, 0, 0, 1, 1,
-0.5387705, -1.102702, -1.973006, 0, 0, 0, 1, 1,
-0.5333695, 0.602909, 0.8510493, 0, 0, 0, 1, 1,
-0.5311868, 0.4236284, 0.8907043, 0, 0, 0, 1, 1,
-0.5302274, 0.4827516, 0.3011493, 0, 0, 0, 1, 1,
-0.529563, 0.8614047, -2.428958, 0, 0, 0, 1, 1,
-0.5287113, -0.7465805, -4.690809, 0, 0, 0, 1, 1,
-0.5214178, 0.6426713, -1.502608, 0, 0, 0, 1, 1,
-0.5181499, 1.240344, 0.1154132, 1, 1, 1, 1, 1,
-0.5178326, -0.9392018, -3.050173, 1, 1, 1, 1, 1,
-0.5162461, 0.5614021, -0.5597875, 1, 1, 1, 1, 1,
-0.5153748, 0.1567632, 0.6132354, 1, 1, 1, 1, 1,
-0.5127073, 0.8224438, -1.354424, 1, 1, 1, 1, 1,
-0.5046961, 0.1266056, 0.1461207, 1, 1, 1, 1, 1,
-0.5027471, 0.3581911, 0.6422537, 1, 1, 1, 1, 1,
-0.5000188, 0.9550277, -0.5929692, 1, 1, 1, 1, 1,
-0.4992304, 0.4073034, -0.06683341, 1, 1, 1, 1, 1,
-0.4984739, -0.3357581, 0.9900529, 1, 1, 1, 1, 1,
-0.494181, 0.187226, -1.700451, 1, 1, 1, 1, 1,
-0.4932424, 2.190804, -0.08506951, 1, 1, 1, 1, 1,
-0.4893495, 0.2837619, -0.712867, 1, 1, 1, 1, 1,
-0.4798163, -0.4123001, -1.904647, 1, 1, 1, 1, 1,
-0.4782919, 1.73703, -0.8864156, 1, 1, 1, 1, 1,
-0.4753033, 1.551731, 0.6229737, 0, 0, 1, 1, 1,
-0.4742857, 0.1695207, -2.900178, 1, 0, 0, 1, 1,
-0.4735462, -0.5013809, -3.08072, 1, 0, 0, 1, 1,
-0.4672606, -1.257441, -4.133233, 1, 0, 0, 1, 1,
-0.4661355, 2.007703, -1.505545, 1, 0, 0, 1, 1,
-0.4615237, -0.8629708, -3.624306, 1, 0, 0, 1, 1,
-0.4596666, 2.443453, 0.4458208, 0, 0, 0, 1, 1,
-0.4565436, 0.3838678, -1.764788, 0, 0, 0, 1, 1,
-0.4541652, 1.263115, -0.8453436, 0, 0, 0, 1, 1,
-0.4521613, -0.1582564, -0.152354, 0, 0, 0, 1, 1,
-0.4489562, -0.32656, -2.202519, 0, 0, 0, 1, 1,
-0.4477709, -2.369434, -2.893155, 0, 0, 0, 1, 1,
-0.4460298, -0.4273176, -2.829457, 0, 0, 0, 1, 1,
-0.4410108, -0.8751532, -1.699553, 1, 1, 1, 1, 1,
-0.4403362, 0.6293663, -3.400924, 1, 1, 1, 1, 1,
-0.4372236, 0.5795229, -0.7376423, 1, 1, 1, 1, 1,
-0.4330601, 0.3136008, -3.420689, 1, 1, 1, 1, 1,
-0.4316373, -0.6914669, -3.787313, 1, 1, 1, 1, 1,
-0.4290549, 0.6150279, -2.281463, 1, 1, 1, 1, 1,
-0.4272547, 0.2581717, -0.5277117, 1, 1, 1, 1, 1,
-0.4209937, 0.4789536, -0.3477413, 1, 1, 1, 1, 1,
-0.4104496, 1.424402, -1.043, 1, 1, 1, 1, 1,
-0.4103826, 0.4195731, -0.7901047, 1, 1, 1, 1, 1,
-0.4042398, 1.867899, -0.4574187, 1, 1, 1, 1, 1,
-0.4028618, 0.8538064, -0.681601, 1, 1, 1, 1, 1,
-0.4018922, -0.2357258, -3.28096, 1, 1, 1, 1, 1,
-0.3980436, -0.07099663, -0.9410569, 1, 1, 1, 1, 1,
-0.3967195, -0.4246063, -2.024832, 1, 1, 1, 1, 1,
-0.3913488, -1.96479, -2.409342, 0, 0, 1, 1, 1,
-0.3883824, 0.8069689, 1.880843, 1, 0, 0, 1, 1,
-0.3866724, 0.1372208, -0.0830883, 1, 0, 0, 1, 1,
-0.3855708, 0.7304453, -0.2016834, 1, 0, 0, 1, 1,
-0.382975, 0.5998462, -1.072768, 1, 0, 0, 1, 1,
-0.3813767, 1.309687, 0.6158809, 1, 0, 0, 1, 1,
-0.3759937, 1.503628, -1.411333, 0, 0, 0, 1, 1,
-0.3746413, 0.1056432, 0.4510387, 0, 0, 0, 1, 1,
-0.3714813, -0.3887713, -2.175294, 0, 0, 0, 1, 1,
-0.3681919, 0.2075003, -0.7463261, 0, 0, 0, 1, 1,
-0.3675066, 0.5043072, 0.1893698, 0, 0, 0, 1, 1,
-0.3666011, 0.391121, -2.487157, 0, 0, 0, 1, 1,
-0.3664643, 0.7431642, 0.5720881, 0, 0, 0, 1, 1,
-0.3660517, -0.4642265, -0.317591, 1, 1, 1, 1, 1,
-0.3634749, 0.6985573, -0.4743331, 1, 1, 1, 1, 1,
-0.3610642, -1.573263, -4.474152, 1, 1, 1, 1, 1,
-0.3522371, -1.29134, -1.284604, 1, 1, 1, 1, 1,
-0.3513803, -0.0853989, -1.114097, 1, 1, 1, 1, 1,
-0.3510135, -1.556252, -1.994917, 1, 1, 1, 1, 1,
-0.3473596, -0.02529659, -2.265319, 1, 1, 1, 1, 1,
-0.3438465, -0.9686775, -2.370648, 1, 1, 1, 1, 1,
-0.3417751, -1.066363, -3.361418, 1, 1, 1, 1, 1,
-0.3404925, -0.4452039, -2.198489, 1, 1, 1, 1, 1,
-0.3372615, 2.323154, -0.2146244, 1, 1, 1, 1, 1,
-0.3360992, 1.180001, 0.1422357, 1, 1, 1, 1, 1,
-0.3349636, -2.190404, -5.38648, 1, 1, 1, 1, 1,
-0.3267951, 1.930639, -0.669385, 1, 1, 1, 1, 1,
-0.3239544, -0.543196, -2.366188, 1, 1, 1, 1, 1,
-0.322406, -0.7396927, -2.122442, 0, 0, 1, 1, 1,
-0.3192559, -0.9664014, -3.520829, 1, 0, 0, 1, 1,
-0.3188222, 1.009921, -0.0535773, 1, 0, 0, 1, 1,
-0.3178532, -1.08522, -5.54555, 1, 0, 0, 1, 1,
-0.3151136, 0.05446972, -1.508641, 1, 0, 0, 1, 1,
-0.3132478, -1.495605, -1.716487, 1, 0, 0, 1, 1,
-0.2992492, -0.01521239, -1.431697, 0, 0, 0, 1, 1,
-0.299098, -2.022867, -1.004581, 0, 0, 0, 1, 1,
-0.2989465, -1.356784, -2.619842, 0, 0, 0, 1, 1,
-0.2971874, 0.8978152, -0.9118251, 0, 0, 0, 1, 1,
-0.2965364, 1.166422, 0.4862264, 0, 0, 0, 1, 1,
-0.2961971, 1.626596, 0.3952758, 0, 0, 0, 1, 1,
-0.294923, -0.6557637, -3.185006, 0, 0, 0, 1, 1,
-0.2946908, 1.232748, -0.2095335, 1, 1, 1, 1, 1,
-0.2812227, 1.190947, 1.032179, 1, 1, 1, 1, 1,
-0.2685747, 1.208581, -0.2724493, 1, 1, 1, 1, 1,
-0.2683055, -0.6082616, -2.896746, 1, 1, 1, 1, 1,
-0.2649969, 0.3301084, -0.8871151, 1, 1, 1, 1, 1,
-0.2628646, 0.4347658, 0.7729275, 1, 1, 1, 1, 1,
-0.2624488, 2.554255, -1.03369, 1, 1, 1, 1, 1,
-0.2585386, 0.01873991, -2.850606, 1, 1, 1, 1, 1,
-0.2552046, -0.4657527, -3.098271, 1, 1, 1, 1, 1,
-0.2491582, -0.180392, 0.1301447, 1, 1, 1, 1, 1,
-0.24038, -1.334188, -2.168412, 1, 1, 1, 1, 1,
-0.2400613, -0.7095208, -3.590657, 1, 1, 1, 1, 1,
-0.2390448, -0.05169104, 0.9595656, 1, 1, 1, 1, 1,
-0.2385332, -0.5385481, -3.588166, 1, 1, 1, 1, 1,
-0.2374042, -0.9332848, -1.693701, 1, 1, 1, 1, 1,
-0.2372898, -0.8097437, -2.510164, 0, 0, 1, 1, 1,
-0.2306165, 0.9374959, -1.656108, 1, 0, 0, 1, 1,
-0.2299137, -2.354076, -2.128381, 1, 0, 0, 1, 1,
-0.2272949, -0.07426614, -0.7135217, 1, 0, 0, 1, 1,
-0.22145, -0.6178676, -3.109563, 1, 0, 0, 1, 1,
-0.2207665, 0.7659919, 0.3632617, 1, 0, 0, 1, 1,
-0.2205119, 0.2619359, -0.9247347, 0, 0, 0, 1, 1,
-0.2186352, 0.07057811, 0.3493088, 0, 0, 0, 1, 1,
-0.2176043, -1.88418, -3.619187, 0, 0, 0, 1, 1,
-0.2152991, 0.452278, -2.122249, 0, 0, 0, 1, 1,
-0.2121809, -1.013796, -3.287355, 0, 0, 0, 1, 1,
-0.2028791, 1.320664, 0.8607571, 0, 0, 0, 1, 1,
-0.2001011, 0.5645387, -0.07401348, 0, 0, 0, 1, 1,
-0.1996282, 0.3889326, -1.051614, 1, 1, 1, 1, 1,
-0.1975473, 0.2394465, -0.03926267, 1, 1, 1, 1, 1,
-0.1914068, -0.6789657, -3.235207, 1, 1, 1, 1, 1,
-0.1902402, 0.5060611, -0.5233055, 1, 1, 1, 1, 1,
-0.1900992, -2.381322, -2.919338, 1, 1, 1, 1, 1,
-0.1900605, 0.5285442, 0.4576744, 1, 1, 1, 1, 1,
-0.1898579, 0.404854, -1.452949, 1, 1, 1, 1, 1,
-0.188548, -0.8564909, -5.209764, 1, 1, 1, 1, 1,
-0.1872396, -1.075276, -2.164501, 1, 1, 1, 1, 1,
-0.1849913, 1.152024, -1.009006, 1, 1, 1, 1, 1,
-0.1840578, -0.4478578, -3.311855, 1, 1, 1, 1, 1,
-0.1715149, 0.7505324, 1.07072, 1, 1, 1, 1, 1,
-0.1714806, -0.6388177, -1.609461, 1, 1, 1, 1, 1,
-0.1701307, -2.063891, -3.349125, 1, 1, 1, 1, 1,
-0.1694079, -0.5146092, -3.691774, 1, 1, 1, 1, 1,
-0.1639993, 0.8657168, -0.02322585, 0, 0, 1, 1, 1,
-0.1625912, 0.00614679, -2.963916, 1, 0, 0, 1, 1,
-0.1554327, 0.3480422, 1.803158, 1, 0, 0, 1, 1,
-0.1510162, -0.4426672, -1.356774, 1, 0, 0, 1, 1,
-0.1496784, 0.836737, 1.321306, 1, 0, 0, 1, 1,
-0.1405197, 1.335064, 1.269177, 1, 0, 0, 1, 1,
-0.1383373, 0.4754349, 0.3404467, 0, 0, 0, 1, 1,
-0.1381077, -0.402936, -2.608282, 0, 0, 0, 1, 1,
-0.1375689, -0.7205386, -3.006345, 0, 0, 0, 1, 1,
-0.1352684, 0.3432527, -0.3423347, 0, 0, 0, 1, 1,
-0.1341963, 0.4717195, 0.5841208, 0, 0, 0, 1, 1,
-0.1332095, 0.5474619, 0.3578912, 0, 0, 0, 1, 1,
-0.1313805, -1.219159, -3.726067, 0, 0, 0, 1, 1,
-0.1288734, 0.1124886, 0.08399276, 1, 1, 1, 1, 1,
-0.1269666, 0.2344395, 0.4339831, 1, 1, 1, 1, 1,
-0.1261496, 0.9353902, -1.242619, 1, 1, 1, 1, 1,
-0.1203106, 0.4205801, -0.03097581, 1, 1, 1, 1, 1,
-0.1185889, 1.327923, 1.609566, 1, 1, 1, 1, 1,
-0.1174974, 0.2739351, -1.08951, 1, 1, 1, 1, 1,
-0.1168233, 2.093685, -1.729832, 1, 1, 1, 1, 1,
-0.11457, 0.1713531, -0.5775461, 1, 1, 1, 1, 1,
-0.1120731, -0.006506754, -2.029398, 1, 1, 1, 1, 1,
-0.1078082, -1.481006, -2.653017, 1, 1, 1, 1, 1,
-0.1042217, -0.1047688, -3.205978, 1, 1, 1, 1, 1,
-0.1010218, 0.01905586, -1.786459, 1, 1, 1, 1, 1,
-0.1007274, 0.3131151, -0.4106884, 1, 1, 1, 1, 1,
-0.09350137, 0.120322, -1.967861, 1, 1, 1, 1, 1,
-0.09319171, -0.01279635, -0.7769473, 1, 1, 1, 1, 1,
-0.09127812, -1.529424, -3.445338, 0, 0, 1, 1, 1,
-0.08642823, -0.5752195, -4.717288, 1, 0, 0, 1, 1,
-0.08348937, 0.3527629, -1.220112, 1, 0, 0, 1, 1,
-0.07748698, 1.210329, 0.1082356, 1, 0, 0, 1, 1,
-0.07327115, 1.405624, 0.1334044, 1, 0, 0, 1, 1,
-0.07100913, 0.3862332, 0.5072086, 1, 0, 0, 1, 1,
-0.07002739, 0.873328, 2.076835, 0, 0, 0, 1, 1,
-0.06737223, 0.7497934, -0.3645374, 0, 0, 0, 1, 1,
-0.06656697, -0.9710359, -2.904295, 0, 0, 0, 1, 1,
-0.06306032, 0.184024, 0.6356533, 0, 0, 0, 1, 1,
-0.05519224, 0.5363286, 0.6044651, 0, 0, 0, 1, 1,
-0.05380375, 0.2286529, -1.092825, 0, 0, 0, 1, 1,
-0.05247273, 0.6790639, -0.7557339, 0, 0, 0, 1, 1,
-0.05210041, -1.375078, -3.562082, 1, 1, 1, 1, 1,
-0.05033417, 0.3569426, -1.758567, 1, 1, 1, 1, 1,
-0.04971622, 0.5573382, -1.593367, 1, 1, 1, 1, 1,
-0.04888843, 0.6442528, -0.2867603, 1, 1, 1, 1, 1,
-0.04860912, 1.272557, -0.1509691, 1, 1, 1, 1, 1,
-0.04563544, -1.286355, -3.795785, 1, 1, 1, 1, 1,
-0.04524907, -0.5324486, -1.693117, 1, 1, 1, 1, 1,
-0.04463932, -0.6719096, -3.850587, 1, 1, 1, 1, 1,
-0.03175794, -0.8597646, -1.514971, 1, 1, 1, 1, 1,
-0.02972773, -0.5014492, -2.016999, 1, 1, 1, 1, 1,
-0.02754082, 1.026553, -1.900214, 1, 1, 1, 1, 1,
-0.02163919, -1.211497, -3.770407, 1, 1, 1, 1, 1,
-0.0197726, 1.470483, 0.8553936, 1, 1, 1, 1, 1,
-0.01843674, -0.01513249, -2.496946, 1, 1, 1, 1, 1,
-0.01716164, 0.9275466, -0.2010197, 1, 1, 1, 1, 1,
-0.01645654, 0.78394, 1.164805, 0, 0, 1, 1, 1,
-0.01582578, 0.210279, 0.07142246, 1, 0, 0, 1, 1,
-0.01487029, -0.2525638, -2.684442, 1, 0, 0, 1, 1,
-0.01418164, 1.590525, -0.2337534, 1, 0, 0, 1, 1,
-0.01073487, 0.3976031, -1.345303, 1, 0, 0, 1, 1,
-0.002115814, 0.8296303, -1.824435, 1, 0, 0, 1, 1,
-0.001789588, 0.5463716, 1.633557, 0, 0, 0, 1, 1,
-0.0004014465, 0.3059626, -0.1831398, 0, 0, 0, 1, 1,
0.000665777, 0.5188338, 0.225279, 0, 0, 0, 1, 1,
0.003522301, -0.595347, 2.983108, 0, 0, 0, 1, 1,
0.005703372, 0.3022066, -0.7852058, 0, 0, 0, 1, 1,
0.008032143, 1.519905, 0.672752, 0, 0, 0, 1, 1,
0.01223554, 1.397268, -0.05382538, 0, 0, 0, 1, 1,
0.01377274, -0.9010482, 2.147862, 1, 1, 1, 1, 1,
0.0202045, 1.963387, -0.4851939, 1, 1, 1, 1, 1,
0.02203783, -0.1395013, 4.101063, 1, 1, 1, 1, 1,
0.02834477, -1.542026, 2.14249, 1, 1, 1, 1, 1,
0.03175357, 0.7509304, -0.119761, 1, 1, 1, 1, 1,
0.03226965, -1.445469, 1.950529, 1, 1, 1, 1, 1,
0.03493294, 0.8041399, -0.8504257, 1, 1, 1, 1, 1,
0.03791988, -0.4456047, 3.765163, 1, 1, 1, 1, 1,
0.04414204, -2.61432, 2.519101, 1, 1, 1, 1, 1,
0.04478516, -1.290956, 2.924447, 1, 1, 1, 1, 1,
0.04491525, -0.1334206, 2.613865, 1, 1, 1, 1, 1,
0.04679626, 0.9847198, 0.6540619, 1, 1, 1, 1, 1,
0.04734587, -0.7352883, 4.505806, 1, 1, 1, 1, 1,
0.04840979, -0.5142813, 2.537623, 1, 1, 1, 1, 1,
0.05044161, -1.738238, 1.972089, 1, 1, 1, 1, 1,
0.05396475, 0.9346963, -0.3152863, 0, 0, 1, 1, 1,
0.05699509, -0.7552125, 3.729648, 1, 0, 0, 1, 1,
0.06314555, 1.636001, -1.924604, 1, 0, 0, 1, 1,
0.06685438, -1.500425, 5.820007, 1, 0, 0, 1, 1,
0.06892239, -1.026721, 2.557169, 1, 0, 0, 1, 1,
0.06943324, 0.4972597, -0.8353876, 1, 0, 0, 1, 1,
0.07009073, 1.499984, 0.9779279, 0, 0, 0, 1, 1,
0.07114336, 0.09887527, -0.2169084, 0, 0, 0, 1, 1,
0.07273084, 0.01610932, 2.624141, 0, 0, 0, 1, 1,
0.07412555, -0.8110829, 3.859952, 0, 0, 0, 1, 1,
0.0778231, 1.759241, -1.122863, 0, 0, 0, 1, 1,
0.08350341, 0.151481, 0.3357773, 0, 0, 0, 1, 1,
0.08742393, -1.969921, 2.022222, 0, 0, 0, 1, 1,
0.08852957, 0.4299713, 0.4395323, 1, 1, 1, 1, 1,
0.08942495, 1.990128, 0.5961152, 1, 1, 1, 1, 1,
0.09008219, -0.4080704, 3.213234, 1, 1, 1, 1, 1,
0.09288093, 0.6766399, 1.264993, 1, 1, 1, 1, 1,
0.09473328, 1.019238, 1.25696, 1, 1, 1, 1, 1,
0.09673771, -0.4310671, 3.066806, 1, 1, 1, 1, 1,
0.09710813, -1.054935, 0.3480445, 1, 1, 1, 1, 1,
0.09737975, 0.2701015, -0.5905065, 1, 1, 1, 1, 1,
0.1075753, 0.6814622, 0.6708723, 1, 1, 1, 1, 1,
0.1080587, 0.3484017, 0.5107712, 1, 1, 1, 1, 1,
0.109658, 0.3218171, 1.279796, 1, 1, 1, 1, 1,
0.1140747, 1.471538, 0.4438171, 1, 1, 1, 1, 1,
0.1160785, 0.4190063, -1.431881, 1, 1, 1, 1, 1,
0.1172601, 0.9604247, -0.3117011, 1, 1, 1, 1, 1,
0.118692, 0.6613402, -0.8618448, 1, 1, 1, 1, 1,
0.1214141, -0.2808973, 3.181111, 0, 0, 1, 1, 1,
0.1262049, 0.9905503, 2.056866, 1, 0, 0, 1, 1,
0.1268564, -1.424107, 2.680106, 1, 0, 0, 1, 1,
0.1275693, 0.3992737, -0.7670069, 1, 0, 0, 1, 1,
0.1277553, -0.7954424, 2.544616, 1, 0, 0, 1, 1,
0.1278705, -0.3151609, 1.366174, 1, 0, 0, 1, 1,
0.1299946, 1.059432, 1.616483, 0, 0, 0, 1, 1,
0.1350073, 1.062058, -0.02056765, 0, 0, 0, 1, 1,
0.135643, -1.702352, 1.949805, 0, 0, 0, 1, 1,
0.138991, 0.09237894, -0.2459201, 0, 0, 0, 1, 1,
0.1434477, 0.4402339, 1.777303, 0, 0, 0, 1, 1,
0.1436423, -0.9086152, 1.534453, 0, 0, 0, 1, 1,
0.1441998, 1.144728, 1.129552, 0, 0, 0, 1, 1,
0.1485487, -2.027408, 2.407676, 1, 1, 1, 1, 1,
0.1493969, -0.32356, 1.105693, 1, 1, 1, 1, 1,
0.153982, 0.1359168, 0.1964302, 1, 1, 1, 1, 1,
0.154822, -0.1452001, 3.922418, 1, 1, 1, 1, 1,
0.1549467, 0.7885743, 0.5426147, 1, 1, 1, 1, 1,
0.15614, -0.1527043, 1.5147, 1, 1, 1, 1, 1,
0.1612977, -1.113431, 2.976051, 1, 1, 1, 1, 1,
0.1638811, 0.1395297, -0.09835884, 1, 1, 1, 1, 1,
0.1649612, -0.7157181, 2.650241, 1, 1, 1, 1, 1,
0.1696493, 1.072224, -1.134993, 1, 1, 1, 1, 1,
0.1697756, -0.2511764, 2.452915, 1, 1, 1, 1, 1,
0.172107, 1.28892, 0.210828, 1, 1, 1, 1, 1,
0.1751046, 1.061959, -0.6875275, 1, 1, 1, 1, 1,
0.1770248, 0.1136075, 0.8306388, 1, 1, 1, 1, 1,
0.1795951, -2.331764, 2.567718, 1, 1, 1, 1, 1,
0.1802578, -1.7243, 3.383514, 0, 0, 1, 1, 1,
0.1843296, 1.684407, 0.1806568, 1, 0, 0, 1, 1,
0.1894364, 1.068852, 0.4818358, 1, 0, 0, 1, 1,
0.1901656, -0.9194862, 2.164645, 1, 0, 0, 1, 1,
0.1945431, 1.260012, -1.181062, 1, 0, 0, 1, 1,
0.1960069, -0.7839503, 3.347248, 1, 0, 0, 1, 1,
0.1986872, -1.3482, 3.273415, 0, 0, 0, 1, 1,
0.1988166, -0.8302112, 3.017691, 0, 0, 0, 1, 1,
0.201324, 1.185462, 0.8048252, 0, 0, 0, 1, 1,
0.2013892, 0.3228579, 0.4729953, 0, 0, 0, 1, 1,
0.2061162, 0.6912388, -0.958707, 0, 0, 0, 1, 1,
0.2074556, 2.96966, 1.17466, 0, 0, 0, 1, 1,
0.2076217, -0.5138502, 1.175437, 0, 0, 0, 1, 1,
0.2090096, 0.9907368, 1.583309, 1, 1, 1, 1, 1,
0.213057, -1.072946, 3.734788, 1, 1, 1, 1, 1,
0.2131701, 0.4359571, 0.5095356, 1, 1, 1, 1, 1,
0.2149574, -1.00618, 1.654686, 1, 1, 1, 1, 1,
0.2168476, 1.244176, -0.3719203, 1, 1, 1, 1, 1,
0.2193437, -2.125542, 3.516239, 1, 1, 1, 1, 1,
0.2201253, -2.086, 1.405034, 1, 1, 1, 1, 1,
0.2237436, -0.1589118, 1.235171, 1, 1, 1, 1, 1,
0.2273466, 0.2026309, 0.7578304, 1, 1, 1, 1, 1,
0.2294123, 0.2867282, 0.7073981, 1, 1, 1, 1, 1,
0.2306912, -0.8885931, 2.42254, 1, 1, 1, 1, 1,
0.2311084, -0.958871, 0.9751896, 1, 1, 1, 1, 1,
0.2316732, -0.5661461, 3.321097, 1, 1, 1, 1, 1,
0.2318934, -1.529433, 1.95459, 1, 1, 1, 1, 1,
0.2326145, -0.2237082, 1.05953, 1, 1, 1, 1, 1,
0.2329633, 1.140693, -0.744471, 0, 0, 1, 1, 1,
0.2359383, -0.3869001, 4.316677, 1, 0, 0, 1, 1,
0.2437879, -0.9893541, 2.366322, 1, 0, 0, 1, 1,
0.2487284, -0.3487055, 2.136467, 1, 0, 0, 1, 1,
0.2532072, 0.8553683, 0.5399218, 1, 0, 0, 1, 1,
0.2646984, -0.243638, 3.350552, 1, 0, 0, 1, 1,
0.267106, 0.6437509, 0.07451844, 0, 0, 0, 1, 1,
0.2698217, -1.406632, 3.141953, 0, 0, 0, 1, 1,
0.2740767, -0.847872, 2.743481, 0, 0, 0, 1, 1,
0.2787178, 1.395212, 2.874833, 0, 0, 0, 1, 1,
0.2791728, -0.4713879, 3.770332, 0, 0, 0, 1, 1,
0.2802466, -1.30968, 3.054673, 0, 0, 0, 1, 1,
0.2803214, 0.4419289, 2.285236, 0, 0, 0, 1, 1,
0.2875517, -0.6426483, 4.059848, 1, 1, 1, 1, 1,
0.2923103, 0.4118361, -0.2348854, 1, 1, 1, 1, 1,
0.2928096, 0.4107192, 0.8878488, 1, 1, 1, 1, 1,
0.2979183, -1.454837, 1.43662, 1, 1, 1, 1, 1,
0.3035564, -1.92558, 1.218614, 1, 1, 1, 1, 1,
0.3060441, -0.7183654, 4.765066, 1, 1, 1, 1, 1,
0.3077368, -0.9487428, 1.866843, 1, 1, 1, 1, 1,
0.3086985, -1.661075, 2.693169, 1, 1, 1, 1, 1,
0.3117991, -0.37016, 2.154249, 1, 1, 1, 1, 1,
0.3124439, 0.3362369, 0.8205455, 1, 1, 1, 1, 1,
0.312612, 0.6802283, 0.1600477, 1, 1, 1, 1, 1,
0.3139038, -1.381086, 4.163494, 1, 1, 1, 1, 1,
0.3302661, 1.926178, -1.736156, 1, 1, 1, 1, 1,
0.3308379, -1.791689, 3.632481, 1, 1, 1, 1, 1,
0.3411422, 0.4565191, 0.7137011, 1, 1, 1, 1, 1,
0.3411646, 0.03819314, 0.1682288, 0, 0, 1, 1, 1,
0.342277, -1.212135, 2.572008, 1, 0, 0, 1, 1,
0.3468818, 2.651148, 0.1064331, 1, 0, 0, 1, 1,
0.3469082, -1.356717, 3.488295, 1, 0, 0, 1, 1,
0.3482294, 1.042746, -0.4672025, 1, 0, 0, 1, 1,
0.3499648, -0.1757341, 0.05696494, 1, 0, 0, 1, 1,
0.3506488, 1.263341, 1.216182, 0, 0, 0, 1, 1,
0.3513772, -0.4274162, 0.5594402, 0, 0, 0, 1, 1,
0.3525165, 0.2487859, 1.739359, 0, 0, 0, 1, 1,
0.3543285, 0.8542905, 2.353285, 0, 0, 0, 1, 1,
0.3600405, 1.316295, -0.06191863, 0, 0, 0, 1, 1,
0.3610474, -0.02126925, 1.433708, 0, 0, 0, 1, 1,
0.3611296, -0.6767788, 1.891131, 0, 0, 0, 1, 1,
0.3637636, -1.407687, 3.37455, 1, 1, 1, 1, 1,
0.3649887, 0.7985431, -1.440168, 1, 1, 1, 1, 1,
0.3686394, 0.1590937, 1.387674, 1, 1, 1, 1, 1,
0.3727671, 0.03055594, 1.350037, 1, 1, 1, 1, 1,
0.3757039, -0.7948058, 3.538713, 1, 1, 1, 1, 1,
0.3760724, -0.5492595, 3.092638, 1, 1, 1, 1, 1,
0.3766429, 0.00368988, 0.01021043, 1, 1, 1, 1, 1,
0.3780925, 0.2159168, 1.467337, 1, 1, 1, 1, 1,
0.3781661, 1.211946, -0.8318549, 1, 1, 1, 1, 1,
0.3781674, -0.9686695, 2.84211, 1, 1, 1, 1, 1,
0.3799331, -0.3592833, 2.823706, 1, 1, 1, 1, 1,
0.3810855, 0.9058549, 0.669322, 1, 1, 1, 1, 1,
0.38183, 0.7187871, 0.1922524, 1, 1, 1, 1, 1,
0.3819942, 1.318147, 1.386948, 1, 1, 1, 1, 1,
0.3880711, 1.214102, 0.9193206, 1, 1, 1, 1, 1,
0.3885002, 0.6962426, 0.5785816, 0, 0, 1, 1, 1,
0.3891397, 0.6484014, 0.8442293, 1, 0, 0, 1, 1,
0.3942008, -1.482441, 3.463851, 1, 0, 0, 1, 1,
0.3953407, -0.836255, 2.286371, 1, 0, 0, 1, 1,
0.3962934, 0.1008056, 2.148279, 1, 0, 0, 1, 1,
0.3977183, 0.05483141, 0.5763398, 1, 0, 0, 1, 1,
0.4011763, -0.5799693, 2.484779, 0, 0, 0, 1, 1,
0.413885, 1.566267, 0.2565579, 0, 0, 0, 1, 1,
0.4157204, -0.2862051, 2.097636, 0, 0, 0, 1, 1,
0.4230767, -0.07499067, 0.1487523, 0, 0, 0, 1, 1,
0.4270512, -1.469788, 1.962855, 0, 0, 0, 1, 1,
0.4385388, -1.351651, 3.673724, 0, 0, 0, 1, 1,
0.4430421, 1.158521, 0.1650129, 0, 0, 0, 1, 1,
0.448222, 0.9366959, 1.658491, 1, 1, 1, 1, 1,
0.4529245, -0.8344305, 2.742151, 1, 1, 1, 1, 1,
0.4530913, 1.042782, -0.06737486, 1, 1, 1, 1, 1,
0.4539846, 0.583528, -2.261891, 1, 1, 1, 1, 1,
0.4545704, 0.2417008, 0.9516774, 1, 1, 1, 1, 1,
0.4571581, -0.6200883, 2.096149, 1, 1, 1, 1, 1,
0.4597148, -0.3214079, 2.353701, 1, 1, 1, 1, 1,
0.4604076, 1.554404, -1.60152, 1, 1, 1, 1, 1,
0.4621672, 1.453708, 2.511926, 1, 1, 1, 1, 1,
0.4715982, -0.8365899, 4.011945, 1, 1, 1, 1, 1,
0.47497, -2.930945, 3.95146, 1, 1, 1, 1, 1,
0.4770101, 1.06737, -0.5514362, 1, 1, 1, 1, 1,
0.4783483, -0.1601996, 1.85704, 1, 1, 1, 1, 1,
0.4922612, -0.6393888, 1.843296, 1, 1, 1, 1, 1,
0.4968068, 0.4866239, 0.1251974, 1, 1, 1, 1, 1,
0.4982636, -2.126585, 0.9431636, 0, 0, 1, 1, 1,
0.5003101, 1.101736, 1.207091, 1, 0, 0, 1, 1,
0.5036786, 0.8046494, 0.8163497, 1, 0, 0, 1, 1,
0.5060473, -1.971533, 1.239952, 1, 0, 0, 1, 1,
0.5111247, -0.5896686, 1.998245, 1, 0, 0, 1, 1,
0.5118233, -0.1526574, 1.775442, 1, 0, 0, 1, 1,
0.5131583, 1.002618, -0.4853773, 0, 0, 0, 1, 1,
0.513308, -1.353961, 4.293454, 0, 0, 0, 1, 1,
0.5136358, -0.9026107, 3.575047, 0, 0, 0, 1, 1,
0.5142131, 0.2776236, -0.8966802, 0, 0, 0, 1, 1,
0.5143454, -0.9718502, 2.384487, 0, 0, 0, 1, 1,
0.5154952, 0.1789163, 2.2037, 0, 0, 0, 1, 1,
0.5192642, -0.8803402, 2.021636, 0, 0, 0, 1, 1,
0.5198191, 1.631525, 1.16185, 1, 1, 1, 1, 1,
0.524776, 0.3800074, 0.6050934, 1, 1, 1, 1, 1,
0.5251715, 0.5668619, 1.947307, 1, 1, 1, 1, 1,
0.5255512, 0.3249136, 0.3739546, 1, 1, 1, 1, 1,
0.5278918, 0.505478, 0.5166087, 1, 1, 1, 1, 1,
0.5290436, -0.272298, 2.260495, 1, 1, 1, 1, 1,
0.5343826, 0.9506757, -0.6924216, 1, 1, 1, 1, 1,
0.5408314, 0.6671852, 1.159143, 1, 1, 1, 1, 1,
0.5445862, -0.5575204, 1.483856, 1, 1, 1, 1, 1,
0.5454008, 0.8872814, -0.4944862, 1, 1, 1, 1, 1,
0.5486624, -0.3967903, 0.06508636, 1, 1, 1, 1, 1,
0.5506689, -0.2849912, 1.524271, 1, 1, 1, 1, 1,
0.5518591, 0.04232039, 0.609408, 1, 1, 1, 1, 1,
0.5540595, 1.199252, 0.3566307, 1, 1, 1, 1, 1,
0.5567091, -1.369118, 2.139986, 1, 1, 1, 1, 1,
0.559481, -0.6424627, 0.4127171, 0, 0, 1, 1, 1,
0.5596272, 1.44137, 0.2917678, 1, 0, 0, 1, 1,
0.5609266, -2.13527, 2.932427, 1, 0, 0, 1, 1,
0.5681812, -1.127384, 3.793755, 1, 0, 0, 1, 1,
0.5744835, -0.2342179, 1.55937, 1, 0, 0, 1, 1,
0.5769841, 1.188652, 1.428015, 1, 0, 0, 1, 1,
0.5800404, -0.0464198, 1.854748, 0, 0, 0, 1, 1,
0.5854447, 1.331098, -0.83698, 0, 0, 0, 1, 1,
0.5924308, -0.9062006, 4.239458, 0, 0, 0, 1, 1,
0.5937003, -0.3342604, 1.486865, 0, 0, 0, 1, 1,
0.593938, 0.4257647, -0.07383473, 0, 0, 0, 1, 1,
0.5965243, 0.902223, 0.0921976, 0, 0, 0, 1, 1,
0.5989994, -0.03005294, -1.127431, 0, 0, 0, 1, 1,
0.6004688, 1.231955, -0.6366514, 1, 1, 1, 1, 1,
0.6071029, 0.6964777, 0.4209439, 1, 1, 1, 1, 1,
0.6081966, 0.8701536, 1.171413, 1, 1, 1, 1, 1,
0.608934, -0.4089269, 0.0639746, 1, 1, 1, 1, 1,
0.6103387, 2.232687, 2.313084, 1, 1, 1, 1, 1,
0.6120068, -0.1415551, 1.848039, 1, 1, 1, 1, 1,
0.6120602, -0.2499852, 1.546614, 1, 1, 1, 1, 1,
0.6123348, -0.5709594, -0.1208864, 1, 1, 1, 1, 1,
0.6160449, -1.667903, 3.398033, 1, 1, 1, 1, 1,
0.6176577, 0.9859065, 0.6215757, 1, 1, 1, 1, 1,
0.6229583, -0.5620372, 1.835266, 1, 1, 1, 1, 1,
0.6277733, -0.2803798, 2.10043, 1, 1, 1, 1, 1,
0.6277999, 1.15181, 1.484022, 1, 1, 1, 1, 1,
0.6342338, 0.2315327, -0.2352455, 1, 1, 1, 1, 1,
0.635437, 1.103905, 1.034888, 1, 1, 1, 1, 1,
0.63683, -0.2759022, 3.47072, 0, 0, 1, 1, 1,
0.6406374, -0.8331727, 3.443697, 1, 0, 0, 1, 1,
0.6441594, 0.6524904, 0.04552855, 1, 0, 0, 1, 1,
0.6446996, 0.1360411, 0.9269295, 1, 0, 0, 1, 1,
0.6465843, -0.5943791, 3.482268, 1, 0, 0, 1, 1,
0.6467886, 1.448985, 0.01456809, 1, 0, 0, 1, 1,
0.6472211, -0.3156017, 2.007115, 0, 0, 0, 1, 1,
0.6479802, 0.1256475, 0.9755703, 0, 0, 0, 1, 1,
0.6554629, -0.1835662, 2.496402, 0, 0, 0, 1, 1,
0.6567073, -0.6468738, 2.020408, 0, 0, 0, 1, 1,
0.6593012, -1.51167, 1.788699, 0, 0, 0, 1, 1,
0.6595628, 0.7644471, 1.040305, 0, 0, 0, 1, 1,
0.6719042, 0.09083001, 1.418037, 0, 0, 0, 1, 1,
0.6729783, 0.2711921, 0.9832543, 1, 1, 1, 1, 1,
0.6849975, -0.5981125, 4.256862, 1, 1, 1, 1, 1,
0.6970829, 0.1520403, -0.2547938, 1, 1, 1, 1, 1,
0.701194, 0.4712795, 0.5090476, 1, 1, 1, 1, 1,
0.7016692, 0.1088708, 2.182749, 1, 1, 1, 1, 1,
0.7019884, -0.04210924, 2.091578, 1, 1, 1, 1, 1,
0.702623, -0.7701469, 1.856541, 1, 1, 1, 1, 1,
0.7042936, 0.2391069, -1.00367, 1, 1, 1, 1, 1,
0.704905, -1.692909, 2.486074, 1, 1, 1, 1, 1,
0.7059335, -1.685896, 4.04981, 1, 1, 1, 1, 1,
0.7084923, 0.2034843, 2.842961, 1, 1, 1, 1, 1,
0.7093958, -1.427769, 3.163862, 1, 1, 1, 1, 1,
0.7119801, -0.4522515, 2.573972, 1, 1, 1, 1, 1,
0.7130862, -1.501864, 2.496543, 1, 1, 1, 1, 1,
0.7148506, 0.003351339, 2.468349, 1, 1, 1, 1, 1,
0.7193176, -1.907043, 2.150865, 0, 0, 1, 1, 1,
0.7193779, 0.6232262, 0.329742, 1, 0, 0, 1, 1,
0.7233642, 1.268764, -0.7754754, 1, 0, 0, 1, 1,
0.7257752, -1.870811, 3.253652, 1, 0, 0, 1, 1,
0.7279167, 0.2037803, 2.580147, 1, 0, 0, 1, 1,
0.7306412, 1.542266, -0.229519, 1, 0, 0, 1, 1,
0.7391307, -0.6161734, 3.388175, 0, 0, 0, 1, 1,
0.7424508, 0.882158, 0.04281716, 0, 0, 0, 1, 1,
0.7458624, -0.9402855, 1.260001, 0, 0, 0, 1, 1,
0.7471049, 0.3605619, 0.02734415, 0, 0, 0, 1, 1,
0.7482855, -0.7814779, 3.049923, 0, 0, 0, 1, 1,
0.7493599, 0.6355023, 2.141235, 0, 0, 0, 1, 1,
0.7525089, 0.8122319, -0.03834173, 0, 0, 0, 1, 1,
0.7543016, 0.3016977, 1.668633, 1, 1, 1, 1, 1,
0.7587798, -0.4118287, 1.759847, 1, 1, 1, 1, 1,
0.7588814, -0.8414971, 0.7482033, 1, 1, 1, 1, 1,
0.7590201, -1.812953, 2.584709, 1, 1, 1, 1, 1,
0.7665313, -1.50442, 0.7510971, 1, 1, 1, 1, 1,
0.7740005, 1.287237, -0.5356461, 1, 1, 1, 1, 1,
0.7770886, 0.7793395, -0.1202788, 1, 1, 1, 1, 1,
0.7785458, -0.7537178, 2.348829, 1, 1, 1, 1, 1,
0.7790436, -0.3364009, 1.572996, 1, 1, 1, 1, 1,
0.7798387, -1.093149, 2.139465, 1, 1, 1, 1, 1,
0.7840186, -1.237401, 1.71545, 1, 1, 1, 1, 1,
0.7841188, 0.0192492, 2.270047, 1, 1, 1, 1, 1,
0.7855888, -0.1957952, 1.556115, 1, 1, 1, 1, 1,
0.7863046, 1.112068, 1.077844, 1, 1, 1, 1, 1,
0.7911196, 1.043025, -0.5631239, 1, 1, 1, 1, 1,
0.7961344, -0.1449886, 1.330538, 0, 0, 1, 1, 1,
0.8011597, 0.5441614, 2.215582, 1, 0, 0, 1, 1,
0.802618, -0.9711978, 4.108028, 1, 0, 0, 1, 1,
0.8042341, -0.1281115, 2.494104, 1, 0, 0, 1, 1,
0.8058519, 1.252756, -0.6413291, 1, 0, 0, 1, 1,
0.8081957, 1.170035, 1.326309, 1, 0, 0, 1, 1,
0.809959, -1.435097, 2.878395, 0, 0, 0, 1, 1,
0.8124647, -0.1184611, 2.695144, 0, 0, 0, 1, 1,
0.814526, 0.2023866, 1.386435, 0, 0, 0, 1, 1,
0.8152944, -1.068492, 0.5478286, 0, 0, 0, 1, 1,
0.8219711, 2.767758, 0.6103819, 0, 0, 0, 1, 1,
0.8228624, 2.222605, -0.6958806, 0, 0, 0, 1, 1,
0.8271715, -1.497041, 2.088468, 0, 0, 0, 1, 1,
0.8295918, -0.9153042, 1.034485, 1, 1, 1, 1, 1,
0.8332771, 0.8787981, 0.2578256, 1, 1, 1, 1, 1,
0.8380134, 1.761174, -1.006871, 1, 1, 1, 1, 1,
0.8417541, 0.6737664, 1.335868, 1, 1, 1, 1, 1,
0.8466092, -1.180009, 3.742782, 1, 1, 1, 1, 1,
0.8490775, -0.3721975, 2.258659, 1, 1, 1, 1, 1,
0.8526467, -0.5454624, 1.719545, 1, 1, 1, 1, 1,
0.8545152, 1.017277, 1.736131, 1, 1, 1, 1, 1,
0.8590771, 0.6574543, 0.2775819, 1, 1, 1, 1, 1,
0.8616675, -0.3908309, 3.458164, 1, 1, 1, 1, 1,
0.8631266, -1.461593, 2.393016, 1, 1, 1, 1, 1,
0.8678586, -1.040195, 2.760581, 1, 1, 1, 1, 1,
0.8711126, 1.432478, 0.5809367, 1, 1, 1, 1, 1,
0.8743058, -0.3074986, 1.417999, 1, 1, 1, 1, 1,
0.8775103, 2.087298, 0.7743077, 1, 1, 1, 1, 1,
0.880675, 0.7986668, 1.607194, 0, 0, 1, 1, 1,
0.8879088, 1.786307, 1.562581, 1, 0, 0, 1, 1,
0.8902841, 0.6168799, 1.536054, 1, 0, 0, 1, 1,
0.8922316, 1.457293, 1.694073, 1, 0, 0, 1, 1,
0.9004581, 0.5045267, 1.025586, 1, 0, 0, 1, 1,
0.9010866, -0.1041489, 3.907131, 1, 0, 0, 1, 1,
0.9060417, 0.2011113, 1.709588, 0, 0, 0, 1, 1,
0.9134883, 1.121585, -0.3676695, 0, 0, 0, 1, 1,
0.9213433, 0.1958947, 0.7805213, 0, 0, 0, 1, 1,
0.9250187, -1.659143, 2.429439, 0, 0, 0, 1, 1,
0.9250333, 0.1740719, 0.3198514, 0, 0, 0, 1, 1,
0.9310934, 1.67907, -0.793709, 0, 0, 0, 1, 1,
0.9431719, -0.7083988, 1.272828, 0, 0, 0, 1, 1,
0.9467357, 1.4236, 1.463827, 1, 1, 1, 1, 1,
0.9526179, -0.002491564, 2.930791, 1, 1, 1, 1, 1,
0.9599096, -0.5232167, 2.348461, 1, 1, 1, 1, 1,
0.966099, 0.6142258, 2.029623, 1, 1, 1, 1, 1,
0.9710314, -1.407607, 3.247426, 1, 1, 1, 1, 1,
0.9722198, -1.021924, 3.69133, 1, 1, 1, 1, 1,
0.9839195, -0.8629413, 2.808389, 1, 1, 1, 1, 1,
0.9911218, 0.5867681, -0.5339605, 1, 1, 1, 1, 1,
0.9942491, 0.06171804, 3.550375, 1, 1, 1, 1, 1,
0.9953987, 1.148579, 2.521574, 1, 1, 1, 1, 1,
1.011489, 0.3264465, 0.5102879, 1, 1, 1, 1, 1,
1.011874, -1.573574, 2.260007, 1, 1, 1, 1, 1,
1.014674, -1.428329, 3.415522, 1, 1, 1, 1, 1,
1.026185, 2.191835, 0.1557305, 1, 1, 1, 1, 1,
1.02867, 0.2642266, 0.7364339, 1, 1, 1, 1, 1,
1.029954, 0.3662842, -0.1813697, 0, 0, 1, 1, 1,
1.031716, -1.529205, 3.778644, 1, 0, 0, 1, 1,
1.03239, -1.088262, 2.191749, 1, 0, 0, 1, 1,
1.034435, -0.1852282, 1.830997, 1, 0, 0, 1, 1,
1.03782, 1.110959, 0.498644, 1, 0, 0, 1, 1,
1.042147, 1.773975, -0.9696164, 1, 0, 0, 1, 1,
1.042485, -1.523354, 1.261812, 0, 0, 0, 1, 1,
1.043629, -0.9737765, 1.792687, 0, 0, 0, 1, 1,
1.049528, 0.1485801, 1.84956, 0, 0, 0, 1, 1,
1.052254, 0.6812112, -1.253722, 0, 0, 0, 1, 1,
1.061319, -0.3849891, 2.462192, 0, 0, 0, 1, 1,
1.061526, 1.615982, 1.001307, 0, 0, 0, 1, 1,
1.068071, 0.6719068, 1.985023, 0, 0, 0, 1, 1,
1.077115, 0.5651684, 0.2874544, 1, 1, 1, 1, 1,
1.079768, 1.503103, 0.8878522, 1, 1, 1, 1, 1,
1.086459, -0.3690033, 0.3042044, 1, 1, 1, 1, 1,
1.08854, -0.3956626, 1.922141, 1, 1, 1, 1, 1,
1.097925, 1.85982, -0.4383084, 1, 1, 1, 1, 1,
1.099276, -1.794648, 2.486535, 1, 1, 1, 1, 1,
1.099939, 0.8322716, 0.4910609, 1, 1, 1, 1, 1,
1.101452, 0.9671528, 0.6506576, 1, 1, 1, 1, 1,
1.103091, 0.1510026, 2.11519, 1, 1, 1, 1, 1,
1.10382, -0.4473576, 2.01848, 1, 1, 1, 1, 1,
1.106448, 0.8942161, -0.2509162, 1, 1, 1, 1, 1,
1.107723, -0.9375473, 0.3249064, 1, 1, 1, 1, 1,
1.118003, -0.6230502, 1.346667, 1, 1, 1, 1, 1,
1.118295, -1.00855, 1.848099, 1, 1, 1, 1, 1,
1.119378, -0.7442633, 1.416052, 1, 1, 1, 1, 1,
1.124761, 1.284796, 0.6260355, 0, 0, 1, 1, 1,
1.124897, -0.4190208, 0.9020477, 1, 0, 0, 1, 1,
1.129231, 1.747912, -0.9418293, 1, 0, 0, 1, 1,
1.142937, 0.4588808, 0.08158796, 1, 0, 0, 1, 1,
1.157218, -0.4533498, 2.61535, 1, 0, 0, 1, 1,
1.158552, 0.2989634, 1.434014, 1, 0, 0, 1, 1,
1.189605, 0.001324453, 1.220397, 0, 0, 0, 1, 1,
1.196439, -2.343708, 3.698763, 0, 0, 0, 1, 1,
1.202904, -1.154267, 2.582448, 0, 0, 0, 1, 1,
1.210478, -0.4037066, 0.9731603, 0, 0, 0, 1, 1,
1.218175, 0.2229428, 2.182478, 0, 0, 0, 1, 1,
1.219636, 0.5103495, 0.1887395, 0, 0, 0, 1, 1,
1.226531, 0.6729994, 1.684132, 0, 0, 0, 1, 1,
1.2269, 0.3091438, 2.226502, 1, 1, 1, 1, 1,
1.229029, -0.4259017, 1.055489, 1, 1, 1, 1, 1,
1.229678, 1.297327, -0.1860842, 1, 1, 1, 1, 1,
1.238613, -0.3759928, 2.583312, 1, 1, 1, 1, 1,
1.248596, 0.09219451, 0.7890993, 1, 1, 1, 1, 1,
1.254849, 0.7056212, -0.04231313, 1, 1, 1, 1, 1,
1.261142, 0.2206452, 2.18767, 1, 1, 1, 1, 1,
1.270837, 0.1014405, 0.3339443, 1, 1, 1, 1, 1,
1.276556, -0.3344667, 2.297272, 1, 1, 1, 1, 1,
1.277605, 0.2837828, 2.378256, 1, 1, 1, 1, 1,
1.278533, -0.1829093, 1.735701, 1, 1, 1, 1, 1,
1.281668, 1.291936, 1.012038, 1, 1, 1, 1, 1,
1.293456, -0.3805086, 2.431686, 1, 1, 1, 1, 1,
1.298793, 0.552862, 1.935838, 1, 1, 1, 1, 1,
1.307418, 1.785286, 0.713912, 1, 1, 1, 1, 1,
1.307587, -0.7183051, 2.560048, 0, 0, 1, 1, 1,
1.3091, -2.780759, 1.626876, 1, 0, 0, 1, 1,
1.312393, 2.114379, -0.3530262, 1, 0, 0, 1, 1,
1.315079, -0.5761684, 1.347696, 1, 0, 0, 1, 1,
1.320992, 0.02086039, 1.305688, 1, 0, 0, 1, 1,
1.325095, -1.806162, 0.1855353, 1, 0, 0, 1, 1,
1.331765, 0.5423432, 3.172568, 0, 0, 0, 1, 1,
1.346856, 0.2264879, 1.238878, 0, 0, 0, 1, 1,
1.351067, 1.537663, -0.219962, 0, 0, 0, 1, 1,
1.358177, 1.317558, 0.5755465, 0, 0, 0, 1, 1,
1.378583, -0.2671653, 2.835544, 0, 0, 0, 1, 1,
1.381321, 0.3479629, 1.023165, 0, 0, 0, 1, 1,
1.383008, -0.5947223, 2.19469, 0, 0, 0, 1, 1,
1.390296, -0.3105576, 1.72728, 1, 1, 1, 1, 1,
1.401074, 0.6487437, 3.331297, 1, 1, 1, 1, 1,
1.40352, -0.4406288, 1.909293, 1, 1, 1, 1, 1,
1.423706, -1.256408, 1.93765, 1, 1, 1, 1, 1,
1.440295, 0.7394992, -0.2209892, 1, 1, 1, 1, 1,
1.442353, -0.01185431, 0.3252337, 1, 1, 1, 1, 1,
1.448679, -0.5171443, 1.384082, 1, 1, 1, 1, 1,
1.459419, 1.901916, 0.0361182, 1, 1, 1, 1, 1,
1.460708, 0.4130423, 0.5563344, 1, 1, 1, 1, 1,
1.46329, 0.1609998, 1.733218, 1, 1, 1, 1, 1,
1.467107, 0.1629817, 2.431169, 1, 1, 1, 1, 1,
1.487266, -1.961802, 2.356892, 1, 1, 1, 1, 1,
1.497993, -0.1864014, 1.442593, 1, 1, 1, 1, 1,
1.499903, -0.0137663, 0.434956, 1, 1, 1, 1, 1,
1.504584, 1.960314, 1.511635, 1, 1, 1, 1, 1,
1.511205, -1.734671, 3.019407, 0, 0, 1, 1, 1,
1.511442, -0.718444, 2.090258, 1, 0, 0, 1, 1,
1.51163, 0.2885229, 0.6604635, 1, 0, 0, 1, 1,
1.51587, 0.641591, 0.9530376, 1, 0, 0, 1, 1,
1.530936, 0.1862766, 1.932632, 1, 0, 0, 1, 1,
1.534204, 0.1632565, 4.249462, 1, 0, 0, 1, 1,
1.534594, 0.2570963, 1.316928, 0, 0, 0, 1, 1,
1.544112, -0.3476196, 2.482735, 0, 0, 0, 1, 1,
1.560594, 0.2730854, 1.945621, 0, 0, 0, 1, 1,
1.579754, 0.06449984, 1.449189, 0, 0, 0, 1, 1,
1.580487, -0.8590407, 1.662842, 0, 0, 0, 1, 1,
1.581645, -0.8292872, 1.648068, 0, 0, 0, 1, 1,
1.589046, 0.5630898, 1.887169, 0, 0, 0, 1, 1,
1.589814, 0.2867959, 2.322438, 1, 1, 1, 1, 1,
1.599686, -0.6548811, 1.163919, 1, 1, 1, 1, 1,
1.605463, -1.494575, 1.527655, 1, 1, 1, 1, 1,
1.60577, -1.521803, 3.623069, 1, 1, 1, 1, 1,
1.606071, -1.328985, 3.737621, 1, 1, 1, 1, 1,
1.622377, -1.299175, 2.261388, 1, 1, 1, 1, 1,
1.627225, -0.9405707, 2.08147, 1, 1, 1, 1, 1,
1.637899, -2.067005, 4.378465, 1, 1, 1, 1, 1,
1.655427, -0.3280571, 2.703285, 1, 1, 1, 1, 1,
1.658666, -0.564898, 1.410786, 1, 1, 1, 1, 1,
1.668202, 0.879014, 0.6633967, 1, 1, 1, 1, 1,
1.670703, -0.02188396, 1.815453, 1, 1, 1, 1, 1,
1.674617, -0.5331722, 0.9343388, 1, 1, 1, 1, 1,
1.688076, 0.4690268, -1.235892, 1, 1, 1, 1, 1,
1.692054, -0.3305239, 2.07425, 1, 1, 1, 1, 1,
1.716166, 1.222341, 0.3217286, 0, 0, 1, 1, 1,
1.726372, -0.8087304, 3.620074, 1, 0, 0, 1, 1,
1.726991, 1.229084, 1.299069, 1, 0, 0, 1, 1,
1.728042, 1.343936, 0.597178, 1, 0, 0, 1, 1,
1.73279, -0.6307719, 1.17187, 1, 0, 0, 1, 1,
1.768974, -2.179626, 2.603826, 1, 0, 0, 1, 1,
1.77019, -0.9282802, 1.977247, 0, 0, 0, 1, 1,
1.783746, -1.537079, 3.69989, 0, 0, 0, 1, 1,
1.786396, -0.4710354, 1.293499, 0, 0, 0, 1, 1,
1.788866, -0.4152311, 2.027375, 0, 0, 0, 1, 1,
1.811741, 0.8427761, -0.3288454, 0, 0, 0, 1, 1,
1.813155, 0.4169458, 1.98817, 0, 0, 0, 1, 1,
1.840854, 0.1956379, 1.49715, 0, 0, 0, 1, 1,
1.844973, -0.5819249, 1.83206, 1, 1, 1, 1, 1,
1.859731, 0.07198392, -0.4256907, 1, 1, 1, 1, 1,
1.864973, -0.2602526, 1.767329, 1, 1, 1, 1, 1,
1.868939, 0.8041892, 1.554487, 1, 1, 1, 1, 1,
1.871857, 0.9318514, 2.258366, 1, 1, 1, 1, 1,
1.896358, 0.3530413, 0.6995231, 1, 1, 1, 1, 1,
1.948112, -0.5865449, 2.109498, 1, 1, 1, 1, 1,
1.9569, 0.9962124, 1.598401, 1, 1, 1, 1, 1,
2.000152, 1.341657, 1.968358, 1, 1, 1, 1, 1,
2.003177, -0.2419145, 1.724804, 1, 1, 1, 1, 1,
2.004386, 0.4787918, 2.128285, 1, 1, 1, 1, 1,
2.014605, 0.3594999, 2.366596, 1, 1, 1, 1, 1,
2.028009, 1.484464, -0.2240278, 1, 1, 1, 1, 1,
2.05031, -1.194105, 2.863504, 1, 1, 1, 1, 1,
2.057397, 1.435541, -0.5774434, 1, 1, 1, 1, 1,
2.099091, 0.3774326, 1.239041, 0, 0, 1, 1, 1,
2.10143, -0.2441947, 3.453688, 1, 0, 0, 1, 1,
2.101822, -1.585068, 2.501384, 1, 0, 0, 1, 1,
2.111294, 0.7653697, 0.5410126, 1, 0, 0, 1, 1,
2.167493, -0.3021137, 1.938366, 1, 0, 0, 1, 1,
2.173753, -0.8790877, 2.417093, 1, 0, 0, 1, 1,
2.20338, -0.9613935, 1.358549, 0, 0, 0, 1, 1,
2.226343, -1.411965, 1.677065, 0, 0, 0, 1, 1,
2.272639, 1.408709, 1.830437, 0, 0, 0, 1, 1,
2.301424, -0.3636098, 3.031019, 0, 0, 0, 1, 1,
2.303657, -0.39309, 1.77391, 0, 0, 0, 1, 1,
2.323026, 0.06435467, 3.056184, 0, 0, 0, 1, 1,
2.32433, -0.8349268, 1.259889, 0, 0, 0, 1, 1,
2.404764, 1.416948, 3.073914, 1, 1, 1, 1, 1,
2.564924, -0.3075765, 2.287076, 1, 1, 1, 1, 1,
2.586195, 1.152238, 0.2119849, 1, 1, 1, 1, 1,
2.627669, -0.2416925, 2.948995, 1, 1, 1, 1, 1,
2.668825, 1.380615, 1.321118, 1, 1, 1, 1, 1,
2.82099, -0.5595971, 0.7490444, 1, 1, 1, 1, 1,
3.261314, -1.950323, 2.139193, 1, 1, 1, 1, 1
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
var radius = 9.749003;
var distance = 34.24296;
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
mvMatrix.translate( 0.01461506, -0.01935744, -0.1372283 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24296);
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
