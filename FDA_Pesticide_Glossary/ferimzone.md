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
-3.367658, -0.4738294, -2.671705, 1, 0, 0, 1,
-3.139855, -0.9533128, -1.40065, 1, 0.007843138, 0, 1,
-2.924258, 0.5866874, -1.778447, 1, 0.01176471, 0, 1,
-2.853079, -1.415368, -1.329591, 1, 0.01960784, 0, 1,
-2.71222, 0.8273968, -0.1673671, 1, 0.02352941, 0, 1,
-2.562495, 1.054459, 0.5142274, 1, 0.03137255, 0, 1,
-2.539562, -2.367903, -1.297777, 1, 0.03529412, 0, 1,
-2.499363, 1.566954, -1.080873, 1, 0.04313726, 0, 1,
-2.472389, 0.1780937, -1.742786, 1, 0.04705882, 0, 1,
-2.43082, 0.03215861, 0.6635705, 1, 0.05490196, 0, 1,
-2.320384, -0.21223, -1.725747, 1, 0.05882353, 0, 1,
-2.316962, -0.4801043, -1.741469, 1, 0.06666667, 0, 1,
-2.292645, -0.4020396, -1.234977, 1, 0.07058824, 0, 1,
-2.264333, 0.08795796, -1.755479, 1, 0.07843138, 0, 1,
-2.232312, -1.887587, -1.867081, 1, 0.08235294, 0, 1,
-2.214681, 1.157448, -1.290643, 1, 0.09019608, 0, 1,
-2.197168, 0.01751629, -1.499919, 1, 0.09411765, 0, 1,
-2.149075, -0.4616735, -0.8099572, 1, 0.1019608, 0, 1,
-2.138971, 0.5949225, -1.215516, 1, 0.1098039, 0, 1,
-2.080334, 1.146491, -1.50524, 1, 0.1137255, 0, 1,
-2.045004, -2.655248, -2.769489, 1, 0.1215686, 0, 1,
-2.040928, 0.4163406, -2.046189, 1, 0.1254902, 0, 1,
-2.030749, 0.04182386, -0.679486, 1, 0.1333333, 0, 1,
-2.025791, -0.7032545, -2.03178, 1, 0.1372549, 0, 1,
-2.024693, -0.2165044, -2.19381, 1, 0.145098, 0, 1,
-2.018602, 0.7328847, -0.187152, 1, 0.1490196, 0, 1,
-1.987849, -1.286902, -2.397123, 1, 0.1568628, 0, 1,
-1.935949, -0.9726179, -1.539728, 1, 0.1607843, 0, 1,
-1.912358, -0.2003762, -2.098455, 1, 0.1686275, 0, 1,
-1.873137, 1.388095, -1.83575, 1, 0.172549, 0, 1,
-1.839725, -0.2523546, -0.6840816, 1, 0.1803922, 0, 1,
-1.830011, -1.152457, -1.947614, 1, 0.1843137, 0, 1,
-1.826061, 1.16069, 0.09807455, 1, 0.1921569, 0, 1,
-1.783192, -1.420361, -3.106399, 1, 0.1960784, 0, 1,
-1.76238, 0.9384128, -1.691092, 1, 0.2039216, 0, 1,
-1.755921, 1.7758, -0.914574, 1, 0.2117647, 0, 1,
-1.723828, -0.6542403, -2.635645, 1, 0.2156863, 0, 1,
-1.704897, -2.412262, -5.043033, 1, 0.2235294, 0, 1,
-1.701584, -1.449725, -2.510961, 1, 0.227451, 0, 1,
-1.689972, 0.6394908, -0.3551023, 1, 0.2352941, 0, 1,
-1.682976, -0.2301561, -1.507342, 1, 0.2392157, 0, 1,
-1.682674, 0.4761266, -1.955436, 1, 0.2470588, 0, 1,
-1.625188, -1.285438, -1.640654, 1, 0.2509804, 0, 1,
-1.623188, -0.5752867, 0.2613588, 1, 0.2588235, 0, 1,
-1.610339, -1.014274, -0.8249436, 1, 0.2627451, 0, 1,
-1.580153, -0.6563296, 0.9465591, 1, 0.2705882, 0, 1,
-1.574513, 0.7052056, -0.06628004, 1, 0.2745098, 0, 1,
-1.555608, -0.7856479, -1.893185, 1, 0.282353, 0, 1,
-1.552742, 1.220913, 0.5582414, 1, 0.2862745, 0, 1,
-1.550938, 0.353808, -0.9468379, 1, 0.2941177, 0, 1,
-1.549015, -1.14453, -2.671766, 1, 0.3019608, 0, 1,
-1.548183, 0.4582973, 0.4466842, 1, 0.3058824, 0, 1,
-1.542352, -1.360527, -3.77086, 1, 0.3137255, 0, 1,
-1.530218, 2.334831, -0.676542, 1, 0.3176471, 0, 1,
-1.526143, -0.5685521, -1.927607, 1, 0.3254902, 0, 1,
-1.52258, 0.7341964, -1.736116, 1, 0.3294118, 0, 1,
-1.517678, -0.2246911, -2.449466, 1, 0.3372549, 0, 1,
-1.51141, -0.595971, 0.6564691, 1, 0.3411765, 0, 1,
-1.511243, 0.8841617, -0.976959, 1, 0.3490196, 0, 1,
-1.494681, 1.119686, -0.8548593, 1, 0.3529412, 0, 1,
-1.487061, -0.001312822, -2.852088, 1, 0.3607843, 0, 1,
-1.478374, -0.828165, -2.001303, 1, 0.3647059, 0, 1,
-1.474805, 0.5397162, -0.6543313, 1, 0.372549, 0, 1,
-1.473859, -0.1484226, -0.7335007, 1, 0.3764706, 0, 1,
-1.464114, -0.7212671, -2.613612, 1, 0.3843137, 0, 1,
-1.454428, 0.1016911, -2.6606, 1, 0.3882353, 0, 1,
-1.452813, 0.1656585, -3.015446, 1, 0.3960784, 0, 1,
-1.448816, 1.276518, -2.254978, 1, 0.4039216, 0, 1,
-1.445317, -0.6454926, -2.899866, 1, 0.4078431, 0, 1,
-1.443067, 1.869348, -0.5143075, 1, 0.4156863, 0, 1,
-1.441083, 0.2833548, -1.34121, 1, 0.4196078, 0, 1,
-1.440682, -0.2265462, -1.652763, 1, 0.427451, 0, 1,
-1.432887, -1.228641, -0.5584037, 1, 0.4313726, 0, 1,
-1.432768, 0.9262396, -1.000447, 1, 0.4392157, 0, 1,
-1.417708, 0.7585509, -0.7461438, 1, 0.4431373, 0, 1,
-1.415131, -0.7934689, -2.23843, 1, 0.4509804, 0, 1,
-1.408385, 0.9594811, -1.470042, 1, 0.454902, 0, 1,
-1.405773, -0.2754095, -1.510166, 1, 0.4627451, 0, 1,
-1.381686, -0.4357686, -1.749083, 1, 0.4666667, 0, 1,
-1.38159, 0.2102135, -2.005392, 1, 0.4745098, 0, 1,
-1.377918, 0.7310563, -0.1707114, 1, 0.4784314, 0, 1,
-1.367414, 0.1203469, -1.859494, 1, 0.4862745, 0, 1,
-1.366072, -0.5823548, 0.1569863, 1, 0.4901961, 0, 1,
-1.364384, -1.074267, -0.5819056, 1, 0.4980392, 0, 1,
-1.362753, 1.446731, -1.697932, 1, 0.5058824, 0, 1,
-1.351672, -0.08247166, -3.008516, 1, 0.509804, 0, 1,
-1.347576, 0.2856508, -0.3274016, 1, 0.5176471, 0, 1,
-1.334656, 0.5809872, -1.281237, 1, 0.5215687, 0, 1,
-1.333693, -0.1071853, -2.840989, 1, 0.5294118, 0, 1,
-1.33322, -0.4516979, -1.422671, 1, 0.5333334, 0, 1,
-1.333213, 0.3006586, -1.29313, 1, 0.5411765, 0, 1,
-1.332376, 1.661269, -0.1972768, 1, 0.5450981, 0, 1,
-1.31869, -0.5928811, -1.628329, 1, 0.5529412, 0, 1,
-1.314044, 0.5584118, 0.8125259, 1, 0.5568628, 0, 1,
-1.312932, -0.6030713, -2.966833, 1, 0.5647059, 0, 1,
-1.296691, 1.669655, 1.569088, 1, 0.5686275, 0, 1,
-1.29506, -1.274319, -2.072402, 1, 0.5764706, 0, 1,
-1.295015, 0.631889, 0.8618208, 1, 0.5803922, 0, 1,
-1.293392, -1.063877, -1.121161, 1, 0.5882353, 0, 1,
-1.287694, -0.3174556, -3.05693, 1, 0.5921569, 0, 1,
-1.286093, 0.9639103, 0.8618347, 1, 0.6, 0, 1,
-1.281023, 1.15964, -0.2977491, 1, 0.6078432, 0, 1,
-1.277173, 0.4870924, -1.453733, 1, 0.6117647, 0, 1,
-1.264484, -0.3684893, -2.472858, 1, 0.6196079, 0, 1,
-1.252613, 1.719608, -0.5908511, 1, 0.6235294, 0, 1,
-1.250315, -0.112628, -1.957778, 1, 0.6313726, 0, 1,
-1.250054, -0.4240737, -2.884332, 1, 0.6352941, 0, 1,
-1.249914, -1.043077, -2.735484, 1, 0.6431373, 0, 1,
-1.242405, -0.2684086, -0.7537909, 1, 0.6470588, 0, 1,
-1.235481, 1.004299, -1.247904, 1, 0.654902, 0, 1,
-1.227784, 1.33092, 0.3552016, 1, 0.6588235, 0, 1,
-1.223356, -0.339693, -2.70875, 1, 0.6666667, 0, 1,
-1.199145, 1.156382, -2.422807, 1, 0.6705883, 0, 1,
-1.197525, -1.91806, -2.301801, 1, 0.6784314, 0, 1,
-1.196967, -0.03866309, -0.4017411, 1, 0.682353, 0, 1,
-1.187919, -0.9010112, -1.622474, 1, 0.6901961, 0, 1,
-1.183059, 0.3534723, -0.4741636, 1, 0.6941177, 0, 1,
-1.182786, 1.149071, -0.4386412, 1, 0.7019608, 0, 1,
-1.181351, -0.4755255, -0.9705555, 1, 0.7098039, 0, 1,
-1.170973, -0.8260573, -2.902699, 1, 0.7137255, 0, 1,
-1.170561, 0.3005779, -0.6467021, 1, 0.7215686, 0, 1,
-1.167975, -1.537197, 0.1325223, 1, 0.7254902, 0, 1,
-1.164774, -0.7606615, -1.418982, 1, 0.7333333, 0, 1,
-1.154108, 1.184336, -0.9287839, 1, 0.7372549, 0, 1,
-1.148433, 0.8642961, -1.664492, 1, 0.7450981, 0, 1,
-1.146997, 0.4900524, -1.326382, 1, 0.7490196, 0, 1,
-1.143601, -1.316193, -1.192263, 1, 0.7568628, 0, 1,
-1.143516, -0.4320866, -3.052083, 1, 0.7607843, 0, 1,
-1.143245, -0.9102993, -1.702847, 1, 0.7686275, 0, 1,
-1.140734, 1.306501, -2.584928, 1, 0.772549, 0, 1,
-1.135805, -0.2968738, -4.102712, 1, 0.7803922, 0, 1,
-1.124636, -0.3173302, -2.018137, 1, 0.7843137, 0, 1,
-1.124372, 0.9696723, -0.262923, 1, 0.7921569, 0, 1,
-1.117103, 0.3898664, -0.5611084, 1, 0.7960784, 0, 1,
-1.114227, 2.084371, -0.6877715, 1, 0.8039216, 0, 1,
-1.111305, -2.421356, -2.309155, 1, 0.8117647, 0, 1,
-1.109779, -0.2247399, -2.285749, 1, 0.8156863, 0, 1,
-1.108593, 0.04438697, -1.140985, 1, 0.8235294, 0, 1,
-1.105413, 0.6055263, -0.9714385, 1, 0.827451, 0, 1,
-1.101472, 1.817743, -0.04344808, 1, 0.8352941, 0, 1,
-1.101278, -0.817997, -1.873645, 1, 0.8392157, 0, 1,
-1.100172, -1.277929, -3.10633, 1, 0.8470588, 0, 1,
-1.093684, 0.6777818, -1.587925, 1, 0.8509804, 0, 1,
-1.089723, -0.1013175, -1.755216, 1, 0.8588235, 0, 1,
-1.088506, -1.872754, -4.290561, 1, 0.8627451, 0, 1,
-1.088498, -1.646492, -1.517556, 1, 0.8705882, 0, 1,
-1.079036, -1.033442, -2.884617, 1, 0.8745098, 0, 1,
-1.076673, 0.5210382, -0.458546, 1, 0.8823529, 0, 1,
-1.062255, 1.038494, -0.5185032, 1, 0.8862745, 0, 1,
-1.059567, -1.067419, -0.5596328, 1, 0.8941177, 0, 1,
-1.054368, 0.9169629, -0.5685855, 1, 0.8980392, 0, 1,
-1.045479, 0.2259323, -1.582372, 1, 0.9058824, 0, 1,
-1.043897, -0.1817151, -1.538558, 1, 0.9137255, 0, 1,
-1.040842, 0.3327932, 0.6203232, 1, 0.9176471, 0, 1,
-1.039802, -0.09649091, -1.825733, 1, 0.9254902, 0, 1,
-1.035399, -0.7091234, -1.910029, 1, 0.9294118, 0, 1,
-1.032972, -0.2237696, -0.3616177, 1, 0.9372549, 0, 1,
-1.027614, -1.200288, -2.31218, 1, 0.9411765, 0, 1,
-1.027162, -0.1266574, -0.647954, 1, 0.9490196, 0, 1,
-1.025677, -0.293895, -0.8726426, 1, 0.9529412, 0, 1,
-1.020936, 0.6925223, 0.8887001, 1, 0.9607843, 0, 1,
-1.001443, -1.23136, -2.13082, 1, 0.9647059, 0, 1,
-0.9946737, -0.3296947, -2.507046, 1, 0.972549, 0, 1,
-0.9917676, 0.6895593, -2.277426, 1, 0.9764706, 0, 1,
-0.9887401, -0.6887806, -2.355398, 1, 0.9843137, 0, 1,
-0.9739165, 0.403994, 0.2340781, 1, 0.9882353, 0, 1,
-0.9687387, -1.36074, -3.095911, 1, 0.9960784, 0, 1,
-0.9574366, -0.7233594, -2.926359, 0.9960784, 1, 0, 1,
-0.9568885, 0.2453877, 0.4228792, 0.9921569, 1, 0, 1,
-0.9476112, -0.6024473, -2.229879, 0.9843137, 1, 0, 1,
-0.9472069, 1.022659, -0.1316082, 0.9803922, 1, 0, 1,
-0.9447456, -1.092729, -3.323059, 0.972549, 1, 0, 1,
-0.9437596, -3.046778, -3.296381, 0.9686275, 1, 0, 1,
-0.9368985, 0.2885187, -1.464679, 0.9607843, 1, 0, 1,
-0.9315572, 1.388806, -1.917006, 0.9568627, 1, 0, 1,
-0.9310682, -1.379824, -2.197414, 0.9490196, 1, 0, 1,
-0.9276115, 0.269771, -0.03425897, 0.945098, 1, 0, 1,
-0.9273534, -0.5131775, -0.5221217, 0.9372549, 1, 0, 1,
-0.9270642, 0.3353228, -1.845553, 0.9333333, 1, 0, 1,
-0.9185297, 2.026311, -2.39627, 0.9254902, 1, 0, 1,
-0.9148788, -0.7937582, -2.57925, 0.9215686, 1, 0, 1,
-0.9146141, -1.39215, -2.363552, 0.9137255, 1, 0, 1,
-0.9129339, 0.7290893, 1.311631, 0.9098039, 1, 0, 1,
-0.9097367, 0.4677952, -0.5639346, 0.9019608, 1, 0, 1,
-0.8995778, -0.4268768, -1.657317, 0.8941177, 1, 0, 1,
-0.894513, -0.4665374, -2.232759, 0.8901961, 1, 0, 1,
-0.8939469, -1.179873, -3.234562, 0.8823529, 1, 0, 1,
-0.8882373, -0.5799602, -0.8198614, 0.8784314, 1, 0, 1,
-0.888075, -1.339274, -2.814654, 0.8705882, 1, 0, 1,
-0.8858246, 0.2158771, -2.661919, 0.8666667, 1, 0, 1,
-0.8825405, -0.5513259, -2.378537, 0.8588235, 1, 0, 1,
-0.8792934, -0.1191562, 0.2589408, 0.854902, 1, 0, 1,
-0.8788851, -1.336037, -2.800809, 0.8470588, 1, 0, 1,
-0.8746952, -0.02989472, -1.116575, 0.8431373, 1, 0, 1,
-0.8716763, -0.2911356, -1.497394, 0.8352941, 1, 0, 1,
-0.8677729, -1.279798, -3.535968, 0.8313726, 1, 0, 1,
-0.8668258, 0.07991014, -0.9132324, 0.8235294, 1, 0, 1,
-0.861228, 0.915704, 1.57881, 0.8196079, 1, 0, 1,
-0.8599795, -0.9035695, -2.338298, 0.8117647, 1, 0, 1,
-0.8558391, 1.148576, -1.059802, 0.8078431, 1, 0, 1,
-0.8546401, 0.05554691, -1.701661, 0.8, 1, 0, 1,
-0.8537944, 1.003662, -0.4563626, 0.7921569, 1, 0, 1,
-0.8491865, -0.4534199, -1.26844, 0.7882353, 1, 0, 1,
-0.8428168, -1.674964, -2.812089, 0.7803922, 1, 0, 1,
-0.8389904, -0.9138833, -2.17398, 0.7764706, 1, 0, 1,
-0.8376361, -0.6281618, -2.163525, 0.7686275, 1, 0, 1,
-0.8351725, -1.777441, -5.807041, 0.7647059, 1, 0, 1,
-0.8301991, -1.037162, -3.361138, 0.7568628, 1, 0, 1,
-0.8276516, -0.4580874, -3.20655, 0.7529412, 1, 0, 1,
-0.8261888, 0.04355859, -3.227206, 0.7450981, 1, 0, 1,
-0.826164, -0.8077157, -2.859478, 0.7411765, 1, 0, 1,
-0.8195724, 0.5485736, -1.28581, 0.7333333, 1, 0, 1,
-0.8176819, 1.474955, -1.108346, 0.7294118, 1, 0, 1,
-0.8132564, -2.040646, -1.831779, 0.7215686, 1, 0, 1,
-0.8114967, -0.2921416, -1.269757, 0.7176471, 1, 0, 1,
-0.8106857, 0.3210927, -1.461351, 0.7098039, 1, 0, 1,
-0.8024032, 2.022544, -0.6289008, 0.7058824, 1, 0, 1,
-0.8001305, -0.5226662, -2.332912, 0.6980392, 1, 0, 1,
-0.7996998, 1.075491, -0.2982341, 0.6901961, 1, 0, 1,
-0.7976589, 0.7283564, -1.894917, 0.6862745, 1, 0, 1,
-0.7973185, 0.2807252, -2.053246, 0.6784314, 1, 0, 1,
-0.7910756, -1.657832, -3.205708, 0.6745098, 1, 0, 1,
-0.7861221, -0.02879862, -1.070708, 0.6666667, 1, 0, 1,
-0.784716, 1.211155, 0.3121612, 0.6627451, 1, 0, 1,
-0.7742925, 0.5646262, 0.1785826, 0.654902, 1, 0, 1,
-0.7673022, 0.796147, -2.537337, 0.6509804, 1, 0, 1,
-0.7638144, -1.267637, -3.782386, 0.6431373, 1, 0, 1,
-0.7600296, -1.424876, -2.198177, 0.6392157, 1, 0, 1,
-0.7572101, -0.4355069, -3.282868, 0.6313726, 1, 0, 1,
-0.7569585, 0.1898985, -2.584784, 0.627451, 1, 0, 1,
-0.7517576, -1.76288, -1.892418, 0.6196079, 1, 0, 1,
-0.7490696, -1.514047, -2.065707, 0.6156863, 1, 0, 1,
-0.7465017, -0.4174634, -2.511281, 0.6078432, 1, 0, 1,
-0.7463239, 0.4099414, -0.04502241, 0.6039216, 1, 0, 1,
-0.7417622, 1.061574, -0.1914603, 0.5960785, 1, 0, 1,
-0.7381166, 0.3983302, 0.6504111, 0.5882353, 1, 0, 1,
-0.7330544, 0.0397462, -0.326277, 0.5843138, 1, 0, 1,
-0.7283539, -0.1475352, -0.1421653, 0.5764706, 1, 0, 1,
-0.7265868, -0.7096652, -1.630996, 0.572549, 1, 0, 1,
-0.715135, -0.5332199, -2.36071, 0.5647059, 1, 0, 1,
-0.7120022, -0.02561552, 0.3587162, 0.5607843, 1, 0, 1,
-0.7116081, 1.000726, 0.02539197, 0.5529412, 1, 0, 1,
-0.7087979, 0.741449, -1.292571, 0.5490196, 1, 0, 1,
-0.7080953, -1.156524, -2.920069, 0.5411765, 1, 0, 1,
-0.7012838, 1.137492, -0.1527546, 0.5372549, 1, 0, 1,
-0.7005186, 2.499678, 0.1882403, 0.5294118, 1, 0, 1,
-0.6970388, -0.3999624, -1.518321, 0.5254902, 1, 0, 1,
-0.6937507, -1.124922, -0.3692037, 0.5176471, 1, 0, 1,
-0.6924089, -0.4265209, -2.770587, 0.5137255, 1, 0, 1,
-0.6896291, -0.8228165, -0.8447281, 0.5058824, 1, 0, 1,
-0.6808023, 0.2063643, -1.400325, 0.5019608, 1, 0, 1,
-0.678139, -1.046547, -1.115169, 0.4941176, 1, 0, 1,
-0.6717451, 0.7381822, -0.6069995, 0.4862745, 1, 0, 1,
-0.6716141, 0.04834725, -1.671244, 0.4823529, 1, 0, 1,
-0.661974, -0.7635661, -0.627916, 0.4745098, 1, 0, 1,
-0.6582922, 0.5718282, -1.581338, 0.4705882, 1, 0, 1,
-0.6535882, -0.4779636, -2.81402, 0.4627451, 1, 0, 1,
-0.6522041, -0.6167429, -3.191538, 0.4588235, 1, 0, 1,
-0.6511435, -0.2179118, -0.7332216, 0.4509804, 1, 0, 1,
-0.646253, 1.240551, -0.8682467, 0.4470588, 1, 0, 1,
-0.6454355, 0.04773672, -1.257704, 0.4392157, 1, 0, 1,
-0.6413002, -0.1706357, -1.02815, 0.4352941, 1, 0, 1,
-0.6391892, 0.7075943, -1.692651, 0.427451, 1, 0, 1,
-0.6378644, -1.193029, -2.004394, 0.4235294, 1, 0, 1,
-0.6371997, 2.533412, 0.7218488, 0.4156863, 1, 0, 1,
-0.6364534, 0.09513348, -1.763782, 0.4117647, 1, 0, 1,
-0.6224147, -0.3570761, -1.074452, 0.4039216, 1, 0, 1,
-0.6189066, 0.6892539, -1.525825, 0.3960784, 1, 0, 1,
-0.6181185, -1.519167, -3.658547, 0.3921569, 1, 0, 1,
-0.6143426, 1.232712, -2.418386, 0.3843137, 1, 0, 1,
-0.6097863, -0.6118822, -1.393481, 0.3803922, 1, 0, 1,
-0.6080788, -0.4263493, -0.6947545, 0.372549, 1, 0, 1,
-0.6079282, 0.4809974, -1.813249, 0.3686275, 1, 0, 1,
-0.6002939, -0.2124983, -0.8022469, 0.3607843, 1, 0, 1,
-0.5933314, -1.056884, -2.269963, 0.3568628, 1, 0, 1,
-0.5874013, -0.2926628, -2.253921, 0.3490196, 1, 0, 1,
-0.5853757, -0.6686152, -3.014769, 0.345098, 1, 0, 1,
-0.5783759, 0.8029906, 0.2111939, 0.3372549, 1, 0, 1,
-0.5744699, -0.6211967, -3.409144, 0.3333333, 1, 0, 1,
-0.5729577, 1.422686, -0.8574403, 0.3254902, 1, 0, 1,
-0.5718162, 0.07024035, -0.5026841, 0.3215686, 1, 0, 1,
-0.5711415, -0.5207935, -1.562643, 0.3137255, 1, 0, 1,
-0.56653, -1.872111, -2.66589, 0.3098039, 1, 0, 1,
-0.5630953, 0.2770634, -1.631522, 0.3019608, 1, 0, 1,
-0.5630857, -2.021604, -3.252682, 0.2941177, 1, 0, 1,
-0.5626255, 0.7301633, -1.317901, 0.2901961, 1, 0, 1,
-0.5568343, -2.224269, -1.39083, 0.282353, 1, 0, 1,
-0.5528212, 1.238089, -2.923226, 0.2784314, 1, 0, 1,
-0.5429357, 1.63784, -0.07913611, 0.2705882, 1, 0, 1,
-0.5359671, 1.417678, -2.48856, 0.2666667, 1, 0, 1,
-0.5358631, -0.5471562, 0.8486159, 0.2588235, 1, 0, 1,
-0.5325046, 0.8010077, -0.5111032, 0.254902, 1, 0, 1,
-0.5319697, -0.4165851, -2.483604, 0.2470588, 1, 0, 1,
-0.5316561, 0.707855, -0.8726103, 0.2431373, 1, 0, 1,
-0.5300228, 1.190416, -1.474139, 0.2352941, 1, 0, 1,
-0.5277489, 1.239878, -2.175534, 0.2313726, 1, 0, 1,
-0.5274669, -0.3710083, -2.54363, 0.2235294, 1, 0, 1,
-0.5265238, -0.237138, -2.013116, 0.2196078, 1, 0, 1,
-0.5171762, 1.038675, 1.092018, 0.2117647, 1, 0, 1,
-0.5133908, -0.2053547, -2.501168, 0.2078431, 1, 0, 1,
-0.5092021, -1.662958, -2.94773, 0.2, 1, 0, 1,
-0.5072243, 0.2391872, -1.3254, 0.1921569, 1, 0, 1,
-0.5066039, 0.0743201, -2.066668, 0.1882353, 1, 0, 1,
-0.4981104, -0.2592413, -0.957892, 0.1803922, 1, 0, 1,
-0.4943182, 0.5974478, -1.757937, 0.1764706, 1, 0, 1,
-0.4874485, -0.7131452, -2.789354, 0.1686275, 1, 0, 1,
-0.486807, 1.694687, -0.4410515, 0.1647059, 1, 0, 1,
-0.4866965, 0.2574343, -1.662641, 0.1568628, 1, 0, 1,
-0.4783494, 1.2295, -0.2904751, 0.1529412, 1, 0, 1,
-0.4771892, -1.84423, -2.73345, 0.145098, 1, 0, 1,
-0.4767053, 0.9363728, -0.3566912, 0.1411765, 1, 0, 1,
-0.4720662, -0.4587002, -4.209419, 0.1333333, 1, 0, 1,
-0.4716516, -1.373548, -2.601947, 0.1294118, 1, 0, 1,
-0.4713309, 1.786307, -0.2673555, 0.1215686, 1, 0, 1,
-0.466325, 1.575616, 1.757609, 0.1176471, 1, 0, 1,
-0.4644124, -0.02927983, -0.6409868, 0.1098039, 1, 0, 1,
-0.4640358, 0.6466792, -1.257578, 0.1058824, 1, 0, 1,
-0.4568153, -0.78315, -2.208767, 0.09803922, 1, 0, 1,
-0.4366001, -1.81724, -2.344148, 0.09019608, 1, 0, 1,
-0.4346937, 0.018211, -0.05265942, 0.08627451, 1, 0, 1,
-0.4327378, -1.038403, -2.742526, 0.07843138, 1, 0, 1,
-0.4278709, 0.6509617, -0.6544409, 0.07450981, 1, 0, 1,
-0.422685, 0.1101485, -2.237116, 0.06666667, 1, 0, 1,
-0.4204404, 0.5929559, -0.1013386, 0.0627451, 1, 0, 1,
-0.4192771, -0.613017, -1.1183, 0.05490196, 1, 0, 1,
-0.4147575, 0.2604743, 0.9431279, 0.05098039, 1, 0, 1,
-0.4123217, -0.608247, -2.350262, 0.04313726, 1, 0, 1,
-0.4118649, 0.8856993, -0.6716135, 0.03921569, 1, 0, 1,
-0.4010073, -0.3393958, -1.857995, 0.03137255, 1, 0, 1,
-0.4005158, -0.3636617, -3.149482, 0.02745098, 1, 0, 1,
-0.3993507, 0.6128128, -0.584177, 0.01960784, 1, 0, 1,
-0.3971778, -0.4472639, -2.571651, 0.01568628, 1, 0, 1,
-0.3955928, 1.151108, -0.5147558, 0.007843138, 1, 0, 1,
-0.3851455, 0.433623, 0.09862079, 0.003921569, 1, 0, 1,
-0.3818509, -0.4882467, -2.862327, 0, 1, 0.003921569, 1,
-0.3767684, 0.4054488, 0.480435, 0, 1, 0.01176471, 1,
-0.3721074, 0.55558, -2.240963, 0, 1, 0.01568628, 1,
-0.3656682, 1.764274, -0.877341, 0, 1, 0.02352941, 1,
-0.3656515, 0.05463095, -2.840619, 0, 1, 0.02745098, 1,
-0.3622672, 0.7155747, -0.6817856, 0, 1, 0.03529412, 1,
-0.3614991, -0.2750041, -2.36545, 0, 1, 0.03921569, 1,
-0.3610629, -1.152663, -4.155808, 0, 1, 0.04705882, 1,
-0.3605649, -0.9303174, -3.399626, 0, 1, 0.05098039, 1,
-0.3556275, -0.8391464, -3.32752, 0, 1, 0.05882353, 1,
-0.3555676, 1.121212, -0.2398581, 0, 1, 0.0627451, 1,
-0.3554441, -0.5444862, -4.687664, 0, 1, 0.07058824, 1,
-0.3548371, -0.52518, -1.294266, 0, 1, 0.07450981, 1,
-0.3546082, -0.8729458, -4.158822, 0, 1, 0.08235294, 1,
-0.3481064, -1.08185, -4.024764, 0, 1, 0.08627451, 1,
-0.3438338, 0.3289023, -0.3807596, 0, 1, 0.09411765, 1,
-0.343565, -0.214752, -2.674934, 0, 1, 0.1019608, 1,
-0.3397913, -0.7400733, -3.023678, 0, 1, 0.1058824, 1,
-0.3383975, -0.8004478, -1.774142, 0, 1, 0.1137255, 1,
-0.3353779, 1.109589, -2.065589, 0, 1, 0.1176471, 1,
-0.3345371, -1.098869, -2.353138, 0, 1, 0.1254902, 1,
-0.3302805, -2.054662, -2.929682, 0, 1, 0.1294118, 1,
-0.3278076, -0.9314937, -1.319577, 0, 1, 0.1372549, 1,
-0.3230219, 0.5916081, -3.13544, 0, 1, 0.1411765, 1,
-0.3180614, 0.303619, -0.9762973, 0, 1, 0.1490196, 1,
-0.3169022, 1.439466, -0.8172364, 0, 1, 0.1529412, 1,
-0.3153027, -1.311022, -3.889928, 0, 1, 0.1607843, 1,
-0.3135635, 1.935221, -0.6959268, 0, 1, 0.1647059, 1,
-0.3119151, -0.1915276, -3.728308, 0, 1, 0.172549, 1,
-0.3008858, -0.3898673, -1.708456, 0, 1, 0.1764706, 1,
-0.2981249, 0.3994054, 0.1656514, 0, 1, 0.1843137, 1,
-0.2977524, 0.1567619, -2.27116, 0, 1, 0.1882353, 1,
-0.2974403, -0.2449559, -1.829475, 0, 1, 0.1960784, 1,
-0.2943782, -2.25008, -2.673993, 0, 1, 0.2039216, 1,
-0.2934542, -0.07350077, -1.462685, 0, 1, 0.2078431, 1,
-0.2922906, 0.422042, 0.9169087, 0, 1, 0.2156863, 1,
-0.2919758, -0.1849116, -2.088403, 0, 1, 0.2196078, 1,
-0.2913168, 0.6583358, 0.532788, 0, 1, 0.227451, 1,
-0.2901769, -1.140354, -2.876454, 0, 1, 0.2313726, 1,
-0.2815171, 0.2890057, 0.5551018, 0, 1, 0.2392157, 1,
-0.2807793, -1.376869, -2.553204, 0, 1, 0.2431373, 1,
-0.2791989, -0.8341217, -2.858171, 0, 1, 0.2509804, 1,
-0.2769727, -1.883005, -3.711123, 0, 1, 0.254902, 1,
-0.2757042, 1.354044, 0.4035753, 0, 1, 0.2627451, 1,
-0.2743379, 1.073988, -0.4572094, 0, 1, 0.2666667, 1,
-0.2732475, -1.462956, -3.442924, 0, 1, 0.2745098, 1,
-0.270647, 0.8463426, -2.011828, 0, 1, 0.2784314, 1,
-0.2688662, 0.2211483, -1.334121, 0, 1, 0.2862745, 1,
-0.2679246, -0.7431508, -1.819663, 0, 1, 0.2901961, 1,
-0.2675162, 0.651512, 0.8134108, 0, 1, 0.2980392, 1,
-0.2600847, -0.0403932, -2.961368, 0, 1, 0.3058824, 1,
-0.2576698, -0.3571785, -1.552976, 0, 1, 0.3098039, 1,
-0.257571, 1.242354, 1.078219, 0, 1, 0.3176471, 1,
-0.2562827, 0.5984568, -0.4213621, 0, 1, 0.3215686, 1,
-0.2521581, -0.346669, -3.69111, 0, 1, 0.3294118, 1,
-0.2518648, -1.466466, -2.693712, 0, 1, 0.3333333, 1,
-0.2468876, 0.07227652, -2.013787, 0, 1, 0.3411765, 1,
-0.2466052, 1.194461, -0.04359148, 0, 1, 0.345098, 1,
-0.2454079, -0.4960208, -1.560402, 0, 1, 0.3529412, 1,
-0.245406, 2.45737, -1.281772, 0, 1, 0.3568628, 1,
-0.2452258, -0.5445881, -1.927843, 0, 1, 0.3647059, 1,
-0.2431551, 0.638759, -1.871914, 0, 1, 0.3686275, 1,
-0.2383115, -1.548761, -3.804121, 0, 1, 0.3764706, 1,
-0.2380098, -1.434039, -3.721604, 0, 1, 0.3803922, 1,
-0.2327259, -0.5061176, -2.453561, 0, 1, 0.3882353, 1,
-0.2301827, -0.9935806, -2.795899, 0, 1, 0.3921569, 1,
-0.2279768, -1.197059, -2.642671, 0, 1, 0.4, 1,
-0.2259061, -0.00782795, -1.1569, 0, 1, 0.4078431, 1,
-0.2232065, 0.4976957, -0.204621, 0, 1, 0.4117647, 1,
-0.219293, -0.5805058, -1.762703, 0, 1, 0.4196078, 1,
-0.2191466, 0.3979549, -0.6760519, 0, 1, 0.4235294, 1,
-0.2171054, 3.364561, -1.602384, 0, 1, 0.4313726, 1,
-0.2130298, -0.6506317, -2.077495, 0, 1, 0.4352941, 1,
-0.2124149, 0.5659081, -0.2557993, 0, 1, 0.4431373, 1,
-0.2056298, -0.1486904, -0.7240947, 0, 1, 0.4470588, 1,
-0.2035666, -1.218568, -1.844248, 0, 1, 0.454902, 1,
-0.2034367, 0.7172067, -0.4164923, 0, 1, 0.4588235, 1,
-0.2004772, 0.1362388, -0.3818469, 0, 1, 0.4666667, 1,
-0.1995454, -0.04720483, -1.7071, 0, 1, 0.4705882, 1,
-0.1993966, -0.2356781, -2.715561, 0, 1, 0.4784314, 1,
-0.1988915, 0.2920861, 0.09730969, 0, 1, 0.4823529, 1,
-0.1979287, -0.1811032, -0.2353718, 0, 1, 0.4901961, 1,
-0.1966841, -1.081364, -3.120173, 0, 1, 0.4941176, 1,
-0.1966755, 0.8050521, 0.9311367, 0, 1, 0.5019608, 1,
-0.1958459, 2.609244, -1.173102, 0, 1, 0.509804, 1,
-0.1939575, 1.293273, -1.546044, 0, 1, 0.5137255, 1,
-0.1927143, 1.716843, -0.03459441, 0, 1, 0.5215687, 1,
-0.1924036, -0.3676824, -1.8872, 0, 1, 0.5254902, 1,
-0.1920954, 1.144844, -0.9374079, 0, 1, 0.5333334, 1,
-0.19019, -0.6460007, -3.991139, 0, 1, 0.5372549, 1,
-0.188202, 0.2348584, -0.7898908, 0, 1, 0.5450981, 1,
-0.1878008, 2.04019, -0.8657919, 0, 1, 0.5490196, 1,
-0.1847192, -0.249364, -1.414327, 0, 1, 0.5568628, 1,
-0.1816903, -0.6699334, -2.734291, 0, 1, 0.5607843, 1,
-0.1675548, -1.414823, -2.087095, 0, 1, 0.5686275, 1,
-0.1549253, 0.49199, -0.8655037, 0, 1, 0.572549, 1,
-0.1519694, 0.05566407, -1.267717, 0, 1, 0.5803922, 1,
-0.1449452, 0.5993088, -1.193489, 0, 1, 0.5843138, 1,
-0.1439064, -0.7136084, -4.962368, 0, 1, 0.5921569, 1,
-0.1424074, -0.4344938, -3.32284, 0, 1, 0.5960785, 1,
-0.141489, 0.6565984, 0.5830212, 0, 1, 0.6039216, 1,
-0.139527, -0.3898208, -2.736862, 0, 1, 0.6117647, 1,
-0.1306167, 1.533526, -0.6242914, 0, 1, 0.6156863, 1,
-0.1304644, -0.5621547, -1.674476, 0, 1, 0.6235294, 1,
-0.1303562, 0.3639119, -2.844027, 0, 1, 0.627451, 1,
-0.1284269, 0.7940409, 0.7696421, 0, 1, 0.6352941, 1,
-0.1251446, 0.9990219, -0.1868495, 0, 1, 0.6392157, 1,
-0.1227774, -0.5079613, -3.203652, 0, 1, 0.6470588, 1,
-0.1170407, 0.6414623, -0.004894592, 0, 1, 0.6509804, 1,
-0.1165216, -1.53019, -4.363113, 0, 1, 0.6588235, 1,
-0.1151631, 1.487821, 0.09528319, 0, 1, 0.6627451, 1,
-0.1134364, -1.138166, -4.021345, 0, 1, 0.6705883, 1,
-0.1123723, -1.400423, -2.611991, 0, 1, 0.6745098, 1,
-0.1118795, -1.292097, -2.285151, 0, 1, 0.682353, 1,
-0.1103708, 0.5425062, -0.05141061, 0, 1, 0.6862745, 1,
-0.1047947, -1.628379, -4.295599, 0, 1, 0.6941177, 1,
-0.1033668, -0.1833937, -1.828707, 0, 1, 0.7019608, 1,
-0.1027662, 1.134276, 1.488253, 0, 1, 0.7058824, 1,
-0.09583656, 0.8772695, -0.1672148, 0, 1, 0.7137255, 1,
-0.09568617, 0.1343105, -2.727353, 0, 1, 0.7176471, 1,
-0.09235421, -0.3233849, -2.268997, 0, 1, 0.7254902, 1,
-0.09166203, -0.9293483, -3.310792, 0, 1, 0.7294118, 1,
-0.09125964, -0.04649199, -1.664343, 0, 1, 0.7372549, 1,
-0.09083698, -1.458343, -4.346653, 0, 1, 0.7411765, 1,
-0.0881128, -0.4691601, -2.3373, 0, 1, 0.7490196, 1,
-0.08512523, -0.7774285, -1.78372, 0, 1, 0.7529412, 1,
-0.08423911, -0.6735397, -3.846852, 0, 1, 0.7607843, 1,
-0.08339863, -1.462433, -3.688334, 0, 1, 0.7647059, 1,
-0.08289435, 1.267237, 1.618956, 0, 1, 0.772549, 1,
-0.08113484, -0.8463067, -2.476909, 0, 1, 0.7764706, 1,
-0.07924334, -0.2880418, -3.716483, 0, 1, 0.7843137, 1,
-0.07694392, -1.196223, -3.770521, 0, 1, 0.7882353, 1,
-0.07655462, 0.6117557, -0.2799672, 0, 1, 0.7960784, 1,
-0.07555825, 1.456472, 0.2247183, 0, 1, 0.8039216, 1,
-0.07550572, -0.448951, -1.559624, 0, 1, 0.8078431, 1,
-0.07537255, -0.5937582, -1.695284, 0, 1, 0.8156863, 1,
-0.07477497, 0.1046405, -0.4042285, 0, 1, 0.8196079, 1,
-0.06966107, -0.5373574, -2.439624, 0, 1, 0.827451, 1,
-0.06891643, 1.339475, -0.1381792, 0, 1, 0.8313726, 1,
-0.06839528, -0.01564752, 1.083915, 0, 1, 0.8392157, 1,
-0.06359313, -1.125379, -3.721401, 0, 1, 0.8431373, 1,
-0.06149063, 0.06296175, -0.3867442, 0, 1, 0.8509804, 1,
-0.06012663, 0.2731611, 0.7164618, 0, 1, 0.854902, 1,
-0.05778772, -0.4003533, -2.161608, 0, 1, 0.8627451, 1,
-0.05542362, -1.471038, -1.842334, 0, 1, 0.8666667, 1,
-0.05083986, 0.6774381, -0.54721, 0, 1, 0.8745098, 1,
-0.04931234, 0.02264496, -0.6075107, 0, 1, 0.8784314, 1,
-0.04361581, 0.83902, 0.5465164, 0, 1, 0.8862745, 1,
-0.03929153, 1.822094, -0.6245396, 0, 1, 0.8901961, 1,
-0.03884137, 1.417807, 0.6613325, 0, 1, 0.8980392, 1,
-0.03829515, -0.8759254, -3.048436, 0, 1, 0.9058824, 1,
-0.03819164, 0.2171221, -0.3475726, 0, 1, 0.9098039, 1,
-0.03322623, -0.6508498, -4.057407, 0, 1, 0.9176471, 1,
-0.02765466, 0.4331181, -1.064275, 0, 1, 0.9215686, 1,
-0.02522768, -0.1632891, -4.551842, 0, 1, 0.9294118, 1,
-0.02301098, 0.524134, 1.612736, 0, 1, 0.9333333, 1,
-0.02277198, -1.018748, -2.266912, 0, 1, 0.9411765, 1,
-0.02174182, -0.07342649, -3.12604, 0, 1, 0.945098, 1,
-0.01965206, 0.1652856, 0.3839095, 0, 1, 0.9529412, 1,
-0.0194623, 0.902414, 0.4478091, 0, 1, 0.9568627, 1,
-0.01891009, -1.948604, -4.26923, 0, 1, 0.9647059, 1,
-0.01777852, 0.1134196, -0.7379583, 0, 1, 0.9686275, 1,
-0.01656342, -0.08059198, -3.215469, 0, 1, 0.9764706, 1,
-0.009689829, -1.375694, -2.875793, 0, 1, 0.9803922, 1,
-0.00749771, -0.1962309, -4.965381, 0, 1, 0.9882353, 1,
-0.007129561, -0.2582266, -1.999019, 0, 1, 0.9921569, 1,
-0.003325278, 0.433819, -2.237437, 0, 1, 1, 1,
-0.002782863, -0.3818968, -1.161707, 0, 0.9921569, 1, 1,
-0.001737797, -0.8583317, -3.948296, 0, 0.9882353, 1, 1,
-0.000914648, -1.276133, -2.568711, 0, 0.9803922, 1, 1,
-0.0005157065, 0.4598823, 0.4187013, 0, 0.9764706, 1, 1,
0.00156671, -1.132078, 3.795261, 0, 0.9686275, 1, 1,
0.002366245, 1.865345, 0.7921421, 0, 0.9647059, 1, 1,
0.003008516, 0.4550068, -0.2038949, 0, 0.9568627, 1, 1,
0.00428404, 0.1820941, -1.499181, 0, 0.9529412, 1, 1,
0.006358759, -0.7524002, 4.385994, 0, 0.945098, 1, 1,
0.01106824, 1.474718, 0.2591107, 0, 0.9411765, 1, 1,
0.01204372, -0.4745163, 3.123215, 0, 0.9333333, 1, 1,
0.01444881, -1.24158, 4.45365, 0, 0.9294118, 1, 1,
0.01599295, 0.1088385, -1.458151, 0, 0.9215686, 1, 1,
0.02221571, -1.334671, 3.946679, 0, 0.9176471, 1, 1,
0.02337973, 1.730796, -0.6753185, 0, 0.9098039, 1, 1,
0.02452384, -1.162327, 4.916424, 0, 0.9058824, 1, 1,
0.03108274, 0.3813346, 2.321484, 0, 0.8980392, 1, 1,
0.03137253, 0.4465401, 0.7317606, 0, 0.8901961, 1, 1,
0.03454853, -0.3411977, 2.878235, 0, 0.8862745, 1, 1,
0.04441207, -1.245281, 2.890209, 0, 0.8784314, 1, 1,
0.04649384, -0.4026891, 3.334033, 0, 0.8745098, 1, 1,
0.0499181, 1.199098, 0.8078496, 0, 0.8666667, 1, 1,
0.05079846, -0.9823562, 1.639494, 0, 0.8627451, 1, 1,
0.05150381, -0.5707856, 2.592251, 0, 0.854902, 1, 1,
0.05247202, 1.332841, 0.07638498, 0, 0.8509804, 1, 1,
0.05468101, -0.1018735, 3.860185, 0, 0.8431373, 1, 1,
0.05886538, -1.060601, 5.694913, 0, 0.8392157, 1, 1,
0.06047628, -0.628287, 2.598831, 0, 0.8313726, 1, 1,
0.06706046, 0.3569286, 0.2471678, 0, 0.827451, 1, 1,
0.07207479, -2.3727, 2.11884, 0, 0.8196079, 1, 1,
0.0763218, -0.8301126, 2.192197, 0, 0.8156863, 1, 1,
0.0767416, -0.08513473, 2.522656, 0, 0.8078431, 1, 1,
0.07685698, -0.6358907, 3.747217, 0, 0.8039216, 1, 1,
0.07789688, 1.3416, 0.2775662, 0, 0.7960784, 1, 1,
0.07941359, -0.9686845, 1.754419, 0, 0.7882353, 1, 1,
0.07998805, 0.2794209, 1.700045, 0, 0.7843137, 1, 1,
0.08119602, -0.3023019, 2.778595, 0, 0.7764706, 1, 1,
0.08661439, -0.527464, 3.494936, 0, 0.772549, 1, 1,
0.09011697, -1.285393, 2.810131, 0, 0.7647059, 1, 1,
0.09130639, 2.021976, -1.822741, 0, 0.7607843, 1, 1,
0.09356076, -0.6987824, 3.110318, 0, 0.7529412, 1, 1,
0.09361418, 0.5199807, -0.2808212, 0, 0.7490196, 1, 1,
0.09652597, -1.155058, 1.69379, 0, 0.7411765, 1, 1,
0.09923952, 0.6289543, -0.5674812, 0, 0.7372549, 1, 1,
0.1008294, -0.1424439, 3.794499, 0, 0.7294118, 1, 1,
0.101765, -0.1182786, 2.862725, 0, 0.7254902, 1, 1,
0.101844, 0.7250389, -0.116332, 0, 0.7176471, 1, 1,
0.1057475, -0.01820774, 1.019427, 0, 0.7137255, 1, 1,
0.1063893, 0.4774787, -1.407719, 0, 0.7058824, 1, 1,
0.1065803, 1.85095, 1.104976, 0, 0.6980392, 1, 1,
0.1072244, 1.302654, -0.1037432, 0, 0.6941177, 1, 1,
0.112185, 1.329539, -0.8952489, 0, 0.6862745, 1, 1,
0.114032, -0.9444292, 3.757583, 0, 0.682353, 1, 1,
0.1200938, -0.6752509, 3.918263, 0, 0.6745098, 1, 1,
0.1244114, 1.234275, -0.8485556, 0, 0.6705883, 1, 1,
0.1263618, -0.3549042, 2.666263, 0, 0.6627451, 1, 1,
0.1281544, 1.616194, -0.8707746, 0, 0.6588235, 1, 1,
0.1297016, 0.02677892, 2.180186, 0, 0.6509804, 1, 1,
0.1309689, -1.724815, 4.228958, 0, 0.6470588, 1, 1,
0.1313713, 0.2939664, 1.459286, 0, 0.6392157, 1, 1,
0.1334969, 2.337785, 0.08229597, 0, 0.6352941, 1, 1,
0.1350474, -1.48883, 2.383791, 0, 0.627451, 1, 1,
0.1364693, -0.2917207, 1.760677, 0, 0.6235294, 1, 1,
0.1365945, 0.4546149, -1.616471, 0, 0.6156863, 1, 1,
0.1384262, 0.583105, 1.423426, 0, 0.6117647, 1, 1,
0.1394895, 1.742993, 1.064131, 0, 0.6039216, 1, 1,
0.1406971, -0.006824318, 2.053122, 0, 0.5960785, 1, 1,
0.1412375, -1.14908, 3.003356, 0, 0.5921569, 1, 1,
0.1468076, -0.2946578, 4.204009, 0, 0.5843138, 1, 1,
0.1522324, -1.421264, 1.922697, 0, 0.5803922, 1, 1,
0.1598176, 0.001614092, 1.983825, 0, 0.572549, 1, 1,
0.1625746, -1.593917, 2.262624, 0, 0.5686275, 1, 1,
0.1637053, 0.6514849, 0.6529216, 0, 0.5607843, 1, 1,
0.1699131, -0.02579346, 2.702705, 0, 0.5568628, 1, 1,
0.1732182, 0.6905705, -1.347718, 0, 0.5490196, 1, 1,
0.175721, -0.00848052, 2.498653, 0, 0.5450981, 1, 1,
0.1757491, 1.311434, 0.7305744, 0, 0.5372549, 1, 1,
0.177838, 0.2996262, 1.314973, 0, 0.5333334, 1, 1,
0.1787252, -1.095598, 1.760822, 0, 0.5254902, 1, 1,
0.1801456, -0.4489692, 2.442936, 0, 0.5215687, 1, 1,
0.1805722, 1.432816, -0.576062, 0, 0.5137255, 1, 1,
0.1809625, -0.006217724, 1.531192, 0, 0.509804, 1, 1,
0.1815957, -1.554847, 3.43804, 0, 0.5019608, 1, 1,
0.1819227, -0.8687298, 1.509295, 0, 0.4941176, 1, 1,
0.1825824, -0.8114208, 3.389915, 0, 0.4901961, 1, 1,
0.1835784, -0.5871053, 3.040031, 0, 0.4823529, 1, 1,
0.1855943, -1.146862, 2.965626, 0, 0.4784314, 1, 1,
0.1856356, -0.1070269, 4.549526, 0, 0.4705882, 1, 1,
0.1856907, 0.6368286, 0.7123035, 0, 0.4666667, 1, 1,
0.1862655, -0.4176089, 3.365989, 0, 0.4588235, 1, 1,
0.1886984, -0.1066865, 2.991589, 0, 0.454902, 1, 1,
0.189461, 0.05440526, 0.707171, 0, 0.4470588, 1, 1,
0.1930356, -0.9653546, 2.63617, 0, 0.4431373, 1, 1,
0.1971571, 0.231615, 2.099889, 0, 0.4352941, 1, 1,
0.1982132, -0.6552653, 1.343676, 0, 0.4313726, 1, 1,
0.1992161, 0.09714352, 1.383551, 0, 0.4235294, 1, 1,
0.200909, 1.119938, -0.9849465, 0, 0.4196078, 1, 1,
0.2081302, 0.007444597, 1.017906, 0, 0.4117647, 1, 1,
0.2081888, -1.529735, 2.288882, 0, 0.4078431, 1, 1,
0.2112266, -0.00423613, 1.447579, 0, 0.4, 1, 1,
0.2121555, 0.895086, -0.4169426, 0, 0.3921569, 1, 1,
0.213886, -1.035838, 2.850481, 0, 0.3882353, 1, 1,
0.216516, 0.9700367, 0.998785, 0, 0.3803922, 1, 1,
0.2175816, 0.644133, -1.577447, 0, 0.3764706, 1, 1,
0.2195659, 0.2721286, 0.8524243, 0, 0.3686275, 1, 1,
0.2195892, 0.8147357, 0.674891, 0, 0.3647059, 1, 1,
0.2208672, 1.541162, 1.439707, 0, 0.3568628, 1, 1,
0.2213235, 0.1456631, 1.0033, 0, 0.3529412, 1, 1,
0.2269737, -0.6285322, 3.198842, 0, 0.345098, 1, 1,
0.2318399, -0.4300137, 2.388747, 0, 0.3411765, 1, 1,
0.2357604, 1.507985, 0.5937853, 0, 0.3333333, 1, 1,
0.2478199, 0.2135158, 0.8017844, 0, 0.3294118, 1, 1,
0.2489812, 0.4807417, 0.1429598, 0, 0.3215686, 1, 1,
0.2515047, 0.2861179, 0.8057575, 0, 0.3176471, 1, 1,
0.2567667, 3.053945, -2.25758, 0, 0.3098039, 1, 1,
0.2584063, 1.027293, 0.4698487, 0, 0.3058824, 1, 1,
0.2663463, -0.8019937, -0.6614847, 0, 0.2980392, 1, 1,
0.268023, 1.072728, -0.8663374, 0, 0.2901961, 1, 1,
0.2710836, -2.03757, 1.864884, 0, 0.2862745, 1, 1,
0.2731951, -1.333316, 2.729537, 0, 0.2784314, 1, 1,
0.2748157, 0.01937444, 0.621803, 0, 0.2745098, 1, 1,
0.2781959, 0.5523492, -0.3606432, 0, 0.2666667, 1, 1,
0.2785662, -1.348046, 2.724419, 0, 0.2627451, 1, 1,
0.2829413, -0.6833267, 2.804038, 0, 0.254902, 1, 1,
0.2834646, 1.542419, 2.786735, 0, 0.2509804, 1, 1,
0.2941082, -0.2270222, 2.249912, 0, 0.2431373, 1, 1,
0.2952916, -0.8159268, 2.623121, 0, 0.2392157, 1, 1,
0.2953, -0.2685686, 1.813449, 0, 0.2313726, 1, 1,
0.2965167, -0.9906352, 1.879068, 0, 0.227451, 1, 1,
0.296801, 0.3123729, 0.9918671, 0, 0.2196078, 1, 1,
0.2995189, 1.695896, 0.01157552, 0, 0.2156863, 1, 1,
0.3003016, 1.198526, 1.894008, 0, 0.2078431, 1, 1,
0.3029808, 0.8029, 2.602021, 0, 0.2039216, 1, 1,
0.3032777, -1.136608, 2.85778, 0, 0.1960784, 1, 1,
0.3043756, -0.4696582, 2.335676, 0, 0.1882353, 1, 1,
0.3066435, -0.2960973, 1.539337, 0, 0.1843137, 1, 1,
0.3068948, -1.804949, 1.142319, 0, 0.1764706, 1, 1,
0.3124485, 0.9932954, -0.009223158, 0, 0.172549, 1, 1,
0.3148775, 0.3844818, 1.513486, 0, 0.1647059, 1, 1,
0.3175719, 0.984969, 3.278008, 0, 0.1607843, 1, 1,
0.3242008, -1.410564, 2.672688, 0, 0.1529412, 1, 1,
0.3261828, -0.6156546, 1.544927, 0, 0.1490196, 1, 1,
0.3299338, 1.53264, -0.3079213, 0, 0.1411765, 1, 1,
0.3309773, 0.5083582, 1.411954, 0, 0.1372549, 1, 1,
0.3318048, -0.1784891, 0.9097962, 0, 0.1294118, 1, 1,
0.3321703, -0.9557779, 1.208054, 0, 0.1254902, 1, 1,
0.3329566, 2.945128, -0.7702781, 0, 0.1176471, 1, 1,
0.3334758, 2.638499, -0.9581347, 0, 0.1137255, 1, 1,
0.3362871, -0.7363228, 4.443351, 0, 0.1058824, 1, 1,
0.3374153, -0.02728273, 0.9206505, 0, 0.09803922, 1, 1,
0.3404866, -1.640859, 1.725758, 0, 0.09411765, 1, 1,
0.341529, 0.5328391, -0.8430762, 0, 0.08627451, 1, 1,
0.3428911, -1.030768, 1.944607, 0, 0.08235294, 1, 1,
0.3431876, 0.6532987, 0.6263504, 0, 0.07450981, 1, 1,
0.3458761, 0.2888587, 0.4567197, 0, 0.07058824, 1, 1,
0.3523286, 1.267851, -0.3062027, 0, 0.0627451, 1, 1,
0.3530649, 0.3653981, 0.7299277, 0, 0.05882353, 1, 1,
0.3533584, -0.5047925, 3.315321, 0, 0.05098039, 1, 1,
0.3561977, 0.2509013, 2.513765, 0, 0.04705882, 1, 1,
0.3624712, 0.7767515, 0.1850932, 0, 0.03921569, 1, 1,
0.3625544, 0.1843226, 1.35125, 0, 0.03529412, 1, 1,
0.363009, 0.04190117, 0.5917938, 0, 0.02745098, 1, 1,
0.3659762, 0.3285935, 0.004229069, 0, 0.02352941, 1, 1,
0.3682019, -2.13089, 2.665614, 0, 0.01568628, 1, 1,
0.376338, 3.025229, 1.236361, 0, 0.01176471, 1, 1,
0.3771594, 0.648367, -0.4916687, 0, 0.003921569, 1, 1,
0.3794008, -1.524876, 3.572182, 0.003921569, 0, 1, 1,
0.3794999, 0.8380394, 1.347234, 0.007843138, 0, 1, 1,
0.3855894, 1.527772, -0.1714741, 0.01568628, 0, 1, 1,
0.3894324, -0.06766196, 1.664791, 0.01960784, 0, 1, 1,
0.3947547, -2.556244, 3.071913, 0.02745098, 0, 1, 1,
0.3949262, 0.9617241, 0.7673796, 0.03137255, 0, 1, 1,
0.3977215, -0.2726858, 2.560504, 0.03921569, 0, 1, 1,
0.3986844, -2.682973, 4.693199, 0.04313726, 0, 1, 1,
0.3997849, -1.042167, 3.380113, 0.05098039, 0, 1, 1,
0.4098331, 0.2153675, 0.5933853, 0.05490196, 0, 1, 1,
0.4155958, 0.8250923, 2.111945, 0.0627451, 0, 1, 1,
0.4194831, -0.1550034, 2.478996, 0.06666667, 0, 1, 1,
0.420679, 0.09192593, 2.055335, 0.07450981, 0, 1, 1,
0.4235464, 0.1667241, 0.928862, 0.07843138, 0, 1, 1,
0.4244571, 1.095239, 0.2545203, 0.08627451, 0, 1, 1,
0.4285365, 0.333822, 2.439094, 0.09019608, 0, 1, 1,
0.4318393, -0.2865825, 1.967818, 0.09803922, 0, 1, 1,
0.433383, 1.722427, -0.6682678, 0.1058824, 0, 1, 1,
0.4372574, 0.02999244, 2.450866, 0.1098039, 0, 1, 1,
0.4383585, -0.3542618, 1.119114, 0.1176471, 0, 1, 1,
0.4390427, -0.6725525, 2.613495, 0.1215686, 0, 1, 1,
0.4403047, -0.8809991, 4.253463, 0.1294118, 0, 1, 1,
0.4421027, -0.7791081, 1.976762, 0.1333333, 0, 1, 1,
0.4466433, -0.8952751, 1.656567, 0.1411765, 0, 1, 1,
0.4528418, -1.058132, 1.706783, 0.145098, 0, 1, 1,
0.453047, -0.4502588, 1.758397, 0.1529412, 0, 1, 1,
0.4596836, 0.6028169, 2.432321, 0.1568628, 0, 1, 1,
0.4669505, -0.2964081, 2.004843, 0.1647059, 0, 1, 1,
0.4682016, -0.8383808, 2.420018, 0.1686275, 0, 1, 1,
0.4690809, 1.29653, -0.09798431, 0.1764706, 0, 1, 1,
0.4734116, 1.218223, 0.1841158, 0.1803922, 0, 1, 1,
0.4760075, -1.275683, 0.9922093, 0.1882353, 0, 1, 1,
0.4813314, 1.706379, 1.02107, 0.1921569, 0, 1, 1,
0.4830768, 0.3784954, 0.5090093, 0.2, 0, 1, 1,
0.483152, 0.2436407, 1.248139, 0.2078431, 0, 1, 1,
0.4859172, -1.509155, 3.648467, 0.2117647, 0, 1, 1,
0.4916431, -0.3888592, 2.192253, 0.2196078, 0, 1, 1,
0.4938072, 0.6190915, 1.842967, 0.2235294, 0, 1, 1,
0.4955069, 2.771175, -0.4978357, 0.2313726, 0, 1, 1,
0.4975037, 0.8773474, -1.782371, 0.2352941, 0, 1, 1,
0.5037854, -1.572928, 3.092686, 0.2431373, 0, 1, 1,
0.5072919, 0.9197969, 0.09746403, 0.2470588, 0, 1, 1,
0.5081339, -0.7479929, 1.098325, 0.254902, 0, 1, 1,
0.510355, 0.1697242, 1.199583, 0.2588235, 0, 1, 1,
0.5105121, 0.35043, 0.8181303, 0.2666667, 0, 1, 1,
0.5207409, -0.1760573, 1.002405, 0.2705882, 0, 1, 1,
0.5279784, -1.917235, 2.38067, 0.2784314, 0, 1, 1,
0.5342147, 0.8439054, -0.464457, 0.282353, 0, 1, 1,
0.5377748, 0.5134776, 0.2894949, 0.2901961, 0, 1, 1,
0.539896, 0.3822137, 1.902813, 0.2941177, 0, 1, 1,
0.5453062, -0.6832868, 2.800794, 0.3019608, 0, 1, 1,
0.5610201, 0.9669311, 1.174849, 0.3098039, 0, 1, 1,
0.5681936, -0.484085, 1.687921, 0.3137255, 0, 1, 1,
0.5683737, -1.060816, 2.119683, 0.3215686, 0, 1, 1,
0.5730487, 0.7348471, 1.823931, 0.3254902, 0, 1, 1,
0.5734856, 0.5509568, 0.4059207, 0.3333333, 0, 1, 1,
0.5833473, -0.3549174, -0.3434047, 0.3372549, 0, 1, 1,
0.5845648, 0.3103336, 1.078727, 0.345098, 0, 1, 1,
0.585338, 0.3325674, 0.792045, 0.3490196, 0, 1, 1,
0.5865342, 0.7440857, 0.583469, 0.3568628, 0, 1, 1,
0.5867388, 0.2934103, 0.7071661, 0.3607843, 0, 1, 1,
0.5872636, -2.546103, 2.545032, 0.3686275, 0, 1, 1,
0.5921385, -0.3867625, 4.581683, 0.372549, 0, 1, 1,
0.5976352, -1.333579, 1.771541, 0.3803922, 0, 1, 1,
0.6005399, -0.5473441, 3.193907, 0.3843137, 0, 1, 1,
0.6027402, 0.1542131, 1.773991, 0.3921569, 0, 1, 1,
0.6110278, -0.3407934, 2.713118, 0.3960784, 0, 1, 1,
0.6111788, -0.7287126, 1.097042, 0.4039216, 0, 1, 1,
0.6138764, 0.8095465, 0.367958, 0.4117647, 0, 1, 1,
0.6179868, 1.053108, 0.9037622, 0.4156863, 0, 1, 1,
0.6219645, 0.2248012, 1.894855, 0.4235294, 0, 1, 1,
0.6233487, -0.8433905, 2.385214, 0.427451, 0, 1, 1,
0.6235585, 0.3858475, 0.1275742, 0.4352941, 0, 1, 1,
0.6338856, 1.004369, -0.05960533, 0.4392157, 0, 1, 1,
0.6340428, -1.215632, 1.440364, 0.4470588, 0, 1, 1,
0.6359734, -0.3068667, 2.91048, 0.4509804, 0, 1, 1,
0.6373028, -0.4009372, 1.434573, 0.4588235, 0, 1, 1,
0.6405817, 2.153098, -0.6560226, 0.4627451, 0, 1, 1,
0.6409499, -2.126515, 2.47369, 0.4705882, 0, 1, 1,
0.6423286, -0.7160728, 2.105882, 0.4745098, 0, 1, 1,
0.6444049, 0.820943, -0.09122808, 0.4823529, 0, 1, 1,
0.6450077, 1.601454, -0.06601109, 0.4862745, 0, 1, 1,
0.6468993, -0.2766063, 1.776097, 0.4941176, 0, 1, 1,
0.6485609, -1.307575, 2.814037, 0.5019608, 0, 1, 1,
0.6517364, 0.3728309, -0.8943908, 0.5058824, 0, 1, 1,
0.651992, -0.8828962, 2.670384, 0.5137255, 0, 1, 1,
0.6530225, 0.7138206, 3.139211, 0.5176471, 0, 1, 1,
0.6541516, -0.03959246, 0.8392267, 0.5254902, 0, 1, 1,
0.656029, -0.1067507, 0.2408038, 0.5294118, 0, 1, 1,
0.6664545, 0.3789731, 1.005035, 0.5372549, 0, 1, 1,
0.6768706, -0.3639322, 0.9200347, 0.5411765, 0, 1, 1,
0.6781355, 0.1285674, 0.2468523, 0.5490196, 0, 1, 1,
0.6784779, 0.7299951, 0.16654, 0.5529412, 0, 1, 1,
0.6823646, -0.5465579, 0.7131892, 0.5607843, 0, 1, 1,
0.6841466, 1.288453, 0.4601571, 0.5647059, 0, 1, 1,
0.6854585, 0.1424905, 1.472304, 0.572549, 0, 1, 1,
0.6916922, -0.5054493, 0.7103308, 0.5764706, 0, 1, 1,
0.6941406, 0.9048252, 2.226088, 0.5843138, 0, 1, 1,
0.6968163, -0.7292174, 2.868628, 0.5882353, 0, 1, 1,
0.698316, 0.149582, 1.702225, 0.5960785, 0, 1, 1,
0.7025216, 1.225398, -0.6348962, 0.6039216, 0, 1, 1,
0.7054262, -0.6385128, 2.048585, 0.6078432, 0, 1, 1,
0.7100254, -1.069116, 2.226628, 0.6156863, 0, 1, 1,
0.7139177, 0.5594656, 1.823088, 0.6196079, 0, 1, 1,
0.7172571, 0.4245087, 0.3780294, 0.627451, 0, 1, 1,
0.719539, -0.3468409, 1.275785, 0.6313726, 0, 1, 1,
0.7285804, -0.6866183, 4.076119, 0.6392157, 0, 1, 1,
0.7341714, -2.368072, 2.793223, 0.6431373, 0, 1, 1,
0.7405488, 0.3933852, 2.272068, 0.6509804, 0, 1, 1,
0.7449605, 0.8763876, 1.822236, 0.654902, 0, 1, 1,
0.7505202, 0.9619568, 1.911976, 0.6627451, 0, 1, 1,
0.7510839, 0.3183725, 1.030899, 0.6666667, 0, 1, 1,
0.7541866, -1.346113, 1.552102, 0.6745098, 0, 1, 1,
0.7569767, -0.9216936, 1.921576, 0.6784314, 0, 1, 1,
0.7611121, -0.7145094, 2.676097, 0.6862745, 0, 1, 1,
0.7669658, -1.163256, 2.366169, 0.6901961, 0, 1, 1,
0.7674059, 0.3728658, 2.332777, 0.6980392, 0, 1, 1,
0.7705513, -0.8064337, 3.479867, 0.7058824, 0, 1, 1,
0.7716539, 0.410764, 1.368034, 0.7098039, 0, 1, 1,
0.7734177, -1.903034, 2.362183, 0.7176471, 0, 1, 1,
0.7757537, 0.05822947, 1.337312, 0.7215686, 0, 1, 1,
0.7769368, -1.522135, 3.059106, 0.7294118, 0, 1, 1,
0.7816862, 1.291626, 0.3558698, 0.7333333, 0, 1, 1,
0.7894621, -0.001595132, 1.169964, 0.7411765, 0, 1, 1,
0.793252, 0.6847095, 0.4707344, 0.7450981, 0, 1, 1,
0.7949328, -0.2159412, 2.322476, 0.7529412, 0, 1, 1,
0.8035311, 0.2215396, -0.5629669, 0.7568628, 0, 1, 1,
0.8112295, -2.106101, 1.250999, 0.7647059, 0, 1, 1,
0.8132967, -1.239404, 4.472108, 0.7686275, 0, 1, 1,
0.8243611, -1.111874, 2.680327, 0.7764706, 0, 1, 1,
0.8250754, -1.246754, 4.086287, 0.7803922, 0, 1, 1,
0.8252059, 0.685522, 2.000739, 0.7882353, 0, 1, 1,
0.8305737, -1.103993, 1.830704, 0.7921569, 0, 1, 1,
0.8358118, -0.7671565, 1.470885, 0.8, 0, 1, 1,
0.8377053, -0.1995414, 0.8448373, 0.8078431, 0, 1, 1,
0.8388388, -1.820053, 3.567776, 0.8117647, 0, 1, 1,
0.8413433, 0.8318239, 1.510817, 0.8196079, 0, 1, 1,
0.8442996, 0.9505996, 0.398422, 0.8235294, 0, 1, 1,
0.8452775, 1.650839, 1.052347, 0.8313726, 0, 1, 1,
0.8506246, -1.365651, 2.785991, 0.8352941, 0, 1, 1,
0.8510363, 1.307266, -0.3244116, 0.8431373, 0, 1, 1,
0.8517014, -0.1904977, 1.05691, 0.8470588, 0, 1, 1,
0.8558587, 0.05074311, 2.833648, 0.854902, 0, 1, 1,
0.859859, -0.6273822, 2.889045, 0.8588235, 0, 1, 1,
0.8614617, -0.8385106, 1.272097, 0.8666667, 0, 1, 1,
0.8626443, -1.284768, 1.624717, 0.8705882, 0, 1, 1,
0.8673437, 0.1455069, 1.545703, 0.8784314, 0, 1, 1,
0.8679051, -1.569148, 0.7462151, 0.8823529, 0, 1, 1,
0.8687955, -1.71479, 2.303572, 0.8901961, 0, 1, 1,
0.8731222, -0.64841, 2.711638, 0.8941177, 0, 1, 1,
0.8744299, -0.2856589, 1.441121, 0.9019608, 0, 1, 1,
0.8762694, 0.1301588, 1.966, 0.9098039, 0, 1, 1,
0.8838762, -1.662572, 2.713173, 0.9137255, 0, 1, 1,
0.9065977, 0.981011, 0.4212147, 0.9215686, 0, 1, 1,
0.9078997, 0.8576949, 0.8040008, 0.9254902, 0, 1, 1,
0.9134329, -0.9674374, 2.804632, 0.9333333, 0, 1, 1,
0.9222024, 1.291047, -0.3540106, 0.9372549, 0, 1, 1,
0.9297737, -0.2338793, 2.842865, 0.945098, 0, 1, 1,
0.9372219, -0.2597862, 2.288444, 0.9490196, 0, 1, 1,
0.9384221, 1.436816, 0.7059756, 0.9568627, 0, 1, 1,
0.943446, 0.9673811, 1.225797, 0.9607843, 0, 1, 1,
0.9504611, 0.6271189, 2.017117, 0.9686275, 0, 1, 1,
0.9526367, -1.048995, 2.183854, 0.972549, 0, 1, 1,
0.959448, -1.470176, 3.133335, 0.9803922, 0, 1, 1,
0.9611481, -0.2997079, 0.3207552, 0.9843137, 0, 1, 1,
0.9647487, 0.6996113, -0.1803871, 0.9921569, 0, 1, 1,
0.9664732, -1.268861, 2.543225, 0.9960784, 0, 1, 1,
0.9778669, -1.672314, 2.62595, 1, 0, 0.9960784, 1,
0.9831208, -0.2378285, 1.969155, 1, 0, 0.9882353, 1,
0.9895968, -0.2963633, 2.509078, 1, 0, 0.9843137, 1,
0.9935032, 0.9558269, 0.4200487, 1, 0, 0.9764706, 1,
0.9967897, -0.2987989, 2.758445, 1, 0, 0.972549, 1,
1.012408, 0.719431, 0.7510117, 1, 0, 0.9647059, 1,
1.01326, -1.640909, 2.989709, 1, 0, 0.9607843, 1,
1.023927, -1.023672, 3.88853, 1, 0, 0.9529412, 1,
1.028874, -0.2022781, 0.8698226, 1, 0, 0.9490196, 1,
1.044471, -0.3112846, 2.170226, 1, 0, 0.9411765, 1,
1.046635, -1.577467, 3.657856, 1, 0, 0.9372549, 1,
1.061982, 1.179131, 2.126339, 1, 0, 0.9294118, 1,
1.06706, 0.1001753, 2.176788, 1, 0, 0.9254902, 1,
1.076075, 1.130805, -0.8505121, 1, 0, 0.9176471, 1,
1.085324, -0.7575784, 1.115432, 1, 0, 0.9137255, 1,
1.091553, 2.372064, 2.551437, 1, 0, 0.9058824, 1,
1.10901, 0.878427, 1.218783, 1, 0, 0.9019608, 1,
1.111393, 0.3089699, -0.9675077, 1, 0, 0.8941177, 1,
1.112989, 1.155998, 3.179928, 1, 0, 0.8862745, 1,
1.119709, -1.305031, 2.027268, 1, 0, 0.8823529, 1,
1.120633, -0.3434067, 4.079885, 1, 0, 0.8745098, 1,
1.125707, 0.4194655, 1.564622, 1, 0, 0.8705882, 1,
1.1339, -1.111608, 2.49757, 1, 0, 0.8627451, 1,
1.135527, -0.1021151, 1.775478, 1, 0, 0.8588235, 1,
1.138293, 0.3734418, -0.2146533, 1, 0, 0.8509804, 1,
1.140735, 0.9140373, 2.768414, 1, 0, 0.8470588, 1,
1.154328, 1.349012, -0.9638518, 1, 0, 0.8392157, 1,
1.159418, -0.6601768, 1.775615, 1, 0, 0.8352941, 1,
1.160071, -0.5485604, 3.774422, 1, 0, 0.827451, 1,
1.179373, -1.26511, 1.800297, 1, 0, 0.8235294, 1,
1.182628, 0.2337109, 1.94857, 1, 0, 0.8156863, 1,
1.185037, -1.998843, 2.073388, 1, 0, 0.8117647, 1,
1.187866, 1.382994, 0.720187, 1, 0, 0.8039216, 1,
1.188766, -0.2243558, 1.075433, 1, 0, 0.7960784, 1,
1.201165, -0.4291809, -0.1941959, 1, 0, 0.7921569, 1,
1.205191, 0.1394064, 1.457013, 1, 0, 0.7843137, 1,
1.207384, -0.4333382, 0.7441803, 1, 0, 0.7803922, 1,
1.211181, 0.4030286, 0.8402017, 1, 0, 0.772549, 1,
1.21191, -0.4968123, 0.7194528, 1, 0, 0.7686275, 1,
1.215056, -2.445499, 4.232582, 1, 0, 0.7607843, 1,
1.218725, -0.01292843, 0.4151515, 1, 0, 0.7568628, 1,
1.219831, -0.09120009, 2.790334, 1, 0, 0.7490196, 1,
1.225309, -1.546781, 2.047634, 1, 0, 0.7450981, 1,
1.239476, 1.21946, 0.8450207, 1, 0, 0.7372549, 1,
1.239621, 0.860188, 3.423101, 1, 0, 0.7333333, 1,
1.242948, -0.7854748, 2.298046, 1, 0, 0.7254902, 1,
1.246298, 1.685937, 0.4461892, 1, 0, 0.7215686, 1,
1.250529, 1.717313, -1.189218, 1, 0, 0.7137255, 1,
1.252347, 1.179016, 1.820985, 1, 0, 0.7098039, 1,
1.254086, 0.8600774, 2.532151, 1, 0, 0.7019608, 1,
1.266548, 0.03256209, 0.6820373, 1, 0, 0.6941177, 1,
1.272476, -0.9177399, 0.965847, 1, 0, 0.6901961, 1,
1.27352, 0.1603312, 1.215792, 1, 0, 0.682353, 1,
1.273867, 0.5638821, 2.204153, 1, 0, 0.6784314, 1,
1.274503, -1.044137, 0.8601924, 1, 0, 0.6705883, 1,
1.28218, -0.6899514, 2.579037, 1, 0, 0.6666667, 1,
1.293694, -1.021173, 2.643107, 1, 0, 0.6588235, 1,
1.296393, 0.6342189, 0.502261, 1, 0, 0.654902, 1,
1.297134, -0.398651, 0.944476, 1, 0, 0.6470588, 1,
1.298031, 1.264644, 1.108213, 1, 0, 0.6431373, 1,
1.30264, 0.3539657, 1.983988, 1, 0, 0.6352941, 1,
1.310063, -0.3078524, 2.579309, 1, 0, 0.6313726, 1,
1.310066, -0.5452276, 3.050061, 1, 0, 0.6235294, 1,
1.327471, 1.552801, 0.02293278, 1, 0, 0.6196079, 1,
1.328348, 1.29793, 0.3342632, 1, 0, 0.6117647, 1,
1.332207, -0.6372911, 2.981982, 1, 0, 0.6078432, 1,
1.333578, 0.4566121, 3.054754, 1, 0, 0.6, 1,
1.348668, -0.838694, 0.9796311, 1, 0, 0.5921569, 1,
1.363677, -0.1166847, 1.451219, 1, 0, 0.5882353, 1,
1.370562, -0.3916234, 1.032839, 1, 0, 0.5803922, 1,
1.37313, 1.165051, 2.181262, 1, 0, 0.5764706, 1,
1.373924, 0.965688, -0.1959337, 1, 0, 0.5686275, 1,
1.38205, -1.07326, 2.651542, 1, 0, 0.5647059, 1,
1.391924, -0.6356636, 3.064995, 1, 0, 0.5568628, 1,
1.394943, 0.3820843, 1.951847, 1, 0, 0.5529412, 1,
1.401244, -0.5135278, 0.966253, 1, 0, 0.5450981, 1,
1.411134, -0.7034719, 0.4407194, 1, 0, 0.5411765, 1,
1.412198, 1.169846, 0.4330447, 1, 0, 0.5333334, 1,
1.429676, 0.5492942, 2.00579, 1, 0, 0.5294118, 1,
1.432404, 0.7435692, -0.3097967, 1, 0, 0.5215687, 1,
1.43532, 0.3082263, 0.4701533, 1, 0, 0.5176471, 1,
1.435627, -0.1699505, 2.469077, 1, 0, 0.509804, 1,
1.435825, -0.02344038, 0.8544935, 1, 0, 0.5058824, 1,
1.439851, -1.020642, 2.484362, 1, 0, 0.4980392, 1,
1.447662, 0.8494452, 2.53428, 1, 0, 0.4901961, 1,
1.456817, 0.6695038, -1.104427, 1, 0, 0.4862745, 1,
1.460414, -0.3191081, 1.823779, 1, 0, 0.4784314, 1,
1.490363, 1.543579, -0.791235, 1, 0, 0.4745098, 1,
1.495762, -0.5075401, 2.356327, 1, 0, 0.4666667, 1,
1.50194, 1.59154, 0.1021404, 1, 0, 0.4627451, 1,
1.507255, -0.4966339, 1.610598, 1, 0, 0.454902, 1,
1.509219, 0.3473408, 2.507737, 1, 0, 0.4509804, 1,
1.524545, -1.911568, 2.155194, 1, 0, 0.4431373, 1,
1.526802, 2.02554, 0.0989709, 1, 0, 0.4392157, 1,
1.531894, 0.526561, 2.584771, 1, 0, 0.4313726, 1,
1.542427, -1.120668, 2.001109, 1, 0, 0.427451, 1,
1.543497, -0.2132366, 1.945399, 1, 0, 0.4196078, 1,
1.549202, 0.107511, -0.8283531, 1, 0, 0.4156863, 1,
1.552523, 0.977037, -0.8026429, 1, 0, 0.4078431, 1,
1.556275, -0.7364597, 1.603983, 1, 0, 0.4039216, 1,
1.5725, 1.246271, 0.7447827, 1, 0, 0.3960784, 1,
1.579932, 1.191631, 2.541823, 1, 0, 0.3882353, 1,
1.59371, -0.3471409, 2.521112, 1, 0, 0.3843137, 1,
1.63208, 2.107091, -0.4072041, 1, 0, 0.3764706, 1,
1.640514, -1.957863, 1.023144, 1, 0, 0.372549, 1,
1.647429, -0.6446459, 0.933274, 1, 0, 0.3647059, 1,
1.647512, 0.5482059, 0.4692044, 1, 0, 0.3607843, 1,
1.650081, -0.4219985, 0.1390497, 1, 0, 0.3529412, 1,
1.65212, 1.446488, 0.8096415, 1, 0, 0.3490196, 1,
1.654782, -0.8024018, 1.56723, 1, 0, 0.3411765, 1,
1.654946, 0.3051834, -0.3754573, 1, 0, 0.3372549, 1,
1.666728, 0.5324854, 0.3295119, 1, 0, 0.3294118, 1,
1.669433, 0.4398703, 1.529148, 1, 0, 0.3254902, 1,
1.670721, 0.5402632, 0.7075216, 1, 0, 0.3176471, 1,
1.673314, 1.611626, 0.1693973, 1, 0, 0.3137255, 1,
1.677847, 0.0625622, 0.2801891, 1, 0, 0.3058824, 1,
1.680767, 0.8983503, 0.4185971, 1, 0, 0.2980392, 1,
1.685852, 0.4816975, 0.8171421, 1, 0, 0.2941177, 1,
1.689597, 0.7022243, 0.1584486, 1, 0, 0.2862745, 1,
1.70751, -0.7437119, 1.091517, 1, 0, 0.282353, 1,
1.712284, 0.5489051, -0.5994299, 1, 0, 0.2745098, 1,
1.719138, -0.1128829, 2.283701, 1, 0, 0.2705882, 1,
1.720846, -0.4806044, 0.8943289, 1, 0, 0.2627451, 1,
1.721887, 0.6338317, 1.576915, 1, 0, 0.2588235, 1,
1.726188, 0.05909027, 2.197207, 1, 0, 0.2509804, 1,
1.747654, 0.4206617, 0.3200158, 1, 0, 0.2470588, 1,
1.74825, -0.5642919, 2.066747, 1, 0, 0.2392157, 1,
1.753852, 0.7324009, 1.841457, 1, 0, 0.2352941, 1,
1.770279, -0.7040451, 1.871842, 1, 0, 0.227451, 1,
1.778114, 0.3979536, 1.808851, 1, 0, 0.2235294, 1,
1.785789, -0.9170325, 2.700778, 1, 0, 0.2156863, 1,
1.818154, -1.39115, 1.918133, 1, 0, 0.2117647, 1,
1.832785, 0.2560598, 0.8342245, 1, 0, 0.2039216, 1,
1.838604, -0.2273499, 2.802151, 1, 0, 0.1960784, 1,
1.840347, 1.597151, 2.59186, 1, 0, 0.1921569, 1,
1.842713, 1.313209, 0.01433812, 1, 0, 0.1843137, 1,
1.843938, -1.574781, 4.246968, 1, 0, 0.1803922, 1,
1.856394, -0.004473011, 1.760492, 1, 0, 0.172549, 1,
1.85852, -0.3207995, 2.661954, 1, 0, 0.1686275, 1,
1.870663, -2.030425, 3.479695, 1, 0, 0.1607843, 1,
1.881598, -0.3226936, 2.218642, 1, 0, 0.1568628, 1,
1.894269, -0.5007311, 1.801014, 1, 0, 0.1490196, 1,
1.900588, 0.380803, 3.001709, 1, 0, 0.145098, 1,
1.906682, -0.9699647, 3.376689, 1, 0, 0.1372549, 1,
1.915454, -0.7971428, 0.9897545, 1, 0, 0.1333333, 1,
1.942154, 1.438602, 2.297733, 1, 0, 0.1254902, 1,
1.949569, 0.1742265, 0.9145589, 1, 0, 0.1215686, 1,
1.959281, -0.2035509, 0.1525853, 1, 0, 0.1137255, 1,
1.993278, 0.1460017, 2.477898, 1, 0, 0.1098039, 1,
2.031624, 1.804639, 1.68697, 1, 0, 0.1019608, 1,
2.045063, -1.044395, 2.09547, 1, 0, 0.09411765, 1,
2.045409, -1.00969, 3.032684, 1, 0, 0.09019608, 1,
2.085833, -1.25231, 1.58796, 1, 0, 0.08235294, 1,
2.137886, -0.1671496, 2.879796, 1, 0, 0.07843138, 1,
2.139915, -0.4265835, 2.169881, 1, 0, 0.07058824, 1,
2.202981, 0.5013617, 0.0378871, 1, 0, 0.06666667, 1,
2.28389, 0.1161928, 1.417862, 1, 0, 0.05882353, 1,
2.34857, 0.7170577, -0.1609648, 1, 0, 0.05490196, 1,
2.367857, 0.1040785, 2.149598, 1, 0, 0.04705882, 1,
2.49944, -0.1451971, 2.676008, 1, 0, 0.04313726, 1,
2.582452, -0.9327266, -0.4469097, 1, 0, 0.03529412, 1,
2.597692, 1.46125, 1.964841, 1, 0, 0.03137255, 1,
2.614948, -1.514627, 1.716961, 1, 0, 0.02352941, 1,
2.77599, 0.884748, 2.694098, 1, 0, 0.01960784, 1,
2.947057, 1.162127, 1.761416, 1, 0, 0.01176471, 1,
3.607284, 0.9937133, 0.001713132, 1, 0, 0.007843138, 1
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
0.1198126, -4.1335, -7.756622, 0, -0.5, 0.5, 0.5,
0.1198126, -4.1335, -7.756622, 1, -0.5, 0.5, 0.5,
0.1198126, -4.1335, -7.756622, 1, 1.5, 0.5, 0.5,
0.1198126, -4.1335, -7.756622, 0, 1.5, 0.5, 0.5
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
-4.549911, 0.1588916, -7.756622, 0, -0.5, 0.5, 0.5,
-4.549911, 0.1588916, -7.756622, 1, -0.5, 0.5, 0.5,
-4.549911, 0.1588916, -7.756622, 1, 1.5, 0.5, 0.5,
-4.549911, 0.1588916, -7.756622, 0, 1.5, 0.5, 0.5
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
-4.549911, -4.1335, -0.05606413, 0, -0.5, 0.5, 0.5,
-4.549911, -4.1335, -0.05606413, 1, -0.5, 0.5, 0.5,
-4.549911, -4.1335, -0.05606413, 1, 1.5, 0.5, 0.5,
-4.549911, -4.1335, -0.05606413, 0, 1.5, 0.5, 0.5
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
-3, -3.142948, -5.97957,
3, -3.142948, -5.97957,
-3, -3.142948, -5.97957,
-3, -3.30804, -6.275746,
-2, -3.142948, -5.97957,
-2, -3.30804, -6.275746,
-1, -3.142948, -5.97957,
-1, -3.30804, -6.275746,
0, -3.142948, -5.97957,
0, -3.30804, -6.275746,
1, -3.142948, -5.97957,
1, -3.30804, -6.275746,
2, -3.142948, -5.97957,
2, -3.30804, -6.275746,
3, -3.142948, -5.97957,
3, -3.30804, -6.275746
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
-3, -3.638224, -6.868096, 0, -0.5, 0.5, 0.5,
-3, -3.638224, -6.868096, 1, -0.5, 0.5, 0.5,
-3, -3.638224, -6.868096, 1, 1.5, 0.5, 0.5,
-3, -3.638224, -6.868096, 0, 1.5, 0.5, 0.5,
-2, -3.638224, -6.868096, 0, -0.5, 0.5, 0.5,
-2, -3.638224, -6.868096, 1, -0.5, 0.5, 0.5,
-2, -3.638224, -6.868096, 1, 1.5, 0.5, 0.5,
-2, -3.638224, -6.868096, 0, 1.5, 0.5, 0.5,
-1, -3.638224, -6.868096, 0, -0.5, 0.5, 0.5,
-1, -3.638224, -6.868096, 1, -0.5, 0.5, 0.5,
-1, -3.638224, -6.868096, 1, 1.5, 0.5, 0.5,
-1, -3.638224, -6.868096, 0, 1.5, 0.5, 0.5,
0, -3.638224, -6.868096, 0, -0.5, 0.5, 0.5,
0, -3.638224, -6.868096, 1, -0.5, 0.5, 0.5,
0, -3.638224, -6.868096, 1, 1.5, 0.5, 0.5,
0, -3.638224, -6.868096, 0, 1.5, 0.5, 0.5,
1, -3.638224, -6.868096, 0, -0.5, 0.5, 0.5,
1, -3.638224, -6.868096, 1, -0.5, 0.5, 0.5,
1, -3.638224, -6.868096, 1, 1.5, 0.5, 0.5,
1, -3.638224, -6.868096, 0, 1.5, 0.5, 0.5,
2, -3.638224, -6.868096, 0, -0.5, 0.5, 0.5,
2, -3.638224, -6.868096, 1, -0.5, 0.5, 0.5,
2, -3.638224, -6.868096, 1, 1.5, 0.5, 0.5,
2, -3.638224, -6.868096, 0, 1.5, 0.5, 0.5,
3, -3.638224, -6.868096, 0, -0.5, 0.5, 0.5,
3, -3.638224, -6.868096, 1, -0.5, 0.5, 0.5,
3, -3.638224, -6.868096, 1, 1.5, 0.5, 0.5,
3, -3.638224, -6.868096, 0, 1.5, 0.5, 0.5
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
-3.472282, -3, -5.97957,
-3.472282, 3, -5.97957,
-3.472282, -3, -5.97957,
-3.651887, -3, -6.275746,
-3.472282, -2, -5.97957,
-3.651887, -2, -6.275746,
-3.472282, -1, -5.97957,
-3.651887, -1, -6.275746,
-3.472282, 0, -5.97957,
-3.651887, 0, -6.275746,
-3.472282, 1, -5.97957,
-3.651887, 1, -6.275746,
-3.472282, 2, -5.97957,
-3.651887, 2, -6.275746,
-3.472282, 3, -5.97957,
-3.651887, 3, -6.275746
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
-4.011097, -3, -6.868096, 0, -0.5, 0.5, 0.5,
-4.011097, -3, -6.868096, 1, -0.5, 0.5, 0.5,
-4.011097, -3, -6.868096, 1, 1.5, 0.5, 0.5,
-4.011097, -3, -6.868096, 0, 1.5, 0.5, 0.5,
-4.011097, -2, -6.868096, 0, -0.5, 0.5, 0.5,
-4.011097, -2, -6.868096, 1, -0.5, 0.5, 0.5,
-4.011097, -2, -6.868096, 1, 1.5, 0.5, 0.5,
-4.011097, -2, -6.868096, 0, 1.5, 0.5, 0.5,
-4.011097, -1, -6.868096, 0, -0.5, 0.5, 0.5,
-4.011097, -1, -6.868096, 1, -0.5, 0.5, 0.5,
-4.011097, -1, -6.868096, 1, 1.5, 0.5, 0.5,
-4.011097, -1, -6.868096, 0, 1.5, 0.5, 0.5,
-4.011097, 0, -6.868096, 0, -0.5, 0.5, 0.5,
-4.011097, 0, -6.868096, 1, -0.5, 0.5, 0.5,
-4.011097, 0, -6.868096, 1, 1.5, 0.5, 0.5,
-4.011097, 0, -6.868096, 0, 1.5, 0.5, 0.5,
-4.011097, 1, -6.868096, 0, -0.5, 0.5, 0.5,
-4.011097, 1, -6.868096, 1, -0.5, 0.5, 0.5,
-4.011097, 1, -6.868096, 1, 1.5, 0.5, 0.5,
-4.011097, 1, -6.868096, 0, 1.5, 0.5, 0.5,
-4.011097, 2, -6.868096, 0, -0.5, 0.5, 0.5,
-4.011097, 2, -6.868096, 1, -0.5, 0.5, 0.5,
-4.011097, 2, -6.868096, 1, 1.5, 0.5, 0.5,
-4.011097, 2, -6.868096, 0, 1.5, 0.5, 0.5,
-4.011097, 3, -6.868096, 0, -0.5, 0.5, 0.5,
-4.011097, 3, -6.868096, 1, -0.5, 0.5, 0.5,
-4.011097, 3, -6.868096, 1, 1.5, 0.5, 0.5,
-4.011097, 3, -6.868096, 0, 1.5, 0.5, 0.5
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
-3.472282, -3.142948, -4,
-3.472282, -3.142948, 4,
-3.472282, -3.142948, -4,
-3.651887, -3.30804, -4,
-3.472282, -3.142948, -2,
-3.651887, -3.30804, -2,
-3.472282, -3.142948, 0,
-3.651887, -3.30804, 0,
-3.472282, -3.142948, 2,
-3.651887, -3.30804, 2,
-3.472282, -3.142948, 4,
-3.651887, -3.30804, 4
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
-4.011097, -3.638224, -4, 0, -0.5, 0.5, 0.5,
-4.011097, -3.638224, -4, 1, -0.5, 0.5, 0.5,
-4.011097, -3.638224, -4, 1, 1.5, 0.5, 0.5,
-4.011097, -3.638224, -4, 0, 1.5, 0.5, 0.5,
-4.011097, -3.638224, -2, 0, -0.5, 0.5, 0.5,
-4.011097, -3.638224, -2, 1, -0.5, 0.5, 0.5,
-4.011097, -3.638224, -2, 1, 1.5, 0.5, 0.5,
-4.011097, -3.638224, -2, 0, 1.5, 0.5, 0.5,
-4.011097, -3.638224, 0, 0, -0.5, 0.5, 0.5,
-4.011097, -3.638224, 0, 1, -0.5, 0.5, 0.5,
-4.011097, -3.638224, 0, 1, 1.5, 0.5, 0.5,
-4.011097, -3.638224, 0, 0, 1.5, 0.5, 0.5,
-4.011097, -3.638224, 2, 0, -0.5, 0.5, 0.5,
-4.011097, -3.638224, 2, 1, -0.5, 0.5, 0.5,
-4.011097, -3.638224, 2, 1, 1.5, 0.5, 0.5,
-4.011097, -3.638224, 2, 0, 1.5, 0.5, 0.5,
-4.011097, -3.638224, 4, 0, -0.5, 0.5, 0.5,
-4.011097, -3.638224, 4, 1, -0.5, 0.5, 0.5,
-4.011097, -3.638224, 4, 1, 1.5, 0.5, 0.5,
-4.011097, -3.638224, 4, 0, 1.5, 0.5, 0.5
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
-3.472282, -3.142948, -5.97957,
-3.472282, 3.460731, -5.97957,
-3.472282, -3.142948, 5.867442,
-3.472282, 3.460731, 5.867442,
-3.472282, -3.142948, -5.97957,
-3.472282, -3.142948, 5.867442,
-3.472282, 3.460731, -5.97957,
-3.472282, 3.460731, 5.867442,
-3.472282, -3.142948, -5.97957,
3.711908, -3.142948, -5.97957,
-3.472282, -3.142948, 5.867442,
3.711908, -3.142948, 5.867442,
-3.472282, 3.460731, -5.97957,
3.711908, 3.460731, -5.97957,
-3.472282, 3.460731, 5.867442,
3.711908, 3.460731, 5.867442,
3.711908, -3.142948, -5.97957,
3.711908, 3.460731, -5.97957,
3.711908, -3.142948, 5.867442,
3.711908, 3.460731, 5.867442,
3.711908, -3.142948, -5.97957,
3.711908, -3.142948, 5.867442,
3.711908, 3.460731, -5.97957,
3.711908, 3.460731, 5.867442
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
var radius = 8.195739;
var distance = 36.46377;
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
mvMatrix.translate( -0.1198126, -0.1588916, 0.05606413 );
mvMatrix.scale( 1.233458, 1.341887, 0.7479855 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.46377);
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
ferimzone<-read.table("ferimzone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ferimzone$V2
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
```

```r
y<-ferimzone$V3
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
```

```r
z<-ferimzone$V4
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
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
-3.367658, -0.4738294, -2.671705, 0, 0, 1, 1, 1,
-3.139855, -0.9533128, -1.40065, 1, 0, 0, 1, 1,
-2.924258, 0.5866874, -1.778447, 1, 0, 0, 1, 1,
-2.853079, -1.415368, -1.329591, 1, 0, 0, 1, 1,
-2.71222, 0.8273968, -0.1673671, 1, 0, 0, 1, 1,
-2.562495, 1.054459, 0.5142274, 1, 0, 0, 1, 1,
-2.539562, -2.367903, -1.297777, 0, 0, 0, 1, 1,
-2.499363, 1.566954, -1.080873, 0, 0, 0, 1, 1,
-2.472389, 0.1780937, -1.742786, 0, 0, 0, 1, 1,
-2.43082, 0.03215861, 0.6635705, 0, 0, 0, 1, 1,
-2.320384, -0.21223, -1.725747, 0, 0, 0, 1, 1,
-2.316962, -0.4801043, -1.741469, 0, 0, 0, 1, 1,
-2.292645, -0.4020396, -1.234977, 0, 0, 0, 1, 1,
-2.264333, 0.08795796, -1.755479, 1, 1, 1, 1, 1,
-2.232312, -1.887587, -1.867081, 1, 1, 1, 1, 1,
-2.214681, 1.157448, -1.290643, 1, 1, 1, 1, 1,
-2.197168, 0.01751629, -1.499919, 1, 1, 1, 1, 1,
-2.149075, -0.4616735, -0.8099572, 1, 1, 1, 1, 1,
-2.138971, 0.5949225, -1.215516, 1, 1, 1, 1, 1,
-2.080334, 1.146491, -1.50524, 1, 1, 1, 1, 1,
-2.045004, -2.655248, -2.769489, 1, 1, 1, 1, 1,
-2.040928, 0.4163406, -2.046189, 1, 1, 1, 1, 1,
-2.030749, 0.04182386, -0.679486, 1, 1, 1, 1, 1,
-2.025791, -0.7032545, -2.03178, 1, 1, 1, 1, 1,
-2.024693, -0.2165044, -2.19381, 1, 1, 1, 1, 1,
-2.018602, 0.7328847, -0.187152, 1, 1, 1, 1, 1,
-1.987849, -1.286902, -2.397123, 1, 1, 1, 1, 1,
-1.935949, -0.9726179, -1.539728, 1, 1, 1, 1, 1,
-1.912358, -0.2003762, -2.098455, 0, 0, 1, 1, 1,
-1.873137, 1.388095, -1.83575, 1, 0, 0, 1, 1,
-1.839725, -0.2523546, -0.6840816, 1, 0, 0, 1, 1,
-1.830011, -1.152457, -1.947614, 1, 0, 0, 1, 1,
-1.826061, 1.16069, 0.09807455, 1, 0, 0, 1, 1,
-1.783192, -1.420361, -3.106399, 1, 0, 0, 1, 1,
-1.76238, 0.9384128, -1.691092, 0, 0, 0, 1, 1,
-1.755921, 1.7758, -0.914574, 0, 0, 0, 1, 1,
-1.723828, -0.6542403, -2.635645, 0, 0, 0, 1, 1,
-1.704897, -2.412262, -5.043033, 0, 0, 0, 1, 1,
-1.701584, -1.449725, -2.510961, 0, 0, 0, 1, 1,
-1.689972, 0.6394908, -0.3551023, 0, 0, 0, 1, 1,
-1.682976, -0.2301561, -1.507342, 0, 0, 0, 1, 1,
-1.682674, 0.4761266, -1.955436, 1, 1, 1, 1, 1,
-1.625188, -1.285438, -1.640654, 1, 1, 1, 1, 1,
-1.623188, -0.5752867, 0.2613588, 1, 1, 1, 1, 1,
-1.610339, -1.014274, -0.8249436, 1, 1, 1, 1, 1,
-1.580153, -0.6563296, 0.9465591, 1, 1, 1, 1, 1,
-1.574513, 0.7052056, -0.06628004, 1, 1, 1, 1, 1,
-1.555608, -0.7856479, -1.893185, 1, 1, 1, 1, 1,
-1.552742, 1.220913, 0.5582414, 1, 1, 1, 1, 1,
-1.550938, 0.353808, -0.9468379, 1, 1, 1, 1, 1,
-1.549015, -1.14453, -2.671766, 1, 1, 1, 1, 1,
-1.548183, 0.4582973, 0.4466842, 1, 1, 1, 1, 1,
-1.542352, -1.360527, -3.77086, 1, 1, 1, 1, 1,
-1.530218, 2.334831, -0.676542, 1, 1, 1, 1, 1,
-1.526143, -0.5685521, -1.927607, 1, 1, 1, 1, 1,
-1.52258, 0.7341964, -1.736116, 1, 1, 1, 1, 1,
-1.517678, -0.2246911, -2.449466, 0, 0, 1, 1, 1,
-1.51141, -0.595971, 0.6564691, 1, 0, 0, 1, 1,
-1.511243, 0.8841617, -0.976959, 1, 0, 0, 1, 1,
-1.494681, 1.119686, -0.8548593, 1, 0, 0, 1, 1,
-1.487061, -0.001312822, -2.852088, 1, 0, 0, 1, 1,
-1.478374, -0.828165, -2.001303, 1, 0, 0, 1, 1,
-1.474805, 0.5397162, -0.6543313, 0, 0, 0, 1, 1,
-1.473859, -0.1484226, -0.7335007, 0, 0, 0, 1, 1,
-1.464114, -0.7212671, -2.613612, 0, 0, 0, 1, 1,
-1.454428, 0.1016911, -2.6606, 0, 0, 0, 1, 1,
-1.452813, 0.1656585, -3.015446, 0, 0, 0, 1, 1,
-1.448816, 1.276518, -2.254978, 0, 0, 0, 1, 1,
-1.445317, -0.6454926, -2.899866, 0, 0, 0, 1, 1,
-1.443067, 1.869348, -0.5143075, 1, 1, 1, 1, 1,
-1.441083, 0.2833548, -1.34121, 1, 1, 1, 1, 1,
-1.440682, -0.2265462, -1.652763, 1, 1, 1, 1, 1,
-1.432887, -1.228641, -0.5584037, 1, 1, 1, 1, 1,
-1.432768, 0.9262396, -1.000447, 1, 1, 1, 1, 1,
-1.417708, 0.7585509, -0.7461438, 1, 1, 1, 1, 1,
-1.415131, -0.7934689, -2.23843, 1, 1, 1, 1, 1,
-1.408385, 0.9594811, -1.470042, 1, 1, 1, 1, 1,
-1.405773, -0.2754095, -1.510166, 1, 1, 1, 1, 1,
-1.381686, -0.4357686, -1.749083, 1, 1, 1, 1, 1,
-1.38159, 0.2102135, -2.005392, 1, 1, 1, 1, 1,
-1.377918, 0.7310563, -0.1707114, 1, 1, 1, 1, 1,
-1.367414, 0.1203469, -1.859494, 1, 1, 1, 1, 1,
-1.366072, -0.5823548, 0.1569863, 1, 1, 1, 1, 1,
-1.364384, -1.074267, -0.5819056, 1, 1, 1, 1, 1,
-1.362753, 1.446731, -1.697932, 0, 0, 1, 1, 1,
-1.351672, -0.08247166, -3.008516, 1, 0, 0, 1, 1,
-1.347576, 0.2856508, -0.3274016, 1, 0, 0, 1, 1,
-1.334656, 0.5809872, -1.281237, 1, 0, 0, 1, 1,
-1.333693, -0.1071853, -2.840989, 1, 0, 0, 1, 1,
-1.33322, -0.4516979, -1.422671, 1, 0, 0, 1, 1,
-1.333213, 0.3006586, -1.29313, 0, 0, 0, 1, 1,
-1.332376, 1.661269, -0.1972768, 0, 0, 0, 1, 1,
-1.31869, -0.5928811, -1.628329, 0, 0, 0, 1, 1,
-1.314044, 0.5584118, 0.8125259, 0, 0, 0, 1, 1,
-1.312932, -0.6030713, -2.966833, 0, 0, 0, 1, 1,
-1.296691, 1.669655, 1.569088, 0, 0, 0, 1, 1,
-1.29506, -1.274319, -2.072402, 0, 0, 0, 1, 1,
-1.295015, 0.631889, 0.8618208, 1, 1, 1, 1, 1,
-1.293392, -1.063877, -1.121161, 1, 1, 1, 1, 1,
-1.287694, -0.3174556, -3.05693, 1, 1, 1, 1, 1,
-1.286093, 0.9639103, 0.8618347, 1, 1, 1, 1, 1,
-1.281023, 1.15964, -0.2977491, 1, 1, 1, 1, 1,
-1.277173, 0.4870924, -1.453733, 1, 1, 1, 1, 1,
-1.264484, -0.3684893, -2.472858, 1, 1, 1, 1, 1,
-1.252613, 1.719608, -0.5908511, 1, 1, 1, 1, 1,
-1.250315, -0.112628, -1.957778, 1, 1, 1, 1, 1,
-1.250054, -0.4240737, -2.884332, 1, 1, 1, 1, 1,
-1.249914, -1.043077, -2.735484, 1, 1, 1, 1, 1,
-1.242405, -0.2684086, -0.7537909, 1, 1, 1, 1, 1,
-1.235481, 1.004299, -1.247904, 1, 1, 1, 1, 1,
-1.227784, 1.33092, 0.3552016, 1, 1, 1, 1, 1,
-1.223356, -0.339693, -2.70875, 1, 1, 1, 1, 1,
-1.199145, 1.156382, -2.422807, 0, 0, 1, 1, 1,
-1.197525, -1.91806, -2.301801, 1, 0, 0, 1, 1,
-1.196967, -0.03866309, -0.4017411, 1, 0, 0, 1, 1,
-1.187919, -0.9010112, -1.622474, 1, 0, 0, 1, 1,
-1.183059, 0.3534723, -0.4741636, 1, 0, 0, 1, 1,
-1.182786, 1.149071, -0.4386412, 1, 0, 0, 1, 1,
-1.181351, -0.4755255, -0.9705555, 0, 0, 0, 1, 1,
-1.170973, -0.8260573, -2.902699, 0, 0, 0, 1, 1,
-1.170561, 0.3005779, -0.6467021, 0, 0, 0, 1, 1,
-1.167975, -1.537197, 0.1325223, 0, 0, 0, 1, 1,
-1.164774, -0.7606615, -1.418982, 0, 0, 0, 1, 1,
-1.154108, 1.184336, -0.9287839, 0, 0, 0, 1, 1,
-1.148433, 0.8642961, -1.664492, 0, 0, 0, 1, 1,
-1.146997, 0.4900524, -1.326382, 1, 1, 1, 1, 1,
-1.143601, -1.316193, -1.192263, 1, 1, 1, 1, 1,
-1.143516, -0.4320866, -3.052083, 1, 1, 1, 1, 1,
-1.143245, -0.9102993, -1.702847, 1, 1, 1, 1, 1,
-1.140734, 1.306501, -2.584928, 1, 1, 1, 1, 1,
-1.135805, -0.2968738, -4.102712, 1, 1, 1, 1, 1,
-1.124636, -0.3173302, -2.018137, 1, 1, 1, 1, 1,
-1.124372, 0.9696723, -0.262923, 1, 1, 1, 1, 1,
-1.117103, 0.3898664, -0.5611084, 1, 1, 1, 1, 1,
-1.114227, 2.084371, -0.6877715, 1, 1, 1, 1, 1,
-1.111305, -2.421356, -2.309155, 1, 1, 1, 1, 1,
-1.109779, -0.2247399, -2.285749, 1, 1, 1, 1, 1,
-1.108593, 0.04438697, -1.140985, 1, 1, 1, 1, 1,
-1.105413, 0.6055263, -0.9714385, 1, 1, 1, 1, 1,
-1.101472, 1.817743, -0.04344808, 1, 1, 1, 1, 1,
-1.101278, -0.817997, -1.873645, 0, 0, 1, 1, 1,
-1.100172, -1.277929, -3.10633, 1, 0, 0, 1, 1,
-1.093684, 0.6777818, -1.587925, 1, 0, 0, 1, 1,
-1.089723, -0.1013175, -1.755216, 1, 0, 0, 1, 1,
-1.088506, -1.872754, -4.290561, 1, 0, 0, 1, 1,
-1.088498, -1.646492, -1.517556, 1, 0, 0, 1, 1,
-1.079036, -1.033442, -2.884617, 0, 0, 0, 1, 1,
-1.076673, 0.5210382, -0.458546, 0, 0, 0, 1, 1,
-1.062255, 1.038494, -0.5185032, 0, 0, 0, 1, 1,
-1.059567, -1.067419, -0.5596328, 0, 0, 0, 1, 1,
-1.054368, 0.9169629, -0.5685855, 0, 0, 0, 1, 1,
-1.045479, 0.2259323, -1.582372, 0, 0, 0, 1, 1,
-1.043897, -0.1817151, -1.538558, 0, 0, 0, 1, 1,
-1.040842, 0.3327932, 0.6203232, 1, 1, 1, 1, 1,
-1.039802, -0.09649091, -1.825733, 1, 1, 1, 1, 1,
-1.035399, -0.7091234, -1.910029, 1, 1, 1, 1, 1,
-1.032972, -0.2237696, -0.3616177, 1, 1, 1, 1, 1,
-1.027614, -1.200288, -2.31218, 1, 1, 1, 1, 1,
-1.027162, -0.1266574, -0.647954, 1, 1, 1, 1, 1,
-1.025677, -0.293895, -0.8726426, 1, 1, 1, 1, 1,
-1.020936, 0.6925223, 0.8887001, 1, 1, 1, 1, 1,
-1.001443, -1.23136, -2.13082, 1, 1, 1, 1, 1,
-0.9946737, -0.3296947, -2.507046, 1, 1, 1, 1, 1,
-0.9917676, 0.6895593, -2.277426, 1, 1, 1, 1, 1,
-0.9887401, -0.6887806, -2.355398, 1, 1, 1, 1, 1,
-0.9739165, 0.403994, 0.2340781, 1, 1, 1, 1, 1,
-0.9687387, -1.36074, -3.095911, 1, 1, 1, 1, 1,
-0.9574366, -0.7233594, -2.926359, 1, 1, 1, 1, 1,
-0.9568885, 0.2453877, 0.4228792, 0, 0, 1, 1, 1,
-0.9476112, -0.6024473, -2.229879, 1, 0, 0, 1, 1,
-0.9472069, 1.022659, -0.1316082, 1, 0, 0, 1, 1,
-0.9447456, -1.092729, -3.323059, 1, 0, 0, 1, 1,
-0.9437596, -3.046778, -3.296381, 1, 0, 0, 1, 1,
-0.9368985, 0.2885187, -1.464679, 1, 0, 0, 1, 1,
-0.9315572, 1.388806, -1.917006, 0, 0, 0, 1, 1,
-0.9310682, -1.379824, -2.197414, 0, 0, 0, 1, 1,
-0.9276115, 0.269771, -0.03425897, 0, 0, 0, 1, 1,
-0.9273534, -0.5131775, -0.5221217, 0, 0, 0, 1, 1,
-0.9270642, 0.3353228, -1.845553, 0, 0, 0, 1, 1,
-0.9185297, 2.026311, -2.39627, 0, 0, 0, 1, 1,
-0.9148788, -0.7937582, -2.57925, 0, 0, 0, 1, 1,
-0.9146141, -1.39215, -2.363552, 1, 1, 1, 1, 1,
-0.9129339, 0.7290893, 1.311631, 1, 1, 1, 1, 1,
-0.9097367, 0.4677952, -0.5639346, 1, 1, 1, 1, 1,
-0.8995778, -0.4268768, -1.657317, 1, 1, 1, 1, 1,
-0.894513, -0.4665374, -2.232759, 1, 1, 1, 1, 1,
-0.8939469, -1.179873, -3.234562, 1, 1, 1, 1, 1,
-0.8882373, -0.5799602, -0.8198614, 1, 1, 1, 1, 1,
-0.888075, -1.339274, -2.814654, 1, 1, 1, 1, 1,
-0.8858246, 0.2158771, -2.661919, 1, 1, 1, 1, 1,
-0.8825405, -0.5513259, -2.378537, 1, 1, 1, 1, 1,
-0.8792934, -0.1191562, 0.2589408, 1, 1, 1, 1, 1,
-0.8788851, -1.336037, -2.800809, 1, 1, 1, 1, 1,
-0.8746952, -0.02989472, -1.116575, 1, 1, 1, 1, 1,
-0.8716763, -0.2911356, -1.497394, 1, 1, 1, 1, 1,
-0.8677729, -1.279798, -3.535968, 1, 1, 1, 1, 1,
-0.8668258, 0.07991014, -0.9132324, 0, 0, 1, 1, 1,
-0.861228, 0.915704, 1.57881, 1, 0, 0, 1, 1,
-0.8599795, -0.9035695, -2.338298, 1, 0, 0, 1, 1,
-0.8558391, 1.148576, -1.059802, 1, 0, 0, 1, 1,
-0.8546401, 0.05554691, -1.701661, 1, 0, 0, 1, 1,
-0.8537944, 1.003662, -0.4563626, 1, 0, 0, 1, 1,
-0.8491865, -0.4534199, -1.26844, 0, 0, 0, 1, 1,
-0.8428168, -1.674964, -2.812089, 0, 0, 0, 1, 1,
-0.8389904, -0.9138833, -2.17398, 0, 0, 0, 1, 1,
-0.8376361, -0.6281618, -2.163525, 0, 0, 0, 1, 1,
-0.8351725, -1.777441, -5.807041, 0, 0, 0, 1, 1,
-0.8301991, -1.037162, -3.361138, 0, 0, 0, 1, 1,
-0.8276516, -0.4580874, -3.20655, 0, 0, 0, 1, 1,
-0.8261888, 0.04355859, -3.227206, 1, 1, 1, 1, 1,
-0.826164, -0.8077157, -2.859478, 1, 1, 1, 1, 1,
-0.8195724, 0.5485736, -1.28581, 1, 1, 1, 1, 1,
-0.8176819, 1.474955, -1.108346, 1, 1, 1, 1, 1,
-0.8132564, -2.040646, -1.831779, 1, 1, 1, 1, 1,
-0.8114967, -0.2921416, -1.269757, 1, 1, 1, 1, 1,
-0.8106857, 0.3210927, -1.461351, 1, 1, 1, 1, 1,
-0.8024032, 2.022544, -0.6289008, 1, 1, 1, 1, 1,
-0.8001305, -0.5226662, -2.332912, 1, 1, 1, 1, 1,
-0.7996998, 1.075491, -0.2982341, 1, 1, 1, 1, 1,
-0.7976589, 0.7283564, -1.894917, 1, 1, 1, 1, 1,
-0.7973185, 0.2807252, -2.053246, 1, 1, 1, 1, 1,
-0.7910756, -1.657832, -3.205708, 1, 1, 1, 1, 1,
-0.7861221, -0.02879862, -1.070708, 1, 1, 1, 1, 1,
-0.784716, 1.211155, 0.3121612, 1, 1, 1, 1, 1,
-0.7742925, 0.5646262, 0.1785826, 0, 0, 1, 1, 1,
-0.7673022, 0.796147, -2.537337, 1, 0, 0, 1, 1,
-0.7638144, -1.267637, -3.782386, 1, 0, 0, 1, 1,
-0.7600296, -1.424876, -2.198177, 1, 0, 0, 1, 1,
-0.7572101, -0.4355069, -3.282868, 1, 0, 0, 1, 1,
-0.7569585, 0.1898985, -2.584784, 1, 0, 0, 1, 1,
-0.7517576, -1.76288, -1.892418, 0, 0, 0, 1, 1,
-0.7490696, -1.514047, -2.065707, 0, 0, 0, 1, 1,
-0.7465017, -0.4174634, -2.511281, 0, 0, 0, 1, 1,
-0.7463239, 0.4099414, -0.04502241, 0, 0, 0, 1, 1,
-0.7417622, 1.061574, -0.1914603, 0, 0, 0, 1, 1,
-0.7381166, 0.3983302, 0.6504111, 0, 0, 0, 1, 1,
-0.7330544, 0.0397462, -0.326277, 0, 0, 0, 1, 1,
-0.7283539, -0.1475352, -0.1421653, 1, 1, 1, 1, 1,
-0.7265868, -0.7096652, -1.630996, 1, 1, 1, 1, 1,
-0.715135, -0.5332199, -2.36071, 1, 1, 1, 1, 1,
-0.7120022, -0.02561552, 0.3587162, 1, 1, 1, 1, 1,
-0.7116081, 1.000726, 0.02539197, 1, 1, 1, 1, 1,
-0.7087979, 0.741449, -1.292571, 1, 1, 1, 1, 1,
-0.7080953, -1.156524, -2.920069, 1, 1, 1, 1, 1,
-0.7012838, 1.137492, -0.1527546, 1, 1, 1, 1, 1,
-0.7005186, 2.499678, 0.1882403, 1, 1, 1, 1, 1,
-0.6970388, -0.3999624, -1.518321, 1, 1, 1, 1, 1,
-0.6937507, -1.124922, -0.3692037, 1, 1, 1, 1, 1,
-0.6924089, -0.4265209, -2.770587, 1, 1, 1, 1, 1,
-0.6896291, -0.8228165, -0.8447281, 1, 1, 1, 1, 1,
-0.6808023, 0.2063643, -1.400325, 1, 1, 1, 1, 1,
-0.678139, -1.046547, -1.115169, 1, 1, 1, 1, 1,
-0.6717451, 0.7381822, -0.6069995, 0, 0, 1, 1, 1,
-0.6716141, 0.04834725, -1.671244, 1, 0, 0, 1, 1,
-0.661974, -0.7635661, -0.627916, 1, 0, 0, 1, 1,
-0.6582922, 0.5718282, -1.581338, 1, 0, 0, 1, 1,
-0.6535882, -0.4779636, -2.81402, 1, 0, 0, 1, 1,
-0.6522041, -0.6167429, -3.191538, 1, 0, 0, 1, 1,
-0.6511435, -0.2179118, -0.7332216, 0, 0, 0, 1, 1,
-0.646253, 1.240551, -0.8682467, 0, 0, 0, 1, 1,
-0.6454355, 0.04773672, -1.257704, 0, 0, 0, 1, 1,
-0.6413002, -0.1706357, -1.02815, 0, 0, 0, 1, 1,
-0.6391892, 0.7075943, -1.692651, 0, 0, 0, 1, 1,
-0.6378644, -1.193029, -2.004394, 0, 0, 0, 1, 1,
-0.6371997, 2.533412, 0.7218488, 0, 0, 0, 1, 1,
-0.6364534, 0.09513348, -1.763782, 1, 1, 1, 1, 1,
-0.6224147, -0.3570761, -1.074452, 1, 1, 1, 1, 1,
-0.6189066, 0.6892539, -1.525825, 1, 1, 1, 1, 1,
-0.6181185, -1.519167, -3.658547, 1, 1, 1, 1, 1,
-0.6143426, 1.232712, -2.418386, 1, 1, 1, 1, 1,
-0.6097863, -0.6118822, -1.393481, 1, 1, 1, 1, 1,
-0.6080788, -0.4263493, -0.6947545, 1, 1, 1, 1, 1,
-0.6079282, 0.4809974, -1.813249, 1, 1, 1, 1, 1,
-0.6002939, -0.2124983, -0.8022469, 1, 1, 1, 1, 1,
-0.5933314, -1.056884, -2.269963, 1, 1, 1, 1, 1,
-0.5874013, -0.2926628, -2.253921, 1, 1, 1, 1, 1,
-0.5853757, -0.6686152, -3.014769, 1, 1, 1, 1, 1,
-0.5783759, 0.8029906, 0.2111939, 1, 1, 1, 1, 1,
-0.5744699, -0.6211967, -3.409144, 1, 1, 1, 1, 1,
-0.5729577, 1.422686, -0.8574403, 1, 1, 1, 1, 1,
-0.5718162, 0.07024035, -0.5026841, 0, 0, 1, 1, 1,
-0.5711415, -0.5207935, -1.562643, 1, 0, 0, 1, 1,
-0.56653, -1.872111, -2.66589, 1, 0, 0, 1, 1,
-0.5630953, 0.2770634, -1.631522, 1, 0, 0, 1, 1,
-0.5630857, -2.021604, -3.252682, 1, 0, 0, 1, 1,
-0.5626255, 0.7301633, -1.317901, 1, 0, 0, 1, 1,
-0.5568343, -2.224269, -1.39083, 0, 0, 0, 1, 1,
-0.5528212, 1.238089, -2.923226, 0, 0, 0, 1, 1,
-0.5429357, 1.63784, -0.07913611, 0, 0, 0, 1, 1,
-0.5359671, 1.417678, -2.48856, 0, 0, 0, 1, 1,
-0.5358631, -0.5471562, 0.8486159, 0, 0, 0, 1, 1,
-0.5325046, 0.8010077, -0.5111032, 0, 0, 0, 1, 1,
-0.5319697, -0.4165851, -2.483604, 0, 0, 0, 1, 1,
-0.5316561, 0.707855, -0.8726103, 1, 1, 1, 1, 1,
-0.5300228, 1.190416, -1.474139, 1, 1, 1, 1, 1,
-0.5277489, 1.239878, -2.175534, 1, 1, 1, 1, 1,
-0.5274669, -0.3710083, -2.54363, 1, 1, 1, 1, 1,
-0.5265238, -0.237138, -2.013116, 1, 1, 1, 1, 1,
-0.5171762, 1.038675, 1.092018, 1, 1, 1, 1, 1,
-0.5133908, -0.2053547, -2.501168, 1, 1, 1, 1, 1,
-0.5092021, -1.662958, -2.94773, 1, 1, 1, 1, 1,
-0.5072243, 0.2391872, -1.3254, 1, 1, 1, 1, 1,
-0.5066039, 0.0743201, -2.066668, 1, 1, 1, 1, 1,
-0.4981104, -0.2592413, -0.957892, 1, 1, 1, 1, 1,
-0.4943182, 0.5974478, -1.757937, 1, 1, 1, 1, 1,
-0.4874485, -0.7131452, -2.789354, 1, 1, 1, 1, 1,
-0.486807, 1.694687, -0.4410515, 1, 1, 1, 1, 1,
-0.4866965, 0.2574343, -1.662641, 1, 1, 1, 1, 1,
-0.4783494, 1.2295, -0.2904751, 0, 0, 1, 1, 1,
-0.4771892, -1.84423, -2.73345, 1, 0, 0, 1, 1,
-0.4767053, 0.9363728, -0.3566912, 1, 0, 0, 1, 1,
-0.4720662, -0.4587002, -4.209419, 1, 0, 0, 1, 1,
-0.4716516, -1.373548, -2.601947, 1, 0, 0, 1, 1,
-0.4713309, 1.786307, -0.2673555, 1, 0, 0, 1, 1,
-0.466325, 1.575616, 1.757609, 0, 0, 0, 1, 1,
-0.4644124, -0.02927983, -0.6409868, 0, 0, 0, 1, 1,
-0.4640358, 0.6466792, -1.257578, 0, 0, 0, 1, 1,
-0.4568153, -0.78315, -2.208767, 0, 0, 0, 1, 1,
-0.4366001, -1.81724, -2.344148, 0, 0, 0, 1, 1,
-0.4346937, 0.018211, -0.05265942, 0, 0, 0, 1, 1,
-0.4327378, -1.038403, -2.742526, 0, 0, 0, 1, 1,
-0.4278709, 0.6509617, -0.6544409, 1, 1, 1, 1, 1,
-0.422685, 0.1101485, -2.237116, 1, 1, 1, 1, 1,
-0.4204404, 0.5929559, -0.1013386, 1, 1, 1, 1, 1,
-0.4192771, -0.613017, -1.1183, 1, 1, 1, 1, 1,
-0.4147575, 0.2604743, 0.9431279, 1, 1, 1, 1, 1,
-0.4123217, -0.608247, -2.350262, 1, 1, 1, 1, 1,
-0.4118649, 0.8856993, -0.6716135, 1, 1, 1, 1, 1,
-0.4010073, -0.3393958, -1.857995, 1, 1, 1, 1, 1,
-0.4005158, -0.3636617, -3.149482, 1, 1, 1, 1, 1,
-0.3993507, 0.6128128, -0.584177, 1, 1, 1, 1, 1,
-0.3971778, -0.4472639, -2.571651, 1, 1, 1, 1, 1,
-0.3955928, 1.151108, -0.5147558, 1, 1, 1, 1, 1,
-0.3851455, 0.433623, 0.09862079, 1, 1, 1, 1, 1,
-0.3818509, -0.4882467, -2.862327, 1, 1, 1, 1, 1,
-0.3767684, 0.4054488, 0.480435, 1, 1, 1, 1, 1,
-0.3721074, 0.55558, -2.240963, 0, 0, 1, 1, 1,
-0.3656682, 1.764274, -0.877341, 1, 0, 0, 1, 1,
-0.3656515, 0.05463095, -2.840619, 1, 0, 0, 1, 1,
-0.3622672, 0.7155747, -0.6817856, 1, 0, 0, 1, 1,
-0.3614991, -0.2750041, -2.36545, 1, 0, 0, 1, 1,
-0.3610629, -1.152663, -4.155808, 1, 0, 0, 1, 1,
-0.3605649, -0.9303174, -3.399626, 0, 0, 0, 1, 1,
-0.3556275, -0.8391464, -3.32752, 0, 0, 0, 1, 1,
-0.3555676, 1.121212, -0.2398581, 0, 0, 0, 1, 1,
-0.3554441, -0.5444862, -4.687664, 0, 0, 0, 1, 1,
-0.3548371, -0.52518, -1.294266, 0, 0, 0, 1, 1,
-0.3546082, -0.8729458, -4.158822, 0, 0, 0, 1, 1,
-0.3481064, -1.08185, -4.024764, 0, 0, 0, 1, 1,
-0.3438338, 0.3289023, -0.3807596, 1, 1, 1, 1, 1,
-0.343565, -0.214752, -2.674934, 1, 1, 1, 1, 1,
-0.3397913, -0.7400733, -3.023678, 1, 1, 1, 1, 1,
-0.3383975, -0.8004478, -1.774142, 1, 1, 1, 1, 1,
-0.3353779, 1.109589, -2.065589, 1, 1, 1, 1, 1,
-0.3345371, -1.098869, -2.353138, 1, 1, 1, 1, 1,
-0.3302805, -2.054662, -2.929682, 1, 1, 1, 1, 1,
-0.3278076, -0.9314937, -1.319577, 1, 1, 1, 1, 1,
-0.3230219, 0.5916081, -3.13544, 1, 1, 1, 1, 1,
-0.3180614, 0.303619, -0.9762973, 1, 1, 1, 1, 1,
-0.3169022, 1.439466, -0.8172364, 1, 1, 1, 1, 1,
-0.3153027, -1.311022, -3.889928, 1, 1, 1, 1, 1,
-0.3135635, 1.935221, -0.6959268, 1, 1, 1, 1, 1,
-0.3119151, -0.1915276, -3.728308, 1, 1, 1, 1, 1,
-0.3008858, -0.3898673, -1.708456, 1, 1, 1, 1, 1,
-0.2981249, 0.3994054, 0.1656514, 0, 0, 1, 1, 1,
-0.2977524, 0.1567619, -2.27116, 1, 0, 0, 1, 1,
-0.2974403, -0.2449559, -1.829475, 1, 0, 0, 1, 1,
-0.2943782, -2.25008, -2.673993, 1, 0, 0, 1, 1,
-0.2934542, -0.07350077, -1.462685, 1, 0, 0, 1, 1,
-0.2922906, 0.422042, 0.9169087, 1, 0, 0, 1, 1,
-0.2919758, -0.1849116, -2.088403, 0, 0, 0, 1, 1,
-0.2913168, 0.6583358, 0.532788, 0, 0, 0, 1, 1,
-0.2901769, -1.140354, -2.876454, 0, 0, 0, 1, 1,
-0.2815171, 0.2890057, 0.5551018, 0, 0, 0, 1, 1,
-0.2807793, -1.376869, -2.553204, 0, 0, 0, 1, 1,
-0.2791989, -0.8341217, -2.858171, 0, 0, 0, 1, 1,
-0.2769727, -1.883005, -3.711123, 0, 0, 0, 1, 1,
-0.2757042, 1.354044, 0.4035753, 1, 1, 1, 1, 1,
-0.2743379, 1.073988, -0.4572094, 1, 1, 1, 1, 1,
-0.2732475, -1.462956, -3.442924, 1, 1, 1, 1, 1,
-0.270647, 0.8463426, -2.011828, 1, 1, 1, 1, 1,
-0.2688662, 0.2211483, -1.334121, 1, 1, 1, 1, 1,
-0.2679246, -0.7431508, -1.819663, 1, 1, 1, 1, 1,
-0.2675162, 0.651512, 0.8134108, 1, 1, 1, 1, 1,
-0.2600847, -0.0403932, -2.961368, 1, 1, 1, 1, 1,
-0.2576698, -0.3571785, -1.552976, 1, 1, 1, 1, 1,
-0.257571, 1.242354, 1.078219, 1, 1, 1, 1, 1,
-0.2562827, 0.5984568, -0.4213621, 1, 1, 1, 1, 1,
-0.2521581, -0.346669, -3.69111, 1, 1, 1, 1, 1,
-0.2518648, -1.466466, -2.693712, 1, 1, 1, 1, 1,
-0.2468876, 0.07227652, -2.013787, 1, 1, 1, 1, 1,
-0.2466052, 1.194461, -0.04359148, 1, 1, 1, 1, 1,
-0.2454079, -0.4960208, -1.560402, 0, 0, 1, 1, 1,
-0.245406, 2.45737, -1.281772, 1, 0, 0, 1, 1,
-0.2452258, -0.5445881, -1.927843, 1, 0, 0, 1, 1,
-0.2431551, 0.638759, -1.871914, 1, 0, 0, 1, 1,
-0.2383115, -1.548761, -3.804121, 1, 0, 0, 1, 1,
-0.2380098, -1.434039, -3.721604, 1, 0, 0, 1, 1,
-0.2327259, -0.5061176, -2.453561, 0, 0, 0, 1, 1,
-0.2301827, -0.9935806, -2.795899, 0, 0, 0, 1, 1,
-0.2279768, -1.197059, -2.642671, 0, 0, 0, 1, 1,
-0.2259061, -0.00782795, -1.1569, 0, 0, 0, 1, 1,
-0.2232065, 0.4976957, -0.204621, 0, 0, 0, 1, 1,
-0.219293, -0.5805058, -1.762703, 0, 0, 0, 1, 1,
-0.2191466, 0.3979549, -0.6760519, 0, 0, 0, 1, 1,
-0.2171054, 3.364561, -1.602384, 1, 1, 1, 1, 1,
-0.2130298, -0.6506317, -2.077495, 1, 1, 1, 1, 1,
-0.2124149, 0.5659081, -0.2557993, 1, 1, 1, 1, 1,
-0.2056298, -0.1486904, -0.7240947, 1, 1, 1, 1, 1,
-0.2035666, -1.218568, -1.844248, 1, 1, 1, 1, 1,
-0.2034367, 0.7172067, -0.4164923, 1, 1, 1, 1, 1,
-0.2004772, 0.1362388, -0.3818469, 1, 1, 1, 1, 1,
-0.1995454, -0.04720483, -1.7071, 1, 1, 1, 1, 1,
-0.1993966, -0.2356781, -2.715561, 1, 1, 1, 1, 1,
-0.1988915, 0.2920861, 0.09730969, 1, 1, 1, 1, 1,
-0.1979287, -0.1811032, -0.2353718, 1, 1, 1, 1, 1,
-0.1966841, -1.081364, -3.120173, 1, 1, 1, 1, 1,
-0.1966755, 0.8050521, 0.9311367, 1, 1, 1, 1, 1,
-0.1958459, 2.609244, -1.173102, 1, 1, 1, 1, 1,
-0.1939575, 1.293273, -1.546044, 1, 1, 1, 1, 1,
-0.1927143, 1.716843, -0.03459441, 0, 0, 1, 1, 1,
-0.1924036, -0.3676824, -1.8872, 1, 0, 0, 1, 1,
-0.1920954, 1.144844, -0.9374079, 1, 0, 0, 1, 1,
-0.19019, -0.6460007, -3.991139, 1, 0, 0, 1, 1,
-0.188202, 0.2348584, -0.7898908, 1, 0, 0, 1, 1,
-0.1878008, 2.04019, -0.8657919, 1, 0, 0, 1, 1,
-0.1847192, -0.249364, -1.414327, 0, 0, 0, 1, 1,
-0.1816903, -0.6699334, -2.734291, 0, 0, 0, 1, 1,
-0.1675548, -1.414823, -2.087095, 0, 0, 0, 1, 1,
-0.1549253, 0.49199, -0.8655037, 0, 0, 0, 1, 1,
-0.1519694, 0.05566407, -1.267717, 0, 0, 0, 1, 1,
-0.1449452, 0.5993088, -1.193489, 0, 0, 0, 1, 1,
-0.1439064, -0.7136084, -4.962368, 0, 0, 0, 1, 1,
-0.1424074, -0.4344938, -3.32284, 1, 1, 1, 1, 1,
-0.141489, 0.6565984, 0.5830212, 1, 1, 1, 1, 1,
-0.139527, -0.3898208, -2.736862, 1, 1, 1, 1, 1,
-0.1306167, 1.533526, -0.6242914, 1, 1, 1, 1, 1,
-0.1304644, -0.5621547, -1.674476, 1, 1, 1, 1, 1,
-0.1303562, 0.3639119, -2.844027, 1, 1, 1, 1, 1,
-0.1284269, 0.7940409, 0.7696421, 1, 1, 1, 1, 1,
-0.1251446, 0.9990219, -0.1868495, 1, 1, 1, 1, 1,
-0.1227774, -0.5079613, -3.203652, 1, 1, 1, 1, 1,
-0.1170407, 0.6414623, -0.004894592, 1, 1, 1, 1, 1,
-0.1165216, -1.53019, -4.363113, 1, 1, 1, 1, 1,
-0.1151631, 1.487821, 0.09528319, 1, 1, 1, 1, 1,
-0.1134364, -1.138166, -4.021345, 1, 1, 1, 1, 1,
-0.1123723, -1.400423, -2.611991, 1, 1, 1, 1, 1,
-0.1118795, -1.292097, -2.285151, 1, 1, 1, 1, 1,
-0.1103708, 0.5425062, -0.05141061, 0, 0, 1, 1, 1,
-0.1047947, -1.628379, -4.295599, 1, 0, 0, 1, 1,
-0.1033668, -0.1833937, -1.828707, 1, 0, 0, 1, 1,
-0.1027662, 1.134276, 1.488253, 1, 0, 0, 1, 1,
-0.09583656, 0.8772695, -0.1672148, 1, 0, 0, 1, 1,
-0.09568617, 0.1343105, -2.727353, 1, 0, 0, 1, 1,
-0.09235421, -0.3233849, -2.268997, 0, 0, 0, 1, 1,
-0.09166203, -0.9293483, -3.310792, 0, 0, 0, 1, 1,
-0.09125964, -0.04649199, -1.664343, 0, 0, 0, 1, 1,
-0.09083698, -1.458343, -4.346653, 0, 0, 0, 1, 1,
-0.0881128, -0.4691601, -2.3373, 0, 0, 0, 1, 1,
-0.08512523, -0.7774285, -1.78372, 0, 0, 0, 1, 1,
-0.08423911, -0.6735397, -3.846852, 0, 0, 0, 1, 1,
-0.08339863, -1.462433, -3.688334, 1, 1, 1, 1, 1,
-0.08289435, 1.267237, 1.618956, 1, 1, 1, 1, 1,
-0.08113484, -0.8463067, -2.476909, 1, 1, 1, 1, 1,
-0.07924334, -0.2880418, -3.716483, 1, 1, 1, 1, 1,
-0.07694392, -1.196223, -3.770521, 1, 1, 1, 1, 1,
-0.07655462, 0.6117557, -0.2799672, 1, 1, 1, 1, 1,
-0.07555825, 1.456472, 0.2247183, 1, 1, 1, 1, 1,
-0.07550572, -0.448951, -1.559624, 1, 1, 1, 1, 1,
-0.07537255, -0.5937582, -1.695284, 1, 1, 1, 1, 1,
-0.07477497, 0.1046405, -0.4042285, 1, 1, 1, 1, 1,
-0.06966107, -0.5373574, -2.439624, 1, 1, 1, 1, 1,
-0.06891643, 1.339475, -0.1381792, 1, 1, 1, 1, 1,
-0.06839528, -0.01564752, 1.083915, 1, 1, 1, 1, 1,
-0.06359313, -1.125379, -3.721401, 1, 1, 1, 1, 1,
-0.06149063, 0.06296175, -0.3867442, 1, 1, 1, 1, 1,
-0.06012663, 0.2731611, 0.7164618, 0, 0, 1, 1, 1,
-0.05778772, -0.4003533, -2.161608, 1, 0, 0, 1, 1,
-0.05542362, -1.471038, -1.842334, 1, 0, 0, 1, 1,
-0.05083986, 0.6774381, -0.54721, 1, 0, 0, 1, 1,
-0.04931234, 0.02264496, -0.6075107, 1, 0, 0, 1, 1,
-0.04361581, 0.83902, 0.5465164, 1, 0, 0, 1, 1,
-0.03929153, 1.822094, -0.6245396, 0, 0, 0, 1, 1,
-0.03884137, 1.417807, 0.6613325, 0, 0, 0, 1, 1,
-0.03829515, -0.8759254, -3.048436, 0, 0, 0, 1, 1,
-0.03819164, 0.2171221, -0.3475726, 0, 0, 0, 1, 1,
-0.03322623, -0.6508498, -4.057407, 0, 0, 0, 1, 1,
-0.02765466, 0.4331181, -1.064275, 0, 0, 0, 1, 1,
-0.02522768, -0.1632891, -4.551842, 0, 0, 0, 1, 1,
-0.02301098, 0.524134, 1.612736, 1, 1, 1, 1, 1,
-0.02277198, -1.018748, -2.266912, 1, 1, 1, 1, 1,
-0.02174182, -0.07342649, -3.12604, 1, 1, 1, 1, 1,
-0.01965206, 0.1652856, 0.3839095, 1, 1, 1, 1, 1,
-0.0194623, 0.902414, 0.4478091, 1, 1, 1, 1, 1,
-0.01891009, -1.948604, -4.26923, 1, 1, 1, 1, 1,
-0.01777852, 0.1134196, -0.7379583, 1, 1, 1, 1, 1,
-0.01656342, -0.08059198, -3.215469, 1, 1, 1, 1, 1,
-0.009689829, -1.375694, -2.875793, 1, 1, 1, 1, 1,
-0.00749771, -0.1962309, -4.965381, 1, 1, 1, 1, 1,
-0.007129561, -0.2582266, -1.999019, 1, 1, 1, 1, 1,
-0.003325278, 0.433819, -2.237437, 1, 1, 1, 1, 1,
-0.002782863, -0.3818968, -1.161707, 1, 1, 1, 1, 1,
-0.001737797, -0.8583317, -3.948296, 1, 1, 1, 1, 1,
-0.000914648, -1.276133, -2.568711, 1, 1, 1, 1, 1,
-0.0005157065, 0.4598823, 0.4187013, 0, 0, 1, 1, 1,
0.00156671, -1.132078, 3.795261, 1, 0, 0, 1, 1,
0.002366245, 1.865345, 0.7921421, 1, 0, 0, 1, 1,
0.003008516, 0.4550068, -0.2038949, 1, 0, 0, 1, 1,
0.00428404, 0.1820941, -1.499181, 1, 0, 0, 1, 1,
0.006358759, -0.7524002, 4.385994, 1, 0, 0, 1, 1,
0.01106824, 1.474718, 0.2591107, 0, 0, 0, 1, 1,
0.01204372, -0.4745163, 3.123215, 0, 0, 0, 1, 1,
0.01444881, -1.24158, 4.45365, 0, 0, 0, 1, 1,
0.01599295, 0.1088385, -1.458151, 0, 0, 0, 1, 1,
0.02221571, -1.334671, 3.946679, 0, 0, 0, 1, 1,
0.02337973, 1.730796, -0.6753185, 0, 0, 0, 1, 1,
0.02452384, -1.162327, 4.916424, 0, 0, 0, 1, 1,
0.03108274, 0.3813346, 2.321484, 1, 1, 1, 1, 1,
0.03137253, 0.4465401, 0.7317606, 1, 1, 1, 1, 1,
0.03454853, -0.3411977, 2.878235, 1, 1, 1, 1, 1,
0.04441207, -1.245281, 2.890209, 1, 1, 1, 1, 1,
0.04649384, -0.4026891, 3.334033, 1, 1, 1, 1, 1,
0.0499181, 1.199098, 0.8078496, 1, 1, 1, 1, 1,
0.05079846, -0.9823562, 1.639494, 1, 1, 1, 1, 1,
0.05150381, -0.5707856, 2.592251, 1, 1, 1, 1, 1,
0.05247202, 1.332841, 0.07638498, 1, 1, 1, 1, 1,
0.05468101, -0.1018735, 3.860185, 1, 1, 1, 1, 1,
0.05886538, -1.060601, 5.694913, 1, 1, 1, 1, 1,
0.06047628, -0.628287, 2.598831, 1, 1, 1, 1, 1,
0.06706046, 0.3569286, 0.2471678, 1, 1, 1, 1, 1,
0.07207479, -2.3727, 2.11884, 1, 1, 1, 1, 1,
0.0763218, -0.8301126, 2.192197, 1, 1, 1, 1, 1,
0.0767416, -0.08513473, 2.522656, 0, 0, 1, 1, 1,
0.07685698, -0.6358907, 3.747217, 1, 0, 0, 1, 1,
0.07789688, 1.3416, 0.2775662, 1, 0, 0, 1, 1,
0.07941359, -0.9686845, 1.754419, 1, 0, 0, 1, 1,
0.07998805, 0.2794209, 1.700045, 1, 0, 0, 1, 1,
0.08119602, -0.3023019, 2.778595, 1, 0, 0, 1, 1,
0.08661439, -0.527464, 3.494936, 0, 0, 0, 1, 1,
0.09011697, -1.285393, 2.810131, 0, 0, 0, 1, 1,
0.09130639, 2.021976, -1.822741, 0, 0, 0, 1, 1,
0.09356076, -0.6987824, 3.110318, 0, 0, 0, 1, 1,
0.09361418, 0.5199807, -0.2808212, 0, 0, 0, 1, 1,
0.09652597, -1.155058, 1.69379, 0, 0, 0, 1, 1,
0.09923952, 0.6289543, -0.5674812, 0, 0, 0, 1, 1,
0.1008294, -0.1424439, 3.794499, 1, 1, 1, 1, 1,
0.101765, -0.1182786, 2.862725, 1, 1, 1, 1, 1,
0.101844, 0.7250389, -0.116332, 1, 1, 1, 1, 1,
0.1057475, -0.01820774, 1.019427, 1, 1, 1, 1, 1,
0.1063893, 0.4774787, -1.407719, 1, 1, 1, 1, 1,
0.1065803, 1.85095, 1.104976, 1, 1, 1, 1, 1,
0.1072244, 1.302654, -0.1037432, 1, 1, 1, 1, 1,
0.112185, 1.329539, -0.8952489, 1, 1, 1, 1, 1,
0.114032, -0.9444292, 3.757583, 1, 1, 1, 1, 1,
0.1200938, -0.6752509, 3.918263, 1, 1, 1, 1, 1,
0.1244114, 1.234275, -0.8485556, 1, 1, 1, 1, 1,
0.1263618, -0.3549042, 2.666263, 1, 1, 1, 1, 1,
0.1281544, 1.616194, -0.8707746, 1, 1, 1, 1, 1,
0.1297016, 0.02677892, 2.180186, 1, 1, 1, 1, 1,
0.1309689, -1.724815, 4.228958, 1, 1, 1, 1, 1,
0.1313713, 0.2939664, 1.459286, 0, 0, 1, 1, 1,
0.1334969, 2.337785, 0.08229597, 1, 0, 0, 1, 1,
0.1350474, -1.48883, 2.383791, 1, 0, 0, 1, 1,
0.1364693, -0.2917207, 1.760677, 1, 0, 0, 1, 1,
0.1365945, 0.4546149, -1.616471, 1, 0, 0, 1, 1,
0.1384262, 0.583105, 1.423426, 1, 0, 0, 1, 1,
0.1394895, 1.742993, 1.064131, 0, 0, 0, 1, 1,
0.1406971, -0.006824318, 2.053122, 0, 0, 0, 1, 1,
0.1412375, -1.14908, 3.003356, 0, 0, 0, 1, 1,
0.1468076, -0.2946578, 4.204009, 0, 0, 0, 1, 1,
0.1522324, -1.421264, 1.922697, 0, 0, 0, 1, 1,
0.1598176, 0.001614092, 1.983825, 0, 0, 0, 1, 1,
0.1625746, -1.593917, 2.262624, 0, 0, 0, 1, 1,
0.1637053, 0.6514849, 0.6529216, 1, 1, 1, 1, 1,
0.1699131, -0.02579346, 2.702705, 1, 1, 1, 1, 1,
0.1732182, 0.6905705, -1.347718, 1, 1, 1, 1, 1,
0.175721, -0.00848052, 2.498653, 1, 1, 1, 1, 1,
0.1757491, 1.311434, 0.7305744, 1, 1, 1, 1, 1,
0.177838, 0.2996262, 1.314973, 1, 1, 1, 1, 1,
0.1787252, -1.095598, 1.760822, 1, 1, 1, 1, 1,
0.1801456, -0.4489692, 2.442936, 1, 1, 1, 1, 1,
0.1805722, 1.432816, -0.576062, 1, 1, 1, 1, 1,
0.1809625, -0.006217724, 1.531192, 1, 1, 1, 1, 1,
0.1815957, -1.554847, 3.43804, 1, 1, 1, 1, 1,
0.1819227, -0.8687298, 1.509295, 1, 1, 1, 1, 1,
0.1825824, -0.8114208, 3.389915, 1, 1, 1, 1, 1,
0.1835784, -0.5871053, 3.040031, 1, 1, 1, 1, 1,
0.1855943, -1.146862, 2.965626, 1, 1, 1, 1, 1,
0.1856356, -0.1070269, 4.549526, 0, 0, 1, 1, 1,
0.1856907, 0.6368286, 0.7123035, 1, 0, 0, 1, 1,
0.1862655, -0.4176089, 3.365989, 1, 0, 0, 1, 1,
0.1886984, -0.1066865, 2.991589, 1, 0, 0, 1, 1,
0.189461, 0.05440526, 0.707171, 1, 0, 0, 1, 1,
0.1930356, -0.9653546, 2.63617, 1, 0, 0, 1, 1,
0.1971571, 0.231615, 2.099889, 0, 0, 0, 1, 1,
0.1982132, -0.6552653, 1.343676, 0, 0, 0, 1, 1,
0.1992161, 0.09714352, 1.383551, 0, 0, 0, 1, 1,
0.200909, 1.119938, -0.9849465, 0, 0, 0, 1, 1,
0.2081302, 0.007444597, 1.017906, 0, 0, 0, 1, 1,
0.2081888, -1.529735, 2.288882, 0, 0, 0, 1, 1,
0.2112266, -0.00423613, 1.447579, 0, 0, 0, 1, 1,
0.2121555, 0.895086, -0.4169426, 1, 1, 1, 1, 1,
0.213886, -1.035838, 2.850481, 1, 1, 1, 1, 1,
0.216516, 0.9700367, 0.998785, 1, 1, 1, 1, 1,
0.2175816, 0.644133, -1.577447, 1, 1, 1, 1, 1,
0.2195659, 0.2721286, 0.8524243, 1, 1, 1, 1, 1,
0.2195892, 0.8147357, 0.674891, 1, 1, 1, 1, 1,
0.2208672, 1.541162, 1.439707, 1, 1, 1, 1, 1,
0.2213235, 0.1456631, 1.0033, 1, 1, 1, 1, 1,
0.2269737, -0.6285322, 3.198842, 1, 1, 1, 1, 1,
0.2318399, -0.4300137, 2.388747, 1, 1, 1, 1, 1,
0.2357604, 1.507985, 0.5937853, 1, 1, 1, 1, 1,
0.2478199, 0.2135158, 0.8017844, 1, 1, 1, 1, 1,
0.2489812, 0.4807417, 0.1429598, 1, 1, 1, 1, 1,
0.2515047, 0.2861179, 0.8057575, 1, 1, 1, 1, 1,
0.2567667, 3.053945, -2.25758, 1, 1, 1, 1, 1,
0.2584063, 1.027293, 0.4698487, 0, 0, 1, 1, 1,
0.2663463, -0.8019937, -0.6614847, 1, 0, 0, 1, 1,
0.268023, 1.072728, -0.8663374, 1, 0, 0, 1, 1,
0.2710836, -2.03757, 1.864884, 1, 0, 0, 1, 1,
0.2731951, -1.333316, 2.729537, 1, 0, 0, 1, 1,
0.2748157, 0.01937444, 0.621803, 1, 0, 0, 1, 1,
0.2781959, 0.5523492, -0.3606432, 0, 0, 0, 1, 1,
0.2785662, -1.348046, 2.724419, 0, 0, 0, 1, 1,
0.2829413, -0.6833267, 2.804038, 0, 0, 0, 1, 1,
0.2834646, 1.542419, 2.786735, 0, 0, 0, 1, 1,
0.2941082, -0.2270222, 2.249912, 0, 0, 0, 1, 1,
0.2952916, -0.8159268, 2.623121, 0, 0, 0, 1, 1,
0.2953, -0.2685686, 1.813449, 0, 0, 0, 1, 1,
0.2965167, -0.9906352, 1.879068, 1, 1, 1, 1, 1,
0.296801, 0.3123729, 0.9918671, 1, 1, 1, 1, 1,
0.2995189, 1.695896, 0.01157552, 1, 1, 1, 1, 1,
0.3003016, 1.198526, 1.894008, 1, 1, 1, 1, 1,
0.3029808, 0.8029, 2.602021, 1, 1, 1, 1, 1,
0.3032777, -1.136608, 2.85778, 1, 1, 1, 1, 1,
0.3043756, -0.4696582, 2.335676, 1, 1, 1, 1, 1,
0.3066435, -0.2960973, 1.539337, 1, 1, 1, 1, 1,
0.3068948, -1.804949, 1.142319, 1, 1, 1, 1, 1,
0.3124485, 0.9932954, -0.009223158, 1, 1, 1, 1, 1,
0.3148775, 0.3844818, 1.513486, 1, 1, 1, 1, 1,
0.3175719, 0.984969, 3.278008, 1, 1, 1, 1, 1,
0.3242008, -1.410564, 2.672688, 1, 1, 1, 1, 1,
0.3261828, -0.6156546, 1.544927, 1, 1, 1, 1, 1,
0.3299338, 1.53264, -0.3079213, 1, 1, 1, 1, 1,
0.3309773, 0.5083582, 1.411954, 0, 0, 1, 1, 1,
0.3318048, -0.1784891, 0.9097962, 1, 0, 0, 1, 1,
0.3321703, -0.9557779, 1.208054, 1, 0, 0, 1, 1,
0.3329566, 2.945128, -0.7702781, 1, 0, 0, 1, 1,
0.3334758, 2.638499, -0.9581347, 1, 0, 0, 1, 1,
0.3362871, -0.7363228, 4.443351, 1, 0, 0, 1, 1,
0.3374153, -0.02728273, 0.9206505, 0, 0, 0, 1, 1,
0.3404866, -1.640859, 1.725758, 0, 0, 0, 1, 1,
0.341529, 0.5328391, -0.8430762, 0, 0, 0, 1, 1,
0.3428911, -1.030768, 1.944607, 0, 0, 0, 1, 1,
0.3431876, 0.6532987, 0.6263504, 0, 0, 0, 1, 1,
0.3458761, 0.2888587, 0.4567197, 0, 0, 0, 1, 1,
0.3523286, 1.267851, -0.3062027, 0, 0, 0, 1, 1,
0.3530649, 0.3653981, 0.7299277, 1, 1, 1, 1, 1,
0.3533584, -0.5047925, 3.315321, 1, 1, 1, 1, 1,
0.3561977, 0.2509013, 2.513765, 1, 1, 1, 1, 1,
0.3624712, 0.7767515, 0.1850932, 1, 1, 1, 1, 1,
0.3625544, 0.1843226, 1.35125, 1, 1, 1, 1, 1,
0.363009, 0.04190117, 0.5917938, 1, 1, 1, 1, 1,
0.3659762, 0.3285935, 0.004229069, 1, 1, 1, 1, 1,
0.3682019, -2.13089, 2.665614, 1, 1, 1, 1, 1,
0.376338, 3.025229, 1.236361, 1, 1, 1, 1, 1,
0.3771594, 0.648367, -0.4916687, 1, 1, 1, 1, 1,
0.3794008, -1.524876, 3.572182, 1, 1, 1, 1, 1,
0.3794999, 0.8380394, 1.347234, 1, 1, 1, 1, 1,
0.3855894, 1.527772, -0.1714741, 1, 1, 1, 1, 1,
0.3894324, -0.06766196, 1.664791, 1, 1, 1, 1, 1,
0.3947547, -2.556244, 3.071913, 1, 1, 1, 1, 1,
0.3949262, 0.9617241, 0.7673796, 0, 0, 1, 1, 1,
0.3977215, -0.2726858, 2.560504, 1, 0, 0, 1, 1,
0.3986844, -2.682973, 4.693199, 1, 0, 0, 1, 1,
0.3997849, -1.042167, 3.380113, 1, 0, 0, 1, 1,
0.4098331, 0.2153675, 0.5933853, 1, 0, 0, 1, 1,
0.4155958, 0.8250923, 2.111945, 1, 0, 0, 1, 1,
0.4194831, -0.1550034, 2.478996, 0, 0, 0, 1, 1,
0.420679, 0.09192593, 2.055335, 0, 0, 0, 1, 1,
0.4235464, 0.1667241, 0.928862, 0, 0, 0, 1, 1,
0.4244571, 1.095239, 0.2545203, 0, 0, 0, 1, 1,
0.4285365, 0.333822, 2.439094, 0, 0, 0, 1, 1,
0.4318393, -0.2865825, 1.967818, 0, 0, 0, 1, 1,
0.433383, 1.722427, -0.6682678, 0, 0, 0, 1, 1,
0.4372574, 0.02999244, 2.450866, 1, 1, 1, 1, 1,
0.4383585, -0.3542618, 1.119114, 1, 1, 1, 1, 1,
0.4390427, -0.6725525, 2.613495, 1, 1, 1, 1, 1,
0.4403047, -0.8809991, 4.253463, 1, 1, 1, 1, 1,
0.4421027, -0.7791081, 1.976762, 1, 1, 1, 1, 1,
0.4466433, -0.8952751, 1.656567, 1, 1, 1, 1, 1,
0.4528418, -1.058132, 1.706783, 1, 1, 1, 1, 1,
0.453047, -0.4502588, 1.758397, 1, 1, 1, 1, 1,
0.4596836, 0.6028169, 2.432321, 1, 1, 1, 1, 1,
0.4669505, -0.2964081, 2.004843, 1, 1, 1, 1, 1,
0.4682016, -0.8383808, 2.420018, 1, 1, 1, 1, 1,
0.4690809, 1.29653, -0.09798431, 1, 1, 1, 1, 1,
0.4734116, 1.218223, 0.1841158, 1, 1, 1, 1, 1,
0.4760075, -1.275683, 0.9922093, 1, 1, 1, 1, 1,
0.4813314, 1.706379, 1.02107, 1, 1, 1, 1, 1,
0.4830768, 0.3784954, 0.5090093, 0, 0, 1, 1, 1,
0.483152, 0.2436407, 1.248139, 1, 0, 0, 1, 1,
0.4859172, -1.509155, 3.648467, 1, 0, 0, 1, 1,
0.4916431, -0.3888592, 2.192253, 1, 0, 0, 1, 1,
0.4938072, 0.6190915, 1.842967, 1, 0, 0, 1, 1,
0.4955069, 2.771175, -0.4978357, 1, 0, 0, 1, 1,
0.4975037, 0.8773474, -1.782371, 0, 0, 0, 1, 1,
0.5037854, -1.572928, 3.092686, 0, 0, 0, 1, 1,
0.5072919, 0.9197969, 0.09746403, 0, 0, 0, 1, 1,
0.5081339, -0.7479929, 1.098325, 0, 0, 0, 1, 1,
0.510355, 0.1697242, 1.199583, 0, 0, 0, 1, 1,
0.5105121, 0.35043, 0.8181303, 0, 0, 0, 1, 1,
0.5207409, -0.1760573, 1.002405, 0, 0, 0, 1, 1,
0.5279784, -1.917235, 2.38067, 1, 1, 1, 1, 1,
0.5342147, 0.8439054, -0.464457, 1, 1, 1, 1, 1,
0.5377748, 0.5134776, 0.2894949, 1, 1, 1, 1, 1,
0.539896, 0.3822137, 1.902813, 1, 1, 1, 1, 1,
0.5453062, -0.6832868, 2.800794, 1, 1, 1, 1, 1,
0.5610201, 0.9669311, 1.174849, 1, 1, 1, 1, 1,
0.5681936, -0.484085, 1.687921, 1, 1, 1, 1, 1,
0.5683737, -1.060816, 2.119683, 1, 1, 1, 1, 1,
0.5730487, 0.7348471, 1.823931, 1, 1, 1, 1, 1,
0.5734856, 0.5509568, 0.4059207, 1, 1, 1, 1, 1,
0.5833473, -0.3549174, -0.3434047, 1, 1, 1, 1, 1,
0.5845648, 0.3103336, 1.078727, 1, 1, 1, 1, 1,
0.585338, 0.3325674, 0.792045, 1, 1, 1, 1, 1,
0.5865342, 0.7440857, 0.583469, 1, 1, 1, 1, 1,
0.5867388, 0.2934103, 0.7071661, 1, 1, 1, 1, 1,
0.5872636, -2.546103, 2.545032, 0, 0, 1, 1, 1,
0.5921385, -0.3867625, 4.581683, 1, 0, 0, 1, 1,
0.5976352, -1.333579, 1.771541, 1, 0, 0, 1, 1,
0.6005399, -0.5473441, 3.193907, 1, 0, 0, 1, 1,
0.6027402, 0.1542131, 1.773991, 1, 0, 0, 1, 1,
0.6110278, -0.3407934, 2.713118, 1, 0, 0, 1, 1,
0.6111788, -0.7287126, 1.097042, 0, 0, 0, 1, 1,
0.6138764, 0.8095465, 0.367958, 0, 0, 0, 1, 1,
0.6179868, 1.053108, 0.9037622, 0, 0, 0, 1, 1,
0.6219645, 0.2248012, 1.894855, 0, 0, 0, 1, 1,
0.6233487, -0.8433905, 2.385214, 0, 0, 0, 1, 1,
0.6235585, 0.3858475, 0.1275742, 0, 0, 0, 1, 1,
0.6338856, 1.004369, -0.05960533, 0, 0, 0, 1, 1,
0.6340428, -1.215632, 1.440364, 1, 1, 1, 1, 1,
0.6359734, -0.3068667, 2.91048, 1, 1, 1, 1, 1,
0.6373028, -0.4009372, 1.434573, 1, 1, 1, 1, 1,
0.6405817, 2.153098, -0.6560226, 1, 1, 1, 1, 1,
0.6409499, -2.126515, 2.47369, 1, 1, 1, 1, 1,
0.6423286, -0.7160728, 2.105882, 1, 1, 1, 1, 1,
0.6444049, 0.820943, -0.09122808, 1, 1, 1, 1, 1,
0.6450077, 1.601454, -0.06601109, 1, 1, 1, 1, 1,
0.6468993, -0.2766063, 1.776097, 1, 1, 1, 1, 1,
0.6485609, -1.307575, 2.814037, 1, 1, 1, 1, 1,
0.6517364, 0.3728309, -0.8943908, 1, 1, 1, 1, 1,
0.651992, -0.8828962, 2.670384, 1, 1, 1, 1, 1,
0.6530225, 0.7138206, 3.139211, 1, 1, 1, 1, 1,
0.6541516, -0.03959246, 0.8392267, 1, 1, 1, 1, 1,
0.656029, -0.1067507, 0.2408038, 1, 1, 1, 1, 1,
0.6664545, 0.3789731, 1.005035, 0, 0, 1, 1, 1,
0.6768706, -0.3639322, 0.9200347, 1, 0, 0, 1, 1,
0.6781355, 0.1285674, 0.2468523, 1, 0, 0, 1, 1,
0.6784779, 0.7299951, 0.16654, 1, 0, 0, 1, 1,
0.6823646, -0.5465579, 0.7131892, 1, 0, 0, 1, 1,
0.6841466, 1.288453, 0.4601571, 1, 0, 0, 1, 1,
0.6854585, 0.1424905, 1.472304, 0, 0, 0, 1, 1,
0.6916922, -0.5054493, 0.7103308, 0, 0, 0, 1, 1,
0.6941406, 0.9048252, 2.226088, 0, 0, 0, 1, 1,
0.6968163, -0.7292174, 2.868628, 0, 0, 0, 1, 1,
0.698316, 0.149582, 1.702225, 0, 0, 0, 1, 1,
0.7025216, 1.225398, -0.6348962, 0, 0, 0, 1, 1,
0.7054262, -0.6385128, 2.048585, 0, 0, 0, 1, 1,
0.7100254, -1.069116, 2.226628, 1, 1, 1, 1, 1,
0.7139177, 0.5594656, 1.823088, 1, 1, 1, 1, 1,
0.7172571, 0.4245087, 0.3780294, 1, 1, 1, 1, 1,
0.719539, -0.3468409, 1.275785, 1, 1, 1, 1, 1,
0.7285804, -0.6866183, 4.076119, 1, 1, 1, 1, 1,
0.7341714, -2.368072, 2.793223, 1, 1, 1, 1, 1,
0.7405488, 0.3933852, 2.272068, 1, 1, 1, 1, 1,
0.7449605, 0.8763876, 1.822236, 1, 1, 1, 1, 1,
0.7505202, 0.9619568, 1.911976, 1, 1, 1, 1, 1,
0.7510839, 0.3183725, 1.030899, 1, 1, 1, 1, 1,
0.7541866, -1.346113, 1.552102, 1, 1, 1, 1, 1,
0.7569767, -0.9216936, 1.921576, 1, 1, 1, 1, 1,
0.7611121, -0.7145094, 2.676097, 1, 1, 1, 1, 1,
0.7669658, -1.163256, 2.366169, 1, 1, 1, 1, 1,
0.7674059, 0.3728658, 2.332777, 1, 1, 1, 1, 1,
0.7705513, -0.8064337, 3.479867, 0, 0, 1, 1, 1,
0.7716539, 0.410764, 1.368034, 1, 0, 0, 1, 1,
0.7734177, -1.903034, 2.362183, 1, 0, 0, 1, 1,
0.7757537, 0.05822947, 1.337312, 1, 0, 0, 1, 1,
0.7769368, -1.522135, 3.059106, 1, 0, 0, 1, 1,
0.7816862, 1.291626, 0.3558698, 1, 0, 0, 1, 1,
0.7894621, -0.001595132, 1.169964, 0, 0, 0, 1, 1,
0.793252, 0.6847095, 0.4707344, 0, 0, 0, 1, 1,
0.7949328, -0.2159412, 2.322476, 0, 0, 0, 1, 1,
0.8035311, 0.2215396, -0.5629669, 0, 0, 0, 1, 1,
0.8112295, -2.106101, 1.250999, 0, 0, 0, 1, 1,
0.8132967, -1.239404, 4.472108, 0, 0, 0, 1, 1,
0.8243611, -1.111874, 2.680327, 0, 0, 0, 1, 1,
0.8250754, -1.246754, 4.086287, 1, 1, 1, 1, 1,
0.8252059, 0.685522, 2.000739, 1, 1, 1, 1, 1,
0.8305737, -1.103993, 1.830704, 1, 1, 1, 1, 1,
0.8358118, -0.7671565, 1.470885, 1, 1, 1, 1, 1,
0.8377053, -0.1995414, 0.8448373, 1, 1, 1, 1, 1,
0.8388388, -1.820053, 3.567776, 1, 1, 1, 1, 1,
0.8413433, 0.8318239, 1.510817, 1, 1, 1, 1, 1,
0.8442996, 0.9505996, 0.398422, 1, 1, 1, 1, 1,
0.8452775, 1.650839, 1.052347, 1, 1, 1, 1, 1,
0.8506246, -1.365651, 2.785991, 1, 1, 1, 1, 1,
0.8510363, 1.307266, -0.3244116, 1, 1, 1, 1, 1,
0.8517014, -0.1904977, 1.05691, 1, 1, 1, 1, 1,
0.8558587, 0.05074311, 2.833648, 1, 1, 1, 1, 1,
0.859859, -0.6273822, 2.889045, 1, 1, 1, 1, 1,
0.8614617, -0.8385106, 1.272097, 1, 1, 1, 1, 1,
0.8626443, -1.284768, 1.624717, 0, 0, 1, 1, 1,
0.8673437, 0.1455069, 1.545703, 1, 0, 0, 1, 1,
0.8679051, -1.569148, 0.7462151, 1, 0, 0, 1, 1,
0.8687955, -1.71479, 2.303572, 1, 0, 0, 1, 1,
0.8731222, -0.64841, 2.711638, 1, 0, 0, 1, 1,
0.8744299, -0.2856589, 1.441121, 1, 0, 0, 1, 1,
0.8762694, 0.1301588, 1.966, 0, 0, 0, 1, 1,
0.8838762, -1.662572, 2.713173, 0, 0, 0, 1, 1,
0.9065977, 0.981011, 0.4212147, 0, 0, 0, 1, 1,
0.9078997, 0.8576949, 0.8040008, 0, 0, 0, 1, 1,
0.9134329, -0.9674374, 2.804632, 0, 0, 0, 1, 1,
0.9222024, 1.291047, -0.3540106, 0, 0, 0, 1, 1,
0.9297737, -0.2338793, 2.842865, 0, 0, 0, 1, 1,
0.9372219, -0.2597862, 2.288444, 1, 1, 1, 1, 1,
0.9384221, 1.436816, 0.7059756, 1, 1, 1, 1, 1,
0.943446, 0.9673811, 1.225797, 1, 1, 1, 1, 1,
0.9504611, 0.6271189, 2.017117, 1, 1, 1, 1, 1,
0.9526367, -1.048995, 2.183854, 1, 1, 1, 1, 1,
0.959448, -1.470176, 3.133335, 1, 1, 1, 1, 1,
0.9611481, -0.2997079, 0.3207552, 1, 1, 1, 1, 1,
0.9647487, 0.6996113, -0.1803871, 1, 1, 1, 1, 1,
0.9664732, -1.268861, 2.543225, 1, 1, 1, 1, 1,
0.9778669, -1.672314, 2.62595, 1, 1, 1, 1, 1,
0.9831208, -0.2378285, 1.969155, 1, 1, 1, 1, 1,
0.9895968, -0.2963633, 2.509078, 1, 1, 1, 1, 1,
0.9935032, 0.9558269, 0.4200487, 1, 1, 1, 1, 1,
0.9967897, -0.2987989, 2.758445, 1, 1, 1, 1, 1,
1.012408, 0.719431, 0.7510117, 1, 1, 1, 1, 1,
1.01326, -1.640909, 2.989709, 0, 0, 1, 1, 1,
1.023927, -1.023672, 3.88853, 1, 0, 0, 1, 1,
1.028874, -0.2022781, 0.8698226, 1, 0, 0, 1, 1,
1.044471, -0.3112846, 2.170226, 1, 0, 0, 1, 1,
1.046635, -1.577467, 3.657856, 1, 0, 0, 1, 1,
1.061982, 1.179131, 2.126339, 1, 0, 0, 1, 1,
1.06706, 0.1001753, 2.176788, 0, 0, 0, 1, 1,
1.076075, 1.130805, -0.8505121, 0, 0, 0, 1, 1,
1.085324, -0.7575784, 1.115432, 0, 0, 0, 1, 1,
1.091553, 2.372064, 2.551437, 0, 0, 0, 1, 1,
1.10901, 0.878427, 1.218783, 0, 0, 0, 1, 1,
1.111393, 0.3089699, -0.9675077, 0, 0, 0, 1, 1,
1.112989, 1.155998, 3.179928, 0, 0, 0, 1, 1,
1.119709, -1.305031, 2.027268, 1, 1, 1, 1, 1,
1.120633, -0.3434067, 4.079885, 1, 1, 1, 1, 1,
1.125707, 0.4194655, 1.564622, 1, 1, 1, 1, 1,
1.1339, -1.111608, 2.49757, 1, 1, 1, 1, 1,
1.135527, -0.1021151, 1.775478, 1, 1, 1, 1, 1,
1.138293, 0.3734418, -0.2146533, 1, 1, 1, 1, 1,
1.140735, 0.9140373, 2.768414, 1, 1, 1, 1, 1,
1.154328, 1.349012, -0.9638518, 1, 1, 1, 1, 1,
1.159418, -0.6601768, 1.775615, 1, 1, 1, 1, 1,
1.160071, -0.5485604, 3.774422, 1, 1, 1, 1, 1,
1.179373, -1.26511, 1.800297, 1, 1, 1, 1, 1,
1.182628, 0.2337109, 1.94857, 1, 1, 1, 1, 1,
1.185037, -1.998843, 2.073388, 1, 1, 1, 1, 1,
1.187866, 1.382994, 0.720187, 1, 1, 1, 1, 1,
1.188766, -0.2243558, 1.075433, 1, 1, 1, 1, 1,
1.201165, -0.4291809, -0.1941959, 0, 0, 1, 1, 1,
1.205191, 0.1394064, 1.457013, 1, 0, 0, 1, 1,
1.207384, -0.4333382, 0.7441803, 1, 0, 0, 1, 1,
1.211181, 0.4030286, 0.8402017, 1, 0, 0, 1, 1,
1.21191, -0.4968123, 0.7194528, 1, 0, 0, 1, 1,
1.215056, -2.445499, 4.232582, 1, 0, 0, 1, 1,
1.218725, -0.01292843, 0.4151515, 0, 0, 0, 1, 1,
1.219831, -0.09120009, 2.790334, 0, 0, 0, 1, 1,
1.225309, -1.546781, 2.047634, 0, 0, 0, 1, 1,
1.239476, 1.21946, 0.8450207, 0, 0, 0, 1, 1,
1.239621, 0.860188, 3.423101, 0, 0, 0, 1, 1,
1.242948, -0.7854748, 2.298046, 0, 0, 0, 1, 1,
1.246298, 1.685937, 0.4461892, 0, 0, 0, 1, 1,
1.250529, 1.717313, -1.189218, 1, 1, 1, 1, 1,
1.252347, 1.179016, 1.820985, 1, 1, 1, 1, 1,
1.254086, 0.8600774, 2.532151, 1, 1, 1, 1, 1,
1.266548, 0.03256209, 0.6820373, 1, 1, 1, 1, 1,
1.272476, -0.9177399, 0.965847, 1, 1, 1, 1, 1,
1.27352, 0.1603312, 1.215792, 1, 1, 1, 1, 1,
1.273867, 0.5638821, 2.204153, 1, 1, 1, 1, 1,
1.274503, -1.044137, 0.8601924, 1, 1, 1, 1, 1,
1.28218, -0.6899514, 2.579037, 1, 1, 1, 1, 1,
1.293694, -1.021173, 2.643107, 1, 1, 1, 1, 1,
1.296393, 0.6342189, 0.502261, 1, 1, 1, 1, 1,
1.297134, -0.398651, 0.944476, 1, 1, 1, 1, 1,
1.298031, 1.264644, 1.108213, 1, 1, 1, 1, 1,
1.30264, 0.3539657, 1.983988, 1, 1, 1, 1, 1,
1.310063, -0.3078524, 2.579309, 1, 1, 1, 1, 1,
1.310066, -0.5452276, 3.050061, 0, 0, 1, 1, 1,
1.327471, 1.552801, 0.02293278, 1, 0, 0, 1, 1,
1.328348, 1.29793, 0.3342632, 1, 0, 0, 1, 1,
1.332207, -0.6372911, 2.981982, 1, 0, 0, 1, 1,
1.333578, 0.4566121, 3.054754, 1, 0, 0, 1, 1,
1.348668, -0.838694, 0.9796311, 1, 0, 0, 1, 1,
1.363677, -0.1166847, 1.451219, 0, 0, 0, 1, 1,
1.370562, -0.3916234, 1.032839, 0, 0, 0, 1, 1,
1.37313, 1.165051, 2.181262, 0, 0, 0, 1, 1,
1.373924, 0.965688, -0.1959337, 0, 0, 0, 1, 1,
1.38205, -1.07326, 2.651542, 0, 0, 0, 1, 1,
1.391924, -0.6356636, 3.064995, 0, 0, 0, 1, 1,
1.394943, 0.3820843, 1.951847, 0, 0, 0, 1, 1,
1.401244, -0.5135278, 0.966253, 1, 1, 1, 1, 1,
1.411134, -0.7034719, 0.4407194, 1, 1, 1, 1, 1,
1.412198, 1.169846, 0.4330447, 1, 1, 1, 1, 1,
1.429676, 0.5492942, 2.00579, 1, 1, 1, 1, 1,
1.432404, 0.7435692, -0.3097967, 1, 1, 1, 1, 1,
1.43532, 0.3082263, 0.4701533, 1, 1, 1, 1, 1,
1.435627, -0.1699505, 2.469077, 1, 1, 1, 1, 1,
1.435825, -0.02344038, 0.8544935, 1, 1, 1, 1, 1,
1.439851, -1.020642, 2.484362, 1, 1, 1, 1, 1,
1.447662, 0.8494452, 2.53428, 1, 1, 1, 1, 1,
1.456817, 0.6695038, -1.104427, 1, 1, 1, 1, 1,
1.460414, -0.3191081, 1.823779, 1, 1, 1, 1, 1,
1.490363, 1.543579, -0.791235, 1, 1, 1, 1, 1,
1.495762, -0.5075401, 2.356327, 1, 1, 1, 1, 1,
1.50194, 1.59154, 0.1021404, 1, 1, 1, 1, 1,
1.507255, -0.4966339, 1.610598, 0, 0, 1, 1, 1,
1.509219, 0.3473408, 2.507737, 1, 0, 0, 1, 1,
1.524545, -1.911568, 2.155194, 1, 0, 0, 1, 1,
1.526802, 2.02554, 0.0989709, 1, 0, 0, 1, 1,
1.531894, 0.526561, 2.584771, 1, 0, 0, 1, 1,
1.542427, -1.120668, 2.001109, 1, 0, 0, 1, 1,
1.543497, -0.2132366, 1.945399, 0, 0, 0, 1, 1,
1.549202, 0.107511, -0.8283531, 0, 0, 0, 1, 1,
1.552523, 0.977037, -0.8026429, 0, 0, 0, 1, 1,
1.556275, -0.7364597, 1.603983, 0, 0, 0, 1, 1,
1.5725, 1.246271, 0.7447827, 0, 0, 0, 1, 1,
1.579932, 1.191631, 2.541823, 0, 0, 0, 1, 1,
1.59371, -0.3471409, 2.521112, 0, 0, 0, 1, 1,
1.63208, 2.107091, -0.4072041, 1, 1, 1, 1, 1,
1.640514, -1.957863, 1.023144, 1, 1, 1, 1, 1,
1.647429, -0.6446459, 0.933274, 1, 1, 1, 1, 1,
1.647512, 0.5482059, 0.4692044, 1, 1, 1, 1, 1,
1.650081, -0.4219985, 0.1390497, 1, 1, 1, 1, 1,
1.65212, 1.446488, 0.8096415, 1, 1, 1, 1, 1,
1.654782, -0.8024018, 1.56723, 1, 1, 1, 1, 1,
1.654946, 0.3051834, -0.3754573, 1, 1, 1, 1, 1,
1.666728, 0.5324854, 0.3295119, 1, 1, 1, 1, 1,
1.669433, 0.4398703, 1.529148, 1, 1, 1, 1, 1,
1.670721, 0.5402632, 0.7075216, 1, 1, 1, 1, 1,
1.673314, 1.611626, 0.1693973, 1, 1, 1, 1, 1,
1.677847, 0.0625622, 0.2801891, 1, 1, 1, 1, 1,
1.680767, 0.8983503, 0.4185971, 1, 1, 1, 1, 1,
1.685852, 0.4816975, 0.8171421, 1, 1, 1, 1, 1,
1.689597, 0.7022243, 0.1584486, 0, 0, 1, 1, 1,
1.70751, -0.7437119, 1.091517, 1, 0, 0, 1, 1,
1.712284, 0.5489051, -0.5994299, 1, 0, 0, 1, 1,
1.719138, -0.1128829, 2.283701, 1, 0, 0, 1, 1,
1.720846, -0.4806044, 0.8943289, 1, 0, 0, 1, 1,
1.721887, 0.6338317, 1.576915, 1, 0, 0, 1, 1,
1.726188, 0.05909027, 2.197207, 0, 0, 0, 1, 1,
1.747654, 0.4206617, 0.3200158, 0, 0, 0, 1, 1,
1.74825, -0.5642919, 2.066747, 0, 0, 0, 1, 1,
1.753852, 0.7324009, 1.841457, 0, 0, 0, 1, 1,
1.770279, -0.7040451, 1.871842, 0, 0, 0, 1, 1,
1.778114, 0.3979536, 1.808851, 0, 0, 0, 1, 1,
1.785789, -0.9170325, 2.700778, 0, 0, 0, 1, 1,
1.818154, -1.39115, 1.918133, 1, 1, 1, 1, 1,
1.832785, 0.2560598, 0.8342245, 1, 1, 1, 1, 1,
1.838604, -0.2273499, 2.802151, 1, 1, 1, 1, 1,
1.840347, 1.597151, 2.59186, 1, 1, 1, 1, 1,
1.842713, 1.313209, 0.01433812, 1, 1, 1, 1, 1,
1.843938, -1.574781, 4.246968, 1, 1, 1, 1, 1,
1.856394, -0.004473011, 1.760492, 1, 1, 1, 1, 1,
1.85852, -0.3207995, 2.661954, 1, 1, 1, 1, 1,
1.870663, -2.030425, 3.479695, 1, 1, 1, 1, 1,
1.881598, -0.3226936, 2.218642, 1, 1, 1, 1, 1,
1.894269, -0.5007311, 1.801014, 1, 1, 1, 1, 1,
1.900588, 0.380803, 3.001709, 1, 1, 1, 1, 1,
1.906682, -0.9699647, 3.376689, 1, 1, 1, 1, 1,
1.915454, -0.7971428, 0.9897545, 1, 1, 1, 1, 1,
1.942154, 1.438602, 2.297733, 1, 1, 1, 1, 1,
1.949569, 0.1742265, 0.9145589, 0, 0, 1, 1, 1,
1.959281, -0.2035509, 0.1525853, 1, 0, 0, 1, 1,
1.993278, 0.1460017, 2.477898, 1, 0, 0, 1, 1,
2.031624, 1.804639, 1.68697, 1, 0, 0, 1, 1,
2.045063, -1.044395, 2.09547, 1, 0, 0, 1, 1,
2.045409, -1.00969, 3.032684, 1, 0, 0, 1, 1,
2.085833, -1.25231, 1.58796, 0, 0, 0, 1, 1,
2.137886, -0.1671496, 2.879796, 0, 0, 0, 1, 1,
2.139915, -0.4265835, 2.169881, 0, 0, 0, 1, 1,
2.202981, 0.5013617, 0.0378871, 0, 0, 0, 1, 1,
2.28389, 0.1161928, 1.417862, 0, 0, 0, 1, 1,
2.34857, 0.7170577, -0.1609648, 0, 0, 0, 1, 1,
2.367857, 0.1040785, 2.149598, 0, 0, 0, 1, 1,
2.49944, -0.1451971, 2.676008, 1, 1, 1, 1, 1,
2.582452, -0.9327266, -0.4469097, 1, 1, 1, 1, 1,
2.597692, 1.46125, 1.964841, 1, 1, 1, 1, 1,
2.614948, -1.514627, 1.716961, 1, 1, 1, 1, 1,
2.77599, 0.884748, 2.694098, 1, 1, 1, 1, 1,
2.947057, 1.162127, 1.761416, 1, 1, 1, 1, 1,
3.607284, 0.9937133, 0.001713132, 1, 1, 1, 1, 1
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
var radius = 10.04564;
var distance = 35.28489;
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
mvMatrix.translate( -0.1198125, -0.1588917, 0.05606413 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.28489);
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