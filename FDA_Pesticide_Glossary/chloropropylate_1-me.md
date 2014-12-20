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
-3.427787, 1.369784, -1.320788, 1, 0, 0, 1,
-3.40894, -1.350122, -1.454194, 1, 0.007843138, 0, 1,
-3.253466, 0.5070798, -1.109771, 1, 0.01176471, 0, 1,
-2.951948, 1.311275, -1.587779, 1, 0.01960784, 0, 1,
-2.856961, 0.0919562, -1.671713, 1, 0.02352941, 0, 1,
-2.81316, 0.4587722, -0.7671852, 1, 0.03137255, 0, 1,
-2.808515, -0.5584049, -2.617807, 1, 0.03529412, 0, 1,
-2.749858, -1.163237, -2.052771, 1, 0.04313726, 0, 1,
-2.736319, 1.64155, -0.5372616, 1, 0.04705882, 0, 1,
-2.597144, 1.73014, -2.647289, 1, 0.05490196, 0, 1,
-2.533518, 1.312205, -2.138294, 1, 0.05882353, 0, 1,
-2.425669, -1.672309, -1.457435, 1, 0.06666667, 0, 1,
-2.413876, 1.729318, -0.7050059, 1, 0.07058824, 0, 1,
-2.397977, -0.4863663, -2.405499, 1, 0.07843138, 0, 1,
-2.37624, -1.0381, -0.9534828, 1, 0.08235294, 0, 1,
-2.32028, -0.7671852, -1.67748, 1, 0.09019608, 0, 1,
-2.260841, 1.629172, -1.202414, 1, 0.09411765, 0, 1,
-2.250136, 1.16262, -1.320747, 1, 0.1019608, 0, 1,
-2.203819, 1.515173, -0.7598789, 1, 0.1098039, 0, 1,
-2.203318, 0.3881153, -0.9662775, 1, 0.1137255, 0, 1,
-2.165925, 0.3737417, -1.078512, 1, 0.1215686, 0, 1,
-2.15251, -1.281456, -2.982275, 1, 0.1254902, 0, 1,
-2.147679, 0.5327852, 0.07495799, 1, 0.1333333, 0, 1,
-2.080471, 0.2971365, -2.039231, 1, 0.1372549, 0, 1,
-2.042595, 0.7390205, -1.937474, 1, 0.145098, 0, 1,
-2.007765, 1.905924, -1.467615, 1, 0.1490196, 0, 1,
-1.996056, -0.5027279, -1.493423, 1, 0.1568628, 0, 1,
-1.980839, -0.3372797, -1.210985, 1, 0.1607843, 0, 1,
-1.955881, -0.4305396, -2.982038, 1, 0.1686275, 0, 1,
-1.9408, -1.918617, -3.932787, 1, 0.172549, 0, 1,
-1.935571, 0.3534468, -2.738567, 1, 0.1803922, 0, 1,
-1.934981, -0.5570306, -1.711365, 1, 0.1843137, 0, 1,
-1.923849, -0.5005718, -2.980613, 1, 0.1921569, 0, 1,
-1.919015, 1.259292, -0.01443199, 1, 0.1960784, 0, 1,
-1.85672, -0.9102967, 0.007207065, 1, 0.2039216, 0, 1,
-1.855455, 1.176204, -0.6186568, 1, 0.2117647, 0, 1,
-1.839962, -0.3752929, -2.501621, 1, 0.2156863, 0, 1,
-1.83602, -1.456281, -3.666216, 1, 0.2235294, 0, 1,
-1.827623, 1.016026, -2.020652, 1, 0.227451, 0, 1,
-1.826653, 1.187259, -0.240551, 1, 0.2352941, 0, 1,
-1.821521, 1.441725, -1.21648, 1, 0.2392157, 0, 1,
-1.807246, -1.875385, -3.696806, 1, 0.2470588, 0, 1,
-1.797407, 0.0782275, -2.175368, 1, 0.2509804, 0, 1,
-1.77541, 0.7899393, -2.082137, 1, 0.2588235, 0, 1,
-1.767579, 1.048266, -1.720954, 1, 0.2627451, 0, 1,
-1.756218, -1.330285, -4.912033, 1, 0.2705882, 0, 1,
-1.747506, -0.9131566, -3.400139, 1, 0.2745098, 0, 1,
-1.714996, 0.5129328, -0.4033861, 1, 0.282353, 0, 1,
-1.691822, 0.3096116, -2.762656, 1, 0.2862745, 0, 1,
-1.688274, -0.9844712, -3.316259, 1, 0.2941177, 0, 1,
-1.687403, -0.6683382, -1.395216, 1, 0.3019608, 0, 1,
-1.672591, 1.583866, -2.678373, 1, 0.3058824, 0, 1,
-1.64737, -1.125745, -2.439629, 1, 0.3137255, 0, 1,
-1.641577, 0.06099711, -1.55339, 1, 0.3176471, 0, 1,
-1.625923, 0.6841976, -1.541684, 1, 0.3254902, 0, 1,
-1.614201, 0.427677, 1.240772, 1, 0.3294118, 0, 1,
-1.610906, 0.3740863, -2.153858, 1, 0.3372549, 0, 1,
-1.607836, 1.171901, 0.2152008, 1, 0.3411765, 0, 1,
-1.606744, 1.176226, -1.007392, 1, 0.3490196, 0, 1,
-1.559433, 1.435616, -2.166914, 1, 0.3529412, 0, 1,
-1.557086, -1.17786, -1.154607, 1, 0.3607843, 0, 1,
-1.545033, -0.3655329, -0.7383218, 1, 0.3647059, 0, 1,
-1.544675, -1.057367, -2.476082, 1, 0.372549, 0, 1,
-1.544394, -0.302583, -2.782538, 1, 0.3764706, 0, 1,
-1.532687, -0.3391245, -0.2806767, 1, 0.3843137, 0, 1,
-1.524955, 1.380648, -1.009538, 1, 0.3882353, 0, 1,
-1.522192, -0.06107973, -0.6860543, 1, 0.3960784, 0, 1,
-1.505266, -0.3177789, -1.116772, 1, 0.4039216, 0, 1,
-1.495585, 0.345102, -1.289347, 1, 0.4078431, 0, 1,
-1.492135, -1.007455, -1.944961, 1, 0.4156863, 0, 1,
-1.483644, -0.3148631, -2.690838, 1, 0.4196078, 0, 1,
-1.480196, -0.2711769, -2.119438, 1, 0.427451, 0, 1,
-1.460772, 1.188952, 0.1683172, 1, 0.4313726, 0, 1,
-1.460563, 0.2237108, -2.345384, 1, 0.4392157, 0, 1,
-1.455761, -0.1412935, -2.706009, 1, 0.4431373, 0, 1,
-1.433807, -0.4241903, -1.255161, 1, 0.4509804, 0, 1,
-1.417411, 0.6885395, -0.9146565, 1, 0.454902, 0, 1,
-1.413813, -0.6309918, -1.316752, 1, 0.4627451, 0, 1,
-1.406831, -1.715398, -3.067203, 1, 0.4666667, 0, 1,
-1.404626, -0.2544277, -0.7330137, 1, 0.4745098, 0, 1,
-1.400428, 1.089651, -0.5623427, 1, 0.4784314, 0, 1,
-1.398669, -1.037242, -3.914206, 1, 0.4862745, 0, 1,
-1.396163, 1.222025, -2.348869, 1, 0.4901961, 0, 1,
-1.389733, 0.7391189, -1.607928, 1, 0.4980392, 0, 1,
-1.384093, -0.620207, 0.03066819, 1, 0.5058824, 0, 1,
-1.379986, 1.459563, -2.12432, 1, 0.509804, 0, 1,
-1.378386, -0.8339645, -1.233995, 1, 0.5176471, 0, 1,
-1.378106, -0.4873487, -3.287436, 1, 0.5215687, 0, 1,
-1.37643, -1.5328, -2.378227, 1, 0.5294118, 0, 1,
-1.368579, -0.2497824, -2.53716, 1, 0.5333334, 0, 1,
-1.361976, 0.3277892, -2.40852, 1, 0.5411765, 0, 1,
-1.359574, -0.09662493, -1.438578, 1, 0.5450981, 0, 1,
-1.357146, -0.6833308, -3.373741, 1, 0.5529412, 0, 1,
-1.335768, -0.05722499, -1.336665, 1, 0.5568628, 0, 1,
-1.319456, 0.9037821, -2.496813, 1, 0.5647059, 0, 1,
-1.31886, 0.4375341, -1.439049, 1, 0.5686275, 0, 1,
-1.318808, 0.361535, -1.011788, 1, 0.5764706, 0, 1,
-1.296944, -0.8349898, -1.358588, 1, 0.5803922, 0, 1,
-1.294925, 0.6303251, 0.8074895, 1, 0.5882353, 0, 1,
-1.28814, -2.307233, -4.754511, 1, 0.5921569, 0, 1,
-1.288027, 0.8821149, 0.6885885, 1, 0.6, 0, 1,
-1.27493, -0.2213674, -1.242209, 1, 0.6078432, 0, 1,
-1.272827, -1.063155, -2.115002, 1, 0.6117647, 0, 1,
-1.269844, 1.077416, -2.035701, 1, 0.6196079, 0, 1,
-1.263584, 0.8192606, -0.2774833, 1, 0.6235294, 0, 1,
-1.248653, 0.1243335, -2.231972, 1, 0.6313726, 0, 1,
-1.247779, -0.8260663, -2.895236, 1, 0.6352941, 0, 1,
-1.244896, -0.7992357, -3.656827, 1, 0.6431373, 0, 1,
-1.23213, 0.08189687, -0.303171, 1, 0.6470588, 0, 1,
-1.228506, -2.013858, -2.675947, 1, 0.654902, 0, 1,
-1.226835, -0.7796022, -2.377243, 1, 0.6588235, 0, 1,
-1.223441, 1.294751, -2.450704, 1, 0.6666667, 0, 1,
-1.217629, 0.1459624, -0.6034526, 1, 0.6705883, 0, 1,
-1.209724, -0.2095551, -2.037701, 1, 0.6784314, 0, 1,
-1.207291, -1.142804, -2.028093, 1, 0.682353, 0, 1,
-1.204192, -0.5450795, -2.668216, 1, 0.6901961, 0, 1,
-1.200189, 0.7449134, -1.623759, 1, 0.6941177, 0, 1,
-1.200097, 0.573719, -1.401104, 1, 0.7019608, 0, 1,
-1.199472, -0.1534801, -0.1878965, 1, 0.7098039, 0, 1,
-1.198167, -0.2734531, -2.231645, 1, 0.7137255, 0, 1,
-1.178578, -0.3770756, -1.070076, 1, 0.7215686, 0, 1,
-1.17804, -1.22669, -1.436306, 1, 0.7254902, 0, 1,
-1.172689, 0.8331175, -0.2667276, 1, 0.7333333, 0, 1,
-1.159793, -0.5765309, -4.231103, 1, 0.7372549, 0, 1,
-1.142694, -1.026319, -3.118907, 1, 0.7450981, 0, 1,
-1.134068, -0.1049473, -3.21067, 1, 0.7490196, 0, 1,
-1.131202, -0.2062028, -3.213027, 1, 0.7568628, 0, 1,
-1.129877, -0.4188387, -1.02033, 1, 0.7607843, 0, 1,
-1.117166, 0.8721176, 0.2016264, 1, 0.7686275, 0, 1,
-1.115767, -0.3731034, -1.575259, 1, 0.772549, 0, 1,
-1.115057, -0.6944199, -4.240153, 1, 0.7803922, 0, 1,
-1.113258, 0.5952776, 2.475192, 1, 0.7843137, 0, 1,
-1.112481, -0.4056895, -1.49275, 1, 0.7921569, 0, 1,
-1.107871, 2.232708, -1.356377, 1, 0.7960784, 0, 1,
-1.107163, -0.6692492, -1.018247, 1, 0.8039216, 0, 1,
-1.101931, -0.4664596, -3.030329, 1, 0.8117647, 0, 1,
-1.098582, 0.06565105, -1.870973, 1, 0.8156863, 0, 1,
-1.097263, -0.08516418, -3.106421, 1, 0.8235294, 0, 1,
-1.096599, 0.8877787, -0.2437772, 1, 0.827451, 0, 1,
-1.095946, -0.3501099, -3.46125, 1, 0.8352941, 0, 1,
-1.094008, -0.02058249, 0.2182796, 1, 0.8392157, 0, 1,
-1.089836, 0.968364, -1.246251, 1, 0.8470588, 0, 1,
-1.084305, -0.2071785, -2.480997, 1, 0.8509804, 0, 1,
-1.078245, 1.467725, 0.02630024, 1, 0.8588235, 0, 1,
-1.073048, -0.9078488, -2.087296, 1, 0.8627451, 0, 1,
-1.0708, -0.5282609, -2.260665, 1, 0.8705882, 0, 1,
-1.070485, -0.008322516, -2.339486, 1, 0.8745098, 0, 1,
-1.067811, -0.8919478, -0.9800819, 1, 0.8823529, 0, 1,
-1.063311, 0.2600492, -2.622069, 1, 0.8862745, 0, 1,
-1.062254, 1.805454, -1.16147, 1, 0.8941177, 0, 1,
-1.060171, -0.09769302, -2.457558, 1, 0.8980392, 0, 1,
-1.059608, 1.289004, -0.9702178, 1, 0.9058824, 0, 1,
-1.055118, -0.01271964, -2.734013, 1, 0.9137255, 0, 1,
-1.034364, 0.2053416, -3.006206, 1, 0.9176471, 0, 1,
-1.03066, 0.7748053, 0.3374529, 1, 0.9254902, 0, 1,
-1.026287, -0.09101341, 0.1884534, 1, 0.9294118, 0, 1,
-1.025929, 2.600585, 0.5182524, 1, 0.9372549, 0, 1,
-1.022854, -1.440384, -3.456948, 1, 0.9411765, 0, 1,
-1.018004, 1.373551, -0.9894305, 1, 0.9490196, 0, 1,
-1.01243, -0.01809712, -1.44919, 1, 0.9529412, 0, 1,
-1.002255, -1.263516, -2.777669, 1, 0.9607843, 0, 1,
-1.001901, -2.695169, -2.648314, 1, 0.9647059, 0, 1,
-1.001839, -0.7721214, -1.8343, 1, 0.972549, 0, 1,
-0.9967907, -1.314706, -1.717323, 1, 0.9764706, 0, 1,
-0.9891894, -1.588675, -1.783243, 1, 0.9843137, 0, 1,
-0.9866292, -2.227335, -1.830557, 1, 0.9882353, 0, 1,
-0.9842202, 0.1828073, -0.4912489, 1, 0.9960784, 0, 1,
-0.9821843, 0.2208935, 0.2386392, 0.9960784, 1, 0, 1,
-0.9820261, 0.3370112, -1.368162, 0.9921569, 1, 0, 1,
-0.9795449, -0.05041074, -0.5743872, 0.9843137, 1, 0, 1,
-0.9741017, 0.0141508, -0.8743191, 0.9803922, 1, 0, 1,
-0.9732185, -0.5316183, -3.343733, 0.972549, 1, 0, 1,
-0.965651, -0.3598414, -0.6473348, 0.9686275, 1, 0, 1,
-0.9645481, -0.1047635, -3.540558, 0.9607843, 1, 0, 1,
-0.9643002, 0.7480423, -1.488857, 0.9568627, 1, 0, 1,
-0.9636879, 1.042874, 0.3989022, 0.9490196, 1, 0, 1,
-0.9629894, -0.4599515, -0.2752182, 0.945098, 1, 0, 1,
-0.9604369, 0.1285131, -0.7704116, 0.9372549, 1, 0, 1,
-0.9597346, -0.4709744, -3.48035, 0.9333333, 1, 0, 1,
-0.9575306, -0.4728896, -1.67464, 0.9254902, 1, 0, 1,
-0.9545696, -0.7878734, -2.884934, 0.9215686, 1, 0, 1,
-0.9496127, 1.095739, -1.149744, 0.9137255, 1, 0, 1,
-0.9495156, 2.196212, -1.198169, 0.9098039, 1, 0, 1,
-0.9435862, 0.3673632, -1.290186, 0.9019608, 1, 0, 1,
-0.9390672, 0.8832459, -1.20384, 0.8941177, 1, 0, 1,
-0.9217079, -0.1869881, -1.009621, 0.8901961, 1, 0, 1,
-0.9177929, 2.060747, -0.9914781, 0.8823529, 1, 0, 1,
-0.9165123, 0.9972755, -0.1313855, 0.8784314, 1, 0, 1,
-0.9065693, 0.4495993, -1.270011, 0.8705882, 1, 0, 1,
-0.9045221, -1.940069, -0.6644904, 0.8666667, 1, 0, 1,
-0.9017949, 1.166926, -1.367538, 0.8588235, 1, 0, 1,
-0.8947245, -0.2697787, -1.931277, 0.854902, 1, 0, 1,
-0.888661, 0.4340195, -1.881616, 0.8470588, 1, 0, 1,
-0.8838875, -1.2672, -1.237242, 0.8431373, 1, 0, 1,
-0.8837325, -0.3436247, -1.835297, 0.8352941, 1, 0, 1,
-0.8801422, 0.8042559, -1.725822, 0.8313726, 1, 0, 1,
-0.8769304, -0.6851598, -0.7614785, 0.8235294, 1, 0, 1,
-0.8766503, -0.1452081, -3.083928, 0.8196079, 1, 0, 1,
-0.8763139, 0.9285634, -0.3679568, 0.8117647, 1, 0, 1,
-0.8760725, 1.360149, -0.4182326, 0.8078431, 1, 0, 1,
-0.8741536, 1.451968, -1.781274, 0.8, 1, 0, 1,
-0.8647385, 0.2762589, -0.2316903, 0.7921569, 1, 0, 1,
-0.8639536, -1.019691, -3.330599, 0.7882353, 1, 0, 1,
-0.8621165, 0.3305569, -2.187918, 0.7803922, 1, 0, 1,
-0.8603474, -1.086873, -4.169461, 0.7764706, 1, 0, 1,
-0.8569351, 2.179595, -0.7887977, 0.7686275, 1, 0, 1,
-0.8556527, -0.0616966, -1.540206, 0.7647059, 1, 0, 1,
-0.8485489, -0.9288968, -1.71851, 0.7568628, 1, 0, 1,
-0.8454279, 0.2524968, -0.6237942, 0.7529412, 1, 0, 1,
-0.8448828, 0.4442492, -1.979002, 0.7450981, 1, 0, 1,
-0.8392024, -0.6828309, -1.217304, 0.7411765, 1, 0, 1,
-0.838223, -1.13934, -0.8658469, 0.7333333, 1, 0, 1,
-0.8334052, 0.6349887, -0.2084462, 0.7294118, 1, 0, 1,
-0.8316919, -1.940387, -2.622101, 0.7215686, 1, 0, 1,
-0.8314669, 0.5307052, -1.92118, 0.7176471, 1, 0, 1,
-0.8310755, 0.1855864, -0.7987047, 0.7098039, 1, 0, 1,
-0.8290101, 1.396514, -2.127943, 0.7058824, 1, 0, 1,
-0.8265114, 1.172096, -0.7274012, 0.6980392, 1, 0, 1,
-0.8219357, -0.08092379, -2.093932, 0.6901961, 1, 0, 1,
-0.8170447, -1.585462, -1.637512, 0.6862745, 1, 0, 1,
-0.8118454, -0.6060714, -2.421743, 0.6784314, 1, 0, 1,
-0.8107235, 0.1666441, 0.3672217, 0.6745098, 1, 0, 1,
-0.8064331, 3.342489, 1.325855, 0.6666667, 1, 0, 1,
-0.8036169, 1.110999, -0.6555815, 0.6627451, 1, 0, 1,
-0.8036137, 0.4571691, -1.943965, 0.654902, 1, 0, 1,
-0.7969837, 1.306527, -0.2772647, 0.6509804, 1, 0, 1,
-0.7961096, -1.955875, -1.931159, 0.6431373, 1, 0, 1,
-0.7882789, -1.146603, -2.870794, 0.6392157, 1, 0, 1,
-0.7876852, 0.1507439, -2.020552, 0.6313726, 1, 0, 1,
-0.7848824, 1.068653, -0.5469769, 0.627451, 1, 0, 1,
-0.7846822, 1.331701, 0.2454941, 0.6196079, 1, 0, 1,
-0.7801132, 0.02869152, -2.670205, 0.6156863, 1, 0, 1,
-0.7697123, 1.406666, 0.1297232, 0.6078432, 1, 0, 1,
-0.7677881, 0.9320498, -0.6676295, 0.6039216, 1, 0, 1,
-0.7662082, 1.05973, -1.949685, 0.5960785, 1, 0, 1,
-0.7611684, 2.063662, 0.3162792, 0.5882353, 1, 0, 1,
-0.7566358, 0.9464698, -1.058333, 0.5843138, 1, 0, 1,
-0.7565948, 1.17442, -1.766576, 0.5764706, 1, 0, 1,
-0.7546705, -1.235111, -3.036213, 0.572549, 1, 0, 1,
-0.7459933, -0.8530502, -4.16824, 0.5647059, 1, 0, 1,
-0.7446489, 0.9487848, 0.7556278, 0.5607843, 1, 0, 1,
-0.7431389, -1.709206, -2.183489, 0.5529412, 1, 0, 1,
-0.7315911, 0.06324504, -1.930864, 0.5490196, 1, 0, 1,
-0.7315542, 0.1079338, -0.6797795, 0.5411765, 1, 0, 1,
-0.7262903, 1.24764, -0.4849377, 0.5372549, 1, 0, 1,
-0.7192864, 1.330571, -0.776427, 0.5294118, 1, 0, 1,
-0.7189728, -1.698447, -1.569216, 0.5254902, 1, 0, 1,
-0.7144964, -0.6543859, -1.618041, 0.5176471, 1, 0, 1,
-0.7121928, 0.9223067, -1.124452, 0.5137255, 1, 0, 1,
-0.7116805, -2.116488, -3.507136, 0.5058824, 1, 0, 1,
-0.7090765, 0.138695, -1.398786, 0.5019608, 1, 0, 1,
-0.6991929, -0.5492583, -3.226366, 0.4941176, 1, 0, 1,
-0.6985577, -0.4147432, -1.789905, 0.4862745, 1, 0, 1,
-0.6984066, -0.2557269, -1.94181, 0.4823529, 1, 0, 1,
-0.697176, 1.613334, 0.419517, 0.4745098, 1, 0, 1,
-0.6961505, 0.03799021, -0.2276512, 0.4705882, 1, 0, 1,
-0.6926432, -0.3900728, 0.6164014, 0.4627451, 1, 0, 1,
-0.6880777, -0.9583133, -2.652261, 0.4588235, 1, 0, 1,
-0.6876041, -1.817605, -3.380535, 0.4509804, 1, 0, 1,
-0.687582, 0.4694821, -1.268914, 0.4470588, 1, 0, 1,
-0.6851286, -0.1294313, -2.173601, 0.4392157, 1, 0, 1,
-0.6803634, -0.07471547, -0.824045, 0.4352941, 1, 0, 1,
-0.6760124, 0.762537, -0.9581843, 0.427451, 1, 0, 1,
-0.6701077, 1.387393, 0.2600552, 0.4235294, 1, 0, 1,
-0.6617041, 0.2578126, -1.524045, 0.4156863, 1, 0, 1,
-0.6598479, 0.4344268, -1.7777, 0.4117647, 1, 0, 1,
-0.6539586, -1.212272, -2.671115, 0.4039216, 1, 0, 1,
-0.6523422, 1.309534, -2.405267, 0.3960784, 1, 0, 1,
-0.6508032, -1.006056, -3.230498, 0.3921569, 1, 0, 1,
-0.6476861, 0.7198941, -1.598561, 0.3843137, 1, 0, 1,
-0.6453314, -0.5377445, -3.13192, 0.3803922, 1, 0, 1,
-0.6433791, 0.6485018, -2.239827, 0.372549, 1, 0, 1,
-0.6399489, -0.3023223, -0.3426268, 0.3686275, 1, 0, 1,
-0.638066, 1.716913, 0.385455, 0.3607843, 1, 0, 1,
-0.6278577, 0.2382797, -2.423196, 0.3568628, 1, 0, 1,
-0.6237493, -0.2355946, -1.508088, 0.3490196, 1, 0, 1,
-0.6212527, 1.183756, 0.4491493, 0.345098, 1, 0, 1,
-0.6201952, -0.673535, -3.266238, 0.3372549, 1, 0, 1,
-0.6197087, 0.9226586, -0.2813879, 0.3333333, 1, 0, 1,
-0.6181588, -0.5947067, -2.830246, 0.3254902, 1, 0, 1,
-0.616577, 0.3487222, -0.1049582, 0.3215686, 1, 0, 1,
-0.6122131, -0.6279846, -3.011635, 0.3137255, 1, 0, 1,
-0.611229, 1.041727, -0.4675514, 0.3098039, 1, 0, 1,
-0.6073323, -1.394601, -4.074434, 0.3019608, 1, 0, 1,
-0.6070957, -0.02284322, -1.967169, 0.2941177, 1, 0, 1,
-0.5969787, -1.090796, -2.64325, 0.2901961, 1, 0, 1,
-0.5929331, -0.3472447, -2.58587, 0.282353, 1, 0, 1,
-0.5914967, 0.8917403, -1.577102, 0.2784314, 1, 0, 1,
-0.5910078, -0.8750611, 0.1736478, 0.2705882, 1, 0, 1,
-0.5886051, -0.4991566, -4.454744, 0.2666667, 1, 0, 1,
-0.5855358, 0.01482219, -0.7226769, 0.2588235, 1, 0, 1,
-0.5855104, 0.2028422, -1.80382, 0.254902, 1, 0, 1,
-0.5845734, 1.563337, 1.461722, 0.2470588, 1, 0, 1,
-0.5833948, -0.9495913, -2.454155, 0.2431373, 1, 0, 1,
-0.5821478, 0.9243029, -0.005239839, 0.2352941, 1, 0, 1,
-0.5810303, 1.773316, -1.402725, 0.2313726, 1, 0, 1,
-0.5787326, 1.615154, 0.8365791, 0.2235294, 1, 0, 1,
-0.5765299, -0.5849643, -3.060874, 0.2196078, 1, 0, 1,
-0.5722222, -0.3679347, -0.6222835, 0.2117647, 1, 0, 1,
-0.5703698, 1.260055, -1.707162, 0.2078431, 1, 0, 1,
-0.5695258, -0.6794422, -3.108738, 0.2, 1, 0, 1,
-0.5664765, -1.902721, -3.217995, 0.1921569, 1, 0, 1,
-0.5641078, 0.4590274, -1.283154, 0.1882353, 1, 0, 1,
-0.5558576, -0.07848224, -2.068161, 0.1803922, 1, 0, 1,
-0.547426, 0.5213249, -0.7295905, 0.1764706, 1, 0, 1,
-0.5421903, 0.5409842, -2.149944, 0.1686275, 1, 0, 1,
-0.542145, 0.3819661, -1.700238, 0.1647059, 1, 0, 1,
-0.5410997, 0.1010167, -1.599626, 0.1568628, 1, 0, 1,
-0.5361249, 1.512724, -1.532806, 0.1529412, 1, 0, 1,
-0.5347414, 1.081866, -0.7495643, 0.145098, 1, 0, 1,
-0.532288, 0.621918, -1.701462, 0.1411765, 1, 0, 1,
-0.5245459, -0.9583046, -2.739509, 0.1333333, 1, 0, 1,
-0.5157397, 1.061322, -1.338499, 0.1294118, 1, 0, 1,
-0.5152794, 1.85322, -1.910913, 0.1215686, 1, 0, 1,
-0.5096237, 0.0873927, -0.9412349, 0.1176471, 1, 0, 1,
-0.5054905, -1.185441, -1.641586, 0.1098039, 1, 0, 1,
-0.5017487, 0.3471892, -1.910733, 0.1058824, 1, 0, 1,
-0.4983459, -1.395448, -2.031919, 0.09803922, 1, 0, 1,
-0.4926865, 1.378149, 0.6542761, 0.09019608, 1, 0, 1,
-0.488695, 0.2113022, -0.03999862, 0.08627451, 1, 0, 1,
-0.4850473, -2.382712, -3.434726, 0.07843138, 1, 0, 1,
-0.4814343, -0.8451962, -2.961852, 0.07450981, 1, 0, 1,
-0.4806365, 0.7063668, -0.7899161, 0.06666667, 1, 0, 1,
-0.4774108, 0.6033662, -1.262954, 0.0627451, 1, 0, 1,
-0.4755217, -1.274515, -2.849845, 0.05490196, 1, 0, 1,
-0.4722565, -1.132922, -1.763813, 0.05098039, 1, 0, 1,
-0.4680495, -2.655549, -2.438476, 0.04313726, 1, 0, 1,
-0.4651262, 0.2828951, -1.456707, 0.03921569, 1, 0, 1,
-0.4644673, -1.25081, -0.9403555, 0.03137255, 1, 0, 1,
-0.4599277, -0.1898069, -0.995478, 0.02745098, 1, 0, 1,
-0.4591246, 0.4596196, 0.3993405, 0.01960784, 1, 0, 1,
-0.4578564, -1.02543, -2.620493, 0.01568628, 1, 0, 1,
-0.4528161, -0.3197625, -1.902426, 0.007843138, 1, 0, 1,
-0.4516837, 0.0612333, -1.861119, 0.003921569, 1, 0, 1,
-0.449212, 0.9123805, -0.9792299, 0, 1, 0.003921569, 1,
-0.4490427, 1.183311, -2.305119, 0, 1, 0.01176471, 1,
-0.4488958, -1.276944, -3.468323, 0, 1, 0.01568628, 1,
-0.4484946, 1.327467, 0.9117799, 0, 1, 0.02352941, 1,
-0.4478388, -1.650262, -3.876245, 0, 1, 0.02745098, 1,
-0.4463874, 0.5541667, 0.3062917, 0, 1, 0.03529412, 1,
-0.4450909, 0.1283772, -1.003795, 0, 1, 0.03921569, 1,
-0.4401692, -0.04305742, -1.776139, 0, 1, 0.04705882, 1,
-0.4385069, 1.318418, -1.914464, 0, 1, 0.05098039, 1,
-0.4317285, 1.258459, 2.358991, 0, 1, 0.05882353, 1,
-0.4269514, 1.311784, -0.0936743, 0, 1, 0.0627451, 1,
-0.42677, 1.184109, 0.6019518, 0, 1, 0.07058824, 1,
-0.4245243, -0.2836056, -2.568622, 0, 1, 0.07450981, 1,
-0.4207918, -1.104069, -4.44719, 0, 1, 0.08235294, 1,
-0.4170804, -0.1076968, -0.5293745, 0, 1, 0.08627451, 1,
-0.4150063, -1.127719, -2.231555, 0, 1, 0.09411765, 1,
-0.4090405, -0.3418486, -3.003039, 0, 1, 0.1019608, 1,
-0.4055659, -1.026845, -3.199174, 0, 1, 0.1058824, 1,
-0.401387, -0.514538, -1.654252, 0, 1, 0.1137255, 1,
-0.3983342, -0.788973, -1.974121, 0, 1, 0.1176471, 1,
-0.3927801, 0.5824978, -0.531662, 0, 1, 0.1254902, 1,
-0.3865469, 1.219817, 0.01438768, 0, 1, 0.1294118, 1,
-0.3859218, 0.7174132, 0.1754392, 0, 1, 0.1372549, 1,
-0.3799207, -1.732737, -3.658572, 0, 1, 0.1411765, 1,
-0.3787808, 0.2330835, -0.7351973, 0, 1, 0.1490196, 1,
-0.3786631, 2.20996, -0.6135601, 0, 1, 0.1529412, 1,
-0.3774957, 0.4367184, -1.05054, 0, 1, 0.1607843, 1,
-0.3758953, 1.086493, -0.7530193, 0, 1, 0.1647059, 1,
-0.3756803, 2.012317, -0.6223604, 0, 1, 0.172549, 1,
-0.3752853, -0.04237797, -1.986507, 0, 1, 0.1764706, 1,
-0.3681995, 1.122314, -0.4370939, 0, 1, 0.1843137, 1,
-0.3661585, 1.224295, 1.128269, 0, 1, 0.1882353, 1,
-0.3654999, -0.8594033, -2.900656, 0, 1, 0.1960784, 1,
-0.3624209, -1.040125, -3.477837, 0, 1, 0.2039216, 1,
-0.355936, 0.1811154, -2.664497, 0, 1, 0.2078431, 1,
-0.355577, 0.1756546, 0.2727666, 0, 1, 0.2156863, 1,
-0.3525801, 2.287282, -0.4629767, 0, 1, 0.2196078, 1,
-0.3443729, 0.1561226, -0.6344129, 0, 1, 0.227451, 1,
-0.3442929, 0.1619529, -0.9051516, 0, 1, 0.2313726, 1,
-0.3442801, 0.5837288, 0.104115, 0, 1, 0.2392157, 1,
-0.3413451, -2.787128, -1.807961, 0, 1, 0.2431373, 1,
-0.340381, 0.7957998, 0.1295037, 0, 1, 0.2509804, 1,
-0.337309, 0.5525202, -0.696479, 0, 1, 0.254902, 1,
-0.3367307, -0.1830673, -2.547856, 0, 1, 0.2627451, 1,
-0.3361854, 0.05533316, -2.134782, 0, 1, 0.2666667, 1,
-0.3348141, -1.42797, -3.27907, 0, 1, 0.2745098, 1,
-0.3344374, -1.245717, -3.138508, 0, 1, 0.2784314, 1,
-0.3308155, -2.486651, -3.346009, 0, 1, 0.2862745, 1,
-0.3292869, 1.861342, -0.6490904, 0, 1, 0.2901961, 1,
-0.3258001, 1.588737, 0.9257099, 0, 1, 0.2980392, 1,
-0.3207599, -0.2267188, -2.596683, 0, 1, 0.3058824, 1,
-0.3157663, 1.160036, 0.3417297, 0, 1, 0.3098039, 1,
-0.3144259, 1.008101, -0.5714551, 0, 1, 0.3176471, 1,
-0.3108643, -0.1875602, -2.567755, 0, 1, 0.3215686, 1,
-0.308045, 0.5785642, -0.0173761, 0, 1, 0.3294118, 1,
-0.3059519, -1.603305, -3.829378, 0, 1, 0.3333333, 1,
-0.3008634, -1.125347, -1.983211, 0, 1, 0.3411765, 1,
-0.2897868, -0.2816851, -3.919621, 0, 1, 0.345098, 1,
-0.2897647, 0.7478777, -0.3795227, 0, 1, 0.3529412, 1,
-0.283928, -1.052938, -4.72975, 0, 1, 0.3568628, 1,
-0.2831387, 0.5014893, -3.098012, 0, 1, 0.3647059, 1,
-0.2819617, 2.179531, -0.5142472, 0, 1, 0.3686275, 1,
-0.2814448, -0.4742289, -1.614654, 0, 1, 0.3764706, 1,
-0.2805043, 0.9384565, -0.4503316, 0, 1, 0.3803922, 1,
-0.2780768, -1.43389, -3.27697, 0, 1, 0.3882353, 1,
-0.2739701, -0.8301092, -2.792128, 0, 1, 0.3921569, 1,
-0.2707375, -2.234567, -1.906592, 0, 1, 0.4, 1,
-0.2703885, 0.03016428, -1.407336, 0, 1, 0.4078431, 1,
-0.2629427, 0.4150946, -0.8535777, 0, 1, 0.4117647, 1,
-0.257591, 2.121857, 0.2664884, 0, 1, 0.4196078, 1,
-0.255735, 1.033699, -0.1191258, 0, 1, 0.4235294, 1,
-0.2535441, 0.9555917, -0.124558, 0, 1, 0.4313726, 1,
-0.2498016, -0.1275327, -2.144895, 0, 1, 0.4352941, 1,
-0.2469755, -2.681592, -1.696338, 0, 1, 0.4431373, 1,
-0.2468255, 1.590403, -1.546974, 0, 1, 0.4470588, 1,
-0.2429521, -0.5576647, -2.609012, 0, 1, 0.454902, 1,
-0.2411633, -0.4478627, -1.72307, 0, 1, 0.4588235, 1,
-0.23808, -0.4761657, -3.041894, 0, 1, 0.4666667, 1,
-0.2358879, 0.0492467, -2.960598, 0, 1, 0.4705882, 1,
-0.2297605, -0.1411356, -2.797789, 0, 1, 0.4784314, 1,
-0.2248083, 1.242037, 0.5204512, 0, 1, 0.4823529, 1,
-0.2243715, 0.8277804, -1.354524, 0, 1, 0.4901961, 1,
-0.2158692, -0.3672212, -3.671755, 0, 1, 0.4941176, 1,
-0.2144, 0.3199616, -0.5486671, 0, 1, 0.5019608, 1,
-0.2105557, -0.307213, -3.01668, 0, 1, 0.509804, 1,
-0.2077933, 1.416656, -1.027104, 0, 1, 0.5137255, 1,
-0.2056413, -0.1135178, -2.944719, 0, 1, 0.5215687, 1,
-0.2050271, -0.5072508, -3.041049, 0, 1, 0.5254902, 1,
-0.2024348, -0.330049, -4.292296, 0, 1, 0.5333334, 1,
-0.1993735, 0.2208561, -1.30816, 0, 1, 0.5372549, 1,
-0.1974123, 0.8446733, -0.134328, 0, 1, 0.5450981, 1,
-0.196, 1.291653, 0.5831034, 0, 1, 0.5490196, 1,
-0.1920841, -0.06220676, -2.172782, 0, 1, 0.5568628, 1,
-0.1887449, 0.7796996, 0.1849507, 0, 1, 0.5607843, 1,
-0.1882578, 0.7407457, -1.365624, 0, 1, 0.5686275, 1,
-0.1764057, 0.916335, -0.2040256, 0, 1, 0.572549, 1,
-0.1737977, -1.071973, -1.109464, 0, 1, 0.5803922, 1,
-0.1714744, -0.5651208, -3.716376, 0, 1, 0.5843138, 1,
-0.1705297, 0.5393506, -1.059869, 0, 1, 0.5921569, 1,
-0.1680243, 0.9224785, 0.1767613, 0, 1, 0.5960785, 1,
-0.1678385, 0.06554529, -1.472474, 0, 1, 0.6039216, 1,
-0.1596305, -0.07218925, -2.716369, 0, 1, 0.6117647, 1,
-0.1576279, -0.5934355, -3.62415, 0, 1, 0.6156863, 1,
-0.1523419, -0.8165499, -4.540906, 0, 1, 0.6235294, 1,
-0.1495665, -0.8464946, -3.874718, 0, 1, 0.627451, 1,
-0.1469736, -0.03388561, -0.3430468, 0, 1, 0.6352941, 1,
-0.1452693, -1.563611, -2.850897, 0, 1, 0.6392157, 1,
-0.1436826, -0.8516962, -4.743898, 0, 1, 0.6470588, 1,
-0.137914, 0.2596744, 0.6851369, 0, 1, 0.6509804, 1,
-0.1347405, -1.890769, -3.585328, 0, 1, 0.6588235, 1,
-0.1284471, 0.1593711, 0.1020042, 0, 1, 0.6627451, 1,
-0.1282903, -0.8852926, -5.333542, 0, 1, 0.6705883, 1,
-0.1281648, -0.264876, -3.693894, 0, 1, 0.6745098, 1,
-0.1279835, 1.815911, -0.7006898, 0, 1, 0.682353, 1,
-0.1210555, 0.9692103, -0.7518134, 0, 1, 0.6862745, 1,
-0.1198104, -1.31188, -2.244048, 0, 1, 0.6941177, 1,
-0.1182771, -0.2882172, -2.470776, 0, 1, 0.7019608, 1,
-0.1120468, -0.3129922, -1.41018, 0, 1, 0.7058824, 1,
-0.1117967, 1.213315, -0.0556474, 0, 1, 0.7137255, 1,
-0.1077161, -1.229571, -2.410145, 0, 1, 0.7176471, 1,
-0.1055603, -0.9276586, -2.699623, 0, 1, 0.7254902, 1,
-0.104379, 0.3376237, 0.3252143, 0, 1, 0.7294118, 1,
-0.1035148, 0.7896389, 1.67868, 0, 1, 0.7372549, 1,
-0.101277, 0.1557909, 0.4241572, 0, 1, 0.7411765, 1,
-0.1010465, 1.69912, 0.8432891, 0, 1, 0.7490196, 1,
-0.1009392, -1.176727, -3.283294, 0, 1, 0.7529412, 1,
-0.09932636, 0.4413213, 1.275357, 0, 1, 0.7607843, 1,
-0.09714802, 0.5182071, 0.9314716, 0, 1, 0.7647059, 1,
-0.09495233, 0.1853626, -1.17756, 0, 1, 0.772549, 1,
-0.09493331, 0.9164429, -0.02931883, 0, 1, 0.7764706, 1,
-0.09008977, 1.471849, 0.2932802, 0, 1, 0.7843137, 1,
-0.08793157, 0.04324423, -0.8858054, 0, 1, 0.7882353, 1,
-0.0878801, -0.224209, -2.082718, 0, 1, 0.7960784, 1,
-0.07951682, -0.8122187, -3.205363, 0, 1, 0.8039216, 1,
-0.07830299, 1.722288, -0.3488258, 0, 1, 0.8078431, 1,
-0.07233407, -1.395246, -3.882357, 0, 1, 0.8156863, 1,
-0.06212359, -0.659547, -2.704415, 0, 1, 0.8196079, 1,
-0.06185508, -0.311316, -3.308193, 0, 1, 0.827451, 1,
-0.05956833, 0.5587167, -0.3418458, 0, 1, 0.8313726, 1,
-0.05241682, 0.8437454, 1.846153, 0, 1, 0.8392157, 1,
-0.05188005, 0.4288038, -0.7132591, 0, 1, 0.8431373, 1,
-0.04667343, 0.04571269, -0.9307088, 0, 1, 0.8509804, 1,
-0.04450317, -0.1421275, -3.758486, 0, 1, 0.854902, 1,
-0.04251398, 1.159086, -1.330931, 0, 1, 0.8627451, 1,
-0.03877603, -1.18706, -2.539831, 0, 1, 0.8666667, 1,
-0.03569099, 0.1046328, 0.6078184, 0, 1, 0.8745098, 1,
-0.03383645, 0.3248018, -0.8753982, 0, 1, 0.8784314, 1,
-0.03383245, 0.5255966, 0.1501495, 0, 1, 0.8862745, 1,
-0.03337646, 1.41569, 0.2236633, 0, 1, 0.8901961, 1,
-0.0330356, 1.697576, 0.04944257, 0, 1, 0.8980392, 1,
-0.03012215, -1.516733, -2.928401, 0, 1, 0.9058824, 1,
-0.02999623, 0.5455159, -1.707522, 0, 1, 0.9098039, 1,
-0.02860301, -0.4766011, -3.339143, 0, 1, 0.9176471, 1,
-0.02839105, 0.6026423, 0.3821477, 0, 1, 0.9215686, 1,
-0.02565753, 0.4732455, 0.3840826, 0, 1, 0.9294118, 1,
-0.02278217, -0.6027271, -2.106349, 0, 1, 0.9333333, 1,
-0.02233342, 0.5565789, 1.155989, 0, 1, 0.9411765, 1,
-0.02145345, -0.8346569, -2.801652, 0, 1, 0.945098, 1,
-0.01867366, 0.04908165, -1.122649, 0, 1, 0.9529412, 1,
-0.01797629, -0.08641439, -3.846153, 0, 1, 0.9568627, 1,
-0.01757175, 0.108065, -1.044908, 0, 1, 0.9647059, 1,
-0.0168807, 0.3964269, 0.3080158, 0, 1, 0.9686275, 1,
-0.01617042, 0.4691883, 0.2995614, 0, 1, 0.9764706, 1,
-0.01396352, 0.1982791, 0.1372908, 0, 1, 0.9803922, 1,
-0.01106704, -1.3448, -4.05691, 0, 1, 0.9882353, 1,
-0.007462731, 0.3587699, 2.283067, 0, 1, 0.9921569, 1,
-0.004930337, -0.7972009, -2.287394, 0, 1, 1, 1,
-0.003963965, -0.08817139, -4.459198, 0, 0.9921569, 1, 1,
-0.002023203, -0.4738408, -1.736823, 0, 0.9882353, 1, 1,
-0.0001694909, -2.378077, -5.8161, 0, 0.9803922, 1, 1,
0.002489184, 0.2801924, -0.5313321, 0, 0.9764706, 1, 1,
0.006724332, -0.1080153, 2.818542, 0, 0.9686275, 1, 1,
0.01919444, 0.239515, -1.104216, 0, 0.9647059, 1, 1,
0.03427923, -0.4564695, 4.048306, 0, 0.9568627, 1, 1,
0.03606524, 1.650949, 1.823387, 0, 0.9529412, 1, 1,
0.03732708, -1.357972, 5.182239, 0, 0.945098, 1, 1,
0.03802227, -0.01594757, 1.642255, 0, 0.9411765, 1, 1,
0.04858639, -0.5301448, 3.537624, 0, 0.9333333, 1, 1,
0.04859411, 0.2950379, 0.1285533, 0, 0.9294118, 1, 1,
0.05373181, -0.7283286, 3.176446, 0, 0.9215686, 1, 1,
0.05582457, -0.5239834, 3.094645, 0, 0.9176471, 1, 1,
0.05610409, -0.09547583, 2.046705, 0, 0.9098039, 1, 1,
0.06120865, -0.6367103, 3.373036, 0, 0.9058824, 1, 1,
0.062477, -0.1140625, 2.481235, 0, 0.8980392, 1, 1,
0.06685818, -1.876889, 2.009682, 0, 0.8901961, 1, 1,
0.06756821, -1.887656, 4.714674, 0, 0.8862745, 1, 1,
0.06978784, 0.6953787, 0.09193438, 0, 0.8784314, 1, 1,
0.0721588, -0.2349084, 1.409178, 0, 0.8745098, 1, 1,
0.07216629, -0.9994572, 4.307831, 0, 0.8666667, 1, 1,
0.076663, 0.6681377, -0.1168212, 0, 0.8627451, 1, 1,
0.08485821, -0.4002226, 3.344521, 0, 0.854902, 1, 1,
0.08636578, -0.9973288, 3.658657, 0, 0.8509804, 1, 1,
0.09062852, -0.3850967, 3.222349, 0, 0.8431373, 1, 1,
0.09358972, -0.876255, 2.550716, 0, 0.8392157, 1, 1,
0.09713241, 1.008089, 0.139827, 0, 0.8313726, 1, 1,
0.09785601, 0.8044538, 0.3124246, 0, 0.827451, 1, 1,
0.1011024, 2.163609, 0.07215907, 0, 0.8196079, 1, 1,
0.1118603, -0.4731208, 3.292103, 0, 0.8156863, 1, 1,
0.1131365, -1.305313, 3.098738, 0, 0.8078431, 1, 1,
0.1131999, 0.4360745, -0.3394881, 0, 0.8039216, 1, 1,
0.1144538, 0.4715895, -0.3794075, 0, 0.7960784, 1, 1,
0.1144666, -0.7601324, 0.5799013, 0, 0.7882353, 1, 1,
0.1164084, -0.08660866, 2.041165, 0, 0.7843137, 1, 1,
0.1171209, 0.9972417, -0.7998717, 0, 0.7764706, 1, 1,
0.1176758, -0.4474335, 2.920336, 0, 0.772549, 1, 1,
0.1196025, 0.6401249, 0.844862, 0, 0.7647059, 1, 1,
0.119874, 0.4503884, -0.1116362, 0, 0.7607843, 1, 1,
0.1209711, -1.856309, 1.032946, 0, 0.7529412, 1, 1,
0.124203, -0.1786054, 3.325648, 0, 0.7490196, 1, 1,
0.1247731, -0.4150112, 3.252123, 0, 0.7411765, 1, 1,
0.1259019, 1.010568, -1.407855, 0, 0.7372549, 1, 1,
0.1269832, -2.150212, 3.971426, 0, 0.7294118, 1, 1,
0.1284685, -1.577335, 3.930682, 0, 0.7254902, 1, 1,
0.1345358, 1.521647, -0.0500587, 0, 0.7176471, 1, 1,
0.1383825, 0.5295464, 0.4178928, 0, 0.7137255, 1, 1,
0.1423378, -0.09663339, 4.232073, 0, 0.7058824, 1, 1,
0.1426386, 1.372646, 0.1235973, 0, 0.6980392, 1, 1,
0.1468694, -0.7249998, 2.359609, 0, 0.6941177, 1, 1,
0.1474151, -0.07258243, 2.354362, 0, 0.6862745, 1, 1,
0.1492317, 2.123222, 0.3537108, 0, 0.682353, 1, 1,
0.1510283, 1.799592, 0.7993948, 0, 0.6745098, 1, 1,
0.1566262, -0.8527561, 3.219913, 0, 0.6705883, 1, 1,
0.1589411, -0.3605264, 2.334831, 0, 0.6627451, 1, 1,
0.161274, -0.4684435, 3.157754, 0, 0.6588235, 1, 1,
0.1619971, -1.138622, 1.408095, 0, 0.6509804, 1, 1,
0.1641428, 1.570488, 0.01880978, 0, 0.6470588, 1, 1,
0.1679076, -0.6317716, 2.901036, 0, 0.6392157, 1, 1,
0.168586, 0.2695657, 1.107687, 0, 0.6352941, 1, 1,
0.1714854, 0.8901539, -1.116595, 0, 0.627451, 1, 1,
0.174688, -0.8301983, 5.459454, 0, 0.6235294, 1, 1,
0.180619, 1.928112, 0.2621138, 0, 0.6156863, 1, 1,
0.1888857, 1.56552, -0.6731721, 0, 0.6117647, 1, 1,
0.19232, -0.5096657, 1.740799, 0, 0.6039216, 1, 1,
0.193061, 0.3490471, -1.106001, 0, 0.5960785, 1, 1,
0.1946634, -2.048608, 4.716287, 0, 0.5921569, 1, 1,
0.1960077, -0.5609837, 3.394907, 0, 0.5843138, 1, 1,
0.1973568, 1.844544, 1.96202, 0, 0.5803922, 1, 1,
0.1979, 0.1662239, 0.6542533, 0, 0.572549, 1, 1,
0.1988856, -0.1629798, 1.60283, 0, 0.5686275, 1, 1,
0.1996645, 0.03943029, 1.818891, 0, 0.5607843, 1, 1,
0.2006063, 2.489817, 0.008287475, 0, 0.5568628, 1, 1,
0.2024666, 0.9649925, -0.3447403, 0, 0.5490196, 1, 1,
0.2058899, -0.7846735, 3.695545, 0, 0.5450981, 1, 1,
0.2060038, -0.7238193, 3.415261, 0, 0.5372549, 1, 1,
0.2110059, -0.6659642, 4.196956, 0, 0.5333334, 1, 1,
0.2142315, -0.3721883, 3.150057, 0, 0.5254902, 1, 1,
0.215873, -0.5400169, 4.181552, 0, 0.5215687, 1, 1,
0.2180602, 2.570339, -0.5695376, 0, 0.5137255, 1, 1,
0.219556, 0.3330875, 0.0207149, 0, 0.509804, 1, 1,
0.2198743, -0.112243, 3.809095, 0, 0.5019608, 1, 1,
0.2210283, 2.253522, 0.838529, 0, 0.4941176, 1, 1,
0.2245892, -0.6333303, 2.862106, 0, 0.4901961, 1, 1,
0.2310291, -1.53785, 3.016837, 0, 0.4823529, 1, 1,
0.2324087, -1.412465, 3.553248, 0, 0.4784314, 1, 1,
0.2336909, -0.9927391, 2.326146, 0, 0.4705882, 1, 1,
0.2426518, -1.208217, 1.845013, 0, 0.4666667, 1, 1,
0.2433641, 0.4176548, 0.6185935, 0, 0.4588235, 1, 1,
0.2479536, -0.4989382, 1.798916, 0, 0.454902, 1, 1,
0.2486813, -1.443697, 3.568647, 0, 0.4470588, 1, 1,
0.2490942, 0.2697101, 0.02470985, 0, 0.4431373, 1, 1,
0.2540436, -0.6935689, 1.388253, 0, 0.4352941, 1, 1,
0.2562225, -0.4611644, 3.91337, 0, 0.4313726, 1, 1,
0.2581127, -0.8013071, 1.932741, 0, 0.4235294, 1, 1,
0.2585013, -0.9464792, 2.555008, 0, 0.4196078, 1, 1,
0.2597384, -0.7722288, 1.129695, 0, 0.4117647, 1, 1,
0.2599589, -0.5719231, 1.915888, 0, 0.4078431, 1, 1,
0.2600562, -0.2732419, 1.790033, 0, 0.4, 1, 1,
0.2616318, 1.049966, 2.024209, 0, 0.3921569, 1, 1,
0.2620474, 0.235538, -1.225625, 0, 0.3882353, 1, 1,
0.2646137, 2.016964, 0.8146659, 0, 0.3803922, 1, 1,
0.2673697, 0.2926343, 1.230682, 0, 0.3764706, 1, 1,
0.268671, 1.400857, -0.8762789, 0, 0.3686275, 1, 1,
0.2702146, 0.5520811, 1.15354, 0, 0.3647059, 1, 1,
0.2736425, -1.372862, 2.959179, 0, 0.3568628, 1, 1,
0.2818827, 1.637092, -1.388862, 0, 0.3529412, 1, 1,
0.2920312, 0.9661164, -0.5239762, 0, 0.345098, 1, 1,
0.2961609, 0.3992709, -0.8659606, 0, 0.3411765, 1, 1,
0.2971912, -1.508554, 3.556872, 0, 0.3333333, 1, 1,
0.302729, -1.464, 2.729929, 0, 0.3294118, 1, 1,
0.3051673, -0.293458, 1.245758, 0, 0.3215686, 1, 1,
0.3054151, 1.689682, 0.8946044, 0, 0.3176471, 1, 1,
0.3124429, 0.02283432, 2.657448, 0, 0.3098039, 1, 1,
0.3176718, 0.03215082, 1.322468, 0, 0.3058824, 1, 1,
0.3214656, -1.176774, 3.399124, 0, 0.2980392, 1, 1,
0.3220171, 0.4364113, 0.4824907, 0, 0.2901961, 1, 1,
0.3259069, 0.2040806, 0.6754591, 0, 0.2862745, 1, 1,
0.3260738, -0.6682005, 2.715874, 0, 0.2784314, 1, 1,
0.3268449, 0.1350193, 2.045819, 0, 0.2745098, 1, 1,
0.3293746, 0.6463823, 0.8092301, 0, 0.2666667, 1, 1,
0.3298528, -0.1173145, 2.463271, 0, 0.2627451, 1, 1,
0.3306016, 2.983766, -1.056689, 0, 0.254902, 1, 1,
0.3315082, -0.1843792, 1.630702, 0, 0.2509804, 1, 1,
0.3337938, 0.8641049, 0.9394234, 0, 0.2431373, 1, 1,
0.3383846, 0.5620315, 0.8951519, 0, 0.2392157, 1, 1,
0.3475879, 0.6543376, 0.9224044, 0, 0.2313726, 1, 1,
0.3510553, 0.0162021, 0.6899629, 0, 0.227451, 1, 1,
0.3591907, 0.06823187, 2.117762, 0, 0.2196078, 1, 1,
0.3635894, 0.5026892, -0.4603948, 0, 0.2156863, 1, 1,
0.3637955, 1.197294, 1.060107, 0, 0.2078431, 1, 1,
0.364521, 0.6399611, 1.408759, 0, 0.2039216, 1, 1,
0.3664021, 0.4969685, 0.4488469, 0, 0.1960784, 1, 1,
0.3731172, 1.090708, 0.8237512, 0, 0.1882353, 1, 1,
0.3750776, 1.265049, -1.034059, 0, 0.1843137, 1, 1,
0.3764442, -1.638506, 4.978919, 0, 0.1764706, 1, 1,
0.3765255, 1.685575, -0.9060023, 0, 0.172549, 1, 1,
0.3784093, 0.953554, 0.8622161, 0, 0.1647059, 1, 1,
0.3812658, 0.6370141, -0.06808995, 0, 0.1607843, 1, 1,
0.3823986, -1.192063, 3.829868, 0, 0.1529412, 1, 1,
0.3826007, 1.098701, 1.952526, 0, 0.1490196, 1, 1,
0.3860367, 1.31782, -1.479643, 0, 0.1411765, 1, 1,
0.3862371, 1.53418, 0.9529894, 0, 0.1372549, 1, 1,
0.3889625, 0.52811, 2.719956, 0, 0.1294118, 1, 1,
0.3920889, -1.031852, 2.057928, 0, 0.1254902, 1, 1,
0.3925017, 1.883464, -0.3103955, 0, 0.1176471, 1, 1,
0.3939733, -1.614231, 3.740594, 0, 0.1137255, 1, 1,
0.3972281, 0.4483966, 2.848981, 0, 0.1058824, 1, 1,
0.4027844, 1.373425, 0.4793273, 0, 0.09803922, 1, 1,
0.4029169, -0.1870591, 2.985665, 0, 0.09411765, 1, 1,
0.4060233, 0.09937385, 1.452317, 0, 0.08627451, 1, 1,
0.41275, 0.03827829, 0.5175797, 0, 0.08235294, 1, 1,
0.4130983, -0.1677345, 2.321631, 0, 0.07450981, 1, 1,
0.414113, -1.40451, 2.745754, 0, 0.07058824, 1, 1,
0.4150166, -0.8146231, 2.466819, 0, 0.0627451, 1, 1,
0.4155574, 1.057101, 1.634676, 0, 0.05882353, 1, 1,
0.4225052, -1.183026, 2.87454, 0, 0.05098039, 1, 1,
0.4263157, 1.528848, 1.099545, 0, 0.04705882, 1, 1,
0.4282236, 1.02333, 0.3734479, 0, 0.03921569, 1, 1,
0.4282739, -1.060845, 2.932946, 0, 0.03529412, 1, 1,
0.4300799, 0.1097627, 0.6615631, 0, 0.02745098, 1, 1,
0.4302332, 0.6991563, 0.915238, 0, 0.02352941, 1, 1,
0.4403063, 1.913462, 0.638409, 0, 0.01568628, 1, 1,
0.4427578, -1.391997, 3.247424, 0, 0.01176471, 1, 1,
0.4451867, -0.5838428, 3.873479, 0, 0.003921569, 1, 1,
0.4510096, 1.706853, -1.390595, 0.003921569, 0, 1, 1,
0.4554943, -0.02897868, 1.986949, 0.007843138, 0, 1, 1,
0.4560528, 0.7757755, 1.084477, 0.01568628, 0, 1, 1,
0.460488, -0.03545273, 2.9968, 0.01960784, 0, 1, 1,
0.4628083, 0.6895349, 0.2022456, 0.02745098, 0, 1, 1,
0.4635852, 0.3730343, 1.234484, 0.03137255, 0, 1, 1,
0.4686132, 2.094865, -0.104201, 0.03921569, 0, 1, 1,
0.4769725, -1.167646, 1.247486, 0.04313726, 0, 1, 1,
0.4774209, -1.39123, 3.984921, 0.05098039, 0, 1, 1,
0.4794274, -0.7209647, 1.843432, 0.05490196, 0, 1, 1,
0.4796436, -1.361126, 1.145119, 0.0627451, 0, 1, 1,
0.4810269, -0.5559446, 2.878023, 0.06666667, 0, 1, 1,
0.4814039, -1.079273, 2.924439, 0.07450981, 0, 1, 1,
0.4840862, 0.5068293, 1.697262, 0.07843138, 0, 1, 1,
0.4865042, 1.874919, 0.282191, 0.08627451, 0, 1, 1,
0.4867289, 0.5919811, 0.299566, 0.09019608, 0, 1, 1,
0.486913, 0.9622613, 1.461976, 0.09803922, 0, 1, 1,
0.4886414, -0.5933717, 2.249176, 0.1058824, 0, 1, 1,
0.4895372, 0.4046572, 0.544013, 0.1098039, 0, 1, 1,
0.4929655, -0.6524304, 2.31633, 0.1176471, 0, 1, 1,
0.4998157, -1.477867, 4.977559, 0.1215686, 0, 1, 1,
0.5053656, -1.600461, 2.640092, 0.1294118, 0, 1, 1,
0.5103344, -0.3840065, 1.368459, 0.1333333, 0, 1, 1,
0.5113467, -0.7717783, 2.913407, 0.1411765, 0, 1, 1,
0.5181219, -0.7016833, 1.019354, 0.145098, 0, 1, 1,
0.5184509, 1.595335, 1.002056, 0.1529412, 0, 1, 1,
0.5193461, 0.8706855, 0.8625014, 0.1568628, 0, 1, 1,
0.5229799, 0.3696212, 2.075286, 0.1647059, 0, 1, 1,
0.5263174, -1.534458, 3.646985, 0.1686275, 0, 1, 1,
0.5281361, -0.4266327, 0.9046192, 0.1764706, 0, 1, 1,
0.5283204, -1.361832, 2.858907, 0.1803922, 0, 1, 1,
0.5288818, 1.18145, 1.720166, 0.1882353, 0, 1, 1,
0.5349541, 0.1035383, 1.763035, 0.1921569, 0, 1, 1,
0.5362512, 0.05191592, 2.593346, 0.2, 0, 1, 1,
0.5396043, -0.5611089, 3.480155, 0.2078431, 0, 1, 1,
0.5401474, 0.02815143, 0.8315999, 0.2117647, 0, 1, 1,
0.5404245, -0.5041626, 2.324844, 0.2196078, 0, 1, 1,
0.5408556, 0.344738, 2.197339, 0.2235294, 0, 1, 1,
0.541631, 0.6089447, 1.754963, 0.2313726, 0, 1, 1,
0.542074, -0.1643294, 2.362116, 0.2352941, 0, 1, 1,
0.5426024, 0.9894738, 0.3310786, 0.2431373, 0, 1, 1,
0.5434374, 1.208071, 1.538649, 0.2470588, 0, 1, 1,
0.5475791, 1.249469, -0.2204926, 0.254902, 0, 1, 1,
0.5519462, 0.5225029, 2.135471, 0.2588235, 0, 1, 1,
0.5524744, 0.2395262, 1.840672, 0.2666667, 0, 1, 1,
0.5550009, -0.7120166, 2.594836, 0.2705882, 0, 1, 1,
0.559577, 1.165357, -0.2710648, 0.2784314, 0, 1, 1,
0.569881, -0.2571394, 2.407665, 0.282353, 0, 1, 1,
0.574478, 0.5602723, 1.481857, 0.2901961, 0, 1, 1,
0.5771388, 1.150915, 1.500461, 0.2941177, 0, 1, 1,
0.5824279, 0.8079469, 0.2295962, 0.3019608, 0, 1, 1,
0.5864809, 0.5158446, 2.057787, 0.3098039, 0, 1, 1,
0.5869147, -1.166963, 3.212255, 0.3137255, 0, 1, 1,
0.58747, -0.1940239, 2.246419, 0.3215686, 0, 1, 1,
0.5883299, 0.2852149, 2.38244, 0.3254902, 0, 1, 1,
0.5887, -0.3161506, 3.958177, 0.3333333, 0, 1, 1,
0.5917106, -0.449016, 3.319151, 0.3372549, 0, 1, 1,
0.5920947, -0.3320204, 2.077184, 0.345098, 0, 1, 1,
0.5929762, -0.373819, 0.9124637, 0.3490196, 0, 1, 1,
0.5951411, 0.2476844, 1.068199, 0.3568628, 0, 1, 1,
0.5961329, 2.028739, 0.3814493, 0.3607843, 0, 1, 1,
0.5986511, -0.3411283, 2.817939, 0.3686275, 0, 1, 1,
0.6032693, 0.3170166, 2.219094, 0.372549, 0, 1, 1,
0.6053608, 0.9880885, 0.8495645, 0.3803922, 0, 1, 1,
0.6136899, 0.948931, 1.702905, 0.3843137, 0, 1, 1,
0.6155499, -0.06063898, 2.0004, 0.3921569, 0, 1, 1,
0.6194879, 1.296965, 0.301962, 0.3960784, 0, 1, 1,
0.6215372, 0.3081906, 1.844535, 0.4039216, 0, 1, 1,
0.6282091, 0.09324118, 3.406145, 0.4117647, 0, 1, 1,
0.630027, -1.315113, 2.192946, 0.4156863, 0, 1, 1,
0.630828, 0.1941258, -0.07231587, 0.4235294, 0, 1, 1,
0.6331314, -1.778941, 3.265185, 0.427451, 0, 1, 1,
0.6446968, 1.375235, -0.9780006, 0.4352941, 0, 1, 1,
0.6452762, 0.7386262, -1.828856, 0.4392157, 0, 1, 1,
0.6491605, -0.3366128, 1.009904, 0.4470588, 0, 1, 1,
0.651944, -0.9035412, 3.123094, 0.4509804, 0, 1, 1,
0.652074, 0.8084976, -0.3103743, 0.4588235, 0, 1, 1,
0.6537524, -1.400639, 3.794161, 0.4627451, 0, 1, 1,
0.6539608, -0.7516068, 2.216832, 0.4705882, 0, 1, 1,
0.6600307, -0.6167021, 2.412045, 0.4745098, 0, 1, 1,
0.6641709, 0.07822531, 2.481634, 0.4823529, 0, 1, 1,
0.66458, -1.425987, 1.232627, 0.4862745, 0, 1, 1,
0.6667117, 1.410463, -0.7509354, 0.4941176, 0, 1, 1,
0.6673179, 0.0236358, 2.952314, 0.5019608, 0, 1, 1,
0.6674952, 1.370896, 1.117131, 0.5058824, 0, 1, 1,
0.6715924, 0.5301765, 0.6111512, 0.5137255, 0, 1, 1,
0.6724309, -0.8398356, 3.45443, 0.5176471, 0, 1, 1,
0.6750102, 1.685349, 1.972654, 0.5254902, 0, 1, 1,
0.6764224, -0.6919028, 2.456439, 0.5294118, 0, 1, 1,
0.6859038, 0.5599177, 3.728795, 0.5372549, 0, 1, 1,
0.6888449, -0.4570937, 1.44028, 0.5411765, 0, 1, 1,
0.7014269, 1.103712, -0.1312516, 0.5490196, 0, 1, 1,
0.7049124, 0.9235361, 1.524861, 0.5529412, 0, 1, 1,
0.7087994, -0.3373064, 1.629382, 0.5607843, 0, 1, 1,
0.7125651, -0.6365941, 3.095865, 0.5647059, 0, 1, 1,
0.7133617, 1.29525, 0.9819552, 0.572549, 0, 1, 1,
0.7145259, 1.574555, 0.8440657, 0.5764706, 0, 1, 1,
0.7187171, 0.1427755, 0.2367429, 0.5843138, 0, 1, 1,
0.7214566, 0.6805267, 0.7210905, 0.5882353, 0, 1, 1,
0.7278392, 0.664861, 2.218911, 0.5960785, 0, 1, 1,
0.7313008, -0.4307361, 3.353048, 0.6039216, 0, 1, 1,
0.7443608, 1.38396, 0.4463668, 0.6078432, 0, 1, 1,
0.7486961, -0.2776974, 0.6240662, 0.6156863, 0, 1, 1,
0.7493386, -0.07203549, 0.8738338, 0.6196079, 0, 1, 1,
0.7506181, -0.208191, 2.13823, 0.627451, 0, 1, 1,
0.756871, 0.5039561, 2.644266, 0.6313726, 0, 1, 1,
0.7573124, 0.1672944, 1.477327, 0.6392157, 0, 1, 1,
0.7595349, 1.205479, 1.775869, 0.6431373, 0, 1, 1,
0.7613431, -0.6685715, 1.942945, 0.6509804, 0, 1, 1,
0.7696929, -0.2546219, 1.96459, 0.654902, 0, 1, 1,
0.7720651, -0.6913128, 0.8039457, 0.6627451, 0, 1, 1,
0.7750339, -1.08938, 4.340092, 0.6666667, 0, 1, 1,
0.7888242, 0.2600054, 0.00682906, 0.6745098, 0, 1, 1,
0.7940083, 0.4050457, 1.354549, 0.6784314, 0, 1, 1,
0.7947364, 1.173329, 0.3606191, 0.6862745, 0, 1, 1,
0.7947854, -0.6861095, 3.045436, 0.6901961, 0, 1, 1,
0.8018243, -0.4571, 2.849068, 0.6980392, 0, 1, 1,
0.8032717, 0.07302596, 0.3923494, 0.7058824, 0, 1, 1,
0.8058661, -2.011102, 2.810683, 0.7098039, 0, 1, 1,
0.8062387, 0.09344567, 1.227825, 0.7176471, 0, 1, 1,
0.8087072, -1.969883, 2.898415, 0.7215686, 0, 1, 1,
0.8156283, 1.486363, -0.6603429, 0.7294118, 0, 1, 1,
0.8158422, 0.8696192, -0.0343413, 0.7333333, 0, 1, 1,
0.8190523, 0.1883727, 0.1226475, 0.7411765, 0, 1, 1,
0.8253331, -0.7289721, 1.428364, 0.7450981, 0, 1, 1,
0.8301137, -1.077183, 3.448636, 0.7529412, 0, 1, 1,
0.8316566, -0.5550687, 3.478717, 0.7568628, 0, 1, 1,
0.8363703, 0.3895659, 1.218868, 0.7647059, 0, 1, 1,
0.8414366, 1.144528, -1.395791, 0.7686275, 0, 1, 1,
0.8479781, -2.184951, 0.5464059, 0.7764706, 0, 1, 1,
0.8496761, -0.1250783, 2.770911, 0.7803922, 0, 1, 1,
0.8520572, 0.1974269, -0.3954012, 0.7882353, 0, 1, 1,
0.8524448, 0.1376326, 0.8347418, 0.7921569, 0, 1, 1,
0.8526684, 0.2336946, 1.397125, 0.8, 0, 1, 1,
0.8615852, 1.383779, -1.314006, 0.8078431, 0, 1, 1,
0.8657078, -0.5735695, 1.728838, 0.8117647, 0, 1, 1,
0.8689119, 0.4279031, 0.8707229, 0.8196079, 0, 1, 1,
0.8694203, -1.279719, 2.387838, 0.8235294, 0, 1, 1,
0.8751569, 0.02945762, 2.671569, 0.8313726, 0, 1, 1,
0.8791152, -0.141271, 4.326803, 0.8352941, 0, 1, 1,
0.8826547, 0.02671337, 0.09285482, 0.8431373, 0, 1, 1,
0.8828144, 1.694479, 0.4226022, 0.8470588, 0, 1, 1,
0.8900518, -1.794923, 1.741161, 0.854902, 0, 1, 1,
0.8962361, -0.8815479, 2.515458, 0.8588235, 0, 1, 1,
0.9072265, -0.04907426, 1.611626, 0.8666667, 0, 1, 1,
0.908051, 0.9646133, 0.7843779, 0.8705882, 0, 1, 1,
0.9184047, 2.391589, 0.0449266, 0.8784314, 0, 1, 1,
0.926599, -0.5448437, 2.192876, 0.8823529, 0, 1, 1,
0.9306554, -1.125295, 3.589691, 0.8901961, 0, 1, 1,
0.9350235, 1.758792, 0.7611864, 0.8941177, 0, 1, 1,
0.9357621, 0.6874242, 0.7279037, 0.9019608, 0, 1, 1,
0.9426106, -1.66782, 1.559799, 0.9098039, 0, 1, 1,
0.946151, 0.6474482, -0.02453358, 0.9137255, 0, 1, 1,
0.9493622, 0.2538252, 0.9600577, 0.9215686, 0, 1, 1,
0.9499376, 0.8166098, 1.332342, 0.9254902, 0, 1, 1,
0.9501923, 0.05727357, 2.398232, 0.9333333, 0, 1, 1,
0.9537929, 1.328105, 1.873156, 0.9372549, 0, 1, 1,
0.9548972, -2.156644, 1.569137, 0.945098, 0, 1, 1,
0.9564103, 1.060823, 1.409568, 0.9490196, 0, 1, 1,
0.9743143, -0.4142627, 1.247057, 0.9568627, 0, 1, 1,
0.9749609, -0.3100051, 1.04453, 0.9607843, 0, 1, 1,
0.9761978, 1.816807, 0.04176623, 0.9686275, 0, 1, 1,
0.9827294, 0.2288622, 2.06331, 0.972549, 0, 1, 1,
0.9840769, 0.4540919, 1.526567, 0.9803922, 0, 1, 1,
0.9964247, 0.7297173, 0.5281678, 0.9843137, 0, 1, 1,
1.003211, 0.5277128, 0.4921975, 0.9921569, 0, 1, 1,
1.013049, 1.43917, -0.6200801, 0.9960784, 0, 1, 1,
1.019137, -1.572706, 2.640304, 1, 0, 0.9960784, 1,
1.01964, 0.6090946, -0.5922081, 1, 0, 0.9882353, 1,
1.023084, -1.456057, 2.410059, 1, 0, 0.9843137, 1,
1.02671, -1.257385, 2.373698, 1, 0, 0.9764706, 1,
1.038931, -1.171553, 1.438792, 1, 0, 0.972549, 1,
1.043908, 0.1636979, 2.527109, 1, 0, 0.9647059, 1,
1.052615, -0.4763643, 0.7515049, 1, 0, 0.9607843, 1,
1.054669, -0.9804643, 2.761819, 1, 0, 0.9529412, 1,
1.056051, -0.791619, 1.098499, 1, 0, 0.9490196, 1,
1.057324, -2.001808, 2.362721, 1, 0, 0.9411765, 1,
1.063137, 0.1245007, 1.692994, 1, 0, 0.9372549, 1,
1.066772, 1.345975, 1.926122, 1, 0, 0.9294118, 1,
1.07005, 0.08025365, 2.759711, 1, 0, 0.9254902, 1,
1.077407, 0.961628, -1.499586, 1, 0, 0.9176471, 1,
1.082304, -0.6478348, 1.010792, 1, 0, 0.9137255, 1,
1.084013, -0.4285379, 2.688779, 1, 0, 0.9058824, 1,
1.085057, -1.285642, 2.798494, 1, 0, 0.9019608, 1,
1.085529, 0.8593216, 1.103248, 1, 0, 0.8941177, 1,
1.086924, -0.1083995, 2.587486, 1, 0, 0.8862745, 1,
1.092764, 1.377485, 1.728483, 1, 0, 0.8823529, 1,
1.093496, -1.110055, 3.149683, 1, 0, 0.8745098, 1,
1.095134, 1.512018, 1.268064, 1, 0, 0.8705882, 1,
1.102209, -0.4230337, 0.6396587, 1, 0, 0.8627451, 1,
1.106823, -0.3324229, 3.380843, 1, 0, 0.8588235, 1,
1.110938, -1.549241, 1.6317, 1, 0, 0.8509804, 1,
1.11652, -0.9470789, 2.824939, 1, 0, 0.8470588, 1,
1.123453, -1.756837, 1.026135, 1, 0, 0.8392157, 1,
1.124667, -0.7160672, 0.3970053, 1, 0, 0.8352941, 1,
1.124814, -1.288814, 2.375329, 1, 0, 0.827451, 1,
1.14196, 0.2420051, 1.550914, 1, 0, 0.8235294, 1,
1.143386, 0.7412282, -1.589119, 1, 0, 0.8156863, 1,
1.148074, 0.6988111, 1.259808, 1, 0, 0.8117647, 1,
1.150723, -0.3673905, 1.787014, 1, 0, 0.8039216, 1,
1.163887, -0.5991689, 3.783269, 1, 0, 0.7960784, 1,
1.183686, 0.3262829, -0.2347095, 1, 0, 0.7921569, 1,
1.186119, 0.7106575, 1.104525, 1, 0, 0.7843137, 1,
1.188335, 0.4195743, 1.853437, 1, 0, 0.7803922, 1,
1.190409, 1.248367, 1.620764, 1, 0, 0.772549, 1,
1.191211, 1.241463, -0.6267861, 1, 0, 0.7686275, 1,
1.196753, 1.114677, 1.221444, 1, 0, 0.7607843, 1,
1.198574, 2.048992, 1.518944, 1, 0, 0.7568628, 1,
1.207699, -0.08711766, 1.779888, 1, 0, 0.7490196, 1,
1.209689, -1.420217, 2.592441, 1, 0, 0.7450981, 1,
1.215649, -0.8181148, 3.794247, 1, 0, 0.7372549, 1,
1.217869, 0.9478654, 2.005429, 1, 0, 0.7333333, 1,
1.221454, 1.507349, 0.43299, 1, 0, 0.7254902, 1,
1.22173, 0.3322308, 1.930579, 1, 0, 0.7215686, 1,
1.222428, 1.22304, 0.2268043, 1, 0, 0.7137255, 1,
1.228115, -0.03908586, 1.866455, 1, 0, 0.7098039, 1,
1.232715, -0.8001547, 2.726536, 1, 0, 0.7019608, 1,
1.236479, -0.1417369, 2.836207, 1, 0, 0.6941177, 1,
1.238474, 0.7676933, 1.315607, 1, 0, 0.6901961, 1,
1.248434, 0.3926018, 2.835805, 1, 0, 0.682353, 1,
1.252083, -0.4584672, 1.941058, 1, 0, 0.6784314, 1,
1.252934, -1.625258, 1.789459, 1, 0, 0.6705883, 1,
1.25868, 0.5435935, 1.585033, 1, 0, 0.6666667, 1,
1.262194, 0.7839122, -0.3427626, 1, 0, 0.6588235, 1,
1.263534, -0.788256, 3.857153, 1, 0, 0.654902, 1,
1.263967, 2.109258, 1.814809, 1, 0, 0.6470588, 1,
1.265639, 0.8503934, 3.018008, 1, 0, 0.6431373, 1,
1.270032, 0.5242852, 1.869365, 1, 0, 0.6352941, 1,
1.27054, 0.06409819, 1.174805, 1, 0, 0.6313726, 1,
1.274143, 0.2184948, 2.357323, 1, 0, 0.6235294, 1,
1.275543, 1.131808, -0.1113055, 1, 0, 0.6196079, 1,
1.277935, 0.2405011, 0.2069276, 1, 0, 0.6117647, 1,
1.282692, 0.242072, 2.296762, 1, 0, 0.6078432, 1,
1.28507, 2.072683, -2.345093, 1, 0, 0.6, 1,
1.290057, 0.7842252, 2.835483, 1, 0, 0.5921569, 1,
1.294877, -1.112778, 1.895837, 1, 0, 0.5882353, 1,
1.304388, 0.0062688, 2.24657, 1, 0, 0.5803922, 1,
1.313083, 0.9257997, 2.503808, 1, 0, 0.5764706, 1,
1.315662, -1.000887, 3.692393, 1, 0, 0.5686275, 1,
1.323136, -0.1320733, 1.55624, 1, 0, 0.5647059, 1,
1.328795, -2.122132, 1.618143, 1, 0, 0.5568628, 1,
1.339862, 0.430837, 1.618152, 1, 0, 0.5529412, 1,
1.343644, 0.1444382, 0.4116336, 1, 0, 0.5450981, 1,
1.351623, -1.028352, 2.985249, 1, 0, 0.5411765, 1,
1.35433, -0.01816273, 1.578336, 1, 0, 0.5333334, 1,
1.362276, -0.5059029, 2.020378, 1, 0, 0.5294118, 1,
1.373949, -1.53948, 2.157501, 1, 0, 0.5215687, 1,
1.378089, 1.169149, 1.961645, 1, 0, 0.5176471, 1,
1.379475, 0.8127454, 0.6324632, 1, 0, 0.509804, 1,
1.383049, -1.104681, 1.674078, 1, 0, 0.5058824, 1,
1.397669, -1.493747, 1.886599, 1, 0, 0.4980392, 1,
1.399296, -0.8894961, 1.600694, 1, 0, 0.4901961, 1,
1.403096, 2.703034, -1.131268, 1, 0, 0.4862745, 1,
1.405545, -0.706129, 0.07508428, 1, 0, 0.4784314, 1,
1.411005, -0.09188577, 1.925017, 1, 0, 0.4745098, 1,
1.412402, 0.05948305, 3.02511, 1, 0, 0.4666667, 1,
1.427894, 0.5055268, 1.108624, 1, 0, 0.4627451, 1,
1.428685, -0.8133215, 1.49008, 1, 0, 0.454902, 1,
1.429117, -2.280251, 2.667249, 1, 0, 0.4509804, 1,
1.445676, 0.4731527, 1.390844, 1, 0, 0.4431373, 1,
1.450721, -0.4222876, 2.003475, 1, 0, 0.4392157, 1,
1.47627, 0.524938, 1.970704, 1, 0, 0.4313726, 1,
1.484263, 0.3473146, 1.694182, 1, 0, 0.427451, 1,
1.490819, -0.146922, 2.716001, 1, 0, 0.4196078, 1,
1.491101, 0.2753749, 2.186766, 1, 0, 0.4156863, 1,
1.516395, -1.467702, 2.656214, 1, 0, 0.4078431, 1,
1.517094, -0.8114762, 0.788361, 1, 0, 0.4039216, 1,
1.518136, -0.8690063, 0.761627, 1, 0, 0.3960784, 1,
1.533918, 0.6548716, 0.9422835, 1, 0, 0.3882353, 1,
1.554558, 0.3818451, 1.59743, 1, 0, 0.3843137, 1,
1.556049, -1.259812, 2.703318, 1, 0, 0.3764706, 1,
1.574465, 0.05032093, 1.622403, 1, 0, 0.372549, 1,
1.585901, 0.03524669, 2.456128, 1, 0, 0.3647059, 1,
1.616455, 0.5506426, 0.9432243, 1, 0, 0.3607843, 1,
1.61714, 0.3387207, 2.65825, 1, 0, 0.3529412, 1,
1.633059, -1.716966, 1.760105, 1, 0, 0.3490196, 1,
1.638827, -0.2710474, 1.780654, 1, 0, 0.3411765, 1,
1.639871, -1.330612, 2.652772, 1, 0, 0.3372549, 1,
1.655036, -0.02503232, 3.367496, 1, 0, 0.3294118, 1,
1.67164, -0.8790876, 2.799206, 1, 0, 0.3254902, 1,
1.699798, -0.7416486, 1.976134, 1, 0, 0.3176471, 1,
1.702337, -0.01950798, 4.039231, 1, 0, 0.3137255, 1,
1.706122, 2.62782, 0.2765017, 1, 0, 0.3058824, 1,
1.718253, -0.07755128, 1.159087, 1, 0, 0.2980392, 1,
1.721096, -0.4367343, 2.205709, 1, 0, 0.2941177, 1,
1.728039, -0.4715353, 0.6580569, 1, 0, 0.2862745, 1,
1.747786, 0.2299186, 1.452787, 1, 0, 0.282353, 1,
1.751674, 0.06047884, 1.671439, 1, 0, 0.2745098, 1,
1.752887, -1.6282, 1.601385, 1, 0, 0.2705882, 1,
1.757658, 1.124027, -0.6433076, 1, 0, 0.2627451, 1,
1.775912, -0.4731835, 0.3571475, 1, 0, 0.2588235, 1,
1.780175, -0.5703697, 0.8805175, 1, 0, 0.2509804, 1,
1.801051, 1.031337, 0.7393253, 1, 0, 0.2470588, 1,
1.811096, -1.262632, 1.61226, 1, 0, 0.2392157, 1,
1.813492, 0.6760507, 2.330956, 1, 0, 0.2352941, 1,
1.834265, -0.6662808, 1.909724, 1, 0, 0.227451, 1,
1.836342, -1.616162, 1.938324, 1, 0, 0.2235294, 1,
1.839519, -2.124671, 0.6133057, 1, 0, 0.2156863, 1,
1.879559, -0.8270302, 1.180187, 1, 0, 0.2117647, 1,
1.880857, -0.8979526, 0.9358335, 1, 0, 0.2039216, 1,
1.907291, 0.02246557, 1.5825, 1, 0, 0.1960784, 1,
1.908111, -1.993782, 4.200116, 1, 0, 0.1921569, 1,
1.98483, -0.9210946, 0.05384721, 1, 0, 0.1843137, 1,
2.007539, 0.6035093, 1.394184, 1, 0, 0.1803922, 1,
2.027875, -1.282507, 1.221576, 1, 0, 0.172549, 1,
2.038406, -0.4515199, 0.180211, 1, 0, 0.1686275, 1,
2.094883, -0.7922848, 1.124541, 1, 0, 0.1607843, 1,
2.119359, -0.03572024, 1.335918, 1, 0, 0.1568628, 1,
2.126842, -0.2374078, 1.360292, 1, 0, 0.1490196, 1,
2.130485, 0.9658884, 2.418638, 1, 0, 0.145098, 1,
2.160375, -0.3797647, 0.2720484, 1, 0, 0.1372549, 1,
2.19927, -0.7847708, 2.466861, 1, 0, 0.1333333, 1,
2.208511, -1.084252, 2.995124, 1, 0, 0.1254902, 1,
2.210103, -1.894866, 3.115753, 1, 0, 0.1215686, 1,
2.267509, -0.4551234, 2.091277, 1, 0, 0.1137255, 1,
2.273585, 1.59456, 2.682418, 1, 0, 0.1098039, 1,
2.282759, -0.09525905, 2.33061, 1, 0, 0.1019608, 1,
2.368912, -1.43737, 1.80647, 1, 0, 0.09411765, 1,
2.374869, 1.80151, 1.684912, 1, 0, 0.09019608, 1,
2.401202, 0.05795031, -0.9650953, 1, 0, 0.08235294, 1,
2.446919, 0.8182934, 0.3090954, 1, 0, 0.07843138, 1,
2.497673, 1.417366, 3.133805, 1, 0, 0.07058824, 1,
2.555926, -2.361342, 3.655669, 1, 0, 0.06666667, 1,
2.582287, 0.2455277, 0.9309583, 1, 0, 0.05882353, 1,
2.595744, 0.7007985, 2.704147, 1, 0, 0.05490196, 1,
2.624609, 2.044481, 1.086673, 1, 0, 0.04705882, 1,
2.643756, 0.1816138, 2.822482, 1, 0, 0.04313726, 1,
2.788051, 0.7197063, 0.7819333, 1, 0, 0.03529412, 1,
2.798028, 0.5152584, 1.623828, 1, 0, 0.03137255, 1,
2.818254, 0.8126603, 2.592945, 1, 0, 0.02352941, 1,
2.825726, 0.7904711, -0.2834853, 1, 0, 0.01960784, 1,
3.019022, 3.368112, -0.1116458, 1, 0, 0.01176471, 1,
3.09408, -0.9002925, 0.7060959, 1, 0, 0.007843138, 1
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
-0.1668533, -3.830441, -7.727306, 0, -0.5, 0.5, 0.5,
-0.1668533, -3.830441, -7.727306, 1, -0.5, 0.5, 0.5,
-0.1668533, -3.830441, -7.727306, 1, 1.5, 0.5, 0.5,
-0.1668533, -3.830441, -7.727306, 0, 1.5, 0.5, 0.5
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
-4.533243, 0.2904918, -7.727306, 0, -0.5, 0.5, 0.5,
-4.533243, 0.2904918, -7.727306, 1, -0.5, 0.5, 0.5,
-4.533243, 0.2904918, -7.727306, 1, 1.5, 0.5, 0.5,
-4.533243, 0.2904918, -7.727306, 0, 1.5, 0.5, 0.5
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
-4.533243, -3.830441, -0.178323, 0, -0.5, 0.5, 0.5,
-4.533243, -3.830441, -0.178323, 1, -0.5, 0.5, 0.5,
-4.533243, -3.830441, -0.178323, 1, 1.5, 0.5, 0.5,
-4.533243, -3.830441, -0.178323, 0, 1.5, 0.5, 0.5
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
-3, -2.879457, -5.985233,
3, -2.879457, -5.985233,
-3, -2.879457, -5.985233,
-3, -3.037954, -6.275578,
-2, -2.879457, -5.985233,
-2, -3.037954, -6.275578,
-1, -2.879457, -5.985233,
-1, -3.037954, -6.275578,
0, -2.879457, -5.985233,
0, -3.037954, -6.275578,
1, -2.879457, -5.985233,
1, -3.037954, -6.275578,
2, -2.879457, -5.985233,
2, -3.037954, -6.275578,
3, -2.879457, -5.985233,
3, -3.037954, -6.275578
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
-3, -3.354949, -6.856269, 0, -0.5, 0.5, 0.5,
-3, -3.354949, -6.856269, 1, -0.5, 0.5, 0.5,
-3, -3.354949, -6.856269, 1, 1.5, 0.5, 0.5,
-3, -3.354949, -6.856269, 0, 1.5, 0.5, 0.5,
-2, -3.354949, -6.856269, 0, -0.5, 0.5, 0.5,
-2, -3.354949, -6.856269, 1, -0.5, 0.5, 0.5,
-2, -3.354949, -6.856269, 1, 1.5, 0.5, 0.5,
-2, -3.354949, -6.856269, 0, 1.5, 0.5, 0.5,
-1, -3.354949, -6.856269, 0, -0.5, 0.5, 0.5,
-1, -3.354949, -6.856269, 1, -0.5, 0.5, 0.5,
-1, -3.354949, -6.856269, 1, 1.5, 0.5, 0.5,
-1, -3.354949, -6.856269, 0, 1.5, 0.5, 0.5,
0, -3.354949, -6.856269, 0, -0.5, 0.5, 0.5,
0, -3.354949, -6.856269, 1, -0.5, 0.5, 0.5,
0, -3.354949, -6.856269, 1, 1.5, 0.5, 0.5,
0, -3.354949, -6.856269, 0, 1.5, 0.5, 0.5,
1, -3.354949, -6.856269, 0, -0.5, 0.5, 0.5,
1, -3.354949, -6.856269, 1, -0.5, 0.5, 0.5,
1, -3.354949, -6.856269, 1, 1.5, 0.5, 0.5,
1, -3.354949, -6.856269, 0, 1.5, 0.5, 0.5,
2, -3.354949, -6.856269, 0, -0.5, 0.5, 0.5,
2, -3.354949, -6.856269, 1, -0.5, 0.5, 0.5,
2, -3.354949, -6.856269, 1, 1.5, 0.5, 0.5,
2, -3.354949, -6.856269, 0, 1.5, 0.5, 0.5,
3, -3.354949, -6.856269, 0, -0.5, 0.5, 0.5,
3, -3.354949, -6.856269, 1, -0.5, 0.5, 0.5,
3, -3.354949, -6.856269, 1, 1.5, 0.5, 0.5,
3, -3.354949, -6.856269, 0, 1.5, 0.5, 0.5
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
-3.525615, -2, -5.985233,
-3.525615, 3, -5.985233,
-3.525615, -2, -5.985233,
-3.693553, -2, -6.275578,
-3.525615, -1, -5.985233,
-3.693553, -1, -6.275578,
-3.525615, 0, -5.985233,
-3.693553, 0, -6.275578,
-3.525615, 1, -5.985233,
-3.693553, 1, -6.275578,
-3.525615, 2, -5.985233,
-3.693553, 2, -6.275578,
-3.525615, 3, -5.985233,
-3.693553, 3, -6.275578
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
-4.029429, -2, -6.856269, 0, -0.5, 0.5, 0.5,
-4.029429, -2, -6.856269, 1, -0.5, 0.5, 0.5,
-4.029429, -2, -6.856269, 1, 1.5, 0.5, 0.5,
-4.029429, -2, -6.856269, 0, 1.5, 0.5, 0.5,
-4.029429, -1, -6.856269, 0, -0.5, 0.5, 0.5,
-4.029429, -1, -6.856269, 1, -0.5, 0.5, 0.5,
-4.029429, -1, -6.856269, 1, 1.5, 0.5, 0.5,
-4.029429, -1, -6.856269, 0, 1.5, 0.5, 0.5,
-4.029429, 0, -6.856269, 0, -0.5, 0.5, 0.5,
-4.029429, 0, -6.856269, 1, -0.5, 0.5, 0.5,
-4.029429, 0, -6.856269, 1, 1.5, 0.5, 0.5,
-4.029429, 0, -6.856269, 0, 1.5, 0.5, 0.5,
-4.029429, 1, -6.856269, 0, -0.5, 0.5, 0.5,
-4.029429, 1, -6.856269, 1, -0.5, 0.5, 0.5,
-4.029429, 1, -6.856269, 1, 1.5, 0.5, 0.5,
-4.029429, 1, -6.856269, 0, 1.5, 0.5, 0.5,
-4.029429, 2, -6.856269, 0, -0.5, 0.5, 0.5,
-4.029429, 2, -6.856269, 1, -0.5, 0.5, 0.5,
-4.029429, 2, -6.856269, 1, 1.5, 0.5, 0.5,
-4.029429, 2, -6.856269, 0, 1.5, 0.5, 0.5,
-4.029429, 3, -6.856269, 0, -0.5, 0.5, 0.5,
-4.029429, 3, -6.856269, 1, -0.5, 0.5, 0.5,
-4.029429, 3, -6.856269, 1, 1.5, 0.5, 0.5,
-4.029429, 3, -6.856269, 0, 1.5, 0.5, 0.5
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
-3.525615, -2.879457, -4,
-3.525615, -2.879457, 4,
-3.525615, -2.879457, -4,
-3.693553, -3.037954, -4,
-3.525615, -2.879457, -2,
-3.693553, -3.037954, -2,
-3.525615, -2.879457, 0,
-3.693553, -3.037954, 0,
-3.525615, -2.879457, 2,
-3.693553, -3.037954, 2,
-3.525615, -2.879457, 4,
-3.693553, -3.037954, 4
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
-4.029429, -3.354949, -4, 0, -0.5, 0.5, 0.5,
-4.029429, -3.354949, -4, 1, -0.5, 0.5, 0.5,
-4.029429, -3.354949, -4, 1, 1.5, 0.5, 0.5,
-4.029429, -3.354949, -4, 0, 1.5, 0.5, 0.5,
-4.029429, -3.354949, -2, 0, -0.5, 0.5, 0.5,
-4.029429, -3.354949, -2, 1, -0.5, 0.5, 0.5,
-4.029429, -3.354949, -2, 1, 1.5, 0.5, 0.5,
-4.029429, -3.354949, -2, 0, 1.5, 0.5, 0.5,
-4.029429, -3.354949, 0, 0, -0.5, 0.5, 0.5,
-4.029429, -3.354949, 0, 1, -0.5, 0.5, 0.5,
-4.029429, -3.354949, 0, 1, 1.5, 0.5, 0.5,
-4.029429, -3.354949, 0, 0, 1.5, 0.5, 0.5,
-4.029429, -3.354949, 2, 0, -0.5, 0.5, 0.5,
-4.029429, -3.354949, 2, 1, -0.5, 0.5, 0.5,
-4.029429, -3.354949, 2, 1, 1.5, 0.5, 0.5,
-4.029429, -3.354949, 2, 0, 1.5, 0.5, 0.5,
-4.029429, -3.354949, 4, 0, -0.5, 0.5, 0.5,
-4.029429, -3.354949, 4, 1, -0.5, 0.5, 0.5,
-4.029429, -3.354949, 4, 1, 1.5, 0.5, 0.5,
-4.029429, -3.354949, 4, 0, 1.5, 0.5, 0.5
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
-3.525615, -2.879457, -5.985233,
-3.525615, 3.46044, -5.985233,
-3.525615, -2.879457, 5.628587,
-3.525615, 3.46044, 5.628587,
-3.525615, -2.879457, -5.985233,
-3.525615, -2.879457, 5.628587,
-3.525615, 3.46044, -5.985233,
-3.525615, 3.46044, 5.628587,
-3.525615, -2.879457, -5.985233,
3.191908, -2.879457, -5.985233,
-3.525615, -2.879457, 5.628587,
3.191908, -2.879457, 5.628587,
-3.525615, 3.46044, -5.985233,
3.191908, 3.46044, -5.985233,
-3.525615, 3.46044, 5.628587,
3.191908, 3.46044, 5.628587,
3.191908, -2.879457, -5.985233,
3.191908, 3.46044, -5.985233,
3.191908, -2.879457, 5.628587,
3.191908, 3.46044, 5.628587,
3.191908, -2.879457, -5.985233,
3.191908, -2.879457, 5.628587,
3.191908, 3.46044, -5.985233,
3.191908, 3.46044, 5.628587
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
var radius = 7.923815;
var distance = 35.25395;
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
mvMatrix.translate( 0.1668533, -0.2904918, 0.178323 );
mvMatrix.scale( 1.275378, 1.351344, 0.7376888 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.25395);
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
chloropropylate_1-me<-read.table("chloropropylate_1-me.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chloropropylate_1-me$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate_1' not found
```

```r
y<-chloropropylate_1-me$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate_1' not found
```

```r
z<-chloropropylate_1-me$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate_1' not found
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
-3.427787, 1.369784, -1.320788, 0, 0, 1, 1, 1,
-3.40894, -1.350122, -1.454194, 1, 0, 0, 1, 1,
-3.253466, 0.5070798, -1.109771, 1, 0, 0, 1, 1,
-2.951948, 1.311275, -1.587779, 1, 0, 0, 1, 1,
-2.856961, 0.0919562, -1.671713, 1, 0, 0, 1, 1,
-2.81316, 0.4587722, -0.7671852, 1, 0, 0, 1, 1,
-2.808515, -0.5584049, -2.617807, 0, 0, 0, 1, 1,
-2.749858, -1.163237, -2.052771, 0, 0, 0, 1, 1,
-2.736319, 1.64155, -0.5372616, 0, 0, 0, 1, 1,
-2.597144, 1.73014, -2.647289, 0, 0, 0, 1, 1,
-2.533518, 1.312205, -2.138294, 0, 0, 0, 1, 1,
-2.425669, -1.672309, -1.457435, 0, 0, 0, 1, 1,
-2.413876, 1.729318, -0.7050059, 0, 0, 0, 1, 1,
-2.397977, -0.4863663, -2.405499, 1, 1, 1, 1, 1,
-2.37624, -1.0381, -0.9534828, 1, 1, 1, 1, 1,
-2.32028, -0.7671852, -1.67748, 1, 1, 1, 1, 1,
-2.260841, 1.629172, -1.202414, 1, 1, 1, 1, 1,
-2.250136, 1.16262, -1.320747, 1, 1, 1, 1, 1,
-2.203819, 1.515173, -0.7598789, 1, 1, 1, 1, 1,
-2.203318, 0.3881153, -0.9662775, 1, 1, 1, 1, 1,
-2.165925, 0.3737417, -1.078512, 1, 1, 1, 1, 1,
-2.15251, -1.281456, -2.982275, 1, 1, 1, 1, 1,
-2.147679, 0.5327852, 0.07495799, 1, 1, 1, 1, 1,
-2.080471, 0.2971365, -2.039231, 1, 1, 1, 1, 1,
-2.042595, 0.7390205, -1.937474, 1, 1, 1, 1, 1,
-2.007765, 1.905924, -1.467615, 1, 1, 1, 1, 1,
-1.996056, -0.5027279, -1.493423, 1, 1, 1, 1, 1,
-1.980839, -0.3372797, -1.210985, 1, 1, 1, 1, 1,
-1.955881, -0.4305396, -2.982038, 0, 0, 1, 1, 1,
-1.9408, -1.918617, -3.932787, 1, 0, 0, 1, 1,
-1.935571, 0.3534468, -2.738567, 1, 0, 0, 1, 1,
-1.934981, -0.5570306, -1.711365, 1, 0, 0, 1, 1,
-1.923849, -0.5005718, -2.980613, 1, 0, 0, 1, 1,
-1.919015, 1.259292, -0.01443199, 1, 0, 0, 1, 1,
-1.85672, -0.9102967, 0.007207065, 0, 0, 0, 1, 1,
-1.855455, 1.176204, -0.6186568, 0, 0, 0, 1, 1,
-1.839962, -0.3752929, -2.501621, 0, 0, 0, 1, 1,
-1.83602, -1.456281, -3.666216, 0, 0, 0, 1, 1,
-1.827623, 1.016026, -2.020652, 0, 0, 0, 1, 1,
-1.826653, 1.187259, -0.240551, 0, 0, 0, 1, 1,
-1.821521, 1.441725, -1.21648, 0, 0, 0, 1, 1,
-1.807246, -1.875385, -3.696806, 1, 1, 1, 1, 1,
-1.797407, 0.0782275, -2.175368, 1, 1, 1, 1, 1,
-1.77541, 0.7899393, -2.082137, 1, 1, 1, 1, 1,
-1.767579, 1.048266, -1.720954, 1, 1, 1, 1, 1,
-1.756218, -1.330285, -4.912033, 1, 1, 1, 1, 1,
-1.747506, -0.9131566, -3.400139, 1, 1, 1, 1, 1,
-1.714996, 0.5129328, -0.4033861, 1, 1, 1, 1, 1,
-1.691822, 0.3096116, -2.762656, 1, 1, 1, 1, 1,
-1.688274, -0.9844712, -3.316259, 1, 1, 1, 1, 1,
-1.687403, -0.6683382, -1.395216, 1, 1, 1, 1, 1,
-1.672591, 1.583866, -2.678373, 1, 1, 1, 1, 1,
-1.64737, -1.125745, -2.439629, 1, 1, 1, 1, 1,
-1.641577, 0.06099711, -1.55339, 1, 1, 1, 1, 1,
-1.625923, 0.6841976, -1.541684, 1, 1, 1, 1, 1,
-1.614201, 0.427677, 1.240772, 1, 1, 1, 1, 1,
-1.610906, 0.3740863, -2.153858, 0, 0, 1, 1, 1,
-1.607836, 1.171901, 0.2152008, 1, 0, 0, 1, 1,
-1.606744, 1.176226, -1.007392, 1, 0, 0, 1, 1,
-1.559433, 1.435616, -2.166914, 1, 0, 0, 1, 1,
-1.557086, -1.17786, -1.154607, 1, 0, 0, 1, 1,
-1.545033, -0.3655329, -0.7383218, 1, 0, 0, 1, 1,
-1.544675, -1.057367, -2.476082, 0, 0, 0, 1, 1,
-1.544394, -0.302583, -2.782538, 0, 0, 0, 1, 1,
-1.532687, -0.3391245, -0.2806767, 0, 0, 0, 1, 1,
-1.524955, 1.380648, -1.009538, 0, 0, 0, 1, 1,
-1.522192, -0.06107973, -0.6860543, 0, 0, 0, 1, 1,
-1.505266, -0.3177789, -1.116772, 0, 0, 0, 1, 1,
-1.495585, 0.345102, -1.289347, 0, 0, 0, 1, 1,
-1.492135, -1.007455, -1.944961, 1, 1, 1, 1, 1,
-1.483644, -0.3148631, -2.690838, 1, 1, 1, 1, 1,
-1.480196, -0.2711769, -2.119438, 1, 1, 1, 1, 1,
-1.460772, 1.188952, 0.1683172, 1, 1, 1, 1, 1,
-1.460563, 0.2237108, -2.345384, 1, 1, 1, 1, 1,
-1.455761, -0.1412935, -2.706009, 1, 1, 1, 1, 1,
-1.433807, -0.4241903, -1.255161, 1, 1, 1, 1, 1,
-1.417411, 0.6885395, -0.9146565, 1, 1, 1, 1, 1,
-1.413813, -0.6309918, -1.316752, 1, 1, 1, 1, 1,
-1.406831, -1.715398, -3.067203, 1, 1, 1, 1, 1,
-1.404626, -0.2544277, -0.7330137, 1, 1, 1, 1, 1,
-1.400428, 1.089651, -0.5623427, 1, 1, 1, 1, 1,
-1.398669, -1.037242, -3.914206, 1, 1, 1, 1, 1,
-1.396163, 1.222025, -2.348869, 1, 1, 1, 1, 1,
-1.389733, 0.7391189, -1.607928, 1, 1, 1, 1, 1,
-1.384093, -0.620207, 0.03066819, 0, 0, 1, 1, 1,
-1.379986, 1.459563, -2.12432, 1, 0, 0, 1, 1,
-1.378386, -0.8339645, -1.233995, 1, 0, 0, 1, 1,
-1.378106, -0.4873487, -3.287436, 1, 0, 0, 1, 1,
-1.37643, -1.5328, -2.378227, 1, 0, 0, 1, 1,
-1.368579, -0.2497824, -2.53716, 1, 0, 0, 1, 1,
-1.361976, 0.3277892, -2.40852, 0, 0, 0, 1, 1,
-1.359574, -0.09662493, -1.438578, 0, 0, 0, 1, 1,
-1.357146, -0.6833308, -3.373741, 0, 0, 0, 1, 1,
-1.335768, -0.05722499, -1.336665, 0, 0, 0, 1, 1,
-1.319456, 0.9037821, -2.496813, 0, 0, 0, 1, 1,
-1.31886, 0.4375341, -1.439049, 0, 0, 0, 1, 1,
-1.318808, 0.361535, -1.011788, 0, 0, 0, 1, 1,
-1.296944, -0.8349898, -1.358588, 1, 1, 1, 1, 1,
-1.294925, 0.6303251, 0.8074895, 1, 1, 1, 1, 1,
-1.28814, -2.307233, -4.754511, 1, 1, 1, 1, 1,
-1.288027, 0.8821149, 0.6885885, 1, 1, 1, 1, 1,
-1.27493, -0.2213674, -1.242209, 1, 1, 1, 1, 1,
-1.272827, -1.063155, -2.115002, 1, 1, 1, 1, 1,
-1.269844, 1.077416, -2.035701, 1, 1, 1, 1, 1,
-1.263584, 0.8192606, -0.2774833, 1, 1, 1, 1, 1,
-1.248653, 0.1243335, -2.231972, 1, 1, 1, 1, 1,
-1.247779, -0.8260663, -2.895236, 1, 1, 1, 1, 1,
-1.244896, -0.7992357, -3.656827, 1, 1, 1, 1, 1,
-1.23213, 0.08189687, -0.303171, 1, 1, 1, 1, 1,
-1.228506, -2.013858, -2.675947, 1, 1, 1, 1, 1,
-1.226835, -0.7796022, -2.377243, 1, 1, 1, 1, 1,
-1.223441, 1.294751, -2.450704, 1, 1, 1, 1, 1,
-1.217629, 0.1459624, -0.6034526, 0, 0, 1, 1, 1,
-1.209724, -0.2095551, -2.037701, 1, 0, 0, 1, 1,
-1.207291, -1.142804, -2.028093, 1, 0, 0, 1, 1,
-1.204192, -0.5450795, -2.668216, 1, 0, 0, 1, 1,
-1.200189, 0.7449134, -1.623759, 1, 0, 0, 1, 1,
-1.200097, 0.573719, -1.401104, 1, 0, 0, 1, 1,
-1.199472, -0.1534801, -0.1878965, 0, 0, 0, 1, 1,
-1.198167, -0.2734531, -2.231645, 0, 0, 0, 1, 1,
-1.178578, -0.3770756, -1.070076, 0, 0, 0, 1, 1,
-1.17804, -1.22669, -1.436306, 0, 0, 0, 1, 1,
-1.172689, 0.8331175, -0.2667276, 0, 0, 0, 1, 1,
-1.159793, -0.5765309, -4.231103, 0, 0, 0, 1, 1,
-1.142694, -1.026319, -3.118907, 0, 0, 0, 1, 1,
-1.134068, -0.1049473, -3.21067, 1, 1, 1, 1, 1,
-1.131202, -0.2062028, -3.213027, 1, 1, 1, 1, 1,
-1.129877, -0.4188387, -1.02033, 1, 1, 1, 1, 1,
-1.117166, 0.8721176, 0.2016264, 1, 1, 1, 1, 1,
-1.115767, -0.3731034, -1.575259, 1, 1, 1, 1, 1,
-1.115057, -0.6944199, -4.240153, 1, 1, 1, 1, 1,
-1.113258, 0.5952776, 2.475192, 1, 1, 1, 1, 1,
-1.112481, -0.4056895, -1.49275, 1, 1, 1, 1, 1,
-1.107871, 2.232708, -1.356377, 1, 1, 1, 1, 1,
-1.107163, -0.6692492, -1.018247, 1, 1, 1, 1, 1,
-1.101931, -0.4664596, -3.030329, 1, 1, 1, 1, 1,
-1.098582, 0.06565105, -1.870973, 1, 1, 1, 1, 1,
-1.097263, -0.08516418, -3.106421, 1, 1, 1, 1, 1,
-1.096599, 0.8877787, -0.2437772, 1, 1, 1, 1, 1,
-1.095946, -0.3501099, -3.46125, 1, 1, 1, 1, 1,
-1.094008, -0.02058249, 0.2182796, 0, 0, 1, 1, 1,
-1.089836, 0.968364, -1.246251, 1, 0, 0, 1, 1,
-1.084305, -0.2071785, -2.480997, 1, 0, 0, 1, 1,
-1.078245, 1.467725, 0.02630024, 1, 0, 0, 1, 1,
-1.073048, -0.9078488, -2.087296, 1, 0, 0, 1, 1,
-1.0708, -0.5282609, -2.260665, 1, 0, 0, 1, 1,
-1.070485, -0.008322516, -2.339486, 0, 0, 0, 1, 1,
-1.067811, -0.8919478, -0.9800819, 0, 0, 0, 1, 1,
-1.063311, 0.2600492, -2.622069, 0, 0, 0, 1, 1,
-1.062254, 1.805454, -1.16147, 0, 0, 0, 1, 1,
-1.060171, -0.09769302, -2.457558, 0, 0, 0, 1, 1,
-1.059608, 1.289004, -0.9702178, 0, 0, 0, 1, 1,
-1.055118, -0.01271964, -2.734013, 0, 0, 0, 1, 1,
-1.034364, 0.2053416, -3.006206, 1, 1, 1, 1, 1,
-1.03066, 0.7748053, 0.3374529, 1, 1, 1, 1, 1,
-1.026287, -0.09101341, 0.1884534, 1, 1, 1, 1, 1,
-1.025929, 2.600585, 0.5182524, 1, 1, 1, 1, 1,
-1.022854, -1.440384, -3.456948, 1, 1, 1, 1, 1,
-1.018004, 1.373551, -0.9894305, 1, 1, 1, 1, 1,
-1.01243, -0.01809712, -1.44919, 1, 1, 1, 1, 1,
-1.002255, -1.263516, -2.777669, 1, 1, 1, 1, 1,
-1.001901, -2.695169, -2.648314, 1, 1, 1, 1, 1,
-1.001839, -0.7721214, -1.8343, 1, 1, 1, 1, 1,
-0.9967907, -1.314706, -1.717323, 1, 1, 1, 1, 1,
-0.9891894, -1.588675, -1.783243, 1, 1, 1, 1, 1,
-0.9866292, -2.227335, -1.830557, 1, 1, 1, 1, 1,
-0.9842202, 0.1828073, -0.4912489, 1, 1, 1, 1, 1,
-0.9821843, 0.2208935, 0.2386392, 1, 1, 1, 1, 1,
-0.9820261, 0.3370112, -1.368162, 0, 0, 1, 1, 1,
-0.9795449, -0.05041074, -0.5743872, 1, 0, 0, 1, 1,
-0.9741017, 0.0141508, -0.8743191, 1, 0, 0, 1, 1,
-0.9732185, -0.5316183, -3.343733, 1, 0, 0, 1, 1,
-0.965651, -0.3598414, -0.6473348, 1, 0, 0, 1, 1,
-0.9645481, -0.1047635, -3.540558, 1, 0, 0, 1, 1,
-0.9643002, 0.7480423, -1.488857, 0, 0, 0, 1, 1,
-0.9636879, 1.042874, 0.3989022, 0, 0, 0, 1, 1,
-0.9629894, -0.4599515, -0.2752182, 0, 0, 0, 1, 1,
-0.9604369, 0.1285131, -0.7704116, 0, 0, 0, 1, 1,
-0.9597346, -0.4709744, -3.48035, 0, 0, 0, 1, 1,
-0.9575306, -0.4728896, -1.67464, 0, 0, 0, 1, 1,
-0.9545696, -0.7878734, -2.884934, 0, 0, 0, 1, 1,
-0.9496127, 1.095739, -1.149744, 1, 1, 1, 1, 1,
-0.9495156, 2.196212, -1.198169, 1, 1, 1, 1, 1,
-0.9435862, 0.3673632, -1.290186, 1, 1, 1, 1, 1,
-0.9390672, 0.8832459, -1.20384, 1, 1, 1, 1, 1,
-0.9217079, -0.1869881, -1.009621, 1, 1, 1, 1, 1,
-0.9177929, 2.060747, -0.9914781, 1, 1, 1, 1, 1,
-0.9165123, 0.9972755, -0.1313855, 1, 1, 1, 1, 1,
-0.9065693, 0.4495993, -1.270011, 1, 1, 1, 1, 1,
-0.9045221, -1.940069, -0.6644904, 1, 1, 1, 1, 1,
-0.9017949, 1.166926, -1.367538, 1, 1, 1, 1, 1,
-0.8947245, -0.2697787, -1.931277, 1, 1, 1, 1, 1,
-0.888661, 0.4340195, -1.881616, 1, 1, 1, 1, 1,
-0.8838875, -1.2672, -1.237242, 1, 1, 1, 1, 1,
-0.8837325, -0.3436247, -1.835297, 1, 1, 1, 1, 1,
-0.8801422, 0.8042559, -1.725822, 1, 1, 1, 1, 1,
-0.8769304, -0.6851598, -0.7614785, 0, 0, 1, 1, 1,
-0.8766503, -0.1452081, -3.083928, 1, 0, 0, 1, 1,
-0.8763139, 0.9285634, -0.3679568, 1, 0, 0, 1, 1,
-0.8760725, 1.360149, -0.4182326, 1, 0, 0, 1, 1,
-0.8741536, 1.451968, -1.781274, 1, 0, 0, 1, 1,
-0.8647385, 0.2762589, -0.2316903, 1, 0, 0, 1, 1,
-0.8639536, -1.019691, -3.330599, 0, 0, 0, 1, 1,
-0.8621165, 0.3305569, -2.187918, 0, 0, 0, 1, 1,
-0.8603474, -1.086873, -4.169461, 0, 0, 0, 1, 1,
-0.8569351, 2.179595, -0.7887977, 0, 0, 0, 1, 1,
-0.8556527, -0.0616966, -1.540206, 0, 0, 0, 1, 1,
-0.8485489, -0.9288968, -1.71851, 0, 0, 0, 1, 1,
-0.8454279, 0.2524968, -0.6237942, 0, 0, 0, 1, 1,
-0.8448828, 0.4442492, -1.979002, 1, 1, 1, 1, 1,
-0.8392024, -0.6828309, -1.217304, 1, 1, 1, 1, 1,
-0.838223, -1.13934, -0.8658469, 1, 1, 1, 1, 1,
-0.8334052, 0.6349887, -0.2084462, 1, 1, 1, 1, 1,
-0.8316919, -1.940387, -2.622101, 1, 1, 1, 1, 1,
-0.8314669, 0.5307052, -1.92118, 1, 1, 1, 1, 1,
-0.8310755, 0.1855864, -0.7987047, 1, 1, 1, 1, 1,
-0.8290101, 1.396514, -2.127943, 1, 1, 1, 1, 1,
-0.8265114, 1.172096, -0.7274012, 1, 1, 1, 1, 1,
-0.8219357, -0.08092379, -2.093932, 1, 1, 1, 1, 1,
-0.8170447, -1.585462, -1.637512, 1, 1, 1, 1, 1,
-0.8118454, -0.6060714, -2.421743, 1, 1, 1, 1, 1,
-0.8107235, 0.1666441, 0.3672217, 1, 1, 1, 1, 1,
-0.8064331, 3.342489, 1.325855, 1, 1, 1, 1, 1,
-0.8036169, 1.110999, -0.6555815, 1, 1, 1, 1, 1,
-0.8036137, 0.4571691, -1.943965, 0, 0, 1, 1, 1,
-0.7969837, 1.306527, -0.2772647, 1, 0, 0, 1, 1,
-0.7961096, -1.955875, -1.931159, 1, 0, 0, 1, 1,
-0.7882789, -1.146603, -2.870794, 1, 0, 0, 1, 1,
-0.7876852, 0.1507439, -2.020552, 1, 0, 0, 1, 1,
-0.7848824, 1.068653, -0.5469769, 1, 0, 0, 1, 1,
-0.7846822, 1.331701, 0.2454941, 0, 0, 0, 1, 1,
-0.7801132, 0.02869152, -2.670205, 0, 0, 0, 1, 1,
-0.7697123, 1.406666, 0.1297232, 0, 0, 0, 1, 1,
-0.7677881, 0.9320498, -0.6676295, 0, 0, 0, 1, 1,
-0.7662082, 1.05973, -1.949685, 0, 0, 0, 1, 1,
-0.7611684, 2.063662, 0.3162792, 0, 0, 0, 1, 1,
-0.7566358, 0.9464698, -1.058333, 0, 0, 0, 1, 1,
-0.7565948, 1.17442, -1.766576, 1, 1, 1, 1, 1,
-0.7546705, -1.235111, -3.036213, 1, 1, 1, 1, 1,
-0.7459933, -0.8530502, -4.16824, 1, 1, 1, 1, 1,
-0.7446489, 0.9487848, 0.7556278, 1, 1, 1, 1, 1,
-0.7431389, -1.709206, -2.183489, 1, 1, 1, 1, 1,
-0.7315911, 0.06324504, -1.930864, 1, 1, 1, 1, 1,
-0.7315542, 0.1079338, -0.6797795, 1, 1, 1, 1, 1,
-0.7262903, 1.24764, -0.4849377, 1, 1, 1, 1, 1,
-0.7192864, 1.330571, -0.776427, 1, 1, 1, 1, 1,
-0.7189728, -1.698447, -1.569216, 1, 1, 1, 1, 1,
-0.7144964, -0.6543859, -1.618041, 1, 1, 1, 1, 1,
-0.7121928, 0.9223067, -1.124452, 1, 1, 1, 1, 1,
-0.7116805, -2.116488, -3.507136, 1, 1, 1, 1, 1,
-0.7090765, 0.138695, -1.398786, 1, 1, 1, 1, 1,
-0.6991929, -0.5492583, -3.226366, 1, 1, 1, 1, 1,
-0.6985577, -0.4147432, -1.789905, 0, 0, 1, 1, 1,
-0.6984066, -0.2557269, -1.94181, 1, 0, 0, 1, 1,
-0.697176, 1.613334, 0.419517, 1, 0, 0, 1, 1,
-0.6961505, 0.03799021, -0.2276512, 1, 0, 0, 1, 1,
-0.6926432, -0.3900728, 0.6164014, 1, 0, 0, 1, 1,
-0.6880777, -0.9583133, -2.652261, 1, 0, 0, 1, 1,
-0.6876041, -1.817605, -3.380535, 0, 0, 0, 1, 1,
-0.687582, 0.4694821, -1.268914, 0, 0, 0, 1, 1,
-0.6851286, -0.1294313, -2.173601, 0, 0, 0, 1, 1,
-0.6803634, -0.07471547, -0.824045, 0, 0, 0, 1, 1,
-0.6760124, 0.762537, -0.9581843, 0, 0, 0, 1, 1,
-0.6701077, 1.387393, 0.2600552, 0, 0, 0, 1, 1,
-0.6617041, 0.2578126, -1.524045, 0, 0, 0, 1, 1,
-0.6598479, 0.4344268, -1.7777, 1, 1, 1, 1, 1,
-0.6539586, -1.212272, -2.671115, 1, 1, 1, 1, 1,
-0.6523422, 1.309534, -2.405267, 1, 1, 1, 1, 1,
-0.6508032, -1.006056, -3.230498, 1, 1, 1, 1, 1,
-0.6476861, 0.7198941, -1.598561, 1, 1, 1, 1, 1,
-0.6453314, -0.5377445, -3.13192, 1, 1, 1, 1, 1,
-0.6433791, 0.6485018, -2.239827, 1, 1, 1, 1, 1,
-0.6399489, -0.3023223, -0.3426268, 1, 1, 1, 1, 1,
-0.638066, 1.716913, 0.385455, 1, 1, 1, 1, 1,
-0.6278577, 0.2382797, -2.423196, 1, 1, 1, 1, 1,
-0.6237493, -0.2355946, -1.508088, 1, 1, 1, 1, 1,
-0.6212527, 1.183756, 0.4491493, 1, 1, 1, 1, 1,
-0.6201952, -0.673535, -3.266238, 1, 1, 1, 1, 1,
-0.6197087, 0.9226586, -0.2813879, 1, 1, 1, 1, 1,
-0.6181588, -0.5947067, -2.830246, 1, 1, 1, 1, 1,
-0.616577, 0.3487222, -0.1049582, 0, 0, 1, 1, 1,
-0.6122131, -0.6279846, -3.011635, 1, 0, 0, 1, 1,
-0.611229, 1.041727, -0.4675514, 1, 0, 0, 1, 1,
-0.6073323, -1.394601, -4.074434, 1, 0, 0, 1, 1,
-0.6070957, -0.02284322, -1.967169, 1, 0, 0, 1, 1,
-0.5969787, -1.090796, -2.64325, 1, 0, 0, 1, 1,
-0.5929331, -0.3472447, -2.58587, 0, 0, 0, 1, 1,
-0.5914967, 0.8917403, -1.577102, 0, 0, 0, 1, 1,
-0.5910078, -0.8750611, 0.1736478, 0, 0, 0, 1, 1,
-0.5886051, -0.4991566, -4.454744, 0, 0, 0, 1, 1,
-0.5855358, 0.01482219, -0.7226769, 0, 0, 0, 1, 1,
-0.5855104, 0.2028422, -1.80382, 0, 0, 0, 1, 1,
-0.5845734, 1.563337, 1.461722, 0, 0, 0, 1, 1,
-0.5833948, -0.9495913, -2.454155, 1, 1, 1, 1, 1,
-0.5821478, 0.9243029, -0.005239839, 1, 1, 1, 1, 1,
-0.5810303, 1.773316, -1.402725, 1, 1, 1, 1, 1,
-0.5787326, 1.615154, 0.8365791, 1, 1, 1, 1, 1,
-0.5765299, -0.5849643, -3.060874, 1, 1, 1, 1, 1,
-0.5722222, -0.3679347, -0.6222835, 1, 1, 1, 1, 1,
-0.5703698, 1.260055, -1.707162, 1, 1, 1, 1, 1,
-0.5695258, -0.6794422, -3.108738, 1, 1, 1, 1, 1,
-0.5664765, -1.902721, -3.217995, 1, 1, 1, 1, 1,
-0.5641078, 0.4590274, -1.283154, 1, 1, 1, 1, 1,
-0.5558576, -0.07848224, -2.068161, 1, 1, 1, 1, 1,
-0.547426, 0.5213249, -0.7295905, 1, 1, 1, 1, 1,
-0.5421903, 0.5409842, -2.149944, 1, 1, 1, 1, 1,
-0.542145, 0.3819661, -1.700238, 1, 1, 1, 1, 1,
-0.5410997, 0.1010167, -1.599626, 1, 1, 1, 1, 1,
-0.5361249, 1.512724, -1.532806, 0, 0, 1, 1, 1,
-0.5347414, 1.081866, -0.7495643, 1, 0, 0, 1, 1,
-0.532288, 0.621918, -1.701462, 1, 0, 0, 1, 1,
-0.5245459, -0.9583046, -2.739509, 1, 0, 0, 1, 1,
-0.5157397, 1.061322, -1.338499, 1, 0, 0, 1, 1,
-0.5152794, 1.85322, -1.910913, 1, 0, 0, 1, 1,
-0.5096237, 0.0873927, -0.9412349, 0, 0, 0, 1, 1,
-0.5054905, -1.185441, -1.641586, 0, 0, 0, 1, 1,
-0.5017487, 0.3471892, -1.910733, 0, 0, 0, 1, 1,
-0.4983459, -1.395448, -2.031919, 0, 0, 0, 1, 1,
-0.4926865, 1.378149, 0.6542761, 0, 0, 0, 1, 1,
-0.488695, 0.2113022, -0.03999862, 0, 0, 0, 1, 1,
-0.4850473, -2.382712, -3.434726, 0, 0, 0, 1, 1,
-0.4814343, -0.8451962, -2.961852, 1, 1, 1, 1, 1,
-0.4806365, 0.7063668, -0.7899161, 1, 1, 1, 1, 1,
-0.4774108, 0.6033662, -1.262954, 1, 1, 1, 1, 1,
-0.4755217, -1.274515, -2.849845, 1, 1, 1, 1, 1,
-0.4722565, -1.132922, -1.763813, 1, 1, 1, 1, 1,
-0.4680495, -2.655549, -2.438476, 1, 1, 1, 1, 1,
-0.4651262, 0.2828951, -1.456707, 1, 1, 1, 1, 1,
-0.4644673, -1.25081, -0.9403555, 1, 1, 1, 1, 1,
-0.4599277, -0.1898069, -0.995478, 1, 1, 1, 1, 1,
-0.4591246, 0.4596196, 0.3993405, 1, 1, 1, 1, 1,
-0.4578564, -1.02543, -2.620493, 1, 1, 1, 1, 1,
-0.4528161, -0.3197625, -1.902426, 1, 1, 1, 1, 1,
-0.4516837, 0.0612333, -1.861119, 1, 1, 1, 1, 1,
-0.449212, 0.9123805, -0.9792299, 1, 1, 1, 1, 1,
-0.4490427, 1.183311, -2.305119, 1, 1, 1, 1, 1,
-0.4488958, -1.276944, -3.468323, 0, 0, 1, 1, 1,
-0.4484946, 1.327467, 0.9117799, 1, 0, 0, 1, 1,
-0.4478388, -1.650262, -3.876245, 1, 0, 0, 1, 1,
-0.4463874, 0.5541667, 0.3062917, 1, 0, 0, 1, 1,
-0.4450909, 0.1283772, -1.003795, 1, 0, 0, 1, 1,
-0.4401692, -0.04305742, -1.776139, 1, 0, 0, 1, 1,
-0.4385069, 1.318418, -1.914464, 0, 0, 0, 1, 1,
-0.4317285, 1.258459, 2.358991, 0, 0, 0, 1, 1,
-0.4269514, 1.311784, -0.0936743, 0, 0, 0, 1, 1,
-0.42677, 1.184109, 0.6019518, 0, 0, 0, 1, 1,
-0.4245243, -0.2836056, -2.568622, 0, 0, 0, 1, 1,
-0.4207918, -1.104069, -4.44719, 0, 0, 0, 1, 1,
-0.4170804, -0.1076968, -0.5293745, 0, 0, 0, 1, 1,
-0.4150063, -1.127719, -2.231555, 1, 1, 1, 1, 1,
-0.4090405, -0.3418486, -3.003039, 1, 1, 1, 1, 1,
-0.4055659, -1.026845, -3.199174, 1, 1, 1, 1, 1,
-0.401387, -0.514538, -1.654252, 1, 1, 1, 1, 1,
-0.3983342, -0.788973, -1.974121, 1, 1, 1, 1, 1,
-0.3927801, 0.5824978, -0.531662, 1, 1, 1, 1, 1,
-0.3865469, 1.219817, 0.01438768, 1, 1, 1, 1, 1,
-0.3859218, 0.7174132, 0.1754392, 1, 1, 1, 1, 1,
-0.3799207, -1.732737, -3.658572, 1, 1, 1, 1, 1,
-0.3787808, 0.2330835, -0.7351973, 1, 1, 1, 1, 1,
-0.3786631, 2.20996, -0.6135601, 1, 1, 1, 1, 1,
-0.3774957, 0.4367184, -1.05054, 1, 1, 1, 1, 1,
-0.3758953, 1.086493, -0.7530193, 1, 1, 1, 1, 1,
-0.3756803, 2.012317, -0.6223604, 1, 1, 1, 1, 1,
-0.3752853, -0.04237797, -1.986507, 1, 1, 1, 1, 1,
-0.3681995, 1.122314, -0.4370939, 0, 0, 1, 1, 1,
-0.3661585, 1.224295, 1.128269, 1, 0, 0, 1, 1,
-0.3654999, -0.8594033, -2.900656, 1, 0, 0, 1, 1,
-0.3624209, -1.040125, -3.477837, 1, 0, 0, 1, 1,
-0.355936, 0.1811154, -2.664497, 1, 0, 0, 1, 1,
-0.355577, 0.1756546, 0.2727666, 1, 0, 0, 1, 1,
-0.3525801, 2.287282, -0.4629767, 0, 0, 0, 1, 1,
-0.3443729, 0.1561226, -0.6344129, 0, 0, 0, 1, 1,
-0.3442929, 0.1619529, -0.9051516, 0, 0, 0, 1, 1,
-0.3442801, 0.5837288, 0.104115, 0, 0, 0, 1, 1,
-0.3413451, -2.787128, -1.807961, 0, 0, 0, 1, 1,
-0.340381, 0.7957998, 0.1295037, 0, 0, 0, 1, 1,
-0.337309, 0.5525202, -0.696479, 0, 0, 0, 1, 1,
-0.3367307, -0.1830673, -2.547856, 1, 1, 1, 1, 1,
-0.3361854, 0.05533316, -2.134782, 1, 1, 1, 1, 1,
-0.3348141, -1.42797, -3.27907, 1, 1, 1, 1, 1,
-0.3344374, -1.245717, -3.138508, 1, 1, 1, 1, 1,
-0.3308155, -2.486651, -3.346009, 1, 1, 1, 1, 1,
-0.3292869, 1.861342, -0.6490904, 1, 1, 1, 1, 1,
-0.3258001, 1.588737, 0.9257099, 1, 1, 1, 1, 1,
-0.3207599, -0.2267188, -2.596683, 1, 1, 1, 1, 1,
-0.3157663, 1.160036, 0.3417297, 1, 1, 1, 1, 1,
-0.3144259, 1.008101, -0.5714551, 1, 1, 1, 1, 1,
-0.3108643, -0.1875602, -2.567755, 1, 1, 1, 1, 1,
-0.308045, 0.5785642, -0.0173761, 1, 1, 1, 1, 1,
-0.3059519, -1.603305, -3.829378, 1, 1, 1, 1, 1,
-0.3008634, -1.125347, -1.983211, 1, 1, 1, 1, 1,
-0.2897868, -0.2816851, -3.919621, 1, 1, 1, 1, 1,
-0.2897647, 0.7478777, -0.3795227, 0, 0, 1, 1, 1,
-0.283928, -1.052938, -4.72975, 1, 0, 0, 1, 1,
-0.2831387, 0.5014893, -3.098012, 1, 0, 0, 1, 1,
-0.2819617, 2.179531, -0.5142472, 1, 0, 0, 1, 1,
-0.2814448, -0.4742289, -1.614654, 1, 0, 0, 1, 1,
-0.2805043, 0.9384565, -0.4503316, 1, 0, 0, 1, 1,
-0.2780768, -1.43389, -3.27697, 0, 0, 0, 1, 1,
-0.2739701, -0.8301092, -2.792128, 0, 0, 0, 1, 1,
-0.2707375, -2.234567, -1.906592, 0, 0, 0, 1, 1,
-0.2703885, 0.03016428, -1.407336, 0, 0, 0, 1, 1,
-0.2629427, 0.4150946, -0.8535777, 0, 0, 0, 1, 1,
-0.257591, 2.121857, 0.2664884, 0, 0, 0, 1, 1,
-0.255735, 1.033699, -0.1191258, 0, 0, 0, 1, 1,
-0.2535441, 0.9555917, -0.124558, 1, 1, 1, 1, 1,
-0.2498016, -0.1275327, -2.144895, 1, 1, 1, 1, 1,
-0.2469755, -2.681592, -1.696338, 1, 1, 1, 1, 1,
-0.2468255, 1.590403, -1.546974, 1, 1, 1, 1, 1,
-0.2429521, -0.5576647, -2.609012, 1, 1, 1, 1, 1,
-0.2411633, -0.4478627, -1.72307, 1, 1, 1, 1, 1,
-0.23808, -0.4761657, -3.041894, 1, 1, 1, 1, 1,
-0.2358879, 0.0492467, -2.960598, 1, 1, 1, 1, 1,
-0.2297605, -0.1411356, -2.797789, 1, 1, 1, 1, 1,
-0.2248083, 1.242037, 0.5204512, 1, 1, 1, 1, 1,
-0.2243715, 0.8277804, -1.354524, 1, 1, 1, 1, 1,
-0.2158692, -0.3672212, -3.671755, 1, 1, 1, 1, 1,
-0.2144, 0.3199616, -0.5486671, 1, 1, 1, 1, 1,
-0.2105557, -0.307213, -3.01668, 1, 1, 1, 1, 1,
-0.2077933, 1.416656, -1.027104, 1, 1, 1, 1, 1,
-0.2056413, -0.1135178, -2.944719, 0, 0, 1, 1, 1,
-0.2050271, -0.5072508, -3.041049, 1, 0, 0, 1, 1,
-0.2024348, -0.330049, -4.292296, 1, 0, 0, 1, 1,
-0.1993735, 0.2208561, -1.30816, 1, 0, 0, 1, 1,
-0.1974123, 0.8446733, -0.134328, 1, 0, 0, 1, 1,
-0.196, 1.291653, 0.5831034, 1, 0, 0, 1, 1,
-0.1920841, -0.06220676, -2.172782, 0, 0, 0, 1, 1,
-0.1887449, 0.7796996, 0.1849507, 0, 0, 0, 1, 1,
-0.1882578, 0.7407457, -1.365624, 0, 0, 0, 1, 1,
-0.1764057, 0.916335, -0.2040256, 0, 0, 0, 1, 1,
-0.1737977, -1.071973, -1.109464, 0, 0, 0, 1, 1,
-0.1714744, -0.5651208, -3.716376, 0, 0, 0, 1, 1,
-0.1705297, 0.5393506, -1.059869, 0, 0, 0, 1, 1,
-0.1680243, 0.9224785, 0.1767613, 1, 1, 1, 1, 1,
-0.1678385, 0.06554529, -1.472474, 1, 1, 1, 1, 1,
-0.1596305, -0.07218925, -2.716369, 1, 1, 1, 1, 1,
-0.1576279, -0.5934355, -3.62415, 1, 1, 1, 1, 1,
-0.1523419, -0.8165499, -4.540906, 1, 1, 1, 1, 1,
-0.1495665, -0.8464946, -3.874718, 1, 1, 1, 1, 1,
-0.1469736, -0.03388561, -0.3430468, 1, 1, 1, 1, 1,
-0.1452693, -1.563611, -2.850897, 1, 1, 1, 1, 1,
-0.1436826, -0.8516962, -4.743898, 1, 1, 1, 1, 1,
-0.137914, 0.2596744, 0.6851369, 1, 1, 1, 1, 1,
-0.1347405, -1.890769, -3.585328, 1, 1, 1, 1, 1,
-0.1284471, 0.1593711, 0.1020042, 1, 1, 1, 1, 1,
-0.1282903, -0.8852926, -5.333542, 1, 1, 1, 1, 1,
-0.1281648, -0.264876, -3.693894, 1, 1, 1, 1, 1,
-0.1279835, 1.815911, -0.7006898, 1, 1, 1, 1, 1,
-0.1210555, 0.9692103, -0.7518134, 0, 0, 1, 1, 1,
-0.1198104, -1.31188, -2.244048, 1, 0, 0, 1, 1,
-0.1182771, -0.2882172, -2.470776, 1, 0, 0, 1, 1,
-0.1120468, -0.3129922, -1.41018, 1, 0, 0, 1, 1,
-0.1117967, 1.213315, -0.0556474, 1, 0, 0, 1, 1,
-0.1077161, -1.229571, -2.410145, 1, 0, 0, 1, 1,
-0.1055603, -0.9276586, -2.699623, 0, 0, 0, 1, 1,
-0.104379, 0.3376237, 0.3252143, 0, 0, 0, 1, 1,
-0.1035148, 0.7896389, 1.67868, 0, 0, 0, 1, 1,
-0.101277, 0.1557909, 0.4241572, 0, 0, 0, 1, 1,
-0.1010465, 1.69912, 0.8432891, 0, 0, 0, 1, 1,
-0.1009392, -1.176727, -3.283294, 0, 0, 0, 1, 1,
-0.09932636, 0.4413213, 1.275357, 0, 0, 0, 1, 1,
-0.09714802, 0.5182071, 0.9314716, 1, 1, 1, 1, 1,
-0.09495233, 0.1853626, -1.17756, 1, 1, 1, 1, 1,
-0.09493331, 0.9164429, -0.02931883, 1, 1, 1, 1, 1,
-0.09008977, 1.471849, 0.2932802, 1, 1, 1, 1, 1,
-0.08793157, 0.04324423, -0.8858054, 1, 1, 1, 1, 1,
-0.0878801, -0.224209, -2.082718, 1, 1, 1, 1, 1,
-0.07951682, -0.8122187, -3.205363, 1, 1, 1, 1, 1,
-0.07830299, 1.722288, -0.3488258, 1, 1, 1, 1, 1,
-0.07233407, -1.395246, -3.882357, 1, 1, 1, 1, 1,
-0.06212359, -0.659547, -2.704415, 1, 1, 1, 1, 1,
-0.06185508, -0.311316, -3.308193, 1, 1, 1, 1, 1,
-0.05956833, 0.5587167, -0.3418458, 1, 1, 1, 1, 1,
-0.05241682, 0.8437454, 1.846153, 1, 1, 1, 1, 1,
-0.05188005, 0.4288038, -0.7132591, 1, 1, 1, 1, 1,
-0.04667343, 0.04571269, -0.9307088, 1, 1, 1, 1, 1,
-0.04450317, -0.1421275, -3.758486, 0, 0, 1, 1, 1,
-0.04251398, 1.159086, -1.330931, 1, 0, 0, 1, 1,
-0.03877603, -1.18706, -2.539831, 1, 0, 0, 1, 1,
-0.03569099, 0.1046328, 0.6078184, 1, 0, 0, 1, 1,
-0.03383645, 0.3248018, -0.8753982, 1, 0, 0, 1, 1,
-0.03383245, 0.5255966, 0.1501495, 1, 0, 0, 1, 1,
-0.03337646, 1.41569, 0.2236633, 0, 0, 0, 1, 1,
-0.0330356, 1.697576, 0.04944257, 0, 0, 0, 1, 1,
-0.03012215, -1.516733, -2.928401, 0, 0, 0, 1, 1,
-0.02999623, 0.5455159, -1.707522, 0, 0, 0, 1, 1,
-0.02860301, -0.4766011, -3.339143, 0, 0, 0, 1, 1,
-0.02839105, 0.6026423, 0.3821477, 0, 0, 0, 1, 1,
-0.02565753, 0.4732455, 0.3840826, 0, 0, 0, 1, 1,
-0.02278217, -0.6027271, -2.106349, 1, 1, 1, 1, 1,
-0.02233342, 0.5565789, 1.155989, 1, 1, 1, 1, 1,
-0.02145345, -0.8346569, -2.801652, 1, 1, 1, 1, 1,
-0.01867366, 0.04908165, -1.122649, 1, 1, 1, 1, 1,
-0.01797629, -0.08641439, -3.846153, 1, 1, 1, 1, 1,
-0.01757175, 0.108065, -1.044908, 1, 1, 1, 1, 1,
-0.0168807, 0.3964269, 0.3080158, 1, 1, 1, 1, 1,
-0.01617042, 0.4691883, 0.2995614, 1, 1, 1, 1, 1,
-0.01396352, 0.1982791, 0.1372908, 1, 1, 1, 1, 1,
-0.01106704, -1.3448, -4.05691, 1, 1, 1, 1, 1,
-0.007462731, 0.3587699, 2.283067, 1, 1, 1, 1, 1,
-0.004930337, -0.7972009, -2.287394, 1, 1, 1, 1, 1,
-0.003963965, -0.08817139, -4.459198, 1, 1, 1, 1, 1,
-0.002023203, -0.4738408, -1.736823, 1, 1, 1, 1, 1,
-0.0001694909, -2.378077, -5.8161, 1, 1, 1, 1, 1,
0.002489184, 0.2801924, -0.5313321, 0, 0, 1, 1, 1,
0.006724332, -0.1080153, 2.818542, 1, 0, 0, 1, 1,
0.01919444, 0.239515, -1.104216, 1, 0, 0, 1, 1,
0.03427923, -0.4564695, 4.048306, 1, 0, 0, 1, 1,
0.03606524, 1.650949, 1.823387, 1, 0, 0, 1, 1,
0.03732708, -1.357972, 5.182239, 1, 0, 0, 1, 1,
0.03802227, -0.01594757, 1.642255, 0, 0, 0, 1, 1,
0.04858639, -0.5301448, 3.537624, 0, 0, 0, 1, 1,
0.04859411, 0.2950379, 0.1285533, 0, 0, 0, 1, 1,
0.05373181, -0.7283286, 3.176446, 0, 0, 0, 1, 1,
0.05582457, -0.5239834, 3.094645, 0, 0, 0, 1, 1,
0.05610409, -0.09547583, 2.046705, 0, 0, 0, 1, 1,
0.06120865, -0.6367103, 3.373036, 0, 0, 0, 1, 1,
0.062477, -0.1140625, 2.481235, 1, 1, 1, 1, 1,
0.06685818, -1.876889, 2.009682, 1, 1, 1, 1, 1,
0.06756821, -1.887656, 4.714674, 1, 1, 1, 1, 1,
0.06978784, 0.6953787, 0.09193438, 1, 1, 1, 1, 1,
0.0721588, -0.2349084, 1.409178, 1, 1, 1, 1, 1,
0.07216629, -0.9994572, 4.307831, 1, 1, 1, 1, 1,
0.076663, 0.6681377, -0.1168212, 1, 1, 1, 1, 1,
0.08485821, -0.4002226, 3.344521, 1, 1, 1, 1, 1,
0.08636578, -0.9973288, 3.658657, 1, 1, 1, 1, 1,
0.09062852, -0.3850967, 3.222349, 1, 1, 1, 1, 1,
0.09358972, -0.876255, 2.550716, 1, 1, 1, 1, 1,
0.09713241, 1.008089, 0.139827, 1, 1, 1, 1, 1,
0.09785601, 0.8044538, 0.3124246, 1, 1, 1, 1, 1,
0.1011024, 2.163609, 0.07215907, 1, 1, 1, 1, 1,
0.1118603, -0.4731208, 3.292103, 1, 1, 1, 1, 1,
0.1131365, -1.305313, 3.098738, 0, 0, 1, 1, 1,
0.1131999, 0.4360745, -0.3394881, 1, 0, 0, 1, 1,
0.1144538, 0.4715895, -0.3794075, 1, 0, 0, 1, 1,
0.1144666, -0.7601324, 0.5799013, 1, 0, 0, 1, 1,
0.1164084, -0.08660866, 2.041165, 1, 0, 0, 1, 1,
0.1171209, 0.9972417, -0.7998717, 1, 0, 0, 1, 1,
0.1176758, -0.4474335, 2.920336, 0, 0, 0, 1, 1,
0.1196025, 0.6401249, 0.844862, 0, 0, 0, 1, 1,
0.119874, 0.4503884, -0.1116362, 0, 0, 0, 1, 1,
0.1209711, -1.856309, 1.032946, 0, 0, 0, 1, 1,
0.124203, -0.1786054, 3.325648, 0, 0, 0, 1, 1,
0.1247731, -0.4150112, 3.252123, 0, 0, 0, 1, 1,
0.1259019, 1.010568, -1.407855, 0, 0, 0, 1, 1,
0.1269832, -2.150212, 3.971426, 1, 1, 1, 1, 1,
0.1284685, -1.577335, 3.930682, 1, 1, 1, 1, 1,
0.1345358, 1.521647, -0.0500587, 1, 1, 1, 1, 1,
0.1383825, 0.5295464, 0.4178928, 1, 1, 1, 1, 1,
0.1423378, -0.09663339, 4.232073, 1, 1, 1, 1, 1,
0.1426386, 1.372646, 0.1235973, 1, 1, 1, 1, 1,
0.1468694, -0.7249998, 2.359609, 1, 1, 1, 1, 1,
0.1474151, -0.07258243, 2.354362, 1, 1, 1, 1, 1,
0.1492317, 2.123222, 0.3537108, 1, 1, 1, 1, 1,
0.1510283, 1.799592, 0.7993948, 1, 1, 1, 1, 1,
0.1566262, -0.8527561, 3.219913, 1, 1, 1, 1, 1,
0.1589411, -0.3605264, 2.334831, 1, 1, 1, 1, 1,
0.161274, -0.4684435, 3.157754, 1, 1, 1, 1, 1,
0.1619971, -1.138622, 1.408095, 1, 1, 1, 1, 1,
0.1641428, 1.570488, 0.01880978, 1, 1, 1, 1, 1,
0.1679076, -0.6317716, 2.901036, 0, 0, 1, 1, 1,
0.168586, 0.2695657, 1.107687, 1, 0, 0, 1, 1,
0.1714854, 0.8901539, -1.116595, 1, 0, 0, 1, 1,
0.174688, -0.8301983, 5.459454, 1, 0, 0, 1, 1,
0.180619, 1.928112, 0.2621138, 1, 0, 0, 1, 1,
0.1888857, 1.56552, -0.6731721, 1, 0, 0, 1, 1,
0.19232, -0.5096657, 1.740799, 0, 0, 0, 1, 1,
0.193061, 0.3490471, -1.106001, 0, 0, 0, 1, 1,
0.1946634, -2.048608, 4.716287, 0, 0, 0, 1, 1,
0.1960077, -0.5609837, 3.394907, 0, 0, 0, 1, 1,
0.1973568, 1.844544, 1.96202, 0, 0, 0, 1, 1,
0.1979, 0.1662239, 0.6542533, 0, 0, 0, 1, 1,
0.1988856, -0.1629798, 1.60283, 0, 0, 0, 1, 1,
0.1996645, 0.03943029, 1.818891, 1, 1, 1, 1, 1,
0.2006063, 2.489817, 0.008287475, 1, 1, 1, 1, 1,
0.2024666, 0.9649925, -0.3447403, 1, 1, 1, 1, 1,
0.2058899, -0.7846735, 3.695545, 1, 1, 1, 1, 1,
0.2060038, -0.7238193, 3.415261, 1, 1, 1, 1, 1,
0.2110059, -0.6659642, 4.196956, 1, 1, 1, 1, 1,
0.2142315, -0.3721883, 3.150057, 1, 1, 1, 1, 1,
0.215873, -0.5400169, 4.181552, 1, 1, 1, 1, 1,
0.2180602, 2.570339, -0.5695376, 1, 1, 1, 1, 1,
0.219556, 0.3330875, 0.0207149, 1, 1, 1, 1, 1,
0.2198743, -0.112243, 3.809095, 1, 1, 1, 1, 1,
0.2210283, 2.253522, 0.838529, 1, 1, 1, 1, 1,
0.2245892, -0.6333303, 2.862106, 1, 1, 1, 1, 1,
0.2310291, -1.53785, 3.016837, 1, 1, 1, 1, 1,
0.2324087, -1.412465, 3.553248, 1, 1, 1, 1, 1,
0.2336909, -0.9927391, 2.326146, 0, 0, 1, 1, 1,
0.2426518, -1.208217, 1.845013, 1, 0, 0, 1, 1,
0.2433641, 0.4176548, 0.6185935, 1, 0, 0, 1, 1,
0.2479536, -0.4989382, 1.798916, 1, 0, 0, 1, 1,
0.2486813, -1.443697, 3.568647, 1, 0, 0, 1, 1,
0.2490942, 0.2697101, 0.02470985, 1, 0, 0, 1, 1,
0.2540436, -0.6935689, 1.388253, 0, 0, 0, 1, 1,
0.2562225, -0.4611644, 3.91337, 0, 0, 0, 1, 1,
0.2581127, -0.8013071, 1.932741, 0, 0, 0, 1, 1,
0.2585013, -0.9464792, 2.555008, 0, 0, 0, 1, 1,
0.2597384, -0.7722288, 1.129695, 0, 0, 0, 1, 1,
0.2599589, -0.5719231, 1.915888, 0, 0, 0, 1, 1,
0.2600562, -0.2732419, 1.790033, 0, 0, 0, 1, 1,
0.2616318, 1.049966, 2.024209, 1, 1, 1, 1, 1,
0.2620474, 0.235538, -1.225625, 1, 1, 1, 1, 1,
0.2646137, 2.016964, 0.8146659, 1, 1, 1, 1, 1,
0.2673697, 0.2926343, 1.230682, 1, 1, 1, 1, 1,
0.268671, 1.400857, -0.8762789, 1, 1, 1, 1, 1,
0.2702146, 0.5520811, 1.15354, 1, 1, 1, 1, 1,
0.2736425, -1.372862, 2.959179, 1, 1, 1, 1, 1,
0.2818827, 1.637092, -1.388862, 1, 1, 1, 1, 1,
0.2920312, 0.9661164, -0.5239762, 1, 1, 1, 1, 1,
0.2961609, 0.3992709, -0.8659606, 1, 1, 1, 1, 1,
0.2971912, -1.508554, 3.556872, 1, 1, 1, 1, 1,
0.302729, -1.464, 2.729929, 1, 1, 1, 1, 1,
0.3051673, -0.293458, 1.245758, 1, 1, 1, 1, 1,
0.3054151, 1.689682, 0.8946044, 1, 1, 1, 1, 1,
0.3124429, 0.02283432, 2.657448, 1, 1, 1, 1, 1,
0.3176718, 0.03215082, 1.322468, 0, 0, 1, 1, 1,
0.3214656, -1.176774, 3.399124, 1, 0, 0, 1, 1,
0.3220171, 0.4364113, 0.4824907, 1, 0, 0, 1, 1,
0.3259069, 0.2040806, 0.6754591, 1, 0, 0, 1, 1,
0.3260738, -0.6682005, 2.715874, 1, 0, 0, 1, 1,
0.3268449, 0.1350193, 2.045819, 1, 0, 0, 1, 1,
0.3293746, 0.6463823, 0.8092301, 0, 0, 0, 1, 1,
0.3298528, -0.1173145, 2.463271, 0, 0, 0, 1, 1,
0.3306016, 2.983766, -1.056689, 0, 0, 0, 1, 1,
0.3315082, -0.1843792, 1.630702, 0, 0, 0, 1, 1,
0.3337938, 0.8641049, 0.9394234, 0, 0, 0, 1, 1,
0.3383846, 0.5620315, 0.8951519, 0, 0, 0, 1, 1,
0.3475879, 0.6543376, 0.9224044, 0, 0, 0, 1, 1,
0.3510553, 0.0162021, 0.6899629, 1, 1, 1, 1, 1,
0.3591907, 0.06823187, 2.117762, 1, 1, 1, 1, 1,
0.3635894, 0.5026892, -0.4603948, 1, 1, 1, 1, 1,
0.3637955, 1.197294, 1.060107, 1, 1, 1, 1, 1,
0.364521, 0.6399611, 1.408759, 1, 1, 1, 1, 1,
0.3664021, 0.4969685, 0.4488469, 1, 1, 1, 1, 1,
0.3731172, 1.090708, 0.8237512, 1, 1, 1, 1, 1,
0.3750776, 1.265049, -1.034059, 1, 1, 1, 1, 1,
0.3764442, -1.638506, 4.978919, 1, 1, 1, 1, 1,
0.3765255, 1.685575, -0.9060023, 1, 1, 1, 1, 1,
0.3784093, 0.953554, 0.8622161, 1, 1, 1, 1, 1,
0.3812658, 0.6370141, -0.06808995, 1, 1, 1, 1, 1,
0.3823986, -1.192063, 3.829868, 1, 1, 1, 1, 1,
0.3826007, 1.098701, 1.952526, 1, 1, 1, 1, 1,
0.3860367, 1.31782, -1.479643, 1, 1, 1, 1, 1,
0.3862371, 1.53418, 0.9529894, 0, 0, 1, 1, 1,
0.3889625, 0.52811, 2.719956, 1, 0, 0, 1, 1,
0.3920889, -1.031852, 2.057928, 1, 0, 0, 1, 1,
0.3925017, 1.883464, -0.3103955, 1, 0, 0, 1, 1,
0.3939733, -1.614231, 3.740594, 1, 0, 0, 1, 1,
0.3972281, 0.4483966, 2.848981, 1, 0, 0, 1, 1,
0.4027844, 1.373425, 0.4793273, 0, 0, 0, 1, 1,
0.4029169, -0.1870591, 2.985665, 0, 0, 0, 1, 1,
0.4060233, 0.09937385, 1.452317, 0, 0, 0, 1, 1,
0.41275, 0.03827829, 0.5175797, 0, 0, 0, 1, 1,
0.4130983, -0.1677345, 2.321631, 0, 0, 0, 1, 1,
0.414113, -1.40451, 2.745754, 0, 0, 0, 1, 1,
0.4150166, -0.8146231, 2.466819, 0, 0, 0, 1, 1,
0.4155574, 1.057101, 1.634676, 1, 1, 1, 1, 1,
0.4225052, -1.183026, 2.87454, 1, 1, 1, 1, 1,
0.4263157, 1.528848, 1.099545, 1, 1, 1, 1, 1,
0.4282236, 1.02333, 0.3734479, 1, 1, 1, 1, 1,
0.4282739, -1.060845, 2.932946, 1, 1, 1, 1, 1,
0.4300799, 0.1097627, 0.6615631, 1, 1, 1, 1, 1,
0.4302332, 0.6991563, 0.915238, 1, 1, 1, 1, 1,
0.4403063, 1.913462, 0.638409, 1, 1, 1, 1, 1,
0.4427578, -1.391997, 3.247424, 1, 1, 1, 1, 1,
0.4451867, -0.5838428, 3.873479, 1, 1, 1, 1, 1,
0.4510096, 1.706853, -1.390595, 1, 1, 1, 1, 1,
0.4554943, -0.02897868, 1.986949, 1, 1, 1, 1, 1,
0.4560528, 0.7757755, 1.084477, 1, 1, 1, 1, 1,
0.460488, -0.03545273, 2.9968, 1, 1, 1, 1, 1,
0.4628083, 0.6895349, 0.2022456, 1, 1, 1, 1, 1,
0.4635852, 0.3730343, 1.234484, 0, 0, 1, 1, 1,
0.4686132, 2.094865, -0.104201, 1, 0, 0, 1, 1,
0.4769725, -1.167646, 1.247486, 1, 0, 0, 1, 1,
0.4774209, -1.39123, 3.984921, 1, 0, 0, 1, 1,
0.4794274, -0.7209647, 1.843432, 1, 0, 0, 1, 1,
0.4796436, -1.361126, 1.145119, 1, 0, 0, 1, 1,
0.4810269, -0.5559446, 2.878023, 0, 0, 0, 1, 1,
0.4814039, -1.079273, 2.924439, 0, 0, 0, 1, 1,
0.4840862, 0.5068293, 1.697262, 0, 0, 0, 1, 1,
0.4865042, 1.874919, 0.282191, 0, 0, 0, 1, 1,
0.4867289, 0.5919811, 0.299566, 0, 0, 0, 1, 1,
0.486913, 0.9622613, 1.461976, 0, 0, 0, 1, 1,
0.4886414, -0.5933717, 2.249176, 0, 0, 0, 1, 1,
0.4895372, 0.4046572, 0.544013, 1, 1, 1, 1, 1,
0.4929655, -0.6524304, 2.31633, 1, 1, 1, 1, 1,
0.4998157, -1.477867, 4.977559, 1, 1, 1, 1, 1,
0.5053656, -1.600461, 2.640092, 1, 1, 1, 1, 1,
0.5103344, -0.3840065, 1.368459, 1, 1, 1, 1, 1,
0.5113467, -0.7717783, 2.913407, 1, 1, 1, 1, 1,
0.5181219, -0.7016833, 1.019354, 1, 1, 1, 1, 1,
0.5184509, 1.595335, 1.002056, 1, 1, 1, 1, 1,
0.5193461, 0.8706855, 0.8625014, 1, 1, 1, 1, 1,
0.5229799, 0.3696212, 2.075286, 1, 1, 1, 1, 1,
0.5263174, -1.534458, 3.646985, 1, 1, 1, 1, 1,
0.5281361, -0.4266327, 0.9046192, 1, 1, 1, 1, 1,
0.5283204, -1.361832, 2.858907, 1, 1, 1, 1, 1,
0.5288818, 1.18145, 1.720166, 1, 1, 1, 1, 1,
0.5349541, 0.1035383, 1.763035, 1, 1, 1, 1, 1,
0.5362512, 0.05191592, 2.593346, 0, 0, 1, 1, 1,
0.5396043, -0.5611089, 3.480155, 1, 0, 0, 1, 1,
0.5401474, 0.02815143, 0.8315999, 1, 0, 0, 1, 1,
0.5404245, -0.5041626, 2.324844, 1, 0, 0, 1, 1,
0.5408556, 0.344738, 2.197339, 1, 0, 0, 1, 1,
0.541631, 0.6089447, 1.754963, 1, 0, 0, 1, 1,
0.542074, -0.1643294, 2.362116, 0, 0, 0, 1, 1,
0.5426024, 0.9894738, 0.3310786, 0, 0, 0, 1, 1,
0.5434374, 1.208071, 1.538649, 0, 0, 0, 1, 1,
0.5475791, 1.249469, -0.2204926, 0, 0, 0, 1, 1,
0.5519462, 0.5225029, 2.135471, 0, 0, 0, 1, 1,
0.5524744, 0.2395262, 1.840672, 0, 0, 0, 1, 1,
0.5550009, -0.7120166, 2.594836, 0, 0, 0, 1, 1,
0.559577, 1.165357, -0.2710648, 1, 1, 1, 1, 1,
0.569881, -0.2571394, 2.407665, 1, 1, 1, 1, 1,
0.574478, 0.5602723, 1.481857, 1, 1, 1, 1, 1,
0.5771388, 1.150915, 1.500461, 1, 1, 1, 1, 1,
0.5824279, 0.8079469, 0.2295962, 1, 1, 1, 1, 1,
0.5864809, 0.5158446, 2.057787, 1, 1, 1, 1, 1,
0.5869147, -1.166963, 3.212255, 1, 1, 1, 1, 1,
0.58747, -0.1940239, 2.246419, 1, 1, 1, 1, 1,
0.5883299, 0.2852149, 2.38244, 1, 1, 1, 1, 1,
0.5887, -0.3161506, 3.958177, 1, 1, 1, 1, 1,
0.5917106, -0.449016, 3.319151, 1, 1, 1, 1, 1,
0.5920947, -0.3320204, 2.077184, 1, 1, 1, 1, 1,
0.5929762, -0.373819, 0.9124637, 1, 1, 1, 1, 1,
0.5951411, 0.2476844, 1.068199, 1, 1, 1, 1, 1,
0.5961329, 2.028739, 0.3814493, 1, 1, 1, 1, 1,
0.5986511, -0.3411283, 2.817939, 0, 0, 1, 1, 1,
0.6032693, 0.3170166, 2.219094, 1, 0, 0, 1, 1,
0.6053608, 0.9880885, 0.8495645, 1, 0, 0, 1, 1,
0.6136899, 0.948931, 1.702905, 1, 0, 0, 1, 1,
0.6155499, -0.06063898, 2.0004, 1, 0, 0, 1, 1,
0.6194879, 1.296965, 0.301962, 1, 0, 0, 1, 1,
0.6215372, 0.3081906, 1.844535, 0, 0, 0, 1, 1,
0.6282091, 0.09324118, 3.406145, 0, 0, 0, 1, 1,
0.630027, -1.315113, 2.192946, 0, 0, 0, 1, 1,
0.630828, 0.1941258, -0.07231587, 0, 0, 0, 1, 1,
0.6331314, -1.778941, 3.265185, 0, 0, 0, 1, 1,
0.6446968, 1.375235, -0.9780006, 0, 0, 0, 1, 1,
0.6452762, 0.7386262, -1.828856, 0, 0, 0, 1, 1,
0.6491605, -0.3366128, 1.009904, 1, 1, 1, 1, 1,
0.651944, -0.9035412, 3.123094, 1, 1, 1, 1, 1,
0.652074, 0.8084976, -0.3103743, 1, 1, 1, 1, 1,
0.6537524, -1.400639, 3.794161, 1, 1, 1, 1, 1,
0.6539608, -0.7516068, 2.216832, 1, 1, 1, 1, 1,
0.6600307, -0.6167021, 2.412045, 1, 1, 1, 1, 1,
0.6641709, 0.07822531, 2.481634, 1, 1, 1, 1, 1,
0.66458, -1.425987, 1.232627, 1, 1, 1, 1, 1,
0.6667117, 1.410463, -0.7509354, 1, 1, 1, 1, 1,
0.6673179, 0.0236358, 2.952314, 1, 1, 1, 1, 1,
0.6674952, 1.370896, 1.117131, 1, 1, 1, 1, 1,
0.6715924, 0.5301765, 0.6111512, 1, 1, 1, 1, 1,
0.6724309, -0.8398356, 3.45443, 1, 1, 1, 1, 1,
0.6750102, 1.685349, 1.972654, 1, 1, 1, 1, 1,
0.6764224, -0.6919028, 2.456439, 1, 1, 1, 1, 1,
0.6859038, 0.5599177, 3.728795, 0, 0, 1, 1, 1,
0.6888449, -0.4570937, 1.44028, 1, 0, 0, 1, 1,
0.7014269, 1.103712, -0.1312516, 1, 0, 0, 1, 1,
0.7049124, 0.9235361, 1.524861, 1, 0, 0, 1, 1,
0.7087994, -0.3373064, 1.629382, 1, 0, 0, 1, 1,
0.7125651, -0.6365941, 3.095865, 1, 0, 0, 1, 1,
0.7133617, 1.29525, 0.9819552, 0, 0, 0, 1, 1,
0.7145259, 1.574555, 0.8440657, 0, 0, 0, 1, 1,
0.7187171, 0.1427755, 0.2367429, 0, 0, 0, 1, 1,
0.7214566, 0.6805267, 0.7210905, 0, 0, 0, 1, 1,
0.7278392, 0.664861, 2.218911, 0, 0, 0, 1, 1,
0.7313008, -0.4307361, 3.353048, 0, 0, 0, 1, 1,
0.7443608, 1.38396, 0.4463668, 0, 0, 0, 1, 1,
0.7486961, -0.2776974, 0.6240662, 1, 1, 1, 1, 1,
0.7493386, -0.07203549, 0.8738338, 1, 1, 1, 1, 1,
0.7506181, -0.208191, 2.13823, 1, 1, 1, 1, 1,
0.756871, 0.5039561, 2.644266, 1, 1, 1, 1, 1,
0.7573124, 0.1672944, 1.477327, 1, 1, 1, 1, 1,
0.7595349, 1.205479, 1.775869, 1, 1, 1, 1, 1,
0.7613431, -0.6685715, 1.942945, 1, 1, 1, 1, 1,
0.7696929, -0.2546219, 1.96459, 1, 1, 1, 1, 1,
0.7720651, -0.6913128, 0.8039457, 1, 1, 1, 1, 1,
0.7750339, -1.08938, 4.340092, 1, 1, 1, 1, 1,
0.7888242, 0.2600054, 0.00682906, 1, 1, 1, 1, 1,
0.7940083, 0.4050457, 1.354549, 1, 1, 1, 1, 1,
0.7947364, 1.173329, 0.3606191, 1, 1, 1, 1, 1,
0.7947854, -0.6861095, 3.045436, 1, 1, 1, 1, 1,
0.8018243, -0.4571, 2.849068, 1, 1, 1, 1, 1,
0.8032717, 0.07302596, 0.3923494, 0, 0, 1, 1, 1,
0.8058661, -2.011102, 2.810683, 1, 0, 0, 1, 1,
0.8062387, 0.09344567, 1.227825, 1, 0, 0, 1, 1,
0.8087072, -1.969883, 2.898415, 1, 0, 0, 1, 1,
0.8156283, 1.486363, -0.6603429, 1, 0, 0, 1, 1,
0.8158422, 0.8696192, -0.0343413, 1, 0, 0, 1, 1,
0.8190523, 0.1883727, 0.1226475, 0, 0, 0, 1, 1,
0.8253331, -0.7289721, 1.428364, 0, 0, 0, 1, 1,
0.8301137, -1.077183, 3.448636, 0, 0, 0, 1, 1,
0.8316566, -0.5550687, 3.478717, 0, 0, 0, 1, 1,
0.8363703, 0.3895659, 1.218868, 0, 0, 0, 1, 1,
0.8414366, 1.144528, -1.395791, 0, 0, 0, 1, 1,
0.8479781, -2.184951, 0.5464059, 0, 0, 0, 1, 1,
0.8496761, -0.1250783, 2.770911, 1, 1, 1, 1, 1,
0.8520572, 0.1974269, -0.3954012, 1, 1, 1, 1, 1,
0.8524448, 0.1376326, 0.8347418, 1, 1, 1, 1, 1,
0.8526684, 0.2336946, 1.397125, 1, 1, 1, 1, 1,
0.8615852, 1.383779, -1.314006, 1, 1, 1, 1, 1,
0.8657078, -0.5735695, 1.728838, 1, 1, 1, 1, 1,
0.8689119, 0.4279031, 0.8707229, 1, 1, 1, 1, 1,
0.8694203, -1.279719, 2.387838, 1, 1, 1, 1, 1,
0.8751569, 0.02945762, 2.671569, 1, 1, 1, 1, 1,
0.8791152, -0.141271, 4.326803, 1, 1, 1, 1, 1,
0.8826547, 0.02671337, 0.09285482, 1, 1, 1, 1, 1,
0.8828144, 1.694479, 0.4226022, 1, 1, 1, 1, 1,
0.8900518, -1.794923, 1.741161, 1, 1, 1, 1, 1,
0.8962361, -0.8815479, 2.515458, 1, 1, 1, 1, 1,
0.9072265, -0.04907426, 1.611626, 1, 1, 1, 1, 1,
0.908051, 0.9646133, 0.7843779, 0, 0, 1, 1, 1,
0.9184047, 2.391589, 0.0449266, 1, 0, 0, 1, 1,
0.926599, -0.5448437, 2.192876, 1, 0, 0, 1, 1,
0.9306554, -1.125295, 3.589691, 1, 0, 0, 1, 1,
0.9350235, 1.758792, 0.7611864, 1, 0, 0, 1, 1,
0.9357621, 0.6874242, 0.7279037, 1, 0, 0, 1, 1,
0.9426106, -1.66782, 1.559799, 0, 0, 0, 1, 1,
0.946151, 0.6474482, -0.02453358, 0, 0, 0, 1, 1,
0.9493622, 0.2538252, 0.9600577, 0, 0, 0, 1, 1,
0.9499376, 0.8166098, 1.332342, 0, 0, 0, 1, 1,
0.9501923, 0.05727357, 2.398232, 0, 0, 0, 1, 1,
0.9537929, 1.328105, 1.873156, 0, 0, 0, 1, 1,
0.9548972, -2.156644, 1.569137, 0, 0, 0, 1, 1,
0.9564103, 1.060823, 1.409568, 1, 1, 1, 1, 1,
0.9743143, -0.4142627, 1.247057, 1, 1, 1, 1, 1,
0.9749609, -0.3100051, 1.04453, 1, 1, 1, 1, 1,
0.9761978, 1.816807, 0.04176623, 1, 1, 1, 1, 1,
0.9827294, 0.2288622, 2.06331, 1, 1, 1, 1, 1,
0.9840769, 0.4540919, 1.526567, 1, 1, 1, 1, 1,
0.9964247, 0.7297173, 0.5281678, 1, 1, 1, 1, 1,
1.003211, 0.5277128, 0.4921975, 1, 1, 1, 1, 1,
1.013049, 1.43917, -0.6200801, 1, 1, 1, 1, 1,
1.019137, -1.572706, 2.640304, 1, 1, 1, 1, 1,
1.01964, 0.6090946, -0.5922081, 1, 1, 1, 1, 1,
1.023084, -1.456057, 2.410059, 1, 1, 1, 1, 1,
1.02671, -1.257385, 2.373698, 1, 1, 1, 1, 1,
1.038931, -1.171553, 1.438792, 1, 1, 1, 1, 1,
1.043908, 0.1636979, 2.527109, 1, 1, 1, 1, 1,
1.052615, -0.4763643, 0.7515049, 0, 0, 1, 1, 1,
1.054669, -0.9804643, 2.761819, 1, 0, 0, 1, 1,
1.056051, -0.791619, 1.098499, 1, 0, 0, 1, 1,
1.057324, -2.001808, 2.362721, 1, 0, 0, 1, 1,
1.063137, 0.1245007, 1.692994, 1, 0, 0, 1, 1,
1.066772, 1.345975, 1.926122, 1, 0, 0, 1, 1,
1.07005, 0.08025365, 2.759711, 0, 0, 0, 1, 1,
1.077407, 0.961628, -1.499586, 0, 0, 0, 1, 1,
1.082304, -0.6478348, 1.010792, 0, 0, 0, 1, 1,
1.084013, -0.4285379, 2.688779, 0, 0, 0, 1, 1,
1.085057, -1.285642, 2.798494, 0, 0, 0, 1, 1,
1.085529, 0.8593216, 1.103248, 0, 0, 0, 1, 1,
1.086924, -0.1083995, 2.587486, 0, 0, 0, 1, 1,
1.092764, 1.377485, 1.728483, 1, 1, 1, 1, 1,
1.093496, -1.110055, 3.149683, 1, 1, 1, 1, 1,
1.095134, 1.512018, 1.268064, 1, 1, 1, 1, 1,
1.102209, -0.4230337, 0.6396587, 1, 1, 1, 1, 1,
1.106823, -0.3324229, 3.380843, 1, 1, 1, 1, 1,
1.110938, -1.549241, 1.6317, 1, 1, 1, 1, 1,
1.11652, -0.9470789, 2.824939, 1, 1, 1, 1, 1,
1.123453, -1.756837, 1.026135, 1, 1, 1, 1, 1,
1.124667, -0.7160672, 0.3970053, 1, 1, 1, 1, 1,
1.124814, -1.288814, 2.375329, 1, 1, 1, 1, 1,
1.14196, 0.2420051, 1.550914, 1, 1, 1, 1, 1,
1.143386, 0.7412282, -1.589119, 1, 1, 1, 1, 1,
1.148074, 0.6988111, 1.259808, 1, 1, 1, 1, 1,
1.150723, -0.3673905, 1.787014, 1, 1, 1, 1, 1,
1.163887, -0.5991689, 3.783269, 1, 1, 1, 1, 1,
1.183686, 0.3262829, -0.2347095, 0, 0, 1, 1, 1,
1.186119, 0.7106575, 1.104525, 1, 0, 0, 1, 1,
1.188335, 0.4195743, 1.853437, 1, 0, 0, 1, 1,
1.190409, 1.248367, 1.620764, 1, 0, 0, 1, 1,
1.191211, 1.241463, -0.6267861, 1, 0, 0, 1, 1,
1.196753, 1.114677, 1.221444, 1, 0, 0, 1, 1,
1.198574, 2.048992, 1.518944, 0, 0, 0, 1, 1,
1.207699, -0.08711766, 1.779888, 0, 0, 0, 1, 1,
1.209689, -1.420217, 2.592441, 0, 0, 0, 1, 1,
1.215649, -0.8181148, 3.794247, 0, 0, 0, 1, 1,
1.217869, 0.9478654, 2.005429, 0, 0, 0, 1, 1,
1.221454, 1.507349, 0.43299, 0, 0, 0, 1, 1,
1.22173, 0.3322308, 1.930579, 0, 0, 0, 1, 1,
1.222428, 1.22304, 0.2268043, 1, 1, 1, 1, 1,
1.228115, -0.03908586, 1.866455, 1, 1, 1, 1, 1,
1.232715, -0.8001547, 2.726536, 1, 1, 1, 1, 1,
1.236479, -0.1417369, 2.836207, 1, 1, 1, 1, 1,
1.238474, 0.7676933, 1.315607, 1, 1, 1, 1, 1,
1.248434, 0.3926018, 2.835805, 1, 1, 1, 1, 1,
1.252083, -0.4584672, 1.941058, 1, 1, 1, 1, 1,
1.252934, -1.625258, 1.789459, 1, 1, 1, 1, 1,
1.25868, 0.5435935, 1.585033, 1, 1, 1, 1, 1,
1.262194, 0.7839122, -0.3427626, 1, 1, 1, 1, 1,
1.263534, -0.788256, 3.857153, 1, 1, 1, 1, 1,
1.263967, 2.109258, 1.814809, 1, 1, 1, 1, 1,
1.265639, 0.8503934, 3.018008, 1, 1, 1, 1, 1,
1.270032, 0.5242852, 1.869365, 1, 1, 1, 1, 1,
1.27054, 0.06409819, 1.174805, 1, 1, 1, 1, 1,
1.274143, 0.2184948, 2.357323, 0, 0, 1, 1, 1,
1.275543, 1.131808, -0.1113055, 1, 0, 0, 1, 1,
1.277935, 0.2405011, 0.2069276, 1, 0, 0, 1, 1,
1.282692, 0.242072, 2.296762, 1, 0, 0, 1, 1,
1.28507, 2.072683, -2.345093, 1, 0, 0, 1, 1,
1.290057, 0.7842252, 2.835483, 1, 0, 0, 1, 1,
1.294877, -1.112778, 1.895837, 0, 0, 0, 1, 1,
1.304388, 0.0062688, 2.24657, 0, 0, 0, 1, 1,
1.313083, 0.9257997, 2.503808, 0, 0, 0, 1, 1,
1.315662, -1.000887, 3.692393, 0, 0, 0, 1, 1,
1.323136, -0.1320733, 1.55624, 0, 0, 0, 1, 1,
1.328795, -2.122132, 1.618143, 0, 0, 0, 1, 1,
1.339862, 0.430837, 1.618152, 0, 0, 0, 1, 1,
1.343644, 0.1444382, 0.4116336, 1, 1, 1, 1, 1,
1.351623, -1.028352, 2.985249, 1, 1, 1, 1, 1,
1.35433, -0.01816273, 1.578336, 1, 1, 1, 1, 1,
1.362276, -0.5059029, 2.020378, 1, 1, 1, 1, 1,
1.373949, -1.53948, 2.157501, 1, 1, 1, 1, 1,
1.378089, 1.169149, 1.961645, 1, 1, 1, 1, 1,
1.379475, 0.8127454, 0.6324632, 1, 1, 1, 1, 1,
1.383049, -1.104681, 1.674078, 1, 1, 1, 1, 1,
1.397669, -1.493747, 1.886599, 1, 1, 1, 1, 1,
1.399296, -0.8894961, 1.600694, 1, 1, 1, 1, 1,
1.403096, 2.703034, -1.131268, 1, 1, 1, 1, 1,
1.405545, -0.706129, 0.07508428, 1, 1, 1, 1, 1,
1.411005, -0.09188577, 1.925017, 1, 1, 1, 1, 1,
1.412402, 0.05948305, 3.02511, 1, 1, 1, 1, 1,
1.427894, 0.5055268, 1.108624, 1, 1, 1, 1, 1,
1.428685, -0.8133215, 1.49008, 0, 0, 1, 1, 1,
1.429117, -2.280251, 2.667249, 1, 0, 0, 1, 1,
1.445676, 0.4731527, 1.390844, 1, 0, 0, 1, 1,
1.450721, -0.4222876, 2.003475, 1, 0, 0, 1, 1,
1.47627, 0.524938, 1.970704, 1, 0, 0, 1, 1,
1.484263, 0.3473146, 1.694182, 1, 0, 0, 1, 1,
1.490819, -0.146922, 2.716001, 0, 0, 0, 1, 1,
1.491101, 0.2753749, 2.186766, 0, 0, 0, 1, 1,
1.516395, -1.467702, 2.656214, 0, 0, 0, 1, 1,
1.517094, -0.8114762, 0.788361, 0, 0, 0, 1, 1,
1.518136, -0.8690063, 0.761627, 0, 0, 0, 1, 1,
1.533918, 0.6548716, 0.9422835, 0, 0, 0, 1, 1,
1.554558, 0.3818451, 1.59743, 0, 0, 0, 1, 1,
1.556049, -1.259812, 2.703318, 1, 1, 1, 1, 1,
1.574465, 0.05032093, 1.622403, 1, 1, 1, 1, 1,
1.585901, 0.03524669, 2.456128, 1, 1, 1, 1, 1,
1.616455, 0.5506426, 0.9432243, 1, 1, 1, 1, 1,
1.61714, 0.3387207, 2.65825, 1, 1, 1, 1, 1,
1.633059, -1.716966, 1.760105, 1, 1, 1, 1, 1,
1.638827, -0.2710474, 1.780654, 1, 1, 1, 1, 1,
1.639871, -1.330612, 2.652772, 1, 1, 1, 1, 1,
1.655036, -0.02503232, 3.367496, 1, 1, 1, 1, 1,
1.67164, -0.8790876, 2.799206, 1, 1, 1, 1, 1,
1.699798, -0.7416486, 1.976134, 1, 1, 1, 1, 1,
1.702337, -0.01950798, 4.039231, 1, 1, 1, 1, 1,
1.706122, 2.62782, 0.2765017, 1, 1, 1, 1, 1,
1.718253, -0.07755128, 1.159087, 1, 1, 1, 1, 1,
1.721096, -0.4367343, 2.205709, 1, 1, 1, 1, 1,
1.728039, -0.4715353, 0.6580569, 0, 0, 1, 1, 1,
1.747786, 0.2299186, 1.452787, 1, 0, 0, 1, 1,
1.751674, 0.06047884, 1.671439, 1, 0, 0, 1, 1,
1.752887, -1.6282, 1.601385, 1, 0, 0, 1, 1,
1.757658, 1.124027, -0.6433076, 1, 0, 0, 1, 1,
1.775912, -0.4731835, 0.3571475, 1, 0, 0, 1, 1,
1.780175, -0.5703697, 0.8805175, 0, 0, 0, 1, 1,
1.801051, 1.031337, 0.7393253, 0, 0, 0, 1, 1,
1.811096, -1.262632, 1.61226, 0, 0, 0, 1, 1,
1.813492, 0.6760507, 2.330956, 0, 0, 0, 1, 1,
1.834265, -0.6662808, 1.909724, 0, 0, 0, 1, 1,
1.836342, -1.616162, 1.938324, 0, 0, 0, 1, 1,
1.839519, -2.124671, 0.6133057, 0, 0, 0, 1, 1,
1.879559, -0.8270302, 1.180187, 1, 1, 1, 1, 1,
1.880857, -0.8979526, 0.9358335, 1, 1, 1, 1, 1,
1.907291, 0.02246557, 1.5825, 1, 1, 1, 1, 1,
1.908111, -1.993782, 4.200116, 1, 1, 1, 1, 1,
1.98483, -0.9210946, 0.05384721, 1, 1, 1, 1, 1,
2.007539, 0.6035093, 1.394184, 1, 1, 1, 1, 1,
2.027875, -1.282507, 1.221576, 1, 1, 1, 1, 1,
2.038406, -0.4515199, 0.180211, 1, 1, 1, 1, 1,
2.094883, -0.7922848, 1.124541, 1, 1, 1, 1, 1,
2.119359, -0.03572024, 1.335918, 1, 1, 1, 1, 1,
2.126842, -0.2374078, 1.360292, 1, 1, 1, 1, 1,
2.130485, 0.9658884, 2.418638, 1, 1, 1, 1, 1,
2.160375, -0.3797647, 0.2720484, 1, 1, 1, 1, 1,
2.19927, -0.7847708, 2.466861, 1, 1, 1, 1, 1,
2.208511, -1.084252, 2.995124, 1, 1, 1, 1, 1,
2.210103, -1.894866, 3.115753, 0, 0, 1, 1, 1,
2.267509, -0.4551234, 2.091277, 1, 0, 0, 1, 1,
2.273585, 1.59456, 2.682418, 1, 0, 0, 1, 1,
2.282759, -0.09525905, 2.33061, 1, 0, 0, 1, 1,
2.368912, -1.43737, 1.80647, 1, 0, 0, 1, 1,
2.374869, 1.80151, 1.684912, 1, 0, 0, 1, 1,
2.401202, 0.05795031, -0.9650953, 0, 0, 0, 1, 1,
2.446919, 0.8182934, 0.3090954, 0, 0, 0, 1, 1,
2.497673, 1.417366, 3.133805, 0, 0, 0, 1, 1,
2.555926, -2.361342, 3.655669, 0, 0, 0, 1, 1,
2.582287, 0.2455277, 0.9309583, 0, 0, 0, 1, 1,
2.595744, 0.7007985, 2.704147, 0, 0, 0, 1, 1,
2.624609, 2.044481, 1.086673, 0, 0, 0, 1, 1,
2.643756, 0.1816138, 2.822482, 1, 1, 1, 1, 1,
2.788051, 0.7197063, 0.7819333, 1, 1, 1, 1, 1,
2.798028, 0.5152584, 1.623828, 1, 1, 1, 1, 1,
2.818254, 0.8126603, 2.592945, 1, 1, 1, 1, 1,
2.825726, 0.7904711, -0.2834853, 1, 1, 1, 1, 1,
3.019022, 3.368112, -0.1116458, 1, 1, 1, 1, 1,
3.09408, -0.9002925, 0.7060959, 1, 1, 1, 1, 1
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
var radius = 9.76727;
var distance = 34.30712;
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
mvMatrix.translate( 0.1668534, -0.2904917, 0.178323 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.30712);
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
