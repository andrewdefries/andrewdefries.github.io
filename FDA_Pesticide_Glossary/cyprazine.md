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
-2.812451, -0.7521835, -0.05076685, 1, 0, 0, 1,
-2.804157, 0.4208083, -0.7995458, 1, 0.007843138, 0, 1,
-2.607349, -0.4958918, -4.071495, 1, 0.01176471, 0, 1,
-2.57652, 0.3996753, -0.7288147, 1, 0.01960784, 0, 1,
-2.501715, -0.04910499, -1.296631, 1, 0.02352941, 0, 1,
-2.499542, 0.59433, -0.5739783, 1, 0.03137255, 0, 1,
-2.484219, -1.139241, -1.511124, 1, 0.03529412, 0, 1,
-2.480374, -0.1447689, -0.6826792, 1, 0.04313726, 0, 1,
-2.474168, 0.7340083, -2.337934, 1, 0.04705882, 0, 1,
-2.472589, 1.216687, 0.02248045, 1, 0.05490196, 0, 1,
-2.453332, 0.1332018, -2.178991, 1, 0.05882353, 0, 1,
-2.439542, 0.2787413, -0.6592482, 1, 0.06666667, 0, 1,
-2.415888, 1.009741, -1.241032, 1, 0.07058824, 0, 1,
-2.414835, 1.389453, -2.047635, 1, 0.07843138, 0, 1,
-2.382528, 1.121265, -2.530839, 1, 0.08235294, 0, 1,
-2.381799, 1.186786, -0.9943332, 1, 0.09019608, 0, 1,
-2.36984, -0.3458348, -2.36359, 1, 0.09411765, 0, 1,
-2.336678, -0.7299499, -2.840883, 1, 0.1019608, 0, 1,
-2.316723, 0.8264225, 0.2726043, 1, 0.1098039, 0, 1,
-2.290474, 1.134132, -0.6992745, 1, 0.1137255, 0, 1,
-2.287959, 0.1652652, -2.843539, 1, 0.1215686, 0, 1,
-2.248942, 0.9239905, 0.01594907, 1, 0.1254902, 0, 1,
-2.227704, -0.0001950636, -1.090266, 1, 0.1333333, 0, 1,
-2.201303, -2.261553, -3.951255, 1, 0.1372549, 0, 1,
-2.139997, -0.7008284, -0.312825, 1, 0.145098, 0, 1,
-2.046023, -0.3613581, -1.938825, 1, 0.1490196, 0, 1,
-2.044121, -0.05062772, -0.9656872, 1, 0.1568628, 0, 1,
-1.997093, 1.447378, 0.1250504, 1, 0.1607843, 0, 1,
-1.992336, 0.8676351, -0.3700847, 1, 0.1686275, 0, 1,
-1.955575, -0.7825717, -3.718092, 1, 0.172549, 0, 1,
-1.952633, -0.3581491, -0.4067594, 1, 0.1803922, 0, 1,
-1.938403, 1.06077, -3.169674, 1, 0.1843137, 0, 1,
-1.92314, 3.906783, 0.7991697, 1, 0.1921569, 0, 1,
-1.891168, 0.5772504, -0.5290174, 1, 0.1960784, 0, 1,
-1.859958, 0.2214211, -1.553129, 1, 0.2039216, 0, 1,
-1.857228, 0.6551124, -2.678754, 1, 0.2117647, 0, 1,
-1.834899, 0.1120783, 0.03254107, 1, 0.2156863, 0, 1,
-1.832294, -0.0342037, -1.859545, 1, 0.2235294, 0, 1,
-1.805076, 1.276262, -0.08966894, 1, 0.227451, 0, 1,
-1.801196, -1.124175, -2.398616, 1, 0.2352941, 0, 1,
-1.800067, -0.5147145, -1.148765, 1, 0.2392157, 0, 1,
-1.786769, -0.1222918, -0.7261683, 1, 0.2470588, 0, 1,
-1.779823, 0.5420029, -0.9115197, 1, 0.2509804, 0, 1,
-1.763128, -0.009501646, -1.568019, 1, 0.2588235, 0, 1,
-1.756281, 1.117488, -0.7425432, 1, 0.2627451, 0, 1,
-1.740561, 1.084333, -0.951255, 1, 0.2705882, 0, 1,
-1.71923, -0.02734565, -3.070375, 1, 0.2745098, 0, 1,
-1.704573, -0.8899444, -2.447738, 1, 0.282353, 0, 1,
-1.693658, -0.8651497, -2.766437, 1, 0.2862745, 0, 1,
-1.693639, 0.2748935, 1.406616, 1, 0.2941177, 0, 1,
-1.686939, -0.8529658, -5.375829, 1, 0.3019608, 0, 1,
-1.671212, -1.402432, -1.652122, 1, 0.3058824, 0, 1,
-1.667051, -0.3312118, -1.01476, 1, 0.3137255, 0, 1,
-1.663295, -1.42348, -3.406766, 1, 0.3176471, 0, 1,
-1.662256, 1.402037, -0.7350379, 1, 0.3254902, 0, 1,
-1.621639, 0.3378952, -1.047545, 1, 0.3294118, 0, 1,
-1.613009, -0.9482654, -1.801064, 1, 0.3372549, 0, 1,
-1.60058, -0.5758737, -3.365599, 1, 0.3411765, 0, 1,
-1.591842, 0.7573714, -1.23604, 1, 0.3490196, 0, 1,
-1.58594, 0.5947466, 0.2176112, 1, 0.3529412, 0, 1,
-1.58007, 0.0259175, -1.550612, 1, 0.3607843, 0, 1,
-1.557941, -0.8158649, -1.865513, 1, 0.3647059, 0, 1,
-1.545842, -1.249023, -2.123427, 1, 0.372549, 0, 1,
-1.528481, 1.147587, -2.057761, 1, 0.3764706, 0, 1,
-1.516262, -2.011955, -3.18289, 1, 0.3843137, 0, 1,
-1.511577, -0.8321241, -1.254369, 1, 0.3882353, 0, 1,
-1.506279, 0.9693754, -1.351231, 1, 0.3960784, 0, 1,
-1.497638, 0.7213492, -0.002316337, 1, 0.4039216, 0, 1,
-1.49029, 1.101418, -1.513475, 1, 0.4078431, 0, 1,
-1.487216, -0.6087813, -1.56997, 1, 0.4156863, 0, 1,
-1.486782, -0.724582, -1.700614, 1, 0.4196078, 0, 1,
-1.481431, -0.535238, -2.852225, 1, 0.427451, 0, 1,
-1.470203, 0.6268123, -2.027743, 1, 0.4313726, 0, 1,
-1.465389, 0.1395106, -1.843546, 1, 0.4392157, 0, 1,
-1.44979, -0.07585826, 0.2018301, 1, 0.4431373, 0, 1,
-1.439773, -0.7491884, -1.4835, 1, 0.4509804, 0, 1,
-1.439049, 1.248369, 0.6193354, 1, 0.454902, 0, 1,
-1.438274, -1.223035, -2.118518, 1, 0.4627451, 0, 1,
-1.420865, 0.3442462, -2.5651, 1, 0.4666667, 0, 1,
-1.413304, -0.002277157, -1.189666, 1, 0.4745098, 0, 1,
-1.408915, -0.04062536, 0.6478895, 1, 0.4784314, 0, 1,
-1.391536, 0.5541744, -2.333543, 1, 0.4862745, 0, 1,
-1.379669, 1.230259, -0.1367116, 1, 0.4901961, 0, 1,
-1.37469, 0.3323938, -1.421482, 1, 0.4980392, 0, 1,
-1.355611, -0.9086402, -2.618363, 1, 0.5058824, 0, 1,
-1.350201, -0.8982072, -3.467714, 1, 0.509804, 0, 1,
-1.344107, -0.6129788, -3.230513, 1, 0.5176471, 0, 1,
-1.332503, -1.079984, -2.67827, 1, 0.5215687, 0, 1,
-1.332242, -0.6289416, -1.519435, 1, 0.5294118, 0, 1,
-1.323466, 1.538575, 0.8813863, 1, 0.5333334, 0, 1,
-1.309807, 0.1837873, -1.784642, 1, 0.5411765, 0, 1,
-1.306798, 1.154739, -1.312464, 1, 0.5450981, 0, 1,
-1.303312, 0.1109414, -2.728903, 1, 0.5529412, 0, 1,
-1.30026, 1.130528, -0.9414253, 1, 0.5568628, 0, 1,
-1.292665, 0.402083, -0.9777752, 1, 0.5647059, 0, 1,
-1.288387, -0.3602784, -1.506955, 1, 0.5686275, 0, 1,
-1.277694, -0.4717921, -3.253525, 1, 0.5764706, 0, 1,
-1.275152, -0.2451556, -1.201158, 1, 0.5803922, 0, 1,
-1.263345, -0.1632196, -2.339704, 1, 0.5882353, 0, 1,
-1.255484, 0.2574435, -0.9123871, 1, 0.5921569, 0, 1,
-1.243695, -0.01486564, -0.4867123, 1, 0.6, 0, 1,
-1.232416, -1.41914, -4.25037, 1, 0.6078432, 0, 1,
-1.226527, -0.5561616, -2.724098, 1, 0.6117647, 0, 1,
-1.222423, 0.8830373, -0.417461, 1, 0.6196079, 0, 1,
-1.216027, -0.507339, 0.1507476, 1, 0.6235294, 0, 1,
-1.215054, -0.8664104, -4.354555, 1, 0.6313726, 0, 1,
-1.213891, 1.367981, 1.044167, 1, 0.6352941, 0, 1,
-1.199136, -1.204506, -2.092898, 1, 0.6431373, 0, 1,
-1.197552, -0.2763825, -1.51311, 1, 0.6470588, 0, 1,
-1.193137, 1.084767, -1.47767, 1, 0.654902, 0, 1,
-1.190313, -0.7292678, -1.132568, 1, 0.6588235, 0, 1,
-1.184468, -0.3968418, -1.643326, 1, 0.6666667, 0, 1,
-1.16871, 0.9887532, -0.7626252, 1, 0.6705883, 0, 1,
-1.167618, -0.2446907, -1.578187, 1, 0.6784314, 0, 1,
-1.162038, 0.6430378, -0.4707359, 1, 0.682353, 0, 1,
-1.159568, -0.5080458, -2.285419, 1, 0.6901961, 0, 1,
-1.155755, -0.4703454, -1.853505, 1, 0.6941177, 0, 1,
-1.147781, -0.1098952, -1.259195, 1, 0.7019608, 0, 1,
-1.14668, -0.5504636, -3.419999, 1, 0.7098039, 0, 1,
-1.145275, -1.824041, -3.797419, 1, 0.7137255, 0, 1,
-1.139497, -1.74856, -3.719981, 1, 0.7215686, 0, 1,
-1.138411, -0.7435293, -1.174219, 1, 0.7254902, 0, 1,
-1.129732, -0.3990722, 0.2470555, 1, 0.7333333, 0, 1,
-1.128336, 0.4622198, -0.2321714, 1, 0.7372549, 0, 1,
-1.121838, -0.5280452, -1.993512, 1, 0.7450981, 0, 1,
-1.120456, -0.9822562, -1.688337, 1, 0.7490196, 0, 1,
-1.120278, -0.1048108, -1.534664, 1, 0.7568628, 0, 1,
-1.11574, 0.5072163, -1.353838, 1, 0.7607843, 0, 1,
-1.102952, 0.4449826, -1.558293, 1, 0.7686275, 0, 1,
-1.097611, 1.538403, 0.2915872, 1, 0.772549, 0, 1,
-1.080968, 1.681776, -1.064981, 1, 0.7803922, 0, 1,
-1.076538, -0.06249658, -0.1813963, 1, 0.7843137, 0, 1,
-1.064877, -0.9039017, -0.8808807, 1, 0.7921569, 0, 1,
-1.062933, -1.281881, -4.260869, 1, 0.7960784, 0, 1,
-1.062223, 0.4329099, -0.4978078, 1, 0.8039216, 0, 1,
-1.059743, -0.8667095, -3.042912, 1, 0.8117647, 0, 1,
-1.056882, -0.1337097, -1.092063, 1, 0.8156863, 0, 1,
-1.04975, -0.6142625, -2.298919, 1, 0.8235294, 0, 1,
-1.040196, -0.3281465, -1.804075, 1, 0.827451, 0, 1,
-1.032435, -1.276189, -1.139119, 1, 0.8352941, 0, 1,
-1.032402, -0.3490722, -1.769881, 1, 0.8392157, 0, 1,
-1.031948, 2.917097, -0.6252321, 1, 0.8470588, 0, 1,
-1.026544, 0.7147231, -1.317834, 1, 0.8509804, 0, 1,
-1.025662, -1.20197, -3.555156, 1, 0.8588235, 0, 1,
-1.012658, 0.004870509, 0.07437064, 1, 0.8627451, 0, 1,
-1.006751, -0.1838656, -1.050282, 1, 0.8705882, 0, 1,
-1.006633, 0.8999625, -2.072457, 1, 0.8745098, 0, 1,
-1.005884, -0.3548188, -0.4099146, 1, 0.8823529, 0, 1,
-0.992658, 0.242981, -2.557528, 1, 0.8862745, 0, 1,
-0.9923879, 0.2677306, -1.290365, 1, 0.8941177, 0, 1,
-0.9872864, -1.717612, -0.1639326, 1, 0.8980392, 0, 1,
-0.979438, -1.090712, -1.120018, 1, 0.9058824, 0, 1,
-0.9746557, -0.2595255, -2.113291, 1, 0.9137255, 0, 1,
-0.9734198, -0.4697888, -2.458037, 1, 0.9176471, 0, 1,
-0.9697994, 0.3717395, -1.122222, 1, 0.9254902, 0, 1,
-0.9693851, 0.8310086, -0.518335, 1, 0.9294118, 0, 1,
-0.9602076, 1.297203, -0.4544228, 1, 0.9372549, 0, 1,
-0.9600852, 0.2196017, -0.1167293, 1, 0.9411765, 0, 1,
-0.9580578, 1.467364, -0.7951047, 1, 0.9490196, 0, 1,
-0.9549948, 0.5831953, -1.384534, 1, 0.9529412, 0, 1,
-0.9452966, 1.101508, -1.902845, 1, 0.9607843, 0, 1,
-0.9439538, -0.7247059, -3.236912, 1, 0.9647059, 0, 1,
-0.941172, 0.4734333, 0.01696194, 1, 0.972549, 0, 1,
-0.9387808, -0.7799069, -1.530283, 1, 0.9764706, 0, 1,
-0.9381194, 0.4638476, -0.9558234, 1, 0.9843137, 0, 1,
-0.9364502, 1.224369, -1.78688, 1, 0.9882353, 0, 1,
-0.9340426, 0.02590783, -1.701358, 1, 0.9960784, 0, 1,
-0.9335888, -1.510065, -2.990717, 0.9960784, 1, 0, 1,
-0.9302264, 0.372673, -1.444515, 0.9921569, 1, 0, 1,
-0.9273126, -0.004135747, -0.01719731, 0.9843137, 1, 0, 1,
-0.9234513, 0.06963508, -0.9775792, 0.9803922, 1, 0, 1,
-0.9196938, 0.5845694, -0.8403106, 0.972549, 1, 0, 1,
-0.9195119, -0.429398, -0.697478, 0.9686275, 1, 0, 1,
-0.9141904, -0.07504104, -1.874573, 0.9607843, 1, 0, 1,
-0.9025106, -1.08518, -2.060808, 0.9568627, 1, 0, 1,
-0.8980922, 0.2500216, 0.4004139, 0.9490196, 1, 0, 1,
-0.8907673, -0.5502653, -4.8922, 0.945098, 1, 0, 1,
-0.8863012, -1.357472, -0.4850973, 0.9372549, 1, 0, 1,
-0.8839467, -0.5658898, -1.976389, 0.9333333, 1, 0, 1,
-0.8835407, -0.8444062, -2.143922, 0.9254902, 1, 0, 1,
-0.8805949, 0.9985805, -0.5476152, 0.9215686, 1, 0, 1,
-0.8774627, 1.379019, -1.36789, 0.9137255, 1, 0, 1,
-0.8770288, -0.6541221, -2.878352, 0.9098039, 1, 0, 1,
-0.8737786, -0.3718316, -1.030778, 0.9019608, 1, 0, 1,
-0.8727993, -0.4673623, -2.809417, 0.8941177, 1, 0, 1,
-0.8673024, -0.5715818, -1.94603, 0.8901961, 1, 0, 1,
-0.8635498, 0.4496794, -0.3032641, 0.8823529, 1, 0, 1,
-0.861524, -1.076554, -1.996488, 0.8784314, 1, 0, 1,
-0.8544358, 0.799755, -1.69178, 0.8705882, 1, 0, 1,
-0.8525919, 1.386261, -1.729766, 0.8666667, 1, 0, 1,
-0.8474713, 1.596456, -0.3896142, 0.8588235, 1, 0, 1,
-0.8416595, -1.104473, -2.056234, 0.854902, 1, 0, 1,
-0.8408533, 0.2368203, -2.177644, 0.8470588, 1, 0, 1,
-0.8406466, 1.120975, 0.7982677, 0.8431373, 1, 0, 1,
-0.8357484, 1.158581, -0.9476355, 0.8352941, 1, 0, 1,
-0.8346224, -1.412918, -3.174484, 0.8313726, 1, 0, 1,
-0.824992, 2.299133, -0.7346591, 0.8235294, 1, 0, 1,
-0.8227708, -0.8634333, -2.348317, 0.8196079, 1, 0, 1,
-0.8178848, -0.377692, -3.966763, 0.8117647, 1, 0, 1,
-0.8116239, 0.06006498, -2.574299, 0.8078431, 1, 0, 1,
-0.8109695, 0.5388427, -1.85217, 0.8, 1, 0, 1,
-0.805579, 0.05941443, -0.6210094, 0.7921569, 1, 0, 1,
-0.7982493, 0.4608631, -1.539313, 0.7882353, 1, 0, 1,
-0.7958106, -0.1716175, -2.492085, 0.7803922, 1, 0, 1,
-0.7932822, 0.09360697, 0.469966, 0.7764706, 1, 0, 1,
-0.7890668, 0.5596478, 0.2174584, 0.7686275, 1, 0, 1,
-0.7890178, -0.8469611, -2.160244, 0.7647059, 1, 0, 1,
-0.7889362, -1.339577, -0.9168063, 0.7568628, 1, 0, 1,
-0.7850392, -1.421759, -2.950934, 0.7529412, 1, 0, 1,
-0.7826197, 0.6723319, -0.2981713, 0.7450981, 1, 0, 1,
-0.7798876, 0.3536712, -1.445796, 0.7411765, 1, 0, 1,
-0.7793826, -1.217704, -0.7090825, 0.7333333, 1, 0, 1,
-0.7757362, 0.3745066, 2.25274, 0.7294118, 1, 0, 1,
-0.7718533, -0.5995567, -3.055751, 0.7215686, 1, 0, 1,
-0.7677664, 0.874236, 0.1424388, 0.7176471, 1, 0, 1,
-0.7599539, 0.2393847, -1.022131, 0.7098039, 1, 0, 1,
-0.7596255, -0.2082056, -1.521102, 0.7058824, 1, 0, 1,
-0.7593013, -1.192659, -2.620229, 0.6980392, 1, 0, 1,
-0.755596, -0.9643848, -2.138733, 0.6901961, 1, 0, 1,
-0.7488192, -0.8540458, -1.847332, 0.6862745, 1, 0, 1,
-0.7469611, -0.5748494, -2.027159, 0.6784314, 1, 0, 1,
-0.7463148, 0.571531, -1.34137, 0.6745098, 1, 0, 1,
-0.7436054, -0.7607202, -2.463895, 0.6666667, 1, 0, 1,
-0.7367559, -0.7292854, -4.495826, 0.6627451, 1, 0, 1,
-0.7358246, 1.300388, -0.03691599, 0.654902, 1, 0, 1,
-0.7348289, -1.147942, -2.869632, 0.6509804, 1, 0, 1,
-0.7322662, 0.2191895, -0.836365, 0.6431373, 1, 0, 1,
-0.7318723, -1.117398, -3.074616, 0.6392157, 1, 0, 1,
-0.7271172, 1.963981, -0.3856487, 0.6313726, 1, 0, 1,
-0.7183648, 0.03851907, -1.821763, 0.627451, 1, 0, 1,
-0.7135859, 0.1731097, -1.039647, 0.6196079, 1, 0, 1,
-0.7128637, 1.264892, -0.2882153, 0.6156863, 1, 0, 1,
-0.7100713, -1.853855, -1.949681, 0.6078432, 1, 0, 1,
-0.7071174, 0.1414007, -2.68479, 0.6039216, 1, 0, 1,
-0.7043483, -0.4448189, -3.808163, 0.5960785, 1, 0, 1,
-0.7031049, 0.3131313, -1.025443, 0.5882353, 1, 0, 1,
-0.7012797, 0.6560798, -0.184841, 0.5843138, 1, 0, 1,
-0.6964853, -0.01351907, -0.6029667, 0.5764706, 1, 0, 1,
-0.6935173, -1.758871, -3.854142, 0.572549, 1, 0, 1,
-0.68907, 1.907189, 0.5856181, 0.5647059, 1, 0, 1,
-0.6879606, 0.8161853, -0.9577407, 0.5607843, 1, 0, 1,
-0.687013, 0.3401012, 0.7358747, 0.5529412, 1, 0, 1,
-0.6838762, -0.2894855, -2.255776, 0.5490196, 1, 0, 1,
-0.6822747, 0.8426259, 0.07516958, 0.5411765, 1, 0, 1,
-0.6816089, 0.6502781, -3.19479, 0.5372549, 1, 0, 1,
-0.6761984, -0.2108001, -2.6305, 0.5294118, 1, 0, 1,
-0.675265, 0.2621005, -2.380463, 0.5254902, 1, 0, 1,
-0.6646928, 1.021991, 0.6105711, 0.5176471, 1, 0, 1,
-0.6606252, 0.1199404, -0.3520407, 0.5137255, 1, 0, 1,
-0.6589892, -0.3645768, -0.9373408, 0.5058824, 1, 0, 1,
-0.6543854, -1.336706, -1.741636, 0.5019608, 1, 0, 1,
-0.6499848, 0.1877205, -3.705037, 0.4941176, 1, 0, 1,
-0.6496254, -0.9106535, -3.403822, 0.4862745, 1, 0, 1,
-0.6490526, -0.4124348, -1.886814, 0.4823529, 1, 0, 1,
-0.646653, 0.06329628, -1.857356, 0.4745098, 1, 0, 1,
-0.6442345, -0.02901827, -1.562816, 0.4705882, 1, 0, 1,
-0.6432533, 0.3492048, -1.418677, 0.4627451, 1, 0, 1,
-0.6430622, 1.208653, -0.4415195, 0.4588235, 1, 0, 1,
-0.6384711, -2.290258, -1.257646, 0.4509804, 1, 0, 1,
-0.6379979, 1.239269, -0.6125485, 0.4470588, 1, 0, 1,
-0.6376967, 0.654163, -0.5678648, 0.4392157, 1, 0, 1,
-0.6362891, -0.7258947, -3.15353, 0.4352941, 1, 0, 1,
-0.6338863, 0.2518879, -1.886702, 0.427451, 1, 0, 1,
-0.6310748, -2.236768, -2.514261, 0.4235294, 1, 0, 1,
-0.6294597, -0.1449313, -0.8520215, 0.4156863, 1, 0, 1,
-0.6292035, -0.4018198, -2.399819, 0.4117647, 1, 0, 1,
-0.6233928, 1.881539, 0.7834771, 0.4039216, 1, 0, 1,
-0.6186819, 0.2515033, -1.455754, 0.3960784, 1, 0, 1,
-0.6102852, 0.4681944, -0.5071163, 0.3921569, 1, 0, 1,
-0.6061161, -0.6791446, -0.9345857, 0.3843137, 1, 0, 1,
-0.5979174, -0.1718553, -1.086739, 0.3803922, 1, 0, 1,
-0.5975983, -0.7491586, -2.42332, 0.372549, 1, 0, 1,
-0.5975443, 0.146404, 0.4668706, 0.3686275, 1, 0, 1,
-0.5960607, -0.3855409, 0.6747963, 0.3607843, 1, 0, 1,
-0.595592, -0.8102272, -3.502519, 0.3568628, 1, 0, 1,
-0.5935652, 1.73907, -1.099521, 0.3490196, 1, 0, 1,
-0.5914408, -0.6392227, -3.035121, 0.345098, 1, 0, 1,
-0.5885349, 1.026837, -0.9865152, 0.3372549, 1, 0, 1,
-0.5876697, -0.07370209, -3.312496, 0.3333333, 1, 0, 1,
-0.5868256, -0.399356, -1.895338, 0.3254902, 1, 0, 1,
-0.5857575, -0.3922274, 0.02514972, 0.3215686, 1, 0, 1,
-0.5846531, 0.2698295, -0.05659653, 0.3137255, 1, 0, 1,
-0.5831754, -0.8096825, -3.865422, 0.3098039, 1, 0, 1,
-0.5782582, 0.5787617, 0.1958992, 0.3019608, 1, 0, 1,
-0.5732926, -0.03982388, -1.553519, 0.2941177, 1, 0, 1,
-0.5728689, 0.4494562, 0.2265803, 0.2901961, 1, 0, 1,
-0.5721151, 1.599531, -0.6002393, 0.282353, 1, 0, 1,
-0.5711229, 2.216403, 0.2514297, 0.2784314, 1, 0, 1,
-0.5689791, 0.4635613, -1.163126, 0.2705882, 1, 0, 1,
-0.5685499, 0.901462, -0.1172107, 0.2666667, 1, 0, 1,
-0.5684239, 0.144597, 0.1268106, 0.2588235, 1, 0, 1,
-0.5663397, 1.393238, 0.7050817, 0.254902, 1, 0, 1,
-0.563108, -0.1758813, -0.05497041, 0.2470588, 1, 0, 1,
-0.5612268, 0.989126, -0.9039733, 0.2431373, 1, 0, 1,
-0.5603467, -1.734111, -0.5875655, 0.2352941, 1, 0, 1,
-0.5591351, 0.9839471, -0.6015338, 0.2313726, 1, 0, 1,
-0.557905, -1.644204, -2.991246, 0.2235294, 1, 0, 1,
-0.5577036, 0.02219028, -3.66968, 0.2196078, 1, 0, 1,
-0.5564694, 0.5713331, -0.4712907, 0.2117647, 1, 0, 1,
-0.555377, 0.5360948, -0.431605, 0.2078431, 1, 0, 1,
-0.5541096, -1.141136, -3.053367, 0.2, 1, 0, 1,
-0.5476657, 2.349594, -0.7931497, 0.1921569, 1, 0, 1,
-0.545948, 1.12898, 1.282495, 0.1882353, 1, 0, 1,
-0.5449808, -1.919243, -4.838595, 0.1803922, 1, 0, 1,
-0.5428541, -1.900024, -2.469151, 0.1764706, 1, 0, 1,
-0.5401119, 0.6196483, 0.3619438, 0.1686275, 1, 0, 1,
-0.5397096, 1.371502, -1.32203, 0.1647059, 1, 0, 1,
-0.5393451, 0.3056832, -1.079438, 0.1568628, 1, 0, 1,
-0.5324945, -0.8020535, -3.738651, 0.1529412, 1, 0, 1,
-0.5263343, 0.426481, -0.1428798, 0.145098, 1, 0, 1,
-0.5191491, -0.4932187, -2.629414, 0.1411765, 1, 0, 1,
-0.5183474, 1.35463, 0.3504308, 0.1333333, 1, 0, 1,
-0.5153577, -0.6382581, -1.028219, 0.1294118, 1, 0, 1,
-0.5135698, -1.622108, -1.442978, 0.1215686, 1, 0, 1,
-0.5128862, 0.1612972, -1.094253, 0.1176471, 1, 0, 1,
-0.5054291, -0.6321877, -1.162642, 0.1098039, 1, 0, 1,
-0.5039263, -0.321557, -3.031043, 0.1058824, 1, 0, 1,
-0.5023583, 0.1160024, -2.662201, 0.09803922, 1, 0, 1,
-0.5014204, -1.358486, -3.159492, 0.09019608, 1, 0, 1,
-0.500607, -1.016504, -2.742068, 0.08627451, 1, 0, 1,
-0.4978276, -0.0936663, -2.110521, 0.07843138, 1, 0, 1,
-0.4943224, 0.2051278, -2.721553, 0.07450981, 1, 0, 1,
-0.4922553, -1.316619, -3.462131, 0.06666667, 1, 0, 1,
-0.4912773, 0.1114837, -0.2525021, 0.0627451, 1, 0, 1,
-0.4856867, -0.4368433, -2.161923, 0.05490196, 1, 0, 1,
-0.480706, -2.314382, -1.062927, 0.05098039, 1, 0, 1,
-0.4803207, -0.6766965, -2.84058, 0.04313726, 1, 0, 1,
-0.4801646, 0.2510903, 0.09214881, 0.03921569, 1, 0, 1,
-0.4730799, 0.006336438, -2.369333, 0.03137255, 1, 0, 1,
-0.4721824, 1.076673, -1.499024, 0.02745098, 1, 0, 1,
-0.4689507, 1.162666, -0.2255183, 0.01960784, 1, 0, 1,
-0.4673808, -0.6365622, -0.8359303, 0.01568628, 1, 0, 1,
-0.4637854, -2.650673, -3.580024, 0.007843138, 1, 0, 1,
-0.4626348, 0.08219539, -0.6176506, 0.003921569, 1, 0, 1,
-0.4618763, -0.3829379, -2.465249, 0, 1, 0.003921569, 1,
-0.4607572, -0.4473117, -2.072958, 0, 1, 0.01176471, 1,
-0.4591864, -0.7553989, -1.961667, 0, 1, 0.01568628, 1,
-0.4569068, -0.6455286, -2.722599, 0, 1, 0.02352941, 1,
-0.4555104, 0.2014643, -1.042477, 0, 1, 0.02745098, 1,
-0.4525921, 1.597576, -0.3386409, 0, 1, 0.03529412, 1,
-0.4503647, 0.005389468, -1.9347, 0, 1, 0.03921569, 1,
-0.4496998, 0.5381705, -0.3746977, 0, 1, 0.04705882, 1,
-0.4419982, -1.198839, -3.441574, 0, 1, 0.05098039, 1,
-0.4406186, -0.1257953, -1.031186, 0, 1, 0.05882353, 1,
-0.4403014, -0.2465938, -2.515247, 0, 1, 0.0627451, 1,
-0.4399979, 0.430172, 0.02083191, 0, 1, 0.07058824, 1,
-0.4368672, -0.2576528, -1.41194, 0, 1, 0.07450981, 1,
-0.4343833, 0.6876482, 0.1189536, 0, 1, 0.08235294, 1,
-0.4337623, -2.012035, -3.973703, 0, 1, 0.08627451, 1,
-0.4335791, 0.4420325, -1.138967, 0, 1, 0.09411765, 1,
-0.4313271, -1.119185, -3.319336, 0, 1, 0.1019608, 1,
-0.4306443, -0.3113967, -2.355032, 0, 1, 0.1058824, 1,
-0.4288848, -0.9781203, -4.426193, 0, 1, 0.1137255, 1,
-0.4285564, 0.9714622, -1.800767, 0, 1, 0.1176471, 1,
-0.4221841, 1.268876, -2.349845, 0, 1, 0.1254902, 1,
-0.4149146, -0.06466159, -0.05023487, 0, 1, 0.1294118, 1,
-0.4130404, 0.07995778, -1.117066, 0, 1, 0.1372549, 1,
-0.4078111, -0.3699474, -2.032446, 0, 1, 0.1411765, 1,
-0.4064808, -0.3481185, -1.61492, 0, 1, 0.1490196, 1,
-0.4032941, 0.1725816, -0.2730722, 0, 1, 0.1529412, 1,
-0.4024444, -1.303861, -3.68066, 0, 1, 0.1607843, 1,
-0.399698, -0.9133683, -4.035532, 0, 1, 0.1647059, 1,
-0.3985169, -0.3307825, -2.406334, 0, 1, 0.172549, 1,
-0.3981335, 0.04755893, -0.3328784, 0, 1, 0.1764706, 1,
-0.3937069, -0.01299851, -1.614477, 0, 1, 0.1843137, 1,
-0.3837619, 2.409217, -1.319798, 0, 1, 0.1882353, 1,
-0.3834345, -0.3642416, -0.751651, 0, 1, 0.1960784, 1,
-0.3828019, -1.250562, -2.323155, 0, 1, 0.2039216, 1,
-0.3805785, 0.7112629, 1.005676, 0, 1, 0.2078431, 1,
-0.3783792, 0.341459, -0.9678329, 0, 1, 0.2156863, 1,
-0.3779654, -0.3747628, -2.012342, 0, 1, 0.2196078, 1,
-0.377849, 0.9072165, -1.509515, 0, 1, 0.227451, 1,
-0.3770313, -0.1821826, -3.516401, 0, 1, 0.2313726, 1,
-0.3767078, 0.5370212, -0.4569633, 0, 1, 0.2392157, 1,
-0.3747092, -0.05877517, -0.4152482, 0, 1, 0.2431373, 1,
-0.3693459, -1.349322, -2.391104, 0, 1, 0.2509804, 1,
-0.3672957, -0.7007006, -1.890546, 0, 1, 0.254902, 1,
-0.3657348, 2.087782, 0.607759, 0, 1, 0.2627451, 1,
-0.3558028, -0.5812586, -2.761833, 0, 1, 0.2666667, 1,
-0.3545202, -1.467942, -4.34263, 0, 1, 0.2745098, 1,
-0.3530677, -0.8570125, -2.301481, 0, 1, 0.2784314, 1,
-0.3487038, 0.409588, 0.1462463, 0, 1, 0.2862745, 1,
-0.3457368, -0.4458557, -3.075556, 0, 1, 0.2901961, 1,
-0.3457026, -0.2901694, -2.946707, 0, 1, 0.2980392, 1,
-0.3428414, -0.6896087, -2.180261, 0, 1, 0.3058824, 1,
-0.3412494, -0.3778484, -2.04905, 0, 1, 0.3098039, 1,
-0.3408931, 1.285349, -0.7979704, 0, 1, 0.3176471, 1,
-0.3372574, -1.588355, -4.434812, 0, 1, 0.3215686, 1,
-0.3370395, 1.4768, -1.609256, 0, 1, 0.3294118, 1,
-0.3307209, 1.76445, -1.876623, 0, 1, 0.3333333, 1,
-0.3244329, 0.08333908, -1.167039, 0, 1, 0.3411765, 1,
-0.3236343, 0.007214747, 0.06013048, 0, 1, 0.345098, 1,
-0.3220756, -1.859055, -4.484142, 0, 1, 0.3529412, 1,
-0.3211954, 1.574814, -1.327769, 0, 1, 0.3568628, 1,
-0.3208387, 0.2039179, -1.538659, 0, 1, 0.3647059, 1,
-0.3157983, 0.957548, -0.562778, 0, 1, 0.3686275, 1,
-0.3118328, -0.8650395, -2.940126, 0, 1, 0.3764706, 1,
-0.3083426, -0.2814502, -2.139017, 0, 1, 0.3803922, 1,
-0.3074549, 0.001262133, -1.884311, 0, 1, 0.3882353, 1,
-0.3074124, 0.3391097, -2.157894, 0, 1, 0.3921569, 1,
-0.3058836, 0.2549381, -1.496273, 0, 1, 0.4, 1,
-0.3015179, -0.3677597, -1.386501, 0, 1, 0.4078431, 1,
-0.3006272, -0.128906, -1.546456, 0, 1, 0.4117647, 1,
-0.2992617, -0.5394453, -3.586214, 0, 1, 0.4196078, 1,
-0.2989295, -1.013311, -4.030724, 0, 1, 0.4235294, 1,
-0.2949889, -0.1323981, -2.17158, 0, 1, 0.4313726, 1,
-0.2919496, -0.01119481, -0.5741727, 0, 1, 0.4352941, 1,
-0.2854482, -0.1893264, -2.313247, 0, 1, 0.4431373, 1,
-0.2839927, -0.6473609, -3.808896, 0, 1, 0.4470588, 1,
-0.2812868, 0.8833413, -0.9920778, 0, 1, 0.454902, 1,
-0.2803144, -0.1822774, -2.205967, 0, 1, 0.4588235, 1,
-0.2770923, 0.774196, -2.158322, 0, 1, 0.4666667, 1,
-0.2706194, 0.822581, -0.4469819, 0, 1, 0.4705882, 1,
-0.2699104, 0.5279619, -0.3122093, 0, 1, 0.4784314, 1,
-0.2691202, -0.2976116, -0.6588251, 0, 1, 0.4823529, 1,
-0.2687452, 0.8698678, -0.455482, 0, 1, 0.4901961, 1,
-0.2671324, -2.569712, -3.67735, 0, 1, 0.4941176, 1,
-0.2666748, 0.4533097, -1.222081, 0, 1, 0.5019608, 1,
-0.263179, -1.189872, -3.118967, 0, 1, 0.509804, 1,
-0.2630981, -1.376788, -2.76791, 0, 1, 0.5137255, 1,
-0.2616705, 1.534572, 0.4763999, 0, 1, 0.5215687, 1,
-0.2589143, 1.653283, -0.4155342, 0, 1, 0.5254902, 1,
-0.2562428, -0.507299, -1.635602, 0, 1, 0.5333334, 1,
-0.2553073, -0.5412477, -3.238306, 0, 1, 0.5372549, 1,
-0.2503152, 0.8528877, -1.287187, 0, 1, 0.5450981, 1,
-0.2486266, 0.5103838, -1.001951, 0, 1, 0.5490196, 1,
-0.2473302, 0.7879744, 0.850834, 0, 1, 0.5568628, 1,
-0.2457178, 0.9169617, -0.1891398, 0, 1, 0.5607843, 1,
-0.2454398, 0.7051224, 0.2422904, 0, 1, 0.5686275, 1,
-0.2439083, 0.1727661, -2.605013, 0, 1, 0.572549, 1,
-0.2433183, -0.9946545, -4.86863, 0, 1, 0.5803922, 1,
-0.2395813, -0.095332, -2.263478, 0, 1, 0.5843138, 1,
-0.2382784, 0.2650684, -0.08555247, 0, 1, 0.5921569, 1,
-0.2359662, -1.034745, -2.851466, 0, 1, 0.5960785, 1,
-0.2340556, 0.3617448, -1.632083, 0, 1, 0.6039216, 1,
-0.2338336, 0.1605478, -0.3098738, 0, 1, 0.6117647, 1,
-0.2311488, -1.849848, -3.506394, 0, 1, 0.6156863, 1,
-0.2310926, 0.8626127, 0.1712381, 0, 1, 0.6235294, 1,
-0.2164866, 1.89812, -0.2249373, 0, 1, 0.627451, 1,
-0.2157259, 1.708182, 0.5520735, 0, 1, 0.6352941, 1,
-0.2120364, -0.5786737, -3.583913, 0, 1, 0.6392157, 1,
-0.2084962, 0.663835, 0.6963848, 0, 1, 0.6470588, 1,
-0.2081628, -3.077666, -3.592021, 0, 1, 0.6509804, 1,
-0.2070145, 1.248824, 1.423566, 0, 1, 0.6588235, 1,
-0.2049035, 1.26772, -1.004603, 0, 1, 0.6627451, 1,
-0.2010878, -0.4067636, -1.667348, 0, 1, 0.6705883, 1,
-0.1953305, -0.6654413, -2.012782, 0, 1, 0.6745098, 1,
-0.1943126, -0.6604149, -1.295668, 0, 1, 0.682353, 1,
-0.1935728, 0.3482818, 0.8397726, 0, 1, 0.6862745, 1,
-0.1844358, -1.538078, -1.832194, 0, 1, 0.6941177, 1,
-0.1841166, 0.6700995, -0.9931856, 0, 1, 0.7019608, 1,
-0.1821039, 0.6517532, 0.4519394, 0, 1, 0.7058824, 1,
-0.1818161, 2.05233, 0.06906096, 0, 1, 0.7137255, 1,
-0.1779078, 0.8311259, -0.3196446, 0, 1, 0.7176471, 1,
-0.1689022, -0.5302714, -2.969717, 0, 1, 0.7254902, 1,
-0.1677189, 2.20881, 0.6624003, 0, 1, 0.7294118, 1,
-0.1672834, -1.585971, -3.370746, 0, 1, 0.7372549, 1,
-0.1661466, 0.3064859, -1.284237, 0, 1, 0.7411765, 1,
-0.1639256, 0.9794503, -0.0431255, 0, 1, 0.7490196, 1,
-0.1629605, 0.7321653, -0.7882079, 0, 1, 0.7529412, 1,
-0.156966, -0.6515602, -3.334857, 0, 1, 0.7607843, 1,
-0.1527899, -0.8125218, -1.679372, 0, 1, 0.7647059, 1,
-0.1499686, 1.025954, -0.6300188, 0, 1, 0.772549, 1,
-0.1476653, 1.688648, 2.335591, 0, 1, 0.7764706, 1,
-0.1466866, -0.4022225, -3.207293, 0, 1, 0.7843137, 1,
-0.1459329, -0.4250019, -3.217584, 0, 1, 0.7882353, 1,
-0.1439345, 1.340377, 0.875299, 0, 1, 0.7960784, 1,
-0.143592, 0.7605591, 0.4101939, 0, 1, 0.8039216, 1,
-0.1422516, -0.7805068, -2.296859, 0, 1, 0.8078431, 1,
-0.1402049, -0.7510594, -1.919562, 0, 1, 0.8156863, 1,
-0.1370347, -0.5475551, -3.603023, 0, 1, 0.8196079, 1,
-0.1366, 0.8991489, -1.862973, 0, 1, 0.827451, 1,
-0.1342461, 0.07714394, 0.4230913, 0, 1, 0.8313726, 1,
-0.1334964, -0.2337161, -1.729437, 0, 1, 0.8392157, 1,
-0.1331067, -0.4423418, -3.08408, 0, 1, 0.8431373, 1,
-0.1208084, -0.8909875, -3.524186, 0, 1, 0.8509804, 1,
-0.1188027, 0.0767922, -1.323189, 0, 1, 0.854902, 1,
-0.1137484, -0.4040327, -3.060107, 0, 1, 0.8627451, 1,
-0.1121158, 0.439209, -0.2656318, 0, 1, 0.8666667, 1,
-0.1060454, -0.5795021, -1.831743, 0, 1, 0.8745098, 1,
-0.1058107, 0.3177164, -1.135535, 0, 1, 0.8784314, 1,
-0.1024846, -0.3792919, -2.126195, 0, 1, 0.8862745, 1,
-0.1024259, -0.08735766, -3.548689, 0, 1, 0.8901961, 1,
-0.09684324, -0.1481343, -3.41326, 0, 1, 0.8980392, 1,
-0.09599693, -1.538599, -3.276011, 0, 1, 0.9058824, 1,
-0.09070714, 0.4015198, -0.3175089, 0, 1, 0.9098039, 1,
-0.08764884, -0.3603282, -3.454571, 0, 1, 0.9176471, 1,
-0.08653716, 0.8066095, -1.252848, 0, 1, 0.9215686, 1,
-0.08253331, -0.1886486, -1.271165, 0, 1, 0.9294118, 1,
-0.08006898, -0.3605354, -1.89649, 0, 1, 0.9333333, 1,
-0.07927704, -1.355159, -4.33852, 0, 1, 0.9411765, 1,
-0.07681406, 0.7392447, -0.7111257, 0, 1, 0.945098, 1,
-0.07548153, 0.5028695, -0.4264685, 0, 1, 0.9529412, 1,
-0.07386514, -0.2051331, -2.371136, 0, 1, 0.9568627, 1,
-0.06991667, 0.2662513, 0.7111573, 0, 1, 0.9647059, 1,
-0.06302892, -0.3982692, -3.257122, 0, 1, 0.9686275, 1,
-0.06118966, -0.04918172, -3.27878, 0, 1, 0.9764706, 1,
-0.05650299, -2.947321, -2.547518, 0, 1, 0.9803922, 1,
-0.05605291, -0.2485698, -1.862177, 0, 1, 0.9882353, 1,
-0.05159417, 1.12294, -0.4072278, 0, 1, 0.9921569, 1,
-0.04862743, -0.3529328, -3.517988, 0, 1, 1, 1,
-0.04698344, -1.661765, -4.432707, 0, 0.9921569, 1, 1,
-0.04609727, 0.8471906, 1.442362, 0, 0.9882353, 1, 1,
-0.04596195, -0.6042898, -2.592353, 0, 0.9803922, 1, 1,
-0.03979505, 0.1155359, -3.094961, 0, 0.9764706, 1, 1,
-0.03754682, -0.1998702, -3.378926, 0, 0.9686275, 1, 1,
-0.03521403, -1.012839, -4.152577, 0, 0.9647059, 1, 1,
-0.03476121, 0.1404651, -0.3926806, 0, 0.9568627, 1, 1,
-0.02822492, 0.1169585, 0.4421822, 0, 0.9529412, 1, 1,
-0.02663011, -0.2473222, -1.78028, 0, 0.945098, 1, 1,
-0.02644567, 0.9002481, -0.5243968, 0, 0.9411765, 1, 1,
-0.02576544, -0.5183129, -2.817049, 0, 0.9333333, 1, 1,
-0.02403865, 1.239764, 0.2303738, 0, 0.9294118, 1, 1,
-0.01992637, 0.04560813, -1.120617, 0, 0.9215686, 1, 1,
-0.00491394, -1.849468, -2.373279, 0, 0.9176471, 1, 1,
-0.004621498, -1.844102, -3.710912, 0, 0.9098039, 1, 1,
-0.004468049, 0.29601, -0.05798415, 0, 0.9058824, 1, 1,
-0.001457003, -1.826014, -3.003362, 0, 0.8980392, 1, 1,
-0.00117825, -0.8200464, -4.149802, 0, 0.8901961, 1, 1,
0.002230631, 0.1528093, -1.104625, 0, 0.8862745, 1, 1,
0.005615501, 0.8205549, -0.6215547, 0, 0.8784314, 1, 1,
0.007438375, -1.929556, 1.442912, 0, 0.8745098, 1, 1,
0.01472841, 1.286204, 0.6815254, 0, 0.8666667, 1, 1,
0.01616809, 0.1404207, 0.6657791, 0, 0.8627451, 1, 1,
0.02436531, 0.1251602, 0.618467, 0, 0.854902, 1, 1,
0.02482835, -1.279892, 2.330266, 0, 0.8509804, 1, 1,
0.02607608, -1.158617, 1.347425, 0, 0.8431373, 1, 1,
0.02879865, -1.196442, 4.078037, 0, 0.8392157, 1, 1,
0.02919494, -0.6746672, 3.608528, 0, 0.8313726, 1, 1,
0.0295206, -1.363557, 1.163299, 0, 0.827451, 1, 1,
0.03152071, 1.856379, -0.217188, 0, 0.8196079, 1, 1,
0.03478878, -0.889811, 2.63568, 0, 0.8156863, 1, 1,
0.04100277, -1.603421, 2.213278, 0, 0.8078431, 1, 1,
0.04338064, 0.4808387, 0.261325, 0, 0.8039216, 1, 1,
0.04612147, -0.9158739, 5.842383, 0, 0.7960784, 1, 1,
0.04947813, 0.175008, -0.06956514, 0, 0.7882353, 1, 1,
0.05180558, -1.516523, 3.929305, 0, 0.7843137, 1, 1,
0.05194139, -0.6755662, 1.999939, 0, 0.7764706, 1, 1,
0.05413585, -0.05162651, 2.473658, 0, 0.772549, 1, 1,
0.05447685, 0.975982, -0.7316864, 0, 0.7647059, 1, 1,
0.05643707, 0.2682996, -0.9084949, 0, 0.7607843, 1, 1,
0.05740404, -0.2167297, 3.604706, 0, 0.7529412, 1, 1,
0.05749739, 0.3938967, -0.04472025, 0, 0.7490196, 1, 1,
0.05823245, 0.8857838, 0.1300379, 0, 0.7411765, 1, 1,
0.06085254, 2.003252, -2.100681, 0, 0.7372549, 1, 1,
0.0634521, -0.6445977, 3.236132, 0, 0.7294118, 1, 1,
0.06461456, -1.286087, 2.109145, 0, 0.7254902, 1, 1,
0.07073183, -0.3143932, 4.350828, 0, 0.7176471, 1, 1,
0.07498782, -0.06204841, 2.343862, 0, 0.7137255, 1, 1,
0.07571112, 0.2707131, -0.9162482, 0, 0.7058824, 1, 1,
0.08006863, -0.06983529, 2.422729, 0, 0.6980392, 1, 1,
0.08041037, 0.6729408, 0.05059687, 0, 0.6941177, 1, 1,
0.08620024, -1.21682, 2.175076, 0, 0.6862745, 1, 1,
0.08941108, -1.133675, 3.072748, 0, 0.682353, 1, 1,
0.09319969, 0.1449757, -0.2664435, 0, 0.6745098, 1, 1,
0.09335924, 0.08321768, 0.9274464, 0, 0.6705883, 1, 1,
0.09346196, 0.5745574, -1.35941, 0, 0.6627451, 1, 1,
0.0968522, 0.941461, 1.102352, 0, 0.6588235, 1, 1,
0.09853977, -0.4941652, 3.908309, 0, 0.6509804, 1, 1,
0.1012124, -0.9624326, 3.597545, 0, 0.6470588, 1, 1,
0.102451, -0.5207445, 2.3701, 0, 0.6392157, 1, 1,
0.1042608, -0.2529828, 3.418272, 0, 0.6352941, 1, 1,
0.1053827, -1.363992, 1.549683, 0, 0.627451, 1, 1,
0.1056941, 1.333123, 0.9946799, 0, 0.6235294, 1, 1,
0.1077801, 0.4745603, -0.1606673, 0, 0.6156863, 1, 1,
0.112105, -2.221091, 2.101214, 0, 0.6117647, 1, 1,
0.1121313, 0.3722843, 0.6697398, 0, 0.6039216, 1, 1,
0.1151944, 2.154397, 0.7537478, 0, 0.5960785, 1, 1,
0.115512, 1.060004, -0.2512482, 0, 0.5921569, 1, 1,
0.1197131, 0.1518028, 0.4318148, 0, 0.5843138, 1, 1,
0.1199525, -0.9847491, 3.195012, 0, 0.5803922, 1, 1,
0.1208336, 0.9246483, 0.8448017, 0, 0.572549, 1, 1,
0.1264571, -1.012009, 4.836427, 0, 0.5686275, 1, 1,
0.127605, 0.9673071, -0.617557, 0, 0.5607843, 1, 1,
0.1406551, 0.3789166, -0.09749073, 0, 0.5568628, 1, 1,
0.1425613, 1.515855, 0.04725911, 0, 0.5490196, 1, 1,
0.1430646, -0.1571403, 2.458352, 0, 0.5450981, 1, 1,
0.146696, 0.2861438, 0.6055335, 0, 0.5372549, 1, 1,
0.1506544, 0.7700203, 0.3390482, 0, 0.5333334, 1, 1,
0.1537673, -0.8661954, 1.224521, 0, 0.5254902, 1, 1,
0.1537909, -1.34209, 2.828879, 0, 0.5215687, 1, 1,
0.1544374, -0.3279963, 2.921503, 0, 0.5137255, 1, 1,
0.1576204, -1.126807, 2.179353, 0, 0.509804, 1, 1,
0.1580711, -1.497227, 3.275889, 0, 0.5019608, 1, 1,
0.1600765, 1.711671, -0.371133, 0, 0.4941176, 1, 1,
0.163601, -0.2078129, 1.49558, 0, 0.4901961, 1, 1,
0.1637306, -2.596217, 2.428038, 0, 0.4823529, 1, 1,
0.1653804, 1.082267, 0.1749553, 0, 0.4784314, 1, 1,
0.1673189, 2.009143, -0.3584495, 0, 0.4705882, 1, 1,
0.1693014, -0.5028612, 3.856572, 0, 0.4666667, 1, 1,
0.1695812, 1.053961, -1.642686, 0, 0.4588235, 1, 1,
0.1695852, -0.6505961, 3.462549, 0, 0.454902, 1, 1,
0.1775563, 0.4196214, 1.116112, 0, 0.4470588, 1, 1,
0.1777232, -0.3483173, 2.814608, 0, 0.4431373, 1, 1,
0.1810958, 0.0204798, 1.971725, 0, 0.4352941, 1, 1,
0.1812611, -0.4183722, 1.505327, 0, 0.4313726, 1, 1,
0.1836763, 1.005941, -0.2343996, 0, 0.4235294, 1, 1,
0.1867803, 0.4273169, 0.4677893, 0, 0.4196078, 1, 1,
0.1867884, 1.439342, -0.3414597, 0, 0.4117647, 1, 1,
0.1933072, 1.838066, -0.9547223, 0, 0.4078431, 1, 1,
0.1946974, 1.220589, 2.011994, 0, 0.4, 1, 1,
0.1964856, 0.3773337, 1.478197, 0, 0.3921569, 1, 1,
0.1977917, 1.239037, 0.1266867, 0, 0.3882353, 1, 1,
0.1993182, 0.05195443, 0.5689501, 0, 0.3803922, 1, 1,
0.2038008, 1.073863, 1.394615, 0, 0.3764706, 1, 1,
0.2043794, 1.283701, 2.211407, 0, 0.3686275, 1, 1,
0.2048975, 1.577704, -0.4748767, 0, 0.3647059, 1, 1,
0.2057662, 0.2019184, 3.030291, 0, 0.3568628, 1, 1,
0.2090351, 0.9344934, 1.076912, 0, 0.3529412, 1, 1,
0.2101087, 1.719579, -1.072348, 0, 0.345098, 1, 1,
0.2104179, 0.9013081, -0.5445378, 0, 0.3411765, 1, 1,
0.2133464, 0.8091848, 0.8042753, 0, 0.3333333, 1, 1,
0.2143724, -0.3666457, 3.666769, 0, 0.3294118, 1, 1,
0.2164238, -0.6759949, 4.562216, 0, 0.3215686, 1, 1,
0.219305, -0.46933, 3.360583, 0, 0.3176471, 1, 1,
0.2197917, -0.3622378, 2.908338, 0, 0.3098039, 1, 1,
0.2241712, -0.3151241, 1.535971, 0, 0.3058824, 1, 1,
0.2344338, 0.6292202, -0.3848305, 0, 0.2980392, 1, 1,
0.2413346, -0.05384839, 2.25924, 0, 0.2901961, 1, 1,
0.2478495, 0.1956127, -1.235165, 0, 0.2862745, 1, 1,
0.2499139, -0.3254559, 3.860907, 0, 0.2784314, 1, 1,
0.2595994, -0.9758421, 2.688616, 0, 0.2745098, 1, 1,
0.2600333, -0.2214013, 2.531826, 0, 0.2666667, 1, 1,
0.262776, 0.5827404, 0.2031993, 0, 0.2627451, 1, 1,
0.2668173, 0.4318918, 0.9508364, 0, 0.254902, 1, 1,
0.2675343, -0.7616624, 0.4989552, 0, 0.2509804, 1, 1,
0.2684863, -0.6525709, 4.108566, 0, 0.2431373, 1, 1,
0.2750575, -0.5424803, 2.249507, 0, 0.2392157, 1, 1,
0.2780829, 1.567385, 1.582623, 0, 0.2313726, 1, 1,
0.2787817, 0.1370934, -0.7242646, 0, 0.227451, 1, 1,
0.279375, -0.8727669, 3.61256, 0, 0.2196078, 1, 1,
0.2845572, -0.3855429, 4.361917, 0, 0.2156863, 1, 1,
0.2858733, -0.220307, 1.677789, 0, 0.2078431, 1, 1,
0.287351, 0.8631235, 0.07870849, 0, 0.2039216, 1, 1,
0.2878366, -1.485738, 3.587816, 0, 0.1960784, 1, 1,
0.2913451, -0.246415, 2.211501, 0, 0.1882353, 1, 1,
0.2935172, 0.1858319, 1.913111, 0, 0.1843137, 1, 1,
0.2959285, -1.205292, 3.027244, 0, 0.1764706, 1, 1,
0.298336, -0.1576872, 1.913231, 0, 0.172549, 1, 1,
0.2985077, 2.628762, -0.07469774, 0, 0.1647059, 1, 1,
0.2989689, 1.045445, 1.128645, 0, 0.1607843, 1, 1,
0.3013085, -1.101696, 3.125069, 0, 0.1529412, 1, 1,
0.3019057, -1.003703, 3.026006, 0, 0.1490196, 1, 1,
0.3019219, -0.3448445, 2.979102, 0, 0.1411765, 1, 1,
0.3026301, 0.538707, 1.979156, 0, 0.1372549, 1, 1,
0.3027798, -0.211782, 3.58312, 0, 0.1294118, 1, 1,
0.3035554, 1.084831, 2.07071, 0, 0.1254902, 1, 1,
0.3037571, 0.5136783, -0.03301853, 0, 0.1176471, 1, 1,
0.3069892, -0.5059342, 4.058636, 0, 0.1137255, 1, 1,
0.3076764, 0.2279925, 0.08290739, 0, 0.1058824, 1, 1,
0.3095451, 2.206457, -0.304388, 0, 0.09803922, 1, 1,
0.3132942, -1.243803, 2.267244, 0, 0.09411765, 1, 1,
0.3136706, -0.4259919, 2.027492, 0, 0.08627451, 1, 1,
0.315424, -0.6739632, 1.564062, 0, 0.08235294, 1, 1,
0.3155443, 1.133139, -0.306127, 0, 0.07450981, 1, 1,
0.3208461, -1.130591, 1.330047, 0, 0.07058824, 1, 1,
0.3236852, -0.01788488, 1.55427, 0, 0.0627451, 1, 1,
0.325791, -0.7873782, 2.441915, 0, 0.05882353, 1, 1,
0.3262085, -0.7664105, 2.902677, 0, 0.05098039, 1, 1,
0.3285903, -2.24054, 0.9499242, 0, 0.04705882, 1, 1,
0.3359671, -0.7815611, 3.03474, 0, 0.03921569, 1, 1,
0.3373912, -0.06945766, 1.137651, 0, 0.03529412, 1, 1,
0.3422695, -2.137098, 1.17263, 0, 0.02745098, 1, 1,
0.3443341, -0.1685026, 1.452455, 0, 0.02352941, 1, 1,
0.3490105, 0.5467399, -0.3873319, 0, 0.01568628, 1, 1,
0.3500113, 0.001936646, 1.989355, 0, 0.01176471, 1, 1,
0.3504997, 0.1182904, 1.22558, 0, 0.003921569, 1, 1,
0.3625149, 1.127023, 0.4154495, 0.003921569, 0, 1, 1,
0.3629417, 0.3847817, 1.30522, 0.007843138, 0, 1, 1,
0.3638238, -0.3336522, 0.8997421, 0.01568628, 0, 1, 1,
0.3643506, -0.2056725, 0.8043336, 0.01960784, 0, 1, 1,
0.3707187, -0.8750672, 2.536576, 0.02745098, 0, 1, 1,
0.3710668, -0.4129222, 4.382892, 0.03137255, 0, 1, 1,
0.3726303, 2.10104, 1.509135, 0.03921569, 0, 1, 1,
0.3730562, 0.4233467, -0.003179684, 0.04313726, 0, 1, 1,
0.3741919, -0.4402241, 0.9757408, 0.05098039, 0, 1, 1,
0.3747134, 2.14221, 0.5106806, 0.05490196, 0, 1, 1,
0.3786734, 0.7220638, 1.560073, 0.0627451, 0, 1, 1,
0.3839942, 1.779909, -0.8397834, 0.06666667, 0, 1, 1,
0.3848644, 0.8592054, -0.7095628, 0.07450981, 0, 1, 1,
0.3852098, -1.018267, 2.13938, 0.07843138, 0, 1, 1,
0.3913243, -0.8553331, 3.765225, 0.08627451, 0, 1, 1,
0.3946966, -0.8562543, 3.716189, 0.09019608, 0, 1, 1,
0.4017287, -1.277455, 1.955404, 0.09803922, 0, 1, 1,
0.4028082, 1.245434, 0.3014549, 0.1058824, 0, 1, 1,
0.407124, -0.5688987, 4.678995, 0.1098039, 0, 1, 1,
0.4100325, 0.5066911, -0.7866345, 0.1176471, 0, 1, 1,
0.4116243, -1.776032, 3.273628, 0.1215686, 0, 1, 1,
0.4138878, 1.95666, -1.565172, 0.1294118, 0, 1, 1,
0.4149792, 0.2135883, 1.392732, 0.1333333, 0, 1, 1,
0.4191715, -1.972491, 1.825228, 0.1411765, 0, 1, 1,
0.4199402, -1.37389, 2.117219, 0.145098, 0, 1, 1,
0.4221403, 0.4927257, 0.2349464, 0.1529412, 0, 1, 1,
0.4223358, 0.6898283, -0.7559635, 0.1568628, 0, 1, 1,
0.422522, -1.152835, 3.831296, 0.1647059, 0, 1, 1,
0.4234277, 0.4858335, 1.473617, 0.1686275, 0, 1, 1,
0.430436, -1.767446, 4.186304, 0.1764706, 0, 1, 1,
0.4306141, 1.235123, 0.8045909, 0.1803922, 0, 1, 1,
0.4307255, -1.32887, 2.707395, 0.1882353, 0, 1, 1,
0.4314057, -0.1937386, 3.071105, 0.1921569, 0, 1, 1,
0.4318928, -0.6048394, 2.872607, 0.2, 0, 1, 1,
0.4330423, 0.4850138, 1.108683, 0.2078431, 0, 1, 1,
0.4335116, 0.7241995, -0.7843242, 0.2117647, 0, 1, 1,
0.4368431, 0.9245974, 0.350009, 0.2196078, 0, 1, 1,
0.4404046, -0.5214424, 3.203916, 0.2235294, 0, 1, 1,
0.4482954, -0.1146157, 1.704067, 0.2313726, 0, 1, 1,
0.449158, -0.2434411, 1.570571, 0.2352941, 0, 1, 1,
0.4544202, 0.5697197, 0.077846, 0.2431373, 0, 1, 1,
0.456601, -1.152938, 3.055157, 0.2470588, 0, 1, 1,
0.4587507, -0.0610099, 1.599731, 0.254902, 0, 1, 1,
0.4614195, -0.541559, 1.962769, 0.2588235, 0, 1, 1,
0.467186, 1.167498, 0.3347505, 0.2666667, 0, 1, 1,
0.4672062, -0.8645581, 4.361642, 0.2705882, 0, 1, 1,
0.477899, -0.5918793, 1.995423, 0.2784314, 0, 1, 1,
0.4823078, 0.5945781, 0.9097431, 0.282353, 0, 1, 1,
0.4826664, 1.296043, 0.7194879, 0.2901961, 0, 1, 1,
0.5025201, 1.462238, 0.9579108, 0.2941177, 0, 1, 1,
0.5052342, -0.05293794, 1.459559, 0.3019608, 0, 1, 1,
0.5067732, 0.04679006, -1.139662, 0.3098039, 0, 1, 1,
0.5101832, 0.5915104, 0.121053, 0.3137255, 0, 1, 1,
0.5110626, 0.9458725, 1.000635, 0.3215686, 0, 1, 1,
0.5128817, 1.149152, 0.2680763, 0.3254902, 0, 1, 1,
0.5151396, 0.0685368, 2.198503, 0.3333333, 0, 1, 1,
0.5160694, 1.755041, -0.0191448, 0.3372549, 0, 1, 1,
0.5166938, 0.07947431, 0.1524099, 0.345098, 0, 1, 1,
0.5280806, -0.7340118, 2.55341, 0.3490196, 0, 1, 1,
0.5282204, -0.05225077, 1.50583, 0.3568628, 0, 1, 1,
0.5293562, -0.6245238, 2.424667, 0.3607843, 0, 1, 1,
0.5321497, -0.7034526, 2.469865, 0.3686275, 0, 1, 1,
0.5329663, 0.7819863, 1.009431, 0.372549, 0, 1, 1,
0.5332229, 0.1277059, -1.624686, 0.3803922, 0, 1, 1,
0.5428827, -0.002629794, 1.464696, 0.3843137, 0, 1, 1,
0.5434253, 1.423138, -0.02473358, 0.3921569, 0, 1, 1,
0.5446979, -0.7061899, 2.785665, 0.3960784, 0, 1, 1,
0.5501036, -0.9869933, 2.511534, 0.4039216, 0, 1, 1,
0.5538322, -0.184438, 0.5584104, 0.4117647, 0, 1, 1,
0.5555854, 0.06792458, 2.685185, 0.4156863, 0, 1, 1,
0.5578473, -2.447237, 4.610844, 0.4235294, 0, 1, 1,
0.5609015, -0.6478673, 1.612118, 0.427451, 0, 1, 1,
0.5616609, -1.790684, 3.987331, 0.4352941, 0, 1, 1,
0.5670841, 0.3571784, 0.2736324, 0.4392157, 0, 1, 1,
0.5697669, 0.6664371, 1.313706, 0.4470588, 0, 1, 1,
0.570648, -0.2379504, 2.198757, 0.4509804, 0, 1, 1,
0.5819783, -0.3517308, 1.816891, 0.4588235, 0, 1, 1,
0.5831329, -0.7826346, 2.92028, 0.4627451, 0, 1, 1,
0.5834615, -1.094253, 4.603536, 0.4705882, 0, 1, 1,
0.5840362, 0.2251652, 0.6703303, 0.4745098, 0, 1, 1,
0.5875998, -0.4107115, 4.644797, 0.4823529, 0, 1, 1,
0.5925192, -0.005408051, 1.191629, 0.4862745, 0, 1, 1,
0.5955498, -0.5875568, 2.635247, 0.4941176, 0, 1, 1,
0.5984452, 2.275676, -0.07965587, 0.5019608, 0, 1, 1,
0.5988447, -1.231368, 2.765479, 0.5058824, 0, 1, 1,
0.6021095, 0.7738135, -1.200982, 0.5137255, 0, 1, 1,
0.6055052, -0.7882298, 2.11919, 0.5176471, 0, 1, 1,
0.6101347, -0.5709035, 2.791366, 0.5254902, 0, 1, 1,
0.6121081, 0.4618124, 1.250514, 0.5294118, 0, 1, 1,
0.6301345, 1.082555, 1.673225, 0.5372549, 0, 1, 1,
0.6304812, -0.3649886, 0.951879, 0.5411765, 0, 1, 1,
0.6307062, -1.482245, 2.514625, 0.5490196, 0, 1, 1,
0.6316656, -1.254246, 2.083081, 0.5529412, 0, 1, 1,
0.6320274, -0.7495007, 1.799895, 0.5607843, 0, 1, 1,
0.6419345, 1.357648, 1.301795, 0.5647059, 0, 1, 1,
0.6421724, 1.465166, -0.5141516, 0.572549, 0, 1, 1,
0.6430467, 1.343291, 1.174334, 0.5764706, 0, 1, 1,
0.6436129, -0.6823449, 1.044522, 0.5843138, 0, 1, 1,
0.6672688, -0.5100567, 2.664196, 0.5882353, 0, 1, 1,
0.6714709, 0.7702413, -1.07199, 0.5960785, 0, 1, 1,
0.672601, 0.6392033, 2.771068, 0.6039216, 0, 1, 1,
0.6734725, 1.462445, 0.9950488, 0.6078432, 0, 1, 1,
0.673796, -0.6801597, 1.608604, 0.6156863, 0, 1, 1,
0.6746331, -0.1240743, 1.21055, 0.6196079, 0, 1, 1,
0.675929, 0.6572401, -0.800721, 0.627451, 0, 1, 1,
0.6763081, -0.5797246, 2.231602, 0.6313726, 0, 1, 1,
0.6788694, -0.05975506, -0.4061088, 0.6392157, 0, 1, 1,
0.6800112, -0.08824421, 0.08237888, 0.6431373, 0, 1, 1,
0.6915049, 1.048868, 0.754575, 0.6509804, 0, 1, 1,
0.6951295, -0.9471391, 3.483977, 0.654902, 0, 1, 1,
0.6957299, -1.816072, 2.741155, 0.6627451, 0, 1, 1,
0.6974666, 0.2051371, 2.285284, 0.6666667, 0, 1, 1,
0.7177753, 0.7672164, -0.1065199, 0.6745098, 0, 1, 1,
0.7192706, 1.402911, 1.988918, 0.6784314, 0, 1, 1,
0.7240769, 0.03480393, 0.7130294, 0.6862745, 0, 1, 1,
0.7314045, 1.067581, -0.8671138, 0.6901961, 0, 1, 1,
0.7337013, 1.613185, 0.6465186, 0.6980392, 0, 1, 1,
0.7338359, 0.1730489, 2.000721, 0.7058824, 0, 1, 1,
0.7354723, -0.02342792, 3.480134, 0.7098039, 0, 1, 1,
0.7365627, 0.1513445, 1.332032, 0.7176471, 0, 1, 1,
0.7405508, -0.603267, 3.488496, 0.7215686, 0, 1, 1,
0.7416281, 1.566092, -1.573592, 0.7294118, 0, 1, 1,
0.7521834, -1.043388, 3.122342, 0.7333333, 0, 1, 1,
0.753116, -0.4042322, 0.4576857, 0.7411765, 0, 1, 1,
0.7559783, -0.3490614, -0.1416522, 0.7450981, 0, 1, 1,
0.7598314, 1.410034, 1.688303, 0.7529412, 0, 1, 1,
0.7610204, -0.7907164, 3.568928, 0.7568628, 0, 1, 1,
0.7634927, 0.5013289, 2.165776, 0.7647059, 0, 1, 1,
0.7646027, -0.3423019, 2.302328, 0.7686275, 0, 1, 1,
0.7646698, 1.086895, -0.1217116, 0.7764706, 0, 1, 1,
0.7737562, -0.236716, 3.080698, 0.7803922, 0, 1, 1,
0.7863923, 0.4099294, 2.277342, 0.7882353, 0, 1, 1,
0.7879546, -0.4552927, 2.715746, 0.7921569, 0, 1, 1,
0.7940259, 0.2167017, 2.272244, 0.8, 0, 1, 1,
0.8020371, -0.2027063, 2.367974, 0.8078431, 0, 1, 1,
0.8065707, -0.3368092, 1.517938, 0.8117647, 0, 1, 1,
0.817246, -0.2951615, 1.916958, 0.8196079, 0, 1, 1,
0.8256017, -1.131582, 1.824283, 0.8235294, 0, 1, 1,
0.8269926, 1.959998, -1.650509, 0.8313726, 0, 1, 1,
0.8285977, -0.8203567, 2.073746, 0.8352941, 0, 1, 1,
0.8289614, -1.548978, 1.782195, 0.8431373, 0, 1, 1,
0.8332534, 0.8910735, 0.6379613, 0.8470588, 0, 1, 1,
0.845493, -0.05329671, 1.79112, 0.854902, 0, 1, 1,
0.8490267, -0.9526449, 3.610088, 0.8588235, 0, 1, 1,
0.8495549, 0.9796459, -0.3071881, 0.8666667, 0, 1, 1,
0.8620877, -1.235865, 2.50935, 0.8705882, 0, 1, 1,
0.8643592, -0.2648268, 2.804414, 0.8784314, 0, 1, 1,
0.8683128, -0.3514221, 2.93857, 0.8823529, 0, 1, 1,
0.8789932, -0.1266065, 1.077815, 0.8901961, 0, 1, 1,
0.8824659, 1.461611, 0.2936396, 0.8941177, 0, 1, 1,
0.8864747, 1.944082, -0.5696851, 0.9019608, 0, 1, 1,
0.8936283, 0.8957459, 2.117436, 0.9098039, 0, 1, 1,
0.8943149, 1.282085, 1.82251, 0.9137255, 0, 1, 1,
0.8962954, 3.223569, -0.1765966, 0.9215686, 0, 1, 1,
0.9067174, 0.8105075, 0.849444, 0.9254902, 0, 1, 1,
0.907204, -1.767423, 2.891494, 0.9333333, 0, 1, 1,
0.9076127, -1.263641, 2.38194, 0.9372549, 0, 1, 1,
0.9083184, 2.123871, -0.03769376, 0.945098, 0, 1, 1,
0.9232773, 1.798079, 1.048251, 0.9490196, 0, 1, 1,
0.929454, 0.6946009, 0.2843195, 0.9568627, 0, 1, 1,
0.9308544, 0.5269482, 1.61672, 0.9607843, 0, 1, 1,
0.9406393, -0.6732185, 3.393408, 0.9686275, 0, 1, 1,
0.9446167, -0.2363193, 2.187227, 0.972549, 0, 1, 1,
0.946761, -1.3966, 1.749498, 0.9803922, 0, 1, 1,
0.9490747, -0.1035868, 1.933619, 0.9843137, 0, 1, 1,
0.9547401, 2.137255, 1.190175, 0.9921569, 0, 1, 1,
0.9568645, -0.779533, 1.122995, 0.9960784, 0, 1, 1,
0.9632401, 2.629759, 0.2301775, 1, 0, 0.9960784, 1,
0.9703564, 0.469326, 1.077186, 1, 0, 0.9882353, 1,
0.9742823, 0.6652062, 0.8643654, 1, 0, 0.9843137, 1,
0.9759806, 0.5343044, 1.979801, 1, 0, 0.9764706, 1,
0.9773933, -0.9962503, 1.669536, 1, 0, 0.972549, 1,
0.9855812, -0.2416111, 0.9346183, 1, 0, 0.9647059, 1,
0.9899415, 0.7271202, -0.425826, 1, 0, 0.9607843, 1,
0.9902238, 0.6115959, 0.2407827, 1, 0, 0.9529412, 1,
0.9977278, 1.217298, 1.125605, 1, 0, 0.9490196, 1,
0.9981526, 0.1412886, 1.79941, 1, 0, 0.9411765, 1,
0.9994613, 2.858781, 0.4595931, 1, 0, 0.9372549, 1,
1.005523, -0.5239874, 2.365243, 1, 0, 0.9294118, 1,
1.014964, 0.1789371, 2.901759, 1, 0, 0.9254902, 1,
1.017246, -0.246443, 2.908962, 1, 0, 0.9176471, 1,
1.023078, -1.347391, 1.550884, 1, 0, 0.9137255, 1,
1.026418, 0.7704942, 0.5513487, 1, 0, 0.9058824, 1,
1.030757, -0.4649289, 2.958133, 1, 0, 0.9019608, 1,
1.049275, -0.3896273, 0.1727331, 1, 0, 0.8941177, 1,
1.053349, -0.6183529, 0.1880967, 1, 0, 0.8862745, 1,
1.055194, -0.6257576, 2.527236, 1, 0, 0.8823529, 1,
1.06713, 0.9391209, 2.033197, 1, 0, 0.8745098, 1,
1.068188, 1.829219, 1.023127, 1, 0, 0.8705882, 1,
1.080231, 2.366403, -0.09828229, 1, 0, 0.8627451, 1,
1.080595, -1.622142, 2.189623, 1, 0, 0.8588235, 1,
1.082521, -1.124207, 2.010726, 1, 0, 0.8509804, 1,
1.088711, -0.7062595, 1.491367, 1, 0, 0.8470588, 1,
1.090364, -0.8413923, 0.8485883, 1, 0, 0.8392157, 1,
1.092949, -0.3612305, 0.1417134, 1, 0, 0.8352941, 1,
1.093762, 1.006051, 0.04442042, 1, 0, 0.827451, 1,
1.093996, -0.1415024, 1.993322, 1, 0, 0.8235294, 1,
1.095175, 0.3283283, 0.3299274, 1, 0, 0.8156863, 1,
1.099559, -1.548497, 0.8658812, 1, 0, 0.8117647, 1,
1.111752, -0.6550701, 2.548677, 1, 0, 0.8039216, 1,
1.114152, 0.4961437, 2.0719, 1, 0, 0.7960784, 1,
1.11912, -0.1681818, 2.826859, 1, 0, 0.7921569, 1,
1.121953, -0.4174142, 1.248496, 1, 0, 0.7843137, 1,
1.126128, -0.4831774, 3.161798, 1, 0, 0.7803922, 1,
1.126215, 1.392238, -0.2580646, 1, 0, 0.772549, 1,
1.128005, 0.6172543, -0.2520278, 1, 0, 0.7686275, 1,
1.137763, -0.4107672, 1.9851, 1, 0, 0.7607843, 1,
1.14807, -1.566185, 2.192656, 1, 0, 0.7568628, 1,
1.150946, 2.337789, 2.283617, 1, 0, 0.7490196, 1,
1.151135, -1.171899, 3.39015, 1, 0, 0.7450981, 1,
1.155945, 1.115067, 0.04583476, 1, 0, 0.7372549, 1,
1.157722, -0.925045, 2.746907, 1, 0, 0.7333333, 1,
1.163423, 0.6534643, 2.042524, 1, 0, 0.7254902, 1,
1.164006, 0.6221853, 0.6255111, 1, 0, 0.7215686, 1,
1.164846, 0.3119476, 0.6361037, 1, 0, 0.7137255, 1,
1.167789, -0.680266, 4.595426, 1, 0, 0.7098039, 1,
1.172154, 0.0618065, 1.459357, 1, 0, 0.7019608, 1,
1.174935, 0.2833445, 1.784602, 1, 0, 0.6941177, 1,
1.175469, 1.738143, -0.9068398, 1, 0, 0.6901961, 1,
1.184206, -0.921761, 2.495358, 1, 0, 0.682353, 1,
1.18447, -1.070779, 2.442003, 1, 0, 0.6784314, 1,
1.190182, 0.1741902, -0.4011733, 1, 0, 0.6705883, 1,
1.217703, 1.266177, 0.8397768, 1, 0, 0.6666667, 1,
1.222273, -0.852622, 2.347765, 1, 0, 0.6588235, 1,
1.222666, 0.6100889, 0.3373944, 1, 0, 0.654902, 1,
1.229229, 0.6141471, -0.3410532, 1, 0, 0.6470588, 1,
1.238668, -0.6839859, 0.7995818, 1, 0, 0.6431373, 1,
1.240165, 0.9152726, 1.293323, 1, 0, 0.6352941, 1,
1.241529, -1.973193, 2.312335, 1, 0, 0.6313726, 1,
1.2423, 0.2879212, 3.071023, 1, 0, 0.6235294, 1,
1.252595, -2.020484, 3.195735, 1, 0, 0.6196079, 1,
1.259007, -0.5679987, 1.028447, 1, 0, 0.6117647, 1,
1.261701, -0.5798372, 2.418951, 1, 0, 0.6078432, 1,
1.264814, -2.264819, 2.554087, 1, 0, 0.6, 1,
1.265848, 0.957643, -0.2574958, 1, 0, 0.5921569, 1,
1.297117, -0.4281303, 2.732114, 1, 0, 0.5882353, 1,
1.300688, -0.3887241, 1.696032, 1, 0, 0.5803922, 1,
1.312494, -0.2542594, 2.386497, 1, 0, 0.5764706, 1,
1.315504, -0.114689, 0.1947708, 1, 0, 0.5686275, 1,
1.315715, 0.2621377, 2.818194, 1, 0, 0.5647059, 1,
1.321778, -0.5391597, 4.414711, 1, 0, 0.5568628, 1,
1.332395, -0.558154, 2.832683, 1, 0, 0.5529412, 1,
1.335224, -0.7599765, 2.252693, 1, 0, 0.5450981, 1,
1.34368, -0.4716925, 0.2348517, 1, 0, 0.5411765, 1,
1.351977, 0.5833908, 2.239517, 1, 0, 0.5333334, 1,
1.353772, 1.515615, 1.245817, 1, 0, 0.5294118, 1,
1.354023, -1.016606, 2.35199, 1, 0, 0.5215687, 1,
1.355864, 0.6306419, 1.748603, 1, 0, 0.5176471, 1,
1.356002, -0.1959155, -0.608786, 1, 0, 0.509804, 1,
1.361443, -0.3331993, 1.370982, 1, 0, 0.5058824, 1,
1.366176, 0.06843083, 1.460505, 1, 0, 0.4980392, 1,
1.373953, 0.4792297, 1.385381, 1, 0, 0.4901961, 1,
1.374755, -1.369619, 3.263401, 1, 0, 0.4862745, 1,
1.379172, 0.1846071, 1.223533, 1, 0, 0.4784314, 1,
1.387809, -1.869814, 3.110842, 1, 0, 0.4745098, 1,
1.389493, 2.253573, 0.2400386, 1, 0, 0.4666667, 1,
1.389708, 0.3031124, 0.3570099, 1, 0, 0.4627451, 1,
1.390804, -1.463537, 0.9202321, 1, 0, 0.454902, 1,
1.40385, -1.875849, 1.815098, 1, 0, 0.4509804, 1,
1.404805, -0.7247573, 2.306278, 1, 0, 0.4431373, 1,
1.418454, -1.238886, -1.164258, 1, 0, 0.4392157, 1,
1.419619, 1.13318, 0.6983443, 1, 0, 0.4313726, 1,
1.425488, -1.057243, 0.9816984, 1, 0, 0.427451, 1,
1.428819, 1.756732, 1.085071, 1, 0, 0.4196078, 1,
1.436747, -1.193201, 2.539851, 1, 0, 0.4156863, 1,
1.438446, -0.3360455, 1.459998, 1, 0, 0.4078431, 1,
1.445382, -0.4921936, 1.701564, 1, 0, 0.4039216, 1,
1.455533, 0.4672962, 2.980175, 1, 0, 0.3960784, 1,
1.456628, 1.322483, -0.5563272, 1, 0, 0.3882353, 1,
1.459758, 0.3503842, -0.7675586, 1, 0, 0.3843137, 1,
1.464081, 0.5203409, 1.701155, 1, 0, 0.3764706, 1,
1.474349, 0.05775232, 2.170362, 1, 0, 0.372549, 1,
1.480056, -0.7853658, 2.96989, 1, 0, 0.3647059, 1,
1.496092, 1.851064, 0.6952115, 1, 0, 0.3607843, 1,
1.504425, -1.036253, -0.5391632, 1, 0, 0.3529412, 1,
1.506958, 0.6641346, 1.638076, 1, 0, 0.3490196, 1,
1.52792, -0.5454492, 1.752296, 1, 0, 0.3411765, 1,
1.555785, -0.8353951, 2.906472, 1, 0, 0.3372549, 1,
1.58088, -0.1587988, 2.223803, 1, 0, 0.3294118, 1,
1.594116, -0.3549948, 2.038373, 1, 0, 0.3254902, 1,
1.595877, -0.773101, 2.341228, 1, 0, 0.3176471, 1,
1.609206, -0.8751769, 3.552855, 1, 0, 0.3137255, 1,
1.610054, 1.186719, 0.327655, 1, 0, 0.3058824, 1,
1.61454, -0.5806736, 1.492683, 1, 0, 0.2980392, 1,
1.614983, 0.9457549, 1.047971, 1, 0, 0.2941177, 1,
1.633896, -1.107436, 1.525465, 1, 0, 0.2862745, 1,
1.639902, 0.1345454, 2.413393, 1, 0, 0.282353, 1,
1.644685, 0.2838795, 1.311518, 1, 0, 0.2745098, 1,
1.651129, 0.5160922, 0.7433665, 1, 0, 0.2705882, 1,
1.669192, 0.0908335, 1.659527, 1, 0, 0.2627451, 1,
1.670972, -1.148487, 2.572118, 1, 0, 0.2588235, 1,
1.67386, 0.5989898, 2.53042, 1, 0, 0.2509804, 1,
1.67543, 1.659627, 1.78922, 1, 0, 0.2470588, 1,
1.726285, 1.440269, 1.225793, 1, 0, 0.2392157, 1,
1.745931, -0.09707034, 1.680923, 1, 0, 0.2352941, 1,
1.76959, -1.728609, 3.561463, 1, 0, 0.227451, 1,
1.800854, -0.02376898, 0.9161722, 1, 0, 0.2235294, 1,
1.807652, -0.6214643, -0.3527359, 1, 0, 0.2156863, 1,
1.825758, 0.5994241, -0.2663589, 1, 0, 0.2117647, 1,
1.828598, 0.8831062, 0.1890287, 1, 0, 0.2039216, 1,
1.835271, -0.02594775, 1.897562, 1, 0, 0.1960784, 1,
1.858171, 0.05253953, 2.576666, 1, 0, 0.1921569, 1,
1.869842, -0.3516771, 3.313151, 1, 0, 0.1843137, 1,
1.875533, 0.4049494, 3.592025, 1, 0, 0.1803922, 1,
1.878617, -0.2014375, 0.1650791, 1, 0, 0.172549, 1,
1.884404, -1.107078, 2.502034, 1, 0, 0.1686275, 1,
1.887899, -1.321206, 1.623613, 1, 0, 0.1607843, 1,
1.890045, -1.365157, 1.106735, 1, 0, 0.1568628, 1,
1.912678, 1.007014, -0.01294718, 1, 0, 0.1490196, 1,
1.9355, 0.9864382, 1.860278, 1, 0, 0.145098, 1,
1.948813, -1.106484, 3.352883, 1, 0, 0.1372549, 1,
1.974604, -0.2877298, 1.592611, 1, 0, 0.1333333, 1,
2.007989, 0.9879307, 0.7304615, 1, 0, 0.1254902, 1,
2.031503, -0.6785002, 2.209301, 1, 0, 0.1215686, 1,
2.117877, 0.2430814, 2.847324, 1, 0, 0.1137255, 1,
2.119603, 0.01544819, 3.790673, 1, 0, 0.1098039, 1,
2.125188, 2.324644, -0.3863135, 1, 0, 0.1019608, 1,
2.160602, -1.942242, 2.506083, 1, 0, 0.09411765, 1,
2.193975, -0.5431225, 1.070055, 1, 0, 0.09019608, 1,
2.259742, 1.359402, 1.503819, 1, 0, 0.08235294, 1,
2.326266, 0.9551507, -0.2775829, 1, 0, 0.07843138, 1,
2.398945, 0.7840467, 1.433735, 1, 0, 0.07058824, 1,
2.399226, -0.8562505, 2.613255, 1, 0, 0.06666667, 1,
2.40004, 0.6480919, 0.976827, 1, 0, 0.05882353, 1,
2.405966, -0.624454, 1.78441, 1, 0, 0.05490196, 1,
2.417879, 0.03052857, 3.35877, 1, 0, 0.04705882, 1,
2.534203, 1.610309, 0.3656801, 1, 0, 0.04313726, 1,
2.550302, 1.362663, -0.2439163, 1, 0, 0.03529412, 1,
2.560434, 0.410598, 1.313717, 1, 0, 0.03137255, 1,
2.768115, 0.8889888, 1.91612, 1, 0, 0.02352941, 1,
2.771574, 0.7230071, 1.471743, 1, 0, 0.01960784, 1,
2.827739, 1.597546, 1.813975, 1, 0, 0.01176471, 1,
3.188037, 0.0433564, 1.269903, 1, 0, 0.007843138, 1
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
0.1877933, -4.26153, -7.277316, 0, -0.5, 0.5, 0.5,
0.1877933, -4.26153, -7.277316, 1, -0.5, 0.5, 0.5,
0.1877933, -4.26153, -7.277316, 1, 1.5, 0.5, 0.5,
0.1877933, -4.26153, -7.277316, 0, 1.5, 0.5, 0.5
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
-3.829533, 0.4145584, -7.277316, 0, -0.5, 0.5, 0.5,
-3.829533, 0.4145584, -7.277316, 1, -0.5, 0.5, 0.5,
-3.829533, 0.4145584, -7.277316, 1, 1.5, 0.5, 0.5,
-3.829533, 0.4145584, -7.277316, 0, 1.5, 0.5, 0.5
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
-3.829533, -4.26153, 0.2332773, 0, -0.5, 0.5, 0.5,
-3.829533, -4.26153, 0.2332773, 1, -0.5, 0.5, 0.5,
-3.829533, -4.26153, 0.2332773, 1, 1.5, 0.5, 0.5,
-3.829533, -4.26153, 0.2332773, 0, 1.5, 0.5, 0.5
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
-2, -3.182433, -5.544102,
3, -3.182433, -5.544102,
-2, -3.182433, -5.544102,
-2, -3.362283, -5.832971,
-1, -3.182433, -5.544102,
-1, -3.362283, -5.832971,
0, -3.182433, -5.544102,
0, -3.362283, -5.832971,
1, -3.182433, -5.544102,
1, -3.362283, -5.832971,
2, -3.182433, -5.544102,
2, -3.362283, -5.832971,
3, -3.182433, -5.544102,
3, -3.362283, -5.832971
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
-2, -3.721982, -6.410709, 0, -0.5, 0.5, 0.5,
-2, -3.721982, -6.410709, 1, -0.5, 0.5, 0.5,
-2, -3.721982, -6.410709, 1, 1.5, 0.5, 0.5,
-2, -3.721982, -6.410709, 0, 1.5, 0.5, 0.5,
-1, -3.721982, -6.410709, 0, -0.5, 0.5, 0.5,
-1, -3.721982, -6.410709, 1, -0.5, 0.5, 0.5,
-1, -3.721982, -6.410709, 1, 1.5, 0.5, 0.5,
-1, -3.721982, -6.410709, 0, 1.5, 0.5, 0.5,
0, -3.721982, -6.410709, 0, -0.5, 0.5, 0.5,
0, -3.721982, -6.410709, 1, -0.5, 0.5, 0.5,
0, -3.721982, -6.410709, 1, 1.5, 0.5, 0.5,
0, -3.721982, -6.410709, 0, 1.5, 0.5, 0.5,
1, -3.721982, -6.410709, 0, -0.5, 0.5, 0.5,
1, -3.721982, -6.410709, 1, -0.5, 0.5, 0.5,
1, -3.721982, -6.410709, 1, 1.5, 0.5, 0.5,
1, -3.721982, -6.410709, 0, 1.5, 0.5, 0.5,
2, -3.721982, -6.410709, 0, -0.5, 0.5, 0.5,
2, -3.721982, -6.410709, 1, -0.5, 0.5, 0.5,
2, -3.721982, -6.410709, 1, 1.5, 0.5, 0.5,
2, -3.721982, -6.410709, 0, 1.5, 0.5, 0.5,
3, -3.721982, -6.410709, 0, -0.5, 0.5, 0.5,
3, -3.721982, -6.410709, 1, -0.5, 0.5, 0.5,
3, -3.721982, -6.410709, 1, 1.5, 0.5, 0.5,
3, -3.721982, -6.410709, 0, 1.5, 0.5, 0.5
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
-2.902458, -3, -5.544102,
-2.902458, 3, -5.544102,
-2.902458, -3, -5.544102,
-3.056971, -3, -5.832971,
-2.902458, -2, -5.544102,
-3.056971, -2, -5.832971,
-2.902458, -1, -5.544102,
-3.056971, -1, -5.832971,
-2.902458, 0, -5.544102,
-3.056971, 0, -5.832971,
-2.902458, 1, -5.544102,
-3.056971, 1, -5.832971,
-2.902458, 2, -5.544102,
-3.056971, 2, -5.832971,
-2.902458, 3, -5.544102,
-3.056971, 3, -5.832971
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
-3.365996, -3, -6.410709, 0, -0.5, 0.5, 0.5,
-3.365996, -3, -6.410709, 1, -0.5, 0.5, 0.5,
-3.365996, -3, -6.410709, 1, 1.5, 0.5, 0.5,
-3.365996, -3, -6.410709, 0, 1.5, 0.5, 0.5,
-3.365996, -2, -6.410709, 0, -0.5, 0.5, 0.5,
-3.365996, -2, -6.410709, 1, -0.5, 0.5, 0.5,
-3.365996, -2, -6.410709, 1, 1.5, 0.5, 0.5,
-3.365996, -2, -6.410709, 0, 1.5, 0.5, 0.5,
-3.365996, -1, -6.410709, 0, -0.5, 0.5, 0.5,
-3.365996, -1, -6.410709, 1, -0.5, 0.5, 0.5,
-3.365996, -1, -6.410709, 1, 1.5, 0.5, 0.5,
-3.365996, -1, -6.410709, 0, 1.5, 0.5, 0.5,
-3.365996, 0, -6.410709, 0, -0.5, 0.5, 0.5,
-3.365996, 0, -6.410709, 1, -0.5, 0.5, 0.5,
-3.365996, 0, -6.410709, 1, 1.5, 0.5, 0.5,
-3.365996, 0, -6.410709, 0, 1.5, 0.5, 0.5,
-3.365996, 1, -6.410709, 0, -0.5, 0.5, 0.5,
-3.365996, 1, -6.410709, 1, -0.5, 0.5, 0.5,
-3.365996, 1, -6.410709, 1, 1.5, 0.5, 0.5,
-3.365996, 1, -6.410709, 0, 1.5, 0.5, 0.5,
-3.365996, 2, -6.410709, 0, -0.5, 0.5, 0.5,
-3.365996, 2, -6.410709, 1, -0.5, 0.5, 0.5,
-3.365996, 2, -6.410709, 1, 1.5, 0.5, 0.5,
-3.365996, 2, -6.410709, 0, 1.5, 0.5, 0.5,
-3.365996, 3, -6.410709, 0, -0.5, 0.5, 0.5,
-3.365996, 3, -6.410709, 1, -0.5, 0.5, 0.5,
-3.365996, 3, -6.410709, 1, 1.5, 0.5, 0.5,
-3.365996, 3, -6.410709, 0, 1.5, 0.5, 0.5
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
-2.902458, -3.182433, -4,
-2.902458, -3.182433, 4,
-2.902458, -3.182433, -4,
-3.056971, -3.362283, -4,
-2.902458, -3.182433, -2,
-3.056971, -3.362283, -2,
-2.902458, -3.182433, 0,
-3.056971, -3.362283, 0,
-2.902458, -3.182433, 2,
-3.056971, -3.362283, 2,
-2.902458, -3.182433, 4,
-3.056971, -3.362283, 4
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
-3.365996, -3.721982, -4, 0, -0.5, 0.5, 0.5,
-3.365996, -3.721982, -4, 1, -0.5, 0.5, 0.5,
-3.365996, -3.721982, -4, 1, 1.5, 0.5, 0.5,
-3.365996, -3.721982, -4, 0, 1.5, 0.5, 0.5,
-3.365996, -3.721982, -2, 0, -0.5, 0.5, 0.5,
-3.365996, -3.721982, -2, 1, -0.5, 0.5, 0.5,
-3.365996, -3.721982, -2, 1, 1.5, 0.5, 0.5,
-3.365996, -3.721982, -2, 0, 1.5, 0.5, 0.5,
-3.365996, -3.721982, 0, 0, -0.5, 0.5, 0.5,
-3.365996, -3.721982, 0, 1, -0.5, 0.5, 0.5,
-3.365996, -3.721982, 0, 1, 1.5, 0.5, 0.5,
-3.365996, -3.721982, 0, 0, 1.5, 0.5, 0.5,
-3.365996, -3.721982, 2, 0, -0.5, 0.5, 0.5,
-3.365996, -3.721982, 2, 1, -0.5, 0.5, 0.5,
-3.365996, -3.721982, 2, 1, 1.5, 0.5, 0.5,
-3.365996, -3.721982, 2, 0, 1.5, 0.5, 0.5,
-3.365996, -3.721982, 4, 0, -0.5, 0.5, 0.5,
-3.365996, -3.721982, 4, 1, -0.5, 0.5, 0.5,
-3.365996, -3.721982, 4, 1, 1.5, 0.5, 0.5,
-3.365996, -3.721982, 4, 0, 1.5, 0.5, 0.5
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
-2.902458, -3.182433, -5.544102,
-2.902458, 4.01155, -5.544102,
-2.902458, -3.182433, 6.010656,
-2.902458, 4.01155, 6.010656,
-2.902458, -3.182433, -5.544102,
-2.902458, -3.182433, 6.010656,
-2.902458, 4.01155, -5.544102,
-2.902458, 4.01155, 6.010656,
-2.902458, -3.182433, -5.544102,
3.278044, -3.182433, -5.544102,
-2.902458, -3.182433, 6.010656,
3.278044, -3.182433, 6.010656,
-2.902458, 4.01155, -5.544102,
3.278044, 4.01155, -5.544102,
-2.902458, 4.01155, 6.010656,
3.278044, 4.01155, 6.010656,
3.278044, -3.182433, -5.544102,
3.278044, 4.01155, -5.544102,
3.278044, -3.182433, 6.010656,
3.278044, 4.01155, 6.010656,
3.278044, -3.182433, -5.544102,
3.278044, -3.182433, 6.010656,
3.278044, 4.01155, -5.544102,
3.278044, 4.01155, 6.010656
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
var radius = 7.98233;
var distance = 35.51429;
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
mvMatrix.translate( -0.1877933, -0.4145584, -0.2332773 );
mvMatrix.scale( 1.396432, 1.199704, 0.7469348 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.51429);
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
cyprazine<-read.table("cyprazine.xyz")
```

```
## Error in read.table("cyprazine.xyz"): no lines available in input
```

```r
x<-cyprazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyprazine' not found
```

```r
y<-cyprazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyprazine' not found
```

```r
z<-cyprazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyprazine' not found
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
-2.812451, -0.7521835, -0.05076685, 0, 0, 1, 1, 1,
-2.804157, 0.4208083, -0.7995458, 1, 0, 0, 1, 1,
-2.607349, -0.4958918, -4.071495, 1, 0, 0, 1, 1,
-2.57652, 0.3996753, -0.7288147, 1, 0, 0, 1, 1,
-2.501715, -0.04910499, -1.296631, 1, 0, 0, 1, 1,
-2.499542, 0.59433, -0.5739783, 1, 0, 0, 1, 1,
-2.484219, -1.139241, -1.511124, 0, 0, 0, 1, 1,
-2.480374, -0.1447689, -0.6826792, 0, 0, 0, 1, 1,
-2.474168, 0.7340083, -2.337934, 0, 0, 0, 1, 1,
-2.472589, 1.216687, 0.02248045, 0, 0, 0, 1, 1,
-2.453332, 0.1332018, -2.178991, 0, 0, 0, 1, 1,
-2.439542, 0.2787413, -0.6592482, 0, 0, 0, 1, 1,
-2.415888, 1.009741, -1.241032, 0, 0, 0, 1, 1,
-2.414835, 1.389453, -2.047635, 1, 1, 1, 1, 1,
-2.382528, 1.121265, -2.530839, 1, 1, 1, 1, 1,
-2.381799, 1.186786, -0.9943332, 1, 1, 1, 1, 1,
-2.36984, -0.3458348, -2.36359, 1, 1, 1, 1, 1,
-2.336678, -0.7299499, -2.840883, 1, 1, 1, 1, 1,
-2.316723, 0.8264225, 0.2726043, 1, 1, 1, 1, 1,
-2.290474, 1.134132, -0.6992745, 1, 1, 1, 1, 1,
-2.287959, 0.1652652, -2.843539, 1, 1, 1, 1, 1,
-2.248942, 0.9239905, 0.01594907, 1, 1, 1, 1, 1,
-2.227704, -0.0001950636, -1.090266, 1, 1, 1, 1, 1,
-2.201303, -2.261553, -3.951255, 1, 1, 1, 1, 1,
-2.139997, -0.7008284, -0.312825, 1, 1, 1, 1, 1,
-2.046023, -0.3613581, -1.938825, 1, 1, 1, 1, 1,
-2.044121, -0.05062772, -0.9656872, 1, 1, 1, 1, 1,
-1.997093, 1.447378, 0.1250504, 1, 1, 1, 1, 1,
-1.992336, 0.8676351, -0.3700847, 0, 0, 1, 1, 1,
-1.955575, -0.7825717, -3.718092, 1, 0, 0, 1, 1,
-1.952633, -0.3581491, -0.4067594, 1, 0, 0, 1, 1,
-1.938403, 1.06077, -3.169674, 1, 0, 0, 1, 1,
-1.92314, 3.906783, 0.7991697, 1, 0, 0, 1, 1,
-1.891168, 0.5772504, -0.5290174, 1, 0, 0, 1, 1,
-1.859958, 0.2214211, -1.553129, 0, 0, 0, 1, 1,
-1.857228, 0.6551124, -2.678754, 0, 0, 0, 1, 1,
-1.834899, 0.1120783, 0.03254107, 0, 0, 0, 1, 1,
-1.832294, -0.0342037, -1.859545, 0, 0, 0, 1, 1,
-1.805076, 1.276262, -0.08966894, 0, 0, 0, 1, 1,
-1.801196, -1.124175, -2.398616, 0, 0, 0, 1, 1,
-1.800067, -0.5147145, -1.148765, 0, 0, 0, 1, 1,
-1.786769, -0.1222918, -0.7261683, 1, 1, 1, 1, 1,
-1.779823, 0.5420029, -0.9115197, 1, 1, 1, 1, 1,
-1.763128, -0.009501646, -1.568019, 1, 1, 1, 1, 1,
-1.756281, 1.117488, -0.7425432, 1, 1, 1, 1, 1,
-1.740561, 1.084333, -0.951255, 1, 1, 1, 1, 1,
-1.71923, -0.02734565, -3.070375, 1, 1, 1, 1, 1,
-1.704573, -0.8899444, -2.447738, 1, 1, 1, 1, 1,
-1.693658, -0.8651497, -2.766437, 1, 1, 1, 1, 1,
-1.693639, 0.2748935, 1.406616, 1, 1, 1, 1, 1,
-1.686939, -0.8529658, -5.375829, 1, 1, 1, 1, 1,
-1.671212, -1.402432, -1.652122, 1, 1, 1, 1, 1,
-1.667051, -0.3312118, -1.01476, 1, 1, 1, 1, 1,
-1.663295, -1.42348, -3.406766, 1, 1, 1, 1, 1,
-1.662256, 1.402037, -0.7350379, 1, 1, 1, 1, 1,
-1.621639, 0.3378952, -1.047545, 1, 1, 1, 1, 1,
-1.613009, -0.9482654, -1.801064, 0, 0, 1, 1, 1,
-1.60058, -0.5758737, -3.365599, 1, 0, 0, 1, 1,
-1.591842, 0.7573714, -1.23604, 1, 0, 0, 1, 1,
-1.58594, 0.5947466, 0.2176112, 1, 0, 0, 1, 1,
-1.58007, 0.0259175, -1.550612, 1, 0, 0, 1, 1,
-1.557941, -0.8158649, -1.865513, 1, 0, 0, 1, 1,
-1.545842, -1.249023, -2.123427, 0, 0, 0, 1, 1,
-1.528481, 1.147587, -2.057761, 0, 0, 0, 1, 1,
-1.516262, -2.011955, -3.18289, 0, 0, 0, 1, 1,
-1.511577, -0.8321241, -1.254369, 0, 0, 0, 1, 1,
-1.506279, 0.9693754, -1.351231, 0, 0, 0, 1, 1,
-1.497638, 0.7213492, -0.002316337, 0, 0, 0, 1, 1,
-1.49029, 1.101418, -1.513475, 0, 0, 0, 1, 1,
-1.487216, -0.6087813, -1.56997, 1, 1, 1, 1, 1,
-1.486782, -0.724582, -1.700614, 1, 1, 1, 1, 1,
-1.481431, -0.535238, -2.852225, 1, 1, 1, 1, 1,
-1.470203, 0.6268123, -2.027743, 1, 1, 1, 1, 1,
-1.465389, 0.1395106, -1.843546, 1, 1, 1, 1, 1,
-1.44979, -0.07585826, 0.2018301, 1, 1, 1, 1, 1,
-1.439773, -0.7491884, -1.4835, 1, 1, 1, 1, 1,
-1.439049, 1.248369, 0.6193354, 1, 1, 1, 1, 1,
-1.438274, -1.223035, -2.118518, 1, 1, 1, 1, 1,
-1.420865, 0.3442462, -2.5651, 1, 1, 1, 1, 1,
-1.413304, -0.002277157, -1.189666, 1, 1, 1, 1, 1,
-1.408915, -0.04062536, 0.6478895, 1, 1, 1, 1, 1,
-1.391536, 0.5541744, -2.333543, 1, 1, 1, 1, 1,
-1.379669, 1.230259, -0.1367116, 1, 1, 1, 1, 1,
-1.37469, 0.3323938, -1.421482, 1, 1, 1, 1, 1,
-1.355611, -0.9086402, -2.618363, 0, 0, 1, 1, 1,
-1.350201, -0.8982072, -3.467714, 1, 0, 0, 1, 1,
-1.344107, -0.6129788, -3.230513, 1, 0, 0, 1, 1,
-1.332503, -1.079984, -2.67827, 1, 0, 0, 1, 1,
-1.332242, -0.6289416, -1.519435, 1, 0, 0, 1, 1,
-1.323466, 1.538575, 0.8813863, 1, 0, 0, 1, 1,
-1.309807, 0.1837873, -1.784642, 0, 0, 0, 1, 1,
-1.306798, 1.154739, -1.312464, 0, 0, 0, 1, 1,
-1.303312, 0.1109414, -2.728903, 0, 0, 0, 1, 1,
-1.30026, 1.130528, -0.9414253, 0, 0, 0, 1, 1,
-1.292665, 0.402083, -0.9777752, 0, 0, 0, 1, 1,
-1.288387, -0.3602784, -1.506955, 0, 0, 0, 1, 1,
-1.277694, -0.4717921, -3.253525, 0, 0, 0, 1, 1,
-1.275152, -0.2451556, -1.201158, 1, 1, 1, 1, 1,
-1.263345, -0.1632196, -2.339704, 1, 1, 1, 1, 1,
-1.255484, 0.2574435, -0.9123871, 1, 1, 1, 1, 1,
-1.243695, -0.01486564, -0.4867123, 1, 1, 1, 1, 1,
-1.232416, -1.41914, -4.25037, 1, 1, 1, 1, 1,
-1.226527, -0.5561616, -2.724098, 1, 1, 1, 1, 1,
-1.222423, 0.8830373, -0.417461, 1, 1, 1, 1, 1,
-1.216027, -0.507339, 0.1507476, 1, 1, 1, 1, 1,
-1.215054, -0.8664104, -4.354555, 1, 1, 1, 1, 1,
-1.213891, 1.367981, 1.044167, 1, 1, 1, 1, 1,
-1.199136, -1.204506, -2.092898, 1, 1, 1, 1, 1,
-1.197552, -0.2763825, -1.51311, 1, 1, 1, 1, 1,
-1.193137, 1.084767, -1.47767, 1, 1, 1, 1, 1,
-1.190313, -0.7292678, -1.132568, 1, 1, 1, 1, 1,
-1.184468, -0.3968418, -1.643326, 1, 1, 1, 1, 1,
-1.16871, 0.9887532, -0.7626252, 0, 0, 1, 1, 1,
-1.167618, -0.2446907, -1.578187, 1, 0, 0, 1, 1,
-1.162038, 0.6430378, -0.4707359, 1, 0, 0, 1, 1,
-1.159568, -0.5080458, -2.285419, 1, 0, 0, 1, 1,
-1.155755, -0.4703454, -1.853505, 1, 0, 0, 1, 1,
-1.147781, -0.1098952, -1.259195, 1, 0, 0, 1, 1,
-1.14668, -0.5504636, -3.419999, 0, 0, 0, 1, 1,
-1.145275, -1.824041, -3.797419, 0, 0, 0, 1, 1,
-1.139497, -1.74856, -3.719981, 0, 0, 0, 1, 1,
-1.138411, -0.7435293, -1.174219, 0, 0, 0, 1, 1,
-1.129732, -0.3990722, 0.2470555, 0, 0, 0, 1, 1,
-1.128336, 0.4622198, -0.2321714, 0, 0, 0, 1, 1,
-1.121838, -0.5280452, -1.993512, 0, 0, 0, 1, 1,
-1.120456, -0.9822562, -1.688337, 1, 1, 1, 1, 1,
-1.120278, -0.1048108, -1.534664, 1, 1, 1, 1, 1,
-1.11574, 0.5072163, -1.353838, 1, 1, 1, 1, 1,
-1.102952, 0.4449826, -1.558293, 1, 1, 1, 1, 1,
-1.097611, 1.538403, 0.2915872, 1, 1, 1, 1, 1,
-1.080968, 1.681776, -1.064981, 1, 1, 1, 1, 1,
-1.076538, -0.06249658, -0.1813963, 1, 1, 1, 1, 1,
-1.064877, -0.9039017, -0.8808807, 1, 1, 1, 1, 1,
-1.062933, -1.281881, -4.260869, 1, 1, 1, 1, 1,
-1.062223, 0.4329099, -0.4978078, 1, 1, 1, 1, 1,
-1.059743, -0.8667095, -3.042912, 1, 1, 1, 1, 1,
-1.056882, -0.1337097, -1.092063, 1, 1, 1, 1, 1,
-1.04975, -0.6142625, -2.298919, 1, 1, 1, 1, 1,
-1.040196, -0.3281465, -1.804075, 1, 1, 1, 1, 1,
-1.032435, -1.276189, -1.139119, 1, 1, 1, 1, 1,
-1.032402, -0.3490722, -1.769881, 0, 0, 1, 1, 1,
-1.031948, 2.917097, -0.6252321, 1, 0, 0, 1, 1,
-1.026544, 0.7147231, -1.317834, 1, 0, 0, 1, 1,
-1.025662, -1.20197, -3.555156, 1, 0, 0, 1, 1,
-1.012658, 0.004870509, 0.07437064, 1, 0, 0, 1, 1,
-1.006751, -0.1838656, -1.050282, 1, 0, 0, 1, 1,
-1.006633, 0.8999625, -2.072457, 0, 0, 0, 1, 1,
-1.005884, -0.3548188, -0.4099146, 0, 0, 0, 1, 1,
-0.992658, 0.242981, -2.557528, 0, 0, 0, 1, 1,
-0.9923879, 0.2677306, -1.290365, 0, 0, 0, 1, 1,
-0.9872864, -1.717612, -0.1639326, 0, 0, 0, 1, 1,
-0.979438, -1.090712, -1.120018, 0, 0, 0, 1, 1,
-0.9746557, -0.2595255, -2.113291, 0, 0, 0, 1, 1,
-0.9734198, -0.4697888, -2.458037, 1, 1, 1, 1, 1,
-0.9697994, 0.3717395, -1.122222, 1, 1, 1, 1, 1,
-0.9693851, 0.8310086, -0.518335, 1, 1, 1, 1, 1,
-0.9602076, 1.297203, -0.4544228, 1, 1, 1, 1, 1,
-0.9600852, 0.2196017, -0.1167293, 1, 1, 1, 1, 1,
-0.9580578, 1.467364, -0.7951047, 1, 1, 1, 1, 1,
-0.9549948, 0.5831953, -1.384534, 1, 1, 1, 1, 1,
-0.9452966, 1.101508, -1.902845, 1, 1, 1, 1, 1,
-0.9439538, -0.7247059, -3.236912, 1, 1, 1, 1, 1,
-0.941172, 0.4734333, 0.01696194, 1, 1, 1, 1, 1,
-0.9387808, -0.7799069, -1.530283, 1, 1, 1, 1, 1,
-0.9381194, 0.4638476, -0.9558234, 1, 1, 1, 1, 1,
-0.9364502, 1.224369, -1.78688, 1, 1, 1, 1, 1,
-0.9340426, 0.02590783, -1.701358, 1, 1, 1, 1, 1,
-0.9335888, -1.510065, -2.990717, 1, 1, 1, 1, 1,
-0.9302264, 0.372673, -1.444515, 0, 0, 1, 1, 1,
-0.9273126, -0.004135747, -0.01719731, 1, 0, 0, 1, 1,
-0.9234513, 0.06963508, -0.9775792, 1, 0, 0, 1, 1,
-0.9196938, 0.5845694, -0.8403106, 1, 0, 0, 1, 1,
-0.9195119, -0.429398, -0.697478, 1, 0, 0, 1, 1,
-0.9141904, -0.07504104, -1.874573, 1, 0, 0, 1, 1,
-0.9025106, -1.08518, -2.060808, 0, 0, 0, 1, 1,
-0.8980922, 0.2500216, 0.4004139, 0, 0, 0, 1, 1,
-0.8907673, -0.5502653, -4.8922, 0, 0, 0, 1, 1,
-0.8863012, -1.357472, -0.4850973, 0, 0, 0, 1, 1,
-0.8839467, -0.5658898, -1.976389, 0, 0, 0, 1, 1,
-0.8835407, -0.8444062, -2.143922, 0, 0, 0, 1, 1,
-0.8805949, 0.9985805, -0.5476152, 0, 0, 0, 1, 1,
-0.8774627, 1.379019, -1.36789, 1, 1, 1, 1, 1,
-0.8770288, -0.6541221, -2.878352, 1, 1, 1, 1, 1,
-0.8737786, -0.3718316, -1.030778, 1, 1, 1, 1, 1,
-0.8727993, -0.4673623, -2.809417, 1, 1, 1, 1, 1,
-0.8673024, -0.5715818, -1.94603, 1, 1, 1, 1, 1,
-0.8635498, 0.4496794, -0.3032641, 1, 1, 1, 1, 1,
-0.861524, -1.076554, -1.996488, 1, 1, 1, 1, 1,
-0.8544358, 0.799755, -1.69178, 1, 1, 1, 1, 1,
-0.8525919, 1.386261, -1.729766, 1, 1, 1, 1, 1,
-0.8474713, 1.596456, -0.3896142, 1, 1, 1, 1, 1,
-0.8416595, -1.104473, -2.056234, 1, 1, 1, 1, 1,
-0.8408533, 0.2368203, -2.177644, 1, 1, 1, 1, 1,
-0.8406466, 1.120975, 0.7982677, 1, 1, 1, 1, 1,
-0.8357484, 1.158581, -0.9476355, 1, 1, 1, 1, 1,
-0.8346224, -1.412918, -3.174484, 1, 1, 1, 1, 1,
-0.824992, 2.299133, -0.7346591, 0, 0, 1, 1, 1,
-0.8227708, -0.8634333, -2.348317, 1, 0, 0, 1, 1,
-0.8178848, -0.377692, -3.966763, 1, 0, 0, 1, 1,
-0.8116239, 0.06006498, -2.574299, 1, 0, 0, 1, 1,
-0.8109695, 0.5388427, -1.85217, 1, 0, 0, 1, 1,
-0.805579, 0.05941443, -0.6210094, 1, 0, 0, 1, 1,
-0.7982493, 0.4608631, -1.539313, 0, 0, 0, 1, 1,
-0.7958106, -0.1716175, -2.492085, 0, 0, 0, 1, 1,
-0.7932822, 0.09360697, 0.469966, 0, 0, 0, 1, 1,
-0.7890668, 0.5596478, 0.2174584, 0, 0, 0, 1, 1,
-0.7890178, -0.8469611, -2.160244, 0, 0, 0, 1, 1,
-0.7889362, -1.339577, -0.9168063, 0, 0, 0, 1, 1,
-0.7850392, -1.421759, -2.950934, 0, 0, 0, 1, 1,
-0.7826197, 0.6723319, -0.2981713, 1, 1, 1, 1, 1,
-0.7798876, 0.3536712, -1.445796, 1, 1, 1, 1, 1,
-0.7793826, -1.217704, -0.7090825, 1, 1, 1, 1, 1,
-0.7757362, 0.3745066, 2.25274, 1, 1, 1, 1, 1,
-0.7718533, -0.5995567, -3.055751, 1, 1, 1, 1, 1,
-0.7677664, 0.874236, 0.1424388, 1, 1, 1, 1, 1,
-0.7599539, 0.2393847, -1.022131, 1, 1, 1, 1, 1,
-0.7596255, -0.2082056, -1.521102, 1, 1, 1, 1, 1,
-0.7593013, -1.192659, -2.620229, 1, 1, 1, 1, 1,
-0.755596, -0.9643848, -2.138733, 1, 1, 1, 1, 1,
-0.7488192, -0.8540458, -1.847332, 1, 1, 1, 1, 1,
-0.7469611, -0.5748494, -2.027159, 1, 1, 1, 1, 1,
-0.7463148, 0.571531, -1.34137, 1, 1, 1, 1, 1,
-0.7436054, -0.7607202, -2.463895, 1, 1, 1, 1, 1,
-0.7367559, -0.7292854, -4.495826, 1, 1, 1, 1, 1,
-0.7358246, 1.300388, -0.03691599, 0, 0, 1, 1, 1,
-0.7348289, -1.147942, -2.869632, 1, 0, 0, 1, 1,
-0.7322662, 0.2191895, -0.836365, 1, 0, 0, 1, 1,
-0.7318723, -1.117398, -3.074616, 1, 0, 0, 1, 1,
-0.7271172, 1.963981, -0.3856487, 1, 0, 0, 1, 1,
-0.7183648, 0.03851907, -1.821763, 1, 0, 0, 1, 1,
-0.7135859, 0.1731097, -1.039647, 0, 0, 0, 1, 1,
-0.7128637, 1.264892, -0.2882153, 0, 0, 0, 1, 1,
-0.7100713, -1.853855, -1.949681, 0, 0, 0, 1, 1,
-0.7071174, 0.1414007, -2.68479, 0, 0, 0, 1, 1,
-0.7043483, -0.4448189, -3.808163, 0, 0, 0, 1, 1,
-0.7031049, 0.3131313, -1.025443, 0, 0, 0, 1, 1,
-0.7012797, 0.6560798, -0.184841, 0, 0, 0, 1, 1,
-0.6964853, -0.01351907, -0.6029667, 1, 1, 1, 1, 1,
-0.6935173, -1.758871, -3.854142, 1, 1, 1, 1, 1,
-0.68907, 1.907189, 0.5856181, 1, 1, 1, 1, 1,
-0.6879606, 0.8161853, -0.9577407, 1, 1, 1, 1, 1,
-0.687013, 0.3401012, 0.7358747, 1, 1, 1, 1, 1,
-0.6838762, -0.2894855, -2.255776, 1, 1, 1, 1, 1,
-0.6822747, 0.8426259, 0.07516958, 1, 1, 1, 1, 1,
-0.6816089, 0.6502781, -3.19479, 1, 1, 1, 1, 1,
-0.6761984, -0.2108001, -2.6305, 1, 1, 1, 1, 1,
-0.675265, 0.2621005, -2.380463, 1, 1, 1, 1, 1,
-0.6646928, 1.021991, 0.6105711, 1, 1, 1, 1, 1,
-0.6606252, 0.1199404, -0.3520407, 1, 1, 1, 1, 1,
-0.6589892, -0.3645768, -0.9373408, 1, 1, 1, 1, 1,
-0.6543854, -1.336706, -1.741636, 1, 1, 1, 1, 1,
-0.6499848, 0.1877205, -3.705037, 1, 1, 1, 1, 1,
-0.6496254, -0.9106535, -3.403822, 0, 0, 1, 1, 1,
-0.6490526, -0.4124348, -1.886814, 1, 0, 0, 1, 1,
-0.646653, 0.06329628, -1.857356, 1, 0, 0, 1, 1,
-0.6442345, -0.02901827, -1.562816, 1, 0, 0, 1, 1,
-0.6432533, 0.3492048, -1.418677, 1, 0, 0, 1, 1,
-0.6430622, 1.208653, -0.4415195, 1, 0, 0, 1, 1,
-0.6384711, -2.290258, -1.257646, 0, 0, 0, 1, 1,
-0.6379979, 1.239269, -0.6125485, 0, 0, 0, 1, 1,
-0.6376967, 0.654163, -0.5678648, 0, 0, 0, 1, 1,
-0.6362891, -0.7258947, -3.15353, 0, 0, 0, 1, 1,
-0.6338863, 0.2518879, -1.886702, 0, 0, 0, 1, 1,
-0.6310748, -2.236768, -2.514261, 0, 0, 0, 1, 1,
-0.6294597, -0.1449313, -0.8520215, 0, 0, 0, 1, 1,
-0.6292035, -0.4018198, -2.399819, 1, 1, 1, 1, 1,
-0.6233928, 1.881539, 0.7834771, 1, 1, 1, 1, 1,
-0.6186819, 0.2515033, -1.455754, 1, 1, 1, 1, 1,
-0.6102852, 0.4681944, -0.5071163, 1, 1, 1, 1, 1,
-0.6061161, -0.6791446, -0.9345857, 1, 1, 1, 1, 1,
-0.5979174, -0.1718553, -1.086739, 1, 1, 1, 1, 1,
-0.5975983, -0.7491586, -2.42332, 1, 1, 1, 1, 1,
-0.5975443, 0.146404, 0.4668706, 1, 1, 1, 1, 1,
-0.5960607, -0.3855409, 0.6747963, 1, 1, 1, 1, 1,
-0.595592, -0.8102272, -3.502519, 1, 1, 1, 1, 1,
-0.5935652, 1.73907, -1.099521, 1, 1, 1, 1, 1,
-0.5914408, -0.6392227, -3.035121, 1, 1, 1, 1, 1,
-0.5885349, 1.026837, -0.9865152, 1, 1, 1, 1, 1,
-0.5876697, -0.07370209, -3.312496, 1, 1, 1, 1, 1,
-0.5868256, -0.399356, -1.895338, 1, 1, 1, 1, 1,
-0.5857575, -0.3922274, 0.02514972, 0, 0, 1, 1, 1,
-0.5846531, 0.2698295, -0.05659653, 1, 0, 0, 1, 1,
-0.5831754, -0.8096825, -3.865422, 1, 0, 0, 1, 1,
-0.5782582, 0.5787617, 0.1958992, 1, 0, 0, 1, 1,
-0.5732926, -0.03982388, -1.553519, 1, 0, 0, 1, 1,
-0.5728689, 0.4494562, 0.2265803, 1, 0, 0, 1, 1,
-0.5721151, 1.599531, -0.6002393, 0, 0, 0, 1, 1,
-0.5711229, 2.216403, 0.2514297, 0, 0, 0, 1, 1,
-0.5689791, 0.4635613, -1.163126, 0, 0, 0, 1, 1,
-0.5685499, 0.901462, -0.1172107, 0, 0, 0, 1, 1,
-0.5684239, 0.144597, 0.1268106, 0, 0, 0, 1, 1,
-0.5663397, 1.393238, 0.7050817, 0, 0, 0, 1, 1,
-0.563108, -0.1758813, -0.05497041, 0, 0, 0, 1, 1,
-0.5612268, 0.989126, -0.9039733, 1, 1, 1, 1, 1,
-0.5603467, -1.734111, -0.5875655, 1, 1, 1, 1, 1,
-0.5591351, 0.9839471, -0.6015338, 1, 1, 1, 1, 1,
-0.557905, -1.644204, -2.991246, 1, 1, 1, 1, 1,
-0.5577036, 0.02219028, -3.66968, 1, 1, 1, 1, 1,
-0.5564694, 0.5713331, -0.4712907, 1, 1, 1, 1, 1,
-0.555377, 0.5360948, -0.431605, 1, 1, 1, 1, 1,
-0.5541096, -1.141136, -3.053367, 1, 1, 1, 1, 1,
-0.5476657, 2.349594, -0.7931497, 1, 1, 1, 1, 1,
-0.545948, 1.12898, 1.282495, 1, 1, 1, 1, 1,
-0.5449808, -1.919243, -4.838595, 1, 1, 1, 1, 1,
-0.5428541, -1.900024, -2.469151, 1, 1, 1, 1, 1,
-0.5401119, 0.6196483, 0.3619438, 1, 1, 1, 1, 1,
-0.5397096, 1.371502, -1.32203, 1, 1, 1, 1, 1,
-0.5393451, 0.3056832, -1.079438, 1, 1, 1, 1, 1,
-0.5324945, -0.8020535, -3.738651, 0, 0, 1, 1, 1,
-0.5263343, 0.426481, -0.1428798, 1, 0, 0, 1, 1,
-0.5191491, -0.4932187, -2.629414, 1, 0, 0, 1, 1,
-0.5183474, 1.35463, 0.3504308, 1, 0, 0, 1, 1,
-0.5153577, -0.6382581, -1.028219, 1, 0, 0, 1, 1,
-0.5135698, -1.622108, -1.442978, 1, 0, 0, 1, 1,
-0.5128862, 0.1612972, -1.094253, 0, 0, 0, 1, 1,
-0.5054291, -0.6321877, -1.162642, 0, 0, 0, 1, 1,
-0.5039263, -0.321557, -3.031043, 0, 0, 0, 1, 1,
-0.5023583, 0.1160024, -2.662201, 0, 0, 0, 1, 1,
-0.5014204, -1.358486, -3.159492, 0, 0, 0, 1, 1,
-0.500607, -1.016504, -2.742068, 0, 0, 0, 1, 1,
-0.4978276, -0.0936663, -2.110521, 0, 0, 0, 1, 1,
-0.4943224, 0.2051278, -2.721553, 1, 1, 1, 1, 1,
-0.4922553, -1.316619, -3.462131, 1, 1, 1, 1, 1,
-0.4912773, 0.1114837, -0.2525021, 1, 1, 1, 1, 1,
-0.4856867, -0.4368433, -2.161923, 1, 1, 1, 1, 1,
-0.480706, -2.314382, -1.062927, 1, 1, 1, 1, 1,
-0.4803207, -0.6766965, -2.84058, 1, 1, 1, 1, 1,
-0.4801646, 0.2510903, 0.09214881, 1, 1, 1, 1, 1,
-0.4730799, 0.006336438, -2.369333, 1, 1, 1, 1, 1,
-0.4721824, 1.076673, -1.499024, 1, 1, 1, 1, 1,
-0.4689507, 1.162666, -0.2255183, 1, 1, 1, 1, 1,
-0.4673808, -0.6365622, -0.8359303, 1, 1, 1, 1, 1,
-0.4637854, -2.650673, -3.580024, 1, 1, 1, 1, 1,
-0.4626348, 0.08219539, -0.6176506, 1, 1, 1, 1, 1,
-0.4618763, -0.3829379, -2.465249, 1, 1, 1, 1, 1,
-0.4607572, -0.4473117, -2.072958, 1, 1, 1, 1, 1,
-0.4591864, -0.7553989, -1.961667, 0, 0, 1, 1, 1,
-0.4569068, -0.6455286, -2.722599, 1, 0, 0, 1, 1,
-0.4555104, 0.2014643, -1.042477, 1, 0, 0, 1, 1,
-0.4525921, 1.597576, -0.3386409, 1, 0, 0, 1, 1,
-0.4503647, 0.005389468, -1.9347, 1, 0, 0, 1, 1,
-0.4496998, 0.5381705, -0.3746977, 1, 0, 0, 1, 1,
-0.4419982, -1.198839, -3.441574, 0, 0, 0, 1, 1,
-0.4406186, -0.1257953, -1.031186, 0, 0, 0, 1, 1,
-0.4403014, -0.2465938, -2.515247, 0, 0, 0, 1, 1,
-0.4399979, 0.430172, 0.02083191, 0, 0, 0, 1, 1,
-0.4368672, -0.2576528, -1.41194, 0, 0, 0, 1, 1,
-0.4343833, 0.6876482, 0.1189536, 0, 0, 0, 1, 1,
-0.4337623, -2.012035, -3.973703, 0, 0, 0, 1, 1,
-0.4335791, 0.4420325, -1.138967, 1, 1, 1, 1, 1,
-0.4313271, -1.119185, -3.319336, 1, 1, 1, 1, 1,
-0.4306443, -0.3113967, -2.355032, 1, 1, 1, 1, 1,
-0.4288848, -0.9781203, -4.426193, 1, 1, 1, 1, 1,
-0.4285564, 0.9714622, -1.800767, 1, 1, 1, 1, 1,
-0.4221841, 1.268876, -2.349845, 1, 1, 1, 1, 1,
-0.4149146, -0.06466159, -0.05023487, 1, 1, 1, 1, 1,
-0.4130404, 0.07995778, -1.117066, 1, 1, 1, 1, 1,
-0.4078111, -0.3699474, -2.032446, 1, 1, 1, 1, 1,
-0.4064808, -0.3481185, -1.61492, 1, 1, 1, 1, 1,
-0.4032941, 0.1725816, -0.2730722, 1, 1, 1, 1, 1,
-0.4024444, -1.303861, -3.68066, 1, 1, 1, 1, 1,
-0.399698, -0.9133683, -4.035532, 1, 1, 1, 1, 1,
-0.3985169, -0.3307825, -2.406334, 1, 1, 1, 1, 1,
-0.3981335, 0.04755893, -0.3328784, 1, 1, 1, 1, 1,
-0.3937069, -0.01299851, -1.614477, 0, 0, 1, 1, 1,
-0.3837619, 2.409217, -1.319798, 1, 0, 0, 1, 1,
-0.3834345, -0.3642416, -0.751651, 1, 0, 0, 1, 1,
-0.3828019, -1.250562, -2.323155, 1, 0, 0, 1, 1,
-0.3805785, 0.7112629, 1.005676, 1, 0, 0, 1, 1,
-0.3783792, 0.341459, -0.9678329, 1, 0, 0, 1, 1,
-0.3779654, -0.3747628, -2.012342, 0, 0, 0, 1, 1,
-0.377849, 0.9072165, -1.509515, 0, 0, 0, 1, 1,
-0.3770313, -0.1821826, -3.516401, 0, 0, 0, 1, 1,
-0.3767078, 0.5370212, -0.4569633, 0, 0, 0, 1, 1,
-0.3747092, -0.05877517, -0.4152482, 0, 0, 0, 1, 1,
-0.3693459, -1.349322, -2.391104, 0, 0, 0, 1, 1,
-0.3672957, -0.7007006, -1.890546, 0, 0, 0, 1, 1,
-0.3657348, 2.087782, 0.607759, 1, 1, 1, 1, 1,
-0.3558028, -0.5812586, -2.761833, 1, 1, 1, 1, 1,
-0.3545202, -1.467942, -4.34263, 1, 1, 1, 1, 1,
-0.3530677, -0.8570125, -2.301481, 1, 1, 1, 1, 1,
-0.3487038, 0.409588, 0.1462463, 1, 1, 1, 1, 1,
-0.3457368, -0.4458557, -3.075556, 1, 1, 1, 1, 1,
-0.3457026, -0.2901694, -2.946707, 1, 1, 1, 1, 1,
-0.3428414, -0.6896087, -2.180261, 1, 1, 1, 1, 1,
-0.3412494, -0.3778484, -2.04905, 1, 1, 1, 1, 1,
-0.3408931, 1.285349, -0.7979704, 1, 1, 1, 1, 1,
-0.3372574, -1.588355, -4.434812, 1, 1, 1, 1, 1,
-0.3370395, 1.4768, -1.609256, 1, 1, 1, 1, 1,
-0.3307209, 1.76445, -1.876623, 1, 1, 1, 1, 1,
-0.3244329, 0.08333908, -1.167039, 1, 1, 1, 1, 1,
-0.3236343, 0.007214747, 0.06013048, 1, 1, 1, 1, 1,
-0.3220756, -1.859055, -4.484142, 0, 0, 1, 1, 1,
-0.3211954, 1.574814, -1.327769, 1, 0, 0, 1, 1,
-0.3208387, 0.2039179, -1.538659, 1, 0, 0, 1, 1,
-0.3157983, 0.957548, -0.562778, 1, 0, 0, 1, 1,
-0.3118328, -0.8650395, -2.940126, 1, 0, 0, 1, 1,
-0.3083426, -0.2814502, -2.139017, 1, 0, 0, 1, 1,
-0.3074549, 0.001262133, -1.884311, 0, 0, 0, 1, 1,
-0.3074124, 0.3391097, -2.157894, 0, 0, 0, 1, 1,
-0.3058836, 0.2549381, -1.496273, 0, 0, 0, 1, 1,
-0.3015179, -0.3677597, -1.386501, 0, 0, 0, 1, 1,
-0.3006272, -0.128906, -1.546456, 0, 0, 0, 1, 1,
-0.2992617, -0.5394453, -3.586214, 0, 0, 0, 1, 1,
-0.2989295, -1.013311, -4.030724, 0, 0, 0, 1, 1,
-0.2949889, -0.1323981, -2.17158, 1, 1, 1, 1, 1,
-0.2919496, -0.01119481, -0.5741727, 1, 1, 1, 1, 1,
-0.2854482, -0.1893264, -2.313247, 1, 1, 1, 1, 1,
-0.2839927, -0.6473609, -3.808896, 1, 1, 1, 1, 1,
-0.2812868, 0.8833413, -0.9920778, 1, 1, 1, 1, 1,
-0.2803144, -0.1822774, -2.205967, 1, 1, 1, 1, 1,
-0.2770923, 0.774196, -2.158322, 1, 1, 1, 1, 1,
-0.2706194, 0.822581, -0.4469819, 1, 1, 1, 1, 1,
-0.2699104, 0.5279619, -0.3122093, 1, 1, 1, 1, 1,
-0.2691202, -0.2976116, -0.6588251, 1, 1, 1, 1, 1,
-0.2687452, 0.8698678, -0.455482, 1, 1, 1, 1, 1,
-0.2671324, -2.569712, -3.67735, 1, 1, 1, 1, 1,
-0.2666748, 0.4533097, -1.222081, 1, 1, 1, 1, 1,
-0.263179, -1.189872, -3.118967, 1, 1, 1, 1, 1,
-0.2630981, -1.376788, -2.76791, 1, 1, 1, 1, 1,
-0.2616705, 1.534572, 0.4763999, 0, 0, 1, 1, 1,
-0.2589143, 1.653283, -0.4155342, 1, 0, 0, 1, 1,
-0.2562428, -0.507299, -1.635602, 1, 0, 0, 1, 1,
-0.2553073, -0.5412477, -3.238306, 1, 0, 0, 1, 1,
-0.2503152, 0.8528877, -1.287187, 1, 0, 0, 1, 1,
-0.2486266, 0.5103838, -1.001951, 1, 0, 0, 1, 1,
-0.2473302, 0.7879744, 0.850834, 0, 0, 0, 1, 1,
-0.2457178, 0.9169617, -0.1891398, 0, 0, 0, 1, 1,
-0.2454398, 0.7051224, 0.2422904, 0, 0, 0, 1, 1,
-0.2439083, 0.1727661, -2.605013, 0, 0, 0, 1, 1,
-0.2433183, -0.9946545, -4.86863, 0, 0, 0, 1, 1,
-0.2395813, -0.095332, -2.263478, 0, 0, 0, 1, 1,
-0.2382784, 0.2650684, -0.08555247, 0, 0, 0, 1, 1,
-0.2359662, -1.034745, -2.851466, 1, 1, 1, 1, 1,
-0.2340556, 0.3617448, -1.632083, 1, 1, 1, 1, 1,
-0.2338336, 0.1605478, -0.3098738, 1, 1, 1, 1, 1,
-0.2311488, -1.849848, -3.506394, 1, 1, 1, 1, 1,
-0.2310926, 0.8626127, 0.1712381, 1, 1, 1, 1, 1,
-0.2164866, 1.89812, -0.2249373, 1, 1, 1, 1, 1,
-0.2157259, 1.708182, 0.5520735, 1, 1, 1, 1, 1,
-0.2120364, -0.5786737, -3.583913, 1, 1, 1, 1, 1,
-0.2084962, 0.663835, 0.6963848, 1, 1, 1, 1, 1,
-0.2081628, -3.077666, -3.592021, 1, 1, 1, 1, 1,
-0.2070145, 1.248824, 1.423566, 1, 1, 1, 1, 1,
-0.2049035, 1.26772, -1.004603, 1, 1, 1, 1, 1,
-0.2010878, -0.4067636, -1.667348, 1, 1, 1, 1, 1,
-0.1953305, -0.6654413, -2.012782, 1, 1, 1, 1, 1,
-0.1943126, -0.6604149, -1.295668, 1, 1, 1, 1, 1,
-0.1935728, 0.3482818, 0.8397726, 0, 0, 1, 1, 1,
-0.1844358, -1.538078, -1.832194, 1, 0, 0, 1, 1,
-0.1841166, 0.6700995, -0.9931856, 1, 0, 0, 1, 1,
-0.1821039, 0.6517532, 0.4519394, 1, 0, 0, 1, 1,
-0.1818161, 2.05233, 0.06906096, 1, 0, 0, 1, 1,
-0.1779078, 0.8311259, -0.3196446, 1, 0, 0, 1, 1,
-0.1689022, -0.5302714, -2.969717, 0, 0, 0, 1, 1,
-0.1677189, 2.20881, 0.6624003, 0, 0, 0, 1, 1,
-0.1672834, -1.585971, -3.370746, 0, 0, 0, 1, 1,
-0.1661466, 0.3064859, -1.284237, 0, 0, 0, 1, 1,
-0.1639256, 0.9794503, -0.0431255, 0, 0, 0, 1, 1,
-0.1629605, 0.7321653, -0.7882079, 0, 0, 0, 1, 1,
-0.156966, -0.6515602, -3.334857, 0, 0, 0, 1, 1,
-0.1527899, -0.8125218, -1.679372, 1, 1, 1, 1, 1,
-0.1499686, 1.025954, -0.6300188, 1, 1, 1, 1, 1,
-0.1476653, 1.688648, 2.335591, 1, 1, 1, 1, 1,
-0.1466866, -0.4022225, -3.207293, 1, 1, 1, 1, 1,
-0.1459329, -0.4250019, -3.217584, 1, 1, 1, 1, 1,
-0.1439345, 1.340377, 0.875299, 1, 1, 1, 1, 1,
-0.143592, 0.7605591, 0.4101939, 1, 1, 1, 1, 1,
-0.1422516, -0.7805068, -2.296859, 1, 1, 1, 1, 1,
-0.1402049, -0.7510594, -1.919562, 1, 1, 1, 1, 1,
-0.1370347, -0.5475551, -3.603023, 1, 1, 1, 1, 1,
-0.1366, 0.8991489, -1.862973, 1, 1, 1, 1, 1,
-0.1342461, 0.07714394, 0.4230913, 1, 1, 1, 1, 1,
-0.1334964, -0.2337161, -1.729437, 1, 1, 1, 1, 1,
-0.1331067, -0.4423418, -3.08408, 1, 1, 1, 1, 1,
-0.1208084, -0.8909875, -3.524186, 1, 1, 1, 1, 1,
-0.1188027, 0.0767922, -1.323189, 0, 0, 1, 1, 1,
-0.1137484, -0.4040327, -3.060107, 1, 0, 0, 1, 1,
-0.1121158, 0.439209, -0.2656318, 1, 0, 0, 1, 1,
-0.1060454, -0.5795021, -1.831743, 1, 0, 0, 1, 1,
-0.1058107, 0.3177164, -1.135535, 1, 0, 0, 1, 1,
-0.1024846, -0.3792919, -2.126195, 1, 0, 0, 1, 1,
-0.1024259, -0.08735766, -3.548689, 0, 0, 0, 1, 1,
-0.09684324, -0.1481343, -3.41326, 0, 0, 0, 1, 1,
-0.09599693, -1.538599, -3.276011, 0, 0, 0, 1, 1,
-0.09070714, 0.4015198, -0.3175089, 0, 0, 0, 1, 1,
-0.08764884, -0.3603282, -3.454571, 0, 0, 0, 1, 1,
-0.08653716, 0.8066095, -1.252848, 0, 0, 0, 1, 1,
-0.08253331, -0.1886486, -1.271165, 0, 0, 0, 1, 1,
-0.08006898, -0.3605354, -1.89649, 1, 1, 1, 1, 1,
-0.07927704, -1.355159, -4.33852, 1, 1, 1, 1, 1,
-0.07681406, 0.7392447, -0.7111257, 1, 1, 1, 1, 1,
-0.07548153, 0.5028695, -0.4264685, 1, 1, 1, 1, 1,
-0.07386514, -0.2051331, -2.371136, 1, 1, 1, 1, 1,
-0.06991667, 0.2662513, 0.7111573, 1, 1, 1, 1, 1,
-0.06302892, -0.3982692, -3.257122, 1, 1, 1, 1, 1,
-0.06118966, -0.04918172, -3.27878, 1, 1, 1, 1, 1,
-0.05650299, -2.947321, -2.547518, 1, 1, 1, 1, 1,
-0.05605291, -0.2485698, -1.862177, 1, 1, 1, 1, 1,
-0.05159417, 1.12294, -0.4072278, 1, 1, 1, 1, 1,
-0.04862743, -0.3529328, -3.517988, 1, 1, 1, 1, 1,
-0.04698344, -1.661765, -4.432707, 1, 1, 1, 1, 1,
-0.04609727, 0.8471906, 1.442362, 1, 1, 1, 1, 1,
-0.04596195, -0.6042898, -2.592353, 1, 1, 1, 1, 1,
-0.03979505, 0.1155359, -3.094961, 0, 0, 1, 1, 1,
-0.03754682, -0.1998702, -3.378926, 1, 0, 0, 1, 1,
-0.03521403, -1.012839, -4.152577, 1, 0, 0, 1, 1,
-0.03476121, 0.1404651, -0.3926806, 1, 0, 0, 1, 1,
-0.02822492, 0.1169585, 0.4421822, 1, 0, 0, 1, 1,
-0.02663011, -0.2473222, -1.78028, 1, 0, 0, 1, 1,
-0.02644567, 0.9002481, -0.5243968, 0, 0, 0, 1, 1,
-0.02576544, -0.5183129, -2.817049, 0, 0, 0, 1, 1,
-0.02403865, 1.239764, 0.2303738, 0, 0, 0, 1, 1,
-0.01992637, 0.04560813, -1.120617, 0, 0, 0, 1, 1,
-0.00491394, -1.849468, -2.373279, 0, 0, 0, 1, 1,
-0.004621498, -1.844102, -3.710912, 0, 0, 0, 1, 1,
-0.004468049, 0.29601, -0.05798415, 0, 0, 0, 1, 1,
-0.001457003, -1.826014, -3.003362, 1, 1, 1, 1, 1,
-0.00117825, -0.8200464, -4.149802, 1, 1, 1, 1, 1,
0.002230631, 0.1528093, -1.104625, 1, 1, 1, 1, 1,
0.005615501, 0.8205549, -0.6215547, 1, 1, 1, 1, 1,
0.007438375, -1.929556, 1.442912, 1, 1, 1, 1, 1,
0.01472841, 1.286204, 0.6815254, 1, 1, 1, 1, 1,
0.01616809, 0.1404207, 0.6657791, 1, 1, 1, 1, 1,
0.02436531, 0.1251602, 0.618467, 1, 1, 1, 1, 1,
0.02482835, -1.279892, 2.330266, 1, 1, 1, 1, 1,
0.02607608, -1.158617, 1.347425, 1, 1, 1, 1, 1,
0.02879865, -1.196442, 4.078037, 1, 1, 1, 1, 1,
0.02919494, -0.6746672, 3.608528, 1, 1, 1, 1, 1,
0.0295206, -1.363557, 1.163299, 1, 1, 1, 1, 1,
0.03152071, 1.856379, -0.217188, 1, 1, 1, 1, 1,
0.03478878, -0.889811, 2.63568, 1, 1, 1, 1, 1,
0.04100277, -1.603421, 2.213278, 0, 0, 1, 1, 1,
0.04338064, 0.4808387, 0.261325, 1, 0, 0, 1, 1,
0.04612147, -0.9158739, 5.842383, 1, 0, 0, 1, 1,
0.04947813, 0.175008, -0.06956514, 1, 0, 0, 1, 1,
0.05180558, -1.516523, 3.929305, 1, 0, 0, 1, 1,
0.05194139, -0.6755662, 1.999939, 1, 0, 0, 1, 1,
0.05413585, -0.05162651, 2.473658, 0, 0, 0, 1, 1,
0.05447685, 0.975982, -0.7316864, 0, 0, 0, 1, 1,
0.05643707, 0.2682996, -0.9084949, 0, 0, 0, 1, 1,
0.05740404, -0.2167297, 3.604706, 0, 0, 0, 1, 1,
0.05749739, 0.3938967, -0.04472025, 0, 0, 0, 1, 1,
0.05823245, 0.8857838, 0.1300379, 0, 0, 0, 1, 1,
0.06085254, 2.003252, -2.100681, 0, 0, 0, 1, 1,
0.0634521, -0.6445977, 3.236132, 1, 1, 1, 1, 1,
0.06461456, -1.286087, 2.109145, 1, 1, 1, 1, 1,
0.07073183, -0.3143932, 4.350828, 1, 1, 1, 1, 1,
0.07498782, -0.06204841, 2.343862, 1, 1, 1, 1, 1,
0.07571112, 0.2707131, -0.9162482, 1, 1, 1, 1, 1,
0.08006863, -0.06983529, 2.422729, 1, 1, 1, 1, 1,
0.08041037, 0.6729408, 0.05059687, 1, 1, 1, 1, 1,
0.08620024, -1.21682, 2.175076, 1, 1, 1, 1, 1,
0.08941108, -1.133675, 3.072748, 1, 1, 1, 1, 1,
0.09319969, 0.1449757, -0.2664435, 1, 1, 1, 1, 1,
0.09335924, 0.08321768, 0.9274464, 1, 1, 1, 1, 1,
0.09346196, 0.5745574, -1.35941, 1, 1, 1, 1, 1,
0.0968522, 0.941461, 1.102352, 1, 1, 1, 1, 1,
0.09853977, -0.4941652, 3.908309, 1, 1, 1, 1, 1,
0.1012124, -0.9624326, 3.597545, 1, 1, 1, 1, 1,
0.102451, -0.5207445, 2.3701, 0, 0, 1, 1, 1,
0.1042608, -0.2529828, 3.418272, 1, 0, 0, 1, 1,
0.1053827, -1.363992, 1.549683, 1, 0, 0, 1, 1,
0.1056941, 1.333123, 0.9946799, 1, 0, 0, 1, 1,
0.1077801, 0.4745603, -0.1606673, 1, 0, 0, 1, 1,
0.112105, -2.221091, 2.101214, 1, 0, 0, 1, 1,
0.1121313, 0.3722843, 0.6697398, 0, 0, 0, 1, 1,
0.1151944, 2.154397, 0.7537478, 0, 0, 0, 1, 1,
0.115512, 1.060004, -0.2512482, 0, 0, 0, 1, 1,
0.1197131, 0.1518028, 0.4318148, 0, 0, 0, 1, 1,
0.1199525, -0.9847491, 3.195012, 0, 0, 0, 1, 1,
0.1208336, 0.9246483, 0.8448017, 0, 0, 0, 1, 1,
0.1264571, -1.012009, 4.836427, 0, 0, 0, 1, 1,
0.127605, 0.9673071, -0.617557, 1, 1, 1, 1, 1,
0.1406551, 0.3789166, -0.09749073, 1, 1, 1, 1, 1,
0.1425613, 1.515855, 0.04725911, 1, 1, 1, 1, 1,
0.1430646, -0.1571403, 2.458352, 1, 1, 1, 1, 1,
0.146696, 0.2861438, 0.6055335, 1, 1, 1, 1, 1,
0.1506544, 0.7700203, 0.3390482, 1, 1, 1, 1, 1,
0.1537673, -0.8661954, 1.224521, 1, 1, 1, 1, 1,
0.1537909, -1.34209, 2.828879, 1, 1, 1, 1, 1,
0.1544374, -0.3279963, 2.921503, 1, 1, 1, 1, 1,
0.1576204, -1.126807, 2.179353, 1, 1, 1, 1, 1,
0.1580711, -1.497227, 3.275889, 1, 1, 1, 1, 1,
0.1600765, 1.711671, -0.371133, 1, 1, 1, 1, 1,
0.163601, -0.2078129, 1.49558, 1, 1, 1, 1, 1,
0.1637306, -2.596217, 2.428038, 1, 1, 1, 1, 1,
0.1653804, 1.082267, 0.1749553, 1, 1, 1, 1, 1,
0.1673189, 2.009143, -0.3584495, 0, 0, 1, 1, 1,
0.1693014, -0.5028612, 3.856572, 1, 0, 0, 1, 1,
0.1695812, 1.053961, -1.642686, 1, 0, 0, 1, 1,
0.1695852, -0.6505961, 3.462549, 1, 0, 0, 1, 1,
0.1775563, 0.4196214, 1.116112, 1, 0, 0, 1, 1,
0.1777232, -0.3483173, 2.814608, 1, 0, 0, 1, 1,
0.1810958, 0.0204798, 1.971725, 0, 0, 0, 1, 1,
0.1812611, -0.4183722, 1.505327, 0, 0, 0, 1, 1,
0.1836763, 1.005941, -0.2343996, 0, 0, 0, 1, 1,
0.1867803, 0.4273169, 0.4677893, 0, 0, 0, 1, 1,
0.1867884, 1.439342, -0.3414597, 0, 0, 0, 1, 1,
0.1933072, 1.838066, -0.9547223, 0, 0, 0, 1, 1,
0.1946974, 1.220589, 2.011994, 0, 0, 0, 1, 1,
0.1964856, 0.3773337, 1.478197, 1, 1, 1, 1, 1,
0.1977917, 1.239037, 0.1266867, 1, 1, 1, 1, 1,
0.1993182, 0.05195443, 0.5689501, 1, 1, 1, 1, 1,
0.2038008, 1.073863, 1.394615, 1, 1, 1, 1, 1,
0.2043794, 1.283701, 2.211407, 1, 1, 1, 1, 1,
0.2048975, 1.577704, -0.4748767, 1, 1, 1, 1, 1,
0.2057662, 0.2019184, 3.030291, 1, 1, 1, 1, 1,
0.2090351, 0.9344934, 1.076912, 1, 1, 1, 1, 1,
0.2101087, 1.719579, -1.072348, 1, 1, 1, 1, 1,
0.2104179, 0.9013081, -0.5445378, 1, 1, 1, 1, 1,
0.2133464, 0.8091848, 0.8042753, 1, 1, 1, 1, 1,
0.2143724, -0.3666457, 3.666769, 1, 1, 1, 1, 1,
0.2164238, -0.6759949, 4.562216, 1, 1, 1, 1, 1,
0.219305, -0.46933, 3.360583, 1, 1, 1, 1, 1,
0.2197917, -0.3622378, 2.908338, 1, 1, 1, 1, 1,
0.2241712, -0.3151241, 1.535971, 0, 0, 1, 1, 1,
0.2344338, 0.6292202, -0.3848305, 1, 0, 0, 1, 1,
0.2413346, -0.05384839, 2.25924, 1, 0, 0, 1, 1,
0.2478495, 0.1956127, -1.235165, 1, 0, 0, 1, 1,
0.2499139, -0.3254559, 3.860907, 1, 0, 0, 1, 1,
0.2595994, -0.9758421, 2.688616, 1, 0, 0, 1, 1,
0.2600333, -0.2214013, 2.531826, 0, 0, 0, 1, 1,
0.262776, 0.5827404, 0.2031993, 0, 0, 0, 1, 1,
0.2668173, 0.4318918, 0.9508364, 0, 0, 0, 1, 1,
0.2675343, -0.7616624, 0.4989552, 0, 0, 0, 1, 1,
0.2684863, -0.6525709, 4.108566, 0, 0, 0, 1, 1,
0.2750575, -0.5424803, 2.249507, 0, 0, 0, 1, 1,
0.2780829, 1.567385, 1.582623, 0, 0, 0, 1, 1,
0.2787817, 0.1370934, -0.7242646, 1, 1, 1, 1, 1,
0.279375, -0.8727669, 3.61256, 1, 1, 1, 1, 1,
0.2845572, -0.3855429, 4.361917, 1, 1, 1, 1, 1,
0.2858733, -0.220307, 1.677789, 1, 1, 1, 1, 1,
0.287351, 0.8631235, 0.07870849, 1, 1, 1, 1, 1,
0.2878366, -1.485738, 3.587816, 1, 1, 1, 1, 1,
0.2913451, -0.246415, 2.211501, 1, 1, 1, 1, 1,
0.2935172, 0.1858319, 1.913111, 1, 1, 1, 1, 1,
0.2959285, -1.205292, 3.027244, 1, 1, 1, 1, 1,
0.298336, -0.1576872, 1.913231, 1, 1, 1, 1, 1,
0.2985077, 2.628762, -0.07469774, 1, 1, 1, 1, 1,
0.2989689, 1.045445, 1.128645, 1, 1, 1, 1, 1,
0.3013085, -1.101696, 3.125069, 1, 1, 1, 1, 1,
0.3019057, -1.003703, 3.026006, 1, 1, 1, 1, 1,
0.3019219, -0.3448445, 2.979102, 1, 1, 1, 1, 1,
0.3026301, 0.538707, 1.979156, 0, 0, 1, 1, 1,
0.3027798, -0.211782, 3.58312, 1, 0, 0, 1, 1,
0.3035554, 1.084831, 2.07071, 1, 0, 0, 1, 1,
0.3037571, 0.5136783, -0.03301853, 1, 0, 0, 1, 1,
0.3069892, -0.5059342, 4.058636, 1, 0, 0, 1, 1,
0.3076764, 0.2279925, 0.08290739, 1, 0, 0, 1, 1,
0.3095451, 2.206457, -0.304388, 0, 0, 0, 1, 1,
0.3132942, -1.243803, 2.267244, 0, 0, 0, 1, 1,
0.3136706, -0.4259919, 2.027492, 0, 0, 0, 1, 1,
0.315424, -0.6739632, 1.564062, 0, 0, 0, 1, 1,
0.3155443, 1.133139, -0.306127, 0, 0, 0, 1, 1,
0.3208461, -1.130591, 1.330047, 0, 0, 0, 1, 1,
0.3236852, -0.01788488, 1.55427, 0, 0, 0, 1, 1,
0.325791, -0.7873782, 2.441915, 1, 1, 1, 1, 1,
0.3262085, -0.7664105, 2.902677, 1, 1, 1, 1, 1,
0.3285903, -2.24054, 0.9499242, 1, 1, 1, 1, 1,
0.3359671, -0.7815611, 3.03474, 1, 1, 1, 1, 1,
0.3373912, -0.06945766, 1.137651, 1, 1, 1, 1, 1,
0.3422695, -2.137098, 1.17263, 1, 1, 1, 1, 1,
0.3443341, -0.1685026, 1.452455, 1, 1, 1, 1, 1,
0.3490105, 0.5467399, -0.3873319, 1, 1, 1, 1, 1,
0.3500113, 0.001936646, 1.989355, 1, 1, 1, 1, 1,
0.3504997, 0.1182904, 1.22558, 1, 1, 1, 1, 1,
0.3625149, 1.127023, 0.4154495, 1, 1, 1, 1, 1,
0.3629417, 0.3847817, 1.30522, 1, 1, 1, 1, 1,
0.3638238, -0.3336522, 0.8997421, 1, 1, 1, 1, 1,
0.3643506, -0.2056725, 0.8043336, 1, 1, 1, 1, 1,
0.3707187, -0.8750672, 2.536576, 1, 1, 1, 1, 1,
0.3710668, -0.4129222, 4.382892, 0, 0, 1, 1, 1,
0.3726303, 2.10104, 1.509135, 1, 0, 0, 1, 1,
0.3730562, 0.4233467, -0.003179684, 1, 0, 0, 1, 1,
0.3741919, -0.4402241, 0.9757408, 1, 0, 0, 1, 1,
0.3747134, 2.14221, 0.5106806, 1, 0, 0, 1, 1,
0.3786734, 0.7220638, 1.560073, 1, 0, 0, 1, 1,
0.3839942, 1.779909, -0.8397834, 0, 0, 0, 1, 1,
0.3848644, 0.8592054, -0.7095628, 0, 0, 0, 1, 1,
0.3852098, -1.018267, 2.13938, 0, 0, 0, 1, 1,
0.3913243, -0.8553331, 3.765225, 0, 0, 0, 1, 1,
0.3946966, -0.8562543, 3.716189, 0, 0, 0, 1, 1,
0.4017287, -1.277455, 1.955404, 0, 0, 0, 1, 1,
0.4028082, 1.245434, 0.3014549, 0, 0, 0, 1, 1,
0.407124, -0.5688987, 4.678995, 1, 1, 1, 1, 1,
0.4100325, 0.5066911, -0.7866345, 1, 1, 1, 1, 1,
0.4116243, -1.776032, 3.273628, 1, 1, 1, 1, 1,
0.4138878, 1.95666, -1.565172, 1, 1, 1, 1, 1,
0.4149792, 0.2135883, 1.392732, 1, 1, 1, 1, 1,
0.4191715, -1.972491, 1.825228, 1, 1, 1, 1, 1,
0.4199402, -1.37389, 2.117219, 1, 1, 1, 1, 1,
0.4221403, 0.4927257, 0.2349464, 1, 1, 1, 1, 1,
0.4223358, 0.6898283, -0.7559635, 1, 1, 1, 1, 1,
0.422522, -1.152835, 3.831296, 1, 1, 1, 1, 1,
0.4234277, 0.4858335, 1.473617, 1, 1, 1, 1, 1,
0.430436, -1.767446, 4.186304, 1, 1, 1, 1, 1,
0.4306141, 1.235123, 0.8045909, 1, 1, 1, 1, 1,
0.4307255, -1.32887, 2.707395, 1, 1, 1, 1, 1,
0.4314057, -0.1937386, 3.071105, 1, 1, 1, 1, 1,
0.4318928, -0.6048394, 2.872607, 0, 0, 1, 1, 1,
0.4330423, 0.4850138, 1.108683, 1, 0, 0, 1, 1,
0.4335116, 0.7241995, -0.7843242, 1, 0, 0, 1, 1,
0.4368431, 0.9245974, 0.350009, 1, 0, 0, 1, 1,
0.4404046, -0.5214424, 3.203916, 1, 0, 0, 1, 1,
0.4482954, -0.1146157, 1.704067, 1, 0, 0, 1, 1,
0.449158, -0.2434411, 1.570571, 0, 0, 0, 1, 1,
0.4544202, 0.5697197, 0.077846, 0, 0, 0, 1, 1,
0.456601, -1.152938, 3.055157, 0, 0, 0, 1, 1,
0.4587507, -0.0610099, 1.599731, 0, 0, 0, 1, 1,
0.4614195, -0.541559, 1.962769, 0, 0, 0, 1, 1,
0.467186, 1.167498, 0.3347505, 0, 0, 0, 1, 1,
0.4672062, -0.8645581, 4.361642, 0, 0, 0, 1, 1,
0.477899, -0.5918793, 1.995423, 1, 1, 1, 1, 1,
0.4823078, 0.5945781, 0.9097431, 1, 1, 1, 1, 1,
0.4826664, 1.296043, 0.7194879, 1, 1, 1, 1, 1,
0.5025201, 1.462238, 0.9579108, 1, 1, 1, 1, 1,
0.5052342, -0.05293794, 1.459559, 1, 1, 1, 1, 1,
0.5067732, 0.04679006, -1.139662, 1, 1, 1, 1, 1,
0.5101832, 0.5915104, 0.121053, 1, 1, 1, 1, 1,
0.5110626, 0.9458725, 1.000635, 1, 1, 1, 1, 1,
0.5128817, 1.149152, 0.2680763, 1, 1, 1, 1, 1,
0.5151396, 0.0685368, 2.198503, 1, 1, 1, 1, 1,
0.5160694, 1.755041, -0.0191448, 1, 1, 1, 1, 1,
0.5166938, 0.07947431, 0.1524099, 1, 1, 1, 1, 1,
0.5280806, -0.7340118, 2.55341, 1, 1, 1, 1, 1,
0.5282204, -0.05225077, 1.50583, 1, 1, 1, 1, 1,
0.5293562, -0.6245238, 2.424667, 1, 1, 1, 1, 1,
0.5321497, -0.7034526, 2.469865, 0, 0, 1, 1, 1,
0.5329663, 0.7819863, 1.009431, 1, 0, 0, 1, 1,
0.5332229, 0.1277059, -1.624686, 1, 0, 0, 1, 1,
0.5428827, -0.002629794, 1.464696, 1, 0, 0, 1, 1,
0.5434253, 1.423138, -0.02473358, 1, 0, 0, 1, 1,
0.5446979, -0.7061899, 2.785665, 1, 0, 0, 1, 1,
0.5501036, -0.9869933, 2.511534, 0, 0, 0, 1, 1,
0.5538322, -0.184438, 0.5584104, 0, 0, 0, 1, 1,
0.5555854, 0.06792458, 2.685185, 0, 0, 0, 1, 1,
0.5578473, -2.447237, 4.610844, 0, 0, 0, 1, 1,
0.5609015, -0.6478673, 1.612118, 0, 0, 0, 1, 1,
0.5616609, -1.790684, 3.987331, 0, 0, 0, 1, 1,
0.5670841, 0.3571784, 0.2736324, 0, 0, 0, 1, 1,
0.5697669, 0.6664371, 1.313706, 1, 1, 1, 1, 1,
0.570648, -0.2379504, 2.198757, 1, 1, 1, 1, 1,
0.5819783, -0.3517308, 1.816891, 1, 1, 1, 1, 1,
0.5831329, -0.7826346, 2.92028, 1, 1, 1, 1, 1,
0.5834615, -1.094253, 4.603536, 1, 1, 1, 1, 1,
0.5840362, 0.2251652, 0.6703303, 1, 1, 1, 1, 1,
0.5875998, -0.4107115, 4.644797, 1, 1, 1, 1, 1,
0.5925192, -0.005408051, 1.191629, 1, 1, 1, 1, 1,
0.5955498, -0.5875568, 2.635247, 1, 1, 1, 1, 1,
0.5984452, 2.275676, -0.07965587, 1, 1, 1, 1, 1,
0.5988447, -1.231368, 2.765479, 1, 1, 1, 1, 1,
0.6021095, 0.7738135, -1.200982, 1, 1, 1, 1, 1,
0.6055052, -0.7882298, 2.11919, 1, 1, 1, 1, 1,
0.6101347, -0.5709035, 2.791366, 1, 1, 1, 1, 1,
0.6121081, 0.4618124, 1.250514, 1, 1, 1, 1, 1,
0.6301345, 1.082555, 1.673225, 0, 0, 1, 1, 1,
0.6304812, -0.3649886, 0.951879, 1, 0, 0, 1, 1,
0.6307062, -1.482245, 2.514625, 1, 0, 0, 1, 1,
0.6316656, -1.254246, 2.083081, 1, 0, 0, 1, 1,
0.6320274, -0.7495007, 1.799895, 1, 0, 0, 1, 1,
0.6419345, 1.357648, 1.301795, 1, 0, 0, 1, 1,
0.6421724, 1.465166, -0.5141516, 0, 0, 0, 1, 1,
0.6430467, 1.343291, 1.174334, 0, 0, 0, 1, 1,
0.6436129, -0.6823449, 1.044522, 0, 0, 0, 1, 1,
0.6672688, -0.5100567, 2.664196, 0, 0, 0, 1, 1,
0.6714709, 0.7702413, -1.07199, 0, 0, 0, 1, 1,
0.672601, 0.6392033, 2.771068, 0, 0, 0, 1, 1,
0.6734725, 1.462445, 0.9950488, 0, 0, 0, 1, 1,
0.673796, -0.6801597, 1.608604, 1, 1, 1, 1, 1,
0.6746331, -0.1240743, 1.21055, 1, 1, 1, 1, 1,
0.675929, 0.6572401, -0.800721, 1, 1, 1, 1, 1,
0.6763081, -0.5797246, 2.231602, 1, 1, 1, 1, 1,
0.6788694, -0.05975506, -0.4061088, 1, 1, 1, 1, 1,
0.6800112, -0.08824421, 0.08237888, 1, 1, 1, 1, 1,
0.6915049, 1.048868, 0.754575, 1, 1, 1, 1, 1,
0.6951295, -0.9471391, 3.483977, 1, 1, 1, 1, 1,
0.6957299, -1.816072, 2.741155, 1, 1, 1, 1, 1,
0.6974666, 0.2051371, 2.285284, 1, 1, 1, 1, 1,
0.7177753, 0.7672164, -0.1065199, 1, 1, 1, 1, 1,
0.7192706, 1.402911, 1.988918, 1, 1, 1, 1, 1,
0.7240769, 0.03480393, 0.7130294, 1, 1, 1, 1, 1,
0.7314045, 1.067581, -0.8671138, 1, 1, 1, 1, 1,
0.7337013, 1.613185, 0.6465186, 1, 1, 1, 1, 1,
0.7338359, 0.1730489, 2.000721, 0, 0, 1, 1, 1,
0.7354723, -0.02342792, 3.480134, 1, 0, 0, 1, 1,
0.7365627, 0.1513445, 1.332032, 1, 0, 0, 1, 1,
0.7405508, -0.603267, 3.488496, 1, 0, 0, 1, 1,
0.7416281, 1.566092, -1.573592, 1, 0, 0, 1, 1,
0.7521834, -1.043388, 3.122342, 1, 0, 0, 1, 1,
0.753116, -0.4042322, 0.4576857, 0, 0, 0, 1, 1,
0.7559783, -0.3490614, -0.1416522, 0, 0, 0, 1, 1,
0.7598314, 1.410034, 1.688303, 0, 0, 0, 1, 1,
0.7610204, -0.7907164, 3.568928, 0, 0, 0, 1, 1,
0.7634927, 0.5013289, 2.165776, 0, 0, 0, 1, 1,
0.7646027, -0.3423019, 2.302328, 0, 0, 0, 1, 1,
0.7646698, 1.086895, -0.1217116, 0, 0, 0, 1, 1,
0.7737562, -0.236716, 3.080698, 1, 1, 1, 1, 1,
0.7863923, 0.4099294, 2.277342, 1, 1, 1, 1, 1,
0.7879546, -0.4552927, 2.715746, 1, 1, 1, 1, 1,
0.7940259, 0.2167017, 2.272244, 1, 1, 1, 1, 1,
0.8020371, -0.2027063, 2.367974, 1, 1, 1, 1, 1,
0.8065707, -0.3368092, 1.517938, 1, 1, 1, 1, 1,
0.817246, -0.2951615, 1.916958, 1, 1, 1, 1, 1,
0.8256017, -1.131582, 1.824283, 1, 1, 1, 1, 1,
0.8269926, 1.959998, -1.650509, 1, 1, 1, 1, 1,
0.8285977, -0.8203567, 2.073746, 1, 1, 1, 1, 1,
0.8289614, -1.548978, 1.782195, 1, 1, 1, 1, 1,
0.8332534, 0.8910735, 0.6379613, 1, 1, 1, 1, 1,
0.845493, -0.05329671, 1.79112, 1, 1, 1, 1, 1,
0.8490267, -0.9526449, 3.610088, 1, 1, 1, 1, 1,
0.8495549, 0.9796459, -0.3071881, 1, 1, 1, 1, 1,
0.8620877, -1.235865, 2.50935, 0, 0, 1, 1, 1,
0.8643592, -0.2648268, 2.804414, 1, 0, 0, 1, 1,
0.8683128, -0.3514221, 2.93857, 1, 0, 0, 1, 1,
0.8789932, -0.1266065, 1.077815, 1, 0, 0, 1, 1,
0.8824659, 1.461611, 0.2936396, 1, 0, 0, 1, 1,
0.8864747, 1.944082, -0.5696851, 1, 0, 0, 1, 1,
0.8936283, 0.8957459, 2.117436, 0, 0, 0, 1, 1,
0.8943149, 1.282085, 1.82251, 0, 0, 0, 1, 1,
0.8962954, 3.223569, -0.1765966, 0, 0, 0, 1, 1,
0.9067174, 0.8105075, 0.849444, 0, 0, 0, 1, 1,
0.907204, -1.767423, 2.891494, 0, 0, 0, 1, 1,
0.9076127, -1.263641, 2.38194, 0, 0, 0, 1, 1,
0.9083184, 2.123871, -0.03769376, 0, 0, 0, 1, 1,
0.9232773, 1.798079, 1.048251, 1, 1, 1, 1, 1,
0.929454, 0.6946009, 0.2843195, 1, 1, 1, 1, 1,
0.9308544, 0.5269482, 1.61672, 1, 1, 1, 1, 1,
0.9406393, -0.6732185, 3.393408, 1, 1, 1, 1, 1,
0.9446167, -0.2363193, 2.187227, 1, 1, 1, 1, 1,
0.946761, -1.3966, 1.749498, 1, 1, 1, 1, 1,
0.9490747, -0.1035868, 1.933619, 1, 1, 1, 1, 1,
0.9547401, 2.137255, 1.190175, 1, 1, 1, 1, 1,
0.9568645, -0.779533, 1.122995, 1, 1, 1, 1, 1,
0.9632401, 2.629759, 0.2301775, 1, 1, 1, 1, 1,
0.9703564, 0.469326, 1.077186, 1, 1, 1, 1, 1,
0.9742823, 0.6652062, 0.8643654, 1, 1, 1, 1, 1,
0.9759806, 0.5343044, 1.979801, 1, 1, 1, 1, 1,
0.9773933, -0.9962503, 1.669536, 1, 1, 1, 1, 1,
0.9855812, -0.2416111, 0.9346183, 1, 1, 1, 1, 1,
0.9899415, 0.7271202, -0.425826, 0, 0, 1, 1, 1,
0.9902238, 0.6115959, 0.2407827, 1, 0, 0, 1, 1,
0.9977278, 1.217298, 1.125605, 1, 0, 0, 1, 1,
0.9981526, 0.1412886, 1.79941, 1, 0, 0, 1, 1,
0.9994613, 2.858781, 0.4595931, 1, 0, 0, 1, 1,
1.005523, -0.5239874, 2.365243, 1, 0, 0, 1, 1,
1.014964, 0.1789371, 2.901759, 0, 0, 0, 1, 1,
1.017246, -0.246443, 2.908962, 0, 0, 0, 1, 1,
1.023078, -1.347391, 1.550884, 0, 0, 0, 1, 1,
1.026418, 0.7704942, 0.5513487, 0, 0, 0, 1, 1,
1.030757, -0.4649289, 2.958133, 0, 0, 0, 1, 1,
1.049275, -0.3896273, 0.1727331, 0, 0, 0, 1, 1,
1.053349, -0.6183529, 0.1880967, 0, 0, 0, 1, 1,
1.055194, -0.6257576, 2.527236, 1, 1, 1, 1, 1,
1.06713, 0.9391209, 2.033197, 1, 1, 1, 1, 1,
1.068188, 1.829219, 1.023127, 1, 1, 1, 1, 1,
1.080231, 2.366403, -0.09828229, 1, 1, 1, 1, 1,
1.080595, -1.622142, 2.189623, 1, 1, 1, 1, 1,
1.082521, -1.124207, 2.010726, 1, 1, 1, 1, 1,
1.088711, -0.7062595, 1.491367, 1, 1, 1, 1, 1,
1.090364, -0.8413923, 0.8485883, 1, 1, 1, 1, 1,
1.092949, -0.3612305, 0.1417134, 1, 1, 1, 1, 1,
1.093762, 1.006051, 0.04442042, 1, 1, 1, 1, 1,
1.093996, -0.1415024, 1.993322, 1, 1, 1, 1, 1,
1.095175, 0.3283283, 0.3299274, 1, 1, 1, 1, 1,
1.099559, -1.548497, 0.8658812, 1, 1, 1, 1, 1,
1.111752, -0.6550701, 2.548677, 1, 1, 1, 1, 1,
1.114152, 0.4961437, 2.0719, 1, 1, 1, 1, 1,
1.11912, -0.1681818, 2.826859, 0, 0, 1, 1, 1,
1.121953, -0.4174142, 1.248496, 1, 0, 0, 1, 1,
1.126128, -0.4831774, 3.161798, 1, 0, 0, 1, 1,
1.126215, 1.392238, -0.2580646, 1, 0, 0, 1, 1,
1.128005, 0.6172543, -0.2520278, 1, 0, 0, 1, 1,
1.137763, -0.4107672, 1.9851, 1, 0, 0, 1, 1,
1.14807, -1.566185, 2.192656, 0, 0, 0, 1, 1,
1.150946, 2.337789, 2.283617, 0, 0, 0, 1, 1,
1.151135, -1.171899, 3.39015, 0, 0, 0, 1, 1,
1.155945, 1.115067, 0.04583476, 0, 0, 0, 1, 1,
1.157722, -0.925045, 2.746907, 0, 0, 0, 1, 1,
1.163423, 0.6534643, 2.042524, 0, 0, 0, 1, 1,
1.164006, 0.6221853, 0.6255111, 0, 0, 0, 1, 1,
1.164846, 0.3119476, 0.6361037, 1, 1, 1, 1, 1,
1.167789, -0.680266, 4.595426, 1, 1, 1, 1, 1,
1.172154, 0.0618065, 1.459357, 1, 1, 1, 1, 1,
1.174935, 0.2833445, 1.784602, 1, 1, 1, 1, 1,
1.175469, 1.738143, -0.9068398, 1, 1, 1, 1, 1,
1.184206, -0.921761, 2.495358, 1, 1, 1, 1, 1,
1.18447, -1.070779, 2.442003, 1, 1, 1, 1, 1,
1.190182, 0.1741902, -0.4011733, 1, 1, 1, 1, 1,
1.217703, 1.266177, 0.8397768, 1, 1, 1, 1, 1,
1.222273, -0.852622, 2.347765, 1, 1, 1, 1, 1,
1.222666, 0.6100889, 0.3373944, 1, 1, 1, 1, 1,
1.229229, 0.6141471, -0.3410532, 1, 1, 1, 1, 1,
1.238668, -0.6839859, 0.7995818, 1, 1, 1, 1, 1,
1.240165, 0.9152726, 1.293323, 1, 1, 1, 1, 1,
1.241529, -1.973193, 2.312335, 1, 1, 1, 1, 1,
1.2423, 0.2879212, 3.071023, 0, 0, 1, 1, 1,
1.252595, -2.020484, 3.195735, 1, 0, 0, 1, 1,
1.259007, -0.5679987, 1.028447, 1, 0, 0, 1, 1,
1.261701, -0.5798372, 2.418951, 1, 0, 0, 1, 1,
1.264814, -2.264819, 2.554087, 1, 0, 0, 1, 1,
1.265848, 0.957643, -0.2574958, 1, 0, 0, 1, 1,
1.297117, -0.4281303, 2.732114, 0, 0, 0, 1, 1,
1.300688, -0.3887241, 1.696032, 0, 0, 0, 1, 1,
1.312494, -0.2542594, 2.386497, 0, 0, 0, 1, 1,
1.315504, -0.114689, 0.1947708, 0, 0, 0, 1, 1,
1.315715, 0.2621377, 2.818194, 0, 0, 0, 1, 1,
1.321778, -0.5391597, 4.414711, 0, 0, 0, 1, 1,
1.332395, -0.558154, 2.832683, 0, 0, 0, 1, 1,
1.335224, -0.7599765, 2.252693, 1, 1, 1, 1, 1,
1.34368, -0.4716925, 0.2348517, 1, 1, 1, 1, 1,
1.351977, 0.5833908, 2.239517, 1, 1, 1, 1, 1,
1.353772, 1.515615, 1.245817, 1, 1, 1, 1, 1,
1.354023, -1.016606, 2.35199, 1, 1, 1, 1, 1,
1.355864, 0.6306419, 1.748603, 1, 1, 1, 1, 1,
1.356002, -0.1959155, -0.608786, 1, 1, 1, 1, 1,
1.361443, -0.3331993, 1.370982, 1, 1, 1, 1, 1,
1.366176, 0.06843083, 1.460505, 1, 1, 1, 1, 1,
1.373953, 0.4792297, 1.385381, 1, 1, 1, 1, 1,
1.374755, -1.369619, 3.263401, 1, 1, 1, 1, 1,
1.379172, 0.1846071, 1.223533, 1, 1, 1, 1, 1,
1.387809, -1.869814, 3.110842, 1, 1, 1, 1, 1,
1.389493, 2.253573, 0.2400386, 1, 1, 1, 1, 1,
1.389708, 0.3031124, 0.3570099, 1, 1, 1, 1, 1,
1.390804, -1.463537, 0.9202321, 0, 0, 1, 1, 1,
1.40385, -1.875849, 1.815098, 1, 0, 0, 1, 1,
1.404805, -0.7247573, 2.306278, 1, 0, 0, 1, 1,
1.418454, -1.238886, -1.164258, 1, 0, 0, 1, 1,
1.419619, 1.13318, 0.6983443, 1, 0, 0, 1, 1,
1.425488, -1.057243, 0.9816984, 1, 0, 0, 1, 1,
1.428819, 1.756732, 1.085071, 0, 0, 0, 1, 1,
1.436747, -1.193201, 2.539851, 0, 0, 0, 1, 1,
1.438446, -0.3360455, 1.459998, 0, 0, 0, 1, 1,
1.445382, -0.4921936, 1.701564, 0, 0, 0, 1, 1,
1.455533, 0.4672962, 2.980175, 0, 0, 0, 1, 1,
1.456628, 1.322483, -0.5563272, 0, 0, 0, 1, 1,
1.459758, 0.3503842, -0.7675586, 0, 0, 0, 1, 1,
1.464081, 0.5203409, 1.701155, 1, 1, 1, 1, 1,
1.474349, 0.05775232, 2.170362, 1, 1, 1, 1, 1,
1.480056, -0.7853658, 2.96989, 1, 1, 1, 1, 1,
1.496092, 1.851064, 0.6952115, 1, 1, 1, 1, 1,
1.504425, -1.036253, -0.5391632, 1, 1, 1, 1, 1,
1.506958, 0.6641346, 1.638076, 1, 1, 1, 1, 1,
1.52792, -0.5454492, 1.752296, 1, 1, 1, 1, 1,
1.555785, -0.8353951, 2.906472, 1, 1, 1, 1, 1,
1.58088, -0.1587988, 2.223803, 1, 1, 1, 1, 1,
1.594116, -0.3549948, 2.038373, 1, 1, 1, 1, 1,
1.595877, -0.773101, 2.341228, 1, 1, 1, 1, 1,
1.609206, -0.8751769, 3.552855, 1, 1, 1, 1, 1,
1.610054, 1.186719, 0.327655, 1, 1, 1, 1, 1,
1.61454, -0.5806736, 1.492683, 1, 1, 1, 1, 1,
1.614983, 0.9457549, 1.047971, 1, 1, 1, 1, 1,
1.633896, -1.107436, 1.525465, 0, 0, 1, 1, 1,
1.639902, 0.1345454, 2.413393, 1, 0, 0, 1, 1,
1.644685, 0.2838795, 1.311518, 1, 0, 0, 1, 1,
1.651129, 0.5160922, 0.7433665, 1, 0, 0, 1, 1,
1.669192, 0.0908335, 1.659527, 1, 0, 0, 1, 1,
1.670972, -1.148487, 2.572118, 1, 0, 0, 1, 1,
1.67386, 0.5989898, 2.53042, 0, 0, 0, 1, 1,
1.67543, 1.659627, 1.78922, 0, 0, 0, 1, 1,
1.726285, 1.440269, 1.225793, 0, 0, 0, 1, 1,
1.745931, -0.09707034, 1.680923, 0, 0, 0, 1, 1,
1.76959, -1.728609, 3.561463, 0, 0, 0, 1, 1,
1.800854, -0.02376898, 0.9161722, 0, 0, 0, 1, 1,
1.807652, -0.6214643, -0.3527359, 0, 0, 0, 1, 1,
1.825758, 0.5994241, -0.2663589, 1, 1, 1, 1, 1,
1.828598, 0.8831062, 0.1890287, 1, 1, 1, 1, 1,
1.835271, -0.02594775, 1.897562, 1, 1, 1, 1, 1,
1.858171, 0.05253953, 2.576666, 1, 1, 1, 1, 1,
1.869842, -0.3516771, 3.313151, 1, 1, 1, 1, 1,
1.875533, 0.4049494, 3.592025, 1, 1, 1, 1, 1,
1.878617, -0.2014375, 0.1650791, 1, 1, 1, 1, 1,
1.884404, -1.107078, 2.502034, 1, 1, 1, 1, 1,
1.887899, -1.321206, 1.623613, 1, 1, 1, 1, 1,
1.890045, -1.365157, 1.106735, 1, 1, 1, 1, 1,
1.912678, 1.007014, -0.01294718, 1, 1, 1, 1, 1,
1.9355, 0.9864382, 1.860278, 1, 1, 1, 1, 1,
1.948813, -1.106484, 3.352883, 1, 1, 1, 1, 1,
1.974604, -0.2877298, 1.592611, 1, 1, 1, 1, 1,
2.007989, 0.9879307, 0.7304615, 1, 1, 1, 1, 1,
2.031503, -0.6785002, 2.209301, 0, 0, 1, 1, 1,
2.117877, 0.2430814, 2.847324, 1, 0, 0, 1, 1,
2.119603, 0.01544819, 3.790673, 1, 0, 0, 1, 1,
2.125188, 2.324644, -0.3863135, 1, 0, 0, 1, 1,
2.160602, -1.942242, 2.506083, 1, 0, 0, 1, 1,
2.193975, -0.5431225, 1.070055, 1, 0, 0, 1, 1,
2.259742, 1.359402, 1.503819, 0, 0, 0, 1, 1,
2.326266, 0.9551507, -0.2775829, 0, 0, 0, 1, 1,
2.398945, 0.7840467, 1.433735, 0, 0, 0, 1, 1,
2.399226, -0.8562505, 2.613255, 0, 0, 0, 1, 1,
2.40004, 0.6480919, 0.976827, 0, 0, 0, 1, 1,
2.405966, -0.624454, 1.78441, 0, 0, 0, 1, 1,
2.417879, 0.03052857, 3.35877, 0, 0, 0, 1, 1,
2.534203, 1.610309, 0.3656801, 1, 1, 1, 1, 1,
2.550302, 1.362663, -0.2439163, 1, 1, 1, 1, 1,
2.560434, 0.410598, 1.313717, 1, 1, 1, 1, 1,
2.768115, 0.8889888, 1.91612, 1, 1, 1, 1, 1,
2.771574, 0.7230071, 1.471743, 1, 1, 1, 1, 1,
2.827739, 1.597546, 1.813975, 1, 1, 1, 1, 1,
3.188037, 0.0433564, 1.269903, 1, 1, 1, 1, 1
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
var radius = 9.830229;
var distance = 34.52826;
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
mvMatrix.translate( -0.1877931, -0.4145584, -0.2332773 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.52826);
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
