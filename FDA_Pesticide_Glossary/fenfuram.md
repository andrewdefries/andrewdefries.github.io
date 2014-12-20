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
-3.341712, -0.8009619, -1.798313, 1, 0, 0, 1,
-3.284124, 0.8820249, -0.9318956, 1, 0.007843138, 0, 1,
-3.159874, -1.779975, -1.33593, 1, 0.01176471, 0, 1,
-2.933665, 0.2203532, -2.130338, 1, 0.01960784, 0, 1,
-2.739198, 1.547447, -0.3370304, 1, 0.02352941, 0, 1,
-2.606312, -0.3485594, -1.926517, 1, 0.03137255, 0, 1,
-2.502285, -0.5363939, -1.12312, 1, 0.03529412, 0, 1,
-2.465854, 0.3021903, -2.080372, 1, 0.04313726, 0, 1,
-2.444809, -0.2053193, 0.8635065, 1, 0.04705882, 0, 1,
-2.339637, 1.120737, -0.07369232, 1, 0.05490196, 0, 1,
-2.307912, -0.764187, -1.0606, 1, 0.05882353, 0, 1,
-2.307235, 1.980721, -0.908128, 1, 0.06666667, 0, 1,
-2.295882, 0.2029288, -2.381001, 1, 0.07058824, 0, 1,
-2.29253, 0.3175858, -0.7781709, 1, 0.07843138, 0, 1,
-2.282694, 0.5990252, -1.617014, 1, 0.08235294, 0, 1,
-2.279251, 0.984665, -2.671649, 1, 0.09019608, 0, 1,
-2.279178, -0.3923278, -1.59832, 1, 0.09411765, 0, 1,
-2.256827, -1.751537, -1.017748, 1, 0.1019608, 0, 1,
-2.243344, 0.3620482, -2.194435, 1, 0.1098039, 0, 1,
-2.243204, -0.526597, -1.571645, 1, 0.1137255, 0, 1,
-2.174454, -0.8264256, -1.907578, 1, 0.1215686, 0, 1,
-2.163801, -0.795222, 0.6354206, 1, 0.1254902, 0, 1,
-2.135415, 0.9700961, -0.8395765, 1, 0.1333333, 0, 1,
-2.1211, 1.590016, 0.8479303, 1, 0.1372549, 0, 1,
-2.100302, 1.753298, 0.1483608, 1, 0.145098, 0, 1,
-2.093763, -1.683855, -1.269766, 1, 0.1490196, 0, 1,
-2.073756, -0.09486304, -2.422866, 1, 0.1568628, 0, 1,
-2.022495, -0.08338849, -2.787278, 1, 0.1607843, 0, 1,
-2.017646, 0.9772741, -1.930474, 1, 0.1686275, 0, 1,
-1.944112, 1.564028, -1.983405, 1, 0.172549, 0, 1,
-1.932796, 1.394033, -0.8222184, 1, 0.1803922, 0, 1,
-1.930143, 0.8474334, 0.02236789, 1, 0.1843137, 0, 1,
-1.914916, 0.6264159, -2.326221, 1, 0.1921569, 0, 1,
-1.892631, -0.7546738, -2.164886, 1, 0.1960784, 0, 1,
-1.87422, -1.199807, -2.139147, 1, 0.2039216, 0, 1,
-1.857477, -0.820908, -2.354795, 1, 0.2117647, 0, 1,
-1.834096, -0.3340603, -2.081765, 1, 0.2156863, 0, 1,
-1.830342, 0.2622269, -0.628611, 1, 0.2235294, 0, 1,
-1.769337, -2.663494, -3.927648, 1, 0.227451, 0, 1,
-1.768162, 0.9955548, -1.381038, 1, 0.2352941, 0, 1,
-1.737513, 0.6575378, -2.216966, 1, 0.2392157, 0, 1,
-1.736671, -0.4964078, -1.523246, 1, 0.2470588, 0, 1,
-1.724933, 1.197375, -0.1390752, 1, 0.2509804, 0, 1,
-1.714663, 1.362483, -1.331447, 1, 0.2588235, 0, 1,
-1.685002, 0.4357302, -2.777873, 1, 0.2627451, 0, 1,
-1.682858, 1.379886, -1.304718, 1, 0.2705882, 0, 1,
-1.682682, 1.356737, -2.124192, 1, 0.2745098, 0, 1,
-1.670616, 0.8629395, 0.02643947, 1, 0.282353, 0, 1,
-1.648152, -0.7709948, -3.049661, 1, 0.2862745, 0, 1,
-1.646206, -0.2767337, -2.556289, 1, 0.2941177, 0, 1,
-1.640756, 1.031576, -1.119747, 1, 0.3019608, 0, 1,
-1.626172, -1.500222, -3.462364, 1, 0.3058824, 0, 1,
-1.625454, -0.279882, -2.252416, 1, 0.3137255, 0, 1,
-1.621757, 1.954085, 1.233462, 1, 0.3176471, 0, 1,
-1.61245, 0.07301085, -2.239376, 1, 0.3254902, 0, 1,
-1.6103, -1.165707, -1.77253, 1, 0.3294118, 0, 1,
-1.6097, -0.2801709, -1.387264, 1, 0.3372549, 0, 1,
-1.607288, -0.3598017, -0.2737149, 1, 0.3411765, 0, 1,
-1.601737, 0.8868543, -2.953547, 1, 0.3490196, 0, 1,
-1.591469, -0.3586518, -1.140202, 1, 0.3529412, 0, 1,
-1.553173, 0.6507242, -2.11124, 1, 0.3607843, 0, 1,
-1.542359, 0.4412341, -0.5732044, 1, 0.3647059, 0, 1,
-1.540591, 0.8308487, 0.4340095, 1, 0.372549, 0, 1,
-1.530269, -0.7613556, -3.228282, 1, 0.3764706, 0, 1,
-1.51847, -1.300584, -2.588003, 1, 0.3843137, 0, 1,
-1.5127, 0.6526844, -1.085664, 1, 0.3882353, 0, 1,
-1.506171, -1.719642, -3.302223, 1, 0.3960784, 0, 1,
-1.505361, 0.4125451, -2.93698, 1, 0.4039216, 0, 1,
-1.497351, 0.7335183, -0.1441043, 1, 0.4078431, 0, 1,
-1.493198, -0.04674001, -0.7026536, 1, 0.4156863, 0, 1,
-1.492902, -0.3837414, -1.608067, 1, 0.4196078, 0, 1,
-1.491662, 0.303976, -0.761715, 1, 0.427451, 0, 1,
-1.470405, 0.6567051, -0.3965839, 1, 0.4313726, 0, 1,
-1.470099, -0.923995, -2.598643, 1, 0.4392157, 0, 1,
-1.455356, -0.09511285, -0.2833753, 1, 0.4431373, 0, 1,
-1.437604, 0.9508007, -2.554214, 1, 0.4509804, 0, 1,
-1.435812, -1.040135, -3.002314, 1, 0.454902, 0, 1,
-1.419884, 0.4519612, -3.342933, 1, 0.4627451, 0, 1,
-1.400201, -3.398245, -3.55071, 1, 0.4666667, 0, 1,
-1.391384, 1.389574, -0.201159, 1, 0.4745098, 0, 1,
-1.39008, 0.6805645, -1.898473, 1, 0.4784314, 0, 1,
-1.381512, -0.5428375, -0.2166658, 1, 0.4862745, 0, 1,
-1.377125, -1.256549, -2.394553, 1, 0.4901961, 0, 1,
-1.368493, 2.430712, 1.440176, 1, 0.4980392, 0, 1,
-1.345834, 0.1570533, -1.999625, 1, 0.5058824, 0, 1,
-1.341927, 0.005530638, -1.522447, 1, 0.509804, 0, 1,
-1.3408, 1.374633, -2.503685, 1, 0.5176471, 0, 1,
-1.328564, 0.5108421, -2.394516, 1, 0.5215687, 0, 1,
-1.326642, 0.3198071, -1.794117, 1, 0.5294118, 0, 1,
-1.325452, -1.341932, -1.927263, 1, 0.5333334, 0, 1,
-1.324555, 1.673334, -2.001981, 1, 0.5411765, 0, 1,
-1.324376, 1.839626, -1.458954, 1, 0.5450981, 0, 1,
-1.31977, 0.4282225, -1.761937, 1, 0.5529412, 0, 1,
-1.314188, 1.323544, -0.1351168, 1, 0.5568628, 0, 1,
-1.306168, -0.4111823, -0.03206148, 1, 0.5647059, 0, 1,
-1.301098, 0.7494799, -1.7367, 1, 0.5686275, 0, 1,
-1.300731, 1.005146, -0.9647816, 1, 0.5764706, 0, 1,
-1.293662, -0.2548058, -2.327509, 1, 0.5803922, 0, 1,
-1.291187, -1.844862, -4.318498, 1, 0.5882353, 0, 1,
-1.287501, -0.4770276, -2.296432, 1, 0.5921569, 0, 1,
-1.26929, 1.169513, -0.6263408, 1, 0.6, 0, 1,
-1.26764, 1.217391, -1.836491, 1, 0.6078432, 0, 1,
-1.265585, 1.47043, -0.001751464, 1, 0.6117647, 0, 1,
-1.256628, 2.071131, -1.750846, 1, 0.6196079, 0, 1,
-1.237928, 0.8533436, 0.00974552, 1, 0.6235294, 0, 1,
-1.213422, 0.0228701, -0.460663, 1, 0.6313726, 0, 1,
-1.213411, 1.220862, -2.667364, 1, 0.6352941, 0, 1,
-1.212882, -0.576921, -0.6579391, 1, 0.6431373, 0, 1,
-1.211694, -0.7398944, -1.11013, 1, 0.6470588, 0, 1,
-1.19779, 2.382591, -0.3577313, 1, 0.654902, 0, 1,
-1.193881, -0.1748087, -3.079891, 1, 0.6588235, 0, 1,
-1.188362, -1.41351, -1.298802, 1, 0.6666667, 0, 1,
-1.17311, 0.4130081, -0.1291441, 1, 0.6705883, 0, 1,
-1.172475, 0.1044786, -2.288125, 1, 0.6784314, 0, 1,
-1.164867, -1.992445, -1.471622, 1, 0.682353, 0, 1,
-1.164218, 0.1617297, -2.364843, 1, 0.6901961, 0, 1,
-1.164155, 1.26067, -0.6680728, 1, 0.6941177, 0, 1,
-1.162409, 2.112654, -1.349671, 1, 0.7019608, 0, 1,
-1.161876, 0.7272387, 0.8727621, 1, 0.7098039, 0, 1,
-1.159405, 0.08550648, -0.9000573, 1, 0.7137255, 0, 1,
-1.141013, 0.5393496, -1.926246, 1, 0.7215686, 0, 1,
-1.137593, 0.9089462, 0.1213712, 1, 0.7254902, 0, 1,
-1.123983, -0.7742267, -1.316761, 1, 0.7333333, 0, 1,
-1.104504, -2.052571, -2.753284, 1, 0.7372549, 0, 1,
-1.103258, -1.368714, -2.020581, 1, 0.7450981, 0, 1,
-1.101731, -0.270074, -2.650363, 1, 0.7490196, 0, 1,
-1.101307, -2.483491, -1.806562, 1, 0.7568628, 0, 1,
-1.092835, -0.9350189, -2.522902, 1, 0.7607843, 0, 1,
-1.09142, 0.1413359, -0.1630864, 1, 0.7686275, 0, 1,
-1.083415, -1.136296, -0.2447922, 1, 0.772549, 0, 1,
-1.079551, 0.1272037, -1.893883, 1, 0.7803922, 0, 1,
-1.070758, 0.5568478, -2.398996, 1, 0.7843137, 0, 1,
-1.06305, 0.8931366, 0.01681852, 1, 0.7921569, 0, 1,
-1.061884, -1.777282, -1.718968, 1, 0.7960784, 0, 1,
-1.061189, 0.7450694, -0.9050591, 1, 0.8039216, 0, 1,
-1.061137, -0.5212365, -0.7730114, 1, 0.8117647, 0, 1,
-1.060748, 0.2056051, 0.4802494, 1, 0.8156863, 0, 1,
-1.055808, 0.9833605, -0.49807, 1, 0.8235294, 0, 1,
-1.05558, 0.7490174, -0.6783078, 1, 0.827451, 0, 1,
-1.055078, -3.503555, -3.355704, 1, 0.8352941, 0, 1,
-1.05456, -1.239261, -2.644749, 1, 0.8392157, 0, 1,
-1.044202, 1.866685, 0.5907508, 1, 0.8470588, 0, 1,
-1.037702, -0.5888466, -2.207907, 1, 0.8509804, 0, 1,
-1.028586, 0.09326233, -0.8331822, 1, 0.8588235, 0, 1,
-1.022475, -0.9229834, -1.981079, 1, 0.8627451, 0, 1,
-1.019977, 1.309809, -1.09261, 1, 0.8705882, 0, 1,
-1.018463, -0.6116599, -2.364378, 1, 0.8745098, 0, 1,
-1.013331, -0.7099393, -1.973518, 1, 0.8823529, 0, 1,
-1.012282, 1.015863, -0.4415542, 1, 0.8862745, 0, 1,
-0.9994022, 0.3222502, -0.8026811, 1, 0.8941177, 0, 1,
-0.9893475, -0.3579062, -1.248058, 1, 0.8980392, 0, 1,
-0.9795891, -0.6486189, -2.428033, 1, 0.9058824, 0, 1,
-0.9787641, -0.2690592, -2.457901, 1, 0.9137255, 0, 1,
-0.9740011, -0.5702461, -2.731699, 1, 0.9176471, 0, 1,
-0.9711382, -0.8753482, -1.779135, 1, 0.9254902, 0, 1,
-0.9674322, 1.024974, -1.415159, 1, 0.9294118, 0, 1,
-0.964637, 0.4456224, -2.529987, 1, 0.9372549, 0, 1,
-0.956225, 0.001314895, -0.4911374, 1, 0.9411765, 0, 1,
-0.9510313, 1.654323, -0.1987097, 1, 0.9490196, 0, 1,
-0.9456219, 0.3937029, -0.6121057, 1, 0.9529412, 0, 1,
-0.9432865, 0.6678272, 0.7488869, 1, 0.9607843, 0, 1,
-0.9369121, -0.7360471, -1.198738, 1, 0.9647059, 0, 1,
-0.9342095, 1.004038, 0.4492506, 1, 0.972549, 0, 1,
-0.9322684, -0.0879714, -2.483539, 1, 0.9764706, 0, 1,
-0.928106, -1.016338, -2.797557, 1, 0.9843137, 0, 1,
-0.9191097, 0.1926955, -0.972778, 1, 0.9882353, 0, 1,
-0.9181399, 0.3305521, -2.296471, 1, 0.9960784, 0, 1,
-0.9165657, 1.426681, -0.9883238, 0.9960784, 1, 0, 1,
-0.9141787, 0.02087276, -0.6867598, 0.9921569, 1, 0, 1,
-0.9097306, -0.0566604, -0.9155899, 0.9843137, 1, 0, 1,
-0.9019284, -0.6793886, -1.233461, 0.9803922, 1, 0, 1,
-0.8989644, 0.4012463, -1.82408, 0.972549, 1, 0, 1,
-0.8960093, -0.1699239, -3.821548, 0.9686275, 1, 0, 1,
-0.8950275, 0.1987481, -2.432753, 0.9607843, 1, 0, 1,
-0.8885588, -0.9816338, -2.79652, 0.9568627, 1, 0, 1,
-0.8853015, 1.52328, -0.4966791, 0.9490196, 1, 0, 1,
-0.8841156, 0.9219123, -1.527068, 0.945098, 1, 0, 1,
-0.8798475, 0.3690228, -1.328777, 0.9372549, 1, 0, 1,
-0.8781586, 0.1146131, -0.4029661, 0.9333333, 1, 0, 1,
-0.8777252, -1.113726, -1.73507, 0.9254902, 1, 0, 1,
-0.8693631, 0.7271935, -2.289036, 0.9215686, 1, 0, 1,
-0.8683252, -0.2597517, -1.825002, 0.9137255, 1, 0, 1,
-0.8662136, -0.166615, -1.026047, 0.9098039, 1, 0, 1,
-0.8578654, 1.511806, 1.735638, 0.9019608, 1, 0, 1,
-0.8463721, 1.801061, -0.6578614, 0.8941177, 1, 0, 1,
-0.8385606, -1.00228, -2.160656, 0.8901961, 1, 0, 1,
-0.8355984, 0.03800216, -2.043129, 0.8823529, 1, 0, 1,
-0.8343789, 0.3493266, -2.313427, 0.8784314, 1, 0, 1,
-0.8219691, 1.830203, -1.528145, 0.8705882, 1, 0, 1,
-0.8185716, 0.5744479, -0.9963573, 0.8666667, 1, 0, 1,
-0.817995, -0.6385732, -2.698095, 0.8588235, 1, 0, 1,
-0.8163995, -0.6448392, -2.560025, 0.854902, 1, 0, 1,
-0.8138438, 0.5236148, -2.666048, 0.8470588, 1, 0, 1,
-0.8136106, 0.2125406, -0.6215328, 0.8431373, 1, 0, 1,
-0.8132685, -0.5035194, -2.61503, 0.8352941, 1, 0, 1,
-0.8113801, -0.4387064, -3.447202, 0.8313726, 1, 0, 1,
-0.807374, 0.5481611, -1.354983, 0.8235294, 1, 0, 1,
-0.8072663, -1.04758, -2.931544, 0.8196079, 1, 0, 1,
-0.80242, 1.159036, -0.2035346, 0.8117647, 1, 0, 1,
-0.7994071, -1.395572, -2.539656, 0.8078431, 1, 0, 1,
-0.7969108, 0.7465883, 0.0137382, 0.8, 1, 0, 1,
-0.7911506, 1.411464, -0.511121, 0.7921569, 1, 0, 1,
-0.7893844, -0.02271583, -2.217594, 0.7882353, 1, 0, 1,
-0.7724292, 0.4499851, -3.086137, 0.7803922, 1, 0, 1,
-0.761072, -0.6213377, -2.198951, 0.7764706, 1, 0, 1,
-0.7599393, 0.3209195, -0.8129551, 0.7686275, 1, 0, 1,
-0.7545072, -2.242359, -3.218188, 0.7647059, 1, 0, 1,
-0.7503725, -0.6392621, -0.9263934, 0.7568628, 1, 0, 1,
-0.7384622, -0.308182, -0.7528746, 0.7529412, 1, 0, 1,
-0.736368, -2.819616, -2.313414, 0.7450981, 1, 0, 1,
-0.7334176, 0.02941957, -2.513071, 0.7411765, 1, 0, 1,
-0.725042, 1.51952, -2.765424, 0.7333333, 1, 0, 1,
-0.7208346, 0.3847432, -0.475787, 0.7294118, 1, 0, 1,
-0.7185127, 0.158758, -0.1778887, 0.7215686, 1, 0, 1,
-0.7179499, 0.1241663, -1.475177, 0.7176471, 1, 0, 1,
-0.7163833, -1.011777, -3.733907, 0.7098039, 1, 0, 1,
-0.7110747, -0.3564399, -1.777734, 0.7058824, 1, 0, 1,
-0.7108278, -0.8155403, -2.832093, 0.6980392, 1, 0, 1,
-0.7081304, 0.02270973, -1.648886, 0.6901961, 1, 0, 1,
-0.7035339, -0.8751423, -4.142147, 0.6862745, 1, 0, 1,
-0.6955349, 0.829065, -0.4103185, 0.6784314, 1, 0, 1,
-0.6915766, 1.149744, -0.5117816, 0.6745098, 1, 0, 1,
-0.6896723, -0.7694076, -2.497454, 0.6666667, 1, 0, 1,
-0.6895281, -1.645501, -3.278977, 0.6627451, 1, 0, 1,
-0.6889457, 0.2647492, -0.1694049, 0.654902, 1, 0, 1,
-0.688792, 0.1099252, -1.616915, 0.6509804, 1, 0, 1,
-0.6821225, 0.9154909, 1.081834, 0.6431373, 1, 0, 1,
-0.6787916, -0.6469654, -3.467048, 0.6392157, 1, 0, 1,
-0.6779388, 1.869538, -0.6737569, 0.6313726, 1, 0, 1,
-0.6758512, -1.99868, -0.606195, 0.627451, 1, 0, 1,
-0.6754074, -0.6348148, -4.401575, 0.6196079, 1, 0, 1,
-0.6734238, 0.6320051, -0.4491321, 0.6156863, 1, 0, 1,
-0.6702555, -0.6703735, -1.788764, 0.6078432, 1, 0, 1,
-0.6628256, -0.5263375, -3.368586, 0.6039216, 1, 0, 1,
-0.6604496, 0.7275771, -1.302044, 0.5960785, 1, 0, 1,
-0.6582718, 0.1244551, -1.260805, 0.5882353, 1, 0, 1,
-0.651887, -0.5226546, -3.009065, 0.5843138, 1, 0, 1,
-0.6477044, 0.1648087, -0.6997849, 0.5764706, 1, 0, 1,
-0.6451619, 0.4746819, -1.587405, 0.572549, 1, 0, 1,
-0.6413597, 1.206524, 1.831905, 0.5647059, 1, 0, 1,
-0.6387354, 0.9501873, -0.1274157, 0.5607843, 1, 0, 1,
-0.6365398, 0.7405995, -0.6137022, 0.5529412, 1, 0, 1,
-0.636429, 1.213852, -1.31041, 0.5490196, 1, 0, 1,
-0.6317394, 0.3810265, -0.3398363, 0.5411765, 1, 0, 1,
-0.627999, 0.8461286, -0.9848971, 0.5372549, 1, 0, 1,
-0.6246113, -1.396371, -2.99674, 0.5294118, 1, 0, 1,
-0.6239061, 0.7056116, -0.150913, 0.5254902, 1, 0, 1,
-0.6149904, -0.2550569, -2.713509, 0.5176471, 1, 0, 1,
-0.6117474, -1.095827, -2.766277, 0.5137255, 1, 0, 1,
-0.6097723, 0.6675207, 0.4024107, 0.5058824, 1, 0, 1,
-0.6014532, 0.7186337, 0.4552571, 0.5019608, 1, 0, 1,
-0.6008081, -1.900519, -2.756446, 0.4941176, 1, 0, 1,
-0.600215, 0.2084913, -0.8748202, 0.4862745, 1, 0, 1,
-0.5996187, 0.14733, -0.2648191, 0.4823529, 1, 0, 1,
-0.5991768, -1.059859, 1.135484, 0.4745098, 1, 0, 1,
-0.5948113, 1.857003, -0.6373777, 0.4705882, 1, 0, 1,
-0.5797678, -1.13074, -3.246423, 0.4627451, 1, 0, 1,
-0.5782562, 1.389702, -0.1601905, 0.4588235, 1, 0, 1,
-0.5757526, 0.5843791, -0.4782763, 0.4509804, 1, 0, 1,
-0.5713167, -0.8932208, -1.626356, 0.4470588, 1, 0, 1,
-0.5710316, -2.291085, -3.411902, 0.4392157, 1, 0, 1,
-0.5697388, 1.928387, -1.606619, 0.4352941, 1, 0, 1,
-0.5657883, 1.538152, -0.1453591, 0.427451, 1, 0, 1,
-0.5632809, 1.498475, 0.09657993, 0.4235294, 1, 0, 1,
-0.560906, -0.4251868, -3.234924, 0.4156863, 1, 0, 1,
-0.5599496, -2.130073, -4.184643, 0.4117647, 1, 0, 1,
-0.5576751, -0.08518068, -3.180828, 0.4039216, 1, 0, 1,
-0.5540512, 0.6148921, -1.029762, 0.3960784, 1, 0, 1,
-0.5508882, -0.342259, -0.1795181, 0.3921569, 1, 0, 1,
-0.5496275, 0.642069, -3.256029, 0.3843137, 1, 0, 1,
-0.545139, -0.3721412, -2.621449, 0.3803922, 1, 0, 1,
-0.5445679, 0.05215805, -3.148814, 0.372549, 1, 0, 1,
-0.5439383, -0.9326989, -2.245696, 0.3686275, 1, 0, 1,
-0.5432003, -0.2542126, -0.7662072, 0.3607843, 1, 0, 1,
-0.5425352, -0.3045554, -2.38091, 0.3568628, 1, 0, 1,
-0.5333008, 0.7179773, 0.01976831, 0.3490196, 1, 0, 1,
-0.5279095, 0.2820477, -2.654125, 0.345098, 1, 0, 1,
-0.5275154, -0.9239404, -0.7695668, 0.3372549, 1, 0, 1,
-0.5271935, -0.9143995, -1.035126, 0.3333333, 1, 0, 1,
-0.5259351, -0.6995827, -1.342285, 0.3254902, 1, 0, 1,
-0.5210775, -0.2912199, -1.871771, 0.3215686, 1, 0, 1,
-0.5194339, 0.309098, -0.7725284, 0.3137255, 1, 0, 1,
-0.5119125, 0.3702067, -1.075181, 0.3098039, 1, 0, 1,
-0.5104026, -0.7547892, -2.369163, 0.3019608, 1, 0, 1,
-0.5081689, -0.03197541, -1.783594, 0.2941177, 1, 0, 1,
-0.4911685, 0.3588201, 0.2303656, 0.2901961, 1, 0, 1,
-0.4856585, 1.675165, 0.8086554, 0.282353, 1, 0, 1,
-0.4842862, -0.1653286, -3.138858, 0.2784314, 1, 0, 1,
-0.4817119, 0.1444514, -1.542731, 0.2705882, 1, 0, 1,
-0.4789073, 0.08391867, -0.5625001, 0.2666667, 1, 0, 1,
-0.4758024, 0.1351868, -1.839571, 0.2588235, 1, 0, 1,
-0.4753908, 0.8418493, 0.0324103, 0.254902, 1, 0, 1,
-0.4747321, 0.6846015, -2.068533, 0.2470588, 1, 0, 1,
-0.4736079, -0.7157649, -3.691251, 0.2431373, 1, 0, 1,
-0.4726308, 0.4226342, -1.777226, 0.2352941, 1, 0, 1,
-0.4702022, -0.5534506, -2.709153, 0.2313726, 1, 0, 1,
-0.4664388, -0.8248027, -3.911056, 0.2235294, 1, 0, 1,
-0.4649626, -0.3295572, -2.222551, 0.2196078, 1, 0, 1,
-0.4623585, -0.5444534, -2.028152, 0.2117647, 1, 0, 1,
-0.4601967, -0.3710562, -0.8363127, 0.2078431, 1, 0, 1,
-0.4479807, -0.5380604, -2.376498, 0.2, 1, 0, 1,
-0.4473591, -0.9685847, -4.649421, 0.1921569, 1, 0, 1,
-0.4447752, -0.729418, -3.826817, 0.1882353, 1, 0, 1,
-0.4441514, 1.019496, -1.345443, 0.1803922, 1, 0, 1,
-0.4431114, -0.08783904, -0.6085816, 0.1764706, 1, 0, 1,
-0.4430959, -0.728568, -5.245275, 0.1686275, 1, 0, 1,
-0.4402896, 1.025175, -0.8440645, 0.1647059, 1, 0, 1,
-0.439741, -1.209728, -1.829396, 0.1568628, 1, 0, 1,
-0.4355019, -0.1114315, -3.022447, 0.1529412, 1, 0, 1,
-0.4337921, 1.273424, -1.260725, 0.145098, 1, 0, 1,
-0.4336452, -0.6758097, -2.077822, 0.1411765, 1, 0, 1,
-0.4334367, -1.021823, -2.345426, 0.1333333, 1, 0, 1,
-0.4325489, -0.3597794, -2.47284, 0.1294118, 1, 0, 1,
-0.4318954, -0.9921076, -2.746877, 0.1215686, 1, 0, 1,
-0.4295889, -0.2195943, -4.490932, 0.1176471, 1, 0, 1,
-0.4269166, 0.2094924, -0.4662544, 0.1098039, 1, 0, 1,
-0.4256651, -0.6553863, -1.530628, 0.1058824, 1, 0, 1,
-0.4227191, -0.9761711, -1.961104, 0.09803922, 1, 0, 1,
-0.4187488, -0.6532193, -2.87337, 0.09019608, 1, 0, 1,
-0.4165658, -1.197783, -5.346113, 0.08627451, 1, 0, 1,
-0.4061705, 0.4801936, -1.201914, 0.07843138, 1, 0, 1,
-0.4037813, -1.077335, -2.736727, 0.07450981, 1, 0, 1,
-0.4032062, -1.969379, -1.721931, 0.06666667, 1, 0, 1,
-0.402755, 1.092671, -2.005847, 0.0627451, 1, 0, 1,
-0.3970521, 0.007759867, -1.687284, 0.05490196, 1, 0, 1,
-0.3950728, 0.7096045, 0.6731778, 0.05098039, 1, 0, 1,
-0.3930361, -0.7705465, -1.919623, 0.04313726, 1, 0, 1,
-0.3921597, -0.6273574, -4.68358, 0.03921569, 1, 0, 1,
-0.3911903, 0.1870233, -1.087806, 0.03137255, 1, 0, 1,
-0.389713, 1.710819, -0.1882263, 0.02745098, 1, 0, 1,
-0.3897019, 0.5154585, -1.734018, 0.01960784, 1, 0, 1,
-0.3886117, -0.4486822, -0.8992926, 0.01568628, 1, 0, 1,
-0.3851641, 0.574186, -0.2402763, 0.007843138, 1, 0, 1,
-0.384963, 1.506609, 0.5465727, 0.003921569, 1, 0, 1,
-0.3819078, 0.4025059, -1.184575, 0, 1, 0.003921569, 1,
-0.3816061, 1.480519, 0.04130106, 0, 1, 0.01176471, 1,
-0.3799668, -0.1845695, -1.223279, 0, 1, 0.01568628, 1,
-0.3791017, 0.7019043, -0.6567075, 0, 1, 0.02352941, 1,
-0.3711339, -1.12497, -2.442182, 0, 1, 0.02745098, 1,
-0.3694356, -0.0434976, -2.179543, 0, 1, 0.03529412, 1,
-0.3680231, 0.1807154, -2.436758, 0, 1, 0.03921569, 1,
-0.3635684, -0.1249028, -1.624753, 0, 1, 0.04705882, 1,
-0.3629825, 1.814985, -0.858875, 0, 1, 0.05098039, 1,
-0.3593052, -0.1692568, -1.97908, 0, 1, 0.05882353, 1,
-0.3565999, 0.2569612, -0.005990557, 0, 1, 0.0627451, 1,
-0.3556848, -0.5229722, -3.009278, 0, 1, 0.07058824, 1,
-0.3419247, 0.257011, -0.3130318, 0, 1, 0.07450981, 1,
-0.3394629, -0.4610625, -2.914521, 0, 1, 0.08235294, 1,
-0.336795, 0.6521503, 0.578249, 0, 1, 0.08627451, 1,
-0.334622, 1.257334, -0.5929579, 0, 1, 0.09411765, 1,
-0.3290834, -1.721573, -3.787575, 0, 1, 0.1019608, 1,
-0.3258457, -1.144977, -3.606244, 0, 1, 0.1058824, 1,
-0.3252329, -1.783432, -3.003603, 0, 1, 0.1137255, 1,
-0.3201135, 0.8970611, -0.01491578, 0, 1, 0.1176471, 1,
-0.3193103, -1.059268, -3.792188, 0, 1, 0.1254902, 1,
-0.316743, -1.184082, -1.383353, 0, 1, 0.1294118, 1,
-0.3166931, 0.9196066, 0.4085348, 0, 1, 0.1372549, 1,
-0.3135238, -0.3407806, -0.4384767, 0, 1, 0.1411765, 1,
-0.3102239, -1.148099, -2.890695, 0, 1, 0.1490196, 1,
-0.3066501, 0.5148789, -0.2639061, 0, 1, 0.1529412, 1,
-0.3030532, -0.9573039, -3.250718, 0, 1, 0.1607843, 1,
-0.2986527, -1.908254, -2.329993, 0, 1, 0.1647059, 1,
-0.2984098, -1.003377, -2.691721, 0, 1, 0.172549, 1,
-0.2971624, -0.05076, -4.515916, 0, 1, 0.1764706, 1,
-0.2950747, -0.1744065, -0.6851253, 0, 1, 0.1843137, 1,
-0.2948023, -0.5124141, -1.182807, 0, 1, 0.1882353, 1,
-0.2943603, -2.119199, -3.096061, 0, 1, 0.1960784, 1,
-0.2889969, -1.254199, -2.681446, 0, 1, 0.2039216, 1,
-0.2869739, 1.497242, -0.02905934, 0, 1, 0.2078431, 1,
-0.2847786, -0.4073054, -1.230472, 0, 1, 0.2156863, 1,
-0.283602, 0.8351495, 1.451409, 0, 1, 0.2196078, 1,
-0.2825933, -0.03411037, -3.223645, 0, 1, 0.227451, 1,
-0.2778883, 0.5513487, -0.01390052, 0, 1, 0.2313726, 1,
-0.2770994, -1.00391, -3.718168, 0, 1, 0.2392157, 1,
-0.2758356, 0.2991689, -1.447465, 0, 1, 0.2431373, 1,
-0.2754917, 0.2615379, -0.1064515, 0, 1, 0.2509804, 1,
-0.2683749, -1.157443, -3.608327, 0, 1, 0.254902, 1,
-0.2635941, -1.463844, -3.040433, 0, 1, 0.2627451, 1,
-0.2630765, 0.2735806, 0.6755238, 0, 1, 0.2666667, 1,
-0.2626989, -0.4289271, -4.271351, 0, 1, 0.2745098, 1,
-0.2601675, -0.09577147, -1.858019, 0, 1, 0.2784314, 1,
-0.2565952, 1.954881, -1.06344, 0, 1, 0.2862745, 1,
-0.2553434, 0.1626447, -2.368704, 0, 1, 0.2901961, 1,
-0.2549405, 0.3951377, -2.106963, 0, 1, 0.2980392, 1,
-0.2544925, -0.8076856, -2.403723, 0, 1, 0.3058824, 1,
-0.2538484, -1.092751, -2.757229, 0, 1, 0.3098039, 1,
-0.249909, 0.4553839, -0.1800182, 0, 1, 0.3176471, 1,
-0.2495133, -0.6366733, -2.163314, 0, 1, 0.3215686, 1,
-0.2488251, 1.519229, 0.9752174, 0, 1, 0.3294118, 1,
-0.2478868, 0.6620418, 0.2148549, 0, 1, 0.3333333, 1,
-0.2465716, 1.281767, 2.426053, 0, 1, 0.3411765, 1,
-0.2458368, 0.8907759, 0.9420778, 0, 1, 0.345098, 1,
-0.238738, -0.430271, -2.243113, 0, 1, 0.3529412, 1,
-0.2382757, -0.1688429, -2.339327, 0, 1, 0.3568628, 1,
-0.231385, -0.07041784, -0.3828536, 0, 1, 0.3647059, 1,
-0.2266023, 0.03499116, -1.657059, 0, 1, 0.3686275, 1,
-0.2241447, 1.221231, -1.514879, 0, 1, 0.3764706, 1,
-0.2206243, 0.2502987, -2.374845, 0, 1, 0.3803922, 1,
-0.220004, 0.1893329, 0.09869154, 0, 1, 0.3882353, 1,
-0.216097, -1.15269, -2.793597, 0, 1, 0.3921569, 1,
-0.2151382, -0.198265, -1.796344, 0, 1, 0.4, 1,
-0.21441, 1.340117, 1.097142, 0, 1, 0.4078431, 1,
-0.2131307, -0.7255456, -2.816482, 0, 1, 0.4117647, 1,
-0.2130462, 0.2127603, -1.505743, 0, 1, 0.4196078, 1,
-0.2118728, 0.5202745, -0.5875585, 0, 1, 0.4235294, 1,
-0.2110874, 0.6490436, -0.09839502, 0, 1, 0.4313726, 1,
-0.2084811, -1.090589, -4.063304, 0, 1, 0.4352941, 1,
-0.2076407, 2.661414, 0.247907, 0, 1, 0.4431373, 1,
-0.2067166, -0.9585566, -4.11235, 0, 1, 0.4470588, 1,
-0.2029087, 0.2866131, 0.3927108, 0, 1, 0.454902, 1,
-0.2014388, -0.2366625, -3.268358, 0, 1, 0.4588235, 1,
-0.2003925, -1.300048, -3.574047, 0, 1, 0.4666667, 1,
-0.1979676, -0.6141412, -2.223607, 0, 1, 0.4705882, 1,
-0.187168, 0.5793646, -0.8093681, 0, 1, 0.4784314, 1,
-0.1857359, -0.7978449, -2.221419, 0, 1, 0.4823529, 1,
-0.1853292, 0.9834446, -0.4310629, 0, 1, 0.4901961, 1,
-0.177696, -0.8841627, -6.30007, 0, 1, 0.4941176, 1,
-0.1753332, -2.232164, -3.3952, 0, 1, 0.5019608, 1,
-0.1750779, -0.1209578, -3.158815, 0, 1, 0.509804, 1,
-0.1749034, -0.6322116, -4.066804, 0, 1, 0.5137255, 1,
-0.1734028, 0.4571952, 1.41498, 0, 1, 0.5215687, 1,
-0.1731714, 0.4772391, -1.966508, 0, 1, 0.5254902, 1,
-0.1714999, 0.1117903, -0.2165533, 0, 1, 0.5333334, 1,
-0.170526, 1.138052, 0.9170623, 0, 1, 0.5372549, 1,
-0.1678807, -0.6674793, -2.760349, 0, 1, 0.5450981, 1,
-0.1675906, 0.5795957, 2.290083, 0, 1, 0.5490196, 1,
-0.165924, 0.3723537, -0.7423365, 0, 1, 0.5568628, 1,
-0.1650961, -0.4035224, -3.239979, 0, 1, 0.5607843, 1,
-0.1542077, -0.3021116, -3.381115, 0, 1, 0.5686275, 1,
-0.1525884, -0.3658109, -3.507267, 0, 1, 0.572549, 1,
-0.1503991, -0.6487694, -2.400516, 0, 1, 0.5803922, 1,
-0.1438483, 0.09024542, -1.765851, 0, 1, 0.5843138, 1,
-0.1408696, -0.7608889, -3.021462, 0, 1, 0.5921569, 1,
-0.1386617, -0.3227785, -2.648298, 0, 1, 0.5960785, 1,
-0.1368739, 1.402716, 0.4117122, 0, 1, 0.6039216, 1,
-0.132218, -1.090564, -2.912405, 0, 1, 0.6117647, 1,
-0.1316982, 0.2255624, -1.242927, 0, 1, 0.6156863, 1,
-0.129829, -1.667114, -4.349844, 0, 1, 0.6235294, 1,
-0.1295711, 1.807124, -0.3428515, 0, 1, 0.627451, 1,
-0.1294267, -0.2250781, -3.656463, 0, 1, 0.6352941, 1,
-0.1256828, -1.062959, -2.114059, 0, 1, 0.6392157, 1,
-0.1181383, 0.9085852, 0.2563464, 0, 1, 0.6470588, 1,
-0.1138685, -0.02590859, -1.694688, 0, 1, 0.6509804, 1,
-0.1112088, -0.742369, -1.059437, 0, 1, 0.6588235, 1,
-0.1104172, 0.9171995, 0.3399096, 0, 1, 0.6627451, 1,
-0.1084954, 0.4411522, 0.611983, 0, 1, 0.6705883, 1,
-0.1015602, -3.478259, -2.92272, 0, 1, 0.6745098, 1,
-0.09804481, 1.428755, 0.6426089, 0, 1, 0.682353, 1,
-0.09702428, -1.045489, -2.731224, 0, 1, 0.6862745, 1,
-0.09344739, -0.758326, -3.710855, 0, 1, 0.6941177, 1,
-0.0928115, -0.8524995, -3.348653, 0, 1, 0.7019608, 1,
-0.09250159, -1.275304, -1.58904, 0, 1, 0.7058824, 1,
-0.08865738, -0.782852, -3.515328, 0, 1, 0.7137255, 1,
-0.08369467, 0.6454433, -1.614803, 0, 1, 0.7176471, 1,
-0.08203534, 0.006373426, -1.564838, 0, 1, 0.7254902, 1,
-0.08061018, -0.02827759, -1.815662, 0, 1, 0.7294118, 1,
-0.07994326, -0.9293212, -3.842574, 0, 1, 0.7372549, 1,
-0.07290209, -0.9624092, -2.153431, 0, 1, 0.7411765, 1,
-0.07170504, -1.032158, -1.72442, 0, 1, 0.7490196, 1,
-0.06447859, -0.02365232, -1.936919, 0, 1, 0.7529412, 1,
-0.06327593, -0.1149147, -1.775581, 0, 1, 0.7607843, 1,
-0.06177885, -0.919979, -3.75651, 0, 1, 0.7647059, 1,
-0.0596183, 0.1338129, 0.3278958, 0, 1, 0.772549, 1,
-0.0587997, 1.263701, -0.4837774, 0, 1, 0.7764706, 1,
-0.05679861, 0.1791036, 0.4394209, 0, 1, 0.7843137, 1,
-0.05663718, 0.4512104, 0.9972652, 0, 1, 0.7882353, 1,
-0.05374531, 1.469619, -0.7544276, 0, 1, 0.7960784, 1,
-0.05338092, 0.6165593, 0.2920577, 0, 1, 0.8039216, 1,
-0.0493811, 0.2369843, -0.9482474, 0, 1, 0.8078431, 1,
-0.04859172, 0.6100059, -0.1567193, 0, 1, 0.8156863, 1,
-0.03966654, -1.122137, -1.084965, 0, 1, 0.8196079, 1,
-0.03907036, 1.203049, -0.8396535, 0, 1, 0.827451, 1,
-0.03467538, 1.20931, -2.001896, 0, 1, 0.8313726, 1,
-0.0267602, 0.3384681, -0.9162682, 0, 1, 0.8392157, 1,
-0.02456702, -0.2611068, -2.771095, 0, 1, 0.8431373, 1,
-0.02445927, 0.7233838, -1.452043, 0, 1, 0.8509804, 1,
-0.02411265, -1.026286, -3.774187, 0, 1, 0.854902, 1,
-0.02055358, 0.3154184, 0.616495, 0, 1, 0.8627451, 1,
-0.0182979, -1.981489, -3.330994, 0, 1, 0.8666667, 1,
-0.0160844, -1.174135, -3.466465, 0, 1, 0.8745098, 1,
-0.01561267, -0.07826369, -3.861211, 0, 1, 0.8784314, 1,
-0.01484841, -0.933769, -5.301078, 0, 1, 0.8862745, 1,
-0.009442063, 0.6700032, -2.267102, 0, 1, 0.8901961, 1,
-0.007460179, 0.2467746, -0.03377473, 0, 1, 0.8980392, 1,
0.005803839, 0.2522106, -0.264338, 0, 1, 0.9058824, 1,
0.007631154, 1.293972, -0.912899, 0, 1, 0.9098039, 1,
0.00767422, -0.5433788, 3.055854, 0, 1, 0.9176471, 1,
0.0101532, 0.6885098, 1.394694, 0, 1, 0.9215686, 1,
0.0129269, 0.3866065, 2.019639, 0, 1, 0.9294118, 1,
0.01366689, 0.2274787, -0.2968605, 0, 1, 0.9333333, 1,
0.01517124, -0.3595968, 2.717219, 0, 1, 0.9411765, 1,
0.01901431, 0.6508951, -0.740931, 0, 1, 0.945098, 1,
0.02444781, -0.7794131, 1.499403, 0, 1, 0.9529412, 1,
0.02931985, 0.6645467, -0.2975901, 0, 1, 0.9568627, 1,
0.03311914, -1.193151, 3.23066, 0, 1, 0.9647059, 1,
0.03315527, 0.4843745, 1.800078, 0, 1, 0.9686275, 1,
0.0362599, 0.01120716, -1.221715, 0, 1, 0.9764706, 1,
0.03802732, -0.356071, 2.706918, 0, 1, 0.9803922, 1,
0.03915601, 0.2598476, 0.6226024, 0, 1, 0.9882353, 1,
0.04066144, -2.130237, 2.453984, 0, 1, 0.9921569, 1,
0.04339528, 0.8880673, -0.7441951, 0, 1, 1, 1,
0.04632165, 1.01937, 0.5176626, 0, 0.9921569, 1, 1,
0.04870494, 0.3979089, -0.7801427, 0, 0.9882353, 1, 1,
0.05217268, -0.9313933, 3.247078, 0, 0.9803922, 1, 1,
0.05854779, -0.3440742, 3.021048, 0, 0.9764706, 1, 1,
0.06043712, 0.3001403, 2.129934, 0, 0.9686275, 1, 1,
0.06171075, 0.9530307, -0.4798776, 0, 0.9647059, 1, 1,
0.06174709, -0.10939, 3.217272, 0, 0.9568627, 1, 1,
0.06345201, 0.2019507, -2.57367, 0, 0.9529412, 1, 1,
0.06567814, -0.1377681, 1.16619, 0, 0.945098, 1, 1,
0.0754502, 1.357896, -0.3155602, 0, 0.9411765, 1, 1,
0.07720777, -0.6378933, 4.037169, 0, 0.9333333, 1, 1,
0.0779203, 1.799358, 1.413252, 0, 0.9294118, 1, 1,
0.07822052, -0.5046083, 1.720795, 0, 0.9215686, 1, 1,
0.07911643, 0.4107088, 0.9093096, 0, 0.9176471, 1, 1,
0.08156262, -0.385592, 1.104908, 0, 0.9098039, 1, 1,
0.08233197, 0.6225215, 1.010758, 0, 0.9058824, 1, 1,
0.08734006, -1.502989, 2.621073, 0, 0.8980392, 1, 1,
0.09033499, -0.3654827, 3.64246, 0, 0.8901961, 1, 1,
0.09265482, -0.5992944, 4.593569, 0, 0.8862745, 1, 1,
0.09312068, 1.506528, -0.2808833, 0, 0.8784314, 1, 1,
0.09428272, -0.05433509, 0.168915, 0, 0.8745098, 1, 1,
0.1007217, -0.2350745, 4.408711, 0, 0.8666667, 1, 1,
0.1019175, -0.8517684, 1.89856, 0, 0.8627451, 1, 1,
0.1061673, 0.7502589, 0.3979828, 0, 0.854902, 1, 1,
0.1078068, -2.509753, 1.670349, 0, 0.8509804, 1, 1,
0.1124549, 0.542903, -0.09571467, 0, 0.8431373, 1, 1,
0.1143422, 0.7270662, 1.745122, 0, 0.8392157, 1, 1,
0.1158925, -1.496586, 2.632217, 0, 0.8313726, 1, 1,
0.1172892, 1.205633, 0.4324434, 0, 0.827451, 1, 1,
0.1218441, -2.599037, 3.057265, 0, 0.8196079, 1, 1,
0.1246676, 0.0172436, 1.854783, 0, 0.8156863, 1, 1,
0.1248144, -0.2992602, 1.253239, 0, 0.8078431, 1, 1,
0.1263883, -0.4549366, 4.561279, 0, 0.8039216, 1, 1,
0.1277341, -0.7959524, 2.509556, 0, 0.7960784, 1, 1,
0.1311192, 0.7333315, -0.02532965, 0, 0.7882353, 1, 1,
0.1318206, -0.8884873, 3.657805, 0, 0.7843137, 1, 1,
0.1387136, 0.426824, 2.020734, 0, 0.7764706, 1, 1,
0.1403217, -1.161319, 4.191134, 0, 0.772549, 1, 1,
0.1419501, -0.3134194, 4.304342, 0, 0.7647059, 1, 1,
0.1420233, 0.08191118, 0.9786682, 0, 0.7607843, 1, 1,
0.1428498, -1.634782, 2.127822, 0, 0.7529412, 1, 1,
0.1429681, -0.3347682, 1.369072, 0, 0.7490196, 1, 1,
0.1454101, 0.2885539, 0.5182323, 0, 0.7411765, 1, 1,
0.148195, -0.1635835, 2.893037, 0, 0.7372549, 1, 1,
0.1620596, -0.2359887, 1.432916, 0, 0.7294118, 1, 1,
0.1642295, -1.391128, 2.830601, 0, 0.7254902, 1, 1,
0.174216, -0.9064317, 2.431244, 0, 0.7176471, 1, 1,
0.1768238, 2.08009, 0.6794811, 0, 0.7137255, 1, 1,
0.180976, -0.3535675, 1.497015, 0, 0.7058824, 1, 1,
0.1813951, -0.1289619, 1.236286, 0, 0.6980392, 1, 1,
0.1827252, -0.2982784, 3.883697, 0, 0.6941177, 1, 1,
0.1850097, -0.9886396, 3.699668, 0, 0.6862745, 1, 1,
0.1854706, 1.11556, -0.2415397, 0, 0.682353, 1, 1,
0.1890765, 0.213721, -0.7934403, 0, 0.6745098, 1, 1,
0.1907067, 0.2714174, 0.4399245, 0, 0.6705883, 1, 1,
0.1913233, 0.03637025, 2.891628, 0, 0.6627451, 1, 1,
0.1921479, -0.4204878, 2.879585, 0, 0.6588235, 1, 1,
0.1942168, 1.109291, 0.4016045, 0, 0.6509804, 1, 1,
0.1943986, -0.8919818, 1.331113, 0, 0.6470588, 1, 1,
0.1948569, -0.5358016, 1.595938, 0, 0.6392157, 1, 1,
0.1955979, -1.274587, 4.06673, 0, 0.6352941, 1, 1,
0.1970707, 0.1192556, 1.952253, 0, 0.627451, 1, 1,
0.1996453, -0.1307699, 1.107664, 0, 0.6235294, 1, 1,
0.2007394, 0.8502252, 2.380295, 0, 0.6156863, 1, 1,
0.2046084, 0.04187134, -0.6377477, 0, 0.6117647, 1, 1,
0.2063346, -0.4031786, 1.904281, 0, 0.6039216, 1, 1,
0.2073383, -2.127557, 3.464455, 0, 0.5960785, 1, 1,
0.2100187, -0.8133398, 1.965796, 0, 0.5921569, 1, 1,
0.2109404, 2.999287, 0.9401818, 0, 0.5843138, 1, 1,
0.2128538, -0.6231211, 4.812111, 0, 0.5803922, 1, 1,
0.2129235, 0.2836397, 1.149469, 0, 0.572549, 1, 1,
0.2139643, 0.3749191, 1.547027, 0, 0.5686275, 1, 1,
0.2140339, 1.919843, -1.203055, 0, 0.5607843, 1, 1,
0.2142902, 0.6761069, 1.272781, 0, 0.5568628, 1, 1,
0.2187725, 0.6807265, 1.51455, 0, 0.5490196, 1, 1,
0.2233403, 0.08211756, 1.266934, 0, 0.5450981, 1, 1,
0.2250252, 0.6776536, 0.4067825, 0, 0.5372549, 1, 1,
0.2256084, -0.8280277, 3.575104, 0, 0.5333334, 1, 1,
0.2278334, -0.7408783, 3.153095, 0, 0.5254902, 1, 1,
0.2333043, -0.498629, 2.581776, 0, 0.5215687, 1, 1,
0.2374035, -0.7347052, 2.763604, 0, 0.5137255, 1, 1,
0.2387926, -0.2452013, 4.106328, 0, 0.509804, 1, 1,
0.2419454, -0.2399374, 2.729017, 0, 0.5019608, 1, 1,
0.242195, -0.07591438, 0.9785476, 0, 0.4941176, 1, 1,
0.2447324, 1.036564, 0.4893832, 0, 0.4901961, 1, 1,
0.2462293, -0.2529142, 2.351, 0, 0.4823529, 1, 1,
0.2471292, -0.5005198, 1.931146, 0, 0.4784314, 1, 1,
0.2477033, -0.354459, 2.89627, 0, 0.4705882, 1, 1,
0.2498853, -0.0123397, 1.405451, 0, 0.4666667, 1, 1,
0.251823, -0.8831417, 2.486892, 0, 0.4588235, 1, 1,
0.2527742, 2.798461, -0.1766811, 0, 0.454902, 1, 1,
0.2550671, -0.03095483, 1.372227, 0, 0.4470588, 1, 1,
0.2583233, 0.1371095, 1.241124, 0, 0.4431373, 1, 1,
0.2595623, -0.3012675, 2.325635, 0, 0.4352941, 1, 1,
0.2613433, 1.189744, 0.7222732, 0, 0.4313726, 1, 1,
0.2627754, -0.05768059, 2.160668, 0, 0.4235294, 1, 1,
0.2674737, -0.33931, 1.753985, 0, 0.4196078, 1, 1,
0.2685678, 1.045624, 0.1913124, 0, 0.4117647, 1, 1,
0.2722195, -1.462852, 5.355116, 0, 0.4078431, 1, 1,
0.2726438, 0.007662551, 4.183138, 0, 0.4, 1, 1,
0.2735656, 0.4272854, -0.147859, 0, 0.3921569, 1, 1,
0.2787443, 0.547269, 0.1500729, 0, 0.3882353, 1, 1,
0.2801691, -1.954908, 3.038176, 0, 0.3803922, 1, 1,
0.2820912, -0.04546389, 0.3126211, 0, 0.3764706, 1, 1,
0.2865402, 0.2908924, 0.2409392, 0, 0.3686275, 1, 1,
0.2931565, 1.062516, 2.020853, 0, 0.3647059, 1, 1,
0.2933052, 2.499149, 0.2829978, 0, 0.3568628, 1, 1,
0.2945726, 2.371891, 1.000574, 0, 0.3529412, 1, 1,
0.2947234, -0.5620338, 1.981791, 0, 0.345098, 1, 1,
0.2986979, -0.3783046, 1.641541, 0, 0.3411765, 1, 1,
0.30763, -0.5054489, 1.448272, 0, 0.3333333, 1, 1,
0.3100473, -0.9983518, 2.596937, 0, 0.3294118, 1, 1,
0.3124433, 0.2206054, -0.06965458, 0, 0.3215686, 1, 1,
0.3135684, -0.7772966, 2.404855, 0, 0.3176471, 1, 1,
0.3139359, 0.866841, 1.800067, 0, 0.3098039, 1, 1,
0.3212505, -1.077309, 3.237303, 0, 0.3058824, 1, 1,
0.3237649, -0.6253428, 3.267548, 0, 0.2980392, 1, 1,
0.328164, 0.6876024, -0.3982488, 0, 0.2901961, 1, 1,
0.3282687, -1.613267, 1.108154, 0, 0.2862745, 1, 1,
0.3355796, 0.1764596, 1.162579, 0, 0.2784314, 1, 1,
0.33632, -0.3336269, 3.744841, 0, 0.2745098, 1, 1,
0.336637, -1.152456, 3.718628, 0, 0.2666667, 1, 1,
0.3374689, -0.96252, 4.400257, 0, 0.2627451, 1, 1,
0.3395512, -1.1612, 0.7885811, 0, 0.254902, 1, 1,
0.3404005, 0.1415554, 1.671455, 0, 0.2509804, 1, 1,
0.3421185, 0.4022047, 1.265291, 0, 0.2431373, 1, 1,
0.3421441, -0.2759287, 1.634734, 0, 0.2392157, 1, 1,
0.3436032, -0.1178229, 1.139472, 0, 0.2313726, 1, 1,
0.3462048, 0.2615338, 0.6100261, 0, 0.227451, 1, 1,
0.3482198, -0.008536341, 2.341919, 0, 0.2196078, 1, 1,
0.3507979, -1.214505, 1.745382, 0, 0.2156863, 1, 1,
0.354183, -0.6162184, 1.904721, 0, 0.2078431, 1, 1,
0.3544326, 0.3361472, -0.8271841, 0, 0.2039216, 1, 1,
0.3553612, -0.7088098, 1.424736, 0, 0.1960784, 1, 1,
0.3563169, 0.5141636, 0.7531971, 0, 0.1882353, 1, 1,
0.3679582, 0.8980016, -2.509621, 0, 0.1843137, 1, 1,
0.3682836, -0.02840617, 3.059125, 0, 0.1764706, 1, 1,
0.3746026, -0.5598048, 2.568554, 0, 0.172549, 1, 1,
0.3777139, 1.564459, 0.8021598, 0, 0.1647059, 1, 1,
0.384522, 0.5401827, 0.4977548, 0, 0.1607843, 1, 1,
0.3850045, -0.8121352, 2.542129, 0, 0.1529412, 1, 1,
0.3864023, 1.369427, -1.400709, 0, 0.1490196, 1, 1,
0.3893252, -1.74065, 3.273318, 0, 0.1411765, 1, 1,
0.3910797, -0.3148995, 1.963019, 0, 0.1372549, 1, 1,
0.3916802, -1.30201, 1.652811, 0, 0.1294118, 1, 1,
0.397831, -0.4030368, -0.1629798, 0, 0.1254902, 1, 1,
0.3998622, -0.8713497, 3.182889, 0, 0.1176471, 1, 1,
0.4011526, 0.06041012, -1.051681, 0, 0.1137255, 1, 1,
0.4022228, -0.2662416, 1.655516, 0, 0.1058824, 1, 1,
0.4024669, -1.178978, 3.771303, 0, 0.09803922, 1, 1,
0.4028915, -1.749098, 3.67275, 0, 0.09411765, 1, 1,
0.4051314, 1.54662, 0.588417, 0, 0.08627451, 1, 1,
0.4052258, -1.854698, 3.095062, 0, 0.08235294, 1, 1,
0.4071317, 0.4777593, 1.842387, 0, 0.07450981, 1, 1,
0.4077522, 0.01731256, 1.426813, 0, 0.07058824, 1, 1,
0.407961, -0.3059113, 2.953595, 0, 0.0627451, 1, 1,
0.412485, -1.180657, 4.939937, 0, 0.05882353, 1, 1,
0.4217364, -0.2372896, 2.743714, 0, 0.05098039, 1, 1,
0.4234798, -0.2789681, 3.396368, 0, 0.04705882, 1, 1,
0.4247773, -0.420442, 3.636376, 0, 0.03921569, 1, 1,
0.4321077, -0.8140694, 3.590764, 0, 0.03529412, 1, 1,
0.432248, 0.2085868, 2.295738, 0, 0.02745098, 1, 1,
0.4364203, -0.3750187, 2.063204, 0, 0.02352941, 1, 1,
0.4372337, -1.346791, 2.707582, 0, 0.01568628, 1, 1,
0.4417827, -1.070409, 3.5737, 0, 0.01176471, 1, 1,
0.4428873, 0.3745209, 1.30519, 0, 0.003921569, 1, 1,
0.4448258, -1.623476, 2.817336, 0.003921569, 0, 1, 1,
0.4457364, 1.830234, -0.01454391, 0.007843138, 0, 1, 1,
0.4485155, -0.5924025, 2.152248, 0.01568628, 0, 1, 1,
0.4523446, 1.042575, 1.236384, 0.01960784, 0, 1, 1,
0.4544148, -0.6596189, 1.300712, 0.02745098, 0, 1, 1,
0.4551889, -0.3719934, 3.464142, 0.03137255, 0, 1, 1,
0.4572598, -0.8903967, 2.776754, 0.03921569, 0, 1, 1,
0.4583706, -0.3587866, 2.433771, 0.04313726, 0, 1, 1,
0.4593998, -0.2173274, 2.051576, 0.05098039, 0, 1, 1,
0.465126, 0.2623752, 1.51365, 0.05490196, 0, 1, 1,
0.465306, -0.2771124, 3.337094, 0.0627451, 0, 1, 1,
0.4681077, -0.8575275, 4.131494, 0.06666667, 0, 1, 1,
0.4687014, 0.1830937, -0.2998833, 0.07450981, 0, 1, 1,
0.4691007, 1.83577, -0.3652601, 0.07843138, 0, 1, 1,
0.4706042, -1.182428, 1.125215, 0.08627451, 0, 1, 1,
0.4728471, 1.451869, -0.3804354, 0.09019608, 0, 1, 1,
0.4835055, 1.70851, 1.551929, 0.09803922, 0, 1, 1,
0.4852223, -1.13728, 2.078886, 0.1058824, 0, 1, 1,
0.4876436, -0.1484841, 2.708504, 0.1098039, 0, 1, 1,
0.490021, -1.759609, 5.154757, 0.1176471, 0, 1, 1,
0.4915191, 1.066594, 0.586573, 0.1215686, 0, 1, 1,
0.4941558, 0.5801967, 1.623011, 0.1294118, 0, 1, 1,
0.4956426, 3.306638, 0.1755848, 0.1333333, 0, 1, 1,
0.496181, 1.842956, 1.557003, 0.1411765, 0, 1, 1,
0.498318, 0.1403616, 0.6783863, 0.145098, 0, 1, 1,
0.4993422, -0.6380921, 1.823011, 0.1529412, 0, 1, 1,
0.5106959, 0.5293714, 0.130749, 0.1568628, 0, 1, 1,
0.51193, 0.8384711, 1.629804, 0.1647059, 0, 1, 1,
0.5250641, -1.215513, 0.7237571, 0.1686275, 0, 1, 1,
0.529528, -0.8131843, 1.095828, 0.1764706, 0, 1, 1,
0.5301811, 1.183725, 0.4904962, 0.1803922, 0, 1, 1,
0.5345861, -1.018754, 2.724165, 0.1882353, 0, 1, 1,
0.5382789, 0.8593646, 0.4394327, 0.1921569, 0, 1, 1,
0.5438482, -1.236937, 3.748995, 0.2, 0, 1, 1,
0.5598763, 0.1848168, 1.939385, 0.2078431, 0, 1, 1,
0.5631722, 0.5178356, 1.160567, 0.2117647, 0, 1, 1,
0.5695186, -1.368683, 4.086356, 0.2196078, 0, 1, 1,
0.5709465, 0.5091177, -0.05744973, 0.2235294, 0, 1, 1,
0.5732854, -0.2281806, 1.094589, 0.2313726, 0, 1, 1,
0.5743197, 0.1798231, 1.59627, 0.2352941, 0, 1, 1,
0.5786787, -1.916066, 4.662694, 0.2431373, 0, 1, 1,
0.5793035, 2.117743, -0.3554551, 0.2470588, 0, 1, 1,
0.5810353, 0.6948324, 0.5210933, 0.254902, 0, 1, 1,
0.5858625, -0.5599259, 1.996867, 0.2588235, 0, 1, 1,
0.5888365, -0.8898892, 2.088986, 0.2666667, 0, 1, 1,
0.5895115, -0.866356, 3.862262, 0.2705882, 0, 1, 1,
0.589552, -0.2803513, 3.973108, 0.2784314, 0, 1, 1,
0.5899196, 0.3862012, -0.6188623, 0.282353, 0, 1, 1,
0.591058, 0.9775535, 0.6050803, 0.2901961, 0, 1, 1,
0.5934972, -0.3451663, 1.528356, 0.2941177, 0, 1, 1,
0.5952662, -0.6380619, 0.8347175, 0.3019608, 0, 1, 1,
0.5958658, -1.313366, 2.464033, 0.3098039, 0, 1, 1,
0.6007609, -1.461117, 1.27427, 0.3137255, 0, 1, 1,
0.6008987, -0.6267155, 0.4536388, 0.3215686, 0, 1, 1,
0.6017492, 0.2156843, 2.118388, 0.3254902, 0, 1, 1,
0.6116989, -0.6792691, 3.20379, 0.3333333, 0, 1, 1,
0.6118747, -2.193129, 3.640774, 0.3372549, 0, 1, 1,
0.6189931, -1.949608, 2.819518, 0.345098, 0, 1, 1,
0.6199961, -1.201243, 3.084547, 0.3490196, 0, 1, 1,
0.624232, 0.4634546, 0.5980566, 0.3568628, 0, 1, 1,
0.6252668, -0.665326, 3.124647, 0.3607843, 0, 1, 1,
0.6273954, 1.046717, -0.5635744, 0.3686275, 0, 1, 1,
0.6290188, 0.4194286, 1.005078, 0.372549, 0, 1, 1,
0.6308162, 0.5661008, 1.146881, 0.3803922, 0, 1, 1,
0.6308921, -0.5736848, 2.156566, 0.3843137, 0, 1, 1,
0.6378974, 1.405652, 0.7067624, 0.3921569, 0, 1, 1,
0.6395062, -0.3257879, 3.615654, 0.3960784, 0, 1, 1,
0.6400727, -0.5613382, 2.464979, 0.4039216, 0, 1, 1,
0.6402858, -0.9588084, 1.512425, 0.4117647, 0, 1, 1,
0.645581, -0.07539947, 2.565032, 0.4156863, 0, 1, 1,
0.6470329, 0.1291377, 2.382054, 0.4235294, 0, 1, 1,
0.6485651, -0.3461302, 2.101032, 0.427451, 0, 1, 1,
0.6508642, -0.1129559, 2.274179, 0.4352941, 0, 1, 1,
0.6526862, 0.7397361, -0.03213692, 0.4392157, 0, 1, 1,
0.6544209, -0.4198616, 2.6606, 0.4470588, 0, 1, 1,
0.6602927, 1.975593, 1.277588, 0.4509804, 0, 1, 1,
0.660702, 0.2095097, 0.3347497, 0.4588235, 0, 1, 1,
0.6620286, 1.212801, 2.072449, 0.4627451, 0, 1, 1,
0.665865, 0.1305232, 1.650147, 0.4705882, 0, 1, 1,
0.6662093, 1.072873, -1.313871, 0.4745098, 0, 1, 1,
0.6672867, 0.3143501, 2.177179, 0.4823529, 0, 1, 1,
0.6758165, -0.4576885, 1.292353, 0.4862745, 0, 1, 1,
0.677884, 0.1259072, -0.3411917, 0.4941176, 0, 1, 1,
0.6786425, 0.4844645, 0.5830736, 0.5019608, 0, 1, 1,
0.679585, -0.5506647, 2.868438, 0.5058824, 0, 1, 1,
0.6802695, -0.06234125, 0.9576932, 0.5137255, 0, 1, 1,
0.6822351, 0.1018052, 1.208293, 0.5176471, 0, 1, 1,
0.6869593, 0.5637768, 0.5034959, 0.5254902, 0, 1, 1,
0.6903573, -1.520155, 2.245535, 0.5294118, 0, 1, 1,
0.6927041, -0.5760643, 3.937898, 0.5372549, 0, 1, 1,
0.6962188, -0.9751338, 3.550196, 0.5411765, 0, 1, 1,
0.6969773, 2.187844, 0.4945056, 0.5490196, 0, 1, 1,
0.6981668, 0.1028877, 0.8385921, 0.5529412, 0, 1, 1,
0.7089883, -0.7597072, 2.698616, 0.5607843, 0, 1, 1,
0.7098481, -0.2248269, 1.749657, 0.5647059, 0, 1, 1,
0.721223, -0.1994159, 0.8320348, 0.572549, 0, 1, 1,
0.7220169, -0.3231989, 2.007223, 0.5764706, 0, 1, 1,
0.7262528, 0.01525372, 0.7413167, 0.5843138, 0, 1, 1,
0.7290446, -0.6660581, 2.431368, 0.5882353, 0, 1, 1,
0.7306787, 0.07369635, 2.069014, 0.5960785, 0, 1, 1,
0.739018, -0.1877983, 2.05298, 0.6039216, 0, 1, 1,
0.7422398, -0.9141669, 0.9914001, 0.6078432, 0, 1, 1,
0.7448547, -0.7233568, 2.005012, 0.6156863, 0, 1, 1,
0.7488967, -0.7981914, 2.670437, 0.6196079, 0, 1, 1,
0.7588524, -0.8128229, 2.347252, 0.627451, 0, 1, 1,
0.7595845, -0.530029, 1.874578, 0.6313726, 0, 1, 1,
0.7606201, 0.8473281, 1.091073, 0.6392157, 0, 1, 1,
0.7646723, 1.308591, 0.124161, 0.6431373, 0, 1, 1,
0.7722353, -0.6816251, 3.215074, 0.6509804, 0, 1, 1,
0.7751143, 0.283066, 1.972073, 0.654902, 0, 1, 1,
0.7765037, -0.4176096, 0.7547902, 0.6627451, 0, 1, 1,
0.7794039, 0.5835777, 1.51601, 0.6666667, 0, 1, 1,
0.7794973, -0.4403593, 2.02634, 0.6745098, 0, 1, 1,
0.7947435, 0.1216003, 1.773252, 0.6784314, 0, 1, 1,
0.7982373, -1.16845, 2.395581, 0.6862745, 0, 1, 1,
0.8003583, -0.4013768, 1.736163, 0.6901961, 0, 1, 1,
0.802856, -0.3381295, 0.5256323, 0.6980392, 0, 1, 1,
0.8032219, 0.7756665, -0.1186082, 0.7058824, 0, 1, 1,
0.8055371, -0.3431411, 0.5728208, 0.7098039, 0, 1, 1,
0.8078275, 1.040734, 1.251684, 0.7176471, 0, 1, 1,
0.8095217, 0.4422722, -0.9393893, 0.7215686, 0, 1, 1,
0.809534, 0.5189127, 0.2780311, 0.7294118, 0, 1, 1,
0.8097351, 2.218071, 0.8002486, 0.7333333, 0, 1, 1,
0.8127168, 0.148742, 1.768647, 0.7411765, 0, 1, 1,
0.8151907, 0.8642895, 0.8129774, 0.7450981, 0, 1, 1,
0.8160892, 2.212259, 2.009161, 0.7529412, 0, 1, 1,
0.8200681, 0.7581295, 1.149609, 0.7568628, 0, 1, 1,
0.8206928, -0.2083087, 2.205143, 0.7647059, 0, 1, 1,
0.8261814, 0.2821225, -0.5865401, 0.7686275, 0, 1, 1,
0.8296546, -1.261502, 2.929704, 0.7764706, 0, 1, 1,
0.8373321, -0.260095, 1.660116, 0.7803922, 0, 1, 1,
0.8474007, -1.929442, 4.45835, 0.7882353, 0, 1, 1,
0.8512121, -1.137445, 2.723473, 0.7921569, 0, 1, 1,
0.8531054, -0.1132156, 1.83653, 0.8, 0, 1, 1,
0.8583651, 0.6285049, -0.6258362, 0.8078431, 0, 1, 1,
0.8629573, -0.2714742, 2.702759, 0.8117647, 0, 1, 1,
0.8681294, 0.9798264, 1.151397, 0.8196079, 0, 1, 1,
0.868295, 0.7353532, 0.9935631, 0.8235294, 0, 1, 1,
0.8725228, 0.5359807, 1.050882, 0.8313726, 0, 1, 1,
0.8820894, -0.2777233, 1.661043, 0.8352941, 0, 1, 1,
0.8845364, -0.9403918, 2.583363, 0.8431373, 0, 1, 1,
0.8849168, -0.332678, 2.765475, 0.8470588, 0, 1, 1,
0.8873503, -0.2714633, 2.652676, 0.854902, 0, 1, 1,
0.8874012, 2.332248, 1.842933, 0.8588235, 0, 1, 1,
0.8890252, -1.090644, 3.134038, 0.8666667, 0, 1, 1,
0.8898282, 2.715437, 0.3460817, 0.8705882, 0, 1, 1,
0.8968778, 0.2218694, 2.553208, 0.8784314, 0, 1, 1,
0.8981456, 0.6239293, 1.147704, 0.8823529, 0, 1, 1,
0.8992399, -0.9437014, 2.639721, 0.8901961, 0, 1, 1,
0.8999659, 0.7182521, -0.7850072, 0.8941177, 0, 1, 1,
0.9152037, 0.3081031, 1.360645, 0.9019608, 0, 1, 1,
0.923646, -0.1846971, 0.8139449, 0.9098039, 0, 1, 1,
0.9331964, 0.2450067, 2.045993, 0.9137255, 0, 1, 1,
0.9343084, -0.3173821, -0.8651567, 0.9215686, 0, 1, 1,
0.9394642, -0.3212213, 2.408662, 0.9254902, 0, 1, 1,
0.9471286, 0.7719651, 1.354538, 0.9333333, 0, 1, 1,
0.9478889, -3.059076, 3.839708, 0.9372549, 0, 1, 1,
0.949486, -0.2914291, 1.032682, 0.945098, 0, 1, 1,
0.9514975, 0.4193473, 1.401502, 0.9490196, 0, 1, 1,
0.9595006, 0.1534653, 1.845603, 0.9568627, 0, 1, 1,
0.9639736, -0.06889489, 0.9107097, 0.9607843, 0, 1, 1,
0.9647115, 0.7626459, 1.33785, 0.9686275, 0, 1, 1,
0.9689857, 0.8482254, 0.2223053, 0.972549, 0, 1, 1,
0.9731898, -1.203473, 3.98632, 0.9803922, 0, 1, 1,
0.9748135, -0.06835448, 1.923542, 0.9843137, 0, 1, 1,
0.9835154, 0.9575, -0.9171939, 0.9921569, 0, 1, 1,
0.985778, -0.6218486, 0.6728612, 0.9960784, 0, 1, 1,
0.9870318, 0.2864719, 1.622769, 1, 0, 0.9960784, 1,
0.9894348, 1.679316, 2.377644, 1, 0, 0.9882353, 1,
0.9913349, -1.267758, 2.584197, 1, 0, 0.9843137, 1,
0.9936547, 0.6118709, 1.780166, 1, 0, 0.9764706, 1,
0.9937197, -0.9141209, 3.713719, 1, 0, 0.972549, 1,
0.9954713, -0.7558756, 3.406392, 1, 0, 0.9647059, 1,
0.9957654, -0.4555165, 0.8242279, 1, 0, 0.9607843, 1,
0.9971594, 0.01107381, 0.3972916, 1, 0, 0.9529412, 1,
1.00139, 0.05826382, -0.4589006, 1, 0, 0.9490196, 1,
1.009959, 0.8315614, 0.0500028, 1, 0, 0.9411765, 1,
1.014103, -0.506658, 1.719754, 1, 0, 0.9372549, 1,
1.014837, 1.064687, 0.3126549, 1, 0, 0.9294118, 1,
1.021768, 0.4397315, 1.730022, 1, 0, 0.9254902, 1,
1.022592, 0.4745084, 2.146972, 1, 0, 0.9176471, 1,
1.023603, 1.695383, -0.1316607, 1, 0, 0.9137255, 1,
1.03302, -1.382634, 0.9009747, 1, 0, 0.9058824, 1,
1.038788, -0.2569652, 1.56522, 1, 0, 0.9019608, 1,
1.040675, -0.6605921, 2.07564, 1, 0, 0.8941177, 1,
1.041446, -2.121848, 1.985154, 1, 0, 0.8862745, 1,
1.045394, 0.8536546, 0.796684, 1, 0, 0.8823529, 1,
1.046272, -0.3955615, 2.156001, 1, 0, 0.8745098, 1,
1.050971, -0.01415671, 1.946882, 1, 0, 0.8705882, 1,
1.053508, 0.1265115, 1.186563, 1, 0, 0.8627451, 1,
1.055165, -0.4696877, 1.257411, 1, 0, 0.8588235, 1,
1.069933, 0.9432984, -0.2268173, 1, 0, 0.8509804, 1,
1.072445, 0.1474866, 2.617628, 1, 0, 0.8470588, 1,
1.073791, -1.354933, 3.208197, 1, 0, 0.8392157, 1,
1.083732, -0.741619, 2.457256, 1, 0, 0.8352941, 1,
1.086484, -0.8311067, 2.634588, 1, 0, 0.827451, 1,
1.096503, 1.404726, 0.7640613, 1, 0, 0.8235294, 1,
1.101153, -0.5354943, 4.296988, 1, 0, 0.8156863, 1,
1.110722, -0.2913782, 2.475564, 1, 0, 0.8117647, 1,
1.115725, -1.009794, 3.055701, 1, 0, 0.8039216, 1,
1.118208, 0.1903102, 2.052314, 1, 0, 0.7960784, 1,
1.122838, 0.03542968, 2.258589, 1, 0, 0.7921569, 1,
1.135933, 1.264306, 1.099982, 1, 0, 0.7843137, 1,
1.152519, 0.4228631, 0.09734764, 1, 0, 0.7803922, 1,
1.184484, 0.600498, 1.218029, 1, 0, 0.772549, 1,
1.19113, 0.9600965, -0.04061469, 1, 0, 0.7686275, 1,
1.19585, 1.697133, 0.9167892, 1, 0, 0.7607843, 1,
1.203014, -0.3731928, 0.7371309, 1, 0, 0.7568628, 1,
1.20353, -0.09785316, 3.254718, 1, 0, 0.7490196, 1,
1.21183, -1.434458, 3.322792, 1, 0, 0.7450981, 1,
1.224358, 0.3553799, 3.182921, 1, 0, 0.7372549, 1,
1.227113, -0.05183489, 2.169919, 1, 0, 0.7333333, 1,
1.233635, -0.4968294, 1.340791, 1, 0, 0.7254902, 1,
1.235444, -0.2071431, 0.01409269, 1, 0, 0.7215686, 1,
1.246529, -0.9752222, 1.932313, 1, 0, 0.7137255, 1,
1.249849, -0.369022, 2.778863, 1, 0, 0.7098039, 1,
1.250539, 0.1067125, 2.148822, 1, 0, 0.7019608, 1,
1.2511, 0.4681654, 1.521224, 1, 0, 0.6941177, 1,
1.253152, -0.01861654, 0.2985348, 1, 0, 0.6901961, 1,
1.257228, -0.4502775, 1.489465, 1, 0, 0.682353, 1,
1.263425, -0.2361453, 3.039628, 1, 0, 0.6784314, 1,
1.269693, -0.02077122, 1.449544, 1, 0, 0.6705883, 1,
1.282268, 0.4587794, 2.184176, 1, 0, 0.6666667, 1,
1.286934, -0.3581753, 1.280442, 1, 0, 0.6588235, 1,
1.289403, -1.472665, 4.256666, 1, 0, 0.654902, 1,
1.289863, 2.429029, -1.363858, 1, 0, 0.6470588, 1,
1.301773, -0.8676571, 1.043436, 1, 0, 0.6431373, 1,
1.317861, 0.3252139, 0.8649048, 1, 0, 0.6352941, 1,
1.321751, 1.922187, 2.844928, 1, 0, 0.6313726, 1,
1.323749, -0.03721644, 1.791598, 1, 0, 0.6235294, 1,
1.32728, 1.146617, -0.3711112, 1, 0, 0.6196079, 1,
1.333616, 2.273403, -1.498955, 1, 0, 0.6117647, 1,
1.336014, 0.5777493, 0.5151469, 1, 0, 0.6078432, 1,
1.337319, -0.4205375, 3.6035, 1, 0, 0.6, 1,
1.347837, 0.2696599, 0.5645942, 1, 0, 0.5921569, 1,
1.353481, -1.515504, 1.633531, 1, 0, 0.5882353, 1,
1.360006, -1.067538, 3.641774, 1, 0, 0.5803922, 1,
1.36803, -0.8913074, 1.575246, 1, 0, 0.5764706, 1,
1.370549, -0.3542441, 3.099889, 1, 0, 0.5686275, 1,
1.376237, -0.4552802, 0.5772852, 1, 0, 0.5647059, 1,
1.39619, 1.095453, -1.142301, 1, 0, 0.5568628, 1,
1.396934, 1.466892, 1.060551, 1, 0, 0.5529412, 1,
1.399891, 0.3547637, 1.41403, 1, 0, 0.5450981, 1,
1.403354, 0.692687, 1.771439, 1, 0, 0.5411765, 1,
1.408385, 0.2769728, 0.4637352, 1, 0, 0.5333334, 1,
1.408949, -0.8130406, 2.381518, 1, 0, 0.5294118, 1,
1.420378, 0.9916695, -0.47058, 1, 0, 0.5215687, 1,
1.42113, -0.1971237, 3.252884, 1, 0, 0.5176471, 1,
1.422081, -0.178587, 1.999095, 1, 0, 0.509804, 1,
1.426382, -0.6889483, 0.9278898, 1, 0, 0.5058824, 1,
1.435065, 2.323754, 0.2834603, 1, 0, 0.4980392, 1,
1.438987, -1.124907, 1.482354, 1, 0, 0.4901961, 1,
1.441489, -0.3619158, 2.659064, 1, 0, 0.4862745, 1,
1.462963, -0.1063049, 1.885121, 1, 0, 0.4784314, 1,
1.480621, -0.2365521, -0.1330269, 1, 0, 0.4745098, 1,
1.491596, 2.440227, 1.967945, 1, 0, 0.4666667, 1,
1.492293, 0.1673937, 1.48507, 1, 0, 0.4627451, 1,
1.519684, 1.117136, -0.121624, 1, 0, 0.454902, 1,
1.523706, 1.402991, 1.029411, 1, 0, 0.4509804, 1,
1.527216, -0.8171944, 1.395042, 1, 0, 0.4431373, 1,
1.532534, 1.259776, 0.05890051, 1, 0, 0.4392157, 1,
1.536549, 0.4832794, 1.32033, 1, 0, 0.4313726, 1,
1.563474, -0.5456631, 2.036516, 1, 0, 0.427451, 1,
1.565095, -1.07517, 2.327646, 1, 0, 0.4196078, 1,
1.5826, -0.7458602, 0.2477661, 1, 0, 0.4156863, 1,
1.586868, 0.1052487, 1.116701, 1, 0, 0.4078431, 1,
1.591983, 0.406315, 0.6305802, 1, 0, 0.4039216, 1,
1.59296, -1.409751, 2.102544, 1, 0, 0.3960784, 1,
1.595148, 0.3998176, 2.605448, 1, 0, 0.3882353, 1,
1.59976, -1.527409, 3.900373, 1, 0, 0.3843137, 1,
1.612106, -0.2197335, 1.232311, 1, 0, 0.3764706, 1,
1.618467, 0.5007874, 0.3732219, 1, 0, 0.372549, 1,
1.62465, 0.2550775, -0.234129, 1, 0, 0.3647059, 1,
1.629215, -0.3693131, 2.69549, 1, 0, 0.3607843, 1,
1.629629, 0.0536629, 1.827673, 1, 0, 0.3529412, 1,
1.632013, 0.2267589, -0.1648561, 1, 0, 0.3490196, 1,
1.632285, 1.390385, 1.329051, 1, 0, 0.3411765, 1,
1.635194, 1.993881, -0.9751429, 1, 0, 0.3372549, 1,
1.649429, 0.265719, -0.6598694, 1, 0, 0.3294118, 1,
1.657559, 1.559525, 1.00113, 1, 0, 0.3254902, 1,
1.679857, -0.2984054, 0.4537438, 1, 0, 0.3176471, 1,
1.703319, -0.944112, 1.841944, 1, 0, 0.3137255, 1,
1.703856, -1.157361, 1.973351, 1, 0, 0.3058824, 1,
1.729842, 0.1046662, 1.850862, 1, 0, 0.2980392, 1,
1.748531, -1.83188, 3.704688, 1, 0, 0.2941177, 1,
1.76179, -0.9230699, 2.394297, 1, 0, 0.2862745, 1,
1.779331, 1.361266, 0.2707604, 1, 0, 0.282353, 1,
1.780775, 0.3912359, 0.5023784, 1, 0, 0.2745098, 1,
1.787579, 0.5202052, 1.576922, 1, 0, 0.2705882, 1,
1.78957, -1.382178, 1.965288, 1, 0, 0.2627451, 1,
1.790971, 0.177513, 1.357639, 1, 0, 0.2588235, 1,
1.795009, 0.8310528, -0.1414581, 1, 0, 0.2509804, 1,
1.797055, -0.5493149, 1.727386, 1, 0, 0.2470588, 1,
1.807591, 0.6787095, 0.4269243, 1, 0, 0.2392157, 1,
1.845513, -0.7890123, 1.116407, 1, 0, 0.2352941, 1,
1.847772, -1.827939, 1.649782, 1, 0, 0.227451, 1,
1.858986, 0.2881461, 2.074179, 1, 0, 0.2235294, 1,
1.859717, 0.1258933, 0.456837, 1, 0, 0.2156863, 1,
1.895176, 1.545087, 0.7824207, 1, 0, 0.2117647, 1,
1.942071, 1.219641, 1.273986, 1, 0, 0.2039216, 1,
1.958401, 0.1009924, 1.200856, 1, 0, 0.1960784, 1,
1.961112, 0.5511966, 3.249007, 1, 0, 0.1921569, 1,
1.967827, -0.187467, 1.051141, 1, 0, 0.1843137, 1,
1.971426, -0.3600927, 2.981228, 1, 0, 0.1803922, 1,
1.971452, 2.122253, 0.58246, 1, 0, 0.172549, 1,
1.972985, 0.2823516, 0.5785314, 1, 0, 0.1686275, 1,
1.977425, 0.71254, 0.1680668, 1, 0, 0.1607843, 1,
1.983804, 0.350493, -0.05398857, 1, 0, 0.1568628, 1,
2.012312, -0.3231884, 0.3086415, 1, 0, 0.1490196, 1,
2.017702, 1.437508, 0.09610218, 1, 0, 0.145098, 1,
2.023681, 0.04715731, 1.311422, 1, 0, 0.1372549, 1,
2.070792, -1.257295, 2.478571, 1, 0, 0.1333333, 1,
2.086316, 0.8433967, 2.294204, 1, 0, 0.1254902, 1,
2.17235, 0.0390592, 1.83768, 1, 0, 0.1215686, 1,
2.202365, 0.239015, 2.306156, 1, 0, 0.1137255, 1,
2.225969, 0.150645, 0.647516, 1, 0, 0.1098039, 1,
2.242797, -0.9609389, 3.2347, 1, 0, 0.1019608, 1,
2.273448, 1.052396, 1.181367, 1, 0, 0.09411765, 1,
2.280385, 0.7642233, 0.3393325, 1, 0, 0.09019608, 1,
2.326755, -0.7319356, 2.995207, 1, 0, 0.08235294, 1,
2.342983, -1.55633, 2.476637, 1, 0, 0.07843138, 1,
2.353498, 0.3841749, 0.09871726, 1, 0, 0.07058824, 1,
2.390726, -2.781821, 1.939088, 1, 0, 0.06666667, 1,
2.399537, 0.460335, 0.3843253, 1, 0, 0.05882353, 1,
2.415032, -0.8802132, 1.442511, 1, 0, 0.05490196, 1,
2.545445, 1.846333, -0.1317039, 1, 0, 0.04705882, 1,
2.577303, 1.856623, 1.528032, 1, 0, 0.04313726, 1,
2.619846, 0.7250493, 2.764716, 1, 0, 0.03529412, 1,
2.679161, 0.1408546, 1.322591, 1, 0, 0.03137255, 1,
2.701926, 0.4520381, 1.730195, 1, 0, 0.02352941, 1,
2.961742, -0.2207153, 0.2470852, 1, 0, 0.01960784, 1,
2.977675, -0.9118784, 1.261581, 1, 0, 0.01176471, 1,
3.194158, -1.603695, 3.726661, 1, 0, 0.007843138, 1
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
-0.07377708, -4.657882, -8.275624, 0, -0.5, 0.5, 0.5,
-0.07377708, -4.657882, -8.275624, 1, -0.5, 0.5, 0.5,
-0.07377708, -4.657882, -8.275624, 1, 1.5, 0.5, 0.5,
-0.07377708, -4.657882, -8.275624, 0, 1.5, 0.5, 0.5
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
-4.449542, -0.09845817, -8.275624, 0, -0.5, 0.5, 0.5,
-4.449542, -0.09845817, -8.275624, 1, -0.5, 0.5, 0.5,
-4.449542, -0.09845817, -8.275624, 1, 1.5, 0.5, 0.5,
-4.449542, -0.09845817, -8.275624, 0, 1.5, 0.5, 0.5
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
-4.449542, -4.657882, -0.472477, 0, -0.5, 0.5, 0.5,
-4.449542, -4.657882, -0.472477, 1, -0.5, 0.5, 0.5,
-4.449542, -4.657882, -0.472477, 1, 1.5, 0.5, 0.5,
-4.449542, -4.657882, -0.472477, 0, 1.5, 0.5, 0.5
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
-3, -3.605707, -6.474898,
3, -3.605707, -6.474898,
-3, -3.605707, -6.474898,
-3, -3.78107, -6.775019,
-2, -3.605707, -6.474898,
-2, -3.78107, -6.775019,
-1, -3.605707, -6.474898,
-1, -3.78107, -6.775019,
0, -3.605707, -6.474898,
0, -3.78107, -6.775019,
1, -3.605707, -6.474898,
1, -3.78107, -6.775019,
2, -3.605707, -6.474898,
2, -3.78107, -6.775019,
3, -3.605707, -6.474898,
3, -3.78107, -6.775019
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
-3, -4.131795, -7.375261, 0, -0.5, 0.5, 0.5,
-3, -4.131795, -7.375261, 1, -0.5, 0.5, 0.5,
-3, -4.131795, -7.375261, 1, 1.5, 0.5, 0.5,
-3, -4.131795, -7.375261, 0, 1.5, 0.5, 0.5,
-2, -4.131795, -7.375261, 0, -0.5, 0.5, 0.5,
-2, -4.131795, -7.375261, 1, -0.5, 0.5, 0.5,
-2, -4.131795, -7.375261, 1, 1.5, 0.5, 0.5,
-2, -4.131795, -7.375261, 0, 1.5, 0.5, 0.5,
-1, -4.131795, -7.375261, 0, -0.5, 0.5, 0.5,
-1, -4.131795, -7.375261, 1, -0.5, 0.5, 0.5,
-1, -4.131795, -7.375261, 1, 1.5, 0.5, 0.5,
-1, -4.131795, -7.375261, 0, 1.5, 0.5, 0.5,
0, -4.131795, -7.375261, 0, -0.5, 0.5, 0.5,
0, -4.131795, -7.375261, 1, -0.5, 0.5, 0.5,
0, -4.131795, -7.375261, 1, 1.5, 0.5, 0.5,
0, -4.131795, -7.375261, 0, 1.5, 0.5, 0.5,
1, -4.131795, -7.375261, 0, -0.5, 0.5, 0.5,
1, -4.131795, -7.375261, 1, -0.5, 0.5, 0.5,
1, -4.131795, -7.375261, 1, 1.5, 0.5, 0.5,
1, -4.131795, -7.375261, 0, 1.5, 0.5, 0.5,
2, -4.131795, -7.375261, 0, -0.5, 0.5, 0.5,
2, -4.131795, -7.375261, 1, -0.5, 0.5, 0.5,
2, -4.131795, -7.375261, 1, 1.5, 0.5, 0.5,
2, -4.131795, -7.375261, 0, 1.5, 0.5, 0.5,
3, -4.131795, -7.375261, 0, -0.5, 0.5, 0.5,
3, -4.131795, -7.375261, 1, -0.5, 0.5, 0.5,
3, -4.131795, -7.375261, 1, 1.5, 0.5, 0.5,
3, -4.131795, -7.375261, 0, 1.5, 0.5, 0.5
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
-3.43975, -3, -6.474898,
-3.43975, 3, -6.474898,
-3.43975, -3, -6.474898,
-3.608049, -3, -6.775019,
-3.43975, -2, -6.474898,
-3.608049, -2, -6.775019,
-3.43975, -1, -6.474898,
-3.608049, -1, -6.775019,
-3.43975, 0, -6.474898,
-3.608049, 0, -6.775019,
-3.43975, 1, -6.474898,
-3.608049, 1, -6.775019,
-3.43975, 2, -6.474898,
-3.608049, 2, -6.775019,
-3.43975, 3, -6.474898,
-3.608049, 3, -6.775019
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
-3.944646, -3, -7.375261, 0, -0.5, 0.5, 0.5,
-3.944646, -3, -7.375261, 1, -0.5, 0.5, 0.5,
-3.944646, -3, -7.375261, 1, 1.5, 0.5, 0.5,
-3.944646, -3, -7.375261, 0, 1.5, 0.5, 0.5,
-3.944646, -2, -7.375261, 0, -0.5, 0.5, 0.5,
-3.944646, -2, -7.375261, 1, -0.5, 0.5, 0.5,
-3.944646, -2, -7.375261, 1, 1.5, 0.5, 0.5,
-3.944646, -2, -7.375261, 0, 1.5, 0.5, 0.5,
-3.944646, -1, -7.375261, 0, -0.5, 0.5, 0.5,
-3.944646, -1, -7.375261, 1, -0.5, 0.5, 0.5,
-3.944646, -1, -7.375261, 1, 1.5, 0.5, 0.5,
-3.944646, -1, -7.375261, 0, 1.5, 0.5, 0.5,
-3.944646, 0, -7.375261, 0, -0.5, 0.5, 0.5,
-3.944646, 0, -7.375261, 1, -0.5, 0.5, 0.5,
-3.944646, 0, -7.375261, 1, 1.5, 0.5, 0.5,
-3.944646, 0, -7.375261, 0, 1.5, 0.5, 0.5,
-3.944646, 1, -7.375261, 0, -0.5, 0.5, 0.5,
-3.944646, 1, -7.375261, 1, -0.5, 0.5, 0.5,
-3.944646, 1, -7.375261, 1, 1.5, 0.5, 0.5,
-3.944646, 1, -7.375261, 0, 1.5, 0.5, 0.5,
-3.944646, 2, -7.375261, 0, -0.5, 0.5, 0.5,
-3.944646, 2, -7.375261, 1, -0.5, 0.5, 0.5,
-3.944646, 2, -7.375261, 1, 1.5, 0.5, 0.5,
-3.944646, 2, -7.375261, 0, 1.5, 0.5, 0.5,
-3.944646, 3, -7.375261, 0, -0.5, 0.5, 0.5,
-3.944646, 3, -7.375261, 1, -0.5, 0.5, 0.5,
-3.944646, 3, -7.375261, 1, 1.5, 0.5, 0.5,
-3.944646, 3, -7.375261, 0, 1.5, 0.5, 0.5
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
-3.43975, -3.605707, -6,
-3.43975, -3.605707, 4,
-3.43975, -3.605707, -6,
-3.608049, -3.78107, -6,
-3.43975, -3.605707, -4,
-3.608049, -3.78107, -4,
-3.43975, -3.605707, -2,
-3.608049, -3.78107, -2,
-3.43975, -3.605707, 0,
-3.608049, -3.78107, 0,
-3.43975, -3.605707, 2,
-3.608049, -3.78107, 2,
-3.43975, -3.605707, 4,
-3.608049, -3.78107, 4
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
"-6",
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
-3.944646, -4.131795, -6, 0, -0.5, 0.5, 0.5,
-3.944646, -4.131795, -6, 1, -0.5, 0.5, 0.5,
-3.944646, -4.131795, -6, 1, 1.5, 0.5, 0.5,
-3.944646, -4.131795, -6, 0, 1.5, 0.5, 0.5,
-3.944646, -4.131795, -4, 0, -0.5, 0.5, 0.5,
-3.944646, -4.131795, -4, 1, -0.5, 0.5, 0.5,
-3.944646, -4.131795, -4, 1, 1.5, 0.5, 0.5,
-3.944646, -4.131795, -4, 0, 1.5, 0.5, 0.5,
-3.944646, -4.131795, -2, 0, -0.5, 0.5, 0.5,
-3.944646, -4.131795, -2, 1, -0.5, 0.5, 0.5,
-3.944646, -4.131795, -2, 1, 1.5, 0.5, 0.5,
-3.944646, -4.131795, -2, 0, 1.5, 0.5, 0.5,
-3.944646, -4.131795, 0, 0, -0.5, 0.5, 0.5,
-3.944646, -4.131795, 0, 1, -0.5, 0.5, 0.5,
-3.944646, -4.131795, 0, 1, 1.5, 0.5, 0.5,
-3.944646, -4.131795, 0, 0, 1.5, 0.5, 0.5,
-3.944646, -4.131795, 2, 0, -0.5, 0.5, 0.5,
-3.944646, -4.131795, 2, 1, -0.5, 0.5, 0.5,
-3.944646, -4.131795, 2, 1, 1.5, 0.5, 0.5,
-3.944646, -4.131795, 2, 0, 1.5, 0.5, 0.5,
-3.944646, -4.131795, 4, 0, -0.5, 0.5, 0.5,
-3.944646, -4.131795, 4, 1, -0.5, 0.5, 0.5,
-3.944646, -4.131795, 4, 1, 1.5, 0.5, 0.5,
-3.944646, -4.131795, 4, 0, 1.5, 0.5, 0.5
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
-3.43975, -3.605707, -6.474898,
-3.43975, 3.408791, -6.474898,
-3.43975, -3.605707, 5.529944,
-3.43975, 3.408791, 5.529944,
-3.43975, -3.605707, -6.474898,
-3.43975, -3.605707, 5.529944,
-3.43975, 3.408791, -6.474898,
-3.43975, 3.408791, 5.529944,
-3.43975, -3.605707, -6.474898,
3.292196, -3.605707, -6.474898,
-3.43975, -3.605707, 5.529944,
3.292196, -3.605707, 5.529944,
-3.43975, 3.408791, -6.474898,
3.292196, 3.408791, -6.474898,
-3.43975, 3.408791, 5.529944,
3.292196, 3.408791, 5.529944,
3.292196, -3.605707, -6.474898,
3.292196, 3.408791, -6.474898,
3.292196, -3.605707, 5.529944,
3.292196, 3.408791, 5.529944,
3.292196, -3.605707, -6.474898,
3.292196, -3.605707, 5.529944,
3.292196, 3.408791, -6.474898,
3.292196, 3.408791, 5.529944
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
var radius = 8.248894;
var distance = 36.70026;
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
mvMatrix.translate( 0.07377708, 0.09845817, 0.472477 );
mvMatrix.scale( 1.324857, 1.27149, 0.7429391 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.70026);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
fenfuram<-read.table("fenfuram.xyz")
```

```
## Error in read.table("fenfuram.xyz"): no lines available in input
```

```r
x<-fenfuram$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
```

```r
y<-fenfuram$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
```

```r
z<-fenfuram$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
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
-3.341712, -0.8009619, -1.798313, 0, 0, 1, 1, 1,
-3.284124, 0.8820249, -0.9318956, 1, 0, 0, 1, 1,
-3.159874, -1.779975, -1.33593, 1, 0, 0, 1, 1,
-2.933665, 0.2203532, -2.130338, 1, 0, 0, 1, 1,
-2.739198, 1.547447, -0.3370304, 1, 0, 0, 1, 1,
-2.606312, -0.3485594, -1.926517, 1, 0, 0, 1, 1,
-2.502285, -0.5363939, -1.12312, 0, 0, 0, 1, 1,
-2.465854, 0.3021903, -2.080372, 0, 0, 0, 1, 1,
-2.444809, -0.2053193, 0.8635065, 0, 0, 0, 1, 1,
-2.339637, 1.120737, -0.07369232, 0, 0, 0, 1, 1,
-2.307912, -0.764187, -1.0606, 0, 0, 0, 1, 1,
-2.307235, 1.980721, -0.908128, 0, 0, 0, 1, 1,
-2.295882, 0.2029288, -2.381001, 0, 0, 0, 1, 1,
-2.29253, 0.3175858, -0.7781709, 1, 1, 1, 1, 1,
-2.282694, 0.5990252, -1.617014, 1, 1, 1, 1, 1,
-2.279251, 0.984665, -2.671649, 1, 1, 1, 1, 1,
-2.279178, -0.3923278, -1.59832, 1, 1, 1, 1, 1,
-2.256827, -1.751537, -1.017748, 1, 1, 1, 1, 1,
-2.243344, 0.3620482, -2.194435, 1, 1, 1, 1, 1,
-2.243204, -0.526597, -1.571645, 1, 1, 1, 1, 1,
-2.174454, -0.8264256, -1.907578, 1, 1, 1, 1, 1,
-2.163801, -0.795222, 0.6354206, 1, 1, 1, 1, 1,
-2.135415, 0.9700961, -0.8395765, 1, 1, 1, 1, 1,
-2.1211, 1.590016, 0.8479303, 1, 1, 1, 1, 1,
-2.100302, 1.753298, 0.1483608, 1, 1, 1, 1, 1,
-2.093763, -1.683855, -1.269766, 1, 1, 1, 1, 1,
-2.073756, -0.09486304, -2.422866, 1, 1, 1, 1, 1,
-2.022495, -0.08338849, -2.787278, 1, 1, 1, 1, 1,
-2.017646, 0.9772741, -1.930474, 0, 0, 1, 1, 1,
-1.944112, 1.564028, -1.983405, 1, 0, 0, 1, 1,
-1.932796, 1.394033, -0.8222184, 1, 0, 0, 1, 1,
-1.930143, 0.8474334, 0.02236789, 1, 0, 0, 1, 1,
-1.914916, 0.6264159, -2.326221, 1, 0, 0, 1, 1,
-1.892631, -0.7546738, -2.164886, 1, 0, 0, 1, 1,
-1.87422, -1.199807, -2.139147, 0, 0, 0, 1, 1,
-1.857477, -0.820908, -2.354795, 0, 0, 0, 1, 1,
-1.834096, -0.3340603, -2.081765, 0, 0, 0, 1, 1,
-1.830342, 0.2622269, -0.628611, 0, 0, 0, 1, 1,
-1.769337, -2.663494, -3.927648, 0, 0, 0, 1, 1,
-1.768162, 0.9955548, -1.381038, 0, 0, 0, 1, 1,
-1.737513, 0.6575378, -2.216966, 0, 0, 0, 1, 1,
-1.736671, -0.4964078, -1.523246, 1, 1, 1, 1, 1,
-1.724933, 1.197375, -0.1390752, 1, 1, 1, 1, 1,
-1.714663, 1.362483, -1.331447, 1, 1, 1, 1, 1,
-1.685002, 0.4357302, -2.777873, 1, 1, 1, 1, 1,
-1.682858, 1.379886, -1.304718, 1, 1, 1, 1, 1,
-1.682682, 1.356737, -2.124192, 1, 1, 1, 1, 1,
-1.670616, 0.8629395, 0.02643947, 1, 1, 1, 1, 1,
-1.648152, -0.7709948, -3.049661, 1, 1, 1, 1, 1,
-1.646206, -0.2767337, -2.556289, 1, 1, 1, 1, 1,
-1.640756, 1.031576, -1.119747, 1, 1, 1, 1, 1,
-1.626172, -1.500222, -3.462364, 1, 1, 1, 1, 1,
-1.625454, -0.279882, -2.252416, 1, 1, 1, 1, 1,
-1.621757, 1.954085, 1.233462, 1, 1, 1, 1, 1,
-1.61245, 0.07301085, -2.239376, 1, 1, 1, 1, 1,
-1.6103, -1.165707, -1.77253, 1, 1, 1, 1, 1,
-1.6097, -0.2801709, -1.387264, 0, 0, 1, 1, 1,
-1.607288, -0.3598017, -0.2737149, 1, 0, 0, 1, 1,
-1.601737, 0.8868543, -2.953547, 1, 0, 0, 1, 1,
-1.591469, -0.3586518, -1.140202, 1, 0, 0, 1, 1,
-1.553173, 0.6507242, -2.11124, 1, 0, 0, 1, 1,
-1.542359, 0.4412341, -0.5732044, 1, 0, 0, 1, 1,
-1.540591, 0.8308487, 0.4340095, 0, 0, 0, 1, 1,
-1.530269, -0.7613556, -3.228282, 0, 0, 0, 1, 1,
-1.51847, -1.300584, -2.588003, 0, 0, 0, 1, 1,
-1.5127, 0.6526844, -1.085664, 0, 0, 0, 1, 1,
-1.506171, -1.719642, -3.302223, 0, 0, 0, 1, 1,
-1.505361, 0.4125451, -2.93698, 0, 0, 0, 1, 1,
-1.497351, 0.7335183, -0.1441043, 0, 0, 0, 1, 1,
-1.493198, -0.04674001, -0.7026536, 1, 1, 1, 1, 1,
-1.492902, -0.3837414, -1.608067, 1, 1, 1, 1, 1,
-1.491662, 0.303976, -0.761715, 1, 1, 1, 1, 1,
-1.470405, 0.6567051, -0.3965839, 1, 1, 1, 1, 1,
-1.470099, -0.923995, -2.598643, 1, 1, 1, 1, 1,
-1.455356, -0.09511285, -0.2833753, 1, 1, 1, 1, 1,
-1.437604, 0.9508007, -2.554214, 1, 1, 1, 1, 1,
-1.435812, -1.040135, -3.002314, 1, 1, 1, 1, 1,
-1.419884, 0.4519612, -3.342933, 1, 1, 1, 1, 1,
-1.400201, -3.398245, -3.55071, 1, 1, 1, 1, 1,
-1.391384, 1.389574, -0.201159, 1, 1, 1, 1, 1,
-1.39008, 0.6805645, -1.898473, 1, 1, 1, 1, 1,
-1.381512, -0.5428375, -0.2166658, 1, 1, 1, 1, 1,
-1.377125, -1.256549, -2.394553, 1, 1, 1, 1, 1,
-1.368493, 2.430712, 1.440176, 1, 1, 1, 1, 1,
-1.345834, 0.1570533, -1.999625, 0, 0, 1, 1, 1,
-1.341927, 0.005530638, -1.522447, 1, 0, 0, 1, 1,
-1.3408, 1.374633, -2.503685, 1, 0, 0, 1, 1,
-1.328564, 0.5108421, -2.394516, 1, 0, 0, 1, 1,
-1.326642, 0.3198071, -1.794117, 1, 0, 0, 1, 1,
-1.325452, -1.341932, -1.927263, 1, 0, 0, 1, 1,
-1.324555, 1.673334, -2.001981, 0, 0, 0, 1, 1,
-1.324376, 1.839626, -1.458954, 0, 0, 0, 1, 1,
-1.31977, 0.4282225, -1.761937, 0, 0, 0, 1, 1,
-1.314188, 1.323544, -0.1351168, 0, 0, 0, 1, 1,
-1.306168, -0.4111823, -0.03206148, 0, 0, 0, 1, 1,
-1.301098, 0.7494799, -1.7367, 0, 0, 0, 1, 1,
-1.300731, 1.005146, -0.9647816, 0, 0, 0, 1, 1,
-1.293662, -0.2548058, -2.327509, 1, 1, 1, 1, 1,
-1.291187, -1.844862, -4.318498, 1, 1, 1, 1, 1,
-1.287501, -0.4770276, -2.296432, 1, 1, 1, 1, 1,
-1.26929, 1.169513, -0.6263408, 1, 1, 1, 1, 1,
-1.26764, 1.217391, -1.836491, 1, 1, 1, 1, 1,
-1.265585, 1.47043, -0.001751464, 1, 1, 1, 1, 1,
-1.256628, 2.071131, -1.750846, 1, 1, 1, 1, 1,
-1.237928, 0.8533436, 0.00974552, 1, 1, 1, 1, 1,
-1.213422, 0.0228701, -0.460663, 1, 1, 1, 1, 1,
-1.213411, 1.220862, -2.667364, 1, 1, 1, 1, 1,
-1.212882, -0.576921, -0.6579391, 1, 1, 1, 1, 1,
-1.211694, -0.7398944, -1.11013, 1, 1, 1, 1, 1,
-1.19779, 2.382591, -0.3577313, 1, 1, 1, 1, 1,
-1.193881, -0.1748087, -3.079891, 1, 1, 1, 1, 1,
-1.188362, -1.41351, -1.298802, 1, 1, 1, 1, 1,
-1.17311, 0.4130081, -0.1291441, 0, 0, 1, 1, 1,
-1.172475, 0.1044786, -2.288125, 1, 0, 0, 1, 1,
-1.164867, -1.992445, -1.471622, 1, 0, 0, 1, 1,
-1.164218, 0.1617297, -2.364843, 1, 0, 0, 1, 1,
-1.164155, 1.26067, -0.6680728, 1, 0, 0, 1, 1,
-1.162409, 2.112654, -1.349671, 1, 0, 0, 1, 1,
-1.161876, 0.7272387, 0.8727621, 0, 0, 0, 1, 1,
-1.159405, 0.08550648, -0.9000573, 0, 0, 0, 1, 1,
-1.141013, 0.5393496, -1.926246, 0, 0, 0, 1, 1,
-1.137593, 0.9089462, 0.1213712, 0, 0, 0, 1, 1,
-1.123983, -0.7742267, -1.316761, 0, 0, 0, 1, 1,
-1.104504, -2.052571, -2.753284, 0, 0, 0, 1, 1,
-1.103258, -1.368714, -2.020581, 0, 0, 0, 1, 1,
-1.101731, -0.270074, -2.650363, 1, 1, 1, 1, 1,
-1.101307, -2.483491, -1.806562, 1, 1, 1, 1, 1,
-1.092835, -0.9350189, -2.522902, 1, 1, 1, 1, 1,
-1.09142, 0.1413359, -0.1630864, 1, 1, 1, 1, 1,
-1.083415, -1.136296, -0.2447922, 1, 1, 1, 1, 1,
-1.079551, 0.1272037, -1.893883, 1, 1, 1, 1, 1,
-1.070758, 0.5568478, -2.398996, 1, 1, 1, 1, 1,
-1.06305, 0.8931366, 0.01681852, 1, 1, 1, 1, 1,
-1.061884, -1.777282, -1.718968, 1, 1, 1, 1, 1,
-1.061189, 0.7450694, -0.9050591, 1, 1, 1, 1, 1,
-1.061137, -0.5212365, -0.7730114, 1, 1, 1, 1, 1,
-1.060748, 0.2056051, 0.4802494, 1, 1, 1, 1, 1,
-1.055808, 0.9833605, -0.49807, 1, 1, 1, 1, 1,
-1.05558, 0.7490174, -0.6783078, 1, 1, 1, 1, 1,
-1.055078, -3.503555, -3.355704, 1, 1, 1, 1, 1,
-1.05456, -1.239261, -2.644749, 0, 0, 1, 1, 1,
-1.044202, 1.866685, 0.5907508, 1, 0, 0, 1, 1,
-1.037702, -0.5888466, -2.207907, 1, 0, 0, 1, 1,
-1.028586, 0.09326233, -0.8331822, 1, 0, 0, 1, 1,
-1.022475, -0.9229834, -1.981079, 1, 0, 0, 1, 1,
-1.019977, 1.309809, -1.09261, 1, 0, 0, 1, 1,
-1.018463, -0.6116599, -2.364378, 0, 0, 0, 1, 1,
-1.013331, -0.7099393, -1.973518, 0, 0, 0, 1, 1,
-1.012282, 1.015863, -0.4415542, 0, 0, 0, 1, 1,
-0.9994022, 0.3222502, -0.8026811, 0, 0, 0, 1, 1,
-0.9893475, -0.3579062, -1.248058, 0, 0, 0, 1, 1,
-0.9795891, -0.6486189, -2.428033, 0, 0, 0, 1, 1,
-0.9787641, -0.2690592, -2.457901, 0, 0, 0, 1, 1,
-0.9740011, -0.5702461, -2.731699, 1, 1, 1, 1, 1,
-0.9711382, -0.8753482, -1.779135, 1, 1, 1, 1, 1,
-0.9674322, 1.024974, -1.415159, 1, 1, 1, 1, 1,
-0.964637, 0.4456224, -2.529987, 1, 1, 1, 1, 1,
-0.956225, 0.001314895, -0.4911374, 1, 1, 1, 1, 1,
-0.9510313, 1.654323, -0.1987097, 1, 1, 1, 1, 1,
-0.9456219, 0.3937029, -0.6121057, 1, 1, 1, 1, 1,
-0.9432865, 0.6678272, 0.7488869, 1, 1, 1, 1, 1,
-0.9369121, -0.7360471, -1.198738, 1, 1, 1, 1, 1,
-0.9342095, 1.004038, 0.4492506, 1, 1, 1, 1, 1,
-0.9322684, -0.0879714, -2.483539, 1, 1, 1, 1, 1,
-0.928106, -1.016338, -2.797557, 1, 1, 1, 1, 1,
-0.9191097, 0.1926955, -0.972778, 1, 1, 1, 1, 1,
-0.9181399, 0.3305521, -2.296471, 1, 1, 1, 1, 1,
-0.9165657, 1.426681, -0.9883238, 1, 1, 1, 1, 1,
-0.9141787, 0.02087276, -0.6867598, 0, 0, 1, 1, 1,
-0.9097306, -0.0566604, -0.9155899, 1, 0, 0, 1, 1,
-0.9019284, -0.6793886, -1.233461, 1, 0, 0, 1, 1,
-0.8989644, 0.4012463, -1.82408, 1, 0, 0, 1, 1,
-0.8960093, -0.1699239, -3.821548, 1, 0, 0, 1, 1,
-0.8950275, 0.1987481, -2.432753, 1, 0, 0, 1, 1,
-0.8885588, -0.9816338, -2.79652, 0, 0, 0, 1, 1,
-0.8853015, 1.52328, -0.4966791, 0, 0, 0, 1, 1,
-0.8841156, 0.9219123, -1.527068, 0, 0, 0, 1, 1,
-0.8798475, 0.3690228, -1.328777, 0, 0, 0, 1, 1,
-0.8781586, 0.1146131, -0.4029661, 0, 0, 0, 1, 1,
-0.8777252, -1.113726, -1.73507, 0, 0, 0, 1, 1,
-0.8693631, 0.7271935, -2.289036, 0, 0, 0, 1, 1,
-0.8683252, -0.2597517, -1.825002, 1, 1, 1, 1, 1,
-0.8662136, -0.166615, -1.026047, 1, 1, 1, 1, 1,
-0.8578654, 1.511806, 1.735638, 1, 1, 1, 1, 1,
-0.8463721, 1.801061, -0.6578614, 1, 1, 1, 1, 1,
-0.8385606, -1.00228, -2.160656, 1, 1, 1, 1, 1,
-0.8355984, 0.03800216, -2.043129, 1, 1, 1, 1, 1,
-0.8343789, 0.3493266, -2.313427, 1, 1, 1, 1, 1,
-0.8219691, 1.830203, -1.528145, 1, 1, 1, 1, 1,
-0.8185716, 0.5744479, -0.9963573, 1, 1, 1, 1, 1,
-0.817995, -0.6385732, -2.698095, 1, 1, 1, 1, 1,
-0.8163995, -0.6448392, -2.560025, 1, 1, 1, 1, 1,
-0.8138438, 0.5236148, -2.666048, 1, 1, 1, 1, 1,
-0.8136106, 0.2125406, -0.6215328, 1, 1, 1, 1, 1,
-0.8132685, -0.5035194, -2.61503, 1, 1, 1, 1, 1,
-0.8113801, -0.4387064, -3.447202, 1, 1, 1, 1, 1,
-0.807374, 0.5481611, -1.354983, 0, 0, 1, 1, 1,
-0.8072663, -1.04758, -2.931544, 1, 0, 0, 1, 1,
-0.80242, 1.159036, -0.2035346, 1, 0, 0, 1, 1,
-0.7994071, -1.395572, -2.539656, 1, 0, 0, 1, 1,
-0.7969108, 0.7465883, 0.0137382, 1, 0, 0, 1, 1,
-0.7911506, 1.411464, -0.511121, 1, 0, 0, 1, 1,
-0.7893844, -0.02271583, -2.217594, 0, 0, 0, 1, 1,
-0.7724292, 0.4499851, -3.086137, 0, 0, 0, 1, 1,
-0.761072, -0.6213377, -2.198951, 0, 0, 0, 1, 1,
-0.7599393, 0.3209195, -0.8129551, 0, 0, 0, 1, 1,
-0.7545072, -2.242359, -3.218188, 0, 0, 0, 1, 1,
-0.7503725, -0.6392621, -0.9263934, 0, 0, 0, 1, 1,
-0.7384622, -0.308182, -0.7528746, 0, 0, 0, 1, 1,
-0.736368, -2.819616, -2.313414, 1, 1, 1, 1, 1,
-0.7334176, 0.02941957, -2.513071, 1, 1, 1, 1, 1,
-0.725042, 1.51952, -2.765424, 1, 1, 1, 1, 1,
-0.7208346, 0.3847432, -0.475787, 1, 1, 1, 1, 1,
-0.7185127, 0.158758, -0.1778887, 1, 1, 1, 1, 1,
-0.7179499, 0.1241663, -1.475177, 1, 1, 1, 1, 1,
-0.7163833, -1.011777, -3.733907, 1, 1, 1, 1, 1,
-0.7110747, -0.3564399, -1.777734, 1, 1, 1, 1, 1,
-0.7108278, -0.8155403, -2.832093, 1, 1, 1, 1, 1,
-0.7081304, 0.02270973, -1.648886, 1, 1, 1, 1, 1,
-0.7035339, -0.8751423, -4.142147, 1, 1, 1, 1, 1,
-0.6955349, 0.829065, -0.4103185, 1, 1, 1, 1, 1,
-0.6915766, 1.149744, -0.5117816, 1, 1, 1, 1, 1,
-0.6896723, -0.7694076, -2.497454, 1, 1, 1, 1, 1,
-0.6895281, -1.645501, -3.278977, 1, 1, 1, 1, 1,
-0.6889457, 0.2647492, -0.1694049, 0, 0, 1, 1, 1,
-0.688792, 0.1099252, -1.616915, 1, 0, 0, 1, 1,
-0.6821225, 0.9154909, 1.081834, 1, 0, 0, 1, 1,
-0.6787916, -0.6469654, -3.467048, 1, 0, 0, 1, 1,
-0.6779388, 1.869538, -0.6737569, 1, 0, 0, 1, 1,
-0.6758512, -1.99868, -0.606195, 1, 0, 0, 1, 1,
-0.6754074, -0.6348148, -4.401575, 0, 0, 0, 1, 1,
-0.6734238, 0.6320051, -0.4491321, 0, 0, 0, 1, 1,
-0.6702555, -0.6703735, -1.788764, 0, 0, 0, 1, 1,
-0.6628256, -0.5263375, -3.368586, 0, 0, 0, 1, 1,
-0.6604496, 0.7275771, -1.302044, 0, 0, 0, 1, 1,
-0.6582718, 0.1244551, -1.260805, 0, 0, 0, 1, 1,
-0.651887, -0.5226546, -3.009065, 0, 0, 0, 1, 1,
-0.6477044, 0.1648087, -0.6997849, 1, 1, 1, 1, 1,
-0.6451619, 0.4746819, -1.587405, 1, 1, 1, 1, 1,
-0.6413597, 1.206524, 1.831905, 1, 1, 1, 1, 1,
-0.6387354, 0.9501873, -0.1274157, 1, 1, 1, 1, 1,
-0.6365398, 0.7405995, -0.6137022, 1, 1, 1, 1, 1,
-0.636429, 1.213852, -1.31041, 1, 1, 1, 1, 1,
-0.6317394, 0.3810265, -0.3398363, 1, 1, 1, 1, 1,
-0.627999, 0.8461286, -0.9848971, 1, 1, 1, 1, 1,
-0.6246113, -1.396371, -2.99674, 1, 1, 1, 1, 1,
-0.6239061, 0.7056116, -0.150913, 1, 1, 1, 1, 1,
-0.6149904, -0.2550569, -2.713509, 1, 1, 1, 1, 1,
-0.6117474, -1.095827, -2.766277, 1, 1, 1, 1, 1,
-0.6097723, 0.6675207, 0.4024107, 1, 1, 1, 1, 1,
-0.6014532, 0.7186337, 0.4552571, 1, 1, 1, 1, 1,
-0.6008081, -1.900519, -2.756446, 1, 1, 1, 1, 1,
-0.600215, 0.2084913, -0.8748202, 0, 0, 1, 1, 1,
-0.5996187, 0.14733, -0.2648191, 1, 0, 0, 1, 1,
-0.5991768, -1.059859, 1.135484, 1, 0, 0, 1, 1,
-0.5948113, 1.857003, -0.6373777, 1, 0, 0, 1, 1,
-0.5797678, -1.13074, -3.246423, 1, 0, 0, 1, 1,
-0.5782562, 1.389702, -0.1601905, 1, 0, 0, 1, 1,
-0.5757526, 0.5843791, -0.4782763, 0, 0, 0, 1, 1,
-0.5713167, -0.8932208, -1.626356, 0, 0, 0, 1, 1,
-0.5710316, -2.291085, -3.411902, 0, 0, 0, 1, 1,
-0.5697388, 1.928387, -1.606619, 0, 0, 0, 1, 1,
-0.5657883, 1.538152, -0.1453591, 0, 0, 0, 1, 1,
-0.5632809, 1.498475, 0.09657993, 0, 0, 0, 1, 1,
-0.560906, -0.4251868, -3.234924, 0, 0, 0, 1, 1,
-0.5599496, -2.130073, -4.184643, 1, 1, 1, 1, 1,
-0.5576751, -0.08518068, -3.180828, 1, 1, 1, 1, 1,
-0.5540512, 0.6148921, -1.029762, 1, 1, 1, 1, 1,
-0.5508882, -0.342259, -0.1795181, 1, 1, 1, 1, 1,
-0.5496275, 0.642069, -3.256029, 1, 1, 1, 1, 1,
-0.545139, -0.3721412, -2.621449, 1, 1, 1, 1, 1,
-0.5445679, 0.05215805, -3.148814, 1, 1, 1, 1, 1,
-0.5439383, -0.9326989, -2.245696, 1, 1, 1, 1, 1,
-0.5432003, -0.2542126, -0.7662072, 1, 1, 1, 1, 1,
-0.5425352, -0.3045554, -2.38091, 1, 1, 1, 1, 1,
-0.5333008, 0.7179773, 0.01976831, 1, 1, 1, 1, 1,
-0.5279095, 0.2820477, -2.654125, 1, 1, 1, 1, 1,
-0.5275154, -0.9239404, -0.7695668, 1, 1, 1, 1, 1,
-0.5271935, -0.9143995, -1.035126, 1, 1, 1, 1, 1,
-0.5259351, -0.6995827, -1.342285, 1, 1, 1, 1, 1,
-0.5210775, -0.2912199, -1.871771, 0, 0, 1, 1, 1,
-0.5194339, 0.309098, -0.7725284, 1, 0, 0, 1, 1,
-0.5119125, 0.3702067, -1.075181, 1, 0, 0, 1, 1,
-0.5104026, -0.7547892, -2.369163, 1, 0, 0, 1, 1,
-0.5081689, -0.03197541, -1.783594, 1, 0, 0, 1, 1,
-0.4911685, 0.3588201, 0.2303656, 1, 0, 0, 1, 1,
-0.4856585, 1.675165, 0.8086554, 0, 0, 0, 1, 1,
-0.4842862, -0.1653286, -3.138858, 0, 0, 0, 1, 1,
-0.4817119, 0.1444514, -1.542731, 0, 0, 0, 1, 1,
-0.4789073, 0.08391867, -0.5625001, 0, 0, 0, 1, 1,
-0.4758024, 0.1351868, -1.839571, 0, 0, 0, 1, 1,
-0.4753908, 0.8418493, 0.0324103, 0, 0, 0, 1, 1,
-0.4747321, 0.6846015, -2.068533, 0, 0, 0, 1, 1,
-0.4736079, -0.7157649, -3.691251, 1, 1, 1, 1, 1,
-0.4726308, 0.4226342, -1.777226, 1, 1, 1, 1, 1,
-0.4702022, -0.5534506, -2.709153, 1, 1, 1, 1, 1,
-0.4664388, -0.8248027, -3.911056, 1, 1, 1, 1, 1,
-0.4649626, -0.3295572, -2.222551, 1, 1, 1, 1, 1,
-0.4623585, -0.5444534, -2.028152, 1, 1, 1, 1, 1,
-0.4601967, -0.3710562, -0.8363127, 1, 1, 1, 1, 1,
-0.4479807, -0.5380604, -2.376498, 1, 1, 1, 1, 1,
-0.4473591, -0.9685847, -4.649421, 1, 1, 1, 1, 1,
-0.4447752, -0.729418, -3.826817, 1, 1, 1, 1, 1,
-0.4441514, 1.019496, -1.345443, 1, 1, 1, 1, 1,
-0.4431114, -0.08783904, -0.6085816, 1, 1, 1, 1, 1,
-0.4430959, -0.728568, -5.245275, 1, 1, 1, 1, 1,
-0.4402896, 1.025175, -0.8440645, 1, 1, 1, 1, 1,
-0.439741, -1.209728, -1.829396, 1, 1, 1, 1, 1,
-0.4355019, -0.1114315, -3.022447, 0, 0, 1, 1, 1,
-0.4337921, 1.273424, -1.260725, 1, 0, 0, 1, 1,
-0.4336452, -0.6758097, -2.077822, 1, 0, 0, 1, 1,
-0.4334367, -1.021823, -2.345426, 1, 0, 0, 1, 1,
-0.4325489, -0.3597794, -2.47284, 1, 0, 0, 1, 1,
-0.4318954, -0.9921076, -2.746877, 1, 0, 0, 1, 1,
-0.4295889, -0.2195943, -4.490932, 0, 0, 0, 1, 1,
-0.4269166, 0.2094924, -0.4662544, 0, 0, 0, 1, 1,
-0.4256651, -0.6553863, -1.530628, 0, 0, 0, 1, 1,
-0.4227191, -0.9761711, -1.961104, 0, 0, 0, 1, 1,
-0.4187488, -0.6532193, -2.87337, 0, 0, 0, 1, 1,
-0.4165658, -1.197783, -5.346113, 0, 0, 0, 1, 1,
-0.4061705, 0.4801936, -1.201914, 0, 0, 0, 1, 1,
-0.4037813, -1.077335, -2.736727, 1, 1, 1, 1, 1,
-0.4032062, -1.969379, -1.721931, 1, 1, 1, 1, 1,
-0.402755, 1.092671, -2.005847, 1, 1, 1, 1, 1,
-0.3970521, 0.007759867, -1.687284, 1, 1, 1, 1, 1,
-0.3950728, 0.7096045, 0.6731778, 1, 1, 1, 1, 1,
-0.3930361, -0.7705465, -1.919623, 1, 1, 1, 1, 1,
-0.3921597, -0.6273574, -4.68358, 1, 1, 1, 1, 1,
-0.3911903, 0.1870233, -1.087806, 1, 1, 1, 1, 1,
-0.389713, 1.710819, -0.1882263, 1, 1, 1, 1, 1,
-0.3897019, 0.5154585, -1.734018, 1, 1, 1, 1, 1,
-0.3886117, -0.4486822, -0.8992926, 1, 1, 1, 1, 1,
-0.3851641, 0.574186, -0.2402763, 1, 1, 1, 1, 1,
-0.384963, 1.506609, 0.5465727, 1, 1, 1, 1, 1,
-0.3819078, 0.4025059, -1.184575, 1, 1, 1, 1, 1,
-0.3816061, 1.480519, 0.04130106, 1, 1, 1, 1, 1,
-0.3799668, -0.1845695, -1.223279, 0, 0, 1, 1, 1,
-0.3791017, 0.7019043, -0.6567075, 1, 0, 0, 1, 1,
-0.3711339, -1.12497, -2.442182, 1, 0, 0, 1, 1,
-0.3694356, -0.0434976, -2.179543, 1, 0, 0, 1, 1,
-0.3680231, 0.1807154, -2.436758, 1, 0, 0, 1, 1,
-0.3635684, -0.1249028, -1.624753, 1, 0, 0, 1, 1,
-0.3629825, 1.814985, -0.858875, 0, 0, 0, 1, 1,
-0.3593052, -0.1692568, -1.97908, 0, 0, 0, 1, 1,
-0.3565999, 0.2569612, -0.005990557, 0, 0, 0, 1, 1,
-0.3556848, -0.5229722, -3.009278, 0, 0, 0, 1, 1,
-0.3419247, 0.257011, -0.3130318, 0, 0, 0, 1, 1,
-0.3394629, -0.4610625, -2.914521, 0, 0, 0, 1, 1,
-0.336795, 0.6521503, 0.578249, 0, 0, 0, 1, 1,
-0.334622, 1.257334, -0.5929579, 1, 1, 1, 1, 1,
-0.3290834, -1.721573, -3.787575, 1, 1, 1, 1, 1,
-0.3258457, -1.144977, -3.606244, 1, 1, 1, 1, 1,
-0.3252329, -1.783432, -3.003603, 1, 1, 1, 1, 1,
-0.3201135, 0.8970611, -0.01491578, 1, 1, 1, 1, 1,
-0.3193103, -1.059268, -3.792188, 1, 1, 1, 1, 1,
-0.316743, -1.184082, -1.383353, 1, 1, 1, 1, 1,
-0.3166931, 0.9196066, 0.4085348, 1, 1, 1, 1, 1,
-0.3135238, -0.3407806, -0.4384767, 1, 1, 1, 1, 1,
-0.3102239, -1.148099, -2.890695, 1, 1, 1, 1, 1,
-0.3066501, 0.5148789, -0.2639061, 1, 1, 1, 1, 1,
-0.3030532, -0.9573039, -3.250718, 1, 1, 1, 1, 1,
-0.2986527, -1.908254, -2.329993, 1, 1, 1, 1, 1,
-0.2984098, -1.003377, -2.691721, 1, 1, 1, 1, 1,
-0.2971624, -0.05076, -4.515916, 1, 1, 1, 1, 1,
-0.2950747, -0.1744065, -0.6851253, 0, 0, 1, 1, 1,
-0.2948023, -0.5124141, -1.182807, 1, 0, 0, 1, 1,
-0.2943603, -2.119199, -3.096061, 1, 0, 0, 1, 1,
-0.2889969, -1.254199, -2.681446, 1, 0, 0, 1, 1,
-0.2869739, 1.497242, -0.02905934, 1, 0, 0, 1, 1,
-0.2847786, -0.4073054, -1.230472, 1, 0, 0, 1, 1,
-0.283602, 0.8351495, 1.451409, 0, 0, 0, 1, 1,
-0.2825933, -0.03411037, -3.223645, 0, 0, 0, 1, 1,
-0.2778883, 0.5513487, -0.01390052, 0, 0, 0, 1, 1,
-0.2770994, -1.00391, -3.718168, 0, 0, 0, 1, 1,
-0.2758356, 0.2991689, -1.447465, 0, 0, 0, 1, 1,
-0.2754917, 0.2615379, -0.1064515, 0, 0, 0, 1, 1,
-0.2683749, -1.157443, -3.608327, 0, 0, 0, 1, 1,
-0.2635941, -1.463844, -3.040433, 1, 1, 1, 1, 1,
-0.2630765, 0.2735806, 0.6755238, 1, 1, 1, 1, 1,
-0.2626989, -0.4289271, -4.271351, 1, 1, 1, 1, 1,
-0.2601675, -0.09577147, -1.858019, 1, 1, 1, 1, 1,
-0.2565952, 1.954881, -1.06344, 1, 1, 1, 1, 1,
-0.2553434, 0.1626447, -2.368704, 1, 1, 1, 1, 1,
-0.2549405, 0.3951377, -2.106963, 1, 1, 1, 1, 1,
-0.2544925, -0.8076856, -2.403723, 1, 1, 1, 1, 1,
-0.2538484, -1.092751, -2.757229, 1, 1, 1, 1, 1,
-0.249909, 0.4553839, -0.1800182, 1, 1, 1, 1, 1,
-0.2495133, -0.6366733, -2.163314, 1, 1, 1, 1, 1,
-0.2488251, 1.519229, 0.9752174, 1, 1, 1, 1, 1,
-0.2478868, 0.6620418, 0.2148549, 1, 1, 1, 1, 1,
-0.2465716, 1.281767, 2.426053, 1, 1, 1, 1, 1,
-0.2458368, 0.8907759, 0.9420778, 1, 1, 1, 1, 1,
-0.238738, -0.430271, -2.243113, 0, 0, 1, 1, 1,
-0.2382757, -0.1688429, -2.339327, 1, 0, 0, 1, 1,
-0.231385, -0.07041784, -0.3828536, 1, 0, 0, 1, 1,
-0.2266023, 0.03499116, -1.657059, 1, 0, 0, 1, 1,
-0.2241447, 1.221231, -1.514879, 1, 0, 0, 1, 1,
-0.2206243, 0.2502987, -2.374845, 1, 0, 0, 1, 1,
-0.220004, 0.1893329, 0.09869154, 0, 0, 0, 1, 1,
-0.216097, -1.15269, -2.793597, 0, 0, 0, 1, 1,
-0.2151382, -0.198265, -1.796344, 0, 0, 0, 1, 1,
-0.21441, 1.340117, 1.097142, 0, 0, 0, 1, 1,
-0.2131307, -0.7255456, -2.816482, 0, 0, 0, 1, 1,
-0.2130462, 0.2127603, -1.505743, 0, 0, 0, 1, 1,
-0.2118728, 0.5202745, -0.5875585, 0, 0, 0, 1, 1,
-0.2110874, 0.6490436, -0.09839502, 1, 1, 1, 1, 1,
-0.2084811, -1.090589, -4.063304, 1, 1, 1, 1, 1,
-0.2076407, 2.661414, 0.247907, 1, 1, 1, 1, 1,
-0.2067166, -0.9585566, -4.11235, 1, 1, 1, 1, 1,
-0.2029087, 0.2866131, 0.3927108, 1, 1, 1, 1, 1,
-0.2014388, -0.2366625, -3.268358, 1, 1, 1, 1, 1,
-0.2003925, -1.300048, -3.574047, 1, 1, 1, 1, 1,
-0.1979676, -0.6141412, -2.223607, 1, 1, 1, 1, 1,
-0.187168, 0.5793646, -0.8093681, 1, 1, 1, 1, 1,
-0.1857359, -0.7978449, -2.221419, 1, 1, 1, 1, 1,
-0.1853292, 0.9834446, -0.4310629, 1, 1, 1, 1, 1,
-0.177696, -0.8841627, -6.30007, 1, 1, 1, 1, 1,
-0.1753332, -2.232164, -3.3952, 1, 1, 1, 1, 1,
-0.1750779, -0.1209578, -3.158815, 1, 1, 1, 1, 1,
-0.1749034, -0.6322116, -4.066804, 1, 1, 1, 1, 1,
-0.1734028, 0.4571952, 1.41498, 0, 0, 1, 1, 1,
-0.1731714, 0.4772391, -1.966508, 1, 0, 0, 1, 1,
-0.1714999, 0.1117903, -0.2165533, 1, 0, 0, 1, 1,
-0.170526, 1.138052, 0.9170623, 1, 0, 0, 1, 1,
-0.1678807, -0.6674793, -2.760349, 1, 0, 0, 1, 1,
-0.1675906, 0.5795957, 2.290083, 1, 0, 0, 1, 1,
-0.165924, 0.3723537, -0.7423365, 0, 0, 0, 1, 1,
-0.1650961, -0.4035224, -3.239979, 0, 0, 0, 1, 1,
-0.1542077, -0.3021116, -3.381115, 0, 0, 0, 1, 1,
-0.1525884, -0.3658109, -3.507267, 0, 0, 0, 1, 1,
-0.1503991, -0.6487694, -2.400516, 0, 0, 0, 1, 1,
-0.1438483, 0.09024542, -1.765851, 0, 0, 0, 1, 1,
-0.1408696, -0.7608889, -3.021462, 0, 0, 0, 1, 1,
-0.1386617, -0.3227785, -2.648298, 1, 1, 1, 1, 1,
-0.1368739, 1.402716, 0.4117122, 1, 1, 1, 1, 1,
-0.132218, -1.090564, -2.912405, 1, 1, 1, 1, 1,
-0.1316982, 0.2255624, -1.242927, 1, 1, 1, 1, 1,
-0.129829, -1.667114, -4.349844, 1, 1, 1, 1, 1,
-0.1295711, 1.807124, -0.3428515, 1, 1, 1, 1, 1,
-0.1294267, -0.2250781, -3.656463, 1, 1, 1, 1, 1,
-0.1256828, -1.062959, -2.114059, 1, 1, 1, 1, 1,
-0.1181383, 0.9085852, 0.2563464, 1, 1, 1, 1, 1,
-0.1138685, -0.02590859, -1.694688, 1, 1, 1, 1, 1,
-0.1112088, -0.742369, -1.059437, 1, 1, 1, 1, 1,
-0.1104172, 0.9171995, 0.3399096, 1, 1, 1, 1, 1,
-0.1084954, 0.4411522, 0.611983, 1, 1, 1, 1, 1,
-0.1015602, -3.478259, -2.92272, 1, 1, 1, 1, 1,
-0.09804481, 1.428755, 0.6426089, 1, 1, 1, 1, 1,
-0.09702428, -1.045489, -2.731224, 0, 0, 1, 1, 1,
-0.09344739, -0.758326, -3.710855, 1, 0, 0, 1, 1,
-0.0928115, -0.8524995, -3.348653, 1, 0, 0, 1, 1,
-0.09250159, -1.275304, -1.58904, 1, 0, 0, 1, 1,
-0.08865738, -0.782852, -3.515328, 1, 0, 0, 1, 1,
-0.08369467, 0.6454433, -1.614803, 1, 0, 0, 1, 1,
-0.08203534, 0.006373426, -1.564838, 0, 0, 0, 1, 1,
-0.08061018, -0.02827759, -1.815662, 0, 0, 0, 1, 1,
-0.07994326, -0.9293212, -3.842574, 0, 0, 0, 1, 1,
-0.07290209, -0.9624092, -2.153431, 0, 0, 0, 1, 1,
-0.07170504, -1.032158, -1.72442, 0, 0, 0, 1, 1,
-0.06447859, -0.02365232, -1.936919, 0, 0, 0, 1, 1,
-0.06327593, -0.1149147, -1.775581, 0, 0, 0, 1, 1,
-0.06177885, -0.919979, -3.75651, 1, 1, 1, 1, 1,
-0.0596183, 0.1338129, 0.3278958, 1, 1, 1, 1, 1,
-0.0587997, 1.263701, -0.4837774, 1, 1, 1, 1, 1,
-0.05679861, 0.1791036, 0.4394209, 1, 1, 1, 1, 1,
-0.05663718, 0.4512104, 0.9972652, 1, 1, 1, 1, 1,
-0.05374531, 1.469619, -0.7544276, 1, 1, 1, 1, 1,
-0.05338092, 0.6165593, 0.2920577, 1, 1, 1, 1, 1,
-0.0493811, 0.2369843, -0.9482474, 1, 1, 1, 1, 1,
-0.04859172, 0.6100059, -0.1567193, 1, 1, 1, 1, 1,
-0.03966654, -1.122137, -1.084965, 1, 1, 1, 1, 1,
-0.03907036, 1.203049, -0.8396535, 1, 1, 1, 1, 1,
-0.03467538, 1.20931, -2.001896, 1, 1, 1, 1, 1,
-0.0267602, 0.3384681, -0.9162682, 1, 1, 1, 1, 1,
-0.02456702, -0.2611068, -2.771095, 1, 1, 1, 1, 1,
-0.02445927, 0.7233838, -1.452043, 1, 1, 1, 1, 1,
-0.02411265, -1.026286, -3.774187, 0, 0, 1, 1, 1,
-0.02055358, 0.3154184, 0.616495, 1, 0, 0, 1, 1,
-0.0182979, -1.981489, -3.330994, 1, 0, 0, 1, 1,
-0.0160844, -1.174135, -3.466465, 1, 0, 0, 1, 1,
-0.01561267, -0.07826369, -3.861211, 1, 0, 0, 1, 1,
-0.01484841, -0.933769, -5.301078, 1, 0, 0, 1, 1,
-0.009442063, 0.6700032, -2.267102, 0, 0, 0, 1, 1,
-0.007460179, 0.2467746, -0.03377473, 0, 0, 0, 1, 1,
0.005803839, 0.2522106, -0.264338, 0, 0, 0, 1, 1,
0.007631154, 1.293972, -0.912899, 0, 0, 0, 1, 1,
0.00767422, -0.5433788, 3.055854, 0, 0, 0, 1, 1,
0.0101532, 0.6885098, 1.394694, 0, 0, 0, 1, 1,
0.0129269, 0.3866065, 2.019639, 0, 0, 0, 1, 1,
0.01366689, 0.2274787, -0.2968605, 1, 1, 1, 1, 1,
0.01517124, -0.3595968, 2.717219, 1, 1, 1, 1, 1,
0.01901431, 0.6508951, -0.740931, 1, 1, 1, 1, 1,
0.02444781, -0.7794131, 1.499403, 1, 1, 1, 1, 1,
0.02931985, 0.6645467, -0.2975901, 1, 1, 1, 1, 1,
0.03311914, -1.193151, 3.23066, 1, 1, 1, 1, 1,
0.03315527, 0.4843745, 1.800078, 1, 1, 1, 1, 1,
0.0362599, 0.01120716, -1.221715, 1, 1, 1, 1, 1,
0.03802732, -0.356071, 2.706918, 1, 1, 1, 1, 1,
0.03915601, 0.2598476, 0.6226024, 1, 1, 1, 1, 1,
0.04066144, -2.130237, 2.453984, 1, 1, 1, 1, 1,
0.04339528, 0.8880673, -0.7441951, 1, 1, 1, 1, 1,
0.04632165, 1.01937, 0.5176626, 1, 1, 1, 1, 1,
0.04870494, 0.3979089, -0.7801427, 1, 1, 1, 1, 1,
0.05217268, -0.9313933, 3.247078, 1, 1, 1, 1, 1,
0.05854779, -0.3440742, 3.021048, 0, 0, 1, 1, 1,
0.06043712, 0.3001403, 2.129934, 1, 0, 0, 1, 1,
0.06171075, 0.9530307, -0.4798776, 1, 0, 0, 1, 1,
0.06174709, -0.10939, 3.217272, 1, 0, 0, 1, 1,
0.06345201, 0.2019507, -2.57367, 1, 0, 0, 1, 1,
0.06567814, -0.1377681, 1.16619, 1, 0, 0, 1, 1,
0.0754502, 1.357896, -0.3155602, 0, 0, 0, 1, 1,
0.07720777, -0.6378933, 4.037169, 0, 0, 0, 1, 1,
0.0779203, 1.799358, 1.413252, 0, 0, 0, 1, 1,
0.07822052, -0.5046083, 1.720795, 0, 0, 0, 1, 1,
0.07911643, 0.4107088, 0.9093096, 0, 0, 0, 1, 1,
0.08156262, -0.385592, 1.104908, 0, 0, 0, 1, 1,
0.08233197, 0.6225215, 1.010758, 0, 0, 0, 1, 1,
0.08734006, -1.502989, 2.621073, 1, 1, 1, 1, 1,
0.09033499, -0.3654827, 3.64246, 1, 1, 1, 1, 1,
0.09265482, -0.5992944, 4.593569, 1, 1, 1, 1, 1,
0.09312068, 1.506528, -0.2808833, 1, 1, 1, 1, 1,
0.09428272, -0.05433509, 0.168915, 1, 1, 1, 1, 1,
0.1007217, -0.2350745, 4.408711, 1, 1, 1, 1, 1,
0.1019175, -0.8517684, 1.89856, 1, 1, 1, 1, 1,
0.1061673, 0.7502589, 0.3979828, 1, 1, 1, 1, 1,
0.1078068, -2.509753, 1.670349, 1, 1, 1, 1, 1,
0.1124549, 0.542903, -0.09571467, 1, 1, 1, 1, 1,
0.1143422, 0.7270662, 1.745122, 1, 1, 1, 1, 1,
0.1158925, -1.496586, 2.632217, 1, 1, 1, 1, 1,
0.1172892, 1.205633, 0.4324434, 1, 1, 1, 1, 1,
0.1218441, -2.599037, 3.057265, 1, 1, 1, 1, 1,
0.1246676, 0.0172436, 1.854783, 1, 1, 1, 1, 1,
0.1248144, -0.2992602, 1.253239, 0, 0, 1, 1, 1,
0.1263883, -0.4549366, 4.561279, 1, 0, 0, 1, 1,
0.1277341, -0.7959524, 2.509556, 1, 0, 0, 1, 1,
0.1311192, 0.7333315, -0.02532965, 1, 0, 0, 1, 1,
0.1318206, -0.8884873, 3.657805, 1, 0, 0, 1, 1,
0.1387136, 0.426824, 2.020734, 1, 0, 0, 1, 1,
0.1403217, -1.161319, 4.191134, 0, 0, 0, 1, 1,
0.1419501, -0.3134194, 4.304342, 0, 0, 0, 1, 1,
0.1420233, 0.08191118, 0.9786682, 0, 0, 0, 1, 1,
0.1428498, -1.634782, 2.127822, 0, 0, 0, 1, 1,
0.1429681, -0.3347682, 1.369072, 0, 0, 0, 1, 1,
0.1454101, 0.2885539, 0.5182323, 0, 0, 0, 1, 1,
0.148195, -0.1635835, 2.893037, 0, 0, 0, 1, 1,
0.1620596, -0.2359887, 1.432916, 1, 1, 1, 1, 1,
0.1642295, -1.391128, 2.830601, 1, 1, 1, 1, 1,
0.174216, -0.9064317, 2.431244, 1, 1, 1, 1, 1,
0.1768238, 2.08009, 0.6794811, 1, 1, 1, 1, 1,
0.180976, -0.3535675, 1.497015, 1, 1, 1, 1, 1,
0.1813951, -0.1289619, 1.236286, 1, 1, 1, 1, 1,
0.1827252, -0.2982784, 3.883697, 1, 1, 1, 1, 1,
0.1850097, -0.9886396, 3.699668, 1, 1, 1, 1, 1,
0.1854706, 1.11556, -0.2415397, 1, 1, 1, 1, 1,
0.1890765, 0.213721, -0.7934403, 1, 1, 1, 1, 1,
0.1907067, 0.2714174, 0.4399245, 1, 1, 1, 1, 1,
0.1913233, 0.03637025, 2.891628, 1, 1, 1, 1, 1,
0.1921479, -0.4204878, 2.879585, 1, 1, 1, 1, 1,
0.1942168, 1.109291, 0.4016045, 1, 1, 1, 1, 1,
0.1943986, -0.8919818, 1.331113, 1, 1, 1, 1, 1,
0.1948569, -0.5358016, 1.595938, 0, 0, 1, 1, 1,
0.1955979, -1.274587, 4.06673, 1, 0, 0, 1, 1,
0.1970707, 0.1192556, 1.952253, 1, 0, 0, 1, 1,
0.1996453, -0.1307699, 1.107664, 1, 0, 0, 1, 1,
0.2007394, 0.8502252, 2.380295, 1, 0, 0, 1, 1,
0.2046084, 0.04187134, -0.6377477, 1, 0, 0, 1, 1,
0.2063346, -0.4031786, 1.904281, 0, 0, 0, 1, 1,
0.2073383, -2.127557, 3.464455, 0, 0, 0, 1, 1,
0.2100187, -0.8133398, 1.965796, 0, 0, 0, 1, 1,
0.2109404, 2.999287, 0.9401818, 0, 0, 0, 1, 1,
0.2128538, -0.6231211, 4.812111, 0, 0, 0, 1, 1,
0.2129235, 0.2836397, 1.149469, 0, 0, 0, 1, 1,
0.2139643, 0.3749191, 1.547027, 0, 0, 0, 1, 1,
0.2140339, 1.919843, -1.203055, 1, 1, 1, 1, 1,
0.2142902, 0.6761069, 1.272781, 1, 1, 1, 1, 1,
0.2187725, 0.6807265, 1.51455, 1, 1, 1, 1, 1,
0.2233403, 0.08211756, 1.266934, 1, 1, 1, 1, 1,
0.2250252, 0.6776536, 0.4067825, 1, 1, 1, 1, 1,
0.2256084, -0.8280277, 3.575104, 1, 1, 1, 1, 1,
0.2278334, -0.7408783, 3.153095, 1, 1, 1, 1, 1,
0.2333043, -0.498629, 2.581776, 1, 1, 1, 1, 1,
0.2374035, -0.7347052, 2.763604, 1, 1, 1, 1, 1,
0.2387926, -0.2452013, 4.106328, 1, 1, 1, 1, 1,
0.2419454, -0.2399374, 2.729017, 1, 1, 1, 1, 1,
0.242195, -0.07591438, 0.9785476, 1, 1, 1, 1, 1,
0.2447324, 1.036564, 0.4893832, 1, 1, 1, 1, 1,
0.2462293, -0.2529142, 2.351, 1, 1, 1, 1, 1,
0.2471292, -0.5005198, 1.931146, 1, 1, 1, 1, 1,
0.2477033, -0.354459, 2.89627, 0, 0, 1, 1, 1,
0.2498853, -0.0123397, 1.405451, 1, 0, 0, 1, 1,
0.251823, -0.8831417, 2.486892, 1, 0, 0, 1, 1,
0.2527742, 2.798461, -0.1766811, 1, 0, 0, 1, 1,
0.2550671, -0.03095483, 1.372227, 1, 0, 0, 1, 1,
0.2583233, 0.1371095, 1.241124, 1, 0, 0, 1, 1,
0.2595623, -0.3012675, 2.325635, 0, 0, 0, 1, 1,
0.2613433, 1.189744, 0.7222732, 0, 0, 0, 1, 1,
0.2627754, -0.05768059, 2.160668, 0, 0, 0, 1, 1,
0.2674737, -0.33931, 1.753985, 0, 0, 0, 1, 1,
0.2685678, 1.045624, 0.1913124, 0, 0, 0, 1, 1,
0.2722195, -1.462852, 5.355116, 0, 0, 0, 1, 1,
0.2726438, 0.007662551, 4.183138, 0, 0, 0, 1, 1,
0.2735656, 0.4272854, -0.147859, 1, 1, 1, 1, 1,
0.2787443, 0.547269, 0.1500729, 1, 1, 1, 1, 1,
0.2801691, -1.954908, 3.038176, 1, 1, 1, 1, 1,
0.2820912, -0.04546389, 0.3126211, 1, 1, 1, 1, 1,
0.2865402, 0.2908924, 0.2409392, 1, 1, 1, 1, 1,
0.2931565, 1.062516, 2.020853, 1, 1, 1, 1, 1,
0.2933052, 2.499149, 0.2829978, 1, 1, 1, 1, 1,
0.2945726, 2.371891, 1.000574, 1, 1, 1, 1, 1,
0.2947234, -0.5620338, 1.981791, 1, 1, 1, 1, 1,
0.2986979, -0.3783046, 1.641541, 1, 1, 1, 1, 1,
0.30763, -0.5054489, 1.448272, 1, 1, 1, 1, 1,
0.3100473, -0.9983518, 2.596937, 1, 1, 1, 1, 1,
0.3124433, 0.2206054, -0.06965458, 1, 1, 1, 1, 1,
0.3135684, -0.7772966, 2.404855, 1, 1, 1, 1, 1,
0.3139359, 0.866841, 1.800067, 1, 1, 1, 1, 1,
0.3212505, -1.077309, 3.237303, 0, 0, 1, 1, 1,
0.3237649, -0.6253428, 3.267548, 1, 0, 0, 1, 1,
0.328164, 0.6876024, -0.3982488, 1, 0, 0, 1, 1,
0.3282687, -1.613267, 1.108154, 1, 0, 0, 1, 1,
0.3355796, 0.1764596, 1.162579, 1, 0, 0, 1, 1,
0.33632, -0.3336269, 3.744841, 1, 0, 0, 1, 1,
0.336637, -1.152456, 3.718628, 0, 0, 0, 1, 1,
0.3374689, -0.96252, 4.400257, 0, 0, 0, 1, 1,
0.3395512, -1.1612, 0.7885811, 0, 0, 0, 1, 1,
0.3404005, 0.1415554, 1.671455, 0, 0, 0, 1, 1,
0.3421185, 0.4022047, 1.265291, 0, 0, 0, 1, 1,
0.3421441, -0.2759287, 1.634734, 0, 0, 0, 1, 1,
0.3436032, -0.1178229, 1.139472, 0, 0, 0, 1, 1,
0.3462048, 0.2615338, 0.6100261, 1, 1, 1, 1, 1,
0.3482198, -0.008536341, 2.341919, 1, 1, 1, 1, 1,
0.3507979, -1.214505, 1.745382, 1, 1, 1, 1, 1,
0.354183, -0.6162184, 1.904721, 1, 1, 1, 1, 1,
0.3544326, 0.3361472, -0.8271841, 1, 1, 1, 1, 1,
0.3553612, -0.7088098, 1.424736, 1, 1, 1, 1, 1,
0.3563169, 0.5141636, 0.7531971, 1, 1, 1, 1, 1,
0.3679582, 0.8980016, -2.509621, 1, 1, 1, 1, 1,
0.3682836, -0.02840617, 3.059125, 1, 1, 1, 1, 1,
0.3746026, -0.5598048, 2.568554, 1, 1, 1, 1, 1,
0.3777139, 1.564459, 0.8021598, 1, 1, 1, 1, 1,
0.384522, 0.5401827, 0.4977548, 1, 1, 1, 1, 1,
0.3850045, -0.8121352, 2.542129, 1, 1, 1, 1, 1,
0.3864023, 1.369427, -1.400709, 1, 1, 1, 1, 1,
0.3893252, -1.74065, 3.273318, 1, 1, 1, 1, 1,
0.3910797, -0.3148995, 1.963019, 0, 0, 1, 1, 1,
0.3916802, -1.30201, 1.652811, 1, 0, 0, 1, 1,
0.397831, -0.4030368, -0.1629798, 1, 0, 0, 1, 1,
0.3998622, -0.8713497, 3.182889, 1, 0, 0, 1, 1,
0.4011526, 0.06041012, -1.051681, 1, 0, 0, 1, 1,
0.4022228, -0.2662416, 1.655516, 1, 0, 0, 1, 1,
0.4024669, -1.178978, 3.771303, 0, 0, 0, 1, 1,
0.4028915, -1.749098, 3.67275, 0, 0, 0, 1, 1,
0.4051314, 1.54662, 0.588417, 0, 0, 0, 1, 1,
0.4052258, -1.854698, 3.095062, 0, 0, 0, 1, 1,
0.4071317, 0.4777593, 1.842387, 0, 0, 0, 1, 1,
0.4077522, 0.01731256, 1.426813, 0, 0, 0, 1, 1,
0.407961, -0.3059113, 2.953595, 0, 0, 0, 1, 1,
0.412485, -1.180657, 4.939937, 1, 1, 1, 1, 1,
0.4217364, -0.2372896, 2.743714, 1, 1, 1, 1, 1,
0.4234798, -0.2789681, 3.396368, 1, 1, 1, 1, 1,
0.4247773, -0.420442, 3.636376, 1, 1, 1, 1, 1,
0.4321077, -0.8140694, 3.590764, 1, 1, 1, 1, 1,
0.432248, 0.2085868, 2.295738, 1, 1, 1, 1, 1,
0.4364203, -0.3750187, 2.063204, 1, 1, 1, 1, 1,
0.4372337, -1.346791, 2.707582, 1, 1, 1, 1, 1,
0.4417827, -1.070409, 3.5737, 1, 1, 1, 1, 1,
0.4428873, 0.3745209, 1.30519, 1, 1, 1, 1, 1,
0.4448258, -1.623476, 2.817336, 1, 1, 1, 1, 1,
0.4457364, 1.830234, -0.01454391, 1, 1, 1, 1, 1,
0.4485155, -0.5924025, 2.152248, 1, 1, 1, 1, 1,
0.4523446, 1.042575, 1.236384, 1, 1, 1, 1, 1,
0.4544148, -0.6596189, 1.300712, 1, 1, 1, 1, 1,
0.4551889, -0.3719934, 3.464142, 0, 0, 1, 1, 1,
0.4572598, -0.8903967, 2.776754, 1, 0, 0, 1, 1,
0.4583706, -0.3587866, 2.433771, 1, 0, 0, 1, 1,
0.4593998, -0.2173274, 2.051576, 1, 0, 0, 1, 1,
0.465126, 0.2623752, 1.51365, 1, 0, 0, 1, 1,
0.465306, -0.2771124, 3.337094, 1, 0, 0, 1, 1,
0.4681077, -0.8575275, 4.131494, 0, 0, 0, 1, 1,
0.4687014, 0.1830937, -0.2998833, 0, 0, 0, 1, 1,
0.4691007, 1.83577, -0.3652601, 0, 0, 0, 1, 1,
0.4706042, -1.182428, 1.125215, 0, 0, 0, 1, 1,
0.4728471, 1.451869, -0.3804354, 0, 0, 0, 1, 1,
0.4835055, 1.70851, 1.551929, 0, 0, 0, 1, 1,
0.4852223, -1.13728, 2.078886, 0, 0, 0, 1, 1,
0.4876436, -0.1484841, 2.708504, 1, 1, 1, 1, 1,
0.490021, -1.759609, 5.154757, 1, 1, 1, 1, 1,
0.4915191, 1.066594, 0.586573, 1, 1, 1, 1, 1,
0.4941558, 0.5801967, 1.623011, 1, 1, 1, 1, 1,
0.4956426, 3.306638, 0.1755848, 1, 1, 1, 1, 1,
0.496181, 1.842956, 1.557003, 1, 1, 1, 1, 1,
0.498318, 0.1403616, 0.6783863, 1, 1, 1, 1, 1,
0.4993422, -0.6380921, 1.823011, 1, 1, 1, 1, 1,
0.5106959, 0.5293714, 0.130749, 1, 1, 1, 1, 1,
0.51193, 0.8384711, 1.629804, 1, 1, 1, 1, 1,
0.5250641, -1.215513, 0.7237571, 1, 1, 1, 1, 1,
0.529528, -0.8131843, 1.095828, 1, 1, 1, 1, 1,
0.5301811, 1.183725, 0.4904962, 1, 1, 1, 1, 1,
0.5345861, -1.018754, 2.724165, 1, 1, 1, 1, 1,
0.5382789, 0.8593646, 0.4394327, 1, 1, 1, 1, 1,
0.5438482, -1.236937, 3.748995, 0, 0, 1, 1, 1,
0.5598763, 0.1848168, 1.939385, 1, 0, 0, 1, 1,
0.5631722, 0.5178356, 1.160567, 1, 0, 0, 1, 1,
0.5695186, -1.368683, 4.086356, 1, 0, 0, 1, 1,
0.5709465, 0.5091177, -0.05744973, 1, 0, 0, 1, 1,
0.5732854, -0.2281806, 1.094589, 1, 0, 0, 1, 1,
0.5743197, 0.1798231, 1.59627, 0, 0, 0, 1, 1,
0.5786787, -1.916066, 4.662694, 0, 0, 0, 1, 1,
0.5793035, 2.117743, -0.3554551, 0, 0, 0, 1, 1,
0.5810353, 0.6948324, 0.5210933, 0, 0, 0, 1, 1,
0.5858625, -0.5599259, 1.996867, 0, 0, 0, 1, 1,
0.5888365, -0.8898892, 2.088986, 0, 0, 0, 1, 1,
0.5895115, -0.866356, 3.862262, 0, 0, 0, 1, 1,
0.589552, -0.2803513, 3.973108, 1, 1, 1, 1, 1,
0.5899196, 0.3862012, -0.6188623, 1, 1, 1, 1, 1,
0.591058, 0.9775535, 0.6050803, 1, 1, 1, 1, 1,
0.5934972, -0.3451663, 1.528356, 1, 1, 1, 1, 1,
0.5952662, -0.6380619, 0.8347175, 1, 1, 1, 1, 1,
0.5958658, -1.313366, 2.464033, 1, 1, 1, 1, 1,
0.6007609, -1.461117, 1.27427, 1, 1, 1, 1, 1,
0.6008987, -0.6267155, 0.4536388, 1, 1, 1, 1, 1,
0.6017492, 0.2156843, 2.118388, 1, 1, 1, 1, 1,
0.6116989, -0.6792691, 3.20379, 1, 1, 1, 1, 1,
0.6118747, -2.193129, 3.640774, 1, 1, 1, 1, 1,
0.6189931, -1.949608, 2.819518, 1, 1, 1, 1, 1,
0.6199961, -1.201243, 3.084547, 1, 1, 1, 1, 1,
0.624232, 0.4634546, 0.5980566, 1, 1, 1, 1, 1,
0.6252668, -0.665326, 3.124647, 1, 1, 1, 1, 1,
0.6273954, 1.046717, -0.5635744, 0, 0, 1, 1, 1,
0.6290188, 0.4194286, 1.005078, 1, 0, 0, 1, 1,
0.6308162, 0.5661008, 1.146881, 1, 0, 0, 1, 1,
0.6308921, -0.5736848, 2.156566, 1, 0, 0, 1, 1,
0.6378974, 1.405652, 0.7067624, 1, 0, 0, 1, 1,
0.6395062, -0.3257879, 3.615654, 1, 0, 0, 1, 1,
0.6400727, -0.5613382, 2.464979, 0, 0, 0, 1, 1,
0.6402858, -0.9588084, 1.512425, 0, 0, 0, 1, 1,
0.645581, -0.07539947, 2.565032, 0, 0, 0, 1, 1,
0.6470329, 0.1291377, 2.382054, 0, 0, 0, 1, 1,
0.6485651, -0.3461302, 2.101032, 0, 0, 0, 1, 1,
0.6508642, -0.1129559, 2.274179, 0, 0, 0, 1, 1,
0.6526862, 0.7397361, -0.03213692, 0, 0, 0, 1, 1,
0.6544209, -0.4198616, 2.6606, 1, 1, 1, 1, 1,
0.6602927, 1.975593, 1.277588, 1, 1, 1, 1, 1,
0.660702, 0.2095097, 0.3347497, 1, 1, 1, 1, 1,
0.6620286, 1.212801, 2.072449, 1, 1, 1, 1, 1,
0.665865, 0.1305232, 1.650147, 1, 1, 1, 1, 1,
0.6662093, 1.072873, -1.313871, 1, 1, 1, 1, 1,
0.6672867, 0.3143501, 2.177179, 1, 1, 1, 1, 1,
0.6758165, -0.4576885, 1.292353, 1, 1, 1, 1, 1,
0.677884, 0.1259072, -0.3411917, 1, 1, 1, 1, 1,
0.6786425, 0.4844645, 0.5830736, 1, 1, 1, 1, 1,
0.679585, -0.5506647, 2.868438, 1, 1, 1, 1, 1,
0.6802695, -0.06234125, 0.9576932, 1, 1, 1, 1, 1,
0.6822351, 0.1018052, 1.208293, 1, 1, 1, 1, 1,
0.6869593, 0.5637768, 0.5034959, 1, 1, 1, 1, 1,
0.6903573, -1.520155, 2.245535, 1, 1, 1, 1, 1,
0.6927041, -0.5760643, 3.937898, 0, 0, 1, 1, 1,
0.6962188, -0.9751338, 3.550196, 1, 0, 0, 1, 1,
0.6969773, 2.187844, 0.4945056, 1, 0, 0, 1, 1,
0.6981668, 0.1028877, 0.8385921, 1, 0, 0, 1, 1,
0.7089883, -0.7597072, 2.698616, 1, 0, 0, 1, 1,
0.7098481, -0.2248269, 1.749657, 1, 0, 0, 1, 1,
0.721223, -0.1994159, 0.8320348, 0, 0, 0, 1, 1,
0.7220169, -0.3231989, 2.007223, 0, 0, 0, 1, 1,
0.7262528, 0.01525372, 0.7413167, 0, 0, 0, 1, 1,
0.7290446, -0.6660581, 2.431368, 0, 0, 0, 1, 1,
0.7306787, 0.07369635, 2.069014, 0, 0, 0, 1, 1,
0.739018, -0.1877983, 2.05298, 0, 0, 0, 1, 1,
0.7422398, -0.9141669, 0.9914001, 0, 0, 0, 1, 1,
0.7448547, -0.7233568, 2.005012, 1, 1, 1, 1, 1,
0.7488967, -0.7981914, 2.670437, 1, 1, 1, 1, 1,
0.7588524, -0.8128229, 2.347252, 1, 1, 1, 1, 1,
0.7595845, -0.530029, 1.874578, 1, 1, 1, 1, 1,
0.7606201, 0.8473281, 1.091073, 1, 1, 1, 1, 1,
0.7646723, 1.308591, 0.124161, 1, 1, 1, 1, 1,
0.7722353, -0.6816251, 3.215074, 1, 1, 1, 1, 1,
0.7751143, 0.283066, 1.972073, 1, 1, 1, 1, 1,
0.7765037, -0.4176096, 0.7547902, 1, 1, 1, 1, 1,
0.7794039, 0.5835777, 1.51601, 1, 1, 1, 1, 1,
0.7794973, -0.4403593, 2.02634, 1, 1, 1, 1, 1,
0.7947435, 0.1216003, 1.773252, 1, 1, 1, 1, 1,
0.7982373, -1.16845, 2.395581, 1, 1, 1, 1, 1,
0.8003583, -0.4013768, 1.736163, 1, 1, 1, 1, 1,
0.802856, -0.3381295, 0.5256323, 1, 1, 1, 1, 1,
0.8032219, 0.7756665, -0.1186082, 0, 0, 1, 1, 1,
0.8055371, -0.3431411, 0.5728208, 1, 0, 0, 1, 1,
0.8078275, 1.040734, 1.251684, 1, 0, 0, 1, 1,
0.8095217, 0.4422722, -0.9393893, 1, 0, 0, 1, 1,
0.809534, 0.5189127, 0.2780311, 1, 0, 0, 1, 1,
0.8097351, 2.218071, 0.8002486, 1, 0, 0, 1, 1,
0.8127168, 0.148742, 1.768647, 0, 0, 0, 1, 1,
0.8151907, 0.8642895, 0.8129774, 0, 0, 0, 1, 1,
0.8160892, 2.212259, 2.009161, 0, 0, 0, 1, 1,
0.8200681, 0.7581295, 1.149609, 0, 0, 0, 1, 1,
0.8206928, -0.2083087, 2.205143, 0, 0, 0, 1, 1,
0.8261814, 0.2821225, -0.5865401, 0, 0, 0, 1, 1,
0.8296546, -1.261502, 2.929704, 0, 0, 0, 1, 1,
0.8373321, -0.260095, 1.660116, 1, 1, 1, 1, 1,
0.8474007, -1.929442, 4.45835, 1, 1, 1, 1, 1,
0.8512121, -1.137445, 2.723473, 1, 1, 1, 1, 1,
0.8531054, -0.1132156, 1.83653, 1, 1, 1, 1, 1,
0.8583651, 0.6285049, -0.6258362, 1, 1, 1, 1, 1,
0.8629573, -0.2714742, 2.702759, 1, 1, 1, 1, 1,
0.8681294, 0.9798264, 1.151397, 1, 1, 1, 1, 1,
0.868295, 0.7353532, 0.9935631, 1, 1, 1, 1, 1,
0.8725228, 0.5359807, 1.050882, 1, 1, 1, 1, 1,
0.8820894, -0.2777233, 1.661043, 1, 1, 1, 1, 1,
0.8845364, -0.9403918, 2.583363, 1, 1, 1, 1, 1,
0.8849168, -0.332678, 2.765475, 1, 1, 1, 1, 1,
0.8873503, -0.2714633, 2.652676, 1, 1, 1, 1, 1,
0.8874012, 2.332248, 1.842933, 1, 1, 1, 1, 1,
0.8890252, -1.090644, 3.134038, 1, 1, 1, 1, 1,
0.8898282, 2.715437, 0.3460817, 0, 0, 1, 1, 1,
0.8968778, 0.2218694, 2.553208, 1, 0, 0, 1, 1,
0.8981456, 0.6239293, 1.147704, 1, 0, 0, 1, 1,
0.8992399, -0.9437014, 2.639721, 1, 0, 0, 1, 1,
0.8999659, 0.7182521, -0.7850072, 1, 0, 0, 1, 1,
0.9152037, 0.3081031, 1.360645, 1, 0, 0, 1, 1,
0.923646, -0.1846971, 0.8139449, 0, 0, 0, 1, 1,
0.9331964, 0.2450067, 2.045993, 0, 0, 0, 1, 1,
0.9343084, -0.3173821, -0.8651567, 0, 0, 0, 1, 1,
0.9394642, -0.3212213, 2.408662, 0, 0, 0, 1, 1,
0.9471286, 0.7719651, 1.354538, 0, 0, 0, 1, 1,
0.9478889, -3.059076, 3.839708, 0, 0, 0, 1, 1,
0.949486, -0.2914291, 1.032682, 0, 0, 0, 1, 1,
0.9514975, 0.4193473, 1.401502, 1, 1, 1, 1, 1,
0.9595006, 0.1534653, 1.845603, 1, 1, 1, 1, 1,
0.9639736, -0.06889489, 0.9107097, 1, 1, 1, 1, 1,
0.9647115, 0.7626459, 1.33785, 1, 1, 1, 1, 1,
0.9689857, 0.8482254, 0.2223053, 1, 1, 1, 1, 1,
0.9731898, -1.203473, 3.98632, 1, 1, 1, 1, 1,
0.9748135, -0.06835448, 1.923542, 1, 1, 1, 1, 1,
0.9835154, 0.9575, -0.9171939, 1, 1, 1, 1, 1,
0.985778, -0.6218486, 0.6728612, 1, 1, 1, 1, 1,
0.9870318, 0.2864719, 1.622769, 1, 1, 1, 1, 1,
0.9894348, 1.679316, 2.377644, 1, 1, 1, 1, 1,
0.9913349, -1.267758, 2.584197, 1, 1, 1, 1, 1,
0.9936547, 0.6118709, 1.780166, 1, 1, 1, 1, 1,
0.9937197, -0.9141209, 3.713719, 1, 1, 1, 1, 1,
0.9954713, -0.7558756, 3.406392, 1, 1, 1, 1, 1,
0.9957654, -0.4555165, 0.8242279, 0, 0, 1, 1, 1,
0.9971594, 0.01107381, 0.3972916, 1, 0, 0, 1, 1,
1.00139, 0.05826382, -0.4589006, 1, 0, 0, 1, 1,
1.009959, 0.8315614, 0.0500028, 1, 0, 0, 1, 1,
1.014103, -0.506658, 1.719754, 1, 0, 0, 1, 1,
1.014837, 1.064687, 0.3126549, 1, 0, 0, 1, 1,
1.021768, 0.4397315, 1.730022, 0, 0, 0, 1, 1,
1.022592, 0.4745084, 2.146972, 0, 0, 0, 1, 1,
1.023603, 1.695383, -0.1316607, 0, 0, 0, 1, 1,
1.03302, -1.382634, 0.9009747, 0, 0, 0, 1, 1,
1.038788, -0.2569652, 1.56522, 0, 0, 0, 1, 1,
1.040675, -0.6605921, 2.07564, 0, 0, 0, 1, 1,
1.041446, -2.121848, 1.985154, 0, 0, 0, 1, 1,
1.045394, 0.8536546, 0.796684, 1, 1, 1, 1, 1,
1.046272, -0.3955615, 2.156001, 1, 1, 1, 1, 1,
1.050971, -0.01415671, 1.946882, 1, 1, 1, 1, 1,
1.053508, 0.1265115, 1.186563, 1, 1, 1, 1, 1,
1.055165, -0.4696877, 1.257411, 1, 1, 1, 1, 1,
1.069933, 0.9432984, -0.2268173, 1, 1, 1, 1, 1,
1.072445, 0.1474866, 2.617628, 1, 1, 1, 1, 1,
1.073791, -1.354933, 3.208197, 1, 1, 1, 1, 1,
1.083732, -0.741619, 2.457256, 1, 1, 1, 1, 1,
1.086484, -0.8311067, 2.634588, 1, 1, 1, 1, 1,
1.096503, 1.404726, 0.7640613, 1, 1, 1, 1, 1,
1.101153, -0.5354943, 4.296988, 1, 1, 1, 1, 1,
1.110722, -0.2913782, 2.475564, 1, 1, 1, 1, 1,
1.115725, -1.009794, 3.055701, 1, 1, 1, 1, 1,
1.118208, 0.1903102, 2.052314, 1, 1, 1, 1, 1,
1.122838, 0.03542968, 2.258589, 0, 0, 1, 1, 1,
1.135933, 1.264306, 1.099982, 1, 0, 0, 1, 1,
1.152519, 0.4228631, 0.09734764, 1, 0, 0, 1, 1,
1.184484, 0.600498, 1.218029, 1, 0, 0, 1, 1,
1.19113, 0.9600965, -0.04061469, 1, 0, 0, 1, 1,
1.19585, 1.697133, 0.9167892, 1, 0, 0, 1, 1,
1.203014, -0.3731928, 0.7371309, 0, 0, 0, 1, 1,
1.20353, -0.09785316, 3.254718, 0, 0, 0, 1, 1,
1.21183, -1.434458, 3.322792, 0, 0, 0, 1, 1,
1.224358, 0.3553799, 3.182921, 0, 0, 0, 1, 1,
1.227113, -0.05183489, 2.169919, 0, 0, 0, 1, 1,
1.233635, -0.4968294, 1.340791, 0, 0, 0, 1, 1,
1.235444, -0.2071431, 0.01409269, 0, 0, 0, 1, 1,
1.246529, -0.9752222, 1.932313, 1, 1, 1, 1, 1,
1.249849, -0.369022, 2.778863, 1, 1, 1, 1, 1,
1.250539, 0.1067125, 2.148822, 1, 1, 1, 1, 1,
1.2511, 0.4681654, 1.521224, 1, 1, 1, 1, 1,
1.253152, -0.01861654, 0.2985348, 1, 1, 1, 1, 1,
1.257228, -0.4502775, 1.489465, 1, 1, 1, 1, 1,
1.263425, -0.2361453, 3.039628, 1, 1, 1, 1, 1,
1.269693, -0.02077122, 1.449544, 1, 1, 1, 1, 1,
1.282268, 0.4587794, 2.184176, 1, 1, 1, 1, 1,
1.286934, -0.3581753, 1.280442, 1, 1, 1, 1, 1,
1.289403, -1.472665, 4.256666, 1, 1, 1, 1, 1,
1.289863, 2.429029, -1.363858, 1, 1, 1, 1, 1,
1.301773, -0.8676571, 1.043436, 1, 1, 1, 1, 1,
1.317861, 0.3252139, 0.8649048, 1, 1, 1, 1, 1,
1.321751, 1.922187, 2.844928, 1, 1, 1, 1, 1,
1.323749, -0.03721644, 1.791598, 0, 0, 1, 1, 1,
1.32728, 1.146617, -0.3711112, 1, 0, 0, 1, 1,
1.333616, 2.273403, -1.498955, 1, 0, 0, 1, 1,
1.336014, 0.5777493, 0.5151469, 1, 0, 0, 1, 1,
1.337319, -0.4205375, 3.6035, 1, 0, 0, 1, 1,
1.347837, 0.2696599, 0.5645942, 1, 0, 0, 1, 1,
1.353481, -1.515504, 1.633531, 0, 0, 0, 1, 1,
1.360006, -1.067538, 3.641774, 0, 0, 0, 1, 1,
1.36803, -0.8913074, 1.575246, 0, 0, 0, 1, 1,
1.370549, -0.3542441, 3.099889, 0, 0, 0, 1, 1,
1.376237, -0.4552802, 0.5772852, 0, 0, 0, 1, 1,
1.39619, 1.095453, -1.142301, 0, 0, 0, 1, 1,
1.396934, 1.466892, 1.060551, 0, 0, 0, 1, 1,
1.399891, 0.3547637, 1.41403, 1, 1, 1, 1, 1,
1.403354, 0.692687, 1.771439, 1, 1, 1, 1, 1,
1.408385, 0.2769728, 0.4637352, 1, 1, 1, 1, 1,
1.408949, -0.8130406, 2.381518, 1, 1, 1, 1, 1,
1.420378, 0.9916695, -0.47058, 1, 1, 1, 1, 1,
1.42113, -0.1971237, 3.252884, 1, 1, 1, 1, 1,
1.422081, -0.178587, 1.999095, 1, 1, 1, 1, 1,
1.426382, -0.6889483, 0.9278898, 1, 1, 1, 1, 1,
1.435065, 2.323754, 0.2834603, 1, 1, 1, 1, 1,
1.438987, -1.124907, 1.482354, 1, 1, 1, 1, 1,
1.441489, -0.3619158, 2.659064, 1, 1, 1, 1, 1,
1.462963, -0.1063049, 1.885121, 1, 1, 1, 1, 1,
1.480621, -0.2365521, -0.1330269, 1, 1, 1, 1, 1,
1.491596, 2.440227, 1.967945, 1, 1, 1, 1, 1,
1.492293, 0.1673937, 1.48507, 1, 1, 1, 1, 1,
1.519684, 1.117136, -0.121624, 0, 0, 1, 1, 1,
1.523706, 1.402991, 1.029411, 1, 0, 0, 1, 1,
1.527216, -0.8171944, 1.395042, 1, 0, 0, 1, 1,
1.532534, 1.259776, 0.05890051, 1, 0, 0, 1, 1,
1.536549, 0.4832794, 1.32033, 1, 0, 0, 1, 1,
1.563474, -0.5456631, 2.036516, 1, 0, 0, 1, 1,
1.565095, -1.07517, 2.327646, 0, 0, 0, 1, 1,
1.5826, -0.7458602, 0.2477661, 0, 0, 0, 1, 1,
1.586868, 0.1052487, 1.116701, 0, 0, 0, 1, 1,
1.591983, 0.406315, 0.6305802, 0, 0, 0, 1, 1,
1.59296, -1.409751, 2.102544, 0, 0, 0, 1, 1,
1.595148, 0.3998176, 2.605448, 0, 0, 0, 1, 1,
1.59976, -1.527409, 3.900373, 0, 0, 0, 1, 1,
1.612106, -0.2197335, 1.232311, 1, 1, 1, 1, 1,
1.618467, 0.5007874, 0.3732219, 1, 1, 1, 1, 1,
1.62465, 0.2550775, -0.234129, 1, 1, 1, 1, 1,
1.629215, -0.3693131, 2.69549, 1, 1, 1, 1, 1,
1.629629, 0.0536629, 1.827673, 1, 1, 1, 1, 1,
1.632013, 0.2267589, -0.1648561, 1, 1, 1, 1, 1,
1.632285, 1.390385, 1.329051, 1, 1, 1, 1, 1,
1.635194, 1.993881, -0.9751429, 1, 1, 1, 1, 1,
1.649429, 0.265719, -0.6598694, 1, 1, 1, 1, 1,
1.657559, 1.559525, 1.00113, 1, 1, 1, 1, 1,
1.679857, -0.2984054, 0.4537438, 1, 1, 1, 1, 1,
1.703319, -0.944112, 1.841944, 1, 1, 1, 1, 1,
1.703856, -1.157361, 1.973351, 1, 1, 1, 1, 1,
1.729842, 0.1046662, 1.850862, 1, 1, 1, 1, 1,
1.748531, -1.83188, 3.704688, 1, 1, 1, 1, 1,
1.76179, -0.9230699, 2.394297, 0, 0, 1, 1, 1,
1.779331, 1.361266, 0.2707604, 1, 0, 0, 1, 1,
1.780775, 0.3912359, 0.5023784, 1, 0, 0, 1, 1,
1.787579, 0.5202052, 1.576922, 1, 0, 0, 1, 1,
1.78957, -1.382178, 1.965288, 1, 0, 0, 1, 1,
1.790971, 0.177513, 1.357639, 1, 0, 0, 1, 1,
1.795009, 0.8310528, -0.1414581, 0, 0, 0, 1, 1,
1.797055, -0.5493149, 1.727386, 0, 0, 0, 1, 1,
1.807591, 0.6787095, 0.4269243, 0, 0, 0, 1, 1,
1.845513, -0.7890123, 1.116407, 0, 0, 0, 1, 1,
1.847772, -1.827939, 1.649782, 0, 0, 0, 1, 1,
1.858986, 0.2881461, 2.074179, 0, 0, 0, 1, 1,
1.859717, 0.1258933, 0.456837, 0, 0, 0, 1, 1,
1.895176, 1.545087, 0.7824207, 1, 1, 1, 1, 1,
1.942071, 1.219641, 1.273986, 1, 1, 1, 1, 1,
1.958401, 0.1009924, 1.200856, 1, 1, 1, 1, 1,
1.961112, 0.5511966, 3.249007, 1, 1, 1, 1, 1,
1.967827, -0.187467, 1.051141, 1, 1, 1, 1, 1,
1.971426, -0.3600927, 2.981228, 1, 1, 1, 1, 1,
1.971452, 2.122253, 0.58246, 1, 1, 1, 1, 1,
1.972985, 0.2823516, 0.5785314, 1, 1, 1, 1, 1,
1.977425, 0.71254, 0.1680668, 1, 1, 1, 1, 1,
1.983804, 0.350493, -0.05398857, 1, 1, 1, 1, 1,
2.012312, -0.3231884, 0.3086415, 1, 1, 1, 1, 1,
2.017702, 1.437508, 0.09610218, 1, 1, 1, 1, 1,
2.023681, 0.04715731, 1.311422, 1, 1, 1, 1, 1,
2.070792, -1.257295, 2.478571, 1, 1, 1, 1, 1,
2.086316, 0.8433967, 2.294204, 1, 1, 1, 1, 1,
2.17235, 0.0390592, 1.83768, 0, 0, 1, 1, 1,
2.202365, 0.239015, 2.306156, 1, 0, 0, 1, 1,
2.225969, 0.150645, 0.647516, 1, 0, 0, 1, 1,
2.242797, -0.9609389, 3.2347, 1, 0, 0, 1, 1,
2.273448, 1.052396, 1.181367, 1, 0, 0, 1, 1,
2.280385, 0.7642233, 0.3393325, 1, 0, 0, 1, 1,
2.326755, -0.7319356, 2.995207, 0, 0, 0, 1, 1,
2.342983, -1.55633, 2.476637, 0, 0, 0, 1, 1,
2.353498, 0.3841749, 0.09871726, 0, 0, 0, 1, 1,
2.390726, -2.781821, 1.939088, 0, 0, 0, 1, 1,
2.399537, 0.460335, 0.3843253, 0, 0, 0, 1, 1,
2.415032, -0.8802132, 1.442511, 0, 0, 0, 1, 1,
2.545445, 1.846333, -0.1317039, 0, 0, 0, 1, 1,
2.577303, 1.856623, 1.528032, 1, 1, 1, 1, 1,
2.619846, 0.7250493, 2.764716, 1, 1, 1, 1, 1,
2.679161, 0.1408546, 1.322591, 1, 1, 1, 1, 1,
2.701926, 0.4520381, 1.730195, 1, 1, 1, 1, 1,
2.961742, -0.2207153, 0.2470852, 1, 1, 1, 1, 1,
2.977675, -0.9118784, 1.261581, 1, 1, 1, 1, 1,
3.194158, -1.603695, 3.726661, 1, 1, 1, 1, 1
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
var radius = 10.09583;
var distance = 35.46117;
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
mvMatrix.translate( 0.07377696, 0.09845805, 0.472477 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.46117);
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
