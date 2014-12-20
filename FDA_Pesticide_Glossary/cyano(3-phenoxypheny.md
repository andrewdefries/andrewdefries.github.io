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
-2.829038, -0.9360535, -3.877201, 1, 0, 0, 1,
-2.581049, 0.2798252, -1.556822, 1, 0.007843138, 0, 1,
-2.510389, 0.198417, -2.634937, 1, 0.01176471, 0, 1,
-2.502905, -0.1575086, -2.129983, 1, 0.01960784, 0, 1,
-2.448316, -0.7246153, -0.5127827, 1, 0.02352941, 0, 1,
-2.401802, 0.5363265, -2.178611, 1, 0.03137255, 0, 1,
-2.381756, 2.353644, -0.3299161, 1, 0.03529412, 0, 1,
-2.35579, 1.146801, 0.3574846, 1, 0.04313726, 0, 1,
-2.34627, 0.7868302, -2.442153, 1, 0.04705882, 0, 1,
-2.308674, -0.2984408, -0.8262059, 1, 0.05490196, 0, 1,
-2.305966, 0.2852373, -2.437171, 1, 0.05882353, 0, 1,
-2.29523, 0.8668973, -1.55859, 1, 0.06666667, 0, 1,
-2.146949, -0.03301007, -1.526107, 1, 0.07058824, 0, 1,
-2.093099, -0.07854247, 0.1925693, 1, 0.07843138, 0, 1,
-2.090796, -1.405447, -1.476851, 1, 0.08235294, 0, 1,
-2.088723, -0.7570078, -1.354989, 1, 0.09019608, 0, 1,
-2.081867, 1.088251, -0.01549998, 1, 0.09411765, 0, 1,
-2.039176, 1.597842, -1.212357, 1, 0.1019608, 0, 1,
-2.030322, -2.575513, -3.240319, 1, 0.1098039, 0, 1,
-2.018817, 0.961038, -1.956147, 1, 0.1137255, 0, 1,
-2.008036, -1.071419, -2.168773, 1, 0.1215686, 0, 1,
-1.980898, -1.362684, -4.179583, 1, 0.1254902, 0, 1,
-1.958882, 0.06783724, -1.051633, 1, 0.1333333, 0, 1,
-1.956331, -0.08828765, -0.7816608, 1, 0.1372549, 0, 1,
-1.948077, -0.7145287, -1.658963, 1, 0.145098, 0, 1,
-1.934844, -0.08082177, -1.57196, 1, 0.1490196, 0, 1,
-1.926445, 0.7604391, -1.025962, 1, 0.1568628, 0, 1,
-1.900921, -0.07586938, -2.199669, 1, 0.1607843, 0, 1,
-1.892373, -0.4997665, -1.510657, 1, 0.1686275, 0, 1,
-1.891399, 0.5225996, 0.236163, 1, 0.172549, 0, 1,
-1.888079, -0.3415569, -2.114297, 1, 0.1803922, 0, 1,
-1.860233, -0.1828676, -1.445313, 1, 0.1843137, 0, 1,
-1.849937, 0.0716645, -2.987603, 1, 0.1921569, 0, 1,
-1.84221, 1.342528, -1.488898, 1, 0.1960784, 0, 1,
-1.837033, -0.1569171, -2.451371, 1, 0.2039216, 0, 1,
-1.795678, 1.174008, -3.052296, 1, 0.2117647, 0, 1,
-1.783342, 0.3482595, -1.813365, 1, 0.2156863, 0, 1,
-1.776518, 0.8726622, -0.8762477, 1, 0.2235294, 0, 1,
-1.767683, -1.005199, -1.823329, 1, 0.227451, 0, 1,
-1.758187, 0.6480309, 0.2721129, 1, 0.2352941, 0, 1,
-1.755126, -1.829635, -0.804059, 1, 0.2392157, 0, 1,
-1.754459, -0.4759706, -3.47255, 1, 0.2470588, 0, 1,
-1.754402, -1.623788, -3.303375, 1, 0.2509804, 0, 1,
-1.749023, -0.01367551, -2.31309, 1, 0.2588235, 0, 1,
-1.748942, 0.3028567, -2.120843, 1, 0.2627451, 0, 1,
-1.742966, 0.9550458, -1.632071, 1, 0.2705882, 0, 1,
-1.740111, -1.324073, -2.643831, 1, 0.2745098, 0, 1,
-1.737083, -0.7382622, -2.101118, 1, 0.282353, 0, 1,
-1.715896, 0.688688, -0.1402497, 1, 0.2862745, 0, 1,
-1.715796, -0.2083606, -1.291214, 1, 0.2941177, 0, 1,
-1.71548, 0.4165902, -0.770273, 1, 0.3019608, 0, 1,
-1.676921, -0.1169743, -1.429058, 1, 0.3058824, 0, 1,
-1.661273, -0.1860296, -2.894159, 1, 0.3137255, 0, 1,
-1.645786, 1.071058, -2.898721, 1, 0.3176471, 0, 1,
-1.637834, -0.5661743, -1.321546, 1, 0.3254902, 0, 1,
-1.631612, -0.6796765, -2.488389, 1, 0.3294118, 0, 1,
-1.601043, 1.100412, 0.04611246, 1, 0.3372549, 0, 1,
-1.596569, -0.09431072, -1.25451, 1, 0.3411765, 0, 1,
-1.592334, 0.1821184, -1.357642, 1, 0.3490196, 0, 1,
-1.57676, -0.4408447, -1.847376, 1, 0.3529412, 0, 1,
-1.551352, -1.283746, -2.704332, 1, 0.3607843, 0, 1,
-1.535585, -0.003573709, -1.397288, 1, 0.3647059, 0, 1,
-1.512468, 1.190525, -0.1190713, 1, 0.372549, 0, 1,
-1.504054, 1.618738, -1.826663, 1, 0.3764706, 0, 1,
-1.502605, 0.1987576, -0.8304312, 1, 0.3843137, 0, 1,
-1.491461, -0.03397327, -1.002191, 1, 0.3882353, 0, 1,
-1.480924, -1.095875, -0.5610593, 1, 0.3960784, 0, 1,
-1.478335, -0.2226602, -1.49232, 1, 0.4039216, 0, 1,
-1.478236, -0.9548569, -0.4788533, 1, 0.4078431, 0, 1,
-1.474375, -0.5109603, -3.191899, 1, 0.4156863, 0, 1,
-1.471063, -1.19774, -2.188761, 1, 0.4196078, 0, 1,
-1.465299, 0.6279122, -1.466013, 1, 0.427451, 0, 1,
-1.464217, 0.2347937, -0.7360497, 1, 0.4313726, 0, 1,
-1.453957, -1.051225, -3.282159, 1, 0.4392157, 0, 1,
-1.450149, -0.3866183, -0.908946, 1, 0.4431373, 0, 1,
-1.443351, -1.560953, -1.868861, 1, 0.4509804, 0, 1,
-1.429941, -0.01065778, -3.138443, 1, 0.454902, 0, 1,
-1.424931, -2.233269, -1.834036, 1, 0.4627451, 0, 1,
-1.423734, -0.7732086, -3.380094, 1, 0.4666667, 0, 1,
-1.408896, 0.1025715, -2.946392, 1, 0.4745098, 0, 1,
-1.39721, -0.1108745, -2.499298, 1, 0.4784314, 0, 1,
-1.394707, -0.1525243, -1.820352, 1, 0.4862745, 0, 1,
-1.38768, 0.3385969, -2.154241, 1, 0.4901961, 0, 1,
-1.381362, -0.2673045, -2.681769, 1, 0.4980392, 0, 1,
-1.378604, -0.04603432, -1.753888, 1, 0.5058824, 0, 1,
-1.378245, 0.6022955, -0.89937, 1, 0.509804, 0, 1,
-1.376441, 0.712086, -1.568031, 1, 0.5176471, 0, 1,
-1.373029, -0.01607166, -0.6111256, 1, 0.5215687, 0, 1,
-1.366944, 0.4959075, -2.866524, 1, 0.5294118, 0, 1,
-1.360212, -1.800656, -3.522966, 1, 0.5333334, 0, 1,
-1.341268, -0.893234, -2.341068, 1, 0.5411765, 0, 1,
-1.334926, -1.912382, -2.746223, 1, 0.5450981, 0, 1,
-1.333244, 0.2710581, -0.4821061, 1, 0.5529412, 0, 1,
-1.332548, 0.1661376, -1.159561, 1, 0.5568628, 0, 1,
-1.328288, 0.5463431, -0.8585746, 1, 0.5647059, 0, 1,
-1.324397, 1.165928, -1.140954, 1, 0.5686275, 0, 1,
-1.32007, -0.4371241, -2.332007, 1, 0.5764706, 0, 1,
-1.318203, 0.01668053, -2.638282, 1, 0.5803922, 0, 1,
-1.311028, 1.01064, -1.988976, 1, 0.5882353, 0, 1,
-1.300538, -0.646078, -1.007632, 1, 0.5921569, 0, 1,
-1.300082, -0.2251365, -1.819791, 1, 0.6, 0, 1,
-1.29972, -0.1413625, -1.092103, 1, 0.6078432, 0, 1,
-1.298498, 0.3469709, -1.931619, 1, 0.6117647, 0, 1,
-1.296706, 0.0213828, -1.887667, 1, 0.6196079, 0, 1,
-1.294298, -1.389315, -1.840118, 1, 0.6235294, 0, 1,
-1.293009, -0.4917944, -2.506542, 1, 0.6313726, 0, 1,
-1.276003, 0.1011738, -0.9800165, 1, 0.6352941, 0, 1,
-1.267842, -1.849858, -2.132835, 1, 0.6431373, 0, 1,
-1.252072, -0.9022273, -1.900709, 1, 0.6470588, 0, 1,
-1.240477, 0.5822849, -0.3652948, 1, 0.654902, 0, 1,
-1.236231, -0.3825033, -1.845428, 1, 0.6588235, 0, 1,
-1.230357, 0.1981701, -4.193463, 1, 0.6666667, 0, 1,
-1.222544, -0.4770764, -1.663838, 1, 0.6705883, 0, 1,
-1.221169, 1.490292, -2.513471, 1, 0.6784314, 0, 1,
-1.22083, -1.044055, -1.951955, 1, 0.682353, 0, 1,
-1.218956, -0.4456655, -1.622959, 1, 0.6901961, 0, 1,
-1.212442, -0.5090358, -2.015001, 1, 0.6941177, 0, 1,
-1.209376, -0.00562213, -1.080098, 1, 0.7019608, 0, 1,
-1.20361, -1.207093, -2.125798, 1, 0.7098039, 0, 1,
-1.193442, 0.2436917, -1.420074, 1, 0.7137255, 0, 1,
-1.190936, -0.8142664, -2.076827, 1, 0.7215686, 0, 1,
-1.18503, -0.8304207, -4.489791, 1, 0.7254902, 0, 1,
-1.18089, -0.5866228, -1.216133, 1, 0.7333333, 0, 1,
-1.179699, -0.1444944, -1.472248, 1, 0.7372549, 0, 1,
-1.176472, 0.4630438, -0.8085492, 1, 0.7450981, 0, 1,
-1.173208, -1.488073, -3.333159, 1, 0.7490196, 0, 1,
-1.171613, 0.7054603, -1.752717, 1, 0.7568628, 0, 1,
-1.170747, -3.108303, -2.800093, 1, 0.7607843, 0, 1,
-1.170389, 1.428873, -0.231579, 1, 0.7686275, 0, 1,
-1.167211, -1.014645, -2.574405, 1, 0.772549, 0, 1,
-1.162114, -1.02944, -0.2871347, 1, 0.7803922, 0, 1,
-1.161531, -0.8219458, -1.451174, 1, 0.7843137, 0, 1,
-1.161358, 0.8844153, -0.5573778, 1, 0.7921569, 0, 1,
-1.155207, 0.1124017, 1.160853, 1, 0.7960784, 0, 1,
-1.151025, -1.449989, -3.65459, 1, 0.8039216, 0, 1,
-1.149413, 1.616714, -2.10224, 1, 0.8117647, 0, 1,
-1.145871, 2.098606, -0.6416749, 1, 0.8156863, 0, 1,
-1.145113, 1.298148, 0.5208939, 1, 0.8235294, 0, 1,
-1.14136, -1.854764, -3.350495, 1, 0.827451, 0, 1,
-1.131774, -0.6158526, -2.25662, 1, 0.8352941, 0, 1,
-1.130408, 0.8103471, 0.3595183, 1, 0.8392157, 0, 1,
-1.129646, -0.07742324, -0.2225046, 1, 0.8470588, 0, 1,
-1.128609, 0.8089756, 0.764613, 1, 0.8509804, 0, 1,
-1.118515, -0.5228011, -3.811309, 1, 0.8588235, 0, 1,
-1.117582, -0.1058575, -0.6988734, 1, 0.8627451, 0, 1,
-1.109928, 2.215174, -1.633367, 1, 0.8705882, 0, 1,
-1.107464, -0.4238791, -2.958317, 1, 0.8745098, 0, 1,
-1.104273, -1.478674, -1.312217, 1, 0.8823529, 0, 1,
-1.102964, -1.091902, -2.088579, 1, 0.8862745, 0, 1,
-1.095435, -0.5792968, -2.053773, 1, 0.8941177, 0, 1,
-1.088803, 1.256743, -0.6997949, 1, 0.8980392, 0, 1,
-1.088616, -1.217591, -1.910837, 1, 0.9058824, 0, 1,
-1.085806, -0.4156969, -1.550977, 1, 0.9137255, 0, 1,
-1.08459, -0.5546578, -3.007925, 1, 0.9176471, 0, 1,
-1.084259, 0.2539243, -1.927044, 1, 0.9254902, 0, 1,
-1.078721, 0.294882, -1.869332, 1, 0.9294118, 0, 1,
-1.07765, 0.4421605, -0.8400876, 1, 0.9372549, 0, 1,
-1.075059, 0.5374759, -1.209652, 1, 0.9411765, 0, 1,
-1.071841, -0.4071087, -1.007684, 1, 0.9490196, 0, 1,
-1.071056, -0.554739, -2.836346, 1, 0.9529412, 0, 1,
-1.057891, -0.8924739, -0.09346327, 1, 0.9607843, 0, 1,
-1.056021, -1.255385, -1.321376, 1, 0.9647059, 0, 1,
-1.055077, -3.018298, -2.281921, 1, 0.972549, 0, 1,
-1.052554, -0.148292, -2.344627, 1, 0.9764706, 0, 1,
-1.05098, 0.08023421, -1.323846, 1, 0.9843137, 0, 1,
-1.047401, -1.703825, -3.359907, 1, 0.9882353, 0, 1,
-1.038047, -0.9527441, -0.5873185, 1, 0.9960784, 0, 1,
-1.029742, -1.073863, -2.893504, 0.9960784, 1, 0, 1,
-1.024098, -0.1208697, -0.5536882, 0.9921569, 1, 0, 1,
-1.023875, 0.412463, -0.2143527, 0.9843137, 1, 0, 1,
-1.01343, 0.7785487, -0.3758045, 0.9803922, 1, 0, 1,
-1.009901, -0.04998877, -3.128656, 0.972549, 1, 0, 1,
-1.0016, -0.2778915, -1.917225, 0.9686275, 1, 0, 1,
-0.998024, -1.62381, -0.5782565, 0.9607843, 1, 0, 1,
-0.9900924, -0.3514096, -0.4385651, 0.9568627, 1, 0, 1,
-0.9807304, 1.75122, -0.1482191, 0.9490196, 1, 0, 1,
-0.9803302, -1.491928, -1.020517, 0.945098, 1, 0, 1,
-0.9763459, 1.049454, -1.388948, 0.9372549, 1, 0, 1,
-0.9701602, 1.831867, -1.450126, 0.9333333, 1, 0, 1,
-0.958618, -1.919508, -2.286125, 0.9254902, 1, 0, 1,
-0.957335, -1.329478, -3.413435, 0.9215686, 1, 0, 1,
-0.95544, 0.3755797, -0.9844969, 0.9137255, 1, 0, 1,
-0.9530194, 0.07181889, -1.95272, 0.9098039, 1, 0, 1,
-0.9523229, 1.054836, -1.133242, 0.9019608, 1, 0, 1,
-0.9435859, 1.095803, -3.319146, 0.8941177, 1, 0, 1,
-0.9433801, -0.4355325, -1.579944, 0.8901961, 1, 0, 1,
-0.9430481, 1.432628, -1.459691, 0.8823529, 1, 0, 1,
-0.9418822, 0.5098699, -2.282509, 0.8784314, 1, 0, 1,
-0.9397871, 1.487969, -0.02801116, 0.8705882, 1, 0, 1,
-0.9363921, -0.05962623, -3.258264, 0.8666667, 1, 0, 1,
-0.9239135, 0.06343558, -1.914229, 0.8588235, 1, 0, 1,
-0.9214409, 0.6617671, -0.009331565, 0.854902, 1, 0, 1,
-0.9210765, -0.4000853, -2.970373, 0.8470588, 1, 0, 1,
-0.9185489, 0.3495235, -0.0001030065, 0.8431373, 1, 0, 1,
-0.9141962, -1.313904, -0.8171409, 0.8352941, 1, 0, 1,
-0.9138259, -0.2013431, -3.731131, 0.8313726, 1, 0, 1,
-0.9127759, 1.000143, -1.151162, 0.8235294, 1, 0, 1,
-0.9124575, -0.8216938, -1.653498, 0.8196079, 1, 0, 1,
-0.9073807, 0.5075573, -1.429277, 0.8117647, 1, 0, 1,
-0.9062394, -1.224684, -3.644445, 0.8078431, 1, 0, 1,
-0.9048497, 0.7681323, -2.119742, 0.8, 1, 0, 1,
-0.9034068, 1.325825, -0.8167104, 0.7921569, 1, 0, 1,
-0.9020166, 0.3103085, -0.2949468, 0.7882353, 1, 0, 1,
-0.9019139, -0.004225783, -1.88351, 0.7803922, 1, 0, 1,
-0.9014887, 1.007141, -0.05180634, 0.7764706, 1, 0, 1,
-0.8984252, 1.124468, 0.9656826, 0.7686275, 1, 0, 1,
-0.8944694, 0.788482, -1.852376, 0.7647059, 1, 0, 1,
-0.8885691, -2.017027, -3.488649, 0.7568628, 1, 0, 1,
-0.8881245, -2.514429, -2.362608, 0.7529412, 1, 0, 1,
-0.8704941, -0.03326577, -1.539211, 0.7450981, 1, 0, 1,
-0.8686329, -0.474777, -2.50621, 0.7411765, 1, 0, 1,
-0.8674901, 1.032274, -0.4613035, 0.7333333, 1, 0, 1,
-0.8657713, 0.3788029, -1.561311, 0.7294118, 1, 0, 1,
-0.8605122, 0.8783249, -0.945482, 0.7215686, 1, 0, 1,
-0.8589321, 1.42619, -1.834535, 0.7176471, 1, 0, 1,
-0.8585331, 0.189686, -3.652577, 0.7098039, 1, 0, 1,
-0.856695, -1.31932, -2.374687, 0.7058824, 1, 0, 1,
-0.8539431, 1.475979, -2.252105, 0.6980392, 1, 0, 1,
-0.8489362, 1.537354, -1.519196, 0.6901961, 1, 0, 1,
-0.8480417, 0.5606596, -1.246494, 0.6862745, 1, 0, 1,
-0.8479682, -1.546973, -1.148362, 0.6784314, 1, 0, 1,
-0.8402916, 1.463106, 0.6023968, 0.6745098, 1, 0, 1,
-0.8390291, 1.296706, 0.1101145, 0.6666667, 1, 0, 1,
-0.8282139, -1.167411, -2.301589, 0.6627451, 1, 0, 1,
-0.8273091, 1.40231, 1.448761, 0.654902, 1, 0, 1,
-0.8240859, 0.6335199, 1.130819, 0.6509804, 1, 0, 1,
-0.8232726, 1.44184, 0.6428576, 0.6431373, 1, 0, 1,
-0.8179651, -0.3319418, -2.469509, 0.6392157, 1, 0, 1,
-0.8126508, -0.8219203, -1.215414, 0.6313726, 1, 0, 1,
-0.8114365, 0.7036194, -0.03946164, 0.627451, 1, 0, 1,
-0.8087918, -0.9749053, 0.6154164, 0.6196079, 1, 0, 1,
-0.8053505, 0.993539, -1.02428, 0.6156863, 1, 0, 1,
-0.7989425, 0.5966798, -0.9671564, 0.6078432, 1, 0, 1,
-0.786824, -1.074241, -2.185867, 0.6039216, 1, 0, 1,
-0.7855963, 2.293677, -1.208826, 0.5960785, 1, 0, 1,
-0.7781268, 0.4738124, -1.046443, 0.5882353, 1, 0, 1,
-0.7769204, 1.011426, 1.085705, 0.5843138, 1, 0, 1,
-0.776275, -1.009112, -2.455137, 0.5764706, 1, 0, 1,
-0.7755525, -1.208476, -3.244292, 0.572549, 1, 0, 1,
-0.7718872, 0.9474395, -0.1270098, 0.5647059, 1, 0, 1,
-0.767428, 0.6555904, 1.683823, 0.5607843, 1, 0, 1,
-0.7672091, 0.7919823, 0.09493396, 0.5529412, 1, 0, 1,
-0.7657802, -0.09360562, -0.1178851, 0.5490196, 1, 0, 1,
-0.764764, 0.1439907, -1.387592, 0.5411765, 1, 0, 1,
-0.7570697, 0.397581, -1.681845, 0.5372549, 1, 0, 1,
-0.7551063, 2.287416, -2.00742, 0.5294118, 1, 0, 1,
-0.7543273, -0.4927087, -1.864705, 0.5254902, 1, 0, 1,
-0.7521778, 0.4397149, -0.4972343, 0.5176471, 1, 0, 1,
-0.7478277, -0.1415874, -1.03768, 0.5137255, 1, 0, 1,
-0.7445905, -0.05380191, -2.587495, 0.5058824, 1, 0, 1,
-0.7388137, -0.8121088, -0.3311089, 0.5019608, 1, 0, 1,
-0.7358297, 0.722086, -1.492383, 0.4941176, 1, 0, 1,
-0.7356975, -0.2156788, -0.4275924, 0.4862745, 1, 0, 1,
-0.7291913, 1.210036, -1.797818, 0.4823529, 1, 0, 1,
-0.7275026, -0.6604768, -2.530744, 0.4745098, 1, 0, 1,
-0.7242911, -0.05229692, -1.806899, 0.4705882, 1, 0, 1,
-0.7192681, 0.5030723, 0.02614415, 0.4627451, 1, 0, 1,
-0.7192612, -0.3333124, -2.473711, 0.4588235, 1, 0, 1,
-0.7189879, -1.466387, -0.5155346, 0.4509804, 1, 0, 1,
-0.7183269, 0.2035454, -1.116369, 0.4470588, 1, 0, 1,
-0.7182704, -0.761161, -2.115409, 0.4392157, 1, 0, 1,
-0.7160394, 1.272551, -0.6208847, 0.4352941, 1, 0, 1,
-0.7113433, -0.5244798, -2.787448, 0.427451, 1, 0, 1,
-0.7060018, -0.8981434, -2.068489, 0.4235294, 1, 0, 1,
-0.7001593, -0.4114728, -2.701072, 0.4156863, 1, 0, 1,
-0.6929694, -0.3172841, -3.01681, 0.4117647, 1, 0, 1,
-0.6842101, -1.457569, -2.448517, 0.4039216, 1, 0, 1,
-0.6835477, -1.541664, -4.351109, 0.3960784, 1, 0, 1,
-0.6831014, -0.4353299, -2.365407, 0.3921569, 1, 0, 1,
-0.6827067, -0.3349517, -2.281822, 0.3843137, 1, 0, 1,
-0.6808429, -1.440632, -0.9517004, 0.3803922, 1, 0, 1,
-0.680677, -0.08164991, -3.376593, 0.372549, 1, 0, 1,
-0.6801753, 0.5721944, -1.859552, 0.3686275, 1, 0, 1,
-0.671181, -1.127582, -2.176312, 0.3607843, 1, 0, 1,
-0.6653823, 0.008260833, -0.9789693, 0.3568628, 1, 0, 1,
-0.6639925, -0.3202941, -1.430831, 0.3490196, 1, 0, 1,
-0.6639481, 0.200228, -1.382095, 0.345098, 1, 0, 1,
-0.6631069, -0.2886542, -4.265494, 0.3372549, 1, 0, 1,
-0.659826, -1.181588, -2.387893, 0.3333333, 1, 0, 1,
-0.6556975, 1.005405, 0.5873086, 0.3254902, 1, 0, 1,
-0.648261, 0.1583208, -1.604215, 0.3215686, 1, 0, 1,
-0.6467245, 0.8271865, -0.48652, 0.3137255, 1, 0, 1,
-0.6432523, -0.175336, -1.052504, 0.3098039, 1, 0, 1,
-0.6432419, -0.8683704, -1.743851, 0.3019608, 1, 0, 1,
-0.6425771, 0.2391267, -0.9028653, 0.2941177, 1, 0, 1,
-0.6411089, 0.3990693, 0.5463813, 0.2901961, 1, 0, 1,
-0.6392352, -1.163887, -3.190507, 0.282353, 1, 0, 1,
-0.636558, -1.6451, -1.92782, 0.2784314, 1, 0, 1,
-0.6346058, -0.9022303, -5.265694, 0.2705882, 1, 0, 1,
-0.6343747, -1.122025, -2.693598, 0.2666667, 1, 0, 1,
-0.6303036, -2.024506, -3.292589, 0.2588235, 1, 0, 1,
-0.6281185, 1.392664, -0.733735, 0.254902, 1, 0, 1,
-0.6230428, 1.036477, 0.2518761, 0.2470588, 1, 0, 1,
-0.6192697, -0.5267097, -3.322002, 0.2431373, 1, 0, 1,
-0.618147, -1.537421, -2.648452, 0.2352941, 1, 0, 1,
-0.6154554, -0.2911209, -1.028448, 0.2313726, 1, 0, 1,
-0.6073845, -0.2188403, -2.106985, 0.2235294, 1, 0, 1,
-0.6043446, -1.162576, -2.243377, 0.2196078, 1, 0, 1,
-0.5999495, 1.012069, 0.06202782, 0.2117647, 1, 0, 1,
-0.5917852, -0.9441838, -3.754554, 0.2078431, 1, 0, 1,
-0.5879186, 1.672135, -0.9915141, 0.2, 1, 0, 1,
-0.5855575, -2.115175, -2.871673, 0.1921569, 1, 0, 1,
-0.5850679, -0.0756043, -2.852449, 0.1882353, 1, 0, 1,
-0.5843918, 0.04794453, -1.924709, 0.1803922, 1, 0, 1,
-0.5837766, -0.3090946, -2.571196, 0.1764706, 1, 0, 1,
-0.5823662, -0.418099, -2.935623, 0.1686275, 1, 0, 1,
-0.5799254, -1.302883, -3.292956, 0.1647059, 1, 0, 1,
-0.5779923, -0.7413894, -2.234475, 0.1568628, 1, 0, 1,
-0.5712849, 0.1232257, -0.9388334, 0.1529412, 1, 0, 1,
-0.5687439, -0.4615418, -1.494209, 0.145098, 1, 0, 1,
-0.566319, -0.4388615, -2.86091, 0.1411765, 1, 0, 1,
-0.5658971, 1.068042, -1.317799, 0.1333333, 1, 0, 1,
-0.5638157, 1.106752, 0.2339846, 0.1294118, 1, 0, 1,
-0.5593864, -0.1247523, -1.782281, 0.1215686, 1, 0, 1,
-0.5572879, -0.6859449, -2.558972, 0.1176471, 1, 0, 1,
-0.5538803, -1.856121, -3.134333, 0.1098039, 1, 0, 1,
-0.5499307, -0.7309016, -2.026834, 0.1058824, 1, 0, 1,
-0.5496852, -0.3459454, -1.669166, 0.09803922, 1, 0, 1,
-0.5488802, 0.5504534, -1.304396, 0.09019608, 1, 0, 1,
-0.5473577, -0.3281408, -3.627347, 0.08627451, 1, 0, 1,
-0.5410959, 0.7687629, -1.200167, 0.07843138, 1, 0, 1,
-0.5335249, -1.841153, -3.261786, 0.07450981, 1, 0, 1,
-0.5295298, -0.2352343, -3.172536, 0.06666667, 1, 0, 1,
-0.5237089, 0.1032646, -0.5832678, 0.0627451, 1, 0, 1,
-0.5189982, -0.1973162, -1.809513, 0.05490196, 1, 0, 1,
-0.516739, -0.1365297, -2.448438, 0.05098039, 1, 0, 1,
-0.5146922, -0.4995239, -2.428753, 0.04313726, 1, 0, 1,
-0.5056212, 0.6118194, -1.015313, 0.03921569, 1, 0, 1,
-0.4973368, 0.2606231, -0.3248729, 0.03137255, 1, 0, 1,
-0.4971971, -0.3794048, -1.854538, 0.02745098, 1, 0, 1,
-0.4949559, -0.6419407, -0.8517329, 0.01960784, 1, 0, 1,
-0.4940557, 1.12159, -0.730049, 0.01568628, 1, 0, 1,
-0.4906408, -1.288735, -2.966972, 0.007843138, 1, 0, 1,
-0.4881267, -1.182302, -3.145083, 0.003921569, 1, 0, 1,
-0.4861268, 0.05042208, -1.624629, 0, 1, 0.003921569, 1,
-0.4854634, -0.341887, -2.042572, 0, 1, 0.01176471, 1,
-0.484028, -0.3009307, -1.863214, 0, 1, 0.01568628, 1,
-0.4806541, 0.7808523, -0.02501771, 0, 1, 0.02352941, 1,
-0.4804588, -1.022656, -4.306982, 0, 1, 0.02745098, 1,
-0.480136, -0.7642655, -2.711023, 0, 1, 0.03529412, 1,
-0.4726092, -1.141151, -4.46925, 0, 1, 0.03921569, 1,
-0.4700288, 0.8611267, 0.09441663, 0, 1, 0.04705882, 1,
-0.4683052, -1.118308, -2.831923, 0, 1, 0.05098039, 1,
-0.4653045, -0.1601108, -1.874791, 0, 1, 0.05882353, 1,
-0.4646835, 1.428675, -1.339471, 0, 1, 0.0627451, 1,
-0.4592412, 0.3984568, -1.498271, 0, 1, 0.07058824, 1,
-0.4584437, 0.4098656, 0.1262959, 0, 1, 0.07450981, 1,
-0.4579407, 1.01845, 0.7858354, 0, 1, 0.08235294, 1,
-0.4567753, 0.5844061, 1.166009, 0, 1, 0.08627451, 1,
-0.4525953, 2.537137, -1.159615, 0, 1, 0.09411765, 1,
-0.4514927, 0.2831871, -2.007821, 0, 1, 0.1019608, 1,
-0.4499969, 0.6649387, -0.327623, 0, 1, 0.1058824, 1,
-0.4497285, -0.3867569, -2.644279, 0, 1, 0.1137255, 1,
-0.4470291, 1.020993, -1.121138, 0, 1, 0.1176471, 1,
-0.4446212, 0.1568838, -0.5216702, 0, 1, 0.1254902, 1,
-0.4427121, -0.9492315, -3.262956, 0, 1, 0.1294118, 1,
-0.4413318, 0.2470632, -0.1515927, 0, 1, 0.1372549, 1,
-0.4401315, 1.165371, 0.1569455, 0, 1, 0.1411765, 1,
-0.4390232, -0.007377296, -2.060593, 0, 1, 0.1490196, 1,
-0.436527, -1.32414, -2.29196, 0, 1, 0.1529412, 1,
-0.434866, 0.255298, -1.003226, 0, 1, 0.1607843, 1,
-0.4333575, -1.16871, -3.433368, 0, 1, 0.1647059, 1,
-0.4331204, 0.5222923, 0.1448682, 0, 1, 0.172549, 1,
-0.4299273, 1.928859, -0.6305142, 0, 1, 0.1764706, 1,
-0.4230331, -0.7103726, -2.930902, 0, 1, 0.1843137, 1,
-0.4228964, 0.08499894, -0.9240451, 0, 1, 0.1882353, 1,
-0.4195929, -0.4283969, -3.447286, 0, 1, 0.1960784, 1,
-0.4171947, -0.3872493, -1.974868, 0, 1, 0.2039216, 1,
-0.4161985, -1.436251, -1.842134, 0, 1, 0.2078431, 1,
-0.4119502, -0.08513281, -2.052476, 0, 1, 0.2156863, 1,
-0.4083109, 0.279566, -1.04234, 0, 1, 0.2196078, 1,
-0.4074157, 1.038837, 0.2502076, 0, 1, 0.227451, 1,
-0.4071694, -0.1920024, -1.726528, 0, 1, 0.2313726, 1,
-0.3989213, 0.8870596, -0.4851959, 0, 1, 0.2392157, 1,
-0.3958772, 2.13419, 0.271777, 0, 1, 0.2431373, 1,
-0.388842, -0.08594858, -1.581681, 0, 1, 0.2509804, 1,
-0.384696, -0.9491469, -0.5590898, 0, 1, 0.254902, 1,
-0.3826303, -2.176625, -3.68408, 0, 1, 0.2627451, 1,
-0.3816717, 0.3744133, -0.9504047, 0, 1, 0.2666667, 1,
-0.3814885, 0.5719853, 1.27929, 0, 1, 0.2745098, 1,
-0.3811371, -1.180987, -3.035529, 0, 1, 0.2784314, 1,
-0.3766246, -0.3459227, -2.706072, 0, 1, 0.2862745, 1,
-0.3728712, 2.103091, 0.1848613, 0, 1, 0.2901961, 1,
-0.3725727, -1.242684, -3.611651, 0, 1, 0.2980392, 1,
-0.3718744, 0.09575745, -0.9248744, 0, 1, 0.3058824, 1,
-0.3707733, 0.5590746, 0.955769, 0, 1, 0.3098039, 1,
-0.3614846, 1.224745, 0.498508, 0, 1, 0.3176471, 1,
-0.3595918, -0.746884, -2.972225, 0, 1, 0.3215686, 1,
-0.3593433, -0.2952866, -2.312957, 0, 1, 0.3294118, 1,
-0.3561428, 0.1298163, -2.764071, 0, 1, 0.3333333, 1,
-0.3552061, -0.3637557, -1.917033, 0, 1, 0.3411765, 1,
-0.3450872, 0.5851982, -0.2993401, 0, 1, 0.345098, 1,
-0.3449993, 2.077755, -0.4943252, 0, 1, 0.3529412, 1,
-0.3353868, -0.8064001, -2.035354, 0, 1, 0.3568628, 1,
-0.3223097, 0.07857064, -2.120422, 0, 1, 0.3647059, 1,
-0.3164296, -0.3626625, -3.447749, 0, 1, 0.3686275, 1,
-0.3060157, -1.361614, -4.240492, 0, 1, 0.3764706, 1,
-0.3058113, -0.5578922, -3.583603, 0, 1, 0.3803922, 1,
-0.3025985, -1.736795, -1.134572, 0, 1, 0.3882353, 1,
-0.2920884, 0.1304667, -0.4697334, 0, 1, 0.3921569, 1,
-0.2890276, 0.0343831, -2.008898, 0, 1, 0.4, 1,
-0.2880123, 0.6178121, -0.2163057, 0, 1, 0.4078431, 1,
-0.2787985, -1.050819, -2.567699, 0, 1, 0.4117647, 1,
-0.2783656, 2.093757, 0.9173805, 0, 1, 0.4196078, 1,
-0.2770526, 0.8110805, -1.208553, 0, 1, 0.4235294, 1,
-0.2768553, -0.1209544, -2.866552, 0, 1, 0.4313726, 1,
-0.2755795, -0.4319173, -3.165669, 0, 1, 0.4352941, 1,
-0.2738614, 0.8120878, -1.557029, 0, 1, 0.4431373, 1,
-0.2718492, -2.103279, -1.252247, 0, 1, 0.4470588, 1,
-0.2528809, 0.4211894, 0.1985574, 0, 1, 0.454902, 1,
-0.2505817, 1.168331, -0.544335, 0, 1, 0.4588235, 1,
-0.2497176, 0.4652655, -0.5740346, 0, 1, 0.4666667, 1,
-0.2475924, 1.412392, -0.1312654, 0, 1, 0.4705882, 1,
-0.2464674, 1.238508, 0.3048286, 0, 1, 0.4784314, 1,
-0.245545, 1.208719, 1.216118, 0, 1, 0.4823529, 1,
-0.2393366, 0.1260623, 0.7217329, 0, 1, 0.4901961, 1,
-0.2377594, 0.1959597, -1.44699, 0, 1, 0.4941176, 1,
-0.2326834, 1.990199, 0.8650266, 0, 1, 0.5019608, 1,
-0.2315208, -0.3922812, -1.735275, 0, 1, 0.509804, 1,
-0.2304737, -1.566491, -3.634723, 0, 1, 0.5137255, 1,
-0.2287744, -0.7727978, -3.523719, 0, 1, 0.5215687, 1,
-0.2287165, -1.263845, -3.007993, 0, 1, 0.5254902, 1,
-0.225973, 0.9361315, 0.7042107, 0, 1, 0.5333334, 1,
-0.2167985, -0.1127129, -1.30891, 0, 1, 0.5372549, 1,
-0.2143669, 1.267258, 1.523033, 0, 1, 0.5450981, 1,
-0.2112605, -0.4931336, -2.056463, 0, 1, 0.5490196, 1,
-0.2075918, 0.3423857, -1.740867, 0, 1, 0.5568628, 1,
-0.205733, 2.08684, -1.047459, 0, 1, 0.5607843, 1,
-0.2048777, -2.527947, -4.227978, 0, 1, 0.5686275, 1,
-0.2035736, -0.5044029, -3.167759, 0, 1, 0.572549, 1,
-0.1936499, -3.01837, -3.570313, 0, 1, 0.5803922, 1,
-0.1915293, 0.5015261, -0.03993608, 0, 1, 0.5843138, 1,
-0.1913038, 0.5248551, 1.055442, 0, 1, 0.5921569, 1,
-0.1902699, 0.5579867, -0.486573, 0, 1, 0.5960785, 1,
-0.189063, -1.416972, -2.266795, 0, 1, 0.6039216, 1,
-0.1887027, 1.30854, 0.1772413, 0, 1, 0.6117647, 1,
-0.1882116, 1.756978, 0.6471893, 0, 1, 0.6156863, 1,
-0.1797786, -1.788735, -2.640044, 0, 1, 0.6235294, 1,
-0.1730809, 1.384313, -2.430534, 0, 1, 0.627451, 1,
-0.1724965, -0.3678833, -3.504343, 0, 1, 0.6352941, 1,
-0.1712397, 0.4628972, 0.2198051, 0, 1, 0.6392157, 1,
-0.167539, 0.8553316, 1.370692, 0, 1, 0.6470588, 1,
-0.1665449, -0.8554907, -3.253308, 0, 1, 0.6509804, 1,
-0.1635699, 0.7308816, 0.7151548, 0, 1, 0.6588235, 1,
-0.1597044, -0.1969508, -1.770646, 0, 1, 0.6627451, 1,
-0.1565727, -0.7592634, -1.83884, 0, 1, 0.6705883, 1,
-0.1530297, 0.6086695, 1.850182, 0, 1, 0.6745098, 1,
-0.1528176, -1.279283, -2.714697, 0, 1, 0.682353, 1,
-0.1463073, 1.719759, 0.135281, 0, 1, 0.6862745, 1,
-0.144935, 0.6271436, -1.536416, 0, 1, 0.6941177, 1,
-0.1443951, 0.3919064, -0.5333487, 0, 1, 0.7019608, 1,
-0.1422176, -0.03511858, -2.375494, 0, 1, 0.7058824, 1,
-0.1397856, 1.970993, -1.158016, 0, 1, 0.7137255, 1,
-0.1305675, 1.020547, -7.164149e-05, 0, 1, 0.7176471, 1,
-0.1299374, 1.154258, -1.136209, 0, 1, 0.7254902, 1,
-0.1294722, 0.9203624, 0.3454043, 0, 1, 0.7294118, 1,
-0.1246484, 0.5455688, -1.107153, 0, 1, 0.7372549, 1,
-0.1226262, 2.219418, 0.3646045, 0, 1, 0.7411765, 1,
-0.1220816, -0.6790699, -3.248185, 0, 1, 0.7490196, 1,
-0.1180877, -0.2989865, -2.831749, 0, 1, 0.7529412, 1,
-0.1175932, -0.7415084, -4.66378, 0, 1, 0.7607843, 1,
-0.1154689, 0.4452524, -0.5212815, 0, 1, 0.7647059, 1,
-0.113871, 0.3777984, -2.187565, 0, 1, 0.772549, 1,
-0.1132374, 1.505303, -1.372257, 0, 1, 0.7764706, 1,
-0.1019178, -0.09197832, -0.1389389, 0, 1, 0.7843137, 1,
-0.09654424, -0.2640402, -1.905101, 0, 1, 0.7882353, 1,
-0.09389492, -0.04501671, -2.331888, 0, 1, 0.7960784, 1,
-0.09176305, -1.106457, -2.191743, 0, 1, 0.8039216, 1,
-0.09020612, 0.7523875, -1.041813, 0, 1, 0.8078431, 1,
-0.08963852, 1.394738, -0.3682314, 0, 1, 0.8156863, 1,
-0.08922073, -1.303285, -3.370514, 0, 1, 0.8196079, 1,
-0.08889805, 0.6692408, 1.14248, 0, 1, 0.827451, 1,
-0.0861593, -0.8824075, -4.193388, 0, 1, 0.8313726, 1,
-0.08040988, 1.521115, 1.536215, 0, 1, 0.8392157, 1,
-0.07894439, -1.137319, -3.633336, 0, 1, 0.8431373, 1,
-0.07699756, -1.165401, -4.067785, 0, 1, 0.8509804, 1,
-0.07671946, -1.041819, -3.08369, 0, 1, 0.854902, 1,
-0.07569793, 0.3858545, -1.466719, 0, 1, 0.8627451, 1,
-0.07465368, -0.7931566, -3.429822, 0, 1, 0.8666667, 1,
-0.07130745, -0.4401728, -3.214454, 0, 1, 0.8745098, 1,
-0.07121162, -0.7319859, -3.99963, 0, 1, 0.8784314, 1,
-0.07026441, 0.05053942, -0.6335139, 0, 1, 0.8862745, 1,
-0.066994, 1.292285, -0.4045951, 0, 1, 0.8901961, 1,
-0.06538945, -1.415368, -4.80959, 0, 1, 0.8980392, 1,
-0.06501047, 1.857148, -0.3871932, 0, 1, 0.9058824, 1,
-0.06446506, 2.014842, -1.101057, 0, 1, 0.9098039, 1,
-0.06440726, -0.06521433, -2.314309, 0, 1, 0.9176471, 1,
-0.05528661, 1.691443, -0.1244899, 0, 1, 0.9215686, 1,
-0.05390754, -0.4369479, -3.068147, 0, 1, 0.9294118, 1,
-0.05332114, 0.09087038, -0.001513989, 0, 1, 0.9333333, 1,
-0.05119893, -0.6170189, -3.505242, 0, 1, 0.9411765, 1,
-0.04952762, -1.115247, -1.375369, 0, 1, 0.945098, 1,
-0.04591461, -0.3153001, -3.725142, 0, 1, 0.9529412, 1,
-0.04579352, 0.8759739, 0.4179891, 0, 1, 0.9568627, 1,
-0.04425151, 1.248613, 1.689085, 0, 1, 0.9647059, 1,
-0.04419079, 0.3028949, -0.1857409, 0, 1, 0.9686275, 1,
-0.04403386, 0.01360256, 0.1566588, 0, 1, 0.9764706, 1,
-0.04207977, 0.6545876, 0.1337438, 0, 1, 0.9803922, 1,
-0.0381665, 0.4087685, -1.199453, 0, 1, 0.9882353, 1,
-0.03506361, -1.020039, -3.227896, 0, 1, 0.9921569, 1,
-0.0340079, 1.345611, 0.6189792, 0, 1, 1, 1,
-0.03219588, 0.4311689, -0.08453631, 0, 0.9921569, 1, 1,
-0.02930402, -0.5917163, -4.275682, 0, 0.9882353, 1, 1,
-0.02904928, -0.1392927, -2.825743, 0, 0.9803922, 1, 1,
-0.02710318, 1.90502, -0.09111417, 0, 0.9764706, 1, 1,
-0.02510424, -2.109586, -3.379796, 0, 0.9686275, 1, 1,
-0.02231908, -0.5197526, -3.07506, 0, 0.9647059, 1, 1,
-0.02038212, -0.9285969, -2.719924, 0, 0.9568627, 1, 1,
-0.01975892, 1.220555, -1.292217, 0, 0.9529412, 1, 1,
-0.0164555, -0.588056, -2.962451, 0, 0.945098, 1, 1,
-0.01303824, 0.5818772, -0.7852471, 0, 0.9411765, 1, 1,
-0.007105599, -0.1838282, -2.19634, 0, 0.9333333, 1, 1,
-0.005767637, 0.1494226, 0.2546579, 0, 0.9294118, 1, 1,
-0.005531435, 0.2975394, -2.602393, 0, 0.9215686, 1, 1,
-0.002728064, -1.097998, -3.630316, 0, 0.9176471, 1, 1,
-0.000599783, 1.084667, 0.2974961, 0, 0.9098039, 1, 1,
0.0009253253, -0.9629055, 4.193923, 0, 0.9058824, 1, 1,
0.004305363, -0.3510429, 1.531481, 0, 0.8980392, 1, 1,
0.004558321, -1.234379, 3.451686, 0, 0.8901961, 1, 1,
0.004690731, 0.1634214, 0.6110928, 0, 0.8862745, 1, 1,
0.004727494, -0.6621199, 2.799131, 0, 0.8784314, 1, 1,
0.008490848, 0.5916485, 2.074348, 0, 0.8745098, 1, 1,
0.01567385, -0.442741, 1.777852, 0, 0.8666667, 1, 1,
0.02181913, -2.20768, 3.489481, 0, 0.8627451, 1, 1,
0.02880325, -0.6673293, 3.175575, 0, 0.854902, 1, 1,
0.02932912, -0.7885348, 3.752422, 0, 0.8509804, 1, 1,
0.03202344, -0.477077, 2.445306, 0, 0.8431373, 1, 1,
0.03393222, -0.2144311, 0.8970578, 0, 0.8392157, 1, 1,
0.04156497, -0.3328848, 0.1927251, 0, 0.8313726, 1, 1,
0.04304572, -0.741347, 3.661754, 0, 0.827451, 1, 1,
0.04474876, 0.7219698, 1.449758, 0, 0.8196079, 1, 1,
0.04548174, 1.174039, -0.08772044, 0, 0.8156863, 1, 1,
0.04665849, -1.465561, 2.356419, 0, 0.8078431, 1, 1,
0.04780613, -0.9602588, 4.904263, 0, 0.8039216, 1, 1,
0.04811483, -0.7439989, 4.436098, 0, 0.7960784, 1, 1,
0.04855989, -2.510132, 2.959849, 0, 0.7882353, 1, 1,
0.05201359, 0.05431633, 0.8718707, 0, 0.7843137, 1, 1,
0.05295494, 0.9817833, -0.5356941, 0, 0.7764706, 1, 1,
0.05419789, 1.865183, -0.07199073, 0, 0.772549, 1, 1,
0.05437791, 0.1244448, 1.011735, 0, 0.7647059, 1, 1,
0.0552021, -0.6343223, 4.305546, 0, 0.7607843, 1, 1,
0.05602792, 0.7189128, -0.1928707, 0, 0.7529412, 1, 1,
0.06554087, -1.1879, 3.161774, 0, 0.7490196, 1, 1,
0.06579259, -0.1233116, 3.248653, 0, 0.7411765, 1, 1,
0.0688231, -1.478223, 3.233513, 0, 0.7372549, 1, 1,
0.06938534, 0.2956221, 0.9002401, 0, 0.7294118, 1, 1,
0.07208266, -0.0885997, 1.160958, 0, 0.7254902, 1, 1,
0.07208648, -0.4131802, 1.600449, 0, 0.7176471, 1, 1,
0.07386386, -0.4145643, 2.218164, 0, 0.7137255, 1, 1,
0.07565383, 0.6153163, -1.50919, 0, 0.7058824, 1, 1,
0.07768293, -0.7529233, 1.680719, 0, 0.6980392, 1, 1,
0.0847991, -0.884708, 1.466529, 0, 0.6941177, 1, 1,
0.08745476, -1.867138, 2.81407, 0, 0.6862745, 1, 1,
0.09695073, -0.331971, 1.790732, 0, 0.682353, 1, 1,
0.09964596, 1.288934, 0.3159723, 0, 0.6745098, 1, 1,
0.1118838, -0.1336284, 0.3340726, 0, 0.6705883, 1, 1,
0.1149477, -1.01827, 2.092566, 0, 0.6627451, 1, 1,
0.117542, 1.626642, 0.4123262, 0, 0.6588235, 1, 1,
0.123811, -0.4758014, 3.726553, 0, 0.6509804, 1, 1,
0.1310767, 0.1711226, 0.7383128, 0, 0.6470588, 1, 1,
0.1370954, -0.3673828, 2.099058, 0, 0.6392157, 1, 1,
0.1387979, -0.01308733, 1.804945, 0, 0.6352941, 1, 1,
0.1408632, -0.04734287, 0.7570969, 0, 0.627451, 1, 1,
0.1440745, -0.2083491, 1.73141, 0, 0.6235294, 1, 1,
0.1446894, 0.1577871, 1.216359, 0, 0.6156863, 1, 1,
0.1476334, -0.1093257, 2.119353, 0, 0.6117647, 1, 1,
0.1504461, -0.2598795, 1.531367, 0, 0.6039216, 1, 1,
0.1516783, 0.1420005, -0.06317396, 0, 0.5960785, 1, 1,
0.1529919, 0.9977043, 0.6326118, 0, 0.5921569, 1, 1,
0.1535667, -1.73631, 3.027578, 0, 0.5843138, 1, 1,
0.1564824, -0.302521, 4.569326, 0, 0.5803922, 1, 1,
0.1577573, 1.576073, -0.126713, 0, 0.572549, 1, 1,
0.1608978, -0.5314292, 3.924974, 0, 0.5686275, 1, 1,
0.1654473, 0.7316669, 1.213768, 0, 0.5607843, 1, 1,
0.1661066, -0.6260545, 1.057201, 0, 0.5568628, 1, 1,
0.1696128, -1.226704, 3.60964, 0, 0.5490196, 1, 1,
0.1715842, 1.01608, 0.07480519, 0, 0.5450981, 1, 1,
0.174737, -0.8728721, 3.74325, 0, 0.5372549, 1, 1,
0.1750183, -1.948477, 4.023116, 0, 0.5333334, 1, 1,
0.1756758, 1.418963, -0.1665768, 0, 0.5254902, 1, 1,
0.1813494, -0.1025522, 3.301678, 0, 0.5215687, 1, 1,
0.1845851, -0.2525544, 3.885092, 0, 0.5137255, 1, 1,
0.1851929, -0.5102026, 2.387083, 0, 0.509804, 1, 1,
0.1858299, 0.9740184, 0.1345143, 0, 0.5019608, 1, 1,
0.1868592, 1.38629, -1.235074, 0, 0.4941176, 1, 1,
0.1871223, -1.028416, 4.654756, 0, 0.4901961, 1, 1,
0.1920118, 1.406052, 0.5201133, 0, 0.4823529, 1, 1,
0.1983905, -0.2211402, 0.6621808, 0, 0.4784314, 1, 1,
0.1994483, 1.661147, 2.540688, 0, 0.4705882, 1, 1,
0.1995356, 1.23866, 0.2444565, 0, 0.4666667, 1, 1,
0.2007562, -1.735643, 1.34662, 0, 0.4588235, 1, 1,
0.2019303, -0.07090886, 2.234953, 0, 0.454902, 1, 1,
0.2103249, 0.1897208, -0.862504, 0, 0.4470588, 1, 1,
0.2151117, 0.04541694, 0.07932483, 0, 0.4431373, 1, 1,
0.2197771, -0.7729526, 0.6669341, 0, 0.4352941, 1, 1,
0.2262227, 1.236282, 1.858566, 0, 0.4313726, 1, 1,
0.2322136, 0.1441914, 0.3285033, 0, 0.4235294, 1, 1,
0.2351515, 0.492425, 0.8808489, 0, 0.4196078, 1, 1,
0.2406616, 0.3502489, 0.5546842, 0, 0.4117647, 1, 1,
0.2423311, 0.740378, -0.1345313, 0, 0.4078431, 1, 1,
0.2481576, 1.779341, -0.1618272, 0, 0.4, 1, 1,
0.2501048, -0.699563, 2.429688, 0, 0.3921569, 1, 1,
0.2536735, -1.843969, 3.542698, 0, 0.3882353, 1, 1,
0.2566177, 0.4006188, 0.7923808, 0, 0.3803922, 1, 1,
0.2575833, -0.2676232, 3.508121, 0, 0.3764706, 1, 1,
0.2578965, -0.3157004, 2.244892, 0, 0.3686275, 1, 1,
0.2597758, 1.691649, 2.368396, 0, 0.3647059, 1, 1,
0.2598685, -2.164678, 3.123883, 0, 0.3568628, 1, 1,
0.2625498, -0.4072456, 3.190298, 0, 0.3529412, 1, 1,
0.2654496, -1.701889, 4.232949, 0, 0.345098, 1, 1,
0.2666659, 0.09553766, 0.438528, 0, 0.3411765, 1, 1,
0.2667022, 0.009042214, 1.487855, 0, 0.3333333, 1, 1,
0.2672374, 1.14787, 1.17595, 0, 0.3294118, 1, 1,
0.2687769, -1.104823, 1.486489, 0, 0.3215686, 1, 1,
0.2714473, -0.7565945, 0.2885051, 0, 0.3176471, 1, 1,
0.2725094, 1.95832, -0.5679612, 0, 0.3098039, 1, 1,
0.273633, -0.5084234, 3.549783, 0, 0.3058824, 1, 1,
0.2743869, -1.087495, 2.952999, 0, 0.2980392, 1, 1,
0.2746455, 1.450103, 0.2028863, 0, 0.2901961, 1, 1,
0.275166, 0.4197321, 0.8920958, 0, 0.2862745, 1, 1,
0.2773706, -0.1663636, 1.839933, 0, 0.2784314, 1, 1,
0.2798707, 0.3473963, 0.7586467, 0, 0.2745098, 1, 1,
0.2802873, 0.1060635, 1.45396, 0, 0.2666667, 1, 1,
0.2853085, 0.08092441, 0.693803, 0, 0.2627451, 1, 1,
0.2900314, 0.5504518, -0.05942567, 0, 0.254902, 1, 1,
0.2974102, -0.2190667, 2.292123, 0, 0.2509804, 1, 1,
0.3070541, 0.636299, -0.6426618, 0, 0.2431373, 1, 1,
0.3079558, -0.29179, 4.259817, 0, 0.2392157, 1, 1,
0.3109627, 0.5338265, 2.280823, 0, 0.2313726, 1, 1,
0.3130797, 0.5770952, 2.071734, 0, 0.227451, 1, 1,
0.3185183, -0.000432117, 3.750413, 0, 0.2196078, 1, 1,
0.3229373, -0.02942161, 1.773221, 0, 0.2156863, 1, 1,
0.3238863, 1.038973, 2.21059, 0, 0.2078431, 1, 1,
0.324077, 0.650362, -0.9560498, 0, 0.2039216, 1, 1,
0.3257003, 0.0009394668, 2.676969, 0, 0.1960784, 1, 1,
0.3290657, 0.5370369, 0.7962004, 0, 0.1882353, 1, 1,
0.3340394, -0.2441616, 1.696905, 0, 0.1843137, 1, 1,
0.3353643, 0.3175139, 0.07338384, 0, 0.1764706, 1, 1,
0.3355956, 0.2118216, 1.267208, 0, 0.172549, 1, 1,
0.3473336, -1.255823, 0.8561254, 0, 0.1647059, 1, 1,
0.3473599, -0.4028469, 3.134827, 0, 0.1607843, 1, 1,
0.3506921, -0.531957, 3.522804, 0, 0.1529412, 1, 1,
0.3587938, -0.1775838, 1.19698, 0, 0.1490196, 1, 1,
0.3589177, -0.5837191, 3.866471, 0, 0.1411765, 1, 1,
0.3602788, 0.4496643, -1.84542, 0, 0.1372549, 1, 1,
0.3636768, -0.02950099, 2.461054, 0, 0.1294118, 1, 1,
0.3645355, 0.1986908, 2.281033, 0, 0.1254902, 1, 1,
0.3677769, -1.101204, 3.804483, 0, 0.1176471, 1, 1,
0.3715496, -0.4932291, 3.705962, 0, 0.1137255, 1, 1,
0.3742131, 0.07926825, 2.143025, 0, 0.1058824, 1, 1,
0.3752178, 1.31509, -0.6167989, 0, 0.09803922, 1, 1,
0.376086, -0.2583734, 0.7194916, 0, 0.09411765, 1, 1,
0.3770357, -1.012966, 4.56129, 0, 0.08627451, 1, 1,
0.3859266, 0.4918029, 1.08359, 0, 0.08235294, 1, 1,
0.3892115, 0.4407128, 0.6120374, 0, 0.07450981, 1, 1,
0.3897728, -0.56748, 2.778207, 0, 0.07058824, 1, 1,
0.3936443, -2.034905, 2.695732, 0, 0.0627451, 1, 1,
0.393956, 0.3381826, -0.2374559, 0, 0.05882353, 1, 1,
0.3964877, -0.417174, 2.965716, 0, 0.05098039, 1, 1,
0.3973498, -0.2097072, 2.237136, 0, 0.04705882, 1, 1,
0.3976832, -1.149443, 3.739993, 0, 0.03921569, 1, 1,
0.4003446, 1.414992, -0.5696836, 0, 0.03529412, 1, 1,
0.4121817, 1.006251, -0.1781164, 0, 0.02745098, 1, 1,
0.412838, 1.275537, 0.811425, 0, 0.02352941, 1, 1,
0.4135297, 1.346128, 1.56887, 0, 0.01568628, 1, 1,
0.413713, -0.8916085, 3.513551, 0, 0.01176471, 1, 1,
0.4141271, 0.6433457, 1.559735, 0, 0.003921569, 1, 1,
0.4160044, -1.056258, 3.405515, 0.003921569, 0, 1, 1,
0.4160725, -1.164674, 2.48798, 0.007843138, 0, 1, 1,
0.4169988, -1.760179, 3.225883, 0.01568628, 0, 1, 1,
0.4213497, 0.2851264, 1.673883, 0.01960784, 0, 1, 1,
0.4241872, 0.1415358, 0.4872499, 0.02745098, 0, 1, 1,
0.4249913, 0.3331715, 1.301064, 0.03137255, 0, 1, 1,
0.4277681, 0.3250958, 0.2910104, 0.03921569, 0, 1, 1,
0.4470469, 1.545349, 0.3126698, 0.04313726, 0, 1, 1,
0.4568763, 2.168023, 1.326792, 0.05098039, 0, 1, 1,
0.4568772, 1.304112, -0.892857, 0.05490196, 0, 1, 1,
0.4576735, -0.2023172, 1.650232, 0.0627451, 0, 1, 1,
0.4604156, 0.7378133, 0.9585401, 0.06666667, 0, 1, 1,
0.4636325, 0.9771586, 1.543615, 0.07450981, 0, 1, 1,
0.4740117, 0.38173, 1.634513, 0.07843138, 0, 1, 1,
0.4811555, -1.003521, 1.895152, 0.08627451, 0, 1, 1,
0.4812759, 1.209312, 1.989514, 0.09019608, 0, 1, 1,
0.4822492, 1.670599, 1.941875, 0.09803922, 0, 1, 1,
0.4826226, -0.7965215, 2.302327, 0.1058824, 0, 1, 1,
0.4844441, 0.2966641, 1.986911, 0.1098039, 0, 1, 1,
0.4901108, -0.9620962, 1.950702, 0.1176471, 0, 1, 1,
0.4928802, 0.7533124, 0.6663251, 0.1215686, 0, 1, 1,
0.4931611, 0.6242985, 1.146139, 0.1294118, 0, 1, 1,
0.5033194, -0.738335, 2.602315, 0.1333333, 0, 1, 1,
0.5047352, -1.336329, 3.574083, 0.1411765, 0, 1, 1,
0.5068969, -1.152806, 2.295109, 0.145098, 0, 1, 1,
0.5071517, -1.689718, 2.958065, 0.1529412, 0, 1, 1,
0.5103428, 0.3349633, 0.6786131, 0.1568628, 0, 1, 1,
0.5122746, -0.9979218, 2.954411, 0.1647059, 0, 1, 1,
0.5173636, 0.04055138, 2.691919, 0.1686275, 0, 1, 1,
0.5210692, -0.7479736, 2.209489, 0.1764706, 0, 1, 1,
0.5214387, 1.122779, 0.266556, 0.1803922, 0, 1, 1,
0.529766, 0.941316, 0.273246, 0.1882353, 0, 1, 1,
0.5331674, 0.05638565, 2.078397, 0.1921569, 0, 1, 1,
0.5334976, -0.8986158, 2.619653, 0.2, 0, 1, 1,
0.5358408, 0.5060121, 0.2971128, 0.2078431, 0, 1, 1,
0.5373929, -0.7011043, 2.225575, 0.2117647, 0, 1, 1,
0.5388075, 0.431114, 0.4428934, 0.2196078, 0, 1, 1,
0.5412005, 1.19764, 0.1562738, 0.2235294, 0, 1, 1,
0.5489545, -1.340883, 0.3143718, 0.2313726, 0, 1, 1,
0.5508739, 1.994772, 0.8066189, 0.2352941, 0, 1, 1,
0.5515562, -0.6421013, 1.006875, 0.2431373, 0, 1, 1,
0.552286, 0.8554876, 0.67065, 0.2470588, 0, 1, 1,
0.5543183, 0.3398877, 0.5489923, 0.254902, 0, 1, 1,
0.5561426, -1.149945, 3.454868, 0.2588235, 0, 1, 1,
0.5574411, 0.6207828, 1.216974, 0.2666667, 0, 1, 1,
0.5579469, 0.29453, 1.191539, 0.2705882, 0, 1, 1,
0.5663982, -0.2413797, 1.937141, 0.2784314, 0, 1, 1,
0.5666041, 1.462034, 1.426082, 0.282353, 0, 1, 1,
0.5694822, -0.6452294, 3.078747, 0.2901961, 0, 1, 1,
0.5800896, 1.071312, 0.369344, 0.2941177, 0, 1, 1,
0.5808905, -0.6173317, 3.554943, 0.3019608, 0, 1, 1,
0.5810924, -0.5956014, 2.822757, 0.3098039, 0, 1, 1,
0.5820248, -0.109586, -8.877097e-05, 0.3137255, 0, 1, 1,
0.5826581, 0.04196891, -1.149835, 0.3215686, 0, 1, 1,
0.5847028, 1.034516, 0.8680056, 0.3254902, 0, 1, 1,
0.5970817, 1.167763, 1.974395, 0.3333333, 0, 1, 1,
0.5971839, 0.540462, 0.4116118, 0.3372549, 0, 1, 1,
0.5972296, 0.2067544, 1.224962, 0.345098, 0, 1, 1,
0.6064247, -0.995781, 2.678845, 0.3490196, 0, 1, 1,
0.607659, 0.008825433, 2.105136, 0.3568628, 0, 1, 1,
0.6119571, -2.90083, 4.148977, 0.3607843, 0, 1, 1,
0.6154779, 1.571559, -1.457831, 0.3686275, 0, 1, 1,
0.6190693, 0.6078047, -1.029584, 0.372549, 0, 1, 1,
0.6200522, -0.63847, 2.496153, 0.3803922, 0, 1, 1,
0.625905, -0.1732267, 2.663235, 0.3843137, 0, 1, 1,
0.6264694, -0.7094259, 2.317639, 0.3921569, 0, 1, 1,
0.6266903, -1.293134, 2.224958, 0.3960784, 0, 1, 1,
0.628857, 1.944738, 1.108351, 0.4039216, 0, 1, 1,
0.6349657, -0.164942, 2.329587, 0.4117647, 0, 1, 1,
0.6350797, 1.433211, 0.3660641, 0.4156863, 0, 1, 1,
0.638791, 0.8799213, 2.340816, 0.4235294, 0, 1, 1,
0.6398309, 1.567658, -0.002746838, 0.427451, 0, 1, 1,
0.6410155, 0.7906234, 1.876631, 0.4352941, 0, 1, 1,
0.6425325, -0.5631235, 2.199151, 0.4392157, 0, 1, 1,
0.6431732, 1.052531, 0.8377872, 0.4470588, 0, 1, 1,
0.6434715, -0.2639622, 2.531451, 0.4509804, 0, 1, 1,
0.6444762, -0.9503084, 2.564095, 0.4588235, 0, 1, 1,
0.6448427, 0.1908073, 0.05559584, 0.4627451, 0, 1, 1,
0.6451148, -0.6638992, 2.903836, 0.4705882, 0, 1, 1,
0.6500947, -0.9525709, 2.182617, 0.4745098, 0, 1, 1,
0.6559644, 0.1441199, 0.5243505, 0.4823529, 0, 1, 1,
0.6576837, -1.240825, 1.142509, 0.4862745, 0, 1, 1,
0.6626339, -0.009427243, 1.217265, 0.4941176, 0, 1, 1,
0.6652346, -1.540759, 1.0779, 0.5019608, 0, 1, 1,
0.6677909, -0.4608143, 0.9746684, 0.5058824, 0, 1, 1,
0.6698769, -0.6021502, 2.527056, 0.5137255, 0, 1, 1,
0.6707892, 0.8407041, -0.2233148, 0.5176471, 0, 1, 1,
0.6720988, 0.7583593, 0.99065, 0.5254902, 0, 1, 1,
0.6754383, 0.2695724, 3.104301, 0.5294118, 0, 1, 1,
0.6770697, 0.2680171, 1.142501, 0.5372549, 0, 1, 1,
0.6800117, 0.2747079, 2.775269, 0.5411765, 0, 1, 1,
0.6824207, -0.9779392, 0.2775672, 0.5490196, 0, 1, 1,
0.6872569, -0.5173092, 2.354536, 0.5529412, 0, 1, 1,
0.688007, 0.2301333, 1.9344, 0.5607843, 0, 1, 1,
0.6880499, -1.040528, 2.090317, 0.5647059, 0, 1, 1,
0.7022344, -0.1042095, 1.293001, 0.572549, 0, 1, 1,
0.7048029, -1.066591, 2.046536, 0.5764706, 0, 1, 1,
0.7202352, 0.4070958, 0.2618549, 0.5843138, 0, 1, 1,
0.7227435, 0.562943, -0.0691359, 0.5882353, 0, 1, 1,
0.7270176, 0.3981774, 2.22623, 0.5960785, 0, 1, 1,
0.7284549, 0.7401173, 1.647223, 0.6039216, 0, 1, 1,
0.7293171, -1.077741, 2.390227, 0.6078432, 0, 1, 1,
0.7297778, 0.2288044, 2.76641, 0.6156863, 0, 1, 1,
0.7311526, -1.067086, 3.461696, 0.6196079, 0, 1, 1,
0.7329109, -0.339314, 2.887777, 0.627451, 0, 1, 1,
0.7351995, 0.4851899, 0.4967988, 0.6313726, 0, 1, 1,
0.7381063, 1.256854, 0.240216, 0.6392157, 0, 1, 1,
0.7383355, -0.1083516, 0.5979595, 0.6431373, 0, 1, 1,
0.7459629, 0.2981372, 1.675412, 0.6509804, 0, 1, 1,
0.7488651, 0.468897, 0.6054352, 0.654902, 0, 1, 1,
0.749288, -0.4700549, 0.9427957, 0.6627451, 0, 1, 1,
0.7534956, 0.2209927, 1.539936, 0.6666667, 0, 1, 1,
0.7648131, 1.852942, -1.376488, 0.6745098, 0, 1, 1,
0.7660835, 0.3401964, 0.8450635, 0.6784314, 0, 1, 1,
0.7663109, -0.01680203, 1.813126, 0.6862745, 0, 1, 1,
0.7670489, -0.1026967, 1.227772, 0.6901961, 0, 1, 1,
0.7705229, 0.7047496, 1.974861, 0.6980392, 0, 1, 1,
0.7708083, -0.4898512, 2.76634, 0.7058824, 0, 1, 1,
0.7719513, -1.952839, 3.923758, 0.7098039, 0, 1, 1,
0.7752125, 0.1594216, 1.690338, 0.7176471, 0, 1, 1,
0.786169, -1.664443, 3.704547, 0.7215686, 0, 1, 1,
0.7881674, 1.847007, 0.6796784, 0.7294118, 0, 1, 1,
0.7898368, 1.267574, -0.1132956, 0.7333333, 0, 1, 1,
0.7948731, -1.271866, 1.98634, 0.7411765, 0, 1, 1,
0.7965692, -0.3547275, 0.4436426, 0.7450981, 0, 1, 1,
0.8020767, 1.611402, -0.7619611, 0.7529412, 0, 1, 1,
0.8049337, -0.7845396, 1.740757, 0.7568628, 0, 1, 1,
0.8059891, 0.05110614, 1.608802, 0.7647059, 0, 1, 1,
0.806271, -0.6137948, 2.373856, 0.7686275, 0, 1, 1,
0.807547, 0.5838038, 0.5367172, 0.7764706, 0, 1, 1,
0.8085513, 1.208048, -0.01007435, 0.7803922, 0, 1, 1,
0.8126241, 1.151781, 0.7114292, 0.7882353, 0, 1, 1,
0.8173754, -0.4018376, 2.111454, 0.7921569, 0, 1, 1,
0.8209649, 0.161364, 0.8999583, 0.8, 0, 1, 1,
0.8227359, 0.9307991, 1.121534, 0.8078431, 0, 1, 1,
0.823576, 0.3248526, 1.350926, 0.8117647, 0, 1, 1,
0.831054, 0.3817568, 2.159885, 0.8196079, 0, 1, 1,
0.8323002, 1.730269, 0.1865076, 0.8235294, 0, 1, 1,
0.8417128, -0.3635727, -0.9240921, 0.8313726, 0, 1, 1,
0.8429465, 1.361256, 0.9011953, 0.8352941, 0, 1, 1,
0.8436229, 0.4890997, 2.954335, 0.8431373, 0, 1, 1,
0.8446191, 0.6384414, 0.1882082, 0.8470588, 0, 1, 1,
0.8462244, -0.638496, 2.735512, 0.854902, 0, 1, 1,
0.8550189, 0.6477906, 1.131166, 0.8588235, 0, 1, 1,
0.8595145, 0.2964774, 1.934655, 0.8666667, 0, 1, 1,
0.8597127, -1.772681, 1.773079, 0.8705882, 0, 1, 1,
0.8601732, 1.38275, 1.112807, 0.8784314, 0, 1, 1,
0.863135, 0.8154317, 3.316357, 0.8823529, 0, 1, 1,
0.865606, -0.4401636, 1.388385, 0.8901961, 0, 1, 1,
0.8764108, -1.357071, 3.444378, 0.8941177, 0, 1, 1,
0.8782954, 0.6107807, 0.9992467, 0.9019608, 0, 1, 1,
0.8807872, 0.07264361, 1.910685, 0.9098039, 0, 1, 1,
0.8822066, -0.6723562, 1.552075, 0.9137255, 0, 1, 1,
0.8828245, -0.08381972, 1.851873, 0.9215686, 0, 1, 1,
0.8850417, -0.6738358, 1.916836, 0.9254902, 0, 1, 1,
0.8852845, 2.655338, 0.4080286, 0.9333333, 0, 1, 1,
0.8909476, 0.556072, 0.54453, 0.9372549, 0, 1, 1,
0.8918043, 0.9223939, 2.194097, 0.945098, 0, 1, 1,
0.8940704, 0.2391811, 0.9043947, 0.9490196, 0, 1, 1,
0.894471, 0.6166977, 0.5292172, 0.9568627, 0, 1, 1,
0.8961388, -1.225199, 2.364504, 0.9607843, 0, 1, 1,
0.9013819, -1.359555, 4.270801, 0.9686275, 0, 1, 1,
0.9042553, 0.7754989, -0.5771216, 0.972549, 0, 1, 1,
0.9052239, 2.26711, 0.2246375, 0.9803922, 0, 1, 1,
0.908206, -0.8935468, 1.434001, 0.9843137, 0, 1, 1,
0.9143888, -1.754612, 3.708741, 0.9921569, 0, 1, 1,
0.9148809, 0.962706, 0.442921, 0.9960784, 0, 1, 1,
0.917563, -0.2592944, 1.664354, 1, 0, 0.9960784, 1,
0.9177821, 0.6831079, -0.02785807, 1, 0, 0.9882353, 1,
0.9227973, 1.961184, 1.85505, 1, 0, 0.9843137, 1,
0.9259011, 0.8102756, 1.274371, 1, 0, 0.9764706, 1,
0.9286962, -0.5509486, 1.837541, 1, 0, 0.972549, 1,
0.9364843, 0.3460132, 1.594441, 1, 0, 0.9647059, 1,
0.9364871, -1.090659, 2.609611, 1, 0, 0.9607843, 1,
0.9387252, -0.455377, 2.598498, 1, 0, 0.9529412, 1,
0.9430006, 0.7385262, 1.457636, 1, 0, 0.9490196, 1,
0.9434837, 0.4423909, 2.763333, 1, 0, 0.9411765, 1,
0.9450636, -1.253193, 1.897293, 1, 0, 0.9372549, 1,
0.9453576, -0.8366902, 2.675918, 1, 0, 0.9294118, 1,
0.94731, -0.04021242, 1.520469, 1, 0, 0.9254902, 1,
0.9528767, 1.193757, -0.5452552, 1, 0, 0.9176471, 1,
0.9592429, -0.9792158, 3.21487, 1, 0, 0.9137255, 1,
0.9615169, -1.365722, 2.355732, 1, 0, 0.9058824, 1,
0.9723475, -1.422324, 2.777088, 1, 0, 0.9019608, 1,
0.972763, 0.3271338, 0.985901, 1, 0, 0.8941177, 1,
0.9729097, 0.7225752, 1.285929, 1, 0, 0.8862745, 1,
0.9796967, 0.2308917, -0.6317215, 1, 0, 0.8823529, 1,
0.9860798, 0.9255317, -0.5912885, 1, 0, 0.8745098, 1,
0.9977381, 0.3084974, -0.9886338, 1, 0, 0.8705882, 1,
1.004159, -1.143252, 2.974715, 1, 0, 0.8627451, 1,
1.004509, 0.4602045, 0.03441942, 1, 0, 0.8588235, 1,
1.007504, -0.4835979, 2.401433, 1, 0, 0.8509804, 1,
1.012412, 0.07195766, 0.6918304, 1, 0, 0.8470588, 1,
1.014804, 0.2407657, 1.179319, 1, 0, 0.8392157, 1,
1.018972, -0.2574982, 1.127047, 1, 0, 0.8352941, 1,
1.026804, -1.520197, 1.876375, 1, 0, 0.827451, 1,
1.051566, 0.5913168, 1.420216, 1, 0, 0.8235294, 1,
1.051637, -0.4810242, 3.214942, 1, 0, 0.8156863, 1,
1.054726, -0.3005288, 0.1259497, 1, 0, 0.8117647, 1,
1.056772, 2.503148, -0.08476897, 1, 0, 0.8039216, 1,
1.065152, 0.01387493, 2.641961, 1, 0, 0.7960784, 1,
1.068894, -0.007718895, 1.329056, 1, 0, 0.7921569, 1,
1.076182, 1.476996, -0.5781407, 1, 0, 0.7843137, 1,
1.090052, -0.4663569, 0.1274718, 1, 0, 0.7803922, 1,
1.104879, -0.1233648, 3.918812, 1, 0, 0.772549, 1,
1.106628, 0.7055441, 0.455902, 1, 0, 0.7686275, 1,
1.107941, 0.3913918, 1.415531, 1, 0, 0.7607843, 1,
1.115281, 0.2264727, 2.158215, 1, 0, 0.7568628, 1,
1.120843, 0.7419891, 0.4006604, 1, 0, 0.7490196, 1,
1.136715, 0.5459702, 0.3200309, 1, 0, 0.7450981, 1,
1.143943, -0.1932945, 0.7112047, 1, 0, 0.7372549, 1,
1.148901, 0.5544109, 1.046145, 1, 0, 0.7333333, 1,
1.157628, 0.8353326, 1.755636, 1, 0, 0.7254902, 1,
1.167338, -0.4420153, 3.111455, 1, 0, 0.7215686, 1,
1.173971, 0.08696119, 0.580755, 1, 0, 0.7137255, 1,
1.178566, 0.3310189, 0.428605, 1, 0, 0.7098039, 1,
1.18348, -0.4595613, 0.1034711, 1, 0, 0.7019608, 1,
1.188831, 2.034026, 0.6520494, 1, 0, 0.6941177, 1,
1.19091, 0.383737, 1.58017, 1, 0, 0.6901961, 1,
1.193135, 1.321239, 0.06077098, 1, 0, 0.682353, 1,
1.201291, -0.844226, 1.54011, 1, 0, 0.6784314, 1,
1.206152, 2.408407, 2.318327, 1, 0, 0.6705883, 1,
1.216759, -0.05440141, 3.577818, 1, 0, 0.6666667, 1,
1.220536, 0.5680771, 0.2243816, 1, 0, 0.6588235, 1,
1.220807, 1.073463, -1.529235, 1, 0, 0.654902, 1,
1.22511, 0.7924185, 2.811443, 1, 0, 0.6470588, 1,
1.227561, -1.588206, 2.061623, 1, 0, 0.6431373, 1,
1.24152, -0.6245072, 2.349751, 1, 0, 0.6352941, 1,
1.254594, -0.4599684, 0.7382963, 1, 0, 0.6313726, 1,
1.255099, 0.1370666, 2.11081, 1, 0, 0.6235294, 1,
1.255694, -0.922743, 2.16941, 1, 0, 0.6196079, 1,
1.264782, -1.065024, 2.362409, 1, 0, 0.6117647, 1,
1.272787, -0.5352988, 2.284737, 1, 0, 0.6078432, 1,
1.2752, -0.07421101, 2.389701, 1, 0, 0.6, 1,
1.27843, 0.2706076, 3.295794, 1, 0, 0.5921569, 1,
1.284189, 1.164672, 2.508497, 1, 0, 0.5882353, 1,
1.284366, -0.1089521, 2.011982, 1, 0, 0.5803922, 1,
1.287726, -1.572057, 2.384047, 1, 0, 0.5764706, 1,
1.294026, 1.538067, 0.7295671, 1, 0, 0.5686275, 1,
1.296488, -1.278541, 1.965856, 1, 0, 0.5647059, 1,
1.302804, -0.0235671, 1.742507, 1, 0, 0.5568628, 1,
1.304878, 0.07399504, 0.2444164, 1, 0, 0.5529412, 1,
1.315704, -1.075186, 0.9636075, 1, 0, 0.5450981, 1,
1.328972, -0.05828733, 3.335726, 1, 0, 0.5411765, 1,
1.330596, -0.9473674, 2.017459, 1, 0, 0.5333334, 1,
1.332216, 1.009057, 1.349844, 1, 0, 0.5294118, 1,
1.336776, 1.060527, -0.2431664, 1, 0, 0.5215687, 1,
1.33954, -1.491588, 1.289411, 1, 0, 0.5176471, 1,
1.342497, -1.189363, 3.776532, 1, 0, 0.509804, 1,
1.345091, -1.955274, 2.633526, 1, 0, 0.5058824, 1,
1.354789, 1.536184, 0.6885903, 1, 0, 0.4980392, 1,
1.358573, -0.611346, 1.589931, 1, 0, 0.4901961, 1,
1.361112, -1.602881, 2.666073, 1, 0, 0.4862745, 1,
1.361581, 1.052218, 3.608221, 1, 0, 0.4784314, 1,
1.362332, 2.229435, 0.6576451, 1, 0, 0.4745098, 1,
1.362559, 1.765102, -0.04220539, 1, 0, 0.4666667, 1,
1.380762, -1.099216, 2.679003, 1, 0, 0.4627451, 1,
1.385253, 1.645579, -0.6592486, 1, 0, 0.454902, 1,
1.393854, 1.711183, 2.049192, 1, 0, 0.4509804, 1,
1.399171, 0.2992392, 2.721056, 1, 0, 0.4431373, 1,
1.405473, -0.7641439, 3.033741, 1, 0, 0.4392157, 1,
1.405713, 0.08668891, 1.890298, 1, 0, 0.4313726, 1,
1.410517, 0.7670324, 2.426406, 1, 0, 0.427451, 1,
1.412454, -2.403464, 2.495219, 1, 0, 0.4196078, 1,
1.415019, 0.8133457, -0.3586177, 1, 0, 0.4156863, 1,
1.44556, 1.002329, 0.422164, 1, 0, 0.4078431, 1,
1.464384, 1.580075, 0.5856668, 1, 0, 0.4039216, 1,
1.466397, 0.3593769, 1.195645, 1, 0, 0.3960784, 1,
1.480768, -0.5271984, 1.996437, 1, 0, 0.3882353, 1,
1.490539, -0.5333887, 1.647449, 1, 0, 0.3843137, 1,
1.504583, -0.7133513, 1.688722, 1, 0, 0.3764706, 1,
1.506211, -0.8746408, 4.603579, 1, 0, 0.372549, 1,
1.506984, -1.135465, 1.020446, 1, 0, 0.3647059, 1,
1.518537, -0.5025903, 0.6957422, 1, 0, 0.3607843, 1,
1.52014, 0.3754061, 0.6284782, 1, 0, 0.3529412, 1,
1.533187, -1.785621, 0.4959629, 1, 0, 0.3490196, 1,
1.551193, -0.7146004, 2.283179, 1, 0, 0.3411765, 1,
1.554956, 0.3703884, -0.06509045, 1, 0, 0.3372549, 1,
1.567354, -0.6885068, 1.109031, 1, 0, 0.3294118, 1,
1.578607, -0.5204126, 2.085135, 1, 0, 0.3254902, 1,
1.579612, 1.098384, 0.8256886, 1, 0, 0.3176471, 1,
1.59608, -0.884137, 2.29499, 1, 0, 0.3137255, 1,
1.619246, 0.08273173, 2.599586, 1, 0, 0.3058824, 1,
1.625484, -0.4635227, 1.077684, 1, 0, 0.2980392, 1,
1.625509, -0.07892824, 0.7645072, 1, 0, 0.2941177, 1,
1.641812, -0.6954916, 4.092688, 1, 0, 0.2862745, 1,
1.67236, 0.9438772, 0.07476959, 1, 0, 0.282353, 1,
1.681793, -0.1452688, 3.424056, 1, 0, 0.2745098, 1,
1.692278, 0.5619686, 1.315747, 1, 0, 0.2705882, 1,
1.7702, 0.5439438, 1.239198, 1, 0, 0.2627451, 1,
1.775156, 0.08219007, 0.9975867, 1, 0, 0.2588235, 1,
1.779065, -1.000935, 1.728782, 1, 0, 0.2509804, 1,
1.789258, 1.328258, 1.155294, 1, 0, 0.2470588, 1,
1.792468, -0.8527782, 3.099282, 1, 0, 0.2392157, 1,
1.794318, -1.569991, 1.545645, 1, 0, 0.2352941, 1,
1.808349, 0.7714676, 0.5427461, 1, 0, 0.227451, 1,
1.810261, 0.2308354, 2.386195, 1, 0, 0.2235294, 1,
1.812808, 0.7865748, 1.248826, 1, 0, 0.2156863, 1,
1.830973, -0.8410959, 2.188696, 1, 0, 0.2117647, 1,
1.838374, 0.3272224, 2.986922, 1, 0, 0.2039216, 1,
1.880333, -0.1789846, 3.164701, 1, 0, 0.1960784, 1,
1.88287, -1.855841, 3.16935, 1, 0, 0.1921569, 1,
1.89369, -1.959949, 1.335557, 1, 0, 0.1843137, 1,
1.9044, 0.2477136, 0.5533219, 1, 0, 0.1803922, 1,
1.914036, -1.371458, 2.779598, 1, 0, 0.172549, 1,
1.936191, -2.607373, 3.197961, 1, 0, 0.1686275, 1,
1.981118, -0.3500255, 1.148202, 1, 0, 0.1607843, 1,
1.982322, -0.02505607, 1.741346, 1, 0, 0.1568628, 1,
1.993887, 0.4871214, 1.959069, 1, 0, 0.1490196, 1,
1.999026, 0.4755654, 0.3473079, 1, 0, 0.145098, 1,
2.003597, -0.5912344, 1.035451, 1, 0, 0.1372549, 1,
2.058711, -0.9715362, 3.316291, 1, 0, 0.1333333, 1,
2.059017, 0.4085799, 2.321495, 1, 0, 0.1254902, 1,
2.068262, -0.07084953, 1.531616, 1, 0, 0.1215686, 1,
2.069818, 1.446723, 0.293344, 1, 0, 0.1137255, 1,
2.073355, 0.8475931, 1.504933, 1, 0, 0.1098039, 1,
2.093355, -0.4613887, 2.921701, 1, 0, 0.1019608, 1,
2.113626, 1.301353, 1.136451, 1, 0, 0.09411765, 1,
2.184219, -0.9382494, 1.60622, 1, 0, 0.09019608, 1,
2.202766, -1.151401, 1.936356, 1, 0, 0.08235294, 1,
2.215054, 0.09977654, 0.5368038, 1, 0, 0.07843138, 1,
2.217503, -0.2446196, 2.169616, 1, 0, 0.07058824, 1,
2.238224, -0.1698428, 2.745315, 1, 0, 0.06666667, 1,
2.281588, 1.469779, 1.738599, 1, 0, 0.05882353, 1,
2.294293, 0.4015178, 1.257614, 1, 0, 0.05490196, 1,
2.341664, 0.2051535, 2.089297, 1, 0, 0.04705882, 1,
2.356063, -2.075567, 2.171568, 1, 0, 0.04313726, 1,
2.691756, 0.01429257, 1.185544, 1, 0, 0.03529412, 1,
2.694445, 1.222558, 1.382126, 1, 0, 0.03137255, 1,
2.69586, -0.7846978, 2.310833, 1, 0, 0.02352941, 1,
2.842294, -0.34891, 1.812195, 1, 0, 0.01960784, 1,
2.894367, 0.414324, 1.231035, 1, 0, 0.01176471, 1,
3.423628, 0.5181843, 3.111421, 1, 0, 0.007843138, 1
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
0.297295, -4.08524, -6.989501, 0, -0.5, 0.5, 0.5,
0.297295, -4.08524, -6.989501, 1, -0.5, 0.5, 0.5,
0.297295, -4.08524, -6.989501, 1, 1.5, 0.5, 0.5,
0.297295, -4.08524, -6.989501, 0, 1.5, 0.5, 0.5
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
-3.888865, -0.2264829, -6.989501, 0, -0.5, 0.5, 0.5,
-3.888865, -0.2264829, -6.989501, 1, -0.5, 0.5, 0.5,
-3.888865, -0.2264829, -6.989501, 1, 1.5, 0.5, 0.5,
-3.888865, -0.2264829, -6.989501, 0, 1.5, 0.5, 0.5
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
-3.888865, -4.08524, -0.1807153, 0, -0.5, 0.5, 0.5,
-3.888865, -4.08524, -0.1807153, 1, -0.5, 0.5, 0.5,
-3.888865, -4.08524, -0.1807153, 1, 1.5, 0.5, 0.5,
-3.888865, -4.08524, -0.1807153, 0, 1.5, 0.5, 0.5
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
-2, -3.194758, -5.418243,
3, -3.194758, -5.418243,
-2, -3.194758, -5.418243,
-2, -3.343172, -5.68012,
-1, -3.194758, -5.418243,
-1, -3.343172, -5.68012,
0, -3.194758, -5.418243,
0, -3.343172, -5.68012,
1, -3.194758, -5.418243,
1, -3.343172, -5.68012,
2, -3.194758, -5.418243,
2, -3.343172, -5.68012,
3, -3.194758, -5.418243,
3, -3.343172, -5.68012
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
-2, -3.639999, -6.203872, 0, -0.5, 0.5, 0.5,
-2, -3.639999, -6.203872, 1, -0.5, 0.5, 0.5,
-2, -3.639999, -6.203872, 1, 1.5, 0.5, 0.5,
-2, -3.639999, -6.203872, 0, 1.5, 0.5, 0.5,
-1, -3.639999, -6.203872, 0, -0.5, 0.5, 0.5,
-1, -3.639999, -6.203872, 1, -0.5, 0.5, 0.5,
-1, -3.639999, -6.203872, 1, 1.5, 0.5, 0.5,
-1, -3.639999, -6.203872, 0, 1.5, 0.5, 0.5,
0, -3.639999, -6.203872, 0, -0.5, 0.5, 0.5,
0, -3.639999, -6.203872, 1, -0.5, 0.5, 0.5,
0, -3.639999, -6.203872, 1, 1.5, 0.5, 0.5,
0, -3.639999, -6.203872, 0, 1.5, 0.5, 0.5,
1, -3.639999, -6.203872, 0, -0.5, 0.5, 0.5,
1, -3.639999, -6.203872, 1, -0.5, 0.5, 0.5,
1, -3.639999, -6.203872, 1, 1.5, 0.5, 0.5,
1, -3.639999, -6.203872, 0, 1.5, 0.5, 0.5,
2, -3.639999, -6.203872, 0, -0.5, 0.5, 0.5,
2, -3.639999, -6.203872, 1, -0.5, 0.5, 0.5,
2, -3.639999, -6.203872, 1, 1.5, 0.5, 0.5,
2, -3.639999, -6.203872, 0, 1.5, 0.5, 0.5,
3, -3.639999, -6.203872, 0, -0.5, 0.5, 0.5,
3, -3.639999, -6.203872, 1, -0.5, 0.5, 0.5,
3, -3.639999, -6.203872, 1, 1.5, 0.5, 0.5,
3, -3.639999, -6.203872, 0, 1.5, 0.5, 0.5
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
-2.922828, -3, -5.418243,
-2.922828, 2, -5.418243,
-2.922828, -3, -5.418243,
-3.083834, -3, -5.68012,
-2.922828, -2, -5.418243,
-3.083834, -2, -5.68012,
-2.922828, -1, -5.418243,
-3.083834, -1, -5.68012,
-2.922828, 0, -5.418243,
-3.083834, 0, -5.68012,
-2.922828, 1, -5.418243,
-3.083834, 1, -5.68012,
-2.922828, 2, -5.418243,
-3.083834, 2, -5.68012
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
-3.405846, -3, -6.203872, 0, -0.5, 0.5, 0.5,
-3.405846, -3, -6.203872, 1, -0.5, 0.5, 0.5,
-3.405846, -3, -6.203872, 1, 1.5, 0.5, 0.5,
-3.405846, -3, -6.203872, 0, 1.5, 0.5, 0.5,
-3.405846, -2, -6.203872, 0, -0.5, 0.5, 0.5,
-3.405846, -2, -6.203872, 1, -0.5, 0.5, 0.5,
-3.405846, -2, -6.203872, 1, 1.5, 0.5, 0.5,
-3.405846, -2, -6.203872, 0, 1.5, 0.5, 0.5,
-3.405846, -1, -6.203872, 0, -0.5, 0.5, 0.5,
-3.405846, -1, -6.203872, 1, -0.5, 0.5, 0.5,
-3.405846, -1, -6.203872, 1, 1.5, 0.5, 0.5,
-3.405846, -1, -6.203872, 0, 1.5, 0.5, 0.5,
-3.405846, 0, -6.203872, 0, -0.5, 0.5, 0.5,
-3.405846, 0, -6.203872, 1, -0.5, 0.5, 0.5,
-3.405846, 0, -6.203872, 1, 1.5, 0.5, 0.5,
-3.405846, 0, -6.203872, 0, 1.5, 0.5, 0.5,
-3.405846, 1, -6.203872, 0, -0.5, 0.5, 0.5,
-3.405846, 1, -6.203872, 1, -0.5, 0.5, 0.5,
-3.405846, 1, -6.203872, 1, 1.5, 0.5, 0.5,
-3.405846, 1, -6.203872, 0, 1.5, 0.5, 0.5,
-3.405846, 2, -6.203872, 0, -0.5, 0.5, 0.5,
-3.405846, 2, -6.203872, 1, -0.5, 0.5, 0.5,
-3.405846, 2, -6.203872, 1, 1.5, 0.5, 0.5,
-3.405846, 2, -6.203872, 0, 1.5, 0.5, 0.5
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
-2.922828, -3.194758, -4,
-2.922828, -3.194758, 4,
-2.922828, -3.194758, -4,
-3.083834, -3.343172, -4,
-2.922828, -3.194758, -2,
-3.083834, -3.343172, -2,
-2.922828, -3.194758, 0,
-3.083834, -3.343172, 0,
-2.922828, -3.194758, 2,
-3.083834, -3.343172, 2,
-2.922828, -3.194758, 4,
-3.083834, -3.343172, 4
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
-3.405846, -3.639999, -4, 0, -0.5, 0.5, 0.5,
-3.405846, -3.639999, -4, 1, -0.5, 0.5, 0.5,
-3.405846, -3.639999, -4, 1, 1.5, 0.5, 0.5,
-3.405846, -3.639999, -4, 0, 1.5, 0.5, 0.5,
-3.405846, -3.639999, -2, 0, -0.5, 0.5, 0.5,
-3.405846, -3.639999, -2, 1, -0.5, 0.5, 0.5,
-3.405846, -3.639999, -2, 1, 1.5, 0.5, 0.5,
-3.405846, -3.639999, -2, 0, 1.5, 0.5, 0.5,
-3.405846, -3.639999, 0, 0, -0.5, 0.5, 0.5,
-3.405846, -3.639999, 0, 1, -0.5, 0.5, 0.5,
-3.405846, -3.639999, 0, 1, 1.5, 0.5, 0.5,
-3.405846, -3.639999, 0, 0, 1.5, 0.5, 0.5,
-3.405846, -3.639999, 2, 0, -0.5, 0.5, 0.5,
-3.405846, -3.639999, 2, 1, -0.5, 0.5, 0.5,
-3.405846, -3.639999, 2, 1, 1.5, 0.5, 0.5,
-3.405846, -3.639999, 2, 0, 1.5, 0.5, 0.5,
-3.405846, -3.639999, 4, 0, -0.5, 0.5, 0.5,
-3.405846, -3.639999, 4, 1, -0.5, 0.5, 0.5,
-3.405846, -3.639999, 4, 1, 1.5, 0.5, 0.5,
-3.405846, -3.639999, 4, 0, 1.5, 0.5, 0.5
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
-2.922828, -3.194758, -5.418243,
-2.922828, 2.741792, -5.418243,
-2.922828, -3.194758, 5.056812,
-2.922828, 2.741792, 5.056812,
-2.922828, -3.194758, -5.418243,
-2.922828, -3.194758, 5.056812,
-2.922828, 2.741792, -5.418243,
-2.922828, 2.741792, 5.056812,
-2.922828, -3.194758, -5.418243,
3.517418, -3.194758, -5.418243,
-2.922828, -3.194758, 5.056812,
3.517418, -3.194758, 5.056812,
-2.922828, 2.741792, -5.418243,
3.517418, 2.741792, -5.418243,
-2.922828, 2.741792, 5.056812,
3.517418, 2.741792, 5.056812,
3.517418, -3.194758, -5.418243,
3.517418, 2.741792, -5.418243,
3.517418, -3.194758, 5.056812,
3.517418, 2.741792, 5.056812,
3.517418, -3.194758, -5.418243,
3.517418, -3.194758, 5.056812,
3.517418, 2.741792, -5.418243,
3.517418, 2.741792, 5.056812
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
var radius = 7.291254;
var distance = 32.43961;
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
mvMatrix.translate( -0.297295, 0.2264829, 0.1807153 );
mvMatrix.scale( 1.224091, 1.327951, 0.7525923 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.43961);
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


