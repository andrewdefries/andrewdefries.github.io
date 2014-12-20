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
-3.284451, -0.5900027, -2.903801, 1, 0, 0, 1,
-3.054218, 0.1337851, -0.9361964, 1, 0.007843138, 0, 1,
-2.821486, 0.166168, 1.019489, 1, 0.01176471, 0, 1,
-2.661654, -1.172261, -1.665444, 1, 0.01960784, 0, 1,
-2.600926, -0.2741893, -2.309486, 1, 0.02352941, 0, 1,
-2.583097, -1.701057, -0.5964953, 1, 0.03137255, 0, 1,
-2.537145, -0.2471719, -1.659425, 1, 0.03529412, 0, 1,
-2.406597, -0.2968366, -0.4798348, 1, 0.04313726, 0, 1,
-2.278456, 0.2415623, -0.869971, 1, 0.04705882, 0, 1,
-2.244684, 1.416701, -1.690123, 1, 0.05490196, 0, 1,
-2.215927, 1.419571, -0.2538801, 1, 0.05882353, 0, 1,
-2.199049, 0.34036, -2.563077, 1, 0.06666667, 0, 1,
-2.121783, 0.2004033, -1.012821, 1, 0.07058824, 0, 1,
-2.116405, 0.3907824, 0.09932551, 1, 0.07843138, 0, 1,
-2.107119, 0.253988, -2.448642, 1, 0.08235294, 0, 1,
-2.062716, 1.42719, -0.3217601, 1, 0.09019608, 0, 1,
-2.057405, -0.691183, -1.50727, 1, 0.09411765, 0, 1,
-2.042893, 1.233164, -0.4143347, 1, 0.1019608, 0, 1,
-2.018153, 1.371962, -1.635634, 1, 0.1098039, 0, 1,
-2.008333, 0.4510092, -2.176667, 1, 0.1137255, 0, 1,
-1.977199, 1.127876, 0.2981238, 1, 0.1215686, 0, 1,
-1.976412, 1.338852, -2.206459, 1, 0.1254902, 0, 1,
-1.968054, -0.8351401, -1.202551, 1, 0.1333333, 0, 1,
-1.958789, 0.7165416, -2.384669, 1, 0.1372549, 0, 1,
-1.929975, 1.451401, -1.177504, 1, 0.145098, 0, 1,
-1.919196, 1.515144, 0.2247617, 1, 0.1490196, 0, 1,
-1.875764, -0.53117, -1.426225, 1, 0.1568628, 0, 1,
-1.875156, -0.7805744, -0.5054452, 1, 0.1607843, 0, 1,
-1.848196, -1.813601, -0.5936425, 1, 0.1686275, 0, 1,
-1.845469, 0.8712699, -1.494371, 1, 0.172549, 0, 1,
-1.829166, -0.5492201, -1.873454, 1, 0.1803922, 0, 1,
-1.818938, 0.2095677, -2.628909, 1, 0.1843137, 0, 1,
-1.816734, -1.728781, -1.18912, 1, 0.1921569, 0, 1,
-1.813125, -1.237056, -1.503832, 1, 0.1960784, 0, 1,
-1.810648, -2.34843, -3.959052, 1, 0.2039216, 0, 1,
-1.807736, 0.1500854, -0.6686108, 1, 0.2117647, 0, 1,
-1.795557, -1.011184, -0.924872, 1, 0.2156863, 0, 1,
-1.794029, -0.3986225, -1.942599, 1, 0.2235294, 0, 1,
-1.775118, 0.2890593, -0.2230175, 1, 0.227451, 0, 1,
-1.76884, 1.114866, -1.042809, 1, 0.2352941, 0, 1,
-1.755573, -0.4882294, -1.456677, 1, 0.2392157, 0, 1,
-1.750842, -0.3403217, -2.497768, 1, 0.2470588, 0, 1,
-1.745514, 0.7295296, -1.21556, 1, 0.2509804, 0, 1,
-1.744713, 1.400216, -1.031482, 1, 0.2588235, 0, 1,
-1.743949, 0.5629843, 0.26859, 1, 0.2627451, 0, 1,
-1.74177, -0.1930836, -1.41148, 1, 0.2705882, 0, 1,
-1.724104, 0.422141, -0.9680899, 1, 0.2745098, 0, 1,
-1.722584, -1.36418, -2.662838, 1, 0.282353, 0, 1,
-1.689785, 0.8456207, -0.551752, 1, 0.2862745, 0, 1,
-1.685297, -0.286602, -1.980663, 1, 0.2941177, 0, 1,
-1.668904, -0.6789457, -1.741244, 1, 0.3019608, 0, 1,
-1.667635, -2.20216, -4.188963, 1, 0.3058824, 0, 1,
-1.651641, 2.366631, 1.588561, 1, 0.3137255, 0, 1,
-1.644689, 1.008246, 0.6973189, 1, 0.3176471, 0, 1,
-1.64003, -0.379831, -3.173487, 1, 0.3254902, 0, 1,
-1.631556, 1.964743, 0.2078413, 1, 0.3294118, 0, 1,
-1.630901, 0.6676417, -1.764378, 1, 0.3372549, 0, 1,
-1.630074, 1.111498, -1.418921, 1, 0.3411765, 0, 1,
-1.617393, 0.2276021, -0.787854, 1, 0.3490196, 0, 1,
-1.588127, -0.7886118, -0.3218665, 1, 0.3529412, 0, 1,
-1.578962, -1.783857, -2.592493, 1, 0.3607843, 0, 1,
-1.565048, 0.6779464, -2.896894, 1, 0.3647059, 0, 1,
-1.563933, -1.587246, -1.534652, 1, 0.372549, 0, 1,
-1.558312, 0.6392378, -1.385705, 1, 0.3764706, 0, 1,
-1.554008, 2.661062, 1.31601, 1, 0.3843137, 0, 1,
-1.544667, -0.1300851, 0.00352502, 1, 0.3882353, 0, 1,
-1.539266, -1.474953, -2.904438, 1, 0.3960784, 0, 1,
-1.531639, -0.02221856, -0.9167625, 1, 0.4039216, 0, 1,
-1.526845, 0.7984819, -0.5815228, 1, 0.4078431, 0, 1,
-1.525368, 0.7288701, -1.734417, 1, 0.4156863, 0, 1,
-1.520142, 0.4370712, -0.4585086, 1, 0.4196078, 0, 1,
-1.515794, -0.7758892, -3.099606, 1, 0.427451, 0, 1,
-1.514414, 0.7695207, -1.264847, 1, 0.4313726, 0, 1,
-1.512474, -2.440154, -2.539672, 1, 0.4392157, 0, 1,
-1.498181, -2.602434, -1.843257, 1, 0.4431373, 0, 1,
-1.495289, 0.9634464, 0.2536647, 1, 0.4509804, 0, 1,
-1.487972, 1.129813, -0.3367508, 1, 0.454902, 0, 1,
-1.485637, 0.05629331, -3.705271, 1, 0.4627451, 0, 1,
-1.484302, 0.9225572, -1.389613, 1, 0.4666667, 0, 1,
-1.479658, -0.5028549, -1.350438, 1, 0.4745098, 0, 1,
-1.465606, 0.02372034, -0.2767637, 1, 0.4784314, 0, 1,
-1.460666, 0.8378749, -1.339033, 1, 0.4862745, 0, 1,
-1.453833, -0.4425871, -2.492113, 1, 0.4901961, 0, 1,
-1.451092, -0.5373445, -1.418894, 1, 0.4980392, 0, 1,
-1.45058, 0.05036196, -3.116979, 1, 0.5058824, 0, 1,
-1.44482, -0.1177827, 0.09817424, 1, 0.509804, 0, 1,
-1.440127, 0.6723812, -1.360266, 1, 0.5176471, 0, 1,
-1.427293, -0.1785053, -2.329159, 1, 0.5215687, 0, 1,
-1.421904, -1.883948, -2.033576, 1, 0.5294118, 0, 1,
-1.419344, 0.3367212, -2.009285, 1, 0.5333334, 0, 1,
-1.417862, -1.106286, -1.3981, 1, 0.5411765, 0, 1,
-1.412932, -0.8136474, -2.074516, 1, 0.5450981, 0, 1,
-1.387284, -0.5645794, -2.856894, 1, 0.5529412, 0, 1,
-1.380752, -0.5368618, -1.435934, 1, 0.5568628, 0, 1,
-1.375331, -1.173767, -1.167631, 1, 0.5647059, 0, 1,
-1.365115, 1.452725, 0.03753751, 1, 0.5686275, 0, 1,
-1.351584, -1.094897, -4.055331, 1, 0.5764706, 0, 1,
-1.347033, 0.5435033, -2.248601, 1, 0.5803922, 0, 1,
-1.346262, -0.06826446, -1.280497, 1, 0.5882353, 0, 1,
-1.344694, -1.953694, -1.467054, 1, 0.5921569, 0, 1,
-1.34409, -0.3597331, -3.08749, 1, 0.6, 0, 1,
-1.338446, -1.372059, -1.956784, 1, 0.6078432, 0, 1,
-1.305163, 0.3585661, 0.4120696, 1, 0.6117647, 0, 1,
-1.303178, 1.06883, -1.627652, 1, 0.6196079, 0, 1,
-1.301345, 1.396533, -0.9332234, 1, 0.6235294, 0, 1,
-1.297801, -0.8836091, -2.313133, 1, 0.6313726, 0, 1,
-1.296129, -0.0581396, -0.7665486, 1, 0.6352941, 0, 1,
-1.295545, -1.436688, -2.756181, 1, 0.6431373, 0, 1,
-1.291243, 0.3283086, -2.458969, 1, 0.6470588, 0, 1,
-1.284273, 2.293047, -2.259405, 1, 0.654902, 0, 1,
-1.281549, 1.068917, -0.590595, 1, 0.6588235, 0, 1,
-1.262, -2.347528, -2.260626, 1, 0.6666667, 0, 1,
-1.251506, 0.2770742, -1.365399, 1, 0.6705883, 0, 1,
-1.247074, -0.3653657, 1.117678, 1, 0.6784314, 0, 1,
-1.229617, -0.9224629, -1.216818, 1, 0.682353, 0, 1,
-1.216934, -0.520529, -2.042032, 1, 0.6901961, 0, 1,
-1.212036, 0.6207153, -2.062842, 1, 0.6941177, 0, 1,
-1.209555, -1.148495, -0.8099045, 1, 0.7019608, 0, 1,
-1.19616, 1.334631, 0.9841251, 1, 0.7098039, 0, 1,
-1.196101, -2.451574, -2.25047, 1, 0.7137255, 0, 1,
-1.195379, -1.601689, -3.568612, 1, 0.7215686, 0, 1,
-1.193424, -0.5562411, -1.627418, 1, 0.7254902, 0, 1,
-1.186819, 1.477865, -1.024941, 1, 0.7333333, 0, 1,
-1.184434, 0.4388361, -0.5076154, 1, 0.7372549, 0, 1,
-1.180559, -0.9666038, -1.886124, 1, 0.7450981, 0, 1,
-1.17787, -2.246395, -2.874798, 1, 0.7490196, 0, 1,
-1.177262, 0.7962109, -0.6361766, 1, 0.7568628, 0, 1,
-1.174181, 1.836814, 0.4490611, 1, 0.7607843, 0, 1,
-1.171217, -0.6908874, -3.326117, 1, 0.7686275, 0, 1,
-1.168241, 1.988253, -1.396353, 1, 0.772549, 0, 1,
-1.163212, -1.153064, -3.365224, 1, 0.7803922, 0, 1,
-1.154005, -0.3115967, -3.876361, 1, 0.7843137, 0, 1,
-1.146223, -1.878063, -0.7552477, 1, 0.7921569, 0, 1,
-1.129189, 0.3088129, -0.6414883, 1, 0.7960784, 0, 1,
-1.118786, -2.035139, -4.373797, 1, 0.8039216, 0, 1,
-1.116658, 1.198924, 0.01837943, 1, 0.8117647, 0, 1,
-1.111747, 1.93302, -2.514699, 1, 0.8156863, 0, 1,
-1.109487, 0.6971838, -3.019801, 1, 0.8235294, 0, 1,
-1.109297, -0.1553938, -0.9435545, 1, 0.827451, 0, 1,
-1.108637, 0.4417619, -0.5412627, 1, 0.8352941, 0, 1,
-1.095175, 0.3395287, -0.9402187, 1, 0.8392157, 0, 1,
-1.083336, 0.4466838, -0.1930668, 1, 0.8470588, 0, 1,
-1.079635, 1.437043, -1.822194, 1, 0.8509804, 0, 1,
-1.066747, -0.4958624, -0.7125226, 1, 0.8588235, 0, 1,
-1.065662, 0.8285075, -2.262033, 1, 0.8627451, 0, 1,
-1.065211, 1.56836, -1.480285, 1, 0.8705882, 0, 1,
-1.060173, -0.4017007, -2.540148, 1, 0.8745098, 0, 1,
-1.059553, 0.3340043, -2.939276, 1, 0.8823529, 0, 1,
-1.057714, -0.2620572, -2.65603, 1, 0.8862745, 0, 1,
-1.055612, -2.99724, -3.369991, 1, 0.8941177, 0, 1,
-1.04958, 0.6730687, -0.07045469, 1, 0.8980392, 0, 1,
-1.04683, 0.5482749, -1.158924, 1, 0.9058824, 0, 1,
-1.044453, -0.1118173, -0.5859146, 1, 0.9137255, 0, 1,
-1.031871, 1.132229, -1.607663, 1, 0.9176471, 0, 1,
-1.029876, -1.176133, -3.086901, 1, 0.9254902, 0, 1,
-1.025264, -0.3709319, -1.098749, 1, 0.9294118, 0, 1,
-1.025069, -0.1126287, 0.08163851, 1, 0.9372549, 0, 1,
-1.020098, -1.516248, -3.194906, 1, 0.9411765, 0, 1,
-1.016302, 0.746232, -1.298711, 1, 0.9490196, 0, 1,
-1.015727, -0.1691465, -1.439433, 1, 0.9529412, 0, 1,
-1.003401, -1.300647, -4.348417, 1, 0.9607843, 0, 1,
-0.9974657, -1.266221, -1.999043, 1, 0.9647059, 0, 1,
-0.9962605, 1.633079, 0.1592534, 1, 0.972549, 0, 1,
-0.9878467, 0.489845, -2.334761, 1, 0.9764706, 0, 1,
-0.9828771, 0.9550222, 0.5347489, 1, 0.9843137, 0, 1,
-0.9766735, 0.2202102, -1.343732, 1, 0.9882353, 0, 1,
-0.9719359, -0.2368347, -0.8329023, 1, 0.9960784, 0, 1,
-0.964821, -1.641107, -3.713549, 0.9960784, 1, 0, 1,
-0.9641409, 0.2954687, 0.4001024, 0.9921569, 1, 0, 1,
-0.9607247, 0.2799423, 0.9573978, 0.9843137, 1, 0, 1,
-0.9569451, 0.3609152, -0.6620678, 0.9803922, 1, 0, 1,
-0.9519826, -0.1361944, -1.241297, 0.972549, 1, 0, 1,
-0.9490694, 0.764199, 0.3815875, 0.9686275, 1, 0, 1,
-0.9374778, 1.21884, -0.2012224, 0.9607843, 1, 0, 1,
-0.9367263, -0.2017263, -0.986537, 0.9568627, 1, 0, 1,
-0.9258986, -1.578376, -2.745544, 0.9490196, 1, 0, 1,
-0.9126451, -0.297052, -1.094376, 0.945098, 1, 0, 1,
-0.9080454, -0.7957336, -3.616125, 0.9372549, 1, 0, 1,
-0.8986009, 0.6577936, -2.267196, 0.9333333, 1, 0, 1,
-0.8978741, 1.603468, 0.1113275, 0.9254902, 1, 0, 1,
-0.8875666, -0.4356316, -3.075834, 0.9215686, 1, 0, 1,
-0.886355, 0.8208694, 0.5910972, 0.9137255, 1, 0, 1,
-0.8849477, -0.3735453, 0.06225159, 0.9098039, 1, 0, 1,
-0.8843528, 0.6761629, -1.270175, 0.9019608, 1, 0, 1,
-0.8835004, -0.09138089, -3.283225, 0.8941177, 1, 0, 1,
-0.8822942, -0.1472998, -1.526439, 0.8901961, 1, 0, 1,
-0.8790736, -0.1707102, -1.48797, 0.8823529, 1, 0, 1,
-0.8785065, -1.16682, -2.071787, 0.8784314, 1, 0, 1,
-0.873255, -0.7596275, -2.898364, 0.8705882, 1, 0, 1,
-0.8723536, -0.3999879, -1.616342, 0.8666667, 1, 0, 1,
-0.8668502, 1.445702, -1.649066, 0.8588235, 1, 0, 1,
-0.8582979, 1.124848, -0.01372285, 0.854902, 1, 0, 1,
-0.8541938, -0.8498021, -3.302287, 0.8470588, 1, 0, 1,
-0.852837, 0.7609979, -1.401592, 0.8431373, 1, 0, 1,
-0.8518149, -0.4800573, -1.085488, 0.8352941, 1, 0, 1,
-0.8508475, -0.7265441, -2.584869, 0.8313726, 1, 0, 1,
-0.8473346, -0.2313668, -2.702387, 0.8235294, 1, 0, 1,
-0.8464621, 1.121698, -0.9481992, 0.8196079, 1, 0, 1,
-0.845334, -0.5423122, -3.116562, 0.8117647, 1, 0, 1,
-0.8388101, 0.08951414, -2.995726, 0.8078431, 1, 0, 1,
-0.8373145, -0.9570284, -0.9256338, 0.8, 1, 0, 1,
-0.8370888, 0.9994622, 0.4179033, 0.7921569, 1, 0, 1,
-0.8368847, 0.3473835, -0.0958259, 0.7882353, 1, 0, 1,
-0.8349595, -0.4306956, -2.122941, 0.7803922, 1, 0, 1,
-0.8265949, -1.037299, -3.632106, 0.7764706, 1, 0, 1,
-0.8261562, 0.7700998, 1.181495, 0.7686275, 1, 0, 1,
-0.8248658, -0.1483282, -4.106716, 0.7647059, 1, 0, 1,
-0.822697, 1.685132, -1.448567, 0.7568628, 1, 0, 1,
-0.8222101, 1.054388, 0.6350058, 0.7529412, 1, 0, 1,
-0.8217432, 0.8422611, -1.296079, 0.7450981, 1, 0, 1,
-0.8213464, 0.7004784, -2.269877, 0.7411765, 1, 0, 1,
-0.8112044, 1.033357, -0.5760202, 0.7333333, 1, 0, 1,
-0.8108708, 1.802548, -0.1914973, 0.7294118, 1, 0, 1,
-0.8076367, -1.26072, -2.459274, 0.7215686, 1, 0, 1,
-0.8030334, 1.314832, 0.7948276, 0.7176471, 1, 0, 1,
-0.8004153, 2.27596, -0.1306678, 0.7098039, 1, 0, 1,
-0.7974676, 0.824891, -2.156769, 0.7058824, 1, 0, 1,
-0.7916405, 0.4406631, 0.4354576, 0.6980392, 1, 0, 1,
-0.7915391, 1.089231, 1.026415, 0.6901961, 1, 0, 1,
-0.7902392, 0.8464375, 0.5895103, 0.6862745, 1, 0, 1,
-0.7703363, -0.1843736, -1.598509, 0.6784314, 1, 0, 1,
-0.7664904, -1.107118, -2.225965, 0.6745098, 1, 0, 1,
-0.7627213, 0.2743312, -3.215775, 0.6666667, 1, 0, 1,
-0.761698, 0.3873025, -1.067726, 0.6627451, 1, 0, 1,
-0.7543123, -0.8490786, -1.324375, 0.654902, 1, 0, 1,
-0.7536579, 0.8399419, 0.5540865, 0.6509804, 1, 0, 1,
-0.7533288, 0.8022241, -0.9134948, 0.6431373, 1, 0, 1,
-0.7513101, -0.7643542, -2.410634, 0.6392157, 1, 0, 1,
-0.750076, 0.2159891, -1.483613, 0.6313726, 1, 0, 1,
-0.7380514, -0.4642947, -4.508288, 0.627451, 1, 0, 1,
-0.7347561, 0.4398525, -1.410018, 0.6196079, 1, 0, 1,
-0.7335079, 0.0632828, -0.6108714, 0.6156863, 1, 0, 1,
-0.7273788, 0.7471455, 0.8816411, 0.6078432, 1, 0, 1,
-0.725886, 0.5242909, -2.807472, 0.6039216, 1, 0, 1,
-0.7227551, -0.3152165, -0.801175, 0.5960785, 1, 0, 1,
-0.7221538, -0.06551969, 0.1216682, 0.5882353, 1, 0, 1,
-0.7193452, 0.02274403, 0.03435551, 0.5843138, 1, 0, 1,
-0.7187491, -0.6178831, -1.784363, 0.5764706, 1, 0, 1,
-0.7176022, -1.154688, -1.937762, 0.572549, 1, 0, 1,
-0.7157017, 0.7308712, -1.909141, 0.5647059, 1, 0, 1,
-0.7142076, -1.105387, -2.170379, 0.5607843, 1, 0, 1,
-0.711973, -1.214831, -2.155907, 0.5529412, 1, 0, 1,
-0.7117833, 0.094029, -0.3472489, 0.5490196, 1, 0, 1,
-0.7075348, -0.6033581, -0.9261913, 0.5411765, 1, 0, 1,
-0.7049672, 0.912051, -0.4374925, 0.5372549, 1, 0, 1,
-0.7036273, 2.343301, -0.03833161, 0.5294118, 1, 0, 1,
-0.7032808, 0.002530867, -1.237177, 0.5254902, 1, 0, 1,
-0.6978807, 0.9100047, -0.9620457, 0.5176471, 1, 0, 1,
-0.6912338, 1.502148, 0.6334733, 0.5137255, 1, 0, 1,
-0.6889784, 1.536969, 0.07716498, 0.5058824, 1, 0, 1,
-0.6877813, -0.9317959, -2.308713, 0.5019608, 1, 0, 1,
-0.6877307, -3.10988, -1.568234, 0.4941176, 1, 0, 1,
-0.6872671, -1.298594, -4.955739, 0.4862745, 1, 0, 1,
-0.6863034, -1.443933, -2.031719, 0.4823529, 1, 0, 1,
-0.684212, -0.6064411, -2.21764, 0.4745098, 1, 0, 1,
-0.6828534, -1.555303, -2.435808, 0.4705882, 1, 0, 1,
-0.6813979, -0.4352466, -2.985334, 0.4627451, 1, 0, 1,
-0.6760806, 0.2789096, -2.359606, 0.4588235, 1, 0, 1,
-0.6739601, 1.628034, 2.211538, 0.4509804, 1, 0, 1,
-0.6727441, -0.355019, -0.08897427, 0.4470588, 1, 0, 1,
-0.6696561, 1.287508, 0.07856502, 0.4392157, 1, 0, 1,
-0.661394, -0.6230742, -3.705594, 0.4352941, 1, 0, 1,
-0.6596987, -0.1325911, -3.031277, 0.427451, 1, 0, 1,
-0.6536628, 2.967031, 0.3395449, 0.4235294, 1, 0, 1,
-0.6507722, -0.494482, -2.674644, 0.4156863, 1, 0, 1,
-0.6496764, -0.09084231, 0.6319883, 0.4117647, 1, 0, 1,
-0.6415378, -0.7192026, -0.8953156, 0.4039216, 1, 0, 1,
-0.6406654, 0.136601, -1.452026, 0.3960784, 1, 0, 1,
-0.6338043, -0.6728533, -1.797168, 0.3921569, 1, 0, 1,
-0.6292896, -0.1922006, -2.594334, 0.3843137, 1, 0, 1,
-0.6285222, 0.05698231, -1.161945, 0.3803922, 1, 0, 1,
-0.6233303, -0.1528683, -3.121818, 0.372549, 1, 0, 1,
-0.6194736, 1.129496, -1.763718, 0.3686275, 1, 0, 1,
-0.6145967, -0.004125971, -2.979039, 0.3607843, 1, 0, 1,
-0.6140711, -0.6481613, -1.389885, 0.3568628, 1, 0, 1,
-0.613216, -0.4616444, -1.25842, 0.3490196, 1, 0, 1,
-0.6126621, 0.4296377, -0.3270952, 0.345098, 1, 0, 1,
-0.6104949, -0.712994, -3.160618, 0.3372549, 1, 0, 1,
-0.6094358, -1.219054, -2.272094, 0.3333333, 1, 0, 1,
-0.607569, -1.143679, -4.033774, 0.3254902, 1, 0, 1,
-0.6068538, -0.293758, -1.561376, 0.3215686, 1, 0, 1,
-0.6058718, -0.3670323, -2.274772, 0.3137255, 1, 0, 1,
-0.6058559, 0.8644545, -1.463646, 0.3098039, 1, 0, 1,
-0.6019915, -0.03329895, -1.38557, 0.3019608, 1, 0, 1,
-0.6015555, -0.162849, -0.7469779, 0.2941177, 1, 0, 1,
-0.6010174, 0.1500626, -0.9741274, 0.2901961, 1, 0, 1,
-0.5993394, -0.6435326, -1.010199, 0.282353, 1, 0, 1,
-0.5957556, 0.6698, -1.815251, 0.2784314, 1, 0, 1,
-0.5920432, 1.340415, -0.1226423, 0.2705882, 1, 0, 1,
-0.5916691, -0.73306, -2.358543, 0.2666667, 1, 0, 1,
-0.5910205, -0.08849569, -0.6376019, 0.2588235, 1, 0, 1,
-0.5904971, 0.3712444, -1.479005, 0.254902, 1, 0, 1,
-0.5884818, -1.361207, -2.423382, 0.2470588, 1, 0, 1,
-0.5883629, 0.09173396, -1.718674, 0.2431373, 1, 0, 1,
-0.5883406, 1.166497, -2.145742, 0.2352941, 1, 0, 1,
-0.5795597, 0.09202931, -2.852146, 0.2313726, 1, 0, 1,
-0.5780671, 0.2666216, -0.04681251, 0.2235294, 1, 0, 1,
-0.5752699, -0.001260291, -1.208564, 0.2196078, 1, 0, 1,
-0.5726925, -1.076962, -2.335266, 0.2117647, 1, 0, 1,
-0.5680255, -0.3426585, -2.666106, 0.2078431, 1, 0, 1,
-0.56506, 0.6106364, -1.77685, 0.2, 1, 0, 1,
-0.5627576, -0.5876471, -1.435533, 0.1921569, 1, 0, 1,
-0.5621983, 0.2880793, -1.2932, 0.1882353, 1, 0, 1,
-0.5618762, -0.2239122, -1.944807, 0.1803922, 1, 0, 1,
-0.5615293, 0.7430279, -0.9864407, 0.1764706, 1, 0, 1,
-0.5576132, -0.7204843, -3.015625, 0.1686275, 1, 0, 1,
-0.5571184, -0.6316514, -1.361524, 0.1647059, 1, 0, 1,
-0.5498994, 0.5182782, -1.206751, 0.1568628, 1, 0, 1,
-0.5438766, -1.839947, -4.045842, 0.1529412, 1, 0, 1,
-0.5411702, 0.7485864, 0.0121824, 0.145098, 1, 0, 1,
-0.5357931, 0.543673, 0.3240679, 0.1411765, 1, 0, 1,
-0.5252922, 0.814867, -2.162963, 0.1333333, 1, 0, 1,
-0.523705, -0.2545733, -1.21082, 0.1294118, 1, 0, 1,
-0.5220959, -2.385661, -3.06113, 0.1215686, 1, 0, 1,
-0.5185189, -0.3920336, -0.9985932, 0.1176471, 1, 0, 1,
-0.5175998, 1.073609, -0.2693517, 0.1098039, 1, 0, 1,
-0.514129, -1.249102, -3.441036, 0.1058824, 1, 0, 1,
-0.5126404, 0.2013685, -2.086953, 0.09803922, 1, 0, 1,
-0.5075978, -1.437211, -1.44904, 0.09019608, 1, 0, 1,
-0.5064985, 2.067281, -1.33519, 0.08627451, 1, 0, 1,
-0.5030094, 0.2161975, -1.08899, 0.07843138, 1, 0, 1,
-0.5008151, -0.9742818, -2.321433, 0.07450981, 1, 0, 1,
-0.4969465, 0.7061806, -0.5061222, 0.06666667, 1, 0, 1,
-0.496649, -2.082226, -2.397907, 0.0627451, 1, 0, 1,
-0.4943011, -1.521511, -2.315973, 0.05490196, 1, 0, 1,
-0.4922393, 0.9092385, -1.269372, 0.05098039, 1, 0, 1,
-0.4836545, -0.5974945, -0.5539526, 0.04313726, 1, 0, 1,
-0.4824506, -0.1454128, -2.856997, 0.03921569, 1, 0, 1,
-0.4818855, 0.2186111, -1.197118, 0.03137255, 1, 0, 1,
-0.4809507, -0.044267, -2.079181, 0.02745098, 1, 0, 1,
-0.4789735, 0.9892279, -0.05949847, 0.01960784, 1, 0, 1,
-0.4768572, -0.1793174, -1.98631, 0.01568628, 1, 0, 1,
-0.4759831, 2.195182, -1.201695, 0.007843138, 1, 0, 1,
-0.4755679, 0.8221301, -0.9817383, 0.003921569, 1, 0, 1,
-0.4749697, 1.105976, -0.377429, 0, 1, 0.003921569, 1,
-0.4698775, 1.614979, 1.140795, 0, 1, 0.01176471, 1,
-0.4686299, 0.2736221, -2.645777, 0, 1, 0.01568628, 1,
-0.4635548, 0.5695434, -0.8922137, 0, 1, 0.02352941, 1,
-0.4609869, -0.7660481, -2.592635, 0, 1, 0.02745098, 1,
-0.4582644, 0.5476311, -0.7822163, 0, 1, 0.03529412, 1,
-0.4576176, -0.7026325, -2.049706, 0, 1, 0.03921569, 1,
-0.456188, -0.123299, -3.283531, 0, 1, 0.04705882, 1,
-0.4547239, -0.3374816, -2.024098, 0, 1, 0.05098039, 1,
-0.4442838, -0.4365613, -2.928505, 0, 1, 0.05882353, 1,
-0.4433289, -1.112354, -3.215903, 0, 1, 0.0627451, 1,
-0.4319772, 1.018678, -0.1382414, 0, 1, 0.07058824, 1,
-0.4272831, 0.7757931, 0.7923068, 0, 1, 0.07450981, 1,
-0.4177666, 1.763441, 0.4102631, 0, 1, 0.08235294, 1,
-0.4169286, -0.2022829, -0.4799511, 0, 1, 0.08627451, 1,
-0.4120112, -0.4761074, -3.282737, 0, 1, 0.09411765, 1,
-0.4083585, 0.4342857, -0.8928695, 0, 1, 0.1019608, 1,
-0.4018095, -1.080288, -2.142567, 0, 1, 0.1058824, 1,
-0.400333, -0.6589224, -3.748719, 0, 1, 0.1137255, 1,
-0.3959883, -1.266743, -3.651502, 0, 1, 0.1176471, 1,
-0.3948987, 1.09085, -0.7824285, 0, 1, 0.1254902, 1,
-0.3922092, -3.188403, -3.36766, 0, 1, 0.1294118, 1,
-0.3915228, 0.3830414, -0.06347271, 0, 1, 0.1372549, 1,
-0.390209, -1.377566, -4.891347, 0, 1, 0.1411765, 1,
-0.3855374, 0.09127859, 0.144425, 0, 1, 0.1490196, 1,
-0.3854263, -1.523126, -1.989882, 0, 1, 0.1529412, 1,
-0.3841006, -1.651955, -2.86842, 0, 1, 0.1607843, 1,
-0.3569258, 0.9947268, 0.2482838, 0, 1, 0.1647059, 1,
-0.3556077, 1.089875, 0.03927398, 0, 1, 0.172549, 1,
-0.3524905, -0.3995085, -4.599331, 0, 1, 0.1764706, 1,
-0.3443514, -2.029545, -3.074119, 0, 1, 0.1843137, 1,
-0.3420249, 0.08423737, 1.128422, 0, 1, 0.1882353, 1,
-0.3416539, -0.534255, -3.383544, 0, 1, 0.1960784, 1,
-0.3398365, -0.4699159, -3.066846, 0, 1, 0.2039216, 1,
-0.3267533, 0.02398458, -0.8588802, 0, 1, 0.2078431, 1,
-0.3248842, -0.8971992, -1.811233, 0, 1, 0.2156863, 1,
-0.3209166, 1.215476, -0.5185527, 0, 1, 0.2196078, 1,
-0.3146772, -0.6950669, -5.195738, 0, 1, 0.227451, 1,
-0.3122876, 1.539864, -0.727154, 0, 1, 0.2313726, 1,
-0.3112545, 1.602164, 0.8137506, 0, 1, 0.2392157, 1,
-0.3111056, 0.9135457, 1.441579, 0, 1, 0.2431373, 1,
-0.3073425, -1.778185, -2.791702, 0, 1, 0.2509804, 1,
-0.305851, -1.857791, -3.719586, 0, 1, 0.254902, 1,
-0.3049576, 1.679204, -0.6737468, 0, 1, 0.2627451, 1,
-0.3048485, -0.7666804, -3.97738, 0, 1, 0.2666667, 1,
-0.3043571, -0.307243, -3.326979, 0, 1, 0.2745098, 1,
-0.3028122, 0.5561056, -0.4306325, 0, 1, 0.2784314, 1,
-0.2861977, 0.8186707, -0.1815359, 0, 1, 0.2862745, 1,
-0.2818297, 0.2265802, -1.070961, 0, 1, 0.2901961, 1,
-0.2785847, -1.207455, -1.157374, 0, 1, 0.2980392, 1,
-0.2782561, 0.05716749, -1.350857, 0, 1, 0.3058824, 1,
-0.270979, 0.993323, -0.4415643, 0, 1, 0.3098039, 1,
-0.2696509, 0.23165, -0.7283359, 0, 1, 0.3176471, 1,
-0.2691092, 0.5491856, -0.05978258, 0, 1, 0.3215686, 1,
-0.2684017, 0.7817605, -0.03658355, 0, 1, 0.3294118, 1,
-0.2665891, -0.4069146, -4.142461, 0, 1, 0.3333333, 1,
-0.2662981, -0.5170413, -2.73689, 0, 1, 0.3411765, 1,
-0.2619684, 1.495848, -0.4765396, 0, 1, 0.345098, 1,
-0.2605917, 1.213661, -1.311063, 0, 1, 0.3529412, 1,
-0.260356, 0.04783319, -1.613345, 0, 1, 0.3568628, 1,
-0.2596977, -1.229036, -1.751886, 0, 1, 0.3647059, 1,
-0.258502, 1.060132, 0.6635427, 0, 1, 0.3686275, 1,
-0.2572934, 1.116927, -0.5129206, 0, 1, 0.3764706, 1,
-0.2558565, 1.438061, -0.01919189, 0, 1, 0.3803922, 1,
-0.2550897, -0.002083904, -0.6148271, 0, 1, 0.3882353, 1,
-0.2550886, 1.376665, 0.6445611, 0, 1, 0.3921569, 1,
-0.25403, -1.458538, -1.250167, 0, 1, 0.4, 1,
-0.2480275, -0.3943763, -3.314829, 0, 1, 0.4078431, 1,
-0.2471828, -1.612942, -3.316056, 0, 1, 0.4117647, 1,
-0.2418764, -0.4024384, -0.6361237, 0, 1, 0.4196078, 1,
-0.2384436, -0.4156537, -1.773306, 0, 1, 0.4235294, 1,
-0.2363747, -1.440071, -3.841545, 0, 1, 0.4313726, 1,
-0.2305939, -0.7342467, -1.39876, 0, 1, 0.4352941, 1,
-0.2299662, -0.5169133, -0.366475, 0, 1, 0.4431373, 1,
-0.2262407, 1.095913, 0.7270096, 0, 1, 0.4470588, 1,
-0.2244723, 0.6878974, -0.647016, 0, 1, 0.454902, 1,
-0.222497, -0.735312, -2.488903, 0, 1, 0.4588235, 1,
-0.2202989, 0.1725928, -1.673135, 0, 1, 0.4666667, 1,
-0.2188939, -0.2413855, -4.039746, 0, 1, 0.4705882, 1,
-0.2166273, 0.362642, 1.684013, 0, 1, 0.4784314, 1,
-0.2151051, 0.9727386, -1.079299, 0, 1, 0.4823529, 1,
-0.2141848, 1.969897, -0.4131661, 0, 1, 0.4901961, 1,
-0.2012925, 0.641845, -0.5358929, 0, 1, 0.4941176, 1,
-0.2004976, -0.9327245, -4.327807, 0, 1, 0.5019608, 1,
-0.2001058, 2.318926, 0.5424588, 0, 1, 0.509804, 1,
-0.1998235, -0.2157321, -4.023259, 0, 1, 0.5137255, 1,
-0.198408, -1.181265, -2.57819, 0, 1, 0.5215687, 1,
-0.1939083, 0.892938, -1.858544, 0, 1, 0.5254902, 1,
-0.1936401, -1.137097, -1.985167, 0, 1, 0.5333334, 1,
-0.1918618, -0.8417508, -3.365934, 0, 1, 0.5372549, 1,
-0.1891826, -0.1646375, -2.944559, 0, 1, 0.5450981, 1,
-0.1862375, -0.4571946, -1.434891, 0, 1, 0.5490196, 1,
-0.1854666, -0.3604261, -0.8621162, 0, 1, 0.5568628, 1,
-0.1853679, 0.3245738, -0.3299814, 0, 1, 0.5607843, 1,
-0.1771935, 2.431854, -0.4282157, 0, 1, 0.5686275, 1,
-0.1757247, 0.2814664, 0.357769, 0, 1, 0.572549, 1,
-0.1755009, 0.8835599, -0.2608624, 0, 1, 0.5803922, 1,
-0.1744856, -0.3543267, -3.263303, 0, 1, 0.5843138, 1,
-0.1731522, -0.4906324, -2.421395, 0, 1, 0.5921569, 1,
-0.1700586, -0.7132452, -0.4865926, 0, 1, 0.5960785, 1,
-0.1674815, -0.3890808, -2.304691, 0, 1, 0.6039216, 1,
-0.1674235, -0.7130167, -2.965862, 0, 1, 0.6117647, 1,
-0.1662943, -0.4972291, -2.389771, 0, 1, 0.6156863, 1,
-0.164739, 0.06236778, -1.561309, 0, 1, 0.6235294, 1,
-0.162858, 1.735835, 0.6146631, 0, 1, 0.627451, 1,
-0.1603881, 1.589322, -0.3266418, 0, 1, 0.6352941, 1,
-0.1602786, 0.280488, -2.752825, 0, 1, 0.6392157, 1,
-0.1602703, -0.6401347, -3.863484, 0, 1, 0.6470588, 1,
-0.1455349, 0.9794905, -0.4586708, 0, 1, 0.6509804, 1,
-0.1414894, 0.9748517, -0.1782745, 0, 1, 0.6588235, 1,
-0.140177, 0.7847463, 0.4663679, 0, 1, 0.6627451, 1,
-0.1328304, 0.1725971, -0.3391911, 0, 1, 0.6705883, 1,
-0.1321629, 0.1249876, 0.4933824, 0, 1, 0.6745098, 1,
-0.1257864, -0.4648323, -2.91558, 0, 1, 0.682353, 1,
-0.1255458, -0.5852059, -2.536561, 0, 1, 0.6862745, 1,
-0.1244654, -0.2043938, -3.004334, 0, 1, 0.6941177, 1,
-0.116677, 1.443105, 0.1377374, 0, 1, 0.7019608, 1,
-0.113403, 0.383332, -1.9261, 0, 1, 0.7058824, 1,
-0.1111276, -0.1122875, -2.808837, 0, 1, 0.7137255, 1,
-0.1106576, 0.3345345, -0.5957487, 0, 1, 0.7176471, 1,
-0.1091213, -1.716804, -2.570745, 0, 1, 0.7254902, 1,
-0.1041097, -2.144013, -3.620911, 0, 1, 0.7294118, 1,
-0.1025039, 0.3314537, 0.6639243, 0, 1, 0.7372549, 1,
-0.09948689, 1.425809, 1.200143, 0, 1, 0.7411765, 1,
-0.09922221, 0.6183699, -1.173241, 0, 1, 0.7490196, 1,
-0.09149539, -0.4439734, -2.313923, 0, 1, 0.7529412, 1,
-0.09125537, -2.084455, -3.48978, 0, 1, 0.7607843, 1,
-0.08994912, -0.03383553, -3.363312, 0, 1, 0.7647059, 1,
-0.0882588, 0.04141301, -1.996237, 0, 1, 0.772549, 1,
-0.08515102, 0.4007041, -2.207954, 0, 1, 0.7764706, 1,
-0.08207031, 0.1746152, -1.803129, 0, 1, 0.7843137, 1,
-0.08098292, 1.067455, 1.811735, 0, 1, 0.7882353, 1,
-0.0768327, 0.196801, -0.2595568, 0, 1, 0.7960784, 1,
-0.0757485, -0.002393061, -2.613268, 0, 1, 0.8039216, 1,
-0.07546207, 1.205566, -0.3664929, 0, 1, 0.8078431, 1,
-0.07413851, 0.9912372, -0.4706133, 0, 1, 0.8156863, 1,
-0.07276874, 1.080472, 0.1049405, 0, 1, 0.8196079, 1,
-0.0721525, -1.09872, -4.127592, 0, 1, 0.827451, 1,
-0.07157827, 1.561035, -1.299138, 0, 1, 0.8313726, 1,
-0.07150253, -0.1714881, -2.884946, 0, 1, 0.8392157, 1,
-0.06713963, -0.3853426, -2.644722, 0, 1, 0.8431373, 1,
-0.06651028, 0.3728843, 0.5356485, 0, 1, 0.8509804, 1,
-0.05183145, 0.01078705, -2.357271, 0, 1, 0.854902, 1,
-0.04383079, 0.5748563, 1.532682, 0, 1, 0.8627451, 1,
-0.0408731, -0.7919633, -3.946852, 0, 1, 0.8666667, 1,
-0.03892322, 0.2534818, -1.894118, 0, 1, 0.8745098, 1,
-0.03698141, -0.02627741, -2.676469, 0, 1, 0.8784314, 1,
-0.03609132, 0.6348363, 0.7309338, 0, 1, 0.8862745, 1,
-0.03551421, 1.449532, 0.3063086, 0, 1, 0.8901961, 1,
-0.03378282, 0.975301, -0.9884308, 0, 1, 0.8980392, 1,
-0.02950202, -0.09133183, -3.509969, 0, 1, 0.9058824, 1,
-0.02912747, 1.170238, -0.6562357, 0, 1, 0.9098039, 1,
-0.02586726, 0.4829665, 0.6865323, 0, 1, 0.9176471, 1,
-0.02397359, -1.006562, -3.960705, 0, 1, 0.9215686, 1,
-0.01889327, 1.616436, -1.391503, 0, 1, 0.9294118, 1,
-0.01363041, 0.7911074, 2.973307, 0, 1, 0.9333333, 1,
-0.008763806, -0.5330873, -4.403253, 0, 1, 0.9411765, 1,
-0.005575612, -0.5440608, -5.451361, 0, 1, 0.945098, 1,
-0.004235784, -0.6005591, -0.7299145, 0, 1, 0.9529412, 1,
-0.00198092, -1.139342, -1.88653, 0, 1, 0.9568627, 1,
5.087578e-05, -1.500347, 1.824605, 0, 1, 0.9647059, 1,
0.0005573046, 0.09849748, 0.4292072, 0, 1, 0.9686275, 1,
0.002404326, -1.178081, 5.406052, 0, 1, 0.9764706, 1,
0.002508054, -0.1465193, 2.374656, 0, 1, 0.9803922, 1,
0.002803328, 0.2437432, -1.08349, 0, 1, 0.9882353, 1,
0.002945505, -0.8711118, 4.25044, 0, 1, 0.9921569, 1,
0.002979251, 0.8476543, -0.3365901, 0, 1, 1, 1,
0.01226718, 0.01410611, 1.281703, 0, 0.9921569, 1, 1,
0.01432406, -1.105977, 4.428452, 0, 0.9882353, 1, 1,
0.01736584, -0.1760436, 4.024359, 0, 0.9803922, 1, 1,
0.01892076, -1.515911, 3.074061, 0, 0.9764706, 1, 1,
0.02005282, 0.1857881, 1.966995, 0, 0.9686275, 1, 1,
0.02475702, 0.5323728, 0.9534725, 0, 0.9647059, 1, 1,
0.02547291, 0.04250472, 1.40293, 0, 0.9568627, 1, 1,
0.02912717, -0.8497937, 2.0145, 0, 0.9529412, 1, 1,
0.03182581, 0.693204, 0.4363295, 0, 0.945098, 1, 1,
0.03648461, -0.9316697, 2.818609, 0, 0.9411765, 1, 1,
0.03960012, 0.4827019, -0.6749523, 0, 0.9333333, 1, 1,
0.04758279, 0.6110945, -0.3142215, 0, 0.9294118, 1, 1,
0.04854279, -1.464285, 2.731323, 0, 0.9215686, 1, 1,
0.05213124, 0.1509517, 1.61471, 0, 0.9176471, 1, 1,
0.05596888, 1.175486, 0.120244, 0, 0.9098039, 1, 1,
0.05917415, 0.1254267, 1.936509, 0, 0.9058824, 1, 1,
0.06018832, 0.09357508, 1.50506, 0, 0.8980392, 1, 1,
0.06124081, 0.04719052, 1.924577, 0, 0.8901961, 1, 1,
0.06344374, 0.6960539, 0.6615987, 0, 0.8862745, 1, 1,
0.06862853, -0.08354595, 1.98939, 0, 0.8784314, 1, 1,
0.06971857, -0.4338515, 2.67144, 0, 0.8745098, 1, 1,
0.07621453, -0.3867911, 1.591332, 0, 0.8666667, 1, 1,
0.07824595, 0.1366135, 1.148023, 0, 0.8627451, 1, 1,
0.07833198, -1.806004, 2.375915, 0, 0.854902, 1, 1,
0.07834224, 1.865961, 0.6759279, 0, 0.8509804, 1, 1,
0.08286184, 0.9913228, -0.03684462, 0, 0.8431373, 1, 1,
0.08363335, 0.0858933, 1.101912, 0, 0.8392157, 1, 1,
0.09357556, 0.7880196, 1.2299, 0, 0.8313726, 1, 1,
0.0950073, 1.732351, -0.2422751, 0, 0.827451, 1, 1,
0.1019265, -0.4288885, 1.982758, 0, 0.8196079, 1, 1,
0.1024225, 0.6280129, 0.8107662, 0, 0.8156863, 1, 1,
0.105496, -1.284125, 3.500783, 0, 0.8078431, 1, 1,
0.1059669, 1.29499, 1.100028, 0, 0.8039216, 1, 1,
0.1114873, 0.2066462, 0.6135368, 0, 0.7960784, 1, 1,
0.1132147, -0.02341198, 0.8350874, 0, 0.7882353, 1, 1,
0.1137587, -0.3122271, 1.761932, 0, 0.7843137, 1, 1,
0.1158152, 0.8196589, -0.2242476, 0, 0.7764706, 1, 1,
0.1249413, -0.1622828, 3.473065, 0, 0.772549, 1, 1,
0.1260296, -0.02600684, 0.5353525, 0, 0.7647059, 1, 1,
0.126456, -0.1470555, -0.2972653, 0, 0.7607843, 1, 1,
0.1278166, 1.056013, -0.2855318, 0, 0.7529412, 1, 1,
0.1301438, -1.490648, 3.209544, 0, 0.7490196, 1, 1,
0.1323973, -0.2807471, 3.126555, 0, 0.7411765, 1, 1,
0.1341888, 0.5344328, -0.6436864, 0, 0.7372549, 1, 1,
0.1347896, 0.04561154, 0.06074082, 0, 0.7294118, 1, 1,
0.1412989, -0.2225851, 4.557326, 0, 0.7254902, 1, 1,
0.1464414, 0.2385462, 0.3934958, 0, 0.7176471, 1, 1,
0.1547986, -1.024608, 3.223504, 0, 0.7137255, 1, 1,
0.1574185, 1.536408, 0.9034106, 0, 0.7058824, 1, 1,
0.1611292, -1.035069, 1.932056, 0, 0.6980392, 1, 1,
0.1657321, -0.5794704, 2.203042, 0, 0.6941177, 1, 1,
0.1673764, -1.730667, 2.471313, 0, 0.6862745, 1, 1,
0.1678955, -0.7830657, 2.264139, 0, 0.682353, 1, 1,
0.1700891, 0.7164574, -0.1770436, 0, 0.6745098, 1, 1,
0.1731206, -0.08580044, 2.041347, 0, 0.6705883, 1, 1,
0.1750385, 0.2690674, 1.786678, 0, 0.6627451, 1, 1,
0.1752014, -0.146343, 0.6839538, 0, 0.6588235, 1, 1,
0.1758359, -0.7356794, 3.821845, 0, 0.6509804, 1, 1,
0.1760536, -1.14602, 1.9084, 0, 0.6470588, 1, 1,
0.1884448, 0.9708328, -0.9758536, 0, 0.6392157, 1, 1,
0.1888357, -0.1244707, 1.136238, 0, 0.6352941, 1, 1,
0.1909561, -0.7329803, 3.086736, 0, 0.627451, 1, 1,
0.1928021, -0.3897431, 3.372392, 0, 0.6235294, 1, 1,
0.1957553, -0.02704463, 2.043979, 0, 0.6156863, 1, 1,
0.201416, 0.3787627, 0.3832817, 0, 0.6117647, 1, 1,
0.2054137, -0.3541021, 1.9447, 0, 0.6039216, 1, 1,
0.2069961, -0.6375945, 2.828565, 0, 0.5960785, 1, 1,
0.2079398, -0.1569686, 2.522387, 0, 0.5921569, 1, 1,
0.2124865, -0.0344593, 1.406648, 0, 0.5843138, 1, 1,
0.2157598, -0.3142034, 1.367321, 0, 0.5803922, 1, 1,
0.2166025, 1.893585, 1.326614, 0, 0.572549, 1, 1,
0.217043, 0.02767532, 2.075366, 0, 0.5686275, 1, 1,
0.2224165, 0.7619122, 1.698669, 0, 0.5607843, 1, 1,
0.2227636, -1.733791, 3.200466, 0, 0.5568628, 1, 1,
0.222941, -0.1287774, 2.375284, 0, 0.5490196, 1, 1,
0.2243642, -0.1719266, 2.17305, 0, 0.5450981, 1, 1,
0.2248963, 1.114635, 1.971377, 0, 0.5372549, 1, 1,
0.2262202, 1.264699, 0.9912017, 0, 0.5333334, 1, 1,
0.230833, -0.5578707, 3.346236, 0, 0.5254902, 1, 1,
0.2326289, 0.6388783, 1.088392, 0, 0.5215687, 1, 1,
0.2348134, -0.3866013, 0.8891959, 0, 0.5137255, 1, 1,
0.2389794, -0.08975812, 2.930545, 0, 0.509804, 1, 1,
0.2426675, 0.04535758, 0.162776, 0, 0.5019608, 1, 1,
0.2475378, -0.04022319, 2.148657, 0, 0.4941176, 1, 1,
0.2476321, 0.4022076, -0.5862691, 0, 0.4901961, 1, 1,
0.2483245, -0.2605863, 0.4399484, 0, 0.4823529, 1, 1,
0.2528703, 0.7103783, -1.000339, 0, 0.4784314, 1, 1,
0.253747, 0.3982806, 1.368025, 0, 0.4705882, 1, 1,
0.2634238, -1.691746, 3.392839, 0, 0.4666667, 1, 1,
0.2635548, 2.527477, -2.256276, 0, 0.4588235, 1, 1,
0.2645308, -1.199586, 1.902686, 0, 0.454902, 1, 1,
0.2669513, -0.6336979, 1.801575, 0, 0.4470588, 1, 1,
0.2765382, 3.008992, -1.129244, 0, 0.4431373, 1, 1,
0.2798209, 0.3130451, 1.699933, 0, 0.4352941, 1, 1,
0.2815215, -0.4847287, 1.087211, 0, 0.4313726, 1, 1,
0.2820809, -0.4961901, 1.990107, 0, 0.4235294, 1, 1,
0.2849631, -0.2351311, 1.110514, 0, 0.4196078, 1, 1,
0.2855018, 0.0563511, -0.1841791, 0, 0.4117647, 1, 1,
0.2887373, -1.723789, 4.055434, 0, 0.4078431, 1, 1,
0.2887498, -0.6432893, 3.420149, 0, 0.4, 1, 1,
0.2929465, 0.3584124, 2.10429, 0, 0.3921569, 1, 1,
0.2944552, 1.670016, -0.486849, 0, 0.3882353, 1, 1,
0.2957255, 0.6283749, 1.297731, 0, 0.3803922, 1, 1,
0.3073069, 0.3006387, 0.02121859, 0, 0.3764706, 1, 1,
0.3085645, 0.170902, 0.8412138, 0, 0.3686275, 1, 1,
0.3126741, 0.1970177, 0.4700925, 0, 0.3647059, 1, 1,
0.3175752, 0.8588355, -0.7028924, 0, 0.3568628, 1, 1,
0.3207971, 0.5941905, -0.2808738, 0, 0.3529412, 1, 1,
0.3211783, -0.9516091, 3.169343, 0, 0.345098, 1, 1,
0.323776, 0.09105632, 1.839885, 0, 0.3411765, 1, 1,
0.3335958, -0.6400334, 2.894929, 0, 0.3333333, 1, 1,
0.3373483, 0.2929778, 0.2116971, 0, 0.3294118, 1, 1,
0.3385605, 0.4889141, 0.302349, 0, 0.3215686, 1, 1,
0.342219, 2.488707, -0.2482163, 0, 0.3176471, 1, 1,
0.345947, 0.003727919, 1.580125, 0, 0.3098039, 1, 1,
0.3476889, 2.281557, -0.5258644, 0, 0.3058824, 1, 1,
0.3570243, -1.442977, 4.627614, 0, 0.2980392, 1, 1,
0.3596427, 2.752581, -0.2565582, 0, 0.2901961, 1, 1,
0.3597773, 0.2087774, 2.817719, 0, 0.2862745, 1, 1,
0.3600643, 1.537285, 1.080162, 0, 0.2784314, 1, 1,
0.3606595, 0.7657328, -1.479062, 0, 0.2745098, 1, 1,
0.3623778, -0.668754, 2.355947, 0, 0.2666667, 1, 1,
0.362742, 1.653115, 1.660075, 0, 0.2627451, 1, 1,
0.3682551, -0.3295401, 2.965174, 0, 0.254902, 1, 1,
0.3710195, -1.066986, 3.95014, 0, 0.2509804, 1, 1,
0.3800518, -0.9559385, 0.7201087, 0, 0.2431373, 1, 1,
0.3874032, -0.4227185, 2.848677, 0, 0.2392157, 1, 1,
0.3892046, 0.6391839, 0.3626816, 0, 0.2313726, 1, 1,
0.3897786, 0.3026226, -0.01798213, 0, 0.227451, 1, 1,
0.3924323, -1.427333, 4.476353, 0, 0.2196078, 1, 1,
0.3955688, -2.068051, 4.357667, 0, 0.2156863, 1, 1,
0.3959984, -1.209225, 2.092296, 0, 0.2078431, 1, 1,
0.400013, -0.3287342, 3.54776, 0, 0.2039216, 1, 1,
0.406679, -0.8261952, 3.487116, 0, 0.1960784, 1, 1,
0.4111763, 0.2653261, 0.3922361, 0, 0.1882353, 1, 1,
0.4114666, 1.031778, 0.8049118, 0, 0.1843137, 1, 1,
0.4126301, 1.470152, 0.1765578, 0, 0.1764706, 1, 1,
0.4147652, 0.9274973, 0.1653568, 0, 0.172549, 1, 1,
0.4158349, 0.9924852, 1.18817, 0, 0.1647059, 1, 1,
0.4193168, -0.2916233, 2.686812, 0, 0.1607843, 1, 1,
0.4209611, 0.1466065, 2.545425, 0, 0.1529412, 1, 1,
0.4246521, 0.103008, 2.157473, 0, 0.1490196, 1, 1,
0.4358205, -0.4902463, 2.340971, 0, 0.1411765, 1, 1,
0.436253, 1.241358, -0.162516, 0, 0.1372549, 1, 1,
0.4409409, 0.4718017, 0.9417425, 0, 0.1294118, 1, 1,
0.4455572, -0.9836633, 3.551944, 0, 0.1254902, 1, 1,
0.4480014, 0.863627, 0.3577133, 0, 0.1176471, 1, 1,
0.4496091, 0.3504545, -0.003269042, 0, 0.1137255, 1, 1,
0.4517153, -0.4937564, 1.312944, 0, 0.1058824, 1, 1,
0.451764, 1.124567, -0.2467011, 0, 0.09803922, 1, 1,
0.4620121, -0.761148, 1.542178, 0, 0.09411765, 1, 1,
0.4633147, 0.6033687, 1.411937, 0, 0.08627451, 1, 1,
0.4638137, 0.9510686, 1.384805, 0, 0.08235294, 1, 1,
0.4670664, 0.5319137, 1.207499, 0, 0.07450981, 1, 1,
0.4672481, -0.8183414, 2.497835, 0, 0.07058824, 1, 1,
0.4683723, 0.3499724, 0.8944399, 0, 0.0627451, 1, 1,
0.4688422, 1.269039, -0.1526793, 0, 0.05882353, 1, 1,
0.4791515, 1.84058, -1.187341, 0, 0.05098039, 1, 1,
0.4792718, -0.1768312, 1.790981, 0, 0.04705882, 1, 1,
0.4823513, -0.2527916, 2.046086, 0, 0.03921569, 1, 1,
0.4931777, 1.951814, 0.3124642, 0, 0.03529412, 1, 1,
0.4970546, 0.7969443, 1.489453, 0, 0.02745098, 1, 1,
0.501815, 2.059951, 0.662328, 0, 0.02352941, 1, 1,
0.5032884, -0.1721514, 2.474672, 0, 0.01568628, 1, 1,
0.5047545, -0.02980644, 3.326366, 0, 0.01176471, 1, 1,
0.5146128, 1.790424, 0.444026, 0, 0.003921569, 1, 1,
0.5202209, -1.020206, 3.88106, 0.003921569, 0, 1, 1,
0.5220056, -0.6347588, 0.7317231, 0.007843138, 0, 1, 1,
0.5246203, -0.1275195, 4.850651, 0.01568628, 0, 1, 1,
0.5258428, -1.021812, 2.705176, 0.01960784, 0, 1, 1,
0.5278508, -0.5290369, 2.447483, 0.02745098, 0, 1, 1,
0.5296982, -0.7237713, 1.407852, 0.03137255, 0, 1, 1,
0.5306971, -0.09344314, 1.174482, 0.03921569, 0, 1, 1,
0.5331002, -1.09027, 2.086302, 0.04313726, 0, 1, 1,
0.5348092, 1.649018, -0.7208742, 0.05098039, 0, 1, 1,
0.5376387, -1.097924, 3.171185, 0.05490196, 0, 1, 1,
0.5400397, 0.8365571, 0.9509079, 0.0627451, 0, 1, 1,
0.5424482, -0.343345, 1.958807, 0.06666667, 0, 1, 1,
0.5440938, -1.446407, 2.770341, 0.07450981, 0, 1, 1,
0.545653, -0.5128802, 1.226239, 0.07843138, 0, 1, 1,
0.548201, -0.3887177, 0.5654955, 0.08627451, 0, 1, 1,
0.5698035, -0.3347156, 2.001136, 0.09019608, 0, 1, 1,
0.5698403, -0.4443471, 1.773156, 0.09803922, 0, 1, 1,
0.5698692, 1.221458, 0.1332377, 0.1058824, 0, 1, 1,
0.5734119, 1.059616, 0.9359313, 0.1098039, 0, 1, 1,
0.5821124, 0.3497801, 1.250446, 0.1176471, 0, 1, 1,
0.5828484, -0.5985156, 2.776021, 0.1215686, 0, 1, 1,
0.5839862, 1.762239, -0.4337568, 0.1294118, 0, 1, 1,
0.5855654, 1.700651, -0.2936613, 0.1333333, 0, 1, 1,
0.5855774, -2.050824, 3.355475, 0.1411765, 0, 1, 1,
0.5900218, -0.03885626, 2.414594, 0.145098, 0, 1, 1,
0.5939796, 0.4397924, 1.854704, 0.1529412, 0, 1, 1,
0.5955068, 0.2580926, -0.3150198, 0.1568628, 0, 1, 1,
0.5967305, 1.328508, 1.398885, 0.1647059, 0, 1, 1,
0.6016213, -0.5613536, 2.092335, 0.1686275, 0, 1, 1,
0.6016698, -0.04138762, 1.418131, 0.1764706, 0, 1, 1,
0.6019087, -0.1548894, 2.331878, 0.1803922, 0, 1, 1,
0.6019622, 0.01649273, 0.5952611, 0.1882353, 0, 1, 1,
0.6079012, 0.0924949, 0.1518073, 0.1921569, 0, 1, 1,
0.6087393, 0.566767, 0.6717515, 0.2, 0, 1, 1,
0.6110569, -1.464529, 3.165762, 0.2078431, 0, 1, 1,
0.6156905, 1.077776, 1.86086, 0.2117647, 0, 1, 1,
0.626752, -0.4535715, 0.2373535, 0.2196078, 0, 1, 1,
0.6285927, -0.6377856, 2.987484, 0.2235294, 0, 1, 1,
0.630274, 0.2386408, 0.3227673, 0.2313726, 0, 1, 1,
0.6305644, -0.2865337, 3.084255, 0.2352941, 0, 1, 1,
0.6305715, 0.636228, -0.7501667, 0.2431373, 0, 1, 1,
0.6344956, -0.5589061, 3.2719, 0.2470588, 0, 1, 1,
0.6421636, 0.2621469, 1.519347, 0.254902, 0, 1, 1,
0.6423939, 1.773516, 0.1219789, 0.2588235, 0, 1, 1,
0.642701, -0.7894796, 1.018713, 0.2666667, 0, 1, 1,
0.6464111, -0.2868792, 4.217135, 0.2705882, 0, 1, 1,
0.6508211, 0.1085202, 0.4576717, 0.2784314, 0, 1, 1,
0.6536355, 0.3481088, 2.342407, 0.282353, 0, 1, 1,
0.6545249, -0.04713031, 0.8122707, 0.2901961, 0, 1, 1,
0.6555548, 0.6792206, 1.937496, 0.2941177, 0, 1, 1,
0.6605185, 1.317638, 0.8101251, 0.3019608, 0, 1, 1,
0.666072, -0.3190427, 2.38913, 0.3098039, 0, 1, 1,
0.6723099, -0.8468544, 1.851666, 0.3137255, 0, 1, 1,
0.6735153, 0.8760629, -0.4410174, 0.3215686, 0, 1, 1,
0.6735861, 1.842903, 1.217074, 0.3254902, 0, 1, 1,
0.6768515, 0.9812165, -0.06438211, 0.3333333, 0, 1, 1,
0.6772395, 1.930578, 1.911865, 0.3372549, 0, 1, 1,
0.6918868, 1.322034, 0.06153769, 0.345098, 0, 1, 1,
0.6923794, -0.8826781, 3.261393, 0.3490196, 0, 1, 1,
0.6924486, -0.8270842, 1.952258, 0.3568628, 0, 1, 1,
0.693847, -0.1642609, 0.1047448, 0.3607843, 0, 1, 1,
0.6946217, 2.798529, -0.155395, 0.3686275, 0, 1, 1,
0.6948509, 0.8277954, 0.674002, 0.372549, 0, 1, 1,
0.6953048, -0.8611782, 2.972784, 0.3803922, 0, 1, 1,
0.7005982, 1.098867, -0.03435534, 0.3843137, 0, 1, 1,
0.7018496, 1.072944, 1.035341, 0.3921569, 0, 1, 1,
0.7021843, 0.1099001, 2.191741, 0.3960784, 0, 1, 1,
0.7048019, -0.2567003, 1.762079, 0.4039216, 0, 1, 1,
0.7140123, -0.5647131, 3.271058, 0.4117647, 0, 1, 1,
0.7146839, -0.4887516, 2.480371, 0.4156863, 0, 1, 1,
0.7173209, 0.9350339, 2.019623, 0.4235294, 0, 1, 1,
0.72175, -0.7706367, 2.608206, 0.427451, 0, 1, 1,
0.7282326, -0.9012295, 2.180135, 0.4352941, 0, 1, 1,
0.7357193, 1.397559, -0.4679812, 0.4392157, 0, 1, 1,
0.7360479, 0.5826264, 1.789747, 0.4470588, 0, 1, 1,
0.7386111, 1.202547, 0.187116, 0.4509804, 0, 1, 1,
0.7468547, -0.03147208, 2.648992, 0.4588235, 0, 1, 1,
0.7519274, -0.3429555, 2.345589, 0.4627451, 0, 1, 1,
0.7534198, 0.516591, 1.593116, 0.4705882, 0, 1, 1,
0.7571401, -0.08440562, 2.108036, 0.4745098, 0, 1, 1,
0.7573016, 0.3226601, 0.1439807, 0.4823529, 0, 1, 1,
0.7620974, 1.542231, -0.3530831, 0.4862745, 0, 1, 1,
0.764467, 1.984447, 0.1046524, 0.4941176, 0, 1, 1,
0.7685764, 0.7475853, 2.658751, 0.5019608, 0, 1, 1,
0.7719662, -0.2612165, 1.664143, 0.5058824, 0, 1, 1,
0.7764009, 0.9701792, 0.4164337, 0.5137255, 0, 1, 1,
0.7851562, -0.9601991, 3.484305, 0.5176471, 0, 1, 1,
0.7854845, 2.68689, -0.04781982, 0.5254902, 0, 1, 1,
0.785596, 0.2459988, 2.269317, 0.5294118, 0, 1, 1,
0.7948941, 0.2447638, 0.8621194, 0.5372549, 0, 1, 1,
0.7975582, -0.1543857, 3.218904, 0.5411765, 0, 1, 1,
0.8000964, 2.291135, 2.050882, 0.5490196, 0, 1, 1,
0.8019689, 1.392778, -0.2081359, 0.5529412, 0, 1, 1,
0.8026307, -2.120676, 2.228229, 0.5607843, 0, 1, 1,
0.8045492, -2.01117, 4.215276, 0.5647059, 0, 1, 1,
0.8067204, -0.8586597, 3.301314, 0.572549, 0, 1, 1,
0.8143696, 0.4354245, 0.7511195, 0.5764706, 0, 1, 1,
0.8144094, -0.8497816, 1.707769, 0.5843138, 0, 1, 1,
0.8177062, -0.2002551, 0.9374722, 0.5882353, 0, 1, 1,
0.8210523, -0.1040842, 1.11842, 0.5960785, 0, 1, 1,
0.8295702, 0.01721608, 0.7728016, 0.6039216, 0, 1, 1,
0.8319987, 1.083519, 1.293131, 0.6078432, 0, 1, 1,
0.833087, 0.1900072, -0.3538447, 0.6156863, 0, 1, 1,
0.8436242, 2.16288, 0.1338901, 0.6196079, 0, 1, 1,
0.844198, 0.3358669, 1.270659, 0.627451, 0, 1, 1,
0.8444433, -1.325668, 2.342628, 0.6313726, 0, 1, 1,
0.8446497, -0.397683, 2.79614, 0.6392157, 0, 1, 1,
0.8460878, 0.1599558, 3.197463, 0.6431373, 0, 1, 1,
0.8460921, 0.2146655, 0.5252374, 0.6509804, 0, 1, 1,
0.8508905, 0.06930837, -0.305382, 0.654902, 0, 1, 1,
0.8553196, -0.4039564, 2.292169, 0.6627451, 0, 1, 1,
0.8629966, -0.3535777, 0.9022493, 0.6666667, 0, 1, 1,
0.864751, 1.009142, 1.467914, 0.6745098, 0, 1, 1,
0.8679215, 0.6233737, 2.636417, 0.6784314, 0, 1, 1,
0.8765597, -0.4321697, 3.291588, 0.6862745, 0, 1, 1,
0.8792866, -0.2378709, 0.8714965, 0.6901961, 0, 1, 1,
0.8802976, -0.4437969, 0.5939068, 0.6980392, 0, 1, 1,
0.8824842, 0.4991571, 1.072234, 0.7058824, 0, 1, 1,
0.8830889, 1.493842, 1.266761, 0.7098039, 0, 1, 1,
0.8831594, 0.1684767, 2.956134, 0.7176471, 0, 1, 1,
0.8837966, 1.298287, 1.525227, 0.7215686, 0, 1, 1,
0.8855608, -1.031458, 2.430697, 0.7294118, 0, 1, 1,
0.8865547, 0.1981906, 1.268988, 0.7333333, 0, 1, 1,
0.8889744, -0.1440409, -0.1416401, 0.7411765, 0, 1, 1,
0.889228, 0.7135787, 1.380601, 0.7450981, 0, 1, 1,
0.9011605, -0.424705, 2.795763, 0.7529412, 0, 1, 1,
0.9083105, -0.8481494, 3.00229, 0.7568628, 0, 1, 1,
0.9096277, -0.9659302, 0.8235679, 0.7647059, 0, 1, 1,
0.910394, 1.205111, 1.23123, 0.7686275, 0, 1, 1,
0.9107278, 0.3223194, 1.508306, 0.7764706, 0, 1, 1,
0.9174092, 0.1930134, 1.526101, 0.7803922, 0, 1, 1,
0.9218206, 1.369839, 3.512213, 0.7882353, 0, 1, 1,
0.9301386, -0.4906939, 1.117038, 0.7921569, 0, 1, 1,
0.9315421, 1.475062, -0.2252567, 0.8, 0, 1, 1,
0.9317337, 0.7465938, 0.9888428, 0.8078431, 0, 1, 1,
0.9325588, 1.56126, 0.1622493, 0.8117647, 0, 1, 1,
0.9364556, 0.6702384, 1.741154, 0.8196079, 0, 1, 1,
0.9367211, -0.8548638, 3.376678, 0.8235294, 0, 1, 1,
0.9483908, -0.4596885, 1.389031, 0.8313726, 0, 1, 1,
0.9530742, 0.6023998, 0.01803029, 0.8352941, 0, 1, 1,
0.9568553, 0.7484986, 1.793592, 0.8431373, 0, 1, 1,
0.9629884, -0.1933091, 2.417691, 0.8470588, 0, 1, 1,
0.9688531, 1.935993, 2.255826, 0.854902, 0, 1, 1,
0.9694528, 0.06790487, 1.943602, 0.8588235, 0, 1, 1,
0.9732973, -1.015786, 2.461946, 0.8666667, 0, 1, 1,
0.9737772, -1.685374, 2.513036, 0.8705882, 0, 1, 1,
0.9747524, 0.2355643, 0.6023991, 0.8784314, 0, 1, 1,
0.9759482, -0.8386601, 0.8770178, 0.8823529, 0, 1, 1,
0.9769932, -0.6627755, 2.937985, 0.8901961, 0, 1, 1,
0.9875156, 0.9804589, 0.4325262, 0.8941177, 0, 1, 1,
0.9973251, -0.4054633, 1.703976, 0.9019608, 0, 1, 1,
0.9977049, 0.1194387, 2.925587, 0.9098039, 0, 1, 1,
0.9983124, -1.075171, 1.05998, 0.9137255, 0, 1, 1,
0.9990327, 0.4023247, 2.912186, 0.9215686, 0, 1, 1,
1.00183, -0.2649608, 0.6459867, 0.9254902, 0, 1, 1,
1.002342, 1.481862, 1.89272, 0.9333333, 0, 1, 1,
1.003185, 0.1478327, 2.123769, 0.9372549, 0, 1, 1,
1.014288, -0.4215954, 0.9964745, 0.945098, 0, 1, 1,
1.015785, -1.191373, 1.977372, 0.9490196, 0, 1, 1,
1.017203, 1.430669, 0.490476, 0.9568627, 0, 1, 1,
1.01887, -0.2076494, 2.147643, 0.9607843, 0, 1, 1,
1.020754, 0.6614127, 0.1708912, 0.9686275, 0, 1, 1,
1.024927, 0.393061, 2.444218, 0.972549, 0, 1, 1,
1.026987, 0.4119576, 0.8557446, 0.9803922, 0, 1, 1,
1.029033, -1.858824, 2.506735, 0.9843137, 0, 1, 1,
1.038891, 1.41879, 0.6543561, 0.9921569, 0, 1, 1,
1.043525, -1.578201, 1.007919, 0.9960784, 0, 1, 1,
1.046527, -0.8085937, 0.8633685, 1, 0, 0.9960784, 1,
1.049246, -0.2026278, 2.739078, 1, 0, 0.9882353, 1,
1.052774, 0.01705519, 2.009785, 1, 0, 0.9843137, 1,
1.053794, -0.127364, 2.512852, 1, 0, 0.9764706, 1,
1.055925, 0.8367232, 1.010749, 1, 0, 0.972549, 1,
1.056552, -1.844372, 2.602522, 1, 0, 0.9647059, 1,
1.059287, -1.748133, 3.881683, 1, 0, 0.9607843, 1,
1.065893, -2.014578, 3.686781, 1, 0, 0.9529412, 1,
1.070905, 0.05185204, 2.907849, 1, 0, 0.9490196, 1,
1.071568, -0.7920703, 1.421943, 1, 0, 0.9411765, 1,
1.072849, 1.241046, 1.624157, 1, 0, 0.9372549, 1,
1.074515, 0.1323041, 0.8508627, 1, 0, 0.9294118, 1,
1.075801, 0.05104002, 2.230403, 1, 0, 0.9254902, 1,
1.078086, 1.377605, -0.01497814, 1, 0, 0.9176471, 1,
1.083369, 0.3860087, 0.3552441, 1, 0, 0.9137255, 1,
1.08848, -0.1058718, 1.910314, 1, 0, 0.9058824, 1,
1.093844, -0.3089344, 2.256462, 1, 0, 0.9019608, 1,
1.094426, -1.522223, 3.928, 1, 0, 0.8941177, 1,
1.094654, 0.5081041, 0.7498269, 1, 0, 0.8862745, 1,
1.097214, 1.767931, 0.3997674, 1, 0, 0.8823529, 1,
1.098954, 0.6860677, -0.2884187, 1, 0, 0.8745098, 1,
1.103891, 0.5682698, 0.6436778, 1, 0, 0.8705882, 1,
1.108902, -0.9332619, 1.057638, 1, 0, 0.8627451, 1,
1.114313, -0.1610065, 1.543946, 1, 0, 0.8588235, 1,
1.11744, 0.6195133, 0.8369175, 1, 0, 0.8509804, 1,
1.121842, -0.08116525, 2.360954, 1, 0, 0.8470588, 1,
1.123342, -0.8482316, 2.622423, 1, 0, 0.8392157, 1,
1.137539, -0.4923826, 2.295689, 1, 0, 0.8352941, 1,
1.142404, -1.302433, 1.835474, 1, 0, 0.827451, 1,
1.146111, 0.3263156, 0.307057, 1, 0, 0.8235294, 1,
1.147051, 0.5220858, -1.226201, 1, 0, 0.8156863, 1,
1.156522, 0.7144194, 0.9225627, 1, 0, 0.8117647, 1,
1.157941, 2.385792, 1.439739, 1, 0, 0.8039216, 1,
1.168537, -0.9546161, 2.265867, 1, 0, 0.7960784, 1,
1.16985, -0.01714375, 0.208058, 1, 0, 0.7921569, 1,
1.178709, -0.4576413, 0.5219625, 1, 0, 0.7843137, 1,
1.179467, -1.149426, 3.926685, 1, 0, 0.7803922, 1,
1.181626, 0.03629621, -0.1360239, 1, 0, 0.772549, 1,
1.196775, 0.3099551, 1.613271, 1, 0, 0.7686275, 1,
1.198416, -0.3594536, 2.585656, 1, 0, 0.7607843, 1,
1.201519, -0.132535, -0.6343313, 1, 0, 0.7568628, 1,
1.201614, -0.5640969, 1.434174, 1, 0, 0.7490196, 1,
1.202189, 1.111078, 0.153032, 1, 0, 0.7450981, 1,
1.207618, -1.69744, 2.032494, 1, 0, 0.7372549, 1,
1.209162, -0.326016, 3.05241, 1, 0, 0.7333333, 1,
1.211504, 0.8683906, 0.1354312, 1, 0, 0.7254902, 1,
1.214581, 0.07923796, 2.87538, 1, 0, 0.7215686, 1,
1.226128, -0.417879, 2.460515, 1, 0, 0.7137255, 1,
1.229152, -1.07485, 2.984983, 1, 0, 0.7098039, 1,
1.23254, 0.4196081, 1.914656, 1, 0, 0.7019608, 1,
1.237613, 0.4278821, 2.028119, 1, 0, 0.6941177, 1,
1.238663, 1.281845, 1.171093, 1, 0, 0.6901961, 1,
1.243937, 1.066429, 0.3246238, 1, 0, 0.682353, 1,
1.24488, 1.116072, 1.474703, 1, 0, 0.6784314, 1,
1.247278, -1.302556, 1.483852, 1, 0, 0.6705883, 1,
1.254934, 0.6377057, 1.473523, 1, 0, 0.6666667, 1,
1.260222, 1.490819, 1.233073, 1, 0, 0.6588235, 1,
1.268788, 0.1596177, 2.5909, 1, 0, 0.654902, 1,
1.270919, 0.5927597, 1.126423, 1, 0, 0.6470588, 1,
1.287413, -0.760955, 2.463122, 1, 0, 0.6431373, 1,
1.291405, 0.6942567, -0.3307209, 1, 0, 0.6352941, 1,
1.302365, 1.739289, -0.1937243, 1, 0, 0.6313726, 1,
1.325442, 1.297207, 3.547263, 1, 0, 0.6235294, 1,
1.332256, -0.500294, 1.557194, 1, 0, 0.6196079, 1,
1.335966, 1.285243, 0.4846797, 1, 0, 0.6117647, 1,
1.345998, 2.395076, -1.355424, 1, 0, 0.6078432, 1,
1.355593, -0.5705314, 2.311001, 1, 0, 0.6, 1,
1.359618, 1.501807, 1.550946, 1, 0, 0.5921569, 1,
1.360341, -0.5627438, -0.01406412, 1, 0, 0.5882353, 1,
1.360936, -0.129736, 2.525554, 1, 0, 0.5803922, 1,
1.379701, 0.6231698, -0.05193158, 1, 0, 0.5764706, 1,
1.387921, -0.6530402, 3.656516, 1, 0, 0.5686275, 1,
1.390568, 0.4138434, -0.1770428, 1, 0, 0.5647059, 1,
1.391522, 1.72229, 0.1246811, 1, 0, 0.5568628, 1,
1.392795, 0.9032907, 2.306076, 1, 0, 0.5529412, 1,
1.394801, 1.952355, 0.8862298, 1, 0, 0.5450981, 1,
1.395536, 1.843254, -0.1794584, 1, 0, 0.5411765, 1,
1.399992, 0.8633901, 0.2970575, 1, 0, 0.5333334, 1,
1.400034, -1.432999, 1.923671, 1, 0, 0.5294118, 1,
1.403193, 0.3977531, 1.339508, 1, 0, 0.5215687, 1,
1.404868, -0.04210136, 1.705379, 1, 0, 0.5176471, 1,
1.40662, -1.254476, 1.607242, 1, 0, 0.509804, 1,
1.414965, -0.2882444, -0.002354288, 1, 0, 0.5058824, 1,
1.416172, 0.3651954, 0.5090271, 1, 0, 0.4980392, 1,
1.420868, -0.5011338, 2.457517, 1, 0, 0.4901961, 1,
1.423944, 0.4280175, 2.681686, 1, 0, 0.4862745, 1,
1.426956, -0.1770413, -0.7056353, 1, 0, 0.4784314, 1,
1.43147, 1.771146, 2.123578, 1, 0, 0.4745098, 1,
1.44153, -0.7020448, 0.4194164, 1, 0, 0.4666667, 1,
1.443457, -0.7421871, 2.341464, 1, 0, 0.4627451, 1,
1.44522, 1.590282, 0.8985556, 1, 0, 0.454902, 1,
1.460775, 0.9544803, -0.2619467, 1, 0, 0.4509804, 1,
1.466658, 0.5782059, 1.050917, 1, 0, 0.4431373, 1,
1.475861, -0.02230234, 1.969687, 1, 0, 0.4392157, 1,
1.477178, 0.2328282, 1.167609, 1, 0, 0.4313726, 1,
1.514398, -1.664445, 3.207202, 1, 0, 0.427451, 1,
1.520334, -0.9039309, 0.6159527, 1, 0, 0.4196078, 1,
1.52386, -1.051376, 1.977098, 1, 0, 0.4156863, 1,
1.526776, -0.5632241, 1.184779, 1, 0, 0.4078431, 1,
1.542519, -1.401443, 1.97994, 1, 0, 0.4039216, 1,
1.552007, -0.3987468, 0.3865831, 1, 0, 0.3960784, 1,
1.566908, 1.284125, -0.5683872, 1, 0, 0.3882353, 1,
1.567986, 1.698338, 1.491379, 1, 0, 0.3843137, 1,
1.571973, -0.7538835, 3.04395, 1, 0, 0.3764706, 1,
1.581067, 1.149624, 2.170976, 1, 0, 0.372549, 1,
1.58247, 0.1390959, 1.346358, 1, 0, 0.3647059, 1,
1.595925, 2.11176, 0.5743666, 1, 0, 0.3607843, 1,
1.608868, 0.6642915, 1.227299, 1, 0, 0.3529412, 1,
1.611828, 0.1378403, 1.72317, 1, 0, 0.3490196, 1,
1.614684, 1.083462, 2.231539, 1, 0, 0.3411765, 1,
1.632658, 0.7506232, 1.724639, 1, 0, 0.3372549, 1,
1.653544, 0.7552269, 0.2074455, 1, 0, 0.3294118, 1,
1.662492, -1.007888, 0.5729783, 1, 0, 0.3254902, 1,
1.663045, 1.359667, -0.2562736, 1, 0, 0.3176471, 1,
1.671127, 2.39365, 0.2364209, 1, 0, 0.3137255, 1,
1.680004, 1.290979, 0.5518206, 1, 0, 0.3058824, 1,
1.681888, 0.3603196, 3.218854, 1, 0, 0.2980392, 1,
1.684076, -0.6252437, 0.4411124, 1, 0, 0.2941177, 1,
1.690605, -0.07669689, 2.32282, 1, 0, 0.2862745, 1,
1.691195, -1.62694, 3.49683, 1, 0, 0.282353, 1,
1.703615, -0.7395161, 1.188628, 1, 0, 0.2745098, 1,
1.722651, -0.5732594, 2.86768, 1, 0, 0.2705882, 1,
1.727689, -0.06582122, 3.212445, 1, 0, 0.2627451, 1,
1.740646, 0.9353598, 0.1386456, 1, 0, 0.2588235, 1,
1.743365, -0.8861455, 2.949568, 1, 0, 0.2509804, 1,
1.746426, 1.09962, 0.4803877, 1, 0, 0.2470588, 1,
1.749094, -1.511482, 3.382058, 1, 0, 0.2392157, 1,
1.749621, -0.07001041, -0.5346394, 1, 0, 0.2352941, 1,
1.763527, 0.07364257, 2.416593, 1, 0, 0.227451, 1,
1.786743, -0.1595506, 0.4602534, 1, 0, 0.2235294, 1,
1.801563, -0.3370599, 1.098559, 1, 0, 0.2156863, 1,
1.809053, -0.7704437, 3.349778, 1, 0, 0.2117647, 1,
1.813061, 0.5412551, 2.744386, 1, 0, 0.2039216, 1,
1.829212, 0.7964389, 2.900066, 1, 0, 0.1960784, 1,
1.843439, 0.5895953, 0.8494444, 1, 0, 0.1921569, 1,
1.84364, -0.5114812, 3.355806, 1, 0, 0.1843137, 1,
1.84372, -0.05758064, 1.648203, 1, 0, 0.1803922, 1,
1.86341, 0.4721941, 2.074712, 1, 0, 0.172549, 1,
1.872524, 0.4706051, 1.293386, 1, 0, 0.1686275, 1,
1.874792, -1.014246, 1.286742, 1, 0, 0.1607843, 1,
1.880634, 1.173735, 0.8871155, 1, 0, 0.1568628, 1,
1.890716, 0.04653958, -0.7211824, 1, 0, 0.1490196, 1,
1.892022, -0.7454001, 1.471421, 1, 0, 0.145098, 1,
1.944994, -0.4583102, 2.482311, 1, 0, 0.1372549, 1,
1.949021, -1.077618, 1.70013, 1, 0, 0.1333333, 1,
1.962445, 1.538004, 1.174446, 1, 0, 0.1254902, 1,
1.971815, 1.014372, 2.724649, 1, 0, 0.1215686, 1,
1.975252, -0.7332423, 2.079434, 1, 0, 0.1137255, 1,
1.991362, -0.7473866, 0.7102937, 1, 0, 0.1098039, 1,
2.002956, -2.156219, 1.873654, 1, 0, 0.1019608, 1,
2.060508, -1.097205, 1.775174, 1, 0, 0.09411765, 1,
2.071082, -0.693653, 1.770149, 1, 0, 0.09019608, 1,
2.09269, -0.07793687, 3.386461, 1, 0, 0.08235294, 1,
2.09917, -0.9053099, 2.270677, 1, 0, 0.07843138, 1,
2.199137, -1.268395, 1.999162, 1, 0, 0.07058824, 1,
2.199172, 1.031355, -1.322002, 1, 0, 0.06666667, 1,
2.205415, -0.3825804, 2.788267, 1, 0, 0.05882353, 1,
2.278023, 1.292069, 0.9927571, 1, 0, 0.05490196, 1,
2.332103, 0.09639051, 2.161799, 1, 0, 0.04705882, 1,
2.335201, 1.198349, -0.0338388, 1, 0, 0.04313726, 1,
2.409159, -0.2476836, 4.034795, 1, 0, 0.03529412, 1,
2.420582, -0.5719, 2.049364, 1, 0, 0.03137255, 1,
2.550815, 0.6250915, 3.441107, 1, 0, 0.02352941, 1,
2.656303, 1.081429, 1.642037, 1, 0, 0.01960784, 1,
2.759852, 0.5564993, 2.242853, 1, 0, 0.01176471, 1,
2.986437, 0.4367704, 1.607997, 1, 0, 0.007843138, 1
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
-0.149007, -4.238862, -7.291692, 0, -0.5, 0.5, 0.5,
-0.149007, -4.238862, -7.291692, 1, -0.5, 0.5, 0.5,
-0.149007, -4.238862, -7.291692, 1, 1.5, 0.5, 0.5,
-0.149007, -4.238862, -7.291692, 0, 1.5, 0.5, 0.5
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
-4.347366, -0.08970547, -7.291692, 0, -0.5, 0.5, 0.5,
-4.347366, -0.08970547, -7.291692, 1, -0.5, 0.5, 0.5,
-4.347366, -0.08970547, -7.291692, 1, 1.5, 0.5, 0.5,
-4.347366, -0.08970547, -7.291692, 0, 1.5, 0.5, 0.5
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
-4.347366, -4.238862, -0.02265429, 0, -0.5, 0.5, 0.5,
-4.347366, -4.238862, -0.02265429, 1, -0.5, 0.5, 0.5,
-4.347366, -4.238862, -0.02265429, 1, 1.5, 0.5, 0.5,
-4.347366, -4.238862, -0.02265429, 0, 1.5, 0.5, 0.5
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
-3, -3.281364, -5.614222,
2, -3.281364, -5.614222,
-3, -3.281364, -5.614222,
-3, -3.440947, -5.8938,
-2, -3.281364, -5.614222,
-2, -3.440947, -5.8938,
-1, -3.281364, -5.614222,
-1, -3.440947, -5.8938,
0, -3.281364, -5.614222,
0, -3.440947, -5.8938,
1, -3.281364, -5.614222,
1, -3.440947, -5.8938,
2, -3.281364, -5.614222,
2, -3.440947, -5.8938
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
-3, -3.760113, -6.452957, 0, -0.5, 0.5, 0.5,
-3, -3.760113, -6.452957, 1, -0.5, 0.5, 0.5,
-3, -3.760113, -6.452957, 1, 1.5, 0.5, 0.5,
-3, -3.760113, -6.452957, 0, 1.5, 0.5, 0.5,
-2, -3.760113, -6.452957, 0, -0.5, 0.5, 0.5,
-2, -3.760113, -6.452957, 1, -0.5, 0.5, 0.5,
-2, -3.760113, -6.452957, 1, 1.5, 0.5, 0.5,
-2, -3.760113, -6.452957, 0, 1.5, 0.5, 0.5,
-1, -3.760113, -6.452957, 0, -0.5, 0.5, 0.5,
-1, -3.760113, -6.452957, 1, -0.5, 0.5, 0.5,
-1, -3.760113, -6.452957, 1, 1.5, 0.5, 0.5,
-1, -3.760113, -6.452957, 0, 1.5, 0.5, 0.5,
0, -3.760113, -6.452957, 0, -0.5, 0.5, 0.5,
0, -3.760113, -6.452957, 1, -0.5, 0.5, 0.5,
0, -3.760113, -6.452957, 1, 1.5, 0.5, 0.5,
0, -3.760113, -6.452957, 0, 1.5, 0.5, 0.5,
1, -3.760113, -6.452957, 0, -0.5, 0.5, 0.5,
1, -3.760113, -6.452957, 1, -0.5, 0.5, 0.5,
1, -3.760113, -6.452957, 1, 1.5, 0.5, 0.5,
1, -3.760113, -6.452957, 0, 1.5, 0.5, 0.5,
2, -3.760113, -6.452957, 0, -0.5, 0.5, 0.5,
2, -3.760113, -6.452957, 1, -0.5, 0.5, 0.5,
2, -3.760113, -6.452957, 1, 1.5, 0.5, 0.5,
2, -3.760113, -6.452957, 0, 1.5, 0.5, 0.5
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
-3.378514, -3, -5.614222,
-3.378514, 3, -5.614222,
-3.378514, -3, -5.614222,
-3.539989, -3, -5.8938,
-3.378514, -2, -5.614222,
-3.539989, -2, -5.8938,
-3.378514, -1, -5.614222,
-3.539989, -1, -5.8938,
-3.378514, 0, -5.614222,
-3.539989, 0, -5.8938,
-3.378514, 1, -5.614222,
-3.539989, 1, -5.8938,
-3.378514, 2, -5.614222,
-3.539989, 2, -5.8938,
-3.378514, 3, -5.614222,
-3.539989, 3, -5.8938
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
-3.86294, -3, -6.452957, 0, -0.5, 0.5, 0.5,
-3.86294, -3, -6.452957, 1, -0.5, 0.5, 0.5,
-3.86294, -3, -6.452957, 1, 1.5, 0.5, 0.5,
-3.86294, -3, -6.452957, 0, 1.5, 0.5, 0.5,
-3.86294, -2, -6.452957, 0, -0.5, 0.5, 0.5,
-3.86294, -2, -6.452957, 1, -0.5, 0.5, 0.5,
-3.86294, -2, -6.452957, 1, 1.5, 0.5, 0.5,
-3.86294, -2, -6.452957, 0, 1.5, 0.5, 0.5,
-3.86294, -1, -6.452957, 0, -0.5, 0.5, 0.5,
-3.86294, -1, -6.452957, 1, -0.5, 0.5, 0.5,
-3.86294, -1, -6.452957, 1, 1.5, 0.5, 0.5,
-3.86294, -1, -6.452957, 0, 1.5, 0.5, 0.5,
-3.86294, 0, -6.452957, 0, -0.5, 0.5, 0.5,
-3.86294, 0, -6.452957, 1, -0.5, 0.5, 0.5,
-3.86294, 0, -6.452957, 1, 1.5, 0.5, 0.5,
-3.86294, 0, -6.452957, 0, 1.5, 0.5, 0.5,
-3.86294, 1, -6.452957, 0, -0.5, 0.5, 0.5,
-3.86294, 1, -6.452957, 1, -0.5, 0.5, 0.5,
-3.86294, 1, -6.452957, 1, 1.5, 0.5, 0.5,
-3.86294, 1, -6.452957, 0, 1.5, 0.5, 0.5,
-3.86294, 2, -6.452957, 0, -0.5, 0.5, 0.5,
-3.86294, 2, -6.452957, 1, -0.5, 0.5, 0.5,
-3.86294, 2, -6.452957, 1, 1.5, 0.5, 0.5,
-3.86294, 2, -6.452957, 0, 1.5, 0.5, 0.5,
-3.86294, 3, -6.452957, 0, -0.5, 0.5, 0.5,
-3.86294, 3, -6.452957, 1, -0.5, 0.5, 0.5,
-3.86294, 3, -6.452957, 1, 1.5, 0.5, 0.5,
-3.86294, 3, -6.452957, 0, 1.5, 0.5, 0.5
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
-3.378514, -3.281364, -4,
-3.378514, -3.281364, 4,
-3.378514, -3.281364, -4,
-3.539989, -3.440947, -4,
-3.378514, -3.281364, -2,
-3.539989, -3.440947, -2,
-3.378514, -3.281364, 0,
-3.539989, -3.440947, 0,
-3.378514, -3.281364, 2,
-3.539989, -3.440947, 2,
-3.378514, -3.281364, 4,
-3.539989, -3.440947, 4
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
-3.86294, -3.760113, -4, 0, -0.5, 0.5, 0.5,
-3.86294, -3.760113, -4, 1, -0.5, 0.5, 0.5,
-3.86294, -3.760113, -4, 1, 1.5, 0.5, 0.5,
-3.86294, -3.760113, -4, 0, 1.5, 0.5, 0.5,
-3.86294, -3.760113, -2, 0, -0.5, 0.5, 0.5,
-3.86294, -3.760113, -2, 1, -0.5, 0.5, 0.5,
-3.86294, -3.760113, -2, 1, 1.5, 0.5, 0.5,
-3.86294, -3.760113, -2, 0, 1.5, 0.5, 0.5,
-3.86294, -3.760113, 0, 0, -0.5, 0.5, 0.5,
-3.86294, -3.760113, 0, 1, -0.5, 0.5, 0.5,
-3.86294, -3.760113, 0, 1, 1.5, 0.5, 0.5,
-3.86294, -3.760113, 0, 0, 1.5, 0.5, 0.5,
-3.86294, -3.760113, 2, 0, -0.5, 0.5, 0.5,
-3.86294, -3.760113, 2, 1, -0.5, 0.5, 0.5,
-3.86294, -3.760113, 2, 1, 1.5, 0.5, 0.5,
-3.86294, -3.760113, 2, 0, 1.5, 0.5, 0.5,
-3.86294, -3.760113, 4, 0, -0.5, 0.5, 0.5,
-3.86294, -3.760113, 4, 1, -0.5, 0.5, 0.5,
-3.86294, -3.760113, 4, 1, 1.5, 0.5, 0.5,
-3.86294, -3.760113, 4, 0, 1.5, 0.5, 0.5
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
-3.378514, -3.281364, -5.614222,
-3.378514, 3.101953, -5.614222,
-3.378514, -3.281364, 5.568913,
-3.378514, 3.101953, 5.568913,
-3.378514, -3.281364, -5.614222,
-3.378514, -3.281364, 5.568913,
-3.378514, 3.101953, -5.614222,
-3.378514, 3.101953, 5.568913,
-3.378514, -3.281364, -5.614222,
3.0805, -3.281364, -5.614222,
-3.378514, -3.281364, 5.568913,
3.0805, -3.281364, 5.568913,
-3.378514, 3.101953, -5.614222,
3.0805, 3.101953, -5.614222,
-3.378514, 3.101953, 5.568913,
3.0805, 3.101953, 5.568913,
3.0805, -3.281364, -5.614222,
3.0805, 3.101953, -5.614222,
3.0805, -3.281364, 5.568913,
3.0805, 3.101953, 5.568913,
3.0805, -3.281364, -5.614222,
3.0805, -3.281364, 5.568913,
3.0805, 3.101953, -5.614222,
3.0805, 3.101953, 5.568913
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
var radius = 7.692437;
var distance = 34.22452;
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
mvMatrix.translate( 0.149007, 0.08970547, 0.02265429 );
mvMatrix.scale( 1.287691, 1.302961, 0.7437282 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22452);
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
ethylphosphonate<-read.table("ethylphosphonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethylphosphonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylphosphonate' not found
```

```r
y<-ethylphosphonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylphosphonate' not found
```

```r
z<-ethylphosphonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylphosphonate' not found
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
-3.284451, -0.5900027, -2.903801, 0, 0, 1, 1, 1,
-3.054218, 0.1337851, -0.9361964, 1, 0, 0, 1, 1,
-2.821486, 0.166168, 1.019489, 1, 0, 0, 1, 1,
-2.661654, -1.172261, -1.665444, 1, 0, 0, 1, 1,
-2.600926, -0.2741893, -2.309486, 1, 0, 0, 1, 1,
-2.583097, -1.701057, -0.5964953, 1, 0, 0, 1, 1,
-2.537145, -0.2471719, -1.659425, 0, 0, 0, 1, 1,
-2.406597, -0.2968366, -0.4798348, 0, 0, 0, 1, 1,
-2.278456, 0.2415623, -0.869971, 0, 0, 0, 1, 1,
-2.244684, 1.416701, -1.690123, 0, 0, 0, 1, 1,
-2.215927, 1.419571, -0.2538801, 0, 0, 0, 1, 1,
-2.199049, 0.34036, -2.563077, 0, 0, 0, 1, 1,
-2.121783, 0.2004033, -1.012821, 0, 0, 0, 1, 1,
-2.116405, 0.3907824, 0.09932551, 1, 1, 1, 1, 1,
-2.107119, 0.253988, -2.448642, 1, 1, 1, 1, 1,
-2.062716, 1.42719, -0.3217601, 1, 1, 1, 1, 1,
-2.057405, -0.691183, -1.50727, 1, 1, 1, 1, 1,
-2.042893, 1.233164, -0.4143347, 1, 1, 1, 1, 1,
-2.018153, 1.371962, -1.635634, 1, 1, 1, 1, 1,
-2.008333, 0.4510092, -2.176667, 1, 1, 1, 1, 1,
-1.977199, 1.127876, 0.2981238, 1, 1, 1, 1, 1,
-1.976412, 1.338852, -2.206459, 1, 1, 1, 1, 1,
-1.968054, -0.8351401, -1.202551, 1, 1, 1, 1, 1,
-1.958789, 0.7165416, -2.384669, 1, 1, 1, 1, 1,
-1.929975, 1.451401, -1.177504, 1, 1, 1, 1, 1,
-1.919196, 1.515144, 0.2247617, 1, 1, 1, 1, 1,
-1.875764, -0.53117, -1.426225, 1, 1, 1, 1, 1,
-1.875156, -0.7805744, -0.5054452, 1, 1, 1, 1, 1,
-1.848196, -1.813601, -0.5936425, 0, 0, 1, 1, 1,
-1.845469, 0.8712699, -1.494371, 1, 0, 0, 1, 1,
-1.829166, -0.5492201, -1.873454, 1, 0, 0, 1, 1,
-1.818938, 0.2095677, -2.628909, 1, 0, 0, 1, 1,
-1.816734, -1.728781, -1.18912, 1, 0, 0, 1, 1,
-1.813125, -1.237056, -1.503832, 1, 0, 0, 1, 1,
-1.810648, -2.34843, -3.959052, 0, 0, 0, 1, 1,
-1.807736, 0.1500854, -0.6686108, 0, 0, 0, 1, 1,
-1.795557, -1.011184, -0.924872, 0, 0, 0, 1, 1,
-1.794029, -0.3986225, -1.942599, 0, 0, 0, 1, 1,
-1.775118, 0.2890593, -0.2230175, 0, 0, 0, 1, 1,
-1.76884, 1.114866, -1.042809, 0, 0, 0, 1, 1,
-1.755573, -0.4882294, -1.456677, 0, 0, 0, 1, 1,
-1.750842, -0.3403217, -2.497768, 1, 1, 1, 1, 1,
-1.745514, 0.7295296, -1.21556, 1, 1, 1, 1, 1,
-1.744713, 1.400216, -1.031482, 1, 1, 1, 1, 1,
-1.743949, 0.5629843, 0.26859, 1, 1, 1, 1, 1,
-1.74177, -0.1930836, -1.41148, 1, 1, 1, 1, 1,
-1.724104, 0.422141, -0.9680899, 1, 1, 1, 1, 1,
-1.722584, -1.36418, -2.662838, 1, 1, 1, 1, 1,
-1.689785, 0.8456207, -0.551752, 1, 1, 1, 1, 1,
-1.685297, -0.286602, -1.980663, 1, 1, 1, 1, 1,
-1.668904, -0.6789457, -1.741244, 1, 1, 1, 1, 1,
-1.667635, -2.20216, -4.188963, 1, 1, 1, 1, 1,
-1.651641, 2.366631, 1.588561, 1, 1, 1, 1, 1,
-1.644689, 1.008246, 0.6973189, 1, 1, 1, 1, 1,
-1.64003, -0.379831, -3.173487, 1, 1, 1, 1, 1,
-1.631556, 1.964743, 0.2078413, 1, 1, 1, 1, 1,
-1.630901, 0.6676417, -1.764378, 0, 0, 1, 1, 1,
-1.630074, 1.111498, -1.418921, 1, 0, 0, 1, 1,
-1.617393, 0.2276021, -0.787854, 1, 0, 0, 1, 1,
-1.588127, -0.7886118, -0.3218665, 1, 0, 0, 1, 1,
-1.578962, -1.783857, -2.592493, 1, 0, 0, 1, 1,
-1.565048, 0.6779464, -2.896894, 1, 0, 0, 1, 1,
-1.563933, -1.587246, -1.534652, 0, 0, 0, 1, 1,
-1.558312, 0.6392378, -1.385705, 0, 0, 0, 1, 1,
-1.554008, 2.661062, 1.31601, 0, 0, 0, 1, 1,
-1.544667, -0.1300851, 0.00352502, 0, 0, 0, 1, 1,
-1.539266, -1.474953, -2.904438, 0, 0, 0, 1, 1,
-1.531639, -0.02221856, -0.9167625, 0, 0, 0, 1, 1,
-1.526845, 0.7984819, -0.5815228, 0, 0, 0, 1, 1,
-1.525368, 0.7288701, -1.734417, 1, 1, 1, 1, 1,
-1.520142, 0.4370712, -0.4585086, 1, 1, 1, 1, 1,
-1.515794, -0.7758892, -3.099606, 1, 1, 1, 1, 1,
-1.514414, 0.7695207, -1.264847, 1, 1, 1, 1, 1,
-1.512474, -2.440154, -2.539672, 1, 1, 1, 1, 1,
-1.498181, -2.602434, -1.843257, 1, 1, 1, 1, 1,
-1.495289, 0.9634464, 0.2536647, 1, 1, 1, 1, 1,
-1.487972, 1.129813, -0.3367508, 1, 1, 1, 1, 1,
-1.485637, 0.05629331, -3.705271, 1, 1, 1, 1, 1,
-1.484302, 0.9225572, -1.389613, 1, 1, 1, 1, 1,
-1.479658, -0.5028549, -1.350438, 1, 1, 1, 1, 1,
-1.465606, 0.02372034, -0.2767637, 1, 1, 1, 1, 1,
-1.460666, 0.8378749, -1.339033, 1, 1, 1, 1, 1,
-1.453833, -0.4425871, -2.492113, 1, 1, 1, 1, 1,
-1.451092, -0.5373445, -1.418894, 1, 1, 1, 1, 1,
-1.45058, 0.05036196, -3.116979, 0, 0, 1, 1, 1,
-1.44482, -0.1177827, 0.09817424, 1, 0, 0, 1, 1,
-1.440127, 0.6723812, -1.360266, 1, 0, 0, 1, 1,
-1.427293, -0.1785053, -2.329159, 1, 0, 0, 1, 1,
-1.421904, -1.883948, -2.033576, 1, 0, 0, 1, 1,
-1.419344, 0.3367212, -2.009285, 1, 0, 0, 1, 1,
-1.417862, -1.106286, -1.3981, 0, 0, 0, 1, 1,
-1.412932, -0.8136474, -2.074516, 0, 0, 0, 1, 1,
-1.387284, -0.5645794, -2.856894, 0, 0, 0, 1, 1,
-1.380752, -0.5368618, -1.435934, 0, 0, 0, 1, 1,
-1.375331, -1.173767, -1.167631, 0, 0, 0, 1, 1,
-1.365115, 1.452725, 0.03753751, 0, 0, 0, 1, 1,
-1.351584, -1.094897, -4.055331, 0, 0, 0, 1, 1,
-1.347033, 0.5435033, -2.248601, 1, 1, 1, 1, 1,
-1.346262, -0.06826446, -1.280497, 1, 1, 1, 1, 1,
-1.344694, -1.953694, -1.467054, 1, 1, 1, 1, 1,
-1.34409, -0.3597331, -3.08749, 1, 1, 1, 1, 1,
-1.338446, -1.372059, -1.956784, 1, 1, 1, 1, 1,
-1.305163, 0.3585661, 0.4120696, 1, 1, 1, 1, 1,
-1.303178, 1.06883, -1.627652, 1, 1, 1, 1, 1,
-1.301345, 1.396533, -0.9332234, 1, 1, 1, 1, 1,
-1.297801, -0.8836091, -2.313133, 1, 1, 1, 1, 1,
-1.296129, -0.0581396, -0.7665486, 1, 1, 1, 1, 1,
-1.295545, -1.436688, -2.756181, 1, 1, 1, 1, 1,
-1.291243, 0.3283086, -2.458969, 1, 1, 1, 1, 1,
-1.284273, 2.293047, -2.259405, 1, 1, 1, 1, 1,
-1.281549, 1.068917, -0.590595, 1, 1, 1, 1, 1,
-1.262, -2.347528, -2.260626, 1, 1, 1, 1, 1,
-1.251506, 0.2770742, -1.365399, 0, 0, 1, 1, 1,
-1.247074, -0.3653657, 1.117678, 1, 0, 0, 1, 1,
-1.229617, -0.9224629, -1.216818, 1, 0, 0, 1, 1,
-1.216934, -0.520529, -2.042032, 1, 0, 0, 1, 1,
-1.212036, 0.6207153, -2.062842, 1, 0, 0, 1, 1,
-1.209555, -1.148495, -0.8099045, 1, 0, 0, 1, 1,
-1.19616, 1.334631, 0.9841251, 0, 0, 0, 1, 1,
-1.196101, -2.451574, -2.25047, 0, 0, 0, 1, 1,
-1.195379, -1.601689, -3.568612, 0, 0, 0, 1, 1,
-1.193424, -0.5562411, -1.627418, 0, 0, 0, 1, 1,
-1.186819, 1.477865, -1.024941, 0, 0, 0, 1, 1,
-1.184434, 0.4388361, -0.5076154, 0, 0, 0, 1, 1,
-1.180559, -0.9666038, -1.886124, 0, 0, 0, 1, 1,
-1.17787, -2.246395, -2.874798, 1, 1, 1, 1, 1,
-1.177262, 0.7962109, -0.6361766, 1, 1, 1, 1, 1,
-1.174181, 1.836814, 0.4490611, 1, 1, 1, 1, 1,
-1.171217, -0.6908874, -3.326117, 1, 1, 1, 1, 1,
-1.168241, 1.988253, -1.396353, 1, 1, 1, 1, 1,
-1.163212, -1.153064, -3.365224, 1, 1, 1, 1, 1,
-1.154005, -0.3115967, -3.876361, 1, 1, 1, 1, 1,
-1.146223, -1.878063, -0.7552477, 1, 1, 1, 1, 1,
-1.129189, 0.3088129, -0.6414883, 1, 1, 1, 1, 1,
-1.118786, -2.035139, -4.373797, 1, 1, 1, 1, 1,
-1.116658, 1.198924, 0.01837943, 1, 1, 1, 1, 1,
-1.111747, 1.93302, -2.514699, 1, 1, 1, 1, 1,
-1.109487, 0.6971838, -3.019801, 1, 1, 1, 1, 1,
-1.109297, -0.1553938, -0.9435545, 1, 1, 1, 1, 1,
-1.108637, 0.4417619, -0.5412627, 1, 1, 1, 1, 1,
-1.095175, 0.3395287, -0.9402187, 0, 0, 1, 1, 1,
-1.083336, 0.4466838, -0.1930668, 1, 0, 0, 1, 1,
-1.079635, 1.437043, -1.822194, 1, 0, 0, 1, 1,
-1.066747, -0.4958624, -0.7125226, 1, 0, 0, 1, 1,
-1.065662, 0.8285075, -2.262033, 1, 0, 0, 1, 1,
-1.065211, 1.56836, -1.480285, 1, 0, 0, 1, 1,
-1.060173, -0.4017007, -2.540148, 0, 0, 0, 1, 1,
-1.059553, 0.3340043, -2.939276, 0, 0, 0, 1, 1,
-1.057714, -0.2620572, -2.65603, 0, 0, 0, 1, 1,
-1.055612, -2.99724, -3.369991, 0, 0, 0, 1, 1,
-1.04958, 0.6730687, -0.07045469, 0, 0, 0, 1, 1,
-1.04683, 0.5482749, -1.158924, 0, 0, 0, 1, 1,
-1.044453, -0.1118173, -0.5859146, 0, 0, 0, 1, 1,
-1.031871, 1.132229, -1.607663, 1, 1, 1, 1, 1,
-1.029876, -1.176133, -3.086901, 1, 1, 1, 1, 1,
-1.025264, -0.3709319, -1.098749, 1, 1, 1, 1, 1,
-1.025069, -0.1126287, 0.08163851, 1, 1, 1, 1, 1,
-1.020098, -1.516248, -3.194906, 1, 1, 1, 1, 1,
-1.016302, 0.746232, -1.298711, 1, 1, 1, 1, 1,
-1.015727, -0.1691465, -1.439433, 1, 1, 1, 1, 1,
-1.003401, -1.300647, -4.348417, 1, 1, 1, 1, 1,
-0.9974657, -1.266221, -1.999043, 1, 1, 1, 1, 1,
-0.9962605, 1.633079, 0.1592534, 1, 1, 1, 1, 1,
-0.9878467, 0.489845, -2.334761, 1, 1, 1, 1, 1,
-0.9828771, 0.9550222, 0.5347489, 1, 1, 1, 1, 1,
-0.9766735, 0.2202102, -1.343732, 1, 1, 1, 1, 1,
-0.9719359, -0.2368347, -0.8329023, 1, 1, 1, 1, 1,
-0.964821, -1.641107, -3.713549, 1, 1, 1, 1, 1,
-0.9641409, 0.2954687, 0.4001024, 0, 0, 1, 1, 1,
-0.9607247, 0.2799423, 0.9573978, 1, 0, 0, 1, 1,
-0.9569451, 0.3609152, -0.6620678, 1, 0, 0, 1, 1,
-0.9519826, -0.1361944, -1.241297, 1, 0, 0, 1, 1,
-0.9490694, 0.764199, 0.3815875, 1, 0, 0, 1, 1,
-0.9374778, 1.21884, -0.2012224, 1, 0, 0, 1, 1,
-0.9367263, -0.2017263, -0.986537, 0, 0, 0, 1, 1,
-0.9258986, -1.578376, -2.745544, 0, 0, 0, 1, 1,
-0.9126451, -0.297052, -1.094376, 0, 0, 0, 1, 1,
-0.9080454, -0.7957336, -3.616125, 0, 0, 0, 1, 1,
-0.8986009, 0.6577936, -2.267196, 0, 0, 0, 1, 1,
-0.8978741, 1.603468, 0.1113275, 0, 0, 0, 1, 1,
-0.8875666, -0.4356316, -3.075834, 0, 0, 0, 1, 1,
-0.886355, 0.8208694, 0.5910972, 1, 1, 1, 1, 1,
-0.8849477, -0.3735453, 0.06225159, 1, 1, 1, 1, 1,
-0.8843528, 0.6761629, -1.270175, 1, 1, 1, 1, 1,
-0.8835004, -0.09138089, -3.283225, 1, 1, 1, 1, 1,
-0.8822942, -0.1472998, -1.526439, 1, 1, 1, 1, 1,
-0.8790736, -0.1707102, -1.48797, 1, 1, 1, 1, 1,
-0.8785065, -1.16682, -2.071787, 1, 1, 1, 1, 1,
-0.873255, -0.7596275, -2.898364, 1, 1, 1, 1, 1,
-0.8723536, -0.3999879, -1.616342, 1, 1, 1, 1, 1,
-0.8668502, 1.445702, -1.649066, 1, 1, 1, 1, 1,
-0.8582979, 1.124848, -0.01372285, 1, 1, 1, 1, 1,
-0.8541938, -0.8498021, -3.302287, 1, 1, 1, 1, 1,
-0.852837, 0.7609979, -1.401592, 1, 1, 1, 1, 1,
-0.8518149, -0.4800573, -1.085488, 1, 1, 1, 1, 1,
-0.8508475, -0.7265441, -2.584869, 1, 1, 1, 1, 1,
-0.8473346, -0.2313668, -2.702387, 0, 0, 1, 1, 1,
-0.8464621, 1.121698, -0.9481992, 1, 0, 0, 1, 1,
-0.845334, -0.5423122, -3.116562, 1, 0, 0, 1, 1,
-0.8388101, 0.08951414, -2.995726, 1, 0, 0, 1, 1,
-0.8373145, -0.9570284, -0.9256338, 1, 0, 0, 1, 1,
-0.8370888, 0.9994622, 0.4179033, 1, 0, 0, 1, 1,
-0.8368847, 0.3473835, -0.0958259, 0, 0, 0, 1, 1,
-0.8349595, -0.4306956, -2.122941, 0, 0, 0, 1, 1,
-0.8265949, -1.037299, -3.632106, 0, 0, 0, 1, 1,
-0.8261562, 0.7700998, 1.181495, 0, 0, 0, 1, 1,
-0.8248658, -0.1483282, -4.106716, 0, 0, 0, 1, 1,
-0.822697, 1.685132, -1.448567, 0, 0, 0, 1, 1,
-0.8222101, 1.054388, 0.6350058, 0, 0, 0, 1, 1,
-0.8217432, 0.8422611, -1.296079, 1, 1, 1, 1, 1,
-0.8213464, 0.7004784, -2.269877, 1, 1, 1, 1, 1,
-0.8112044, 1.033357, -0.5760202, 1, 1, 1, 1, 1,
-0.8108708, 1.802548, -0.1914973, 1, 1, 1, 1, 1,
-0.8076367, -1.26072, -2.459274, 1, 1, 1, 1, 1,
-0.8030334, 1.314832, 0.7948276, 1, 1, 1, 1, 1,
-0.8004153, 2.27596, -0.1306678, 1, 1, 1, 1, 1,
-0.7974676, 0.824891, -2.156769, 1, 1, 1, 1, 1,
-0.7916405, 0.4406631, 0.4354576, 1, 1, 1, 1, 1,
-0.7915391, 1.089231, 1.026415, 1, 1, 1, 1, 1,
-0.7902392, 0.8464375, 0.5895103, 1, 1, 1, 1, 1,
-0.7703363, -0.1843736, -1.598509, 1, 1, 1, 1, 1,
-0.7664904, -1.107118, -2.225965, 1, 1, 1, 1, 1,
-0.7627213, 0.2743312, -3.215775, 1, 1, 1, 1, 1,
-0.761698, 0.3873025, -1.067726, 1, 1, 1, 1, 1,
-0.7543123, -0.8490786, -1.324375, 0, 0, 1, 1, 1,
-0.7536579, 0.8399419, 0.5540865, 1, 0, 0, 1, 1,
-0.7533288, 0.8022241, -0.9134948, 1, 0, 0, 1, 1,
-0.7513101, -0.7643542, -2.410634, 1, 0, 0, 1, 1,
-0.750076, 0.2159891, -1.483613, 1, 0, 0, 1, 1,
-0.7380514, -0.4642947, -4.508288, 1, 0, 0, 1, 1,
-0.7347561, 0.4398525, -1.410018, 0, 0, 0, 1, 1,
-0.7335079, 0.0632828, -0.6108714, 0, 0, 0, 1, 1,
-0.7273788, 0.7471455, 0.8816411, 0, 0, 0, 1, 1,
-0.725886, 0.5242909, -2.807472, 0, 0, 0, 1, 1,
-0.7227551, -0.3152165, -0.801175, 0, 0, 0, 1, 1,
-0.7221538, -0.06551969, 0.1216682, 0, 0, 0, 1, 1,
-0.7193452, 0.02274403, 0.03435551, 0, 0, 0, 1, 1,
-0.7187491, -0.6178831, -1.784363, 1, 1, 1, 1, 1,
-0.7176022, -1.154688, -1.937762, 1, 1, 1, 1, 1,
-0.7157017, 0.7308712, -1.909141, 1, 1, 1, 1, 1,
-0.7142076, -1.105387, -2.170379, 1, 1, 1, 1, 1,
-0.711973, -1.214831, -2.155907, 1, 1, 1, 1, 1,
-0.7117833, 0.094029, -0.3472489, 1, 1, 1, 1, 1,
-0.7075348, -0.6033581, -0.9261913, 1, 1, 1, 1, 1,
-0.7049672, 0.912051, -0.4374925, 1, 1, 1, 1, 1,
-0.7036273, 2.343301, -0.03833161, 1, 1, 1, 1, 1,
-0.7032808, 0.002530867, -1.237177, 1, 1, 1, 1, 1,
-0.6978807, 0.9100047, -0.9620457, 1, 1, 1, 1, 1,
-0.6912338, 1.502148, 0.6334733, 1, 1, 1, 1, 1,
-0.6889784, 1.536969, 0.07716498, 1, 1, 1, 1, 1,
-0.6877813, -0.9317959, -2.308713, 1, 1, 1, 1, 1,
-0.6877307, -3.10988, -1.568234, 1, 1, 1, 1, 1,
-0.6872671, -1.298594, -4.955739, 0, 0, 1, 1, 1,
-0.6863034, -1.443933, -2.031719, 1, 0, 0, 1, 1,
-0.684212, -0.6064411, -2.21764, 1, 0, 0, 1, 1,
-0.6828534, -1.555303, -2.435808, 1, 0, 0, 1, 1,
-0.6813979, -0.4352466, -2.985334, 1, 0, 0, 1, 1,
-0.6760806, 0.2789096, -2.359606, 1, 0, 0, 1, 1,
-0.6739601, 1.628034, 2.211538, 0, 0, 0, 1, 1,
-0.6727441, -0.355019, -0.08897427, 0, 0, 0, 1, 1,
-0.6696561, 1.287508, 0.07856502, 0, 0, 0, 1, 1,
-0.661394, -0.6230742, -3.705594, 0, 0, 0, 1, 1,
-0.6596987, -0.1325911, -3.031277, 0, 0, 0, 1, 1,
-0.6536628, 2.967031, 0.3395449, 0, 0, 0, 1, 1,
-0.6507722, -0.494482, -2.674644, 0, 0, 0, 1, 1,
-0.6496764, -0.09084231, 0.6319883, 1, 1, 1, 1, 1,
-0.6415378, -0.7192026, -0.8953156, 1, 1, 1, 1, 1,
-0.6406654, 0.136601, -1.452026, 1, 1, 1, 1, 1,
-0.6338043, -0.6728533, -1.797168, 1, 1, 1, 1, 1,
-0.6292896, -0.1922006, -2.594334, 1, 1, 1, 1, 1,
-0.6285222, 0.05698231, -1.161945, 1, 1, 1, 1, 1,
-0.6233303, -0.1528683, -3.121818, 1, 1, 1, 1, 1,
-0.6194736, 1.129496, -1.763718, 1, 1, 1, 1, 1,
-0.6145967, -0.004125971, -2.979039, 1, 1, 1, 1, 1,
-0.6140711, -0.6481613, -1.389885, 1, 1, 1, 1, 1,
-0.613216, -0.4616444, -1.25842, 1, 1, 1, 1, 1,
-0.6126621, 0.4296377, -0.3270952, 1, 1, 1, 1, 1,
-0.6104949, -0.712994, -3.160618, 1, 1, 1, 1, 1,
-0.6094358, -1.219054, -2.272094, 1, 1, 1, 1, 1,
-0.607569, -1.143679, -4.033774, 1, 1, 1, 1, 1,
-0.6068538, -0.293758, -1.561376, 0, 0, 1, 1, 1,
-0.6058718, -0.3670323, -2.274772, 1, 0, 0, 1, 1,
-0.6058559, 0.8644545, -1.463646, 1, 0, 0, 1, 1,
-0.6019915, -0.03329895, -1.38557, 1, 0, 0, 1, 1,
-0.6015555, -0.162849, -0.7469779, 1, 0, 0, 1, 1,
-0.6010174, 0.1500626, -0.9741274, 1, 0, 0, 1, 1,
-0.5993394, -0.6435326, -1.010199, 0, 0, 0, 1, 1,
-0.5957556, 0.6698, -1.815251, 0, 0, 0, 1, 1,
-0.5920432, 1.340415, -0.1226423, 0, 0, 0, 1, 1,
-0.5916691, -0.73306, -2.358543, 0, 0, 0, 1, 1,
-0.5910205, -0.08849569, -0.6376019, 0, 0, 0, 1, 1,
-0.5904971, 0.3712444, -1.479005, 0, 0, 0, 1, 1,
-0.5884818, -1.361207, -2.423382, 0, 0, 0, 1, 1,
-0.5883629, 0.09173396, -1.718674, 1, 1, 1, 1, 1,
-0.5883406, 1.166497, -2.145742, 1, 1, 1, 1, 1,
-0.5795597, 0.09202931, -2.852146, 1, 1, 1, 1, 1,
-0.5780671, 0.2666216, -0.04681251, 1, 1, 1, 1, 1,
-0.5752699, -0.001260291, -1.208564, 1, 1, 1, 1, 1,
-0.5726925, -1.076962, -2.335266, 1, 1, 1, 1, 1,
-0.5680255, -0.3426585, -2.666106, 1, 1, 1, 1, 1,
-0.56506, 0.6106364, -1.77685, 1, 1, 1, 1, 1,
-0.5627576, -0.5876471, -1.435533, 1, 1, 1, 1, 1,
-0.5621983, 0.2880793, -1.2932, 1, 1, 1, 1, 1,
-0.5618762, -0.2239122, -1.944807, 1, 1, 1, 1, 1,
-0.5615293, 0.7430279, -0.9864407, 1, 1, 1, 1, 1,
-0.5576132, -0.7204843, -3.015625, 1, 1, 1, 1, 1,
-0.5571184, -0.6316514, -1.361524, 1, 1, 1, 1, 1,
-0.5498994, 0.5182782, -1.206751, 1, 1, 1, 1, 1,
-0.5438766, -1.839947, -4.045842, 0, 0, 1, 1, 1,
-0.5411702, 0.7485864, 0.0121824, 1, 0, 0, 1, 1,
-0.5357931, 0.543673, 0.3240679, 1, 0, 0, 1, 1,
-0.5252922, 0.814867, -2.162963, 1, 0, 0, 1, 1,
-0.523705, -0.2545733, -1.21082, 1, 0, 0, 1, 1,
-0.5220959, -2.385661, -3.06113, 1, 0, 0, 1, 1,
-0.5185189, -0.3920336, -0.9985932, 0, 0, 0, 1, 1,
-0.5175998, 1.073609, -0.2693517, 0, 0, 0, 1, 1,
-0.514129, -1.249102, -3.441036, 0, 0, 0, 1, 1,
-0.5126404, 0.2013685, -2.086953, 0, 0, 0, 1, 1,
-0.5075978, -1.437211, -1.44904, 0, 0, 0, 1, 1,
-0.5064985, 2.067281, -1.33519, 0, 0, 0, 1, 1,
-0.5030094, 0.2161975, -1.08899, 0, 0, 0, 1, 1,
-0.5008151, -0.9742818, -2.321433, 1, 1, 1, 1, 1,
-0.4969465, 0.7061806, -0.5061222, 1, 1, 1, 1, 1,
-0.496649, -2.082226, -2.397907, 1, 1, 1, 1, 1,
-0.4943011, -1.521511, -2.315973, 1, 1, 1, 1, 1,
-0.4922393, 0.9092385, -1.269372, 1, 1, 1, 1, 1,
-0.4836545, -0.5974945, -0.5539526, 1, 1, 1, 1, 1,
-0.4824506, -0.1454128, -2.856997, 1, 1, 1, 1, 1,
-0.4818855, 0.2186111, -1.197118, 1, 1, 1, 1, 1,
-0.4809507, -0.044267, -2.079181, 1, 1, 1, 1, 1,
-0.4789735, 0.9892279, -0.05949847, 1, 1, 1, 1, 1,
-0.4768572, -0.1793174, -1.98631, 1, 1, 1, 1, 1,
-0.4759831, 2.195182, -1.201695, 1, 1, 1, 1, 1,
-0.4755679, 0.8221301, -0.9817383, 1, 1, 1, 1, 1,
-0.4749697, 1.105976, -0.377429, 1, 1, 1, 1, 1,
-0.4698775, 1.614979, 1.140795, 1, 1, 1, 1, 1,
-0.4686299, 0.2736221, -2.645777, 0, 0, 1, 1, 1,
-0.4635548, 0.5695434, -0.8922137, 1, 0, 0, 1, 1,
-0.4609869, -0.7660481, -2.592635, 1, 0, 0, 1, 1,
-0.4582644, 0.5476311, -0.7822163, 1, 0, 0, 1, 1,
-0.4576176, -0.7026325, -2.049706, 1, 0, 0, 1, 1,
-0.456188, -0.123299, -3.283531, 1, 0, 0, 1, 1,
-0.4547239, -0.3374816, -2.024098, 0, 0, 0, 1, 1,
-0.4442838, -0.4365613, -2.928505, 0, 0, 0, 1, 1,
-0.4433289, -1.112354, -3.215903, 0, 0, 0, 1, 1,
-0.4319772, 1.018678, -0.1382414, 0, 0, 0, 1, 1,
-0.4272831, 0.7757931, 0.7923068, 0, 0, 0, 1, 1,
-0.4177666, 1.763441, 0.4102631, 0, 0, 0, 1, 1,
-0.4169286, -0.2022829, -0.4799511, 0, 0, 0, 1, 1,
-0.4120112, -0.4761074, -3.282737, 1, 1, 1, 1, 1,
-0.4083585, 0.4342857, -0.8928695, 1, 1, 1, 1, 1,
-0.4018095, -1.080288, -2.142567, 1, 1, 1, 1, 1,
-0.400333, -0.6589224, -3.748719, 1, 1, 1, 1, 1,
-0.3959883, -1.266743, -3.651502, 1, 1, 1, 1, 1,
-0.3948987, 1.09085, -0.7824285, 1, 1, 1, 1, 1,
-0.3922092, -3.188403, -3.36766, 1, 1, 1, 1, 1,
-0.3915228, 0.3830414, -0.06347271, 1, 1, 1, 1, 1,
-0.390209, -1.377566, -4.891347, 1, 1, 1, 1, 1,
-0.3855374, 0.09127859, 0.144425, 1, 1, 1, 1, 1,
-0.3854263, -1.523126, -1.989882, 1, 1, 1, 1, 1,
-0.3841006, -1.651955, -2.86842, 1, 1, 1, 1, 1,
-0.3569258, 0.9947268, 0.2482838, 1, 1, 1, 1, 1,
-0.3556077, 1.089875, 0.03927398, 1, 1, 1, 1, 1,
-0.3524905, -0.3995085, -4.599331, 1, 1, 1, 1, 1,
-0.3443514, -2.029545, -3.074119, 0, 0, 1, 1, 1,
-0.3420249, 0.08423737, 1.128422, 1, 0, 0, 1, 1,
-0.3416539, -0.534255, -3.383544, 1, 0, 0, 1, 1,
-0.3398365, -0.4699159, -3.066846, 1, 0, 0, 1, 1,
-0.3267533, 0.02398458, -0.8588802, 1, 0, 0, 1, 1,
-0.3248842, -0.8971992, -1.811233, 1, 0, 0, 1, 1,
-0.3209166, 1.215476, -0.5185527, 0, 0, 0, 1, 1,
-0.3146772, -0.6950669, -5.195738, 0, 0, 0, 1, 1,
-0.3122876, 1.539864, -0.727154, 0, 0, 0, 1, 1,
-0.3112545, 1.602164, 0.8137506, 0, 0, 0, 1, 1,
-0.3111056, 0.9135457, 1.441579, 0, 0, 0, 1, 1,
-0.3073425, -1.778185, -2.791702, 0, 0, 0, 1, 1,
-0.305851, -1.857791, -3.719586, 0, 0, 0, 1, 1,
-0.3049576, 1.679204, -0.6737468, 1, 1, 1, 1, 1,
-0.3048485, -0.7666804, -3.97738, 1, 1, 1, 1, 1,
-0.3043571, -0.307243, -3.326979, 1, 1, 1, 1, 1,
-0.3028122, 0.5561056, -0.4306325, 1, 1, 1, 1, 1,
-0.2861977, 0.8186707, -0.1815359, 1, 1, 1, 1, 1,
-0.2818297, 0.2265802, -1.070961, 1, 1, 1, 1, 1,
-0.2785847, -1.207455, -1.157374, 1, 1, 1, 1, 1,
-0.2782561, 0.05716749, -1.350857, 1, 1, 1, 1, 1,
-0.270979, 0.993323, -0.4415643, 1, 1, 1, 1, 1,
-0.2696509, 0.23165, -0.7283359, 1, 1, 1, 1, 1,
-0.2691092, 0.5491856, -0.05978258, 1, 1, 1, 1, 1,
-0.2684017, 0.7817605, -0.03658355, 1, 1, 1, 1, 1,
-0.2665891, -0.4069146, -4.142461, 1, 1, 1, 1, 1,
-0.2662981, -0.5170413, -2.73689, 1, 1, 1, 1, 1,
-0.2619684, 1.495848, -0.4765396, 1, 1, 1, 1, 1,
-0.2605917, 1.213661, -1.311063, 0, 0, 1, 1, 1,
-0.260356, 0.04783319, -1.613345, 1, 0, 0, 1, 1,
-0.2596977, -1.229036, -1.751886, 1, 0, 0, 1, 1,
-0.258502, 1.060132, 0.6635427, 1, 0, 0, 1, 1,
-0.2572934, 1.116927, -0.5129206, 1, 0, 0, 1, 1,
-0.2558565, 1.438061, -0.01919189, 1, 0, 0, 1, 1,
-0.2550897, -0.002083904, -0.6148271, 0, 0, 0, 1, 1,
-0.2550886, 1.376665, 0.6445611, 0, 0, 0, 1, 1,
-0.25403, -1.458538, -1.250167, 0, 0, 0, 1, 1,
-0.2480275, -0.3943763, -3.314829, 0, 0, 0, 1, 1,
-0.2471828, -1.612942, -3.316056, 0, 0, 0, 1, 1,
-0.2418764, -0.4024384, -0.6361237, 0, 0, 0, 1, 1,
-0.2384436, -0.4156537, -1.773306, 0, 0, 0, 1, 1,
-0.2363747, -1.440071, -3.841545, 1, 1, 1, 1, 1,
-0.2305939, -0.7342467, -1.39876, 1, 1, 1, 1, 1,
-0.2299662, -0.5169133, -0.366475, 1, 1, 1, 1, 1,
-0.2262407, 1.095913, 0.7270096, 1, 1, 1, 1, 1,
-0.2244723, 0.6878974, -0.647016, 1, 1, 1, 1, 1,
-0.222497, -0.735312, -2.488903, 1, 1, 1, 1, 1,
-0.2202989, 0.1725928, -1.673135, 1, 1, 1, 1, 1,
-0.2188939, -0.2413855, -4.039746, 1, 1, 1, 1, 1,
-0.2166273, 0.362642, 1.684013, 1, 1, 1, 1, 1,
-0.2151051, 0.9727386, -1.079299, 1, 1, 1, 1, 1,
-0.2141848, 1.969897, -0.4131661, 1, 1, 1, 1, 1,
-0.2012925, 0.641845, -0.5358929, 1, 1, 1, 1, 1,
-0.2004976, -0.9327245, -4.327807, 1, 1, 1, 1, 1,
-0.2001058, 2.318926, 0.5424588, 1, 1, 1, 1, 1,
-0.1998235, -0.2157321, -4.023259, 1, 1, 1, 1, 1,
-0.198408, -1.181265, -2.57819, 0, 0, 1, 1, 1,
-0.1939083, 0.892938, -1.858544, 1, 0, 0, 1, 1,
-0.1936401, -1.137097, -1.985167, 1, 0, 0, 1, 1,
-0.1918618, -0.8417508, -3.365934, 1, 0, 0, 1, 1,
-0.1891826, -0.1646375, -2.944559, 1, 0, 0, 1, 1,
-0.1862375, -0.4571946, -1.434891, 1, 0, 0, 1, 1,
-0.1854666, -0.3604261, -0.8621162, 0, 0, 0, 1, 1,
-0.1853679, 0.3245738, -0.3299814, 0, 0, 0, 1, 1,
-0.1771935, 2.431854, -0.4282157, 0, 0, 0, 1, 1,
-0.1757247, 0.2814664, 0.357769, 0, 0, 0, 1, 1,
-0.1755009, 0.8835599, -0.2608624, 0, 0, 0, 1, 1,
-0.1744856, -0.3543267, -3.263303, 0, 0, 0, 1, 1,
-0.1731522, -0.4906324, -2.421395, 0, 0, 0, 1, 1,
-0.1700586, -0.7132452, -0.4865926, 1, 1, 1, 1, 1,
-0.1674815, -0.3890808, -2.304691, 1, 1, 1, 1, 1,
-0.1674235, -0.7130167, -2.965862, 1, 1, 1, 1, 1,
-0.1662943, -0.4972291, -2.389771, 1, 1, 1, 1, 1,
-0.164739, 0.06236778, -1.561309, 1, 1, 1, 1, 1,
-0.162858, 1.735835, 0.6146631, 1, 1, 1, 1, 1,
-0.1603881, 1.589322, -0.3266418, 1, 1, 1, 1, 1,
-0.1602786, 0.280488, -2.752825, 1, 1, 1, 1, 1,
-0.1602703, -0.6401347, -3.863484, 1, 1, 1, 1, 1,
-0.1455349, 0.9794905, -0.4586708, 1, 1, 1, 1, 1,
-0.1414894, 0.9748517, -0.1782745, 1, 1, 1, 1, 1,
-0.140177, 0.7847463, 0.4663679, 1, 1, 1, 1, 1,
-0.1328304, 0.1725971, -0.3391911, 1, 1, 1, 1, 1,
-0.1321629, 0.1249876, 0.4933824, 1, 1, 1, 1, 1,
-0.1257864, -0.4648323, -2.91558, 1, 1, 1, 1, 1,
-0.1255458, -0.5852059, -2.536561, 0, 0, 1, 1, 1,
-0.1244654, -0.2043938, -3.004334, 1, 0, 0, 1, 1,
-0.116677, 1.443105, 0.1377374, 1, 0, 0, 1, 1,
-0.113403, 0.383332, -1.9261, 1, 0, 0, 1, 1,
-0.1111276, -0.1122875, -2.808837, 1, 0, 0, 1, 1,
-0.1106576, 0.3345345, -0.5957487, 1, 0, 0, 1, 1,
-0.1091213, -1.716804, -2.570745, 0, 0, 0, 1, 1,
-0.1041097, -2.144013, -3.620911, 0, 0, 0, 1, 1,
-0.1025039, 0.3314537, 0.6639243, 0, 0, 0, 1, 1,
-0.09948689, 1.425809, 1.200143, 0, 0, 0, 1, 1,
-0.09922221, 0.6183699, -1.173241, 0, 0, 0, 1, 1,
-0.09149539, -0.4439734, -2.313923, 0, 0, 0, 1, 1,
-0.09125537, -2.084455, -3.48978, 0, 0, 0, 1, 1,
-0.08994912, -0.03383553, -3.363312, 1, 1, 1, 1, 1,
-0.0882588, 0.04141301, -1.996237, 1, 1, 1, 1, 1,
-0.08515102, 0.4007041, -2.207954, 1, 1, 1, 1, 1,
-0.08207031, 0.1746152, -1.803129, 1, 1, 1, 1, 1,
-0.08098292, 1.067455, 1.811735, 1, 1, 1, 1, 1,
-0.0768327, 0.196801, -0.2595568, 1, 1, 1, 1, 1,
-0.0757485, -0.002393061, -2.613268, 1, 1, 1, 1, 1,
-0.07546207, 1.205566, -0.3664929, 1, 1, 1, 1, 1,
-0.07413851, 0.9912372, -0.4706133, 1, 1, 1, 1, 1,
-0.07276874, 1.080472, 0.1049405, 1, 1, 1, 1, 1,
-0.0721525, -1.09872, -4.127592, 1, 1, 1, 1, 1,
-0.07157827, 1.561035, -1.299138, 1, 1, 1, 1, 1,
-0.07150253, -0.1714881, -2.884946, 1, 1, 1, 1, 1,
-0.06713963, -0.3853426, -2.644722, 1, 1, 1, 1, 1,
-0.06651028, 0.3728843, 0.5356485, 1, 1, 1, 1, 1,
-0.05183145, 0.01078705, -2.357271, 0, 0, 1, 1, 1,
-0.04383079, 0.5748563, 1.532682, 1, 0, 0, 1, 1,
-0.0408731, -0.7919633, -3.946852, 1, 0, 0, 1, 1,
-0.03892322, 0.2534818, -1.894118, 1, 0, 0, 1, 1,
-0.03698141, -0.02627741, -2.676469, 1, 0, 0, 1, 1,
-0.03609132, 0.6348363, 0.7309338, 1, 0, 0, 1, 1,
-0.03551421, 1.449532, 0.3063086, 0, 0, 0, 1, 1,
-0.03378282, 0.975301, -0.9884308, 0, 0, 0, 1, 1,
-0.02950202, -0.09133183, -3.509969, 0, 0, 0, 1, 1,
-0.02912747, 1.170238, -0.6562357, 0, 0, 0, 1, 1,
-0.02586726, 0.4829665, 0.6865323, 0, 0, 0, 1, 1,
-0.02397359, -1.006562, -3.960705, 0, 0, 0, 1, 1,
-0.01889327, 1.616436, -1.391503, 0, 0, 0, 1, 1,
-0.01363041, 0.7911074, 2.973307, 1, 1, 1, 1, 1,
-0.008763806, -0.5330873, -4.403253, 1, 1, 1, 1, 1,
-0.005575612, -0.5440608, -5.451361, 1, 1, 1, 1, 1,
-0.004235784, -0.6005591, -0.7299145, 1, 1, 1, 1, 1,
-0.00198092, -1.139342, -1.88653, 1, 1, 1, 1, 1,
5.087578e-05, -1.500347, 1.824605, 1, 1, 1, 1, 1,
0.0005573046, 0.09849748, 0.4292072, 1, 1, 1, 1, 1,
0.002404326, -1.178081, 5.406052, 1, 1, 1, 1, 1,
0.002508054, -0.1465193, 2.374656, 1, 1, 1, 1, 1,
0.002803328, 0.2437432, -1.08349, 1, 1, 1, 1, 1,
0.002945505, -0.8711118, 4.25044, 1, 1, 1, 1, 1,
0.002979251, 0.8476543, -0.3365901, 1, 1, 1, 1, 1,
0.01226718, 0.01410611, 1.281703, 1, 1, 1, 1, 1,
0.01432406, -1.105977, 4.428452, 1, 1, 1, 1, 1,
0.01736584, -0.1760436, 4.024359, 1, 1, 1, 1, 1,
0.01892076, -1.515911, 3.074061, 0, 0, 1, 1, 1,
0.02005282, 0.1857881, 1.966995, 1, 0, 0, 1, 1,
0.02475702, 0.5323728, 0.9534725, 1, 0, 0, 1, 1,
0.02547291, 0.04250472, 1.40293, 1, 0, 0, 1, 1,
0.02912717, -0.8497937, 2.0145, 1, 0, 0, 1, 1,
0.03182581, 0.693204, 0.4363295, 1, 0, 0, 1, 1,
0.03648461, -0.9316697, 2.818609, 0, 0, 0, 1, 1,
0.03960012, 0.4827019, -0.6749523, 0, 0, 0, 1, 1,
0.04758279, 0.6110945, -0.3142215, 0, 0, 0, 1, 1,
0.04854279, -1.464285, 2.731323, 0, 0, 0, 1, 1,
0.05213124, 0.1509517, 1.61471, 0, 0, 0, 1, 1,
0.05596888, 1.175486, 0.120244, 0, 0, 0, 1, 1,
0.05917415, 0.1254267, 1.936509, 0, 0, 0, 1, 1,
0.06018832, 0.09357508, 1.50506, 1, 1, 1, 1, 1,
0.06124081, 0.04719052, 1.924577, 1, 1, 1, 1, 1,
0.06344374, 0.6960539, 0.6615987, 1, 1, 1, 1, 1,
0.06862853, -0.08354595, 1.98939, 1, 1, 1, 1, 1,
0.06971857, -0.4338515, 2.67144, 1, 1, 1, 1, 1,
0.07621453, -0.3867911, 1.591332, 1, 1, 1, 1, 1,
0.07824595, 0.1366135, 1.148023, 1, 1, 1, 1, 1,
0.07833198, -1.806004, 2.375915, 1, 1, 1, 1, 1,
0.07834224, 1.865961, 0.6759279, 1, 1, 1, 1, 1,
0.08286184, 0.9913228, -0.03684462, 1, 1, 1, 1, 1,
0.08363335, 0.0858933, 1.101912, 1, 1, 1, 1, 1,
0.09357556, 0.7880196, 1.2299, 1, 1, 1, 1, 1,
0.0950073, 1.732351, -0.2422751, 1, 1, 1, 1, 1,
0.1019265, -0.4288885, 1.982758, 1, 1, 1, 1, 1,
0.1024225, 0.6280129, 0.8107662, 1, 1, 1, 1, 1,
0.105496, -1.284125, 3.500783, 0, 0, 1, 1, 1,
0.1059669, 1.29499, 1.100028, 1, 0, 0, 1, 1,
0.1114873, 0.2066462, 0.6135368, 1, 0, 0, 1, 1,
0.1132147, -0.02341198, 0.8350874, 1, 0, 0, 1, 1,
0.1137587, -0.3122271, 1.761932, 1, 0, 0, 1, 1,
0.1158152, 0.8196589, -0.2242476, 1, 0, 0, 1, 1,
0.1249413, -0.1622828, 3.473065, 0, 0, 0, 1, 1,
0.1260296, -0.02600684, 0.5353525, 0, 0, 0, 1, 1,
0.126456, -0.1470555, -0.2972653, 0, 0, 0, 1, 1,
0.1278166, 1.056013, -0.2855318, 0, 0, 0, 1, 1,
0.1301438, -1.490648, 3.209544, 0, 0, 0, 1, 1,
0.1323973, -0.2807471, 3.126555, 0, 0, 0, 1, 1,
0.1341888, 0.5344328, -0.6436864, 0, 0, 0, 1, 1,
0.1347896, 0.04561154, 0.06074082, 1, 1, 1, 1, 1,
0.1412989, -0.2225851, 4.557326, 1, 1, 1, 1, 1,
0.1464414, 0.2385462, 0.3934958, 1, 1, 1, 1, 1,
0.1547986, -1.024608, 3.223504, 1, 1, 1, 1, 1,
0.1574185, 1.536408, 0.9034106, 1, 1, 1, 1, 1,
0.1611292, -1.035069, 1.932056, 1, 1, 1, 1, 1,
0.1657321, -0.5794704, 2.203042, 1, 1, 1, 1, 1,
0.1673764, -1.730667, 2.471313, 1, 1, 1, 1, 1,
0.1678955, -0.7830657, 2.264139, 1, 1, 1, 1, 1,
0.1700891, 0.7164574, -0.1770436, 1, 1, 1, 1, 1,
0.1731206, -0.08580044, 2.041347, 1, 1, 1, 1, 1,
0.1750385, 0.2690674, 1.786678, 1, 1, 1, 1, 1,
0.1752014, -0.146343, 0.6839538, 1, 1, 1, 1, 1,
0.1758359, -0.7356794, 3.821845, 1, 1, 1, 1, 1,
0.1760536, -1.14602, 1.9084, 1, 1, 1, 1, 1,
0.1884448, 0.9708328, -0.9758536, 0, 0, 1, 1, 1,
0.1888357, -0.1244707, 1.136238, 1, 0, 0, 1, 1,
0.1909561, -0.7329803, 3.086736, 1, 0, 0, 1, 1,
0.1928021, -0.3897431, 3.372392, 1, 0, 0, 1, 1,
0.1957553, -0.02704463, 2.043979, 1, 0, 0, 1, 1,
0.201416, 0.3787627, 0.3832817, 1, 0, 0, 1, 1,
0.2054137, -0.3541021, 1.9447, 0, 0, 0, 1, 1,
0.2069961, -0.6375945, 2.828565, 0, 0, 0, 1, 1,
0.2079398, -0.1569686, 2.522387, 0, 0, 0, 1, 1,
0.2124865, -0.0344593, 1.406648, 0, 0, 0, 1, 1,
0.2157598, -0.3142034, 1.367321, 0, 0, 0, 1, 1,
0.2166025, 1.893585, 1.326614, 0, 0, 0, 1, 1,
0.217043, 0.02767532, 2.075366, 0, 0, 0, 1, 1,
0.2224165, 0.7619122, 1.698669, 1, 1, 1, 1, 1,
0.2227636, -1.733791, 3.200466, 1, 1, 1, 1, 1,
0.222941, -0.1287774, 2.375284, 1, 1, 1, 1, 1,
0.2243642, -0.1719266, 2.17305, 1, 1, 1, 1, 1,
0.2248963, 1.114635, 1.971377, 1, 1, 1, 1, 1,
0.2262202, 1.264699, 0.9912017, 1, 1, 1, 1, 1,
0.230833, -0.5578707, 3.346236, 1, 1, 1, 1, 1,
0.2326289, 0.6388783, 1.088392, 1, 1, 1, 1, 1,
0.2348134, -0.3866013, 0.8891959, 1, 1, 1, 1, 1,
0.2389794, -0.08975812, 2.930545, 1, 1, 1, 1, 1,
0.2426675, 0.04535758, 0.162776, 1, 1, 1, 1, 1,
0.2475378, -0.04022319, 2.148657, 1, 1, 1, 1, 1,
0.2476321, 0.4022076, -0.5862691, 1, 1, 1, 1, 1,
0.2483245, -0.2605863, 0.4399484, 1, 1, 1, 1, 1,
0.2528703, 0.7103783, -1.000339, 1, 1, 1, 1, 1,
0.253747, 0.3982806, 1.368025, 0, 0, 1, 1, 1,
0.2634238, -1.691746, 3.392839, 1, 0, 0, 1, 1,
0.2635548, 2.527477, -2.256276, 1, 0, 0, 1, 1,
0.2645308, -1.199586, 1.902686, 1, 0, 0, 1, 1,
0.2669513, -0.6336979, 1.801575, 1, 0, 0, 1, 1,
0.2765382, 3.008992, -1.129244, 1, 0, 0, 1, 1,
0.2798209, 0.3130451, 1.699933, 0, 0, 0, 1, 1,
0.2815215, -0.4847287, 1.087211, 0, 0, 0, 1, 1,
0.2820809, -0.4961901, 1.990107, 0, 0, 0, 1, 1,
0.2849631, -0.2351311, 1.110514, 0, 0, 0, 1, 1,
0.2855018, 0.0563511, -0.1841791, 0, 0, 0, 1, 1,
0.2887373, -1.723789, 4.055434, 0, 0, 0, 1, 1,
0.2887498, -0.6432893, 3.420149, 0, 0, 0, 1, 1,
0.2929465, 0.3584124, 2.10429, 1, 1, 1, 1, 1,
0.2944552, 1.670016, -0.486849, 1, 1, 1, 1, 1,
0.2957255, 0.6283749, 1.297731, 1, 1, 1, 1, 1,
0.3073069, 0.3006387, 0.02121859, 1, 1, 1, 1, 1,
0.3085645, 0.170902, 0.8412138, 1, 1, 1, 1, 1,
0.3126741, 0.1970177, 0.4700925, 1, 1, 1, 1, 1,
0.3175752, 0.8588355, -0.7028924, 1, 1, 1, 1, 1,
0.3207971, 0.5941905, -0.2808738, 1, 1, 1, 1, 1,
0.3211783, -0.9516091, 3.169343, 1, 1, 1, 1, 1,
0.323776, 0.09105632, 1.839885, 1, 1, 1, 1, 1,
0.3335958, -0.6400334, 2.894929, 1, 1, 1, 1, 1,
0.3373483, 0.2929778, 0.2116971, 1, 1, 1, 1, 1,
0.3385605, 0.4889141, 0.302349, 1, 1, 1, 1, 1,
0.342219, 2.488707, -0.2482163, 1, 1, 1, 1, 1,
0.345947, 0.003727919, 1.580125, 1, 1, 1, 1, 1,
0.3476889, 2.281557, -0.5258644, 0, 0, 1, 1, 1,
0.3570243, -1.442977, 4.627614, 1, 0, 0, 1, 1,
0.3596427, 2.752581, -0.2565582, 1, 0, 0, 1, 1,
0.3597773, 0.2087774, 2.817719, 1, 0, 0, 1, 1,
0.3600643, 1.537285, 1.080162, 1, 0, 0, 1, 1,
0.3606595, 0.7657328, -1.479062, 1, 0, 0, 1, 1,
0.3623778, -0.668754, 2.355947, 0, 0, 0, 1, 1,
0.362742, 1.653115, 1.660075, 0, 0, 0, 1, 1,
0.3682551, -0.3295401, 2.965174, 0, 0, 0, 1, 1,
0.3710195, -1.066986, 3.95014, 0, 0, 0, 1, 1,
0.3800518, -0.9559385, 0.7201087, 0, 0, 0, 1, 1,
0.3874032, -0.4227185, 2.848677, 0, 0, 0, 1, 1,
0.3892046, 0.6391839, 0.3626816, 0, 0, 0, 1, 1,
0.3897786, 0.3026226, -0.01798213, 1, 1, 1, 1, 1,
0.3924323, -1.427333, 4.476353, 1, 1, 1, 1, 1,
0.3955688, -2.068051, 4.357667, 1, 1, 1, 1, 1,
0.3959984, -1.209225, 2.092296, 1, 1, 1, 1, 1,
0.400013, -0.3287342, 3.54776, 1, 1, 1, 1, 1,
0.406679, -0.8261952, 3.487116, 1, 1, 1, 1, 1,
0.4111763, 0.2653261, 0.3922361, 1, 1, 1, 1, 1,
0.4114666, 1.031778, 0.8049118, 1, 1, 1, 1, 1,
0.4126301, 1.470152, 0.1765578, 1, 1, 1, 1, 1,
0.4147652, 0.9274973, 0.1653568, 1, 1, 1, 1, 1,
0.4158349, 0.9924852, 1.18817, 1, 1, 1, 1, 1,
0.4193168, -0.2916233, 2.686812, 1, 1, 1, 1, 1,
0.4209611, 0.1466065, 2.545425, 1, 1, 1, 1, 1,
0.4246521, 0.103008, 2.157473, 1, 1, 1, 1, 1,
0.4358205, -0.4902463, 2.340971, 1, 1, 1, 1, 1,
0.436253, 1.241358, -0.162516, 0, 0, 1, 1, 1,
0.4409409, 0.4718017, 0.9417425, 1, 0, 0, 1, 1,
0.4455572, -0.9836633, 3.551944, 1, 0, 0, 1, 1,
0.4480014, 0.863627, 0.3577133, 1, 0, 0, 1, 1,
0.4496091, 0.3504545, -0.003269042, 1, 0, 0, 1, 1,
0.4517153, -0.4937564, 1.312944, 1, 0, 0, 1, 1,
0.451764, 1.124567, -0.2467011, 0, 0, 0, 1, 1,
0.4620121, -0.761148, 1.542178, 0, 0, 0, 1, 1,
0.4633147, 0.6033687, 1.411937, 0, 0, 0, 1, 1,
0.4638137, 0.9510686, 1.384805, 0, 0, 0, 1, 1,
0.4670664, 0.5319137, 1.207499, 0, 0, 0, 1, 1,
0.4672481, -0.8183414, 2.497835, 0, 0, 0, 1, 1,
0.4683723, 0.3499724, 0.8944399, 0, 0, 0, 1, 1,
0.4688422, 1.269039, -0.1526793, 1, 1, 1, 1, 1,
0.4791515, 1.84058, -1.187341, 1, 1, 1, 1, 1,
0.4792718, -0.1768312, 1.790981, 1, 1, 1, 1, 1,
0.4823513, -0.2527916, 2.046086, 1, 1, 1, 1, 1,
0.4931777, 1.951814, 0.3124642, 1, 1, 1, 1, 1,
0.4970546, 0.7969443, 1.489453, 1, 1, 1, 1, 1,
0.501815, 2.059951, 0.662328, 1, 1, 1, 1, 1,
0.5032884, -0.1721514, 2.474672, 1, 1, 1, 1, 1,
0.5047545, -0.02980644, 3.326366, 1, 1, 1, 1, 1,
0.5146128, 1.790424, 0.444026, 1, 1, 1, 1, 1,
0.5202209, -1.020206, 3.88106, 1, 1, 1, 1, 1,
0.5220056, -0.6347588, 0.7317231, 1, 1, 1, 1, 1,
0.5246203, -0.1275195, 4.850651, 1, 1, 1, 1, 1,
0.5258428, -1.021812, 2.705176, 1, 1, 1, 1, 1,
0.5278508, -0.5290369, 2.447483, 1, 1, 1, 1, 1,
0.5296982, -0.7237713, 1.407852, 0, 0, 1, 1, 1,
0.5306971, -0.09344314, 1.174482, 1, 0, 0, 1, 1,
0.5331002, -1.09027, 2.086302, 1, 0, 0, 1, 1,
0.5348092, 1.649018, -0.7208742, 1, 0, 0, 1, 1,
0.5376387, -1.097924, 3.171185, 1, 0, 0, 1, 1,
0.5400397, 0.8365571, 0.9509079, 1, 0, 0, 1, 1,
0.5424482, -0.343345, 1.958807, 0, 0, 0, 1, 1,
0.5440938, -1.446407, 2.770341, 0, 0, 0, 1, 1,
0.545653, -0.5128802, 1.226239, 0, 0, 0, 1, 1,
0.548201, -0.3887177, 0.5654955, 0, 0, 0, 1, 1,
0.5698035, -0.3347156, 2.001136, 0, 0, 0, 1, 1,
0.5698403, -0.4443471, 1.773156, 0, 0, 0, 1, 1,
0.5698692, 1.221458, 0.1332377, 0, 0, 0, 1, 1,
0.5734119, 1.059616, 0.9359313, 1, 1, 1, 1, 1,
0.5821124, 0.3497801, 1.250446, 1, 1, 1, 1, 1,
0.5828484, -0.5985156, 2.776021, 1, 1, 1, 1, 1,
0.5839862, 1.762239, -0.4337568, 1, 1, 1, 1, 1,
0.5855654, 1.700651, -0.2936613, 1, 1, 1, 1, 1,
0.5855774, -2.050824, 3.355475, 1, 1, 1, 1, 1,
0.5900218, -0.03885626, 2.414594, 1, 1, 1, 1, 1,
0.5939796, 0.4397924, 1.854704, 1, 1, 1, 1, 1,
0.5955068, 0.2580926, -0.3150198, 1, 1, 1, 1, 1,
0.5967305, 1.328508, 1.398885, 1, 1, 1, 1, 1,
0.6016213, -0.5613536, 2.092335, 1, 1, 1, 1, 1,
0.6016698, -0.04138762, 1.418131, 1, 1, 1, 1, 1,
0.6019087, -0.1548894, 2.331878, 1, 1, 1, 1, 1,
0.6019622, 0.01649273, 0.5952611, 1, 1, 1, 1, 1,
0.6079012, 0.0924949, 0.1518073, 1, 1, 1, 1, 1,
0.6087393, 0.566767, 0.6717515, 0, 0, 1, 1, 1,
0.6110569, -1.464529, 3.165762, 1, 0, 0, 1, 1,
0.6156905, 1.077776, 1.86086, 1, 0, 0, 1, 1,
0.626752, -0.4535715, 0.2373535, 1, 0, 0, 1, 1,
0.6285927, -0.6377856, 2.987484, 1, 0, 0, 1, 1,
0.630274, 0.2386408, 0.3227673, 1, 0, 0, 1, 1,
0.6305644, -0.2865337, 3.084255, 0, 0, 0, 1, 1,
0.6305715, 0.636228, -0.7501667, 0, 0, 0, 1, 1,
0.6344956, -0.5589061, 3.2719, 0, 0, 0, 1, 1,
0.6421636, 0.2621469, 1.519347, 0, 0, 0, 1, 1,
0.6423939, 1.773516, 0.1219789, 0, 0, 0, 1, 1,
0.642701, -0.7894796, 1.018713, 0, 0, 0, 1, 1,
0.6464111, -0.2868792, 4.217135, 0, 0, 0, 1, 1,
0.6508211, 0.1085202, 0.4576717, 1, 1, 1, 1, 1,
0.6536355, 0.3481088, 2.342407, 1, 1, 1, 1, 1,
0.6545249, -0.04713031, 0.8122707, 1, 1, 1, 1, 1,
0.6555548, 0.6792206, 1.937496, 1, 1, 1, 1, 1,
0.6605185, 1.317638, 0.8101251, 1, 1, 1, 1, 1,
0.666072, -0.3190427, 2.38913, 1, 1, 1, 1, 1,
0.6723099, -0.8468544, 1.851666, 1, 1, 1, 1, 1,
0.6735153, 0.8760629, -0.4410174, 1, 1, 1, 1, 1,
0.6735861, 1.842903, 1.217074, 1, 1, 1, 1, 1,
0.6768515, 0.9812165, -0.06438211, 1, 1, 1, 1, 1,
0.6772395, 1.930578, 1.911865, 1, 1, 1, 1, 1,
0.6918868, 1.322034, 0.06153769, 1, 1, 1, 1, 1,
0.6923794, -0.8826781, 3.261393, 1, 1, 1, 1, 1,
0.6924486, -0.8270842, 1.952258, 1, 1, 1, 1, 1,
0.693847, -0.1642609, 0.1047448, 1, 1, 1, 1, 1,
0.6946217, 2.798529, -0.155395, 0, 0, 1, 1, 1,
0.6948509, 0.8277954, 0.674002, 1, 0, 0, 1, 1,
0.6953048, -0.8611782, 2.972784, 1, 0, 0, 1, 1,
0.7005982, 1.098867, -0.03435534, 1, 0, 0, 1, 1,
0.7018496, 1.072944, 1.035341, 1, 0, 0, 1, 1,
0.7021843, 0.1099001, 2.191741, 1, 0, 0, 1, 1,
0.7048019, -0.2567003, 1.762079, 0, 0, 0, 1, 1,
0.7140123, -0.5647131, 3.271058, 0, 0, 0, 1, 1,
0.7146839, -0.4887516, 2.480371, 0, 0, 0, 1, 1,
0.7173209, 0.9350339, 2.019623, 0, 0, 0, 1, 1,
0.72175, -0.7706367, 2.608206, 0, 0, 0, 1, 1,
0.7282326, -0.9012295, 2.180135, 0, 0, 0, 1, 1,
0.7357193, 1.397559, -0.4679812, 0, 0, 0, 1, 1,
0.7360479, 0.5826264, 1.789747, 1, 1, 1, 1, 1,
0.7386111, 1.202547, 0.187116, 1, 1, 1, 1, 1,
0.7468547, -0.03147208, 2.648992, 1, 1, 1, 1, 1,
0.7519274, -0.3429555, 2.345589, 1, 1, 1, 1, 1,
0.7534198, 0.516591, 1.593116, 1, 1, 1, 1, 1,
0.7571401, -0.08440562, 2.108036, 1, 1, 1, 1, 1,
0.7573016, 0.3226601, 0.1439807, 1, 1, 1, 1, 1,
0.7620974, 1.542231, -0.3530831, 1, 1, 1, 1, 1,
0.764467, 1.984447, 0.1046524, 1, 1, 1, 1, 1,
0.7685764, 0.7475853, 2.658751, 1, 1, 1, 1, 1,
0.7719662, -0.2612165, 1.664143, 1, 1, 1, 1, 1,
0.7764009, 0.9701792, 0.4164337, 1, 1, 1, 1, 1,
0.7851562, -0.9601991, 3.484305, 1, 1, 1, 1, 1,
0.7854845, 2.68689, -0.04781982, 1, 1, 1, 1, 1,
0.785596, 0.2459988, 2.269317, 1, 1, 1, 1, 1,
0.7948941, 0.2447638, 0.8621194, 0, 0, 1, 1, 1,
0.7975582, -0.1543857, 3.218904, 1, 0, 0, 1, 1,
0.8000964, 2.291135, 2.050882, 1, 0, 0, 1, 1,
0.8019689, 1.392778, -0.2081359, 1, 0, 0, 1, 1,
0.8026307, -2.120676, 2.228229, 1, 0, 0, 1, 1,
0.8045492, -2.01117, 4.215276, 1, 0, 0, 1, 1,
0.8067204, -0.8586597, 3.301314, 0, 0, 0, 1, 1,
0.8143696, 0.4354245, 0.7511195, 0, 0, 0, 1, 1,
0.8144094, -0.8497816, 1.707769, 0, 0, 0, 1, 1,
0.8177062, -0.2002551, 0.9374722, 0, 0, 0, 1, 1,
0.8210523, -0.1040842, 1.11842, 0, 0, 0, 1, 1,
0.8295702, 0.01721608, 0.7728016, 0, 0, 0, 1, 1,
0.8319987, 1.083519, 1.293131, 0, 0, 0, 1, 1,
0.833087, 0.1900072, -0.3538447, 1, 1, 1, 1, 1,
0.8436242, 2.16288, 0.1338901, 1, 1, 1, 1, 1,
0.844198, 0.3358669, 1.270659, 1, 1, 1, 1, 1,
0.8444433, -1.325668, 2.342628, 1, 1, 1, 1, 1,
0.8446497, -0.397683, 2.79614, 1, 1, 1, 1, 1,
0.8460878, 0.1599558, 3.197463, 1, 1, 1, 1, 1,
0.8460921, 0.2146655, 0.5252374, 1, 1, 1, 1, 1,
0.8508905, 0.06930837, -0.305382, 1, 1, 1, 1, 1,
0.8553196, -0.4039564, 2.292169, 1, 1, 1, 1, 1,
0.8629966, -0.3535777, 0.9022493, 1, 1, 1, 1, 1,
0.864751, 1.009142, 1.467914, 1, 1, 1, 1, 1,
0.8679215, 0.6233737, 2.636417, 1, 1, 1, 1, 1,
0.8765597, -0.4321697, 3.291588, 1, 1, 1, 1, 1,
0.8792866, -0.2378709, 0.8714965, 1, 1, 1, 1, 1,
0.8802976, -0.4437969, 0.5939068, 1, 1, 1, 1, 1,
0.8824842, 0.4991571, 1.072234, 0, 0, 1, 1, 1,
0.8830889, 1.493842, 1.266761, 1, 0, 0, 1, 1,
0.8831594, 0.1684767, 2.956134, 1, 0, 0, 1, 1,
0.8837966, 1.298287, 1.525227, 1, 0, 0, 1, 1,
0.8855608, -1.031458, 2.430697, 1, 0, 0, 1, 1,
0.8865547, 0.1981906, 1.268988, 1, 0, 0, 1, 1,
0.8889744, -0.1440409, -0.1416401, 0, 0, 0, 1, 1,
0.889228, 0.7135787, 1.380601, 0, 0, 0, 1, 1,
0.9011605, -0.424705, 2.795763, 0, 0, 0, 1, 1,
0.9083105, -0.8481494, 3.00229, 0, 0, 0, 1, 1,
0.9096277, -0.9659302, 0.8235679, 0, 0, 0, 1, 1,
0.910394, 1.205111, 1.23123, 0, 0, 0, 1, 1,
0.9107278, 0.3223194, 1.508306, 0, 0, 0, 1, 1,
0.9174092, 0.1930134, 1.526101, 1, 1, 1, 1, 1,
0.9218206, 1.369839, 3.512213, 1, 1, 1, 1, 1,
0.9301386, -0.4906939, 1.117038, 1, 1, 1, 1, 1,
0.9315421, 1.475062, -0.2252567, 1, 1, 1, 1, 1,
0.9317337, 0.7465938, 0.9888428, 1, 1, 1, 1, 1,
0.9325588, 1.56126, 0.1622493, 1, 1, 1, 1, 1,
0.9364556, 0.6702384, 1.741154, 1, 1, 1, 1, 1,
0.9367211, -0.8548638, 3.376678, 1, 1, 1, 1, 1,
0.9483908, -0.4596885, 1.389031, 1, 1, 1, 1, 1,
0.9530742, 0.6023998, 0.01803029, 1, 1, 1, 1, 1,
0.9568553, 0.7484986, 1.793592, 1, 1, 1, 1, 1,
0.9629884, -0.1933091, 2.417691, 1, 1, 1, 1, 1,
0.9688531, 1.935993, 2.255826, 1, 1, 1, 1, 1,
0.9694528, 0.06790487, 1.943602, 1, 1, 1, 1, 1,
0.9732973, -1.015786, 2.461946, 1, 1, 1, 1, 1,
0.9737772, -1.685374, 2.513036, 0, 0, 1, 1, 1,
0.9747524, 0.2355643, 0.6023991, 1, 0, 0, 1, 1,
0.9759482, -0.8386601, 0.8770178, 1, 0, 0, 1, 1,
0.9769932, -0.6627755, 2.937985, 1, 0, 0, 1, 1,
0.9875156, 0.9804589, 0.4325262, 1, 0, 0, 1, 1,
0.9973251, -0.4054633, 1.703976, 1, 0, 0, 1, 1,
0.9977049, 0.1194387, 2.925587, 0, 0, 0, 1, 1,
0.9983124, -1.075171, 1.05998, 0, 0, 0, 1, 1,
0.9990327, 0.4023247, 2.912186, 0, 0, 0, 1, 1,
1.00183, -0.2649608, 0.6459867, 0, 0, 0, 1, 1,
1.002342, 1.481862, 1.89272, 0, 0, 0, 1, 1,
1.003185, 0.1478327, 2.123769, 0, 0, 0, 1, 1,
1.014288, -0.4215954, 0.9964745, 0, 0, 0, 1, 1,
1.015785, -1.191373, 1.977372, 1, 1, 1, 1, 1,
1.017203, 1.430669, 0.490476, 1, 1, 1, 1, 1,
1.01887, -0.2076494, 2.147643, 1, 1, 1, 1, 1,
1.020754, 0.6614127, 0.1708912, 1, 1, 1, 1, 1,
1.024927, 0.393061, 2.444218, 1, 1, 1, 1, 1,
1.026987, 0.4119576, 0.8557446, 1, 1, 1, 1, 1,
1.029033, -1.858824, 2.506735, 1, 1, 1, 1, 1,
1.038891, 1.41879, 0.6543561, 1, 1, 1, 1, 1,
1.043525, -1.578201, 1.007919, 1, 1, 1, 1, 1,
1.046527, -0.8085937, 0.8633685, 1, 1, 1, 1, 1,
1.049246, -0.2026278, 2.739078, 1, 1, 1, 1, 1,
1.052774, 0.01705519, 2.009785, 1, 1, 1, 1, 1,
1.053794, -0.127364, 2.512852, 1, 1, 1, 1, 1,
1.055925, 0.8367232, 1.010749, 1, 1, 1, 1, 1,
1.056552, -1.844372, 2.602522, 1, 1, 1, 1, 1,
1.059287, -1.748133, 3.881683, 0, 0, 1, 1, 1,
1.065893, -2.014578, 3.686781, 1, 0, 0, 1, 1,
1.070905, 0.05185204, 2.907849, 1, 0, 0, 1, 1,
1.071568, -0.7920703, 1.421943, 1, 0, 0, 1, 1,
1.072849, 1.241046, 1.624157, 1, 0, 0, 1, 1,
1.074515, 0.1323041, 0.8508627, 1, 0, 0, 1, 1,
1.075801, 0.05104002, 2.230403, 0, 0, 0, 1, 1,
1.078086, 1.377605, -0.01497814, 0, 0, 0, 1, 1,
1.083369, 0.3860087, 0.3552441, 0, 0, 0, 1, 1,
1.08848, -0.1058718, 1.910314, 0, 0, 0, 1, 1,
1.093844, -0.3089344, 2.256462, 0, 0, 0, 1, 1,
1.094426, -1.522223, 3.928, 0, 0, 0, 1, 1,
1.094654, 0.5081041, 0.7498269, 0, 0, 0, 1, 1,
1.097214, 1.767931, 0.3997674, 1, 1, 1, 1, 1,
1.098954, 0.6860677, -0.2884187, 1, 1, 1, 1, 1,
1.103891, 0.5682698, 0.6436778, 1, 1, 1, 1, 1,
1.108902, -0.9332619, 1.057638, 1, 1, 1, 1, 1,
1.114313, -0.1610065, 1.543946, 1, 1, 1, 1, 1,
1.11744, 0.6195133, 0.8369175, 1, 1, 1, 1, 1,
1.121842, -0.08116525, 2.360954, 1, 1, 1, 1, 1,
1.123342, -0.8482316, 2.622423, 1, 1, 1, 1, 1,
1.137539, -0.4923826, 2.295689, 1, 1, 1, 1, 1,
1.142404, -1.302433, 1.835474, 1, 1, 1, 1, 1,
1.146111, 0.3263156, 0.307057, 1, 1, 1, 1, 1,
1.147051, 0.5220858, -1.226201, 1, 1, 1, 1, 1,
1.156522, 0.7144194, 0.9225627, 1, 1, 1, 1, 1,
1.157941, 2.385792, 1.439739, 1, 1, 1, 1, 1,
1.168537, -0.9546161, 2.265867, 1, 1, 1, 1, 1,
1.16985, -0.01714375, 0.208058, 0, 0, 1, 1, 1,
1.178709, -0.4576413, 0.5219625, 1, 0, 0, 1, 1,
1.179467, -1.149426, 3.926685, 1, 0, 0, 1, 1,
1.181626, 0.03629621, -0.1360239, 1, 0, 0, 1, 1,
1.196775, 0.3099551, 1.613271, 1, 0, 0, 1, 1,
1.198416, -0.3594536, 2.585656, 1, 0, 0, 1, 1,
1.201519, -0.132535, -0.6343313, 0, 0, 0, 1, 1,
1.201614, -0.5640969, 1.434174, 0, 0, 0, 1, 1,
1.202189, 1.111078, 0.153032, 0, 0, 0, 1, 1,
1.207618, -1.69744, 2.032494, 0, 0, 0, 1, 1,
1.209162, -0.326016, 3.05241, 0, 0, 0, 1, 1,
1.211504, 0.8683906, 0.1354312, 0, 0, 0, 1, 1,
1.214581, 0.07923796, 2.87538, 0, 0, 0, 1, 1,
1.226128, -0.417879, 2.460515, 1, 1, 1, 1, 1,
1.229152, -1.07485, 2.984983, 1, 1, 1, 1, 1,
1.23254, 0.4196081, 1.914656, 1, 1, 1, 1, 1,
1.237613, 0.4278821, 2.028119, 1, 1, 1, 1, 1,
1.238663, 1.281845, 1.171093, 1, 1, 1, 1, 1,
1.243937, 1.066429, 0.3246238, 1, 1, 1, 1, 1,
1.24488, 1.116072, 1.474703, 1, 1, 1, 1, 1,
1.247278, -1.302556, 1.483852, 1, 1, 1, 1, 1,
1.254934, 0.6377057, 1.473523, 1, 1, 1, 1, 1,
1.260222, 1.490819, 1.233073, 1, 1, 1, 1, 1,
1.268788, 0.1596177, 2.5909, 1, 1, 1, 1, 1,
1.270919, 0.5927597, 1.126423, 1, 1, 1, 1, 1,
1.287413, -0.760955, 2.463122, 1, 1, 1, 1, 1,
1.291405, 0.6942567, -0.3307209, 1, 1, 1, 1, 1,
1.302365, 1.739289, -0.1937243, 1, 1, 1, 1, 1,
1.325442, 1.297207, 3.547263, 0, 0, 1, 1, 1,
1.332256, -0.500294, 1.557194, 1, 0, 0, 1, 1,
1.335966, 1.285243, 0.4846797, 1, 0, 0, 1, 1,
1.345998, 2.395076, -1.355424, 1, 0, 0, 1, 1,
1.355593, -0.5705314, 2.311001, 1, 0, 0, 1, 1,
1.359618, 1.501807, 1.550946, 1, 0, 0, 1, 1,
1.360341, -0.5627438, -0.01406412, 0, 0, 0, 1, 1,
1.360936, -0.129736, 2.525554, 0, 0, 0, 1, 1,
1.379701, 0.6231698, -0.05193158, 0, 0, 0, 1, 1,
1.387921, -0.6530402, 3.656516, 0, 0, 0, 1, 1,
1.390568, 0.4138434, -0.1770428, 0, 0, 0, 1, 1,
1.391522, 1.72229, 0.1246811, 0, 0, 0, 1, 1,
1.392795, 0.9032907, 2.306076, 0, 0, 0, 1, 1,
1.394801, 1.952355, 0.8862298, 1, 1, 1, 1, 1,
1.395536, 1.843254, -0.1794584, 1, 1, 1, 1, 1,
1.399992, 0.8633901, 0.2970575, 1, 1, 1, 1, 1,
1.400034, -1.432999, 1.923671, 1, 1, 1, 1, 1,
1.403193, 0.3977531, 1.339508, 1, 1, 1, 1, 1,
1.404868, -0.04210136, 1.705379, 1, 1, 1, 1, 1,
1.40662, -1.254476, 1.607242, 1, 1, 1, 1, 1,
1.414965, -0.2882444, -0.002354288, 1, 1, 1, 1, 1,
1.416172, 0.3651954, 0.5090271, 1, 1, 1, 1, 1,
1.420868, -0.5011338, 2.457517, 1, 1, 1, 1, 1,
1.423944, 0.4280175, 2.681686, 1, 1, 1, 1, 1,
1.426956, -0.1770413, -0.7056353, 1, 1, 1, 1, 1,
1.43147, 1.771146, 2.123578, 1, 1, 1, 1, 1,
1.44153, -0.7020448, 0.4194164, 1, 1, 1, 1, 1,
1.443457, -0.7421871, 2.341464, 1, 1, 1, 1, 1,
1.44522, 1.590282, 0.8985556, 0, 0, 1, 1, 1,
1.460775, 0.9544803, -0.2619467, 1, 0, 0, 1, 1,
1.466658, 0.5782059, 1.050917, 1, 0, 0, 1, 1,
1.475861, -0.02230234, 1.969687, 1, 0, 0, 1, 1,
1.477178, 0.2328282, 1.167609, 1, 0, 0, 1, 1,
1.514398, -1.664445, 3.207202, 1, 0, 0, 1, 1,
1.520334, -0.9039309, 0.6159527, 0, 0, 0, 1, 1,
1.52386, -1.051376, 1.977098, 0, 0, 0, 1, 1,
1.526776, -0.5632241, 1.184779, 0, 0, 0, 1, 1,
1.542519, -1.401443, 1.97994, 0, 0, 0, 1, 1,
1.552007, -0.3987468, 0.3865831, 0, 0, 0, 1, 1,
1.566908, 1.284125, -0.5683872, 0, 0, 0, 1, 1,
1.567986, 1.698338, 1.491379, 0, 0, 0, 1, 1,
1.571973, -0.7538835, 3.04395, 1, 1, 1, 1, 1,
1.581067, 1.149624, 2.170976, 1, 1, 1, 1, 1,
1.58247, 0.1390959, 1.346358, 1, 1, 1, 1, 1,
1.595925, 2.11176, 0.5743666, 1, 1, 1, 1, 1,
1.608868, 0.6642915, 1.227299, 1, 1, 1, 1, 1,
1.611828, 0.1378403, 1.72317, 1, 1, 1, 1, 1,
1.614684, 1.083462, 2.231539, 1, 1, 1, 1, 1,
1.632658, 0.7506232, 1.724639, 1, 1, 1, 1, 1,
1.653544, 0.7552269, 0.2074455, 1, 1, 1, 1, 1,
1.662492, -1.007888, 0.5729783, 1, 1, 1, 1, 1,
1.663045, 1.359667, -0.2562736, 1, 1, 1, 1, 1,
1.671127, 2.39365, 0.2364209, 1, 1, 1, 1, 1,
1.680004, 1.290979, 0.5518206, 1, 1, 1, 1, 1,
1.681888, 0.3603196, 3.218854, 1, 1, 1, 1, 1,
1.684076, -0.6252437, 0.4411124, 1, 1, 1, 1, 1,
1.690605, -0.07669689, 2.32282, 0, 0, 1, 1, 1,
1.691195, -1.62694, 3.49683, 1, 0, 0, 1, 1,
1.703615, -0.7395161, 1.188628, 1, 0, 0, 1, 1,
1.722651, -0.5732594, 2.86768, 1, 0, 0, 1, 1,
1.727689, -0.06582122, 3.212445, 1, 0, 0, 1, 1,
1.740646, 0.9353598, 0.1386456, 1, 0, 0, 1, 1,
1.743365, -0.8861455, 2.949568, 0, 0, 0, 1, 1,
1.746426, 1.09962, 0.4803877, 0, 0, 0, 1, 1,
1.749094, -1.511482, 3.382058, 0, 0, 0, 1, 1,
1.749621, -0.07001041, -0.5346394, 0, 0, 0, 1, 1,
1.763527, 0.07364257, 2.416593, 0, 0, 0, 1, 1,
1.786743, -0.1595506, 0.4602534, 0, 0, 0, 1, 1,
1.801563, -0.3370599, 1.098559, 0, 0, 0, 1, 1,
1.809053, -0.7704437, 3.349778, 1, 1, 1, 1, 1,
1.813061, 0.5412551, 2.744386, 1, 1, 1, 1, 1,
1.829212, 0.7964389, 2.900066, 1, 1, 1, 1, 1,
1.843439, 0.5895953, 0.8494444, 1, 1, 1, 1, 1,
1.84364, -0.5114812, 3.355806, 1, 1, 1, 1, 1,
1.84372, -0.05758064, 1.648203, 1, 1, 1, 1, 1,
1.86341, 0.4721941, 2.074712, 1, 1, 1, 1, 1,
1.872524, 0.4706051, 1.293386, 1, 1, 1, 1, 1,
1.874792, -1.014246, 1.286742, 1, 1, 1, 1, 1,
1.880634, 1.173735, 0.8871155, 1, 1, 1, 1, 1,
1.890716, 0.04653958, -0.7211824, 1, 1, 1, 1, 1,
1.892022, -0.7454001, 1.471421, 1, 1, 1, 1, 1,
1.944994, -0.4583102, 2.482311, 1, 1, 1, 1, 1,
1.949021, -1.077618, 1.70013, 1, 1, 1, 1, 1,
1.962445, 1.538004, 1.174446, 1, 1, 1, 1, 1,
1.971815, 1.014372, 2.724649, 0, 0, 1, 1, 1,
1.975252, -0.7332423, 2.079434, 1, 0, 0, 1, 1,
1.991362, -0.7473866, 0.7102937, 1, 0, 0, 1, 1,
2.002956, -2.156219, 1.873654, 1, 0, 0, 1, 1,
2.060508, -1.097205, 1.775174, 1, 0, 0, 1, 1,
2.071082, -0.693653, 1.770149, 1, 0, 0, 1, 1,
2.09269, -0.07793687, 3.386461, 0, 0, 0, 1, 1,
2.09917, -0.9053099, 2.270677, 0, 0, 0, 1, 1,
2.199137, -1.268395, 1.999162, 0, 0, 0, 1, 1,
2.199172, 1.031355, -1.322002, 0, 0, 0, 1, 1,
2.205415, -0.3825804, 2.788267, 0, 0, 0, 1, 1,
2.278023, 1.292069, 0.9927571, 0, 0, 0, 1, 1,
2.332103, 0.09639051, 2.161799, 0, 0, 0, 1, 1,
2.335201, 1.198349, -0.0338388, 1, 1, 1, 1, 1,
2.409159, -0.2476836, 4.034795, 1, 1, 1, 1, 1,
2.420582, -0.5719, 2.049364, 1, 1, 1, 1, 1,
2.550815, 0.6250915, 3.441107, 1, 1, 1, 1, 1,
2.656303, 1.081429, 1.642037, 1, 1, 1, 1, 1,
2.759852, 0.5564993, 2.242853, 1, 1, 1, 1, 1,
2.986437, 0.4367704, 1.607997, 1, 1, 1, 1, 1
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
var radius = 9.540842;
var distance = 33.5118;
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
mvMatrix.translate( 0.1490068, 0.08970547, 0.02265429 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.5118);
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
