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
-4.610546, -0.6874588, -2.25348, 1, 0, 0, 1,
-3.08159, -0.7236016, -1.615132, 1, 0.007843138, 0, 1,
-3.019451, -1.38538, -1.843357, 1, 0.01176471, 0, 1,
-2.941808, 1.101742, -0.614627, 1, 0.01960784, 0, 1,
-2.758225, -1.807853, -3.125313, 1, 0.02352941, 0, 1,
-2.66805, 0.1627746, -2.46989, 1, 0.03137255, 0, 1,
-2.623506, -2.127067, -3.330177, 1, 0.03529412, 0, 1,
-2.592492, 1.068177, -0.6023952, 1, 0.04313726, 0, 1,
-2.529119, -0.04572043, -0.659479, 1, 0.04705882, 0, 1,
-2.491919, -0.2872422, -1.206573, 1, 0.05490196, 0, 1,
-2.440698, -0.9544723, -2.71118, 1, 0.05882353, 0, 1,
-2.435014, -0.2593507, -1.15421, 1, 0.06666667, 0, 1,
-2.422572, 1.89498, 0.5922333, 1, 0.07058824, 0, 1,
-2.403122, -1.550566, -1.30579, 1, 0.07843138, 0, 1,
-2.334688, 0.5251771, -0.287818, 1, 0.08235294, 0, 1,
-2.288591, 1.054276, -2.008939, 1, 0.09019608, 0, 1,
-2.28833, -1.304291, -3.401901, 1, 0.09411765, 0, 1,
-2.256385, 0.7130631, -1.07732, 1, 0.1019608, 0, 1,
-2.202454, -0.4454731, -2.437505, 1, 0.1098039, 0, 1,
-2.164418, -0.1743273, -2.992348, 1, 0.1137255, 0, 1,
-2.112788, -1.289263, -1.63159, 1, 0.1215686, 0, 1,
-2.111731, 0.7616305, -1.384863, 1, 0.1254902, 0, 1,
-2.091341, 1.08727, -1.684, 1, 0.1333333, 0, 1,
-2.080398, 0.9873446, -1.290637, 1, 0.1372549, 0, 1,
-2.074137, -0.6717416, -3.217207, 1, 0.145098, 0, 1,
-2.063096, 0.1923588, -2.200491, 1, 0.1490196, 0, 1,
-2.03541, -0.3552813, -2.637258, 1, 0.1568628, 0, 1,
-2.017137, -0.5887983, -1.839893, 1, 0.1607843, 0, 1,
-1.980641, -0.151691, -1.467858, 1, 0.1686275, 0, 1,
-1.980508, -0.07227736, -0.9769717, 1, 0.172549, 0, 1,
-1.957943, 0.004001713, -1.604872, 1, 0.1803922, 0, 1,
-1.941929, -0.886679, -1.551882, 1, 0.1843137, 0, 1,
-1.928098, -0.5698289, -1.574571, 1, 0.1921569, 0, 1,
-1.919602, -0.8932039, -3.161397, 1, 0.1960784, 0, 1,
-1.851381, -1.724433, -1.084619, 1, 0.2039216, 0, 1,
-1.84977, -0.06899331, -2.853579, 1, 0.2117647, 0, 1,
-1.794617, 0.5699046, -1.437999, 1, 0.2156863, 0, 1,
-1.775099, -0.1751788, -0.6443961, 1, 0.2235294, 0, 1,
-1.757693, -0.7942452, -2.101063, 1, 0.227451, 0, 1,
-1.757159, 0.5508718, -1.457724, 1, 0.2352941, 0, 1,
-1.718119, -1.894525, -2.514648, 1, 0.2392157, 0, 1,
-1.710902, 0.8360968, 0.6784838, 1, 0.2470588, 0, 1,
-1.708545, -0.4449939, -1.847871, 1, 0.2509804, 0, 1,
-1.691625, -0.05539542, -0.7374086, 1, 0.2588235, 0, 1,
-1.688493, -0.5943483, -0.4064967, 1, 0.2627451, 0, 1,
-1.669692, -1.545806, -2.840401, 1, 0.2705882, 0, 1,
-1.664433, 0.3067651, -2.090605, 1, 0.2745098, 0, 1,
-1.663982, 1.441636, 0.2765672, 1, 0.282353, 0, 1,
-1.64693, -0.5582528, -1.871948, 1, 0.2862745, 0, 1,
-1.605442, -2.126845, -1.348165, 1, 0.2941177, 0, 1,
-1.603138, 0.1053175, -0.04449591, 1, 0.3019608, 0, 1,
-1.600859, 1.763775, -0.7487088, 1, 0.3058824, 0, 1,
-1.600298, 0.6991414, -0.541167, 1, 0.3137255, 0, 1,
-1.596138, 1.40368, -1.293086, 1, 0.3176471, 0, 1,
-1.574936, -0.6648254, -1.795462, 1, 0.3254902, 0, 1,
-1.562836, -0.6385763, -1.551235, 1, 0.3294118, 0, 1,
-1.556121, 0.371891, -2.493029, 1, 0.3372549, 0, 1,
-1.549683, -0.6432888, -1.75276, 1, 0.3411765, 0, 1,
-1.531044, 0.9684049, -3.397922, 1, 0.3490196, 0, 1,
-1.524473, -0.8271132, -0.1323191, 1, 0.3529412, 0, 1,
-1.520328, -0.09568949, -3.204832, 1, 0.3607843, 0, 1,
-1.503604, -0.01276042, -2.670873, 1, 0.3647059, 0, 1,
-1.503085, 0.7255254, -1.855848, 1, 0.372549, 0, 1,
-1.49016, 0.8518111, 0.2054131, 1, 0.3764706, 0, 1,
-1.468196, 0.8152918, -0.5189633, 1, 0.3843137, 0, 1,
-1.459919, -0.7825208, -0.9807947, 1, 0.3882353, 0, 1,
-1.45228, -0.9189361, -2.583995, 1, 0.3960784, 0, 1,
-1.444017, 0.3882889, -1.88851, 1, 0.4039216, 0, 1,
-1.437905, 0.8232642, -2.054107, 1, 0.4078431, 0, 1,
-1.437802, -1.612902, -2.159668, 1, 0.4156863, 0, 1,
-1.437204, -1.659817, -4.141211, 1, 0.4196078, 0, 1,
-1.423238, -1.36616, -3.474379, 1, 0.427451, 0, 1,
-1.422829, 1.315858, -0.1803772, 1, 0.4313726, 0, 1,
-1.415965, 0.5130243, -2.189328, 1, 0.4392157, 0, 1,
-1.410389, 0.9368975, -0.7020938, 1, 0.4431373, 0, 1,
-1.407804, 0.4388449, -1.374679, 1, 0.4509804, 0, 1,
-1.399811, -1.443534, -4.108408, 1, 0.454902, 0, 1,
-1.39869, -0.6361946, -1.986425, 1, 0.4627451, 0, 1,
-1.371484, -0.4279367, -1.383077, 1, 0.4666667, 0, 1,
-1.368051, -0.6661927, -3.508556, 1, 0.4745098, 0, 1,
-1.36539, 0.1989711, -2.35053, 1, 0.4784314, 0, 1,
-1.36528, -1.442536, -3.025722, 1, 0.4862745, 0, 1,
-1.365144, 0.7795231, -0.1361021, 1, 0.4901961, 0, 1,
-1.361076, 0.9613499, -1.992611, 1, 0.4980392, 0, 1,
-1.357091, 0.9173532, 1.179406, 1, 0.5058824, 0, 1,
-1.354575, -1.178499, -0.5082395, 1, 0.509804, 0, 1,
-1.353961, -0.3148471, -2.64906, 1, 0.5176471, 0, 1,
-1.345321, -0.5235378, -1.242013, 1, 0.5215687, 0, 1,
-1.335896, 0.2901628, -0.209128, 1, 0.5294118, 0, 1,
-1.332792, 1.88504, -1.015089, 1, 0.5333334, 0, 1,
-1.331771, 0.1832504, -2.066762, 1, 0.5411765, 0, 1,
-1.32438, -0.217612, -1.331337, 1, 0.5450981, 0, 1,
-1.323103, -0.3762656, -0.9438501, 1, 0.5529412, 0, 1,
-1.318099, 1.295864, 0.1124042, 1, 0.5568628, 0, 1,
-1.308957, -1.429502, -2.99259, 1, 0.5647059, 0, 1,
-1.304038, -0.01251035, -2.197466, 1, 0.5686275, 0, 1,
-1.285941, -0.2495776, -3.154911, 1, 0.5764706, 0, 1,
-1.285931, -1.257889, -0.5220835, 1, 0.5803922, 0, 1,
-1.277266, -0.3513788, -2.645676, 1, 0.5882353, 0, 1,
-1.276699, 0.995441, -0.1910884, 1, 0.5921569, 0, 1,
-1.273186, -1.202936, -1.273273, 1, 0.6, 0, 1,
-1.264348, -1.207425, -2.6896, 1, 0.6078432, 0, 1,
-1.263532, 1.595768, -1.533137, 1, 0.6117647, 0, 1,
-1.258103, -0.5980354, -0.5159589, 1, 0.6196079, 0, 1,
-1.257948, -0.3698458, 0.05280254, 1, 0.6235294, 0, 1,
-1.252108, 1.040482, 0.2298199, 1, 0.6313726, 0, 1,
-1.251927, -1.27573, -2.892948, 1, 0.6352941, 0, 1,
-1.246273, -0.5601248, -1.861062, 1, 0.6431373, 0, 1,
-1.245463, 0.294753, -1.092068, 1, 0.6470588, 0, 1,
-1.244438, 0.8285786, 0.3410491, 1, 0.654902, 0, 1,
-1.221056, 0.7918373, -0.9301379, 1, 0.6588235, 0, 1,
-1.214846, -1.257647, -2.645723, 1, 0.6666667, 0, 1,
-1.209786, -1.849026, -4.964208, 1, 0.6705883, 0, 1,
-1.2091, -0.09413028, -1.707822, 1, 0.6784314, 0, 1,
-1.198771, 2.012792, 0.3427843, 1, 0.682353, 0, 1,
-1.198527, -0.8476852, -1.75805, 1, 0.6901961, 0, 1,
-1.194128, 1.385668, -1.332271, 1, 0.6941177, 0, 1,
-1.187488, -0.6291726, -3.378254, 1, 0.7019608, 0, 1,
-1.181114, 1.295928, -0.4420285, 1, 0.7098039, 0, 1,
-1.175047, 1.120514, -1.438461, 1, 0.7137255, 0, 1,
-1.170334, 0.7568462, -1.506791, 1, 0.7215686, 0, 1,
-1.168853, -2.078836, -1.32093, 1, 0.7254902, 0, 1,
-1.161709, 1.592528, -1.102374, 1, 0.7333333, 0, 1,
-1.160508, 0.3882003, -0.9950949, 1, 0.7372549, 0, 1,
-1.159545, -1.360809, -1.767814, 1, 0.7450981, 0, 1,
-1.158255, 0.1208361, -1.454419, 1, 0.7490196, 0, 1,
-1.154171, 1.391119, -0.9244961, 1, 0.7568628, 0, 1,
-1.150038, -0.5755717, -2.585314, 1, 0.7607843, 0, 1,
-1.139908, 0.7275867, -1.734277, 1, 0.7686275, 0, 1,
-1.131358, -0.6406233, -2.238816, 1, 0.772549, 0, 1,
-1.128029, 0.2562197, -0.1749912, 1, 0.7803922, 0, 1,
-1.122874, -0.9272344, -3.280536, 1, 0.7843137, 0, 1,
-1.1064, 0.5204927, -1.450895, 1, 0.7921569, 0, 1,
-1.096873, 0.8152075, -1.686383, 1, 0.7960784, 0, 1,
-1.095778, -0.9425431, -3.64389, 1, 0.8039216, 0, 1,
-1.09004, 0.7082897, 0.4256147, 1, 0.8117647, 0, 1,
-1.087756, -1.119597, -1.334726, 1, 0.8156863, 0, 1,
-1.085859, -0.7036984, -0.4694076, 1, 0.8235294, 0, 1,
-1.085068, 0.08999293, -0.4058031, 1, 0.827451, 0, 1,
-1.080085, 1.303063, -1.675005, 1, 0.8352941, 0, 1,
-1.073839, 0.7170596, -0.1125042, 1, 0.8392157, 0, 1,
-1.069005, -0.612887, -2.201265, 1, 0.8470588, 0, 1,
-1.068608, 1.757407, -2.367563, 1, 0.8509804, 0, 1,
-1.067571, -0.8480769, -2.90415, 1, 0.8588235, 0, 1,
-1.066021, -1.180788, -2.233322, 1, 0.8627451, 0, 1,
-1.060795, -2.351268, -3.347035, 1, 0.8705882, 0, 1,
-1.053882, -1.586947, -2.584961, 1, 0.8745098, 0, 1,
-1.052708, -0.5297124, -1.456944, 1, 0.8823529, 0, 1,
-1.044789, 0.676822, -0.5504934, 1, 0.8862745, 0, 1,
-1.042107, 1.707872, -0.9628103, 1, 0.8941177, 0, 1,
-1.040961, -0.3924062, -1.606027, 1, 0.8980392, 0, 1,
-1.037043, -1.288647, -4.387986, 1, 0.9058824, 0, 1,
-1.031286, 0.09807065, -2.121481, 1, 0.9137255, 0, 1,
-1.026891, -1.424536, -2.427142, 1, 0.9176471, 0, 1,
-1.02278, 0.1967223, -2.02645, 1, 0.9254902, 0, 1,
-1.02197, 1.08001, -1.511531, 1, 0.9294118, 0, 1,
-1.008243, -0.9201294, -3.906409, 1, 0.9372549, 0, 1,
-1.007835, 2.615564, 0.306988, 1, 0.9411765, 0, 1,
-1.007354, -0.9874706, -1.078787, 1, 0.9490196, 0, 1,
-1.00577, 0.2793256, -1.269576, 1, 0.9529412, 0, 1,
-0.9977073, 1.505451, -1.336816, 1, 0.9607843, 0, 1,
-0.9956825, 1.014219, -0.4146791, 1, 0.9647059, 0, 1,
-0.9948113, -0.7909934, -1.835716, 1, 0.972549, 0, 1,
-0.9888554, -1.01696, -3.275783, 1, 0.9764706, 0, 1,
-0.9774734, -0.6253347, -2.628244, 1, 0.9843137, 0, 1,
-0.9765783, -0.4713609, -1.690482, 1, 0.9882353, 0, 1,
-0.9743261, 0.6446912, 0.2440161, 1, 0.9960784, 0, 1,
-0.973922, 0.05900374, -0.7457892, 0.9960784, 1, 0, 1,
-0.9690564, 2.024307, 0.5604527, 0.9921569, 1, 0, 1,
-0.964501, -0.1988867, -1.248261, 0.9843137, 1, 0, 1,
-0.959132, 0.9210027, -0.6307177, 0.9803922, 1, 0, 1,
-0.9528184, -0.4032797, -1.761061, 0.972549, 1, 0, 1,
-0.9443397, -0.8027003, -1.225513, 0.9686275, 1, 0, 1,
-0.9430972, -0.7602597, -1.220035, 0.9607843, 1, 0, 1,
-0.9423496, -0.3046193, -2.807216, 0.9568627, 1, 0, 1,
-0.9384513, -0.1717699, -1.151831, 0.9490196, 1, 0, 1,
-0.934168, -0.4596306, -1.338005, 0.945098, 1, 0, 1,
-0.9267107, -1.017852, -1.366436, 0.9372549, 1, 0, 1,
-0.9135737, 0.8675414, -1.922699, 0.9333333, 1, 0, 1,
-0.9127398, 0.4317071, -1.726516, 0.9254902, 1, 0, 1,
-0.9016977, -1.550259, -1.487939, 0.9215686, 1, 0, 1,
-0.901636, 0.3136428, 0.1221631, 0.9137255, 1, 0, 1,
-0.8891118, 0.3533793, -1.66222, 0.9098039, 1, 0, 1,
-0.8781412, -0.314826, -3.02566, 0.9019608, 1, 0, 1,
-0.8769177, 0.2621176, -2.177921, 0.8941177, 1, 0, 1,
-0.8763384, 0.2038335, -0.3929284, 0.8901961, 1, 0, 1,
-0.86939, 0.841278, -1.510392, 0.8823529, 1, 0, 1,
-0.8624049, -1.158126, -2.683279, 0.8784314, 1, 0, 1,
-0.860908, -0.622368, -1.03479, 0.8705882, 1, 0, 1,
-0.8604313, -0.8658971, -2.50462, 0.8666667, 1, 0, 1,
-0.8554521, 0.1569021, -1.088943, 0.8588235, 1, 0, 1,
-0.8549969, -1.379459, -2.821365, 0.854902, 1, 0, 1,
-0.8518251, 1.009462, -0.7400658, 0.8470588, 1, 0, 1,
-0.8427649, -0.2640828, -0.5241348, 0.8431373, 1, 0, 1,
-0.8387563, 0.8861892, -0.2089124, 0.8352941, 1, 0, 1,
-0.8309815, -0.2653752, -3.445403, 0.8313726, 1, 0, 1,
-0.8305309, -0.06729827, 0.1924466, 0.8235294, 1, 0, 1,
-0.8292906, 0.4411652, -0.9882423, 0.8196079, 1, 0, 1,
-0.8260018, 0.1473512, -1.754993, 0.8117647, 1, 0, 1,
-0.8204527, -1.146233, -2.353917, 0.8078431, 1, 0, 1,
-0.8163999, 0.1023607, -1.612441, 0.8, 1, 0, 1,
-0.8142166, 0.8516717, -1.177373, 0.7921569, 1, 0, 1,
-0.810068, 1.04031, -0.2029106, 0.7882353, 1, 0, 1,
-0.8067645, 1.309538, -1.568159, 0.7803922, 1, 0, 1,
-0.8004873, -0.5007052, -1.334194, 0.7764706, 1, 0, 1,
-0.7990119, 0.1437481, -2.664436, 0.7686275, 1, 0, 1,
-0.7979063, 0.3210428, -2.557386, 0.7647059, 1, 0, 1,
-0.7974956, 0.6595227, -0.3562113, 0.7568628, 1, 0, 1,
-0.7937064, 1.208522, -0.377943, 0.7529412, 1, 0, 1,
-0.793689, 0.2455965, -0.1972239, 0.7450981, 1, 0, 1,
-0.793102, 1.124294, -1.129967, 0.7411765, 1, 0, 1,
-0.7911863, 0.3516562, 0.02226335, 0.7333333, 1, 0, 1,
-0.7839524, 0.2913578, -1.121018, 0.7294118, 1, 0, 1,
-0.7795653, -0.4247769, -1.010356, 0.7215686, 1, 0, 1,
-0.7765764, 1.18071, -1.900376, 0.7176471, 1, 0, 1,
-0.7623154, -0.7890396, -3.245213, 0.7098039, 1, 0, 1,
-0.762291, -0.4739682, -3.499729, 0.7058824, 1, 0, 1,
-0.7608482, 1.222564, -1.332299, 0.6980392, 1, 0, 1,
-0.7593397, 0.550772, -1.842964, 0.6901961, 1, 0, 1,
-0.7583508, 0.8011212, -0.494384, 0.6862745, 1, 0, 1,
-0.7552357, -0.4407144, -2.005328, 0.6784314, 1, 0, 1,
-0.7534486, -0.4411044, -2.328387, 0.6745098, 1, 0, 1,
-0.753057, 1.11131, 0.3705169, 0.6666667, 1, 0, 1,
-0.7519371, -0.4676531, -3.254523, 0.6627451, 1, 0, 1,
-0.7514206, 0.528618, -3.134861, 0.654902, 1, 0, 1,
-0.7507927, 1.084148, -0.6232558, 0.6509804, 1, 0, 1,
-0.7490543, -1.516481, -3.290073, 0.6431373, 1, 0, 1,
-0.7437297, 0.6650661, 0.1823834, 0.6392157, 1, 0, 1,
-0.7363329, 0.2954878, -1.995572, 0.6313726, 1, 0, 1,
-0.7247473, -0.6217011, -4.213273, 0.627451, 1, 0, 1,
-0.7213218, 0.2045896, 0.3117929, 0.6196079, 1, 0, 1,
-0.7203794, -1.258554, -2.661358, 0.6156863, 1, 0, 1,
-0.7154387, 0.6302299, 0.2333165, 0.6078432, 1, 0, 1,
-0.7110687, -0.4122248, -3.657507, 0.6039216, 1, 0, 1,
-0.7035338, 0.4635301, -2.007427, 0.5960785, 1, 0, 1,
-0.7018119, 0.395611, -0.7921692, 0.5882353, 1, 0, 1,
-0.6958728, 0.1388152, -1.144693, 0.5843138, 1, 0, 1,
-0.6941707, 0.01253445, -1.839213, 0.5764706, 1, 0, 1,
-0.6775032, -1.486307, -1.452261, 0.572549, 1, 0, 1,
-0.6756127, 1.026571, -1.371103, 0.5647059, 1, 0, 1,
-0.672484, 1.532902, -1.551358, 0.5607843, 1, 0, 1,
-0.6707454, -0.005505945, -1.859702, 0.5529412, 1, 0, 1,
-0.6651207, 1.076439, -0.1590356, 0.5490196, 1, 0, 1,
-0.664008, -1.260616, -2.831497, 0.5411765, 1, 0, 1,
-0.6601089, 0.775199, 0.2220026, 0.5372549, 1, 0, 1,
-0.6597996, 0.5993782, -0.5608873, 0.5294118, 1, 0, 1,
-0.6581084, -0.3053046, -1.54574, 0.5254902, 1, 0, 1,
-0.6574628, 0.2141182, -2.196157, 0.5176471, 1, 0, 1,
-0.6523579, -0.8679311, -3.137378, 0.5137255, 1, 0, 1,
-0.6475557, 0.4064818, -1.721388, 0.5058824, 1, 0, 1,
-0.6473117, 0.3660992, 0.1777811, 0.5019608, 1, 0, 1,
-0.6418885, -0.3061109, -1.21269, 0.4941176, 1, 0, 1,
-0.6296924, -0.5418766, -2.143158, 0.4862745, 1, 0, 1,
-0.6276513, -0.4398324, -2.108219, 0.4823529, 1, 0, 1,
-0.6248969, 0.6186056, -0.5437053, 0.4745098, 1, 0, 1,
-0.6235445, -0.3822262, -1.497866, 0.4705882, 1, 0, 1,
-0.6230148, 0.007545885, -0.7303789, 0.4627451, 1, 0, 1,
-0.6219461, -0.3303168, -3.123766, 0.4588235, 1, 0, 1,
-0.6207984, -1.612573, -4.76959, 0.4509804, 1, 0, 1,
-0.6195707, 2.08998, -0.1347575, 0.4470588, 1, 0, 1,
-0.6159122, -1.010036, -1.429579, 0.4392157, 1, 0, 1,
-0.6119668, 0.7195538, -2.140985, 0.4352941, 1, 0, 1,
-0.6103064, 1.044054, 0.3283255, 0.427451, 1, 0, 1,
-0.6092654, 0.9863462, 0.7359442, 0.4235294, 1, 0, 1,
-0.6007617, -0.1833841, -3.714429, 0.4156863, 1, 0, 1,
-0.5990656, 1.09096, 0.4696229, 0.4117647, 1, 0, 1,
-0.5939199, 0.2405167, -0.469476, 0.4039216, 1, 0, 1,
-0.588464, -0.3327056, -1.736595, 0.3960784, 1, 0, 1,
-0.587017, -0.03498608, -3.193006, 0.3921569, 1, 0, 1,
-0.5863538, -0.1763634, -1.378533, 0.3843137, 1, 0, 1,
-0.585202, 0.8028227, -1.399375, 0.3803922, 1, 0, 1,
-0.5808997, 1.625208, 1.81522, 0.372549, 1, 0, 1,
-0.5785105, -0.7503039, -1.304342, 0.3686275, 1, 0, 1,
-0.5778975, 1.71215, -1.596504, 0.3607843, 1, 0, 1,
-0.5751536, 0.3364423, -1.751039, 0.3568628, 1, 0, 1,
-0.5724979, 0.8635908, 0.06905503, 0.3490196, 1, 0, 1,
-0.5706658, -1.495048, -1.664375, 0.345098, 1, 0, 1,
-0.5697217, 0.4747436, -1.037255, 0.3372549, 1, 0, 1,
-0.5679492, -0.1434683, -2.344209, 0.3333333, 1, 0, 1,
-0.561412, -0.6236998, -2.262362, 0.3254902, 1, 0, 1,
-0.5612872, -0.3783225, -2.328691, 0.3215686, 1, 0, 1,
-0.5595719, -1.047475, -2.807527, 0.3137255, 1, 0, 1,
-0.5587298, -1.149744, -2.319087, 0.3098039, 1, 0, 1,
-0.550424, -0.6386061, -2.563717, 0.3019608, 1, 0, 1,
-0.5496999, 0.1585136, 0.07735916, 0.2941177, 1, 0, 1,
-0.547148, -0.372944, -4.601932, 0.2901961, 1, 0, 1,
-0.5455199, 0.5140522, -0.934729, 0.282353, 1, 0, 1,
-0.5437233, 1.335739, 2.056109, 0.2784314, 1, 0, 1,
-0.5402874, 1.095194, -1.419762, 0.2705882, 1, 0, 1,
-0.5389706, 0.2454352, 0.1682453, 0.2666667, 1, 0, 1,
-0.5384474, -1.256348, -1.688831, 0.2588235, 1, 0, 1,
-0.5375229, 0.8593553, -2.300967, 0.254902, 1, 0, 1,
-0.5304744, -0.0568623, -1.989404, 0.2470588, 1, 0, 1,
-0.5302682, -0.8099887, -2.028351, 0.2431373, 1, 0, 1,
-0.529146, -0.7556456, -3.225483, 0.2352941, 1, 0, 1,
-0.5281992, 0.761899, 0.5429162, 0.2313726, 1, 0, 1,
-0.5268329, 0.607124, -1.347338, 0.2235294, 1, 0, 1,
-0.5260648, 0.6269967, -0.5534831, 0.2196078, 1, 0, 1,
-0.5244451, 0.01073266, -1.424664, 0.2117647, 1, 0, 1,
-0.5238778, -0.433678, -2.080822, 0.2078431, 1, 0, 1,
-0.5234886, 1.882006, 0.2935935, 0.2, 1, 0, 1,
-0.5198709, 0.5896462, -1.774332, 0.1921569, 1, 0, 1,
-0.5186873, -1.91224, -2.400839, 0.1882353, 1, 0, 1,
-0.5158323, -0.6448867, -3.880765, 0.1803922, 1, 0, 1,
-0.5148458, -0.8867453, -3.874506, 0.1764706, 1, 0, 1,
-0.5120487, 0.2992046, -1.92463, 0.1686275, 1, 0, 1,
-0.5113022, 0.4654569, 0.3906058, 0.1647059, 1, 0, 1,
-0.5102198, 0.1335044, -0.1848004, 0.1568628, 1, 0, 1,
-0.5095991, -0.7533553, -2.794669, 0.1529412, 1, 0, 1,
-0.5081514, 0.3219319, -1.799717, 0.145098, 1, 0, 1,
-0.5007935, 0.2237306, -2.578865, 0.1411765, 1, 0, 1,
-0.5005237, -0.7347023, -3.484829, 0.1333333, 1, 0, 1,
-0.5004081, -0.7469988, 0.211993, 0.1294118, 1, 0, 1,
-0.4971286, 0.2361184, -0.3018041, 0.1215686, 1, 0, 1,
-0.4963113, -0.9412571, -3.297291, 0.1176471, 1, 0, 1,
-0.4953677, 0.2853153, -2.786783, 0.1098039, 1, 0, 1,
-0.4908034, -0.877492, -3.322526, 0.1058824, 1, 0, 1,
-0.4901296, -0.4359758, -2.810387, 0.09803922, 1, 0, 1,
-0.4900739, -2.034693, -1.182067, 0.09019608, 1, 0, 1,
-0.4893054, 0.4092318, -2.967784, 0.08627451, 1, 0, 1,
-0.4888711, -0.6718878, -1.555796, 0.07843138, 1, 0, 1,
-0.4858977, 1.791207, -2.030046, 0.07450981, 1, 0, 1,
-0.4850588, 0.0422811, -1.210867, 0.06666667, 1, 0, 1,
-0.4832975, -0.8983889, -3.252477, 0.0627451, 1, 0, 1,
-0.4816452, 1.027089, 0.1763137, 0.05490196, 1, 0, 1,
-0.4768458, -1.316001, -1.109704, 0.05098039, 1, 0, 1,
-0.4759518, 2.390391, -1.454771, 0.04313726, 1, 0, 1,
-0.4753191, 0.01521972, -2.113656, 0.03921569, 1, 0, 1,
-0.4700124, -1.452843, -3.095301, 0.03137255, 1, 0, 1,
-0.4687034, 1.083869, 0.6102957, 0.02745098, 1, 0, 1,
-0.4654385, -0.4231539, -2.315182, 0.01960784, 1, 0, 1,
-0.4654239, -0.6439066, -1.123461, 0.01568628, 1, 0, 1,
-0.4639474, 0.4181543, -2.013347, 0.007843138, 1, 0, 1,
-0.4583841, 0.6840541, 1.251692, 0.003921569, 1, 0, 1,
-0.4536965, -0.7288017, -2.841821, 0, 1, 0.003921569, 1,
-0.4444288, -0.9533244, -2.768203, 0, 1, 0.01176471, 1,
-0.4436789, 0.2668387, -0.9325258, 0, 1, 0.01568628, 1,
-0.4395712, 0.4092078, 1.437499, 0, 1, 0.02352941, 1,
-0.4373776, -0.3930306, -2.099782, 0, 1, 0.02745098, 1,
-0.4346927, -1.34344, -2.756815, 0, 1, 0.03529412, 1,
-0.4280414, 0.8536342, -0.1150827, 0, 1, 0.03921569, 1,
-0.4278818, -0.007323305, -3.123029, 0, 1, 0.04705882, 1,
-0.4264608, 1.127612, -0.005254226, 0, 1, 0.05098039, 1,
-0.4253063, -1.967506, -2.949568, 0, 1, 0.05882353, 1,
-0.4223229, 0.7598999, -0.511012, 0, 1, 0.0627451, 1,
-0.4159344, -0.6216925, -1.766322, 0, 1, 0.07058824, 1,
-0.4156752, 0.5189418, 0.3361138, 0, 1, 0.07450981, 1,
-0.4137555, 0.1037465, -0.9745734, 0, 1, 0.08235294, 1,
-0.4122446, -0.008809194, -1.982928, 0, 1, 0.08627451, 1,
-0.4087757, -1.369813, -2.095366, 0, 1, 0.09411765, 1,
-0.4022881, 0.6079182, 0.2839713, 0, 1, 0.1019608, 1,
-0.4005007, 0.6968244, 0.6705188, 0, 1, 0.1058824, 1,
-0.4001617, 0.5160708, -1.193921, 0, 1, 0.1137255, 1,
-0.3978717, -0.3293528, -1.789211, 0, 1, 0.1176471, 1,
-0.3909977, 1.34751, 1.320817, 0, 1, 0.1254902, 1,
-0.3903652, -0.5395105, -1.80741, 0, 1, 0.1294118, 1,
-0.3884667, 1.47209, -1.335379, 0, 1, 0.1372549, 1,
-0.3852295, -1.429517, -2.873961, 0, 1, 0.1411765, 1,
-0.3851864, 1.596966, -1.556986, 0, 1, 0.1490196, 1,
-0.3824392, 0.3181029, -1.142357, 0, 1, 0.1529412, 1,
-0.3730638, -1.423869, -2.415304, 0, 1, 0.1607843, 1,
-0.3712533, 0.6069345, 0.2592962, 0, 1, 0.1647059, 1,
-0.3673486, 0.498153, -0.2923092, 0, 1, 0.172549, 1,
-0.3544045, 1.68663, 1.832145, 0, 1, 0.1764706, 1,
-0.3477997, -0.4210376, -2.409985, 0, 1, 0.1843137, 1,
-0.3461694, 0.5205621, 0.1866062, 0, 1, 0.1882353, 1,
-0.345769, -0.482135, -3.486122, 0, 1, 0.1960784, 1,
-0.3437312, -0.4113689, -3.560699, 0, 1, 0.2039216, 1,
-0.3421738, 0.1272309, -1.07927, 0, 1, 0.2078431, 1,
-0.3416997, 0.7683214, 0.03185037, 0, 1, 0.2156863, 1,
-0.3316864, -0.6216339, -2.274524, 0, 1, 0.2196078, 1,
-0.3315638, 0.8857874, -1.628104, 0, 1, 0.227451, 1,
-0.3300551, -0.8440019, -4.742648, 0, 1, 0.2313726, 1,
-0.3290608, 1.180925, 2.044407, 0, 1, 0.2392157, 1,
-0.3267494, 0.3599819, -0.3929667, 0, 1, 0.2431373, 1,
-0.3252628, -0.4804923, -2.019383, 0, 1, 0.2509804, 1,
-0.3215406, -0.4949166, -1.730068, 0, 1, 0.254902, 1,
-0.3210511, 0.3489634, -1.339331, 0, 1, 0.2627451, 1,
-0.3206282, -0.4810679, -3.034975, 0, 1, 0.2666667, 1,
-0.3199876, 2.054954, -0.3233586, 0, 1, 0.2745098, 1,
-0.3182628, 0.03176503, -2.198525, 0, 1, 0.2784314, 1,
-0.3158558, 1.464935, 0.6244455, 0, 1, 0.2862745, 1,
-0.3132439, 0.8555492, -1.341555, 0, 1, 0.2901961, 1,
-0.2966246, -1.823993, -1.031218, 0, 1, 0.2980392, 1,
-0.2946319, 1.455328, -1.461474, 0, 1, 0.3058824, 1,
-0.2899021, 0.615813, 0.06090667, 0, 1, 0.3098039, 1,
-0.2870528, -0.5423746, -3.417364, 0, 1, 0.3176471, 1,
-0.2863076, 1.19536, 0.6199424, 0, 1, 0.3215686, 1,
-0.2862258, 0.1712472, -1.731623, 0, 1, 0.3294118, 1,
-0.2843693, 0.1174245, -2.123919, 0, 1, 0.3333333, 1,
-0.2838268, -0.8812895, -2.266248, 0, 1, 0.3411765, 1,
-0.2837066, 2.185791, -1.82412, 0, 1, 0.345098, 1,
-0.2827472, -1.142798, -4.498181, 0, 1, 0.3529412, 1,
-0.2817149, -0.6239954, -2.047006, 0, 1, 0.3568628, 1,
-0.2797134, -0.4296032, -2.73489, 0, 1, 0.3647059, 1,
-0.2768807, -2.016399, -3.131631, 0, 1, 0.3686275, 1,
-0.2733287, 0.1478062, -0.6297523, 0, 1, 0.3764706, 1,
-0.2701877, -0.3084872, -2.78611, 0, 1, 0.3803922, 1,
-0.2686692, 2.323592, -0.756556, 0, 1, 0.3882353, 1,
-0.2622029, 0.04308813, -1.941543, 0, 1, 0.3921569, 1,
-0.2545602, 0.118269, -2.308181, 0, 1, 0.4, 1,
-0.2500592, -1.970711, -3.873, 0, 1, 0.4078431, 1,
-0.249494, 0.2074312, -1.682102, 0, 1, 0.4117647, 1,
-0.2477061, -0.743022, -3.39676, 0, 1, 0.4196078, 1,
-0.2437728, -1.856685, -2.136936, 0, 1, 0.4235294, 1,
-0.2387131, 0.9753377, 2.05311, 0, 1, 0.4313726, 1,
-0.236966, 0.8124599, 0.5833926, 0, 1, 0.4352941, 1,
-0.2359902, 0.791732, -0.169533, 0, 1, 0.4431373, 1,
-0.2352288, 2.266365, -0.6374254, 0, 1, 0.4470588, 1,
-0.2322792, 1.109259, -1.188208, 0, 1, 0.454902, 1,
-0.2304025, -0.1957817, -1.100796, 0, 1, 0.4588235, 1,
-0.2298875, -0.3090838, -5.180474, 0, 1, 0.4666667, 1,
-0.228366, 0.6972977, -1.548796, 0, 1, 0.4705882, 1,
-0.2256624, 0.1254146, -2.029149, 0, 1, 0.4784314, 1,
-0.2243141, -0.6309063, -2.599051, 0, 1, 0.4823529, 1,
-0.220071, -0.8105537, -2.628746, 0, 1, 0.4901961, 1,
-0.2176976, 1.025989, -1.385053, 0, 1, 0.4941176, 1,
-0.2173693, -1.093667, -4.255652, 0, 1, 0.5019608, 1,
-0.2132092, -0.09020614, -4.619143, 0, 1, 0.509804, 1,
-0.2038165, -0.4583447, -3.442658, 0, 1, 0.5137255, 1,
-0.2029285, -0.7853107, -2.677539, 0, 1, 0.5215687, 1,
-0.1996244, 0.03500872, -1.470098, 0, 1, 0.5254902, 1,
-0.198449, -0.4357258, -3.43364, 0, 1, 0.5333334, 1,
-0.1975095, -0.5071334, -2.008322, 0, 1, 0.5372549, 1,
-0.1969084, 0.7975609, -0.04294744, 0, 1, 0.5450981, 1,
-0.1949991, -0.1770553, -0.651873, 0, 1, 0.5490196, 1,
-0.1944446, 2.226409, 0.3265361, 0, 1, 0.5568628, 1,
-0.1940555, -0.3390695, -4.450088, 0, 1, 0.5607843, 1,
-0.1938193, 1.928818, 0.1997132, 0, 1, 0.5686275, 1,
-0.1837368, 2.065642, 0.4061786, 0, 1, 0.572549, 1,
-0.1797104, 0.5635, -0.2527641, 0, 1, 0.5803922, 1,
-0.1760373, -0.3161756, -2.136829, 0, 1, 0.5843138, 1,
-0.173104, 0.285924, -1.383561, 0, 1, 0.5921569, 1,
-0.1670805, 1.139941, -0.3798619, 0, 1, 0.5960785, 1,
-0.1664421, 1.301257, -1.575788, 0, 1, 0.6039216, 1,
-0.165222, 1.696212, -0.6369821, 0, 1, 0.6117647, 1,
-0.1630558, 0.009786696, -1.535347, 0, 1, 0.6156863, 1,
-0.155719, 0.180998, -0.9037255, 0, 1, 0.6235294, 1,
-0.1552763, -1.214351, -4.071936, 0, 1, 0.627451, 1,
-0.148729, -1.01691, -3.812879, 0, 1, 0.6352941, 1,
-0.1470082, 1.194279, 1.986039, 0, 1, 0.6392157, 1,
-0.1398196, 1.15402, -0.9388267, 0, 1, 0.6470588, 1,
-0.1397182, 0.05026095, -1.992994, 0, 1, 0.6509804, 1,
-0.1368238, 0.4978144, -1.203267, 0, 1, 0.6588235, 1,
-0.1356244, 0.9341927, -0.2774571, 0, 1, 0.6627451, 1,
-0.1339885, 0.0910179, 0.825521, 0, 1, 0.6705883, 1,
-0.1280409, -0.3634816, -2.388465, 0, 1, 0.6745098, 1,
-0.1238697, 0.8459646, 1.441417, 0, 1, 0.682353, 1,
-0.1223374, 0.6071572, -1.250875, 0, 1, 0.6862745, 1,
-0.1194815, -0.6077797, -2.64548, 0, 1, 0.6941177, 1,
-0.1170663, -0.3601138, -2.417558, 0, 1, 0.7019608, 1,
-0.1161281, -0.0001759868, -1.757105, 0, 1, 0.7058824, 1,
-0.1121903, 0.07769088, -2.161337, 0, 1, 0.7137255, 1,
-0.1113938, -0.5271017, -3.354797, 0, 1, 0.7176471, 1,
-0.1105149, -0.7380903, -2.763004, 0, 1, 0.7254902, 1,
-0.1104182, -1.329622, -2.721812, 0, 1, 0.7294118, 1,
-0.1093814, 1.035176, 0.06794429, 0, 1, 0.7372549, 1,
-0.106598, 0.0376558, -2.275483, 0, 1, 0.7411765, 1,
-0.105711, 0.5260168, -0.4624234, 0, 1, 0.7490196, 1,
-0.1039392, 1.69805, -0.5763869, 0, 1, 0.7529412, 1,
-0.1033885, -0.62608, -2.529702, 0, 1, 0.7607843, 1,
-0.1005136, -0.8812461, -1.370609, 0, 1, 0.7647059, 1,
-0.09803077, 0.6131039, 0.2193274, 0, 1, 0.772549, 1,
-0.09690506, 0.4707698, -1.28301, 0, 1, 0.7764706, 1,
-0.09371081, -0.4165181, -3.092625, 0, 1, 0.7843137, 1,
-0.0870221, 0.3080865, 0.157882, 0, 1, 0.7882353, 1,
-0.0859602, 0.6934786, 0.3948083, 0, 1, 0.7960784, 1,
-0.08497254, 1.398211, 0.2424919, 0, 1, 0.8039216, 1,
-0.08415101, -1.254495, -1.466899, 0, 1, 0.8078431, 1,
-0.0832498, -1.298445, -3.547627, 0, 1, 0.8156863, 1,
-0.07833705, -0.1504674, -3.625129, 0, 1, 0.8196079, 1,
-0.07475854, -1.781321, -2.750112, 0, 1, 0.827451, 1,
-0.07196318, -0.454955, -4.805915, 0, 1, 0.8313726, 1,
-0.06362991, 0.2872347, -1.458894, 0, 1, 0.8392157, 1,
-0.06259587, 0.8528278, 0.7020879, 0, 1, 0.8431373, 1,
-0.05959124, 0.008572335, -1.742914, 0, 1, 0.8509804, 1,
-0.05929651, 0.6939985, -0.5759615, 0, 1, 0.854902, 1,
-0.05739455, 0.2932998, -1.765157, 0, 1, 0.8627451, 1,
-0.055215, -1.663009, -4.001692, 0, 1, 0.8666667, 1,
-0.05236363, 1.290495, -0.1024165, 0, 1, 0.8745098, 1,
-0.05226051, 0.5269617, -0.3252732, 0, 1, 0.8784314, 1,
-0.04459354, -0.4308207, -2.973698, 0, 1, 0.8862745, 1,
-0.04122872, 0.675799, 0.002642445, 0, 1, 0.8901961, 1,
-0.04083334, -0.8277677, -4.193614, 0, 1, 0.8980392, 1,
-0.03647941, -0.08186511, -4.197406, 0, 1, 0.9058824, 1,
-0.03439873, -1.090111, -5.0984, 0, 1, 0.9098039, 1,
-0.03352073, 0.1802492, -0.9656144, 0, 1, 0.9176471, 1,
-0.0323461, 2.031529, 0.1717867, 0, 1, 0.9215686, 1,
-0.0293979, 1.022433, 2.333482, 0, 1, 0.9294118, 1,
-0.02391917, 1.645927, -0.08264109, 0, 1, 0.9333333, 1,
-0.01520455, 0.9304777, -1.405599, 0, 1, 0.9411765, 1,
-0.01326306, 1.267536, -0.6682878, 0, 1, 0.945098, 1,
-0.01202071, 0.3408876, 0.9697155, 0, 1, 0.9529412, 1,
-0.007480952, -0.608474, -2.469205, 0, 1, 0.9568627, 1,
-0.001601576, 1.59155, 0.5505591, 0, 1, 0.9647059, 1,
-0.001131476, 0.8818008, 0.7891461, 0, 1, 0.9686275, 1,
0.0002790246, -0.1019496, 2.377202, 0, 1, 0.9764706, 1,
0.001798377, 0.06059512, 0.6658738, 0, 1, 0.9803922, 1,
0.004402443, 0.08464104, -0.8314848, 0, 1, 0.9882353, 1,
0.005846331, 0.721166, 1.916369, 0, 1, 0.9921569, 1,
0.006366254, -1.302633, 4.500881, 0, 1, 1, 1,
0.01288555, 0.3787269, -0.259831, 0, 0.9921569, 1, 1,
0.01291422, 1.101908, 0.2868555, 0, 0.9882353, 1, 1,
0.02112143, -0.4067883, 3.534924, 0, 0.9803922, 1, 1,
0.02443182, -0.552744, 3.891279, 0, 0.9764706, 1, 1,
0.02897568, -1.381177, 2.489231, 0, 0.9686275, 1, 1,
0.03066901, -0.4998541, 2.657764, 0, 0.9647059, 1, 1,
0.03098786, -0.2106993, 2.721458, 0, 0.9568627, 1, 1,
0.03215177, -0.4555336, 3.012916, 0, 0.9529412, 1, 1,
0.03865884, 0.02362797, 0.506332, 0, 0.945098, 1, 1,
0.04280394, -0.598622, 3.004935, 0, 0.9411765, 1, 1,
0.04403185, -0.9667505, 2.795235, 0, 0.9333333, 1, 1,
0.04733736, -0.4374089, 1.517444, 0, 0.9294118, 1, 1,
0.04808462, 0.2243721, -2.041382, 0, 0.9215686, 1, 1,
0.04850514, 1.975344, 0.4003543, 0, 0.9176471, 1, 1,
0.04913574, 0.5415867, 1.85115, 0, 0.9098039, 1, 1,
0.04924062, 0.7734546, 0.9432388, 0, 0.9058824, 1, 1,
0.05019078, 0.6237473, 0.1113033, 0, 0.8980392, 1, 1,
0.05424378, 0.9045159, -0.5229172, 0, 0.8901961, 1, 1,
0.05866696, 1.919617, 0.3728534, 0, 0.8862745, 1, 1,
0.05985375, -0.2403413, 2.485906, 0, 0.8784314, 1, 1,
0.06109225, -0.3976114, 3.453355, 0, 0.8745098, 1, 1,
0.0619379, -0.8346803, 1.650241, 0, 0.8666667, 1, 1,
0.06283177, -0.1563082, 3.393457, 0, 0.8627451, 1, 1,
0.06994522, -0.8089251, 3.467034, 0, 0.854902, 1, 1,
0.07289512, 0.1527123, -1.216292, 0, 0.8509804, 1, 1,
0.07452703, 1.291026, 0.1489391, 0, 0.8431373, 1, 1,
0.0841802, -1.449249, 3.204136, 0, 0.8392157, 1, 1,
0.08673646, 1.790946, 0.838515, 0, 0.8313726, 1, 1,
0.09421699, -0.2413862, 1.582922, 0, 0.827451, 1, 1,
0.09649227, 0.2395379, 0.1208868, 0, 0.8196079, 1, 1,
0.09703726, 0.4490962, 0.1924088, 0, 0.8156863, 1, 1,
0.09876762, 0.2805655, 0.2011957, 0, 0.8078431, 1, 1,
0.1086866, 0.9015045, -0.09959566, 0, 0.8039216, 1, 1,
0.1100513, -0.07413855, 2.759195, 0, 0.7960784, 1, 1,
0.1113547, 0.9726398, 0.5570874, 0, 0.7882353, 1, 1,
0.1131462, -1.33538, 3.443301, 0, 0.7843137, 1, 1,
0.1320927, 0.398179, 0.4235234, 0, 0.7764706, 1, 1,
0.1354178, -1.010057, 3.471981, 0, 0.772549, 1, 1,
0.1380412, -0.04647684, 1.800197, 0, 0.7647059, 1, 1,
0.1384712, 1.00147, -1.927047, 0, 0.7607843, 1, 1,
0.1407253, 0.07531101, 1.645312, 0, 0.7529412, 1, 1,
0.1413969, 0.4741806, 1.043966, 0, 0.7490196, 1, 1,
0.1431797, -1.280053, 4.339291, 0, 0.7411765, 1, 1,
0.1462739, 1.857112, -0.4795787, 0, 0.7372549, 1, 1,
0.1468529, -0.01179812, 1.133327, 0, 0.7294118, 1, 1,
0.147407, 0.364627, 1.024573, 0, 0.7254902, 1, 1,
0.1482248, -1.718498, 2.435353, 0, 0.7176471, 1, 1,
0.1506043, 0.4727696, 0.9768608, 0, 0.7137255, 1, 1,
0.1530083, 0.1923002, 0.06804676, 0, 0.7058824, 1, 1,
0.1535743, -0.6954926, 4.107613, 0, 0.6980392, 1, 1,
0.1552486, 0.1539021, 1.589157, 0, 0.6941177, 1, 1,
0.1595659, 0.954595, 0.8070261, 0, 0.6862745, 1, 1,
0.16274, 0.3037581, 0.2658823, 0, 0.682353, 1, 1,
0.1669364, 0.3479977, 0.685169, 0, 0.6745098, 1, 1,
0.1670282, 1.905572, -1.725276, 0, 0.6705883, 1, 1,
0.1761453, -1.577292, 2.589461, 0, 0.6627451, 1, 1,
0.1822578, -0.2962841, 0.8512201, 0, 0.6588235, 1, 1,
0.1823814, 0.9310631, 0.07558236, 0, 0.6509804, 1, 1,
0.1860681, 0.9102265, 0.9731334, 0, 0.6470588, 1, 1,
0.1885669, 0.5445015, -1.080665, 0, 0.6392157, 1, 1,
0.1905595, -0.1813714, 3.069599, 0, 0.6352941, 1, 1,
0.1907813, 0.1994378, -0.6383073, 0, 0.627451, 1, 1,
0.1924731, -1.14752, 2.185654, 0, 0.6235294, 1, 1,
0.1957156, -2.173083, 2.833508, 0, 0.6156863, 1, 1,
0.1986956, -1.152678, 2.959438, 0, 0.6117647, 1, 1,
0.1990235, -0.9931319, 3.332081, 0, 0.6039216, 1, 1,
0.2005187, 1.231737, -1.398585, 0, 0.5960785, 1, 1,
0.2046206, 1.013859, -1.325722, 0, 0.5921569, 1, 1,
0.2047556, 0.2889707, 1.338913, 0, 0.5843138, 1, 1,
0.2050176, 1.146842, 0.9342946, 0, 0.5803922, 1, 1,
0.2068521, -0.570738, 3.601607, 0, 0.572549, 1, 1,
0.2102213, -2.188865, 1.239842, 0, 0.5686275, 1, 1,
0.2105025, -2.053528, 3.888756, 0, 0.5607843, 1, 1,
0.2123045, -0.04121765, 0.8680502, 0, 0.5568628, 1, 1,
0.2195517, -0.4967833, 3.437318, 0, 0.5490196, 1, 1,
0.2215696, 0.05258957, 0.07891612, 0, 0.5450981, 1, 1,
0.224408, -0.6456714, 1.709674, 0, 0.5372549, 1, 1,
0.225809, -1.674789, 3.531705, 0, 0.5333334, 1, 1,
0.2305489, -0.298223, 2.788882, 0, 0.5254902, 1, 1,
0.2311829, -0.6517881, 2.973886, 0, 0.5215687, 1, 1,
0.2362667, 1.640991, 0.741704, 0, 0.5137255, 1, 1,
0.2383468, 1.000306, -1.333553, 0, 0.509804, 1, 1,
0.2410484, -1.583228, 1.956892, 0, 0.5019608, 1, 1,
0.2413038, -0.7043338, 1.974569, 0, 0.4941176, 1, 1,
0.2606343, -0.6544644, 2.065474, 0, 0.4901961, 1, 1,
0.2609265, 2.06113, -0.5412367, 0, 0.4823529, 1, 1,
0.261265, 0.464069, -0.2612323, 0, 0.4784314, 1, 1,
0.2642891, 0.2925067, 1.181601, 0, 0.4705882, 1, 1,
0.2679624, 1.69027, 0.1919037, 0, 0.4666667, 1, 1,
0.2680005, 0.4839803, 0.1001773, 0, 0.4588235, 1, 1,
0.2691747, 1.964528, 0.1556859, 0, 0.454902, 1, 1,
0.2701426, 1.307003, 0.2160722, 0, 0.4470588, 1, 1,
0.2728433, -0.6144997, 3.779742, 0, 0.4431373, 1, 1,
0.2750864, 0.3253092, 0.3160923, 0, 0.4352941, 1, 1,
0.2752281, 0.2172837, -0.7335728, 0, 0.4313726, 1, 1,
0.2756855, 0.260259, -0.6355159, 0, 0.4235294, 1, 1,
0.2786056, 0.573401, 0.4579994, 0, 0.4196078, 1, 1,
0.2796878, 0.9474411, -0.2874911, 0, 0.4117647, 1, 1,
0.2802269, 0.6776897, -0.5585889, 0, 0.4078431, 1, 1,
0.2836893, 1.3797, -0.5442317, 0, 0.4, 1, 1,
0.2852576, 0.7025807, 0.8535362, 0, 0.3921569, 1, 1,
0.286037, 1.021957, 1.044178, 0, 0.3882353, 1, 1,
0.2877176, -0.1806504, 2.469039, 0, 0.3803922, 1, 1,
0.2896835, -0.05662197, -0.06094578, 0, 0.3764706, 1, 1,
0.2931603, 0.9044625, -0.423223, 0, 0.3686275, 1, 1,
0.3007595, -1.301515, 4.230031, 0, 0.3647059, 1, 1,
0.3017403, -1.566993, 3.141737, 0, 0.3568628, 1, 1,
0.3042136, -0.6055369, 3.131153, 0, 0.3529412, 1, 1,
0.3051482, -1.463703, 3.127882, 0, 0.345098, 1, 1,
0.3098901, -0.4458314, 3.928335, 0, 0.3411765, 1, 1,
0.3121166, 1.310373, 0.1160565, 0, 0.3333333, 1, 1,
0.3139504, 0.1364006, 1.017986, 0, 0.3294118, 1, 1,
0.3247087, 1.15194, 0.5090794, 0, 0.3215686, 1, 1,
0.3248155, 1.251423, 2.743583, 0, 0.3176471, 1, 1,
0.3317959, -1.122499, 2.690437, 0, 0.3098039, 1, 1,
0.3319423, -0.5595667, 0.8776316, 0, 0.3058824, 1, 1,
0.3337211, -0.7701071, 4.029324, 0, 0.2980392, 1, 1,
0.3365336, -0.7057311, 2.533928, 0, 0.2901961, 1, 1,
0.3375093, -0.1975582, 2.57048, 0, 0.2862745, 1, 1,
0.33839, -0.5709162, 2.8807, 0, 0.2784314, 1, 1,
0.3404846, 0.3648219, 1.452175, 0, 0.2745098, 1, 1,
0.3407417, 1.861693, -0.7801337, 0, 0.2666667, 1, 1,
0.3411541, -2.249099, 3.565289, 0, 0.2627451, 1, 1,
0.3444232, 0.4840628, 1.001685, 0, 0.254902, 1, 1,
0.3444491, 0.7388137, 0.7203325, 0, 0.2509804, 1, 1,
0.3452804, -1.785695, 3.893368, 0, 0.2431373, 1, 1,
0.3463757, 1.010415, 0.04820769, 0, 0.2392157, 1, 1,
0.3478642, 0.3929693, 0.6492347, 0, 0.2313726, 1, 1,
0.3583329, -0.2183923, 2.167461, 0, 0.227451, 1, 1,
0.36065, 0.5387424, 1.995961, 0, 0.2196078, 1, 1,
0.3617835, 0.7403507, 0.3693543, 0, 0.2156863, 1, 1,
0.3637049, 0.5295955, 0.6446009, 0, 0.2078431, 1, 1,
0.3642216, -0.4070918, 3.320636, 0, 0.2039216, 1, 1,
0.375184, 0.787281, 1.403006, 0, 0.1960784, 1, 1,
0.375615, 0.7326959, 1.948594, 0, 0.1882353, 1, 1,
0.3758229, -2.255272, 3.094239, 0, 0.1843137, 1, 1,
0.3797204, 0.1406149, 0.9919894, 0, 0.1764706, 1, 1,
0.379724, -1.126716, 2.721407, 0, 0.172549, 1, 1,
0.3832153, 0.1006466, 2.910109, 0, 0.1647059, 1, 1,
0.3842623, 0.3503653, 2.703554, 0, 0.1607843, 1, 1,
0.3862642, 0.8889288, 0.2825713, 0, 0.1529412, 1, 1,
0.3897811, -0.5871254, 2.987186, 0, 0.1490196, 1, 1,
0.391066, 1.040608, 1.709663, 0, 0.1411765, 1, 1,
0.3912615, -1.078259, 2.440203, 0, 0.1372549, 1, 1,
0.3981246, -0.09263152, 0.806811, 0, 0.1294118, 1, 1,
0.3996255, -0.383742, 3.281664, 0, 0.1254902, 1, 1,
0.4005755, -1.553324, 2.862102, 0, 0.1176471, 1, 1,
0.4010742, 1.435926, 0.4424399, 0, 0.1137255, 1, 1,
0.4023468, -0.5865796, 3.295743, 0, 0.1058824, 1, 1,
0.4033793, 1.315898, 1.869588, 0, 0.09803922, 1, 1,
0.4069439, -0.8208429, 2.709032, 0, 0.09411765, 1, 1,
0.4150665, -0.2277115, 1.374566, 0, 0.08627451, 1, 1,
0.4165056, -0.39665, 0.730948, 0, 0.08235294, 1, 1,
0.4193723, 1.400558, 2.242256, 0, 0.07450981, 1, 1,
0.4230775, -1.483117, 4.585559, 0, 0.07058824, 1, 1,
0.4236041, 0.73006, 0.03722923, 0, 0.0627451, 1, 1,
0.4269736, 0.1774746, -0.1724337, 0, 0.05882353, 1, 1,
0.4345855, 1.402941, -2.195013, 0, 0.05098039, 1, 1,
0.436233, -0.2419041, 1.981456, 0, 0.04705882, 1, 1,
0.4420318, -0.1306047, -0.1411935, 0, 0.03921569, 1, 1,
0.4439697, 0.06107612, 1.402171, 0, 0.03529412, 1, 1,
0.4517817, -0.6555234, 2.572832, 0, 0.02745098, 1, 1,
0.4560498, 0.9543508, -1.024392, 0, 0.02352941, 1, 1,
0.4636487, 0.3880303, 0.5912323, 0, 0.01568628, 1, 1,
0.4674039, -1.272319, 3.611977, 0, 0.01176471, 1, 1,
0.4687136, -0.6919323, 2.38234, 0, 0.003921569, 1, 1,
0.4687406, -0.01233232, 1.275881, 0.003921569, 0, 1, 1,
0.4741666, 0.6262852, 0.3843656, 0.007843138, 0, 1, 1,
0.4756765, -0.2585744, 2.645443, 0.01568628, 0, 1, 1,
0.4771114, -0.5324247, 3.264682, 0.01960784, 0, 1, 1,
0.4820146, 0.1652053, 0.6601706, 0.02745098, 0, 1, 1,
0.4879472, -0.3742366, 3.372072, 0.03137255, 0, 1, 1,
0.4926161, 0.03382042, 0.5241575, 0.03921569, 0, 1, 1,
0.4926191, -0.5388067, 1.442527, 0.04313726, 0, 1, 1,
0.4946463, 0.8189035, -0.3641964, 0.05098039, 0, 1, 1,
0.4979523, -0.4928498, 2.255382, 0.05490196, 0, 1, 1,
0.4998743, 0.7306768, -0.5400466, 0.0627451, 0, 1, 1,
0.5008287, 0.390406, -0.4670447, 0.06666667, 0, 1, 1,
0.5014215, -0.1341866, 0.4203996, 0.07450981, 0, 1, 1,
0.5016248, -1.007087, 1.388476, 0.07843138, 0, 1, 1,
0.5071076, 2.311992, 0.1692467, 0.08627451, 0, 1, 1,
0.5081226, -1.269923, 2.895152, 0.09019608, 0, 1, 1,
0.5116418, -0.1914194, 2.611971, 0.09803922, 0, 1, 1,
0.5122288, -0.7568232, 3.317812, 0.1058824, 0, 1, 1,
0.5182092, -0.7128046, 1.990315, 0.1098039, 0, 1, 1,
0.5182233, -2.177819, 4.323206, 0.1176471, 0, 1, 1,
0.5196721, -0.2454532, 3.709281, 0.1215686, 0, 1, 1,
0.52561, -0.02536604, 1.943351, 0.1294118, 0, 1, 1,
0.525887, 0.07360965, 2.717435, 0.1333333, 0, 1, 1,
0.5263969, 0.958169, 1.779967, 0.1411765, 0, 1, 1,
0.528754, 1.139797, 0.7253059, 0.145098, 0, 1, 1,
0.5288, 1.780855, -0.5289192, 0.1529412, 0, 1, 1,
0.532834, 0.3516454, 0.9813153, 0.1568628, 0, 1, 1,
0.533229, 0.4344154, 1.372467, 0.1647059, 0, 1, 1,
0.5344657, -0.7724757, 2.098381, 0.1686275, 0, 1, 1,
0.5450774, -1.173585, 2.559776, 0.1764706, 0, 1, 1,
0.5452031, -0.5485027, 3.030691, 0.1803922, 0, 1, 1,
0.5453964, 1.116385, 2.457396, 0.1882353, 0, 1, 1,
0.5530536, -0.2462384, 1.774056, 0.1921569, 0, 1, 1,
0.5571384, 0.2253334, 3.276912, 0.2, 0, 1, 1,
0.5605984, 1.942739, 0.7912655, 0.2078431, 0, 1, 1,
0.5607771, -0.01102634, 1.04867, 0.2117647, 0, 1, 1,
0.5669764, -1.664503, 4.188909, 0.2196078, 0, 1, 1,
0.5702443, -1.146601, 4.081086, 0.2235294, 0, 1, 1,
0.5703405, 0.3567032, -0.2425973, 0.2313726, 0, 1, 1,
0.5704239, 1.281694, -1.926177, 0.2352941, 0, 1, 1,
0.5730501, 0.9626311, -1.15235, 0.2431373, 0, 1, 1,
0.5773008, -0.3548191, 2.20125, 0.2470588, 0, 1, 1,
0.5840351, 0.8355983, 0.2561037, 0.254902, 0, 1, 1,
0.5859071, -0.5471618, 1.171069, 0.2588235, 0, 1, 1,
0.5859672, -1.380364, 3.085694, 0.2666667, 0, 1, 1,
0.5877503, -0.211565, 1.678525, 0.2705882, 0, 1, 1,
0.5907891, -0.01388074, 2.847173, 0.2784314, 0, 1, 1,
0.5918648, -0.568422, 2.427999, 0.282353, 0, 1, 1,
0.5921416, -1.086392, 1.077129, 0.2901961, 0, 1, 1,
0.5927215, 0.9844615, 0.04494134, 0.2941177, 0, 1, 1,
0.5930544, -1.233627, 2.868083, 0.3019608, 0, 1, 1,
0.5940841, 0.5218197, 1.011927, 0.3098039, 0, 1, 1,
0.5963353, -1.94744, 1.68568, 0.3137255, 0, 1, 1,
0.5979376, -1.226209, 3.891819, 0.3215686, 0, 1, 1,
0.5983683, -0.5468851, 2.052927, 0.3254902, 0, 1, 1,
0.59839, -0.06604572, 2.240799, 0.3333333, 0, 1, 1,
0.6036007, 1.485724, 0.06563569, 0.3372549, 0, 1, 1,
0.6036537, 1.175075, 0.939948, 0.345098, 0, 1, 1,
0.6072095, 1.806446, -0.9847003, 0.3490196, 0, 1, 1,
0.6072341, -0.09620291, 0.09893955, 0.3568628, 0, 1, 1,
0.6080728, -0.05085799, 1.475391, 0.3607843, 0, 1, 1,
0.6084967, -1.68266, 2.997182, 0.3686275, 0, 1, 1,
0.6093643, -0.6851561, 2.811844, 0.372549, 0, 1, 1,
0.6116492, 2.381915, -0.2774765, 0.3803922, 0, 1, 1,
0.6139214, -0.1994465, 0.4754631, 0.3843137, 0, 1, 1,
0.6172445, 1.00655, 0.6951258, 0.3921569, 0, 1, 1,
0.6195285, -0.2497723, 2.517085, 0.3960784, 0, 1, 1,
0.6222615, 1.493579, 2.005049, 0.4039216, 0, 1, 1,
0.6298882, -0.3790608, 2.634197, 0.4117647, 0, 1, 1,
0.6336865, -0.6383423, 3.59804, 0.4156863, 0, 1, 1,
0.6338268, -0.4436295, 2.381634, 0.4235294, 0, 1, 1,
0.6353027, -0.8639612, 3.608994, 0.427451, 0, 1, 1,
0.6394436, -0.2227078, 0.687264, 0.4352941, 0, 1, 1,
0.6404839, -1.191564, 2.033466, 0.4392157, 0, 1, 1,
0.6411131, 1.891852, -1.154203, 0.4470588, 0, 1, 1,
0.6503795, 0.4320382, 1.455612, 0.4509804, 0, 1, 1,
0.6549674, 0.4539485, 0.1227347, 0.4588235, 0, 1, 1,
0.6554332, 2.894074, 0.81688, 0.4627451, 0, 1, 1,
0.6555958, 0.4774227, 1.161017, 0.4705882, 0, 1, 1,
0.6562775, 0.3875125, 1.440989, 0.4745098, 0, 1, 1,
0.6594102, 0.5907687, 1.255497, 0.4823529, 0, 1, 1,
0.6667411, 0.3835435, -1.163156, 0.4862745, 0, 1, 1,
0.6678124, -0.555374, 2.467601, 0.4941176, 0, 1, 1,
0.6680488, 1.145931, -0.1330246, 0.5019608, 0, 1, 1,
0.6705722, 1.441855, 0.7355741, 0.5058824, 0, 1, 1,
0.6715788, -1.582275, 3.745121, 0.5137255, 0, 1, 1,
0.6762231, 0.1400902, 0.8098923, 0.5176471, 0, 1, 1,
0.6867595, 1.271096, -0.7612575, 0.5254902, 0, 1, 1,
0.6871072, 0.3683364, 1.469778, 0.5294118, 0, 1, 1,
0.6901501, -0.4590317, 0.4846593, 0.5372549, 0, 1, 1,
0.6941215, -1.348394, 2.707021, 0.5411765, 0, 1, 1,
0.6981153, 0.6515403, 0.4594108, 0.5490196, 0, 1, 1,
0.701583, 0.8930467, 0.8249912, 0.5529412, 0, 1, 1,
0.7025142, -0.3839699, 0.1903726, 0.5607843, 0, 1, 1,
0.7032473, 1.998064, -0.8878513, 0.5647059, 0, 1, 1,
0.7051738, 0.5271959, -0.4806128, 0.572549, 0, 1, 1,
0.7078882, 1.006694, -0.6563379, 0.5764706, 0, 1, 1,
0.7101687, -1.306142, 3.64181, 0.5843138, 0, 1, 1,
0.7118788, 0.6823981, 1.156443, 0.5882353, 0, 1, 1,
0.7160229, -1.598791, 2.49452, 0.5960785, 0, 1, 1,
0.7167271, -1.808438, 2.82912, 0.6039216, 0, 1, 1,
0.7182255, -0.8280023, 3.863322, 0.6078432, 0, 1, 1,
0.7213728, -1.223866, 2.801888, 0.6156863, 0, 1, 1,
0.729085, -0.2690593, 3.029691, 0.6196079, 0, 1, 1,
0.7304253, 0.2383577, 1.855119, 0.627451, 0, 1, 1,
0.7331164, -0.7699637, 1.839365, 0.6313726, 0, 1, 1,
0.737914, -1.596649, 1.871154, 0.6392157, 0, 1, 1,
0.7545722, -0.7375475, 2.448068, 0.6431373, 0, 1, 1,
0.7594037, 1.288378, -0.2221845, 0.6509804, 0, 1, 1,
0.7595099, 0.5185107, 0.2264515, 0.654902, 0, 1, 1,
0.7722647, -0.7800205, 1.90905, 0.6627451, 0, 1, 1,
0.7732825, 0.6552104, 0.8473463, 0.6666667, 0, 1, 1,
0.7764323, 0.771296, 0.7316157, 0.6745098, 0, 1, 1,
0.7803364, 1.028418, -0.2266857, 0.6784314, 0, 1, 1,
0.7837858, 0.8932806, -0.1723177, 0.6862745, 0, 1, 1,
0.7850571, 0.4569241, 1.413103, 0.6901961, 0, 1, 1,
0.7965374, 0.1287724, 0.2317735, 0.6980392, 0, 1, 1,
0.8095747, -0.3656653, 2.425274, 0.7058824, 0, 1, 1,
0.8101084, -0.2597524, 2.892876, 0.7098039, 0, 1, 1,
0.8122603, 0.1812847, 1.657579, 0.7176471, 0, 1, 1,
0.8130261, 1.495992, 1.303697, 0.7215686, 0, 1, 1,
0.8195749, 0.2202285, 0.09736764, 0.7294118, 0, 1, 1,
0.8223943, 0.3776401, 1.169833, 0.7333333, 0, 1, 1,
0.8302079, 0.2407012, 2.133134, 0.7411765, 0, 1, 1,
0.8340966, -0.003576166, -0.3731568, 0.7450981, 0, 1, 1,
0.8364062, -0.6002969, 2.066882, 0.7529412, 0, 1, 1,
0.8378564, -1.188687, 4.619934, 0.7568628, 0, 1, 1,
0.8481199, -0.6598337, 2.318695, 0.7647059, 0, 1, 1,
0.8506138, -1.032864, 3.914686, 0.7686275, 0, 1, 1,
0.8509029, -1.720829, 2.196048, 0.7764706, 0, 1, 1,
0.8550826, 0.1121684, 1.149691, 0.7803922, 0, 1, 1,
0.8601012, 0.6940048, -0.6817932, 0.7882353, 0, 1, 1,
0.8607814, 0.881291, 1.613973, 0.7921569, 0, 1, 1,
0.8650044, -2.867178, 2.380684, 0.8, 0, 1, 1,
0.8667184, -0.6013622, 3.187067, 0.8078431, 0, 1, 1,
0.8711334, -0.1024055, 1.023194, 0.8117647, 0, 1, 1,
0.8735619, 1.045512, 1.912343, 0.8196079, 0, 1, 1,
0.8767454, 0.5714593, 0.7521841, 0.8235294, 0, 1, 1,
0.8789711, 0.8547484, 0.6856439, 0.8313726, 0, 1, 1,
0.8790052, -0.8110627, 3.804531, 0.8352941, 0, 1, 1,
0.8804371, 0.3942291, 1.24248, 0.8431373, 0, 1, 1,
0.8884261, 0.04598672, -0.1702874, 0.8470588, 0, 1, 1,
0.8892995, 0.6500573, 1.244401, 0.854902, 0, 1, 1,
0.8913837, -0.8678049, 3.140079, 0.8588235, 0, 1, 1,
0.8934693, 1.212286, -0.3500742, 0.8666667, 0, 1, 1,
0.8998986, -0.3756395, 2.849648, 0.8705882, 0, 1, 1,
0.9004643, 1.662162, 1.660001, 0.8784314, 0, 1, 1,
0.9010966, 1.563557, 0.4016216, 0.8823529, 0, 1, 1,
0.9080293, 0.787251, 0.116888, 0.8901961, 0, 1, 1,
0.9135474, -2.292295, 3.134088, 0.8941177, 0, 1, 1,
0.9139621, 1.750563, 1.047327, 0.9019608, 0, 1, 1,
0.9192548, -0.1347942, 1.221124, 0.9098039, 0, 1, 1,
0.9248272, -0.366593, -1.171707, 0.9137255, 0, 1, 1,
0.9260743, -0.3566585, 1.874987, 0.9215686, 0, 1, 1,
0.9301302, 1.192699, 0.3511061, 0.9254902, 0, 1, 1,
0.9310964, 0.5300705, 0.7244337, 0.9333333, 0, 1, 1,
0.9314899, -0.2191643, 3.951538, 0.9372549, 0, 1, 1,
0.93161, -0.3476298, 2.330103, 0.945098, 0, 1, 1,
0.9374822, 0.7328262, 1.174384, 0.9490196, 0, 1, 1,
0.9395834, -0.4742913, 2.031492, 0.9568627, 0, 1, 1,
0.9404475, 1.191178, 2.326507, 0.9607843, 0, 1, 1,
0.9424948, 1.124168, 1.456727, 0.9686275, 0, 1, 1,
0.9603183, 0.3836101, 2.576512, 0.972549, 0, 1, 1,
0.964488, 0.1752371, 1.2763, 0.9803922, 0, 1, 1,
0.9813033, -2.268195, 3.918596, 0.9843137, 0, 1, 1,
0.9829749, 0.3181711, 2.529227, 0.9921569, 0, 1, 1,
0.9882895, -0.2380726, 3.083304, 0.9960784, 0, 1, 1,
0.9985486, -2.374914, 2.907503, 1, 0, 0.9960784, 1,
1.000522, 0.5927106, 3.599286, 1, 0, 0.9882353, 1,
1.001358, -0.8278478, 2.525757, 1, 0, 0.9843137, 1,
1.003785, 0.04985411, 0.878848, 1, 0, 0.9764706, 1,
1.005934, 0.2944494, 2.378044, 1, 0, 0.972549, 1,
1.009442, -0.6501799, 3.68397, 1, 0, 0.9647059, 1,
1.012759, -1.284817, 0.9228039, 1, 0, 0.9607843, 1,
1.016911, -0.6069179, 2.858792, 1, 0, 0.9529412, 1,
1.018011, 0.2716811, 2.368033, 1, 0, 0.9490196, 1,
1.023245, 0.1588494, 3.497255, 1, 0, 0.9411765, 1,
1.023795, 0.2313899, 0.4873099, 1, 0, 0.9372549, 1,
1.025494, 0.7087363, 0.9786595, 1, 0, 0.9294118, 1,
1.027621, -0.7667588, 2.116681, 1, 0, 0.9254902, 1,
1.032266, -0.05695928, 0.03821987, 1, 0, 0.9176471, 1,
1.036802, -1.233979, 0.9357365, 1, 0, 0.9137255, 1,
1.040903, -1.007327, 1.742025, 1, 0, 0.9058824, 1,
1.047335, -0.5441625, 2.188868, 1, 0, 0.9019608, 1,
1.054664, 1.310526, 0.07531467, 1, 0, 0.8941177, 1,
1.060892, -1.13475, 3.425241, 1, 0, 0.8862745, 1,
1.063012, 2.105728, -1.613709, 1, 0, 0.8823529, 1,
1.064334, 0.4251955, -1.08877, 1, 0, 0.8745098, 1,
1.066607, 1.079395, -0.6811707, 1, 0, 0.8705882, 1,
1.067441, 1.502775, 1.156711, 1, 0, 0.8627451, 1,
1.069063, -0.4717954, 0.06557538, 1, 0, 0.8588235, 1,
1.073231, 0.3709162, 3.454988, 1, 0, 0.8509804, 1,
1.076938, 0.3996088, 1.27047, 1, 0, 0.8470588, 1,
1.077006, -0.5873321, 2.785053, 1, 0, 0.8392157, 1,
1.082446, -0.6093569, 1.47413, 1, 0, 0.8352941, 1,
1.088817, -0.9189476, 0.1306021, 1, 0, 0.827451, 1,
1.099944, -0.1824204, 3.218445, 1, 0, 0.8235294, 1,
1.100883, 0.5967976, -1.126402, 1, 0, 0.8156863, 1,
1.102873, 0.2518566, 0.8428347, 1, 0, 0.8117647, 1,
1.105411, 0.8881882, 2.415132, 1, 0, 0.8039216, 1,
1.107627, 0.001188903, 2.91258, 1, 0, 0.7960784, 1,
1.115308, -0.4030406, 0.7794073, 1, 0, 0.7921569, 1,
1.117165, 0.1644427, 1.92738, 1, 0, 0.7843137, 1,
1.117825, -1.053083, 1.89721, 1, 0, 0.7803922, 1,
1.12004, 0.6463956, 1.619084, 1, 0, 0.772549, 1,
1.125119, 1.176238, 0.03098674, 1, 0, 0.7686275, 1,
1.128107, -0.5334026, 2.206796, 1, 0, 0.7607843, 1,
1.132346, 0.5017228, 0.9836211, 1, 0, 0.7568628, 1,
1.136149, 0.6432579, -0.2150057, 1, 0, 0.7490196, 1,
1.136706, -1.091041, 2.667824, 1, 0, 0.7450981, 1,
1.137201, 1.197917, 0.1634248, 1, 0, 0.7372549, 1,
1.140549, -0.0473921, 0.2648799, 1, 0, 0.7333333, 1,
1.143095, 0.04551127, 3.581578, 1, 0, 0.7254902, 1,
1.159103, -0.1618572, 2.73101, 1, 0, 0.7215686, 1,
1.165913, 0.6199788, 1.081725, 1, 0, 0.7137255, 1,
1.166624, -1.00532, 2.379055, 1, 0, 0.7098039, 1,
1.171238, 0.2203422, 0.6156042, 1, 0, 0.7019608, 1,
1.175717, -0.1710857, -0.9766145, 1, 0, 0.6941177, 1,
1.189693, -3.798653, 2.046167, 1, 0, 0.6901961, 1,
1.189848, -1.730616, 2.784973, 1, 0, 0.682353, 1,
1.194358, -0.5236416, 2.350065, 1, 0, 0.6784314, 1,
1.210287, 0.9598753, 0.2365181, 1, 0, 0.6705883, 1,
1.211924, 2.163584, 0.8337269, 1, 0, 0.6666667, 1,
1.213993, 1.732702, 0.9457586, 1, 0, 0.6588235, 1,
1.22089, -0.5488394, 0.3004597, 1, 0, 0.654902, 1,
1.221494, 0.9565703, -1.014147, 1, 0, 0.6470588, 1,
1.229579, -0.8689148, 3.402749, 1, 0, 0.6431373, 1,
1.230454, 0.6015301, 1.379032, 1, 0, 0.6352941, 1,
1.253474, -0.005012109, 1.19163, 1, 0, 0.6313726, 1,
1.255172, -0.6564733, 1.180836, 1, 0, 0.6235294, 1,
1.256277, -0.2578457, 0.5113958, 1, 0, 0.6196079, 1,
1.258414, 1.290187, 1.47775, 1, 0, 0.6117647, 1,
1.258809, -0.796458, 2.00411, 1, 0, 0.6078432, 1,
1.262086, 0.6841649, 1.940491, 1, 0, 0.6, 1,
1.262137, 0.4802606, 1.627554, 1, 0, 0.5921569, 1,
1.264953, -0.2727021, 4.814244, 1, 0, 0.5882353, 1,
1.274575, 2.209547, 0.2586348, 1, 0, 0.5803922, 1,
1.277108, -0.2246635, 0.1844401, 1, 0, 0.5764706, 1,
1.288935, -0.6355244, 1.672485, 1, 0, 0.5686275, 1,
1.290886, 1.205917, 0.487474, 1, 0, 0.5647059, 1,
1.293749, -3.174414, 2.791317, 1, 0, 0.5568628, 1,
1.296681, 0.1762182, 0.6291995, 1, 0, 0.5529412, 1,
1.297472, 0.09053349, 1.216233, 1, 0, 0.5450981, 1,
1.312661, 0.4075795, 0.6987068, 1, 0, 0.5411765, 1,
1.313513, -0.511631, 2.371968, 1, 0, 0.5333334, 1,
1.314505, -0.2778226, 0.07503687, 1, 0, 0.5294118, 1,
1.318016, -0.4886146, 2.722846, 1, 0, 0.5215687, 1,
1.331454, 1.040189, 1.611814, 1, 0, 0.5176471, 1,
1.341315, 0.1973393, 0.1856521, 1, 0, 0.509804, 1,
1.352744, 1.871722, 1.285995, 1, 0, 0.5058824, 1,
1.35713, 0.8989509, 1.608413, 1, 0, 0.4980392, 1,
1.359836, -0.0591246, 0.9833859, 1, 0, 0.4901961, 1,
1.366886, 1.497189, 0.4021273, 1, 0, 0.4862745, 1,
1.378034, -1.291916, 2.242383, 1, 0, 0.4784314, 1,
1.380774, -1.151783, 1.956288, 1, 0, 0.4745098, 1,
1.381358, 0.4509344, 1.776583, 1, 0, 0.4666667, 1,
1.384685, -0.4394045, 1.358928, 1, 0, 0.4627451, 1,
1.387839, 0.5991554, 1.859989, 1, 0, 0.454902, 1,
1.407598, -0.6400453, 2.930501, 1, 0, 0.4509804, 1,
1.414552, 0.9737296, 2.014028, 1, 0, 0.4431373, 1,
1.429219, 1.138181, 2.411149, 1, 0, 0.4392157, 1,
1.444105, 2.543037, -0.228941, 1, 0, 0.4313726, 1,
1.449031, 0.002427738, 2.586984, 1, 0, 0.427451, 1,
1.454278, 1.453671, 1.67977, 1, 0, 0.4196078, 1,
1.459038, 0.7157299, 1.94751, 1, 0, 0.4156863, 1,
1.460645, 1.321283, 0.7528324, 1, 0, 0.4078431, 1,
1.466389, 0.35794, -0.2121799, 1, 0, 0.4039216, 1,
1.484398, 0.5938887, -1.180996, 1, 0, 0.3960784, 1,
1.485023, -0.5069842, 1.764669, 1, 0, 0.3882353, 1,
1.497999, 2.128821, 1.286046, 1, 0, 0.3843137, 1,
1.507167, -0.1197278, 1.336919, 1, 0, 0.3764706, 1,
1.509578, 0.8282639, 1.513213, 1, 0, 0.372549, 1,
1.510904, 1.653639, 1.674566, 1, 0, 0.3647059, 1,
1.534221, 0.4194044, 0.7861968, 1, 0, 0.3607843, 1,
1.534619, 1.796799, 0.4980258, 1, 0, 0.3529412, 1,
1.546028, -0.2137293, 1.862023, 1, 0, 0.3490196, 1,
1.548139, -0.7278292, -1.441916, 1, 0, 0.3411765, 1,
1.583556, -0.4428906, 2.770586, 1, 0, 0.3372549, 1,
1.595738, -1.294757, 2.175393, 1, 0, 0.3294118, 1,
1.614862, -0.7245376, 1.093321, 1, 0, 0.3254902, 1,
1.635892, 0.08016878, 1.591945, 1, 0, 0.3176471, 1,
1.646742, -1.938077, 0.9733635, 1, 0, 0.3137255, 1,
1.651228, -1.501901, 3.242058, 1, 0, 0.3058824, 1,
1.653537, 0.18414, 1.699527, 1, 0, 0.2980392, 1,
1.675424, -0.02262144, 0.8518823, 1, 0, 0.2941177, 1,
1.684098, -1.313422, 2.49238, 1, 0, 0.2862745, 1,
1.693726, -1.491842, 1.096524, 1, 0, 0.282353, 1,
1.707677, -0.7323956, 2.018573, 1, 0, 0.2745098, 1,
1.716598, 0.2612168, -0.9277418, 1, 0, 0.2705882, 1,
1.722683, 0.6353248, 2.93867, 1, 0, 0.2627451, 1,
1.747869, 0.4248138, 2.48015, 1, 0, 0.2588235, 1,
1.751665, -2.023096, 2.831065, 1, 0, 0.2509804, 1,
1.803232, -1.283978, 2.618524, 1, 0, 0.2470588, 1,
1.803728, 2.282737, 2.350772, 1, 0, 0.2392157, 1,
1.807083, 1.431519, 0.8217503, 1, 0, 0.2352941, 1,
1.810852, -0.03551939, 0.6941894, 1, 0, 0.227451, 1,
1.829891, 0.1891622, 2.071898, 1, 0, 0.2235294, 1,
1.829891, 0.2479157, 0.8953391, 1, 0, 0.2156863, 1,
1.872786, 0.1706573, 2.142234, 1, 0, 0.2117647, 1,
1.878443, -0.9058895, 2.673064, 1, 0, 0.2039216, 1,
1.892671, 1.297563, 1.015542, 1, 0, 0.1960784, 1,
1.899189, -1.347796, 1.844058, 1, 0, 0.1921569, 1,
1.909103, 0.7719096, -0.2777002, 1, 0, 0.1843137, 1,
1.918915, 0.338067, 1.45636, 1, 0, 0.1803922, 1,
1.920751, 0.5635906, 0.3373783, 1, 0, 0.172549, 1,
1.92326, -2.023181, 2.259033, 1, 0, 0.1686275, 1,
1.971187, 1.369013, 0.08579287, 1, 0, 0.1607843, 1,
1.972966, 0.9163868, -0.0009265236, 1, 0, 0.1568628, 1,
1.986439, 0.01492715, 3.137143, 1, 0, 0.1490196, 1,
2.018383, -0.259499, 1.660218, 1, 0, 0.145098, 1,
2.021998, -0.5180677, 2.232835, 1, 0, 0.1372549, 1,
2.067569, -0.06094329, 1.272017, 1, 0, 0.1333333, 1,
2.073434, 0.931596, -0.8451738, 1, 0, 0.1254902, 1,
2.073775, 0.5866963, 1.438629, 1, 0, 0.1215686, 1,
2.080577, -1.069363, 2.789864, 1, 0, 0.1137255, 1,
2.091107, -1.011726, 2.686164, 1, 0, 0.1098039, 1,
2.097479, -1.852791, 3.572475, 1, 0, 0.1019608, 1,
2.119537, 0.7634324, 0.7070838, 1, 0, 0.09411765, 1,
2.124562, -0.7936237, 1.218299, 1, 0, 0.09019608, 1,
2.141163, 1.598921, 0.3350416, 1, 0, 0.08235294, 1,
2.142762, -0.205174, -0.5953299, 1, 0, 0.07843138, 1,
2.16151, -1.538447, 1.214376, 1, 0, 0.07058824, 1,
2.165127, 1.023317, 0.2655602, 1, 0, 0.06666667, 1,
2.183611, 0.3108934, 2.242041, 1, 0, 0.05882353, 1,
2.216779, 0.6237845, 0.9018348, 1, 0, 0.05490196, 1,
2.276556, -0.4960925, 1.120895, 1, 0, 0.04705882, 1,
2.32181, 0.5833664, 0.9399765, 1, 0, 0.04313726, 1,
2.356063, -0.2329164, 0.8240838, 1, 0, 0.03529412, 1,
2.367931, 0.6232317, 0.5373629, 1, 0, 0.03137255, 1,
2.368602, 0.201468, 0.883746, 1, 0, 0.02352941, 1,
2.440004, 1.028299, 0.7977564, 1, 0, 0.01960784, 1,
2.496706, 1.532934, 2.079868, 1, 0, 0.01176471, 1,
3.826715, -0.3044719, 1.766915, 1, 0, 0.007843138, 1
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
-0.3919151, -4.93307, -6.874579, 0, -0.5, 0.5, 0.5,
-0.3919151, -4.93307, -6.874579, 1, -0.5, 0.5, 0.5,
-0.3919151, -4.93307, -6.874579, 1, 1.5, 0.5, 0.5,
-0.3919151, -4.93307, -6.874579, 0, 1.5, 0.5, 0.5
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
-6.040661, -0.4522891, -6.874579, 0, -0.5, 0.5, 0.5,
-6.040661, -0.4522891, -6.874579, 1, -0.5, 0.5, 0.5,
-6.040661, -0.4522891, -6.874579, 1, 1.5, 0.5, 0.5,
-6.040661, -0.4522891, -6.874579, 0, 1.5, 0.5, 0.5
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
-6.040661, -4.93307, -0.183115, 0, -0.5, 0.5, 0.5,
-6.040661, -4.93307, -0.183115, 1, -0.5, 0.5, 0.5,
-6.040661, -4.93307, -0.183115, 1, 1.5, 0.5, 0.5,
-6.040661, -4.93307, -0.183115, 0, 1.5, 0.5, 0.5
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
-4, -3.899044, -5.330395,
2, -3.899044, -5.330395,
-4, -3.899044, -5.330395,
-4, -4.071381, -5.587759,
-2, -3.899044, -5.330395,
-2, -4.071381, -5.587759,
0, -3.899044, -5.330395,
0, -4.071381, -5.587759,
2, -3.899044, -5.330395,
2, -4.071381, -5.587759
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
"-4",
"-2",
"0",
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
-4, -4.416057, -6.102487, 0, -0.5, 0.5, 0.5,
-4, -4.416057, -6.102487, 1, -0.5, 0.5, 0.5,
-4, -4.416057, -6.102487, 1, 1.5, 0.5, 0.5,
-4, -4.416057, -6.102487, 0, 1.5, 0.5, 0.5,
-2, -4.416057, -6.102487, 0, -0.5, 0.5, 0.5,
-2, -4.416057, -6.102487, 1, -0.5, 0.5, 0.5,
-2, -4.416057, -6.102487, 1, 1.5, 0.5, 0.5,
-2, -4.416057, -6.102487, 0, 1.5, 0.5, 0.5,
0, -4.416057, -6.102487, 0, -0.5, 0.5, 0.5,
0, -4.416057, -6.102487, 1, -0.5, 0.5, 0.5,
0, -4.416057, -6.102487, 1, 1.5, 0.5, 0.5,
0, -4.416057, -6.102487, 0, 1.5, 0.5, 0.5,
2, -4.416057, -6.102487, 0, -0.5, 0.5, 0.5,
2, -4.416057, -6.102487, 1, -0.5, 0.5, 0.5,
2, -4.416057, -6.102487, 1, 1.5, 0.5, 0.5,
2, -4.416057, -6.102487, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.737104, -3, -5.330395,
-4.737104, 2, -5.330395,
-4.737104, -3, -5.330395,
-4.954364, -3, -5.587759,
-4.737104, -2, -5.330395,
-4.954364, -2, -5.587759,
-4.737104, -1, -5.330395,
-4.954364, -1, -5.587759,
-4.737104, 0, -5.330395,
-4.954364, 0, -5.587759,
-4.737104, 1, -5.330395,
-4.954364, 1, -5.587759,
-4.737104, 2, -5.330395,
-4.954364, 2, -5.587759
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
-5.388883, -3, -6.102487, 0, -0.5, 0.5, 0.5,
-5.388883, -3, -6.102487, 1, -0.5, 0.5, 0.5,
-5.388883, -3, -6.102487, 1, 1.5, 0.5, 0.5,
-5.388883, -3, -6.102487, 0, 1.5, 0.5, 0.5,
-5.388883, -2, -6.102487, 0, -0.5, 0.5, 0.5,
-5.388883, -2, -6.102487, 1, -0.5, 0.5, 0.5,
-5.388883, -2, -6.102487, 1, 1.5, 0.5, 0.5,
-5.388883, -2, -6.102487, 0, 1.5, 0.5, 0.5,
-5.388883, -1, -6.102487, 0, -0.5, 0.5, 0.5,
-5.388883, -1, -6.102487, 1, -0.5, 0.5, 0.5,
-5.388883, -1, -6.102487, 1, 1.5, 0.5, 0.5,
-5.388883, -1, -6.102487, 0, 1.5, 0.5, 0.5,
-5.388883, 0, -6.102487, 0, -0.5, 0.5, 0.5,
-5.388883, 0, -6.102487, 1, -0.5, 0.5, 0.5,
-5.388883, 0, -6.102487, 1, 1.5, 0.5, 0.5,
-5.388883, 0, -6.102487, 0, 1.5, 0.5, 0.5,
-5.388883, 1, -6.102487, 0, -0.5, 0.5, 0.5,
-5.388883, 1, -6.102487, 1, -0.5, 0.5, 0.5,
-5.388883, 1, -6.102487, 1, 1.5, 0.5, 0.5,
-5.388883, 1, -6.102487, 0, 1.5, 0.5, 0.5,
-5.388883, 2, -6.102487, 0, -0.5, 0.5, 0.5,
-5.388883, 2, -6.102487, 1, -0.5, 0.5, 0.5,
-5.388883, 2, -6.102487, 1, 1.5, 0.5, 0.5,
-5.388883, 2, -6.102487, 0, 1.5, 0.5, 0.5
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
-4.737104, -3.899044, -4,
-4.737104, -3.899044, 4,
-4.737104, -3.899044, -4,
-4.954364, -4.071381, -4,
-4.737104, -3.899044, -2,
-4.954364, -4.071381, -2,
-4.737104, -3.899044, 0,
-4.954364, -4.071381, 0,
-4.737104, -3.899044, 2,
-4.954364, -4.071381, 2,
-4.737104, -3.899044, 4,
-4.954364, -4.071381, 4
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
-5.388883, -4.416057, -4, 0, -0.5, 0.5, 0.5,
-5.388883, -4.416057, -4, 1, -0.5, 0.5, 0.5,
-5.388883, -4.416057, -4, 1, 1.5, 0.5, 0.5,
-5.388883, -4.416057, -4, 0, 1.5, 0.5, 0.5,
-5.388883, -4.416057, -2, 0, -0.5, 0.5, 0.5,
-5.388883, -4.416057, -2, 1, -0.5, 0.5, 0.5,
-5.388883, -4.416057, -2, 1, 1.5, 0.5, 0.5,
-5.388883, -4.416057, -2, 0, 1.5, 0.5, 0.5,
-5.388883, -4.416057, 0, 0, -0.5, 0.5, 0.5,
-5.388883, -4.416057, 0, 1, -0.5, 0.5, 0.5,
-5.388883, -4.416057, 0, 1, 1.5, 0.5, 0.5,
-5.388883, -4.416057, 0, 0, 1.5, 0.5, 0.5,
-5.388883, -4.416057, 2, 0, -0.5, 0.5, 0.5,
-5.388883, -4.416057, 2, 1, -0.5, 0.5, 0.5,
-5.388883, -4.416057, 2, 1, 1.5, 0.5, 0.5,
-5.388883, -4.416057, 2, 0, 1.5, 0.5, 0.5,
-5.388883, -4.416057, 4, 0, -0.5, 0.5, 0.5,
-5.388883, -4.416057, 4, 1, -0.5, 0.5, 0.5,
-5.388883, -4.416057, 4, 1, 1.5, 0.5, 0.5,
-5.388883, -4.416057, 4, 0, 1.5, 0.5, 0.5
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
-4.737104, -3.899044, -5.330395,
-4.737104, 2.994465, -5.330395,
-4.737104, -3.899044, 4.964165,
-4.737104, 2.994465, 4.964165,
-4.737104, -3.899044, -5.330395,
-4.737104, -3.899044, 4.964165,
-4.737104, 2.994465, -5.330395,
-4.737104, 2.994465, 4.964165,
-4.737104, -3.899044, -5.330395,
3.953274, -3.899044, -5.330395,
-4.737104, -3.899044, 4.964165,
3.953274, -3.899044, 4.964165,
-4.737104, 2.994465, -5.330395,
3.953274, 2.994465, -5.330395,
-4.737104, 2.994465, 4.964165,
3.953274, 2.994465, 4.964165,
3.953274, -3.899044, -5.330395,
3.953274, 2.994465, -5.330395,
3.953274, -3.899044, 4.964165,
3.953274, 2.994465, 4.964165,
3.953274, -3.899044, -5.330395,
3.953274, -3.899044, 4.964165,
3.953274, 2.994465, -5.330395,
3.953274, 2.994465, 4.964165
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
var radius = 8.080965;
var distance = 35.95313;
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
mvMatrix.translate( 0.3919151, 0.4522891, 0.183115 );
mvMatrix.scale( 1.005399, 1.267467, 0.8487296 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95313);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
benoxacor<-read.table("benoxacor.xyz")
```

```
## Error in read.table("benoxacor.xyz"): no lines available in input
```

```r
x<-benoxacor$V2
```

```
## Error in eval(expr, envir, enclos): object 'benoxacor' not found
```

```r
y<-benoxacor$V3
```

```
## Error in eval(expr, envir, enclos): object 'benoxacor' not found
```

```r
z<-benoxacor$V4
```

```
## Error in eval(expr, envir, enclos): object 'benoxacor' not found
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
-4.610546, -0.6874588, -2.25348, 0, 0, 1, 1, 1,
-3.08159, -0.7236016, -1.615132, 1, 0, 0, 1, 1,
-3.019451, -1.38538, -1.843357, 1, 0, 0, 1, 1,
-2.941808, 1.101742, -0.614627, 1, 0, 0, 1, 1,
-2.758225, -1.807853, -3.125313, 1, 0, 0, 1, 1,
-2.66805, 0.1627746, -2.46989, 1, 0, 0, 1, 1,
-2.623506, -2.127067, -3.330177, 0, 0, 0, 1, 1,
-2.592492, 1.068177, -0.6023952, 0, 0, 0, 1, 1,
-2.529119, -0.04572043, -0.659479, 0, 0, 0, 1, 1,
-2.491919, -0.2872422, -1.206573, 0, 0, 0, 1, 1,
-2.440698, -0.9544723, -2.71118, 0, 0, 0, 1, 1,
-2.435014, -0.2593507, -1.15421, 0, 0, 0, 1, 1,
-2.422572, 1.89498, 0.5922333, 0, 0, 0, 1, 1,
-2.403122, -1.550566, -1.30579, 1, 1, 1, 1, 1,
-2.334688, 0.5251771, -0.287818, 1, 1, 1, 1, 1,
-2.288591, 1.054276, -2.008939, 1, 1, 1, 1, 1,
-2.28833, -1.304291, -3.401901, 1, 1, 1, 1, 1,
-2.256385, 0.7130631, -1.07732, 1, 1, 1, 1, 1,
-2.202454, -0.4454731, -2.437505, 1, 1, 1, 1, 1,
-2.164418, -0.1743273, -2.992348, 1, 1, 1, 1, 1,
-2.112788, -1.289263, -1.63159, 1, 1, 1, 1, 1,
-2.111731, 0.7616305, -1.384863, 1, 1, 1, 1, 1,
-2.091341, 1.08727, -1.684, 1, 1, 1, 1, 1,
-2.080398, 0.9873446, -1.290637, 1, 1, 1, 1, 1,
-2.074137, -0.6717416, -3.217207, 1, 1, 1, 1, 1,
-2.063096, 0.1923588, -2.200491, 1, 1, 1, 1, 1,
-2.03541, -0.3552813, -2.637258, 1, 1, 1, 1, 1,
-2.017137, -0.5887983, -1.839893, 1, 1, 1, 1, 1,
-1.980641, -0.151691, -1.467858, 0, 0, 1, 1, 1,
-1.980508, -0.07227736, -0.9769717, 1, 0, 0, 1, 1,
-1.957943, 0.004001713, -1.604872, 1, 0, 0, 1, 1,
-1.941929, -0.886679, -1.551882, 1, 0, 0, 1, 1,
-1.928098, -0.5698289, -1.574571, 1, 0, 0, 1, 1,
-1.919602, -0.8932039, -3.161397, 1, 0, 0, 1, 1,
-1.851381, -1.724433, -1.084619, 0, 0, 0, 1, 1,
-1.84977, -0.06899331, -2.853579, 0, 0, 0, 1, 1,
-1.794617, 0.5699046, -1.437999, 0, 0, 0, 1, 1,
-1.775099, -0.1751788, -0.6443961, 0, 0, 0, 1, 1,
-1.757693, -0.7942452, -2.101063, 0, 0, 0, 1, 1,
-1.757159, 0.5508718, -1.457724, 0, 0, 0, 1, 1,
-1.718119, -1.894525, -2.514648, 0, 0, 0, 1, 1,
-1.710902, 0.8360968, 0.6784838, 1, 1, 1, 1, 1,
-1.708545, -0.4449939, -1.847871, 1, 1, 1, 1, 1,
-1.691625, -0.05539542, -0.7374086, 1, 1, 1, 1, 1,
-1.688493, -0.5943483, -0.4064967, 1, 1, 1, 1, 1,
-1.669692, -1.545806, -2.840401, 1, 1, 1, 1, 1,
-1.664433, 0.3067651, -2.090605, 1, 1, 1, 1, 1,
-1.663982, 1.441636, 0.2765672, 1, 1, 1, 1, 1,
-1.64693, -0.5582528, -1.871948, 1, 1, 1, 1, 1,
-1.605442, -2.126845, -1.348165, 1, 1, 1, 1, 1,
-1.603138, 0.1053175, -0.04449591, 1, 1, 1, 1, 1,
-1.600859, 1.763775, -0.7487088, 1, 1, 1, 1, 1,
-1.600298, 0.6991414, -0.541167, 1, 1, 1, 1, 1,
-1.596138, 1.40368, -1.293086, 1, 1, 1, 1, 1,
-1.574936, -0.6648254, -1.795462, 1, 1, 1, 1, 1,
-1.562836, -0.6385763, -1.551235, 1, 1, 1, 1, 1,
-1.556121, 0.371891, -2.493029, 0, 0, 1, 1, 1,
-1.549683, -0.6432888, -1.75276, 1, 0, 0, 1, 1,
-1.531044, 0.9684049, -3.397922, 1, 0, 0, 1, 1,
-1.524473, -0.8271132, -0.1323191, 1, 0, 0, 1, 1,
-1.520328, -0.09568949, -3.204832, 1, 0, 0, 1, 1,
-1.503604, -0.01276042, -2.670873, 1, 0, 0, 1, 1,
-1.503085, 0.7255254, -1.855848, 0, 0, 0, 1, 1,
-1.49016, 0.8518111, 0.2054131, 0, 0, 0, 1, 1,
-1.468196, 0.8152918, -0.5189633, 0, 0, 0, 1, 1,
-1.459919, -0.7825208, -0.9807947, 0, 0, 0, 1, 1,
-1.45228, -0.9189361, -2.583995, 0, 0, 0, 1, 1,
-1.444017, 0.3882889, -1.88851, 0, 0, 0, 1, 1,
-1.437905, 0.8232642, -2.054107, 0, 0, 0, 1, 1,
-1.437802, -1.612902, -2.159668, 1, 1, 1, 1, 1,
-1.437204, -1.659817, -4.141211, 1, 1, 1, 1, 1,
-1.423238, -1.36616, -3.474379, 1, 1, 1, 1, 1,
-1.422829, 1.315858, -0.1803772, 1, 1, 1, 1, 1,
-1.415965, 0.5130243, -2.189328, 1, 1, 1, 1, 1,
-1.410389, 0.9368975, -0.7020938, 1, 1, 1, 1, 1,
-1.407804, 0.4388449, -1.374679, 1, 1, 1, 1, 1,
-1.399811, -1.443534, -4.108408, 1, 1, 1, 1, 1,
-1.39869, -0.6361946, -1.986425, 1, 1, 1, 1, 1,
-1.371484, -0.4279367, -1.383077, 1, 1, 1, 1, 1,
-1.368051, -0.6661927, -3.508556, 1, 1, 1, 1, 1,
-1.36539, 0.1989711, -2.35053, 1, 1, 1, 1, 1,
-1.36528, -1.442536, -3.025722, 1, 1, 1, 1, 1,
-1.365144, 0.7795231, -0.1361021, 1, 1, 1, 1, 1,
-1.361076, 0.9613499, -1.992611, 1, 1, 1, 1, 1,
-1.357091, 0.9173532, 1.179406, 0, 0, 1, 1, 1,
-1.354575, -1.178499, -0.5082395, 1, 0, 0, 1, 1,
-1.353961, -0.3148471, -2.64906, 1, 0, 0, 1, 1,
-1.345321, -0.5235378, -1.242013, 1, 0, 0, 1, 1,
-1.335896, 0.2901628, -0.209128, 1, 0, 0, 1, 1,
-1.332792, 1.88504, -1.015089, 1, 0, 0, 1, 1,
-1.331771, 0.1832504, -2.066762, 0, 0, 0, 1, 1,
-1.32438, -0.217612, -1.331337, 0, 0, 0, 1, 1,
-1.323103, -0.3762656, -0.9438501, 0, 0, 0, 1, 1,
-1.318099, 1.295864, 0.1124042, 0, 0, 0, 1, 1,
-1.308957, -1.429502, -2.99259, 0, 0, 0, 1, 1,
-1.304038, -0.01251035, -2.197466, 0, 0, 0, 1, 1,
-1.285941, -0.2495776, -3.154911, 0, 0, 0, 1, 1,
-1.285931, -1.257889, -0.5220835, 1, 1, 1, 1, 1,
-1.277266, -0.3513788, -2.645676, 1, 1, 1, 1, 1,
-1.276699, 0.995441, -0.1910884, 1, 1, 1, 1, 1,
-1.273186, -1.202936, -1.273273, 1, 1, 1, 1, 1,
-1.264348, -1.207425, -2.6896, 1, 1, 1, 1, 1,
-1.263532, 1.595768, -1.533137, 1, 1, 1, 1, 1,
-1.258103, -0.5980354, -0.5159589, 1, 1, 1, 1, 1,
-1.257948, -0.3698458, 0.05280254, 1, 1, 1, 1, 1,
-1.252108, 1.040482, 0.2298199, 1, 1, 1, 1, 1,
-1.251927, -1.27573, -2.892948, 1, 1, 1, 1, 1,
-1.246273, -0.5601248, -1.861062, 1, 1, 1, 1, 1,
-1.245463, 0.294753, -1.092068, 1, 1, 1, 1, 1,
-1.244438, 0.8285786, 0.3410491, 1, 1, 1, 1, 1,
-1.221056, 0.7918373, -0.9301379, 1, 1, 1, 1, 1,
-1.214846, -1.257647, -2.645723, 1, 1, 1, 1, 1,
-1.209786, -1.849026, -4.964208, 0, 0, 1, 1, 1,
-1.2091, -0.09413028, -1.707822, 1, 0, 0, 1, 1,
-1.198771, 2.012792, 0.3427843, 1, 0, 0, 1, 1,
-1.198527, -0.8476852, -1.75805, 1, 0, 0, 1, 1,
-1.194128, 1.385668, -1.332271, 1, 0, 0, 1, 1,
-1.187488, -0.6291726, -3.378254, 1, 0, 0, 1, 1,
-1.181114, 1.295928, -0.4420285, 0, 0, 0, 1, 1,
-1.175047, 1.120514, -1.438461, 0, 0, 0, 1, 1,
-1.170334, 0.7568462, -1.506791, 0, 0, 0, 1, 1,
-1.168853, -2.078836, -1.32093, 0, 0, 0, 1, 1,
-1.161709, 1.592528, -1.102374, 0, 0, 0, 1, 1,
-1.160508, 0.3882003, -0.9950949, 0, 0, 0, 1, 1,
-1.159545, -1.360809, -1.767814, 0, 0, 0, 1, 1,
-1.158255, 0.1208361, -1.454419, 1, 1, 1, 1, 1,
-1.154171, 1.391119, -0.9244961, 1, 1, 1, 1, 1,
-1.150038, -0.5755717, -2.585314, 1, 1, 1, 1, 1,
-1.139908, 0.7275867, -1.734277, 1, 1, 1, 1, 1,
-1.131358, -0.6406233, -2.238816, 1, 1, 1, 1, 1,
-1.128029, 0.2562197, -0.1749912, 1, 1, 1, 1, 1,
-1.122874, -0.9272344, -3.280536, 1, 1, 1, 1, 1,
-1.1064, 0.5204927, -1.450895, 1, 1, 1, 1, 1,
-1.096873, 0.8152075, -1.686383, 1, 1, 1, 1, 1,
-1.095778, -0.9425431, -3.64389, 1, 1, 1, 1, 1,
-1.09004, 0.7082897, 0.4256147, 1, 1, 1, 1, 1,
-1.087756, -1.119597, -1.334726, 1, 1, 1, 1, 1,
-1.085859, -0.7036984, -0.4694076, 1, 1, 1, 1, 1,
-1.085068, 0.08999293, -0.4058031, 1, 1, 1, 1, 1,
-1.080085, 1.303063, -1.675005, 1, 1, 1, 1, 1,
-1.073839, 0.7170596, -0.1125042, 0, 0, 1, 1, 1,
-1.069005, -0.612887, -2.201265, 1, 0, 0, 1, 1,
-1.068608, 1.757407, -2.367563, 1, 0, 0, 1, 1,
-1.067571, -0.8480769, -2.90415, 1, 0, 0, 1, 1,
-1.066021, -1.180788, -2.233322, 1, 0, 0, 1, 1,
-1.060795, -2.351268, -3.347035, 1, 0, 0, 1, 1,
-1.053882, -1.586947, -2.584961, 0, 0, 0, 1, 1,
-1.052708, -0.5297124, -1.456944, 0, 0, 0, 1, 1,
-1.044789, 0.676822, -0.5504934, 0, 0, 0, 1, 1,
-1.042107, 1.707872, -0.9628103, 0, 0, 0, 1, 1,
-1.040961, -0.3924062, -1.606027, 0, 0, 0, 1, 1,
-1.037043, -1.288647, -4.387986, 0, 0, 0, 1, 1,
-1.031286, 0.09807065, -2.121481, 0, 0, 0, 1, 1,
-1.026891, -1.424536, -2.427142, 1, 1, 1, 1, 1,
-1.02278, 0.1967223, -2.02645, 1, 1, 1, 1, 1,
-1.02197, 1.08001, -1.511531, 1, 1, 1, 1, 1,
-1.008243, -0.9201294, -3.906409, 1, 1, 1, 1, 1,
-1.007835, 2.615564, 0.306988, 1, 1, 1, 1, 1,
-1.007354, -0.9874706, -1.078787, 1, 1, 1, 1, 1,
-1.00577, 0.2793256, -1.269576, 1, 1, 1, 1, 1,
-0.9977073, 1.505451, -1.336816, 1, 1, 1, 1, 1,
-0.9956825, 1.014219, -0.4146791, 1, 1, 1, 1, 1,
-0.9948113, -0.7909934, -1.835716, 1, 1, 1, 1, 1,
-0.9888554, -1.01696, -3.275783, 1, 1, 1, 1, 1,
-0.9774734, -0.6253347, -2.628244, 1, 1, 1, 1, 1,
-0.9765783, -0.4713609, -1.690482, 1, 1, 1, 1, 1,
-0.9743261, 0.6446912, 0.2440161, 1, 1, 1, 1, 1,
-0.973922, 0.05900374, -0.7457892, 1, 1, 1, 1, 1,
-0.9690564, 2.024307, 0.5604527, 0, 0, 1, 1, 1,
-0.964501, -0.1988867, -1.248261, 1, 0, 0, 1, 1,
-0.959132, 0.9210027, -0.6307177, 1, 0, 0, 1, 1,
-0.9528184, -0.4032797, -1.761061, 1, 0, 0, 1, 1,
-0.9443397, -0.8027003, -1.225513, 1, 0, 0, 1, 1,
-0.9430972, -0.7602597, -1.220035, 1, 0, 0, 1, 1,
-0.9423496, -0.3046193, -2.807216, 0, 0, 0, 1, 1,
-0.9384513, -0.1717699, -1.151831, 0, 0, 0, 1, 1,
-0.934168, -0.4596306, -1.338005, 0, 0, 0, 1, 1,
-0.9267107, -1.017852, -1.366436, 0, 0, 0, 1, 1,
-0.9135737, 0.8675414, -1.922699, 0, 0, 0, 1, 1,
-0.9127398, 0.4317071, -1.726516, 0, 0, 0, 1, 1,
-0.9016977, -1.550259, -1.487939, 0, 0, 0, 1, 1,
-0.901636, 0.3136428, 0.1221631, 1, 1, 1, 1, 1,
-0.8891118, 0.3533793, -1.66222, 1, 1, 1, 1, 1,
-0.8781412, -0.314826, -3.02566, 1, 1, 1, 1, 1,
-0.8769177, 0.2621176, -2.177921, 1, 1, 1, 1, 1,
-0.8763384, 0.2038335, -0.3929284, 1, 1, 1, 1, 1,
-0.86939, 0.841278, -1.510392, 1, 1, 1, 1, 1,
-0.8624049, -1.158126, -2.683279, 1, 1, 1, 1, 1,
-0.860908, -0.622368, -1.03479, 1, 1, 1, 1, 1,
-0.8604313, -0.8658971, -2.50462, 1, 1, 1, 1, 1,
-0.8554521, 0.1569021, -1.088943, 1, 1, 1, 1, 1,
-0.8549969, -1.379459, -2.821365, 1, 1, 1, 1, 1,
-0.8518251, 1.009462, -0.7400658, 1, 1, 1, 1, 1,
-0.8427649, -0.2640828, -0.5241348, 1, 1, 1, 1, 1,
-0.8387563, 0.8861892, -0.2089124, 1, 1, 1, 1, 1,
-0.8309815, -0.2653752, -3.445403, 1, 1, 1, 1, 1,
-0.8305309, -0.06729827, 0.1924466, 0, 0, 1, 1, 1,
-0.8292906, 0.4411652, -0.9882423, 1, 0, 0, 1, 1,
-0.8260018, 0.1473512, -1.754993, 1, 0, 0, 1, 1,
-0.8204527, -1.146233, -2.353917, 1, 0, 0, 1, 1,
-0.8163999, 0.1023607, -1.612441, 1, 0, 0, 1, 1,
-0.8142166, 0.8516717, -1.177373, 1, 0, 0, 1, 1,
-0.810068, 1.04031, -0.2029106, 0, 0, 0, 1, 1,
-0.8067645, 1.309538, -1.568159, 0, 0, 0, 1, 1,
-0.8004873, -0.5007052, -1.334194, 0, 0, 0, 1, 1,
-0.7990119, 0.1437481, -2.664436, 0, 0, 0, 1, 1,
-0.7979063, 0.3210428, -2.557386, 0, 0, 0, 1, 1,
-0.7974956, 0.6595227, -0.3562113, 0, 0, 0, 1, 1,
-0.7937064, 1.208522, -0.377943, 0, 0, 0, 1, 1,
-0.793689, 0.2455965, -0.1972239, 1, 1, 1, 1, 1,
-0.793102, 1.124294, -1.129967, 1, 1, 1, 1, 1,
-0.7911863, 0.3516562, 0.02226335, 1, 1, 1, 1, 1,
-0.7839524, 0.2913578, -1.121018, 1, 1, 1, 1, 1,
-0.7795653, -0.4247769, -1.010356, 1, 1, 1, 1, 1,
-0.7765764, 1.18071, -1.900376, 1, 1, 1, 1, 1,
-0.7623154, -0.7890396, -3.245213, 1, 1, 1, 1, 1,
-0.762291, -0.4739682, -3.499729, 1, 1, 1, 1, 1,
-0.7608482, 1.222564, -1.332299, 1, 1, 1, 1, 1,
-0.7593397, 0.550772, -1.842964, 1, 1, 1, 1, 1,
-0.7583508, 0.8011212, -0.494384, 1, 1, 1, 1, 1,
-0.7552357, -0.4407144, -2.005328, 1, 1, 1, 1, 1,
-0.7534486, -0.4411044, -2.328387, 1, 1, 1, 1, 1,
-0.753057, 1.11131, 0.3705169, 1, 1, 1, 1, 1,
-0.7519371, -0.4676531, -3.254523, 1, 1, 1, 1, 1,
-0.7514206, 0.528618, -3.134861, 0, 0, 1, 1, 1,
-0.7507927, 1.084148, -0.6232558, 1, 0, 0, 1, 1,
-0.7490543, -1.516481, -3.290073, 1, 0, 0, 1, 1,
-0.7437297, 0.6650661, 0.1823834, 1, 0, 0, 1, 1,
-0.7363329, 0.2954878, -1.995572, 1, 0, 0, 1, 1,
-0.7247473, -0.6217011, -4.213273, 1, 0, 0, 1, 1,
-0.7213218, 0.2045896, 0.3117929, 0, 0, 0, 1, 1,
-0.7203794, -1.258554, -2.661358, 0, 0, 0, 1, 1,
-0.7154387, 0.6302299, 0.2333165, 0, 0, 0, 1, 1,
-0.7110687, -0.4122248, -3.657507, 0, 0, 0, 1, 1,
-0.7035338, 0.4635301, -2.007427, 0, 0, 0, 1, 1,
-0.7018119, 0.395611, -0.7921692, 0, 0, 0, 1, 1,
-0.6958728, 0.1388152, -1.144693, 0, 0, 0, 1, 1,
-0.6941707, 0.01253445, -1.839213, 1, 1, 1, 1, 1,
-0.6775032, -1.486307, -1.452261, 1, 1, 1, 1, 1,
-0.6756127, 1.026571, -1.371103, 1, 1, 1, 1, 1,
-0.672484, 1.532902, -1.551358, 1, 1, 1, 1, 1,
-0.6707454, -0.005505945, -1.859702, 1, 1, 1, 1, 1,
-0.6651207, 1.076439, -0.1590356, 1, 1, 1, 1, 1,
-0.664008, -1.260616, -2.831497, 1, 1, 1, 1, 1,
-0.6601089, 0.775199, 0.2220026, 1, 1, 1, 1, 1,
-0.6597996, 0.5993782, -0.5608873, 1, 1, 1, 1, 1,
-0.6581084, -0.3053046, -1.54574, 1, 1, 1, 1, 1,
-0.6574628, 0.2141182, -2.196157, 1, 1, 1, 1, 1,
-0.6523579, -0.8679311, -3.137378, 1, 1, 1, 1, 1,
-0.6475557, 0.4064818, -1.721388, 1, 1, 1, 1, 1,
-0.6473117, 0.3660992, 0.1777811, 1, 1, 1, 1, 1,
-0.6418885, -0.3061109, -1.21269, 1, 1, 1, 1, 1,
-0.6296924, -0.5418766, -2.143158, 0, 0, 1, 1, 1,
-0.6276513, -0.4398324, -2.108219, 1, 0, 0, 1, 1,
-0.6248969, 0.6186056, -0.5437053, 1, 0, 0, 1, 1,
-0.6235445, -0.3822262, -1.497866, 1, 0, 0, 1, 1,
-0.6230148, 0.007545885, -0.7303789, 1, 0, 0, 1, 1,
-0.6219461, -0.3303168, -3.123766, 1, 0, 0, 1, 1,
-0.6207984, -1.612573, -4.76959, 0, 0, 0, 1, 1,
-0.6195707, 2.08998, -0.1347575, 0, 0, 0, 1, 1,
-0.6159122, -1.010036, -1.429579, 0, 0, 0, 1, 1,
-0.6119668, 0.7195538, -2.140985, 0, 0, 0, 1, 1,
-0.6103064, 1.044054, 0.3283255, 0, 0, 0, 1, 1,
-0.6092654, 0.9863462, 0.7359442, 0, 0, 0, 1, 1,
-0.6007617, -0.1833841, -3.714429, 0, 0, 0, 1, 1,
-0.5990656, 1.09096, 0.4696229, 1, 1, 1, 1, 1,
-0.5939199, 0.2405167, -0.469476, 1, 1, 1, 1, 1,
-0.588464, -0.3327056, -1.736595, 1, 1, 1, 1, 1,
-0.587017, -0.03498608, -3.193006, 1, 1, 1, 1, 1,
-0.5863538, -0.1763634, -1.378533, 1, 1, 1, 1, 1,
-0.585202, 0.8028227, -1.399375, 1, 1, 1, 1, 1,
-0.5808997, 1.625208, 1.81522, 1, 1, 1, 1, 1,
-0.5785105, -0.7503039, -1.304342, 1, 1, 1, 1, 1,
-0.5778975, 1.71215, -1.596504, 1, 1, 1, 1, 1,
-0.5751536, 0.3364423, -1.751039, 1, 1, 1, 1, 1,
-0.5724979, 0.8635908, 0.06905503, 1, 1, 1, 1, 1,
-0.5706658, -1.495048, -1.664375, 1, 1, 1, 1, 1,
-0.5697217, 0.4747436, -1.037255, 1, 1, 1, 1, 1,
-0.5679492, -0.1434683, -2.344209, 1, 1, 1, 1, 1,
-0.561412, -0.6236998, -2.262362, 1, 1, 1, 1, 1,
-0.5612872, -0.3783225, -2.328691, 0, 0, 1, 1, 1,
-0.5595719, -1.047475, -2.807527, 1, 0, 0, 1, 1,
-0.5587298, -1.149744, -2.319087, 1, 0, 0, 1, 1,
-0.550424, -0.6386061, -2.563717, 1, 0, 0, 1, 1,
-0.5496999, 0.1585136, 0.07735916, 1, 0, 0, 1, 1,
-0.547148, -0.372944, -4.601932, 1, 0, 0, 1, 1,
-0.5455199, 0.5140522, -0.934729, 0, 0, 0, 1, 1,
-0.5437233, 1.335739, 2.056109, 0, 0, 0, 1, 1,
-0.5402874, 1.095194, -1.419762, 0, 0, 0, 1, 1,
-0.5389706, 0.2454352, 0.1682453, 0, 0, 0, 1, 1,
-0.5384474, -1.256348, -1.688831, 0, 0, 0, 1, 1,
-0.5375229, 0.8593553, -2.300967, 0, 0, 0, 1, 1,
-0.5304744, -0.0568623, -1.989404, 0, 0, 0, 1, 1,
-0.5302682, -0.8099887, -2.028351, 1, 1, 1, 1, 1,
-0.529146, -0.7556456, -3.225483, 1, 1, 1, 1, 1,
-0.5281992, 0.761899, 0.5429162, 1, 1, 1, 1, 1,
-0.5268329, 0.607124, -1.347338, 1, 1, 1, 1, 1,
-0.5260648, 0.6269967, -0.5534831, 1, 1, 1, 1, 1,
-0.5244451, 0.01073266, -1.424664, 1, 1, 1, 1, 1,
-0.5238778, -0.433678, -2.080822, 1, 1, 1, 1, 1,
-0.5234886, 1.882006, 0.2935935, 1, 1, 1, 1, 1,
-0.5198709, 0.5896462, -1.774332, 1, 1, 1, 1, 1,
-0.5186873, -1.91224, -2.400839, 1, 1, 1, 1, 1,
-0.5158323, -0.6448867, -3.880765, 1, 1, 1, 1, 1,
-0.5148458, -0.8867453, -3.874506, 1, 1, 1, 1, 1,
-0.5120487, 0.2992046, -1.92463, 1, 1, 1, 1, 1,
-0.5113022, 0.4654569, 0.3906058, 1, 1, 1, 1, 1,
-0.5102198, 0.1335044, -0.1848004, 1, 1, 1, 1, 1,
-0.5095991, -0.7533553, -2.794669, 0, 0, 1, 1, 1,
-0.5081514, 0.3219319, -1.799717, 1, 0, 0, 1, 1,
-0.5007935, 0.2237306, -2.578865, 1, 0, 0, 1, 1,
-0.5005237, -0.7347023, -3.484829, 1, 0, 0, 1, 1,
-0.5004081, -0.7469988, 0.211993, 1, 0, 0, 1, 1,
-0.4971286, 0.2361184, -0.3018041, 1, 0, 0, 1, 1,
-0.4963113, -0.9412571, -3.297291, 0, 0, 0, 1, 1,
-0.4953677, 0.2853153, -2.786783, 0, 0, 0, 1, 1,
-0.4908034, -0.877492, -3.322526, 0, 0, 0, 1, 1,
-0.4901296, -0.4359758, -2.810387, 0, 0, 0, 1, 1,
-0.4900739, -2.034693, -1.182067, 0, 0, 0, 1, 1,
-0.4893054, 0.4092318, -2.967784, 0, 0, 0, 1, 1,
-0.4888711, -0.6718878, -1.555796, 0, 0, 0, 1, 1,
-0.4858977, 1.791207, -2.030046, 1, 1, 1, 1, 1,
-0.4850588, 0.0422811, -1.210867, 1, 1, 1, 1, 1,
-0.4832975, -0.8983889, -3.252477, 1, 1, 1, 1, 1,
-0.4816452, 1.027089, 0.1763137, 1, 1, 1, 1, 1,
-0.4768458, -1.316001, -1.109704, 1, 1, 1, 1, 1,
-0.4759518, 2.390391, -1.454771, 1, 1, 1, 1, 1,
-0.4753191, 0.01521972, -2.113656, 1, 1, 1, 1, 1,
-0.4700124, -1.452843, -3.095301, 1, 1, 1, 1, 1,
-0.4687034, 1.083869, 0.6102957, 1, 1, 1, 1, 1,
-0.4654385, -0.4231539, -2.315182, 1, 1, 1, 1, 1,
-0.4654239, -0.6439066, -1.123461, 1, 1, 1, 1, 1,
-0.4639474, 0.4181543, -2.013347, 1, 1, 1, 1, 1,
-0.4583841, 0.6840541, 1.251692, 1, 1, 1, 1, 1,
-0.4536965, -0.7288017, -2.841821, 1, 1, 1, 1, 1,
-0.4444288, -0.9533244, -2.768203, 1, 1, 1, 1, 1,
-0.4436789, 0.2668387, -0.9325258, 0, 0, 1, 1, 1,
-0.4395712, 0.4092078, 1.437499, 1, 0, 0, 1, 1,
-0.4373776, -0.3930306, -2.099782, 1, 0, 0, 1, 1,
-0.4346927, -1.34344, -2.756815, 1, 0, 0, 1, 1,
-0.4280414, 0.8536342, -0.1150827, 1, 0, 0, 1, 1,
-0.4278818, -0.007323305, -3.123029, 1, 0, 0, 1, 1,
-0.4264608, 1.127612, -0.005254226, 0, 0, 0, 1, 1,
-0.4253063, -1.967506, -2.949568, 0, 0, 0, 1, 1,
-0.4223229, 0.7598999, -0.511012, 0, 0, 0, 1, 1,
-0.4159344, -0.6216925, -1.766322, 0, 0, 0, 1, 1,
-0.4156752, 0.5189418, 0.3361138, 0, 0, 0, 1, 1,
-0.4137555, 0.1037465, -0.9745734, 0, 0, 0, 1, 1,
-0.4122446, -0.008809194, -1.982928, 0, 0, 0, 1, 1,
-0.4087757, -1.369813, -2.095366, 1, 1, 1, 1, 1,
-0.4022881, 0.6079182, 0.2839713, 1, 1, 1, 1, 1,
-0.4005007, 0.6968244, 0.6705188, 1, 1, 1, 1, 1,
-0.4001617, 0.5160708, -1.193921, 1, 1, 1, 1, 1,
-0.3978717, -0.3293528, -1.789211, 1, 1, 1, 1, 1,
-0.3909977, 1.34751, 1.320817, 1, 1, 1, 1, 1,
-0.3903652, -0.5395105, -1.80741, 1, 1, 1, 1, 1,
-0.3884667, 1.47209, -1.335379, 1, 1, 1, 1, 1,
-0.3852295, -1.429517, -2.873961, 1, 1, 1, 1, 1,
-0.3851864, 1.596966, -1.556986, 1, 1, 1, 1, 1,
-0.3824392, 0.3181029, -1.142357, 1, 1, 1, 1, 1,
-0.3730638, -1.423869, -2.415304, 1, 1, 1, 1, 1,
-0.3712533, 0.6069345, 0.2592962, 1, 1, 1, 1, 1,
-0.3673486, 0.498153, -0.2923092, 1, 1, 1, 1, 1,
-0.3544045, 1.68663, 1.832145, 1, 1, 1, 1, 1,
-0.3477997, -0.4210376, -2.409985, 0, 0, 1, 1, 1,
-0.3461694, 0.5205621, 0.1866062, 1, 0, 0, 1, 1,
-0.345769, -0.482135, -3.486122, 1, 0, 0, 1, 1,
-0.3437312, -0.4113689, -3.560699, 1, 0, 0, 1, 1,
-0.3421738, 0.1272309, -1.07927, 1, 0, 0, 1, 1,
-0.3416997, 0.7683214, 0.03185037, 1, 0, 0, 1, 1,
-0.3316864, -0.6216339, -2.274524, 0, 0, 0, 1, 1,
-0.3315638, 0.8857874, -1.628104, 0, 0, 0, 1, 1,
-0.3300551, -0.8440019, -4.742648, 0, 0, 0, 1, 1,
-0.3290608, 1.180925, 2.044407, 0, 0, 0, 1, 1,
-0.3267494, 0.3599819, -0.3929667, 0, 0, 0, 1, 1,
-0.3252628, -0.4804923, -2.019383, 0, 0, 0, 1, 1,
-0.3215406, -0.4949166, -1.730068, 0, 0, 0, 1, 1,
-0.3210511, 0.3489634, -1.339331, 1, 1, 1, 1, 1,
-0.3206282, -0.4810679, -3.034975, 1, 1, 1, 1, 1,
-0.3199876, 2.054954, -0.3233586, 1, 1, 1, 1, 1,
-0.3182628, 0.03176503, -2.198525, 1, 1, 1, 1, 1,
-0.3158558, 1.464935, 0.6244455, 1, 1, 1, 1, 1,
-0.3132439, 0.8555492, -1.341555, 1, 1, 1, 1, 1,
-0.2966246, -1.823993, -1.031218, 1, 1, 1, 1, 1,
-0.2946319, 1.455328, -1.461474, 1, 1, 1, 1, 1,
-0.2899021, 0.615813, 0.06090667, 1, 1, 1, 1, 1,
-0.2870528, -0.5423746, -3.417364, 1, 1, 1, 1, 1,
-0.2863076, 1.19536, 0.6199424, 1, 1, 1, 1, 1,
-0.2862258, 0.1712472, -1.731623, 1, 1, 1, 1, 1,
-0.2843693, 0.1174245, -2.123919, 1, 1, 1, 1, 1,
-0.2838268, -0.8812895, -2.266248, 1, 1, 1, 1, 1,
-0.2837066, 2.185791, -1.82412, 1, 1, 1, 1, 1,
-0.2827472, -1.142798, -4.498181, 0, 0, 1, 1, 1,
-0.2817149, -0.6239954, -2.047006, 1, 0, 0, 1, 1,
-0.2797134, -0.4296032, -2.73489, 1, 0, 0, 1, 1,
-0.2768807, -2.016399, -3.131631, 1, 0, 0, 1, 1,
-0.2733287, 0.1478062, -0.6297523, 1, 0, 0, 1, 1,
-0.2701877, -0.3084872, -2.78611, 1, 0, 0, 1, 1,
-0.2686692, 2.323592, -0.756556, 0, 0, 0, 1, 1,
-0.2622029, 0.04308813, -1.941543, 0, 0, 0, 1, 1,
-0.2545602, 0.118269, -2.308181, 0, 0, 0, 1, 1,
-0.2500592, -1.970711, -3.873, 0, 0, 0, 1, 1,
-0.249494, 0.2074312, -1.682102, 0, 0, 0, 1, 1,
-0.2477061, -0.743022, -3.39676, 0, 0, 0, 1, 1,
-0.2437728, -1.856685, -2.136936, 0, 0, 0, 1, 1,
-0.2387131, 0.9753377, 2.05311, 1, 1, 1, 1, 1,
-0.236966, 0.8124599, 0.5833926, 1, 1, 1, 1, 1,
-0.2359902, 0.791732, -0.169533, 1, 1, 1, 1, 1,
-0.2352288, 2.266365, -0.6374254, 1, 1, 1, 1, 1,
-0.2322792, 1.109259, -1.188208, 1, 1, 1, 1, 1,
-0.2304025, -0.1957817, -1.100796, 1, 1, 1, 1, 1,
-0.2298875, -0.3090838, -5.180474, 1, 1, 1, 1, 1,
-0.228366, 0.6972977, -1.548796, 1, 1, 1, 1, 1,
-0.2256624, 0.1254146, -2.029149, 1, 1, 1, 1, 1,
-0.2243141, -0.6309063, -2.599051, 1, 1, 1, 1, 1,
-0.220071, -0.8105537, -2.628746, 1, 1, 1, 1, 1,
-0.2176976, 1.025989, -1.385053, 1, 1, 1, 1, 1,
-0.2173693, -1.093667, -4.255652, 1, 1, 1, 1, 1,
-0.2132092, -0.09020614, -4.619143, 1, 1, 1, 1, 1,
-0.2038165, -0.4583447, -3.442658, 1, 1, 1, 1, 1,
-0.2029285, -0.7853107, -2.677539, 0, 0, 1, 1, 1,
-0.1996244, 0.03500872, -1.470098, 1, 0, 0, 1, 1,
-0.198449, -0.4357258, -3.43364, 1, 0, 0, 1, 1,
-0.1975095, -0.5071334, -2.008322, 1, 0, 0, 1, 1,
-0.1969084, 0.7975609, -0.04294744, 1, 0, 0, 1, 1,
-0.1949991, -0.1770553, -0.651873, 1, 0, 0, 1, 1,
-0.1944446, 2.226409, 0.3265361, 0, 0, 0, 1, 1,
-0.1940555, -0.3390695, -4.450088, 0, 0, 0, 1, 1,
-0.1938193, 1.928818, 0.1997132, 0, 0, 0, 1, 1,
-0.1837368, 2.065642, 0.4061786, 0, 0, 0, 1, 1,
-0.1797104, 0.5635, -0.2527641, 0, 0, 0, 1, 1,
-0.1760373, -0.3161756, -2.136829, 0, 0, 0, 1, 1,
-0.173104, 0.285924, -1.383561, 0, 0, 0, 1, 1,
-0.1670805, 1.139941, -0.3798619, 1, 1, 1, 1, 1,
-0.1664421, 1.301257, -1.575788, 1, 1, 1, 1, 1,
-0.165222, 1.696212, -0.6369821, 1, 1, 1, 1, 1,
-0.1630558, 0.009786696, -1.535347, 1, 1, 1, 1, 1,
-0.155719, 0.180998, -0.9037255, 1, 1, 1, 1, 1,
-0.1552763, -1.214351, -4.071936, 1, 1, 1, 1, 1,
-0.148729, -1.01691, -3.812879, 1, 1, 1, 1, 1,
-0.1470082, 1.194279, 1.986039, 1, 1, 1, 1, 1,
-0.1398196, 1.15402, -0.9388267, 1, 1, 1, 1, 1,
-0.1397182, 0.05026095, -1.992994, 1, 1, 1, 1, 1,
-0.1368238, 0.4978144, -1.203267, 1, 1, 1, 1, 1,
-0.1356244, 0.9341927, -0.2774571, 1, 1, 1, 1, 1,
-0.1339885, 0.0910179, 0.825521, 1, 1, 1, 1, 1,
-0.1280409, -0.3634816, -2.388465, 1, 1, 1, 1, 1,
-0.1238697, 0.8459646, 1.441417, 1, 1, 1, 1, 1,
-0.1223374, 0.6071572, -1.250875, 0, 0, 1, 1, 1,
-0.1194815, -0.6077797, -2.64548, 1, 0, 0, 1, 1,
-0.1170663, -0.3601138, -2.417558, 1, 0, 0, 1, 1,
-0.1161281, -0.0001759868, -1.757105, 1, 0, 0, 1, 1,
-0.1121903, 0.07769088, -2.161337, 1, 0, 0, 1, 1,
-0.1113938, -0.5271017, -3.354797, 1, 0, 0, 1, 1,
-0.1105149, -0.7380903, -2.763004, 0, 0, 0, 1, 1,
-0.1104182, -1.329622, -2.721812, 0, 0, 0, 1, 1,
-0.1093814, 1.035176, 0.06794429, 0, 0, 0, 1, 1,
-0.106598, 0.0376558, -2.275483, 0, 0, 0, 1, 1,
-0.105711, 0.5260168, -0.4624234, 0, 0, 0, 1, 1,
-0.1039392, 1.69805, -0.5763869, 0, 0, 0, 1, 1,
-0.1033885, -0.62608, -2.529702, 0, 0, 0, 1, 1,
-0.1005136, -0.8812461, -1.370609, 1, 1, 1, 1, 1,
-0.09803077, 0.6131039, 0.2193274, 1, 1, 1, 1, 1,
-0.09690506, 0.4707698, -1.28301, 1, 1, 1, 1, 1,
-0.09371081, -0.4165181, -3.092625, 1, 1, 1, 1, 1,
-0.0870221, 0.3080865, 0.157882, 1, 1, 1, 1, 1,
-0.0859602, 0.6934786, 0.3948083, 1, 1, 1, 1, 1,
-0.08497254, 1.398211, 0.2424919, 1, 1, 1, 1, 1,
-0.08415101, -1.254495, -1.466899, 1, 1, 1, 1, 1,
-0.0832498, -1.298445, -3.547627, 1, 1, 1, 1, 1,
-0.07833705, -0.1504674, -3.625129, 1, 1, 1, 1, 1,
-0.07475854, -1.781321, -2.750112, 1, 1, 1, 1, 1,
-0.07196318, -0.454955, -4.805915, 1, 1, 1, 1, 1,
-0.06362991, 0.2872347, -1.458894, 1, 1, 1, 1, 1,
-0.06259587, 0.8528278, 0.7020879, 1, 1, 1, 1, 1,
-0.05959124, 0.008572335, -1.742914, 1, 1, 1, 1, 1,
-0.05929651, 0.6939985, -0.5759615, 0, 0, 1, 1, 1,
-0.05739455, 0.2932998, -1.765157, 1, 0, 0, 1, 1,
-0.055215, -1.663009, -4.001692, 1, 0, 0, 1, 1,
-0.05236363, 1.290495, -0.1024165, 1, 0, 0, 1, 1,
-0.05226051, 0.5269617, -0.3252732, 1, 0, 0, 1, 1,
-0.04459354, -0.4308207, -2.973698, 1, 0, 0, 1, 1,
-0.04122872, 0.675799, 0.002642445, 0, 0, 0, 1, 1,
-0.04083334, -0.8277677, -4.193614, 0, 0, 0, 1, 1,
-0.03647941, -0.08186511, -4.197406, 0, 0, 0, 1, 1,
-0.03439873, -1.090111, -5.0984, 0, 0, 0, 1, 1,
-0.03352073, 0.1802492, -0.9656144, 0, 0, 0, 1, 1,
-0.0323461, 2.031529, 0.1717867, 0, 0, 0, 1, 1,
-0.0293979, 1.022433, 2.333482, 0, 0, 0, 1, 1,
-0.02391917, 1.645927, -0.08264109, 1, 1, 1, 1, 1,
-0.01520455, 0.9304777, -1.405599, 1, 1, 1, 1, 1,
-0.01326306, 1.267536, -0.6682878, 1, 1, 1, 1, 1,
-0.01202071, 0.3408876, 0.9697155, 1, 1, 1, 1, 1,
-0.007480952, -0.608474, -2.469205, 1, 1, 1, 1, 1,
-0.001601576, 1.59155, 0.5505591, 1, 1, 1, 1, 1,
-0.001131476, 0.8818008, 0.7891461, 1, 1, 1, 1, 1,
0.0002790246, -0.1019496, 2.377202, 1, 1, 1, 1, 1,
0.001798377, 0.06059512, 0.6658738, 1, 1, 1, 1, 1,
0.004402443, 0.08464104, -0.8314848, 1, 1, 1, 1, 1,
0.005846331, 0.721166, 1.916369, 1, 1, 1, 1, 1,
0.006366254, -1.302633, 4.500881, 1, 1, 1, 1, 1,
0.01288555, 0.3787269, -0.259831, 1, 1, 1, 1, 1,
0.01291422, 1.101908, 0.2868555, 1, 1, 1, 1, 1,
0.02112143, -0.4067883, 3.534924, 1, 1, 1, 1, 1,
0.02443182, -0.552744, 3.891279, 0, 0, 1, 1, 1,
0.02897568, -1.381177, 2.489231, 1, 0, 0, 1, 1,
0.03066901, -0.4998541, 2.657764, 1, 0, 0, 1, 1,
0.03098786, -0.2106993, 2.721458, 1, 0, 0, 1, 1,
0.03215177, -0.4555336, 3.012916, 1, 0, 0, 1, 1,
0.03865884, 0.02362797, 0.506332, 1, 0, 0, 1, 1,
0.04280394, -0.598622, 3.004935, 0, 0, 0, 1, 1,
0.04403185, -0.9667505, 2.795235, 0, 0, 0, 1, 1,
0.04733736, -0.4374089, 1.517444, 0, 0, 0, 1, 1,
0.04808462, 0.2243721, -2.041382, 0, 0, 0, 1, 1,
0.04850514, 1.975344, 0.4003543, 0, 0, 0, 1, 1,
0.04913574, 0.5415867, 1.85115, 0, 0, 0, 1, 1,
0.04924062, 0.7734546, 0.9432388, 0, 0, 0, 1, 1,
0.05019078, 0.6237473, 0.1113033, 1, 1, 1, 1, 1,
0.05424378, 0.9045159, -0.5229172, 1, 1, 1, 1, 1,
0.05866696, 1.919617, 0.3728534, 1, 1, 1, 1, 1,
0.05985375, -0.2403413, 2.485906, 1, 1, 1, 1, 1,
0.06109225, -0.3976114, 3.453355, 1, 1, 1, 1, 1,
0.0619379, -0.8346803, 1.650241, 1, 1, 1, 1, 1,
0.06283177, -0.1563082, 3.393457, 1, 1, 1, 1, 1,
0.06994522, -0.8089251, 3.467034, 1, 1, 1, 1, 1,
0.07289512, 0.1527123, -1.216292, 1, 1, 1, 1, 1,
0.07452703, 1.291026, 0.1489391, 1, 1, 1, 1, 1,
0.0841802, -1.449249, 3.204136, 1, 1, 1, 1, 1,
0.08673646, 1.790946, 0.838515, 1, 1, 1, 1, 1,
0.09421699, -0.2413862, 1.582922, 1, 1, 1, 1, 1,
0.09649227, 0.2395379, 0.1208868, 1, 1, 1, 1, 1,
0.09703726, 0.4490962, 0.1924088, 1, 1, 1, 1, 1,
0.09876762, 0.2805655, 0.2011957, 0, 0, 1, 1, 1,
0.1086866, 0.9015045, -0.09959566, 1, 0, 0, 1, 1,
0.1100513, -0.07413855, 2.759195, 1, 0, 0, 1, 1,
0.1113547, 0.9726398, 0.5570874, 1, 0, 0, 1, 1,
0.1131462, -1.33538, 3.443301, 1, 0, 0, 1, 1,
0.1320927, 0.398179, 0.4235234, 1, 0, 0, 1, 1,
0.1354178, -1.010057, 3.471981, 0, 0, 0, 1, 1,
0.1380412, -0.04647684, 1.800197, 0, 0, 0, 1, 1,
0.1384712, 1.00147, -1.927047, 0, 0, 0, 1, 1,
0.1407253, 0.07531101, 1.645312, 0, 0, 0, 1, 1,
0.1413969, 0.4741806, 1.043966, 0, 0, 0, 1, 1,
0.1431797, -1.280053, 4.339291, 0, 0, 0, 1, 1,
0.1462739, 1.857112, -0.4795787, 0, 0, 0, 1, 1,
0.1468529, -0.01179812, 1.133327, 1, 1, 1, 1, 1,
0.147407, 0.364627, 1.024573, 1, 1, 1, 1, 1,
0.1482248, -1.718498, 2.435353, 1, 1, 1, 1, 1,
0.1506043, 0.4727696, 0.9768608, 1, 1, 1, 1, 1,
0.1530083, 0.1923002, 0.06804676, 1, 1, 1, 1, 1,
0.1535743, -0.6954926, 4.107613, 1, 1, 1, 1, 1,
0.1552486, 0.1539021, 1.589157, 1, 1, 1, 1, 1,
0.1595659, 0.954595, 0.8070261, 1, 1, 1, 1, 1,
0.16274, 0.3037581, 0.2658823, 1, 1, 1, 1, 1,
0.1669364, 0.3479977, 0.685169, 1, 1, 1, 1, 1,
0.1670282, 1.905572, -1.725276, 1, 1, 1, 1, 1,
0.1761453, -1.577292, 2.589461, 1, 1, 1, 1, 1,
0.1822578, -0.2962841, 0.8512201, 1, 1, 1, 1, 1,
0.1823814, 0.9310631, 0.07558236, 1, 1, 1, 1, 1,
0.1860681, 0.9102265, 0.9731334, 1, 1, 1, 1, 1,
0.1885669, 0.5445015, -1.080665, 0, 0, 1, 1, 1,
0.1905595, -0.1813714, 3.069599, 1, 0, 0, 1, 1,
0.1907813, 0.1994378, -0.6383073, 1, 0, 0, 1, 1,
0.1924731, -1.14752, 2.185654, 1, 0, 0, 1, 1,
0.1957156, -2.173083, 2.833508, 1, 0, 0, 1, 1,
0.1986956, -1.152678, 2.959438, 1, 0, 0, 1, 1,
0.1990235, -0.9931319, 3.332081, 0, 0, 0, 1, 1,
0.2005187, 1.231737, -1.398585, 0, 0, 0, 1, 1,
0.2046206, 1.013859, -1.325722, 0, 0, 0, 1, 1,
0.2047556, 0.2889707, 1.338913, 0, 0, 0, 1, 1,
0.2050176, 1.146842, 0.9342946, 0, 0, 0, 1, 1,
0.2068521, -0.570738, 3.601607, 0, 0, 0, 1, 1,
0.2102213, -2.188865, 1.239842, 0, 0, 0, 1, 1,
0.2105025, -2.053528, 3.888756, 1, 1, 1, 1, 1,
0.2123045, -0.04121765, 0.8680502, 1, 1, 1, 1, 1,
0.2195517, -0.4967833, 3.437318, 1, 1, 1, 1, 1,
0.2215696, 0.05258957, 0.07891612, 1, 1, 1, 1, 1,
0.224408, -0.6456714, 1.709674, 1, 1, 1, 1, 1,
0.225809, -1.674789, 3.531705, 1, 1, 1, 1, 1,
0.2305489, -0.298223, 2.788882, 1, 1, 1, 1, 1,
0.2311829, -0.6517881, 2.973886, 1, 1, 1, 1, 1,
0.2362667, 1.640991, 0.741704, 1, 1, 1, 1, 1,
0.2383468, 1.000306, -1.333553, 1, 1, 1, 1, 1,
0.2410484, -1.583228, 1.956892, 1, 1, 1, 1, 1,
0.2413038, -0.7043338, 1.974569, 1, 1, 1, 1, 1,
0.2606343, -0.6544644, 2.065474, 1, 1, 1, 1, 1,
0.2609265, 2.06113, -0.5412367, 1, 1, 1, 1, 1,
0.261265, 0.464069, -0.2612323, 1, 1, 1, 1, 1,
0.2642891, 0.2925067, 1.181601, 0, 0, 1, 1, 1,
0.2679624, 1.69027, 0.1919037, 1, 0, 0, 1, 1,
0.2680005, 0.4839803, 0.1001773, 1, 0, 0, 1, 1,
0.2691747, 1.964528, 0.1556859, 1, 0, 0, 1, 1,
0.2701426, 1.307003, 0.2160722, 1, 0, 0, 1, 1,
0.2728433, -0.6144997, 3.779742, 1, 0, 0, 1, 1,
0.2750864, 0.3253092, 0.3160923, 0, 0, 0, 1, 1,
0.2752281, 0.2172837, -0.7335728, 0, 0, 0, 1, 1,
0.2756855, 0.260259, -0.6355159, 0, 0, 0, 1, 1,
0.2786056, 0.573401, 0.4579994, 0, 0, 0, 1, 1,
0.2796878, 0.9474411, -0.2874911, 0, 0, 0, 1, 1,
0.2802269, 0.6776897, -0.5585889, 0, 0, 0, 1, 1,
0.2836893, 1.3797, -0.5442317, 0, 0, 0, 1, 1,
0.2852576, 0.7025807, 0.8535362, 1, 1, 1, 1, 1,
0.286037, 1.021957, 1.044178, 1, 1, 1, 1, 1,
0.2877176, -0.1806504, 2.469039, 1, 1, 1, 1, 1,
0.2896835, -0.05662197, -0.06094578, 1, 1, 1, 1, 1,
0.2931603, 0.9044625, -0.423223, 1, 1, 1, 1, 1,
0.3007595, -1.301515, 4.230031, 1, 1, 1, 1, 1,
0.3017403, -1.566993, 3.141737, 1, 1, 1, 1, 1,
0.3042136, -0.6055369, 3.131153, 1, 1, 1, 1, 1,
0.3051482, -1.463703, 3.127882, 1, 1, 1, 1, 1,
0.3098901, -0.4458314, 3.928335, 1, 1, 1, 1, 1,
0.3121166, 1.310373, 0.1160565, 1, 1, 1, 1, 1,
0.3139504, 0.1364006, 1.017986, 1, 1, 1, 1, 1,
0.3247087, 1.15194, 0.5090794, 1, 1, 1, 1, 1,
0.3248155, 1.251423, 2.743583, 1, 1, 1, 1, 1,
0.3317959, -1.122499, 2.690437, 1, 1, 1, 1, 1,
0.3319423, -0.5595667, 0.8776316, 0, 0, 1, 1, 1,
0.3337211, -0.7701071, 4.029324, 1, 0, 0, 1, 1,
0.3365336, -0.7057311, 2.533928, 1, 0, 0, 1, 1,
0.3375093, -0.1975582, 2.57048, 1, 0, 0, 1, 1,
0.33839, -0.5709162, 2.8807, 1, 0, 0, 1, 1,
0.3404846, 0.3648219, 1.452175, 1, 0, 0, 1, 1,
0.3407417, 1.861693, -0.7801337, 0, 0, 0, 1, 1,
0.3411541, -2.249099, 3.565289, 0, 0, 0, 1, 1,
0.3444232, 0.4840628, 1.001685, 0, 0, 0, 1, 1,
0.3444491, 0.7388137, 0.7203325, 0, 0, 0, 1, 1,
0.3452804, -1.785695, 3.893368, 0, 0, 0, 1, 1,
0.3463757, 1.010415, 0.04820769, 0, 0, 0, 1, 1,
0.3478642, 0.3929693, 0.6492347, 0, 0, 0, 1, 1,
0.3583329, -0.2183923, 2.167461, 1, 1, 1, 1, 1,
0.36065, 0.5387424, 1.995961, 1, 1, 1, 1, 1,
0.3617835, 0.7403507, 0.3693543, 1, 1, 1, 1, 1,
0.3637049, 0.5295955, 0.6446009, 1, 1, 1, 1, 1,
0.3642216, -0.4070918, 3.320636, 1, 1, 1, 1, 1,
0.375184, 0.787281, 1.403006, 1, 1, 1, 1, 1,
0.375615, 0.7326959, 1.948594, 1, 1, 1, 1, 1,
0.3758229, -2.255272, 3.094239, 1, 1, 1, 1, 1,
0.3797204, 0.1406149, 0.9919894, 1, 1, 1, 1, 1,
0.379724, -1.126716, 2.721407, 1, 1, 1, 1, 1,
0.3832153, 0.1006466, 2.910109, 1, 1, 1, 1, 1,
0.3842623, 0.3503653, 2.703554, 1, 1, 1, 1, 1,
0.3862642, 0.8889288, 0.2825713, 1, 1, 1, 1, 1,
0.3897811, -0.5871254, 2.987186, 1, 1, 1, 1, 1,
0.391066, 1.040608, 1.709663, 1, 1, 1, 1, 1,
0.3912615, -1.078259, 2.440203, 0, 0, 1, 1, 1,
0.3981246, -0.09263152, 0.806811, 1, 0, 0, 1, 1,
0.3996255, -0.383742, 3.281664, 1, 0, 0, 1, 1,
0.4005755, -1.553324, 2.862102, 1, 0, 0, 1, 1,
0.4010742, 1.435926, 0.4424399, 1, 0, 0, 1, 1,
0.4023468, -0.5865796, 3.295743, 1, 0, 0, 1, 1,
0.4033793, 1.315898, 1.869588, 0, 0, 0, 1, 1,
0.4069439, -0.8208429, 2.709032, 0, 0, 0, 1, 1,
0.4150665, -0.2277115, 1.374566, 0, 0, 0, 1, 1,
0.4165056, -0.39665, 0.730948, 0, 0, 0, 1, 1,
0.4193723, 1.400558, 2.242256, 0, 0, 0, 1, 1,
0.4230775, -1.483117, 4.585559, 0, 0, 0, 1, 1,
0.4236041, 0.73006, 0.03722923, 0, 0, 0, 1, 1,
0.4269736, 0.1774746, -0.1724337, 1, 1, 1, 1, 1,
0.4345855, 1.402941, -2.195013, 1, 1, 1, 1, 1,
0.436233, -0.2419041, 1.981456, 1, 1, 1, 1, 1,
0.4420318, -0.1306047, -0.1411935, 1, 1, 1, 1, 1,
0.4439697, 0.06107612, 1.402171, 1, 1, 1, 1, 1,
0.4517817, -0.6555234, 2.572832, 1, 1, 1, 1, 1,
0.4560498, 0.9543508, -1.024392, 1, 1, 1, 1, 1,
0.4636487, 0.3880303, 0.5912323, 1, 1, 1, 1, 1,
0.4674039, -1.272319, 3.611977, 1, 1, 1, 1, 1,
0.4687136, -0.6919323, 2.38234, 1, 1, 1, 1, 1,
0.4687406, -0.01233232, 1.275881, 1, 1, 1, 1, 1,
0.4741666, 0.6262852, 0.3843656, 1, 1, 1, 1, 1,
0.4756765, -0.2585744, 2.645443, 1, 1, 1, 1, 1,
0.4771114, -0.5324247, 3.264682, 1, 1, 1, 1, 1,
0.4820146, 0.1652053, 0.6601706, 1, 1, 1, 1, 1,
0.4879472, -0.3742366, 3.372072, 0, 0, 1, 1, 1,
0.4926161, 0.03382042, 0.5241575, 1, 0, 0, 1, 1,
0.4926191, -0.5388067, 1.442527, 1, 0, 0, 1, 1,
0.4946463, 0.8189035, -0.3641964, 1, 0, 0, 1, 1,
0.4979523, -0.4928498, 2.255382, 1, 0, 0, 1, 1,
0.4998743, 0.7306768, -0.5400466, 1, 0, 0, 1, 1,
0.5008287, 0.390406, -0.4670447, 0, 0, 0, 1, 1,
0.5014215, -0.1341866, 0.4203996, 0, 0, 0, 1, 1,
0.5016248, -1.007087, 1.388476, 0, 0, 0, 1, 1,
0.5071076, 2.311992, 0.1692467, 0, 0, 0, 1, 1,
0.5081226, -1.269923, 2.895152, 0, 0, 0, 1, 1,
0.5116418, -0.1914194, 2.611971, 0, 0, 0, 1, 1,
0.5122288, -0.7568232, 3.317812, 0, 0, 0, 1, 1,
0.5182092, -0.7128046, 1.990315, 1, 1, 1, 1, 1,
0.5182233, -2.177819, 4.323206, 1, 1, 1, 1, 1,
0.5196721, -0.2454532, 3.709281, 1, 1, 1, 1, 1,
0.52561, -0.02536604, 1.943351, 1, 1, 1, 1, 1,
0.525887, 0.07360965, 2.717435, 1, 1, 1, 1, 1,
0.5263969, 0.958169, 1.779967, 1, 1, 1, 1, 1,
0.528754, 1.139797, 0.7253059, 1, 1, 1, 1, 1,
0.5288, 1.780855, -0.5289192, 1, 1, 1, 1, 1,
0.532834, 0.3516454, 0.9813153, 1, 1, 1, 1, 1,
0.533229, 0.4344154, 1.372467, 1, 1, 1, 1, 1,
0.5344657, -0.7724757, 2.098381, 1, 1, 1, 1, 1,
0.5450774, -1.173585, 2.559776, 1, 1, 1, 1, 1,
0.5452031, -0.5485027, 3.030691, 1, 1, 1, 1, 1,
0.5453964, 1.116385, 2.457396, 1, 1, 1, 1, 1,
0.5530536, -0.2462384, 1.774056, 1, 1, 1, 1, 1,
0.5571384, 0.2253334, 3.276912, 0, 0, 1, 1, 1,
0.5605984, 1.942739, 0.7912655, 1, 0, 0, 1, 1,
0.5607771, -0.01102634, 1.04867, 1, 0, 0, 1, 1,
0.5669764, -1.664503, 4.188909, 1, 0, 0, 1, 1,
0.5702443, -1.146601, 4.081086, 1, 0, 0, 1, 1,
0.5703405, 0.3567032, -0.2425973, 1, 0, 0, 1, 1,
0.5704239, 1.281694, -1.926177, 0, 0, 0, 1, 1,
0.5730501, 0.9626311, -1.15235, 0, 0, 0, 1, 1,
0.5773008, -0.3548191, 2.20125, 0, 0, 0, 1, 1,
0.5840351, 0.8355983, 0.2561037, 0, 0, 0, 1, 1,
0.5859071, -0.5471618, 1.171069, 0, 0, 0, 1, 1,
0.5859672, -1.380364, 3.085694, 0, 0, 0, 1, 1,
0.5877503, -0.211565, 1.678525, 0, 0, 0, 1, 1,
0.5907891, -0.01388074, 2.847173, 1, 1, 1, 1, 1,
0.5918648, -0.568422, 2.427999, 1, 1, 1, 1, 1,
0.5921416, -1.086392, 1.077129, 1, 1, 1, 1, 1,
0.5927215, 0.9844615, 0.04494134, 1, 1, 1, 1, 1,
0.5930544, -1.233627, 2.868083, 1, 1, 1, 1, 1,
0.5940841, 0.5218197, 1.011927, 1, 1, 1, 1, 1,
0.5963353, -1.94744, 1.68568, 1, 1, 1, 1, 1,
0.5979376, -1.226209, 3.891819, 1, 1, 1, 1, 1,
0.5983683, -0.5468851, 2.052927, 1, 1, 1, 1, 1,
0.59839, -0.06604572, 2.240799, 1, 1, 1, 1, 1,
0.6036007, 1.485724, 0.06563569, 1, 1, 1, 1, 1,
0.6036537, 1.175075, 0.939948, 1, 1, 1, 1, 1,
0.6072095, 1.806446, -0.9847003, 1, 1, 1, 1, 1,
0.6072341, -0.09620291, 0.09893955, 1, 1, 1, 1, 1,
0.6080728, -0.05085799, 1.475391, 1, 1, 1, 1, 1,
0.6084967, -1.68266, 2.997182, 0, 0, 1, 1, 1,
0.6093643, -0.6851561, 2.811844, 1, 0, 0, 1, 1,
0.6116492, 2.381915, -0.2774765, 1, 0, 0, 1, 1,
0.6139214, -0.1994465, 0.4754631, 1, 0, 0, 1, 1,
0.6172445, 1.00655, 0.6951258, 1, 0, 0, 1, 1,
0.6195285, -0.2497723, 2.517085, 1, 0, 0, 1, 1,
0.6222615, 1.493579, 2.005049, 0, 0, 0, 1, 1,
0.6298882, -0.3790608, 2.634197, 0, 0, 0, 1, 1,
0.6336865, -0.6383423, 3.59804, 0, 0, 0, 1, 1,
0.6338268, -0.4436295, 2.381634, 0, 0, 0, 1, 1,
0.6353027, -0.8639612, 3.608994, 0, 0, 0, 1, 1,
0.6394436, -0.2227078, 0.687264, 0, 0, 0, 1, 1,
0.6404839, -1.191564, 2.033466, 0, 0, 0, 1, 1,
0.6411131, 1.891852, -1.154203, 1, 1, 1, 1, 1,
0.6503795, 0.4320382, 1.455612, 1, 1, 1, 1, 1,
0.6549674, 0.4539485, 0.1227347, 1, 1, 1, 1, 1,
0.6554332, 2.894074, 0.81688, 1, 1, 1, 1, 1,
0.6555958, 0.4774227, 1.161017, 1, 1, 1, 1, 1,
0.6562775, 0.3875125, 1.440989, 1, 1, 1, 1, 1,
0.6594102, 0.5907687, 1.255497, 1, 1, 1, 1, 1,
0.6667411, 0.3835435, -1.163156, 1, 1, 1, 1, 1,
0.6678124, -0.555374, 2.467601, 1, 1, 1, 1, 1,
0.6680488, 1.145931, -0.1330246, 1, 1, 1, 1, 1,
0.6705722, 1.441855, 0.7355741, 1, 1, 1, 1, 1,
0.6715788, -1.582275, 3.745121, 1, 1, 1, 1, 1,
0.6762231, 0.1400902, 0.8098923, 1, 1, 1, 1, 1,
0.6867595, 1.271096, -0.7612575, 1, 1, 1, 1, 1,
0.6871072, 0.3683364, 1.469778, 1, 1, 1, 1, 1,
0.6901501, -0.4590317, 0.4846593, 0, 0, 1, 1, 1,
0.6941215, -1.348394, 2.707021, 1, 0, 0, 1, 1,
0.6981153, 0.6515403, 0.4594108, 1, 0, 0, 1, 1,
0.701583, 0.8930467, 0.8249912, 1, 0, 0, 1, 1,
0.7025142, -0.3839699, 0.1903726, 1, 0, 0, 1, 1,
0.7032473, 1.998064, -0.8878513, 1, 0, 0, 1, 1,
0.7051738, 0.5271959, -0.4806128, 0, 0, 0, 1, 1,
0.7078882, 1.006694, -0.6563379, 0, 0, 0, 1, 1,
0.7101687, -1.306142, 3.64181, 0, 0, 0, 1, 1,
0.7118788, 0.6823981, 1.156443, 0, 0, 0, 1, 1,
0.7160229, -1.598791, 2.49452, 0, 0, 0, 1, 1,
0.7167271, -1.808438, 2.82912, 0, 0, 0, 1, 1,
0.7182255, -0.8280023, 3.863322, 0, 0, 0, 1, 1,
0.7213728, -1.223866, 2.801888, 1, 1, 1, 1, 1,
0.729085, -0.2690593, 3.029691, 1, 1, 1, 1, 1,
0.7304253, 0.2383577, 1.855119, 1, 1, 1, 1, 1,
0.7331164, -0.7699637, 1.839365, 1, 1, 1, 1, 1,
0.737914, -1.596649, 1.871154, 1, 1, 1, 1, 1,
0.7545722, -0.7375475, 2.448068, 1, 1, 1, 1, 1,
0.7594037, 1.288378, -0.2221845, 1, 1, 1, 1, 1,
0.7595099, 0.5185107, 0.2264515, 1, 1, 1, 1, 1,
0.7722647, -0.7800205, 1.90905, 1, 1, 1, 1, 1,
0.7732825, 0.6552104, 0.8473463, 1, 1, 1, 1, 1,
0.7764323, 0.771296, 0.7316157, 1, 1, 1, 1, 1,
0.7803364, 1.028418, -0.2266857, 1, 1, 1, 1, 1,
0.7837858, 0.8932806, -0.1723177, 1, 1, 1, 1, 1,
0.7850571, 0.4569241, 1.413103, 1, 1, 1, 1, 1,
0.7965374, 0.1287724, 0.2317735, 1, 1, 1, 1, 1,
0.8095747, -0.3656653, 2.425274, 0, 0, 1, 1, 1,
0.8101084, -0.2597524, 2.892876, 1, 0, 0, 1, 1,
0.8122603, 0.1812847, 1.657579, 1, 0, 0, 1, 1,
0.8130261, 1.495992, 1.303697, 1, 0, 0, 1, 1,
0.8195749, 0.2202285, 0.09736764, 1, 0, 0, 1, 1,
0.8223943, 0.3776401, 1.169833, 1, 0, 0, 1, 1,
0.8302079, 0.2407012, 2.133134, 0, 0, 0, 1, 1,
0.8340966, -0.003576166, -0.3731568, 0, 0, 0, 1, 1,
0.8364062, -0.6002969, 2.066882, 0, 0, 0, 1, 1,
0.8378564, -1.188687, 4.619934, 0, 0, 0, 1, 1,
0.8481199, -0.6598337, 2.318695, 0, 0, 0, 1, 1,
0.8506138, -1.032864, 3.914686, 0, 0, 0, 1, 1,
0.8509029, -1.720829, 2.196048, 0, 0, 0, 1, 1,
0.8550826, 0.1121684, 1.149691, 1, 1, 1, 1, 1,
0.8601012, 0.6940048, -0.6817932, 1, 1, 1, 1, 1,
0.8607814, 0.881291, 1.613973, 1, 1, 1, 1, 1,
0.8650044, -2.867178, 2.380684, 1, 1, 1, 1, 1,
0.8667184, -0.6013622, 3.187067, 1, 1, 1, 1, 1,
0.8711334, -0.1024055, 1.023194, 1, 1, 1, 1, 1,
0.8735619, 1.045512, 1.912343, 1, 1, 1, 1, 1,
0.8767454, 0.5714593, 0.7521841, 1, 1, 1, 1, 1,
0.8789711, 0.8547484, 0.6856439, 1, 1, 1, 1, 1,
0.8790052, -0.8110627, 3.804531, 1, 1, 1, 1, 1,
0.8804371, 0.3942291, 1.24248, 1, 1, 1, 1, 1,
0.8884261, 0.04598672, -0.1702874, 1, 1, 1, 1, 1,
0.8892995, 0.6500573, 1.244401, 1, 1, 1, 1, 1,
0.8913837, -0.8678049, 3.140079, 1, 1, 1, 1, 1,
0.8934693, 1.212286, -0.3500742, 1, 1, 1, 1, 1,
0.8998986, -0.3756395, 2.849648, 0, 0, 1, 1, 1,
0.9004643, 1.662162, 1.660001, 1, 0, 0, 1, 1,
0.9010966, 1.563557, 0.4016216, 1, 0, 0, 1, 1,
0.9080293, 0.787251, 0.116888, 1, 0, 0, 1, 1,
0.9135474, -2.292295, 3.134088, 1, 0, 0, 1, 1,
0.9139621, 1.750563, 1.047327, 1, 0, 0, 1, 1,
0.9192548, -0.1347942, 1.221124, 0, 0, 0, 1, 1,
0.9248272, -0.366593, -1.171707, 0, 0, 0, 1, 1,
0.9260743, -0.3566585, 1.874987, 0, 0, 0, 1, 1,
0.9301302, 1.192699, 0.3511061, 0, 0, 0, 1, 1,
0.9310964, 0.5300705, 0.7244337, 0, 0, 0, 1, 1,
0.9314899, -0.2191643, 3.951538, 0, 0, 0, 1, 1,
0.93161, -0.3476298, 2.330103, 0, 0, 0, 1, 1,
0.9374822, 0.7328262, 1.174384, 1, 1, 1, 1, 1,
0.9395834, -0.4742913, 2.031492, 1, 1, 1, 1, 1,
0.9404475, 1.191178, 2.326507, 1, 1, 1, 1, 1,
0.9424948, 1.124168, 1.456727, 1, 1, 1, 1, 1,
0.9603183, 0.3836101, 2.576512, 1, 1, 1, 1, 1,
0.964488, 0.1752371, 1.2763, 1, 1, 1, 1, 1,
0.9813033, -2.268195, 3.918596, 1, 1, 1, 1, 1,
0.9829749, 0.3181711, 2.529227, 1, 1, 1, 1, 1,
0.9882895, -0.2380726, 3.083304, 1, 1, 1, 1, 1,
0.9985486, -2.374914, 2.907503, 1, 1, 1, 1, 1,
1.000522, 0.5927106, 3.599286, 1, 1, 1, 1, 1,
1.001358, -0.8278478, 2.525757, 1, 1, 1, 1, 1,
1.003785, 0.04985411, 0.878848, 1, 1, 1, 1, 1,
1.005934, 0.2944494, 2.378044, 1, 1, 1, 1, 1,
1.009442, -0.6501799, 3.68397, 1, 1, 1, 1, 1,
1.012759, -1.284817, 0.9228039, 0, 0, 1, 1, 1,
1.016911, -0.6069179, 2.858792, 1, 0, 0, 1, 1,
1.018011, 0.2716811, 2.368033, 1, 0, 0, 1, 1,
1.023245, 0.1588494, 3.497255, 1, 0, 0, 1, 1,
1.023795, 0.2313899, 0.4873099, 1, 0, 0, 1, 1,
1.025494, 0.7087363, 0.9786595, 1, 0, 0, 1, 1,
1.027621, -0.7667588, 2.116681, 0, 0, 0, 1, 1,
1.032266, -0.05695928, 0.03821987, 0, 0, 0, 1, 1,
1.036802, -1.233979, 0.9357365, 0, 0, 0, 1, 1,
1.040903, -1.007327, 1.742025, 0, 0, 0, 1, 1,
1.047335, -0.5441625, 2.188868, 0, 0, 0, 1, 1,
1.054664, 1.310526, 0.07531467, 0, 0, 0, 1, 1,
1.060892, -1.13475, 3.425241, 0, 0, 0, 1, 1,
1.063012, 2.105728, -1.613709, 1, 1, 1, 1, 1,
1.064334, 0.4251955, -1.08877, 1, 1, 1, 1, 1,
1.066607, 1.079395, -0.6811707, 1, 1, 1, 1, 1,
1.067441, 1.502775, 1.156711, 1, 1, 1, 1, 1,
1.069063, -0.4717954, 0.06557538, 1, 1, 1, 1, 1,
1.073231, 0.3709162, 3.454988, 1, 1, 1, 1, 1,
1.076938, 0.3996088, 1.27047, 1, 1, 1, 1, 1,
1.077006, -0.5873321, 2.785053, 1, 1, 1, 1, 1,
1.082446, -0.6093569, 1.47413, 1, 1, 1, 1, 1,
1.088817, -0.9189476, 0.1306021, 1, 1, 1, 1, 1,
1.099944, -0.1824204, 3.218445, 1, 1, 1, 1, 1,
1.100883, 0.5967976, -1.126402, 1, 1, 1, 1, 1,
1.102873, 0.2518566, 0.8428347, 1, 1, 1, 1, 1,
1.105411, 0.8881882, 2.415132, 1, 1, 1, 1, 1,
1.107627, 0.001188903, 2.91258, 1, 1, 1, 1, 1,
1.115308, -0.4030406, 0.7794073, 0, 0, 1, 1, 1,
1.117165, 0.1644427, 1.92738, 1, 0, 0, 1, 1,
1.117825, -1.053083, 1.89721, 1, 0, 0, 1, 1,
1.12004, 0.6463956, 1.619084, 1, 0, 0, 1, 1,
1.125119, 1.176238, 0.03098674, 1, 0, 0, 1, 1,
1.128107, -0.5334026, 2.206796, 1, 0, 0, 1, 1,
1.132346, 0.5017228, 0.9836211, 0, 0, 0, 1, 1,
1.136149, 0.6432579, -0.2150057, 0, 0, 0, 1, 1,
1.136706, -1.091041, 2.667824, 0, 0, 0, 1, 1,
1.137201, 1.197917, 0.1634248, 0, 0, 0, 1, 1,
1.140549, -0.0473921, 0.2648799, 0, 0, 0, 1, 1,
1.143095, 0.04551127, 3.581578, 0, 0, 0, 1, 1,
1.159103, -0.1618572, 2.73101, 0, 0, 0, 1, 1,
1.165913, 0.6199788, 1.081725, 1, 1, 1, 1, 1,
1.166624, -1.00532, 2.379055, 1, 1, 1, 1, 1,
1.171238, 0.2203422, 0.6156042, 1, 1, 1, 1, 1,
1.175717, -0.1710857, -0.9766145, 1, 1, 1, 1, 1,
1.189693, -3.798653, 2.046167, 1, 1, 1, 1, 1,
1.189848, -1.730616, 2.784973, 1, 1, 1, 1, 1,
1.194358, -0.5236416, 2.350065, 1, 1, 1, 1, 1,
1.210287, 0.9598753, 0.2365181, 1, 1, 1, 1, 1,
1.211924, 2.163584, 0.8337269, 1, 1, 1, 1, 1,
1.213993, 1.732702, 0.9457586, 1, 1, 1, 1, 1,
1.22089, -0.5488394, 0.3004597, 1, 1, 1, 1, 1,
1.221494, 0.9565703, -1.014147, 1, 1, 1, 1, 1,
1.229579, -0.8689148, 3.402749, 1, 1, 1, 1, 1,
1.230454, 0.6015301, 1.379032, 1, 1, 1, 1, 1,
1.253474, -0.005012109, 1.19163, 1, 1, 1, 1, 1,
1.255172, -0.6564733, 1.180836, 0, 0, 1, 1, 1,
1.256277, -0.2578457, 0.5113958, 1, 0, 0, 1, 1,
1.258414, 1.290187, 1.47775, 1, 0, 0, 1, 1,
1.258809, -0.796458, 2.00411, 1, 0, 0, 1, 1,
1.262086, 0.6841649, 1.940491, 1, 0, 0, 1, 1,
1.262137, 0.4802606, 1.627554, 1, 0, 0, 1, 1,
1.264953, -0.2727021, 4.814244, 0, 0, 0, 1, 1,
1.274575, 2.209547, 0.2586348, 0, 0, 0, 1, 1,
1.277108, -0.2246635, 0.1844401, 0, 0, 0, 1, 1,
1.288935, -0.6355244, 1.672485, 0, 0, 0, 1, 1,
1.290886, 1.205917, 0.487474, 0, 0, 0, 1, 1,
1.293749, -3.174414, 2.791317, 0, 0, 0, 1, 1,
1.296681, 0.1762182, 0.6291995, 0, 0, 0, 1, 1,
1.297472, 0.09053349, 1.216233, 1, 1, 1, 1, 1,
1.312661, 0.4075795, 0.6987068, 1, 1, 1, 1, 1,
1.313513, -0.511631, 2.371968, 1, 1, 1, 1, 1,
1.314505, -0.2778226, 0.07503687, 1, 1, 1, 1, 1,
1.318016, -0.4886146, 2.722846, 1, 1, 1, 1, 1,
1.331454, 1.040189, 1.611814, 1, 1, 1, 1, 1,
1.341315, 0.1973393, 0.1856521, 1, 1, 1, 1, 1,
1.352744, 1.871722, 1.285995, 1, 1, 1, 1, 1,
1.35713, 0.8989509, 1.608413, 1, 1, 1, 1, 1,
1.359836, -0.0591246, 0.9833859, 1, 1, 1, 1, 1,
1.366886, 1.497189, 0.4021273, 1, 1, 1, 1, 1,
1.378034, -1.291916, 2.242383, 1, 1, 1, 1, 1,
1.380774, -1.151783, 1.956288, 1, 1, 1, 1, 1,
1.381358, 0.4509344, 1.776583, 1, 1, 1, 1, 1,
1.384685, -0.4394045, 1.358928, 1, 1, 1, 1, 1,
1.387839, 0.5991554, 1.859989, 0, 0, 1, 1, 1,
1.407598, -0.6400453, 2.930501, 1, 0, 0, 1, 1,
1.414552, 0.9737296, 2.014028, 1, 0, 0, 1, 1,
1.429219, 1.138181, 2.411149, 1, 0, 0, 1, 1,
1.444105, 2.543037, -0.228941, 1, 0, 0, 1, 1,
1.449031, 0.002427738, 2.586984, 1, 0, 0, 1, 1,
1.454278, 1.453671, 1.67977, 0, 0, 0, 1, 1,
1.459038, 0.7157299, 1.94751, 0, 0, 0, 1, 1,
1.460645, 1.321283, 0.7528324, 0, 0, 0, 1, 1,
1.466389, 0.35794, -0.2121799, 0, 0, 0, 1, 1,
1.484398, 0.5938887, -1.180996, 0, 0, 0, 1, 1,
1.485023, -0.5069842, 1.764669, 0, 0, 0, 1, 1,
1.497999, 2.128821, 1.286046, 0, 0, 0, 1, 1,
1.507167, -0.1197278, 1.336919, 1, 1, 1, 1, 1,
1.509578, 0.8282639, 1.513213, 1, 1, 1, 1, 1,
1.510904, 1.653639, 1.674566, 1, 1, 1, 1, 1,
1.534221, 0.4194044, 0.7861968, 1, 1, 1, 1, 1,
1.534619, 1.796799, 0.4980258, 1, 1, 1, 1, 1,
1.546028, -0.2137293, 1.862023, 1, 1, 1, 1, 1,
1.548139, -0.7278292, -1.441916, 1, 1, 1, 1, 1,
1.583556, -0.4428906, 2.770586, 1, 1, 1, 1, 1,
1.595738, -1.294757, 2.175393, 1, 1, 1, 1, 1,
1.614862, -0.7245376, 1.093321, 1, 1, 1, 1, 1,
1.635892, 0.08016878, 1.591945, 1, 1, 1, 1, 1,
1.646742, -1.938077, 0.9733635, 1, 1, 1, 1, 1,
1.651228, -1.501901, 3.242058, 1, 1, 1, 1, 1,
1.653537, 0.18414, 1.699527, 1, 1, 1, 1, 1,
1.675424, -0.02262144, 0.8518823, 1, 1, 1, 1, 1,
1.684098, -1.313422, 2.49238, 0, 0, 1, 1, 1,
1.693726, -1.491842, 1.096524, 1, 0, 0, 1, 1,
1.707677, -0.7323956, 2.018573, 1, 0, 0, 1, 1,
1.716598, 0.2612168, -0.9277418, 1, 0, 0, 1, 1,
1.722683, 0.6353248, 2.93867, 1, 0, 0, 1, 1,
1.747869, 0.4248138, 2.48015, 1, 0, 0, 1, 1,
1.751665, -2.023096, 2.831065, 0, 0, 0, 1, 1,
1.803232, -1.283978, 2.618524, 0, 0, 0, 1, 1,
1.803728, 2.282737, 2.350772, 0, 0, 0, 1, 1,
1.807083, 1.431519, 0.8217503, 0, 0, 0, 1, 1,
1.810852, -0.03551939, 0.6941894, 0, 0, 0, 1, 1,
1.829891, 0.1891622, 2.071898, 0, 0, 0, 1, 1,
1.829891, 0.2479157, 0.8953391, 0, 0, 0, 1, 1,
1.872786, 0.1706573, 2.142234, 1, 1, 1, 1, 1,
1.878443, -0.9058895, 2.673064, 1, 1, 1, 1, 1,
1.892671, 1.297563, 1.015542, 1, 1, 1, 1, 1,
1.899189, -1.347796, 1.844058, 1, 1, 1, 1, 1,
1.909103, 0.7719096, -0.2777002, 1, 1, 1, 1, 1,
1.918915, 0.338067, 1.45636, 1, 1, 1, 1, 1,
1.920751, 0.5635906, 0.3373783, 1, 1, 1, 1, 1,
1.92326, -2.023181, 2.259033, 1, 1, 1, 1, 1,
1.971187, 1.369013, 0.08579287, 1, 1, 1, 1, 1,
1.972966, 0.9163868, -0.0009265236, 1, 1, 1, 1, 1,
1.986439, 0.01492715, 3.137143, 1, 1, 1, 1, 1,
2.018383, -0.259499, 1.660218, 1, 1, 1, 1, 1,
2.021998, -0.5180677, 2.232835, 1, 1, 1, 1, 1,
2.067569, -0.06094329, 1.272017, 1, 1, 1, 1, 1,
2.073434, 0.931596, -0.8451738, 1, 1, 1, 1, 1,
2.073775, 0.5866963, 1.438629, 0, 0, 1, 1, 1,
2.080577, -1.069363, 2.789864, 1, 0, 0, 1, 1,
2.091107, -1.011726, 2.686164, 1, 0, 0, 1, 1,
2.097479, -1.852791, 3.572475, 1, 0, 0, 1, 1,
2.119537, 0.7634324, 0.7070838, 1, 0, 0, 1, 1,
2.124562, -0.7936237, 1.218299, 1, 0, 0, 1, 1,
2.141163, 1.598921, 0.3350416, 0, 0, 0, 1, 1,
2.142762, -0.205174, -0.5953299, 0, 0, 0, 1, 1,
2.16151, -1.538447, 1.214376, 0, 0, 0, 1, 1,
2.165127, 1.023317, 0.2655602, 0, 0, 0, 1, 1,
2.183611, 0.3108934, 2.242041, 0, 0, 0, 1, 1,
2.216779, 0.6237845, 0.9018348, 0, 0, 0, 1, 1,
2.276556, -0.4960925, 1.120895, 0, 0, 0, 1, 1,
2.32181, 0.5833664, 0.9399765, 1, 1, 1, 1, 1,
2.356063, -0.2329164, 0.8240838, 1, 1, 1, 1, 1,
2.367931, 0.6232317, 0.5373629, 1, 1, 1, 1, 1,
2.368602, 0.201468, 0.883746, 1, 1, 1, 1, 1,
2.440004, 1.028299, 0.7977564, 1, 1, 1, 1, 1,
2.496706, 1.532934, 2.079868, 1, 1, 1, 1, 1,
3.826715, -0.3044719, 1.766915, 1, 1, 1, 1, 1
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
var radius = 9.966589;
var distance = 35.00722;
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
mvMatrix.translate( 0.3919151, 0.4522891, 0.183115 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.00722);
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
