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
-3.326687, 1.95268, 0.2702818, 1, 0, 0, 1,
-2.875561, -0.760226, -2.20467, 1, 0.007843138, 0, 1,
-2.832278, -0.09888498, -2.781898, 1, 0.01176471, 0, 1,
-2.671259, -0.02396435, -2.629893, 1, 0.01960784, 0, 1,
-2.6249, -1.114363, -1.053662, 1, 0.02352941, 0, 1,
-2.586531, 0.3997672, -0.9360906, 1, 0.03137255, 0, 1,
-2.493733, -0.270648, -0.0551848, 1, 0.03529412, 0, 1,
-2.42957, 1.134863, -0.5671853, 1, 0.04313726, 0, 1,
-2.372959, -0.5092565, 0.03439243, 1, 0.04705882, 0, 1,
-2.345619, 0.4528936, -1.099907, 1, 0.05490196, 0, 1,
-2.328224, -0.2873771, -0.0539226, 1, 0.05882353, 0, 1,
-2.297719, -0.3537602, -1.561637, 1, 0.06666667, 0, 1,
-2.272321, 1.4048, -2.477438, 1, 0.07058824, 0, 1,
-2.26161, 0.1114781, -1.628037, 1, 0.07843138, 0, 1,
-2.234407, -0.03709897, -0.7592273, 1, 0.08235294, 0, 1,
-2.167388, -0.7853447, -1.429652, 1, 0.09019608, 0, 1,
-2.151068, 0.821393, -0.7165025, 1, 0.09411765, 0, 1,
-2.136111, -2.262318, -3.683608, 1, 0.1019608, 0, 1,
-2.113588, -0.4778091, -0.8027144, 1, 0.1098039, 0, 1,
-2.102491, 1.025341, -1.178969, 1, 0.1137255, 0, 1,
-2.094511, -0.3551899, -2.964624, 1, 0.1215686, 0, 1,
-2.079314, -1.482253, -2.376996, 1, 0.1254902, 0, 1,
-2.033923, 0.2646056, -1.762837, 1, 0.1333333, 0, 1,
-2.027974, 1.559029, 0.4813311, 1, 0.1372549, 0, 1,
-2.01306, -2.379114, -2.921936, 1, 0.145098, 0, 1,
-2.007275, -0.007621536, 0.1164347, 1, 0.1490196, 0, 1,
-2.001222, 0.05900136, -0.4788189, 1, 0.1568628, 0, 1,
-1.99596, 0.6050834, -0.8703061, 1, 0.1607843, 0, 1,
-1.978494, -0.4368795, -0.2175047, 1, 0.1686275, 0, 1,
-1.973049, -1.92459, -0.6798093, 1, 0.172549, 0, 1,
-1.950214, 1.721333, -0.6414678, 1, 0.1803922, 0, 1,
-1.897185, -0.9713182, -0.8341153, 1, 0.1843137, 0, 1,
-1.894488, 0.2359695, -1.004397, 1, 0.1921569, 0, 1,
-1.878906, -0.90024, -0.4112237, 1, 0.1960784, 0, 1,
-1.855417, -0.817651, -2.584402, 1, 0.2039216, 0, 1,
-1.839034, 0.3443578, -2.162763, 1, 0.2117647, 0, 1,
-1.836722, -1.881209, -3.33798, 1, 0.2156863, 0, 1,
-1.820027, 0.03342512, -2.901847, 1, 0.2235294, 0, 1,
-1.810874, -0.09205944, -1.27581, 1, 0.227451, 0, 1,
-1.801542, 0.09730543, -2.210209, 1, 0.2352941, 0, 1,
-1.77384, 0.1718255, -1.734463, 1, 0.2392157, 0, 1,
-1.771993, -0.9496007, -3.494144, 1, 0.2470588, 0, 1,
-1.768557, -0.8543736, -1.438008, 1, 0.2509804, 0, 1,
-1.765265, 1.99296, -0.6723731, 1, 0.2588235, 0, 1,
-1.758986, 0.1098611, -1.145066, 1, 0.2627451, 0, 1,
-1.745143, -0.003509414, -2.631128, 1, 0.2705882, 0, 1,
-1.743968, 0.5291895, -0.530486, 1, 0.2745098, 0, 1,
-1.741716, 1.235486, -1.716912, 1, 0.282353, 0, 1,
-1.73877, -0.06202451, -0.1227428, 1, 0.2862745, 0, 1,
-1.73862, -0.682256, -2.917776, 1, 0.2941177, 0, 1,
-1.736379, 2.075361, -1.1412, 1, 0.3019608, 0, 1,
-1.720547, -0.5831618, -3.561434, 1, 0.3058824, 0, 1,
-1.707712, -0.003769291, -2.214789, 1, 0.3137255, 0, 1,
-1.703651, -0.3135416, -2.929846, 1, 0.3176471, 0, 1,
-1.696856, -1.437896, -2.829182, 1, 0.3254902, 0, 1,
-1.696368, 0.6614058, -1.350741, 1, 0.3294118, 0, 1,
-1.682711, 0.135152, -1.896358, 1, 0.3372549, 0, 1,
-1.668292, 0.5153391, -1.193439, 1, 0.3411765, 0, 1,
-1.661657, 1.001262, 0.5545644, 1, 0.3490196, 0, 1,
-1.661107, -0.209353, -2.625877, 1, 0.3529412, 0, 1,
-1.636179, 2.066824, -1.330319, 1, 0.3607843, 0, 1,
-1.634223, -0.4400447, -2.29601, 1, 0.3647059, 0, 1,
-1.631787, -1.088536, -3.270826, 1, 0.372549, 0, 1,
-1.623066, -0.4806952, -1.468793, 1, 0.3764706, 0, 1,
-1.612665, 0.459406, -1.292587, 1, 0.3843137, 0, 1,
-1.612499, -0.009603242, -1.874091, 1, 0.3882353, 0, 1,
-1.590486, -1.815678, -1.46299, 1, 0.3960784, 0, 1,
-1.58994, -1.367394, -2.402904, 1, 0.4039216, 0, 1,
-1.582342, -1.092957, -0.07113148, 1, 0.4078431, 0, 1,
-1.580423, -1.413972, -3.449359, 1, 0.4156863, 0, 1,
-1.574319, -0.8298646, -4.301013, 1, 0.4196078, 0, 1,
-1.554317, 0.8716617, -1.221197, 1, 0.427451, 0, 1,
-1.543809, 0.7533152, -1.047512, 1, 0.4313726, 0, 1,
-1.536802, -0.1747811, -1.682994, 1, 0.4392157, 0, 1,
-1.530466, 1.228387, -2.074905, 1, 0.4431373, 0, 1,
-1.527746, -0.07827664, -2.868031, 1, 0.4509804, 0, 1,
-1.523471, 0.01262833, -1.345349, 1, 0.454902, 0, 1,
-1.520885, -1.154428, -2.405771, 1, 0.4627451, 0, 1,
-1.498466, 0.7522289, -0.6587439, 1, 0.4666667, 0, 1,
-1.496407, -0.1189694, -2.843506, 1, 0.4745098, 0, 1,
-1.486269, 0.4202716, 0.2162785, 1, 0.4784314, 0, 1,
-1.475565, -0.180097, -3.055161, 1, 0.4862745, 0, 1,
-1.473906, -0.5829954, -1.835098, 1, 0.4901961, 0, 1,
-1.463805, -1.010846, -3.437456, 1, 0.4980392, 0, 1,
-1.461068, 0.4544229, -0.4712023, 1, 0.5058824, 0, 1,
-1.450186, -0.634326, -1.4667, 1, 0.509804, 0, 1,
-1.439453, -1.901123, -1.386515, 1, 0.5176471, 0, 1,
-1.438071, -0.1822732, -1.731044, 1, 0.5215687, 0, 1,
-1.436227, -0.2591269, -1.208416, 1, 0.5294118, 0, 1,
-1.435685, -0.9972857, -1.585135, 1, 0.5333334, 0, 1,
-1.432399, -2.207244, -4.052145, 1, 0.5411765, 0, 1,
-1.429744, -0.6097172, -1.021516, 1, 0.5450981, 0, 1,
-1.428816, -0.5624852, -0.6537606, 1, 0.5529412, 0, 1,
-1.42343, -1.301059, -2.614394, 1, 0.5568628, 0, 1,
-1.42326, -0.5070982, -2.143461, 1, 0.5647059, 0, 1,
-1.411528, 1.791167, -0.8362476, 1, 0.5686275, 0, 1,
-1.408173, -0.3337268, -4.165392, 1, 0.5764706, 0, 1,
-1.407947, -0.03447242, -2.912524, 1, 0.5803922, 0, 1,
-1.407659, -0.9837852, -1.40561, 1, 0.5882353, 0, 1,
-1.406458, 1.944474, -0.751433, 1, 0.5921569, 0, 1,
-1.390548, 0.05997874, -2.336329, 1, 0.6, 0, 1,
-1.390509, -0.3457989, -1.52194, 1, 0.6078432, 0, 1,
-1.388537, 1.295944, -1.11013, 1, 0.6117647, 0, 1,
-1.387558, 0.4071062, -2.206575, 1, 0.6196079, 0, 1,
-1.36045, -0.2300048, -1.372163, 1, 0.6235294, 0, 1,
-1.357705, 1.192833, 0.05928376, 1, 0.6313726, 0, 1,
-1.355802, -0.7797182, -2.634578, 1, 0.6352941, 0, 1,
-1.339127, -0.6412634, 0.04175928, 1, 0.6431373, 0, 1,
-1.324479, 0.2133405, -1.186362, 1, 0.6470588, 0, 1,
-1.319156, -0.2500667, -2.735655, 1, 0.654902, 0, 1,
-1.306988, 0.2809971, -1.761408, 1, 0.6588235, 0, 1,
-1.300227, -0.911698, -1.018085, 1, 0.6666667, 0, 1,
-1.300054, -0.4063029, -2.466899, 1, 0.6705883, 0, 1,
-1.297906, 0.3344845, -1.584952, 1, 0.6784314, 0, 1,
-1.294811, 0.03867088, -2.098808, 1, 0.682353, 0, 1,
-1.274106, 0.1458533, -1.334938, 1, 0.6901961, 0, 1,
-1.273989, -0.816229, -3.118694, 1, 0.6941177, 0, 1,
-1.269262, -1.692388, -2.381983, 1, 0.7019608, 0, 1,
-1.26144, 1.145894, 2.207185, 1, 0.7098039, 0, 1,
-1.253309, 0.2407264, -0.6809849, 1, 0.7137255, 0, 1,
-1.251737, -1.607452, -2.318726, 1, 0.7215686, 0, 1,
-1.249991, -1.494587, -3.092448, 1, 0.7254902, 0, 1,
-1.228502, -0.04288655, -2.154219, 1, 0.7333333, 0, 1,
-1.226188, -0.02848438, -1.815164, 1, 0.7372549, 0, 1,
-1.217875, 0.07250293, -1.981498, 1, 0.7450981, 0, 1,
-1.210883, 0.2898202, 0.05918176, 1, 0.7490196, 0, 1,
-1.196734, -1.267266, -1.534857, 1, 0.7568628, 0, 1,
-1.187332, -1.523463, -2.754033, 1, 0.7607843, 0, 1,
-1.18676, -1.416564, -3.512888, 1, 0.7686275, 0, 1,
-1.183416, 1.034418, 0.5391707, 1, 0.772549, 0, 1,
-1.183375, 0.6479793, -1.75177, 1, 0.7803922, 0, 1,
-1.182356, 0.9765055, 1.07178, 1, 0.7843137, 0, 1,
-1.1783, 1.091466, 0.2918552, 1, 0.7921569, 0, 1,
-1.175664, 0.8252752, -1.503602, 1, 0.7960784, 0, 1,
-1.170963, -0.5166732, -1.269588, 1, 0.8039216, 0, 1,
-1.169152, 0.7873139, -0.1932846, 1, 0.8117647, 0, 1,
-1.16879, 0.5898352, -0.6796102, 1, 0.8156863, 0, 1,
-1.16807, -2.069352, -1.610555, 1, 0.8235294, 0, 1,
-1.167325, 1.051247, -1.085127, 1, 0.827451, 0, 1,
-1.159982, 0.1797696, -0.8338165, 1, 0.8352941, 0, 1,
-1.158629, 1.823647, -0.4367879, 1, 0.8392157, 0, 1,
-1.158237, -1.582269, -3.185568, 1, 0.8470588, 0, 1,
-1.154895, -0.8513623, -4.343047, 1, 0.8509804, 0, 1,
-1.147205, 0.4823788, 0.5094969, 1, 0.8588235, 0, 1,
-1.14712, -1.010641, 0.5265376, 1, 0.8627451, 0, 1,
-1.143366, -0.677008, -0.9808953, 1, 0.8705882, 0, 1,
-1.139769, 2.308117, -0.7702329, 1, 0.8745098, 0, 1,
-1.13771, 0.2250052, -1.678303, 1, 0.8823529, 0, 1,
-1.136746, 0.202442, -1.406437, 1, 0.8862745, 0, 1,
-1.125875, 0.4074731, -0.02464392, 1, 0.8941177, 0, 1,
-1.124226, 0.1441717, -0.9345194, 1, 0.8980392, 0, 1,
-1.107305, 2.072337, 0.8906063, 1, 0.9058824, 0, 1,
-1.099136, 0.2640038, -1.70054, 1, 0.9137255, 0, 1,
-1.095817, 0.2503636, -0.6238384, 1, 0.9176471, 0, 1,
-1.088509, 0.3115641, -0.1880713, 1, 0.9254902, 0, 1,
-1.083376, 0.2251604, 0.7551612, 1, 0.9294118, 0, 1,
-1.083083, 0.535085, -0.3041248, 1, 0.9372549, 0, 1,
-1.07958, 0.09479612, -1.812258, 1, 0.9411765, 0, 1,
-1.072653, -0.6767716, -1.546109, 1, 0.9490196, 0, 1,
-1.070437, -0.9419358, -2.465566, 1, 0.9529412, 0, 1,
-1.070339, 0.06643082, -2.238117, 1, 0.9607843, 0, 1,
-1.065297, 0.8220903, -0.8681712, 1, 0.9647059, 0, 1,
-1.061938, -0.4687533, -1.865398, 1, 0.972549, 0, 1,
-1.058428, -0.4985007, -1.624815, 1, 0.9764706, 0, 1,
-1.056738, 0.02751731, -0.9441574, 1, 0.9843137, 0, 1,
-1.0561, -1.42081, -2.133642, 1, 0.9882353, 0, 1,
-1.054383, 0.1665455, -1.043631, 1, 0.9960784, 0, 1,
-1.048865, -1.456202, -1.927413, 0.9960784, 1, 0, 1,
-1.044375, 2.616323, -0.4572091, 0.9921569, 1, 0, 1,
-1.039188, -1.364651, -2.355291, 0.9843137, 1, 0, 1,
-1.037278, -1.438522, -2.78804, 0.9803922, 1, 0, 1,
-1.031925, -1.288313, -2.752603, 0.972549, 1, 0, 1,
-1.028497, 1.514065, 0.7845547, 0.9686275, 1, 0, 1,
-1.026692, -0.3047001, -2.454255, 0.9607843, 1, 0, 1,
-1.020774, 0.05423038, -0.0996009, 0.9568627, 1, 0, 1,
-1.019571, -3.635793, -4.263904, 0.9490196, 1, 0, 1,
-1.017069, 0.8148795, -2.14616, 0.945098, 1, 0, 1,
-0.996245, -0.2992544, -1.305981, 0.9372549, 1, 0, 1,
-0.9958948, -0.4014263, -2.512336, 0.9333333, 1, 0, 1,
-0.9942755, 1.715585, -0.1887916, 0.9254902, 1, 0, 1,
-0.9916412, 1.533905, -0.2526907, 0.9215686, 1, 0, 1,
-0.9817377, 1.231722, -0.7353137, 0.9137255, 1, 0, 1,
-0.9751256, 0.528107, -2.15756, 0.9098039, 1, 0, 1,
-0.9736494, 0.4893911, -1.356457, 0.9019608, 1, 0, 1,
-0.9707432, -2.597061, -4.355449, 0.8941177, 1, 0, 1,
-0.9636354, 1.020077, -1.249142, 0.8901961, 1, 0, 1,
-0.9634869, -0.8489904, -3.046621, 0.8823529, 1, 0, 1,
-0.9581069, 0.4782052, -1.581959, 0.8784314, 1, 0, 1,
-0.9509147, 0.514931, -0.5007917, 0.8705882, 1, 0, 1,
-0.9362243, 0.1451067, -1.342877, 0.8666667, 1, 0, 1,
-0.9343656, -2.117769, -1.115977, 0.8588235, 1, 0, 1,
-0.9259158, -0.2476472, -2.590385, 0.854902, 1, 0, 1,
-0.9238059, 1.131331, -1.083523, 0.8470588, 1, 0, 1,
-0.919274, 0.9032372, -3.346689, 0.8431373, 1, 0, 1,
-0.9182581, -1.089635, -1.71568, 0.8352941, 1, 0, 1,
-0.910234, -0.1850271, -2.228513, 0.8313726, 1, 0, 1,
-0.903874, -0.9732116, -2.910959, 0.8235294, 1, 0, 1,
-0.9029102, -1.425929, -3.040236, 0.8196079, 1, 0, 1,
-0.9004245, 3.195396, -0.9769974, 0.8117647, 1, 0, 1,
-0.8879228, -1.461824, -3.865767, 0.8078431, 1, 0, 1,
-0.8849433, -1.365796, -2.821844, 0.8, 1, 0, 1,
-0.883612, 0.8746297, -0.5751802, 0.7921569, 1, 0, 1,
-0.8831556, -1.470854, -3.006528, 0.7882353, 1, 0, 1,
-0.8757906, -0.1910317, -1.146362, 0.7803922, 1, 0, 1,
-0.8631861, -0.5101334, -1.104125, 0.7764706, 1, 0, 1,
-0.8589714, 0.5760671, -1.144515, 0.7686275, 1, 0, 1,
-0.8558056, 0.9157043, -0.2519982, 0.7647059, 1, 0, 1,
-0.8513899, -1.150513, -1.38197, 0.7568628, 1, 0, 1,
-0.8476305, 0.3420741, -0.3695572, 0.7529412, 1, 0, 1,
-0.8464254, 1.1756, -0.977562, 0.7450981, 1, 0, 1,
-0.8408654, 0.6484273, -1.606943, 0.7411765, 1, 0, 1,
-0.8401941, 0.2545789, -1.213986, 0.7333333, 1, 0, 1,
-0.8342876, 1.123903, 0.8330029, 0.7294118, 1, 0, 1,
-0.8214946, -0.8316934, -2.883734, 0.7215686, 1, 0, 1,
-0.8159823, 1.484814, -1.91062, 0.7176471, 1, 0, 1,
-0.814923, 0.2669173, -2.778216, 0.7098039, 1, 0, 1,
-0.8138961, -0.1403608, -1.303975, 0.7058824, 1, 0, 1,
-0.809914, -0.07152982, -2.697093, 0.6980392, 1, 0, 1,
-0.8093876, -0.7535557, -2.027125, 0.6901961, 1, 0, 1,
-0.8042766, 1.054139, -0.8624478, 0.6862745, 1, 0, 1,
-0.8035828, 0.7049161, 0.5032476, 0.6784314, 1, 0, 1,
-0.8020723, -1.296747, -2.599567, 0.6745098, 1, 0, 1,
-0.788738, 0.2495552, -1.383968, 0.6666667, 1, 0, 1,
-0.7884647, 0.7813899, -2.695046, 0.6627451, 1, 0, 1,
-0.788116, -0.5523998, -2.071074, 0.654902, 1, 0, 1,
-0.7874261, 0.6258118, -1.982773, 0.6509804, 1, 0, 1,
-0.786512, 0.7453223, -2.666831, 0.6431373, 1, 0, 1,
-0.7851905, -0.7442552, -3.124016, 0.6392157, 1, 0, 1,
-0.7780561, 0.5756278, -0.3941165, 0.6313726, 1, 0, 1,
-0.7757534, 0.482374, -1.674578, 0.627451, 1, 0, 1,
-0.7703779, 0.8069511, -0.7487423, 0.6196079, 1, 0, 1,
-0.7700411, 0.05237007, -0.6432713, 0.6156863, 1, 0, 1,
-0.7692741, 3.431183, -0.5394761, 0.6078432, 1, 0, 1,
-0.7655793, -0.8268229, -2.040856, 0.6039216, 1, 0, 1,
-0.7606062, 0.1894296, -1.556908, 0.5960785, 1, 0, 1,
-0.7594345, -1.013834, -3.425643, 0.5882353, 1, 0, 1,
-0.7590432, -0.2751746, -2.941861, 0.5843138, 1, 0, 1,
-0.7580211, -1.215358, -2.533301, 0.5764706, 1, 0, 1,
-0.7571857, 0.7195454, -0.1946511, 0.572549, 1, 0, 1,
-0.7395118, 0.9965091, -0.6599137, 0.5647059, 1, 0, 1,
-0.7378458, 0.006073368, -2.091437, 0.5607843, 1, 0, 1,
-0.7295984, -0.03262585, -2.086718, 0.5529412, 1, 0, 1,
-0.7274609, 0.9853358, -2.020443, 0.5490196, 1, 0, 1,
-0.7270337, 1.299011, 1.207684, 0.5411765, 1, 0, 1,
-0.722658, 0.9384375, 0.9600211, 0.5372549, 1, 0, 1,
-0.7189354, -0.8933737, -2.101103, 0.5294118, 1, 0, 1,
-0.7172996, 0.513639, -0.9705637, 0.5254902, 1, 0, 1,
-0.7144761, -0.5074427, -0.8347335, 0.5176471, 1, 0, 1,
-0.7126945, -0.6347051, -1.342966, 0.5137255, 1, 0, 1,
-0.7033516, -0.3021201, -1.47198, 0.5058824, 1, 0, 1,
-0.6984364, 0.6747682, -0.0688829, 0.5019608, 1, 0, 1,
-0.6973729, 0.4399982, -0.07923301, 0.4941176, 1, 0, 1,
-0.6960628, 0.3087127, -1.157484, 0.4862745, 1, 0, 1,
-0.6945796, -0.4519759, -3.65644, 0.4823529, 1, 0, 1,
-0.6935745, -0.7844746, -2.745028, 0.4745098, 1, 0, 1,
-0.6906676, 0.09209988, -1.814062, 0.4705882, 1, 0, 1,
-0.6899792, 0.1670571, -1.105588, 0.4627451, 1, 0, 1,
-0.6879626, 1.535205, -1.742185, 0.4588235, 1, 0, 1,
-0.668013, -0.2623059, -3.67261, 0.4509804, 1, 0, 1,
-0.661485, -0.8971174, -3.13412, 0.4470588, 1, 0, 1,
-0.6498446, 1.681506, -0.4571146, 0.4392157, 1, 0, 1,
-0.6496273, -0.7554043, -1.429855, 0.4352941, 1, 0, 1,
-0.6486569, 1.311157, -2.763116, 0.427451, 1, 0, 1,
-0.646352, 2.019614, -0.8364154, 0.4235294, 1, 0, 1,
-0.6431107, -1.310561, -1.379858, 0.4156863, 1, 0, 1,
-0.6369194, 0.202486, -1.255498, 0.4117647, 1, 0, 1,
-0.6318557, 0.901636, -1.494706, 0.4039216, 1, 0, 1,
-0.6310422, 0.7946404, -0.5033607, 0.3960784, 1, 0, 1,
-0.6305119, 0.6145652, -1.664388, 0.3921569, 1, 0, 1,
-0.6286678, -1.026478, -2.095802, 0.3843137, 1, 0, 1,
-0.6285396, 0.6993635, -1.414557, 0.3803922, 1, 0, 1,
-0.6208378, -0.4451754, -2.690614, 0.372549, 1, 0, 1,
-0.6206892, 1.36946, -0.7578489, 0.3686275, 1, 0, 1,
-0.6170009, -1.391917, -2.574223, 0.3607843, 1, 0, 1,
-0.6169041, 0.6649502, 0.2327388, 0.3568628, 1, 0, 1,
-0.6167737, -0.4701816, -1.919902, 0.3490196, 1, 0, 1,
-0.6162586, 1.05657, -0.961515, 0.345098, 1, 0, 1,
-0.6155873, -0.8483843, -3.709638, 0.3372549, 1, 0, 1,
-0.6143322, 0.8041203, 1.1757, 0.3333333, 1, 0, 1,
-0.6123489, 0.6986601, -1.949113, 0.3254902, 1, 0, 1,
-0.5979995, -0.07257801, -1.821537, 0.3215686, 1, 0, 1,
-0.5978144, -1.266033, -3.830347, 0.3137255, 1, 0, 1,
-0.5885903, 0.4864858, -0.7641757, 0.3098039, 1, 0, 1,
-0.5747569, 0.5904402, -1.915333, 0.3019608, 1, 0, 1,
-0.5746713, -0.1282011, -1.784196, 0.2941177, 1, 0, 1,
-0.5662982, -0.137526, -3.2451, 0.2901961, 1, 0, 1,
-0.5655546, 1.539133, -1.34457, 0.282353, 1, 0, 1,
-0.5556288, 1.140596, 0.07637887, 0.2784314, 1, 0, 1,
-0.5547955, 0.4875682, 0.3725694, 0.2705882, 1, 0, 1,
-0.5545883, 1.194747, 1.101829, 0.2666667, 1, 0, 1,
-0.5543374, 0.7745094, 1.059648, 0.2588235, 1, 0, 1,
-0.5527559, -0.3678117, -2.795738, 0.254902, 1, 0, 1,
-0.5464974, 0.8859609, -2.504617, 0.2470588, 1, 0, 1,
-0.5401492, 1.22985, 0.4847909, 0.2431373, 1, 0, 1,
-0.5383458, -1.735832, -2.865346, 0.2352941, 1, 0, 1,
-0.5350499, -0.5542425, -2.45802, 0.2313726, 1, 0, 1,
-0.5284204, 1.136215, -1.122907, 0.2235294, 1, 0, 1,
-0.5278086, 0.1802229, -0.6955881, 0.2196078, 1, 0, 1,
-0.5190965, -0.817655, -1.673982, 0.2117647, 1, 0, 1,
-0.5148298, 0.8509123, -1.103294, 0.2078431, 1, 0, 1,
-0.5137235, 0.1624176, -0.7046401, 0.2, 1, 0, 1,
-0.51152, -0.18927, -1.871986, 0.1921569, 1, 0, 1,
-0.5081248, 1.751661, -1.555258, 0.1882353, 1, 0, 1,
-0.5068031, -0.7166639, -2.25898, 0.1803922, 1, 0, 1,
-0.506551, -0.1591273, -1.121728, 0.1764706, 1, 0, 1,
-0.5055987, 2.208667, 0.343438, 0.1686275, 1, 0, 1,
-0.5041687, -0.9687076, -1.331405, 0.1647059, 1, 0, 1,
-0.4991829, -0.5125738, -2.888005, 0.1568628, 1, 0, 1,
-0.4979867, 1.921179, 0.8959389, 0.1529412, 1, 0, 1,
-0.496498, -1.542718, -1.962958, 0.145098, 1, 0, 1,
-0.4964092, -0.5387987, -0.8108612, 0.1411765, 1, 0, 1,
-0.4935057, 0.108549, -0.4992016, 0.1333333, 1, 0, 1,
-0.4886605, 0.7770139, -0.3992866, 0.1294118, 1, 0, 1,
-0.4884447, -1.406114, -1.793043, 0.1215686, 1, 0, 1,
-0.4870903, -0.7026639, -2.648928, 0.1176471, 1, 0, 1,
-0.4815477, -0.6689052, -2.680581, 0.1098039, 1, 0, 1,
-0.4809968, 0.8638447, -1.832652, 0.1058824, 1, 0, 1,
-0.4804243, -2.189489, -3.268924, 0.09803922, 1, 0, 1,
-0.4767633, -1.28446, -2.178927, 0.09019608, 1, 0, 1,
-0.473846, 1.20015, 0.02083764, 0.08627451, 1, 0, 1,
-0.4729127, 1.045618, -0.2933456, 0.07843138, 1, 0, 1,
-0.4673424, -1.290047, -3.407093, 0.07450981, 1, 0, 1,
-0.4657859, 0.8014888, -0.00216852, 0.06666667, 1, 0, 1,
-0.4656933, 2.208831, 0.6327398, 0.0627451, 1, 0, 1,
-0.4587069, -0.3902262, -3.355671, 0.05490196, 1, 0, 1,
-0.454152, -0.5583197, -3.215737, 0.05098039, 1, 0, 1,
-0.450089, 0.8269098, -0.2519647, 0.04313726, 1, 0, 1,
-0.448026, -0.425804, -2.150771, 0.03921569, 1, 0, 1,
-0.447756, 0.131099, -2.452509, 0.03137255, 1, 0, 1,
-0.444951, -0.3389676, -1.865951, 0.02745098, 1, 0, 1,
-0.4378968, -0.6278147, -3.978336, 0.01960784, 1, 0, 1,
-0.4349218, -0.7558433, -3.124979, 0.01568628, 1, 0, 1,
-0.4336888, 0.4733051, -0.3583785, 0.007843138, 1, 0, 1,
-0.4334408, -0.5570969, -0.8049273, 0.003921569, 1, 0, 1,
-0.4327015, -0.202275, -2.133438, 0, 1, 0.003921569, 1,
-0.4309052, 2.243523, 0.3079369, 0, 1, 0.01176471, 1,
-0.4253379, -1.137385, -3.166127, 0, 1, 0.01568628, 1,
-0.420439, 0.7140822, -1.274989, 0, 1, 0.02352941, 1,
-0.4177898, -0.009960201, -2.272889, 0, 1, 0.02745098, 1,
-0.415931, 1.834766, -0.4172582, 0, 1, 0.03529412, 1,
-0.4155378, 0.3928141, -0.3905741, 0, 1, 0.03921569, 1,
-0.4118116, -2.076477, -3.108696, 0, 1, 0.04705882, 1,
-0.4108482, -0.5301274, -3.469538, 0, 1, 0.05098039, 1,
-0.40787, -1.676422, -2.750728, 0, 1, 0.05882353, 1,
-0.4061457, -2.553999, -0.9045052, 0, 1, 0.0627451, 1,
-0.4060448, 1.927539, -0.07485598, 0, 1, 0.07058824, 1,
-0.4027843, -0.7094162, -2.975117, 0, 1, 0.07450981, 1,
-0.4015586, 1.280369, -0.7764695, 0, 1, 0.08235294, 1,
-0.399841, 1.361382, -0.8418943, 0, 1, 0.08627451, 1,
-0.3996683, -0.3299696, -3.292987, 0, 1, 0.09411765, 1,
-0.3918031, -0.2036435, -1.252444, 0, 1, 0.1019608, 1,
-0.3907306, 1.882465, -0.9227744, 0, 1, 0.1058824, 1,
-0.3893962, 0.405628, -1.039981, 0, 1, 0.1137255, 1,
-0.3851086, 0.1825801, 0.08310962, 0, 1, 0.1176471, 1,
-0.3841262, 0.7330322, 0.8918602, 0, 1, 0.1254902, 1,
-0.3788627, -0.09354836, -1.816478, 0, 1, 0.1294118, 1,
-0.3765145, 1.052094, -0.5278732, 0, 1, 0.1372549, 1,
-0.3696294, 1.61323, -0.5368919, 0, 1, 0.1411765, 1,
-0.3640551, -0.6707074, 0.4969764, 0, 1, 0.1490196, 1,
-0.3596005, 0.5778063, 0.3275034, 0, 1, 0.1529412, 1,
-0.3589276, -0.2660884, -2.713862, 0, 1, 0.1607843, 1,
-0.3580847, -0.6609892, -4.254954, 0, 1, 0.1647059, 1,
-0.3577653, 1.538394, 0.6427429, 0, 1, 0.172549, 1,
-0.3570789, 1.718931, 0.4223278, 0, 1, 0.1764706, 1,
-0.3543752, -0.02256978, -1.682486, 0, 1, 0.1843137, 1,
-0.3534177, -0.307234, -3.050671, 0, 1, 0.1882353, 1,
-0.3508673, 0.06326398, -1.652265, 0, 1, 0.1960784, 1,
-0.3498234, -2.272646, -2.121285, 0, 1, 0.2039216, 1,
-0.3489082, 0.8780888, 0.1527525, 0, 1, 0.2078431, 1,
-0.3484832, 1.405774, -3.164961, 0, 1, 0.2156863, 1,
-0.34756, 1.298354, 1.010913, 0, 1, 0.2196078, 1,
-0.345243, 1.314614, -1.349071, 0, 1, 0.227451, 1,
-0.3396179, -0.02751551, -1.196196, 0, 1, 0.2313726, 1,
-0.3385693, -0.9281605, -0.4956991, 0, 1, 0.2392157, 1,
-0.3363208, 2.543736, 0.205726, 0, 1, 0.2431373, 1,
-0.3359315, 0.6970627, -0.8738446, 0, 1, 0.2509804, 1,
-0.3351917, 1.574924, 0.2379339, 0, 1, 0.254902, 1,
-0.3327139, -0.2784942, -0.7095961, 0, 1, 0.2627451, 1,
-0.3324998, -0.9226757, -4.06915, 0, 1, 0.2666667, 1,
-0.3305932, -0.6590229, -2.509564, 0, 1, 0.2745098, 1,
-0.3302888, -0.3426098, -1.987339, 0, 1, 0.2784314, 1,
-0.3290693, 0.3524465, -0.6172557, 0, 1, 0.2862745, 1,
-0.3258344, -0.6139747, -2.770227, 0, 1, 0.2901961, 1,
-0.3251151, -1.82953, -3.017139, 0, 1, 0.2980392, 1,
-0.3193846, 0.5194151, -0.5790529, 0, 1, 0.3058824, 1,
-0.3158312, 0.01679462, -1.798599, 0, 1, 0.3098039, 1,
-0.3120484, 0.2937692, -0.9765149, 0, 1, 0.3176471, 1,
-0.311751, -0.5849889, -2.968365, 0, 1, 0.3215686, 1,
-0.3109786, 0.02050301, -2.743655, 0, 1, 0.3294118, 1,
-0.3103812, 0.3838589, 0.08185107, 0, 1, 0.3333333, 1,
-0.3061245, -0.09260801, -1.054081, 0, 1, 0.3411765, 1,
-0.3048165, 1.649935, -0.3169045, 0, 1, 0.345098, 1,
-0.2999096, 1.014625, -1.178928, 0, 1, 0.3529412, 1,
-0.2909812, -2.069165, -1.927473, 0, 1, 0.3568628, 1,
-0.2868172, -0.4677806, -3.100561, 0, 1, 0.3647059, 1,
-0.2863138, -0.9062581, -3.027263, 0, 1, 0.3686275, 1,
-0.2842728, 0.2381533, -1.678601, 0, 1, 0.3764706, 1,
-0.2807621, -2.870875, -4.355593, 0, 1, 0.3803922, 1,
-0.2781588, -0.1582873, -1.601005, 0, 1, 0.3882353, 1,
-0.2769908, -0.8664993, -3.422697, 0, 1, 0.3921569, 1,
-0.2728226, 0.1175899, -1.219841, 0, 1, 0.4, 1,
-0.2680986, -0.4278073, -2.123666, 0, 1, 0.4078431, 1,
-0.2668127, -1.383006, -2.124126, 0, 1, 0.4117647, 1,
-0.2660985, 2.383456, 0.9025539, 0, 1, 0.4196078, 1,
-0.2658322, -1.963999, -1.583676, 0, 1, 0.4235294, 1,
-0.265442, 0.2643799, -0.3053083, 0, 1, 0.4313726, 1,
-0.2653138, 0.478335, -1.115904, 0, 1, 0.4352941, 1,
-0.2639312, 1.0893, 0.4601007, 0, 1, 0.4431373, 1,
-0.2637681, -0.3687942, -2.011047, 0, 1, 0.4470588, 1,
-0.2625817, 0.5178661, 0.008818064, 0, 1, 0.454902, 1,
-0.2589358, -0.245248, -1.568034, 0, 1, 0.4588235, 1,
-0.251249, -0.4930051, -4.043832, 0, 1, 0.4666667, 1,
-0.2451155, 0.2237749, -0.1443314, 0, 1, 0.4705882, 1,
-0.2411615, -0.2467066, -3.110611, 0, 1, 0.4784314, 1,
-0.238457, -1.592976, -3.9416, 0, 1, 0.4823529, 1,
-0.2373643, -0.3701724, -2.058361, 0, 1, 0.4901961, 1,
-0.2319083, -0.06797145, -3.006245, 0, 1, 0.4941176, 1,
-0.2294611, 0.6405752, -0.7180966, 0, 1, 0.5019608, 1,
-0.2278603, -0.795758, -2.00609, 0, 1, 0.509804, 1,
-0.2241792, 0.6195804, -0.4647516, 0, 1, 0.5137255, 1,
-0.2215115, -0.8421811, -1.764947, 0, 1, 0.5215687, 1,
-0.2214847, 0.6562602, 1.078503, 0, 1, 0.5254902, 1,
-0.2185398, -1.704219, -4.075373, 0, 1, 0.5333334, 1,
-0.2177761, 0.418899, -0.1304399, 0, 1, 0.5372549, 1,
-0.2157406, 0.0755095, -2.451054, 0, 1, 0.5450981, 1,
-0.2150674, -0.4393729, -1.541919, 0, 1, 0.5490196, 1,
-0.2114884, 0.963212, 0.1196829, 0, 1, 0.5568628, 1,
-0.210147, -1.053686, -3.301383, 0, 1, 0.5607843, 1,
-0.2082281, -1.081941, -1.677061, 0, 1, 0.5686275, 1,
-0.207625, 1.254426, 0.07062835, 0, 1, 0.572549, 1,
-0.2060284, 2.241212, -1.032232, 0, 1, 0.5803922, 1,
-0.2040767, -0.1511271, -2.962007, 0, 1, 0.5843138, 1,
-0.2000337, 2.525996, 0.06843778, 0, 1, 0.5921569, 1,
-0.19648, 0.001196076, -2.20945, 0, 1, 0.5960785, 1,
-0.1939628, -0.01797864, -0.3528818, 0, 1, 0.6039216, 1,
-0.1925994, 0.774685, 2.50922, 0, 1, 0.6117647, 1,
-0.1826604, -0.8799093, -2.478675, 0, 1, 0.6156863, 1,
-0.1793237, 0.234576, 0.1442696, 0, 1, 0.6235294, 1,
-0.1791679, 0.7522904, -1.574855, 0, 1, 0.627451, 1,
-0.177943, -0.3589485, -1.23755, 0, 1, 0.6352941, 1,
-0.1761148, -0.7131096, -3.373745, 0, 1, 0.6392157, 1,
-0.175768, 1.487857, 1.7323, 0, 1, 0.6470588, 1,
-0.1744894, -0.9513969, -2.141542, 0, 1, 0.6509804, 1,
-0.1736509, 0.7733387, 0.1658277, 0, 1, 0.6588235, 1,
-0.1725268, 1.05128, 0.4407327, 0, 1, 0.6627451, 1,
-0.1694302, -0.1419937, -3.281996, 0, 1, 0.6705883, 1,
-0.1690014, 0.3871052, -0.4917964, 0, 1, 0.6745098, 1,
-0.1627036, -0.2519439, -3.91702, 0, 1, 0.682353, 1,
-0.162167, 0.1576395, -1.310139, 0, 1, 0.6862745, 1,
-0.1604789, -0.8050983, -2.05655, 0, 1, 0.6941177, 1,
-0.1586718, 0.429843, 0.9204386, 0, 1, 0.7019608, 1,
-0.1563962, -2.047986, -4.25956, 0, 1, 0.7058824, 1,
-0.1558073, -0.8685144, -2.66183, 0, 1, 0.7137255, 1,
-0.1557105, -0.2913758, -3.501279, 0, 1, 0.7176471, 1,
-0.1540772, 2.277696, -0.5045848, 0, 1, 0.7254902, 1,
-0.1535742, 0.5237206, 0.0058176, 0, 1, 0.7294118, 1,
-0.1520525, -0.3720126, -2.540534, 0, 1, 0.7372549, 1,
-0.1517167, -2.219457, -1.819191, 0, 1, 0.7411765, 1,
-0.1504989, 0.3332098, -0.7107266, 0, 1, 0.7490196, 1,
-0.1476016, 0.6684947, -0.658039, 0, 1, 0.7529412, 1,
-0.1471652, 1.533858, -1.820341, 0, 1, 0.7607843, 1,
-0.145504, -0.2141601, -3.823503, 0, 1, 0.7647059, 1,
-0.1378856, -0.2897978, -3.343803, 0, 1, 0.772549, 1,
-0.1334583, -0.08752075, -0.9605255, 0, 1, 0.7764706, 1,
-0.1324814, 1.262197, -1.074274, 0, 1, 0.7843137, 1,
-0.1258714, 0.3521402, 0.8485886, 0, 1, 0.7882353, 1,
-0.1228263, 1.222159, 0.8863148, 0, 1, 0.7960784, 1,
-0.120464, 0.7640977, -1.278921, 0, 1, 0.8039216, 1,
-0.1183989, 0.6977013, -0.001178728, 0, 1, 0.8078431, 1,
-0.1147917, 0.8651003, -0.607686, 0, 1, 0.8156863, 1,
-0.1106321, -0.3013488, -1.573221, 0, 1, 0.8196079, 1,
-0.1036696, -0.9805785, -4.074693, 0, 1, 0.827451, 1,
-0.09854671, 0.3988952, 1.024401, 0, 1, 0.8313726, 1,
-0.09150525, -0.676006, -2.626603, 0, 1, 0.8392157, 1,
-0.09106614, 1.238418, -0.4286434, 0, 1, 0.8431373, 1,
-0.08806936, -1.444355, -3.373849, 0, 1, 0.8509804, 1,
-0.08695242, -0.6545557, -4.809727, 0, 1, 0.854902, 1,
-0.08546203, -0.378507, -3.337395, 0, 1, 0.8627451, 1,
-0.0854392, 1.644701, 1.225323, 0, 1, 0.8666667, 1,
-0.08504444, -0.4155577, -2.275689, 0, 1, 0.8745098, 1,
-0.08330857, -0.237443, -2.95064, 0, 1, 0.8784314, 1,
-0.08236863, 0.3708085, -0.3009307, 0, 1, 0.8862745, 1,
-0.07789298, -0.8809625, -3.986769, 0, 1, 0.8901961, 1,
-0.07670547, -0.1501642, -0.2168987, 0, 1, 0.8980392, 1,
-0.0733426, -0.1239359, -2.465116, 0, 1, 0.9058824, 1,
-0.0705525, -0.5043077, -3.925426, 0, 1, 0.9098039, 1,
-0.0703094, 1.621082, 0.06073684, 0, 1, 0.9176471, 1,
-0.06712259, -1.119216, -3.15324, 0, 1, 0.9215686, 1,
-0.06396829, -0.4310303, -3.269286, 0, 1, 0.9294118, 1,
-0.06260415, -0.02977067, -1.78698, 0, 1, 0.9333333, 1,
-0.06046864, 0.3974151, -2.818004, 0, 1, 0.9411765, 1,
-0.05984402, 2.034963, 1.169415, 0, 1, 0.945098, 1,
-0.05871051, -1.023979, -3.380694, 0, 1, 0.9529412, 1,
-0.05820622, 1.343784, -0.4946957, 0, 1, 0.9568627, 1,
-0.0564454, -0.4543349, -5.414356, 0, 1, 0.9647059, 1,
-0.05316589, -0.9556741, -2.336634, 0, 1, 0.9686275, 1,
-0.05070546, 0.2547172, 0.1136921, 0, 1, 0.9764706, 1,
-0.04803364, 1.561538, -0.6094882, 0, 1, 0.9803922, 1,
-0.04111557, 0.2295137, -0.713459, 0, 1, 0.9882353, 1,
-0.03453196, 0.3530043, 0.4676934, 0, 1, 0.9921569, 1,
-0.03380526, -0.969636, -3.395303, 0, 1, 1, 1,
-0.03252363, 1.314733, 0.9978995, 0, 0.9921569, 1, 1,
-0.02998449, -1.602424, -1.757556, 0, 0.9882353, 1, 1,
-0.02761406, -0.6719041, -2.78196, 0, 0.9803922, 1, 1,
-0.0243363, -1.198881, -2.669441, 0, 0.9764706, 1, 1,
-0.01662664, 0.2831813, -0.1202709, 0, 0.9686275, 1, 1,
-0.009460242, 0.3080623, -2.578591, 0, 0.9647059, 1, 1,
-0.008791069, -2.782159, -4.48603, 0, 0.9568627, 1, 1,
-0.007665682, 0.9955661, -0.6330151, 0, 0.9529412, 1, 1,
-0.006064294, -0.6371977, -2.886097, 0, 0.945098, 1, 1,
-0.004022063, -0.2393503, -3.857387, 0, 0.9411765, 1, 1,
-0.0002414979, -1.31351, -1.641313, 0, 0.9333333, 1, 1,
0.002251892, 0.7228578, -2.152941, 0, 0.9294118, 1, 1,
0.002435306, 1.714869, -0.5517433, 0, 0.9215686, 1, 1,
0.003377536, 1.175946, 1.219394, 0, 0.9176471, 1, 1,
0.004207443, 1.091029, 0.5655412, 0, 0.9098039, 1, 1,
0.006800954, 0.04458837, 0.8404134, 0, 0.9058824, 1, 1,
0.007798161, -0.3749166, 2.260794, 0, 0.8980392, 1, 1,
0.01090922, 1.028705, -0.2401495, 0, 0.8901961, 1, 1,
0.01160914, -0.3773457, 2.603329, 0, 0.8862745, 1, 1,
0.01351631, -0.2452565, 3.541751, 0, 0.8784314, 1, 1,
0.0136942, 0.1406505, -1.008746, 0, 0.8745098, 1, 1,
0.01544188, 0.6387258, -0.6975543, 0, 0.8666667, 1, 1,
0.01911953, -0.5260927, 2.38285, 0, 0.8627451, 1, 1,
0.01952392, 1.730997, -0.1044548, 0, 0.854902, 1, 1,
0.03614525, 1.74789, 0.5184817, 0, 0.8509804, 1, 1,
0.0400679, -0.3727892, 2.182808, 0, 0.8431373, 1, 1,
0.04115835, 0.4373555, 0.7473035, 0, 0.8392157, 1, 1,
0.0412964, 0.1909214, 0.8149452, 0, 0.8313726, 1, 1,
0.0472872, 0.1073598, 0.5384015, 0, 0.827451, 1, 1,
0.05181754, -0.4015837, 2.647655, 0, 0.8196079, 1, 1,
0.05201737, 0.1551744, 0.1267917, 0, 0.8156863, 1, 1,
0.05456194, -0.544156, 3.661002, 0, 0.8078431, 1, 1,
0.06331606, 0.7056429, -1.424931, 0, 0.8039216, 1, 1,
0.06583727, 0.5972025, -1.0662, 0, 0.7960784, 1, 1,
0.06756759, -0.3945881, 4.696548, 0, 0.7882353, 1, 1,
0.06835424, -0.5533021, 2.602428, 0, 0.7843137, 1, 1,
0.06859516, 0.6807222, -0.7676965, 0, 0.7764706, 1, 1,
0.07039947, -0.3317043, 1.699113, 0, 0.772549, 1, 1,
0.07240463, -0.517962, 1.920593, 0, 0.7647059, 1, 1,
0.07263064, -0.8660192, 2.871326, 0, 0.7607843, 1, 1,
0.08059936, -0.8161641, 3.662294, 0, 0.7529412, 1, 1,
0.08577207, 0.5021663, -0.7045001, 0, 0.7490196, 1, 1,
0.09260245, 0.7996129, 0.4098492, 0, 0.7411765, 1, 1,
0.09516501, 0.5803107, 0.7853771, 0, 0.7372549, 1, 1,
0.09532221, 1.137956, 0.2584457, 0, 0.7294118, 1, 1,
0.09641647, -1.22402, 3.236144, 0, 0.7254902, 1, 1,
0.1089234, 0.8709998, 0.3898478, 0, 0.7176471, 1, 1,
0.1153733, 0.9895875, -0.5528029, 0, 0.7137255, 1, 1,
0.1215078, -2.424647, 4.327344, 0, 0.7058824, 1, 1,
0.1223896, -0.8413703, 4.468269, 0, 0.6980392, 1, 1,
0.1238418, 0.1322168, 0.7340894, 0, 0.6941177, 1, 1,
0.1267711, -0.4913108, 3.468343, 0, 0.6862745, 1, 1,
0.1277156, 0.5981916, 1.25344, 0, 0.682353, 1, 1,
0.1293873, -0.422655, 3.07118, 0, 0.6745098, 1, 1,
0.1307515, 0.08831681, 1.720398, 0, 0.6705883, 1, 1,
0.1328749, 0.4825687, -0.6463798, 0, 0.6627451, 1, 1,
0.1402315, -0.03282261, 1.858079, 0, 0.6588235, 1, 1,
0.1457266, -0.4612361, 1.918347, 0, 0.6509804, 1, 1,
0.1491049, -0.2401334, 2.927995, 0, 0.6470588, 1, 1,
0.1513231, -0.4027225, 4.61802, 0, 0.6392157, 1, 1,
0.1514077, 0.7342092, 0.3926934, 0, 0.6352941, 1, 1,
0.1538058, 0.03533172, 0.1889058, 0, 0.627451, 1, 1,
0.1547642, 0.3333704, -0.8619769, 0, 0.6235294, 1, 1,
0.1591514, -0.1286495, 3.233351, 0, 0.6156863, 1, 1,
0.1592695, -0.9995853, 2.796051, 0, 0.6117647, 1, 1,
0.1634841, -1.110745, 2.312259, 0, 0.6039216, 1, 1,
0.1659229, 0.6229548, 1.423376, 0, 0.5960785, 1, 1,
0.1685942, -0.8248954, 2.536024, 0, 0.5921569, 1, 1,
0.1704973, 0.1379985, 0.931954, 0, 0.5843138, 1, 1,
0.1782715, 0.608122, -0.9599813, 0, 0.5803922, 1, 1,
0.1784493, 0.1415384, -0.1924196, 0, 0.572549, 1, 1,
0.1870019, 0.8867099, -0.6692023, 0, 0.5686275, 1, 1,
0.200418, 0.3717491, 1.523875, 0, 0.5607843, 1, 1,
0.2026736, -0.3976954, 2.139412, 0, 0.5568628, 1, 1,
0.205119, 0.2665514, 0.9722685, 0, 0.5490196, 1, 1,
0.2127807, 0.7884477, -0.8449573, 0, 0.5450981, 1, 1,
0.213147, 0.6089369, 3.031948, 0, 0.5372549, 1, 1,
0.2134173, -0.303764, 3.318731, 0, 0.5333334, 1, 1,
0.2197004, -0.09426399, 1.135832, 0, 0.5254902, 1, 1,
0.221192, 0.482253, 1.337107, 0, 0.5215687, 1, 1,
0.2229036, 2.23949, -0.1211702, 0, 0.5137255, 1, 1,
0.2235136, -1.052376, 3.008338, 0, 0.509804, 1, 1,
0.2253234, -0.3442825, 3.108355, 0, 0.5019608, 1, 1,
0.2318301, 0.1176654, 2.173966, 0, 0.4941176, 1, 1,
0.2324499, -0.1292785, 1.785838, 0, 0.4901961, 1, 1,
0.2363171, 0.8270138, -0.01228144, 0, 0.4823529, 1, 1,
0.2378922, -1.695859, 3.54173, 0, 0.4784314, 1, 1,
0.2382269, 0.3124893, 1.040827, 0, 0.4705882, 1, 1,
0.2382474, 0.5664732, 1.884371, 0, 0.4666667, 1, 1,
0.2419115, 1.256435, -0.7802917, 0, 0.4588235, 1, 1,
0.2480943, 0.1660277, 0.722716, 0, 0.454902, 1, 1,
0.2519881, -0.7475228, 3.261308, 0, 0.4470588, 1, 1,
0.2523546, -0.01667627, 2.00902, 0, 0.4431373, 1, 1,
0.2524251, 1.776525, 0.1035998, 0, 0.4352941, 1, 1,
0.2576006, 0.5445045, 2.072302, 0, 0.4313726, 1, 1,
0.262537, 0.6592408, -1.228301, 0, 0.4235294, 1, 1,
0.2632035, -0.7824811, 1.801418, 0, 0.4196078, 1, 1,
0.2637999, 0.2186645, 2.642844, 0, 0.4117647, 1, 1,
0.2639109, -0.2048674, 2.54017, 0, 0.4078431, 1, 1,
0.2649156, -0.8694701, 4.998654, 0, 0.4, 1, 1,
0.2649539, 1.208085, 0.08621086, 0, 0.3921569, 1, 1,
0.2672428, -1.220669, 4.272565, 0, 0.3882353, 1, 1,
0.2675972, 1.630472, 0.7758152, 0, 0.3803922, 1, 1,
0.2696154, -0.4762947, 2.837621, 0, 0.3764706, 1, 1,
0.2785575, 2.126374, 0.4703285, 0, 0.3686275, 1, 1,
0.2797788, 1.333041, 0.766265, 0, 0.3647059, 1, 1,
0.2835888, -0.05648716, 3.411528, 0, 0.3568628, 1, 1,
0.2884523, -0.5743809, 0.8242362, 0, 0.3529412, 1, 1,
0.2891681, -1.884674, 1.977233, 0, 0.345098, 1, 1,
0.2907284, -0.6039782, 2.798467, 0, 0.3411765, 1, 1,
0.2914958, -1.757552, 4.275822, 0, 0.3333333, 1, 1,
0.2939796, -0.03511125, 2.161704, 0, 0.3294118, 1, 1,
0.2968744, -0.2990649, 3.098838, 0, 0.3215686, 1, 1,
0.297253, -0.2213621, 3.859991, 0, 0.3176471, 1, 1,
0.2974468, 0.8891432, 2.43227, 0, 0.3098039, 1, 1,
0.2978446, 1.032973, -0.6255449, 0, 0.3058824, 1, 1,
0.2989766, 0.5606378, 0.06484744, 0, 0.2980392, 1, 1,
0.3036943, -1.006196, 3.651886, 0, 0.2901961, 1, 1,
0.3079382, -1.177863, 2.371979, 0, 0.2862745, 1, 1,
0.3079597, 1.372013, -0.1703025, 0, 0.2784314, 1, 1,
0.3115793, -1.281543, 2.226204, 0, 0.2745098, 1, 1,
0.3148349, 0.1402467, 0.2424214, 0, 0.2666667, 1, 1,
0.3158877, -1.025113, 3.326978, 0, 0.2627451, 1, 1,
0.3162478, -1.336445, 3.092365, 0, 0.254902, 1, 1,
0.3164118, -0.7944916, 4.865169, 0, 0.2509804, 1, 1,
0.3189839, -0.4024811, 2.027523, 0, 0.2431373, 1, 1,
0.3240872, 1.887236, 0.9281266, 0, 0.2392157, 1, 1,
0.3247511, 0.005290907, 2.014521, 0, 0.2313726, 1, 1,
0.3249556, 1.167858, -0.9042521, 0, 0.227451, 1, 1,
0.3262458, 0.8627034, -0.4508906, 0, 0.2196078, 1, 1,
0.3271273, -0.0105621, 1.632252, 0, 0.2156863, 1, 1,
0.3288383, 0.2413685, 1.576267, 0, 0.2078431, 1, 1,
0.3335108, 2.248412, 2.281488, 0, 0.2039216, 1, 1,
0.334961, 0.1154601, 1.127736, 0, 0.1960784, 1, 1,
0.3364141, 1.326757, 1.95691, 0, 0.1882353, 1, 1,
0.3374636, 1.0802, -1.824405, 0, 0.1843137, 1, 1,
0.3382964, 1.397581, -0.6195955, 0, 0.1764706, 1, 1,
0.3504404, 0.1515472, 2.327374, 0, 0.172549, 1, 1,
0.3528121, -1.461409, 3.022053, 0, 0.1647059, 1, 1,
0.3530779, 1.192224, 1.690162, 0, 0.1607843, 1, 1,
0.359833, 2.514867, 0.1402272, 0, 0.1529412, 1, 1,
0.3660643, -0.8501897, 3.158749, 0, 0.1490196, 1, 1,
0.3706297, -1.241472, 4.331406, 0, 0.1411765, 1, 1,
0.3751017, -0.1481327, 0.9254569, 0, 0.1372549, 1, 1,
0.3758352, 1.145468, 0.8117853, 0, 0.1294118, 1, 1,
0.386801, 0.2436063, 1.675969, 0, 0.1254902, 1, 1,
0.3893799, 1.323748, -1.43704, 0, 0.1176471, 1, 1,
0.393151, 0.8144799, -0.7584067, 0, 0.1137255, 1, 1,
0.3932306, 0.09093356, -0.1516317, 0, 0.1058824, 1, 1,
0.3940852, 0.5347908, -0.7447066, 0, 0.09803922, 1, 1,
0.3963431, 3.312096, 1.934141, 0, 0.09411765, 1, 1,
0.3975772, -0.9204445, 2.475042, 0, 0.08627451, 1, 1,
0.399045, 0.09894741, 1.970083, 0, 0.08235294, 1, 1,
0.4018058, 1.514591, 0.8547163, 0, 0.07450981, 1, 1,
0.4018463, -1.714809, 3.547763, 0, 0.07058824, 1, 1,
0.4032989, 0.6868286, 1.975917, 0, 0.0627451, 1, 1,
0.405096, -1.448173, 1.773609, 0, 0.05882353, 1, 1,
0.4063738, -0.698037, 1.875518, 0, 0.05098039, 1, 1,
0.4082281, 0.9949112, 1.310519, 0, 0.04705882, 1, 1,
0.4100604, 0.6561744, -0.1817811, 0, 0.03921569, 1, 1,
0.4127628, 1.36487, 1.460007, 0, 0.03529412, 1, 1,
0.4156242, -0.4955494, 2.619513, 0, 0.02745098, 1, 1,
0.4162985, 1.017707, -0.2838822, 0, 0.02352941, 1, 1,
0.4166642, -2.275225, 4.996723, 0, 0.01568628, 1, 1,
0.4183872, 0.1840402, 1.932337, 0, 0.01176471, 1, 1,
0.4253828, 0.1990087, 0.6318762, 0, 0.003921569, 1, 1,
0.4257779, 0.8202429, 0.1118069, 0.003921569, 0, 1, 1,
0.4312609, 1.348854, 0.9508369, 0.007843138, 0, 1, 1,
0.4321753, -0.2145579, 3.196306, 0.01568628, 0, 1, 1,
0.4346, -0.3926117, 0.3161882, 0.01960784, 0, 1, 1,
0.4354255, -0.7255683, 1.670233, 0.02745098, 0, 1, 1,
0.4358581, -1.641698, 2.145099, 0.03137255, 0, 1, 1,
0.4381273, 0.339665, 0.3011829, 0.03921569, 0, 1, 1,
0.4417607, -0.3682981, 2.97601, 0.04313726, 0, 1, 1,
0.4464523, 0.03388219, 2.847229, 0.05098039, 0, 1, 1,
0.4485995, -0.8969601, 3.792168, 0.05490196, 0, 1, 1,
0.4492746, -0.3290912, 2.111418, 0.0627451, 0, 1, 1,
0.4574273, 0.08674866, 1.156844, 0.06666667, 0, 1, 1,
0.4630559, -1.309375, 1.94141, 0.07450981, 0, 1, 1,
0.4714223, -1.802912, 3.650459, 0.07843138, 0, 1, 1,
0.473924, -1.653527, 3.25968, 0.08627451, 0, 1, 1,
0.4751697, 1.069244, -1.153503, 0.09019608, 0, 1, 1,
0.4783386, -0.5471526, 2.321079, 0.09803922, 0, 1, 1,
0.4801209, 1.286641, 1.248126, 0.1058824, 0, 1, 1,
0.4803334, 0.6942545, 1.977778, 0.1098039, 0, 1, 1,
0.4812599, -0.6190457, 2.613959, 0.1176471, 0, 1, 1,
0.4823391, 0.3535802, 2.297388, 0.1215686, 0, 1, 1,
0.4857629, -0.09015148, 2.832731, 0.1294118, 0, 1, 1,
0.4954598, 0.7357346, -1.808448, 0.1333333, 0, 1, 1,
0.5015658, -0.3678087, 2.192373, 0.1411765, 0, 1, 1,
0.5029362, 0.4399043, 2.22145, 0.145098, 0, 1, 1,
0.5159481, 0.4146411, 1.320547, 0.1529412, 0, 1, 1,
0.518227, 0.769768, 0.08973356, 0.1568628, 0, 1, 1,
0.5216226, -0.224332, 0.8208553, 0.1647059, 0, 1, 1,
0.5274673, 0.1109095, 1.685641, 0.1686275, 0, 1, 1,
0.5308126, -1.759934, 2.673725, 0.1764706, 0, 1, 1,
0.5333155, 1.970308, 0.8440349, 0.1803922, 0, 1, 1,
0.5335149, -1.155036, 2.859577, 0.1882353, 0, 1, 1,
0.534385, 0.3895127, 2.173372, 0.1921569, 0, 1, 1,
0.5395067, 0.641791, 0.8084429, 0.2, 0, 1, 1,
0.5417473, -1.672384, 2.5038, 0.2078431, 0, 1, 1,
0.543049, 0.08983173, 1.189797, 0.2117647, 0, 1, 1,
0.5525074, -1.85991, 1.430701, 0.2196078, 0, 1, 1,
0.5525592, 1.853153, 0.1411576, 0.2235294, 0, 1, 1,
0.5534714, -0.2526334, 1.258634, 0.2313726, 0, 1, 1,
0.5571142, 0.3270093, -0.0116285, 0.2352941, 0, 1, 1,
0.5581311, -1.126191, 1.55348, 0.2431373, 0, 1, 1,
0.559868, -0.1626683, 1.843203, 0.2470588, 0, 1, 1,
0.5683139, 1.686205, -1.749172, 0.254902, 0, 1, 1,
0.5806091, -0.3463039, 1.839943, 0.2588235, 0, 1, 1,
0.5838678, -0.8352096, 1.401731, 0.2666667, 0, 1, 1,
0.5912336, 0.9750482, 0.6967651, 0.2705882, 0, 1, 1,
0.5926129, -0.5381677, 0.8739586, 0.2784314, 0, 1, 1,
0.5942523, 2.785942, 0.2522208, 0.282353, 0, 1, 1,
0.595295, -0.1862244, 0.623458, 0.2901961, 0, 1, 1,
0.5960248, 0.4033476, -0.1563197, 0.2941177, 0, 1, 1,
0.6043775, 2.5186, -0.0166245, 0.3019608, 0, 1, 1,
0.6059008, 0.07943375, -0.7773377, 0.3098039, 0, 1, 1,
0.6064075, -1.762389, 4.069317, 0.3137255, 0, 1, 1,
0.6104985, 0.9050248, 2.526926, 0.3215686, 0, 1, 1,
0.6218585, 0.2905919, 1.13574, 0.3254902, 0, 1, 1,
0.6219482, -0.2607713, 0.880827, 0.3333333, 0, 1, 1,
0.6267622, 0.3013648, 0.9266042, 0.3372549, 0, 1, 1,
0.6277491, 2.087511, -0.6467846, 0.345098, 0, 1, 1,
0.63224, 0.5166723, 0.1510626, 0.3490196, 0, 1, 1,
0.6352599, -0.721526, 0.9089065, 0.3568628, 0, 1, 1,
0.6405412, 0.7443382, -1.758024, 0.3607843, 0, 1, 1,
0.6421242, 0.04093524, 0.3303436, 0.3686275, 0, 1, 1,
0.6468379, -0.2040104, 1.252328, 0.372549, 0, 1, 1,
0.6512278, -1.247935, 3.119719, 0.3803922, 0, 1, 1,
0.6514022, 1.631539, 1.498886, 0.3843137, 0, 1, 1,
0.65854, 0.4296627, 1.019355, 0.3921569, 0, 1, 1,
0.6596084, -0.5709848, 1.469327, 0.3960784, 0, 1, 1,
0.6653949, -0.9475687, 2.032754, 0.4039216, 0, 1, 1,
0.6660483, 0.5175127, 1.198722, 0.4117647, 0, 1, 1,
0.6698022, -1.598568, 5.63669, 0.4156863, 0, 1, 1,
0.6751655, 0.5098218, 0.08514253, 0.4235294, 0, 1, 1,
0.6802881, -0.1777441, 2.2243, 0.427451, 0, 1, 1,
0.6866288, 0.3185689, -0.2358363, 0.4352941, 0, 1, 1,
0.6868899, 1.790267, -0.9418328, 0.4392157, 0, 1, 1,
0.6875303, -1.71585, 3.102688, 0.4470588, 0, 1, 1,
0.6988236, -0.4497042, 1.407142, 0.4509804, 0, 1, 1,
0.6993375, -1.205178, 2.390563, 0.4588235, 0, 1, 1,
0.7029278, 0.9060887, 0.4686207, 0.4627451, 0, 1, 1,
0.7039489, 1.95996, -0.1481591, 0.4705882, 0, 1, 1,
0.7049158, 0.4398263, 0.222278, 0.4745098, 0, 1, 1,
0.7119381, 1.988153, -0.02392424, 0.4823529, 0, 1, 1,
0.7142175, -0.1003245, -0.710878, 0.4862745, 0, 1, 1,
0.7152863, -1.636561, 2.3923, 0.4941176, 0, 1, 1,
0.7175269, -0.2971655, 1.962027, 0.5019608, 0, 1, 1,
0.7185734, 0.7930923, -0.598368, 0.5058824, 0, 1, 1,
0.724232, 1.405835, -1.190703, 0.5137255, 0, 1, 1,
0.7244708, 1.666399, 1.726536, 0.5176471, 0, 1, 1,
0.7322947, 1.442707, -1.984902, 0.5254902, 0, 1, 1,
0.7408822, -1.676111, 3.164943, 0.5294118, 0, 1, 1,
0.7461691, -0.05282488, 0.2250851, 0.5372549, 0, 1, 1,
0.7463727, 0.6946872, 2.689248, 0.5411765, 0, 1, 1,
0.7497926, 0.3219991, 0.3308696, 0.5490196, 0, 1, 1,
0.7623709, -0.1348271, 1.026016, 0.5529412, 0, 1, 1,
0.7664737, 0.4417877, 1.789173, 0.5607843, 0, 1, 1,
0.7670541, -0.7641354, 1.769578, 0.5647059, 0, 1, 1,
0.767376, -0.5463123, 2.871423, 0.572549, 0, 1, 1,
0.7703065, -0.4440384, 1.997114, 0.5764706, 0, 1, 1,
0.7721328, -0.8164352, 1.950208, 0.5843138, 0, 1, 1,
0.77283, 0.2575315, -0.8797933, 0.5882353, 0, 1, 1,
0.7749211, 0.1328129, 2.261024, 0.5960785, 0, 1, 1,
0.7811261, -0.3985895, 2.010253, 0.6039216, 0, 1, 1,
0.7827999, -0.04346476, 1.689801, 0.6078432, 0, 1, 1,
0.7839048, -0.7393001, 0.7315026, 0.6156863, 0, 1, 1,
0.7884043, -0.01004274, 0.4936768, 0.6196079, 0, 1, 1,
0.7889195, 0.01230537, 2.517015, 0.627451, 0, 1, 1,
0.7968276, 1.185545, 0.467445, 0.6313726, 0, 1, 1,
0.7997737, -1.252505, 2.962458, 0.6392157, 0, 1, 1,
0.8099305, -0.05307356, 1.849913, 0.6431373, 0, 1, 1,
0.8106313, -0.3783821, 0.4656572, 0.6509804, 0, 1, 1,
0.8114793, 0.1363256, 0.6163439, 0.654902, 0, 1, 1,
0.8117654, -0.7900811, 1.067541, 0.6627451, 0, 1, 1,
0.8131154, 0.3279387, 1.247414, 0.6666667, 0, 1, 1,
0.8235772, -0.6950377, 1.24898, 0.6745098, 0, 1, 1,
0.8245983, 0.5149546, 0.5237794, 0.6784314, 0, 1, 1,
0.8252124, 0.9623643, 3.040268, 0.6862745, 0, 1, 1,
0.8301226, 0.7218964, 2.142612, 0.6901961, 0, 1, 1,
0.8313711, -0.01683592, 2.034109, 0.6980392, 0, 1, 1,
0.8335479, 1.906428, 0.9383087, 0.7058824, 0, 1, 1,
0.8349873, -0.8080136, 2.589555, 0.7098039, 0, 1, 1,
0.8411468, -0.6755974, 4.484247, 0.7176471, 0, 1, 1,
0.8424022, 0.3010911, 1.505607, 0.7215686, 0, 1, 1,
0.8459593, -0.1896799, 1.987595, 0.7294118, 0, 1, 1,
0.848, -0.695655, 3.587739, 0.7333333, 0, 1, 1,
0.8566912, 0.6631491, 1.529196, 0.7411765, 0, 1, 1,
0.8597504, 1.116123, 3.018982, 0.7450981, 0, 1, 1,
0.8643817, -0.514485, 1.809717, 0.7529412, 0, 1, 1,
0.8652415, -0.1700296, 1.705466, 0.7568628, 0, 1, 1,
0.8654252, -0.7505971, 2.165975, 0.7647059, 0, 1, 1,
0.8715104, -0.08717734, 0.6593339, 0.7686275, 0, 1, 1,
0.8734862, 0.2620648, 3.218371, 0.7764706, 0, 1, 1,
0.8748333, 0.3851799, 0.8333198, 0.7803922, 0, 1, 1,
0.8770671, -0.2948138, 2.170085, 0.7882353, 0, 1, 1,
0.8774598, -2.093347, 3.760951, 0.7921569, 0, 1, 1,
0.8776965, -0.7152486, 1.774208, 0.8, 0, 1, 1,
0.8781505, -1.025343, 3.03578, 0.8078431, 0, 1, 1,
0.8784637, 1.401127, 2.371883, 0.8117647, 0, 1, 1,
0.8800194, -1.344485, 2.229303, 0.8196079, 0, 1, 1,
0.8833297, -0.2350194, 0.01055089, 0.8235294, 0, 1, 1,
0.885989, 0.8893949, 1.229051, 0.8313726, 0, 1, 1,
0.8909007, -1.123073, 3.739589, 0.8352941, 0, 1, 1,
0.8934259, -0.8468608, 5.006265, 0.8431373, 0, 1, 1,
0.8936463, 0.7289904, -0.3878982, 0.8470588, 0, 1, 1,
0.8982763, 0.838935, 1.377096, 0.854902, 0, 1, 1,
0.8988839, -1.729907, 2.105676, 0.8588235, 0, 1, 1,
0.8994299, 0.4482425, 2.335238, 0.8666667, 0, 1, 1,
0.9035206, 0.2602269, 2.113133, 0.8705882, 0, 1, 1,
0.9044989, -1.094111, 1.354011, 0.8784314, 0, 1, 1,
0.9058014, -2.043157, 4.483588, 0.8823529, 0, 1, 1,
0.9083626, 0.8023109, -1.002022, 0.8901961, 0, 1, 1,
0.9084768, -0.2299571, 1.911225, 0.8941177, 0, 1, 1,
0.909219, 0.3400084, 1.557938, 0.9019608, 0, 1, 1,
0.9206531, -0.2116611, 1.228546, 0.9098039, 0, 1, 1,
0.9227236, 0.09447404, 2.232211, 0.9137255, 0, 1, 1,
0.9357467, -0.1170297, 1.944697, 0.9215686, 0, 1, 1,
0.9445562, -0.5012446, 2.038526, 0.9254902, 0, 1, 1,
0.9475087, 0.4413361, 1.052705, 0.9333333, 0, 1, 1,
0.9503374, -1.865191, 3.347393, 0.9372549, 0, 1, 1,
0.9506658, -1.39728, 2.024333, 0.945098, 0, 1, 1,
0.9544397, 0.2532646, 2.603866, 0.9490196, 0, 1, 1,
0.9546281, -0.5836809, 2.741817, 0.9568627, 0, 1, 1,
0.9559405, -1.530356, 3.792592, 0.9607843, 0, 1, 1,
0.960649, 0.9130688, 2.074825, 0.9686275, 0, 1, 1,
0.964309, 0.4580799, -0.01886199, 0.972549, 0, 1, 1,
0.9689156, -0.6011397, 2.698757, 0.9803922, 0, 1, 1,
0.9707974, -0.1695409, 3.096177, 0.9843137, 0, 1, 1,
0.971045, -0.2948076, 1.655192, 0.9921569, 0, 1, 1,
0.974219, 1.429936, 1.090737, 0.9960784, 0, 1, 1,
0.9761426, 1.115222, -0.1215096, 1, 0, 0.9960784, 1,
0.9801626, 0.7935696, 0.4987774, 1, 0, 0.9882353, 1,
0.9806818, -1.434228, 2.78413, 1, 0, 0.9843137, 1,
0.9841761, 0.01142954, 1.646311, 1, 0, 0.9764706, 1,
0.990957, 0.03591936, 1.512398, 1, 0, 0.972549, 1,
0.9942582, 0.7408406, -0.1582807, 1, 0, 0.9647059, 1,
0.9956766, 0.01684142, 1.575608, 1, 0, 0.9607843, 1,
0.9992878, 1.327861, 0.1852688, 1, 0, 0.9529412, 1,
1.001323, 0.593604, 0.5993403, 1, 0, 0.9490196, 1,
1.003533, 0.4213692, 1.315786, 1, 0, 0.9411765, 1,
1.007058, -0.4202568, 1.608341, 1, 0, 0.9372549, 1,
1.012365, -1.341481, 3.180685, 1, 0, 0.9294118, 1,
1.015588, -1.506447, 1.117614, 1, 0, 0.9254902, 1,
1.022454, -0.7152519, 3.644751, 1, 0, 0.9176471, 1,
1.02967, -0.5229509, 0.9999667, 1, 0, 0.9137255, 1,
1.050864, -0.05085598, 0.6209109, 1, 0, 0.9058824, 1,
1.05406, -1.457655, 2.852139, 1, 0, 0.9019608, 1,
1.058576, 0.8061351, 0.4937468, 1, 0, 0.8941177, 1,
1.058913, -0.2464691, 0.483686, 1, 0, 0.8862745, 1,
1.059201, -1.16897, 2.273484, 1, 0, 0.8823529, 1,
1.069771, 1.364273, 3.046093, 1, 0, 0.8745098, 1,
1.07016, -0.1843368, 4.145426, 1, 0, 0.8705882, 1,
1.071101, 2.283552, 0.4534476, 1, 0, 0.8627451, 1,
1.077103, 0.2329836, 1.529316, 1, 0, 0.8588235, 1,
1.079452, 0.1785907, 2.375478, 1, 0, 0.8509804, 1,
1.0816, -1.719247, 2.587746, 1, 0, 0.8470588, 1,
1.081812, -0.09662687, 1.336179, 1, 0, 0.8392157, 1,
1.094286, 0.2729917, 0.8768284, 1, 0, 0.8352941, 1,
1.104269, 1.509945, -0.1751928, 1, 0, 0.827451, 1,
1.104305, 0.3927724, 0.8712237, 1, 0, 0.8235294, 1,
1.108335, 1.173681, 0.03230164, 1, 0, 0.8156863, 1,
1.11135, -0.8975143, 2.380244, 1, 0, 0.8117647, 1,
1.111969, 2.533767, -0.3261665, 1, 0, 0.8039216, 1,
1.123453, -0.1801015, 2.00598, 1, 0, 0.7960784, 1,
1.127779, -0.6486878, 2.282498, 1, 0, 0.7921569, 1,
1.128842, -0.321457, 1.741952, 1, 0, 0.7843137, 1,
1.135296, -0.3708809, 1.458444, 1, 0, 0.7803922, 1,
1.149495, 1.371267, 0.5999556, 1, 0, 0.772549, 1,
1.16271, 1.556625, -0.3218569, 1, 0, 0.7686275, 1,
1.163824, 0.5955517, 2.152596, 1, 0, 0.7607843, 1,
1.170025, -1.018701, 2.289708, 1, 0, 0.7568628, 1,
1.172239, -0.1989164, 1.186761, 1, 0, 0.7490196, 1,
1.181436, -0.7532417, -0.2352691, 1, 0, 0.7450981, 1,
1.184821, -0.007597601, 0.8708557, 1, 0, 0.7372549, 1,
1.18529, 1.689532, -0.4385267, 1, 0, 0.7333333, 1,
1.198856, 0.4707367, 2.206149, 1, 0, 0.7254902, 1,
1.200493, -0.1927901, 0.6486398, 1, 0, 0.7215686, 1,
1.204211, 1.50945, 2.310117, 1, 0, 0.7137255, 1,
1.221215, -0.7474599, 2.686431, 1, 0, 0.7098039, 1,
1.222394, 2.232628, 2.046914, 1, 0, 0.7019608, 1,
1.225471, 0.07060838, 1.984256, 1, 0, 0.6941177, 1,
1.226841, 1.042034, 1.923176, 1, 0, 0.6901961, 1,
1.226954, -0.8370474, 1.223877, 1, 0, 0.682353, 1,
1.233361, -0.008028969, 1.152936, 1, 0, 0.6784314, 1,
1.236053, -0.327002, 2.005307, 1, 0, 0.6705883, 1,
1.239963, -0.5629148, 3.225159, 1, 0, 0.6666667, 1,
1.244, 1.616181, 1.063894, 1, 0, 0.6588235, 1,
1.258945, 0.4563184, 0.0208217, 1, 0, 0.654902, 1,
1.260266, 2.019848, 1.886785, 1, 0, 0.6470588, 1,
1.263767, -0.07788815, 2.417193, 1, 0, 0.6431373, 1,
1.264352, 0.5470855, 1.770189, 1, 0, 0.6352941, 1,
1.267016, -1.355743, 1.866908, 1, 0, 0.6313726, 1,
1.271134, -0.04516312, 1.484468, 1, 0, 0.6235294, 1,
1.275688, -0.04956531, 2.286608, 1, 0, 0.6196079, 1,
1.276106, -1.327057, 0.6337147, 1, 0, 0.6117647, 1,
1.280899, 1.056634, -0.1608428, 1, 0, 0.6078432, 1,
1.301514, 0.460486, 0.8325418, 1, 0, 0.6, 1,
1.315204, -1.126865, 3.754647, 1, 0, 0.5921569, 1,
1.318099, 1.234001, 0.6216867, 1, 0, 0.5882353, 1,
1.319066, 1.469864, 0.2876967, 1, 0, 0.5803922, 1,
1.319565, 0.1459062, 1.476401, 1, 0, 0.5764706, 1,
1.343898, 0.06472553, 3.331151, 1, 0, 0.5686275, 1,
1.352977, -0.5261674, 1.437474, 1, 0, 0.5647059, 1,
1.358448, -1.746796, 4.144241, 1, 0, 0.5568628, 1,
1.364296, -1.776674, 3.097532, 1, 0, 0.5529412, 1,
1.365132, -0.4515333, 2.707097, 1, 0, 0.5450981, 1,
1.378785, 1.560905, 0.4182006, 1, 0, 0.5411765, 1,
1.388312, -0.05717479, 2.705378, 1, 0, 0.5333334, 1,
1.389228, 0.7913944, 0.4937823, 1, 0, 0.5294118, 1,
1.395146, 1.10024, 1.173059, 1, 0, 0.5215687, 1,
1.39627, -0.4914837, 1.797005, 1, 0, 0.5176471, 1,
1.401468, -0.1578757, 0.9214313, 1, 0, 0.509804, 1,
1.408071, 0.2527014, 1.644318, 1, 0, 0.5058824, 1,
1.409426, -1.277907, 2.671195, 1, 0, 0.4980392, 1,
1.419836, 1.42901, 0.3202451, 1, 0, 0.4901961, 1,
1.423398, 0.4468256, 1.195414, 1, 0, 0.4862745, 1,
1.431333, -1.308461, 3.355205, 1, 0, 0.4784314, 1,
1.434548, 0.0926369, 1.636023, 1, 0, 0.4745098, 1,
1.441643, 1.370657, 1.727025, 1, 0, 0.4666667, 1,
1.445664, 0.006814231, 0.752291, 1, 0, 0.4627451, 1,
1.451036, -1.217278, 2.490647, 1, 0, 0.454902, 1,
1.451733, 0.1348998, 0.2425902, 1, 0, 0.4509804, 1,
1.458711, 0.4117587, 4.057981, 1, 0, 0.4431373, 1,
1.459077, 0.3277197, 2.307398, 1, 0, 0.4392157, 1,
1.469423, -0.01090004, -0.8535496, 1, 0, 0.4313726, 1,
1.476503, 0.3962703, 1.638011, 1, 0, 0.427451, 1,
1.491676, 0.5342358, 1.471715, 1, 0, 0.4196078, 1,
1.503045, -0.6961673, 1.483649, 1, 0, 0.4156863, 1,
1.505116, 0.241542, 1.574799, 1, 0, 0.4078431, 1,
1.51114, 0.5739735, 1.761462, 1, 0, 0.4039216, 1,
1.535712, -0.5944465, 2.274108, 1, 0, 0.3960784, 1,
1.543296, -1.328942, 2.389346, 1, 0, 0.3882353, 1,
1.544323, -0.268647, 1.83525, 1, 0, 0.3843137, 1,
1.561249, 0.5898548, 2.279366, 1, 0, 0.3764706, 1,
1.563445, -0.607864, 1.886476, 1, 0, 0.372549, 1,
1.569424, -0.5249045, 3.071729, 1, 0, 0.3647059, 1,
1.580005, 0.09299575, 2.758873, 1, 0, 0.3607843, 1,
1.611721, 0.06290413, 1.513544, 1, 0, 0.3529412, 1,
1.620788, -0.6190742, 0.9879973, 1, 0, 0.3490196, 1,
1.629574, -0.4787432, 1.580086, 1, 0, 0.3411765, 1,
1.639071, 0.06765375, 0.9912383, 1, 0, 0.3372549, 1,
1.687065, 0.3303641, 0.5272137, 1, 0, 0.3294118, 1,
1.734277, 0.08367749, 2.087989, 1, 0, 0.3254902, 1,
1.743884, -1.091681, 1.617041, 1, 0, 0.3176471, 1,
1.744417, 0.06725594, 1.790637, 1, 0, 0.3137255, 1,
1.747802, 1.052744, 0.7236459, 1, 0, 0.3058824, 1,
1.751234, 0.4100686, 2.200535, 1, 0, 0.2980392, 1,
1.753449, 1.15704, 0.3791671, 1, 0, 0.2941177, 1,
1.758691, -0.009141, 0.5216449, 1, 0, 0.2862745, 1,
1.771711, -0.4893632, 1.021297, 1, 0, 0.282353, 1,
1.77868, -0.5717555, 2.794544, 1, 0, 0.2745098, 1,
1.778686, 0.6460235, 1.056358, 1, 0, 0.2705882, 1,
1.783053, -0.5821125, 2.809882, 1, 0, 0.2627451, 1,
1.788337, -1.510231, 3.135145, 1, 0, 0.2588235, 1,
1.789516, 1.448037, 1.656613, 1, 0, 0.2509804, 1,
1.802853, 0.6579936, 1.052387, 1, 0, 0.2470588, 1,
1.835476, -0.9668785, 2.579118, 1, 0, 0.2392157, 1,
1.847389, 0.07322649, 2.736311, 1, 0, 0.2352941, 1,
1.869354, 1.301511, 1.687777, 1, 0, 0.227451, 1,
1.882794, 1.010458, 1.591218, 1, 0, 0.2235294, 1,
1.892163, -0.2011916, 2.152, 1, 0, 0.2156863, 1,
1.953593, -0.2315002, -0.06222769, 1, 0, 0.2117647, 1,
1.968685, 0.8282744, 2.350312, 1, 0, 0.2039216, 1,
1.973516, 0.237626, 1.962573, 1, 0, 0.1960784, 1,
2.003645, -1.238807, 1.943581, 1, 0, 0.1921569, 1,
2.008533, 1.728307, 0.8407779, 1, 0, 0.1843137, 1,
2.023517, 0.09497139, 0.69344, 1, 0, 0.1803922, 1,
2.046531, 1.088707, 1.480443, 1, 0, 0.172549, 1,
2.054627, 1.182935, 1.670769, 1, 0, 0.1686275, 1,
2.060886, -0.1687665, 2.640439, 1, 0, 0.1607843, 1,
2.069402, 0.5101703, 3.279277, 1, 0, 0.1568628, 1,
2.116357, -1.463603, 2.620518, 1, 0, 0.1490196, 1,
2.124421, 0.7527395, -0.006468377, 1, 0, 0.145098, 1,
2.129463, 0.8152121, 1.251117, 1, 0, 0.1372549, 1,
2.169172, -1.396614, 3.159118, 1, 0, 0.1333333, 1,
2.18976, 0.8138182, 2.240321, 1, 0, 0.1254902, 1,
2.21737, -0.04619867, 2.006388, 1, 0, 0.1215686, 1,
2.221934, -0.7869536, 1.172404, 1, 0, 0.1137255, 1,
2.229483, 2.198343, 0.1679408, 1, 0, 0.1098039, 1,
2.231719, 0.4359283, 1.463309, 1, 0, 0.1019608, 1,
2.23546, -0.9151984, 3.1438, 1, 0, 0.09411765, 1,
2.237965, 1.551471, 1.306467, 1, 0, 0.09019608, 1,
2.248908, -0.9674248, -0.2613088, 1, 0, 0.08235294, 1,
2.258191, -2.207617, 2.322932, 1, 0, 0.07843138, 1,
2.359812, -0.2827146, 1.927294, 1, 0, 0.07058824, 1,
2.385839, 0.2246671, -0.121823, 1, 0, 0.06666667, 1,
2.426011, -0.1451037, 2.225563, 1, 0, 0.05882353, 1,
2.434846, 1.538941, 0.8075656, 1, 0, 0.05490196, 1,
2.442047, 0.4518008, 1.650106, 1, 0, 0.04705882, 1,
2.444595, -0.6038654, 1.550073, 1, 0, 0.04313726, 1,
2.46778, -1.348858, 1.818184, 1, 0, 0.03529412, 1,
2.545466, -1.220376, 1.87921, 1, 0, 0.03137255, 1,
2.648422, -0.598617, 3.479891, 1, 0, 0.02352941, 1,
2.724562, -0.1831723, 2.368397, 1, 0, 0.01960784, 1,
2.91602, 0.9963831, 2.787675, 1, 0, 0.01176471, 1,
3.276122, -0.09652602, 2.959563, 1, 0, 0.007843138, 1
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
-0.0252825, -4.833645, -7.287508, 0, -0.5, 0.5, 0.5,
-0.0252825, -4.833645, -7.287508, 1, -0.5, 0.5, 0.5,
-0.0252825, -4.833645, -7.287508, 1, 1.5, 0.5, 0.5,
-0.0252825, -4.833645, -7.287508, 0, 1.5, 0.5, 0.5
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
-4.445864, -0.1023047, -7.287508, 0, -0.5, 0.5, 0.5,
-4.445864, -0.1023047, -7.287508, 1, -0.5, 0.5, 0.5,
-4.445864, -0.1023047, -7.287508, 1, 1.5, 0.5, 0.5,
-4.445864, -0.1023047, -7.287508, 0, 1.5, 0.5, 0.5
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
-4.445864, -4.833645, 0.1111667, 0, -0.5, 0.5, 0.5,
-4.445864, -4.833645, 0.1111667, 1, -0.5, 0.5, 0.5,
-4.445864, -4.833645, 0.1111667, 1, 1.5, 0.5, 0.5,
-4.445864, -4.833645, 0.1111667, 0, 1.5, 0.5, 0.5
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
-3, -3.741797, -5.580122,
3, -3.741797, -5.580122,
-3, -3.741797, -5.580122,
-3, -3.923772, -5.864686,
-2, -3.741797, -5.580122,
-2, -3.923772, -5.864686,
-1, -3.741797, -5.580122,
-1, -3.923772, -5.864686,
0, -3.741797, -5.580122,
0, -3.923772, -5.864686,
1, -3.741797, -5.580122,
1, -3.923772, -5.864686,
2, -3.741797, -5.580122,
2, -3.923772, -5.864686,
3, -3.741797, -5.580122,
3, -3.923772, -5.864686
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
-3, -4.287721, -6.433815, 0, -0.5, 0.5, 0.5,
-3, -4.287721, -6.433815, 1, -0.5, 0.5, 0.5,
-3, -4.287721, -6.433815, 1, 1.5, 0.5, 0.5,
-3, -4.287721, -6.433815, 0, 1.5, 0.5, 0.5,
-2, -4.287721, -6.433815, 0, -0.5, 0.5, 0.5,
-2, -4.287721, -6.433815, 1, -0.5, 0.5, 0.5,
-2, -4.287721, -6.433815, 1, 1.5, 0.5, 0.5,
-2, -4.287721, -6.433815, 0, 1.5, 0.5, 0.5,
-1, -4.287721, -6.433815, 0, -0.5, 0.5, 0.5,
-1, -4.287721, -6.433815, 1, -0.5, 0.5, 0.5,
-1, -4.287721, -6.433815, 1, 1.5, 0.5, 0.5,
-1, -4.287721, -6.433815, 0, 1.5, 0.5, 0.5,
0, -4.287721, -6.433815, 0, -0.5, 0.5, 0.5,
0, -4.287721, -6.433815, 1, -0.5, 0.5, 0.5,
0, -4.287721, -6.433815, 1, 1.5, 0.5, 0.5,
0, -4.287721, -6.433815, 0, 1.5, 0.5, 0.5,
1, -4.287721, -6.433815, 0, -0.5, 0.5, 0.5,
1, -4.287721, -6.433815, 1, -0.5, 0.5, 0.5,
1, -4.287721, -6.433815, 1, 1.5, 0.5, 0.5,
1, -4.287721, -6.433815, 0, 1.5, 0.5, 0.5,
2, -4.287721, -6.433815, 0, -0.5, 0.5, 0.5,
2, -4.287721, -6.433815, 1, -0.5, 0.5, 0.5,
2, -4.287721, -6.433815, 1, 1.5, 0.5, 0.5,
2, -4.287721, -6.433815, 0, 1.5, 0.5, 0.5,
3, -4.287721, -6.433815, 0, -0.5, 0.5, 0.5,
3, -4.287721, -6.433815, 1, -0.5, 0.5, 0.5,
3, -4.287721, -6.433815, 1, 1.5, 0.5, 0.5,
3, -4.287721, -6.433815, 0, 1.5, 0.5, 0.5
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
-3.42573, -2, -5.580122,
-3.42573, 2, -5.580122,
-3.42573, -2, -5.580122,
-3.595752, -2, -5.864686,
-3.42573, 0, -5.580122,
-3.595752, 0, -5.864686,
-3.42573, 2, -5.580122,
-3.595752, 2, -5.864686
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
"0",
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
-3.935796, -2, -6.433815, 0, -0.5, 0.5, 0.5,
-3.935796, -2, -6.433815, 1, -0.5, 0.5, 0.5,
-3.935796, -2, -6.433815, 1, 1.5, 0.5, 0.5,
-3.935796, -2, -6.433815, 0, 1.5, 0.5, 0.5,
-3.935796, 0, -6.433815, 0, -0.5, 0.5, 0.5,
-3.935796, 0, -6.433815, 1, -0.5, 0.5, 0.5,
-3.935796, 0, -6.433815, 1, 1.5, 0.5, 0.5,
-3.935796, 0, -6.433815, 0, 1.5, 0.5, 0.5,
-3.935796, 2, -6.433815, 0, -0.5, 0.5, 0.5,
-3.935796, 2, -6.433815, 1, -0.5, 0.5, 0.5,
-3.935796, 2, -6.433815, 1, 1.5, 0.5, 0.5,
-3.935796, 2, -6.433815, 0, 1.5, 0.5, 0.5
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
-3.42573, -3.741797, -4,
-3.42573, -3.741797, 4,
-3.42573, -3.741797, -4,
-3.595752, -3.923772, -4,
-3.42573, -3.741797, -2,
-3.595752, -3.923772, -2,
-3.42573, -3.741797, 0,
-3.595752, -3.923772, 0,
-3.42573, -3.741797, 2,
-3.595752, -3.923772, 2,
-3.42573, -3.741797, 4,
-3.595752, -3.923772, 4
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
-3.935796, -4.287721, -4, 0, -0.5, 0.5, 0.5,
-3.935796, -4.287721, -4, 1, -0.5, 0.5, 0.5,
-3.935796, -4.287721, -4, 1, 1.5, 0.5, 0.5,
-3.935796, -4.287721, -4, 0, 1.5, 0.5, 0.5,
-3.935796, -4.287721, -2, 0, -0.5, 0.5, 0.5,
-3.935796, -4.287721, -2, 1, -0.5, 0.5, 0.5,
-3.935796, -4.287721, -2, 1, 1.5, 0.5, 0.5,
-3.935796, -4.287721, -2, 0, 1.5, 0.5, 0.5,
-3.935796, -4.287721, 0, 0, -0.5, 0.5, 0.5,
-3.935796, -4.287721, 0, 1, -0.5, 0.5, 0.5,
-3.935796, -4.287721, 0, 1, 1.5, 0.5, 0.5,
-3.935796, -4.287721, 0, 0, 1.5, 0.5, 0.5,
-3.935796, -4.287721, 2, 0, -0.5, 0.5, 0.5,
-3.935796, -4.287721, 2, 1, -0.5, 0.5, 0.5,
-3.935796, -4.287721, 2, 1, 1.5, 0.5, 0.5,
-3.935796, -4.287721, 2, 0, 1.5, 0.5, 0.5,
-3.935796, -4.287721, 4, 0, -0.5, 0.5, 0.5,
-3.935796, -4.287721, 4, 1, -0.5, 0.5, 0.5,
-3.935796, -4.287721, 4, 1, 1.5, 0.5, 0.5,
-3.935796, -4.287721, 4, 0, 1.5, 0.5, 0.5
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
-3.42573, -3.741797, -5.580122,
-3.42573, 3.537188, -5.580122,
-3.42573, -3.741797, 5.802455,
-3.42573, 3.537188, 5.802455,
-3.42573, -3.741797, -5.580122,
-3.42573, -3.741797, 5.802455,
-3.42573, 3.537188, -5.580122,
-3.42573, 3.537188, 5.802455,
-3.42573, -3.741797, -5.580122,
3.375165, -3.741797, -5.580122,
-3.42573, -3.741797, 5.802455,
3.375165, -3.741797, 5.802455,
-3.42573, 3.537188, -5.580122,
3.375165, 3.537188, -5.580122,
-3.42573, 3.537188, 5.802455,
3.375165, 3.537188, 5.802455,
3.375165, -3.741797, -5.580122,
3.375165, 3.537188, -5.580122,
3.375165, -3.741797, 5.802455,
3.375165, 3.537188, 5.802455,
3.375165, -3.741797, -5.580122,
3.375165, -3.741797, 5.802455,
3.375165, 3.537188, -5.580122,
3.375165, 3.537188, 5.802455
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
var radius = 8.077043;
var distance = 35.93568;
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
mvMatrix.translate( 0.0252825, 0.1023047, -0.1111667 );
mvMatrix.scale( 1.284104, 1.199763, 0.7672302 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.93568);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
dichlorobenzophenone<-read.table("dichlorobenzophenone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dichlorobenzophenone$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichlorobenzophenone' not found
```

```r
y<-dichlorobenzophenone$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichlorobenzophenone' not found
```

```r
z<-dichlorobenzophenone$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichlorobenzophenone' not found
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
-3.326687, 1.95268, 0.2702818, 0, 0, 1, 1, 1,
-2.875561, -0.760226, -2.20467, 1, 0, 0, 1, 1,
-2.832278, -0.09888498, -2.781898, 1, 0, 0, 1, 1,
-2.671259, -0.02396435, -2.629893, 1, 0, 0, 1, 1,
-2.6249, -1.114363, -1.053662, 1, 0, 0, 1, 1,
-2.586531, 0.3997672, -0.9360906, 1, 0, 0, 1, 1,
-2.493733, -0.270648, -0.0551848, 0, 0, 0, 1, 1,
-2.42957, 1.134863, -0.5671853, 0, 0, 0, 1, 1,
-2.372959, -0.5092565, 0.03439243, 0, 0, 0, 1, 1,
-2.345619, 0.4528936, -1.099907, 0, 0, 0, 1, 1,
-2.328224, -0.2873771, -0.0539226, 0, 0, 0, 1, 1,
-2.297719, -0.3537602, -1.561637, 0, 0, 0, 1, 1,
-2.272321, 1.4048, -2.477438, 0, 0, 0, 1, 1,
-2.26161, 0.1114781, -1.628037, 1, 1, 1, 1, 1,
-2.234407, -0.03709897, -0.7592273, 1, 1, 1, 1, 1,
-2.167388, -0.7853447, -1.429652, 1, 1, 1, 1, 1,
-2.151068, 0.821393, -0.7165025, 1, 1, 1, 1, 1,
-2.136111, -2.262318, -3.683608, 1, 1, 1, 1, 1,
-2.113588, -0.4778091, -0.8027144, 1, 1, 1, 1, 1,
-2.102491, 1.025341, -1.178969, 1, 1, 1, 1, 1,
-2.094511, -0.3551899, -2.964624, 1, 1, 1, 1, 1,
-2.079314, -1.482253, -2.376996, 1, 1, 1, 1, 1,
-2.033923, 0.2646056, -1.762837, 1, 1, 1, 1, 1,
-2.027974, 1.559029, 0.4813311, 1, 1, 1, 1, 1,
-2.01306, -2.379114, -2.921936, 1, 1, 1, 1, 1,
-2.007275, -0.007621536, 0.1164347, 1, 1, 1, 1, 1,
-2.001222, 0.05900136, -0.4788189, 1, 1, 1, 1, 1,
-1.99596, 0.6050834, -0.8703061, 1, 1, 1, 1, 1,
-1.978494, -0.4368795, -0.2175047, 0, 0, 1, 1, 1,
-1.973049, -1.92459, -0.6798093, 1, 0, 0, 1, 1,
-1.950214, 1.721333, -0.6414678, 1, 0, 0, 1, 1,
-1.897185, -0.9713182, -0.8341153, 1, 0, 0, 1, 1,
-1.894488, 0.2359695, -1.004397, 1, 0, 0, 1, 1,
-1.878906, -0.90024, -0.4112237, 1, 0, 0, 1, 1,
-1.855417, -0.817651, -2.584402, 0, 0, 0, 1, 1,
-1.839034, 0.3443578, -2.162763, 0, 0, 0, 1, 1,
-1.836722, -1.881209, -3.33798, 0, 0, 0, 1, 1,
-1.820027, 0.03342512, -2.901847, 0, 0, 0, 1, 1,
-1.810874, -0.09205944, -1.27581, 0, 0, 0, 1, 1,
-1.801542, 0.09730543, -2.210209, 0, 0, 0, 1, 1,
-1.77384, 0.1718255, -1.734463, 0, 0, 0, 1, 1,
-1.771993, -0.9496007, -3.494144, 1, 1, 1, 1, 1,
-1.768557, -0.8543736, -1.438008, 1, 1, 1, 1, 1,
-1.765265, 1.99296, -0.6723731, 1, 1, 1, 1, 1,
-1.758986, 0.1098611, -1.145066, 1, 1, 1, 1, 1,
-1.745143, -0.003509414, -2.631128, 1, 1, 1, 1, 1,
-1.743968, 0.5291895, -0.530486, 1, 1, 1, 1, 1,
-1.741716, 1.235486, -1.716912, 1, 1, 1, 1, 1,
-1.73877, -0.06202451, -0.1227428, 1, 1, 1, 1, 1,
-1.73862, -0.682256, -2.917776, 1, 1, 1, 1, 1,
-1.736379, 2.075361, -1.1412, 1, 1, 1, 1, 1,
-1.720547, -0.5831618, -3.561434, 1, 1, 1, 1, 1,
-1.707712, -0.003769291, -2.214789, 1, 1, 1, 1, 1,
-1.703651, -0.3135416, -2.929846, 1, 1, 1, 1, 1,
-1.696856, -1.437896, -2.829182, 1, 1, 1, 1, 1,
-1.696368, 0.6614058, -1.350741, 1, 1, 1, 1, 1,
-1.682711, 0.135152, -1.896358, 0, 0, 1, 1, 1,
-1.668292, 0.5153391, -1.193439, 1, 0, 0, 1, 1,
-1.661657, 1.001262, 0.5545644, 1, 0, 0, 1, 1,
-1.661107, -0.209353, -2.625877, 1, 0, 0, 1, 1,
-1.636179, 2.066824, -1.330319, 1, 0, 0, 1, 1,
-1.634223, -0.4400447, -2.29601, 1, 0, 0, 1, 1,
-1.631787, -1.088536, -3.270826, 0, 0, 0, 1, 1,
-1.623066, -0.4806952, -1.468793, 0, 0, 0, 1, 1,
-1.612665, 0.459406, -1.292587, 0, 0, 0, 1, 1,
-1.612499, -0.009603242, -1.874091, 0, 0, 0, 1, 1,
-1.590486, -1.815678, -1.46299, 0, 0, 0, 1, 1,
-1.58994, -1.367394, -2.402904, 0, 0, 0, 1, 1,
-1.582342, -1.092957, -0.07113148, 0, 0, 0, 1, 1,
-1.580423, -1.413972, -3.449359, 1, 1, 1, 1, 1,
-1.574319, -0.8298646, -4.301013, 1, 1, 1, 1, 1,
-1.554317, 0.8716617, -1.221197, 1, 1, 1, 1, 1,
-1.543809, 0.7533152, -1.047512, 1, 1, 1, 1, 1,
-1.536802, -0.1747811, -1.682994, 1, 1, 1, 1, 1,
-1.530466, 1.228387, -2.074905, 1, 1, 1, 1, 1,
-1.527746, -0.07827664, -2.868031, 1, 1, 1, 1, 1,
-1.523471, 0.01262833, -1.345349, 1, 1, 1, 1, 1,
-1.520885, -1.154428, -2.405771, 1, 1, 1, 1, 1,
-1.498466, 0.7522289, -0.6587439, 1, 1, 1, 1, 1,
-1.496407, -0.1189694, -2.843506, 1, 1, 1, 1, 1,
-1.486269, 0.4202716, 0.2162785, 1, 1, 1, 1, 1,
-1.475565, -0.180097, -3.055161, 1, 1, 1, 1, 1,
-1.473906, -0.5829954, -1.835098, 1, 1, 1, 1, 1,
-1.463805, -1.010846, -3.437456, 1, 1, 1, 1, 1,
-1.461068, 0.4544229, -0.4712023, 0, 0, 1, 1, 1,
-1.450186, -0.634326, -1.4667, 1, 0, 0, 1, 1,
-1.439453, -1.901123, -1.386515, 1, 0, 0, 1, 1,
-1.438071, -0.1822732, -1.731044, 1, 0, 0, 1, 1,
-1.436227, -0.2591269, -1.208416, 1, 0, 0, 1, 1,
-1.435685, -0.9972857, -1.585135, 1, 0, 0, 1, 1,
-1.432399, -2.207244, -4.052145, 0, 0, 0, 1, 1,
-1.429744, -0.6097172, -1.021516, 0, 0, 0, 1, 1,
-1.428816, -0.5624852, -0.6537606, 0, 0, 0, 1, 1,
-1.42343, -1.301059, -2.614394, 0, 0, 0, 1, 1,
-1.42326, -0.5070982, -2.143461, 0, 0, 0, 1, 1,
-1.411528, 1.791167, -0.8362476, 0, 0, 0, 1, 1,
-1.408173, -0.3337268, -4.165392, 0, 0, 0, 1, 1,
-1.407947, -0.03447242, -2.912524, 1, 1, 1, 1, 1,
-1.407659, -0.9837852, -1.40561, 1, 1, 1, 1, 1,
-1.406458, 1.944474, -0.751433, 1, 1, 1, 1, 1,
-1.390548, 0.05997874, -2.336329, 1, 1, 1, 1, 1,
-1.390509, -0.3457989, -1.52194, 1, 1, 1, 1, 1,
-1.388537, 1.295944, -1.11013, 1, 1, 1, 1, 1,
-1.387558, 0.4071062, -2.206575, 1, 1, 1, 1, 1,
-1.36045, -0.2300048, -1.372163, 1, 1, 1, 1, 1,
-1.357705, 1.192833, 0.05928376, 1, 1, 1, 1, 1,
-1.355802, -0.7797182, -2.634578, 1, 1, 1, 1, 1,
-1.339127, -0.6412634, 0.04175928, 1, 1, 1, 1, 1,
-1.324479, 0.2133405, -1.186362, 1, 1, 1, 1, 1,
-1.319156, -0.2500667, -2.735655, 1, 1, 1, 1, 1,
-1.306988, 0.2809971, -1.761408, 1, 1, 1, 1, 1,
-1.300227, -0.911698, -1.018085, 1, 1, 1, 1, 1,
-1.300054, -0.4063029, -2.466899, 0, 0, 1, 1, 1,
-1.297906, 0.3344845, -1.584952, 1, 0, 0, 1, 1,
-1.294811, 0.03867088, -2.098808, 1, 0, 0, 1, 1,
-1.274106, 0.1458533, -1.334938, 1, 0, 0, 1, 1,
-1.273989, -0.816229, -3.118694, 1, 0, 0, 1, 1,
-1.269262, -1.692388, -2.381983, 1, 0, 0, 1, 1,
-1.26144, 1.145894, 2.207185, 0, 0, 0, 1, 1,
-1.253309, 0.2407264, -0.6809849, 0, 0, 0, 1, 1,
-1.251737, -1.607452, -2.318726, 0, 0, 0, 1, 1,
-1.249991, -1.494587, -3.092448, 0, 0, 0, 1, 1,
-1.228502, -0.04288655, -2.154219, 0, 0, 0, 1, 1,
-1.226188, -0.02848438, -1.815164, 0, 0, 0, 1, 1,
-1.217875, 0.07250293, -1.981498, 0, 0, 0, 1, 1,
-1.210883, 0.2898202, 0.05918176, 1, 1, 1, 1, 1,
-1.196734, -1.267266, -1.534857, 1, 1, 1, 1, 1,
-1.187332, -1.523463, -2.754033, 1, 1, 1, 1, 1,
-1.18676, -1.416564, -3.512888, 1, 1, 1, 1, 1,
-1.183416, 1.034418, 0.5391707, 1, 1, 1, 1, 1,
-1.183375, 0.6479793, -1.75177, 1, 1, 1, 1, 1,
-1.182356, 0.9765055, 1.07178, 1, 1, 1, 1, 1,
-1.1783, 1.091466, 0.2918552, 1, 1, 1, 1, 1,
-1.175664, 0.8252752, -1.503602, 1, 1, 1, 1, 1,
-1.170963, -0.5166732, -1.269588, 1, 1, 1, 1, 1,
-1.169152, 0.7873139, -0.1932846, 1, 1, 1, 1, 1,
-1.16879, 0.5898352, -0.6796102, 1, 1, 1, 1, 1,
-1.16807, -2.069352, -1.610555, 1, 1, 1, 1, 1,
-1.167325, 1.051247, -1.085127, 1, 1, 1, 1, 1,
-1.159982, 0.1797696, -0.8338165, 1, 1, 1, 1, 1,
-1.158629, 1.823647, -0.4367879, 0, 0, 1, 1, 1,
-1.158237, -1.582269, -3.185568, 1, 0, 0, 1, 1,
-1.154895, -0.8513623, -4.343047, 1, 0, 0, 1, 1,
-1.147205, 0.4823788, 0.5094969, 1, 0, 0, 1, 1,
-1.14712, -1.010641, 0.5265376, 1, 0, 0, 1, 1,
-1.143366, -0.677008, -0.9808953, 1, 0, 0, 1, 1,
-1.139769, 2.308117, -0.7702329, 0, 0, 0, 1, 1,
-1.13771, 0.2250052, -1.678303, 0, 0, 0, 1, 1,
-1.136746, 0.202442, -1.406437, 0, 0, 0, 1, 1,
-1.125875, 0.4074731, -0.02464392, 0, 0, 0, 1, 1,
-1.124226, 0.1441717, -0.9345194, 0, 0, 0, 1, 1,
-1.107305, 2.072337, 0.8906063, 0, 0, 0, 1, 1,
-1.099136, 0.2640038, -1.70054, 0, 0, 0, 1, 1,
-1.095817, 0.2503636, -0.6238384, 1, 1, 1, 1, 1,
-1.088509, 0.3115641, -0.1880713, 1, 1, 1, 1, 1,
-1.083376, 0.2251604, 0.7551612, 1, 1, 1, 1, 1,
-1.083083, 0.535085, -0.3041248, 1, 1, 1, 1, 1,
-1.07958, 0.09479612, -1.812258, 1, 1, 1, 1, 1,
-1.072653, -0.6767716, -1.546109, 1, 1, 1, 1, 1,
-1.070437, -0.9419358, -2.465566, 1, 1, 1, 1, 1,
-1.070339, 0.06643082, -2.238117, 1, 1, 1, 1, 1,
-1.065297, 0.8220903, -0.8681712, 1, 1, 1, 1, 1,
-1.061938, -0.4687533, -1.865398, 1, 1, 1, 1, 1,
-1.058428, -0.4985007, -1.624815, 1, 1, 1, 1, 1,
-1.056738, 0.02751731, -0.9441574, 1, 1, 1, 1, 1,
-1.0561, -1.42081, -2.133642, 1, 1, 1, 1, 1,
-1.054383, 0.1665455, -1.043631, 1, 1, 1, 1, 1,
-1.048865, -1.456202, -1.927413, 1, 1, 1, 1, 1,
-1.044375, 2.616323, -0.4572091, 0, 0, 1, 1, 1,
-1.039188, -1.364651, -2.355291, 1, 0, 0, 1, 1,
-1.037278, -1.438522, -2.78804, 1, 0, 0, 1, 1,
-1.031925, -1.288313, -2.752603, 1, 0, 0, 1, 1,
-1.028497, 1.514065, 0.7845547, 1, 0, 0, 1, 1,
-1.026692, -0.3047001, -2.454255, 1, 0, 0, 1, 1,
-1.020774, 0.05423038, -0.0996009, 0, 0, 0, 1, 1,
-1.019571, -3.635793, -4.263904, 0, 0, 0, 1, 1,
-1.017069, 0.8148795, -2.14616, 0, 0, 0, 1, 1,
-0.996245, -0.2992544, -1.305981, 0, 0, 0, 1, 1,
-0.9958948, -0.4014263, -2.512336, 0, 0, 0, 1, 1,
-0.9942755, 1.715585, -0.1887916, 0, 0, 0, 1, 1,
-0.9916412, 1.533905, -0.2526907, 0, 0, 0, 1, 1,
-0.9817377, 1.231722, -0.7353137, 1, 1, 1, 1, 1,
-0.9751256, 0.528107, -2.15756, 1, 1, 1, 1, 1,
-0.9736494, 0.4893911, -1.356457, 1, 1, 1, 1, 1,
-0.9707432, -2.597061, -4.355449, 1, 1, 1, 1, 1,
-0.9636354, 1.020077, -1.249142, 1, 1, 1, 1, 1,
-0.9634869, -0.8489904, -3.046621, 1, 1, 1, 1, 1,
-0.9581069, 0.4782052, -1.581959, 1, 1, 1, 1, 1,
-0.9509147, 0.514931, -0.5007917, 1, 1, 1, 1, 1,
-0.9362243, 0.1451067, -1.342877, 1, 1, 1, 1, 1,
-0.9343656, -2.117769, -1.115977, 1, 1, 1, 1, 1,
-0.9259158, -0.2476472, -2.590385, 1, 1, 1, 1, 1,
-0.9238059, 1.131331, -1.083523, 1, 1, 1, 1, 1,
-0.919274, 0.9032372, -3.346689, 1, 1, 1, 1, 1,
-0.9182581, -1.089635, -1.71568, 1, 1, 1, 1, 1,
-0.910234, -0.1850271, -2.228513, 1, 1, 1, 1, 1,
-0.903874, -0.9732116, -2.910959, 0, 0, 1, 1, 1,
-0.9029102, -1.425929, -3.040236, 1, 0, 0, 1, 1,
-0.9004245, 3.195396, -0.9769974, 1, 0, 0, 1, 1,
-0.8879228, -1.461824, -3.865767, 1, 0, 0, 1, 1,
-0.8849433, -1.365796, -2.821844, 1, 0, 0, 1, 1,
-0.883612, 0.8746297, -0.5751802, 1, 0, 0, 1, 1,
-0.8831556, -1.470854, -3.006528, 0, 0, 0, 1, 1,
-0.8757906, -0.1910317, -1.146362, 0, 0, 0, 1, 1,
-0.8631861, -0.5101334, -1.104125, 0, 0, 0, 1, 1,
-0.8589714, 0.5760671, -1.144515, 0, 0, 0, 1, 1,
-0.8558056, 0.9157043, -0.2519982, 0, 0, 0, 1, 1,
-0.8513899, -1.150513, -1.38197, 0, 0, 0, 1, 1,
-0.8476305, 0.3420741, -0.3695572, 0, 0, 0, 1, 1,
-0.8464254, 1.1756, -0.977562, 1, 1, 1, 1, 1,
-0.8408654, 0.6484273, -1.606943, 1, 1, 1, 1, 1,
-0.8401941, 0.2545789, -1.213986, 1, 1, 1, 1, 1,
-0.8342876, 1.123903, 0.8330029, 1, 1, 1, 1, 1,
-0.8214946, -0.8316934, -2.883734, 1, 1, 1, 1, 1,
-0.8159823, 1.484814, -1.91062, 1, 1, 1, 1, 1,
-0.814923, 0.2669173, -2.778216, 1, 1, 1, 1, 1,
-0.8138961, -0.1403608, -1.303975, 1, 1, 1, 1, 1,
-0.809914, -0.07152982, -2.697093, 1, 1, 1, 1, 1,
-0.8093876, -0.7535557, -2.027125, 1, 1, 1, 1, 1,
-0.8042766, 1.054139, -0.8624478, 1, 1, 1, 1, 1,
-0.8035828, 0.7049161, 0.5032476, 1, 1, 1, 1, 1,
-0.8020723, -1.296747, -2.599567, 1, 1, 1, 1, 1,
-0.788738, 0.2495552, -1.383968, 1, 1, 1, 1, 1,
-0.7884647, 0.7813899, -2.695046, 1, 1, 1, 1, 1,
-0.788116, -0.5523998, -2.071074, 0, 0, 1, 1, 1,
-0.7874261, 0.6258118, -1.982773, 1, 0, 0, 1, 1,
-0.786512, 0.7453223, -2.666831, 1, 0, 0, 1, 1,
-0.7851905, -0.7442552, -3.124016, 1, 0, 0, 1, 1,
-0.7780561, 0.5756278, -0.3941165, 1, 0, 0, 1, 1,
-0.7757534, 0.482374, -1.674578, 1, 0, 0, 1, 1,
-0.7703779, 0.8069511, -0.7487423, 0, 0, 0, 1, 1,
-0.7700411, 0.05237007, -0.6432713, 0, 0, 0, 1, 1,
-0.7692741, 3.431183, -0.5394761, 0, 0, 0, 1, 1,
-0.7655793, -0.8268229, -2.040856, 0, 0, 0, 1, 1,
-0.7606062, 0.1894296, -1.556908, 0, 0, 0, 1, 1,
-0.7594345, -1.013834, -3.425643, 0, 0, 0, 1, 1,
-0.7590432, -0.2751746, -2.941861, 0, 0, 0, 1, 1,
-0.7580211, -1.215358, -2.533301, 1, 1, 1, 1, 1,
-0.7571857, 0.7195454, -0.1946511, 1, 1, 1, 1, 1,
-0.7395118, 0.9965091, -0.6599137, 1, 1, 1, 1, 1,
-0.7378458, 0.006073368, -2.091437, 1, 1, 1, 1, 1,
-0.7295984, -0.03262585, -2.086718, 1, 1, 1, 1, 1,
-0.7274609, 0.9853358, -2.020443, 1, 1, 1, 1, 1,
-0.7270337, 1.299011, 1.207684, 1, 1, 1, 1, 1,
-0.722658, 0.9384375, 0.9600211, 1, 1, 1, 1, 1,
-0.7189354, -0.8933737, -2.101103, 1, 1, 1, 1, 1,
-0.7172996, 0.513639, -0.9705637, 1, 1, 1, 1, 1,
-0.7144761, -0.5074427, -0.8347335, 1, 1, 1, 1, 1,
-0.7126945, -0.6347051, -1.342966, 1, 1, 1, 1, 1,
-0.7033516, -0.3021201, -1.47198, 1, 1, 1, 1, 1,
-0.6984364, 0.6747682, -0.0688829, 1, 1, 1, 1, 1,
-0.6973729, 0.4399982, -0.07923301, 1, 1, 1, 1, 1,
-0.6960628, 0.3087127, -1.157484, 0, 0, 1, 1, 1,
-0.6945796, -0.4519759, -3.65644, 1, 0, 0, 1, 1,
-0.6935745, -0.7844746, -2.745028, 1, 0, 0, 1, 1,
-0.6906676, 0.09209988, -1.814062, 1, 0, 0, 1, 1,
-0.6899792, 0.1670571, -1.105588, 1, 0, 0, 1, 1,
-0.6879626, 1.535205, -1.742185, 1, 0, 0, 1, 1,
-0.668013, -0.2623059, -3.67261, 0, 0, 0, 1, 1,
-0.661485, -0.8971174, -3.13412, 0, 0, 0, 1, 1,
-0.6498446, 1.681506, -0.4571146, 0, 0, 0, 1, 1,
-0.6496273, -0.7554043, -1.429855, 0, 0, 0, 1, 1,
-0.6486569, 1.311157, -2.763116, 0, 0, 0, 1, 1,
-0.646352, 2.019614, -0.8364154, 0, 0, 0, 1, 1,
-0.6431107, -1.310561, -1.379858, 0, 0, 0, 1, 1,
-0.6369194, 0.202486, -1.255498, 1, 1, 1, 1, 1,
-0.6318557, 0.901636, -1.494706, 1, 1, 1, 1, 1,
-0.6310422, 0.7946404, -0.5033607, 1, 1, 1, 1, 1,
-0.6305119, 0.6145652, -1.664388, 1, 1, 1, 1, 1,
-0.6286678, -1.026478, -2.095802, 1, 1, 1, 1, 1,
-0.6285396, 0.6993635, -1.414557, 1, 1, 1, 1, 1,
-0.6208378, -0.4451754, -2.690614, 1, 1, 1, 1, 1,
-0.6206892, 1.36946, -0.7578489, 1, 1, 1, 1, 1,
-0.6170009, -1.391917, -2.574223, 1, 1, 1, 1, 1,
-0.6169041, 0.6649502, 0.2327388, 1, 1, 1, 1, 1,
-0.6167737, -0.4701816, -1.919902, 1, 1, 1, 1, 1,
-0.6162586, 1.05657, -0.961515, 1, 1, 1, 1, 1,
-0.6155873, -0.8483843, -3.709638, 1, 1, 1, 1, 1,
-0.6143322, 0.8041203, 1.1757, 1, 1, 1, 1, 1,
-0.6123489, 0.6986601, -1.949113, 1, 1, 1, 1, 1,
-0.5979995, -0.07257801, -1.821537, 0, 0, 1, 1, 1,
-0.5978144, -1.266033, -3.830347, 1, 0, 0, 1, 1,
-0.5885903, 0.4864858, -0.7641757, 1, 0, 0, 1, 1,
-0.5747569, 0.5904402, -1.915333, 1, 0, 0, 1, 1,
-0.5746713, -0.1282011, -1.784196, 1, 0, 0, 1, 1,
-0.5662982, -0.137526, -3.2451, 1, 0, 0, 1, 1,
-0.5655546, 1.539133, -1.34457, 0, 0, 0, 1, 1,
-0.5556288, 1.140596, 0.07637887, 0, 0, 0, 1, 1,
-0.5547955, 0.4875682, 0.3725694, 0, 0, 0, 1, 1,
-0.5545883, 1.194747, 1.101829, 0, 0, 0, 1, 1,
-0.5543374, 0.7745094, 1.059648, 0, 0, 0, 1, 1,
-0.5527559, -0.3678117, -2.795738, 0, 0, 0, 1, 1,
-0.5464974, 0.8859609, -2.504617, 0, 0, 0, 1, 1,
-0.5401492, 1.22985, 0.4847909, 1, 1, 1, 1, 1,
-0.5383458, -1.735832, -2.865346, 1, 1, 1, 1, 1,
-0.5350499, -0.5542425, -2.45802, 1, 1, 1, 1, 1,
-0.5284204, 1.136215, -1.122907, 1, 1, 1, 1, 1,
-0.5278086, 0.1802229, -0.6955881, 1, 1, 1, 1, 1,
-0.5190965, -0.817655, -1.673982, 1, 1, 1, 1, 1,
-0.5148298, 0.8509123, -1.103294, 1, 1, 1, 1, 1,
-0.5137235, 0.1624176, -0.7046401, 1, 1, 1, 1, 1,
-0.51152, -0.18927, -1.871986, 1, 1, 1, 1, 1,
-0.5081248, 1.751661, -1.555258, 1, 1, 1, 1, 1,
-0.5068031, -0.7166639, -2.25898, 1, 1, 1, 1, 1,
-0.506551, -0.1591273, -1.121728, 1, 1, 1, 1, 1,
-0.5055987, 2.208667, 0.343438, 1, 1, 1, 1, 1,
-0.5041687, -0.9687076, -1.331405, 1, 1, 1, 1, 1,
-0.4991829, -0.5125738, -2.888005, 1, 1, 1, 1, 1,
-0.4979867, 1.921179, 0.8959389, 0, 0, 1, 1, 1,
-0.496498, -1.542718, -1.962958, 1, 0, 0, 1, 1,
-0.4964092, -0.5387987, -0.8108612, 1, 0, 0, 1, 1,
-0.4935057, 0.108549, -0.4992016, 1, 0, 0, 1, 1,
-0.4886605, 0.7770139, -0.3992866, 1, 0, 0, 1, 1,
-0.4884447, -1.406114, -1.793043, 1, 0, 0, 1, 1,
-0.4870903, -0.7026639, -2.648928, 0, 0, 0, 1, 1,
-0.4815477, -0.6689052, -2.680581, 0, 0, 0, 1, 1,
-0.4809968, 0.8638447, -1.832652, 0, 0, 0, 1, 1,
-0.4804243, -2.189489, -3.268924, 0, 0, 0, 1, 1,
-0.4767633, -1.28446, -2.178927, 0, 0, 0, 1, 1,
-0.473846, 1.20015, 0.02083764, 0, 0, 0, 1, 1,
-0.4729127, 1.045618, -0.2933456, 0, 0, 0, 1, 1,
-0.4673424, -1.290047, -3.407093, 1, 1, 1, 1, 1,
-0.4657859, 0.8014888, -0.00216852, 1, 1, 1, 1, 1,
-0.4656933, 2.208831, 0.6327398, 1, 1, 1, 1, 1,
-0.4587069, -0.3902262, -3.355671, 1, 1, 1, 1, 1,
-0.454152, -0.5583197, -3.215737, 1, 1, 1, 1, 1,
-0.450089, 0.8269098, -0.2519647, 1, 1, 1, 1, 1,
-0.448026, -0.425804, -2.150771, 1, 1, 1, 1, 1,
-0.447756, 0.131099, -2.452509, 1, 1, 1, 1, 1,
-0.444951, -0.3389676, -1.865951, 1, 1, 1, 1, 1,
-0.4378968, -0.6278147, -3.978336, 1, 1, 1, 1, 1,
-0.4349218, -0.7558433, -3.124979, 1, 1, 1, 1, 1,
-0.4336888, 0.4733051, -0.3583785, 1, 1, 1, 1, 1,
-0.4334408, -0.5570969, -0.8049273, 1, 1, 1, 1, 1,
-0.4327015, -0.202275, -2.133438, 1, 1, 1, 1, 1,
-0.4309052, 2.243523, 0.3079369, 1, 1, 1, 1, 1,
-0.4253379, -1.137385, -3.166127, 0, 0, 1, 1, 1,
-0.420439, 0.7140822, -1.274989, 1, 0, 0, 1, 1,
-0.4177898, -0.009960201, -2.272889, 1, 0, 0, 1, 1,
-0.415931, 1.834766, -0.4172582, 1, 0, 0, 1, 1,
-0.4155378, 0.3928141, -0.3905741, 1, 0, 0, 1, 1,
-0.4118116, -2.076477, -3.108696, 1, 0, 0, 1, 1,
-0.4108482, -0.5301274, -3.469538, 0, 0, 0, 1, 1,
-0.40787, -1.676422, -2.750728, 0, 0, 0, 1, 1,
-0.4061457, -2.553999, -0.9045052, 0, 0, 0, 1, 1,
-0.4060448, 1.927539, -0.07485598, 0, 0, 0, 1, 1,
-0.4027843, -0.7094162, -2.975117, 0, 0, 0, 1, 1,
-0.4015586, 1.280369, -0.7764695, 0, 0, 0, 1, 1,
-0.399841, 1.361382, -0.8418943, 0, 0, 0, 1, 1,
-0.3996683, -0.3299696, -3.292987, 1, 1, 1, 1, 1,
-0.3918031, -0.2036435, -1.252444, 1, 1, 1, 1, 1,
-0.3907306, 1.882465, -0.9227744, 1, 1, 1, 1, 1,
-0.3893962, 0.405628, -1.039981, 1, 1, 1, 1, 1,
-0.3851086, 0.1825801, 0.08310962, 1, 1, 1, 1, 1,
-0.3841262, 0.7330322, 0.8918602, 1, 1, 1, 1, 1,
-0.3788627, -0.09354836, -1.816478, 1, 1, 1, 1, 1,
-0.3765145, 1.052094, -0.5278732, 1, 1, 1, 1, 1,
-0.3696294, 1.61323, -0.5368919, 1, 1, 1, 1, 1,
-0.3640551, -0.6707074, 0.4969764, 1, 1, 1, 1, 1,
-0.3596005, 0.5778063, 0.3275034, 1, 1, 1, 1, 1,
-0.3589276, -0.2660884, -2.713862, 1, 1, 1, 1, 1,
-0.3580847, -0.6609892, -4.254954, 1, 1, 1, 1, 1,
-0.3577653, 1.538394, 0.6427429, 1, 1, 1, 1, 1,
-0.3570789, 1.718931, 0.4223278, 1, 1, 1, 1, 1,
-0.3543752, -0.02256978, -1.682486, 0, 0, 1, 1, 1,
-0.3534177, -0.307234, -3.050671, 1, 0, 0, 1, 1,
-0.3508673, 0.06326398, -1.652265, 1, 0, 0, 1, 1,
-0.3498234, -2.272646, -2.121285, 1, 0, 0, 1, 1,
-0.3489082, 0.8780888, 0.1527525, 1, 0, 0, 1, 1,
-0.3484832, 1.405774, -3.164961, 1, 0, 0, 1, 1,
-0.34756, 1.298354, 1.010913, 0, 0, 0, 1, 1,
-0.345243, 1.314614, -1.349071, 0, 0, 0, 1, 1,
-0.3396179, -0.02751551, -1.196196, 0, 0, 0, 1, 1,
-0.3385693, -0.9281605, -0.4956991, 0, 0, 0, 1, 1,
-0.3363208, 2.543736, 0.205726, 0, 0, 0, 1, 1,
-0.3359315, 0.6970627, -0.8738446, 0, 0, 0, 1, 1,
-0.3351917, 1.574924, 0.2379339, 0, 0, 0, 1, 1,
-0.3327139, -0.2784942, -0.7095961, 1, 1, 1, 1, 1,
-0.3324998, -0.9226757, -4.06915, 1, 1, 1, 1, 1,
-0.3305932, -0.6590229, -2.509564, 1, 1, 1, 1, 1,
-0.3302888, -0.3426098, -1.987339, 1, 1, 1, 1, 1,
-0.3290693, 0.3524465, -0.6172557, 1, 1, 1, 1, 1,
-0.3258344, -0.6139747, -2.770227, 1, 1, 1, 1, 1,
-0.3251151, -1.82953, -3.017139, 1, 1, 1, 1, 1,
-0.3193846, 0.5194151, -0.5790529, 1, 1, 1, 1, 1,
-0.3158312, 0.01679462, -1.798599, 1, 1, 1, 1, 1,
-0.3120484, 0.2937692, -0.9765149, 1, 1, 1, 1, 1,
-0.311751, -0.5849889, -2.968365, 1, 1, 1, 1, 1,
-0.3109786, 0.02050301, -2.743655, 1, 1, 1, 1, 1,
-0.3103812, 0.3838589, 0.08185107, 1, 1, 1, 1, 1,
-0.3061245, -0.09260801, -1.054081, 1, 1, 1, 1, 1,
-0.3048165, 1.649935, -0.3169045, 1, 1, 1, 1, 1,
-0.2999096, 1.014625, -1.178928, 0, 0, 1, 1, 1,
-0.2909812, -2.069165, -1.927473, 1, 0, 0, 1, 1,
-0.2868172, -0.4677806, -3.100561, 1, 0, 0, 1, 1,
-0.2863138, -0.9062581, -3.027263, 1, 0, 0, 1, 1,
-0.2842728, 0.2381533, -1.678601, 1, 0, 0, 1, 1,
-0.2807621, -2.870875, -4.355593, 1, 0, 0, 1, 1,
-0.2781588, -0.1582873, -1.601005, 0, 0, 0, 1, 1,
-0.2769908, -0.8664993, -3.422697, 0, 0, 0, 1, 1,
-0.2728226, 0.1175899, -1.219841, 0, 0, 0, 1, 1,
-0.2680986, -0.4278073, -2.123666, 0, 0, 0, 1, 1,
-0.2668127, -1.383006, -2.124126, 0, 0, 0, 1, 1,
-0.2660985, 2.383456, 0.9025539, 0, 0, 0, 1, 1,
-0.2658322, -1.963999, -1.583676, 0, 0, 0, 1, 1,
-0.265442, 0.2643799, -0.3053083, 1, 1, 1, 1, 1,
-0.2653138, 0.478335, -1.115904, 1, 1, 1, 1, 1,
-0.2639312, 1.0893, 0.4601007, 1, 1, 1, 1, 1,
-0.2637681, -0.3687942, -2.011047, 1, 1, 1, 1, 1,
-0.2625817, 0.5178661, 0.008818064, 1, 1, 1, 1, 1,
-0.2589358, -0.245248, -1.568034, 1, 1, 1, 1, 1,
-0.251249, -0.4930051, -4.043832, 1, 1, 1, 1, 1,
-0.2451155, 0.2237749, -0.1443314, 1, 1, 1, 1, 1,
-0.2411615, -0.2467066, -3.110611, 1, 1, 1, 1, 1,
-0.238457, -1.592976, -3.9416, 1, 1, 1, 1, 1,
-0.2373643, -0.3701724, -2.058361, 1, 1, 1, 1, 1,
-0.2319083, -0.06797145, -3.006245, 1, 1, 1, 1, 1,
-0.2294611, 0.6405752, -0.7180966, 1, 1, 1, 1, 1,
-0.2278603, -0.795758, -2.00609, 1, 1, 1, 1, 1,
-0.2241792, 0.6195804, -0.4647516, 1, 1, 1, 1, 1,
-0.2215115, -0.8421811, -1.764947, 0, 0, 1, 1, 1,
-0.2214847, 0.6562602, 1.078503, 1, 0, 0, 1, 1,
-0.2185398, -1.704219, -4.075373, 1, 0, 0, 1, 1,
-0.2177761, 0.418899, -0.1304399, 1, 0, 0, 1, 1,
-0.2157406, 0.0755095, -2.451054, 1, 0, 0, 1, 1,
-0.2150674, -0.4393729, -1.541919, 1, 0, 0, 1, 1,
-0.2114884, 0.963212, 0.1196829, 0, 0, 0, 1, 1,
-0.210147, -1.053686, -3.301383, 0, 0, 0, 1, 1,
-0.2082281, -1.081941, -1.677061, 0, 0, 0, 1, 1,
-0.207625, 1.254426, 0.07062835, 0, 0, 0, 1, 1,
-0.2060284, 2.241212, -1.032232, 0, 0, 0, 1, 1,
-0.2040767, -0.1511271, -2.962007, 0, 0, 0, 1, 1,
-0.2000337, 2.525996, 0.06843778, 0, 0, 0, 1, 1,
-0.19648, 0.001196076, -2.20945, 1, 1, 1, 1, 1,
-0.1939628, -0.01797864, -0.3528818, 1, 1, 1, 1, 1,
-0.1925994, 0.774685, 2.50922, 1, 1, 1, 1, 1,
-0.1826604, -0.8799093, -2.478675, 1, 1, 1, 1, 1,
-0.1793237, 0.234576, 0.1442696, 1, 1, 1, 1, 1,
-0.1791679, 0.7522904, -1.574855, 1, 1, 1, 1, 1,
-0.177943, -0.3589485, -1.23755, 1, 1, 1, 1, 1,
-0.1761148, -0.7131096, -3.373745, 1, 1, 1, 1, 1,
-0.175768, 1.487857, 1.7323, 1, 1, 1, 1, 1,
-0.1744894, -0.9513969, -2.141542, 1, 1, 1, 1, 1,
-0.1736509, 0.7733387, 0.1658277, 1, 1, 1, 1, 1,
-0.1725268, 1.05128, 0.4407327, 1, 1, 1, 1, 1,
-0.1694302, -0.1419937, -3.281996, 1, 1, 1, 1, 1,
-0.1690014, 0.3871052, -0.4917964, 1, 1, 1, 1, 1,
-0.1627036, -0.2519439, -3.91702, 1, 1, 1, 1, 1,
-0.162167, 0.1576395, -1.310139, 0, 0, 1, 1, 1,
-0.1604789, -0.8050983, -2.05655, 1, 0, 0, 1, 1,
-0.1586718, 0.429843, 0.9204386, 1, 0, 0, 1, 1,
-0.1563962, -2.047986, -4.25956, 1, 0, 0, 1, 1,
-0.1558073, -0.8685144, -2.66183, 1, 0, 0, 1, 1,
-0.1557105, -0.2913758, -3.501279, 1, 0, 0, 1, 1,
-0.1540772, 2.277696, -0.5045848, 0, 0, 0, 1, 1,
-0.1535742, 0.5237206, 0.0058176, 0, 0, 0, 1, 1,
-0.1520525, -0.3720126, -2.540534, 0, 0, 0, 1, 1,
-0.1517167, -2.219457, -1.819191, 0, 0, 0, 1, 1,
-0.1504989, 0.3332098, -0.7107266, 0, 0, 0, 1, 1,
-0.1476016, 0.6684947, -0.658039, 0, 0, 0, 1, 1,
-0.1471652, 1.533858, -1.820341, 0, 0, 0, 1, 1,
-0.145504, -0.2141601, -3.823503, 1, 1, 1, 1, 1,
-0.1378856, -0.2897978, -3.343803, 1, 1, 1, 1, 1,
-0.1334583, -0.08752075, -0.9605255, 1, 1, 1, 1, 1,
-0.1324814, 1.262197, -1.074274, 1, 1, 1, 1, 1,
-0.1258714, 0.3521402, 0.8485886, 1, 1, 1, 1, 1,
-0.1228263, 1.222159, 0.8863148, 1, 1, 1, 1, 1,
-0.120464, 0.7640977, -1.278921, 1, 1, 1, 1, 1,
-0.1183989, 0.6977013, -0.001178728, 1, 1, 1, 1, 1,
-0.1147917, 0.8651003, -0.607686, 1, 1, 1, 1, 1,
-0.1106321, -0.3013488, -1.573221, 1, 1, 1, 1, 1,
-0.1036696, -0.9805785, -4.074693, 1, 1, 1, 1, 1,
-0.09854671, 0.3988952, 1.024401, 1, 1, 1, 1, 1,
-0.09150525, -0.676006, -2.626603, 1, 1, 1, 1, 1,
-0.09106614, 1.238418, -0.4286434, 1, 1, 1, 1, 1,
-0.08806936, -1.444355, -3.373849, 1, 1, 1, 1, 1,
-0.08695242, -0.6545557, -4.809727, 0, 0, 1, 1, 1,
-0.08546203, -0.378507, -3.337395, 1, 0, 0, 1, 1,
-0.0854392, 1.644701, 1.225323, 1, 0, 0, 1, 1,
-0.08504444, -0.4155577, -2.275689, 1, 0, 0, 1, 1,
-0.08330857, -0.237443, -2.95064, 1, 0, 0, 1, 1,
-0.08236863, 0.3708085, -0.3009307, 1, 0, 0, 1, 1,
-0.07789298, -0.8809625, -3.986769, 0, 0, 0, 1, 1,
-0.07670547, -0.1501642, -0.2168987, 0, 0, 0, 1, 1,
-0.0733426, -0.1239359, -2.465116, 0, 0, 0, 1, 1,
-0.0705525, -0.5043077, -3.925426, 0, 0, 0, 1, 1,
-0.0703094, 1.621082, 0.06073684, 0, 0, 0, 1, 1,
-0.06712259, -1.119216, -3.15324, 0, 0, 0, 1, 1,
-0.06396829, -0.4310303, -3.269286, 0, 0, 0, 1, 1,
-0.06260415, -0.02977067, -1.78698, 1, 1, 1, 1, 1,
-0.06046864, 0.3974151, -2.818004, 1, 1, 1, 1, 1,
-0.05984402, 2.034963, 1.169415, 1, 1, 1, 1, 1,
-0.05871051, -1.023979, -3.380694, 1, 1, 1, 1, 1,
-0.05820622, 1.343784, -0.4946957, 1, 1, 1, 1, 1,
-0.0564454, -0.4543349, -5.414356, 1, 1, 1, 1, 1,
-0.05316589, -0.9556741, -2.336634, 1, 1, 1, 1, 1,
-0.05070546, 0.2547172, 0.1136921, 1, 1, 1, 1, 1,
-0.04803364, 1.561538, -0.6094882, 1, 1, 1, 1, 1,
-0.04111557, 0.2295137, -0.713459, 1, 1, 1, 1, 1,
-0.03453196, 0.3530043, 0.4676934, 1, 1, 1, 1, 1,
-0.03380526, -0.969636, -3.395303, 1, 1, 1, 1, 1,
-0.03252363, 1.314733, 0.9978995, 1, 1, 1, 1, 1,
-0.02998449, -1.602424, -1.757556, 1, 1, 1, 1, 1,
-0.02761406, -0.6719041, -2.78196, 1, 1, 1, 1, 1,
-0.0243363, -1.198881, -2.669441, 0, 0, 1, 1, 1,
-0.01662664, 0.2831813, -0.1202709, 1, 0, 0, 1, 1,
-0.009460242, 0.3080623, -2.578591, 1, 0, 0, 1, 1,
-0.008791069, -2.782159, -4.48603, 1, 0, 0, 1, 1,
-0.007665682, 0.9955661, -0.6330151, 1, 0, 0, 1, 1,
-0.006064294, -0.6371977, -2.886097, 1, 0, 0, 1, 1,
-0.004022063, -0.2393503, -3.857387, 0, 0, 0, 1, 1,
-0.0002414979, -1.31351, -1.641313, 0, 0, 0, 1, 1,
0.002251892, 0.7228578, -2.152941, 0, 0, 0, 1, 1,
0.002435306, 1.714869, -0.5517433, 0, 0, 0, 1, 1,
0.003377536, 1.175946, 1.219394, 0, 0, 0, 1, 1,
0.004207443, 1.091029, 0.5655412, 0, 0, 0, 1, 1,
0.006800954, 0.04458837, 0.8404134, 0, 0, 0, 1, 1,
0.007798161, -0.3749166, 2.260794, 1, 1, 1, 1, 1,
0.01090922, 1.028705, -0.2401495, 1, 1, 1, 1, 1,
0.01160914, -0.3773457, 2.603329, 1, 1, 1, 1, 1,
0.01351631, -0.2452565, 3.541751, 1, 1, 1, 1, 1,
0.0136942, 0.1406505, -1.008746, 1, 1, 1, 1, 1,
0.01544188, 0.6387258, -0.6975543, 1, 1, 1, 1, 1,
0.01911953, -0.5260927, 2.38285, 1, 1, 1, 1, 1,
0.01952392, 1.730997, -0.1044548, 1, 1, 1, 1, 1,
0.03614525, 1.74789, 0.5184817, 1, 1, 1, 1, 1,
0.0400679, -0.3727892, 2.182808, 1, 1, 1, 1, 1,
0.04115835, 0.4373555, 0.7473035, 1, 1, 1, 1, 1,
0.0412964, 0.1909214, 0.8149452, 1, 1, 1, 1, 1,
0.0472872, 0.1073598, 0.5384015, 1, 1, 1, 1, 1,
0.05181754, -0.4015837, 2.647655, 1, 1, 1, 1, 1,
0.05201737, 0.1551744, 0.1267917, 1, 1, 1, 1, 1,
0.05456194, -0.544156, 3.661002, 0, 0, 1, 1, 1,
0.06331606, 0.7056429, -1.424931, 1, 0, 0, 1, 1,
0.06583727, 0.5972025, -1.0662, 1, 0, 0, 1, 1,
0.06756759, -0.3945881, 4.696548, 1, 0, 0, 1, 1,
0.06835424, -0.5533021, 2.602428, 1, 0, 0, 1, 1,
0.06859516, 0.6807222, -0.7676965, 1, 0, 0, 1, 1,
0.07039947, -0.3317043, 1.699113, 0, 0, 0, 1, 1,
0.07240463, -0.517962, 1.920593, 0, 0, 0, 1, 1,
0.07263064, -0.8660192, 2.871326, 0, 0, 0, 1, 1,
0.08059936, -0.8161641, 3.662294, 0, 0, 0, 1, 1,
0.08577207, 0.5021663, -0.7045001, 0, 0, 0, 1, 1,
0.09260245, 0.7996129, 0.4098492, 0, 0, 0, 1, 1,
0.09516501, 0.5803107, 0.7853771, 0, 0, 0, 1, 1,
0.09532221, 1.137956, 0.2584457, 1, 1, 1, 1, 1,
0.09641647, -1.22402, 3.236144, 1, 1, 1, 1, 1,
0.1089234, 0.8709998, 0.3898478, 1, 1, 1, 1, 1,
0.1153733, 0.9895875, -0.5528029, 1, 1, 1, 1, 1,
0.1215078, -2.424647, 4.327344, 1, 1, 1, 1, 1,
0.1223896, -0.8413703, 4.468269, 1, 1, 1, 1, 1,
0.1238418, 0.1322168, 0.7340894, 1, 1, 1, 1, 1,
0.1267711, -0.4913108, 3.468343, 1, 1, 1, 1, 1,
0.1277156, 0.5981916, 1.25344, 1, 1, 1, 1, 1,
0.1293873, -0.422655, 3.07118, 1, 1, 1, 1, 1,
0.1307515, 0.08831681, 1.720398, 1, 1, 1, 1, 1,
0.1328749, 0.4825687, -0.6463798, 1, 1, 1, 1, 1,
0.1402315, -0.03282261, 1.858079, 1, 1, 1, 1, 1,
0.1457266, -0.4612361, 1.918347, 1, 1, 1, 1, 1,
0.1491049, -0.2401334, 2.927995, 1, 1, 1, 1, 1,
0.1513231, -0.4027225, 4.61802, 0, 0, 1, 1, 1,
0.1514077, 0.7342092, 0.3926934, 1, 0, 0, 1, 1,
0.1538058, 0.03533172, 0.1889058, 1, 0, 0, 1, 1,
0.1547642, 0.3333704, -0.8619769, 1, 0, 0, 1, 1,
0.1591514, -0.1286495, 3.233351, 1, 0, 0, 1, 1,
0.1592695, -0.9995853, 2.796051, 1, 0, 0, 1, 1,
0.1634841, -1.110745, 2.312259, 0, 0, 0, 1, 1,
0.1659229, 0.6229548, 1.423376, 0, 0, 0, 1, 1,
0.1685942, -0.8248954, 2.536024, 0, 0, 0, 1, 1,
0.1704973, 0.1379985, 0.931954, 0, 0, 0, 1, 1,
0.1782715, 0.608122, -0.9599813, 0, 0, 0, 1, 1,
0.1784493, 0.1415384, -0.1924196, 0, 0, 0, 1, 1,
0.1870019, 0.8867099, -0.6692023, 0, 0, 0, 1, 1,
0.200418, 0.3717491, 1.523875, 1, 1, 1, 1, 1,
0.2026736, -0.3976954, 2.139412, 1, 1, 1, 1, 1,
0.205119, 0.2665514, 0.9722685, 1, 1, 1, 1, 1,
0.2127807, 0.7884477, -0.8449573, 1, 1, 1, 1, 1,
0.213147, 0.6089369, 3.031948, 1, 1, 1, 1, 1,
0.2134173, -0.303764, 3.318731, 1, 1, 1, 1, 1,
0.2197004, -0.09426399, 1.135832, 1, 1, 1, 1, 1,
0.221192, 0.482253, 1.337107, 1, 1, 1, 1, 1,
0.2229036, 2.23949, -0.1211702, 1, 1, 1, 1, 1,
0.2235136, -1.052376, 3.008338, 1, 1, 1, 1, 1,
0.2253234, -0.3442825, 3.108355, 1, 1, 1, 1, 1,
0.2318301, 0.1176654, 2.173966, 1, 1, 1, 1, 1,
0.2324499, -0.1292785, 1.785838, 1, 1, 1, 1, 1,
0.2363171, 0.8270138, -0.01228144, 1, 1, 1, 1, 1,
0.2378922, -1.695859, 3.54173, 1, 1, 1, 1, 1,
0.2382269, 0.3124893, 1.040827, 0, 0, 1, 1, 1,
0.2382474, 0.5664732, 1.884371, 1, 0, 0, 1, 1,
0.2419115, 1.256435, -0.7802917, 1, 0, 0, 1, 1,
0.2480943, 0.1660277, 0.722716, 1, 0, 0, 1, 1,
0.2519881, -0.7475228, 3.261308, 1, 0, 0, 1, 1,
0.2523546, -0.01667627, 2.00902, 1, 0, 0, 1, 1,
0.2524251, 1.776525, 0.1035998, 0, 0, 0, 1, 1,
0.2576006, 0.5445045, 2.072302, 0, 0, 0, 1, 1,
0.262537, 0.6592408, -1.228301, 0, 0, 0, 1, 1,
0.2632035, -0.7824811, 1.801418, 0, 0, 0, 1, 1,
0.2637999, 0.2186645, 2.642844, 0, 0, 0, 1, 1,
0.2639109, -0.2048674, 2.54017, 0, 0, 0, 1, 1,
0.2649156, -0.8694701, 4.998654, 0, 0, 0, 1, 1,
0.2649539, 1.208085, 0.08621086, 1, 1, 1, 1, 1,
0.2672428, -1.220669, 4.272565, 1, 1, 1, 1, 1,
0.2675972, 1.630472, 0.7758152, 1, 1, 1, 1, 1,
0.2696154, -0.4762947, 2.837621, 1, 1, 1, 1, 1,
0.2785575, 2.126374, 0.4703285, 1, 1, 1, 1, 1,
0.2797788, 1.333041, 0.766265, 1, 1, 1, 1, 1,
0.2835888, -0.05648716, 3.411528, 1, 1, 1, 1, 1,
0.2884523, -0.5743809, 0.8242362, 1, 1, 1, 1, 1,
0.2891681, -1.884674, 1.977233, 1, 1, 1, 1, 1,
0.2907284, -0.6039782, 2.798467, 1, 1, 1, 1, 1,
0.2914958, -1.757552, 4.275822, 1, 1, 1, 1, 1,
0.2939796, -0.03511125, 2.161704, 1, 1, 1, 1, 1,
0.2968744, -0.2990649, 3.098838, 1, 1, 1, 1, 1,
0.297253, -0.2213621, 3.859991, 1, 1, 1, 1, 1,
0.2974468, 0.8891432, 2.43227, 1, 1, 1, 1, 1,
0.2978446, 1.032973, -0.6255449, 0, 0, 1, 1, 1,
0.2989766, 0.5606378, 0.06484744, 1, 0, 0, 1, 1,
0.3036943, -1.006196, 3.651886, 1, 0, 0, 1, 1,
0.3079382, -1.177863, 2.371979, 1, 0, 0, 1, 1,
0.3079597, 1.372013, -0.1703025, 1, 0, 0, 1, 1,
0.3115793, -1.281543, 2.226204, 1, 0, 0, 1, 1,
0.3148349, 0.1402467, 0.2424214, 0, 0, 0, 1, 1,
0.3158877, -1.025113, 3.326978, 0, 0, 0, 1, 1,
0.3162478, -1.336445, 3.092365, 0, 0, 0, 1, 1,
0.3164118, -0.7944916, 4.865169, 0, 0, 0, 1, 1,
0.3189839, -0.4024811, 2.027523, 0, 0, 0, 1, 1,
0.3240872, 1.887236, 0.9281266, 0, 0, 0, 1, 1,
0.3247511, 0.005290907, 2.014521, 0, 0, 0, 1, 1,
0.3249556, 1.167858, -0.9042521, 1, 1, 1, 1, 1,
0.3262458, 0.8627034, -0.4508906, 1, 1, 1, 1, 1,
0.3271273, -0.0105621, 1.632252, 1, 1, 1, 1, 1,
0.3288383, 0.2413685, 1.576267, 1, 1, 1, 1, 1,
0.3335108, 2.248412, 2.281488, 1, 1, 1, 1, 1,
0.334961, 0.1154601, 1.127736, 1, 1, 1, 1, 1,
0.3364141, 1.326757, 1.95691, 1, 1, 1, 1, 1,
0.3374636, 1.0802, -1.824405, 1, 1, 1, 1, 1,
0.3382964, 1.397581, -0.6195955, 1, 1, 1, 1, 1,
0.3504404, 0.1515472, 2.327374, 1, 1, 1, 1, 1,
0.3528121, -1.461409, 3.022053, 1, 1, 1, 1, 1,
0.3530779, 1.192224, 1.690162, 1, 1, 1, 1, 1,
0.359833, 2.514867, 0.1402272, 1, 1, 1, 1, 1,
0.3660643, -0.8501897, 3.158749, 1, 1, 1, 1, 1,
0.3706297, -1.241472, 4.331406, 1, 1, 1, 1, 1,
0.3751017, -0.1481327, 0.9254569, 0, 0, 1, 1, 1,
0.3758352, 1.145468, 0.8117853, 1, 0, 0, 1, 1,
0.386801, 0.2436063, 1.675969, 1, 0, 0, 1, 1,
0.3893799, 1.323748, -1.43704, 1, 0, 0, 1, 1,
0.393151, 0.8144799, -0.7584067, 1, 0, 0, 1, 1,
0.3932306, 0.09093356, -0.1516317, 1, 0, 0, 1, 1,
0.3940852, 0.5347908, -0.7447066, 0, 0, 0, 1, 1,
0.3963431, 3.312096, 1.934141, 0, 0, 0, 1, 1,
0.3975772, -0.9204445, 2.475042, 0, 0, 0, 1, 1,
0.399045, 0.09894741, 1.970083, 0, 0, 0, 1, 1,
0.4018058, 1.514591, 0.8547163, 0, 0, 0, 1, 1,
0.4018463, -1.714809, 3.547763, 0, 0, 0, 1, 1,
0.4032989, 0.6868286, 1.975917, 0, 0, 0, 1, 1,
0.405096, -1.448173, 1.773609, 1, 1, 1, 1, 1,
0.4063738, -0.698037, 1.875518, 1, 1, 1, 1, 1,
0.4082281, 0.9949112, 1.310519, 1, 1, 1, 1, 1,
0.4100604, 0.6561744, -0.1817811, 1, 1, 1, 1, 1,
0.4127628, 1.36487, 1.460007, 1, 1, 1, 1, 1,
0.4156242, -0.4955494, 2.619513, 1, 1, 1, 1, 1,
0.4162985, 1.017707, -0.2838822, 1, 1, 1, 1, 1,
0.4166642, -2.275225, 4.996723, 1, 1, 1, 1, 1,
0.4183872, 0.1840402, 1.932337, 1, 1, 1, 1, 1,
0.4253828, 0.1990087, 0.6318762, 1, 1, 1, 1, 1,
0.4257779, 0.8202429, 0.1118069, 1, 1, 1, 1, 1,
0.4312609, 1.348854, 0.9508369, 1, 1, 1, 1, 1,
0.4321753, -0.2145579, 3.196306, 1, 1, 1, 1, 1,
0.4346, -0.3926117, 0.3161882, 1, 1, 1, 1, 1,
0.4354255, -0.7255683, 1.670233, 1, 1, 1, 1, 1,
0.4358581, -1.641698, 2.145099, 0, 0, 1, 1, 1,
0.4381273, 0.339665, 0.3011829, 1, 0, 0, 1, 1,
0.4417607, -0.3682981, 2.97601, 1, 0, 0, 1, 1,
0.4464523, 0.03388219, 2.847229, 1, 0, 0, 1, 1,
0.4485995, -0.8969601, 3.792168, 1, 0, 0, 1, 1,
0.4492746, -0.3290912, 2.111418, 1, 0, 0, 1, 1,
0.4574273, 0.08674866, 1.156844, 0, 0, 0, 1, 1,
0.4630559, -1.309375, 1.94141, 0, 0, 0, 1, 1,
0.4714223, -1.802912, 3.650459, 0, 0, 0, 1, 1,
0.473924, -1.653527, 3.25968, 0, 0, 0, 1, 1,
0.4751697, 1.069244, -1.153503, 0, 0, 0, 1, 1,
0.4783386, -0.5471526, 2.321079, 0, 0, 0, 1, 1,
0.4801209, 1.286641, 1.248126, 0, 0, 0, 1, 1,
0.4803334, 0.6942545, 1.977778, 1, 1, 1, 1, 1,
0.4812599, -0.6190457, 2.613959, 1, 1, 1, 1, 1,
0.4823391, 0.3535802, 2.297388, 1, 1, 1, 1, 1,
0.4857629, -0.09015148, 2.832731, 1, 1, 1, 1, 1,
0.4954598, 0.7357346, -1.808448, 1, 1, 1, 1, 1,
0.5015658, -0.3678087, 2.192373, 1, 1, 1, 1, 1,
0.5029362, 0.4399043, 2.22145, 1, 1, 1, 1, 1,
0.5159481, 0.4146411, 1.320547, 1, 1, 1, 1, 1,
0.518227, 0.769768, 0.08973356, 1, 1, 1, 1, 1,
0.5216226, -0.224332, 0.8208553, 1, 1, 1, 1, 1,
0.5274673, 0.1109095, 1.685641, 1, 1, 1, 1, 1,
0.5308126, -1.759934, 2.673725, 1, 1, 1, 1, 1,
0.5333155, 1.970308, 0.8440349, 1, 1, 1, 1, 1,
0.5335149, -1.155036, 2.859577, 1, 1, 1, 1, 1,
0.534385, 0.3895127, 2.173372, 1, 1, 1, 1, 1,
0.5395067, 0.641791, 0.8084429, 0, 0, 1, 1, 1,
0.5417473, -1.672384, 2.5038, 1, 0, 0, 1, 1,
0.543049, 0.08983173, 1.189797, 1, 0, 0, 1, 1,
0.5525074, -1.85991, 1.430701, 1, 0, 0, 1, 1,
0.5525592, 1.853153, 0.1411576, 1, 0, 0, 1, 1,
0.5534714, -0.2526334, 1.258634, 1, 0, 0, 1, 1,
0.5571142, 0.3270093, -0.0116285, 0, 0, 0, 1, 1,
0.5581311, -1.126191, 1.55348, 0, 0, 0, 1, 1,
0.559868, -0.1626683, 1.843203, 0, 0, 0, 1, 1,
0.5683139, 1.686205, -1.749172, 0, 0, 0, 1, 1,
0.5806091, -0.3463039, 1.839943, 0, 0, 0, 1, 1,
0.5838678, -0.8352096, 1.401731, 0, 0, 0, 1, 1,
0.5912336, 0.9750482, 0.6967651, 0, 0, 0, 1, 1,
0.5926129, -0.5381677, 0.8739586, 1, 1, 1, 1, 1,
0.5942523, 2.785942, 0.2522208, 1, 1, 1, 1, 1,
0.595295, -0.1862244, 0.623458, 1, 1, 1, 1, 1,
0.5960248, 0.4033476, -0.1563197, 1, 1, 1, 1, 1,
0.6043775, 2.5186, -0.0166245, 1, 1, 1, 1, 1,
0.6059008, 0.07943375, -0.7773377, 1, 1, 1, 1, 1,
0.6064075, -1.762389, 4.069317, 1, 1, 1, 1, 1,
0.6104985, 0.9050248, 2.526926, 1, 1, 1, 1, 1,
0.6218585, 0.2905919, 1.13574, 1, 1, 1, 1, 1,
0.6219482, -0.2607713, 0.880827, 1, 1, 1, 1, 1,
0.6267622, 0.3013648, 0.9266042, 1, 1, 1, 1, 1,
0.6277491, 2.087511, -0.6467846, 1, 1, 1, 1, 1,
0.63224, 0.5166723, 0.1510626, 1, 1, 1, 1, 1,
0.6352599, -0.721526, 0.9089065, 1, 1, 1, 1, 1,
0.6405412, 0.7443382, -1.758024, 1, 1, 1, 1, 1,
0.6421242, 0.04093524, 0.3303436, 0, 0, 1, 1, 1,
0.6468379, -0.2040104, 1.252328, 1, 0, 0, 1, 1,
0.6512278, -1.247935, 3.119719, 1, 0, 0, 1, 1,
0.6514022, 1.631539, 1.498886, 1, 0, 0, 1, 1,
0.65854, 0.4296627, 1.019355, 1, 0, 0, 1, 1,
0.6596084, -0.5709848, 1.469327, 1, 0, 0, 1, 1,
0.6653949, -0.9475687, 2.032754, 0, 0, 0, 1, 1,
0.6660483, 0.5175127, 1.198722, 0, 0, 0, 1, 1,
0.6698022, -1.598568, 5.63669, 0, 0, 0, 1, 1,
0.6751655, 0.5098218, 0.08514253, 0, 0, 0, 1, 1,
0.6802881, -0.1777441, 2.2243, 0, 0, 0, 1, 1,
0.6866288, 0.3185689, -0.2358363, 0, 0, 0, 1, 1,
0.6868899, 1.790267, -0.9418328, 0, 0, 0, 1, 1,
0.6875303, -1.71585, 3.102688, 1, 1, 1, 1, 1,
0.6988236, -0.4497042, 1.407142, 1, 1, 1, 1, 1,
0.6993375, -1.205178, 2.390563, 1, 1, 1, 1, 1,
0.7029278, 0.9060887, 0.4686207, 1, 1, 1, 1, 1,
0.7039489, 1.95996, -0.1481591, 1, 1, 1, 1, 1,
0.7049158, 0.4398263, 0.222278, 1, 1, 1, 1, 1,
0.7119381, 1.988153, -0.02392424, 1, 1, 1, 1, 1,
0.7142175, -0.1003245, -0.710878, 1, 1, 1, 1, 1,
0.7152863, -1.636561, 2.3923, 1, 1, 1, 1, 1,
0.7175269, -0.2971655, 1.962027, 1, 1, 1, 1, 1,
0.7185734, 0.7930923, -0.598368, 1, 1, 1, 1, 1,
0.724232, 1.405835, -1.190703, 1, 1, 1, 1, 1,
0.7244708, 1.666399, 1.726536, 1, 1, 1, 1, 1,
0.7322947, 1.442707, -1.984902, 1, 1, 1, 1, 1,
0.7408822, -1.676111, 3.164943, 1, 1, 1, 1, 1,
0.7461691, -0.05282488, 0.2250851, 0, 0, 1, 1, 1,
0.7463727, 0.6946872, 2.689248, 1, 0, 0, 1, 1,
0.7497926, 0.3219991, 0.3308696, 1, 0, 0, 1, 1,
0.7623709, -0.1348271, 1.026016, 1, 0, 0, 1, 1,
0.7664737, 0.4417877, 1.789173, 1, 0, 0, 1, 1,
0.7670541, -0.7641354, 1.769578, 1, 0, 0, 1, 1,
0.767376, -0.5463123, 2.871423, 0, 0, 0, 1, 1,
0.7703065, -0.4440384, 1.997114, 0, 0, 0, 1, 1,
0.7721328, -0.8164352, 1.950208, 0, 0, 0, 1, 1,
0.77283, 0.2575315, -0.8797933, 0, 0, 0, 1, 1,
0.7749211, 0.1328129, 2.261024, 0, 0, 0, 1, 1,
0.7811261, -0.3985895, 2.010253, 0, 0, 0, 1, 1,
0.7827999, -0.04346476, 1.689801, 0, 0, 0, 1, 1,
0.7839048, -0.7393001, 0.7315026, 1, 1, 1, 1, 1,
0.7884043, -0.01004274, 0.4936768, 1, 1, 1, 1, 1,
0.7889195, 0.01230537, 2.517015, 1, 1, 1, 1, 1,
0.7968276, 1.185545, 0.467445, 1, 1, 1, 1, 1,
0.7997737, -1.252505, 2.962458, 1, 1, 1, 1, 1,
0.8099305, -0.05307356, 1.849913, 1, 1, 1, 1, 1,
0.8106313, -0.3783821, 0.4656572, 1, 1, 1, 1, 1,
0.8114793, 0.1363256, 0.6163439, 1, 1, 1, 1, 1,
0.8117654, -0.7900811, 1.067541, 1, 1, 1, 1, 1,
0.8131154, 0.3279387, 1.247414, 1, 1, 1, 1, 1,
0.8235772, -0.6950377, 1.24898, 1, 1, 1, 1, 1,
0.8245983, 0.5149546, 0.5237794, 1, 1, 1, 1, 1,
0.8252124, 0.9623643, 3.040268, 1, 1, 1, 1, 1,
0.8301226, 0.7218964, 2.142612, 1, 1, 1, 1, 1,
0.8313711, -0.01683592, 2.034109, 1, 1, 1, 1, 1,
0.8335479, 1.906428, 0.9383087, 0, 0, 1, 1, 1,
0.8349873, -0.8080136, 2.589555, 1, 0, 0, 1, 1,
0.8411468, -0.6755974, 4.484247, 1, 0, 0, 1, 1,
0.8424022, 0.3010911, 1.505607, 1, 0, 0, 1, 1,
0.8459593, -0.1896799, 1.987595, 1, 0, 0, 1, 1,
0.848, -0.695655, 3.587739, 1, 0, 0, 1, 1,
0.8566912, 0.6631491, 1.529196, 0, 0, 0, 1, 1,
0.8597504, 1.116123, 3.018982, 0, 0, 0, 1, 1,
0.8643817, -0.514485, 1.809717, 0, 0, 0, 1, 1,
0.8652415, -0.1700296, 1.705466, 0, 0, 0, 1, 1,
0.8654252, -0.7505971, 2.165975, 0, 0, 0, 1, 1,
0.8715104, -0.08717734, 0.6593339, 0, 0, 0, 1, 1,
0.8734862, 0.2620648, 3.218371, 0, 0, 0, 1, 1,
0.8748333, 0.3851799, 0.8333198, 1, 1, 1, 1, 1,
0.8770671, -0.2948138, 2.170085, 1, 1, 1, 1, 1,
0.8774598, -2.093347, 3.760951, 1, 1, 1, 1, 1,
0.8776965, -0.7152486, 1.774208, 1, 1, 1, 1, 1,
0.8781505, -1.025343, 3.03578, 1, 1, 1, 1, 1,
0.8784637, 1.401127, 2.371883, 1, 1, 1, 1, 1,
0.8800194, -1.344485, 2.229303, 1, 1, 1, 1, 1,
0.8833297, -0.2350194, 0.01055089, 1, 1, 1, 1, 1,
0.885989, 0.8893949, 1.229051, 1, 1, 1, 1, 1,
0.8909007, -1.123073, 3.739589, 1, 1, 1, 1, 1,
0.8934259, -0.8468608, 5.006265, 1, 1, 1, 1, 1,
0.8936463, 0.7289904, -0.3878982, 1, 1, 1, 1, 1,
0.8982763, 0.838935, 1.377096, 1, 1, 1, 1, 1,
0.8988839, -1.729907, 2.105676, 1, 1, 1, 1, 1,
0.8994299, 0.4482425, 2.335238, 1, 1, 1, 1, 1,
0.9035206, 0.2602269, 2.113133, 0, 0, 1, 1, 1,
0.9044989, -1.094111, 1.354011, 1, 0, 0, 1, 1,
0.9058014, -2.043157, 4.483588, 1, 0, 0, 1, 1,
0.9083626, 0.8023109, -1.002022, 1, 0, 0, 1, 1,
0.9084768, -0.2299571, 1.911225, 1, 0, 0, 1, 1,
0.909219, 0.3400084, 1.557938, 1, 0, 0, 1, 1,
0.9206531, -0.2116611, 1.228546, 0, 0, 0, 1, 1,
0.9227236, 0.09447404, 2.232211, 0, 0, 0, 1, 1,
0.9357467, -0.1170297, 1.944697, 0, 0, 0, 1, 1,
0.9445562, -0.5012446, 2.038526, 0, 0, 0, 1, 1,
0.9475087, 0.4413361, 1.052705, 0, 0, 0, 1, 1,
0.9503374, -1.865191, 3.347393, 0, 0, 0, 1, 1,
0.9506658, -1.39728, 2.024333, 0, 0, 0, 1, 1,
0.9544397, 0.2532646, 2.603866, 1, 1, 1, 1, 1,
0.9546281, -0.5836809, 2.741817, 1, 1, 1, 1, 1,
0.9559405, -1.530356, 3.792592, 1, 1, 1, 1, 1,
0.960649, 0.9130688, 2.074825, 1, 1, 1, 1, 1,
0.964309, 0.4580799, -0.01886199, 1, 1, 1, 1, 1,
0.9689156, -0.6011397, 2.698757, 1, 1, 1, 1, 1,
0.9707974, -0.1695409, 3.096177, 1, 1, 1, 1, 1,
0.971045, -0.2948076, 1.655192, 1, 1, 1, 1, 1,
0.974219, 1.429936, 1.090737, 1, 1, 1, 1, 1,
0.9761426, 1.115222, -0.1215096, 1, 1, 1, 1, 1,
0.9801626, 0.7935696, 0.4987774, 1, 1, 1, 1, 1,
0.9806818, -1.434228, 2.78413, 1, 1, 1, 1, 1,
0.9841761, 0.01142954, 1.646311, 1, 1, 1, 1, 1,
0.990957, 0.03591936, 1.512398, 1, 1, 1, 1, 1,
0.9942582, 0.7408406, -0.1582807, 1, 1, 1, 1, 1,
0.9956766, 0.01684142, 1.575608, 0, 0, 1, 1, 1,
0.9992878, 1.327861, 0.1852688, 1, 0, 0, 1, 1,
1.001323, 0.593604, 0.5993403, 1, 0, 0, 1, 1,
1.003533, 0.4213692, 1.315786, 1, 0, 0, 1, 1,
1.007058, -0.4202568, 1.608341, 1, 0, 0, 1, 1,
1.012365, -1.341481, 3.180685, 1, 0, 0, 1, 1,
1.015588, -1.506447, 1.117614, 0, 0, 0, 1, 1,
1.022454, -0.7152519, 3.644751, 0, 0, 0, 1, 1,
1.02967, -0.5229509, 0.9999667, 0, 0, 0, 1, 1,
1.050864, -0.05085598, 0.6209109, 0, 0, 0, 1, 1,
1.05406, -1.457655, 2.852139, 0, 0, 0, 1, 1,
1.058576, 0.8061351, 0.4937468, 0, 0, 0, 1, 1,
1.058913, -0.2464691, 0.483686, 0, 0, 0, 1, 1,
1.059201, -1.16897, 2.273484, 1, 1, 1, 1, 1,
1.069771, 1.364273, 3.046093, 1, 1, 1, 1, 1,
1.07016, -0.1843368, 4.145426, 1, 1, 1, 1, 1,
1.071101, 2.283552, 0.4534476, 1, 1, 1, 1, 1,
1.077103, 0.2329836, 1.529316, 1, 1, 1, 1, 1,
1.079452, 0.1785907, 2.375478, 1, 1, 1, 1, 1,
1.0816, -1.719247, 2.587746, 1, 1, 1, 1, 1,
1.081812, -0.09662687, 1.336179, 1, 1, 1, 1, 1,
1.094286, 0.2729917, 0.8768284, 1, 1, 1, 1, 1,
1.104269, 1.509945, -0.1751928, 1, 1, 1, 1, 1,
1.104305, 0.3927724, 0.8712237, 1, 1, 1, 1, 1,
1.108335, 1.173681, 0.03230164, 1, 1, 1, 1, 1,
1.11135, -0.8975143, 2.380244, 1, 1, 1, 1, 1,
1.111969, 2.533767, -0.3261665, 1, 1, 1, 1, 1,
1.123453, -0.1801015, 2.00598, 1, 1, 1, 1, 1,
1.127779, -0.6486878, 2.282498, 0, 0, 1, 1, 1,
1.128842, -0.321457, 1.741952, 1, 0, 0, 1, 1,
1.135296, -0.3708809, 1.458444, 1, 0, 0, 1, 1,
1.149495, 1.371267, 0.5999556, 1, 0, 0, 1, 1,
1.16271, 1.556625, -0.3218569, 1, 0, 0, 1, 1,
1.163824, 0.5955517, 2.152596, 1, 0, 0, 1, 1,
1.170025, -1.018701, 2.289708, 0, 0, 0, 1, 1,
1.172239, -0.1989164, 1.186761, 0, 0, 0, 1, 1,
1.181436, -0.7532417, -0.2352691, 0, 0, 0, 1, 1,
1.184821, -0.007597601, 0.8708557, 0, 0, 0, 1, 1,
1.18529, 1.689532, -0.4385267, 0, 0, 0, 1, 1,
1.198856, 0.4707367, 2.206149, 0, 0, 0, 1, 1,
1.200493, -0.1927901, 0.6486398, 0, 0, 0, 1, 1,
1.204211, 1.50945, 2.310117, 1, 1, 1, 1, 1,
1.221215, -0.7474599, 2.686431, 1, 1, 1, 1, 1,
1.222394, 2.232628, 2.046914, 1, 1, 1, 1, 1,
1.225471, 0.07060838, 1.984256, 1, 1, 1, 1, 1,
1.226841, 1.042034, 1.923176, 1, 1, 1, 1, 1,
1.226954, -0.8370474, 1.223877, 1, 1, 1, 1, 1,
1.233361, -0.008028969, 1.152936, 1, 1, 1, 1, 1,
1.236053, -0.327002, 2.005307, 1, 1, 1, 1, 1,
1.239963, -0.5629148, 3.225159, 1, 1, 1, 1, 1,
1.244, 1.616181, 1.063894, 1, 1, 1, 1, 1,
1.258945, 0.4563184, 0.0208217, 1, 1, 1, 1, 1,
1.260266, 2.019848, 1.886785, 1, 1, 1, 1, 1,
1.263767, -0.07788815, 2.417193, 1, 1, 1, 1, 1,
1.264352, 0.5470855, 1.770189, 1, 1, 1, 1, 1,
1.267016, -1.355743, 1.866908, 1, 1, 1, 1, 1,
1.271134, -0.04516312, 1.484468, 0, 0, 1, 1, 1,
1.275688, -0.04956531, 2.286608, 1, 0, 0, 1, 1,
1.276106, -1.327057, 0.6337147, 1, 0, 0, 1, 1,
1.280899, 1.056634, -0.1608428, 1, 0, 0, 1, 1,
1.301514, 0.460486, 0.8325418, 1, 0, 0, 1, 1,
1.315204, -1.126865, 3.754647, 1, 0, 0, 1, 1,
1.318099, 1.234001, 0.6216867, 0, 0, 0, 1, 1,
1.319066, 1.469864, 0.2876967, 0, 0, 0, 1, 1,
1.319565, 0.1459062, 1.476401, 0, 0, 0, 1, 1,
1.343898, 0.06472553, 3.331151, 0, 0, 0, 1, 1,
1.352977, -0.5261674, 1.437474, 0, 0, 0, 1, 1,
1.358448, -1.746796, 4.144241, 0, 0, 0, 1, 1,
1.364296, -1.776674, 3.097532, 0, 0, 0, 1, 1,
1.365132, -0.4515333, 2.707097, 1, 1, 1, 1, 1,
1.378785, 1.560905, 0.4182006, 1, 1, 1, 1, 1,
1.388312, -0.05717479, 2.705378, 1, 1, 1, 1, 1,
1.389228, 0.7913944, 0.4937823, 1, 1, 1, 1, 1,
1.395146, 1.10024, 1.173059, 1, 1, 1, 1, 1,
1.39627, -0.4914837, 1.797005, 1, 1, 1, 1, 1,
1.401468, -0.1578757, 0.9214313, 1, 1, 1, 1, 1,
1.408071, 0.2527014, 1.644318, 1, 1, 1, 1, 1,
1.409426, -1.277907, 2.671195, 1, 1, 1, 1, 1,
1.419836, 1.42901, 0.3202451, 1, 1, 1, 1, 1,
1.423398, 0.4468256, 1.195414, 1, 1, 1, 1, 1,
1.431333, -1.308461, 3.355205, 1, 1, 1, 1, 1,
1.434548, 0.0926369, 1.636023, 1, 1, 1, 1, 1,
1.441643, 1.370657, 1.727025, 1, 1, 1, 1, 1,
1.445664, 0.006814231, 0.752291, 1, 1, 1, 1, 1,
1.451036, -1.217278, 2.490647, 0, 0, 1, 1, 1,
1.451733, 0.1348998, 0.2425902, 1, 0, 0, 1, 1,
1.458711, 0.4117587, 4.057981, 1, 0, 0, 1, 1,
1.459077, 0.3277197, 2.307398, 1, 0, 0, 1, 1,
1.469423, -0.01090004, -0.8535496, 1, 0, 0, 1, 1,
1.476503, 0.3962703, 1.638011, 1, 0, 0, 1, 1,
1.491676, 0.5342358, 1.471715, 0, 0, 0, 1, 1,
1.503045, -0.6961673, 1.483649, 0, 0, 0, 1, 1,
1.505116, 0.241542, 1.574799, 0, 0, 0, 1, 1,
1.51114, 0.5739735, 1.761462, 0, 0, 0, 1, 1,
1.535712, -0.5944465, 2.274108, 0, 0, 0, 1, 1,
1.543296, -1.328942, 2.389346, 0, 0, 0, 1, 1,
1.544323, -0.268647, 1.83525, 0, 0, 0, 1, 1,
1.561249, 0.5898548, 2.279366, 1, 1, 1, 1, 1,
1.563445, -0.607864, 1.886476, 1, 1, 1, 1, 1,
1.569424, -0.5249045, 3.071729, 1, 1, 1, 1, 1,
1.580005, 0.09299575, 2.758873, 1, 1, 1, 1, 1,
1.611721, 0.06290413, 1.513544, 1, 1, 1, 1, 1,
1.620788, -0.6190742, 0.9879973, 1, 1, 1, 1, 1,
1.629574, -0.4787432, 1.580086, 1, 1, 1, 1, 1,
1.639071, 0.06765375, 0.9912383, 1, 1, 1, 1, 1,
1.687065, 0.3303641, 0.5272137, 1, 1, 1, 1, 1,
1.734277, 0.08367749, 2.087989, 1, 1, 1, 1, 1,
1.743884, -1.091681, 1.617041, 1, 1, 1, 1, 1,
1.744417, 0.06725594, 1.790637, 1, 1, 1, 1, 1,
1.747802, 1.052744, 0.7236459, 1, 1, 1, 1, 1,
1.751234, 0.4100686, 2.200535, 1, 1, 1, 1, 1,
1.753449, 1.15704, 0.3791671, 1, 1, 1, 1, 1,
1.758691, -0.009141, 0.5216449, 0, 0, 1, 1, 1,
1.771711, -0.4893632, 1.021297, 1, 0, 0, 1, 1,
1.77868, -0.5717555, 2.794544, 1, 0, 0, 1, 1,
1.778686, 0.6460235, 1.056358, 1, 0, 0, 1, 1,
1.783053, -0.5821125, 2.809882, 1, 0, 0, 1, 1,
1.788337, -1.510231, 3.135145, 1, 0, 0, 1, 1,
1.789516, 1.448037, 1.656613, 0, 0, 0, 1, 1,
1.802853, 0.6579936, 1.052387, 0, 0, 0, 1, 1,
1.835476, -0.9668785, 2.579118, 0, 0, 0, 1, 1,
1.847389, 0.07322649, 2.736311, 0, 0, 0, 1, 1,
1.869354, 1.301511, 1.687777, 0, 0, 0, 1, 1,
1.882794, 1.010458, 1.591218, 0, 0, 0, 1, 1,
1.892163, -0.2011916, 2.152, 0, 0, 0, 1, 1,
1.953593, -0.2315002, -0.06222769, 1, 1, 1, 1, 1,
1.968685, 0.8282744, 2.350312, 1, 1, 1, 1, 1,
1.973516, 0.237626, 1.962573, 1, 1, 1, 1, 1,
2.003645, -1.238807, 1.943581, 1, 1, 1, 1, 1,
2.008533, 1.728307, 0.8407779, 1, 1, 1, 1, 1,
2.023517, 0.09497139, 0.69344, 1, 1, 1, 1, 1,
2.046531, 1.088707, 1.480443, 1, 1, 1, 1, 1,
2.054627, 1.182935, 1.670769, 1, 1, 1, 1, 1,
2.060886, -0.1687665, 2.640439, 1, 1, 1, 1, 1,
2.069402, 0.5101703, 3.279277, 1, 1, 1, 1, 1,
2.116357, -1.463603, 2.620518, 1, 1, 1, 1, 1,
2.124421, 0.7527395, -0.006468377, 1, 1, 1, 1, 1,
2.129463, 0.8152121, 1.251117, 1, 1, 1, 1, 1,
2.169172, -1.396614, 3.159118, 1, 1, 1, 1, 1,
2.18976, 0.8138182, 2.240321, 1, 1, 1, 1, 1,
2.21737, -0.04619867, 2.006388, 0, 0, 1, 1, 1,
2.221934, -0.7869536, 1.172404, 1, 0, 0, 1, 1,
2.229483, 2.198343, 0.1679408, 1, 0, 0, 1, 1,
2.231719, 0.4359283, 1.463309, 1, 0, 0, 1, 1,
2.23546, -0.9151984, 3.1438, 1, 0, 0, 1, 1,
2.237965, 1.551471, 1.306467, 1, 0, 0, 1, 1,
2.248908, -0.9674248, -0.2613088, 0, 0, 0, 1, 1,
2.258191, -2.207617, 2.322932, 0, 0, 0, 1, 1,
2.359812, -0.2827146, 1.927294, 0, 0, 0, 1, 1,
2.385839, 0.2246671, -0.121823, 0, 0, 0, 1, 1,
2.426011, -0.1451037, 2.225563, 0, 0, 0, 1, 1,
2.434846, 1.538941, 0.8075656, 0, 0, 0, 1, 1,
2.442047, 0.4518008, 1.650106, 0, 0, 0, 1, 1,
2.444595, -0.6038654, 1.550073, 1, 1, 1, 1, 1,
2.46778, -1.348858, 1.818184, 1, 1, 1, 1, 1,
2.545466, -1.220376, 1.87921, 1, 1, 1, 1, 1,
2.648422, -0.598617, 3.479891, 1, 1, 1, 1, 1,
2.724562, -0.1831723, 2.368397, 1, 1, 1, 1, 1,
2.91602, 0.9963831, 2.787675, 1, 1, 1, 1, 1,
3.276122, -0.09652602, 2.959563, 1, 1, 1, 1, 1
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
var radius = 9.938854;
var distance = 34.90981;
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
mvMatrix.translate( 0.02528262, 0.1023047, -0.1111667 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.90981);
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
