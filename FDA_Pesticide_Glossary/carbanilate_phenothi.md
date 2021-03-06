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
-3.037099, 0.7070078, -0.8202955, 1, 0, 0, 1,
-2.921932, -0.8085394, -1.224084, 1, 0.007843138, 0, 1,
-2.891124, -1.02823, -3.762251, 1, 0.01176471, 0, 1,
-2.460715, -0.6714575, -3.205305, 1, 0.01960784, 0, 1,
-2.406569, -0.4669749, -1.196165, 1, 0.02352941, 0, 1,
-2.347253, -0.3986553, -0.2509496, 1, 0.03137255, 0, 1,
-2.327983, -1.440959, -0.4866304, 1, 0.03529412, 0, 1,
-2.30665, 0.2728951, -1.930178, 1, 0.04313726, 0, 1,
-2.285292, -0.2433034, -2.169911, 1, 0.04705882, 0, 1,
-2.246456, -0.8026571, -0.6930864, 1, 0.05490196, 0, 1,
-2.221635, -1.209708, -2.390563, 1, 0.05882353, 0, 1,
-2.221527, -0.9709619, -1.284225, 1, 0.06666667, 0, 1,
-2.165242, 0.2963749, -0.1956776, 1, 0.07058824, 0, 1,
-2.102285, -0.02504165, -3.041454, 1, 0.07843138, 0, 1,
-2.022316, 0.02465587, -1.00759, 1, 0.08235294, 0, 1,
-2.020934, -0.1427149, -1.76307, 1, 0.09019608, 0, 1,
-2.005776, 1.42879, -1.218206, 1, 0.09411765, 0, 1,
-1.985661, 0.9617252, -0.4183638, 1, 0.1019608, 0, 1,
-1.980419, -0.1809483, -0.5372684, 1, 0.1098039, 0, 1,
-1.960999, 1.53589, -0.5031209, 1, 0.1137255, 0, 1,
-1.913966, 0.5438501, -1.619778, 1, 0.1215686, 0, 1,
-1.910144, 0.2366918, -2.841053, 1, 0.1254902, 0, 1,
-1.86979, 1.038724, -1.67186, 1, 0.1333333, 0, 1,
-1.857604, 0.1013485, -1.745051, 1, 0.1372549, 0, 1,
-1.85577, -1.026961, -2.804917, 1, 0.145098, 0, 1,
-1.77701, 0.6675405, -1.278306, 1, 0.1490196, 0, 1,
-1.755398, 0.09497076, -0.3409006, 1, 0.1568628, 0, 1,
-1.753077, -0.350102, -0.01376, 1, 0.1607843, 0, 1,
-1.721069, 0.1014451, -2.524992, 1, 0.1686275, 0, 1,
-1.711552, -0.03040629, -0.8182101, 1, 0.172549, 0, 1,
-1.707327, 1.475924, -1.475894, 1, 0.1803922, 0, 1,
-1.692094, -1.995637, -2.573326, 1, 0.1843137, 0, 1,
-1.677303, -1.276767, -2.112507, 1, 0.1921569, 0, 1,
-1.672479, -1.467631, -0.6020401, 1, 0.1960784, 0, 1,
-1.668887, -0.7427824, 0.4892281, 1, 0.2039216, 0, 1,
-1.665309, -2.406803, -3.374641, 1, 0.2117647, 0, 1,
-1.649998, 0.4133364, -0.2459682, 1, 0.2156863, 0, 1,
-1.647991, -0.6269712, -3.641919, 1, 0.2235294, 0, 1,
-1.645077, 0.4399521, -2.492623, 1, 0.227451, 0, 1,
-1.637501, -0.1204724, -1.93914, 1, 0.2352941, 0, 1,
-1.632163, -1.624631, -2.943074, 1, 0.2392157, 0, 1,
-1.618408, 1.672231, -0.06102331, 1, 0.2470588, 0, 1,
-1.612761, 0.7692007, -1.408411, 1, 0.2509804, 0, 1,
-1.610973, 0.0946558, -2.341111, 1, 0.2588235, 0, 1,
-1.599352, -1.677291, -4.840689, 1, 0.2627451, 0, 1,
-1.582671, 1.297161, -0.3572205, 1, 0.2705882, 0, 1,
-1.567423, -0.1935503, -0.8800727, 1, 0.2745098, 0, 1,
-1.55497, -0.987207, -1.073853, 1, 0.282353, 0, 1,
-1.544318, -1.122197, -2.727018, 1, 0.2862745, 0, 1,
-1.533556, -0.6171717, -1.66784, 1, 0.2941177, 0, 1,
-1.524769, 0.4069875, -2.553607, 1, 0.3019608, 0, 1,
-1.519133, 0.8040961, -0.3288242, 1, 0.3058824, 0, 1,
-1.50692, -0.1926505, -2.911065, 1, 0.3137255, 0, 1,
-1.505828, -0.5561143, -3.51516, 1, 0.3176471, 0, 1,
-1.50344, -0.04535244, -0.9508774, 1, 0.3254902, 0, 1,
-1.494661, -0.4778754, -2.714065, 1, 0.3294118, 0, 1,
-1.486238, -1.113532, -1.962361, 1, 0.3372549, 0, 1,
-1.485887, -1.267734, -1.563573, 1, 0.3411765, 0, 1,
-1.485473, -0.2127756, -2.362074, 1, 0.3490196, 0, 1,
-1.482197, 0.4917805, -1.861607, 1, 0.3529412, 0, 1,
-1.465952, -0.1906471, -1.355867, 1, 0.3607843, 0, 1,
-1.46242, 1.082633, -2.201849, 1, 0.3647059, 0, 1,
-1.461083, 0.05901127, -1.781093, 1, 0.372549, 0, 1,
-1.45479, -1.242834, -2.189873, 1, 0.3764706, 0, 1,
-1.417301, 0.9470012, -2.030688, 1, 0.3843137, 0, 1,
-1.413467, -0.1701031, -1.285852, 1, 0.3882353, 0, 1,
-1.406081, 0.0535923, -3.244459, 1, 0.3960784, 0, 1,
-1.39912, -0.2097852, -0.2604539, 1, 0.4039216, 0, 1,
-1.396008, 0.8855082, -0.2453111, 1, 0.4078431, 0, 1,
-1.388105, -0.2973432, -1.460599, 1, 0.4156863, 0, 1,
-1.369173, 0.3454321, -1.780494, 1, 0.4196078, 0, 1,
-1.367954, 1.270002, 0.4355965, 1, 0.427451, 0, 1,
-1.364066, -0.2890724, 0.03918715, 1, 0.4313726, 0, 1,
-1.360486, -0.9048137, -1.439102, 1, 0.4392157, 0, 1,
-1.358369, -0.004139141, -1.511964, 1, 0.4431373, 0, 1,
-1.357747, 0.3546577, -3.407164, 1, 0.4509804, 0, 1,
-1.353449, 1.690237, -1.04499, 1, 0.454902, 0, 1,
-1.340601, -0.2453185, -4.123958, 1, 0.4627451, 0, 1,
-1.336713, -1.66948, -4.150023, 1, 0.4666667, 0, 1,
-1.333924, 0.3943821, -0.9947481, 1, 0.4745098, 0, 1,
-1.331933, 0.7924834, -0.4172885, 1, 0.4784314, 0, 1,
-1.330134, 1.126442, 0.553537, 1, 0.4862745, 0, 1,
-1.320267, 1.236367, 0.9808489, 1, 0.4901961, 0, 1,
-1.311069, 0.4688386, -3.375571, 1, 0.4980392, 0, 1,
-1.307302, 0.006095635, -2.169483, 1, 0.5058824, 0, 1,
-1.2985, 1.121921, -0.8988575, 1, 0.509804, 0, 1,
-1.295845, -1.39593, -1.587345, 1, 0.5176471, 0, 1,
-1.293195, 0.05215757, -1.343309, 1, 0.5215687, 0, 1,
-1.293092, 0.1589033, -1.172938, 1, 0.5294118, 0, 1,
-1.285607, -0.8018396, -1.942879, 1, 0.5333334, 0, 1,
-1.276491, -0.7491284, -1.523049, 1, 0.5411765, 0, 1,
-1.260788, -0.1113701, -0.531966, 1, 0.5450981, 0, 1,
-1.245163, 2.803966, 0.3894368, 1, 0.5529412, 0, 1,
-1.241272, 1.114211, 0.2484237, 1, 0.5568628, 0, 1,
-1.229861, -2.374186, -4.454718, 1, 0.5647059, 0, 1,
-1.218038, 0.1806897, -0.5494225, 1, 0.5686275, 0, 1,
-1.217056, 0.3491521, 0.6213067, 1, 0.5764706, 0, 1,
-1.215914, 0.3679534, -0.9807535, 1, 0.5803922, 0, 1,
-1.213312, -0.6397957, -1.747709, 1, 0.5882353, 0, 1,
-1.2127, -0.2647564, -4.736638, 1, 0.5921569, 0, 1,
-1.211729, 1.523899, -1.392649, 1, 0.6, 0, 1,
-1.206907, 0.6522183, -1.597342, 1, 0.6078432, 0, 1,
-1.195283, -0.3381794, -0.4379578, 1, 0.6117647, 0, 1,
-1.19173, 0.1062701, -1.225774, 1, 0.6196079, 0, 1,
-1.158793, -1.030509, -1.989761, 1, 0.6235294, 0, 1,
-1.157815, -1.437654, -1.422006, 1, 0.6313726, 0, 1,
-1.155918, 0.01492035, -3.103908, 1, 0.6352941, 0, 1,
-1.145343, 0.185775, -1.670035, 1, 0.6431373, 0, 1,
-1.144271, 1.006277, 0.04645418, 1, 0.6470588, 0, 1,
-1.14368, 1.981498, -1.337304, 1, 0.654902, 0, 1,
-1.141367, 0.6428811, 0.3295909, 1, 0.6588235, 0, 1,
-1.138492, -0.3809998, -2.767066, 1, 0.6666667, 0, 1,
-1.136732, -1.090686, -4.044274, 1, 0.6705883, 0, 1,
-1.135387, 0.5414085, -1.530166, 1, 0.6784314, 0, 1,
-1.132407, 0.3583187, -1.561143, 1, 0.682353, 0, 1,
-1.131042, -0.09622888, -2.811875, 1, 0.6901961, 0, 1,
-1.121864, 0.4054699, -1.518566, 1, 0.6941177, 0, 1,
-1.119079, -2.00292, -4.68942, 1, 0.7019608, 0, 1,
-1.117443, -1.352741, -1.018445, 1, 0.7098039, 0, 1,
-1.114177, -0.2106389, -2.560805, 1, 0.7137255, 0, 1,
-1.110968, 0.5251777, -2.767787, 1, 0.7215686, 0, 1,
-1.104455, 0.2844801, -1.568242, 1, 0.7254902, 0, 1,
-1.100964, 0.955797, -0.04501241, 1, 0.7333333, 0, 1,
-1.100332, -0.9658086, -2.816241, 1, 0.7372549, 0, 1,
-1.099351, 1.866124, -1.597131, 1, 0.7450981, 0, 1,
-1.09813, 0.6493232, -1.445093, 1, 0.7490196, 0, 1,
-1.091019, -1.447751, -3.171809, 1, 0.7568628, 0, 1,
-1.088089, -1.029464, -2.048447, 1, 0.7607843, 0, 1,
-1.086291, 0.1222337, -2.781599, 1, 0.7686275, 0, 1,
-1.080654, 1.716901, -0.4849824, 1, 0.772549, 0, 1,
-1.074555, 1.392642, -1.72346, 1, 0.7803922, 0, 1,
-1.072896, 1.103796, -2.380129, 1, 0.7843137, 0, 1,
-1.069678, 1.531465, -0.3354663, 1, 0.7921569, 0, 1,
-1.067642, -0.08464727, -0.7621429, 1, 0.7960784, 0, 1,
-1.051445, 1.121358, -1.842808, 1, 0.8039216, 0, 1,
-1.049975, 1.147238, -1.258581, 1, 0.8117647, 0, 1,
-1.046173, -0.5052688, -4.050896, 1, 0.8156863, 0, 1,
-1.038247, -0.1629787, -1.150146, 1, 0.8235294, 0, 1,
-1.034723, 0.2620968, -0.5313923, 1, 0.827451, 0, 1,
-1.021243, 1.061734, -0.4917359, 1, 0.8352941, 0, 1,
-1.018457, -1.079949, -3.206834, 1, 0.8392157, 0, 1,
-1.014613, 0.80533, 1.093653, 1, 0.8470588, 0, 1,
-1.012061, 0.3492095, 1.371896, 1, 0.8509804, 0, 1,
-1.010433, 1.309195, -0.3110126, 1, 0.8588235, 0, 1,
-1.008082, 0.2634023, -0.1204671, 1, 0.8627451, 0, 1,
-1.006567, 0.24337, -2.704328, 1, 0.8705882, 0, 1,
-0.9949976, -0.5459271, -4.179011, 1, 0.8745098, 0, 1,
-0.9894547, 0.2454476, -0.7221795, 1, 0.8823529, 0, 1,
-0.9890042, -0.448564, -2.441892, 1, 0.8862745, 0, 1,
-0.986058, -0.4616382, -2.276575, 1, 0.8941177, 0, 1,
-0.9859505, 0.4235686, -0.2686059, 1, 0.8980392, 0, 1,
-0.9814301, 0.5462658, -1.2138, 1, 0.9058824, 0, 1,
-0.9803787, 0.7323195, 1.40334, 1, 0.9137255, 0, 1,
-0.9793453, -0.5330437, -1.710779, 1, 0.9176471, 0, 1,
-0.9786481, 1.862542, -1.952244, 1, 0.9254902, 0, 1,
-0.9757172, 0.01886893, -0.1034734, 1, 0.9294118, 0, 1,
-0.9649476, 0.24194, -2.000916, 1, 0.9372549, 0, 1,
-0.9606088, 1.344974, -0.04024846, 1, 0.9411765, 0, 1,
-0.9571846, -0.8853191, -3.358364, 1, 0.9490196, 0, 1,
-0.9552126, -0.09253688, -2.643725, 1, 0.9529412, 0, 1,
-0.9529222, -2.273631, -1.538344, 1, 0.9607843, 0, 1,
-0.9516972, 0.6221182, -1.544386, 1, 0.9647059, 0, 1,
-0.9500534, 0.2872967, -0.7117561, 1, 0.972549, 0, 1,
-0.9495797, 0.9444206, -1.40232, 1, 0.9764706, 0, 1,
-0.9493343, 0.8300126, -1.133164, 1, 0.9843137, 0, 1,
-0.9453129, 0.7458301, -0.01114863, 1, 0.9882353, 0, 1,
-0.9437194, -0.4039436, -3.09953, 1, 0.9960784, 0, 1,
-0.9385455, 1.539285, -2.03859, 0.9960784, 1, 0, 1,
-0.9383403, 0.02246403, -1.397566, 0.9921569, 1, 0, 1,
-0.9352682, -1.46475, -2.527886, 0.9843137, 1, 0, 1,
-0.935178, -1.052009, -2.323612, 0.9803922, 1, 0, 1,
-0.933306, 0.1830121, -1.289484, 0.972549, 1, 0, 1,
-0.9314191, -0.8249705, -2.702695, 0.9686275, 1, 0, 1,
-0.9193919, 1.162024, 1.529779, 0.9607843, 1, 0, 1,
-0.9083437, 1.328394, -0.6394331, 0.9568627, 1, 0, 1,
-0.9080094, 0.5007933, -1.797411, 0.9490196, 1, 0, 1,
-0.9038409, -0.8236559, -1.750197, 0.945098, 1, 0, 1,
-0.9036351, -0.343076, -1.894944, 0.9372549, 1, 0, 1,
-0.899996, 1.205949, -0.6517735, 0.9333333, 1, 0, 1,
-0.8992074, 1.678329, -0.7466672, 0.9254902, 1, 0, 1,
-0.877153, -0.3551926, -3.953209, 0.9215686, 1, 0, 1,
-0.8703472, -0.8391928, -2.453856, 0.9137255, 1, 0, 1,
-0.8700049, -0.04889213, -1.776708, 0.9098039, 1, 0, 1,
-0.8663103, 0.3590864, -2.983371, 0.9019608, 1, 0, 1,
-0.8653361, -0.849034, -3.796612, 0.8941177, 1, 0, 1,
-0.8637015, 0.9425278, 0.6718197, 0.8901961, 1, 0, 1,
-0.8633343, 0.8619574, 0.2054288, 0.8823529, 1, 0, 1,
-0.8626888, -1.055144, -1.897904, 0.8784314, 1, 0, 1,
-0.862295, -0.5678823, -3.360634, 0.8705882, 1, 0, 1,
-0.8576696, 0.4953637, -1.500594, 0.8666667, 1, 0, 1,
-0.856739, -0.221682, -2.232344, 0.8588235, 1, 0, 1,
-0.8563841, -2.067462, -0.7855042, 0.854902, 1, 0, 1,
-0.8540202, 0.6558043, 0.02114024, 0.8470588, 1, 0, 1,
-0.8515083, 0.4722801, 0.4833362, 0.8431373, 1, 0, 1,
-0.8458014, 0.7190791, -1.671062, 0.8352941, 1, 0, 1,
-0.8384678, 0.2606378, -2.189297, 0.8313726, 1, 0, 1,
-0.8384525, -0.5999826, -3.606371, 0.8235294, 1, 0, 1,
-0.8378913, -0.454158, -2.765951, 0.8196079, 1, 0, 1,
-0.83697, -0.5266384, -1.348542, 0.8117647, 1, 0, 1,
-0.8348515, 0.5646474, -0.05993934, 0.8078431, 1, 0, 1,
-0.831784, 0.001893003, -2.719373, 0.8, 1, 0, 1,
-0.827903, 1.116401, 0.9139592, 0.7921569, 1, 0, 1,
-0.8197618, -0.4476846, -1.448896, 0.7882353, 1, 0, 1,
-0.8135832, 0.3932432, -1.908212, 0.7803922, 1, 0, 1,
-0.8028668, 0.6489005, -1.434307, 0.7764706, 1, 0, 1,
-0.8020818, 0.4566565, -3.144112, 0.7686275, 1, 0, 1,
-0.8007818, 0.485782, -2.036775, 0.7647059, 1, 0, 1,
-0.799092, 0.6063659, -1.064795, 0.7568628, 1, 0, 1,
-0.7983926, -0.4103868, 0.1233478, 0.7529412, 1, 0, 1,
-0.7933366, -1.049382, -0.7522706, 0.7450981, 1, 0, 1,
-0.7926859, 0.6662083, 0.4391119, 0.7411765, 1, 0, 1,
-0.792197, -0.7587509, -1.841357, 0.7333333, 1, 0, 1,
-0.7920445, 0.06705972, -0.6290794, 0.7294118, 1, 0, 1,
-0.7885966, -0.1510592, -0.8291268, 0.7215686, 1, 0, 1,
-0.7884394, 1.532049, 0.05200917, 0.7176471, 1, 0, 1,
-0.7762808, -0.4638964, -1.555821, 0.7098039, 1, 0, 1,
-0.7651583, -0.3288555, -1.591581, 0.7058824, 1, 0, 1,
-0.7601546, -0.4850151, -1.883837, 0.6980392, 1, 0, 1,
-0.7598906, -0.8061892, -1.39932, 0.6901961, 1, 0, 1,
-0.7561886, 0.5160621, 0.6821799, 0.6862745, 1, 0, 1,
-0.7524902, -0.2051582, -0.8581681, 0.6784314, 1, 0, 1,
-0.7460186, 0.3718561, -0.08181832, 0.6745098, 1, 0, 1,
-0.7413743, 0.5206819, -0.6972175, 0.6666667, 1, 0, 1,
-0.74055, 1.514101, -1.61181, 0.6627451, 1, 0, 1,
-0.7373993, -0.3325423, -2.873999, 0.654902, 1, 0, 1,
-0.7281604, -0.6771161, -2.392065, 0.6509804, 1, 0, 1,
-0.7279113, -0.4982927, -1.097086, 0.6431373, 1, 0, 1,
-0.7277231, -1.554195, -3.636595, 0.6392157, 1, 0, 1,
-0.7276152, -1.561706, -2.5387, 0.6313726, 1, 0, 1,
-0.7250134, 0.9283313, -0.7005356, 0.627451, 1, 0, 1,
-0.7206566, 0.3003766, -1.230041, 0.6196079, 1, 0, 1,
-0.7203521, 1.09474, -1.411326, 0.6156863, 1, 0, 1,
-0.7164613, 0.4466528, -0.716423, 0.6078432, 1, 0, 1,
-0.7117404, -1.014748, -1.431525, 0.6039216, 1, 0, 1,
-0.7067205, 0.349178, -2.284418, 0.5960785, 1, 0, 1,
-0.7043879, 0.4944753, -1.328563, 0.5882353, 1, 0, 1,
-0.7041909, 1.179732, -0.6652618, 0.5843138, 1, 0, 1,
-0.7032561, 0.4675744, -0.7525119, 0.5764706, 1, 0, 1,
-0.6963258, 0.2194527, -2.927986, 0.572549, 1, 0, 1,
-0.6936554, 0.5807948, 0.1339629, 0.5647059, 1, 0, 1,
-0.6927763, -0.02831345, -0.686359, 0.5607843, 1, 0, 1,
-0.6925537, -0.1709489, -0.6036304, 0.5529412, 1, 0, 1,
-0.6833121, -0.3737388, -2.460845, 0.5490196, 1, 0, 1,
-0.6707485, 1.325399, -0.8370969, 0.5411765, 1, 0, 1,
-0.6651794, 1.560602, -2.530885, 0.5372549, 1, 0, 1,
-0.6634988, 0.6179621, -1.535636, 0.5294118, 1, 0, 1,
-0.6611314, -1.377487, -2.560667, 0.5254902, 1, 0, 1,
-0.6604975, 0.9184281, 0.02233176, 0.5176471, 1, 0, 1,
-0.659787, -1.310933, -1.357603, 0.5137255, 1, 0, 1,
-0.6540717, 0.5641322, -2.166874, 0.5058824, 1, 0, 1,
-0.6513088, -0.369391, -0.3225179, 0.5019608, 1, 0, 1,
-0.651156, -0.6812357, -3.270871, 0.4941176, 1, 0, 1,
-0.6491904, -1.037177, 0.250594, 0.4862745, 1, 0, 1,
-0.6464539, 1.046455, -2.081561, 0.4823529, 1, 0, 1,
-0.6455446, -1.352976, -2.451295, 0.4745098, 1, 0, 1,
-0.6402109, -0.1633541, -1.696173, 0.4705882, 1, 0, 1,
-0.635681, 0.4001921, -1.456412, 0.4627451, 1, 0, 1,
-0.628817, -0.9331425, -1.83419, 0.4588235, 1, 0, 1,
-0.6285266, 1.160557, -2.056088, 0.4509804, 1, 0, 1,
-0.6275017, 0.38914, -0.5741386, 0.4470588, 1, 0, 1,
-0.6256739, 1.454061, -1.731713, 0.4392157, 1, 0, 1,
-0.6199955, -0.02557111, -1.656307, 0.4352941, 1, 0, 1,
-0.6159545, 1.37773, -1.001778, 0.427451, 1, 0, 1,
-0.6097578, -0.2383763, -1.053465, 0.4235294, 1, 0, 1,
-0.6096702, -0.9169765, -2.922158, 0.4156863, 1, 0, 1,
-0.6063856, 0.807319, -0.6347961, 0.4117647, 1, 0, 1,
-0.6050903, 0.2886781, -2.938889, 0.4039216, 1, 0, 1,
-0.6049389, -0.6441127, -2.67085, 0.3960784, 1, 0, 1,
-0.6019722, 1.940531, -0.1014137, 0.3921569, 1, 0, 1,
-0.5948959, -0.6491902, -2.1962, 0.3843137, 1, 0, 1,
-0.5922609, 0.9614868, -1.187853, 0.3803922, 1, 0, 1,
-0.5908874, 0.9847334, -1.165363, 0.372549, 1, 0, 1,
-0.5879608, -0.9294502, -2.522362, 0.3686275, 1, 0, 1,
-0.5862756, 0.2425041, -1.405437, 0.3607843, 1, 0, 1,
-0.5842484, 0.4061635, -0.961546, 0.3568628, 1, 0, 1,
-0.5813776, 1.183178, -0.595217, 0.3490196, 1, 0, 1,
-0.5793018, -1.190402, -0.7032606, 0.345098, 1, 0, 1,
-0.5778943, -0.4094978, -2.263957, 0.3372549, 1, 0, 1,
-0.5712186, 1.203243, 0.08811366, 0.3333333, 1, 0, 1,
-0.5700328, -0.3290055, -2.972369, 0.3254902, 1, 0, 1,
-0.5673773, 1.249636, -1.334377, 0.3215686, 1, 0, 1,
-0.567248, 0.9366561, 0.3148185, 0.3137255, 1, 0, 1,
-0.5652988, -1.095486, -3.804511, 0.3098039, 1, 0, 1,
-0.5638614, 1.306626, 0.93343, 0.3019608, 1, 0, 1,
-0.5608563, 0.771355, -2.609642, 0.2941177, 1, 0, 1,
-0.5478606, 0.4055773, -1.072554, 0.2901961, 1, 0, 1,
-0.5446718, 0.5566331, -1.096912, 0.282353, 1, 0, 1,
-0.5442014, -0.4248979, -1.279089, 0.2784314, 1, 0, 1,
-0.5423498, -0.1798026, -3.9516, 0.2705882, 1, 0, 1,
-0.5411755, -2.18618, -2.726799, 0.2666667, 1, 0, 1,
-0.5377649, 0.2945414, -0.3330495, 0.2588235, 1, 0, 1,
-0.5289871, -0.9089158, -4.031184, 0.254902, 1, 0, 1,
-0.525352, 0.6418642, -0.7649211, 0.2470588, 1, 0, 1,
-0.522022, -0.5474453, -2.565431, 0.2431373, 1, 0, 1,
-0.5215855, -1.992584, -2.156589, 0.2352941, 1, 0, 1,
-0.5203207, -0.121172, -1.196455, 0.2313726, 1, 0, 1,
-0.5126922, 1.552773, 0.3051168, 0.2235294, 1, 0, 1,
-0.5112149, 2.029291, -0.8077583, 0.2196078, 1, 0, 1,
-0.5111187, -0.1230312, -3.002425, 0.2117647, 1, 0, 1,
-0.5081421, -0.01375212, -2.002695, 0.2078431, 1, 0, 1,
-0.5080511, 0.6864786, -0.9229591, 0.2, 1, 0, 1,
-0.5047364, -0.2618029, -1.251507, 0.1921569, 1, 0, 1,
-0.502933, 0.5317428, -0.6041725, 0.1882353, 1, 0, 1,
-0.5021689, -0.6746417, -4.65479, 0.1803922, 1, 0, 1,
-0.4975317, -0.1437164, -2.303295, 0.1764706, 1, 0, 1,
-0.4919533, 1.844704, -0.2492138, 0.1686275, 1, 0, 1,
-0.4868012, 0.02466617, -0.05479844, 0.1647059, 1, 0, 1,
-0.4830177, -0.5485755, -3.527111, 0.1568628, 1, 0, 1,
-0.4822844, -1.711814, -2.564091, 0.1529412, 1, 0, 1,
-0.4811715, 0.8580504, -1.729156, 0.145098, 1, 0, 1,
-0.4764641, 0.6794415, -0.2283395, 0.1411765, 1, 0, 1,
-0.4764045, 1.73736, -0.3953397, 0.1333333, 1, 0, 1,
-0.4734587, 0.7424712, -0.8045644, 0.1294118, 1, 0, 1,
-0.4721975, 0.2682385, -1.602327, 0.1215686, 1, 0, 1,
-0.4687244, -1.061987, -3.130164, 0.1176471, 1, 0, 1,
-0.4661522, 0.8585861, -1.565988, 0.1098039, 1, 0, 1,
-0.4641559, -0.2906942, 0.1917951, 0.1058824, 1, 0, 1,
-0.4621337, -0.9040819, -3.368145, 0.09803922, 1, 0, 1,
-0.4609491, -0.06529681, -0.9098492, 0.09019608, 1, 0, 1,
-0.4597687, -2.296848, -3.928823, 0.08627451, 1, 0, 1,
-0.4543166, 0.04372395, -0.6126745, 0.07843138, 1, 0, 1,
-0.453869, 1.009428, 1.698305, 0.07450981, 1, 0, 1,
-0.4535592, 0.0481509, -2.097098, 0.06666667, 1, 0, 1,
-0.452828, -0.9551564, -1.979999, 0.0627451, 1, 0, 1,
-0.4512355, 0.4268426, -0.4878835, 0.05490196, 1, 0, 1,
-0.449977, -0.8164113, -1.146336, 0.05098039, 1, 0, 1,
-0.4447759, -1.511041, -2.225407, 0.04313726, 1, 0, 1,
-0.4406509, -0.1812573, -2.684681, 0.03921569, 1, 0, 1,
-0.4353576, 0.8479852, -0.963678, 0.03137255, 1, 0, 1,
-0.4336999, -1.141875, -4.621192, 0.02745098, 1, 0, 1,
-0.4325795, -0.8238369, -2.168883, 0.01960784, 1, 0, 1,
-0.4231292, -1.316593, -1.581467, 0.01568628, 1, 0, 1,
-0.415531, -1.6215, -5.412858, 0.007843138, 1, 0, 1,
-0.4077921, 0.02379827, -1.49557, 0.003921569, 1, 0, 1,
-0.407503, 0.5629695, 0.7722273, 0, 1, 0.003921569, 1,
-0.4054166, 1.384134, 0.4163489, 0, 1, 0.01176471, 1,
-0.4041654, -1.308559, -2.818293, 0, 1, 0.01568628, 1,
-0.3996079, 1.616902, 0.04829162, 0, 1, 0.02352941, 1,
-0.3987884, -0.1271227, -0.2264886, 0, 1, 0.02745098, 1,
-0.3963343, -0.84557, -4.176535, 0, 1, 0.03529412, 1,
-0.3953737, 0.6986982, 0.6806347, 0, 1, 0.03921569, 1,
-0.3928099, -0.9153761, -3.184257, 0, 1, 0.04705882, 1,
-0.391871, -0.2481222, -1.800117, 0, 1, 0.05098039, 1,
-0.3875024, -1.52131, -2.644444, 0, 1, 0.05882353, 1,
-0.3843291, 1.189315, -1.00549, 0, 1, 0.0627451, 1,
-0.3791881, 0.3277444, -1.304958, 0, 1, 0.07058824, 1,
-0.3765982, 1.974895, 0.5145914, 0, 1, 0.07450981, 1,
-0.3748517, 1.443183, -0.4538167, 0, 1, 0.08235294, 1,
-0.3704942, -0.3750795, -1.295343, 0, 1, 0.08627451, 1,
-0.3677615, 1.181635, 0.5070766, 0, 1, 0.09411765, 1,
-0.367279, -2.987257, -0.7681201, 0, 1, 0.1019608, 1,
-0.359233, -0.6373293, -2.422451, 0, 1, 0.1058824, 1,
-0.3574879, 0.5330091, -0.1756787, 0, 1, 0.1137255, 1,
-0.35616, 0.6376908, -0.1476451, 0, 1, 0.1176471, 1,
-0.3512301, 1.428767, 1.557959, 0, 1, 0.1254902, 1,
-0.3504788, 0.3686118, -0.7281481, 0, 1, 0.1294118, 1,
-0.3496689, -1.478182, -0.3064151, 0, 1, 0.1372549, 1,
-0.3390449, -0.4575903, -2.089079, 0, 1, 0.1411765, 1,
-0.3351035, 0.08738011, -1.75418, 0, 1, 0.1490196, 1,
-0.3339481, -0.7351001, -2.000904, 0, 1, 0.1529412, 1,
-0.3275784, -0.9213295, -2.478716, 0, 1, 0.1607843, 1,
-0.3262167, -0.2426991, -2.189756, 0, 1, 0.1647059, 1,
-0.3245874, -1.151186, -2.571985, 0, 1, 0.172549, 1,
-0.3238378, 2.093326, -1.05637, 0, 1, 0.1764706, 1,
-0.3227786, -1.26751, -3.314916, 0, 1, 0.1843137, 1,
-0.3198643, -0.2645745, -1.487199, 0, 1, 0.1882353, 1,
-0.3186116, -1.199615, -2.131047, 0, 1, 0.1960784, 1,
-0.3183011, -1.100284, -3.439479, 0, 1, 0.2039216, 1,
-0.3165001, 0.8374225, 0.7595491, 0, 1, 0.2078431, 1,
-0.3161352, -0.991652, -3.422515, 0, 1, 0.2156863, 1,
-0.3150217, 0.03845888, -1.121073, 0, 1, 0.2196078, 1,
-0.3117977, -0.7337155, -1.176532, 0, 1, 0.227451, 1,
-0.3111966, 0.3248595, 0.3796549, 0, 1, 0.2313726, 1,
-0.3082983, 1.161609, 0.195521, 0, 1, 0.2392157, 1,
-0.308234, -1.372874, -3.159384, 0, 1, 0.2431373, 1,
-0.3066117, 1.676716, -0.2838201, 0, 1, 0.2509804, 1,
-0.3058525, 1.137289, -0.8735905, 0, 1, 0.254902, 1,
-0.3044193, 0.8400059, -0.5275739, 0, 1, 0.2627451, 1,
-0.3039629, 0.1344977, -1.59692, 0, 1, 0.2666667, 1,
-0.3019199, -0.689549, -2.499629, 0, 1, 0.2745098, 1,
-0.3017932, -0.1865963, -1.349448, 0, 1, 0.2784314, 1,
-0.301625, 1.120535, -1.278292, 0, 1, 0.2862745, 1,
-0.3007587, 1.105866, 0.2794347, 0, 1, 0.2901961, 1,
-0.2942629, 1.188803, -0.5026729, 0, 1, 0.2980392, 1,
-0.2926826, -0.845818, -2.259331, 0, 1, 0.3058824, 1,
-0.2922617, 0.506662, -0.0568314, 0, 1, 0.3098039, 1,
-0.2921975, -0.374625, -2.579663, 0, 1, 0.3176471, 1,
-0.2889855, -0.2032931, -1.688618, 0, 1, 0.3215686, 1,
-0.2881756, 0.44525, -1.009217, 0, 1, 0.3294118, 1,
-0.2869995, -0.7990024, -3.197701, 0, 1, 0.3333333, 1,
-0.2863345, 0.407357, -0.8788233, 0, 1, 0.3411765, 1,
-0.2799872, 1.522803, -0.2904718, 0, 1, 0.345098, 1,
-0.2722611, 0.8327907, 1.004095, 0, 1, 0.3529412, 1,
-0.2718212, 0.1273614, -0.1108165, 0, 1, 0.3568628, 1,
-0.2699878, -0.1729895, -2.719022, 0, 1, 0.3647059, 1,
-0.2681397, 0.7494323, -1.065169, 0, 1, 0.3686275, 1,
-0.26576, -0.217225, -1.980729, 0, 1, 0.3764706, 1,
-0.2652168, 0.08149136, -0.4024297, 0, 1, 0.3803922, 1,
-0.2632473, -0.1044449, -1.634459, 0, 1, 0.3882353, 1,
-0.2588164, 0.4141819, -2.147103, 0, 1, 0.3921569, 1,
-0.2568026, 2.09484, -0.04545306, 0, 1, 0.4, 1,
-0.2460441, 0.2844205, -1.152768, 0, 1, 0.4078431, 1,
-0.2456878, 0.3595811, -1.065887, 0, 1, 0.4117647, 1,
-0.2422889, -0.7018479, -4.097703, 0, 1, 0.4196078, 1,
-0.2420173, 1.347495, -1.963839, 0, 1, 0.4235294, 1,
-0.2402044, 0.3573207, -0.0800164, 0, 1, 0.4313726, 1,
-0.2396845, -1.213, -2.329103, 0, 1, 0.4352941, 1,
-0.2304502, 0.3841537, 0.01540561, 0, 1, 0.4431373, 1,
-0.2292094, -1.714921, -4.335871, 0, 1, 0.4470588, 1,
-0.2265248, 0.6606587, 0.2054902, 0, 1, 0.454902, 1,
-0.2265097, 0.8409017, 1.047365, 0, 1, 0.4588235, 1,
-0.2263982, 0.0575026, -0.8655741, 0, 1, 0.4666667, 1,
-0.2219213, 0.5780985, -2.589358, 0, 1, 0.4705882, 1,
-0.2202462, -0.2894717, -2.754999, 0, 1, 0.4784314, 1,
-0.2096386, -0.8632345, -4.416921, 0, 1, 0.4823529, 1,
-0.2021969, 2.122719, -0.2043544, 0, 1, 0.4901961, 1,
-0.2021347, -0.9054134, -2.275504, 0, 1, 0.4941176, 1,
-0.2006152, 0.5690566, -0.2048875, 0, 1, 0.5019608, 1,
-0.1995338, 0.5353805, -1.198537, 0, 1, 0.509804, 1,
-0.1970231, -1.398364, -3.736095, 0, 1, 0.5137255, 1,
-0.1954667, -0.7992517, -2.178757, 0, 1, 0.5215687, 1,
-0.1926843, 0.7309443, 0.9771624, 0, 1, 0.5254902, 1,
-0.1891407, 0.1572608, 0.02876054, 0, 1, 0.5333334, 1,
-0.1822033, 0.7878693, -0.2498667, 0, 1, 0.5372549, 1,
-0.1819655, -0.8010067, -2.123662, 0, 1, 0.5450981, 1,
-0.1795148, -0.4246748, -3.265379, 0, 1, 0.5490196, 1,
-0.1761694, -0.1025344, -1.868337, 0, 1, 0.5568628, 1,
-0.1741061, 0.4652955, -1.574361, 0, 1, 0.5607843, 1,
-0.173358, -0.4263222, -3.947059, 0, 1, 0.5686275, 1,
-0.1712426, 1.014646, 1.01569, 0, 1, 0.572549, 1,
-0.1684561, -1.181808, -3.974451, 0, 1, 0.5803922, 1,
-0.1672452, -0.5655124, -3.926121, 0, 1, 0.5843138, 1,
-0.1664707, 0.282473, -1.641119, 0, 1, 0.5921569, 1,
-0.1622744, 1.091493, 0.9207684, 0, 1, 0.5960785, 1,
-0.1571692, -1.629954, -3.661108, 0, 1, 0.6039216, 1,
-0.1568884, -0.814758, -1.131624, 0, 1, 0.6117647, 1,
-0.1548696, -1.92545, -4.854907, 0, 1, 0.6156863, 1,
-0.1537672, -0.9081626, -3.134011, 0, 1, 0.6235294, 1,
-0.1526048, -0.5368494, -3.271303, 0, 1, 0.627451, 1,
-0.1521459, -0.2537497, -2.769196, 0, 1, 0.6352941, 1,
-0.1517415, 1.043066, 0.3734611, 0, 1, 0.6392157, 1,
-0.1440019, -0.51262, -2.264334, 0, 1, 0.6470588, 1,
-0.1414325, -0.38235, -3.620114, 0, 1, 0.6509804, 1,
-0.1394572, -0.04551272, -2.300534, 0, 1, 0.6588235, 1,
-0.1385499, 0.3557086, -1.236288, 0, 1, 0.6627451, 1,
-0.1375301, 2.518428, 0.8100406, 0, 1, 0.6705883, 1,
-0.137016, 0.3917392, -0.8399085, 0, 1, 0.6745098, 1,
-0.1370087, -0.7398998, -2.77759, 0, 1, 0.682353, 1,
-0.1268187, 1.411948, 0.8803778, 0, 1, 0.6862745, 1,
-0.1256661, -0.06442786, -3.409646, 0, 1, 0.6941177, 1,
-0.1235183, 1.301507, 0.5904651, 0, 1, 0.7019608, 1,
-0.1227147, 1.490144, 0.5371382, 0, 1, 0.7058824, 1,
-0.1144151, -0.06096924, -2.747301, 0, 1, 0.7137255, 1,
-0.1079633, -1.387291, -2.838046, 0, 1, 0.7176471, 1,
-0.1077865, -0.5819238, -4.167718, 0, 1, 0.7254902, 1,
-0.1058804, -1.574279, -2.348902, 0, 1, 0.7294118, 1,
-0.1058546, -0.3859159, -2.568047, 0, 1, 0.7372549, 1,
-0.09902363, 0.9734041, -0.8628765, 0, 1, 0.7411765, 1,
-0.09307306, -0.305621, -2.355478, 0, 1, 0.7490196, 1,
-0.09141701, -0.3730733, -3.19934, 0, 1, 0.7529412, 1,
-0.09070455, -1.380569, -3.035519, 0, 1, 0.7607843, 1,
-0.08774177, 0.1291374, -0.9427235, 0, 1, 0.7647059, 1,
-0.08739258, 0.9285337, 0.8500177, 0, 1, 0.772549, 1,
-0.08529508, 0.601158, 0.36583, 0, 1, 0.7764706, 1,
-0.07919686, 0.4559037, -1.647835, 0, 1, 0.7843137, 1,
-0.07716744, -1.539948, -2.538666, 0, 1, 0.7882353, 1,
-0.07067684, 0.3813525, 0.2190982, 0, 1, 0.7960784, 1,
-0.06413247, -0.8398704, -3.243121, 0, 1, 0.8039216, 1,
-0.06295864, -0.1677932, -2.836741, 0, 1, 0.8078431, 1,
-0.05850874, 2.224823, -1.875269, 0, 1, 0.8156863, 1,
-0.05569947, -1.190069, -1.66191, 0, 1, 0.8196079, 1,
-0.0519882, 1.172237, -0.8944556, 0, 1, 0.827451, 1,
-0.05151732, -1.794832, -3.159762, 0, 1, 0.8313726, 1,
-0.04872394, -0.6397776, -2.05781, 0, 1, 0.8392157, 1,
-0.04602, 0.942998, 0.4382316, 0, 1, 0.8431373, 1,
-0.04357544, 1.035526, -0.4880183, 0, 1, 0.8509804, 1,
-0.04292722, 1.26486, -0.5859069, 0, 1, 0.854902, 1,
-0.04265692, 1.000511, -1.086923, 0, 1, 0.8627451, 1,
-0.03916635, 0.6281843, -0.3488978, 0, 1, 0.8666667, 1,
-0.03882647, -0.07895077, -3.604295, 0, 1, 0.8745098, 1,
-0.03843263, 0.05639859, -0.8914227, 0, 1, 0.8784314, 1,
-0.03378749, 0.2174413, -1.55844, 0, 1, 0.8862745, 1,
-0.03177093, 0.3111619, -0.8875796, 0, 1, 0.8901961, 1,
-0.03071036, 0.3867535, -0.6647847, 0, 1, 0.8980392, 1,
-0.02812569, 0.5364376, 0.08089992, 0, 1, 0.9058824, 1,
-0.02707555, 1.019458, 0.5297438, 0, 1, 0.9098039, 1,
-0.0269055, 1.16317, -0.0786031, 0, 1, 0.9176471, 1,
-0.02169982, -0.363833, -2.805828, 0, 1, 0.9215686, 1,
-0.02010788, -0.9423382, -0.9110059, 0, 1, 0.9294118, 1,
-0.01772577, -1.867362, -2.276009, 0, 1, 0.9333333, 1,
-0.01741148, 0.181572, -0.1528606, 0, 1, 0.9411765, 1,
-0.01720081, -2.094472, -1.803131, 0, 1, 0.945098, 1,
-0.01624613, 0.5444465, 0.5983819, 0, 1, 0.9529412, 1,
-0.01600312, 0.7066346, -0.9997381, 0, 1, 0.9568627, 1,
-0.01338001, -0.8579772, -2.533469, 0, 1, 0.9647059, 1,
-0.01049413, -0.2892136, -2.876356, 0, 1, 0.9686275, 1,
-0.01020994, 0.1059646, -0.1653464, 0, 1, 0.9764706, 1,
0.007359381, -1.077395, 4.586377, 0, 1, 0.9803922, 1,
0.009459852, -0.6508344, 1.827698, 0, 1, 0.9882353, 1,
0.0104191, -1.569984, 1.691989, 0, 1, 0.9921569, 1,
0.01232567, -2.393413, 3.857828, 0, 1, 1, 1,
0.01234756, -0.796615, 3.966318, 0, 0.9921569, 1, 1,
0.02787488, 2.353927, -0.6066171, 0, 0.9882353, 1, 1,
0.03346815, 3.167591, -0.1287069, 0, 0.9803922, 1, 1,
0.03366515, -1.091755, 3.288685, 0, 0.9764706, 1, 1,
0.03564705, 1.09885, 1.342283, 0, 0.9686275, 1, 1,
0.0386596, 0.5526187, 2.10528, 0, 0.9647059, 1, 1,
0.04379006, -1.351882, 2.117688, 0, 0.9568627, 1, 1,
0.04856209, -1.409871, 2.91277, 0, 0.9529412, 1, 1,
0.05225483, 0.7050614, -1.739441, 0, 0.945098, 1, 1,
0.05259582, -0.09909896, 2.882854, 0, 0.9411765, 1, 1,
0.05332037, 1.540837, -1.603703, 0, 0.9333333, 1, 1,
0.0561951, -0.2311308, 3.755487, 0, 0.9294118, 1, 1,
0.06043332, -0.2934212, 2.148, 0, 0.9215686, 1, 1,
0.0614979, -1.230766, 5.313015, 0, 0.9176471, 1, 1,
0.0620188, 0.06155435, 0.6482413, 0, 0.9098039, 1, 1,
0.06336942, 0.5998964, -0.2096608, 0, 0.9058824, 1, 1,
0.06556584, 1.182783, 0.6255778, 0, 0.8980392, 1, 1,
0.06776863, -0.1656705, 3.070355, 0, 0.8901961, 1, 1,
0.06870364, -0.7102826, 2.567621, 0, 0.8862745, 1, 1,
0.07189605, -1.775512, 1.592139, 0, 0.8784314, 1, 1,
0.07284144, 0.2234628, 0.6506774, 0, 0.8745098, 1, 1,
0.07514235, -0.5319014, 3.103863, 0, 0.8666667, 1, 1,
0.07955768, 0.2105146, 1.505692, 0, 0.8627451, 1, 1,
0.08246443, 1.549366, -0.1123927, 0, 0.854902, 1, 1,
0.08343678, 1.082835, 1.272928, 0, 0.8509804, 1, 1,
0.08670082, -0.2314938, 3.506647, 0, 0.8431373, 1, 1,
0.08838338, -1.195087, 3.614202, 0, 0.8392157, 1, 1,
0.0907134, -1.507718, 2.197834, 0, 0.8313726, 1, 1,
0.09241162, -1.21497, 2.209987, 0, 0.827451, 1, 1,
0.09692279, -0.3219633, 1.73068, 0, 0.8196079, 1, 1,
0.10169, -1.131484, 4.118001, 0, 0.8156863, 1, 1,
0.1017966, -0.7581859, 3.494415, 0, 0.8078431, 1, 1,
0.1029253, -0.2479893, 2.386989, 0, 0.8039216, 1, 1,
0.1038377, -1.740656, 3.921192, 0, 0.7960784, 1, 1,
0.1044613, 0.6410265, 1.344018, 0, 0.7882353, 1, 1,
0.1142459, 0.1333513, 0.8670552, 0, 0.7843137, 1, 1,
0.115512, -0.1678646, 3.903753, 0, 0.7764706, 1, 1,
0.1182886, -0.7346619, 2.822446, 0, 0.772549, 1, 1,
0.1190063, 0.738798, -0.8135482, 0, 0.7647059, 1, 1,
0.1251667, 1.961795, -0.7431709, 0, 0.7607843, 1, 1,
0.1284938, -0.3827297, 1.649739, 0, 0.7529412, 1, 1,
0.1294448, 0.01399723, 0.3812056, 0, 0.7490196, 1, 1,
0.1325364, -0.5784873, 2.900679, 0, 0.7411765, 1, 1,
0.1330568, 0.08342613, 0.4162312, 0, 0.7372549, 1, 1,
0.1336666, 1.982146, 0.2558632, 0, 0.7294118, 1, 1,
0.1353161, -0.6554614, 2.624958, 0, 0.7254902, 1, 1,
0.135563, -0.8836279, 4.17611, 0, 0.7176471, 1, 1,
0.1375514, 1.33339, -0.8843239, 0, 0.7137255, 1, 1,
0.1410684, -0.4532667, 2.489537, 0, 0.7058824, 1, 1,
0.1490893, 0.7756455, -0.4812869, 0, 0.6980392, 1, 1,
0.1525563, -0.01968514, 1.445803, 0, 0.6941177, 1, 1,
0.1545061, 0.2715617, 1.702272, 0, 0.6862745, 1, 1,
0.159501, 0.03590338, 1.55452, 0, 0.682353, 1, 1,
0.160067, -1.505722, 3.363067, 0, 0.6745098, 1, 1,
0.1623226, 0.1176592, 0.4802378, 0, 0.6705883, 1, 1,
0.1639238, 0.8284795, 0.8352747, 0, 0.6627451, 1, 1,
0.1660839, -0.1354703, 2.341824, 0, 0.6588235, 1, 1,
0.1662098, -1.220248, 3.576556, 0, 0.6509804, 1, 1,
0.1711734, 1.507398, 3.445106, 0, 0.6470588, 1, 1,
0.1721693, 1.058892, 0.04534495, 0, 0.6392157, 1, 1,
0.1736717, 0.4279588, 0.3469496, 0, 0.6352941, 1, 1,
0.1736791, 0.9850982, -2.140645, 0, 0.627451, 1, 1,
0.1774561, 0.6813743, -0.6874315, 0, 0.6235294, 1, 1,
0.1814815, 0.00432968, 1.827689, 0, 0.6156863, 1, 1,
0.1854167, -0.5530961, 3.395615, 0, 0.6117647, 1, 1,
0.1921647, -0.8266438, 2.261931, 0, 0.6039216, 1, 1,
0.1946888, 0.08714707, 0.6349376, 0, 0.5960785, 1, 1,
0.2022108, -0.01021497, 2.863043, 0, 0.5921569, 1, 1,
0.2036236, -0.6379814, 3.513255, 0, 0.5843138, 1, 1,
0.2080573, -0.3001483, 2.349307, 0, 0.5803922, 1, 1,
0.210096, -2.529858, 3.234142, 0, 0.572549, 1, 1,
0.2113443, -1.651111, 2.047014, 0, 0.5686275, 1, 1,
0.2134276, 0.6633334, 0.2777833, 0, 0.5607843, 1, 1,
0.2146224, -0.1410901, 1.969009, 0, 0.5568628, 1, 1,
0.2176018, -0.8609114, 3.519075, 0, 0.5490196, 1, 1,
0.2178496, -0.2938246, 2.886276, 0, 0.5450981, 1, 1,
0.219172, -0.0522167, 2.145522, 0, 0.5372549, 1, 1,
0.2217883, 0.5695249, -1.451813, 0, 0.5333334, 1, 1,
0.2230039, 2.331754, -0.1554709, 0, 0.5254902, 1, 1,
0.2235393, -1.541925, 1.886603, 0, 0.5215687, 1, 1,
0.2260163, -1.181515, 3.555315, 0, 0.5137255, 1, 1,
0.2264473, 0.7578526, -0.4673937, 0, 0.509804, 1, 1,
0.2298866, -0.4244458, 3.727398, 0, 0.5019608, 1, 1,
0.2330063, -0.1861951, -0.133345, 0, 0.4941176, 1, 1,
0.2350014, -0.1364343, 0.09094068, 0, 0.4901961, 1, 1,
0.2367249, -0.404406, 1.648537, 0, 0.4823529, 1, 1,
0.2390437, 1.338507, 1.019845, 0, 0.4784314, 1, 1,
0.2391361, 0.03402225, 2.012041, 0, 0.4705882, 1, 1,
0.2392792, -0.7079988, 2.882733, 0, 0.4666667, 1, 1,
0.2409659, 0.3931908, 0.1771443, 0, 0.4588235, 1, 1,
0.2415691, 1.115132, 1.544524, 0, 0.454902, 1, 1,
0.2432972, 0.3966868, 3.218284, 0, 0.4470588, 1, 1,
0.2505623, -0.3422923, 3.066974, 0, 0.4431373, 1, 1,
0.2545784, -0.1661417, 2.973982, 0, 0.4352941, 1, 1,
0.2639227, -0.9196036, 1.86078, 0, 0.4313726, 1, 1,
0.2697537, -0.2691163, 1.207335, 0, 0.4235294, 1, 1,
0.2701984, 0.2876615, 3.793202, 0, 0.4196078, 1, 1,
0.2720768, -0.2474035, 0.2995027, 0, 0.4117647, 1, 1,
0.2732782, 0.9549266, 0.4626049, 0, 0.4078431, 1, 1,
0.273775, 0.05235032, 2.229839, 0, 0.4, 1, 1,
0.2749835, 2.41894, -0.1592356, 0, 0.3921569, 1, 1,
0.2754776, -0.282214, 1.099821, 0, 0.3882353, 1, 1,
0.2815835, -1.599463, 3.875182, 0, 0.3803922, 1, 1,
0.2829458, 0.2433893, 1.557503, 0, 0.3764706, 1, 1,
0.2869853, 0.4470508, -0.5242309, 0, 0.3686275, 1, 1,
0.2903176, -0.9560803, 1.956036, 0, 0.3647059, 1, 1,
0.2917111, -1.209193, 2.588373, 0, 0.3568628, 1, 1,
0.2919859, -0.2155222, 2.575866, 0, 0.3529412, 1, 1,
0.2927937, -1.014152, 3.029364, 0, 0.345098, 1, 1,
0.2935473, -0.04996952, 1.903352, 0, 0.3411765, 1, 1,
0.2945012, -1.741078, 2.540904, 0, 0.3333333, 1, 1,
0.2960823, 1.0853, 0.7555006, 0, 0.3294118, 1, 1,
0.2972892, 0.6530984, 1.217161, 0, 0.3215686, 1, 1,
0.2980719, -0.9373487, 3.011309, 0, 0.3176471, 1, 1,
0.3014643, -0.2152167, 0.9287637, 0, 0.3098039, 1, 1,
0.3068057, -1.602774, 1.534541, 0, 0.3058824, 1, 1,
0.3079846, 0.4819516, 1.318685, 0, 0.2980392, 1, 1,
0.3092526, -0.008826926, 0.522656, 0, 0.2901961, 1, 1,
0.3117923, 0.6258258, 2.313416, 0, 0.2862745, 1, 1,
0.3243183, -1.14468, 2.536936, 0, 0.2784314, 1, 1,
0.3245106, -1.397242, 2.87944, 0, 0.2745098, 1, 1,
0.3253298, 0.01232059, 1.354589, 0, 0.2666667, 1, 1,
0.3270361, 0.07609674, 1.315907, 0, 0.2627451, 1, 1,
0.3298088, 0.9276935, -0.9607096, 0, 0.254902, 1, 1,
0.3336103, 1.160851, 0.2214313, 0, 0.2509804, 1, 1,
0.3346418, 0.1237723, 1.38047, 0, 0.2431373, 1, 1,
0.337232, 1.121482, -2.08583, 0, 0.2392157, 1, 1,
0.3381079, 0.8121589, -0.5460598, 0, 0.2313726, 1, 1,
0.3481807, -0.5257844, 3.940032, 0, 0.227451, 1, 1,
0.3499615, -0.3206392, 3.518237, 0, 0.2196078, 1, 1,
0.3509281, -1.587534, 1.38027, 0, 0.2156863, 1, 1,
0.3527172, -0.7874078, 2.751076, 0, 0.2078431, 1, 1,
0.3539512, 0.8147358, 1.608892, 0, 0.2039216, 1, 1,
0.354317, 1.078571, 0.8531794, 0, 0.1960784, 1, 1,
0.3584966, 0.7626702, 0.3475001, 0, 0.1882353, 1, 1,
0.3590519, 0.3301336, 1.11021, 0, 0.1843137, 1, 1,
0.3597673, 1.150998, -2.14206, 0, 0.1764706, 1, 1,
0.3610828, -1.959419, 3.216382, 0, 0.172549, 1, 1,
0.36279, -0.4268171, 2.409759, 0, 0.1647059, 1, 1,
0.3657465, -0.8626565, 1.266865, 0, 0.1607843, 1, 1,
0.3680282, 1.404655, -1.593099, 0, 0.1529412, 1, 1,
0.3710006, 1.115428, 1.313176, 0, 0.1490196, 1, 1,
0.37324, 0.3171655, -0.3328761, 0, 0.1411765, 1, 1,
0.3818856, -0.0368995, 3.85193, 0, 0.1372549, 1, 1,
0.3839143, 0.1638703, -0.5179205, 0, 0.1294118, 1, 1,
0.3849126, -1.376039, 2.218314, 0, 0.1254902, 1, 1,
0.3922478, 0.9876534, -1.400618, 0, 0.1176471, 1, 1,
0.3975993, 1.415944, -1.514506, 0, 0.1137255, 1, 1,
0.4064495, 0.02618282, 1.784533, 0, 0.1058824, 1, 1,
0.410227, -1.536, 3.656476, 0, 0.09803922, 1, 1,
0.4129531, 0.5307468, -1.577488, 0, 0.09411765, 1, 1,
0.4201099, 0.3151506, 2.456862, 0, 0.08627451, 1, 1,
0.4209004, 1.577641, 0.584509, 0, 0.08235294, 1, 1,
0.4214801, -0.8247119, 1.69842, 0, 0.07450981, 1, 1,
0.4219225, 0.6672437, 0.9021241, 0, 0.07058824, 1, 1,
0.4219539, 1.258641, 0.2955169, 0, 0.0627451, 1, 1,
0.4222248, -0.9897024, 0.1071131, 0, 0.05882353, 1, 1,
0.4237778, -0.9389505, 3.659769, 0, 0.05098039, 1, 1,
0.4237914, -0.006850501, 1.485747, 0, 0.04705882, 1, 1,
0.4271368, 0.6366696, -0.03616937, 0, 0.03921569, 1, 1,
0.4293505, 0.3542944, 0.6907372, 0, 0.03529412, 1, 1,
0.4319791, -2.005722, 3.270352, 0, 0.02745098, 1, 1,
0.4361328, 0.6063969, 0.3260039, 0, 0.02352941, 1, 1,
0.4368478, -0.1957473, 1.606905, 0, 0.01568628, 1, 1,
0.4388629, -0.6258716, 3.155872, 0, 0.01176471, 1, 1,
0.451304, -0.0790199, 1.254476, 0, 0.003921569, 1, 1,
0.4519875, -0.8816365, 3.739622, 0.003921569, 0, 1, 1,
0.4536321, -1.239995, 2.388669, 0.007843138, 0, 1, 1,
0.4545512, -1.072224, 1.929999, 0.01568628, 0, 1, 1,
0.4572735, -0.5300233, 1.809409, 0.01960784, 0, 1, 1,
0.4615174, 0.2429774, 0.3240557, 0.02745098, 0, 1, 1,
0.4625843, 2.063202, -0.5339866, 0.03137255, 0, 1, 1,
0.4636942, 1.019, 1.511425, 0.03921569, 0, 1, 1,
0.4680559, 0.7917895, -0.2170103, 0.04313726, 0, 1, 1,
0.4697141, 0.7154374, 0.7604009, 0.05098039, 0, 1, 1,
0.4742224, -0.5095208, 3.335207, 0.05490196, 0, 1, 1,
0.4751517, -0.857338, 2.931996, 0.0627451, 0, 1, 1,
0.4760856, 0.3815819, -0.4804414, 0.06666667, 0, 1, 1,
0.4771674, -0.4840418, 2.119088, 0.07450981, 0, 1, 1,
0.4857336, -0.4011524, 1.94469, 0.07843138, 0, 1, 1,
0.4903061, 1.132251, -0.8160986, 0.08627451, 0, 1, 1,
0.4923719, 2.245121, -0.3931334, 0.09019608, 0, 1, 1,
0.4961753, -1.559028, 2.490253, 0.09803922, 0, 1, 1,
0.499207, -0.1097492, 0.9866416, 0.1058824, 0, 1, 1,
0.501901, 1.592407, 1.560911, 0.1098039, 0, 1, 1,
0.5084476, 0.8329813, -0.4239751, 0.1176471, 0, 1, 1,
0.5110076, 2.080868, -0.630943, 0.1215686, 0, 1, 1,
0.5125454, 2.960194, 0.2550392, 0.1294118, 0, 1, 1,
0.5132288, -0.8494511, 2.261125, 0.1333333, 0, 1, 1,
0.5216609, -1.785657, 2.566212, 0.1411765, 0, 1, 1,
0.5270116, 0.6226764, 0.5637636, 0.145098, 0, 1, 1,
0.5289963, 2.401169, 1.29175, 0.1529412, 0, 1, 1,
0.5310423, 0.1019243, 2.314259, 0.1568628, 0, 1, 1,
0.533122, -0.3852358, 0.2069555, 0.1647059, 0, 1, 1,
0.5378779, 1.242973, 0.9105331, 0.1686275, 0, 1, 1,
0.5384654, 0.6604913, 0.3594987, 0.1764706, 0, 1, 1,
0.5395598, 0.3469994, 1.593092, 0.1803922, 0, 1, 1,
0.539681, 0.2702627, 0.159877, 0.1882353, 0, 1, 1,
0.5403059, -0.9266623, 3.092288, 0.1921569, 0, 1, 1,
0.543362, -1.381439, 4.912418, 0.2, 0, 1, 1,
0.5468751, 0.7413134, 1.206369, 0.2078431, 0, 1, 1,
0.5469491, 0.2434368, -0.1353814, 0.2117647, 0, 1, 1,
0.548016, -0.5594507, 2.200641, 0.2196078, 0, 1, 1,
0.5564748, -0.09541906, 1.058583, 0.2235294, 0, 1, 1,
0.5565202, -1.019346, 2.03271, 0.2313726, 0, 1, 1,
0.5577174, 1.532803, 0.8051832, 0.2352941, 0, 1, 1,
0.5577739, -0.3201823, 2.500872, 0.2431373, 0, 1, 1,
0.5589935, -2.391412, 3.616893, 0.2470588, 0, 1, 1,
0.5615688, 0.234355, 0.05876596, 0.254902, 0, 1, 1,
0.5717978, 0.69532, 0.5404368, 0.2588235, 0, 1, 1,
0.5750181, -2.51823, 1.90324, 0.2666667, 0, 1, 1,
0.5753319, -0.7349711, 3.316586, 0.2705882, 0, 1, 1,
0.5765961, 1.482116, -0.2246163, 0.2784314, 0, 1, 1,
0.5766745, -1.09903, 0.5949273, 0.282353, 0, 1, 1,
0.5773025, 0.567896, 1.252792, 0.2901961, 0, 1, 1,
0.5819131, 0.03610767, 0.1049212, 0.2941177, 0, 1, 1,
0.5836738, -0.1893874, 2.090031, 0.3019608, 0, 1, 1,
0.5841933, -0.01034738, 1.2039, 0.3098039, 0, 1, 1,
0.5852294, 0.3187931, 0.5702705, 0.3137255, 0, 1, 1,
0.5945218, 0.0189577, 0.894158, 0.3215686, 0, 1, 1,
0.6017203, -0.3908285, 1.219089, 0.3254902, 0, 1, 1,
0.6041263, 0.0152331, 1.956573, 0.3333333, 0, 1, 1,
0.6144247, 0.8738408, 0.2874892, 0.3372549, 0, 1, 1,
0.6175413, 0.6799055, 2.484566, 0.345098, 0, 1, 1,
0.6177208, -0.9326293, 2.161661, 0.3490196, 0, 1, 1,
0.6182258, 0.3744684, 1.07021, 0.3568628, 0, 1, 1,
0.6184215, -0.02158339, 0.2491325, 0.3607843, 0, 1, 1,
0.6185654, -1.030868, 0.7955799, 0.3686275, 0, 1, 1,
0.6276467, -0.5691898, 3.816836, 0.372549, 0, 1, 1,
0.6310248, -0.01571712, 2.269928, 0.3803922, 0, 1, 1,
0.6315762, 0.9517937, 1.672801, 0.3843137, 0, 1, 1,
0.6318193, 0.8699045, -0.660857, 0.3921569, 0, 1, 1,
0.6343341, 1.175519, 0.4395677, 0.3960784, 0, 1, 1,
0.6393893, -0.09249999, -0.3671292, 0.4039216, 0, 1, 1,
0.6401005, 0.740068, 1.921741, 0.4117647, 0, 1, 1,
0.6447482, 0.9372774, 0.7166545, 0.4156863, 0, 1, 1,
0.6451887, 0.2182537, 0.925904, 0.4235294, 0, 1, 1,
0.6472121, 0.8265827, 0.2115949, 0.427451, 0, 1, 1,
0.6569318, -0.4333119, 3.610093, 0.4352941, 0, 1, 1,
0.6608902, 1.166369, 0.4071527, 0.4392157, 0, 1, 1,
0.6614075, 1.686368, -0.7014436, 0.4470588, 0, 1, 1,
0.6639232, 1.361296, -0.0848322, 0.4509804, 0, 1, 1,
0.6688293, 0.6692495, 2.406957, 0.4588235, 0, 1, 1,
0.6734114, -0.8850675, 3.184754, 0.4627451, 0, 1, 1,
0.6740035, 0.3927624, 2.037811, 0.4705882, 0, 1, 1,
0.6777264, -0.1932133, 0.695143, 0.4745098, 0, 1, 1,
0.6792591, 0.9714882, -0.460917, 0.4823529, 0, 1, 1,
0.685224, 0.2090074, 0.93481, 0.4862745, 0, 1, 1,
0.6889627, 0.8819338, -1.228181, 0.4941176, 0, 1, 1,
0.6961921, 1.387597, -0.4750918, 0.5019608, 0, 1, 1,
0.6968117, 0.1991503, 2.742023, 0.5058824, 0, 1, 1,
0.6980728, -0.05646584, 0.5102173, 0.5137255, 0, 1, 1,
0.6981878, -1.102468, 2.420463, 0.5176471, 0, 1, 1,
0.6997846, -1.281758, 1.908882, 0.5254902, 0, 1, 1,
0.7029515, 1.693192, 0.4409662, 0.5294118, 0, 1, 1,
0.7030811, -1.141738, 3.029534, 0.5372549, 0, 1, 1,
0.7032397, -0.03865271, 2.148301, 0.5411765, 0, 1, 1,
0.7037959, -1.757861, 3.174334, 0.5490196, 0, 1, 1,
0.7046836, -2.635497, 3.840069, 0.5529412, 0, 1, 1,
0.7059972, 0.7628151, -0.0475624, 0.5607843, 0, 1, 1,
0.7107661, -1.394016, 2.280146, 0.5647059, 0, 1, 1,
0.7158014, -0.06744851, 1.465822, 0.572549, 0, 1, 1,
0.7207676, -0.6610075, 1.42307, 0.5764706, 0, 1, 1,
0.721143, 1.065102, 0.1098875, 0.5843138, 0, 1, 1,
0.7219924, -0.1169692, 1.702776, 0.5882353, 0, 1, 1,
0.7248577, 0.2074, 0.382261, 0.5960785, 0, 1, 1,
0.7264444, -1.208584, 2.540125, 0.6039216, 0, 1, 1,
0.7322122, -0.3082981, 1.534206, 0.6078432, 0, 1, 1,
0.7338231, 0.09778334, 1.166199, 0.6156863, 0, 1, 1,
0.7352377, -0.4264622, 2.588319, 0.6196079, 0, 1, 1,
0.7432114, 0.7678214, 2.053176, 0.627451, 0, 1, 1,
0.7436047, 0.6879273, -0.01047639, 0.6313726, 0, 1, 1,
0.7452174, 2.035587, 0.4339314, 0.6392157, 0, 1, 1,
0.7464123, 2.116324, -0.4205258, 0.6431373, 0, 1, 1,
0.7480524, 0.565493, 0.8242198, 0.6509804, 0, 1, 1,
0.7485623, 0.06979606, 0.8530431, 0.654902, 0, 1, 1,
0.7505855, 0.3751654, 2.543747, 0.6627451, 0, 1, 1,
0.7534192, 0.2285921, 2.160298, 0.6666667, 0, 1, 1,
0.7576004, 1.552733, -1.380503, 0.6745098, 0, 1, 1,
0.7629525, 0.578795, -0.4862785, 0.6784314, 0, 1, 1,
0.762984, -0.9276914, 2.863368, 0.6862745, 0, 1, 1,
0.764883, 0.2423094, 2.687541, 0.6901961, 0, 1, 1,
0.767753, 1.521261, 0.2015942, 0.6980392, 0, 1, 1,
0.7769619, 0.9568508, 0.9823893, 0.7058824, 0, 1, 1,
0.7786682, 0.06740892, 2.319561, 0.7098039, 0, 1, 1,
0.7789024, 0.6172649, 1.135178, 0.7176471, 0, 1, 1,
0.7797278, -0.6702885, 2.998057, 0.7215686, 0, 1, 1,
0.7804326, -1.475107, 1.848813, 0.7294118, 0, 1, 1,
0.7880427, 1.375931, -0.4857373, 0.7333333, 0, 1, 1,
0.7914287, 0.7463698, 1.17198, 0.7411765, 0, 1, 1,
0.7916578, -1.120509, 1.098086, 0.7450981, 0, 1, 1,
0.797367, -0.05123741, 1.158418, 0.7529412, 0, 1, 1,
0.7984136, -0.2217525, -0.4560066, 0.7568628, 0, 1, 1,
0.806111, -0.9888487, 2.217347, 0.7647059, 0, 1, 1,
0.8065355, 0.7452018, 2.731048, 0.7686275, 0, 1, 1,
0.808836, 1.294194, -0.6989921, 0.7764706, 0, 1, 1,
0.8125731, -1.49235, 3.83631, 0.7803922, 0, 1, 1,
0.8125954, 0.382544, 0.8812925, 0.7882353, 0, 1, 1,
0.8174776, -0.7929966, 2.579094, 0.7921569, 0, 1, 1,
0.8252968, -0.02707607, 3.175945, 0.8, 0, 1, 1,
0.826097, -0.6655076, 2.012971, 0.8078431, 0, 1, 1,
0.8340247, -0.1510423, -0.04341763, 0.8117647, 0, 1, 1,
0.8406897, 0.7126303, 2.255165, 0.8196079, 0, 1, 1,
0.8431715, -0.2010364, 2.878202, 0.8235294, 0, 1, 1,
0.8493785, -0.617192, 2.605488, 0.8313726, 0, 1, 1,
0.8532841, 1.475154, 0.8134134, 0.8352941, 0, 1, 1,
0.854437, 0.153168, 1.405374, 0.8431373, 0, 1, 1,
0.85518, 0.3833085, 0.4841679, 0.8470588, 0, 1, 1,
0.8606807, -0.3273331, 3.182066, 0.854902, 0, 1, 1,
0.8642591, -0.5827122, 1.872587, 0.8588235, 0, 1, 1,
0.8755544, -0.5350592, 2.49231, 0.8666667, 0, 1, 1,
0.8769835, 0.06527698, 2.04109, 0.8705882, 0, 1, 1,
0.8779383, -0.07667381, 2.314165, 0.8784314, 0, 1, 1,
0.8801742, -0.1962181, 1.689771, 0.8823529, 0, 1, 1,
0.8827408, -0.7542, 1.081452, 0.8901961, 0, 1, 1,
0.885169, -0.1127, 0.918403, 0.8941177, 0, 1, 1,
0.8883274, 0.9063297, 1.340433, 0.9019608, 0, 1, 1,
0.8940276, -0.07365353, 1.726916, 0.9098039, 0, 1, 1,
0.8972752, -0.8414871, 3.783929, 0.9137255, 0, 1, 1,
0.9028182, -0.05558346, 0.9467891, 0.9215686, 0, 1, 1,
0.9063895, -0.08668531, 1.421745, 0.9254902, 0, 1, 1,
0.9072258, 1.248407, 0.03178564, 0.9333333, 0, 1, 1,
0.9123713, 0.7680519, 0.4410027, 0.9372549, 0, 1, 1,
0.9141431, -1.313276, 3.432794, 0.945098, 0, 1, 1,
0.9248173, 0.8556287, 1.341022, 0.9490196, 0, 1, 1,
0.9265576, -0.9310634, 0.4809608, 0.9568627, 0, 1, 1,
0.9290585, 0.1800061, 2.054997, 0.9607843, 0, 1, 1,
0.9327019, -0.7122847, 2.200675, 0.9686275, 0, 1, 1,
0.9427134, -1.129833, 2.295925, 0.972549, 0, 1, 1,
0.9511523, -0.5437818, 2.080751, 0.9803922, 0, 1, 1,
0.955327, 3.040868, 0.6348525, 0.9843137, 0, 1, 1,
0.9553285, -0.4176835, 0.03526463, 0.9921569, 0, 1, 1,
0.9580213, 0.772256, 1.722402, 0.9960784, 0, 1, 1,
0.9594727, -0.04187166, 0.5351487, 1, 0, 0.9960784, 1,
0.9618233, -1.124745, 1.694045, 1, 0, 0.9882353, 1,
0.9622146, -0.2506925, 1.217509, 1, 0, 0.9843137, 1,
0.9650298, 1.451235, 2.098784, 1, 0, 0.9764706, 1,
0.972665, 0.7753592, 0.5082384, 1, 0, 0.972549, 1,
0.9744796, -1.672839, 1.191626, 1, 0, 0.9647059, 1,
0.976576, 0.4485422, 0.8254477, 1, 0, 0.9607843, 1,
0.9784501, 0.0896074, 1.571103, 1, 0, 0.9529412, 1,
0.9843642, -0.7513481, 1.984036, 1, 0, 0.9490196, 1,
0.9883623, 0.9541514, 1.112769, 1, 0, 0.9411765, 1,
0.9970886, -0.6916869, 1.105335, 1, 0, 0.9372549, 1,
1.002892, 0.658148, 1.449419, 1, 0, 0.9294118, 1,
1.027792, 0.4496806, 1.290548, 1, 0, 0.9254902, 1,
1.031595, -0.3107134, 2.1485, 1, 0, 0.9176471, 1,
1.031698, 0.3699816, 3.340769, 1, 0, 0.9137255, 1,
1.036075, 0.3975743, 1.09372, 1, 0, 0.9058824, 1,
1.043028, -1.11921, 1.487906, 1, 0, 0.9019608, 1,
1.043691, 1.722526, -0.3335881, 1, 0, 0.8941177, 1,
1.05132, 0.5931091, -0.4556597, 1, 0, 0.8862745, 1,
1.056547, -0.5183731, 1.792397, 1, 0, 0.8823529, 1,
1.064364, -1.201683, 2.737229, 1, 0, 0.8745098, 1,
1.076659, 1.002843, 1.739262, 1, 0, 0.8705882, 1,
1.085248, 0.1627919, 0.576707, 1, 0, 0.8627451, 1,
1.085697, -2.4105, 2.111109, 1, 0, 0.8588235, 1,
1.088495, -0.1436514, 0.06413039, 1, 0, 0.8509804, 1,
1.10552, -0.1158334, 0.6608841, 1, 0, 0.8470588, 1,
1.105813, 0.4332856, 2.361917, 1, 0, 0.8392157, 1,
1.108684, -0.6970193, 2.479917, 1, 0, 0.8352941, 1,
1.112337, -1.643525, 0.2642193, 1, 0, 0.827451, 1,
1.113003, -0.08807162, 1.208609, 1, 0, 0.8235294, 1,
1.122577, -0.4264522, 1.648893, 1, 0, 0.8156863, 1,
1.125334, -0.8287728, 2.65041, 1, 0, 0.8117647, 1,
1.134911, -0.5561507, 2.437552, 1, 0, 0.8039216, 1,
1.134971, -1.307605, 3.382815, 1, 0, 0.7960784, 1,
1.165189, -0.5180465, 0.7202884, 1, 0, 0.7921569, 1,
1.176109, 0.01105658, 1.710003, 1, 0, 0.7843137, 1,
1.17813, 0.8078284, -0.6432157, 1, 0, 0.7803922, 1,
1.181503, 0.9060832, -0.4673772, 1, 0, 0.772549, 1,
1.187336, 1.591161, -0.4823782, 1, 0, 0.7686275, 1,
1.192652, 0.5375146, -0.5248455, 1, 0, 0.7607843, 1,
1.195705, -1.0449, 2.714905, 1, 0, 0.7568628, 1,
1.205102, 1.015638, 2.221617, 1, 0, 0.7490196, 1,
1.206657, 2.315263, 0.5476549, 1, 0, 0.7450981, 1,
1.208043, 0.5367382, 0.212314, 1, 0, 0.7372549, 1,
1.221506, -0.5359293, 1.77732, 1, 0, 0.7333333, 1,
1.235808, -0.6561095, 4.018328, 1, 0, 0.7254902, 1,
1.251381, -0.8435516, 1.358349, 1, 0, 0.7215686, 1,
1.25315, -0.3994807, 1.708086, 1, 0, 0.7137255, 1,
1.262841, 1.458808, 0.7290077, 1, 0, 0.7098039, 1,
1.268129, -0.7343519, 1.181307, 1, 0, 0.7019608, 1,
1.274942, 1.928262, -0.3612634, 1, 0, 0.6941177, 1,
1.27513, 0.2683131, 1.245068, 1, 0, 0.6901961, 1,
1.277074, -2.37345, 3.037249, 1, 0, 0.682353, 1,
1.289441, -0.08070925, 3.076983, 1, 0, 0.6784314, 1,
1.291393, 1.496429, 0.1653774, 1, 0, 0.6705883, 1,
1.292638, -0.1642013, 2.644244, 1, 0, 0.6666667, 1,
1.298761, -0.5069565, 1.029156, 1, 0, 0.6588235, 1,
1.305926, 1.284515, 2.237407, 1, 0, 0.654902, 1,
1.307045, 0.1623105, 2.364165, 1, 0, 0.6470588, 1,
1.309684, 0.8923295, 0.4770656, 1, 0, 0.6431373, 1,
1.312138, -0.3773787, 1.692867, 1, 0, 0.6352941, 1,
1.312503, -0.5719151, 1.023887, 1, 0, 0.6313726, 1,
1.315114, 0.4732849, 2.319973, 1, 0, 0.6235294, 1,
1.315287, -0.9902481, 0.9442178, 1, 0, 0.6196079, 1,
1.317078, -0.3098711, 0.3315238, 1, 0, 0.6117647, 1,
1.324291, -0.9506314, 1.479216, 1, 0, 0.6078432, 1,
1.327208, -0.142789, 1.704043, 1, 0, 0.6, 1,
1.333732, -0.7309582, 2.602373, 1, 0, 0.5921569, 1,
1.339129, -0.6316313, 2.558333, 1, 0, 0.5882353, 1,
1.347548, -0.4871986, 1.928469, 1, 0, 0.5803922, 1,
1.357589, -0.8004965, 3.311004, 1, 0, 0.5764706, 1,
1.361932, 0.4796762, 2.139051, 1, 0, 0.5686275, 1,
1.369766, 1.64501, 0.9483404, 1, 0, 0.5647059, 1,
1.371821, 0.3588296, 2.337261, 1, 0, 0.5568628, 1,
1.380394, -0.4216755, 1.328693, 1, 0, 0.5529412, 1,
1.388308, -0.8070185, 4.151106, 1, 0, 0.5450981, 1,
1.388611, -0.8436083, 2.17944, 1, 0, 0.5411765, 1,
1.39312, -1.267591, 2.94273, 1, 0, 0.5333334, 1,
1.402659, -0.5930211, 1.808723, 1, 0, 0.5294118, 1,
1.402936, 0.8153697, -1.418372, 1, 0, 0.5215687, 1,
1.416697, -1.139013, 1.069864, 1, 0, 0.5176471, 1,
1.420846, 1.143761, 0.9094357, 1, 0, 0.509804, 1,
1.430106, -2.05141, 3.329972, 1, 0, 0.5058824, 1,
1.431746, -0.03473115, 1.742072, 1, 0, 0.4980392, 1,
1.440528, -0.7333409, 2.8992, 1, 0, 0.4901961, 1,
1.450181, 0.7808701, 0.1359821, 1, 0, 0.4862745, 1,
1.451726, -0.4180607, 1.207013, 1, 0, 0.4784314, 1,
1.459529, 1.244793, 1.246448, 1, 0, 0.4745098, 1,
1.463048, -0.9098967, 0.3720667, 1, 0, 0.4666667, 1,
1.464559, 0.2382238, 1.933309, 1, 0, 0.4627451, 1,
1.493811, -1.025619, 1.631234, 1, 0, 0.454902, 1,
1.494422, 0.7358055, 0.5785821, 1, 0, 0.4509804, 1,
1.50562, 1.771986, 1.453708, 1, 0, 0.4431373, 1,
1.512275, 0.1765787, 1.11953, 1, 0, 0.4392157, 1,
1.517905, -1.372759, -0.1529254, 1, 0, 0.4313726, 1,
1.519234, -2.102257, 3.625513, 1, 0, 0.427451, 1,
1.522643, 1.096306, 0.5127103, 1, 0, 0.4196078, 1,
1.528613, 0.4883578, 2.47313, 1, 0, 0.4156863, 1,
1.538902, -0.2383824, 1.994198, 1, 0, 0.4078431, 1,
1.546585, -1.066368, 2.364214, 1, 0, 0.4039216, 1,
1.55417, 0.7291641, 0.5244336, 1, 0, 0.3960784, 1,
1.582177, -0.172517, 2.521322, 1, 0, 0.3882353, 1,
1.588865, -1.196525, 3.15055, 1, 0, 0.3843137, 1,
1.599118, -1.719931, 3.664425, 1, 0, 0.3764706, 1,
1.610816, 1.830058, 1.384537, 1, 0, 0.372549, 1,
1.617692, 0.7930599, 0.8871555, 1, 0, 0.3647059, 1,
1.638185, 0.4694832, 1.516899, 1, 0, 0.3607843, 1,
1.64196, 0.9772155, 3.209783, 1, 0, 0.3529412, 1,
1.644057, -0.08272894, 2.260269, 1, 0, 0.3490196, 1,
1.646892, 0.7073855, 2.344586, 1, 0, 0.3411765, 1,
1.679045, 0.2994567, 1.519141, 1, 0, 0.3372549, 1,
1.680083, -1.673223, 3.53528, 1, 0, 0.3294118, 1,
1.681734, 0.2156852, 2.559872, 1, 0, 0.3254902, 1,
1.685049, 0.3754796, 0.9777453, 1, 0, 0.3176471, 1,
1.699778, 0.9579633, 0.718105, 1, 0, 0.3137255, 1,
1.700669, -0.3550655, 1.127658, 1, 0, 0.3058824, 1,
1.710191, 0.05605786, 0.1680423, 1, 0, 0.2980392, 1,
1.712052, -0.1166851, 1.32718, 1, 0, 0.2941177, 1,
1.72209, -0.5114879, 1.554132, 1, 0, 0.2862745, 1,
1.731196, -0.682752, 1.407051, 1, 0, 0.282353, 1,
1.734987, -0.8499984, 2.668911, 1, 0, 0.2745098, 1,
1.74745, -0.4770384, 1.242788, 1, 0, 0.2705882, 1,
1.761017, 0.8025414, 0.8401595, 1, 0, 0.2627451, 1,
1.773068, 1.457735, 1.463799, 1, 0, 0.2588235, 1,
1.806795, -0.6761044, 1.872737, 1, 0, 0.2509804, 1,
1.820416, 2.018149, -0.6295508, 1, 0, 0.2470588, 1,
1.820684, 0.5204691, 2.270402, 1, 0, 0.2392157, 1,
1.831556, 0.2734761, 0.8342539, 1, 0, 0.2352941, 1,
1.84877, 1.046641, 1.760821, 1, 0, 0.227451, 1,
1.858371, 0.2391612, 0.119263, 1, 0, 0.2235294, 1,
1.886874, 1.897849, 0.875204, 1, 0, 0.2156863, 1,
1.898511, 0.2328379, 1.295925, 1, 0, 0.2117647, 1,
1.909474, 0.7698076, 0.3058535, 1, 0, 0.2039216, 1,
1.911972, 0.302808, 3.425446, 1, 0, 0.1960784, 1,
1.91335, -0.4589356, 0.3758928, 1, 0, 0.1921569, 1,
1.918296, -0.5623186, 1.92171, 1, 0, 0.1843137, 1,
1.920069, 1.475172, 1.730403, 1, 0, 0.1803922, 1,
1.935019, 0.5282654, 2.056858, 1, 0, 0.172549, 1,
1.965475, 0.7328948, 0.7154221, 1, 0, 0.1686275, 1,
1.981338, 1.448974, 1.310721, 1, 0, 0.1607843, 1,
1.984229, -1.154943, 0.7462926, 1, 0, 0.1568628, 1,
2.103427, 0.3864209, 0.6503345, 1, 0, 0.1490196, 1,
2.151556, 1.346943, -0.9728106, 1, 0, 0.145098, 1,
2.153131, 0.8398372, 0.3840159, 1, 0, 0.1372549, 1,
2.155628, 2.021916, 1.076122, 1, 0, 0.1333333, 1,
2.159935, -0.5550094, 0.8262227, 1, 0, 0.1254902, 1,
2.189076, -0.4277769, 1.962199, 1, 0, 0.1215686, 1,
2.194627, 1.490817, 1.086857, 1, 0, 0.1137255, 1,
2.227555, -0.7918735, 2.31447, 1, 0, 0.1098039, 1,
2.232141, 0.7405647, 1.970682, 1, 0, 0.1019608, 1,
2.245606, -0.8988035, 1.468256, 1, 0, 0.09411765, 1,
2.28658, -0.8028665, 1.98493, 1, 0, 0.09019608, 1,
2.318793, -0.3461103, 1.646653, 1, 0, 0.08235294, 1,
2.378895, 0.6354722, 2.354724, 1, 0, 0.07843138, 1,
2.408844, -0.06196077, 1.779826, 1, 0, 0.07058824, 1,
2.47061, -0.4883268, 3.042672, 1, 0, 0.06666667, 1,
2.505984, -0.2033571, 1.70274, 1, 0, 0.05882353, 1,
2.50625, 0.4008124, 1.499757, 1, 0, 0.05490196, 1,
2.565853, -0.0347597, 1.459379, 1, 0, 0.04705882, 1,
2.797542, 1.513763, 0.3138247, 1, 0, 0.04313726, 1,
2.81277, 0.6409468, 0.1273892, 1, 0, 0.03529412, 1,
2.853, 1.130332, 3.47464, 1, 0, 0.03137255, 1,
2.986277, -0.3805812, 1.420886, 1, 0, 0.02352941, 1,
3.078368, 0.6012956, 1.173734, 1, 0, 0.01960784, 1,
3.155672, 0.4191974, 0.6840482, 1, 0, 0.01176471, 1,
3.467475, -1.123239, 1.014347, 1, 0, 0.007843138, 1
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
0.2151881, -4.030504, -7.230893, 0, -0.5, 0.5, 0.5,
0.2151881, -4.030504, -7.230893, 1, -0.5, 0.5, 0.5,
0.2151881, -4.030504, -7.230893, 1, 1.5, 0.5, 0.5,
0.2151881, -4.030504, -7.230893, 0, 1.5, 0.5, 0.5
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
-4.139624, 0.09016681, -7.230893, 0, -0.5, 0.5, 0.5,
-4.139624, 0.09016681, -7.230893, 1, -0.5, 0.5, 0.5,
-4.139624, 0.09016681, -7.230893, 1, 1.5, 0.5, 0.5,
-4.139624, 0.09016681, -7.230893, 0, 1.5, 0.5, 0.5
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
-4.139624, -4.030504, -0.04992104, 0, -0.5, 0.5, 0.5,
-4.139624, -4.030504, -0.04992104, 1, -0.5, 0.5, 0.5,
-4.139624, -4.030504, -0.04992104, 1, 1.5, 0.5, 0.5,
-4.139624, -4.030504, -0.04992104, 0, 1.5, 0.5, 0.5
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
-3, -3.07958, -5.573746,
3, -3.07958, -5.573746,
-3, -3.07958, -5.573746,
-3, -3.238067, -5.849937,
-2, -3.07958, -5.573746,
-2, -3.238067, -5.849937,
-1, -3.07958, -5.573746,
-1, -3.238067, -5.849937,
0, -3.07958, -5.573746,
0, -3.238067, -5.849937,
1, -3.07958, -5.573746,
1, -3.238067, -5.849937,
2, -3.07958, -5.573746,
2, -3.238067, -5.849937,
3, -3.07958, -5.573746,
3, -3.238067, -5.849937
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
-3, -3.555042, -6.402319, 0, -0.5, 0.5, 0.5,
-3, -3.555042, -6.402319, 1, -0.5, 0.5, 0.5,
-3, -3.555042, -6.402319, 1, 1.5, 0.5, 0.5,
-3, -3.555042, -6.402319, 0, 1.5, 0.5, 0.5,
-2, -3.555042, -6.402319, 0, -0.5, 0.5, 0.5,
-2, -3.555042, -6.402319, 1, -0.5, 0.5, 0.5,
-2, -3.555042, -6.402319, 1, 1.5, 0.5, 0.5,
-2, -3.555042, -6.402319, 0, 1.5, 0.5, 0.5,
-1, -3.555042, -6.402319, 0, -0.5, 0.5, 0.5,
-1, -3.555042, -6.402319, 1, -0.5, 0.5, 0.5,
-1, -3.555042, -6.402319, 1, 1.5, 0.5, 0.5,
-1, -3.555042, -6.402319, 0, 1.5, 0.5, 0.5,
0, -3.555042, -6.402319, 0, -0.5, 0.5, 0.5,
0, -3.555042, -6.402319, 1, -0.5, 0.5, 0.5,
0, -3.555042, -6.402319, 1, 1.5, 0.5, 0.5,
0, -3.555042, -6.402319, 0, 1.5, 0.5, 0.5,
1, -3.555042, -6.402319, 0, -0.5, 0.5, 0.5,
1, -3.555042, -6.402319, 1, -0.5, 0.5, 0.5,
1, -3.555042, -6.402319, 1, 1.5, 0.5, 0.5,
1, -3.555042, -6.402319, 0, 1.5, 0.5, 0.5,
2, -3.555042, -6.402319, 0, -0.5, 0.5, 0.5,
2, -3.555042, -6.402319, 1, -0.5, 0.5, 0.5,
2, -3.555042, -6.402319, 1, 1.5, 0.5, 0.5,
2, -3.555042, -6.402319, 0, 1.5, 0.5, 0.5,
3, -3.555042, -6.402319, 0, -0.5, 0.5, 0.5,
3, -3.555042, -6.402319, 1, -0.5, 0.5, 0.5,
3, -3.555042, -6.402319, 1, 1.5, 0.5, 0.5,
3, -3.555042, -6.402319, 0, 1.5, 0.5, 0.5
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
-3.134667, -2, -5.573746,
-3.134667, 3, -5.573746,
-3.134667, -2, -5.573746,
-3.30216, -2, -5.849937,
-3.134667, -1, -5.573746,
-3.30216, -1, -5.849937,
-3.134667, 0, -5.573746,
-3.30216, 0, -5.849937,
-3.134667, 1, -5.573746,
-3.30216, 1, -5.849937,
-3.134667, 2, -5.573746,
-3.30216, 2, -5.849937,
-3.134667, 3, -5.573746,
-3.30216, 3, -5.849937
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
-3.637146, -2, -6.402319, 0, -0.5, 0.5, 0.5,
-3.637146, -2, -6.402319, 1, -0.5, 0.5, 0.5,
-3.637146, -2, -6.402319, 1, 1.5, 0.5, 0.5,
-3.637146, -2, -6.402319, 0, 1.5, 0.5, 0.5,
-3.637146, -1, -6.402319, 0, -0.5, 0.5, 0.5,
-3.637146, -1, -6.402319, 1, -0.5, 0.5, 0.5,
-3.637146, -1, -6.402319, 1, 1.5, 0.5, 0.5,
-3.637146, -1, -6.402319, 0, 1.5, 0.5, 0.5,
-3.637146, 0, -6.402319, 0, -0.5, 0.5, 0.5,
-3.637146, 0, -6.402319, 1, -0.5, 0.5, 0.5,
-3.637146, 0, -6.402319, 1, 1.5, 0.5, 0.5,
-3.637146, 0, -6.402319, 0, 1.5, 0.5, 0.5,
-3.637146, 1, -6.402319, 0, -0.5, 0.5, 0.5,
-3.637146, 1, -6.402319, 1, -0.5, 0.5, 0.5,
-3.637146, 1, -6.402319, 1, 1.5, 0.5, 0.5,
-3.637146, 1, -6.402319, 0, 1.5, 0.5, 0.5,
-3.637146, 2, -6.402319, 0, -0.5, 0.5, 0.5,
-3.637146, 2, -6.402319, 1, -0.5, 0.5, 0.5,
-3.637146, 2, -6.402319, 1, 1.5, 0.5, 0.5,
-3.637146, 2, -6.402319, 0, 1.5, 0.5, 0.5,
-3.637146, 3, -6.402319, 0, -0.5, 0.5, 0.5,
-3.637146, 3, -6.402319, 1, -0.5, 0.5, 0.5,
-3.637146, 3, -6.402319, 1, 1.5, 0.5, 0.5,
-3.637146, 3, -6.402319, 0, 1.5, 0.5, 0.5
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
-3.134667, -3.07958, -4,
-3.134667, -3.07958, 4,
-3.134667, -3.07958, -4,
-3.30216, -3.238067, -4,
-3.134667, -3.07958, -2,
-3.30216, -3.238067, -2,
-3.134667, -3.07958, 0,
-3.30216, -3.238067, 0,
-3.134667, -3.07958, 2,
-3.30216, -3.238067, 2,
-3.134667, -3.07958, 4,
-3.30216, -3.238067, 4
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
-3.637146, -3.555042, -4, 0, -0.5, 0.5, 0.5,
-3.637146, -3.555042, -4, 1, -0.5, 0.5, 0.5,
-3.637146, -3.555042, -4, 1, 1.5, 0.5, 0.5,
-3.637146, -3.555042, -4, 0, 1.5, 0.5, 0.5,
-3.637146, -3.555042, -2, 0, -0.5, 0.5, 0.5,
-3.637146, -3.555042, -2, 1, -0.5, 0.5, 0.5,
-3.637146, -3.555042, -2, 1, 1.5, 0.5, 0.5,
-3.637146, -3.555042, -2, 0, 1.5, 0.5, 0.5,
-3.637146, -3.555042, 0, 0, -0.5, 0.5, 0.5,
-3.637146, -3.555042, 0, 1, -0.5, 0.5, 0.5,
-3.637146, -3.555042, 0, 1, 1.5, 0.5, 0.5,
-3.637146, -3.555042, 0, 0, 1.5, 0.5, 0.5,
-3.637146, -3.555042, 2, 0, -0.5, 0.5, 0.5,
-3.637146, -3.555042, 2, 1, -0.5, 0.5, 0.5,
-3.637146, -3.555042, 2, 1, 1.5, 0.5, 0.5,
-3.637146, -3.555042, 2, 0, 1.5, 0.5, 0.5,
-3.637146, -3.555042, 4, 0, -0.5, 0.5, 0.5,
-3.637146, -3.555042, 4, 1, -0.5, 0.5, 0.5,
-3.637146, -3.555042, 4, 1, 1.5, 0.5, 0.5,
-3.637146, -3.555042, 4, 0, 1.5, 0.5, 0.5
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
-3.134667, -3.07958, -5.573746,
-3.134667, 3.259914, -5.573746,
-3.134667, -3.07958, 5.473904,
-3.134667, 3.259914, 5.473904,
-3.134667, -3.07958, -5.573746,
-3.134667, -3.07958, 5.473904,
-3.134667, 3.259914, -5.573746,
-3.134667, 3.259914, 5.473904,
-3.134667, -3.07958, -5.573746,
3.565044, -3.07958, -5.573746,
-3.134667, -3.07958, 5.473904,
3.565044, -3.07958, 5.473904,
-3.134667, 3.259914, -5.573746,
3.565044, 3.259914, -5.573746,
-3.134667, 3.259914, 5.473904,
3.565044, 3.259914, 5.473904,
3.565044, -3.07958, -5.573746,
3.565044, 3.259914, -5.573746,
3.565044, -3.07958, 5.473904,
3.565044, 3.259914, 5.473904,
3.565044, -3.07958, -5.573746,
3.565044, -3.07958, 5.473904,
3.565044, 3.259914, -5.573746,
3.565044, 3.259914, 5.473904
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
var radius = 7.684978;
var distance = 34.19134;
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
mvMatrix.translate( -0.2151881, -0.09016681, 0.04992104 );
mvMatrix.scale( 1.240225, 1.310696, 0.7521192 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19134);
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
carbanilate_phenothi<-read.table("carbanilate_phenothi.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carbanilate_phenothi$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbanilate_phenothi' not found
```

```r
y<-carbanilate_phenothi$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbanilate_phenothi' not found
```

```r
z<-carbanilate_phenothi$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbanilate_phenothi' not found
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
-3.037099, 0.7070078, -0.8202955, 0, 0, 1, 1, 1,
-2.921932, -0.8085394, -1.224084, 1, 0, 0, 1, 1,
-2.891124, -1.02823, -3.762251, 1, 0, 0, 1, 1,
-2.460715, -0.6714575, -3.205305, 1, 0, 0, 1, 1,
-2.406569, -0.4669749, -1.196165, 1, 0, 0, 1, 1,
-2.347253, -0.3986553, -0.2509496, 1, 0, 0, 1, 1,
-2.327983, -1.440959, -0.4866304, 0, 0, 0, 1, 1,
-2.30665, 0.2728951, -1.930178, 0, 0, 0, 1, 1,
-2.285292, -0.2433034, -2.169911, 0, 0, 0, 1, 1,
-2.246456, -0.8026571, -0.6930864, 0, 0, 0, 1, 1,
-2.221635, -1.209708, -2.390563, 0, 0, 0, 1, 1,
-2.221527, -0.9709619, -1.284225, 0, 0, 0, 1, 1,
-2.165242, 0.2963749, -0.1956776, 0, 0, 0, 1, 1,
-2.102285, -0.02504165, -3.041454, 1, 1, 1, 1, 1,
-2.022316, 0.02465587, -1.00759, 1, 1, 1, 1, 1,
-2.020934, -0.1427149, -1.76307, 1, 1, 1, 1, 1,
-2.005776, 1.42879, -1.218206, 1, 1, 1, 1, 1,
-1.985661, 0.9617252, -0.4183638, 1, 1, 1, 1, 1,
-1.980419, -0.1809483, -0.5372684, 1, 1, 1, 1, 1,
-1.960999, 1.53589, -0.5031209, 1, 1, 1, 1, 1,
-1.913966, 0.5438501, -1.619778, 1, 1, 1, 1, 1,
-1.910144, 0.2366918, -2.841053, 1, 1, 1, 1, 1,
-1.86979, 1.038724, -1.67186, 1, 1, 1, 1, 1,
-1.857604, 0.1013485, -1.745051, 1, 1, 1, 1, 1,
-1.85577, -1.026961, -2.804917, 1, 1, 1, 1, 1,
-1.77701, 0.6675405, -1.278306, 1, 1, 1, 1, 1,
-1.755398, 0.09497076, -0.3409006, 1, 1, 1, 1, 1,
-1.753077, -0.350102, -0.01376, 1, 1, 1, 1, 1,
-1.721069, 0.1014451, -2.524992, 0, 0, 1, 1, 1,
-1.711552, -0.03040629, -0.8182101, 1, 0, 0, 1, 1,
-1.707327, 1.475924, -1.475894, 1, 0, 0, 1, 1,
-1.692094, -1.995637, -2.573326, 1, 0, 0, 1, 1,
-1.677303, -1.276767, -2.112507, 1, 0, 0, 1, 1,
-1.672479, -1.467631, -0.6020401, 1, 0, 0, 1, 1,
-1.668887, -0.7427824, 0.4892281, 0, 0, 0, 1, 1,
-1.665309, -2.406803, -3.374641, 0, 0, 0, 1, 1,
-1.649998, 0.4133364, -0.2459682, 0, 0, 0, 1, 1,
-1.647991, -0.6269712, -3.641919, 0, 0, 0, 1, 1,
-1.645077, 0.4399521, -2.492623, 0, 0, 0, 1, 1,
-1.637501, -0.1204724, -1.93914, 0, 0, 0, 1, 1,
-1.632163, -1.624631, -2.943074, 0, 0, 0, 1, 1,
-1.618408, 1.672231, -0.06102331, 1, 1, 1, 1, 1,
-1.612761, 0.7692007, -1.408411, 1, 1, 1, 1, 1,
-1.610973, 0.0946558, -2.341111, 1, 1, 1, 1, 1,
-1.599352, -1.677291, -4.840689, 1, 1, 1, 1, 1,
-1.582671, 1.297161, -0.3572205, 1, 1, 1, 1, 1,
-1.567423, -0.1935503, -0.8800727, 1, 1, 1, 1, 1,
-1.55497, -0.987207, -1.073853, 1, 1, 1, 1, 1,
-1.544318, -1.122197, -2.727018, 1, 1, 1, 1, 1,
-1.533556, -0.6171717, -1.66784, 1, 1, 1, 1, 1,
-1.524769, 0.4069875, -2.553607, 1, 1, 1, 1, 1,
-1.519133, 0.8040961, -0.3288242, 1, 1, 1, 1, 1,
-1.50692, -0.1926505, -2.911065, 1, 1, 1, 1, 1,
-1.505828, -0.5561143, -3.51516, 1, 1, 1, 1, 1,
-1.50344, -0.04535244, -0.9508774, 1, 1, 1, 1, 1,
-1.494661, -0.4778754, -2.714065, 1, 1, 1, 1, 1,
-1.486238, -1.113532, -1.962361, 0, 0, 1, 1, 1,
-1.485887, -1.267734, -1.563573, 1, 0, 0, 1, 1,
-1.485473, -0.2127756, -2.362074, 1, 0, 0, 1, 1,
-1.482197, 0.4917805, -1.861607, 1, 0, 0, 1, 1,
-1.465952, -0.1906471, -1.355867, 1, 0, 0, 1, 1,
-1.46242, 1.082633, -2.201849, 1, 0, 0, 1, 1,
-1.461083, 0.05901127, -1.781093, 0, 0, 0, 1, 1,
-1.45479, -1.242834, -2.189873, 0, 0, 0, 1, 1,
-1.417301, 0.9470012, -2.030688, 0, 0, 0, 1, 1,
-1.413467, -0.1701031, -1.285852, 0, 0, 0, 1, 1,
-1.406081, 0.0535923, -3.244459, 0, 0, 0, 1, 1,
-1.39912, -0.2097852, -0.2604539, 0, 0, 0, 1, 1,
-1.396008, 0.8855082, -0.2453111, 0, 0, 0, 1, 1,
-1.388105, -0.2973432, -1.460599, 1, 1, 1, 1, 1,
-1.369173, 0.3454321, -1.780494, 1, 1, 1, 1, 1,
-1.367954, 1.270002, 0.4355965, 1, 1, 1, 1, 1,
-1.364066, -0.2890724, 0.03918715, 1, 1, 1, 1, 1,
-1.360486, -0.9048137, -1.439102, 1, 1, 1, 1, 1,
-1.358369, -0.004139141, -1.511964, 1, 1, 1, 1, 1,
-1.357747, 0.3546577, -3.407164, 1, 1, 1, 1, 1,
-1.353449, 1.690237, -1.04499, 1, 1, 1, 1, 1,
-1.340601, -0.2453185, -4.123958, 1, 1, 1, 1, 1,
-1.336713, -1.66948, -4.150023, 1, 1, 1, 1, 1,
-1.333924, 0.3943821, -0.9947481, 1, 1, 1, 1, 1,
-1.331933, 0.7924834, -0.4172885, 1, 1, 1, 1, 1,
-1.330134, 1.126442, 0.553537, 1, 1, 1, 1, 1,
-1.320267, 1.236367, 0.9808489, 1, 1, 1, 1, 1,
-1.311069, 0.4688386, -3.375571, 1, 1, 1, 1, 1,
-1.307302, 0.006095635, -2.169483, 0, 0, 1, 1, 1,
-1.2985, 1.121921, -0.8988575, 1, 0, 0, 1, 1,
-1.295845, -1.39593, -1.587345, 1, 0, 0, 1, 1,
-1.293195, 0.05215757, -1.343309, 1, 0, 0, 1, 1,
-1.293092, 0.1589033, -1.172938, 1, 0, 0, 1, 1,
-1.285607, -0.8018396, -1.942879, 1, 0, 0, 1, 1,
-1.276491, -0.7491284, -1.523049, 0, 0, 0, 1, 1,
-1.260788, -0.1113701, -0.531966, 0, 0, 0, 1, 1,
-1.245163, 2.803966, 0.3894368, 0, 0, 0, 1, 1,
-1.241272, 1.114211, 0.2484237, 0, 0, 0, 1, 1,
-1.229861, -2.374186, -4.454718, 0, 0, 0, 1, 1,
-1.218038, 0.1806897, -0.5494225, 0, 0, 0, 1, 1,
-1.217056, 0.3491521, 0.6213067, 0, 0, 0, 1, 1,
-1.215914, 0.3679534, -0.9807535, 1, 1, 1, 1, 1,
-1.213312, -0.6397957, -1.747709, 1, 1, 1, 1, 1,
-1.2127, -0.2647564, -4.736638, 1, 1, 1, 1, 1,
-1.211729, 1.523899, -1.392649, 1, 1, 1, 1, 1,
-1.206907, 0.6522183, -1.597342, 1, 1, 1, 1, 1,
-1.195283, -0.3381794, -0.4379578, 1, 1, 1, 1, 1,
-1.19173, 0.1062701, -1.225774, 1, 1, 1, 1, 1,
-1.158793, -1.030509, -1.989761, 1, 1, 1, 1, 1,
-1.157815, -1.437654, -1.422006, 1, 1, 1, 1, 1,
-1.155918, 0.01492035, -3.103908, 1, 1, 1, 1, 1,
-1.145343, 0.185775, -1.670035, 1, 1, 1, 1, 1,
-1.144271, 1.006277, 0.04645418, 1, 1, 1, 1, 1,
-1.14368, 1.981498, -1.337304, 1, 1, 1, 1, 1,
-1.141367, 0.6428811, 0.3295909, 1, 1, 1, 1, 1,
-1.138492, -0.3809998, -2.767066, 1, 1, 1, 1, 1,
-1.136732, -1.090686, -4.044274, 0, 0, 1, 1, 1,
-1.135387, 0.5414085, -1.530166, 1, 0, 0, 1, 1,
-1.132407, 0.3583187, -1.561143, 1, 0, 0, 1, 1,
-1.131042, -0.09622888, -2.811875, 1, 0, 0, 1, 1,
-1.121864, 0.4054699, -1.518566, 1, 0, 0, 1, 1,
-1.119079, -2.00292, -4.68942, 1, 0, 0, 1, 1,
-1.117443, -1.352741, -1.018445, 0, 0, 0, 1, 1,
-1.114177, -0.2106389, -2.560805, 0, 0, 0, 1, 1,
-1.110968, 0.5251777, -2.767787, 0, 0, 0, 1, 1,
-1.104455, 0.2844801, -1.568242, 0, 0, 0, 1, 1,
-1.100964, 0.955797, -0.04501241, 0, 0, 0, 1, 1,
-1.100332, -0.9658086, -2.816241, 0, 0, 0, 1, 1,
-1.099351, 1.866124, -1.597131, 0, 0, 0, 1, 1,
-1.09813, 0.6493232, -1.445093, 1, 1, 1, 1, 1,
-1.091019, -1.447751, -3.171809, 1, 1, 1, 1, 1,
-1.088089, -1.029464, -2.048447, 1, 1, 1, 1, 1,
-1.086291, 0.1222337, -2.781599, 1, 1, 1, 1, 1,
-1.080654, 1.716901, -0.4849824, 1, 1, 1, 1, 1,
-1.074555, 1.392642, -1.72346, 1, 1, 1, 1, 1,
-1.072896, 1.103796, -2.380129, 1, 1, 1, 1, 1,
-1.069678, 1.531465, -0.3354663, 1, 1, 1, 1, 1,
-1.067642, -0.08464727, -0.7621429, 1, 1, 1, 1, 1,
-1.051445, 1.121358, -1.842808, 1, 1, 1, 1, 1,
-1.049975, 1.147238, -1.258581, 1, 1, 1, 1, 1,
-1.046173, -0.5052688, -4.050896, 1, 1, 1, 1, 1,
-1.038247, -0.1629787, -1.150146, 1, 1, 1, 1, 1,
-1.034723, 0.2620968, -0.5313923, 1, 1, 1, 1, 1,
-1.021243, 1.061734, -0.4917359, 1, 1, 1, 1, 1,
-1.018457, -1.079949, -3.206834, 0, 0, 1, 1, 1,
-1.014613, 0.80533, 1.093653, 1, 0, 0, 1, 1,
-1.012061, 0.3492095, 1.371896, 1, 0, 0, 1, 1,
-1.010433, 1.309195, -0.3110126, 1, 0, 0, 1, 1,
-1.008082, 0.2634023, -0.1204671, 1, 0, 0, 1, 1,
-1.006567, 0.24337, -2.704328, 1, 0, 0, 1, 1,
-0.9949976, -0.5459271, -4.179011, 0, 0, 0, 1, 1,
-0.9894547, 0.2454476, -0.7221795, 0, 0, 0, 1, 1,
-0.9890042, -0.448564, -2.441892, 0, 0, 0, 1, 1,
-0.986058, -0.4616382, -2.276575, 0, 0, 0, 1, 1,
-0.9859505, 0.4235686, -0.2686059, 0, 0, 0, 1, 1,
-0.9814301, 0.5462658, -1.2138, 0, 0, 0, 1, 1,
-0.9803787, 0.7323195, 1.40334, 0, 0, 0, 1, 1,
-0.9793453, -0.5330437, -1.710779, 1, 1, 1, 1, 1,
-0.9786481, 1.862542, -1.952244, 1, 1, 1, 1, 1,
-0.9757172, 0.01886893, -0.1034734, 1, 1, 1, 1, 1,
-0.9649476, 0.24194, -2.000916, 1, 1, 1, 1, 1,
-0.9606088, 1.344974, -0.04024846, 1, 1, 1, 1, 1,
-0.9571846, -0.8853191, -3.358364, 1, 1, 1, 1, 1,
-0.9552126, -0.09253688, -2.643725, 1, 1, 1, 1, 1,
-0.9529222, -2.273631, -1.538344, 1, 1, 1, 1, 1,
-0.9516972, 0.6221182, -1.544386, 1, 1, 1, 1, 1,
-0.9500534, 0.2872967, -0.7117561, 1, 1, 1, 1, 1,
-0.9495797, 0.9444206, -1.40232, 1, 1, 1, 1, 1,
-0.9493343, 0.8300126, -1.133164, 1, 1, 1, 1, 1,
-0.9453129, 0.7458301, -0.01114863, 1, 1, 1, 1, 1,
-0.9437194, -0.4039436, -3.09953, 1, 1, 1, 1, 1,
-0.9385455, 1.539285, -2.03859, 1, 1, 1, 1, 1,
-0.9383403, 0.02246403, -1.397566, 0, 0, 1, 1, 1,
-0.9352682, -1.46475, -2.527886, 1, 0, 0, 1, 1,
-0.935178, -1.052009, -2.323612, 1, 0, 0, 1, 1,
-0.933306, 0.1830121, -1.289484, 1, 0, 0, 1, 1,
-0.9314191, -0.8249705, -2.702695, 1, 0, 0, 1, 1,
-0.9193919, 1.162024, 1.529779, 1, 0, 0, 1, 1,
-0.9083437, 1.328394, -0.6394331, 0, 0, 0, 1, 1,
-0.9080094, 0.5007933, -1.797411, 0, 0, 0, 1, 1,
-0.9038409, -0.8236559, -1.750197, 0, 0, 0, 1, 1,
-0.9036351, -0.343076, -1.894944, 0, 0, 0, 1, 1,
-0.899996, 1.205949, -0.6517735, 0, 0, 0, 1, 1,
-0.8992074, 1.678329, -0.7466672, 0, 0, 0, 1, 1,
-0.877153, -0.3551926, -3.953209, 0, 0, 0, 1, 1,
-0.8703472, -0.8391928, -2.453856, 1, 1, 1, 1, 1,
-0.8700049, -0.04889213, -1.776708, 1, 1, 1, 1, 1,
-0.8663103, 0.3590864, -2.983371, 1, 1, 1, 1, 1,
-0.8653361, -0.849034, -3.796612, 1, 1, 1, 1, 1,
-0.8637015, 0.9425278, 0.6718197, 1, 1, 1, 1, 1,
-0.8633343, 0.8619574, 0.2054288, 1, 1, 1, 1, 1,
-0.8626888, -1.055144, -1.897904, 1, 1, 1, 1, 1,
-0.862295, -0.5678823, -3.360634, 1, 1, 1, 1, 1,
-0.8576696, 0.4953637, -1.500594, 1, 1, 1, 1, 1,
-0.856739, -0.221682, -2.232344, 1, 1, 1, 1, 1,
-0.8563841, -2.067462, -0.7855042, 1, 1, 1, 1, 1,
-0.8540202, 0.6558043, 0.02114024, 1, 1, 1, 1, 1,
-0.8515083, 0.4722801, 0.4833362, 1, 1, 1, 1, 1,
-0.8458014, 0.7190791, -1.671062, 1, 1, 1, 1, 1,
-0.8384678, 0.2606378, -2.189297, 1, 1, 1, 1, 1,
-0.8384525, -0.5999826, -3.606371, 0, 0, 1, 1, 1,
-0.8378913, -0.454158, -2.765951, 1, 0, 0, 1, 1,
-0.83697, -0.5266384, -1.348542, 1, 0, 0, 1, 1,
-0.8348515, 0.5646474, -0.05993934, 1, 0, 0, 1, 1,
-0.831784, 0.001893003, -2.719373, 1, 0, 0, 1, 1,
-0.827903, 1.116401, 0.9139592, 1, 0, 0, 1, 1,
-0.8197618, -0.4476846, -1.448896, 0, 0, 0, 1, 1,
-0.8135832, 0.3932432, -1.908212, 0, 0, 0, 1, 1,
-0.8028668, 0.6489005, -1.434307, 0, 0, 0, 1, 1,
-0.8020818, 0.4566565, -3.144112, 0, 0, 0, 1, 1,
-0.8007818, 0.485782, -2.036775, 0, 0, 0, 1, 1,
-0.799092, 0.6063659, -1.064795, 0, 0, 0, 1, 1,
-0.7983926, -0.4103868, 0.1233478, 0, 0, 0, 1, 1,
-0.7933366, -1.049382, -0.7522706, 1, 1, 1, 1, 1,
-0.7926859, 0.6662083, 0.4391119, 1, 1, 1, 1, 1,
-0.792197, -0.7587509, -1.841357, 1, 1, 1, 1, 1,
-0.7920445, 0.06705972, -0.6290794, 1, 1, 1, 1, 1,
-0.7885966, -0.1510592, -0.8291268, 1, 1, 1, 1, 1,
-0.7884394, 1.532049, 0.05200917, 1, 1, 1, 1, 1,
-0.7762808, -0.4638964, -1.555821, 1, 1, 1, 1, 1,
-0.7651583, -0.3288555, -1.591581, 1, 1, 1, 1, 1,
-0.7601546, -0.4850151, -1.883837, 1, 1, 1, 1, 1,
-0.7598906, -0.8061892, -1.39932, 1, 1, 1, 1, 1,
-0.7561886, 0.5160621, 0.6821799, 1, 1, 1, 1, 1,
-0.7524902, -0.2051582, -0.8581681, 1, 1, 1, 1, 1,
-0.7460186, 0.3718561, -0.08181832, 1, 1, 1, 1, 1,
-0.7413743, 0.5206819, -0.6972175, 1, 1, 1, 1, 1,
-0.74055, 1.514101, -1.61181, 1, 1, 1, 1, 1,
-0.7373993, -0.3325423, -2.873999, 0, 0, 1, 1, 1,
-0.7281604, -0.6771161, -2.392065, 1, 0, 0, 1, 1,
-0.7279113, -0.4982927, -1.097086, 1, 0, 0, 1, 1,
-0.7277231, -1.554195, -3.636595, 1, 0, 0, 1, 1,
-0.7276152, -1.561706, -2.5387, 1, 0, 0, 1, 1,
-0.7250134, 0.9283313, -0.7005356, 1, 0, 0, 1, 1,
-0.7206566, 0.3003766, -1.230041, 0, 0, 0, 1, 1,
-0.7203521, 1.09474, -1.411326, 0, 0, 0, 1, 1,
-0.7164613, 0.4466528, -0.716423, 0, 0, 0, 1, 1,
-0.7117404, -1.014748, -1.431525, 0, 0, 0, 1, 1,
-0.7067205, 0.349178, -2.284418, 0, 0, 0, 1, 1,
-0.7043879, 0.4944753, -1.328563, 0, 0, 0, 1, 1,
-0.7041909, 1.179732, -0.6652618, 0, 0, 0, 1, 1,
-0.7032561, 0.4675744, -0.7525119, 1, 1, 1, 1, 1,
-0.6963258, 0.2194527, -2.927986, 1, 1, 1, 1, 1,
-0.6936554, 0.5807948, 0.1339629, 1, 1, 1, 1, 1,
-0.6927763, -0.02831345, -0.686359, 1, 1, 1, 1, 1,
-0.6925537, -0.1709489, -0.6036304, 1, 1, 1, 1, 1,
-0.6833121, -0.3737388, -2.460845, 1, 1, 1, 1, 1,
-0.6707485, 1.325399, -0.8370969, 1, 1, 1, 1, 1,
-0.6651794, 1.560602, -2.530885, 1, 1, 1, 1, 1,
-0.6634988, 0.6179621, -1.535636, 1, 1, 1, 1, 1,
-0.6611314, -1.377487, -2.560667, 1, 1, 1, 1, 1,
-0.6604975, 0.9184281, 0.02233176, 1, 1, 1, 1, 1,
-0.659787, -1.310933, -1.357603, 1, 1, 1, 1, 1,
-0.6540717, 0.5641322, -2.166874, 1, 1, 1, 1, 1,
-0.6513088, -0.369391, -0.3225179, 1, 1, 1, 1, 1,
-0.651156, -0.6812357, -3.270871, 1, 1, 1, 1, 1,
-0.6491904, -1.037177, 0.250594, 0, 0, 1, 1, 1,
-0.6464539, 1.046455, -2.081561, 1, 0, 0, 1, 1,
-0.6455446, -1.352976, -2.451295, 1, 0, 0, 1, 1,
-0.6402109, -0.1633541, -1.696173, 1, 0, 0, 1, 1,
-0.635681, 0.4001921, -1.456412, 1, 0, 0, 1, 1,
-0.628817, -0.9331425, -1.83419, 1, 0, 0, 1, 1,
-0.6285266, 1.160557, -2.056088, 0, 0, 0, 1, 1,
-0.6275017, 0.38914, -0.5741386, 0, 0, 0, 1, 1,
-0.6256739, 1.454061, -1.731713, 0, 0, 0, 1, 1,
-0.6199955, -0.02557111, -1.656307, 0, 0, 0, 1, 1,
-0.6159545, 1.37773, -1.001778, 0, 0, 0, 1, 1,
-0.6097578, -0.2383763, -1.053465, 0, 0, 0, 1, 1,
-0.6096702, -0.9169765, -2.922158, 0, 0, 0, 1, 1,
-0.6063856, 0.807319, -0.6347961, 1, 1, 1, 1, 1,
-0.6050903, 0.2886781, -2.938889, 1, 1, 1, 1, 1,
-0.6049389, -0.6441127, -2.67085, 1, 1, 1, 1, 1,
-0.6019722, 1.940531, -0.1014137, 1, 1, 1, 1, 1,
-0.5948959, -0.6491902, -2.1962, 1, 1, 1, 1, 1,
-0.5922609, 0.9614868, -1.187853, 1, 1, 1, 1, 1,
-0.5908874, 0.9847334, -1.165363, 1, 1, 1, 1, 1,
-0.5879608, -0.9294502, -2.522362, 1, 1, 1, 1, 1,
-0.5862756, 0.2425041, -1.405437, 1, 1, 1, 1, 1,
-0.5842484, 0.4061635, -0.961546, 1, 1, 1, 1, 1,
-0.5813776, 1.183178, -0.595217, 1, 1, 1, 1, 1,
-0.5793018, -1.190402, -0.7032606, 1, 1, 1, 1, 1,
-0.5778943, -0.4094978, -2.263957, 1, 1, 1, 1, 1,
-0.5712186, 1.203243, 0.08811366, 1, 1, 1, 1, 1,
-0.5700328, -0.3290055, -2.972369, 1, 1, 1, 1, 1,
-0.5673773, 1.249636, -1.334377, 0, 0, 1, 1, 1,
-0.567248, 0.9366561, 0.3148185, 1, 0, 0, 1, 1,
-0.5652988, -1.095486, -3.804511, 1, 0, 0, 1, 1,
-0.5638614, 1.306626, 0.93343, 1, 0, 0, 1, 1,
-0.5608563, 0.771355, -2.609642, 1, 0, 0, 1, 1,
-0.5478606, 0.4055773, -1.072554, 1, 0, 0, 1, 1,
-0.5446718, 0.5566331, -1.096912, 0, 0, 0, 1, 1,
-0.5442014, -0.4248979, -1.279089, 0, 0, 0, 1, 1,
-0.5423498, -0.1798026, -3.9516, 0, 0, 0, 1, 1,
-0.5411755, -2.18618, -2.726799, 0, 0, 0, 1, 1,
-0.5377649, 0.2945414, -0.3330495, 0, 0, 0, 1, 1,
-0.5289871, -0.9089158, -4.031184, 0, 0, 0, 1, 1,
-0.525352, 0.6418642, -0.7649211, 0, 0, 0, 1, 1,
-0.522022, -0.5474453, -2.565431, 1, 1, 1, 1, 1,
-0.5215855, -1.992584, -2.156589, 1, 1, 1, 1, 1,
-0.5203207, -0.121172, -1.196455, 1, 1, 1, 1, 1,
-0.5126922, 1.552773, 0.3051168, 1, 1, 1, 1, 1,
-0.5112149, 2.029291, -0.8077583, 1, 1, 1, 1, 1,
-0.5111187, -0.1230312, -3.002425, 1, 1, 1, 1, 1,
-0.5081421, -0.01375212, -2.002695, 1, 1, 1, 1, 1,
-0.5080511, 0.6864786, -0.9229591, 1, 1, 1, 1, 1,
-0.5047364, -0.2618029, -1.251507, 1, 1, 1, 1, 1,
-0.502933, 0.5317428, -0.6041725, 1, 1, 1, 1, 1,
-0.5021689, -0.6746417, -4.65479, 1, 1, 1, 1, 1,
-0.4975317, -0.1437164, -2.303295, 1, 1, 1, 1, 1,
-0.4919533, 1.844704, -0.2492138, 1, 1, 1, 1, 1,
-0.4868012, 0.02466617, -0.05479844, 1, 1, 1, 1, 1,
-0.4830177, -0.5485755, -3.527111, 1, 1, 1, 1, 1,
-0.4822844, -1.711814, -2.564091, 0, 0, 1, 1, 1,
-0.4811715, 0.8580504, -1.729156, 1, 0, 0, 1, 1,
-0.4764641, 0.6794415, -0.2283395, 1, 0, 0, 1, 1,
-0.4764045, 1.73736, -0.3953397, 1, 0, 0, 1, 1,
-0.4734587, 0.7424712, -0.8045644, 1, 0, 0, 1, 1,
-0.4721975, 0.2682385, -1.602327, 1, 0, 0, 1, 1,
-0.4687244, -1.061987, -3.130164, 0, 0, 0, 1, 1,
-0.4661522, 0.8585861, -1.565988, 0, 0, 0, 1, 1,
-0.4641559, -0.2906942, 0.1917951, 0, 0, 0, 1, 1,
-0.4621337, -0.9040819, -3.368145, 0, 0, 0, 1, 1,
-0.4609491, -0.06529681, -0.9098492, 0, 0, 0, 1, 1,
-0.4597687, -2.296848, -3.928823, 0, 0, 0, 1, 1,
-0.4543166, 0.04372395, -0.6126745, 0, 0, 0, 1, 1,
-0.453869, 1.009428, 1.698305, 1, 1, 1, 1, 1,
-0.4535592, 0.0481509, -2.097098, 1, 1, 1, 1, 1,
-0.452828, -0.9551564, -1.979999, 1, 1, 1, 1, 1,
-0.4512355, 0.4268426, -0.4878835, 1, 1, 1, 1, 1,
-0.449977, -0.8164113, -1.146336, 1, 1, 1, 1, 1,
-0.4447759, -1.511041, -2.225407, 1, 1, 1, 1, 1,
-0.4406509, -0.1812573, -2.684681, 1, 1, 1, 1, 1,
-0.4353576, 0.8479852, -0.963678, 1, 1, 1, 1, 1,
-0.4336999, -1.141875, -4.621192, 1, 1, 1, 1, 1,
-0.4325795, -0.8238369, -2.168883, 1, 1, 1, 1, 1,
-0.4231292, -1.316593, -1.581467, 1, 1, 1, 1, 1,
-0.415531, -1.6215, -5.412858, 1, 1, 1, 1, 1,
-0.4077921, 0.02379827, -1.49557, 1, 1, 1, 1, 1,
-0.407503, 0.5629695, 0.7722273, 1, 1, 1, 1, 1,
-0.4054166, 1.384134, 0.4163489, 1, 1, 1, 1, 1,
-0.4041654, -1.308559, -2.818293, 0, 0, 1, 1, 1,
-0.3996079, 1.616902, 0.04829162, 1, 0, 0, 1, 1,
-0.3987884, -0.1271227, -0.2264886, 1, 0, 0, 1, 1,
-0.3963343, -0.84557, -4.176535, 1, 0, 0, 1, 1,
-0.3953737, 0.6986982, 0.6806347, 1, 0, 0, 1, 1,
-0.3928099, -0.9153761, -3.184257, 1, 0, 0, 1, 1,
-0.391871, -0.2481222, -1.800117, 0, 0, 0, 1, 1,
-0.3875024, -1.52131, -2.644444, 0, 0, 0, 1, 1,
-0.3843291, 1.189315, -1.00549, 0, 0, 0, 1, 1,
-0.3791881, 0.3277444, -1.304958, 0, 0, 0, 1, 1,
-0.3765982, 1.974895, 0.5145914, 0, 0, 0, 1, 1,
-0.3748517, 1.443183, -0.4538167, 0, 0, 0, 1, 1,
-0.3704942, -0.3750795, -1.295343, 0, 0, 0, 1, 1,
-0.3677615, 1.181635, 0.5070766, 1, 1, 1, 1, 1,
-0.367279, -2.987257, -0.7681201, 1, 1, 1, 1, 1,
-0.359233, -0.6373293, -2.422451, 1, 1, 1, 1, 1,
-0.3574879, 0.5330091, -0.1756787, 1, 1, 1, 1, 1,
-0.35616, 0.6376908, -0.1476451, 1, 1, 1, 1, 1,
-0.3512301, 1.428767, 1.557959, 1, 1, 1, 1, 1,
-0.3504788, 0.3686118, -0.7281481, 1, 1, 1, 1, 1,
-0.3496689, -1.478182, -0.3064151, 1, 1, 1, 1, 1,
-0.3390449, -0.4575903, -2.089079, 1, 1, 1, 1, 1,
-0.3351035, 0.08738011, -1.75418, 1, 1, 1, 1, 1,
-0.3339481, -0.7351001, -2.000904, 1, 1, 1, 1, 1,
-0.3275784, -0.9213295, -2.478716, 1, 1, 1, 1, 1,
-0.3262167, -0.2426991, -2.189756, 1, 1, 1, 1, 1,
-0.3245874, -1.151186, -2.571985, 1, 1, 1, 1, 1,
-0.3238378, 2.093326, -1.05637, 1, 1, 1, 1, 1,
-0.3227786, -1.26751, -3.314916, 0, 0, 1, 1, 1,
-0.3198643, -0.2645745, -1.487199, 1, 0, 0, 1, 1,
-0.3186116, -1.199615, -2.131047, 1, 0, 0, 1, 1,
-0.3183011, -1.100284, -3.439479, 1, 0, 0, 1, 1,
-0.3165001, 0.8374225, 0.7595491, 1, 0, 0, 1, 1,
-0.3161352, -0.991652, -3.422515, 1, 0, 0, 1, 1,
-0.3150217, 0.03845888, -1.121073, 0, 0, 0, 1, 1,
-0.3117977, -0.7337155, -1.176532, 0, 0, 0, 1, 1,
-0.3111966, 0.3248595, 0.3796549, 0, 0, 0, 1, 1,
-0.3082983, 1.161609, 0.195521, 0, 0, 0, 1, 1,
-0.308234, -1.372874, -3.159384, 0, 0, 0, 1, 1,
-0.3066117, 1.676716, -0.2838201, 0, 0, 0, 1, 1,
-0.3058525, 1.137289, -0.8735905, 0, 0, 0, 1, 1,
-0.3044193, 0.8400059, -0.5275739, 1, 1, 1, 1, 1,
-0.3039629, 0.1344977, -1.59692, 1, 1, 1, 1, 1,
-0.3019199, -0.689549, -2.499629, 1, 1, 1, 1, 1,
-0.3017932, -0.1865963, -1.349448, 1, 1, 1, 1, 1,
-0.301625, 1.120535, -1.278292, 1, 1, 1, 1, 1,
-0.3007587, 1.105866, 0.2794347, 1, 1, 1, 1, 1,
-0.2942629, 1.188803, -0.5026729, 1, 1, 1, 1, 1,
-0.2926826, -0.845818, -2.259331, 1, 1, 1, 1, 1,
-0.2922617, 0.506662, -0.0568314, 1, 1, 1, 1, 1,
-0.2921975, -0.374625, -2.579663, 1, 1, 1, 1, 1,
-0.2889855, -0.2032931, -1.688618, 1, 1, 1, 1, 1,
-0.2881756, 0.44525, -1.009217, 1, 1, 1, 1, 1,
-0.2869995, -0.7990024, -3.197701, 1, 1, 1, 1, 1,
-0.2863345, 0.407357, -0.8788233, 1, 1, 1, 1, 1,
-0.2799872, 1.522803, -0.2904718, 1, 1, 1, 1, 1,
-0.2722611, 0.8327907, 1.004095, 0, 0, 1, 1, 1,
-0.2718212, 0.1273614, -0.1108165, 1, 0, 0, 1, 1,
-0.2699878, -0.1729895, -2.719022, 1, 0, 0, 1, 1,
-0.2681397, 0.7494323, -1.065169, 1, 0, 0, 1, 1,
-0.26576, -0.217225, -1.980729, 1, 0, 0, 1, 1,
-0.2652168, 0.08149136, -0.4024297, 1, 0, 0, 1, 1,
-0.2632473, -0.1044449, -1.634459, 0, 0, 0, 1, 1,
-0.2588164, 0.4141819, -2.147103, 0, 0, 0, 1, 1,
-0.2568026, 2.09484, -0.04545306, 0, 0, 0, 1, 1,
-0.2460441, 0.2844205, -1.152768, 0, 0, 0, 1, 1,
-0.2456878, 0.3595811, -1.065887, 0, 0, 0, 1, 1,
-0.2422889, -0.7018479, -4.097703, 0, 0, 0, 1, 1,
-0.2420173, 1.347495, -1.963839, 0, 0, 0, 1, 1,
-0.2402044, 0.3573207, -0.0800164, 1, 1, 1, 1, 1,
-0.2396845, -1.213, -2.329103, 1, 1, 1, 1, 1,
-0.2304502, 0.3841537, 0.01540561, 1, 1, 1, 1, 1,
-0.2292094, -1.714921, -4.335871, 1, 1, 1, 1, 1,
-0.2265248, 0.6606587, 0.2054902, 1, 1, 1, 1, 1,
-0.2265097, 0.8409017, 1.047365, 1, 1, 1, 1, 1,
-0.2263982, 0.0575026, -0.8655741, 1, 1, 1, 1, 1,
-0.2219213, 0.5780985, -2.589358, 1, 1, 1, 1, 1,
-0.2202462, -0.2894717, -2.754999, 1, 1, 1, 1, 1,
-0.2096386, -0.8632345, -4.416921, 1, 1, 1, 1, 1,
-0.2021969, 2.122719, -0.2043544, 1, 1, 1, 1, 1,
-0.2021347, -0.9054134, -2.275504, 1, 1, 1, 1, 1,
-0.2006152, 0.5690566, -0.2048875, 1, 1, 1, 1, 1,
-0.1995338, 0.5353805, -1.198537, 1, 1, 1, 1, 1,
-0.1970231, -1.398364, -3.736095, 1, 1, 1, 1, 1,
-0.1954667, -0.7992517, -2.178757, 0, 0, 1, 1, 1,
-0.1926843, 0.7309443, 0.9771624, 1, 0, 0, 1, 1,
-0.1891407, 0.1572608, 0.02876054, 1, 0, 0, 1, 1,
-0.1822033, 0.7878693, -0.2498667, 1, 0, 0, 1, 1,
-0.1819655, -0.8010067, -2.123662, 1, 0, 0, 1, 1,
-0.1795148, -0.4246748, -3.265379, 1, 0, 0, 1, 1,
-0.1761694, -0.1025344, -1.868337, 0, 0, 0, 1, 1,
-0.1741061, 0.4652955, -1.574361, 0, 0, 0, 1, 1,
-0.173358, -0.4263222, -3.947059, 0, 0, 0, 1, 1,
-0.1712426, 1.014646, 1.01569, 0, 0, 0, 1, 1,
-0.1684561, -1.181808, -3.974451, 0, 0, 0, 1, 1,
-0.1672452, -0.5655124, -3.926121, 0, 0, 0, 1, 1,
-0.1664707, 0.282473, -1.641119, 0, 0, 0, 1, 1,
-0.1622744, 1.091493, 0.9207684, 1, 1, 1, 1, 1,
-0.1571692, -1.629954, -3.661108, 1, 1, 1, 1, 1,
-0.1568884, -0.814758, -1.131624, 1, 1, 1, 1, 1,
-0.1548696, -1.92545, -4.854907, 1, 1, 1, 1, 1,
-0.1537672, -0.9081626, -3.134011, 1, 1, 1, 1, 1,
-0.1526048, -0.5368494, -3.271303, 1, 1, 1, 1, 1,
-0.1521459, -0.2537497, -2.769196, 1, 1, 1, 1, 1,
-0.1517415, 1.043066, 0.3734611, 1, 1, 1, 1, 1,
-0.1440019, -0.51262, -2.264334, 1, 1, 1, 1, 1,
-0.1414325, -0.38235, -3.620114, 1, 1, 1, 1, 1,
-0.1394572, -0.04551272, -2.300534, 1, 1, 1, 1, 1,
-0.1385499, 0.3557086, -1.236288, 1, 1, 1, 1, 1,
-0.1375301, 2.518428, 0.8100406, 1, 1, 1, 1, 1,
-0.137016, 0.3917392, -0.8399085, 1, 1, 1, 1, 1,
-0.1370087, -0.7398998, -2.77759, 1, 1, 1, 1, 1,
-0.1268187, 1.411948, 0.8803778, 0, 0, 1, 1, 1,
-0.1256661, -0.06442786, -3.409646, 1, 0, 0, 1, 1,
-0.1235183, 1.301507, 0.5904651, 1, 0, 0, 1, 1,
-0.1227147, 1.490144, 0.5371382, 1, 0, 0, 1, 1,
-0.1144151, -0.06096924, -2.747301, 1, 0, 0, 1, 1,
-0.1079633, -1.387291, -2.838046, 1, 0, 0, 1, 1,
-0.1077865, -0.5819238, -4.167718, 0, 0, 0, 1, 1,
-0.1058804, -1.574279, -2.348902, 0, 0, 0, 1, 1,
-0.1058546, -0.3859159, -2.568047, 0, 0, 0, 1, 1,
-0.09902363, 0.9734041, -0.8628765, 0, 0, 0, 1, 1,
-0.09307306, -0.305621, -2.355478, 0, 0, 0, 1, 1,
-0.09141701, -0.3730733, -3.19934, 0, 0, 0, 1, 1,
-0.09070455, -1.380569, -3.035519, 0, 0, 0, 1, 1,
-0.08774177, 0.1291374, -0.9427235, 1, 1, 1, 1, 1,
-0.08739258, 0.9285337, 0.8500177, 1, 1, 1, 1, 1,
-0.08529508, 0.601158, 0.36583, 1, 1, 1, 1, 1,
-0.07919686, 0.4559037, -1.647835, 1, 1, 1, 1, 1,
-0.07716744, -1.539948, -2.538666, 1, 1, 1, 1, 1,
-0.07067684, 0.3813525, 0.2190982, 1, 1, 1, 1, 1,
-0.06413247, -0.8398704, -3.243121, 1, 1, 1, 1, 1,
-0.06295864, -0.1677932, -2.836741, 1, 1, 1, 1, 1,
-0.05850874, 2.224823, -1.875269, 1, 1, 1, 1, 1,
-0.05569947, -1.190069, -1.66191, 1, 1, 1, 1, 1,
-0.0519882, 1.172237, -0.8944556, 1, 1, 1, 1, 1,
-0.05151732, -1.794832, -3.159762, 1, 1, 1, 1, 1,
-0.04872394, -0.6397776, -2.05781, 1, 1, 1, 1, 1,
-0.04602, 0.942998, 0.4382316, 1, 1, 1, 1, 1,
-0.04357544, 1.035526, -0.4880183, 1, 1, 1, 1, 1,
-0.04292722, 1.26486, -0.5859069, 0, 0, 1, 1, 1,
-0.04265692, 1.000511, -1.086923, 1, 0, 0, 1, 1,
-0.03916635, 0.6281843, -0.3488978, 1, 0, 0, 1, 1,
-0.03882647, -0.07895077, -3.604295, 1, 0, 0, 1, 1,
-0.03843263, 0.05639859, -0.8914227, 1, 0, 0, 1, 1,
-0.03378749, 0.2174413, -1.55844, 1, 0, 0, 1, 1,
-0.03177093, 0.3111619, -0.8875796, 0, 0, 0, 1, 1,
-0.03071036, 0.3867535, -0.6647847, 0, 0, 0, 1, 1,
-0.02812569, 0.5364376, 0.08089992, 0, 0, 0, 1, 1,
-0.02707555, 1.019458, 0.5297438, 0, 0, 0, 1, 1,
-0.0269055, 1.16317, -0.0786031, 0, 0, 0, 1, 1,
-0.02169982, -0.363833, -2.805828, 0, 0, 0, 1, 1,
-0.02010788, -0.9423382, -0.9110059, 0, 0, 0, 1, 1,
-0.01772577, -1.867362, -2.276009, 1, 1, 1, 1, 1,
-0.01741148, 0.181572, -0.1528606, 1, 1, 1, 1, 1,
-0.01720081, -2.094472, -1.803131, 1, 1, 1, 1, 1,
-0.01624613, 0.5444465, 0.5983819, 1, 1, 1, 1, 1,
-0.01600312, 0.7066346, -0.9997381, 1, 1, 1, 1, 1,
-0.01338001, -0.8579772, -2.533469, 1, 1, 1, 1, 1,
-0.01049413, -0.2892136, -2.876356, 1, 1, 1, 1, 1,
-0.01020994, 0.1059646, -0.1653464, 1, 1, 1, 1, 1,
0.007359381, -1.077395, 4.586377, 1, 1, 1, 1, 1,
0.009459852, -0.6508344, 1.827698, 1, 1, 1, 1, 1,
0.0104191, -1.569984, 1.691989, 1, 1, 1, 1, 1,
0.01232567, -2.393413, 3.857828, 1, 1, 1, 1, 1,
0.01234756, -0.796615, 3.966318, 1, 1, 1, 1, 1,
0.02787488, 2.353927, -0.6066171, 1, 1, 1, 1, 1,
0.03346815, 3.167591, -0.1287069, 1, 1, 1, 1, 1,
0.03366515, -1.091755, 3.288685, 0, 0, 1, 1, 1,
0.03564705, 1.09885, 1.342283, 1, 0, 0, 1, 1,
0.0386596, 0.5526187, 2.10528, 1, 0, 0, 1, 1,
0.04379006, -1.351882, 2.117688, 1, 0, 0, 1, 1,
0.04856209, -1.409871, 2.91277, 1, 0, 0, 1, 1,
0.05225483, 0.7050614, -1.739441, 1, 0, 0, 1, 1,
0.05259582, -0.09909896, 2.882854, 0, 0, 0, 1, 1,
0.05332037, 1.540837, -1.603703, 0, 0, 0, 1, 1,
0.0561951, -0.2311308, 3.755487, 0, 0, 0, 1, 1,
0.06043332, -0.2934212, 2.148, 0, 0, 0, 1, 1,
0.0614979, -1.230766, 5.313015, 0, 0, 0, 1, 1,
0.0620188, 0.06155435, 0.6482413, 0, 0, 0, 1, 1,
0.06336942, 0.5998964, -0.2096608, 0, 0, 0, 1, 1,
0.06556584, 1.182783, 0.6255778, 1, 1, 1, 1, 1,
0.06776863, -0.1656705, 3.070355, 1, 1, 1, 1, 1,
0.06870364, -0.7102826, 2.567621, 1, 1, 1, 1, 1,
0.07189605, -1.775512, 1.592139, 1, 1, 1, 1, 1,
0.07284144, 0.2234628, 0.6506774, 1, 1, 1, 1, 1,
0.07514235, -0.5319014, 3.103863, 1, 1, 1, 1, 1,
0.07955768, 0.2105146, 1.505692, 1, 1, 1, 1, 1,
0.08246443, 1.549366, -0.1123927, 1, 1, 1, 1, 1,
0.08343678, 1.082835, 1.272928, 1, 1, 1, 1, 1,
0.08670082, -0.2314938, 3.506647, 1, 1, 1, 1, 1,
0.08838338, -1.195087, 3.614202, 1, 1, 1, 1, 1,
0.0907134, -1.507718, 2.197834, 1, 1, 1, 1, 1,
0.09241162, -1.21497, 2.209987, 1, 1, 1, 1, 1,
0.09692279, -0.3219633, 1.73068, 1, 1, 1, 1, 1,
0.10169, -1.131484, 4.118001, 1, 1, 1, 1, 1,
0.1017966, -0.7581859, 3.494415, 0, 0, 1, 1, 1,
0.1029253, -0.2479893, 2.386989, 1, 0, 0, 1, 1,
0.1038377, -1.740656, 3.921192, 1, 0, 0, 1, 1,
0.1044613, 0.6410265, 1.344018, 1, 0, 0, 1, 1,
0.1142459, 0.1333513, 0.8670552, 1, 0, 0, 1, 1,
0.115512, -0.1678646, 3.903753, 1, 0, 0, 1, 1,
0.1182886, -0.7346619, 2.822446, 0, 0, 0, 1, 1,
0.1190063, 0.738798, -0.8135482, 0, 0, 0, 1, 1,
0.1251667, 1.961795, -0.7431709, 0, 0, 0, 1, 1,
0.1284938, -0.3827297, 1.649739, 0, 0, 0, 1, 1,
0.1294448, 0.01399723, 0.3812056, 0, 0, 0, 1, 1,
0.1325364, -0.5784873, 2.900679, 0, 0, 0, 1, 1,
0.1330568, 0.08342613, 0.4162312, 0, 0, 0, 1, 1,
0.1336666, 1.982146, 0.2558632, 1, 1, 1, 1, 1,
0.1353161, -0.6554614, 2.624958, 1, 1, 1, 1, 1,
0.135563, -0.8836279, 4.17611, 1, 1, 1, 1, 1,
0.1375514, 1.33339, -0.8843239, 1, 1, 1, 1, 1,
0.1410684, -0.4532667, 2.489537, 1, 1, 1, 1, 1,
0.1490893, 0.7756455, -0.4812869, 1, 1, 1, 1, 1,
0.1525563, -0.01968514, 1.445803, 1, 1, 1, 1, 1,
0.1545061, 0.2715617, 1.702272, 1, 1, 1, 1, 1,
0.159501, 0.03590338, 1.55452, 1, 1, 1, 1, 1,
0.160067, -1.505722, 3.363067, 1, 1, 1, 1, 1,
0.1623226, 0.1176592, 0.4802378, 1, 1, 1, 1, 1,
0.1639238, 0.8284795, 0.8352747, 1, 1, 1, 1, 1,
0.1660839, -0.1354703, 2.341824, 1, 1, 1, 1, 1,
0.1662098, -1.220248, 3.576556, 1, 1, 1, 1, 1,
0.1711734, 1.507398, 3.445106, 1, 1, 1, 1, 1,
0.1721693, 1.058892, 0.04534495, 0, 0, 1, 1, 1,
0.1736717, 0.4279588, 0.3469496, 1, 0, 0, 1, 1,
0.1736791, 0.9850982, -2.140645, 1, 0, 0, 1, 1,
0.1774561, 0.6813743, -0.6874315, 1, 0, 0, 1, 1,
0.1814815, 0.00432968, 1.827689, 1, 0, 0, 1, 1,
0.1854167, -0.5530961, 3.395615, 1, 0, 0, 1, 1,
0.1921647, -0.8266438, 2.261931, 0, 0, 0, 1, 1,
0.1946888, 0.08714707, 0.6349376, 0, 0, 0, 1, 1,
0.2022108, -0.01021497, 2.863043, 0, 0, 0, 1, 1,
0.2036236, -0.6379814, 3.513255, 0, 0, 0, 1, 1,
0.2080573, -0.3001483, 2.349307, 0, 0, 0, 1, 1,
0.210096, -2.529858, 3.234142, 0, 0, 0, 1, 1,
0.2113443, -1.651111, 2.047014, 0, 0, 0, 1, 1,
0.2134276, 0.6633334, 0.2777833, 1, 1, 1, 1, 1,
0.2146224, -0.1410901, 1.969009, 1, 1, 1, 1, 1,
0.2176018, -0.8609114, 3.519075, 1, 1, 1, 1, 1,
0.2178496, -0.2938246, 2.886276, 1, 1, 1, 1, 1,
0.219172, -0.0522167, 2.145522, 1, 1, 1, 1, 1,
0.2217883, 0.5695249, -1.451813, 1, 1, 1, 1, 1,
0.2230039, 2.331754, -0.1554709, 1, 1, 1, 1, 1,
0.2235393, -1.541925, 1.886603, 1, 1, 1, 1, 1,
0.2260163, -1.181515, 3.555315, 1, 1, 1, 1, 1,
0.2264473, 0.7578526, -0.4673937, 1, 1, 1, 1, 1,
0.2298866, -0.4244458, 3.727398, 1, 1, 1, 1, 1,
0.2330063, -0.1861951, -0.133345, 1, 1, 1, 1, 1,
0.2350014, -0.1364343, 0.09094068, 1, 1, 1, 1, 1,
0.2367249, -0.404406, 1.648537, 1, 1, 1, 1, 1,
0.2390437, 1.338507, 1.019845, 1, 1, 1, 1, 1,
0.2391361, 0.03402225, 2.012041, 0, 0, 1, 1, 1,
0.2392792, -0.7079988, 2.882733, 1, 0, 0, 1, 1,
0.2409659, 0.3931908, 0.1771443, 1, 0, 0, 1, 1,
0.2415691, 1.115132, 1.544524, 1, 0, 0, 1, 1,
0.2432972, 0.3966868, 3.218284, 1, 0, 0, 1, 1,
0.2505623, -0.3422923, 3.066974, 1, 0, 0, 1, 1,
0.2545784, -0.1661417, 2.973982, 0, 0, 0, 1, 1,
0.2639227, -0.9196036, 1.86078, 0, 0, 0, 1, 1,
0.2697537, -0.2691163, 1.207335, 0, 0, 0, 1, 1,
0.2701984, 0.2876615, 3.793202, 0, 0, 0, 1, 1,
0.2720768, -0.2474035, 0.2995027, 0, 0, 0, 1, 1,
0.2732782, 0.9549266, 0.4626049, 0, 0, 0, 1, 1,
0.273775, 0.05235032, 2.229839, 0, 0, 0, 1, 1,
0.2749835, 2.41894, -0.1592356, 1, 1, 1, 1, 1,
0.2754776, -0.282214, 1.099821, 1, 1, 1, 1, 1,
0.2815835, -1.599463, 3.875182, 1, 1, 1, 1, 1,
0.2829458, 0.2433893, 1.557503, 1, 1, 1, 1, 1,
0.2869853, 0.4470508, -0.5242309, 1, 1, 1, 1, 1,
0.2903176, -0.9560803, 1.956036, 1, 1, 1, 1, 1,
0.2917111, -1.209193, 2.588373, 1, 1, 1, 1, 1,
0.2919859, -0.2155222, 2.575866, 1, 1, 1, 1, 1,
0.2927937, -1.014152, 3.029364, 1, 1, 1, 1, 1,
0.2935473, -0.04996952, 1.903352, 1, 1, 1, 1, 1,
0.2945012, -1.741078, 2.540904, 1, 1, 1, 1, 1,
0.2960823, 1.0853, 0.7555006, 1, 1, 1, 1, 1,
0.2972892, 0.6530984, 1.217161, 1, 1, 1, 1, 1,
0.2980719, -0.9373487, 3.011309, 1, 1, 1, 1, 1,
0.3014643, -0.2152167, 0.9287637, 1, 1, 1, 1, 1,
0.3068057, -1.602774, 1.534541, 0, 0, 1, 1, 1,
0.3079846, 0.4819516, 1.318685, 1, 0, 0, 1, 1,
0.3092526, -0.008826926, 0.522656, 1, 0, 0, 1, 1,
0.3117923, 0.6258258, 2.313416, 1, 0, 0, 1, 1,
0.3243183, -1.14468, 2.536936, 1, 0, 0, 1, 1,
0.3245106, -1.397242, 2.87944, 1, 0, 0, 1, 1,
0.3253298, 0.01232059, 1.354589, 0, 0, 0, 1, 1,
0.3270361, 0.07609674, 1.315907, 0, 0, 0, 1, 1,
0.3298088, 0.9276935, -0.9607096, 0, 0, 0, 1, 1,
0.3336103, 1.160851, 0.2214313, 0, 0, 0, 1, 1,
0.3346418, 0.1237723, 1.38047, 0, 0, 0, 1, 1,
0.337232, 1.121482, -2.08583, 0, 0, 0, 1, 1,
0.3381079, 0.8121589, -0.5460598, 0, 0, 0, 1, 1,
0.3481807, -0.5257844, 3.940032, 1, 1, 1, 1, 1,
0.3499615, -0.3206392, 3.518237, 1, 1, 1, 1, 1,
0.3509281, -1.587534, 1.38027, 1, 1, 1, 1, 1,
0.3527172, -0.7874078, 2.751076, 1, 1, 1, 1, 1,
0.3539512, 0.8147358, 1.608892, 1, 1, 1, 1, 1,
0.354317, 1.078571, 0.8531794, 1, 1, 1, 1, 1,
0.3584966, 0.7626702, 0.3475001, 1, 1, 1, 1, 1,
0.3590519, 0.3301336, 1.11021, 1, 1, 1, 1, 1,
0.3597673, 1.150998, -2.14206, 1, 1, 1, 1, 1,
0.3610828, -1.959419, 3.216382, 1, 1, 1, 1, 1,
0.36279, -0.4268171, 2.409759, 1, 1, 1, 1, 1,
0.3657465, -0.8626565, 1.266865, 1, 1, 1, 1, 1,
0.3680282, 1.404655, -1.593099, 1, 1, 1, 1, 1,
0.3710006, 1.115428, 1.313176, 1, 1, 1, 1, 1,
0.37324, 0.3171655, -0.3328761, 1, 1, 1, 1, 1,
0.3818856, -0.0368995, 3.85193, 0, 0, 1, 1, 1,
0.3839143, 0.1638703, -0.5179205, 1, 0, 0, 1, 1,
0.3849126, -1.376039, 2.218314, 1, 0, 0, 1, 1,
0.3922478, 0.9876534, -1.400618, 1, 0, 0, 1, 1,
0.3975993, 1.415944, -1.514506, 1, 0, 0, 1, 1,
0.4064495, 0.02618282, 1.784533, 1, 0, 0, 1, 1,
0.410227, -1.536, 3.656476, 0, 0, 0, 1, 1,
0.4129531, 0.5307468, -1.577488, 0, 0, 0, 1, 1,
0.4201099, 0.3151506, 2.456862, 0, 0, 0, 1, 1,
0.4209004, 1.577641, 0.584509, 0, 0, 0, 1, 1,
0.4214801, -0.8247119, 1.69842, 0, 0, 0, 1, 1,
0.4219225, 0.6672437, 0.9021241, 0, 0, 0, 1, 1,
0.4219539, 1.258641, 0.2955169, 0, 0, 0, 1, 1,
0.4222248, -0.9897024, 0.1071131, 1, 1, 1, 1, 1,
0.4237778, -0.9389505, 3.659769, 1, 1, 1, 1, 1,
0.4237914, -0.006850501, 1.485747, 1, 1, 1, 1, 1,
0.4271368, 0.6366696, -0.03616937, 1, 1, 1, 1, 1,
0.4293505, 0.3542944, 0.6907372, 1, 1, 1, 1, 1,
0.4319791, -2.005722, 3.270352, 1, 1, 1, 1, 1,
0.4361328, 0.6063969, 0.3260039, 1, 1, 1, 1, 1,
0.4368478, -0.1957473, 1.606905, 1, 1, 1, 1, 1,
0.4388629, -0.6258716, 3.155872, 1, 1, 1, 1, 1,
0.451304, -0.0790199, 1.254476, 1, 1, 1, 1, 1,
0.4519875, -0.8816365, 3.739622, 1, 1, 1, 1, 1,
0.4536321, -1.239995, 2.388669, 1, 1, 1, 1, 1,
0.4545512, -1.072224, 1.929999, 1, 1, 1, 1, 1,
0.4572735, -0.5300233, 1.809409, 1, 1, 1, 1, 1,
0.4615174, 0.2429774, 0.3240557, 1, 1, 1, 1, 1,
0.4625843, 2.063202, -0.5339866, 0, 0, 1, 1, 1,
0.4636942, 1.019, 1.511425, 1, 0, 0, 1, 1,
0.4680559, 0.7917895, -0.2170103, 1, 0, 0, 1, 1,
0.4697141, 0.7154374, 0.7604009, 1, 0, 0, 1, 1,
0.4742224, -0.5095208, 3.335207, 1, 0, 0, 1, 1,
0.4751517, -0.857338, 2.931996, 1, 0, 0, 1, 1,
0.4760856, 0.3815819, -0.4804414, 0, 0, 0, 1, 1,
0.4771674, -0.4840418, 2.119088, 0, 0, 0, 1, 1,
0.4857336, -0.4011524, 1.94469, 0, 0, 0, 1, 1,
0.4903061, 1.132251, -0.8160986, 0, 0, 0, 1, 1,
0.4923719, 2.245121, -0.3931334, 0, 0, 0, 1, 1,
0.4961753, -1.559028, 2.490253, 0, 0, 0, 1, 1,
0.499207, -0.1097492, 0.9866416, 0, 0, 0, 1, 1,
0.501901, 1.592407, 1.560911, 1, 1, 1, 1, 1,
0.5084476, 0.8329813, -0.4239751, 1, 1, 1, 1, 1,
0.5110076, 2.080868, -0.630943, 1, 1, 1, 1, 1,
0.5125454, 2.960194, 0.2550392, 1, 1, 1, 1, 1,
0.5132288, -0.8494511, 2.261125, 1, 1, 1, 1, 1,
0.5216609, -1.785657, 2.566212, 1, 1, 1, 1, 1,
0.5270116, 0.6226764, 0.5637636, 1, 1, 1, 1, 1,
0.5289963, 2.401169, 1.29175, 1, 1, 1, 1, 1,
0.5310423, 0.1019243, 2.314259, 1, 1, 1, 1, 1,
0.533122, -0.3852358, 0.2069555, 1, 1, 1, 1, 1,
0.5378779, 1.242973, 0.9105331, 1, 1, 1, 1, 1,
0.5384654, 0.6604913, 0.3594987, 1, 1, 1, 1, 1,
0.5395598, 0.3469994, 1.593092, 1, 1, 1, 1, 1,
0.539681, 0.2702627, 0.159877, 1, 1, 1, 1, 1,
0.5403059, -0.9266623, 3.092288, 1, 1, 1, 1, 1,
0.543362, -1.381439, 4.912418, 0, 0, 1, 1, 1,
0.5468751, 0.7413134, 1.206369, 1, 0, 0, 1, 1,
0.5469491, 0.2434368, -0.1353814, 1, 0, 0, 1, 1,
0.548016, -0.5594507, 2.200641, 1, 0, 0, 1, 1,
0.5564748, -0.09541906, 1.058583, 1, 0, 0, 1, 1,
0.5565202, -1.019346, 2.03271, 1, 0, 0, 1, 1,
0.5577174, 1.532803, 0.8051832, 0, 0, 0, 1, 1,
0.5577739, -0.3201823, 2.500872, 0, 0, 0, 1, 1,
0.5589935, -2.391412, 3.616893, 0, 0, 0, 1, 1,
0.5615688, 0.234355, 0.05876596, 0, 0, 0, 1, 1,
0.5717978, 0.69532, 0.5404368, 0, 0, 0, 1, 1,
0.5750181, -2.51823, 1.90324, 0, 0, 0, 1, 1,
0.5753319, -0.7349711, 3.316586, 0, 0, 0, 1, 1,
0.5765961, 1.482116, -0.2246163, 1, 1, 1, 1, 1,
0.5766745, -1.09903, 0.5949273, 1, 1, 1, 1, 1,
0.5773025, 0.567896, 1.252792, 1, 1, 1, 1, 1,
0.5819131, 0.03610767, 0.1049212, 1, 1, 1, 1, 1,
0.5836738, -0.1893874, 2.090031, 1, 1, 1, 1, 1,
0.5841933, -0.01034738, 1.2039, 1, 1, 1, 1, 1,
0.5852294, 0.3187931, 0.5702705, 1, 1, 1, 1, 1,
0.5945218, 0.0189577, 0.894158, 1, 1, 1, 1, 1,
0.6017203, -0.3908285, 1.219089, 1, 1, 1, 1, 1,
0.6041263, 0.0152331, 1.956573, 1, 1, 1, 1, 1,
0.6144247, 0.8738408, 0.2874892, 1, 1, 1, 1, 1,
0.6175413, 0.6799055, 2.484566, 1, 1, 1, 1, 1,
0.6177208, -0.9326293, 2.161661, 1, 1, 1, 1, 1,
0.6182258, 0.3744684, 1.07021, 1, 1, 1, 1, 1,
0.6184215, -0.02158339, 0.2491325, 1, 1, 1, 1, 1,
0.6185654, -1.030868, 0.7955799, 0, 0, 1, 1, 1,
0.6276467, -0.5691898, 3.816836, 1, 0, 0, 1, 1,
0.6310248, -0.01571712, 2.269928, 1, 0, 0, 1, 1,
0.6315762, 0.9517937, 1.672801, 1, 0, 0, 1, 1,
0.6318193, 0.8699045, -0.660857, 1, 0, 0, 1, 1,
0.6343341, 1.175519, 0.4395677, 1, 0, 0, 1, 1,
0.6393893, -0.09249999, -0.3671292, 0, 0, 0, 1, 1,
0.6401005, 0.740068, 1.921741, 0, 0, 0, 1, 1,
0.6447482, 0.9372774, 0.7166545, 0, 0, 0, 1, 1,
0.6451887, 0.2182537, 0.925904, 0, 0, 0, 1, 1,
0.6472121, 0.8265827, 0.2115949, 0, 0, 0, 1, 1,
0.6569318, -0.4333119, 3.610093, 0, 0, 0, 1, 1,
0.6608902, 1.166369, 0.4071527, 0, 0, 0, 1, 1,
0.6614075, 1.686368, -0.7014436, 1, 1, 1, 1, 1,
0.6639232, 1.361296, -0.0848322, 1, 1, 1, 1, 1,
0.6688293, 0.6692495, 2.406957, 1, 1, 1, 1, 1,
0.6734114, -0.8850675, 3.184754, 1, 1, 1, 1, 1,
0.6740035, 0.3927624, 2.037811, 1, 1, 1, 1, 1,
0.6777264, -0.1932133, 0.695143, 1, 1, 1, 1, 1,
0.6792591, 0.9714882, -0.460917, 1, 1, 1, 1, 1,
0.685224, 0.2090074, 0.93481, 1, 1, 1, 1, 1,
0.6889627, 0.8819338, -1.228181, 1, 1, 1, 1, 1,
0.6961921, 1.387597, -0.4750918, 1, 1, 1, 1, 1,
0.6968117, 0.1991503, 2.742023, 1, 1, 1, 1, 1,
0.6980728, -0.05646584, 0.5102173, 1, 1, 1, 1, 1,
0.6981878, -1.102468, 2.420463, 1, 1, 1, 1, 1,
0.6997846, -1.281758, 1.908882, 1, 1, 1, 1, 1,
0.7029515, 1.693192, 0.4409662, 1, 1, 1, 1, 1,
0.7030811, -1.141738, 3.029534, 0, 0, 1, 1, 1,
0.7032397, -0.03865271, 2.148301, 1, 0, 0, 1, 1,
0.7037959, -1.757861, 3.174334, 1, 0, 0, 1, 1,
0.7046836, -2.635497, 3.840069, 1, 0, 0, 1, 1,
0.7059972, 0.7628151, -0.0475624, 1, 0, 0, 1, 1,
0.7107661, -1.394016, 2.280146, 1, 0, 0, 1, 1,
0.7158014, -0.06744851, 1.465822, 0, 0, 0, 1, 1,
0.7207676, -0.6610075, 1.42307, 0, 0, 0, 1, 1,
0.721143, 1.065102, 0.1098875, 0, 0, 0, 1, 1,
0.7219924, -0.1169692, 1.702776, 0, 0, 0, 1, 1,
0.7248577, 0.2074, 0.382261, 0, 0, 0, 1, 1,
0.7264444, -1.208584, 2.540125, 0, 0, 0, 1, 1,
0.7322122, -0.3082981, 1.534206, 0, 0, 0, 1, 1,
0.7338231, 0.09778334, 1.166199, 1, 1, 1, 1, 1,
0.7352377, -0.4264622, 2.588319, 1, 1, 1, 1, 1,
0.7432114, 0.7678214, 2.053176, 1, 1, 1, 1, 1,
0.7436047, 0.6879273, -0.01047639, 1, 1, 1, 1, 1,
0.7452174, 2.035587, 0.4339314, 1, 1, 1, 1, 1,
0.7464123, 2.116324, -0.4205258, 1, 1, 1, 1, 1,
0.7480524, 0.565493, 0.8242198, 1, 1, 1, 1, 1,
0.7485623, 0.06979606, 0.8530431, 1, 1, 1, 1, 1,
0.7505855, 0.3751654, 2.543747, 1, 1, 1, 1, 1,
0.7534192, 0.2285921, 2.160298, 1, 1, 1, 1, 1,
0.7576004, 1.552733, -1.380503, 1, 1, 1, 1, 1,
0.7629525, 0.578795, -0.4862785, 1, 1, 1, 1, 1,
0.762984, -0.9276914, 2.863368, 1, 1, 1, 1, 1,
0.764883, 0.2423094, 2.687541, 1, 1, 1, 1, 1,
0.767753, 1.521261, 0.2015942, 1, 1, 1, 1, 1,
0.7769619, 0.9568508, 0.9823893, 0, 0, 1, 1, 1,
0.7786682, 0.06740892, 2.319561, 1, 0, 0, 1, 1,
0.7789024, 0.6172649, 1.135178, 1, 0, 0, 1, 1,
0.7797278, -0.6702885, 2.998057, 1, 0, 0, 1, 1,
0.7804326, -1.475107, 1.848813, 1, 0, 0, 1, 1,
0.7880427, 1.375931, -0.4857373, 1, 0, 0, 1, 1,
0.7914287, 0.7463698, 1.17198, 0, 0, 0, 1, 1,
0.7916578, -1.120509, 1.098086, 0, 0, 0, 1, 1,
0.797367, -0.05123741, 1.158418, 0, 0, 0, 1, 1,
0.7984136, -0.2217525, -0.4560066, 0, 0, 0, 1, 1,
0.806111, -0.9888487, 2.217347, 0, 0, 0, 1, 1,
0.8065355, 0.7452018, 2.731048, 0, 0, 0, 1, 1,
0.808836, 1.294194, -0.6989921, 0, 0, 0, 1, 1,
0.8125731, -1.49235, 3.83631, 1, 1, 1, 1, 1,
0.8125954, 0.382544, 0.8812925, 1, 1, 1, 1, 1,
0.8174776, -0.7929966, 2.579094, 1, 1, 1, 1, 1,
0.8252968, -0.02707607, 3.175945, 1, 1, 1, 1, 1,
0.826097, -0.6655076, 2.012971, 1, 1, 1, 1, 1,
0.8340247, -0.1510423, -0.04341763, 1, 1, 1, 1, 1,
0.8406897, 0.7126303, 2.255165, 1, 1, 1, 1, 1,
0.8431715, -0.2010364, 2.878202, 1, 1, 1, 1, 1,
0.8493785, -0.617192, 2.605488, 1, 1, 1, 1, 1,
0.8532841, 1.475154, 0.8134134, 1, 1, 1, 1, 1,
0.854437, 0.153168, 1.405374, 1, 1, 1, 1, 1,
0.85518, 0.3833085, 0.4841679, 1, 1, 1, 1, 1,
0.8606807, -0.3273331, 3.182066, 1, 1, 1, 1, 1,
0.8642591, -0.5827122, 1.872587, 1, 1, 1, 1, 1,
0.8755544, -0.5350592, 2.49231, 1, 1, 1, 1, 1,
0.8769835, 0.06527698, 2.04109, 0, 0, 1, 1, 1,
0.8779383, -0.07667381, 2.314165, 1, 0, 0, 1, 1,
0.8801742, -0.1962181, 1.689771, 1, 0, 0, 1, 1,
0.8827408, -0.7542, 1.081452, 1, 0, 0, 1, 1,
0.885169, -0.1127, 0.918403, 1, 0, 0, 1, 1,
0.8883274, 0.9063297, 1.340433, 1, 0, 0, 1, 1,
0.8940276, -0.07365353, 1.726916, 0, 0, 0, 1, 1,
0.8972752, -0.8414871, 3.783929, 0, 0, 0, 1, 1,
0.9028182, -0.05558346, 0.9467891, 0, 0, 0, 1, 1,
0.9063895, -0.08668531, 1.421745, 0, 0, 0, 1, 1,
0.9072258, 1.248407, 0.03178564, 0, 0, 0, 1, 1,
0.9123713, 0.7680519, 0.4410027, 0, 0, 0, 1, 1,
0.9141431, -1.313276, 3.432794, 0, 0, 0, 1, 1,
0.9248173, 0.8556287, 1.341022, 1, 1, 1, 1, 1,
0.9265576, -0.9310634, 0.4809608, 1, 1, 1, 1, 1,
0.9290585, 0.1800061, 2.054997, 1, 1, 1, 1, 1,
0.9327019, -0.7122847, 2.200675, 1, 1, 1, 1, 1,
0.9427134, -1.129833, 2.295925, 1, 1, 1, 1, 1,
0.9511523, -0.5437818, 2.080751, 1, 1, 1, 1, 1,
0.955327, 3.040868, 0.6348525, 1, 1, 1, 1, 1,
0.9553285, -0.4176835, 0.03526463, 1, 1, 1, 1, 1,
0.9580213, 0.772256, 1.722402, 1, 1, 1, 1, 1,
0.9594727, -0.04187166, 0.5351487, 1, 1, 1, 1, 1,
0.9618233, -1.124745, 1.694045, 1, 1, 1, 1, 1,
0.9622146, -0.2506925, 1.217509, 1, 1, 1, 1, 1,
0.9650298, 1.451235, 2.098784, 1, 1, 1, 1, 1,
0.972665, 0.7753592, 0.5082384, 1, 1, 1, 1, 1,
0.9744796, -1.672839, 1.191626, 1, 1, 1, 1, 1,
0.976576, 0.4485422, 0.8254477, 0, 0, 1, 1, 1,
0.9784501, 0.0896074, 1.571103, 1, 0, 0, 1, 1,
0.9843642, -0.7513481, 1.984036, 1, 0, 0, 1, 1,
0.9883623, 0.9541514, 1.112769, 1, 0, 0, 1, 1,
0.9970886, -0.6916869, 1.105335, 1, 0, 0, 1, 1,
1.002892, 0.658148, 1.449419, 1, 0, 0, 1, 1,
1.027792, 0.4496806, 1.290548, 0, 0, 0, 1, 1,
1.031595, -0.3107134, 2.1485, 0, 0, 0, 1, 1,
1.031698, 0.3699816, 3.340769, 0, 0, 0, 1, 1,
1.036075, 0.3975743, 1.09372, 0, 0, 0, 1, 1,
1.043028, -1.11921, 1.487906, 0, 0, 0, 1, 1,
1.043691, 1.722526, -0.3335881, 0, 0, 0, 1, 1,
1.05132, 0.5931091, -0.4556597, 0, 0, 0, 1, 1,
1.056547, -0.5183731, 1.792397, 1, 1, 1, 1, 1,
1.064364, -1.201683, 2.737229, 1, 1, 1, 1, 1,
1.076659, 1.002843, 1.739262, 1, 1, 1, 1, 1,
1.085248, 0.1627919, 0.576707, 1, 1, 1, 1, 1,
1.085697, -2.4105, 2.111109, 1, 1, 1, 1, 1,
1.088495, -0.1436514, 0.06413039, 1, 1, 1, 1, 1,
1.10552, -0.1158334, 0.6608841, 1, 1, 1, 1, 1,
1.105813, 0.4332856, 2.361917, 1, 1, 1, 1, 1,
1.108684, -0.6970193, 2.479917, 1, 1, 1, 1, 1,
1.112337, -1.643525, 0.2642193, 1, 1, 1, 1, 1,
1.113003, -0.08807162, 1.208609, 1, 1, 1, 1, 1,
1.122577, -0.4264522, 1.648893, 1, 1, 1, 1, 1,
1.125334, -0.8287728, 2.65041, 1, 1, 1, 1, 1,
1.134911, -0.5561507, 2.437552, 1, 1, 1, 1, 1,
1.134971, -1.307605, 3.382815, 1, 1, 1, 1, 1,
1.165189, -0.5180465, 0.7202884, 0, 0, 1, 1, 1,
1.176109, 0.01105658, 1.710003, 1, 0, 0, 1, 1,
1.17813, 0.8078284, -0.6432157, 1, 0, 0, 1, 1,
1.181503, 0.9060832, -0.4673772, 1, 0, 0, 1, 1,
1.187336, 1.591161, -0.4823782, 1, 0, 0, 1, 1,
1.192652, 0.5375146, -0.5248455, 1, 0, 0, 1, 1,
1.195705, -1.0449, 2.714905, 0, 0, 0, 1, 1,
1.205102, 1.015638, 2.221617, 0, 0, 0, 1, 1,
1.206657, 2.315263, 0.5476549, 0, 0, 0, 1, 1,
1.208043, 0.5367382, 0.212314, 0, 0, 0, 1, 1,
1.221506, -0.5359293, 1.77732, 0, 0, 0, 1, 1,
1.235808, -0.6561095, 4.018328, 0, 0, 0, 1, 1,
1.251381, -0.8435516, 1.358349, 0, 0, 0, 1, 1,
1.25315, -0.3994807, 1.708086, 1, 1, 1, 1, 1,
1.262841, 1.458808, 0.7290077, 1, 1, 1, 1, 1,
1.268129, -0.7343519, 1.181307, 1, 1, 1, 1, 1,
1.274942, 1.928262, -0.3612634, 1, 1, 1, 1, 1,
1.27513, 0.2683131, 1.245068, 1, 1, 1, 1, 1,
1.277074, -2.37345, 3.037249, 1, 1, 1, 1, 1,
1.289441, -0.08070925, 3.076983, 1, 1, 1, 1, 1,
1.291393, 1.496429, 0.1653774, 1, 1, 1, 1, 1,
1.292638, -0.1642013, 2.644244, 1, 1, 1, 1, 1,
1.298761, -0.5069565, 1.029156, 1, 1, 1, 1, 1,
1.305926, 1.284515, 2.237407, 1, 1, 1, 1, 1,
1.307045, 0.1623105, 2.364165, 1, 1, 1, 1, 1,
1.309684, 0.8923295, 0.4770656, 1, 1, 1, 1, 1,
1.312138, -0.3773787, 1.692867, 1, 1, 1, 1, 1,
1.312503, -0.5719151, 1.023887, 1, 1, 1, 1, 1,
1.315114, 0.4732849, 2.319973, 0, 0, 1, 1, 1,
1.315287, -0.9902481, 0.9442178, 1, 0, 0, 1, 1,
1.317078, -0.3098711, 0.3315238, 1, 0, 0, 1, 1,
1.324291, -0.9506314, 1.479216, 1, 0, 0, 1, 1,
1.327208, -0.142789, 1.704043, 1, 0, 0, 1, 1,
1.333732, -0.7309582, 2.602373, 1, 0, 0, 1, 1,
1.339129, -0.6316313, 2.558333, 0, 0, 0, 1, 1,
1.347548, -0.4871986, 1.928469, 0, 0, 0, 1, 1,
1.357589, -0.8004965, 3.311004, 0, 0, 0, 1, 1,
1.361932, 0.4796762, 2.139051, 0, 0, 0, 1, 1,
1.369766, 1.64501, 0.9483404, 0, 0, 0, 1, 1,
1.371821, 0.3588296, 2.337261, 0, 0, 0, 1, 1,
1.380394, -0.4216755, 1.328693, 0, 0, 0, 1, 1,
1.388308, -0.8070185, 4.151106, 1, 1, 1, 1, 1,
1.388611, -0.8436083, 2.17944, 1, 1, 1, 1, 1,
1.39312, -1.267591, 2.94273, 1, 1, 1, 1, 1,
1.402659, -0.5930211, 1.808723, 1, 1, 1, 1, 1,
1.402936, 0.8153697, -1.418372, 1, 1, 1, 1, 1,
1.416697, -1.139013, 1.069864, 1, 1, 1, 1, 1,
1.420846, 1.143761, 0.9094357, 1, 1, 1, 1, 1,
1.430106, -2.05141, 3.329972, 1, 1, 1, 1, 1,
1.431746, -0.03473115, 1.742072, 1, 1, 1, 1, 1,
1.440528, -0.7333409, 2.8992, 1, 1, 1, 1, 1,
1.450181, 0.7808701, 0.1359821, 1, 1, 1, 1, 1,
1.451726, -0.4180607, 1.207013, 1, 1, 1, 1, 1,
1.459529, 1.244793, 1.246448, 1, 1, 1, 1, 1,
1.463048, -0.9098967, 0.3720667, 1, 1, 1, 1, 1,
1.464559, 0.2382238, 1.933309, 1, 1, 1, 1, 1,
1.493811, -1.025619, 1.631234, 0, 0, 1, 1, 1,
1.494422, 0.7358055, 0.5785821, 1, 0, 0, 1, 1,
1.50562, 1.771986, 1.453708, 1, 0, 0, 1, 1,
1.512275, 0.1765787, 1.11953, 1, 0, 0, 1, 1,
1.517905, -1.372759, -0.1529254, 1, 0, 0, 1, 1,
1.519234, -2.102257, 3.625513, 1, 0, 0, 1, 1,
1.522643, 1.096306, 0.5127103, 0, 0, 0, 1, 1,
1.528613, 0.4883578, 2.47313, 0, 0, 0, 1, 1,
1.538902, -0.2383824, 1.994198, 0, 0, 0, 1, 1,
1.546585, -1.066368, 2.364214, 0, 0, 0, 1, 1,
1.55417, 0.7291641, 0.5244336, 0, 0, 0, 1, 1,
1.582177, -0.172517, 2.521322, 0, 0, 0, 1, 1,
1.588865, -1.196525, 3.15055, 0, 0, 0, 1, 1,
1.599118, -1.719931, 3.664425, 1, 1, 1, 1, 1,
1.610816, 1.830058, 1.384537, 1, 1, 1, 1, 1,
1.617692, 0.7930599, 0.8871555, 1, 1, 1, 1, 1,
1.638185, 0.4694832, 1.516899, 1, 1, 1, 1, 1,
1.64196, 0.9772155, 3.209783, 1, 1, 1, 1, 1,
1.644057, -0.08272894, 2.260269, 1, 1, 1, 1, 1,
1.646892, 0.7073855, 2.344586, 1, 1, 1, 1, 1,
1.679045, 0.2994567, 1.519141, 1, 1, 1, 1, 1,
1.680083, -1.673223, 3.53528, 1, 1, 1, 1, 1,
1.681734, 0.2156852, 2.559872, 1, 1, 1, 1, 1,
1.685049, 0.3754796, 0.9777453, 1, 1, 1, 1, 1,
1.699778, 0.9579633, 0.718105, 1, 1, 1, 1, 1,
1.700669, -0.3550655, 1.127658, 1, 1, 1, 1, 1,
1.710191, 0.05605786, 0.1680423, 1, 1, 1, 1, 1,
1.712052, -0.1166851, 1.32718, 1, 1, 1, 1, 1,
1.72209, -0.5114879, 1.554132, 0, 0, 1, 1, 1,
1.731196, -0.682752, 1.407051, 1, 0, 0, 1, 1,
1.734987, -0.8499984, 2.668911, 1, 0, 0, 1, 1,
1.74745, -0.4770384, 1.242788, 1, 0, 0, 1, 1,
1.761017, 0.8025414, 0.8401595, 1, 0, 0, 1, 1,
1.773068, 1.457735, 1.463799, 1, 0, 0, 1, 1,
1.806795, -0.6761044, 1.872737, 0, 0, 0, 1, 1,
1.820416, 2.018149, -0.6295508, 0, 0, 0, 1, 1,
1.820684, 0.5204691, 2.270402, 0, 0, 0, 1, 1,
1.831556, 0.2734761, 0.8342539, 0, 0, 0, 1, 1,
1.84877, 1.046641, 1.760821, 0, 0, 0, 1, 1,
1.858371, 0.2391612, 0.119263, 0, 0, 0, 1, 1,
1.886874, 1.897849, 0.875204, 0, 0, 0, 1, 1,
1.898511, 0.2328379, 1.295925, 1, 1, 1, 1, 1,
1.909474, 0.7698076, 0.3058535, 1, 1, 1, 1, 1,
1.911972, 0.302808, 3.425446, 1, 1, 1, 1, 1,
1.91335, -0.4589356, 0.3758928, 1, 1, 1, 1, 1,
1.918296, -0.5623186, 1.92171, 1, 1, 1, 1, 1,
1.920069, 1.475172, 1.730403, 1, 1, 1, 1, 1,
1.935019, 0.5282654, 2.056858, 1, 1, 1, 1, 1,
1.965475, 0.7328948, 0.7154221, 1, 1, 1, 1, 1,
1.981338, 1.448974, 1.310721, 1, 1, 1, 1, 1,
1.984229, -1.154943, 0.7462926, 1, 1, 1, 1, 1,
2.103427, 0.3864209, 0.6503345, 1, 1, 1, 1, 1,
2.151556, 1.346943, -0.9728106, 1, 1, 1, 1, 1,
2.153131, 0.8398372, 0.3840159, 1, 1, 1, 1, 1,
2.155628, 2.021916, 1.076122, 1, 1, 1, 1, 1,
2.159935, -0.5550094, 0.8262227, 1, 1, 1, 1, 1,
2.189076, -0.4277769, 1.962199, 0, 0, 1, 1, 1,
2.194627, 1.490817, 1.086857, 1, 0, 0, 1, 1,
2.227555, -0.7918735, 2.31447, 1, 0, 0, 1, 1,
2.232141, 0.7405647, 1.970682, 1, 0, 0, 1, 1,
2.245606, -0.8988035, 1.468256, 1, 0, 0, 1, 1,
2.28658, -0.8028665, 1.98493, 1, 0, 0, 1, 1,
2.318793, -0.3461103, 1.646653, 0, 0, 0, 1, 1,
2.378895, 0.6354722, 2.354724, 0, 0, 0, 1, 1,
2.408844, -0.06196077, 1.779826, 0, 0, 0, 1, 1,
2.47061, -0.4883268, 3.042672, 0, 0, 0, 1, 1,
2.505984, -0.2033571, 1.70274, 0, 0, 0, 1, 1,
2.50625, 0.4008124, 1.499757, 0, 0, 0, 1, 1,
2.565853, -0.0347597, 1.459379, 0, 0, 0, 1, 1,
2.797542, 1.513763, 0.3138247, 1, 1, 1, 1, 1,
2.81277, 0.6409468, 0.1273892, 1, 1, 1, 1, 1,
2.853, 1.130332, 3.47464, 1, 1, 1, 1, 1,
2.986277, -0.3805812, 1.420886, 1, 1, 1, 1, 1,
3.078368, 0.6012956, 1.173734, 1, 1, 1, 1, 1,
3.155672, 0.4191974, 0.6840482, 1, 1, 1, 1, 1,
3.467475, -1.123239, 1.014347, 1, 1, 1, 1, 1
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
var radius = 9.538611;
var distance = 33.50396;
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
mvMatrix.translate( -0.215188, -0.09016693, 0.04992104 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50396);
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
