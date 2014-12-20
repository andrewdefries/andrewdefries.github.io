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
-3.593014, -0.3714607, -2.214292, 1, 0, 0, 1,
-3.338916, -1.165316, -2.227939, 1, 0.007843138, 0, 1,
-2.798695, 0.5297846, -0.1888401, 1, 0.01176471, 0, 1,
-2.775639, 0.71347, -1.08026, 1, 0.01960784, 0, 1,
-2.77481, -0.5316959, -3.398398, 1, 0.02352941, 0, 1,
-2.695601, -0.2200135, -0.8355072, 1, 0.03137255, 0, 1,
-2.587604, 1.387813, -0.03350521, 1, 0.03529412, 0, 1,
-2.562554, 0.1453412, -2.624073, 1, 0.04313726, 0, 1,
-2.423347, 0.1001938, -1.917974, 1, 0.04705882, 0, 1,
-2.364494, -1.327449, 0.1256368, 1, 0.05490196, 0, 1,
-2.250628, -0.5475683, -1.610811, 1, 0.05882353, 0, 1,
-2.247211, -0.3467364, -0.3448602, 1, 0.06666667, 0, 1,
-2.245934, 0.2103486, -0.4643874, 1, 0.07058824, 0, 1,
-2.180504, -0.7274899, -3.311051, 1, 0.07843138, 0, 1,
-2.16707, 0.1427889, -0.3535262, 1, 0.08235294, 0, 1,
-2.063184, 0.06887846, -1.7523, 1, 0.09019608, 0, 1,
-2.052748, -0.7358359, -2.987399, 1, 0.09411765, 0, 1,
-2.046999, 0.6270277, -2.842276, 1, 0.1019608, 0, 1,
-2.037104, 1.374151, -1.55005, 1, 0.1098039, 0, 1,
-2.031163, 1.316259, -0.1083037, 1, 0.1137255, 0, 1,
-2.001561, 0.4599016, -0.5478696, 1, 0.1215686, 0, 1,
-1.986065, -0.5624434, -1.482267, 1, 0.1254902, 0, 1,
-1.947986, -0.9341426, -0.3670975, 1, 0.1333333, 0, 1,
-1.941546, -0.2671514, -1.12427, 1, 0.1372549, 0, 1,
-1.88189, 0.1943167, -1.371076, 1, 0.145098, 0, 1,
-1.846878, 0.9250916, -0.8433591, 1, 0.1490196, 0, 1,
-1.842176, -2.37386, -1.796492, 1, 0.1568628, 0, 1,
-1.827363, -0.8913134, -3.060635, 1, 0.1607843, 0, 1,
-1.79565, -0.2005487, -1.661182, 1, 0.1686275, 0, 1,
-1.776359, -0.7197396, -3.161129, 1, 0.172549, 0, 1,
-1.76288, 0.6980342, -0.0679306, 1, 0.1803922, 0, 1,
-1.748796, 0.7279585, -1.26782, 1, 0.1843137, 0, 1,
-1.747982, 0.1159746, 0.00500057, 1, 0.1921569, 0, 1,
-1.746203, 0.3783686, -2.225836, 1, 0.1960784, 0, 1,
-1.744957, 1.070845, -1.374078, 1, 0.2039216, 0, 1,
-1.737971, 0.05928843, -0.483268, 1, 0.2117647, 0, 1,
-1.723044, -1.205107, -2.844622, 1, 0.2156863, 0, 1,
-1.722992, -0.05041492, -2.063272, 1, 0.2235294, 0, 1,
-1.702746, -0.2347168, -1.360692, 1, 0.227451, 0, 1,
-1.688928, 1.978062, 0.08937874, 1, 0.2352941, 0, 1,
-1.661619, -1.39409, -1.359512, 1, 0.2392157, 0, 1,
-1.659775, -0.2702092, -1.826441, 1, 0.2470588, 0, 1,
-1.645284, 1.093124, -1.248811, 1, 0.2509804, 0, 1,
-1.623157, 1.943812, -1.092406, 1, 0.2588235, 0, 1,
-1.601231, -1.176256, -3.595876, 1, 0.2627451, 0, 1,
-1.592617, -0.6121889, -1.966577, 1, 0.2705882, 0, 1,
-1.590749, 1.803789, -1.17233, 1, 0.2745098, 0, 1,
-1.590715, -0.1560232, -0.4119759, 1, 0.282353, 0, 1,
-1.563158, -0.07411756, -1.333278, 1, 0.2862745, 0, 1,
-1.560731, -0.1976093, -1.003098, 1, 0.2941177, 0, 1,
-1.544039, -0.6643378, -2.083398, 1, 0.3019608, 0, 1,
-1.542773, 0.4323754, -0.2110612, 1, 0.3058824, 0, 1,
-1.538838, -0.08272877, -2.530508, 1, 0.3137255, 0, 1,
-1.518161, 0.38799, -0.373532, 1, 0.3176471, 0, 1,
-1.517392, 0.551, -0.8665122, 1, 0.3254902, 0, 1,
-1.515964, 0.4694088, -2.551154, 1, 0.3294118, 0, 1,
-1.512919, 0.5720824, -0.6273199, 1, 0.3372549, 0, 1,
-1.4953, -0.0460701, -1.59777, 1, 0.3411765, 0, 1,
-1.487775, -0.2720477, -0.4910946, 1, 0.3490196, 0, 1,
-1.474346, -0.1069905, -3.16523, 1, 0.3529412, 0, 1,
-1.468792, 0.4645858, -3.072507, 1, 0.3607843, 0, 1,
-1.46874, 1.188409, -0.6460505, 1, 0.3647059, 0, 1,
-1.465183, 0.6688667, -0.1090156, 1, 0.372549, 0, 1,
-1.442704, -2.511971, -3.105168, 1, 0.3764706, 0, 1,
-1.441287, 0.8262755, -1.983696, 1, 0.3843137, 0, 1,
-1.436267, -0.9797332, -1.522748, 1, 0.3882353, 0, 1,
-1.426631, 0.2656931, -0.7914522, 1, 0.3960784, 0, 1,
-1.420535, 1.46161, 0.9018, 1, 0.4039216, 0, 1,
-1.420085, 1.324464, 0.04161607, 1, 0.4078431, 0, 1,
-1.41851, -0.6945693, -3.242065, 1, 0.4156863, 0, 1,
-1.413722, 0.2784162, -1.476152, 1, 0.4196078, 0, 1,
-1.374485, 1.494877, -0.5396424, 1, 0.427451, 0, 1,
-1.368768, 0.5577571, -1.89262, 1, 0.4313726, 0, 1,
-1.36197, -0.6407806, -2.217569, 1, 0.4392157, 0, 1,
-1.342044, 0.4504143, 0.5232277, 1, 0.4431373, 0, 1,
-1.337366, -1.778959, -2.414006, 1, 0.4509804, 0, 1,
-1.329226, -1.330179, -3.359619, 1, 0.454902, 0, 1,
-1.320332, -0.1842182, -0.9058228, 1, 0.4627451, 0, 1,
-1.31952, -0.3340037, -3.127533, 1, 0.4666667, 0, 1,
-1.300984, 1.159659, -2.627254, 1, 0.4745098, 0, 1,
-1.294925, -0.02654514, -1.99293, 1, 0.4784314, 0, 1,
-1.293258, 0.4408593, -0.5972428, 1, 0.4862745, 0, 1,
-1.285683, 1.050308, -1.348013, 1, 0.4901961, 0, 1,
-1.276132, 0.03751436, -1.926713, 1, 0.4980392, 0, 1,
-1.274965, 0.41687, -1.704247, 1, 0.5058824, 0, 1,
-1.273066, 0.2063311, -3.369437, 1, 0.509804, 0, 1,
-1.266755, 0.4658687, 0.1670322, 1, 0.5176471, 0, 1,
-1.23276, 0.9846376, -1.4922, 1, 0.5215687, 0, 1,
-1.226054, 0.8444823, -0.493143, 1, 0.5294118, 0, 1,
-1.221733, 0.1141474, -1.658981, 1, 0.5333334, 0, 1,
-1.216776, 0.7041007, 0.001295031, 1, 0.5411765, 0, 1,
-1.211455, -0.05221202, -2.093645, 1, 0.5450981, 0, 1,
-1.206936, -0.5380718, -1.078823, 1, 0.5529412, 0, 1,
-1.2058, -0.1173358, -1.223775, 1, 0.5568628, 0, 1,
-1.20544, 0.367183, -1.681399, 1, 0.5647059, 0, 1,
-1.198633, 0.08270965, -0.9071704, 1, 0.5686275, 0, 1,
-1.197918, 0.2701512, -1.686908, 1, 0.5764706, 0, 1,
-1.194726, 0.815908, -2.780858, 1, 0.5803922, 0, 1,
-1.194258, 1.532829, -0.6595108, 1, 0.5882353, 0, 1,
-1.179025, -0.1586907, -2.014545, 1, 0.5921569, 0, 1,
-1.173251, 0.3086971, -1.589571, 1, 0.6, 0, 1,
-1.162514, 0.268153, -3.13732, 1, 0.6078432, 0, 1,
-1.151023, 0.06349336, -1.137998, 1, 0.6117647, 0, 1,
-1.150791, -2.473493, -1.749672, 1, 0.6196079, 0, 1,
-1.149866, -0.4994477, -2.093544, 1, 0.6235294, 0, 1,
-1.148732, -0.6170819, -2.058591, 1, 0.6313726, 0, 1,
-1.146539, -1.11242, -1.279192, 1, 0.6352941, 0, 1,
-1.143551, -0.3482147, -3.012716, 1, 0.6431373, 0, 1,
-1.14311, 0.09840269, -0.1036003, 1, 0.6470588, 0, 1,
-1.131618, -0.234233, -2.016214, 1, 0.654902, 0, 1,
-1.130131, -0.2807057, -1.534332, 1, 0.6588235, 0, 1,
-1.121231, 0.1079073, -1.013866, 1, 0.6666667, 0, 1,
-1.1162, -0.469594, -2.242792, 1, 0.6705883, 0, 1,
-1.112479, 0.6218239, -0.8926085, 1, 0.6784314, 0, 1,
-1.110715, -0.8966736, -3.410235, 1, 0.682353, 0, 1,
-1.108199, 1.257929, -0.8297059, 1, 0.6901961, 0, 1,
-1.10797, 0.1755333, -1.106686, 1, 0.6941177, 0, 1,
-1.104271, -0.3503868, -0.7115354, 1, 0.7019608, 0, 1,
-1.10403, -1.113004, -2.85876, 1, 0.7098039, 0, 1,
-1.103118, -1.48849, -3.335564, 1, 0.7137255, 0, 1,
-1.099826, -1.3346, -2.696644, 1, 0.7215686, 0, 1,
-1.097411, -0.1828309, -1.68498, 1, 0.7254902, 0, 1,
-1.092126, -0.8424119, -2.572169, 1, 0.7333333, 0, 1,
-1.089869, 1.016776, -0.999646, 1, 0.7372549, 0, 1,
-1.088124, -1.541261, -2.104416, 1, 0.7450981, 0, 1,
-1.087516, 0.5452684, -1.191079, 1, 0.7490196, 0, 1,
-1.087079, -0.07879335, -3.920846, 1, 0.7568628, 0, 1,
-1.084582, 1.478904, 0.4472723, 1, 0.7607843, 0, 1,
-1.076619, 0.5038255, -0.2854598, 1, 0.7686275, 0, 1,
-1.065525, 0.02036077, -2.121008, 1, 0.772549, 0, 1,
-1.058427, 0.1953878, -1.480373, 1, 0.7803922, 0, 1,
-1.056849, 0.6371927, -1.216592, 1, 0.7843137, 0, 1,
-1.054964, 0.2895239, -1.594098, 1, 0.7921569, 0, 1,
-1.044785, -0.5193278, -2.652944, 1, 0.7960784, 0, 1,
-1.039584, -0.2151905, -1.879088, 1, 0.8039216, 0, 1,
-1.036183, -2.597301, -4.364437, 1, 0.8117647, 0, 1,
-1.030702, 1.198981, -0.767644, 1, 0.8156863, 0, 1,
-1.015512, -0.2810181, -1.470555, 1, 0.8235294, 0, 1,
-1.00781, 0.6221582, -1.363556, 1, 0.827451, 0, 1,
-1.007344, 1.058026, -1.154867, 1, 0.8352941, 0, 1,
-1.006542, -1.022093, -1.929497, 1, 0.8392157, 0, 1,
-1.001246, 1.367502, -0.5241063, 1, 0.8470588, 0, 1,
-0.9947714, 0.2970045, -1.262817, 1, 0.8509804, 0, 1,
-0.9892149, 0.1714122, -0.8054441, 1, 0.8588235, 0, 1,
-0.9839583, -0.5380095, -1.707092, 1, 0.8627451, 0, 1,
-0.9790323, 0.8547958, -1.133097, 1, 0.8705882, 0, 1,
-0.9789702, -0.6337508, -2.625489, 1, 0.8745098, 0, 1,
-0.9739478, 0.516829, 0.06104166, 1, 0.8823529, 0, 1,
-0.9626851, -0.5052999, -2.021163, 1, 0.8862745, 0, 1,
-0.9590937, 0.3878526, -1.795428, 1, 0.8941177, 0, 1,
-0.9575927, -1.35187, -2.207341, 1, 0.8980392, 0, 1,
-0.9541905, -0.08271286, -0.8091311, 1, 0.9058824, 0, 1,
-0.9503735, -2.056221, -2.328369, 1, 0.9137255, 0, 1,
-0.9472728, -0.2610518, -1.184945, 1, 0.9176471, 0, 1,
-0.945939, 2.15283, -1.59993, 1, 0.9254902, 0, 1,
-0.9358293, -0.2793603, -1.549344, 1, 0.9294118, 0, 1,
-0.9325588, 1.322679, -1.494312, 1, 0.9372549, 0, 1,
-0.9256454, -0.3537234, -2.881823, 1, 0.9411765, 0, 1,
-0.9234971, -1.083987, -1.603828, 1, 0.9490196, 0, 1,
-0.9228778, 1.085217, -1.168257, 1, 0.9529412, 0, 1,
-0.9224373, -0.1445888, -1.673269, 1, 0.9607843, 0, 1,
-0.9219519, 0.249794, -1.054188, 1, 0.9647059, 0, 1,
-0.9209551, -0.7353178, -2.709676, 1, 0.972549, 0, 1,
-0.9142677, 0.6512871, -2.514036, 1, 0.9764706, 0, 1,
-0.9106084, -0.07287133, -1.691029, 1, 0.9843137, 0, 1,
-0.9077673, 0.1366846, 0.1017717, 1, 0.9882353, 0, 1,
-0.9075078, -0.8871677, -1.442282, 1, 0.9960784, 0, 1,
-0.9050781, -0.3157352, -0.4793976, 0.9960784, 1, 0, 1,
-0.8999724, -0.1814837, -3.033341, 0.9921569, 1, 0, 1,
-0.898926, 0.1731948, -1.514846, 0.9843137, 1, 0, 1,
-0.8966374, -0.6572485, -1.944301, 0.9803922, 1, 0, 1,
-0.8932675, -1.579112, -4.049413, 0.972549, 1, 0, 1,
-0.8921041, 0.2563893, -1.611647, 0.9686275, 1, 0, 1,
-0.8914958, 0.2670264, -1.795339, 0.9607843, 1, 0, 1,
-0.8902801, -0.7965854, -2.421735, 0.9568627, 1, 0, 1,
-0.8814613, 1.098772, -1.669332, 0.9490196, 1, 0, 1,
-0.8809765, -0.09540325, -3.773955, 0.945098, 1, 0, 1,
-0.8791474, -0.4091704, -3.210194, 0.9372549, 1, 0, 1,
-0.8783523, 0.1600698, -1.270469, 0.9333333, 1, 0, 1,
-0.8749061, -0.8883367, -4.24102, 0.9254902, 1, 0, 1,
-0.8700752, -0.2100241, -2.866196, 0.9215686, 1, 0, 1,
-0.8674786, 0.0101581, -2.777713, 0.9137255, 1, 0, 1,
-0.8640931, -0.6796401, -2.395489, 0.9098039, 1, 0, 1,
-0.8544628, -0.8220398, -1.006216, 0.9019608, 1, 0, 1,
-0.8479634, -1.289202, -4.326405, 0.8941177, 1, 0, 1,
-0.8472624, -0.5062028, -1.16526, 0.8901961, 1, 0, 1,
-0.8440709, 0.2063572, -0.7024785, 0.8823529, 1, 0, 1,
-0.837263, 1.179558, -2.364467, 0.8784314, 1, 0, 1,
-0.8368445, -0.0007006635, -0.6324287, 0.8705882, 1, 0, 1,
-0.8362585, -1.114996, -4.343962, 0.8666667, 1, 0, 1,
-0.8347183, -0.3288612, -0.9652981, 0.8588235, 1, 0, 1,
-0.831619, 0.6601757, -0.08864456, 0.854902, 1, 0, 1,
-0.8255201, -0.1029624, -1.189978, 0.8470588, 1, 0, 1,
-0.8235524, -0.4153417, -0.5150095, 0.8431373, 1, 0, 1,
-0.8202209, 1.363866, -1.568505, 0.8352941, 1, 0, 1,
-0.8182487, -0.3349698, -4.04627, 0.8313726, 1, 0, 1,
-0.8142817, 0.7029558, 0.2748469, 0.8235294, 1, 0, 1,
-0.8101982, -1.214307, -2.324073, 0.8196079, 1, 0, 1,
-0.8085937, 0.7664, -0.9985145, 0.8117647, 1, 0, 1,
-0.8063904, 2.061942, -0.4666988, 0.8078431, 1, 0, 1,
-0.8063651, -0.8886175, -3.332372, 0.8, 1, 0, 1,
-0.8026675, -1.075112, -2.176098, 0.7921569, 1, 0, 1,
-0.7888685, -0.8577035, -3.383268, 0.7882353, 1, 0, 1,
-0.7867225, 1.006393, -0.3853907, 0.7803922, 1, 0, 1,
-0.7856141, -1.485938, -3.657362, 0.7764706, 1, 0, 1,
-0.7855867, -0.3181556, -2.385425, 0.7686275, 1, 0, 1,
-0.7815385, -0.7526225, -1.909051, 0.7647059, 1, 0, 1,
-0.7810731, -0.8243449, -4.087804, 0.7568628, 1, 0, 1,
-0.780423, 1.368473, -0.4195504, 0.7529412, 1, 0, 1,
-0.7784352, -0.4421471, -2.055988, 0.7450981, 1, 0, 1,
-0.775812, -0.8508459, -2.771784, 0.7411765, 1, 0, 1,
-0.7699834, -1.425766, -3.252046, 0.7333333, 1, 0, 1,
-0.7691394, -0.8715534, -2.709443, 0.7294118, 1, 0, 1,
-0.7653099, -0.07988881, -1.43489, 0.7215686, 1, 0, 1,
-0.7608144, 0.7719784, -1.443414, 0.7176471, 1, 0, 1,
-0.760483, 0.9060546, -1.570263, 0.7098039, 1, 0, 1,
-0.7602655, -1.048033, -3.121437, 0.7058824, 1, 0, 1,
-0.7587517, 2.295497, 1.919811, 0.6980392, 1, 0, 1,
-0.7569361, 0.5039263, -0.9554299, 0.6901961, 1, 0, 1,
-0.753592, -0.1488705, -2.373406, 0.6862745, 1, 0, 1,
-0.7528917, 0.8546188, -0.2768125, 0.6784314, 1, 0, 1,
-0.7473967, -0.09569375, -2.256373, 0.6745098, 1, 0, 1,
-0.7382159, -0.7338501, -0.8981802, 0.6666667, 1, 0, 1,
-0.7353442, -0.2879229, -2.914937, 0.6627451, 1, 0, 1,
-0.726755, -1.789186, -3.649483, 0.654902, 1, 0, 1,
-0.7259619, -0.3416367, -2.867468, 0.6509804, 1, 0, 1,
-0.7226751, -1.127608, -3.630815, 0.6431373, 1, 0, 1,
-0.7208465, -1.374994, -2.992501, 0.6392157, 1, 0, 1,
-0.7163739, 0.2871438, -2.016716, 0.6313726, 1, 0, 1,
-0.7114577, -1.335688, -3.770708, 0.627451, 1, 0, 1,
-0.7021958, -0.6008335, -1.949079, 0.6196079, 1, 0, 1,
-0.697903, -0.4091015, -0.8590772, 0.6156863, 1, 0, 1,
-0.6954653, -0.1499901, 0.2622204, 0.6078432, 1, 0, 1,
-0.6926973, -0.8021123, -1.664573, 0.6039216, 1, 0, 1,
-0.690606, -0.2994882, -2.529736, 0.5960785, 1, 0, 1,
-0.6880465, 0.9779179, -0.4940708, 0.5882353, 1, 0, 1,
-0.6847708, 1.40323, 0.5664712, 0.5843138, 1, 0, 1,
-0.6814512, -0.4376297, -2.34195, 0.5764706, 1, 0, 1,
-0.6722158, -0.8217299, -3.795553, 0.572549, 1, 0, 1,
-0.6696078, -0.04401917, -3.774683, 0.5647059, 1, 0, 1,
-0.6687525, 0.3259873, 0.5827193, 0.5607843, 1, 0, 1,
-0.6660036, 0.5911744, -0.42083, 0.5529412, 1, 0, 1,
-0.6654065, 0.6802184, -0.05786454, 0.5490196, 1, 0, 1,
-0.6635014, -1.27783, -2.079066, 0.5411765, 1, 0, 1,
-0.6616557, 0.004515535, -1.593652, 0.5372549, 1, 0, 1,
-0.6597849, -0.6966664, -3.537958, 0.5294118, 1, 0, 1,
-0.6511089, 1.74939, 0.09206336, 0.5254902, 1, 0, 1,
-0.6477084, 0.160383, -1.950164, 0.5176471, 1, 0, 1,
-0.6460334, 0.3681081, -0.6077819, 0.5137255, 1, 0, 1,
-0.6446065, 2.000343, 0.3945482, 0.5058824, 1, 0, 1,
-0.6435173, -0.8080146, -2.579808, 0.5019608, 1, 0, 1,
-0.6391369, 2.103605, -0.3122168, 0.4941176, 1, 0, 1,
-0.6387662, 0.2403117, -2.915735, 0.4862745, 1, 0, 1,
-0.6363785, -0.1709653, -1.193212, 0.4823529, 1, 0, 1,
-0.6363201, 0.8593808, 0.6007316, 0.4745098, 1, 0, 1,
-0.6287816, 0.199574, -1.653873, 0.4705882, 1, 0, 1,
-0.6246522, 0.994714, 0.1996802, 0.4627451, 1, 0, 1,
-0.6182404, 0.01065444, -3.088465, 0.4588235, 1, 0, 1,
-0.6173674, 1.450664, 0.02282728, 0.4509804, 1, 0, 1,
-0.6133485, 0.8138416, -1.815193, 0.4470588, 1, 0, 1,
-0.6133124, -1.134512, -2.545872, 0.4392157, 1, 0, 1,
-0.6132492, -0.2636876, -2.729555, 0.4352941, 1, 0, 1,
-0.6125915, -0.2957274, -1.100474, 0.427451, 1, 0, 1,
-0.6080201, -0.004116047, -0.6365725, 0.4235294, 1, 0, 1,
-0.605786, 1.277122, -1.472733, 0.4156863, 1, 0, 1,
-0.6055594, 1.027497, 0.2042906, 0.4117647, 1, 0, 1,
-0.6002626, 0.6938637, 0.01790853, 0.4039216, 1, 0, 1,
-0.5979908, 0.8583916, -1.081582, 0.3960784, 1, 0, 1,
-0.5979336, -0.8473756, -2.192852, 0.3921569, 1, 0, 1,
-0.5967802, -0.962863, -3.015268, 0.3843137, 1, 0, 1,
-0.5913123, -2.159012, -3.352755, 0.3803922, 1, 0, 1,
-0.5907806, -0.5509018, -2.5648, 0.372549, 1, 0, 1,
-0.5871811, -0.490323, -3.16688, 0.3686275, 1, 0, 1,
-0.5827886, -0.673958, -2.432104, 0.3607843, 1, 0, 1,
-0.581907, 0.06586932, -2.617604, 0.3568628, 1, 0, 1,
-0.5807201, 0.2086029, -1.797285, 0.3490196, 1, 0, 1,
-0.5726777, -0.4378486, -1.373919, 0.345098, 1, 0, 1,
-0.5721592, 0.3107166, -0.1520151, 0.3372549, 1, 0, 1,
-0.5614587, -1.687308, -3.65831, 0.3333333, 1, 0, 1,
-0.5599156, 0.05219145, -1.576759, 0.3254902, 1, 0, 1,
-0.5578045, -0.4665996, -3.171805, 0.3215686, 1, 0, 1,
-0.5563434, -2.31341, -3.663012, 0.3137255, 1, 0, 1,
-0.5518732, -0.1272149, -1.837822, 0.3098039, 1, 0, 1,
-0.540991, -0.7093031, -2.69722, 0.3019608, 1, 0, 1,
-0.5383757, 0.7931956, 0.7094573, 0.2941177, 1, 0, 1,
-0.5350239, -1.740763, -3.425137, 0.2901961, 1, 0, 1,
-0.5306356, 0.3099148, -0.8533118, 0.282353, 1, 0, 1,
-0.5270966, -1.365557, -2.627894, 0.2784314, 1, 0, 1,
-0.5266677, 0.3016416, -1.059195, 0.2705882, 1, 0, 1,
-0.5260553, 0.2630156, -2.538479, 0.2666667, 1, 0, 1,
-0.524695, -1.245915, -4.758725, 0.2588235, 1, 0, 1,
-0.5208854, -3.129748, -3.798341, 0.254902, 1, 0, 1,
-0.5153871, -1.033713, -2.042657, 0.2470588, 1, 0, 1,
-0.5112257, -1.336228, -0.3163922, 0.2431373, 1, 0, 1,
-0.5105532, -0.8896549, -1.03204, 0.2352941, 1, 0, 1,
-0.4991028, -1.68706, -2.464766, 0.2313726, 1, 0, 1,
-0.4981547, 0.2018915, 1.003811, 0.2235294, 1, 0, 1,
-0.4931343, 0.5253364, -0.7923751, 0.2196078, 1, 0, 1,
-0.4886934, -1.707571, -2.255051, 0.2117647, 1, 0, 1,
-0.4879789, -0.6645681, -2.927157, 0.2078431, 1, 0, 1,
-0.4871851, -0.9767734, -3.817002, 0.2, 1, 0, 1,
-0.4788988, 0.2499304, -1.150694, 0.1921569, 1, 0, 1,
-0.475267, -0.3311716, -2.307149, 0.1882353, 1, 0, 1,
-0.4745893, 0.9924238, -1.187902, 0.1803922, 1, 0, 1,
-0.473381, -0.2480952, -1.543505, 0.1764706, 1, 0, 1,
-0.4651499, -0.1808245, -1.362262, 0.1686275, 1, 0, 1,
-0.463066, -1.618476, -0.6206219, 0.1647059, 1, 0, 1,
-0.460476, -1.006826, -2.474454, 0.1568628, 1, 0, 1,
-0.456002, 1.116375, 0.79597, 0.1529412, 1, 0, 1,
-0.4526424, -0.5505394, -4.214876, 0.145098, 1, 0, 1,
-0.4499543, 1.921205, -1.542846, 0.1411765, 1, 0, 1,
-0.4435708, -0.01430808, -2.618235, 0.1333333, 1, 0, 1,
-0.4393194, -1.030476, -4.630595, 0.1294118, 1, 0, 1,
-0.4372833, 0.8648032, -0.675535, 0.1215686, 1, 0, 1,
-0.4366074, 0.5581393, -0.8769237, 0.1176471, 1, 0, 1,
-0.4330502, -0.4450714, -1.923587, 0.1098039, 1, 0, 1,
-0.4314968, -0.2471615, -1.389619, 0.1058824, 1, 0, 1,
-0.424927, 0.3115419, -2.553194, 0.09803922, 1, 0, 1,
-0.4205715, 1.526932, 0.5198848, 0.09019608, 1, 0, 1,
-0.4181776, -1.137876, -1.443231, 0.08627451, 1, 0, 1,
-0.4178662, 0.0923425, -2.149415, 0.07843138, 1, 0, 1,
-0.4172503, -1.790652, -2.365214, 0.07450981, 1, 0, 1,
-0.4153325, -1.810546, -4.545555, 0.06666667, 1, 0, 1,
-0.4146737, 0.01452371, -1.335764, 0.0627451, 1, 0, 1,
-0.4095722, 0.09359723, -0.6090242, 0.05490196, 1, 0, 1,
-0.4090909, -0.1058237, -2.85265, 0.05098039, 1, 0, 1,
-0.4088799, 1.503047, 1.001268, 0.04313726, 1, 0, 1,
-0.4034832, 0.05335671, -0.1923619, 0.03921569, 1, 0, 1,
-0.4007499, 1.32338, 0.360011, 0.03137255, 1, 0, 1,
-0.4005538, -0.9719556, -2.229205, 0.02745098, 1, 0, 1,
-0.3963184, 0.6699521, 0.6606639, 0.01960784, 1, 0, 1,
-0.3919317, -1.007228, -2.963627, 0.01568628, 1, 0, 1,
-0.3912308, -1.138767, -2.300802, 0.007843138, 1, 0, 1,
-0.3909385, -0.07498375, -2.170305, 0.003921569, 1, 0, 1,
-0.3862601, 0.1321315, -0.2517845, 0, 1, 0.003921569, 1,
-0.3806746, -0.02755598, -1.074497, 0, 1, 0.01176471, 1,
-0.3802971, 1.143476, 0.2212564, 0, 1, 0.01568628, 1,
-0.3798802, 2.051049, 0.3124937, 0, 1, 0.02352941, 1,
-0.3797649, 0.444184, -0.6351237, 0, 1, 0.02745098, 1,
-0.378613, 0.7506254, -0.8164017, 0, 1, 0.03529412, 1,
-0.3722198, 0.2334282, -0.3850407, 0, 1, 0.03921569, 1,
-0.3711122, -0.7266622, -4.1026, 0, 1, 0.04705882, 1,
-0.3698498, 1.169187, -0.215004, 0, 1, 0.05098039, 1,
-0.3689103, 0.2876735, -1.179857, 0, 1, 0.05882353, 1,
-0.368315, -1.251428, -2.731709, 0, 1, 0.0627451, 1,
-0.3679923, -0.3567961, -2.363093, 0, 1, 0.07058824, 1,
-0.3674265, 0.9283426, 0.0903959, 0, 1, 0.07450981, 1,
-0.3658573, -1.372671, -4.571055, 0, 1, 0.08235294, 1,
-0.3624459, -1.968148, -1.249319, 0, 1, 0.08627451, 1,
-0.3575971, -0.883388, -2.723876, 0, 1, 0.09411765, 1,
-0.3531964, 0.2955225, 0.7031658, 0, 1, 0.1019608, 1,
-0.3502838, 0.1595138, -0.914861, 0, 1, 0.1058824, 1,
-0.3493166, 0.4159331, -0.05759218, 0, 1, 0.1137255, 1,
-0.3471643, -2.115467, -1.884545, 0, 1, 0.1176471, 1,
-0.346743, 0.1105056, -0.3008409, 0, 1, 0.1254902, 1,
-0.3438508, -0.644981, -3.013083, 0, 1, 0.1294118, 1,
-0.3396314, 0.3376181, 0.4574525, 0, 1, 0.1372549, 1,
-0.3371397, 0.9496405, -2.006478, 0, 1, 0.1411765, 1,
-0.3362811, 0.6682148, -1.991624, 0, 1, 0.1490196, 1,
-0.3342984, -1.542895, -3.978318, 0, 1, 0.1529412, 1,
-0.3337548, -0.1619798, -1.97048, 0, 1, 0.1607843, 1,
-0.3318954, -0.06900406, 0.02920978, 0, 1, 0.1647059, 1,
-0.3294052, -0.1948322, -1.662294, 0, 1, 0.172549, 1,
-0.3290743, 0.3027598, -0.002718301, 0, 1, 0.1764706, 1,
-0.3247089, -0.12359, -0.06090708, 0, 1, 0.1843137, 1,
-0.3220539, 0.3791423, -1.576941, 0, 1, 0.1882353, 1,
-0.3216582, -0.3115464, -3.909918, 0, 1, 0.1960784, 1,
-0.3209987, -0.5225936, -3.34984, 0, 1, 0.2039216, 1,
-0.3201133, -0.3895141, -2.077396, 0, 1, 0.2078431, 1,
-0.3199558, 0.3729643, -0.2922427, 0, 1, 0.2156863, 1,
-0.3197704, 0.6580435, -2.32419, 0, 1, 0.2196078, 1,
-0.3136023, -0.5967968, -2.660914, 0, 1, 0.227451, 1,
-0.3133954, -1.290717, -1.696111, 0, 1, 0.2313726, 1,
-0.3051224, -0.2975763, -1.023081, 0, 1, 0.2392157, 1,
-0.3014495, 1.009617, 0.9087729, 0, 1, 0.2431373, 1,
-0.2999096, -0.4014269, -2.560933, 0, 1, 0.2509804, 1,
-0.2997597, -0.5600149, -3.258904, 0, 1, 0.254902, 1,
-0.2900817, -0.6359367, -3.255297, 0, 1, 0.2627451, 1,
-0.2830883, -0.6350724, -1.906428, 0, 1, 0.2666667, 1,
-0.2826951, -1.371771, -3.724445, 0, 1, 0.2745098, 1,
-0.2772312, -1.664302, -3.33673, 0, 1, 0.2784314, 1,
-0.2768191, 0.6026616, -0.02125462, 0, 1, 0.2862745, 1,
-0.2744487, -0.1778863, -1.064539, 0, 1, 0.2901961, 1,
-0.2737797, 0.9395414, 1.42817, 0, 1, 0.2980392, 1,
-0.2687449, 2.707956, -1.232365, 0, 1, 0.3058824, 1,
-0.2669744, 1.06462, -0.3138976, 0, 1, 0.3098039, 1,
-0.2663636, -1.062758, -3.119605, 0, 1, 0.3176471, 1,
-0.264237, -0.1475889, -3.583899, 0, 1, 0.3215686, 1,
-0.2639749, -1.225287, -5.62716, 0, 1, 0.3294118, 1,
-0.2584523, -0.003631223, -2.838285, 0, 1, 0.3333333, 1,
-0.2577517, -2.089413, -4.173413, 0, 1, 0.3411765, 1,
-0.2565854, -0.09858935, -3.165782, 0, 1, 0.345098, 1,
-0.2530689, -0.6505762, -1.638162, 0, 1, 0.3529412, 1,
-0.2523313, 0.2213805, -2.867763, 0, 1, 0.3568628, 1,
-0.2519678, -0.3187248, -3.702599, 0, 1, 0.3647059, 1,
-0.2484314, 1.18336, 0.7003494, 0, 1, 0.3686275, 1,
-0.2392088, -0.4346089, -4.779747, 0, 1, 0.3764706, 1,
-0.2378895, 0.4055711, -0.7679031, 0, 1, 0.3803922, 1,
-0.2315925, 0.257377, 0.2033874, 0, 1, 0.3882353, 1,
-0.2280369, 0.7091229, 0.3064187, 0, 1, 0.3921569, 1,
-0.2252012, 1.447543, -0.6497604, 0, 1, 0.4, 1,
-0.2250386, -0.3674983, -2.71559, 0, 1, 0.4078431, 1,
-0.2149437, -0.4896539, -2.334785, 0, 1, 0.4117647, 1,
-0.2047802, -0.1045882, -1.36872, 0, 1, 0.4196078, 1,
-0.2045509, 1.815489, 1.38025, 0, 1, 0.4235294, 1,
-0.2013233, -0.08615415, -0.6411408, 0, 1, 0.4313726, 1,
-0.1988819, 0.0819708, -1.795092, 0, 1, 0.4352941, 1,
-0.1935579, -1.103196, -2.034961, 0, 1, 0.4431373, 1,
-0.189506, 1.985475, -0.6857102, 0, 1, 0.4470588, 1,
-0.180046, 0.8446512, -1.470477, 0, 1, 0.454902, 1,
-0.1726179, -0.4022767, -2.562297, 0, 1, 0.4588235, 1,
-0.1724116, 0.08553021, -2.279488, 0, 1, 0.4666667, 1,
-0.1698368, 1.291083, -0.1161661, 0, 1, 0.4705882, 1,
-0.1656166, 1.300931, -1.865482, 0, 1, 0.4784314, 1,
-0.1634373, -0.9044239, -4.05115, 0, 1, 0.4823529, 1,
-0.1631761, 0.3665562, 0.2996334, 0, 1, 0.4901961, 1,
-0.1601446, 1.590606, -0.7317203, 0, 1, 0.4941176, 1,
-0.1540839, -0.005722809, -0.8786736, 0, 1, 0.5019608, 1,
-0.1532835, -0.5080159, -3.197967, 0, 1, 0.509804, 1,
-0.148028, -0.4604459, -4.529411, 0, 1, 0.5137255, 1,
-0.1462877, -1.057872, -4.645998, 0, 1, 0.5215687, 1,
-0.1437477, 0.7947903, 1.315449, 0, 1, 0.5254902, 1,
-0.1340753, 1.686633, -1.288401, 0, 1, 0.5333334, 1,
-0.1339773, -1.226504, -3.701415, 0, 1, 0.5372549, 1,
-0.1336403, 0.2756386, -1.53342, 0, 1, 0.5450981, 1,
-0.1318262, 2.046588, -0.544117, 0, 1, 0.5490196, 1,
-0.1257896, 0.9526901, 0.6525721, 0, 1, 0.5568628, 1,
-0.1206419, -0.6360468, -2.910225, 0, 1, 0.5607843, 1,
-0.1205294, 1.450021, -2.933236, 0, 1, 0.5686275, 1,
-0.1205083, 1.904683, 0.9704043, 0, 1, 0.572549, 1,
-0.1190682, 0.1977348, 0.2763611, 0, 1, 0.5803922, 1,
-0.1185296, -0.1908599, -1.35166, 0, 1, 0.5843138, 1,
-0.1179091, -1.345746, -3.301912, 0, 1, 0.5921569, 1,
-0.1173453, -1.944124, -3.856373, 0, 1, 0.5960785, 1,
-0.1097304, 1.646865, -1.680733, 0, 1, 0.6039216, 1,
-0.1087399, -1.501446, -3.104198, 0, 1, 0.6117647, 1,
-0.10623, 0.4656033, 0.7780476, 0, 1, 0.6156863, 1,
-0.1039722, -0.01944669, 0.2755023, 0, 1, 0.6235294, 1,
-0.1031737, -1.806917, -4.032685, 0, 1, 0.627451, 1,
-0.1012973, 0.04749196, -1.622993, 0, 1, 0.6352941, 1,
-0.09898508, -1.069671, -3.815434, 0, 1, 0.6392157, 1,
-0.09838521, 0.2902131, 0.2845707, 0, 1, 0.6470588, 1,
-0.09776045, -0.2164532, -3.192795, 0, 1, 0.6509804, 1,
-0.09500062, 0.220889, -0.4654093, 0, 1, 0.6588235, 1,
-0.09497751, 1.541932, -0.9821995, 0, 1, 0.6627451, 1,
-0.08280975, 0.618544, 0.8621935, 0, 1, 0.6705883, 1,
-0.07434352, 0.391044, -0.1538047, 0, 1, 0.6745098, 1,
-0.073847, -2.022025, -2.750698, 0, 1, 0.682353, 1,
-0.07375507, 0.01677387, -1.983719, 0, 1, 0.6862745, 1,
-0.0714964, -0.2767608, -3.108682, 0, 1, 0.6941177, 1,
-0.06856243, 1.012226, -1.543614, 0, 1, 0.7019608, 1,
-0.06635603, 1.225052, 1.174644, 0, 1, 0.7058824, 1,
-0.06066983, 0.3510039, -3.132058, 0, 1, 0.7137255, 1,
-0.06009382, 1.61421, 0.03890313, 0, 1, 0.7176471, 1,
-0.05714094, 0.1759411, -0.1101902, 0, 1, 0.7254902, 1,
-0.05106409, -0.02402447, -2.392153, 0, 1, 0.7294118, 1,
-0.04959926, 0.9051202, -1.337561, 0, 1, 0.7372549, 1,
-0.04827562, -0.2850687, -1.721075, 0, 1, 0.7411765, 1,
-0.04377879, 0.2848046, 0.06864537, 0, 1, 0.7490196, 1,
-0.04296176, 1.230961, -0.7252578, 0, 1, 0.7529412, 1,
-0.0383245, 0.5312741, 0.6870655, 0, 1, 0.7607843, 1,
-0.03807964, -0.1973859, -3.337944, 0, 1, 0.7647059, 1,
-0.03751828, -0.8526254, -2.626042, 0, 1, 0.772549, 1,
-0.03655761, -0.8853714, -4.164445, 0, 1, 0.7764706, 1,
-0.03513918, -0.7050117, -2.720542, 0, 1, 0.7843137, 1,
-0.03418904, -0.2379905, -1.366811, 0, 1, 0.7882353, 1,
-0.02931753, -1.015857, -1.658998, 0, 1, 0.7960784, 1,
-0.02894532, -0.5496691, -3.606859, 0, 1, 0.8039216, 1,
-0.02442341, 2.646748, -0.1212006, 0, 1, 0.8078431, 1,
-0.02401486, 0.9847835, 1.9804, 0, 1, 0.8156863, 1,
-0.02239504, 1.341937, -0.1929498, 0, 1, 0.8196079, 1,
-0.01577272, 0.07660857, -0.9781167, 0, 1, 0.827451, 1,
-0.01463519, 0.9030457, -1.211447, 0, 1, 0.8313726, 1,
-0.01179417, -0.3261367, -5.629104, 0, 1, 0.8392157, 1,
-0.008010542, -0.8196574, -3.792237, 0, 1, 0.8431373, 1,
-0.006145967, -0.715773, -2.771148, 0, 1, 0.8509804, 1,
-0.005283175, 1.049819, -0.005529822, 0, 1, 0.854902, 1,
-0.005037654, -1.096804, -3.999989, 0, 1, 0.8627451, 1,
0.001964512, -0.08015086, 3.538107, 0, 1, 0.8666667, 1,
0.01113908, -1.071898, 3.168299, 0, 1, 0.8745098, 1,
0.01291975, -0.763597, 4.929848, 0, 1, 0.8784314, 1,
0.01651276, -0.1620869, 2.446785, 0, 1, 0.8862745, 1,
0.01662298, -0.3961715, 2.825037, 0, 1, 0.8901961, 1,
0.01939211, 0.9545649, -0.2725785, 0, 1, 0.8980392, 1,
0.01967897, -0.05511509, 3.339381, 0, 1, 0.9058824, 1,
0.01992352, -0.9409548, 3.245778, 0, 1, 0.9098039, 1,
0.02133757, 0.7451167, -0.2970637, 0, 1, 0.9176471, 1,
0.02174273, -0.4171094, 1.445658, 0, 1, 0.9215686, 1,
0.0226744, -1.421848, 4.126405, 0, 1, 0.9294118, 1,
0.0322708, -1.305248, 4.597926, 0, 1, 0.9333333, 1,
0.03233017, -0.6525207, 2.445501, 0, 1, 0.9411765, 1,
0.03493781, -0.5199792, 4.265885, 0, 1, 0.945098, 1,
0.04246244, 2.473416, -1.457355, 0, 1, 0.9529412, 1,
0.04701917, 1.69222, 0.4108072, 0, 1, 0.9568627, 1,
0.04848983, -2.357072, 2.260459, 0, 1, 0.9647059, 1,
0.0493895, 0.4432658, 0.7943428, 0, 1, 0.9686275, 1,
0.05106219, 1.018556, -0.2477527, 0, 1, 0.9764706, 1,
0.05951104, 0.06599718, 0.02056395, 0, 1, 0.9803922, 1,
0.06029252, -0.6610506, 2.306293, 0, 1, 0.9882353, 1,
0.0602989, 0.3902563, 0.2730015, 0, 1, 0.9921569, 1,
0.06101646, 0.8738059, 0.7106081, 0, 1, 1, 1,
0.06409567, -0.5806728, 3.333816, 0, 0.9921569, 1, 1,
0.0642739, 1.679312, 0.8976849, 0, 0.9882353, 1, 1,
0.06724989, -0.9885982, 2.306443, 0, 0.9803922, 1, 1,
0.06782441, -1.503932, 3.443638, 0, 0.9764706, 1, 1,
0.06859592, -0.7347996, 3.965114, 0, 0.9686275, 1, 1,
0.06924793, 0.03284737, 0.8428609, 0, 0.9647059, 1, 1,
0.07595976, 2.003074, -0.6540365, 0, 0.9568627, 1, 1,
0.07783473, 0.4170992, 0.8560615, 0, 0.9529412, 1, 1,
0.08057809, 0.91474, 0.8968765, 0, 0.945098, 1, 1,
0.08173352, -0.0147386, 4.711319, 0, 0.9411765, 1, 1,
0.09204557, 0.2199862, -0.5346457, 0, 0.9333333, 1, 1,
0.09251527, 1.166472, -1.060763, 0, 0.9294118, 1, 1,
0.09272682, -1.842014, 1.702126, 0, 0.9215686, 1, 1,
0.09685513, -0.17446, 3.047191, 0, 0.9176471, 1, 1,
0.09781966, 0.5108955, 0.391017, 0, 0.9098039, 1, 1,
0.0996415, 0.1115222, 0.7105457, 0, 0.9058824, 1, 1,
0.1017946, -0.9643248, 3.824142, 0, 0.8980392, 1, 1,
0.1029024, -0.6414374, 2.44176, 0, 0.8901961, 1, 1,
0.108365, 1.62282, -0.1427314, 0, 0.8862745, 1, 1,
0.1118243, 1.385429, -0.6811813, 0, 0.8784314, 1, 1,
0.1139628, -0.3156184, 2.005551, 0, 0.8745098, 1, 1,
0.1157515, 0.02366559, 1.937765, 0, 0.8666667, 1, 1,
0.1188438, 0.6457989, -1.074476, 0, 0.8627451, 1, 1,
0.1227274, -1.488374, 3.276822, 0, 0.854902, 1, 1,
0.1229681, 0.7018086, 0.3939762, 0, 0.8509804, 1, 1,
0.1236413, -0.5586962, 2.719899, 0, 0.8431373, 1, 1,
0.1243333, 0.7477462, -0.2907389, 0, 0.8392157, 1, 1,
0.1274065, 0.5313031, 0.3079151, 0, 0.8313726, 1, 1,
0.1306372, 1.279036, -0.9574545, 0, 0.827451, 1, 1,
0.1308863, -0.3708216, 2.730803, 0, 0.8196079, 1, 1,
0.1332461, 0.7460731, -0.4854252, 0, 0.8156863, 1, 1,
0.1358746, -1.372479, 2.576381, 0, 0.8078431, 1, 1,
0.1379783, 0.9958323, 0.8102628, 0, 0.8039216, 1, 1,
0.1385996, 1.139507, -0.8631032, 0, 0.7960784, 1, 1,
0.1392832, -1.002957, 4.687471, 0, 0.7882353, 1, 1,
0.1412787, 2.08459, 0.3865672, 0, 0.7843137, 1, 1,
0.1418863, 0.245943, 1.499714, 0, 0.7764706, 1, 1,
0.145161, 0.7411696, 0.7269183, 0, 0.772549, 1, 1,
0.1466101, 0.1063366, 0.8252452, 0, 0.7647059, 1, 1,
0.1546159, -1.358856, 3.070954, 0, 0.7607843, 1, 1,
0.1575829, 0.1384921, 0.1381786, 0, 0.7529412, 1, 1,
0.1583528, -0.05929875, 3.022, 0, 0.7490196, 1, 1,
0.1595091, -0.5664041, 2.921741, 0, 0.7411765, 1, 1,
0.160595, 0.6487834, -0.07959619, 0, 0.7372549, 1, 1,
0.1609042, -1.478156, 4.05123, 0, 0.7294118, 1, 1,
0.1652482, -0.08844987, 2.447901, 0, 0.7254902, 1, 1,
0.1682596, 0.3718074, 0.1494428, 0, 0.7176471, 1, 1,
0.1749261, -0.6728132, 3.736012, 0, 0.7137255, 1, 1,
0.1750998, 1.653082, -0.8998541, 0, 0.7058824, 1, 1,
0.1804243, -0.8144315, 3.68118, 0, 0.6980392, 1, 1,
0.1804906, -1.322643, 2.522882, 0, 0.6941177, 1, 1,
0.1814144, -0.6265654, 3.006777, 0, 0.6862745, 1, 1,
0.1835913, -0.6133811, 2.771571, 0, 0.682353, 1, 1,
0.1840623, -0.4776412, 2.992664, 0, 0.6745098, 1, 1,
0.1883972, 0.7876557, 0.2369392, 0, 0.6705883, 1, 1,
0.1950903, 0.6469365, -0.4430704, 0, 0.6627451, 1, 1,
0.1956073, 0.4156947, 1.176633, 0, 0.6588235, 1, 1,
0.1977081, -1.402726, 3.655641, 0, 0.6509804, 1, 1,
0.1988324, 1.169621, 0.7263417, 0, 0.6470588, 1, 1,
0.1997079, 0.8774379, 0.4970359, 0, 0.6392157, 1, 1,
0.2008257, 0.4101187, 0.9255812, 0, 0.6352941, 1, 1,
0.2008578, 1.463228, 0.5981447, 0, 0.627451, 1, 1,
0.2029484, 0.5656, -1.003487, 0, 0.6235294, 1, 1,
0.2034611, -0.08836028, 3.389354, 0, 0.6156863, 1, 1,
0.2047363, 0.3983157, -0.1466929, 0, 0.6117647, 1, 1,
0.206431, -1.935163, 4.458205, 0, 0.6039216, 1, 1,
0.2079694, -0.8508475, 1.277249, 0, 0.5960785, 1, 1,
0.2126023, 0.1131209, 2.813289, 0, 0.5921569, 1, 1,
0.214356, -1.129974, 3.266053, 0, 0.5843138, 1, 1,
0.2203067, -1.581554, 2.568086, 0, 0.5803922, 1, 1,
0.2221269, -0.3883944, 1.349192, 0, 0.572549, 1, 1,
0.2240843, 0.3414706, 0.1386769, 0, 0.5686275, 1, 1,
0.2284626, 1.452993, -0.3287705, 0, 0.5607843, 1, 1,
0.2311413, -1.024516, 1.603015, 0, 0.5568628, 1, 1,
0.2343446, 0.4412406, 1.369779, 0, 0.5490196, 1, 1,
0.23462, 1.270715, 0.05895466, 0, 0.5450981, 1, 1,
0.2372386, -1.154805, 3.017915, 0, 0.5372549, 1, 1,
0.2378576, 0.377079, 2.282656, 0, 0.5333334, 1, 1,
0.2386366, -0.01656115, 1.235171, 0, 0.5254902, 1, 1,
0.2388054, 0.7230192, 1.402822, 0, 0.5215687, 1, 1,
0.2388486, 1.084491, 1.273206, 0, 0.5137255, 1, 1,
0.2444203, 0.2281264, -0.1468292, 0, 0.509804, 1, 1,
0.2471924, -1.613755, 5.00862, 0, 0.5019608, 1, 1,
0.2513804, 0.1046975, 1.330572, 0, 0.4941176, 1, 1,
0.2518796, -1.254539, 3.893433, 0, 0.4901961, 1, 1,
0.2570228, 0.08747815, 0.01471105, 0, 0.4823529, 1, 1,
0.2582061, 0.4797525, 2.143573, 0, 0.4784314, 1, 1,
0.2687151, -0.8054147, 2.96891, 0, 0.4705882, 1, 1,
0.2717243, 0.01368467, 1.696859, 0, 0.4666667, 1, 1,
0.2734837, -1.098158, 2.91196, 0, 0.4588235, 1, 1,
0.2859164, -0.8577594, 3.149683, 0, 0.454902, 1, 1,
0.2904466, 0.4688283, 1.496303, 0, 0.4470588, 1, 1,
0.2915019, -0.04948592, 2.49559, 0, 0.4431373, 1, 1,
0.2929799, 1.28064, -1.654565, 0, 0.4352941, 1, 1,
0.2939925, 0.8275601, -0.2082956, 0, 0.4313726, 1, 1,
0.2944818, -1.485255, 2.107574, 0, 0.4235294, 1, 1,
0.294876, 0.108082, 1.859933, 0, 0.4196078, 1, 1,
0.3050148, -1.762673, 3.400208, 0, 0.4117647, 1, 1,
0.3079821, 0.7827601, 0.1954965, 0, 0.4078431, 1, 1,
0.3086902, 0.6575879, 1.679471, 0, 0.4, 1, 1,
0.316906, 1.137592, -0.8950327, 0, 0.3921569, 1, 1,
0.3175152, 0.7049714, 0.3296109, 0, 0.3882353, 1, 1,
0.3179389, 0.2380138, 1.754121, 0, 0.3803922, 1, 1,
0.3225626, 0.8314154, 0.3427108, 0, 0.3764706, 1, 1,
0.322911, 1.355053, -0.1132952, 0, 0.3686275, 1, 1,
0.3246981, 1.288191, -0.4232856, 0, 0.3647059, 1, 1,
0.3279884, -0.2001463, 4.336425, 0, 0.3568628, 1, 1,
0.3335052, -0.1091102, 2.030095, 0, 0.3529412, 1, 1,
0.3342223, 1.63061, 0.2835389, 0, 0.345098, 1, 1,
0.3364369, 0.362694, -0.3693027, 0, 0.3411765, 1, 1,
0.3390358, -0.123187, 0.7840538, 0, 0.3333333, 1, 1,
0.3397909, -0.3408221, 2.584053, 0, 0.3294118, 1, 1,
0.3412855, 0.8264377, -0.2957978, 0, 0.3215686, 1, 1,
0.3429613, 0.512941, 0.9244918, 0, 0.3176471, 1, 1,
0.3437051, -0.6643514, 3.081082, 0, 0.3098039, 1, 1,
0.3446541, -0.2450086, 2.540032, 0, 0.3058824, 1, 1,
0.3490798, -1.670531, 1.373423, 0, 0.2980392, 1, 1,
0.349111, 0.6331367, 0.4447695, 0, 0.2901961, 1, 1,
0.3494599, -0.9186098, 2.696053, 0, 0.2862745, 1, 1,
0.3501259, 0.5245365, 2.188962, 0, 0.2784314, 1, 1,
0.3538224, -0.3599968, 2.104748, 0, 0.2745098, 1, 1,
0.3564971, -0.6581682, 1.575089, 0, 0.2666667, 1, 1,
0.361311, -0.09478582, 4.405205, 0, 0.2627451, 1, 1,
0.3616681, 0.9687259, 0.8592806, 0, 0.254902, 1, 1,
0.3637799, 0.3766257, 0.870041, 0, 0.2509804, 1, 1,
0.3733162, -0.2760828, 1.92557, 0, 0.2431373, 1, 1,
0.3754183, -0.3170614, 3.286494, 0, 0.2392157, 1, 1,
0.3765807, 0.8849594, 0.002129013, 0, 0.2313726, 1, 1,
0.376708, 0.8971044, -1.047352, 0, 0.227451, 1, 1,
0.3781958, -1.826693, 3.685296, 0, 0.2196078, 1, 1,
0.3799682, -1.379132, 4.315137, 0, 0.2156863, 1, 1,
0.3857992, 0.8991817, 0.03823514, 0, 0.2078431, 1, 1,
0.3880872, 0.6780097, 0.8358722, 0, 0.2039216, 1, 1,
0.3928403, -0.3852817, 3.359921, 0, 0.1960784, 1, 1,
0.3934676, -0.1460794, 3.31411, 0, 0.1882353, 1, 1,
0.3936758, 0.4476451, 2.139308, 0, 0.1843137, 1, 1,
0.3977526, 0.189269, 1.142349, 0, 0.1764706, 1, 1,
0.3998102, -0.2586575, 3.037708, 0, 0.172549, 1, 1,
0.4031265, -1.049459, 1.564961, 0, 0.1647059, 1, 1,
0.4049902, 1.630768, 0.3247668, 0, 0.1607843, 1, 1,
0.4067669, -0.8399128, 2.210649, 0, 0.1529412, 1, 1,
0.4120313, 0.1977088, 1.596928, 0, 0.1490196, 1, 1,
0.4152771, -1.397102, 2.680085, 0, 0.1411765, 1, 1,
0.4167808, -0.3795738, 2.99075, 0, 0.1372549, 1, 1,
0.4189975, -0.3203418, 1.036089, 0, 0.1294118, 1, 1,
0.4196805, -0.4125061, 4.006183, 0, 0.1254902, 1, 1,
0.420765, 1.687891, 0.7279482, 0, 0.1176471, 1, 1,
0.4211592, 0.3649587, 0.4703128, 0, 0.1137255, 1, 1,
0.4249712, -0.09021474, 0.1054014, 0, 0.1058824, 1, 1,
0.4256418, -0.3242407, 1.303083, 0, 0.09803922, 1, 1,
0.4277969, -0.2507737, 0.3962331, 0, 0.09411765, 1, 1,
0.4278427, 0.3890417, 0.06985777, 0, 0.08627451, 1, 1,
0.4303102, 1.105935, 0.6971751, 0, 0.08235294, 1, 1,
0.4336989, -0.02104376, 1.528822, 0, 0.07450981, 1, 1,
0.4351939, -2.531588, 3.376357, 0, 0.07058824, 1, 1,
0.4363942, 0.1352569, 3.321728, 0, 0.0627451, 1, 1,
0.4369278, -0.6266167, 1.385322, 0, 0.05882353, 1, 1,
0.4373382, 0.6026191, 0.4484698, 0, 0.05098039, 1, 1,
0.445125, 1.570698, 0.9721369, 0, 0.04705882, 1, 1,
0.4471189, 0.256305, 1.231215, 0, 0.03921569, 1, 1,
0.44762, 1.345942, -1.398194, 0, 0.03529412, 1, 1,
0.4487291, 0.5432725, 2.230607, 0, 0.02745098, 1, 1,
0.4506139, 0.2807579, 1.224526, 0, 0.02352941, 1, 1,
0.4525781, -0.5296528, 4.098926, 0, 0.01568628, 1, 1,
0.4530373, 1.471213, 1.242397, 0, 0.01176471, 1, 1,
0.4537829, 0.8598556, 0.8125697, 0, 0.003921569, 1, 1,
0.4541942, -1.382761, 1.579487, 0.003921569, 0, 1, 1,
0.458095, -0.9566004, 0.8511413, 0.007843138, 0, 1, 1,
0.4581237, 0.8486652, 0.8822498, 0.01568628, 0, 1, 1,
0.4603178, 0.4682453, 0.5891017, 0.01960784, 0, 1, 1,
0.4698073, -1.174874, 1.551654, 0.02745098, 0, 1, 1,
0.4860405, 0.1170597, 0.7167759, 0.03137255, 0, 1, 1,
0.486323, 0.3626503, 0.7690117, 0.03921569, 0, 1, 1,
0.4877032, 0.748163, 0.4512133, 0.04313726, 0, 1, 1,
0.4952909, 0.7524936, 0.07730559, 0.05098039, 0, 1, 1,
0.4969691, 0.2260457, 3.550437, 0.05490196, 0, 1, 1,
0.499507, -0.6750224, 2.393978, 0.0627451, 0, 1, 1,
0.5090786, -0.06815042, 2.106187, 0.06666667, 0, 1, 1,
0.5159542, -1.02329, 3.450903, 0.07450981, 0, 1, 1,
0.517009, 0.09173933, 1.150711, 0.07843138, 0, 1, 1,
0.5179412, -0.2856433, 1.963099, 0.08627451, 0, 1, 1,
0.5229508, -1.584865, 3.179204, 0.09019608, 0, 1, 1,
0.5308047, 0.8407934, 0.6034589, 0.09803922, 0, 1, 1,
0.5368293, -0.7695187, 1.21065, 0.1058824, 0, 1, 1,
0.5393323, 0.5455616, 0.00625884, 0.1098039, 0, 1, 1,
0.5400609, 0.5816824, 0.910738, 0.1176471, 0, 1, 1,
0.5440339, 0.167546, 1.181337, 0.1215686, 0, 1, 1,
0.5464941, -1.023044, 1.452442, 0.1294118, 0, 1, 1,
0.5503271, 1.420009, -2.509838, 0.1333333, 0, 1, 1,
0.5514441, -0.1926826, 2.418742, 0.1411765, 0, 1, 1,
0.5521426, -0.3304367, 2.195389, 0.145098, 0, 1, 1,
0.554052, 0.2332979, 0.4320718, 0.1529412, 0, 1, 1,
0.5553123, 0.7059574, 0.7716092, 0.1568628, 0, 1, 1,
0.5577899, -0.2131387, 1.511918, 0.1647059, 0, 1, 1,
0.557897, -1.415327, 3.223169, 0.1686275, 0, 1, 1,
0.5600296, -0.7912349, 1.552345, 0.1764706, 0, 1, 1,
0.5609694, -0.1750487, 0.7932019, 0.1803922, 0, 1, 1,
0.5726048, 0.9635983, 1.572981, 0.1882353, 0, 1, 1,
0.5767601, -0.4197094, 4.055139, 0.1921569, 0, 1, 1,
0.5825894, -0.8383769, 1.173236, 0.2, 0, 1, 1,
0.5868385, 0.3172922, 0.2740457, 0.2078431, 0, 1, 1,
0.5910023, 0.7902785, 0.5478589, 0.2117647, 0, 1, 1,
0.5931532, -1.281365, 2.020465, 0.2196078, 0, 1, 1,
0.5948818, -0.5792996, 5.333661, 0.2235294, 0, 1, 1,
0.5982621, 0.3150423, 0.53713, 0.2313726, 0, 1, 1,
0.5994093, -0.06437744, 0.3844569, 0.2352941, 0, 1, 1,
0.6107802, -0.5954546, 2.766536, 0.2431373, 0, 1, 1,
0.6123931, 0.04250446, 2.329809, 0.2470588, 0, 1, 1,
0.6143554, -1.599339, 1.423325, 0.254902, 0, 1, 1,
0.6183309, -0.667613, 3.302685, 0.2588235, 0, 1, 1,
0.6201143, -1.462129, 3.195313, 0.2666667, 0, 1, 1,
0.6232198, 1.512046, 0.1529872, 0.2705882, 0, 1, 1,
0.6268727, -0.009351765, 2.793258, 0.2784314, 0, 1, 1,
0.6279305, -0.04173505, 1.454409, 0.282353, 0, 1, 1,
0.6342564, -0.1413842, 1.658914, 0.2901961, 0, 1, 1,
0.6380492, 1.331845, 0.6192321, 0.2941177, 0, 1, 1,
0.6407304, -1.565314, 1.287449, 0.3019608, 0, 1, 1,
0.6449334, -0.6511171, 3.503281, 0.3098039, 0, 1, 1,
0.6452481, 0.8499303, 2.513133, 0.3137255, 0, 1, 1,
0.6453725, -0.1275294, 2.492701, 0.3215686, 0, 1, 1,
0.6460546, 0.342394, 0.8346754, 0.3254902, 0, 1, 1,
0.6484113, 0.8151733, 0.4507038, 0.3333333, 0, 1, 1,
0.649498, 0.4900917, 0.3759777, 0.3372549, 0, 1, 1,
0.6524529, -0.7550537, 4.143791, 0.345098, 0, 1, 1,
0.6532925, -1.721501, 2.821669, 0.3490196, 0, 1, 1,
0.6536011, 2.289308, 0.9040186, 0.3568628, 0, 1, 1,
0.660744, 0.8109204, 1.131768, 0.3607843, 0, 1, 1,
0.6616138, -0.845091, 4.778769, 0.3686275, 0, 1, 1,
0.662133, 1.369044, 0.3043606, 0.372549, 0, 1, 1,
0.6622001, 0.8059467, 0.9081107, 0.3803922, 0, 1, 1,
0.6643512, 0.09008005, 2.68147, 0.3843137, 0, 1, 1,
0.6719767, -0.7003064, 2.413551, 0.3921569, 0, 1, 1,
0.673802, 0.7739256, -0.9081941, 0.3960784, 0, 1, 1,
0.6839134, -0.3931065, 2.741213, 0.4039216, 0, 1, 1,
0.6888384, 1.438771, 1.926797, 0.4117647, 0, 1, 1,
0.6895773, -1.037372, 1.523956, 0.4156863, 0, 1, 1,
0.692768, -0.3312982, 1.342622, 0.4235294, 0, 1, 1,
0.694892, -0.426768, 3.221004, 0.427451, 0, 1, 1,
0.7029753, -0.6786513, 1.777586, 0.4352941, 0, 1, 1,
0.7068087, 1.392624, 1.559438, 0.4392157, 0, 1, 1,
0.7069782, 1.986148, -0.567661, 0.4470588, 0, 1, 1,
0.7106206, 0.3336499, 1.124058, 0.4509804, 0, 1, 1,
0.7195027, 0.939544, 0.9675394, 0.4588235, 0, 1, 1,
0.7202512, 0.4090608, -0.1918196, 0.4627451, 0, 1, 1,
0.7222043, -1.160524, 3.437933, 0.4705882, 0, 1, 1,
0.7224098, 0.5371727, 1.572273, 0.4745098, 0, 1, 1,
0.7268907, 0.1655152, 0.7629469, 0.4823529, 0, 1, 1,
0.7290713, -0.7816761, 2.405184, 0.4862745, 0, 1, 1,
0.7312897, -2.340168, 2.925043, 0.4941176, 0, 1, 1,
0.73698, 0.1139935, -0.01666412, 0.5019608, 0, 1, 1,
0.7416599, 0.2210658, 1.120926, 0.5058824, 0, 1, 1,
0.7438457, -0.4577232, 3.596328, 0.5137255, 0, 1, 1,
0.7443395, -0.5669193, -0.680249, 0.5176471, 0, 1, 1,
0.7452837, 0.3048073, 0.5166535, 0.5254902, 0, 1, 1,
0.7456889, -1.445255, 2.924143, 0.5294118, 0, 1, 1,
0.7506102, 0.795742, 0.917257, 0.5372549, 0, 1, 1,
0.7577672, 0.4429232, 2.121836, 0.5411765, 0, 1, 1,
0.7580349, 0.7261604, -1.096071, 0.5490196, 0, 1, 1,
0.7617261, -0.775157, 2.428051, 0.5529412, 0, 1, 1,
0.7655404, -1.488403, 2.546078, 0.5607843, 0, 1, 1,
0.7664554, 0.4915396, -0.04594405, 0.5647059, 0, 1, 1,
0.7734284, -0.8603125, 3.068625, 0.572549, 0, 1, 1,
0.7757552, 0.1787637, 1.013096, 0.5764706, 0, 1, 1,
0.776544, -0.03766365, 1.928593, 0.5843138, 0, 1, 1,
0.7773794, -1.21213, 1.882327, 0.5882353, 0, 1, 1,
0.7803699, -0.2211272, 3.273882, 0.5960785, 0, 1, 1,
0.7860378, -1.888811, 5.600247, 0.6039216, 0, 1, 1,
0.8058564, 2.352126, 2.697135, 0.6078432, 0, 1, 1,
0.8069803, 0.01473, 0.5757183, 0.6156863, 0, 1, 1,
0.8168156, -0.9504769, 2.975825, 0.6196079, 0, 1, 1,
0.8191758, 1.127602, 0.3858574, 0.627451, 0, 1, 1,
0.8246534, -1.992755, 3.346797, 0.6313726, 0, 1, 1,
0.824895, 0.5118896, 1.042601, 0.6392157, 0, 1, 1,
0.8260434, -1.304786, 1.479304, 0.6431373, 0, 1, 1,
0.8274602, -1.124253, 1.965124, 0.6509804, 0, 1, 1,
0.8282265, 0.8171531, 1.097869, 0.654902, 0, 1, 1,
0.8373486, -0.7741435, 0.866932, 0.6627451, 0, 1, 1,
0.8473927, 0.8258212, 0.82782, 0.6666667, 0, 1, 1,
0.8483606, 0.3421725, 1.718758, 0.6745098, 0, 1, 1,
0.8553277, 0.001084065, 0.4939557, 0.6784314, 0, 1, 1,
0.8578687, 0.1807394, 1.27915, 0.6862745, 0, 1, 1,
0.857928, -0.881199, 2.418019, 0.6901961, 0, 1, 1,
0.8612458, 1.213229, 0.9151645, 0.6980392, 0, 1, 1,
0.8627284, -1.665777, 1.771944, 0.7058824, 0, 1, 1,
0.86543, 0.4069827, 0.7967575, 0.7098039, 0, 1, 1,
0.8657162, -0.4094267, 0.1222035, 0.7176471, 0, 1, 1,
0.8670344, -0.08366296, 2.321681, 0.7215686, 0, 1, 1,
0.8672968, -2.618405, 2.782397, 0.7294118, 0, 1, 1,
0.8700181, 0.0630022, 2.264393, 0.7333333, 0, 1, 1,
0.8840179, 1.540102, 0.7008208, 0.7411765, 0, 1, 1,
0.892264, 0.3185357, 0.5489075, 0.7450981, 0, 1, 1,
0.8923923, -0.324136, 2.432598, 0.7529412, 0, 1, 1,
0.8975282, 0.6051502, 0.4802619, 0.7568628, 0, 1, 1,
0.8983046, -0.7252772, 2.041261, 0.7647059, 0, 1, 1,
0.9024942, -0.1781285, 1.887607, 0.7686275, 0, 1, 1,
0.9034667, 0.007120881, 2.095171, 0.7764706, 0, 1, 1,
0.9037154, 0.1554651, 2.905283, 0.7803922, 0, 1, 1,
0.9067208, -0.1437085, 1.471441, 0.7882353, 0, 1, 1,
0.9074594, 0.9803745, 0.03285709, 0.7921569, 0, 1, 1,
0.9092701, 1.954348, 0.8227901, 0.8, 0, 1, 1,
0.9153482, 0.1943919, 0.571178, 0.8078431, 0, 1, 1,
0.9159654, -0.05186274, 0.6779678, 0.8117647, 0, 1, 1,
0.9193481, -0.02173508, -0.2089828, 0.8196079, 0, 1, 1,
0.9200359, 0.8291385, -0.8334811, 0.8235294, 0, 1, 1,
0.9221874, 1.068788, 0.6607272, 0.8313726, 0, 1, 1,
0.9228176, 0.6809235, 3.369696, 0.8352941, 0, 1, 1,
0.9232903, -0.3154577, 2.726477, 0.8431373, 0, 1, 1,
0.9303315, -0.01935454, 1.117904, 0.8470588, 0, 1, 1,
0.9306788, 0.4006126, 0.4113395, 0.854902, 0, 1, 1,
0.9327909, -0.3487805, 1.328667, 0.8588235, 0, 1, 1,
0.9334552, -0.6212061, 3.160022, 0.8666667, 0, 1, 1,
0.9376749, 0.6582965, 0.3792234, 0.8705882, 0, 1, 1,
0.9422538, -0.08120985, 1.282058, 0.8784314, 0, 1, 1,
0.9499653, 1.004179, 1.466217, 0.8823529, 0, 1, 1,
0.950191, -0.6698643, 2.573631, 0.8901961, 0, 1, 1,
0.9507232, 1.538859, 1.380811, 0.8941177, 0, 1, 1,
0.9534716, 0.2058655, 0.517658, 0.9019608, 0, 1, 1,
0.9562322, -1.279409, 2.785507, 0.9098039, 0, 1, 1,
0.9576523, 2.05824, 0.2444312, 0.9137255, 0, 1, 1,
0.9607866, 1.424463, 1.713973, 0.9215686, 0, 1, 1,
0.972037, 0.5022978, 1.630652, 0.9254902, 0, 1, 1,
0.980673, -0.4477911, 1.99684, 0.9333333, 0, 1, 1,
0.9820318, -0.6037776, -0.3343678, 0.9372549, 0, 1, 1,
0.9893644, -0.6303651, 2.547064, 0.945098, 0, 1, 1,
0.9898351, 0.02882702, 1.405036, 0.9490196, 0, 1, 1,
0.9947671, 0.2259701, 0.1102403, 0.9568627, 0, 1, 1,
0.9965169, 0.8321267, 0.6159644, 0.9607843, 0, 1, 1,
1.00643, -1.18916, 1.885013, 0.9686275, 0, 1, 1,
1.010734, -0.7358745, 1.168077, 0.972549, 0, 1, 1,
1.012632, 0.765849, 0.06601588, 0.9803922, 0, 1, 1,
1.013062, 0.5163312, -0.3736971, 0.9843137, 0, 1, 1,
1.013771, 0.6642745, 0.3452391, 0.9921569, 0, 1, 1,
1.015562, 0.1334122, 1.668336, 0.9960784, 0, 1, 1,
1.016006, -1.011124, 3.924941, 1, 0, 0.9960784, 1,
1.019196, 0.6730686, 2.305865, 1, 0, 0.9882353, 1,
1.025008, -0.09775119, 2.047907, 1, 0, 0.9843137, 1,
1.0277, 0.5970076, -0.03856086, 1, 0, 0.9764706, 1,
1.029377, -0.2652856, 2.914646, 1, 0, 0.972549, 1,
1.034327, 1.148724, 1.494744, 1, 0, 0.9647059, 1,
1.037097, -0.08259976, 1.341625, 1, 0, 0.9607843, 1,
1.042546, 1.46041, -0.454177, 1, 0, 0.9529412, 1,
1.047248, -0.5182879, 1.558859, 1, 0, 0.9490196, 1,
1.05721, 0.623711, 2.738358, 1, 0, 0.9411765, 1,
1.058071, 1.131461, 2.517813, 1, 0, 0.9372549, 1,
1.068202, -0.3597631, 1.956531, 1, 0, 0.9294118, 1,
1.083769, -0.2170906, -0.0469413, 1, 0, 0.9254902, 1,
1.086679, 1.242882, 3.13063, 1, 0, 0.9176471, 1,
1.091834, -0.5716671, 2.888762, 1, 0, 0.9137255, 1,
1.092269, 1.735482, -0.6722782, 1, 0, 0.9058824, 1,
1.092414, -1.313918, 1.989908, 1, 0, 0.9019608, 1,
1.096599, -0.120165, 1.282563, 1, 0, 0.8941177, 1,
1.097885, -0.1455061, 1.510147, 1, 0, 0.8862745, 1,
1.098531, 0.2381998, 1.442996, 1, 0, 0.8823529, 1,
1.100126, -0.1572151, 1.923591, 1, 0, 0.8745098, 1,
1.10589, 0.5160713, 0.5227786, 1, 0, 0.8705882, 1,
1.108276, -1.03489, 2.346624, 1, 0, 0.8627451, 1,
1.109232, -1.048647, 4.076605, 1, 0, 0.8588235, 1,
1.112095, 1.080498, -0.05901672, 1, 0, 0.8509804, 1,
1.119232, -1.648183, 2.417897, 1, 0, 0.8470588, 1,
1.119419, -0.4540329, 0.9414899, 1, 0, 0.8392157, 1,
1.122691, 0.7759933, 0.09559577, 1, 0, 0.8352941, 1,
1.133772, 0.04839256, 2.604591, 1, 0, 0.827451, 1,
1.144861, -0.9497814, 3.251205, 1, 0, 0.8235294, 1,
1.146038, 0.01836199, 2.330047, 1, 0, 0.8156863, 1,
1.158181, -1.000401, 4.691034, 1, 0, 0.8117647, 1,
1.169312, 0.7057047, -0.5043337, 1, 0, 0.8039216, 1,
1.179015, 1.45668, 0.06364723, 1, 0, 0.7960784, 1,
1.179729, -0.6783296, 2.527941, 1, 0, 0.7921569, 1,
1.1807, -1.336155, 2.493463, 1, 0, 0.7843137, 1,
1.181141, 0.006323949, 0.1867671, 1, 0, 0.7803922, 1,
1.181228, -0.2391768, 2.564441, 1, 0, 0.772549, 1,
1.182992, 0.6683934, 1.3476, 1, 0, 0.7686275, 1,
1.18412, -1.159742, 2.705734, 1, 0, 0.7607843, 1,
1.185505, -0.8898922, 0.6117651, 1, 0, 0.7568628, 1,
1.195303, -0.9035912, 4.22133, 1, 0, 0.7490196, 1,
1.201922, -0.5867143, 0.03140321, 1, 0, 0.7450981, 1,
1.223649, 1.153157, -1.770333, 1, 0, 0.7372549, 1,
1.227685, 0.198581, 1.800224, 1, 0, 0.7333333, 1,
1.231575, -0.2433726, 1.668723, 1, 0, 0.7254902, 1,
1.23212, 0.9630926, 0.8464905, 1, 0, 0.7215686, 1,
1.233978, 0.6324731, 2.553655, 1, 0, 0.7137255, 1,
1.235821, -0.2473225, 0.9150589, 1, 0, 0.7098039, 1,
1.236231, 0.306619, 1.695841, 1, 0, 0.7019608, 1,
1.237958, 0.7703819, -1.571665, 1, 0, 0.6941177, 1,
1.239381, 0.3764084, 2.790746, 1, 0, 0.6901961, 1,
1.246538, 1.4337, 0.8799822, 1, 0, 0.682353, 1,
1.256497, -0.3227957, 1.522536, 1, 0, 0.6784314, 1,
1.260678, -1.613226, 1.503861, 1, 0, 0.6705883, 1,
1.264648, -0.6276099, 1.57111, 1, 0, 0.6666667, 1,
1.268168, 0.3561222, -0.3608122, 1, 0, 0.6588235, 1,
1.272896, -1.073717, 1.719288, 1, 0, 0.654902, 1,
1.273078, -0.6121252, 0.8264223, 1, 0, 0.6470588, 1,
1.273454, -0.1519181, -0.1405697, 1, 0, 0.6431373, 1,
1.278398, 0.6444112, 1.180205, 1, 0, 0.6352941, 1,
1.280114, 0.07510104, 1.515265, 1, 0, 0.6313726, 1,
1.280869, 1.833084, 1.06957, 1, 0, 0.6235294, 1,
1.281378, -0.4252245, 0.884149, 1, 0, 0.6196079, 1,
1.296017, -2.542015, 3.388625, 1, 0, 0.6117647, 1,
1.297042, 1.865117, 1.186951, 1, 0, 0.6078432, 1,
1.311496, -0.6011681, 3.757819, 1, 0, 0.6, 1,
1.312142, -0.9640798, 1.958439, 1, 0, 0.5921569, 1,
1.312984, 1.319931, 1.45693, 1, 0, 0.5882353, 1,
1.313895, -0.4043574, 3.400613, 1, 0, 0.5803922, 1,
1.318261, 0.1222485, 1.585735, 1, 0, 0.5764706, 1,
1.318526, 0.6049989, 1.104919, 1, 0, 0.5686275, 1,
1.32076, 0.5944474, 1.1532, 1, 0, 0.5647059, 1,
1.33166, -1.015397, 1.789132, 1, 0, 0.5568628, 1,
1.332371, 1.0677, 0.9403585, 1, 0, 0.5529412, 1,
1.334432, 1.36556, 1.902028, 1, 0, 0.5450981, 1,
1.343225, 1.698468, 1.418903, 1, 0, 0.5411765, 1,
1.346287, 1.109096, 1.919815, 1, 0, 0.5333334, 1,
1.355187, -1.228798, 0.4700353, 1, 0, 0.5294118, 1,
1.361848, -0.06779444, 1.045064, 1, 0, 0.5215687, 1,
1.362028, -1.331748, 3.307926, 1, 0, 0.5176471, 1,
1.362384, 0.2227415, 1.559526, 1, 0, 0.509804, 1,
1.367398, 0.2647447, 1.992908, 1, 0, 0.5058824, 1,
1.373437, -0.12813, -0.1486092, 1, 0, 0.4980392, 1,
1.381755, -1.430187, 2.001997, 1, 0, 0.4901961, 1,
1.39576, 1.084452, 1.132908, 1, 0, 0.4862745, 1,
1.408256, -0.1770225, 3.485403, 1, 0, 0.4784314, 1,
1.409106, 1.439124, 1.7111, 1, 0, 0.4745098, 1,
1.413438, -0.8729954, 1.475534, 1, 0, 0.4666667, 1,
1.413528, 0.624624, 1.133538, 1, 0, 0.4627451, 1,
1.415833, -0.2429096, 0.2714544, 1, 0, 0.454902, 1,
1.422267, -0.5646442, 3.175864, 1, 0, 0.4509804, 1,
1.425707, 0.4334034, 1.649483, 1, 0, 0.4431373, 1,
1.430308, 1.198915, 1.620812, 1, 0, 0.4392157, 1,
1.43444, -0.2282671, 0.1069731, 1, 0, 0.4313726, 1,
1.445192, -0.06213264, 2.779988, 1, 0, 0.427451, 1,
1.446328, 0.4765961, 0.1140633, 1, 0, 0.4196078, 1,
1.450909, -1.803102, 1.512769, 1, 0, 0.4156863, 1,
1.465416, 1.53144, 2.972007, 1, 0, 0.4078431, 1,
1.471232, 0.398902, -0.2231212, 1, 0, 0.4039216, 1,
1.471521, 1.747333, -0.343977, 1, 0, 0.3960784, 1,
1.484614, 1.96717, -0.6127421, 1, 0, 0.3882353, 1,
1.486606, -1.385245, 2.348192, 1, 0, 0.3843137, 1,
1.487638, -1.226157, 1.508357, 1, 0, 0.3764706, 1,
1.489145, -0.3473625, 0.993695, 1, 0, 0.372549, 1,
1.503954, -0.3746063, 2.293506, 1, 0, 0.3647059, 1,
1.50403, -0.3045529, 0.2934869, 1, 0, 0.3607843, 1,
1.505115, 0.2588238, 0.5496036, 1, 0, 0.3529412, 1,
1.539075, -0.9611143, 1.707997, 1, 0, 0.3490196, 1,
1.539123, 0.5226687, 0.5475969, 1, 0, 0.3411765, 1,
1.544842, 0.7096421, 1.545313, 1, 0, 0.3372549, 1,
1.547698, 0.4568359, 1.906554, 1, 0, 0.3294118, 1,
1.563106, -1.568861, 3.472023, 1, 0, 0.3254902, 1,
1.584127, -0.1225894, 1.318818, 1, 0, 0.3176471, 1,
1.59063, 1.122591, 2.083112, 1, 0, 0.3137255, 1,
1.599358, -0.4097066, 1.368012, 1, 0, 0.3058824, 1,
1.599558, 0.7513865, 1.096077, 1, 0, 0.2980392, 1,
1.603911, 0.08443626, 1.081273, 1, 0, 0.2941177, 1,
1.609726, 1.293282, 2.022882, 1, 0, 0.2862745, 1,
1.618848, 0.1912544, 1.045113, 1, 0, 0.282353, 1,
1.619185, -0.605652, 1.967152, 1, 0, 0.2745098, 1,
1.657525, 0.8720689, 1.416946, 1, 0, 0.2705882, 1,
1.658174, -0.2015037, 1.65588, 1, 0, 0.2627451, 1,
1.674299, 1.046762, 0.3236862, 1, 0, 0.2588235, 1,
1.675057, -2.281099, 2.750356, 1, 0, 0.2509804, 1,
1.694658, 1.886001, 1.034688, 1, 0, 0.2470588, 1,
1.749983, 1.327374, -0.4840278, 1, 0, 0.2392157, 1,
1.756751, 1.428519, 1.809476, 1, 0, 0.2352941, 1,
1.772309, 0.4132019, 0.02183142, 1, 0, 0.227451, 1,
1.774119, 0.5517877, 1.217484, 1, 0, 0.2235294, 1,
1.780741, 0.1548071, 0.1061263, 1, 0, 0.2156863, 1,
1.787037, 0.7876899, 0.7540775, 1, 0, 0.2117647, 1,
1.837072, 1.755244, 0.2139053, 1, 0, 0.2039216, 1,
1.842823, 0.1693364, 0.6647689, 1, 0, 0.1960784, 1,
1.845564, 1.769193, 0.4840263, 1, 0, 0.1921569, 1,
1.854429, 0.4222911, -0.4007154, 1, 0, 0.1843137, 1,
1.875074, -0.5535415, 2.071052, 1, 0, 0.1803922, 1,
1.881294, 1.347836, 1.901267, 1, 0, 0.172549, 1,
1.89221, 0.9968995, 1.257394, 1, 0, 0.1686275, 1,
1.96327, -0.9621779, 1.974187, 1, 0, 0.1607843, 1,
1.964932, -0.6767975, 2.124255, 1, 0, 0.1568628, 1,
1.969487, 1.568055, 0.06501254, 1, 0, 0.1490196, 1,
2.097171, 2.723148, 0.8871308, 1, 0, 0.145098, 1,
2.108403, -2.040129, 1.761923, 1, 0, 0.1372549, 1,
2.110313, 0.845315, 0.8086563, 1, 0, 0.1333333, 1,
2.116181, -0.6108162, 0.9230905, 1, 0, 0.1254902, 1,
2.136949, -0.3271012, 1.014116, 1, 0, 0.1215686, 1,
2.142645, 1.676972, 1.76236, 1, 0, 0.1137255, 1,
2.155085, 0.3352534, 2.087361, 1, 0, 0.1098039, 1,
2.236576, -0.9176086, 2.761512, 1, 0, 0.1019608, 1,
2.284466, 0.2049941, 2.272393, 1, 0, 0.09411765, 1,
2.287341, 0.5314299, 1.264227, 1, 0, 0.09019608, 1,
2.300424, -1.097317, 3.049068, 1, 0, 0.08235294, 1,
2.33719, -0.2669357, 2.425238, 1, 0, 0.07843138, 1,
2.34411, 0.829083, 0.416816, 1, 0, 0.07058824, 1,
2.344969, 1.592698, 0.5290284, 1, 0, 0.06666667, 1,
2.382357, -1.233074, 3.800465, 1, 0, 0.05882353, 1,
2.458833, -0.598538, 2.148271, 1, 0, 0.05490196, 1,
2.526364, 2.086395, -1.136001, 1, 0, 0.04705882, 1,
2.69788, 0.6565971, 1.590493, 1, 0, 0.04313726, 1,
2.716217, -1.34466, 1.818685, 1, 0, 0.03529412, 1,
2.972204, 0.8302943, 1.097768, 1, 0, 0.03137255, 1,
3.083039, -0.8224846, 3.185734, 1, 0, 0.02352941, 1,
3.23861, -0.62198, 1.44196, 1, 0, 0.01960784, 1,
3.521188, 1.17837, 1.734897, 1, 0, 0.01176471, 1,
3.740078, -0.1812432, 2.920438, 1, 0, 0.007843138, 1
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
0.07353175, -4.121814, -7.532479, 0, -0.5, 0.5, 0.5,
0.07353175, -4.121814, -7.532479, 1, -0.5, 0.5, 0.5,
0.07353175, -4.121814, -7.532479, 1, 1.5, 0.5, 0.5,
0.07353175, -4.121814, -7.532479, 0, 1.5, 0.5, 0.5
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
-4.835973, -0.2033, -7.532479, 0, -0.5, 0.5, 0.5,
-4.835973, -0.2033, -7.532479, 1, -0.5, 0.5, 0.5,
-4.835973, -0.2033, -7.532479, 1, 1.5, 0.5, 0.5,
-4.835973, -0.2033, -7.532479, 0, 1.5, 0.5, 0.5
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
-4.835973, -4.121814, -0.01442838, 0, -0.5, 0.5, 0.5,
-4.835973, -4.121814, -0.01442838, 1, -0.5, 0.5, 0.5,
-4.835973, -4.121814, -0.01442838, 1, 1.5, 0.5, 0.5,
-4.835973, -4.121814, -0.01442838, 0, 1.5, 0.5, 0.5
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
-2, -3.217541, -5.797544,
2, -3.217541, -5.797544,
-2, -3.217541, -5.797544,
-2, -3.368253, -6.086699,
0, -3.217541, -5.797544,
0, -3.368253, -6.086699,
2, -3.217541, -5.797544,
2, -3.368253, -6.086699
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
-2, -3.669677, -6.665011, 0, -0.5, 0.5, 0.5,
-2, -3.669677, -6.665011, 1, -0.5, 0.5, 0.5,
-2, -3.669677, -6.665011, 1, 1.5, 0.5, 0.5,
-2, -3.669677, -6.665011, 0, 1.5, 0.5, 0.5,
0, -3.669677, -6.665011, 0, -0.5, 0.5, 0.5,
0, -3.669677, -6.665011, 1, -0.5, 0.5, 0.5,
0, -3.669677, -6.665011, 1, 1.5, 0.5, 0.5,
0, -3.669677, -6.665011, 0, 1.5, 0.5, 0.5,
2, -3.669677, -6.665011, 0, -0.5, 0.5, 0.5,
2, -3.669677, -6.665011, 1, -0.5, 0.5, 0.5,
2, -3.669677, -6.665011, 1, 1.5, 0.5, 0.5,
2, -3.669677, -6.665011, 0, 1.5, 0.5, 0.5
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
-3.703011, -3, -5.797544,
-3.703011, 2, -5.797544,
-3.703011, -3, -5.797544,
-3.891838, -3, -6.086699,
-3.703011, -2, -5.797544,
-3.891838, -2, -6.086699,
-3.703011, -1, -5.797544,
-3.891838, -1, -6.086699,
-3.703011, 0, -5.797544,
-3.891838, 0, -6.086699,
-3.703011, 1, -5.797544,
-3.891838, 1, -6.086699,
-3.703011, 2, -5.797544,
-3.891838, 2, -6.086699
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
-4.269492, -3, -6.665011, 0, -0.5, 0.5, 0.5,
-4.269492, -3, -6.665011, 1, -0.5, 0.5, 0.5,
-4.269492, -3, -6.665011, 1, 1.5, 0.5, 0.5,
-4.269492, -3, -6.665011, 0, 1.5, 0.5, 0.5,
-4.269492, -2, -6.665011, 0, -0.5, 0.5, 0.5,
-4.269492, -2, -6.665011, 1, -0.5, 0.5, 0.5,
-4.269492, -2, -6.665011, 1, 1.5, 0.5, 0.5,
-4.269492, -2, -6.665011, 0, 1.5, 0.5, 0.5,
-4.269492, -1, -6.665011, 0, -0.5, 0.5, 0.5,
-4.269492, -1, -6.665011, 1, -0.5, 0.5, 0.5,
-4.269492, -1, -6.665011, 1, 1.5, 0.5, 0.5,
-4.269492, -1, -6.665011, 0, 1.5, 0.5, 0.5,
-4.269492, 0, -6.665011, 0, -0.5, 0.5, 0.5,
-4.269492, 0, -6.665011, 1, -0.5, 0.5, 0.5,
-4.269492, 0, -6.665011, 1, 1.5, 0.5, 0.5,
-4.269492, 0, -6.665011, 0, 1.5, 0.5, 0.5,
-4.269492, 1, -6.665011, 0, -0.5, 0.5, 0.5,
-4.269492, 1, -6.665011, 1, -0.5, 0.5, 0.5,
-4.269492, 1, -6.665011, 1, 1.5, 0.5, 0.5,
-4.269492, 1, -6.665011, 0, 1.5, 0.5, 0.5,
-4.269492, 2, -6.665011, 0, -0.5, 0.5, 0.5,
-4.269492, 2, -6.665011, 1, -0.5, 0.5, 0.5,
-4.269492, 2, -6.665011, 1, 1.5, 0.5, 0.5,
-4.269492, 2, -6.665011, 0, 1.5, 0.5, 0.5
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
-3.703011, -3.217541, -4,
-3.703011, -3.217541, 4,
-3.703011, -3.217541, -4,
-3.891838, -3.368253, -4,
-3.703011, -3.217541, -2,
-3.891838, -3.368253, -2,
-3.703011, -3.217541, 0,
-3.891838, -3.368253, 0,
-3.703011, -3.217541, 2,
-3.891838, -3.368253, 2,
-3.703011, -3.217541, 4,
-3.891838, -3.368253, 4
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
-4.269492, -3.669677, -4, 0, -0.5, 0.5, 0.5,
-4.269492, -3.669677, -4, 1, -0.5, 0.5, 0.5,
-4.269492, -3.669677, -4, 1, 1.5, 0.5, 0.5,
-4.269492, -3.669677, -4, 0, 1.5, 0.5, 0.5,
-4.269492, -3.669677, -2, 0, -0.5, 0.5, 0.5,
-4.269492, -3.669677, -2, 1, -0.5, 0.5, 0.5,
-4.269492, -3.669677, -2, 1, 1.5, 0.5, 0.5,
-4.269492, -3.669677, -2, 0, 1.5, 0.5, 0.5,
-4.269492, -3.669677, 0, 0, -0.5, 0.5, 0.5,
-4.269492, -3.669677, 0, 1, -0.5, 0.5, 0.5,
-4.269492, -3.669677, 0, 1, 1.5, 0.5, 0.5,
-4.269492, -3.669677, 0, 0, 1.5, 0.5, 0.5,
-4.269492, -3.669677, 2, 0, -0.5, 0.5, 0.5,
-4.269492, -3.669677, 2, 1, -0.5, 0.5, 0.5,
-4.269492, -3.669677, 2, 1, 1.5, 0.5, 0.5,
-4.269492, -3.669677, 2, 0, 1.5, 0.5, 0.5,
-4.269492, -3.669677, 4, 0, -0.5, 0.5, 0.5,
-4.269492, -3.669677, 4, 1, -0.5, 0.5, 0.5,
-4.269492, -3.669677, 4, 1, 1.5, 0.5, 0.5,
-4.269492, -3.669677, 4, 0, 1.5, 0.5, 0.5
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
-3.703011, -3.217541, -5.797544,
-3.703011, 2.810941, -5.797544,
-3.703011, -3.217541, 5.768687,
-3.703011, 2.810941, 5.768687,
-3.703011, -3.217541, -5.797544,
-3.703011, -3.217541, 5.768687,
-3.703011, 2.810941, -5.797544,
-3.703011, 2.810941, 5.768687,
-3.703011, -3.217541, -5.797544,
3.850074, -3.217541, -5.797544,
-3.703011, -3.217541, 5.768687,
3.850074, -3.217541, 5.768687,
-3.703011, 2.810941, -5.797544,
3.850074, 2.810941, -5.797544,
-3.703011, 2.810941, 5.768687,
3.850074, 2.810941, 5.768687,
3.850074, -3.217541, -5.797544,
3.850074, 2.810941, -5.797544,
3.850074, -3.217541, 5.768687,
3.850074, 2.810941, 5.768687,
3.850074, -3.217541, -5.797544,
3.850074, -3.217541, 5.768687,
3.850074, 2.810941, -5.797544,
3.850074, 2.810941, 5.768687
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
var radius = 8.04823;
var distance = 35.80749;
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
mvMatrix.translate( -0.07353175, 0.2033, 0.01442838 );
mvMatrix.scale( 1.152099, 1.443465, 0.7523543 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.80749);
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
ethoxyquin<-read.table("ethoxyquin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethoxyquin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
```

```r
y<-ethoxyquin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
```

```r
z<-ethoxyquin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
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
-3.593014, -0.3714607, -2.214292, 0, 0, 1, 1, 1,
-3.338916, -1.165316, -2.227939, 1, 0, 0, 1, 1,
-2.798695, 0.5297846, -0.1888401, 1, 0, 0, 1, 1,
-2.775639, 0.71347, -1.08026, 1, 0, 0, 1, 1,
-2.77481, -0.5316959, -3.398398, 1, 0, 0, 1, 1,
-2.695601, -0.2200135, -0.8355072, 1, 0, 0, 1, 1,
-2.587604, 1.387813, -0.03350521, 0, 0, 0, 1, 1,
-2.562554, 0.1453412, -2.624073, 0, 0, 0, 1, 1,
-2.423347, 0.1001938, -1.917974, 0, 0, 0, 1, 1,
-2.364494, -1.327449, 0.1256368, 0, 0, 0, 1, 1,
-2.250628, -0.5475683, -1.610811, 0, 0, 0, 1, 1,
-2.247211, -0.3467364, -0.3448602, 0, 0, 0, 1, 1,
-2.245934, 0.2103486, -0.4643874, 0, 0, 0, 1, 1,
-2.180504, -0.7274899, -3.311051, 1, 1, 1, 1, 1,
-2.16707, 0.1427889, -0.3535262, 1, 1, 1, 1, 1,
-2.063184, 0.06887846, -1.7523, 1, 1, 1, 1, 1,
-2.052748, -0.7358359, -2.987399, 1, 1, 1, 1, 1,
-2.046999, 0.6270277, -2.842276, 1, 1, 1, 1, 1,
-2.037104, 1.374151, -1.55005, 1, 1, 1, 1, 1,
-2.031163, 1.316259, -0.1083037, 1, 1, 1, 1, 1,
-2.001561, 0.4599016, -0.5478696, 1, 1, 1, 1, 1,
-1.986065, -0.5624434, -1.482267, 1, 1, 1, 1, 1,
-1.947986, -0.9341426, -0.3670975, 1, 1, 1, 1, 1,
-1.941546, -0.2671514, -1.12427, 1, 1, 1, 1, 1,
-1.88189, 0.1943167, -1.371076, 1, 1, 1, 1, 1,
-1.846878, 0.9250916, -0.8433591, 1, 1, 1, 1, 1,
-1.842176, -2.37386, -1.796492, 1, 1, 1, 1, 1,
-1.827363, -0.8913134, -3.060635, 1, 1, 1, 1, 1,
-1.79565, -0.2005487, -1.661182, 0, 0, 1, 1, 1,
-1.776359, -0.7197396, -3.161129, 1, 0, 0, 1, 1,
-1.76288, 0.6980342, -0.0679306, 1, 0, 0, 1, 1,
-1.748796, 0.7279585, -1.26782, 1, 0, 0, 1, 1,
-1.747982, 0.1159746, 0.00500057, 1, 0, 0, 1, 1,
-1.746203, 0.3783686, -2.225836, 1, 0, 0, 1, 1,
-1.744957, 1.070845, -1.374078, 0, 0, 0, 1, 1,
-1.737971, 0.05928843, -0.483268, 0, 0, 0, 1, 1,
-1.723044, -1.205107, -2.844622, 0, 0, 0, 1, 1,
-1.722992, -0.05041492, -2.063272, 0, 0, 0, 1, 1,
-1.702746, -0.2347168, -1.360692, 0, 0, 0, 1, 1,
-1.688928, 1.978062, 0.08937874, 0, 0, 0, 1, 1,
-1.661619, -1.39409, -1.359512, 0, 0, 0, 1, 1,
-1.659775, -0.2702092, -1.826441, 1, 1, 1, 1, 1,
-1.645284, 1.093124, -1.248811, 1, 1, 1, 1, 1,
-1.623157, 1.943812, -1.092406, 1, 1, 1, 1, 1,
-1.601231, -1.176256, -3.595876, 1, 1, 1, 1, 1,
-1.592617, -0.6121889, -1.966577, 1, 1, 1, 1, 1,
-1.590749, 1.803789, -1.17233, 1, 1, 1, 1, 1,
-1.590715, -0.1560232, -0.4119759, 1, 1, 1, 1, 1,
-1.563158, -0.07411756, -1.333278, 1, 1, 1, 1, 1,
-1.560731, -0.1976093, -1.003098, 1, 1, 1, 1, 1,
-1.544039, -0.6643378, -2.083398, 1, 1, 1, 1, 1,
-1.542773, 0.4323754, -0.2110612, 1, 1, 1, 1, 1,
-1.538838, -0.08272877, -2.530508, 1, 1, 1, 1, 1,
-1.518161, 0.38799, -0.373532, 1, 1, 1, 1, 1,
-1.517392, 0.551, -0.8665122, 1, 1, 1, 1, 1,
-1.515964, 0.4694088, -2.551154, 1, 1, 1, 1, 1,
-1.512919, 0.5720824, -0.6273199, 0, 0, 1, 1, 1,
-1.4953, -0.0460701, -1.59777, 1, 0, 0, 1, 1,
-1.487775, -0.2720477, -0.4910946, 1, 0, 0, 1, 1,
-1.474346, -0.1069905, -3.16523, 1, 0, 0, 1, 1,
-1.468792, 0.4645858, -3.072507, 1, 0, 0, 1, 1,
-1.46874, 1.188409, -0.6460505, 1, 0, 0, 1, 1,
-1.465183, 0.6688667, -0.1090156, 0, 0, 0, 1, 1,
-1.442704, -2.511971, -3.105168, 0, 0, 0, 1, 1,
-1.441287, 0.8262755, -1.983696, 0, 0, 0, 1, 1,
-1.436267, -0.9797332, -1.522748, 0, 0, 0, 1, 1,
-1.426631, 0.2656931, -0.7914522, 0, 0, 0, 1, 1,
-1.420535, 1.46161, 0.9018, 0, 0, 0, 1, 1,
-1.420085, 1.324464, 0.04161607, 0, 0, 0, 1, 1,
-1.41851, -0.6945693, -3.242065, 1, 1, 1, 1, 1,
-1.413722, 0.2784162, -1.476152, 1, 1, 1, 1, 1,
-1.374485, 1.494877, -0.5396424, 1, 1, 1, 1, 1,
-1.368768, 0.5577571, -1.89262, 1, 1, 1, 1, 1,
-1.36197, -0.6407806, -2.217569, 1, 1, 1, 1, 1,
-1.342044, 0.4504143, 0.5232277, 1, 1, 1, 1, 1,
-1.337366, -1.778959, -2.414006, 1, 1, 1, 1, 1,
-1.329226, -1.330179, -3.359619, 1, 1, 1, 1, 1,
-1.320332, -0.1842182, -0.9058228, 1, 1, 1, 1, 1,
-1.31952, -0.3340037, -3.127533, 1, 1, 1, 1, 1,
-1.300984, 1.159659, -2.627254, 1, 1, 1, 1, 1,
-1.294925, -0.02654514, -1.99293, 1, 1, 1, 1, 1,
-1.293258, 0.4408593, -0.5972428, 1, 1, 1, 1, 1,
-1.285683, 1.050308, -1.348013, 1, 1, 1, 1, 1,
-1.276132, 0.03751436, -1.926713, 1, 1, 1, 1, 1,
-1.274965, 0.41687, -1.704247, 0, 0, 1, 1, 1,
-1.273066, 0.2063311, -3.369437, 1, 0, 0, 1, 1,
-1.266755, 0.4658687, 0.1670322, 1, 0, 0, 1, 1,
-1.23276, 0.9846376, -1.4922, 1, 0, 0, 1, 1,
-1.226054, 0.8444823, -0.493143, 1, 0, 0, 1, 1,
-1.221733, 0.1141474, -1.658981, 1, 0, 0, 1, 1,
-1.216776, 0.7041007, 0.001295031, 0, 0, 0, 1, 1,
-1.211455, -0.05221202, -2.093645, 0, 0, 0, 1, 1,
-1.206936, -0.5380718, -1.078823, 0, 0, 0, 1, 1,
-1.2058, -0.1173358, -1.223775, 0, 0, 0, 1, 1,
-1.20544, 0.367183, -1.681399, 0, 0, 0, 1, 1,
-1.198633, 0.08270965, -0.9071704, 0, 0, 0, 1, 1,
-1.197918, 0.2701512, -1.686908, 0, 0, 0, 1, 1,
-1.194726, 0.815908, -2.780858, 1, 1, 1, 1, 1,
-1.194258, 1.532829, -0.6595108, 1, 1, 1, 1, 1,
-1.179025, -0.1586907, -2.014545, 1, 1, 1, 1, 1,
-1.173251, 0.3086971, -1.589571, 1, 1, 1, 1, 1,
-1.162514, 0.268153, -3.13732, 1, 1, 1, 1, 1,
-1.151023, 0.06349336, -1.137998, 1, 1, 1, 1, 1,
-1.150791, -2.473493, -1.749672, 1, 1, 1, 1, 1,
-1.149866, -0.4994477, -2.093544, 1, 1, 1, 1, 1,
-1.148732, -0.6170819, -2.058591, 1, 1, 1, 1, 1,
-1.146539, -1.11242, -1.279192, 1, 1, 1, 1, 1,
-1.143551, -0.3482147, -3.012716, 1, 1, 1, 1, 1,
-1.14311, 0.09840269, -0.1036003, 1, 1, 1, 1, 1,
-1.131618, -0.234233, -2.016214, 1, 1, 1, 1, 1,
-1.130131, -0.2807057, -1.534332, 1, 1, 1, 1, 1,
-1.121231, 0.1079073, -1.013866, 1, 1, 1, 1, 1,
-1.1162, -0.469594, -2.242792, 0, 0, 1, 1, 1,
-1.112479, 0.6218239, -0.8926085, 1, 0, 0, 1, 1,
-1.110715, -0.8966736, -3.410235, 1, 0, 0, 1, 1,
-1.108199, 1.257929, -0.8297059, 1, 0, 0, 1, 1,
-1.10797, 0.1755333, -1.106686, 1, 0, 0, 1, 1,
-1.104271, -0.3503868, -0.7115354, 1, 0, 0, 1, 1,
-1.10403, -1.113004, -2.85876, 0, 0, 0, 1, 1,
-1.103118, -1.48849, -3.335564, 0, 0, 0, 1, 1,
-1.099826, -1.3346, -2.696644, 0, 0, 0, 1, 1,
-1.097411, -0.1828309, -1.68498, 0, 0, 0, 1, 1,
-1.092126, -0.8424119, -2.572169, 0, 0, 0, 1, 1,
-1.089869, 1.016776, -0.999646, 0, 0, 0, 1, 1,
-1.088124, -1.541261, -2.104416, 0, 0, 0, 1, 1,
-1.087516, 0.5452684, -1.191079, 1, 1, 1, 1, 1,
-1.087079, -0.07879335, -3.920846, 1, 1, 1, 1, 1,
-1.084582, 1.478904, 0.4472723, 1, 1, 1, 1, 1,
-1.076619, 0.5038255, -0.2854598, 1, 1, 1, 1, 1,
-1.065525, 0.02036077, -2.121008, 1, 1, 1, 1, 1,
-1.058427, 0.1953878, -1.480373, 1, 1, 1, 1, 1,
-1.056849, 0.6371927, -1.216592, 1, 1, 1, 1, 1,
-1.054964, 0.2895239, -1.594098, 1, 1, 1, 1, 1,
-1.044785, -0.5193278, -2.652944, 1, 1, 1, 1, 1,
-1.039584, -0.2151905, -1.879088, 1, 1, 1, 1, 1,
-1.036183, -2.597301, -4.364437, 1, 1, 1, 1, 1,
-1.030702, 1.198981, -0.767644, 1, 1, 1, 1, 1,
-1.015512, -0.2810181, -1.470555, 1, 1, 1, 1, 1,
-1.00781, 0.6221582, -1.363556, 1, 1, 1, 1, 1,
-1.007344, 1.058026, -1.154867, 1, 1, 1, 1, 1,
-1.006542, -1.022093, -1.929497, 0, 0, 1, 1, 1,
-1.001246, 1.367502, -0.5241063, 1, 0, 0, 1, 1,
-0.9947714, 0.2970045, -1.262817, 1, 0, 0, 1, 1,
-0.9892149, 0.1714122, -0.8054441, 1, 0, 0, 1, 1,
-0.9839583, -0.5380095, -1.707092, 1, 0, 0, 1, 1,
-0.9790323, 0.8547958, -1.133097, 1, 0, 0, 1, 1,
-0.9789702, -0.6337508, -2.625489, 0, 0, 0, 1, 1,
-0.9739478, 0.516829, 0.06104166, 0, 0, 0, 1, 1,
-0.9626851, -0.5052999, -2.021163, 0, 0, 0, 1, 1,
-0.9590937, 0.3878526, -1.795428, 0, 0, 0, 1, 1,
-0.9575927, -1.35187, -2.207341, 0, 0, 0, 1, 1,
-0.9541905, -0.08271286, -0.8091311, 0, 0, 0, 1, 1,
-0.9503735, -2.056221, -2.328369, 0, 0, 0, 1, 1,
-0.9472728, -0.2610518, -1.184945, 1, 1, 1, 1, 1,
-0.945939, 2.15283, -1.59993, 1, 1, 1, 1, 1,
-0.9358293, -0.2793603, -1.549344, 1, 1, 1, 1, 1,
-0.9325588, 1.322679, -1.494312, 1, 1, 1, 1, 1,
-0.9256454, -0.3537234, -2.881823, 1, 1, 1, 1, 1,
-0.9234971, -1.083987, -1.603828, 1, 1, 1, 1, 1,
-0.9228778, 1.085217, -1.168257, 1, 1, 1, 1, 1,
-0.9224373, -0.1445888, -1.673269, 1, 1, 1, 1, 1,
-0.9219519, 0.249794, -1.054188, 1, 1, 1, 1, 1,
-0.9209551, -0.7353178, -2.709676, 1, 1, 1, 1, 1,
-0.9142677, 0.6512871, -2.514036, 1, 1, 1, 1, 1,
-0.9106084, -0.07287133, -1.691029, 1, 1, 1, 1, 1,
-0.9077673, 0.1366846, 0.1017717, 1, 1, 1, 1, 1,
-0.9075078, -0.8871677, -1.442282, 1, 1, 1, 1, 1,
-0.9050781, -0.3157352, -0.4793976, 1, 1, 1, 1, 1,
-0.8999724, -0.1814837, -3.033341, 0, 0, 1, 1, 1,
-0.898926, 0.1731948, -1.514846, 1, 0, 0, 1, 1,
-0.8966374, -0.6572485, -1.944301, 1, 0, 0, 1, 1,
-0.8932675, -1.579112, -4.049413, 1, 0, 0, 1, 1,
-0.8921041, 0.2563893, -1.611647, 1, 0, 0, 1, 1,
-0.8914958, 0.2670264, -1.795339, 1, 0, 0, 1, 1,
-0.8902801, -0.7965854, -2.421735, 0, 0, 0, 1, 1,
-0.8814613, 1.098772, -1.669332, 0, 0, 0, 1, 1,
-0.8809765, -0.09540325, -3.773955, 0, 0, 0, 1, 1,
-0.8791474, -0.4091704, -3.210194, 0, 0, 0, 1, 1,
-0.8783523, 0.1600698, -1.270469, 0, 0, 0, 1, 1,
-0.8749061, -0.8883367, -4.24102, 0, 0, 0, 1, 1,
-0.8700752, -0.2100241, -2.866196, 0, 0, 0, 1, 1,
-0.8674786, 0.0101581, -2.777713, 1, 1, 1, 1, 1,
-0.8640931, -0.6796401, -2.395489, 1, 1, 1, 1, 1,
-0.8544628, -0.8220398, -1.006216, 1, 1, 1, 1, 1,
-0.8479634, -1.289202, -4.326405, 1, 1, 1, 1, 1,
-0.8472624, -0.5062028, -1.16526, 1, 1, 1, 1, 1,
-0.8440709, 0.2063572, -0.7024785, 1, 1, 1, 1, 1,
-0.837263, 1.179558, -2.364467, 1, 1, 1, 1, 1,
-0.8368445, -0.0007006635, -0.6324287, 1, 1, 1, 1, 1,
-0.8362585, -1.114996, -4.343962, 1, 1, 1, 1, 1,
-0.8347183, -0.3288612, -0.9652981, 1, 1, 1, 1, 1,
-0.831619, 0.6601757, -0.08864456, 1, 1, 1, 1, 1,
-0.8255201, -0.1029624, -1.189978, 1, 1, 1, 1, 1,
-0.8235524, -0.4153417, -0.5150095, 1, 1, 1, 1, 1,
-0.8202209, 1.363866, -1.568505, 1, 1, 1, 1, 1,
-0.8182487, -0.3349698, -4.04627, 1, 1, 1, 1, 1,
-0.8142817, 0.7029558, 0.2748469, 0, 0, 1, 1, 1,
-0.8101982, -1.214307, -2.324073, 1, 0, 0, 1, 1,
-0.8085937, 0.7664, -0.9985145, 1, 0, 0, 1, 1,
-0.8063904, 2.061942, -0.4666988, 1, 0, 0, 1, 1,
-0.8063651, -0.8886175, -3.332372, 1, 0, 0, 1, 1,
-0.8026675, -1.075112, -2.176098, 1, 0, 0, 1, 1,
-0.7888685, -0.8577035, -3.383268, 0, 0, 0, 1, 1,
-0.7867225, 1.006393, -0.3853907, 0, 0, 0, 1, 1,
-0.7856141, -1.485938, -3.657362, 0, 0, 0, 1, 1,
-0.7855867, -0.3181556, -2.385425, 0, 0, 0, 1, 1,
-0.7815385, -0.7526225, -1.909051, 0, 0, 0, 1, 1,
-0.7810731, -0.8243449, -4.087804, 0, 0, 0, 1, 1,
-0.780423, 1.368473, -0.4195504, 0, 0, 0, 1, 1,
-0.7784352, -0.4421471, -2.055988, 1, 1, 1, 1, 1,
-0.775812, -0.8508459, -2.771784, 1, 1, 1, 1, 1,
-0.7699834, -1.425766, -3.252046, 1, 1, 1, 1, 1,
-0.7691394, -0.8715534, -2.709443, 1, 1, 1, 1, 1,
-0.7653099, -0.07988881, -1.43489, 1, 1, 1, 1, 1,
-0.7608144, 0.7719784, -1.443414, 1, 1, 1, 1, 1,
-0.760483, 0.9060546, -1.570263, 1, 1, 1, 1, 1,
-0.7602655, -1.048033, -3.121437, 1, 1, 1, 1, 1,
-0.7587517, 2.295497, 1.919811, 1, 1, 1, 1, 1,
-0.7569361, 0.5039263, -0.9554299, 1, 1, 1, 1, 1,
-0.753592, -0.1488705, -2.373406, 1, 1, 1, 1, 1,
-0.7528917, 0.8546188, -0.2768125, 1, 1, 1, 1, 1,
-0.7473967, -0.09569375, -2.256373, 1, 1, 1, 1, 1,
-0.7382159, -0.7338501, -0.8981802, 1, 1, 1, 1, 1,
-0.7353442, -0.2879229, -2.914937, 1, 1, 1, 1, 1,
-0.726755, -1.789186, -3.649483, 0, 0, 1, 1, 1,
-0.7259619, -0.3416367, -2.867468, 1, 0, 0, 1, 1,
-0.7226751, -1.127608, -3.630815, 1, 0, 0, 1, 1,
-0.7208465, -1.374994, -2.992501, 1, 0, 0, 1, 1,
-0.7163739, 0.2871438, -2.016716, 1, 0, 0, 1, 1,
-0.7114577, -1.335688, -3.770708, 1, 0, 0, 1, 1,
-0.7021958, -0.6008335, -1.949079, 0, 0, 0, 1, 1,
-0.697903, -0.4091015, -0.8590772, 0, 0, 0, 1, 1,
-0.6954653, -0.1499901, 0.2622204, 0, 0, 0, 1, 1,
-0.6926973, -0.8021123, -1.664573, 0, 0, 0, 1, 1,
-0.690606, -0.2994882, -2.529736, 0, 0, 0, 1, 1,
-0.6880465, 0.9779179, -0.4940708, 0, 0, 0, 1, 1,
-0.6847708, 1.40323, 0.5664712, 0, 0, 0, 1, 1,
-0.6814512, -0.4376297, -2.34195, 1, 1, 1, 1, 1,
-0.6722158, -0.8217299, -3.795553, 1, 1, 1, 1, 1,
-0.6696078, -0.04401917, -3.774683, 1, 1, 1, 1, 1,
-0.6687525, 0.3259873, 0.5827193, 1, 1, 1, 1, 1,
-0.6660036, 0.5911744, -0.42083, 1, 1, 1, 1, 1,
-0.6654065, 0.6802184, -0.05786454, 1, 1, 1, 1, 1,
-0.6635014, -1.27783, -2.079066, 1, 1, 1, 1, 1,
-0.6616557, 0.004515535, -1.593652, 1, 1, 1, 1, 1,
-0.6597849, -0.6966664, -3.537958, 1, 1, 1, 1, 1,
-0.6511089, 1.74939, 0.09206336, 1, 1, 1, 1, 1,
-0.6477084, 0.160383, -1.950164, 1, 1, 1, 1, 1,
-0.6460334, 0.3681081, -0.6077819, 1, 1, 1, 1, 1,
-0.6446065, 2.000343, 0.3945482, 1, 1, 1, 1, 1,
-0.6435173, -0.8080146, -2.579808, 1, 1, 1, 1, 1,
-0.6391369, 2.103605, -0.3122168, 1, 1, 1, 1, 1,
-0.6387662, 0.2403117, -2.915735, 0, 0, 1, 1, 1,
-0.6363785, -0.1709653, -1.193212, 1, 0, 0, 1, 1,
-0.6363201, 0.8593808, 0.6007316, 1, 0, 0, 1, 1,
-0.6287816, 0.199574, -1.653873, 1, 0, 0, 1, 1,
-0.6246522, 0.994714, 0.1996802, 1, 0, 0, 1, 1,
-0.6182404, 0.01065444, -3.088465, 1, 0, 0, 1, 1,
-0.6173674, 1.450664, 0.02282728, 0, 0, 0, 1, 1,
-0.6133485, 0.8138416, -1.815193, 0, 0, 0, 1, 1,
-0.6133124, -1.134512, -2.545872, 0, 0, 0, 1, 1,
-0.6132492, -0.2636876, -2.729555, 0, 0, 0, 1, 1,
-0.6125915, -0.2957274, -1.100474, 0, 0, 0, 1, 1,
-0.6080201, -0.004116047, -0.6365725, 0, 0, 0, 1, 1,
-0.605786, 1.277122, -1.472733, 0, 0, 0, 1, 1,
-0.6055594, 1.027497, 0.2042906, 1, 1, 1, 1, 1,
-0.6002626, 0.6938637, 0.01790853, 1, 1, 1, 1, 1,
-0.5979908, 0.8583916, -1.081582, 1, 1, 1, 1, 1,
-0.5979336, -0.8473756, -2.192852, 1, 1, 1, 1, 1,
-0.5967802, -0.962863, -3.015268, 1, 1, 1, 1, 1,
-0.5913123, -2.159012, -3.352755, 1, 1, 1, 1, 1,
-0.5907806, -0.5509018, -2.5648, 1, 1, 1, 1, 1,
-0.5871811, -0.490323, -3.16688, 1, 1, 1, 1, 1,
-0.5827886, -0.673958, -2.432104, 1, 1, 1, 1, 1,
-0.581907, 0.06586932, -2.617604, 1, 1, 1, 1, 1,
-0.5807201, 0.2086029, -1.797285, 1, 1, 1, 1, 1,
-0.5726777, -0.4378486, -1.373919, 1, 1, 1, 1, 1,
-0.5721592, 0.3107166, -0.1520151, 1, 1, 1, 1, 1,
-0.5614587, -1.687308, -3.65831, 1, 1, 1, 1, 1,
-0.5599156, 0.05219145, -1.576759, 1, 1, 1, 1, 1,
-0.5578045, -0.4665996, -3.171805, 0, 0, 1, 1, 1,
-0.5563434, -2.31341, -3.663012, 1, 0, 0, 1, 1,
-0.5518732, -0.1272149, -1.837822, 1, 0, 0, 1, 1,
-0.540991, -0.7093031, -2.69722, 1, 0, 0, 1, 1,
-0.5383757, 0.7931956, 0.7094573, 1, 0, 0, 1, 1,
-0.5350239, -1.740763, -3.425137, 1, 0, 0, 1, 1,
-0.5306356, 0.3099148, -0.8533118, 0, 0, 0, 1, 1,
-0.5270966, -1.365557, -2.627894, 0, 0, 0, 1, 1,
-0.5266677, 0.3016416, -1.059195, 0, 0, 0, 1, 1,
-0.5260553, 0.2630156, -2.538479, 0, 0, 0, 1, 1,
-0.524695, -1.245915, -4.758725, 0, 0, 0, 1, 1,
-0.5208854, -3.129748, -3.798341, 0, 0, 0, 1, 1,
-0.5153871, -1.033713, -2.042657, 0, 0, 0, 1, 1,
-0.5112257, -1.336228, -0.3163922, 1, 1, 1, 1, 1,
-0.5105532, -0.8896549, -1.03204, 1, 1, 1, 1, 1,
-0.4991028, -1.68706, -2.464766, 1, 1, 1, 1, 1,
-0.4981547, 0.2018915, 1.003811, 1, 1, 1, 1, 1,
-0.4931343, 0.5253364, -0.7923751, 1, 1, 1, 1, 1,
-0.4886934, -1.707571, -2.255051, 1, 1, 1, 1, 1,
-0.4879789, -0.6645681, -2.927157, 1, 1, 1, 1, 1,
-0.4871851, -0.9767734, -3.817002, 1, 1, 1, 1, 1,
-0.4788988, 0.2499304, -1.150694, 1, 1, 1, 1, 1,
-0.475267, -0.3311716, -2.307149, 1, 1, 1, 1, 1,
-0.4745893, 0.9924238, -1.187902, 1, 1, 1, 1, 1,
-0.473381, -0.2480952, -1.543505, 1, 1, 1, 1, 1,
-0.4651499, -0.1808245, -1.362262, 1, 1, 1, 1, 1,
-0.463066, -1.618476, -0.6206219, 1, 1, 1, 1, 1,
-0.460476, -1.006826, -2.474454, 1, 1, 1, 1, 1,
-0.456002, 1.116375, 0.79597, 0, 0, 1, 1, 1,
-0.4526424, -0.5505394, -4.214876, 1, 0, 0, 1, 1,
-0.4499543, 1.921205, -1.542846, 1, 0, 0, 1, 1,
-0.4435708, -0.01430808, -2.618235, 1, 0, 0, 1, 1,
-0.4393194, -1.030476, -4.630595, 1, 0, 0, 1, 1,
-0.4372833, 0.8648032, -0.675535, 1, 0, 0, 1, 1,
-0.4366074, 0.5581393, -0.8769237, 0, 0, 0, 1, 1,
-0.4330502, -0.4450714, -1.923587, 0, 0, 0, 1, 1,
-0.4314968, -0.2471615, -1.389619, 0, 0, 0, 1, 1,
-0.424927, 0.3115419, -2.553194, 0, 0, 0, 1, 1,
-0.4205715, 1.526932, 0.5198848, 0, 0, 0, 1, 1,
-0.4181776, -1.137876, -1.443231, 0, 0, 0, 1, 1,
-0.4178662, 0.0923425, -2.149415, 0, 0, 0, 1, 1,
-0.4172503, -1.790652, -2.365214, 1, 1, 1, 1, 1,
-0.4153325, -1.810546, -4.545555, 1, 1, 1, 1, 1,
-0.4146737, 0.01452371, -1.335764, 1, 1, 1, 1, 1,
-0.4095722, 0.09359723, -0.6090242, 1, 1, 1, 1, 1,
-0.4090909, -0.1058237, -2.85265, 1, 1, 1, 1, 1,
-0.4088799, 1.503047, 1.001268, 1, 1, 1, 1, 1,
-0.4034832, 0.05335671, -0.1923619, 1, 1, 1, 1, 1,
-0.4007499, 1.32338, 0.360011, 1, 1, 1, 1, 1,
-0.4005538, -0.9719556, -2.229205, 1, 1, 1, 1, 1,
-0.3963184, 0.6699521, 0.6606639, 1, 1, 1, 1, 1,
-0.3919317, -1.007228, -2.963627, 1, 1, 1, 1, 1,
-0.3912308, -1.138767, -2.300802, 1, 1, 1, 1, 1,
-0.3909385, -0.07498375, -2.170305, 1, 1, 1, 1, 1,
-0.3862601, 0.1321315, -0.2517845, 1, 1, 1, 1, 1,
-0.3806746, -0.02755598, -1.074497, 1, 1, 1, 1, 1,
-0.3802971, 1.143476, 0.2212564, 0, 0, 1, 1, 1,
-0.3798802, 2.051049, 0.3124937, 1, 0, 0, 1, 1,
-0.3797649, 0.444184, -0.6351237, 1, 0, 0, 1, 1,
-0.378613, 0.7506254, -0.8164017, 1, 0, 0, 1, 1,
-0.3722198, 0.2334282, -0.3850407, 1, 0, 0, 1, 1,
-0.3711122, -0.7266622, -4.1026, 1, 0, 0, 1, 1,
-0.3698498, 1.169187, -0.215004, 0, 0, 0, 1, 1,
-0.3689103, 0.2876735, -1.179857, 0, 0, 0, 1, 1,
-0.368315, -1.251428, -2.731709, 0, 0, 0, 1, 1,
-0.3679923, -0.3567961, -2.363093, 0, 0, 0, 1, 1,
-0.3674265, 0.9283426, 0.0903959, 0, 0, 0, 1, 1,
-0.3658573, -1.372671, -4.571055, 0, 0, 0, 1, 1,
-0.3624459, -1.968148, -1.249319, 0, 0, 0, 1, 1,
-0.3575971, -0.883388, -2.723876, 1, 1, 1, 1, 1,
-0.3531964, 0.2955225, 0.7031658, 1, 1, 1, 1, 1,
-0.3502838, 0.1595138, -0.914861, 1, 1, 1, 1, 1,
-0.3493166, 0.4159331, -0.05759218, 1, 1, 1, 1, 1,
-0.3471643, -2.115467, -1.884545, 1, 1, 1, 1, 1,
-0.346743, 0.1105056, -0.3008409, 1, 1, 1, 1, 1,
-0.3438508, -0.644981, -3.013083, 1, 1, 1, 1, 1,
-0.3396314, 0.3376181, 0.4574525, 1, 1, 1, 1, 1,
-0.3371397, 0.9496405, -2.006478, 1, 1, 1, 1, 1,
-0.3362811, 0.6682148, -1.991624, 1, 1, 1, 1, 1,
-0.3342984, -1.542895, -3.978318, 1, 1, 1, 1, 1,
-0.3337548, -0.1619798, -1.97048, 1, 1, 1, 1, 1,
-0.3318954, -0.06900406, 0.02920978, 1, 1, 1, 1, 1,
-0.3294052, -0.1948322, -1.662294, 1, 1, 1, 1, 1,
-0.3290743, 0.3027598, -0.002718301, 1, 1, 1, 1, 1,
-0.3247089, -0.12359, -0.06090708, 0, 0, 1, 1, 1,
-0.3220539, 0.3791423, -1.576941, 1, 0, 0, 1, 1,
-0.3216582, -0.3115464, -3.909918, 1, 0, 0, 1, 1,
-0.3209987, -0.5225936, -3.34984, 1, 0, 0, 1, 1,
-0.3201133, -0.3895141, -2.077396, 1, 0, 0, 1, 1,
-0.3199558, 0.3729643, -0.2922427, 1, 0, 0, 1, 1,
-0.3197704, 0.6580435, -2.32419, 0, 0, 0, 1, 1,
-0.3136023, -0.5967968, -2.660914, 0, 0, 0, 1, 1,
-0.3133954, -1.290717, -1.696111, 0, 0, 0, 1, 1,
-0.3051224, -0.2975763, -1.023081, 0, 0, 0, 1, 1,
-0.3014495, 1.009617, 0.9087729, 0, 0, 0, 1, 1,
-0.2999096, -0.4014269, -2.560933, 0, 0, 0, 1, 1,
-0.2997597, -0.5600149, -3.258904, 0, 0, 0, 1, 1,
-0.2900817, -0.6359367, -3.255297, 1, 1, 1, 1, 1,
-0.2830883, -0.6350724, -1.906428, 1, 1, 1, 1, 1,
-0.2826951, -1.371771, -3.724445, 1, 1, 1, 1, 1,
-0.2772312, -1.664302, -3.33673, 1, 1, 1, 1, 1,
-0.2768191, 0.6026616, -0.02125462, 1, 1, 1, 1, 1,
-0.2744487, -0.1778863, -1.064539, 1, 1, 1, 1, 1,
-0.2737797, 0.9395414, 1.42817, 1, 1, 1, 1, 1,
-0.2687449, 2.707956, -1.232365, 1, 1, 1, 1, 1,
-0.2669744, 1.06462, -0.3138976, 1, 1, 1, 1, 1,
-0.2663636, -1.062758, -3.119605, 1, 1, 1, 1, 1,
-0.264237, -0.1475889, -3.583899, 1, 1, 1, 1, 1,
-0.2639749, -1.225287, -5.62716, 1, 1, 1, 1, 1,
-0.2584523, -0.003631223, -2.838285, 1, 1, 1, 1, 1,
-0.2577517, -2.089413, -4.173413, 1, 1, 1, 1, 1,
-0.2565854, -0.09858935, -3.165782, 1, 1, 1, 1, 1,
-0.2530689, -0.6505762, -1.638162, 0, 0, 1, 1, 1,
-0.2523313, 0.2213805, -2.867763, 1, 0, 0, 1, 1,
-0.2519678, -0.3187248, -3.702599, 1, 0, 0, 1, 1,
-0.2484314, 1.18336, 0.7003494, 1, 0, 0, 1, 1,
-0.2392088, -0.4346089, -4.779747, 1, 0, 0, 1, 1,
-0.2378895, 0.4055711, -0.7679031, 1, 0, 0, 1, 1,
-0.2315925, 0.257377, 0.2033874, 0, 0, 0, 1, 1,
-0.2280369, 0.7091229, 0.3064187, 0, 0, 0, 1, 1,
-0.2252012, 1.447543, -0.6497604, 0, 0, 0, 1, 1,
-0.2250386, -0.3674983, -2.71559, 0, 0, 0, 1, 1,
-0.2149437, -0.4896539, -2.334785, 0, 0, 0, 1, 1,
-0.2047802, -0.1045882, -1.36872, 0, 0, 0, 1, 1,
-0.2045509, 1.815489, 1.38025, 0, 0, 0, 1, 1,
-0.2013233, -0.08615415, -0.6411408, 1, 1, 1, 1, 1,
-0.1988819, 0.0819708, -1.795092, 1, 1, 1, 1, 1,
-0.1935579, -1.103196, -2.034961, 1, 1, 1, 1, 1,
-0.189506, 1.985475, -0.6857102, 1, 1, 1, 1, 1,
-0.180046, 0.8446512, -1.470477, 1, 1, 1, 1, 1,
-0.1726179, -0.4022767, -2.562297, 1, 1, 1, 1, 1,
-0.1724116, 0.08553021, -2.279488, 1, 1, 1, 1, 1,
-0.1698368, 1.291083, -0.1161661, 1, 1, 1, 1, 1,
-0.1656166, 1.300931, -1.865482, 1, 1, 1, 1, 1,
-0.1634373, -0.9044239, -4.05115, 1, 1, 1, 1, 1,
-0.1631761, 0.3665562, 0.2996334, 1, 1, 1, 1, 1,
-0.1601446, 1.590606, -0.7317203, 1, 1, 1, 1, 1,
-0.1540839, -0.005722809, -0.8786736, 1, 1, 1, 1, 1,
-0.1532835, -0.5080159, -3.197967, 1, 1, 1, 1, 1,
-0.148028, -0.4604459, -4.529411, 1, 1, 1, 1, 1,
-0.1462877, -1.057872, -4.645998, 0, 0, 1, 1, 1,
-0.1437477, 0.7947903, 1.315449, 1, 0, 0, 1, 1,
-0.1340753, 1.686633, -1.288401, 1, 0, 0, 1, 1,
-0.1339773, -1.226504, -3.701415, 1, 0, 0, 1, 1,
-0.1336403, 0.2756386, -1.53342, 1, 0, 0, 1, 1,
-0.1318262, 2.046588, -0.544117, 1, 0, 0, 1, 1,
-0.1257896, 0.9526901, 0.6525721, 0, 0, 0, 1, 1,
-0.1206419, -0.6360468, -2.910225, 0, 0, 0, 1, 1,
-0.1205294, 1.450021, -2.933236, 0, 0, 0, 1, 1,
-0.1205083, 1.904683, 0.9704043, 0, 0, 0, 1, 1,
-0.1190682, 0.1977348, 0.2763611, 0, 0, 0, 1, 1,
-0.1185296, -0.1908599, -1.35166, 0, 0, 0, 1, 1,
-0.1179091, -1.345746, -3.301912, 0, 0, 0, 1, 1,
-0.1173453, -1.944124, -3.856373, 1, 1, 1, 1, 1,
-0.1097304, 1.646865, -1.680733, 1, 1, 1, 1, 1,
-0.1087399, -1.501446, -3.104198, 1, 1, 1, 1, 1,
-0.10623, 0.4656033, 0.7780476, 1, 1, 1, 1, 1,
-0.1039722, -0.01944669, 0.2755023, 1, 1, 1, 1, 1,
-0.1031737, -1.806917, -4.032685, 1, 1, 1, 1, 1,
-0.1012973, 0.04749196, -1.622993, 1, 1, 1, 1, 1,
-0.09898508, -1.069671, -3.815434, 1, 1, 1, 1, 1,
-0.09838521, 0.2902131, 0.2845707, 1, 1, 1, 1, 1,
-0.09776045, -0.2164532, -3.192795, 1, 1, 1, 1, 1,
-0.09500062, 0.220889, -0.4654093, 1, 1, 1, 1, 1,
-0.09497751, 1.541932, -0.9821995, 1, 1, 1, 1, 1,
-0.08280975, 0.618544, 0.8621935, 1, 1, 1, 1, 1,
-0.07434352, 0.391044, -0.1538047, 1, 1, 1, 1, 1,
-0.073847, -2.022025, -2.750698, 1, 1, 1, 1, 1,
-0.07375507, 0.01677387, -1.983719, 0, 0, 1, 1, 1,
-0.0714964, -0.2767608, -3.108682, 1, 0, 0, 1, 1,
-0.06856243, 1.012226, -1.543614, 1, 0, 0, 1, 1,
-0.06635603, 1.225052, 1.174644, 1, 0, 0, 1, 1,
-0.06066983, 0.3510039, -3.132058, 1, 0, 0, 1, 1,
-0.06009382, 1.61421, 0.03890313, 1, 0, 0, 1, 1,
-0.05714094, 0.1759411, -0.1101902, 0, 0, 0, 1, 1,
-0.05106409, -0.02402447, -2.392153, 0, 0, 0, 1, 1,
-0.04959926, 0.9051202, -1.337561, 0, 0, 0, 1, 1,
-0.04827562, -0.2850687, -1.721075, 0, 0, 0, 1, 1,
-0.04377879, 0.2848046, 0.06864537, 0, 0, 0, 1, 1,
-0.04296176, 1.230961, -0.7252578, 0, 0, 0, 1, 1,
-0.0383245, 0.5312741, 0.6870655, 0, 0, 0, 1, 1,
-0.03807964, -0.1973859, -3.337944, 1, 1, 1, 1, 1,
-0.03751828, -0.8526254, -2.626042, 1, 1, 1, 1, 1,
-0.03655761, -0.8853714, -4.164445, 1, 1, 1, 1, 1,
-0.03513918, -0.7050117, -2.720542, 1, 1, 1, 1, 1,
-0.03418904, -0.2379905, -1.366811, 1, 1, 1, 1, 1,
-0.02931753, -1.015857, -1.658998, 1, 1, 1, 1, 1,
-0.02894532, -0.5496691, -3.606859, 1, 1, 1, 1, 1,
-0.02442341, 2.646748, -0.1212006, 1, 1, 1, 1, 1,
-0.02401486, 0.9847835, 1.9804, 1, 1, 1, 1, 1,
-0.02239504, 1.341937, -0.1929498, 1, 1, 1, 1, 1,
-0.01577272, 0.07660857, -0.9781167, 1, 1, 1, 1, 1,
-0.01463519, 0.9030457, -1.211447, 1, 1, 1, 1, 1,
-0.01179417, -0.3261367, -5.629104, 1, 1, 1, 1, 1,
-0.008010542, -0.8196574, -3.792237, 1, 1, 1, 1, 1,
-0.006145967, -0.715773, -2.771148, 1, 1, 1, 1, 1,
-0.005283175, 1.049819, -0.005529822, 0, 0, 1, 1, 1,
-0.005037654, -1.096804, -3.999989, 1, 0, 0, 1, 1,
0.001964512, -0.08015086, 3.538107, 1, 0, 0, 1, 1,
0.01113908, -1.071898, 3.168299, 1, 0, 0, 1, 1,
0.01291975, -0.763597, 4.929848, 1, 0, 0, 1, 1,
0.01651276, -0.1620869, 2.446785, 1, 0, 0, 1, 1,
0.01662298, -0.3961715, 2.825037, 0, 0, 0, 1, 1,
0.01939211, 0.9545649, -0.2725785, 0, 0, 0, 1, 1,
0.01967897, -0.05511509, 3.339381, 0, 0, 0, 1, 1,
0.01992352, -0.9409548, 3.245778, 0, 0, 0, 1, 1,
0.02133757, 0.7451167, -0.2970637, 0, 0, 0, 1, 1,
0.02174273, -0.4171094, 1.445658, 0, 0, 0, 1, 1,
0.0226744, -1.421848, 4.126405, 0, 0, 0, 1, 1,
0.0322708, -1.305248, 4.597926, 1, 1, 1, 1, 1,
0.03233017, -0.6525207, 2.445501, 1, 1, 1, 1, 1,
0.03493781, -0.5199792, 4.265885, 1, 1, 1, 1, 1,
0.04246244, 2.473416, -1.457355, 1, 1, 1, 1, 1,
0.04701917, 1.69222, 0.4108072, 1, 1, 1, 1, 1,
0.04848983, -2.357072, 2.260459, 1, 1, 1, 1, 1,
0.0493895, 0.4432658, 0.7943428, 1, 1, 1, 1, 1,
0.05106219, 1.018556, -0.2477527, 1, 1, 1, 1, 1,
0.05951104, 0.06599718, 0.02056395, 1, 1, 1, 1, 1,
0.06029252, -0.6610506, 2.306293, 1, 1, 1, 1, 1,
0.0602989, 0.3902563, 0.2730015, 1, 1, 1, 1, 1,
0.06101646, 0.8738059, 0.7106081, 1, 1, 1, 1, 1,
0.06409567, -0.5806728, 3.333816, 1, 1, 1, 1, 1,
0.0642739, 1.679312, 0.8976849, 1, 1, 1, 1, 1,
0.06724989, -0.9885982, 2.306443, 1, 1, 1, 1, 1,
0.06782441, -1.503932, 3.443638, 0, 0, 1, 1, 1,
0.06859592, -0.7347996, 3.965114, 1, 0, 0, 1, 1,
0.06924793, 0.03284737, 0.8428609, 1, 0, 0, 1, 1,
0.07595976, 2.003074, -0.6540365, 1, 0, 0, 1, 1,
0.07783473, 0.4170992, 0.8560615, 1, 0, 0, 1, 1,
0.08057809, 0.91474, 0.8968765, 1, 0, 0, 1, 1,
0.08173352, -0.0147386, 4.711319, 0, 0, 0, 1, 1,
0.09204557, 0.2199862, -0.5346457, 0, 0, 0, 1, 1,
0.09251527, 1.166472, -1.060763, 0, 0, 0, 1, 1,
0.09272682, -1.842014, 1.702126, 0, 0, 0, 1, 1,
0.09685513, -0.17446, 3.047191, 0, 0, 0, 1, 1,
0.09781966, 0.5108955, 0.391017, 0, 0, 0, 1, 1,
0.0996415, 0.1115222, 0.7105457, 0, 0, 0, 1, 1,
0.1017946, -0.9643248, 3.824142, 1, 1, 1, 1, 1,
0.1029024, -0.6414374, 2.44176, 1, 1, 1, 1, 1,
0.108365, 1.62282, -0.1427314, 1, 1, 1, 1, 1,
0.1118243, 1.385429, -0.6811813, 1, 1, 1, 1, 1,
0.1139628, -0.3156184, 2.005551, 1, 1, 1, 1, 1,
0.1157515, 0.02366559, 1.937765, 1, 1, 1, 1, 1,
0.1188438, 0.6457989, -1.074476, 1, 1, 1, 1, 1,
0.1227274, -1.488374, 3.276822, 1, 1, 1, 1, 1,
0.1229681, 0.7018086, 0.3939762, 1, 1, 1, 1, 1,
0.1236413, -0.5586962, 2.719899, 1, 1, 1, 1, 1,
0.1243333, 0.7477462, -0.2907389, 1, 1, 1, 1, 1,
0.1274065, 0.5313031, 0.3079151, 1, 1, 1, 1, 1,
0.1306372, 1.279036, -0.9574545, 1, 1, 1, 1, 1,
0.1308863, -0.3708216, 2.730803, 1, 1, 1, 1, 1,
0.1332461, 0.7460731, -0.4854252, 1, 1, 1, 1, 1,
0.1358746, -1.372479, 2.576381, 0, 0, 1, 1, 1,
0.1379783, 0.9958323, 0.8102628, 1, 0, 0, 1, 1,
0.1385996, 1.139507, -0.8631032, 1, 0, 0, 1, 1,
0.1392832, -1.002957, 4.687471, 1, 0, 0, 1, 1,
0.1412787, 2.08459, 0.3865672, 1, 0, 0, 1, 1,
0.1418863, 0.245943, 1.499714, 1, 0, 0, 1, 1,
0.145161, 0.7411696, 0.7269183, 0, 0, 0, 1, 1,
0.1466101, 0.1063366, 0.8252452, 0, 0, 0, 1, 1,
0.1546159, -1.358856, 3.070954, 0, 0, 0, 1, 1,
0.1575829, 0.1384921, 0.1381786, 0, 0, 0, 1, 1,
0.1583528, -0.05929875, 3.022, 0, 0, 0, 1, 1,
0.1595091, -0.5664041, 2.921741, 0, 0, 0, 1, 1,
0.160595, 0.6487834, -0.07959619, 0, 0, 0, 1, 1,
0.1609042, -1.478156, 4.05123, 1, 1, 1, 1, 1,
0.1652482, -0.08844987, 2.447901, 1, 1, 1, 1, 1,
0.1682596, 0.3718074, 0.1494428, 1, 1, 1, 1, 1,
0.1749261, -0.6728132, 3.736012, 1, 1, 1, 1, 1,
0.1750998, 1.653082, -0.8998541, 1, 1, 1, 1, 1,
0.1804243, -0.8144315, 3.68118, 1, 1, 1, 1, 1,
0.1804906, -1.322643, 2.522882, 1, 1, 1, 1, 1,
0.1814144, -0.6265654, 3.006777, 1, 1, 1, 1, 1,
0.1835913, -0.6133811, 2.771571, 1, 1, 1, 1, 1,
0.1840623, -0.4776412, 2.992664, 1, 1, 1, 1, 1,
0.1883972, 0.7876557, 0.2369392, 1, 1, 1, 1, 1,
0.1950903, 0.6469365, -0.4430704, 1, 1, 1, 1, 1,
0.1956073, 0.4156947, 1.176633, 1, 1, 1, 1, 1,
0.1977081, -1.402726, 3.655641, 1, 1, 1, 1, 1,
0.1988324, 1.169621, 0.7263417, 1, 1, 1, 1, 1,
0.1997079, 0.8774379, 0.4970359, 0, 0, 1, 1, 1,
0.2008257, 0.4101187, 0.9255812, 1, 0, 0, 1, 1,
0.2008578, 1.463228, 0.5981447, 1, 0, 0, 1, 1,
0.2029484, 0.5656, -1.003487, 1, 0, 0, 1, 1,
0.2034611, -0.08836028, 3.389354, 1, 0, 0, 1, 1,
0.2047363, 0.3983157, -0.1466929, 1, 0, 0, 1, 1,
0.206431, -1.935163, 4.458205, 0, 0, 0, 1, 1,
0.2079694, -0.8508475, 1.277249, 0, 0, 0, 1, 1,
0.2126023, 0.1131209, 2.813289, 0, 0, 0, 1, 1,
0.214356, -1.129974, 3.266053, 0, 0, 0, 1, 1,
0.2203067, -1.581554, 2.568086, 0, 0, 0, 1, 1,
0.2221269, -0.3883944, 1.349192, 0, 0, 0, 1, 1,
0.2240843, 0.3414706, 0.1386769, 0, 0, 0, 1, 1,
0.2284626, 1.452993, -0.3287705, 1, 1, 1, 1, 1,
0.2311413, -1.024516, 1.603015, 1, 1, 1, 1, 1,
0.2343446, 0.4412406, 1.369779, 1, 1, 1, 1, 1,
0.23462, 1.270715, 0.05895466, 1, 1, 1, 1, 1,
0.2372386, -1.154805, 3.017915, 1, 1, 1, 1, 1,
0.2378576, 0.377079, 2.282656, 1, 1, 1, 1, 1,
0.2386366, -0.01656115, 1.235171, 1, 1, 1, 1, 1,
0.2388054, 0.7230192, 1.402822, 1, 1, 1, 1, 1,
0.2388486, 1.084491, 1.273206, 1, 1, 1, 1, 1,
0.2444203, 0.2281264, -0.1468292, 1, 1, 1, 1, 1,
0.2471924, -1.613755, 5.00862, 1, 1, 1, 1, 1,
0.2513804, 0.1046975, 1.330572, 1, 1, 1, 1, 1,
0.2518796, -1.254539, 3.893433, 1, 1, 1, 1, 1,
0.2570228, 0.08747815, 0.01471105, 1, 1, 1, 1, 1,
0.2582061, 0.4797525, 2.143573, 1, 1, 1, 1, 1,
0.2687151, -0.8054147, 2.96891, 0, 0, 1, 1, 1,
0.2717243, 0.01368467, 1.696859, 1, 0, 0, 1, 1,
0.2734837, -1.098158, 2.91196, 1, 0, 0, 1, 1,
0.2859164, -0.8577594, 3.149683, 1, 0, 0, 1, 1,
0.2904466, 0.4688283, 1.496303, 1, 0, 0, 1, 1,
0.2915019, -0.04948592, 2.49559, 1, 0, 0, 1, 1,
0.2929799, 1.28064, -1.654565, 0, 0, 0, 1, 1,
0.2939925, 0.8275601, -0.2082956, 0, 0, 0, 1, 1,
0.2944818, -1.485255, 2.107574, 0, 0, 0, 1, 1,
0.294876, 0.108082, 1.859933, 0, 0, 0, 1, 1,
0.3050148, -1.762673, 3.400208, 0, 0, 0, 1, 1,
0.3079821, 0.7827601, 0.1954965, 0, 0, 0, 1, 1,
0.3086902, 0.6575879, 1.679471, 0, 0, 0, 1, 1,
0.316906, 1.137592, -0.8950327, 1, 1, 1, 1, 1,
0.3175152, 0.7049714, 0.3296109, 1, 1, 1, 1, 1,
0.3179389, 0.2380138, 1.754121, 1, 1, 1, 1, 1,
0.3225626, 0.8314154, 0.3427108, 1, 1, 1, 1, 1,
0.322911, 1.355053, -0.1132952, 1, 1, 1, 1, 1,
0.3246981, 1.288191, -0.4232856, 1, 1, 1, 1, 1,
0.3279884, -0.2001463, 4.336425, 1, 1, 1, 1, 1,
0.3335052, -0.1091102, 2.030095, 1, 1, 1, 1, 1,
0.3342223, 1.63061, 0.2835389, 1, 1, 1, 1, 1,
0.3364369, 0.362694, -0.3693027, 1, 1, 1, 1, 1,
0.3390358, -0.123187, 0.7840538, 1, 1, 1, 1, 1,
0.3397909, -0.3408221, 2.584053, 1, 1, 1, 1, 1,
0.3412855, 0.8264377, -0.2957978, 1, 1, 1, 1, 1,
0.3429613, 0.512941, 0.9244918, 1, 1, 1, 1, 1,
0.3437051, -0.6643514, 3.081082, 1, 1, 1, 1, 1,
0.3446541, -0.2450086, 2.540032, 0, 0, 1, 1, 1,
0.3490798, -1.670531, 1.373423, 1, 0, 0, 1, 1,
0.349111, 0.6331367, 0.4447695, 1, 0, 0, 1, 1,
0.3494599, -0.9186098, 2.696053, 1, 0, 0, 1, 1,
0.3501259, 0.5245365, 2.188962, 1, 0, 0, 1, 1,
0.3538224, -0.3599968, 2.104748, 1, 0, 0, 1, 1,
0.3564971, -0.6581682, 1.575089, 0, 0, 0, 1, 1,
0.361311, -0.09478582, 4.405205, 0, 0, 0, 1, 1,
0.3616681, 0.9687259, 0.8592806, 0, 0, 0, 1, 1,
0.3637799, 0.3766257, 0.870041, 0, 0, 0, 1, 1,
0.3733162, -0.2760828, 1.92557, 0, 0, 0, 1, 1,
0.3754183, -0.3170614, 3.286494, 0, 0, 0, 1, 1,
0.3765807, 0.8849594, 0.002129013, 0, 0, 0, 1, 1,
0.376708, 0.8971044, -1.047352, 1, 1, 1, 1, 1,
0.3781958, -1.826693, 3.685296, 1, 1, 1, 1, 1,
0.3799682, -1.379132, 4.315137, 1, 1, 1, 1, 1,
0.3857992, 0.8991817, 0.03823514, 1, 1, 1, 1, 1,
0.3880872, 0.6780097, 0.8358722, 1, 1, 1, 1, 1,
0.3928403, -0.3852817, 3.359921, 1, 1, 1, 1, 1,
0.3934676, -0.1460794, 3.31411, 1, 1, 1, 1, 1,
0.3936758, 0.4476451, 2.139308, 1, 1, 1, 1, 1,
0.3977526, 0.189269, 1.142349, 1, 1, 1, 1, 1,
0.3998102, -0.2586575, 3.037708, 1, 1, 1, 1, 1,
0.4031265, -1.049459, 1.564961, 1, 1, 1, 1, 1,
0.4049902, 1.630768, 0.3247668, 1, 1, 1, 1, 1,
0.4067669, -0.8399128, 2.210649, 1, 1, 1, 1, 1,
0.4120313, 0.1977088, 1.596928, 1, 1, 1, 1, 1,
0.4152771, -1.397102, 2.680085, 1, 1, 1, 1, 1,
0.4167808, -0.3795738, 2.99075, 0, 0, 1, 1, 1,
0.4189975, -0.3203418, 1.036089, 1, 0, 0, 1, 1,
0.4196805, -0.4125061, 4.006183, 1, 0, 0, 1, 1,
0.420765, 1.687891, 0.7279482, 1, 0, 0, 1, 1,
0.4211592, 0.3649587, 0.4703128, 1, 0, 0, 1, 1,
0.4249712, -0.09021474, 0.1054014, 1, 0, 0, 1, 1,
0.4256418, -0.3242407, 1.303083, 0, 0, 0, 1, 1,
0.4277969, -0.2507737, 0.3962331, 0, 0, 0, 1, 1,
0.4278427, 0.3890417, 0.06985777, 0, 0, 0, 1, 1,
0.4303102, 1.105935, 0.6971751, 0, 0, 0, 1, 1,
0.4336989, -0.02104376, 1.528822, 0, 0, 0, 1, 1,
0.4351939, -2.531588, 3.376357, 0, 0, 0, 1, 1,
0.4363942, 0.1352569, 3.321728, 0, 0, 0, 1, 1,
0.4369278, -0.6266167, 1.385322, 1, 1, 1, 1, 1,
0.4373382, 0.6026191, 0.4484698, 1, 1, 1, 1, 1,
0.445125, 1.570698, 0.9721369, 1, 1, 1, 1, 1,
0.4471189, 0.256305, 1.231215, 1, 1, 1, 1, 1,
0.44762, 1.345942, -1.398194, 1, 1, 1, 1, 1,
0.4487291, 0.5432725, 2.230607, 1, 1, 1, 1, 1,
0.4506139, 0.2807579, 1.224526, 1, 1, 1, 1, 1,
0.4525781, -0.5296528, 4.098926, 1, 1, 1, 1, 1,
0.4530373, 1.471213, 1.242397, 1, 1, 1, 1, 1,
0.4537829, 0.8598556, 0.8125697, 1, 1, 1, 1, 1,
0.4541942, -1.382761, 1.579487, 1, 1, 1, 1, 1,
0.458095, -0.9566004, 0.8511413, 1, 1, 1, 1, 1,
0.4581237, 0.8486652, 0.8822498, 1, 1, 1, 1, 1,
0.4603178, 0.4682453, 0.5891017, 1, 1, 1, 1, 1,
0.4698073, -1.174874, 1.551654, 1, 1, 1, 1, 1,
0.4860405, 0.1170597, 0.7167759, 0, 0, 1, 1, 1,
0.486323, 0.3626503, 0.7690117, 1, 0, 0, 1, 1,
0.4877032, 0.748163, 0.4512133, 1, 0, 0, 1, 1,
0.4952909, 0.7524936, 0.07730559, 1, 0, 0, 1, 1,
0.4969691, 0.2260457, 3.550437, 1, 0, 0, 1, 1,
0.499507, -0.6750224, 2.393978, 1, 0, 0, 1, 1,
0.5090786, -0.06815042, 2.106187, 0, 0, 0, 1, 1,
0.5159542, -1.02329, 3.450903, 0, 0, 0, 1, 1,
0.517009, 0.09173933, 1.150711, 0, 0, 0, 1, 1,
0.5179412, -0.2856433, 1.963099, 0, 0, 0, 1, 1,
0.5229508, -1.584865, 3.179204, 0, 0, 0, 1, 1,
0.5308047, 0.8407934, 0.6034589, 0, 0, 0, 1, 1,
0.5368293, -0.7695187, 1.21065, 0, 0, 0, 1, 1,
0.5393323, 0.5455616, 0.00625884, 1, 1, 1, 1, 1,
0.5400609, 0.5816824, 0.910738, 1, 1, 1, 1, 1,
0.5440339, 0.167546, 1.181337, 1, 1, 1, 1, 1,
0.5464941, -1.023044, 1.452442, 1, 1, 1, 1, 1,
0.5503271, 1.420009, -2.509838, 1, 1, 1, 1, 1,
0.5514441, -0.1926826, 2.418742, 1, 1, 1, 1, 1,
0.5521426, -0.3304367, 2.195389, 1, 1, 1, 1, 1,
0.554052, 0.2332979, 0.4320718, 1, 1, 1, 1, 1,
0.5553123, 0.7059574, 0.7716092, 1, 1, 1, 1, 1,
0.5577899, -0.2131387, 1.511918, 1, 1, 1, 1, 1,
0.557897, -1.415327, 3.223169, 1, 1, 1, 1, 1,
0.5600296, -0.7912349, 1.552345, 1, 1, 1, 1, 1,
0.5609694, -0.1750487, 0.7932019, 1, 1, 1, 1, 1,
0.5726048, 0.9635983, 1.572981, 1, 1, 1, 1, 1,
0.5767601, -0.4197094, 4.055139, 1, 1, 1, 1, 1,
0.5825894, -0.8383769, 1.173236, 0, 0, 1, 1, 1,
0.5868385, 0.3172922, 0.2740457, 1, 0, 0, 1, 1,
0.5910023, 0.7902785, 0.5478589, 1, 0, 0, 1, 1,
0.5931532, -1.281365, 2.020465, 1, 0, 0, 1, 1,
0.5948818, -0.5792996, 5.333661, 1, 0, 0, 1, 1,
0.5982621, 0.3150423, 0.53713, 1, 0, 0, 1, 1,
0.5994093, -0.06437744, 0.3844569, 0, 0, 0, 1, 1,
0.6107802, -0.5954546, 2.766536, 0, 0, 0, 1, 1,
0.6123931, 0.04250446, 2.329809, 0, 0, 0, 1, 1,
0.6143554, -1.599339, 1.423325, 0, 0, 0, 1, 1,
0.6183309, -0.667613, 3.302685, 0, 0, 0, 1, 1,
0.6201143, -1.462129, 3.195313, 0, 0, 0, 1, 1,
0.6232198, 1.512046, 0.1529872, 0, 0, 0, 1, 1,
0.6268727, -0.009351765, 2.793258, 1, 1, 1, 1, 1,
0.6279305, -0.04173505, 1.454409, 1, 1, 1, 1, 1,
0.6342564, -0.1413842, 1.658914, 1, 1, 1, 1, 1,
0.6380492, 1.331845, 0.6192321, 1, 1, 1, 1, 1,
0.6407304, -1.565314, 1.287449, 1, 1, 1, 1, 1,
0.6449334, -0.6511171, 3.503281, 1, 1, 1, 1, 1,
0.6452481, 0.8499303, 2.513133, 1, 1, 1, 1, 1,
0.6453725, -0.1275294, 2.492701, 1, 1, 1, 1, 1,
0.6460546, 0.342394, 0.8346754, 1, 1, 1, 1, 1,
0.6484113, 0.8151733, 0.4507038, 1, 1, 1, 1, 1,
0.649498, 0.4900917, 0.3759777, 1, 1, 1, 1, 1,
0.6524529, -0.7550537, 4.143791, 1, 1, 1, 1, 1,
0.6532925, -1.721501, 2.821669, 1, 1, 1, 1, 1,
0.6536011, 2.289308, 0.9040186, 1, 1, 1, 1, 1,
0.660744, 0.8109204, 1.131768, 1, 1, 1, 1, 1,
0.6616138, -0.845091, 4.778769, 0, 0, 1, 1, 1,
0.662133, 1.369044, 0.3043606, 1, 0, 0, 1, 1,
0.6622001, 0.8059467, 0.9081107, 1, 0, 0, 1, 1,
0.6643512, 0.09008005, 2.68147, 1, 0, 0, 1, 1,
0.6719767, -0.7003064, 2.413551, 1, 0, 0, 1, 1,
0.673802, 0.7739256, -0.9081941, 1, 0, 0, 1, 1,
0.6839134, -0.3931065, 2.741213, 0, 0, 0, 1, 1,
0.6888384, 1.438771, 1.926797, 0, 0, 0, 1, 1,
0.6895773, -1.037372, 1.523956, 0, 0, 0, 1, 1,
0.692768, -0.3312982, 1.342622, 0, 0, 0, 1, 1,
0.694892, -0.426768, 3.221004, 0, 0, 0, 1, 1,
0.7029753, -0.6786513, 1.777586, 0, 0, 0, 1, 1,
0.7068087, 1.392624, 1.559438, 0, 0, 0, 1, 1,
0.7069782, 1.986148, -0.567661, 1, 1, 1, 1, 1,
0.7106206, 0.3336499, 1.124058, 1, 1, 1, 1, 1,
0.7195027, 0.939544, 0.9675394, 1, 1, 1, 1, 1,
0.7202512, 0.4090608, -0.1918196, 1, 1, 1, 1, 1,
0.7222043, -1.160524, 3.437933, 1, 1, 1, 1, 1,
0.7224098, 0.5371727, 1.572273, 1, 1, 1, 1, 1,
0.7268907, 0.1655152, 0.7629469, 1, 1, 1, 1, 1,
0.7290713, -0.7816761, 2.405184, 1, 1, 1, 1, 1,
0.7312897, -2.340168, 2.925043, 1, 1, 1, 1, 1,
0.73698, 0.1139935, -0.01666412, 1, 1, 1, 1, 1,
0.7416599, 0.2210658, 1.120926, 1, 1, 1, 1, 1,
0.7438457, -0.4577232, 3.596328, 1, 1, 1, 1, 1,
0.7443395, -0.5669193, -0.680249, 1, 1, 1, 1, 1,
0.7452837, 0.3048073, 0.5166535, 1, 1, 1, 1, 1,
0.7456889, -1.445255, 2.924143, 1, 1, 1, 1, 1,
0.7506102, 0.795742, 0.917257, 0, 0, 1, 1, 1,
0.7577672, 0.4429232, 2.121836, 1, 0, 0, 1, 1,
0.7580349, 0.7261604, -1.096071, 1, 0, 0, 1, 1,
0.7617261, -0.775157, 2.428051, 1, 0, 0, 1, 1,
0.7655404, -1.488403, 2.546078, 1, 0, 0, 1, 1,
0.7664554, 0.4915396, -0.04594405, 1, 0, 0, 1, 1,
0.7734284, -0.8603125, 3.068625, 0, 0, 0, 1, 1,
0.7757552, 0.1787637, 1.013096, 0, 0, 0, 1, 1,
0.776544, -0.03766365, 1.928593, 0, 0, 0, 1, 1,
0.7773794, -1.21213, 1.882327, 0, 0, 0, 1, 1,
0.7803699, -0.2211272, 3.273882, 0, 0, 0, 1, 1,
0.7860378, -1.888811, 5.600247, 0, 0, 0, 1, 1,
0.8058564, 2.352126, 2.697135, 0, 0, 0, 1, 1,
0.8069803, 0.01473, 0.5757183, 1, 1, 1, 1, 1,
0.8168156, -0.9504769, 2.975825, 1, 1, 1, 1, 1,
0.8191758, 1.127602, 0.3858574, 1, 1, 1, 1, 1,
0.8246534, -1.992755, 3.346797, 1, 1, 1, 1, 1,
0.824895, 0.5118896, 1.042601, 1, 1, 1, 1, 1,
0.8260434, -1.304786, 1.479304, 1, 1, 1, 1, 1,
0.8274602, -1.124253, 1.965124, 1, 1, 1, 1, 1,
0.8282265, 0.8171531, 1.097869, 1, 1, 1, 1, 1,
0.8373486, -0.7741435, 0.866932, 1, 1, 1, 1, 1,
0.8473927, 0.8258212, 0.82782, 1, 1, 1, 1, 1,
0.8483606, 0.3421725, 1.718758, 1, 1, 1, 1, 1,
0.8553277, 0.001084065, 0.4939557, 1, 1, 1, 1, 1,
0.8578687, 0.1807394, 1.27915, 1, 1, 1, 1, 1,
0.857928, -0.881199, 2.418019, 1, 1, 1, 1, 1,
0.8612458, 1.213229, 0.9151645, 1, 1, 1, 1, 1,
0.8627284, -1.665777, 1.771944, 0, 0, 1, 1, 1,
0.86543, 0.4069827, 0.7967575, 1, 0, 0, 1, 1,
0.8657162, -0.4094267, 0.1222035, 1, 0, 0, 1, 1,
0.8670344, -0.08366296, 2.321681, 1, 0, 0, 1, 1,
0.8672968, -2.618405, 2.782397, 1, 0, 0, 1, 1,
0.8700181, 0.0630022, 2.264393, 1, 0, 0, 1, 1,
0.8840179, 1.540102, 0.7008208, 0, 0, 0, 1, 1,
0.892264, 0.3185357, 0.5489075, 0, 0, 0, 1, 1,
0.8923923, -0.324136, 2.432598, 0, 0, 0, 1, 1,
0.8975282, 0.6051502, 0.4802619, 0, 0, 0, 1, 1,
0.8983046, -0.7252772, 2.041261, 0, 0, 0, 1, 1,
0.9024942, -0.1781285, 1.887607, 0, 0, 0, 1, 1,
0.9034667, 0.007120881, 2.095171, 0, 0, 0, 1, 1,
0.9037154, 0.1554651, 2.905283, 1, 1, 1, 1, 1,
0.9067208, -0.1437085, 1.471441, 1, 1, 1, 1, 1,
0.9074594, 0.9803745, 0.03285709, 1, 1, 1, 1, 1,
0.9092701, 1.954348, 0.8227901, 1, 1, 1, 1, 1,
0.9153482, 0.1943919, 0.571178, 1, 1, 1, 1, 1,
0.9159654, -0.05186274, 0.6779678, 1, 1, 1, 1, 1,
0.9193481, -0.02173508, -0.2089828, 1, 1, 1, 1, 1,
0.9200359, 0.8291385, -0.8334811, 1, 1, 1, 1, 1,
0.9221874, 1.068788, 0.6607272, 1, 1, 1, 1, 1,
0.9228176, 0.6809235, 3.369696, 1, 1, 1, 1, 1,
0.9232903, -0.3154577, 2.726477, 1, 1, 1, 1, 1,
0.9303315, -0.01935454, 1.117904, 1, 1, 1, 1, 1,
0.9306788, 0.4006126, 0.4113395, 1, 1, 1, 1, 1,
0.9327909, -0.3487805, 1.328667, 1, 1, 1, 1, 1,
0.9334552, -0.6212061, 3.160022, 1, 1, 1, 1, 1,
0.9376749, 0.6582965, 0.3792234, 0, 0, 1, 1, 1,
0.9422538, -0.08120985, 1.282058, 1, 0, 0, 1, 1,
0.9499653, 1.004179, 1.466217, 1, 0, 0, 1, 1,
0.950191, -0.6698643, 2.573631, 1, 0, 0, 1, 1,
0.9507232, 1.538859, 1.380811, 1, 0, 0, 1, 1,
0.9534716, 0.2058655, 0.517658, 1, 0, 0, 1, 1,
0.9562322, -1.279409, 2.785507, 0, 0, 0, 1, 1,
0.9576523, 2.05824, 0.2444312, 0, 0, 0, 1, 1,
0.9607866, 1.424463, 1.713973, 0, 0, 0, 1, 1,
0.972037, 0.5022978, 1.630652, 0, 0, 0, 1, 1,
0.980673, -0.4477911, 1.99684, 0, 0, 0, 1, 1,
0.9820318, -0.6037776, -0.3343678, 0, 0, 0, 1, 1,
0.9893644, -0.6303651, 2.547064, 0, 0, 0, 1, 1,
0.9898351, 0.02882702, 1.405036, 1, 1, 1, 1, 1,
0.9947671, 0.2259701, 0.1102403, 1, 1, 1, 1, 1,
0.9965169, 0.8321267, 0.6159644, 1, 1, 1, 1, 1,
1.00643, -1.18916, 1.885013, 1, 1, 1, 1, 1,
1.010734, -0.7358745, 1.168077, 1, 1, 1, 1, 1,
1.012632, 0.765849, 0.06601588, 1, 1, 1, 1, 1,
1.013062, 0.5163312, -0.3736971, 1, 1, 1, 1, 1,
1.013771, 0.6642745, 0.3452391, 1, 1, 1, 1, 1,
1.015562, 0.1334122, 1.668336, 1, 1, 1, 1, 1,
1.016006, -1.011124, 3.924941, 1, 1, 1, 1, 1,
1.019196, 0.6730686, 2.305865, 1, 1, 1, 1, 1,
1.025008, -0.09775119, 2.047907, 1, 1, 1, 1, 1,
1.0277, 0.5970076, -0.03856086, 1, 1, 1, 1, 1,
1.029377, -0.2652856, 2.914646, 1, 1, 1, 1, 1,
1.034327, 1.148724, 1.494744, 1, 1, 1, 1, 1,
1.037097, -0.08259976, 1.341625, 0, 0, 1, 1, 1,
1.042546, 1.46041, -0.454177, 1, 0, 0, 1, 1,
1.047248, -0.5182879, 1.558859, 1, 0, 0, 1, 1,
1.05721, 0.623711, 2.738358, 1, 0, 0, 1, 1,
1.058071, 1.131461, 2.517813, 1, 0, 0, 1, 1,
1.068202, -0.3597631, 1.956531, 1, 0, 0, 1, 1,
1.083769, -0.2170906, -0.0469413, 0, 0, 0, 1, 1,
1.086679, 1.242882, 3.13063, 0, 0, 0, 1, 1,
1.091834, -0.5716671, 2.888762, 0, 0, 0, 1, 1,
1.092269, 1.735482, -0.6722782, 0, 0, 0, 1, 1,
1.092414, -1.313918, 1.989908, 0, 0, 0, 1, 1,
1.096599, -0.120165, 1.282563, 0, 0, 0, 1, 1,
1.097885, -0.1455061, 1.510147, 0, 0, 0, 1, 1,
1.098531, 0.2381998, 1.442996, 1, 1, 1, 1, 1,
1.100126, -0.1572151, 1.923591, 1, 1, 1, 1, 1,
1.10589, 0.5160713, 0.5227786, 1, 1, 1, 1, 1,
1.108276, -1.03489, 2.346624, 1, 1, 1, 1, 1,
1.109232, -1.048647, 4.076605, 1, 1, 1, 1, 1,
1.112095, 1.080498, -0.05901672, 1, 1, 1, 1, 1,
1.119232, -1.648183, 2.417897, 1, 1, 1, 1, 1,
1.119419, -0.4540329, 0.9414899, 1, 1, 1, 1, 1,
1.122691, 0.7759933, 0.09559577, 1, 1, 1, 1, 1,
1.133772, 0.04839256, 2.604591, 1, 1, 1, 1, 1,
1.144861, -0.9497814, 3.251205, 1, 1, 1, 1, 1,
1.146038, 0.01836199, 2.330047, 1, 1, 1, 1, 1,
1.158181, -1.000401, 4.691034, 1, 1, 1, 1, 1,
1.169312, 0.7057047, -0.5043337, 1, 1, 1, 1, 1,
1.179015, 1.45668, 0.06364723, 1, 1, 1, 1, 1,
1.179729, -0.6783296, 2.527941, 0, 0, 1, 1, 1,
1.1807, -1.336155, 2.493463, 1, 0, 0, 1, 1,
1.181141, 0.006323949, 0.1867671, 1, 0, 0, 1, 1,
1.181228, -0.2391768, 2.564441, 1, 0, 0, 1, 1,
1.182992, 0.6683934, 1.3476, 1, 0, 0, 1, 1,
1.18412, -1.159742, 2.705734, 1, 0, 0, 1, 1,
1.185505, -0.8898922, 0.6117651, 0, 0, 0, 1, 1,
1.195303, -0.9035912, 4.22133, 0, 0, 0, 1, 1,
1.201922, -0.5867143, 0.03140321, 0, 0, 0, 1, 1,
1.223649, 1.153157, -1.770333, 0, 0, 0, 1, 1,
1.227685, 0.198581, 1.800224, 0, 0, 0, 1, 1,
1.231575, -0.2433726, 1.668723, 0, 0, 0, 1, 1,
1.23212, 0.9630926, 0.8464905, 0, 0, 0, 1, 1,
1.233978, 0.6324731, 2.553655, 1, 1, 1, 1, 1,
1.235821, -0.2473225, 0.9150589, 1, 1, 1, 1, 1,
1.236231, 0.306619, 1.695841, 1, 1, 1, 1, 1,
1.237958, 0.7703819, -1.571665, 1, 1, 1, 1, 1,
1.239381, 0.3764084, 2.790746, 1, 1, 1, 1, 1,
1.246538, 1.4337, 0.8799822, 1, 1, 1, 1, 1,
1.256497, -0.3227957, 1.522536, 1, 1, 1, 1, 1,
1.260678, -1.613226, 1.503861, 1, 1, 1, 1, 1,
1.264648, -0.6276099, 1.57111, 1, 1, 1, 1, 1,
1.268168, 0.3561222, -0.3608122, 1, 1, 1, 1, 1,
1.272896, -1.073717, 1.719288, 1, 1, 1, 1, 1,
1.273078, -0.6121252, 0.8264223, 1, 1, 1, 1, 1,
1.273454, -0.1519181, -0.1405697, 1, 1, 1, 1, 1,
1.278398, 0.6444112, 1.180205, 1, 1, 1, 1, 1,
1.280114, 0.07510104, 1.515265, 1, 1, 1, 1, 1,
1.280869, 1.833084, 1.06957, 0, 0, 1, 1, 1,
1.281378, -0.4252245, 0.884149, 1, 0, 0, 1, 1,
1.296017, -2.542015, 3.388625, 1, 0, 0, 1, 1,
1.297042, 1.865117, 1.186951, 1, 0, 0, 1, 1,
1.311496, -0.6011681, 3.757819, 1, 0, 0, 1, 1,
1.312142, -0.9640798, 1.958439, 1, 0, 0, 1, 1,
1.312984, 1.319931, 1.45693, 0, 0, 0, 1, 1,
1.313895, -0.4043574, 3.400613, 0, 0, 0, 1, 1,
1.318261, 0.1222485, 1.585735, 0, 0, 0, 1, 1,
1.318526, 0.6049989, 1.104919, 0, 0, 0, 1, 1,
1.32076, 0.5944474, 1.1532, 0, 0, 0, 1, 1,
1.33166, -1.015397, 1.789132, 0, 0, 0, 1, 1,
1.332371, 1.0677, 0.9403585, 0, 0, 0, 1, 1,
1.334432, 1.36556, 1.902028, 1, 1, 1, 1, 1,
1.343225, 1.698468, 1.418903, 1, 1, 1, 1, 1,
1.346287, 1.109096, 1.919815, 1, 1, 1, 1, 1,
1.355187, -1.228798, 0.4700353, 1, 1, 1, 1, 1,
1.361848, -0.06779444, 1.045064, 1, 1, 1, 1, 1,
1.362028, -1.331748, 3.307926, 1, 1, 1, 1, 1,
1.362384, 0.2227415, 1.559526, 1, 1, 1, 1, 1,
1.367398, 0.2647447, 1.992908, 1, 1, 1, 1, 1,
1.373437, -0.12813, -0.1486092, 1, 1, 1, 1, 1,
1.381755, -1.430187, 2.001997, 1, 1, 1, 1, 1,
1.39576, 1.084452, 1.132908, 1, 1, 1, 1, 1,
1.408256, -0.1770225, 3.485403, 1, 1, 1, 1, 1,
1.409106, 1.439124, 1.7111, 1, 1, 1, 1, 1,
1.413438, -0.8729954, 1.475534, 1, 1, 1, 1, 1,
1.413528, 0.624624, 1.133538, 1, 1, 1, 1, 1,
1.415833, -0.2429096, 0.2714544, 0, 0, 1, 1, 1,
1.422267, -0.5646442, 3.175864, 1, 0, 0, 1, 1,
1.425707, 0.4334034, 1.649483, 1, 0, 0, 1, 1,
1.430308, 1.198915, 1.620812, 1, 0, 0, 1, 1,
1.43444, -0.2282671, 0.1069731, 1, 0, 0, 1, 1,
1.445192, -0.06213264, 2.779988, 1, 0, 0, 1, 1,
1.446328, 0.4765961, 0.1140633, 0, 0, 0, 1, 1,
1.450909, -1.803102, 1.512769, 0, 0, 0, 1, 1,
1.465416, 1.53144, 2.972007, 0, 0, 0, 1, 1,
1.471232, 0.398902, -0.2231212, 0, 0, 0, 1, 1,
1.471521, 1.747333, -0.343977, 0, 0, 0, 1, 1,
1.484614, 1.96717, -0.6127421, 0, 0, 0, 1, 1,
1.486606, -1.385245, 2.348192, 0, 0, 0, 1, 1,
1.487638, -1.226157, 1.508357, 1, 1, 1, 1, 1,
1.489145, -0.3473625, 0.993695, 1, 1, 1, 1, 1,
1.503954, -0.3746063, 2.293506, 1, 1, 1, 1, 1,
1.50403, -0.3045529, 0.2934869, 1, 1, 1, 1, 1,
1.505115, 0.2588238, 0.5496036, 1, 1, 1, 1, 1,
1.539075, -0.9611143, 1.707997, 1, 1, 1, 1, 1,
1.539123, 0.5226687, 0.5475969, 1, 1, 1, 1, 1,
1.544842, 0.7096421, 1.545313, 1, 1, 1, 1, 1,
1.547698, 0.4568359, 1.906554, 1, 1, 1, 1, 1,
1.563106, -1.568861, 3.472023, 1, 1, 1, 1, 1,
1.584127, -0.1225894, 1.318818, 1, 1, 1, 1, 1,
1.59063, 1.122591, 2.083112, 1, 1, 1, 1, 1,
1.599358, -0.4097066, 1.368012, 1, 1, 1, 1, 1,
1.599558, 0.7513865, 1.096077, 1, 1, 1, 1, 1,
1.603911, 0.08443626, 1.081273, 1, 1, 1, 1, 1,
1.609726, 1.293282, 2.022882, 0, 0, 1, 1, 1,
1.618848, 0.1912544, 1.045113, 1, 0, 0, 1, 1,
1.619185, -0.605652, 1.967152, 1, 0, 0, 1, 1,
1.657525, 0.8720689, 1.416946, 1, 0, 0, 1, 1,
1.658174, -0.2015037, 1.65588, 1, 0, 0, 1, 1,
1.674299, 1.046762, 0.3236862, 1, 0, 0, 1, 1,
1.675057, -2.281099, 2.750356, 0, 0, 0, 1, 1,
1.694658, 1.886001, 1.034688, 0, 0, 0, 1, 1,
1.749983, 1.327374, -0.4840278, 0, 0, 0, 1, 1,
1.756751, 1.428519, 1.809476, 0, 0, 0, 1, 1,
1.772309, 0.4132019, 0.02183142, 0, 0, 0, 1, 1,
1.774119, 0.5517877, 1.217484, 0, 0, 0, 1, 1,
1.780741, 0.1548071, 0.1061263, 0, 0, 0, 1, 1,
1.787037, 0.7876899, 0.7540775, 1, 1, 1, 1, 1,
1.837072, 1.755244, 0.2139053, 1, 1, 1, 1, 1,
1.842823, 0.1693364, 0.6647689, 1, 1, 1, 1, 1,
1.845564, 1.769193, 0.4840263, 1, 1, 1, 1, 1,
1.854429, 0.4222911, -0.4007154, 1, 1, 1, 1, 1,
1.875074, -0.5535415, 2.071052, 1, 1, 1, 1, 1,
1.881294, 1.347836, 1.901267, 1, 1, 1, 1, 1,
1.89221, 0.9968995, 1.257394, 1, 1, 1, 1, 1,
1.96327, -0.9621779, 1.974187, 1, 1, 1, 1, 1,
1.964932, -0.6767975, 2.124255, 1, 1, 1, 1, 1,
1.969487, 1.568055, 0.06501254, 1, 1, 1, 1, 1,
2.097171, 2.723148, 0.8871308, 1, 1, 1, 1, 1,
2.108403, -2.040129, 1.761923, 1, 1, 1, 1, 1,
2.110313, 0.845315, 0.8086563, 1, 1, 1, 1, 1,
2.116181, -0.6108162, 0.9230905, 1, 1, 1, 1, 1,
2.136949, -0.3271012, 1.014116, 0, 0, 1, 1, 1,
2.142645, 1.676972, 1.76236, 1, 0, 0, 1, 1,
2.155085, 0.3352534, 2.087361, 1, 0, 0, 1, 1,
2.236576, -0.9176086, 2.761512, 1, 0, 0, 1, 1,
2.284466, 0.2049941, 2.272393, 1, 0, 0, 1, 1,
2.287341, 0.5314299, 1.264227, 1, 0, 0, 1, 1,
2.300424, -1.097317, 3.049068, 0, 0, 0, 1, 1,
2.33719, -0.2669357, 2.425238, 0, 0, 0, 1, 1,
2.34411, 0.829083, 0.416816, 0, 0, 0, 1, 1,
2.344969, 1.592698, 0.5290284, 0, 0, 0, 1, 1,
2.382357, -1.233074, 3.800465, 0, 0, 0, 1, 1,
2.458833, -0.598538, 2.148271, 0, 0, 0, 1, 1,
2.526364, 2.086395, -1.136001, 0, 0, 0, 1, 1,
2.69788, 0.6565971, 1.590493, 1, 1, 1, 1, 1,
2.716217, -1.34466, 1.818685, 1, 1, 1, 1, 1,
2.972204, 0.8302943, 1.097768, 1, 1, 1, 1, 1,
3.083039, -0.8224846, 3.185734, 1, 1, 1, 1, 1,
3.23861, -0.62198, 1.44196, 1, 1, 1, 1, 1,
3.521188, 1.17837, 1.734897, 1, 1, 1, 1, 1,
3.740078, -0.1812432, 2.920438, 1, 1, 1, 1, 1
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
var radius = 9.896796;
var distance = 34.76207;
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
mvMatrix.translate( -0.07353187, 0.2033, 0.01442838 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76207);
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
