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
-2.98491, -0.4443862, -2.346248, 1, 0, 0, 1,
-2.95012, -1.764086, -2.44478, 1, 0.007843138, 0, 1,
-2.736948, -2.277616, -2.10218, 1, 0.01176471, 0, 1,
-2.694358, -0.5881203, -1.454703, 1, 0.01960784, 0, 1,
-2.650459, 1.744997, -0.07773294, 1, 0.02352941, 0, 1,
-2.586571, 0.6026752, 1.227174, 1, 0.03137255, 0, 1,
-2.57588, 1.314435, -1.466277, 1, 0.03529412, 0, 1,
-2.534007, 0.1500165, -2.552637, 1, 0.04313726, 0, 1,
-2.447084, -0.4333863, -0.952876, 1, 0.04705882, 0, 1,
-2.331661, 0.2962232, -3.064332, 1, 0.05490196, 0, 1,
-2.323591, 0.6302121, -1.47837, 1, 0.05882353, 0, 1,
-2.263756, 0.1158996, 0.1510582, 1, 0.06666667, 0, 1,
-2.224363, 0.8141551, 0.2454452, 1, 0.07058824, 0, 1,
-2.219257, 0.309946, -2.03556, 1, 0.07843138, 0, 1,
-2.154359, -0.5005496, -3.347418, 1, 0.08235294, 0, 1,
-2.151773, 0.02161739, -2.466841, 1, 0.09019608, 0, 1,
-2.066496, 1.535502, -2.482108, 1, 0.09411765, 0, 1,
-2.041508, -0.7282437, -3.684971, 1, 0.1019608, 0, 1,
-2.016236, -2.654885, -3.228393, 1, 0.1098039, 0, 1,
-1.999515, 0.4346794, -0.1241819, 1, 0.1137255, 0, 1,
-1.99823, 1.447243, -0.4990499, 1, 0.1215686, 0, 1,
-1.976745, -0.3234371, -2.261326, 1, 0.1254902, 0, 1,
-1.968212, 0.2253872, -0.8578176, 1, 0.1333333, 0, 1,
-1.939095, 0.01720086, -2.541097, 1, 0.1372549, 0, 1,
-1.931899, 0.3398765, -0.5620087, 1, 0.145098, 0, 1,
-1.924122, 0.2334898, -0.6729163, 1, 0.1490196, 0, 1,
-1.889713, 1.468119, -0.4592984, 1, 0.1568628, 0, 1,
-1.876658, -0.2870701, -2.156671, 1, 0.1607843, 0, 1,
-1.860744, 1.921862, 0.3287081, 1, 0.1686275, 0, 1,
-1.847585, 0.1282515, -2.272181, 1, 0.172549, 0, 1,
-1.836237, 2.189126, -1.550008, 1, 0.1803922, 0, 1,
-1.831253, -0.6692272, -3.482653, 1, 0.1843137, 0, 1,
-1.828056, -0.5920793, 0.04454906, 1, 0.1921569, 0, 1,
-1.824879, 0.814549, -2.560125, 1, 0.1960784, 0, 1,
-1.819757, -0.9706154, -0.706746, 1, 0.2039216, 0, 1,
-1.811414, -0.5963308, -3.668106, 1, 0.2117647, 0, 1,
-1.808451, 0.7451119, -1.126508, 1, 0.2156863, 0, 1,
-1.799919, 0.423172, -0.4854642, 1, 0.2235294, 0, 1,
-1.791247, 0.985928, -0.7829025, 1, 0.227451, 0, 1,
-1.790033, 2.111732, -1.970869, 1, 0.2352941, 0, 1,
-1.777608, -0.8347352, -2.190588, 1, 0.2392157, 0, 1,
-1.772332, -0.6079869, -1.612613, 1, 0.2470588, 0, 1,
-1.769629, -0.2311347, -1.214751, 1, 0.2509804, 0, 1,
-1.75196, -1.144631, -1.315371, 1, 0.2588235, 0, 1,
-1.748197, 0.7688912, -0.5551673, 1, 0.2627451, 0, 1,
-1.734917, 0.22505, -2.794585, 1, 0.2705882, 0, 1,
-1.724468, -0.5308859, 0.2569652, 1, 0.2745098, 0, 1,
-1.720214, 0.9380236, -1.041914, 1, 0.282353, 0, 1,
-1.712928, -1.504754, -0.5821156, 1, 0.2862745, 0, 1,
-1.680693, -1.119233, -2.315212, 1, 0.2941177, 0, 1,
-1.675517, -0.04330397, -0.2025121, 1, 0.3019608, 0, 1,
-1.658175, -1.307783, -0.9438677, 1, 0.3058824, 0, 1,
-1.647578, 0.2296871, -0.5319123, 1, 0.3137255, 0, 1,
-1.62296, 1.473225, -1.715089, 1, 0.3176471, 0, 1,
-1.61561, 0.6183155, -1.063187, 1, 0.3254902, 0, 1,
-1.598351, -1.471046, -2.730691, 1, 0.3294118, 0, 1,
-1.590818, -1.905104, -1.713886, 1, 0.3372549, 0, 1,
-1.590314, -0.5627364, -1.09391, 1, 0.3411765, 0, 1,
-1.57023, -1.059677, -2.393563, 1, 0.3490196, 0, 1,
-1.565715, 0.4462764, -1.009636, 1, 0.3529412, 0, 1,
-1.56495, 2.078163, -0.4359862, 1, 0.3607843, 0, 1,
-1.557729, -0.8218243, -2.435174, 1, 0.3647059, 0, 1,
-1.547333, -0.8787247, -2.896613, 1, 0.372549, 0, 1,
-1.546615, -0.277715, -1.66112, 1, 0.3764706, 0, 1,
-1.53532, -1.684805, -2.57207, 1, 0.3843137, 0, 1,
-1.53223, -1.053116, -3.34862, 1, 0.3882353, 0, 1,
-1.525911, -0.653976, -1.084206, 1, 0.3960784, 0, 1,
-1.525661, -0.1404353, 0.02970655, 1, 0.4039216, 0, 1,
-1.508672, 1.323743, -2.042723, 1, 0.4078431, 0, 1,
-1.497986, -0.4440525, -2.845021, 1, 0.4156863, 0, 1,
-1.496866, -1.413356, -2.377401, 1, 0.4196078, 0, 1,
-1.472152, 0.2624645, 0.1689455, 1, 0.427451, 0, 1,
-1.460103, 0.8012746, -1.19475, 1, 0.4313726, 0, 1,
-1.45366, -0.157442, -1.053584, 1, 0.4392157, 0, 1,
-1.452278, -1.244932, -2.939145, 1, 0.4431373, 0, 1,
-1.450484, -2.266058, -2.497867, 1, 0.4509804, 0, 1,
-1.445669, -0.6339099, -1.174693, 1, 0.454902, 0, 1,
-1.428591, -0.6581528, -2.864338, 1, 0.4627451, 0, 1,
-1.420454, -0.2403927, -2.132071, 1, 0.4666667, 0, 1,
-1.419256, 0.9366003, -1.092977, 1, 0.4745098, 0, 1,
-1.415082, 0.1477253, -2.297006, 1, 0.4784314, 0, 1,
-1.397441, 2.262422, -0.9225227, 1, 0.4862745, 0, 1,
-1.389607, 2.329916, 0.5393943, 1, 0.4901961, 0, 1,
-1.388109, -1.413774, -2.963996, 1, 0.4980392, 0, 1,
-1.383614, 0.8823316, 0.3377204, 1, 0.5058824, 0, 1,
-1.381263, -0.1337958, -0.6035076, 1, 0.509804, 0, 1,
-1.378217, -0.3729616, -0.5506021, 1, 0.5176471, 0, 1,
-1.368546, -1.253274, -3.194586, 1, 0.5215687, 0, 1,
-1.366848, -1.5121, -2.876405, 1, 0.5294118, 0, 1,
-1.351561, -0.589057, -2.609552, 1, 0.5333334, 0, 1,
-1.34952, 0.9740024, -1.452659, 1, 0.5411765, 0, 1,
-1.334092, 1.286253, -0.6683123, 1, 0.5450981, 0, 1,
-1.331217, 0.3319476, -0.7238814, 1, 0.5529412, 0, 1,
-1.328919, 0.3054141, -2.05801, 1, 0.5568628, 0, 1,
-1.327096, -0.2683315, -2.787678, 1, 0.5647059, 0, 1,
-1.322706, 0.5244418, -1.893287, 1, 0.5686275, 0, 1,
-1.322298, 0.5155441, -2.46306, 1, 0.5764706, 0, 1,
-1.320613, 0.3538984, -2.328161, 1, 0.5803922, 0, 1,
-1.313457, 1.270785, -0.2836069, 1, 0.5882353, 0, 1,
-1.308991, -0.3122542, -0.5049716, 1, 0.5921569, 0, 1,
-1.301047, 0.5414779, 2.007328, 1, 0.6, 0, 1,
-1.297673, 0.09140711, -0.1828025, 1, 0.6078432, 0, 1,
-1.290804, 0.4036687, 1.152581, 1, 0.6117647, 0, 1,
-1.284792, 0.4535986, -2.900742, 1, 0.6196079, 0, 1,
-1.276986, -1.0407, -2.49741, 1, 0.6235294, 0, 1,
-1.276808, 0.01073638, -2.270983, 1, 0.6313726, 0, 1,
-1.26851, -0.875867, -3.248784, 1, 0.6352941, 0, 1,
-1.265974, -0.8313422, -1.836962, 1, 0.6431373, 0, 1,
-1.258668, -0.8125483, -2.720676, 1, 0.6470588, 0, 1,
-1.249629, 0.7832013, -1.133623, 1, 0.654902, 0, 1,
-1.246975, 1.147111, 0.07135131, 1, 0.6588235, 0, 1,
-1.240493, -0.1082545, -3.713275, 1, 0.6666667, 0, 1,
-1.230987, -1.252855, -2.478429, 1, 0.6705883, 0, 1,
-1.230852, -0.2767286, -0.5677043, 1, 0.6784314, 0, 1,
-1.229327, 0.6879148, -1.33238, 1, 0.682353, 0, 1,
-1.227871, -0.0851884, -0.2116456, 1, 0.6901961, 0, 1,
-1.222901, -0.2710924, -2.335888, 1, 0.6941177, 0, 1,
-1.222699, -1.852719, -2.951199, 1, 0.7019608, 0, 1,
-1.211593, 0.2443133, -1.834334, 1, 0.7098039, 0, 1,
-1.204898, -0.1628486, -2.988485, 1, 0.7137255, 0, 1,
-1.203959, 1.4513, -2.512628, 1, 0.7215686, 0, 1,
-1.19176, 0.3290392, -1.385016, 1, 0.7254902, 0, 1,
-1.18908, 1.971679, -0.4169847, 1, 0.7333333, 0, 1,
-1.17754, -1.697848, -0.9019635, 1, 0.7372549, 0, 1,
-1.171082, -1.266579, -1.483926, 1, 0.7450981, 0, 1,
-1.162075, 0.3925673, 0.2191882, 1, 0.7490196, 0, 1,
-1.1617, 0.2868846, -1.236171, 1, 0.7568628, 0, 1,
-1.159245, 1.856551, 2.535872, 1, 0.7607843, 0, 1,
-1.148619, -0.5160064, -3.431079, 1, 0.7686275, 0, 1,
-1.147347, -0.4197345, -0.9157752, 1, 0.772549, 0, 1,
-1.145833, 1.628096, 0.8638577, 1, 0.7803922, 0, 1,
-1.141811, 0.04145558, -2.362754, 1, 0.7843137, 0, 1,
-1.139022, -0.4078747, -1.28466, 1, 0.7921569, 0, 1,
-1.138516, -0.2397302, -2.315353, 1, 0.7960784, 0, 1,
-1.137694, -1.618438, -1.422145, 1, 0.8039216, 0, 1,
-1.130946, 0.2934023, -1.249971, 1, 0.8117647, 0, 1,
-1.13032, -0.9121363, -2.402143, 1, 0.8156863, 0, 1,
-1.129274, 0.5221237, -2.104539, 1, 0.8235294, 0, 1,
-1.126348, 1.640787, -1.232111, 1, 0.827451, 0, 1,
-1.108372, -1.680281, -3.73965, 1, 0.8352941, 0, 1,
-1.10815, 0.4845742, -0.8968843, 1, 0.8392157, 0, 1,
-1.105657, -1.269306, -1.157918, 1, 0.8470588, 0, 1,
-1.105541, -1.004396, -2.873998, 1, 0.8509804, 0, 1,
-1.103288, 0.081305, -0.8856814, 1, 0.8588235, 0, 1,
-1.095243, 0.7849129, 0.07026424, 1, 0.8627451, 0, 1,
-1.093696, -1.48845, -2.86785, 1, 0.8705882, 0, 1,
-1.09117, 0.7767976, -0.3615274, 1, 0.8745098, 0, 1,
-1.090748, -1.012269, -3.623089, 1, 0.8823529, 0, 1,
-1.088027, 0.195442, -0.9052767, 1, 0.8862745, 0, 1,
-1.084664, 0.5085204, -0.8480356, 1, 0.8941177, 0, 1,
-1.080198, 1.8656, -2.961519, 1, 0.8980392, 0, 1,
-1.072091, -0.2094143, -2.655795, 1, 0.9058824, 0, 1,
-1.067461, -0.2368292, -3.149646, 1, 0.9137255, 0, 1,
-1.065753, 0.8426536, -2.341885, 1, 0.9176471, 0, 1,
-1.065031, -1.219842, -3.351208, 1, 0.9254902, 0, 1,
-1.064002, 1.772263, -0.4329915, 1, 0.9294118, 0, 1,
-1.057206, -0.09683135, -3.134311, 1, 0.9372549, 0, 1,
-1.05116, -0.7212263, -2.357238, 1, 0.9411765, 0, 1,
-1.050935, 0.950021, -1.372582, 1, 0.9490196, 0, 1,
-1.050811, -0.6256673, -3.830624, 1, 0.9529412, 0, 1,
-1.045652, 0.3493519, -0.3787419, 1, 0.9607843, 0, 1,
-1.034312, -0.02751923, -1.355867, 1, 0.9647059, 0, 1,
-1.028134, 0.6878842, -1.154477, 1, 0.972549, 0, 1,
-1.027838, -1.097257, -3.588842, 1, 0.9764706, 0, 1,
-1.027685, 0.9983058, -1.678414, 1, 0.9843137, 0, 1,
-1.020933, -2.252614, -3.893389, 1, 0.9882353, 0, 1,
-1.018738, 0.6618091, -0.7748634, 1, 0.9960784, 0, 1,
-1.017052, 0.6658154, -2.354903, 0.9960784, 1, 0, 1,
-1.015564, -0.8596445, -0.8177672, 0.9921569, 1, 0, 1,
-1.012104, 1.48084, 0.7256759, 0.9843137, 1, 0, 1,
-0.9977847, 0.732199, -1.760175, 0.9803922, 1, 0, 1,
-0.9956918, 0.07360096, -2.754764, 0.972549, 1, 0, 1,
-0.9951668, 1.513593, -1.207731, 0.9686275, 1, 0, 1,
-0.9914523, -1.148862, -2.719365, 0.9607843, 1, 0, 1,
-0.9884189, -1.294359, -2.886537, 0.9568627, 1, 0, 1,
-0.9809026, 0.8360041, -2.615872, 0.9490196, 1, 0, 1,
-0.9807264, 0.2585682, -1.728681, 0.945098, 1, 0, 1,
-0.9751646, 2.883069, -0.7339108, 0.9372549, 1, 0, 1,
-0.9749889, 1.434175, -0.5781751, 0.9333333, 1, 0, 1,
-0.9736649, -0.1902941, -1.08765, 0.9254902, 1, 0, 1,
-0.9734933, -0.3808469, -1.228771, 0.9215686, 1, 0, 1,
-0.9708682, -0.2621613, -2.543241, 0.9137255, 1, 0, 1,
-0.9706471, -0.1708004, -2.892528, 0.9098039, 1, 0, 1,
-0.96639, 1.112952, -0.1372621, 0.9019608, 1, 0, 1,
-0.9640923, -0.8821998, -2.428484, 0.8941177, 1, 0, 1,
-0.9600022, -0.6183696, -3.450962, 0.8901961, 1, 0, 1,
-0.9518931, 0.784598, -0.324221, 0.8823529, 1, 0, 1,
-0.9505607, 0.4323826, -0.3324203, 0.8784314, 1, 0, 1,
-0.9487613, 0.5410779, -1.997053, 0.8705882, 1, 0, 1,
-0.9481752, 0.5842775, -0.1754978, 0.8666667, 1, 0, 1,
-0.9387307, 0.200175, -1.992648, 0.8588235, 1, 0, 1,
-0.9295768, 0.9307582, -1.209676, 0.854902, 1, 0, 1,
-0.9272295, 0.2815554, -1.086152, 0.8470588, 1, 0, 1,
-0.9255502, 0.8875408, -1.673232, 0.8431373, 1, 0, 1,
-0.9130557, -0.9069008, -2.158076, 0.8352941, 1, 0, 1,
-0.9128399, 0.4283903, -1.120718, 0.8313726, 1, 0, 1,
-0.9122724, -0.4586648, -0.5158263, 0.8235294, 1, 0, 1,
-0.911226, -0.3439883, -0.6584792, 0.8196079, 1, 0, 1,
-0.9065551, -0.1006289, -2.081218, 0.8117647, 1, 0, 1,
-0.9043288, -0.467948, -3.535514, 0.8078431, 1, 0, 1,
-0.9027871, -0.9399944, -4.209292, 0.8, 1, 0, 1,
-0.8993033, 0.3322347, 1.092247, 0.7921569, 1, 0, 1,
-0.8989488, 0.01738806, -1.535495, 0.7882353, 1, 0, 1,
-0.894662, 0.1055883, -0.4156157, 0.7803922, 1, 0, 1,
-0.8945313, -0.9902674, -1.108874, 0.7764706, 1, 0, 1,
-0.8787877, -1.351328, -3.470593, 0.7686275, 1, 0, 1,
-0.8757459, 1.487036, -0.007131235, 0.7647059, 1, 0, 1,
-0.8729441, -0.5108528, -0.04693626, 0.7568628, 1, 0, 1,
-0.8729337, 0.09878313, -2.483966, 0.7529412, 1, 0, 1,
-0.8714598, 0.8963274, -0.5522938, 0.7450981, 1, 0, 1,
-0.8670976, 1.508976, 1.358457, 0.7411765, 1, 0, 1,
-0.8660138, 0.3118911, -2.086333, 0.7333333, 1, 0, 1,
-0.8637317, -0.3487859, -1.05346, 0.7294118, 1, 0, 1,
-0.8607723, -0.7729895, -3.336953, 0.7215686, 1, 0, 1,
-0.8595338, -1.328943, -4.336367, 0.7176471, 1, 0, 1,
-0.8499036, 1.692716, -0.8155288, 0.7098039, 1, 0, 1,
-0.848347, 1.061994, -2.073998, 0.7058824, 1, 0, 1,
-0.8465263, 0.2490317, -2.315339, 0.6980392, 1, 0, 1,
-0.8441896, 0.7197713, -2.29479, 0.6901961, 1, 0, 1,
-0.8439077, -0.3052483, -1.299923, 0.6862745, 1, 0, 1,
-0.8418467, -0.2143755, -1.872802, 0.6784314, 1, 0, 1,
-0.8343223, -0.392569, -2.6832, 0.6745098, 1, 0, 1,
-0.8328183, 1.286922, -1.51421, 0.6666667, 1, 0, 1,
-0.8311387, -0.5759594, -1.378278, 0.6627451, 1, 0, 1,
-0.8264891, -0.5757203, -2.513791, 0.654902, 1, 0, 1,
-0.8218552, 0.7022423, -1.752123, 0.6509804, 1, 0, 1,
-0.8199347, 0.03320772, -3.523352, 0.6431373, 1, 0, 1,
-0.8149056, -0.2620697, 0.09474345, 0.6392157, 1, 0, 1,
-0.8137177, 2.779656, -1.367274, 0.6313726, 1, 0, 1,
-0.8016088, -0.669346, -3.20299, 0.627451, 1, 0, 1,
-0.8008254, -0.7334625, -3.619153, 0.6196079, 1, 0, 1,
-0.7931768, 1.692739, 0.6150692, 0.6156863, 1, 0, 1,
-0.7829538, -0.7439541, -1.054255, 0.6078432, 1, 0, 1,
-0.7812015, -1.656231, -2.465226, 0.6039216, 1, 0, 1,
-0.7696631, 0.6875222, -0.8950002, 0.5960785, 1, 0, 1,
-0.7675924, 2.50633, 0.4896373, 0.5882353, 1, 0, 1,
-0.7664791, 1.764509, 0.03687688, 0.5843138, 1, 0, 1,
-0.7632877, 0.8243825, 1.13845, 0.5764706, 1, 0, 1,
-0.7628231, -0.8206548, -0.2039978, 0.572549, 1, 0, 1,
-0.7556354, 1.193684, 0.1309635, 0.5647059, 1, 0, 1,
-0.7551834, -0.600311, -2.364746, 0.5607843, 1, 0, 1,
-0.7493294, -0.442469, -2.287525, 0.5529412, 1, 0, 1,
-0.7461796, -0.5625632, -3.363136, 0.5490196, 1, 0, 1,
-0.7395575, -2.632161, -4.075471, 0.5411765, 1, 0, 1,
-0.7308065, -1.528073, -1.794025, 0.5372549, 1, 0, 1,
-0.7296192, 0.6804146, 0.2944681, 0.5294118, 1, 0, 1,
-0.7273741, -0.4611725, -1.441344, 0.5254902, 1, 0, 1,
-0.7268466, 0.3335778, -1.679527, 0.5176471, 1, 0, 1,
-0.7229767, 0.680914, 0.8975869, 0.5137255, 1, 0, 1,
-0.7191409, 1.229548, -0.8610298, 0.5058824, 1, 0, 1,
-0.7054523, 0.5720771, -0.689175, 0.5019608, 1, 0, 1,
-0.7046124, -2.025237, -3.863885, 0.4941176, 1, 0, 1,
-0.6985054, 0.9110953, 0.006256726, 0.4862745, 1, 0, 1,
-0.694506, 1.997369, -1.040783, 0.4823529, 1, 0, 1,
-0.6894765, -0.4543346, -3.10179, 0.4745098, 1, 0, 1,
-0.6892846, 1.14574, -0.04129717, 0.4705882, 1, 0, 1,
-0.6892632, -0.08292239, -1.677399, 0.4627451, 1, 0, 1,
-0.6888673, -0.9432496, -3.845221, 0.4588235, 1, 0, 1,
-0.6888566, 0.5939549, -1.110452, 0.4509804, 1, 0, 1,
-0.6887349, 1.03293, -0.5814813, 0.4470588, 1, 0, 1,
-0.6883249, 0.3768234, -2.059539, 0.4392157, 1, 0, 1,
-0.6860546, -0.8027949, -3.028731, 0.4352941, 1, 0, 1,
-0.6789687, 2.724138, 0.336417, 0.427451, 1, 0, 1,
-0.6730039, -0.4806542, -1.986715, 0.4235294, 1, 0, 1,
-0.6706859, -0.3964675, -2.629774, 0.4156863, 1, 0, 1,
-0.6626204, -0.6657843, -1.958952, 0.4117647, 1, 0, 1,
-0.6496643, -2.110245, -1.971087, 0.4039216, 1, 0, 1,
-0.6465893, -0.855382, -3.173602, 0.3960784, 1, 0, 1,
-0.6444387, 0.3482714, -0.7522498, 0.3921569, 1, 0, 1,
-0.6441572, 0.2385139, -1.669845, 0.3843137, 1, 0, 1,
-0.640711, 1.323643, -0.2173602, 0.3803922, 1, 0, 1,
-0.6361598, -0.01382089, 0.08779395, 0.372549, 1, 0, 1,
-0.6227472, -0.109184, -1.571163, 0.3686275, 1, 0, 1,
-0.6201097, -0.4542283, -1.490872, 0.3607843, 1, 0, 1,
-0.6168109, -0.4141676, -3.168164, 0.3568628, 1, 0, 1,
-0.6149889, 1.227508, -0.07826399, 0.3490196, 1, 0, 1,
-0.6131445, 1.463449, -0.596732, 0.345098, 1, 0, 1,
-0.6121767, -2.259039, -4.13177, 0.3372549, 1, 0, 1,
-0.6081262, 0.8305801, 0.2443442, 0.3333333, 1, 0, 1,
-0.6072727, 0.1512535, 0.2262099, 0.3254902, 1, 0, 1,
-0.6069302, 1.521337, -1.678278, 0.3215686, 1, 0, 1,
-0.6049073, 0.02649195, -0.988364, 0.3137255, 1, 0, 1,
-0.6032301, 1.316396, -0.7412137, 0.3098039, 1, 0, 1,
-0.6011961, -0.3509529, -2.132078, 0.3019608, 1, 0, 1,
-0.6009366, 0.9124279, 0.2083501, 0.2941177, 1, 0, 1,
-0.5997273, -1.49849, -3.310648, 0.2901961, 1, 0, 1,
-0.5993218, 1.43353, 0.483935, 0.282353, 1, 0, 1,
-0.5959805, -0.3033541, -2.669353, 0.2784314, 1, 0, 1,
-0.5946614, 1.028667, -1.639811, 0.2705882, 1, 0, 1,
-0.5904576, -0.2368047, -2.369969, 0.2666667, 1, 0, 1,
-0.5887259, 1.4333, -1.024973, 0.2588235, 1, 0, 1,
-0.5884658, 0.3483982, -3.627672, 0.254902, 1, 0, 1,
-0.587793, 0.8985165, 0.9847187, 0.2470588, 1, 0, 1,
-0.5875753, -1.275549, -2.969738, 0.2431373, 1, 0, 1,
-0.5852191, -1.636688, -0.7155164, 0.2352941, 1, 0, 1,
-0.5837463, 1.656119, 0.4384789, 0.2313726, 1, 0, 1,
-0.5782512, 0.9083529, 0.6697901, 0.2235294, 1, 0, 1,
-0.5642146, 0.8197414, -1.776192, 0.2196078, 1, 0, 1,
-0.5635241, 1.482623, -0.2405439, 0.2117647, 1, 0, 1,
-0.5633265, -0.3041389, 0.3624825, 0.2078431, 1, 0, 1,
-0.5533018, -1.099192, -2.915867, 0.2, 1, 0, 1,
-0.5531803, 0.2886822, -0.2758896, 0.1921569, 1, 0, 1,
-0.5521125, -0.7713948, -2.314778, 0.1882353, 1, 0, 1,
-0.5495183, -0.03109408, -1.308672, 0.1803922, 1, 0, 1,
-0.5437644, 1.380329, -2.38415, 0.1764706, 1, 0, 1,
-0.5295306, 0.4360328, -1.682695, 0.1686275, 1, 0, 1,
-0.5257461, -0.4642727, -1.509562, 0.1647059, 1, 0, 1,
-0.5239818, 0.5997257, -1.471425, 0.1568628, 1, 0, 1,
-0.5062608, 0.4659328, -0.5213401, 0.1529412, 1, 0, 1,
-0.5060976, 0.7308227, -1.390413, 0.145098, 1, 0, 1,
-0.5060809, 2.099258, -0.8671191, 0.1411765, 1, 0, 1,
-0.4988057, -1.224834, -3.691422, 0.1333333, 1, 0, 1,
-0.4975455, 0.1609345, -0.7010772, 0.1294118, 1, 0, 1,
-0.4958981, 0.1863674, -2.986771, 0.1215686, 1, 0, 1,
-0.4957638, 0.7817667, -0.9726011, 0.1176471, 1, 0, 1,
-0.4951404, -0.6319131, -3.844243, 0.1098039, 1, 0, 1,
-0.4935779, 0.2514012, -1.369957, 0.1058824, 1, 0, 1,
-0.4913923, 0.4025185, -0.619816, 0.09803922, 1, 0, 1,
-0.490956, -0.5515333, -2.392017, 0.09019608, 1, 0, 1,
-0.4900516, -0.4925455, -2.852865, 0.08627451, 1, 0, 1,
-0.4863051, 1.11311, -1.203047, 0.07843138, 1, 0, 1,
-0.4830542, 1.443241, -0.8447613, 0.07450981, 1, 0, 1,
-0.4808217, 1.007925, -0.1630461, 0.06666667, 1, 0, 1,
-0.4801535, 0.07430489, -1.744113, 0.0627451, 1, 0, 1,
-0.4712826, 0.1047383, -1.012012, 0.05490196, 1, 0, 1,
-0.4703315, 0.2871871, -1.260425, 0.05098039, 1, 0, 1,
-0.4660502, -0.004356359, -2.308985, 0.04313726, 1, 0, 1,
-0.4655507, -0.3048074, -0.8420786, 0.03921569, 1, 0, 1,
-0.4626439, -0.6052346, -1.596585, 0.03137255, 1, 0, 1,
-0.4620626, 3.24659, 0.09714987, 0.02745098, 1, 0, 1,
-0.4618541, -0.956511, -1.838301, 0.01960784, 1, 0, 1,
-0.4614815, 1.944883, -1.300184, 0.01568628, 1, 0, 1,
-0.4612574, -0.5923623, -1.870715, 0.007843138, 1, 0, 1,
-0.4580126, -0.09783918, -3.063658, 0.003921569, 1, 0, 1,
-0.4511681, -1.668346, -3.662647, 0, 1, 0.003921569, 1,
-0.4500916, -0.003169436, -0.3781795, 0, 1, 0.01176471, 1,
-0.4464072, 0.3061051, -1.185591, 0, 1, 0.01568628, 1,
-0.4418453, -1.711677, -1.39955, 0, 1, 0.02352941, 1,
-0.4410465, 0.7703825, -1.90911, 0, 1, 0.02745098, 1,
-0.4403505, -2.139887, -2.657764, 0, 1, 0.03529412, 1,
-0.4381843, -0.3401198, -3.200612, 0, 1, 0.03921569, 1,
-0.4357613, 0.101981, 0.1834552, 0, 1, 0.04705882, 1,
-0.4311781, 0.7919185, -1.405491, 0, 1, 0.05098039, 1,
-0.423933, -1.482292, -2.108351, 0, 1, 0.05882353, 1,
-0.420269, 1.347535, -0.6033055, 0, 1, 0.0627451, 1,
-0.417839, 0.2667718, -1.484069, 0, 1, 0.07058824, 1,
-0.4151964, 0.3738959, -1.342426, 0, 1, 0.07450981, 1,
-0.4106791, 1.210478, 1.144694, 0, 1, 0.08235294, 1,
-0.4061168, -0.702334, -3.047423, 0, 1, 0.08627451, 1,
-0.4061035, -2.314005, -2.92037, 0, 1, 0.09411765, 1,
-0.4058236, -2.69053, -2.400568, 0, 1, 0.1019608, 1,
-0.4043566, 1.309993, -0.4019126, 0, 1, 0.1058824, 1,
-0.4042857, 1.000563, -2.212892, 0, 1, 0.1137255, 1,
-0.4023492, -0.6946591, -1.304445, 0, 1, 0.1176471, 1,
-0.4022665, 0.5236983, -0.7875516, 0, 1, 0.1254902, 1,
-0.400727, -0.200945, -3.7783, 0, 1, 0.1294118, 1,
-0.3987377, -0.674742, -2.688582, 0, 1, 0.1372549, 1,
-0.3899592, 0.1576412, -1.443045, 0, 1, 0.1411765, 1,
-0.3893421, -1.417685, -2.000554, 0, 1, 0.1490196, 1,
-0.3862014, -1.14941, -2.896568, 0, 1, 0.1529412, 1,
-0.3829205, 0.7035314, 1.341134, 0, 1, 0.1607843, 1,
-0.3795378, -1.10145, -1.190136, 0, 1, 0.1647059, 1,
-0.3748598, 0.2299604, -3.230738, 0, 1, 0.172549, 1,
-0.3730764, -0.02965461, -2.54691, 0, 1, 0.1764706, 1,
-0.3703162, 0.4135362, -0.170282, 0, 1, 0.1843137, 1,
-0.3680179, -0.6836575, -1.467914, 0, 1, 0.1882353, 1,
-0.3637009, 0.5247449, -2.461274, 0, 1, 0.1960784, 1,
-0.3630638, 0.5646842, -2.221936, 0, 1, 0.2039216, 1,
-0.3611107, -1.060058, -4.255143, 0, 1, 0.2078431, 1,
-0.3504532, -2.047663, -4.239258, 0, 1, 0.2156863, 1,
-0.3438494, 0.1328395, -1.117198, 0, 1, 0.2196078, 1,
-0.3418955, 1.462591, 0.5936172, 0, 1, 0.227451, 1,
-0.3385977, 1.285305, -0.3708297, 0, 1, 0.2313726, 1,
-0.3362614, -0.7884551, -3.294858, 0, 1, 0.2392157, 1,
-0.3351429, 0.2308197, -0.2856346, 0, 1, 0.2431373, 1,
-0.3336416, 1.039864, -1.630163, 0, 1, 0.2509804, 1,
-0.3313074, 0.9566141, -1.933307, 0, 1, 0.254902, 1,
-0.3308855, -0.9301829, -0.5289744, 0, 1, 0.2627451, 1,
-0.3306385, 0.4513105, -0.1472497, 0, 1, 0.2666667, 1,
-0.329641, -0.8322638, -2.673695, 0, 1, 0.2745098, 1,
-0.3254191, 1.234888, 0.3523183, 0, 1, 0.2784314, 1,
-0.3241813, -2.689987, -2.887255, 0, 1, 0.2862745, 1,
-0.321542, 0.3834754, 0.1263546, 0, 1, 0.2901961, 1,
-0.3192183, -0.8902833, -2.455197, 0, 1, 0.2980392, 1,
-0.3145531, -1.070509, -3.636812, 0, 1, 0.3058824, 1,
-0.3110459, -0.6614904, -2.234797, 0, 1, 0.3098039, 1,
-0.3106328, -1.277303, -2.565607, 0, 1, 0.3176471, 1,
-0.3103035, -0.6439624, -2.562476, 0, 1, 0.3215686, 1,
-0.3073032, -0.5957491, -4.053274, 0, 1, 0.3294118, 1,
-0.3045694, 0.6889282, -2.096833, 0, 1, 0.3333333, 1,
-0.3034553, -2.321831, -3.884868, 0, 1, 0.3411765, 1,
-0.3000664, -0.4384391, -2.810477, 0, 1, 0.345098, 1,
-0.2946794, 1.111035, -1.329128, 0, 1, 0.3529412, 1,
-0.2912844, 0.9093258, 0.2927755, 0, 1, 0.3568628, 1,
-0.2884754, 1.817346, -0.1733035, 0, 1, 0.3647059, 1,
-0.2871757, -0.7940342, -3.38657, 0, 1, 0.3686275, 1,
-0.2784306, 0.5151805, 0.9725857, 0, 1, 0.3764706, 1,
-0.2782063, -0.516112, -1.114924, 0, 1, 0.3803922, 1,
-0.2757436, -0.02153581, -2.108332, 0, 1, 0.3882353, 1,
-0.2729927, -0.4038579, -2.516452, 0, 1, 0.3921569, 1,
-0.2725657, 0.9149395, -0.9584991, 0, 1, 0.4, 1,
-0.271934, -0.7876602, -4.261409, 0, 1, 0.4078431, 1,
-0.271287, -0.8043787, -2.480627, 0, 1, 0.4117647, 1,
-0.2665138, -0.7577596, -1.365228, 0, 1, 0.4196078, 1,
-0.2646146, 0.9930105, 1.732413, 0, 1, 0.4235294, 1,
-0.2638087, -2.570959, -3.239837, 0, 1, 0.4313726, 1,
-0.2637473, -0.246955, -0.7967983, 0, 1, 0.4352941, 1,
-0.2636434, -0.707333, -4.026888, 0, 1, 0.4431373, 1,
-0.2620787, -1.198535, -2.569156, 0, 1, 0.4470588, 1,
-0.2596248, -1.244684, -4.085123, 0, 1, 0.454902, 1,
-0.25949, 1.345305, 0.04541114, 0, 1, 0.4588235, 1,
-0.2556815, 0.7004657, 0.3130707, 0, 1, 0.4666667, 1,
-0.2529564, 0.5682859, -0.5950041, 0, 1, 0.4705882, 1,
-0.2511383, 0.6971737, 0.448985, 0, 1, 0.4784314, 1,
-0.2464655, -0.145872, -2.433675, 0, 1, 0.4823529, 1,
-0.2427058, -1.060266, -2.82445, 0, 1, 0.4901961, 1,
-0.2406501, 0.6916245, -1.481798, 0, 1, 0.4941176, 1,
-0.2399569, 0.3164008, 1.773693, 0, 1, 0.5019608, 1,
-0.2382113, -0.6747729, -3.664762, 0, 1, 0.509804, 1,
-0.2379644, 0.04535335, -1.110857, 0, 1, 0.5137255, 1,
-0.2370342, -0.4290554, -1.636624, 0, 1, 0.5215687, 1,
-0.2358265, 0.8707523, -1.911415, 0, 1, 0.5254902, 1,
-0.2345991, -0.9975737, -3.019558, 0, 1, 0.5333334, 1,
-0.2325421, -0.3531102, -2.201614, 0, 1, 0.5372549, 1,
-0.2307343, -0.6505861, -2.101004, 0, 1, 0.5450981, 1,
-0.2306929, 1.701174, -0.1329576, 0, 1, 0.5490196, 1,
-0.2302585, -1.318468, -2.286857, 0, 1, 0.5568628, 1,
-0.2288301, 0.6611282, -1.437499, 0, 1, 0.5607843, 1,
-0.2272532, -0.6432116, -1.760632, 0, 1, 0.5686275, 1,
-0.225725, 0.5043213, -0.6477357, 0, 1, 0.572549, 1,
-0.2203758, 0.04458121, -1.538079, 0, 1, 0.5803922, 1,
-0.2190834, -0.448854, -3.461807, 0, 1, 0.5843138, 1,
-0.2144971, 0.7147835, 0.09432988, 0, 1, 0.5921569, 1,
-0.2137934, -0.1809774, -0.5447565, 0, 1, 0.5960785, 1,
-0.2122163, -1.451747, -3.111451, 0, 1, 0.6039216, 1,
-0.2115371, -0.3021338, -0.62391, 0, 1, 0.6117647, 1,
-0.210011, -0.4169816, -0.186087, 0, 1, 0.6156863, 1,
-0.2049039, -1.381419, -2.358109, 0, 1, 0.6235294, 1,
-0.1991119, 1.698935, -0.225531, 0, 1, 0.627451, 1,
-0.1956584, -0.4565927, -3.227824, 0, 1, 0.6352941, 1,
-0.1921717, 1.074338, 0.1870015, 0, 1, 0.6392157, 1,
-0.1914688, -1.077877, -3.72067, 0, 1, 0.6470588, 1,
-0.1867096, -1.566781, -2.725568, 0, 1, 0.6509804, 1,
-0.1857961, 1.629238, -0.8688855, 0, 1, 0.6588235, 1,
-0.1855378, -1.247747, -3.63898, 0, 1, 0.6627451, 1,
-0.1833219, 0.3065227, -1.684357, 0, 1, 0.6705883, 1,
-0.1727513, -0.1886432, -1.687757, 0, 1, 0.6745098, 1,
-0.1727153, -0.5144802, -2.633298, 0, 1, 0.682353, 1,
-0.1688726, -0.1676518, -1.57307, 0, 1, 0.6862745, 1,
-0.1669215, -1.970146, -2.475669, 0, 1, 0.6941177, 1,
-0.1581948, 0.9603897, -0.3867914, 0, 1, 0.7019608, 1,
-0.1575455, 0.07077556, -1.022955, 0, 1, 0.7058824, 1,
-0.1570415, 0.2673274, -0.0912491, 0, 1, 0.7137255, 1,
-0.1559897, 0.3693744, -1.526384, 0, 1, 0.7176471, 1,
-0.1532637, 2.529088, 0.6953316, 0, 1, 0.7254902, 1,
-0.1520175, 0.03971945, -2.107201, 0, 1, 0.7294118, 1,
-0.1489802, -1.683166, -2.786909, 0, 1, 0.7372549, 1,
-0.1470977, -0.4263586, -1.828568, 0, 1, 0.7411765, 1,
-0.1453999, 2.076456, 1.459768, 0, 1, 0.7490196, 1,
-0.1451329, -1.430586, -2.659208, 0, 1, 0.7529412, 1,
-0.1446424, -0.6258419, -3.222208, 0, 1, 0.7607843, 1,
-0.1429705, -0.1943581, -2.068957, 0, 1, 0.7647059, 1,
-0.1412494, -1.548557, -3.374972, 0, 1, 0.772549, 1,
-0.1386384, 0.4527738, -0.2929173, 0, 1, 0.7764706, 1,
-0.13833, 1.087794, -0.5236772, 0, 1, 0.7843137, 1,
-0.1339128, -0.6571705, -5.870317, 0, 1, 0.7882353, 1,
-0.1327766, 0.4286666, -1.658822, 0, 1, 0.7960784, 1,
-0.1311786, 0.4105206, -1.008539, 0, 1, 0.8039216, 1,
-0.1289764, 0.8636445, -0.2039035, 0, 1, 0.8078431, 1,
-0.1258445, -0.5522181, -3.602548, 0, 1, 0.8156863, 1,
-0.1250555, 0.9263193, 1.412075, 0, 1, 0.8196079, 1,
-0.1225361, 1.145292, 0.1351764, 0, 1, 0.827451, 1,
-0.1205677, 0.2655732, -2.603147, 0, 1, 0.8313726, 1,
-0.1191255, 1.352964, 0.1472933, 0, 1, 0.8392157, 1,
-0.1180083, -0.235722, -2.886431, 0, 1, 0.8431373, 1,
-0.1091304, 0.5058853, -0.7273262, 0, 1, 0.8509804, 1,
-0.1072632, 0.2198084, -0.8506318, 0, 1, 0.854902, 1,
-0.1060924, -0.02894306, -1.189694, 0, 1, 0.8627451, 1,
-0.104329, 2.015303, 0.7589376, 0, 1, 0.8666667, 1,
-0.1029604, -0.1503847, -1.940778, 0, 1, 0.8745098, 1,
-0.09865759, -1.161997, -3.658597, 0, 1, 0.8784314, 1,
-0.09839818, -0.2948767, -1.837083, 0, 1, 0.8862745, 1,
-0.09748818, -0.9060431, -1.020192, 0, 1, 0.8901961, 1,
-0.09580272, 1.375291, 0.8450059, 0, 1, 0.8980392, 1,
-0.09418424, -0.471807, -2.591933, 0, 1, 0.9058824, 1,
-0.09070316, -0.4141548, -2.833261, 0, 1, 0.9098039, 1,
-0.08985288, -1.003097, -2.835331, 0, 1, 0.9176471, 1,
-0.08862335, -1.091215, -3.107198, 0, 1, 0.9215686, 1,
-0.08670209, -0.7349654, -2.051155, 0, 1, 0.9294118, 1,
-0.08352559, -0.6640626, -2.358944, 0, 1, 0.9333333, 1,
-0.07806276, 0.05273553, -1.051974, 0, 1, 0.9411765, 1,
-0.07774081, -0.5462248, -3.226926, 0, 1, 0.945098, 1,
-0.07669291, -1.116541, -3.111724, 0, 1, 0.9529412, 1,
-0.07285553, -0.6974351, -2.341417, 0, 1, 0.9568627, 1,
-0.07085876, 0.2522101, 1.036939, 0, 1, 0.9647059, 1,
-0.06865581, -0.7606485, -3.41838, 0, 1, 0.9686275, 1,
-0.06847927, 0.4000131, -0.5747644, 0, 1, 0.9764706, 1,
-0.06601812, 0.3016711, -0.003075565, 0, 1, 0.9803922, 1,
-0.06285927, 0.7955794, -0.4474468, 0, 1, 0.9882353, 1,
-0.06191937, 0.503366, -0.7702181, 0, 1, 0.9921569, 1,
-0.05926671, -1.242969, -3.425142, 0, 1, 1, 1,
-0.05718325, -0.5016508, -3.892963, 0, 0.9921569, 1, 1,
-0.05452478, 0.4672115, -0.5781316, 0, 0.9882353, 1, 1,
-0.04890242, -1.056876, -4.294929, 0, 0.9803922, 1, 1,
-0.04759357, -0.01605243, -2.318693, 0, 0.9764706, 1, 1,
-0.04645845, -0.6950659, -4.240568, 0, 0.9686275, 1, 1,
-0.04578198, -0.8987892, -4.353845, 0, 0.9647059, 1, 1,
-0.04537308, -0.6674931, -1.316821, 0, 0.9568627, 1, 1,
-0.04345616, 0.5958901, -0.05494888, 0, 0.9529412, 1, 1,
-0.04335541, -1.933675, -2.60383, 0, 0.945098, 1, 1,
-0.04277251, 0.3808214, -1.002708, 0, 0.9411765, 1, 1,
-0.03695147, -0.7749525, -4.577054, 0, 0.9333333, 1, 1,
-0.03153161, -0.1456951, -2.661674, 0, 0.9294118, 1, 1,
-0.02972339, 1.453591, 0.6259927, 0, 0.9215686, 1, 1,
-0.02930277, 0.06297193, -0.9790587, 0, 0.9176471, 1, 1,
-0.02459371, 0.2659098, 1.957286, 0, 0.9098039, 1, 1,
-0.02242397, -1.653087, -1.81663, 0, 0.9058824, 1, 1,
-0.02141477, 1.223784, 2.09106, 0, 0.8980392, 1, 1,
-0.01878278, 0.07422148, -0.4440567, 0, 0.8901961, 1, 1,
-0.01795664, 1.954463, -0.9152209, 0, 0.8862745, 1, 1,
-0.01651062, -1.167932, -2.382269, 0, 0.8784314, 1, 1,
-0.01114773, -0.1132802, -3.478778, 0, 0.8745098, 1, 1,
-0.00281103, -1.105143, -3.565693, 0, 0.8666667, 1, 1,
0.0006999399, -0.6638783, 2.409512, 0, 0.8627451, 1, 1,
0.001313211, -0.4147051, 2.554022, 0, 0.854902, 1, 1,
0.001334077, -0.1968015, 1.540587, 0, 0.8509804, 1, 1,
0.004850602, -0.6111423, 3.791316, 0, 0.8431373, 1, 1,
0.00841251, -1.164058, 2.959958, 0, 0.8392157, 1, 1,
0.01362558, 1.242103, 0.3733567, 0, 0.8313726, 1, 1,
0.02349371, 0.8553948, -0.3070355, 0, 0.827451, 1, 1,
0.02553462, 0.1428022, -2.055317, 0, 0.8196079, 1, 1,
0.02598695, -1.171974, 4.184834, 0, 0.8156863, 1, 1,
0.02866028, 0.3433704, -0.8531075, 0, 0.8078431, 1, 1,
0.03003428, -1.864545, 0.1944652, 0, 0.8039216, 1, 1,
0.03351327, 1.824419, -1.242165, 0, 0.7960784, 1, 1,
0.03584538, 0.5550343, 2.072244, 0, 0.7882353, 1, 1,
0.03862049, -0.4490953, 1.89323, 0, 0.7843137, 1, 1,
0.03939204, -0.1116195, 2.203601, 0, 0.7764706, 1, 1,
0.04377578, -0.6508799, 4.103791, 0, 0.772549, 1, 1,
0.04477969, 0.6678635, 1.190385, 0, 0.7647059, 1, 1,
0.05041786, 0.8511699, 0.1095752, 0, 0.7607843, 1, 1,
0.05187608, -0.07614656, 2.48575, 0, 0.7529412, 1, 1,
0.05602201, -0.5176524, 4.762054, 0, 0.7490196, 1, 1,
0.06043809, 0.9858413, -0.260858, 0, 0.7411765, 1, 1,
0.06614979, -1.003277, 1.583792, 0, 0.7372549, 1, 1,
0.07161967, -0.3374275, 4.259056, 0, 0.7294118, 1, 1,
0.07680852, 0.5398636, 0.01040456, 0, 0.7254902, 1, 1,
0.07849604, -0.5868915, 2.102134, 0, 0.7176471, 1, 1,
0.08427967, 1.498932, -0.5478911, 0, 0.7137255, 1, 1,
0.08952253, 1.138206, -0.43276, 0, 0.7058824, 1, 1,
0.09547735, -0.1428955, 1.079975, 0, 0.6980392, 1, 1,
0.09605157, -2.123894, 3.629675, 0, 0.6941177, 1, 1,
0.1007986, -0.230802, 0.7957379, 0, 0.6862745, 1, 1,
0.1010836, 1.723645, 0.3817548, 0, 0.682353, 1, 1,
0.1042122, 1.879225, -0.3719223, 0, 0.6745098, 1, 1,
0.1064836, 0.1275088, 0.3241832, 0, 0.6705883, 1, 1,
0.1082344, 0.3689726, 1.454433, 0, 0.6627451, 1, 1,
0.1140795, 0.9998509, 1.60325, 0, 0.6588235, 1, 1,
0.114993, 1.244318, -1.752538, 0, 0.6509804, 1, 1,
0.1183825, -0.4684914, 2.391395, 0, 0.6470588, 1, 1,
0.1208975, -0.6861636, 3.033896, 0, 0.6392157, 1, 1,
0.1272543, -0.03947447, 0.5574742, 0, 0.6352941, 1, 1,
0.1291208, 2.084599, -0.3644222, 0, 0.627451, 1, 1,
0.1304398, 1.34828, 0.2298796, 0, 0.6235294, 1, 1,
0.1332812, 1.14497, 0.9829497, 0, 0.6156863, 1, 1,
0.1333338, 1.420257, -0.5223402, 0, 0.6117647, 1, 1,
0.1357715, -0.1041576, 1.614794, 0, 0.6039216, 1, 1,
0.138033, -0.8955302, 2.431334, 0, 0.5960785, 1, 1,
0.1389163, 0.4914705, 0.605471, 0, 0.5921569, 1, 1,
0.1402629, -0.6965816, 2.6936, 0, 0.5843138, 1, 1,
0.1433074, 1.331565, 0.2458623, 0, 0.5803922, 1, 1,
0.144243, -1.468335, 3.609599, 0, 0.572549, 1, 1,
0.1449895, 0.03585389, 0.788976, 0, 0.5686275, 1, 1,
0.1463364, 0.1617225, 1.322322, 0, 0.5607843, 1, 1,
0.1489173, 0.2709524, -0.7968811, 0, 0.5568628, 1, 1,
0.1523061, 1.674185, 2.067101, 0, 0.5490196, 1, 1,
0.1579939, 0.2289645, 0.06181299, 0, 0.5450981, 1, 1,
0.1616143, 0.2273591, -0.1572259, 0, 0.5372549, 1, 1,
0.1703295, -0.8049251, 2.656937, 0, 0.5333334, 1, 1,
0.170907, -1.785458, 1.243178, 0, 0.5254902, 1, 1,
0.1713436, 0.5750835, 0.4140967, 0, 0.5215687, 1, 1,
0.1717804, 0.5796034, 0.1669648, 0, 0.5137255, 1, 1,
0.1746913, 0.995408, 1.660771, 0, 0.509804, 1, 1,
0.1749236, 0.9376565, -0.3674398, 0, 0.5019608, 1, 1,
0.175746, -0.1977133, 3.04664, 0, 0.4941176, 1, 1,
0.1820013, -0.7290367, 3.705716, 0, 0.4901961, 1, 1,
0.1828363, 2.183809, 1.006378, 0, 0.4823529, 1, 1,
0.185851, -0.1304963, 1.24099, 0, 0.4784314, 1, 1,
0.1859014, 0.2417856, 0.9199517, 0, 0.4705882, 1, 1,
0.1864191, -0.01091334, 0.8993475, 0, 0.4666667, 1, 1,
0.187883, 0.1748625, 1.405589, 0, 0.4588235, 1, 1,
0.1879283, 0.3957266, 1.060594, 0, 0.454902, 1, 1,
0.1906067, 0.1911354, -0.3008475, 0, 0.4470588, 1, 1,
0.1907247, 1.309699, -0.2989322, 0, 0.4431373, 1, 1,
0.1940475, 0.6222394, 1.114835, 0, 0.4352941, 1, 1,
0.1962836, -1.812437, 2.512431, 0, 0.4313726, 1, 1,
0.2048997, -0.9960012, 4.176597, 0, 0.4235294, 1, 1,
0.2059033, -1.856623, 4.129059, 0, 0.4196078, 1, 1,
0.2121526, 0.5149528, 1.270232, 0, 0.4117647, 1, 1,
0.2134219, -0.05680154, 3.118513, 0, 0.4078431, 1, 1,
0.2138858, -0.2041324, 3.207666, 0, 0.4, 1, 1,
0.2143559, -0.2344055, 1.711555, 0, 0.3921569, 1, 1,
0.2200402, 0.8998076, 0.3841321, 0, 0.3882353, 1, 1,
0.2216506, -2.403921, 3.412227, 0, 0.3803922, 1, 1,
0.2222861, -0.03223414, 1.865832, 0, 0.3764706, 1, 1,
0.2271799, -0.5905909, 3.010472, 0, 0.3686275, 1, 1,
0.2291625, -0.9720721, 2.300799, 0, 0.3647059, 1, 1,
0.229609, 1.971185, 0.1821723, 0, 0.3568628, 1, 1,
0.2302942, -0.7378716, 3.134041, 0, 0.3529412, 1, 1,
0.2428977, 0.9187435, 0.05159272, 0, 0.345098, 1, 1,
0.2494674, -0.3824795, 2.617184, 0, 0.3411765, 1, 1,
0.2524975, -0.1173191, 1.653292, 0, 0.3333333, 1, 1,
0.2536751, -2.713946, 3.775138, 0, 0.3294118, 1, 1,
0.2560374, -0.7754352, 4.362525, 0, 0.3215686, 1, 1,
0.2577682, 1.39702, 0.6638695, 0, 0.3176471, 1, 1,
0.2678627, -0.8142992, 3.818363, 0, 0.3098039, 1, 1,
0.2701485, 1.099571, 0.01699308, 0, 0.3058824, 1, 1,
0.2705855, 0.9758477, 0.3905489, 0, 0.2980392, 1, 1,
0.2709488, -0.5006068, 3.608015, 0, 0.2901961, 1, 1,
0.2749877, 0.5790653, -0.07158243, 0, 0.2862745, 1, 1,
0.2763131, -0.5628791, 1.446252, 0, 0.2784314, 1, 1,
0.2771771, 0.8340703, 0.7342638, 0, 0.2745098, 1, 1,
0.2805932, 0.7467272, 1.631756, 0, 0.2666667, 1, 1,
0.2808772, 1.769433, -1.652657, 0, 0.2627451, 1, 1,
0.2855661, 1.680606, -1.790217, 0, 0.254902, 1, 1,
0.2899277, -1.452506, 2.051268, 0, 0.2509804, 1, 1,
0.2931467, -1.85968, 3.02195, 0, 0.2431373, 1, 1,
0.2938051, 0.2830806, -0.9808047, 0, 0.2392157, 1, 1,
0.297889, 0.32983, 2.452725, 0, 0.2313726, 1, 1,
0.3004985, 0.4614961, 1.789029, 0, 0.227451, 1, 1,
0.3013789, -0.3163404, 2.156775, 0, 0.2196078, 1, 1,
0.3041303, 1.711396, -1.149971, 0, 0.2156863, 1, 1,
0.3055339, -0.09540322, 2.461588, 0, 0.2078431, 1, 1,
0.3070381, 0.3177535, 0.6197156, 0, 0.2039216, 1, 1,
0.3071531, -0.6792064, 1.934195, 0, 0.1960784, 1, 1,
0.3093918, -1.345484, 3.830789, 0, 0.1882353, 1, 1,
0.3109653, 0.8254017, 0.6621737, 0, 0.1843137, 1, 1,
0.3123335, 0.2438845, 1.215615, 0, 0.1764706, 1, 1,
0.3164169, 0.7500983, 0.195016, 0, 0.172549, 1, 1,
0.3235836, 0.4697671, -1.166602, 0, 0.1647059, 1, 1,
0.3308834, -2.069858, 2.869336, 0, 0.1607843, 1, 1,
0.3316022, 0.1702475, -0.3274703, 0, 0.1529412, 1, 1,
0.3317509, -0.3720718, 2.443394, 0, 0.1490196, 1, 1,
0.3393467, 0.6895443, -0.8037747, 0, 0.1411765, 1, 1,
0.3401066, -0.01435803, 2.010703, 0, 0.1372549, 1, 1,
0.3498415, 0.9649391, 2.20582, 0, 0.1294118, 1, 1,
0.3514385, 0.5725697, 1.276849, 0, 0.1254902, 1, 1,
0.3540617, -0.08552715, 2.523358, 0, 0.1176471, 1, 1,
0.3556636, 0.8686888, -0.6816939, 0, 0.1137255, 1, 1,
0.3564044, -0.1090853, 1.712401, 0, 0.1058824, 1, 1,
0.3621274, 0.1125094, 0.4922953, 0, 0.09803922, 1, 1,
0.3627088, -0.592971, 2.420344, 0, 0.09411765, 1, 1,
0.3639874, 0.9916036, -1.040651, 0, 0.08627451, 1, 1,
0.3653342, 0.774966, 0.3730184, 0, 0.08235294, 1, 1,
0.3682435, 0.05379478, 0.4161861, 0, 0.07450981, 1, 1,
0.3684303, -1.982467, 1.900559, 0, 0.07058824, 1, 1,
0.3718426, 1.162799, 0.8540341, 0, 0.0627451, 1, 1,
0.3722385, -0.6441016, 2.373093, 0, 0.05882353, 1, 1,
0.3744773, 1.547033, -0.8314274, 0, 0.05098039, 1, 1,
0.3752656, -1.300183, 2.961709, 0, 0.04705882, 1, 1,
0.3761922, 0.2305879, 0.003722025, 0, 0.03921569, 1, 1,
0.3777018, 0.6052068, 1.022963, 0, 0.03529412, 1, 1,
0.3783164, 0.9907137, 1.146707, 0, 0.02745098, 1, 1,
0.3798987, 1.380998, -0.3252818, 0, 0.02352941, 1, 1,
0.3810052, -2.388302, 2.770757, 0, 0.01568628, 1, 1,
0.3841062, 1.609968, -0.07447712, 0, 0.01176471, 1, 1,
0.3843698, -1.844899, 3.636977, 0, 0.003921569, 1, 1,
0.3862941, 0.1531319, 2.264127, 0.003921569, 0, 1, 1,
0.3894009, -0.3769225, 2.705181, 0.007843138, 0, 1, 1,
0.3913072, 0.4870288, 1.857048, 0.01568628, 0, 1, 1,
0.3960502, 1.147947, 0.9685552, 0.01960784, 0, 1, 1,
0.3970644, 0.8693654, -0.7524304, 0.02745098, 0, 1, 1,
0.3982763, -0.3403865, 2.70696, 0.03137255, 0, 1, 1,
0.3997081, -0.736572, 2.037356, 0.03921569, 0, 1, 1,
0.4037629, 0.8378333, -0.0146331, 0.04313726, 0, 1, 1,
0.404707, -1.969873, 3.300934, 0.05098039, 0, 1, 1,
0.4077977, -0.6838106, 1.594783, 0.05490196, 0, 1, 1,
0.4078041, 1.288792, 0.5625329, 0.0627451, 0, 1, 1,
0.4096503, -0.3569758, 2.648686, 0.06666667, 0, 1, 1,
0.4130951, -1.888775, 1.722988, 0.07450981, 0, 1, 1,
0.4131529, 1.066148, 0.4125604, 0.07843138, 0, 1, 1,
0.4159534, 1.750925, 0.7886692, 0.08627451, 0, 1, 1,
0.4209218, -0.5286243, 3.321135, 0.09019608, 0, 1, 1,
0.4258565, 2.221043, 0.1801458, 0.09803922, 0, 1, 1,
0.4259857, -1.110708, 1.299567, 0.1058824, 0, 1, 1,
0.4268655, 0.5724017, 1.901962, 0.1098039, 0, 1, 1,
0.4331822, 0.5852519, 1.716086, 0.1176471, 0, 1, 1,
0.4336153, -0.2593657, 1.586647, 0.1215686, 0, 1, 1,
0.4342359, 1.153718, 0.9787745, 0.1294118, 0, 1, 1,
0.4436859, 0.4630546, 0.3313453, 0.1333333, 0, 1, 1,
0.4456713, -0.5775036, 1.450764, 0.1411765, 0, 1, 1,
0.4515447, -0.1490577, 2.482911, 0.145098, 0, 1, 1,
0.4518225, 0.8338528, -0.1942492, 0.1529412, 0, 1, 1,
0.4567097, 0.9683905, -1.1394, 0.1568628, 0, 1, 1,
0.4593502, -0.6380921, 3.051193, 0.1647059, 0, 1, 1,
0.4618491, 2.072652, -1.634453, 0.1686275, 0, 1, 1,
0.4627077, 0.2655494, 0.791192, 0.1764706, 0, 1, 1,
0.4635586, 0.5381172, 0.3365197, 0.1803922, 0, 1, 1,
0.463763, -1.077399, 2.728518, 0.1882353, 0, 1, 1,
0.4653934, -0.8259215, 3.277927, 0.1921569, 0, 1, 1,
0.4726054, -0.0581465, 4.198672, 0.2, 0, 1, 1,
0.4726895, -1.276425, 2.640522, 0.2078431, 0, 1, 1,
0.4734721, -1.07078, 1.663832, 0.2117647, 0, 1, 1,
0.4757774, 0.7046155, 1.27977, 0.2196078, 0, 1, 1,
0.4880114, 1.158301, 0.3881011, 0.2235294, 0, 1, 1,
0.4885031, -0.3499455, 3.014431, 0.2313726, 0, 1, 1,
0.4923853, 0.6801298, 0.8674981, 0.2352941, 0, 1, 1,
0.4964361, -2.168962, 4.297972, 0.2431373, 0, 1, 1,
0.4991861, -1.616505, 1.908336, 0.2470588, 0, 1, 1,
0.5006886, -0.1345635, 0.259268, 0.254902, 0, 1, 1,
0.5032837, 0.1496087, 0.7411457, 0.2588235, 0, 1, 1,
0.5036836, -1.361912, 2.917288, 0.2666667, 0, 1, 1,
0.5075914, -0.5878302, 0.8186411, 0.2705882, 0, 1, 1,
0.50826, -1.699181, 4.716625, 0.2784314, 0, 1, 1,
0.5088852, -0.9355808, 3.248155, 0.282353, 0, 1, 1,
0.5101319, -0.5634072, 1.949094, 0.2901961, 0, 1, 1,
0.5119542, -0.05358103, 2.744388, 0.2941177, 0, 1, 1,
0.5131223, -0.4711099, 0.9925075, 0.3019608, 0, 1, 1,
0.5147897, -0.9257421, 2.532708, 0.3098039, 0, 1, 1,
0.5187229, -0.4220189, 2.912067, 0.3137255, 0, 1, 1,
0.5193052, 0.6904441, 1.392565, 0.3215686, 0, 1, 1,
0.5193698, 1.056611, 0.4293703, 0.3254902, 0, 1, 1,
0.5265462, -0.4924206, 1.426959, 0.3333333, 0, 1, 1,
0.5284052, -0.322019, 1.945713, 0.3372549, 0, 1, 1,
0.5295736, 0.3303215, 0.9049256, 0.345098, 0, 1, 1,
0.5302417, 1.543872, 2.570479, 0.3490196, 0, 1, 1,
0.5389307, 0.9337426, -0.1122638, 0.3568628, 0, 1, 1,
0.5447559, -0.2433266, 0.267692, 0.3607843, 0, 1, 1,
0.547677, 0.8815297, -0.7806177, 0.3686275, 0, 1, 1,
0.5527038, -0.4302376, 3.1993, 0.372549, 0, 1, 1,
0.5535588, 0.9667661, 1.978885, 0.3803922, 0, 1, 1,
0.5570817, 0.2831394, 0.5602651, 0.3843137, 0, 1, 1,
0.5593328, -0.9702419, 0.5624314, 0.3921569, 0, 1, 1,
0.563175, -0.8319312, 3.063763, 0.3960784, 0, 1, 1,
0.5633329, -1.34162, 0.9268908, 0.4039216, 0, 1, 1,
0.5687429, -0.207681, 1.728767, 0.4117647, 0, 1, 1,
0.5689618, -0.3899429, 1.944734, 0.4156863, 0, 1, 1,
0.5720274, -1.964358, 2.65998, 0.4235294, 0, 1, 1,
0.5725506, -0.7576139, 0.6348381, 0.427451, 0, 1, 1,
0.5755075, -1.754693, 2.342767, 0.4352941, 0, 1, 1,
0.5757152, -0.8534243, 3.084939, 0.4392157, 0, 1, 1,
0.5791621, -0.700907, 3.057302, 0.4470588, 0, 1, 1,
0.5808154, -0.5469297, 2.370755, 0.4509804, 0, 1, 1,
0.5878059, -0.4254268, 1.97813, 0.4588235, 0, 1, 1,
0.5884048, 0.2713054, -0.1397052, 0.4627451, 0, 1, 1,
0.5886877, -0.3798738, 3.935437, 0.4705882, 0, 1, 1,
0.5925298, 0.953992, -1.084342, 0.4745098, 0, 1, 1,
0.5929011, 0.7295895, 0.7736308, 0.4823529, 0, 1, 1,
0.5938179, -1.547054, -0.00649546, 0.4862745, 0, 1, 1,
0.594704, -0.3426201, 2.083018, 0.4941176, 0, 1, 1,
0.5951665, 0.04946259, 2.502925, 0.5019608, 0, 1, 1,
0.5965078, 2.402798, 1.681484, 0.5058824, 0, 1, 1,
0.5997015, 0.5061409, 0.2779845, 0.5137255, 0, 1, 1,
0.6055382, 0.767822, 0.3668309, 0.5176471, 0, 1, 1,
0.6074492, 1.76109, 1.759182, 0.5254902, 0, 1, 1,
0.6076196, -1.171624, 2.151755, 0.5294118, 0, 1, 1,
0.6109594, 1.074921, 1.576517, 0.5372549, 0, 1, 1,
0.6146514, 1.582274, 0.8412223, 0.5411765, 0, 1, 1,
0.6150379, 0.315594, 1.577657, 0.5490196, 0, 1, 1,
0.616088, 1.21126, 0.06709804, 0.5529412, 0, 1, 1,
0.6176549, 1.145012, -0.5424079, 0.5607843, 0, 1, 1,
0.617932, 0.3073873, -1.164263, 0.5647059, 0, 1, 1,
0.630622, 1.881658, 1.347955, 0.572549, 0, 1, 1,
0.6357542, -1.020546, 0.493356, 0.5764706, 0, 1, 1,
0.6369114, -0.1208216, 3.090867, 0.5843138, 0, 1, 1,
0.6407635, 2.269853, 1.333193, 0.5882353, 0, 1, 1,
0.6412615, -1.202649, 3.068572, 0.5960785, 0, 1, 1,
0.6427963, -1.115132, 3.513813, 0.6039216, 0, 1, 1,
0.6449138, 1.087583, 1.336111, 0.6078432, 0, 1, 1,
0.6512696, 0.5601354, 0.2505214, 0.6156863, 0, 1, 1,
0.6532868, 1.53746, 1.879845, 0.6196079, 0, 1, 1,
0.6572452, 0.8224016, 0.1049636, 0.627451, 0, 1, 1,
0.659937, 0.1797958, 0.6128815, 0.6313726, 0, 1, 1,
0.6703805, -0.0830104, 1.551612, 0.6392157, 0, 1, 1,
0.6716217, -1.025745, 0.8645559, 0.6431373, 0, 1, 1,
0.6793889, -0.2832185, 2.540083, 0.6509804, 0, 1, 1,
0.6825268, 0.4695406, 3.47473, 0.654902, 0, 1, 1,
0.6898713, -1.237261, 3.228302, 0.6627451, 0, 1, 1,
0.6904852, 0.3427123, 0.9443385, 0.6666667, 0, 1, 1,
0.692717, 0.9149982, 0.8205678, 0.6745098, 0, 1, 1,
0.7000521, 0.8539956, 1.003767, 0.6784314, 0, 1, 1,
0.7036368, 1.940394, 1.517429, 0.6862745, 0, 1, 1,
0.7037382, 1.287186, 0.7797717, 0.6901961, 0, 1, 1,
0.7069085, -0.9905515, 1.918939, 0.6980392, 0, 1, 1,
0.7126678, -0.3209804, 2.081095, 0.7058824, 0, 1, 1,
0.7132953, 1.320617, 1.654698, 0.7098039, 0, 1, 1,
0.713421, 1.046512, 0.8143046, 0.7176471, 0, 1, 1,
0.7134464, 0.08233192, 2.067434, 0.7215686, 0, 1, 1,
0.7161401, -0.7980463, 2.376055, 0.7294118, 0, 1, 1,
0.7209985, 0.3944842, 0.1667368, 0.7333333, 0, 1, 1,
0.7238863, 1.502488, -0.3419044, 0.7411765, 0, 1, 1,
0.7297228, 0.5192186, -1.018722, 0.7450981, 0, 1, 1,
0.7297872, 0.2922173, 3.26106, 0.7529412, 0, 1, 1,
0.731393, 0.5477521, -0.6271744, 0.7568628, 0, 1, 1,
0.7343288, 0.395175, 0.6461796, 0.7647059, 0, 1, 1,
0.7393688, 1.380643, 0.7148877, 0.7686275, 0, 1, 1,
0.7400133, -0.8157379, 3.502575, 0.7764706, 0, 1, 1,
0.7428783, -0.5979939, 1.993997, 0.7803922, 0, 1, 1,
0.7429698, -1.555897, 3.394909, 0.7882353, 0, 1, 1,
0.7433146, -0.4488377, 2.248679, 0.7921569, 0, 1, 1,
0.7447914, -1.598228, 2.838228, 0.8, 0, 1, 1,
0.7529052, 0.2402985, 1.702213, 0.8078431, 0, 1, 1,
0.7613189, 1.133812, 1.31596, 0.8117647, 0, 1, 1,
0.7619534, 1.913336, -0.1255752, 0.8196079, 0, 1, 1,
0.7757353, 0.009689051, 0.9984325, 0.8235294, 0, 1, 1,
0.7760639, 0.494383, 1.176503, 0.8313726, 0, 1, 1,
0.7791057, 0.5605911, 1.144397, 0.8352941, 0, 1, 1,
0.7804525, 0.303734, 2.456311, 0.8431373, 0, 1, 1,
0.7867645, 1.561344, 2.252614, 0.8470588, 0, 1, 1,
0.7905133, -0.7848951, -0.622418, 0.854902, 0, 1, 1,
0.7916582, -0.3915819, 2.335724, 0.8588235, 0, 1, 1,
0.7933553, -2.064817, 2.263878, 0.8666667, 0, 1, 1,
0.7999483, 0.4421488, 0.6813228, 0.8705882, 0, 1, 1,
0.8014926, -0.2688819, 3.449292, 0.8784314, 0, 1, 1,
0.8018535, -0.06679957, 0.9193017, 0.8823529, 0, 1, 1,
0.8052571, 0.1689932, 1.660703, 0.8901961, 0, 1, 1,
0.8071766, -2.198251, 2.677706, 0.8941177, 0, 1, 1,
0.8278421, 1.214, -0.5964051, 0.9019608, 0, 1, 1,
0.8350343, 0.4303454, 0.2934377, 0.9098039, 0, 1, 1,
0.8354817, -0.2699988, 1.909652, 0.9137255, 0, 1, 1,
0.8369753, 0.1498571, 1.276663, 0.9215686, 0, 1, 1,
0.8454193, 1.315569, 0.07953046, 0.9254902, 0, 1, 1,
0.8507805, -1.44435, 3.155561, 0.9333333, 0, 1, 1,
0.8511462, -0.4102948, 3.116287, 0.9372549, 0, 1, 1,
0.8595276, 1.790918, 0.3334732, 0.945098, 0, 1, 1,
0.867629, 0.8568974, 0.08268984, 0.9490196, 0, 1, 1,
0.8742716, 0.8492924, -0.9821578, 0.9568627, 0, 1, 1,
0.8765069, -0.1233482, 2.14841, 0.9607843, 0, 1, 1,
0.8767158, 0.5474905, 0.8800706, 0.9686275, 0, 1, 1,
0.8789495, 0.2086542, 1.911165, 0.972549, 0, 1, 1,
0.8821812, 0.04262163, 0.8889896, 0.9803922, 0, 1, 1,
0.8880222, 0.0855246, 1.013208, 0.9843137, 0, 1, 1,
0.897624, -0.3277263, 3.537245, 0.9921569, 0, 1, 1,
0.8992188, 0.9797817, 1.446151, 0.9960784, 0, 1, 1,
0.9038017, 0.2767411, -0.3867717, 1, 0, 0.9960784, 1,
0.9218867, 0.7859312, 0.3056339, 1, 0, 0.9882353, 1,
0.9339261, -0.6660196, 4.423985, 1, 0, 0.9843137, 1,
0.9397878, -0.2530076, 1.914987, 1, 0, 0.9764706, 1,
0.952646, 0.1606059, -0.4873271, 1, 0, 0.972549, 1,
0.9607905, 2.016329, -0.330474, 1, 0, 0.9647059, 1,
0.9682585, -0.1037312, 2.089491, 1, 0, 0.9607843, 1,
0.9725361, 1.479348, -0.248123, 1, 0, 0.9529412, 1,
0.9731686, 0.1326035, 1.385683, 1, 0, 0.9490196, 1,
0.9756541, -0.7196614, 2.797107, 1, 0, 0.9411765, 1,
0.9773768, -0.820564, 2.308444, 1, 0, 0.9372549, 1,
0.9847004, -1.133706, 1.956802, 1, 0, 0.9294118, 1,
0.9909429, 0.2892419, 0.5850677, 1, 0, 0.9254902, 1,
0.9941148, -0.5259091, 2.883724, 1, 0, 0.9176471, 1,
0.9946957, -0.09595569, 0.404092, 1, 0, 0.9137255, 1,
1.00053, 0.9719059, -1.153791, 1, 0, 0.9058824, 1,
1.003183, 0.3875732, 2.677037, 1, 0, 0.9019608, 1,
1.019462, -1.707235, 3.880382, 1, 0, 0.8941177, 1,
1.039634, -0.7068298, 2.526419, 1, 0, 0.8862745, 1,
1.044458, -0.1885762, 1.707827, 1, 0, 0.8823529, 1,
1.046667, -1.240766, 4.885106, 1, 0, 0.8745098, 1,
1.046988, 0.4328359, 0.355072, 1, 0, 0.8705882, 1,
1.048616, 0.003093304, 1.965439, 1, 0, 0.8627451, 1,
1.056528, -0.6955325, 1.136868, 1, 0, 0.8588235, 1,
1.060215, 2.869377, 1.655084, 1, 0, 0.8509804, 1,
1.061679, 0.3125759, -1.195657, 1, 0, 0.8470588, 1,
1.063744, -1.215922, 2.517536, 1, 0, 0.8392157, 1,
1.064263, -0.6457316, 1.440584, 1, 0, 0.8352941, 1,
1.064644, -0.7961543, 3.099236, 1, 0, 0.827451, 1,
1.067103, -1.09174, 1.754608, 1, 0, 0.8235294, 1,
1.072298, -0.08017423, 2.539618, 1, 0, 0.8156863, 1,
1.082116, -1.161405, 2.114239, 1, 0, 0.8117647, 1,
1.084685, -0.8936137, 1.673984, 1, 0, 0.8039216, 1,
1.08533, 1.177198, 1.403322, 1, 0, 0.7960784, 1,
1.089573, 0.3987042, 0.3534112, 1, 0, 0.7921569, 1,
1.089928, 1.509736, 0.7904155, 1, 0, 0.7843137, 1,
1.090397, 0.55076, 3.025232, 1, 0, 0.7803922, 1,
1.091401, 0.4335284, 0.6289841, 1, 0, 0.772549, 1,
1.095254, 0.8172178, 2.142767, 1, 0, 0.7686275, 1,
1.096399, 0.04226798, 1.788215, 1, 0, 0.7607843, 1,
1.096662, 0.6936205, -0.5884644, 1, 0, 0.7568628, 1,
1.098449, 1.509572, 0.07321204, 1, 0, 0.7490196, 1,
1.104682, 0.2691185, 1.593996, 1, 0, 0.7450981, 1,
1.107948, 0.507089, 1.169333, 1, 0, 0.7372549, 1,
1.118294, -0.4369755, 2.920741, 1, 0, 0.7333333, 1,
1.118415, 0.06154748, 1.375262, 1, 0, 0.7254902, 1,
1.123332, -1.839145, 2.907497, 1, 0, 0.7215686, 1,
1.127721, 1.857788, 0.1928995, 1, 0, 0.7137255, 1,
1.12859, 1.45286, 0.06400935, 1, 0, 0.7098039, 1,
1.12883, 0.7021287, 0.9652937, 1, 0, 0.7019608, 1,
1.137407, 0.2915863, 2.255525, 1, 0, 0.6941177, 1,
1.139902, -1.526275, 3.140611, 1, 0, 0.6901961, 1,
1.140618, -0.850212, 2.601515, 1, 0, 0.682353, 1,
1.147032, -0.1252192, 3.431386, 1, 0, 0.6784314, 1,
1.166096, -1.602036, 1.667216, 1, 0, 0.6705883, 1,
1.192975, 1.019772, 1.587762, 1, 0, 0.6666667, 1,
1.196708, -0.2303278, 0.9891789, 1, 0, 0.6588235, 1,
1.220494, 1.514678, 2.743593, 1, 0, 0.654902, 1,
1.228067, -0.2763219, 1.60304, 1, 0, 0.6470588, 1,
1.231875, -0.7287062, 1.934485, 1, 0, 0.6431373, 1,
1.236742, 0.7768218, 0.8119922, 1, 0, 0.6352941, 1,
1.238411, 0.4271976, 0.1784262, 1, 0, 0.6313726, 1,
1.245531, 0.3042824, 3.226132, 1, 0, 0.6235294, 1,
1.248715, -0.7281879, 0.3080017, 1, 0, 0.6196079, 1,
1.249348, -0.4297132, 2.847205, 1, 0, 0.6117647, 1,
1.253071, 0.4830374, 1.537389, 1, 0, 0.6078432, 1,
1.254972, -0.7663206, 1.159529, 1, 0, 0.6, 1,
1.261613, -0.9367986, 4.138251, 1, 0, 0.5921569, 1,
1.26587, -2.789947, 2.752145, 1, 0, 0.5882353, 1,
1.265956, -0.1605408, 2.414416, 1, 0, 0.5803922, 1,
1.268116, 0.5360333, 1.271474, 1, 0, 0.5764706, 1,
1.269398, -1.787804, 2.69277, 1, 0, 0.5686275, 1,
1.271437, 0.498937, 0.3857731, 1, 0, 0.5647059, 1,
1.271505, -1.190314, 1.823178, 1, 0, 0.5568628, 1,
1.27337, -1.509609, 0.6516362, 1, 0, 0.5529412, 1,
1.274543, 1.75266, 1.739927, 1, 0, 0.5450981, 1,
1.275304, -1.30992, 1.652109, 1, 0, 0.5411765, 1,
1.2756, 0.980316, -0.270483, 1, 0, 0.5333334, 1,
1.285722, 1.79546, 1.769998, 1, 0, 0.5294118, 1,
1.298969, 1.652778, 0.990118, 1, 0, 0.5215687, 1,
1.300689, 0.4317225, 1.333007, 1, 0, 0.5176471, 1,
1.321127, -1.719178, 1.962751, 1, 0, 0.509804, 1,
1.336608, 1.125264, 0.8373631, 1, 0, 0.5058824, 1,
1.344258, 0.2218181, 3.669898, 1, 0, 0.4980392, 1,
1.359652, -0.5029449, 0.593044, 1, 0, 0.4901961, 1,
1.361403, 0.3709632, 1.247107, 1, 0, 0.4862745, 1,
1.372114, -0.6530519, 1.445743, 1, 0, 0.4784314, 1,
1.377959, 2.873662, 0.9256054, 1, 0, 0.4745098, 1,
1.397535, 0.8344481, 1.071986, 1, 0, 0.4666667, 1,
1.403308, -0.7947202, 1.691835, 1, 0, 0.4627451, 1,
1.406752, -0.02474401, 3.516524, 1, 0, 0.454902, 1,
1.419473, 0.1381167, 0.5400531, 1, 0, 0.4509804, 1,
1.420528, 0.369299, 1.420937, 1, 0, 0.4431373, 1,
1.428281, -0.4441696, 2.263756, 1, 0, 0.4392157, 1,
1.430877, 0.1678915, 2.725094, 1, 0, 0.4313726, 1,
1.432604, -1.044873, 2.657594, 1, 0, 0.427451, 1,
1.433131, -1.819784, 1.948273, 1, 0, 0.4196078, 1,
1.436985, -0.1289286, 0.6477948, 1, 0, 0.4156863, 1,
1.439902, -0.464004, 3.849557, 1, 0, 0.4078431, 1,
1.453405, 0.8650655, 0.6266805, 1, 0, 0.4039216, 1,
1.458774, 0.8275886, -0.2151521, 1, 0, 0.3960784, 1,
1.467093, 2.313403, -0.3288723, 1, 0, 0.3882353, 1,
1.470723, -1.368973, 1.581686, 1, 0, 0.3843137, 1,
1.471654, -0.9378507, 0.4406757, 1, 0, 0.3764706, 1,
1.481437, -1.162494, 2.394884, 1, 0, 0.372549, 1,
1.492953, 2.298481, -1.047093, 1, 0, 0.3647059, 1,
1.495028, -1.461961, 1.679126, 1, 0, 0.3607843, 1,
1.503602, 0.3512607, 0.9701068, 1, 0, 0.3529412, 1,
1.508889, -1.192033, 1.746049, 1, 0, 0.3490196, 1,
1.518066, 0.5019466, 1.247503, 1, 0, 0.3411765, 1,
1.527791, -0.6078584, -0.4742883, 1, 0, 0.3372549, 1,
1.542253, 1.23755, 1.548512, 1, 0, 0.3294118, 1,
1.549339, -0.1724012, 0.8782085, 1, 0, 0.3254902, 1,
1.550539, 0.4048308, 1.417211, 1, 0, 0.3176471, 1,
1.557418, 0.1932634, 1.870154, 1, 0, 0.3137255, 1,
1.558414, 0.286274, 0.3339746, 1, 0, 0.3058824, 1,
1.569447, -0.5267835, 1.037495, 1, 0, 0.2980392, 1,
1.570849, 2.604247, 0.7048587, 1, 0, 0.2941177, 1,
1.58035, -0.589669, 1.748724, 1, 0, 0.2862745, 1,
1.581756, -0.2228552, 2.298679, 1, 0, 0.282353, 1,
1.582039, 0.3479424, 1.913195, 1, 0, 0.2745098, 1,
1.584222, -1.462461, 2.127776, 1, 0, 0.2705882, 1,
1.585432, -1.441674, 2.607732, 1, 0, 0.2627451, 1,
1.598829, -2.371107, 3.92139, 1, 0, 0.2588235, 1,
1.629745, -1.968815, 3.326249, 1, 0, 0.2509804, 1,
1.647823, 2.538814, -0.4609637, 1, 0, 0.2470588, 1,
1.649409, 1.137827, 1.098249, 1, 0, 0.2392157, 1,
1.654847, 1.505664, 1.850169, 1, 0, 0.2352941, 1,
1.726689, -1.757347, 1.947232, 1, 0, 0.227451, 1,
1.727631, -0.6718301, 1.203717, 1, 0, 0.2235294, 1,
1.744032, 0.4697765, 2.805272, 1, 0, 0.2156863, 1,
1.7469, 0.07342391, 2.109145, 1, 0, 0.2117647, 1,
1.795033, 1.463729, 0.777443, 1, 0, 0.2039216, 1,
1.79977, -1.350533, 3.722911, 1, 0, 0.1960784, 1,
1.822429, 0.3159488, 2.542325, 1, 0, 0.1921569, 1,
1.855694, 0.6574565, -0.5210243, 1, 0, 0.1843137, 1,
1.863724, 1.65806, 0.8695982, 1, 0, 0.1803922, 1,
1.867722, -0.7223697, 2.660285, 1, 0, 0.172549, 1,
1.882841, -0.9927881, 1.526521, 1, 0, 0.1686275, 1,
1.893677, -0.1267849, 1.983843, 1, 0, 0.1607843, 1,
1.928506, -1.651277, 1.292085, 1, 0, 0.1568628, 1,
1.932826, 0.01494518, 1.784741, 1, 0, 0.1490196, 1,
1.970425, -0.8286715, 0.7720792, 1, 0, 0.145098, 1,
1.987047, -0.0473401, 1.443682, 1, 0, 0.1372549, 1,
1.998147, -0.3644393, 3.25387, 1, 0, 0.1333333, 1,
2.018466, 0.6390792, -0.05739151, 1, 0, 0.1254902, 1,
2.04127, -1.232033, 1.869081, 1, 0, 0.1215686, 1,
2.072823, 0.5795448, 0.6392453, 1, 0, 0.1137255, 1,
2.074407, -0.1101564, 2.515951, 1, 0, 0.1098039, 1,
2.088305, 0.4973542, 0.07285823, 1, 0, 0.1019608, 1,
2.104707, -0.8648455, 1.822933, 1, 0, 0.09411765, 1,
2.124938, 0.5706214, 0.6909, 1, 0, 0.09019608, 1,
2.137938, 0.8099354, 0.4653371, 1, 0, 0.08235294, 1,
2.14908, 0.5431331, 1.891519, 1, 0, 0.07843138, 1,
2.16135, -1.286646, 1.187185, 1, 0, 0.07058824, 1,
2.174216, -0.7272324, 2.263911, 1, 0, 0.06666667, 1,
2.180785, -0.8282481, 2.175558, 1, 0, 0.05882353, 1,
2.235921, 0.2483348, 2.303984, 1, 0, 0.05490196, 1,
2.282357, -1.271685, 1.449371, 1, 0, 0.04705882, 1,
2.415357, 1.644307, 0.2174408, 1, 0, 0.04313726, 1,
2.468906, -0.233139, 1.669991, 1, 0, 0.03529412, 1,
2.541087, 1.412771, 1.456275, 1, 0, 0.03137255, 1,
2.704353, 0.9153426, 1.767496, 1, 0, 0.02352941, 1,
2.862949, -0.0217519, 0.8480251, 1, 0, 0.01960784, 1,
3.01881, -0.5217485, 0.1538841, 1, 0, 0.01176471, 1,
3.390232, -0.07011005, 0.8345947, 1, 0, 0.007843138, 1
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
0.2026609, -3.81314, -7.693361, 0, -0.5, 0.5, 0.5,
0.2026609, -3.81314, -7.693361, 1, -0.5, 0.5, 0.5,
0.2026609, -3.81314, -7.693361, 1, 1.5, 0.5, 0.5,
0.2026609, -3.81314, -7.693361, 0, 1.5, 0.5, 0.5
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
-4.065497, 0.2283212, -7.693361, 0, -0.5, 0.5, 0.5,
-4.065497, 0.2283212, -7.693361, 1, -0.5, 0.5, 0.5,
-4.065497, 0.2283212, -7.693361, 1, 1.5, 0.5, 0.5,
-4.065497, 0.2283212, -7.693361, 0, 1.5, 0.5, 0.5
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
-4.065497, -3.81314, -0.4926054, 0, -0.5, 0.5, 0.5,
-4.065497, -3.81314, -0.4926054, 1, -0.5, 0.5, 0.5,
-4.065497, -3.81314, -0.4926054, 1, 1.5, 0.5, 0.5,
-4.065497, -3.81314, -0.4926054, 0, 1.5, 0.5, 0.5
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
-2, -2.880495, -6.031648,
3, -2.880495, -6.031648,
-2, -2.880495, -6.031648,
-2, -3.035936, -6.3086,
-1, -2.880495, -6.031648,
-1, -3.035936, -6.3086,
0, -2.880495, -6.031648,
0, -3.035936, -6.3086,
1, -2.880495, -6.031648,
1, -3.035936, -6.3086,
2, -2.880495, -6.031648,
2, -3.035936, -6.3086,
3, -2.880495, -6.031648,
3, -3.035936, -6.3086
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
-2, -3.346818, -6.862505, 0, -0.5, 0.5, 0.5,
-2, -3.346818, -6.862505, 1, -0.5, 0.5, 0.5,
-2, -3.346818, -6.862505, 1, 1.5, 0.5, 0.5,
-2, -3.346818, -6.862505, 0, 1.5, 0.5, 0.5,
-1, -3.346818, -6.862505, 0, -0.5, 0.5, 0.5,
-1, -3.346818, -6.862505, 1, -0.5, 0.5, 0.5,
-1, -3.346818, -6.862505, 1, 1.5, 0.5, 0.5,
-1, -3.346818, -6.862505, 0, 1.5, 0.5, 0.5,
0, -3.346818, -6.862505, 0, -0.5, 0.5, 0.5,
0, -3.346818, -6.862505, 1, -0.5, 0.5, 0.5,
0, -3.346818, -6.862505, 1, 1.5, 0.5, 0.5,
0, -3.346818, -6.862505, 0, 1.5, 0.5, 0.5,
1, -3.346818, -6.862505, 0, -0.5, 0.5, 0.5,
1, -3.346818, -6.862505, 1, -0.5, 0.5, 0.5,
1, -3.346818, -6.862505, 1, 1.5, 0.5, 0.5,
1, -3.346818, -6.862505, 0, 1.5, 0.5, 0.5,
2, -3.346818, -6.862505, 0, -0.5, 0.5, 0.5,
2, -3.346818, -6.862505, 1, -0.5, 0.5, 0.5,
2, -3.346818, -6.862505, 1, 1.5, 0.5, 0.5,
2, -3.346818, -6.862505, 0, 1.5, 0.5, 0.5,
3, -3.346818, -6.862505, 0, -0.5, 0.5, 0.5,
3, -3.346818, -6.862505, 1, -0.5, 0.5, 0.5,
3, -3.346818, -6.862505, 1, 1.5, 0.5, 0.5,
3, -3.346818, -6.862505, 0, 1.5, 0.5, 0.5
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
-3.080537, -2, -6.031648,
-3.080537, 3, -6.031648,
-3.080537, -2, -6.031648,
-3.244697, -2, -6.3086,
-3.080537, -1, -6.031648,
-3.244697, -1, -6.3086,
-3.080537, 0, -6.031648,
-3.244697, 0, -6.3086,
-3.080537, 1, -6.031648,
-3.244697, 1, -6.3086,
-3.080537, 2, -6.031648,
-3.244697, 2, -6.3086,
-3.080537, 3, -6.031648,
-3.244697, 3, -6.3086
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
-3.573017, -2, -6.862505, 0, -0.5, 0.5, 0.5,
-3.573017, -2, -6.862505, 1, -0.5, 0.5, 0.5,
-3.573017, -2, -6.862505, 1, 1.5, 0.5, 0.5,
-3.573017, -2, -6.862505, 0, 1.5, 0.5, 0.5,
-3.573017, -1, -6.862505, 0, -0.5, 0.5, 0.5,
-3.573017, -1, -6.862505, 1, -0.5, 0.5, 0.5,
-3.573017, -1, -6.862505, 1, 1.5, 0.5, 0.5,
-3.573017, -1, -6.862505, 0, 1.5, 0.5, 0.5,
-3.573017, 0, -6.862505, 0, -0.5, 0.5, 0.5,
-3.573017, 0, -6.862505, 1, -0.5, 0.5, 0.5,
-3.573017, 0, -6.862505, 1, 1.5, 0.5, 0.5,
-3.573017, 0, -6.862505, 0, 1.5, 0.5, 0.5,
-3.573017, 1, -6.862505, 0, -0.5, 0.5, 0.5,
-3.573017, 1, -6.862505, 1, -0.5, 0.5, 0.5,
-3.573017, 1, -6.862505, 1, 1.5, 0.5, 0.5,
-3.573017, 1, -6.862505, 0, 1.5, 0.5, 0.5,
-3.573017, 2, -6.862505, 0, -0.5, 0.5, 0.5,
-3.573017, 2, -6.862505, 1, -0.5, 0.5, 0.5,
-3.573017, 2, -6.862505, 1, 1.5, 0.5, 0.5,
-3.573017, 2, -6.862505, 0, 1.5, 0.5, 0.5,
-3.573017, 3, -6.862505, 0, -0.5, 0.5, 0.5,
-3.573017, 3, -6.862505, 1, -0.5, 0.5, 0.5,
-3.573017, 3, -6.862505, 1, 1.5, 0.5, 0.5,
-3.573017, 3, -6.862505, 0, 1.5, 0.5, 0.5
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
-3.080537, -2.880495, -4,
-3.080537, -2.880495, 4,
-3.080537, -2.880495, -4,
-3.244697, -3.035936, -4,
-3.080537, -2.880495, -2,
-3.244697, -3.035936, -2,
-3.080537, -2.880495, 0,
-3.244697, -3.035936, 0,
-3.080537, -2.880495, 2,
-3.244697, -3.035936, 2,
-3.080537, -2.880495, 4,
-3.244697, -3.035936, 4
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
-3.573017, -3.346818, -4, 0, -0.5, 0.5, 0.5,
-3.573017, -3.346818, -4, 1, -0.5, 0.5, 0.5,
-3.573017, -3.346818, -4, 1, 1.5, 0.5, 0.5,
-3.573017, -3.346818, -4, 0, 1.5, 0.5, 0.5,
-3.573017, -3.346818, -2, 0, -0.5, 0.5, 0.5,
-3.573017, -3.346818, -2, 1, -0.5, 0.5, 0.5,
-3.573017, -3.346818, -2, 1, 1.5, 0.5, 0.5,
-3.573017, -3.346818, -2, 0, 1.5, 0.5, 0.5,
-3.573017, -3.346818, 0, 0, -0.5, 0.5, 0.5,
-3.573017, -3.346818, 0, 1, -0.5, 0.5, 0.5,
-3.573017, -3.346818, 0, 1, 1.5, 0.5, 0.5,
-3.573017, -3.346818, 0, 0, 1.5, 0.5, 0.5,
-3.573017, -3.346818, 2, 0, -0.5, 0.5, 0.5,
-3.573017, -3.346818, 2, 1, -0.5, 0.5, 0.5,
-3.573017, -3.346818, 2, 1, 1.5, 0.5, 0.5,
-3.573017, -3.346818, 2, 0, 1.5, 0.5, 0.5,
-3.573017, -3.346818, 4, 0, -0.5, 0.5, 0.5,
-3.573017, -3.346818, 4, 1, -0.5, 0.5, 0.5,
-3.573017, -3.346818, 4, 1, 1.5, 0.5, 0.5,
-3.573017, -3.346818, 4, 0, 1.5, 0.5, 0.5
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
-3.080537, -2.880495, -6.031648,
-3.080537, 3.337138, -6.031648,
-3.080537, -2.880495, 5.046437,
-3.080537, 3.337138, 5.046437,
-3.080537, -2.880495, -6.031648,
-3.080537, -2.880495, 5.046437,
-3.080537, 3.337138, -6.031648,
-3.080537, 3.337138, 5.046437,
-3.080537, -2.880495, -6.031648,
3.485859, -2.880495, -6.031648,
-3.080537, -2.880495, 5.046437,
3.485859, -2.880495, 5.046437,
-3.080537, 3.337138, -6.031648,
3.485859, 3.337138, -6.031648,
-3.080537, 3.337138, 5.046437,
3.485859, 3.337138, 5.046437,
3.485859, -2.880495, -6.031648,
3.485859, 3.337138, -6.031648,
3.485859, -2.880495, 5.046437,
3.485859, 3.337138, 5.046437,
3.485859, -2.880495, -6.031648,
3.485859, -2.880495, 5.046437,
3.485859, 3.337138, -6.031648,
3.485859, 3.337138, 5.046437
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
var radius = 7.636119;
var distance = 33.97395;
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
mvMatrix.translate( -0.2026609, -0.2283212, 0.4926054 );
mvMatrix.scale( 1.25736, 1.327888, 0.7452841 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.97395);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
dodemorph<-read.table("dodemorph.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dodemorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
```

```r
y<-dodemorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
```

```r
z<-dodemorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
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
-2.98491, -0.4443862, -2.346248, 0, 0, 1, 1, 1,
-2.95012, -1.764086, -2.44478, 1, 0, 0, 1, 1,
-2.736948, -2.277616, -2.10218, 1, 0, 0, 1, 1,
-2.694358, -0.5881203, -1.454703, 1, 0, 0, 1, 1,
-2.650459, 1.744997, -0.07773294, 1, 0, 0, 1, 1,
-2.586571, 0.6026752, 1.227174, 1, 0, 0, 1, 1,
-2.57588, 1.314435, -1.466277, 0, 0, 0, 1, 1,
-2.534007, 0.1500165, -2.552637, 0, 0, 0, 1, 1,
-2.447084, -0.4333863, -0.952876, 0, 0, 0, 1, 1,
-2.331661, 0.2962232, -3.064332, 0, 0, 0, 1, 1,
-2.323591, 0.6302121, -1.47837, 0, 0, 0, 1, 1,
-2.263756, 0.1158996, 0.1510582, 0, 0, 0, 1, 1,
-2.224363, 0.8141551, 0.2454452, 0, 0, 0, 1, 1,
-2.219257, 0.309946, -2.03556, 1, 1, 1, 1, 1,
-2.154359, -0.5005496, -3.347418, 1, 1, 1, 1, 1,
-2.151773, 0.02161739, -2.466841, 1, 1, 1, 1, 1,
-2.066496, 1.535502, -2.482108, 1, 1, 1, 1, 1,
-2.041508, -0.7282437, -3.684971, 1, 1, 1, 1, 1,
-2.016236, -2.654885, -3.228393, 1, 1, 1, 1, 1,
-1.999515, 0.4346794, -0.1241819, 1, 1, 1, 1, 1,
-1.99823, 1.447243, -0.4990499, 1, 1, 1, 1, 1,
-1.976745, -0.3234371, -2.261326, 1, 1, 1, 1, 1,
-1.968212, 0.2253872, -0.8578176, 1, 1, 1, 1, 1,
-1.939095, 0.01720086, -2.541097, 1, 1, 1, 1, 1,
-1.931899, 0.3398765, -0.5620087, 1, 1, 1, 1, 1,
-1.924122, 0.2334898, -0.6729163, 1, 1, 1, 1, 1,
-1.889713, 1.468119, -0.4592984, 1, 1, 1, 1, 1,
-1.876658, -0.2870701, -2.156671, 1, 1, 1, 1, 1,
-1.860744, 1.921862, 0.3287081, 0, 0, 1, 1, 1,
-1.847585, 0.1282515, -2.272181, 1, 0, 0, 1, 1,
-1.836237, 2.189126, -1.550008, 1, 0, 0, 1, 1,
-1.831253, -0.6692272, -3.482653, 1, 0, 0, 1, 1,
-1.828056, -0.5920793, 0.04454906, 1, 0, 0, 1, 1,
-1.824879, 0.814549, -2.560125, 1, 0, 0, 1, 1,
-1.819757, -0.9706154, -0.706746, 0, 0, 0, 1, 1,
-1.811414, -0.5963308, -3.668106, 0, 0, 0, 1, 1,
-1.808451, 0.7451119, -1.126508, 0, 0, 0, 1, 1,
-1.799919, 0.423172, -0.4854642, 0, 0, 0, 1, 1,
-1.791247, 0.985928, -0.7829025, 0, 0, 0, 1, 1,
-1.790033, 2.111732, -1.970869, 0, 0, 0, 1, 1,
-1.777608, -0.8347352, -2.190588, 0, 0, 0, 1, 1,
-1.772332, -0.6079869, -1.612613, 1, 1, 1, 1, 1,
-1.769629, -0.2311347, -1.214751, 1, 1, 1, 1, 1,
-1.75196, -1.144631, -1.315371, 1, 1, 1, 1, 1,
-1.748197, 0.7688912, -0.5551673, 1, 1, 1, 1, 1,
-1.734917, 0.22505, -2.794585, 1, 1, 1, 1, 1,
-1.724468, -0.5308859, 0.2569652, 1, 1, 1, 1, 1,
-1.720214, 0.9380236, -1.041914, 1, 1, 1, 1, 1,
-1.712928, -1.504754, -0.5821156, 1, 1, 1, 1, 1,
-1.680693, -1.119233, -2.315212, 1, 1, 1, 1, 1,
-1.675517, -0.04330397, -0.2025121, 1, 1, 1, 1, 1,
-1.658175, -1.307783, -0.9438677, 1, 1, 1, 1, 1,
-1.647578, 0.2296871, -0.5319123, 1, 1, 1, 1, 1,
-1.62296, 1.473225, -1.715089, 1, 1, 1, 1, 1,
-1.61561, 0.6183155, -1.063187, 1, 1, 1, 1, 1,
-1.598351, -1.471046, -2.730691, 1, 1, 1, 1, 1,
-1.590818, -1.905104, -1.713886, 0, 0, 1, 1, 1,
-1.590314, -0.5627364, -1.09391, 1, 0, 0, 1, 1,
-1.57023, -1.059677, -2.393563, 1, 0, 0, 1, 1,
-1.565715, 0.4462764, -1.009636, 1, 0, 0, 1, 1,
-1.56495, 2.078163, -0.4359862, 1, 0, 0, 1, 1,
-1.557729, -0.8218243, -2.435174, 1, 0, 0, 1, 1,
-1.547333, -0.8787247, -2.896613, 0, 0, 0, 1, 1,
-1.546615, -0.277715, -1.66112, 0, 0, 0, 1, 1,
-1.53532, -1.684805, -2.57207, 0, 0, 0, 1, 1,
-1.53223, -1.053116, -3.34862, 0, 0, 0, 1, 1,
-1.525911, -0.653976, -1.084206, 0, 0, 0, 1, 1,
-1.525661, -0.1404353, 0.02970655, 0, 0, 0, 1, 1,
-1.508672, 1.323743, -2.042723, 0, 0, 0, 1, 1,
-1.497986, -0.4440525, -2.845021, 1, 1, 1, 1, 1,
-1.496866, -1.413356, -2.377401, 1, 1, 1, 1, 1,
-1.472152, 0.2624645, 0.1689455, 1, 1, 1, 1, 1,
-1.460103, 0.8012746, -1.19475, 1, 1, 1, 1, 1,
-1.45366, -0.157442, -1.053584, 1, 1, 1, 1, 1,
-1.452278, -1.244932, -2.939145, 1, 1, 1, 1, 1,
-1.450484, -2.266058, -2.497867, 1, 1, 1, 1, 1,
-1.445669, -0.6339099, -1.174693, 1, 1, 1, 1, 1,
-1.428591, -0.6581528, -2.864338, 1, 1, 1, 1, 1,
-1.420454, -0.2403927, -2.132071, 1, 1, 1, 1, 1,
-1.419256, 0.9366003, -1.092977, 1, 1, 1, 1, 1,
-1.415082, 0.1477253, -2.297006, 1, 1, 1, 1, 1,
-1.397441, 2.262422, -0.9225227, 1, 1, 1, 1, 1,
-1.389607, 2.329916, 0.5393943, 1, 1, 1, 1, 1,
-1.388109, -1.413774, -2.963996, 1, 1, 1, 1, 1,
-1.383614, 0.8823316, 0.3377204, 0, 0, 1, 1, 1,
-1.381263, -0.1337958, -0.6035076, 1, 0, 0, 1, 1,
-1.378217, -0.3729616, -0.5506021, 1, 0, 0, 1, 1,
-1.368546, -1.253274, -3.194586, 1, 0, 0, 1, 1,
-1.366848, -1.5121, -2.876405, 1, 0, 0, 1, 1,
-1.351561, -0.589057, -2.609552, 1, 0, 0, 1, 1,
-1.34952, 0.9740024, -1.452659, 0, 0, 0, 1, 1,
-1.334092, 1.286253, -0.6683123, 0, 0, 0, 1, 1,
-1.331217, 0.3319476, -0.7238814, 0, 0, 0, 1, 1,
-1.328919, 0.3054141, -2.05801, 0, 0, 0, 1, 1,
-1.327096, -0.2683315, -2.787678, 0, 0, 0, 1, 1,
-1.322706, 0.5244418, -1.893287, 0, 0, 0, 1, 1,
-1.322298, 0.5155441, -2.46306, 0, 0, 0, 1, 1,
-1.320613, 0.3538984, -2.328161, 1, 1, 1, 1, 1,
-1.313457, 1.270785, -0.2836069, 1, 1, 1, 1, 1,
-1.308991, -0.3122542, -0.5049716, 1, 1, 1, 1, 1,
-1.301047, 0.5414779, 2.007328, 1, 1, 1, 1, 1,
-1.297673, 0.09140711, -0.1828025, 1, 1, 1, 1, 1,
-1.290804, 0.4036687, 1.152581, 1, 1, 1, 1, 1,
-1.284792, 0.4535986, -2.900742, 1, 1, 1, 1, 1,
-1.276986, -1.0407, -2.49741, 1, 1, 1, 1, 1,
-1.276808, 0.01073638, -2.270983, 1, 1, 1, 1, 1,
-1.26851, -0.875867, -3.248784, 1, 1, 1, 1, 1,
-1.265974, -0.8313422, -1.836962, 1, 1, 1, 1, 1,
-1.258668, -0.8125483, -2.720676, 1, 1, 1, 1, 1,
-1.249629, 0.7832013, -1.133623, 1, 1, 1, 1, 1,
-1.246975, 1.147111, 0.07135131, 1, 1, 1, 1, 1,
-1.240493, -0.1082545, -3.713275, 1, 1, 1, 1, 1,
-1.230987, -1.252855, -2.478429, 0, 0, 1, 1, 1,
-1.230852, -0.2767286, -0.5677043, 1, 0, 0, 1, 1,
-1.229327, 0.6879148, -1.33238, 1, 0, 0, 1, 1,
-1.227871, -0.0851884, -0.2116456, 1, 0, 0, 1, 1,
-1.222901, -0.2710924, -2.335888, 1, 0, 0, 1, 1,
-1.222699, -1.852719, -2.951199, 1, 0, 0, 1, 1,
-1.211593, 0.2443133, -1.834334, 0, 0, 0, 1, 1,
-1.204898, -0.1628486, -2.988485, 0, 0, 0, 1, 1,
-1.203959, 1.4513, -2.512628, 0, 0, 0, 1, 1,
-1.19176, 0.3290392, -1.385016, 0, 0, 0, 1, 1,
-1.18908, 1.971679, -0.4169847, 0, 0, 0, 1, 1,
-1.17754, -1.697848, -0.9019635, 0, 0, 0, 1, 1,
-1.171082, -1.266579, -1.483926, 0, 0, 0, 1, 1,
-1.162075, 0.3925673, 0.2191882, 1, 1, 1, 1, 1,
-1.1617, 0.2868846, -1.236171, 1, 1, 1, 1, 1,
-1.159245, 1.856551, 2.535872, 1, 1, 1, 1, 1,
-1.148619, -0.5160064, -3.431079, 1, 1, 1, 1, 1,
-1.147347, -0.4197345, -0.9157752, 1, 1, 1, 1, 1,
-1.145833, 1.628096, 0.8638577, 1, 1, 1, 1, 1,
-1.141811, 0.04145558, -2.362754, 1, 1, 1, 1, 1,
-1.139022, -0.4078747, -1.28466, 1, 1, 1, 1, 1,
-1.138516, -0.2397302, -2.315353, 1, 1, 1, 1, 1,
-1.137694, -1.618438, -1.422145, 1, 1, 1, 1, 1,
-1.130946, 0.2934023, -1.249971, 1, 1, 1, 1, 1,
-1.13032, -0.9121363, -2.402143, 1, 1, 1, 1, 1,
-1.129274, 0.5221237, -2.104539, 1, 1, 1, 1, 1,
-1.126348, 1.640787, -1.232111, 1, 1, 1, 1, 1,
-1.108372, -1.680281, -3.73965, 1, 1, 1, 1, 1,
-1.10815, 0.4845742, -0.8968843, 0, 0, 1, 1, 1,
-1.105657, -1.269306, -1.157918, 1, 0, 0, 1, 1,
-1.105541, -1.004396, -2.873998, 1, 0, 0, 1, 1,
-1.103288, 0.081305, -0.8856814, 1, 0, 0, 1, 1,
-1.095243, 0.7849129, 0.07026424, 1, 0, 0, 1, 1,
-1.093696, -1.48845, -2.86785, 1, 0, 0, 1, 1,
-1.09117, 0.7767976, -0.3615274, 0, 0, 0, 1, 1,
-1.090748, -1.012269, -3.623089, 0, 0, 0, 1, 1,
-1.088027, 0.195442, -0.9052767, 0, 0, 0, 1, 1,
-1.084664, 0.5085204, -0.8480356, 0, 0, 0, 1, 1,
-1.080198, 1.8656, -2.961519, 0, 0, 0, 1, 1,
-1.072091, -0.2094143, -2.655795, 0, 0, 0, 1, 1,
-1.067461, -0.2368292, -3.149646, 0, 0, 0, 1, 1,
-1.065753, 0.8426536, -2.341885, 1, 1, 1, 1, 1,
-1.065031, -1.219842, -3.351208, 1, 1, 1, 1, 1,
-1.064002, 1.772263, -0.4329915, 1, 1, 1, 1, 1,
-1.057206, -0.09683135, -3.134311, 1, 1, 1, 1, 1,
-1.05116, -0.7212263, -2.357238, 1, 1, 1, 1, 1,
-1.050935, 0.950021, -1.372582, 1, 1, 1, 1, 1,
-1.050811, -0.6256673, -3.830624, 1, 1, 1, 1, 1,
-1.045652, 0.3493519, -0.3787419, 1, 1, 1, 1, 1,
-1.034312, -0.02751923, -1.355867, 1, 1, 1, 1, 1,
-1.028134, 0.6878842, -1.154477, 1, 1, 1, 1, 1,
-1.027838, -1.097257, -3.588842, 1, 1, 1, 1, 1,
-1.027685, 0.9983058, -1.678414, 1, 1, 1, 1, 1,
-1.020933, -2.252614, -3.893389, 1, 1, 1, 1, 1,
-1.018738, 0.6618091, -0.7748634, 1, 1, 1, 1, 1,
-1.017052, 0.6658154, -2.354903, 1, 1, 1, 1, 1,
-1.015564, -0.8596445, -0.8177672, 0, 0, 1, 1, 1,
-1.012104, 1.48084, 0.7256759, 1, 0, 0, 1, 1,
-0.9977847, 0.732199, -1.760175, 1, 0, 0, 1, 1,
-0.9956918, 0.07360096, -2.754764, 1, 0, 0, 1, 1,
-0.9951668, 1.513593, -1.207731, 1, 0, 0, 1, 1,
-0.9914523, -1.148862, -2.719365, 1, 0, 0, 1, 1,
-0.9884189, -1.294359, -2.886537, 0, 0, 0, 1, 1,
-0.9809026, 0.8360041, -2.615872, 0, 0, 0, 1, 1,
-0.9807264, 0.2585682, -1.728681, 0, 0, 0, 1, 1,
-0.9751646, 2.883069, -0.7339108, 0, 0, 0, 1, 1,
-0.9749889, 1.434175, -0.5781751, 0, 0, 0, 1, 1,
-0.9736649, -0.1902941, -1.08765, 0, 0, 0, 1, 1,
-0.9734933, -0.3808469, -1.228771, 0, 0, 0, 1, 1,
-0.9708682, -0.2621613, -2.543241, 1, 1, 1, 1, 1,
-0.9706471, -0.1708004, -2.892528, 1, 1, 1, 1, 1,
-0.96639, 1.112952, -0.1372621, 1, 1, 1, 1, 1,
-0.9640923, -0.8821998, -2.428484, 1, 1, 1, 1, 1,
-0.9600022, -0.6183696, -3.450962, 1, 1, 1, 1, 1,
-0.9518931, 0.784598, -0.324221, 1, 1, 1, 1, 1,
-0.9505607, 0.4323826, -0.3324203, 1, 1, 1, 1, 1,
-0.9487613, 0.5410779, -1.997053, 1, 1, 1, 1, 1,
-0.9481752, 0.5842775, -0.1754978, 1, 1, 1, 1, 1,
-0.9387307, 0.200175, -1.992648, 1, 1, 1, 1, 1,
-0.9295768, 0.9307582, -1.209676, 1, 1, 1, 1, 1,
-0.9272295, 0.2815554, -1.086152, 1, 1, 1, 1, 1,
-0.9255502, 0.8875408, -1.673232, 1, 1, 1, 1, 1,
-0.9130557, -0.9069008, -2.158076, 1, 1, 1, 1, 1,
-0.9128399, 0.4283903, -1.120718, 1, 1, 1, 1, 1,
-0.9122724, -0.4586648, -0.5158263, 0, 0, 1, 1, 1,
-0.911226, -0.3439883, -0.6584792, 1, 0, 0, 1, 1,
-0.9065551, -0.1006289, -2.081218, 1, 0, 0, 1, 1,
-0.9043288, -0.467948, -3.535514, 1, 0, 0, 1, 1,
-0.9027871, -0.9399944, -4.209292, 1, 0, 0, 1, 1,
-0.8993033, 0.3322347, 1.092247, 1, 0, 0, 1, 1,
-0.8989488, 0.01738806, -1.535495, 0, 0, 0, 1, 1,
-0.894662, 0.1055883, -0.4156157, 0, 0, 0, 1, 1,
-0.8945313, -0.9902674, -1.108874, 0, 0, 0, 1, 1,
-0.8787877, -1.351328, -3.470593, 0, 0, 0, 1, 1,
-0.8757459, 1.487036, -0.007131235, 0, 0, 0, 1, 1,
-0.8729441, -0.5108528, -0.04693626, 0, 0, 0, 1, 1,
-0.8729337, 0.09878313, -2.483966, 0, 0, 0, 1, 1,
-0.8714598, 0.8963274, -0.5522938, 1, 1, 1, 1, 1,
-0.8670976, 1.508976, 1.358457, 1, 1, 1, 1, 1,
-0.8660138, 0.3118911, -2.086333, 1, 1, 1, 1, 1,
-0.8637317, -0.3487859, -1.05346, 1, 1, 1, 1, 1,
-0.8607723, -0.7729895, -3.336953, 1, 1, 1, 1, 1,
-0.8595338, -1.328943, -4.336367, 1, 1, 1, 1, 1,
-0.8499036, 1.692716, -0.8155288, 1, 1, 1, 1, 1,
-0.848347, 1.061994, -2.073998, 1, 1, 1, 1, 1,
-0.8465263, 0.2490317, -2.315339, 1, 1, 1, 1, 1,
-0.8441896, 0.7197713, -2.29479, 1, 1, 1, 1, 1,
-0.8439077, -0.3052483, -1.299923, 1, 1, 1, 1, 1,
-0.8418467, -0.2143755, -1.872802, 1, 1, 1, 1, 1,
-0.8343223, -0.392569, -2.6832, 1, 1, 1, 1, 1,
-0.8328183, 1.286922, -1.51421, 1, 1, 1, 1, 1,
-0.8311387, -0.5759594, -1.378278, 1, 1, 1, 1, 1,
-0.8264891, -0.5757203, -2.513791, 0, 0, 1, 1, 1,
-0.8218552, 0.7022423, -1.752123, 1, 0, 0, 1, 1,
-0.8199347, 0.03320772, -3.523352, 1, 0, 0, 1, 1,
-0.8149056, -0.2620697, 0.09474345, 1, 0, 0, 1, 1,
-0.8137177, 2.779656, -1.367274, 1, 0, 0, 1, 1,
-0.8016088, -0.669346, -3.20299, 1, 0, 0, 1, 1,
-0.8008254, -0.7334625, -3.619153, 0, 0, 0, 1, 1,
-0.7931768, 1.692739, 0.6150692, 0, 0, 0, 1, 1,
-0.7829538, -0.7439541, -1.054255, 0, 0, 0, 1, 1,
-0.7812015, -1.656231, -2.465226, 0, 0, 0, 1, 1,
-0.7696631, 0.6875222, -0.8950002, 0, 0, 0, 1, 1,
-0.7675924, 2.50633, 0.4896373, 0, 0, 0, 1, 1,
-0.7664791, 1.764509, 0.03687688, 0, 0, 0, 1, 1,
-0.7632877, 0.8243825, 1.13845, 1, 1, 1, 1, 1,
-0.7628231, -0.8206548, -0.2039978, 1, 1, 1, 1, 1,
-0.7556354, 1.193684, 0.1309635, 1, 1, 1, 1, 1,
-0.7551834, -0.600311, -2.364746, 1, 1, 1, 1, 1,
-0.7493294, -0.442469, -2.287525, 1, 1, 1, 1, 1,
-0.7461796, -0.5625632, -3.363136, 1, 1, 1, 1, 1,
-0.7395575, -2.632161, -4.075471, 1, 1, 1, 1, 1,
-0.7308065, -1.528073, -1.794025, 1, 1, 1, 1, 1,
-0.7296192, 0.6804146, 0.2944681, 1, 1, 1, 1, 1,
-0.7273741, -0.4611725, -1.441344, 1, 1, 1, 1, 1,
-0.7268466, 0.3335778, -1.679527, 1, 1, 1, 1, 1,
-0.7229767, 0.680914, 0.8975869, 1, 1, 1, 1, 1,
-0.7191409, 1.229548, -0.8610298, 1, 1, 1, 1, 1,
-0.7054523, 0.5720771, -0.689175, 1, 1, 1, 1, 1,
-0.7046124, -2.025237, -3.863885, 1, 1, 1, 1, 1,
-0.6985054, 0.9110953, 0.006256726, 0, 0, 1, 1, 1,
-0.694506, 1.997369, -1.040783, 1, 0, 0, 1, 1,
-0.6894765, -0.4543346, -3.10179, 1, 0, 0, 1, 1,
-0.6892846, 1.14574, -0.04129717, 1, 0, 0, 1, 1,
-0.6892632, -0.08292239, -1.677399, 1, 0, 0, 1, 1,
-0.6888673, -0.9432496, -3.845221, 1, 0, 0, 1, 1,
-0.6888566, 0.5939549, -1.110452, 0, 0, 0, 1, 1,
-0.6887349, 1.03293, -0.5814813, 0, 0, 0, 1, 1,
-0.6883249, 0.3768234, -2.059539, 0, 0, 0, 1, 1,
-0.6860546, -0.8027949, -3.028731, 0, 0, 0, 1, 1,
-0.6789687, 2.724138, 0.336417, 0, 0, 0, 1, 1,
-0.6730039, -0.4806542, -1.986715, 0, 0, 0, 1, 1,
-0.6706859, -0.3964675, -2.629774, 0, 0, 0, 1, 1,
-0.6626204, -0.6657843, -1.958952, 1, 1, 1, 1, 1,
-0.6496643, -2.110245, -1.971087, 1, 1, 1, 1, 1,
-0.6465893, -0.855382, -3.173602, 1, 1, 1, 1, 1,
-0.6444387, 0.3482714, -0.7522498, 1, 1, 1, 1, 1,
-0.6441572, 0.2385139, -1.669845, 1, 1, 1, 1, 1,
-0.640711, 1.323643, -0.2173602, 1, 1, 1, 1, 1,
-0.6361598, -0.01382089, 0.08779395, 1, 1, 1, 1, 1,
-0.6227472, -0.109184, -1.571163, 1, 1, 1, 1, 1,
-0.6201097, -0.4542283, -1.490872, 1, 1, 1, 1, 1,
-0.6168109, -0.4141676, -3.168164, 1, 1, 1, 1, 1,
-0.6149889, 1.227508, -0.07826399, 1, 1, 1, 1, 1,
-0.6131445, 1.463449, -0.596732, 1, 1, 1, 1, 1,
-0.6121767, -2.259039, -4.13177, 1, 1, 1, 1, 1,
-0.6081262, 0.8305801, 0.2443442, 1, 1, 1, 1, 1,
-0.6072727, 0.1512535, 0.2262099, 1, 1, 1, 1, 1,
-0.6069302, 1.521337, -1.678278, 0, 0, 1, 1, 1,
-0.6049073, 0.02649195, -0.988364, 1, 0, 0, 1, 1,
-0.6032301, 1.316396, -0.7412137, 1, 0, 0, 1, 1,
-0.6011961, -0.3509529, -2.132078, 1, 0, 0, 1, 1,
-0.6009366, 0.9124279, 0.2083501, 1, 0, 0, 1, 1,
-0.5997273, -1.49849, -3.310648, 1, 0, 0, 1, 1,
-0.5993218, 1.43353, 0.483935, 0, 0, 0, 1, 1,
-0.5959805, -0.3033541, -2.669353, 0, 0, 0, 1, 1,
-0.5946614, 1.028667, -1.639811, 0, 0, 0, 1, 1,
-0.5904576, -0.2368047, -2.369969, 0, 0, 0, 1, 1,
-0.5887259, 1.4333, -1.024973, 0, 0, 0, 1, 1,
-0.5884658, 0.3483982, -3.627672, 0, 0, 0, 1, 1,
-0.587793, 0.8985165, 0.9847187, 0, 0, 0, 1, 1,
-0.5875753, -1.275549, -2.969738, 1, 1, 1, 1, 1,
-0.5852191, -1.636688, -0.7155164, 1, 1, 1, 1, 1,
-0.5837463, 1.656119, 0.4384789, 1, 1, 1, 1, 1,
-0.5782512, 0.9083529, 0.6697901, 1, 1, 1, 1, 1,
-0.5642146, 0.8197414, -1.776192, 1, 1, 1, 1, 1,
-0.5635241, 1.482623, -0.2405439, 1, 1, 1, 1, 1,
-0.5633265, -0.3041389, 0.3624825, 1, 1, 1, 1, 1,
-0.5533018, -1.099192, -2.915867, 1, 1, 1, 1, 1,
-0.5531803, 0.2886822, -0.2758896, 1, 1, 1, 1, 1,
-0.5521125, -0.7713948, -2.314778, 1, 1, 1, 1, 1,
-0.5495183, -0.03109408, -1.308672, 1, 1, 1, 1, 1,
-0.5437644, 1.380329, -2.38415, 1, 1, 1, 1, 1,
-0.5295306, 0.4360328, -1.682695, 1, 1, 1, 1, 1,
-0.5257461, -0.4642727, -1.509562, 1, 1, 1, 1, 1,
-0.5239818, 0.5997257, -1.471425, 1, 1, 1, 1, 1,
-0.5062608, 0.4659328, -0.5213401, 0, 0, 1, 1, 1,
-0.5060976, 0.7308227, -1.390413, 1, 0, 0, 1, 1,
-0.5060809, 2.099258, -0.8671191, 1, 0, 0, 1, 1,
-0.4988057, -1.224834, -3.691422, 1, 0, 0, 1, 1,
-0.4975455, 0.1609345, -0.7010772, 1, 0, 0, 1, 1,
-0.4958981, 0.1863674, -2.986771, 1, 0, 0, 1, 1,
-0.4957638, 0.7817667, -0.9726011, 0, 0, 0, 1, 1,
-0.4951404, -0.6319131, -3.844243, 0, 0, 0, 1, 1,
-0.4935779, 0.2514012, -1.369957, 0, 0, 0, 1, 1,
-0.4913923, 0.4025185, -0.619816, 0, 0, 0, 1, 1,
-0.490956, -0.5515333, -2.392017, 0, 0, 0, 1, 1,
-0.4900516, -0.4925455, -2.852865, 0, 0, 0, 1, 1,
-0.4863051, 1.11311, -1.203047, 0, 0, 0, 1, 1,
-0.4830542, 1.443241, -0.8447613, 1, 1, 1, 1, 1,
-0.4808217, 1.007925, -0.1630461, 1, 1, 1, 1, 1,
-0.4801535, 0.07430489, -1.744113, 1, 1, 1, 1, 1,
-0.4712826, 0.1047383, -1.012012, 1, 1, 1, 1, 1,
-0.4703315, 0.2871871, -1.260425, 1, 1, 1, 1, 1,
-0.4660502, -0.004356359, -2.308985, 1, 1, 1, 1, 1,
-0.4655507, -0.3048074, -0.8420786, 1, 1, 1, 1, 1,
-0.4626439, -0.6052346, -1.596585, 1, 1, 1, 1, 1,
-0.4620626, 3.24659, 0.09714987, 1, 1, 1, 1, 1,
-0.4618541, -0.956511, -1.838301, 1, 1, 1, 1, 1,
-0.4614815, 1.944883, -1.300184, 1, 1, 1, 1, 1,
-0.4612574, -0.5923623, -1.870715, 1, 1, 1, 1, 1,
-0.4580126, -0.09783918, -3.063658, 1, 1, 1, 1, 1,
-0.4511681, -1.668346, -3.662647, 1, 1, 1, 1, 1,
-0.4500916, -0.003169436, -0.3781795, 1, 1, 1, 1, 1,
-0.4464072, 0.3061051, -1.185591, 0, 0, 1, 1, 1,
-0.4418453, -1.711677, -1.39955, 1, 0, 0, 1, 1,
-0.4410465, 0.7703825, -1.90911, 1, 0, 0, 1, 1,
-0.4403505, -2.139887, -2.657764, 1, 0, 0, 1, 1,
-0.4381843, -0.3401198, -3.200612, 1, 0, 0, 1, 1,
-0.4357613, 0.101981, 0.1834552, 1, 0, 0, 1, 1,
-0.4311781, 0.7919185, -1.405491, 0, 0, 0, 1, 1,
-0.423933, -1.482292, -2.108351, 0, 0, 0, 1, 1,
-0.420269, 1.347535, -0.6033055, 0, 0, 0, 1, 1,
-0.417839, 0.2667718, -1.484069, 0, 0, 0, 1, 1,
-0.4151964, 0.3738959, -1.342426, 0, 0, 0, 1, 1,
-0.4106791, 1.210478, 1.144694, 0, 0, 0, 1, 1,
-0.4061168, -0.702334, -3.047423, 0, 0, 0, 1, 1,
-0.4061035, -2.314005, -2.92037, 1, 1, 1, 1, 1,
-0.4058236, -2.69053, -2.400568, 1, 1, 1, 1, 1,
-0.4043566, 1.309993, -0.4019126, 1, 1, 1, 1, 1,
-0.4042857, 1.000563, -2.212892, 1, 1, 1, 1, 1,
-0.4023492, -0.6946591, -1.304445, 1, 1, 1, 1, 1,
-0.4022665, 0.5236983, -0.7875516, 1, 1, 1, 1, 1,
-0.400727, -0.200945, -3.7783, 1, 1, 1, 1, 1,
-0.3987377, -0.674742, -2.688582, 1, 1, 1, 1, 1,
-0.3899592, 0.1576412, -1.443045, 1, 1, 1, 1, 1,
-0.3893421, -1.417685, -2.000554, 1, 1, 1, 1, 1,
-0.3862014, -1.14941, -2.896568, 1, 1, 1, 1, 1,
-0.3829205, 0.7035314, 1.341134, 1, 1, 1, 1, 1,
-0.3795378, -1.10145, -1.190136, 1, 1, 1, 1, 1,
-0.3748598, 0.2299604, -3.230738, 1, 1, 1, 1, 1,
-0.3730764, -0.02965461, -2.54691, 1, 1, 1, 1, 1,
-0.3703162, 0.4135362, -0.170282, 0, 0, 1, 1, 1,
-0.3680179, -0.6836575, -1.467914, 1, 0, 0, 1, 1,
-0.3637009, 0.5247449, -2.461274, 1, 0, 0, 1, 1,
-0.3630638, 0.5646842, -2.221936, 1, 0, 0, 1, 1,
-0.3611107, -1.060058, -4.255143, 1, 0, 0, 1, 1,
-0.3504532, -2.047663, -4.239258, 1, 0, 0, 1, 1,
-0.3438494, 0.1328395, -1.117198, 0, 0, 0, 1, 1,
-0.3418955, 1.462591, 0.5936172, 0, 0, 0, 1, 1,
-0.3385977, 1.285305, -0.3708297, 0, 0, 0, 1, 1,
-0.3362614, -0.7884551, -3.294858, 0, 0, 0, 1, 1,
-0.3351429, 0.2308197, -0.2856346, 0, 0, 0, 1, 1,
-0.3336416, 1.039864, -1.630163, 0, 0, 0, 1, 1,
-0.3313074, 0.9566141, -1.933307, 0, 0, 0, 1, 1,
-0.3308855, -0.9301829, -0.5289744, 1, 1, 1, 1, 1,
-0.3306385, 0.4513105, -0.1472497, 1, 1, 1, 1, 1,
-0.329641, -0.8322638, -2.673695, 1, 1, 1, 1, 1,
-0.3254191, 1.234888, 0.3523183, 1, 1, 1, 1, 1,
-0.3241813, -2.689987, -2.887255, 1, 1, 1, 1, 1,
-0.321542, 0.3834754, 0.1263546, 1, 1, 1, 1, 1,
-0.3192183, -0.8902833, -2.455197, 1, 1, 1, 1, 1,
-0.3145531, -1.070509, -3.636812, 1, 1, 1, 1, 1,
-0.3110459, -0.6614904, -2.234797, 1, 1, 1, 1, 1,
-0.3106328, -1.277303, -2.565607, 1, 1, 1, 1, 1,
-0.3103035, -0.6439624, -2.562476, 1, 1, 1, 1, 1,
-0.3073032, -0.5957491, -4.053274, 1, 1, 1, 1, 1,
-0.3045694, 0.6889282, -2.096833, 1, 1, 1, 1, 1,
-0.3034553, -2.321831, -3.884868, 1, 1, 1, 1, 1,
-0.3000664, -0.4384391, -2.810477, 1, 1, 1, 1, 1,
-0.2946794, 1.111035, -1.329128, 0, 0, 1, 1, 1,
-0.2912844, 0.9093258, 0.2927755, 1, 0, 0, 1, 1,
-0.2884754, 1.817346, -0.1733035, 1, 0, 0, 1, 1,
-0.2871757, -0.7940342, -3.38657, 1, 0, 0, 1, 1,
-0.2784306, 0.5151805, 0.9725857, 1, 0, 0, 1, 1,
-0.2782063, -0.516112, -1.114924, 1, 0, 0, 1, 1,
-0.2757436, -0.02153581, -2.108332, 0, 0, 0, 1, 1,
-0.2729927, -0.4038579, -2.516452, 0, 0, 0, 1, 1,
-0.2725657, 0.9149395, -0.9584991, 0, 0, 0, 1, 1,
-0.271934, -0.7876602, -4.261409, 0, 0, 0, 1, 1,
-0.271287, -0.8043787, -2.480627, 0, 0, 0, 1, 1,
-0.2665138, -0.7577596, -1.365228, 0, 0, 0, 1, 1,
-0.2646146, 0.9930105, 1.732413, 0, 0, 0, 1, 1,
-0.2638087, -2.570959, -3.239837, 1, 1, 1, 1, 1,
-0.2637473, -0.246955, -0.7967983, 1, 1, 1, 1, 1,
-0.2636434, -0.707333, -4.026888, 1, 1, 1, 1, 1,
-0.2620787, -1.198535, -2.569156, 1, 1, 1, 1, 1,
-0.2596248, -1.244684, -4.085123, 1, 1, 1, 1, 1,
-0.25949, 1.345305, 0.04541114, 1, 1, 1, 1, 1,
-0.2556815, 0.7004657, 0.3130707, 1, 1, 1, 1, 1,
-0.2529564, 0.5682859, -0.5950041, 1, 1, 1, 1, 1,
-0.2511383, 0.6971737, 0.448985, 1, 1, 1, 1, 1,
-0.2464655, -0.145872, -2.433675, 1, 1, 1, 1, 1,
-0.2427058, -1.060266, -2.82445, 1, 1, 1, 1, 1,
-0.2406501, 0.6916245, -1.481798, 1, 1, 1, 1, 1,
-0.2399569, 0.3164008, 1.773693, 1, 1, 1, 1, 1,
-0.2382113, -0.6747729, -3.664762, 1, 1, 1, 1, 1,
-0.2379644, 0.04535335, -1.110857, 1, 1, 1, 1, 1,
-0.2370342, -0.4290554, -1.636624, 0, 0, 1, 1, 1,
-0.2358265, 0.8707523, -1.911415, 1, 0, 0, 1, 1,
-0.2345991, -0.9975737, -3.019558, 1, 0, 0, 1, 1,
-0.2325421, -0.3531102, -2.201614, 1, 0, 0, 1, 1,
-0.2307343, -0.6505861, -2.101004, 1, 0, 0, 1, 1,
-0.2306929, 1.701174, -0.1329576, 1, 0, 0, 1, 1,
-0.2302585, -1.318468, -2.286857, 0, 0, 0, 1, 1,
-0.2288301, 0.6611282, -1.437499, 0, 0, 0, 1, 1,
-0.2272532, -0.6432116, -1.760632, 0, 0, 0, 1, 1,
-0.225725, 0.5043213, -0.6477357, 0, 0, 0, 1, 1,
-0.2203758, 0.04458121, -1.538079, 0, 0, 0, 1, 1,
-0.2190834, -0.448854, -3.461807, 0, 0, 0, 1, 1,
-0.2144971, 0.7147835, 0.09432988, 0, 0, 0, 1, 1,
-0.2137934, -0.1809774, -0.5447565, 1, 1, 1, 1, 1,
-0.2122163, -1.451747, -3.111451, 1, 1, 1, 1, 1,
-0.2115371, -0.3021338, -0.62391, 1, 1, 1, 1, 1,
-0.210011, -0.4169816, -0.186087, 1, 1, 1, 1, 1,
-0.2049039, -1.381419, -2.358109, 1, 1, 1, 1, 1,
-0.1991119, 1.698935, -0.225531, 1, 1, 1, 1, 1,
-0.1956584, -0.4565927, -3.227824, 1, 1, 1, 1, 1,
-0.1921717, 1.074338, 0.1870015, 1, 1, 1, 1, 1,
-0.1914688, -1.077877, -3.72067, 1, 1, 1, 1, 1,
-0.1867096, -1.566781, -2.725568, 1, 1, 1, 1, 1,
-0.1857961, 1.629238, -0.8688855, 1, 1, 1, 1, 1,
-0.1855378, -1.247747, -3.63898, 1, 1, 1, 1, 1,
-0.1833219, 0.3065227, -1.684357, 1, 1, 1, 1, 1,
-0.1727513, -0.1886432, -1.687757, 1, 1, 1, 1, 1,
-0.1727153, -0.5144802, -2.633298, 1, 1, 1, 1, 1,
-0.1688726, -0.1676518, -1.57307, 0, 0, 1, 1, 1,
-0.1669215, -1.970146, -2.475669, 1, 0, 0, 1, 1,
-0.1581948, 0.9603897, -0.3867914, 1, 0, 0, 1, 1,
-0.1575455, 0.07077556, -1.022955, 1, 0, 0, 1, 1,
-0.1570415, 0.2673274, -0.0912491, 1, 0, 0, 1, 1,
-0.1559897, 0.3693744, -1.526384, 1, 0, 0, 1, 1,
-0.1532637, 2.529088, 0.6953316, 0, 0, 0, 1, 1,
-0.1520175, 0.03971945, -2.107201, 0, 0, 0, 1, 1,
-0.1489802, -1.683166, -2.786909, 0, 0, 0, 1, 1,
-0.1470977, -0.4263586, -1.828568, 0, 0, 0, 1, 1,
-0.1453999, 2.076456, 1.459768, 0, 0, 0, 1, 1,
-0.1451329, -1.430586, -2.659208, 0, 0, 0, 1, 1,
-0.1446424, -0.6258419, -3.222208, 0, 0, 0, 1, 1,
-0.1429705, -0.1943581, -2.068957, 1, 1, 1, 1, 1,
-0.1412494, -1.548557, -3.374972, 1, 1, 1, 1, 1,
-0.1386384, 0.4527738, -0.2929173, 1, 1, 1, 1, 1,
-0.13833, 1.087794, -0.5236772, 1, 1, 1, 1, 1,
-0.1339128, -0.6571705, -5.870317, 1, 1, 1, 1, 1,
-0.1327766, 0.4286666, -1.658822, 1, 1, 1, 1, 1,
-0.1311786, 0.4105206, -1.008539, 1, 1, 1, 1, 1,
-0.1289764, 0.8636445, -0.2039035, 1, 1, 1, 1, 1,
-0.1258445, -0.5522181, -3.602548, 1, 1, 1, 1, 1,
-0.1250555, 0.9263193, 1.412075, 1, 1, 1, 1, 1,
-0.1225361, 1.145292, 0.1351764, 1, 1, 1, 1, 1,
-0.1205677, 0.2655732, -2.603147, 1, 1, 1, 1, 1,
-0.1191255, 1.352964, 0.1472933, 1, 1, 1, 1, 1,
-0.1180083, -0.235722, -2.886431, 1, 1, 1, 1, 1,
-0.1091304, 0.5058853, -0.7273262, 1, 1, 1, 1, 1,
-0.1072632, 0.2198084, -0.8506318, 0, 0, 1, 1, 1,
-0.1060924, -0.02894306, -1.189694, 1, 0, 0, 1, 1,
-0.104329, 2.015303, 0.7589376, 1, 0, 0, 1, 1,
-0.1029604, -0.1503847, -1.940778, 1, 0, 0, 1, 1,
-0.09865759, -1.161997, -3.658597, 1, 0, 0, 1, 1,
-0.09839818, -0.2948767, -1.837083, 1, 0, 0, 1, 1,
-0.09748818, -0.9060431, -1.020192, 0, 0, 0, 1, 1,
-0.09580272, 1.375291, 0.8450059, 0, 0, 0, 1, 1,
-0.09418424, -0.471807, -2.591933, 0, 0, 0, 1, 1,
-0.09070316, -0.4141548, -2.833261, 0, 0, 0, 1, 1,
-0.08985288, -1.003097, -2.835331, 0, 0, 0, 1, 1,
-0.08862335, -1.091215, -3.107198, 0, 0, 0, 1, 1,
-0.08670209, -0.7349654, -2.051155, 0, 0, 0, 1, 1,
-0.08352559, -0.6640626, -2.358944, 1, 1, 1, 1, 1,
-0.07806276, 0.05273553, -1.051974, 1, 1, 1, 1, 1,
-0.07774081, -0.5462248, -3.226926, 1, 1, 1, 1, 1,
-0.07669291, -1.116541, -3.111724, 1, 1, 1, 1, 1,
-0.07285553, -0.6974351, -2.341417, 1, 1, 1, 1, 1,
-0.07085876, 0.2522101, 1.036939, 1, 1, 1, 1, 1,
-0.06865581, -0.7606485, -3.41838, 1, 1, 1, 1, 1,
-0.06847927, 0.4000131, -0.5747644, 1, 1, 1, 1, 1,
-0.06601812, 0.3016711, -0.003075565, 1, 1, 1, 1, 1,
-0.06285927, 0.7955794, -0.4474468, 1, 1, 1, 1, 1,
-0.06191937, 0.503366, -0.7702181, 1, 1, 1, 1, 1,
-0.05926671, -1.242969, -3.425142, 1, 1, 1, 1, 1,
-0.05718325, -0.5016508, -3.892963, 1, 1, 1, 1, 1,
-0.05452478, 0.4672115, -0.5781316, 1, 1, 1, 1, 1,
-0.04890242, -1.056876, -4.294929, 1, 1, 1, 1, 1,
-0.04759357, -0.01605243, -2.318693, 0, 0, 1, 1, 1,
-0.04645845, -0.6950659, -4.240568, 1, 0, 0, 1, 1,
-0.04578198, -0.8987892, -4.353845, 1, 0, 0, 1, 1,
-0.04537308, -0.6674931, -1.316821, 1, 0, 0, 1, 1,
-0.04345616, 0.5958901, -0.05494888, 1, 0, 0, 1, 1,
-0.04335541, -1.933675, -2.60383, 1, 0, 0, 1, 1,
-0.04277251, 0.3808214, -1.002708, 0, 0, 0, 1, 1,
-0.03695147, -0.7749525, -4.577054, 0, 0, 0, 1, 1,
-0.03153161, -0.1456951, -2.661674, 0, 0, 0, 1, 1,
-0.02972339, 1.453591, 0.6259927, 0, 0, 0, 1, 1,
-0.02930277, 0.06297193, -0.9790587, 0, 0, 0, 1, 1,
-0.02459371, 0.2659098, 1.957286, 0, 0, 0, 1, 1,
-0.02242397, -1.653087, -1.81663, 0, 0, 0, 1, 1,
-0.02141477, 1.223784, 2.09106, 1, 1, 1, 1, 1,
-0.01878278, 0.07422148, -0.4440567, 1, 1, 1, 1, 1,
-0.01795664, 1.954463, -0.9152209, 1, 1, 1, 1, 1,
-0.01651062, -1.167932, -2.382269, 1, 1, 1, 1, 1,
-0.01114773, -0.1132802, -3.478778, 1, 1, 1, 1, 1,
-0.00281103, -1.105143, -3.565693, 1, 1, 1, 1, 1,
0.0006999399, -0.6638783, 2.409512, 1, 1, 1, 1, 1,
0.001313211, -0.4147051, 2.554022, 1, 1, 1, 1, 1,
0.001334077, -0.1968015, 1.540587, 1, 1, 1, 1, 1,
0.004850602, -0.6111423, 3.791316, 1, 1, 1, 1, 1,
0.00841251, -1.164058, 2.959958, 1, 1, 1, 1, 1,
0.01362558, 1.242103, 0.3733567, 1, 1, 1, 1, 1,
0.02349371, 0.8553948, -0.3070355, 1, 1, 1, 1, 1,
0.02553462, 0.1428022, -2.055317, 1, 1, 1, 1, 1,
0.02598695, -1.171974, 4.184834, 1, 1, 1, 1, 1,
0.02866028, 0.3433704, -0.8531075, 0, 0, 1, 1, 1,
0.03003428, -1.864545, 0.1944652, 1, 0, 0, 1, 1,
0.03351327, 1.824419, -1.242165, 1, 0, 0, 1, 1,
0.03584538, 0.5550343, 2.072244, 1, 0, 0, 1, 1,
0.03862049, -0.4490953, 1.89323, 1, 0, 0, 1, 1,
0.03939204, -0.1116195, 2.203601, 1, 0, 0, 1, 1,
0.04377578, -0.6508799, 4.103791, 0, 0, 0, 1, 1,
0.04477969, 0.6678635, 1.190385, 0, 0, 0, 1, 1,
0.05041786, 0.8511699, 0.1095752, 0, 0, 0, 1, 1,
0.05187608, -0.07614656, 2.48575, 0, 0, 0, 1, 1,
0.05602201, -0.5176524, 4.762054, 0, 0, 0, 1, 1,
0.06043809, 0.9858413, -0.260858, 0, 0, 0, 1, 1,
0.06614979, -1.003277, 1.583792, 0, 0, 0, 1, 1,
0.07161967, -0.3374275, 4.259056, 1, 1, 1, 1, 1,
0.07680852, 0.5398636, 0.01040456, 1, 1, 1, 1, 1,
0.07849604, -0.5868915, 2.102134, 1, 1, 1, 1, 1,
0.08427967, 1.498932, -0.5478911, 1, 1, 1, 1, 1,
0.08952253, 1.138206, -0.43276, 1, 1, 1, 1, 1,
0.09547735, -0.1428955, 1.079975, 1, 1, 1, 1, 1,
0.09605157, -2.123894, 3.629675, 1, 1, 1, 1, 1,
0.1007986, -0.230802, 0.7957379, 1, 1, 1, 1, 1,
0.1010836, 1.723645, 0.3817548, 1, 1, 1, 1, 1,
0.1042122, 1.879225, -0.3719223, 1, 1, 1, 1, 1,
0.1064836, 0.1275088, 0.3241832, 1, 1, 1, 1, 1,
0.1082344, 0.3689726, 1.454433, 1, 1, 1, 1, 1,
0.1140795, 0.9998509, 1.60325, 1, 1, 1, 1, 1,
0.114993, 1.244318, -1.752538, 1, 1, 1, 1, 1,
0.1183825, -0.4684914, 2.391395, 1, 1, 1, 1, 1,
0.1208975, -0.6861636, 3.033896, 0, 0, 1, 1, 1,
0.1272543, -0.03947447, 0.5574742, 1, 0, 0, 1, 1,
0.1291208, 2.084599, -0.3644222, 1, 0, 0, 1, 1,
0.1304398, 1.34828, 0.2298796, 1, 0, 0, 1, 1,
0.1332812, 1.14497, 0.9829497, 1, 0, 0, 1, 1,
0.1333338, 1.420257, -0.5223402, 1, 0, 0, 1, 1,
0.1357715, -0.1041576, 1.614794, 0, 0, 0, 1, 1,
0.138033, -0.8955302, 2.431334, 0, 0, 0, 1, 1,
0.1389163, 0.4914705, 0.605471, 0, 0, 0, 1, 1,
0.1402629, -0.6965816, 2.6936, 0, 0, 0, 1, 1,
0.1433074, 1.331565, 0.2458623, 0, 0, 0, 1, 1,
0.144243, -1.468335, 3.609599, 0, 0, 0, 1, 1,
0.1449895, 0.03585389, 0.788976, 0, 0, 0, 1, 1,
0.1463364, 0.1617225, 1.322322, 1, 1, 1, 1, 1,
0.1489173, 0.2709524, -0.7968811, 1, 1, 1, 1, 1,
0.1523061, 1.674185, 2.067101, 1, 1, 1, 1, 1,
0.1579939, 0.2289645, 0.06181299, 1, 1, 1, 1, 1,
0.1616143, 0.2273591, -0.1572259, 1, 1, 1, 1, 1,
0.1703295, -0.8049251, 2.656937, 1, 1, 1, 1, 1,
0.170907, -1.785458, 1.243178, 1, 1, 1, 1, 1,
0.1713436, 0.5750835, 0.4140967, 1, 1, 1, 1, 1,
0.1717804, 0.5796034, 0.1669648, 1, 1, 1, 1, 1,
0.1746913, 0.995408, 1.660771, 1, 1, 1, 1, 1,
0.1749236, 0.9376565, -0.3674398, 1, 1, 1, 1, 1,
0.175746, -0.1977133, 3.04664, 1, 1, 1, 1, 1,
0.1820013, -0.7290367, 3.705716, 1, 1, 1, 1, 1,
0.1828363, 2.183809, 1.006378, 1, 1, 1, 1, 1,
0.185851, -0.1304963, 1.24099, 1, 1, 1, 1, 1,
0.1859014, 0.2417856, 0.9199517, 0, 0, 1, 1, 1,
0.1864191, -0.01091334, 0.8993475, 1, 0, 0, 1, 1,
0.187883, 0.1748625, 1.405589, 1, 0, 0, 1, 1,
0.1879283, 0.3957266, 1.060594, 1, 0, 0, 1, 1,
0.1906067, 0.1911354, -0.3008475, 1, 0, 0, 1, 1,
0.1907247, 1.309699, -0.2989322, 1, 0, 0, 1, 1,
0.1940475, 0.6222394, 1.114835, 0, 0, 0, 1, 1,
0.1962836, -1.812437, 2.512431, 0, 0, 0, 1, 1,
0.2048997, -0.9960012, 4.176597, 0, 0, 0, 1, 1,
0.2059033, -1.856623, 4.129059, 0, 0, 0, 1, 1,
0.2121526, 0.5149528, 1.270232, 0, 0, 0, 1, 1,
0.2134219, -0.05680154, 3.118513, 0, 0, 0, 1, 1,
0.2138858, -0.2041324, 3.207666, 0, 0, 0, 1, 1,
0.2143559, -0.2344055, 1.711555, 1, 1, 1, 1, 1,
0.2200402, 0.8998076, 0.3841321, 1, 1, 1, 1, 1,
0.2216506, -2.403921, 3.412227, 1, 1, 1, 1, 1,
0.2222861, -0.03223414, 1.865832, 1, 1, 1, 1, 1,
0.2271799, -0.5905909, 3.010472, 1, 1, 1, 1, 1,
0.2291625, -0.9720721, 2.300799, 1, 1, 1, 1, 1,
0.229609, 1.971185, 0.1821723, 1, 1, 1, 1, 1,
0.2302942, -0.7378716, 3.134041, 1, 1, 1, 1, 1,
0.2428977, 0.9187435, 0.05159272, 1, 1, 1, 1, 1,
0.2494674, -0.3824795, 2.617184, 1, 1, 1, 1, 1,
0.2524975, -0.1173191, 1.653292, 1, 1, 1, 1, 1,
0.2536751, -2.713946, 3.775138, 1, 1, 1, 1, 1,
0.2560374, -0.7754352, 4.362525, 1, 1, 1, 1, 1,
0.2577682, 1.39702, 0.6638695, 1, 1, 1, 1, 1,
0.2678627, -0.8142992, 3.818363, 1, 1, 1, 1, 1,
0.2701485, 1.099571, 0.01699308, 0, 0, 1, 1, 1,
0.2705855, 0.9758477, 0.3905489, 1, 0, 0, 1, 1,
0.2709488, -0.5006068, 3.608015, 1, 0, 0, 1, 1,
0.2749877, 0.5790653, -0.07158243, 1, 0, 0, 1, 1,
0.2763131, -0.5628791, 1.446252, 1, 0, 0, 1, 1,
0.2771771, 0.8340703, 0.7342638, 1, 0, 0, 1, 1,
0.2805932, 0.7467272, 1.631756, 0, 0, 0, 1, 1,
0.2808772, 1.769433, -1.652657, 0, 0, 0, 1, 1,
0.2855661, 1.680606, -1.790217, 0, 0, 0, 1, 1,
0.2899277, -1.452506, 2.051268, 0, 0, 0, 1, 1,
0.2931467, -1.85968, 3.02195, 0, 0, 0, 1, 1,
0.2938051, 0.2830806, -0.9808047, 0, 0, 0, 1, 1,
0.297889, 0.32983, 2.452725, 0, 0, 0, 1, 1,
0.3004985, 0.4614961, 1.789029, 1, 1, 1, 1, 1,
0.3013789, -0.3163404, 2.156775, 1, 1, 1, 1, 1,
0.3041303, 1.711396, -1.149971, 1, 1, 1, 1, 1,
0.3055339, -0.09540322, 2.461588, 1, 1, 1, 1, 1,
0.3070381, 0.3177535, 0.6197156, 1, 1, 1, 1, 1,
0.3071531, -0.6792064, 1.934195, 1, 1, 1, 1, 1,
0.3093918, -1.345484, 3.830789, 1, 1, 1, 1, 1,
0.3109653, 0.8254017, 0.6621737, 1, 1, 1, 1, 1,
0.3123335, 0.2438845, 1.215615, 1, 1, 1, 1, 1,
0.3164169, 0.7500983, 0.195016, 1, 1, 1, 1, 1,
0.3235836, 0.4697671, -1.166602, 1, 1, 1, 1, 1,
0.3308834, -2.069858, 2.869336, 1, 1, 1, 1, 1,
0.3316022, 0.1702475, -0.3274703, 1, 1, 1, 1, 1,
0.3317509, -0.3720718, 2.443394, 1, 1, 1, 1, 1,
0.3393467, 0.6895443, -0.8037747, 1, 1, 1, 1, 1,
0.3401066, -0.01435803, 2.010703, 0, 0, 1, 1, 1,
0.3498415, 0.9649391, 2.20582, 1, 0, 0, 1, 1,
0.3514385, 0.5725697, 1.276849, 1, 0, 0, 1, 1,
0.3540617, -0.08552715, 2.523358, 1, 0, 0, 1, 1,
0.3556636, 0.8686888, -0.6816939, 1, 0, 0, 1, 1,
0.3564044, -0.1090853, 1.712401, 1, 0, 0, 1, 1,
0.3621274, 0.1125094, 0.4922953, 0, 0, 0, 1, 1,
0.3627088, -0.592971, 2.420344, 0, 0, 0, 1, 1,
0.3639874, 0.9916036, -1.040651, 0, 0, 0, 1, 1,
0.3653342, 0.774966, 0.3730184, 0, 0, 0, 1, 1,
0.3682435, 0.05379478, 0.4161861, 0, 0, 0, 1, 1,
0.3684303, -1.982467, 1.900559, 0, 0, 0, 1, 1,
0.3718426, 1.162799, 0.8540341, 0, 0, 0, 1, 1,
0.3722385, -0.6441016, 2.373093, 1, 1, 1, 1, 1,
0.3744773, 1.547033, -0.8314274, 1, 1, 1, 1, 1,
0.3752656, -1.300183, 2.961709, 1, 1, 1, 1, 1,
0.3761922, 0.2305879, 0.003722025, 1, 1, 1, 1, 1,
0.3777018, 0.6052068, 1.022963, 1, 1, 1, 1, 1,
0.3783164, 0.9907137, 1.146707, 1, 1, 1, 1, 1,
0.3798987, 1.380998, -0.3252818, 1, 1, 1, 1, 1,
0.3810052, -2.388302, 2.770757, 1, 1, 1, 1, 1,
0.3841062, 1.609968, -0.07447712, 1, 1, 1, 1, 1,
0.3843698, -1.844899, 3.636977, 1, 1, 1, 1, 1,
0.3862941, 0.1531319, 2.264127, 1, 1, 1, 1, 1,
0.3894009, -0.3769225, 2.705181, 1, 1, 1, 1, 1,
0.3913072, 0.4870288, 1.857048, 1, 1, 1, 1, 1,
0.3960502, 1.147947, 0.9685552, 1, 1, 1, 1, 1,
0.3970644, 0.8693654, -0.7524304, 1, 1, 1, 1, 1,
0.3982763, -0.3403865, 2.70696, 0, 0, 1, 1, 1,
0.3997081, -0.736572, 2.037356, 1, 0, 0, 1, 1,
0.4037629, 0.8378333, -0.0146331, 1, 0, 0, 1, 1,
0.404707, -1.969873, 3.300934, 1, 0, 0, 1, 1,
0.4077977, -0.6838106, 1.594783, 1, 0, 0, 1, 1,
0.4078041, 1.288792, 0.5625329, 1, 0, 0, 1, 1,
0.4096503, -0.3569758, 2.648686, 0, 0, 0, 1, 1,
0.4130951, -1.888775, 1.722988, 0, 0, 0, 1, 1,
0.4131529, 1.066148, 0.4125604, 0, 0, 0, 1, 1,
0.4159534, 1.750925, 0.7886692, 0, 0, 0, 1, 1,
0.4209218, -0.5286243, 3.321135, 0, 0, 0, 1, 1,
0.4258565, 2.221043, 0.1801458, 0, 0, 0, 1, 1,
0.4259857, -1.110708, 1.299567, 0, 0, 0, 1, 1,
0.4268655, 0.5724017, 1.901962, 1, 1, 1, 1, 1,
0.4331822, 0.5852519, 1.716086, 1, 1, 1, 1, 1,
0.4336153, -0.2593657, 1.586647, 1, 1, 1, 1, 1,
0.4342359, 1.153718, 0.9787745, 1, 1, 1, 1, 1,
0.4436859, 0.4630546, 0.3313453, 1, 1, 1, 1, 1,
0.4456713, -0.5775036, 1.450764, 1, 1, 1, 1, 1,
0.4515447, -0.1490577, 2.482911, 1, 1, 1, 1, 1,
0.4518225, 0.8338528, -0.1942492, 1, 1, 1, 1, 1,
0.4567097, 0.9683905, -1.1394, 1, 1, 1, 1, 1,
0.4593502, -0.6380921, 3.051193, 1, 1, 1, 1, 1,
0.4618491, 2.072652, -1.634453, 1, 1, 1, 1, 1,
0.4627077, 0.2655494, 0.791192, 1, 1, 1, 1, 1,
0.4635586, 0.5381172, 0.3365197, 1, 1, 1, 1, 1,
0.463763, -1.077399, 2.728518, 1, 1, 1, 1, 1,
0.4653934, -0.8259215, 3.277927, 1, 1, 1, 1, 1,
0.4726054, -0.0581465, 4.198672, 0, 0, 1, 1, 1,
0.4726895, -1.276425, 2.640522, 1, 0, 0, 1, 1,
0.4734721, -1.07078, 1.663832, 1, 0, 0, 1, 1,
0.4757774, 0.7046155, 1.27977, 1, 0, 0, 1, 1,
0.4880114, 1.158301, 0.3881011, 1, 0, 0, 1, 1,
0.4885031, -0.3499455, 3.014431, 1, 0, 0, 1, 1,
0.4923853, 0.6801298, 0.8674981, 0, 0, 0, 1, 1,
0.4964361, -2.168962, 4.297972, 0, 0, 0, 1, 1,
0.4991861, -1.616505, 1.908336, 0, 0, 0, 1, 1,
0.5006886, -0.1345635, 0.259268, 0, 0, 0, 1, 1,
0.5032837, 0.1496087, 0.7411457, 0, 0, 0, 1, 1,
0.5036836, -1.361912, 2.917288, 0, 0, 0, 1, 1,
0.5075914, -0.5878302, 0.8186411, 0, 0, 0, 1, 1,
0.50826, -1.699181, 4.716625, 1, 1, 1, 1, 1,
0.5088852, -0.9355808, 3.248155, 1, 1, 1, 1, 1,
0.5101319, -0.5634072, 1.949094, 1, 1, 1, 1, 1,
0.5119542, -0.05358103, 2.744388, 1, 1, 1, 1, 1,
0.5131223, -0.4711099, 0.9925075, 1, 1, 1, 1, 1,
0.5147897, -0.9257421, 2.532708, 1, 1, 1, 1, 1,
0.5187229, -0.4220189, 2.912067, 1, 1, 1, 1, 1,
0.5193052, 0.6904441, 1.392565, 1, 1, 1, 1, 1,
0.5193698, 1.056611, 0.4293703, 1, 1, 1, 1, 1,
0.5265462, -0.4924206, 1.426959, 1, 1, 1, 1, 1,
0.5284052, -0.322019, 1.945713, 1, 1, 1, 1, 1,
0.5295736, 0.3303215, 0.9049256, 1, 1, 1, 1, 1,
0.5302417, 1.543872, 2.570479, 1, 1, 1, 1, 1,
0.5389307, 0.9337426, -0.1122638, 1, 1, 1, 1, 1,
0.5447559, -0.2433266, 0.267692, 1, 1, 1, 1, 1,
0.547677, 0.8815297, -0.7806177, 0, 0, 1, 1, 1,
0.5527038, -0.4302376, 3.1993, 1, 0, 0, 1, 1,
0.5535588, 0.9667661, 1.978885, 1, 0, 0, 1, 1,
0.5570817, 0.2831394, 0.5602651, 1, 0, 0, 1, 1,
0.5593328, -0.9702419, 0.5624314, 1, 0, 0, 1, 1,
0.563175, -0.8319312, 3.063763, 1, 0, 0, 1, 1,
0.5633329, -1.34162, 0.9268908, 0, 0, 0, 1, 1,
0.5687429, -0.207681, 1.728767, 0, 0, 0, 1, 1,
0.5689618, -0.3899429, 1.944734, 0, 0, 0, 1, 1,
0.5720274, -1.964358, 2.65998, 0, 0, 0, 1, 1,
0.5725506, -0.7576139, 0.6348381, 0, 0, 0, 1, 1,
0.5755075, -1.754693, 2.342767, 0, 0, 0, 1, 1,
0.5757152, -0.8534243, 3.084939, 0, 0, 0, 1, 1,
0.5791621, -0.700907, 3.057302, 1, 1, 1, 1, 1,
0.5808154, -0.5469297, 2.370755, 1, 1, 1, 1, 1,
0.5878059, -0.4254268, 1.97813, 1, 1, 1, 1, 1,
0.5884048, 0.2713054, -0.1397052, 1, 1, 1, 1, 1,
0.5886877, -0.3798738, 3.935437, 1, 1, 1, 1, 1,
0.5925298, 0.953992, -1.084342, 1, 1, 1, 1, 1,
0.5929011, 0.7295895, 0.7736308, 1, 1, 1, 1, 1,
0.5938179, -1.547054, -0.00649546, 1, 1, 1, 1, 1,
0.594704, -0.3426201, 2.083018, 1, 1, 1, 1, 1,
0.5951665, 0.04946259, 2.502925, 1, 1, 1, 1, 1,
0.5965078, 2.402798, 1.681484, 1, 1, 1, 1, 1,
0.5997015, 0.5061409, 0.2779845, 1, 1, 1, 1, 1,
0.6055382, 0.767822, 0.3668309, 1, 1, 1, 1, 1,
0.6074492, 1.76109, 1.759182, 1, 1, 1, 1, 1,
0.6076196, -1.171624, 2.151755, 1, 1, 1, 1, 1,
0.6109594, 1.074921, 1.576517, 0, 0, 1, 1, 1,
0.6146514, 1.582274, 0.8412223, 1, 0, 0, 1, 1,
0.6150379, 0.315594, 1.577657, 1, 0, 0, 1, 1,
0.616088, 1.21126, 0.06709804, 1, 0, 0, 1, 1,
0.6176549, 1.145012, -0.5424079, 1, 0, 0, 1, 1,
0.617932, 0.3073873, -1.164263, 1, 0, 0, 1, 1,
0.630622, 1.881658, 1.347955, 0, 0, 0, 1, 1,
0.6357542, -1.020546, 0.493356, 0, 0, 0, 1, 1,
0.6369114, -0.1208216, 3.090867, 0, 0, 0, 1, 1,
0.6407635, 2.269853, 1.333193, 0, 0, 0, 1, 1,
0.6412615, -1.202649, 3.068572, 0, 0, 0, 1, 1,
0.6427963, -1.115132, 3.513813, 0, 0, 0, 1, 1,
0.6449138, 1.087583, 1.336111, 0, 0, 0, 1, 1,
0.6512696, 0.5601354, 0.2505214, 1, 1, 1, 1, 1,
0.6532868, 1.53746, 1.879845, 1, 1, 1, 1, 1,
0.6572452, 0.8224016, 0.1049636, 1, 1, 1, 1, 1,
0.659937, 0.1797958, 0.6128815, 1, 1, 1, 1, 1,
0.6703805, -0.0830104, 1.551612, 1, 1, 1, 1, 1,
0.6716217, -1.025745, 0.8645559, 1, 1, 1, 1, 1,
0.6793889, -0.2832185, 2.540083, 1, 1, 1, 1, 1,
0.6825268, 0.4695406, 3.47473, 1, 1, 1, 1, 1,
0.6898713, -1.237261, 3.228302, 1, 1, 1, 1, 1,
0.6904852, 0.3427123, 0.9443385, 1, 1, 1, 1, 1,
0.692717, 0.9149982, 0.8205678, 1, 1, 1, 1, 1,
0.7000521, 0.8539956, 1.003767, 1, 1, 1, 1, 1,
0.7036368, 1.940394, 1.517429, 1, 1, 1, 1, 1,
0.7037382, 1.287186, 0.7797717, 1, 1, 1, 1, 1,
0.7069085, -0.9905515, 1.918939, 1, 1, 1, 1, 1,
0.7126678, -0.3209804, 2.081095, 0, 0, 1, 1, 1,
0.7132953, 1.320617, 1.654698, 1, 0, 0, 1, 1,
0.713421, 1.046512, 0.8143046, 1, 0, 0, 1, 1,
0.7134464, 0.08233192, 2.067434, 1, 0, 0, 1, 1,
0.7161401, -0.7980463, 2.376055, 1, 0, 0, 1, 1,
0.7209985, 0.3944842, 0.1667368, 1, 0, 0, 1, 1,
0.7238863, 1.502488, -0.3419044, 0, 0, 0, 1, 1,
0.7297228, 0.5192186, -1.018722, 0, 0, 0, 1, 1,
0.7297872, 0.2922173, 3.26106, 0, 0, 0, 1, 1,
0.731393, 0.5477521, -0.6271744, 0, 0, 0, 1, 1,
0.7343288, 0.395175, 0.6461796, 0, 0, 0, 1, 1,
0.7393688, 1.380643, 0.7148877, 0, 0, 0, 1, 1,
0.7400133, -0.8157379, 3.502575, 0, 0, 0, 1, 1,
0.7428783, -0.5979939, 1.993997, 1, 1, 1, 1, 1,
0.7429698, -1.555897, 3.394909, 1, 1, 1, 1, 1,
0.7433146, -0.4488377, 2.248679, 1, 1, 1, 1, 1,
0.7447914, -1.598228, 2.838228, 1, 1, 1, 1, 1,
0.7529052, 0.2402985, 1.702213, 1, 1, 1, 1, 1,
0.7613189, 1.133812, 1.31596, 1, 1, 1, 1, 1,
0.7619534, 1.913336, -0.1255752, 1, 1, 1, 1, 1,
0.7757353, 0.009689051, 0.9984325, 1, 1, 1, 1, 1,
0.7760639, 0.494383, 1.176503, 1, 1, 1, 1, 1,
0.7791057, 0.5605911, 1.144397, 1, 1, 1, 1, 1,
0.7804525, 0.303734, 2.456311, 1, 1, 1, 1, 1,
0.7867645, 1.561344, 2.252614, 1, 1, 1, 1, 1,
0.7905133, -0.7848951, -0.622418, 1, 1, 1, 1, 1,
0.7916582, -0.3915819, 2.335724, 1, 1, 1, 1, 1,
0.7933553, -2.064817, 2.263878, 1, 1, 1, 1, 1,
0.7999483, 0.4421488, 0.6813228, 0, 0, 1, 1, 1,
0.8014926, -0.2688819, 3.449292, 1, 0, 0, 1, 1,
0.8018535, -0.06679957, 0.9193017, 1, 0, 0, 1, 1,
0.8052571, 0.1689932, 1.660703, 1, 0, 0, 1, 1,
0.8071766, -2.198251, 2.677706, 1, 0, 0, 1, 1,
0.8278421, 1.214, -0.5964051, 1, 0, 0, 1, 1,
0.8350343, 0.4303454, 0.2934377, 0, 0, 0, 1, 1,
0.8354817, -0.2699988, 1.909652, 0, 0, 0, 1, 1,
0.8369753, 0.1498571, 1.276663, 0, 0, 0, 1, 1,
0.8454193, 1.315569, 0.07953046, 0, 0, 0, 1, 1,
0.8507805, -1.44435, 3.155561, 0, 0, 0, 1, 1,
0.8511462, -0.4102948, 3.116287, 0, 0, 0, 1, 1,
0.8595276, 1.790918, 0.3334732, 0, 0, 0, 1, 1,
0.867629, 0.8568974, 0.08268984, 1, 1, 1, 1, 1,
0.8742716, 0.8492924, -0.9821578, 1, 1, 1, 1, 1,
0.8765069, -0.1233482, 2.14841, 1, 1, 1, 1, 1,
0.8767158, 0.5474905, 0.8800706, 1, 1, 1, 1, 1,
0.8789495, 0.2086542, 1.911165, 1, 1, 1, 1, 1,
0.8821812, 0.04262163, 0.8889896, 1, 1, 1, 1, 1,
0.8880222, 0.0855246, 1.013208, 1, 1, 1, 1, 1,
0.897624, -0.3277263, 3.537245, 1, 1, 1, 1, 1,
0.8992188, 0.9797817, 1.446151, 1, 1, 1, 1, 1,
0.9038017, 0.2767411, -0.3867717, 1, 1, 1, 1, 1,
0.9218867, 0.7859312, 0.3056339, 1, 1, 1, 1, 1,
0.9339261, -0.6660196, 4.423985, 1, 1, 1, 1, 1,
0.9397878, -0.2530076, 1.914987, 1, 1, 1, 1, 1,
0.952646, 0.1606059, -0.4873271, 1, 1, 1, 1, 1,
0.9607905, 2.016329, -0.330474, 1, 1, 1, 1, 1,
0.9682585, -0.1037312, 2.089491, 0, 0, 1, 1, 1,
0.9725361, 1.479348, -0.248123, 1, 0, 0, 1, 1,
0.9731686, 0.1326035, 1.385683, 1, 0, 0, 1, 1,
0.9756541, -0.7196614, 2.797107, 1, 0, 0, 1, 1,
0.9773768, -0.820564, 2.308444, 1, 0, 0, 1, 1,
0.9847004, -1.133706, 1.956802, 1, 0, 0, 1, 1,
0.9909429, 0.2892419, 0.5850677, 0, 0, 0, 1, 1,
0.9941148, -0.5259091, 2.883724, 0, 0, 0, 1, 1,
0.9946957, -0.09595569, 0.404092, 0, 0, 0, 1, 1,
1.00053, 0.9719059, -1.153791, 0, 0, 0, 1, 1,
1.003183, 0.3875732, 2.677037, 0, 0, 0, 1, 1,
1.019462, -1.707235, 3.880382, 0, 0, 0, 1, 1,
1.039634, -0.7068298, 2.526419, 0, 0, 0, 1, 1,
1.044458, -0.1885762, 1.707827, 1, 1, 1, 1, 1,
1.046667, -1.240766, 4.885106, 1, 1, 1, 1, 1,
1.046988, 0.4328359, 0.355072, 1, 1, 1, 1, 1,
1.048616, 0.003093304, 1.965439, 1, 1, 1, 1, 1,
1.056528, -0.6955325, 1.136868, 1, 1, 1, 1, 1,
1.060215, 2.869377, 1.655084, 1, 1, 1, 1, 1,
1.061679, 0.3125759, -1.195657, 1, 1, 1, 1, 1,
1.063744, -1.215922, 2.517536, 1, 1, 1, 1, 1,
1.064263, -0.6457316, 1.440584, 1, 1, 1, 1, 1,
1.064644, -0.7961543, 3.099236, 1, 1, 1, 1, 1,
1.067103, -1.09174, 1.754608, 1, 1, 1, 1, 1,
1.072298, -0.08017423, 2.539618, 1, 1, 1, 1, 1,
1.082116, -1.161405, 2.114239, 1, 1, 1, 1, 1,
1.084685, -0.8936137, 1.673984, 1, 1, 1, 1, 1,
1.08533, 1.177198, 1.403322, 1, 1, 1, 1, 1,
1.089573, 0.3987042, 0.3534112, 0, 0, 1, 1, 1,
1.089928, 1.509736, 0.7904155, 1, 0, 0, 1, 1,
1.090397, 0.55076, 3.025232, 1, 0, 0, 1, 1,
1.091401, 0.4335284, 0.6289841, 1, 0, 0, 1, 1,
1.095254, 0.8172178, 2.142767, 1, 0, 0, 1, 1,
1.096399, 0.04226798, 1.788215, 1, 0, 0, 1, 1,
1.096662, 0.6936205, -0.5884644, 0, 0, 0, 1, 1,
1.098449, 1.509572, 0.07321204, 0, 0, 0, 1, 1,
1.104682, 0.2691185, 1.593996, 0, 0, 0, 1, 1,
1.107948, 0.507089, 1.169333, 0, 0, 0, 1, 1,
1.118294, -0.4369755, 2.920741, 0, 0, 0, 1, 1,
1.118415, 0.06154748, 1.375262, 0, 0, 0, 1, 1,
1.123332, -1.839145, 2.907497, 0, 0, 0, 1, 1,
1.127721, 1.857788, 0.1928995, 1, 1, 1, 1, 1,
1.12859, 1.45286, 0.06400935, 1, 1, 1, 1, 1,
1.12883, 0.7021287, 0.9652937, 1, 1, 1, 1, 1,
1.137407, 0.2915863, 2.255525, 1, 1, 1, 1, 1,
1.139902, -1.526275, 3.140611, 1, 1, 1, 1, 1,
1.140618, -0.850212, 2.601515, 1, 1, 1, 1, 1,
1.147032, -0.1252192, 3.431386, 1, 1, 1, 1, 1,
1.166096, -1.602036, 1.667216, 1, 1, 1, 1, 1,
1.192975, 1.019772, 1.587762, 1, 1, 1, 1, 1,
1.196708, -0.2303278, 0.9891789, 1, 1, 1, 1, 1,
1.220494, 1.514678, 2.743593, 1, 1, 1, 1, 1,
1.228067, -0.2763219, 1.60304, 1, 1, 1, 1, 1,
1.231875, -0.7287062, 1.934485, 1, 1, 1, 1, 1,
1.236742, 0.7768218, 0.8119922, 1, 1, 1, 1, 1,
1.238411, 0.4271976, 0.1784262, 1, 1, 1, 1, 1,
1.245531, 0.3042824, 3.226132, 0, 0, 1, 1, 1,
1.248715, -0.7281879, 0.3080017, 1, 0, 0, 1, 1,
1.249348, -0.4297132, 2.847205, 1, 0, 0, 1, 1,
1.253071, 0.4830374, 1.537389, 1, 0, 0, 1, 1,
1.254972, -0.7663206, 1.159529, 1, 0, 0, 1, 1,
1.261613, -0.9367986, 4.138251, 1, 0, 0, 1, 1,
1.26587, -2.789947, 2.752145, 0, 0, 0, 1, 1,
1.265956, -0.1605408, 2.414416, 0, 0, 0, 1, 1,
1.268116, 0.5360333, 1.271474, 0, 0, 0, 1, 1,
1.269398, -1.787804, 2.69277, 0, 0, 0, 1, 1,
1.271437, 0.498937, 0.3857731, 0, 0, 0, 1, 1,
1.271505, -1.190314, 1.823178, 0, 0, 0, 1, 1,
1.27337, -1.509609, 0.6516362, 0, 0, 0, 1, 1,
1.274543, 1.75266, 1.739927, 1, 1, 1, 1, 1,
1.275304, -1.30992, 1.652109, 1, 1, 1, 1, 1,
1.2756, 0.980316, -0.270483, 1, 1, 1, 1, 1,
1.285722, 1.79546, 1.769998, 1, 1, 1, 1, 1,
1.298969, 1.652778, 0.990118, 1, 1, 1, 1, 1,
1.300689, 0.4317225, 1.333007, 1, 1, 1, 1, 1,
1.321127, -1.719178, 1.962751, 1, 1, 1, 1, 1,
1.336608, 1.125264, 0.8373631, 1, 1, 1, 1, 1,
1.344258, 0.2218181, 3.669898, 1, 1, 1, 1, 1,
1.359652, -0.5029449, 0.593044, 1, 1, 1, 1, 1,
1.361403, 0.3709632, 1.247107, 1, 1, 1, 1, 1,
1.372114, -0.6530519, 1.445743, 1, 1, 1, 1, 1,
1.377959, 2.873662, 0.9256054, 1, 1, 1, 1, 1,
1.397535, 0.8344481, 1.071986, 1, 1, 1, 1, 1,
1.403308, -0.7947202, 1.691835, 1, 1, 1, 1, 1,
1.406752, -0.02474401, 3.516524, 0, 0, 1, 1, 1,
1.419473, 0.1381167, 0.5400531, 1, 0, 0, 1, 1,
1.420528, 0.369299, 1.420937, 1, 0, 0, 1, 1,
1.428281, -0.4441696, 2.263756, 1, 0, 0, 1, 1,
1.430877, 0.1678915, 2.725094, 1, 0, 0, 1, 1,
1.432604, -1.044873, 2.657594, 1, 0, 0, 1, 1,
1.433131, -1.819784, 1.948273, 0, 0, 0, 1, 1,
1.436985, -0.1289286, 0.6477948, 0, 0, 0, 1, 1,
1.439902, -0.464004, 3.849557, 0, 0, 0, 1, 1,
1.453405, 0.8650655, 0.6266805, 0, 0, 0, 1, 1,
1.458774, 0.8275886, -0.2151521, 0, 0, 0, 1, 1,
1.467093, 2.313403, -0.3288723, 0, 0, 0, 1, 1,
1.470723, -1.368973, 1.581686, 0, 0, 0, 1, 1,
1.471654, -0.9378507, 0.4406757, 1, 1, 1, 1, 1,
1.481437, -1.162494, 2.394884, 1, 1, 1, 1, 1,
1.492953, 2.298481, -1.047093, 1, 1, 1, 1, 1,
1.495028, -1.461961, 1.679126, 1, 1, 1, 1, 1,
1.503602, 0.3512607, 0.9701068, 1, 1, 1, 1, 1,
1.508889, -1.192033, 1.746049, 1, 1, 1, 1, 1,
1.518066, 0.5019466, 1.247503, 1, 1, 1, 1, 1,
1.527791, -0.6078584, -0.4742883, 1, 1, 1, 1, 1,
1.542253, 1.23755, 1.548512, 1, 1, 1, 1, 1,
1.549339, -0.1724012, 0.8782085, 1, 1, 1, 1, 1,
1.550539, 0.4048308, 1.417211, 1, 1, 1, 1, 1,
1.557418, 0.1932634, 1.870154, 1, 1, 1, 1, 1,
1.558414, 0.286274, 0.3339746, 1, 1, 1, 1, 1,
1.569447, -0.5267835, 1.037495, 1, 1, 1, 1, 1,
1.570849, 2.604247, 0.7048587, 1, 1, 1, 1, 1,
1.58035, -0.589669, 1.748724, 0, 0, 1, 1, 1,
1.581756, -0.2228552, 2.298679, 1, 0, 0, 1, 1,
1.582039, 0.3479424, 1.913195, 1, 0, 0, 1, 1,
1.584222, -1.462461, 2.127776, 1, 0, 0, 1, 1,
1.585432, -1.441674, 2.607732, 1, 0, 0, 1, 1,
1.598829, -2.371107, 3.92139, 1, 0, 0, 1, 1,
1.629745, -1.968815, 3.326249, 0, 0, 0, 1, 1,
1.647823, 2.538814, -0.4609637, 0, 0, 0, 1, 1,
1.649409, 1.137827, 1.098249, 0, 0, 0, 1, 1,
1.654847, 1.505664, 1.850169, 0, 0, 0, 1, 1,
1.726689, -1.757347, 1.947232, 0, 0, 0, 1, 1,
1.727631, -0.6718301, 1.203717, 0, 0, 0, 1, 1,
1.744032, 0.4697765, 2.805272, 0, 0, 0, 1, 1,
1.7469, 0.07342391, 2.109145, 1, 1, 1, 1, 1,
1.795033, 1.463729, 0.777443, 1, 1, 1, 1, 1,
1.79977, -1.350533, 3.722911, 1, 1, 1, 1, 1,
1.822429, 0.3159488, 2.542325, 1, 1, 1, 1, 1,
1.855694, 0.6574565, -0.5210243, 1, 1, 1, 1, 1,
1.863724, 1.65806, 0.8695982, 1, 1, 1, 1, 1,
1.867722, -0.7223697, 2.660285, 1, 1, 1, 1, 1,
1.882841, -0.9927881, 1.526521, 1, 1, 1, 1, 1,
1.893677, -0.1267849, 1.983843, 1, 1, 1, 1, 1,
1.928506, -1.651277, 1.292085, 1, 1, 1, 1, 1,
1.932826, 0.01494518, 1.784741, 1, 1, 1, 1, 1,
1.970425, -0.8286715, 0.7720792, 1, 1, 1, 1, 1,
1.987047, -0.0473401, 1.443682, 1, 1, 1, 1, 1,
1.998147, -0.3644393, 3.25387, 1, 1, 1, 1, 1,
2.018466, 0.6390792, -0.05739151, 1, 1, 1, 1, 1,
2.04127, -1.232033, 1.869081, 0, 0, 1, 1, 1,
2.072823, 0.5795448, 0.6392453, 1, 0, 0, 1, 1,
2.074407, -0.1101564, 2.515951, 1, 0, 0, 1, 1,
2.088305, 0.4973542, 0.07285823, 1, 0, 0, 1, 1,
2.104707, -0.8648455, 1.822933, 1, 0, 0, 1, 1,
2.124938, 0.5706214, 0.6909, 1, 0, 0, 1, 1,
2.137938, 0.8099354, 0.4653371, 0, 0, 0, 1, 1,
2.14908, 0.5431331, 1.891519, 0, 0, 0, 1, 1,
2.16135, -1.286646, 1.187185, 0, 0, 0, 1, 1,
2.174216, -0.7272324, 2.263911, 0, 0, 0, 1, 1,
2.180785, -0.8282481, 2.175558, 0, 0, 0, 1, 1,
2.235921, 0.2483348, 2.303984, 0, 0, 0, 1, 1,
2.282357, -1.271685, 1.449371, 0, 0, 0, 1, 1,
2.415357, 1.644307, 0.2174408, 1, 1, 1, 1, 1,
2.468906, -0.233139, 1.669991, 1, 1, 1, 1, 1,
2.541087, 1.412771, 1.456275, 1, 1, 1, 1, 1,
2.704353, 0.9153426, 1.767496, 1, 1, 1, 1, 1,
2.862949, -0.0217519, 0.8480251, 1, 1, 1, 1, 1,
3.01881, -0.5217485, 0.1538841, 1, 1, 1, 1, 1,
3.390232, -0.07011005, 0.8345947, 1, 1, 1, 1, 1
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
var radius = 9.485384;
var distance = 33.31701;
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
mvMatrix.translate( -0.2026609, -0.2283212, 0.4926054 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31701);
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
