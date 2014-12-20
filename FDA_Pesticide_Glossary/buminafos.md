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
-3.047953, 0.7920094, -2.094505, 1, 0, 0, 1,
-2.852537, -0.4681276, -2.709249, 1, 0.007843138, 0, 1,
-2.69802, 0.4266539, -2.073382, 1, 0.01176471, 0, 1,
-2.608755, 0.6121361, -1.364386, 1, 0.01960784, 0, 1,
-2.578414, 1.245736, -0.4307534, 1, 0.02352941, 0, 1,
-2.340418, -0.02396753, -1.350332, 1, 0.03137255, 0, 1,
-2.32258, 1.122737, -0.7270472, 1, 0.03529412, 0, 1,
-2.261904, 1.814362, -0.7495531, 1, 0.04313726, 0, 1,
-2.250001, 1.836027, -1.569947, 1, 0.04705882, 0, 1,
-2.241082, -0.5500808, -1.90778, 1, 0.05490196, 0, 1,
-2.226941, -0.3614691, -1.620109, 1, 0.05882353, 0, 1,
-2.183419, -0.7871513, -2.440893, 1, 0.06666667, 0, 1,
-2.175007, -0.2871563, -0.4291061, 1, 0.07058824, 0, 1,
-2.104161, -0.6487988, -0.7370254, 1, 0.07843138, 0, 1,
-2.013179, 1.678012, -1.603293, 1, 0.08235294, 0, 1,
-2.008743, 1.578108, -2.02563, 1, 0.09019608, 0, 1,
-1.973331, -0.5745264, -1.499178, 1, 0.09411765, 0, 1,
-1.962755, -1.301312, -0.4407032, 1, 0.1019608, 0, 1,
-1.951091, -1.096773, -2.840144, 1, 0.1098039, 0, 1,
-1.913012, 0.06489911, -1.196794, 1, 0.1137255, 0, 1,
-1.904006, 2.289378, -0.04717168, 1, 0.1215686, 0, 1,
-1.902985, 0.9413218, 0.683055, 1, 0.1254902, 0, 1,
-1.886316, 2.599052, 0.9392224, 1, 0.1333333, 0, 1,
-1.853972, 1.06798, 0.1649653, 1, 0.1372549, 0, 1,
-1.8502, 0.7491077, -1.019027, 1, 0.145098, 0, 1,
-1.841086, -0.9425008, -3.118771, 1, 0.1490196, 0, 1,
-1.833186, -0.9104888, -0.43359, 1, 0.1568628, 0, 1,
-1.830743, 1.449713, -1.452547, 1, 0.1607843, 0, 1,
-1.811714, 0.4662401, -1.635658, 1, 0.1686275, 0, 1,
-1.789399, 0.7749368, -1.196995, 1, 0.172549, 0, 1,
-1.772439, -0.883203, -3.200442, 1, 0.1803922, 0, 1,
-1.766733, 0.3054267, -1.490093, 1, 0.1843137, 0, 1,
-1.758014, -2.038146, -2.165022, 1, 0.1921569, 0, 1,
-1.741271, 1.29964, -0.03641762, 1, 0.1960784, 0, 1,
-1.736635, 0.3720159, -1.2649, 1, 0.2039216, 0, 1,
-1.729242, 2.469917, 0.8798673, 1, 0.2117647, 0, 1,
-1.723632, -0.6315403, -0.456375, 1, 0.2156863, 0, 1,
-1.714794, 0.5262993, 0.1154046, 1, 0.2235294, 0, 1,
-1.706061, -0.5757697, -3.990045, 1, 0.227451, 0, 1,
-1.690936, -0.9755008, -3.156437, 1, 0.2352941, 0, 1,
-1.689167, -0.10008, -2.315076, 1, 0.2392157, 0, 1,
-1.6825, -1.116422, -1.872394, 1, 0.2470588, 0, 1,
-1.672043, -0.6209094, -2.915245, 1, 0.2509804, 0, 1,
-1.658934, -1.029091, -2.6239, 1, 0.2588235, 0, 1,
-1.656646, -1.530052, -0.7642837, 1, 0.2627451, 0, 1,
-1.653709, -0.07959481, -0.3513868, 1, 0.2705882, 0, 1,
-1.65136, -0.3419387, -1.379407, 1, 0.2745098, 0, 1,
-1.651158, -1.134075, -2.64899, 1, 0.282353, 0, 1,
-1.630092, 1.284698, -0.6550321, 1, 0.2862745, 0, 1,
-1.623371, 0.9097453, -0.1565249, 1, 0.2941177, 0, 1,
-1.617724, -0.3414231, -0.9748778, 1, 0.3019608, 0, 1,
-1.616645, 1.49193, -1.98118, 1, 0.3058824, 0, 1,
-1.611811, -0.7466184, -1.723117, 1, 0.3137255, 0, 1,
-1.611803, 0.3678988, -1.903222, 1, 0.3176471, 0, 1,
-1.609071, 0.3271429, -1.248019, 1, 0.3254902, 0, 1,
-1.598753, -0.312987, -1.211065, 1, 0.3294118, 0, 1,
-1.596407, -7.633835e-05, -2.263762, 1, 0.3372549, 0, 1,
-1.596233, -1.473377, -1.819255, 1, 0.3411765, 0, 1,
-1.566534, -0.5526804, -2.034866, 1, 0.3490196, 0, 1,
-1.564681, 1.869404, -1.116981, 1, 0.3529412, 0, 1,
-1.562788, -0.1811129, -2.184138, 1, 0.3607843, 0, 1,
-1.529518, -0.5034805, -1.630855, 1, 0.3647059, 0, 1,
-1.525112, -0.9255223, -2.517314, 1, 0.372549, 0, 1,
-1.523512, -0.5795212, -2.795719, 1, 0.3764706, 0, 1,
-1.511201, -0.4432995, -0.9997714, 1, 0.3843137, 0, 1,
-1.503793, -0.6700838, -1.111977, 1, 0.3882353, 0, 1,
-1.503293, 1.117922, -1.231453, 1, 0.3960784, 0, 1,
-1.481137, -0.5184459, -3.495094, 1, 0.4039216, 0, 1,
-1.474553, 0.3890671, -0.880978, 1, 0.4078431, 0, 1,
-1.473187, 0.1263871, -1.336257, 1, 0.4156863, 0, 1,
-1.468693, -0.7946527, -2.259612, 1, 0.4196078, 0, 1,
-1.468244, 0.1776472, -1.387946, 1, 0.427451, 0, 1,
-1.467425, -0.1597371, -0.7212725, 1, 0.4313726, 0, 1,
-1.465749, 0.02845485, -2.024808, 1, 0.4392157, 0, 1,
-1.464718, -0.2432285, -3.412224, 1, 0.4431373, 0, 1,
-1.460135, 2.005699, -0.01795994, 1, 0.4509804, 0, 1,
-1.458526, -0.9337665, -2.89947, 1, 0.454902, 0, 1,
-1.447337, -0.1795734, -1.932594, 1, 0.4627451, 0, 1,
-1.434921, -0.5915087, -2.235787, 1, 0.4666667, 0, 1,
-1.431431, -0.06822006, -2.467581, 1, 0.4745098, 0, 1,
-1.428414, 0.6460283, -0.2523724, 1, 0.4784314, 0, 1,
-1.428351, -0.2493985, -2.449584, 1, 0.4862745, 0, 1,
-1.426329, 0.4443668, -2.835539, 1, 0.4901961, 0, 1,
-1.422404, -0.03993744, -2.59271, 1, 0.4980392, 0, 1,
-1.418015, -2.461925, -2.55544, 1, 0.5058824, 0, 1,
-1.416291, 1.750872, 0.6630548, 1, 0.509804, 0, 1,
-1.410294, -0.2268657, -0.1858956, 1, 0.5176471, 0, 1,
-1.404103, -0.6191309, -2.371206, 1, 0.5215687, 0, 1,
-1.396769, -0.9533861, -1.791285, 1, 0.5294118, 0, 1,
-1.394444, -0.06266616, -0.7930329, 1, 0.5333334, 0, 1,
-1.388128, 2.006089, -3.242254, 1, 0.5411765, 0, 1,
-1.37146, -0.1521419, -2.805049, 1, 0.5450981, 0, 1,
-1.366173, -0.175116, -0.04614458, 1, 0.5529412, 0, 1,
-1.362254, 0.001696274, -1.534119, 1, 0.5568628, 0, 1,
-1.359746, -0.9613438, -1.614674, 1, 0.5647059, 0, 1,
-1.350979, -0.3301989, -1.193402, 1, 0.5686275, 0, 1,
-1.348795, -0.9413005, -1.910682, 1, 0.5764706, 0, 1,
-1.348516, 0.4353872, -2.281637, 1, 0.5803922, 0, 1,
-1.348068, 0.9604178, -0.3637554, 1, 0.5882353, 0, 1,
-1.344201, -0.8178437, -2.131449, 1, 0.5921569, 0, 1,
-1.344167, -1.394207, -1.466614, 1, 0.6, 0, 1,
-1.342937, -0.9661377, -3.031994, 1, 0.6078432, 0, 1,
-1.332844, -0.3080442, -1.559965, 1, 0.6117647, 0, 1,
-1.332757, 1.360946, -1.22101, 1, 0.6196079, 0, 1,
-1.329307, 0.4274641, -1.932089, 1, 0.6235294, 0, 1,
-1.322423, -0.5676773, -0.9161104, 1, 0.6313726, 0, 1,
-1.318874, 0.1424953, -2.180922, 1, 0.6352941, 0, 1,
-1.303121, 0.2930582, -0.9872912, 1, 0.6431373, 0, 1,
-1.292452, 0.4670158, -0.5885713, 1, 0.6470588, 0, 1,
-1.290457, 0.1648652, -1.506845, 1, 0.654902, 0, 1,
-1.290264, -0.8348578, -2.488233, 1, 0.6588235, 0, 1,
-1.287731, -2.835907, -2.438253, 1, 0.6666667, 0, 1,
-1.269178, 0.03786863, -2.124452, 1, 0.6705883, 0, 1,
-1.245955, 0.05333549, -0.4071733, 1, 0.6784314, 0, 1,
-1.244919, -1.10589, -1.496856, 1, 0.682353, 0, 1,
-1.244291, -0.3347817, -1.980072, 1, 0.6901961, 0, 1,
-1.23768, 0.001885821, -0.7241212, 1, 0.6941177, 0, 1,
-1.226633, -0.07695777, -0.9299418, 1, 0.7019608, 0, 1,
-1.216084, -0.6077035, -0.6352425, 1, 0.7098039, 0, 1,
-1.213929, 0.6291271, -1.618497, 1, 0.7137255, 0, 1,
-1.213862, 0.4771306, -1.812964, 1, 0.7215686, 0, 1,
-1.211143, -1.967653, -2.027602, 1, 0.7254902, 0, 1,
-1.206131, -2.156633, -1.332717, 1, 0.7333333, 0, 1,
-1.203157, -0.6544133, -2.60323, 1, 0.7372549, 0, 1,
-1.203118, 0.6604794, 0.9290511, 1, 0.7450981, 0, 1,
-1.197008, -0.5484747, -1.142668, 1, 0.7490196, 0, 1,
-1.196662, 0.06852601, -0.3220361, 1, 0.7568628, 0, 1,
-1.195907, -0.1259904, -1.898425, 1, 0.7607843, 0, 1,
-1.192937, -1.047362, -1.562312, 1, 0.7686275, 0, 1,
-1.192465, 1.796336, -0.8480555, 1, 0.772549, 0, 1,
-1.192249, 1.421444, -0.8177477, 1, 0.7803922, 0, 1,
-1.191187, -0.3703481, -2.183221, 1, 0.7843137, 0, 1,
-1.188487, 1.171969, 0.6457644, 1, 0.7921569, 0, 1,
-1.186555, -1.715071, -2.524777, 1, 0.7960784, 0, 1,
-1.18576, -1.201345, -1.405835, 1, 0.8039216, 0, 1,
-1.179696, 0.990156, -1.495126, 1, 0.8117647, 0, 1,
-1.178612, -0.9570542, -1.7115, 1, 0.8156863, 0, 1,
-1.168522, -0.3073704, -0.9026687, 1, 0.8235294, 0, 1,
-1.167775, -0.4190964, -0.7366803, 1, 0.827451, 0, 1,
-1.167648, -0.5130066, -2.683149, 1, 0.8352941, 0, 1,
-1.165634, -0.3813183, -1.851181, 1, 0.8392157, 0, 1,
-1.152104, -0.6040986, -0.9799785, 1, 0.8470588, 0, 1,
-1.141686, 0.2209754, -1.072767, 1, 0.8509804, 0, 1,
-1.139132, -1.35007, -1.589644, 1, 0.8588235, 0, 1,
-1.092473, 0.5383151, -1.171941, 1, 0.8627451, 0, 1,
-1.085533, 1.556761, -0.5522224, 1, 0.8705882, 0, 1,
-1.084741, -0.3260181, -2.104347, 1, 0.8745098, 0, 1,
-1.076555, -0.2821757, -1.434025, 1, 0.8823529, 0, 1,
-1.069136, 0.2756982, -4.195581, 1, 0.8862745, 0, 1,
-1.064031, 0.6363887, -0.6651383, 1, 0.8941177, 0, 1,
-1.04461, -0.7105325, -2.603158, 1, 0.8980392, 0, 1,
-1.043184, -0.6380337, -2.95268, 1, 0.9058824, 0, 1,
-1.042552, 1.921878, 0.07640335, 1, 0.9137255, 0, 1,
-1.039188, -2.366976, -2.996702, 1, 0.9176471, 0, 1,
-1.029664, 0.360328, 0.4332168, 1, 0.9254902, 0, 1,
-1.015159, -0.2217965, -2.100651, 1, 0.9294118, 0, 1,
-1.012393, -0.1422129, -3.334344, 1, 0.9372549, 0, 1,
-1.006221, 0.5262819, -1.702389, 1, 0.9411765, 0, 1,
-1.000637, 0.8711037, -1.706887, 1, 0.9490196, 0, 1,
-0.984421, 0.8017161, 1.034642, 1, 0.9529412, 0, 1,
-0.9823788, -1.49826, -3.474514, 1, 0.9607843, 0, 1,
-0.9813932, -1.312028, -3.750674, 1, 0.9647059, 0, 1,
-0.9746429, -0.5207978, -2.321334, 1, 0.972549, 0, 1,
-0.9741338, -0.3970421, -2.881936, 1, 0.9764706, 0, 1,
-0.9720703, -0.2993607, -1.343028, 1, 0.9843137, 0, 1,
-0.9713838, -0.04797338, -2.273211, 1, 0.9882353, 0, 1,
-0.9685642, -0.0439944, -1.821869, 1, 0.9960784, 0, 1,
-0.9665392, 0.8309233, -1.076355, 0.9960784, 1, 0, 1,
-0.9631432, -1.483436, -1.317036, 0.9921569, 1, 0, 1,
-0.9453558, -0.1848854, -3.19847, 0.9843137, 1, 0, 1,
-0.9252978, -0.6924772, -3.783761, 0.9803922, 1, 0, 1,
-0.9207422, -1.426279, -1.397276, 0.972549, 1, 0, 1,
-0.9180393, -0.9133895, -3.250823, 0.9686275, 1, 0, 1,
-0.9032065, -0.06101661, -2.916094, 0.9607843, 1, 0, 1,
-0.8877368, 0.00378446, -2.127762, 0.9568627, 1, 0, 1,
-0.8847029, 1.291692, -0.6549418, 0.9490196, 1, 0, 1,
-0.8805251, 0.1422072, -1.458204, 0.945098, 1, 0, 1,
-0.8803341, 0.3508348, -0.744329, 0.9372549, 1, 0, 1,
-0.875262, 0.7559296, -1.03388, 0.9333333, 1, 0, 1,
-0.8580581, 1.44435, -0.4486378, 0.9254902, 1, 0, 1,
-0.8547176, -0.4376626, -2.546661, 0.9215686, 1, 0, 1,
-0.8480722, 0.777961, -1.494971, 0.9137255, 1, 0, 1,
-0.8471721, -1.018179, 0.1995001, 0.9098039, 1, 0, 1,
-0.8468112, 0.1594216, -0.8148098, 0.9019608, 1, 0, 1,
-0.8442698, -0.2871858, -0.2443543, 0.8941177, 1, 0, 1,
-0.8360716, -0.6856448, -1.925193, 0.8901961, 1, 0, 1,
-0.83503, -0.2412538, -0.1734379, 0.8823529, 1, 0, 1,
-0.8338678, -0.3157461, -0.821595, 0.8784314, 1, 0, 1,
-0.8325641, -1.098244, -1.718376, 0.8705882, 1, 0, 1,
-0.8301924, -0.55924, -2.323563, 0.8666667, 1, 0, 1,
-0.8252041, -0.5364403, -2.876075, 0.8588235, 1, 0, 1,
-0.8234161, -0.3451294, -3.278697, 0.854902, 1, 0, 1,
-0.8216046, -1.339874, -3.594702, 0.8470588, 1, 0, 1,
-0.8188678, 0.4065818, -2.057418, 0.8431373, 1, 0, 1,
-0.8182292, 0.5482849, -0.9460682, 0.8352941, 1, 0, 1,
-0.8156589, 1.039398, -1.317463, 0.8313726, 1, 0, 1,
-0.8153608, 0.7434334, -0.1789893, 0.8235294, 1, 0, 1,
-0.8142042, -0.971212, -3.485306, 0.8196079, 1, 0, 1,
-0.8141898, -1.036623, -3.334055, 0.8117647, 1, 0, 1,
-0.8109146, -2.388803, 0.02303041, 0.8078431, 1, 0, 1,
-0.8099557, 1.927541, -1.019645, 0.8, 1, 0, 1,
-0.7984682, -0.7641113, -3.30176, 0.7921569, 1, 0, 1,
-0.7984293, 1.197775, -1.482297, 0.7882353, 1, 0, 1,
-0.7963658, -0.2629082, -1.778879, 0.7803922, 1, 0, 1,
-0.7936178, 0.7441002, -0.877978, 0.7764706, 1, 0, 1,
-0.7913734, -2.122592, -1.892764, 0.7686275, 1, 0, 1,
-0.7904296, 0.03597656, -0.4392475, 0.7647059, 1, 0, 1,
-0.7875428, -0.8331437, -2.087663, 0.7568628, 1, 0, 1,
-0.7851976, 0.209703, -3.268262, 0.7529412, 1, 0, 1,
-0.782471, -0.5610191, -1.059052, 0.7450981, 1, 0, 1,
-0.7818443, -0.7640155, -3.358689, 0.7411765, 1, 0, 1,
-0.7809818, -0.2276022, -2.580027, 0.7333333, 1, 0, 1,
-0.775057, -0.04547841, -3.112144, 0.7294118, 1, 0, 1,
-0.7749485, 1.495673, -0.2923505, 0.7215686, 1, 0, 1,
-0.7725379, 0.9436147, -0.7433836, 0.7176471, 1, 0, 1,
-0.769796, 0.8077319, -0.08639019, 0.7098039, 1, 0, 1,
-0.7693628, 0.8455024, -1.398755, 0.7058824, 1, 0, 1,
-0.7671596, 0.7501032, 1.262346, 0.6980392, 1, 0, 1,
-0.7655451, 0.006099954, -2.096547, 0.6901961, 1, 0, 1,
-0.7591045, 1.242419, -0.09213325, 0.6862745, 1, 0, 1,
-0.756374, -0.3094687, -1.276217, 0.6784314, 1, 0, 1,
-0.755151, 1.693726, 0.005817275, 0.6745098, 1, 0, 1,
-0.749374, 0.1275189, -1.069975, 0.6666667, 1, 0, 1,
-0.7486269, -1.096569, -3.122483, 0.6627451, 1, 0, 1,
-0.7484063, 0.5478302, -1.629281, 0.654902, 1, 0, 1,
-0.7439196, 0.2084255, -2.273709, 0.6509804, 1, 0, 1,
-0.7350936, 0.02580713, -1.336701, 0.6431373, 1, 0, 1,
-0.7349834, 0.1142486, -0.8196557, 0.6392157, 1, 0, 1,
-0.7331384, -0.3340391, -0.8672969, 0.6313726, 1, 0, 1,
-0.7297444, 1.245986, 1.750858, 0.627451, 1, 0, 1,
-0.7281688, 0.5770725, -0.7744715, 0.6196079, 1, 0, 1,
-0.7258868, 0.5101485, -1.403772, 0.6156863, 1, 0, 1,
-0.7226172, 0.5077969, -1.929484, 0.6078432, 1, 0, 1,
-0.7176315, 1.310624, -2.728364, 0.6039216, 1, 0, 1,
-0.7099748, 0.3436004, -0.01873794, 0.5960785, 1, 0, 1,
-0.7060639, 1.065991, 0.2883023, 0.5882353, 1, 0, 1,
-0.7016636, 0.65212, -2.287498, 0.5843138, 1, 0, 1,
-0.6983025, -0.910161, -1.936519, 0.5764706, 1, 0, 1,
-0.6970483, -1.516877, -2.623854, 0.572549, 1, 0, 1,
-0.6892544, 1.63829, -1.61, 0.5647059, 1, 0, 1,
-0.6879724, 0.2756086, 0.6761976, 0.5607843, 1, 0, 1,
-0.683439, -0.9343222, -2.926188, 0.5529412, 1, 0, 1,
-0.6827496, -0.05622289, -2.486559, 0.5490196, 1, 0, 1,
-0.6818908, -0.07609951, -0.7259423, 0.5411765, 1, 0, 1,
-0.6816692, -0.1912156, -2.349705, 0.5372549, 1, 0, 1,
-0.6788992, -0.5377552, -3.944597, 0.5294118, 1, 0, 1,
-0.6752275, -0.08788416, -1.25113, 0.5254902, 1, 0, 1,
-0.6730159, -0.971229, -3.820816, 0.5176471, 1, 0, 1,
-0.672341, 0.7451538, -0.403906, 0.5137255, 1, 0, 1,
-0.6701536, 0.2020279, -1.723018, 0.5058824, 1, 0, 1,
-0.66987, 0.1495181, -1.561915, 0.5019608, 1, 0, 1,
-0.6641331, -0.03714659, -1.329533, 0.4941176, 1, 0, 1,
-0.6629972, 0.4293866, -0.7045446, 0.4862745, 1, 0, 1,
-0.6608984, 0.1591873, -1.363005, 0.4823529, 1, 0, 1,
-0.6606928, 0.1540722, -2.521481, 0.4745098, 1, 0, 1,
-0.6585279, 1.817516, 1.439772, 0.4705882, 1, 0, 1,
-0.6578115, -0.5420746, -2.427531, 0.4627451, 1, 0, 1,
-0.6568226, -1.032588, -1.152815, 0.4588235, 1, 0, 1,
-0.6526975, 0.7260849, -2.713141, 0.4509804, 1, 0, 1,
-0.6476724, 0.168287, -2.204576, 0.4470588, 1, 0, 1,
-0.6413517, -0.9496326, -1.311012, 0.4392157, 1, 0, 1,
-0.641111, -0.691669, -3.493109, 0.4352941, 1, 0, 1,
-0.6384553, -2.533708, -6.258344, 0.427451, 1, 0, 1,
-0.6307343, -1.402325, -2.475454, 0.4235294, 1, 0, 1,
-0.6291698, -1.620999, -4.141259, 0.4156863, 1, 0, 1,
-0.625558, 0.8493984, 0.3052356, 0.4117647, 1, 0, 1,
-0.6225107, 0.4573147, -0.9647968, 0.4039216, 1, 0, 1,
-0.6187689, 1.198293, 0.7658312, 0.3960784, 1, 0, 1,
-0.6184785, -0.4407081, -3.522431, 0.3921569, 1, 0, 1,
-0.6176353, -0.6614713, -3.385107, 0.3843137, 1, 0, 1,
-0.6103246, 0.08386493, -0.7636646, 0.3803922, 1, 0, 1,
-0.6087228, 2.447013, -0.6476469, 0.372549, 1, 0, 1,
-0.6048811, 0.9523853, 0.1329521, 0.3686275, 1, 0, 1,
-0.6043654, 1.719203, 0.7090847, 0.3607843, 1, 0, 1,
-0.6038078, -0.8220236, -1.988948, 0.3568628, 1, 0, 1,
-0.5975396, -0.5670515, -1.824853, 0.3490196, 1, 0, 1,
-0.5949914, -0.09485278, -3.362139, 0.345098, 1, 0, 1,
-0.5949363, -0.09457182, -0.5388094, 0.3372549, 1, 0, 1,
-0.5918085, -0.5194355, -2.447711, 0.3333333, 1, 0, 1,
-0.5899665, -0.1080991, -4.518383, 0.3254902, 1, 0, 1,
-0.5880779, 0.4876575, -1.170394, 0.3215686, 1, 0, 1,
-0.587482, 0.621183, -1.829755, 0.3137255, 1, 0, 1,
-0.5871711, -0.8509368, -2.863922, 0.3098039, 1, 0, 1,
-0.5866501, -0.5408159, -1.558446, 0.3019608, 1, 0, 1,
-0.5836613, 0.7716975, -2.803695, 0.2941177, 1, 0, 1,
-0.5798326, -1.70963, -1.801006, 0.2901961, 1, 0, 1,
-0.5786354, 0.7814875, 0.008521342, 0.282353, 1, 0, 1,
-0.5715854, -1.266614, -4.108153, 0.2784314, 1, 0, 1,
-0.5615837, 0.2360178, -1.113967, 0.2705882, 1, 0, 1,
-0.5612792, -0.1654903, -1.502627, 0.2666667, 1, 0, 1,
-0.5604766, 0.6472545, 0.04634877, 0.2588235, 1, 0, 1,
-0.5576906, -0.3935316, -2.310936, 0.254902, 1, 0, 1,
-0.5563394, 1.033244, 0.8721237, 0.2470588, 1, 0, 1,
-0.544104, 0.2095805, -2.138396, 0.2431373, 1, 0, 1,
-0.544059, 0.1631573, -1.894929, 0.2352941, 1, 0, 1,
-0.5437453, 0.3628512, -0.2172087, 0.2313726, 1, 0, 1,
-0.5382738, -0.4492087, -2.090501, 0.2235294, 1, 0, 1,
-0.5381383, 0.02383278, -1.839214, 0.2196078, 1, 0, 1,
-0.5313472, 0.2408235, -0.06209331, 0.2117647, 1, 0, 1,
-0.5304115, 1.91018, -0.9975602, 0.2078431, 1, 0, 1,
-0.5288585, -0.2567362, -2.728238, 0.2, 1, 0, 1,
-0.527578, 0.2425968, 0.6581427, 0.1921569, 1, 0, 1,
-0.5268214, 0.6237592, -1.751862, 0.1882353, 1, 0, 1,
-0.5262302, 0.7418314, -0.2458416, 0.1803922, 1, 0, 1,
-0.5191549, -1.101807, -1.753863, 0.1764706, 1, 0, 1,
-0.5151547, 0.5012488, -1.448155, 0.1686275, 1, 0, 1,
-0.5140117, 0.1927512, -1.459148, 0.1647059, 1, 0, 1,
-0.5134341, -1.468997, -3.385274, 0.1568628, 1, 0, 1,
-0.5102625, 0.6121915, -1.988041, 0.1529412, 1, 0, 1,
-0.5069582, 2.199133, 0.6508685, 0.145098, 1, 0, 1,
-0.5045096, -1.285541, -3.557762, 0.1411765, 1, 0, 1,
-0.5040123, 0.3163769, -0.03012341, 0.1333333, 1, 0, 1,
-0.4949568, -0.2376038, -3.137865, 0.1294118, 1, 0, 1,
-0.4945246, -0.8895363, -2.26722, 0.1215686, 1, 0, 1,
-0.4941051, 0.5205156, 0.2625039, 0.1176471, 1, 0, 1,
-0.4911031, -0.03438571, -1.665154, 0.1098039, 1, 0, 1,
-0.4883358, 0.6054174, -0.388668, 0.1058824, 1, 0, 1,
-0.4869818, 0.4468649, -0.1275737, 0.09803922, 1, 0, 1,
-0.4852172, 1.187234, 0.1225264, 0.09019608, 1, 0, 1,
-0.483293, -0.8155751, -2.911596, 0.08627451, 1, 0, 1,
-0.4805039, -1.535303, -2.533663, 0.07843138, 1, 0, 1,
-0.4800704, -0.1663621, -1.119107, 0.07450981, 1, 0, 1,
-0.4742228, -0.156927, -2.088388, 0.06666667, 1, 0, 1,
-0.4736394, 0.5907474, 0.2146031, 0.0627451, 1, 0, 1,
-0.4669176, -1.307195, -2.794961, 0.05490196, 1, 0, 1,
-0.457697, 0.5906079, 2.017432, 0.05098039, 1, 0, 1,
-0.4551107, 1.122023, -0.07369577, 0.04313726, 1, 0, 1,
-0.4526663, -0.2286575, -1.476174, 0.03921569, 1, 0, 1,
-0.4518633, 0.8037959, -1.414785, 0.03137255, 1, 0, 1,
-0.4489603, -0.3406072, -1.834964, 0.02745098, 1, 0, 1,
-0.4459275, 0.5409336, -0.5866187, 0.01960784, 1, 0, 1,
-0.4458981, -2.189101, -1.871949, 0.01568628, 1, 0, 1,
-0.4392054, 0.6037652, 0.9802854, 0.007843138, 1, 0, 1,
-0.4390862, 0.5941435, -1.441297, 0.003921569, 1, 0, 1,
-0.4335608, 0.1189799, -2.795315, 0, 1, 0.003921569, 1,
-0.4335528, 2.287646, -0.2309849, 0, 1, 0.01176471, 1,
-0.4319565, -1.791093, -4.241975, 0, 1, 0.01568628, 1,
-0.4312215, -0.6838786, -1.109742, 0, 1, 0.02352941, 1,
-0.4302788, -0.4289008, -3.431648, 0, 1, 0.02745098, 1,
-0.4269852, -0.7443774, -1.487728, 0, 1, 0.03529412, 1,
-0.4252761, -1.193558, -3.364921, 0, 1, 0.03921569, 1,
-0.4209483, -0.4097988, -1.060874, 0, 1, 0.04705882, 1,
-0.4191628, -0.1338775, -3.776604, 0, 1, 0.05098039, 1,
-0.4126576, 2.76425, -1.162716, 0, 1, 0.05882353, 1,
-0.4111172, 1.556754, 0.5958248, 0, 1, 0.0627451, 1,
-0.4097656, 0.413291, -1.418415, 0, 1, 0.07058824, 1,
-0.4081523, -1.298058, -2.593848, 0, 1, 0.07450981, 1,
-0.4050321, 1.1731, 0.09154063, 0, 1, 0.08235294, 1,
-0.4042501, -2.016343, -3.85753, 0, 1, 0.08627451, 1,
-0.4035662, 1.490342, -1.789583, 0, 1, 0.09411765, 1,
-0.3982685, 0.4550944, -1.64923, 0, 1, 0.1019608, 1,
-0.3979933, 0.4211284, -0.8590509, 0, 1, 0.1058824, 1,
-0.3979233, 1.936615, 1.51903, 0, 1, 0.1137255, 1,
-0.3950018, -1.052102, -2.764571, 0, 1, 0.1176471, 1,
-0.3944952, -0.5186485, -3.308331, 0, 1, 0.1254902, 1,
-0.3936865, 1.320322, 0.1857868, 0, 1, 0.1294118, 1,
-0.3930139, 0.7254523, -1.300905, 0, 1, 0.1372549, 1,
-0.3928472, 0.3282267, -0.5698739, 0, 1, 0.1411765, 1,
-0.3890598, -0.1315877, -0.5220418, 0, 1, 0.1490196, 1,
-0.381615, -0.12483, -2.826591, 0, 1, 0.1529412, 1,
-0.3801356, 0.01005971, -3.246761, 0, 1, 0.1607843, 1,
-0.3771995, 0.2706396, -3.030126, 0, 1, 0.1647059, 1,
-0.3771822, -0.9666212, -1.048792, 0, 1, 0.172549, 1,
-0.3769628, 0.2789204, -1.024775, 0, 1, 0.1764706, 1,
-0.3753351, 1.423089, 1.351495, 0, 1, 0.1843137, 1,
-0.3739917, 0.6212547, 0.4531183, 0, 1, 0.1882353, 1,
-0.3689137, 0.3513812, -1.245408, 0, 1, 0.1960784, 1,
-0.3652698, 0.4434085, -2.44202, 0, 1, 0.2039216, 1,
-0.3645484, 1.00894, -0.6824678, 0, 1, 0.2078431, 1,
-0.3641235, -1.868756, -3.605388, 0, 1, 0.2156863, 1,
-0.3559982, -1.055862, -4.161656, 0, 1, 0.2196078, 1,
-0.355148, -0.4717119, -2.180461, 0, 1, 0.227451, 1,
-0.35219, 0.1701851, -1.543632, 0, 1, 0.2313726, 1,
-0.3482016, -1.511693, -2.31108, 0, 1, 0.2392157, 1,
-0.3473925, 0.3588954, -1.416749, 0, 1, 0.2431373, 1,
-0.3408408, -0.7114727, -2.307802, 0, 1, 0.2509804, 1,
-0.3408343, 0.3522751, -0.9464608, 0, 1, 0.254902, 1,
-0.340258, -0.06358141, -2.098469, 0, 1, 0.2627451, 1,
-0.3383348, 0.8609876, -2.272875, 0, 1, 0.2666667, 1,
-0.3380124, 0.362957, -1.804138, 0, 1, 0.2745098, 1,
-0.3375477, 0.4521745, -0.5433614, 0, 1, 0.2784314, 1,
-0.3374662, -1.219853, -2.891125, 0, 1, 0.2862745, 1,
-0.3330421, -0.01894819, -3.288577, 0, 1, 0.2901961, 1,
-0.3328775, 0.7101963, -0.8062802, 0, 1, 0.2980392, 1,
-0.3321204, 1.020563, -0.6565244, 0, 1, 0.3058824, 1,
-0.3300167, 1.562755, -0.7939945, 0, 1, 0.3098039, 1,
-0.327168, -1.083779, -3.152472, 0, 1, 0.3176471, 1,
-0.3265408, 1.979985, -0.7383364, 0, 1, 0.3215686, 1,
-0.3261892, -0.448251, -3.988329, 0, 1, 0.3294118, 1,
-0.3222086, -1.454183, -3.715731, 0, 1, 0.3333333, 1,
-0.3201496, 1.579881, -0.8825901, 0, 1, 0.3411765, 1,
-0.3191095, -0.7845181, -3.075184, 0, 1, 0.345098, 1,
-0.3190516, -0.646588, -1.840223, 0, 1, 0.3529412, 1,
-0.3183726, -0.4380767, -1.848537, 0, 1, 0.3568628, 1,
-0.3143488, -1.589772, -3.015337, 0, 1, 0.3647059, 1,
-0.3143071, -0.4681586, -4.056148, 0, 1, 0.3686275, 1,
-0.3120573, 1.271857, 0.2215607, 0, 1, 0.3764706, 1,
-0.3101149, 1.714495, -0.006953842, 0, 1, 0.3803922, 1,
-0.3100763, -0.395192, -1.949623, 0, 1, 0.3882353, 1,
-0.3057504, 0.612462, -1.417277, 0, 1, 0.3921569, 1,
-0.3043423, 0.197105, -1.471052, 0, 1, 0.4, 1,
-0.2990451, 0.7283249, -0.8614115, 0, 1, 0.4078431, 1,
-0.2984628, -0.03884543, -1.759393, 0, 1, 0.4117647, 1,
-0.297344, -0.0959167, -3.053891, 0, 1, 0.4196078, 1,
-0.2915965, 0.6920937, 0.01326815, 0, 1, 0.4235294, 1,
-0.289369, 1.391997, -1.76825, 0, 1, 0.4313726, 1,
-0.2891383, 1.679373, -0.05744439, 0, 1, 0.4352941, 1,
-0.2772723, 0.5810016, -1.471396, 0, 1, 0.4431373, 1,
-0.27405, -2.103453, -4.54571, 0, 1, 0.4470588, 1,
-0.2717512, 1.797666, 0.8153745, 0, 1, 0.454902, 1,
-0.2642061, 0.4189778, 0.5679452, 0, 1, 0.4588235, 1,
-0.2636285, -0.9934432, -3.024062, 0, 1, 0.4666667, 1,
-0.2588065, 0.1029632, -1.564114, 0, 1, 0.4705882, 1,
-0.2547053, 0.5563534, 0.6462687, 0, 1, 0.4784314, 1,
-0.2534536, 0.2575825, -1.871476, 0, 1, 0.4823529, 1,
-0.2526896, -0.1900422, -2.163094, 0, 1, 0.4901961, 1,
-0.2522968, 1.712869, -0.2945913, 0, 1, 0.4941176, 1,
-0.2503292, -0.2880899, -3.258235, 0, 1, 0.5019608, 1,
-0.2473183, -0.4826754, -3.22141, 0, 1, 0.509804, 1,
-0.2413751, 1.181042, 0.057919, 0, 1, 0.5137255, 1,
-0.2394915, 0.784651, -2.830921, 0, 1, 0.5215687, 1,
-0.2315416, 1.112786, -0.8629953, 0, 1, 0.5254902, 1,
-0.2303552, -1.183749, -2.075403, 0, 1, 0.5333334, 1,
-0.2218001, 0.733559, 1.191296, 0, 1, 0.5372549, 1,
-0.2203884, -0.8651941, -1.199259, 0, 1, 0.5450981, 1,
-0.2117264, -1.220281, -5.367754, 0, 1, 0.5490196, 1,
-0.2101606, -0.1325772, -1.28047, 0, 1, 0.5568628, 1,
-0.2093248, -0.8638002, -3.158045, 0, 1, 0.5607843, 1,
-0.2031957, 0.8558409, -1.09182, 0, 1, 0.5686275, 1,
-0.2003926, 1.174742, 1.82457, 0, 1, 0.572549, 1,
-0.188966, -0.7821138, -3.804478, 0, 1, 0.5803922, 1,
-0.1853524, -0.1719787, -2.787371, 0, 1, 0.5843138, 1,
-0.1849254, 0.4319372, -0.6683093, 0, 1, 0.5921569, 1,
-0.1812873, -1.46282, -4.328818, 0, 1, 0.5960785, 1,
-0.1797657, 0.6200696, -0.3557493, 0, 1, 0.6039216, 1,
-0.1760712, -2.327641, -3.606081, 0, 1, 0.6117647, 1,
-0.1748484, -1.160236, -2.185807, 0, 1, 0.6156863, 1,
-0.1697778, 0.8164702, 0.3493002, 0, 1, 0.6235294, 1,
-0.1663005, -0.8782846, -2.968065, 0, 1, 0.627451, 1,
-0.1649675, 0.4506234, -2.431621, 0, 1, 0.6352941, 1,
-0.1636344, -0.626765, -1.377666, 0, 1, 0.6392157, 1,
-0.1596459, -0.6784533, -2.526133, 0, 1, 0.6470588, 1,
-0.1580317, 0.5811369, -1.661122, 0, 1, 0.6509804, 1,
-0.1559999, -0.08065499, -3.197439, 0, 1, 0.6588235, 1,
-0.1510598, 0.6502138, 0.1885687, 0, 1, 0.6627451, 1,
-0.1509832, 0.9941339, 0.2186348, 0, 1, 0.6705883, 1,
-0.1429197, 0.3861231, -1.456388, 0, 1, 0.6745098, 1,
-0.1427554, -0.1409298, -2.454504, 0, 1, 0.682353, 1,
-0.1409891, -1.047513, -3.523782, 0, 1, 0.6862745, 1,
-0.1407152, -1.154604, -4.197419, 0, 1, 0.6941177, 1,
-0.1395298, -0.09746543, -1.77488, 0, 1, 0.7019608, 1,
-0.1358095, 0.7697114, 0.8871777, 0, 1, 0.7058824, 1,
-0.1354198, 0.003693754, -1.423733, 0, 1, 0.7137255, 1,
-0.1313246, 1.304965, -0.7630125, 0, 1, 0.7176471, 1,
-0.1309641, -0.1856136, -3.745811, 0, 1, 0.7254902, 1,
-0.1281544, -1.07562, -4.867026, 0, 1, 0.7294118, 1,
-0.1240762, -0.1137302, -3.094608, 0, 1, 0.7372549, 1,
-0.1202503, -0.8021945, -3.396163, 0, 1, 0.7411765, 1,
-0.1175326, -2.018459, -3.419948, 0, 1, 0.7490196, 1,
-0.1153559, 0.2538829, -0.04132841, 0, 1, 0.7529412, 1,
-0.1138233, -1.791931, -5.759017, 0, 1, 0.7607843, 1,
-0.111249, 0.2604668, -0.05311374, 0, 1, 0.7647059, 1,
-0.1073804, -0.6693566, -2.769761, 0, 1, 0.772549, 1,
-0.1058673, 1.237692, 0.4855535, 0, 1, 0.7764706, 1,
-0.0979722, 0.9756495, 1.688453, 0, 1, 0.7843137, 1,
-0.09582952, -1.127202, -1.896254, 0, 1, 0.7882353, 1,
-0.08978054, 1.482815, 0.1019608, 0, 1, 0.7960784, 1,
-0.08953541, 0.3699421, -0.2734661, 0, 1, 0.8039216, 1,
-0.08908918, 0.2459544, 1.147612, 0, 1, 0.8078431, 1,
-0.08447548, -0.06101967, -2.349715, 0, 1, 0.8156863, 1,
-0.08267369, 0.7056741, -1.290141, 0, 1, 0.8196079, 1,
-0.08182139, 0.1576053, 0.9079197, 0, 1, 0.827451, 1,
-0.08052804, -1.418029, -0.5535501, 0, 1, 0.8313726, 1,
-0.07984511, -0.5225585, -2.953867, 0, 1, 0.8392157, 1,
-0.07626875, -0.1065528, -2.911155, 0, 1, 0.8431373, 1,
-0.07217102, 0.809558, -1.977339, 0, 1, 0.8509804, 1,
-0.06906627, -0.7515453, -3.32327, 0, 1, 0.854902, 1,
-0.06429366, -0.8208696, -3.198216, 0, 1, 0.8627451, 1,
-0.0641145, 0.8231126, -0.6816499, 0, 1, 0.8666667, 1,
-0.05795051, -0.4552859, -3.561236, 0, 1, 0.8745098, 1,
-0.05309668, -2.541635, -4.554354, 0, 1, 0.8784314, 1,
-0.05085758, 1.143615, -0.0714473, 0, 1, 0.8862745, 1,
-0.04990506, -0.5045558, -4.274122, 0, 1, 0.8901961, 1,
-0.04835619, -0.6878361, -2.129545, 0, 1, 0.8980392, 1,
-0.04754536, 0.05690433, 0.6781287, 0, 1, 0.9058824, 1,
-0.04735718, -1.042709, -2.376709, 0, 1, 0.9098039, 1,
-0.04691581, -0.07254941, -3.289608, 0, 1, 0.9176471, 1,
-0.04561438, -0.09494471, -1.157736, 0, 1, 0.9215686, 1,
-0.04387607, 1.443529, 0.2798333, 0, 1, 0.9294118, 1,
-0.0380394, 0.5881005, -0.7924752, 0, 1, 0.9333333, 1,
-0.03690123, -1.704895, -3.784778, 0, 1, 0.9411765, 1,
-0.03466885, -0.05524573, -4.345799, 0, 1, 0.945098, 1,
-0.0333999, -0.7297258, -3.078449, 0, 1, 0.9529412, 1,
-0.02371169, -0.273513, -3.010256, 0, 1, 0.9568627, 1,
-0.02281719, 1.43698, 1.466318, 0, 1, 0.9647059, 1,
-0.01962801, 0.2984315, -1.807496, 0, 1, 0.9686275, 1,
-0.01568357, -1.370851, -0.9536351, 0, 1, 0.9764706, 1,
-0.008222695, -2.5832, -2.30771, 0, 1, 0.9803922, 1,
-0.006725871, 0.07957071, -0.4792942, 0, 1, 0.9882353, 1,
0.0005539945, -0.5170121, 3.502628, 0, 1, 0.9921569, 1,
0.003073175, -0.1099081, 3.767121, 0, 1, 1, 1,
0.005198978, 0.5605668, -0.1211821, 0, 0.9921569, 1, 1,
0.006837316, 0.0879657, -1.224765, 0, 0.9882353, 1, 1,
0.007334622, 0.8311661, -0.91456, 0, 0.9803922, 1, 1,
0.01143288, -1.924196, 2.577785, 0, 0.9764706, 1, 1,
0.01275766, 0.2818906, 0.3192974, 0, 0.9686275, 1, 1,
0.01350953, -0.7717161, 2.35608, 0, 0.9647059, 1, 1,
0.0190269, 0.3317116, -0.215223, 0, 0.9568627, 1, 1,
0.02209943, 2.507273, 2.69053, 0, 0.9529412, 1, 1,
0.02337584, 0.01816185, -0.05743916, 0, 0.945098, 1, 1,
0.02424758, 0.3970559, 1.301925, 0, 0.9411765, 1, 1,
0.02439469, 1.031668, -0.3645433, 0, 0.9333333, 1, 1,
0.02558304, 0.622454, -0.2943311, 0, 0.9294118, 1, 1,
0.02595374, -0.2937204, 4.429671, 0, 0.9215686, 1, 1,
0.02803849, -1.414887, 3.414171, 0, 0.9176471, 1, 1,
0.03196936, 0.989448, 0.05876072, 0, 0.9098039, 1, 1,
0.03274445, -0.8417883, 2.085732, 0, 0.9058824, 1, 1,
0.03527017, 0.7649181, 0.1261307, 0, 0.8980392, 1, 1,
0.04001579, -0.08048912, 2.647856, 0, 0.8901961, 1, 1,
0.04247463, -0.07742148, 1.574748, 0, 0.8862745, 1, 1,
0.04519376, -0.3566604, 2.300898, 0, 0.8784314, 1, 1,
0.0536338, 0.5258396, 0.5166172, 0, 0.8745098, 1, 1,
0.0558848, 0.5117614, 0.04817537, 0, 0.8666667, 1, 1,
0.05685056, 0.2471195, 0.9101951, 0, 0.8627451, 1, 1,
0.0586241, -0.2018095, 1.939632, 0, 0.854902, 1, 1,
0.06165005, 2.047733, -1.744406, 0, 0.8509804, 1, 1,
0.0636174, -1.089803, 2.270397, 0, 0.8431373, 1, 1,
0.06375863, -0.3276368, 3.831067, 0, 0.8392157, 1, 1,
0.06662473, -1.299911, 3.024463, 0, 0.8313726, 1, 1,
0.06794778, -1.697546, 4.136198, 0, 0.827451, 1, 1,
0.06875239, -1.057944, 4.501475, 0, 0.8196079, 1, 1,
0.07746066, 0.8851087, -0.868627, 0, 0.8156863, 1, 1,
0.08995757, 1.471924, 0.6274669, 0, 0.8078431, 1, 1,
0.09287444, 2.049678, 0.01131751, 0, 0.8039216, 1, 1,
0.09370472, -1.747461, 5.113975, 0, 0.7960784, 1, 1,
0.09463499, 1.248594, -0.1751611, 0, 0.7882353, 1, 1,
0.09488773, -0.8894466, 5.414542, 0, 0.7843137, 1, 1,
0.09573371, 1.847397, -0.548723, 0, 0.7764706, 1, 1,
0.09603363, -1.194899, 4.065322, 0, 0.772549, 1, 1,
0.09911768, 1.387246, -0.6998243, 0, 0.7647059, 1, 1,
0.09970014, 0.2236964, -1.388888, 0, 0.7607843, 1, 1,
0.1001264, -1.553384, 3.948261, 0, 0.7529412, 1, 1,
0.1021529, 0.05749729, 2.134751, 0, 0.7490196, 1, 1,
0.1079886, -1.059986, 2.000897, 0, 0.7411765, 1, 1,
0.1081802, -0.1430714, 2.205617, 0, 0.7372549, 1, 1,
0.1104211, -0.8290781, 2.159999, 0, 0.7294118, 1, 1,
0.1140647, -2.262409, 4.527556, 0, 0.7254902, 1, 1,
0.1143595, 0.03037838, 2.793605, 0, 0.7176471, 1, 1,
0.1160014, 0.2091345, -0.07162202, 0, 0.7137255, 1, 1,
0.1216919, 0.6500503, 0.4744928, 0, 0.7058824, 1, 1,
0.1262398, 1.178896, -0.5649626, 0, 0.6980392, 1, 1,
0.1306729, -0.4603021, 2.559975, 0, 0.6941177, 1, 1,
0.1309768, 1.308275, 1.889796, 0, 0.6862745, 1, 1,
0.1334741, 1.517606, -2.097707, 0, 0.682353, 1, 1,
0.1412989, -1.397497, 2.324196, 0, 0.6745098, 1, 1,
0.1445633, -0.5135568, 2.825104, 0, 0.6705883, 1, 1,
0.1462046, 0.9295665, 0.1594218, 0, 0.6627451, 1, 1,
0.1463256, 1.008523, 0.05605528, 0, 0.6588235, 1, 1,
0.1475742, -0.2289052, 1.296674, 0, 0.6509804, 1, 1,
0.1500156, 2.196779, 1.061401, 0, 0.6470588, 1, 1,
0.1511626, 0.01811455, 0.8241239, 0, 0.6392157, 1, 1,
0.1538849, 0.03216908, 0.5333375, 0, 0.6352941, 1, 1,
0.155047, 0.08619735, 2.214572, 0, 0.627451, 1, 1,
0.156044, 0.1704656, 1.455465, 0, 0.6235294, 1, 1,
0.1570054, 1.797669, 1.597585, 0, 0.6156863, 1, 1,
0.1588027, 2.100015, -0.9587533, 0, 0.6117647, 1, 1,
0.1648354, 2.002079, -0.05683957, 0, 0.6039216, 1, 1,
0.1678206, 0.2974549, -0.6699627, 0, 0.5960785, 1, 1,
0.1693159, 0.7074304, 1.157203, 0, 0.5921569, 1, 1,
0.1794132, -0.4045218, 5.071018, 0, 0.5843138, 1, 1,
0.1795224, 1.561607, 0.4234833, 0, 0.5803922, 1, 1,
0.1810224, -1.301471, 3.860795, 0, 0.572549, 1, 1,
0.1827887, 2.340004, 0.4412644, 0, 0.5686275, 1, 1,
0.1917144, 1.070654, 0.4395235, 0, 0.5607843, 1, 1,
0.1921846, 0.738757, 0.4878449, 0, 0.5568628, 1, 1,
0.1990788, -2.062495, 3.011423, 0, 0.5490196, 1, 1,
0.199531, 0.08962463, 2.892022, 0, 0.5450981, 1, 1,
0.2017189, -0.434276, 3.392697, 0, 0.5372549, 1, 1,
0.2032614, -0.9785934, 0.3813548, 0, 0.5333334, 1, 1,
0.2045486, -1.078463, 1.724723, 0, 0.5254902, 1, 1,
0.2106887, 1.373221, 0.04645086, 0, 0.5215687, 1, 1,
0.2134877, 0.5599773, 0.5255251, 0, 0.5137255, 1, 1,
0.2138832, 0.8970045, 0.9367182, 0, 0.509804, 1, 1,
0.2139425, -2.739269, 2.929864, 0, 0.5019608, 1, 1,
0.2151956, 0.1714199, -0.1729964, 0, 0.4941176, 1, 1,
0.2192577, -1.476686, 4.842515, 0, 0.4901961, 1, 1,
0.2241111, 2.753579, -0.1780131, 0, 0.4823529, 1, 1,
0.2275608, 0.2628106, 2.372037, 0, 0.4784314, 1, 1,
0.2319019, -0.03308166, 1.341795, 0, 0.4705882, 1, 1,
0.2331357, 1.315152, -2.347394, 0, 0.4666667, 1, 1,
0.2357828, 0.1929047, 1.923076, 0, 0.4588235, 1, 1,
0.235863, 0.427354, 2.111841, 0, 0.454902, 1, 1,
0.2388901, 1.019148, 0.4273252, 0, 0.4470588, 1, 1,
0.2402387, 0.602295, 0.9706429, 0, 0.4431373, 1, 1,
0.2459127, -0.232847, 3.86351, 0, 0.4352941, 1, 1,
0.2480673, 0.506021, 0.311681, 0, 0.4313726, 1, 1,
0.2487691, -0.03039585, 2.638269, 0, 0.4235294, 1, 1,
0.2506983, 1.948756, -0.3590286, 0, 0.4196078, 1, 1,
0.2543805, -1.28713, 4.179691, 0, 0.4117647, 1, 1,
0.2565395, 0.4487487, 0.888629, 0, 0.4078431, 1, 1,
0.2639261, -1.104535, 4.031895, 0, 0.4, 1, 1,
0.2643655, -0.4176898, 0.835878, 0, 0.3921569, 1, 1,
0.2652783, -1.684811, 2.664668, 0, 0.3882353, 1, 1,
0.2661876, 0.827527, -0.4731556, 0, 0.3803922, 1, 1,
0.2692524, -0.86689, 2.840513, 0, 0.3764706, 1, 1,
0.2706532, -0.6923268, 1.788359, 0, 0.3686275, 1, 1,
0.2807477, 0.4396932, -0.8282233, 0, 0.3647059, 1, 1,
0.2809049, -0.2842171, 1.320539, 0, 0.3568628, 1, 1,
0.2838402, -0.1468615, 1.447967, 0, 0.3529412, 1, 1,
0.2867808, -0.3981443, 4.199419, 0, 0.345098, 1, 1,
0.2936369, 0.6413508, -0.2291251, 0, 0.3411765, 1, 1,
0.2954244, 1.203505, -0.06760498, 0, 0.3333333, 1, 1,
0.3025563, 0.02322508, 0.9664434, 0, 0.3294118, 1, 1,
0.3071442, -0.3578121, 1.107818, 0, 0.3215686, 1, 1,
0.3073524, -2.601415, 2.655185, 0, 0.3176471, 1, 1,
0.3080843, -2.267968, 2.895051, 0, 0.3098039, 1, 1,
0.3084612, -0.72873, 4.589991, 0, 0.3058824, 1, 1,
0.3091137, -1.060519, 1.887722, 0, 0.2980392, 1, 1,
0.3195481, -1.649925, 2.361785, 0, 0.2901961, 1, 1,
0.3204612, 0.6707767, -0.4423147, 0, 0.2862745, 1, 1,
0.3228336, -0.07891662, 1.64789, 0, 0.2784314, 1, 1,
0.323782, 0.3770492, 2.151899, 0, 0.2745098, 1, 1,
0.323966, -0.4744947, 2.450703, 0, 0.2666667, 1, 1,
0.3267619, 2.208109, 0.3032685, 0, 0.2627451, 1, 1,
0.3342315, 0.4949291, 0.1613615, 0, 0.254902, 1, 1,
0.3344218, 0.02594157, 0.952466, 0, 0.2509804, 1, 1,
0.3397259, -1.478899, 2.327042, 0, 0.2431373, 1, 1,
0.3407251, 0.2042139, 1.241995, 0, 0.2392157, 1, 1,
0.3413532, 0.9161385, 1.691829, 0, 0.2313726, 1, 1,
0.3425276, 0.8004655, 2.329296, 0, 0.227451, 1, 1,
0.3452384, 0.6984053, 1.206045, 0, 0.2196078, 1, 1,
0.3478247, 1.795243, -0.1824069, 0, 0.2156863, 1, 1,
0.3480634, -1.351938, 2.955296, 0, 0.2078431, 1, 1,
0.3568209, 0.8360172, -0.1019374, 0, 0.2039216, 1, 1,
0.3584626, 1.164896, -0.5369735, 0, 0.1960784, 1, 1,
0.3591051, 1.193786, -0.4774323, 0, 0.1882353, 1, 1,
0.3626463, 1.114571, 1.388737, 0, 0.1843137, 1, 1,
0.3641454, 2.046663, 0.9471426, 0, 0.1764706, 1, 1,
0.3642085, -0.1652792, 3.026033, 0, 0.172549, 1, 1,
0.3673772, 1.350267, 0.6344773, 0, 0.1647059, 1, 1,
0.3683071, -1.52068, 4.454969, 0, 0.1607843, 1, 1,
0.3703196, 1.013648, -0.06060763, 0, 0.1529412, 1, 1,
0.3709754, 0.09662402, 3.529843, 0, 0.1490196, 1, 1,
0.3714833, -1.795954, 1.509312, 0, 0.1411765, 1, 1,
0.3752658, -0.6490654, 1.907361, 0, 0.1372549, 1, 1,
0.3758762, -0.2933697, 2.12405, 0, 0.1294118, 1, 1,
0.3769093, -0.1375217, 2.008183, 0, 0.1254902, 1, 1,
0.3779897, 0.1505533, 1.599843, 0, 0.1176471, 1, 1,
0.379934, -0.06585044, 1.215827, 0, 0.1137255, 1, 1,
0.3807955, 1.325555, 0.2422793, 0, 0.1058824, 1, 1,
0.383016, -0.7927412, 2.804482, 0, 0.09803922, 1, 1,
0.3838337, 0.5557958, 0.4910114, 0, 0.09411765, 1, 1,
0.3851466, -1.03584, 2.494466, 0, 0.08627451, 1, 1,
0.3852731, 1.423776, -0.8414208, 0, 0.08235294, 1, 1,
0.3855778, -0.9805093, 2.525046, 0, 0.07450981, 1, 1,
0.3884182, 0.4261393, 0.1693256, 0, 0.07058824, 1, 1,
0.3911042, -0.06460693, 0.501888, 0, 0.0627451, 1, 1,
0.3949881, -1.126404, 2.563715, 0, 0.05882353, 1, 1,
0.3974679, 0.2186001, 2.079756, 0, 0.05098039, 1, 1,
0.4038185, 1.039746, 0.004616141, 0, 0.04705882, 1, 1,
0.4060456, -0.7440704, 3.342648, 0, 0.03921569, 1, 1,
0.4087754, -1.551272, 3.127043, 0, 0.03529412, 1, 1,
0.4102854, -0.423966, 4.535091, 0, 0.02745098, 1, 1,
0.4113487, -1.319328, 1.89112, 0, 0.02352941, 1, 1,
0.4124343, -0.02408334, 2.407597, 0, 0.01568628, 1, 1,
0.4208402, -1.122474, 1.301759, 0, 0.01176471, 1, 1,
0.4214486, 1.20292, 0.2690537, 0, 0.003921569, 1, 1,
0.4215657, 0.1033569, 1.383091, 0.003921569, 0, 1, 1,
0.4237375, -0.2121044, 3.040033, 0.007843138, 0, 1, 1,
0.4399959, 0.1008687, 0.8968586, 0.01568628, 0, 1, 1,
0.4436669, -0.8522294, 4.122547, 0.01960784, 0, 1, 1,
0.4452209, 0.5652446, 1.754831, 0.02745098, 0, 1, 1,
0.4542418, 1.764519, -0.3680442, 0.03137255, 0, 1, 1,
0.455358, 0.05483053, 1.898089, 0.03921569, 0, 1, 1,
0.4583467, 0.8734877, -0.5390823, 0.04313726, 0, 1, 1,
0.4583583, -0.8776851, 3.372034, 0.05098039, 0, 1, 1,
0.4585178, -0.2543017, 0.4657459, 0.05490196, 0, 1, 1,
0.4633373, 1.452407, -1.572829, 0.0627451, 0, 1, 1,
0.4682586, 0.1125168, -0.8237535, 0.06666667, 0, 1, 1,
0.4689493, 0.8485348, 1.271294, 0.07450981, 0, 1, 1,
0.4701808, 0.399868, 0.1759449, 0.07843138, 0, 1, 1,
0.4744627, -1.267108, 4.274026, 0.08627451, 0, 1, 1,
0.4749139, 0.8182271, 0.07146221, 0.09019608, 0, 1, 1,
0.4767512, -1.382102, 1.562203, 0.09803922, 0, 1, 1,
0.4805564, 0.6577498, -0.399239, 0.1058824, 0, 1, 1,
0.4817998, 0.1774158, 0.6094307, 0.1098039, 0, 1, 1,
0.4841208, 0.2815477, 1.41429, 0.1176471, 0, 1, 1,
0.4896927, 0.6496212, -0.4859042, 0.1215686, 0, 1, 1,
0.4898274, 2.158982, 0.505091, 0.1294118, 0, 1, 1,
0.491311, 1.265187, -1.757344, 0.1333333, 0, 1, 1,
0.4928399, -0.02190896, 1.59891, 0.1411765, 0, 1, 1,
0.49638, 1.078971, 0.3505507, 0.145098, 0, 1, 1,
0.5009745, 0.3046528, 2.332049, 0.1529412, 0, 1, 1,
0.5010932, -0.680064, 1.569716, 0.1568628, 0, 1, 1,
0.5020919, -0.5952552, 3.206297, 0.1647059, 0, 1, 1,
0.5045933, 1.980145, -0.3012859, 0.1686275, 0, 1, 1,
0.5064359, 1.738611, 1.0552, 0.1764706, 0, 1, 1,
0.5137071, 0.1978672, 1.010306, 0.1803922, 0, 1, 1,
0.5143645, -0.3284479, 3.322692, 0.1882353, 0, 1, 1,
0.5149139, 1.509897, -0.590649, 0.1921569, 0, 1, 1,
0.515286, -1.264121, -0.02446957, 0.2, 0, 1, 1,
0.5199435, 0.7635918, 1.396552, 0.2078431, 0, 1, 1,
0.5215422, -1.303127, 3.710972, 0.2117647, 0, 1, 1,
0.521764, -0.4581772, 1.12891, 0.2196078, 0, 1, 1,
0.5240088, -1.313347, 2.477279, 0.2235294, 0, 1, 1,
0.5259565, 0.6263642, -0.5937573, 0.2313726, 0, 1, 1,
0.5274565, 2.396888, 0.597236, 0.2352941, 0, 1, 1,
0.528556, -1.281525, 2.374215, 0.2431373, 0, 1, 1,
0.5325122, 0.2660599, 0.1239245, 0.2470588, 0, 1, 1,
0.5332689, -0.2578973, 2.516606, 0.254902, 0, 1, 1,
0.5346575, -0.7479318, 1.581773, 0.2588235, 0, 1, 1,
0.5362823, 1.007427, -0.6358379, 0.2666667, 0, 1, 1,
0.5383325, 1.004972, 0.6124609, 0.2705882, 0, 1, 1,
0.5414255, 0.06723203, 1.793423, 0.2784314, 0, 1, 1,
0.5418861, -0.9247655, 2.131739, 0.282353, 0, 1, 1,
0.5429044, -0.5065116, 2.279552, 0.2901961, 0, 1, 1,
0.5452964, 1.46369, 0.5426438, 0.2941177, 0, 1, 1,
0.5459698, -1.818811, 1.386624, 0.3019608, 0, 1, 1,
0.5479001, -0.6900197, 3.427544, 0.3098039, 0, 1, 1,
0.555595, -0.8856823, 4.035839, 0.3137255, 0, 1, 1,
0.5561233, -0.6310467, 2.5902, 0.3215686, 0, 1, 1,
0.5567875, 0.9799072, 0.7153792, 0.3254902, 0, 1, 1,
0.5580402, -1.571838, 3.113814, 0.3333333, 0, 1, 1,
0.5600314, -0.164296, 2.217641, 0.3372549, 0, 1, 1,
0.5685559, 0.643304, 1.874017, 0.345098, 0, 1, 1,
0.5686265, 0.5387666, 1.495739, 0.3490196, 0, 1, 1,
0.5694813, 0.3008909, 0.5059934, 0.3568628, 0, 1, 1,
0.5702516, 1.186387, 0.9165323, 0.3607843, 0, 1, 1,
0.5736579, -0.6709909, 3.16502, 0.3686275, 0, 1, 1,
0.5738792, -0.2926625, 2.037235, 0.372549, 0, 1, 1,
0.5742401, 0.2841065, 1.881909, 0.3803922, 0, 1, 1,
0.5772611, -0.0274808, 2.004215, 0.3843137, 0, 1, 1,
0.5804714, 1.053805, 1.103849, 0.3921569, 0, 1, 1,
0.5938348, -1.64058, 2.893703, 0.3960784, 0, 1, 1,
0.5998377, -0.05916703, 1.902664, 0.4039216, 0, 1, 1,
0.6000436, -0.978715, 1.060839, 0.4117647, 0, 1, 1,
0.601985, 1.305368, 1.570948, 0.4156863, 0, 1, 1,
0.6025047, -0.3235654, 1.028903, 0.4235294, 0, 1, 1,
0.6041676, 1.133064, 0.06335826, 0.427451, 0, 1, 1,
0.6076134, -0.708793, 2.695584, 0.4352941, 0, 1, 1,
0.6158034, 0.3059987, 2.691153, 0.4392157, 0, 1, 1,
0.6208975, 0.1693035, 1.563306, 0.4470588, 0, 1, 1,
0.6209967, -0.3280491, 2.373451, 0.4509804, 0, 1, 1,
0.6216664, 0.4859363, -0.2637129, 0.4588235, 0, 1, 1,
0.6240388, -0.5423854, 2.421973, 0.4627451, 0, 1, 1,
0.6269626, 1.315432, -0.44956, 0.4705882, 0, 1, 1,
0.6292719, 1.993954, 1.13481, 0.4745098, 0, 1, 1,
0.6300346, -0.8677862, 3.599705, 0.4823529, 0, 1, 1,
0.6328678, 0.2694252, 2.326104, 0.4862745, 0, 1, 1,
0.6348194, 0.2207115, 0.5435039, 0.4941176, 0, 1, 1,
0.6350945, 0.02070964, -0.2398631, 0.5019608, 0, 1, 1,
0.6352566, 0.340638, 1.514124, 0.5058824, 0, 1, 1,
0.6360188, -0.5322797, 2.428451, 0.5137255, 0, 1, 1,
0.6391473, -0.06456728, 1.418612, 0.5176471, 0, 1, 1,
0.6475003, -0.1757336, 1.589736, 0.5254902, 0, 1, 1,
0.6571409, 1.368453, 0.4982298, 0.5294118, 0, 1, 1,
0.6622698, -0.07919381, 2.280165, 0.5372549, 0, 1, 1,
0.6689705, 2.073165, -0.09420925, 0.5411765, 0, 1, 1,
0.6719297, 0.4890397, -0.2278464, 0.5490196, 0, 1, 1,
0.6766222, 0.5659313, 0.09708474, 0.5529412, 0, 1, 1,
0.683196, -0.2539514, 2.290212, 0.5607843, 0, 1, 1,
0.684602, 0.6384078, 0.7894174, 0.5647059, 0, 1, 1,
0.690172, 0.8966731, 0.002553332, 0.572549, 0, 1, 1,
0.6941433, 0.6304896, 0.9280584, 0.5764706, 0, 1, 1,
0.6956788, 0.9258076, 0.9971283, 0.5843138, 0, 1, 1,
0.7001986, 0.07148024, -0.03353822, 0.5882353, 0, 1, 1,
0.700313, -0.8867329, 3.309528, 0.5960785, 0, 1, 1,
0.7024533, -1.478781, 3.213903, 0.6039216, 0, 1, 1,
0.7043274, 0.4504328, -0.4262942, 0.6078432, 0, 1, 1,
0.7060029, -1.035563, 4.010386, 0.6156863, 0, 1, 1,
0.7070957, -0.9290591, 3.64224, 0.6196079, 0, 1, 1,
0.7075917, 2.107998, -2.030055, 0.627451, 0, 1, 1,
0.7123213, -1.246902, 3.003275, 0.6313726, 0, 1, 1,
0.7125462, -1.203215, 2.745705, 0.6392157, 0, 1, 1,
0.7140283, -1.586651, 3.201341, 0.6431373, 0, 1, 1,
0.7166899, 1.202133, -0.4474838, 0.6509804, 0, 1, 1,
0.7181874, 0.4471737, 0.349208, 0.654902, 0, 1, 1,
0.7182066, 2.642278, 0.3530437, 0.6627451, 0, 1, 1,
0.7195877, -0.9515098, 2.451058, 0.6666667, 0, 1, 1,
0.7242535, -1.355588, 2.41221, 0.6745098, 0, 1, 1,
0.7306321, -0.3339342, 1.136896, 0.6784314, 0, 1, 1,
0.730794, 0.5422398, 1.193798, 0.6862745, 0, 1, 1,
0.7335867, 0.4658002, 0.8931493, 0.6901961, 0, 1, 1,
0.739339, -0.5883685, 1.452038, 0.6980392, 0, 1, 1,
0.741064, 0.1238713, 1.211552, 0.7058824, 0, 1, 1,
0.749027, -1.384658, 2.697737, 0.7098039, 0, 1, 1,
0.7509673, 1.541449, -0.6918205, 0.7176471, 0, 1, 1,
0.7516845, -0.233809, 1.726825, 0.7215686, 0, 1, 1,
0.759329, -0.01447319, 2.091096, 0.7294118, 0, 1, 1,
0.7682413, -0.1075637, 3.180867, 0.7333333, 0, 1, 1,
0.7723063, 0.8714505, 1.933303, 0.7411765, 0, 1, 1,
0.7763999, -0.7775617, 1.503216, 0.7450981, 0, 1, 1,
0.7786798, -2.219021, 2.219217, 0.7529412, 0, 1, 1,
0.7809853, -0.5602265, 2.226098, 0.7568628, 0, 1, 1,
0.7817716, 1.938092, 0.574376, 0.7647059, 0, 1, 1,
0.7893559, 0.5427973, -0.6873664, 0.7686275, 0, 1, 1,
0.790244, 0.6594511, 0.3711975, 0.7764706, 0, 1, 1,
0.7910103, 1.402427, 1.36592, 0.7803922, 0, 1, 1,
0.7962414, -0.1129773, 2.960408, 0.7882353, 0, 1, 1,
0.799629, -0.7531821, 2.532798, 0.7921569, 0, 1, 1,
0.8000933, 0.4936537, 0.0660598, 0.8, 0, 1, 1,
0.810546, -0.7724129, 1.52096, 0.8078431, 0, 1, 1,
0.8170428, -1.018615, 2.297606, 0.8117647, 0, 1, 1,
0.8173746, 0.6172296, 1.115861, 0.8196079, 0, 1, 1,
0.8179112, 0.07009116, 5.800581, 0.8235294, 0, 1, 1,
0.8251529, 0.1325915, 1.83596, 0.8313726, 0, 1, 1,
0.8308887, 1.482238, 0.6175808, 0.8352941, 0, 1, 1,
0.8354042, -0.01738519, 0.1515077, 0.8431373, 0, 1, 1,
0.8377754, 1.365746, 0.4075626, 0.8470588, 0, 1, 1,
0.8513234, 0.2373252, 3.014612, 0.854902, 0, 1, 1,
0.8519294, -1.343186, 2.377957, 0.8588235, 0, 1, 1,
0.8549751, -2.097236, 1.678171, 0.8666667, 0, 1, 1,
0.8556781, -0.03240391, 2.209096, 0.8705882, 0, 1, 1,
0.8558508, -0.5016218, 2.547184, 0.8784314, 0, 1, 1,
0.8639433, -0.05583425, 1.5028, 0.8823529, 0, 1, 1,
0.8736846, -0.3014481, 0.6223114, 0.8901961, 0, 1, 1,
0.8754176, 1.123238, 1.007048, 0.8941177, 0, 1, 1,
0.8755745, -1.642333, 2.761994, 0.9019608, 0, 1, 1,
0.8766915, -0.7790897, 2.781591, 0.9098039, 0, 1, 1,
0.8778922, -0.692764, 3.018543, 0.9137255, 0, 1, 1,
0.8788508, -1.659321, 4.051786, 0.9215686, 0, 1, 1,
0.8859792, 0.3169222, 1.043198, 0.9254902, 0, 1, 1,
0.8867233, -0.5382792, 2.273514, 0.9333333, 0, 1, 1,
0.8937817, 0.5466434, 0.06221459, 0.9372549, 0, 1, 1,
0.9019431, 0.3842001, 0.2763348, 0.945098, 0, 1, 1,
0.9075543, 1.127315, 2.891063, 0.9490196, 0, 1, 1,
0.9086108, 0.3595107, 2.015487, 0.9568627, 0, 1, 1,
0.9129115, -2.007775, 2.669225, 0.9607843, 0, 1, 1,
0.9133671, -0.6739823, 2.498915, 0.9686275, 0, 1, 1,
0.9137854, 0.995009, 0.2515089, 0.972549, 0, 1, 1,
0.9189406, 0.9547427, -0.6645163, 0.9803922, 0, 1, 1,
0.9320676, -0.6392432, 2.949242, 0.9843137, 0, 1, 1,
0.9323683, -1.690859, 0.8814274, 0.9921569, 0, 1, 1,
0.93362, -0.9597284, 1.89445, 0.9960784, 0, 1, 1,
0.9359881, 1.133778, 0.2082849, 1, 0, 0.9960784, 1,
0.9364043, -0.6309444, 2.636708, 1, 0, 0.9882353, 1,
0.944699, 1.384882, 1.589346, 1, 0, 0.9843137, 1,
0.9448023, -0.4481991, 2.303316, 1, 0, 0.9764706, 1,
0.9456961, -0.7259578, 2.368623, 1, 0, 0.972549, 1,
0.9485848, 0.06214618, 0.3914574, 1, 0, 0.9647059, 1,
0.9496334, 1.032411, 1.038979, 1, 0, 0.9607843, 1,
0.9552086, 1.596243, 0.2817136, 1, 0, 0.9529412, 1,
0.9560677, -1.509082, 2.908347, 1, 0, 0.9490196, 1,
0.9703631, 0.4287679, 1.526201, 1, 0, 0.9411765, 1,
0.9774595, 1.347718, 1.375987, 1, 0, 0.9372549, 1,
0.9827661, 0.5053712, 2.150733, 1, 0, 0.9294118, 1,
0.9882649, 0.2880127, 2.569466, 1, 0, 0.9254902, 1,
0.9952994, -0.6286982, 0.7984098, 1, 0, 0.9176471, 1,
0.9968057, -0.5472651, 2.678042, 1, 0, 0.9137255, 1,
0.9991944, 0.6214787, 0.3494264, 1, 0, 0.9058824, 1,
1.014025, 0.9716823, 1.904019, 1, 0, 0.9019608, 1,
1.023857, -0.23935, 1.22018, 1, 0, 0.8941177, 1,
1.02418, 1.43192, 0.04232243, 1, 0, 0.8862745, 1,
1.037236, -1.952952, 2.017497, 1, 0, 0.8823529, 1,
1.041674, 0.328202, 1.823748, 1, 0, 0.8745098, 1,
1.051494, -0.06047086, 1.874792, 1, 0, 0.8705882, 1,
1.054082, -2.192339, 1.162136, 1, 0, 0.8627451, 1,
1.055019, 0.01822494, 0.3519517, 1, 0, 0.8588235, 1,
1.055462, 0.9256828, -0.162952, 1, 0, 0.8509804, 1,
1.056896, -1.849638, 4.218025, 1, 0, 0.8470588, 1,
1.059102, 0.1004227, 2.437424, 1, 0, 0.8392157, 1,
1.062858, 1.50303, 0.9462164, 1, 0, 0.8352941, 1,
1.076815, -1.182943, 3.091288, 1, 0, 0.827451, 1,
1.081095, -1.611183, 2.986965, 1, 0, 0.8235294, 1,
1.085825, -0.6812019, 3.066198, 1, 0, 0.8156863, 1,
1.087191, -0.0171212, 0.803488, 1, 0, 0.8117647, 1,
1.099673, -0.1513245, 1.74755, 1, 0, 0.8039216, 1,
1.103775, -1.333869, 2.877489, 1, 0, 0.7960784, 1,
1.103888, 0.8230805, 2.126065, 1, 0, 0.7921569, 1,
1.105564, 1.016737, 2.653286, 1, 0, 0.7843137, 1,
1.118308, 1.10764, 0.2932382, 1, 0, 0.7803922, 1,
1.120993, 0.154888, 2.768798, 1, 0, 0.772549, 1,
1.126641, -1.001182, 2.350885, 1, 0, 0.7686275, 1,
1.144788, 0.681595, -1.425277, 1, 0, 0.7607843, 1,
1.146379, -0.3364359, 3.312439, 1, 0, 0.7568628, 1,
1.147439, -0.3983786, 2.079933, 1, 0, 0.7490196, 1,
1.148106, -0.4300746, 2.116522, 1, 0, 0.7450981, 1,
1.155816, 1.251363, -0.0202273, 1, 0, 0.7372549, 1,
1.157543, -0.6253589, -0.803664, 1, 0, 0.7333333, 1,
1.157588, 0.1357044, 0.3265721, 1, 0, 0.7254902, 1,
1.172562, -0.9991255, 2.538314, 1, 0, 0.7215686, 1,
1.183133, 0.1360632, 2.384979, 1, 0, 0.7137255, 1,
1.197943, -2.029664, 1.724995, 1, 0, 0.7098039, 1,
1.201618, 0.2480931, 1.566184, 1, 0, 0.7019608, 1,
1.202223, -0.2410274, 1.290672, 1, 0, 0.6941177, 1,
1.203275, 0.4556468, 1.275399, 1, 0, 0.6901961, 1,
1.205125, 0.2107897, 0.7540752, 1, 0, 0.682353, 1,
1.208255, 1.101802, 1.925019, 1, 0, 0.6784314, 1,
1.21071, 0.3550304, 2.581973, 1, 0, 0.6705883, 1,
1.21894, -0.1271511, 2.783698, 1, 0, 0.6666667, 1,
1.219482, 0.2035527, 1.340366, 1, 0, 0.6588235, 1,
1.230457, 0.9757298, 1.663062, 1, 0, 0.654902, 1,
1.23136, 0.413218, -0.4878419, 1, 0, 0.6470588, 1,
1.243959, 0.1408212, 1.623812, 1, 0, 0.6431373, 1,
1.248607, -0.2697622, 2.998122, 1, 0, 0.6352941, 1,
1.260553, 1.175065, -0.4036299, 1, 0, 0.6313726, 1,
1.262448, -1.046739, 2.849048, 1, 0, 0.6235294, 1,
1.265776, -0.5292528, 2.193877, 1, 0, 0.6196079, 1,
1.267305, 0.01860625, 1.007314, 1, 0, 0.6117647, 1,
1.272933, 0.1105936, 0.8494747, 1, 0, 0.6078432, 1,
1.274572, 1.420835, 0.9402515, 1, 0, 0.6, 1,
1.276431, -0.04850026, 1.203167, 1, 0, 0.5921569, 1,
1.276477, -0.6504892, 3.113358, 1, 0, 0.5882353, 1,
1.283191, 0.8361678, 0.8581761, 1, 0, 0.5803922, 1,
1.291464, -0.3081429, 1.202117, 1, 0, 0.5764706, 1,
1.292091, 1.621802, 1.329575, 1, 0, 0.5686275, 1,
1.299353, 1.23239, 0.7446361, 1, 0, 0.5647059, 1,
1.304433, 0.3922242, 0.976928, 1, 0, 0.5568628, 1,
1.317255, -0.8103809, 1.141487, 1, 0, 0.5529412, 1,
1.323275, -0.09270208, 0.5430136, 1, 0, 0.5450981, 1,
1.326697, 1.428952, 0.979147, 1, 0, 0.5411765, 1,
1.335592, 0.4939375, 1.919402, 1, 0, 0.5333334, 1,
1.335873, -1.570681, 2.014616, 1, 0, 0.5294118, 1,
1.338595, -0.9530903, 3.214695, 1, 0, 0.5215687, 1,
1.34352, 0.5676789, 0.02792125, 1, 0, 0.5176471, 1,
1.367664, -1.64924, 2.219572, 1, 0, 0.509804, 1,
1.381376, -0.02374561, 2.561766, 1, 0, 0.5058824, 1,
1.383552, -0.8884499, 0.9157333, 1, 0, 0.4980392, 1,
1.384016, 2.355231, -0.5880846, 1, 0, 0.4901961, 1,
1.387669, -0.1993912, 1.707032, 1, 0, 0.4862745, 1,
1.392427, -0.2044753, 2.32334, 1, 0, 0.4784314, 1,
1.395276, 0.5026071, 1.39986, 1, 0, 0.4745098, 1,
1.400299, -0.9001873, 1.54375, 1, 0, 0.4666667, 1,
1.403576, 0.2049155, 2.298655, 1, 0, 0.4627451, 1,
1.413203, -1.725453, 1.588097, 1, 0, 0.454902, 1,
1.43295, 0.6679946, 1.233747, 1, 0, 0.4509804, 1,
1.436217, 0.2975843, -0.667981, 1, 0, 0.4431373, 1,
1.457713, 0.1886785, 1.913196, 1, 0, 0.4392157, 1,
1.475656, -1.164331, 4.169442, 1, 0, 0.4313726, 1,
1.478245, -0.4741606, 1.78083, 1, 0, 0.427451, 1,
1.478593, 0.5255426, 3.162628, 1, 0, 0.4196078, 1,
1.481372, 0.05877507, 0.0186178, 1, 0, 0.4156863, 1,
1.481413, -1.579378, 2.153327, 1, 0, 0.4078431, 1,
1.491866, 0.7356039, 0.1728872, 1, 0, 0.4039216, 1,
1.513773, -0.6046811, 2.044867, 1, 0, 0.3960784, 1,
1.525221, -0.1657132, 1.55566, 1, 0, 0.3882353, 1,
1.526884, -1.912719, 1.834818, 1, 0, 0.3843137, 1,
1.528318, -0.4801344, 0.9238721, 1, 0, 0.3764706, 1,
1.545378, -0.001278423, 1.319394, 1, 0, 0.372549, 1,
1.564729, -0.1424461, 0.869739, 1, 0, 0.3647059, 1,
1.566512, -0.07278598, 1.246196, 1, 0, 0.3607843, 1,
1.569683, 0.07219627, 0.2321062, 1, 0, 0.3529412, 1,
1.572406, -1.598324, 2.205174, 1, 0, 0.3490196, 1,
1.599909, 0.4821298, 0.3073017, 1, 0, 0.3411765, 1,
1.604365, 0.1990653, 1.656929, 1, 0, 0.3372549, 1,
1.609354, -1.432616, 3.5298, 1, 0, 0.3294118, 1,
1.620639, 0.7994596, 0.1518183, 1, 0, 0.3254902, 1,
1.641197, -0.6852465, 2.324065, 1, 0, 0.3176471, 1,
1.642617, -1.396333, 1.666809, 1, 0, 0.3137255, 1,
1.651832, -0.2657227, 2.317459, 1, 0, 0.3058824, 1,
1.656205, 0.080322, 0.6158558, 1, 0, 0.2980392, 1,
1.663262, -2.054126, 2.255459, 1, 0, 0.2941177, 1,
1.663588, 1.003661, 0.3646787, 1, 0, 0.2862745, 1,
1.680566, -0.01854809, 1.81937, 1, 0, 0.282353, 1,
1.683181, 1.001258, 0.03841962, 1, 0, 0.2745098, 1,
1.689777, -1.519809, 2.502007, 1, 0, 0.2705882, 1,
1.698345, 0.1023716, 0.2021306, 1, 0, 0.2627451, 1,
1.705383, -0.5233103, 2.491113, 1, 0, 0.2588235, 1,
1.709999, 2.099426, -0.5342607, 1, 0, 0.2509804, 1,
1.714379, -0.08500231, -0.2048474, 1, 0, 0.2470588, 1,
1.723271, -0.525104, 0.8444517, 1, 0, 0.2392157, 1,
1.729471, -1.260392, 0.6599205, 1, 0, 0.2352941, 1,
1.78317, -0.1893522, 0.9238879, 1, 0, 0.227451, 1,
1.789261, 1.161245, 2.358417, 1, 0, 0.2235294, 1,
1.803038, 0.159771, 0.6752215, 1, 0, 0.2156863, 1,
1.820568, 0.08487858, 0.6207392, 1, 0, 0.2117647, 1,
1.836333, 0.1032356, 2.494928, 1, 0, 0.2039216, 1,
1.842634, 1.187188, 1.475518, 1, 0, 0.1960784, 1,
1.860935, 1.868847, 1.464742, 1, 0, 0.1921569, 1,
1.866132, 1.101183, 1.142048, 1, 0, 0.1843137, 1,
1.866198, -1.223964, 1.081199, 1, 0, 0.1803922, 1,
1.867399, 0.2309255, 2.449012, 1, 0, 0.172549, 1,
1.907002, -1.089016, 3.263036, 1, 0, 0.1686275, 1,
1.920716, 0.8841232, 1.515351, 1, 0, 0.1607843, 1,
1.949497, -0.843848, 0.8402523, 1, 0, 0.1568628, 1,
1.950058, 0.08697306, 1.095348, 1, 0, 0.1490196, 1,
2.002641, 0.1685598, 1.331597, 1, 0, 0.145098, 1,
2.006169, -1.726606, 3.125262, 1, 0, 0.1372549, 1,
2.013888, 1.154156, 0.6588321, 1, 0, 0.1333333, 1,
2.020662, 0.411055, 0.1874261, 1, 0, 0.1254902, 1,
2.028318, 1.003917, 0.7392905, 1, 0, 0.1215686, 1,
2.042493, -0.04782649, 1.954963, 1, 0, 0.1137255, 1,
2.060839, 0.2981781, 0.3341105, 1, 0, 0.1098039, 1,
2.106471, -0.9489309, 2.261081, 1, 0, 0.1019608, 1,
2.141001, -0.7571351, 0.245011, 1, 0, 0.09411765, 1,
2.143979, 0.3849435, 0.4757022, 1, 0, 0.09019608, 1,
2.198206, -0.7530794, 2.001213, 1, 0, 0.08235294, 1,
2.204491, -0.7873895, 1.398133, 1, 0, 0.07843138, 1,
2.301605, -0.9061971, 0.6191158, 1, 0, 0.07058824, 1,
2.327556, 0.3429407, 2.010029, 1, 0, 0.06666667, 1,
2.352973, -0.1170761, 2.506281, 1, 0, 0.05882353, 1,
2.469562, -0.1390224, 1.779283, 1, 0, 0.05490196, 1,
2.497488, 0.2890281, 1.717807, 1, 0, 0.04705882, 1,
2.546791, 0.1808452, 1.08684, 1, 0, 0.04313726, 1,
2.591496, 1.062388, -0.4698057, 1, 0, 0.03529412, 1,
2.642573, 0.05438392, -0.1253692, 1, 0, 0.03137255, 1,
2.802075, -0.0376443, 3.467937, 1, 0, 0.02352941, 1,
2.818938, -1.331297, 3.313434, 1, 0, 0.01960784, 1,
2.900344, 0.5991437, 3.487711, 1, 0, 0.01176471, 1,
3.733586, 0.1593587, 0.4403946, 1, 0, 0.007843138, 1
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
0.3428168, -3.785133, -8.302331, 0, -0.5, 0.5, 0.5,
0.3428168, -3.785133, -8.302331, 1, -0.5, 0.5, 0.5,
0.3428168, -3.785133, -8.302331, 1, 1.5, 0.5, 0.5,
0.3428168, -3.785133, -8.302331, 0, 1.5, 0.5, 0.5
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
-4.197423, -0.03582835, -8.302331, 0, -0.5, 0.5, 0.5,
-4.197423, -0.03582835, -8.302331, 1, -0.5, 0.5, 0.5,
-4.197423, -0.03582835, -8.302331, 1, 1.5, 0.5, 0.5,
-4.197423, -0.03582835, -8.302331, 0, 1.5, 0.5, 0.5
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
-4.197423, -3.785133, -0.2288816, 0, -0.5, 0.5, 0.5,
-4.197423, -3.785133, -0.2288816, 1, -0.5, 0.5, 0.5,
-4.197423, -3.785133, -0.2288816, 1, 1.5, 0.5, 0.5,
-4.197423, -3.785133, -0.2288816, 0, 1.5, 0.5, 0.5
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
-3, -2.919909, -6.439228,
3, -2.919909, -6.439228,
-3, -2.919909, -6.439228,
-3, -3.064113, -6.749745,
-2, -2.919909, -6.439228,
-2, -3.064113, -6.749745,
-1, -2.919909, -6.439228,
-1, -3.064113, -6.749745,
0, -2.919909, -6.439228,
0, -3.064113, -6.749745,
1, -2.919909, -6.439228,
1, -3.064113, -6.749745,
2, -2.919909, -6.439228,
2, -3.064113, -6.749745,
3, -2.919909, -6.439228,
3, -3.064113, -6.749745
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
-3, -3.352521, -7.37078, 0, -0.5, 0.5, 0.5,
-3, -3.352521, -7.37078, 1, -0.5, 0.5, 0.5,
-3, -3.352521, -7.37078, 1, 1.5, 0.5, 0.5,
-3, -3.352521, -7.37078, 0, 1.5, 0.5, 0.5,
-2, -3.352521, -7.37078, 0, -0.5, 0.5, 0.5,
-2, -3.352521, -7.37078, 1, -0.5, 0.5, 0.5,
-2, -3.352521, -7.37078, 1, 1.5, 0.5, 0.5,
-2, -3.352521, -7.37078, 0, 1.5, 0.5, 0.5,
-1, -3.352521, -7.37078, 0, -0.5, 0.5, 0.5,
-1, -3.352521, -7.37078, 1, -0.5, 0.5, 0.5,
-1, -3.352521, -7.37078, 1, 1.5, 0.5, 0.5,
-1, -3.352521, -7.37078, 0, 1.5, 0.5, 0.5,
0, -3.352521, -7.37078, 0, -0.5, 0.5, 0.5,
0, -3.352521, -7.37078, 1, -0.5, 0.5, 0.5,
0, -3.352521, -7.37078, 1, 1.5, 0.5, 0.5,
0, -3.352521, -7.37078, 0, 1.5, 0.5, 0.5,
1, -3.352521, -7.37078, 0, -0.5, 0.5, 0.5,
1, -3.352521, -7.37078, 1, -0.5, 0.5, 0.5,
1, -3.352521, -7.37078, 1, 1.5, 0.5, 0.5,
1, -3.352521, -7.37078, 0, 1.5, 0.5, 0.5,
2, -3.352521, -7.37078, 0, -0.5, 0.5, 0.5,
2, -3.352521, -7.37078, 1, -0.5, 0.5, 0.5,
2, -3.352521, -7.37078, 1, 1.5, 0.5, 0.5,
2, -3.352521, -7.37078, 0, 1.5, 0.5, 0.5,
3, -3.352521, -7.37078, 0, -0.5, 0.5, 0.5,
3, -3.352521, -7.37078, 1, -0.5, 0.5, 0.5,
3, -3.352521, -7.37078, 1, 1.5, 0.5, 0.5,
3, -3.352521, -7.37078, 0, 1.5, 0.5, 0.5
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
-3.149676, -2, -6.439228,
-3.149676, 2, -6.439228,
-3.149676, -2, -6.439228,
-3.3243, -2, -6.749745,
-3.149676, -1, -6.439228,
-3.3243, -1, -6.749745,
-3.149676, 0, -6.439228,
-3.3243, 0, -6.749745,
-3.149676, 1, -6.439228,
-3.3243, 1, -6.749745,
-3.149676, 2, -6.439228,
-3.3243, 2, -6.749745
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
-3.67355, -2, -7.37078, 0, -0.5, 0.5, 0.5,
-3.67355, -2, -7.37078, 1, -0.5, 0.5, 0.5,
-3.67355, -2, -7.37078, 1, 1.5, 0.5, 0.5,
-3.67355, -2, -7.37078, 0, 1.5, 0.5, 0.5,
-3.67355, -1, -7.37078, 0, -0.5, 0.5, 0.5,
-3.67355, -1, -7.37078, 1, -0.5, 0.5, 0.5,
-3.67355, -1, -7.37078, 1, 1.5, 0.5, 0.5,
-3.67355, -1, -7.37078, 0, 1.5, 0.5, 0.5,
-3.67355, 0, -7.37078, 0, -0.5, 0.5, 0.5,
-3.67355, 0, -7.37078, 1, -0.5, 0.5, 0.5,
-3.67355, 0, -7.37078, 1, 1.5, 0.5, 0.5,
-3.67355, 0, -7.37078, 0, 1.5, 0.5, 0.5,
-3.67355, 1, -7.37078, 0, -0.5, 0.5, 0.5,
-3.67355, 1, -7.37078, 1, -0.5, 0.5, 0.5,
-3.67355, 1, -7.37078, 1, 1.5, 0.5, 0.5,
-3.67355, 1, -7.37078, 0, 1.5, 0.5, 0.5,
-3.67355, 2, -7.37078, 0, -0.5, 0.5, 0.5,
-3.67355, 2, -7.37078, 1, -0.5, 0.5, 0.5,
-3.67355, 2, -7.37078, 1, 1.5, 0.5, 0.5,
-3.67355, 2, -7.37078, 0, 1.5, 0.5, 0.5
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
-3.149676, -2.919909, -6,
-3.149676, -2.919909, 4,
-3.149676, -2.919909, -6,
-3.3243, -3.064113, -6,
-3.149676, -2.919909, -4,
-3.3243, -3.064113, -4,
-3.149676, -2.919909, -2,
-3.3243, -3.064113, -2,
-3.149676, -2.919909, 0,
-3.3243, -3.064113, 0,
-3.149676, -2.919909, 2,
-3.3243, -3.064113, 2,
-3.149676, -2.919909, 4,
-3.3243, -3.064113, 4
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
-3.67355, -3.352521, -6, 0, -0.5, 0.5, 0.5,
-3.67355, -3.352521, -6, 1, -0.5, 0.5, 0.5,
-3.67355, -3.352521, -6, 1, 1.5, 0.5, 0.5,
-3.67355, -3.352521, -6, 0, 1.5, 0.5, 0.5,
-3.67355, -3.352521, -4, 0, -0.5, 0.5, 0.5,
-3.67355, -3.352521, -4, 1, -0.5, 0.5, 0.5,
-3.67355, -3.352521, -4, 1, 1.5, 0.5, 0.5,
-3.67355, -3.352521, -4, 0, 1.5, 0.5, 0.5,
-3.67355, -3.352521, -2, 0, -0.5, 0.5, 0.5,
-3.67355, -3.352521, -2, 1, -0.5, 0.5, 0.5,
-3.67355, -3.352521, -2, 1, 1.5, 0.5, 0.5,
-3.67355, -3.352521, -2, 0, 1.5, 0.5, 0.5,
-3.67355, -3.352521, 0, 0, -0.5, 0.5, 0.5,
-3.67355, -3.352521, 0, 1, -0.5, 0.5, 0.5,
-3.67355, -3.352521, 0, 1, 1.5, 0.5, 0.5,
-3.67355, -3.352521, 0, 0, 1.5, 0.5, 0.5,
-3.67355, -3.352521, 2, 0, -0.5, 0.5, 0.5,
-3.67355, -3.352521, 2, 1, -0.5, 0.5, 0.5,
-3.67355, -3.352521, 2, 1, 1.5, 0.5, 0.5,
-3.67355, -3.352521, 2, 0, 1.5, 0.5, 0.5,
-3.67355, -3.352521, 4, 0, -0.5, 0.5, 0.5,
-3.67355, -3.352521, 4, 1, -0.5, 0.5, 0.5,
-3.67355, -3.352521, 4, 1, 1.5, 0.5, 0.5,
-3.67355, -3.352521, 4, 0, 1.5, 0.5, 0.5
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
-3.149676, -2.919909, -6.439228,
-3.149676, 2.848252, -6.439228,
-3.149676, -2.919909, 5.981464,
-3.149676, 2.848252, 5.981464,
-3.149676, -2.919909, -6.439228,
-3.149676, -2.919909, 5.981464,
-3.149676, 2.848252, -6.439228,
-3.149676, 2.848252, 5.981464,
-3.149676, -2.919909, -6.439228,
3.83531, -2.919909, -6.439228,
-3.149676, -2.919909, 5.981464,
3.83531, -2.919909, 5.981464,
-3.149676, 2.848252, -6.439228,
3.83531, 2.848252, -6.439228,
-3.149676, 2.848252, 5.981464,
3.83531, 2.848252, 5.981464,
3.83531, -2.919909, -6.439228,
3.83531, 2.848252, -6.439228,
3.83531, -2.919909, 5.981464,
3.83531, 2.848252, 5.981464,
3.83531, -2.919909, -6.439228,
3.83531, -2.919909, 5.981464,
3.83531, 2.848252, -6.439228,
3.83531, 2.848252, 5.981464
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
var radius = 8.208991;
var distance = 36.52272;
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
mvMatrix.translate( -0.3428168, 0.03582835, 0.2288816 );
mvMatrix.scale( 1.270686, 1.538744, 0.7145916 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.52272);
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
buminafos<-read.table("buminafos.xyz")
```

```
## Error in read.table("buminafos.xyz"): no lines available in input
```

```r
x<-buminafos$V2
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
```

```r
y<-buminafos$V3
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
```

```r
z<-buminafos$V4
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
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
-3.047953, 0.7920094, -2.094505, 0, 0, 1, 1, 1,
-2.852537, -0.4681276, -2.709249, 1, 0, 0, 1, 1,
-2.69802, 0.4266539, -2.073382, 1, 0, 0, 1, 1,
-2.608755, 0.6121361, -1.364386, 1, 0, 0, 1, 1,
-2.578414, 1.245736, -0.4307534, 1, 0, 0, 1, 1,
-2.340418, -0.02396753, -1.350332, 1, 0, 0, 1, 1,
-2.32258, 1.122737, -0.7270472, 0, 0, 0, 1, 1,
-2.261904, 1.814362, -0.7495531, 0, 0, 0, 1, 1,
-2.250001, 1.836027, -1.569947, 0, 0, 0, 1, 1,
-2.241082, -0.5500808, -1.90778, 0, 0, 0, 1, 1,
-2.226941, -0.3614691, -1.620109, 0, 0, 0, 1, 1,
-2.183419, -0.7871513, -2.440893, 0, 0, 0, 1, 1,
-2.175007, -0.2871563, -0.4291061, 0, 0, 0, 1, 1,
-2.104161, -0.6487988, -0.7370254, 1, 1, 1, 1, 1,
-2.013179, 1.678012, -1.603293, 1, 1, 1, 1, 1,
-2.008743, 1.578108, -2.02563, 1, 1, 1, 1, 1,
-1.973331, -0.5745264, -1.499178, 1, 1, 1, 1, 1,
-1.962755, -1.301312, -0.4407032, 1, 1, 1, 1, 1,
-1.951091, -1.096773, -2.840144, 1, 1, 1, 1, 1,
-1.913012, 0.06489911, -1.196794, 1, 1, 1, 1, 1,
-1.904006, 2.289378, -0.04717168, 1, 1, 1, 1, 1,
-1.902985, 0.9413218, 0.683055, 1, 1, 1, 1, 1,
-1.886316, 2.599052, 0.9392224, 1, 1, 1, 1, 1,
-1.853972, 1.06798, 0.1649653, 1, 1, 1, 1, 1,
-1.8502, 0.7491077, -1.019027, 1, 1, 1, 1, 1,
-1.841086, -0.9425008, -3.118771, 1, 1, 1, 1, 1,
-1.833186, -0.9104888, -0.43359, 1, 1, 1, 1, 1,
-1.830743, 1.449713, -1.452547, 1, 1, 1, 1, 1,
-1.811714, 0.4662401, -1.635658, 0, 0, 1, 1, 1,
-1.789399, 0.7749368, -1.196995, 1, 0, 0, 1, 1,
-1.772439, -0.883203, -3.200442, 1, 0, 0, 1, 1,
-1.766733, 0.3054267, -1.490093, 1, 0, 0, 1, 1,
-1.758014, -2.038146, -2.165022, 1, 0, 0, 1, 1,
-1.741271, 1.29964, -0.03641762, 1, 0, 0, 1, 1,
-1.736635, 0.3720159, -1.2649, 0, 0, 0, 1, 1,
-1.729242, 2.469917, 0.8798673, 0, 0, 0, 1, 1,
-1.723632, -0.6315403, -0.456375, 0, 0, 0, 1, 1,
-1.714794, 0.5262993, 0.1154046, 0, 0, 0, 1, 1,
-1.706061, -0.5757697, -3.990045, 0, 0, 0, 1, 1,
-1.690936, -0.9755008, -3.156437, 0, 0, 0, 1, 1,
-1.689167, -0.10008, -2.315076, 0, 0, 0, 1, 1,
-1.6825, -1.116422, -1.872394, 1, 1, 1, 1, 1,
-1.672043, -0.6209094, -2.915245, 1, 1, 1, 1, 1,
-1.658934, -1.029091, -2.6239, 1, 1, 1, 1, 1,
-1.656646, -1.530052, -0.7642837, 1, 1, 1, 1, 1,
-1.653709, -0.07959481, -0.3513868, 1, 1, 1, 1, 1,
-1.65136, -0.3419387, -1.379407, 1, 1, 1, 1, 1,
-1.651158, -1.134075, -2.64899, 1, 1, 1, 1, 1,
-1.630092, 1.284698, -0.6550321, 1, 1, 1, 1, 1,
-1.623371, 0.9097453, -0.1565249, 1, 1, 1, 1, 1,
-1.617724, -0.3414231, -0.9748778, 1, 1, 1, 1, 1,
-1.616645, 1.49193, -1.98118, 1, 1, 1, 1, 1,
-1.611811, -0.7466184, -1.723117, 1, 1, 1, 1, 1,
-1.611803, 0.3678988, -1.903222, 1, 1, 1, 1, 1,
-1.609071, 0.3271429, -1.248019, 1, 1, 1, 1, 1,
-1.598753, -0.312987, -1.211065, 1, 1, 1, 1, 1,
-1.596407, -7.633835e-05, -2.263762, 0, 0, 1, 1, 1,
-1.596233, -1.473377, -1.819255, 1, 0, 0, 1, 1,
-1.566534, -0.5526804, -2.034866, 1, 0, 0, 1, 1,
-1.564681, 1.869404, -1.116981, 1, 0, 0, 1, 1,
-1.562788, -0.1811129, -2.184138, 1, 0, 0, 1, 1,
-1.529518, -0.5034805, -1.630855, 1, 0, 0, 1, 1,
-1.525112, -0.9255223, -2.517314, 0, 0, 0, 1, 1,
-1.523512, -0.5795212, -2.795719, 0, 0, 0, 1, 1,
-1.511201, -0.4432995, -0.9997714, 0, 0, 0, 1, 1,
-1.503793, -0.6700838, -1.111977, 0, 0, 0, 1, 1,
-1.503293, 1.117922, -1.231453, 0, 0, 0, 1, 1,
-1.481137, -0.5184459, -3.495094, 0, 0, 0, 1, 1,
-1.474553, 0.3890671, -0.880978, 0, 0, 0, 1, 1,
-1.473187, 0.1263871, -1.336257, 1, 1, 1, 1, 1,
-1.468693, -0.7946527, -2.259612, 1, 1, 1, 1, 1,
-1.468244, 0.1776472, -1.387946, 1, 1, 1, 1, 1,
-1.467425, -0.1597371, -0.7212725, 1, 1, 1, 1, 1,
-1.465749, 0.02845485, -2.024808, 1, 1, 1, 1, 1,
-1.464718, -0.2432285, -3.412224, 1, 1, 1, 1, 1,
-1.460135, 2.005699, -0.01795994, 1, 1, 1, 1, 1,
-1.458526, -0.9337665, -2.89947, 1, 1, 1, 1, 1,
-1.447337, -0.1795734, -1.932594, 1, 1, 1, 1, 1,
-1.434921, -0.5915087, -2.235787, 1, 1, 1, 1, 1,
-1.431431, -0.06822006, -2.467581, 1, 1, 1, 1, 1,
-1.428414, 0.6460283, -0.2523724, 1, 1, 1, 1, 1,
-1.428351, -0.2493985, -2.449584, 1, 1, 1, 1, 1,
-1.426329, 0.4443668, -2.835539, 1, 1, 1, 1, 1,
-1.422404, -0.03993744, -2.59271, 1, 1, 1, 1, 1,
-1.418015, -2.461925, -2.55544, 0, 0, 1, 1, 1,
-1.416291, 1.750872, 0.6630548, 1, 0, 0, 1, 1,
-1.410294, -0.2268657, -0.1858956, 1, 0, 0, 1, 1,
-1.404103, -0.6191309, -2.371206, 1, 0, 0, 1, 1,
-1.396769, -0.9533861, -1.791285, 1, 0, 0, 1, 1,
-1.394444, -0.06266616, -0.7930329, 1, 0, 0, 1, 1,
-1.388128, 2.006089, -3.242254, 0, 0, 0, 1, 1,
-1.37146, -0.1521419, -2.805049, 0, 0, 0, 1, 1,
-1.366173, -0.175116, -0.04614458, 0, 0, 0, 1, 1,
-1.362254, 0.001696274, -1.534119, 0, 0, 0, 1, 1,
-1.359746, -0.9613438, -1.614674, 0, 0, 0, 1, 1,
-1.350979, -0.3301989, -1.193402, 0, 0, 0, 1, 1,
-1.348795, -0.9413005, -1.910682, 0, 0, 0, 1, 1,
-1.348516, 0.4353872, -2.281637, 1, 1, 1, 1, 1,
-1.348068, 0.9604178, -0.3637554, 1, 1, 1, 1, 1,
-1.344201, -0.8178437, -2.131449, 1, 1, 1, 1, 1,
-1.344167, -1.394207, -1.466614, 1, 1, 1, 1, 1,
-1.342937, -0.9661377, -3.031994, 1, 1, 1, 1, 1,
-1.332844, -0.3080442, -1.559965, 1, 1, 1, 1, 1,
-1.332757, 1.360946, -1.22101, 1, 1, 1, 1, 1,
-1.329307, 0.4274641, -1.932089, 1, 1, 1, 1, 1,
-1.322423, -0.5676773, -0.9161104, 1, 1, 1, 1, 1,
-1.318874, 0.1424953, -2.180922, 1, 1, 1, 1, 1,
-1.303121, 0.2930582, -0.9872912, 1, 1, 1, 1, 1,
-1.292452, 0.4670158, -0.5885713, 1, 1, 1, 1, 1,
-1.290457, 0.1648652, -1.506845, 1, 1, 1, 1, 1,
-1.290264, -0.8348578, -2.488233, 1, 1, 1, 1, 1,
-1.287731, -2.835907, -2.438253, 1, 1, 1, 1, 1,
-1.269178, 0.03786863, -2.124452, 0, 0, 1, 1, 1,
-1.245955, 0.05333549, -0.4071733, 1, 0, 0, 1, 1,
-1.244919, -1.10589, -1.496856, 1, 0, 0, 1, 1,
-1.244291, -0.3347817, -1.980072, 1, 0, 0, 1, 1,
-1.23768, 0.001885821, -0.7241212, 1, 0, 0, 1, 1,
-1.226633, -0.07695777, -0.9299418, 1, 0, 0, 1, 1,
-1.216084, -0.6077035, -0.6352425, 0, 0, 0, 1, 1,
-1.213929, 0.6291271, -1.618497, 0, 0, 0, 1, 1,
-1.213862, 0.4771306, -1.812964, 0, 0, 0, 1, 1,
-1.211143, -1.967653, -2.027602, 0, 0, 0, 1, 1,
-1.206131, -2.156633, -1.332717, 0, 0, 0, 1, 1,
-1.203157, -0.6544133, -2.60323, 0, 0, 0, 1, 1,
-1.203118, 0.6604794, 0.9290511, 0, 0, 0, 1, 1,
-1.197008, -0.5484747, -1.142668, 1, 1, 1, 1, 1,
-1.196662, 0.06852601, -0.3220361, 1, 1, 1, 1, 1,
-1.195907, -0.1259904, -1.898425, 1, 1, 1, 1, 1,
-1.192937, -1.047362, -1.562312, 1, 1, 1, 1, 1,
-1.192465, 1.796336, -0.8480555, 1, 1, 1, 1, 1,
-1.192249, 1.421444, -0.8177477, 1, 1, 1, 1, 1,
-1.191187, -0.3703481, -2.183221, 1, 1, 1, 1, 1,
-1.188487, 1.171969, 0.6457644, 1, 1, 1, 1, 1,
-1.186555, -1.715071, -2.524777, 1, 1, 1, 1, 1,
-1.18576, -1.201345, -1.405835, 1, 1, 1, 1, 1,
-1.179696, 0.990156, -1.495126, 1, 1, 1, 1, 1,
-1.178612, -0.9570542, -1.7115, 1, 1, 1, 1, 1,
-1.168522, -0.3073704, -0.9026687, 1, 1, 1, 1, 1,
-1.167775, -0.4190964, -0.7366803, 1, 1, 1, 1, 1,
-1.167648, -0.5130066, -2.683149, 1, 1, 1, 1, 1,
-1.165634, -0.3813183, -1.851181, 0, 0, 1, 1, 1,
-1.152104, -0.6040986, -0.9799785, 1, 0, 0, 1, 1,
-1.141686, 0.2209754, -1.072767, 1, 0, 0, 1, 1,
-1.139132, -1.35007, -1.589644, 1, 0, 0, 1, 1,
-1.092473, 0.5383151, -1.171941, 1, 0, 0, 1, 1,
-1.085533, 1.556761, -0.5522224, 1, 0, 0, 1, 1,
-1.084741, -0.3260181, -2.104347, 0, 0, 0, 1, 1,
-1.076555, -0.2821757, -1.434025, 0, 0, 0, 1, 1,
-1.069136, 0.2756982, -4.195581, 0, 0, 0, 1, 1,
-1.064031, 0.6363887, -0.6651383, 0, 0, 0, 1, 1,
-1.04461, -0.7105325, -2.603158, 0, 0, 0, 1, 1,
-1.043184, -0.6380337, -2.95268, 0, 0, 0, 1, 1,
-1.042552, 1.921878, 0.07640335, 0, 0, 0, 1, 1,
-1.039188, -2.366976, -2.996702, 1, 1, 1, 1, 1,
-1.029664, 0.360328, 0.4332168, 1, 1, 1, 1, 1,
-1.015159, -0.2217965, -2.100651, 1, 1, 1, 1, 1,
-1.012393, -0.1422129, -3.334344, 1, 1, 1, 1, 1,
-1.006221, 0.5262819, -1.702389, 1, 1, 1, 1, 1,
-1.000637, 0.8711037, -1.706887, 1, 1, 1, 1, 1,
-0.984421, 0.8017161, 1.034642, 1, 1, 1, 1, 1,
-0.9823788, -1.49826, -3.474514, 1, 1, 1, 1, 1,
-0.9813932, -1.312028, -3.750674, 1, 1, 1, 1, 1,
-0.9746429, -0.5207978, -2.321334, 1, 1, 1, 1, 1,
-0.9741338, -0.3970421, -2.881936, 1, 1, 1, 1, 1,
-0.9720703, -0.2993607, -1.343028, 1, 1, 1, 1, 1,
-0.9713838, -0.04797338, -2.273211, 1, 1, 1, 1, 1,
-0.9685642, -0.0439944, -1.821869, 1, 1, 1, 1, 1,
-0.9665392, 0.8309233, -1.076355, 1, 1, 1, 1, 1,
-0.9631432, -1.483436, -1.317036, 0, 0, 1, 1, 1,
-0.9453558, -0.1848854, -3.19847, 1, 0, 0, 1, 1,
-0.9252978, -0.6924772, -3.783761, 1, 0, 0, 1, 1,
-0.9207422, -1.426279, -1.397276, 1, 0, 0, 1, 1,
-0.9180393, -0.9133895, -3.250823, 1, 0, 0, 1, 1,
-0.9032065, -0.06101661, -2.916094, 1, 0, 0, 1, 1,
-0.8877368, 0.00378446, -2.127762, 0, 0, 0, 1, 1,
-0.8847029, 1.291692, -0.6549418, 0, 0, 0, 1, 1,
-0.8805251, 0.1422072, -1.458204, 0, 0, 0, 1, 1,
-0.8803341, 0.3508348, -0.744329, 0, 0, 0, 1, 1,
-0.875262, 0.7559296, -1.03388, 0, 0, 0, 1, 1,
-0.8580581, 1.44435, -0.4486378, 0, 0, 0, 1, 1,
-0.8547176, -0.4376626, -2.546661, 0, 0, 0, 1, 1,
-0.8480722, 0.777961, -1.494971, 1, 1, 1, 1, 1,
-0.8471721, -1.018179, 0.1995001, 1, 1, 1, 1, 1,
-0.8468112, 0.1594216, -0.8148098, 1, 1, 1, 1, 1,
-0.8442698, -0.2871858, -0.2443543, 1, 1, 1, 1, 1,
-0.8360716, -0.6856448, -1.925193, 1, 1, 1, 1, 1,
-0.83503, -0.2412538, -0.1734379, 1, 1, 1, 1, 1,
-0.8338678, -0.3157461, -0.821595, 1, 1, 1, 1, 1,
-0.8325641, -1.098244, -1.718376, 1, 1, 1, 1, 1,
-0.8301924, -0.55924, -2.323563, 1, 1, 1, 1, 1,
-0.8252041, -0.5364403, -2.876075, 1, 1, 1, 1, 1,
-0.8234161, -0.3451294, -3.278697, 1, 1, 1, 1, 1,
-0.8216046, -1.339874, -3.594702, 1, 1, 1, 1, 1,
-0.8188678, 0.4065818, -2.057418, 1, 1, 1, 1, 1,
-0.8182292, 0.5482849, -0.9460682, 1, 1, 1, 1, 1,
-0.8156589, 1.039398, -1.317463, 1, 1, 1, 1, 1,
-0.8153608, 0.7434334, -0.1789893, 0, 0, 1, 1, 1,
-0.8142042, -0.971212, -3.485306, 1, 0, 0, 1, 1,
-0.8141898, -1.036623, -3.334055, 1, 0, 0, 1, 1,
-0.8109146, -2.388803, 0.02303041, 1, 0, 0, 1, 1,
-0.8099557, 1.927541, -1.019645, 1, 0, 0, 1, 1,
-0.7984682, -0.7641113, -3.30176, 1, 0, 0, 1, 1,
-0.7984293, 1.197775, -1.482297, 0, 0, 0, 1, 1,
-0.7963658, -0.2629082, -1.778879, 0, 0, 0, 1, 1,
-0.7936178, 0.7441002, -0.877978, 0, 0, 0, 1, 1,
-0.7913734, -2.122592, -1.892764, 0, 0, 0, 1, 1,
-0.7904296, 0.03597656, -0.4392475, 0, 0, 0, 1, 1,
-0.7875428, -0.8331437, -2.087663, 0, 0, 0, 1, 1,
-0.7851976, 0.209703, -3.268262, 0, 0, 0, 1, 1,
-0.782471, -0.5610191, -1.059052, 1, 1, 1, 1, 1,
-0.7818443, -0.7640155, -3.358689, 1, 1, 1, 1, 1,
-0.7809818, -0.2276022, -2.580027, 1, 1, 1, 1, 1,
-0.775057, -0.04547841, -3.112144, 1, 1, 1, 1, 1,
-0.7749485, 1.495673, -0.2923505, 1, 1, 1, 1, 1,
-0.7725379, 0.9436147, -0.7433836, 1, 1, 1, 1, 1,
-0.769796, 0.8077319, -0.08639019, 1, 1, 1, 1, 1,
-0.7693628, 0.8455024, -1.398755, 1, 1, 1, 1, 1,
-0.7671596, 0.7501032, 1.262346, 1, 1, 1, 1, 1,
-0.7655451, 0.006099954, -2.096547, 1, 1, 1, 1, 1,
-0.7591045, 1.242419, -0.09213325, 1, 1, 1, 1, 1,
-0.756374, -0.3094687, -1.276217, 1, 1, 1, 1, 1,
-0.755151, 1.693726, 0.005817275, 1, 1, 1, 1, 1,
-0.749374, 0.1275189, -1.069975, 1, 1, 1, 1, 1,
-0.7486269, -1.096569, -3.122483, 1, 1, 1, 1, 1,
-0.7484063, 0.5478302, -1.629281, 0, 0, 1, 1, 1,
-0.7439196, 0.2084255, -2.273709, 1, 0, 0, 1, 1,
-0.7350936, 0.02580713, -1.336701, 1, 0, 0, 1, 1,
-0.7349834, 0.1142486, -0.8196557, 1, 0, 0, 1, 1,
-0.7331384, -0.3340391, -0.8672969, 1, 0, 0, 1, 1,
-0.7297444, 1.245986, 1.750858, 1, 0, 0, 1, 1,
-0.7281688, 0.5770725, -0.7744715, 0, 0, 0, 1, 1,
-0.7258868, 0.5101485, -1.403772, 0, 0, 0, 1, 1,
-0.7226172, 0.5077969, -1.929484, 0, 0, 0, 1, 1,
-0.7176315, 1.310624, -2.728364, 0, 0, 0, 1, 1,
-0.7099748, 0.3436004, -0.01873794, 0, 0, 0, 1, 1,
-0.7060639, 1.065991, 0.2883023, 0, 0, 0, 1, 1,
-0.7016636, 0.65212, -2.287498, 0, 0, 0, 1, 1,
-0.6983025, -0.910161, -1.936519, 1, 1, 1, 1, 1,
-0.6970483, -1.516877, -2.623854, 1, 1, 1, 1, 1,
-0.6892544, 1.63829, -1.61, 1, 1, 1, 1, 1,
-0.6879724, 0.2756086, 0.6761976, 1, 1, 1, 1, 1,
-0.683439, -0.9343222, -2.926188, 1, 1, 1, 1, 1,
-0.6827496, -0.05622289, -2.486559, 1, 1, 1, 1, 1,
-0.6818908, -0.07609951, -0.7259423, 1, 1, 1, 1, 1,
-0.6816692, -0.1912156, -2.349705, 1, 1, 1, 1, 1,
-0.6788992, -0.5377552, -3.944597, 1, 1, 1, 1, 1,
-0.6752275, -0.08788416, -1.25113, 1, 1, 1, 1, 1,
-0.6730159, -0.971229, -3.820816, 1, 1, 1, 1, 1,
-0.672341, 0.7451538, -0.403906, 1, 1, 1, 1, 1,
-0.6701536, 0.2020279, -1.723018, 1, 1, 1, 1, 1,
-0.66987, 0.1495181, -1.561915, 1, 1, 1, 1, 1,
-0.6641331, -0.03714659, -1.329533, 1, 1, 1, 1, 1,
-0.6629972, 0.4293866, -0.7045446, 0, 0, 1, 1, 1,
-0.6608984, 0.1591873, -1.363005, 1, 0, 0, 1, 1,
-0.6606928, 0.1540722, -2.521481, 1, 0, 0, 1, 1,
-0.6585279, 1.817516, 1.439772, 1, 0, 0, 1, 1,
-0.6578115, -0.5420746, -2.427531, 1, 0, 0, 1, 1,
-0.6568226, -1.032588, -1.152815, 1, 0, 0, 1, 1,
-0.6526975, 0.7260849, -2.713141, 0, 0, 0, 1, 1,
-0.6476724, 0.168287, -2.204576, 0, 0, 0, 1, 1,
-0.6413517, -0.9496326, -1.311012, 0, 0, 0, 1, 1,
-0.641111, -0.691669, -3.493109, 0, 0, 0, 1, 1,
-0.6384553, -2.533708, -6.258344, 0, 0, 0, 1, 1,
-0.6307343, -1.402325, -2.475454, 0, 0, 0, 1, 1,
-0.6291698, -1.620999, -4.141259, 0, 0, 0, 1, 1,
-0.625558, 0.8493984, 0.3052356, 1, 1, 1, 1, 1,
-0.6225107, 0.4573147, -0.9647968, 1, 1, 1, 1, 1,
-0.6187689, 1.198293, 0.7658312, 1, 1, 1, 1, 1,
-0.6184785, -0.4407081, -3.522431, 1, 1, 1, 1, 1,
-0.6176353, -0.6614713, -3.385107, 1, 1, 1, 1, 1,
-0.6103246, 0.08386493, -0.7636646, 1, 1, 1, 1, 1,
-0.6087228, 2.447013, -0.6476469, 1, 1, 1, 1, 1,
-0.6048811, 0.9523853, 0.1329521, 1, 1, 1, 1, 1,
-0.6043654, 1.719203, 0.7090847, 1, 1, 1, 1, 1,
-0.6038078, -0.8220236, -1.988948, 1, 1, 1, 1, 1,
-0.5975396, -0.5670515, -1.824853, 1, 1, 1, 1, 1,
-0.5949914, -0.09485278, -3.362139, 1, 1, 1, 1, 1,
-0.5949363, -0.09457182, -0.5388094, 1, 1, 1, 1, 1,
-0.5918085, -0.5194355, -2.447711, 1, 1, 1, 1, 1,
-0.5899665, -0.1080991, -4.518383, 1, 1, 1, 1, 1,
-0.5880779, 0.4876575, -1.170394, 0, 0, 1, 1, 1,
-0.587482, 0.621183, -1.829755, 1, 0, 0, 1, 1,
-0.5871711, -0.8509368, -2.863922, 1, 0, 0, 1, 1,
-0.5866501, -0.5408159, -1.558446, 1, 0, 0, 1, 1,
-0.5836613, 0.7716975, -2.803695, 1, 0, 0, 1, 1,
-0.5798326, -1.70963, -1.801006, 1, 0, 0, 1, 1,
-0.5786354, 0.7814875, 0.008521342, 0, 0, 0, 1, 1,
-0.5715854, -1.266614, -4.108153, 0, 0, 0, 1, 1,
-0.5615837, 0.2360178, -1.113967, 0, 0, 0, 1, 1,
-0.5612792, -0.1654903, -1.502627, 0, 0, 0, 1, 1,
-0.5604766, 0.6472545, 0.04634877, 0, 0, 0, 1, 1,
-0.5576906, -0.3935316, -2.310936, 0, 0, 0, 1, 1,
-0.5563394, 1.033244, 0.8721237, 0, 0, 0, 1, 1,
-0.544104, 0.2095805, -2.138396, 1, 1, 1, 1, 1,
-0.544059, 0.1631573, -1.894929, 1, 1, 1, 1, 1,
-0.5437453, 0.3628512, -0.2172087, 1, 1, 1, 1, 1,
-0.5382738, -0.4492087, -2.090501, 1, 1, 1, 1, 1,
-0.5381383, 0.02383278, -1.839214, 1, 1, 1, 1, 1,
-0.5313472, 0.2408235, -0.06209331, 1, 1, 1, 1, 1,
-0.5304115, 1.91018, -0.9975602, 1, 1, 1, 1, 1,
-0.5288585, -0.2567362, -2.728238, 1, 1, 1, 1, 1,
-0.527578, 0.2425968, 0.6581427, 1, 1, 1, 1, 1,
-0.5268214, 0.6237592, -1.751862, 1, 1, 1, 1, 1,
-0.5262302, 0.7418314, -0.2458416, 1, 1, 1, 1, 1,
-0.5191549, -1.101807, -1.753863, 1, 1, 1, 1, 1,
-0.5151547, 0.5012488, -1.448155, 1, 1, 1, 1, 1,
-0.5140117, 0.1927512, -1.459148, 1, 1, 1, 1, 1,
-0.5134341, -1.468997, -3.385274, 1, 1, 1, 1, 1,
-0.5102625, 0.6121915, -1.988041, 0, 0, 1, 1, 1,
-0.5069582, 2.199133, 0.6508685, 1, 0, 0, 1, 1,
-0.5045096, -1.285541, -3.557762, 1, 0, 0, 1, 1,
-0.5040123, 0.3163769, -0.03012341, 1, 0, 0, 1, 1,
-0.4949568, -0.2376038, -3.137865, 1, 0, 0, 1, 1,
-0.4945246, -0.8895363, -2.26722, 1, 0, 0, 1, 1,
-0.4941051, 0.5205156, 0.2625039, 0, 0, 0, 1, 1,
-0.4911031, -0.03438571, -1.665154, 0, 0, 0, 1, 1,
-0.4883358, 0.6054174, -0.388668, 0, 0, 0, 1, 1,
-0.4869818, 0.4468649, -0.1275737, 0, 0, 0, 1, 1,
-0.4852172, 1.187234, 0.1225264, 0, 0, 0, 1, 1,
-0.483293, -0.8155751, -2.911596, 0, 0, 0, 1, 1,
-0.4805039, -1.535303, -2.533663, 0, 0, 0, 1, 1,
-0.4800704, -0.1663621, -1.119107, 1, 1, 1, 1, 1,
-0.4742228, -0.156927, -2.088388, 1, 1, 1, 1, 1,
-0.4736394, 0.5907474, 0.2146031, 1, 1, 1, 1, 1,
-0.4669176, -1.307195, -2.794961, 1, 1, 1, 1, 1,
-0.457697, 0.5906079, 2.017432, 1, 1, 1, 1, 1,
-0.4551107, 1.122023, -0.07369577, 1, 1, 1, 1, 1,
-0.4526663, -0.2286575, -1.476174, 1, 1, 1, 1, 1,
-0.4518633, 0.8037959, -1.414785, 1, 1, 1, 1, 1,
-0.4489603, -0.3406072, -1.834964, 1, 1, 1, 1, 1,
-0.4459275, 0.5409336, -0.5866187, 1, 1, 1, 1, 1,
-0.4458981, -2.189101, -1.871949, 1, 1, 1, 1, 1,
-0.4392054, 0.6037652, 0.9802854, 1, 1, 1, 1, 1,
-0.4390862, 0.5941435, -1.441297, 1, 1, 1, 1, 1,
-0.4335608, 0.1189799, -2.795315, 1, 1, 1, 1, 1,
-0.4335528, 2.287646, -0.2309849, 1, 1, 1, 1, 1,
-0.4319565, -1.791093, -4.241975, 0, 0, 1, 1, 1,
-0.4312215, -0.6838786, -1.109742, 1, 0, 0, 1, 1,
-0.4302788, -0.4289008, -3.431648, 1, 0, 0, 1, 1,
-0.4269852, -0.7443774, -1.487728, 1, 0, 0, 1, 1,
-0.4252761, -1.193558, -3.364921, 1, 0, 0, 1, 1,
-0.4209483, -0.4097988, -1.060874, 1, 0, 0, 1, 1,
-0.4191628, -0.1338775, -3.776604, 0, 0, 0, 1, 1,
-0.4126576, 2.76425, -1.162716, 0, 0, 0, 1, 1,
-0.4111172, 1.556754, 0.5958248, 0, 0, 0, 1, 1,
-0.4097656, 0.413291, -1.418415, 0, 0, 0, 1, 1,
-0.4081523, -1.298058, -2.593848, 0, 0, 0, 1, 1,
-0.4050321, 1.1731, 0.09154063, 0, 0, 0, 1, 1,
-0.4042501, -2.016343, -3.85753, 0, 0, 0, 1, 1,
-0.4035662, 1.490342, -1.789583, 1, 1, 1, 1, 1,
-0.3982685, 0.4550944, -1.64923, 1, 1, 1, 1, 1,
-0.3979933, 0.4211284, -0.8590509, 1, 1, 1, 1, 1,
-0.3979233, 1.936615, 1.51903, 1, 1, 1, 1, 1,
-0.3950018, -1.052102, -2.764571, 1, 1, 1, 1, 1,
-0.3944952, -0.5186485, -3.308331, 1, 1, 1, 1, 1,
-0.3936865, 1.320322, 0.1857868, 1, 1, 1, 1, 1,
-0.3930139, 0.7254523, -1.300905, 1, 1, 1, 1, 1,
-0.3928472, 0.3282267, -0.5698739, 1, 1, 1, 1, 1,
-0.3890598, -0.1315877, -0.5220418, 1, 1, 1, 1, 1,
-0.381615, -0.12483, -2.826591, 1, 1, 1, 1, 1,
-0.3801356, 0.01005971, -3.246761, 1, 1, 1, 1, 1,
-0.3771995, 0.2706396, -3.030126, 1, 1, 1, 1, 1,
-0.3771822, -0.9666212, -1.048792, 1, 1, 1, 1, 1,
-0.3769628, 0.2789204, -1.024775, 1, 1, 1, 1, 1,
-0.3753351, 1.423089, 1.351495, 0, 0, 1, 1, 1,
-0.3739917, 0.6212547, 0.4531183, 1, 0, 0, 1, 1,
-0.3689137, 0.3513812, -1.245408, 1, 0, 0, 1, 1,
-0.3652698, 0.4434085, -2.44202, 1, 0, 0, 1, 1,
-0.3645484, 1.00894, -0.6824678, 1, 0, 0, 1, 1,
-0.3641235, -1.868756, -3.605388, 1, 0, 0, 1, 1,
-0.3559982, -1.055862, -4.161656, 0, 0, 0, 1, 1,
-0.355148, -0.4717119, -2.180461, 0, 0, 0, 1, 1,
-0.35219, 0.1701851, -1.543632, 0, 0, 0, 1, 1,
-0.3482016, -1.511693, -2.31108, 0, 0, 0, 1, 1,
-0.3473925, 0.3588954, -1.416749, 0, 0, 0, 1, 1,
-0.3408408, -0.7114727, -2.307802, 0, 0, 0, 1, 1,
-0.3408343, 0.3522751, -0.9464608, 0, 0, 0, 1, 1,
-0.340258, -0.06358141, -2.098469, 1, 1, 1, 1, 1,
-0.3383348, 0.8609876, -2.272875, 1, 1, 1, 1, 1,
-0.3380124, 0.362957, -1.804138, 1, 1, 1, 1, 1,
-0.3375477, 0.4521745, -0.5433614, 1, 1, 1, 1, 1,
-0.3374662, -1.219853, -2.891125, 1, 1, 1, 1, 1,
-0.3330421, -0.01894819, -3.288577, 1, 1, 1, 1, 1,
-0.3328775, 0.7101963, -0.8062802, 1, 1, 1, 1, 1,
-0.3321204, 1.020563, -0.6565244, 1, 1, 1, 1, 1,
-0.3300167, 1.562755, -0.7939945, 1, 1, 1, 1, 1,
-0.327168, -1.083779, -3.152472, 1, 1, 1, 1, 1,
-0.3265408, 1.979985, -0.7383364, 1, 1, 1, 1, 1,
-0.3261892, -0.448251, -3.988329, 1, 1, 1, 1, 1,
-0.3222086, -1.454183, -3.715731, 1, 1, 1, 1, 1,
-0.3201496, 1.579881, -0.8825901, 1, 1, 1, 1, 1,
-0.3191095, -0.7845181, -3.075184, 1, 1, 1, 1, 1,
-0.3190516, -0.646588, -1.840223, 0, 0, 1, 1, 1,
-0.3183726, -0.4380767, -1.848537, 1, 0, 0, 1, 1,
-0.3143488, -1.589772, -3.015337, 1, 0, 0, 1, 1,
-0.3143071, -0.4681586, -4.056148, 1, 0, 0, 1, 1,
-0.3120573, 1.271857, 0.2215607, 1, 0, 0, 1, 1,
-0.3101149, 1.714495, -0.006953842, 1, 0, 0, 1, 1,
-0.3100763, -0.395192, -1.949623, 0, 0, 0, 1, 1,
-0.3057504, 0.612462, -1.417277, 0, 0, 0, 1, 1,
-0.3043423, 0.197105, -1.471052, 0, 0, 0, 1, 1,
-0.2990451, 0.7283249, -0.8614115, 0, 0, 0, 1, 1,
-0.2984628, -0.03884543, -1.759393, 0, 0, 0, 1, 1,
-0.297344, -0.0959167, -3.053891, 0, 0, 0, 1, 1,
-0.2915965, 0.6920937, 0.01326815, 0, 0, 0, 1, 1,
-0.289369, 1.391997, -1.76825, 1, 1, 1, 1, 1,
-0.2891383, 1.679373, -0.05744439, 1, 1, 1, 1, 1,
-0.2772723, 0.5810016, -1.471396, 1, 1, 1, 1, 1,
-0.27405, -2.103453, -4.54571, 1, 1, 1, 1, 1,
-0.2717512, 1.797666, 0.8153745, 1, 1, 1, 1, 1,
-0.2642061, 0.4189778, 0.5679452, 1, 1, 1, 1, 1,
-0.2636285, -0.9934432, -3.024062, 1, 1, 1, 1, 1,
-0.2588065, 0.1029632, -1.564114, 1, 1, 1, 1, 1,
-0.2547053, 0.5563534, 0.6462687, 1, 1, 1, 1, 1,
-0.2534536, 0.2575825, -1.871476, 1, 1, 1, 1, 1,
-0.2526896, -0.1900422, -2.163094, 1, 1, 1, 1, 1,
-0.2522968, 1.712869, -0.2945913, 1, 1, 1, 1, 1,
-0.2503292, -0.2880899, -3.258235, 1, 1, 1, 1, 1,
-0.2473183, -0.4826754, -3.22141, 1, 1, 1, 1, 1,
-0.2413751, 1.181042, 0.057919, 1, 1, 1, 1, 1,
-0.2394915, 0.784651, -2.830921, 0, 0, 1, 1, 1,
-0.2315416, 1.112786, -0.8629953, 1, 0, 0, 1, 1,
-0.2303552, -1.183749, -2.075403, 1, 0, 0, 1, 1,
-0.2218001, 0.733559, 1.191296, 1, 0, 0, 1, 1,
-0.2203884, -0.8651941, -1.199259, 1, 0, 0, 1, 1,
-0.2117264, -1.220281, -5.367754, 1, 0, 0, 1, 1,
-0.2101606, -0.1325772, -1.28047, 0, 0, 0, 1, 1,
-0.2093248, -0.8638002, -3.158045, 0, 0, 0, 1, 1,
-0.2031957, 0.8558409, -1.09182, 0, 0, 0, 1, 1,
-0.2003926, 1.174742, 1.82457, 0, 0, 0, 1, 1,
-0.188966, -0.7821138, -3.804478, 0, 0, 0, 1, 1,
-0.1853524, -0.1719787, -2.787371, 0, 0, 0, 1, 1,
-0.1849254, 0.4319372, -0.6683093, 0, 0, 0, 1, 1,
-0.1812873, -1.46282, -4.328818, 1, 1, 1, 1, 1,
-0.1797657, 0.6200696, -0.3557493, 1, 1, 1, 1, 1,
-0.1760712, -2.327641, -3.606081, 1, 1, 1, 1, 1,
-0.1748484, -1.160236, -2.185807, 1, 1, 1, 1, 1,
-0.1697778, 0.8164702, 0.3493002, 1, 1, 1, 1, 1,
-0.1663005, -0.8782846, -2.968065, 1, 1, 1, 1, 1,
-0.1649675, 0.4506234, -2.431621, 1, 1, 1, 1, 1,
-0.1636344, -0.626765, -1.377666, 1, 1, 1, 1, 1,
-0.1596459, -0.6784533, -2.526133, 1, 1, 1, 1, 1,
-0.1580317, 0.5811369, -1.661122, 1, 1, 1, 1, 1,
-0.1559999, -0.08065499, -3.197439, 1, 1, 1, 1, 1,
-0.1510598, 0.6502138, 0.1885687, 1, 1, 1, 1, 1,
-0.1509832, 0.9941339, 0.2186348, 1, 1, 1, 1, 1,
-0.1429197, 0.3861231, -1.456388, 1, 1, 1, 1, 1,
-0.1427554, -0.1409298, -2.454504, 1, 1, 1, 1, 1,
-0.1409891, -1.047513, -3.523782, 0, 0, 1, 1, 1,
-0.1407152, -1.154604, -4.197419, 1, 0, 0, 1, 1,
-0.1395298, -0.09746543, -1.77488, 1, 0, 0, 1, 1,
-0.1358095, 0.7697114, 0.8871777, 1, 0, 0, 1, 1,
-0.1354198, 0.003693754, -1.423733, 1, 0, 0, 1, 1,
-0.1313246, 1.304965, -0.7630125, 1, 0, 0, 1, 1,
-0.1309641, -0.1856136, -3.745811, 0, 0, 0, 1, 1,
-0.1281544, -1.07562, -4.867026, 0, 0, 0, 1, 1,
-0.1240762, -0.1137302, -3.094608, 0, 0, 0, 1, 1,
-0.1202503, -0.8021945, -3.396163, 0, 0, 0, 1, 1,
-0.1175326, -2.018459, -3.419948, 0, 0, 0, 1, 1,
-0.1153559, 0.2538829, -0.04132841, 0, 0, 0, 1, 1,
-0.1138233, -1.791931, -5.759017, 0, 0, 0, 1, 1,
-0.111249, 0.2604668, -0.05311374, 1, 1, 1, 1, 1,
-0.1073804, -0.6693566, -2.769761, 1, 1, 1, 1, 1,
-0.1058673, 1.237692, 0.4855535, 1, 1, 1, 1, 1,
-0.0979722, 0.9756495, 1.688453, 1, 1, 1, 1, 1,
-0.09582952, -1.127202, -1.896254, 1, 1, 1, 1, 1,
-0.08978054, 1.482815, 0.1019608, 1, 1, 1, 1, 1,
-0.08953541, 0.3699421, -0.2734661, 1, 1, 1, 1, 1,
-0.08908918, 0.2459544, 1.147612, 1, 1, 1, 1, 1,
-0.08447548, -0.06101967, -2.349715, 1, 1, 1, 1, 1,
-0.08267369, 0.7056741, -1.290141, 1, 1, 1, 1, 1,
-0.08182139, 0.1576053, 0.9079197, 1, 1, 1, 1, 1,
-0.08052804, -1.418029, -0.5535501, 1, 1, 1, 1, 1,
-0.07984511, -0.5225585, -2.953867, 1, 1, 1, 1, 1,
-0.07626875, -0.1065528, -2.911155, 1, 1, 1, 1, 1,
-0.07217102, 0.809558, -1.977339, 1, 1, 1, 1, 1,
-0.06906627, -0.7515453, -3.32327, 0, 0, 1, 1, 1,
-0.06429366, -0.8208696, -3.198216, 1, 0, 0, 1, 1,
-0.0641145, 0.8231126, -0.6816499, 1, 0, 0, 1, 1,
-0.05795051, -0.4552859, -3.561236, 1, 0, 0, 1, 1,
-0.05309668, -2.541635, -4.554354, 1, 0, 0, 1, 1,
-0.05085758, 1.143615, -0.0714473, 1, 0, 0, 1, 1,
-0.04990506, -0.5045558, -4.274122, 0, 0, 0, 1, 1,
-0.04835619, -0.6878361, -2.129545, 0, 0, 0, 1, 1,
-0.04754536, 0.05690433, 0.6781287, 0, 0, 0, 1, 1,
-0.04735718, -1.042709, -2.376709, 0, 0, 0, 1, 1,
-0.04691581, -0.07254941, -3.289608, 0, 0, 0, 1, 1,
-0.04561438, -0.09494471, -1.157736, 0, 0, 0, 1, 1,
-0.04387607, 1.443529, 0.2798333, 0, 0, 0, 1, 1,
-0.0380394, 0.5881005, -0.7924752, 1, 1, 1, 1, 1,
-0.03690123, -1.704895, -3.784778, 1, 1, 1, 1, 1,
-0.03466885, -0.05524573, -4.345799, 1, 1, 1, 1, 1,
-0.0333999, -0.7297258, -3.078449, 1, 1, 1, 1, 1,
-0.02371169, -0.273513, -3.010256, 1, 1, 1, 1, 1,
-0.02281719, 1.43698, 1.466318, 1, 1, 1, 1, 1,
-0.01962801, 0.2984315, -1.807496, 1, 1, 1, 1, 1,
-0.01568357, -1.370851, -0.9536351, 1, 1, 1, 1, 1,
-0.008222695, -2.5832, -2.30771, 1, 1, 1, 1, 1,
-0.006725871, 0.07957071, -0.4792942, 1, 1, 1, 1, 1,
0.0005539945, -0.5170121, 3.502628, 1, 1, 1, 1, 1,
0.003073175, -0.1099081, 3.767121, 1, 1, 1, 1, 1,
0.005198978, 0.5605668, -0.1211821, 1, 1, 1, 1, 1,
0.006837316, 0.0879657, -1.224765, 1, 1, 1, 1, 1,
0.007334622, 0.8311661, -0.91456, 1, 1, 1, 1, 1,
0.01143288, -1.924196, 2.577785, 0, 0, 1, 1, 1,
0.01275766, 0.2818906, 0.3192974, 1, 0, 0, 1, 1,
0.01350953, -0.7717161, 2.35608, 1, 0, 0, 1, 1,
0.0190269, 0.3317116, -0.215223, 1, 0, 0, 1, 1,
0.02209943, 2.507273, 2.69053, 1, 0, 0, 1, 1,
0.02337584, 0.01816185, -0.05743916, 1, 0, 0, 1, 1,
0.02424758, 0.3970559, 1.301925, 0, 0, 0, 1, 1,
0.02439469, 1.031668, -0.3645433, 0, 0, 0, 1, 1,
0.02558304, 0.622454, -0.2943311, 0, 0, 0, 1, 1,
0.02595374, -0.2937204, 4.429671, 0, 0, 0, 1, 1,
0.02803849, -1.414887, 3.414171, 0, 0, 0, 1, 1,
0.03196936, 0.989448, 0.05876072, 0, 0, 0, 1, 1,
0.03274445, -0.8417883, 2.085732, 0, 0, 0, 1, 1,
0.03527017, 0.7649181, 0.1261307, 1, 1, 1, 1, 1,
0.04001579, -0.08048912, 2.647856, 1, 1, 1, 1, 1,
0.04247463, -0.07742148, 1.574748, 1, 1, 1, 1, 1,
0.04519376, -0.3566604, 2.300898, 1, 1, 1, 1, 1,
0.0536338, 0.5258396, 0.5166172, 1, 1, 1, 1, 1,
0.0558848, 0.5117614, 0.04817537, 1, 1, 1, 1, 1,
0.05685056, 0.2471195, 0.9101951, 1, 1, 1, 1, 1,
0.0586241, -0.2018095, 1.939632, 1, 1, 1, 1, 1,
0.06165005, 2.047733, -1.744406, 1, 1, 1, 1, 1,
0.0636174, -1.089803, 2.270397, 1, 1, 1, 1, 1,
0.06375863, -0.3276368, 3.831067, 1, 1, 1, 1, 1,
0.06662473, -1.299911, 3.024463, 1, 1, 1, 1, 1,
0.06794778, -1.697546, 4.136198, 1, 1, 1, 1, 1,
0.06875239, -1.057944, 4.501475, 1, 1, 1, 1, 1,
0.07746066, 0.8851087, -0.868627, 1, 1, 1, 1, 1,
0.08995757, 1.471924, 0.6274669, 0, 0, 1, 1, 1,
0.09287444, 2.049678, 0.01131751, 1, 0, 0, 1, 1,
0.09370472, -1.747461, 5.113975, 1, 0, 0, 1, 1,
0.09463499, 1.248594, -0.1751611, 1, 0, 0, 1, 1,
0.09488773, -0.8894466, 5.414542, 1, 0, 0, 1, 1,
0.09573371, 1.847397, -0.548723, 1, 0, 0, 1, 1,
0.09603363, -1.194899, 4.065322, 0, 0, 0, 1, 1,
0.09911768, 1.387246, -0.6998243, 0, 0, 0, 1, 1,
0.09970014, 0.2236964, -1.388888, 0, 0, 0, 1, 1,
0.1001264, -1.553384, 3.948261, 0, 0, 0, 1, 1,
0.1021529, 0.05749729, 2.134751, 0, 0, 0, 1, 1,
0.1079886, -1.059986, 2.000897, 0, 0, 0, 1, 1,
0.1081802, -0.1430714, 2.205617, 0, 0, 0, 1, 1,
0.1104211, -0.8290781, 2.159999, 1, 1, 1, 1, 1,
0.1140647, -2.262409, 4.527556, 1, 1, 1, 1, 1,
0.1143595, 0.03037838, 2.793605, 1, 1, 1, 1, 1,
0.1160014, 0.2091345, -0.07162202, 1, 1, 1, 1, 1,
0.1216919, 0.6500503, 0.4744928, 1, 1, 1, 1, 1,
0.1262398, 1.178896, -0.5649626, 1, 1, 1, 1, 1,
0.1306729, -0.4603021, 2.559975, 1, 1, 1, 1, 1,
0.1309768, 1.308275, 1.889796, 1, 1, 1, 1, 1,
0.1334741, 1.517606, -2.097707, 1, 1, 1, 1, 1,
0.1412989, -1.397497, 2.324196, 1, 1, 1, 1, 1,
0.1445633, -0.5135568, 2.825104, 1, 1, 1, 1, 1,
0.1462046, 0.9295665, 0.1594218, 1, 1, 1, 1, 1,
0.1463256, 1.008523, 0.05605528, 1, 1, 1, 1, 1,
0.1475742, -0.2289052, 1.296674, 1, 1, 1, 1, 1,
0.1500156, 2.196779, 1.061401, 1, 1, 1, 1, 1,
0.1511626, 0.01811455, 0.8241239, 0, 0, 1, 1, 1,
0.1538849, 0.03216908, 0.5333375, 1, 0, 0, 1, 1,
0.155047, 0.08619735, 2.214572, 1, 0, 0, 1, 1,
0.156044, 0.1704656, 1.455465, 1, 0, 0, 1, 1,
0.1570054, 1.797669, 1.597585, 1, 0, 0, 1, 1,
0.1588027, 2.100015, -0.9587533, 1, 0, 0, 1, 1,
0.1648354, 2.002079, -0.05683957, 0, 0, 0, 1, 1,
0.1678206, 0.2974549, -0.6699627, 0, 0, 0, 1, 1,
0.1693159, 0.7074304, 1.157203, 0, 0, 0, 1, 1,
0.1794132, -0.4045218, 5.071018, 0, 0, 0, 1, 1,
0.1795224, 1.561607, 0.4234833, 0, 0, 0, 1, 1,
0.1810224, -1.301471, 3.860795, 0, 0, 0, 1, 1,
0.1827887, 2.340004, 0.4412644, 0, 0, 0, 1, 1,
0.1917144, 1.070654, 0.4395235, 1, 1, 1, 1, 1,
0.1921846, 0.738757, 0.4878449, 1, 1, 1, 1, 1,
0.1990788, -2.062495, 3.011423, 1, 1, 1, 1, 1,
0.199531, 0.08962463, 2.892022, 1, 1, 1, 1, 1,
0.2017189, -0.434276, 3.392697, 1, 1, 1, 1, 1,
0.2032614, -0.9785934, 0.3813548, 1, 1, 1, 1, 1,
0.2045486, -1.078463, 1.724723, 1, 1, 1, 1, 1,
0.2106887, 1.373221, 0.04645086, 1, 1, 1, 1, 1,
0.2134877, 0.5599773, 0.5255251, 1, 1, 1, 1, 1,
0.2138832, 0.8970045, 0.9367182, 1, 1, 1, 1, 1,
0.2139425, -2.739269, 2.929864, 1, 1, 1, 1, 1,
0.2151956, 0.1714199, -0.1729964, 1, 1, 1, 1, 1,
0.2192577, -1.476686, 4.842515, 1, 1, 1, 1, 1,
0.2241111, 2.753579, -0.1780131, 1, 1, 1, 1, 1,
0.2275608, 0.2628106, 2.372037, 1, 1, 1, 1, 1,
0.2319019, -0.03308166, 1.341795, 0, 0, 1, 1, 1,
0.2331357, 1.315152, -2.347394, 1, 0, 0, 1, 1,
0.2357828, 0.1929047, 1.923076, 1, 0, 0, 1, 1,
0.235863, 0.427354, 2.111841, 1, 0, 0, 1, 1,
0.2388901, 1.019148, 0.4273252, 1, 0, 0, 1, 1,
0.2402387, 0.602295, 0.9706429, 1, 0, 0, 1, 1,
0.2459127, -0.232847, 3.86351, 0, 0, 0, 1, 1,
0.2480673, 0.506021, 0.311681, 0, 0, 0, 1, 1,
0.2487691, -0.03039585, 2.638269, 0, 0, 0, 1, 1,
0.2506983, 1.948756, -0.3590286, 0, 0, 0, 1, 1,
0.2543805, -1.28713, 4.179691, 0, 0, 0, 1, 1,
0.2565395, 0.4487487, 0.888629, 0, 0, 0, 1, 1,
0.2639261, -1.104535, 4.031895, 0, 0, 0, 1, 1,
0.2643655, -0.4176898, 0.835878, 1, 1, 1, 1, 1,
0.2652783, -1.684811, 2.664668, 1, 1, 1, 1, 1,
0.2661876, 0.827527, -0.4731556, 1, 1, 1, 1, 1,
0.2692524, -0.86689, 2.840513, 1, 1, 1, 1, 1,
0.2706532, -0.6923268, 1.788359, 1, 1, 1, 1, 1,
0.2807477, 0.4396932, -0.8282233, 1, 1, 1, 1, 1,
0.2809049, -0.2842171, 1.320539, 1, 1, 1, 1, 1,
0.2838402, -0.1468615, 1.447967, 1, 1, 1, 1, 1,
0.2867808, -0.3981443, 4.199419, 1, 1, 1, 1, 1,
0.2936369, 0.6413508, -0.2291251, 1, 1, 1, 1, 1,
0.2954244, 1.203505, -0.06760498, 1, 1, 1, 1, 1,
0.3025563, 0.02322508, 0.9664434, 1, 1, 1, 1, 1,
0.3071442, -0.3578121, 1.107818, 1, 1, 1, 1, 1,
0.3073524, -2.601415, 2.655185, 1, 1, 1, 1, 1,
0.3080843, -2.267968, 2.895051, 1, 1, 1, 1, 1,
0.3084612, -0.72873, 4.589991, 0, 0, 1, 1, 1,
0.3091137, -1.060519, 1.887722, 1, 0, 0, 1, 1,
0.3195481, -1.649925, 2.361785, 1, 0, 0, 1, 1,
0.3204612, 0.6707767, -0.4423147, 1, 0, 0, 1, 1,
0.3228336, -0.07891662, 1.64789, 1, 0, 0, 1, 1,
0.323782, 0.3770492, 2.151899, 1, 0, 0, 1, 1,
0.323966, -0.4744947, 2.450703, 0, 0, 0, 1, 1,
0.3267619, 2.208109, 0.3032685, 0, 0, 0, 1, 1,
0.3342315, 0.4949291, 0.1613615, 0, 0, 0, 1, 1,
0.3344218, 0.02594157, 0.952466, 0, 0, 0, 1, 1,
0.3397259, -1.478899, 2.327042, 0, 0, 0, 1, 1,
0.3407251, 0.2042139, 1.241995, 0, 0, 0, 1, 1,
0.3413532, 0.9161385, 1.691829, 0, 0, 0, 1, 1,
0.3425276, 0.8004655, 2.329296, 1, 1, 1, 1, 1,
0.3452384, 0.6984053, 1.206045, 1, 1, 1, 1, 1,
0.3478247, 1.795243, -0.1824069, 1, 1, 1, 1, 1,
0.3480634, -1.351938, 2.955296, 1, 1, 1, 1, 1,
0.3568209, 0.8360172, -0.1019374, 1, 1, 1, 1, 1,
0.3584626, 1.164896, -0.5369735, 1, 1, 1, 1, 1,
0.3591051, 1.193786, -0.4774323, 1, 1, 1, 1, 1,
0.3626463, 1.114571, 1.388737, 1, 1, 1, 1, 1,
0.3641454, 2.046663, 0.9471426, 1, 1, 1, 1, 1,
0.3642085, -0.1652792, 3.026033, 1, 1, 1, 1, 1,
0.3673772, 1.350267, 0.6344773, 1, 1, 1, 1, 1,
0.3683071, -1.52068, 4.454969, 1, 1, 1, 1, 1,
0.3703196, 1.013648, -0.06060763, 1, 1, 1, 1, 1,
0.3709754, 0.09662402, 3.529843, 1, 1, 1, 1, 1,
0.3714833, -1.795954, 1.509312, 1, 1, 1, 1, 1,
0.3752658, -0.6490654, 1.907361, 0, 0, 1, 1, 1,
0.3758762, -0.2933697, 2.12405, 1, 0, 0, 1, 1,
0.3769093, -0.1375217, 2.008183, 1, 0, 0, 1, 1,
0.3779897, 0.1505533, 1.599843, 1, 0, 0, 1, 1,
0.379934, -0.06585044, 1.215827, 1, 0, 0, 1, 1,
0.3807955, 1.325555, 0.2422793, 1, 0, 0, 1, 1,
0.383016, -0.7927412, 2.804482, 0, 0, 0, 1, 1,
0.3838337, 0.5557958, 0.4910114, 0, 0, 0, 1, 1,
0.3851466, -1.03584, 2.494466, 0, 0, 0, 1, 1,
0.3852731, 1.423776, -0.8414208, 0, 0, 0, 1, 1,
0.3855778, -0.9805093, 2.525046, 0, 0, 0, 1, 1,
0.3884182, 0.4261393, 0.1693256, 0, 0, 0, 1, 1,
0.3911042, -0.06460693, 0.501888, 0, 0, 0, 1, 1,
0.3949881, -1.126404, 2.563715, 1, 1, 1, 1, 1,
0.3974679, 0.2186001, 2.079756, 1, 1, 1, 1, 1,
0.4038185, 1.039746, 0.004616141, 1, 1, 1, 1, 1,
0.4060456, -0.7440704, 3.342648, 1, 1, 1, 1, 1,
0.4087754, -1.551272, 3.127043, 1, 1, 1, 1, 1,
0.4102854, -0.423966, 4.535091, 1, 1, 1, 1, 1,
0.4113487, -1.319328, 1.89112, 1, 1, 1, 1, 1,
0.4124343, -0.02408334, 2.407597, 1, 1, 1, 1, 1,
0.4208402, -1.122474, 1.301759, 1, 1, 1, 1, 1,
0.4214486, 1.20292, 0.2690537, 1, 1, 1, 1, 1,
0.4215657, 0.1033569, 1.383091, 1, 1, 1, 1, 1,
0.4237375, -0.2121044, 3.040033, 1, 1, 1, 1, 1,
0.4399959, 0.1008687, 0.8968586, 1, 1, 1, 1, 1,
0.4436669, -0.8522294, 4.122547, 1, 1, 1, 1, 1,
0.4452209, 0.5652446, 1.754831, 1, 1, 1, 1, 1,
0.4542418, 1.764519, -0.3680442, 0, 0, 1, 1, 1,
0.455358, 0.05483053, 1.898089, 1, 0, 0, 1, 1,
0.4583467, 0.8734877, -0.5390823, 1, 0, 0, 1, 1,
0.4583583, -0.8776851, 3.372034, 1, 0, 0, 1, 1,
0.4585178, -0.2543017, 0.4657459, 1, 0, 0, 1, 1,
0.4633373, 1.452407, -1.572829, 1, 0, 0, 1, 1,
0.4682586, 0.1125168, -0.8237535, 0, 0, 0, 1, 1,
0.4689493, 0.8485348, 1.271294, 0, 0, 0, 1, 1,
0.4701808, 0.399868, 0.1759449, 0, 0, 0, 1, 1,
0.4744627, -1.267108, 4.274026, 0, 0, 0, 1, 1,
0.4749139, 0.8182271, 0.07146221, 0, 0, 0, 1, 1,
0.4767512, -1.382102, 1.562203, 0, 0, 0, 1, 1,
0.4805564, 0.6577498, -0.399239, 0, 0, 0, 1, 1,
0.4817998, 0.1774158, 0.6094307, 1, 1, 1, 1, 1,
0.4841208, 0.2815477, 1.41429, 1, 1, 1, 1, 1,
0.4896927, 0.6496212, -0.4859042, 1, 1, 1, 1, 1,
0.4898274, 2.158982, 0.505091, 1, 1, 1, 1, 1,
0.491311, 1.265187, -1.757344, 1, 1, 1, 1, 1,
0.4928399, -0.02190896, 1.59891, 1, 1, 1, 1, 1,
0.49638, 1.078971, 0.3505507, 1, 1, 1, 1, 1,
0.5009745, 0.3046528, 2.332049, 1, 1, 1, 1, 1,
0.5010932, -0.680064, 1.569716, 1, 1, 1, 1, 1,
0.5020919, -0.5952552, 3.206297, 1, 1, 1, 1, 1,
0.5045933, 1.980145, -0.3012859, 1, 1, 1, 1, 1,
0.5064359, 1.738611, 1.0552, 1, 1, 1, 1, 1,
0.5137071, 0.1978672, 1.010306, 1, 1, 1, 1, 1,
0.5143645, -0.3284479, 3.322692, 1, 1, 1, 1, 1,
0.5149139, 1.509897, -0.590649, 1, 1, 1, 1, 1,
0.515286, -1.264121, -0.02446957, 0, 0, 1, 1, 1,
0.5199435, 0.7635918, 1.396552, 1, 0, 0, 1, 1,
0.5215422, -1.303127, 3.710972, 1, 0, 0, 1, 1,
0.521764, -0.4581772, 1.12891, 1, 0, 0, 1, 1,
0.5240088, -1.313347, 2.477279, 1, 0, 0, 1, 1,
0.5259565, 0.6263642, -0.5937573, 1, 0, 0, 1, 1,
0.5274565, 2.396888, 0.597236, 0, 0, 0, 1, 1,
0.528556, -1.281525, 2.374215, 0, 0, 0, 1, 1,
0.5325122, 0.2660599, 0.1239245, 0, 0, 0, 1, 1,
0.5332689, -0.2578973, 2.516606, 0, 0, 0, 1, 1,
0.5346575, -0.7479318, 1.581773, 0, 0, 0, 1, 1,
0.5362823, 1.007427, -0.6358379, 0, 0, 0, 1, 1,
0.5383325, 1.004972, 0.6124609, 0, 0, 0, 1, 1,
0.5414255, 0.06723203, 1.793423, 1, 1, 1, 1, 1,
0.5418861, -0.9247655, 2.131739, 1, 1, 1, 1, 1,
0.5429044, -0.5065116, 2.279552, 1, 1, 1, 1, 1,
0.5452964, 1.46369, 0.5426438, 1, 1, 1, 1, 1,
0.5459698, -1.818811, 1.386624, 1, 1, 1, 1, 1,
0.5479001, -0.6900197, 3.427544, 1, 1, 1, 1, 1,
0.555595, -0.8856823, 4.035839, 1, 1, 1, 1, 1,
0.5561233, -0.6310467, 2.5902, 1, 1, 1, 1, 1,
0.5567875, 0.9799072, 0.7153792, 1, 1, 1, 1, 1,
0.5580402, -1.571838, 3.113814, 1, 1, 1, 1, 1,
0.5600314, -0.164296, 2.217641, 1, 1, 1, 1, 1,
0.5685559, 0.643304, 1.874017, 1, 1, 1, 1, 1,
0.5686265, 0.5387666, 1.495739, 1, 1, 1, 1, 1,
0.5694813, 0.3008909, 0.5059934, 1, 1, 1, 1, 1,
0.5702516, 1.186387, 0.9165323, 1, 1, 1, 1, 1,
0.5736579, -0.6709909, 3.16502, 0, 0, 1, 1, 1,
0.5738792, -0.2926625, 2.037235, 1, 0, 0, 1, 1,
0.5742401, 0.2841065, 1.881909, 1, 0, 0, 1, 1,
0.5772611, -0.0274808, 2.004215, 1, 0, 0, 1, 1,
0.5804714, 1.053805, 1.103849, 1, 0, 0, 1, 1,
0.5938348, -1.64058, 2.893703, 1, 0, 0, 1, 1,
0.5998377, -0.05916703, 1.902664, 0, 0, 0, 1, 1,
0.6000436, -0.978715, 1.060839, 0, 0, 0, 1, 1,
0.601985, 1.305368, 1.570948, 0, 0, 0, 1, 1,
0.6025047, -0.3235654, 1.028903, 0, 0, 0, 1, 1,
0.6041676, 1.133064, 0.06335826, 0, 0, 0, 1, 1,
0.6076134, -0.708793, 2.695584, 0, 0, 0, 1, 1,
0.6158034, 0.3059987, 2.691153, 0, 0, 0, 1, 1,
0.6208975, 0.1693035, 1.563306, 1, 1, 1, 1, 1,
0.6209967, -0.3280491, 2.373451, 1, 1, 1, 1, 1,
0.6216664, 0.4859363, -0.2637129, 1, 1, 1, 1, 1,
0.6240388, -0.5423854, 2.421973, 1, 1, 1, 1, 1,
0.6269626, 1.315432, -0.44956, 1, 1, 1, 1, 1,
0.6292719, 1.993954, 1.13481, 1, 1, 1, 1, 1,
0.6300346, -0.8677862, 3.599705, 1, 1, 1, 1, 1,
0.6328678, 0.2694252, 2.326104, 1, 1, 1, 1, 1,
0.6348194, 0.2207115, 0.5435039, 1, 1, 1, 1, 1,
0.6350945, 0.02070964, -0.2398631, 1, 1, 1, 1, 1,
0.6352566, 0.340638, 1.514124, 1, 1, 1, 1, 1,
0.6360188, -0.5322797, 2.428451, 1, 1, 1, 1, 1,
0.6391473, -0.06456728, 1.418612, 1, 1, 1, 1, 1,
0.6475003, -0.1757336, 1.589736, 1, 1, 1, 1, 1,
0.6571409, 1.368453, 0.4982298, 1, 1, 1, 1, 1,
0.6622698, -0.07919381, 2.280165, 0, 0, 1, 1, 1,
0.6689705, 2.073165, -0.09420925, 1, 0, 0, 1, 1,
0.6719297, 0.4890397, -0.2278464, 1, 0, 0, 1, 1,
0.6766222, 0.5659313, 0.09708474, 1, 0, 0, 1, 1,
0.683196, -0.2539514, 2.290212, 1, 0, 0, 1, 1,
0.684602, 0.6384078, 0.7894174, 1, 0, 0, 1, 1,
0.690172, 0.8966731, 0.002553332, 0, 0, 0, 1, 1,
0.6941433, 0.6304896, 0.9280584, 0, 0, 0, 1, 1,
0.6956788, 0.9258076, 0.9971283, 0, 0, 0, 1, 1,
0.7001986, 0.07148024, -0.03353822, 0, 0, 0, 1, 1,
0.700313, -0.8867329, 3.309528, 0, 0, 0, 1, 1,
0.7024533, -1.478781, 3.213903, 0, 0, 0, 1, 1,
0.7043274, 0.4504328, -0.4262942, 0, 0, 0, 1, 1,
0.7060029, -1.035563, 4.010386, 1, 1, 1, 1, 1,
0.7070957, -0.9290591, 3.64224, 1, 1, 1, 1, 1,
0.7075917, 2.107998, -2.030055, 1, 1, 1, 1, 1,
0.7123213, -1.246902, 3.003275, 1, 1, 1, 1, 1,
0.7125462, -1.203215, 2.745705, 1, 1, 1, 1, 1,
0.7140283, -1.586651, 3.201341, 1, 1, 1, 1, 1,
0.7166899, 1.202133, -0.4474838, 1, 1, 1, 1, 1,
0.7181874, 0.4471737, 0.349208, 1, 1, 1, 1, 1,
0.7182066, 2.642278, 0.3530437, 1, 1, 1, 1, 1,
0.7195877, -0.9515098, 2.451058, 1, 1, 1, 1, 1,
0.7242535, -1.355588, 2.41221, 1, 1, 1, 1, 1,
0.7306321, -0.3339342, 1.136896, 1, 1, 1, 1, 1,
0.730794, 0.5422398, 1.193798, 1, 1, 1, 1, 1,
0.7335867, 0.4658002, 0.8931493, 1, 1, 1, 1, 1,
0.739339, -0.5883685, 1.452038, 1, 1, 1, 1, 1,
0.741064, 0.1238713, 1.211552, 0, 0, 1, 1, 1,
0.749027, -1.384658, 2.697737, 1, 0, 0, 1, 1,
0.7509673, 1.541449, -0.6918205, 1, 0, 0, 1, 1,
0.7516845, -0.233809, 1.726825, 1, 0, 0, 1, 1,
0.759329, -0.01447319, 2.091096, 1, 0, 0, 1, 1,
0.7682413, -0.1075637, 3.180867, 1, 0, 0, 1, 1,
0.7723063, 0.8714505, 1.933303, 0, 0, 0, 1, 1,
0.7763999, -0.7775617, 1.503216, 0, 0, 0, 1, 1,
0.7786798, -2.219021, 2.219217, 0, 0, 0, 1, 1,
0.7809853, -0.5602265, 2.226098, 0, 0, 0, 1, 1,
0.7817716, 1.938092, 0.574376, 0, 0, 0, 1, 1,
0.7893559, 0.5427973, -0.6873664, 0, 0, 0, 1, 1,
0.790244, 0.6594511, 0.3711975, 0, 0, 0, 1, 1,
0.7910103, 1.402427, 1.36592, 1, 1, 1, 1, 1,
0.7962414, -0.1129773, 2.960408, 1, 1, 1, 1, 1,
0.799629, -0.7531821, 2.532798, 1, 1, 1, 1, 1,
0.8000933, 0.4936537, 0.0660598, 1, 1, 1, 1, 1,
0.810546, -0.7724129, 1.52096, 1, 1, 1, 1, 1,
0.8170428, -1.018615, 2.297606, 1, 1, 1, 1, 1,
0.8173746, 0.6172296, 1.115861, 1, 1, 1, 1, 1,
0.8179112, 0.07009116, 5.800581, 1, 1, 1, 1, 1,
0.8251529, 0.1325915, 1.83596, 1, 1, 1, 1, 1,
0.8308887, 1.482238, 0.6175808, 1, 1, 1, 1, 1,
0.8354042, -0.01738519, 0.1515077, 1, 1, 1, 1, 1,
0.8377754, 1.365746, 0.4075626, 1, 1, 1, 1, 1,
0.8513234, 0.2373252, 3.014612, 1, 1, 1, 1, 1,
0.8519294, -1.343186, 2.377957, 1, 1, 1, 1, 1,
0.8549751, -2.097236, 1.678171, 1, 1, 1, 1, 1,
0.8556781, -0.03240391, 2.209096, 0, 0, 1, 1, 1,
0.8558508, -0.5016218, 2.547184, 1, 0, 0, 1, 1,
0.8639433, -0.05583425, 1.5028, 1, 0, 0, 1, 1,
0.8736846, -0.3014481, 0.6223114, 1, 0, 0, 1, 1,
0.8754176, 1.123238, 1.007048, 1, 0, 0, 1, 1,
0.8755745, -1.642333, 2.761994, 1, 0, 0, 1, 1,
0.8766915, -0.7790897, 2.781591, 0, 0, 0, 1, 1,
0.8778922, -0.692764, 3.018543, 0, 0, 0, 1, 1,
0.8788508, -1.659321, 4.051786, 0, 0, 0, 1, 1,
0.8859792, 0.3169222, 1.043198, 0, 0, 0, 1, 1,
0.8867233, -0.5382792, 2.273514, 0, 0, 0, 1, 1,
0.8937817, 0.5466434, 0.06221459, 0, 0, 0, 1, 1,
0.9019431, 0.3842001, 0.2763348, 0, 0, 0, 1, 1,
0.9075543, 1.127315, 2.891063, 1, 1, 1, 1, 1,
0.9086108, 0.3595107, 2.015487, 1, 1, 1, 1, 1,
0.9129115, -2.007775, 2.669225, 1, 1, 1, 1, 1,
0.9133671, -0.6739823, 2.498915, 1, 1, 1, 1, 1,
0.9137854, 0.995009, 0.2515089, 1, 1, 1, 1, 1,
0.9189406, 0.9547427, -0.6645163, 1, 1, 1, 1, 1,
0.9320676, -0.6392432, 2.949242, 1, 1, 1, 1, 1,
0.9323683, -1.690859, 0.8814274, 1, 1, 1, 1, 1,
0.93362, -0.9597284, 1.89445, 1, 1, 1, 1, 1,
0.9359881, 1.133778, 0.2082849, 1, 1, 1, 1, 1,
0.9364043, -0.6309444, 2.636708, 1, 1, 1, 1, 1,
0.944699, 1.384882, 1.589346, 1, 1, 1, 1, 1,
0.9448023, -0.4481991, 2.303316, 1, 1, 1, 1, 1,
0.9456961, -0.7259578, 2.368623, 1, 1, 1, 1, 1,
0.9485848, 0.06214618, 0.3914574, 1, 1, 1, 1, 1,
0.9496334, 1.032411, 1.038979, 0, 0, 1, 1, 1,
0.9552086, 1.596243, 0.2817136, 1, 0, 0, 1, 1,
0.9560677, -1.509082, 2.908347, 1, 0, 0, 1, 1,
0.9703631, 0.4287679, 1.526201, 1, 0, 0, 1, 1,
0.9774595, 1.347718, 1.375987, 1, 0, 0, 1, 1,
0.9827661, 0.5053712, 2.150733, 1, 0, 0, 1, 1,
0.9882649, 0.2880127, 2.569466, 0, 0, 0, 1, 1,
0.9952994, -0.6286982, 0.7984098, 0, 0, 0, 1, 1,
0.9968057, -0.5472651, 2.678042, 0, 0, 0, 1, 1,
0.9991944, 0.6214787, 0.3494264, 0, 0, 0, 1, 1,
1.014025, 0.9716823, 1.904019, 0, 0, 0, 1, 1,
1.023857, -0.23935, 1.22018, 0, 0, 0, 1, 1,
1.02418, 1.43192, 0.04232243, 0, 0, 0, 1, 1,
1.037236, -1.952952, 2.017497, 1, 1, 1, 1, 1,
1.041674, 0.328202, 1.823748, 1, 1, 1, 1, 1,
1.051494, -0.06047086, 1.874792, 1, 1, 1, 1, 1,
1.054082, -2.192339, 1.162136, 1, 1, 1, 1, 1,
1.055019, 0.01822494, 0.3519517, 1, 1, 1, 1, 1,
1.055462, 0.9256828, -0.162952, 1, 1, 1, 1, 1,
1.056896, -1.849638, 4.218025, 1, 1, 1, 1, 1,
1.059102, 0.1004227, 2.437424, 1, 1, 1, 1, 1,
1.062858, 1.50303, 0.9462164, 1, 1, 1, 1, 1,
1.076815, -1.182943, 3.091288, 1, 1, 1, 1, 1,
1.081095, -1.611183, 2.986965, 1, 1, 1, 1, 1,
1.085825, -0.6812019, 3.066198, 1, 1, 1, 1, 1,
1.087191, -0.0171212, 0.803488, 1, 1, 1, 1, 1,
1.099673, -0.1513245, 1.74755, 1, 1, 1, 1, 1,
1.103775, -1.333869, 2.877489, 1, 1, 1, 1, 1,
1.103888, 0.8230805, 2.126065, 0, 0, 1, 1, 1,
1.105564, 1.016737, 2.653286, 1, 0, 0, 1, 1,
1.118308, 1.10764, 0.2932382, 1, 0, 0, 1, 1,
1.120993, 0.154888, 2.768798, 1, 0, 0, 1, 1,
1.126641, -1.001182, 2.350885, 1, 0, 0, 1, 1,
1.144788, 0.681595, -1.425277, 1, 0, 0, 1, 1,
1.146379, -0.3364359, 3.312439, 0, 0, 0, 1, 1,
1.147439, -0.3983786, 2.079933, 0, 0, 0, 1, 1,
1.148106, -0.4300746, 2.116522, 0, 0, 0, 1, 1,
1.155816, 1.251363, -0.0202273, 0, 0, 0, 1, 1,
1.157543, -0.6253589, -0.803664, 0, 0, 0, 1, 1,
1.157588, 0.1357044, 0.3265721, 0, 0, 0, 1, 1,
1.172562, -0.9991255, 2.538314, 0, 0, 0, 1, 1,
1.183133, 0.1360632, 2.384979, 1, 1, 1, 1, 1,
1.197943, -2.029664, 1.724995, 1, 1, 1, 1, 1,
1.201618, 0.2480931, 1.566184, 1, 1, 1, 1, 1,
1.202223, -0.2410274, 1.290672, 1, 1, 1, 1, 1,
1.203275, 0.4556468, 1.275399, 1, 1, 1, 1, 1,
1.205125, 0.2107897, 0.7540752, 1, 1, 1, 1, 1,
1.208255, 1.101802, 1.925019, 1, 1, 1, 1, 1,
1.21071, 0.3550304, 2.581973, 1, 1, 1, 1, 1,
1.21894, -0.1271511, 2.783698, 1, 1, 1, 1, 1,
1.219482, 0.2035527, 1.340366, 1, 1, 1, 1, 1,
1.230457, 0.9757298, 1.663062, 1, 1, 1, 1, 1,
1.23136, 0.413218, -0.4878419, 1, 1, 1, 1, 1,
1.243959, 0.1408212, 1.623812, 1, 1, 1, 1, 1,
1.248607, -0.2697622, 2.998122, 1, 1, 1, 1, 1,
1.260553, 1.175065, -0.4036299, 1, 1, 1, 1, 1,
1.262448, -1.046739, 2.849048, 0, 0, 1, 1, 1,
1.265776, -0.5292528, 2.193877, 1, 0, 0, 1, 1,
1.267305, 0.01860625, 1.007314, 1, 0, 0, 1, 1,
1.272933, 0.1105936, 0.8494747, 1, 0, 0, 1, 1,
1.274572, 1.420835, 0.9402515, 1, 0, 0, 1, 1,
1.276431, -0.04850026, 1.203167, 1, 0, 0, 1, 1,
1.276477, -0.6504892, 3.113358, 0, 0, 0, 1, 1,
1.283191, 0.8361678, 0.8581761, 0, 0, 0, 1, 1,
1.291464, -0.3081429, 1.202117, 0, 0, 0, 1, 1,
1.292091, 1.621802, 1.329575, 0, 0, 0, 1, 1,
1.299353, 1.23239, 0.7446361, 0, 0, 0, 1, 1,
1.304433, 0.3922242, 0.976928, 0, 0, 0, 1, 1,
1.317255, -0.8103809, 1.141487, 0, 0, 0, 1, 1,
1.323275, -0.09270208, 0.5430136, 1, 1, 1, 1, 1,
1.326697, 1.428952, 0.979147, 1, 1, 1, 1, 1,
1.335592, 0.4939375, 1.919402, 1, 1, 1, 1, 1,
1.335873, -1.570681, 2.014616, 1, 1, 1, 1, 1,
1.338595, -0.9530903, 3.214695, 1, 1, 1, 1, 1,
1.34352, 0.5676789, 0.02792125, 1, 1, 1, 1, 1,
1.367664, -1.64924, 2.219572, 1, 1, 1, 1, 1,
1.381376, -0.02374561, 2.561766, 1, 1, 1, 1, 1,
1.383552, -0.8884499, 0.9157333, 1, 1, 1, 1, 1,
1.384016, 2.355231, -0.5880846, 1, 1, 1, 1, 1,
1.387669, -0.1993912, 1.707032, 1, 1, 1, 1, 1,
1.392427, -0.2044753, 2.32334, 1, 1, 1, 1, 1,
1.395276, 0.5026071, 1.39986, 1, 1, 1, 1, 1,
1.400299, -0.9001873, 1.54375, 1, 1, 1, 1, 1,
1.403576, 0.2049155, 2.298655, 1, 1, 1, 1, 1,
1.413203, -1.725453, 1.588097, 0, 0, 1, 1, 1,
1.43295, 0.6679946, 1.233747, 1, 0, 0, 1, 1,
1.436217, 0.2975843, -0.667981, 1, 0, 0, 1, 1,
1.457713, 0.1886785, 1.913196, 1, 0, 0, 1, 1,
1.475656, -1.164331, 4.169442, 1, 0, 0, 1, 1,
1.478245, -0.4741606, 1.78083, 1, 0, 0, 1, 1,
1.478593, 0.5255426, 3.162628, 0, 0, 0, 1, 1,
1.481372, 0.05877507, 0.0186178, 0, 0, 0, 1, 1,
1.481413, -1.579378, 2.153327, 0, 0, 0, 1, 1,
1.491866, 0.7356039, 0.1728872, 0, 0, 0, 1, 1,
1.513773, -0.6046811, 2.044867, 0, 0, 0, 1, 1,
1.525221, -0.1657132, 1.55566, 0, 0, 0, 1, 1,
1.526884, -1.912719, 1.834818, 0, 0, 0, 1, 1,
1.528318, -0.4801344, 0.9238721, 1, 1, 1, 1, 1,
1.545378, -0.001278423, 1.319394, 1, 1, 1, 1, 1,
1.564729, -0.1424461, 0.869739, 1, 1, 1, 1, 1,
1.566512, -0.07278598, 1.246196, 1, 1, 1, 1, 1,
1.569683, 0.07219627, 0.2321062, 1, 1, 1, 1, 1,
1.572406, -1.598324, 2.205174, 1, 1, 1, 1, 1,
1.599909, 0.4821298, 0.3073017, 1, 1, 1, 1, 1,
1.604365, 0.1990653, 1.656929, 1, 1, 1, 1, 1,
1.609354, -1.432616, 3.5298, 1, 1, 1, 1, 1,
1.620639, 0.7994596, 0.1518183, 1, 1, 1, 1, 1,
1.641197, -0.6852465, 2.324065, 1, 1, 1, 1, 1,
1.642617, -1.396333, 1.666809, 1, 1, 1, 1, 1,
1.651832, -0.2657227, 2.317459, 1, 1, 1, 1, 1,
1.656205, 0.080322, 0.6158558, 1, 1, 1, 1, 1,
1.663262, -2.054126, 2.255459, 1, 1, 1, 1, 1,
1.663588, 1.003661, 0.3646787, 0, 0, 1, 1, 1,
1.680566, -0.01854809, 1.81937, 1, 0, 0, 1, 1,
1.683181, 1.001258, 0.03841962, 1, 0, 0, 1, 1,
1.689777, -1.519809, 2.502007, 1, 0, 0, 1, 1,
1.698345, 0.1023716, 0.2021306, 1, 0, 0, 1, 1,
1.705383, -0.5233103, 2.491113, 1, 0, 0, 1, 1,
1.709999, 2.099426, -0.5342607, 0, 0, 0, 1, 1,
1.714379, -0.08500231, -0.2048474, 0, 0, 0, 1, 1,
1.723271, -0.525104, 0.8444517, 0, 0, 0, 1, 1,
1.729471, -1.260392, 0.6599205, 0, 0, 0, 1, 1,
1.78317, -0.1893522, 0.9238879, 0, 0, 0, 1, 1,
1.789261, 1.161245, 2.358417, 0, 0, 0, 1, 1,
1.803038, 0.159771, 0.6752215, 0, 0, 0, 1, 1,
1.820568, 0.08487858, 0.6207392, 1, 1, 1, 1, 1,
1.836333, 0.1032356, 2.494928, 1, 1, 1, 1, 1,
1.842634, 1.187188, 1.475518, 1, 1, 1, 1, 1,
1.860935, 1.868847, 1.464742, 1, 1, 1, 1, 1,
1.866132, 1.101183, 1.142048, 1, 1, 1, 1, 1,
1.866198, -1.223964, 1.081199, 1, 1, 1, 1, 1,
1.867399, 0.2309255, 2.449012, 1, 1, 1, 1, 1,
1.907002, -1.089016, 3.263036, 1, 1, 1, 1, 1,
1.920716, 0.8841232, 1.515351, 1, 1, 1, 1, 1,
1.949497, -0.843848, 0.8402523, 1, 1, 1, 1, 1,
1.950058, 0.08697306, 1.095348, 1, 1, 1, 1, 1,
2.002641, 0.1685598, 1.331597, 1, 1, 1, 1, 1,
2.006169, -1.726606, 3.125262, 1, 1, 1, 1, 1,
2.013888, 1.154156, 0.6588321, 1, 1, 1, 1, 1,
2.020662, 0.411055, 0.1874261, 1, 1, 1, 1, 1,
2.028318, 1.003917, 0.7392905, 0, 0, 1, 1, 1,
2.042493, -0.04782649, 1.954963, 1, 0, 0, 1, 1,
2.060839, 0.2981781, 0.3341105, 1, 0, 0, 1, 1,
2.106471, -0.9489309, 2.261081, 1, 0, 0, 1, 1,
2.141001, -0.7571351, 0.245011, 1, 0, 0, 1, 1,
2.143979, 0.3849435, 0.4757022, 1, 0, 0, 1, 1,
2.198206, -0.7530794, 2.001213, 0, 0, 0, 1, 1,
2.204491, -0.7873895, 1.398133, 0, 0, 0, 1, 1,
2.301605, -0.9061971, 0.6191158, 0, 0, 0, 1, 1,
2.327556, 0.3429407, 2.010029, 0, 0, 0, 1, 1,
2.352973, -0.1170761, 2.506281, 0, 0, 0, 1, 1,
2.469562, -0.1390224, 1.779283, 0, 0, 0, 1, 1,
2.497488, 0.2890281, 1.717807, 0, 0, 0, 1, 1,
2.546791, 0.1808452, 1.08684, 1, 1, 1, 1, 1,
2.591496, 1.062388, -0.4698057, 1, 1, 1, 1, 1,
2.642573, 0.05438392, -0.1253692, 1, 1, 1, 1, 1,
2.802075, -0.0376443, 3.467937, 1, 1, 1, 1, 1,
2.818938, -1.331297, 3.313434, 1, 1, 1, 1, 1,
2.900344, 0.5991437, 3.487711, 1, 1, 1, 1, 1,
3.733586, 0.1593587, 0.4403946, 1, 1, 1, 1, 1
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
var radius = 10.02949;
var distance = 35.22816;
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
mvMatrix.translate( -0.3428168, 0.03582835, 0.2288816 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.22816);
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
