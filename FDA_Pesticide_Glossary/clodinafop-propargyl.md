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
-3.427035, -1.421819, -3.833469, 1, 0, 0, 1,
-3.236921, 0.3223895, -1.050343, 1, 0.007843138, 0, 1,
-3.095589, -1.233855, -2.256294, 1, 0.01176471, 0, 1,
-2.667481, -0.09815322, -2.038242, 1, 0.01960784, 0, 1,
-2.630251, 0.2927563, -2.957033, 1, 0.02352941, 0, 1,
-2.605077, 0.4808655, 1.327219, 1, 0.03137255, 0, 1,
-2.562835, -0.6813498, -2.905055, 1, 0.03529412, 0, 1,
-2.30805, 2.120749, -0.928346, 1, 0.04313726, 0, 1,
-2.28043, -0.7177418, -2.557611, 1, 0.04705882, 0, 1,
-2.237032, -1.780901, -3.774105, 1, 0.05490196, 0, 1,
-2.208395, 0.7367631, -1.415845, 1, 0.05882353, 0, 1,
-2.180155, -1.412173, -0.3813104, 1, 0.06666667, 0, 1,
-2.172745, 0.6254044, -0.9271688, 1, 0.07058824, 0, 1,
-2.151435, 0.3533229, -0.6161286, 1, 0.07843138, 0, 1,
-2.150415, 0.4404004, -1.009539, 1, 0.08235294, 0, 1,
-2.130774, -0.2575741, -1.190506, 1, 0.09019608, 0, 1,
-2.117294, -0.2759121, -0.8707712, 1, 0.09411765, 0, 1,
-2.074265, 1.954761, -1.661139, 1, 0.1019608, 0, 1,
-2.066736, 0.8082973, -0.6244483, 1, 0.1098039, 0, 1,
-2.061041, -0.4612931, -1.501852, 1, 0.1137255, 0, 1,
-2.026108, -1.58677, -2.474148, 1, 0.1215686, 0, 1,
-1.974337, -0.9177006, -1.638372, 1, 0.1254902, 0, 1,
-1.971299, 0.1272823, -0.8987503, 1, 0.1333333, 0, 1,
-1.948937, 1.332663, -1.781509, 1, 0.1372549, 0, 1,
-1.886968, -0.7169087, -1.519576, 1, 0.145098, 0, 1,
-1.873023, -0.9270366, -2.434634, 1, 0.1490196, 0, 1,
-1.856176, -1.356582, -2.576105, 1, 0.1568628, 0, 1,
-1.847557, -0.8493438, -3.235022, 1, 0.1607843, 0, 1,
-1.844157, -0.5890741, -2.098149, 1, 0.1686275, 0, 1,
-1.827152, -0.8290394, -2.006326, 1, 0.172549, 0, 1,
-1.81356, -2.195046, -2.042054, 1, 0.1803922, 0, 1,
-1.795967, -1.027586, -1.662637, 1, 0.1843137, 0, 1,
-1.786787, -0.6915755, -0.5424157, 1, 0.1921569, 0, 1,
-1.76623, 1.07803, 0.7498811, 1, 0.1960784, 0, 1,
-1.760479, -0.7428045, -2.703549, 1, 0.2039216, 0, 1,
-1.748542, 0.9308403, -1.264517, 1, 0.2117647, 0, 1,
-1.716586, 0.8439012, -1.427107, 1, 0.2156863, 0, 1,
-1.715376, 0.3567984, -1.528968, 1, 0.2235294, 0, 1,
-1.705038, 0.1090769, -1.88708, 1, 0.227451, 0, 1,
-1.700848, 0.6614315, -1.041296, 1, 0.2352941, 0, 1,
-1.681371, 1.737445, -1.893742, 1, 0.2392157, 0, 1,
-1.679151, -0.1569437, -1.27514, 1, 0.2470588, 0, 1,
-1.668045, -0.2930719, -2.705304, 1, 0.2509804, 0, 1,
-1.664004, -1.020205, -3.068573, 1, 0.2588235, 0, 1,
-1.65466, 0.7331384, -1.754146, 1, 0.2627451, 0, 1,
-1.636491, -0.2863175, 0.1843429, 1, 0.2705882, 0, 1,
-1.626157, 0.7149158, -1.207865, 1, 0.2745098, 0, 1,
-1.610894, -1.030161, -2.297479, 1, 0.282353, 0, 1,
-1.588214, -0.2557955, -2.538809, 1, 0.2862745, 0, 1,
-1.582551, -0.43903, -2.127247, 1, 0.2941177, 0, 1,
-1.582005, 0.3822963, -1.988079, 1, 0.3019608, 0, 1,
-1.579503, -0.418476, -1.943155, 1, 0.3058824, 0, 1,
-1.575036, -1.644027, -1.926171, 1, 0.3137255, 0, 1,
-1.56266, -0.7886089, -3.862537, 1, 0.3176471, 0, 1,
-1.552951, 0.6269457, -1.01424, 1, 0.3254902, 0, 1,
-1.549992, 0.5884923, -1.716972, 1, 0.3294118, 0, 1,
-1.543196, -0.8545171, -2.933028, 1, 0.3372549, 0, 1,
-1.543162, 3.147918, 2.527657, 1, 0.3411765, 0, 1,
-1.515109, 2.478202, -0.1490001, 1, 0.3490196, 0, 1,
-1.512046, -0.1400872, -3.581595, 1, 0.3529412, 0, 1,
-1.507867, 0.8275482, -1.942775, 1, 0.3607843, 0, 1,
-1.482623, 0.1702944, 0.882561, 1, 0.3647059, 0, 1,
-1.47519, 1.748398, -0.5969676, 1, 0.372549, 0, 1,
-1.46796, 0.4156073, -1.719051, 1, 0.3764706, 0, 1,
-1.456292, 1.285764, -2.724038, 1, 0.3843137, 0, 1,
-1.445477, 0.09946742, 0.6643822, 1, 0.3882353, 0, 1,
-1.442171, 1.324513, -0.1471405, 1, 0.3960784, 0, 1,
-1.430085, 0.9118066, -1.210965, 1, 0.4039216, 0, 1,
-1.418239, -2.058192, -4.378634, 1, 0.4078431, 0, 1,
-1.411723, -0.5552697, -1.058317, 1, 0.4156863, 0, 1,
-1.402855, 0.1288196, -3.665443, 1, 0.4196078, 0, 1,
-1.39345, 0.02937139, -0.895951, 1, 0.427451, 0, 1,
-1.379, -0.2905979, -1.450288, 1, 0.4313726, 0, 1,
-1.377741, 0.2383865, -1.048347, 1, 0.4392157, 0, 1,
-1.370528, 0.03758522, -0.3385967, 1, 0.4431373, 0, 1,
-1.369378, 0.4926407, -0.8603184, 1, 0.4509804, 0, 1,
-1.360416, -0.6217558, -1.578496, 1, 0.454902, 0, 1,
-1.357038, 0.5950292, -1.018236, 1, 0.4627451, 0, 1,
-1.355561, -0.6062481, -0.8914966, 1, 0.4666667, 0, 1,
-1.347131, 0.683864, -3.08532, 1, 0.4745098, 0, 1,
-1.338465, -0.5525468, -0.3483144, 1, 0.4784314, 0, 1,
-1.331733, -1.856789, -3.979227, 1, 0.4862745, 0, 1,
-1.326645, -1.261683, -2.502401, 1, 0.4901961, 0, 1,
-1.32661, -0.3683341, -2.863015, 1, 0.4980392, 0, 1,
-1.322046, 0.16426, -0.7723922, 1, 0.5058824, 0, 1,
-1.317546, -0.5945283, -1.834088, 1, 0.509804, 0, 1,
-1.316765, -0.7911728, -1.517405, 1, 0.5176471, 0, 1,
-1.316439, 0.3595289, -0.4373032, 1, 0.5215687, 0, 1,
-1.304245, 0.3196118, -0.928344, 1, 0.5294118, 0, 1,
-1.304165, 0.3825839, -2.037991, 1, 0.5333334, 0, 1,
-1.290542, 1.291721, -1.450828, 1, 0.5411765, 0, 1,
-1.270655, -1.402502, -2.226593, 1, 0.5450981, 0, 1,
-1.26166, 0.4930421, 0.9268309, 1, 0.5529412, 0, 1,
-1.258353, 2.782904, -1.002511, 1, 0.5568628, 0, 1,
-1.252898, 0.8409647, -0.400565, 1, 0.5647059, 0, 1,
-1.25244, 1.416576, -0.5450978, 1, 0.5686275, 0, 1,
-1.244715, -1.4622, -2.763665, 1, 0.5764706, 0, 1,
-1.243141, -0.4663838, -1.367016, 1, 0.5803922, 0, 1,
-1.242453, 0.4859373, -1.027856, 1, 0.5882353, 0, 1,
-1.23281, 0.205897, -1.257045, 1, 0.5921569, 0, 1,
-1.231412, -0.5236194, -0.4420699, 1, 0.6, 0, 1,
-1.23065, -2.327648, -1.273244, 1, 0.6078432, 0, 1,
-1.225122, 0.7585441, -2.123629, 1, 0.6117647, 0, 1,
-1.218448, -0.9682984, -2.285919, 1, 0.6196079, 0, 1,
-1.21501, -0.4346985, -2.269553, 1, 0.6235294, 0, 1,
-1.214672, -0.07949724, -0.1304138, 1, 0.6313726, 0, 1,
-1.213548, -0.9573605, -1.391672, 1, 0.6352941, 0, 1,
-1.213216, -1.011922, -3.399787, 1, 0.6431373, 0, 1,
-1.208706, 0.8073372, -0.2330853, 1, 0.6470588, 0, 1,
-1.205381, -1.134995, -3.594789, 1, 0.654902, 0, 1,
-1.20008, -1.80799, -4.258257, 1, 0.6588235, 0, 1,
-1.1982, -0.3029329, -0.5758107, 1, 0.6666667, 0, 1,
-1.19556, -0.4378309, -1.047854, 1, 0.6705883, 0, 1,
-1.179312, 1.814234, -0.2515138, 1, 0.6784314, 0, 1,
-1.176875, -1.723354, -3.42473, 1, 0.682353, 0, 1,
-1.175773, 0.3444666, -1.737664, 1, 0.6901961, 0, 1,
-1.166722, 0.6063433, 0.2884206, 1, 0.6941177, 0, 1,
-1.148872, 1.086964, -1.578258, 1, 0.7019608, 0, 1,
-1.148706, -1.139747, -3.507318, 1, 0.7098039, 0, 1,
-1.145616, -2.062511, -3.336438, 1, 0.7137255, 0, 1,
-1.144836, 1.392319, 0.2600834, 1, 0.7215686, 0, 1,
-1.139742, -0.4921435, -2.652545, 1, 0.7254902, 0, 1,
-1.139311, -0.2103366, -1.627961, 1, 0.7333333, 0, 1,
-1.134239, -1.047214, -3.263828, 1, 0.7372549, 0, 1,
-1.127524, 0.8482811, -0.8990458, 1, 0.7450981, 0, 1,
-1.125526, -0.5861616, -3.921836, 1, 0.7490196, 0, 1,
-1.111791, 0.7381054, -2.129587, 1, 0.7568628, 0, 1,
-1.105954, 0.674756, -2.869237, 1, 0.7607843, 0, 1,
-1.105005, -0.2988418, -2.506956, 1, 0.7686275, 0, 1,
-1.097948, -1.152506, -0.4124228, 1, 0.772549, 0, 1,
-1.09465, 0.7772479, -1.469631, 1, 0.7803922, 0, 1,
-1.083861, -0.4858678, -5.260569, 1, 0.7843137, 0, 1,
-1.066355, -0.9527924, -3.186924, 1, 0.7921569, 0, 1,
-1.064774, -0.08243722, -2.522511, 1, 0.7960784, 0, 1,
-1.060168, 0.4148746, -0.810892, 1, 0.8039216, 0, 1,
-1.052367, 0.2389046, -3.125378, 1, 0.8117647, 0, 1,
-1.048543, 0.2903742, -0.5380088, 1, 0.8156863, 0, 1,
-1.047306, -1.243334, -3.75774, 1, 0.8235294, 0, 1,
-1.044511, 0.1961664, -0.1028034, 1, 0.827451, 0, 1,
-1.04434, -0.7765262, -2.697551, 1, 0.8352941, 0, 1,
-1.042125, 0.5877042, -1.707717, 1, 0.8392157, 0, 1,
-1.039546, -0.0686205, -1.812587, 1, 0.8470588, 0, 1,
-1.033002, 0.424294, -1.7225, 1, 0.8509804, 0, 1,
-1.021759, -0.4718457, -2.658643, 1, 0.8588235, 0, 1,
-1.018812, -2.535498, -3.017711, 1, 0.8627451, 0, 1,
-1.014842, -2.555151, -4.029696, 1, 0.8705882, 0, 1,
-1.012383, 1.044548, -0.3965329, 1, 0.8745098, 0, 1,
-1.010159, -0.1814564, -2.190882, 1, 0.8823529, 0, 1,
-1.006226, 0.8481903, 0.398238, 1, 0.8862745, 0, 1,
-1.004899, -0.6577773, -2.551157, 1, 0.8941177, 0, 1,
-1.003832, 0.1244746, -0.5679088, 1, 0.8980392, 0, 1,
-1.002849, -1.330189, -1.640496, 1, 0.9058824, 0, 1,
-0.9994833, 0.953413, -0.4739373, 1, 0.9137255, 0, 1,
-0.9980357, 0.8511775, -0.8387277, 1, 0.9176471, 0, 1,
-0.9948371, 0.5782295, -2.196279, 1, 0.9254902, 0, 1,
-0.9937162, 0.8484517, 1.472371, 1, 0.9294118, 0, 1,
-0.9875125, 0.2206795, -0.1204603, 1, 0.9372549, 0, 1,
-0.9753194, 0.9900358, 0.7218094, 1, 0.9411765, 0, 1,
-0.9721383, 1.875345, -1.577454, 1, 0.9490196, 0, 1,
-0.9702473, -0.1629353, -1.631507, 1, 0.9529412, 0, 1,
-0.9640989, 1.756301, 0.9462441, 1, 0.9607843, 0, 1,
-0.9621328, 0.2215296, -0.9856155, 1, 0.9647059, 0, 1,
-0.9613878, -1.054765, -1.407457, 1, 0.972549, 0, 1,
-0.9573782, 0.9659399, -1.727193, 1, 0.9764706, 0, 1,
-0.9533986, -1.717963, -3.133247, 1, 0.9843137, 0, 1,
-0.9530174, -0.6153666, -0.5468626, 1, 0.9882353, 0, 1,
-0.9469861, -0.5466362, -1.523794, 1, 0.9960784, 0, 1,
-0.9443992, -0.4011327, -1.562213, 0.9960784, 1, 0, 1,
-0.9392247, 1.05356, 0.4997183, 0.9921569, 1, 0, 1,
-0.9337554, -0.3751224, -1.745943, 0.9843137, 1, 0, 1,
-0.9333255, 1.145084, -1.121847, 0.9803922, 1, 0, 1,
-0.9306809, -0.4321758, -2.486088, 0.972549, 1, 0, 1,
-0.9237406, 1.642339, -0.8318074, 0.9686275, 1, 0, 1,
-0.9236528, 0.2573228, -1.974434, 0.9607843, 1, 0, 1,
-0.9204336, -0.5138452, -3.417798, 0.9568627, 1, 0, 1,
-0.9197448, -1.670669, -2.164549, 0.9490196, 1, 0, 1,
-0.9132551, -0.09811981, -0.9399049, 0.945098, 1, 0, 1,
-0.9121024, 0.4126528, -0.9036403, 0.9372549, 1, 0, 1,
-0.9118503, 1.6927, -1.936394, 0.9333333, 1, 0, 1,
-0.9059087, 0.7112086, -0.3979116, 0.9254902, 1, 0, 1,
-0.9053242, -0.4840292, -1.676208, 0.9215686, 1, 0, 1,
-0.9049101, 0.4711421, -2.524521, 0.9137255, 1, 0, 1,
-0.8959311, 2.091331, 0.2610988, 0.9098039, 1, 0, 1,
-0.8896904, -0.2993664, -1.810187, 0.9019608, 1, 0, 1,
-0.8885594, 0.09274544, -0.2571368, 0.8941177, 1, 0, 1,
-0.8871249, 0.4833063, 0.07467286, 0.8901961, 1, 0, 1,
-0.8840601, 1.409571, -0.2270819, 0.8823529, 1, 0, 1,
-0.8834715, 0.4926627, -2.718524, 0.8784314, 1, 0, 1,
-0.8774169, 0.1942959, -2.124056, 0.8705882, 1, 0, 1,
-0.8709244, 0.3121799, -2.114873, 0.8666667, 1, 0, 1,
-0.864297, 0.9252807, -0.8637379, 0.8588235, 1, 0, 1,
-0.8589342, 1.948729, 0.1804129, 0.854902, 1, 0, 1,
-0.840332, -0.3469294, -2.425664, 0.8470588, 1, 0, 1,
-0.8377017, 0.4265465, -2.962448, 0.8431373, 1, 0, 1,
-0.8365598, -0.5318277, -1.479435, 0.8352941, 1, 0, 1,
-0.8360195, -1.594389, -2.989422, 0.8313726, 1, 0, 1,
-0.8351498, -0.3831818, -3.942223, 0.8235294, 1, 0, 1,
-0.8343019, -1.275361, -3.41787, 0.8196079, 1, 0, 1,
-0.8320525, -0.01275134, -0.9627911, 0.8117647, 1, 0, 1,
-0.8301146, -0.2662099, -1.510487, 0.8078431, 1, 0, 1,
-0.8294401, 0.1716939, -1.347074, 0.8, 1, 0, 1,
-0.8241627, 0.1229984, -0.9689796, 0.7921569, 1, 0, 1,
-0.8218751, -0.4455474, -2.48162, 0.7882353, 1, 0, 1,
-0.8215811, -0.2421267, -1.619665, 0.7803922, 1, 0, 1,
-0.8188656, -0.9891607, -2.972191, 0.7764706, 1, 0, 1,
-0.8168614, 0.6614795, -0.6763309, 0.7686275, 1, 0, 1,
-0.8002238, 1.155992, -2.92905, 0.7647059, 1, 0, 1,
-0.7831551, -0.1854395, -1.615761, 0.7568628, 1, 0, 1,
-0.7813864, 0.4904843, -1.574072, 0.7529412, 1, 0, 1,
-0.7806799, 0.9505937, -1.277481, 0.7450981, 1, 0, 1,
-0.7787685, 2.292251, -0.08369926, 0.7411765, 1, 0, 1,
-0.7723241, -0.9791504, -0.6852435, 0.7333333, 1, 0, 1,
-0.7701828, 0.1837086, 1.058586, 0.7294118, 1, 0, 1,
-0.7681189, 0.6425183, -1.634158, 0.7215686, 1, 0, 1,
-0.7605369, 0.1286856, -1.829406, 0.7176471, 1, 0, 1,
-0.7577938, -1.288363, -2.363842, 0.7098039, 1, 0, 1,
-0.7532406, 1.429728, -0.05175536, 0.7058824, 1, 0, 1,
-0.7455269, -1.314178, -1.1606, 0.6980392, 1, 0, 1,
-0.7344765, -0.5195745, -2.398056, 0.6901961, 1, 0, 1,
-0.7338867, -1.239237, -2.603657, 0.6862745, 1, 0, 1,
-0.7317215, -0.6184172, -3.774806, 0.6784314, 1, 0, 1,
-0.7303602, 0.6976775, -0.4599806, 0.6745098, 1, 0, 1,
-0.7261828, -0.6667038, -2.534478, 0.6666667, 1, 0, 1,
-0.7236417, 0.6401006, -2.178638, 0.6627451, 1, 0, 1,
-0.7220994, -0.3144589, -1.861179, 0.654902, 1, 0, 1,
-0.7197842, -1.102263, -2.788234, 0.6509804, 1, 0, 1,
-0.7091713, -1.062849, -4.57144, 0.6431373, 1, 0, 1,
-0.7090425, 0.7035332, -1.118629, 0.6392157, 1, 0, 1,
-0.7036082, 0.6839427, -1.939753, 0.6313726, 1, 0, 1,
-0.7019532, -0.6924949, -3.742503, 0.627451, 1, 0, 1,
-0.7002491, -0.3018458, -1.77338, 0.6196079, 1, 0, 1,
-0.6989269, -0.830707, -1.794797, 0.6156863, 1, 0, 1,
-0.6975245, -2.086328, -3.283552, 0.6078432, 1, 0, 1,
-0.6897491, 1.119246, -0.7429786, 0.6039216, 1, 0, 1,
-0.6890007, 0.863242, -0.8129991, 0.5960785, 1, 0, 1,
-0.676299, 1.228049, -1.319643, 0.5882353, 1, 0, 1,
-0.6755486, 0.2183345, -0.6565369, 0.5843138, 1, 0, 1,
-0.6736073, -0.2286317, -1.226199, 0.5764706, 1, 0, 1,
-0.6717921, -1.366019, -2.791655, 0.572549, 1, 0, 1,
-0.6655163, -1.518194, -2.140659, 0.5647059, 1, 0, 1,
-0.6598516, 0.5748618, 0.3966831, 0.5607843, 1, 0, 1,
-0.658362, 0.2365867, -0.2732254, 0.5529412, 1, 0, 1,
-0.6556444, 0.4304635, 0.3649256, 0.5490196, 1, 0, 1,
-0.652614, 0.45064, -0.2382415, 0.5411765, 1, 0, 1,
-0.6498398, 1.660842, -0.7523496, 0.5372549, 1, 0, 1,
-0.6468287, -0.6184575, -1.608398, 0.5294118, 1, 0, 1,
-0.6402121, 0.4006658, -1.332971, 0.5254902, 1, 0, 1,
-0.6318438, 1.44551, 1.073055, 0.5176471, 1, 0, 1,
-0.6238758, 0.4406681, 0.281201, 0.5137255, 1, 0, 1,
-0.6218855, 0.8845823, -0.2129368, 0.5058824, 1, 0, 1,
-0.6217237, 1.10882, -2.3877, 0.5019608, 1, 0, 1,
-0.6194881, 0.004546276, -2.17762, 0.4941176, 1, 0, 1,
-0.6179712, 0.5688797, -2.691445, 0.4862745, 1, 0, 1,
-0.612509, -0.4185629, -2.884774, 0.4823529, 1, 0, 1,
-0.6113529, 0.3951762, -0.4278812, 0.4745098, 1, 0, 1,
-0.6105849, 0.5832031, -0.689994, 0.4705882, 1, 0, 1,
-0.6032711, -2.55827, -3.991203, 0.4627451, 1, 0, 1,
-0.6017712, 1.601325, 0.8146181, 0.4588235, 1, 0, 1,
-0.6016914, 0.7118447, 1.405349, 0.4509804, 1, 0, 1,
-0.6015588, 0.03307143, -0.3399212, 0.4470588, 1, 0, 1,
-0.598963, -0.2700739, -2.963732, 0.4392157, 1, 0, 1,
-0.5949467, -1.366732, -2.746319, 0.4352941, 1, 0, 1,
-0.5941814, -0.7075376, -4.041464, 0.427451, 1, 0, 1,
-0.5901902, -0.9927734, -3.001989, 0.4235294, 1, 0, 1,
-0.5892487, 0.1588875, -0.4502544, 0.4156863, 1, 0, 1,
-0.5871572, -1.028231, -2.65574, 0.4117647, 1, 0, 1,
-0.5839194, 0.7772265, -1.662157, 0.4039216, 1, 0, 1,
-0.5805498, 0.3412046, -1.144373, 0.3960784, 1, 0, 1,
-0.5805067, -0.1166222, -0.724368, 0.3921569, 1, 0, 1,
-0.5758086, 0.7198442, -1.348169, 0.3843137, 1, 0, 1,
-0.5753062, 1.409407, -2.585719, 0.3803922, 1, 0, 1,
-0.5739623, -1.332388, -2.448807, 0.372549, 1, 0, 1,
-0.5726056, -0.9738631, -0.965825, 0.3686275, 1, 0, 1,
-0.571283, 0.1194968, -3.444714, 0.3607843, 1, 0, 1,
-0.5685927, 0.2176784, -1.671985, 0.3568628, 1, 0, 1,
-0.5644731, -0.6197271, -1.152204, 0.3490196, 1, 0, 1,
-0.5550356, -0.526748, -3.635962, 0.345098, 1, 0, 1,
-0.5520906, 0.05058787, -1.153574, 0.3372549, 1, 0, 1,
-0.5465933, 1.443972, -1.214685, 0.3333333, 1, 0, 1,
-0.5450537, -0.09275194, -1.626162, 0.3254902, 1, 0, 1,
-0.542318, -0.9476323, -2.906984, 0.3215686, 1, 0, 1,
-0.5386181, 0.3753901, -0.6972746, 0.3137255, 1, 0, 1,
-0.5318597, -0.2327198, -2.977644, 0.3098039, 1, 0, 1,
-0.5286465, 0.9285296, -1.86249, 0.3019608, 1, 0, 1,
-0.5276741, 1.711006, -0.8632792, 0.2941177, 1, 0, 1,
-0.5261063, -0.06752272, -2.441957, 0.2901961, 1, 0, 1,
-0.5240404, 0.355423, -1.867229, 0.282353, 1, 0, 1,
-0.5189044, 0.216443, 0.04276453, 0.2784314, 1, 0, 1,
-0.5117344, -0.2010073, -0.2573541, 0.2705882, 1, 0, 1,
-0.511227, 0.6584137, 0.3955836, 0.2666667, 1, 0, 1,
-0.5106596, -0.03493824, -1.299432, 0.2588235, 1, 0, 1,
-0.5104623, 0.07768422, -0.05445604, 0.254902, 1, 0, 1,
-0.5080971, -1.761007, -3.05442, 0.2470588, 1, 0, 1,
-0.5067905, -3.327215, -1.82944, 0.2431373, 1, 0, 1,
-0.506487, 1.670288, 0.547591, 0.2352941, 1, 0, 1,
-0.5033632, -0.4065347, -2.974337, 0.2313726, 1, 0, 1,
-0.5020771, -0.5696731, -3.071998, 0.2235294, 1, 0, 1,
-0.4990626, -1.307086, -1.300623, 0.2196078, 1, 0, 1,
-0.4981484, -0.6956412, -1.580659, 0.2117647, 1, 0, 1,
-0.4950532, -0.4840296, -2.196444, 0.2078431, 1, 0, 1,
-0.4938148, -0.8979592, -2.438912, 0.2, 1, 0, 1,
-0.4930745, -1.045457, -2.869961, 0.1921569, 1, 0, 1,
-0.4916224, 0.4863154, -0.836974, 0.1882353, 1, 0, 1,
-0.4885862, 1.334428, -1.545742, 0.1803922, 1, 0, 1,
-0.4883768, -0.7653454, -2.504403, 0.1764706, 1, 0, 1,
-0.4871316, -0.4412238, -1.579777, 0.1686275, 1, 0, 1,
-0.4865052, 0.5834492, -0.6762818, 0.1647059, 1, 0, 1,
-0.484443, 0.4629989, -0.6747991, 0.1568628, 1, 0, 1,
-0.4776157, -0.8596255, -3.20298, 0.1529412, 1, 0, 1,
-0.4645213, -1.464456, -2.090838, 0.145098, 1, 0, 1,
-0.4574748, -0.1257568, -2.796155, 0.1411765, 1, 0, 1,
-0.4457282, 0.2135965, -2.545935, 0.1333333, 1, 0, 1,
-0.4440552, -0.07796331, -0.6934804, 0.1294118, 1, 0, 1,
-0.4438368, -0.4185903, -1.738184, 0.1215686, 1, 0, 1,
-0.4394873, 0.8552196, -0.282322, 0.1176471, 1, 0, 1,
-0.437693, 0.1388045, -0.686616, 0.1098039, 1, 0, 1,
-0.4372197, -1.982595, -2.810341, 0.1058824, 1, 0, 1,
-0.4318222, -0.6893818, -1.822774, 0.09803922, 1, 0, 1,
-0.4314272, -0.8659033, -2.988857, 0.09019608, 1, 0, 1,
-0.4298497, 0.3879358, -0.3101865, 0.08627451, 1, 0, 1,
-0.4261757, -0.3171459, 0.1002219, 0.07843138, 1, 0, 1,
-0.423085, 0.32107, -1.17536, 0.07450981, 1, 0, 1,
-0.4184773, -0.1405087, -2.265878, 0.06666667, 1, 0, 1,
-0.4114672, 0.9936172, -1.621646, 0.0627451, 1, 0, 1,
-0.411146, -0.8082716, -2.153928, 0.05490196, 1, 0, 1,
-0.4063917, -0.7046856, -1.690812, 0.05098039, 1, 0, 1,
-0.405549, 1.040975, -0.7932211, 0.04313726, 1, 0, 1,
-0.4033071, -1.149542, -3.311645, 0.03921569, 1, 0, 1,
-0.3987632, -0.5947534, -3.315544, 0.03137255, 1, 0, 1,
-0.3832798, -0.5681937, -2.648885, 0.02745098, 1, 0, 1,
-0.3824957, 0.5270789, -0.368173, 0.01960784, 1, 0, 1,
-0.3821002, 0.9293717, -0.2203513, 0.01568628, 1, 0, 1,
-0.3795587, -0.1591941, -3.269715, 0.007843138, 1, 0, 1,
-0.3769093, -0.526091, -3.410298, 0.003921569, 1, 0, 1,
-0.3762529, -0.8469042, -2.870244, 0, 1, 0.003921569, 1,
-0.3755281, 1.119297, 0.4979619, 0, 1, 0.01176471, 1,
-0.3693784, 0.6260678, -1.291656, 0, 1, 0.01568628, 1,
-0.3658442, -1.092985, -2.342999, 0, 1, 0.02352941, 1,
-0.3654664, -0.3373755, -1.439998, 0, 1, 0.02745098, 1,
-0.3633069, -0.2748258, -2.337936, 0, 1, 0.03529412, 1,
-0.3580222, -0.4807607, -2.593731, 0, 1, 0.03921569, 1,
-0.357649, -0.1170015, -2.666273, 0, 1, 0.04705882, 1,
-0.3538985, -0.7124457, -1.909134, 0, 1, 0.05098039, 1,
-0.353488, -0.1775968, -2.719096, 0, 1, 0.05882353, 1,
-0.353312, -1.802432, -1.743483, 0, 1, 0.0627451, 1,
-0.3492723, -0.4525049, -4.133031, 0, 1, 0.07058824, 1,
-0.3439232, 0.02960452, -1.750317, 0, 1, 0.07450981, 1,
-0.3428782, 0.2581872, -1.866679, 0, 1, 0.08235294, 1,
-0.3294569, -0.6302038, -2.778431, 0, 1, 0.08627451, 1,
-0.3271805, -1.273463, -2.787274, 0, 1, 0.09411765, 1,
-0.3188891, 0.04046999, -0.7021411, 0, 1, 0.1019608, 1,
-0.318625, -0.08199676, -2.004475, 0, 1, 0.1058824, 1,
-0.3172175, -0.2960612, -1.005677, 0, 1, 0.1137255, 1,
-0.315289, -0.1303299, -2.370304, 0, 1, 0.1176471, 1,
-0.309553, -1.299401, -3.731823, 0, 1, 0.1254902, 1,
-0.3091704, 1.505445, 0.627174, 0, 1, 0.1294118, 1,
-0.3087268, 1.725335, 0.3872928, 0, 1, 0.1372549, 1,
-0.3086119, 1.806815, -0.1641642, 0, 1, 0.1411765, 1,
-0.3083864, -0.3092667, -2.280523, 0, 1, 0.1490196, 1,
-0.304564, -0.2810268, -2.14546, 0, 1, 0.1529412, 1,
-0.2987769, 0.02984283, -2.967275, 0, 1, 0.1607843, 1,
-0.2987116, 1.198774, -2.429341, 0, 1, 0.1647059, 1,
-0.2978448, -1.021888, -4.424576, 0, 1, 0.172549, 1,
-0.2974774, 0.8070104, -2.041506, 0, 1, 0.1764706, 1,
-0.2963513, -2.077008, -2.963137, 0, 1, 0.1843137, 1,
-0.2955522, 1.876729, 0.4211457, 0, 1, 0.1882353, 1,
-0.2821042, 0.7776754, 0.0226678, 0, 1, 0.1960784, 1,
-0.2819417, -0.5326846, -3.020081, 0, 1, 0.2039216, 1,
-0.2762277, -1.187251, -2.064067, 0, 1, 0.2078431, 1,
-0.2745948, 0.2382611, -2.920032, 0, 1, 0.2156863, 1,
-0.273288, -0.1768461, -2.33432, 0, 1, 0.2196078, 1,
-0.2714154, -0.6664936, -4.044238, 0, 1, 0.227451, 1,
-0.2710246, 0.9202862, 0.2563372, 0, 1, 0.2313726, 1,
-0.2657602, 0.02393309, -0.6892686, 0, 1, 0.2392157, 1,
-0.2652218, -3.047756, -3.236253, 0, 1, 0.2431373, 1,
-0.2644748, 0.4373463, 1.23013, 0, 1, 0.2509804, 1,
-0.2614037, 1.378672, -0.395174, 0, 1, 0.254902, 1,
-0.2613535, 0.7471045, -0.7278229, 0, 1, 0.2627451, 1,
-0.2604165, 0.2465072, -2.835024, 0, 1, 0.2666667, 1,
-0.2588406, 0.542565, -1.271929, 0, 1, 0.2745098, 1,
-0.2576951, -1.15513, -3.330567, 0, 1, 0.2784314, 1,
-0.2534789, 1.263198, -0.2108111, 0, 1, 0.2862745, 1,
-0.2506246, -0.4014177, -2.407274, 0, 1, 0.2901961, 1,
-0.2476057, 0.174337, -2.129787, 0, 1, 0.2980392, 1,
-0.2452082, 1.05198, 1.121109, 0, 1, 0.3058824, 1,
-0.2423575, -0.2468062, -2.193457, 0, 1, 0.3098039, 1,
-0.2420897, -0.5162088, -2.372033, 0, 1, 0.3176471, 1,
-0.2367247, 0.06217466, -0.184546, 0, 1, 0.3215686, 1,
-0.2286999, 0.9714246, 0.45259, 0, 1, 0.3294118, 1,
-0.2273158, 0.4397419, -0.6636316, 0, 1, 0.3333333, 1,
-0.2248782, -0.4060647, -3.706719, 0, 1, 0.3411765, 1,
-0.2238136, -1.192995, -2.066746, 0, 1, 0.345098, 1,
-0.2216528, -0.2301845, -1.861565, 0, 1, 0.3529412, 1,
-0.2208067, 1.242465, 1.272035, 0, 1, 0.3568628, 1,
-0.220413, 0.2187919, -0.4370392, 0, 1, 0.3647059, 1,
-0.2183255, -0.02642315, -3.067996, 0, 1, 0.3686275, 1,
-0.2181227, 0.568951, 0.2024533, 0, 1, 0.3764706, 1,
-0.2169944, 0.3626076, 0.0789196, 0, 1, 0.3803922, 1,
-0.2169274, 1.113418, -0.4101377, 0, 1, 0.3882353, 1,
-0.2160763, 1.419136, -0.5733057, 0, 1, 0.3921569, 1,
-0.2156933, 1.053898, 0.5700642, 0, 1, 0.4, 1,
-0.2028478, -0.4991302, -1.913644, 0, 1, 0.4078431, 1,
-0.1953869, 0.008461718, -2.727328, 0, 1, 0.4117647, 1,
-0.1930198, -0.5312976, -4.201126, 0, 1, 0.4196078, 1,
-0.1866702, 0.4182459, -0.2616297, 0, 1, 0.4235294, 1,
-0.1855418, 1.816395, 0.0649879, 0, 1, 0.4313726, 1,
-0.1854708, 0.06945553, -1.970081, 0, 1, 0.4352941, 1,
-0.1854012, 0.5013445, -2.525341, 0, 1, 0.4431373, 1,
-0.1827263, 0.04007737, -0.9268519, 0, 1, 0.4470588, 1,
-0.182607, -0.9301193, -3.880403, 0, 1, 0.454902, 1,
-0.1801052, -0.7436556, -2.312504, 0, 1, 0.4588235, 1,
-0.1755013, -0.05081966, -3.221181, 0, 1, 0.4666667, 1,
-0.1723194, 1.800738, -0.4861226, 0, 1, 0.4705882, 1,
-0.1696406, 0.323361, 0.8822182, 0, 1, 0.4784314, 1,
-0.1608329, -0.498954, -3.474449, 0, 1, 0.4823529, 1,
-0.1560523, -0.7637751, -3.843956, 0, 1, 0.4901961, 1,
-0.1546275, 0.4981033, 1.467911, 0, 1, 0.4941176, 1,
-0.1517958, 0.2025816, -0.9021583, 0, 1, 0.5019608, 1,
-0.1510451, 1.644406, 0.8513648, 0, 1, 0.509804, 1,
-0.1480485, -1.100764, -2.346661, 0, 1, 0.5137255, 1,
-0.1417856, 1.435451, 1.531747, 0, 1, 0.5215687, 1,
-0.1409544, 0.4309075, -1.233563, 0, 1, 0.5254902, 1,
-0.1383807, 1.375178, -1.24436, 0, 1, 0.5333334, 1,
-0.1365212, 0.8133421, -1.114763, 0, 1, 0.5372549, 1,
-0.1352241, -0.8273339, -3.860821, 0, 1, 0.5450981, 1,
-0.1345449, -2.410704, -2.754638, 0, 1, 0.5490196, 1,
-0.1337327, -0.7867744, -5.768678, 0, 1, 0.5568628, 1,
-0.1332248, -0.84465, -2.489145, 0, 1, 0.5607843, 1,
-0.1294794, -0.1763321, -3.819277, 0, 1, 0.5686275, 1,
-0.1282403, -0.990435, -3.91486, 0, 1, 0.572549, 1,
-0.1267935, 0.9564512, -2.658845, 0, 1, 0.5803922, 1,
-0.123299, -0.114537, -2.425297, 0, 1, 0.5843138, 1,
-0.1196167, -0.7626788, -1.854927, 0, 1, 0.5921569, 1,
-0.1134251, 1.029434, -1.037291, 0, 1, 0.5960785, 1,
-0.1131794, -0.8733584, -4.381976, 0, 1, 0.6039216, 1,
-0.1082852, 0.00511893, -2.129038, 0, 1, 0.6117647, 1,
-0.1056434, 0.2613262, 0.23567, 0, 1, 0.6156863, 1,
-0.1052796, 0.9643264, -1.022829, 0, 1, 0.6235294, 1,
-0.1033843, 0.4827437, -0.5881783, 0, 1, 0.627451, 1,
-0.09935512, 0.6129976, 0.7453123, 0, 1, 0.6352941, 1,
-0.09927108, -0.8189822, -3.971483, 0, 1, 0.6392157, 1,
-0.0984855, 0.2379636, -0.003908028, 0, 1, 0.6470588, 1,
-0.09829701, -1.682478, -2.202251, 0, 1, 0.6509804, 1,
-0.0967032, 2.074807, -0.3961949, 0, 1, 0.6588235, 1,
-0.09006105, 1.067704, 0.2318082, 0, 1, 0.6627451, 1,
-0.08931401, 1.991125, 0.3152435, 0, 1, 0.6705883, 1,
-0.08884215, 0.1003669, 0.3111385, 0, 1, 0.6745098, 1,
-0.08509777, -0.3539216, -4.454476, 0, 1, 0.682353, 1,
-0.08058911, 1.040457, -0.07557432, 0, 1, 0.6862745, 1,
-0.07976417, 1.947246, 0.4868683, 0, 1, 0.6941177, 1,
-0.07352984, -0.3911017, -1.562186, 0, 1, 0.7019608, 1,
-0.07255442, -0.557004, -3.02966, 0, 1, 0.7058824, 1,
-0.07199313, -0.3976463, -4.512893, 0, 1, 0.7137255, 1,
-0.06898295, -0.207924, -1.057183, 0, 1, 0.7176471, 1,
-0.06874271, 0.9910504, -0.2024755, 0, 1, 0.7254902, 1,
-0.06715796, 0.4949744, 0.902614, 0, 1, 0.7294118, 1,
-0.06262788, -2.319851, -2.482252, 0, 1, 0.7372549, 1,
-0.06022665, 1.117251, -0.670054, 0, 1, 0.7411765, 1,
-0.0590652, -0.7740771, -1.794781, 0, 1, 0.7490196, 1,
-0.05704629, -0.08643705, -0.6721216, 0, 1, 0.7529412, 1,
-0.05420957, 0.8185158, 0.859755, 0, 1, 0.7607843, 1,
-0.04904191, -1.387479, -2.655546, 0, 1, 0.7647059, 1,
-0.04576104, -1.376459, -1.973293, 0, 1, 0.772549, 1,
-0.04564475, 0.9084032, 0.6908593, 0, 1, 0.7764706, 1,
-0.04411523, -0.3878826, -3.456984, 0, 1, 0.7843137, 1,
-0.03994036, 1.167783, -0.7994316, 0, 1, 0.7882353, 1,
-0.03655948, -1.266246, -4.574104, 0, 1, 0.7960784, 1,
-0.0316305, 1.176084, 0.6627457, 0, 1, 0.8039216, 1,
-0.03129717, -0.462292, -3.321649, 0, 1, 0.8078431, 1,
-0.02750845, 0.3598839, -0.1348024, 0, 1, 0.8156863, 1,
-0.02347189, -0.09444299, -2.601497, 0, 1, 0.8196079, 1,
-0.02122588, 0.2756242, 0.1439322, 0, 1, 0.827451, 1,
-0.02105056, -0.4097996, -5.014447, 0, 1, 0.8313726, 1,
-0.01847812, 1.053898, 0.9519764, 0, 1, 0.8392157, 1,
-0.01797352, -0.002915817, -2.089828, 0, 1, 0.8431373, 1,
-0.01770352, -0.5732781, -3.082784, 0, 1, 0.8509804, 1,
-0.01659807, -0.2011093, -1.847028, 0, 1, 0.854902, 1,
-0.01503019, -0.08153635, -2.346863, 0, 1, 0.8627451, 1,
-0.01184483, -1.066075, -4.066775, 0, 1, 0.8666667, 1,
-0.01113651, -0.5611717, -1.990319, 0, 1, 0.8745098, 1,
-0.007379523, 0.4376072, 0.6987593, 0, 1, 0.8784314, 1,
-0.004951289, 0.9466645, -0.1473024, 0, 1, 0.8862745, 1,
-0.004567039, -0.5408102, -1.695252, 0, 1, 0.8901961, 1,
-0.002957608, -0.1186673, -1.901297, 0, 1, 0.8980392, 1,
0.002440451, -1.408779, 4.649092, 0, 1, 0.9058824, 1,
0.003712759, -1.632437, 3.068007, 0, 1, 0.9098039, 1,
0.004093986, 0.7505711, 1.613257, 0, 1, 0.9176471, 1,
0.01240648, 1.58644, -0.5972903, 0, 1, 0.9215686, 1,
0.01999742, 1.079932, 0.2781532, 0, 1, 0.9294118, 1,
0.02560937, -0.3430207, 2.948713, 0, 1, 0.9333333, 1,
0.02829905, -0.1153777, 3.450398, 0, 1, 0.9411765, 1,
0.03047703, 1.671451, -0.9145914, 0, 1, 0.945098, 1,
0.03481283, 0.2411298, -0.2402345, 0, 1, 0.9529412, 1,
0.04058851, 0.216382, 0.2730692, 0, 1, 0.9568627, 1,
0.04173537, 0.5136961, -0.4084468, 0, 1, 0.9647059, 1,
0.04498989, -0.1648837, 2.533252, 0, 1, 0.9686275, 1,
0.04603145, 1.118956, 0.762709, 0, 1, 0.9764706, 1,
0.04659667, -0.5331626, 3.431988, 0, 1, 0.9803922, 1,
0.04965384, 1.69896, -0.6157409, 0, 1, 0.9882353, 1,
0.05236233, 0.6269867, -0.3411868, 0, 1, 0.9921569, 1,
0.05267653, 0.1250258, 1.325741, 0, 1, 1, 1,
0.0534452, -0.8149786, 4.521046, 0, 0.9921569, 1, 1,
0.055694, -0.1265529, 3.311879, 0, 0.9882353, 1, 1,
0.0600557, -0.9253471, 1.451895, 0, 0.9803922, 1, 1,
0.07127323, -1.456235, 2.739256, 0, 0.9764706, 1, 1,
0.07183376, 0.1264154, 0.1092965, 0, 0.9686275, 1, 1,
0.07275217, -1.135476, 3.804238, 0, 0.9647059, 1, 1,
0.07354527, -1.661357, 4.684455, 0, 0.9568627, 1, 1,
0.07482559, -0.09385391, 1.487347, 0, 0.9529412, 1, 1,
0.07503682, -0.2273285, 2.695256, 0, 0.945098, 1, 1,
0.08082498, -0.5361775, 4.22122, 0, 0.9411765, 1, 1,
0.0848491, 1.329493, 0.02704708, 0, 0.9333333, 1, 1,
0.08486717, -0.4538521, 3.653115, 0, 0.9294118, 1, 1,
0.08541099, 3.496021, -0.2486386, 0, 0.9215686, 1, 1,
0.08628476, 0.3439677, 1.054983, 0, 0.9176471, 1, 1,
0.09452513, -0.7758561, 3.147288, 0, 0.9098039, 1, 1,
0.1019096, 0.6243114, 0.460086, 0, 0.9058824, 1, 1,
0.1026236, -0.8208295, 2.383336, 0, 0.8980392, 1, 1,
0.1032822, -0.1566383, 3.455153, 0, 0.8901961, 1, 1,
0.1056748, 0.3586893, 1.24241, 0, 0.8862745, 1, 1,
0.1106256, 0.443653, 1.231431, 0, 0.8784314, 1, 1,
0.1108519, -1.613833, 2.907416, 0, 0.8745098, 1, 1,
0.1128492, 0.4307537, -0.4477265, 0, 0.8666667, 1, 1,
0.1128547, 0.7597895, -0.5664247, 0, 0.8627451, 1, 1,
0.1139585, -1.106222, 4.466336, 0, 0.854902, 1, 1,
0.1147588, -0.08991299, 2.69882, 0, 0.8509804, 1, 1,
0.1148032, 1.124907, -0.1033816, 0, 0.8431373, 1, 1,
0.1158856, -0.5176284, 2.769342, 0, 0.8392157, 1, 1,
0.11673, 1.687176, 0.9683386, 0, 0.8313726, 1, 1,
0.1179057, -1.234214, 2.573122, 0, 0.827451, 1, 1,
0.1182934, -0.2058655, 3.828881, 0, 0.8196079, 1, 1,
0.1191745, 0.795841, 0.8193361, 0, 0.8156863, 1, 1,
0.1192469, -0.9647138, 3.002868, 0, 0.8078431, 1, 1,
0.1196643, -2.624024, 2.310666, 0, 0.8039216, 1, 1,
0.1253264, 0.1807187, 0.6591334, 0, 0.7960784, 1, 1,
0.1301247, 0.3453493, 1.492686, 0, 0.7882353, 1, 1,
0.1310168, -0.1718353, 4.508119, 0, 0.7843137, 1, 1,
0.1323127, -0.5981527, 3.15713, 0, 0.7764706, 1, 1,
0.1340973, 1.606188, 0.6226119, 0, 0.772549, 1, 1,
0.1347533, -0.7422653, 2.862892, 0, 0.7647059, 1, 1,
0.1352399, -0.4679881, 1.504021, 0, 0.7607843, 1, 1,
0.1354039, -0.3572041, 2.755037, 0, 0.7529412, 1, 1,
0.1385227, 0.7743185, 1.98745, 0, 0.7490196, 1, 1,
0.143247, 0.1015611, 1.211076, 0, 0.7411765, 1, 1,
0.144079, -1.048364, 4.475151, 0, 0.7372549, 1, 1,
0.145085, -1.310572, 3.017784, 0, 0.7294118, 1, 1,
0.1491274, -1.185074, 2.325846, 0, 0.7254902, 1, 1,
0.1500854, -0.1817597, 1.853158, 0, 0.7176471, 1, 1,
0.1525913, 0.5437946, 0.3391855, 0, 0.7137255, 1, 1,
0.1550803, -0.2019502, 3.089935, 0, 0.7058824, 1, 1,
0.1601904, -0.357422, 4.832894, 0, 0.6980392, 1, 1,
0.1614874, -0.08483352, 0.8714618, 0, 0.6941177, 1, 1,
0.1630206, -1.273698, 2.216452, 0, 0.6862745, 1, 1,
0.1632248, 0.2229869, -1.544619, 0, 0.682353, 1, 1,
0.1659856, 0.7004303, 0.1373061, 0, 0.6745098, 1, 1,
0.1734179, -0.6512824, 2.329284, 0, 0.6705883, 1, 1,
0.1746758, -0.0815229, 1.421753, 0, 0.6627451, 1, 1,
0.1811898, 0.04165502, 1.310255, 0, 0.6588235, 1, 1,
0.1851045, -0.3229807, 0.7596026, 0, 0.6509804, 1, 1,
0.1858549, 0.5426242, -0.4675483, 0, 0.6470588, 1, 1,
0.1865161, -0.4445446, 4.260252, 0, 0.6392157, 1, 1,
0.1880227, -0.2260007, 4.403883, 0, 0.6352941, 1, 1,
0.1921455, -0.6108159, 2.489353, 0, 0.627451, 1, 1,
0.1946818, -0.09417698, 3.312102, 0, 0.6235294, 1, 1,
0.1950114, -0.1793383, 1.554243, 0, 0.6156863, 1, 1,
0.1962092, 0.1526642, 0.8225182, 0, 0.6117647, 1, 1,
0.2058308, -0.4731126, 0.8276895, 0, 0.6039216, 1, 1,
0.2083044, -0.1803241, 2.028183, 0, 0.5960785, 1, 1,
0.2135628, 2.270787, -0.3051089, 0, 0.5921569, 1, 1,
0.2146461, -0.2447906, 2.085094, 0, 0.5843138, 1, 1,
0.2147574, -1.52709, 1.067392, 0, 0.5803922, 1, 1,
0.2150311, -0.453059, 1.241286, 0, 0.572549, 1, 1,
0.2174445, -1.371235, 3.229758, 0, 0.5686275, 1, 1,
0.2177791, -1.032328, 2.091439, 0, 0.5607843, 1, 1,
0.2183573, 0.02431897, 1.740581, 0, 0.5568628, 1, 1,
0.2198737, 0.09611525, -0.1947102, 0, 0.5490196, 1, 1,
0.2207953, 0.02875631, 0.8337076, 0, 0.5450981, 1, 1,
0.2254739, 1.08375, 0.7001637, 0, 0.5372549, 1, 1,
0.2269555, 0.08556803, -0.4323498, 0, 0.5333334, 1, 1,
0.2313844, 0.7696047, 0.3565253, 0, 0.5254902, 1, 1,
0.2369137, 1.457563, 0.2099852, 0, 0.5215687, 1, 1,
0.2395842, 0.9294531, 0.09541117, 0, 0.5137255, 1, 1,
0.2416719, -1.671763, 2.868389, 0, 0.509804, 1, 1,
0.2435757, 2.416275, -2.128834, 0, 0.5019608, 1, 1,
0.2438899, 0.7921896, -1.46901, 0, 0.4941176, 1, 1,
0.245631, 0.9293143, 2.145133, 0, 0.4901961, 1, 1,
0.2466611, -0.8998322, 3.001222, 0, 0.4823529, 1, 1,
0.2514464, 0.6608132, 0.2943392, 0, 0.4784314, 1, 1,
0.2525451, -0.07657268, 1.144696, 0, 0.4705882, 1, 1,
0.253815, 1.970277, -0.7638756, 0, 0.4666667, 1, 1,
0.2559091, -0.8681983, 2.955854, 0, 0.4588235, 1, 1,
0.2599778, 0.4051561, 2.453103, 0, 0.454902, 1, 1,
0.2602133, 0.4797669, 1.974336, 0, 0.4470588, 1, 1,
0.2611691, -0.05252445, 0.8209162, 0, 0.4431373, 1, 1,
0.2658376, -0.5129246, 2.11593, 0, 0.4352941, 1, 1,
0.2707117, -0.6830502, 2.205527, 0, 0.4313726, 1, 1,
0.2727984, 1.062421, 1.027248, 0, 0.4235294, 1, 1,
0.2740407, 0.4176801, 1.763912, 0, 0.4196078, 1, 1,
0.2743027, -0.2460858, 2.533357, 0, 0.4117647, 1, 1,
0.277176, -0.8605713, 2.340581, 0, 0.4078431, 1, 1,
0.2782879, -0.7692016, 5.041226, 0, 0.4, 1, 1,
0.2797789, 0.8039426, 0.6816209, 0, 0.3921569, 1, 1,
0.2832061, 0.2092, 1.326325, 0, 0.3882353, 1, 1,
0.2858795, -1.649787, 3.714839, 0, 0.3803922, 1, 1,
0.2881992, -1.1891, 2.977333, 0, 0.3764706, 1, 1,
0.2919358, -0.2408485, 3.344249, 0, 0.3686275, 1, 1,
0.295543, -0.5840755, 4.660234, 0, 0.3647059, 1, 1,
0.2963955, 0.2920385, 0.4075919, 0, 0.3568628, 1, 1,
0.2980695, -0.4820967, 2.787496, 0, 0.3529412, 1, 1,
0.3150661, 0.8238997, 1.894811, 0, 0.345098, 1, 1,
0.3205428, -0.8074206, 3.616524, 0, 0.3411765, 1, 1,
0.3209771, 0.6080559, -0.9159057, 0, 0.3333333, 1, 1,
0.3213777, 1.343522, 0.8582166, 0, 0.3294118, 1, 1,
0.3227379, -1.213978, 2.199653, 0, 0.3215686, 1, 1,
0.3237098, -0.5280247, 4.184525, 0, 0.3176471, 1, 1,
0.3240177, -0.7235453, 4.232774, 0, 0.3098039, 1, 1,
0.3255306, -2.642764, 3.71117, 0, 0.3058824, 1, 1,
0.326436, 0.1893307, -0.2429833, 0, 0.2980392, 1, 1,
0.3283177, -0.4983076, 5.19016, 0, 0.2901961, 1, 1,
0.3300233, -0.6130636, 3.72428, 0, 0.2862745, 1, 1,
0.3354441, -1.111655, 2.412126, 0, 0.2784314, 1, 1,
0.3372158, 2.175824, -0.6093704, 0, 0.2745098, 1, 1,
0.3394089, -0.05458391, 2.127813, 0, 0.2666667, 1, 1,
0.3417846, -0.5063229, 3.16719, 0, 0.2627451, 1, 1,
0.3426233, -0.6738128, 2.157725, 0, 0.254902, 1, 1,
0.3426356, -0.4068021, 3.389502, 0, 0.2509804, 1, 1,
0.3464573, 1.77977, -0.1463695, 0, 0.2431373, 1, 1,
0.3475629, -1.056755, 1.804044, 0, 0.2392157, 1, 1,
0.3488409, -0.8861317, 4.05761, 0, 0.2313726, 1, 1,
0.3528264, -0.7927064, 2.609622, 0, 0.227451, 1, 1,
0.3547048, 0.3052737, 0.2029178, 0, 0.2196078, 1, 1,
0.3632756, 0.2800189, -0.4057595, 0, 0.2156863, 1, 1,
0.3667873, -1.287672, 2.953798, 0, 0.2078431, 1, 1,
0.3676838, 1.471624, 0.2660933, 0, 0.2039216, 1, 1,
0.3697023, -1.630344, 3.427162, 0, 0.1960784, 1, 1,
0.3709434, -1.182891, 1.462906, 0, 0.1882353, 1, 1,
0.3744524, -1.033214, 2.879724, 0, 0.1843137, 1, 1,
0.3760208, -1.262966, 2.507661, 0, 0.1764706, 1, 1,
0.3778951, -0.7428805, 3.037145, 0, 0.172549, 1, 1,
0.3823134, 2.150829, -2.857662, 0, 0.1647059, 1, 1,
0.3854003, 0.5804794, 0.315477, 0, 0.1607843, 1, 1,
0.3875901, -0.6230865, 2.556792, 0, 0.1529412, 1, 1,
0.3905528, 0.4256099, 0.6713484, 0, 0.1490196, 1, 1,
0.3910318, 1.111779, -0.4343128, 0, 0.1411765, 1, 1,
0.3929539, 1.350832, 0.1805767, 0, 0.1372549, 1, 1,
0.3954146, 1.445671, 0.9818041, 0, 0.1294118, 1, 1,
0.3962106, -0.241883, 1.382818, 0, 0.1254902, 1, 1,
0.3977008, 1.140162, 1.518944, 0, 0.1176471, 1, 1,
0.3987401, 0.1497201, 1.252274, 0, 0.1137255, 1, 1,
0.3997536, 0.2623211, 0.481998, 0, 0.1058824, 1, 1,
0.4080237, -0.2118712, 1.956248, 0, 0.09803922, 1, 1,
0.41076, 0.7033145, 0.006773461, 0, 0.09411765, 1, 1,
0.4108436, -0.3952965, 1.008076, 0, 0.08627451, 1, 1,
0.4175626, 0.316076, 1.42759, 0, 0.08235294, 1, 1,
0.4193858, 1.719883, -0.2429628, 0, 0.07450981, 1, 1,
0.4210214, 1.577703, 0.5471231, 0, 0.07058824, 1, 1,
0.4215391, 1.598584, 1.49549, 0, 0.0627451, 1, 1,
0.431815, 1.047889, 1.321218, 0, 0.05882353, 1, 1,
0.4346933, 0.5745872, 1.245346, 0, 0.05098039, 1, 1,
0.435678, 0.6523094, 0.484268, 0, 0.04705882, 1, 1,
0.4390881, 0.3536828, 0.07806461, 0, 0.03921569, 1, 1,
0.446201, 1.056537, 0.01963196, 0, 0.03529412, 1, 1,
0.4504762, -0.7615998, 3.0232, 0, 0.02745098, 1, 1,
0.4518306, -1.025997, 1.443949, 0, 0.02352941, 1, 1,
0.4571077, -0.08600413, 2.669693, 0, 0.01568628, 1, 1,
0.4612523, 1.355127, -0.4841292, 0, 0.01176471, 1, 1,
0.4666799, -1.47605, 2.426437, 0, 0.003921569, 1, 1,
0.4680731, 0.4495175, -0.5926111, 0.003921569, 0, 1, 1,
0.4684846, 0.6970441, 0.7826684, 0.007843138, 0, 1, 1,
0.4728408, -0.489423, 2.917661, 0.01568628, 0, 1, 1,
0.4745513, 0.7978538, 0.3739029, 0.01960784, 0, 1, 1,
0.4763857, -1.078776, 3.438747, 0.02745098, 0, 1, 1,
0.4789522, -2.068611, 2.727906, 0.03137255, 0, 1, 1,
0.4815217, 1.005502, 0.4458801, 0.03921569, 0, 1, 1,
0.4821316, 0.2760468, 1.980998, 0.04313726, 0, 1, 1,
0.4828688, 1.393953, 0.0322147, 0.05098039, 0, 1, 1,
0.4843506, 0.2788747, 0.8881578, 0.05490196, 0, 1, 1,
0.485666, 0.1624001, 2.768962, 0.0627451, 0, 1, 1,
0.4872658, -2.539416, 3.715542, 0.06666667, 0, 1, 1,
0.4922077, -1.602746, 2.50093, 0.07450981, 0, 1, 1,
0.4964263, 1.359407, -1.939792, 0.07843138, 0, 1, 1,
0.4989677, 0.2189396, 2.624941, 0.08627451, 0, 1, 1,
0.5045345, -1.236715, 2.590997, 0.09019608, 0, 1, 1,
0.5052227, 0.9067436, 0.0241532, 0.09803922, 0, 1, 1,
0.5055544, 1.337879, 0.4316207, 0.1058824, 0, 1, 1,
0.5106013, -0.335665, 3.439991, 0.1098039, 0, 1, 1,
0.5114433, 1.590364, -0.11814, 0.1176471, 0, 1, 1,
0.5129195, -0.566531, 2.332841, 0.1215686, 0, 1, 1,
0.5143796, -0.2037362, 1.357317, 0.1294118, 0, 1, 1,
0.5196252, 0.5180153, -0.6141211, 0.1333333, 0, 1, 1,
0.5196984, -0.4066283, 3.101172, 0.1411765, 0, 1, 1,
0.524498, 0.2485034, 0.4038047, 0.145098, 0, 1, 1,
0.5319262, -0.4962295, 2.637475, 0.1529412, 0, 1, 1,
0.5412596, 0.5232088, 1.838581, 0.1568628, 0, 1, 1,
0.542422, -1.67999, 3.731178, 0.1647059, 0, 1, 1,
0.5430297, -1.477439, 2.695398, 0.1686275, 0, 1, 1,
0.5451687, -1.478117, 1.580371, 0.1764706, 0, 1, 1,
0.5463286, -0.6337724, 4.220709, 0.1803922, 0, 1, 1,
0.5477909, -0.4135647, 3.131144, 0.1882353, 0, 1, 1,
0.5555753, 1.050822, -0.1215174, 0.1921569, 0, 1, 1,
0.5563042, -0.6125225, 1.341898, 0.2, 0, 1, 1,
0.5564794, 2.650893, -0.4900324, 0.2078431, 0, 1, 1,
0.5603244, -0.2340845, 3.06443, 0.2117647, 0, 1, 1,
0.5685604, -0.5961707, 1.571285, 0.2196078, 0, 1, 1,
0.5783592, -0.03342943, 1.534173, 0.2235294, 0, 1, 1,
0.5856866, 0.05679287, 1.662263, 0.2313726, 0, 1, 1,
0.5926714, -0.5969268, 3.317253, 0.2352941, 0, 1, 1,
0.593209, -1.132728, 1.999186, 0.2431373, 0, 1, 1,
0.6016225, 0.9850193, 1.46176, 0.2470588, 0, 1, 1,
0.6056866, 0.1955777, 0.7996632, 0.254902, 0, 1, 1,
0.6080893, 0.4878533, 1.384914, 0.2588235, 0, 1, 1,
0.611946, -0.1013843, -0.4219584, 0.2666667, 0, 1, 1,
0.6144108, -1.37425, 1.446249, 0.2705882, 0, 1, 1,
0.6162589, 2.621846, 0.2261353, 0.2784314, 0, 1, 1,
0.618385, -0.1845551, 3.734213, 0.282353, 0, 1, 1,
0.6185396, 1.494016, 0.5059158, 0.2901961, 0, 1, 1,
0.6219312, 0.6666811, 1.067307, 0.2941177, 0, 1, 1,
0.6224157, -0.6536173, 2.377079, 0.3019608, 0, 1, 1,
0.6228511, -0.04626134, 2.146032, 0.3098039, 0, 1, 1,
0.6229712, -0.7968794, 1.286651, 0.3137255, 0, 1, 1,
0.6244814, -1.117087, 3.122978, 0.3215686, 0, 1, 1,
0.6294266, -0.3484932, 4.030313, 0.3254902, 0, 1, 1,
0.6317165, -0.2813582, 1.768458, 0.3333333, 0, 1, 1,
0.6348124, 0.9398251, -0.1264842, 0.3372549, 0, 1, 1,
0.6358854, 0.5284857, -0.5081562, 0.345098, 0, 1, 1,
0.6361618, 0.7003725, 0.8095106, 0.3490196, 0, 1, 1,
0.6378728, 0.3673735, 1.499166, 0.3568628, 0, 1, 1,
0.6383753, 0.2315301, 1.681522, 0.3607843, 0, 1, 1,
0.6394031, -1.164638, 4.578186, 0.3686275, 0, 1, 1,
0.6417096, -0.2877718, 0.9109154, 0.372549, 0, 1, 1,
0.6426187, -1.3203, 4.302735, 0.3803922, 0, 1, 1,
0.648047, -0.4725185, 1.264455, 0.3843137, 0, 1, 1,
0.6487712, -0.03103147, 2.657138, 0.3921569, 0, 1, 1,
0.6516081, -0.0297832, 1.271845, 0.3960784, 0, 1, 1,
0.655866, 1.29113, -0.6178626, 0.4039216, 0, 1, 1,
0.6568971, -0.8648162, 2.938967, 0.4117647, 0, 1, 1,
0.6589353, -0.064445, 0.2757953, 0.4156863, 0, 1, 1,
0.6593709, -0.2132528, 2.954371, 0.4235294, 0, 1, 1,
0.6595632, 0.5853395, 1.020639, 0.427451, 0, 1, 1,
0.6713988, -0.3201312, 0.5976992, 0.4352941, 0, 1, 1,
0.6732396, 0.6062235, 1.525173, 0.4392157, 0, 1, 1,
0.6752083, 0.2049116, 4.142253, 0.4470588, 0, 1, 1,
0.6765253, -1.071266, 2.057438, 0.4509804, 0, 1, 1,
0.6774305, 1.148176, -0.5102013, 0.4588235, 0, 1, 1,
0.6790538, -1.418644, 0.8095465, 0.4627451, 0, 1, 1,
0.6816913, 0.4972159, 2.868988, 0.4705882, 0, 1, 1,
0.6823558, 0.2814623, 0.7865512, 0.4745098, 0, 1, 1,
0.6848761, -0.5097843, 1.128639, 0.4823529, 0, 1, 1,
0.685468, -0.2679435, 1.728052, 0.4862745, 0, 1, 1,
0.6868118, 0.2846227, 0.9540607, 0.4941176, 0, 1, 1,
0.6895845, -0.9442704, 3.295229, 0.5019608, 0, 1, 1,
0.6944466, 0.0586828, 1.957177, 0.5058824, 0, 1, 1,
0.6986719, 1.47366, 0.6036461, 0.5137255, 0, 1, 1,
0.7003021, 0.2369585, 1.783888, 0.5176471, 0, 1, 1,
0.7017709, -0.2700727, 0.4208367, 0.5254902, 0, 1, 1,
0.707118, -0.2389145, 1.362871, 0.5294118, 0, 1, 1,
0.708792, 1.355472, -0.06838519, 0.5372549, 0, 1, 1,
0.7121905, -0.6566809, 1.970639, 0.5411765, 0, 1, 1,
0.7169412, 1.295051, -1.132328, 0.5490196, 0, 1, 1,
0.7267941, -0.1960853, 2.807555, 0.5529412, 0, 1, 1,
0.7296141, 0.3138925, 2.298887, 0.5607843, 0, 1, 1,
0.7298636, -0.8639215, 1.363898, 0.5647059, 0, 1, 1,
0.7310988, -0.2149233, 2.477268, 0.572549, 0, 1, 1,
0.7350959, -1.896793, 2.882785, 0.5764706, 0, 1, 1,
0.735462, 2.463717, 0.2370953, 0.5843138, 0, 1, 1,
0.736288, 0.9934395, 0.0954523, 0.5882353, 0, 1, 1,
0.7380924, -1.326191, 3.45031, 0.5960785, 0, 1, 1,
0.7410959, -0.1498384, 0.1566161, 0.6039216, 0, 1, 1,
0.7482437, 1.906468, 2.791999, 0.6078432, 0, 1, 1,
0.7514411, 0.6517521, 1.985772, 0.6156863, 0, 1, 1,
0.7584051, -1.389424, 1.730954, 0.6196079, 0, 1, 1,
0.7586918, -0.3726838, 1.590408, 0.627451, 0, 1, 1,
0.7589946, 1.594374, -0.7947001, 0.6313726, 0, 1, 1,
0.7629824, 0.01517401, -0.2229076, 0.6392157, 0, 1, 1,
0.7634812, 0.02921839, 1.587143, 0.6431373, 0, 1, 1,
0.7643265, -0.1038136, 1.307356, 0.6509804, 0, 1, 1,
0.7671886, -1.146653, 3.025371, 0.654902, 0, 1, 1,
0.7684051, 0.4202873, 0.6786017, 0.6627451, 0, 1, 1,
0.7745586, 0.6772124, 0.3574997, 0.6666667, 0, 1, 1,
0.7750788, 1.65362, 2.913981, 0.6745098, 0, 1, 1,
0.7868329, -0.2308512, 1.919329, 0.6784314, 0, 1, 1,
0.7874551, 0.2976402, 1.025244, 0.6862745, 0, 1, 1,
0.7875879, 0.8105002, 0.1165647, 0.6901961, 0, 1, 1,
0.7885775, 0.5047545, 0.03776783, 0.6980392, 0, 1, 1,
0.7891629, 0.628971, 1.481583, 0.7058824, 0, 1, 1,
0.7918247, -1.007903, 2.303507, 0.7098039, 0, 1, 1,
0.7973936, -1.748902, 3.583653, 0.7176471, 0, 1, 1,
0.8001583, -0.8844592, 1.940517, 0.7215686, 0, 1, 1,
0.8002744, -0.3725602, 1.911219, 0.7294118, 0, 1, 1,
0.8041765, -0.9624181, 4.509578, 0.7333333, 0, 1, 1,
0.8058519, 0.7299889, 1.554432, 0.7411765, 0, 1, 1,
0.8061258, 0.5985997, 1.55239, 0.7450981, 0, 1, 1,
0.8154442, 1.163499, 0.4971163, 0.7529412, 0, 1, 1,
0.817922, 0.4984664, 0.1728936, 0.7568628, 0, 1, 1,
0.8179512, -0.702193, 1.955168, 0.7647059, 0, 1, 1,
0.8182746, -0.119699, 1.213265, 0.7686275, 0, 1, 1,
0.8279808, -0.3444614, 2.417866, 0.7764706, 0, 1, 1,
0.8319426, 2.338443, -0.9366807, 0.7803922, 0, 1, 1,
0.8345656, -2.699383, 3.03035, 0.7882353, 0, 1, 1,
0.8382846, 1.244408, 0.2746034, 0.7921569, 0, 1, 1,
0.8450897, 0.5715383, 2.220282, 0.8, 0, 1, 1,
0.8456957, -0.1052854, 2.675802, 0.8078431, 0, 1, 1,
0.8665339, 0.7366303, -0.7757228, 0.8117647, 0, 1, 1,
0.866879, -1.805676, 2.048902, 0.8196079, 0, 1, 1,
0.8669373, -1.760935, 2.786132, 0.8235294, 0, 1, 1,
0.8683785, 0.01324291, 1.955959, 0.8313726, 0, 1, 1,
0.8691427, -0.4029463, 0.8974543, 0.8352941, 0, 1, 1,
0.8730861, -1.520974, 2.556576, 0.8431373, 0, 1, 1,
0.875686, -0.4612028, 2.830811, 0.8470588, 0, 1, 1,
0.8857476, 0.3150185, 0.5443113, 0.854902, 0, 1, 1,
0.895889, 0.9996094, 2.41761, 0.8588235, 0, 1, 1,
0.8982843, 0.8219603, 0.6103595, 0.8666667, 0, 1, 1,
0.9097914, -0.7448921, 3.5553, 0.8705882, 0, 1, 1,
0.9124509, -0.2316916, 3.002951, 0.8784314, 0, 1, 1,
0.9165272, 1.063969, 2.128308, 0.8823529, 0, 1, 1,
0.9182295, -0.9196758, 3.663434, 0.8901961, 0, 1, 1,
0.9215445, 0.7508392, 0.2459828, 0.8941177, 0, 1, 1,
0.9224041, -0.3599065, 1.533979, 0.9019608, 0, 1, 1,
0.9227768, 2.474538, -0.206413, 0.9098039, 0, 1, 1,
0.9263675, -0.9295511, 3.075558, 0.9137255, 0, 1, 1,
0.9281232, 0.142585, 0.9412443, 0.9215686, 0, 1, 1,
0.9298293, 0.1455021, 0.9516742, 0.9254902, 0, 1, 1,
0.9310412, -0.3747711, 2.76288, 0.9333333, 0, 1, 1,
0.932003, -0.6736826, 1.779661, 0.9372549, 0, 1, 1,
0.9326656, -0.2750224, 2.793391, 0.945098, 0, 1, 1,
0.9344338, -0.2079646, 1.214558, 0.9490196, 0, 1, 1,
0.9364688, -0.4776355, 0.3744756, 0.9568627, 0, 1, 1,
0.9518398, -1.5342, 2.001733, 0.9607843, 0, 1, 1,
0.9545968, -0.08559535, -0.451878, 0.9686275, 0, 1, 1,
0.9582411, -2.103876, 2.608778, 0.972549, 0, 1, 1,
0.9621732, 1.888762, 1.850618, 0.9803922, 0, 1, 1,
0.96401, -0.364595, 2.940947, 0.9843137, 0, 1, 1,
0.9670183, 0.5479674, 0.8120141, 0.9921569, 0, 1, 1,
0.972143, 0.7109931, 0.9717489, 0.9960784, 0, 1, 1,
0.9730291, 0.8523498, 0.01184205, 1, 0, 0.9960784, 1,
0.9767825, -0.1244268, 0.8114952, 1, 0, 0.9882353, 1,
0.9780921, -0.5900316, 0.1984088, 1, 0, 0.9843137, 1,
0.9813997, -0.4678934, 2.331413, 1, 0, 0.9764706, 1,
0.9936454, 0.4626569, 0.1637374, 1, 0, 0.972549, 1,
0.9957115, -0.6088438, 2.409672, 1, 0, 0.9647059, 1,
1.004916, 1.82251, -0.2902251, 1, 0, 0.9607843, 1,
1.020092, -0.7654727, 3.192083, 1, 0, 0.9529412, 1,
1.035062, -0.7221277, 0.06867809, 1, 0, 0.9490196, 1,
1.041235, -0.3685613, 0.5231952, 1, 0, 0.9411765, 1,
1.050135, 0.1449846, 3.027476, 1, 0, 0.9372549, 1,
1.051307, -1.001077, 1.734022, 1, 0, 0.9294118, 1,
1.052585, 0.01864737, 0.8184021, 1, 0, 0.9254902, 1,
1.053461, -1.612119, 4.762793, 1, 0, 0.9176471, 1,
1.058154, -0.5389184, 4.495901, 1, 0, 0.9137255, 1,
1.067402, -0.5735044, 3.373226, 1, 0, 0.9058824, 1,
1.067982, -0.225717, 1.667403, 1, 0, 0.9019608, 1,
1.071748, 1.055356, -0.3699133, 1, 0, 0.8941177, 1,
1.072657, -0.5920233, 2.129966, 1, 0, 0.8862745, 1,
1.07472, -1.520052, 2.200993, 1, 0, 0.8823529, 1,
1.075458, -0.3254297, -0.2554464, 1, 0, 0.8745098, 1,
1.083346, 0.7496929, 2.634542, 1, 0, 0.8705882, 1,
1.084524, -0.02718892, 1.432144, 1, 0, 0.8627451, 1,
1.093459, -1.045253, 3.20832, 1, 0, 0.8588235, 1,
1.096587, 0.2093757, 2.129018, 1, 0, 0.8509804, 1,
1.118874, 0.4126749, 2.22554, 1, 0, 0.8470588, 1,
1.124459, 0.7667091, -0.5692434, 1, 0, 0.8392157, 1,
1.127467, 1.936424, -0.3355278, 1, 0, 0.8352941, 1,
1.128199, 1.475732, -0.8484883, 1, 0, 0.827451, 1,
1.137403, -1.580883, -0.6821079, 1, 0, 0.8235294, 1,
1.152948, -0.2086993, 0.9252273, 1, 0, 0.8156863, 1,
1.153059, -0.3431147, 0.09116727, 1, 0, 0.8117647, 1,
1.154969, -0.03028503, 3.556979, 1, 0, 0.8039216, 1,
1.158081, 0.5894964, 3.778797, 1, 0, 0.7960784, 1,
1.158563, 0.1950443, 1.426455, 1, 0, 0.7921569, 1,
1.159715, -1.31855, 3.542012, 1, 0, 0.7843137, 1,
1.162266, 0.1349082, 2.291925, 1, 0, 0.7803922, 1,
1.165834, 0.4404378, 0.6437174, 1, 0, 0.772549, 1,
1.168892, 0.961733, -0.1117041, 1, 0, 0.7686275, 1,
1.177046, 0.4583959, -0.6388312, 1, 0, 0.7607843, 1,
1.180282, -0.9822094, 1.741382, 1, 0, 0.7568628, 1,
1.196033, 0.9769675, 0.8854151, 1, 0, 0.7490196, 1,
1.204997, -1.204799, 3.448125, 1, 0, 0.7450981, 1,
1.20932, 1.785579, 0.8598737, 1, 0, 0.7372549, 1,
1.213142, 0.06880687, 0.5146823, 1, 0, 0.7333333, 1,
1.224474, -0.04234967, 1.402302, 1, 0, 0.7254902, 1,
1.224788, 1.295423, 0.7042625, 1, 0, 0.7215686, 1,
1.227239, -1.873594, 2.454359, 1, 0, 0.7137255, 1,
1.228168, -0.3796656, 1.114134, 1, 0, 0.7098039, 1,
1.233336, -0.7625327, 2.963577, 1, 0, 0.7019608, 1,
1.236944, -0.9913368, 2.919897, 1, 0, 0.6941177, 1,
1.239235, -0.217386, 2.162599, 1, 0, 0.6901961, 1,
1.251294, -2.229982, 3.198666, 1, 0, 0.682353, 1,
1.251541, -2.115323, 1.708511, 1, 0, 0.6784314, 1,
1.254875, -0.5946633, 2.847819, 1, 0, 0.6705883, 1,
1.264886, -0.1583307, 2.333282, 1, 0, 0.6666667, 1,
1.266139, 0.8099891, 0.9974743, 1, 0, 0.6588235, 1,
1.271475, -0.06146478, 2.655474, 1, 0, 0.654902, 1,
1.27152, 1.980608, -0.6384079, 1, 0, 0.6470588, 1,
1.277905, -0.1107762, 1.306446, 1, 0, 0.6431373, 1,
1.284242, 1.650769, 0.3363551, 1, 0, 0.6352941, 1,
1.287775, 0.2009869, 1.412471, 1, 0, 0.6313726, 1,
1.289397, 1.593345, 1.116251, 1, 0, 0.6235294, 1,
1.290378, 0.3934182, 0.898434, 1, 0, 0.6196079, 1,
1.293352, -0.2623141, 2.968645, 1, 0, 0.6117647, 1,
1.297069, 0.1215629, 1.023218, 1, 0, 0.6078432, 1,
1.30123, -1.801408, 3.688934, 1, 0, 0.6, 1,
1.303457, -0.4118816, 2.131002, 1, 0, 0.5921569, 1,
1.317209, -1.492581, 0.713918, 1, 0, 0.5882353, 1,
1.322547, 0.3113428, 1.532375, 1, 0, 0.5803922, 1,
1.335384, -2.426276, 3.134736, 1, 0, 0.5764706, 1,
1.350098, -1.029017, 1.880629, 1, 0, 0.5686275, 1,
1.353641, -1.101455, 1.502113, 1, 0, 0.5647059, 1,
1.354096, -0.1315791, 0.2013149, 1, 0, 0.5568628, 1,
1.368007, -0.2756336, 2.110754, 1, 0, 0.5529412, 1,
1.373466, 0.1098011, 0.7727808, 1, 0, 0.5450981, 1,
1.381216, 0.4213692, 1.531334, 1, 0, 0.5411765, 1,
1.381959, 0.7984884, 1.737684, 1, 0, 0.5333334, 1,
1.386375, -2.064796, 1.640353, 1, 0, 0.5294118, 1,
1.392015, 0.1287414, 0.3206174, 1, 0, 0.5215687, 1,
1.403528, -1.076606, 4.414564, 1, 0, 0.5176471, 1,
1.404035, -0.211294, 1.705681, 1, 0, 0.509804, 1,
1.426644, 0.7342765, 0.6026801, 1, 0, 0.5058824, 1,
1.438961, -2.092978, 2.855912, 1, 0, 0.4980392, 1,
1.438986, 0.4419776, 2.804104, 1, 0, 0.4901961, 1,
1.445572, 1.65174, 1.061179, 1, 0, 0.4862745, 1,
1.451554, 1.520273, 3.069631, 1, 0, 0.4784314, 1,
1.464342, 0.7534882, 2.719169, 1, 0, 0.4745098, 1,
1.478076, 0.67897, 1.15743, 1, 0, 0.4666667, 1,
1.497685, 1.070871, 1.525474, 1, 0, 0.4627451, 1,
1.501377, -0.2786361, 1.305677, 1, 0, 0.454902, 1,
1.502965, 0.8188152, 0.5671337, 1, 0, 0.4509804, 1,
1.518416, 0.2267357, 1.818261, 1, 0, 0.4431373, 1,
1.538097, 1.195818, 0.5147485, 1, 0, 0.4392157, 1,
1.548476, -0.741231, 0.9459317, 1, 0, 0.4313726, 1,
1.55893, -0.773435, 2.160815, 1, 0, 0.427451, 1,
1.566325, -1.599019, 3.395596, 1, 0, 0.4196078, 1,
1.599308, -0.5416319, 2.044551, 1, 0, 0.4156863, 1,
1.604948, -0.9358091, 1.466209, 1, 0, 0.4078431, 1,
1.608922, 1.543291, 0.2439423, 1, 0, 0.4039216, 1,
1.611215, 0.9442284, -0.1849379, 1, 0, 0.3960784, 1,
1.614591, -0.2062982, 0.8449711, 1, 0, 0.3882353, 1,
1.614949, -1.161514, 2.925422, 1, 0, 0.3843137, 1,
1.624544, -0.5895206, 2.91701, 1, 0, 0.3764706, 1,
1.644022, 0.7891988, 1.569402, 1, 0, 0.372549, 1,
1.656806, 0.04535584, -1.850309, 1, 0, 0.3647059, 1,
1.660201, 0.2949334, 1.433687, 1, 0, 0.3607843, 1,
1.673739, -0.8354311, 1.657165, 1, 0, 0.3529412, 1,
1.691087, 1.467447, 1.924789, 1, 0, 0.3490196, 1,
1.695225, 2.895968, 1.665017, 1, 0, 0.3411765, 1,
1.696364, 0.9920055, 0.832015, 1, 0, 0.3372549, 1,
1.697561, -0.6555606, 2.195843, 1, 0, 0.3294118, 1,
1.704592, -1.714725, 3.419497, 1, 0, 0.3254902, 1,
1.722514, -1.395257, 1.903158, 1, 0, 0.3176471, 1,
1.726172, 0.6471137, 2.630439, 1, 0, 0.3137255, 1,
1.736038, -0.4787948, 2.410591, 1, 0, 0.3058824, 1,
1.73665, 1.360811, 0.1720641, 1, 0, 0.2980392, 1,
1.750959, -0.04387289, 1.704637, 1, 0, 0.2941177, 1,
1.7555, 0.9908721, 1.746035, 1, 0, 0.2862745, 1,
1.763309, 1.588902, 1.82469, 1, 0, 0.282353, 1,
1.805157, 0.4302694, 2.902187, 1, 0, 0.2745098, 1,
1.818752, 1.332707, 0.7666519, 1, 0, 0.2705882, 1,
1.826245, 0.5251787, 1.893917, 1, 0, 0.2627451, 1,
1.849059, -1.054646, 0.5137436, 1, 0, 0.2588235, 1,
1.854089, 0.6353334, 0.06501152, 1, 0, 0.2509804, 1,
1.864406, 1.143499, 0.2886545, 1, 0, 0.2470588, 1,
1.871188, -0.1018545, 0.2512166, 1, 0, 0.2392157, 1,
1.882133, 0.04861557, 1.528715, 1, 0, 0.2352941, 1,
1.908665, 0.192907, 1.577894, 1, 0, 0.227451, 1,
1.91383, 1.321508, 3.48591, 1, 0, 0.2235294, 1,
1.946917, 0.6840348, 2.869282, 1, 0, 0.2156863, 1,
1.956584, -0.2429906, 2.112675, 1, 0, 0.2117647, 1,
1.979725, -0.605473, 3.291705, 1, 0, 0.2039216, 1,
2.00129, -0.7719381, 2.702173, 1, 0, 0.1960784, 1,
2.017113, -1.928919, 0.4533475, 1, 0, 0.1921569, 1,
2.026436, 0.761053, 0.2654154, 1, 0, 0.1843137, 1,
2.034356, -0.3115422, 2.867774, 1, 0, 0.1803922, 1,
2.063537, -0.401907, 3.393355, 1, 0, 0.172549, 1,
2.079334, 1.397466, 1.346366, 1, 0, 0.1686275, 1,
2.080673, -0.4596486, 1.240555, 1, 0, 0.1607843, 1,
2.081239, 0.1129494, 2.357222, 1, 0, 0.1568628, 1,
2.100287, -0.09025379, 2.030045, 1, 0, 0.1490196, 1,
2.113538, -0.157745, 2.181744, 1, 0, 0.145098, 1,
2.124769, 0.3673683, 1.325079, 1, 0, 0.1372549, 1,
2.155176, 0.3962031, 4.96692, 1, 0, 0.1333333, 1,
2.155754, -2.126822, 2.574156, 1, 0, 0.1254902, 1,
2.203526, -1.301113, 1.275746, 1, 0, 0.1215686, 1,
2.203612, 0.3459025, 1.642339, 1, 0, 0.1137255, 1,
2.255282, -0.6081961, 0.8084696, 1, 0, 0.1098039, 1,
2.25791, -0.4179375, 0.3924729, 1, 0, 0.1019608, 1,
2.269174, 0.09910816, 2.105421, 1, 0, 0.09411765, 1,
2.293865, -1.52382, 3.018572, 1, 0, 0.09019608, 1,
2.334409, 0.701282, 0.7626718, 1, 0, 0.08235294, 1,
2.351535, -0.5150683, 1.414603, 1, 0, 0.07843138, 1,
2.352625, -1.123696, 0.821547, 1, 0, 0.07058824, 1,
2.377346, 0.8367218, 1.169484, 1, 0, 0.06666667, 1,
2.411966, -1.374949, 0.7862436, 1, 0, 0.05882353, 1,
2.454116, 0.345845, -0.6980116, 1, 0, 0.05490196, 1,
2.482165, 2.272144, 1.128633, 1, 0, 0.04705882, 1,
2.48928, -0.2691901, 1.310781, 1, 0, 0.04313726, 1,
2.638129, -0.2148309, 0.5913463, 1, 0, 0.03529412, 1,
2.640859, -0.05360578, 2.107834, 1, 0, 0.03137255, 1,
2.665478, -0.237102, 2.414452, 1, 0, 0.02352941, 1,
2.727827, -0.6671405, 1.099128, 1, 0, 0.01960784, 1,
3.163205, 0.8109545, 1.99307, 1, 0, 0.01176471, 1,
3.635306, 1.211056, 1.935948, 1, 0, 0.007843138, 1
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
0.1041358, -4.483753, -7.626201, 0, -0.5, 0.5, 0.5,
0.1041358, -4.483753, -7.626201, 1, -0.5, 0.5, 0.5,
0.1041358, -4.483753, -7.626201, 1, 1.5, 0.5, 0.5,
0.1041358, -4.483753, -7.626201, 0, 1.5, 0.5, 0.5
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
-4.624102, 0.08440328, -7.626201, 0, -0.5, 0.5, 0.5,
-4.624102, 0.08440328, -7.626201, 1, -0.5, 0.5, 0.5,
-4.624102, 0.08440328, -7.626201, 1, 1.5, 0.5, 0.5,
-4.624102, 0.08440328, -7.626201, 0, 1.5, 0.5, 0.5
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
-4.624102, -4.483753, -0.2892587, 0, -0.5, 0.5, 0.5,
-4.624102, -4.483753, -0.2892587, 1, -0.5, 0.5, 0.5,
-4.624102, -4.483753, -0.2892587, 1, 1.5, 0.5, 0.5,
-4.624102, -4.483753, -0.2892587, 0, 1.5, 0.5, 0.5
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
-2, -3.429563, -5.93306,
2, -3.429563, -5.93306,
-2, -3.429563, -5.93306,
-2, -3.605262, -6.21525,
0, -3.429563, -5.93306,
0, -3.605262, -6.21525,
2, -3.429563, -5.93306,
2, -3.605262, -6.21525
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
-2, -3.956658, -6.779631, 0, -0.5, 0.5, 0.5,
-2, -3.956658, -6.779631, 1, -0.5, 0.5, 0.5,
-2, -3.956658, -6.779631, 1, 1.5, 0.5, 0.5,
-2, -3.956658, -6.779631, 0, 1.5, 0.5, 0.5,
0, -3.956658, -6.779631, 0, -0.5, 0.5, 0.5,
0, -3.956658, -6.779631, 1, -0.5, 0.5, 0.5,
0, -3.956658, -6.779631, 1, 1.5, 0.5, 0.5,
0, -3.956658, -6.779631, 0, 1.5, 0.5, 0.5,
2, -3.956658, -6.779631, 0, -0.5, 0.5, 0.5,
2, -3.956658, -6.779631, 1, -0.5, 0.5, 0.5,
2, -3.956658, -6.779631, 1, 1.5, 0.5, 0.5,
2, -3.956658, -6.779631, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.53297, -3, -5.93306,
-3.53297, 3, -5.93306,
-3.53297, -3, -5.93306,
-3.714825, -3, -6.21525,
-3.53297, -2, -5.93306,
-3.714825, -2, -6.21525,
-3.53297, -1, -5.93306,
-3.714825, -1, -6.21525,
-3.53297, 0, -5.93306,
-3.714825, 0, -6.21525,
-3.53297, 1, -5.93306,
-3.714825, 1, -6.21525,
-3.53297, 2, -5.93306,
-3.714825, 2, -6.21525,
-3.53297, 3, -5.93306,
-3.714825, 3, -6.21525
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
-4.078536, -3, -6.779631, 0, -0.5, 0.5, 0.5,
-4.078536, -3, -6.779631, 1, -0.5, 0.5, 0.5,
-4.078536, -3, -6.779631, 1, 1.5, 0.5, 0.5,
-4.078536, -3, -6.779631, 0, 1.5, 0.5, 0.5,
-4.078536, -2, -6.779631, 0, -0.5, 0.5, 0.5,
-4.078536, -2, -6.779631, 1, -0.5, 0.5, 0.5,
-4.078536, -2, -6.779631, 1, 1.5, 0.5, 0.5,
-4.078536, -2, -6.779631, 0, 1.5, 0.5, 0.5,
-4.078536, -1, -6.779631, 0, -0.5, 0.5, 0.5,
-4.078536, -1, -6.779631, 1, -0.5, 0.5, 0.5,
-4.078536, -1, -6.779631, 1, 1.5, 0.5, 0.5,
-4.078536, -1, -6.779631, 0, 1.5, 0.5, 0.5,
-4.078536, 0, -6.779631, 0, -0.5, 0.5, 0.5,
-4.078536, 0, -6.779631, 1, -0.5, 0.5, 0.5,
-4.078536, 0, -6.779631, 1, 1.5, 0.5, 0.5,
-4.078536, 0, -6.779631, 0, 1.5, 0.5, 0.5,
-4.078536, 1, -6.779631, 0, -0.5, 0.5, 0.5,
-4.078536, 1, -6.779631, 1, -0.5, 0.5, 0.5,
-4.078536, 1, -6.779631, 1, 1.5, 0.5, 0.5,
-4.078536, 1, -6.779631, 0, 1.5, 0.5, 0.5,
-4.078536, 2, -6.779631, 0, -0.5, 0.5, 0.5,
-4.078536, 2, -6.779631, 1, -0.5, 0.5, 0.5,
-4.078536, 2, -6.779631, 1, 1.5, 0.5, 0.5,
-4.078536, 2, -6.779631, 0, 1.5, 0.5, 0.5,
-4.078536, 3, -6.779631, 0, -0.5, 0.5, 0.5,
-4.078536, 3, -6.779631, 1, -0.5, 0.5, 0.5,
-4.078536, 3, -6.779631, 1, 1.5, 0.5, 0.5,
-4.078536, 3, -6.779631, 0, 1.5, 0.5, 0.5
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
-3.53297, -3.429563, -4,
-3.53297, -3.429563, 4,
-3.53297, -3.429563, -4,
-3.714825, -3.605262, -4,
-3.53297, -3.429563, -2,
-3.714825, -3.605262, -2,
-3.53297, -3.429563, 0,
-3.714825, -3.605262, 0,
-3.53297, -3.429563, 2,
-3.714825, -3.605262, 2,
-3.53297, -3.429563, 4,
-3.714825, -3.605262, 4
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
-4.078536, -3.956658, -4, 0, -0.5, 0.5, 0.5,
-4.078536, -3.956658, -4, 1, -0.5, 0.5, 0.5,
-4.078536, -3.956658, -4, 1, 1.5, 0.5, 0.5,
-4.078536, -3.956658, -4, 0, 1.5, 0.5, 0.5,
-4.078536, -3.956658, -2, 0, -0.5, 0.5, 0.5,
-4.078536, -3.956658, -2, 1, -0.5, 0.5, 0.5,
-4.078536, -3.956658, -2, 1, 1.5, 0.5, 0.5,
-4.078536, -3.956658, -2, 0, 1.5, 0.5, 0.5,
-4.078536, -3.956658, 0, 0, -0.5, 0.5, 0.5,
-4.078536, -3.956658, 0, 1, -0.5, 0.5, 0.5,
-4.078536, -3.956658, 0, 1, 1.5, 0.5, 0.5,
-4.078536, -3.956658, 0, 0, 1.5, 0.5, 0.5,
-4.078536, -3.956658, 2, 0, -0.5, 0.5, 0.5,
-4.078536, -3.956658, 2, 1, -0.5, 0.5, 0.5,
-4.078536, -3.956658, 2, 1, 1.5, 0.5, 0.5,
-4.078536, -3.956658, 2, 0, 1.5, 0.5, 0.5,
-4.078536, -3.956658, 4, 0, -0.5, 0.5, 0.5,
-4.078536, -3.956658, 4, 1, -0.5, 0.5, 0.5,
-4.078536, -3.956658, 4, 1, 1.5, 0.5, 0.5,
-4.078536, -3.956658, 4, 0, 1.5, 0.5, 0.5
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
-3.53297, -3.429563, -5.93306,
-3.53297, 3.59837, -5.93306,
-3.53297, -3.429563, 5.354543,
-3.53297, 3.59837, 5.354543,
-3.53297, -3.429563, -5.93306,
-3.53297, -3.429563, 5.354543,
-3.53297, 3.59837, -5.93306,
-3.53297, 3.59837, 5.354543,
-3.53297, -3.429563, -5.93306,
3.741241, -3.429563, -5.93306,
-3.53297, -3.429563, 5.354543,
3.741241, -3.429563, 5.354543,
-3.53297, 3.59837, -5.93306,
3.741241, 3.59837, -5.93306,
-3.53297, 3.59837, 5.354543,
3.741241, 3.59837, 5.354543,
3.741241, -3.429563, -5.93306,
3.741241, 3.59837, -5.93306,
3.741241, -3.429563, 5.354543,
3.741241, 3.59837, 5.354543,
3.741241, -3.429563, -5.93306,
3.741241, -3.429563, 5.354543,
3.741241, 3.59837, -5.93306,
3.741241, 3.59837, 5.354543
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
var radius = 8.093215;
var distance = 36.00763;
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
mvMatrix.translate( -0.1041358, -0.08440328, 0.2892587 );
mvMatrix.scale( 1.202954, 1.245109, 0.7752348 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.00763);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
clodinafop-propargyl<-read.table("clodinafop-propargyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clodinafop-propargyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'clodinafop' not found
```

```r
y<-clodinafop-propargyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'clodinafop' not found
```

```r
z<-clodinafop-propargyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'clodinafop' not found
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
-3.427035, -1.421819, -3.833469, 0, 0, 1, 1, 1,
-3.236921, 0.3223895, -1.050343, 1, 0, 0, 1, 1,
-3.095589, -1.233855, -2.256294, 1, 0, 0, 1, 1,
-2.667481, -0.09815322, -2.038242, 1, 0, 0, 1, 1,
-2.630251, 0.2927563, -2.957033, 1, 0, 0, 1, 1,
-2.605077, 0.4808655, 1.327219, 1, 0, 0, 1, 1,
-2.562835, -0.6813498, -2.905055, 0, 0, 0, 1, 1,
-2.30805, 2.120749, -0.928346, 0, 0, 0, 1, 1,
-2.28043, -0.7177418, -2.557611, 0, 0, 0, 1, 1,
-2.237032, -1.780901, -3.774105, 0, 0, 0, 1, 1,
-2.208395, 0.7367631, -1.415845, 0, 0, 0, 1, 1,
-2.180155, -1.412173, -0.3813104, 0, 0, 0, 1, 1,
-2.172745, 0.6254044, -0.9271688, 0, 0, 0, 1, 1,
-2.151435, 0.3533229, -0.6161286, 1, 1, 1, 1, 1,
-2.150415, 0.4404004, -1.009539, 1, 1, 1, 1, 1,
-2.130774, -0.2575741, -1.190506, 1, 1, 1, 1, 1,
-2.117294, -0.2759121, -0.8707712, 1, 1, 1, 1, 1,
-2.074265, 1.954761, -1.661139, 1, 1, 1, 1, 1,
-2.066736, 0.8082973, -0.6244483, 1, 1, 1, 1, 1,
-2.061041, -0.4612931, -1.501852, 1, 1, 1, 1, 1,
-2.026108, -1.58677, -2.474148, 1, 1, 1, 1, 1,
-1.974337, -0.9177006, -1.638372, 1, 1, 1, 1, 1,
-1.971299, 0.1272823, -0.8987503, 1, 1, 1, 1, 1,
-1.948937, 1.332663, -1.781509, 1, 1, 1, 1, 1,
-1.886968, -0.7169087, -1.519576, 1, 1, 1, 1, 1,
-1.873023, -0.9270366, -2.434634, 1, 1, 1, 1, 1,
-1.856176, -1.356582, -2.576105, 1, 1, 1, 1, 1,
-1.847557, -0.8493438, -3.235022, 1, 1, 1, 1, 1,
-1.844157, -0.5890741, -2.098149, 0, 0, 1, 1, 1,
-1.827152, -0.8290394, -2.006326, 1, 0, 0, 1, 1,
-1.81356, -2.195046, -2.042054, 1, 0, 0, 1, 1,
-1.795967, -1.027586, -1.662637, 1, 0, 0, 1, 1,
-1.786787, -0.6915755, -0.5424157, 1, 0, 0, 1, 1,
-1.76623, 1.07803, 0.7498811, 1, 0, 0, 1, 1,
-1.760479, -0.7428045, -2.703549, 0, 0, 0, 1, 1,
-1.748542, 0.9308403, -1.264517, 0, 0, 0, 1, 1,
-1.716586, 0.8439012, -1.427107, 0, 0, 0, 1, 1,
-1.715376, 0.3567984, -1.528968, 0, 0, 0, 1, 1,
-1.705038, 0.1090769, -1.88708, 0, 0, 0, 1, 1,
-1.700848, 0.6614315, -1.041296, 0, 0, 0, 1, 1,
-1.681371, 1.737445, -1.893742, 0, 0, 0, 1, 1,
-1.679151, -0.1569437, -1.27514, 1, 1, 1, 1, 1,
-1.668045, -0.2930719, -2.705304, 1, 1, 1, 1, 1,
-1.664004, -1.020205, -3.068573, 1, 1, 1, 1, 1,
-1.65466, 0.7331384, -1.754146, 1, 1, 1, 1, 1,
-1.636491, -0.2863175, 0.1843429, 1, 1, 1, 1, 1,
-1.626157, 0.7149158, -1.207865, 1, 1, 1, 1, 1,
-1.610894, -1.030161, -2.297479, 1, 1, 1, 1, 1,
-1.588214, -0.2557955, -2.538809, 1, 1, 1, 1, 1,
-1.582551, -0.43903, -2.127247, 1, 1, 1, 1, 1,
-1.582005, 0.3822963, -1.988079, 1, 1, 1, 1, 1,
-1.579503, -0.418476, -1.943155, 1, 1, 1, 1, 1,
-1.575036, -1.644027, -1.926171, 1, 1, 1, 1, 1,
-1.56266, -0.7886089, -3.862537, 1, 1, 1, 1, 1,
-1.552951, 0.6269457, -1.01424, 1, 1, 1, 1, 1,
-1.549992, 0.5884923, -1.716972, 1, 1, 1, 1, 1,
-1.543196, -0.8545171, -2.933028, 0, 0, 1, 1, 1,
-1.543162, 3.147918, 2.527657, 1, 0, 0, 1, 1,
-1.515109, 2.478202, -0.1490001, 1, 0, 0, 1, 1,
-1.512046, -0.1400872, -3.581595, 1, 0, 0, 1, 1,
-1.507867, 0.8275482, -1.942775, 1, 0, 0, 1, 1,
-1.482623, 0.1702944, 0.882561, 1, 0, 0, 1, 1,
-1.47519, 1.748398, -0.5969676, 0, 0, 0, 1, 1,
-1.46796, 0.4156073, -1.719051, 0, 0, 0, 1, 1,
-1.456292, 1.285764, -2.724038, 0, 0, 0, 1, 1,
-1.445477, 0.09946742, 0.6643822, 0, 0, 0, 1, 1,
-1.442171, 1.324513, -0.1471405, 0, 0, 0, 1, 1,
-1.430085, 0.9118066, -1.210965, 0, 0, 0, 1, 1,
-1.418239, -2.058192, -4.378634, 0, 0, 0, 1, 1,
-1.411723, -0.5552697, -1.058317, 1, 1, 1, 1, 1,
-1.402855, 0.1288196, -3.665443, 1, 1, 1, 1, 1,
-1.39345, 0.02937139, -0.895951, 1, 1, 1, 1, 1,
-1.379, -0.2905979, -1.450288, 1, 1, 1, 1, 1,
-1.377741, 0.2383865, -1.048347, 1, 1, 1, 1, 1,
-1.370528, 0.03758522, -0.3385967, 1, 1, 1, 1, 1,
-1.369378, 0.4926407, -0.8603184, 1, 1, 1, 1, 1,
-1.360416, -0.6217558, -1.578496, 1, 1, 1, 1, 1,
-1.357038, 0.5950292, -1.018236, 1, 1, 1, 1, 1,
-1.355561, -0.6062481, -0.8914966, 1, 1, 1, 1, 1,
-1.347131, 0.683864, -3.08532, 1, 1, 1, 1, 1,
-1.338465, -0.5525468, -0.3483144, 1, 1, 1, 1, 1,
-1.331733, -1.856789, -3.979227, 1, 1, 1, 1, 1,
-1.326645, -1.261683, -2.502401, 1, 1, 1, 1, 1,
-1.32661, -0.3683341, -2.863015, 1, 1, 1, 1, 1,
-1.322046, 0.16426, -0.7723922, 0, 0, 1, 1, 1,
-1.317546, -0.5945283, -1.834088, 1, 0, 0, 1, 1,
-1.316765, -0.7911728, -1.517405, 1, 0, 0, 1, 1,
-1.316439, 0.3595289, -0.4373032, 1, 0, 0, 1, 1,
-1.304245, 0.3196118, -0.928344, 1, 0, 0, 1, 1,
-1.304165, 0.3825839, -2.037991, 1, 0, 0, 1, 1,
-1.290542, 1.291721, -1.450828, 0, 0, 0, 1, 1,
-1.270655, -1.402502, -2.226593, 0, 0, 0, 1, 1,
-1.26166, 0.4930421, 0.9268309, 0, 0, 0, 1, 1,
-1.258353, 2.782904, -1.002511, 0, 0, 0, 1, 1,
-1.252898, 0.8409647, -0.400565, 0, 0, 0, 1, 1,
-1.25244, 1.416576, -0.5450978, 0, 0, 0, 1, 1,
-1.244715, -1.4622, -2.763665, 0, 0, 0, 1, 1,
-1.243141, -0.4663838, -1.367016, 1, 1, 1, 1, 1,
-1.242453, 0.4859373, -1.027856, 1, 1, 1, 1, 1,
-1.23281, 0.205897, -1.257045, 1, 1, 1, 1, 1,
-1.231412, -0.5236194, -0.4420699, 1, 1, 1, 1, 1,
-1.23065, -2.327648, -1.273244, 1, 1, 1, 1, 1,
-1.225122, 0.7585441, -2.123629, 1, 1, 1, 1, 1,
-1.218448, -0.9682984, -2.285919, 1, 1, 1, 1, 1,
-1.21501, -0.4346985, -2.269553, 1, 1, 1, 1, 1,
-1.214672, -0.07949724, -0.1304138, 1, 1, 1, 1, 1,
-1.213548, -0.9573605, -1.391672, 1, 1, 1, 1, 1,
-1.213216, -1.011922, -3.399787, 1, 1, 1, 1, 1,
-1.208706, 0.8073372, -0.2330853, 1, 1, 1, 1, 1,
-1.205381, -1.134995, -3.594789, 1, 1, 1, 1, 1,
-1.20008, -1.80799, -4.258257, 1, 1, 1, 1, 1,
-1.1982, -0.3029329, -0.5758107, 1, 1, 1, 1, 1,
-1.19556, -0.4378309, -1.047854, 0, 0, 1, 1, 1,
-1.179312, 1.814234, -0.2515138, 1, 0, 0, 1, 1,
-1.176875, -1.723354, -3.42473, 1, 0, 0, 1, 1,
-1.175773, 0.3444666, -1.737664, 1, 0, 0, 1, 1,
-1.166722, 0.6063433, 0.2884206, 1, 0, 0, 1, 1,
-1.148872, 1.086964, -1.578258, 1, 0, 0, 1, 1,
-1.148706, -1.139747, -3.507318, 0, 0, 0, 1, 1,
-1.145616, -2.062511, -3.336438, 0, 0, 0, 1, 1,
-1.144836, 1.392319, 0.2600834, 0, 0, 0, 1, 1,
-1.139742, -0.4921435, -2.652545, 0, 0, 0, 1, 1,
-1.139311, -0.2103366, -1.627961, 0, 0, 0, 1, 1,
-1.134239, -1.047214, -3.263828, 0, 0, 0, 1, 1,
-1.127524, 0.8482811, -0.8990458, 0, 0, 0, 1, 1,
-1.125526, -0.5861616, -3.921836, 1, 1, 1, 1, 1,
-1.111791, 0.7381054, -2.129587, 1, 1, 1, 1, 1,
-1.105954, 0.674756, -2.869237, 1, 1, 1, 1, 1,
-1.105005, -0.2988418, -2.506956, 1, 1, 1, 1, 1,
-1.097948, -1.152506, -0.4124228, 1, 1, 1, 1, 1,
-1.09465, 0.7772479, -1.469631, 1, 1, 1, 1, 1,
-1.083861, -0.4858678, -5.260569, 1, 1, 1, 1, 1,
-1.066355, -0.9527924, -3.186924, 1, 1, 1, 1, 1,
-1.064774, -0.08243722, -2.522511, 1, 1, 1, 1, 1,
-1.060168, 0.4148746, -0.810892, 1, 1, 1, 1, 1,
-1.052367, 0.2389046, -3.125378, 1, 1, 1, 1, 1,
-1.048543, 0.2903742, -0.5380088, 1, 1, 1, 1, 1,
-1.047306, -1.243334, -3.75774, 1, 1, 1, 1, 1,
-1.044511, 0.1961664, -0.1028034, 1, 1, 1, 1, 1,
-1.04434, -0.7765262, -2.697551, 1, 1, 1, 1, 1,
-1.042125, 0.5877042, -1.707717, 0, 0, 1, 1, 1,
-1.039546, -0.0686205, -1.812587, 1, 0, 0, 1, 1,
-1.033002, 0.424294, -1.7225, 1, 0, 0, 1, 1,
-1.021759, -0.4718457, -2.658643, 1, 0, 0, 1, 1,
-1.018812, -2.535498, -3.017711, 1, 0, 0, 1, 1,
-1.014842, -2.555151, -4.029696, 1, 0, 0, 1, 1,
-1.012383, 1.044548, -0.3965329, 0, 0, 0, 1, 1,
-1.010159, -0.1814564, -2.190882, 0, 0, 0, 1, 1,
-1.006226, 0.8481903, 0.398238, 0, 0, 0, 1, 1,
-1.004899, -0.6577773, -2.551157, 0, 0, 0, 1, 1,
-1.003832, 0.1244746, -0.5679088, 0, 0, 0, 1, 1,
-1.002849, -1.330189, -1.640496, 0, 0, 0, 1, 1,
-0.9994833, 0.953413, -0.4739373, 0, 0, 0, 1, 1,
-0.9980357, 0.8511775, -0.8387277, 1, 1, 1, 1, 1,
-0.9948371, 0.5782295, -2.196279, 1, 1, 1, 1, 1,
-0.9937162, 0.8484517, 1.472371, 1, 1, 1, 1, 1,
-0.9875125, 0.2206795, -0.1204603, 1, 1, 1, 1, 1,
-0.9753194, 0.9900358, 0.7218094, 1, 1, 1, 1, 1,
-0.9721383, 1.875345, -1.577454, 1, 1, 1, 1, 1,
-0.9702473, -0.1629353, -1.631507, 1, 1, 1, 1, 1,
-0.9640989, 1.756301, 0.9462441, 1, 1, 1, 1, 1,
-0.9621328, 0.2215296, -0.9856155, 1, 1, 1, 1, 1,
-0.9613878, -1.054765, -1.407457, 1, 1, 1, 1, 1,
-0.9573782, 0.9659399, -1.727193, 1, 1, 1, 1, 1,
-0.9533986, -1.717963, -3.133247, 1, 1, 1, 1, 1,
-0.9530174, -0.6153666, -0.5468626, 1, 1, 1, 1, 1,
-0.9469861, -0.5466362, -1.523794, 1, 1, 1, 1, 1,
-0.9443992, -0.4011327, -1.562213, 1, 1, 1, 1, 1,
-0.9392247, 1.05356, 0.4997183, 0, 0, 1, 1, 1,
-0.9337554, -0.3751224, -1.745943, 1, 0, 0, 1, 1,
-0.9333255, 1.145084, -1.121847, 1, 0, 0, 1, 1,
-0.9306809, -0.4321758, -2.486088, 1, 0, 0, 1, 1,
-0.9237406, 1.642339, -0.8318074, 1, 0, 0, 1, 1,
-0.9236528, 0.2573228, -1.974434, 1, 0, 0, 1, 1,
-0.9204336, -0.5138452, -3.417798, 0, 0, 0, 1, 1,
-0.9197448, -1.670669, -2.164549, 0, 0, 0, 1, 1,
-0.9132551, -0.09811981, -0.9399049, 0, 0, 0, 1, 1,
-0.9121024, 0.4126528, -0.9036403, 0, 0, 0, 1, 1,
-0.9118503, 1.6927, -1.936394, 0, 0, 0, 1, 1,
-0.9059087, 0.7112086, -0.3979116, 0, 0, 0, 1, 1,
-0.9053242, -0.4840292, -1.676208, 0, 0, 0, 1, 1,
-0.9049101, 0.4711421, -2.524521, 1, 1, 1, 1, 1,
-0.8959311, 2.091331, 0.2610988, 1, 1, 1, 1, 1,
-0.8896904, -0.2993664, -1.810187, 1, 1, 1, 1, 1,
-0.8885594, 0.09274544, -0.2571368, 1, 1, 1, 1, 1,
-0.8871249, 0.4833063, 0.07467286, 1, 1, 1, 1, 1,
-0.8840601, 1.409571, -0.2270819, 1, 1, 1, 1, 1,
-0.8834715, 0.4926627, -2.718524, 1, 1, 1, 1, 1,
-0.8774169, 0.1942959, -2.124056, 1, 1, 1, 1, 1,
-0.8709244, 0.3121799, -2.114873, 1, 1, 1, 1, 1,
-0.864297, 0.9252807, -0.8637379, 1, 1, 1, 1, 1,
-0.8589342, 1.948729, 0.1804129, 1, 1, 1, 1, 1,
-0.840332, -0.3469294, -2.425664, 1, 1, 1, 1, 1,
-0.8377017, 0.4265465, -2.962448, 1, 1, 1, 1, 1,
-0.8365598, -0.5318277, -1.479435, 1, 1, 1, 1, 1,
-0.8360195, -1.594389, -2.989422, 1, 1, 1, 1, 1,
-0.8351498, -0.3831818, -3.942223, 0, 0, 1, 1, 1,
-0.8343019, -1.275361, -3.41787, 1, 0, 0, 1, 1,
-0.8320525, -0.01275134, -0.9627911, 1, 0, 0, 1, 1,
-0.8301146, -0.2662099, -1.510487, 1, 0, 0, 1, 1,
-0.8294401, 0.1716939, -1.347074, 1, 0, 0, 1, 1,
-0.8241627, 0.1229984, -0.9689796, 1, 0, 0, 1, 1,
-0.8218751, -0.4455474, -2.48162, 0, 0, 0, 1, 1,
-0.8215811, -0.2421267, -1.619665, 0, 0, 0, 1, 1,
-0.8188656, -0.9891607, -2.972191, 0, 0, 0, 1, 1,
-0.8168614, 0.6614795, -0.6763309, 0, 0, 0, 1, 1,
-0.8002238, 1.155992, -2.92905, 0, 0, 0, 1, 1,
-0.7831551, -0.1854395, -1.615761, 0, 0, 0, 1, 1,
-0.7813864, 0.4904843, -1.574072, 0, 0, 0, 1, 1,
-0.7806799, 0.9505937, -1.277481, 1, 1, 1, 1, 1,
-0.7787685, 2.292251, -0.08369926, 1, 1, 1, 1, 1,
-0.7723241, -0.9791504, -0.6852435, 1, 1, 1, 1, 1,
-0.7701828, 0.1837086, 1.058586, 1, 1, 1, 1, 1,
-0.7681189, 0.6425183, -1.634158, 1, 1, 1, 1, 1,
-0.7605369, 0.1286856, -1.829406, 1, 1, 1, 1, 1,
-0.7577938, -1.288363, -2.363842, 1, 1, 1, 1, 1,
-0.7532406, 1.429728, -0.05175536, 1, 1, 1, 1, 1,
-0.7455269, -1.314178, -1.1606, 1, 1, 1, 1, 1,
-0.7344765, -0.5195745, -2.398056, 1, 1, 1, 1, 1,
-0.7338867, -1.239237, -2.603657, 1, 1, 1, 1, 1,
-0.7317215, -0.6184172, -3.774806, 1, 1, 1, 1, 1,
-0.7303602, 0.6976775, -0.4599806, 1, 1, 1, 1, 1,
-0.7261828, -0.6667038, -2.534478, 1, 1, 1, 1, 1,
-0.7236417, 0.6401006, -2.178638, 1, 1, 1, 1, 1,
-0.7220994, -0.3144589, -1.861179, 0, 0, 1, 1, 1,
-0.7197842, -1.102263, -2.788234, 1, 0, 0, 1, 1,
-0.7091713, -1.062849, -4.57144, 1, 0, 0, 1, 1,
-0.7090425, 0.7035332, -1.118629, 1, 0, 0, 1, 1,
-0.7036082, 0.6839427, -1.939753, 1, 0, 0, 1, 1,
-0.7019532, -0.6924949, -3.742503, 1, 0, 0, 1, 1,
-0.7002491, -0.3018458, -1.77338, 0, 0, 0, 1, 1,
-0.6989269, -0.830707, -1.794797, 0, 0, 0, 1, 1,
-0.6975245, -2.086328, -3.283552, 0, 0, 0, 1, 1,
-0.6897491, 1.119246, -0.7429786, 0, 0, 0, 1, 1,
-0.6890007, 0.863242, -0.8129991, 0, 0, 0, 1, 1,
-0.676299, 1.228049, -1.319643, 0, 0, 0, 1, 1,
-0.6755486, 0.2183345, -0.6565369, 0, 0, 0, 1, 1,
-0.6736073, -0.2286317, -1.226199, 1, 1, 1, 1, 1,
-0.6717921, -1.366019, -2.791655, 1, 1, 1, 1, 1,
-0.6655163, -1.518194, -2.140659, 1, 1, 1, 1, 1,
-0.6598516, 0.5748618, 0.3966831, 1, 1, 1, 1, 1,
-0.658362, 0.2365867, -0.2732254, 1, 1, 1, 1, 1,
-0.6556444, 0.4304635, 0.3649256, 1, 1, 1, 1, 1,
-0.652614, 0.45064, -0.2382415, 1, 1, 1, 1, 1,
-0.6498398, 1.660842, -0.7523496, 1, 1, 1, 1, 1,
-0.6468287, -0.6184575, -1.608398, 1, 1, 1, 1, 1,
-0.6402121, 0.4006658, -1.332971, 1, 1, 1, 1, 1,
-0.6318438, 1.44551, 1.073055, 1, 1, 1, 1, 1,
-0.6238758, 0.4406681, 0.281201, 1, 1, 1, 1, 1,
-0.6218855, 0.8845823, -0.2129368, 1, 1, 1, 1, 1,
-0.6217237, 1.10882, -2.3877, 1, 1, 1, 1, 1,
-0.6194881, 0.004546276, -2.17762, 1, 1, 1, 1, 1,
-0.6179712, 0.5688797, -2.691445, 0, 0, 1, 1, 1,
-0.612509, -0.4185629, -2.884774, 1, 0, 0, 1, 1,
-0.6113529, 0.3951762, -0.4278812, 1, 0, 0, 1, 1,
-0.6105849, 0.5832031, -0.689994, 1, 0, 0, 1, 1,
-0.6032711, -2.55827, -3.991203, 1, 0, 0, 1, 1,
-0.6017712, 1.601325, 0.8146181, 1, 0, 0, 1, 1,
-0.6016914, 0.7118447, 1.405349, 0, 0, 0, 1, 1,
-0.6015588, 0.03307143, -0.3399212, 0, 0, 0, 1, 1,
-0.598963, -0.2700739, -2.963732, 0, 0, 0, 1, 1,
-0.5949467, -1.366732, -2.746319, 0, 0, 0, 1, 1,
-0.5941814, -0.7075376, -4.041464, 0, 0, 0, 1, 1,
-0.5901902, -0.9927734, -3.001989, 0, 0, 0, 1, 1,
-0.5892487, 0.1588875, -0.4502544, 0, 0, 0, 1, 1,
-0.5871572, -1.028231, -2.65574, 1, 1, 1, 1, 1,
-0.5839194, 0.7772265, -1.662157, 1, 1, 1, 1, 1,
-0.5805498, 0.3412046, -1.144373, 1, 1, 1, 1, 1,
-0.5805067, -0.1166222, -0.724368, 1, 1, 1, 1, 1,
-0.5758086, 0.7198442, -1.348169, 1, 1, 1, 1, 1,
-0.5753062, 1.409407, -2.585719, 1, 1, 1, 1, 1,
-0.5739623, -1.332388, -2.448807, 1, 1, 1, 1, 1,
-0.5726056, -0.9738631, -0.965825, 1, 1, 1, 1, 1,
-0.571283, 0.1194968, -3.444714, 1, 1, 1, 1, 1,
-0.5685927, 0.2176784, -1.671985, 1, 1, 1, 1, 1,
-0.5644731, -0.6197271, -1.152204, 1, 1, 1, 1, 1,
-0.5550356, -0.526748, -3.635962, 1, 1, 1, 1, 1,
-0.5520906, 0.05058787, -1.153574, 1, 1, 1, 1, 1,
-0.5465933, 1.443972, -1.214685, 1, 1, 1, 1, 1,
-0.5450537, -0.09275194, -1.626162, 1, 1, 1, 1, 1,
-0.542318, -0.9476323, -2.906984, 0, 0, 1, 1, 1,
-0.5386181, 0.3753901, -0.6972746, 1, 0, 0, 1, 1,
-0.5318597, -0.2327198, -2.977644, 1, 0, 0, 1, 1,
-0.5286465, 0.9285296, -1.86249, 1, 0, 0, 1, 1,
-0.5276741, 1.711006, -0.8632792, 1, 0, 0, 1, 1,
-0.5261063, -0.06752272, -2.441957, 1, 0, 0, 1, 1,
-0.5240404, 0.355423, -1.867229, 0, 0, 0, 1, 1,
-0.5189044, 0.216443, 0.04276453, 0, 0, 0, 1, 1,
-0.5117344, -0.2010073, -0.2573541, 0, 0, 0, 1, 1,
-0.511227, 0.6584137, 0.3955836, 0, 0, 0, 1, 1,
-0.5106596, -0.03493824, -1.299432, 0, 0, 0, 1, 1,
-0.5104623, 0.07768422, -0.05445604, 0, 0, 0, 1, 1,
-0.5080971, -1.761007, -3.05442, 0, 0, 0, 1, 1,
-0.5067905, -3.327215, -1.82944, 1, 1, 1, 1, 1,
-0.506487, 1.670288, 0.547591, 1, 1, 1, 1, 1,
-0.5033632, -0.4065347, -2.974337, 1, 1, 1, 1, 1,
-0.5020771, -0.5696731, -3.071998, 1, 1, 1, 1, 1,
-0.4990626, -1.307086, -1.300623, 1, 1, 1, 1, 1,
-0.4981484, -0.6956412, -1.580659, 1, 1, 1, 1, 1,
-0.4950532, -0.4840296, -2.196444, 1, 1, 1, 1, 1,
-0.4938148, -0.8979592, -2.438912, 1, 1, 1, 1, 1,
-0.4930745, -1.045457, -2.869961, 1, 1, 1, 1, 1,
-0.4916224, 0.4863154, -0.836974, 1, 1, 1, 1, 1,
-0.4885862, 1.334428, -1.545742, 1, 1, 1, 1, 1,
-0.4883768, -0.7653454, -2.504403, 1, 1, 1, 1, 1,
-0.4871316, -0.4412238, -1.579777, 1, 1, 1, 1, 1,
-0.4865052, 0.5834492, -0.6762818, 1, 1, 1, 1, 1,
-0.484443, 0.4629989, -0.6747991, 1, 1, 1, 1, 1,
-0.4776157, -0.8596255, -3.20298, 0, 0, 1, 1, 1,
-0.4645213, -1.464456, -2.090838, 1, 0, 0, 1, 1,
-0.4574748, -0.1257568, -2.796155, 1, 0, 0, 1, 1,
-0.4457282, 0.2135965, -2.545935, 1, 0, 0, 1, 1,
-0.4440552, -0.07796331, -0.6934804, 1, 0, 0, 1, 1,
-0.4438368, -0.4185903, -1.738184, 1, 0, 0, 1, 1,
-0.4394873, 0.8552196, -0.282322, 0, 0, 0, 1, 1,
-0.437693, 0.1388045, -0.686616, 0, 0, 0, 1, 1,
-0.4372197, -1.982595, -2.810341, 0, 0, 0, 1, 1,
-0.4318222, -0.6893818, -1.822774, 0, 0, 0, 1, 1,
-0.4314272, -0.8659033, -2.988857, 0, 0, 0, 1, 1,
-0.4298497, 0.3879358, -0.3101865, 0, 0, 0, 1, 1,
-0.4261757, -0.3171459, 0.1002219, 0, 0, 0, 1, 1,
-0.423085, 0.32107, -1.17536, 1, 1, 1, 1, 1,
-0.4184773, -0.1405087, -2.265878, 1, 1, 1, 1, 1,
-0.4114672, 0.9936172, -1.621646, 1, 1, 1, 1, 1,
-0.411146, -0.8082716, -2.153928, 1, 1, 1, 1, 1,
-0.4063917, -0.7046856, -1.690812, 1, 1, 1, 1, 1,
-0.405549, 1.040975, -0.7932211, 1, 1, 1, 1, 1,
-0.4033071, -1.149542, -3.311645, 1, 1, 1, 1, 1,
-0.3987632, -0.5947534, -3.315544, 1, 1, 1, 1, 1,
-0.3832798, -0.5681937, -2.648885, 1, 1, 1, 1, 1,
-0.3824957, 0.5270789, -0.368173, 1, 1, 1, 1, 1,
-0.3821002, 0.9293717, -0.2203513, 1, 1, 1, 1, 1,
-0.3795587, -0.1591941, -3.269715, 1, 1, 1, 1, 1,
-0.3769093, -0.526091, -3.410298, 1, 1, 1, 1, 1,
-0.3762529, -0.8469042, -2.870244, 1, 1, 1, 1, 1,
-0.3755281, 1.119297, 0.4979619, 1, 1, 1, 1, 1,
-0.3693784, 0.6260678, -1.291656, 0, 0, 1, 1, 1,
-0.3658442, -1.092985, -2.342999, 1, 0, 0, 1, 1,
-0.3654664, -0.3373755, -1.439998, 1, 0, 0, 1, 1,
-0.3633069, -0.2748258, -2.337936, 1, 0, 0, 1, 1,
-0.3580222, -0.4807607, -2.593731, 1, 0, 0, 1, 1,
-0.357649, -0.1170015, -2.666273, 1, 0, 0, 1, 1,
-0.3538985, -0.7124457, -1.909134, 0, 0, 0, 1, 1,
-0.353488, -0.1775968, -2.719096, 0, 0, 0, 1, 1,
-0.353312, -1.802432, -1.743483, 0, 0, 0, 1, 1,
-0.3492723, -0.4525049, -4.133031, 0, 0, 0, 1, 1,
-0.3439232, 0.02960452, -1.750317, 0, 0, 0, 1, 1,
-0.3428782, 0.2581872, -1.866679, 0, 0, 0, 1, 1,
-0.3294569, -0.6302038, -2.778431, 0, 0, 0, 1, 1,
-0.3271805, -1.273463, -2.787274, 1, 1, 1, 1, 1,
-0.3188891, 0.04046999, -0.7021411, 1, 1, 1, 1, 1,
-0.318625, -0.08199676, -2.004475, 1, 1, 1, 1, 1,
-0.3172175, -0.2960612, -1.005677, 1, 1, 1, 1, 1,
-0.315289, -0.1303299, -2.370304, 1, 1, 1, 1, 1,
-0.309553, -1.299401, -3.731823, 1, 1, 1, 1, 1,
-0.3091704, 1.505445, 0.627174, 1, 1, 1, 1, 1,
-0.3087268, 1.725335, 0.3872928, 1, 1, 1, 1, 1,
-0.3086119, 1.806815, -0.1641642, 1, 1, 1, 1, 1,
-0.3083864, -0.3092667, -2.280523, 1, 1, 1, 1, 1,
-0.304564, -0.2810268, -2.14546, 1, 1, 1, 1, 1,
-0.2987769, 0.02984283, -2.967275, 1, 1, 1, 1, 1,
-0.2987116, 1.198774, -2.429341, 1, 1, 1, 1, 1,
-0.2978448, -1.021888, -4.424576, 1, 1, 1, 1, 1,
-0.2974774, 0.8070104, -2.041506, 1, 1, 1, 1, 1,
-0.2963513, -2.077008, -2.963137, 0, 0, 1, 1, 1,
-0.2955522, 1.876729, 0.4211457, 1, 0, 0, 1, 1,
-0.2821042, 0.7776754, 0.0226678, 1, 0, 0, 1, 1,
-0.2819417, -0.5326846, -3.020081, 1, 0, 0, 1, 1,
-0.2762277, -1.187251, -2.064067, 1, 0, 0, 1, 1,
-0.2745948, 0.2382611, -2.920032, 1, 0, 0, 1, 1,
-0.273288, -0.1768461, -2.33432, 0, 0, 0, 1, 1,
-0.2714154, -0.6664936, -4.044238, 0, 0, 0, 1, 1,
-0.2710246, 0.9202862, 0.2563372, 0, 0, 0, 1, 1,
-0.2657602, 0.02393309, -0.6892686, 0, 0, 0, 1, 1,
-0.2652218, -3.047756, -3.236253, 0, 0, 0, 1, 1,
-0.2644748, 0.4373463, 1.23013, 0, 0, 0, 1, 1,
-0.2614037, 1.378672, -0.395174, 0, 0, 0, 1, 1,
-0.2613535, 0.7471045, -0.7278229, 1, 1, 1, 1, 1,
-0.2604165, 0.2465072, -2.835024, 1, 1, 1, 1, 1,
-0.2588406, 0.542565, -1.271929, 1, 1, 1, 1, 1,
-0.2576951, -1.15513, -3.330567, 1, 1, 1, 1, 1,
-0.2534789, 1.263198, -0.2108111, 1, 1, 1, 1, 1,
-0.2506246, -0.4014177, -2.407274, 1, 1, 1, 1, 1,
-0.2476057, 0.174337, -2.129787, 1, 1, 1, 1, 1,
-0.2452082, 1.05198, 1.121109, 1, 1, 1, 1, 1,
-0.2423575, -0.2468062, -2.193457, 1, 1, 1, 1, 1,
-0.2420897, -0.5162088, -2.372033, 1, 1, 1, 1, 1,
-0.2367247, 0.06217466, -0.184546, 1, 1, 1, 1, 1,
-0.2286999, 0.9714246, 0.45259, 1, 1, 1, 1, 1,
-0.2273158, 0.4397419, -0.6636316, 1, 1, 1, 1, 1,
-0.2248782, -0.4060647, -3.706719, 1, 1, 1, 1, 1,
-0.2238136, -1.192995, -2.066746, 1, 1, 1, 1, 1,
-0.2216528, -0.2301845, -1.861565, 0, 0, 1, 1, 1,
-0.2208067, 1.242465, 1.272035, 1, 0, 0, 1, 1,
-0.220413, 0.2187919, -0.4370392, 1, 0, 0, 1, 1,
-0.2183255, -0.02642315, -3.067996, 1, 0, 0, 1, 1,
-0.2181227, 0.568951, 0.2024533, 1, 0, 0, 1, 1,
-0.2169944, 0.3626076, 0.0789196, 1, 0, 0, 1, 1,
-0.2169274, 1.113418, -0.4101377, 0, 0, 0, 1, 1,
-0.2160763, 1.419136, -0.5733057, 0, 0, 0, 1, 1,
-0.2156933, 1.053898, 0.5700642, 0, 0, 0, 1, 1,
-0.2028478, -0.4991302, -1.913644, 0, 0, 0, 1, 1,
-0.1953869, 0.008461718, -2.727328, 0, 0, 0, 1, 1,
-0.1930198, -0.5312976, -4.201126, 0, 0, 0, 1, 1,
-0.1866702, 0.4182459, -0.2616297, 0, 0, 0, 1, 1,
-0.1855418, 1.816395, 0.0649879, 1, 1, 1, 1, 1,
-0.1854708, 0.06945553, -1.970081, 1, 1, 1, 1, 1,
-0.1854012, 0.5013445, -2.525341, 1, 1, 1, 1, 1,
-0.1827263, 0.04007737, -0.9268519, 1, 1, 1, 1, 1,
-0.182607, -0.9301193, -3.880403, 1, 1, 1, 1, 1,
-0.1801052, -0.7436556, -2.312504, 1, 1, 1, 1, 1,
-0.1755013, -0.05081966, -3.221181, 1, 1, 1, 1, 1,
-0.1723194, 1.800738, -0.4861226, 1, 1, 1, 1, 1,
-0.1696406, 0.323361, 0.8822182, 1, 1, 1, 1, 1,
-0.1608329, -0.498954, -3.474449, 1, 1, 1, 1, 1,
-0.1560523, -0.7637751, -3.843956, 1, 1, 1, 1, 1,
-0.1546275, 0.4981033, 1.467911, 1, 1, 1, 1, 1,
-0.1517958, 0.2025816, -0.9021583, 1, 1, 1, 1, 1,
-0.1510451, 1.644406, 0.8513648, 1, 1, 1, 1, 1,
-0.1480485, -1.100764, -2.346661, 1, 1, 1, 1, 1,
-0.1417856, 1.435451, 1.531747, 0, 0, 1, 1, 1,
-0.1409544, 0.4309075, -1.233563, 1, 0, 0, 1, 1,
-0.1383807, 1.375178, -1.24436, 1, 0, 0, 1, 1,
-0.1365212, 0.8133421, -1.114763, 1, 0, 0, 1, 1,
-0.1352241, -0.8273339, -3.860821, 1, 0, 0, 1, 1,
-0.1345449, -2.410704, -2.754638, 1, 0, 0, 1, 1,
-0.1337327, -0.7867744, -5.768678, 0, 0, 0, 1, 1,
-0.1332248, -0.84465, -2.489145, 0, 0, 0, 1, 1,
-0.1294794, -0.1763321, -3.819277, 0, 0, 0, 1, 1,
-0.1282403, -0.990435, -3.91486, 0, 0, 0, 1, 1,
-0.1267935, 0.9564512, -2.658845, 0, 0, 0, 1, 1,
-0.123299, -0.114537, -2.425297, 0, 0, 0, 1, 1,
-0.1196167, -0.7626788, -1.854927, 0, 0, 0, 1, 1,
-0.1134251, 1.029434, -1.037291, 1, 1, 1, 1, 1,
-0.1131794, -0.8733584, -4.381976, 1, 1, 1, 1, 1,
-0.1082852, 0.00511893, -2.129038, 1, 1, 1, 1, 1,
-0.1056434, 0.2613262, 0.23567, 1, 1, 1, 1, 1,
-0.1052796, 0.9643264, -1.022829, 1, 1, 1, 1, 1,
-0.1033843, 0.4827437, -0.5881783, 1, 1, 1, 1, 1,
-0.09935512, 0.6129976, 0.7453123, 1, 1, 1, 1, 1,
-0.09927108, -0.8189822, -3.971483, 1, 1, 1, 1, 1,
-0.0984855, 0.2379636, -0.003908028, 1, 1, 1, 1, 1,
-0.09829701, -1.682478, -2.202251, 1, 1, 1, 1, 1,
-0.0967032, 2.074807, -0.3961949, 1, 1, 1, 1, 1,
-0.09006105, 1.067704, 0.2318082, 1, 1, 1, 1, 1,
-0.08931401, 1.991125, 0.3152435, 1, 1, 1, 1, 1,
-0.08884215, 0.1003669, 0.3111385, 1, 1, 1, 1, 1,
-0.08509777, -0.3539216, -4.454476, 1, 1, 1, 1, 1,
-0.08058911, 1.040457, -0.07557432, 0, 0, 1, 1, 1,
-0.07976417, 1.947246, 0.4868683, 1, 0, 0, 1, 1,
-0.07352984, -0.3911017, -1.562186, 1, 0, 0, 1, 1,
-0.07255442, -0.557004, -3.02966, 1, 0, 0, 1, 1,
-0.07199313, -0.3976463, -4.512893, 1, 0, 0, 1, 1,
-0.06898295, -0.207924, -1.057183, 1, 0, 0, 1, 1,
-0.06874271, 0.9910504, -0.2024755, 0, 0, 0, 1, 1,
-0.06715796, 0.4949744, 0.902614, 0, 0, 0, 1, 1,
-0.06262788, -2.319851, -2.482252, 0, 0, 0, 1, 1,
-0.06022665, 1.117251, -0.670054, 0, 0, 0, 1, 1,
-0.0590652, -0.7740771, -1.794781, 0, 0, 0, 1, 1,
-0.05704629, -0.08643705, -0.6721216, 0, 0, 0, 1, 1,
-0.05420957, 0.8185158, 0.859755, 0, 0, 0, 1, 1,
-0.04904191, -1.387479, -2.655546, 1, 1, 1, 1, 1,
-0.04576104, -1.376459, -1.973293, 1, 1, 1, 1, 1,
-0.04564475, 0.9084032, 0.6908593, 1, 1, 1, 1, 1,
-0.04411523, -0.3878826, -3.456984, 1, 1, 1, 1, 1,
-0.03994036, 1.167783, -0.7994316, 1, 1, 1, 1, 1,
-0.03655948, -1.266246, -4.574104, 1, 1, 1, 1, 1,
-0.0316305, 1.176084, 0.6627457, 1, 1, 1, 1, 1,
-0.03129717, -0.462292, -3.321649, 1, 1, 1, 1, 1,
-0.02750845, 0.3598839, -0.1348024, 1, 1, 1, 1, 1,
-0.02347189, -0.09444299, -2.601497, 1, 1, 1, 1, 1,
-0.02122588, 0.2756242, 0.1439322, 1, 1, 1, 1, 1,
-0.02105056, -0.4097996, -5.014447, 1, 1, 1, 1, 1,
-0.01847812, 1.053898, 0.9519764, 1, 1, 1, 1, 1,
-0.01797352, -0.002915817, -2.089828, 1, 1, 1, 1, 1,
-0.01770352, -0.5732781, -3.082784, 1, 1, 1, 1, 1,
-0.01659807, -0.2011093, -1.847028, 0, 0, 1, 1, 1,
-0.01503019, -0.08153635, -2.346863, 1, 0, 0, 1, 1,
-0.01184483, -1.066075, -4.066775, 1, 0, 0, 1, 1,
-0.01113651, -0.5611717, -1.990319, 1, 0, 0, 1, 1,
-0.007379523, 0.4376072, 0.6987593, 1, 0, 0, 1, 1,
-0.004951289, 0.9466645, -0.1473024, 1, 0, 0, 1, 1,
-0.004567039, -0.5408102, -1.695252, 0, 0, 0, 1, 1,
-0.002957608, -0.1186673, -1.901297, 0, 0, 0, 1, 1,
0.002440451, -1.408779, 4.649092, 0, 0, 0, 1, 1,
0.003712759, -1.632437, 3.068007, 0, 0, 0, 1, 1,
0.004093986, 0.7505711, 1.613257, 0, 0, 0, 1, 1,
0.01240648, 1.58644, -0.5972903, 0, 0, 0, 1, 1,
0.01999742, 1.079932, 0.2781532, 0, 0, 0, 1, 1,
0.02560937, -0.3430207, 2.948713, 1, 1, 1, 1, 1,
0.02829905, -0.1153777, 3.450398, 1, 1, 1, 1, 1,
0.03047703, 1.671451, -0.9145914, 1, 1, 1, 1, 1,
0.03481283, 0.2411298, -0.2402345, 1, 1, 1, 1, 1,
0.04058851, 0.216382, 0.2730692, 1, 1, 1, 1, 1,
0.04173537, 0.5136961, -0.4084468, 1, 1, 1, 1, 1,
0.04498989, -0.1648837, 2.533252, 1, 1, 1, 1, 1,
0.04603145, 1.118956, 0.762709, 1, 1, 1, 1, 1,
0.04659667, -0.5331626, 3.431988, 1, 1, 1, 1, 1,
0.04965384, 1.69896, -0.6157409, 1, 1, 1, 1, 1,
0.05236233, 0.6269867, -0.3411868, 1, 1, 1, 1, 1,
0.05267653, 0.1250258, 1.325741, 1, 1, 1, 1, 1,
0.0534452, -0.8149786, 4.521046, 1, 1, 1, 1, 1,
0.055694, -0.1265529, 3.311879, 1, 1, 1, 1, 1,
0.0600557, -0.9253471, 1.451895, 1, 1, 1, 1, 1,
0.07127323, -1.456235, 2.739256, 0, 0, 1, 1, 1,
0.07183376, 0.1264154, 0.1092965, 1, 0, 0, 1, 1,
0.07275217, -1.135476, 3.804238, 1, 0, 0, 1, 1,
0.07354527, -1.661357, 4.684455, 1, 0, 0, 1, 1,
0.07482559, -0.09385391, 1.487347, 1, 0, 0, 1, 1,
0.07503682, -0.2273285, 2.695256, 1, 0, 0, 1, 1,
0.08082498, -0.5361775, 4.22122, 0, 0, 0, 1, 1,
0.0848491, 1.329493, 0.02704708, 0, 0, 0, 1, 1,
0.08486717, -0.4538521, 3.653115, 0, 0, 0, 1, 1,
0.08541099, 3.496021, -0.2486386, 0, 0, 0, 1, 1,
0.08628476, 0.3439677, 1.054983, 0, 0, 0, 1, 1,
0.09452513, -0.7758561, 3.147288, 0, 0, 0, 1, 1,
0.1019096, 0.6243114, 0.460086, 0, 0, 0, 1, 1,
0.1026236, -0.8208295, 2.383336, 1, 1, 1, 1, 1,
0.1032822, -0.1566383, 3.455153, 1, 1, 1, 1, 1,
0.1056748, 0.3586893, 1.24241, 1, 1, 1, 1, 1,
0.1106256, 0.443653, 1.231431, 1, 1, 1, 1, 1,
0.1108519, -1.613833, 2.907416, 1, 1, 1, 1, 1,
0.1128492, 0.4307537, -0.4477265, 1, 1, 1, 1, 1,
0.1128547, 0.7597895, -0.5664247, 1, 1, 1, 1, 1,
0.1139585, -1.106222, 4.466336, 1, 1, 1, 1, 1,
0.1147588, -0.08991299, 2.69882, 1, 1, 1, 1, 1,
0.1148032, 1.124907, -0.1033816, 1, 1, 1, 1, 1,
0.1158856, -0.5176284, 2.769342, 1, 1, 1, 1, 1,
0.11673, 1.687176, 0.9683386, 1, 1, 1, 1, 1,
0.1179057, -1.234214, 2.573122, 1, 1, 1, 1, 1,
0.1182934, -0.2058655, 3.828881, 1, 1, 1, 1, 1,
0.1191745, 0.795841, 0.8193361, 1, 1, 1, 1, 1,
0.1192469, -0.9647138, 3.002868, 0, 0, 1, 1, 1,
0.1196643, -2.624024, 2.310666, 1, 0, 0, 1, 1,
0.1253264, 0.1807187, 0.6591334, 1, 0, 0, 1, 1,
0.1301247, 0.3453493, 1.492686, 1, 0, 0, 1, 1,
0.1310168, -0.1718353, 4.508119, 1, 0, 0, 1, 1,
0.1323127, -0.5981527, 3.15713, 1, 0, 0, 1, 1,
0.1340973, 1.606188, 0.6226119, 0, 0, 0, 1, 1,
0.1347533, -0.7422653, 2.862892, 0, 0, 0, 1, 1,
0.1352399, -0.4679881, 1.504021, 0, 0, 0, 1, 1,
0.1354039, -0.3572041, 2.755037, 0, 0, 0, 1, 1,
0.1385227, 0.7743185, 1.98745, 0, 0, 0, 1, 1,
0.143247, 0.1015611, 1.211076, 0, 0, 0, 1, 1,
0.144079, -1.048364, 4.475151, 0, 0, 0, 1, 1,
0.145085, -1.310572, 3.017784, 1, 1, 1, 1, 1,
0.1491274, -1.185074, 2.325846, 1, 1, 1, 1, 1,
0.1500854, -0.1817597, 1.853158, 1, 1, 1, 1, 1,
0.1525913, 0.5437946, 0.3391855, 1, 1, 1, 1, 1,
0.1550803, -0.2019502, 3.089935, 1, 1, 1, 1, 1,
0.1601904, -0.357422, 4.832894, 1, 1, 1, 1, 1,
0.1614874, -0.08483352, 0.8714618, 1, 1, 1, 1, 1,
0.1630206, -1.273698, 2.216452, 1, 1, 1, 1, 1,
0.1632248, 0.2229869, -1.544619, 1, 1, 1, 1, 1,
0.1659856, 0.7004303, 0.1373061, 1, 1, 1, 1, 1,
0.1734179, -0.6512824, 2.329284, 1, 1, 1, 1, 1,
0.1746758, -0.0815229, 1.421753, 1, 1, 1, 1, 1,
0.1811898, 0.04165502, 1.310255, 1, 1, 1, 1, 1,
0.1851045, -0.3229807, 0.7596026, 1, 1, 1, 1, 1,
0.1858549, 0.5426242, -0.4675483, 1, 1, 1, 1, 1,
0.1865161, -0.4445446, 4.260252, 0, 0, 1, 1, 1,
0.1880227, -0.2260007, 4.403883, 1, 0, 0, 1, 1,
0.1921455, -0.6108159, 2.489353, 1, 0, 0, 1, 1,
0.1946818, -0.09417698, 3.312102, 1, 0, 0, 1, 1,
0.1950114, -0.1793383, 1.554243, 1, 0, 0, 1, 1,
0.1962092, 0.1526642, 0.8225182, 1, 0, 0, 1, 1,
0.2058308, -0.4731126, 0.8276895, 0, 0, 0, 1, 1,
0.2083044, -0.1803241, 2.028183, 0, 0, 0, 1, 1,
0.2135628, 2.270787, -0.3051089, 0, 0, 0, 1, 1,
0.2146461, -0.2447906, 2.085094, 0, 0, 0, 1, 1,
0.2147574, -1.52709, 1.067392, 0, 0, 0, 1, 1,
0.2150311, -0.453059, 1.241286, 0, 0, 0, 1, 1,
0.2174445, -1.371235, 3.229758, 0, 0, 0, 1, 1,
0.2177791, -1.032328, 2.091439, 1, 1, 1, 1, 1,
0.2183573, 0.02431897, 1.740581, 1, 1, 1, 1, 1,
0.2198737, 0.09611525, -0.1947102, 1, 1, 1, 1, 1,
0.2207953, 0.02875631, 0.8337076, 1, 1, 1, 1, 1,
0.2254739, 1.08375, 0.7001637, 1, 1, 1, 1, 1,
0.2269555, 0.08556803, -0.4323498, 1, 1, 1, 1, 1,
0.2313844, 0.7696047, 0.3565253, 1, 1, 1, 1, 1,
0.2369137, 1.457563, 0.2099852, 1, 1, 1, 1, 1,
0.2395842, 0.9294531, 0.09541117, 1, 1, 1, 1, 1,
0.2416719, -1.671763, 2.868389, 1, 1, 1, 1, 1,
0.2435757, 2.416275, -2.128834, 1, 1, 1, 1, 1,
0.2438899, 0.7921896, -1.46901, 1, 1, 1, 1, 1,
0.245631, 0.9293143, 2.145133, 1, 1, 1, 1, 1,
0.2466611, -0.8998322, 3.001222, 1, 1, 1, 1, 1,
0.2514464, 0.6608132, 0.2943392, 1, 1, 1, 1, 1,
0.2525451, -0.07657268, 1.144696, 0, 0, 1, 1, 1,
0.253815, 1.970277, -0.7638756, 1, 0, 0, 1, 1,
0.2559091, -0.8681983, 2.955854, 1, 0, 0, 1, 1,
0.2599778, 0.4051561, 2.453103, 1, 0, 0, 1, 1,
0.2602133, 0.4797669, 1.974336, 1, 0, 0, 1, 1,
0.2611691, -0.05252445, 0.8209162, 1, 0, 0, 1, 1,
0.2658376, -0.5129246, 2.11593, 0, 0, 0, 1, 1,
0.2707117, -0.6830502, 2.205527, 0, 0, 0, 1, 1,
0.2727984, 1.062421, 1.027248, 0, 0, 0, 1, 1,
0.2740407, 0.4176801, 1.763912, 0, 0, 0, 1, 1,
0.2743027, -0.2460858, 2.533357, 0, 0, 0, 1, 1,
0.277176, -0.8605713, 2.340581, 0, 0, 0, 1, 1,
0.2782879, -0.7692016, 5.041226, 0, 0, 0, 1, 1,
0.2797789, 0.8039426, 0.6816209, 1, 1, 1, 1, 1,
0.2832061, 0.2092, 1.326325, 1, 1, 1, 1, 1,
0.2858795, -1.649787, 3.714839, 1, 1, 1, 1, 1,
0.2881992, -1.1891, 2.977333, 1, 1, 1, 1, 1,
0.2919358, -0.2408485, 3.344249, 1, 1, 1, 1, 1,
0.295543, -0.5840755, 4.660234, 1, 1, 1, 1, 1,
0.2963955, 0.2920385, 0.4075919, 1, 1, 1, 1, 1,
0.2980695, -0.4820967, 2.787496, 1, 1, 1, 1, 1,
0.3150661, 0.8238997, 1.894811, 1, 1, 1, 1, 1,
0.3205428, -0.8074206, 3.616524, 1, 1, 1, 1, 1,
0.3209771, 0.6080559, -0.9159057, 1, 1, 1, 1, 1,
0.3213777, 1.343522, 0.8582166, 1, 1, 1, 1, 1,
0.3227379, -1.213978, 2.199653, 1, 1, 1, 1, 1,
0.3237098, -0.5280247, 4.184525, 1, 1, 1, 1, 1,
0.3240177, -0.7235453, 4.232774, 1, 1, 1, 1, 1,
0.3255306, -2.642764, 3.71117, 0, 0, 1, 1, 1,
0.326436, 0.1893307, -0.2429833, 1, 0, 0, 1, 1,
0.3283177, -0.4983076, 5.19016, 1, 0, 0, 1, 1,
0.3300233, -0.6130636, 3.72428, 1, 0, 0, 1, 1,
0.3354441, -1.111655, 2.412126, 1, 0, 0, 1, 1,
0.3372158, 2.175824, -0.6093704, 1, 0, 0, 1, 1,
0.3394089, -0.05458391, 2.127813, 0, 0, 0, 1, 1,
0.3417846, -0.5063229, 3.16719, 0, 0, 0, 1, 1,
0.3426233, -0.6738128, 2.157725, 0, 0, 0, 1, 1,
0.3426356, -0.4068021, 3.389502, 0, 0, 0, 1, 1,
0.3464573, 1.77977, -0.1463695, 0, 0, 0, 1, 1,
0.3475629, -1.056755, 1.804044, 0, 0, 0, 1, 1,
0.3488409, -0.8861317, 4.05761, 0, 0, 0, 1, 1,
0.3528264, -0.7927064, 2.609622, 1, 1, 1, 1, 1,
0.3547048, 0.3052737, 0.2029178, 1, 1, 1, 1, 1,
0.3632756, 0.2800189, -0.4057595, 1, 1, 1, 1, 1,
0.3667873, -1.287672, 2.953798, 1, 1, 1, 1, 1,
0.3676838, 1.471624, 0.2660933, 1, 1, 1, 1, 1,
0.3697023, -1.630344, 3.427162, 1, 1, 1, 1, 1,
0.3709434, -1.182891, 1.462906, 1, 1, 1, 1, 1,
0.3744524, -1.033214, 2.879724, 1, 1, 1, 1, 1,
0.3760208, -1.262966, 2.507661, 1, 1, 1, 1, 1,
0.3778951, -0.7428805, 3.037145, 1, 1, 1, 1, 1,
0.3823134, 2.150829, -2.857662, 1, 1, 1, 1, 1,
0.3854003, 0.5804794, 0.315477, 1, 1, 1, 1, 1,
0.3875901, -0.6230865, 2.556792, 1, 1, 1, 1, 1,
0.3905528, 0.4256099, 0.6713484, 1, 1, 1, 1, 1,
0.3910318, 1.111779, -0.4343128, 1, 1, 1, 1, 1,
0.3929539, 1.350832, 0.1805767, 0, 0, 1, 1, 1,
0.3954146, 1.445671, 0.9818041, 1, 0, 0, 1, 1,
0.3962106, -0.241883, 1.382818, 1, 0, 0, 1, 1,
0.3977008, 1.140162, 1.518944, 1, 0, 0, 1, 1,
0.3987401, 0.1497201, 1.252274, 1, 0, 0, 1, 1,
0.3997536, 0.2623211, 0.481998, 1, 0, 0, 1, 1,
0.4080237, -0.2118712, 1.956248, 0, 0, 0, 1, 1,
0.41076, 0.7033145, 0.006773461, 0, 0, 0, 1, 1,
0.4108436, -0.3952965, 1.008076, 0, 0, 0, 1, 1,
0.4175626, 0.316076, 1.42759, 0, 0, 0, 1, 1,
0.4193858, 1.719883, -0.2429628, 0, 0, 0, 1, 1,
0.4210214, 1.577703, 0.5471231, 0, 0, 0, 1, 1,
0.4215391, 1.598584, 1.49549, 0, 0, 0, 1, 1,
0.431815, 1.047889, 1.321218, 1, 1, 1, 1, 1,
0.4346933, 0.5745872, 1.245346, 1, 1, 1, 1, 1,
0.435678, 0.6523094, 0.484268, 1, 1, 1, 1, 1,
0.4390881, 0.3536828, 0.07806461, 1, 1, 1, 1, 1,
0.446201, 1.056537, 0.01963196, 1, 1, 1, 1, 1,
0.4504762, -0.7615998, 3.0232, 1, 1, 1, 1, 1,
0.4518306, -1.025997, 1.443949, 1, 1, 1, 1, 1,
0.4571077, -0.08600413, 2.669693, 1, 1, 1, 1, 1,
0.4612523, 1.355127, -0.4841292, 1, 1, 1, 1, 1,
0.4666799, -1.47605, 2.426437, 1, 1, 1, 1, 1,
0.4680731, 0.4495175, -0.5926111, 1, 1, 1, 1, 1,
0.4684846, 0.6970441, 0.7826684, 1, 1, 1, 1, 1,
0.4728408, -0.489423, 2.917661, 1, 1, 1, 1, 1,
0.4745513, 0.7978538, 0.3739029, 1, 1, 1, 1, 1,
0.4763857, -1.078776, 3.438747, 1, 1, 1, 1, 1,
0.4789522, -2.068611, 2.727906, 0, 0, 1, 1, 1,
0.4815217, 1.005502, 0.4458801, 1, 0, 0, 1, 1,
0.4821316, 0.2760468, 1.980998, 1, 0, 0, 1, 1,
0.4828688, 1.393953, 0.0322147, 1, 0, 0, 1, 1,
0.4843506, 0.2788747, 0.8881578, 1, 0, 0, 1, 1,
0.485666, 0.1624001, 2.768962, 1, 0, 0, 1, 1,
0.4872658, -2.539416, 3.715542, 0, 0, 0, 1, 1,
0.4922077, -1.602746, 2.50093, 0, 0, 0, 1, 1,
0.4964263, 1.359407, -1.939792, 0, 0, 0, 1, 1,
0.4989677, 0.2189396, 2.624941, 0, 0, 0, 1, 1,
0.5045345, -1.236715, 2.590997, 0, 0, 0, 1, 1,
0.5052227, 0.9067436, 0.0241532, 0, 0, 0, 1, 1,
0.5055544, 1.337879, 0.4316207, 0, 0, 0, 1, 1,
0.5106013, -0.335665, 3.439991, 1, 1, 1, 1, 1,
0.5114433, 1.590364, -0.11814, 1, 1, 1, 1, 1,
0.5129195, -0.566531, 2.332841, 1, 1, 1, 1, 1,
0.5143796, -0.2037362, 1.357317, 1, 1, 1, 1, 1,
0.5196252, 0.5180153, -0.6141211, 1, 1, 1, 1, 1,
0.5196984, -0.4066283, 3.101172, 1, 1, 1, 1, 1,
0.524498, 0.2485034, 0.4038047, 1, 1, 1, 1, 1,
0.5319262, -0.4962295, 2.637475, 1, 1, 1, 1, 1,
0.5412596, 0.5232088, 1.838581, 1, 1, 1, 1, 1,
0.542422, -1.67999, 3.731178, 1, 1, 1, 1, 1,
0.5430297, -1.477439, 2.695398, 1, 1, 1, 1, 1,
0.5451687, -1.478117, 1.580371, 1, 1, 1, 1, 1,
0.5463286, -0.6337724, 4.220709, 1, 1, 1, 1, 1,
0.5477909, -0.4135647, 3.131144, 1, 1, 1, 1, 1,
0.5555753, 1.050822, -0.1215174, 1, 1, 1, 1, 1,
0.5563042, -0.6125225, 1.341898, 0, 0, 1, 1, 1,
0.5564794, 2.650893, -0.4900324, 1, 0, 0, 1, 1,
0.5603244, -0.2340845, 3.06443, 1, 0, 0, 1, 1,
0.5685604, -0.5961707, 1.571285, 1, 0, 0, 1, 1,
0.5783592, -0.03342943, 1.534173, 1, 0, 0, 1, 1,
0.5856866, 0.05679287, 1.662263, 1, 0, 0, 1, 1,
0.5926714, -0.5969268, 3.317253, 0, 0, 0, 1, 1,
0.593209, -1.132728, 1.999186, 0, 0, 0, 1, 1,
0.6016225, 0.9850193, 1.46176, 0, 0, 0, 1, 1,
0.6056866, 0.1955777, 0.7996632, 0, 0, 0, 1, 1,
0.6080893, 0.4878533, 1.384914, 0, 0, 0, 1, 1,
0.611946, -0.1013843, -0.4219584, 0, 0, 0, 1, 1,
0.6144108, -1.37425, 1.446249, 0, 0, 0, 1, 1,
0.6162589, 2.621846, 0.2261353, 1, 1, 1, 1, 1,
0.618385, -0.1845551, 3.734213, 1, 1, 1, 1, 1,
0.6185396, 1.494016, 0.5059158, 1, 1, 1, 1, 1,
0.6219312, 0.6666811, 1.067307, 1, 1, 1, 1, 1,
0.6224157, -0.6536173, 2.377079, 1, 1, 1, 1, 1,
0.6228511, -0.04626134, 2.146032, 1, 1, 1, 1, 1,
0.6229712, -0.7968794, 1.286651, 1, 1, 1, 1, 1,
0.6244814, -1.117087, 3.122978, 1, 1, 1, 1, 1,
0.6294266, -0.3484932, 4.030313, 1, 1, 1, 1, 1,
0.6317165, -0.2813582, 1.768458, 1, 1, 1, 1, 1,
0.6348124, 0.9398251, -0.1264842, 1, 1, 1, 1, 1,
0.6358854, 0.5284857, -0.5081562, 1, 1, 1, 1, 1,
0.6361618, 0.7003725, 0.8095106, 1, 1, 1, 1, 1,
0.6378728, 0.3673735, 1.499166, 1, 1, 1, 1, 1,
0.6383753, 0.2315301, 1.681522, 1, 1, 1, 1, 1,
0.6394031, -1.164638, 4.578186, 0, 0, 1, 1, 1,
0.6417096, -0.2877718, 0.9109154, 1, 0, 0, 1, 1,
0.6426187, -1.3203, 4.302735, 1, 0, 0, 1, 1,
0.648047, -0.4725185, 1.264455, 1, 0, 0, 1, 1,
0.6487712, -0.03103147, 2.657138, 1, 0, 0, 1, 1,
0.6516081, -0.0297832, 1.271845, 1, 0, 0, 1, 1,
0.655866, 1.29113, -0.6178626, 0, 0, 0, 1, 1,
0.6568971, -0.8648162, 2.938967, 0, 0, 0, 1, 1,
0.6589353, -0.064445, 0.2757953, 0, 0, 0, 1, 1,
0.6593709, -0.2132528, 2.954371, 0, 0, 0, 1, 1,
0.6595632, 0.5853395, 1.020639, 0, 0, 0, 1, 1,
0.6713988, -0.3201312, 0.5976992, 0, 0, 0, 1, 1,
0.6732396, 0.6062235, 1.525173, 0, 0, 0, 1, 1,
0.6752083, 0.2049116, 4.142253, 1, 1, 1, 1, 1,
0.6765253, -1.071266, 2.057438, 1, 1, 1, 1, 1,
0.6774305, 1.148176, -0.5102013, 1, 1, 1, 1, 1,
0.6790538, -1.418644, 0.8095465, 1, 1, 1, 1, 1,
0.6816913, 0.4972159, 2.868988, 1, 1, 1, 1, 1,
0.6823558, 0.2814623, 0.7865512, 1, 1, 1, 1, 1,
0.6848761, -0.5097843, 1.128639, 1, 1, 1, 1, 1,
0.685468, -0.2679435, 1.728052, 1, 1, 1, 1, 1,
0.6868118, 0.2846227, 0.9540607, 1, 1, 1, 1, 1,
0.6895845, -0.9442704, 3.295229, 1, 1, 1, 1, 1,
0.6944466, 0.0586828, 1.957177, 1, 1, 1, 1, 1,
0.6986719, 1.47366, 0.6036461, 1, 1, 1, 1, 1,
0.7003021, 0.2369585, 1.783888, 1, 1, 1, 1, 1,
0.7017709, -0.2700727, 0.4208367, 1, 1, 1, 1, 1,
0.707118, -0.2389145, 1.362871, 1, 1, 1, 1, 1,
0.708792, 1.355472, -0.06838519, 0, 0, 1, 1, 1,
0.7121905, -0.6566809, 1.970639, 1, 0, 0, 1, 1,
0.7169412, 1.295051, -1.132328, 1, 0, 0, 1, 1,
0.7267941, -0.1960853, 2.807555, 1, 0, 0, 1, 1,
0.7296141, 0.3138925, 2.298887, 1, 0, 0, 1, 1,
0.7298636, -0.8639215, 1.363898, 1, 0, 0, 1, 1,
0.7310988, -0.2149233, 2.477268, 0, 0, 0, 1, 1,
0.7350959, -1.896793, 2.882785, 0, 0, 0, 1, 1,
0.735462, 2.463717, 0.2370953, 0, 0, 0, 1, 1,
0.736288, 0.9934395, 0.0954523, 0, 0, 0, 1, 1,
0.7380924, -1.326191, 3.45031, 0, 0, 0, 1, 1,
0.7410959, -0.1498384, 0.1566161, 0, 0, 0, 1, 1,
0.7482437, 1.906468, 2.791999, 0, 0, 0, 1, 1,
0.7514411, 0.6517521, 1.985772, 1, 1, 1, 1, 1,
0.7584051, -1.389424, 1.730954, 1, 1, 1, 1, 1,
0.7586918, -0.3726838, 1.590408, 1, 1, 1, 1, 1,
0.7589946, 1.594374, -0.7947001, 1, 1, 1, 1, 1,
0.7629824, 0.01517401, -0.2229076, 1, 1, 1, 1, 1,
0.7634812, 0.02921839, 1.587143, 1, 1, 1, 1, 1,
0.7643265, -0.1038136, 1.307356, 1, 1, 1, 1, 1,
0.7671886, -1.146653, 3.025371, 1, 1, 1, 1, 1,
0.7684051, 0.4202873, 0.6786017, 1, 1, 1, 1, 1,
0.7745586, 0.6772124, 0.3574997, 1, 1, 1, 1, 1,
0.7750788, 1.65362, 2.913981, 1, 1, 1, 1, 1,
0.7868329, -0.2308512, 1.919329, 1, 1, 1, 1, 1,
0.7874551, 0.2976402, 1.025244, 1, 1, 1, 1, 1,
0.7875879, 0.8105002, 0.1165647, 1, 1, 1, 1, 1,
0.7885775, 0.5047545, 0.03776783, 1, 1, 1, 1, 1,
0.7891629, 0.628971, 1.481583, 0, 0, 1, 1, 1,
0.7918247, -1.007903, 2.303507, 1, 0, 0, 1, 1,
0.7973936, -1.748902, 3.583653, 1, 0, 0, 1, 1,
0.8001583, -0.8844592, 1.940517, 1, 0, 0, 1, 1,
0.8002744, -0.3725602, 1.911219, 1, 0, 0, 1, 1,
0.8041765, -0.9624181, 4.509578, 1, 0, 0, 1, 1,
0.8058519, 0.7299889, 1.554432, 0, 0, 0, 1, 1,
0.8061258, 0.5985997, 1.55239, 0, 0, 0, 1, 1,
0.8154442, 1.163499, 0.4971163, 0, 0, 0, 1, 1,
0.817922, 0.4984664, 0.1728936, 0, 0, 0, 1, 1,
0.8179512, -0.702193, 1.955168, 0, 0, 0, 1, 1,
0.8182746, -0.119699, 1.213265, 0, 0, 0, 1, 1,
0.8279808, -0.3444614, 2.417866, 0, 0, 0, 1, 1,
0.8319426, 2.338443, -0.9366807, 1, 1, 1, 1, 1,
0.8345656, -2.699383, 3.03035, 1, 1, 1, 1, 1,
0.8382846, 1.244408, 0.2746034, 1, 1, 1, 1, 1,
0.8450897, 0.5715383, 2.220282, 1, 1, 1, 1, 1,
0.8456957, -0.1052854, 2.675802, 1, 1, 1, 1, 1,
0.8665339, 0.7366303, -0.7757228, 1, 1, 1, 1, 1,
0.866879, -1.805676, 2.048902, 1, 1, 1, 1, 1,
0.8669373, -1.760935, 2.786132, 1, 1, 1, 1, 1,
0.8683785, 0.01324291, 1.955959, 1, 1, 1, 1, 1,
0.8691427, -0.4029463, 0.8974543, 1, 1, 1, 1, 1,
0.8730861, -1.520974, 2.556576, 1, 1, 1, 1, 1,
0.875686, -0.4612028, 2.830811, 1, 1, 1, 1, 1,
0.8857476, 0.3150185, 0.5443113, 1, 1, 1, 1, 1,
0.895889, 0.9996094, 2.41761, 1, 1, 1, 1, 1,
0.8982843, 0.8219603, 0.6103595, 1, 1, 1, 1, 1,
0.9097914, -0.7448921, 3.5553, 0, 0, 1, 1, 1,
0.9124509, -0.2316916, 3.002951, 1, 0, 0, 1, 1,
0.9165272, 1.063969, 2.128308, 1, 0, 0, 1, 1,
0.9182295, -0.9196758, 3.663434, 1, 0, 0, 1, 1,
0.9215445, 0.7508392, 0.2459828, 1, 0, 0, 1, 1,
0.9224041, -0.3599065, 1.533979, 1, 0, 0, 1, 1,
0.9227768, 2.474538, -0.206413, 0, 0, 0, 1, 1,
0.9263675, -0.9295511, 3.075558, 0, 0, 0, 1, 1,
0.9281232, 0.142585, 0.9412443, 0, 0, 0, 1, 1,
0.9298293, 0.1455021, 0.9516742, 0, 0, 0, 1, 1,
0.9310412, -0.3747711, 2.76288, 0, 0, 0, 1, 1,
0.932003, -0.6736826, 1.779661, 0, 0, 0, 1, 1,
0.9326656, -0.2750224, 2.793391, 0, 0, 0, 1, 1,
0.9344338, -0.2079646, 1.214558, 1, 1, 1, 1, 1,
0.9364688, -0.4776355, 0.3744756, 1, 1, 1, 1, 1,
0.9518398, -1.5342, 2.001733, 1, 1, 1, 1, 1,
0.9545968, -0.08559535, -0.451878, 1, 1, 1, 1, 1,
0.9582411, -2.103876, 2.608778, 1, 1, 1, 1, 1,
0.9621732, 1.888762, 1.850618, 1, 1, 1, 1, 1,
0.96401, -0.364595, 2.940947, 1, 1, 1, 1, 1,
0.9670183, 0.5479674, 0.8120141, 1, 1, 1, 1, 1,
0.972143, 0.7109931, 0.9717489, 1, 1, 1, 1, 1,
0.9730291, 0.8523498, 0.01184205, 1, 1, 1, 1, 1,
0.9767825, -0.1244268, 0.8114952, 1, 1, 1, 1, 1,
0.9780921, -0.5900316, 0.1984088, 1, 1, 1, 1, 1,
0.9813997, -0.4678934, 2.331413, 1, 1, 1, 1, 1,
0.9936454, 0.4626569, 0.1637374, 1, 1, 1, 1, 1,
0.9957115, -0.6088438, 2.409672, 1, 1, 1, 1, 1,
1.004916, 1.82251, -0.2902251, 0, 0, 1, 1, 1,
1.020092, -0.7654727, 3.192083, 1, 0, 0, 1, 1,
1.035062, -0.7221277, 0.06867809, 1, 0, 0, 1, 1,
1.041235, -0.3685613, 0.5231952, 1, 0, 0, 1, 1,
1.050135, 0.1449846, 3.027476, 1, 0, 0, 1, 1,
1.051307, -1.001077, 1.734022, 1, 0, 0, 1, 1,
1.052585, 0.01864737, 0.8184021, 0, 0, 0, 1, 1,
1.053461, -1.612119, 4.762793, 0, 0, 0, 1, 1,
1.058154, -0.5389184, 4.495901, 0, 0, 0, 1, 1,
1.067402, -0.5735044, 3.373226, 0, 0, 0, 1, 1,
1.067982, -0.225717, 1.667403, 0, 0, 0, 1, 1,
1.071748, 1.055356, -0.3699133, 0, 0, 0, 1, 1,
1.072657, -0.5920233, 2.129966, 0, 0, 0, 1, 1,
1.07472, -1.520052, 2.200993, 1, 1, 1, 1, 1,
1.075458, -0.3254297, -0.2554464, 1, 1, 1, 1, 1,
1.083346, 0.7496929, 2.634542, 1, 1, 1, 1, 1,
1.084524, -0.02718892, 1.432144, 1, 1, 1, 1, 1,
1.093459, -1.045253, 3.20832, 1, 1, 1, 1, 1,
1.096587, 0.2093757, 2.129018, 1, 1, 1, 1, 1,
1.118874, 0.4126749, 2.22554, 1, 1, 1, 1, 1,
1.124459, 0.7667091, -0.5692434, 1, 1, 1, 1, 1,
1.127467, 1.936424, -0.3355278, 1, 1, 1, 1, 1,
1.128199, 1.475732, -0.8484883, 1, 1, 1, 1, 1,
1.137403, -1.580883, -0.6821079, 1, 1, 1, 1, 1,
1.152948, -0.2086993, 0.9252273, 1, 1, 1, 1, 1,
1.153059, -0.3431147, 0.09116727, 1, 1, 1, 1, 1,
1.154969, -0.03028503, 3.556979, 1, 1, 1, 1, 1,
1.158081, 0.5894964, 3.778797, 1, 1, 1, 1, 1,
1.158563, 0.1950443, 1.426455, 0, 0, 1, 1, 1,
1.159715, -1.31855, 3.542012, 1, 0, 0, 1, 1,
1.162266, 0.1349082, 2.291925, 1, 0, 0, 1, 1,
1.165834, 0.4404378, 0.6437174, 1, 0, 0, 1, 1,
1.168892, 0.961733, -0.1117041, 1, 0, 0, 1, 1,
1.177046, 0.4583959, -0.6388312, 1, 0, 0, 1, 1,
1.180282, -0.9822094, 1.741382, 0, 0, 0, 1, 1,
1.196033, 0.9769675, 0.8854151, 0, 0, 0, 1, 1,
1.204997, -1.204799, 3.448125, 0, 0, 0, 1, 1,
1.20932, 1.785579, 0.8598737, 0, 0, 0, 1, 1,
1.213142, 0.06880687, 0.5146823, 0, 0, 0, 1, 1,
1.224474, -0.04234967, 1.402302, 0, 0, 0, 1, 1,
1.224788, 1.295423, 0.7042625, 0, 0, 0, 1, 1,
1.227239, -1.873594, 2.454359, 1, 1, 1, 1, 1,
1.228168, -0.3796656, 1.114134, 1, 1, 1, 1, 1,
1.233336, -0.7625327, 2.963577, 1, 1, 1, 1, 1,
1.236944, -0.9913368, 2.919897, 1, 1, 1, 1, 1,
1.239235, -0.217386, 2.162599, 1, 1, 1, 1, 1,
1.251294, -2.229982, 3.198666, 1, 1, 1, 1, 1,
1.251541, -2.115323, 1.708511, 1, 1, 1, 1, 1,
1.254875, -0.5946633, 2.847819, 1, 1, 1, 1, 1,
1.264886, -0.1583307, 2.333282, 1, 1, 1, 1, 1,
1.266139, 0.8099891, 0.9974743, 1, 1, 1, 1, 1,
1.271475, -0.06146478, 2.655474, 1, 1, 1, 1, 1,
1.27152, 1.980608, -0.6384079, 1, 1, 1, 1, 1,
1.277905, -0.1107762, 1.306446, 1, 1, 1, 1, 1,
1.284242, 1.650769, 0.3363551, 1, 1, 1, 1, 1,
1.287775, 0.2009869, 1.412471, 1, 1, 1, 1, 1,
1.289397, 1.593345, 1.116251, 0, 0, 1, 1, 1,
1.290378, 0.3934182, 0.898434, 1, 0, 0, 1, 1,
1.293352, -0.2623141, 2.968645, 1, 0, 0, 1, 1,
1.297069, 0.1215629, 1.023218, 1, 0, 0, 1, 1,
1.30123, -1.801408, 3.688934, 1, 0, 0, 1, 1,
1.303457, -0.4118816, 2.131002, 1, 0, 0, 1, 1,
1.317209, -1.492581, 0.713918, 0, 0, 0, 1, 1,
1.322547, 0.3113428, 1.532375, 0, 0, 0, 1, 1,
1.335384, -2.426276, 3.134736, 0, 0, 0, 1, 1,
1.350098, -1.029017, 1.880629, 0, 0, 0, 1, 1,
1.353641, -1.101455, 1.502113, 0, 0, 0, 1, 1,
1.354096, -0.1315791, 0.2013149, 0, 0, 0, 1, 1,
1.368007, -0.2756336, 2.110754, 0, 0, 0, 1, 1,
1.373466, 0.1098011, 0.7727808, 1, 1, 1, 1, 1,
1.381216, 0.4213692, 1.531334, 1, 1, 1, 1, 1,
1.381959, 0.7984884, 1.737684, 1, 1, 1, 1, 1,
1.386375, -2.064796, 1.640353, 1, 1, 1, 1, 1,
1.392015, 0.1287414, 0.3206174, 1, 1, 1, 1, 1,
1.403528, -1.076606, 4.414564, 1, 1, 1, 1, 1,
1.404035, -0.211294, 1.705681, 1, 1, 1, 1, 1,
1.426644, 0.7342765, 0.6026801, 1, 1, 1, 1, 1,
1.438961, -2.092978, 2.855912, 1, 1, 1, 1, 1,
1.438986, 0.4419776, 2.804104, 1, 1, 1, 1, 1,
1.445572, 1.65174, 1.061179, 1, 1, 1, 1, 1,
1.451554, 1.520273, 3.069631, 1, 1, 1, 1, 1,
1.464342, 0.7534882, 2.719169, 1, 1, 1, 1, 1,
1.478076, 0.67897, 1.15743, 1, 1, 1, 1, 1,
1.497685, 1.070871, 1.525474, 1, 1, 1, 1, 1,
1.501377, -0.2786361, 1.305677, 0, 0, 1, 1, 1,
1.502965, 0.8188152, 0.5671337, 1, 0, 0, 1, 1,
1.518416, 0.2267357, 1.818261, 1, 0, 0, 1, 1,
1.538097, 1.195818, 0.5147485, 1, 0, 0, 1, 1,
1.548476, -0.741231, 0.9459317, 1, 0, 0, 1, 1,
1.55893, -0.773435, 2.160815, 1, 0, 0, 1, 1,
1.566325, -1.599019, 3.395596, 0, 0, 0, 1, 1,
1.599308, -0.5416319, 2.044551, 0, 0, 0, 1, 1,
1.604948, -0.9358091, 1.466209, 0, 0, 0, 1, 1,
1.608922, 1.543291, 0.2439423, 0, 0, 0, 1, 1,
1.611215, 0.9442284, -0.1849379, 0, 0, 0, 1, 1,
1.614591, -0.2062982, 0.8449711, 0, 0, 0, 1, 1,
1.614949, -1.161514, 2.925422, 0, 0, 0, 1, 1,
1.624544, -0.5895206, 2.91701, 1, 1, 1, 1, 1,
1.644022, 0.7891988, 1.569402, 1, 1, 1, 1, 1,
1.656806, 0.04535584, -1.850309, 1, 1, 1, 1, 1,
1.660201, 0.2949334, 1.433687, 1, 1, 1, 1, 1,
1.673739, -0.8354311, 1.657165, 1, 1, 1, 1, 1,
1.691087, 1.467447, 1.924789, 1, 1, 1, 1, 1,
1.695225, 2.895968, 1.665017, 1, 1, 1, 1, 1,
1.696364, 0.9920055, 0.832015, 1, 1, 1, 1, 1,
1.697561, -0.6555606, 2.195843, 1, 1, 1, 1, 1,
1.704592, -1.714725, 3.419497, 1, 1, 1, 1, 1,
1.722514, -1.395257, 1.903158, 1, 1, 1, 1, 1,
1.726172, 0.6471137, 2.630439, 1, 1, 1, 1, 1,
1.736038, -0.4787948, 2.410591, 1, 1, 1, 1, 1,
1.73665, 1.360811, 0.1720641, 1, 1, 1, 1, 1,
1.750959, -0.04387289, 1.704637, 1, 1, 1, 1, 1,
1.7555, 0.9908721, 1.746035, 0, 0, 1, 1, 1,
1.763309, 1.588902, 1.82469, 1, 0, 0, 1, 1,
1.805157, 0.4302694, 2.902187, 1, 0, 0, 1, 1,
1.818752, 1.332707, 0.7666519, 1, 0, 0, 1, 1,
1.826245, 0.5251787, 1.893917, 1, 0, 0, 1, 1,
1.849059, -1.054646, 0.5137436, 1, 0, 0, 1, 1,
1.854089, 0.6353334, 0.06501152, 0, 0, 0, 1, 1,
1.864406, 1.143499, 0.2886545, 0, 0, 0, 1, 1,
1.871188, -0.1018545, 0.2512166, 0, 0, 0, 1, 1,
1.882133, 0.04861557, 1.528715, 0, 0, 0, 1, 1,
1.908665, 0.192907, 1.577894, 0, 0, 0, 1, 1,
1.91383, 1.321508, 3.48591, 0, 0, 0, 1, 1,
1.946917, 0.6840348, 2.869282, 0, 0, 0, 1, 1,
1.956584, -0.2429906, 2.112675, 1, 1, 1, 1, 1,
1.979725, -0.605473, 3.291705, 1, 1, 1, 1, 1,
2.00129, -0.7719381, 2.702173, 1, 1, 1, 1, 1,
2.017113, -1.928919, 0.4533475, 1, 1, 1, 1, 1,
2.026436, 0.761053, 0.2654154, 1, 1, 1, 1, 1,
2.034356, -0.3115422, 2.867774, 1, 1, 1, 1, 1,
2.063537, -0.401907, 3.393355, 1, 1, 1, 1, 1,
2.079334, 1.397466, 1.346366, 1, 1, 1, 1, 1,
2.080673, -0.4596486, 1.240555, 1, 1, 1, 1, 1,
2.081239, 0.1129494, 2.357222, 1, 1, 1, 1, 1,
2.100287, -0.09025379, 2.030045, 1, 1, 1, 1, 1,
2.113538, -0.157745, 2.181744, 1, 1, 1, 1, 1,
2.124769, 0.3673683, 1.325079, 1, 1, 1, 1, 1,
2.155176, 0.3962031, 4.96692, 1, 1, 1, 1, 1,
2.155754, -2.126822, 2.574156, 1, 1, 1, 1, 1,
2.203526, -1.301113, 1.275746, 0, 0, 1, 1, 1,
2.203612, 0.3459025, 1.642339, 1, 0, 0, 1, 1,
2.255282, -0.6081961, 0.8084696, 1, 0, 0, 1, 1,
2.25791, -0.4179375, 0.3924729, 1, 0, 0, 1, 1,
2.269174, 0.09910816, 2.105421, 1, 0, 0, 1, 1,
2.293865, -1.52382, 3.018572, 1, 0, 0, 1, 1,
2.334409, 0.701282, 0.7626718, 0, 0, 0, 1, 1,
2.351535, -0.5150683, 1.414603, 0, 0, 0, 1, 1,
2.352625, -1.123696, 0.821547, 0, 0, 0, 1, 1,
2.377346, 0.8367218, 1.169484, 0, 0, 0, 1, 1,
2.411966, -1.374949, 0.7862436, 0, 0, 0, 1, 1,
2.454116, 0.345845, -0.6980116, 0, 0, 0, 1, 1,
2.482165, 2.272144, 1.128633, 0, 0, 0, 1, 1,
2.48928, -0.2691901, 1.310781, 1, 1, 1, 1, 1,
2.638129, -0.2148309, 0.5913463, 1, 1, 1, 1, 1,
2.640859, -0.05360578, 2.107834, 1, 1, 1, 1, 1,
2.665478, -0.237102, 2.414452, 1, 1, 1, 1, 1,
2.727827, -0.6671405, 1.099128, 1, 1, 1, 1, 1,
3.163205, 0.8109545, 1.99307, 1, 1, 1, 1, 1,
3.635306, 1.211056, 1.935948, 1, 1, 1, 1, 1
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
var radius = 9.959511;
var distance = 34.98236;
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
mvMatrix.translate( -0.1041358, -0.08440328, 0.2892587 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.98236);
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
