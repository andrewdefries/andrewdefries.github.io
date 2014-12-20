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
-3.108833, 0.7291538, -1.697776, 1, 0, 0, 1,
-2.834957, 0.1256841, -3.176182, 1, 0.007843138, 0, 1,
-2.814629, 0.7357454, -0.8225463, 1, 0.01176471, 0, 1,
-2.743873, 0.3757864, -1.625485, 1, 0.01960784, 0, 1,
-2.739858, 0.1687295, -2.882309, 1, 0.02352941, 0, 1,
-2.715892, 0.06938387, -3.070367, 1, 0.03137255, 0, 1,
-2.494719, 0.4739646, -2.364868, 1, 0.03529412, 0, 1,
-2.483998, 0.3135216, -1.078029, 1, 0.04313726, 0, 1,
-2.44572, 0.1449089, 1.51937, 1, 0.04705882, 0, 1,
-2.393967, -0.06635059, -2.805315, 1, 0.05490196, 0, 1,
-2.38679, 0.03089244, -1.052915, 1, 0.05882353, 0, 1,
-2.327236, 0.4094338, -0.9067911, 1, 0.06666667, 0, 1,
-2.316129, 0.03640658, -1.719943, 1, 0.07058824, 0, 1,
-2.304584, 0.7356283, -1.00169, 1, 0.07843138, 0, 1,
-2.301147, 0.993497, -1.807344, 1, 0.08235294, 0, 1,
-2.257622, 0.501371, -0.8348019, 1, 0.09019608, 0, 1,
-2.229553, 0.02934507, -3.115119, 1, 0.09411765, 0, 1,
-2.191514, 1.33407, -1.039515, 1, 0.1019608, 0, 1,
-2.154103, -0.396115, -2.035875, 1, 0.1098039, 0, 1,
-2.152829, -2.154644, -3.457306, 1, 0.1137255, 0, 1,
-2.136802, 0.9396126, -2.378272, 1, 0.1215686, 0, 1,
-2.122433, -0.6716989, -1.828425, 1, 0.1254902, 0, 1,
-2.088848, -1.129787, -1.222687, 1, 0.1333333, 0, 1,
-2.045043, 0.1906619, -2.223547, 1, 0.1372549, 0, 1,
-1.996223, 0.3247932, -0.3263009, 1, 0.145098, 0, 1,
-1.977574, -1.328028, -2.268262, 1, 0.1490196, 0, 1,
-1.953602, -0.2462362, -0.4385041, 1, 0.1568628, 0, 1,
-1.932904, -0.8282929, -1.940657, 1, 0.1607843, 0, 1,
-1.928849, 0.5208311, -3.127769, 1, 0.1686275, 0, 1,
-1.904924, 2.447579, -1.257824, 1, 0.172549, 0, 1,
-1.894712, 1.195782, -0.8242113, 1, 0.1803922, 0, 1,
-1.886878, 1.788764, -0.9718482, 1, 0.1843137, 0, 1,
-1.88595, -0.3450559, -2.314593, 1, 0.1921569, 0, 1,
-1.869987, 0.3274474, -1.475133, 1, 0.1960784, 0, 1,
-1.849233, -0.607453, -2.257587, 1, 0.2039216, 0, 1,
-1.845645, -0.7556543, -2.63632, 1, 0.2117647, 0, 1,
-1.828736, -1.34947, -1.422735, 1, 0.2156863, 0, 1,
-1.817162, -2.227509, -1.455498, 1, 0.2235294, 0, 1,
-1.814152, -0.9475909, -1.829218, 1, 0.227451, 0, 1,
-1.810433, -0.8883851, -1.743388, 1, 0.2352941, 0, 1,
-1.803304, -0.9601087, -5.016903, 1, 0.2392157, 0, 1,
-1.80044, -1.528167, -2.544571, 1, 0.2470588, 0, 1,
-1.783937, 0.9091244, -0.2423609, 1, 0.2509804, 0, 1,
-1.783283, -0.2678225, -1.716661, 1, 0.2588235, 0, 1,
-1.783059, -0.1055782, -0.1864464, 1, 0.2627451, 0, 1,
-1.778674, 0.2348659, -0.1234716, 1, 0.2705882, 0, 1,
-1.767715, 1.183034, -0.08048084, 1, 0.2745098, 0, 1,
-1.76179, 1.192636, -2.707202, 1, 0.282353, 0, 1,
-1.733783, 0.9393912, -2.038855, 1, 0.2862745, 0, 1,
-1.729861, -0.672819, -1.150687, 1, 0.2941177, 0, 1,
-1.726398, 0.2788523, -0.06043263, 1, 0.3019608, 0, 1,
-1.719268, -0.1785032, -1.373233, 1, 0.3058824, 0, 1,
-1.712324, 0.54483, -0.6822219, 1, 0.3137255, 0, 1,
-1.711466, 0.3360434, -0.6442292, 1, 0.3176471, 0, 1,
-1.710626, -0.2704872, -0.0946045, 1, 0.3254902, 0, 1,
-1.710305, -0.7965079, -1.834261, 1, 0.3294118, 0, 1,
-1.704162, -1.326118, -1.795675, 1, 0.3372549, 0, 1,
-1.703941, -0.3344374, -2.774607, 1, 0.3411765, 0, 1,
-1.664958, -0.5542563, -2.259957, 1, 0.3490196, 0, 1,
-1.655674, -1.308671, -3.759023, 1, 0.3529412, 0, 1,
-1.634768, -0.7574229, -2.819261, 1, 0.3607843, 0, 1,
-1.624308, -0.3828681, -2.020819, 1, 0.3647059, 0, 1,
-1.611793, 0.7334793, -0.9549611, 1, 0.372549, 0, 1,
-1.5897, 0.5073167, -1.158552, 1, 0.3764706, 0, 1,
-1.560752, -0.7363168, -2.82663, 1, 0.3843137, 0, 1,
-1.555358, 0.05977885, -1.647147, 1, 0.3882353, 0, 1,
-1.555044, 1.012979, -1.228967, 1, 0.3960784, 0, 1,
-1.533121, -0.4550343, -0.8692059, 1, 0.4039216, 0, 1,
-1.532295, -1.534292, -2.285779, 1, 0.4078431, 0, 1,
-1.516946, 1.726941, -1.342788, 1, 0.4156863, 0, 1,
-1.510813, -1.441463, -1.832687, 1, 0.4196078, 0, 1,
-1.506319, -0.2564359, -1.113915, 1, 0.427451, 0, 1,
-1.490583, 2.908471, -1.72799, 1, 0.4313726, 0, 1,
-1.484679, -0.5001393, -2.002254, 1, 0.4392157, 0, 1,
-1.483823, -0.02191307, -1.144541, 1, 0.4431373, 0, 1,
-1.475949, -2.117913, -0.1605373, 1, 0.4509804, 0, 1,
-1.472265, -0.7772924, -3.442663, 1, 0.454902, 0, 1,
-1.466803, -1.945236, -3.125149, 1, 0.4627451, 0, 1,
-1.465636, 1.107386, -0.3332972, 1, 0.4666667, 0, 1,
-1.449593, -0.664535, -3.044011, 1, 0.4745098, 0, 1,
-1.441581, 1.601114, 0.8570393, 1, 0.4784314, 0, 1,
-1.431654, -0.2486147, -1.851118, 1, 0.4862745, 0, 1,
-1.422433, -0.4767965, 0.04777274, 1, 0.4901961, 0, 1,
-1.42211, 1.12532, -0.08929733, 1, 0.4980392, 0, 1,
-1.421979, -1.718246, -1.194005, 1, 0.5058824, 0, 1,
-1.418818, 0.2531971, -1.806207, 1, 0.509804, 0, 1,
-1.417038, -1.877195, -2.166208, 1, 0.5176471, 0, 1,
-1.415912, -0.4063497, -2.417565, 1, 0.5215687, 0, 1,
-1.410407, 0.5084745, -2.257189, 1, 0.5294118, 0, 1,
-1.407937, 0.7504207, -1.163014, 1, 0.5333334, 0, 1,
-1.406243, -0.4538392, -3.363214, 1, 0.5411765, 0, 1,
-1.402327, 0.1159723, -0.3618123, 1, 0.5450981, 0, 1,
-1.402078, 0.2488229, -2.074162, 1, 0.5529412, 0, 1,
-1.394705, -0.1333219, -1.752888, 1, 0.5568628, 0, 1,
-1.390294, 0.1537461, -0.2466576, 1, 0.5647059, 0, 1,
-1.380958, 0.02915747, -0.1910933, 1, 0.5686275, 0, 1,
-1.380766, 1.81692, 0.4977617, 1, 0.5764706, 0, 1,
-1.365452, 0.9108056, -0.8025219, 1, 0.5803922, 0, 1,
-1.355804, -0.01137628, -2.372836, 1, 0.5882353, 0, 1,
-1.344879, 0.1491879, -1.603872, 1, 0.5921569, 0, 1,
-1.340659, 1.616932, 0.1945787, 1, 0.6, 0, 1,
-1.332212, 0.3978073, -0.3445182, 1, 0.6078432, 0, 1,
-1.319298, 0.1640718, -0.9892963, 1, 0.6117647, 0, 1,
-1.313194, -0.5055363, -1.563836, 1, 0.6196079, 0, 1,
-1.312306, -0.5061147, -2.690485, 1, 0.6235294, 0, 1,
-1.304774, -0.5649079, -0.8731416, 1, 0.6313726, 0, 1,
-1.300561, -0.3788863, -0.5439268, 1, 0.6352941, 0, 1,
-1.299273, 0.4219417, 0.4754979, 1, 0.6431373, 0, 1,
-1.294957, 0.7654725, 0.5788187, 1, 0.6470588, 0, 1,
-1.292987, 0.2151566, -2.337861, 1, 0.654902, 0, 1,
-1.28161, -1.309201, -3.038413, 1, 0.6588235, 0, 1,
-1.28086, -0.4585127, -2.492975, 1, 0.6666667, 0, 1,
-1.278933, 0.9949422, -2.082345, 1, 0.6705883, 0, 1,
-1.278433, 1.047121, 0.2314676, 1, 0.6784314, 0, 1,
-1.26893, 0.9604612, -1.533355, 1, 0.682353, 0, 1,
-1.266566, 3.091517, -0.8208285, 1, 0.6901961, 0, 1,
-1.263951, -0.3528981, -2.157485, 1, 0.6941177, 0, 1,
-1.260871, -2.486109, -2.393277, 1, 0.7019608, 0, 1,
-1.25541, 0.8469864, -1.333086, 1, 0.7098039, 0, 1,
-1.252295, 0.03703456, 0.451624, 1, 0.7137255, 0, 1,
-1.245932, -0.4998447, 0.4098732, 1, 0.7215686, 0, 1,
-1.242, -0.8993719, -3.135232, 1, 0.7254902, 0, 1,
-1.241238, -0.2496158, -2.239262, 1, 0.7333333, 0, 1,
-1.235991, 0.05482825, -0.7665107, 1, 0.7372549, 0, 1,
-1.235346, -1.234075, -3.256401, 1, 0.7450981, 0, 1,
-1.231312, 0.2914798, -2.282678, 1, 0.7490196, 0, 1,
-1.224748, -1.971874, -3.052718, 1, 0.7568628, 0, 1,
-1.21193, -0.6503989, -2.010809, 1, 0.7607843, 0, 1,
-1.207426, 2.117673, -1.43941, 1, 0.7686275, 0, 1,
-1.201114, -0.6679297, -1.69525, 1, 0.772549, 0, 1,
-1.188347, 0.707638, -0.6816424, 1, 0.7803922, 0, 1,
-1.186489, -1.490068, -3.764271, 1, 0.7843137, 0, 1,
-1.184002, 1.476225, -0.8378494, 1, 0.7921569, 0, 1,
-1.18209, 1.452816, 0.1770283, 1, 0.7960784, 0, 1,
-1.179642, 1.710815, -0.3093108, 1, 0.8039216, 0, 1,
-1.17604, 1.143332, 1.124301, 1, 0.8117647, 0, 1,
-1.174545, 0.5782451, -1.259974, 1, 0.8156863, 0, 1,
-1.167467, -1.639496, -1.023306, 1, 0.8235294, 0, 1,
-1.165735, 1.580996, -0.4391169, 1, 0.827451, 0, 1,
-1.163421, 0.967798, -2.259232, 1, 0.8352941, 0, 1,
-1.154623, 1.958964, -1.003253, 1, 0.8392157, 0, 1,
-1.150447, -0.1902356, -2.054373, 1, 0.8470588, 0, 1,
-1.147595, 0.6129156, -1.544452, 1, 0.8509804, 0, 1,
-1.146781, -2.423532, -2.919961, 1, 0.8588235, 0, 1,
-1.125599, 1.198472, -2.042282, 1, 0.8627451, 0, 1,
-1.10732, -1.365017, -2.7255, 1, 0.8705882, 0, 1,
-1.087473, 0.8868402, 1.104221, 1, 0.8745098, 0, 1,
-1.082129, -0.7104312, -1.106168, 1, 0.8823529, 0, 1,
-1.073707, -0.1148994, -0.679732, 1, 0.8862745, 0, 1,
-1.073343, -1.181747, -2.66608, 1, 0.8941177, 0, 1,
-1.070228, -2.107484, -3.421046, 1, 0.8980392, 0, 1,
-1.062527, 0.2874638, -2.076971, 1, 0.9058824, 0, 1,
-1.05658, 2.00525, -0.08963916, 1, 0.9137255, 0, 1,
-1.049948, 0.5250821, 0.007188442, 1, 0.9176471, 0, 1,
-1.046498, 1.598937, -0.8163548, 1, 0.9254902, 0, 1,
-1.04388, 0.984525, -1.46838, 1, 0.9294118, 0, 1,
-1.040317, 0.3025052, -2.04221, 1, 0.9372549, 0, 1,
-1.034485, 1.838026, -0.5808614, 1, 0.9411765, 0, 1,
-1.032268, 0.1593306, -2.385674, 1, 0.9490196, 0, 1,
-1.027069, -1.455991, -2.972948, 1, 0.9529412, 0, 1,
-1.026087, 0.2514103, -1.371443, 1, 0.9607843, 0, 1,
-1.025773, 0.1840225, 1.401052, 1, 0.9647059, 0, 1,
-1.025111, 0.006192229, -2.89897, 1, 0.972549, 0, 1,
-1.023229, -0.4261047, -3.794478, 1, 0.9764706, 0, 1,
-1.018961, 0.6447927, -0.7286009, 1, 0.9843137, 0, 1,
-1.014676, 0.1554638, -1.795189, 1, 0.9882353, 0, 1,
-1.014515, -0.1368506, -1.37913, 1, 0.9960784, 0, 1,
-0.9997573, 2.268568, -0.2030863, 0.9960784, 1, 0, 1,
-0.9936869, -0.1147449, -0.8871602, 0.9921569, 1, 0, 1,
-0.983952, -0.280872, -2.939945, 0.9843137, 1, 0, 1,
-0.9781091, -0.5918814, -2.072092, 0.9803922, 1, 0, 1,
-0.9732853, -0.9823939, -1.430555, 0.972549, 1, 0, 1,
-0.9678633, 0.6225865, -0.4660942, 0.9686275, 1, 0, 1,
-0.964294, -0.02243747, -2.211591, 0.9607843, 1, 0, 1,
-0.9642347, -0.1498443, -1.305679, 0.9568627, 1, 0, 1,
-0.9636323, 0.5808484, -0.8440502, 0.9490196, 1, 0, 1,
-0.9510108, 0.3870705, -1.651694, 0.945098, 1, 0, 1,
-0.9470837, 0.4770344, -1.054166, 0.9372549, 1, 0, 1,
-0.9381809, 0.4773504, -1.977221, 0.9333333, 1, 0, 1,
-0.9312155, 0.4666114, 0.3124808, 0.9254902, 1, 0, 1,
-0.9311221, 0.8810307, -1.98134, 0.9215686, 1, 0, 1,
-0.9267588, -0.6980219, -2.189667, 0.9137255, 1, 0, 1,
-0.9256936, 1.064909, 0.6577361, 0.9098039, 1, 0, 1,
-0.9226062, 1.501154, 0.581254, 0.9019608, 1, 0, 1,
-0.9223601, -0.06458044, -3.664097, 0.8941177, 1, 0, 1,
-0.9190656, 1.20217, -1.529119, 0.8901961, 1, 0, 1,
-0.9177212, -0.9703125, -1.169888, 0.8823529, 1, 0, 1,
-0.9150599, 0.1735086, -0.1974276, 0.8784314, 1, 0, 1,
-0.9063426, 0.4022293, -1.458272, 0.8705882, 1, 0, 1,
-0.9010549, 0.9167406, -1.597769, 0.8666667, 1, 0, 1,
-0.8993271, 0.06051578, -1.53772, 0.8588235, 1, 0, 1,
-0.8981419, -0.8829935, -2.413662, 0.854902, 1, 0, 1,
-0.8966219, 0.4455511, -2.03455, 0.8470588, 1, 0, 1,
-0.895266, -1.354237, -3.973253, 0.8431373, 1, 0, 1,
-0.8901888, -1.175474, -3.900418, 0.8352941, 1, 0, 1,
-0.8894805, -1.963309, -2.903238, 0.8313726, 1, 0, 1,
-0.8846659, -0.6332179, -0.8688402, 0.8235294, 1, 0, 1,
-0.879519, 1.090326, -0.6588438, 0.8196079, 1, 0, 1,
-0.8775684, 2.530797, -0.2912662, 0.8117647, 1, 0, 1,
-0.8769536, 0.05741144, -1.772162, 0.8078431, 1, 0, 1,
-0.8735228, -0.5008398, -0.9563206, 0.8, 1, 0, 1,
-0.8652639, -0.2776389, -1.438714, 0.7921569, 1, 0, 1,
-0.8614834, -0.2063642, -1.794721, 0.7882353, 1, 0, 1,
-0.8605278, 2.746691, -0.6571373, 0.7803922, 1, 0, 1,
-0.8561906, 1.392669, -0.4571455, 0.7764706, 1, 0, 1,
-0.8472132, -0.236989, -0.6899501, 0.7686275, 1, 0, 1,
-0.8459083, 1.083157, -1.528108, 0.7647059, 1, 0, 1,
-0.8433517, -1.151436, -1.895266, 0.7568628, 1, 0, 1,
-0.8425114, -2.427877, -3.255182, 0.7529412, 1, 0, 1,
-0.840328, 1.580746, -0.7556579, 0.7450981, 1, 0, 1,
-0.8398171, 0.6851766, 0.3660575, 0.7411765, 1, 0, 1,
-0.8391391, 0.4299804, -2.596849, 0.7333333, 1, 0, 1,
-0.8379816, -0.3020117, -0.2521989, 0.7294118, 1, 0, 1,
-0.8256296, 1.643788, -1.326826, 0.7215686, 1, 0, 1,
-0.8248856, -0.5742041, -2.663168, 0.7176471, 1, 0, 1,
-0.8248062, -0.4512081, -1.134091, 0.7098039, 1, 0, 1,
-0.8163368, 1.237697, -0.4539083, 0.7058824, 1, 0, 1,
-0.8159206, -0.1961415, -2.056823, 0.6980392, 1, 0, 1,
-0.7985829, 0.6242938, -0.4486628, 0.6901961, 1, 0, 1,
-0.7933165, 1.082233, -1.710906, 0.6862745, 1, 0, 1,
-0.7929828, -0.8728815, -1.423719, 0.6784314, 1, 0, 1,
-0.7927572, 1.339729, -1.275105, 0.6745098, 1, 0, 1,
-0.7902401, 0.3962008, 0.167084, 0.6666667, 1, 0, 1,
-0.7880998, -0.2719474, -2.003638, 0.6627451, 1, 0, 1,
-0.783922, 0.1378287, -1.833834, 0.654902, 1, 0, 1,
-0.7834994, -0.7860993, -1.979226, 0.6509804, 1, 0, 1,
-0.7818497, -1.034354, -3.078951, 0.6431373, 1, 0, 1,
-0.7817619, 1.533034, 0.04100638, 0.6392157, 1, 0, 1,
-0.7812148, 2.001042, -0.9197017, 0.6313726, 1, 0, 1,
-0.7723305, -0.2439795, -1.960019, 0.627451, 1, 0, 1,
-0.764981, -1.986781, -3.481691, 0.6196079, 1, 0, 1,
-0.761625, 1.749681, -0.04460809, 0.6156863, 1, 0, 1,
-0.7545145, -1.990732, -3.409747, 0.6078432, 1, 0, 1,
-0.7534621, -0.003804329, -1.704617, 0.6039216, 1, 0, 1,
-0.7513769, -0.294227, -1.433781, 0.5960785, 1, 0, 1,
-0.7498693, 1.017418, -1.001848, 0.5882353, 1, 0, 1,
-0.7461617, -0.06389672, -0.3268673, 0.5843138, 1, 0, 1,
-0.7366976, -0.646575, -0.2729835, 0.5764706, 1, 0, 1,
-0.7337255, 0.8459751, -0.4109076, 0.572549, 1, 0, 1,
-0.7313547, -0.5583722, -1.417415, 0.5647059, 1, 0, 1,
-0.7296435, 1.214946, -2.230105, 0.5607843, 1, 0, 1,
-0.7246885, -0.04768516, -1.993172, 0.5529412, 1, 0, 1,
-0.7228909, -0.920467, -1.893365, 0.5490196, 1, 0, 1,
-0.7143556, 0.1480721, -0.5328804, 0.5411765, 1, 0, 1,
-0.7135413, -0.293049, -0.8918368, 0.5372549, 1, 0, 1,
-0.7116085, -0.5322959, -0.4039499, 0.5294118, 1, 0, 1,
-0.7114049, 0.4598043, -2.352391, 0.5254902, 1, 0, 1,
-0.7111103, -0.7860454, -2.464202, 0.5176471, 1, 0, 1,
-0.7092856, -0.6639155, -3.217108, 0.5137255, 1, 0, 1,
-0.7046816, -0.5142787, -2.379965, 0.5058824, 1, 0, 1,
-0.7025459, -0.7604615, -2.713817, 0.5019608, 1, 0, 1,
-0.6960453, -0.7467106, -2.589144, 0.4941176, 1, 0, 1,
-0.6935903, -0.3819293, -0.9779977, 0.4862745, 1, 0, 1,
-0.6931518, -0.8151806, -3.967453, 0.4823529, 1, 0, 1,
-0.6924957, -0.5253409, -2.234334, 0.4745098, 1, 0, 1,
-0.6909803, 0.4670712, -1.047678, 0.4705882, 1, 0, 1,
-0.6880395, -0.6393843, -1.581594, 0.4627451, 1, 0, 1,
-0.6879487, 0.0430771, -0.7589726, 0.4588235, 1, 0, 1,
-0.6854903, -1.659872, -2.893224, 0.4509804, 1, 0, 1,
-0.6821753, 1.065808, 1.219513, 0.4470588, 1, 0, 1,
-0.6782921, 0.1357271, 0.097321, 0.4392157, 1, 0, 1,
-0.6756487, 1.20239, -0.0552256, 0.4352941, 1, 0, 1,
-0.6748711, 0.7806392, 0.3855815, 0.427451, 1, 0, 1,
-0.6714686, 0.07964468, -2.23649, 0.4235294, 1, 0, 1,
-0.6704381, 0.7108798, -0.9921513, 0.4156863, 1, 0, 1,
-0.6652644, 0.8081305, -0.5285619, 0.4117647, 1, 0, 1,
-0.6633022, -0.2851337, -3.468351, 0.4039216, 1, 0, 1,
-0.6583815, -0.07266644, -0.5996406, 0.3960784, 1, 0, 1,
-0.6581067, -0.9124876, -2.503991, 0.3921569, 1, 0, 1,
-0.6575984, -0.8794982, -1.619964, 0.3843137, 1, 0, 1,
-0.6572788, -3.060766, -3.105694, 0.3803922, 1, 0, 1,
-0.6534507, -0.9845914, -3.89151, 0.372549, 1, 0, 1,
-0.6526572, 0.5494487, -1.732657, 0.3686275, 1, 0, 1,
-0.6495998, 1.57066, 1.824083, 0.3607843, 1, 0, 1,
-0.6392649, 0.803538, -1.149381, 0.3568628, 1, 0, 1,
-0.6310161, 1.993765, 1.60245, 0.3490196, 1, 0, 1,
-0.6285528, 0.7715629, -0.1614945, 0.345098, 1, 0, 1,
-0.627123, 1.851673, 0.06773841, 0.3372549, 1, 0, 1,
-0.624965, 0.952621, 1.208908, 0.3333333, 1, 0, 1,
-0.624177, 0.644154, -1.642246, 0.3254902, 1, 0, 1,
-0.6232413, 1.421545, -1.427518, 0.3215686, 1, 0, 1,
-0.6218771, -0.5317335, -0.5327227, 0.3137255, 1, 0, 1,
-0.6178438, 0.03400992, -1.705904, 0.3098039, 1, 0, 1,
-0.616784, 1.350731, -1.724623, 0.3019608, 1, 0, 1,
-0.6148072, -1.099587, -1.493935, 0.2941177, 1, 0, 1,
-0.6147832, -2.279435, -1.193907, 0.2901961, 1, 0, 1,
-0.6112988, 0.03939689, -1.388821, 0.282353, 1, 0, 1,
-0.6010525, -1.357177, -2.619186, 0.2784314, 1, 0, 1,
-0.5923394, 0.1428387, -0.07691858, 0.2705882, 1, 0, 1,
-0.5890419, 0.7614437, 0.8579761, 0.2666667, 1, 0, 1,
-0.5880833, -0.495291, -3.373054, 0.2588235, 1, 0, 1,
-0.5826095, 0.2915356, -3.27871, 0.254902, 1, 0, 1,
-0.5825094, -0.321387, -3.489215, 0.2470588, 1, 0, 1,
-0.5822192, 1.005741, 0.2391092, 0.2431373, 1, 0, 1,
-0.5801139, -0.4738858, -2.024944, 0.2352941, 1, 0, 1,
-0.5800759, -0.6774002, -2.382183, 0.2313726, 1, 0, 1,
-0.5620172, 2.366991, -1.26567, 0.2235294, 1, 0, 1,
-0.5577254, -1.195265, -3.588552, 0.2196078, 1, 0, 1,
-0.5577078, 0.04827385, -1.695029, 0.2117647, 1, 0, 1,
-0.5479755, -1.231163, -3.893867, 0.2078431, 1, 0, 1,
-0.5445523, -0.07602043, -2.158292, 0.2, 1, 0, 1,
-0.543569, -0.9392646, -2.900043, 0.1921569, 1, 0, 1,
-0.5393928, 0.9775483, -0.07237197, 0.1882353, 1, 0, 1,
-0.5365059, -2.596309, -4.202931, 0.1803922, 1, 0, 1,
-0.5335472, -1.243036, 0.08377887, 0.1764706, 1, 0, 1,
-0.5298269, 1.334002, 0.4106128, 0.1686275, 1, 0, 1,
-0.5205652, -1.799986, -2.925816, 0.1647059, 1, 0, 1,
-0.52016, 0.9183462, 0.8899149, 0.1568628, 1, 0, 1,
-0.5141165, -1.082027, -1.861342, 0.1529412, 1, 0, 1,
-0.5034406, 0.5653729, 0.8237987, 0.145098, 1, 0, 1,
-0.5018589, -1.69769, -3.592963, 0.1411765, 1, 0, 1,
-0.5006117, 0.06106343, -1.466928, 0.1333333, 1, 0, 1,
-0.5003676, 1.828397, -1.690917, 0.1294118, 1, 0, 1,
-0.4982086, 1.075, -0.691168, 0.1215686, 1, 0, 1,
-0.4956422, -0.4107688, -2.332123, 0.1176471, 1, 0, 1,
-0.4913824, -1.018543, -1.903057, 0.1098039, 1, 0, 1,
-0.4906577, 0.3296775, -0.9743762, 0.1058824, 1, 0, 1,
-0.4892197, -0.3356881, -2.824118, 0.09803922, 1, 0, 1,
-0.4874132, 0.2764681, -1.258786, 0.09019608, 1, 0, 1,
-0.4840016, -0.168943, -0.8732831, 0.08627451, 1, 0, 1,
-0.4833935, 2.776206, -1.142573, 0.07843138, 1, 0, 1,
-0.4832795, -1.141588, -2.74176, 0.07450981, 1, 0, 1,
-0.4778292, -1.137428, -2.378986, 0.06666667, 1, 0, 1,
-0.4776265, -0.4385491, -2.342244, 0.0627451, 1, 0, 1,
-0.4759242, -0.7601529, -1.626608, 0.05490196, 1, 0, 1,
-0.4757748, 0.1085976, -0.7178448, 0.05098039, 1, 0, 1,
-0.4746757, 0.2594716, -1.887024, 0.04313726, 1, 0, 1,
-0.4726173, 0.3927227, -0.01919985, 0.03921569, 1, 0, 1,
-0.4615913, 0.1119024, -1.278301, 0.03137255, 1, 0, 1,
-0.4598618, -0.1775571, -1.954028, 0.02745098, 1, 0, 1,
-0.4523177, 0.8978917, -1.471831, 0.01960784, 1, 0, 1,
-0.4503166, 0.1926235, 0.3532172, 0.01568628, 1, 0, 1,
-0.4499836, 0.231733, -0.3670817, 0.007843138, 1, 0, 1,
-0.4468993, 1.647922, -0.8245553, 0.003921569, 1, 0, 1,
-0.44215, 1.920641, -0.2231204, 0, 1, 0.003921569, 1,
-0.4369026, 0.3663389, -1.46275, 0, 1, 0.01176471, 1,
-0.4362229, -0.7404318, -2.41238, 0, 1, 0.01568628, 1,
-0.4328589, -0.2159308, -1.499236, 0, 1, 0.02352941, 1,
-0.4294648, 1.829635, -0.2838559, 0, 1, 0.02745098, 1,
-0.4287461, -1.626003, -4.34785, 0, 1, 0.03529412, 1,
-0.4150026, 0.3318011, 0.05984608, 0, 1, 0.03921569, 1,
-0.4133053, 0.5441688, -0.886632, 0, 1, 0.04705882, 1,
-0.4053763, 0.6244766, -1.750863, 0, 1, 0.05098039, 1,
-0.3998545, -0.08180748, -3.074808, 0, 1, 0.05882353, 1,
-0.3987842, -0.1911985, -3.15861, 0, 1, 0.0627451, 1,
-0.3983697, 0.2536227, -0.461891, 0, 1, 0.07058824, 1,
-0.3968113, 0.9088176, -1.335124, 0, 1, 0.07450981, 1,
-0.3940232, 0.9789621, -2.000676, 0, 1, 0.08235294, 1,
-0.3896877, -0.5896463, -1.684807, 0, 1, 0.08627451, 1,
-0.3856182, 1.472629, 1.187461, 0, 1, 0.09411765, 1,
-0.3802163, -1.879399, -2.027778, 0, 1, 0.1019608, 1,
-0.3778183, 0.2397329, -1.178926, 0, 1, 0.1058824, 1,
-0.3766163, -0.3595626, -0.3218657, 0, 1, 0.1137255, 1,
-0.3754749, 0.8361305, 0.749018, 0, 1, 0.1176471, 1,
-0.3724431, -1.167396, -2.493199, 0, 1, 0.1254902, 1,
-0.3715785, -1.115816, -2.42368, 0, 1, 0.1294118, 1,
-0.3710963, -0.4834168, -2.143537, 0, 1, 0.1372549, 1,
-0.3696921, 0.9779316, -0.470775, 0, 1, 0.1411765, 1,
-0.3689592, 0.02745995, -1.46113, 0, 1, 0.1490196, 1,
-0.3680504, 0.3071561, 0.3553002, 0, 1, 0.1529412, 1,
-0.3608361, -0.9602752, -1.820455, 0, 1, 0.1607843, 1,
-0.3498024, -0.9218337, -3.270125, 0, 1, 0.1647059, 1,
-0.3464545, 2.381754, -1.758803, 0, 1, 0.172549, 1,
-0.3462683, 0.2811301, 0.26901, 0, 1, 0.1764706, 1,
-0.3457777, 0.273466, 0.3373737, 0, 1, 0.1843137, 1,
-0.3431441, 1.388201, 0.7935439, 0, 1, 0.1882353, 1,
-0.3425976, -0.007557038, -2.091083, 0, 1, 0.1960784, 1,
-0.3409331, -2.091802, -3.585194, 0, 1, 0.2039216, 1,
-0.3380706, -0.8605474, -1.818228, 0, 1, 0.2078431, 1,
-0.3308271, 0.2933868, -1.438766, 0, 1, 0.2156863, 1,
-0.3301397, -2.038891, -2.513006, 0, 1, 0.2196078, 1,
-0.3288768, 0.4376923, -2.06371, 0, 1, 0.227451, 1,
-0.3280436, 0.01583097, -2.587714, 0, 1, 0.2313726, 1,
-0.3264709, -0.1992138, -2.326145, 0, 1, 0.2392157, 1,
-0.3248477, 1.27358, -0.6575676, 0, 1, 0.2431373, 1,
-0.3248151, -0.7329351, 0.2349105, 0, 1, 0.2509804, 1,
-0.3220941, -1.426606, -2.250839, 0, 1, 0.254902, 1,
-0.3170169, -0.2715471, -1.077373, 0, 1, 0.2627451, 1,
-0.3158019, 0.5178996, -0.3299021, 0, 1, 0.2666667, 1,
-0.313312, -1.138017, -3.964043, 0, 1, 0.2745098, 1,
-0.3123324, -1.087437, -2.696663, 0, 1, 0.2784314, 1,
-0.3114987, -0.1836333, -4.352748, 0, 1, 0.2862745, 1,
-0.3085492, -0.5060318, -1.245336, 0, 1, 0.2901961, 1,
-0.3034576, 0.3120718, -1.778024, 0, 1, 0.2980392, 1,
-0.301969, 0.6892537, -0.1713401, 0, 1, 0.3058824, 1,
-0.2994556, -0.4307442, -2.211633, 0, 1, 0.3098039, 1,
-0.2974054, -0.08098859, -1.367723, 0, 1, 0.3176471, 1,
-0.2961696, -1.900025, -4.238008, 0, 1, 0.3215686, 1,
-0.2949668, -0.04135229, -1.393171, 0, 1, 0.3294118, 1,
-0.2916212, -1.205809, -3.002984, 0, 1, 0.3333333, 1,
-0.2825338, 0.5753316, -0.1403058, 0, 1, 0.3411765, 1,
-0.2807243, 0.5893008, -0.7263953, 0, 1, 0.345098, 1,
-0.2793665, -2.173713, -3.426466, 0, 1, 0.3529412, 1,
-0.2774549, 1.189149, -0.8544241, 0, 1, 0.3568628, 1,
-0.2765051, -0.5465748, -2.159822, 0, 1, 0.3647059, 1,
-0.2747535, 0.07387023, -0.8340356, 0, 1, 0.3686275, 1,
-0.2742263, 0.3399618, 1.366975, 0, 1, 0.3764706, 1,
-0.2711761, -0.1820356, -2.69748, 0, 1, 0.3803922, 1,
-0.2709489, 1.598438, -0.3007386, 0, 1, 0.3882353, 1,
-0.2678953, 0.7606735, 0.4314674, 0, 1, 0.3921569, 1,
-0.2643132, 2.446839, -0.09906048, 0, 1, 0.4, 1,
-0.2630172, 1.454611, -1.347354, 0, 1, 0.4078431, 1,
-0.2615916, -1.801119, -3.979733, 0, 1, 0.4117647, 1,
-0.2615359, 0.7994511, 0.6067116, 0, 1, 0.4196078, 1,
-0.2581255, -1.000025, -2.490459, 0, 1, 0.4235294, 1,
-0.2575181, 0.08187958, 0.3583142, 0, 1, 0.4313726, 1,
-0.2561578, 1.328428, -0.8003826, 0, 1, 0.4352941, 1,
-0.2558228, 1.499164, -0.2870623, 0, 1, 0.4431373, 1,
-0.2461138, -1.669038, -2.383827, 0, 1, 0.4470588, 1,
-0.2455289, -0.2891751, -1.678894, 0, 1, 0.454902, 1,
-0.2449988, -0.08589178, -3.060419, 0, 1, 0.4588235, 1,
-0.2395834, -0.613133, -1.3528, 0, 1, 0.4666667, 1,
-0.2383989, 0.6802952, -1.112399, 0, 1, 0.4705882, 1,
-0.2376303, 0.6492373, -2.364547, 0, 1, 0.4784314, 1,
-0.2352068, -0.9389663, -2.931439, 0, 1, 0.4823529, 1,
-0.2347802, -1.844737, -4.491727, 0, 1, 0.4901961, 1,
-0.2310016, -1.163136, -3.322203, 0, 1, 0.4941176, 1,
-0.2275784, -0.7235945, -5.08137, 0, 1, 0.5019608, 1,
-0.2219353, -0.1438425, -3.182, 0, 1, 0.509804, 1,
-0.2216762, 0.9678255, 1.833192, 0, 1, 0.5137255, 1,
-0.2204334, 1.113189, 0.04646351, 0, 1, 0.5215687, 1,
-0.2193756, -0.09096079, -1.820632, 0, 1, 0.5254902, 1,
-0.2115712, 0.8789088, 1.245811, 0, 1, 0.5333334, 1,
-0.2084344, -0.4512978, -4.869476, 0, 1, 0.5372549, 1,
-0.20822, 0.02238294, -1.730794, 0, 1, 0.5450981, 1,
-0.2082114, 1.302741, -0.2141748, 0, 1, 0.5490196, 1,
-0.202631, 0.1868008, -2.513436, 0, 1, 0.5568628, 1,
-0.1957252, -1.463341, -3.525871, 0, 1, 0.5607843, 1,
-0.1947699, -0.2255082, -2.498882, 0, 1, 0.5686275, 1,
-0.1944463, 0.401792, -1.075837, 0, 1, 0.572549, 1,
-0.1925815, -0.2758377, -1.456461, 0, 1, 0.5803922, 1,
-0.1868905, 0.058752, 0.02700768, 0, 1, 0.5843138, 1,
-0.1861992, -0.3088508, -1.549686, 0, 1, 0.5921569, 1,
-0.1846767, 0.6479474, -0.9991409, 0, 1, 0.5960785, 1,
-0.1838741, 0.7237234, -0.8265669, 0, 1, 0.6039216, 1,
-0.17837, 0.01200647, -0.7970157, 0, 1, 0.6117647, 1,
-0.1689134, 0.9578415, -1.716497, 0, 1, 0.6156863, 1,
-0.1644238, 0.1892761, -1.508184, 0, 1, 0.6235294, 1,
-0.1614769, 1.99364, -2.344931, 0, 1, 0.627451, 1,
-0.1609108, 0.7671719, -0.5623078, 0, 1, 0.6352941, 1,
-0.1590252, -0.5932099, -3.411108, 0, 1, 0.6392157, 1,
-0.1546763, -0.6048959, -4.937164, 0, 1, 0.6470588, 1,
-0.1523867, 2.463413, 1.153288, 0, 1, 0.6509804, 1,
-0.1498721, -0.2190403, -3.954636, 0, 1, 0.6588235, 1,
-0.1483894, -0.8269373, -3.844011, 0, 1, 0.6627451, 1,
-0.1454963, -0.2984078, -3.292578, 0, 1, 0.6705883, 1,
-0.1355052, -0.1481065, -1.870255, 0, 1, 0.6745098, 1,
-0.131087, 0.3467046, -1.302139, 0, 1, 0.682353, 1,
-0.1282048, -0.01309969, -1.604768, 0, 1, 0.6862745, 1,
-0.1249257, -0.0200283, -0.6687752, 0, 1, 0.6941177, 1,
-0.1234128, 0.2018253, 0.498132, 0, 1, 0.7019608, 1,
-0.1216785, -0.7063782, -3.402363, 0, 1, 0.7058824, 1,
-0.1060554, 1.757983, 0.7121289, 0, 1, 0.7137255, 1,
-0.1041352, -0.3732116, -2.50666, 0, 1, 0.7176471, 1,
-0.09990154, -0.7708383, -2.915743, 0, 1, 0.7254902, 1,
-0.0991075, -1.32928, -1.872361, 0, 1, 0.7294118, 1,
-0.09266742, -1.381324, -1.886843, 0, 1, 0.7372549, 1,
-0.08544105, -1.138509, -2.506476, 0, 1, 0.7411765, 1,
-0.0800944, 2.472451, -0.4868828, 0, 1, 0.7490196, 1,
-0.07998931, -1.515113, -4.724637, 0, 1, 0.7529412, 1,
-0.07932798, -0.4729738, -5.104409, 0, 1, 0.7607843, 1,
-0.07817077, -0.5183782, -2.448929, 0, 1, 0.7647059, 1,
-0.07445086, -0.1745912, -3.790759, 0, 1, 0.772549, 1,
-0.07326309, -0.2217441, -1.868647, 0, 1, 0.7764706, 1,
-0.07221863, -1.148222, -2.409795, 0, 1, 0.7843137, 1,
-0.07139156, 1.420257, -1.29583, 0, 1, 0.7882353, 1,
-0.06989385, 1.370144, -0.3711288, 0, 1, 0.7960784, 1,
-0.06758489, -0.5926257, -3.568157, 0, 1, 0.8039216, 1,
-0.06740446, -1.157939, -2.797874, 0, 1, 0.8078431, 1,
-0.05886301, -1.532271, -4.084122, 0, 1, 0.8156863, 1,
-0.05861403, -0.7084982, -1.785229, 0, 1, 0.8196079, 1,
-0.0567164, -1.515004, -3.48598, 0, 1, 0.827451, 1,
-0.05631229, 1.40883, -0.07586682, 0, 1, 0.8313726, 1,
-0.05580914, -0.3028634, -2.592018, 0, 1, 0.8392157, 1,
-0.0519008, -0.7436358, -2.145631, 0, 1, 0.8431373, 1,
-0.04945846, 0.392323, 0.1395813, 0, 1, 0.8509804, 1,
-0.04714208, -1.803387, -3.501448, 0, 1, 0.854902, 1,
-0.04645041, -1.291408, -3.594408, 0, 1, 0.8627451, 1,
-0.04549458, -1.531067, -4.662234, 0, 1, 0.8666667, 1,
-0.04382631, -1.456165, -2.921372, 0, 1, 0.8745098, 1,
-0.04260563, 1.0241, 0.6640177, 0, 1, 0.8784314, 1,
-0.04239311, -0.3248054, -4.123767, 0, 1, 0.8862745, 1,
-0.04174234, -0.4926729, -4.067009, 0, 1, 0.8901961, 1,
-0.03643396, -0.4379977, -3.53994, 0, 1, 0.8980392, 1,
-0.03419414, -1.08733, -3.697292, 0, 1, 0.9058824, 1,
-0.02800054, -0.3659559, -1.843745, 0, 1, 0.9098039, 1,
-0.02243571, -1.070677, -2.36317, 0, 1, 0.9176471, 1,
-0.02148869, 1.23614, -1.370015, 0, 1, 0.9215686, 1,
-0.02039048, -2.31467, -4.027534, 0, 1, 0.9294118, 1,
-0.0163375, -1.925575, -2.556967, 0, 1, 0.9333333, 1,
-0.01509409, -1.584741, -3.49322, 0, 1, 0.9411765, 1,
-0.01394042, -0.06981119, -2.387133, 0, 1, 0.945098, 1,
-0.01103519, -0.101607, -2.200319, 0, 1, 0.9529412, 1,
-0.0104727, 0.6092536, 1.189104, 0, 1, 0.9568627, 1,
-0.000576237, 0.5875424, 0.8896571, 0, 1, 0.9647059, 1,
-0.0004679713, 0.4081584, 0.1884896, 0, 1, 0.9686275, 1,
0.0001088493, 0.6595061, -0.3087288, 0, 1, 0.9764706, 1,
0.002065538, -0.4738441, 1.639318, 0, 1, 0.9803922, 1,
0.002255174, 1.006402, -0.09229855, 0, 1, 0.9882353, 1,
0.00506846, -0.3219956, 3.356867, 0, 1, 0.9921569, 1,
0.006757773, 0.3938904, -0.8044571, 0, 1, 1, 1,
0.009284849, 0.1684874, 0.5691594, 0, 0.9921569, 1, 1,
0.01380708, -0.4895688, 3.518593, 0, 0.9882353, 1, 1,
0.01526068, -0.6635572, 3.067525, 0, 0.9803922, 1, 1,
0.01990626, -0.4302697, 2.11905, 0, 0.9764706, 1, 1,
0.0281495, -0.3918177, 3.209333, 0, 0.9686275, 1, 1,
0.02854205, -0.1323073, 3.087924, 0, 0.9647059, 1, 1,
0.02868029, -1.016979, 2.884127, 0, 0.9568627, 1, 1,
0.02880354, -1.853998, 4.14603, 0, 0.9529412, 1, 1,
0.03318116, -1.012189, 3.585774, 0, 0.945098, 1, 1,
0.03511257, 0.6354558, -0.1630422, 0, 0.9411765, 1, 1,
0.03540979, -1.008808, 3.992251, 0, 0.9333333, 1, 1,
0.03547194, -1.512731, 2.745481, 0, 0.9294118, 1, 1,
0.03744244, 0.3474108, -0.04457409, 0, 0.9215686, 1, 1,
0.03956584, 0.2427744, 0.7807471, 0, 0.9176471, 1, 1,
0.04431951, -0.5343688, 4.493876, 0, 0.9098039, 1, 1,
0.04510758, -0.487972, 1.455733, 0, 0.9058824, 1, 1,
0.04710037, -0.6377658, 3.287548, 0, 0.8980392, 1, 1,
0.05119726, 1.424229, -0.4317487, 0, 0.8901961, 1, 1,
0.05430957, 0.5443295, 1.575239, 0, 0.8862745, 1, 1,
0.05626395, -0.4802853, 3.361111, 0, 0.8784314, 1, 1,
0.06206005, 0.9172472, 0.313516, 0, 0.8745098, 1, 1,
0.06225114, 0.6238615, 0.8437864, 0, 0.8666667, 1, 1,
0.06301691, 1.209845, -0.0830963, 0, 0.8627451, 1, 1,
0.07439043, -2.570911, 2.434703, 0, 0.854902, 1, 1,
0.07565764, 1.270453, -0.5069765, 0, 0.8509804, 1, 1,
0.07611856, 0.4161714, -1.254357, 0, 0.8431373, 1, 1,
0.07630183, 0.5285985, -0.2783974, 0, 0.8392157, 1, 1,
0.07873026, 0.4958202, -0.2813783, 0, 0.8313726, 1, 1,
0.08092458, 0.2880027, -0.1341494, 0, 0.827451, 1, 1,
0.08481633, 0.5627741, 0.7033709, 0, 0.8196079, 1, 1,
0.0856353, -0.6777984, 2.682481, 0, 0.8156863, 1, 1,
0.08587161, 0.4046793, 1.121035, 0, 0.8078431, 1, 1,
0.0883558, -0.5030884, 2.705911, 0, 0.8039216, 1, 1,
0.08904558, 0.39052, -1.412503, 0, 0.7960784, 1, 1,
0.09028801, 0.7283212, 0.3702452, 0, 0.7882353, 1, 1,
0.09333346, -0.2613806, 2.157642, 0, 0.7843137, 1, 1,
0.09390937, 0.4286773, -0.5959563, 0, 0.7764706, 1, 1,
0.09652714, 0.2039184, 1.335484, 0, 0.772549, 1, 1,
0.1017371, -0.8301482, 2.441954, 0, 0.7647059, 1, 1,
0.1026912, 0.2016578, 1.050256, 0, 0.7607843, 1, 1,
0.1028926, -0.8973392, 3.949193, 0, 0.7529412, 1, 1,
0.1030658, 1.436607, 1.836214, 0, 0.7490196, 1, 1,
0.1034438, -0.6184785, 2.100014, 0, 0.7411765, 1, 1,
0.1047341, 0.3493174, -0.4224992, 0, 0.7372549, 1, 1,
0.1052396, -0.9920514, 3.391641, 0, 0.7294118, 1, 1,
0.1053019, 0.07766082, 1.14151, 0, 0.7254902, 1, 1,
0.1066234, -2.228181, 5.278811, 0, 0.7176471, 1, 1,
0.106963, -0.1365156, 2.269264, 0, 0.7137255, 1, 1,
0.1080123, 1.382135, -0.1554058, 0, 0.7058824, 1, 1,
0.1096312, -0.4810493, 4.183951, 0, 0.6980392, 1, 1,
0.1139489, -0.6980006, 4.343609, 0, 0.6941177, 1, 1,
0.117693, -0.626263, 2.893789, 0, 0.6862745, 1, 1,
0.1206525, -1.690736, 2.552247, 0, 0.682353, 1, 1,
0.1210712, 0.7825775, 1.176378, 0, 0.6745098, 1, 1,
0.1231826, -0.6833031, 2.887573, 0, 0.6705883, 1, 1,
0.1257329, 0.1477438, 1.05178, 0, 0.6627451, 1, 1,
0.1278477, -0.03438376, 1.665263, 0, 0.6588235, 1, 1,
0.1335995, -0.6018823, 2.687832, 0, 0.6509804, 1, 1,
0.136271, 1.238771, 0.5568398, 0, 0.6470588, 1, 1,
0.1376305, -0.6986916, 3.443044, 0, 0.6392157, 1, 1,
0.138883, -1.176489, 4.461321, 0, 0.6352941, 1, 1,
0.1404673, 0.006983881, 0.7740473, 0, 0.627451, 1, 1,
0.1417086, -0.6405514, 2.35507, 0, 0.6235294, 1, 1,
0.1444891, 1.038623, 0.9250124, 0, 0.6156863, 1, 1,
0.1449783, 0.224405, 0.1215043, 0, 0.6117647, 1, 1,
0.1467588, -0.3973787, 3.407618, 0, 0.6039216, 1, 1,
0.1469933, -0.8357382, 2.813572, 0, 0.5960785, 1, 1,
0.1473532, 1.450158, 0.09032664, 0, 0.5921569, 1, 1,
0.1484207, -1.534428, 2.820986, 0, 0.5843138, 1, 1,
0.1575411, -1.331636, 2.859774, 0, 0.5803922, 1, 1,
0.1582804, -0.2154196, 2.964797, 0, 0.572549, 1, 1,
0.1612369, 0.8977679, 1.333352, 0, 0.5686275, 1, 1,
0.1617479, -0.08708573, 1.414821, 0, 0.5607843, 1, 1,
0.1635407, -0.285207, 2.671594, 0, 0.5568628, 1, 1,
0.1643934, 0.8112441, -0.5198088, 0, 0.5490196, 1, 1,
0.1687583, -0.2028627, 0.7377865, 0, 0.5450981, 1, 1,
0.1741, -0.6807829, 3.960552, 0, 0.5372549, 1, 1,
0.1762696, 0.4747505, 1.410383, 0, 0.5333334, 1, 1,
0.1855035, 0.1361519, 2.503606, 0, 0.5254902, 1, 1,
0.1862122, -1.339252, 2.595264, 0, 0.5215687, 1, 1,
0.1908606, 0.9683912, 0.4218771, 0, 0.5137255, 1, 1,
0.1940417, 0.09844275, 0.4487575, 0, 0.509804, 1, 1,
0.201725, 0.1899493, 1.761341, 0, 0.5019608, 1, 1,
0.2066209, 0.5296447, 1.932428, 0, 0.4941176, 1, 1,
0.2088732, -0.1961816, 1.213041, 0, 0.4901961, 1, 1,
0.2146151, 0.3912467, 1.268806, 0, 0.4823529, 1, 1,
0.2185304, 0.06151155, 2.384664, 0, 0.4784314, 1, 1,
0.2193861, 0.1822599, 0.9169917, 0, 0.4705882, 1, 1,
0.2196849, -0.5334084, 2.622669, 0, 0.4666667, 1, 1,
0.220529, 2.533346, 1.260064, 0, 0.4588235, 1, 1,
0.2208875, 1.046671, -0.4707924, 0, 0.454902, 1, 1,
0.2245794, -0.4817178, 1.483683, 0, 0.4470588, 1, 1,
0.2247364, -1.982028, 2.715277, 0, 0.4431373, 1, 1,
0.2278703, 0.5154675, 0.5469646, 0, 0.4352941, 1, 1,
0.2338923, 0.8248078, -1.606743, 0, 0.4313726, 1, 1,
0.2381844, 0.08889134, 0.5354978, 0, 0.4235294, 1, 1,
0.2397322, 0.8017525, -0.7129304, 0, 0.4196078, 1, 1,
0.2440631, -0.2545734, 2.886522, 0, 0.4117647, 1, 1,
0.2465627, 0.570661, 2.266429, 0, 0.4078431, 1, 1,
0.2519884, -0.6506352, 3.785069, 0, 0.4, 1, 1,
0.2531031, -0.7599939, 3.445716, 0, 0.3921569, 1, 1,
0.2590826, 2.303176, -0.09596145, 0, 0.3882353, 1, 1,
0.2623917, 0.1206201, 1.062255, 0, 0.3803922, 1, 1,
0.2625917, -0.09835222, 1.579661, 0, 0.3764706, 1, 1,
0.2652825, -0.4889701, 2.114267, 0, 0.3686275, 1, 1,
0.2680224, -0.06306519, 2.761348, 0, 0.3647059, 1, 1,
0.2680239, 1.326303, 0.5333017, 0, 0.3568628, 1, 1,
0.2761517, -0.2846479, 2.65543, 0, 0.3529412, 1, 1,
0.276689, -0.4736567, 3.257672, 0, 0.345098, 1, 1,
0.2768734, 1.2711, 0.7732026, 0, 0.3411765, 1, 1,
0.2795559, -0.6459018, 1.617638, 0, 0.3333333, 1, 1,
0.2799343, 0.8711989, 1.421314, 0, 0.3294118, 1, 1,
0.2813206, 0.03577567, 2.270957, 0, 0.3215686, 1, 1,
0.2822907, -1.295727, 4.584793, 0, 0.3176471, 1, 1,
0.2836868, 0.2914219, 0.238625, 0, 0.3098039, 1, 1,
0.2877336, 0.5114754, -0.8144435, 0, 0.3058824, 1, 1,
0.2900174, 0.8264527, 0.8986626, 0, 0.2980392, 1, 1,
0.2919734, 0.632834, 0.4608672, 0, 0.2901961, 1, 1,
0.292493, -0.3691343, 1.799522, 0, 0.2862745, 1, 1,
0.2929566, -0.2296241, 3.147275, 0, 0.2784314, 1, 1,
0.2979784, 0.6068578, 1.35528, 0, 0.2745098, 1, 1,
0.3004201, -0.5082564, 2.432746, 0, 0.2666667, 1, 1,
0.3008898, -1.455948, 4.726387, 0, 0.2627451, 1, 1,
0.3015411, -0.3036732, 0.745105, 0, 0.254902, 1, 1,
0.3051542, 0.7170693, 0.9714354, 0, 0.2509804, 1, 1,
0.3054391, -0.5555313, 0.7998528, 0, 0.2431373, 1, 1,
0.3118235, -0.5504047, 3.209723, 0, 0.2392157, 1, 1,
0.3125219, -0.04709131, -0.0113762, 0, 0.2313726, 1, 1,
0.3188454, 0.3985126, 0.3677071, 0, 0.227451, 1, 1,
0.3208721, 1.199193, 1.143816, 0, 0.2196078, 1, 1,
0.3257819, -0.3974581, 4.231502, 0, 0.2156863, 1, 1,
0.3291104, 1.283188, 1.158146, 0, 0.2078431, 1, 1,
0.3305811, -0.3537207, 2.271443, 0, 0.2039216, 1, 1,
0.3317766, 0.6774755, -0.4710144, 0, 0.1960784, 1, 1,
0.3331839, -0.2077292, 1.457243, 0, 0.1882353, 1, 1,
0.3332177, 0.1808256, 0.2295783, 0, 0.1843137, 1, 1,
0.3408796, -0.7240605, 3.130883, 0, 0.1764706, 1, 1,
0.3438041, 0.8442342, 1.195757, 0, 0.172549, 1, 1,
0.3453621, -2.142501, 4.12965, 0, 0.1647059, 1, 1,
0.3506617, 0.695036, 1.32399, 0, 0.1607843, 1, 1,
0.3544104, -0.8360561, 5.056566, 0, 0.1529412, 1, 1,
0.3550984, -0.0125656, 1.476807, 0, 0.1490196, 1, 1,
0.3572244, -0.5434055, 3.00013, 0, 0.1411765, 1, 1,
0.3595136, 1.015604, 0.9598038, 0, 0.1372549, 1, 1,
0.3603308, 0.8598893, 0.6905139, 0, 0.1294118, 1, 1,
0.3639543, -0.7968276, 2.673829, 0, 0.1254902, 1, 1,
0.3748169, -1.152652, 0.7562048, 0, 0.1176471, 1, 1,
0.3760261, 1.636098, 0.1538126, 0, 0.1137255, 1, 1,
0.3761972, 0.150772, 0.8398952, 0, 0.1058824, 1, 1,
0.376234, -0.5912922, 2.108744, 0, 0.09803922, 1, 1,
0.3767116, -0.906608, 2.135295, 0, 0.09411765, 1, 1,
0.3796134, 0.6545129, 0.01596874, 0, 0.08627451, 1, 1,
0.3820988, -0.8282341, 2.32919, 0, 0.08235294, 1, 1,
0.3869964, 0.343431, 2.202758, 0, 0.07450981, 1, 1,
0.3923621, -1.351192, 1.729167, 0, 0.07058824, 1, 1,
0.3925115, 0.6931064, 0.427417, 0, 0.0627451, 1, 1,
0.3933337, -0.08898568, 0.6093692, 0, 0.05882353, 1, 1,
0.3984451, 0.1650539, 1.413495, 0, 0.05098039, 1, 1,
0.3987142, -1.613222, 2.318747, 0, 0.04705882, 1, 1,
0.402422, 0.04171618, 0.7696028, 0, 0.03921569, 1, 1,
0.4062443, -0.2518832, 2.520548, 0, 0.03529412, 1, 1,
0.4067959, -1.498549, 3.652544, 0, 0.02745098, 1, 1,
0.4134874, 0.4621179, -0.4064275, 0, 0.02352941, 1, 1,
0.4157204, -0.05627827, 1.396522, 0, 0.01568628, 1, 1,
0.4192722, -0.3628981, 1.870378, 0, 0.01176471, 1, 1,
0.4212114, 0.3491674, 1.303176, 0, 0.003921569, 1, 1,
0.4215286, -1.411228, 3.153183, 0.003921569, 0, 1, 1,
0.4219569, 0.3241165, 1.119224, 0.007843138, 0, 1, 1,
0.4240728, 0.8033406, 0.9898499, 0.01568628, 0, 1, 1,
0.4282594, 2.022584, 1.449059, 0.01960784, 0, 1, 1,
0.4319502, -1.044503, 0.4374381, 0.02745098, 0, 1, 1,
0.4345032, 1.845685, -0.3672986, 0.03137255, 0, 1, 1,
0.4382732, 1.567242, 0.5144764, 0.03921569, 0, 1, 1,
0.4392325, -0.300345, 2.860478, 0.04313726, 0, 1, 1,
0.4401335, 1.375369, 1.480889, 0.05098039, 0, 1, 1,
0.4513246, -0.7102562, 1.820623, 0.05490196, 0, 1, 1,
0.4535499, -1.228309, 3.093852, 0.0627451, 0, 1, 1,
0.458345, -0.8826362, 2.033787, 0.06666667, 0, 1, 1,
0.459026, -0.2432717, 2.054016, 0.07450981, 0, 1, 1,
0.4598875, -0.05088326, 2.752138, 0.07843138, 0, 1, 1,
0.4616938, 0.7260658, 0.6385469, 0.08627451, 0, 1, 1,
0.4646702, 0.373534, 2.150704, 0.09019608, 0, 1, 1,
0.473874, -1.523665, 2.18359, 0.09803922, 0, 1, 1,
0.4799829, -0.3132388, 4.163518, 0.1058824, 0, 1, 1,
0.4820255, 1.250257, 0.9835253, 0.1098039, 0, 1, 1,
0.4831281, 0.2925912, 0.100975, 0.1176471, 0, 1, 1,
0.4912449, -0.5611151, 4.045113, 0.1215686, 0, 1, 1,
0.4939353, 0.3865381, 1.937305, 0.1294118, 0, 1, 1,
0.4998855, -0.23894, 2.614407, 0.1333333, 0, 1, 1,
0.5023115, -0.1390776, 0.3482337, 0.1411765, 0, 1, 1,
0.5052644, -0.4587975, 1.808835, 0.145098, 0, 1, 1,
0.5084265, -0.664445, 2.56548, 0.1529412, 0, 1, 1,
0.5093132, -0.7383583, 2.665949, 0.1568628, 0, 1, 1,
0.5142793, -0.1601928, 0.5493202, 0.1647059, 0, 1, 1,
0.5154843, 1.09303, 1.855818, 0.1686275, 0, 1, 1,
0.5166789, -0.6254999, 2.848463, 0.1764706, 0, 1, 1,
0.518993, -1.276147, 3.387589, 0.1803922, 0, 1, 1,
0.5205608, -0.3426218, 2.178889, 0.1882353, 0, 1, 1,
0.524278, 2.161322, 0.2106914, 0.1921569, 0, 1, 1,
0.5255198, -1.292471, 3.202482, 0.2, 0, 1, 1,
0.5338288, -1.039181, 3.268134, 0.2078431, 0, 1, 1,
0.5371541, -1.067516, 3.541597, 0.2117647, 0, 1, 1,
0.5379453, 0.06621882, 2.735249, 0.2196078, 0, 1, 1,
0.5400187, -0.4378812, 2.311607, 0.2235294, 0, 1, 1,
0.5468422, -0.7966516, 2.252906, 0.2313726, 0, 1, 1,
0.5516325, 0.4226151, 1.541666, 0.2352941, 0, 1, 1,
0.5523238, 0.02705573, 2.095035, 0.2431373, 0, 1, 1,
0.5525382, -0.3982462, 1.533961, 0.2470588, 0, 1, 1,
0.5540189, 0.3176848, -0.9510231, 0.254902, 0, 1, 1,
0.5605311, -0.09384099, 2.389759, 0.2588235, 0, 1, 1,
0.5607677, -0.432935, 1.792331, 0.2666667, 0, 1, 1,
0.5610406, 2.249496, -0.5886882, 0.2705882, 0, 1, 1,
0.5634115, 1.238299, 1.10457, 0.2784314, 0, 1, 1,
0.5666565, 0.2407949, 0.9702103, 0.282353, 0, 1, 1,
0.5693852, 0.2012778, 0.9593582, 0.2901961, 0, 1, 1,
0.5697276, 0.5898049, -0.5525003, 0.2941177, 0, 1, 1,
0.5699709, -1.403017, 2.088104, 0.3019608, 0, 1, 1,
0.5701271, -0.3662461, 2.871313, 0.3098039, 0, 1, 1,
0.5712936, -0.9850917, 2.919313, 0.3137255, 0, 1, 1,
0.5783559, -0.3156607, 1.277247, 0.3215686, 0, 1, 1,
0.5785695, -1.982021, 2.824316, 0.3254902, 0, 1, 1,
0.5813155, 0.5289114, 2.85691, 0.3333333, 0, 1, 1,
0.5842683, 0.6213363, 0.7616836, 0.3372549, 0, 1, 1,
0.5851923, -0.5886314, 1.330875, 0.345098, 0, 1, 1,
0.5872254, 1.256487, 0.4163137, 0.3490196, 0, 1, 1,
0.593617, -1.062833, 2.339192, 0.3568628, 0, 1, 1,
0.599372, 0.8219203, 0.9029484, 0.3607843, 0, 1, 1,
0.6038443, 0.1198758, 1.008148, 0.3686275, 0, 1, 1,
0.6065203, -0.8151681, 2.980556, 0.372549, 0, 1, 1,
0.6078051, 0.7307593, 1.006694, 0.3803922, 0, 1, 1,
0.6086521, 0.357533, 0.7542116, 0.3843137, 0, 1, 1,
0.611495, -0.7930689, 2.603822, 0.3921569, 0, 1, 1,
0.6194308, -0.3801513, 2.431958, 0.3960784, 0, 1, 1,
0.6241274, -0.5048891, 2.894058, 0.4039216, 0, 1, 1,
0.6246253, 0.5485114, 1.931943, 0.4117647, 0, 1, 1,
0.6250063, -0.2715918, 2.037026, 0.4156863, 0, 1, 1,
0.6295121, 1.317023, 0.2005029, 0.4235294, 0, 1, 1,
0.6349841, 1.022786, 1.913797, 0.427451, 0, 1, 1,
0.6350275, -1.359672, 3.555681, 0.4352941, 0, 1, 1,
0.6351081, 1.539781, -0.007460378, 0.4392157, 0, 1, 1,
0.6383589, -1.012607, 3.272984, 0.4470588, 0, 1, 1,
0.6480453, 0.7885851, 1.141954, 0.4509804, 0, 1, 1,
0.6482561, -1.203551, 4.251183, 0.4588235, 0, 1, 1,
0.6487705, -1.329902, 2.593146, 0.4627451, 0, 1, 1,
0.6565719, 0.4782002, -0.3843296, 0.4705882, 0, 1, 1,
0.6573074, -0.7964624, 3.167295, 0.4745098, 0, 1, 1,
0.6713502, -0.1999276, 2.286057, 0.4823529, 0, 1, 1,
0.6716698, -1.881166, 4.372716, 0.4862745, 0, 1, 1,
0.6758847, -0.6291798, 0.4823619, 0.4941176, 0, 1, 1,
0.677558, 1.416432, 0.850105, 0.5019608, 0, 1, 1,
0.6778079, 0.7782954, -0.1924007, 0.5058824, 0, 1, 1,
0.6816533, 0.572154, 2.938794, 0.5137255, 0, 1, 1,
0.6847386, -1.000911, 2.525578, 0.5176471, 0, 1, 1,
0.6974972, 0.008149271, 0.2655258, 0.5254902, 0, 1, 1,
0.6977494, -0.5020813, 2.314659, 0.5294118, 0, 1, 1,
0.6978589, 0.1075009, 1.37654, 0.5372549, 0, 1, 1,
0.7027531, 0.4904541, 1.413261, 0.5411765, 0, 1, 1,
0.7047274, -0.2262188, 1.477692, 0.5490196, 0, 1, 1,
0.705585, 1.132706, 0.7807641, 0.5529412, 0, 1, 1,
0.7091339, -0.2735073, 2.733844, 0.5607843, 0, 1, 1,
0.7114793, 0.2473124, 2.622437, 0.5647059, 0, 1, 1,
0.7153506, 1.094652, 0.8110823, 0.572549, 0, 1, 1,
0.7165361, 0.377806, 1.466842, 0.5764706, 0, 1, 1,
0.7203389, -0.3206143, 2.172274, 0.5843138, 0, 1, 1,
0.7212797, -0.5733328, 2.237078, 0.5882353, 0, 1, 1,
0.7235458, 0.01354966, 1.799982, 0.5960785, 0, 1, 1,
0.7326915, 0.1128249, -0.200196, 0.6039216, 0, 1, 1,
0.7338265, -1.151664, 3.395646, 0.6078432, 0, 1, 1,
0.7401211, 0.2299756, 0.9036467, 0.6156863, 0, 1, 1,
0.7408902, -0.4294713, 0.7866236, 0.6196079, 0, 1, 1,
0.7413242, 0.3131705, 0.1352654, 0.627451, 0, 1, 1,
0.742952, -0.4364393, 2.789453, 0.6313726, 0, 1, 1,
0.7494501, -0.3279337, 1.79015, 0.6392157, 0, 1, 1,
0.7512769, -1.284301, 2.138913, 0.6431373, 0, 1, 1,
0.753602, -0.2196472, 2.872863, 0.6509804, 0, 1, 1,
0.7549251, 0.6587257, 3.983984, 0.654902, 0, 1, 1,
0.7558476, 0.02232367, 1.876742, 0.6627451, 0, 1, 1,
0.7562431, -1.059519, 1.427803, 0.6666667, 0, 1, 1,
0.7601167, -0.2652009, 2.448492, 0.6745098, 0, 1, 1,
0.7625619, 1.786176, 1.289171, 0.6784314, 0, 1, 1,
0.7647904, -0.05309719, 2.475755, 0.6862745, 0, 1, 1,
0.7662961, 0.7414365, 1.913796, 0.6901961, 0, 1, 1,
0.7670116, -0.4793758, 3.98139, 0.6980392, 0, 1, 1,
0.7696404, -1.142918, 2.681431, 0.7058824, 0, 1, 1,
0.7709457, 0.126221, 2.148828, 0.7098039, 0, 1, 1,
0.7736876, -0.8387679, 2.338388, 0.7176471, 0, 1, 1,
0.7769704, 0.865508, 0.4758567, 0.7215686, 0, 1, 1,
0.7775458, 1.062669, 0.4831411, 0.7294118, 0, 1, 1,
0.7896891, -1.130968, 1.284962, 0.7333333, 0, 1, 1,
0.7930056, -0.1165859, 2.4439, 0.7411765, 0, 1, 1,
0.8036449, 0.2216321, 2.216141, 0.7450981, 0, 1, 1,
0.8053463, -0.3240703, 1.107844, 0.7529412, 0, 1, 1,
0.8056996, 0.1544352, 1.506044, 0.7568628, 0, 1, 1,
0.806484, -0.8738056, 2.891759, 0.7647059, 0, 1, 1,
0.8071023, 0.3699369, 1.108941, 0.7686275, 0, 1, 1,
0.8090466, -1.041608, 2.556635, 0.7764706, 0, 1, 1,
0.8134246, -0.1195853, 1.225671, 0.7803922, 0, 1, 1,
0.8134266, 1.0322, -0.602703, 0.7882353, 0, 1, 1,
0.816807, -0.6006098, 3.331212, 0.7921569, 0, 1, 1,
0.8172345, 1.021608, 1.929494, 0.8, 0, 1, 1,
0.8213749, 0.7528496, 0.7816606, 0.8078431, 0, 1, 1,
0.8263875, -0.08223014, 1.761849, 0.8117647, 0, 1, 1,
0.8265152, 0.3302425, 2.438686, 0.8196079, 0, 1, 1,
0.8298827, -2.054274, 1.686294, 0.8235294, 0, 1, 1,
0.8301665, 1.114701, 1.340684, 0.8313726, 0, 1, 1,
0.8401436, 0.6567034, 0.9696446, 0.8352941, 0, 1, 1,
0.8401456, 0.8229649, 2.022716, 0.8431373, 0, 1, 1,
0.8463169, 0.8203999, -0.4071446, 0.8470588, 0, 1, 1,
0.8488495, -0.65435, 3.237504, 0.854902, 0, 1, 1,
0.8490735, 0.7490357, -0.1523111, 0.8588235, 0, 1, 1,
0.8600455, -1.665967, 2.688879, 0.8666667, 0, 1, 1,
0.8616711, -1.026102, 1.966678, 0.8705882, 0, 1, 1,
0.8618708, 0.3953885, 0.1787959, 0.8784314, 0, 1, 1,
0.8643463, -0.1720512, 2.324737, 0.8823529, 0, 1, 1,
0.8648639, 0.4212876, 0.9369883, 0.8901961, 0, 1, 1,
0.8659792, 0.3883705, 2.668063, 0.8941177, 0, 1, 1,
0.8689628, -0.898007, 2.044974, 0.9019608, 0, 1, 1,
0.8762025, -0.00368602, 0.4644235, 0.9098039, 0, 1, 1,
0.8882953, -0.6693961, 2.59955, 0.9137255, 0, 1, 1,
0.8925132, -0.09715325, 1.190719, 0.9215686, 0, 1, 1,
0.8940873, -1.188768, 3.229907, 0.9254902, 0, 1, 1,
0.8944842, 2.3531, 0.4227594, 0.9333333, 0, 1, 1,
0.8956668, -0.4151468, 2.776918, 0.9372549, 0, 1, 1,
0.9001605, -0.0553777, 1.402231, 0.945098, 0, 1, 1,
0.9005994, 1.010854, 2.335454, 0.9490196, 0, 1, 1,
0.906414, 1.52286, -0.9880474, 0.9568627, 0, 1, 1,
0.9095598, -0.2209809, 1.268806, 0.9607843, 0, 1, 1,
0.9185193, 0.5216064, -0.4823643, 0.9686275, 0, 1, 1,
0.9237859, 0.3596225, 2.031358, 0.972549, 0, 1, 1,
0.9301139, 0.2366113, 1.1862, 0.9803922, 0, 1, 1,
0.9372464, 0.6277925, 0.7487602, 0.9843137, 0, 1, 1,
0.941411, 0.3572579, 1.737976, 0.9921569, 0, 1, 1,
0.9455487, -0.3283091, 1.556409, 0.9960784, 0, 1, 1,
0.9475763, -0.8270792, 3.800661, 1, 0, 0.9960784, 1,
0.9499747, -0.414174, 0.5621167, 1, 0, 0.9882353, 1,
0.952702, 0.5794538, 2.508707, 1, 0, 0.9843137, 1,
0.9609494, 0.1712252, 4.212578, 1, 0, 0.9764706, 1,
0.9615692, 2.50147, 1.356196, 1, 0, 0.972549, 1,
0.9677887, 1.875926, 1.627239, 1, 0, 0.9647059, 1,
0.9809239, -0.08096714, 1.730036, 1, 0, 0.9607843, 1,
0.9829591, -1.361298, 2.032919, 1, 0, 0.9529412, 1,
0.9829798, 0.01959966, 2.246044, 1, 0, 0.9490196, 1,
0.9884463, -0.9423537, 2.433456, 1, 0, 0.9411765, 1,
0.9891209, -0.3582232, 1.014658, 1, 0, 0.9372549, 1,
0.9947914, 0.3899978, 0.1532995, 1, 0, 0.9294118, 1,
0.9956929, 0.101633, 2.410261, 1, 0, 0.9254902, 1,
0.9969394, -1.250717, 4.24467, 1, 0, 0.9176471, 1,
1.016328, -0.7658302, 2.345422, 1, 0, 0.9137255, 1,
1.025425, 1.221451, -0.476938, 1, 0, 0.9058824, 1,
1.042779, 1.11249, 0.1537436, 1, 0, 0.9019608, 1,
1.047672, 0.8584167, 1.976439, 1, 0, 0.8941177, 1,
1.050207, -0.06324159, 2.264746, 1, 0, 0.8862745, 1,
1.057716, 0.432084, 0.06135214, 1, 0, 0.8823529, 1,
1.059009, -1.506131, 1.683398, 1, 0, 0.8745098, 1,
1.068461, 1.769912, 1.076015, 1, 0, 0.8705882, 1,
1.070634, 0.51466, -0.08773664, 1, 0, 0.8627451, 1,
1.086445, 1.463061, 0.1134191, 1, 0, 0.8588235, 1,
1.087933, 0.7126245, -0.6542095, 1, 0, 0.8509804, 1,
1.09189, 0.4061958, 1.109479, 1, 0, 0.8470588, 1,
1.09651, -0.5139302, 3.372335, 1, 0, 0.8392157, 1,
1.10421, 1.148249, -0.7592379, 1, 0, 0.8352941, 1,
1.112116, 1.348474, -0.2733824, 1, 0, 0.827451, 1,
1.116472, 1.393589, -0.1582777, 1, 0, 0.8235294, 1,
1.11659, 0.4302765, 2.867458, 1, 0, 0.8156863, 1,
1.123049, 0.6755252, 1.148044, 1, 0, 0.8117647, 1,
1.133233, 1.054137, 1.349378, 1, 0, 0.8039216, 1,
1.141088, -1.379177, 3.68957, 1, 0, 0.7960784, 1,
1.147246, -0.9751343, 2.424144, 1, 0, 0.7921569, 1,
1.150664, 0.3261758, 0.03117544, 1, 0, 0.7843137, 1,
1.152642, 0.3780933, 1.298092, 1, 0, 0.7803922, 1,
1.155782, 1.633822, 2.762202, 1, 0, 0.772549, 1,
1.156796, 0.1188926, 1.076773, 1, 0, 0.7686275, 1,
1.159622, 0.5168337, 2.128901, 1, 0, 0.7607843, 1,
1.166534, 0.6619759, 0.6804958, 1, 0, 0.7568628, 1,
1.176714, -0.6207542, 1.320628, 1, 0, 0.7490196, 1,
1.177472, 0.7762225, 0.8128, 1, 0, 0.7450981, 1,
1.179363, -1.260451, 1.295976, 1, 0, 0.7372549, 1,
1.179876, 1.065827, 1.070639, 1, 0, 0.7333333, 1,
1.180264, -0.4542484, 3.898098, 1, 0, 0.7254902, 1,
1.192463, 1.046705, 1.2148, 1, 0, 0.7215686, 1,
1.203083, 1.868937, 0.1527851, 1, 0, 0.7137255, 1,
1.207963, 0.5150623, 1.014247, 1, 0, 0.7098039, 1,
1.216053, 0.7806246, 0.1431725, 1, 0, 0.7019608, 1,
1.222801, -0.3753921, -0.1722625, 1, 0, 0.6941177, 1,
1.225878, -1.49538, 2.121388, 1, 0, 0.6901961, 1,
1.227787, 0.4400041, 1.865101, 1, 0, 0.682353, 1,
1.229447, 1.648921, 0.7661719, 1, 0, 0.6784314, 1,
1.244693, 1.818699, 0.8610697, 1, 0, 0.6705883, 1,
1.25834, -1.272015, 3.007307, 1, 0, 0.6666667, 1,
1.258495, 0.7100068, 2.046046, 1, 0, 0.6588235, 1,
1.267345, -0.4432098, 1.941422, 1, 0, 0.654902, 1,
1.269433, 1.388679, 0.5654784, 1, 0, 0.6470588, 1,
1.269945, -0.8467847, 3.232351, 1, 0, 0.6431373, 1,
1.271533, 0.3632818, 0.8502563, 1, 0, 0.6352941, 1,
1.278008, 1.906944, 0.04292893, 1, 0, 0.6313726, 1,
1.281822, 0.2246587, 0.7139878, 1, 0, 0.6235294, 1,
1.287393, -0.26223, 1.291342, 1, 0, 0.6196079, 1,
1.294047, -0.2091495, 0.08518474, 1, 0, 0.6117647, 1,
1.299712, -0.1339128, 3.031982, 1, 0, 0.6078432, 1,
1.306438, 1.956157, -0.2318194, 1, 0, 0.6, 1,
1.307703, 0.5293479, 1.507529, 1, 0, 0.5921569, 1,
1.310413, 1.21056, 1.476487, 1, 0, 0.5882353, 1,
1.322874, 0.03582333, 2.052172, 1, 0, 0.5803922, 1,
1.32453, 0.2408418, 1.567281, 1, 0, 0.5764706, 1,
1.329989, 0.07364894, -0.3629426, 1, 0, 0.5686275, 1,
1.341726, 0.8656182, 0.09606728, 1, 0, 0.5647059, 1,
1.343523, -0.4903697, 1.762216, 1, 0, 0.5568628, 1,
1.346867, 0.6250299, 1.877577, 1, 0, 0.5529412, 1,
1.348326, -1.338269, 2.352172, 1, 0, 0.5450981, 1,
1.351549, -1.0782, 2.623857, 1, 0, 0.5411765, 1,
1.352305, 0.7394045, 0.7819999, 1, 0, 0.5333334, 1,
1.352803, -0.6504357, 1.398449, 1, 0, 0.5294118, 1,
1.354663, -2.140455, 5.186423, 1, 0, 0.5215687, 1,
1.357109, -0.8852869, -0.1747503, 1, 0, 0.5176471, 1,
1.36627, 0.6906195, 0.797496, 1, 0, 0.509804, 1,
1.38215, 0.1756629, 2.162791, 1, 0, 0.5058824, 1,
1.383549, -0.8397523, 1.721272, 1, 0, 0.4980392, 1,
1.412085, 0.7589046, -0.9800333, 1, 0, 0.4901961, 1,
1.425296, 0.3588563, 0.05841835, 1, 0, 0.4862745, 1,
1.428478, 0.335324, 2.151543, 1, 0, 0.4784314, 1,
1.430825, 1.632962, 0.8386449, 1, 0, 0.4745098, 1,
1.43679, -0.7163615, 2.159783, 1, 0, 0.4666667, 1,
1.436908, 1.305519, 1.68249, 1, 0, 0.4627451, 1,
1.444656, -0.1192212, 0.3767787, 1, 0, 0.454902, 1,
1.451041, 0.5347871, 1.649538, 1, 0, 0.4509804, 1,
1.451552, 0.2471314, 2.166035, 1, 0, 0.4431373, 1,
1.455155, -0.8042386, 1.320024, 1, 0, 0.4392157, 1,
1.45609, -1.281776, 1.342792, 1, 0, 0.4313726, 1,
1.45846, 1.636564, 0.5190771, 1, 0, 0.427451, 1,
1.47655, 1.137832, -0.2862107, 1, 0, 0.4196078, 1,
1.478138, -0.8055165, 2.028496, 1, 0, 0.4156863, 1,
1.495079, -2.412467, 2.980347, 1, 0, 0.4078431, 1,
1.500189, 2.594386, 0.8982651, 1, 0, 0.4039216, 1,
1.523847, 0.2298007, 1.013639, 1, 0, 0.3960784, 1,
1.527413, -0.352576, 1.618185, 1, 0, 0.3882353, 1,
1.539724, -1.988685, 3.061897, 1, 0, 0.3843137, 1,
1.553991, 1.419812, 1.761665, 1, 0, 0.3764706, 1,
1.589118, -0.09324629, 1.742671, 1, 0, 0.372549, 1,
1.601514, -0.02656176, 2.379618, 1, 0, 0.3647059, 1,
1.604982, -0.6485248, 3.0877, 1, 0, 0.3607843, 1,
1.613019, -1.284533, 1.344137, 1, 0, 0.3529412, 1,
1.615195, 0.1489974, 2.241573, 1, 0, 0.3490196, 1,
1.632241, 0.4407977, 0.7653454, 1, 0, 0.3411765, 1,
1.63472, 0.1072766, 1.187416, 1, 0, 0.3372549, 1,
1.643845, -0.4176973, 1.706284, 1, 0, 0.3294118, 1,
1.6515, -0.893537, 2.613049, 1, 0, 0.3254902, 1,
1.661873, -0.2906769, 0.3350647, 1, 0, 0.3176471, 1,
1.666826, 0.1550939, 0.9768991, 1, 0, 0.3137255, 1,
1.671804, -1.645773, 2.581955, 1, 0, 0.3058824, 1,
1.691332, 0.6030025, 2.26109, 1, 0, 0.2980392, 1,
1.718294, -0.8178885, 2.349418, 1, 0, 0.2941177, 1,
1.724115, 0.9157372, -1.281257, 1, 0, 0.2862745, 1,
1.727252, -0.3110071, 2.080793, 1, 0, 0.282353, 1,
1.728127, -1.731061, 2.336072, 1, 0, 0.2745098, 1,
1.74979, -0.3745555, 2.919709, 1, 0, 0.2705882, 1,
1.751327, -0.8666633, 0.824919, 1, 0, 0.2627451, 1,
1.751817, -2.218077, 2.804855, 1, 0, 0.2588235, 1,
1.758091, -1.398463, 1.556044, 1, 0, 0.2509804, 1,
1.758385, 2.470268, 0.9169706, 1, 0, 0.2470588, 1,
1.763397, -0.946683, 2.583897, 1, 0, 0.2392157, 1,
1.790542, 0.01225653, 0.0423339, 1, 0, 0.2352941, 1,
1.792225, 1.014974, 0.7370057, 1, 0, 0.227451, 1,
1.794901, 0.2222677, 2.210636, 1, 0, 0.2235294, 1,
1.806746, -1.114965, 1.437969, 1, 0, 0.2156863, 1,
1.842285, -0.8932197, 2.371624, 1, 0, 0.2117647, 1,
1.859203, 0.7242154, 0.8246658, 1, 0, 0.2039216, 1,
1.877831, 0.4950019, 1.712409, 1, 0, 0.1960784, 1,
1.891915, 0.6236321, -0.4999334, 1, 0, 0.1921569, 1,
1.892854, 1.294914, 1.657561, 1, 0, 0.1843137, 1,
1.895091, 0.6058562, 0.4797843, 1, 0, 0.1803922, 1,
1.896146, 1.091717, 0.1000924, 1, 0, 0.172549, 1,
1.911861, 0.1715419, 1.479069, 1, 0, 0.1686275, 1,
1.937751, -1.216829, 1.541108, 1, 0, 0.1607843, 1,
1.944375, -0.7375483, 1.399956, 1, 0, 0.1568628, 1,
1.978214, -1.98616, 0.675218, 1, 0, 0.1490196, 1,
1.990267, 0.5672576, 0.5042686, 1, 0, 0.145098, 1,
2.01787, -0.7671428, 3.636045, 1, 0, 0.1372549, 1,
2.054209, 0.5269996, 0.635882, 1, 0, 0.1333333, 1,
2.073639, -0.8737798, 1.431365, 1, 0, 0.1254902, 1,
2.086291, 0.6656896, 2.945891, 1, 0, 0.1215686, 1,
2.11049, -0.750061, 1.488969, 1, 0, 0.1137255, 1,
2.139401, 0.6704707, 1.932851, 1, 0, 0.1098039, 1,
2.154712, 0.9306895, 1.350852, 1, 0, 0.1019608, 1,
2.180598, 0.5416186, 0.9904032, 1, 0, 0.09411765, 1,
2.256095, 0.5206524, 1.046937, 1, 0, 0.09019608, 1,
2.267061, 0.1437152, 0.6256616, 1, 0, 0.08235294, 1,
2.26859, -0.2360829, 2.263327, 1, 0, 0.07843138, 1,
2.290508, 0.0331491, 0.8402575, 1, 0, 0.07058824, 1,
2.333307, 0.5926738, 1.741279, 1, 0, 0.06666667, 1,
2.377074, 0.07039697, 0.8353677, 1, 0, 0.05882353, 1,
2.421085, -0.4114302, 0.7491556, 1, 0, 0.05490196, 1,
2.550393, 0.3665522, 0.818898, 1, 0, 0.04705882, 1,
2.555253, -1.26996, 2.608946, 1, 0, 0.04313726, 1,
2.556861, 0.07185714, 1.845184, 1, 0, 0.03529412, 1,
2.656552, -0.07322603, 0.4150351, 1, 0, 0.03137255, 1,
2.695522, -0.2489267, 1.153345, 1, 0, 0.02352941, 1,
2.703281, 0.4958024, 0.4073943, 1, 0, 0.01960784, 1,
2.811578, -0.1204441, 3.954429, 1, 0, 0.01176471, 1,
3.00394, -0.9343598, 1.121167, 1, 0, 0.007843138, 1
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
-0.0524466, -4.103578, -6.864365, 0, -0.5, 0.5, 0.5,
-0.0524466, -4.103578, -6.864365, 1, -0.5, 0.5, 0.5,
-0.0524466, -4.103578, -6.864365, 1, 1.5, 0.5, 0.5,
-0.0524466, -4.103578, -6.864365, 0, 1.5, 0.5, 0.5
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
-4.144948, 0.01537561, -6.864365, 0, -0.5, 0.5, 0.5,
-4.144948, 0.01537561, -6.864365, 1, -0.5, 0.5, 0.5,
-4.144948, 0.01537561, -6.864365, 1, 1.5, 0.5, 0.5,
-4.144948, 0.01537561, -6.864365, 0, 1.5, 0.5, 0.5
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
-4.144948, -4.103578, 0.08720136, 0, -0.5, 0.5, 0.5,
-4.144948, -4.103578, 0.08720136, 1, -0.5, 0.5, 0.5,
-4.144948, -4.103578, 0.08720136, 1, 1.5, 0.5, 0.5,
-4.144948, -4.103578, 0.08720136, 0, 1.5, 0.5, 0.5
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
-3, -3.15305, -5.260157,
3, -3.15305, -5.260157,
-3, -3.15305, -5.260157,
-3, -3.311472, -5.527525,
-2, -3.15305, -5.260157,
-2, -3.311472, -5.527525,
-1, -3.15305, -5.260157,
-1, -3.311472, -5.527525,
0, -3.15305, -5.260157,
0, -3.311472, -5.527525,
1, -3.15305, -5.260157,
1, -3.311472, -5.527525,
2, -3.15305, -5.260157,
2, -3.311472, -5.527525,
3, -3.15305, -5.260157,
3, -3.311472, -5.527525
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
-3, -3.628314, -6.062261, 0, -0.5, 0.5, 0.5,
-3, -3.628314, -6.062261, 1, -0.5, 0.5, 0.5,
-3, -3.628314, -6.062261, 1, 1.5, 0.5, 0.5,
-3, -3.628314, -6.062261, 0, 1.5, 0.5, 0.5,
-2, -3.628314, -6.062261, 0, -0.5, 0.5, 0.5,
-2, -3.628314, -6.062261, 1, -0.5, 0.5, 0.5,
-2, -3.628314, -6.062261, 1, 1.5, 0.5, 0.5,
-2, -3.628314, -6.062261, 0, 1.5, 0.5, 0.5,
-1, -3.628314, -6.062261, 0, -0.5, 0.5, 0.5,
-1, -3.628314, -6.062261, 1, -0.5, 0.5, 0.5,
-1, -3.628314, -6.062261, 1, 1.5, 0.5, 0.5,
-1, -3.628314, -6.062261, 0, 1.5, 0.5, 0.5,
0, -3.628314, -6.062261, 0, -0.5, 0.5, 0.5,
0, -3.628314, -6.062261, 1, -0.5, 0.5, 0.5,
0, -3.628314, -6.062261, 1, 1.5, 0.5, 0.5,
0, -3.628314, -6.062261, 0, 1.5, 0.5, 0.5,
1, -3.628314, -6.062261, 0, -0.5, 0.5, 0.5,
1, -3.628314, -6.062261, 1, -0.5, 0.5, 0.5,
1, -3.628314, -6.062261, 1, 1.5, 0.5, 0.5,
1, -3.628314, -6.062261, 0, 1.5, 0.5, 0.5,
2, -3.628314, -6.062261, 0, -0.5, 0.5, 0.5,
2, -3.628314, -6.062261, 1, -0.5, 0.5, 0.5,
2, -3.628314, -6.062261, 1, 1.5, 0.5, 0.5,
2, -3.628314, -6.062261, 0, 1.5, 0.5, 0.5,
3, -3.628314, -6.062261, 0, -0.5, 0.5, 0.5,
3, -3.628314, -6.062261, 1, -0.5, 0.5, 0.5,
3, -3.628314, -6.062261, 1, 1.5, 0.5, 0.5,
3, -3.628314, -6.062261, 0, 1.5, 0.5, 0.5
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
-3.200525, -3, -5.260157,
-3.200525, 3, -5.260157,
-3.200525, -3, -5.260157,
-3.357929, -3, -5.527525,
-3.200525, -2, -5.260157,
-3.357929, -2, -5.527525,
-3.200525, -1, -5.260157,
-3.357929, -1, -5.527525,
-3.200525, 0, -5.260157,
-3.357929, 0, -5.527525,
-3.200525, 1, -5.260157,
-3.357929, 1, -5.527525,
-3.200525, 2, -5.260157,
-3.357929, 2, -5.527525,
-3.200525, 3, -5.260157,
-3.357929, 3, -5.527525
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
-3.672736, -3, -6.062261, 0, -0.5, 0.5, 0.5,
-3.672736, -3, -6.062261, 1, -0.5, 0.5, 0.5,
-3.672736, -3, -6.062261, 1, 1.5, 0.5, 0.5,
-3.672736, -3, -6.062261, 0, 1.5, 0.5, 0.5,
-3.672736, -2, -6.062261, 0, -0.5, 0.5, 0.5,
-3.672736, -2, -6.062261, 1, -0.5, 0.5, 0.5,
-3.672736, -2, -6.062261, 1, 1.5, 0.5, 0.5,
-3.672736, -2, -6.062261, 0, 1.5, 0.5, 0.5,
-3.672736, -1, -6.062261, 0, -0.5, 0.5, 0.5,
-3.672736, -1, -6.062261, 1, -0.5, 0.5, 0.5,
-3.672736, -1, -6.062261, 1, 1.5, 0.5, 0.5,
-3.672736, -1, -6.062261, 0, 1.5, 0.5, 0.5,
-3.672736, 0, -6.062261, 0, -0.5, 0.5, 0.5,
-3.672736, 0, -6.062261, 1, -0.5, 0.5, 0.5,
-3.672736, 0, -6.062261, 1, 1.5, 0.5, 0.5,
-3.672736, 0, -6.062261, 0, 1.5, 0.5, 0.5,
-3.672736, 1, -6.062261, 0, -0.5, 0.5, 0.5,
-3.672736, 1, -6.062261, 1, -0.5, 0.5, 0.5,
-3.672736, 1, -6.062261, 1, 1.5, 0.5, 0.5,
-3.672736, 1, -6.062261, 0, 1.5, 0.5, 0.5,
-3.672736, 2, -6.062261, 0, -0.5, 0.5, 0.5,
-3.672736, 2, -6.062261, 1, -0.5, 0.5, 0.5,
-3.672736, 2, -6.062261, 1, 1.5, 0.5, 0.5,
-3.672736, 2, -6.062261, 0, 1.5, 0.5, 0.5,
-3.672736, 3, -6.062261, 0, -0.5, 0.5, 0.5,
-3.672736, 3, -6.062261, 1, -0.5, 0.5, 0.5,
-3.672736, 3, -6.062261, 1, 1.5, 0.5, 0.5,
-3.672736, 3, -6.062261, 0, 1.5, 0.5, 0.5
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
-3.200525, -3.15305, -4,
-3.200525, -3.15305, 4,
-3.200525, -3.15305, -4,
-3.357929, -3.311472, -4,
-3.200525, -3.15305, -2,
-3.357929, -3.311472, -2,
-3.200525, -3.15305, 0,
-3.357929, -3.311472, 0,
-3.200525, -3.15305, 2,
-3.357929, -3.311472, 2,
-3.200525, -3.15305, 4,
-3.357929, -3.311472, 4
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
-3.672736, -3.628314, -4, 0, -0.5, 0.5, 0.5,
-3.672736, -3.628314, -4, 1, -0.5, 0.5, 0.5,
-3.672736, -3.628314, -4, 1, 1.5, 0.5, 0.5,
-3.672736, -3.628314, -4, 0, 1.5, 0.5, 0.5,
-3.672736, -3.628314, -2, 0, -0.5, 0.5, 0.5,
-3.672736, -3.628314, -2, 1, -0.5, 0.5, 0.5,
-3.672736, -3.628314, -2, 1, 1.5, 0.5, 0.5,
-3.672736, -3.628314, -2, 0, 1.5, 0.5, 0.5,
-3.672736, -3.628314, 0, 0, -0.5, 0.5, 0.5,
-3.672736, -3.628314, 0, 1, -0.5, 0.5, 0.5,
-3.672736, -3.628314, 0, 1, 1.5, 0.5, 0.5,
-3.672736, -3.628314, 0, 0, 1.5, 0.5, 0.5,
-3.672736, -3.628314, 2, 0, -0.5, 0.5, 0.5,
-3.672736, -3.628314, 2, 1, -0.5, 0.5, 0.5,
-3.672736, -3.628314, 2, 1, 1.5, 0.5, 0.5,
-3.672736, -3.628314, 2, 0, 1.5, 0.5, 0.5,
-3.672736, -3.628314, 4, 0, -0.5, 0.5, 0.5,
-3.672736, -3.628314, 4, 1, -0.5, 0.5, 0.5,
-3.672736, -3.628314, 4, 1, 1.5, 0.5, 0.5,
-3.672736, -3.628314, 4, 0, 1.5, 0.5, 0.5
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
-3.200525, -3.15305, -5.260157,
-3.200525, 3.183802, -5.260157,
-3.200525, -3.15305, 5.43456,
-3.200525, 3.183802, 5.43456,
-3.200525, -3.15305, -5.260157,
-3.200525, -3.15305, 5.43456,
-3.200525, 3.183802, -5.260157,
-3.200525, 3.183802, 5.43456,
-3.200525, -3.15305, -5.260157,
3.095631, -3.15305, -5.260157,
-3.200525, -3.15305, 5.43456,
3.095631, -3.15305, 5.43456,
-3.200525, 3.183802, -5.260157,
3.095631, 3.183802, -5.260157,
-3.200525, 3.183802, 5.43456,
3.095631, 3.183802, 5.43456,
3.095631, -3.15305, -5.260157,
3.095631, 3.183802, -5.260157,
3.095631, -3.15305, 5.43456,
3.095631, 3.183802, 5.43456,
3.095631, -3.15305, -5.260157,
3.095631, -3.15305, 5.43456,
3.095631, 3.183802, -5.260157,
3.095631, 3.183802, 5.43456
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
var radius = 7.440828;
var distance = 33.10509;
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
mvMatrix.translate( 0.0524466, -0.01537561, -0.08720136 );
mvMatrix.scale( 1.277791, 1.269585, 0.7522564 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.10509);
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
bifenazate<-read.table("bifenazate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bifenazate$V2
```

```
## Error in eval(expr, envir, enclos): object 'bifenazate' not found
```

```r
y<-bifenazate$V3
```

```
## Error in eval(expr, envir, enclos): object 'bifenazate' not found
```

```r
z<-bifenazate$V4
```

```
## Error in eval(expr, envir, enclos): object 'bifenazate' not found
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
-3.108833, 0.7291538, -1.697776, 0, 0, 1, 1, 1,
-2.834957, 0.1256841, -3.176182, 1, 0, 0, 1, 1,
-2.814629, 0.7357454, -0.8225463, 1, 0, 0, 1, 1,
-2.743873, 0.3757864, -1.625485, 1, 0, 0, 1, 1,
-2.739858, 0.1687295, -2.882309, 1, 0, 0, 1, 1,
-2.715892, 0.06938387, -3.070367, 1, 0, 0, 1, 1,
-2.494719, 0.4739646, -2.364868, 0, 0, 0, 1, 1,
-2.483998, 0.3135216, -1.078029, 0, 0, 0, 1, 1,
-2.44572, 0.1449089, 1.51937, 0, 0, 0, 1, 1,
-2.393967, -0.06635059, -2.805315, 0, 0, 0, 1, 1,
-2.38679, 0.03089244, -1.052915, 0, 0, 0, 1, 1,
-2.327236, 0.4094338, -0.9067911, 0, 0, 0, 1, 1,
-2.316129, 0.03640658, -1.719943, 0, 0, 0, 1, 1,
-2.304584, 0.7356283, -1.00169, 1, 1, 1, 1, 1,
-2.301147, 0.993497, -1.807344, 1, 1, 1, 1, 1,
-2.257622, 0.501371, -0.8348019, 1, 1, 1, 1, 1,
-2.229553, 0.02934507, -3.115119, 1, 1, 1, 1, 1,
-2.191514, 1.33407, -1.039515, 1, 1, 1, 1, 1,
-2.154103, -0.396115, -2.035875, 1, 1, 1, 1, 1,
-2.152829, -2.154644, -3.457306, 1, 1, 1, 1, 1,
-2.136802, 0.9396126, -2.378272, 1, 1, 1, 1, 1,
-2.122433, -0.6716989, -1.828425, 1, 1, 1, 1, 1,
-2.088848, -1.129787, -1.222687, 1, 1, 1, 1, 1,
-2.045043, 0.1906619, -2.223547, 1, 1, 1, 1, 1,
-1.996223, 0.3247932, -0.3263009, 1, 1, 1, 1, 1,
-1.977574, -1.328028, -2.268262, 1, 1, 1, 1, 1,
-1.953602, -0.2462362, -0.4385041, 1, 1, 1, 1, 1,
-1.932904, -0.8282929, -1.940657, 1, 1, 1, 1, 1,
-1.928849, 0.5208311, -3.127769, 0, 0, 1, 1, 1,
-1.904924, 2.447579, -1.257824, 1, 0, 0, 1, 1,
-1.894712, 1.195782, -0.8242113, 1, 0, 0, 1, 1,
-1.886878, 1.788764, -0.9718482, 1, 0, 0, 1, 1,
-1.88595, -0.3450559, -2.314593, 1, 0, 0, 1, 1,
-1.869987, 0.3274474, -1.475133, 1, 0, 0, 1, 1,
-1.849233, -0.607453, -2.257587, 0, 0, 0, 1, 1,
-1.845645, -0.7556543, -2.63632, 0, 0, 0, 1, 1,
-1.828736, -1.34947, -1.422735, 0, 0, 0, 1, 1,
-1.817162, -2.227509, -1.455498, 0, 0, 0, 1, 1,
-1.814152, -0.9475909, -1.829218, 0, 0, 0, 1, 1,
-1.810433, -0.8883851, -1.743388, 0, 0, 0, 1, 1,
-1.803304, -0.9601087, -5.016903, 0, 0, 0, 1, 1,
-1.80044, -1.528167, -2.544571, 1, 1, 1, 1, 1,
-1.783937, 0.9091244, -0.2423609, 1, 1, 1, 1, 1,
-1.783283, -0.2678225, -1.716661, 1, 1, 1, 1, 1,
-1.783059, -0.1055782, -0.1864464, 1, 1, 1, 1, 1,
-1.778674, 0.2348659, -0.1234716, 1, 1, 1, 1, 1,
-1.767715, 1.183034, -0.08048084, 1, 1, 1, 1, 1,
-1.76179, 1.192636, -2.707202, 1, 1, 1, 1, 1,
-1.733783, 0.9393912, -2.038855, 1, 1, 1, 1, 1,
-1.729861, -0.672819, -1.150687, 1, 1, 1, 1, 1,
-1.726398, 0.2788523, -0.06043263, 1, 1, 1, 1, 1,
-1.719268, -0.1785032, -1.373233, 1, 1, 1, 1, 1,
-1.712324, 0.54483, -0.6822219, 1, 1, 1, 1, 1,
-1.711466, 0.3360434, -0.6442292, 1, 1, 1, 1, 1,
-1.710626, -0.2704872, -0.0946045, 1, 1, 1, 1, 1,
-1.710305, -0.7965079, -1.834261, 1, 1, 1, 1, 1,
-1.704162, -1.326118, -1.795675, 0, 0, 1, 1, 1,
-1.703941, -0.3344374, -2.774607, 1, 0, 0, 1, 1,
-1.664958, -0.5542563, -2.259957, 1, 0, 0, 1, 1,
-1.655674, -1.308671, -3.759023, 1, 0, 0, 1, 1,
-1.634768, -0.7574229, -2.819261, 1, 0, 0, 1, 1,
-1.624308, -0.3828681, -2.020819, 1, 0, 0, 1, 1,
-1.611793, 0.7334793, -0.9549611, 0, 0, 0, 1, 1,
-1.5897, 0.5073167, -1.158552, 0, 0, 0, 1, 1,
-1.560752, -0.7363168, -2.82663, 0, 0, 0, 1, 1,
-1.555358, 0.05977885, -1.647147, 0, 0, 0, 1, 1,
-1.555044, 1.012979, -1.228967, 0, 0, 0, 1, 1,
-1.533121, -0.4550343, -0.8692059, 0, 0, 0, 1, 1,
-1.532295, -1.534292, -2.285779, 0, 0, 0, 1, 1,
-1.516946, 1.726941, -1.342788, 1, 1, 1, 1, 1,
-1.510813, -1.441463, -1.832687, 1, 1, 1, 1, 1,
-1.506319, -0.2564359, -1.113915, 1, 1, 1, 1, 1,
-1.490583, 2.908471, -1.72799, 1, 1, 1, 1, 1,
-1.484679, -0.5001393, -2.002254, 1, 1, 1, 1, 1,
-1.483823, -0.02191307, -1.144541, 1, 1, 1, 1, 1,
-1.475949, -2.117913, -0.1605373, 1, 1, 1, 1, 1,
-1.472265, -0.7772924, -3.442663, 1, 1, 1, 1, 1,
-1.466803, -1.945236, -3.125149, 1, 1, 1, 1, 1,
-1.465636, 1.107386, -0.3332972, 1, 1, 1, 1, 1,
-1.449593, -0.664535, -3.044011, 1, 1, 1, 1, 1,
-1.441581, 1.601114, 0.8570393, 1, 1, 1, 1, 1,
-1.431654, -0.2486147, -1.851118, 1, 1, 1, 1, 1,
-1.422433, -0.4767965, 0.04777274, 1, 1, 1, 1, 1,
-1.42211, 1.12532, -0.08929733, 1, 1, 1, 1, 1,
-1.421979, -1.718246, -1.194005, 0, 0, 1, 1, 1,
-1.418818, 0.2531971, -1.806207, 1, 0, 0, 1, 1,
-1.417038, -1.877195, -2.166208, 1, 0, 0, 1, 1,
-1.415912, -0.4063497, -2.417565, 1, 0, 0, 1, 1,
-1.410407, 0.5084745, -2.257189, 1, 0, 0, 1, 1,
-1.407937, 0.7504207, -1.163014, 1, 0, 0, 1, 1,
-1.406243, -0.4538392, -3.363214, 0, 0, 0, 1, 1,
-1.402327, 0.1159723, -0.3618123, 0, 0, 0, 1, 1,
-1.402078, 0.2488229, -2.074162, 0, 0, 0, 1, 1,
-1.394705, -0.1333219, -1.752888, 0, 0, 0, 1, 1,
-1.390294, 0.1537461, -0.2466576, 0, 0, 0, 1, 1,
-1.380958, 0.02915747, -0.1910933, 0, 0, 0, 1, 1,
-1.380766, 1.81692, 0.4977617, 0, 0, 0, 1, 1,
-1.365452, 0.9108056, -0.8025219, 1, 1, 1, 1, 1,
-1.355804, -0.01137628, -2.372836, 1, 1, 1, 1, 1,
-1.344879, 0.1491879, -1.603872, 1, 1, 1, 1, 1,
-1.340659, 1.616932, 0.1945787, 1, 1, 1, 1, 1,
-1.332212, 0.3978073, -0.3445182, 1, 1, 1, 1, 1,
-1.319298, 0.1640718, -0.9892963, 1, 1, 1, 1, 1,
-1.313194, -0.5055363, -1.563836, 1, 1, 1, 1, 1,
-1.312306, -0.5061147, -2.690485, 1, 1, 1, 1, 1,
-1.304774, -0.5649079, -0.8731416, 1, 1, 1, 1, 1,
-1.300561, -0.3788863, -0.5439268, 1, 1, 1, 1, 1,
-1.299273, 0.4219417, 0.4754979, 1, 1, 1, 1, 1,
-1.294957, 0.7654725, 0.5788187, 1, 1, 1, 1, 1,
-1.292987, 0.2151566, -2.337861, 1, 1, 1, 1, 1,
-1.28161, -1.309201, -3.038413, 1, 1, 1, 1, 1,
-1.28086, -0.4585127, -2.492975, 1, 1, 1, 1, 1,
-1.278933, 0.9949422, -2.082345, 0, 0, 1, 1, 1,
-1.278433, 1.047121, 0.2314676, 1, 0, 0, 1, 1,
-1.26893, 0.9604612, -1.533355, 1, 0, 0, 1, 1,
-1.266566, 3.091517, -0.8208285, 1, 0, 0, 1, 1,
-1.263951, -0.3528981, -2.157485, 1, 0, 0, 1, 1,
-1.260871, -2.486109, -2.393277, 1, 0, 0, 1, 1,
-1.25541, 0.8469864, -1.333086, 0, 0, 0, 1, 1,
-1.252295, 0.03703456, 0.451624, 0, 0, 0, 1, 1,
-1.245932, -0.4998447, 0.4098732, 0, 0, 0, 1, 1,
-1.242, -0.8993719, -3.135232, 0, 0, 0, 1, 1,
-1.241238, -0.2496158, -2.239262, 0, 0, 0, 1, 1,
-1.235991, 0.05482825, -0.7665107, 0, 0, 0, 1, 1,
-1.235346, -1.234075, -3.256401, 0, 0, 0, 1, 1,
-1.231312, 0.2914798, -2.282678, 1, 1, 1, 1, 1,
-1.224748, -1.971874, -3.052718, 1, 1, 1, 1, 1,
-1.21193, -0.6503989, -2.010809, 1, 1, 1, 1, 1,
-1.207426, 2.117673, -1.43941, 1, 1, 1, 1, 1,
-1.201114, -0.6679297, -1.69525, 1, 1, 1, 1, 1,
-1.188347, 0.707638, -0.6816424, 1, 1, 1, 1, 1,
-1.186489, -1.490068, -3.764271, 1, 1, 1, 1, 1,
-1.184002, 1.476225, -0.8378494, 1, 1, 1, 1, 1,
-1.18209, 1.452816, 0.1770283, 1, 1, 1, 1, 1,
-1.179642, 1.710815, -0.3093108, 1, 1, 1, 1, 1,
-1.17604, 1.143332, 1.124301, 1, 1, 1, 1, 1,
-1.174545, 0.5782451, -1.259974, 1, 1, 1, 1, 1,
-1.167467, -1.639496, -1.023306, 1, 1, 1, 1, 1,
-1.165735, 1.580996, -0.4391169, 1, 1, 1, 1, 1,
-1.163421, 0.967798, -2.259232, 1, 1, 1, 1, 1,
-1.154623, 1.958964, -1.003253, 0, 0, 1, 1, 1,
-1.150447, -0.1902356, -2.054373, 1, 0, 0, 1, 1,
-1.147595, 0.6129156, -1.544452, 1, 0, 0, 1, 1,
-1.146781, -2.423532, -2.919961, 1, 0, 0, 1, 1,
-1.125599, 1.198472, -2.042282, 1, 0, 0, 1, 1,
-1.10732, -1.365017, -2.7255, 1, 0, 0, 1, 1,
-1.087473, 0.8868402, 1.104221, 0, 0, 0, 1, 1,
-1.082129, -0.7104312, -1.106168, 0, 0, 0, 1, 1,
-1.073707, -0.1148994, -0.679732, 0, 0, 0, 1, 1,
-1.073343, -1.181747, -2.66608, 0, 0, 0, 1, 1,
-1.070228, -2.107484, -3.421046, 0, 0, 0, 1, 1,
-1.062527, 0.2874638, -2.076971, 0, 0, 0, 1, 1,
-1.05658, 2.00525, -0.08963916, 0, 0, 0, 1, 1,
-1.049948, 0.5250821, 0.007188442, 1, 1, 1, 1, 1,
-1.046498, 1.598937, -0.8163548, 1, 1, 1, 1, 1,
-1.04388, 0.984525, -1.46838, 1, 1, 1, 1, 1,
-1.040317, 0.3025052, -2.04221, 1, 1, 1, 1, 1,
-1.034485, 1.838026, -0.5808614, 1, 1, 1, 1, 1,
-1.032268, 0.1593306, -2.385674, 1, 1, 1, 1, 1,
-1.027069, -1.455991, -2.972948, 1, 1, 1, 1, 1,
-1.026087, 0.2514103, -1.371443, 1, 1, 1, 1, 1,
-1.025773, 0.1840225, 1.401052, 1, 1, 1, 1, 1,
-1.025111, 0.006192229, -2.89897, 1, 1, 1, 1, 1,
-1.023229, -0.4261047, -3.794478, 1, 1, 1, 1, 1,
-1.018961, 0.6447927, -0.7286009, 1, 1, 1, 1, 1,
-1.014676, 0.1554638, -1.795189, 1, 1, 1, 1, 1,
-1.014515, -0.1368506, -1.37913, 1, 1, 1, 1, 1,
-0.9997573, 2.268568, -0.2030863, 1, 1, 1, 1, 1,
-0.9936869, -0.1147449, -0.8871602, 0, 0, 1, 1, 1,
-0.983952, -0.280872, -2.939945, 1, 0, 0, 1, 1,
-0.9781091, -0.5918814, -2.072092, 1, 0, 0, 1, 1,
-0.9732853, -0.9823939, -1.430555, 1, 0, 0, 1, 1,
-0.9678633, 0.6225865, -0.4660942, 1, 0, 0, 1, 1,
-0.964294, -0.02243747, -2.211591, 1, 0, 0, 1, 1,
-0.9642347, -0.1498443, -1.305679, 0, 0, 0, 1, 1,
-0.9636323, 0.5808484, -0.8440502, 0, 0, 0, 1, 1,
-0.9510108, 0.3870705, -1.651694, 0, 0, 0, 1, 1,
-0.9470837, 0.4770344, -1.054166, 0, 0, 0, 1, 1,
-0.9381809, 0.4773504, -1.977221, 0, 0, 0, 1, 1,
-0.9312155, 0.4666114, 0.3124808, 0, 0, 0, 1, 1,
-0.9311221, 0.8810307, -1.98134, 0, 0, 0, 1, 1,
-0.9267588, -0.6980219, -2.189667, 1, 1, 1, 1, 1,
-0.9256936, 1.064909, 0.6577361, 1, 1, 1, 1, 1,
-0.9226062, 1.501154, 0.581254, 1, 1, 1, 1, 1,
-0.9223601, -0.06458044, -3.664097, 1, 1, 1, 1, 1,
-0.9190656, 1.20217, -1.529119, 1, 1, 1, 1, 1,
-0.9177212, -0.9703125, -1.169888, 1, 1, 1, 1, 1,
-0.9150599, 0.1735086, -0.1974276, 1, 1, 1, 1, 1,
-0.9063426, 0.4022293, -1.458272, 1, 1, 1, 1, 1,
-0.9010549, 0.9167406, -1.597769, 1, 1, 1, 1, 1,
-0.8993271, 0.06051578, -1.53772, 1, 1, 1, 1, 1,
-0.8981419, -0.8829935, -2.413662, 1, 1, 1, 1, 1,
-0.8966219, 0.4455511, -2.03455, 1, 1, 1, 1, 1,
-0.895266, -1.354237, -3.973253, 1, 1, 1, 1, 1,
-0.8901888, -1.175474, -3.900418, 1, 1, 1, 1, 1,
-0.8894805, -1.963309, -2.903238, 1, 1, 1, 1, 1,
-0.8846659, -0.6332179, -0.8688402, 0, 0, 1, 1, 1,
-0.879519, 1.090326, -0.6588438, 1, 0, 0, 1, 1,
-0.8775684, 2.530797, -0.2912662, 1, 0, 0, 1, 1,
-0.8769536, 0.05741144, -1.772162, 1, 0, 0, 1, 1,
-0.8735228, -0.5008398, -0.9563206, 1, 0, 0, 1, 1,
-0.8652639, -0.2776389, -1.438714, 1, 0, 0, 1, 1,
-0.8614834, -0.2063642, -1.794721, 0, 0, 0, 1, 1,
-0.8605278, 2.746691, -0.6571373, 0, 0, 0, 1, 1,
-0.8561906, 1.392669, -0.4571455, 0, 0, 0, 1, 1,
-0.8472132, -0.236989, -0.6899501, 0, 0, 0, 1, 1,
-0.8459083, 1.083157, -1.528108, 0, 0, 0, 1, 1,
-0.8433517, -1.151436, -1.895266, 0, 0, 0, 1, 1,
-0.8425114, -2.427877, -3.255182, 0, 0, 0, 1, 1,
-0.840328, 1.580746, -0.7556579, 1, 1, 1, 1, 1,
-0.8398171, 0.6851766, 0.3660575, 1, 1, 1, 1, 1,
-0.8391391, 0.4299804, -2.596849, 1, 1, 1, 1, 1,
-0.8379816, -0.3020117, -0.2521989, 1, 1, 1, 1, 1,
-0.8256296, 1.643788, -1.326826, 1, 1, 1, 1, 1,
-0.8248856, -0.5742041, -2.663168, 1, 1, 1, 1, 1,
-0.8248062, -0.4512081, -1.134091, 1, 1, 1, 1, 1,
-0.8163368, 1.237697, -0.4539083, 1, 1, 1, 1, 1,
-0.8159206, -0.1961415, -2.056823, 1, 1, 1, 1, 1,
-0.7985829, 0.6242938, -0.4486628, 1, 1, 1, 1, 1,
-0.7933165, 1.082233, -1.710906, 1, 1, 1, 1, 1,
-0.7929828, -0.8728815, -1.423719, 1, 1, 1, 1, 1,
-0.7927572, 1.339729, -1.275105, 1, 1, 1, 1, 1,
-0.7902401, 0.3962008, 0.167084, 1, 1, 1, 1, 1,
-0.7880998, -0.2719474, -2.003638, 1, 1, 1, 1, 1,
-0.783922, 0.1378287, -1.833834, 0, 0, 1, 1, 1,
-0.7834994, -0.7860993, -1.979226, 1, 0, 0, 1, 1,
-0.7818497, -1.034354, -3.078951, 1, 0, 0, 1, 1,
-0.7817619, 1.533034, 0.04100638, 1, 0, 0, 1, 1,
-0.7812148, 2.001042, -0.9197017, 1, 0, 0, 1, 1,
-0.7723305, -0.2439795, -1.960019, 1, 0, 0, 1, 1,
-0.764981, -1.986781, -3.481691, 0, 0, 0, 1, 1,
-0.761625, 1.749681, -0.04460809, 0, 0, 0, 1, 1,
-0.7545145, -1.990732, -3.409747, 0, 0, 0, 1, 1,
-0.7534621, -0.003804329, -1.704617, 0, 0, 0, 1, 1,
-0.7513769, -0.294227, -1.433781, 0, 0, 0, 1, 1,
-0.7498693, 1.017418, -1.001848, 0, 0, 0, 1, 1,
-0.7461617, -0.06389672, -0.3268673, 0, 0, 0, 1, 1,
-0.7366976, -0.646575, -0.2729835, 1, 1, 1, 1, 1,
-0.7337255, 0.8459751, -0.4109076, 1, 1, 1, 1, 1,
-0.7313547, -0.5583722, -1.417415, 1, 1, 1, 1, 1,
-0.7296435, 1.214946, -2.230105, 1, 1, 1, 1, 1,
-0.7246885, -0.04768516, -1.993172, 1, 1, 1, 1, 1,
-0.7228909, -0.920467, -1.893365, 1, 1, 1, 1, 1,
-0.7143556, 0.1480721, -0.5328804, 1, 1, 1, 1, 1,
-0.7135413, -0.293049, -0.8918368, 1, 1, 1, 1, 1,
-0.7116085, -0.5322959, -0.4039499, 1, 1, 1, 1, 1,
-0.7114049, 0.4598043, -2.352391, 1, 1, 1, 1, 1,
-0.7111103, -0.7860454, -2.464202, 1, 1, 1, 1, 1,
-0.7092856, -0.6639155, -3.217108, 1, 1, 1, 1, 1,
-0.7046816, -0.5142787, -2.379965, 1, 1, 1, 1, 1,
-0.7025459, -0.7604615, -2.713817, 1, 1, 1, 1, 1,
-0.6960453, -0.7467106, -2.589144, 1, 1, 1, 1, 1,
-0.6935903, -0.3819293, -0.9779977, 0, 0, 1, 1, 1,
-0.6931518, -0.8151806, -3.967453, 1, 0, 0, 1, 1,
-0.6924957, -0.5253409, -2.234334, 1, 0, 0, 1, 1,
-0.6909803, 0.4670712, -1.047678, 1, 0, 0, 1, 1,
-0.6880395, -0.6393843, -1.581594, 1, 0, 0, 1, 1,
-0.6879487, 0.0430771, -0.7589726, 1, 0, 0, 1, 1,
-0.6854903, -1.659872, -2.893224, 0, 0, 0, 1, 1,
-0.6821753, 1.065808, 1.219513, 0, 0, 0, 1, 1,
-0.6782921, 0.1357271, 0.097321, 0, 0, 0, 1, 1,
-0.6756487, 1.20239, -0.0552256, 0, 0, 0, 1, 1,
-0.6748711, 0.7806392, 0.3855815, 0, 0, 0, 1, 1,
-0.6714686, 0.07964468, -2.23649, 0, 0, 0, 1, 1,
-0.6704381, 0.7108798, -0.9921513, 0, 0, 0, 1, 1,
-0.6652644, 0.8081305, -0.5285619, 1, 1, 1, 1, 1,
-0.6633022, -0.2851337, -3.468351, 1, 1, 1, 1, 1,
-0.6583815, -0.07266644, -0.5996406, 1, 1, 1, 1, 1,
-0.6581067, -0.9124876, -2.503991, 1, 1, 1, 1, 1,
-0.6575984, -0.8794982, -1.619964, 1, 1, 1, 1, 1,
-0.6572788, -3.060766, -3.105694, 1, 1, 1, 1, 1,
-0.6534507, -0.9845914, -3.89151, 1, 1, 1, 1, 1,
-0.6526572, 0.5494487, -1.732657, 1, 1, 1, 1, 1,
-0.6495998, 1.57066, 1.824083, 1, 1, 1, 1, 1,
-0.6392649, 0.803538, -1.149381, 1, 1, 1, 1, 1,
-0.6310161, 1.993765, 1.60245, 1, 1, 1, 1, 1,
-0.6285528, 0.7715629, -0.1614945, 1, 1, 1, 1, 1,
-0.627123, 1.851673, 0.06773841, 1, 1, 1, 1, 1,
-0.624965, 0.952621, 1.208908, 1, 1, 1, 1, 1,
-0.624177, 0.644154, -1.642246, 1, 1, 1, 1, 1,
-0.6232413, 1.421545, -1.427518, 0, 0, 1, 1, 1,
-0.6218771, -0.5317335, -0.5327227, 1, 0, 0, 1, 1,
-0.6178438, 0.03400992, -1.705904, 1, 0, 0, 1, 1,
-0.616784, 1.350731, -1.724623, 1, 0, 0, 1, 1,
-0.6148072, -1.099587, -1.493935, 1, 0, 0, 1, 1,
-0.6147832, -2.279435, -1.193907, 1, 0, 0, 1, 1,
-0.6112988, 0.03939689, -1.388821, 0, 0, 0, 1, 1,
-0.6010525, -1.357177, -2.619186, 0, 0, 0, 1, 1,
-0.5923394, 0.1428387, -0.07691858, 0, 0, 0, 1, 1,
-0.5890419, 0.7614437, 0.8579761, 0, 0, 0, 1, 1,
-0.5880833, -0.495291, -3.373054, 0, 0, 0, 1, 1,
-0.5826095, 0.2915356, -3.27871, 0, 0, 0, 1, 1,
-0.5825094, -0.321387, -3.489215, 0, 0, 0, 1, 1,
-0.5822192, 1.005741, 0.2391092, 1, 1, 1, 1, 1,
-0.5801139, -0.4738858, -2.024944, 1, 1, 1, 1, 1,
-0.5800759, -0.6774002, -2.382183, 1, 1, 1, 1, 1,
-0.5620172, 2.366991, -1.26567, 1, 1, 1, 1, 1,
-0.5577254, -1.195265, -3.588552, 1, 1, 1, 1, 1,
-0.5577078, 0.04827385, -1.695029, 1, 1, 1, 1, 1,
-0.5479755, -1.231163, -3.893867, 1, 1, 1, 1, 1,
-0.5445523, -0.07602043, -2.158292, 1, 1, 1, 1, 1,
-0.543569, -0.9392646, -2.900043, 1, 1, 1, 1, 1,
-0.5393928, 0.9775483, -0.07237197, 1, 1, 1, 1, 1,
-0.5365059, -2.596309, -4.202931, 1, 1, 1, 1, 1,
-0.5335472, -1.243036, 0.08377887, 1, 1, 1, 1, 1,
-0.5298269, 1.334002, 0.4106128, 1, 1, 1, 1, 1,
-0.5205652, -1.799986, -2.925816, 1, 1, 1, 1, 1,
-0.52016, 0.9183462, 0.8899149, 1, 1, 1, 1, 1,
-0.5141165, -1.082027, -1.861342, 0, 0, 1, 1, 1,
-0.5034406, 0.5653729, 0.8237987, 1, 0, 0, 1, 1,
-0.5018589, -1.69769, -3.592963, 1, 0, 0, 1, 1,
-0.5006117, 0.06106343, -1.466928, 1, 0, 0, 1, 1,
-0.5003676, 1.828397, -1.690917, 1, 0, 0, 1, 1,
-0.4982086, 1.075, -0.691168, 1, 0, 0, 1, 1,
-0.4956422, -0.4107688, -2.332123, 0, 0, 0, 1, 1,
-0.4913824, -1.018543, -1.903057, 0, 0, 0, 1, 1,
-0.4906577, 0.3296775, -0.9743762, 0, 0, 0, 1, 1,
-0.4892197, -0.3356881, -2.824118, 0, 0, 0, 1, 1,
-0.4874132, 0.2764681, -1.258786, 0, 0, 0, 1, 1,
-0.4840016, -0.168943, -0.8732831, 0, 0, 0, 1, 1,
-0.4833935, 2.776206, -1.142573, 0, 0, 0, 1, 1,
-0.4832795, -1.141588, -2.74176, 1, 1, 1, 1, 1,
-0.4778292, -1.137428, -2.378986, 1, 1, 1, 1, 1,
-0.4776265, -0.4385491, -2.342244, 1, 1, 1, 1, 1,
-0.4759242, -0.7601529, -1.626608, 1, 1, 1, 1, 1,
-0.4757748, 0.1085976, -0.7178448, 1, 1, 1, 1, 1,
-0.4746757, 0.2594716, -1.887024, 1, 1, 1, 1, 1,
-0.4726173, 0.3927227, -0.01919985, 1, 1, 1, 1, 1,
-0.4615913, 0.1119024, -1.278301, 1, 1, 1, 1, 1,
-0.4598618, -0.1775571, -1.954028, 1, 1, 1, 1, 1,
-0.4523177, 0.8978917, -1.471831, 1, 1, 1, 1, 1,
-0.4503166, 0.1926235, 0.3532172, 1, 1, 1, 1, 1,
-0.4499836, 0.231733, -0.3670817, 1, 1, 1, 1, 1,
-0.4468993, 1.647922, -0.8245553, 1, 1, 1, 1, 1,
-0.44215, 1.920641, -0.2231204, 1, 1, 1, 1, 1,
-0.4369026, 0.3663389, -1.46275, 1, 1, 1, 1, 1,
-0.4362229, -0.7404318, -2.41238, 0, 0, 1, 1, 1,
-0.4328589, -0.2159308, -1.499236, 1, 0, 0, 1, 1,
-0.4294648, 1.829635, -0.2838559, 1, 0, 0, 1, 1,
-0.4287461, -1.626003, -4.34785, 1, 0, 0, 1, 1,
-0.4150026, 0.3318011, 0.05984608, 1, 0, 0, 1, 1,
-0.4133053, 0.5441688, -0.886632, 1, 0, 0, 1, 1,
-0.4053763, 0.6244766, -1.750863, 0, 0, 0, 1, 1,
-0.3998545, -0.08180748, -3.074808, 0, 0, 0, 1, 1,
-0.3987842, -0.1911985, -3.15861, 0, 0, 0, 1, 1,
-0.3983697, 0.2536227, -0.461891, 0, 0, 0, 1, 1,
-0.3968113, 0.9088176, -1.335124, 0, 0, 0, 1, 1,
-0.3940232, 0.9789621, -2.000676, 0, 0, 0, 1, 1,
-0.3896877, -0.5896463, -1.684807, 0, 0, 0, 1, 1,
-0.3856182, 1.472629, 1.187461, 1, 1, 1, 1, 1,
-0.3802163, -1.879399, -2.027778, 1, 1, 1, 1, 1,
-0.3778183, 0.2397329, -1.178926, 1, 1, 1, 1, 1,
-0.3766163, -0.3595626, -0.3218657, 1, 1, 1, 1, 1,
-0.3754749, 0.8361305, 0.749018, 1, 1, 1, 1, 1,
-0.3724431, -1.167396, -2.493199, 1, 1, 1, 1, 1,
-0.3715785, -1.115816, -2.42368, 1, 1, 1, 1, 1,
-0.3710963, -0.4834168, -2.143537, 1, 1, 1, 1, 1,
-0.3696921, 0.9779316, -0.470775, 1, 1, 1, 1, 1,
-0.3689592, 0.02745995, -1.46113, 1, 1, 1, 1, 1,
-0.3680504, 0.3071561, 0.3553002, 1, 1, 1, 1, 1,
-0.3608361, -0.9602752, -1.820455, 1, 1, 1, 1, 1,
-0.3498024, -0.9218337, -3.270125, 1, 1, 1, 1, 1,
-0.3464545, 2.381754, -1.758803, 1, 1, 1, 1, 1,
-0.3462683, 0.2811301, 0.26901, 1, 1, 1, 1, 1,
-0.3457777, 0.273466, 0.3373737, 0, 0, 1, 1, 1,
-0.3431441, 1.388201, 0.7935439, 1, 0, 0, 1, 1,
-0.3425976, -0.007557038, -2.091083, 1, 0, 0, 1, 1,
-0.3409331, -2.091802, -3.585194, 1, 0, 0, 1, 1,
-0.3380706, -0.8605474, -1.818228, 1, 0, 0, 1, 1,
-0.3308271, 0.2933868, -1.438766, 1, 0, 0, 1, 1,
-0.3301397, -2.038891, -2.513006, 0, 0, 0, 1, 1,
-0.3288768, 0.4376923, -2.06371, 0, 0, 0, 1, 1,
-0.3280436, 0.01583097, -2.587714, 0, 0, 0, 1, 1,
-0.3264709, -0.1992138, -2.326145, 0, 0, 0, 1, 1,
-0.3248477, 1.27358, -0.6575676, 0, 0, 0, 1, 1,
-0.3248151, -0.7329351, 0.2349105, 0, 0, 0, 1, 1,
-0.3220941, -1.426606, -2.250839, 0, 0, 0, 1, 1,
-0.3170169, -0.2715471, -1.077373, 1, 1, 1, 1, 1,
-0.3158019, 0.5178996, -0.3299021, 1, 1, 1, 1, 1,
-0.313312, -1.138017, -3.964043, 1, 1, 1, 1, 1,
-0.3123324, -1.087437, -2.696663, 1, 1, 1, 1, 1,
-0.3114987, -0.1836333, -4.352748, 1, 1, 1, 1, 1,
-0.3085492, -0.5060318, -1.245336, 1, 1, 1, 1, 1,
-0.3034576, 0.3120718, -1.778024, 1, 1, 1, 1, 1,
-0.301969, 0.6892537, -0.1713401, 1, 1, 1, 1, 1,
-0.2994556, -0.4307442, -2.211633, 1, 1, 1, 1, 1,
-0.2974054, -0.08098859, -1.367723, 1, 1, 1, 1, 1,
-0.2961696, -1.900025, -4.238008, 1, 1, 1, 1, 1,
-0.2949668, -0.04135229, -1.393171, 1, 1, 1, 1, 1,
-0.2916212, -1.205809, -3.002984, 1, 1, 1, 1, 1,
-0.2825338, 0.5753316, -0.1403058, 1, 1, 1, 1, 1,
-0.2807243, 0.5893008, -0.7263953, 1, 1, 1, 1, 1,
-0.2793665, -2.173713, -3.426466, 0, 0, 1, 1, 1,
-0.2774549, 1.189149, -0.8544241, 1, 0, 0, 1, 1,
-0.2765051, -0.5465748, -2.159822, 1, 0, 0, 1, 1,
-0.2747535, 0.07387023, -0.8340356, 1, 0, 0, 1, 1,
-0.2742263, 0.3399618, 1.366975, 1, 0, 0, 1, 1,
-0.2711761, -0.1820356, -2.69748, 1, 0, 0, 1, 1,
-0.2709489, 1.598438, -0.3007386, 0, 0, 0, 1, 1,
-0.2678953, 0.7606735, 0.4314674, 0, 0, 0, 1, 1,
-0.2643132, 2.446839, -0.09906048, 0, 0, 0, 1, 1,
-0.2630172, 1.454611, -1.347354, 0, 0, 0, 1, 1,
-0.2615916, -1.801119, -3.979733, 0, 0, 0, 1, 1,
-0.2615359, 0.7994511, 0.6067116, 0, 0, 0, 1, 1,
-0.2581255, -1.000025, -2.490459, 0, 0, 0, 1, 1,
-0.2575181, 0.08187958, 0.3583142, 1, 1, 1, 1, 1,
-0.2561578, 1.328428, -0.8003826, 1, 1, 1, 1, 1,
-0.2558228, 1.499164, -0.2870623, 1, 1, 1, 1, 1,
-0.2461138, -1.669038, -2.383827, 1, 1, 1, 1, 1,
-0.2455289, -0.2891751, -1.678894, 1, 1, 1, 1, 1,
-0.2449988, -0.08589178, -3.060419, 1, 1, 1, 1, 1,
-0.2395834, -0.613133, -1.3528, 1, 1, 1, 1, 1,
-0.2383989, 0.6802952, -1.112399, 1, 1, 1, 1, 1,
-0.2376303, 0.6492373, -2.364547, 1, 1, 1, 1, 1,
-0.2352068, -0.9389663, -2.931439, 1, 1, 1, 1, 1,
-0.2347802, -1.844737, -4.491727, 1, 1, 1, 1, 1,
-0.2310016, -1.163136, -3.322203, 1, 1, 1, 1, 1,
-0.2275784, -0.7235945, -5.08137, 1, 1, 1, 1, 1,
-0.2219353, -0.1438425, -3.182, 1, 1, 1, 1, 1,
-0.2216762, 0.9678255, 1.833192, 1, 1, 1, 1, 1,
-0.2204334, 1.113189, 0.04646351, 0, 0, 1, 1, 1,
-0.2193756, -0.09096079, -1.820632, 1, 0, 0, 1, 1,
-0.2115712, 0.8789088, 1.245811, 1, 0, 0, 1, 1,
-0.2084344, -0.4512978, -4.869476, 1, 0, 0, 1, 1,
-0.20822, 0.02238294, -1.730794, 1, 0, 0, 1, 1,
-0.2082114, 1.302741, -0.2141748, 1, 0, 0, 1, 1,
-0.202631, 0.1868008, -2.513436, 0, 0, 0, 1, 1,
-0.1957252, -1.463341, -3.525871, 0, 0, 0, 1, 1,
-0.1947699, -0.2255082, -2.498882, 0, 0, 0, 1, 1,
-0.1944463, 0.401792, -1.075837, 0, 0, 0, 1, 1,
-0.1925815, -0.2758377, -1.456461, 0, 0, 0, 1, 1,
-0.1868905, 0.058752, 0.02700768, 0, 0, 0, 1, 1,
-0.1861992, -0.3088508, -1.549686, 0, 0, 0, 1, 1,
-0.1846767, 0.6479474, -0.9991409, 1, 1, 1, 1, 1,
-0.1838741, 0.7237234, -0.8265669, 1, 1, 1, 1, 1,
-0.17837, 0.01200647, -0.7970157, 1, 1, 1, 1, 1,
-0.1689134, 0.9578415, -1.716497, 1, 1, 1, 1, 1,
-0.1644238, 0.1892761, -1.508184, 1, 1, 1, 1, 1,
-0.1614769, 1.99364, -2.344931, 1, 1, 1, 1, 1,
-0.1609108, 0.7671719, -0.5623078, 1, 1, 1, 1, 1,
-0.1590252, -0.5932099, -3.411108, 1, 1, 1, 1, 1,
-0.1546763, -0.6048959, -4.937164, 1, 1, 1, 1, 1,
-0.1523867, 2.463413, 1.153288, 1, 1, 1, 1, 1,
-0.1498721, -0.2190403, -3.954636, 1, 1, 1, 1, 1,
-0.1483894, -0.8269373, -3.844011, 1, 1, 1, 1, 1,
-0.1454963, -0.2984078, -3.292578, 1, 1, 1, 1, 1,
-0.1355052, -0.1481065, -1.870255, 1, 1, 1, 1, 1,
-0.131087, 0.3467046, -1.302139, 1, 1, 1, 1, 1,
-0.1282048, -0.01309969, -1.604768, 0, 0, 1, 1, 1,
-0.1249257, -0.0200283, -0.6687752, 1, 0, 0, 1, 1,
-0.1234128, 0.2018253, 0.498132, 1, 0, 0, 1, 1,
-0.1216785, -0.7063782, -3.402363, 1, 0, 0, 1, 1,
-0.1060554, 1.757983, 0.7121289, 1, 0, 0, 1, 1,
-0.1041352, -0.3732116, -2.50666, 1, 0, 0, 1, 1,
-0.09990154, -0.7708383, -2.915743, 0, 0, 0, 1, 1,
-0.0991075, -1.32928, -1.872361, 0, 0, 0, 1, 1,
-0.09266742, -1.381324, -1.886843, 0, 0, 0, 1, 1,
-0.08544105, -1.138509, -2.506476, 0, 0, 0, 1, 1,
-0.0800944, 2.472451, -0.4868828, 0, 0, 0, 1, 1,
-0.07998931, -1.515113, -4.724637, 0, 0, 0, 1, 1,
-0.07932798, -0.4729738, -5.104409, 0, 0, 0, 1, 1,
-0.07817077, -0.5183782, -2.448929, 1, 1, 1, 1, 1,
-0.07445086, -0.1745912, -3.790759, 1, 1, 1, 1, 1,
-0.07326309, -0.2217441, -1.868647, 1, 1, 1, 1, 1,
-0.07221863, -1.148222, -2.409795, 1, 1, 1, 1, 1,
-0.07139156, 1.420257, -1.29583, 1, 1, 1, 1, 1,
-0.06989385, 1.370144, -0.3711288, 1, 1, 1, 1, 1,
-0.06758489, -0.5926257, -3.568157, 1, 1, 1, 1, 1,
-0.06740446, -1.157939, -2.797874, 1, 1, 1, 1, 1,
-0.05886301, -1.532271, -4.084122, 1, 1, 1, 1, 1,
-0.05861403, -0.7084982, -1.785229, 1, 1, 1, 1, 1,
-0.0567164, -1.515004, -3.48598, 1, 1, 1, 1, 1,
-0.05631229, 1.40883, -0.07586682, 1, 1, 1, 1, 1,
-0.05580914, -0.3028634, -2.592018, 1, 1, 1, 1, 1,
-0.0519008, -0.7436358, -2.145631, 1, 1, 1, 1, 1,
-0.04945846, 0.392323, 0.1395813, 1, 1, 1, 1, 1,
-0.04714208, -1.803387, -3.501448, 0, 0, 1, 1, 1,
-0.04645041, -1.291408, -3.594408, 1, 0, 0, 1, 1,
-0.04549458, -1.531067, -4.662234, 1, 0, 0, 1, 1,
-0.04382631, -1.456165, -2.921372, 1, 0, 0, 1, 1,
-0.04260563, 1.0241, 0.6640177, 1, 0, 0, 1, 1,
-0.04239311, -0.3248054, -4.123767, 1, 0, 0, 1, 1,
-0.04174234, -0.4926729, -4.067009, 0, 0, 0, 1, 1,
-0.03643396, -0.4379977, -3.53994, 0, 0, 0, 1, 1,
-0.03419414, -1.08733, -3.697292, 0, 0, 0, 1, 1,
-0.02800054, -0.3659559, -1.843745, 0, 0, 0, 1, 1,
-0.02243571, -1.070677, -2.36317, 0, 0, 0, 1, 1,
-0.02148869, 1.23614, -1.370015, 0, 0, 0, 1, 1,
-0.02039048, -2.31467, -4.027534, 0, 0, 0, 1, 1,
-0.0163375, -1.925575, -2.556967, 1, 1, 1, 1, 1,
-0.01509409, -1.584741, -3.49322, 1, 1, 1, 1, 1,
-0.01394042, -0.06981119, -2.387133, 1, 1, 1, 1, 1,
-0.01103519, -0.101607, -2.200319, 1, 1, 1, 1, 1,
-0.0104727, 0.6092536, 1.189104, 1, 1, 1, 1, 1,
-0.000576237, 0.5875424, 0.8896571, 1, 1, 1, 1, 1,
-0.0004679713, 0.4081584, 0.1884896, 1, 1, 1, 1, 1,
0.0001088493, 0.6595061, -0.3087288, 1, 1, 1, 1, 1,
0.002065538, -0.4738441, 1.639318, 1, 1, 1, 1, 1,
0.002255174, 1.006402, -0.09229855, 1, 1, 1, 1, 1,
0.00506846, -0.3219956, 3.356867, 1, 1, 1, 1, 1,
0.006757773, 0.3938904, -0.8044571, 1, 1, 1, 1, 1,
0.009284849, 0.1684874, 0.5691594, 1, 1, 1, 1, 1,
0.01380708, -0.4895688, 3.518593, 1, 1, 1, 1, 1,
0.01526068, -0.6635572, 3.067525, 1, 1, 1, 1, 1,
0.01990626, -0.4302697, 2.11905, 0, 0, 1, 1, 1,
0.0281495, -0.3918177, 3.209333, 1, 0, 0, 1, 1,
0.02854205, -0.1323073, 3.087924, 1, 0, 0, 1, 1,
0.02868029, -1.016979, 2.884127, 1, 0, 0, 1, 1,
0.02880354, -1.853998, 4.14603, 1, 0, 0, 1, 1,
0.03318116, -1.012189, 3.585774, 1, 0, 0, 1, 1,
0.03511257, 0.6354558, -0.1630422, 0, 0, 0, 1, 1,
0.03540979, -1.008808, 3.992251, 0, 0, 0, 1, 1,
0.03547194, -1.512731, 2.745481, 0, 0, 0, 1, 1,
0.03744244, 0.3474108, -0.04457409, 0, 0, 0, 1, 1,
0.03956584, 0.2427744, 0.7807471, 0, 0, 0, 1, 1,
0.04431951, -0.5343688, 4.493876, 0, 0, 0, 1, 1,
0.04510758, -0.487972, 1.455733, 0, 0, 0, 1, 1,
0.04710037, -0.6377658, 3.287548, 1, 1, 1, 1, 1,
0.05119726, 1.424229, -0.4317487, 1, 1, 1, 1, 1,
0.05430957, 0.5443295, 1.575239, 1, 1, 1, 1, 1,
0.05626395, -0.4802853, 3.361111, 1, 1, 1, 1, 1,
0.06206005, 0.9172472, 0.313516, 1, 1, 1, 1, 1,
0.06225114, 0.6238615, 0.8437864, 1, 1, 1, 1, 1,
0.06301691, 1.209845, -0.0830963, 1, 1, 1, 1, 1,
0.07439043, -2.570911, 2.434703, 1, 1, 1, 1, 1,
0.07565764, 1.270453, -0.5069765, 1, 1, 1, 1, 1,
0.07611856, 0.4161714, -1.254357, 1, 1, 1, 1, 1,
0.07630183, 0.5285985, -0.2783974, 1, 1, 1, 1, 1,
0.07873026, 0.4958202, -0.2813783, 1, 1, 1, 1, 1,
0.08092458, 0.2880027, -0.1341494, 1, 1, 1, 1, 1,
0.08481633, 0.5627741, 0.7033709, 1, 1, 1, 1, 1,
0.0856353, -0.6777984, 2.682481, 1, 1, 1, 1, 1,
0.08587161, 0.4046793, 1.121035, 0, 0, 1, 1, 1,
0.0883558, -0.5030884, 2.705911, 1, 0, 0, 1, 1,
0.08904558, 0.39052, -1.412503, 1, 0, 0, 1, 1,
0.09028801, 0.7283212, 0.3702452, 1, 0, 0, 1, 1,
0.09333346, -0.2613806, 2.157642, 1, 0, 0, 1, 1,
0.09390937, 0.4286773, -0.5959563, 1, 0, 0, 1, 1,
0.09652714, 0.2039184, 1.335484, 0, 0, 0, 1, 1,
0.1017371, -0.8301482, 2.441954, 0, 0, 0, 1, 1,
0.1026912, 0.2016578, 1.050256, 0, 0, 0, 1, 1,
0.1028926, -0.8973392, 3.949193, 0, 0, 0, 1, 1,
0.1030658, 1.436607, 1.836214, 0, 0, 0, 1, 1,
0.1034438, -0.6184785, 2.100014, 0, 0, 0, 1, 1,
0.1047341, 0.3493174, -0.4224992, 0, 0, 0, 1, 1,
0.1052396, -0.9920514, 3.391641, 1, 1, 1, 1, 1,
0.1053019, 0.07766082, 1.14151, 1, 1, 1, 1, 1,
0.1066234, -2.228181, 5.278811, 1, 1, 1, 1, 1,
0.106963, -0.1365156, 2.269264, 1, 1, 1, 1, 1,
0.1080123, 1.382135, -0.1554058, 1, 1, 1, 1, 1,
0.1096312, -0.4810493, 4.183951, 1, 1, 1, 1, 1,
0.1139489, -0.6980006, 4.343609, 1, 1, 1, 1, 1,
0.117693, -0.626263, 2.893789, 1, 1, 1, 1, 1,
0.1206525, -1.690736, 2.552247, 1, 1, 1, 1, 1,
0.1210712, 0.7825775, 1.176378, 1, 1, 1, 1, 1,
0.1231826, -0.6833031, 2.887573, 1, 1, 1, 1, 1,
0.1257329, 0.1477438, 1.05178, 1, 1, 1, 1, 1,
0.1278477, -0.03438376, 1.665263, 1, 1, 1, 1, 1,
0.1335995, -0.6018823, 2.687832, 1, 1, 1, 1, 1,
0.136271, 1.238771, 0.5568398, 1, 1, 1, 1, 1,
0.1376305, -0.6986916, 3.443044, 0, 0, 1, 1, 1,
0.138883, -1.176489, 4.461321, 1, 0, 0, 1, 1,
0.1404673, 0.006983881, 0.7740473, 1, 0, 0, 1, 1,
0.1417086, -0.6405514, 2.35507, 1, 0, 0, 1, 1,
0.1444891, 1.038623, 0.9250124, 1, 0, 0, 1, 1,
0.1449783, 0.224405, 0.1215043, 1, 0, 0, 1, 1,
0.1467588, -0.3973787, 3.407618, 0, 0, 0, 1, 1,
0.1469933, -0.8357382, 2.813572, 0, 0, 0, 1, 1,
0.1473532, 1.450158, 0.09032664, 0, 0, 0, 1, 1,
0.1484207, -1.534428, 2.820986, 0, 0, 0, 1, 1,
0.1575411, -1.331636, 2.859774, 0, 0, 0, 1, 1,
0.1582804, -0.2154196, 2.964797, 0, 0, 0, 1, 1,
0.1612369, 0.8977679, 1.333352, 0, 0, 0, 1, 1,
0.1617479, -0.08708573, 1.414821, 1, 1, 1, 1, 1,
0.1635407, -0.285207, 2.671594, 1, 1, 1, 1, 1,
0.1643934, 0.8112441, -0.5198088, 1, 1, 1, 1, 1,
0.1687583, -0.2028627, 0.7377865, 1, 1, 1, 1, 1,
0.1741, -0.6807829, 3.960552, 1, 1, 1, 1, 1,
0.1762696, 0.4747505, 1.410383, 1, 1, 1, 1, 1,
0.1855035, 0.1361519, 2.503606, 1, 1, 1, 1, 1,
0.1862122, -1.339252, 2.595264, 1, 1, 1, 1, 1,
0.1908606, 0.9683912, 0.4218771, 1, 1, 1, 1, 1,
0.1940417, 0.09844275, 0.4487575, 1, 1, 1, 1, 1,
0.201725, 0.1899493, 1.761341, 1, 1, 1, 1, 1,
0.2066209, 0.5296447, 1.932428, 1, 1, 1, 1, 1,
0.2088732, -0.1961816, 1.213041, 1, 1, 1, 1, 1,
0.2146151, 0.3912467, 1.268806, 1, 1, 1, 1, 1,
0.2185304, 0.06151155, 2.384664, 1, 1, 1, 1, 1,
0.2193861, 0.1822599, 0.9169917, 0, 0, 1, 1, 1,
0.2196849, -0.5334084, 2.622669, 1, 0, 0, 1, 1,
0.220529, 2.533346, 1.260064, 1, 0, 0, 1, 1,
0.2208875, 1.046671, -0.4707924, 1, 0, 0, 1, 1,
0.2245794, -0.4817178, 1.483683, 1, 0, 0, 1, 1,
0.2247364, -1.982028, 2.715277, 1, 0, 0, 1, 1,
0.2278703, 0.5154675, 0.5469646, 0, 0, 0, 1, 1,
0.2338923, 0.8248078, -1.606743, 0, 0, 0, 1, 1,
0.2381844, 0.08889134, 0.5354978, 0, 0, 0, 1, 1,
0.2397322, 0.8017525, -0.7129304, 0, 0, 0, 1, 1,
0.2440631, -0.2545734, 2.886522, 0, 0, 0, 1, 1,
0.2465627, 0.570661, 2.266429, 0, 0, 0, 1, 1,
0.2519884, -0.6506352, 3.785069, 0, 0, 0, 1, 1,
0.2531031, -0.7599939, 3.445716, 1, 1, 1, 1, 1,
0.2590826, 2.303176, -0.09596145, 1, 1, 1, 1, 1,
0.2623917, 0.1206201, 1.062255, 1, 1, 1, 1, 1,
0.2625917, -0.09835222, 1.579661, 1, 1, 1, 1, 1,
0.2652825, -0.4889701, 2.114267, 1, 1, 1, 1, 1,
0.2680224, -0.06306519, 2.761348, 1, 1, 1, 1, 1,
0.2680239, 1.326303, 0.5333017, 1, 1, 1, 1, 1,
0.2761517, -0.2846479, 2.65543, 1, 1, 1, 1, 1,
0.276689, -0.4736567, 3.257672, 1, 1, 1, 1, 1,
0.2768734, 1.2711, 0.7732026, 1, 1, 1, 1, 1,
0.2795559, -0.6459018, 1.617638, 1, 1, 1, 1, 1,
0.2799343, 0.8711989, 1.421314, 1, 1, 1, 1, 1,
0.2813206, 0.03577567, 2.270957, 1, 1, 1, 1, 1,
0.2822907, -1.295727, 4.584793, 1, 1, 1, 1, 1,
0.2836868, 0.2914219, 0.238625, 1, 1, 1, 1, 1,
0.2877336, 0.5114754, -0.8144435, 0, 0, 1, 1, 1,
0.2900174, 0.8264527, 0.8986626, 1, 0, 0, 1, 1,
0.2919734, 0.632834, 0.4608672, 1, 0, 0, 1, 1,
0.292493, -0.3691343, 1.799522, 1, 0, 0, 1, 1,
0.2929566, -0.2296241, 3.147275, 1, 0, 0, 1, 1,
0.2979784, 0.6068578, 1.35528, 1, 0, 0, 1, 1,
0.3004201, -0.5082564, 2.432746, 0, 0, 0, 1, 1,
0.3008898, -1.455948, 4.726387, 0, 0, 0, 1, 1,
0.3015411, -0.3036732, 0.745105, 0, 0, 0, 1, 1,
0.3051542, 0.7170693, 0.9714354, 0, 0, 0, 1, 1,
0.3054391, -0.5555313, 0.7998528, 0, 0, 0, 1, 1,
0.3118235, -0.5504047, 3.209723, 0, 0, 0, 1, 1,
0.3125219, -0.04709131, -0.0113762, 0, 0, 0, 1, 1,
0.3188454, 0.3985126, 0.3677071, 1, 1, 1, 1, 1,
0.3208721, 1.199193, 1.143816, 1, 1, 1, 1, 1,
0.3257819, -0.3974581, 4.231502, 1, 1, 1, 1, 1,
0.3291104, 1.283188, 1.158146, 1, 1, 1, 1, 1,
0.3305811, -0.3537207, 2.271443, 1, 1, 1, 1, 1,
0.3317766, 0.6774755, -0.4710144, 1, 1, 1, 1, 1,
0.3331839, -0.2077292, 1.457243, 1, 1, 1, 1, 1,
0.3332177, 0.1808256, 0.2295783, 1, 1, 1, 1, 1,
0.3408796, -0.7240605, 3.130883, 1, 1, 1, 1, 1,
0.3438041, 0.8442342, 1.195757, 1, 1, 1, 1, 1,
0.3453621, -2.142501, 4.12965, 1, 1, 1, 1, 1,
0.3506617, 0.695036, 1.32399, 1, 1, 1, 1, 1,
0.3544104, -0.8360561, 5.056566, 1, 1, 1, 1, 1,
0.3550984, -0.0125656, 1.476807, 1, 1, 1, 1, 1,
0.3572244, -0.5434055, 3.00013, 1, 1, 1, 1, 1,
0.3595136, 1.015604, 0.9598038, 0, 0, 1, 1, 1,
0.3603308, 0.8598893, 0.6905139, 1, 0, 0, 1, 1,
0.3639543, -0.7968276, 2.673829, 1, 0, 0, 1, 1,
0.3748169, -1.152652, 0.7562048, 1, 0, 0, 1, 1,
0.3760261, 1.636098, 0.1538126, 1, 0, 0, 1, 1,
0.3761972, 0.150772, 0.8398952, 1, 0, 0, 1, 1,
0.376234, -0.5912922, 2.108744, 0, 0, 0, 1, 1,
0.3767116, -0.906608, 2.135295, 0, 0, 0, 1, 1,
0.3796134, 0.6545129, 0.01596874, 0, 0, 0, 1, 1,
0.3820988, -0.8282341, 2.32919, 0, 0, 0, 1, 1,
0.3869964, 0.343431, 2.202758, 0, 0, 0, 1, 1,
0.3923621, -1.351192, 1.729167, 0, 0, 0, 1, 1,
0.3925115, 0.6931064, 0.427417, 0, 0, 0, 1, 1,
0.3933337, -0.08898568, 0.6093692, 1, 1, 1, 1, 1,
0.3984451, 0.1650539, 1.413495, 1, 1, 1, 1, 1,
0.3987142, -1.613222, 2.318747, 1, 1, 1, 1, 1,
0.402422, 0.04171618, 0.7696028, 1, 1, 1, 1, 1,
0.4062443, -0.2518832, 2.520548, 1, 1, 1, 1, 1,
0.4067959, -1.498549, 3.652544, 1, 1, 1, 1, 1,
0.4134874, 0.4621179, -0.4064275, 1, 1, 1, 1, 1,
0.4157204, -0.05627827, 1.396522, 1, 1, 1, 1, 1,
0.4192722, -0.3628981, 1.870378, 1, 1, 1, 1, 1,
0.4212114, 0.3491674, 1.303176, 1, 1, 1, 1, 1,
0.4215286, -1.411228, 3.153183, 1, 1, 1, 1, 1,
0.4219569, 0.3241165, 1.119224, 1, 1, 1, 1, 1,
0.4240728, 0.8033406, 0.9898499, 1, 1, 1, 1, 1,
0.4282594, 2.022584, 1.449059, 1, 1, 1, 1, 1,
0.4319502, -1.044503, 0.4374381, 1, 1, 1, 1, 1,
0.4345032, 1.845685, -0.3672986, 0, 0, 1, 1, 1,
0.4382732, 1.567242, 0.5144764, 1, 0, 0, 1, 1,
0.4392325, -0.300345, 2.860478, 1, 0, 0, 1, 1,
0.4401335, 1.375369, 1.480889, 1, 0, 0, 1, 1,
0.4513246, -0.7102562, 1.820623, 1, 0, 0, 1, 1,
0.4535499, -1.228309, 3.093852, 1, 0, 0, 1, 1,
0.458345, -0.8826362, 2.033787, 0, 0, 0, 1, 1,
0.459026, -0.2432717, 2.054016, 0, 0, 0, 1, 1,
0.4598875, -0.05088326, 2.752138, 0, 0, 0, 1, 1,
0.4616938, 0.7260658, 0.6385469, 0, 0, 0, 1, 1,
0.4646702, 0.373534, 2.150704, 0, 0, 0, 1, 1,
0.473874, -1.523665, 2.18359, 0, 0, 0, 1, 1,
0.4799829, -0.3132388, 4.163518, 0, 0, 0, 1, 1,
0.4820255, 1.250257, 0.9835253, 1, 1, 1, 1, 1,
0.4831281, 0.2925912, 0.100975, 1, 1, 1, 1, 1,
0.4912449, -0.5611151, 4.045113, 1, 1, 1, 1, 1,
0.4939353, 0.3865381, 1.937305, 1, 1, 1, 1, 1,
0.4998855, -0.23894, 2.614407, 1, 1, 1, 1, 1,
0.5023115, -0.1390776, 0.3482337, 1, 1, 1, 1, 1,
0.5052644, -0.4587975, 1.808835, 1, 1, 1, 1, 1,
0.5084265, -0.664445, 2.56548, 1, 1, 1, 1, 1,
0.5093132, -0.7383583, 2.665949, 1, 1, 1, 1, 1,
0.5142793, -0.1601928, 0.5493202, 1, 1, 1, 1, 1,
0.5154843, 1.09303, 1.855818, 1, 1, 1, 1, 1,
0.5166789, -0.6254999, 2.848463, 1, 1, 1, 1, 1,
0.518993, -1.276147, 3.387589, 1, 1, 1, 1, 1,
0.5205608, -0.3426218, 2.178889, 1, 1, 1, 1, 1,
0.524278, 2.161322, 0.2106914, 1, 1, 1, 1, 1,
0.5255198, -1.292471, 3.202482, 0, 0, 1, 1, 1,
0.5338288, -1.039181, 3.268134, 1, 0, 0, 1, 1,
0.5371541, -1.067516, 3.541597, 1, 0, 0, 1, 1,
0.5379453, 0.06621882, 2.735249, 1, 0, 0, 1, 1,
0.5400187, -0.4378812, 2.311607, 1, 0, 0, 1, 1,
0.5468422, -0.7966516, 2.252906, 1, 0, 0, 1, 1,
0.5516325, 0.4226151, 1.541666, 0, 0, 0, 1, 1,
0.5523238, 0.02705573, 2.095035, 0, 0, 0, 1, 1,
0.5525382, -0.3982462, 1.533961, 0, 0, 0, 1, 1,
0.5540189, 0.3176848, -0.9510231, 0, 0, 0, 1, 1,
0.5605311, -0.09384099, 2.389759, 0, 0, 0, 1, 1,
0.5607677, -0.432935, 1.792331, 0, 0, 0, 1, 1,
0.5610406, 2.249496, -0.5886882, 0, 0, 0, 1, 1,
0.5634115, 1.238299, 1.10457, 1, 1, 1, 1, 1,
0.5666565, 0.2407949, 0.9702103, 1, 1, 1, 1, 1,
0.5693852, 0.2012778, 0.9593582, 1, 1, 1, 1, 1,
0.5697276, 0.5898049, -0.5525003, 1, 1, 1, 1, 1,
0.5699709, -1.403017, 2.088104, 1, 1, 1, 1, 1,
0.5701271, -0.3662461, 2.871313, 1, 1, 1, 1, 1,
0.5712936, -0.9850917, 2.919313, 1, 1, 1, 1, 1,
0.5783559, -0.3156607, 1.277247, 1, 1, 1, 1, 1,
0.5785695, -1.982021, 2.824316, 1, 1, 1, 1, 1,
0.5813155, 0.5289114, 2.85691, 1, 1, 1, 1, 1,
0.5842683, 0.6213363, 0.7616836, 1, 1, 1, 1, 1,
0.5851923, -0.5886314, 1.330875, 1, 1, 1, 1, 1,
0.5872254, 1.256487, 0.4163137, 1, 1, 1, 1, 1,
0.593617, -1.062833, 2.339192, 1, 1, 1, 1, 1,
0.599372, 0.8219203, 0.9029484, 1, 1, 1, 1, 1,
0.6038443, 0.1198758, 1.008148, 0, 0, 1, 1, 1,
0.6065203, -0.8151681, 2.980556, 1, 0, 0, 1, 1,
0.6078051, 0.7307593, 1.006694, 1, 0, 0, 1, 1,
0.6086521, 0.357533, 0.7542116, 1, 0, 0, 1, 1,
0.611495, -0.7930689, 2.603822, 1, 0, 0, 1, 1,
0.6194308, -0.3801513, 2.431958, 1, 0, 0, 1, 1,
0.6241274, -0.5048891, 2.894058, 0, 0, 0, 1, 1,
0.6246253, 0.5485114, 1.931943, 0, 0, 0, 1, 1,
0.6250063, -0.2715918, 2.037026, 0, 0, 0, 1, 1,
0.6295121, 1.317023, 0.2005029, 0, 0, 0, 1, 1,
0.6349841, 1.022786, 1.913797, 0, 0, 0, 1, 1,
0.6350275, -1.359672, 3.555681, 0, 0, 0, 1, 1,
0.6351081, 1.539781, -0.007460378, 0, 0, 0, 1, 1,
0.6383589, -1.012607, 3.272984, 1, 1, 1, 1, 1,
0.6480453, 0.7885851, 1.141954, 1, 1, 1, 1, 1,
0.6482561, -1.203551, 4.251183, 1, 1, 1, 1, 1,
0.6487705, -1.329902, 2.593146, 1, 1, 1, 1, 1,
0.6565719, 0.4782002, -0.3843296, 1, 1, 1, 1, 1,
0.6573074, -0.7964624, 3.167295, 1, 1, 1, 1, 1,
0.6713502, -0.1999276, 2.286057, 1, 1, 1, 1, 1,
0.6716698, -1.881166, 4.372716, 1, 1, 1, 1, 1,
0.6758847, -0.6291798, 0.4823619, 1, 1, 1, 1, 1,
0.677558, 1.416432, 0.850105, 1, 1, 1, 1, 1,
0.6778079, 0.7782954, -0.1924007, 1, 1, 1, 1, 1,
0.6816533, 0.572154, 2.938794, 1, 1, 1, 1, 1,
0.6847386, -1.000911, 2.525578, 1, 1, 1, 1, 1,
0.6974972, 0.008149271, 0.2655258, 1, 1, 1, 1, 1,
0.6977494, -0.5020813, 2.314659, 1, 1, 1, 1, 1,
0.6978589, 0.1075009, 1.37654, 0, 0, 1, 1, 1,
0.7027531, 0.4904541, 1.413261, 1, 0, 0, 1, 1,
0.7047274, -0.2262188, 1.477692, 1, 0, 0, 1, 1,
0.705585, 1.132706, 0.7807641, 1, 0, 0, 1, 1,
0.7091339, -0.2735073, 2.733844, 1, 0, 0, 1, 1,
0.7114793, 0.2473124, 2.622437, 1, 0, 0, 1, 1,
0.7153506, 1.094652, 0.8110823, 0, 0, 0, 1, 1,
0.7165361, 0.377806, 1.466842, 0, 0, 0, 1, 1,
0.7203389, -0.3206143, 2.172274, 0, 0, 0, 1, 1,
0.7212797, -0.5733328, 2.237078, 0, 0, 0, 1, 1,
0.7235458, 0.01354966, 1.799982, 0, 0, 0, 1, 1,
0.7326915, 0.1128249, -0.200196, 0, 0, 0, 1, 1,
0.7338265, -1.151664, 3.395646, 0, 0, 0, 1, 1,
0.7401211, 0.2299756, 0.9036467, 1, 1, 1, 1, 1,
0.7408902, -0.4294713, 0.7866236, 1, 1, 1, 1, 1,
0.7413242, 0.3131705, 0.1352654, 1, 1, 1, 1, 1,
0.742952, -0.4364393, 2.789453, 1, 1, 1, 1, 1,
0.7494501, -0.3279337, 1.79015, 1, 1, 1, 1, 1,
0.7512769, -1.284301, 2.138913, 1, 1, 1, 1, 1,
0.753602, -0.2196472, 2.872863, 1, 1, 1, 1, 1,
0.7549251, 0.6587257, 3.983984, 1, 1, 1, 1, 1,
0.7558476, 0.02232367, 1.876742, 1, 1, 1, 1, 1,
0.7562431, -1.059519, 1.427803, 1, 1, 1, 1, 1,
0.7601167, -0.2652009, 2.448492, 1, 1, 1, 1, 1,
0.7625619, 1.786176, 1.289171, 1, 1, 1, 1, 1,
0.7647904, -0.05309719, 2.475755, 1, 1, 1, 1, 1,
0.7662961, 0.7414365, 1.913796, 1, 1, 1, 1, 1,
0.7670116, -0.4793758, 3.98139, 1, 1, 1, 1, 1,
0.7696404, -1.142918, 2.681431, 0, 0, 1, 1, 1,
0.7709457, 0.126221, 2.148828, 1, 0, 0, 1, 1,
0.7736876, -0.8387679, 2.338388, 1, 0, 0, 1, 1,
0.7769704, 0.865508, 0.4758567, 1, 0, 0, 1, 1,
0.7775458, 1.062669, 0.4831411, 1, 0, 0, 1, 1,
0.7896891, -1.130968, 1.284962, 1, 0, 0, 1, 1,
0.7930056, -0.1165859, 2.4439, 0, 0, 0, 1, 1,
0.8036449, 0.2216321, 2.216141, 0, 0, 0, 1, 1,
0.8053463, -0.3240703, 1.107844, 0, 0, 0, 1, 1,
0.8056996, 0.1544352, 1.506044, 0, 0, 0, 1, 1,
0.806484, -0.8738056, 2.891759, 0, 0, 0, 1, 1,
0.8071023, 0.3699369, 1.108941, 0, 0, 0, 1, 1,
0.8090466, -1.041608, 2.556635, 0, 0, 0, 1, 1,
0.8134246, -0.1195853, 1.225671, 1, 1, 1, 1, 1,
0.8134266, 1.0322, -0.602703, 1, 1, 1, 1, 1,
0.816807, -0.6006098, 3.331212, 1, 1, 1, 1, 1,
0.8172345, 1.021608, 1.929494, 1, 1, 1, 1, 1,
0.8213749, 0.7528496, 0.7816606, 1, 1, 1, 1, 1,
0.8263875, -0.08223014, 1.761849, 1, 1, 1, 1, 1,
0.8265152, 0.3302425, 2.438686, 1, 1, 1, 1, 1,
0.8298827, -2.054274, 1.686294, 1, 1, 1, 1, 1,
0.8301665, 1.114701, 1.340684, 1, 1, 1, 1, 1,
0.8401436, 0.6567034, 0.9696446, 1, 1, 1, 1, 1,
0.8401456, 0.8229649, 2.022716, 1, 1, 1, 1, 1,
0.8463169, 0.8203999, -0.4071446, 1, 1, 1, 1, 1,
0.8488495, -0.65435, 3.237504, 1, 1, 1, 1, 1,
0.8490735, 0.7490357, -0.1523111, 1, 1, 1, 1, 1,
0.8600455, -1.665967, 2.688879, 1, 1, 1, 1, 1,
0.8616711, -1.026102, 1.966678, 0, 0, 1, 1, 1,
0.8618708, 0.3953885, 0.1787959, 1, 0, 0, 1, 1,
0.8643463, -0.1720512, 2.324737, 1, 0, 0, 1, 1,
0.8648639, 0.4212876, 0.9369883, 1, 0, 0, 1, 1,
0.8659792, 0.3883705, 2.668063, 1, 0, 0, 1, 1,
0.8689628, -0.898007, 2.044974, 1, 0, 0, 1, 1,
0.8762025, -0.00368602, 0.4644235, 0, 0, 0, 1, 1,
0.8882953, -0.6693961, 2.59955, 0, 0, 0, 1, 1,
0.8925132, -0.09715325, 1.190719, 0, 0, 0, 1, 1,
0.8940873, -1.188768, 3.229907, 0, 0, 0, 1, 1,
0.8944842, 2.3531, 0.4227594, 0, 0, 0, 1, 1,
0.8956668, -0.4151468, 2.776918, 0, 0, 0, 1, 1,
0.9001605, -0.0553777, 1.402231, 0, 0, 0, 1, 1,
0.9005994, 1.010854, 2.335454, 1, 1, 1, 1, 1,
0.906414, 1.52286, -0.9880474, 1, 1, 1, 1, 1,
0.9095598, -0.2209809, 1.268806, 1, 1, 1, 1, 1,
0.9185193, 0.5216064, -0.4823643, 1, 1, 1, 1, 1,
0.9237859, 0.3596225, 2.031358, 1, 1, 1, 1, 1,
0.9301139, 0.2366113, 1.1862, 1, 1, 1, 1, 1,
0.9372464, 0.6277925, 0.7487602, 1, 1, 1, 1, 1,
0.941411, 0.3572579, 1.737976, 1, 1, 1, 1, 1,
0.9455487, -0.3283091, 1.556409, 1, 1, 1, 1, 1,
0.9475763, -0.8270792, 3.800661, 1, 1, 1, 1, 1,
0.9499747, -0.414174, 0.5621167, 1, 1, 1, 1, 1,
0.952702, 0.5794538, 2.508707, 1, 1, 1, 1, 1,
0.9609494, 0.1712252, 4.212578, 1, 1, 1, 1, 1,
0.9615692, 2.50147, 1.356196, 1, 1, 1, 1, 1,
0.9677887, 1.875926, 1.627239, 1, 1, 1, 1, 1,
0.9809239, -0.08096714, 1.730036, 0, 0, 1, 1, 1,
0.9829591, -1.361298, 2.032919, 1, 0, 0, 1, 1,
0.9829798, 0.01959966, 2.246044, 1, 0, 0, 1, 1,
0.9884463, -0.9423537, 2.433456, 1, 0, 0, 1, 1,
0.9891209, -0.3582232, 1.014658, 1, 0, 0, 1, 1,
0.9947914, 0.3899978, 0.1532995, 1, 0, 0, 1, 1,
0.9956929, 0.101633, 2.410261, 0, 0, 0, 1, 1,
0.9969394, -1.250717, 4.24467, 0, 0, 0, 1, 1,
1.016328, -0.7658302, 2.345422, 0, 0, 0, 1, 1,
1.025425, 1.221451, -0.476938, 0, 0, 0, 1, 1,
1.042779, 1.11249, 0.1537436, 0, 0, 0, 1, 1,
1.047672, 0.8584167, 1.976439, 0, 0, 0, 1, 1,
1.050207, -0.06324159, 2.264746, 0, 0, 0, 1, 1,
1.057716, 0.432084, 0.06135214, 1, 1, 1, 1, 1,
1.059009, -1.506131, 1.683398, 1, 1, 1, 1, 1,
1.068461, 1.769912, 1.076015, 1, 1, 1, 1, 1,
1.070634, 0.51466, -0.08773664, 1, 1, 1, 1, 1,
1.086445, 1.463061, 0.1134191, 1, 1, 1, 1, 1,
1.087933, 0.7126245, -0.6542095, 1, 1, 1, 1, 1,
1.09189, 0.4061958, 1.109479, 1, 1, 1, 1, 1,
1.09651, -0.5139302, 3.372335, 1, 1, 1, 1, 1,
1.10421, 1.148249, -0.7592379, 1, 1, 1, 1, 1,
1.112116, 1.348474, -0.2733824, 1, 1, 1, 1, 1,
1.116472, 1.393589, -0.1582777, 1, 1, 1, 1, 1,
1.11659, 0.4302765, 2.867458, 1, 1, 1, 1, 1,
1.123049, 0.6755252, 1.148044, 1, 1, 1, 1, 1,
1.133233, 1.054137, 1.349378, 1, 1, 1, 1, 1,
1.141088, -1.379177, 3.68957, 1, 1, 1, 1, 1,
1.147246, -0.9751343, 2.424144, 0, 0, 1, 1, 1,
1.150664, 0.3261758, 0.03117544, 1, 0, 0, 1, 1,
1.152642, 0.3780933, 1.298092, 1, 0, 0, 1, 1,
1.155782, 1.633822, 2.762202, 1, 0, 0, 1, 1,
1.156796, 0.1188926, 1.076773, 1, 0, 0, 1, 1,
1.159622, 0.5168337, 2.128901, 1, 0, 0, 1, 1,
1.166534, 0.6619759, 0.6804958, 0, 0, 0, 1, 1,
1.176714, -0.6207542, 1.320628, 0, 0, 0, 1, 1,
1.177472, 0.7762225, 0.8128, 0, 0, 0, 1, 1,
1.179363, -1.260451, 1.295976, 0, 0, 0, 1, 1,
1.179876, 1.065827, 1.070639, 0, 0, 0, 1, 1,
1.180264, -0.4542484, 3.898098, 0, 0, 0, 1, 1,
1.192463, 1.046705, 1.2148, 0, 0, 0, 1, 1,
1.203083, 1.868937, 0.1527851, 1, 1, 1, 1, 1,
1.207963, 0.5150623, 1.014247, 1, 1, 1, 1, 1,
1.216053, 0.7806246, 0.1431725, 1, 1, 1, 1, 1,
1.222801, -0.3753921, -0.1722625, 1, 1, 1, 1, 1,
1.225878, -1.49538, 2.121388, 1, 1, 1, 1, 1,
1.227787, 0.4400041, 1.865101, 1, 1, 1, 1, 1,
1.229447, 1.648921, 0.7661719, 1, 1, 1, 1, 1,
1.244693, 1.818699, 0.8610697, 1, 1, 1, 1, 1,
1.25834, -1.272015, 3.007307, 1, 1, 1, 1, 1,
1.258495, 0.7100068, 2.046046, 1, 1, 1, 1, 1,
1.267345, -0.4432098, 1.941422, 1, 1, 1, 1, 1,
1.269433, 1.388679, 0.5654784, 1, 1, 1, 1, 1,
1.269945, -0.8467847, 3.232351, 1, 1, 1, 1, 1,
1.271533, 0.3632818, 0.8502563, 1, 1, 1, 1, 1,
1.278008, 1.906944, 0.04292893, 1, 1, 1, 1, 1,
1.281822, 0.2246587, 0.7139878, 0, 0, 1, 1, 1,
1.287393, -0.26223, 1.291342, 1, 0, 0, 1, 1,
1.294047, -0.2091495, 0.08518474, 1, 0, 0, 1, 1,
1.299712, -0.1339128, 3.031982, 1, 0, 0, 1, 1,
1.306438, 1.956157, -0.2318194, 1, 0, 0, 1, 1,
1.307703, 0.5293479, 1.507529, 1, 0, 0, 1, 1,
1.310413, 1.21056, 1.476487, 0, 0, 0, 1, 1,
1.322874, 0.03582333, 2.052172, 0, 0, 0, 1, 1,
1.32453, 0.2408418, 1.567281, 0, 0, 0, 1, 1,
1.329989, 0.07364894, -0.3629426, 0, 0, 0, 1, 1,
1.341726, 0.8656182, 0.09606728, 0, 0, 0, 1, 1,
1.343523, -0.4903697, 1.762216, 0, 0, 0, 1, 1,
1.346867, 0.6250299, 1.877577, 0, 0, 0, 1, 1,
1.348326, -1.338269, 2.352172, 1, 1, 1, 1, 1,
1.351549, -1.0782, 2.623857, 1, 1, 1, 1, 1,
1.352305, 0.7394045, 0.7819999, 1, 1, 1, 1, 1,
1.352803, -0.6504357, 1.398449, 1, 1, 1, 1, 1,
1.354663, -2.140455, 5.186423, 1, 1, 1, 1, 1,
1.357109, -0.8852869, -0.1747503, 1, 1, 1, 1, 1,
1.36627, 0.6906195, 0.797496, 1, 1, 1, 1, 1,
1.38215, 0.1756629, 2.162791, 1, 1, 1, 1, 1,
1.383549, -0.8397523, 1.721272, 1, 1, 1, 1, 1,
1.412085, 0.7589046, -0.9800333, 1, 1, 1, 1, 1,
1.425296, 0.3588563, 0.05841835, 1, 1, 1, 1, 1,
1.428478, 0.335324, 2.151543, 1, 1, 1, 1, 1,
1.430825, 1.632962, 0.8386449, 1, 1, 1, 1, 1,
1.43679, -0.7163615, 2.159783, 1, 1, 1, 1, 1,
1.436908, 1.305519, 1.68249, 1, 1, 1, 1, 1,
1.444656, -0.1192212, 0.3767787, 0, 0, 1, 1, 1,
1.451041, 0.5347871, 1.649538, 1, 0, 0, 1, 1,
1.451552, 0.2471314, 2.166035, 1, 0, 0, 1, 1,
1.455155, -0.8042386, 1.320024, 1, 0, 0, 1, 1,
1.45609, -1.281776, 1.342792, 1, 0, 0, 1, 1,
1.45846, 1.636564, 0.5190771, 1, 0, 0, 1, 1,
1.47655, 1.137832, -0.2862107, 0, 0, 0, 1, 1,
1.478138, -0.8055165, 2.028496, 0, 0, 0, 1, 1,
1.495079, -2.412467, 2.980347, 0, 0, 0, 1, 1,
1.500189, 2.594386, 0.8982651, 0, 0, 0, 1, 1,
1.523847, 0.2298007, 1.013639, 0, 0, 0, 1, 1,
1.527413, -0.352576, 1.618185, 0, 0, 0, 1, 1,
1.539724, -1.988685, 3.061897, 0, 0, 0, 1, 1,
1.553991, 1.419812, 1.761665, 1, 1, 1, 1, 1,
1.589118, -0.09324629, 1.742671, 1, 1, 1, 1, 1,
1.601514, -0.02656176, 2.379618, 1, 1, 1, 1, 1,
1.604982, -0.6485248, 3.0877, 1, 1, 1, 1, 1,
1.613019, -1.284533, 1.344137, 1, 1, 1, 1, 1,
1.615195, 0.1489974, 2.241573, 1, 1, 1, 1, 1,
1.632241, 0.4407977, 0.7653454, 1, 1, 1, 1, 1,
1.63472, 0.1072766, 1.187416, 1, 1, 1, 1, 1,
1.643845, -0.4176973, 1.706284, 1, 1, 1, 1, 1,
1.6515, -0.893537, 2.613049, 1, 1, 1, 1, 1,
1.661873, -0.2906769, 0.3350647, 1, 1, 1, 1, 1,
1.666826, 0.1550939, 0.9768991, 1, 1, 1, 1, 1,
1.671804, -1.645773, 2.581955, 1, 1, 1, 1, 1,
1.691332, 0.6030025, 2.26109, 1, 1, 1, 1, 1,
1.718294, -0.8178885, 2.349418, 1, 1, 1, 1, 1,
1.724115, 0.9157372, -1.281257, 0, 0, 1, 1, 1,
1.727252, -0.3110071, 2.080793, 1, 0, 0, 1, 1,
1.728127, -1.731061, 2.336072, 1, 0, 0, 1, 1,
1.74979, -0.3745555, 2.919709, 1, 0, 0, 1, 1,
1.751327, -0.8666633, 0.824919, 1, 0, 0, 1, 1,
1.751817, -2.218077, 2.804855, 1, 0, 0, 1, 1,
1.758091, -1.398463, 1.556044, 0, 0, 0, 1, 1,
1.758385, 2.470268, 0.9169706, 0, 0, 0, 1, 1,
1.763397, -0.946683, 2.583897, 0, 0, 0, 1, 1,
1.790542, 0.01225653, 0.0423339, 0, 0, 0, 1, 1,
1.792225, 1.014974, 0.7370057, 0, 0, 0, 1, 1,
1.794901, 0.2222677, 2.210636, 0, 0, 0, 1, 1,
1.806746, -1.114965, 1.437969, 0, 0, 0, 1, 1,
1.842285, -0.8932197, 2.371624, 1, 1, 1, 1, 1,
1.859203, 0.7242154, 0.8246658, 1, 1, 1, 1, 1,
1.877831, 0.4950019, 1.712409, 1, 1, 1, 1, 1,
1.891915, 0.6236321, -0.4999334, 1, 1, 1, 1, 1,
1.892854, 1.294914, 1.657561, 1, 1, 1, 1, 1,
1.895091, 0.6058562, 0.4797843, 1, 1, 1, 1, 1,
1.896146, 1.091717, 0.1000924, 1, 1, 1, 1, 1,
1.911861, 0.1715419, 1.479069, 1, 1, 1, 1, 1,
1.937751, -1.216829, 1.541108, 1, 1, 1, 1, 1,
1.944375, -0.7375483, 1.399956, 1, 1, 1, 1, 1,
1.978214, -1.98616, 0.675218, 1, 1, 1, 1, 1,
1.990267, 0.5672576, 0.5042686, 1, 1, 1, 1, 1,
2.01787, -0.7671428, 3.636045, 1, 1, 1, 1, 1,
2.054209, 0.5269996, 0.635882, 1, 1, 1, 1, 1,
2.073639, -0.8737798, 1.431365, 1, 1, 1, 1, 1,
2.086291, 0.6656896, 2.945891, 0, 0, 1, 1, 1,
2.11049, -0.750061, 1.488969, 1, 0, 0, 1, 1,
2.139401, 0.6704707, 1.932851, 1, 0, 0, 1, 1,
2.154712, 0.9306895, 1.350852, 1, 0, 0, 1, 1,
2.180598, 0.5416186, 0.9904032, 1, 0, 0, 1, 1,
2.256095, 0.5206524, 1.046937, 1, 0, 0, 1, 1,
2.267061, 0.1437152, 0.6256616, 0, 0, 0, 1, 1,
2.26859, -0.2360829, 2.263327, 0, 0, 0, 1, 1,
2.290508, 0.0331491, 0.8402575, 0, 0, 0, 1, 1,
2.333307, 0.5926738, 1.741279, 0, 0, 0, 1, 1,
2.377074, 0.07039697, 0.8353677, 0, 0, 0, 1, 1,
2.421085, -0.4114302, 0.7491556, 0, 0, 0, 1, 1,
2.550393, 0.3665522, 0.818898, 0, 0, 0, 1, 1,
2.555253, -1.26996, 2.608946, 1, 1, 1, 1, 1,
2.556861, 0.07185714, 1.845184, 1, 1, 1, 1, 1,
2.656552, -0.07322603, 0.4150351, 1, 1, 1, 1, 1,
2.695522, -0.2489267, 1.153345, 1, 1, 1, 1, 1,
2.703281, 0.4958024, 0.4073943, 1, 1, 1, 1, 1,
2.811578, -0.1204441, 3.954429, 1, 1, 1, 1, 1,
3.00394, -0.9343598, 1.121167, 1, 1, 1, 1, 1
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
var radius = 9.295178;
var distance = 32.64892;
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
mvMatrix.translate( 0.05244684, -0.01537561, -0.08720136 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.64892);
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
