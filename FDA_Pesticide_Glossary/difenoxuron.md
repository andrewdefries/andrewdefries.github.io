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
-3.163292, -0.02541345, -1.82269, 1, 0, 0, 1,
-3.004296, 0.2384248, -0.4256292, 1, 0.007843138, 0, 1,
-2.8808, 1.27366, -1.075631, 1, 0.01176471, 0, 1,
-2.880547, -1.036168, -0.2469554, 1, 0.01960784, 0, 1,
-2.758561, -0.3885688, -0.487435, 1, 0.02352941, 0, 1,
-2.648551, -0.5909708, -2.180492, 1, 0.03137255, 0, 1,
-2.531961, 1.276991, -1.806611, 1, 0.03529412, 0, 1,
-2.420994, 0.7820792, -0.2416832, 1, 0.04313726, 0, 1,
-2.387745, -1.33407, -1.747144, 1, 0.04705882, 0, 1,
-2.373178, -1.717968, -0.795621, 1, 0.05490196, 0, 1,
-2.311772, -2.368645, -2.222415, 1, 0.05882353, 0, 1,
-2.199173, -1.440941, -2.556634, 1, 0.06666667, 0, 1,
-2.178597, 0.8607124, -2.25857, 1, 0.07058824, 0, 1,
-2.12904, -1.170241, -3.085056, 1, 0.07843138, 0, 1,
-2.080122, 0.2646955, -0.4056668, 1, 0.08235294, 0, 1,
-2.073097, -0.2470356, -1.880685, 1, 0.09019608, 0, 1,
-2.049426, 1.211956, 0.7940332, 1, 0.09411765, 0, 1,
-2.013505, 0.7666537, -0.4902554, 1, 0.1019608, 0, 1,
-2.002737, -1.221384, -1.984538, 1, 0.1098039, 0, 1,
-1.977028, -0.02880377, -2.841589, 1, 0.1137255, 0, 1,
-1.969618, 1.516597, -0.08885146, 1, 0.1215686, 0, 1,
-1.961734, -1.170711, -1.816091, 1, 0.1254902, 0, 1,
-1.946534, 0.2521864, -1.667981, 1, 0.1333333, 0, 1,
-1.94107, 0.03370905, -1.565287, 1, 0.1372549, 0, 1,
-1.92825, 0.7620266, 0.3192728, 1, 0.145098, 0, 1,
-1.924869, -0.06141696, -1.307989, 1, 0.1490196, 0, 1,
-1.917961, -1.750796, -2.855395, 1, 0.1568628, 0, 1,
-1.901647, -1.694931, -3.149911, 1, 0.1607843, 0, 1,
-1.897867, 0.8648399, -1.323128, 1, 0.1686275, 0, 1,
-1.895436, -0.5187152, -2.413046, 1, 0.172549, 0, 1,
-1.890269, -0.04651329, -0.2530094, 1, 0.1803922, 0, 1,
-1.889823, 1.042426, -2.224041, 1, 0.1843137, 0, 1,
-1.877675, 0.4629268, -2.066724, 1, 0.1921569, 0, 1,
-1.847281, 0.2391737, -1.151388, 1, 0.1960784, 0, 1,
-1.807056, 2.544275, -1.383332, 1, 0.2039216, 0, 1,
-1.804747, -0.9770446, -1.33405, 1, 0.2117647, 0, 1,
-1.786455, -1.242296, -3.226939, 1, 0.2156863, 0, 1,
-1.782035, -1.164999, -0.9766441, 1, 0.2235294, 0, 1,
-1.780757, -0.6764954, -2.30635, 1, 0.227451, 0, 1,
-1.758441, -0.5179791, -3.064402, 1, 0.2352941, 0, 1,
-1.754829, 0.544216, -2.413849, 1, 0.2392157, 0, 1,
-1.754725, 0.1850169, -0.9147711, 1, 0.2470588, 0, 1,
-1.744293, -0.1509188, -1.324267, 1, 0.2509804, 0, 1,
-1.72941, 1.249235, -1.454507, 1, 0.2588235, 0, 1,
-1.727094, 0.4953752, -1.450279, 1, 0.2627451, 0, 1,
-1.72363, -0.3303517, -0.948368, 1, 0.2705882, 0, 1,
-1.692542, 0.7753201, -1.413257, 1, 0.2745098, 0, 1,
-1.69148, -0.456596, -2.046025, 1, 0.282353, 0, 1,
-1.678051, -1.355794, -2.750478, 1, 0.2862745, 0, 1,
-1.672326, 0.8984662, 0.5452291, 1, 0.2941177, 0, 1,
-1.661713, -1.467805, 0.305868, 1, 0.3019608, 0, 1,
-1.659993, 0.9529115, -0.477172, 1, 0.3058824, 0, 1,
-1.659173, 0.9332998, -0.9151293, 1, 0.3137255, 0, 1,
-1.611171, -0.3129634, -2.92015, 1, 0.3176471, 0, 1,
-1.584575, 0.04181261, -0.4435419, 1, 0.3254902, 0, 1,
-1.582452, 0.4259727, -0.7738102, 1, 0.3294118, 0, 1,
-1.55749, -0.07704129, -2.188032, 1, 0.3372549, 0, 1,
-1.528802, -1.840492, -1.345782, 1, 0.3411765, 0, 1,
-1.525101, 0.1453766, -1.71875, 1, 0.3490196, 0, 1,
-1.485796, -0.609349, -3.931808, 1, 0.3529412, 0, 1,
-1.479683, 0.4706726, 0.5467077, 1, 0.3607843, 0, 1,
-1.47633, -0.3741905, -0.5187276, 1, 0.3647059, 0, 1,
-1.462197, -0.5190612, -1.934392, 1, 0.372549, 0, 1,
-1.461323, 0.3601251, -2.184568, 1, 0.3764706, 0, 1,
-1.459163, -1.638461, -2.367387, 1, 0.3843137, 0, 1,
-1.455511, 0.4798251, -0.07591101, 1, 0.3882353, 0, 1,
-1.453038, 0.1910188, -1.675064, 1, 0.3960784, 0, 1,
-1.448595, 1.161082, -0.6918658, 1, 0.4039216, 0, 1,
-1.443429, 2.112122, -0.3219882, 1, 0.4078431, 0, 1,
-1.438205, 2.671331, 0.996749, 1, 0.4156863, 0, 1,
-1.430082, -0.3818528, -0.2088709, 1, 0.4196078, 0, 1,
-1.416191, -1.415012, -2.754473, 1, 0.427451, 0, 1,
-1.395579, -1.752833, -2.948767, 1, 0.4313726, 0, 1,
-1.394449, -0.2924311, -1.054867, 1, 0.4392157, 0, 1,
-1.394019, -2.033274, -3.147402, 1, 0.4431373, 0, 1,
-1.387226, 0.7557124, -1.147925, 1, 0.4509804, 0, 1,
-1.384827, 0.424052, -0.1119262, 1, 0.454902, 0, 1,
-1.380413, 0.0002186124, -1.931718, 1, 0.4627451, 0, 1,
-1.374743, -0.2267837, -2.223851, 1, 0.4666667, 0, 1,
-1.373281, 0.1024943, -1.438732, 1, 0.4745098, 0, 1,
-1.368137, -0.2233394, -1.575456, 1, 0.4784314, 0, 1,
-1.356502, -1.666308, -3.302014, 1, 0.4862745, 0, 1,
-1.354512, -1.571608, -1.058044, 1, 0.4901961, 0, 1,
-1.35121, 1.102448, -1.283829, 1, 0.4980392, 0, 1,
-1.34106, 0.9370686, -0.2829638, 1, 0.5058824, 0, 1,
-1.323906, 0.5682182, -3.056022, 1, 0.509804, 0, 1,
-1.311365, 1.746479, -0.8581752, 1, 0.5176471, 0, 1,
-1.296303, -0.2897684, -0.6931694, 1, 0.5215687, 0, 1,
-1.296098, -0.9886258, -2.618344, 1, 0.5294118, 0, 1,
-1.28951, -0.8973526, -1.456285, 1, 0.5333334, 0, 1,
-1.288804, 1.758615, 2.367193, 1, 0.5411765, 0, 1,
-1.284891, -1.973378, -2.588106, 1, 0.5450981, 0, 1,
-1.276637, 1.01448, -0.03028314, 1, 0.5529412, 0, 1,
-1.268605, 0.134762, -2.398921, 1, 0.5568628, 0, 1,
-1.267058, 0.7366707, -0.9776279, 1, 0.5647059, 0, 1,
-1.264492, -0.03653401, -0.6984727, 1, 0.5686275, 0, 1,
-1.259439, 0.3129601, -4.260649, 1, 0.5764706, 0, 1,
-1.25439, -0.4394818, -1.04432, 1, 0.5803922, 0, 1,
-1.232531, 0.4963077, -0.7407588, 1, 0.5882353, 0, 1,
-1.224216, 0.473388, -1.53967, 1, 0.5921569, 0, 1,
-1.218531, 0.1316485, -1.820761, 1, 0.6, 0, 1,
-1.206706, 0.4212193, -0.1840684, 1, 0.6078432, 0, 1,
-1.204771, -0.01834188, -2.021746, 1, 0.6117647, 0, 1,
-1.196562, -0.06875955, -1.966607, 1, 0.6196079, 0, 1,
-1.1949, 1.491314, -2.555341, 1, 0.6235294, 0, 1,
-1.191253, -0.8898933, -3.137725, 1, 0.6313726, 0, 1,
-1.190759, 0.9510773, 1.279235, 1, 0.6352941, 0, 1,
-1.188844, 0.4795545, -1.394957, 1, 0.6431373, 0, 1,
-1.18607, -0.845111, -1.810341, 1, 0.6470588, 0, 1,
-1.18573, 0.4458773, -2.208, 1, 0.654902, 0, 1,
-1.182641, -0.0983996, -0.1542996, 1, 0.6588235, 0, 1,
-1.178404, -0.5708736, -1.237513, 1, 0.6666667, 0, 1,
-1.173817, -1.0813, -1.464382, 1, 0.6705883, 0, 1,
-1.166899, -1.72245, -1.072932, 1, 0.6784314, 0, 1,
-1.166703, 0.4127995, -1.753116, 1, 0.682353, 0, 1,
-1.165561, 0.1137663, -1.055791, 1, 0.6901961, 0, 1,
-1.165336, -1.338365, -4.238898, 1, 0.6941177, 0, 1,
-1.151795, -0.6749784, -2.478603, 1, 0.7019608, 0, 1,
-1.150838, -0.9682084, -4.080805, 1, 0.7098039, 0, 1,
-1.14669, 0.1104811, 0.2997005, 1, 0.7137255, 0, 1,
-1.143507, 0.2945577, -2.129661, 1, 0.7215686, 0, 1,
-1.134731, 0.3054723, -0.8435778, 1, 0.7254902, 0, 1,
-1.128133, 0.1823857, -1.161584, 1, 0.7333333, 0, 1,
-1.124612, 0.4488201, -1.267545, 1, 0.7372549, 0, 1,
-1.12352, 0.7061836, -0.1444985, 1, 0.7450981, 0, 1,
-1.11822, 0.9440606, -0.5119983, 1, 0.7490196, 0, 1,
-1.115575, 0.31579, -0.6440466, 1, 0.7568628, 0, 1,
-1.109864, 0.05160629, -1.190659, 1, 0.7607843, 0, 1,
-1.108014, -1.11566, -3.85907, 1, 0.7686275, 0, 1,
-1.104394, -0.471453, -3.523243, 1, 0.772549, 0, 1,
-1.100227, -0.6093217, -2.647441, 1, 0.7803922, 0, 1,
-1.098827, 1.362578, -1.457267, 1, 0.7843137, 0, 1,
-1.096635, 0.1041378, -2.286153, 1, 0.7921569, 0, 1,
-1.086369, -0.05797086, -2.168305, 1, 0.7960784, 0, 1,
-1.086046, -0.171397, -1.204673, 1, 0.8039216, 0, 1,
-1.08585, -0.03158737, -2.423819, 1, 0.8117647, 0, 1,
-1.085733, -0.0522773, -1.515154, 1, 0.8156863, 0, 1,
-1.083947, -0.4212374, 0.5684375, 1, 0.8235294, 0, 1,
-1.082228, -0.2449981, -0.8392248, 1, 0.827451, 0, 1,
-1.052482, 0.5390578, -0.7229028, 1, 0.8352941, 0, 1,
-1.04988, -1.280508, -2.500072, 1, 0.8392157, 0, 1,
-1.047954, 1.000868, -2.132125, 1, 0.8470588, 0, 1,
-1.04362, -0.482495, -0.470332, 1, 0.8509804, 0, 1,
-1.035772, 0.5972911, -0.7523392, 1, 0.8588235, 0, 1,
-1.014554, -0.077025, -0.6806221, 1, 0.8627451, 0, 1,
-1.012851, 0.3497859, -2.743666, 1, 0.8705882, 0, 1,
-1.008022, 1.303727, -1.952613, 1, 0.8745098, 0, 1,
-1.000148, 0.1137795, -0.968706, 1, 0.8823529, 0, 1,
-0.992524, 0.7707838, -1.495381, 1, 0.8862745, 0, 1,
-0.9821455, -0.06576035, -3.348086, 1, 0.8941177, 0, 1,
-0.9707496, -0.8915711, -1.071926, 1, 0.8980392, 0, 1,
-0.9652532, 1.679699, -0.5552707, 1, 0.9058824, 0, 1,
-0.962164, -0.129317, -2.265385, 1, 0.9137255, 0, 1,
-0.9612396, 0.01387311, 0.4655188, 1, 0.9176471, 0, 1,
-0.9521292, -0.7223105, -2.391057, 1, 0.9254902, 0, 1,
-0.9362222, -0.4959341, -3.935835, 1, 0.9294118, 0, 1,
-0.9350882, -0.008488238, -1.78788, 1, 0.9372549, 0, 1,
-0.9340654, -1.67444, -1.05557, 1, 0.9411765, 0, 1,
-0.9317002, 1.006627, -1.173521, 1, 0.9490196, 0, 1,
-0.9313203, -0.6012807, -1.280495, 1, 0.9529412, 0, 1,
-0.9308057, 0.8427333, -0.1668519, 1, 0.9607843, 0, 1,
-0.9267343, 1.808354, 1.992747, 1, 0.9647059, 0, 1,
-0.9226046, 0.4138443, 0.1697063, 1, 0.972549, 0, 1,
-0.9164346, 0.3172261, -0.7736878, 1, 0.9764706, 0, 1,
-0.9152475, -0.1122153, -2.387068, 1, 0.9843137, 0, 1,
-0.9123616, 0.1393569, -1.025929, 1, 0.9882353, 0, 1,
-0.9083686, -1.839645, -3.519375, 1, 0.9960784, 0, 1,
-0.9079747, -0.2632062, -0.5947408, 0.9960784, 1, 0, 1,
-0.9079486, -0.0252475, -1.757177, 0.9921569, 1, 0, 1,
-0.9064975, 1.443805, 0.1442879, 0.9843137, 1, 0, 1,
-0.9054794, -1.278977, -2.887847, 0.9803922, 1, 0, 1,
-0.9045668, 1.092185, 0.5240142, 0.972549, 1, 0, 1,
-0.9007891, 0.5957423, -1.330409, 0.9686275, 1, 0, 1,
-0.9000762, 0.5234684, -2.12456, 0.9607843, 1, 0, 1,
-0.8996758, 1.835006, -0.7317968, 0.9568627, 1, 0, 1,
-0.8895584, 0.5209758, -1.966506, 0.9490196, 1, 0, 1,
-0.8893011, 0.2202277, -0.3639988, 0.945098, 1, 0, 1,
-0.8878731, -0.6004107, -1.438404, 0.9372549, 1, 0, 1,
-0.8869187, -0.7748006, -1.378283, 0.9333333, 1, 0, 1,
-0.8813323, 1.302292, 0.1565266, 0.9254902, 1, 0, 1,
-0.8774148, -1.723391, -1.632319, 0.9215686, 1, 0, 1,
-0.864647, 2.318502, 0.04359801, 0.9137255, 1, 0, 1,
-0.8541346, -1.488254, -3.011516, 0.9098039, 1, 0, 1,
-0.8480316, 2.498931, 1.186666, 0.9019608, 1, 0, 1,
-0.8450189, -0.4410411, -0.1664539, 0.8941177, 1, 0, 1,
-0.8417742, 0.1255203, -1.044645, 0.8901961, 1, 0, 1,
-0.8385086, 0.05823885, -1.229053, 0.8823529, 1, 0, 1,
-0.8338837, 2.072102, -0.07335403, 0.8784314, 1, 0, 1,
-0.8318154, 0.7776554, -1.104354, 0.8705882, 1, 0, 1,
-0.8275441, 0.7788713, -1.953641, 0.8666667, 1, 0, 1,
-0.8273411, 0.07904501, -2.89927, 0.8588235, 1, 0, 1,
-0.8204985, -1.425154, -1.618366, 0.854902, 1, 0, 1,
-0.8107744, 0.1917072, -1.534269, 0.8470588, 1, 0, 1,
-0.8088768, 1.163191, 0.08253311, 0.8431373, 1, 0, 1,
-0.8087699, 0.07956462, -1.467296, 0.8352941, 1, 0, 1,
-0.8079712, -0.6127838, -0.3776142, 0.8313726, 1, 0, 1,
-0.8028105, -0.7476735, -2.993935, 0.8235294, 1, 0, 1,
-0.7846408, -0.7724248, -2.702816, 0.8196079, 1, 0, 1,
-0.7786834, -0.5971236, -0.9831568, 0.8117647, 1, 0, 1,
-0.7684014, 0.6823732, -2.984647, 0.8078431, 1, 0, 1,
-0.7633395, -0.3474833, -2.517069, 0.8, 1, 0, 1,
-0.7624545, -0.6881539, -2.590617, 0.7921569, 1, 0, 1,
-0.761265, -1.198241, -1.327818, 0.7882353, 1, 0, 1,
-0.7597466, -0.169331, -1.817401, 0.7803922, 1, 0, 1,
-0.75745, -0.7957877, -1.053314, 0.7764706, 1, 0, 1,
-0.7565758, -0.8502047, -3.743513, 0.7686275, 1, 0, 1,
-0.7483907, -0.7254315, -3.589666, 0.7647059, 1, 0, 1,
-0.748018, 1.756359, 1.239524, 0.7568628, 1, 0, 1,
-0.740643, -2.675672, -1.022681, 0.7529412, 1, 0, 1,
-0.7383044, -0.1149482, -0.4845158, 0.7450981, 1, 0, 1,
-0.7349378, 0.3046038, -1.003426, 0.7411765, 1, 0, 1,
-0.7344673, 0.09390496, -3.399077, 0.7333333, 1, 0, 1,
-0.731251, 2.087994, -0.1867848, 0.7294118, 1, 0, 1,
-0.7247229, -1.274457, -2.171775, 0.7215686, 1, 0, 1,
-0.7236512, 0.3164051, -2.383307, 0.7176471, 1, 0, 1,
-0.7214363, 1.287701, -1.591103, 0.7098039, 1, 0, 1,
-0.7201405, 0.4536095, -2.197745, 0.7058824, 1, 0, 1,
-0.7156209, -1.556993, -2.287003, 0.6980392, 1, 0, 1,
-0.7144446, 0.5640751, -2.003903, 0.6901961, 1, 0, 1,
-0.7115095, -0.1468174, -0.3618505, 0.6862745, 1, 0, 1,
-0.7085296, 0.1941116, -0.4530627, 0.6784314, 1, 0, 1,
-0.7063687, 0.1943023, -0.7983701, 0.6745098, 1, 0, 1,
-0.7026642, -0.4909027, -1.943453, 0.6666667, 1, 0, 1,
-0.7009529, -0.5862036, -3.725492, 0.6627451, 1, 0, 1,
-0.6973315, -0.09403957, -0.04244184, 0.654902, 1, 0, 1,
-0.6923662, 0.2166299, -1.422977, 0.6509804, 1, 0, 1,
-0.6914573, 0.0562897, -1.470196, 0.6431373, 1, 0, 1,
-0.69144, 0.3876493, -2.270011, 0.6392157, 1, 0, 1,
-0.6850445, 0.6573845, -1.207293, 0.6313726, 1, 0, 1,
-0.679052, 0.06852051, -1.158431, 0.627451, 1, 0, 1,
-0.6780668, 1.767546, -0.9064021, 0.6196079, 1, 0, 1,
-0.6769283, -0.9496298, -3.324314, 0.6156863, 1, 0, 1,
-0.6767938, -0.4833583, -1.353968, 0.6078432, 1, 0, 1,
-0.6763783, 0.3641055, -0.5752677, 0.6039216, 1, 0, 1,
-0.6697058, 0.9644967, -1.940214, 0.5960785, 1, 0, 1,
-0.6671193, -0.3678273, -1.775916, 0.5882353, 1, 0, 1,
-0.6668941, 0.2560967, -2.137304, 0.5843138, 1, 0, 1,
-0.6666099, -0.6097411, -1.821914, 0.5764706, 1, 0, 1,
-0.6637346, -0.2014411, -2.20432, 0.572549, 1, 0, 1,
-0.6628076, 1.385954, 0.7939138, 0.5647059, 1, 0, 1,
-0.6618884, 0.1411335, -0.07818425, 0.5607843, 1, 0, 1,
-0.6562136, 1.588646, -0.2335839, 0.5529412, 1, 0, 1,
-0.6529504, -0.6593393, -2.144219, 0.5490196, 1, 0, 1,
-0.6429248, 0.0650949, -2.335192, 0.5411765, 1, 0, 1,
-0.6412369, 1.516456, -1.860042, 0.5372549, 1, 0, 1,
-0.6396244, 0.6123708, -0.8590103, 0.5294118, 1, 0, 1,
-0.6352032, 0.007223389, -2.11982, 0.5254902, 1, 0, 1,
-0.6267903, -0.7159938, -2.785561, 0.5176471, 1, 0, 1,
-0.6186991, -1.47026, -1.361399, 0.5137255, 1, 0, 1,
-0.6181028, 0.2344578, 0.1217126, 0.5058824, 1, 0, 1,
-0.6155641, -0.2639442, -1.862226, 0.5019608, 1, 0, 1,
-0.6144906, -0.7723728, -3.061694, 0.4941176, 1, 0, 1,
-0.6019617, 0.3966092, -1.179482, 0.4862745, 1, 0, 1,
-0.595286, 1.100715, -1.140008, 0.4823529, 1, 0, 1,
-0.5946428, 0.2167203, -2.026149, 0.4745098, 1, 0, 1,
-0.5892761, 1.668444, 0.3187568, 0.4705882, 1, 0, 1,
-0.5880755, -1.085264, -2.479725, 0.4627451, 1, 0, 1,
-0.5846765, -0.9556122, -0.3463533, 0.4588235, 1, 0, 1,
-0.5789374, 0.3367415, -0.4520782, 0.4509804, 1, 0, 1,
-0.576185, 0.3074196, -1.281093, 0.4470588, 1, 0, 1,
-0.5760707, -0.4254806, -1.776726, 0.4392157, 1, 0, 1,
-0.5741659, -2.014819, -2.776267, 0.4352941, 1, 0, 1,
-0.5727022, 0.4970602, -0.2658965, 0.427451, 1, 0, 1,
-0.5715705, -0.04876443, -1.411958, 0.4235294, 1, 0, 1,
-0.5703784, 1.006344, -1.642406, 0.4156863, 1, 0, 1,
-0.5612774, -1.054237, -2.828329, 0.4117647, 1, 0, 1,
-0.5456939, -0.5205439, -4.100754, 0.4039216, 1, 0, 1,
-0.5442151, 1.193525, 1.156828, 0.3960784, 1, 0, 1,
-0.543859, 1.411895, -2.064682, 0.3921569, 1, 0, 1,
-0.5353997, -0.2065191, -2.401993, 0.3843137, 1, 0, 1,
-0.5347159, -1.378896, -1.455323, 0.3803922, 1, 0, 1,
-0.5323089, 1.199099, -0.8745134, 0.372549, 1, 0, 1,
-0.5311489, -0.1480766, -1.071709, 0.3686275, 1, 0, 1,
-0.5235811, 0.5255879, 0.5878932, 0.3607843, 1, 0, 1,
-0.5200202, 1.047585, 1.014216, 0.3568628, 1, 0, 1,
-0.516599, -1.921928, -2.973758, 0.3490196, 1, 0, 1,
-0.5165582, -0.4169856, -1.571972, 0.345098, 1, 0, 1,
-0.5163592, -0.9190624, -2.246129, 0.3372549, 1, 0, 1,
-0.5140619, 0.1160405, -2.051656, 0.3333333, 1, 0, 1,
-0.5120991, 1.093652, -0.7066761, 0.3254902, 1, 0, 1,
-0.5094983, -0.8334687, -0.01721099, 0.3215686, 1, 0, 1,
-0.5077692, -2.463836, -1.242166, 0.3137255, 1, 0, 1,
-0.5063283, 1.582437, -0.2855757, 0.3098039, 1, 0, 1,
-0.4966015, 0.5638677, -0.3913125, 0.3019608, 1, 0, 1,
-0.4963348, 0.02643144, -1.481132, 0.2941177, 1, 0, 1,
-0.4960532, 0.07882418, -0.2467724, 0.2901961, 1, 0, 1,
-0.4954052, -0.1615097, -2.703547, 0.282353, 1, 0, 1,
-0.4863816, -0.5706944, -2.106385, 0.2784314, 1, 0, 1,
-0.4752037, -0.01042399, -1.47701, 0.2705882, 1, 0, 1,
-0.4746894, 1.402165, 0.7439615, 0.2666667, 1, 0, 1,
-0.4742828, 1.68696, -0.4628437, 0.2588235, 1, 0, 1,
-0.4648796, -0.3157184, -5.799206, 0.254902, 1, 0, 1,
-0.4599087, 1.256905, 0.4028085, 0.2470588, 1, 0, 1,
-0.4572631, 0.267364, -1.28827, 0.2431373, 1, 0, 1,
-0.4555651, -0.4992011, -1.760347, 0.2352941, 1, 0, 1,
-0.4547376, 1.070699, -0.7180595, 0.2313726, 1, 0, 1,
-0.4517904, 0.2029362, -0.2424264, 0.2235294, 1, 0, 1,
-0.4506476, -0.5771992, -2.78496, 0.2196078, 1, 0, 1,
-0.44814, 1.165761, -1.795826, 0.2117647, 1, 0, 1,
-0.4454935, -0.116559, -2.246582, 0.2078431, 1, 0, 1,
-0.4452141, -1.2706, -3.793584, 0.2, 1, 0, 1,
-0.4445244, -0.2760749, -1.356324, 0.1921569, 1, 0, 1,
-0.4401697, -0.05699025, -0.9516141, 0.1882353, 1, 0, 1,
-0.4382921, 1.889732, 0.5977399, 0.1803922, 1, 0, 1,
-0.4371046, 0.150564, -0.9301308, 0.1764706, 1, 0, 1,
-0.4316478, -0.8707074, -4.933475, 0.1686275, 1, 0, 1,
-0.4311971, 1.384257, -0.928246, 0.1647059, 1, 0, 1,
-0.4299778, 1.913196, -2.514802, 0.1568628, 1, 0, 1,
-0.4256004, -1.48731, -2.512731, 0.1529412, 1, 0, 1,
-0.422103, 0.8393293, -1.560991, 0.145098, 1, 0, 1,
-0.4209641, 0.1492856, -2.226011, 0.1411765, 1, 0, 1,
-0.4208727, 0.4241831, -0.8463342, 0.1333333, 1, 0, 1,
-0.419647, -1.874311, -1.950993, 0.1294118, 1, 0, 1,
-0.4150515, 1.218321, 0.7476422, 0.1215686, 1, 0, 1,
-0.4138329, 0.6147878, -0.1640337, 0.1176471, 1, 0, 1,
-0.413187, 1.060804, 0.007325334, 0.1098039, 1, 0, 1,
-0.412563, -3.003942, -4.745853, 0.1058824, 1, 0, 1,
-0.4091524, -1.506036, -2.458688, 0.09803922, 1, 0, 1,
-0.4089193, -0.04268051, -0.606617, 0.09019608, 1, 0, 1,
-0.4051974, -1.654417, -3.467081, 0.08627451, 1, 0, 1,
-0.4001453, 1.917374, -0.8844668, 0.07843138, 1, 0, 1,
-0.3984995, 0.02502993, -2.42393, 0.07450981, 1, 0, 1,
-0.3969421, -0.6283541, -2.665919, 0.06666667, 1, 0, 1,
-0.3948149, 0.03854101, -1.014853, 0.0627451, 1, 0, 1,
-0.3936522, 0.22986, -1.092027, 0.05490196, 1, 0, 1,
-0.3925019, -1.906603, -3.4751, 0.05098039, 1, 0, 1,
-0.3900094, 0.2644309, -1.016466, 0.04313726, 1, 0, 1,
-0.386986, -0.05268914, -0.8401418, 0.03921569, 1, 0, 1,
-0.3841839, 1.610506, 1.692569, 0.03137255, 1, 0, 1,
-0.3820069, 0.7905689, 0.3315709, 0.02745098, 1, 0, 1,
-0.377246, -1.501966, -2.759163, 0.01960784, 1, 0, 1,
-0.3713707, -0.003201252, -2.904752, 0.01568628, 1, 0, 1,
-0.3702742, -1.023373, -3.098667, 0.007843138, 1, 0, 1,
-0.3679136, -0.3945127, -2.718608, 0.003921569, 1, 0, 1,
-0.3658847, -0.7309024, -2.456109, 0, 1, 0.003921569, 1,
-0.3594498, -0.08694205, -4.428257, 0, 1, 0.01176471, 1,
-0.3592027, -1.914237, -1.881136, 0, 1, 0.01568628, 1,
-0.357999, 0.4478228, -2.276724, 0, 1, 0.02352941, 1,
-0.3512967, -1.861359, -3.059523, 0, 1, 0.02745098, 1,
-0.3498155, 0.9184046, 0.6179925, 0, 1, 0.03529412, 1,
-0.3479804, -0.4657594, -2.765336, 0, 1, 0.03921569, 1,
-0.3472308, 1.470747, -0.3877022, 0, 1, 0.04705882, 1,
-0.3412326, -1.010698, -3.907223, 0, 1, 0.05098039, 1,
-0.3383819, 1.409385, -1.107289, 0, 1, 0.05882353, 1,
-0.328955, -0.4007316, -3.967392, 0, 1, 0.0627451, 1,
-0.3247696, -0.1994178, -2.637669, 0, 1, 0.07058824, 1,
-0.3200389, 0.06183198, -0.1910058, 0, 1, 0.07450981, 1,
-0.3165875, -0.8681413, -2.399195, 0, 1, 0.08235294, 1,
-0.3151253, 0.5453573, -1.422117, 0, 1, 0.08627451, 1,
-0.3138934, 0.3024127, -0.4188893, 0, 1, 0.09411765, 1,
-0.3128698, -0.5298082, -2.579171, 0, 1, 0.1019608, 1,
-0.305379, 0.6445859, 0.3124153, 0, 1, 0.1058824, 1,
-0.3006594, 0.6907883, 1.21885, 0, 1, 0.1137255, 1,
-0.2987309, -0.1604883, -1.576433, 0, 1, 0.1176471, 1,
-0.2986712, -0.610926, -1.784669, 0, 1, 0.1254902, 1,
-0.2983443, 1.885777, 0.9298926, 0, 1, 0.1294118, 1,
-0.2976837, -1.479703, -4.128831, 0, 1, 0.1372549, 1,
-0.2958511, 0.4428307, -1.427588, 0, 1, 0.1411765, 1,
-0.2955651, 0.2282333, -2.641419, 0, 1, 0.1490196, 1,
-0.2947896, 0.867188, -0.1119646, 0, 1, 0.1529412, 1,
-0.2911304, -1.101535, -4.739119, 0, 1, 0.1607843, 1,
-0.290355, -1.344582, -1.554541, 0, 1, 0.1647059, 1,
-0.2885528, -0.1887794, -1.203482, 0, 1, 0.172549, 1,
-0.2841969, 0.03435201, -0.08990853, 0, 1, 0.1764706, 1,
-0.2816518, -1.167164, -2.26025, 0, 1, 0.1843137, 1,
-0.2736367, -1.762153, -2.857548, 0, 1, 0.1882353, 1,
-0.2734576, -1.908596, -4.370919, 0, 1, 0.1960784, 1,
-0.272078, 1.48544, 1.325893, 0, 1, 0.2039216, 1,
-0.2706575, 1.484818, 0.7459992, 0, 1, 0.2078431, 1,
-0.2667556, 0.04956898, -2.26722, 0, 1, 0.2156863, 1,
-0.2663151, 1.070024, -1.25423, 0, 1, 0.2196078, 1,
-0.2649398, -0.5353974, -3.460941, 0, 1, 0.227451, 1,
-0.2600855, -0.9738971, -2.835162, 0, 1, 0.2313726, 1,
-0.2529562, -0.9507152, -3.704275, 0, 1, 0.2392157, 1,
-0.2458905, -0.5306869, -2.591329, 0, 1, 0.2431373, 1,
-0.2397026, 0.1610144, -0.3282529, 0, 1, 0.2509804, 1,
-0.2382255, -0.3267557, -1.488975, 0, 1, 0.254902, 1,
-0.2370604, -1.205306, -2.039083, 0, 1, 0.2627451, 1,
-0.2359413, -0.9839809, -1.444555, 0, 1, 0.2666667, 1,
-0.2336802, 1.217712, 0.5618083, 0, 1, 0.2745098, 1,
-0.2320114, -0.6510932, -4.68146, 0, 1, 0.2784314, 1,
-0.2317408, 0.1664484, -3.759021, 0, 1, 0.2862745, 1,
-0.2307699, -0.285776, -2.507725, 0, 1, 0.2901961, 1,
-0.2266817, 0.5571081, -1.620566, 0, 1, 0.2980392, 1,
-0.225721, -0.5921224, -3.019437, 0, 1, 0.3058824, 1,
-0.2148006, -2.497718, -2.611376, 0, 1, 0.3098039, 1,
-0.2144392, 0.7779493, -0.5882878, 0, 1, 0.3176471, 1,
-0.2108503, -0.7518614, -2.63903, 0, 1, 0.3215686, 1,
-0.207807, -0.1454661, -3.073178, 0, 1, 0.3294118, 1,
-0.1995929, 0.5637061, 0.3160293, 0, 1, 0.3333333, 1,
-0.1992166, 2.232943, -0.0263932, 0, 1, 0.3411765, 1,
-0.1990047, 0.4300123, 0.1439562, 0, 1, 0.345098, 1,
-0.1965538, -0.2276429, -3.608557, 0, 1, 0.3529412, 1,
-0.1946456, -0.1938902, -1.022158, 0, 1, 0.3568628, 1,
-0.1916767, 0.6629634, 0.6968201, 0, 1, 0.3647059, 1,
-0.1904626, -0.1980343, -4.805881, 0, 1, 0.3686275, 1,
-0.1892119, 0.06113351, -1.604577, 0, 1, 0.3764706, 1,
-0.1819777, 2.249178, 0.5749838, 0, 1, 0.3803922, 1,
-0.1815571, 2.008831, 0.07495163, 0, 1, 0.3882353, 1,
-0.1812318, 0.1308801, -0.501911, 0, 1, 0.3921569, 1,
-0.1788888, 1.698015, -1.11552, 0, 1, 0.4, 1,
-0.1782713, -1.349827, -2.268864, 0, 1, 0.4078431, 1,
-0.1774961, 0.2369758, -0.9059361, 0, 1, 0.4117647, 1,
-0.1757448, 1.014541, 1.2828, 0, 1, 0.4196078, 1,
-0.174731, -0.6890711, -2.257026, 0, 1, 0.4235294, 1,
-0.1729562, -1.254043, -1.201078, 0, 1, 0.4313726, 1,
-0.1715694, 0.9726973, 0.4496242, 0, 1, 0.4352941, 1,
-0.1713924, -1.510183, -3.44928, 0, 1, 0.4431373, 1,
-0.1705361, -1.66226, -2.039926, 0, 1, 0.4470588, 1,
-0.1694711, -0.2427483, -3.615801, 0, 1, 0.454902, 1,
-0.1690542, -0.4694276, -2.533637, 0, 1, 0.4588235, 1,
-0.1688277, 0.6655005, 0.6030822, 0, 1, 0.4666667, 1,
-0.167055, -0.3513301, -3.194193, 0, 1, 0.4705882, 1,
-0.1670383, -2.276047, -4.183107, 0, 1, 0.4784314, 1,
-0.1659595, 0.734792, 0.6043383, 0, 1, 0.4823529, 1,
-0.1646118, 0.3904904, -0.1662837, 0, 1, 0.4901961, 1,
-0.163194, -1.391717, -1.715521, 0, 1, 0.4941176, 1,
-0.1624127, 0.1086691, -0.1782404, 0, 1, 0.5019608, 1,
-0.1578244, 0.8677827, -0.3564903, 0, 1, 0.509804, 1,
-0.151406, 0.8374882, 0.7508749, 0, 1, 0.5137255, 1,
-0.1487698, -0.1346568, -2.170214, 0, 1, 0.5215687, 1,
-0.1418204, -0.6990884, -2.024918, 0, 1, 0.5254902, 1,
-0.1412351, -0.7080309, -3.687561, 0, 1, 0.5333334, 1,
-0.1336898, -0.2694194, -2.677601, 0, 1, 0.5372549, 1,
-0.1295321, 0.08052395, 0.1927311, 0, 1, 0.5450981, 1,
-0.1276595, 0.7300304, 0.05773754, 0, 1, 0.5490196, 1,
-0.1267443, -1.806265, -2.616729, 0, 1, 0.5568628, 1,
-0.1264973, 1.231261, -1.410009, 0, 1, 0.5607843, 1,
-0.119439, 0.5128365, 1.461941, 0, 1, 0.5686275, 1,
-0.1163811, 0.5007498, -0.7763383, 0, 1, 0.572549, 1,
-0.1162334, 1.352102, -0.7509185, 0, 1, 0.5803922, 1,
-0.1111913, 0.5537879, -0.1419407, 0, 1, 0.5843138, 1,
-0.1097378, -0.8996226, -1.682055, 0, 1, 0.5921569, 1,
-0.10544, 0.1926527, 1.013768, 0, 1, 0.5960785, 1,
-0.1047694, -0.7328389, -2.538398, 0, 1, 0.6039216, 1,
-0.1023688, 1.279765, 0.3607973, 0, 1, 0.6117647, 1,
-0.09873721, -0.02776865, -1.405031, 0, 1, 0.6156863, 1,
-0.09355517, -0.7202178, -3.086189, 0, 1, 0.6235294, 1,
-0.0849322, -0.7762091, -2.844093, 0, 1, 0.627451, 1,
-0.08448398, 0.1498463, 0.5319206, 0, 1, 0.6352941, 1,
-0.08234147, 1.174332, -0.3201326, 0, 1, 0.6392157, 1,
-0.08145192, 0.4320473, 1.369469, 0, 1, 0.6470588, 1,
-0.08014215, 0.06261168, -2.388692, 0, 1, 0.6509804, 1,
-0.07589713, -0.2038254, -3.044801, 0, 1, 0.6588235, 1,
-0.07553495, 0.2439663, 0.07814015, 0, 1, 0.6627451, 1,
-0.07209376, 0.1822078, -0.9490159, 0, 1, 0.6705883, 1,
-0.07157595, 0.8507313, -1.671215, 0, 1, 0.6745098, 1,
-0.06754414, -0.5322469, -3.287333, 0, 1, 0.682353, 1,
-0.06699305, 0.3367824, -1.349761, 0, 1, 0.6862745, 1,
-0.06665186, -1.811701, -3.326973, 0, 1, 0.6941177, 1,
-0.06385858, -0.2509099, -1.826097, 0, 1, 0.7019608, 1,
-0.06343356, -1.260293, -3.238556, 0, 1, 0.7058824, 1,
-0.06249867, -1.408224, -3.464043, 0, 1, 0.7137255, 1,
-0.05979602, 1.23293, 0.3602663, 0, 1, 0.7176471, 1,
-0.05809706, -1.342175, -4.429828, 0, 1, 0.7254902, 1,
-0.05652202, -1.700335, -2.166924, 0, 1, 0.7294118, 1,
-0.05569595, 0.2292262, -1.443885, 0, 1, 0.7372549, 1,
-0.05344906, -0.603738, -2.729766, 0, 1, 0.7411765, 1,
-0.04945482, 0.4627458, -1.875464, 0, 1, 0.7490196, 1,
-0.04512222, 0.9007666, 1.528012, 0, 1, 0.7529412, 1,
-0.04461113, -0.007092143, -2.818204, 0, 1, 0.7607843, 1,
-0.0434614, 1.564788, -0.1640005, 0, 1, 0.7647059, 1,
-0.04191768, -0.6048653, -3.987825, 0, 1, 0.772549, 1,
-0.03475986, -0.2253372, -2.330613, 0, 1, 0.7764706, 1,
-0.03436887, 0.6588425, 0.5478485, 0, 1, 0.7843137, 1,
-0.03380616, 1.359905, 0.1777538, 0, 1, 0.7882353, 1,
-0.02841669, -0.3269272, -2.938919, 0, 1, 0.7960784, 1,
-0.02825695, 0.3045227, -0.9321986, 0, 1, 0.8039216, 1,
-0.02678866, 2.678131, 0.1846669, 0, 1, 0.8078431, 1,
-0.02349901, 0.7664173, -1.563847, 0, 1, 0.8156863, 1,
-0.02233569, -0.8420281, -3.40685, 0, 1, 0.8196079, 1,
-0.02158112, -0.7817413, -3.267862, 0, 1, 0.827451, 1,
-0.01488985, -0.5504881, -4.837421, 0, 1, 0.8313726, 1,
-0.01054741, -0.7629284, -4.19124, 0, 1, 0.8392157, 1,
-0.009185585, -1.077323, -4.394106, 0, 1, 0.8431373, 1,
-0.005748629, -1.663739, -4.007302, 0, 1, 0.8509804, 1,
-0.005661503, -1.300246, -3.058757, 0, 1, 0.854902, 1,
-0.003735388, -1.511855, -1.782266, 0, 1, 0.8627451, 1,
-0.001776222, 1.667012, 0.8593877, 0, 1, 0.8666667, 1,
0.0155044, -0.495159, 3.388602, 0, 1, 0.8745098, 1,
0.01813549, -0.929073, 4.314868, 0, 1, 0.8784314, 1,
0.01906392, -2.87317, 2.150618, 0, 1, 0.8862745, 1,
0.02636661, 0.7718644, 0.06421753, 0, 1, 0.8901961, 1,
0.02761131, 1.523535, 0.6709333, 0, 1, 0.8980392, 1,
0.03093054, 0.08726545, -0.4390421, 0, 1, 0.9058824, 1,
0.03359443, 1.992432, -0.3674174, 0, 1, 0.9098039, 1,
0.03520646, 1.018037, -1.458005, 0, 1, 0.9176471, 1,
0.04193458, 0.2932146, 0.8750109, 0, 1, 0.9215686, 1,
0.04367243, -0.443277, 2.878765, 0, 1, 0.9294118, 1,
0.04630767, 0.8442819, 0.4458393, 0, 1, 0.9333333, 1,
0.04881047, -0.5958081, 4.26669, 0, 1, 0.9411765, 1,
0.06294039, -1.250745, 1.643816, 0, 1, 0.945098, 1,
0.06511372, -2.405343, 2.37723, 0, 1, 0.9529412, 1,
0.06689364, 1.071652, 1.193804, 0, 1, 0.9568627, 1,
0.06793926, 1.750031, 0.3795241, 0, 1, 0.9647059, 1,
0.07059538, 0.5376099, -0.3699759, 0, 1, 0.9686275, 1,
0.07164714, -0.05749545, 1.98156, 0, 1, 0.9764706, 1,
0.07599171, 0.6229247, -0.7699942, 0, 1, 0.9803922, 1,
0.08212238, 0.1158356, 0.4707612, 0, 1, 0.9882353, 1,
0.08327505, -0.8617271, 3.005686, 0, 1, 0.9921569, 1,
0.08697278, -0.1620705, 2.636488, 0, 1, 1, 1,
0.08945072, -0.3743157, 1.446347, 0, 0.9921569, 1, 1,
0.09371307, 1.973811, 0.597979, 0, 0.9882353, 1, 1,
0.09422977, 0.8496063, -1.147076, 0, 0.9803922, 1, 1,
0.09728777, 0.09510213, 1.516166, 0, 0.9764706, 1, 1,
0.09756874, -0.9839002, 1.636994, 0, 0.9686275, 1, 1,
0.09992977, -0.08774509, 2.253737, 0, 0.9647059, 1, 1,
0.102748, 0.00128419, 0.4055073, 0, 0.9568627, 1, 1,
0.1040803, 0.3371379, 0.6644088, 0, 0.9529412, 1, 1,
0.1049463, 1.219267, -0.1954801, 0, 0.945098, 1, 1,
0.1062539, -1.268811, 2.683181, 0, 0.9411765, 1, 1,
0.1073319, 0.7988604, -1.839879, 0, 0.9333333, 1, 1,
0.1080323, -0.3900675, 1.481106, 0, 0.9294118, 1, 1,
0.1134217, -0.3583093, 3.580894, 0, 0.9215686, 1, 1,
0.1136115, -0.4554124, 3.175544, 0, 0.9176471, 1, 1,
0.1183367, -1.575004, 4.931837, 0, 0.9098039, 1, 1,
0.1185529, 1.067837, 0.4609362, 0, 0.9058824, 1, 1,
0.119505, 0.3320353, 0.7591595, 0, 0.8980392, 1, 1,
0.1206691, 0.1759644, 0.7021313, 0, 0.8901961, 1, 1,
0.1257538, 0.5422316, -0.1102958, 0, 0.8862745, 1, 1,
0.1275036, -1.437181, 2.362425, 0, 0.8784314, 1, 1,
0.1340071, -0.9854258, 2.518421, 0, 0.8745098, 1, 1,
0.1359176, -0.7612152, 2.333527, 0, 0.8666667, 1, 1,
0.1363863, 0.7406669, 0.9420368, 0, 0.8627451, 1, 1,
0.1370207, -1.323131, 2.833652, 0, 0.854902, 1, 1,
0.1380431, 1.132242, -1.103347, 0, 0.8509804, 1, 1,
0.1390826, -1.105437, 3.841617, 0, 0.8431373, 1, 1,
0.1462297, -0.851167, 2.657426, 0, 0.8392157, 1, 1,
0.1465821, 0.2056597, 2.113717, 0, 0.8313726, 1, 1,
0.1566035, -1.450908, 1.835923, 0, 0.827451, 1, 1,
0.1637763, 0.1955582, 1.490003, 0, 0.8196079, 1, 1,
0.1688832, 1.827796, 0.06833458, 0, 0.8156863, 1, 1,
0.1708621, 0.3933131, 0.7046596, 0, 0.8078431, 1, 1,
0.1738314, 0.5457078, 0.8024663, 0, 0.8039216, 1, 1,
0.1793737, 2.531365, 0.00220111, 0, 0.7960784, 1, 1,
0.1835312, 0.03464407, 1.381922, 0, 0.7882353, 1, 1,
0.1862166, 0.09150702, 1.273088, 0, 0.7843137, 1, 1,
0.189095, -0.9851026, 4.330811, 0, 0.7764706, 1, 1,
0.1899372, -0.1532388, 2.307084, 0, 0.772549, 1, 1,
0.1903553, 0.8550316, -0.003705496, 0, 0.7647059, 1, 1,
0.1915003, -0.5098612, 2.577846, 0, 0.7607843, 1, 1,
0.1927895, 0.7224459, 1.136168, 0, 0.7529412, 1, 1,
0.1954701, -2.323102, 2.372326, 0, 0.7490196, 1, 1,
0.197305, -0.564068, 3.178745, 0, 0.7411765, 1, 1,
0.198733, 0.02934211, 1.671456, 0, 0.7372549, 1, 1,
0.2019068, -1.247461, 4.495392, 0, 0.7294118, 1, 1,
0.2023543, -0.2596045, 0.6922526, 0, 0.7254902, 1, 1,
0.2036097, -1.20273, 3.175323, 0, 0.7176471, 1, 1,
0.2072907, -2.182016, 1.794077, 0, 0.7137255, 1, 1,
0.2115617, 0.6673723, -0.1557489, 0, 0.7058824, 1, 1,
0.2117775, 0.05382582, -0.2843927, 0, 0.6980392, 1, 1,
0.2124439, 0.4297952, 1.674747, 0, 0.6941177, 1, 1,
0.2133481, 0.6389812, 0.5460066, 0, 0.6862745, 1, 1,
0.2179181, -0.952505, 4.446656, 0, 0.682353, 1, 1,
0.2216455, 0.5324017, -0.7707304, 0, 0.6745098, 1, 1,
0.2243459, 0.4647249, 0.2772482, 0, 0.6705883, 1, 1,
0.2322064, -0.7988614, 3.438335, 0, 0.6627451, 1, 1,
0.2330711, 0.4611821, 0.5998331, 0, 0.6588235, 1, 1,
0.2382748, 0.9059117, 0.1693628, 0, 0.6509804, 1, 1,
0.2426377, -0.2599384, 2.230184, 0, 0.6470588, 1, 1,
0.2434906, -0.8045944, 2.392264, 0, 0.6392157, 1, 1,
0.2450374, 1.503869, -0.1742251, 0, 0.6352941, 1, 1,
0.2493435, 0.415974, 1.390976, 0, 0.627451, 1, 1,
0.2498479, -0.03853904, 1.999792, 0, 0.6235294, 1, 1,
0.2506805, -1.618613, 0.9928989, 0, 0.6156863, 1, 1,
0.2507219, -0.3551691, 3.977541, 0, 0.6117647, 1, 1,
0.2512755, 1.399882, -1.798951, 0, 0.6039216, 1, 1,
0.251475, -0.1744857, 1.236924, 0, 0.5960785, 1, 1,
0.25257, 0.4647245, 0.5485985, 0, 0.5921569, 1, 1,
0.2532383, -0.144992, 3.73335, 0, 0.5843138, 1, 1,
0.2534096, -0.3743894, 2.049602, 0, 0.5803922, 1, 1,
0.2534367, 0.1749736, 0.4191679, 0, 0.572549, 1, 1,
0.2541015, -0.1038554, 2.92532, 0, 0.5686275, 1, 1,
0.2544796, -0.4371374, 2.64874, 0, 0.5607843, 1, 1,
0.258681, 0.2881142, 1.109362, 0, 0.5568628, 1, 1,
0.2624135, -2.815435, 3.875085, 0, 0.5490196, 1, 1,
0.2643655, 0.2426869, 0.5596848, 0, 0.5450981, 1, 1,
0.2692116, -0.3759318, 2.614089, 0, 0.5372549, 1, 1,
0.275853, -1.353909, 3.121259, 0, 0.5333334, 1, 1,
0.277075, 0.02621514, 0.1515176, 0, 0.5254902, 1, 1,
0.2774023, 0.898747, -1.266177, 0, 0.5215687, 1, 1,
0.2834672, 1.350125, -0.3369092, 0, 0.5137255, 1, 1,
0.284309, -0.4662115, 2.819098, 0, 0.509804, 1, 1,
0.2909359, -1.144246, 1.890177, 0, 0.5019608, 1, 1,
0.2943647, 1.946262, 1.078892, 0, 0.4941176, 1, 1,
0.297558, -1.39414, 0.4114159, 0, 0.4901961, 1, 1,
0.3043743, 1.30545, 1.291594, 0, 0.4823529, 1, 1,
0.3044632, 1.942437, 0.04986999, 0, 0.4784314, 1, 1,
0.3070329, -0.01318236, 2.646891, 0, 0.4705882, 1, 1,
0.3109273, 0.05336403, 1.268835, 0, 0.4666667, 1, 1,
0.3136006, 1.790427, 0.3012431, 0, 0.4588235, 1, 1,
0.3201971, -0.9147174, 1.997386, 0, 0.454902, 1, 1,
0.3207627, -1.150242, 2.770405, 0, 0.4470588, 1, 1,
0.3240412, 0.1037818, 2.737023, 0, 0.4431373, 1, 1,
0.3254603, 0.9841489, 0.1069416, 0, 0.4352941, 1, 1,
0.3274331, -0.4901245, 2.526054, 0, 0.4313726, 1, 1,
0.3292444, -0.2532877, 2.580613, 0, 0.4235294, 1, 1,
0.3327385, 0.5754307, 0.6094847, 0, 0.4196078, 1, 1,
0.3355155, 0.041428, 3.908312, 0, 0.4117647, 1, 1,
0.3381599, 0.2113678, 0.5357358, 0, 0.4078431, 1, 1,
0.3403659, -0.07640817, 1.586625, 0, 0.4, 1, 1,
0.340743, -0.2611586, 1.887647, 0, 0.3921569, 1, 1,
0.3411, -2.588003, 3.467324, 0, 0.3882353, 1, 1,
0.3418929, -0.9640873, 2.533238, 0, 0.3803922, 1, 1,
0.3460596, 1.302488, 0.3189833, 0, 0.3764706, 1, 1,
0.3551443, -1.609804, 4.864455, 0, 0.3686275, 1, 1,
0.3579278, -0.1789133, 2.997842, 0, 0.3647059, 1, 1,
0.3592446, -0.5127026, 1.166054, 0, 0.3568628, 1, 1,
0.360462, -0.2065682, 3.277216, 0, 0.3529412, 1, 1,
0.3616093, 0.6681755, 0.403617, 0, 0.345098, 1, 1,
0.3621448, 0.8035594, 2.982754, 0, 0.3411765, 1, 1,
0.3678905, -1.676033, 3.430864, 0, 0.3333333, 1, 1,
0.368899, -0.6053774, 1.720409, 0, 0.3294118, 1, 1,
0.3697204, -0.3884453, 1.690785, 0, 0.3215686, 1, 1,
0.3702651, 0.5023437, 0.5377358, 0, 0.3176471, 1, 1,
0.3704708, 2.383885, -1.636217, 0, 0.3098039, 1, 1,
0.3713022, 0.6444137, -0.8996098, 0, 0.3058824, 1, 1,
0.3724905, 1.292175, 0.07442384, 0, 0.2980392, 1, 1,
0.3805368, 0.5969578, 1.78318, 0, 0.2901961, 1, 1,
0.3889328, -0.6858511, 1.685064, 0, 0.2862745, 1, 1,
0.3925716, -0.4519853, 2.725517, 0, 0.2784314, 1, 1,
0.3931146, 0.6234529, 0.3413042, 0, 0.2745098, 1, 1,
0.3952621, 1.733947, -0.5734924, 0, 0.2666667, 1, 1,
0.396928, -0.3878965, 3.625201, 0, 0.2627451, 1, 1,
0.3997848, 0.6707714, 1.001238, 0, 0.254902, 1, 1,
0.4018141, -2.310815, 2.581542, 0, 0.2509804, 1, 1,
0.4059612, -0.9658996, 3.693491, 0, 0.2431373, 1, 1,
0.4093301, 2.56996, -1.894568, 0, 0.2392157, 1, 1,
0.4139412, 1.074934, -1.416137, 0, 0.2313726, 1, 1,
0.4186981, -1.098812, 1.877439, 0, 0.227451, 1, 1,
0.4195276, 1.914809, -0.8527358, 0, 0.2196078, 1, 1,
0.4204353, 0.9826934, 0.3395917, 0, 0.2156863, 1, 1,
0.4204638, 0.3655443, 2.426888, 0, 0.2078431, 1, 1,
0.4219402, -0.3577116, 2.592884, 0, 0.2039216, 1, 1,
0.429821, 1.377967, 0.1734998, 0, 0.1960784, 1, 1,
0.4306372, 0.3719869, 0.527933, 0, 0.1882353, 1, 1,
0.4322203, 0.337876, 1.610555, 0, 0.1843137, 1, 1,
0.4372488, 0.4001303, 0.827, 0, 0.1764706, 1, 1,
0.4393924, -0.6798742, 3.181816, 0, 0.172549, 1, 1,
0.4416745, -1.402445, 3.611773, 0, 0.1647059, 1, 1,
0.4445866, 1.347332, 1.887367, 0, 0.1607843, 1, 1,
0.4451834, 0.9223691, -0.3904396, 0, 0.1529412, 1, 1,
0.4459993, 0.3019774, 1.382785, 0, 0.1490196, 1, 1,
0.4465256, -2.114133, 2.763624, 0, 0.1411765, 1, 1,
0.4481108, 0.3228551, 1.599097, 0, 0.1372549, 1, 1,
0.4496, -0.4068629, 3.518529, 0, 0.1294118, 1, 1,
0.4506629, 0.06592167, 1.553278, 0, 0.1254902, 1, 1,
0.4530239, -0.8672432, 1.464396, 0, 0.1176471, 1, 1,
0.4557067, -1.745477, 2.246456, 0, 0.1137255, 1, 1,
0.4603442, 0.3075876, 0.9044728, 0, 0.1058824, 1, 1,
0.4621364, 0.8000827, 1.594113, 0, 0.09803922, 1, 1,
0.4636634, 1.087651, -0.982318, 0, 0.09411765, 1, 1,
0.4636973, 0.3732554, 0.3488539, 0, 0.08627451, 1, 1,
0.466978, 0.4090725, 1.508476, 0, 0.08235294, 1, 1,
0.4715527, -0.4938087, 1.386509, 0, 0.07450981, 1, 1,
0.4728734, -0.6699391, 0.9206616, 0, 0.07058824, 1, 1,
0.4790731, 1.143886, -0.04413505, 0, 0.0627451, 1, 1,
0.4796786, -0.4310896, 2.694534, 0, 0.05882353, 1, 1,
0.4804588, -0.2145326, 1.51403, 0, 0.05098039, 1, 1,
0.4834383, 1.379105, -0.3398738, 0, 0.04705882, 1, 1,
0.4900392, 0.9456835, 0.5927771, 0, 0.03921569, 1, 1,
0.4921601, 0.9917933, -0.09444407, 0, 0.03529412, 1, 1,
0.494911, 0.5772358, -0.4662247, 0, 0.02745098, 1, 1,
0.5021592, -1.712347, 1.90535, 0, 0.02352941, 1, 1,
0.5127023, -0.1251231, 0.9122478, 0, 0.01568628, 1, 1,
0.5146631, 0.2434808, 1.902917, 0, 0.01176471, 1, 1,
0.5159354, -0.5498651, 2.918555, 0, 0.003921569, 1, 1,
0.5212966, 1.713926, 0.3967781, 0.003921569, 0, 1, 1,
0.5275548, -1.61757, 2.062974, 0.007843138, 0, 1, 1,
0.5279401, 0.4325616, 0.6359653, 0.01568628, 0, 1, 1,
0.5324607, -0.3103749, 1.130557, 0.01960784, 0, 1, 1,
0.5349247, -1.218891, 3.345362, 0.02745098, 0, 1, 1,
0.5371531, -0.8385263, 1.370379, 0.03137255, 0, 1, 1,
0.540936, 0.0492077, 1.624537, 0.03921569, 0, 1, 1,
0.5420626, 0.898803, 0.5562373, 0.04313726, 0, 1, 1,
0.5493103, 1.343225, -0.09881485, 0.05098039, 0, 1, 1,
0.5497542, -0.5895393, 2.618675, 0.05490196, 0, 1, 1,
0.5502642, -0.4859319, 2.893478, 0.0627451, 0, 1, 1,
0.5504352, 0.8186906, 2.736116, 0.06666667, 0, 1, 1,
0.5539598, 0.89082, 0.9114095, 0.07450981, 0, 1, 1,
0.5614071, 0.02249794, 0.3771254, 0.07843138, 0, 1, 1,
0.5623957, -0.3509485, 0.689391, 0.08627451, 0, 1, 1,
0.5626355, 0.6861924, 0.1051369, 0.09019608, 0, 1, 1,
0.5641216, -1.089763, 1.636371, 0.09803922, 0, 1, 1,
0.5644947, 0.3128722, -0.4045396, 0.1058824, 0, 1, 1,
0.5655601, -1.38952, 0.9996964, 0.1098039, 0, 1, 1,
0.5658571, 0.7680844, -0.8793266, 0.1176471, 0, 1, 1,
0.5663728, -0.4995353, 2.518721, 0.1215686, 0, 1, 1,
0.5709963, -0.8862996, 3.252702, 0.1294118, 0, 1, 1,
0.5754483, 0.06382491, 2.263739, 0.1333333, 0, 1, 1,
0.5767607, -0.5801649, 1.776458, 0.1411765, 0, 1, 1,
0.5774727, 2.07625, 0.3732162, 0.145098, 0, 1, 1,
0.5808412, 0.2985982, -0.7451198, 0.1529412, 0, 1, 1,
0.5908087, -0.1394281, 1.791759, 0.1568628, 0, 1, 1,
0.6019698, -0.9389994, 2.940481, 0.1647059, 0, 1, 1,
0.6020139, -0.5256744, 2.226964, 0.1686275, 0, 1, 1,
0.6034861, -0.9134816, 4.033459, 0.1764706, 0, 1, 1,
0.611275, 1.320371, 1.032014, 0.1803922, 0, 1, 1,
0.611325, 0.3337719, 0.7796184, 0.1882353, 0, 1, 1,
0.6120973, 0.5401582, 0.7121862, 0.1921569, 0, 1, 1,
0.6128887, -0.3942733, 3.410547, 0.2, 0, 1, 1,
0.6178815, -0.03037285, 2.166028, 0.2078431, 0, 1, 1,
0.6229756, -0.5024178, 3.022273, 0.2117647, 0, 1, 1,
0.6240163, -1.648109, 1.371809, 0.2196078, 0, 1, 1,
0.6246194, -1.136685, 0.7521077, 0.2235294, 0, 1, 1,
0.6302531, 0.2285018, -0.1713189, 0.2313726, 0, 1, 1,
0.6305234, -0.4199386, 1.512629, 0.2352941, 0, 1, 1,
0.6311244, -0.8856033, 2.891779, 0.2431373, 0, 1, 1,
0.6311678, -0.4684328, 2.73486, 0.2470588, 0, 1, 1,
0.6323354, -0.2039721, 2.243132, 0.254902, 0, 1, 1,
0.6365901, 0.5637355, 1.755204, 0.2588235, 0, 1, 1,
0.6386108, 0.7251475, 0.2812666, 0.2666667, 0, 1, 1,
0.6426585, -0.009778885, 0.4578968, 0.2705882, 0, 1, 1,
0.6439881, -0.8086296, 1.987258, 0.2784314, 0, 1, 1,
0.6457983, -0.7367184, 2.575732, 0.282353, 0, 1, 1,
0.6460688, 1.495269, -1.044703, 0.2901961, 0, 1, 1,
0.6570503, -1.957581, 3.618804, 0.2941177, 0, 1, 1,
0.6573279, 0.5612438, 0.7926961, 0.3019608, 0, 1, 1,
0.6640384, 0.092936, 1.719209, 0.3098039, 0, 1, 1,
0.6652109, 0.4655862, -0.188514, 0.3137255, 0, 1, 1,
0.6697255, 0.03017875, 1.528587, 0.3215686, 0, 1, 1,
0.6702679, 0.1127068, 2.781287, 0.3254902, 0, 1, 1,
0.6724126, -0.7780409, 1.680833, 0.3333333, 0, 1, 1,
0.676064, -0.9817597, 3.350237, 0.3372549, 0, 1, 1,
0.6798322, 0.638351, 3.696484, 0.345098, 0, 1, 1,
0.6810968, 1.334603, -0.1552751, 0.3490196, 0, 1, 1,
0.6874274, 0.5052713, 1.296252, 0.3568628, 0, 1, 1,
0.6895521, -0.2100124, 1.095964, 0.3607843, 0, 1, 1,
0.6903515, 0.630388, 2.048019, 0.3686275, 0, 1, 1,
0.6959854, -1.154275, 3.832936, 0.372549, 0, 1, 1,
0.6990302, 1.121153, 0.7518454, 0.3803922, 0, 1, 1,
0.7021625, -0.1679973, 0.980682, 0.3843137, 0, 1, 1,
0.7051259, -1.69551, 3.793839, 0.3921569, 0, 1, 1,
0.7056476, 0.228398, 2.57398, 0.3960784, 0, 1, 1,
0.7064009, 0.2047905, 0.4266265, 0.4039216, 0, 1, 1,
0.7093657, -0.8326014, 3.28641, 0.4117647, 0, 1, 1,
0.714748, -1.503912, 3.09739, 0.4156863, 0, 1, 1,
0.7178412, 0.360764, 1.825374, 0.4235294, 0, 1, 1,
0.7180769, 1.102624, 1.63092, 0.427451, 0, 1, 1,
0.7183173, 0.8084587, 1.09581, 0.4352941, 0, 1, 1,
0.7209838, 0.4652404, 1.903553, 0.4392157, 0, 1, 1,
0.7242912, 0.4833146, 2.727924, 0.4470588, 0, 1, 1,
0.7279299, 1.294571, -0.6898013, 0.4509804, 0, 1, 1,
0.7307025, -2.693004, 0.4152875, 0.4588235, 0, 1, 1,
0.7339904, 0.8129905, 0.4741991, 0.4627451, 0, 1, 1,
0.7344833, 1.078914, 1.285879, 0.4705882, 0, 1, 1,
0.7364381, 0.3532839, 0.5819839, 0.4745098, 0, 1, 1,
0.7373338, -0.120852, 1.847322, 0.4823529, 0, 1, 1,
0.7393559, -0.3583571, 1.458378, 0.4862745, 0, 1, 1,
0.741559, 1.104715, -1.055465, 0.4941176, 0, 1, 1,
0.7419003, -0.6707875, 2.067908, 0.5019608, 0, 1, 1,
0.7425725, -0.6024553, 2.497899, 0.5058824, 0, 1, 1,
0.7437487, -0.3429637, 2.83455, 0.5137255, 0, 1, 1,
0.7457243, -0.3395312, 0.1733093, 0.5176471, 0, 1, 1,
0.7459782, -2.046265, 3.041193, 0.5254902, 0, 1, 1,
0.7500327, 1.644402, 0.6729149, 0.5294118, 0, 1, 1,
0.7542385, -0.03131695, 1.737556, 0.5372549, 0, 1, 1,
0.7553009, -1.322564, 2.475263, 0.5411765, 0, 1, 1,
0.7580749, -1.268507, 1.620047, 0.5490196, 0, 1, 1,
0.760689, 0.5612293, 0.6254305, 0.5529412, 0, 1, 1,
0.7639319, -0.3844209, 1.21425, 0.5607843, 0, 1, 1,
0.767123, 0.7860293, -1.089576, 0.5647059, 0, 1, 1,
0.7686376, -0.1512821, 0.9902305, 0.572549, 0, 1, 1,
0.7709901, 0.4112342, 2.061813, 0.5764706, 0, 1, 1,
0.7760643, 0.6653711, 0.4538317, 0.5843138, 0, 1, 1,
0.7779011, -0.7343022, 1.017772, 0.5882353, 0, 1, 1,
0.7804313, -0.4748585, 3.933266, 0.5960785, 0, 1, 1,
0.7857517, -1.515377, 1.150766, 0.6039216, 0, 1, 1,
0.7857887, -0.4219361, 2.140391, 0.6078432, 0, 1, 1,
0.7896408, 1.365572, 1.039588, 0.6156863, 0, 1, 1,
0.7928852, -0.1428948, 1.695461, 0.6196079, 0, 1, 1,
0.7949663, 1.30867, -0.09158169, 0.627451, 0, 1, 1,
0.8003575, -2.430949, 3.960935, 0.6313726, 0, 1, 1,
0.8030812, -0.8784994, 0.1293919, 0.6392157, 0, 1, 1,
0.8061638, -0.8644944, 1.812181, 0.6431373, 0, 1, 1,
0.8079849, -0.1163132, 1.292415, 0.6509804, 0, 1, 1,
0.8100428, -0.274137, 1.31322, 0.654902, 0, 1, 1,
0.8107547, -1.325689, 2.12295, 0.6627451, 0, 1, 1,
0.8163162, 1.177295, 1.827597, 0.6666667, 0, 1, 1,
0.821205, -1.311926, 1.445029, 0.6745098, 0, 1, 1,
0.8242022, 2.195967, 0.8889434, 0.6784314, 0, 1, 1,
0.8258395, 0.6153607, -0.381874, 0.6862745, 0, 1, 1,
0.8258668, -1.198477, 4.369842, 0.6901961, 0, 1, 1,
0.8270108, -0.197787, 1.371279, 0.6980392, 0, 1, 1,
0.8272707, 0.03262334, 0.3978885, 0.7058824, 0, 1, 1,
0.8275081, -0.6043386, 1.780107, 0.7098039, 0, 1, 1,
0.8320607, -1.22634, 3.099041, 0.7176471, 0, 1, 1,
0.8399352, 0.2092521, 2.444773, 0.7215686, 0, 1, 1,
0.8404359, 0.8225994, 1.704505, 0.7294118, 0, 1, 1,
0.8491817, 0.009637204, 2.211567, 0.7333333, 0, 1, 1,
0.8516572, -1.523446, 5.228141, 0.7411765, 0, 1, 1,
0.8519046, -0.4571143, 3.009685, 0.7450981, 0, 1, 1,
0.8584689, 1.134012, 1.230752, 0.7529412, 0, 1, 1,
0.8672988, -0.5410207, 1.949992, 0.7568628, 0, 1, 1,
0.8707595, -0.4456823, 1.793017, 0.7647059, 0, 1, 1,
0.8729276, 0.6373519, 1.409281, 0.7686275, 0, 1, 1,
0.87916, -0.2164079, 3.399806, 0.7764706, 0, 1, 1,
0.8791787, -2.332844, 2.897189, 0.7803922, 0, 1, 1,
0.8809564, 0.4742756, 1.877734, 0.7882353, 0, 1, 1,
0.8873382, -0.1493511, 1.617818, 0.7921569, 0, 1, 1,
0.8887057, 0.7627281, 0.7414739, 0.8, 0, 1, 1,
0.8901888, -0.8810748, 2.542233, 0.8078431, 0, 1, 1,
0.8924521, 0.986702, 0.4721372, 0.8117647, 0, 1, 1,
0.8933288, 1.474469, -0.590979, 0.8196079, 0, 1, 1,
0.8974101, 0.5953763, 0.2939964, 0.8235294, 0, 1, 1,
0.9040235, -1.586972, 2.842049, 0.8313726, 0, 1, 1,
0.9109496, 1.979486, 2.199792, 0.8352941, 0, 1, 1,
0.9114208, 1.131294, 1.543412, 0.8431373, 0, 1, 1,
0.9119673, -2.408789, 3.134303, 0.8470588, 0, 1, 1,
0.91935, 0.2656513, 1.021108, 0.854902, 0, 1, 1,
0.9240818, -0.5705292, 3.24102, 0.8588235, 0, 1, 1,
0.9270312, -0.3259429, 2.608461, 0.8666667, 0, 1, 1,
0.9325231, 0.4177502, 2.555021, 0.8705882, 0, 1, 1,
0.9338248, -0.950069, 3.290669, 0.8784314, 0, 1, 1,
0.9346131, 1.331406, 0.02531833, 0.8823529, 0, 1, 1,
0.9359329, -0.7210779, 5.994835, 0.8901961, 0, 1, 1,
0.9374051, 0.1325589, 0.9923929, 0.8941177, 0, 1, 1,
0.9382064, 1.754546, 0.06161036, 0.9019608, 0, 1, 1,
0.9465042, -0.5308844, 3.131498, 0.9098039, 0, 1, 1,
0.9512734, 0.1892215, 2.128111, 0.9137255, 0, 1, 1,
0.9535104, -0.8858606, 2.046935, 0.9215686, 0, 1, 1,
0.9569733, -1.374127, 4.172981, 0.9254902, 0, 1, 1,
0.9580915, 0.6960602, 1.41208, 0.9333333, 0, 1, 1,
0.9666047, -1.952417, 2.987165, 0.9372549, 0, 1, 1,
0.9676235, 0.9537352, -0.1162199, 0.945098, 0, 1, 1,
0.9711366, 0.6280505, 1.594836, 0.9490196, 0, 1, 1,
0.9753109, 1.641983, 1.520493, 0.9568627, 0, 1, 1,
0.9756094, 0.8447022, 0.3426805, 0.9607843, 0, 1, 1,
0.976137, -1.245376, 4.124675, 0.9686275, 0, 1, 1,
0.9791225, 1.391367, 0.3011858, 0.972549, 0, 1, 1,
0.9807273, -0.1313335, 1.567979, 0.9803922, 0, 1, 1,
0.9880611, -0.6624576, 2.212795, 0.9843137, 0, 1, 1,
0.9981155, -1.83881, 1.079896, 0.9921569, 0, 1, 1,
0.9983588, 0.5538757, 1.828612, 0.9960784, 0, 1, 1,
0.9988353, 0.26576, 1.783122, 1, 0, 0.9960784, 1,
1.008311, 1.31517, -0.355512, 1, 0, 0.9882353, 1,
1.009866, -1.100917, 0.3087372, 1, 0, 0.9843137, 1,
1.014835, -2.088037, 2.090945, 1, 0, 0.9764706, 1,
1.01973, -0.8860069, 2.366515, 1, 0, 0.972549, 1,
1.020871, -0.4006588, 1.242268, 1, 0, 0.9647059, 1,
1.021719, -0.4768651, 1.68531, 1, 0, 0.9607843, 1,
1.022179, -1.47642, 2.00057, 1, 0, 0.9529412, 1,
1.022208, -1.083269, 4.468377, 1, 0, 0.9490196, 1,
1.023801, -0.2981856, 2.645758, 1, 0, 0.9411765, 1,
1.027607, -0.6118349, 2.213565, 1, 0, 0.9372549, 1,
1.031509, 1.886647, -0.6295665, 1, 0, 0.9294118, 1,
1.032039, -0.9282537, 3.80762, 1, 0, 0.9254902, 1,
1.033862, 0.4871497, 0.0004599265, 1, 0, 0.9176471, 1,
1.042433, 0.8273363, 1.393789, 1, 0, 0.9137255, 1,
1.045298, 0.02940101, 0.6296028, 1, 0, 0.9058824, 1,
1.045563, 0.448334, 1.278594, 1, 0, 0.9019608, 1,
1.04684, 1.981688, 1.268992, 1, 0, 0.8941177, 1,
1.048412, -0.9380381, 2.889836, 1, 0, 0.8862745, 1,
1.049311, -2.042655, 3.558969, 1, 0, 0.8823529, 1,
1.055653, -0.6501361, 2.190053, 1, 0, 0.8745098, 1,
1.058314, -0.3116991, 2.132383, 1, 0, 0.8705882, 1,
1.059042, 0.6208616, -0.8747049, 1, 0, 0.8627451, 1,
1.064792, 2.118765, 0.7673046, 1, 0, 0.8588235, 1,
1.079483, 0.0624857, 1.574959, 1, 0, 0.8509804, 1,
1.080246, 0.7859229, 1.56698, 1, 0, 0.8470588, 1,
1.084051, 0.3107786, 2.374269, 1, 0, 0.8392157, 1,
1.096509, -0.3886864, 1.035783, 1, 0, 0.8352941, 1,
1.098853, 0.2866832, 2.621354, 1, 0, 0.827451, 1,
1.107548, 1.029171, 1.705141, 1, 0, 0.8235294, 1,
1.107806, 0.07695501, 0.2308945, 1, 0, 0.8156863, 1,
1.114223, 1.859217, 2.490923, 1, 0, 0.8117647, 1,
1.1144, 1.590162, 1.164247, 1, 0, 0.8039216, 1,
1.116211, 0.4344591, 1.997574, 1, 0, 0.7960784, 1,
1.116985, 0.2277797, 1.7493, 1, 0, 0.7921569, 1,
1.124465, 1.382327, 0.6955706, 1, 0, 0.7843137, 1,
1.126481, -0.3507015, 2.900212, 1, 0, 0.7803922, 1,
1.128782, -0.5166236, 3.203876, 1, 0, 0.772549, 1,
1.130408, -0.3097364, 2.803478, 1, 0, 0.7686275, 1,
1.139593, -0.5873439, 2.630393, 1, 0, 0.7607843, 1,
1.154725, 0.825597, 0.938349, 1, 0, 0.7568628, 1,
1.159164, -0.3965828, 3.368877, 1, 0, 0.7490196, 1,
1.179997, 1.583412, -0.05765426, 1, 0, 0.7450981, 1,
1.184242, -0.633945, 1.451799, 1, 0, 0.7372549, 1,
1.19709, 0.7838149, 1.135445, 1, 0, 0.7333333, 1,
1.201773, 2.237873, -1.649269, 1, 0, 0.7254902, 1,
1.204941, -0.3542015, 1.21391, 1, 0, 0.7215686, 1,
1.218, -0.6698501, 1.295373, 1, 0, 0.7137255, 1,
1.220094, -0.2376051, 1.706924, 1, 0, 0.7098039, 1,
1.229262, 0.4375359, 0.9012938, 1, 0, 0.7019608, 1,
1.235645, -1.798187, 2.772846, 1, 0, 0.6941177, 1,
1.241702, 0.7089561, 2.060458, 1, 0, 0.6901961, 1,
1.257072, 1.799287, 0.7092432, 1, 0, 0.682353, 1,
1.269402, 0.1472233, 2.256628, 1, 0, 0.6784314, 1,
1.271227, 0.7890525, 0.06152615, 1, 0, 0.6705883, 1,
1.273447, -0.1315012, 2.542438, 1, 0, 0.6666667, 1,
1.278253, -0.1895148, 1.140553, 1, 0, 0.6588235, 1,
1.280144, -1.380151, 4.494065, 1, 0, 0.654902, 1,
1.282093, 0.03146708, 1.877221, 1, 0, 0.6470588, 1,
1.285348, -0.1659782, 3.241986, 1, 0, 0.6431373, 1,
1.289939, -1.45343, 2.326586, 1, 0, 0.6352941, 1,
1.292346, 0.3989323, -0.3210465, 1, 0, 0.6313726, 1,
1.293152, 0.1957265, 2.132061, 1, 0, 0.6235294, 1,
1.301169, 1.975474, -1.121081, 1, 0, 0.6196079, 1,
1.308145, 0.8099927, 3.206591, 1, 0, 0.6117647, 1,
1.316728, 1.211917, -0.06334411, 1, 0, 0.6078432, 1,
1.318955, 1.297329, -0.1152669, 1, 0, 0.6, 1,
1.324346, 2.163634, 1.360005, 1, 0, 0.5921569, 1,
1.329267, -0.3183285, 1.259723, 1, 0, 0.5882353, 1,
1.339872, 0.576272, 1.113309, 1, 0, 0.5803922, 1,
1.349121, 1.078709, 1.214223, 1, 0, 0.5764706, 1,
1.354622, -0.4013115, 3.655417, 1, 0, 0.5686275, 1,
1.355333, -0.3221084, 1.461216, 1, 0, 0.5647059, 1,
1.360781, -0.6983929, 3.220063, 1, 0, 0.5568628, 1,
1.364791, -0.1890367, 0.2565091, 1, 0, 0.5529412, 1,
1.367818, -0.3785448, 1.883627, 1, 0, 0.5450981, 1,
1.373752, -1.195004, 2.75955, 1, 0, 0.5411765, 1,
1.377322, 0.6103362, 0.9476331, 1, 0, 0.5333334, 1,
1.378964, -1.101429, 2.532652, 1, 0, 0.5294118, 1,
1.388177, 0.7277457, 0.8393275, 1, 0, 0.5215687, 1,
1.388702, 2.052358, 1.28793, 1, 0, 0.5176471, 1,
1.401442, -1.412341, 1.333106, 1, 0, 0.509804, 1,
1.405815, -0.2310261, 1.392461, 1, 0, 0.5058824, 1,
1.407758, -0.4528669, 0.1996863, 1, 0, 0.4980392, 1,
1.411774, 2.028103, 2.484544, 1, 0, 0.4901961, 1,
1.413456, 0.7353363, 0.9777155, 1, 0, 0.4862745, 1,
1.424692, -0.6066569, 2.605339, 1, 0, 0.4784314, 1,
1.427571, -0.4935784, 3.625381, 1, 0, 0.4745098, 1,
1.429295, -1.779814, 2.840028, 1, 0, 0.4666667, 1,
1.443284, -0.1085707, 0.3850248, 1, 0, 0.4627451, 1,
1.447117, 0.3966452, -0.4680139, 1, 0, 0.454902, 1,
1.448991, -1.51283, 3.861468, 1, 0, 0.4509804, 1,
1.452966, 1.079623, 2.029708, 1, 0, 0.4431373, 1,
1.456003, 0.1808123, 1.750299, 1, 0, 0.4392157, 1,
1.465381, -0.5706453, -0.3416823, 1, 0, 0.4313726, 1,
1.471373, 1.066573, 1.247135, 1, 0, 0.427451, 1,
1.47619, 0.6261754, 0.4796946, 1, 0, 0.4196078, 1,
1.480343, 1.34833, 1.989645, 1, 0, 0.4156863, 1,
1.497355, 0.682383, 0.2194504, 1, 0, 0.4078431, 1,
1.502975, -1.173207, 1.775349, 1, 0, 0.4039216, 1,
1.509904, -1.243952, 3.611101, 1, 0, 0.3960784, 1,
1.515949, 0.6608284, 2.900247, 1, 0, 0.3882353, 1,
1.518694, 2.005131, 0.6037647, 1, 0, 0.3843137, 1,
1.518716, 1.846134, 2.019446, 1, 0, 0.3764706, 1,
1.522749, -0.5604261, 1.254954, 1, 0, 0.372549, 1,
1.526475, -0.5361454, 3.203803, 1, 0, 0.3647059, 1,
1.527358, -0.6233581, 1.195632, 1, 0, 0.3607843, 1,
1.543816, 0.03343666, 2.771111, 1, 0, 0.3529412, 1,
1.548499, -0.9727143, 2.248567, 1, 0, 0.3490196, 1,
1.550695, 0.7646671, -0.3329035, 1, 0, 0.3411765, 1,
1.551487, 0.6756528, 1.221949, 1, 0, 0.3372549, 1,
1.556552, -0.5268399, 1.860597, 1, 0, 0.3294118, 1,
1.578645, -0.2067654, 4.052646, 1, 0, 0.3254902, 1,
1.593486, -0.5203642, 2.336024, 1, 0, 0.3176471, 1,
1.593646, 0.4489166, 3.234637, 1, 0, 0.3137255, 1,
1.59405, -0.06984826, 1.925502, 1, 0, 0.3058824, 1,
1.601116, -0.02247946, 2.33627, 1, 0, 0.2980392, 1,
1.603273, 0.610994, 2.632888, 1, 0, 0.2941177, 1,
1.614777, 0.826256, 0.2344849, 1, 0, 0.2862745, 1,
1.621329, -0.5497993, 1.434087, 1, 0, 0.282353, 1,
1.621788, -0.3022696, 1.087127, 1, 0, 0.2745098, 1,
1.625119, -0.3309587, 2.412954, 1, 0, 0.2705882, 1,
1.641604, -0.7242478, 2.952393, 1, 0, 0.2627451, 1,
1.645893, 0.6240313, 1.628417, 1, 0, 0.2588235, 1,
1.646424, 0.7911686, -0.3683437, 1, 0, 0.2509804, 1,
1.653309, -0.09944412, 1.668007, 1, 0, 0.2470588, 1,
1.653452, -0.8965427, 3.911275, 1, 0, 0.2392157, 1,
1.662621, 0.3892648, 0.1164724, 1, 0, 0.2352941, 1,
1.66399, -2.635874, 2.759309, 1, 0, 0.227451, 1,
1.68621, -2.450193, 1.431192, 1, 0, 0.2235294, 1,
1.693946, -0.06482344, 2.004299, 1, 0, 0.2156863, 1,
1.697612, 0.4379963, 0.5568545, 1, 0, 0.2117647, 1,
1.722191, 1.634365, 1.219478, 1, 0, 0.2039216, 1,
1.775204, -1.534058, 3.134825, 1, 0, 0.1960784, 1,
1.776584, 1.491069, 2.24425, 1, 0, 0.1921569, 1,
1.802771, -1.537766, 2.181353, 1, 0, 0.1843137, 1,
1.849743, -1.814039, 2.623356, 1, 0, 0.1803922, 1,
1.863602, -0.2715199, 2.480518, 1, 0, 0.172549, 1,
1.865039, 0.3526541, 1.60739, 1, 0, 0.1686275, 1,
1.899423, -0.1941811, 0.741443, 1, 0, 0.1607843, 1,
1.913643, -0.1403299, 3.466952, 1, 0, 0.1568628, 1,
1.929102, -0.6756858, 2.116718, 1, 0, 0.1490196, 1,
1.944158, 1.629057, -0.106808, 1, 0, 0.145098, 1,
1.948708, -0.04430498, 2.226864, 1, 0, 0.1372549, 1,
1.949274, -1.769431, 0.7228715, 1, 0, 0.1333333, 1,
1.970306, -1.188333, 0.8644273, 1, 0, 0.1254902, 1,
2.009068, -2.424343, 5.61363, 1, 0, 0.1215686, 1,
2.015834, -0.147788, 0.7874203, 1, 0, 0.1137255, 1,
2.025325, 1.263965, 2.761412, 1, 0, 0.1098039, 1,
2.073558, -1.275509, 3.157535, 1, 0, 0.1019608, 1,
2.093242, -0.04205389, 1.628218, 1, 0, 0.09411765, 1,
2.107186, 1.208566, 0.5705202, 1, 0, 0.09019608, 1,
2.158249, 0.3586849, 0.6830871, 1, 0, 0.08235294, 1,
2.185517, 0.9332931, 1.764423, 1, 0, 0.07843138, 1,
2.316848, -0.1547064, 1.386389, 1, 0, 0.07058824, 1,
2.327047, 1.10449, 1.914923, 1, 0, 0.06666667, 1,
2.332238, -0.9855034, 2.947287, 1, 0, 0.05882353, 1,
2.411921, 0.06257997, 2.068412, 1, 0, 0.05490196, 1,
2.43318, 1.381874, 1.690056, 1, 0, 0.04705882, 1,
2.45082, -1.407256, 1.896051, 1, 0, 0.04313726, 1,
2.46637, 0.9952761, 1.5165, 1, 0, 0.03529412, 1,
2.604325, -2.268067, 2.198635, 1, 0, 0.03137255, 1,
2.748111, -1.20418, 1.294439, 1, 0, 0.02352941, 1,
2.775189, -1.429222, 1.3239, 1, 0, 0.01960784, 1,
3.229944, -0.6187229, 1.635602, 1, 0, 0.01176471, 1,
3.356717, 0.7672739, 0.5682974, 1, 0, 0.007843138, 1
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
0.09671259, -3.967053, -7.798296, 0, -0.5, 0.5, 0.5,
0.09671259, -3.967053, -7.798296, 1, -0.5, 0.5, 0.5,
0.09671259, -3.967053, -7.798296, 1, 1.5, 0.5, 0.5,
0.09671259, -3.967053, -7.798296, 0, 1.5, 0.5, 0.5
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
-4.268434, -0.1629056, -7.798296, 0, -0.5, 0.5, 0.5,
-4.268434, -0.1629056, -7.798296, 1, -0.5, 0.5, 0.5,
-4.268434, -0.1629056, -7.798296, 1, 1.5, 0.5, 0.5,
-4.268434, -0.1629056, -7.798296, 0, 1.5, 0.5, 0.5
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
-4.268434, -3.967053, 0.0978148, 0, -0.5, 0.5, 0.5,
-4.268434, -3.967053, 0.0978148, 1, -0.5, 0.5, 0.5,
-4.268434, -3.967053, 0.0978148, 1, 1.5, 0.5, 0.5,
-4.268434, -3.967053, 0.0978148, 0, 1.5, 0.5, 0.5
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
-3, -3.089173, -5.976116,
3, -3.089173, -5.976116,
-3, -3.089173, -5.976116,
-3, -3.235486, -6.279813,
-2, -3.089173, -5.976116,
-2, -3.235486, -6.279813,
-1, -3.089173, -5.976116,
-1, -3.235486, -6.279813,
0, -3.089173, -5.976116,
0, -3.235486, -6.279813,
1, -3.089173, -5.976116,
1, -3.235486, -6.279813,
2, -3.089173, -5.976116,
2, -3.235486, -6.279813,
3, -3.089173, -5.976116,
3, -3.235486, -6.279813
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
-3, -3.528113, -6.887206, 0, -0.5, 0.5, 0.5,
-3, -3.528113, -6.887206, 1, -0.5, 0.5, 0.5,
-3, -3.528113, -6.887206, 1, 1.5, 0.5, 0.5,
-3, -3.528113, -6.887206, 0, 1.5, 0.5, 0.5,
-2, -3.528113, -6.887206, 0, -0.5, 0.5, 0.5,
-2, -3.528113, -6.887206, 1, -0.5, 0.5, 0.5,
-2, -3.528113, -6.887206, 1, 1.5, 0.5, 0.5,
-2, -3.528113, -6.887206, 0, 1.5, 0.5, 0.5,
-1, -3.528113, -6.887206, 0, -0.5, 0.5, 0.5,
-1, -3.528113, -6.887206, 1, -0.5, 0.5, 0.5,
-1, -3.528113, -6.887206, 1, 1.5, 0.5, 0.5,
-1, -3.528113, -6.887206, 0, 1.5, 0.5, 0.5,
0, -3.528113, -6.887206, 0, -0.5, 0.5, 0.5,
0, -3.528113, -6.887206, 1, -0.5, 0.5, 0.5,
0, -3.528113, -6.887206, 1, 1.5, 0.5, 0.5,
0, -3.528113, -6.887206, 0, 1.5, 0.5, 0.5,
1, -3.528113, -6.887206, 0, -0.5, 0.5, 0.5,
1, -3.528113, -6.887206, 1, -0.5, 0.5, 0.5,
1, -3.528113, -6.887206, 1, 1.5, 0.5, 0.5,
1, -3.528113, -6.887206, 0, 1.5, 0.5, 0.5,
2, -3.528113, -6.887206, 0, -0.5, 0.5, 0.5,
2, -3.528113, -6.887206, 1, -0.5, 0.5, 0.5,
2, -3.528113, -6.887206, 1, 1.5, 0.5, 0.5,
2, -3.528113, -6.887206, 0, 1.5, 0.5, 0.5,
3, -3.528113, -6.887206, 0, -0.5, 0.5, 0.5,
3, -3.528113, -6.887206, 1, -0.5, 0.5, 0.5,
3, -3.528113, -6.887206, 1, 1.5, 0.5, 0.5,
3, -3.528113, -6.887206, 0, 1.5, 0.5, 0.5
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
-3.261092, -3, -5.976116,
-3.261092, 2, -5.976116,
-3.261092, -3, -5.976116,
-3.428982, -3, -6.279813,
-3.261092, -2, -5.976116,
-3.428982, -2, -6.279813,
-3.261092, -1, -5.976116,
-3.428982, -1, -6.279813,
-3.261092, 0, -5.976116,
-3.428982, 0, -6.279813,
-3.261092, 1, -5.976116,
-3.428982, 1, -6.279813,
-3.261092, 2, -5.976116,
-3.428982, 2, -6.279813
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
-3.764763, -3, -6.887206, 0, -0.5, 0.5, 0.5,
-3.764763, -3, -6.887206, 1, -0.5, 0.5, 0.5,
-3.764763, -3, -6.887206, 1, 1.5, 0.5, 0.5,
-3.764763, -3, -6.887206, 0, 1.5, 0.5, 0.5,
-3.764763, -2, -6.887206, 0, -0.5, 0.5, 0.5,
-3.764763, -2, -6.887206, 1, -0.5, 0.5, 0.5,
-3.764763, -2, -6.887206, 1, 1.5, 0.5, 0.5,
-3.764763, -2, -6.887206, 0, 1.5, 0.5, 0.5,
-3.764763, -1, -6.887206, 0, -0.5, 0.5, 0.5,
-3.764763, -1, -6.887206, 1, -0.5, 0.5, 0.5,
-3.764763, -1, -6.887206, 1, 1.5, 0.5, 0.5,
-3.764763, -1, -6.887206, 0, 1.5, 0.5, 0.5,
-3.764763, 0, -6.887206, 0, -0.5, 0.5, 0.5,
-3.764763, 0, -6.887206, 1, -0.5, 0.5, 0.5,
-3.764763, 0, -6.887206, 1, 1.5, 0.5, 0.5,
-3.764763, 0, -6.887206, 0, 1.5, 0.5, 0.5,
-3.764763, 1, -6.887206, 0, -0.5, 0.5, 0.5,
-3.764763, 1, -6.887206, 1, -0.5, 0.5, 0.5,
-3.764763, 1, -6.887206, 1, 1.5, 0.5, 0.5,
-3.764763, 1, -6.887206, 0, 1.5, 0.5, 0.5,
-3.764763, 2, -6.887206, 0, -0.5, 0.5, 0.5,
-3.764763, 2, -6.887206, 1, -0.5, 0.5, 0.5,
-3.764763, 2, -6.887206, 1, 1.5, 0.5, 0.5,
-3.764763, 2, -6.887206, 0, 1.5, 0.5, 0.5
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
-3.261092, -3.089173, -4,
-3.261092, -3.089173, 4,
-3.261092, -3.089173, -4,
-3.428982, -3.235486, -4,
-3.261092, -3.089173, -2,
-3.428982, -3.235486, -2,
-3.261092, -3.089173, 0,
-3.428982, -3.235486, 0,
-3.261092, -3.089173, 2,
-3.428982, -3.235486, 2,
-3.261092, -3.089173, 4,
-3.428982, -3.235486, 4
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
-3.764763, -3.528113, -4, 0, -0.5, 0.5, 0.5,
-3.764763, -3.528113, -4, 1, -0.5, 0.5, 0.5,
-3.764763, -3.528113, -4, 1, 1.5, 0.5, 0.5,
-3.764763, -3.528113, -4, 0, 1.5, 0.5, 0.5,
-3.764763, -3.528113, -2, 0, -0.5, 0.5, 0.5,
-3.764763, -3.528113, -2, 1, -0.5, 0.5, 0.5,
-3.764763, -3.528113, -2, 1, 1.5, 0.5, 0.5,
-3.764763, -3.528113, -2, 0, 1.5, 0.5, 0.5,
-3.764763, -3.528113, 0, 0, -0.5, 0.5, 0.5,
-3.764763, -3.528113, 0, 1, -0.5, 0.5, 0.5,
-3.764763, -3.528113, 0, 1, 1.5, 0.5, 0.5,
-3.764763, -3.528113, 0, 0, 1.5, 0.5, 0.5,
-3.764763, -3.528113, 2, 0, -0.5, 0.5, 0.5,
-3.764763, -3.528113, 2, 1, -0.5, 0.5, 0.5,
-3.764763, -3.528113, 2, 1, 1.5, 0.5, 0.5,
-3.764763, -3.528113, 2, 0, 1.5, 0.5, 0.5,
-3.764763, -3.528113, 4, 0, -0.5, 0.5, 0.5,
-3.764763, -3.528113, 4, 1, -0.5, 0.5, 0.5,
-3.764763, -3.528113, 4, 1, 1.5, 0.5, 0.5,
-3.764763, -3.528113, 4, 0, 1.5, 0.5, 0.5
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
-3.261092, -3.089173, -5.976116,
-3.261092, 2.763362, -5.976116,
-3.261092, -3.089173, 6.171746,
-3.261092, 2.763362, 6.171746,
-3.261092, -3.089173, -5.976116,
-3.261092, -3.089173, 6.171746,
-3.261092, 2.763362, -5.976116,
-3.261092, 2.763362, 6.171746,
-3.261092, -3.089173, -5.976116,
3.454518, -3.089173, -5.976116,
-3.261092, -3.089173, 6.171746,
3.454518, -3.089173, 6.171746,
-3.261092, 2.763362, -5.976116,
3.454518, 2.763362, -5.976116,
-3.261092, 2.763362, 6.171746,
3.454518, 2.763362, 6.171746,
3.454518, -3.089173, -5.976116,
3.454518, 2.763362, -5.976116,
3.454518, -3.089173, 6.171746,
3.454518, 2.763362, 6.171746,
3.454518, -3.089173, -5.976116,
3.454518, -3.089173, 6.171746,
3.454518, 2.763362, -5.976116,
3.454518, 2.763362, 6.171746
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
var radius = 8.043849;
var distance = 35.78799;
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
mvMatrix.translate( -0.09671259, 0.1629056, -0.0978148 );
mvMatrix.scale( 1.295067, 1.486051, 0.7159421 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.78799);
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
difenoxuron<-read.table("difenoxuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-difenoxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
```

```r
y<-difenoxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
```

```r
z<-difenoxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
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
-3.163292, -0.02541345, -1.82269, 0, 0, 1, 1, 1,
-3.004296, 0.2384248, -0.4256292, 1, 0, 0, 1, 1,
-2.8808, 1.27366, -1.075631, 1, 0, 0, 1, 1,
-2.880547, -1.036168, -0.2469554, 1, 0, 0, 1, 1,
-2.758561, -0.3885688, -0.487435, 1, 0, 0, 1, 1,
-2.648551, -0.5909708, -2.180492, 1, 0, 0, 1, 1,
-2.531961, 1.276991, -1.806611, 0, 0, 0, 1, 1,
-2.420994, 0.7820792, -0.2416832, 0, 0, 0, 1, 1,
-2.387745, -1.33407, -1.747144, 0, 0, 0, 1, 1,
-2.373178, -1.717968, -0.795621, 0, 0, 0, 1, 1,
-2.311772, -2.368645, -2.222415, 0, 0, 0, 1, 1,
-2.199173, -1.440941, -2.556634, 0, 0, 0, 1, 1,
-2.178597, 0.8607124, -2.25857, 0, 0, 0, 1, 1,
-2.12904, -1.170241, -3.085056, 1, 1, 1, 1, 1,
-2.080122, 0.2646955, -0.4056668, 1, 1, 1, 1, 1,
-2.073097, -0.2470356, -1.880685, 1, 1, 1, 1, 1,
-2.049426, 1.211956, 0.7940332, 1, 1, 1, 1, 1,
-2.013505, 0.7666537, -0.4902554, 1, 1, 1, 1, 1,
-2.002737, -1.221384, -1.984538, 1, 1, 1, 1, 1,
-1.977028, -0.02880377, -2.841589, 1, 1, 1, 1, 1,
-1.969618, 1.516597, -0.08885146, 1, 1, 1, 1, 1,
-1.961734, -1.170711, -1.816091, 1, 1, 1, 1, 1,
-1.946534, 0.2521864, -1.667981, 1, 1, 1, 1, 1,
-1.94107, 0.03370905, -1.565287, 1, 1, 1, 1, 1,
-1.92825, 0.7620266, 0.3192728, 1, 1, 1, 1, 1,
-1.924869, -0.06141696, -1.307989, 1, 1, 1, 1, 1,
-1.917961, -1.750796, -2.855395, 1, 1, 1, 1, 1,
-1.901647, -1.694931, -3.149911, 1, 1, 1, 1, 1,
-1.897867, 0.8648399, -1.323128, 0, 0, 1, 1, 1,
-1.895436, -0.5187152, -2.413046, 1, 0, 0, 1, 1,
-1.890269, -0.04651329, -0.2530094, 1, 0, 0, 1, 1,
-1.889823, 1.042426, -2.224041, 1, 0, 0, 1, 1,
-1.877675, 0.4629268, -2.066724, 1, 0, 0, 1, 1,
-1.847281, 0.2391737, -1.151388, 1, 0, 0, 1, 1,
-1.807056, 2.544275, -1.383332, 0, 0, 0, 1, 1,
-1.804747, -0.9770446, -1.33405, 0, 0, 0, 1, 1,
-1.786455, -1.242296, -3.226939, 0, 0, 0, 1, 1,
-1.782035, -1.164999, -0.9766441, 0, 0, 0, 1, 1,
-1.780757, -0.6764954, -2.30635, 0, 0, 0, 1, 1,
-1.758441, -0.5179791, -3.064402, 0, 0, 0, 1, 1,
-1.754829, 0.544216, -2.413849, 0, 0, 0, 1, 1,
-1.754725, 0.1850169, -0.9147711, 1, 1, 1, 1, 1,
-1.744293, -0.1509188, -1.324267, 1, 1, 1, 1, 1,
-1.72941, 1.249235, -1.454507, 1, 1, 1, 1, 1,
-1.727094, 0.4953752, -1.450279, 1, 1, 1, 1, 1,
-1.72363, -0.3303517, -0.948368, 1, 1, 1, 1, 1,
-1.692542, 0.7753201, -1.413257, 1, 1, 1, 1, 1,
-1.69148, -0.456596, -2.046025, 1, 1, 1, 1, 1,
-1.678051, -1.355794, -2.750478, 1, 1, 1, 1, 1,
-1.672326, 0.8984662, 0.5452291, 1, 1, 1, 1, 1,
-1.661713, -1.467805, 0.305868, 1, 1, 1, 1, 1,
-1.659993, 0.9529115, -0.477172, 1, 1, 1, 1, 1,
-1.659173, 0.9332998, -0.9151293, 1, 1, 1, 1, 1,
-1.611171, -0.3129634, -2.92015, 1, 1, 1, 1, 1,
-1.584575, 0.04181261, -0.4435419, 1, 1, 1, 1, 1,
-1.582452, 0.4259727, -0.7738102, 1, 1, 1, 1, 1,
-1.55749, -0.07704129, -2.188032, 0, 0, 1, 1, 1,
-1.528802, -1.840492, -1.345782, 1, 0, 0, 1, 1,
-1.525101, 0.1453766, -1.71875, 1, 0, 0, 1, 1,
-1.485796, -0.609349, -3.931808, 1, 0, 0, 1, 1,
-1.479683, 0.4706726, 0.5467077, 1, 0, 0, 1, 1,
-1.47633, -0.3741905, -0.5187276, 1, 0, 0, 1, 1,
-1.462197, -0.5190612, -1.934392, 0, 0, 0, 1, 1,
-1.461323, 0.3601251, -2.184568, 0, 0, 0, 1, 1,
-1.459163, -1.638461, -2.367387, 0, 0, 0, 1, 1,
-1.455511, 0.4798251, -0.07591101, 0, 0, 0, 1, 1,
-1.453038, 0.1910188, -1.675064, 0, 0, 0, 1, 1,
-1.448595, 1.161082, -0.6918658, 0, 0, 0, 1, 1,
-1.443429, 2.112122, -0.3219882, 0, 0, 0, 1, 1,
-1.438205, 2.671331, 0.996749, 1, 1, 1, 1, 1,
-1.430082, -0.3818528, -0.2088709, 1, 1, 1, 1, 1,
-1.416191, -1.415012, -2.754473, 1, 1, 1, 1, 1,
-1.395579, -1.752833, -2.948767, 1, 1, 1, 1, 1,
-1.394449, -0.2924311, -1.054867, 1, 1, 1, 1, 1,
-1.394019, -2.033274, -3.147402, 1, 1, 1, 1, 1,
-1.387226, 0.7557124, -1.147925, 1, 1, 1, 1, 1,
-1.384827, 0.424052, -0.1119262, 1, 1, 1, 1, 1,
-1.380413, 0.0002186124, -1.931718, 1, 1, 1, 1, 1,
-1.374743, -0.2267837, -2.223851, 1, 1, 1, 1, 1,
-1.373281, 0.1024943, -1.438732, 1, 1, 1, 1, 1,
-1.368137, -0.2233394, -1.575456, 1, 1, 1, 1, 1,
-1.356502, -1.666308, -3.302014, 1, 1, 1, 1, 1,
-1.354512, -1.571608, -1.058044, 1, 1, 1, 1, 1,
-1.35121, 1.102448, -1.283829, 1, 1, 1, 1, 1,
-1.34106, 0.9370686, -0.2829638, 0, 0, 1, 1, 1,
-1.323906, 0.5682182, -3.056022, 1, 0, 0, 1, 1,
-1.311365, 1.746479, -0.8581752, 1, 0, 0, 1, 1,
-1.296303, -0.2897684, -0.6931694, 1, 0, 0, 1, 1,
-1.296098, -0.9886258, -2.618344, 1, 0, 0, 1, 1,
-1.28951, -0.8973526, -1.456285, 1, 0, 0, 1, 1,
-1.288804, 1.758615, 2.367193, 0, 0, 0, 1, 1,
-1.284891, -1.973378, -2.588106, 0, 0, 0, 1, 1,
-1.276637, 1.01448, -0.03028314, 0, 0, 0, 1, 1,
-1.268605, 0.134762, -2.398921, 0, 0, 0, 1, 1,
-1.267058, 0.7366707, -0.9776279, 0, 0, 0, 1, 1,
-1.264492, -0.03653401, -0.6984727, 0, 0, 0, 1, 1,
-1.259439, 0.3129601, -4.260649, 0, 0, 0, 1, 1,
-1.25439, -0.4394818, -1.04432, 1, 1, 1, 1, 1,
-1.232531, 0.4963077, -0.7407588, 1, 1, 1, 1, 1,
-1.224216, 0.473388, -1.53967, 1, 1, 1, 1, 1,
-1.218531, 0.1316485, -1.820761, 1, 1, 1, 1, 1,
-1.206706, 0.4212193, -0.1840684, 1, 1, 1, 1, 1,
-1.204771, -0.01834188, -2.021746, 1, 1, 1, 1, 1,
-1.196562, -0.06875955, -1.966607, 1, 1, 1, 1, 1,
-1.1949, 1.491314, -2.555341, 1, 1, 1, 1, 1,
-1.191253, -0.8898933, -3.137725, 1, 1, 1, 1, 1,
-1.190759, 0.9510773, 1.279235, 1, 1, 1, 1, 1,
-1.188844, 0.4795545, -1.394957, 1, 1, 1, 1, 1,
-1.18607, -0.845111, -1.810341, 1, 1, 1, 1, 1,
-1.18573, 0.4458773, -2.208, 1, 1, 1, 1, 1,
-1.182641, -0.0983996, -0.1542996, 1, 1, 1, 1, 1,
-1.178404, -0.5708736, -1.237513, 1, 1, 1, 1, 1,
-1.173817, -1.0813, -1.464382, 0, 0, 1, 1, 1,
-1.166899, -1.72245, -1.072932, 1, 0, 0, 1, 1,
-1.166703, 0.4127995, -1.753116, 1, 0, 0, 1, 1,
-1.165561, 0.1137663, -1.055791, 1, 0, 0, 1, 1,
-1.165336, -1.338365, -4.238898, 1, 0, 0, 1, 1,
-1.151795, -0.6749784, -2.478603, 1, 0, 0, 1, 1,
-1.150838, -0.9682084, -4.080805, 0, 0, 0, 1, 1,
-1.14669, 0.1104811, 0.2997005, 0, 0, 0, 1, 1,
-1.143507, 0.2945577, -2.129661, 0, 0, 0, 1, 1,
-1.134731, 0.3054723, -0.8435778, 0, 0, 0, 1, 1,
-1.128133, 0.1823857, -1.161584, 0, 0, 0, 1, 1,
-1.124612, 0.4488201, -1.267545, 0, 0, 0, 1, 1,
-1.12352, 0.7061836, -0.1444985, 0, 0, 0, 1, 1,
-1.11822, 0.9440606, -0.5119983, 1, 1, 1, 1, 1,
-1.115575, 0.31579, -0.6440466, 1, 1, 1, 1, 1,
-1.109864, 0.05160629, -1.190659, 1, 1, 1, 1, 1,
-1.108014, -1.11566, -3.85907, 1, 1, 1, 1, 1,
-1.104394, -0.471453, -3.523243, 1, 1, 1, 1, 1,
-1.100227, -0.6093217, -2.647441, 1, 1, 1, 1, 1,
-1.098827, 1.362578, -1.457267, 1, 1, 1, 1, 1,
-1.096635, 0.1041378, -2.286153, 1, 1, 1, 1, 1,
-1.086369, -0.05797086, -2.168305, 1, 1, 1, 1, 1,
-1.086046, -0.171397, -1.204673, 1, 1, 1, 1, 1,
-1.08585, -0.03158737, -2.423819, 1, 1, 1, 1, 1,
-1.085733, -0.0522773, -1.515154, 1, 1, 1, 1, 1,
-1.083947, -0.4212374, 0.5684375, 1, 1, 1, 1, 1,
-1.082228, -0.2449981, -0.8392248, 1, 1, 1, 1, 1,
-1.052482, 0.5390578, -0.7229028, 1, 1, 1, 1, 1,
-1.04988, -1.280508, -2.500072, 0, 0, 1, 1, 1,
-1.047954, 1.000868, -2.132125, 1, 0, 0, 1, 1,
-1.04362, -0.482495, -0.470332, 1, 0, 0, 1, 1,
-1.035772, 0.5972911, -0.7523392, 1, 0, 0, 1, 1,
-1.014554, -0.077025, -0.6806221, 1, 0, 0, 1, 1,
-1.012851, 0.3497859, -2.743666, 1, 0, 0, 1, 1,
-1.008022, 1.303727, -1.952613, 0, 0, 0, 1, 1,
-1.000148, 0.1137795, -0.968706, 0, 0, 0, 1, 1,
-0.992524, 0.7707838, -1.495381, 0, 0, 0, 1, 1,
-0.9821455, -0.06576035, -3.348086, 0, 0, 0, 1, 1,
-0.9707496, -0.8915711, -1.071926, 0, 0, 0, 1, 1,
-0.9652532, 1.679699, -0.5552707, 0, 0, 0, 1, 1,
-0.962164, -0.129317, -2.265385, 0, 0, 0, 1, 1,
-0.9612396, 0.01387311, 0.4655188, 1, 1, 1, 1, 1,
-0.9521292, -0.7223105, -2.391057, 1, 1, 1, 1, 1,
-0.9362222, -0.4959341, -3.935835, 1, 1, 1, 1, 1,
-0.9350882, -0.008488238, -1.78788, 1, 1, 1, 1, 1,
-0.9340654, -1.67444, -1.05557, 1, 1, 1, 1, 1,
-0.9317002, 1.006627, -1.173521, 1, 1, 1, 1, 1,
-0.9313203, -0.6012807, -1.280495, 1, 1, 1, 1, 1,
-0.9308057, 0.8427333, -0.1668519, 1, 1, 1, 1, 1,
-0.9267343, 1.808354, 1.992747, 1, 1, 1, 1, 1,
-0.9226046, 0.4138443, 0.1697063, 1, 1, 1, 1, 1,
-0.9164346, 0.3172261, -0.7736878, 1, 1, 1, 1, 1,
-0.9152475, -0.1122153, -2.387068, 1, 1, 1, 1, 1,
-0.9123616, 0.1393569, -1.025929, 1, 1, 1, 1, 1,
-0.9083686, -1.839645, -3.519375, 1, 1, 1, 1, 1,
-0.9079747, -0.2632062, -0.5947408, 1, 1, 1, 1, 1,
-0.9079486, -0.0252475, -1.757177, 0, 0, 1, 1, 1,
-0.9064975, 1.443805, 0.1442879, 1, 0, 0, 1, 1,
-0.9054794, -1.278977, -2.887847, 1, 0, 0, 1, 1,
-0.9045668, 1.092185, 0.5240142, 1, 0, 0, 1, 1,
-0.9007891, 0.5957423, -1.330409, 1, 0, 0, 1, 1,
-0.9000762, 0.5234684, -2.12456, 1, 0, 0, 1, 1,
-0.8996758, 1.835006, -0.7317968, 0, 0, 0, 1, 1,
-0.8895584, 0.5209758, -1.966506, 0, 0, 0, 1, 1,
-0.8893011, 0.2202277, -0.3639988, 0, 0, 0, 1, 1,
-0.8878731, -0.6004107, -1.438404, 0, 0, 0, 1, 1,
-0.8869187, -0.7748006, -1.378283, 0, 0, 0, 1, 1,
-0.8813323, 1.302292, 0.1565266, 0, 0, 0, 1, 1,
-0.8774148, -1.723391, -1.632319, 0, 0, 0, 1, 1,
-0.864647, 2.318502, 0.04359801, 1, 1, 1, 1, 1,
-0.8541346, -1.488254, -3.011516, 1, 1, 1, 1, 1,
-0.8480316, 2.498931, 1.186666, 1, 1, 1, 1, 1,
-0.8450189, -0.4410411, -0.1664539, 1, 1, 1, 1, 1,
-0.8417742, 0.1255203, -1.044645, 1, 1, 1, 1, 1,
-0.8385086, 0.05823885, -1.229053, 1, 1, 1, 1, 1,
-0.8338837, 2.072102, -0.07335403, 1, 1, 1, 1, 1,
-0.8318154, 0.7776554, -1.104354, 1, 1, 1, 1, 1,
-0.8275441, 0.7788713, -1.953641, 1, 1, 1, 1, 1,
-0.8273411, 0.07904501, -2.89927, 1, 1, 1, 1, 1,
-0.8204985, -1.425154, -1.618366, 1, 1, 1, 1, 1,
-0.8107744, 0.1917072, -1.534269, 1, 1, 1, 1, 1,
-0.8088768, 1.163191, 0.08253311, 1, 1, 1, 1, 1,
-0.8087699, 0.07956462, -1.467296, 1, 1, 1, 1, 1,
-0.8079712, -0.6127838, -0.3776142, 1, 1, 1, 1, 1,
-0.8028105, -0.7476735, -2.993935, 0, 0, 1, 1, 1,
-0.7846408, -0.7724248, -2.702816, 1, 0, 0, 1, 1,
-0.7786834, -0.5971236, -0.9831568, 1, 0, 0, 1, 1,
-0.7684014, 0.6823732, -2.984647, 1, 0, 0, 1, 1,
-0.7633395, -0.3474833, -2.517069, 1, 0, 0, 1, 1,
-0.7624545, -0.6881539, -2.590617, 1, 0, 0, 1, 1,
-0.761265, -1.198241, -1.327818, 0, 0, 0, 1, 1,
-0.7597466, -0.169331, -1.817401, 0, 0, 0, 1, 1,
-0.75745, -0.7957877, -1.053314, 0, 0, 0, 1, 1,
-0.7565758, -0.8502047, -3.743513, 0, 0, 0, 1, 1,
-0.7483907, -0.7254315, -3.589666, 0, 0, 0, 1, 1,
-0.748018, 1.756359, 1.239524, 0, 0, 0, 1, 1,
-0.740643, -2.675672, -1.022681, 0, 0, 0, 1, 1,
-0.7383044, -0.1149482, -0.4845158, 1, 1, 1, 1, 1,
-0.7349378, 0.3046038, -1.003426, 1, 1, 1, 1, 1,
-0.7344673, 0.09390496, -3.399077, 1, 1, 1, 1, 1,
-0.731251, 2.087994, -0.1867848, 1, 1, 1, 1, 1,
-0.7247229, -1.274457, -2.171775, 1, 1, 1, 1, 1,
-0.7236512, 0.3164051, -2.383307, 1, 1, 1, 1, 1,
-0.7214363, 1.287701, -1.591103, 1, 1, 1, 1, 1,
-0.7201405, 0.4536095, -2.197745, 1, 1, 1, 1, 1,
-0.7156209, -1.556993, -2.287003, 1, 1, 1, 1, 1,
-0.7144446, 0.5640751, -2.003903, 1, 1, 1, 1, 1,
-0.7115095, -0.1468174, -0.3618505, 1, 1, 1, 1, 1,
-0.7085296, 0.1941116, -0.4530627, 1, 1, 1, 1, 1,
-0.7063687, 0.1943023, -0.7983701, 1, 1, 1, 1, 1,
-0.7026642, -0.4909027, -1.943453, 1, 1, 1, 1, 1,
-0.7009529, -0.5862036, -3.725492, 1, 1, 1, 1, 1,
-0.6973315, -0.09403957, -0.04244184, 0, 0, 1, 1, 1,
-0.6923662, 0.2166299, -1.422977, 1, 0, 0, 1, 1,
-0.6914573, 0.0562897, -1.470196, 1, 0, 0, 1, 1,
-0.69144, 0.3876493, -2.270011, 1, 0, 0, 1, 1,
-0.6850445, 0.6573845, -1.207293, 1, 0, 0, 1, 1,
-0.679052, 0.06852051, -1.158431, 1, 0, 0, 1, 1,
-0.6780668, 1.767546, -0.9064021, 0, 0, 0, 1, 1,
-0.6769283, -0.9496298, -3.324314, 0, 0, 0, 1, 1,
-0.6767938, -0.4833583, -1.353968, 0, 0, 0, 1, 1,
-0.6763783, 0.3641055, -0.5752677, 0, 0, 0, 1, 1,
-0.6697058, 0.9644967, -1.940214, 0, 0, 0, 1, 1,
-0.6671193, -0.3678273, -1.775916, 0, 0, 0, 1, 1,
-0.6668941, 0.2560967, -2.137304, 0, 0, 0, 1, 1,
-0.6666099, -0.6097411, -1.821914, 1, 1, 1, 1, 1,
-0.6637346, -0.2014411, -2.20432, 1, 1, 1, 1, 1,
-0.6628076, 1.385954, 0.7939138, 1, 1, 1, 1, 1,
-0.6618884, 0.1411335, -0.07818425, 1, 1, 1, 1, 1,
-0.6562136, 1.588646, -0.2335839, 1, 1, 1, 1, 1,
-0.6529504, -0.6593393, -2.144219, 1, 1, 1, 1, 1,
-0.6429248, 0.0650949, -2.335192, 1, 1, 1, 1, 1,
-0.6412369, 1.516456, -1.860042, 1, 1, 1, 1, 1,
-0.6396244, 0.6123708, -0.8590103, 1, 1, 1, 1, 1,
-0.6352032, 0.007223389, -2.11982, 1, 1, 1, 1, 1,
-0.6267903, -0.7159938, -2.785561, 1, 1, 1, 1, 1,
-0.6186991, -1.47026, -1.361399, 1, 1, 1, 1, 1,
-0.6181028, 0.2344578, 0.1217126, 1, 1, 1, 1, 1,
-0.6155641, -0.2639442, -1.862226, 1, 1, 1, 1, 1,
-0.6144906, -0.7723728, -3.061694, 1, 1, 1, 1, 1,
-0.6019617, 0.3966092, -1.179482, 0, 0, 1, 1, 1,
-0.595286, 1.100715, -1.140008, 1, 0, 0, 1, 1,
-0.5946428, 0.2167203, -2.026149, 1, 0, 0, 1, 1,
-0.5892761, 1.668444, 0.3187568, 1, 0, 0, 1, 1,
-0.5880755, -1.085264, -2.479725, 1, 0, 0, 1, 1,
-0.5846765, -0.9556122, -0.3463533, 1, 0, 0, 1, 1,
-0.5789374, 0.3367415, -0.4520782, 0, 0, 0, 1, 1,
-0.576185, 0.3074196, -1.281093, 0, 0, 0, 1, 1,
-0.5760707, -0.4254806, -1.776726, 0, 0, 0, 1, 1,
-0.5741659, -2.014819, -2.776267, 0, 0, 0, 1, 1,
-0.5727022, 0.4970602, -0.2658965, 0, 0, 0, 1, 1,
-0.5715705, -0.04876443, -1.411958, 0, 0, 0, 1, 1,
-0.5703784, 1.006344, -1.642406, 0, 0, 0, 1, 1,
-0.5612774, -1.054237, -2.828329, 1, 1, 1, 1, 1,
-0.5456939, -0.5205439, -4.100754, 1, 1, 1, 1, 1,
-0.5442151, 1.193525, 1.156828, 1, 1, 1, 1, 1,
-0.543859, 1.411895, -2.064682, 1, 1, 1, 1, 1,
-0.5353997, -0.2065191, -2.401993, 1, 1, 1, 1, 1,
-0.5347159, -1.378896, -1.455323, 1, 1, 1, 1, 1,
-0.5323089, 1.199099, -0.8745134, 1, 1, 1, 1, 1,
-0.5311489, -0.1480766, -1.071709, 1, 1, 1, 1, 1,
-0.5235811, 0.5255879, 0.5878932, 1, 1, 1, 1, 1,
-0.5200202, 1.047585, 1.014216, 1, 1, 1, 1, 1,
-0.516599, -1.921928, -2.973758, 1, 1, 1, 1, 1,
-0.5165582, -0.4169856, -1.571972, 1, 1, 1, 1, 1,
-0.5163592, -0.9190624, -2.246129, 1, 1, 1, 1, 1,
-0.5140619, 0.1160405, -2.051656, 1, 1, 1, 1, 1,
-0.5120991, 1.093652, -0.7066761, 1, 1, 1, 1, 1,
-0.5094983, -0.8334687, -0.01721099, 0, 0, 1, 1, 1,
-0.5077692, -2.463836, -1.242166, 1, 0, 0, 1, 1,
-0.5063283, 1.582437, -0.2855757, 1, 0, 0, 1, 1,
-0.4966015, 0.5638677, -0.3913125, 1, 0, 0, 1, 1,
-0.4963348, 0.02643144, -1.481132, 1, 0, 0, 1, 1,
-0.4960532, 0.07882418, -0.2467724, 1, 0, 0, 1, 1,
-0.4954052, -0.1615097, -2.703547, 0, 0, 0, 1, 1,
-0.4863816, -0.5706944, -2.106385, 0, 0, 0, 1, 1,
-0.4752037, -0.01042399, -1.47701, 0, 0, 0, 1, 1,
-0.4746894, 1.402165, 0.7439615, 0, 0, 0, 1, 1,
-0.4742828, 1.68696, -0.4628437, 0, 0, 0, 1, 1,
-0.4648796, -0.3157184, -5.799206, 0, 0, 0, 1, 1,
-0.4599087, 1.256905, 0.4028085, 0, 0, 0, 1, 1,
-0.4572631, 0.267364, -1.28827, 1, 1, 1, 1, 1,
-0.4555651, -0.4992011, -1.760347, 1, 1, 1, 1, 1,
-0.4547376, 1.070699, -0.7180595, 1, 1, 1, 1, 1,
-0.4517904, 0.2029362, -0.2424264, 1, 1, 1, 1, 1,
-0.4506476, -0.5771992, -2.78496, 1, 1, 1, 1, 1,
-0.44814, 1.165761, -1.795826, 1, 1, 1, 1, 1,
-0.4454935, -0.116559, -2.246582, 1, 1, 1, 1, 1,
-0.4452141, -1.2706, -3.793584, 1, 1, 1, 1, 1,
-0.4445244, -0.2760749, -1.356324, 1, 1, 1, 1, 1,
-0.4401697, -0.05699025, -0.9516141, 1, 1, 1, 1, 1,
-0.4382921, 1.889732, 0.5977399, 1, 1, 1, 1, 1,
-0.4371046, 0.150564, -0.9301308, 1, 1, 1, 1, 1,
-0.4316478, -0.8707074, -4.933475, 1, 1, 1, 1, 1,
-0.4311971, 1.384257, -0.928246, 1, 1, 1, 1, 1,
-0.4299778, 1.913196, -2.514802, 1, 1, 1, 1, 1,
-0.4256004, -1.48731, -2.512731, 0, 0, 1, 1, 1,
-0.422103, 0.8393293, -1.560991, 1, 0, 0, 1, 1,
-0.4209641, 0.1492856, -2.226011, 1, 0, 0, 1, 1,
-0.4208727, 0.4241831, -0.8463342, 1, 0, 0, 1, 1,
-0.419647, -1.874311, -1.950993, 1, 0, 0, 1, 1,
-0.4150515, 1.218321, 0.7476422, 1, 0, 0, 1, 1,
-0.4138329, 0.6147878, -0.1640337, 0, 0, 0, 1, 1,
-0.413187, 1.060804, 0.007325334, 0, 0, 0, 1, 1,
-0.412563, -3.003942, -4.745853, 0, 0, 0, 1, 1,
-0.4091524, -1.506036, -2.458688, 0, 0, 0, 1, 1,
-0.4089193, -0.04268051, -0.606617, 0, 0, 0, 1, 1,
-0.4051974, -1.654417, -3.467081, 0, 0, 0, 1, 1,
-0.4001453, 1.917374, -0.8844668, 0, 0, 0, 1, 1,
-0.3984995, 0.02502993, -2.42393, 1, 1, 1, 1, 1,
-0.3969421, -0.6283541, -2.665919, 1, 1, 1, 1, 1,
-0.3948149, 0.03854101, -1.014853, 1, 1, 1, 1, 1,
-0.3936522, 0.22986, -1.092027, 1, 1, 1, 1, 1,
-0.3925019, -1.906603, -3.4751, 1, 1, 1, 1, 1,
-0.3900094, 0.2644309, -1.016466, 1, 1, 1, 1, 1,
-0.386986, -0.05268914, -0.8401418, 1, 1, 1, 1, 1,
-0.3841839, 1.610506, 1.692569, 1, 1, 1, 1, 1,
-0.3820069, 0.7905689, 0.3315709, 1, 1, 1, 1, 1,
-0.377246, -1.501966, -2.759163, 1, 1, 1, 1, 1,
-0.3713707, -0.003201252, -2.904752, 1, 1, 1, 1, 1,
-0.3702742, -1.023373, -3.098667, 1, 1, 1, 1, 1,
-0.3679136, -0.3945127, -2.718608, 1, 1, 1, 1, 1,
-0.3658847, -0.7309024, -2.456109, 1, 1, 1, 1, 1,
-0.3594498, -0.08694205, -4.428257, 1, 1, 1, 1, 1,
-0.3592027, -1.914237, -1.881136, 0, 0, 1, 1, 1,
-0.357999, 0.4478228, -2.276724, 1, 0, 0, 1, 1,
-0.3512967, -1.861359, -3.059523, 1, 0, 0, 1, 1,
-0.3498155, 0.9184046, 0.6179925, 1, 0, 0, 1, 1,
-0.3479804, -0.4657594, -2.765336, 1, 0, 0, 1, 1,
-0.3472308, 1.470747, -0.3877022, 1, 0, 0, 1, 1,
-0.3412326, -1.010698, -3.907223, 0, 0, 0, 1, 1,
-0.3383819, 1.409385, -1.107289, 0, 0, 0, 1, 1,
-0.328955, -0.4007316, -3.967392, 0, 0, 0, 1, 1,
-0.3247696, -0.1994178, -2.637669, 0, 0, 0, 1, 1,
-0.3200389, 0.06183198, -0.1910058, 0, 0, 0, 1, 1,
-0.3165875, -0.8681413, -2.399195, 0, 0, 0, 1, 1,
-0.3151253, 0.5453573, -1.422117, 0, 0, 0, 1, 1,
-0.3138934, 0.3024127, -0.4188893, 1, 1, 1, 1, 1,
-0.3128698, -0.5298082, -2.579171, 1, 1, 1, 1, 1,
-0.305379, 0.6445859, 0.3124153, 1, 1, 1, 1, 1,
-0.3006594, 0.6907883, 1.21885, 1, 1, 1, 1, 1,
-0.2987309, -0.1604883, -1.576433, 1, 1, 1, 1, 1,
-0.2986712, -0.610926, -1.784669, 1, 1, 1, 1, 1,
-0.2983443, 1.885777, 0.9298926, 1, 1, 1, 1, 1,
-0.2976837, -1.479703, -4.128831, 1, 1, 1, 1, 1,
-0.2958511, 0.4428307, -1.427588, 1, 1, 1, 1, 1,
-0.2955651, 0.2282333, -2.641419, 1, 1, 1, 1, 1,
-0.2947896, 0.867188, -0.1119646, 1, 1, 1, 1, 1,
-0.2911304, -1.101535, -4.739119, 1, 1, 1, 1, 1,
-0.290355, -1.344582, -1.554541, 1, 1, 1, 1, 1,
-0.2885528, -0.1887794, -1.203482, 1, 1, 1, 1, 1,
-0.2841969, 0.03435201, -0.08990853, 1, 1, 1, 1, 1,
-0.2816518, -1.167164, -2.26025, 0, 0, 1, 1, 1,
-0.2736367, -1.762153, -2.857548, 1, 0, 0, 1, 1,
-0.2734576, -1.908596, -4.370919, 1, 0, 0, 1, 1,
-0.272078, 1.48544, 1.325893, 1, 0, 0, 1, 1,
-0.2706575, 1.484818, 0.7459992, 1, 0, 0, 1, 1,
-0.2667556, 0.04956898, -2.26722, 1, 0, 0, 1, 1,
-0.2663151, 1.070024, -1.25423, 0, 0, 0, 1, 1,
-0.2649398, -0.5353974, -3.460941, 0, 0, 0, 1, 1,
-0.2600855, -0.9738971, -2.835162, 0, 0, 0, 1, 1,
-0.2529562, -0.9507152, -3.704275, 0, 0, 0, 1, 1,
-0.2458905, -0.5306869, -2.591329, 0, 0, 0, 1, 1,
-0.2397026, 0.1610144, -0.3282529, 0, 0, 0, 1, 1,
-0.2382255, -0.3267557, -1.488975, 0, 0, 0, 1, 1,
-0.2370604, -1.205306, -2.039083, 1, 1, 1, 1, 1,
-0.2359413, -0.9839809, -1.444555, 1, 1, 1, 1, 1,
-0.2336802, 1.217712, 0.5618083, 1, 1, 1, 1, 1,
-0.2320114, -0.6510932, -4.68146, 1, 1, 1, 1, 1,
-0.2317408, 0.1664484, -3.759021, 1, 1, 1, 1, 1,
-0.2307699, -0.285776, -2.507725, 1, 1, 1, 1, 1,
-0.2266817, 0.5571081, -1.620566, 1, 1, 1, 1, 1,
-0.225721, -0.5921224, -3.019437, 1, 1, 1, 1, 1,
-0.2148006, -2.497718, -2.611376, 1, 1, 1, 1, 1,
-0.2144392, 0.7779493, -0.5882878, 1, 1, 1, 1, 1,
-0.2108503, -0.7518614, -2.63903, 1, 1, 1, 1, 1,
-0.207807, -0.1454661, -3.073178, 1, 1, 1, 1, 1,
-0.1995929, 0.5637061, 0.3160293, 1, 1, 1, 1, 1,
-0.1992166, 2.232943, -0.0263932, 1, 1, 1, 1, 1,
-0.1990047, 0.4300123, 0.1439562, 1, 1, 1, 1, 1,
-0.1965538, -0.2276429, -3.608557, 0, 0, 1, 1, 1,
-0.1946456, -0.1938902, -1.022158, 1, 0, 0, 1, 1,
-0.1916767, 0.6629634, 0.6968201, 1, 0, 0, 1, 1,
-0.1904626, -0.1980343, -4.805881, 1, 0, 0, 1, 1,
-0.1892119, 0.06113351, -1.604577, 1, 0, 0, 1, 1,
-0.1819777, 2.249178, 0.5749838, 1, 0, 0, 1, 1,
-0.1815571, 2.008831, 0.07495163, 0, 0, 0, 1, 1,
-0.1812318, 0.1308801, -0.501911, 0, 0, 0, 1, 1,
-0.1788888, 1.698015, -1.11552, 0, 0, 0, 1, 1,
-0.1782713, -1.349827, -2.268864, 0, 0, 0, 1, 1,
-0.1774961, 0.2369758, -0.9059361, 0, 0, 0, 1, 1,
-0.1757448, 1.014541, 1.2828, 0, 0, 0, 1, 1,
-0.174731, -0.6890711, -2.257026, 0, 0, 0, 1, 1,
-0.1729562, -1.254043, -1.201078, 1, 1, 1, 1, 1,
-0.1715694, 0.9726973, 0.4496242, 1, 1, 1, 1, 1,
-0.1713924, -1.510183, -3.44928, 1, 1, 1, 1, 1,
-0.1705361, -1.66226, -2.039926, 1, 1, 1, 1, 1,
-0.1694711, -0.2427483, -3.615801, 1, 1, 1, 1, 1,
-0.1690542, -0.4694276, -2.533637, 1, 1, 1, 1, 1,
-0.1688277, 0.6655005, 0.6030822, 1, 1, 1, 1, 1,
-0.167055, -0.3513301, -3.194193, 1, 1, 1, 1, 1,
-0.1670383, -2.276047, -4.183107, 1, 1, 1, 1, 1,
-0.1659595, 0.734792, 0.6043383, 1, 1, 1, 1, 1,
-0.1646118, 0.3904904, -0.1662837, 1, 1, 1, 1, 1,
-0.163194, -1.391717, -1.715521, 1, 1, 1, 1, 1,
-0.1624127, 0.1086691, -0.1782404, 1, 1, 1, 1, 1,
-0.1578244, 0.8677827, -0.3564903, 1, 1, 1, 1, 1,
-0.151406, 0.8374882, 0.7508749, 1, 1, 1, 1, 1,
-0.1487698, -0.1346568, -2.170214, 0, 0, 1, 1, 1,
-0.1418204, -0.6990884, -2.024918, 1, 0, 0, 1, 1,
-0.1412351, -0.7080309, -3.687561, 1, 0, 0, 1, 1,
-0.1336898, -0.2694194, -2.677601, 1, 0, 0, 1, 1,
-0.1295321, 0.08052395, 0.1927311, 1, 0, 0, 1, 1,
-0.1276595, 0.7300304, 0.05773754, 1, 0, 0, 1, 1,
-0.1267443, -1.806265, -2.616729, 0, 0, 0, 1, 1,
-0.1264973, 1.231261, -1.410009, 0, 0, 0, 1, 1,
-0.119439, 0.5128365, 1.461941, 0, 0, 0, 1, 1,
-0.1163811, 0.5007498, -0.7763383, 0, 0, 0, 1, 1,
-0.1162334, 1.352102, -0.7509185, 0, 0, 0, 1, 1,
-0.1111913, 0.5537879, -0.1419407, 0, 0, 0, 1, 1,
-0.1097378, -0.8996226, -1.682055, 0, 0, 0, 1, 1,
-0.10544, 0.1926527, 1.013768, 1, 1, 1, 1, 1,
-0.1047694, -0.7328389, -2.538398, 1, 1, 1, 1, 1,
-0.1023688, 1.279765, 0.3607973, 1, 1, 1, 1, 1,
-0.09873721, -0.02776865, -1.405031, 1, 1, 1, 1, 1,
-0.09355517, -0.7202178, -3.086189, 1, 1, 1, 1, 1,
-0.0849322, -0.7762091, -2.844093, 1, 1, 1, 1, 1,
-0.08448398, 0.1498463, 0.5319206, 1, 1, 1, 1, 1,
-0.08234147, 1.174332, -0.3201326, 1, 1, 1, 1, 1,
-0.08145192, 0.4320473, 1.369469, 1, 1, 1, 1, 1,
-0.08014215, 0.06261168, -2.388692, 1, 1, 1, 1, 1,
-0.07589713, -0.2038254, -3.044801, 1, 1, 1, 1, 1,
-0.07553495, 0.2439663, 0.07814015, 1, 1, 1, 1, 1,
-0.07209376, 0.1822078, -0.9490159, 1, 1, 1, 1, 1,
-0.07157595, 0.8507313, -1.671215, 1, 1, 1, 1, 1,
-0.06754414, -0.5322469, -3.287333, 1, 1, 1, 1, 1,
-0.06699305, 0.3367824, -1.349761, 0, 0, 1, 1, 1,
-0.06665186, -1.811701, -3.326973, 1, 0, 0, 1, 1,
-0.06385858, -0.2509099, -1.826097, 1, 0, 0, 1, 1,
-0.06343356, -1.260293, -3.238556, 1, 0, 0, 1, 1,
-0.06249867, -1.408224, -3.464043, 1, 0, 0, 1, 1,
-0.05979602, 1.23293, 0.3602663, 1, 0, 0, 1, 1,
-0.05809706, -1.342175, -4.429828, 0, 0, 0, 1, 1,
-0.05652202, -1.700335, -2.166924, 0, 0, 0, 1, 1,
-0.05569595, 0.2292262, -1.443885, 0, 0, 0, 1, 1,
-0.05344906, -0.603738, -2.729766, 0, 0, 0, 1, 1,
-0.04945482, 0.4627458, -1.875464, 0, 0, 0, 1, 1,
-0.04512222, 0.9007666, 1.528012, 0, 0, 0, 1, 1,
-0.04461113, -0.007092143, -2.818204, 0, 0, 0, 1, 1,
-0.0434614, 1.564788, -0.1640005, 1, 1, 1, 1, 1,
-0.04191768, -0.6048653, -3.987825, 1, 1, 1, 1, 1,
-0.03475986, -0.2253372, -2.330613, 1, 1, 1, 1, 1,
-0.03436887, 0.6588425, 0.5478485, 1, 1, 1, 1, 1,
-0.03380616, 1.359905, 0.1777538, 1, 1, 1, 1, 1,
-0.02841669, -0.3269272, -2.938919, 1, 1, 1, 1, 1,
-0.02825695, 0.3045227, -0.9321986, 1, 1, 1, 1, 1,
-0.02678866, 2.678131, 0.1846669, 1, 1, 1, 1, 1,
-0.02349901, 0.7664173, -1.563847, 1, 1, 1, 1, 1,
-0.02233569, -0.8420281, -3.40685, 1, 1, 1, 1, 1,
-0.02158112, -0.7817413, -3.267862, 1, 1, 1, 1, 1,
-0.01488985, -0.5504881, -4.837421, 1, 1, 1, 1, 1,
-0.01054741, -0.7629284, -4.19124, 1, 1, 1, 1, 1,
-0.009185585, -1.077323, -4.394106, 1, 1, 1, 1, 1,
-0.005748629, -1.663739, -4.007302, 1, 1, 1, 1, 1,
-0.005661503, -1.300246, -3.058757, 0, 0, 1, 1, 1,
-0.003735388, -1.511855, -1.782266, 1, 0, 0, 1, 1,
-0.001776222, 1.667012, 0.8593877, 1, 0, 0, 1, 1,
0.0155044, -0.495159, 3.388602, 1, 0, 0, 1, 1,
0.01813549, -0.929073, 4.314868, 1, 0, 0, 1, 1,
0.01906392, -2.87317, 2.150618, 1, 0, 0, 1, 1,
0.02636661, 0.7718644, 0.06421753, 0, 0, 0, 1, 1,
0.02761131, 1.523535, 0.6709333, 0, 0, 0, 1, 1,
0.03093054, 0.08726545, -0.4390421, 0, 0, 0, 1, 1,
0.03359443, 1.992432, -0.3674174, 0, 0, 0, 1, 1,
0.03520646, 1.018037, -1.458005, 0, 0, 0, 1, 1,
0.04193458, 0.2932146, 0.8750109, 0, 0, 0, 1, 1,
0.04367243, -0.443277, 2.878765, 0, 0, 0, 1, 1,
0.04630767, 0.8442819, 0.4458393, 1, 1, 1, 1, 1,
0.04881047, -0.5958081, 4.26669, 1, 1, 1, 1, 1,
0.06294039, -1.250745, 1.643816, 1, 1, 1, 1, 1,
0.06511372, -2.405343, 2.37723, 1, 1, 1, 1, 1,
0.06689364, 1.071652, 1.193804, 1, 1, 1, 1, 1,
0.06793926, 1.750031, 0.3795241, 1, 1, 1, 1, 1,
0.07059538, 0.5376099, -0.3699759, 1, 1, 1, 1, 1,
0.07164714, -0.05749545, 1.98156, 1, 1, 1, 1, 1,
0.07599171, 0.6229247, -0.7699942, 1, 1, 1, 1, 1,
0.08212238, 0.1158356, 0.4707612, 1, 1, 1, 1, 1,
0.08327505, -0.8617271, 3.005686, 1, 1, 1, 1, 1,
0.08697278, -0.1620705, 2.636488, 1, 1, 1, 1, 1,
0.08945072, -0.3743157, 1.446347, 1, 1, 1, 1, 1,
0.09371307, 1.973811, 0.597979, 1, 1, 1, 1, 1,
0.09422977, 0.8496063, -1.147076, 1, 1, 1, 1, 1,
0.09728777, 0.09510213, 1.516166, 0, 0, 1, 1, 1,
0.09756874, -0.9839002, 1.636994, 1, 0, 0, 1, 1,
0.09992977, -0.08774509, 2.253737, 1, 0, 0, 1, 1,
0.102748, 0.00128419, 0.4055073, 1, 0, 0, 1, 1,
0.1040803, 0.3371379, 0.6644088, 1, 0, 0, 1, 1,
0.1049463, 1.219267, -0.1954801, 1, 0, 0, 1, 1,
0.1062539, -1.268811, 2.683181, 0, 0, 0, 1, 1,
0.1073319, 0.7988604, -1.839879, 0, 0, 0, 1, 1,
0.1080323, -0.3900675, 1.481106, 0, 0, 0, 1, 1,
0.1134217, -0.3583093, 3.580894, 0, 0, 0, 1, 1,
0.1136115, -0.4554124, 3.175544, 0, 0, 0, 1, 1,
0.1183367, -1.575004, 4.931837, 0, 0, 0, 1, 1,
0.1185529, 1.067837, 0.4609362, 0, 0, 0, 1, 1,
0.119505, 0.3320353, 0.7591595, 1, 1, 1, 1, 1,
0.1206691, 0.1759644, 0.7021313, 1, 1, 1, 1, 1,
0.1257538, 0.5422316, -0.1102958, 1, 1, 1, 1, 1,
0.1275036, -1.437181, 2.362425, 1, 1, 1, 1, 1,
0.1340071, -0.9854258, 2.518421, 1, 1, 1, 1, 1,
0.1359176, -0.7612152, 2.333527, 1, 1, 1, 1, 1,
0.1363863, 0.7406669, 0.9420368, 1, 1, 1, 1, 1,
0.1370207, -1.323131, 2.833652, 1, 1, 1, 1, 1,
0.1380431, 1.132242, -1.103347, 1, 1, 1, 1, 1,
0.1390826, -1.105437, 3.841617, 1, 1, 1, 1, 1,
0.1462297, -0.851167, 2.657426, 1, 1, 1, 1, 1,
0.1465821, 0.2056597, 2.113717, 1, 1, 1, 1, 1,
0.1566035, -1.450908, 1.835923, 1, 1, 1, 1, 1,
0.1637763, 0.1955582, 1.490003, 1, 1, 1, 1, 1,
0.1688832, 1.827796, 0.06833458, 1, 1, 1, 1, 1,
0.1708621, 0.3933131, 0.7046596, 0, 0, 1, 1, 1,
0.1738314, 0.5457078, 0.8024663, 1, 0, 0, 1, 1,
0.1793737, 2.531365, 0.00220111, 1, 0, 0, 1, 1,
0.1835312, 0.03464407, 1.381922, 1, 0, 0, 1, 1,
0.1862166, 0.09150702, 1.273088, 1, 0, 0, 1, 1,
0.189095, -0.9851026, 4.330811, 1, 0, 0, 1, 1,
0.1899372, -0.1532388, 2.307084, 0, 0, 0, 1, 1,
0.1903553, 0.8550316, -0.003705496, 0, 0, 0, 1, 1,
0.1915003, -0.5098612, 2.577846, 0, 0, 0, 1, 1,
0.1927895, 0.7224459, 1.136168, 0, 0, 0, 1, 1,
0.1954701, -2.323102, 2.372326, 0, 0, 0, 1, 1,
0.197305, -0.564068, 3.178745, 0, 0, 0, 1, 1,
0.198733, 0.02934211, 1.671456, 0, 0, 0, 1, 1,
0.2019068, -1.247461, 4.495392, 1, 1, 1, 1, 1,
0.2023543, -0.2596045, 0.6922526, 1, 1, 1, 1, 1,
0.2036097, -1.20273, 3.175323, 1, 1, 1, 1, 1,
0.2072907, -2.182016, 1.794077, 1, 1, 1, 1, 1,
0.2115617, 0.6673723, -0.1557489, 1, 1, 1, 1, 1,
0.2117775, 0.05382582, -0.2843927, 1, 1, 1, 1, 1,
0.2124439, 0.4297952, 1.674747, 1, 1, 1, 1, 1,
0.2133481, 0.6389812, 0.5460066, 1, 1, 1, 1, 1,
0.2179181, -0.952505, 4.446656, 1, 1, 1, 1, 1,
0.2216455, 0.5324017, -0.7707304, 1, 1, 1, 1, 1,
0.2243459, 0.4647249, 0.2772482, 1, 1, 1, 1, 1,
0.2322064, -0.7988614, 3.438335, 1, 1, 1, 1, 1,
0.2330711, 0.4611821, 0.5998331, 1, 1, 1, 1, 1,
0.2382748, 0.9059117, 0.1693628, 1, 1, 1, 1, 1,
0.2426377, -0.2599384, 2.230184, 1, 1, 1, 1, 1,
0.2434906, -0.8045944, 2.392264, 0, 0, 1, 1, 1,
0.2450374, 1.503869, -0.1742251, 1, 0, 0, 1, 1,
0.2493435, 0.415974, 1.390976, 1, 0, 0, 1, 1,
0.2498479, -0.03853904, 1.999792, 1, 0, 0, 1, 1,
0.2506805, -1.618613, 0.9928989, 1, 0, 0, 1, 1,
0.2507219, -0.3551691, 3.977541, 1, 0, 0, 1, 1,
0.2512755, 1.399882, -1.798951, 0, 0, 0, 1, 1,
0.251475, -0.1744857, 1.236924, 0, 0, 0, 1, 1,
0.25257, 0.4647245, 0.5485985, 0, 0, 0, 1, 1,
0.2532383, -0.144992, 3.73335, 0, 0, 0, 1, 1,
0.2534096, -0.3743894, 2.049602, 0, 0, 0, 1, 1,
0.2534367, 0.1749736, 0.4191679, 0, 0, 0, 1, 1,
0.2541015, -0.1038554, 2.92532, 0, 0, 0, 1, 1,
0.2544796, -0.4371374, 2.64874, 1, 1, 1, 1, 1,
0.258681, 0.2881142, 1.109362, 1, 1, 1, 1, 1,
0.2624135, -2.815435, 3.875085, 1, 1, 1, 1, 1,
0.2643655, 0.2426869, 0.5596848, 1, 1, 1, 1, 1,
0.2692116, -0.3759318, 2.614089, 1, 1, 1, 1, 1,
0.275853, -1.353909, 3.121259, 1, 1, 1, 1, 1,
0.277075, 0.02621514, 0.1515176, 1, 1, 1, 1, 1,
0.2774023, 0.898747, -1.266177, 1, 1, 1, 1, 1,
0.2834672, 1.350125, -0.3369092, 1, 1, 1, 1, 1,
0.284309, -0.4662115, 2.819098, 1, 1, 1, 1, 1,
0.2909359, -1.144246, 1.890177, 1, 1, 1, 1, 1,
0.2943647, 1.946262, 1.078892, 1, 1, 1, 1, 1,
0.297558, -1.39414, 0.4114159, 1, 1, 1, 1, 1,
0.3043743, 1.30545, 1.291594, 1, 1, 1, 1, 1,
0.3044632, 1.942437, 0.04986999, 1, 1, 1, 1, 1,
0.3070329, -0.01318236, 2.646891, 0, 0, 1, 1, 1,
0.3109273, 0.05336403, 1.268835, 1, 0, 0, 1, 1,
0.3136006, 1.790427, 0.3012431, 1, 0, 0, 1, 1,
0.3201971, -0.9147174, 1.997386, 1, 0, 0, 1, 1,
0.3207627, -1.150242, 2.770405, 1, 0, 0, 1, 1,
0.3240412, 0.1037818, 2.737023, 1, 0, 0, 1, 1,
0.3254603, 0.9841489, 0.1069416, 0, 0, 0, 1, 1,
0.3274331, -0.4901245, 2.526054, 0, 0, 0, 1, 1,
0.3292444, -0.2532877, 2.580613, 0, 0, 0, 1, 1,
0.3327385, 0.5754307, 0.6094847, 0, 0, 0, 1, 1,
0.3355155, 0.041428, 3.908312, 0, 0, 0, 1, 1,
0.3381599, 0.2113678, 0.5357358, 0, 0, 0, 1, 1,
0.3403659, -0.07640817, 1.586625, 0, 0, 0, 1, 1,
0.340743, -0.2611586, 1.887647, 1, 1, 1, 1, 1,
0.3411, -2.588003, 3.467324, 1, 1, 1, 1, 1,
0.3418929, -0.9640873, 2.533238, 1, 1, 1, 1, 1,
0.3460596, 1.302488, 0.3189833, 1, 1, 1, 1, 1,
0.3551443, -1.609804, 4.864455, 1, 1, 1, 1, 1,
0.3579278, -0.1789133, 2.997842, 1, 1, 1, 1, 1,
0.3592446, -0.5127026, 1.166054, 1, 1, 1, 1, 1,
0.360462, -0.2065682, 3.277216, 1, 1, 1, 1, 1,
0.3616093, 0.6681755, 0.403617, 1, 1, 1, 1, 1,
0.3621448, 0.8035594, 2.982754, 1, 1, 1, 1, 1,
0.3678905, -1.676033, 3.430864, 1, 1, 1, 1, 1,
0.368899, -0.6053774, 1.720409, 1, 1, 1, 1, 1,
0.3697204, -0.3884453, 1.690785, 1, 1, 1, 1, 1,
0.3702651, 0.5023437, 0.5377358, 1, 1, 1, 1, 1,
0.3704708, 2.383885, -1.636217, 1, 1, 1, 1, 1,
0.3713022, 0.6444137, -0.8996098, 0, 0, 1, 1, 1,
0.3724905, 1.292175, 0.07442384, 1, 0, 0, 1, 1,
0.3805368, 0.5969578, 1.78318, 1, 0, 0, 1, 1,
0.3889328, -0.6858511, 1.685064, 1, 0, 0, 1, 1,
0.3925716, -0.4519853, 2.725517, 1, 0, 0, 1, 1,
0.3931146, 0.6234529, 0.3413042, 1, 0, 0, 1, 1,
0.3952621, 1.733947, -0.5734924, 0, 0, 0, 1, 1,
0.396928, -0.3878965, 3.625201, 0, 0, 0, 1, 1,
0.3997848, 0.6707714, 1.001238, 0, 0, 0, 1, 1,
0.4018141, -2.310815, 2.581542, 0, 0, 0, 1, 1,
0.4059612, -0.9658996, 3.693491, 0, 0, 0, 1, 1,
0.4093301, 2.56996, -1.894568, 0, 0, 0, 1, 1,
0.4139412, 1.074934, -1.416137, 0, 0, 0, 1, 1,
0.4186981, -1.098812, 1.877439, 1, 1, 1, 1, 1,
0.4195276, 1.914809, -0.8527358, 1, 1, 1, 1, 1,
0.4204353, 0.9826934, 0.3395917, 1, 1, 1, 1, 1,
0.4204638, 0.3655443, 2.426888, 1, 1, 1, 1, 1,
0.4219402, -0.3577116, 2.592884, 1, 1, 1, 1, 1,
0.429821, 1.377967, 0.1734998, 1, 1, 1, 1, 1,
0.4306372, 0.3719869, 0.527933, 1, 1, 1, 1, 1,
0.4322203, 0.337876, 1.610555, 1, 1, 1, 1, 1,
0.4372488, 0.4001303, 0.827, 1, 1, 1, 1, 1,
0.4393924, -0.6798742, 3.181816, 1, 1, 1, 1, 1,
0.4416745, -1.402445, 3.611773, 1, 1, 1, 1, 1,
0.4445866, 1.347332, 1.887367, 1, 1, 1, 1, 1,
0.4451834, 0.9223691, -0.3904396, 1, 1, 1, 1, 1,
0.4459993, 0.3019774, 1.382785, 1, 1, 1, 1, 1,
0.4465256, -2.114133, 2.763624, 1, 1, 1, 1, 1,
0.4481108, 0.3228551, 1.599097, 0, 0, 1, 1, 1,
0.4496, -0.4068629, 3.518529, 1, 0, 0, 1, 1,
0.4506629, 0.06592167, 1.553278, 1, 0, 0, 1, 1,
0.4530239, -0.8672432, 1.464396, 1, 0, 0, 1, 1,
0.4557067, -1.745477, 2.246456, 1, 0, 0, 1, 1,
0.4603442, 0.3075876, 0.9044728, 1, 0, 0, 1, 1,
0.4621364, 0.8000827, 1.594113, 0, 0, 0, 1, 1,
0.4636634, 1.087651, -0.982318, 0, 0, 0, 1, 1,
0.4636973, 0.3732554, 0.3488539, 0, 0, 0, 1, 1,
0.466978, 0.4090725, 1.508476, 0, 0, 0, 1, 1,
0.4715527, -0.4938087, 1.386509, 0, 0, 0, 1, 1,
0.4728734, -0.6699391, 0.9206616, 0, 0, 0, 1, 1,
0.4790731, 1.143886, -0.04413505, 0, 0, 0, 1, 1,
0.4796786, -0.4310896, 2.694534, 1, 1, 1, 1, 1,
0.4804588, -0.2145326, 1.51403, 1, 1, 1, 1, 1,
0.4834383, 1.379105, -0.3398738, 1, 1, 1, 1, 1,
0.4900392, 0.9456835, 0.5927771, 1, 1, 1, 1, 1,
0.4921601, 0.9917933, -0.09444407, 1, 1, 1, 1, 1,
0.494911, 0.5772358, -0.4662247, 1, 1, 1, 1, 1,
0.5021592, -1.712347, 1.90535, 1, 1, 1, 1, 1,
0.5127023, -0.1251231, 0.9122478, 1, 1, 1, 1, 1,
0.5146631, 0.2434808, 1.902917, 1, 1, 1, 1, 1,
0.5159354, -0.5498651, 2.918555, 1, 1, 1, 1, 1,
0.5212966, 1.713926, 0.3967781, 1, 1, 1, 1, 1,
0.5275548, -1.61757, 2.062974, 1, 1, 1, 1, 1,
0.5279401, 0.4325616, 0.6359653, 1, 1, 1, 1, 1,
0.5324607, -0.3103749, 1.130557, 1, 1, 1, 1, 1,
0.5349247, -1.218891, 3.345362, 1, 1, 1, 1, 1,
0.5371531, -0.8385263, 1.370379, 0, 0, 1, 1, 1,
0.540936, 0.0492077, 1.624537, 1, 0, 0, 1, 1,
0.5420626, 0.898803, 0.5562373, 1, 0, 0, 1, 1,
0.5493103, 1.343225, -0.09881485, 1, 0, 0, 1, 1,
0.5497542, -0.5895393, 2.618675, 1, 0, 0, 1, 1,
0.5502642, -0.4859319, 2.893478, 1, 0, 0, 1, 1,
0.5504352, 0.8186906, 2.736116, 0, 0, 0, 1, 1,
0.5539598, 0.89082, 0.9114095, 0, 0, 0, 1, 1,
0.5614071, 0.02249794, 0.3771254, 0, 0, 0, 1, 1,
0.5623957, -0.3509485, 0.689391, 0, 0, 0, 1, 1,
0.5626355, 0.6861924, 0.1051369, 0, 0, 0, 1, 1,
0.5641216, -1.089763, 1.636371, 0, 0, 0, 1, 1,
0.5644947, 0.3128722, -0.4045396, 0, 0, 0, 1, 1,
0.5655601, -1.38952, 0.9996964, 1, 1, 1, 1, 1,
0.5658571, 0.7680844, -0.8793266, 1, 1, 1, 1, 1,
0.5663728, -0.4995353, 2.518721, 1, 1, 1, 1, 1,
0.5709963, -0.8862996, 3.252702, 1, 1, 1, 1, 1,
0.5754483, 0.06382491, 2.263739, 1, 1, 1, 1, 1,
0.5767607, -0.5801649, 1.776458, 1, 1, 1, 1, 1,
0.5774727, 2.07625, 0.3732162, 1, 1, 1, 1, 1,
0.5808412, 0.2985982, -0.7451198, 1, 1, 1, 1, 1,
0.5908087, -0.1394281, 1.791759, 1, 1, 1, 1, 1,
0.6019698, -0.9389994, 2.940481, 1, 1, 1, 1, 1,
0.6020139, -0.5256744, 2.226964, 1, 1, 1, 1, 1,
0.6034861, -0.9134816, 4.033459, 1, 1, 1, 1, 1,
0.611275, 1.320371, 1.032014, 1, 1, 1, 1, 1,
0.611325, 0.3337719, 0.7796184, 1, 1, 1, 1, 1,
0.6120973, 0.5401582, 0.7121862, 1, 1, 1, 1, 1,
0.6128887, -0.3942733, 3.410547, 0, 0, 1, 1, 1,
0.6178815, -0.03037285, 2.166028, 1, 0, 0, 1, 1,
0.6229756, -0.5024178, 3.022273, 1, 0, 0, 1, 1,
0.6240163, -1.648109, 1.371809, 1, 0, 0, 1, 1,
0.6246194, -1.136685, 0.7521077, 1, 0, 0, 1, 1,
0.6302531, 0.2285018, -0.1713189, 1, 0, 0, 1, 1,
0.6305234, -0.4199386, 1.512629, 0, 0, 0, 1, 1,
0.6311244, -0.8856033, 2.891779, 0, 0, 0, 1, 1,
0.6311678, -0.4684328, 2.73486, 0, 0, 0, 1, 1,
0.6323354, -0.2039721, 2.243132, 0, 0, 0, 1, 1,
0.6365901, 0.5637355, 1.755204, 0, 0, 0, 1, 1,
0.6386108, 0.7251475, 0.2812666, 0, 0, 0, 1, 1,
0.6426585, -0.009778885, 0.4578968, 0, 0, 0, 1, 1,
0.6439881, -0.8086296, 1.987258, 1, 1, 1, 1, 1,
0.6457983, -0.7367184, 2.575732, 1, 1, 1, 1, 1,
0.6460688, 1.495269, -1.044703, 1, 1, 1, 1, 1,
0.6570503, -1.957581, 3.618804, 1, 1, 1, 1, 1,
0.6573279, 0.5612438, 0.7926961, 1, 1, 1, 1, 1,
0.6640384, 0.092936, 1.719209, 1, 1, 1, 1, 1,
0.6652109, 0.4655862, -0.188514, 1, 1, 1, 1, 1,
0.6697255, 0.03017875, 1.528587, 1, 1, 1, 1, 1,
0.6702679, 0.1127068, 2.781287, 1, 1, 1, 1, 1,
0.6724126, -0.7780409, 1.680833, 1, 1, 1, 1, 1,
0.676064, -0.9817597, 3.350237, 1, 1, 1, 1, 1,
0.6798322, 0.638351, 3.696484, 1, 1, 1, 1, 1,
0.6810968, 1.334603, -0.1552751, 1, 1, 1, 1, 1,
0.6874274, 0.5052713, 1.296252, 1, 1, 1, 1, 1,
0.6895521, -0.2100124, 1.095964, 1, 1, 1, 1, 1,
0.6903515, 0.630388, 2.048019, 0, 0, 1, 1, 1,
0.6959854, -1.154275, 3.832936, 1, 0, 0, 1, 1,
0.6990302, 1.121153, 0.7518454, 1, 0, 0, 1, 1,
0.7021625, -0.1679973, 0.980682, 1, 0, 0, 1, 1,
0.7051259, -1.69551, 3.793839, 1, 0, 0, 1, 1,
0.7056476, 0.228398, 2.57398, 1, 0, 0, 1, 1,
0.7064009, 0.2047905, 0.4266265, 0, 0, 0, 1, 1,
0.7093657, -0.8326014, 3.28641, 0, 0, 0, 1, 1,
0.714748, -1.503912, 3.09739, 0, 0, 0, 1, 1,
0.7178412, 0.360764, 1.825374, 0, 0, 0, 1, 1,
0.7180769, 1.102624, 1.63092, 0, 0, 0, 1, 1,
0.7183173, 0.8084587, 1.09581, 0, 0, 0, 1, 1,
0.7209838, 0.4652404, 1.903553, 0, 0, 0, 1, 1,
0.7242912, 0.4833146, 2.727924, 1, 1, 1, 1, 1,
0.7279299, 1.294571, -0.6898013, 1, 1, 1, 1, 1,
0.7307025, -2.693004, 0.4152875, 1, 1, 1, 1, 1,
0.7339904, 0.8129905, 0.4741991, 1, 1, 1, 1, 1,
0.7344833, 1.078914, 1.285879, 1, 1, 1, 1, 1,
0.7364381, 0.3532839, 0.5819839, 1, 1, 1, 1, 1,
0.7373338, -0.120852, 1.847322, 1, 1, 1, 1, 1,
0.7393559, -0.3583571, 1.458378, 1, 1, 1, 1, 1,
0.741559, 1.104715, -1.055465, 1, 1, 1, 1, 1,
0.7419003, -0.6707875, 2.067908, 1, 1, 1, 1, 1,
0.7425725, -0.6024553, 2.497899, 1, 1, 1, 1, 1,
0.7437487, -0.3429637, 2.83455, 1, 1, 1, 1, 1,
0.7457243, -0.3395312, 0.1733093, 1, 1, 1, 1, 1,
0.7459782, -2.046265, 3.041193, 1, 1, 1, 1, 1,
0.7500327, 1.644402, 0.6729149, 1, 1, 1, 1, 1,
0.7542385, -0.03131695, 1.737556, 0, 0, 1, 1, 1,
0.7553009, -1.322564, 2.475263, 1, 0, 0, 1, 1,
0.7580749, -1.268507, 1.620047, 1, 0, 0, 1, 1,
0.760689, 0.5612293, 0.6254305, 1, 0, 0, 1, 1,
0.7639319, -0.3844209, 1.21425, 1, 0, 0, 1, 1,
0.767123, 0.7860293, -1.089576, 1, 0, 0, 1, 1,
0.7686376, -0.1512821, 0.9902305, 0, 0, 0, 1, 1,
0.7709901, 0.4112342, 2.061813, 0, 0, 0, 1, 1,
0.7760643, 0.6653711, 0.4538317, 0, 0, 0, 1, 1,
0.7779011, -0.7343022, 1.017772, 0, 0, 0, 1, 1,
0.7804313, -0.4748585, 3.933266, 0, 0, 0, 1, 1,
0.7857517, -1.515377, 1.150766, 0, 0, 0, 1, 1,
0.7857887, -0.4219361, 2.140391, 0, 0, 0, 1, 1,
0.7896408, 1.365572, 1.039588, 1, 1, 1, 1, 1,
0.7928852, -0.1428948, 1.695461, 1, 1, 1, 1, 1,
0.7949663, 1.30867, -0.09158169, 1, 1, 1, 1, 1,
0.8003575, -2.430949, 3.960935, 1, 1, 1, 1, 1,
0.8030812, -0.8784994, 0.1293919, 1, 1, 1, 1, 1,
0.8061638, -0.8644944, 1.812181, 1, 1, 1, 1, 1,
0.8079849, -0.1163132, 1.292415, 1, 1, 1, 1, 1,
0.8100428, -0.274137, 1.31322, 1, 1, 1, 1, 1,
0.8107547, -1.325689, 2.12295, 1, 1, 1, 1, 1,
0.8163162, 1.177295, 1.827597, 1, 1, 1, 1, 1,
0.821205, -1.311926, 1.445029, 1, 1, 1, 1, 1,
0.8242022, 2.195967, 0.8889434, 1, 1, 1, 1, 1,
0.8258395, 0.6153607, -0.381874, 1, 1, 1, 1, 1,
0.8258668, -1.198477, 4.369842, 1, 1, 1, 1, 1,
0.8270108, -0.197787, 1.371279, 1, 1, 1, 1, 1,
0.8272707, 0.03262334, 0.3978885, 0, 0, 1, 1, 1,
0.8275081, -0.6043386, 1.780107, 1, 0, 0, 1, 1,
0.8320607, -1.22634, 3.099041, 1, 0, 0, 1, 1,
0.8399352, 0.2092521, 2.444773, 1, 0, 0, 1, 1,
0.8404359, 0.8225994, 1.704505, 1, 0, 0, 1, 1,
0.8491817, 0.009637204, 2.211567, 1, 0, 0, 1, 1,
0.8516572, -1.523446, 5.228141, 0, 0, 0, 1, 1,
0.8519046, -0.4571143, 3.009685, 0, 0, 0, 1, 1,
0.8584689, 1.134012, 1.230752, 0, 0, 0, 1, 1,
0.8672988, -0.5410207, 1.949992, 0, 0, 0, 1, 1,
0.8707595, -0.4456823, 1.793017, 0, 0, 0, 1, 1,
0.8729276, 0.6373519, 1.409281, 0, 0, 0, 1, 1,
0.87916, -0.2164079, 3.399806, 0, 0, 0, 1, 1,
0.8791787, -2.332844, 2.897189, 1, 1, 1, 1, 1,
0.8809564, 0.4742756, 1.877734, 1, 1, 1, 1, 1,
0.8873382, -0.1493511, 1.617818, 1, 1, 1, 1, 1,
0.8887057, 0.7627281, 0.7414739, 1, 1, 1, 1, 1,
0.8901888, -0.8810748, 2.542233, 1, 1, 1, 1, 1,
0.8924521, 0.986702, 0.4721372, 1, 1, 1, 1, 1,
0.8933288, 1.474469, -0.590979, 1, 1, 1, 1, 1,
0.8974101, 0.5953763, 0.2939964, 1, 1, 1, 1, 1,
0.9040235, -1.586972, 2.842049, 1, 1, 1, 1, 1,
0.9109496, 1.979486, 2.199792, 1, 1, 1, 1, 1,
0.9114208, 1.131294, 1.543412, 1, 1, 1, 1, 1,
0.9119673, -2.408789, 3.134303, 1, 1, 1, 1, 1,
0.91935, 0.2656513, 1.021108, 1, 1, 1, 1, 1,
0.9240818, -0.5705292, 3.24102, 1, 1, 1, 1, 1,
0.9270312, -0.3259429, 2.608461, 1, 1, 1, 1, 1,
0.9325231, 0.4177502, 2.555021, 0, 0, 1, 1, 1,
0.9338248, -0.950069, 3.290669, 1, 0, 0, 1, 1,
0.9346131, 1.331406, 0.02531833, 1, 0, 0, 1, 1,
0.9359329, -0.7210779, 5.994835, 1, 0, 0, 1, 1,
0.9374051, 0.1325589, 0.9923929, 1, 0, 0, 1, 1,
0.9382064, 1.754546, 0.06161036, 1, 0, 0, 1, 1,
0.9465042, -0.5308844, 3.131498, 0, 0, 0, 1, 1,
0.9512734, 0.1892215, 2.128111, 0, 0, 0, 1, 1,
0.9535104, -0.8858606, 2.046935, 0, 0, 0, 1, 1,
0.9569733, -1.374127, 4.172981, 0, 0, 0, 1, 1,
0.9580915, 0.6960602, 1.41208, 0, 0, 0, 1, 1,
0.9666047, -1.952417, 2.987165, 0, 0, 0, 1, 1,
0.9676235, 0.9537352, -0.1162199, 0, 0, 0, 1, 1,
0.9711366, 0.6280505, 1.594836, 1, 1, 1, 1, 1,
0.9753109, 1.641983, 1.520493, 1, 1, 1, 1, 1,
0.9756094, 0.8447022, 0.3426805, 1, 1, 1, 1, 1,
0.976137, -1.245376, 4.124675, 1, 1, 1, 1, 1,
0.9791225, 1.391367, 0.3011858, 1, 1, 1, 1, 1,
0.9807273, -0.1313335, 1.567979, 1, 1, 1, 1, 1,
0.9880611, -0.6624576, 2.212795, 1, 1, 1, 1, 1,
0.9981155, -1.83881, 1.079896, 1, 1, 1, 1, 1,
0.9983588, 0.5538757, 1.828612, 1, 1, 1, 1, 1,
0.9988353, 0.26576, 1.783122, 1, 1, 1, 1, 1,
1.008311, 1.31517, -0.355512, 1, 1, 1, 1, 1,
1.009866, -1.100917, 0.3087372, 1, 1, 1, 1, 1,
1.014835, -2.088037, 2.090945, 1, 1, 1, 1, 1,
1.01973, -0.8860069, 2.366515, 1, 1, 1, 1, 1,
1.020871, -0.4006588, 1.242268, 1, 1, 1, 1, 1,
1.021719, -0.4768651, 1.68531, 0, 0, 1, 1, 1,
1.022179, -1.47642, 2.00057, 1, 0, 0, 1, 1,
1.022208, -1.083269, 4.468377, 1, 0, 0, 1, 1,
1.023801, -0.2981856, 2.645758, 1, 0, 0, 1, 1,
1.027607, -0.6118349, 2.213565, 1, 0, 0, 1, 1,
1.031509, 1.886647, -0.6295665, 1, 0, 0, 1, 1,
1.032039, -0.9282537, 3.80762, 0, 0, 0, 1, 1,
1.033862, 0.4871497, 0.0004599265, 0, 0, 0, 1, 1,
1.042433, 0.8273363, 1.393789, 0, 0, 0, 1, 1,
1.045298, 0.02940101, 0.6296028, 0, 0, 0, 1, 1,
1.045563, 0.448334, 1.278594, 0, 0, 0, 1, 1,
1.04684, 1.981688, 1.268992, 0, 0, 0, 1, 1,
1.048412, -0.9380381, 2.889836, 0, 0, 0, 1, 1,
1.049311, -2.042655, 3.558969, 1, 1, 1, 1, 1,
1.055653, -0.6501361, 2.190053, 1, 1, 1, 1, 1,
1.058314, -0.3116991, 2.132383, 1, 1, 1, 1, 1,
1.059042, 0.6208616, -0.8747049, 1, 1, 1, 1, 1,
1.064792, 2.118765, 0.7673046, 1, 1, 1, 1, 1,
1.079483, 0.0624857, 1.574959, 1, 1, 1, 1, 1,
1.080246, 0.7859229, 1.56698, 1, 1, 1, 1, 1,
1.084051, 0.3107786, 2.374269, 1, 1, 1, 1, 1,
1.096509, -0.3886864, 1.035783, 1, 1, 1, 1, 1,
1.098853, 0.2866832, 2.621354, 1, 1, 1, 1, 1,
1.107548, 1.029171, 1.705141, 1, 1, 1, 1, 1,
1.107806, 0.07695501, 0.2308945, 1, 1, 1, 1, 1,
1.114223, 1.859217, 2.490923, 1, 1, 1, 1, 1,
1.1144, 1.590162, 1.164247, 1, 1, 1, 1, 1,
1.116211, 0.4344591, 1.997574, 1, 1, 1, 1, 1,
1.116985, 0.2277797, 1.7493, 0, 0, 1, 1, 1,
1.124465, 1.382327, 0.6955706, 1, 0, 0, 1, 1,
1.126481, -0.3507015, 2.900212, 1, 0, 0, 1, 1,
1.128782, -0.5166236, 3.203876, 1, 0, 0, 1, 1,
1.130408, -0.3097364, 2.803478, 1, 0, 0, 1, 1,
1.139593, -0.5873439, 2.630393, 1, 0, 0, 1, 1,
1.154725, 0.825597, 0.938349, 0, 0, 0, 1, 1,
1.159164, -0.3965828, 3.368877, 0, 0, 0, 1, 1,
1.179997, 1.583412, -0.05765426, 0, 0, 0, 1, 1,
1.184242, -0.633945, 1.451799, 0, 0, 0, 1, 1,
1.19709, 0.7838149, 1.135445, 0, 0, 0, 1, 1,
1.201773, 2.237873, -1.649269, 0, 0, 0, 1, 1,
1.204941, -0.3542015, 1.21391, 0, 0, 0, 1, 1,
1.218, -0.6698501, 1.295373, 1, 1, 1, 1, 1,
1.220094, -0.2376051, 1.706924, 1, 1, 1, 1, 1,
1.229262, 0.4375359, 0.9012938, 1, 1, 1, 1, 1,
1.235645, -1.798187, 2.772846, 1, 1, 1, 1, 1,
1.241702, 0.7089561, 2.060458, 1, 1, 1, 1, 1,
1.257072, 1.799287, 0.7092432, 1, 1, 1, 1, 1,
1.269402, 0.1472233, 2.256628, 1, 1, 1, 1, 1,
1.271227, 0.7890525, 0.06152615, 1, 1, 1, 1, 1,
1.273447, -0.1315012, 2.542438, 1, 1, 1, 1, 1,
1.278253, -0.1895148, 1.140553, 1, 1, 1, 1, 1,
1.280144, -1.380151, 4.494065, 1, 1, 1, 1, 1,
1.282093, 0.03146708, 1.877221, 1, 1, 1, 1, 1,
1.285348, -0.1659782, 3.241986, 1, 1, 1, 1, 1,
1.289939, -1.45343, 2.326586, 1, 1, 1, 1, 1,
1.292346, 0.3989323, -0.3210465, 1, 1, 1, 1, 1,
1.293152, 0.1957265, 2.132061, 0, 0, 1, 1, 1,
1.301169, 1.975474, -1.121081, 1, 0, 0, 1, 1,
1.308145, 0.8099927, 3.206591, 1, 0, 0, 1, 1,
1.316728, 1.211917, -0.06334411, 1, 0, 0, 1, 1,
1.318955, 1.297329, -0.1152669, 1, 0, 0, 1, 1,
1.324346, 2.163634, 1.360005, 1, 0, 0, 1, 1,
1.329267, -0.3183285, 1.259723, 0, 0, 0, 1, 1,
1.339872, 0.576272, 1.113309, 0, 0, 0, 1, 1,
1.349121, 1.078709, 1.214223, 0, 0, 0, 1, 1,
1.354622, -0.4013115, 3.655417, 0, 0, 0, 1, 1,
1.355333, -0.3221084, 1.461216, 0, 0, 0, 1, 1,
1.360781, -0.6983929, 3.220063, 0, 0, 0, 1, 1,
1.364791, -0.1890367, 0.2565091, 0, 0, 0, 1, 1,
1.367818, -0.3785448, 1.883627, 1, 1, 1, 1, 1,
1.373752, -1.195004, 2.75955, 1, 1, 1, 1, 1,
1.377322, 0.6103362, 0.9476331, 1, 1, 1, 1, 1,
1.378964, -1.101429, 2.532652, 1, 1, 1, 1, 1,
1.388177, 0.7277457, 0.8393275, 1, 1, 1, 1, 1,
1.388702, 2.052358, 1.28793, 1, 1, 1, 1, 1,
1.401442, -1.412341, 1.333106, 1, 1, 1, 1, 1,
1.405815, -0.2310261, 1.392461, 1, 1, 1, 1, 1,
1.407758, -0.4528669, 0.1996863, 1, 1, 1, 1, 1,
1.411774, 2.028103, 2.484544, 1, 1, 1, 1, 1,
1.413456, 0.7353363, 0.9777155, 1, 1, 1, 1, 1,
1.424692, -0.6066569, 2.605339, 1, 1, 1, 1, 1,
1.427571, -0.4935784, 3.625381, 1, 1, 1, 1, 1,
1.429295, -1.779814, 2.840028, 1, 1, 1, 1, 1,
1.443284, -0.1085707, 0.3850248, 1, 1, 1, 1, 1,
1.447117, 0.3966452, -0.4680139, 0, 0, 1, 1, 1,
1.448991, -1.51283, 3.861468, 1, 0, 0, 1, 1,
1.452966, 1.079623, 2.029708, 1, 0, 0, 1, 1,
1.456003, 0.1808123, 1.750299, 1, 0, 0, 1, 1,
1.465381, -0.5706453, -0.3416823, 1, 0, 0, 1, 1,
1.471373, 1.066573, 1.247135, 1, 0, 0, 1, 1,
1.47619, 0.6261754, 0.4796946, 0, 0, 0, 1, 1,
1.480343, 1.34833, 1.989645, 0, 0, 0, 1, 1,
1.497355, 0.682383, 0.2194504, 0, 0, 0, 1, 1,
1.502975, -1.173207, 1.775349, 0, 0, 0, 1, 1,
1.509904, -1.243952, 3.611101, 0, 0, 0, 1, 1,
1.515949, 0.6608284, 2.900247, 0, 0, 0, 1, 1,
1.518694, 2.005131, 0.6037647, 0, 0, 0, 1, 1,
1.518716, 1.846134, 2.019446, 1, 1, 1, 1, 1,
1.522749, -0.5604261, 1.254954, 1, 1, 1, 1, 1,
1.526475, -0.5361454, 3.203803, 1, 1, 1, 1, 1,
1.527358, -0.6233581, 1.195632, 1, 1, 1, 1, 1,
1.543816, 0.03343666, 2.771111, 1, 1, 1, 1, 1,
1.548499, -0.9727143, 2.248567, 1, 1, 1, 1, 1,
1.550695, 0.7646671, -0.3329035, 1, 1, 1, 1, 1,
1.551487, 0.6756528, 1.221949, 1, 1, 1, 1, 1,
1.556552, -0.5268399, 1.860597, 1, 1, 1, 1, 1,
1.578645, -0.2067654, 4.052646, 1, 1, 1, 1, 1,
1.593486, -0.5203642, 2.336024, 1, 1, 1, 1, 1,
1.593646, 0.4489166, 3.234637, 1, 1, 1, 1, 1,
1.59405, -0.06984826, 1.925502, 1, 1, 1, 1, 1,
1.601116, -0.02247946, 2.33627, 1, 1, 1, 1, 1,
1.603273, 0.610994, 2.632888, 1, 1, 1, 1, 1,
1.614777, 0.826256, 0.2344849, 0, 0, 1, 1, 1,
1.621329, -0.5497993, 1.434087, 1, 0, 0, 1, 1,
1.621788, -0.3022696, 1.087127, 1, 0, 0, 1, 1,
1.625119, -0.3309587, 2.412954, 1, 0, 0, 1, 1,
1.641604, -0.7242478, 2.952393, 1, 0, 0, 1, 1,
1.645893, 0.6240313, 1.628417, 1, 0, 0, 1, 1,
1.646424, 0.7911686, -0.3683437, 0, 0, 0, 1, 1,
1.653309, -0.09944412, 1.668007, 0, 0, 0, 1, 1,
1.653452, -0.8965427, 3.911275, 0, 0, 0, 1, 1,
1.662621, 0.3892648, 0.1164724, 0, 0, 0, 1, 1,
1.66399, -2.635874, 2.759309, 0, 0, 0, 1, 1,
1.68621, -2.450193, 1.431192, 0, 0, 0, 1, 1,
1.693946, -0.06482344, 2.004299, 0, 0, 0, 1, 1,
1.697612, 0.4379963, 0.5568545, 1, 1, 1, 1, 1,
1.722191, 1.634365, 1.219478, 1, 1, 1, 1, 1,
1.775204, -1.534058, 3.134825, 1, 1, 1, 1, 1,
1.776584, 1.491069, 2.24425, 1, 1, 1, 1, 1,
1.802771, -1.537766, 2.181353, 1, 1, 1, 1, 1,
1.849743, -1.814039, 2.623356, 1, 1, 1, 1, 1,
1.863602, -0.2715199, 2.480518, 1, 1, 1, 1, 1,
1.865039, 0.3526541, 1.60739, 1, 1, 1, 1, 1,
1.899423, -0.1941811, 0.741443, 1, 1, 1, 1, 1,
1.913643, -0.1403299, 3.466952, 1, 1, 1, 1, 1,
1.929102, -0.6756858, 2.116718, 1, 1, 1, 1, 1,
1.944158, 1.629057, -0.106808, 1, 1, 1, 1, 1,
1.948708, -0.04430498, 2.226864, 1, 1, 1, 1, 1,
1.949274, -1.769431, 0.7228715, 1, 1, 1, 1, 1,
1.970306, -1.188333, 0.8644273, 1, 1, 1, 1, 1,
2.009068, -2.424343, 5.61363, 0, 0, 1, 1, 1,
2.015834, -0.147788, 0.7874203, 1, 0, 0, 1, 1,
2.025325, 1.263965, 2.761412, 1, 0, 0, 1, 1,
2.073558, -1.275509, 3.157535, 1, 0, 0, 1, 1,
2.093242, -0.04205389, 1.628218, 1, 0, 0, 1, 1,
2.107186, 1.208566, 0.5705202, 1, 0, 0, 1, 1,
2.158249, 0.3586849, 0.6830871, 0, 0, 0, 1, 1,
2.185517, 0.9332931, 1.764423, 0, 0, 0, 1, 1,
2.316848, -0.1547064, 1.386389, 0, 0, 0, 1, 1,
2.327047, 1.10449, 1.914923, 0, 0, 0, 1, 1,
2.332238, -0.9855034, 2.947287, 0, 0, 0, 1, 1,
2.411921, 0.06257997, 2.068412, 0, 0, 0, 1, 1,
2.43318, 1.381874, 1.690056, 0, 0, 0, 1, 1,
2.45082, -1.407256, 1.896051, 1, 1, 1, 1, 1,
2.46637, 0.9952761, 1.5165, 1, 1, 1, 1, 1,
2.604325, -2.268067, 2.198635, 1, 1, 1, 1, 1,
2.748111, -1.20418, 1.294439, 1, 1, 1, 1, 1,
2.775189, -1.429222, 1.3239, 1, 1, 1, 1, 1,
3.229944, -0.6187229, 1.635602, 1, 1, 1, 1, 1,
3.356717, 0.7672739, 0.5682974, 1, 1, 1, 1, 1
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
var radius = 9.867563;
var distance = 34.6594;
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
mvMatrix.translate( -0.09671259, 0.1629055, -0.0978148 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6594);
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
