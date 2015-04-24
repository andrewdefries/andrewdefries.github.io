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
-3.521536, -1.256465, -2.274054, 1, 0, 0, 1,
-3.308187, 1.229601, -1.05419, 1, 0.007843138, 0, 1,
-2.75849, 0.1421601, -1.63605, 1, 0.01176471, 0, 1,
-2.700409, 0.3593455, -2.597021, 1, 0.01960784, 0, 1,
-2.661277, 0.7105886, -1.949524, 1, 0.02352941, 0, 1,
-2.545872, -1.831816, -1.486195, 1, 0.03137255, 0, 1,
-2.508709, -1.878293, -1.852853, 1, 0.03529412, 0, 1,
-2.503678, -0.009771019, -2.017174, 1, 0.04313726, 0, 1,
-2.469925, 0.9580889, 0.3177508, 1, 0.04705882, 0, 1,
-2.458354, 1.410588, -1.383631, 1, 0.05490196, 0, 1,
-2.430099, -0.007668284, -1.442523, 1, 0.05882353, 0, 1,
-2.397228, 0.2703061, -1.326068, 1, 0.06666667, 0, 1,
-2.374408, 0.1376703, 0.717439, 1, 0.07058824, 0, 1,
-2.363635, -0.2647321, -1.14115, 1, 0.07843138, 0, 1,
-2.344687, 0.9559796, -1.687503, 1, 0.08235294, 0, 1,
-2.305387, -0.6655214, -1.950917, 1, 0.09019608, 0, 1,
-2.284417, -0.0713571, -1.540877, 1, 0.09411765, 0, 1,
-2.267633, 0.3564171, -2.576388, 1, 0.1019608, 0, 1,
-2.263113, -1.14821, -2.58313, 1, 0.1098039, 0, 1,
-2.205593, -1.654958, -1.161004, 1, 0.1137255, 0, 1,
-2.199715, 0.5514162, -0.1098821, 1, 0.1215686, 0, 1,
-2.166189, -1.202448, -4.894744, 1, 0.1254902, 0, 1,
-2.136579, 2.002594, -0.3781635, 1, 0.1333333, 0, 1,
-2.091975, 1.179079, -0.192508, 1, 0.1372549, 0, 1,
-2.054448, -1.838625, -1.483777, 1, 0.145098, 0, 1,
-2.03298, -0.208855, -0.8842176, 1, 0.1490196, 0, 1,
-1.991388, 0.525777, -0.549352, 1, 0.1568628, 0, 1,
-1.968272, 0.1077383, -3.543839, 1, 0.1607843, 0, 1,
-1.965143, 0.3224339, -1.055689, 1, 0.1686275, 0, 1,
-1.950678, 0.06753346, -2.36699, 1, 0.172549, 0, 1,
-1.943723, 0.5667929, -2.887232, 1, 0.1803922, 0, 1,
-1.930639, 0.2164395, -1.67856, 1, 0.1843137, 0, 1,
-1.921581, -1.622774, -1.318277, 1, 0.1921569, 0, 1,
-1.921238, 1.257912, -2.001194, 1, 0.1960784, 0, 1,
-1.916549, -1.302165, -1.824894, 1, 0.2039216, 0, 1,
-1.913216, 0.3752673, -1.008288, 1, 0.2117647, 0, 1,
-1.908806, -0.1141265, -2.701981, 1, 0.2156863, 0, 1,
-1.895924, -1.72647, -4.025384, 1, 0.2235294, 0, 1,
-1.890189, 1.543247, -0.6304137, 1, 0.227451, 0, 1,
-1.842832, -0.5049456, -2.29902, 1, 0.2352941, 0, 1,
-1.831109, 0.7513645, -1.76173, 1, 0.2392157, 0, 1,
-1.827316, -0.6676489, -3.007329, 1, 0.2470588, 0, 1,
-1.815298, -0.9145674, -2.81867, 1, 0.2509804, 0, 1,
-1.811707, 0.2425644, -0.06150134, 1, 0.2588235, 0, 1,
-1.777488, 1.113175, -0.4399414, 1, 0.2627451, 0, 1,
-1.739711, -0.9331797, -1.727798, 1, 0.2705882, 0, 1,
-1.685422, -0.1033496, -2.711412, 1, 0.2745098, 0, 1,
-1.680253, 0.6554012, -1.291309, 1, 0.282353, 0, 1,
-1.674017, -0.9663057, -1.530754, 1, 0.2862745, 0, 1,
-1.664901, -0.08797801, -1.243494, 1, 0.2941177, 0, 1,
-1.66396, -1.167926, -1.544786, 1, 0.3019608, 0, 1,
-1.657458, 0.7348961, 1.392601, 1, 0.3058824, 0, 1,
-1.656879, -0.7216955, -2.777914, 1, 0.3137255, 0, 1,
-1.656517, -1.283338, -1.736347, 1, 0.3176471, 0, 1,
-1.653865, 0.8663083, 0.06583736, 1, 0.3254902, 0, 1,
-1.63131, -1.464322, -1.399308, 1, 0.3294118, 0, 1,
-1.628949, -1.121502, -3.540487, 1, 0.3372549, 0, 1,
-1.60852, 0.6265996, -1.492842, 1, 0.3411765, 0, 1,
-1.589013, -0.910035, -1.947122, 1, 0.3490196, 0, 1,
-1.587922, -1.33889, -3.527752, 1, 0.3529412, 0, 1,
-1.577677, 2.629133, -2.195936, 1, 0.3607843, 0, 1,
-1.558924, -0.762845, -2.839544, 1, 0.3647059, 0, 1,
-1.535368, -0.2796442, -0.9487409, 1, 0.372549, 0, 1,
-1.532755, 0.7298242, -0.07464884, 1, 0.3764706, 0, 1,
-1.522707, -1.345914, -2.02189, 1, 0.3843137, 0, 1,
-1.521567, 0.3929149, -0.2554603, 1, 0.3882353, 0, 1,
-1.518105, -0.04056801, -2.152484, 1, 0.3960784, 0, 1,
-1.515667, -0.1498121, -1.302563, 1, 0.4039216, 0, 1,
-1.508856, -0.6280273, -2.739202, 1, 0.4078431, 0, 1,
-1.504254, 1.320045, -1.334436, 1, 0.4156863, 0, 1,
-1.50248, -1.792556, -3.56794, 1, 0.4196078, 0, 1,
-1.500506, 1.208077, -1.878866, 1, 0.427451, 0, 1,
-1.499603, 0.3740483, -1.410026, 1, 0.4313726, 0, 1,
-1.492546, 2.541497, -0.7321179, 1, 0.4392157, 0, 1,
-1.481116, -1.028361, -3.069184, 1, 0.4431373, 0, 1,
-1.480264, -2.028658, -2.436711, 1, 0.4509804, 0, 1,
-1.479814, -0.06406947, -1.80485, 1, 0.454902, 0, 1,
-1.476916, -0.159322, -2.884441, 1, 0.4627451, 0, 1,
-1.45443, -0.5909385, -2.62422, 1, 0.4666667, 0, 1,
-1.443423, 0.1529948, -2.638734, 1, 0.4745098, 0, 1,
-1.408207, 1.183754, -1.536766, 1, 0.4784314, 0, 1,
-1.404873, 1.027037, -2.694786, 1, 0.4862745, 0, 1,
-1.404262, -0.6980717, 0.4364178, 1, 0.4901961, 0, 1,
-1.402835, 1.820776, -0.4315027, 1, 0.4980392, 0, 1,
-1.400903, 0.1386524, -2.444175, 1, 0.5058824, 0, 1,
-1.369335, 0.5220333, -2.535754, 1, 0.509804, 0, 1,
-1.363994, -0.7622373, -2.384957, 1, 0.5176471, 0, 1,
-1.354204, 2.572015, -0.3199268, 1, 0.5215687, 0, 1,
-1.33729, 1.315045, -0.4581395, 1, 0.5294118, 0, 1,
-1.333998, 0.6797999, -1.355985, 1, 0.5333334, 0, 1,
-1.331183, 0.6192626, -0.9507315, 1, 0.5411765, 0, 1,
-1.325615, 1.112777, -0.1721499, 1, 0.5450981, 0, 1,
-1.315116, -2.484234, -1.858628, 1, 0.5529412, 0, 1,
-1.30958, -0.9111076, -2.158525, 1, 0.5568628, 0, 1,
-1.300501, -0.2947537, -1.152977, 1, 0.5647059, 0, 1,
-1.292997, 0.5251857, -1.449579, 1, 0.5686275, 0, 1,
-1.287763, 2.133033, 1.384986, 1, 0.5764706, 0, 1,
-1.273062, -1.10483, -2.583109, 1, 0.5803922, 0, 1,
-1.265606, -1.595999, -2.056916, 1, 0.5882353, 0, 1,
-1.261976, 0.54095, -1.970991, 1, 0.5921569, 0, 1,
-1.260232, 0.937449, -1.946574, 1, 0.6, 0, 1,
-1.243913, 2.372903, 2.062433, 1, 0.6078432, 0, 1,
-1.24379, -0.656073, -3.319964, 1, 0.6117647, 0, 1,
-1.243268, -0.4395421, -3.799521, 1, 0.6196079, 0, 1,
-1.222684, -0.718975, -1.902237, 1, 0.6235294, 0, 1,
-1.20425, -1.210675, -3.479918, 1, 0.6313726, 0, 1,
-1.201784, -0.9531057, -3.539128, 1, 0.6352941, 0, 1,
-1.197138, 1.887806, -1.401384, 1, 0.6431373, 0, 1,
-1.196815, -1.254937, -1.975921, 1, 0.6470588, 0, 1,
-1.192862, 2.454584, -0.4499051, 1, 0.654902, 0, 1,
-1.192034, 0.9774538, -0.3525892, 1, 0.6588235, 0, 1,
-1.188933, -0.1238812, -1.540805, 1, 0.6666667, 0, 1,
-1.187222, 0.7375156, -1.207815, 1, 0.6705883, 0, 1,
-1.183663, 0.08047434, -1.13545, 1, 0.6784314, 0, 1,
-1.180816, -0.310584, -0.6113421, 1, 0.682353, 0, 1,
-1.175155, -0.3922101, -2.344361, 1, 0.6901961, 0, 1,
-1.170639, 1.404475, -0.7887192, 1, 0.6941177, 0, 1,
-1.169308, -0.1015455, -0.6350643, 1, 0.7019608, 0, 1,
-1.148643, 2.608122, -1.06026, 1, 0.7098039, 0, 1,
-1.145706, 0.6733358, 0.02424315, 1, 0.7137255, 0, 1,
-1.143927, 0.5771467, -0.9423469, 1, 0.7215686, 0, 1,
-1.127924, 0.8800196, -2.255009, 1, 0.7254902, 0, 1,
-1.123254, -0.3309574, -1.576492, 1, 0.7333333, 0, 1,
-1.121109, -0.8103712, -0.5267974, 1, 0.7372549, 0, 1,
-1.11189, 0.9464305, -0.6644778, 1, 0.7450981, 0, 1,
-1.102644, 1.084555, -1.89002, 1, 0.7490196, 0, 1,
-1.100401, 1.08682, -2.402866, 1, 0.7568628, 0, 1,
-1.095652, 0.6364698, 0.237147, 1, 0.7607843, 0, 1,
-1.090827, 2.747219, -0.8344066, 1, 0.7686275, 0, 1,
-1.090529, -0.9140227, -2.065124, 1, 0.772549, 0, 1,
-1.088921, 0.5682446, -0.4934653, 1, 0.7803922, 0, 1,
-1.08173, -0.6702494, 0.283755, 1, 0.7843137, 0, 1,
-1.080068, 0.1548668, -1.67315, 1, 0.7921569, 0, 1,
-1.077026, -1.883802, -3.042738, 1, 0.7960784, 0, 1,
-1.060475, -0.641743, -1.768909, 1, 0.8039216, 0, 1,
-1.053776, 0.00381176, -1.806478, 1, 0.8117647, 0, 1,
-1.047424, 0.7472438, -0.9498937, 1, 0.8156863, 0, 1,
-1.047025, -1.230209, -3.734624, 1, 0.8235294, 0, 1,
-1.046802, 0.2900792, -0.3425921, 1, 0.827451, 0, 1,
-1.042886, -0.1093202, -2.188884, 1, 0.8352941, 0, 1,
-1.037518, -0.6933361, -0.8386909, 1, 0.8392157, 0, 1,
-1.037427, 0.3232945, -2.286156, 1, 0.8470588, 0, 1,
-1.036217, -1.419926, -4.650248, 1, 0.8509804, 0, 1,
-1.023751, 1.419177, -1.468586, 1, 0.8588235, 0, 1,
-1.022425, 0.8121317, 0.5620468, 1, 0.8627451, 0, 1,
-1.020348, 0.3787458, -1.699823, 1, 0.8705882, 0, 1,
-1.006107, -0.02319868, -1.125167, 1, 0.8745098, 0, 1,
-1.005773, -0.2887937, -0.2033973, 1, 0.8823529, 0, 1,
-1.001235, 3.072534, -0.4963334, 1, 0.8862745, 0, 1,
-0.9958553, 0.9042929, -3.12226, 1, 0.8941177, 0, 1,
-0.9951021, -0.7571652, -2.22412, 1, 0.8980392, 0, 1,
-0.9937953, -1.075274, -2.58635, 1, 0.9058824, 0, 1,
-0.9910582, 0.1279433, -0.9572769, 1, 0.9137255, 0, 1,
-0.9907585, -1.137657, -0.7140073, 1, 0.9176471, 0, 1,
-0.9865447, 1.086684, -1.635416, 1, 0.9254902, 0, 1,
-0.9793058, -1.335554, -2.751612, 1, 0.9294118, 0, 1,
-0.9728575, -0.2838959, -0.6112641, 1, 0.9372549, 0, 1,
-0.968619, -1.000019, -3.412468, 1, 0.9411765, 0, 1,
-0.9631187, 0.2715166, 0.8999704, 1, 0.9490196, 0, 1,
-0.954169, -0.3034692, -1.265184, 1, 0.9529412, 0, 1,
-0.9536812, 0.7539923, 0.2952139, 1, 0.9607843, 0, 1,
-0.9489931, 0.5103028, -1.698622, 1, 0.9647059, 0, 1,
-0.9400483, 0.519058, 0.4728233, 1, 0.972549, 0, 1,
-0.9364482, -0.7035827, -0.4038163, 1, 0.9764706, 0, 1,
-0.9345576, 0.1704965, -1.868797, 1, 0.9843137, 0, 1,
-0.9336837, 0.4055999, -2.395427, 1, 0.9882353, 0, 1,
-0.9270009, 1.776728, 0.4497725, 1, 0.9960784, 0, 1,
-0.9250795, -0.06653927, -1.678778, 0.9960784, 1, 0, 1,
-0.9129257, 1.742758, -1.827853, 0.9921569, 1, 0, 1,
-0.9111203, 1.323373, -2.052124, 0.9843137, 1, 0, 1,
-0.9102576, -0.8868954, -1.869301, 0.9803922, 1, 0, 1,
-0.9101444, 0.5868666, -0.2423389, 0.972549, 1, 0, 1,
-0.9095756, 0.2093168, -0.9267681, 0.9686275, 1, 0, 1,
-0.907566, -1.727234, -3.46359, 0.9607843, 1, 0, 1,
-0.9053481, -0.7916012, -3.222187, 0.9568627, 1, 0, 1,
-0.8952204, 1.389849, -0.1942255, 0.9490196, 1, 0, 1,
-0.8949794, 0.2531685, -0.928733, 0.945098, 1, 0, 1,
-0.8947405, 0.3292559, -1.001952, 0.9372549, 1, 0, 1,
-0.8906044, -0.6057128, -1.850467, 0.9333333, 1, 0, 1,
-0.8882692, -0.3005748, -2.70863, 0.9254902, 1, 0, 1,
-0.8851652, -1.079362, -2.148031, 0.9215686, 1, 0, 1,
-0.8825941, 0.3317728, -2.405716, 0.9137255, 1, 0, 1,
-0.880679, -0.5233044, -2.419171, 0.9098039, 1, 0, 1,
-0.8788948, 0.7519612, -0.4789152, 0.9019608, 1, 0, 1,
-0.8677127, -0.3702145, -0.06861138, 0.8941177, 1, 0, 1,
-0.8666338, 0.07387395, 0.2208232, 0.8901961, 1, 0, 1,
-0.8634057, -0.2249068, -1.072014, 0.8823529, 1, 0, 1,
-0.8581131, 0.7287812, -0.9694947, 0.8784314, 1, 0, 1,
-0.8537675, 0.3074737, -1.848876, 0.8705882, 1, 0, 1,
-0.8526868, -0.936508, -2.948854, 0.8666667, 1, 0, 1,
-0.8521832, -0.3785557, -2.79898, 0.8588235, 1, 0, 1,
-0.844152, 1.135664, -0.2449638, 0.854902, 1, 0, 1,
-0.840412, -0.4905336, -1.744596, 0.8470588, 1, 0, 1,
-0.8393742, -0.009009894, -1.544454, 0.8431373, 1, 0, 1,
-0.8258531, -1.619882, -0.9085605, 0.8352941, 1, 0, 1,
-0.8142316, -0.09920575, -1.683874, 0.8313726, 1, 0, 1,
-0.8141983, 0.7606294, -1.217731, 0.8235294, 1, 0, 1,
-0.8095021, -1.478156, -4.387914, 0.8196079, 1, 0, 1,
-0.8074195, -0.9443858, -1.782697, 0.8117647, 1, 0, 1,
-0.804275, -0.3700652, -2.652204, 0.8078431, 1, 0, 1,
-0.802732, 0.6978387, -0.8837293, 0.8, 1, 0, 1,
-0.7987192, 0.1707748, -0.8294366, 0.7921569, 1, 0, 1,
-0.7870106, 0.9054893, -0.546546, 0.7882353, 1, 0, 1,
-0.7868038, 0.3851666, -0.1740943, 0.7803922, 1, 0, 1,
-0.7858149, 0.3955815, -0.2357129, 0.7764706, 1, 0, 1,
-0.7791212, -1.400441, -1.871477, 0.7686275, 1, 0, 1,
-0.7788318, -0.5321419, -2.633666, 0.7647059, 1, 0, 1,
-0.7709386, 0.02353759, -2.416466, 0.7568628, 1, 0, 1,
-0.76255, 0.8483778, -0.7399414, 0.7529412, 1, 0, 1,
-0.7600428, 0.1618732, -2.556489, 0.7450981, 1, 0, 1,
-0.7560703, 2.223985, -0.1702759, 0.7411765, 1, 0, 1,
-0.7557545, -1.558997, -2.546694, 0.7333333, 1, 0, 1,
-0.7552204, -0.720853, -1.857517, 0.7294118, 1, 0, 1,
-0.7507808, 0.6019189, -1.272726, 0.7215686, 1, 0, 1,
-0.7499333, -0.2915722, -1.844254, 0.7176471, 1, 0, 1,
-0.7493687, -0.393991, -1.338905, 0.7098039, 1, 0, 1,
-0.7418789, 1.4069, 0.07849933, 0.7058824, 1, 0, 1,
-0.7391971, -0.4302138, -1.687439, 0.6980392, 1, 0, 1,
-0.7374054, -0.8013476, -3.392066, 0.6901961, 1, 0, 1,
-0.7340964, 0.0703657, -3.05745, 0.6862745, 1, 0, 1,
-0.7299473, -2.090614, -2.482385, 0.6784314, 1, 0, 1,
-0.7204374, 0.027808, -1.376372, 0.6745098, 1, 0, 1,
-0.7201411, -0.9445529, -2.538763, 0.6666667, 1, 0, 1,
-0.7180624, 0.2327531, -0.7774236, 0.6627451, 1, 0, 1,
-0.7068158, 0.1817036, 1.048624, 0.654902, 1, 0, 1,
-0.7013195, -0.9007897, -0.1582658, 0.6509804, 1, 0, 1,
-0.7004066, -1.56704, -3.247545, 0.6431373, 1, 0, 1,
-0.698626, -0.167223, -1.713796, 0.6392157, 1, 0, 1,
-0.6940479, 1.530668, 0.9874472, 0.6313726, 1, 0, 1,
-0.6897861, 0.2435496, -1.365115, 0.627451, 1, 0, 1,
-0.6838657, -0.8309987, -1.743918, 0.6196079, 1, 0, 1,
-0.6778636, -0.6684504, -2.515978, 0.6156863, 1, 0, 1,
-0.676286, -0.8791049, -1.70856, 0.6078432, 1, 0, 1,
-0.6743702, -0.6338832, -2.581667, 0.6039216, 1, 0, 1,
-0.6630698, -1.1339, -2.388247, 0.5960785, 1, 0, 1,
-0.6597442, 0.7433123, -0.8254224, 0.5882353, 1, 0, 1,
-0.6590803, 0.2590217, -0.7357556, 0.5843138, 1, 0, 1,
-0.6505392, 2.079528, -0.1521626, 0.5764706, 1, 0, 1,
-0.6390137, -0.2613082, -3.065069, 0.572549, 1, 0, 1,
-0.635032, -0.9958867, -2.061151, 0.5647059, 1, 0, 1,
-0.6322755, 2.574724, -0.8410815, 0.5607843, 1, 0, 1,
-0.632261, 0.2235972, -0.4667964, 0.5529412, 1, 0, 1,
-0.6304444, 1.319157, -0.4975699, 0.5490196, 1, 0, 1,
-0.6287869, -1.126066, -3.818128, 0.5411765, 1, 0, 1,
-0.6283436, 1.700961, -2.863295, 0.5372549, 1, 0, 1,
-0.6276324, -0.8414094, -4.253802, 0.5294118, 1, 0, 1,
-0.6274582, 0.2743655, -0.6092821, 0.5254902, 1, 0, 1,
-0.626103, -1.375664, -3.764783, 0.5176471, 1, 0, 1,
-0.6246513, -0.4221692, -1.552751, 0.5137255, 1, 0, 1,
-0.6224138, 1.804766, 1.69276, 0.5058824, 1, 0, 1,
-0.6223008, 0.8112964, -0.1232922, 0.5019608, 1, 0, 1,
-0.6102629, 1.338562, -0.9442377, 0.4941176, 1, 0, 1,
-0.6071944, -0.49433, -2.489732, 0.4862745, 1, 0, 1,
-0.6063181, -0.3553966, -1.515468, 0.4823529, 1, 0, 1,
-0.6056066, -0.0481719, -0.5644784, 0.4745098, 1, 0, 1,
-0.604718, -1.545026, -2.826101, 0.4705882, 1, 0, 1,
-0.5983534, 0.3337694, -1.233454, 0.4627451, 1, 0, 1,
-0.5976483, -1.557107, -4.530362, 0.4588235, 1, 0, 1,
-0.5964811, -1.265218, -5.144653, 0.4509804, 1, 0, 1,
-0.5949812, -0.8670167, -3.314302, 0.4470588, 1, 0, 1,
-0.5911545, -0.2591407, -0.8862881, 0.4392157, 1, 0, 1,
-0.579327, -0.6674452, -0.3927407, 0.4352941, 1, 0, 1,
-0.5791632, -1.297977, -2.793284, 0.427451, 1, 0, 1,
-0.5771949, -0.1876583, -1.769255, 0.4235294, 1, 0, 1,
-0.5766256, 0.4968579, -1.491459, 0.4156863, 1, 0, 1,
-0.5754696, -0.2268919, -4.484992, 0.4117647, 1, 0, 1,
-0.5752144, 0.1429982, -0.3389627, 0.4039216, 1, 0, 1,
-0.574671, 1.507108, -0.9170746, 0.3960784, 1, 0, 1,
-0.5686202, -0.323553, -2.209121, 0.3921569, 1, 0, 1,
-0.5632011, 0.2454566, -0.6631762, 0.3843137, 1, 0, 1,
-0.5630937, 0.9568396, -0.5403008, 0.3803922, 1, 0, 1,
-0.5620496, -1.218708, -3.90555, 0.372549, 1, 0, 1,
-0.5607705, -0.1033077, -2.177307, 0.3686275, 1, 0, 1,
-0.5561426, -1.041999, -1.698841, 0.3607843, 1, 0, 1,
-0.5558113, 1.541133, -0.7219925, 0.3568628, 1, 0, 1,
-0.5528319, -0.1421173, -1.750748, 0.3490196, 1, 0, 1,
-0.5516498, 0.5534251, -1.206513, 0.345098, 1, 0, 1,
-0.5502573, 0.00340922, -1.22022, 0.3372549, 1, 0, 1,
-0.5495951, 0.06434492, -1.449301, 0.3333333, 1, 0, 1,
-0.5474734, -0.3283638, -2.674541, 0.3254902, 1, 0, 1,
-0.5473474, 0.2501157, 0.7472639, 0.3215686, 1, 0, 1,
-0.5471423, -1.190637, -4.356359, 0.3137255, 1, 0, 1,
-0.5414611, 0.687465, -1.802688, 0.3098039, 1, 0, 1,
-0.5412328, 0.5059102, -1.405355, 0.3019608, 1, 0, 1,
-0.5409536, -1.092283, -2.391759, 0.2941177, 1, 0, 1,
-0.5387043, -0.6198714, -1.967232, 0.2901961, 1, 0, 1,
-0.5328199, -0.9524935, -5.001664, 0.282353, 1, 0, 1,
-0.5164553, -0.2872876, -0.09779795, 0.2784314, 1, 0, 1,
-0.5163207, 0.13739, -2.015482, 0.2705882, 1, 0, 1,
-0.5070791, -2.400289, -3.934237, 0.2666667, 1, 0, 1,
-0.5037757, -0.5632293, -3.590242, 0.2588235, 1, 0, 1,
-0.4974953, 1.890934, -0.3676609, 0.254902, 1, 0, 1,
-0.4907851, -1.410327, -2.506377, 0.2470588, 1, 0, 1,
-0.4893464, -0.3429699, -3.176623, 0.2431373, 1, 0, 1,
-0.4890113, -0.7671043, -2.871671, 0.2352941, 1, 0, 1,
-0.4882993, 0.3338403, -3.068793, 0.2313726, 1, 0, 1,
-0.4872916, 0.04363542, -3.263747, 0.2235294, 1, 0, 1,
-0.4860412, -0.6766918, -2.913482, 0.2196078, 1, 0, 1,
-0.4836304, -0.4563272, -2.767484, 0.2117647, 1, 0, 1,
-0.4778356, 1.16009, -2.519652, 0.2078431, 1, 0, 1,
-0.4775771, -0.5480133, -3.067713, 0.2, 1, 0, 1,
-0.4744186, 0.5042575, -3.81105, 0.1921569, 1, 0, 1,
-0.4707628, -0.4644038, -2.294998, 0.1882353, 1, 0, 1,
-0.4660421, 0.5685033, 1.168295, 0.1803922, 1, 0, 1,
-0.463541, 1.692185, -1.068601, 0.1764706, 1, 0, 1,
-0.4624409, 0.4700253, 0.834481, 0.1686275, 1, 0, 1,
-0.4551787, 0.04586682, -2.509707, 0.1647059, 1, 0, 1,
-0.4533595, 0.02080297, -0.8484637, 0.1568628, 1, 0, 1,
-0.4511658, 0.6756881, -0.2144316, 0.1529412, 1, 0, 1,
-0.4502063, -0.4515263, -3.123428, 0.145098, 1, 0, 1,
-0.4490204, 1.328502, -0.532776, 0.1411765, 1, 0, 1,
-0.4460647, 0.8765413, -0.1643937, 0.1333333, 1, 0, 1,
-0.4418114, -0.3834425, -1.684791, 0.1294118, 1, 0, 1,
-0.4412887, 1.197996, -0.3331699, 0.1215686, 1, 0, 1,
-0.4407775, 0.3961978, -0.737367, 0.1176471, 1, 0, 1,
-0.4388642, 1.088119, -1.955153, 0.1098039, 1, 0, 1,
-0.4377892, 0.8902353, -1.040633, 0.1058824, 1, 0, 1,
-0.4375733, -0.1349053, -0.8442724, 0.09803922, 1, 0, 1,
-0.4344823, 1.025636, -0.1261418, 0.09019608, 1, 0, 1,
-0.422307, -0.4335982, -3.329909, 0.08627451, 1, 0, 1,
-0.4154703, 1.010278, -1.643143, 0.07843138, 1, 0, 1,
-0.4133107, -1.523061, -3.398354, 0.07450981, 1, 0, 1,
-0.4087025, -0.6501992, -0.9898359, 0.06666667, 1, 0, 1,
-0.4039039, 0.861734, -1.50011, 0.0627451, 1, 0, 1,
-0.4031831, 0.5605422, -0.2119186, 0.05490196, 1, 0, 1,
-0.3978516, -0.2046794, -1.939974, 0.05098039, 1, 0, 1,
-0.3974499, 2.299412, 1.297006, 0.04313726, 1, 0, 1,
-0.397445, 0.01882766, -0.9846705, 0.03921569, 1, 0, 1,
-0.3942419, -0.3565165, -1.811221, 0.03137255, 1, 0, 1,
-0.3933893, -0.490157, -0.5135639, 0.02745098, 1, 0, 1,
-0.3831584, 0.549247, -0.2210953, 0.01960784, 1, 0, 1,
-0.3779063, -0.3116227, -1.506864, 0.01568628, 1, 0, 1,
-0.3670347, -1.136711, -2.534683, 0.007843138, 1, 0, 1,
-0.3643799, -1.615554, -4.390794, 0.003921569, 1, 0, 1,
-0.363552, 2.078412, 0.1475595, 0, 1, 0.003921569, 1,
-0.3598568, 0.1226612, -1.245025, 0, 1, 0.01176471, 1,
-0.352017, -1.242989, -3.007624, 0, 1, 0.01568628, 1,
-0.3515509, 0.6598855, -1.549029, 0, 1, 0.02352941, 1,
-0.3500631, 0.1006995, -0.4148268, 0, 1, 0.02745098, 1,
-0.3449456, 1.356383, -0.6823589, 0, 1, 0.03529412, 1,
-0.3428786, -0.6274855, -1.778502, 0, 1, 0.03921569, 1,
-0.3386786, -0.1387539, -1.293348, 0, 1, 0.04705882, 1,
-0.3362704, -0.5345436, -3.733968, 0, 1, 0.05098039, 1,
-0.3305458, -1.5039, -2.797481, 0, 1, 0.05882353, 1,
-0.3290687, 0.7616931, 0.233587, 0, 1, 0.0627451, 1,
-0.3274044, 0.1321118, -0.6456306, 0, 1, 0.07058824, 1,
-0.3233709, 0.02098406, -2.654759, 0, 1, 0.07450981, 1,
-0.3186435, -0.5723191, -1.747064, 0, 1, 0.08235294, 1,
-0.3183821, 1.089171, -0.4466567, 0, 1, 0.08627451, 1,
-0.3179027, 1.263021, -0.7316543, 0, 1, 0.09411765, 1,
-0.3148374, -0.03641012, -0.0971035, 0, 1, 0.1019608, 1,
-0.3128425, -1.867119, -4.002669, 0, 1, 0.1058824, 1,
-0.3016582, 0.486909, -1.072527, 0, 1, 0.1137255, 1,
-0.2986068, -0.3173934, -4.335694, 0, 1, 0.1176471, 1,
-0.2955512, 0.4934123, -1.530335, 0, 1, 0.1254902, 1,
-0.2955281, -0.4333083, -3.079614, 0, 1, 0.1294118, 1,
-0.2945446, 0.483115, 1.273453, 0, 1, 0.1372549, 1,
-0.2851701, 1.253076, 0.2784283, 0, 1, 0.1411765, 1,
-0.284019, -0.3746434, -1.527088, 0, 1, 0.1490196, 1,
-0.2818173, 1.787815, 0.2097889, 0, 1, 0.1529412, 1,
-0.2811289, -0.6087375, -1.403211, 0, 1, 0.1607843, 1,
-0.2805614, 0.1068227, -0.07003714, 0, 1, 0.1647059, 1,
-0.2794212, -1.802878, -3.906905, 0, 1, 0.172549, 1,
-0.2777602, 0.5912557, -1.249844, 0, 1, 0.1764706, 1,
-0.2688712, -0.3834666, -3.864882, 0, 1, 0.1843137, 1,
-0.2686106, -2.098217, -3.154482, 0, 1, 0.1882353, 1,
-0.2660071, -1.255341, -1.997837, 0, 1, 0.1960784, 1,
-0.2655209, 0.1651814, -0.7002597, 0, 1, 0.2039216, 1,
-0.2632065, -2.428819, -5.201842, 0, 1, 0.2078431, 1,
-0.2603238, 3.515203, 1.103257, 0, 1, 0.2156863, 1,
-0.2580622, -0.8274273, -1.001655, 0, 1, 0.2196078, 1,
-0.2563777, -0.2757969, -1.124933, 0, 1, 0.227451, 1,
-0.2473785, 1.282363, 0.992588, 0, 1, 0.2313726, 1,
-0.2464023, 0.3204771, -2.015072, 0, 1, 0.2392157, 1,
-0.2449228, -0.8601385, -4.04884, 0, 1, 0.2431373, 1,
-0.2423081, 0.5405676, 0.3395725, 0, 1, 0.2509804, 1,
-0.2376091, -0.4995859, -2.568279, 0, 1, 0.254902, 1,
-0.2336883, -2.423763, -3.015948, 0, 1, 0.2627451, 1,
-0.2329247, 1.395092, -0.4503778, 0, 1, 0.2666667, 1,
-0.2306828, -0.8839194, -2.373426, 0, 1, 0.2745098, 1,
-0.226811, -0.5161206, -2.177356, 0, 1, 0.2784314, 1,
-0.2261988, -0.09148739, -1.134991, 0, 1, 0.2862745, 1,
-0.225125, 0.6466985, -1.279309, 0, 1, 0.2901961, 1,
-0.2109433, -0.4103329, -1.179822, 0, 1, 0.2980392, 1,
-0.2082449, 0.57231, 0.4348602, 0, 1, 0.3058824, 1,
-0.2063956, 0.9858229, 1.713858, 0, 1, 0.3098039, 1,
-0.2063442, 1.40877, 0.3296895, 0, 1, 0.3176471, 1,
-0.2053603, -1.069957, -3.698365, 0, 1, 0.3215686, 1,
-0.2020023, 1.378915, -0.1450306, 0, 1, 0.3294118, 1,
-0.2012988, 0.01836088, -2.126399, 0, 1, 0.3333333, 1,
-0.1919693, 0.8364558, -1.408468, 0, 1, 0.3411765, 1,
-0.187413, -0.1083605, -1.076484, 0, 1, 0.345098, 1,
-0.1777413, -0.2280084, -3.033092, 0, 1, 0.3529412, 1,
-0.1723915, 0.2721576, -0.9473504, 0, 1, 0.3568628, 1,
-0.1707783, 1.879373, 0.7045227, 0, 1, 0.3647059, 1,
-0.1664359, -0.3219622, -3.728365, 0, 1, 0.3686275, 1,
-0.163976, 0.3918734, -0.1451287, 0, 1, 0.3764706, 1,
-0.1630401, 1.920595, 0.1756285, 0, 1, 0.3803922, 1,
-0.1626864, -0.7388456, -1.939623, 0, 1, 0.3882353, 1,
-0.1604217, -1.12297, -2.594426, 0, 1, 0.3921569, 1,
-0.1587382, -0.3424535, -1.140839, 0, 1, 0.4, 1,
-0.1532742, -0.05270785, -1.634957, 0, 1, 0.4078431, 1,
-0.1517521, 0.09884309, -1.964009, 0, 1, 0.4117647, 1,
-0.1459392, -0.1392454, -1.611893, 0, 1, 0.4196078, 1,
-0.142077, -0.6493405, -3.308289, 0, 1, 0.4235294, 1,
-0.1416611, -1.196019, -2.447008, 0, 1, 0.4313726, 1,
-0.1384222, -2.011402, -3.695552, 0, 1, 0.4352941, 1,
-0.1348476, 0.5260348, 0.6596265, 0, 1, 0.4431373, 1,
-0.1340299, -0.08091615, -1.994622, 0, 1, 0.4470588, 1,
-0.133103, 0.5846989, -1.499794, 0, 1, 0.454902, 1,
-0.1288904, 0.003855506, -2.340336, 0, 1, 0.4588235, 1,
-0.12851, 2.005071, 0.2409203, 0, 1, 0.4666667, 1,
-0.1278411, 1.248143, -0.583629, 0, 1, 0.4705882, 1,
-0.1266105, -0.01239941, -0.8358217, 0, 1, 0.4784314, 1,
-0.124705, 1.661348, 0.8767281, 0, 1, 0.4823529, 1,
-0.1234546, 1.180229, -1.116748, 0, 1, 0.4901961, 1,
-0.1195999, -1.323272, -2.85585, 0, 1, 0.4941176, 1,
-0.1192495, -2.435344, -2.554968, 0, 1, 0.5019608, 1,
-0.1184805, 0.2985379, 1.043606, 0, 1, 0.509804, 1,
-0.1173052, -1.478954, -3.440854, 0, 1, 0.5137255, 1,
-0.1172007, 0.7411776, 1.613205, 0, 1, 0.5215687, 1,
-0.1170291, -0.6167377, -2.935396, 0, 1, 0.5254902, 1,
-0.116398, 1.22303, 0.3163821, 0, 1, 0.5333334, 1,
-0.1150465, 0.5164727, -2.830335, 0, 1, 0.5372549, 1,
-0.1141561, 1.255206, -0.4374543, 0, 1, 0.5450981, 1,
-0.1127224, 0.1964113, -0.5762169, 0, 1, 0.5490196, 1,
-0.1125214, 0.602454, -1.955795, 0, 1, 0.5568628, 1,
-0.1109044, 1.689302, -0.6299042, 0, 1, 0.5607843, 1,
-0.1100168, -0.6105853, -0.8849578, 0, 1, 0.5686275, 1,
-0.1098316, 0.4496554, -0.6356885, 0, 1, 0.572549, 1,
-0.1096421, 0.2839547, -0.01010794, 0, 1, 0.5803922, 1,
-0.1096405, -0.3974716, -3.061021, 0, 1, 0.5843138, 1,
-0.1066782, 0.5158622, 1.559581, 0, 1, 0.5921569, 1,
-0.1065931, -0.6518748, -3.743443, 0, 1, 0.5960785, 1,
-0.09942345, -1.574403, -2.238719, 0, 1, 0.6039216, 1,
-0.0993064, -0.1867536, -3.966414, 0, 1, 0.6117647, 1,
-0.09732302, -1.49966, -3.098108, 0, 1, 0.6156863, 1,
-0.09721265, -2.980215, -3.224345, 0, 1, 0.6235294, 1,
-0.09442552, -1.089022, -1.938218, 0, 1, 0.627451, 1,
-0.0849857, 0.1331087, -0.02021528, 0, 1, 0.6352941, 1,
-0.08195248, -1.673379, -2.534438, 0, 1, 0.6392157, 1,
-0.07930635, 1.491082, 0.5562077, 0, 1, 0.6470588, 1,
-0.07614295, 0.2824264, 1.055934, 0, 1, 0.6509804, 1,
-0.07602458, 1.428662, -1.582473, 0, 1, 0.6588235, 1,
-0.07290525, -0.1184377, -2.712619, 0, 1, 0.6627451, 1,
-0.07110066, 0.4633297, 0.3005955, 0, 1, 0.6705883, 1,
-0.06524555, -0.9812605, -4.284288, 0, 1, 0.6745098, 1,
-0.05677417, 0.7895746, 0.5961912, 0, 1, 0.682353, 1,
-0.05447287, 0.5587239, 0.8377291, 0, 1, 0.6862745, 1,
-0.05348514, 1.371484, 0.5377524, 0, 1, 0.6941177, 1,
-0.04989036, -0.440151, -3.667351, 0, 1, 0.7019608, 1,
-0.04819039, -0.4194888, -2.909048, 0, 1, 0.7058824, 1,
-0.04618002, 0.1469655, 0.4890788, 0, 1, 0.7137255, 1,
-0.04504412, 0.8244613, 0.8030922, 0, 1, 0.7176471, 1,
-0.04337311, -2.334536, -3.671657, 0, 1, 0.7254902, 1,
-0.040916, 1.683691, 0.804212, 0, 1, 0.7294118, 1,
-0.03836627, -0.4009111, -2.686871, 0, 1, 0.7372549, 1,
-0.03200877, 2.088941, -0.600567, 0, 1, 0.7411765, 1,
-0.03050825, -0.1247486, -3.656255, 0, 1, 0.7490196, 1,
-0.02865824, 0.1929887, 0.04922504, 0, 1, 0.7529412, 1,
-0.02714984, -1.377415, -3.453731, 0, 1, 0.7607843, 1,
-0.02568625, 0.6019498, 0.2575285, 0, 1, 0.7647059, 1,
-0.02379415, 1.304005, 1.103048, 0, 1, 0.772549, 1,
-0.01938465, -0.03128742, -3.303839, 0, 1, 0.7764706, 1,
-0.01740259, 1.249743, 0.7096469, 0, 1, 0.7843137, 1,
-0.01257104, -1.823352, -3.751597, 0, 1, 0.7882353, 1,
-0.0110107, 1.498179, -0.2007911, 0, 1, 0.7960784, 1,
-0.01031935, 0.8266116, -1.134047, 0, 1, 0.8039216, 1,
-0.01016472, 0.5275141, -1.063594, 0, 1, 0.8078431, 1,
-0.01001671, -0.918787, -4.027711, 0, 1, 0.8156863, 1,
-0.00532093, 1.834916, 0.2398975, 0, 1, 0.8196079, 1,
-0.004575129, -1.497442, -3.177028, 0, 1, 0.827451, 1,
0.004571183, -0.3758562, 2.928476, 0, 1, 0.8313726, 1,
0.007611522, -0.3415948, 5.14178, 0, 1, 0.8392157, 1,
0.008074756, 1.574217, 0.4532584, 0, 1, 0.8431373, 1,
0.008914905, -0.9736979, 4.122145, 0, 1, 0.8509804, 1,
0.01026546, 0.6801858, 0.289551, 0, 1, 0.854902, 1,
0.01447589, 0.3820919, -0.8339785, 0, 1, 0.8627451, 1,
0.01450699, 0.4689675, -1.476685, 0, 1, 0.8666667, 1,
0.01995878, 0.1242787, 1.051334, 0, 1, 0.8745098, 1,
0.02195196, -0.7310183, 2.600569, 0, 1, 0.8784314, 1,
0.02469848, -0.4226406, 3.825067, 0, 1, 0.8862745, 1,
0.03072233, 0.4693756, -1.263604, 0, 1, 0.8901961, 1,
0.03441173, 0.7336845, -0.9847404, 0, 1, 0.8980392, 1,
0.03524177, 0.4694633, 1.676405, 0, 1, 0.9058824, 1,
0.03845299, -2.047772, 2.964563, 0, 1, 0.9098039, 1,
0.04080316, -0.1813908, 1.915353, 0, 1, 0.9176471, 1,
0.04184988, -0.586533, 1.677179, 0, 1, 0.9215686, 1,
0.04208652, 0.5230089, -1.083447, 0, 1, 0.9294118, 1,
0.04993757, 1.144808, -0.8135357, 0, 1, 0.9333333, 1,
0.05123459, -0.3269546, 3.449601, 0, 1, 0.9411765, 1,
0.05227539, 0.4039902, -0.6116963, 0, 1, 0.945098, 1,
0.0526148, 1.504003, -0.3786612, 0, 1, 0.9529412, 1,
0.05284349, 0.5896789, -0.8073057, 0, 1, 0.9568627, 1,
0.05328549, 1.23221, -1.901549, 0, 1, 0.9647059, 1,
0.05348288, 2.020106, -0.758433, 0, 1, 0.9686275, 1,
0.05413368, -0.534125, 2.658629, 0, 1, 0.9764706, 1,
0.05488476, -0.3183443, 1.609593, 0, 1, 0.9803922, 1,
0.05735588, -1.212506, 3.015043, 0, 1, 0.9882353, 1,
0.06356657, -0.2085138, 2.48522, 0, 1, 0.9921569, 1,
0.06583982, 0.6388439, 0.3223081, 0, 1, 1, 1,
0.07497381, -0.165582, 3.299647, 0, 0.9921569, 1, 1,
0.07553718, -3.247758, 4.225393, 0, 0.9882353, 1, 1,
0.07556136, -0.1785923, 3.301141, 0, 0.9803922, 1, 1,
0.07734542, -0.7362961, 3.453156, 0, 0.9764706, 1, 1,
0.08160853, -0.8344941, 4.024857, 0, 0.9686275, 1, 1,
0.08292316, 0.637139, 1.265549, 0, 0.9647059, 1, 1,
0.08429153, 0.3088251, 1.878384, 0, 0.9568627, 1, 1,
0.08772337, -1.091853, 3.344174, 0, 0.9529412, 1, 1,
0.08911974, 1.254094, 1.634319, 0, 0.945098, 1, 1,
0.09037146, -0.4974162, 1.438538, 0, 0.9411765, 1, 1,
0.1065563, -1.101796, 3.340086, 0, 0.9333333, 1, 1,
0.107526, -0.2615864, 4.020398, 0, 0.9294118, 1, 1,
0.1085861, -0.4305452, 3.51531, 0, 0.9215686, 1, 1,
0.1135611, -0.7991375, 1.701722, 0, 0.9176471, 1, 1,
0.1172926, -0.1737549, 1.656877, 0, 0.9098039, 1, 1,
0.1174275, -0.5195714, 3.83834, 0, 0.9058824, 1, 1,
0.118785, -0.549018, 3.573441, 0, 0.8980392, 1, 1,
0.1200504, -0.1917882, 2.046537, 0, 0.8901961, 1, 1,
0.1211047, 1.93308, -1.487221, 0, 0.8862745, 1, 1,
0.1258155, -0.03207692, 2.116349, 0, 0.8784314, 1, 1,
0.1267592, -0.1051582, 3.283944, 0, 0.8745098, 1, 1,
0.1285884, 0.239204, 0.03694281, 0, 0.8666667, 1, 1,
0.1292006, -1.266086, 2.534076, 0, 0.8627451, 1, 1,
0.1355074, -0.002480727, 1.720679, 0, 0.854902, 1, 1,
0.1362643, -1.091569, 3.656119, 0, 0.8509804, 1, 1,
0.1372002, -0.4625609, 3.662585, 0, 0.8431373, 1, 1,
0.1395847, 0.5656205, -0.2719311, 0, 0.8392157, 1, 1,
0.1437805, 0.197481, 0.3176157, 0, 0.8313726, 1, 1,
0.1489763, 0.7729639, -0.0855661, 0, 0.827451, 1, 1,
0.1494794, 1.399692, 2.963554, 0, 0.8196079, 1, 1,
0.1517524, -0.8587482, 2.229051, 0, 0.8156863, 1, 1,
0.1523366, 1.572658, 0.05729551, 0, 0.8078431, 1, 1,
0.1529826, -0.1981329, 3.551861, 0, 0.8039216, 1, 1,
0.155344, 0.6801017, 1.538016, 0, 0.7960784, 1, 1,
0.1628742, -1.564627, 2.249384, 0, 0.7882353, 1, 1,
0.1637681, 0.5580273, 0.2675743, 0, 0.7843137, 1, 1,
0.1680741, -0.2749702, 4.346492, 0, 0.7764706, 1, 1,
0.170412, -2.035735, 3.365156, 0, 0.772549, 1, 1,
0.1720775, 0.1262133, 1.097164, 0, 0.7647059, 1, 1,
0.1742845, 0.8699844, -0.759214, 0, 0.7607843, 1, 1,
0.1748977, -0.4833854, 4.732018, 0, 0.7529412, 1, 1,
0.1781384, -1.342737, 3.504509, 0, 0.7490196, 1, 1,
0.1825996, 0.871644, 1.272339, 0, 0.7411765, 1, 1,
0.1835815, 0.6479605, -0.3198067, 0, 0.7372549, 1, 1,
0.1840039, 0.7084497, 0.3459356, 0, 0.7294118, 1, 1,
0.1844209, 0.8207396, -0.02393857, 0, 0.7254902, 1, 1,
0.184858, -1.283568, 3.861741, 0, 0.7176471, 1, 1,
0.1864578, 1.227918, -1.653373, 0, 0.7137255, 1, 1,
0.192214, -2.500905, 0.8355946, 0, 0.7058824, 1, 1,
0.1923578, 0.0741087, 1.296787, 0, 0.6980392, 1, 1,
0.1927643, 0.7520128, 0.7016379, 0, 0.6941177, 1, 1,
0.1935035, -0.2156341, 3.346183, 0, 0.6862745, 1, 1,
0.1958935, -0.2344313, 2.937644, 0, 0.682353, 1, 1,
0.1976736, -0.1526653, 2.069379, 0, 0.6745098, 1, 1,
0.1978698, 0.8289765, -0.1512803, 0, 0.6705883, 1, 1,
0.2050609, -1.619308, 1.811228, 0, 0.6627451, 1, 1,
0.2053276, 2.736407, 0.7319114, 0, 0.6588235, 1, 1,
0.2099106, 0.8326359, 1.156986, 0, 0.6509804, 1, 1,
0.2099377, 1.680829, 1.074062, 0, 0.6470588, 1, 1,
0.2117089, -0.3094659, 1.331452, 0, 0.6392157, 1, 1,
0.2153514, -1.153552, 3.357191, 0, 0.6352941, 1, 1,
0.2158798, 1.773533, -0.4173924, 0, 0.627451, 1, 1,
0.2183526, 0.8000799, 0.2300739, 0, 0.6235294, 1, 1,
0.2193042, 0.2914026, 0.3081107, 0, 0.6156863, 1, 1,
0.221221, 1.913633, 0.6237273, 0, 0.6117647, 1, 1,
0.2259099, 0.9095644, 1.232257, 0, 0.6039216, 1, 1,
0.2335995, 2.112009, 0.6410418, 0, 0.5960785, 1, 1,
0.2366445, -0.2439102, 0.9242255, 0, 0.5921569, 1, 1,
0.2387771, -0.1925001, 3.303627, 0, 0.5843138, 1, 1,
0.2394592, 0.2528972, -0.4001792, 0, 0.5803922, 1, 1,
0.24263, 0.6249594, 1.529698, 0, 0.572549, 1, 1,
0.245084, 0.989363, 1.563688, 0, 0.5686275, 1, 1,
0.2467645, 1.952293, -1.192454, 0, 0.5607843, 1, 1,
0.2472057, -0.6813642, 3.168027, 0, 0.5568628, 1, 1,
0.2473687, 0.1838188, 1.590873, 0, 0.5490196, 1, 1,
0.2478674, -0.2033399, 3.189832, 0, 0.5450981, 1, 1,
0.2491407, -0.1965895, 2.567634, 0, 0.5372549, 1, 1,
0.2493725, -0.3295062, 3.276424, 0, 0.5333334, 1, 1,
0.2520514, -0.8732327, 2.524776, 0, 0.5254902, 1, 1,
0.2521112, 1.216943, 0.392055, 0, 0.5215687, 1, 1,
0.2526836, -0.9222742, 2.909404, 0, 0.5137255, 1, 1,
0.2529733, 0.3872488, -0.6605449, 0, 0.509804, 1, 1,
0.2531072, -0.9528008, 2.478847, 0, 0.5019608, 1, 1,
0.2543676, -1.689354, 2.884347, 0, 0.4941176, 1, 1,
0.2576172, -1.133911, 3.151379, 0, 0.4901961, 1, 1,
0.2577135, -0.4083451, 3.603239, 0, 0.4823529, 1, 1,
0.2588414, 1.535926, 2.528085, 0, 0.4784314, 1, 1,
0.2602942, -0.6150553, 4.457532, 0, 0.4705882, 1, 1,
0.2613088, 0.6763803, 0.5909217, 0, 0.4666667, 1, 1,
0.2629791, -0.1219877, 1.773239, 0, 0.4588235, 1, 1,
0.263882, 1.041741, -0.1125617, 0, 0.454902, 1, 1,
0.2644638, -1.391645, 1.643663, 0, 0.4470588, 1, 1,
0.2649709, -1.532552, 2.070633, 0, 0.4431373, 1, 1,
0.2663892, 0.6804562, 0.9682239, 0, 0.4352941, 1, 1,
0.2686438, -1.050089, 2.980767, 0, 0.4313726, 1, 1,
0.2757436, -0.9714713, 1.372829, 0, 0.4235294, 1, 1,
0.2778035, -0.975932, 3.132284, 0, 0.4196078, 1, 1,
0.2796505, -1.872661, 2.403392, 0, 0.4117647, 1, 1,
0.2857916, -1.203606, 2.69793, 0, 0.4078431, 1, 1,
0.286351, 0.4789809, -0.08949374, 0, 0.4, 1, 1,
0.2920392, -0.6813618, 2.734663, 0, 0.3921569, 1, 1,
0.3010019, 0.4982232, 1.411659, 0, 0.3882353, 1, 1,
0.3040536, -1.782549, 2.847639, 0, 0.3803922, 1, 1,
0.3086706, 1.867665, 2.380296, 0, 0.3764706, 1, 1,
0.3099161, -0.2914321, 2.543689, 0, 0.3686275, 1, 1,
0.3107889, -0.8012123, 3.449662, 0, 0.3647059, 1, 1,
0.3112763, -1.874658, 2.087453, 0, 0.3568628, 1, 1,
0.3117902, -0.5873973, 2.079298, 0, 0.3529412, 1, 1,
0.3237301, 1.284431, -0.6110602, 0, 0.345098, 1, 1,
0.3264845, 0.3469716, -0.6094851, 0, 0.3411765, 1, 1,
0.3270955, -1.63176, 1.308641, 0, 0.3333333, 1, 1,
0.3284004, 1.142352, -0.4155487, 0, 0.3294118, 1, 1,
0.3329209, -1.366347, 4.215209, 0, 0.3215686, 1, 1,
0.3351146, 0.5716473, 1.716321, 0, 0.3176471, 1, 1,
0.335153, 0.1406824, 1.681205, 0, 0.3098039, 1, 1,
0.3366429, -0.4219981, 3.886722, 0, 0.3058824, 1, 1,
0.3368739, -0.5360307, 3.740338, 0, 0.2980392, 1, 1,
0.3430201, -0.3530592, 2.388741, 0, 0.2901961, 1, 1,
0.3446029, -0.5320191, 3.318259, 0, 0.2862745, 1, 1,
0.3456295, 0.9041636, 1.053192, 0, 0.2784314, 1, 1,
0.3468428, 0.5014216, 0.1212773, 0, 0.2745098, 1, 1,
0.3485512, -0.5501138, 2.284936, 0, 0.2666667, 1, 1,
0.3486503, -1.686452, 4.053946, 0, 0.2627451, 1, 1,
0.3489729, 1.389228, 0.5433203, 0, 0.254902, 1, 1,
0.3527577, -0.8884487, 2.462013, 0, 0.2509804, 1, 1,
0.3561011, 1.959324, 0.04451881, 0, 0.2431373, 1, 1,
0.3587405, 1.000386, -1.191696, 0, 0.2392157, 1, 1,
0.3660318, 0.7552583, 0.1169198, 0, 0.2313726, 1, 1,
0.3702779, -1.106116, 2.054449, 0, 0.227451, 1, 1,
0.3725633, 0.3852201, 0.7458059, 0, 0.2196078, 1, 1,
0.375086, 2.472583, -0.1357946, 0, 0.2156863, 1, 1,
0.3753482, -2.113099, 1.711228, 0, 0.2078431, 1, 1,
0.3756453, -0.2321332, 2.098211, 0, 0.2039216, 1, 1,
0.3762433, 1.080196, 0.1958382, 0, 0.1960784, 1, 1,
0.3778641, -1.376393, 3.574551, 0, 0.1882353, 1, 1,
0.3821934, -1.396358, 3.161089, 0, 0.1843137, 1, 1,
0.382374, -0.6194196, 3.814269, 0, 0.1764706, 1, 1,
0.3839347, -1.284976, 3.366537, 0, 0.172549, 1, 1,
0.3846301, -0.2699912, 0.9780877, 0, 0.1647059, 1, 1,
0.3857048, 0.8344789, -0.546411, 0, 0.1607843, 1, 1,
0.3860723, 0.5245591, 0.7203759, 0, 0.1529412, 1, 1,
0.3888301, -2.344953, 3.430647, 0, 0.1490196, 1, 1,
0.3932864, 0.2536923, 1.687965, 0, 0.1411765, 1, 1,
0.3955206, -0.7218903, 2.19141, 0, 0.1372549, 1, 1,
0.4019628, 0.2202106, 0.8656713, 0, 0.1294118, 1, 1,
0.4034897, 1.364062, 0.1104711, 0, 0.1254902, 1, 1,
0.4065582, 0.08535547, 1.304865, 0, 0.1176471, 1, 1,
0.4074545, -0.5034439, 1.316107, 0, 0.1137255, 1, 1,
0.4111201, 1.252959, 1.552866, 0, 0.1058824, 1, 1,
0.4122845, -0.858883, 2.5519, 0, 0.09803922, 1, 1,
0.4159452, -1.149785, 2.469322, 0, 0.09411765, 1, 1,
0.4185609, -0.1024474, 1.59006, 0, 0.08627451, 1, 1,
0.4312023, -0.09397189, 1.887627, 0, 0.08235294, 1, 1,
0.439997, -1.048393, 1.445424, 0, 0.07450981, 1, 1,
0.4404269, -0.5209876, 3.540192, 0, 0.07058824, 1, 1,
0.4416645, 0.7808549, 1.49601, 0, 0.0627451, 1, 1,
0.4436466, -0.6210178, 1.076327, 0, 0.05882353, 1, 1,
0.4484696, -0.4756011, 1.688523, 0, 0.05098039, 1, 1,
0.4490134, 2.577906, -0.03057778, 0, 0.04705882, 1, 1,
0.4493333, 0.462988, -0.1127228, 0, 0.03921569, 1, 1,
0.4512941, 1.157709, -1.053722, 0, 0.03529412, 1, 1,
0.4558275, -1.258821, 3.512624, 0, 0.02745098, 1, 1,
0.4588593, 0.8209706, 2.319777, 0, 0.02352941, 1, 1,
0.4614444, 0.1276626, 1.658793, 0, 0.01568628, 1, 1,
0.4678302, -0.1335605, 3.078634, 0, 0.01176471, 1, 1,
0.4680405, 0.6162491, -0.09057058, 0, 0.003921569, 1, 1,
0.4724585, -0.6171402, 3.17445, 0.003921569, 0, 1, 1,
0.4741836, 0.8039222, 1.823963, 0.007843138, 0, 1, 1,
0.482791, 0.4671838, 0.7199069, 0.01568628, 0, 1, 1,
0.4873179, 0.2247891, 1.035331, 0.01960784, 0, 1, 1,
0.4876319, -1.157264, 1.9569, 0.02745098, 0, 1, 1,
0.4881258, 0.007759566, 3.613099, 0.03137255, 0, 1, 1,
0.488453, -1.431662, 2.889338, 0.03921569, 0, 1, 1,
0.4887481, 0.2683269, 1.275737, 0.04313726, 0, 1, 1,
0.4901968, 1.774604, 2.48507, 0.05098039, 0, 1, 1,
0.4911684, 0.6465548, -0.5383988, 0.05490196, 0, 1, 1,
0.4919847, 0.5118298, 0.7300503, 0.0627451, 0, 1, 1,
0.4921151, 0.268714, -0.6902192, 0.06666667, 0, 1, 1,
0.5006905, -0.9179731, 3.874122, 0.07450981, 0, 1, 1,
0.5030839, 0.9664438, 1.602702, 0.07843138, 0, 1, 1,
0.5033865, 0.5430638, -0.5110677, 0.08627451, 0, 1, 1,
0.5037532, 0.6599339, 0.1925821, 0.09019608, 0, 1, 1,
0.5037736, 0.8740979, 2.575779, 0.09803922, 0, 1, 1,
0.5063145, -0.5553452, 2.188565, 0.1058824, 0, 1, 1,
0.5075476, 0.7354814, 0.06278601, 0.1098039, 0, 1, 1,
0.5090501, -1.285738, 2.425755, 0.1176471, 0, 1, 1,
0.5092073, 2.940206, 0.6545252, 0.1215686, 0, 1, 1,
0.5092455, -1.026582, 1.957642, 0.1294118, 0, 1, 1,
0.5097624, -1.515624, 2.504942, 0.1333333, 0, 1, 1,
0.5097712, 2.550345, 0.4585843, 0.1411765, 0, 1, 1,
0.51295, -0.8888702, 3.212469, 0.145098, 0, 1, 1,
0.5161776, 0.1121584, 1.610008, 0.1529412, 0, 1, 1,
0.51819, 0.7634112, 1.581524, 0.1568628, 0, 1, 1,
0.5194125, 0.05744861, 2.091537, 0.1647059, 0, 1, 1,
0.5206134, -0.9668123, 0.5613907, 0.1686275, 0, 1, 1,
0.5224915, 0.1782784, 0.09350289, 0.1764706, 0, 1, 1,
0.5228997, -0.08074389, 1.269983, 0.1803922, 0, 1, 1,
0.5251914, 0.4412526, 2.478719, 0.1882353, 0, 1, 1,
0.532226, -0.2703427, 1.490939, 0.1921569, 0, 1, 1,
0.5337929, 0.2686188, 1.377896, 0.2, 0, 1, 1,
0.5344545, -0.1190206, 1.917654, 0.2078431, 0, 1, 1,
0.5423331, -0.5795496, 1.692361, 0.2117647, 0, 1, 1,
0.5436537, 1.40352, -0.2872405, 0.2196078, 0, 1, 1,
0.5447173, 1.684605, 1.525475, 0.2235294, 0, 1, 1,
0.5504029, -0.6075037, 2.66027, 0.2313726, 0, 1, 1,
0.5532817, -0.2720505, 1.88138, 0.2352941, 0, 1, 1,
0.5601489, -0.4100259, 1.857206, 0.2431373, 0, 1, 1,
0.5655463, -0.4904443, 2.009816, 0.2470588, 0, 1, 1,
0.5723873, -0.5131417, 4.002168, 0.254902, 0, 1, 1,
0.5835525, 0.07532252, 0.8894342, 0.2588235, 0, 1, 1,
0.5842667, 0.8469512, 0.3743359, 0.2666667, 0, 1, 1,
0.5914015, -0.1267076, 0.5949911, 0.2705882, 0, 1, 1,
0.5920119, -0.3247201, 2.528638, 0.2784314, 0, 1, 1,
0.6039613, -0.03866114, 2.647876, 0.282353, 0, 1, 1,
0.6104417, -0.6956565, 2.919302, 0.2901961, 0, 1, 1,
0.6116819, -1.333844, 0.1844529, 0.2941177, 0, 1, 1,
0.6176445, -0.8623846, 3.51525, 0.3019608, 0, 1, 1,
0.618145, -0.3131292, 1.028504, 0.3098039, 0, 1, 1,
0.6240573, 0.2813439, -0.7820171, 0.3137255, 0, 1, 1,
0.6339814, 0.4249043, 0.8237228, 0.3215686, 0, 1, 1,
0.6366149, 0.8587542, 1.768184, 0.3254902, 0, 1, 1,
0.6408281, 0.6129699, 0.9091794, 0.3333333, 0, 1, 1,
0.6473469, -1.121022, 3.398925, 0.3372549, 0, 1, 1,
0.6496175, 0.9848803, 1.450093, 0.345098, 0, 1, 1,
0.6499592, 0.5707954, 0.01510426, 0.3490196, 0, 1, 1,
0.6544029, 0.1685754, 2.493674, 0.3568628, 0, 1, 1,
0.6567098, -0.26007, 2.401447, 0.3607843, 0, 1, 1,
0.6583853, 2.286495, -1.408775, 0.3686275, 0, 1, 1,
0.6619226, -0.9525194, 4.854167, 0.372549, 0, 1, 1,
0.6628838, 0.578756, 0.08125527, 0.3803922, 0, 1, 1,
0.6650959, -0.6631939, 1.834066, 0.3843137, 0, 1, 1,
0.6716462, 1.597201, 1.690785, 0.3921569, 0, 1, 1,
0.6719325, 0.9348785, 1.486996, 0.3960784, 0, 1, 1,
0.674035, -1.053143, 3.91364, 0.4039216, 0, 1, 1,
0.6762739, 1.346317, 0.3140719, 0.4117647, 0, 1, 1,
0.6771803, 0.009921304, 0.4562975, 0.4156863, 0, 1, 1,
0.6772583, 1.527583, -0.3074843, 0.4235294, 0, 1, 1,
0.67739, 0.4222142, 0.7875854, 0.427451, 0, 1, 1,
0.6792086, 0.7437799, -1.024157, 0.4352941, 0, 1, 1,
0.6801181, 0.3643427, 2.938964, 0.4392157, 0, 1, 1,
0.6815271, -2.28267, 2.290849, 0.4470588, 0, 1, 1,
0.6888496, -0.6548556, 1.820672, 0.4509804, 0, 1, 1,
0.6896637, 0.2402442, 0.1498391, 0.4588235, 0, 1, 1,
0.6932442, 0.1308596, 1.416101, 0.4627451, 0, 1, 1,
0.6945277, 2.720496, -0.3927423, 0.4705882, 0, 1, 1,
0.6950972, 0.2789096, 1.944398, 0.4745098, 0, 1, 1,
0.6961129, 0.07650806, 0.735811, 0.4823529, 0, 1, 1,
0.6972131, -1.768924, 1.214697, 0.4862745, 0, 1, 1,
0.7007185, 2.391733, -1.913613, 0.4941176, 0, 1, 1,
0.7091761, -0.2337039, 2.070662, 0.5019608, 0, 1, 1,
0.711449, 0.2561631, 3.146636, 0.5058824, 0, 1, 1,
0.7124377, 0.5803055, 2.557575, 0.5137255, 0, 1, 1,
0.7235458, -0.3572669, 2.291152, 0.5176471, 0, 1, 1,
0.7318872, -0.3571879, 0.7185509, 0.5254902, 0, 1, 1,
0.735379, 0.4310007, 1.695717, 0.5294118, 0, 1, 1,
0.7377685, -0.01305103, 1.266936, 0.5372549, 0, 1, 1,
0.7379996, -1.436521, 1.303445, 0.5411765, 0, 1, 1,
0.740441, 0.7291545, 0.1634983, 0.5490196, 0, 1, 1,
0.7406383, -0.609173, 2.241705, 0.5529412, 0, 1, 1,
0.7438206, 0.8835742, 0.2335157, 0.5607843, 0, 1, 1,
0.7473879, 1.730835, 0.8399798, 0.5647059, 0, 1, 1,
0.7506871, 0.652429, -0.5123776, 0.572549, 0, 1, 1,
0.7640574, 1.742384, 0.3178778, 0.5764706, 0, 1, 1,
0.7668781, -0.6945869, 0.8991678, 0.5843138, 0, 1, 1,
0.7711968, -1.226799, 2.116067, 0.5882353, 0, 1, 1,
0.7727854, -1.500247, 3.270888, 0.5960785, 0, 1, 1,
0.7788746, 0.006748778, 2.958434, 0.6039216, 0, 1, 1,
0.7802676, -0.337336, 4.475242, 0.6078432, 0, 1, 1,
0.7814188, -0.00257172, -0.07622132, 0.6156863, 0, 1, 1,
0.7817404, 1.571495, 2.316141, 0.6196079, 0, 1, 1,
0.7864246, 1.033654, 0.9103254, 0.627451, 0, 1, 1,
0.7865861, 0.6504734, 1.907439, 0.6313726, 0, 1, 1,
0.7928627, -1.186905, 2.831345, 0.6392157, 0, 1, 1,
0.7929253, -0.6409057, 1.567566, 0.6431373, 0, 1, 1,
0.7979364, 2.652591, 0.1999421, 0.6509804, 0, 1, 1,
0.7981904, 1.538295, 0.1475274, 0.654902, 0, 1, 1,
0.8024655, 1.032562, 0.6126028, 0.6627451, 0, 1, 1,
0.8031234, 1.598651, -0.07538895, 0.6666667, 0, 1, 1,
0.8102775, 1.984526, 1.649314, 0.6745098, 0, 1, 1,
0.8129147, -1.220107, 3.235292, 0.6784314, 0, 1, 1,
0.8173069, 0.437067, 1.257672, 0.6862745, 0, 1, 1,
0.8210904, 1.437372, 0.8031086, 0.6901961, 0, 1, 1,
0.8212877, -0.5464785, 1.196659, 0.6980392, 0, 1, 1,
0.8221605, -0.1466828, 0.9054771, 0.7058824, 0, 1, 1,
0.823387, -0.9511519, 1.532596, 0.7098039, 0, 1, 1,
0.8248562, -0.1126812, 1.793462, 0.7176471, 0, 1, 1,
0.8255394, 0.1724316, 0.6824031, 0.7215686, 0, 1, 1,
0.8272066, 1.885101, 0.627395, 0.7294118, 0, 1, 1,
0.8375597, 0.6396297, 2.187912, 0.7333333, 0, 1, 1,
0.8381964, 2.219051, 0.4031848, 0.7411765, 0, 1, 1,
0.8402779, -0.08618516, 1.838369, 0.7450981, 0, 1, 1,
0.8412847, -0.6312271, 2.348083, 0.7529412, 0, 1, 1,
0.8430927, 0.2883515, 1.557799, 0.7568628, 0, 1, 1,
0.8449372, 0.634746, 1.807887, 0.7647059, 0, 1, 1,
0.852853, -0.4751275, 3.135018, 0.7686275, 0, 1, 1,
0.8538442, 1.090105, 1.788227, 0.7764706, 0, 1, 1,
0.8584848, -1.270285, 1.401399, 0.7803922, 0, 1, 1,
0.8629875, 0.4337516, 2.856038, 0.7882353, 0, 1, 1,
0.8701176, 0.3781389, 0.9169744, 0.7921569, 0, 1, 1,
0.8711041, -2.147104, 2.328157, 0.8, 0, 1, 1,
0.8784178, -0.1445978, 1.58373, 0.8078431, 0, 1, 1,
0.8839499, 0.007191429, 0.7590703, 0.8117647, 0, 1, 1,
0.8915462, 0.3002397, 1.095307, 0.8196079, 0, 1, 1,
0.8924293, 0.6511468, 0.5624395, 0.8235294, 0, 1, 1,
0.8961279, 0.3878666, 0.9769425, 0.8313726, 0, 1, 1,
0.8987064, 0.9675608, -0.009795638, 0.8352941, 0, 1, 1,
0.9003839, -0.2570432, 0.6836407, 0.8431373, 0, 1, 1,
0.9022191, 0.274841, 0.8652716, 0.8470588, 0, 1, 1,
0.9051688, -0.5060725, 2.964822, 0.854902, 0, 1, 1,
0.9128401, -1.372316, 3.955897, 0.8588235, 0, 1, 1,
0.9162233, -0.6897144, 2.965096, 0.8666667, 0, 1, 1,
0.9201993, 0.8668209, 1.206289, 0.8705882, 0, 1, 1,
0.921551, 0.5433409, 2.425452, 0.8784314, 0, 1, 1,
0.924437, -0.8983181, 3.519865, 0.8823529, 0, 1, 1,
0.9459008, 0.2288215, 2.790818, 0.8901961, 0, 1, 1,
0.9576465, -0.01934585, 2.178392, 0.8941177, 0, 1, 1,
0.9594297, 0.8819543, -0.907293, 0.9019608, 0, 1, 1,
0.9610943, -0.1950557, 0.2195209, 0.9098039, 0, 1, 1,
0.9624449, 0.1145732, 2.751574, 0.9137255, 0, 1, 1,
0.9761422, 0.8584513, 0.3306166, 0.9215686, 0, 1, 1,
0.9761599, 0.2147423, 1.906882, 0.9254902, 0, 1, 1,
0.9766051, 0.1255109, 1.433527, 0.9333333, 0, 1, 1,
0.9868216, 0.28156, 0.3142394, 0.9372549, 0, 1, 1,
0.9879911, 0.3667538, 1.625259, 0.945098, 0, 1, 1,
0.9884872, 1.649473, 0.6330804, 0.9490196, 0, 1, 1,
0.9925039, -0.950782, 3.225323, 0.9568627, 0, 1, 1,
0.9947419, -0.6834995, 2.796198, 0.9607843, 0, 1, 1,
0.998415, 1.598603, -0.8563963, 0.9686275, 0, 1, 1,
0.9993753, -1.339372, 1.20925, 0.972549, 0, 1, 1,
1.005896, 0.4728289, -0.9469519, 0.9803922, 0, 1, 1,
1.010045, -0.5040868, 0.2729069, 0.9843137, 0, 1, 1,
1.011068, 0.9023816, 0.814236, 0.9921569, 0, 1, 1,
1.012016, -0.5263502, 1.18535, 0.9960784, 0, 1, 1,
1.01483, 1.6206, -0.1830505, 1, 0, 0.9960784, 1,
1.015042, 1.026896, 1.201671, 1, 0, 0.9882353, 1,
1.016977, -0.9770441, 1.219087, 1, 0, 0.9843137, 1,
1.01984, -0.2434924, 1.298956, 1, 0, 0.9764706, 1,
1.029469, -0.08011895, 2.150786, 1, 0, 0.972549, 1,
1.031896, 1.333104, 1.010276, 1, 0, 0.9647059, 1,
1.036661, 1.846984, -0.1224237, 1, 0, 0.9607843, 1,
1.050093, -0.4959244, 3.736755, 1, 0, 0.9529412, 1,
1.055175, -1.881835, 2.989228, 1, 0, 0.9490196, 1,
1.056054, 0.8093272, 1.063999, 1, 0, 0.9411765, 1,
1.060384, 0.05735665, 2.822492, 1, 0, 0.9372549, 1,
1.065218, 1.786205, 2.135158, 1, 0, 0.9294118, 1,
1.066026, 1.064266, -0.6112959, 1, 0, 0.9254902, 1,
1.067995, 0.9131007, -0.3886543, 1, 0, 0.9176471, 1,
1.068354, -0.4397224, -0.6445453, 1, 0, 0.9137255, 1,
1.069033, -0.908671, 2.901873, 1, 0, 0.9058824, 1,
1.07825, 0.7575545, 3.434423, 1, 0, 0.9019608, 1,
1.080207, -0.6003092, 0.2981554, 1, 0, 0.8941177, 1,
1.080807, -0.2004429, 1.4127, 1, 0, 0.8862745, 1,
1.08269, 0.906576, -0.1465401, 1, 0, 0.8823529, 1,
1.083536, 0.8950388, 1.395177, 1, 0, 0.8745098, 1,
1.08897, 0.2971238, 0.3832166, 1, 0, 0.8705882, 1,
1.09468, -0.5951203, 2.356231, 1, 0, 0.8627451, 1,
1.096735, 1.445392, 1.601018, 1, 0, 0.8588235, 1,
1.102669, 2.727587, -1.724548, 1, 0, 0.8509804, 1,
1.105728, -0.5975127, 1.488764, 1, 0, 0.8470588, 1,
1.108745, 1.513023, 0.4325412, 1, 0, 0.8392157, 1,
1.114524, 0.4627004, 2.085302, 1, 0, 0.8352941, 1,
1.13376, -1.728642, 1.42195, 1, 0, 0.827451, 1,
1.13442, 0.2878586, 1.905015, 1, 0, 0.8235294, 1,
1.135981, 1.920406, 0.7140286, 1, 0, 0.8156863, 1,
1.138385, 1.076171, 2.530042, 1, 0, 0.8117647, 1,
1.139711, 1.929543, -0.2982386, 1, 0, 0.8039216, 1,
1.143984, 0.6136937, 0.7657381, 1, 0, 0.7960784, 1,
1.145252, -0.2022818, 3.931157, 1, 0, 0.7921569, 1,
1.146534, -0.671259, 3.707157, 1, 0, 0.7843137, 1,
1.153195, 1.056853, 1.590392, 1, 0, 0.7803922, 1,
1.155602, -0.1874302, -0.630003, 1, 0, 0.772549, 1,
1.160935, -0.1191034, 2.918034, 1, 0, 0.7686275, 1,
1.164285, 0.2293273, -0.695344, 1, 0, 0.7607843, 1,
1.168984, 0.151192, 1.239671, 1, 0, 0.7568628, 1,
1.171213, 1.25881, 1.220764, 1, 0, 0.7490196, 1,
1.172769, 0.7479708, -0.5885702, 1, 0, 0.7450981, 1,
1.174339, -1.390042, 0.4013817, 1, 0, 0.7372549, 1,
1.186475, 0.1065925, 1.457256, 1, 0, 0.7333333, 1,
1.187298, 0.7222438, 1.01282, 1, 0, 0.7254902, 1,
1.18967, 1.103027, 1.469415, 1, 0, 0.7215686, 1,
1.190732, 0.3237302, 0.9971641, 1, 0, 0.7137255, 1,
1.194241, 0.1977624, 1.191942, 1, 0, 0.7098039, 1,
1.19738, -1.65046, 1.741129, 1, 0, 0.7019608, 1,
1.213444, -1.52099, 2.917628, 1, 0, 0.6941177, 1,
1.214504, 1.953817, -1.110532, 1, 0, 0.6901961, 1,
1.219759, 0.8603144, 1.969387, 1, 0, 0.682353, 1,
1.221382, 0.3187793, 1.798236, 1, 0, 0.6784314, 1,
1.223068, -0.9835032, 3.481843, 1, 0, 0.6705883, 1,
1.245303, 0.9739333, 0.6513719, 1, 0, 0.6666667, 1,
1.247125, 1.381771, 1.166904, 1, 0, 0.6588235, 1,
1.261312, -0.1180427, 1.114107, 1, 0, 0.654902, 1,
1.27278, -1.441407, 1.777656, 1, 0, 0.6470588, 1,
1.278119, -1.311514, 1.790752, 1, 0, 0.6431373, 1,
1.291353, -0.1126018, 2.647187, 1, 0, 0.6352941, 1,
1.30542, -0.4889097, 1.902557, 1, 0, 0.6313726, 1,
1.308162, -0.8915362, -0.1650547, 1, 0, 0.6235294, 1,
1.316417, 1.247434, 0.6573894, 1, 0, 0.6196079, 1,
1.321798, -0.8023972, 2.381044, 1, 0, 0.6117647, 1,
1.333349, 0.9757627, 1.126984, 1, 0, 0.6078432, 1,
1.33458, -0.7165288, 1.964067, 1, 0, 0.6, 1,
1.344452, -0.7137737, 1.031568, 1, 0, 0.5921569, 1,
1.344968, -0.4287031, 1.782636, 1, 0, 0.5882353, 1,
1.345358, 0.727775, -0.2066835, 1, 0, 0.5803922, 1,
1.347156, 1.937991, 1.951789, 1, 0, 0.5764706, 1,
1.352657, -1.966943, 2.604393, 1, 0, 0.5686275, 1,
1.358611, 0.1535723, 1.253991, 1, 0, 0.5647059, 1,
1.360988, -0.7321271, 3.151506, 1, 0, 0.5568628, 1,
1.361792, 0.01539808, 0.892777, 1, 0, 0.5529412, 1,
1.366273, 0.7489269, 0.6463064, 1, 0, 0.5450981, 1,
1.371503, 2.997478, 0.09154806, 1, 0, 0.5411765, 1,
1.37241, 0.9118052, 0.7419228, 1, 0, 0.5333334, 1,
1.377852, -1.582083, 2.229056, 1, 0, 0.5294118, 1,
1.381444, -1.524048, 2.87265, 1, 0, 0.5215687, 1,
1.381501, 0.8123237, 3.029392, 1, 0, 0.5176471, 1,
1.382202, -2.284642, 2.982913, 1, 0, 0.509804, 1,
1.415472, 2.565832, 0.7070484, 1, 0, 0.5058824, 1,
1.428091, 0.07589694, 2.752912, 1, 0, 0.4980392, 1,
1.438572, 0.3447478, 0.3757845, 1, 0, 0.4901961, 1,
1.44259, 1.129808, -1.480384, 1, 0, 0.4862745, 1,
1.45019, -0.2868071, 0.7332657, 1, 0, 0.4784314, 1,
1.466211, 0.9486409, -0.1901258, 1, 0, 0.4745098, 1,
1.468895, 0.1315564, 0.07977304, 1, 0, 0.4666667, 1,
1.499857, 1.189072, 1.957205, 1, 0, 0.4627451, 1,
1.51564, -0.3135205, 2.049331, 1, 0, 0.454902, 1,
1.515669, 0.540338, 0.959618, 1, 0, 0.4509804, 1,
1.517435, 1.643035, 3.610936, 1, 0, 0.4431373, 1,
1.521122, -0.8364751, 1.032268, 1, 0, 0.4392157, 1,
1.527885, -0.6083073, 2.395719, 1, 0, 0.4313726, 1,
1.529774, -0.8034275, 3.022718, 1, 0, 0.427451, 1,
1.538581, -0.3801637, 1.963299, 1, 0, 0.4196078, 1,
1.541601, -0.08611113, 0.7086175, 1, 0, 0.4156863, 1,
1.548802, 0.1619162, 2.200566, 1, 0, 0.4078431, 1,
1.559972, -1.42139, 3.419748, 1, 0, 0.4039216, 1,
1.563221, 0.1430852, 2.073625, 1, 0, 0.3960784, 1,
1.564731, 0.6791849, 1.625279, 1, 0, 0.3882353, 1,
1.56909, 0.07650215, 1.477329, 1, 0, 0.3843137, 1,
1.573707, 0.4401532, 0.3746437, 1, 0, 0.3764706, 1,
1.585821, 1.174348, 0.8005524, 1, 0, 0.372549, 1,
1.588633, 0.464425, 1.242189, 1, 0, 0.3647059, 1,
1.596029, -1.09442, 1.785497, 1, 0, 0.3607843, 1,
1.598426, -1.887013, 2.213826, 1, 0, 0.3529412, 1,
1.60822, 0.3150946, 1.096011, 1, 0, 0.3490196, 1,
1.616325, -0.04646505, 0.1633981, 1, 0, 0.3411765, 1,
1.619114, -1.395405, 3.07255, 1, 0, 0.3372549, 1,
1.62512, -0.3205118, 1.870359, 1, 0, 0.3294118, 1,
1.634052, -0.9268197, 3.827646, 1, 0, 0.3254902, 1,
1.639456, 0.4955567, 2.054741, 1, 0, 0.3176471, 1,
1.659596, 1.119887, 2.433852, 1, 0, 0.3137255, 1,
1.664321, 0.3253118, 1.336657, 1, 0, 0.3058824, 1,
1.67384, -0.4750491, 0.5259396, 1, 0, 0.2980392, 1,
1.679162, -0.7148874, 2.593769, 1, 0, 0.2941177, 1,
1.680524, -0.007641775, 2.038122, 1, 0, 0.2862745, 1,
1.680922, 0.4497713, -0.03585517, 1, 0, 0.282353, 1,
1.693753, -0.7125946, -0.8786609, 1, 0, 0.2745098, 1,
1.718695, -0.1272972, 3.618074, 1, 0, 0.2705882, 1,
1.729771, -0.1008389, 2.862904, 1, 0, 0.2627451, 1,
1.744549, -2.745138, 4.282065, 1, 0, 0.2588235, 1,
1.767509, 0.6679209, 0.3087181, 1, 0, 0.2509804, 1,
1.768477, 0.6185218, -0.7542052, 1, 0, 0.2470588, 1,
1.781706, 0.5519817, 1.147754, 1, 0, 0.2392157, 1,
1.83074, 0.3824518, 2.784857, 1, 0, 0.2352941, 1,
1.834138, 0.8551538, 2.623295, 1, 0, 0.227451, 1,
1.836969, 0.2051168, 1.820442, 1, 0, 0.2235294, 1,
1.842216, 0.03594704, 2.517211, 1, 0, 0.2156863, 1,
1.849853, 0.726191, 0.5951056, 1, 0, 0.2117647, 1,
1.85719, -0.6092718, 2.23882, 1, 0, 0.2039216, 1,
1.890178, -0.5297776, 2.064231, 1, 0, 0.1960784, 1,
1.898849, -1.215692, 2.429602, 1, 0, 0.1921569, 1,
1.899091, -0.1606618, 3.895427, 1, 0, 0.1843137, 1,
1.905593, 0.04884142, 1.681202, 1, 0, 0.1803922, 1,
1.930388, 0.3382718, -0.06702916, 1, 0, 0.172549, 1,
1.936095, -0.3645019, 0.9860656, 1, 0, 0.1686275, 1,
1.967758, -0.7191615, 2.044479, 1, 0, 0.1607843, 1,
1.980902, -0.2682307, 2.935661, 1, 0, 0.1568628, 1,
2.010156, -0.7372689, 1.354732, 1, 0, 0.1490196, 1,
2.01857, 0.1895573, -0.5112052, 1, 0, 0.145098, 1,
2.023775, 0.4384383, 1.344614, 1, 0, 0.1372549, 1,
2.035657, 1.852894, 1.261531, 1, 0, 0.1333333, 1,
2.042214, -0.5870171, 1.801324, 1, 0, 0.1254902, 1,
2.106576, -0.2783747, 1.050814, 1, 0, 0.1215686, 1,
2.148263, -0.3373924, 2.242861, 1, 0, 0.1137255, 1,
2.244588, 0.6657575, 2.437932, 1, 0, 0.1098039, 1,
2.267026, -2.39772, 2.633276, 1, 0, 0.1019608, 1,
2.284443, 1.672165, 2.162314, 1, 0, 0.09411765, 1,
2.295372, 1.333531, 0.282836, 1, 0, 0.09019608, 1,
2.297704, -0.90466, 2.100775, 1, 0, 0.08235294, 1,
2.336336, -0.8807312, 0.6263335, 1, 0, 0.07843138, 1,
2.417235, 0.2003301, 1.940534, 1, 0, 0.07058824, 1,
2.438179, -0.8147778, 2.509514, 1, 0, 0.06666667, 1,
2.442337, -0.2897778, 2.613731, 1, 0, 0.05882353, 1,
2.648087, 0.2843827, -0.3803267, 1, 0, 0.05490196, 1,
2.655146, -0.9928048, 2.060805, 1, 0, 0.04705882, 1,
2.783954, -1.121627, 0.4533749, 1, 0, 0.04313726, 1,
2.823151, 1.268285, 0.8672544, 1, 0, 0.03529412, 1,
2.907009, 0.1780477, 2.344523, 1, 0, 0.03137255, 1,
3.013629, -1.148759, 1.57229, 1, 0, 0.02352941, 1,
3.023253, 0.4387903, 2.197882, 1, 0, 0.01960784, 1,
3.152719, 0.8302698, 3.294723, 1, 0, 0.01176471, 1,
3.761319, 0.537249, 2.754437, 1, 0, 0.007843138, 1
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
0.1198914, -4.39408, -6.955086, 0, -0.5, 0.5, 0.5,
0.1198914, -4.39408, -6.955086, 1, -0.5, 0.5, 0.5,
0.1198914, -4.39408, -6.955086, 1, 1.5, 0.5, 0.5,
0.1198914, -4.39408, -6.955086, 0, 1.5, 0.5, 0.5
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
-4.75598, 0.1337225, -6.955086, 0, -0.5, 0.5, 0.5,
-4.75598, 0.1337225, -6.955086, 1, -0.5, 0.5, 0.5,
-4.75598, 0.1337225, -6.955086, 1, 1.5, 0.5, 0.5,
-4.75598, 0.1337225, -6.955086, 0, 1.5, 0.5, 0.5
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
-4.75598, -4.39408, -0.03003097, 0, -0.5, 0.5, 0.5,
-4.75598, -4.39408, -0.03003097, 1, -0.5, 0.5, 0.5,
-4.75598, -4.39408, -0.03003097, 1, 1.5, 0.5, 0.5,
-4.75598, -4.39408, -0.03003097, 0, 1.5, 0.5, 0.5
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
-2, -3.349203, -5.356996,
2, -3.349203, -5.356996,
-2, -3.349203, -5.356996,
-2, -3.523349, -5.623344,
0, -3.349203, -5.356996,
0, -3.523349, -5.623344,
2, -3.349203, -5.356996,
2, -3.523349, -5.623344
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
-2, -3.871641, -6.156041, 0, -0.5, 0.5, 0.5,
-2, -3.871641, -6.156041, 1, -0.5, 0.5, 0.5,
-2, -3.871641, -6.156041, 1, 1.5, 0.5, 0.5,
-2, -3.871641, -6.156041, 0, 1.5, 0.5, 0.5,
0, -3.871641, -6.156041, 0, -0.5, 0.5, 0.5,
0, -3.871641, -6.156041, 1, -0.5, 0.5, 0.5,
0, -3.871641, -6.156041, 1, 1.5, 0.5, 0.5,
0, -3.871641, -6.156041, 0, 1.5, 0.5, 0.5,
2, -3.871641, -6.156041, 0, -0.5, 0.5, 0.5,
2, -3.871641, -6.156041, 1, -0.5, 0.5, 0.5,
2, -3.871641, -6.156041, 1, 1.5, 0.5, 0.5,
2, -3.871641, -6.156041, 0, 1.5, 0.5, 0.5
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
-3.630779, -3, -5.356996,
-3.630779, 3, -5.356996,
-3.630779, -3, -5.356996,
-3.818312, -3, -5.623344,
-3.630779, -2, -5.356996,
-3.818312, -2, -5.623344,
-3.630779, -1, -5.356996,
-3.818312, -1, -5.623344,
-3.630779, 0, -5.356996,
-3.818312, 0, -5.623344,
-3.630779, 1, -5.356996,
-3.818312, 1, -5.623344,
-3.630779, 2, -5.356996,
-3.818312, 2, -5.623344,
-3.630779, 3, -5.356996,
-3.818312, 3, -5.623344
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
-4.193379, -3, -6.156041, 0, -0.5, 0.5, 0.5,
-4.193379, -3, -6.156041, 1, -0.5, 0.5, 0.5,
-4.193379, -3, -6.156041, 1, 1.5, 0.5, 0.5,
-4.193379, -3, -6.156041, 0, 1.5, 0.5, 0.5,
-4.193379, -2, -6.156041, 0, -0.5, 0.5, 0.5,
-4.193379, -2, -6.156041, 1, -0.5, 0.5, 0.5,
-4.193379, -2, -6.156041, 1, 1.5, 0.5, 0.5,
-4.193379, -2, -6.156041, 0, 1.5, 0.5, 0.5,
-4.193379, -1, -6.156041, 0, -0.5, 0.5, 0.5,
-4.193379, -1, -6.156041, 1, -0.5, 0.5, 0.5,
-4.193379, -1, -6.156041, 1, 1.5, 0.5, 0.5,
-4.193379, -1, -6.156041, 0, 1.5, 0.5, 0.5,
-4.193379, 0, -6.156041, 0, -0.5, 0.5, 0.5,
-4.193379, 0, -6.156041, 1, -0.5, 0.5, 0.5,
-4.193379, 0, -6.156041, 1, 1.5, 0.5, 0.5,
-4.193379, 0, -6.156041, 0, 1.5, 0.5, 0.5,
-4.193379, 1, -6.156041, 0, -0.5, 0.5, 0.5,
-4.193379, 1, -6.156041, 1, -0.5, 0.5, 0.5,
-4.193379, 1, -6.156041, 1, 1.5, 0.5, 0.5,
-4.193379, 1, -6.156041, 0, 1.5, 0.5, 0.5,
-4.193379, 2, -6.156041, 0, -0.5, 0.5, 0.5,
-4.193379, 2, -6.156041, 1, -0.5, 0.5, 0.5,
-4.193379, 2, -6.156041, 1, 1.5, 0.5, 0.5,
-4.193379, 2, -6.156041, 0, 1.5, 0.5, 0.5,
-4.193379, 3, -6.156041, 0, -0.5, 0.5, 0.5,
-4.193379, 3, -6.156041, 1, -0.5, 0.5, 0.5,
-4.193379, 3, -6.156041, 1, 1.5, 0.5, 0.5,
-4.193379, 3, -6.156041, 0, 1.5, 0.5, 0.5
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
-3.630779, -3.349203, -4,
-3.630779, -3.349203, 4,
-3.630779, -3.349203, -4,
-3.818312, -3.523349, -4,
-3.630779, -3.349203, -2,
-3.818312, -3.523349, -2,
-3.630779, -3.349203, 0,
-3.818312, -3.523349, 0,
-3.630779, -3.349203, 2,
-3.818312, -3.523349, 2,
-3.630779, -3.349203, 4,
-3.818312, -3.523349, 4
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
-4.193379, -3.871641, -4, 0, -0.5, 0.5, 0.5,
-4.193379, -3.871641, -4, 1, -0.5, 0.5, 0.5,
-4.193379, -3.871641, -4, 1, 1.5, 0.5, 0.5,
-4.193379, -3.871641, -4, 0, 1.5, 0.5, 0.5,
-4.193379, -3.871641, -2, 0, -0.5, 0.5, 0.5,
-4.193379, -3.871641, -2, 1, -0.5, 0.5, 0.5,
-4.193379, -3.871641, -2, 1, 1.5, 0.5, 0.5,
-4.193379, -3.871641, -2, 0, 1.5, 0.5, 0.5,
-4.193379, -3.871641, 0, 0, -0.5, 0.5, 0.5,
-4.193379, -3.871641, 0, 1, -0.5, 0.5, 0.5,
-4.193379, -3.871641, 0, 1, 1.5, 0.5, 0.5,
-4.193379, -3.871641, 0, 0, 1.5, 0.5, 0.5,
-4.193379, -3.871641, 2, 0, -0.5, 0.5, 0.5,
-4.193379, -3.871641, 2, 1, -0.5, 0.5, 0.5,
-4.193379, -3.871641, 2, 1, 1.5, 0.5, 0.5,
-4.193379, -3.871641, 2, 0, 1.5, 0.5, 0.5,
-4.193379, -3.871641, 4, 0, -0.5, 0.5, 0.5,
-4.193379, -3.871641, 4, 1, -0.5, 0.5, 0.5,
-4.193379, -3.871641, 4, 1, 1.5, 0.5, 0.5,
-4.193379, -3.871641, 4, 0, 1.5, 0.5, 0.5
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
-3.630779, -3.349203, -5.356996,
-3.630779, 3.616648, -5.356996,
-3.630779, -3.349203, 5.296934,
-3.630779, 3.616648, 5.296934,
-3.630779, -3.349203, -5.356996,
-3.630779, -3.349203, 5.296934,
-3.630779, 3.616648, -5.356996,
-3.630779, 3.616648, 5.296934,
-3.630779, -3.349203, -5.356996,
3.870562, -3.349203, -5.356996,
-3.630779, -3.349203, 5.296934,
3.870562, -3.349203, 5.296934,
-3.630779, 3.616648, -5.356996,
3.870562, 3.616648, -5.356996,
-3.630779, 3.616648, 5.296934,
3.870562, 3.616648, 5.296934,
3.870562, -3.349203, -5.356996,
3.870562, 3.616648, -5.356996,
3.870562, -3.349203, 5.296934,
3.870562, 3.616648, 5.296934,
3.870562, -3.349203, -5.356996,
3.870562, -3.349203, 5.296934,
3.870562, 3.616648, -5.356996,
3.870562, 3.616648, 5.296934
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
var radius = 7.889541;
var distance = 35.10146;
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
mvMatrix.translate( -0.1198914, -0.1337225, 0.03003097 );
mvMatrix.scale( 1.137174, 1.224592, 0.8006741 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.10146);
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
flumiclorac-pentyl<-read.table("flumiclorac-pentyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flumiclorac-pentyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumiclorac' not found
```

```r
y<-flumiclorac-pentyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumiclorac' not found
```

```r
z<-flumiclorac-pentyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumiclorac' not found
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
-3.521536, -1.256465, -2.274054, 0, 0, 1, 1, 1,
-3.308187, 1.229601, -1.05419, 1, 0, 0, 1, 1,
-2.75849, 0.1421601, -1.63605, 1, 0, 0, 1, 1,
-2.700409, 0.3593455, -2.597021, 1, 0, 0, 1, 1,
-2.661277, 0.7105886, -1.949524, 1, 0, 0, 1, 1,
-2.545872, -1.831816, -1.486195, 1, 0, 0, 1, 1,
-2.508709, -1.878293, -1.852853, 0, 0, 0, 1, 1,
-2.503678, -0.009771019, -2.017174, 0, 0, 0, 1, 1,
-2.469925, 0.9580889, 0.3177508, 0, 0, 0, 1, 1,
-2.458354, 1.410588, -1.383631, 0, 0, 0, 1, 1,
-2.430099, -0.007668284, -1.442523, 0, 0, 0, 1, 1,
-2.397228, 0.2703061, -1.326068, 0, 0, 0, 1, 1,
-2.374408, 0.1376703, 0.717439, 0, 0, 0, 1, 1,
-2.363635, -0.2647321, -1.14115, 1, 1, 1, 1, 1,
-2.344687, 0.9559796, -1.687503, 1, 1, 1, 1, 1,
-2.305387, -0.6655214, -1.950917, 1, 1, 1, 1, 1,
-2.284417, -0.0713571, -1.540877, 1, 1, 1, 1, 1,
-2.267633, 0.3564171, -2.576388, 1, 1, 1, 1, 1,
-2.263113, -1.14821, -2.58313, 1, 1, 1, 1, 1,
-2.205593, -1.654958, -1.161004, 1, 1, 1, 1, 1,
-2.199715, 0.5514162, -0.1098821, 1, 1, 1, 1, 1,
-2.166189, -1.202448, -4.894744, 1, 1, 1, 1, 1,
-2.136579, 2.002594, -0.3781635, 1, 1, 1, 1, 1,
-2.091975, 1.179079, -0.192508, 1, 1, 1, 1, 1,
-2.054448, -1.838625, -1.483777, 1, 1, 1, 1, 1,
-2.03298, -0.208855, -0.8842176, 1, 1, 1, 1, 1,
-1.991388, 0.525777, -0.549352, 1, 1, 1, 1, 1,
-1.968272, 0.1077383, -3.543839, 1, 1, 1, 1, 1,
-1.965143, 0.3224339, -1.055689, 0, 0, 1, 1, 1,
-1.950678, 0.06753346, -2.36699, 1, 0, 0, 1, 1,
-1.943723, 0.5667929, -2.887232, 1, 0, 0, 1, 1,
-1.930639, 0.2164395, -1.67856, 1, 0, 0, 1, 1,
-1.921581, -1.622774, -1.318277, 1, 0, 0, 1, 1,
-1.921238, 1.257912, -2.001194, 1, 0, 0, 1, 1,
-1.916549, -1.302165, -1.824894, 0, 0, 0, 1, 1,
-1.913216, 0.3752673, -1.008288, 0, 0, 0, 1, 1,
-1.908806, -0.1141265, -2.701981, 0, 0, 0, 1, 1,
-1.895924, -1.72647, -4.025384, 0, 0, 0, 1, 1,
-1.890189, 1.543247, -0.6304137, 0, 0, 0, 1, 1,
-1.842832, -0.5049456, -2.29902, 0, 0, 0, 1, 1,
-1.831109, 0.7513645, -1.76173, 0, 0, 0, 1, 1,
-1.827316, -0.6676489, -3.007329, 1, 1, 1, 1, 1,
-1.815298, -0.9145674, -2.81867, 1, 1, 1, 1, 1,
-1.811707, 0.2425644, -0.06150134, 1, 1, 1, 1, 1,
-1.777488, 1.113175, -0.4399414, 1, 1, 1, 1, 1,
-1.739711, -0.9331797, -1.727798, 1, 1, 1, 1, 1,
-1.685422, -0.1033496, -2.711412, 1, 1, 1, 1, 1,
-1.680253, 0.6554012, -1.291309, 1, 1, 1, 1, 1,
-1.674017, -0.9663057, -1.530754, 1, 1, 1, 1, 1,
-1.664901, -0.08797801, -1.243494, 1, 1, 1, 1, 1,
-1.66396, -1.167926, -1.544786, 1, 1, 1, 1, 1,
-1.657458, 0.7348961, 1.392601, 1, 1, 1, 1, 1,
-1.656879, -0.7216955, -2.777914, 1, 1, 1, 1, 1,
-1.656517, -1.283338, -1.736347, 1, 1, 1, 1, 1,
-1.653865, 0.8663083, 0.06583736, 1, 1, 1, 1, 1,
-1.63131, -1.464322, -1.399308, 1, 1, 1, 1, 1,
-1.628949, -1.121502, -3.540487, 0, 0, 1, 1, 1,
-1.60852, 0.6265996, -1.492842, 1, 0, 0, 1, 1,
-1.589013, -0.910035, -1.947122, 1, 0, 0, 1, 1,
-1.587922, -1.33889, -3.527752, 1, 0, 0, 1, 1,
-1.577677, 2.629133, -2.195936, 1, 0, 0, 1, 1,
-1.558924, -0.762845, -2.839544, 1, 0, 0, 1, 1,
-1.535368, -0.2796442, -0.9487409, 0, 0, 0, 1, 1,
-1.532755, 0.7298242, -0.07464884, 0, 0, 0, 1, 1,
-1.522707, -1.345914, -2.02189, 0, 0, 0, 1, 1,
-1.521567, 0.3929149, -0.2554603, 0, 0, 0, 1, 1,
-1.518105, -0.04056801, -2.152484, 0, 0, 0, 1, 1,
-1.515667, -0.1498121, -1.302563, 0, 0, 0, 1, 1,
-1.508856, -0.6280273, -2.739202, 0, 0, 0, 1, 1,
-1.504254, 1.320045, -1.334436, 1, 1, 1, 1, 1,
-1.50248, -1.792556, -3.56794, 1, 1, 1, 1, 1,
-1.500506, 1.208077, -1.878866, 1, 1, 1, 1, 1,
-1.499603, 0.3740483, -1.410026, 1, 1, 1, 1, 1,
-1.492546, 2.541497, -0.7321179, 1, 1, 1, 1, 1,
-1.481116, -1.028361, -3.069184, 1, 1, 1, 1, 1,
-1.480264, -2.028658, -2.436711, 1, 1, 1, 1, 1,
-1.479814, -0.06406947, -1.80485, 1, 1, 1, 1, 1,
-1.476916, -0.159322, -2.884441, 1, 1, 1, 1, 1,
-1.45443, -0.5909385, -2.62422, 1, 1, 1, 1, 1,
-1.443423, 0.1529948, -2.638734, 1, 1, 1, 1, 1,
-1.408207, 1.183754, -1.536766, 1, 1, 1, 1, 1,
-1.404873, 1.027037, -2.694786, 1, 1, 1, 1, 1,
-1.404262, -0.6980717, 0.4364178, 1, 1, 1, 1, 1,
-1.402835, 1.820776, -0.4315027, 1, 1, 1, 1, 1,
-1.400903, 0.1386524, -2.444175, 0, 0, 1, 1, 1,
-1.369335, 0.5220333, -2.535754, 1, 0, 0, 1, 1,
-1.363994, -0.7622373, -2.384957, 1, 0, 0, 1, 1,
-1.354204, 2.572015, -0.3199268, 1, 0, 0, 1, 1,
-1.33729, 1.315045, -0.4581395, 1, 0, 0, 1, 1,
-1.333998, 0.6797999, -1.355985, 1, 0, 0, 1, 1,
-1.331183, 0.6192626, -0.9507315, 0, 0, 0, 1, 1,
-1.325615, 1.112777, -0.1721499, 0, 0, 0, 1, 1,
-1.315116, -2.484234, -1.858628, 0, 0, 0, 1, 1,
-1.30958, -0.9111076, -2.158525, 0, 0, 0, 1, 1,
-1.300501, -0.2947537, -1.152977, 0, 0, 0, 1, 1,
-1.292997, 0.5251857, -1.449579, 0, 0, 0, 1, 1,
-1.287763, 2.133033, 1.384986, 0, 0, 0, 1, 1,
-1.273062, -1.10483, -2.583109, 1, 1, 1, 1, 1,
-1.265606, -1.595999, -2.056916, 1, 1, 1, 1, 1,
-1.261976, 0.54095, -1.970991, 1, 1, 1, 1, 1,
-1.260232, 0.937449, -1.946574, 1, 1, 1, 1, 1,
-1.243913, 2.372903, 2.062433, 1, 1, 1, 1, 1,
-1.24379, -0.656073, -3.319964, 1, 1, 1, 1, 1,
-1.243268, -0.4395421, -3.799521, 1, 1, 1, 1, 1,
-1.222684, -0.718975, -1.902237, 1, 1, 1, 1, 1,
-1.20425, -1.210675, -3.479918, 1, 1, 1, 1, 1,
-1.201784, -0.9531057, -3.539128, 1, 1, 1, 1, 1,
-1.197138, 1.887806, -1.401384, 1, 1, 1, 1, 1,
-1.196815, -1.254937, -1.975921, 1, 1, 1, 1, 1,
-1.192862, 2.454584, -0.4499051, 1, 1, 1, 1, 1,
-1.192034, 0.9774538, -0.3525892, 1, 1, 1, 1, 1,
-1.188933, -0.1238812, -1.540805, 1, 1, 1, 1, 1,
-1.187222, 0.7375156, -1.207815, 0, 0, 1, 1, 1,
-1.183663, 0.08047434, -1.13545, 1, 0, 0, 1, 1,
-1.180816, -0.310584, -0.6113421, 1, 0, 0, 1, 1,
-1.175155, -0.3922101, -2.344361, 1, 0, 0, 1, 1,
-1.170639, 1.404475, -0.7887192, 1, 0, 0, 1, 1,
-1.169308, -0.1015455, -0.6350643, 1, 0, 0, 1, 1,
-1.148643, 2.608122, -1.06026, 0, 0, 0, 1, 1,
-1.145706, 0.6733358, 0.02424315, 0, 0, 0, 1, 1,
-1.143927, 0.5771467, -0.9423469, 0, 0, 0, 1, 1,
-1.127924, 0.8800196, -2.255009, 0, 0, 0, 1, 1,
-1.123254, -0.3309574, -1.576492, 0, 0, 0, 1, 1,
-1.121109, -0.8103712, -0.5267974, 0, 0, 0, 1, 1,
-1.11189, 0.9464305, -0.6644778, 0, 0, 0, 1, 1,
-1.102644, 1.084555, -1.89002, 1, 1, 1, 1, 1,
-1.100401, 1.08682, -2.402866, 1, 1, 1, 1, 1,
-1.095652, 0.6364698, 0.237147, 1, 1, 1, 1, 1,
-1.090827, 2.747219, -0.8344066, 1, 1, 1, 1, 1,
-1.090529, -0.9140227, -2.065124, 1, 1, 1, 1, 1,
-1.088921, 0.5682446, -0.4934653, 1, 1, 1, 1, 1,
-1.08173, -0.6702494, 0.283755, 1, 1, 1, 1, 1,
-1.080068, 0.1548668, -1.67315, 1, 1, 1, 1, 1,
-1.077026, -1.883802, -3.042738, 1, 1, 1, 1, 1,
-1.060475, -0.641743, -1.768909, 1, 1, 1, 1, 1,
-1.053776, 0.00381176, -1.806478, 1, 1, 1, 1, 1,
-1.047424, 0.7472438, -0.9498937, 1, 1, 1, 1, 1,
-1.047025, -1.230209, -3.734624, 1, 1, 1, 1, 1,
-1.046802, 0.2900792, -0.3425921, 1, 1, 1, 1, 1,
-1.042886, -0.1093202, -2.188884, 1, 1, 1, 1, 1,
-1.037518, -0.6933361, -0.8386909, 0, 0, 1, 1, 1,
-1.037427, 0.3232945, -2.286156, 1, 0, 0, 1, 1,
-1.036217, -1.419926, -4.650248, 1, 0, 0, 1, 1,
-1.023751, 1.419177, -1.468586, 1, 0, 0, 1, 1,
-1.022425, 0.8121317, 0.5620468, 1, 0, 0, 1, 1,
-1.020348, 0.3787458, -1.699823, 1, 0, 0, 1, 1,
-1.006107, -0.02319868, -1.125167, 0, 0, 0, 1, 1,
-1.005773, -0.2887937, -0.2033973, 0, 0, 0, 1, 1,
-1.001235, 3.072534, -0.4963334, 0, 0, 0, 1, 1,
-0.9958553, 0.9042929, -3.12226, 0, 0, 0, 1, 1,
-0.9951021, -0.7571652, -2.22412, 0, 0, 0, 1, 1,
-0.9937953, -1.075274, -2.58635, 0, 0, 0, 1, 1,
-0.9910582, 0.1279433, -0.9572769, 0, 0, 0, 1, 1,
-0.9907585, -1.137657, -0.7140073, 1, 1, 1, 1, 1,
-0.9865447, 1.086684, -1.635416, 1, 1, 1, 1, 1,
-0.9793058, -1.335554, -2.751612, 1, 1, 1, 1, 1,
-0.9728575, -0.2838959, -0.6112641, 1, 1, 1, 1, 1,
-0.968619, -1.000019, -3.412468, 1, 1, 1, 1, 1,
-0.9631187, 0.2715166, 0.8999704, 1, 1, 1, 1, 1,
-0.954169, -0.3034692, -1.265184, 1, 1, 1, 1, 1,
-0.9536812, 0.7539923, 0.2952139, 1, 1, 1, 1, 1,
-0.9489931, 0.5103028, -1.698622, 1, 1, 1, 1, 1,
-0.9400483, 0.519058, 0.4728233, 1, 1, 1, 1, 1,
-0.9364482, -0.7035827, -0.4038163, 1, 1, 1, 1, 1,
-0.9345576, 0.1704965, -1.868797, 1, 1, 1, 1, 1,
-0.9336837, 0.4055999, -2.395427, 1, 1, 1, 1, 1,
-0.9270009, 1.776728, 0.4497725, 1, 1, 1, 1, 1,
-0.9250795, -0.06653927, -1.678778, 1, 1, 1, 1, 1,
-0.9129257, 1.742758, -1.827853, 0, 0, 1, 1, 1,
-0.9111203, 1.323373, -2.052124, 1, 0, 0, 1, 1,
-0.9102576, -0.8868954, -1.869301, 1, 0, 0, 1, 1,
-0.9101444, 0.5868666, -0.2423389, 1, 0, 0, 1, 1,
-0.9095756, 0.2093168, -0.9267681, 1, 0, 0, 1, 1,
-0.907566, -1.727234, -3.46359, 1, 0, 0, 1, 1,
-0.9053481, -0.7916012, -3.222187, 0, 0, 0, 1, 1,
-0.8952204, 1.389849, -0.1942255, 0, 0, 0, 1, 1,
-0.8949794, 0.2531685, -0.928733, 0, 0, 0, 1, 1,
-0.8947405, 0.3292559, -1.001952, 0, 0, 0, 1, 1,
-0.8906044, -0.6057128, -1.850467, 0, 0, 0, 1, 1,
-0.8882692, -0.3005748, -2.70863, 0, 0, 0, 1, 1,
-0.8851652, -1.079362, -2.148031, 0, 0, 0, 1, 1,
-0.8825941, 0.3317728, -2.405716, 1, 1, 1, 1, 1,
-0.880679, -0.5233044, -2.419171, 1, 1, 1, 1, 1,
-0.8788948, 0.7519612, -0.4789152, 1, 1, 1, 1, 1,
-0.8677127, -0.3702145, -0.06861138, 1, 1, 1, 1, 1,
-0.8666338, 0.07387395, 0.2208232, 1, 1, 1, 1, 1,
-0.8634057, -0.2249068, -1.072014, 1, 1, 1, 1, 1,
-0.8581131, 0.7287812, -0.9694947, 1, 1, 1, 1, 1,
-0.8537675, 0.3074737, -1.848876, 1, 1, 1, 1, 1,
-0.8526868, -0.936508, -2.948854, 1, 1, 1, 1, 1,
-0.8521832, -0.3785557, -2.79898, 1, 1, 1, 1, 1,
-0.844152, 1.135664, -0.2449638, 1, 1, 1, 1, 1,
-0.840412, -0.4905336, -1.744596, 1, 1, 1, 1, 1,
-0.8393742, -0.009009894, -1.544454, 1, 1, 1, 1, 1,
-0.8258531, -1.619882, -0.9085605, 1, 1, 1, 1, 1,
-0.8142316, -0.09920575, -1.683874, 1, 1, 1, 1, 1,
-0.8141983, 0.7606294, -1.217731, 0, 0, 1, 1, 1,
-0.8095021, -1.478156, -4.387914, 1, 0, 0, 1, 1,
-0.8074195, -0.9443858, -1.782697, 1, 0, 0, 1, 1,
-0.804275, -0.3700652, -2.652204, 1, 0, 0, 1, 1,
-0.802732, 0.6978387, -0.8837293, 1, 0, 0, 1, 1,
-0.7987192, 0.1707748, -0.8294366, 1, 0, 0, 1, 1,
-0.7870106, 0.9054893, -0.546546, 0, 0, 0, 1, 1,
-0.7868038, 0.3851666, -0.1740943, 0, 0, 0, 1, 1,
-0.7858149, 0.3955815, -0.2357129, 0, 0, 0, 1, 1,
-0.7791212, -1.400441, -1.871477, 0, 0, 0, 1, 1,
-0.7788318, -0.5321419, -2.633666, 0, 0, 0, 1, 1,
-0.7709386, 0.02353759, -2.416466, 0, 0, 0, 1, 1,
-0.76255, 0.8483778, -0.7399414, 0, 0, 0, 1, 1,
-0.7600428, 0.1618732, -2.556489, 1, 1, 1, 1, 1,
-0.7560703, 2.223985, -0.1702759, 1, 1, 1, 1, 1,
-0.7557545, -1.558997, -2.546694, 1, 1, 1, 1, 1,
-0.7552204, -0.720853, -1.857517, 1, 1, 1, 1, 1,
-0.7507808, 0.6019189, -1.272726, 1, 1, 1, 1, 1,
-0.7499333, -0.2915722, -1.844254, 1, 1, 1, 1, 1,
-0.7493687, -0.393991, -1.338905, 1, 1, 1, 1, 1,
-0.7418789, 1.4069, 0.07849933, 1, 1, 1, 1, 1,
-0.7391971, -0.4302138, -1.687439, 1, 1, 1, 1, 1,
-0.7374054, -0.8013476, -3.392066, 1, 1, 1, 1, 1,
-0.7340964, 0.0703657, -3.05745, 1, 1, 1, 1, 1,
-0.7299473, -2.090614, -2.482385, 1, 1, 1, 1, 1,
-0.7204374, 0.027808, -1.376372, 1, 1, 1, 1, 1,
-0.7201411, -0.9445529, -2.538763, 1, 1, 1, 1, 1,
-0.7180624, 0.2327531, -0.7774236, 1, 1, 1, 1, 1,
-0.7068158, 0.1817036, 1.048624, 0, 0, 1, 1, 1,
-0.7013195, -0.9007897, -0.1582658, 1, 0, 0, 1, 1,
-0.7004066, -1.56704, -3.247545, 1, 0, 0, 1, 1,
-0.698626, -0.167223, -1.713796, 1, 0, 0, 1, 1,
-0.6940479, 1.530668, 0.9874472, 1, 0, 0, 1, 1,
-0.6897861, 0.2435496, -1.365115, 1, 0, 0, 1, 1,
-0.6838657, -0.8309987, -1.743918, 0, 0, 0, 1, 1,
-0.6778636, -0.6684504, -2.515978, 0, 0, 0, 1, 1,
-0.676286, -0.8791049, -1.70856, 0, 0, 0, 1, 1,
-0.6743702, -0.6338832, -2.581667, 0, 0, 0, 1, 1,
-0.6630698, -1.1339, -2.388247, 0, 0, 0, 1, 1,
-0.6597442, 0.7433123, -0.8254224, 0, 0, 0, 1, 1,
-0.6590803, 0.2590217, -0.7357556, 0, 0, 0, 1, 1,
-0.6505392, 2.079528, -0.1521626, 1, 1, 1, 1, 1,
-0.6390137, -0.2613082, -3.065069, 1, 1, 1, 1, 1,
-0.635032, -0.9958867, -2.061151, 1, 1, 1, 1, 1,
-0.6322755, 2.574724, -0.8410815, 1, 1, 1, 1, 1,
-0.632261, 0.2235972, -0.4667964, 1, 1, 1, 1, 1,
-0.6304444, 1.319157, -0.4975699, 1, 1, 1, 1, 1,
-0.6287869, -1.126066, -3.818128, 1, 1, 1, 1, 1,
-0.6283436, 1.700961, -2.863295, 1, 1, 1, 1, 1,
-0.6276324, -0.8414094, -4.253802, 1, 1, 1, 1, 1,
-0.6274582, 0.2743655, -0.6092821, 1, 1, 1, 1, 1,
-0.626103, -1.375664, -3.764783, 1, 1, 1, 1, 1,
-0.6246513, -0.4221692, -1.552751, 1, 1, 1, 1, 1,
-0.6224138, 1.804766, 1.69276, 1, 1, 1, 1, 1,
-0.6223008, 0.8112964, -0.1232922, 1, 1, 1, 1, 1,
-0.6102629, 1.338562, -0.9442377, 1, 1, 1, 1, 1,
-0.6071944, -0.49433, -2.489732, 0, 0, 1, 1, 1,
-0.6063181, -0.3553966, -1.515468, 1, 0, 0, 1, 1,
-0.6056066, -0.0481719, -0.5644784, 1, 0, 0, 1, 1,
-0.604718, -1.545026, -2.826101, 1, 0, 0, 1, 1,
-0.5983534, 0.3337694, -1.233454, 1, 0, 0, 1, 1,
-0.5976483, -1.557107, -4.530362, 1, 0, 0, 1, 1,
-0.5964811, -1.265218, -5.144653, 0, 0, 0, 1, 1,
-0.5949812, -0.8670167, -3.314302, 0, 0, 0, 1, 1,
-0.5911545, -0.2591407, -0.8862881, 0, 0, 0, 1, 1,
-0.579327, -0.6674452, -0.3927407, 0, 0, 0, 1, 1,
-0.5791632, -1.297977, -2.793284, 0, 0, 0, 1, 1,
-0.5771949, -0.1876583, -1.769255, 0, 0, 0, 1, 1,
-0.5766256, 0.4968579, -1.491459, 0, 0, 0, 1, 1,
-0.5754696, -0.2268919, -4.484992, 1, 1, 1, 1, 1,
-0.5752144, 0.1429982, -0.3389627, 1, 1, 1, 1, 1,
-0.574671, 1.507108, -0.9170746, 1, 1, 1, 1, 1,
-0.5686202, -0.323553, -2.209121, 1, 1, 1, 1, 1,
-0.5632011, 0.2454566, -0.6631762, 1, 1, 1, 1, 1,
-0.5630937, 0.9568396, -0.5403008, 1, 1, 1, 1, 1,
-0.5620496, -1.218708, -3.90555, 1, 1, 1, 1, 1,
-0.5607705, -0.1033077, -2.177307, 1, 1, 1, 1, 1,
-0.5561426, -1.041999, -1.698841, 1, 1, 1, 1, 1,
-0.5558113, 1.541133, -0.7219925, 1, 1, 1, 1, 1,
-0.5528319, -0.1421173, -1.750748, 1, 1, 1, 1, 1,
-0.5516498, 0.5534251, -1.206513, 1, 1, 1, 1, 1,
-0.5502573, 0.00340922, -1.22022, 1, 1, 1, 1, 1,
-0.5495951, 0.06434492, -1.449301, 1, 1, 1, 1, 1,
-0.5474734, -0.3283638, -2.674541, 1, 1, 1, 1, 1,
-0.5473474, 0.2501157, 0.7472639, 0, 0, 1, 1, 1,
-0.5471423, -1.190637, -4.356359, 1, 0, 0, 1, 1,
-0.5414611, 0.687465, -1.802688, 1, 0, 0, 1, 1,
-0.5412328, 0.5059102, -1.405355, 1, 0, 0, 1, 1,
-0.5409536, -1.092283, -2.391759, 1, 0, 0, 1, 1,
-0.5387043, -0.6198714, -1.967232, 1, 0, 0, 1, 1,
-0.5328199, -0.9524935, -5.001664, 0, 0, 0, 1, 1,
-0.5164553, -0.2872876, -0.09779795, 0, 0, 0, 1, 1,
-0.5163207, 0.13739, -2.015482, 0, 0, 0, 1, 1,
-0.5070791, -2.400289, -3.934237, 0, 0, 0, 1, 1,
-0.5037757, -0.5632293, -3.590242, 0, 0, 0, 1, 1,
-0.4974953, 1.890934, -0.3676609, 0, 0, 0, 1, 1,
-0.4907851, -1.410327, -2.506377, 0, 0, 0, 1, 1,
-0.4893464, -0.3429699, -3.176623, 1, 1, 1, 1, 1,
-0.4890113, -0.7671043, -2.871671, 1, 1, 1, 1, 1,
-0.4882993, 0.3338403, -3.068793, 1, 1, 1, 1, 1,
-0.4872916, 0.04363542, -3.263747, 1, 1, 1, 1, 1,
-0.4860412, -0.6766918, -2.913482, 1, 1, 1, 1, 1,
-0.4836304, -0.4563272, -2.767484, 1, 1, 1, 1, 1,
-0.4778356, 1.16009, -2.519652, 1, 1, 1, 1, 1,
-0.4775771, -0.5480133, -3.067713, 1, 1, 1, 1, 1,
-0.4744186, 0.5042575, -3.81105, 1, 1, 1, 1, 1,
-0.4707628, -0.4644038, -2.294998, 1, 1, 1, 1, 1,
-0.4660421, 0.5685033, 1.168295, 1, 1, 1, 1, 1,
-0.463541, 1.692185, -1.068601, 1, 1, 1, 1, 1,
-0.4624409, 0.4700253, 0.834481, 1, 1, 1, 1, 1,
-0.4551787, 0.04586682, -2.509707, 1, 1, 1, 1, 1,
-0.4533595, 0.02080297, -0.8484637, 1, 1, 1, 1, 1,
-0.4511658, 0.6756881, -0.2144316, 0, 0, 1, 1, 1,
-0.4502063, -0.4515263, -3.123428, 1, 0, 0, 1, 1,
-0.4490204, 1.328502, -0.532776, 1, 0, 0, 1, 1,
-0.4460647, 0.8765413, -0.1643937, 1, 0, 0, 1, 1,
-0.4418114, -0.3834425, -1.684791, 1, 0, 0, 1, 1,
-0.4412887, 1.197996, -0.3331699, 1, 0, 0, 1, 1,
-0.4407775, 0.3961978, -0.737367, 0, 0, 0, 1, 1,
-0.4388642, 1.088119, -1.955153, 0, 0, 0, 1, 1,
-0.4377892, 0.8902353, -1.040633, 0, 0, 0, 1, 1,
-0.4375733, -0.1349053, -0.8442724, 0, 0, 0, 1, 1,
-0.4344823, 1.025636, -0.1261418, 0, 0, 0, 1, 1,
-0.422307, -0.4335982, -3.329909, 0, 0, 0, 1, 1,
-0.4154703, 1.010278, -1.643143, 0, 0, 0, 1, 1,
-0.4133107, -1.523061, -3.398354, 1, 1, 1, 1, 1,
-0.4087025, -0.6501992, -0.9898359, 1, 1, 1, 1, 1,
-0.4039039, 0.861734, -1.50011, 1, 1, 1, 1, 1,
-0.4031831, 0.5605422, -0.2119186, 1, 1, 1, 1, 1,
-0.3978516, -0.2046794, -1.939974, 1, 1, 1, 1, 1,
-0.3974499, 2.299412, 1.297006, 1, 1, 1, 1, 1,
-0.397445, 0.01882766, -0.9846705, 1, 1, 1, 1, 1,
-0.3942419, -0.3565165, -1.811221, 1, 1, 1, 1, 1,
-0.3933893, -0.490157, -0.5135639, 1, 1, 1, 1, 1,
-0.3831584, 0.549247, -0.2210953, 1, 1, 1, 1, 1,
-0.3779063, -0.3116227, -1.506864, 1, 1, 1, 1, 1,
-0.3670347, -1.136711, -2.534683, 1, 1, 1, 1, 1,
-0.3643799, -1.615554, -4.390794, 1, 1, 1, 1, 1,
-0.363552, 2.078412, 0.1475595, 1, 1, 1, 1, 1,
-0.3598568, 0.1226612, -1.245025, 1, 1, 1, 1, 1,
-0.352017, -1.242989, -3.007624, 0, 0, 1, 1, 1,
-0.3515509, 0.6598855, -1.549029, 1, 0, 0, 1, 1,
-0.3500631, 0.1006995, -0.4148268, 1, 0, 0, 1, 1,
-0.3449456, 1.356383, -0.6823589, 1, 0, 0, 1, 1,
-0.3428786, -0.6274855, -1.778502, 1, 0, 0, 1, 1,
-0.3386786, -0.1387539, -1.293348, 1, 0, 0, 1, 1,
-0.3362704, -0.5345436, -3.733968, 0, 0, 0, 1, 1,
-0.3305458, -1.5039, -2.797481, 0, 0, 0, 1, 1,
-0.3290687, 0.7616931, 0.233587, 0, 0, 0, 1, 1,
-0.3274044, 0.1321118, -0.6456306, 0, 0, 0, 1, 1,
-0.3233709, 0.02098406, -2.654759, 0, 0, 0, 1, 1,
-0.3186435, -0.5723191, -1.747064, 0, 0, 0, 1, 1,
-0.3183821, 1.089171, -0.4466567, 0, 0, 0, 1, 1,
-0.3179027, 1.263021, -0.7316543, 1, 1, 1, 1, 1,
-0.3148374, -0.03641012, -0.0971035, 1, 1, 1, 1, 1,
-0.3128425, -1.867119, -4.002669, 1, 1, 1, 1, 1,
-0.3016582, 0.486909, -1.072527, 1, 1, 1, 1, 1,
-0.2986068, -0.3173934, -4.335694, 1, 1, 1, 1, 1,
-0.2955512, 0.4934123, -1.530335, 1, 1, 1, 1, 1,
-0.2955281, -0.4333083, -3.079614, 1, 1, 1, 1, 1,
-0.2945446, 0.483115, 1.273453, 1, 1, 1, 1, 1,
-0.2851701, 1.253076, 0.2784283, 1, 1, 1, 1, 1,
-0.284019, -0.3746434, -1.527088, 1, 1, 1, 1, 1,
-0.2818173, 1.787815, 0.2097889, 1, 1, 1, 1, 1,
-0.2811289, -0.6087375, -1.403211, 1, 1, 1, 1, 1,
-0.2805614, 0.1068227, -0.07003714, 1, 1, 1, 1, 1,
-0.2794212, -1.802878, -3.906905, 1, 1, 1, 1, 1,
-0.2777602, 0.5912557, -1.249844, 1, 1, 1, 1, 1,
-0.2688712, -0.3834666, -3.864882, 0, 0, 1, 1, 1,
-0.2686106, -2.098217, -3.154482, 1, 0, 0, 1, 1,
-0.2660071, -1.255341, -1.997837, 1, 0, 0, 1, 1,
-0.2655209, 0.1651814, -0.7002597, 1, 0, 0, 1, 1,
-0.2632065, -2.428819, -5.201842, 1, 0, 0, 1, 1,
-0.2603238, 3.515203, 1.103257, 1, 0, 0, 1, 1,
-0.2580622, -0.8274273, -1.001655, 0, 0, 0, 1, 1,
-0.2563777, -0.2757969, -1.124933, 0, 0, 0, 1, 1,
-0.2473785, 1.282363, 0.992588, 0, 0, 0, 1, 1,
-0.2464023, 0.3204771, -2.015072, 0, 0, 0, 1, 1,
-0.2449228, -0.8601385, -4.04884, 0, 0, 0, 1, 1,
-0.2423081, 0.5405676, 0.3395725, 0, 0, 0, 1, 1,
-0.2376091, -0.4995859, -2.568279, 0, 0, 0, 1, 1,
-0.2336883, -2.423763, -3.015948, 1, 1, 1, 1, 1,
-0.2329247, 1.395092, -0.4503778, 1, 1, 1, 1, 1,
-0.2306828, -0.8839194, -2.373426, 1, 1, 1, 1, 1,
-0.226811, -0.5161206, -2.177356, 1, 1, 1, 1, 1,
-0.2261988, -0.09148739, -1.134991, 1, 1, 1, 1, 1,
-0.225125, 0.6466985, -1.279309, 1, 1, 1, 1, 1,
-0.2109433, -0.4103329, -1.179822, 1, 1, 1, 1, 1,
-0.2082449, 0.57231, 0.4348602, 1, 1, 1, 1, 1,
-0.2063956, 0.9858229, 1.713858, 1, 1, 1, 1, 1,
-0.2063442, 1.40877, 0.3296895, 1, 1, 1, 1, 1,
-0.2053603, -1.069957, -3.698365, 1, 1, 1, 1, 1,
-0.2020023, 1.378915, -0.1450306, 1, 1, 1, 1, 1,
-0.2012988, 0.01836088, -2.126399, 1, 1, 1, 1, 1,
-0.1919693, 0.8364558, -1.408468, 1, 1, 1, 1, 1,
-0.187413, -0.1083605, -1.076484, 1, 1, 1, 1, 1,
-0.1777413, -0.2280084, -3.033092, 0, 0, 1, 1, 1,
-0.1723915, 0.2721576, -0.9473504, 1, 0, 0, 1, 1,
-0.1707783, 1.879373, 0.7045227, 1, 0, 0, 1, 1,
-0.1664359, -0.3219622, -3.728365, 1, 0, 0, 1, 1,
-0.163976, 0.3918734, -0.1451287, 1, 0, 0, 1, 1,
-0.1630401, 1.920595, 0.1756285, 1, 0, 0, 1, 1,
-0.1626864, -0.7388456, -1.939623, 0, 0, 0, 1, 1,
-0.1604217, -1.12297, -2.594426, 0, 0, 0, 1, 1,
-0.1587382, -0.3424535, -1.140839, 0, 0, 0, 1, 1,
-0.1532742, -0.05270785, -1.634957, 0, 0, 0, 1, 1,
-0.1517521, 0.09884309, -1.964009, 0, 0, 0, 1, 1,
-0.1459392, -0.1392454, -1.611893, 0, 0, 0, 1, 1,
-0.142077, -0.6493405, -3.308289, 0, 0, 0, 1, 1,
-0.1416611, -1.196019, -2.447008, 1, 1, 1, 1, 1,
-0.1384222, -2.011402, -3.695552, 1, 1, 1, 1, 1,
-0.1348476, 0.5260348, 0.6596265, 1, 1, 1, 1, 1,
-0.1340299, -0.08091615, -1.994622, 1, 1, 1, 1, 1,
-0.133103, 0.5846989, -1.499794, 1, 1, 1, 1, 1,
-0.1288904, 0.003855506, -2.340336, 1, 1, 1, 1, 1,
-0.12851, 2.005071, 0.2409203, 1, 1, 1, 1, 1,
-0.1278411, 1.248143, -0.583629, 1, 1, 1, 1, 1,
-0.1266105, -0.01239941, -0.8358217, 1, 1, 1, 1, 1,
-0.124705, 1.661348, 0.8767281, 1, 1, 1, 1, 1,
-0.1234546, 1.180229, -1.116748, 1, 1, 1, 1, 1,
-0.1195999, -1.323272, -2.85585, 1, 1, 1, 1, 1,
-0.1192495, -2.435344, -2.554968, 1, 1, 1, 1, 1,
-0.1184805, 0.2985379, 1.043606, 1, 1, 1, 1, 1,
-0.1173052, -1.478954, -3.440854, 1, 1, 1, 1, 1,
-0.1172007, 0.7411776, 1.613205, 0, 0, 1, 1, 1,
-0.1170291, -0.6167377, -2.935396, 1, 0, 0, 1, 1,
-0.116398, 1.22303, 0.3163821, 1, 0, 0, 1, 1,
-0.1150465, 0.5164727, -2.830335, 1, 0, 0, 1, 1,
-0.1141561, 1.255206, -0.4374543, 1, 0, 0, 1, 1,
-0.1127224, 0.1964113, -0.5762169, 1, 0, 0, 1, 1,
-0.1125214, 0.602454, -1.955795, 0, 0, 0, 1, 1,
-0.1109044, 1.689302, -0.6299042, 0, 0, 0, 1, 1,
-0.1100168, -0.6105853, -0.8849578, 0, 0, 0, 1, 1,
-0.1098316, 0.4496554, -0.6356885, 0, 0, 0, 1, 1,
-0.1096421, 0.2839547, -0.01010794, 0, 0, 0, 1, 1,
-0.1096405, -0.3974716, -3.061021, 0, 0, 0, 1, 1,
-0.1066782, 0.5158622, 1.559581, 0, 0, 0, 1, 1,
-0.1065931, -0.6518748, -3.743443, 1, 1, 1, 1, 1,
-0.09942345, -1.574403, -2.238719, 1, 1, 1, 1, 1,
-0.0993064, -0.1867536, -3.966414, 1, 1, 1, 1, 1,
-0.09732302, -1.49966, -3.098108, 1, 1, 1, 1, 1,
-0.09721265, -2.980215, -3.224345, 1, 1, 1, 1, 1,
-0.09442552, -1.089022, -1.938218, 1, 1, 1, 1, 1,
-0.0849857, 0.1331087, -0.02021528, 1, 1, 1, 1, 1,
-0.08195248, -1.673379, -2.534438, 1, 1, 1, 1, 1,
-0.07930635, 1.491082, 0.5562077, 1, 1, 1, 1, 1,
-0.07614295, 0.2824264, 1.055934, 1, 1, 1, 1, 1,
-0.07602458, 1.428662, -1.582473, 1, 1, 1, 1, 1,
-0.07290525, -0.1184377, -2.712619, 1, 1, 1, 1, 1,
-0.07110066, 0.4633297, 0.3005955, 1, 1, 1, 1, 1,
-0.06524555, -0.9812605, -4.284288, 1, 1, 1, 1, 1,
-0.05677417, 0.7895746, 0.5961912, 1, 1, 1, 1, 1,
-0.05447287, 0.5587239, 0.8377291, 0, 0, 1, 1, 1,
-0.05348514, 1.371484, 0.5377524, 1, 0, 0, 1, 1,
-0.04989036, -0.440151, -3.667351, 1, 0, 0, 1, 1,
-0.04819039, -0.4194888, -2.909048, 1, 0, 0, 1, 1,
-0.04618002, 0.1469655, 0.4890788, 1, 0, 0, 1, 1,
-0.04504412, 0.8244613, 0.8030922, 1, 0, 0, 1, 1,
-0.04337311, -2.334536, -3.671657, 0, 0, 0, 1, 1,
-0.040916, 1.683691, 0.804212, 0, 0, 0, 1, 1,
-0.03836627, -0.4009111, -2.686871, 0, 0, 0, 1, 1,
-0.03200877, 2.088941, -0.600567, 0, 0, 0, 1, 1,
-0.03050825, -0.1247486, -3.656255, 0, 0, 0, 1, 1,
-0.02865824, 0.1929887, 0.04922504, 0, 0, 0, 1, 1,
-0.02714984, -1.377415, -3.453731, 0, 0, 0, 1, 1,
-0.02568625, 0.6019498, 0.2575285, 1, 1, 1, 1, 1,
-0.02379415, 1.304005, 1.103048, 1, 1, 1, 1, 1,
-0.01938465, -0.03128742, -3.303839, 1, 1, 1, 1, 1,
-0.01740259, 1.249743, 0.7096469, 1, 1, 1, 1, 1,
-0.01257104, -1.823352, -3.751597, 1, 1, 1, 1, 1,
-0.0110107, 1.498179, -0.2007911, 1, 1, 1, 1, 1,
-0.01031935, 0.8266116, -1.134047, 1, 1, 1, 1, 1,
-0.01016472, 0.5275141, -1.063594, 1, 1, 1, 1, 1,
-0.01001671, -0.918787, -4.027711, 1, 1, 1, 1, 1,
-0.00532093, 1.834916, 0.2398975, 1, 1, 1, 1, 1,
-0.004575129, -1.497442, -3.177028, 1, 1, 1, 1, 1,
0.004571183, -0.3758562, 2.928476, 1, 1, 1, 1, 1,
0.007611522, -0.3415948, 5.14178, 1, 1, 1, 1, 1,
0.008074756, 1.574217, 0.4532584, 1, 1, 1, 1, 1,
0.008914905, -0.9736979, 4.122145, 1, 1, 1, 1, 1,
0.01026546, 0.6801858, 0.289551, 0, 0, 1, 1, 1,
0.01447589, 0.3820919, -0.8339785, 1, 0, 0, 1, 1,
0.01450699, 0.4689675, -1.476685, 1, 0, 0, 1, 1,
0.01995878, 0.1242787, 1.051334, 1, 0, 0, 1, 1,
0.02195196, -0.7310183, 2.600569, 1, 0, 0, 1, 1,
0.02469848, -0.4226406, 3.825067, 1, 0, 0, 1, 1,
0.03072233, 0.4693756, -1.263604, 0, 0, 0, 1, 1,
0.03441173, 0.7336845, -0.9847404, 0, 0, 0, 1, 1,
0.03524177, 0.4694633, 1.676405, 0, 0, 0, 1, 1,
0.03845299, -2.047772, 2.964563, 0, 0, 0, 1, 1,
0.04080316, -0.1813908, 1.915353, 0, 0, 0, 1, 1,
0.04184988, -0.586533, 1.677179, 0, 0, 0, 1, 1,
0.04208652, 0.5230089, -1.083447, 0, 0, 0, 1, 1,
0.04993757, 1.144808, -0.8135357, 1, 1, 1, 1, 1,
0.05123459, -0.3269546, 3.449601, 1, 1, 1, 1, 1,
0.05227539, 0.4039902, -0.6116963, 1, 1, 1, 1, 1,
0.0526148, 1.504003, -0.3786612, 1, 1, 1, 1, 1,
0.05284349, 0.5896789, -0.8073057, 1, 1, 1, 1, 1,
0.05328549, 1.23221, -1.901549, 1, 1, 1, 1, 1,
0.05348288, 2.020106, -0.758433, 1, 1, 1, 1, 1,
0.05413368, -0.534125, 2.658629, 1, 1, 1, 1, 1,
0.05488476, -0.3183443, 1.609593, 1, 1, 1, 1, 1,
0.05735588, -1.212506, 3.015043, 1, 1, 1, 1, 1,
0.06356657, -0.2085138, 2.48522, 1, 1, 1, 1, 1,
0.06583982, 0.6388439, 0.3223081, 1, 1, 1, 1, 1,
0.07497381, -0.165582, 3.299647, 1, 1, 1, 1, 1,
0.07553718, -3.247758, 4.225393, 1, 1, 1, 1, 1,
0.07556136, -0.1785923, 3.301141, 1, 1, 1, 1, 1,
0.07734542, -0.7362961, 3.453156, 0, 0, 1, 1, 1,
0.08160853, -0.8344941, 4.024857, 1, 0, 0, 1, 1,
0.08292316, 0.637139, 1.265549, 1, 0, 0, 1, 1,
0.08429153, 0.3088251, 1.878384, 1, 0, 0, 1, 1,
0.08772337, -1.091853, 3.344174, 1, 0, 0, 1, 1,
0.08911974, 1.254094, 1.634319, 1, 0, 0, 1, 1,
0.09037146, -0.4974162, 1.438538, 0, 0, 0, 1, 1,
0.1065563, -1.101796, 3.340086, 0, 0, 0, 1, 1,
0.107526, -0.2615864, 4.020398, 0, 0, 0, 1, 1,
0.1085861, -0.4305452, 3.51531, 0, 0, 0, 1, 1,
0.1135611, -0.7991375, 1.701722, 0, 0, 0, 1, 1,
0.1172926, -0.1737549, 1.656877, 0, 0, 0, 1, 1,
0.1174275, -0.5195714, 3.83834, 0, 0, 0, 1, 1,
0.118785, -0.549018, 3.573441, 1, 1, 1, 1, 1,
0.1200504, -0.1917882, 2.046537, 1, 1, 1, 1, 1,
0.1211047, 1.93308, -1.487221, 1, 1, 1, 1, 1,
0.1258155, -0.03207692, 2.116349, 1, 1, 1, 1, 1,
0.1267592, -0.1051582, 3.283944, 1, 1, 1, 1, 1,
0.1285884, 0.239204, 0.03694281, 1, 1, 1, 1, 1,
0.1292006, -1.266086, 2.534076, 1, 1, 1, 1, 1,
0.1355074, -0.002480727, 1.720679, 1, 1, 1, 1, 1,
0.1362643, -1.091569, 3.656119, 1, 1, 1, 1, 1,
0.1372002, -0.4625609, 3.662585, 1, 1, 1, 1, 1,
0.1395847, 0.5656205, -0.2719311, 1, 1, 1, 1, 1,
0.1437805, 0.197481, 0.3176157, 1, 1, 1, 1, 1,
0.1489763, 0.7729639, -0.0855661, 1, 1, 1, 1, 1,
0.1494794, 1.399692, 2.963554, 1, 1, 1, 1, 1,
0.1517524, -0.8587482, 2.229051, 1, 1, 1, 1, 1,
0.1523366, 1.572658, 0.05729551, 0, 0, 1, 1, 1,
0.1529826, -0.1981329, 3.551861, 1, 0, 0, 1, 1,
0.155344, 0.6801017, 1.538016, 1, 0, 0, 1, 1,
0.1628742, -1.564627, 2.249384, 1, 0, 0, 1, 1,
0.1637681, 0.5580273, 0.2675743, 1, 0, 0, 1, 1,
0.1680741, -0.2749702, 4.346492, 1, 0, 0, 1, 1,
0.170412, -2.035735, 3.365156, 0, 0, 0, 1, 1,
0.1720775, 0.1262133, 1.097164, 0, 0, 0, 1, 1,
0.1742845, 0.8699844, -0.759214, 0, 0, 0, 1, 1,
0.1748977, -0.4833854, 4.732018, 0, 0, 0, 1, 1,
0.1781384, -1.342737, 3.504509, 0, 0, 0, 1, 1,
0.1825996, 0.871644, 1.272339, 0, 0, 0, 1, 1,
0.1835815, 0.6479605, -0.3198067, 0, 0, 0, 1, 1,
0.1840039, 0.7084497, 0.3459356, 1, 1, 1, 1, 1,
0.1844209, 0.8207396, -0.02393857, 1, 1, 1, 1, 1,
0.184858, -1.283568, 3.861741, 1, 1, 1, 1, 1,
0.1864578, 1.227918, -1.653373, 1, 1, 1, 1, 1,
0.192214, -2.500905, 0.8355946, 1, 1, 1, 1, 1,
0.1923578, 0.0741087, 1.296787, 1, 1, 1, 1, 1,
0.1927643, 0.7520128, 0.7016379, 1, 1, 1, 1, 1,
0.1935035, -0.2156341, 3.346183, 1, 1, 1, 1, 1,
0.1958935, -0.2344313, 2.937644, 1, 1, 1, 1, 1,
0.1976736, -0.1526653, 2.069379, 1, 1, 1, 1, 1,
0.1978698, 0.8289765, -0.1512803, 1, 1, 1, 1, 1,
0.2050609, -1.619308, 1.811228, 1, 1, 1, 1, 1,
0.2053276, 2.736407, 0.7319114, 1, 1, 1, 1, 1,
0.2099106, 0.8326359, 1.156986, 1, 1, 1, 1, 1,
0.2099377, 1.680829, 1.074062, 1, 1, 1, 1, 1,
0.2117089, -0.3094659, 1.331452, 0, 0, 1, 1, 1,
0.2153514, -1.153552, 3.357191, 1, 0, 0, 1, 1,
0.2158798, 1.773533, -0.4173924, 1, 0, 0, 1, 1,
0.2183526, 0.8000799, 0.2300739, 1, 0, 0, 1, 1,
0.2193042, 0.2914026, 0.3081107, 1, 0, 0, 1, 1,
0.221221, 1.913633, 0.6237273, 1, 0, 0, 1, 1,
0.2259099, 0.9095644, 1.232257, 0, 0, 0, 1, 1,
0.2335995, 2.112009, 0.6410418, 0, 0, 0, 1, 1,
0.2366445, -0.2439102, 0.9242255, 0, 0, 0, 1, 1,
0.2387771, -0.1925001, 3.303627, 0, 0, 0, 1, 1,
0.2394592, 0.2528972, -0.4001792, 0, 0, 0, 1, 1,
0.24263, 0.6249594, 1.529698, 0, 0, 0, 1, 1,
0.245084, 0.989363, 1.563688, 0, 0, 0, 1, 1,
0.2467645, 1.952293, -1.192454, 1, 1, 1, 1, 1,
0.2472057, -0.6813642, 3.168027, 1, 1, 1, 1, 1,
0.2473687, 0.1838188, 1.590873, 1, 1, 1, 1, 1,
0.2478674, -0.2033399, 3.189832, 1, 1, 1, 1, 1,
0.2491407, -0.1965895, 2.567634, 1, 1, 1, 1, 1,
0.2493725, -0.3295062, 3.276424, 1, 1, 1, 1, 1,
0.2520514, -0.8732327, 2.524776, 1, 1, 1, 1, 1,
0.2521112, 1.216943, 0.392055, 1, 1, 1, 1, 1,
0.2526836, -0.9222742, 2.909404, 1, 1, 1, 1, 1,
0.2529733, 0.3872488, -0.6605449, 1, 1, 1, 1, 1,
0.2531072, -0.9528008, 2.478847, 1, 1, 1, 1, 1,
0.2543676, -1.689354, 2.884347, 1, 1, 1, 1, 1,
0.2576172, -1.133911, 3.151379, 1, 1, 1, 1, 1,
0.2577135, -0.4083451, 3.603239, 1, 1, 1, 1, 1,
0.2588414, 1.535926, 2.528085, 1, 1, 1, 1, 1,
0.2602942, -0.6150553, 4.457532, 0, 0, 1, 1, 1,
0.2613088, 0.6763803, 0.5909217, 1, 0, 0, 1, 1,
0.2629791, -0.1219877, 1.773239, 1, 0, 0, 1, 1,
0.263882, 1.041741, -0.1125617, 1, 0, 0, 1, 1,
0.2644638, -1.391645, 1.643663, 1, 0, 0, 1, 1,
0.2649709, -1.532552, 2.070633, 1, 0, 0, 1, 1,
0.2663892, 0.6804562, 0.9682239, 0, 0, 0, 1, 1,
0.2686438, -1.050089, 2.980767, 0, 0, 0, 1, 1,
0.2757436, -0.9714713, 1.372829, 0, 0, 0, 1, 1,
0.2778035, -0.975932, 3.132284, 0, 0, 0, 1, 1,
0.2796505, -1.872661, 2.403392, 0, 0, 0, 1, 1,
0.2857916, -1.203606, 2.69793, 0, 0, 0, 1, 1,
0.286351, 0.4789809, -0.08949374, 0, 0, 0, 1, 1,
0.2920392, -0.6813618, 2.734663, 1, 1, 1, 1, 1,
0.3010019, 0.4982232, 1.411659, 1, 1, 1, 1, 1,
0.3040536, -1.782549, 2.847639, 1, 1, 1, 1, 1,
0.3086706, 1.867665, 2.380296, 1, 1, 1, 1, 1,
0.3099161, -0.2914321, 2.543689, 1, 1, 1, 1, 1,
0.3107889, -0.8012123, 3.449662, 1, 1, 1, 1, 1,
0.3112763, -1.874658, 2.087453, 1, 1, 1, 1, 1,
0.3117902, -0.5873973, 2.079298, 1, 1, 1, 1, 1,
0.3237301, 1.284431, -0.6110602, 1, 1, 1, 1, 1,
0.3264845, 0.3469716, -0.6094851, 1, 1, 1, 1, 1,
0.3270955, -1.63176, 1.308641, 1, 1, 1, 1, 1,
0.3284004, 1.142352, -0.4155487, 1, 1, 1, 1, 1,
0.3329209, -1.366347, 4.215209, 1, 1, 1, 1, 1,
0.3351146, 0.5716473, 1.716321, 1, 1, 1, 1, 1,
0.335153, 0.1406824, 1.681205, 1, 1, 1, 1, 1,
0.3366429, -0.4219981, 3.886722, 0, 0, 1, 1, 1,
0.3368739, -0.5360307, 3.740338, 1, 0, 0, 1, 1,
0.3430201, -0.3530592, 2.388741, 1, 0, 0, 1, 1,
0.3446029, -0.5320191, 3.318259, 1, 0, 0, 1, 1,
0.3456295, 0.9041636, 1.053192, 1, 0, 0, 1, 1,
0.3468428, 0.5014216, 0.1212773, 1, 0, 0, 1, 1,
0.3485512, -0.5501138, 2.284936, 0, 0, 0, 1, 1,
0.3486503, -1.686452, 4.053946, 0, 0, 0, 1, 1,
0.3489729, 1.389228, 0.5433203, 0, 0, 0, 1, 1,
0.3527577, -0.8884487, 2.462013, 0, 0, 0, 1, 1,
0.3561011, 1.959324, 0.04451881, 0, 0, 0, 1, 1,
0.3587405, 1.000386, -1.191696, 0, 0, 0, 1, 1,
0.3660318, 0.7552583, 0.1169198, 0, 0, 0, 1, 1,
0.3702779, -1.106116, 2.054449, 1, 1, 1, 1, 1,
0.3725633, 0.3852201, 0.7458059, 1, 1, 1, 1, 1,
0.375086, 2.472583, -0.1357946, 1, 1, 1, 1, 1,
0.3753482, -2.113099, 1.711228, 1, 1, 1, 1, 1,
0.3756453, -0.2321332, 2.098211, 1, 1, 1, 1, 1,
0.3762433, 1.080196, 0.1958382, 1, 1, 1, 1, 1,
0.3778641, -1.376393, 3.574551, 1, 1, 1, 1, 1,
0.3821934, -1.396358, 3.161089, 1, 1, 1, 1, 1,
0.382374, -0.6194196, 3.814269, 1, 1, 1, 1, 1,
0.3839347, -1.284976, 3.366537, 1, 1, 1, 1, 1,
0.3846301, -0.2699912, 0.9780877, 1, 1, 1, 1, 1,
0.3857048, 0.8344789, -0.546411, 1, 1, 1, 1, 1,
0.3860723, 0.5245591, 0.7203759, 1, 1, 1, 1, 1,
0.3888301, -2.344953, 3.430647, 1, 1, 1, 1, 1,
0.3932864, 0.2536923, 1.687965, 1, 1, 1, 1, 1,
0.3955206, -0.7218903, 2.19141, 0, 0, 1, 1, 1,
0.4019628, 0.2202106, 0.8656713, 1, 0, 0, 1, 1,
0.4034897, 1.364062, 0.1104711, 1, 0, 0, 1, 1,
0.4065582, 0.08535547, 1.304865, 1, 0, 0, 1, 1,
0.4074545, -0.5034439, 1.316107, 1, 0, 0, 1, 1,
0.4111201, 1.252959, 1.552866, 1, 0, 0, 1, 1,
0.4122845, -0.858883, 2.5519, 0, 0, 0, 1, 1,
0.4159452, -1.149785, 2.469322, 0, 0, 0, 1, 1,
0.4185609, -0.1024474, 1.59006, 0, 0, 0, 1, 1,
0.4312023, -0.09397189, 1.887627, 0, 0, 0, 1, 1,
0.439997, -1.048393, 1.445424, 0, 0, 0, 1, 1,
0.4404269, -0.5209876, 3.540192, 0, 0, 0, 1, 1,
0.4416645, 0.7808549, 1.49601, 0, 0, 0, 1, 1,
0.4436466, -0.6210178, 1.076327, 1, 1, 1, 1, 1,
0.4484696, -0.4756011, 1.688523, 1, 1, 1, 1, 1,
0.4490134, 2.577906, -0.03057778, 1, 1, 1, 1, 1,
0.4493333, 0.462988, -0.1127228, 1, 1, 1, 1, 1,
0.4512941, 1.157709, -1.053722, 1, 1, 1, 1, 1,
0.4558275, -1.258821, 3.512624, 1, 1, 1, 1, 1,
0.4588593, 0.8209706, 2.319777, 1, 1, 1, 1, 1,
0.4614444, 0.1276626, 1.658793, 1, 1, 1, 1, 1,
0.4678302, -0.1335605, 3.078634, 1, 1, 1, 1, 1,
0.4680405, 0.6162491, -0.09057058, 1, 1, 1, 1, 1,
0.4724585, -0.6171402, 3.17445, 1, 1, 1, 1, 1,
0.4741836, 0.8039222, 1.823963, 1, 1, 1, 1, 1,
0.482791, 0.4671838, 0.7199069, 1, 1, 1, 1, 1,
0.4873179, 0.2247891, 1.035331, 1, 1, 1, 1, 1,
0.4876319, -1.157264, 1.9569, 1, 1, 1, 1, 1,
0.4881258, 0.007759566, 3.613099, 0, 0, 1, 1, 1,
0.488453, -1.431662, 2.889338, 1, 0, 0, 1, 1,
0.4887481, 0.2683269, 1.275737, 1, 0, 0, 1, 1,
0.4901968, 1.774604, 2.48507, 1, 0, 0, 1, 1,
0.4911684, 0.6465548, -0.5383988, 1, 0, 0, 1, 1,
0.4919847, 0.5118298, 0.7300503, 1, 0, 0, 1, 1,
0.4921151, 0.268714, -0.6902192, 0, 0, 0, 1, 1,
0.5006905, -0.9179731, 3.874122, 0, 0, 0, 1, 1,
0.5030839, 0.9664438, 1.602702, 0, 0, 0, 1, 1,
0.5033865, 0.5430638, -0.5110677, 0, 0, 0, 1, 1,
0.5037532, 0.6599339, 0.1925821, 0, 0, 0, 1, 1,
0.5037736, 0.8740979, 2.575779, 0, 0, 0, 1, 1,
0.5063145, -0.5553452, 2.188565, 0, 0, 0, 1, 1,
0.5075476, 0.7354814, 0.06278601, 1, 1, 1, 1, 1,
0.5090501, -1.285738, 2.425755, 1, 1, 1, 1, 1,
0.5092073, 2.940206, 0.6545252, 1, 1, 1, 1, 1,
0.5092455, -1.026582, 1.957642, 1, 1, 1, 1, 1,
0.5097624, -1.515624, 2.504942, 1, 1, 1, 1, 1,
0.5097712, 2.550345, 0.4585843, 1, 1, 1, 1, 1,
0.51295, -0.8888702, 3.212469, 1, 1, 1, 1, 1,
0.5161776, 0.1121584, 1.610008, 1, 1, 1, 1, 1,
0.51819, 0.7634112, 1.581524, 1, 1, 1, 1, 1,
0.5194125, 0.05744861, 2.091537, 1, 1, 1, 1, 1,
0.5206134, -0.9668123, 0.5613907, 1, 1, 1, 1, 1,
0.5224915, 0.1782784, 0.09350289, 1, 1, 1, 1, 1,
0.5228997, -0.08074389, 1.269983, 1, 1, 1, 1, 1,
0.5251914, 0.4412526, 2.478719, 1, 1, 1, 1, 1,
0.532226, -0.2703427, 1.490939, 1, 1, 1, 1, 1,
0.5337929, 0.2686188, 1.377896, 0, 0, 1, 1, 1,
0.5344545, -0.1190206, 1.917654, 1, 0, 0, 1, 1,
0.5423331, -0.5795496, 1.692361, 1, 0, 0, 1, 1,
0.5436537, 1.40352, -0.2872405, 1, 0, 0, 1, 1,
0.5447173, 1.684605, 1.525475, 1, 0, 0, 1, 1,
0.5504029, -0.6075037, 2.66027, 1, 0, 0, 1, 1,
0.5532817, -0.2720505, 1.88138, 0, 0, 0, 1, 1,
0.5601489, -0.4100259, 1.857206, 0, 0, 0, 1, 1,
0.5655463, -0.4904443, 2.009816, 0, 0, 0, 1, 1,
0.5723873, -0.5131417, 4.002168, 0, 0, 0, 1, 1,
0.5835525, 0.07532252, 0.8894342, 0, 0, 0, 1, 1,
0.5842667, 0.8469512, 0.3743359, 0, 0, 0, 1, 1,
0.5914015, -0.1267076, 0.5949911, 0, 0, 0, 1, 1,
0.5920119, -0.3247201, 2.528638, 1, 1, 1, 1, 1,
0.6039613, -0.03866114, 2.647876, 1, 1, 1, 1, 1,
0.6104417, -0.6956565, 2.919302, 1, 1, 1, 1, 1,
0.6116819, -1.333844, 0.1844529, 1, 1, 1, 1, 1,
0.6176445, -0.8623846, 3.51525, 1, 1, 1, 1, 1,
0.618145, -0.3131292, 1.028504, 1, 1, 1, 1, 1,
0.6240573, 0.2813439, -0.7820171, 1, 1, 1, 1, 1,
0.6339814, 0.4249043, 0.8237228, 1, 1, 1, 1, 1,
0.6366149, 0.8587542, 1.768184, 1, 1, 1, 1, 1,
0.6408281, 0.6129699, 0.9091794, 1, 1, 1, 1, 1,
0.6473469, -1.121022, 3.398925, 1, 1, 1, 1, 1,
0.6496175, 0.9848803, 1.450093, 1, 1, 1, 1, 1,
0.6499592, 0.5707954, 0.01510426, 1, 1, 1, 1, 1,
0.6544029, 0.1685754, 2.493674, 1, 1, 1, 1, 1,
0.6567098, -0.26007, 2.401447, 1, 1, 1, 1, 1,
0.6583853, 2.286495, -1.408775, 0, 0, 1, 1, 1,
0.6619226, -0.9525194, 4.854167, 1, 0, 0, 1, 1,
0.6628838, 0.578756, 0.08125527, 1, 0, 0, 1, 1,
0.6650959, -0.6631939, 1.834066, 1, 0, 0, 1, 1,
0.6716462, 1.597201, 1.690785, 1, 0, 0, 1, 1,
0.6719325, 0.9348785, 1.486996, 1, 0, 0, 1, 1,
0.674035, -1.053143, 3.91364, 0, 0, 0, 1, 1,
0.6762739, 1.346317, 0.3140719, 0, 0, 0, 1, 1,
0.6771803, 0.009921304, 0.4562975, 0, 0, 0, 1, 1,
0.6772583, 1.527583, -0.3074843, 0, 0, 0, 1, 1,
0.67739, 0.4222142, 0.7875854, 0, 0, 0, 1, 1,
0.6792086, 0.7437799, -1.024157, 0, 0, 0, 1, 1,
0.6801181, 0.3643427, 2.938964, 0, 0, 0, 1, 1,
0.6815271, -2.28267, 2.290849, 1, 1, 1, 1, 1,
0.6888496, -0.6548556, 1.820672, 1, 1, 1, 1, 1,
0.6896637, 0.2402442, 0.1498391, 1, 1, 1, 1, 1,
0.6932442, 0.1308596, 1.416101, 1, 1, 1, 1, 1,
0.6945277, 2.720496, -0.3927423, 1, 1, 1, 1, 1,
0.6950972, 0.2789096, 1.944398, 1, 1, 1, 1, 1,
0.6961129, 0.07650806, 0.735811, 1, 1, 1, 1, 1,
0.6972131, -1.768924, 1.214697, 1, 1, 1, 1, 1,
0.7007185, 2.391733, -1.913613, 1, 1, 1, 1, 1,
0.7091761, -0.2337039, 2.070662, 1, 1, 1, 1, 1,
0.711449, 0.2561631, 3.146636, 1, 1, 1, 1, 1,
0.7124377, 0.5803055, 2.557575, 1, 1, 1, 1, 1,
0.7235458, -0.3572669, 2.291152, 1, 1, 1, 1, 1,
0.7318872, -0.3571879, 0.7185509, 1, 1, 1, 1, 1,
0.735379, 0.4310007, 1.695717, 1, 1, 1, 1, 1,
0.7377685, -0.01305103, 1.266936, 0, 0, 1, 1, 1,
0.7379996, -1.436521, 1.303445, 1, 0, 0, 1, 1,
0.740441, 0.7291545, 0.1634983, 1, 0, 0, 1, 1,
0.7406383, -0.609173, 2.241705, 1, 0, 0, 1, 1,
0.7438206, 0.8835742, 0.2335157, 1, 0, 0, 1, 1,
0.7473879, 1.730835, 0.8399798, 1, 0, 0, 1, 1,
0.7506871, 0.652429, -0.5123776, 0, 0, 0, 1, 1,
0.7640574, 1.742384, 0.3178778, 0, 0, 0, 1, 1,
0.7668781, -0.6945869, 0.8991678, 0, 0, 0, 1, 1,
0.7711968, -1.226799, 2.116067, 0, 0, 0, 1, 1,
0.7727854, -1.500247, 3.270888, 0, 0, 0, 1, 1,
0.7788746, 0.006748778, 2.958434, 0, 0, 0, 1, 1,
0.7802676, -0.337336, 4.475242, 0, 0, 0, 1, 1,
0.7814188, -0.00257172, -0.07622132, 1, 1, 1, 1, 1,
0.7817404, 1.571495, 2.316141, 1, 1, 1, 1, 1,
0.7864246, 1.033654, 0.9103254, 1, 1, 1, 1, 1,
0.7865861, 0.6504734, 1.907439, 1, 1, 1, 1, 1,
0.7928627, -1.186905, 2.831345, 1, 1, 1, 1, 1,
0.7929253, -0.6409057, 1.567566, 1, 1, 1, 1, 1,
0.7979364, 2.652591, 0.1999421, 1, 1, 1, 1, 1,
0.7981904, 1.538295, 0.1475274, 1, 1, 1, 1, 1,
0.8024655, 1.032562, 0.6126028, 1, 1, 1, 1, 1,
0.8031234, 1.598651, -0.07538895, 1, 1, 1, 1, 1,
0.8102775, 1.984526, 1.649314, 1, 1, 1, 1, 1,
0.8129147, -1.220107, 3.235292, 1, 1, 1, 1, 1,
0.8173069, 0.437067, 1.257672, 1, 1, 1, 1, 1,
0.8210904, 1.437372, 0.8031086, 1, 1, 1, 1, 1,
0.8212877, -0.5464785, 1.196659, 1, 1, 1, 1, 1,
0.8221605, -0.1466828, 0.9054771, 0, 0, 1, 1, 1,
0.823387, -0.9511519, 1.532596, 1, 0, 0, 1, 1,
0.8248562, -0.1126812, 1.793462, 1, 0, 0, 1, 1,
0.8255394, 0.1724316, 0.6824031, 1, 0, 0, 1, 1,
0.8272066, 1.885101, 0.627395, 1, 0, 0, 1, 1,
0.8375597, 0.6396297, 2.187912, 1, 0, 0, 1, 1,
0.8381964, 2.219051, 0.4031848, 0, 0, 0, 1, 1,
0.8402779, -0.08618516, 1.838369, 0, 0, 0, 1, 1,
0.8412847, -0.6312271, 2.348083, 0, 0, 0, 1, 1,
0.8430927, 0.2883515, 1.557799, 0, 0, 0, 1, 1,
0.8449372, 0.634746, 1.807887, 0, 0, 0, 1, 1,
0.852853, -0.4751275, 3.135018, 0, 0, 0, 1, 1,
0.8538442, 1.090105, 1.788227, 0, 0, 0, 1, 1,
0.8584848, -1.270285, 1.401399, 1, 1, 1, 1, 1,
0.8629875, 0.4337516, 2.856038, 1, 1, 1, 1, 1,
0.8701176, 0.3781389, 0.9169744, 1, 1, 1, 1, 1,
0.8711041, -2.147104, 2.328157, 1, 1, 1, 1, 1,
0.8784178, -0.1445978, 1.58373, 1, 1, 1, 1, 1,
0.8839499, 0.007191429, 0.7590703, 1, 1, 1, 1, 1,
0.8915462, 0.3002397, 1.095307, 1, 1, 1, 1, 1,
0.8924293, 0.6511468, 0.5624395, 1, 1, 1, 1, 1,
0.8961279, 0.3878666, 0.9769425, 1, 1, 1, 1, 1,
0.8987064, 0.9675608, -0.009795638, 1, 1, 1, 1, 1,
0.9003839, -0.2570432, 0.6836407, 1, 1, 1, 1, 1,
0.9022191, 0.274841, 0.8652716, 1, 1, 1, 1, 1,
0.9051688, -0.5060725, 2.964822, 1, 1, 1, 1, 1,
0.9128401, -1.372316, 3.955897, 1, 1, 1, 1, 1,
0.9162233, -0.6897144, 2.965096, 1, 1, 1, 1, 1,
0.9201993, 0.8668209, 1.206289, 0, 0, 1, 1, 1,
0.921551, 0.5433409, 2.425452, 1, 0, 0, 1, 1,
0.924437, -0.8983181, 3.519865, 1, 0, 0, 1, 1,
0.9459008, 0.2288215, 2.790818, 1, 0, 0, 1, 1,
0.9576465, -0.01934585, 2.178392, 1, 0, 0, 1, 1,
0.9594297, 0.8819543, -0.907293, 1, 0, 0, 1, 1,
0.9610943, -0.1950557, 0.2195209, 0, 0, 0, 1, 1,
0.9624449, 0.1145732, 2.751574, 0, 0, 0, 1, 1,
0.9761422, 0.8584513, 0.3306166, 0, 0, 0, 1, 1,
0.9761599, 0.2147423, 1.906882, 0, 0, 0, 1, 1,
0.9766051, 0.1255109, 1.433527, 0, 0, 0, 1, 1,
0.9868216, 0.28156, 0.3142394, 0, 0, 0, 1, 1,
0.9879911, 0.3667538, 1.625259, 0, 0, 0, 1, 1,
0.9884872, 1.649473, 0.6330804, 1, 1, 1, 1, 1,
0.9925039, -0.950782, 3.225323, 1, 1, 1, 1, 1,
0.9947419, -0.6834995, 2.796198, 1, 1, 1, 1, 1,
0.998415, 1.598603, -0.8563963, 1, 1, 1, 1, 1,
0.9993753, -1.339372, 1.20925, 1, 1, 1, 1, 1,
1.005896, 0.4728289, -0.9469519, 1, 1, 1, 1, 1,
1.010045, -0.5040868, 0.2729069, 1, 1, 1, 1, 1,
1.011068, 0.9023816, 0.814236, 1, 1, 1, 1, 1,
1.012016, -0.5263502, 1.18535, 1, 1, 1, 1, 1,
1.01483, 1.6206, -0.1830505, 1, 1, 1, 1, 1,
1.015042, 1.026896, 1.201671, 1, 1, 1, 1, 1,
1.016977, -0.9770441, 1.219087, 1, 1, 1, 1, 1,
1.01984, -0.2434924, 1.298956, 1, 1, 1, 1, 1,
1.029469, -0.08011895, 2.150786, 1, 1, 1, 1, 1,
1.031896, 1.333104, 1.010276, 1, 1, 1, 1, 1,
1.036661, 1.846984, -0.1224237, 0, 0, 1, 1, 1,
1.050093, -0.4959244, 3.736755, 1, 0, 0, 1, 1,
1.055175, -1.881835, 2.989228, 1, 0, 0, 1, 1,
1.056054, 0.8093272, 1.063999, 1, 0, 0, 1, 1,
1.060384, 0.05735665, 2.822492, 1, 0, 0, 1, 1,
1.065218, 1.786205, 2.135158, 1, 0, 0, 1, 1,
1.066026, 1.064266, -0.6112959, 0, 0, 0, 1, 1,
1.067995, 0.9131007, -0.3886543, 0, 0, 0, 1, 1,
1.068354, -0.4397224, -0.6445453, 0, 0, 0, 1, 1,
1.069033, -0.908671, 2.901873, 0, 0, 0, 1, 1,
1.07825, 0.7575545, 3.434423, 0, 0, 0, 1, 1,
1.080207, -0.6003092, 0.2981554, 0, 0, 0, 1, 1,
1.080807, -0.2004429, 1.4127, 0, 0, 0, 1, 1,
1.08269, 0.906576, -0.1465401, 1, 1, 1, 1, 1,
1.083536, 0.8950388, 1.395177, 1, 1, 1, 1, 1,
1.08897, 0.2971238, 0.3832166, 1, 1, 1, 1, 1,
1.09468, -0.5951203, 2.356231, 1, 1, 1, 1, 1,
1.096735, 1.445392, 1.601018, 1, 1, 1, 1, 1,
1.102669, 2.727587, -1.724548, 1, 1, 1, 1, 1,
1.105728, -0.5975127, 1.488764, 1, 1, 1, 1, 1,
1.108745, 1.513023, 0.4325412, 1, 1, 1, 1, 1,
1.114524, 0.4627004, 2.085302, 1, 1, 1, 1, 1,
1.13376, -1.728642, 1.42195, 1, 1, 1, 1, 1,
1.13442, 0.2878586, 1.905015, 1, 1, 1, 1, 1,
1.135981, 1.920406, 0.7140286, 1, 1, 1, 1, 1,
1.138385, 1.076171, 2.530042, 1, 1, 1, 1, 1,
1.139711, 1.929543, -0.2982386, 1, 1, 1, 1, 1,
1.143984, 0.6136937, 0.7657381, 1, 1, 1, 1, 1,
1.145252, -0.2022818, 3.931157, 0, 0, 1, 1, 1,
1.146534, -0.671259, 3.707157, 1, 0, 0, 1, 1,
1.153195, 1.056853, 1.590392, 1, 0, 0, 1, 1,
1.155602, -0.1874302, -0.630003, 1, 0, 0, 1, 1,
1.160935, -0.1191034, 2.918034, 1, 0, 0, 1, 1,
1.164285, 0.2293273, -0.695344, 1, 0, 0, 1, 1,
1.168984, 0.151192, 1.239671, 0, 0, 0, 1, 1,
1.171213, 1.25881, 1.220764, 0, 0, 0, 1, 1,
1.172769, 0.7479708, -0.5885702, 0, 0, 0, 1, 1,
1.174339, -1.390042, 0.4013817, 0, 0, 0, 1, 1,
1.186475, 0.1065925, 1.457256, 0, 0, 0, 1, 1,
1.187298, 0.7222438, 1.01282, 0, 0, 0, 1, 1,
1.18967, 1.103027, 1.469415, 0, 0, 0, 1, 1,
1.190732, 0.3237302, 0.9971641, 1, 1, 1, 1, 1,
1.194241, 0.1977624, 1.191942, 1, 1, 1, 1, 1,
1.19738, -1.65046, 1.741129, 1, 1, 1, 1, 1,
1.213444, -1.52099, 2.917628, 1, 1, 1, 1, 1,
1.214504, 1.953817, -1.110532, 1, 1, 1, 1, 1,
1.219759, 0.8603144, 1.969387, 1, 1, 1, 1, 1,
1.221382, 0.3187793, 1.798236, 1, 1, 1, 1, 1,
1.223068, -0.9835032, 3.481843, 1, 1, 1, 1, 1,
1.245303, 0.9739333, 0.6513719, 1, 1, 1, 1, 1,
1.247125, 1.381771, 1.166904, 1, 1, 1, 1, 1,
1.261312, -0.1180427, 1.114107, 1, 1, 1, 1, 1,
1.27278, -1.441407, 1.777656, 1, 1, 1, 1, 1,
1.278119, -1.311514, 1.790752, 1, 1, 1, 1, 1,
1.291353, -0.1126018, 2.647187, 1, 1, 1, 1, 1,
1.30542, -0.4889097, 1.902557, 1, 1, 1, 1, 1,
1.308162, -0.8915362, -0.1650547, 0, 0, 1, 1, 1,
1.316417, 1.247434, 0.6573894, 1, 0, 0, 1, 1,
1.321798, -0.8023972, 2.381044, 1, 0, 0, 1, 1,
1.333349, 0.9757627, 1.126984, 1, 0, 0, 1, 1,
1.33458, -0.7165288, 1.964067, 1, 0, 0, 1, 1,
1.344452, -0.7137737, 1.031568, 1, 0, 0, 1, 1,
1.344968, -0.4287031, 1.782636, 0, 0, 0, 1, 1,
1.345358, 0.727775, -0.2066835, 0, 0, 0, 1, 1,
1.347156, 1.937991, 1.951789, 0, 0, 0, 1, 1,
1.352657, -1.966943, 2.604393, 0, 0, 0, 1, 1,
1.358611, 0.1535723, 1.253991, 0, 0, 0, 1, 1,
1.360988, -0.7321271, 3.151506, 0, 0, 0, 1, 1,
1.361792, 0.01539808, 0.892777, 0, 0, 0, 1, 1,
1.366273, 0.7489269, 0.6463064, 1, 1, 1, 1, 1,
1.371503, 2.997478, 0.09154806, 1, 1, 1, 1, 1,
1.37241, 0.9118052, 0.7419228, 1, 1, 1, 1, 1,
1.377852, -1.582083, 2.229056, 1, 1, 1, 1, 1,
1.381444, -1.524048, 2.87265, 1, 1, 1, 1, 1,
1.381501, 0.8123237, 3.029392, 1, 1, 1, 1, 1,
1.382202, -2.284642, 2.982913, 1, 1, 1, 1, 1,
1.415472, 2.565832, 0.7070484, 1, 1, 1, 1, 1,
1.428091, 0.07589694, 2.752912, 1, 1, 1, 1, 1,
1.438572, 0.3447478, 0.3757845, 1, 1, 1, 1, 1,
1.44259, 1.129808, -1.480384, 1, 1, 1, 1, 1,
1.45019, -0.2868071, 0.7332657, 1, 1, 1, 1, 1,
1.466211, 0.9486409, -0.1901258, 1, 1, 1, 1, 1,
1.468895, 0.1315564, 0.07977304, 1, 1, 1, 1, 1,
1.499857, 1.189072, 1.957205, 1, 1, 1, 1, 1,
1.51564, -0.3135205, 2.049331, 0, 0, 1, 1, 1,
1.515669, 0.540338, 0.959618, 1, 0, 0, 1, 1,
1.517435, 1.643035, 3.610936, 1, 0, 0, 1, 1,
1.521122, -0.8364751, 1.032268, 1, 0, 0, 1, 1,
1.527885, -0.6083073, 2.395719, 1, 0, 0, 1, 1,
1.529774, -0.8034275, 3.022718, 1, 0, 0, 1, 1,
1.538581, -0.3801637, 1.963299, 0, 0, 0, 1, 1,
1.541601, -0.08611113, 0.7086175, 0, 0, 0, 1, 1,
1.548802, 0.1619162, 2.200566, 0, 0, 0, 1, 1,
1.559972, -1.42139, 3.419748, 0, 0, 0, 1, 1,
1.563221, 0.1430852, 2.073625, 0, 0, 0, 1, 1,
1.564731, 0.6791849, 1.625279, 0, 0, 0, 1, 1,
1.56909, 0.07650215, 1.477329, 0, 0, 0, 1, 1,
1.573707, 0.4401532, 0.3746437, 1, 1, 1, 1, 1,
1.585821, 1.174348, 0.8005524, 1, 1, 1, 1, 1,
1.588633, 0.464425, 1.242189, 1, 1, 1, 1, 1,
1.596029, -1.09442, 1.785497, 1, 1, 1, 1, 1,
1.598426, -1.887013, 2.213826, 1, 1, 1, 1, 1,
1.60822, 0.3150946, 1.096011, 1, 1, 1, 1, 1,
1.616325, -0.04646505, 0.1633981, 1, 1, 1, 1, 1,
1.619114, -1.395405, 3.07255, 1, 1, 1, 1, 1,
1.62512, -0.3205118, 1.870359, 1, 1, 1, 1, 1,
1.634052, -0.9268197, 3.827646, 1, 1, 1, 1, 1,
1.639456, 0.4955567, 2.054741, 1, 1, 1, 1, 1,
1.659596, 1.119887, 2.433852, 1, 1, 1, 1, 1,
1.664321, 0.3253118, 1.336657, 1, 1, 1, 1, 1,
1.67384, -0.4750491, 0.5259396, 1, 1, 1, 1, 1,
1.679162, -0.7148874, 2.593769, 1, 1, 1, 1, 1,
1.680524, -0.007641775, 2.038122, 0, 0, 1, 1, 1,
1.680922, 0.4497713, -0.03585517, 1, 0, 0, 1, 1,
1.693753, -0.7125946, -0.8786609, 1, 0, 0, 1, 1,
1.718695, -0.1272972, 3.618074, 1, 0, 0, 1, 1,
1.729771, -0.1008389, 2.862904, 1, 0, 0, 1, 1,
1.744549, -2.745138, 4.282065, 1, 0, 0, 1, 1,
1.767509, 0.6679209, 0.3087181, 0, 0, 0, 1, 1,
1.768477, 0.6185218, -0.7542052, 0, 0, 0, 1, 1,
1.781706, 0.5519817, 1.147754, 0, 0, 0, 1, 1,
1.83074, 0.3824518, 2.784857, 0, 0, 0, 1, 1,
1.834138, 0.8551538, 2.623295, 0, 0, 0, 1, 1,
1.836969, 0.2051168, 1.820442, 0, 0, 0, 1, 1,
1.842216, 0.03594704, 2.517211, 0, 0, 0, 1, 1,
1.849853, 0.726191, 0.5951056, 1, 1, 1, 1, 1,
1.85719, -0.6092718, 2.23882, 1, 1, 1, 1, 1,
1.890178, -0.5297776, 2.064231, 1, 1, 1, 1, 1,
1.898849, -1.215692, 2.429602, 1, 1, 1, 1, 1,
1.899091, -0.1606618, 3.895427, 1, 1, 1, 1, 1,
1.905593, 0.04884142, 1.681202, 1, 1, 1, 1, 1,
1.930388, 0.3382718, -0.06702916, 1, 1, 1, 1, 1,
1.936095, -0.3645019, 0.9860656, 1, 1, 1, 1, 1,
1.967758, -0.7191615, 2.044479, 1, 1, 1, 1, 1,
1.980902, -0.2682307, 2.935661, 1, 1, 1, 1, 1,
2.010156, -0.7372689, 1.354732, 1, 1, 1, 1, 1,
2.01857, 0.1895573, -0.5112052, 1, 1, 1, 1, 1,
2.023775, 0.4384383, 1.344614, 1, 1, 1, 1, 1,
2.035657, 1.852894, 1.261531, 1, 1, 1, 1, 1,
2.042214, -0.5870171, 1.801324, 1, 1, 1, 1, 1,
2.106576, -0.2783747, 1.050814, 0, 0, 1, 1, 1,
2.148263, -0.3373924, 2.242861, 1, 0, 0, 1, 1,
2.244588, 0.6657575, 2.437932, 1, 0, 0, 1, 1,
2.267026, -2.39772, 2.633276, 1, 0, 0, 1, 1,
2.284443, 1.672165, 2.162314, 1, 0, 0, 1, 1,
2.295372, 1.333531, 0.282836, 1, 0, 0, 1, 1,
2.297704, -0.90466, 2.100775, 0, 0, 0, 1, 1,
2.336336, -0.8807312, 0.6263335, 0, 0, 0, 1, 1,
2.417235, 0.2003301, 1.940534, 0, 0, 0, 1, 1,
2.438179, -0.8147778, 2.509514, 0, 0, 0, 1, 1,
2.442337, -0.2897778, 2.613731, 0, 0, 0, 1, 1,
2.648087, 0.2843827, -0.3803267, 0, 0, 0, 1, 1,
2.655146, -0.9928048, 2.060805, 0, 0, 0, 1, 1,
2.783954, -1.121627, 0.4533749, 1, 1, 1, 1, 1,
2.823151, 1.268285, 0.8672544, 1, 1, 1, 1, 1,
2.907009, 0.1780477, 2.344523, 1, 1, 1, 1, 1,
3.013629, -1.148759, 1.57229, 1, 1, 1, 1, 1,
3.023253, 0.4387903, 2.197882, 1, 1, 1, 1, 1,
3.152719, 0.8302698, 3.294723, 1, 1, 1, 1, 1,
3.761319, 0.537249, 2.754437, 1, 1, 1, 1, 1
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
var radius = 9.76658;
var distance = 34.3047;
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
mvMatrix.translate( -0.1198914, -0.1337228, 0.03003097 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.3047);
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