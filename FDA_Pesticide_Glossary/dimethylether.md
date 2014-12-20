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
-3.177393, 1.456491, 0.5019066, 1, 0, 0, 1,
-3.062843, -1.479069, -1.627395, 1, 0.007843138, 0, 1,
-2.77822, -0.06232247, -2.193261, 1, 0.01176471, 0, 1,
-2.538302, -0.6159781, -1.997961, 1, 0.01960784, 0, 1,
-2.501369, 1.900687, -1.484529, 1, 0.02352941, 0, 1,
-2.340342, 0.09837453, 0.7732871, 1, 0.03137255, 0, 1,
-2.330445, -1.065079, -2.325291, 1, 0.03529412, 0, 1,
-2.293416, -0.9812073, -2.439125, 1, 0.04313726, 0, 1,
-2.25959, 0.971412, 0.08729474, 1, 0.04705882, 0, 1,
-2.231108, -0.3016413, -0.9856052, 1, 0.05490196, 0, 1,
-2.20925, 0.6794784, -1.354248, 1, 0.05882353, 0, 1,
-2.168603, 0.4022334, -2.350734, 1, 0.06666667, 0, 1,
-2.148565, 0.3592597, -0.8918044, 1, 0.07058824, 0, 1,
-2.137715, -0.3990897, -1.255132, 1, 0.07843138, 0, 1,
-2.132609, -0.8101577, -3.371377, 1, 0.08235294, 0, 1,
-2.126157, 1.103307, -1.948314, 1, 0.09019608, 0, 1,
-2.093636, 0.03188752, -1.079275, 1, 0.09411765, 0, 1,
-2.048614, -0.5064701, -2.828133, 1, 0.1019608, 0, 1,
-2.04511, -0.3099667, -1.513336, 1, 0.1098039, 0, 1,
-2.040848, -0.6159474, -0.03260706, 1, 0.1137255, 0, 1,
-2.037138, 0.2259879, -3.074501, 1, 0.1215686, 0, 1,
-2.005593, 0.1106954, -1.234704, 1, 0.1254902, 0, 1,
-1.946272, 0.3275198, -2.208965, 1, 0.1333333, 0, 1,
-1.92433, 0.1450464, -2.153746, 1, 0.1372549, 0, 1,
-1.910133, -0.7532285, -3.16677, 1, 0.145098, 0, 1,
-1.889581, -0.5426791, -0.5668792, 1, 0.1490196, 0, 1,
-1.79201, 1.239447, -0.05555689, 1, 0.1568628, 0, 1,
-1.787734, -3.019063, -3.115679, 1, 0.1607843, 0, 1,
-1.766317, -0.6027938, -3.125574, 1, 0.1686275, 0, 1,
-1.742272, -0.1734553, -0.9481608, 1, 0.172549, 0, 1,
-1.720742, -0.7080807, -1.597311, 1, 0.1803922, 0, 1,
-1.70464, -1.080946, -1.699561, 1, 0.1843137, 0, 1,
-1.701958, -0.03110024, -1.862771, 1, 0.1921569, 0, 1,
-1.697598, 1.329822, -1.110165, 1, 0.1960784, 0, 1,
-1.697105, 1.295192, -2.421784, 1, 0.2039216, 0, 1,
-1.685336, 1.786361, 0.2812, 1, 0.2117647, 0, 1,
-1.681202, -2.269129, -0.7544184, 1, 0.2156863, 0, 1,
-1.677454, -1.338557, -1.462233, 1, 0.2235294, 0, 1,
-1.668975, 0.6123973, 0.2727874, 1, 0.227451, 0, 1,
-1.655553, 0.0996734, -2.386085, 1, 0.2352941, 0, 1,
-1.649204, -0.3172698, -0.08543514, 1, 0.2392157, 0, 1,
-1.636924, 0.5234566, -0.8291891, 1, 0.2470588, 0, 1,
-1.622937, -0.4253885, -1.81089, 1, 0.2509804, 0, 1,
-1.60465, 0.5983534, -3.087783, 1, 0.2588235, 0, 1,
-1.601033, 0.08745135, -1.297475, 1, 0.2627451, 0, 1,
-1.591035, -0.3652735, -1.974417, 1, 0.2705882, 0, 1,
-1.581952, 0.2973189, -0.4099518, 1, 0.2745098, 0, 1,
-1.577737, 0.8436892, -0.935701, 1, 0.282353, 0, 1,
-1.562853, 0.256659, -2.196448, 1, 0.2862745, 0, 1,
-1.559648, 0.4065199, -2.207186, 1, 0.2941177, 0, 1,
-1.548663, -0.3623799, -2.045716, 1, 0.3019608, 0, 1,
-1.542699, -0.6712518, -1.143006, 1, 0.3058824, 0, 1,
-1.526396, 0.6393396, -1.517852, 1, 0.3137255, 0, 1,
-1.520778, -0.8677524, -2.112297, 1, 0.3176471, 0, 1,
-1.507228, 1.283931, -0.2511668, 1, 0.3254902, 0, 1,
-1.502803, -0.1861142, -4.782398, 1, 0.3294118, 0, 1,
-1.500016, 0.434746, -0.8713572, 1, 0.3372549, 0, 1,
-1.484183, -0.574383, -1.613818, 1, 0.3411765, 0, 1,
-1.483297, -0.3385226, -1.448211, 1, 0.3490196, 0, 1,
-1.481026, 0.5482228, -1.055653, 1, 0.3529412, 0, 1,
-1.48058, -0.3614451, -1.969899, 1, 0.3607843, 0, 1,
-1.475276, 0.8071402, -2.081634, 1, 0.3647059, 0, 1,
-1.464823, 0.3220414, -1.621619, 1, 0.372549, 0, 1,
-1.433923, -1.128052, -2.520859, 1, 0.3764706, 0, 1,
-1.433805, 2.008706, -1.438643, 1, 0.3843137, 0, 1,
-1.428058, -1.059466, -2.822963, 1, 0.3882353, 0, 1,
-1.427572, 0.0200655, -1.030676, 1, 0.3960784, 0, 1,
-1.42671, 0.6068314, -0.8161534, 1, 0.4039216, 0, 1,
-1.426393, -0.3161682, -1.326763, 1, 0.4078431, 0, 1,
-1.423534, 0.6277881, -0.6857499, 1, 0.4156863, 0, 1,
-1.418886, -1.071096, -2.109672, 1, 0.4196078, 0, 1,
-1.409623, 0.2438583, 1.246867, 1, 0.427451, 0, 1,
-1.398715, -0.9614508, -1.1556, 1, 0.4313726, 0, 1,
-1.390126, -0.980702, -2.67889, 1, 0.4392157, 0, 1,
-1.38573, 1.09246, -0.6924941, 1, 0.4431373, 0, 1,
-1.383713, 1.604915, -1.933262, 1, 0.4509804, 0, 1,
-1.379723, 0.8646712, -0.0949762, 1, 0.454902, 0, 1,
-1.37517, 0.88474, -2.430815, 1, 0.4627451, 0, 1,
-1.373877, -2.010442, -2.132431, 1, 0.4666667, 0, 1,
-1.360854, -0.9418339, -1.3172, 1, 0.4745098, 0, 1,
-1.354765, -0.9979884, -2.168604, 1, 0.4784314, 0, 1,
-1.351815, -0.2487597, -2.29757, 1, 0.4862745, 0, 1,
-1.351588, -1.776789, -3.975308, 1, 0.4901961, 0, 1,
-1.34441, 1.95888, -1.522081, 1, 0.4980392, 0, 1,
-1.34115, -0.2869616, -2.635014, 1, 0.5058824, 0, 1,
-1.339933, 1.100514, -0.7433805, 1, 0.509804, 0, 1,
-1.330297, 0.4156334, -1.018034, 1, 0.5176471, 0, 1,
-1.327874, -0.3282311, -0.1227102, 1, 0.5215687, 0, 1,
-1.32603, -0.4705163, -1.976255, 1, 0.5294118, 0, 1,
-1.322828, 0.03761338, -1.168229, 1, 0.5333334, 0, 1,
-1.316758, -1.221847, -2.639355, 1, 0.5411765, 0, 1,
-1.311064, -0.4228004, -0.5921622, 1, 0.5450981, 0, 1,
-1.302807, -0.3075739, -1.133759, 1, 0.5529412, 0, 1,
-1.301463, -0.3488174, -0.6330302, 1, 0.5568628, 0, 1,
-1.300478, 0.5599225, -1.434082, 1, 0.5647059, 0, 1,
-1.290869, -0.00172057, -1.490775, 1, 0.5686275, 0, 1,
-1.279802, -0.5166621, -1.909707, 1, 0.5764706, 0, 1,
-1.268786, -0.342456, -1.335801, 1, 0.5803922, 0, 1,
-1.262044, -0.2004826, -0.8752195, 1, 0.5882353, 0, 1,
-1.261161, -1.188825, -3.67201, 1, 0.5921569, 0, 1,
-1.257919, -0.333006, -2.121542, 1, 0.6, 0, 1,
-1.254867, 1.562213, -0.8162468, 1, 0.6078432, 0, 1,
-1.253313, -1.076232, -0.6810673, 1, 0.6117647, 0, 1,
-1.243799, -0.06213369, -0.8464961, 1, 0.6196079, 0, 1,
-1.23907, 0.8319976, -0.372966, 1, 0.6235294, 0, 1,
-1.235469, 0.4258739, -4.378843, 1, 0.6313726, 0, 1,
-1.226536, 1.270043, -0.9759293, 1, 0.6352941, 0, 1,
-1.225684, 0.998462, -2.021883, 1, 0.6431373, 0, 1,
-1.223913, -1.418219, -2.559003, 1, 0.6470588, 0, 1,
-1.223106, -0.8034029, -2.655351, 1, 0.654902, 0, 1,
-1.214941, 0.7353016, -1.577646, 1, 0.6588235, 0, 1,
-1.213178, 0.4479882, -2.967576, 1, 0.6666667, 0, 1,
-1.208531, -0.02882893, -2.628044, 1, 0.6705883, 0, 1,
-1.20287, -0.355806, -0.3668318, 1, 0.6784314, 0, 1,
-1.201672, 1.096842, -0.03955614, 1, 0.682353, 0, 1,
-1.189878, -0.7054832, -2.807368, 1, 0.6901961, 0, 1,
-1.189626, 0.3029495, -2.785711, 1, 0.6941177, 0, 1,
-1.185621, 0.5948876, 0.310234, 1, 0.7019608, 0, 1,
-1.184204, 1.144182, -0.7906021, 1, 0.7098039, 0, 1,
-1.181153, 2.167332, -0.9957829, 1, 0.7137255, 0, 1,
-1.179782, -1.029887, -3.707897, 1, 0.7215686, 0, 1,
-1.179739, -0.8925955, -0.1667416, 1, 0.7254902, 0, 1,
-1.177372, 0.8679644, -2.070132, 1, 0.7333333, 0, 1,
-1.176764, -1.284639, -2.355205, 1, 0.7372549, 0, 1,
-1.175707, -0.2937649, -1.913391, 1, 0.7450981, 0, 1,
-1.168562, -0.8030105, -0.7798303, 1, 0.7490196, 0, 1,
-1.166719, 0.9187478, -2.051694, 1, 0.7568628, 0, 1,
-1.160315, -0.6778586, -2.746969, 1, 0.7607843, 0, 1,
-1.159174, 0.9303845, -0.1804266, 1, 0.7686275, 0, 1,
-1.156788, 0.3359405, -2.144707, 1, 0.772549, 0, 1,
-1.144879, -0.9332689, -1.444788, 1, 0.7803922, 0, 1,
-1.144557, -2.051942, -2.430016, 1, 0.7843137, 0, 1,
-1.142028, 0.7005326, -1.691045, 1, 0.7921569, 0, 1,
-1.140988, -0.06196096, -3.26164, 1, 0.7960784, 0, 1,
-1.137732, -1.023412, -2.682201, 1, 0.8039216, 0, 1,
-1.133105, -0.6440933, -1.673623, 1, 0.8117647, 0, 1,
-1.129192, -1.02485, -3.88729, 1, 0.8156863, 0, 1,
-1.125441, 1.443335, -0.9994341, 1, 0.8235294, 0, 1,
-1.121638, -1.480615, -3.044616, 1, 0.827451, 0, 1,
-1.114625, 2.210831, 0.9206446, 1, 0.8352941, 0, 1,
-1.112865, -0.6067332, -3.397804, 1, 0.8392157, 0, 1,
-1.110644, 0.2676915, -2.302525, 1, 0.8470588, 0, 1,
-1.102071, 0.3500772, -0.4135415, 1, 0.8509804, 0, 1,
-1.094126, -0.686341, -2.514477, 1, 0.8588235, 0, 1,
-1.085732, -0.1874236, -1.279617, 1, 0.8627451, 0, 1,
-1.083231, 2.511849, -0.6543207, 1, 0.8705882, 0, 1,
-1.078242, 0.6011941, -1.925728, 1, 0.8745098, 0, 1,
-1.075152, -0.8191098, -3.535369, 1, 0.8823529, 0, 1,
-1.071389, -1.021525, -0.6290271, 1, 0.8862745, 0, 1,
-1.061809, 0.9912438, 0.0868296, 1, 0.8941177, 0, 1,
-1.060517, 0.967842, -1.281416, 1, 0.8980392, 0, 1,
-1.05857, 0.3053167, -3.107608, 1, 0.9058824, 0, 1,
-1.056978, -1.259847, -2.658358, 1, 0.9137255, 0, 1,
-1.04811, -0.2999071, -2.32161, 1, 0.9176471, 0, 1,
-1.041302, 1.461542, -0.2656228, 1, 0.9254902, 0, 1,
-1.029848, 1.618433, -0.679773, 1, 0.9294118, 0, 1,
-1.028264, 0.8327374, -0.2267953, 1, 0.9372549, 0, 1,
-1.01678, -0.4769958, -3.329579, 1, 0.9411765, 0, 1,
-1.011453, -1.03435, -2.077215, 1, 0.9490196, 0, 1,
-1.007313, -0.6413643, -2.984089, 1, 0.9529412, 0, 1,
-1.003612, -0.3064796, -3.087579, 1, 0.9607843, 0, 1,
-1.003211, 1.475151, 1.159659, 1, 0.9647059, 0, 1,
-0.9982088, -0.7117991, -1.339458, 1, 0.972549, 0, 1,
-0.9941794, -0.04235047, -1.717725, 1, 0.9764706, 0, 1,
-0.9923502, 0.6687071, -2.189118, 1, 0.9843137, 0, 1,
-0.9864879, 0.5514192, 0.7389206, 1, 0.9882353, 0, 1,
-0.9808424, 0.4017083, -0.4528145, 1, 0.9960784, 0, 1,
-0.9770817, 1.272141, -2.701173, 0.9960784, 1, 0, 1,
-0.9698706, -0.9161599, -1.824811, 0.9921569, 1, 0, 1,
-0.965829, 0.8811905, -1.837166, 0.9843137, 1, 0, 1,
-0.9653227, 1.935475, -1.347995, 0.9803922, 1, 0, 1,
-0.9630987, -0.3260058, -1.530962, 0.972549, 1, 0, 1,
-0.9540738, 0.155578, -1.263616, 0.9686275, 1, 0, 1,
-0.9488564, 0.3590189, -0.9927903, 0.9607843, 1, 0, 1,
-0.9483701, -0.4432088, -2.554813, 0.9568627, 1, 0, 1,
-0.9461687, -0.6088, -2.07891, 0.9490196, 1, 0, 1,
-0.9435462, -0.8846741, -2.88834, 0.945098, 1, 0, 1,
-0.931595, -0.1143291, -0.1952668, 0.9372549, 1, 0, 1,
-0.9260651, -3.082647, -3.551914, 0.9333333, 1, 0, 1,
-0.9080403, 1.039206, -2.325428, 0.9254902, 1, 0, 1,
-0.8954746, -0.5038132, -2.059309, 0.9215686, 1, 0, 1,
-0.8839889, -0.900659, -1.790601, 0.9137255, 1, 0, 1,
-0.8762537, -1.209331, -1.543138, 0.9098039, 1, 0, 1,
-0.8745837, 0.2505066, -0.675159, 0.9019608, 1, 0, 1,
-0.8719404, 0.1007896, -3.167129, 0.8941177, 1, 0, 1,
-0.8709822, 0.7094151, -0.7940249, 0.8901961, 1, 0, 1,
-0.8708584, 0.3062919, -1.142094, 0.8823529, 1, 0, 1,
-0.8675681, 0.8059193, -1.5691, 0.8784314, 1, 0, 1,
-0.8625184, 1.303156, -2.718155, 0.8705882, 1, 0, 1,
-0.8619521, 1.067317, -0.06589381, 0.8666667, 1, 0, 1,
-0.8582877, -1.224336, -1.268585, 0.8588235, 1, 0, 1,
-0.8512666, -1.829144, -3.150989, 0.854902, 1, 0, 1,
-0.8470111, 0.1103891, -1.853725, 0.8470588, 1, 0, 1,
-0.8426666, 1.002787, -0.9968151, 0.8431373, 1, 0, 1,
-0.837714, 2.595587, 1.233914, 0.8352941, 1, 0, 1,
-0.8308697, 0.2628848, -1.061225, 0.8313726, 1, 0, 1,
-0.8300335, 0.5720429, -1.474446, 0.8235294, 1, 0, 1,
-0.8298165, -0.5559074, -2.373091, 0.8196079, 1, 0, 1,
-0.8272139, -0.5276219, -2.245258, 0.8117647, 1, 0, 1,
-0.8261942, 0.3060304, -2.386193, 0.8078431, 1, 0, 1,
-0.8241714, -0.260387, -2.761173, 0.8, 1, 0, 1,
-0.8212998, 0.0001459546, -2.169888, 0.7921569, 1, 0, 1,
-0.8196491, 1.096771, 1.185425, 0.7882353, 1, 0, 1,
-0.8159192, 0.8498752, 0.2032835, 0.7803922, 1, 0, 1,
-0.8154386, -0.3504396, -1.654391, 0.7764706, 1, 0, 1,
-0.8140053, 0.5305626, -0.4504681, 0.7686275, 1, 0, 1,
-0.8132499, 2.165769, 0.4339791, 0.7647059, 1, 0, 1,
-0.8072286, -0.6193109, -2.175518, 0.7568628, 1, 0, 1,
-0.8056422, -2.113742, -4.316467, 0.7529412, 1, 0, 1,
-0.8016968, -0.4101657, -1.580061, 0.7450981, 1, 0, 1,
-0.8013152, -0.04710025, -2.235667, 0.7411765, 1, 0, 1,
-0.7906212, 0.2079656, -0.9529883, 0.7333333, 1, 0, 1,
-0.7891056, -0.8220719, -2.347171, 0.7294118, 1, 0, 1,
-0.7773572, 0.490592, -2.846132, 0.7215686, 1, 0, 1,
-0.7762231, 0.2041219, -2.306748, 0.7176471, 1, 0, 1,
-0.7760055, 0.04237267, -2.965455, 0.7098039, 1, 0, 1,
-0.7735815, -0.07044068, -2.245741, 0.7058824, 1, 0, 1,
-0.7678228, 1.05814, -1.749193, 0.6980392, 1, 0, 1,
-0.7643669, 0.03705114, -2.011156, 0.6901961, 1, 0, 1,
-0.760792, 0.2836765, -1.222475, 0.6862745, 1, 0, 1,
-0.7548197, -0.9545738, -1.962995, 0.6784314, 1, 0, 1,
-0.7531531, -0.8867329, -3.776944, 0.6745098, 1, 0, 1,
-0.7496113, 0.8123977, -0.9944718, 0.6666667, 1, 0, 1,
-0.7483364, -0.5159255, -2.387261, 0.6627451, 1, 0, 1,
-0.7463332, -0.4920772, -1.876108, 0.654902, 1, 0, 1,
-0.7461962, 0.9223589, 0.5226283, 0.6509804, 1, 0, 1,
-0.7420046, 1.203797, -1.018575, 0.6431373, 1, 0, 1,
-0.7395692, -0.4640358, -2.358857, 0.6392157, 1, 0, 1,
-0.7384407, -1.128188, -1.924995, 0.6313726, 1, 0, 1,
-0.7376441, 0.1674715, -1.366349, 0.627451, 1, 0, 1,
-0.7223809, -0.1994571, -1.598332, 0.6196079, 1, 0, 1,
-0.710234, -0.2089538, 0.01431959, 0.6156863, 1, 0, 1,
-0.7093802, -0.5000544, -2.067794, 0.6078432, 1, 0, 1,
-0.7005655, 0.1921314, -1.569783, 0.6039216, 1, 0, 1,
-0.7001321, 0.6474169, 0.4674305, 0.5960785, 1, 0, 1,
-0.699333, -0.6128793, -1.496951, 0.5882353, 1, 0, 1,
-0.6971862, 1.336901, -2.200118, 0.5843138, 1, 0, 1,
-0.6943545, 1.339957, 0.2706511, 0.5764706, 1, 0, 1,
-0.6890422, -1.017317, -1.978018, 0.572549, 1, 0, 1,
-0.6846316, 0.3180977, -3.982499, 0.5647059, 1, 0, 1,
-0.6845226, 0.04451901, -1.335981, 0.5607843, 1, 0, 1,
-0.6844553, 0.5745457, -1.557418, 0.5529412, 1, 0, 1,
-0.6812679, -0.4389957, -2.67355, 0.5490196, 1, 0, 1,
-0.680867, -0.1802587, -2.433587, 0.5411765, 1, 0, 1,
-0.6733074, -2.012527, -1.680226, 0.5372549, 1, 0, 1,
-0.6642066, 1.108715, -0.959575, 0.5294118, 1, 0, 1,
-0.6606747, -0.759204, -1.646727, 0.5254902, 1, 0, 1,
-0.6560826, 0.5481852, -0.5773509, 0.5176471, 1, 0, 1,
-0.6550758, 0.6943827, -1.233279, 0.5137255, 1, 0, 1,
-0.6516234, -1.742604, -2.24251, 0.5058824, 1, 0, 1,
-0.6512294, 0.5830622, -0.7226462, 0.5019608, 1, 0, 1,
-0.6503941, 0.3308653, -0.8763136, 0.4941176, 1, 0, 1,
-0.6477149, -0.8378071, -1.800862, 0.4862745, 1, 0, 1,
-0.6475399, -0.232106, -0.07177692, 0.4823529, 1, 0, 1,
-0.6447108, 0.9227968, 1.167466, 0.4745098, 1, 0, 1,
-0.6425315, 1.005486, -1.82353, 0.4705882, 1, 0, 1,
-0.6252252, 1.152868, 0.08746961, 0.4627451, 1, 0, 1,
-0.6244228, 1.439953, 0.2489311, 0.4588235, 1, 0, 1,
-0.6233184, 0.364241, -1.609364, 0.4509804, 1, 0, 1,
-0.6159182, -0.9193293, -2.25929, 0.4470588, 1, 0, 1,
-0.6137358, 0.6453335, -0.9733173, 0.4392157, 1, 0, 1,
-0.6129645, 2.455724, -1.1705, 0.4352941, 1, 0, 1,
-0.6124315, 0.004662732, -2.552116, 0.427451, 1, 0, 1,
-0.612345, 0.8103783, -1.586085, 0.4235294, 1, 0, 1,
-0.6021145, 0.128725, -2.047083, 0.4156863, 1, 0, 1,
-0.597882, 0.4262651, -0.1147898, 0.4117647, 1, 0, 1,
-0.5904363, -0.3060226, -3.408307, 0.4039216, 1, 0, 1,
-0.5830743, 0.2619985, -2.392888, 0.3960784, 1, 0, 1,
-0.5828744, 0.2975257, -1.460445, 0.3921569, 1, 0, 1,
-0.5781478, 0.8731998, -1.470098, 0.3843137, 1, 0, 1,
-0.573239, -1.678143, -2.393941, 0.3803922, 1, 0, 1,
-0.5671619, -1.812517, -2.086385, 0.372549, 1, 0, 1,
-0.5653492, -0.9497858, -2.948926, 0.3686275, 1, 0, 1,
-0.5639322, 0.3951275, 0.3878676, 0.3607843, 1, 0, 1,
-0.5574362, -1.025073, -3.500829, 0.3568628, 1, 0, 1,
-0.5555683, -1.425544, -2.126089, 0.3490196, 1, 0, 1,
-0.5505404, 0.3303173, -2.951745, 0.345098, 1, 0, 1,
-0.5502388, 0.4885865, -0.650488, 0.3372549, 1, 0, 1,
-0.5496289, 0.3730204, -0.749401, 0.3333333, 1, 0, 1,
-0.549188, 1.126402, -1.059856, 0.3254902, 1, 0, 1,
-0.5466691, 0.6907694, -2.261806, 0.3215686, 1, 0, 1,
-0.5445674, 0.50138, -1.580292, 0.3137255, 1, 0, 1,
-0.5434372, 2.161893, -1.567507, 0.3098039, 1, 0, 1,
-0.539924, 2.150689, 0.01891487, 0.3019608, 1, 0, 1,
-0.5295167, 0.4884911, -1.504346, 0.2941177, 1, 0, 1,
-0.5279132, 0.709294, 0.6147447, 0.2901961, 1, 0, 1,
-0.5206684, -1.620955, -4.735563, 0.282353, 1, 0, 1,
-0.5176145, -1.145795, -3.156583, 0.2784314, 1, 0, 1,
-0.516554, 0.1056562, -0.02901085, 0.2705882, 1, 0, 1,
-0.5120005, 0.2786776, -0.4166086, 0.2666667, 1, 0, 1,
-0.5079669, -1.761065, -1.473024, 0.2588235, 1, 0, 1,
-0.5022144, 2.034313, -0.0993793, 0.254902, 1, 0, 1,
-0.5009992, 0.1480903, -1.802062, 0.2470588, 1, 0, 1,
-0.4956709, 1.242667, -1.783397, 0.2431373, 1, 0, 1,
-0.4939718, -0.2363529, -1.611291, 0.2352941, 1, 0, 1,
-0.4938543, 0.8033763, 0.1586859, 0.2313726, 1, 0, 1,
-0.4913198, -1.358317, -3.037922, 0.2235294, 1, 0, 1,
-0.4903837, -1.486296, -5.724904, 0.2196078, 1, 0, 1,
-0.4883762, 0.396266, -1.704705, 0.2117647, 1, 0, 1,
-0.4878972, -0.1856514, -2.76792, 0.2078431, 1, 0, 1,
-0.474013, -2.309725, -2.174536, 0.2, 1, 0, 1,
-0.4737087, 1.208232, 0.1058318, 0.1921569, 1, 0, 1,
-0.4674045, -1.725639, -2.746408, 0.1882353, 1, 0, 1,
-0.466052, 1.148976, 0.4081614, 0.1803922, 1, 0, 1,
-0.4646823, 0.2862547, -0.6776682, 0.1764706, 1, 0, 1,
-0.4635517, -1.51565, -4.173347, 0.1686275, 1, 0, 1,
-0.4617703, 0.7220072, -1.920532, 0.1647059, 1, 0, 1,
-0.4614795, 0.6843584, 0.6351941, 0.1568628, 1, 0, 1,
-0.4514626, 1.239901, -0.3998635, 0.1529412, 1, 0, 1,
-0.4475639, -0.326141, -2.544659, 0.145098, 1, 0, 1,
-0.4444378, 0.2905346, -0.7325208, 0.1411765, 1, 0, 1,
-0.441359, -0.3992777, -1.94826, 0.1333333, 1, 0, 1,
-0.440906, 1.702398, 0.377435, 0.1294118, 1, 0, 1,
-0.4407074, 1.178206, -1.163578, 0.1215686, 1, 0, 1,
-0.4396643, 0.02307164, -2.334183, 0.1176471, 1, 0, 1,
-0.4391158, -0.02995883, -0.5163817, 0.1098039, 1, 0, 1,
-0.4372302, -0.6827334, -2.477127, 0.1058824, 1, 0, 1,
-0.4369939, 0.1975117, -0.5245413, 0.09803922, 1, 0, 1,
-0.4297523, 0.9788676, 0.2253588, 0.09019608, 1, 0, 1,
-0.4286865, 1.511924, 2.629222, 0.08627451, 1, 0, 1,
-0.4277067, -1.00479, -3.067826, 0.07843138, 1, 0, 1,
-0.4203676, -0.7192435, -3.359956, 0.07450981, 1, 0, 1,
-0.4111461, 1.305373, -0.2048751, 0.06666667, 1, 0, 1,
-0.4079189, 1.150985, 0.007866981, 0.0627451, 1, 0, 1,
-0.4078187, -1.730713, -2.284106, 0.05490196, 1, 0, 1,
-0.4049515, -1.194421, -2.547651, 0.05098039, 1, 0, 1,
-0.4029446, 1.224471, -2.206905, 0.04313726, 1, 0, 1,
-0.4021508, -0.3618711, -2.794883, 0.03921569, 1, 0, 1,
-0.3985322, 0.4149061, -1.169801, 0.03137255, 1, 0, 1,
-0.3980162, -0.06216535, -0.6716022, 0.02745098, 1, 0, 1,
-0.3942018, 0.3213916, -2.135834, 0.01960784, 1, 0, 1,
-0.3921401, -0.733877, -2.078874, 0.01568628, 1, 0, 1,
-0.3874432, -1.323714, -1.357724, 0.007843138, 1, 0, 1,
-0.3834135, -0.4611811, -4.013351, 0.003921569, 1, 0, 1,
-0.3784451, -1.958717, -3.882024, 0, 1, 0.003921569, 1,
-0.3771597, 0.7530978, -0.7968915, 0, 1, 0.01176471, 1,
-0.3694595, 1.177583, -0.8096957, 0, 1, 0.01568628, 1,
-0.3680938, -0.5538958, -3.597933, 0, 1, 0.02352941, 1,
-0.3650832, -1.70078, -2.767787, 0, 1, 0.02745098, 1,
-0.3647498, -0.8881783, -2.341199, 0, 1, 0.03529412, 1,
-0.3645065, -1.789399, -5.046028, 0, 1, 0.03921569, 1,
-0.3627884, 0.289499, -2.41944, 0, 1, 0.04705882, 1,
-0.3597515, 2.391182, -1.31403, 0, 1, 0.05098039, 1,
-0.3593081, -1.82955, -2.357151, 0, 1, 0.05882353, 1,
-0.357042, -1.455373, -3.964029, 0, 1, 0.0627451, 1,
-0.3564376, 1.374793, 0.8446217, 0, 1, 0.07058824, 1,
-0.3541376, -0.6276578, -2.255468, 0, 1, 0.07450981, 1,
-0.351643, -0.3648699, -2.15026, 0, 1, 0.08235294, 1,
-0.3499634, 0.8275613, -0.609325, 0, 1, 0.08627451, 1,
-0.3475123, -0.927949, -2.778106, 0, 1, 0.09411765, 1,
-0.338654, 0.09781206, -1.10949, 0, 1, 0.1019608, 1,
-0.3382683, 0.1733815, -0.4601489, 0, 1, 0.1058824, 1,
-0.337022, 1.056742, -0.3861576, 0, 1, 0.1137255, 1,
-0.334616, -0.1676287, -1.570324, 0, 1, 0.1176471, 1,
-0.3341953, -0.5522178, -4.716666, 0, 1, 0.1254902, 1,
-0.3321462, 1.091988, 0.6513665, 0, 1, 0.1294118, 1,
-0.3317073, 0.5929879, -2.87606, 0, 1, 0.1372549, 1,
-0.3284425, 0.705775, -0.2784048, 0, 1, 0.1411765, 1,
-0.3271325, 2.370881, 0.193416, 0, 1, 0.1490196, 1,
-0.3192027, -2.627568, -2.28311, 0, 1, 0.1529412, 1,
-0.3191672, -0.6874257, -3.190076, 0, 1, 0.1607843, 1,
-0.31659, -0.9431615, -1.534079, 0, 1, 0.1647059, 1,
-0.3105768, 0.1800219, -2.665272, 0, 1, 0.172549, 1,
-0.3102399, 0.7800191, -2.528261, 0, 1, 0.1764706, 1,
-0.3101344, 0.08706892, -3.291159, 0, 1, 0.1843137, 1,
-0.3076396, 1.137158, 0.5369972, 0, 1, 0.1882353, 1,
-0.3048294, -0.1730382, -2.541629, 0, 1, 0.1960784, 1,
-0.3009335, -0.1100058, -0.2526325, 0, 1, 0.2039216, 1,
-0.3008923, -0.7819145, -2.612522, 0, 1, 0.2078431, 1,
-0.2984962, -0.2206578, -1.385976, 0, 1, 0.2156863, 1,
-0.297024, 0.5513938, -2.148754, 0, 1, 0.2196078, 1,
-0.2887873, 0.8670413, -0.4685823, 0, 1, 0.227451, 1,
-0.2883858, 0.4471115, 0.6870893, 0, 1, 0.2313726, 1,
-0.2865035, -0.6308222, -2.939019, 0, 1, 0.2392157, 1,
-0.2834006, 1.928785, -0.05026829, 0, 1, 0.2431373, 1,
-0.282432, 1.165022, -0.900966, 0, 1, 0.2509804, 1,
-0.2784759, 0.9014157, -1.008324, 0, 1, 0.254902, 1,
-0.2762035, 0.5112776, -2.037851, 0, 1, 0.2627451, 1,
-0.2761947, 0.3737522, 1.243251, 0, 1, 0.2666667, 1,
-0.2710894, 0.2678834, 0.02369009, 0, 1, 0.2745098, 1,
-0.2693798, -0.003085757, -0.9011019, 0, 1, 0.2784314, 1,
-0.2660631, 0.4652148, -0.4854086, 0, 1, 0.2862745, 1,
-0.2592362, -1.00666, -4.222462, 0, 1, 0.2901961, 1,
-0.2553931, 0.09651562, -1.784779, 0, 1, 0.2980392, 1,
-0.2542967, 0.09390219, -2.882477, 0, 1, 0.3058824, 1,
-0.2533997, 0.02229197, -1.98349, 0, 1, 0.3098039, 1,
-0.2488034, -0.006599888, -1.957999, 0, 1, 0.3176471, 1,
-0.2483665, 0.6902708, -0.792734, 0, 1, 0.3215686, 1,
-0.2482043, -0.7732196, -2.103521, 0, 1, 0.3294118, 1,
-0.2474729, -1.101865, -1.77058, 0, 1, 0.3333333, 1,
-0.2408055, -0.3286738, -2.519965, 0, 1, 0.3411765, 1,
-0.2367273, 0.5530443, -0.5671775, 0, 1, 0.345098, 1,
-0.2320324, 0.7336714, -0.2619694, 0, 1, 0.3529412, 1,
-0.2300958, -0.2208298, -2.02187, 0, 1, 0.3568628, 1,
-0.2297383, 0.4796929, -1.932912, 0, 1, 0.3647059, 1,
-0.2289035, -0.6690693, -2.591247, 0, 1, 0.3686275, 1,
-0.2086063, -0.7614123, -3.755441, 0, 1, 0.3764706, 1,
-0.2082013, -1.245612, -2.743753, 0, 1, 0.3803922, 1,
-0.2080299, 0.1604714, -0.882952, 0, 1, 0.3882353, 1,
-0.2051011, 2.132486, -1.080422, 0, 1, 0.3921569, 1,
-0.2016508, -0.8920662, -2.484898, 0, 1, 0.4, 1,
-0.1972508, -0.7993196, -3.455721, 0, 1, 0.4078431, 1,
-0.1970892, -0.214543, -2.460246, 0, 1, 0.4117647, 1,
-0.1932113, 0.5148821, 0.6051928, 0, 1, 0.4196078, 1,
-0.1847841, -1.056524, -3.261721, 0, 1, 0.4235294, 1,
-0.1773149, -0.8158754, -4.827928, 0, 1, 0.4313726, 1,
-0.1768993, -1.204198, -4.698865, 0, 1, 0.4352941, 1,
-0.1756662, -0.1178226, -1.538151, 0, 1, 0.4431373, 1,
-0.17457, 0.4567662, -1.664804, 0, 1, 0.4470588, 1,
-0.1600864, 0.5713862, 1.496515, 0, 1, 0.454902, 1,
-0.1526261, -1.285737, -2.737951, 0, 1, 0.4588235, 1,
-0.1504326, -0.8818301, -1.273891, 0, 1, 0.4666667, 1,
-0.14861, 2.967072, -0.6536247, 0, 1, 0.4705882, 1,
-0.1426713, -0.2889182, -3.145948, 0, 1, 0.4784314, 1,
-0.1406709, -1.737407, -2.364452, 0, 1, 0.4823529, 1,
-0.1307905, 1.132682, 1.016078, 0, 1, 0.4901961, 1,
-0.1302072, -2.013595, -3.303493, 0, 1, 0.4941176, 1,
-0.1286922, -0.0628401, -2.21714, 0, 1, 0.5019608, 1,
-0.1263687, 1.576063, 0.260422, 0, 1, 0.509804, 1,
-0.126195, -0.6018285, -2.946594, 0, 1, 0.5137255, 1,
-0.1221777, -0.4195596, -3.298654, 0, 1, 0.5215687, 1,
-0.1193815, 1.472236, 0.3508737, 0, 1, 0.5254902, 1,
-0.1186345, 0.7716746, -1.013572, 0, 1, 0.5333334, 1,
-0.1168602, 1.273495, 0.577785, 0, 1, 0.5372549, 1,
-0.1142931, 0.2666723, -2.92716, 0, 1, 0.5450981, 1,
-0.1142129, 0.561968, -0.3682688, 0, 1, 0.5490196, 1,
-0.1094688, 0.7146656, 1.314232, 0, 1, 0.5568628, 1,
-0.1082868, 0.3537695, -1.66919, 0, 1, 0.5607843, 1,
-0.1078796, 1.716328, 2.526443, 0, 1, 0.5686275, 1,
-0.1048098, 1.498271, -1.25076, 0, 1, 0.572549, 1,
-0.09935609, -0.005129911, -1.568062, 0, 1, 0.5803922, 1,
-0.09704011, 0.5114372, -0.3431424, 0, 1, 0.5843138, 1,
-0.09479865, -0.001153494, -1.918201, 0, 1, 0.5921569, 1,
-0.09390417, -1.831183, -5.044051, 0, 1, 0.5960785, 1,
-0.092373, 0.6082363, 0.1014261, 0, 1, 0.6039216, 1,
-0.08634367, 0.1508717, -0.5481794, 0, 1, 0.6117647, 1,
-0.08606102, -0.3432603, -2.836608, 0, 1, 0.6156863, 1,
-0.08468959, 1.007177, 0.1490755, 0, 1, 0.6235294, 1,
-0.08285329, -0.6124135, -3.388895, 0, 1, 0.627451, 1,
-0.08136563, -0.5362306, -2.924194, 0, 1, 0.6352941, 1,
-0.07832856, 1.253179, 1.473878, 0, 1, 0.6392157, 1,
-0.07078835, 0.3317401, -1.028416, 0, 1, 0.6470588, 1,
-0.07048752, -1.508031, -2.734204, 0, 1, 0.6509804, 1,
-0.06757681, 0.805407, 0.1797861, 0, 1, 0.6588235, 1,
-0.06208661, -0.7472149, -3.715616, 0, 1, 0.6627451, 1,
-0.05705207, -0.1428277, -2.392526, 0, 1, 0.6705883, 1,
-0.05630742, 0.413307, 0.6391212, 0, 1, 0.6745098, 1,
-0.05625055, 1.521584, -0.3358993, 0, 1, 0.682353, 1,
-0.05584291, 1.397856, 0.337146, 0, 1, 0.6862745, 1,
-0.05401845, 0.893399, -1.655755, 0, 1, 0.6941177, 1,
-0.05356793, -0.6302767, -1.594688, 0, 1, 0.7019608, 1,
-0.05308185, 0.0005746434, -0.3006736, 0, 1, 0.7058824, 1,
-0.0511899, -1.839578, -2.448791, 0, 1, 0.7137255, 1,
-0.05080688, 0.3223161, 0.4488585, 0, 1, 0.7176471, 1,
-0.04816565, -0.2356838, -3.894069, 0, 1, 0.7254902, 1,
-0.04765948, -0.6291605, -3.066826, 0, 1, 0.7294118, 1,
-0.04634678, 2.668319, 1.554939, 0, 1, 0.7372549, 1,
-0.04312566, 0.08147315, 0.08626173, 0, 1, 0.7411765, 1,
-0.0408696, 0.346557, -0.3562565, 0, 1, 0.7490196, 1,
-0.04017054, -2.96281, -2.464689, 0, 1, 0.7529412, 1,
-0.0352339, -0.5699899, -3.518271, 0, 1, 0.7607843, 1,
-0.03245043, -0.5932506, -2.862461, 0, 1, 0.7647059, 1,
-0.02940659, 1.155473, -2.263587, 0, 1, 0.772549, 1,
-0.02754917, 0.8948639, -0.4618239, 0, 1, 0.7764706, 1,
-0.02667828, -0.6291468, -2.4732, 0, 1, 0.7843137, 1,
-0.0259063, 0.1452301, -0.817988, 0, 1, 0.7882353, 1,
-0.0245514, -0.4669217, -2.239473, 0, 1, 0.7960784, 1,
-0.02411729, 0.5587276, 1.045571, 0, 1, 0.8039216, 1,
-0.02340959, -0.1836355, -2.531702, 0, 1, 0.8078431, 1,
-0.01780603, -0.3280841, -3.856138, 0, 1, 0.8156863, 1,
-0.006741616, 0.4464432, -0.1641499, 0, 1, 0.8196079, 1,
-0.006600509, 0.1292215, 0.3079162, 0, 1, 0.827451, 1,
-0.003718685, 1.682419, 1.095805, 0, 1, 0.8313726, 1,
0.0001177198, 1.724528, 0.4105219, 0, 1, 0.8392157, 1,
0.002139075, -0.06050541, 3.248407, 0, 1, 0.8431373, 1,
0.003437278, -0.6557202, 2.04251, 0, 1, 0.8509804, 1,
0.003869207, -1.158986, 1.356109, 0, 1, 0.854902, 1,
0.006844213, 0.06229069, -0.1666344, 0, 1, 0.8627451, 1,
0.00748922, 0.04197002, -0.2310494, 0, 1, 0.8666667, 1,
0.008506828, 1.073725, -0.05236176, 0, 1, 0.8745098, 1,
0.01250902, -0.2152506, 1.877557, 0, 1, 0.8784314, 1,
0.01867973, -1.518141, 2.002766, 0, 1, 0.8862745, 1,
0.01986652, -0.4436403, 3.379934, 0, 1, 0.8901961, 1,
0.02106118, 1.164601, 1.622791, 0, 1, 0.8980392, 1,
0.02283301, -0.5072683, 4.125335, 0, 1, 0.9058824, 1,
0.02316848, -0.7803883, 2.873204, 0, 1, 0.9098039, 1,
0.02332293, 1.021287, 0.07622977, 0, 1, 0.9176471, 1,
0.02336191, 0.9274288, -1.923662, 0, 1, 0.9215686, 1,
0.02412455, -0.4029619, 5.321409, 0, 1, 0.9294118, 1,
0.02588574, 0.2424647, -1.313457, 0, 1, 0.9333333, 1,
0.02679312, 0.591938, -0.7711607, 0, 1, 0.9411765, 1,
0.02787119, -0.02486193, 3.509043, 0, 1, 0.945098, 1,
0.03178991, 0.9084249, 0.3383666, 0, 1, 0.9529412, 1,
0.03185763, -1.236307, 3.219368, 0, 1, 0.9568627, 1,
0.03567443, 0.9989601, 0.1572462, 0, 1, 0.9647059, 1,
0.03957447, -1.125329, 4.360897, 0, 1, 0.9686275, 1,
0.04505743, 1.55194, 1.171547, 0, 1, 0.9764706, 1,
0.04887663, 2.871555, 1.325964, 0, 1, 0.9803922, 1,
0.04926747, 0.6314477, 0.3171147, 0, 1, 0.9882353, 1,
0.05252228, -1.43469, 4.353231, 0, 1, 0.9921569, 1,
0.055005, 0.6493796, -0.6327133, 0, 1, 1, 1,
0.05562596, -1.741528, 3.922882, 0, 0.9921569, 1, 1,
0.05774131, 1.431595, 1.513719, 0, 0.9882353, 1, 1,
0.06313834, 1.795925, 0.8616636, 0, 0.9803922, 1, 1,
0.06728667, -0.1069505, 2.077675, 0, 0.9764706, 1, 1,
0.07781408, 0.3316717, 1.067775, 0, 0.9686275, 1, 1,
0.08240493, 1.856083, -0.2926489, 0, 0.9647059, 1, 1,
0.0844214, -0.7525674, 1.579564, 0, 0.9568627, 1, 1,
0.08687259, 1.670445, 1.288914, 0, 0.9529412, 1, 1,
0.08722638, 0.3913376, 1.064911, 0, 0.945098, 1, 1,
0.08763254, 0.9240864, 0.7568812, 0, 0.9411765, 1, 1,
0.08956293, 0.7303056, 0.6663754, 0, 0.9333333, 1, 1,
0.08956618, 3.057292, -1.344318, 0, 0.9294118, 1, 1,
0.09127092, -0.3379171, 3.65937, 0, 0.9215686, 1, 1,
0.09193807, -0.3193231, 2.42696, 0, 0.9176471, 1, 1,
0.09376639, -1.29863, 3.906556, 0, 0.9098039, 1, 1,
0.09644924, 0.8771762, -1.220752, 0, 0.9058824, 1, 1,
0.1002791, -1.527737, 3.240712, 0, 0.8980392, 1, 1,
0.1014866, 0.4205891, -0.7816505, 0, 0.8901961, 1, 1,
0.1073143, 0.2980031, 1.329401, 0, 0.8862745, 1, 1,
0.1073535, 1.086285, 1.101288, 0, 0.8784314, 1, 1,
0.1119104, 0.1694929, 1.227154, 0, 0.8745098, 1, 1,
0.1124873, 1.131891, -1.110516, 0, 0.8666667, 1, 1,
0.1130209, 1.123048, 0.7493859, 0, 0.8627451, 1, 1,
0.1158976, -0.5535677, 2.438736, 0, 0.854902, 1, 1,
0.1191269, -1.757, 2.718594, 0, 0.8509804, 1, 1,
0.1193616, -1.135885, 4.268309, 0, 0.8431373, 1, 1,
0.1223165, -0.7956957, 3.283057, 0, 0.8392157, 1, 1,
0.1343562, -1.013826, 3.139419, 0, 0.8313726, 1, 1,
0.1366471, 0.1152794, 1.603979, 0, 0.827451, 1, 1,
0.1431331, -0.5718635, 2.456944, 0, 0.8196079, 1, 1,
0.1438962, -0.870441, 2.48061, 0, 0.8156863, 1, 1,
0.1493388, 1.252658, 0.6702843, 0, 0.8078431, 1, 1,
0.1511678, -0.9278107, 3.354712, 0, 0.8039216, 1, 1,
0.1513716, -1.79634, 3.710419, 0, 0.7960784, 1, 1,
0.1562088, 1.630412, 0.2569956, 0, 0.7882353, 1, 1,
0.1569656, -0.1914365, 5.502237, 0, 0.7843137, 1, 1,
0.1569822, -1.762824, 1.548444, 0, 0.7764706, 1, 1,
0.1653088, -1.467147, 2.582131, 0, 0.772549, 1, 1,
0.1661974, 1.318138, 0.7864324, 0, 0.7647059, 1, 1,
0.1663399, -0.7609661, 2.028155, 0, 0.7607843, 1, 1,
0.1674716, -0.4475717, 1.81021, 0, 0.7529412, 1, 1,
0.169811, 2.19078, 1.23303, 0, 0.7490196, 1, 1,
0.176469, 1.926482, -0.2112319, 0, 0.7411765, 1, 1,
0.1765288, 0.4048458, 2.180146, 0, 0.7372549, 1, 1,
0.1785948, 1.385335, -0.2685566, 0, 0.7294118, 1, 1,
0.1799286, 0.2057908, -0.8085788, 0, 0.7254902, 1, 1,
0.1814273, -1.104699, 2.9693, 0, 0.7176471, 1, 1,
0.1823866, 1.227178, -0.0391029, 0, 0.7137255, 1, 1,
0.1846881, 1.366442, -2.044684, 0, 0.7058824, 1, 1,
0.1853052, -0.4763904, 2.046219, 0, 0.6980392, 1, 1,
0.1890379, -2.121617, 3.490827, 0, 0.6941177, 1, 1,
0.1896868, -0.2292559, 2.1638, 0, 0.6862745, 1, 1,
0.1899627, -0.9455551, 3.000052, 0, 0.682353, 1, 1,
0.192596, 0.1067938, 1.239808, 0, 0.6745098, 1, 1,
0.1972261, -0.160201, 3.032254, 0, 0.6705883, 1, 1,
0.1977131, 0.7047699, 0.9553105, 0, 0.6627451, 1, 1,
0.1992657, 1.863213, 1.01171, 0, 0.6588235, 1, 1,
0.2069062, 1.87192, 0.02051742, 0, 0.6509804, 1, 1,
0.2101681, 0.1034212, 1.499614, 0, 0.6470588, 1, 1,
0.2113172, 0.02475327, 2.313589, 0, 0.6392157, 1, 1,
0.2138751, 0.2931695, 0.1102426, 0, 0.6352941, 1, 1,
0.2178448, -1.811742, 3.550607, 0, 0.627451, 1, 1,
0.2185363, 0.1654172, 0.5035552, 0, 0.6235294, 1, 1,
0.2190704, 1.554798, 0.3323288, 0, 0.6156863, 1, 1,
0.2245574, -1.613499, 3.211298, 0, 0.6117647, 1, 1,
0.2289004, -1.42673, 2.381664, 0, 0.6039216, 1, 1,
0.231232, -0.5184498, 2.371822, 0, 0.5960785, 1, 1,
0.2388003, -2.073861, 5.272004, 0, 0.5921569, 1, 1,
0.2390237, 0.4135219, 1.472845, 0, 0.5843138, 1, 1,
0.2391582, 0.6758218, 0.9250011, 0, 0.5803922, 1, 1,
0.24038, -0.1925538, 2.816508, 0, 0.572549, 1, 1,
0.2475214, -0.3164426, 4.253111, 0, 0.5686275, 1, 1,
0.249077, 1.682981, 0.5325638, 0, 0.5607843, 1, 1,
0.2519392, 0.6072243, 0.8754542, 0, 0.5568628, 1, 1,
0.2526949, -0.7444862, 0.4534432, 0, 0.5490196, 1, 1,
0.253212, -0.8872343, 1.895901, 0, 0.5450981, 1, 1,
0.260498, 1.159996, 0.01328491, 0, 0.5372549, 1, 1,
0.2622503, -0.1378116, 2.688025, 0, 0.5333334, 1, 1,
0.2676431, -0.14805, 1.631254, 0, 0.5254902, 1, 1,
0.2677732, -0.3299064, 3.040102, 0, 0.5215687, 1, 1,
0.2680323, 0.6694927, -1.949224, 0, 0.5137255, 1, 1,
0.2714538, -0.1091265, 0.5139406, 0, 0.509804, 1, 1,
0.2739322, -0.06942867, 1.228478, 0, 0.5019608, 1, 1,
0.275122, 0.009098073, 0.3942864, 0, 0.4941176, 1, 1,
0.2778846, -1.142967, 4.435308, 0, 0.4901961, 1, 1,
0.2807177, -1.414095, 4.078468, 0, 0.4823529, 1, 1,
0.2847145, 1.07709, 0.936782, 0, 0.4784314, 1, 1,
0.2903889, 1.739302, -0.4965915, 0, 0.4705882, 1, 1,
0.2940083, -1.410607, 3.431222, 0, 0.4666667, 1, 1,
0.296448, -1.701767, 4.478647, 0, 0.4588235, 1, 1,
0.2993921, 0.1240671, 2.295583, 0, 0.454902, 1, 1,
0.3012817, 0.242258, 2.393292, 0, 0.4470588, 1, 1,
0.3029579, -0.6100502, 3.040421, 0, 0.4431373, 1, 1,
0.3044755, -0.8670136, 2.902025, 0, 0.4352941, 1, 1,
0.305372, 0.4014548, 1.754848, 0, 0.4313726, 1, 1,
0.3064866, -0.8409335, 3.111121, 0, 0.4235294, 1, 1,
0.3108329, -0.3904991, 1.662828, 0, 0.4196078, 1, 1,
0.3150604, 0.3244531, 2.331364, 0, 0.4117647, 1, 1,
0.3153188, -1.800356, 3.574605, 0, 0.4078431, 1, 1,
0.3172287, -1.211609, 4.059789, 0, 0.4, 1, 1,
0.3190705, -1.240822, 1.77363, 0, 0.3921569, 1, 1,
0.3199202, 0.1005288, 1.14835, 0, 0.3882353, 1, 1,
0.3213827, 2.060246, -1.373751, 0, 0.3803922, 1, 1,
0.3243519, -0.4941708, 2.907512, 0, 0.3764706, 1, 1,
0.3264781, -0.003204051, 0.9590309, 0, 0.3686275, 1, 1,
0.3278344, 1.526026, 0.1746192, 0, 0.3647059, 1, 1,
0.3296546, 0.588786, 0.5229955, 0, 0.3568628, 1, 1,
0.3297017, -0.910854, 3.788761, 0, 0.3529412, 1, 1,
0.3310645, -0.3581556, 2.661742, 0, 0.345098, 1, 1,
0.3315274, 0.04309264, 0.1436268, 0, 0.3411765, 1, 1,
0.3359313, 1.37783, -0.8192175, 0, 0.3333333, 1, 1,
0.3364275, 0.5622435, 2.778318, 0, 0.3294118, 1, 1,
0.3372582, 0.4200587, -1.112929, 0, 0.3215686, 1, 1,
0.3511397, 1.069069, 1.328447, 0, 0.3176471, 1, 1,
0.3521213, -0.8810413, 2.527035, 0, 0.3098039, 1, 1,
0.3531406, 0.2559793, 0.6139426, 0, 0.3058824, 1, 1,
0.3565727, 0.2662559, 1.107869, 0, 0.2980392, 1, 1,
0.3642922, -0.01735048, 0.639506, 0, 0.2901961, 1, 1,
0.3667903, 1.398595, -0.1756413, 0, 0.2862745, 1, 1,
0.3668558, -0.2591093, 1.876201, 0, 0.2784314, 1, 1,
0.368249, -0.2487736, 3.101853, 0, 0.2745098, 1, 1,
0.373494, -1.660819, 3.989352, 0, 0.2666667, 1, 1,
0.3815686, -0.03070324, 1.170536, 0, 0.2627451, 1, 1,
0.3855057, 1.141775, 0.8105121, 0, 0.254902, 1, 1,
0.386014, -0.7686362, 2.066877, 0, 0.2509804, 1, 1,
0.3876969, -0.6370792, 2.464686, 0, 0.2431373, 1, 1,
0.3877518, -0.4234596, 2.245308, 0, 0.2392157, 1, 1,
0.3881854, -0.5282927, 0.5065187, 0, 0.2313726, 1, 1,
0.3894056, 0.5620868, 0.3449517, 0, 0.227451, 1, 1,
0.3895828, 0.5028806, 1.166493, 0, 0.2196078, 1, 1,
0.3914024, 1.980606, 1.431491, 0, 0.2156863, 1, 1,
0.397316, 1.033842, 0.0302503, 0, 0.2078431, 1, 1,
0.4000533, 0.1811633, 1.044767, 0, 0.2039216, 1, 1,
0.4029499, -2.032074, 2.967022, 0, 0.1960784, 1, 1,
0.4045492, -1.045434, 2.675541, 0, 0.1882353, 1, 1,
0.4051452, -0.1744627, 2.548896, 0, 0.1843137, 1, 1,
0.4053262, -0.8618312, 3.650293, 0, 0.1764706, 1, 1,
0.4072321, 1.599905, 1.775673, 0, 0.172549, 1, 1,
0.4092692, -1.18295, 2.662095, 0, 0.1647059, 1, 1,
0.4112918, -3.600377, 2.976395, 0, 0.1607843, 1, 1,
0.4189438, 1.253695, -0.8088528, 0, 0.1529412, 1, 1,
0.4200312, -0.9401737, 2.644716, 0, 0.1490196, 1, 1,
0.4222153, 0.1599322, 2.108731, 0, 0.1411765, 1, 1,
0.4271587, -0.4986359, 0.04975969, 0, 0.1372549, 1, 1,
0.4326332, -1.066834, 4.222273, 0, 0.1294118, 1, 1,
0.4334634, 0.07606637, 0.4467191, 0, 0.1254902, 1, 1,
0.4351391, -0.2376663, 1.242141, 0, 0.1176471, 1, 1,
0.4359875, -2.332641, 3.089232, 0, 0.1137255, 1, 1,
0.4360276, -2.194696, 1.690255, 0, 0.1058824, 1, 1,
0.4373088, -0.1602188, 3.359839, 0, 0.09803922, 1, 1,
0.4394575, -0.4016567, 4.265591, 0, 0.09411765, 1, 1,
0.4429102, -0.9757429, 2.618916, 0, 0.08627451, 1, 1,
0.4482776, -0.2173008, 1.897697, 0, 0.08235294, 1, 1,
0.4490468, -2.053818, 3.120497, 0, 0.07450981, 1, 1,
0.4527007, 1.547739, 1.598009, 0, 0.07058824, 1, 1,
0.4580537, -0.5759683, 2.99073, 0, 0.0627451, 1, 1,
0.4608727, 1.631141, -0.2882825, 0, 0.05882353, 1, 1,
0.4626544, 0.1845035, -0.9818405, 0, 0.05098039, 1, 1,
0.4628925, 2.166984, -0.7777374, 0, 0.04705882, 1, 1,
0.4669448, -0.7505202, 3.271706, 0, 0.03921569, 1, 1,
0.4674838, -1.351747, 2.415724, 0, 0.03529412, 1, 1,
0.4681766, 1.253926, 0.4098001, 0, 0.02745098, 1, 1,
0.4690324, 0.460149, 3.049574, 0, 0.02352941, 1, 1,
0.4724852, -0.8281088, 1.076805, 0, 0.01568628, 1, 1,
0.472956, 0.4329421, 1.483367, 0, 0.01176471, 1, 1,
0.4747081, 0.06897218, 0.9853929, 0, 0.003921569, 1, 1,
0.4748797, 0.2553084, 0.8509863, 0.003921569, 0, 1, 1,
0.475193, 1.01351, 0.178216, 0.007843138, 0, 1, 1,
0.4781953, 0.564534, -1.071908, 0.01568628, 0, 1, 1,
0.4785228, -0.94663, 2.209935, 0.01960784, 0, 1, 1,
0.4821668, 0.2096426, 0.4088641, 0.02745098, 0, 1, 1,
0.4822208, -0.8287268, 3.711789, 0.03137255, 0, 1, 1,
0.4849029, -0.0313358, 1.659017, 0.03921569, 0, 1, 1,
0.4967817, 0.655989, 2.671818, 0.04313726, 0, 1, 1,
0.4969468, -0.2368365, 1.525788, 0.05098039, 0, 1, 1,
0.4991978, -0.6504542, 1.264243, 0.05490196, 0, 1, 1,
0.5035229, 1.084109, 0.6875787, 0.0627451, 0, 1, 1,
0.5058248, -0.3728709, 1.542521, 0.06666667, 0, 1, 1,
0.5093175, -1.479235, 0.0856048, 0.07450981, 0, 1, 1,
0.5094132, -0.6113957, 0.8068411, 0.07843138, 0, 1, 1,
0.5094954, -0.2856373, 1.952995, 0.08627451, 0, 1, 1,
0.5102875, -1.572032, 2.065069, 0.09019608, 0, 1, 1,
0.5125594, 0.1940528, -0.1957217, 0.09803922, 0, 1, 1,
0.5209725, 0.7317859, 0.5071431, 0.1058824, 0, 1, 1,
0.5262268, 0.892733, -0.425904, 0.1098039, 0, 1, 1,
0.5283498, 0.4687772, 0.1852585, 0.1176471, 0, 1, 1,
0.5286208, -1.270373, 1.691675, 0.1215686, 0, 1, 1,
0.5286341, -0.02634456, 0.4316978, 0.1294118, 0, 1, 1,
0.5335377, 1.20179, -0.521662, 0.1333333, 0, 1, 1,
0.5339497, -0.5584878, 4.03405, 0.1411765, 0, 1, 1,
0.5359393, -0.4476379, 3.888414, 0.145098, 0, 1, 1,
0.538394, -0.4127012, 2.766867, 0.1529412, 0, 1, 1,
0.5395503, 0.7955979, -0.505324, 0.1568628, 0, 1, 1,
0.5407086, 0.3380027, -0.1300809, 0.1647059, 0, 1, 1,
0.5413469, -0.5065126, 2.588634, 0.1686275, 0, 1, 1,
0.5435352, -1.68428, 2.619261, 0.1764706, 0, 1, 1,
0.5452765, -0.2335392, 1.641587, 0.1803922, 0, 1, 1,
0.5462235, -1.403976, 2.672693, 0.1882353, 0, 1, 1,
0.5486208, 1.619356, -0.3434121, 0.1921569, 0, 1, 1,
0.5487474, 1.882444, 1.237484, 0.2, 0, 1, 1,
0.5540796, -0.6713468, 2.341186, 0.2078431, 0, 1, 1,
0.5552968, -0.5966182, 1.923347, 0.2117647, 0, 1, 1,
0.5570548, -0.809209, 1.841793, 0.2196078, 0, 1, 1,
0.5598495, 0.866569, 1.81247, 0.2235294, 0, 1, 1,
0.5629802, 0.8772206, 1.597703, 0.2313726, 0, 1, 1,
0.5633392, -1.708719, 2.798864, 0.2352941, 0, 1, 1,
0.565379, -0.8425501, 2.609788, 0.2431373, 0, 1, 1,
0.570563, 1.061427, -1.558222, 0.2470588, 0, 1, 1,
0.5871273, -0.2461097, 3.191438, 0.254902, 0, 1, 1,
0.5889249, -1.885823, 2.829024, 0.2588235, 0, 1, 1,
0.590488, 0.04569172, -0.5079301, 0.2666667, 0, 1, 1,
0.5929043, -2.590917, 1.765458, 0.2705882, 0, 1, 1,
0.594631, 1.296194, -0.1344959, 0.2784314, 0, 1, 1,
0.5990666, -1.8729, 1.701569, 0.282353, 0, 1, 1,
0.5999373, -1.577307, 3.679908, 0.2901961, 0, 1, 1,
0.6006316, 0.7461695, 0.07175408, 0.2941177, 0, 1, 1,
0.6049094, 0.07102716, 3.031934, 0.3019608, 0, 1, 1,
0.6090872, 0.3832, 1.968105, 0.3098039, 0, 1, 1,
0.6101915, 0.2118239, 0.7109625, 0.3137255, 0, 1, 1,
0.610365, -0.1997254, 1.903515, 0.3215686, 0, 1, 1,
0.6105723, -0.5404792, 3.100379, 0.3254902, 0, 1, 1,
0.6113929, -1.395106, 3.573953, 0.3333333, 0, 1, 1,
0.6118611, -1.128919, 2.434434, 0.3372549, 0, 1, 1,
0.614817, -0.6098858, 3.161785, 0.345098, 0, 1, 1,
0.6156501, -0.6836017, 3.847977, 0.3490196, 0, 1, 1,
0.6164217, 1.590231, -1.636658, 0.3568628, 0, 1, 1,
0.6172174, 0.4217612, 2.532264, 0.3607843, 0, 1, 1,
0.6237012, -0.1142883, 2.278933, 0.3686275, 0, 1, 1,
0.6250861, 0.4406483, 2.329222, 0.372549, 0, 1, 1,
0.6258351, -0.3426731, 2.997283, 0.3803922, 0, 1, 1,
0.6303415, -1.4899, 1.054785, 0.3843137, 0, 1, 1,
0.637943, 0.5922452, -0.04250604, 0.3921569, 0, 1, 1,
0.6427976, -0.5392923, 1.214013, 0.3960784, 0, 1, 1,
0.6430075, -1.631551, 3.832583, 0.4039216, 0, 1, 1,
0.6438094, 1.724756, 1.192754, 0.4117647, 0, 1, 1,
0.6453246, -0.1314371, -0.0882059, 0.4156863, 0, 1, 1,
0.6465442, 1.633187, 0.8821971, 0.4235294, 0, 1, 1,
0.6540053, -0.8079971, 2.589597, 0.427451, 0, 1, 1,
0.6580901, 0.9838538, 0.7803963, 0.4352941, 0, 1, 1,
0.6647592, -1.152791, 4.320926, 0.4392157, 0, 1, 1,
0.6742167, -1.870326, 3.129829, 0.4470588, 0, 1, 1,
0.6757346, 1.645658, 0.7814443, 0.4509804, 0, 1, 1,
0.6787181, -0.603618, 2.026109, 0.4588235, 0, 1, 1,
0.6810026, -0.4705959, 2.953035, 0.4627451, 0, 1, 1,
0.68714, -0.2010942, 2.328962, 0.4705882, 0, 1, 1,
0.6895641, -0.9360601, 2.675053, 0.4745098, 0, 1, 1,
0.690855, 0.7834765, 2.031359, 0.4823529, 0, 1, 1,
0.6919096, 0.2787345, 0.5686208, 0.4862745, 0, 1, 1,
0.6927165, 0.1584718, 2.364328, 0.4941176, 0, 1, 1,
0.7006943, 0.2173138, 1.389189, 0.5019608, 0, 1, 1,
0.7007105, -0.2827796, 3.321149, 0.5058824, 0, 1, 1,
0.7018694, 0.8412225, 2.096994, 0.5137255, 0, 1, 1,
0.7026407, 1.536574, -1.51782, 0.5176471, 0, 1, 1,
0.7040598, -1.475565, 3.130156, 0.5254902, 0, 1, 1,
0.7220711, -1.017752, 1.60934, 0.5294118, 0, 1, 1,
0.7274498, -0.3481681, 0.81071, 0.5372549, 0, 1, 1,
0.7280057, 0.1813232, 0.3065435, 0.5411765, 0, 1, 1,
0.7282886, 0.7773635, 0.7832565, 0.5490196, 0, 1, 1,
0.7301419, -2.483059, 3.249356, 0.5529412, 0, 1, 1,
0.7374817, 0.07556116, 1.373452, 0.5607843, 0, 1, 1,
0.7397066, -0.2998835, 2.088328, 0.5647059, 0, 1, 1,
0.7475123, -1.403734, 3.538462, 0.572549, 0, 1, 1,
0.7507294, -0.2569038, 2.345054, 0.5764706, 0, 1, 1,
0.7630708, 0.9629016, 1.26953, 0.5843138, 0, 1, 1,
0.7663222, 0.3591596, 1.000297, 0.5882353, 0, 1, 1,
0.7666255, 1.042759, -0.4981948, 0.5960785, 0, 1, 1,
0.77295, -1.539986, 4.54775, 0.6039216, 0, 1, 1,
0.7765671, -0.002135804, 1.29853, 0.6078432, 0, 1, 1,
0.7810858, -1.22109, 2.879785, 0.6156863, 0, 1, 1,
0.7862245, 0.03751524, 1.156835, 0.6196079, 0, 1, 1,
0.7904683, 1.080559, 0.859745, 0.627451, 0, 1, 1,
0.7950707, 1.442366, -0.009551622, 0.6313726, 0, 1, 1,
0.8004355, -0.394226, 2.634002, 0.6392157, 0, 1, 1,
0.8046103, 0.4644658, 0.158336, 0.6431373, 0, 1, 1,
0.8050969, -0.7495142, 2.898746, 0.6509804, 0, 1, 1,
0.8069336, -0.845907, 2.083559, 0.654902, 0, 1, 1,
0.8236055, -0.6783813, 0.4789315, 0.6627451, 0, 1, 1,
0.8299417, 0.412526, 0.3041259, 0.6666667, 0, 1, 1,
0.8325222, -0.8363227, 2.008871, 0.6745098, 0, 1, 1,
0.832728, -0.7650476, 3.17756, 0.6784314, 0, 1, 1,
0.8399152, -1.040103, 2.50638, 0.6862745, 0, 1, 1,
0.8411196, -1.756356, 0.6069931, 0.6901961, 0, 1, 1,
0.8426238, -0.3498196, 3.714331, 0.6980392, 0, 1, 1,
0.8453163, 0.9472934, -1.255703, 0.7058824, 0, 1, 1,
0.8453311, -0.1418634, 1.828186, 0.7098039, 0, 1, 1,
0.8564668, -1.038048, 1.299002, 0.7176471, 0, 1, 1,
0.8601026, -0.179098, 1.836616, 0.7215686, 0, 1, 1,
0.8640921, -0.2061752, 1.516602, 0.7294118, 0, 1, 1,
0.8663527, 0.6414622, 1.600612, 0.7333333, 0, 1, 1,
0.8709487, 0.4989029, 0.1242262, 0.7411765, 0, 1, 1,
0.8785345, 2.50491, 1.207309, 0.7450981, 0, 1, 1,
0.8805522, 0.4866912, 0.9694256, 0.7529412, 0, 1, 1,
0.883969, 0.4373114, 1.234431, 0.7568628, 0, 1, 1,
0.8937529, -0.3333806, 2.370622, 0.7647059, 0, 1, 1,
0.8958433, -1.046747, 2.274623, 0.7686275, 0, 1, 1,
0.8963684, -0.2075748, 0.2632691, 0.7764706, 0, 1, 1,
0.9045495, 0.1981082, 3.063119, 0.7803922, 0, 1, 1,
0.9046621, 0.273461, 0.04073227, 0.7882353, 0, 1, 1,
0.9074588, 0.9906764, 2.051008, 0.7921569, 0, 1, 1,
0.9205372, -1.167057, 3.859414, 0.8, 0, 1, 1,
0.9211163, -1.250126, 2.030666, 0.8078431, 0, 1, 1,
0.928973, -0.7892069, 4.76968, 0.8117647, 0, 1, 1,
0.9299776, -0.6314487, 1.507565, 0.8196079, 0, 1, 1,
0.9309859, -1.148959, 3.338918, 0.8235294, 0, 1, 1,
0.942302, -0.2503119, 0.7150154, 0.8313726, 0, 1, 1,
0.9464871, -1.572274, 3.714033, 0.8352941, 0, 1, 1,
0.947113, -0.4600687, 1.861628, 0.8431373, 0, 1, 1,
0.9531813, 0.473061, 1.412786, 0.8470588, 0, 1, 1,
0.9539018, 0.138287, 0.5055, 0.854902, 0, 1, 1,
0.9566454, -1.236628, 3.64291, 0.8588235, 0, 1, 1,
0.956678, 1.216469, 2.293308, 0.8666667, 0, 1, 1,
0.9569612, -0.5128667, 2.354626, 0.8705882, 0, 1, 1,
0.9662499, 0.1885516, 0.7807898, 0.8784314, 0, 1, 1,
0.9706451, 1.225551, -0.2030789, 0.8823529, 0, 1, 1,
0.9741014, 0.5166029, 1.744964, 0.8901961, 0, 1, 1,
0.979165, -0.9435962, 1.053763, 0.8941177, 0, 1, 1,
0.9796947, -0.2216339, 2.063884, 0.9019608, 0, 1, 1,
0.9799405, -0.7935387, 2.587143, 0.9098039, 0, 1, 1,
0.984289, -0.2021058, 1.201406, 0.9137255, 0, 1, 1,
0.9846425, 1.15872, 1.10296, 0.9215686, 0, 1, 1,
0.999012, -1.642964, 2.347026, 0.9254902, 0, 1, 1,
1.003839, -0.04414421, 1.145042, 0.9333333, 0, 1, 1,
1.005835, 2.64479, 0.7870634, 0.9372549, 0, 1, 1,
1.007184, -0.00907506, 3.168161, 0.945098, 0, 1, 1,
1.013765, 0.102222, 1.570641, 0.9490196, 0, 1, 1,
1.014586, 0.5750293, 1.973684, 0.9568627, 0, 1, 1,
1.015246, -0.2526889, 2.154213, 0.9607843, 0, 1, 1,
1.028835, -0.5728889, 2.102383, 0.9686275, 0, 1, 1,
1.0341, -0.5728535, 1.585507, 0.972549, 0, 1, 1,
1.03943, 0.1198534, 1.355902, 0.9803922, 0, 1, 1,
1.043137, -0.2576525, 0.9702673, 0.9843137, 0, 1, 1,
1.043383, -0.5487878, 0.5011413, 0.9921569, 0, 1, 1,
1.05253, -0.3443198, 3.590306, 0.9960784, 0, 1, 1,
1.057481, 2.290868, -1.591832, 1, 0, 0.9960784, 1,
1.066104, 0.118951, 0.5539497, 1, 0, 0.9882353, 1,
1.069586, 0.3297788, 2.868009, 1, 0, 0.9843137, 1,
1.070799, -0.4048514, 1.566917, 1, 0, 0.9764706, 1,
1.071732, 0.8042626, 0.4897968, 1, 0, 0.972549, 1,
1.072836, 0.27274, 0.4518878, 1, 0, 0.9647059, 1,
1.082217, 0.06216376, 2.223872, 1, 0, 0.9607843, 1,
1.085273, -1.605266, 1.804276, 1, 0, 0.9529412, 1,
1.088049, 1.54296, 0.2455757, 1, 0, 0.9490196, 1,
1.093453, -0.1980208, 2.085425, 1, 0, 0.9411765, 1,
1.094321, 1.360816, 1.211115, 1, 0, 0.9372549, 1,
1.096699, -0.8600953, 3.885538, 1, 0, 0.9294118, 1,
1.100079, -0.09358232, 1.361505, 1, 0, 0.9254902, 1,
1.100446, 0.1659188, 0.3787318, 1, 0, 0.9176471, 1,
1.101874, -0.4738828, 1.663775, 1, 0, 0.9137255, 1,
1.108301, 0.2609684, 1.025702, 1, 0, 0.9058824, 1,
1.113554, -1.307376, 3.919302, 1, 0, 0.9019608, 1,
1.11439, 0.3879503, 1.215981, 1, 0, 0.8941177, 1,
1.115743, -1.397885, 4.20589, 1, 0, 0.8862745, 1,
1.120809, -0.8110148, 3.474677, 1, 0, 0.8823529, 1,
1.128119, 0.3529733, 0.4635303, 1, 0, 0.8745098, 1,
1.129162, 1.358644, -0.1856546, 1, 0, 0.8705882, 1,
1.130054, 0.800836, -1.123493, 1, 0, 0.8627451, 1,
1.14586, 0.4478058, 0.5720845, 1, 0, 0.8588235, 1,
1.146588, 0.45597, 2.303185, 1, 0, 0.8509804, 1,
1.14975, -0.789887, 1.260314, 1, 0, 0.8470588, 1,
1.151212, -1.137011, 1.806703, 1, 0, 0.8392157, 1,
1.16513, -1.236909, 3.502415, 1, 0, 0.8352941, 1,
1.167284, 1.127656, 0.2574649, 1, 0, 0.827451, 1,
1.167875, -1.954908, 2.091171, 1, 0, 0.8235294, 1,
1.169906, -0.5796174, 1.503849, 1, 0, 0.8156863, 1,
1.171671, 0.6865456, 0.5410014, 1, 0, 0.8117647, 1,
1.172983, -0.703842, 0.0928374, 1, 0, 0.8039216, 1,
1.181358, -0.05059719, 1.962006, 1, 0, 0.7960784, 1,
1.185756, 0.1862484, 1.83687, 1, 0, 0.7921569, 1,
1.187298, -0.1360586, 0.7038745, 1, 0, 0.7843137, 1,
1.189008, -0.8001948, 2.110423, 1, 0, 0.7803922, 1,
1.191814, 0.1350123, 0.7530884, 1, 0, 0.772549, 1,
1.191894, 0.9578279, 1.547013, 1, 0, 0.7686275, 1,
1.19371, 0.9949732, 2.4853, 1, 0, 0.7607843, 1,
1.200614, -0.4841179, 1.887558, 1, 0, 0.7568628, 1,
1.200654, 1.016512, -0.3492952, 1, 0, 0.7490196, 1,
1.200709, -0.5097376, 2.415739, 1, 0, 0.7450981, 1,
1.204887, 0.05896486, 1.233478, 1, 0, 0.7372549, 1,
1.207546, 0.3353211, 0.8571543, 1, 0, 0.7333333, 1,
1.212849, 0.2391845, 2.043368, 1, 0, 0.7254902, 1,
1.214127, -0.08596334, 2.243383, 1, 0, 0.7215686, 1,
1.22214, 0.03803509, 2.185735, 1, 0, 0.7137255, 1,
1.222191, -0.6382554, 2.199262, 1, 0, 0.7098039, 1,
1.230064, 0.2009072, 3.681043, 1, 0, 0.7019608, 1,
1.230211, -1.928831, 2.085842, 1, 0, 0.6941177, 1,
1.231041, 1.336192, 0.9612087, 1, 0, 0.6901961, 1,
1.23255, -0.06822638, 2.488514, 1, 0, 0.682353, 1,
1.232705, -0.726271, 2.547644, 1, 0, 0.6784314, 1,
1.234427, -1.295575, 0.8650113, 1, 0, 0.6705883, 1,
1.242476, 1.389736, -0.6441911, 1, 0, 0.6666667, 1,
1.256953, -0.9640163, 2.515578, 1, 0, 0.6588235, 1,
1.259688, 0.9004809, 0.2580155, 1, 0, 0.654902, 1,
1.260189, 1.51071, 1.558814, 1, 0, 0.6470588, 1,
1.26116, 2.070784, 2.606939, 1, 0, 0.6431373, 1,
1.265833, -0.743685, 4.244621, 1, 0, 0.6352941, 1,
1.27125, -2.086767, 1.403804, 1, 0, 0.6313726, 1,
1.271924, 0.2325899, 0.03787395, 1, 0, 0.6235294, 1,
1.273455, -1.180244, 2.241151, 1, 0, 0.6196079, 1,
1.277274, 0.8827463, 1.188225, 1, 0, 0.6117647, 1,
1.301006, -0.2777422, 2.10813, 1, 0, 0.6078432, 1,
1.301745, 0.3824755, 0.08545474, 1, 0, 0.6, 1,
1.304589, -1.626224, 2.37861, 1, 0, 0.5921569, 1,
1.312261, 1.578775, 2.216309, 1, 0, 0.5882353, 1,
1.323126, -0.227131, 2.553307, 1, 0, 0.5803922, 1,
1.328102, 1.417216, -0.03264916, 1, 0, 0.5764706, 1,
1.32939, -0.316767, 0.5766021, 1, 0, 0.5686275, 1,
1.330489, 0.09327168, 0.8049796, 1, 0, 0.5647059, 1,
1.33754, -1.079247, 1.983487, 1, 0, 0.5568628, 1,
1.346552, 0.8345764, 0.8858033, 1, 0, 0.5529412, 1,
1.35383, 0.5450825, 0.3879701, 1, 0, 0.5450981, 1,
1.354523, -0.741307, 4.0506, 1, 0, 0.5411765, 1,
1.358231, -0.571319, 2.009212, 1, 0, 0.5333334, 1,
1.363647, -0.5847952, 3.390428, 1, 0, 0.5294118, 1,
1.375779, -0.210521, 3.032921, 1, 0, 0.5215687, 1,
1.384013, -0.7969419, 0.7285958, 1, 0, 0.5176471, 1,
1.389944, -1.379387, 2.749097, 1, 0, 0.509804, 1,
1.390599, -1.385568, 3.403737, 1, 0, 0.5058824, 1,
1.396012, 0.4099561, -0.2444182, 1, 0, 0.4980392, 1,
1.401508, -2.568221, 2.01382, 1, 0, 0.4901961, 1,
1.426842, -0.822975, 2.297221, 1, 0, 0.4862745, 1,
1.431506, -1.222813, 1.330007, 1, 0, 0.4784314, 1,
1.465172, -0.2246739, 0.8144087, 1, 0, 0.4745098, 1,
1.46795, 0.5438799, 2.232749, 1, 0, 0.4666667, 1,
1.481348, 0.03180065, 3.311203, 1, 0, 0.4627451, 1,
1.482648, -2.448744, 0.8389536, 1, 0, 0.454902, 1,
1.485958, 1.588881, -0.09560729, 1, 0, 0.4509804, 1,
1.487545, -1.310178, 1.775326, 1, 0, 0.4431373, 1,
1.497309, 1.270818, 1.042005, 1, 0, 0.4392157, 1,
1.512406, -0.4586094, 4.073966, 1, 0, 0.4313726, 1,
1.52224, -1.939775, 2.872861, 1, 0, 0.427451, 1,
1.535289, 0.1370648, 3.549278, 1, 0, 0.4196078, 1,
1.542131, 0.6491188, 2.69894, 1, 0, 0.4156863, 1,
1.570203, -0.4194315, 0.3462339, 1, 0, 0.4078431, 1,
1.577442, 0.1286284, 1.356774, 1, 0, 0.4039216, 1,
1.579654, 1.251948, 1.347536, 1, 0, 0.3960784, 1,
1.583059, 0.4468422, 1.265324, 1, 0, 0.3882353, 1,
1.595756, -0.004103173, 2.852958, 1, 0, 0.3843137, 1,
1.597164, -0.01048833, 2.848719, 1, 0, 0.3764706, 1,
1.612511, 0.5077142, 0.7828196, 1, 0, 0.372549, 1,
1.636461, -1.58505, 2.909323, 1, 0, 0.3647059, 1,
1.640511, -1.554286, 1.950727, 1, 0, 0.3607843, 1,
1.64809, -0.4765423, 1.906778, 1, 0, 0.3529412, 1,
1.650643, 0.4581392, 1.955201, 1, 0, 0.3490196, 1,
1.662526, -0.8266424, 1.066642, 1, 0, 0.3411765, 1,
1.668505, -0.649875, 3.045883, 1, 0, 0.3372549, 1,
1.701663, 1.133239, 1.684322, 1, 0, 0.3294118, 1,
1.701869, -1.634619, 0.9458324, 1, 0, 0.3254902, 1,
1.709218, -1.22226, 2.392108, 1, 0, 0.3176471, 1,
1.717148, -1.157501, 1.690111, 1, 0, 0.3137255, 1,
1.731751, -0.8543271, 2.366171, 1, 0, 0.3058824, 1,
1.743248, -0.5465774, 1.959633, 1, 0, 0.2980392, 1,
1.756089, 0.7087922, 0.1403069, 1, 0, 0.2941177, 1,
1.762702, 0.2723527, 1.816567, 1, 0, 0.2862745, 1,
1.768267, 0.6049094, 2.348335, 1, 0, 0.282353, 1,
1.77391, -0.5912774, 1.735718, 1, 0, 0.2745098, 1,
1.798605, -0.2453717, 1.164809, 1, 0, 0.2705882, 1,
1.811555, -1.224734, 3.119667, 1, 0, 0.2627451, 1,
1.827678, 0.9988548, 2.22646, 1, 0, 0.2588235, 1,
1.839813, 0.386207, 1.675737, 1, 0, 0.2509804, 1,
1.841078, -0.5704992, 1.249942, 1, 0, 0.2470588, 1,
1.852956, 0.6824707, 1.146164, 1, 0, 0.2392157, 1,
1.856495, 0.4200594, 1.05843, 1, 0, 0.2352941, 1,
1.862601, 0.05609067, 2.62278, 1, 0, 0.227451, 1,
1.868794, 0.7949102, 1.913351, 1, 0, 0.2235294, 1,
1.894475, -1.090535, 1.235891, 1, 0, 0.2156863, 1,
1.908253, -0.1779226, 2.077513, 1, 0, 0.2117647, 1,
1.942949, 0.526903, 2.936133, 1, 0, 0.2039216, 1,
1.955343, -0.3487164, 3.123943, 1, 0, 0.1960784, 1,
1.971281, 0.045881, 1.910413, 1, 0, 0.1921569, 1,
1.997301, 0.5912995, 1.811724, 1, 0, 0.1843137, 1,
2.016607, -1.09219, 2.725272, 1, 0, 0.1803922, 1,
2.077477, 0.951343, 1.029464, 1, 0, 0.172549, 1,
2.083958, -0.4778112, 0.08333495, 1, 0, 0.1686275, 1,
2.11457, -1.259683, 1.208188, 1, 0, 0.1607843, 1,
2.116045, 1.65898, -0.351243, 1, 0, 0.1568628, 1,
2.137703, -0.3043424, 1.342758, 1, 0, 0.1490196, 1,
2.155826, -1.256752, 2.555334, 1, 0, 0.145098, 1,
2.213327, 0.5594192, 2.677463, 1, 0, 0.1372549, 1,
2.218468, -1.325951, 1.044506, 1, 0, 0.1333333, 1,
2.285603, 1.167549, 0.9388466, 1, 0, 0.1254902, 1,
2.287222, -1.484668, 1.310487, 1, 0, 0.1215686, 1,
2.298702, 1.232108, -1.028173, 1, 0, 0.1137255, 1,
2.320884, 0.5221817, 1.055755, 1, 0, 0.1098039, 1,
2.368591, 0.9041495, 0.9992365, 1, 0, 0.1019608, 1,
2.432779, -0.6717669, 1.860805, 1, 0, 0.09411765, 1,
2.46102, 1.227774, 2.468335, 1, 0, 0.09019608, 1,
2.559767, 0.9303923, 0.6736086, 1, 0, 0.08235294, 1,
2.643151, 0.7049527, 2.202847, 1, 0, 0.07843138, 1,
2.655492, -1.527485, 1.848338, 1, 0, 0.07058824, 1,
2.741642, 0.4661345, 2.729487, 1, 0, 0.06666667, 1,
2.760923, 0.3571725, 1.884692, 1, 0, 0.05882353, 1,
2.782062, 0.0861105, 1.840042, 1, 0, 0.05490196, 1,
2.792423, -0.4453074, 1.319052, 1, 0, 0.04705882, 1,
2.826334, -1.058479, 2.545027, 1, 0, 0.04313726, 1,
2.835465, 1.479386, -0.762109, 1, 0, 0.03529412, 1,
2.844146, 0.2570841, 1.351756, 1, 0, 0.03137255, 1,
2.923243, -0.6899089, 1.910408, 1, 0, 0.02352941, 1,
2.951966, 1.730556, -0.1759274, 1, 0, 0.01960784, 1,
2.968114, 0.3108699, 0.04495774, 1, 0, 0.01176471, 1,
3.343634, 1.001558, 2.161391, 1, 0, 0.007843138, 1
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
0.08312047, -4.728852, -7.627904, 0, -0.5, 0.5, 0.5,
0.08312047, -4.728852, -7.627904, 1, -0.5, 0.5, 0.5,
0.08312047, -4.728852, -7.627904, 1, 1.5, 0.5, 0.5,
0.08312047, -4.728852, -7.627904, 0, 1.5, 0.5, 0.5
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
-4.282708, -0.2715427, -7.627904, 0, -0.5, 0.5, 0.5,
-4.282708, -0.2715427, -7.627904, 1, -0.5, 0.5, 0.5,
-4.282708, -0.2715427, -7.627904, 1, 1.5, 0.5, 0.5,
-4.282708, -0.2715427, -7.627904, 0, 1.5, 0.5, 0.5
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
-4.282708, -4.728852, -0.1113334, 0, -0.5, 0.5, 0.5,
-4.282708, -4.728852, -0.1113334, 1, -0.5, 0.5, 0.5,
-4.282708, -4.728852, -0.1113334, 1, 1.5, 0.5, 0.5,
-4.282708, -4.728852, -0.1113334, 0, 1.5, 0.5, 0.5
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
-3, -3.700242, -5.893311,
3, -3.700242, -5.893311,
-3, -3.700242, -5.893311,
-3, -3.871677, -6.18241,
-2, -3.700242, -5.893311,
-2, -3.871677, -6.18241,
-1, -3.700242, -5.893311,
-1, -3.871677, -6.18241,
0, -3.700242, -5.893311,
0, -3.871677, -6.18241,
1, -3.700242, -5.893311,
1, -3.871677, -6.18241,
2, -3.700242, -5.893311,
2, -3.871677, -6.18241,
3, -3.700242, -5.893311,
3, -3.871677, -6.18241
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
-3, -4.214547, -6.760608, 0, -0.5, 0.5, 0.5,
-3, -4.214547, -6.760608, 1, -0.5, 0.5, 0.5,
-3, -4.214547, -6.760608, 1, 1.5, 0.5, 0.5,
-3, -4.214547, -6.760608, 0, 1.5, 0.5, 0.5,
-2, -4.214547, -6.760608, 0, -0.5, 0.5, 0.5,
-2, -4.214547, -6.760608, 1, -0.5, 0.5, 0.5,
-2, -4.214547, -6.760608, 1, 1.5, 0.5, 0.5,
-2, -4.214547, -6.760608, 0, 1.5, 0.5, 0.5,
-1, -4.214547, -6.760608, 0, -0.5, 0.5, 0.5,
-1, -4.214547, -6.760608, 1, -0.5, 0.5, 0.5,
-1, -4.214547, -6.760608, 1, 1.5, 0.5, 0.5,
-1, -4.214547, -6.760608, 0, 1.5, 0.5, 0.5,
0, -4.214547, -6.760608, 0, -0.5, 0.5, 0.5,
0, -4.214547, -6.760608, 1, -0.5, 0.5, 0.5,
0, -4.214547, -6.760608, 1, 1.5, 0.5, 0.5,
0, -4.214547, -6.760608, 0, 1.5, 0.5, 0.5,
1, -4.214547, -6.760608, 0, -0.5, 0.5, 0.5,
1, -4.214547, -6.760608, 1, -0.5, 0.5, 0.5,
1, -4.214547, -6.760608, 1, 1.5, 0.5, 0.5,
1, -4.214547, -6.760608, 0, 1.5, 0.5, 0.5,
2, -4.214547, -6.760608, 0, -0.5, 0.5, 0.5,
2, -4.214547, -6.760608, 1, -0.5, 0.5, 0.5,
2, -4.214547, -6.760608, 1, 1.5, 0.5, 0.5,
2, -4.214547, -6.760608, 0, 1.5, 0.5, 0.5,
3, -4.214547, -6.760608, 0, -0.5, 0.5, 0.5,
3, -4.214547, -6.760608, 1, -0.5, 0.5, 0.5,
3, -4.214547, -6.760608, 1, 1.5, 0.5, 0.5,
3, -4.214547, -6.760608, 0, 1.5, 0.5, 0.5
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
-3.275209, -3, -5.893311,
-3.275209, 3, -5.893311,
-3.275209, -3, -5.893311,
-3.443125, -3, -6.18241,
-3.275209, -2, -5.893311,
-3.443125, -2, -6.18241,
-3.275209, -1, -5.893311,
-3.443125, -1, -6.18241,
-3.275209, 0, -5.893311,
-3.443125, 0, -6.18241,
-3.275209, 1, -5.893311,
-3.443125, 1, -6.18241,
-3.275209, 2, -5.893311,
-3.443125, 2, -6.18241,
-3.275209, 3, -5.893311,
-3.443125, 3, -6.18241
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
-3.778958, -3, -6.760608, 0, -0.5, 0.5, 0.5,
-3.778958, -3, -6.760608, 1, -0.5, 0.5, 0.5,
-3.778958, -3, -6.760608, 1, 1.5, 0.5, 0.5,
-3.778958, -3, -6.760608, 0, 1.5, 0.5, 0.5,
-3.778958, -2, -6.760608, 0, -0.5, 0.5, 0.5,
-3.778958, -2, -6.760608, 1, -0.5, 0.5, 0.5,
-3.778958, -2, -6.760608, 1, 1.5, 0.5, 0.5,
-3.778958, -2, -6.760608, 0, 1.5, 0.5, 0.5,
-3.778958, -1, -6.760608, 0, -0.5, 0.5, 0.5,
-3.778958, -1, -6.760608, 1, -0.5, 0.5, 0.5,
-3.778958, -1, -6.760608, 1, 1.5, 0.5, 0.5,
-3.778958, -1, -6.760608, 0, 1.5, 0.5, 0.5,
-3.778958, 0, -6.760608, 0, -0.5, 0.5, 0.5,
-3.778958, 0, -6.760608, 1, -0.5, 0.5, 0.5,
-3.778958, 0, -6.760608, 1, 1.5, 0.5, 0.5,
-3.778958, 0, -6.760608, 0, 1.5, 0.5, 0.5,
-3.778958, 1, -6.760608, 0, -0.5, 0.5, 0.5,
-3.778958, 1, -6.760608, 1, -0.5, 0.5, 0.5,
-3.778958, 1, -6.760608, 1, 1.5, 0.5, 0.5,
-3.778958, 1, -6.760608, 0, 1.5, 0.5, 0.5,
-3.778958, 2, -6.760608, 0, -0.5, 0.5, 0.5,
-3.778958, 2, -6.760608, 1, -0.5, 0.5, 0.5,
-3.778958, 2, -6.760608, 1, 1.5, 0.5, 0.5,
-3.778958, 2, -6.760608, 0, 1.5, 0.5, 0.5,
-3.778958, 3, -6.760608, 0, -0.5, 0.5, 0.5,
-3.778958, 3, -6.760608, 1, -0.5, 0.5, 0.5,
-3.778958, 3, -6.760608, 1, 1.5, 0.5, 0.5,
-3.778958, 3, -6.760608, 0, 1.5, 0.5, 0.5
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
-3.275209, -3.700242, -4,
-3.275209, -3.700242, 4,
-3.275209, -3.700242, -4,
-3.443125, -3.871677, -4,
-3.275209, -3.700242, -2,
-3.443125, -3.871677, -2,
-3.275209, -3.700242, 0,
-3.443125, -3.871677, 0,
-3.275209, -3.700242, 2,
-3.443125, -3.871677, 2,
-3.275209, -3.700242, 4,
-3.443125, -3.871677, 4
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
-3.778958, -4.214547, -4, 0, -0.5, 0.5, 0.5,
-3.778958, -4.214547, -4, 1, -0.5, 0.5, 0.5,
-3.778958, -4.214547, -4, 1, 1.5, 0.5, 0.5,
-3.778958, -4.214547, -4, 0, 1.5, 0.5, 0.5,
-3.778958, -4.214547, -2, 0, -0.5, 0.5, 0.5,
-3.778958, -4.214547, -2, 1, -0.5, 0.5, 0.5,
-3.778958, -4.214547, -2, 1, 1.5, 0.5, 0.5,
-3.778958, -4.214547, -2, 0, 1.5, 0.5, 0.5,
-3.778958, -4.214547, 0, 0, -0.5, 0.5, 0.5,
-3.778958, -4.214547, 0, 1, -0.5, 0.5, 0.5,
-3.778958, -4.214547, 0, 1, 1.5, 0.5, 0.5,
-3.778958, -4.214547, 0, 0, 1.5, 0.5, 0.5,
-3.778958, -4.214547, 2, 0, -0.5, 0.5, 0.5,
-3.778958, -4.214547, 2, 1, -0.5, 0.5, 0.5,
-3.778958, -4.214547, 2, 1, 1.5, 0.5, 0.5,
-3.778958, -4.214547, 2, 0, 1.5, 0.5, 0.5,
-3.778958, -4.214547, 4, 0, -0.5, 0.5, 0.5,
-3.778958, -4.214547, 4, 1, -0.5, 0.5, 0.5,
-3.778958, -4.214547, 4, 1, 1.5, 0.5, 0.5,
-3.778958, -4.214547, 4, 0, 1.5, 0.5, 0.5
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
-3.275209, -3.700242, -5.893311,
-3.275209, 3.157157, -5.893311,
-3.275209, -3.700242, 5.670644,
-3.275209, 3.157157, 5.670644,
-3.275209, -3.700242, -5.893311,
-3.275209, -3.700242, 5.670644,
-3.275209, 3.157157, -5.893311,
-3.275209, 3.157157, 5.670644,
-3.275209, -3.700242, -5.893311,
3.44145, -3.700242, -5.893311,
-3.275209, -3.700242, 5.670644,
3.44145, -3.700242, 5.670644,
-3.275209, 3.157157, -5.893311,
3.44145, 3.157157, -5.893311,
-3.275209, 3.157157, 5.670644,
3.44145, 3.157157, 5.670644,
3.44145, -3.700242, -5.893311,
3.44145, 3.157157, -5.893311,
3.44145, -3.700242, 5.670644,
3.44145, 3.157157, 5.670644,
3.44145, -3.700242, -5.893311,
3.44145, -3.700242, 5.670644,
3.44145, 3.157157, -5.893311,
3.44145, 3.157157, 5.670644
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
var radius = 8.025046;
var distance = 35.70433;
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
mvMatrix.translate( -0.08312047, 0.2715427, 0.1113334 );
mvMatrix.scale( 1.291838, 1.265325, 0.7503347 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70433);
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
dimethylether<-read.table("dimethylether.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethylether$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
```

```r
y<-dimethylether$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
```

```r
z<-dimethylether$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
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
-3.177393, 1.456491, 0.5019066, 0, 0, 1, 1, 1,
-3.062843, -1.479069, -1.627395, 1, 0, 0, 1, 1,
-2.77822, -0.06232247, -2.193261, 1, 0, 0, 1, 1,
-2.538302, -0.6159781, -1.997961, 1, 0, 0, 1, 1,
-2.501369, 1.900687, -1.484529, 1, 0, 0, 1, 1,
-2.340342, 0.09837453, 0.7732871, 1, 0, 0, 1, 1,
-2.330445, -1.065079, -2.325291, 0, 0, 0, 1, 1,
-2.293416, -0.9812073, -2.439125, 0, 0, 0, 1, 1,
-2.25959, 0.971412, 0.08729474, 0, 0, 0, 1, 1,
-2.231108, -0.3016413, -0.9856052, 0, 0, 0, 1, 1,
-2.20925, 0.6794784, -1.354248, 0, 0, 0, 1, 1,
-2.168603, 0.4022334, -2.350734, 0, 0, 0, 1, 1,
-2.148565, 0.3592597, -0.8918044, 0, 0, 0, 1, 1,
-2.137715, -0.3990897, -1.255132, 1, 1, 1, 1, 1,
-2.132609, -0.8101577, -3.371377, 1, 1, 1, 1, 1,
-2.126157, 1.103307, -1.948314, 1, 1, 1, 1, 1,
-2.093636, 0.03188752, -1.079275, 1, 1, 1, 1, 1,
-2.048614, -0.5064701, -2.828133, 1, 1, 1, 1, 1,
-2.04511, -0.3099667, -1.513336, 1, 1, 1, 1, 1,
-2.040848, -0.6159474, -0.03260706, 1, 1, 1, 1, 1,
-2.037138, 0.2259879, -3.074501, 1, 1, 1, 1, 1,
-2.005593, 0.1106954, -1.234704, 1, 1, 1, 1, 1,
-1.946272, 0.3275198, -2.208965, 1, 1, 1, 1, 1,
-1.92433, 0.1450464, -2.153746, 1, 1, 1, 1, 1,
-1.910133, -0.7532285, -3.16677, 1, 1, 1, 1, 1,
-1.889581, -0.5426791, -0.5668792, 1, 1, 1, 1, 1,
-1.79201, 1.239447, -0.05555689, 1, 1, 1, 1, 1,
-1.787734, -3.019063, -3.115679, 1, 1, 1, 1, 1,
-1.766317, -0.6027938, -3.125574, 0, 0, 1, 1, 1,
-1.742272, -0.1734553, -0.9481608, 1, 0, 0, 1, 1,
-1.720742, -0.7080807, -1.597311, 1, 0, 0, 1, 1,
-1.70464, -1.080946, -1.699561, 1, 0, 0, 1, 1,
-1.701958, -0.03110024, -1.862771, 1, 0, 0, 1, 1,
-1.697598, 1.329822, -1.110165, 1, 0, 0, 1, 1,
-1.697105, 1.295192, -2.421784, 0, 0, 0, 1, 1,
-1.685336, 1.786361, 0.2812, 0, 0, 0, 1, 1,
-1.681202, -2.269129, -0.7544184, 0, 0, 0, 1, 1,
-1.677454, -1.338557, -1.462233, 0, 0, 0, 1, 1,
-1.668975, 0.6123973, 0.2727874, 0, 0, 0, 1, 1,
-1.655553, 0.0996734, -2.386085, 0, 0, 0, 1, 1,
-1.649204, -0.3172698, -0.08543514, 0, 0, 0, 1, 1,
-1.636924, 0.5234566, -0.8291891, 1, 1, 1, 1, 1,
-1.622937, -0.4253885, -1.81089, 1, 1, 1, 1, 1,
-1.60465, 0.5983534, -3.087783, 1, 1, 1, 1, 1,
-1.601033, 0.08745135, -1.297475, 1, 1, 1, 1, 1,
-1.591035, -0.3652735, -1.974417, 1, 1, 1, 1, 1,
-1.581952, 0.2973189, -0.4099518, 1, 1, 1, 1, 1,
-1.577737, 0.8436892, -0.935701, 1, 1, 1, 1, 1,
-1.562853, 0.256659, -2.196448, 1, 1, 1, 1, 1,
-1.559648, 0.4065199, -2.207186, 1, 1, 1, 1, 1,
-1.548663, -0.3623799, -2.045716, 1, 1, 1, 1, 1,
-1.542699, -0.6712518, -1.143006, 1, 1, 1, 1, 1,
-1.526396, 0.6393396, -1.517852, 1, 1, 1, 1, 1,
-1.520778, -0.8677524, -2.112297, 1, 1, 1, 1, 1,
-1.507228, 1.283931, -0.2511668, 1, 1, 1, 1, 1,
-1.502803, -0.1861142, -4.782398, 1, 1, 1, 1, 1,
-1.500016, 0.434746, -0.8713572, 0, 0, 1, 1, 1,
-1.484183, -0.574383, -1.613818, 1, 0, 0, 1, 1,
-1.483297, -0.3385226, -1.448211, 1, 0, 0, 1, 1,
-1.481026, 0.5482228, -1.055653, 1, 0, 0, 1, 1,
-1.48058, -0.3614451, -1.969899, 1, 0, 0, 1, 1,
-1.475276, 0.8071402, -2.081634, 1, 0, 0, 1, 1,
-1.464823, 0.3220414, -1.621619, 0, 0, 0, 1, 1,
-1.433923, -1.128052, -2.520859, 0, 0, 0, 1, 1,
-1.433805, 2.008706, -1.438643, 0, 0, 0, 1, 1,
-1.428058, -1.059466, -2.822963, 0, 0, 0, 1, 1,
-1.427572, 0.0200655, -1.030676, 0, 0, 0, 1, 1,
-1.42671, 0.6068314, -0.8161534, 0, 0, 0, 1, 1,
-1.426393, -0.3161682, -1.326763, 0, 0, 0, 1, 1,
-1.423534, 0.6277881, -0.6857499, 1, 1, 1, 1, 1,
-1.418886, -1.071096, -2.109672, 1, 1, 1, 1, 1,
-1.409623, 0.2438583, 1.246867, 1, 1, 1, 1, 1,
-1.398715, -0.9614508, -1.1556, 1, 1, 1, 1, 1,
-1.390126, -0.980702, -2.67889, 1, 1, 1, 1, 1,
-1.38573, 1.09246, -0.6924941, 1, 1, 1, 1, 1,
-1.383713, 1.604915, -1.933262, 1, 1, 1, 1, 1,
-1.379723, 0.8646712, -0.0949762, 1, 1, 1, 1, 1,
-1.37517, 0.88474, -2.430815, 1, 1, 1, 1, 1,
-1.373877, -2.010442, -2.132431, 1, 1, 1, 1, 1,
-1.360854, -0.9418339, -1.3172, 1, 1, 1, 1, 1,
-1.354765, -0.9979884, -2.168604, 1, 1, 1, 1, 1,
-1.351815, -0.2487597, -2.29757, 1, 1, 1, 1, 1,
-1.351588, -1.776789, -3.975308, 1, 1, 1, 1, 1,
-1.34441, 1.95888, -1.522081, 1, 1, 1, 1, 1,
-1.34115, -0.2869616, -2.635014, 0, 0, 1, 1, 1,
-1.339933, 1.100514, -0.7433805, 1, 0, 0, 1, 1,
-1.330297, 0.4156334, -1.018034, 1, 0, 0, 1, 1,
-1.327874, -0.3282311, -0.1227102, 1, 0, 0, 1, 1,
-1.32603, -0.4705163, -1.976255, 1, 0, 0, 1, 1,
-1.322828, 0.03761338, -1.168229, 1, 0, 0, 1, 1,
-1.316758, -1.221847, -2.639355, 0, 0, 0, 1, 1,
-1.311064, -0.4228004, -0.5921622, 0, 0, 0, 1, 1,
-1.302807, -0.3075739, -1.133759, 0, 0, 0, 1, 1,
-1.301463, -0.3488174, -0.6330302, 0, 0, 0, 1, 1,
-1.300478, 0.5599225, -1.434082, 0, 0, 0, 1, 1,
-1.290869, -0.00172057, -1.490775, 0, 0, 0, 1, 1,
-1.279802, -0.5166621, -1.909707, 0, 0, 0, 1, 1,
-1.268786, -0.342456, -1.335801, 1, 1, 1, 1, 1,
-1.262044, -0.2004826, -0.8752195, 1, 1, 1, 1, 1,
-1.261161, -1.188825, -3.67201, 1, 1, 1, 1, 1,
-1.257919, -0.333006, -2.121542, 1, 1, 1, 1, 1,
-1.254867, 1.562213, -0.8162468, 1, 1, 1, 1, 1,
-1.253313, -1.076232, -0.6810673, 1, 1, 1, 1, 1,
-1.243799, -0.06213369, -0.8464961, 1, 1, 1, 1, 1,
-1.23907, 0.8319976, -0.372966, 1, 1, 1, 1, 1,
-1.235469, 0.4258739, -4.378843, 1, 1, 1, 1, 1,
-1.226536, 1.270043, -0.9759293, 1, 1, 1, 1, 1,
-1.225684, 0.998462, -2.021883, 1, 1, 1, 1, 1,
-1.223913, -1.418219, -2.559003, 1, 1, 1, 1, 1,
-1.223106, -0.8034029, -2.655351, 1, 1, 1, 1, 1,
-1.214941, 0.7353016, -1.577646, 1, 1, 1, 1, 1,
-1.213178, 0.4479882, -2.967576, 1, 1, 1, 1, 1,
-1.208531, -0.02882893, -2.628044, 0, 0, 1, 1, 1,
-1.20287, -0.355806, -0.3668318, 1, 0, 0, 1, 1,
-1.201672, 1.096842, -0.03955614, 1, 0, 0, 1, 1,
-1.189878, -0.7054832, -2.807368, 1, 0, 0, 1, 1,
-1.189626, 0.3029495, -2.785711, 1, 0, 0, 1, 1,
-1.185621, 0.5948876, 0.310234, 1, 0, 0, 1, 1,
-1.184204, 1.144182, -0.7906021, 0, 0, 0, 1, 1,
-1.181153, 2.167332, -0.9957829, 0, 0, 0, 1, 1,
-1.179782, -1.029887, -3.707897, 0, 0, 0, 1, 1,
-1.179739, -0.8925955, -0.1667416, 0, 0, 0, 1, 1,
-1.177372, 0.8679644, -2.070132, 0, 0, 0, 1, 1,
-1.176764, -1.284639, -2.355205, 0, 0, 0, 1, 1,
-1.175707, -0.2937649, -1.913391, 0, 0, 0, 1, 1,
-1.168562, -0.8030105, -0.7798303, 1, 1, 1, 1, 1,
-1.166719, 0.9187478, -2.051694, 1, 1, 1, 1, 1,
-1.160315, -0.6778586, -2.746969, 1, 1, 1, 1, 1,
-1.159174, 0.9303845, -0.1804266, 1, 1, 1, 1, 1,
-1.156788, 0.3359405, -2.144707, 1, 1, 1, 1, 1,
-1.144879, -0.9332689, -1.444788, 1, 1, 1, 1, 1,
-1.144557, -2.051942, -2.430016, 1, 1, 1, 1, 1,
-1.142028, 0.7005326, -1.691045, 1, 1, 1, 1, 1,
-1.140988, -0.06196096, -3.26164, 1, 1, 1, 1, 1,
-1.137732, -1.023412, -2.682201, 1, 1, 1, 1, 1,
-1.133105, -0.6440933, -1.673623, 1, 1, 1, 1, 1,
-1.129192, -1.02485, -3.88729, 1, 1, 1, 1, 1,
-1.125441, 1.443335, -0.9994341, 1, 1, 1, 1, 1,
-1.121638, -1.480615, -3.044616, 1, 1, 1, 1, 1,
-1.114625, 2.210831, 0.9206446, 1, 1, 1, 1, 1,
-1.112865, -0.6067332, -3.397804, 0, 0, 1, 1, 1,
-1.110644, 0.2676915, -2.302525, 1, 0, 0, 1, 1,
-1.102071, 0.3500772, -0.4135415, 1, 0, 0, 1, 1,
-1.094126, -0.686341, -2.514477, 1, 0, 0, 1, 1,
-1.085732, -0.1874236, -1.279617, 1, 0, 0, 1, 1,
-1.083231, 2.511849, -0.6543207, 1, 0, 0, 1, 1,
-1.078242, 0.6011941, -1.925728, 0, 0, 0, 1, 1,
-1.075152, -0.8191098, -3.535369, 0, 0, 0, 1, 1,
-1.071389, -1.021525, -0.6290271, 0, 0, 0, 1, 1,
-1.061809, 0.9912438, 0.0868296, 0, 0, 0, 1, 1,
-1.060517, 0.967842, -1.281416, 0, 0, 0, 1, 1,
-1.05857, 0.3053167, -3.107608, 0, 0, 0, 1, 1,
-1.056978, -1.259847, -2.658358, 0, 0, 0, 1, 1,
-1.04811, -0.2999071, -2.32161, 1, 1, 1, 1, 1,
-1.041302, 1.461542, -0.2656228, 1, 1, 1, 1, 1,
-1.029848, 1.618433, -0.679773, 1, 1, 1, 1, 1,
-1.028264, 0.8327374, -0.2267953, 1, 1, 1, 1, 1,
-1.01678, -0.4769958, -3.329579, 1, 1, 1, 1, 1,
-1.011453, -1.03435, -2.077215, 1, 1, 1, 1, 1,
-1.007313, -0.6413643, -2.984089, 1, 1, 1, 1, 1,
-1.003612, -0.3064796, -3.087579, 1, 1, 1, 1, 1,
-1.003211, 1.475151, 1.159659, 1, 1, 1, 1, 1,
-0.9982088, -0.7117991, -1.339458, 1, 1, 1, 1, 1,
-0.9941794, -0.04235047, -1.717725, 1, 1, 1, 1, 1,
-0.9923502, 0.6687071, -2.189118, 1, 1, 1, 1, 1,
-0.9864879, 0.5514192, 0.7389206, 1, 1, 1, 1, 1,
-0.9808424, 0.4017083, -0.4528145, 1, 1, 1, 1, 1,
-0.9770817, 1.272141, -2.701173, 1, 1, 1, 1, 1,
-0.9698706, -0.9161599, -1.824811, 0, 0, 1, 1, 1,
-0.965829, 0.8811905, -1.837166, 1, 0, 0, 1, 1,
-0.9653227, 1.935475, -1.347995, 1, 0, 0, 1, 1,
-0.9630987, -0.3260058, -1.530962, 1, 0, 0, 1, 1,
-0.9540738, 0.155578, -1.263616, 1, 0, 0, 1, 1,
-0.9488564, 0.3590189, -0.9927903, 1, 0, 0, 1, 1,
-0.9483701, -0.4432088, -2.554813, 0, 0, 0, 1, 1,
-0.9461687, -0.6088, -2.07891, 0, 0, 0, 1, 1,
-0.9435462, -0.8846741, -2.88834, 0, 0, 0, 1, 1,
-0.931595, -0.1143291, -0.1952668, 0, 0, 0, 1, 1,
-0.9260651, -3.082647, -3.551914, 0, 0, 0, 1, 1,
-0.9080403, 1.039206, -2.325428, 0, 0, 0, 1, 1,
-0.8954746, -0.5038132, -2.059309, 0, 0, 0, 1, 1,
-0.8839889, -0.900659, -1.790601, 1, 1, 1, 1, 1,
-0.8762537, -1.209331, -1.543138, 1, 1, 1, 1, 1,
-0.8745837, 0.2505066, -0.675159, 1, 1, 1, 1, 1,
-0.8719404, 0.1007896, -3.167129, 1, 1, 1, 1, 1,
-0.8709822, 0.7094151, -0.7940249, 1, 1, 1, 1, 1,
-0.8708584, 0.3062919, -1.142094, 1, 1, 1, 1, 1,
-0.8675681, 0.8059193, -1.5691, 1, 1, 1, 1, 1,
-0.8625184, 1.303156, -2.718155, 1, 1, 1, 1, 1,
-0.8619521, 1.067317, -0.06589381, 1, 1, 1, 1, 1,
-0.8582877, -1.224336, -1.268585, 1, 1, 1, 1, 1,
-0.8512666, -1.829144, -3.150989, 1, 1, 1, 1, 1,
-0.8470111, 0.1103891, -1.853725, 1, 1, 1, 1, 1,
-0.8426666, 1.002787, -0.9968151, 1, 1, 1, 1, 1,
-0.837714, 2.595587, 1.233914, 1, 1, 1, 1, 1,
-0.8308697, 0.2628848, -1.061225, 1, 1, 1, 1, 1,
-0.8300335, 0.5720429, -1.474446, 0, 0, 1, 1, 1,
-0.8298165, -0.5559074, -2.373091, 1, 0, 0, 1, 1,
-0.8272139, -0.5276219, -2.245258, 1, 0, 0, 1, 1,
-0.8261942, 0.3060304, -2.386193, 1, 0, 0, 1, 1,
-0.8241714, -0.260387, -2.761173, 1, 0, 0, 1, 1,
-0.8212998, 0.0001459546, -2.169888, 1, 0, 0, 1, 1,
-0.8196491, 1.096771, 1.185425, 0, 0, 0, 1, 1,
-0.8159192, 0.8498752, 0.2032835, 0, 0, 0, 1, 1,
-0.8154386, -0.3504396, -1.654391, 0, 0, 0, 1, 1,
-0.8140053, 0.5305626, -0.4504681, 0, 0, 0, 1, 1,
-0.8132499, 2.165769, 0.4339791, 0, 0, 0, 1, 1,
-0.8072286, -0.6193109, -2.175518, 0, 0, 0, 1, 1,
-0.8056422, -2.113742, -4.316467, 0, 0, 0, 1, 1,
-0.8016968, -0.4101657, -1.580061, 1, 1, 1, 1, 1,
-0.8013152, -0.04710025, -2.235667, 1, 1, 1, 1, 1,
-0.7906212, 0.2079656, -0.9529883, 1, 1, 1, 1, 1,
-0.7891056, -0.8220719, -2.347171, 1, 1, 1, 1, 1,
-0.7773572, 0.490592, -2.846132, 1, 1, 1, 1, 1,
-0.7762231, 0.2041219, -2.306748, 1, 1, 1, 1, 1,
-0.7760055, 0.04237267, -2.965455, 1, 1, 1, 1, 1,
-0.7735815, -0.07044068, -2.245741, 1, 1, 1, 1, 1,
-0.7678228, 1.05814, -1.749193, 1, 1, 1, 1, 1,
-0.7643669, 0.03705114, -2.011156, 1, 1, 1, 1, 1,
-0.760792, 0.2836765, -1.222475, 1, 1, 1, 1, 1,
-0.7548197, -0.9545738, -1.962995, 1, 1, 1, 1, 1,
-0.7531531, -0.8867329, -3.776944, 1, 1, 1, 1, 1,
-0.7496113, 0.8123977, -0.9944718, 1, 1, 1, 1, 1,
-0.7483364, -0.5159255, -2.387261, 1, 1, 1, 1, 1,
-0.7463332, -0.4920772, -1.876108, 0, 0, 1, 1, 1,
-0.7461962, 0.9223589, 0.5226283, 1, 0, 0, 1, 1,
-0.7420046, 1.203797, -1.018575, 1, 0, 0, 1, 1,
-0.7395692, -0.4640358, -2.358857, 1, 0, 0, 1, 1,
-0.7384407, -1.128188, -1.924995, 1, 0, 0, 1, 1,
-0.7376441, 0.1674715, -1.366349, 1, 0, 0, 1, 1,
-0.7223809, -0.1994571, -1.598332, 0, 0, 0, 1, 1,
-0.710234, -0.2089538, 0.01431959, 0, 0, 0, 1, 1,
-0.7093802, -0.5000544, -2.067794, 0, 0, 0, 1, 1,
-0.7005655, 0.1921314, -1.569783, 0, 0, 0, 1, 1,
-0.7001321, 0.6474169, 0.4674305, 0, 0, 0, 1, 1,
-0.699333, -0.6128793, -1.496951, 0, 0, 0, 1, 1,
-0.6971862, 1.336901, -2.200118, 0, 0, 0, 1, 1,
-0.6943545, 1.339957, 0.2706511, 1, 1, 1, 1, 1,
-0.6890422, -1.017317, -1.978018, 1, 1, 1, 1, 1,
-0.6846316, 0.3180977, -3.982499, 1, 1, 1, 1, 1,
-0.6845226, 0.04451901, -1.335981, 1, 1, 1, 1, 1,
-0.6844553, 0.5745457, -1.557418, 1, 1, 1, 1, 1,
-0.6812679, -0.4389957, -2.67355, 1, 1, 1, 1, 1,
-0.680867, -0.1802587, -2.433587, 1, 1, 1, 1, 1,
-0.6733074, -2.012527, -1.680226, 1, 1, 1, 1, 1,
-0.6642066, 1.108715, -0.959575, 1, 1, 1, 1, 1,
-0.6606747, -0.759204, -1.646727, 1, 1, 1, 1, 1,
-0.6560826, 0.5481852, -0.5773509, 1, 1, 1, 1, 1,
-0.6550758, 0.6943827, -1.233279, 1, 1, 1, 1, 1,
-0.6516234, -1.742604, -2.24251, 1, 1, 1, 1, 1,
-0.6512294, 0.5830622, -0.7226462, 1, 1, 1, 1, 1,
-0.6503941, 0.3308653, -0.8763136, 1, 1, 1, 1, 1,
-0.6477149, -0.8378071, -1.800862, 0, 0, 1, 1, 1,
-0.6475399, -0.232106, -0.07177692, 1, 0, 0, 1, 1,
-0.6447108, 0.9227968, 1.167466, 1, 0, 0, 1, 1,
-0.6425315, 1.005486, -1.82353, 1, 0, 0, 1, 1,
-0.6252252, 1.152868, 0.08746961, 1, 0, 0, 1, 1,
-0.6244228, 1.439953, 0.2489311, 1, 0, 0, 1, 1,
-0.6233184, 0.364241, -1.609364, 0, 0, 0, 1, 1,
-0.6159182, -0.9193293, -2.25929, 0, 0, 0, 1, 1,
-0.6137358, 0.6453335, -0.9733173, 0, 0, 0, 1, 1,
-0.6129645, 2.455724, -1.1705, 0, 0, 0, 1, 1,
-0.6124315, 0.004662732, -2.552116, 0, 0, 0, 1, 1,
-0.612345, 0.8103783, -1.586085, 0, 0, 0, 1, 1,
-0.6021145, 0.128725, -2.047083, 0, 0, 0, 1, 1,
-0.597882, 0.4262651, -0.1147898, 1, 1, 1, 1, 1,
-0.5904363, -0.3060226, -3.408307, 1, 1, 1, 1, 1,
-0.5830743, 0.2619985, -2.392888, 1, 1, 1, 1, 1,
-0.5828744, 0.2975257, -1.460445, 1, 1, 1, 1, 1,
-0.5781478, 0.8731998, -1.470098, 1, 1, 1, 1, 1,
-0.573239, -1.678143, -2.393941, 1, 1, 1, 1, 1,
-0.5671619, -1.812517, -2.086385, 1, 1, 1, 1, 1,
-0.5653492, -0.9497858, -2.948926, 1, 1, 1, 1, 1,
-0.5639322, 0.3951275, 0.3878676, 1, 1, 1, 1, 1,
-0.5574362, -1.025073, -3.500829, 1, 1, 1, 1, 1,
-0.5555683, -1.425544, -2.126089, 1, 1, 1, 1, 1,
-0.5505404, 0.3303173, -2.951745, 1, 1, 1, 1, 1,
-0.5502388, 0.4885865, -0.650488, 1, 1, 1, 1, 1,
-0.5496289, 0.3730204, -0.749401, 1, 1, 1, 1, 1,
-0.549188, 1.126402, -1.059856, 1, 1, 1, 1, 1,
-0.5466691, 0.6907694, -2.261806, 0, 0, 1, 1, 1,
-0.5445674, 0.50138, -1.580292, 1, 0, 0, 1, 1,
-0.5434372, 2.161893, -1.567507, 1, 0, 0, 1, 1,
-0.539924, 2.150689, 0.01891487, 1, 0, 0, 1, 1,
-0.5295167, 0.4884911, -1.504346, 1, 0, 0, 1, 1,
-0.5279132, 0.709294, 0.6147447, 1, 0, 0, 1, 1,
-0.5206684, -1.620955, -4.735563, 0, 0, 0, 1, 1,
-0.5176145, -1.145795, -3.156583, 0, 0, 0, 1, 1,
-0.516554, 0.1056562, -0.02901085, 0, 0, 0, 1, 1,
-0.5120005, 0.2786776, -0.4166086, 0, 0, 0, 1, 1,
-0.5079669, -1.761065, -1.473024, 0, 0, 0, 1, 1,
-0.5022144, 2.034313, -0.0993793, 0, 0, 0, 1, 1,
-0.5009992, 0.1480903, -1.802062, 0, 0, 0, 1, 1,
-0.4956709, 1.242667, -1.783397, 1, 1, 1, 1, 1,
-0.4939718, -0.2363529, -1.611291, 1, 1, 1, 1, 1,
-0.4938543, 0.8033763, 0.1586859, 1, 1, 1, 1, 1,
-0.4913198, -1.358317, -3.037922, 1, 1, 1, 1, 1,
-0.4903837, -1.486296, -5.724904, 1, 1, 1, 1, 1,
-0.4883762, 0.396266, -1.704705, 1, 1, 1, 1, 1,
-0.4878972, -0.1856514, -2.76792, 1, 1, 1, 1, 1,
-0.474013, -2.309725, -2.174536, 1, 1, 1, 1, 1,
-0.4737087, 1.208232, 0.1058318, 1, 1, 1, 1, 1,
-0.4674045, -1.725639, -2.746408, 1, 1, 1, 1, 1,
-0.466052, 1.148976, 0.4081614, 1, 1, 1, 1, 1,
-0.4646823, 0.2862547, -0.6776682, 1, 1, 1, 1, 1,
-0.4635517, -1.51565, -4.173347, 1, 1, 1, 1, 1,
-0.4617703, 0.7220072, -1.920532, 1, 1, 1, 1, 1,
-0.4614795, 0.6843584, 0.6351941, 1, 1, 1, 1, 1,
-0.4514626, 1.239901, -0.3998635, 0, 0, 1, 1, 1,
-0.4475639, -0.326141, -2.544659, 1, 0, 0, 1, 1,
-0.4444378, 0.2905346, -0.7325208, 1, 0, 0, 1, 1,
-0.441359, -0.3992777, -1.94826, 1, 0, 0, 1, 1,
-0.440906, 1.702398, 0.377435, 1, 0, 0, 1, 1,
-0.4407074, 1.178206, -1.163578, 1, 0, 0, 1, 1,
-0.4396643, 0.02307164, -2.334183, 0, 0, 0, 1, 1,
-0.4391158, -0.02995883, -0.5163817, 0, 0, 0, 1, 1,
-0.4372302, -0.6827334, -2.477127, 0, 0, 0, 1, 1,
-0.4369939, 0.1975117, -0.5245413, 0, 0, 0, 1, 1,
-0.4297523, 0.9788676, 0.2253588, 0, 0, 0, 1, 1,
-0.4286865, 1.511924, 2.629222, 0, 0, 0, 1, 1,
-0.4277067, -1.00479, -3.067826, 0, 0, 0, 1, 1,
-0.4203676, -0.7192435, -3.359956, 1, 1, 1, 1, 1,
-0.4111461, 1.305373, -0.2048751, 1, 1, 1, 1, 1,
-0.4079189, 1.150985, 0.007866981, 1, 1, 1, 1, 1,
-0.4078187, -1.730713, -2.284106, 1, 1, 1, 1, 1,
-0.4049515, -1.194421, -2.547651, 1, 1, 1, 1, 1,
-0.4029446, 1.224471, -2.206905, 1, 1, 1, 1, 1,
-0.4021508, -0.3618711, -2.794883, 1, 1, 1, 1, 1,
-0.3985322, 0.4149061, -1.169801, 1, 1, 1, 1, 1,
-0.3980162, -0.06216535, -0.6716022, 1, 1, 1, 1, 1,
-0.3942018, 0.3213916, -2.135834, 1, 1, 1, 1, 1,
-0.3921401, -0.733877, -2.078874, 1, 1, 1, 1, 1,
-0.3874432, -1.323714, -1.357724, 1, 1, 1, 1, 1,
-0.3834135, -0.4611811, -4.013351, 1, 1, 1, 1, 1,
-0.3784451, -1.958717, -3.882024, 1, 1, 1, 1, 1,
-0.3771597, 0.7530978, -0.7968915, 1, 1, 1, 1, 1,
-0.3694595, 1.177583, -0.8096957, 0, 0, 1, 1, 1,
-0.3680938, -0.5538958, -3.597933, 1, 0, 0, 1, 1,
-0.3650832, -1.70078, -2.767787, 1, 0, 0, 1, 1,
-0.3647498, -0.8881783, -2.341199, 1, 0, 0, 1, 1,
-0.3645065, -1.789399, -5.046028, 1, 0, 0, 1, 1,
-0.3627884, 0.289499, -2.41944, 1, 0, 0, 1, 1,
-0.3597515, 2.391182, -1.31403, 0, 0, 0, 1, 1,
-0.3593081, -1.82955, -2.357151, 0, 0, 0, 1, 1,
-0.357042, -1.455373, -3.964029, 0, 0, 0, 1, 1,
-0.3564376, 1.374793, 0.8446217, 0, 0, 0, 1, 1,
-0.3541376, -0.6276578, -2.255468, 0, 0, 0, 1, 1,
-0.351643, -0.3648699, -2.15026, 0, 0, 0, 1, 1,
-0.3499634, 0.8275613, -0.609325, 0, 0, 0, 1, 1,
-0.3475123, -0.927949, -2.778106, 1, 1, 1, 1, 1,
-0.338654, 0.09781206, -1.10949, 1, 1, 1, 1, 1,
-0.3382683, 0.1733815, -0.4601489, 1, 1, 1, 1, 1,
-0.337022, 1.056742, -0.3861576, 1, 1, 1, 1, 1,
-0.334616, -0.1676287, -1.570324, 1, 1, 1, 1, 1,
-0.3341953, -0.5522178, -4.716666, 1, 1, 1, 1, 1,
-0.3321462, 1.091988, 0.6513665, 1, 1, 1, 1, 1,
-0.3317073, 0.5929879, -2.87606, 1, 1, 1, 1, 1,
-0.3284425, 0.705775, -0.2784048, 1, 1, 1, 1, 1,
-0.3271325, 2.370881, 0.193416, 1, 1, 1, 1, 1,
-0.3192027, -2.627568, -2.28311, 1, 1, 1, 1, 1,
-0.3191672, -0.6874257, -3.190076, 1, 1, 1, 1, 1,
-0.31659, -0.9431615, -1.534079, 1, 1, 1, 1, 1,
-0.3105768, 0.1800219, -2.665272, 1, 1, 1, 1, 1,
-0.3102399, 0.7800191, -2.528261, 1, 1, 1, 1, 1,
-0.3101344, 0.08706892, -3.291159, 0, 0, 1, 1, 1,
-0.3076396, 1.137158, 0.5369972, 1, 0, 0, 1, 1,
-0.3048294, -0.1730382, -2.541629, 1, 0, 0, 1, 1,
-0.3009335, -0.1100058, -0.2526325, 1, 0, 0, 1, 1,
-0.3008923, -0.7819145, -2.612522, 1, 0, 0, 1, 1,
-0.2984962, -0.2206578, -1.385976, 1, 0, 0, 1, 1,
-0.297024, 0.5513938, -2.148754, 0, 0, 0, 1, 1,
-0.2887873, 0.8670413, -0.4685823, 0, 0, 0, 1, 1,
-0.2883858, 0.4471115, 0.6870893, 0, 0, 0, 1, 1,
-0.2865035, -0.6308222, -2.939019, 0, 0, 0, 1, 1,
-0.2834006, 1.928785, -0.05026829, 0, 0, 0, 1, 1,
-0.282432, 1.165022, -0.900966, 0, 0, 0, 1, 1,
-0.2784759, 0.9014157, -1.008324, 0, 0, 0, 1, 1,
-0.2762035, 0.5112776, -2.037851, 1, 1, 1, 1, 1,
-0.2761947, 0.3737522, 1.243251, 1, 1, 1, 1, 1,
-0.2710894, 0.2678834, 0.02369009, 1, 1, 1, 1, 1,
-0.2693798, -0.003085757, -0.9011019, 1, 1, 1, 1, 1,
-0.2660631, 0.4652148, -0.4854086, 1, 1, 1, 1, 1,
-0.2592362, -1.00666, -4.222462, 1, 1, 1, 1, 1,
-0.2553931, 0.09651562, -1.784779, 1, 1, 1, 1, 1,
-0.2542967, 0.09390219, -2.882477, 1, 1, 1, 1, 1,
-0.2533997, 0.02229197, -1.98349, 1, 1, 1, 1, 1,
-0.2488034, -0.006599888, -1.957999, 1, 1, 1, 1, 1,
-0.2483665, 0.6902708, -0.792734, 1, 1, 1, 1, 1,
-0.2482043, -0.7732196, -2.103521, 1, 1, 1, 1, 1,
-0.2474729, -1.101865, -1.77058, 1, 1, 1, 1, 1,
-0.2408055, -0.3286738, -2.519965, 1, 1, 1, 1, 1,
-0.2367273, 0.5530443, -0.5671775, 1, 1, 1, 1, 1,
-0.2320324, 0.7336714, -0.2619694, 0, 0, 1, 1, 1,
-0.2300958, -0.2208298, -2.02187, 1, 0, 0, 1, 1,
-0.2297383, 0.4796929, -1.932912, 1, 0, 0, 1, 1,
-0.2289035, -0.6690693, -2.591247, 1, 0, 0, 1, 1,
-0.2086063, -0.7614123, -3.755441, 1, 0, 0, 1, 1,
-0.2082013, -1.245612, -2.743753, 1, 0, 0, 1, 1,
-0.2080299, 0.1604714, -0.882952, 0, 0, 0, 1, 1,
-0.2051011, 2.132486, -1.080422, 0, 0, 0, 1, 1,
-0.2016508, -0.8920662, -2.484898, 0, 0, 0, 1, 1,
-0.1972508, -0.7993196, -3.455721, 0, 0, 0, 1, 1,
-0.1970892, -0.214543, -2.460246, 0, 0, 0, 1, 1,
-0.1932113, 0.5148821, 0.6051928, 0, 0, 0, 1, 1,
-0.1847841, -1.056524, -3.261721, 0, 0, 0, 1, 1,
-0.1773149, -0.8158754, -4.827928, 1, 1, 1, 1, 1,
-0.1768993, -1.204198, -4.698865, 1, 1, 1, 1, 1,
-0.1756662, -0.1178226, -1.538151, 1, 1, 1, 1, 1,
-0.17457, 0.4567662, -1.664804, 1, 1, 1, 1, 1,
-0.1600864, 0.5713862, 1.496515, 1, 1, 1, 1, 1,
-0.1526261, -1.285737, -2.737951, 1, 1, 1, 1, 1,
-0.1504326, -0.8818301, -1.273891, 1, 1, 1, 1, 1,
-0.14861, 2.967072, -0.6536247, 1, 1, 1, 1, 1,
-0.1426713, -0.2889182, -3.145948, 1, 1, 1, 1, 1,
-0.1406709, -1.737407, -2.364452, 1, 1, 1, 1, 1,
-0.1307905, 1.132682, 1.016078, 1, 1, 1, 1, 1,
-0.1302072, -2.013595, -3.303493, 1, 1, 1, 1, 1,
-0.1286922, -0.0628401, -2.21714, 1, 1, 1, 1, 1,
-0.1263687, 1.576063, 0.260422, 1, 1, 1, 1, 1,
-0.126195, -0.6018285, -2.946594, 1, 1, 1, 1, 1,
-0.1221777, -0.4195596, -3.298654, 0, 0, 1, 1, 1,
-0.1193815, 1.472236, 0.3508737, 1, 0, 0, 1, 1,
-0.1186345, 0.7716746, -1.013572, 1, 0, 0, 1, 1,
-0.1168602, 1.273495, 0.577785, 1, 0, 0, 1, 1,
-0.1142931, 0.2666723, -2.92716, 1, 0, 0, 1, 1,
-0.1142129, 0.561968, -0.3682688, 1, 0, 0, 1, 1,
-0.1094688, 0.7146656, 1.314232, 0, 0, 0, 1, 1,
-0.1082868, 0.3537695, -1.66919, 0, 0, 0, 1, 1,
-0.1078796, 1.716328, 2.526443, 0, 0, 0, 1, 1,
-0.1048098, 1.498271, -1.25076, 0, 0, 0, 1, 1,
-0.09935609, -0.005129911, -1.568062, 0, 0, 0, 1, 1,
-0.09704011, 0.5114372, -0.3431424, 0, 0, 0, 1, 1,
-0.09479865, -0.001153494, -1.918201, 0, 0, 0, 1, 1,
-0.09390417, -1.831183, -5.044051, 1, 1, 1, 1, 1,
-0.092373, 0.6082363, 0.1014261, 1, 1, 1, 1, 1,
-0.08634367, 0.1508717, -0.5481794, 1, 1, 1, 1, 1,
-0.08606102, -0.3432603, -2.836608, 1, 1, 1, 1, 1,
-0.08468959, 1.007177, 0.1490755, 1, 1, 1, 1, 1,
-0.08285329, -0.6124135, -3.388895, 1, 1, 1, 1, 1,
-0.08136563, -0.5362306, -2.924194, 1, 1, 1, 1, 1,
-0.07832856, 1.253179, 1.473878, 1, 1, 1, 1, 1,
-0.07078835, 0.3317401, -1.028416, 1, 1, 1, 1, 1,
-0.07048752, -1.508031, -2.734204, 1, 1, 1, 1, 1,
-0.06757681, 0.805407, 0.1797861, 1, 1, 1, 1, 1,
-0.06208661, -0.7472149, -3.715616, 1, 1, 1, 1, 1,
-0.05705207, -0.1428277, -2.392526, 1, 1, 1, 1, 1,
-0.05630742, 0.413307, 0.6391212, 1, 1, 1, 1, 1,
-0.05625055, 1.521584, -0.3358993, 1, 1, 1, 1, 1,
-0.05584291, 1.397856, 0.337146, 0, 0, 1, 1, 1,
-0.05401845, 0.893399, -1.655755, 1, 0, 0, 1, 1,
-0.05356793, -0.6302767, -1.594688, 1, 0, 0, 1, 1,
-0.05308185, 0.0005746434, -0.3006736, 1, 0, 0, 1, 1,
-0.0511899, -1.839578, -2.448791, 1, 0, 0, 1, 1,
-0.05080688, 0.3223161, 0.4488585, 1, 0, 0, 1, 1,
-0.04816565, -0.2356838, -3.894069, 0, 0, 0, 1, 1,
-0.04765948, -0.6291605, -3.066826, 0, 0, 0, 1, 1,
-0.04634678, 2.668319, 1.554939, 0, 0, 0, 1, 1,
-0.04312566, 0.08147315, 0.08626173, 0, 0, 0, 1, 1,
-0.0408696, 0.346557, -0.3562565, 0, 0, 0, 1, 1,
-0.04017054, -2.96281, -2.464689, 0, 0, 0, 1, 1,
-0.0352339, -0.5699899, -3.518271, 0, 0, 0, 1, 1,
-0.03245043, -0.5932506, -2.862461, 1, 1, 1, 1, 1,
-0.02940659, 1.155473, -2.263587, 1, 1, 1, 1, 1,
-0.02754917, 0.8948639, -0.4618239, 1, 1, 1, 1, 1,
-0.02667828, -0.6291468, -2.4732, 1, 1, 1, 1, 1,
-0.0259063, 0.1452301, -0.817988, 1, 1, 1, 1, 1,
-0.0245514, -0.4669217, -2.239473, 1, 1, 1, 1, 1,
-0.02411729, 0.5587276, 1.045571, 1, 1, 1, 1, 1,
-0.02340959, -0.1836355, -2.531702, 1, 1, 1, 1, 1,
-0.01780603, -0.3280841, -3.856138, 1, 1, 1, 1, 1,
-0.006741616, 0.4464432, -0.1641499, 1, 1, 1, 1, 1,
-0.006600509, 0.1292215, 0.3079162, 1, 1, 1, 1, 1,
-0.003718685, 1.682419, 1.095805, 1, 1, 1, 1, 1,
0.0001177198, 1.724528, 0.4105219, 1, 1, 1, 1, 1,
0.002139075, -0.06050541, 3.248407, 1, 1, 1, 1, 1,
0.003437278, -0.6557202, 2.04251, 1, 1, 1, 1, 1,
0.003869207, -1.158986, 1.356109, 0, 0, 1, 1, 1,
0.006844213, 0.06229069, -0.1666344, 1, 0, 0, 1, 1,
0.00748922, 0.04197002, -0.2310494, 1, 0, 0, 1, 1,
0.008506828, 1.073725, -0.05236176, 1, 0, 0, 1, 1,
0.01250902, -0.2152506, 1.877557, 1, 0, 0, 1, 1,
0.01867973, -1.518141, 2.002766, 1, 0, 0, 1, 1,
0.01986652, -0.4436403, 3.379934, 0, 0, 0, 1, 1,
0.02106118, 1.164601, 1.622791, 0, 0, 0, 1, 1,
0.02283301, -0.5072683, 4.125335, 0, 0, 0, 1, 1,
0.02316848, -0.7803883, 2.873204, 0, 0, 0, 1, 1,
0.02332293, 1.021287, 0.07622977, 0, 0, 0, 1, 1,
0.02336191, 0.9274288, -1.923662, 0, 0, 0, 1, 1,
0.02412455, -0.4029619, 5.321409, 0, 0, 0, 1, 1,
0.02588574, 0.2424647, -1.313457, 1, 1, 1, 1, 1,
0.02679312, 0.591938, -0.7711607, 1, 1, 1, 1, 1,
0.02787119, -0.02486193, 3.509043, 1, 1, 1, 1, 1,
0.03178991, 0.9084249, 0.3383666, 1, 1, 1, 1, 1,
0.03185763, -1.236307, 3.219368, 1, 1, 1, 1, 1,
0.03567443, 0.9989601, 0.1572462, 1, 1, 1, 1, 1,
0.03957447, -1.125329, 4.360897, 1, 1, 1, 1, 1,
0.04505743, 1.55194, 1.171547, 1, 1, 1, 1, 1,
0.04887663, 2.871555, 1.325964, 1, 1, 1, 1, 1,
0.04926747, 0.6314477, 0.3171147, 1, 1, 1, 1, 1,
0.05252228, -1.43469, 4.353231, 1, 1, 1, 1, 1,
0.055005, 0.6493796, -0.6327133, 1, 1, 1, 1, 1,
0.05562596, -1.741528, 3.922882, 1, 1, 1, 1, 1,
0.05774131, 1.431595, 1.513719, 1, 1, 1, 1, 1,
0.06313834, 1.795925, 0.8616636, 1, 1, 1, 1, 1,
0.06728667, -0.1069505, 2.077675, 0, 0, 1, 1, 1,
0.07781408, 0.3316717, 1.067775, 1, 0, 0, 1, 1,
0.08240493, 1.856083, -0.2926489, 1, 0, 0, 1, 1,
0.0844214, -0.7525674, 1.579564, 1, 0, 0, 1, 1,
0.08687259, 1.670445, 1.288914, 1, 0, 0, 1, 1,
0.08722638, 0.3913376, 1.064911, 1, 0, 0, 1, 1,
0.08763254, 0.9240864, 0.7568812, 0, 0, 0, 1, 1,
0.08956293, 0.7303056, 0.6663754, 0, 0, 0, 1, 1,
0.08956618, 3.057292, -1.344318, 0, 0, 0, 1, 1,
0.09127092, -0.3379171, 3.65937, 0, 0, 0, 1, 1,
0.09193807, -0.3193231, 2.42696, 0, 0, 0, 1, 1,
0.09376639, -1.29863, 3.906556, 0, 0, 0, 1, 1,
0.09644924, 0.8771762, -1.220752, 0, 0, 0, 1, 1,
0.1002791, -1.527737, 3.240712, 1, 1, 1, 1, 1,
0.1014866, 0.4205891, -0.7816505, 1, 1, 1, 1, 1,
0.1073143, 0.2980031, 1.329401, 1, 1, 1, 1, 1,
0.1073535, 1.086285, 1.101288, 1, 1, 1, 1, 1,
0.1119104, 0.1694929, 1.227154, 1, 1, 1, 1, 1,
0.1124873, 1.131891, -1.110516, 1, 1, 1, 1, 1,
0.1130209, 1.123048, 0.7493859, 1, 1, 1, 1, 1,
0.1158976, -0.5535677, 2.438736, 1, 1, 1, 1, 1,
0.1191269, -1.757, 2.718594, 1, 1, 1, 1, 1,
0.1193616, -1.135885, 4.268309, 1, 1, 1, 1, 1,
0.1223165, -0.7956957, 3.283057, 1, 1, 1, 1, 1,
0.1343562, -1.013826, 3.139419, 1, 1, 1, 1, 1,
0.1366471, 0.1152794, 1.603979, 1, 1, 1, 1, 1,
0.1431331, -0.5718635, 2.456944, 1, 1, 1, 1, 1,
0.1438962, -0.870441, 2.48061, 1, 1, 1, 1, 1,
0.1493388, 1.252658, 0.6702843, 0, 0, 1, 1, 1,
0.1511678, -0.9278107, 3.354712, 1, 0, 0, 1, 1,
0.1513716, -1.79634, 3.710419, 1, 0, 0, 1, 1,
0.1562088, 1.630412, 0.2569956, 1, 0, 0, 1, 1,
0.1569656, -0.1914365, 5.502237, 1, 0, 0, 1, 1,
0.1569822, -1.762824, 1.548444, 1, 0, 0, 1, 1,
0.1653088, -1.467147, 2.582131, 0, 0, 0, 1, 1,
0.1661974, 1.318138, 0.7864324, 0, 0, 0, 1, 1,
0.1663399, -0.7609661, 2.028155, 0, 0, 0, 1, 1,
0.1674716, -0.4475717, 1.81021, 0, 0, 0, 1, 1,
0.169811, 2.19078, 1.23303, 0, 0, 0, 1, 1,
0.176469, 1.926482, -0.2112319, 0, 0, 0, 1, 1,
0.1765288, 0.4048458, 2.180146, 0, 0, 0, 1, 1,
0.1785948, 1.385335, -0.2685566, 1, 1, 1, 1, 1,
0.1799286, 0.2057908, -0.8085788, 1, 1, 1, 1, 1,
0.1814273, -1.104699, 2.9693, 1, 1, 1, 1, 1,
0.1823866, 1.227178, -0.0391029, 1, 1, 1, 1, 1,
0.1846881, 1.366442, -2.044684, 1, 1, 1, 1, 1,
0.1853052, -0.4763904, 2.046219, 1, 1, 1, 1, 1,
0.1890379, -2.121617, 3.490827, 1, 1, 1, 1, 1,
0.1896868, -0.2292559, 2.1638, 1, 1, 1, 1, 1,
0.1899627, -0.9455551, 3.000052, 1, 1, 1, 1, 1,
0.192596, 0.1067938, 1.239808, 1, 1, 1, 1, 1,
0.1972261, -0.160201, 3.032254, 1, 1, 1, 1, 1,
0.1977131, 0.7047699, 0.9553105, 1, 1, 1, 1, 1,
0.1992657, 1.863213, 1.01171, 1, 1, 1, 1, 1,
0.2069062, 1.87192, 0.02051742, 1, 1, 1, 1, 1,
0.2101681, 0.1034212, 1.499614, 1, 1, 1, 1, 1,
0.2113172, 0.02475327, 2.313589, 0, 0, 1, 1, 1,
0.2138751, 0.2931695, 0.1102426, 1, 0, 0, 1, 1,
0.2178448, -1.811742, 3.550607, 1, 0, 0, 1, 1,
0.2185363, 0.1654172, 0.5035552, 1, 0, 0, 1, 1,
0.2190704, 1.554798, 0.3323288, 1, 0, 0, 1, 1,
0.2245574, -1.613499, 3.211298, 1, 0, 0, 1, 1,
0.2289004, -1.42673, 2.381664, 0, 0, 0, 1, 1,
0.231232, -0.5184498, 2.371822, 0, 0, 0, 1, 1,
0.2388003, -2.073861, 5.272004, 0, 0, 0, 1, 1,
0.2390237, 0.4135219, 1.472845, 0, 0, 0, 1, 1,
0.2391582, 0.6758218, 0.9250011, 0, 0, 0, 1, 1,
0.24038, -0.1925538, 2.816508, 0, 0, 0, 1, 1,
0.2475214, -0.3164426, 4.253111, 0, 0, 0, 1, 1,
0.249077, 1.682981, 0.5325638, 1, 1, 1, 1, 1,
0.2519392, 0.6072243, 0.8754542, 1, 1, 1, 1, 1,
0.2526949, -0.7444862, 0.4534432, 1, 1, 1, 1, 1,
0.253212, -0.8872343, 1.895901, 1, 1, 1, 1, 1,
0.260498, 1.159996, 0.01328491, 1, 1, 1, 1, 1,
0.2622503, -0.1378116, 2.688025, 1, 1, 1, 1, 1,
0.2676431, -0.14805, 1.631254, 1, 1, 1, 1, 1,
0.2677732, -0.3299064, 3.040102, 1, 1, 1, 1, 1,
0.2680323, 0.6694927, -1.949224, 1, 1, 1, 1, 1,
0.2714538, -0.1091265, 0.5139406, 1, 1, 1, 1, 1,
0.2739322, -0.06942867, 1.228478, 1, 1, 1, 1, 1,
0.275122, 0.009098073, 0.3942864, 1, 1, 1, 1, 1,
0.2778846, -1.142967, 4.435308, 1, 1, 1, 1, 1,
0.2807177, -1.414095, 4.078468, 1, 1, 1, 1, 1,
0.2847145, 1.07709, 0.936782, 1, 1, 1, 1, 1,
0.2903889, 1.739302, -0.4965915, 0, 0, 1, 1, 1,
0.2940083, -1.410607, 3.431222, 1, 0, 0, 1, 1,
0.296448, -1.701767, 4.478647, 1, 0, 0, 1, 1,
0.2993921, 0.1240671, 2.295583, 1, 0, 0, 1, 1,
0.3012817, 0.242258, 2.393292, 1, 0, 0, 1, 1,
0.3029579, -0.6100502, 3.040421, 1, 0, 0, 1, 1,
0.3044755, -0.8670136, 2.902025, 0, 0, 0, 1, 1,
0.305372, 0.4014548, 1.754848, 0, 0, 0, 1, 1,
0.3064866, -0.8409335, 3.111121, 0, 0, 0, 1, 1,
0.3108329, -0.3904991, 1.662828, 0, 0, 0, 1, 1,
0.3150604, 0.3244531, 2.331364, 0, 0, 0, 1, 1,
0.3153188, -1.800356, 3.574605, 0, 0, 0, 1, 1,
0.3172287, -1.211609, 4.059789, 0, 0, 0, 1, 1,
0.3190705, -1.240822, 1.77363, 1, 1, 1, 1, 1,
0.3199202, 0.1005288, 1.14835, 1, 1, 1, 1, 1,
0.3213827, 2.060246, -1.373751, 1, 1, 1, 1, 1,
0.3243519, -0.4941708, 2.907512, 1, 1, 1, 1, 1,
0.3264781, -0.003204051, 0.9590309, 1, 1, 1, 1, 1,
0.3278344, 1.526026, 0.1746192, 1, 1, 1, 1, 1,
0.3296546, 0.588786, 0.5229955, 1, 1, 1, 1, 1,
0.3297017, -0.910854, 3.788761, 1, 1, 1, 1, 1,
0.3310645, -0.3581556, 2.661742, 1, 1, 1, 1, 1,
0.3315274, 0.04309264, 0.1436268, 1, 1, 1, 1, 1,
0.3359313, 1.37783, -0.8192175, 1, 1, 1, 1, 1,
0.3364275, 0.5622435, 2.778318, 1, 1, 1, 1, 1,
0.3372582, 0.4200587, -1.112929, 1, 1, 1, 1, 1,
0.3511397, 1.069069, 1.328447, 1, 1, 1, 1, 1,
0.3521213, -0.8810413, 2.527035, 1, 1, 1, 1, 1,
0.3531406, 0.2559793, 0.6139426, 0, 0, 1, 1, 1,
0.3565727, 0.2662559, 1.107869, 1, 0, 0, 1, 1,
0.3642922, -0.01735048, 0.639506, 1, 0, 0, 1, 1,
0.3667903, 1.398595, -0.1756413, 1, 0, 0, 1, 1,
0.3668558, -0.2591093, 1.876201, 1, 0, 0, 1, 1,
0.368249, -0.2487736, 3.101853, 1, 0, 0, 1, 1,
0.373494, -1.660819, 3.989352, 0, 0, 0, 1, 1,
0.3815686, -0.03070324, 1.170536, 0, 0, 0, 1, 1,
0.3855057, 1.141775, 0.8105121, 0, 0, 0, 1, 1,
0.386014, -0.7686362, 2.066877, 0, 0, 0, 1, 1,
0.3876969, -0.6370792, 2.464686, 0, 0, 0, 1, 1,
0.3877518, -0.4234596, 2.245308, 0, 0, 0, 1, 1,
0.3881854, -0.5282927, 0.5065187, 0, 0, 0, 1, 1,
0.3894056, 0.5620868, 0.3449517, 1, 1, 1, 1, 1,
0.3895828, 0.5028806, 1.166493, 1, 1, 1, 1, 1,
0.3914024, 1.980606, 1.431491, 1, 1, 1, 1, 1,
0.397316, 1.033842, 0.0302503, 1, 1, 1, 1, 1,
0.4000533, 0.1811633, 1.044767, 1, 1, 1, 1, 1,
0.4029499, -2.032074, 2.967022, 1, 1, 1, 1, 1,
0.4045492, -1.045434, 2.675541, 1, 1, 1, 1, 1,
0.4051452, -0.1744627, 2.548896, 1, 1, 1, 1, 1,
0.4053262, -0.8618312, 3.650293, 1, 1, 1, 1, 1,
0.4072321, 1.599905, 1.775673, 1, 1, 1, 1, 1,
0.4092692, -1.18295, 2.662095, 1, 1, 1, 1, 1,
0.4112918, -3.600377, 2.976395, 1, 1, 1, 1, 1,
0.4189438, 1.253695, -0.8088528, 1, 1, 1, 1, 1,
0.4200312, -0.9401737, 2.644716, 1, 1, 1, 1, 1,
0.4222153, 0.1599322, 2.108731, 1, 1, 1, 1, 1,
0.4271587, -0.4986359, 0.04975969, 0, 0, 1, 1, 1,
0.4326332, -1.066834, 4.222273, 1, 0, 0, 1, 1,
0.4334634, 0.07606637, 0.4467191, 1, 0, 0, 1, 1,
0.4351391, -0.2376663, 1.242141, 1, 0, 0, 1, 1,
0.4359875, -2.332641, 3.089232, 1, 0, 0, 1, 1,
0.4360276, -2.194696, 1.690255, 1, 0, 0, 1, 1,
0.4373088, -0.1602188, 3.359839, 0, 0, 0, 1, 1,
0.4394575, -0.4016567, 4.265591, 0, 0, 0, 1, 1,
0.4429102, -0.9757429, 2.618916, 0, 0, 0, 1, 1,
0.4482776, -0.2173008, 1.897697, 0, 0, 0, 1, 1,
0.4490468, -2.053818, 3.120497, 0, 0, 0, 1, 1,
0.4527007, 1.547739, 1.598009, 0, 0, 0, 1, 1,
0.4580537, -0.5759683, 2.99073, 0, 0, 0, 1, 1,
0.4608727, 1.631141, -0.2882825, 1, 1, 1, 1, 1,
0.4626544, 0.1845035, -0.9818405, 1, 1, 1, 1, 1,
0.4628925, 2.166984, -0.7777374, 1, 1, 1, 1, 1,
0.4669448, -0.7505202, 3.271706, 1, 1, 1, 1, 1,
0.4674838, -1.351747, 2.415724, 1, 1, 1, 1, 1,
0.4681766, 1.253926, 0.4098001, 1, 1, 1, 1, 1,
0.4690324, 0.460149, 3.049574, 1, 1, 1, 1, 1,
0.4724852, -0.8281088, 1.076805, 1, 1, 1, 1, 1,
0.472956, 0.4329421, 1.483367, 1, 1, 1, 1, 1,
0.4747081, 0.06897218, 0.9853929, 1, 1, 1, 1, 1,
0.4748797, 0.2553084, 0.8509863, 1, 1, 1, 1, 1,
0.475193, 1.01351, 0.178216, 1, 1, 1, 1, 1,
0.4781953, 0.564534, -1.071908, 1, 1, 1, 1, 1,
0.4785228, -0.94663, 2.209935, 1, 1, 1, 1, 1,
0.4821668, 0.2096426, 0.4088641, 1, 1, 1, 1, 1,
0.4822208, -0.8287268, 3.711789, 0, 0, 1, 1, 1,
0.4849029, -0.0313358, 1.659017, 1, 0, 0, 1, 1,
0.4967817, 0.655989, 2.671818, 1, 0, 0, 1, 1,
0.4969468, -0.2368365, 1.525788, 1, 0, 0, 1, 1,
0.4991978, -0.6504542, 1.264243, 1, 0, 0, 1, 1,
0.5035229, 1.084109, 0.6875787, 1, 0, 0, 1, 1,
0.5058248, -0.3728709, 1.542521, 0, 0, 0, 1, 1,
0.5093175, -1.479235, 0.0856048, 0, 0, 0, 1, 1,
0.5094132, -0.6113957, 0.8068411, 0, 0, 0, 1, 1,
0.5094954, -0.2856373, 1.952995, 0, 0, 0, 1, 1,
0.5102875, -1.572032, 2.065069, 0, 0, 0, 1, 1,
0.5125594, 0.1940528, -0.1957217, 0, 0, 0, 1, 1,
0.5209725, 0.7317859, 0.5071431, 0, 0, 0, 1, 1,
0.5262268, 0.892733, -0.425904, 1, 1, 1, 1, 1,
0.5283498, 0.4687772, 0.1852585, 1, 1, 1, 1, 1,
0.5286208, -1.270373, 1.691675, 1, 1, 1, 1, 1,
0.5286341, -0.02634456, 0.4316978, 1, 1, 1, 1, 1,
0.5335377, 1.20179, -0.521662, 1, 1, 1, 1, 1,
0.5339497, -0.5584878, 4.03405, 1, 1, 1, 1, 1,
0.5359393, -0.4476379, 3.888414, 1, 1, 1, 1, 1,
0.538394, -0.4127012, 2.766867, 1, 1, 1, 1, 1,
0.5395503, 0.7955979, -0.505324, 1, 1, 1, 1, 1,
0.5407086, 0.3380027, -0.1300809, 1, 1, 1, 1, 1,
0.5413469, -0.5065126, 2.588634, 1, 1, 1, 1, 1,
0.5435352, -1.68428, 2.619261, 1, 1, 1, 1, 1,
0.5452765, -0.2335392, 1.641587, 1, 1, 1, 1, 1,
0.5462235, -1.403976, 2.672693, 1, 1, 1, 1, 1,
0.5486208, 1.619356, -0.3434121, 1, 1, 1, 1, 1,
0.5487474, 1.882444, 1.237484, 0, 0, 1, 1, 1,
0.5540796, -0.6713468, 2.341186, 1, 0, 0, 1, 1,
0.5552968, -0.5966182, 1.923347, 1, 0, 0, 1, 1,
0.5570548, -0.809209, 1.841793, 1, 0, 0, 1, 1,
0.5598495, 0.866569, 1.81247, 1, 0, 0, 1, 1,
0.5629802, 0.8772206, 1.597703, 1, 0, 0, 1, 1,
0.5633392, -1.708719, 2.798864, 0, 0, 0, 1, 1,
0.565379, -0.8425501, 2.609788, 0, 0, 0, 1, 1,
0.570563, 1.061427, -1.558222, 0, 0, 0, 1, 1,
0.5871273, -0.2461097, 3.191438, 0, 0, 0, 1, 1,
0.5889249, -1.885823, 2.829024, 0, 0, 0, 1, 1,
0.590488, 0.04569172, -0.5079301, 0, 0, 0, 1, 1,
0.5929043, -2.590917, 1.765458, 0, 0, 0, 1, 1,
0.594631, 1.296194, -0.1344959, 1, 1, 1, 1, 1,
0.5990666, -1.8729, 1.701569, 1, 1, 1, 1, 1,
0.5999373, -1.577307, 3.679908, 1, 1, 1, 1, 1,
0.6006316, 0.7461695, 0.07175408, 1, 1, 1, 1, 1,
0.6049094, 0.07102716, 3.031934, 1, 1, 1, 1, 1,
0.6090872, 0.3832, 1.968105, 1, 1, 1, 1, 1,
0.6101915, 0.2118239, 0.7109625, 1, 1, 1, 1, 1,
0.610365, -0.1997254, 1.903515, 1, 1, 1, 1, 1,
0.6105723, -0.5404792, 3.100379, 1, 1, 1, 1, 1,
0.6113929, -1.395106, 3.573953, 1, 1, 1, 1, 1,
0.6118611, -1.128919, 2.434434, 1, 1, 1, 1, 1,
0.614817, -0.6098858, 3.161785, 1, 1, 1, 1, 1,
0.6156501, -0.6836017, 3.847977, 1, 1, 1, 1, 1,
0.6164217, 1.590231, -1.636658, 1, 1, 1, 1, 1,
0.6172174, 0.4217612, 2.532264, 1, 1, 1, 1, 1,
0.6237012, -0.1142883, 2.278933, 0, 0, 1, 1, 1,
0.6250861, 0.4406483, 2.329222, 1, 0, 0, 1, 1,
0.6258351, -0.3426731, 2.997283, 1, 0, 0, 1, 1,
0.6303415, -1.4899, 1.054785, 1, 0, 0, 1, 1,
0.637943, 0.5922452, -0.04250604, 1, 0, 0, 1, 1,
0.6427976, -0.5392923, 1.214013, 1, 0, 0, 1, 1,
0.6430075, -1.631551, 3.832583, 0, 0, 0, 1, 1,
0.6438094, 1.724756, 1.192754, 0, 0, 0, 1, 1,
0.6453246, -0.1314371, -0.0882059, 0, 0, 0, 1, 1,
0.6465442, 1.633187, 0.8821971, 0, 0, 0, 1, 1,
0.6540053, -0.8079971, 2.589597, 0, 0, 0, 1, 1,
0.6580901, 0.9838538, 0.7803963, 0, 0, 0, 1, 1,
0.6647592, -1.152791, 4.320926, 0, 0, 0, 1, 1,
0.6742167, -1.870326, 3.129829, 1, 1, 1, 1, 1,
0.6757346, 1.645658, 0.7814443, 1, 1, 1, 1, 1,
0.6787181, -0.603618, 2.026109, 1, 1, 1, 1, 1,
0.6810026, -0.4705959, 2.953035, 1, 1, 1, 1, 1,
0.68714, -0.2010942, 2.328962, 1, 1, 1, 1, 1,
0.6895641, -0.9360601, 2.675053, 1, 1, 1, 1, 1,
0.690855, 0.7834765, 2.031359, 1, 1, 1, 1, 1,
0.6919096, 0.2787345, 0.5686208, 1, 1, 1, 1, 1,
0.6927165, 0.1584718, 2.364328, 1, 1, 1, 1, 1,
0.7006943, 0.2173138, 1.389189, 1, 1, 1, 1, 1,
0.7007105, -0.2827796, 3.321149, 1, 1, 1, 1, 1,
0.7018694, 0.8412225, 2.096994, 1, 1, 1, 1, 1,
0.7026407, 1.536574, -1.51782, 1, 1, 1, 1, 1,
0.7040598, -1.475565, 3.130156, 1, 1, 1, 1, 1,
0.7220711, -1.017752, 1.60934, 1, 1, 1, 1, 1,
0.7274498, -0.3481681, 0.81071, 0, 0, 1, 1, 1,
0.7280057, 0.1813232, 0.3065435, 1, 0, 0, 1, 1,
0.7282886, 0.7773635, 0.7832565, 1, 0, 0, 1, 1,
0.7301419, -2.483059, 3.249356, 1, 0, 0, 1, 1,
0.7374817, 0.07556116, 1.373452, 1, 0, 0, 1, 1,
0.7397066, -0.2998835, 2.088328, 1, 0, 0, 1, 1,
0.7475123, -1.403734, 3.538462, 0, 0, 0, 1, 1,
0.7507294, -0.2569038, 2.345054, 0, 0, 0, 1, 1,
0.7630708, 0.9629016, 1.26953, 0, 0, 0, 1, 1,
0.7663222, 0.3591596, 1.000297, 0, 0, 0, 1, 1,
0.7666255, 1.042759, -0.4981948, 0, 0, 0, 1, 1,
0.77295, -1.539986, 4.54775, 0, 0, 0, 1, 1,
0.7765671, -0.002135804, 1.29853, 0, 0, 0, 1, 1,
0.7810858, -1.22109, 2.879785, 1, 1, 1, 1, 1,
0.7862245, 0.03751524, 1.156835, 1, 1, 1, 1, 1,
0.7904683, 1.080559, 0.859745, 1, 1, 1, 1, 1,
0.7950707, 1.442366, -0.009551622, 1, 1, 1, 1, 1,
0.8004355, -0.394226, 2.634002, 1, 1, 1, 1, 1,
0.8046103, 0.4644658, 0.158336, 1, 1, 1, 1, 1,
0.8050969, -0.7495142, 2.898746, 1, 1, 1, 1, 1,
0.8069336, -0.845907, 2.083559, 1, 1, 1, 1, 1,
0.8236055, -0.6783813, 0.4789315, 1, 1, 1, 1, 1,
0.8299417, 0.412526, 0.3041259, 1, 1, 1, 1, 1,
0.8325222, -0.8363227, 2.008871, 1, 1, 1, 1, 1,
0.832728, -0.7650476, 3.17756, 1, 1, 1, 1, 1,
0.8399152, -1.040103, 2.50638, 1, 1, 1, 1, 1,
0.8411196, -1.756356, 0.6069931, 1, 1, 1, 1, 1,
0.8426238, -0.3498196, 3.714331, 1, 1, 1, 1, 1,
0.8453163, 0.9472934, -1.255703, 0, 0, 1, 1, 1,
0.8453311, -0.1418634, 1.828186, 1, 0, 0, 1, 1,
0.8564668, -1.038048, 1.299002, 1, 0, 0, 1, 1,
0.8601026, -0.179098, 1.836616, 1, 0, 0, 1, 1,
0.8640921, -0.2061752, 1.516602, 1, 0, 0, 1, 1,
0.8663527, 0.6414622, 1.600612, 1, 0, 0, 1, 1,
0.8709487, 0.4989029, 0.1242262, 0, 0, 0, 1, 1,
0.8785345, 2.50491, 1.207309, 0, 0, 0, 1, 1,
0.8805522, 0.4866912, 0.9694256, 0, 0, 0, 1, 1,
0.883969, 0.4373114, 1.234431, 0, 0, 0, 1, 1,
0.8937529, -0.3333806, 2.370622, 0, 0, 0, 1, 1,
0.8958433, -1.046747, 2.274623, 0, 0, 0, 1, 1,
0.8963684, -0.2075748, 0.2632691, 0, 0, 0, 1, 1,
0.9045495, 0.1981082, 3.063119, 1, 1, 1, 1, 1,
0.9046621, 0.273461, 0.04073227, 1, 1, 1, 1, 1,
0.9074588, 0.9906764, 2.051008, 1, 1, 1, 1, 1,
0.9205372, -1.167057, 3.859414, 1, 1, 1, 1, 1,
0.9211163, -1.250126, 2.030666, 1, 1, 1, 1, 1,
0.928973, -0.7892069, 4.76968, 1, 1, 1, 1, 1,
0.9299776, -0.6314487, 1.507565, 1, 1, 1, 1, 1,
0.9309859, -1.148959, 3.338918, 1, 1, 1, 1, 1,
0.942302, -0.2503119, 0.7150154, 1, 1, 1, 1, 1,
0.9464871, -1.572274, 3.714033, 1, 1, 1, 1, 1,
0.947113, -0.4600687, 1.861628, 1, 1, 1, 1, 1,
0.9531813, 0.473061, 1.412786, 1, 1, 1, 1, 1,
0.9539018, 0.138287, 0.5055, 1, 1, 1, 1, 1,
0.9566454, -1.236628, 3.64291, 1, 1, 1, 1, 1,
0.956678, 1.216469, 2.293308, 1, 1, 1, 1, 1,
0.9569612, -0.5128667, 2.354626, 0, 0, 1, 1, 1,
0.9662499, 0.1885516, 0.7807898, 1, 0, 0, 1, 1,
0.9706451, 1.225551, -0.2030789, 1, 0, 0, 1, 1,
0.9741014, 0.5166029, 1.744964, 1, 0, 0, 1, 1,
0.979165, -0.9435962, 1.053763, 1, 0, 0, 1, 1,
0.9796947, -0.2216339, 2.063884, 1, 0, 0, 1, 1,
0.9799405, -0.7935387, 2.587143, 0, 0, 0, 1, 1,
0.984289, -0.2021058, 1.201406, 0, 0, 0, 1, 1,
0.9846425, 1.15872, 1.10296, 0, 0, 0, 1, 1,
0.999012, -1.642964, 2.347026, 0, 0, 0, 1, 1,
1.003839, -0.04414421, 1.145042, 0, 0, 0, 1, 1,
1.005835, 2.64479, 0.7870634, 0, 0, 0, 1, 1,
1.007184, -0.00907506, 3.168161, 0, 0, 0, 1, 1,
1.013765, 0.102222, 1.570641, 1, 1, 1, 1, 1,
1.014586, 0.5750293, 1.973684, 1, 1, 1, 1, 1,
1.015246, -0.2526889, 2.154213, 1, 1, 1, 1, 1,
1.028835, -0.5728889, 2.102383, 1, 1, 1, 1, 1,
1.0341, -0.5728535, 1.585507, 1, 1, 1, 1, 1,
1.03943, 0.1198534, 1.355902, 1, 1, 1, 1, 1,
1.043137, -0.2576525, 0.9702673, 1, 1, 1, 1, 1,
1.043383, -0.5487878, 0.5011413, 1, 1, 1, 1, 1,
1.05253, -0.3443198, 3.590306, 1, 1, 1, 1, 1,
1.057481, 2.290868, -1.591832, 1, 1, 1, 1, 1,
1.066104, 0.118951, 0.5539497, 1, 1, 1, 1, 1,
1.069586, 0.3297788, 2.868009, 1, 1, 1, 1, 1,
1.070799, -0.4048514, 1.566917, 1, 1, 1, 1, 1,
1.071732, 0.8042626, 0.4897968, 1, 1, 1, 1, 1,
1.072836, 0.27274, 0.4518878, 1, 1, 1, 1, 1,
1.082217, 0.06216376, 2.223872, 0, 0, 1, 1, 1,
1.085273, -1.605266, 1.804276, 1, 0, 0, 1, 1,
1.088049, 1.54296, 0.2455757, 1, 0, 0, 1, 1,
1.093453, -0.1980208, 2.085425, 1, 0, 0, 1, 1,
1.094321, 1.360816, 1.211115, 1, 0, 0, 1, 1,
1.096699, -0.8600953, 3.885538, 1, 0, 0, 1, 1,
1.100079, -0.09358232, 1.361505, 0, 0, 0, 1, 1,
1.100446, 0.1659188, 0.3787318, 0, 0, 0, 1, 1,
1.101874, -0.4738828, 1.663775, 0, 0, 0, 1, 1,
1.108301, 0.2609684, 1.025702, 0, 0, 0, 1, 1,
1.113554, -1.307376, 3.919302, 0, 0, 0, 1, 1,
1.11439, 0.3879503, 1.215981, 0, 0, 0, 1, 1,
1.115743, -1.397885, 4.20589, 0, 0, 0, 1, 1,
1.120809, -0.8110148, 3.474677, 1, 1, 1, 1, 1,
1.128119, 0.3529733, 0.4635303, 1, 1, 1, 1, 1,
1.129162, 1.358644, -0.1856546, 1, 1, 1, 1, 1,
1.130054, 0.800836, -1.123493, 1, 1, 1, 1, 1,
1.14586, 0.4478058, 0.5720845, 1, 1, 1, 1, 1,
1.146588, 0.45597, 2.303185, 1, 1, 1, 1, 1,
1.14975, -0.789887, 1.260314, 1, 1, 1, 1, 1,
1.151212, -1.137011, 1.806703, 1, 1, 1, 1, 1,
1.16513, -1.236909, 3.502415, 1, 1, 1, 1, 1,
1.167284, 1.127656, 0.2574649, 1, 1, 1, 1, 1,
1.167875, -1.954908, 2.091171, 1, 1, 1, 1, 1,
1.169906, -0.5796174, 1.503849, 1, 1, 1, 1, 1,
1.171671, 0.6865456, 0.5410014, 1, 1, 1, 1, 1,
1.172983, -0.703842, 0.0928374, 1, 1, 1, 1, 1,
1.181358, -0.05059719, 1.962006, 1, 1, 1, 1, 1,
1.185756, 0.1862484, 1.83687, 0, 0, 1, 1, 1,
1.187298, -0.1360586, 0.7038745, 1, 0, 0, 1, 1,
1.189008, -0.8001948, 2.110423, 1, 0, 0, 1, 1,
1.191814, 0.1350123, 0.7530884, 1, 0, 0, 1, 1,
1.191894, 0.9578279, 1.547013, 1, 0, 0, 1, 1,
1.19371, 0.9949732, 2.4853, 1, 0, 0, 1, 1,
1.200614, -0.4841179, 1.887558, 0, 0, 0, 1, 1,
1.200654, 1.016512, -0.3492952, 0, 0, 0, 1, 1,
1.200709, -0.5097376, 2.415739, 0, 0, 0, 1, 1,
1.204887, 0.05896486, 1.233478, 0, 0, 0, 1, 1,
1.207546, 0.3353211, 0.8571543, 0, 0, 0, 1, 1,
1.212849, 0.2391845, 2.043368, 0, 0, 0, 1, 1,
1.214127, -0.08596334, 2.243383, 0, 0, 0, 1, 1,
1.22214, 0.03803509, 2.185735, 1, 1, 1, 1, 1,
1.222191, -0.6382554, 2.199262, 1, 1, 1, 1, 1,
1.230064, 0.2009072, 3.681043, 1, 1, 1, 1, 1,
1.230211, -1.928831, 2.085842, 1, 1, 1, 1, 1,
1.231041, 1.336192, 0.9612087, 1, 1, 1, 1, 1,
1.23255, -0.06822638, 2.488514, 1, 1, 1, 1, 1,
1.232705, -0.726271, 2.547644, 1, 1, 1, 1, 1,
1.234427, -1.295575, 0.8650113, 1, 1, 1, 1, 1,
1.242476, 1.389736, -0.6441911, 1, 1, 1, 1, 1,
1.256953, -0.9640163, 2.515578, 1, 1, 1, 1, 1,
1.259688, 0.9004809, 0.2580155, 1, 1, 1, 1, 1,
1.260189, 1.51071, 1.558814, 1, 1, 1, 1, 1,
1.26116, 2.070784, 2.606939, 1, 1, 1, 1, 1,
1.265833, -0.743685, 4.244621, 1, 1, 1, 1, 1,
1.27125, -2.086767, 1.403804, 1, 1, 1, 1, 1,
1.271924, 0.2325899, 0.03787395, 0, 0, 1, 1, 1,
1.273455, -1.180244, 2.241151, 1, 0, 0, 1, 1,
1.277274, 0.8827463, 1.188225, 1, 0, 0, 1, 1,
1.301006, -0.2777422, 2.10813, 1, 0, 0, 1, 1,
1.301745, 0.3824755, 0.08545474, 1, 0, 0, 1, 1,
1.304589, -1.626224, 2.37861, 1, 0, 0, 1, 1,
1.312261, 1.578775, 2.216309, 0, 0, 0, 1, 1,
1.323126, -0.227131, 2.553307, 0, 0, 0, 1, 1,
1.328102, 1.417216, -0.03264916, 0, 0, 0, 1, 1,
1.32939, -0.316767, 0.5766021, 0, 0, 0, 1, 1,
1.330489, 0.09327168, 0.8049796, 0, 0, 0, 1, 1,
1.33754, -1.079247, 1.983487, 0, 0, 0, 1, 1,
1.346552, 0.8345764, 0.8858033, 0, 0, 0, 1, 1,
1.35383, 0.5450825, 0.3879701, 1, 1, 1, 1, 1,
1.354523, -0.741307, 4.0506, 1, 1, 1, 1, 1,
1.358231, -0.571319, 2.009212, 1, 1, 1, 1, 1,
1.363647, -0.5847952, 3.390428, 1, 1, 1, 1, 1,
1.375779, -0.210521, 3.032921, 1, 1, 1, 1, 1,
1.384013, -0.7969419, 0.7285958, 1, 1, 1, 1, 1,
1.389944, -1.379387, 2.749097, 1, 1, 1, 1, 1,
1.390599, -1.385568, 3.403737, 1, 1, 1, 1, 1,
1.396012, 0.4099561, -0.2444182, 1, 1, 1, 1, 1,
1.401508, -2.568221, 2.01382, 1, 1, 1, 1, 1,
1.426842, -0.822975, 2.297221, 1, 1, 1, 1, 1,
1.431506, -1.222813, 1.330007, 1, 1, 1, 1, 1,
1.465172, -0.2246739, 0.8144087, 1, 1, 1, 1, 1,
1.46795, 0.5438799, 2.232749, 1, 1, 1, 1, 1,
1.481348, 0.03180065, 3.311203, 1, 1, 1, 1, 1,
1.482648, -2.448744, 0.8389536, 0, 0, 1, 1, 1,
1.485958, 1.588881, -0.09560729, 1, 0, 0, 1, 1,
1.487545, -1.310178, 1.775326, 1, 0, 0, 1, 1,
1.497309, 1.270818, 1.042005, 1, 0, 0, 1, 1,
1.512406, -0.4586094, 4.073966, 1, 0, 0, 1, 1,
1.52224, -1.939775, 2.872861, 1, 0, 0, 1, 1,
1.535289, 0.1370648, 3.549278, 0, 0, 0, 1, 1,
1.542131, 0.6491188, 2.69894, 0, 0, 0, 1, 1,
1.570203, -0.4194315, 0.3462339, 0, 0, 0, 1, 1,
1.577442, 0.1286284, 1.356774, 0, 0, 0, 1, 1,
1.579654, 1.251948, 1.347536, 0, 0, 0, 1, 1,
1.583059, 0.4468422, 1.265324, 0, 0, 0, 1, 1,
1.595756, -0.004103173, 2.852958, 0, 0, 0, 1, 1,
1.597164, -0.01048833, 2.848719, 1, 1, 1, 1, 1,
1.612511, 0.5077142, 0.7828196, 1, 1, 1, 1, 1,
1.636461, -1.58505, 2.909323, 1, 1, 1, 1, 1,
1.640511, -1.554286, 1.950727, 1, 1, 1, 1, 1,
1.64809, -0.4765423, 1.906778, 1, 1, 1, 1, 1,
1.650643, 0.4581392, 1.955201, 1, 1, 1, 1, 1,
1.662526, -0.8266424, 1.066642, 1, 1, 1, 1, 1,
1.668505, -0.649875, 3.045883, 1, 1, 1, 1, 1,
1.701663, 1.133239, 1.684322, 1, 1, 1, 1, 1,
1.701869, -1.634619, 0.9458324, 1, 1, 1, 1, 1,
1.709218, -1.22226, 2.392108, 1, 1, 1, 1, 1,
1.717148, -1.157501, 1.690111, 1, 1, 1, 1, 1,
1.731751, -0.8543271, 2.366171, 1, 1, 1, 1, 1,
1.743248, -0.5465774, 1.959633, 1, 1, 1, 1, 1,
1.756089, 0.7087922, 0.1403069, 1, 1, 1, 1, 1,
1.762702, 0.2723527, 1.816567, 0, 0, 1, 1, 1,
1.768267, 0.6049094, 2.348335, 1, 0, 0, 1, 1,
1.77391, -0.5912774, 1.735718, 1, 0, 0, 1, 1,
1.798605, -0.2453717, 1.164809, 1, 0, 0, 1, 1,
1.811555, -1.224734, 3.119667, 1, 0, 0, 1, 1,
1.827678, 0.9988548, 2.22646, 1, 0, 0, 1, 1,
1.839813, 0.386207, 1.675737, 0, 0, 0, 1, 1,
1.841078, -0.5704992, 1.249942, 0, 0, 0, 1, 1,
1.852956, 0.6824707, 1.146164, 0, 0, 0, 1, 1,
1.856495, 0.4200594, 1.05843, 0, 0, 0, 1, 1,
1.862601, 0.05609067, 2.62278, 0, 0, 0, 1, 1,
1.868794, 0.7949102, 1.913351, 0, 0, 0, 1, 1,
1.894475, -1.090535, 1.235891, 0, 0, 0, 1, 1,
1.908253, -0.1779226, 2.077513, 1, 1, 1, 1, 1,
1.942949, 0.526903, 2.936133, 1, 1, 1, 1, 1,
1.955343, -0.3487164, 3.123943, 1, 1, 1, 1, 1,
1.971281, 0.045881, 1.910413, 1, 1, 1, 1, 1,
1.997301, 0.5912995, 1.811724, 1, 1, 1, 1, 1,
2.016607, -1.09219, 2.725272, 1, 1, 1, 1, 1,
2.077477, 0.951343, 1.029464, 1, 1, 1, 1, 1,
2.083958, -0.4778112, 0.08333495, 1, 1, 1, 1, 1,
2.11457, -1.259683, 1.208188, 1, 1, 1, 1, 1,
2.116045, 1.65898, -0.351243, 1, 1, 1, 1, 1,
2.137703, -0.3043424, 1.342758, 1, 1, 1, 1, 1,
2.155826, -1.256752, 2.555334, 1, 1, 1, 1, 1,
2.213327, 0.5594192, 2.677463, 1, 1, 1, 1, 1,
2.218468, -1.325951, 1.044506, 1, 1, 1, 1, 1,
2.285603, 1.167549, 0.9388466, 1, 1, 1, 1, 1,
2.287222, -1.484668, 1.310487, 0, 0, 1, 1, 1,
2.298702, 1.232108, -1.028173, 1, 0, 0, 1, 1,
2.320884, 0.5221817, 1.055755, 1, 0, 0, 1, 1,
2.368591, 0.9041495, 0.9992365, 1, 0, 0, 1, 1,
2.432779, -0.6717669, 1.860805, 1, 0, 0, 1, 1,
2.46102, 1.227774, 2.468335, 1, 0, 0, 1, 1,
2.559767, 0.9303923, 0.6736086, 0, 0, 0, 1, 1,
2.643151, 0.7049527, 2.202847, 0, 0, 0, 1, 1,
2.655492, -1.527485, 1.848338, 0, 0, 0, 1, 1,
2.741642, 0.4661345, 2.729487, 0, 0, 0, 1, 1,
2.760923, 0.3571725, 1.884692, 0, 0, 0, 1, 1,
2.782062, 0.0861105, 1.840042, 0, 0, 0, 1, 1,
2.792423, -0.4453074, 1.319052, 0, 0, 0, 1, 1,
2.826334, -1.058479, 2.545027, 1, 1, 1, 1, 1,
2.835465, 1.479386, -0.762109, 1, 1, 1, 1, 1,
2.844146, 0.2570841, 1.351756, 1, 1, 1, 1, 1,
2.923243, -0.6899089, 1.910408, 1, 1, 1, 1, 1,
2.951966, 1.730556, -0.1759274, 1, 1, 1, 1, 1,
2.968114, 0.3108699, 0.04495774, 1, 1, 1, 1, 1,
3.343634, 1.001558, 2.161391, 1, 1, 1, 1, 1
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
var radius = 9.877369;
var distance = 34.69384;
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
mvMatrix.translate( -0.08312058, 0.2715425, 0.1113334 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69384);
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
