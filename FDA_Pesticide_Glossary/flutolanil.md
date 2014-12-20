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
-3.182695, 0.005288505, -2.554908, 1, 0, 0, 1,
-3.023767, 0.7740663, -2.283995, 1, 0.007843138, 0, 1,
-2.71953, -1.486967, -1.709356, 1, 0.01176471, 0, 1,
-2.712455, 0.5566854, -3.055079, 1, 0.01960784, 0, 1,
-2.596096, 0.4565549, -2.09739, 1, 0.02352941, 0, 1,
-2.575288, -0.04316848, -2.766957, 1, 0.03137255, 0, 1,
-2.473362, 0.6477889, -0.7289689, 1, 0.03529412, 0, 1,
-2.420665, -0.6407409, -1.877599, 1, 0.04313726, 0, 1,
-2.334092, 0.1283375, -0.07130109, 1, 0.04705882, 0, 1,
-2.316559, -0.6890089, -4.176261, 1, 0.05490196, 0, 1,
-2.286185, 0.5160739, -1.192945, 1, 0.05882353, 0, 1,
-2.282487, -1.141492, -2.232108, 1, 0.06666667, 0, 1,
-2.263312, -1.2752, -1.11057, 1, 0.07058824, 0, 1,
-2.261835, -1.457289, -0.9968255, 1, 0.07843138, 0, 1,
-2.259344, -0.8021089, -1.574102, 1, 0.08235294, 0, 1,
-2.251286, 0.3083704, -2.913299, 1, 0.09019608, 0, 1,
-2.241107, -2.785978, -2.131573, 1, 0.09411765, 0, 1,
-2.224124, 0.8732894, -1.550806, 1, 0.1019608, 0, 1,
-2.221051, 0.5133021, -0.7001792, 1, 0.1098039, 0, 1,
-2.174397, 1.467403, -2.086806, 1, 0.1137255, 0, 1,
-2.171071, -0.0812533, -1.420462, 1, 0.1215686, 0, 1,
-2.140151, 1.892554, 0.1029973, 1, 0.1254902, 0, 1,
-2.085264, 1.622975, -2.631102, 1, 0.1333333, 0, 1,
-2.074928, -1.101992, -2.651417, 1, 0.1372549, 0, 1,
-2.054672, 0.1465549, -0.1493113, 1, 0.145098, 0, 1,
-2.039909, 1.648211, 0.1143102, 1, 0.1490196, 0, 1,
-2.007704, -1.354547, -2.030928, 1, 0.1568628, 0, 1,
-2.004055, -0.8700081, -1.432601, 1, 0.1607843, 0, 1,
-2.000486, -0.4927558, -0.4105702, 1, 0.1686275, 0, 1,
-1.999884, -1.570509, -0.716751, 1, 0.172549, 0, 1,
-1.985949, 0.1676553, -1.967597, 1, 0.1803922, 0, 1,
-1.946642, -0.496204, -1.517084, 1, 0.1843137, 0, 1,
-1.909086, -0.1899006, -2.572153, 1, 0.1921569, 0, 1,
-1.883662, -0.5886503, -1.89062, 1, 0.1960784, 0, 1,
-1.870674, -2.987735, -4.485991, 1, 0.2039216, 0, 1,
-1.852466, -0.02505324, -2.492478, 1, 0.2117647, 0, 1,
-1.847953, -1.464285, -1.880759, 1, 0.2156863, 0, 1,
-1.840883, -1.939902, -3.147877, 1, 0.2235294, 0, 1,
-1.839747, 1.134833, -2.032141, 1, 0.227451, 0, 1,
-1.828392, 0.04932911, 0.02226719, 1, 0.2352941, 0, 1,
-1.827031, -0.9677718, -2.823538, 1, 0.2392157, 0, 1,
-1.808832, 0.4140098, -1.277091, 1, 0.2470588, 0, 1,
-1.797864, -1.089259, -0.9159606, 1, 0.2509804, 0, 1,
-1.772104, -1.635209, -3.404869, 1, 0.2588235, 0, 1,
-1.771998, -0.8069544, -0.3514529, 1, 0.2627451, 0, 1,
-1.769265, -0.6386731, -2.959269, 1, 0.2705882, 0, 1,
-1.763951, 1.435783, -1.618422, 1, 0.2745098, 0, 1,
-1.758575, 0.2331751, -1.081601, 1, 0.282353, 0, 1,
-1.754904, 0.2461647, -2.386814, 1, 0.2862745, 0, 1,
-1.730312, 0.6162694, -0.9568791, 1, 0.2941177, 0, 1,
-1.705153, -1.17203, -1.115564, 1, 0.3019608, 0, 1,
-1.704592, -1.59976, -1.195362, 1, 0.3058824, 0, 1,
-1.674617, 0.5911965, -1.371414, 1, 0.3137255, 0, 1,
-1.653508, 2.151628, -0.9372204, 1, 0.3176471, 0, 1,
-1.642622, -0.6673433, -0.9777847, 1, 0.3254902, 0, 1,
-1.634432, -1.388958, -1.294305, 1, 0.3294118, 0, 1,
-1.625938, -1.464413, -1.831319, 1, 0.3372549, 0, 1,
-1.620908, 1.585501, -0.01113331, 1, 0.3411765, 0, 1,
-1.616478, -2.069148, -1.182615, 1, 0.3490196, 0, 1,
-1.612892, -1.015265, -1.592055, 1, 0.3529412, 0, 1,
-1.610609, 0.8333488, -0.3401271, 1, 0.3607843, 0, 1,
-1.596064, -0.004032343, -1.726628, 1, 0.3647059, 0, 1,
-1.58675, 1.229068, 0.0706737, 1, 0.372549, 0, 1,
-1.578164, 0.009610909, -1.530533, 1, 0.3764706, 0, 1,
-1.564298, 1.321815, -0.7193346, 1, 0.3843137, 0, 1,
-1.560361, -2.04615, -2.012113, 1, 0.3882353, 0, 1,
-1.555861, -0.2441695, -2.171491, 1, 0.3960784, 0, 1,
-1.548197, 1.785673, 0.67066, 1, 0.4039216, 0, 1,
-1.542913, -1.245519, -0.3136438, 1, 0.4078431, 0, 1,
-1.538148, -0.97725, -1.330625, 1, 0.4156863, 0, 1,
-1.537845, -1.060503, -2.108127, 1, 0.4196078, 0, 1,
-1.528045, 0.5620056, -2.810199, 1, 0.427451, 0, 1,
-1.486588, 0.8772223, -0.8298398, 1, 0.4313726, 0, 1,
-1.481889, -2.022951, -3.340354, 1, 0.4392157, 0, 1,
-1.474946, -1.497068, -2.43678, 1, 0.4431373, 0, 1,
-1.461921, 0.5588288, -1.424581, 1, 0.4509804, 0, 1,
-1.451185, -1.027069, -3.188935, 1, 0.454902, 0, 1,
-1.444576, 0.33619, -2.22306, 1, 0.4627451, 0, 1,
-1.435359, 1.599519, 0.6458844, 1, 0.4666667, 0, 1,
-1.424805, -0.4378082, -1.904279, 1, 0.4745098, 0, 1,
-1.414261, 1.304024, -0.2571728, 1, 0.4784314, 0, 1,
-1.413072, 0.8904479, -0.3703499, 1, 0.4862745, 0, 1,
-1.408425, 0.6234451, -2.825231, 1, 0.4901961, 0, 1,
-1.376524, 1.395357, -0.7551184, 1, 0.4980392, 0, 1,
-1.375444, 0.2022483, -2.450055, 1, 0.5058824, 0, 1,
-1.372032, -0.7456172, -0.4963005, 1, 0.509804, 0, 1,
-1.369599, -1.300139, -1.495575, 1, 0.5176471, 0, 1,
-1.363489, -0.5383976, -4.182697, 1, 0.5215687, 0, 1,
-1.356696, -0.2842343, -1.985699, 1, 0.5294118, 0, 1,
-1.354885, 0.6704448, -0.4980755, 1, 0.5333334, 0, 1,
-1.337095, -0.4021584, -2.647257, 1, 0.5411765, 0, 1,
-1.334929, 0.7632252, -1.262242, 1, 0.5450981, 0, 1,
-1.332347, -2.461946, -3.794399, 1, 0.5529412, 0, 1,
-1.312356, 2.210824, -0.8990267, 1, 0.5568628, 0, 1,
-1.304844, -0.4657146, -2.484169, 1, 0.5647059, 0, 1,
-1.288157, -0.164972, -0.7125189, 1, 0.5686275, 0, 1,
-1.286464, 1.50355, 0.7930613, 1, 0.5764706, 0, 1,
-1.273645, -0.4257717, -4.194398, 1, 0.5803922, 0, 1,
-1.268077, 2.278111, -0.5269807, 1, 0.5882353, 0, 1,
-1.267232, 2.03311, -0.6963062, 1, 0.5921569, 0, 1,
-1.266545, -0.7124993, -2.244773, 1, 0.6, 0, 1,
-1.260182, -1.451507, -1.717254, 1, 0.6078432, 0, 1,
-1.259663, -0.3194483, -2.204614, 1, 0.6117647, 0, 1,
-1.259189, -0.174041, -1.594146, 1, 0.6196079, 0, 1,
-1.255353, -1.40833, -2.950956, 1, 0.6235294, 0, 1,
-1.252027, -2.510712, -3.51655, 1, 0.6313726, 0, 1,
-1.251689, -0.3336368, -1.893236, 1, 0.6352941, 0, 1,
-1.231403, -0.7454306, -1.408467, 1, 0.6431373, 0, 1,
-1.230477, 0.05911796, -1.715488, 1, 0.6470588, 0, 1,
-1.229208, 0.1790808, -2.541818, 1, 0.654902, 0, 1,
-1.221635, 1.065286, -1.175531, 1, 0.6588235, 0, 1,
-1.221422, 0.8544186, -0.4369645, 1, 0.6666667, 0, 1,
-1.214338, 1.088303, -1.834499, 1, 0.6705883, 0, 1,
-1.211266, 0.1724023, -0.843502, 1, 0.6784314, 0, 1,
-1.211262, -0.2678114, -2.093835, 1, 0.682353, 0, 1,
-1.211163, 1.349319, -3.420705, 1, 0.6901961, 0, 1,
-1.199987, -0.5674259, -1.489334, 1, 0.6941177, 0, 1,
-1.196492, -1.303739, -4.095491, 1, 0.7019608, 0, 1,
-1.196019, 1.409649, -1.799062, 1, 0.7098039, 0, 1,
-1.187435, 0.4295546, -1.432638, 1, 0.7137255, 0, 1,
-1.186409, 0.8773415, 0.3847062, 1, 0.7215686, 0, 1,
-1.179849, 0.4453469, -2.432823, 1, 0.7254902, 0, 1,
-1.166492, -0.411882, -1.350119, 1, 0.7333333, 0, 1,
-1.158798, -1.184257, -2.694204, 1, 0.7372549, 0, 1,
-1.150706, 1.776724, -0.882609, 1, 0.7450981, 0, 1,
-1.14861, -1.052251, -3.040963, 1, 0.7490196, 0, 1,
-1.14804, 1.572365, -1.05163, 1, 0.7568628, 0, 1,
-1.139723, 1.394276, -1.682156, 1, 0.7607843, 0, 1,
-1.137501, -1.1869, -1.853378, 1, 0.7686275, 0, 1,
-1.137168, 0.2393415, -2.062938, 1, 0.772549, 0, 1,
-1.133753, -0.8233839, -0.9771796, 1, 0.7803922, 0, 1,
-1.133357, 2.040819, 0.9353624, 1, 0.7843137, 0, 1,
-1.13162, 0.7673082, -2.415082, 1, 0.7921569, 0, 1,
-1.12719, -0.7717943, -1.460863, 1, 0.7960784, 0, 1,
-1.124231, 0.2767052, -0.2140506, 1, 0.8039216, 0, 1,
-1.114198, 0.6053841, -1.639279, 1, 0.8117647, 0, 1,
-1.114167, 0.7957543, -0.9107944, 1, 0.8156863, 0, 1,
-1.10194, 1.850851, -0.4194618, 1, 0.8235294, 0, 1,
-1.101316, -0.7330494, -0.5915374, 1, 0.827451, 0, 1,
-1.101056, -0.1809849, -2.080133, 1, 0.8352941, 0, 1,
-1.096375, 1.0179, -1.323606, 1, 0.8392157, 0, 1,
-1.089731, -1.325994, -3.548608, 1, 0.8470588, 0, 1,
-1.088546, -1.04387, -2.14136, 1, 0.8509804, 0, 1,
-1.077523, 0.7351637, -1.797654, 1, 0.8588235, 0, 1,
-1.076807, 0.5652906, -2.5204, 1, 0.8627451, 0, 1,
-1.067037, 1.005485, -2.508756, 1, 0.8705882, 0, 1,
-1.05829, 1.20484, 0.8029637, 1, 0.8745098, 0, 1,
-1.056368, -0.4777075, -2.522392, 1, 0.8823529, 0, 1,
-1.054762, -0.08915231, -2.336404, 1, 0.8862745, 0, 1,
-1.048813, 2.081681, 0.8389406, 1, 0.8941177, 0, 1,
-1.039812, -0.07149737, -1.638788, 1, 0.8980392, 0, 1,
-1.035881, 0.9956515, -1.347362, 1, 0.9058824, 0, 1,
-1.035828, 0.8855218, -1.573292, 1, 0.9137255, 0, 1,
-1.03463, -0.3966647, -1.441384, 1, 0.9176471, 0, 1,
-1.027776, 0.5737084, 1.277519, 1, 0.9254902, 0, 1,
-1.025003, 0.2996334, -0.4829255, 1, 0.9294118, 0, 1,
-1.013122, 0.005506699, -0.8542126, 1, 0.9372549, 0, 1,
-1.010343, 1.696252, 0.004816174, 1, 0.9411765, 0, 1,
-1.010326, 0.1628379, -4.130318, 1, 0.9490196, 0, 1,
-1.009709, -1.562957, -1.388391, 1, 0.9529412, 0, 1,
-0.9841121, -0.1818208, -2.488208, 1, 0.9607843, 0, 1,
-0.9834457, 0.071202, -0.8614767, 1, 0.9647059, 0, 1,
-0.982699, -1.925484, -0.9219796, 1, 0.972549, 0, 1,
-0.9785146, 1.656383, -0.2557596, 1, 0.9764706, 0, 1,
-0.9758793, 0.992974, -2.374089, 1, 0.9843137, 0, 1,
-0.9745869, 2.853241, 2.098278, 1, 0.9882353, 0, 1,
-0.9744484, 0.1303654, -0.8188618, 1, 0.9960784, 0, 1,
-0.971824, -1.211384, -1.696146, 0.9960784, 1, 0, 1,
-0.9712406, 1.084253, -1.667247, 0.9921569, 1, 0, 1,
-0.9670738, -1.455845, -4.048993, 0.9843137, 1, 0, 1,
-0.9654754, -0.3551362, -1.241663, 0.9803922, 1, 0, 1,
-0.9647102, 0.3883798, -1.505129, 0.972549, 1, 0, 1,
-0.9613515, -0.7692232, -1.391682, 0.9686275, 1, 0, 1,
-0.9544908, -1.324673, -3.018305, 0.9607843, 1, 0, 1,
-0.9508783, -1.51068, -4.054746, 0.9568627, 1, 0, 1,
-0.9457668, -0.5067196, -2.185859, 0.9490196, 1, 0, 1,
-0.9424468, 1.138613, -1.8346, 0.945098, 1, 0, 1,
-0.9412889, -0.1944173, -3.109339, 0.9372549, 1, 0, 1,
-0.9400787, -0.1219886, -0.2119525, 0.9333333, 1, 0, 1,
-0.9377161, 0.4448021, -0.2422723, 0.9254902, 1, 0, 1,
-0.9336833, 3.402428, -0.4619407, 0.9215686, 1, 0, 1,
-0.9323183, -1.790525, -2.715343, 0.9137255, 1, 0, 1,
-0.9319426, -0.2137573, -2.470143, 0.9098039, 1, 0, 1,
-0.9273552, -0.2591884, -3.273347, 0.9019608, 1, 0, 1,
-0.924021, -1.59342, -2.82195, 0.8941177, 1, 0, 1,
-0.922658, -1.401441, -2.832371, 0.8901961, 1, 0, 1,
-0.9207845, 0.02776266, -2.303195, 0.8823529, 1, 0, 1,
-0.9203013, -1.449522, -2.232287, 0.8784314, 1, 0, 1,
-0.9193445, 2.196216, -1.625108, 0.8705882, 1, 0, 1,
-0.916108, -1.267549, -3.251283, 0.8666667, 1, 0, 1,
-0.9086665, 1.30676, -1.27173, 0.8588235, 1, 0, 1,
-0.9076486, -0.1065398, -2.345619, 0.854902, 1, 0, 1,
-0.9058546, -1.134218, -2.607324, 0.8470588, 1, 0, 1,
-0.9032752, 0.5315166, -2.613937, 0.8431373, 1, 0, 1,
-0.9023263, -1.224123, -3.156041, 0.8352941, 1, 0, 1,
-0.9016586, 0.9033623, -0.05989397, 0.8313726, 1, 0, 1,
-0.8965873, -0.7332038, -2.358947, 0.8235294, 1, 0, 1,
-0.8910863, -1.014011, -2.746834, 0.8196079, 1, 0, 1,
-0.8881486, -1.151102, -1.661021, 0.8117647, 1, 0, 1,
-0.8857406, -0.04097089, -2.075979, 0.8078431, 1, 0, 1,
-0.8831614, -1.741974, -3.409566, 0.8, 1, 0, 1,
-0.8701704, -0.445022, -3.038953, 0.7921569, 1, 0, 1,
-0.8651078, 0.7222482, -1.106881, 0.7882353, 1, 0, 1,
-0.863301, 1.425282, -2.176381, 0.7803922, 1, 0, 1,
-0.8596272, 0.4412257, -0.5721841, 0.7764706, 1, 0, 1,
-0.8584607, -0.627248, -2.770971, 0.7686275, 1, 0, 1,
-0.8527185, -0.4379777, -4.281004, 0.7647059, 1, 0, 1,
-0.8369629, 1.731199, 0.2979199, 0.7568628, 1, 0, 1,
-0.8323797, -1.145435, -1.270471, 0.7529412, 1, 0, 1,
-0.8298832, 1.362838, 0.2115772, 0.7450981, 1, 0, 1,
-0.8296084, 0.4162228, -2.222836, 0.7411765, 1, 0, 1,
-0.8294137, -0.7338088, -1.551084, 0.7333333, 1, 0, 1,
-0.8292221, 0.269797, -1.080067, 0.7294118, 1, 0, 1,
-0.8254374, 1.07224, -2.77591, 0.7215686, 1, 0, 1,
-0.8252649, -1.422037, -1.927624, 0.7176471, 1, 0, 1,
-0.8245155, -1.089678, -1.962638, 0.7098039, 1, 0, 1,
-0.8174891, 0.6089201, -0.2981411, 0.7058824, 1, 0, 1,
-0.8167529, -1.290254, -2.008821, 0.6980392, 1, 0, 1,
-0.8149445, 0.02563413, -1.548766, 0.6901961, 1, 0, 1,
-0.8138957, -0.1495139, -0.9130269, 0.6862745, 1, 0, 1,
-0.8108204, 0.1664459, -1.387498, 0.6784314, 1, 0, 1,
-0.7980067, -0.7111729, -2.676795, 0.6745098, 1, 0, 1,
-0.7958061, -0.2164954, -3.683944, 0.6666667, 1, 0, 1,
-0.7947667, -0.2693959, -1.136159, 0.6627451, 1, 0, 1,
-0.7938763, 0.02942505, -1.059886, 0.654902, 1, 0, 1,
-0.7928032, -1.574172, -2.767769, 0.6509804, 1, 0, 1,
-0.7926349, -1.46376, -2.987806, 0.6431373, 1, 0, 1,
-0.790246, -1.472172, -1.928231, 0.6392157, 1, 0, 1,
-0.7888725, 1.705105, 0.633319, 0.6313726, 1, 0, 1,
-0.7832316, -0.3375669, -3.004202, 0.627451, 1, 0, 1,
-0.7828491, -0.4975601, -0.9426793, 0.6196079, 1, 0, 1,
-0.7769152, 0.02340583, -2.361133, 0.6156863, 1, 0, 1,
-0.7708911, 0.3880152, -0.6103052, 0.6078432, 1, 0, 1,
-0.7645083, 0.5283509, -0.3101657, 0.6039216, 1, 0, 1,
-0.7589169, -0.3062903, -1.154092, 0.5960785, 1, 0, 1,
-0.7578039, -0.6893408, -2.462107, 0.5882353, 1, 0, 1,
-0.7485188, 0.6037126, -1.221231, 0.5843138, 1, 0, 1,
-0.7464551, -0.8510162, -2.927089, 0.5764706, 1, 0, 1,
-0.7442415, 0.7526556, -0.4154494, 0.572549, 1, 0, 1,
-0.7409241, 1.936729, -0.1426214, 0.5647059, 1, 0, 1,
-0.7373957, 0.5206818, 0.811602, 0.5607843, 1, 0, 1,
-0.7337526, 0.7643969, 0.4237226, 0.5529412, 1, 0, 1,
-0.7325317, -0.1473527, -3.19893, 0.5490196, 1, 0, 1,
-0.7324759, -0.9094436, -2.727458, 0.5411765, 1, 0, 1,
-0.7280731, 1.167843, -0.6842219, 0.5372549, 1, 0, 1,
-0.7141885, 0.2022648, -1.428067, 0.5294118, 1, 0, 1,
-0.7072487, 1.236144, 0.6985129, 0.5254902, 1, 0, 1,
-0.7062691, 0.4458811, -1.211141, 0.5176471, 1, 0, 1,
-0.7051551, 1.590554, -2.119864, 0.5137255, 1, 0, 1,
-0.7028804, -0.4848851, -2.759625, 0.5058824, 1, 0, 1,
-0.694669, 0.1412331, -3.232856, 0.5019608, 1, 0, 1,
-0.6921735, -0.1244925, -2.08409, 0.4941176, 1, 0, 1,
-0.6791039, -1.523892, -3.083549, 0.4862745, 1, 0, 1,
-0.6788398, -0.2510352, -1.24463, 0.4823529, 1, 0, 1,
-0.6781794, -1.123101, -1.309215, 0.4745098, 1, 0, 1,
-0.6723493, -1.010777, -3.247727, 0.4705882, 1, 0, 1,
-0.668913, -0.4636056, -2.12842, 0.4627451, 1, 0, 1,
-0.6686255, -0.4174526, -3.082669, 0.4588235, 1, 0, 1,
-0.6624198, -0.5395325, -2.630788, 0.4509804, 1, 0, 1,
-0.6589928, 1.13588, 0.5405722, 0.4470588, 1, 0, 1,
-0.6543729, 0.1106639, -0.647783, 0.4392157, 1, 0, 1,
-0.6494276, -1.268207, -3.694483, 0.4352941, 1, 0, 1,
-0.6478961, 0.1436472, -1.330427, 0.427451, 1, 0, 1,
-0.646798, 0.07987393, -1.857172, 0.4235294, 1, 0, 1,
-0.6427984, 1.453912, -0.6066859, 0.4156863, 1, 0, 1,
-0.6381342, -0.5166825, -3.010762, 0.4117647, 1, 0, 1,
-0.636592, -0.3371991, -3.065006, 0.4039216, 1, 0, 1,
-0.6360376, 1.714958, -1.136199, 0.3960784, 1, 0, 1,
-0.6350724, -0.4580964, -3.239666, 0.3921569, 1, 0, 1,
-0.6329612, 0.2540633, -1.222138, 0.3843137, 1, 0, 1,
-0.6298782, -0.879266, -1.944036, 0.3803922, 1, 0, 1,
-0.6173436, 0.5585969, -2.304934, 0.372549, 1, 0, 1,
-0.6166629, -0.09668602, -0.4331469, 0.3686275, 1, 0, 1,
-0.6157867, -0.5898478, -3.679143, 0.3607843, 1, 0, 1,
-0.6153595, 0.1601361, -1.59269, 0.3568628, 1, 0, 1,
-0.605169, 0.8316239, -0.4255732, 0.3490196, 1, 0, 1,
-0.6046164, -1.556163, -2.698445, 0.345098, 1, 0, 1,
-0.6023899, 0.2284067, -1.268273, 0.3372549, 1, 0, 1,
-0.6010009, 0.504398, -0.1629432, 0.3333333, 1, 0, 1,
-0.5988319, -0.09299242, -2.198351, 0.3254902, 1, 0, 1,
-0.5943216, -0.3430587, -2.682059, 0.3215686, 1, 0, 1,
-0.5901724, 0.4341532, -0.7093223, 0.3137255, 1, 0, 1,
-0.5838893, -0.6738817, -2.325867, 0.3098039, 1, 0, 1,
-0.5828304, 0.9357872, -0.8515788, 0.3019608, 1, 0, 1,
-0.582419, -1.804971, -2.24015, 0.2941177, 1, 0, 1,
-0.5820627, -0.4731455, -2.886731, 0.2901961, 1, 0, 1,
-0.5803733, -0.3839516, -1.221613, 0.282353, 1, 0, 1,
-0.5752443, -0.5645531, -2.609483, 0.2784314, 1, 0, 1,
-0.5740525, -1.762309, 0.0933895, 0.2705882, 1, 0, 1,
-0.5729728, 0.491656, -0.1905881, 0.2666667, 1, 0, 1,
-0.5726216, -0.5438179, -1.492444, 0.2588235, 1, 0, 1,
-0.5719595, -0.6172959, -0.9709644, 0.254902, 1, 0, 1,
-0.5715231, -0.1398021, -2.611443, 0.2470588, 1, 0, 1,
-0.5672793, -0.01079241, -0.8969403, 0.2431373, 1, 0, 1,
-0.5663544, 1.011086, -0.593141, 0.2352941, 1, 0, 1,
-0.5653975, -0.04565929, -0.1864429, 0.2313726, 1, 0, 1,
-0.5621496, 1.297061, -0.7136914, 0.2235294, 1, 0, 1,
-0.5609093, 2.113412, -0.8151014, 0.2196078, 1, 0, 1,
-0.5603624, 0.2251526, -1.940064, 0.2117647, 1, 0, 1,
-0.5555515, -0.3924332, -2.001753, 0.2078431, 1, 0, 1,
-0.5548677, 0.3855804, -0.3479556, 0.2, 1, 0, 1,
-0.5537862, -0.8144405, -0.2888883, 0.1921569, 1, 0, 1,
-0.5529002, -0.8769124, -2.494289, 0.1882353, 1, 0, 1,
-0.546194, -0.7024413, -1.004171, 0.1803922, 1, 0, 1,
-0.5454834, 0.8072041, -1.570349, 0.1764706, 1, 0, 1,
-0.5404897, 1.707482, -1.447649, 0.1686275, 1, 0, 1,
-0.5383173, -0.02668312, -0.6588579, 0.1647059, 1, 0, 1,
-0.5377828, -0.2283155, 1.222113, 0.1568628, 1, 0, 1,
-0.5354608, -0.933095, -1.391378, 0.1529412, 1, 0, 1,
-0.5346785, 0.4991055, -0.7020578, 0.145098, 1, 0, 1,
-0.534201, 0.4276285, -1.533164, 0.1411765, 1, 0, 1,
-0.5305257, 0.2069276, -0.2920911, 0.1333333, 1, 0, 1,
-0.5304248, -0.4599213, -3.713241, 0.1294118, 1, 0, 1,
-0.5274493, -0.8677049, -2.006666, 0.1215686, 1, 0, 1,
-0.5239564, -1.088929, -2.87569, 0.1176471, 1, 0, 1,
-0.5130136, 1.163289, -1.19637, 0.1098039, 1, 0, 1,
-0.5105969, -0.2520228, -3.551878, 0.1058824, 1, 0, 1,
-0.5102493, 0.9512504, -0.3688878, 0.09803922, 1, 0, 1,
-0.5101464, 0.07476812, -1.601985, 0.09019608, 1, 0, 1,
-0.5088909, -0.8461123, -3.133199, 0.08627451, 1, 0, 1,
-0.5083152, -1.781836, -3.344251, 0.07843138, 1, 0, 1,
-0.5080581, -1.641999, -2.471968, 0.07450981, 1, 0, 1,
-0.5015852, -1.379141, -1.292015, 0.06666667, 1, 0, 1,
-0.4999481, 0.3433553, -2.140995, 0.0627451, 1, 0, 1,
-0.4803597, 0.7018716, -1.355034, 0.05490196, 1, 0, 1,
-0.4802276, 0.2121431, -1.219101, 0.05098039, 1, 0, 1,
-0.4790195, 0.142174, -0.4457753, 0.04313726, 1, 0, 1,
-0.472123, 0.06568342, -2.069452, 0.03921569, 1, 0, 1,
-0.4699075, 0.5805178, -0.6955848, 0.03137255, 1, 0, 1,
-0.4680764, -0.0008196972, -1.383406, 0.02745098, 1, 0, 1,
-0.4675673, 0.7098845, -0.9921474, 0.01960784, 1, 0, 1,
-0.4641683, -0.08702017, -2.814119, 0.01568628, 1, 0, 1,
-0.4573905, -0.1305489, -3.058923, 0.007843138, 1, 0, 1,
-0.4570207, -0.7930105, -1.17335, 0.003921569, 1, 0, 1,
-0.4551331, 1.076028, -0.7553763, 0, 1, 0.003921569, 1,
-0.4546401, -0.7424135, -2.344889, 0, 1, 0.01176471, 1,
-0.4503213, -0.1999141, -1.729576, 0, 1, 0.01568628, 1,
-0.4496627, 1.134765, 0.3639086, 0, 1, 0.02352941, 1,
-0.4440126, -0.06644537, -4.330756, 0, 1, 0.02745098, 1,
-0.4431354, -3.225074, -1.086008, 0, 1, 0.03529412, 1,
-0.4413903, -0.2689813, -1.807592, 0, 1, 0.03921569, 1,
-0.4341759, -0.8266861, -1.454309, 0, 1, 0.04705882, 1,
-0.4299954, -0.005753805, -0.8285664, 0, 1, 0.05098039, 1,
-0.4285524, -0.256687, -3.285524, 0, 1, 0.05882353, 1,
-0.4280429, 0.9327838, -0.03719622, 0, 1, 0.0627451, 1,
-0.417634, 0.2426423, -0.5401639, 0, 1, 0.07058824, 1,
-0.4139287, -0.6372424, -1.92249, 0, 1, 0.07450981, 1,
-0.4113831, 0.04509776, -2.256835, 0, 1, 0.08235294, 1,
-0.4066722, 0.5904269, 0.8940595, 0, 1, 0.08627451, 1,
-0.4056744, 0.1281753, -1.280815, 0, 1, 0.09411765, 1,
-0.4023361, 2.233096, -1.551515, 0, 1, 0.1019608, 1,
-0.4016387, -1.568808, -4.012204, 0, 1, 0.1058824, 1,
-0.3975081, 0.4353667, 0.0330472, 0, 1, 0.1137255, 1,
-0.3964753, 0.2061624, -3.135543, 0, 1, 0.1176471, 1,
-0.3951902, 0.2724474, -0.7521626, 0, 1, 0.1254902, 1,
-0.39431, -0.3698725, -4.136643, 0, 1, 0.1294118, 1,
-0.394113, 0.8040069, -0.6224281, 0, 1, 0.1372549, 1,
-0.390671, -0.04916378, -0.8129098, 0, 1, 0.1411765, 1,
-0.3893476, -0.1170682, -0.1017914, 0, 1, 0.1490196, 1,
-0.388405, -1.348562, -2.364877, 0, 1, 0.1529412, 1,
-0.3844588, -0.3513379, -3.184137, 0, 1, 0.1607843, 1,
-0.383817, 0.4837824, 0.2684267, 0, 1, 0.1647059, 1,
-0.3780787, -1.178937, -2.755764, 0, 1, 0.172549, 1,
-0.3752368, -0.8937102, -2.715298, 0, 1, 0.1764706, 1,
-0.3743213, 0.08392324, -1.19167, 0, 1, 0.1843137, 1,
-0.3741863, -0.4496924, -1.361591, 0, 1, 0.1882353, 1,
-0.3719054, -0.5148814, -3.734794, 0, 1, 0.1960784, 1,
-0.3706513, 0.1089298, -1.005648, 0, 1, 0.2039216, 1,
-0.3661665, -0.3644136, -2.912202, 0, 1, 0.2078431, 1,
-0.3644644, 1.963064, -0.8131046, 0, 1, 0.2156863, 1,
-0.3638789, -0.1503081, -1.473581, 0, 1, 0.2196078, 1,
-0.3610428, -1.371829, -2.954256, 0, 1, 0.227451, 1,
-0.360216, -0.6672973, -1.911709, 0, 1, 0.2313726, 1,
-0.3569857, 0.4599015, -0.4304916, 0, 1, 0.2392157, 1,
-0.349403, 0.704613, -0.07872326, 0, 1, 0.2431373, 1,
-0.3461818, 0.6134688, -0.5430665, 0, 1, 0.2509804, 1,
-0.343014, 0.3370237, -0.3079206, 0, 1, 0.254902, 1,
-0.3417618, 0.1715449, -2.649012, 0, 1, 0.2627451, 1,
-0.3356183, 1.315271, -0.8827006, 0, 1, 0.2666667, 1,
-0.3351916, 2.068505, -1.116284, 0, 1, 0.2745098, 1,
-0.3302999, 1.090943, -0.08754363, 0, 1, 0.2784314, 1,
-0.3271697, 0.1184377, -1.809756, 0, 1, 0.2862745, 1,
-0.3271236, 2.069957, -0.5835151, 0, 1, 0.2901961, 1,
-0.3224209, 0.2941025, -0.7537601, 0, 1, 0.2980392, 1,
-0.3217385, 0.7057152, -0.6965262, 0, 1, 0.3058824, 1,
-0.3196382, -0.7302346, -2.727365, 0, 1, 0.3098039, 1,
-0.318795, -0.9058298, -5.579396, 0, 1, 0.3176471, 1,
-0.3148893, -0.2064558, -1.433435, 0, 1, 0.3215686, 1,
-0.312602, 2.176476, -0.4170466, 0, 1, 0.3294118, 1,
-0.3103617, -0.005627353, -1.606041, 0, 1, 0.3333333, 1,
-0.3070234, 1.737795, 0.5796647, 0, 1, 0.3411765, 1,
-0.3046772, 0.9022173, -0.10676, 0, 1, 0.345098, 1,
-0.3038667, -0.9619541, -2.468331, 0, 1, 0.3529412, 1,
-0.3030806, -0.2322825, -1.123607, 0, 1, 0.3568628, 1,
-0.3020236, -0.02994081, -0.1199097, 0, 1, 0.3647059, 1,
-0.3011773, -0.6645215, -4.537623, 0, 1, 0.3686275, 1,
-0.2991844, 1.411644, 0.01293527, 0, 1, 0.3764706, 1,
-0.2983146, -1.545114, -1.213287, 0, 1, 0.3803922, 1,
-0.2900338, -0.5134126, -2.225167, 0, 1, 0.3882353, 1,
-0.282187, 0.4782376, -0.2879271, 0, 1, 0.3921569, 1,
-0.2801526, 0.7375076, -1.17301, 0, 1, 0.4, 1,
-0.2788924, -1.218429, -4.114374, 0, 1, 0.4078431, 1,
-0.2749472, 0.765462, -0.6473449, 0, 1, 0.4117647, 1,
-0.2740741, 0.7492402, -0.5615899, 0, 1, 0.4196078, 1,
-0.273347, -2.076556, -2.276841, 0, 1, 0.4235294, 1,
-0.2708626, 0.0642105, 0.2550628, 0, 1, 0.4313726, 1,
-0.2689488, -0.3999931, -1.65017, 0, 1, 0.4352941, 1,
-0.2676829, 0.03329828, -0.4107848, 0, 1, 0.4431373, 1,
-0.2656295, -0.221089, -2.135371, 0, 1, 0.4470588, 1,
-0.2655157, 1.76352, 0.6221376, 0, 1, 0.454902, 1,
-0.2605678, -0.5755106, -3.760049, 0, 1, 0.4588235, 1,
-0.2598545, 0.7763554, -1.404266, 0, 1, 0.4666667, 1,
-0.2590272, -0.6917228, -3.026814, 0, 1, 0.4705882, 1,
-0.2515936, -1.342418, -3.685536, 0, 1, 0.4784314, 1,
-0.2444802, -1.071955, -2.70034, 0, 1, 0.4823529, 1,
-0.2443879, 0.4631157, 0.8208836, 0, 1, 0.4901961, 1,
-0.2429137, 0.4860976, -1.574966, 0, 1, 0.4941176, 1,
-0.2420618, -1.239867, -3.084785, 0, 1, 0.5019608, 1,
-0.2388187, -1.433853, -3.555694, 0, 1, 0.509804, 1,
-0.2381475, 0.1691911, -0.5263792, 0, 1, 0.5137255, 1,
-0.2379419, 1.332319, 0.06470036, 0, 1, 0.5215687, 1,
-0.2378175, 1.143055, 0.6518291, 0, 1, 0.5254902, 1,
-0.2337053, 1.53982, -0.1822507, 0, 1, 0.5333334, 1,
-0.2323569, -0.869075, -3.654279, 0, 1, 0.5372549, 1,
-0.2321748, 0.1442803, -0.9644482, 0, 1, 0.5450981, 1,
-0.2282566, -0.5104463, -3.000503, 0, 1, 0.5490196, 1,
-0.2232848, 0.6506904, -1.802123, 0, 1, 0.5568628, 1,
-0.2211276, -0.02547619, -1.68478, 0, 1, 0.5607843, 1,
-0.2206567, -0.4818392, -1.676366, 0, 1, 0.5686275, 1,
-0.2119782, 0.5772251, -1.881292, 0, 1, 0.572549, 1,
-0.2118624, 0.842609, 0.856342, 0, 1, 0.5803922, 1,
-0.2093282, 1.12671, 0.288647, 0, 1, 0.5843138, 1,
-0.2073278, 0.8157498, 0.1736287, 0, 1, 0.5921569, 1,
-0.2055419, -0.477166, -2.933083, 0, 1, 0.5960785, 1,
-0.204059, -1.106614, -3.359153, 0, 1, 0.6039216, 1,
-0.1997048, 0.2654715, -0.209485, 0, 1, 0.6117647, 1,
-0.1990905, -0.973426, -2.544714, 0, 1, 0.6156863, 1,
-0.1956212, -0.6814924, -1.450843, 0, 1, 0.6235294, 1,
-0.1947126, -0.6854091, -2.555645, 0, 1, 0.627451, 1,
-0.1933619, -0.1674471, -1.912751, 0, 1, 0.6352941, 1,
-0.1900872, -0.8246246, -1.50526, 0, 1, 0.6392157, 1,
-0.1882129, 1.156067, -0.6218475, 0, 1, 0.6470588, 1,
-0.1804308, 0.5994664, 0.1982535, 0, 1, 0.6509804, 1,
-0.1786436, -0.9878806, -2.643569, 0, 1, 0.6588235, 1,
-0.1765375, -0.6251465, -1.756759, 0, 1, 0.6627451, 1,
-0.1657739, -1.038662, -2.536584, 0, 1, 0.6705883, 1,
-0.1624867, 0.9444529, -1.138449, 0, 1, 0.6745098, 1,
-0.1464781, -1.007648, -3.066468, 0, 1, 0.682353, 1,
-0.1431675, 0.6408714, 0.8171602, 0, 1, 0.6862745, 1,
-0.1382171, 0.3463936, 0.2554716, 0, 1, 0.6941177, 1,
-0.1363463, 1.26993, -0.2155354, 0, 1, 0.7019608, 1,
-0.136237, 0.9038775, -0.6190231, 0, 1, 0.7058824, 1,
-0.1351952, -1.086081, -0.9592255, 0, 1, 0.7137255, 1,
-0.1261625, 0.4750708, -0.2914741, 0, 1, 0.7176471, 1,
-0.1247918, 1.547325, -1.174773, 0, 1, 0.7254902, 1,
-0.1241617, 0.2002392, 0.4492839, 0, 1, 0.7294118, 1,
-0.1241221, -1.878526, -3.197346, 0, 1, 0.7372549, 1,
-0.1227175, 0.5188598, 0.1976521, 0, 1, 0.7411765, 1,
-0.1211542, 0.2880986, -0.7514706, 0, 1, 0.7490196, 1,
-0.1190561, -0.2568353, -2.785984, 0, 1, 0.7529412, 1,
-0.1148142, -0.4489391, -2.283836, 0, 1, 0.7607843, 1,
-0.1125591, -0.652518, -1.733883, 0, 1, 0.7647059, 1,
-0.1124931, 1.039082, 0.5566323, 0, 1, 0.772549, 1,
-0.1123356, -0.8102756, -3.237127, 0, 1, 0.7764706, 1,
-0.1080519, 0.5273858, 1.709635, 0, 1, 0.7843137, 1,
-0.09490141, 0.4467754, -1.020687, 0, 1, 0.7882353, 1,
-0.0945095, 0.8149225, -0.9315587, 0, 1, 0.7960784, 1,
-0.09359931, -0.1188455, -3.120973, 0, 1, 0.8039216, 1,
-0.09186666, -0.4696966, -1.724975, 0, 1, 0.8078431, 1,
-0.08788773, -0.8814724, -2.910459, 0, 1, 0.8156863, 1,
-0.08683175, 0.4855705, -0.8320623, 0, 1, 0.8196079, 1,
-0.08666705, -0.3771142, -3.241367, 0, 1, 0.827451, 1,
-0.0857648, -0.7496629, -2.988405, 0, 1, 0.8313726, 1,
-0.08125025, -0.3821718, -3.143909, 0, 1, 0.8392157, 1,
-0.08108838, 0.0763511, -0.94981, 0, 1, 0.8431373, 1,
-0.08024431, -1.231154, -1.502106, 0, 1, 0.8509804, 1,
-0.07778701, -0.5088906, -4.889751, 0, 1, 0.854902, 1,
-0.07641796, -0.3644212, -2.640419, 0, 1, 0.8627451, 1,
-0.0763114, -0.1961036, -2.947804, 0, 1, 0.8666667, 1,
-0.07168984, -0.8843846, -1.243147, 0, 1, 0.8745098, 1,
-0.07019135, 0.6454146, 1.318936, 0, 1, 0.8784314, 1,
-0.0664647, 1.718103, -1.343667, 0, 1, 0.8862745, 1,
-0.06356264, -1.071336, -2.704638, 0, 1, 0.8901961, 1,
-0.06345208, 0.1947304, 0.4386133, 0, 1, 0.8980392, 1,
-0.06156136, -1.391803, -2.032271, 0, 1, 0.9058824, 1,
-0.05814104, 1.261021, 0.117739, 0, 1, 0.9098039, 1,
-0.05661621, 0.9381062, -0.2211422, 0, 1, 0.9176471, 1,
-0.05285256, -0.4137535, -2.959285, 0, 1, 0.9215686, 1,
-0.04217053, -0.8441759, -2.422054, 0, 1, 0.9294118, 1,
-0.04054567, 2.188863, -0.1432457, 0, 1, 0.9333333, 1,
-0.03666323, -0.08938552, -3.048376, 0, 1, 0.9411765, 1,
-0.03523422, -0.1738238, -2.704643, 0, 1, 0.945098, 1,
-0.03305402, -0.03340706, -2.279378, 0, 1, 0.9529412, 1,
-0.02950962, -1.568942, -2.549969, 0, 1, 0.9568627, 1,
-0.02840487, -1.089507, -3.123612, 0, 1, 0.9647059, 1,
-0.025364, 0.520453, -1.137633, 0, 1, 0.9686275, 1,
-0.02387711, -0.2463336, -2.52792, 0, 1, 0.9764706, 1,
-0.02276982, -1.410305, -3.127255, 0, 1, 0.9803922, 1,
-0.02157387, 0.904056, -0.2446255, 0, 1, 0.9882353, 1,
-0.0215708, 0.1654934, 1.033195, 0, 1, 0.9921569, 1,
-0.02037168, -0.5867552, -2.173987, 0, 1, 1, 1,
-0.01953301, 0.7336667, -0.1019359, 0, 0.9921569, 1, 1,
-0.01921577, -1.845714, -3.003918, 0, 0.9882353, 1, 1,
-0.01825443, -0.4452502, -3.856365, 0, 0.9803922, 1, 1,
-0.01683607, -0.5189124, -3.148672, 0, 0.9764706, 1, 1,
-0.01628684, 1.006715, -1.522589, 0, 0.9686275, 1, 1,
-0.01467346, 0.9124407, -1.594064, 0, 0.9647059, 1, 1,
-0.01452195, -0.5936936, -3.870679, 0, 0.9568627, 1, 1,
-0.01196772, 0.6619329, -1.257835, 0, 0.9529412, 1, 1,
-0.009943536, -0.4823083, -2.437268, 0, 0.945098, 1, 1,
-0.009271385, 0.8606393, -2.829374, 0, 0.9411765, 1, 1,
-0.004281385, -0.5279328, -4.617217, 0, 0.9333333, 1, 1,
0.003602149, -0.3330363, 2.585276, 0, 0.9294118, 1, 1,
0.005594239, -0.259526, 2.829113, 0, 0.9215686, 1, 1,
0.007969058, 1.410839, -0.7887136, 0, 0.9176471, 1, 1,
0.009208339, 0.3361877, -0.7908577, 0, 0.9098039, 1, 1,
0.01627871, 0.4472502, -0.2207695, 0, 0.9058824, 1, 1,
0.01629086, -0.8815426, 3.087648, 0, 0.8980392, 1, 1,
0.01720774, -0.8896564, 3.715911, 0, 0.8901961, 1, 1,
0.02073119, -0.218804, 2.065952, 0, 0.8862745, 1, 1,
0.0262858, -1.231505, 3.585504, 0, 0.8784314, 1, 1,
0.02894831, -2.508962, 2.421089, 0, 0.8745098, 1, 1,
0.03000004, -0.6765217, 4.466464, 0, 0.8666667, 1, 1,
0.03239713, -2.673785, 2.840763, 0, 0.8627451, 1, 1,
0.0377095, -1.937148, 2.865372, 0, 0.854902, 1, 1,
0.03832788, -0.01693123, 2.281213, 0, 0.8509804, 1, 1,
0.03891349, 0.2544018, -1.090503, 0, 0.8431373, 1, 1,
0.03898242, 1.041312, -0.7090934, 0, 0.8392157, 1, 1,
0.04137118, 1.481386, 1.499323, 0, 0.8313726, 1, 1,
0.04176817, 0.8755893, 0.8990646, 0, 0.827451, 1, 1,
0.04183784, 0.7658079, 0.08744927, 0, 0.8196079, 1, 1,
0.04416782, -1.086251, 4.488667, 0, 0.8156863, 1, 1,
0.04505873, 0.4760035, -0.6522589, 0, 0.8078431, 1, 1,
0.04715636, 0.004725966, -0.9812433, 0, 0.8039216, 1, 1,
0.04848071, -0.004472402, 2.354034, 0, 0.7960784, 1, 1,
0.04913028, 0.05406646, 0.5025865, 0, 0.7882353, 1, 1,
0.05224755, 0.6835012, 0.5783187, 0, 0.7843137, 1, 1,
0.05269467, -0.8050542, 2.94203, 0, 0.7764706, 1, 1,
0.05396902, -0.1394885, 2.74881, 0, 0.772549, 1, 1,
0.05434661, 0.7285962, 0.046466, 0, 0.7647059, 1, 1,
0.06326853, -0.01756437, 1.796878, 0, 0.7607843, 1, 1,
0.06356332, -0.3043568, 3.820772, 0, 0.7529412, 1, 1,
0.06703737, 0.09298158, 1.435392, 0, 0.7490196, 1, 1,
0.06770403, 0.001253086, 2.503246, 0, 0.7411765, 1, 1,
0.0678243, 0.5217497, -0.7331343, 0, 0.7372549, 1, 1,
0.0691975, -0.9859303, 2.582147, 0, 0.7294118, 1, 1,
0.07205434, -0.3121163, 2.313442, 0, 0.7254902, 1, 1,
0.0735036, -1.378626, 3.14219, 0, 0.7176471, 1, 1,
0.07577523, 0.2513939, 2.152118, 0, 0.7137255, 1, 1,
0.076459, 0.04419293, -1.149662, 0, 0.7058824, 1, 1,
0.07990359, -0.1470283, 1.862972, 0, 0.6980392, 1, 1,
0.08249084, 0.2514289, -0.3926245, 0, 0.6941177, 1, 1,
0.08902664, 0.6621429, 1.195475, 0, 0.6862745, 1, 1,
0.09282067, -1.963218, 5.190264, 0, 0.682353, 1, 1,
0.0935467, -1.61286, 5.838261, 0, 0.6745098, 1, 1,
0.0955036, 2.76527, -0.2297599, 0, 0.6705883, 1, 1,
0.09884246, 0.8286331, 0.08110464, 0, 0.6627451, 1, 1,
0.1022024, -0.2491667, 1.979185, 0, 0.6588235, 1, 1,
0.103118, -0.06985845, 2.084413, 0, 0.6509804, 1, 1,
0.1061665, -0.5968516, 3.979203, 0, 0.6470588, 1, 1,
0.1066825, 0.1695796, 1.782142, 0, 0.6392157, 1, 1,
0.113468, 0.737213, -1.93154, 0, 0.6352941, 1, 1,
0.1228147, 0.5224127, 0.5414228, 0, 0.627451, 1, 1,
0.1232031, 0.2367905, -0.6862704, 0, 0.6235294, 1, 1,
0.1237415, 0.3421903, -0.1166741, 0, 0.6156863, 1, 1,
0.1320515, 0.5368265, 0.07072973, 0, 0.6117647, 1, 1,
0.134493, -0.2073985, 2.337802, 0, 0.6039216, 1, 1,
0.139139, -0.8545061, 2.233533, 0, 0.5960785, 1, 1,
0.1392171, -1.408719, 3.468099, 0, 0.5921569, 1, 1,
0.1414528, -0.6279501, 3.741382, 0, 0.5843138, 1, 1,
0.1442912, 0.9147918, 0.343974, 0, 0.5803922, 1, 1,
0.1455121, -2.492749, 2.714181, 0, 0.572549, 1, 1,
0.1455983, 1.548073, 0.06587335, 0, 0.5686275, 1, 1,
0.149307, -0.450859, 4.530084, 0, 0.5607843, 1, 1,
0.1513499, 1.639249, -0.639609, 0, 0.5568628, 1, 1,
0.155574, 0.04316338, 0.4768087, 0, 0.5490196, 1, 1,
0.1565538, -0.1273629, 1.702268, 0, 0.5450981, 1, 1,
0.1582646, 0.1871324, 1.23946, 0, 0.5372549, 1, 1,
0.1589799, -1.126514, 2.226921, 0, 0.5333334, 1, 1,
0.1608861, -0.8012835, 3.587546, 0, 0.5254902, 1, 1,
0.1611591, -1.394233, 3.061205, 0, 0.5215687, 1, 1,
0.161652, 1.877789, -0.1031007, 0, 0.5137255, 1, 1,
0.1682157, -0.8326979, 1.85675, 0, 0.509804, 1, 1,
0.1709461, -0.4028384, 4.066786, 0, 0.5019608, 1, 1,
0.1729102, 0.6683405, 0.02620987, 0, 0.4941176, 1, 1,
0.1732195, 0.2719929, 0.2639272, 0, 0.4901961, 1, 1,
0.1749595, 0.4332152, -0.7019609, 0, 0.4823529, 1, 1,
0.1850557, -0.1301447, 2.710241, 0, 0.4784314, 1, 1,
0.1900465, -1.36022, 2.744376, 0, 0.4705882, 1, 1,
0.1914046, 0.439764, 1.152515, 0, 0.4666667, 1, 1,
0.1928735, -1.288751, 3.131732, 0, 0.4588235, 1, 1,
0.193489, 2.105304, 0.5817692, 0, 0.454902, 1, 1,
0.1936127, 0.06219181, 0.4213472, 0, 0.4470588, 1, 1,
0.2021448, -1.647389, 2.019375, 0, 0.4431373, 1, 1,
0.2031092, 0.9623197, 3.472237, 0, 0.4352941, 1, 1,
0.2039175, 0.7819694, -0.3978645, 0, 0.4313726, 1, 1,
0.2077466, -0.7641936, 4.856018, 0, 0.4235294, 1, 1,
0.2082256, 0.4242742, 1.388523, 0, 0.4196078, 1, 1,
0.2107699, -0.5917574, 1.906321, 0, 0.4117647, 1, 1,
0.2138007, 1.538819, -0.8618745, 0, 0.4078431, 1, 1,
0.2141021, -0.2299025, 4.737009, 0, 0.4, 1, 1,
0.2168675, 1.861614, -1.927375, 0, 0.3921569, 1, 1,
0.2202499, -0.1933566, 0.3496741, 0, 0.3882353, 1, 1,
0.2227902, 0.02928644, 1.531676, 0, 0.3803922, 1, 1,
0.2256987, -0.3951747, 2.61789, 0, 0.3764706, 1, 1,
0.2273117, 0.05680027, 1.124274, 0, 0.3686275, 1, 1,
0.2275343, -0.2678571, 2.609717, 0, 0.3647059, 1, 1,
0.230942, -0.4069495, 2.193879, 0, 0.3568628, 1, 1,
0.2311037, 0.7935143, 0.5276049, 0, 0.3529412, 1, 1,
0.235648, -0.1362667, 2.028811, 0, 0.345098, 1, 1,
0.2375708, -0.6345344, 3.844658, 0, 0.3411765, 1, 1,
0.2378526, -1.065413, 2.084555, 0, 0.3333333, 1, 1,
0.2391029, -0.6068313, 2.01666, 0, 0.3294118, 1, 1,
0.2392675, 0.1051589, 0.07161622, 0, 0.3215686, 1, 1,
0.2435487, 0.3179286, 0.5705169, 0, 0.3176471, 1, 1,
0.2494336, -1.853252, 3.816827, 0, 0.3098039, 1, 1,
0.2520943, 0.2082554, 0.2971076, 0, 0.3058824, 1, 1,
0.2554388, 1.193151, -0.4682445, 0, 0.2980392, 1, 1,
0.2570672, -0.5955903, 4.576705, 0, 0.2901961, 1, 1,
0.257965, 0.4577553, 1.225996, 0, 0.2862745, 1, 1,
0.2601288, 0.2491554, -0.3016528, 0, 0.2784314, 1, 1,
0.2669736, -0.2233634, 3.829331, 0, 0.2745098, 1, 1,
0.2673725, -0.626114, 0.8589317, 0, 0.2666667, 1, 1,
0.2694125, -0.8531925, 1.989577, 0, 0.2627451, 1, 1,
0.2752745, 0.2386511, 1.181848, 0, 0.254902, 1, 1,
0.2799851, 0.4866518, 1.022076, 0, 0.2509804, 1, 1,
0.2894809, -1.241656, 2.826273, 0, 0.2431373, 1, 1,
0.2901588, 0.1820043, 1.355123, 0, 0.2392157, 1, 1,
0.2925556, -0.06410143, 0.7332379, 0, 0.2313726, 1, 1,
0.2944402, 1.095596, 0.1538289, 0, 0.227451, 1, 1,
0.2947952, 0.4165564, -0.06004746, 0, 0.2196078, 1, 1,
0.2952786, -0.7270979, 0.2064083, 0, 0.2156863, 1, 1,
0.2969976, 2.134154, -1.168923, 0, 0.2078431, 1, 1,
0.3003303, 0.8555735, -0.7968255, 0, 0.2039216, 1, 1,
0.3018367, -0.3572598, 2.658093, 0, 0.1960784, 1, 1,
0.3036064, 0.6743117, -0.8259615, 0, 0.1882353, 1, 1,
0.305055, -0.5380909, 1.583502, 0, 0.1843137, 1, 1,
0.3061955, -0.1331368, 1.327051, 0, 0.1764706, 1, 1,
0.3074819, 0.03247371, 1.482854, 0, 0.172549, 1, 1,
0.3104048, -0.4257083, 1.900413, 0, 0.1647059, 1, 1,
0.3144286, 0.210392, 0.9434272, 0, 0.1607843, 1, 1,
0.3179198, -0.9749295, 2.025527, 0, 0.1529412, 1, 1,
0.3180548, 1.353137, 0.3192936, 0, 0.1490196, 1, 1,
0.3189454, -0.5292106, 2.008292, 0, 0.1411765, 1, 1,
0.3191639, 0.0002277014, -0.1871241, 0, 0.1372549, 1, 1,
0.3198373, -0.7565692, 2.580631, 0, 0.1294118, 1, 1,
0.3215493, -0.1610484, 2.542781, 0, 0.1254902, 1, 1,
0.3221592, 0.1723816, 0.9819641, 0, 0.1176471, 1, 1,
0.3300004, -0.7116216, 3.077577, 0, 0.1137255, 1, 1,
0.3333075, 0.6051461, -0.189361, 0, 0.1058824, 1, 1,
0.3429478, 1.395081, -0.1857188, 0, 0.09803922, 1, 1,
0.3470097, -0.4835601, 4.826059, 0, 0.09411765, 1, 1,
0.3491715, 0.02644752, 1.453425, 0, 0.08627451, 1, 1,
0.35031, 1.664948, 0.8134883, 0, 0.08235294, 1, 1,
0.3510199, -0.2320576, 5.273385, 0, 0.07450981, 1, 1,
0.3579639, -0.1490868, 2.473621, 0, 0.07058824, 1, 1,
0.3588252, 0.3912844, 0.8787239, 0, 0.0627451, 1, 1,
0.3597882, 1.959799, -0.6135662, 0, 0.05882353, 1, 1,
0.3646318, 1.352272, -0.1060536, 0, 0.05098039, 1, 1,
0.3649824, -0.05955295, 2.561215, 0, 0.04705882, 1, 1,
0.3693588, 0.07532375, 1.537288, 0, 0.03921569, 1, 1,
0.3707887, 0.005535627, 0.5957975, 0, 0.03529412, 1, 1,
0.3722308, 0.23869, 1.233986, 0, 0.02745098, 1, 1,
0.3766701, 0.6842198, 0.7440816, 0, 0.02352941, 1, 1,
0.388099, -2.151098, 2.376672, 0, 0.01568628, 1, 1,
0.3916897, -0.2986044, 3.056844, 0, 0.01176471, 1, 1,
0.3925868, -0.3654267, 1.605274, 0, 0.003921569, 1, 1,
0.3978635, 0.03419776, 0.7449555, 0.003921569, 0, 1, 1,
0.4001082, -0.3002527, 1.210034, 0.007843138, 0, 1, 1,
0.4007251, 1.678642, 0.4425901, 0.01568628, 0, 1, 1,
0.4043838, 0.5297511, -1.249509, 0.01960784, 0, 1, 1,
0.4127478, 0.3364758, 1.308702, 0.02745098, 0, 1, 1,
0.4128976, -0.5554686, 1.017242, 0.03137255, 0, 1, 1,
0.4150336, -0.7564402, 3.07747, 0.03921569, 0, 1, 1,
0.4154518, -0.7210578, 2.155618, 0.04313726, 0, 1, 1,
0.416589, 1.125639, 1.278524, 0.05098039, 0, 1, 1,
0.4174931, 0.1449644, 0.1174112, 0.05490196, 0, 1, 1,
0.4186459, -0.03758335, 1.844159, 0.0627451, 0, 1, 1,
0.4186927, 0.7944925, -0.7587331, 0.06666667, 0, 1, 1,
0.419179, -0.06404088, 2.226206, 0.07450981, 0, 1, 1,
0.4200218, 0.7475805, 0.2382936, 0.07843138, 0, 1, 1,
0.4210359, 0.8303487, 0.3487744, 0.08627451, 0, 1, 1,
0.4212534, 0.3499414, -0.9561491, 0.09019608, 0, 1, 1,
0.4217033, 0.03289069, 0.7254528, 0.09803922, 0, 1, 1,
0.4247931, 0.3905823, 0.0223904, 0.1058824, 0, 1, 1,
0.4263272, 0.3038938, 0.09068467, 0.1098039, 0, 1, 1,
0.4287896, 1.02969, 0.06335702, 0.1176471, 0, 1, 1,
0.430948, -1.408178, 4.380849, 0.1215686, 0, 1, 1,
0.4347248, -1.378621, 4.041195, 0.1294118, 0, 1, 1,
0.4371069, -0.7810359, 2.361074, 0.1333333, 0, 1, 1,
0.4400878, 0.6061358, 0.02311948, 0.1411765, 0, 1, 1,
0.4481666, -0.08256999, 2.89264, 0.145098, 0, 1, 1,
0.4520685, 0.2263373, 1.583991, 0.1529412, 0, 1, 1,
0.4540564, 0.7066374, -0.08145223, 0.1568628, 0, 1, 1,
0.457558, 0.203087, -0.3638292, 0.1647059, 0, 1, 1,
0.4601502, 0.1940815, 0.07830756, 0.1686275, 0, 1, 1,
0.4603607, 1.059864, -0.1849487, 0.1764706, 0, 1, 1,
0.4618811, -0.7489137, 2.378937, 0.1803922, 0, 1, 1,
0.4640191, 0.09992854, 0.7274818, 0.1882353, 0, 1, 1,
0.465746, 0.9166936, -0.2521657, 0.1921569, 0, 1, 1,
0.4682879, 0.3619194, 2.319997, 0.2, 0, 1, 1,
0.4688962, -0.4160683, 3.059912, 0.2078431, 0, 1, 1,
0.4716553, -0.6930864, 1.997797, 0.2117647, 0, 1, 1,
0.4752491, -0.3629372, 2.597789, 0.2196078, 0, 1, 1,
0.4755614, -0.9022924, 1.949346, 0.2235294, 0, 1, 1,
0.4765146, -1.965396, 2.186783, 0.2313726, 0, 1, 1,
0.4766212, -0.2903165, 2.160886, 0.2352941, 0, 1, 1,
0.4774404, 0.8474066, 0.1778755, 0.2431373, 0, 1, 1,
0.4777217, -0.07413041, 1.172277, 0.2470588, 0, 1, 1,
0.4786734, -0.1928055, 1.497827, 0.254902, 0, 1, 1,
0.4830377, 0.2014645, 0.08362679, 0.2588235, 0, 1, 1,
0.4838164, 1.256642, 0.719997, 0.2666667, 0, 1, 1,
0.491143, 0.2840101, 1.546164, 0.2705882, 0, 1, 1,
0.4932724, -1.200338, 4.413568, 0.2784314, 0, 1, 1,
0.5008622, -0.9783244, 3.423124, 0.282353, 0, 1, 1,
0.5039996, -1.144543, 2.562186, 0.2901961, 0, 1, 1,
0.5040934, 0.05818729, 2.921464, 0.2941177, 0, 1, 1,
0.5074189, -2.20307, 3.397628, 0.3019608, 0, 1, 1,
0.514623, 0.5286213, 1.028181, 0.3098039, 0, 1, 1,
0.5166249, -1.499851, 1.953334, 0.3137255, 0, 1, 1,
0.5211901, 1.168594, 1.126153, 0.3215686, 0, 1, 1,
0.5223659, -0.527057, 3.250186, 0.3254902, 0, 1, 1,
0.5239592, 0.6226941, 1.641211, 0.3333333, 0, 1, 1,
0.5246376, -0.293845, 2.025228, 0.3372549, 0, 1, 1,
0.5271696, 0.1245766, 0.914462, 0.345098, 0, 1, 1,
0.5349356, 0.459416, 0.9839599, 0.3490196, 0, 1, 1,
0.5357906, 1.19236, 0.8211902, 0.3568628, 0, 1, 1,
0.5374458, 0.9253799, 2.649475, 0.3607843, 0, 1, 1,
0.5381971, -0.5729027, 3.624614, 0.3686275, 0, 1, 1,
0.5394428, 0.1653753, 2.021175, 0.372549, 0, 1, 1,
0.541164, -0.3240311, 2.205724, 0.3803922, 0, 1, 1,
0.5428612, 1.240048, 1.360995, 0.3843137, 0, 1, 1,
0.5434465, -0.4338288, 0.07518204, 0.3921569, 0, 1, 1,
0.5459619, -0.1783065, 0.9609697, 0.3960784, 0, 1, 1,
0.5499619, -0.2499324, 1.462616, 0.4039216, 0, 1, 1,
0.5554744, 0.0492869, 0.01349305, 0.4117647, 0, 1, 1,
0.5567245, 0.2715725, 2.161466, 0.4156863, 0, 1, 1,
0.5577295, -0.8128005, 3.675512, 0.4235294, 0, 1, 1,
0.5580744, -0.7920143, -0.425893, 0.427451, 0, 1, 1,
0.5602406, 1.89101, 0.2894018, 0.4352941, 0, 1, 1,
0.5642127, 0.8384063, 0.952104, 0.4392157, 0, 1, 1,
0.5668584, -0.3569274, 2.769656, 0.4470588, 0, 1, 1,
0.567499, -0.7993757, 0.5708835, 0.4509804, 0, 1, 1,
0.5678813, 0.4474728, 2.092328, 0.4588235, 0, 1, 1,
0.5712573, 0.7191459, 1.142473, 0.4627451, 0, 1, 1,
0.5767994, -1.144654, 0.8907817, 0.4705882, 0, 1, 1,
0.5771224, -0.7281638, 2.772599, 0.4745098, 0, 1, 1,
0.5796973, -0.9651389, 3.097478, 0.4823529, 0, 1, 1,
0.5805985, -1.427963, 3.68826, 0.4862745, 0, 1, 1,
0.5808368, 2.396635, 0.1533984, 0.4941176, 0, 1, 1,
0.5839955, -1.219789, 3.664829, 0.5019608, 0, 1, 1,
0.5867354, -1.229259, 1.412036, 0.5058824, 0, 1, 1,
0.5928699, 0.6188305, 2.87725, 0.5137255, 0, 1, 1,
0.5962853, 1.062769, -0.9578481, 0.5176471, 0, 1, 1,
0.5968702, -0.2097234, 1.937221, 0.5254902, 0, 1, 1,
0.5985623, 0.7769543, 0.8281261, 0.5294118, 0, 1, 1,
0.6013764, 1.104897, 0.1513233, 0.5372549, 0, 1, 1,
0.6069766, 0.4359859, 0.08367839, 0.5411765, 0, 1, 1,
0.6120083, 1.500778, 0.1426541, 0.5490196, 0, 1, 1,
0.6194689, -1.805564, 2.037117, 0.5529412, 0, 1, 1,
0.6195359, -0.05884964, 2.653175, 0.5607843, 0, 1, 1,
0.622812, 0.08315163, 0.7910768, 0.5647059, 0, 1, 1,
0.6240194, 0.5972462, -1.546289, 0.572549, 0, 1, 1,
0.6243465, -1.010414, 2.591636, 0.5764706, 0, 1, 1,
0.6252518, 1.239114, 2.101633, 0.5843138, 0, 1, 1,
0.6311119, -0.4837154, 1.570429, 0.5882353, 0, 1, 1,
0.6391495, 0.7712198, -0.5779788, 0.5960785, 0, 1, 1,
0.64517, 0.9292264, 1.538036, 0.6039216, 0, 1, 1,
0.6491579, -0.4663244, 2.460752, 0.6078432, 0, 1, 1,
0.653763, 0.5941162, 0.6082954, 0.6156863, 0, 1, 1,
0.662797, 1.723692, -0.1649381, 0.6196079, 0, 1, 1,
0.6632448, 0.02725946, 1.85912, 0.627451, 0, 1, 1,
0.6634772, -0.3405474, 1.012063, 0.6313726, 0, 1, 1,
0.6635081, -0.2413892, 1.872015, 0.6392157, 0, 1, 1,
0.6812719, -0.4339708, 1.423725, 0.6431373, 0, 1, 1,
0.6824811, 1.627235, 0.8984997, 0.6509804, 0, 1, 1,
0.6838487, 0.05292819, 2.304518, 0.654902, 0, 1, 1,
0.6887428, 0.3034536, 1.56266, 0.6627451, 0, 1, 1,
0.6913566, 1.604307, -0.2985986, 0.6666667, 0, 1, 1,
0.703235, -0.4178366, 2.096784, 0.6745098, 0, 1, 1,
0.7035322, 0.180108, -1.534353, 0.6784314, 0, 1, 1,
0.7045438, -0.1980786, 2.388566, 0.6862745, 0, 1, 1,
0.7062235, -1.436201, 2.074016, 0.6901961, 0, 1, 1,
0.7088115, 0.09129737, 1.213693, 0.6980392, 0, 1, 1,
0.7167926, -0.6801527, 1.54813, 0.7058824, 0, 1, 1,
0.7172508, -0.2338987, 2.70632, 0.7098039, 0, 1, 1,
0.7183319, 0.1599619, 2.977312, 0.7176471, 0, 1, 1,
0.7184644, 1.742393, -0.510764, 0.7215686, 0, 1, 1,
0.7186774, -1.477005, 1.929475, 0.7294118, 0, 1, 1,
0.7197112, 0.2862287, 1.594718, 0.7333333, 0, 1, 1,
0.7200487, 0.8907427, 0.722152, 0.7411765, 0, 1, 1,
0.7202941, -1.109902, 3.454895, 0.7450981, 0, 1, 1,
0.7247931, 1.168087, 0.6427954, 0.7529412, 0, 1, 1,
0.7257357, -1.62018, 3.507954, 0.7568628, 0, 1, 1,
0.7330194, 1.431573, 0.951699, 0.7647059, 0, 1, 1,
0.734167, -0.5128589, 0.8500271, 0.7686275, 0, 1, 1,
0.7365066, 1.282743, -0.1735741, 0.7764706, 0, 1, 1,
0.742156, -1.509665, 2.432744, 0.7803922, 0, 1, 1,
0.7529469, -0.9601321, 3.572968, 0.7882353, 0, 1, 1,
0.7540472, 2.040349, -1.470538, 0.7921569, 0, 1, 1,
0.7566415, -1.661951, 2.408693, 0.8, 0, 1, 1,
0.7569338, -0.008029243, 1.859492, 0.8078431, 0, 1, 1,
0.7578242, 0.402516, 1.151282, 0.8117647, 0, 1, 1,
0.7597709, -2.255246, 3.177162, 0.8196079, 0, 1, 1,
0.7611909, 0.8683257, -0.1000708, 0.8235294, 0, 1, 1,
0.7619308, -2.285065, 1.847802, 0.8313726, 0, 1, 1,
0.773381, -0.9676617, 2.27933, 0.8352941, 0, 1, 1,
0.7769626, 0.1703045, 0.6542754, 0.8431373, 0, 1, 1,
0.7814525, -1.704169, 1.613346, 0.8470588, 0, 1, 1,
0.7825502, -1.136709, 1.60943, 0.854902, 0, 1, 1,
0.7834746, 0.02284463, -0.4556054, 0.8588235, 0, 1, 1,
0.7838603, -0.773066, 1.318605, 0.8666667, 0, 1, 1,
0.7882081, -0.2454151, 2.159566, 0.8705882, 0, 1, 1,
0.7918411, -0.09281272, 1.623207, 0.8784314, 0, 1, 1,
0.7927467, -1.017835, 3.883704, 0.8823529, 0, 1, 1,
0.8121493, -1.757641, 2.440912, 0.8901961, 0, 1, 1,
0.8155222, 0.5619312, 2.947115, 0.8941177, 0, 1, 1,
0.8259081, -1.089604, 2.555474, 0.9019608, 0, 1, 1,
0.8265601, 0.9476828, 3.252302, 0.9098039, 0, 1, 1,
0.8273669, -1.733727, 2.181548, 0.9137255, 0, 1, 1,
0.8323151, -0.195288, 0.2075384, 0.9215686, 0, 1, 1,
0.8329525, 0.2161541, 0.0345614, 0.9254902, 0, 1, 1,
0.8335437, 0.936079, 3.607536, 0.9333333, 0, 1, 1,
0.8337877, 0.6506714, 2.514, 0.9372549, 0, 1, 1,
0.8415953, 0.7141357, 1.525096, 0.945098, 0, 1, 1,
0.8417749, -0.3830625, 1.633995, 0.9490196, 0, 1, 1,
0.8525075, 0.2413322, 0.3905172, 0.9568627, 0, 1, 1,
0.8526805, -0.8463433, 2.853331, 0.9607843, 0, 1, 1,
0.8558435, 1.23225, -0.4572085, 0.9686275, 0, 1, 1,
0.8611706, -0.4834219, 1.549866, 0.972549, 0, 1, 1,
0.8654242, 0.679597, 0.7556228, 0.9803922, 0, 1, 1,
0.8663394, -0.7198964, -0.9608407, 0.9843137, 0, 1, 1,
0.8666382, 1.74873, 0.2892704, 0.9921569, 0, 1, 1,
0.8700988, -1.776238, 2.583085, 0.9960784, 0, 1, 1,
0.8704619, 1.093971, 0.3704629, 1, 0, 0.9960784, 1,
0.8751746, -1.55646, 1.800751, 1, 0, 0.9882353, 1,
0.8768799, -1.533477, 2.510629, 1, 0, 0.9843137, 1,
0.8852577, 0.3355644, 0.4704298, 1, 0, 0.9764706, 1,
0.895895, 0.1078979, 0.1705167, 1, 0, 0.972549, 1,
0.9000003, -0.8700291, 3.15091, 1, 0, 0.9647059, 1,
0.9126365, 1.843267, 1.73078, 1, 0, 0.9607843, 1,
0.9134247, -0.6232181, 2.045504, 1, 0, 0.9529412, 1,
0.9144114, 0.1885252, 2.007182, 1, 0, 0.9490196, 1,
0.9167282, 1.43619, -0.5758423, 1, 0, 0.9411765, 1,
0.9167462, -0.5496026, 3.418429, 1, 0, 0.9372549, 1,
0.9208661, -0.6524041, 4.069908, 1, 0, 0.9294118, 1,
0.9272556, -0.117264, 1.105416, 1, 0, 0.9254902, 1,
0.9297408, -1.42204, 2.827672, 1, 0, 0.9176471, 1,
0.9402601, 0.5570982, 1.24199, 1, 0, 0.9137255, 1,
0.9405814, -1.668792, 1.682495, 1, 0, 0.9058824, 1,
0.9466942, -0.1929497, 1.336642, 1, 0, 0.9019608, 1,
0.9471663, 2.310244, -0.9071654, 1, 0, 0.8941177, 1,
0.9566156, -0.7516586, 0.8373959, 1, 0, 0.8862745, 1,
0.9661586, -1.810828, 2.679731, 1, 0, 0.8823529, 1,
0.9781872, 1.099901, -0.0867051, 1, 0, 0.8745098, 1,
0.979527, 1.282625, 1.080386, 1, 0, 0.8705882, 1,
0.9840748, -1.097129, 1.407222, 1, 0, 0.8627451, 1,
0.9853856, 1.557389, 0.8332791, 1, 0, 0.8588235, 1,
0.9954562, -3.793663, 2.875336, 1, 0, 0.8509804, 1,
1.000906, 0.9650409, 2.276016, 1, 0, 0.8470588, 1,
1.002893, -0.959233, 2.308616, 1, 0, 0.8392157, 1,
1.004952, -1.957371, 1.260865, 1, 0, 0.8352941, 1,
1.005679, -0.40811, 1.289942, 1, 0, 0.827451, 1,
1.015388, -0.9852849, 5.694397, 1, 0, 0.8235294, 1,
1.017026, -0.4978485, 0.6619756, 1, 0, 0.8156863, 1,
1.017086, -0.4256033, 3.033478, 1, 0, 0.8117647, 1,
1.024281, -0.3705055, 2.830496, 1, 0, 0.8039216, 1,
1.032211, 0.7155724, 1.417688, 1, 0, 0.7960784, 1,
1.035161, 0.960771, -0.09558016, 1, 0, 0.7921569, 1,
1.037483, -1.255376, 4.683395, 1, 0, 0.7843137, 1,
1.041927, -0.479434, 0.7416373, 1, 0, 0.7803922, 1,
1.0436, -0.8901665, 0.7637418, 1, 0, 0.772549, 1,
1.044713, -1.742081, 2.218226, 1, 0, 0.7686275, 1,
1.05865, 1.657745, 0.9674259, 1, 0, 0.7607843, 1,
1.065975, -0.1608567, 2.108391, 1, 0, 0.7568628, 1,
1.080117, 2.679428, 2.670197, 1, 0, 0.7490196, 1,
1.082664, -2.097029, 2.560474, 1, 0, 0.7450981, 1,
1.084933, -0.7247641, 1.730803, 1, 0, 0.7372549, 1,
1.08982, -0.2338585, 1.436006, 1, 0, 0.7333333, 1,
1.09348, -0.6426005, 2.040287, 1, 0, 0.7254902, 1,
1.100002, -0.5747457, 3.293125, 1, 0, 0.7215686, 1,
1.100645, 2.143536, -0.6079644, 1, 0, 0.7137255, 1,
1.102382, 0.3795602, 2.137385, 1, 0, 0.7098039, 1,
1.107167, 0.3287478, 0.8230788, 1, 0, 0.7019608, 1,
1.112901, 0.7682747, 0.9028322, 1, 0, 0.6941177, 1,
1.123673, 1.733197, 1.588307, 1, 0, 0.6901961, 1,
1.128971, 0.6267295, -0.08603069, 1, 0, 0.682353, 1,
1.132282, 1.091469, 1.377874, 1, 0, 0.6784314, 1,
1.135346, -0.7181121, 1.255587, 1, 0, 0.6705883, 1,
1.141701, -0.3033697, 3.134954, 1, 0, 0.6666667, 1,
1.142567, -0.1682105, -0.3094098, 1, 0, 0.6588235, 1,
1.1454, -0.1973958, -1.227891, 1, 0, 0.654902, 1,
1.154596, -0.1193658, 2.45942, 1, 0, 0.6470588, 1,
1.155146, -0.4942324, 2.469227, 1, 0, 0.6431373, 1,
1.160605, 1.045068, -1.035187, 1, 0, 0.6352941, 1,
1.161643, 0.06951711, 1.940495, 1, 0, 0.6313726, 1,
1.174137, -1.03112, 2.341318, 1, 0, 0.6235294, 1,
1.18001, -0.9492861, 2.660804, 1, 0, 0.6196079, 1,
1.194702, 0.4322847, 0.9888698, 1, 0, 0.6117647, 1,
1.195486, -0.3439079, -0.1303373, 1, 0, 0.6078432, 1,
1.201597, -0.1657131, 1.160277, 1, 0, 0.6, 1,
1.206365, 0.2418947, 0.1149055, 1, 0, 0.5921569, 1,
1.213101, 0.708911, 0.4939691, 1, 0, 0.5882353, 1,
1.213691, -1.353878, 3.030191, 1, 0, 0.5803922, 1,
1.221865, -1.085874, 2.91841, 1, 0, 0.5764706, 1,
1.227721, -1.433239, 2.449236, 1, 0, 0.5686275, 1,
1.238019, 1.185312, 1.125584, 1, 0, 0.5647059, 1,
1.239321, 0.6512588, -1.105959, 1, 0, 0.5568628, 1,
1.240874, -0.4512232, -0.2110734, 1, 0, 0.5529412, 1,
1.257537, 0.1320826, 2.210899, 1, 0, 0.5450981, 1,
1.258384, -0.5732729, 2.516908, 1, 0, 0.5411765, 1,
1.264071, 2.54212, 0.3193374, 1, 0, 0.5333334, 1,
1.264624, -0.3179055, 3.505012, 1, 0, 0.5294118, 1,
1.274326, 0.3412202, 0.4552094, 1, 0, 0.5215687, 1,
1.277683, 0.5217464, 1.065853, 1, 0, 0.5176471, 1,
1.289901, -1.071582, 3.569296, 1, 0, 0.509804, 1,
1.296597, -0.3428853, 1.777948, 1, 0, 0.5058824, 1,
1.296825, 0.320008, 1.735192, 1, 0, 0.4980392, 1,
1.301016, 1.072912, 0.7377104, 1, 0, 0.4901961, 1,
1.301766, -0.9331842, 3.429583, 1, 0, 0.4862745, 1,
1.30215, -0.2284947, 1.312071, 1, 0, 0.4784314, 1,
1.31347, 1.536378, 0.1952165, 1, 0, 0.4745098, 1,
1.315241, -0.02916051, 1.355662, 1, 0, 0.4666667, 1,
1.336202, -1.484875, 3.192572, 1, 0, 0.4627451, 1,
1.337379, 0.1353967, 1.69821, 1, 0, 0.454902, 1,
1.348737, 0.5937387, 2.302362, 1, 0, 0.4509804, 1,
1.369343, -1.200744, 1.980136, 1, 0, 0.4431373, 1,
1.381683, 0.004151621, 0.02260381, 1, 0, 0.4392157, 1,
1.382496, -2.282382, 2.306148, 1, 0, 0.4313726, 1,
1.412163, -0.5788956, 2.482364, 1, 0, 0.427451, 1,
1.419924, -1.154181, 1.88827, 1, 0, 0.4196078, 1,
1.428062, 1.376624, -0.2378538, 1, 0, 0.4156863, 1,
1.435236, -0.09140723, 2.349454, 1, 0, 0.4078431, 1,
1.443907, 0.8622062, 0.6211112, 1, 0, 0.4039216, 1,
1.444577, -2.071401, -0.05416284, 1, 0, 0.3960784, 1,
1.454603, 0.2156908, 1.296363, 1, 0, 0.3882353, 1,
1.458673, -2.20391, 3.635185, 1, 0, 0.3843137, 1,
1.459564, -1.058973, 0.4450027, 1, 0, 0.3764706, 1,
1.462837, -1.826889, 3.411247, 1, 0, 0.372549, 1,
1.478711, 0.04229343, 1.651359, 1, 0, 0.3647059, 1,
1.488978, 0.02724667, 1.229457, 1, 0, 0.3607843, 1,
1.492298, 1.002347, 0.3950812, 1, 0, 0.3529412, 1,
1.498163, -0.2574842, 1.921368, 1, 0, 0.3490196, 1,
1.509784, -1.727669, 2.357997, 1, 0, 0.3411765, 1,
1.520587, 1.729001, 0.9247513, 1, 0, 0.3372549, 1,
1.53515, 0.06104555, 2.316635, 1, 0, 0.3294118, 1,
1.538579, 0.9129167, 0.685506, 1, 0, 0.3254902, 1,
1.548408, 0.1563, 1.892064, 1, 0, 0.3176471, 1,
1.568034, 1.275663, 0.9253213, 1, 0, 0.3137255, 1,
1.587795, -0.0443358, 1.797575, 1, 0, 0.3058824, 1,
1.590195, 1.806256, 0.3251348, 1, 0, 0.2980392, 1,
1.594108, 0.3778821, 2.086037, 1, 0, 0.2941177, 1,
1.616501, -1.054048, 2.200839, 1, 0, 0.2862745, 1,
1.620362, 0.3602649, 2.683993, 1, 0, 0.282353, 1,
1.624694, -1.936308, 2.631867, 1, 0, 0.2745098, 1,
1.626044, 0.332101, 2.839493, 1, 0, 0.2705882, 1,
1.64099, -0.5002003, 2.772352, 1, 0, 0.2627451, 1,
1.665046, 1.334444, 1.17119, 1, 0, 0.2588235, 1,
1.689241, 0.9416013, -0.8592642, 1, 0, 0.2509804, 1,
1.731539, -1.256233, 3.367951, 1, 0, 0.2470588, 1,
1.741878, 0.5914408, 0.4093612, 1, 0, 0.2392157, 1,
1.770691, -0.9999296, 3.963527, 1, 0, 0.2352941, 1,
1.774181, -0.2246913, 1.423849, 1, 0, 0.227451, 1,
1.78746, 0.9038938, 1.852888, 1, 0, 0.2235294, 1,
1.824285, -0.00955823, 1.560547, 1, 0, 0.2156863, 1,
1.834657, 0.5805526, 0.2622666, 1, 0, 0.2117647, 1,
1.835098, 0.733769, 0.2389545, 1, 0, 0.2039216, 1,
1.837156, -0.714187, 1.945807, 1, 0, 0.1960784, 1,
1.848163, -0.2892536, 0.9511559, 1, 0, 0.1921569, 1,
1.856822, -0.3896717, 0.8568188, 1, 0, 0.1843137, 1,
1.860216, -0.8080028, 3.591844, 1, 0, 0.1803922, 1,
1.875218, -0.7363082, 3.114928, 1, 0, 0.172549, 1,
1.902821, 1.430261, 0.03107857, 1, 0, 0.1686275, 1,
1.902967, -1.38244, 2.023409, 1, 0, 0.1607843, 1,
1.904477, 0.7360509, 1.257329, 1, 0, 0.1568628, 1,
1.973021, -2.413395, 2.858178, 1, 0, 0.1490196, 1,
2.002857, 0.7269215, 0.7508901, 1, 0, 0.145098, 1,
2.041389, 2.261105, 0.5901364, 1, 0, 0.1372549, 1,
2.04571, 0.8306474, 2.147564, 1, 0, 0.1333333, 1,
2.076517, 0.6217901, 1.190138, 1, 0, 0.1254902, 1,
2.094489, -0.789378, 2.248506, 1, 0, 0.1215686, 1,
2.095516, -1.143618, 3.598396, 1, 0, 0.1137255, 1,
2.133224, -0.2401495, 2.939371, 1, 0, 0.1098039, 1,
2.136453, 1.574903, 0.9624929, 1, 0, 0.1019608, 1,
2.196038, 0.7427724, 0.4192455, 1, 0, 0.09411765, 1,
2.20367, 0.9832103, 2.25741, 1, 0, 0.09019608, 1,
2.21413, 1.644465, 0.5052028, 1, 0, 0.08235294, 1,
2.251426, 0.1398225, 2.927444, 1, 0, 0.07843138, 1,
2.340915, 0.8060023, 3.182111, 1, 0, 0.07058824, 1,
2.359793, -1.010601, 1.985581, 1, 0, 0.06666667, 1,
2.415389, 0.2921977, 2.288361, 1, 0, 0.05882353, 1,
2.440143, 0.4319882, 1.183288, 1, 0, 0.05490196, 1,
2.44786, -2.607053, 2.679265, 1, 0, 0.04705882, 1,
2.450428, 1.287675, 0.5341701, 1, 0, 0.04313726, 1,
2.561313, 1.622783, 2.338407, 1, 0, 0.03529412, 1,
2.606508, -1.936613, 3.664482, 1, 0, 0.03137255, 1,
2.634981, 2.020054, 0.9269657, 1, 0, 0.02352941, 1,
2.643259, 0.0112945, 0.8404877, 1, 0, 0.01960784, 1,
2.910119, -0.4778302, 2.808923, 1, 0, 0.01176471, 1,
2.915395, -0.6094251, 1.983085, 1, 0, 0.007843138, 1
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
-0.1336499, -5.013401, -7.514689, 0, -0.5, 0.5, 0.5,
-0.1336499, -5.013401, -7.514689, 1, -0.5, 0.5, 0.5,
-0.1336499, -5.013401, -7.514689, 1, 1.5, 0.5, 0.5,
-0.1336499, -5.013401, -7.514689, 0, 1.5, 0.5, 0.5
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
-4.216321, -0.1956176, -7.514689, 0, -0.5, 0.5, 0.5,
-4.216321, -0.1956176, -7.514689, 1, -0.5, 0.5, 0.5,
-4.216321, -0.1956176, -7.514689, 1, 1.5, 0.5, 0.5,
-4.216321, -0.1956176, -7.514689, 0, 1.5, 0.5, 0.5
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
-4.216321, -5.013401, 0.1294324, 0, -0.5, 0.5, 0.5,
-4.216321, -5.013401, 0.1294324, 1, -0.5, 0.5, 0.5,
-4.216321, -5.013401, 0.1294324, 1, 1.5, 0.5, 0.5,
-4.216321, -5.013401, 0.1294324, 0, 1.5, 0.5, 0.5
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
-3, -3.901605, -5.750661,
2, -3.901605, -5.750661,
-3, -3.901605, -5.750661,
-3, -4.086904, -6.044666,
-2, -3.901605, -5.750661,
-2, -4.086904, -6.044666,
-1, -3.901605, -5.750661,
-1, -4.086904, -6.044666,
0, -3.901605, -5.750661,
0, -4.086904, -6.044666,
1, -3.901605, -5.750661,
1, -4.086904, -6.044666,
2, -3.901605, -5.750661,
2, -4.086904, -6.044666
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
-3, -4.457503, -6.632675, 0, -0.5, 0.5, 0.5,
-3, -4.457503, -6.632675, 1, -0.5, 0.5, 0.5,
-3, -4.457503, -6.632675, 1, 1.5, 0.5, 0.5,
-3, -4.457503, -6.632675, 0, 1.5, 0.5, 0.5,
-2, -4.457503, -6.632675, 0, -0.5, 0.5, 0.5,
-2, -4.457503, -6.632675, 1, -0.5, 0.5, 0.5,
-2, -4.457503, -6.632675, 1, 1.5, 0.5, 0.5,
-2, -4.457503, -6.632675, 0, 1.5, 0.5, 0.5,
-1, -4.457503, -6.632675, 0, -0.5, 0.5, 0.5,
-1, -4.457503, -6.632675, 1, -0.5, 0.5, 0.5,
-1, -4.457503, -6.632675, 1, 1.5, 0.5, 0.5,
-1, -4.457503, -6.632675, 0, 1.5, 0.5, 0.5,
0, -4.457503, -6.632675, 0, -0.5, 0.5, 0.5,
0, -4.457503, -6.632675, 1, -0.5, 0.5, 0.5,
0, -4.457503, -6.632675, 1, 1.5, 0.5, 0.5,
0, -4.457503, -6.632675, 0, 1.5, 0.5, 0.5,
1, -4.457503, -6.632675, 0, -0.5, 0.5, 0.5,
1, -4.457503, -6.632675, 1, -0.5, 0.5, 0.5,
1, -4.457503, -6.632675, 1, 1.5, 0.5, 0.5,
1, -4.457503, -6.632675, 0, 1.5, 0.5, 0.5,
2, -4.457503, -6.632675, 0, -0.5, 0.5, 0.5,
2, -4.457503, -6.632675, 1, -0.5, 0.5, 0.5,
2, -4.457503, -6.632675, 1, 1.5, 0.5, 0.5,
2, -4.457503, -6.632675, 0, 1.5, 0.5, 0.5
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
-3.274166, -2, -5.750661,
-3.274166, 2, -5.750661,
-3.274166, -2, -5.750661,
-3.431192, -2, -6.044666,
-3.274166, 0, -5.750661,
-3.431192, 0, -6.044666,
-3.274166, 2, -5.750661,
-3.431192, 2, -6.044666
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
-3.745244, -2, -6.632675, 0, -0.5, 0.5, 0.5,
-3.745244, -2, -6.632675, 1, -0.5, 0.5, 0.5,
-3.745244, -2, -6.632675, 1, 1.5, 0.5, 0.5,
-3.745244, -2, -6.632675, 0, 1.5, 0.5, 0.5,
-3.745244, 0, -6.632675, 0, -0.5, 0.5, 0.5,
-3.745244, 0, -6.632675, 1, -0.5, 0.5, 0.5,
-3.745244, 0, -6.632675, 1, 1.5, 0.5, 0.5,
-3.745244, 0, -6.632675, 0, 1.5, 0.5, 0.5,
-3.745244, 2, -6.632675, 0, -0.5, 0.5, 0.5,
-3.745244, 2, -6.632675, 1, -0.5, 0.5, 0.5,
-3.745244, 2, -6.632675, 1, 1.5, 0.5, 0.5,
-3.745244, 2, -6.632675, 0, 1.5, 0.5, 0.5
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
-3.274166, -3.901605, -4,
-3.274166, -3.901605, 4,
-3.274166, -3.901605, -4,
-3.431192, -4.086904, -4,
-3.274166, -3.901605, -2,
-3.431192, -4.086904, -2,
-3.274166, -3.901605, 0,
-3.431192, -4.086904, 0,
-3.274166, -3.901605, 2,
-3.431192, -4.086904, 2,
-3.274166, -3.901605, 4,
-3.431192, -4.086904, 4
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
-3.745244, -4.457503, -4, 0, -0.5, 0.5, 0.5,
-3.745244, -4.457503, -4, 1, -0.5, 0.5, 0.5,
-3.745244, -4.457503, -4, 1, 1.5, 0.5, 0.5,
-3.745244, -4.457503, -4, 0, 1.5, 0.5, 0.5,
-3.745244, -4.457503, -2, 0, -0.5, 0.5, 0.5,
-3.745244, -4.457503, -2, 1, -0.5, 0.5, 0.5,
-3.745244, -4.457503, -2, 1, 1.5, 0.5, 0.5,
-3.745244, -4.457503, -2, 0, 1.5, 0.5, 0.5,
-3.745244, -4.457503, 0, 0, -0.5, 0.5, 0.5,
-3.745244, -4.457503, 0, 1, -0.5, 0.5, 0.5,
-3.745244, -4.457503, 0, 1, 1.5, 0.5, 0.5,
-3.745244, -4.457503, 0, 0, 1.5, 0.5, 0.5,
-3.745244, -4.457503, 2, 0, -0.5, 0.5, 0.5,
-3.745244, -4.457503, 2, 1, -0.5, 0.5, 0.5,
-3.745244, -4.457503, 2, 1, 1.5, 0.5, 0.5,
-3.745244, -4.457503, 2, 0, 1.5, 0.5, 0.5,
-3.745244, -4.457503, 4, 0, -0.5, 0.5, 0.5,
-3.745244, -4.457503, 4, 1, -0.5, 0.5, 0.5,
-3.745244, -4.457503, 4, 1, 1.5, 0.5, 0.5,
-3.745244, -4.457503, 4, 0, 1.5, 0.5, 0.5
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
-3.274166, -3.901605, -5.750661,
-3.274166, 3.51037, -5.750661,
-3.274166, -3.901605, 6.009526,
-3.274166, 3.51037, 6.009526,
-3.274166, -3.901605, -5.750661,
-3.274166, -3.901605, 6.009526,
-3.274166, 3.51037, -5.750661,
-3.274166, 3.51037, 6.009526,
-3.274166, -3.901605, -5.750661,
3.006866, -3.901605, -5.750661,
-3.274166, -3.901605, 6.009526,
3.006866, -3.901605, 6.009526,
-3.274166, 3.51037, -5.750661,
3.006866, 3.51037, -5.750661,
-3.274166, 3.51037, 6.009526,
3.006866, 3.51037, 6.009526,
3.006866, -3.901605, -5.750661,
3.006866, 3.51037, -5.750661,
3.006866, -3.901605, 6.009526,
3.006866, 3.51037, 6.009526,
3.006866, -3.901605, -5.750661,
3.006866, -3.901605, 6.009526,
3.006866, 3.51037, -5.750661,
3.006866, 3.51037, 6.009526
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
var radius = 8.145449;
var distance = 36.24002;
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
mvMatrix.translate( 0.1336499, 0.1956176, -0.1294324 );
mvMatrix.scale( 1.402161, 1.188215, 0.7488842 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.24002);
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
flutolanil<-read.table("flutolanil.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flutolanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'flutolanil' not found
```

```r
y<-flutolanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'flutolanil' not found
```

```r
z<-flutolanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'flutolanil' not found
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
-3.182695, 0.005288505, -2.554908, 0, 0, 1, 1, 1,
-3.023767, 0.7740663, -2.283995, 1, 0, 0, 1, 1,
-2.71953, -1.486967, -1.709356, 1, 0, 0, 1, 1,
-2.712455, 0.5566854, -3.055079, 1, 0, 0, 1, 1,
-2.596096, 0.4565549, -2.09739, 1, 0, 0, 1, 1,
-2.575288, -0.04316848, -2.766957, 1, 0, 0, 1, 1,
-2.473362, 0.6477889, -0.7289689, 0, 0, 0, 1, 1,
-2.420665, -0.6407409, -1.877599, 0, 0, 0, 1, 1,
-2.334092, 0.1283375, -0.07130109, 0, 0, 0, 1, 1,
-2.316559, -0.6890089, -4.176261, 0, 0, 0, 1, 1,
-2.286185, 0.5160739, -1.192945, 0, 0, 0, 1, 1,
-2.282487, -1.141492, -2.232108, 0, 0, 0, 1, 1,
-2.263312, -1.2752, -1.11057, 0, 0, 0, 1, 1,
-2.261835, -1.457289, -0.9968255, 1, 1, 1, 1, 1,
-2.259344, -0.8021089, -1.574102, 1, 1, 1, 1, 1,
-2.251286, 0.3083704, -2.913299, 1, 1, 1, 1, 1,
-2.241107, -2.785978, -2.131573, 1, 1, 1, 1, 1,
-2.224124, 0.8732894, -1.550806, 1, 1, 1, 1, 1,
-2.221051, 0.5133021, -0.7001792, 1, 1, 1, 1, 1,
-2.174397, 1.467403, -2.086806, 1, 1, 1, 1, 1,
-2.171071, -0.0812533, -1.420462, 1, 1, 1, 1, 1,
-2.140151, 1.892554, 0.1029973, 1, 1, 1, 1, 1,
-2.085264, 1.622975, -2.631102, 1, 1, 1, 1, 1,
-2.074928, -1.101992, -2.651417, 1, 1, 1, 1, 1,
-2.054672, 0.1465549, -0.1493113, 1, 1, 1, 1, 1,
-2.039909, 1.648211, 0.1143102, 1, 1, 1, 1, 1,
-2.007704, -1.354547, -2.030928, 1, 1, 1, 1, 1,
-2.004055, -0.8700081, -1.432601, 1, 1, 1, 1, 1,
-2.000486, -0.4927558, -0.4105702, 0, 0, 1, 1, 1,
-1.999884, -1.570509, -0.716751, 1, 0, 0, 1, 1,
-1.985949, 0.1676553, -1.967597, 1, 0, 0, 1, 1,
-1.946642, -0.496204, -1.517084, 1, 0, 0, 1, 1,
-1.909086, -0.1899006, -2.572153, 1, 0, 0, 1, 1,
-1.883662, -0.5886503, -1.89062, 1, 0, 0, 1, 1,
-1.870674, -2.987735, -4.485991, 0, 0, 0, 1, 1,
-1.852466, -0.02505324, -2.492478, 0, 0, 0, 1, 1,
-1.847953, -1.464285, -1.880759, 0, 0, 0, 1, 1,
-1.840883, -1.939902, -3.147877, 0, 0, 0, 1, 1,
-1.839747, 1.134833, -2.032141, 0, 0, 0, 1, 1,
-1.828392, 0.04932911, 0.02226719, 0, 0, 0, 1, 1,
-1.827031, -0.9677718, -2.823538, 0, 0, 0, 1, 1,
-1.808832, 0.4140098, -1.277091, 1, 1, 1, 1, 1,
-1.797864, -1.089259, -0.9159606, 1, 1, 1, 1, 1,
-1.772104, -1.635209, -3.404869, 1, 1, 1, 1, 1,
-1.771998, -0.8069544, -0.3514529, 1, 1, 1, 1, 1,
-1.769265, -0.6386731, -2.959269, 1, 1, 1, 1, 1,
-1.763951, 1.435783, -1.618422, 1, 1, 1, 1, 1,
-1.758575, 0.2331751, -1.081601, 1, 1, 1, 1, 1,
-1.754904, 0.2461647, -2.386814, 1, 1, 1, 1, 1,
-1.730312, 0.6162694, -0.9568791, 1, 1, 1, 1, 1,
-1.705153, -1.17203, -1.115564, 1, 1, 1, 1, 1,
-1.704592, -1.59976, -1.195362, 1, 1, 1, 1, 1,
-1.674617, 0.5911965, -1.371414, 1, 1, 1, 1, 1,
-1.653508, 2.151628, -0.9372204, 1, 1, 1, 1, 1,
-1.642622, -0.6673433, -0.9777847, 1, 1, 1, 1, 1,
-1.634432, -1.388958, -1.294305, 1, 1, 1, 1, 1,
-1.625938, -1.464413, -1.831319, 0, 0, 1, 1, 1,
-1.620908, 1.585501, -0.01113331, 1, 0, 0, 1, 1,
-1.616478, -2.069148, -1.182615, 1, 0, 0, 1, 1,
-1.612892, -1.015265, -1.592055, 1, 0, 0, 1, 1,
-1.610609, 0.8333488, -0.3401271, 1, 0, 0, 1, 1,
-1.596064, -0.004032343, -1.726628, 1, 0, 0, 1, 1,
-1.58675, 1.229068, 0.0706737, 0, 0, 0, 1, 1,
-1.578164, 0.009610909, -1.530533, 0, 0, 0, 1, 1,
-1.564298, 1.321815, -0.7193346, 0, 0, 0, 1, 1,
-1.560361, -2.04615, -2.012113, 0, 0, 0, 1, 1,
-1.555861, -0.2441695, -2.171491, 0, 0, 0, 1, 1,
-1.548197, 1.785673, 0.67066, 0, 0, 0, 1, 1,
-1.542913, -1.245519, -0.3136438, 0, 0, 0, 1, 1,
-1.538148, -0.97725, -1.330625, 1, 1, 1, 1, 1,
-1.537845, -1.060503, -2.108127, 1, 1, 1, 1, 1,
-1.528045, 0.5620056, -2.810199, 1, 1, 1, 1, 1,
-1.486588, 0.8772223, -0.8298398, 1, 1, 1, 1, 1,
-1.481889, -2.022951, -3.340354, 1, 1, 1, 1, 1,
-1.474946, -1.497068, -2.43678, 1, 1, 1, 1, 1,
-1.461921, 0.5588288, -1.424581, 1, 1, 1, 1, 1,
-1.451185, -1.027069, -3.188935, 1, 1, 1, 1, 1,
-1.444576, 0.33619, -2.22306, 1, 1, 1, 1, 1,
-1.435359, 1.599519, 0.6458844, 1, 1, 1, 1, 1,
-1.424805, -0.4378082, -1.904279, 1, 1, 1, 1, 1,
-1.414261, 1.304024, -0.2571728, 1, 1, 1, 1, 1,
-1.413072, 0.8904479, -0.3703499, 1, 1, 1, 1, 1,
-1.408425, 0.6234451, -2.825231, 1, 1, 1, 1, 1,
-1.376524, 1.395357, -0.7551184, 1, 1, 1, 1, 1,
-1.375444, 0.2022483, -2.450055, 0, 0, 1, 1, 1,
-1.372032, -0.7456172, -0.4963005, 1, 0, 0, 1, 1,
-1.369599, -1.300139, -1.495575, 1, 0, 0, 1, 1,
-1.363489, -0.5383976, -4.182697, 1, 0, 0, 1, 1,
-1.356696, -0.2842343, -1.985699, 1, 0, 0, 1, 1,
-1.354885, 0.6704448, -0.4980755, 1, 0, 0, 1, 1,
-1.337095, -0.4021584, -2.647257, 0, 0, 0, 1, 1,
-1.334929, 0.7632252, -1.262242, 0, 0, 0, 1, 1,
-1.332347, -2.461946, -3.794399, 0, 0, 0, 1, 1,
-1.312356, 2.210824, -0.8990267, 0, 0, 0, 1, 1,
-1.304844, -0.4657146, -2.484169, 0, 0, 0, 1, 1,
-1.288157, -0.164972, -0.7125189, 0, 0, 0, 1, 1,
-1.286464, 1.50355, 0.7930613, 0, 0, 0, 1, 1,
-1.273645, -0.4257717, -4.194398, 1, 1, 1, 1, 1,
-1.268077, 2.278111, -0.5269807, 1, 1, 1, 1, 1,
-1.267232, 2.03311, -0.6963062, 1, 1, 1, 1, 1,
-1.266545, -0.7124993, -2.244773, 1, 1, 1, 1, 1,
-1.260182, -1.451507, -1.717254, 1, 1, 1, 1, 1,
-1.259663, -0.3194483, -2.204614, 1, 1, 1, 1, 1,
-1.259189, -0.174041, -1.594146, 1, 1, 1, 1, 1,
-1.255353, -1.40833, -2.950956, 1, 1, 1, 1, 1,
-1.252027, -2.510712, -3.51655, 1, 1, 1, 1, 1,
-1.251689, -0.3336368, -1.893236, 1, 1, 1, 1, 1,
-1.231403, -0.7454306, -1.408467, 1, 1, 1, 1, 1,
-1.230477, 0.05911796, -1.715488, 1, 1, 1, 1, 1,
-1.229208, 0.1790808, -2.541818, 1, 1, 1, 1, 1,
-1.221635, 1.065286, -1.175531, 1, 1, 1, 1, 1,
-1.221422, 0.8544186, -0.4369645, 1, 1, 1, 1, 1,
-1.214338, 1.088303, -1.834499, 0, 0, 1, 1, 1,
-1.211266, 0.1724023, -0.843502, 1, 0, 0, 1, 1,
-1.211262, -0.2678114, -2.093835, 1, 0, 0, 1, 1,
-1.211163, 1.349319, -3.420705, 1, 0, 0, 1, 1,
-1.199987, -0.5674259, -1.489334, 1, 0, 0, 1, 1,
-1.196492, -1.303739, -4.095491, 1, 0, 0, 1, 1,
-1.196019, 1.409649, -1.799062, 0, 0, 0, 1, 1,
-1.187435, 0.4295546, -1.432638, 0, 0, 0, 1, 1,
-1.186409, 0.8773415, 0.3847062, 0, 0, 0, 1, 1,
-1.179849, 0.4453469, -2.432823, 0, 0, 0, 1, 1,
-1.166492, -0.411882, -1.350119, 0, 0, 0, 1, 1,
-1.158798, -1.184257, -2.694204, 0, 0, 0, 1, 1,
-1.150706, 1.776724, -0.882609, 0, 0, 0, 1, 1,
-1.14861, -1.052251, -3.040963, 1, 1, 1, 1, 1,
-1.14804, 1.572365, -1.05163, 1, 1, 1, 1, 1,
-1.139723, 1.394276, -1.682156, 1, 1, 1, 1, 1,
-1.137501, -1.1869, -1.853378, 1, 1, 1, 1, 1,
-1.137168, 0.2393415, -2.062938, 1, 1, 1, 1, 1,
-1.133753, -0.8233839, -0.9771796, 1, 1, 1, 1, 1,
-1.133357, 2.040819, 0.9353624, 1, 1, 1, 1, 1,
-1.13162, 0.7673082, -2.415082, 1, 1, 1, 1, 1,
-1.12719, -0.7717943, -1.460863, 1, 1, 1, 1, 1,
-1.124231, 0.2767052, -0.2140506, 1, 1, 1, 1, 1,
-1.114198, 0.6053841, -1.639279, 1, 1, 1, 1, 1,
-1.114167, 0.7957543, -0.9107944, 1, 1, 1, 1, 1,
-1.10194, 1.850851, -0.4194618, 1, 1, 1, 1, 1,
-1.101316, -0.7330494, -0.5915374, 1, 1, 1, 1, 1,
-1.101056, -0.1809849, -2.080133, 1, 1, 1, 1, 1,
-1.096375, 1.0179, -1.323606, 0, 0, 1, 1, 1,
-1.089731, -1.325994, -3.548608, 1, 0, 0, 1, 1,
-1.088546, -1.04387, -2.14136, 1, 0, 0, 1, 1,
-1.077523, 0.7351637, -1.797654, 1, 0, 0, 1, 1,
-1.076807, 0.5652906, -2.5204, 1, 0, 0, 1, 1,
-1.067037, 1.005485, -2.508756, 1, 0, 0, 1, 1,
-1.05829, 1.20484, 0.8029637, 0, 0, 0, 1, 1,
-1.056368, -0.4777075, -2.522392, 0, 0, 0, 1, 1,
-1.054762, -0.08915231, -2.336404, 0, 0, 0, 1, 1,
-1.048813, 2.081681, 0.8389406, 0, 0, 0, 1, 1,
-1.039812, -0.07149737, -1.638788, 0, 0, 0, 1, 1,
-1.035881, 0.9956515, -1.347362, 0, 0, 0, 1, 1,
-1.035828, 0.8855218, -1.573292, 0, 0, 0, 1, 1,
-1.03463, -0.3966647, -1.441384, 1, 1, 1, 1, 1,
-1.027776, 0.5737084, 1.277519, 1, 1, 1, 1, 1,
-1.025003, 0.2996334, -0.4829255, 1, 1, 1, 1, 1,
-1.013122, 0.005506699, -0.8542126, 1, 1, 1, 1, 1,
-1.010343, 1.696252, 0.004816174, 1, 1, 1, 1, 1,
-1.010326, 0.1628379, -4.130318, 1, 1, 1, 1, 1,
-1.009709, -1.562957, -1.388391, 1, 1, 1, 1, 1,
-0.9841121, -0.1818208, -2.488208, 1, 1, 1, 1, 1,
-0.9834457, 0.071202, -0.8614767, 1, 1, 1, 1, 1,
-0.982699, -1.925484, -0.9219796, 1, 1, 1, 1, 1,
-0.9785146, 1.656383, -0.2557596, 1, 1, 1, 1, 1,
-0.9758793, 0.992974, -2.374089, 1, 1, 1, 1, 1,
-0.9745869, 2.853241, 2.098278, 1, 1, 1, 1, 1,
-0.9744484, 0.1303654, -0.8188618, 1, 1, 1, 1, 1,
-0.971824, -1.211384, -1.696146, 1, 1, 1, 1, 1,
-0.9712406, 1.084253, -1.667247, 0, 0, 1, 1, 1,
-0.9670738, -1.455845, -4.048993, 1, 0, 0, 1, 1,
-0.9654754, -0.3551362, -1.241663, 1, 0, 0, 1, 1,
-0.9647102, 0.3883798, -1.505129, 1, 0, 0, 1, 1,
-0.9613515, -0.7692232, -1.391682, 1, 0, 0, 1, 1,
-0.9544908, -1.324673, -3.018305, 1, 0, 0, 1, 1,
-0.9508783, -1.51068, -4.054746, 0, 0, 0, 1, 1,
-0.9457668, -0.5067196, -2.185859, 0, 0, 0, 1, 1,
-0.9424468, 1.138613, -1.8346, 0, 0, 0, 1, 1,
-0.9412889, -0.1944173, -3.109339, 0, 0, 0, 1, 1,
-0.9400787, -0.1219886, -0.2119525, 0, 0, 0, 1, 1,
-0.9377161, 0.4448021, -0.2422723, 0, 0, 0, 1, 1,
-0.9336833, 3.402428, -0.4619407, 0, 0, 0, 1, 1,
-0.9323183, -1.790525, -2.715343, 1, 1, 1, 1, 1,
-0.9319426, -0.2137573, -2.470143, 1, 1, 1, 1, 1,
-0.9273552, -0.2591884, -3.273347, 1, 1, 1, 1, 1,
-0.924021, -1.59342, -2.82195, 1, 1, 1, 1, 1,
-0.922658, -1.401441, -2.832371, 1, 1, 1, 1, 1,
-0.9207845, 0.02776266, -2.303195, 1, 1, 1, 1, 1,
-0.9203013, -1.449522, -2.232287, 1, 1, 1, 1, 1,
-0.9193445, 2.196216, -1.625108, 1, 1, 1, 1, 1,
-0.916108, -1.267549, -3.251283, 1, 1, 1, 1, 1,
-0.9086665, 1.30676, -1.27173, 1, 1, 1, 1, 1,
-0.9076486, -0.1065398, -2.345619, 1, 1, 1, 1, 1,
-0.9058546, -1.134218, -2.607324, 1, 1, 1, 1, 1,
-0.9032752, 0.5315166, -2.613937, 1, 1, 1, 1, 1,
-0.9023263, -1.224123, -3.156041, 1, 1, 1, 1, 1,
-0.9016586, 0.9033623, -0.05989397, 1, 1, 1, 1, 1,
-0.8965873, -0.7332038, -2.358947, 0, 0, 1, 1, 1,
-0.8910863, -1.014011, -2.746834, 1, 0, 0, 1, 1,
-0.8881486, -1.151102, -1.661021, 1, 0, 0, 1, 1,
-0.8857406, -0.04097089, -2.075979, 1, 0, 0, 1, 1,
-0.8831614, -1.741974, -3.409566, 1, 0, 0, 1, 1,
-0.8701704, -0.445022, -3.038953, 1, 0, 0, 1, 1,
-0.8651078, 0.7222482, -1.106881, 0, 0, 0, 1, 1,
-0.863301, 1.425282, -2.176381, 0, 0, 0, 1, 1,
-0.8596272, 0.4412257, -0.5721841, 0, 0, 0, 1, 1,
-0.8584607, -0.627248, -2.770971, 0, 0, 0, 1, 1,
-0.8527185, -0.4379777, -4.281004, 0, 0, 0, 1, 1,
-0.8369629, 1.731199, 0.2979199, 0, 0, 0, 1, 1,
-0.8323797, -1.145435, -1.270471, 0, 0, 0, 1, 1,
-0.8298832, 1.362838, 0.2115772, 1, 1, 1, 1, 1,
-0.8296084, 0.4162228, -2.222836, 1, 1, 1, 1, 1,
-0.8294137, -0.7338088, -1.551084, 1, 1, 1, 1, 1,
-0.8292221, 0.269797, -1.080067, 1, 1, 1, 1, 1,
-0.8254374, 1.07224, -2.77591, 1, 1, 1, 1, 1,
-0.8252649, -1.422037, -1.927624, 1, 1, 1, 1, 1,
-0.8245155, -1.089678, -1.962638, 1, 1, 1, 1, 1,
-0.8174891, 0.6089201, -0.2981411, 1, 1, 1, 1, 1,
-0.8167529, -1.290254, -2.008821, 1, 1, 1, 1, 1,
-0.8149445, 0.02563413, -1.548766, 1, 1, 1, 1, 1,
-0.8138957, -0.1495139, -0.9130269, 1, 1, 1, 1, 1,
-0.8108204, 0.1664459, -1.387498, 1, 1, 1, 1, 1,
-0.7980067, -0.7111729, -2.676795, 1, 1, 1, 1, 1,
-0.7958061, -0.2164954, -3.683944, 1, 1, 1, 1, 1,
-0.7947667, -0.2693959, -1.136159, 1, 1, 1, 1, 1,
-0.7938763, 0.02942505, -1.059886, 0, 0, 1, 1, 1,
-0.7928032, -1.574172, -2.767769, 1, 0, 0, 1, 1,
-0.7926349, -1.46376, -2.987806, 1, 0, 0, 1, 1,
-0.790246, -1.472172, -1.928231, 1, 0, 0, 1, 1,
-0.7888725, 1.705105, 0.633319, 1, 0, 0, 1, 1,
-0.7832316, -0.3375669, -3.004202, 1, 0, 0, 1, 1,
-0.7828491, -0.4975601, -0.9426793, 0, 0, 0, 1, 1,
-0.7769152, 0.02340583, -2.361133, 0, 0, 0, 1, 1,
-0.7708911, 0.3880152, -0.6103052, 0, 0, 0, 1, 1,
-0.7645083, 0.5283509, -0.3101657, 0, 0, 0, 1, 1,
-0.7589169, -0.3062903, -1.154092, 0, 0, 0, 1, 1,
-0.7578039, -0.6893408, -2.462107, 0, 0, 0, 1, 1,
-0.7485188, 0.6037126, -1.221231, 0, 0, 0, 1, 1,
-0.7464551, -0.8510162, -2.927089, 1, 1, 1, 1, 1,
-0.7442415, 0.7526556, -0.4154494, 1, 1, 1, 1, 1,
-0.7409241, 1.936729, -0.1426214, 1, 1, 1, 1, 1,
-0.7373957, 0.5206818, 0.811602, 1, 1, 1, 1, 1,
-0.7337526, 0.7643969, 0.4237226, 1, 1, 1, 1, 1,
-0.7325317, -0.1473527, -3.19893, 1, 1, 1, 1, 1,
-0.7324759, -0.9094436, -2.727458, 1, 1, 1, 1, 1,
-0.7280731, 1.167843, -0.6842219, 1, 1, 1, 1, 1,
-0.7141885, 0.2022648, -1.428067, 1, 1, 1, 1, 1,
-0.7072487, 1.236144, 0.6985129, 1, 1, 1, 1, 1,
-0.7062691, 0.4458811, -1.211141, 1, 1, 1, 1, 1,
-0.7051551, 1.590554, -2.119864, 1, 1, 1, 1, 1,
-0.7028804, -0.4848851, -2.759625, 1, 1, 1, 1, 1,
-0.694669, 0.1412331, -3.232856, 1, 1, 1, 1, 1,
-0.6921735, -0.1244925, -2.08409, 1, 1, 1, 1, 1,
-0.6791039, -1.523892, -3.083549, 0, 0, 1, 1, 1,
-0.6788398, -0.2510352, -1.24463, 1, 0, 0, 1, 1,
-0.6781794, -1.123101, -1.309215, 1, 0, 0, 1, 1,
-0.6723493, -1.010777, -3.247727, 1, 0, 0, 1, 1,
-0.668913, -0.4636056, -2.12842, 1, 0, 0, 1, 1,
-0.6686255, -0.4174526, -3.082669, 1, 0, 0, 1, 1,
-0.6624198, -0.5395325, -2.630788, 0, 0, 0, 1, 1,
-0.6589928, 1.13588, 0.5405722, 0, 0, 0, 1, 1,
-0.6543729, 0.1106639, -0.647783, 0, 0, 0, 1, 1,
-0.6494276, -1.268207, -3.694483, 0, 0, 0, 1, 1,
-0.6478961, 0.1436472, -1.330427, 0, 0, 0, 1, 1,
-0.646798, 0.07987393, -1.857172, 0, 0, 0, 1, 1,
-0.6427984, 1.453912, -0.6066859, 0, 0, 0, 1, 1,
-0.6381342, -0.5166825, -3.010762, 1, 1, 1, 1, 1,
-0.636592, -0.3371991, -3.065006, 1, 1, 1, 1, 1,
-0.6360376, 1.714958, -1.136199, 1, 1, 1, 1, 1,
-0.6350724, -0.4580964, -3.239666, 1, 1, 1, 1, 1,
-0.6329612, 0.2540633, -1.222138, 1, 1, 1, 1, 1,
-0.6298782, -0.879266, -1.944036, 1, 1, 1, 1, 1,
-0.6173436, 0.5585969, -2.304934, 1, 1, 1, 1, 1,
-0.6166629, -0.09668602, -0.4331469, 1, 1, 1, 1, 1,
-0.6157867, -0.5898478, -3.679143, 1, 1, 1, 1, 1,
-0.6153595, 0.1601361, -1.59269, 1, 1, 1, 1, 1,
-0.605169, 0.8316239, -0.4255732, 1, 1, 1, 1, 1,
-0.6046164, -1.556163, -2.698445, 1, 1, 1, 1, 1,
-0.6023899, 0.2284067, -1.268273, 1, 1, 1, 1, 1,
-0.6010009, 0.504398, -0.1629432, 1, 1, 1, 1, 1,
-0.5988319, -0.09299242, -2.198351, 1, 1, 1, 1, 1,
-0.5943216, -0.3430587, -2.682059, 0, 0, 1, 1, 1,
-0.5901724, 0.4341532, -0.7093223, 1, 0, 0, 1, 1,
-0.5838893, -0.6738817, -2.325867, 1, 0, 0, 1, 1,
-0.5828304, 0.9357872, -0.8515788, 1, 0, 0, 1, 1,
-0.582419, -1.804971, -2.24015, 1, 0, 0, 1, 1,
-0.5820627, -0.4731455, -2.886731, 1, 0, 0, 1, 1,
-0.5803733, -0.3839516, -1.221613, 0, 0, 0, 1, 1,
-0.5752443, -0.5645531, -2.609483, 0, 0, 0, 1, 1,
-0.5740525, -1.762309, 0.0933895, 0, 0, 0, 1, 1,
-0.5729728, 0.491656, -0.1905881, 0, 0, 0, 1, 1,
-0.5726216, -0.5438179, -1.492444, 0, 0, 0, 1, 1,
-0.5719595, -0.6172959, -0.9709644, 0, 0, 0, 1, 1,
-0.5715231, -0.1398021, -2.611443, 0, 0, 0, 1, 1,
-0.5672793, -0.01079241, -0.8969403, 1, 1, 1, 1, 1,
-0.5663544, 1.011086, -0.593141, 1, 1, 1, 1, 1,
-0.5653975, -0.04565929, -0.1864429, 1, 1, 1, 1, 1,
-0.5621496, 1.297061, -0.7136914, 1, 1, 1, 1, 1,
-0.5609093, 2.113412, -0.8151014, 1, 1, 1, 1, 1,
-0.5603624, 0.2251526, -1.940064, 1, 1, 1, 1, 1,
-0.5555515, -0.3924332, -2.001753, 1, 1, 1, 1, 1,
-0.5548677, 0.3855804, -0.3479556, 1, 1, 1, 1, 1,
-0.5537862, -0.8144405, -0.2888883, 1, 1, 1, 1, 1,
-0.5529002, -0.8769124, -2.494289, 1, 1, 1, 1, 1,
-0.546194, -0.7024413, -1.004171, 1, 1, 1, 1, 1,
-0.5454834, 0.8072041, -1.570349, 1, 1, 1, 1, 1,
-0.5404897, 1.707482, -1.447649, 1, 1, 1, 1, 1,
-0.5383173, -0.02668312, -0.6588579, 1, 1, 1, 1, 1,
-0.5377828, -0.2283155, 1.222113, 1, 1, 1, 1, 1,
-0.5354608, -0.933095, -1.391378, 0, 0, 1, 1, 1,
-0.5346785, 0.4991055, -0.7020578, 1, 0, 0, 1, 1,
-0.534201, 0.4276285, -1.533164, 1, 0, 0, 1, 1,
-0.5305257, 0.2069276, -0.2920911, 1, 0, 0, 1, 1,
-0.5304248, -0.4599213, -3.713241, 1, 0, 0, 1, 1,
-0.5274493, -0.8677049, -2.006666, 1, 0, 0, 1, 1,
-0.5239564, -1.088929, -2.87569, 0, 0, 0, 1, 1,
-0.5130136, 1.163289, -1.19637, 0, 0, 0, 1, 1,
-0.5105969, -0.2520228, -3.551878, 0, 0, 0, 1, 1,
-0.5102493, 0.9512504, -0.3688878, 0, 0, 0, 1, 1,
-0.5101464, 0.07476812, -1.601985, 0, 0, 0, 1, 1,
-0.5088909, -0.8461123, -3.133199, 0, 0, 0, 1, 1,
-0.5083152, -1.781836, -3.344251, 0, 0, 0, 1, 1,
-0.5080581, -1.641999, -2.471968, 1, 1, 1, 1, 1,
-0.5015852, -1.379141, -1.292015, 1, 1, 1, 1, 1,
-0.4999481, 0.3433553, -2.140995, 1, 1, 1, 1, 1,
-0.4803597, 0.7018716, -1.355034, 1, 1, 1, 1, 1,
-0.4802276, 0.2121431, -1.219101, 1, 1, 1, 1, 1,
-0.4790195, 0.142174, -0.4457753, 1, 1, 1, 1, 1,
-0.472123, 0.06568342, -2.069452, 1, 1, 1, 1, 1,
-0.4699075, 0.5805178, -0.6955848, 1, 1, 1, 1, 1,
-0.4680764, -0.0008196972, -1.383406, 1, 1, 1, 1, 1,
-0.4675673, 0.7098845, -0.9921474, 1, 1, 1, 1, 1,
-0.4641683, -0.08702017, -2.814119, 1, 1, 1, 1, 1,
-0.4573905, -0.1305489, -3.058923, 1, 1, 1, 1, 1,
-0.4570207, -0.7930105, -1.17335, 1, 1, 1, 1, 1,
-0.4551331, 1.076028, -0.7553763, 1, 1, 1, 1, 1,
-0.4546401, -0.7424135, -2.344889, 1, 1, 1, 1, 1,
-0.4503213, -0.1999141, -1.729576, 0, 0, 1, 1, 1,
-0.4496627, 1.134765, 0.3639086, 1, 0, 0, 1, 1,
-0.4440126, -0.06644537, -4.330756, 1, 0, 0, 1, 1,
-0.4431354, -3.225074, -1.086008, 1, 0, 0, 1, 1,
-0.4413903, -0.2689813, -1.807592, 1, 0, 0, 1, 1,
-0.4341759, -0.8266861, -1.454309, 1, 0, 0, 1, 1,
-0.4299954, -0.005753805, -0.8285664, 0, 0, 0, 1, 1,
-0.4285524, -0.256687, -3.285524, 0, 0, 0, 1, 1,
-0.4280429, 0.9327838, -0.03719622, 0, 0, 0, 1, 1,
-0.417634, 0.2426423, -0.5401639, 0, 0, 0, 1, 1,
-0.4139287, -0.6372424, -1.92249, 0, 0, 0, 1, 1,
-0.4113831, 0.04509776, -2.256835, 0, 0, 0, 1, 1,
-0.4066722, 0.5904269, 0.8940595, 0, 0, 0, 1, 1,
-0.4056744, 0.1281753, -1.280815, 1, 1, 1, 1, 1,
-0.4023361, 2.233096, -1.551515, 1, 1, 1, 1, 1,
-0.4016387, -1.568808, -4.012204, 1, 1, 1, 1, 1,
-0.3975081, 0.4353667, 0.0330472, 1, 1, 1, 1, 1,
-0.3964753, 0.2061624, -3.135543, 1, 1, 1, 1, 1,
-0.3951902, 0.2724474, -0.7521626, 1, 1, 1, 1, 1,
-0.39431, -0.3698725, -4.136643, 1, 1, 1, 1, 1,
-0.394113, 0.8040069, -0.6224281, 1, 1, 1, 1, 1,
-0.390671, -0.04916378, -0.8129098, 1, 1, 1, 1, 1,
-0.3893476, -0.1170682, -0.1017914, 1, 1, 1, 1, 1,
-0.388405, -1.348562, -2.364877, 1, 1, 1, 1, 1,
-0.3844588, -0.3513379, -3.184137, 1, 1, 1, 1, 1,
-0.383817, 0.4837824, 0.2684267, 1, 1, 1, 1, 1,
-0.3780787, -1.178937, -2.755764, 1, 1, 1, 1, 1,
-0.3752368, -0.8937102, -2.715298, 1, 1, 1, 1, 1,
-0.3743213, 0.08392324, -1.19167, 0, 0, 1, 1, 1,
-0.3741863, -0.4496924, -1.361591, 1, 0, 0, 1, 1,
-0.3719054, -0.5148814, -3.734794, 1, 0, 0, 1, 1,
-0.3706513, 0.1089298, -1.005648, 1, 0, 0, 1, 1,
-0.3661665, -0.3644136, -2.912202, 1, 0, 0, 1, 1,
-0.3644644, 1.963064, -0.8131046, 1, 0, 0, 1, 1,
-0.3638789, -0.1503081, -1.473581, 0, 0, 0, 1, 1,
-0.3610428, -1.371829, -2.954256, 0, 0, 0, 1, 1,
-0.360216, -0.6672973, -1.911709, 0, 0, 0, 1, 1,
-0.3569857, 0.4599015, -0.4304916, 0, 0, 0, 1, 1,
-0.349403, 0.704613, -0.07872326, 0, 0, 0, 1, 1,
-0.3461818, 0.6134688, -0.5430665, 0, 0, 0, 1, 1,
-0.343014, 0.3370237, -0.3079206, 0, 0, 0, 1, 1,
-0.3417618, 0.1715449, -2.649012, 1, 1, 1, 1, 1,
-0.3356183, 1.315271, -0.8827006, 1, 1, 1, 1, 1,
-0.3351916, 2.068505, -1.116284, 1, 1, 1, 1, 1,
-0.3302999, 1.090943, -0.08754363, 1, 1, 1, 1, 1,
-0.3271697, 0.1184377, -1.809756, 1, 1, 1, 1, 1,
-0.3271236, 2.069957, -0.5835151, 1, 1, 1, 1, 1,
-0.3224209, 0.2941025, -0.7537601, 1, 1, 1, 1, 1,
-0.3217385, 0.7057152, -0.6965262, 1, 1, 1, 1, 1,
-0.3196382, -0.7302346, -2.727365, 1, 1, 1, 1, 1,
-0.318795, -0.9058298, -5.579396, 1, 1, 1, 1, 1,
-0.3148893, -0.2064558, -1.433435, 1, 1, 1, 1, 1,
-0.312602, 2.176476, -0.4170466, 1, 1, 1, 1, 1,
-0.3103617, -0.005627353, -1.606041, 1, 1, 1, 1, 1,
-0.3070234, 1.737795, 0.5796647, 1, 1, 1, 1, 1,
-0.3046772, 0.9022173, -0.10676, 1, 1, 1, 1, 1,
-0.3038667, -0.9619541, -2.468331, 0, 0, 1, 1, 1,
-0.3030806, -0.2322825, -1.123607, 1, 0, 0, 1, 1,
-0.3020236, -0.02994081, -0.1199097, 1, 0, 0, 1, 1,
-0.3011773, -0.6645215, -4.537623, 1, 0, 0, 1, 1,
-0.2991844, 1.411644, 0.01293527, 1, 0, 0, 1, 1,
-0.2983146, -1.545114, -1.213287, 1, 0, 0, 1, 1,
-0.2900338, -0.5134126, -2.225167, 0, 0, 0, 1, 1,
-0.282187, 0.4782376, -0.2879271, 0, 0, 0, 1, 1,
-0.2801526, 0.7375076, -1.17301, 0, 0, 0, 1, 1,
-0.2788924, -1.218429, -4.114374, 0, 0, 0, 1, 1,
-0.2749472, 0.765462, -0.6473449, 0, 0, 0, 1, 1,
-0.2740741, 0.7492402, -0.5615899, 0, 0, 0, 1, 1,
-0.273347, -2.076556, -2.276841, 0, 0, 0, 1, 1,
-0.2708626, 0.0642105, 0.2550628, 1, 1, 1, 1, 1,
-0.2689488, -0.3999931, -1.65017, 1, 1, 1, 1, 1,
-0.2676829, 0.03329828, -0.4107848, 1, 1, 1, 1, 1,
-0.2656295, -0.221089, -2.135371, 1, 1, 1, 1, 1,
-0.2655157, 1.76352, 0.6221376, 1, 1, 1, 1, 1,
-0.2605678, -0.5755106, -3.760049, 1, 1, 1, 1, 1,
-0.2598545, 0.7763554, -1.404266, 1, 1, 1, 1, 1,
-0.2590272, -0.6917228, -3.026814, 1, 1, 1, 1, 1,
-0.2515936, -1.342418, -3.685536, 1, 1, 1, 1, 1,
-0.2444802, -1.071955, -2.70034, 1, 1, 1, 1, 1,
-0.2443879, 0.4631157, 0.8208836, 1, 1, 1, 1, 1,
-0.2429137, 0.4860976, -1.574966, 1, 1, 1, 1, 1,
-0.2420618, -1.239867, -3.084785, 1, 1, 1, 1, 1,
-0.2388187, -1.433853, -3.555694, 1, 1, 1, 1, 1,
-0.2381475, 0.1691911, -0.5263792, 1, 1, 1, 1, 1,
-0.2379419, 1.332319, 0.06470036, 0, 0, 1, 1, 1,
-0.2378175, 1.143055, 0.6518291, 1, 0, 0, 1, 1,
-0.2337053, 1.53982, -0.1822507, 1, 0, 0, 1, 1,
-0.2323569, -0.869075, -3.654279, 1, 0, 0, 1, 1,
-0.2321748, 0.1442803, -0.9644482, 1, 0, 0, 1, 1,
-0.2282566, -0.5104463, -3.000503, 1, 0, 0, 1, 1,
-0.2232848, 0.6506904, -1.802123, 0, 0, 0, 1, 1,
-0.2211276, -0.02547619, -1.68478, 0, 0, 0, 1, 1,
-0.2206567, -0.4818392, -1.676366, 0, 0, 0, 1, 1,
-0.2119782, 0.5772251, -1.881292, 0, 0, 0, 1, 1,
-0.2118624, 0.842609, 0.856342, 0, 0, 0, 1, 1,
-0.2093282, 1.12671, 0.288647, 0, 0, 0, 1, 1,
-0.2073278, 0.8157498, 0.1736287, 0, 0, 0, 1, 1,
-0.2055419, -0.477166, -2.933083, 1, 1, 1, 1, 1,
-0.204059, -1.106614, -3.359153, 1, 1, 1, 1, 1,
-0.1997048, 0.2654715, -0.209485, 1, 1, 1, 1, 1,
-0.1990905, -0.973426, -2.544714, 1, 1, 1, 1, 1,
-0.1956212, -0.6814924, -1.450843, 1, 1, 1, 1, 1,
-0.1947126, -0.6854091, -2.555645, 1, 1, 1, 1, 1,
-0.1933619, -0.1674471, -1.912751, 1, 1, 1, 1, 1,
-0.1900872, -0.8246246, -1.50526, 1, 1, 1, 1, 1,
-0.1882129, 1.156067, -0.6218475, 1, 1, 1, 1, 1,
-0.1804308, 0.5994664, 0.1982535, 1, 1, 1, 1, 1,
-0.1786436, -0.9878806, -2.643569, 1, 1, 1, 1, 1,
-0.1765375, -0.6251465, -1.756759, 1, 1, 1, 1, 1,
-0.1657739, -1.038662, -2.536584, 1, 1, 1, 1, 1,
-0.1624867, 0.9444529, -1.138449, 1, 1, 1, 1, 1,
-0.1464781, -1.007648, -3.066468, 1, 1, 1, 1, 1,
-0.1431675, 0.6408714, 0.8171602, 0, 0, 1, 1, 1,
-0.1382171, 0.3463936, 0.2554716, 1, 0, 0, 1, 1,
-0.1363463, 1.26993, -0.2155354, 1, 0, 0, 1, 1,
-0.136237, 0.9038775, -0.6190231, 1, 0, 0, 1, 1,
-0.1351952, -1.086081, -0.9592255, 1, 0, 0, 1, 1,
-0.1261625, 0.4750708, -0.2914741, 1, 0, 0, 1, 1,
-0.1247918, 1.547325, -1.174773, 0, 0, 0, 1, 1,
-0.1241617, 0.2002392, 0.4492839, 0, 0, 0, 1, 1,
-0.1241221, -1.878526, -3.197346, 0, 0, 0, 1, 1,
-0.1227175, 0.5188598, 0.1976521, 0, 0, 0, 1, 1,
-0.1211542, 0.2880986, -0.7514706, 0, 0, 0, 1, 1,
-0.1190561, -0.2568353, -2.785984, 0, 0, 0, 1, 1,
-0.1148142, -0.4489391, -2.283836, 0, 0, 0, 1, 1,
-0.1125591, -0.652518, -1.733883, 1, 1, 1, 1, 1,
-0.1124931, 1.039082, 0.5566323, 1, 1, 1, 1, 1,
-0.1123356, -0.8102756, -3.237127, 1, 1, 1, 1, 1,
-0.1080519, 0.5273858, 1.709635, 1, 1, 1, 1, 1,
-0.09490141, 0.4467754, -1.020687, 1, 1, 1, 1, 1,
-0.0945095, 0.8149225, -0.9315587, 1, 1, 1, 1, 1,
-0.09359931, -0.1188455, -3.120973, 1, 1, 1, 1, 1,
-0.09186666, -0.4696966, -1.724975, 1, 1, 1, 1, 1,
-0.08788773, -0.8814724, -2.910459, 1, 1, 1, 1, 1,
-0.08683175, 0.4855705, -0.8320623, 1, 1, 1, 1, 1,
-0.08666705, -0.3771142, -3.241367, 1, 1, 1, 1, 1,
-0.0857648, -0.7496629, -2.988405, 1, 1, 1, 1, 1,
-0.08125025, -0.3821718, -3.143909, 1, 1, 1, 1, 1,
-0.08108838, 0.0763511, -0.94981, 1, 1, 1, 1, 1,
-0.08024431, -1.231154, -1.502106, 1, 1, 1, 1, 1,
-0.07778701, -0.5088906, -4.889751, 0, 0, 1, 1, 1,
-0.07641796, -0.3644212, -2.640419, 1, 0, 0, 1, 1,
-0.0763114, -0.1961036, -2.947804, 1, 0, 0, 1, 1,
-0.07168984, -0.8843846, -1.243147, 1, 0, 0, 1, 1,
-0.07019135, 0.6454146, 1.318936, 1, 0, 0, 1, 1,
-0.0664647, 1.718103, -1.343667, 1, 0, 0, 1, 1,
-0.06356264, -1.071336, -2.704638, 0, 0, 0, 1, 1,
-0.06345208, 0.1947304, 0.4386133, 0, 0, 0, 1, 1,
-0.06156136, -1.391803, -2.032271, 0, 0, 0, 1, 1,
-0.05814104, 1.261021, 0.117739, 0, 0, 0, 1, 1,
-0.05661621, 0.9381062, -0.2211422, 0, 0, 0, 1, 1,
-0.05285256, -0.4137535, -2.959285, 0, 0, 0, 1, 1,
-0.04217053, -0.8441759, -2.422054, 0, 0, 0, 1, 1,
-0.04054567, 2.188863, -0.1432457, 1, 1, 1, 1, 1,
-0.03666323, -0.08938552, -3.048376, 1, 1, 1, 1, 1,
-0.03523422, -0.1738238, -2.704643, 1, 1, 1, 1, 1,
-0.03305402, -0.03340706, -2.279378, 1, 1, 1, 1, 1,
-0.02950962, -1.568942, -2.549969, 1, 1, 1, 1, 1,
-0.02840487, -1.089507, -3.123612, 1, 1, 1, 1, 1,
-0.025364, 0.520453, -1.137633, 1, 1, 1, 1, 1,
-0.02387711, -0.2463336, -2.52792, 1, 1, 1, 1, 1,
-0.02276982, -1.410305, -3.127255, 1, 1, 1, 1, 1,
-0.02157387, 0.904056, -0.2446255, 1, 1, 1, 1, 1,
-0.0215708, 0.1654934, 1.033195, 1, 1, 1, 1, 1,
-0.02037168, -0.5867552, -2.173987, 1, 1, 1, 1, 1,
-0.01953301, 0.7336667, -0.1019359, 1, 1, 1, 1, 1,
-0.01921577, -1.845714, -3.003918, 1, 1, 1, 1, 1,
-0.01825443, -0.4452502, -3.856365, 1, 1, 1, 1, 1,
-0.01683607, -0.5189124, -3.148672, 0, 0, 1, 1, 1,
-0.01628684, 1.006715, -1.522589, 1, 0, 0, 1, 1,
-0.01467346, 0.9124407, -1.594064, 1, 0, 0, 1, 1,
-0.01452195, -0.5936936, -3.870679, 1, 0, 0, 1, 1,
-0.01196772, 0.6619329, -1.257835, 1, 0, 0, 1, 1,
-0.009943536, -0.4823083, -2.437268, 1, 0, 0, 1, 1,
-0.009271385, 0.8606393, -2.829374, 0, 0, 0, 1, 1,
-0.004281385, -0.5279328, -4.617217, 0, 0, 0, 1, 1,
0.003602149, -0.3330363, 2.585276, 0, 0, 0, 1, 1,
0.005594239, -0.259526, 2.829113, 0, 0, 0, 1, 1,
0.007969058, 1.410839, -0.7887136, 0, 0, 0, 1, 1,
0.009208339, 0.3361877, -0.7908577, 0, 0, 0, 1, 1,
0.01627871, 0.4472502, -0.2207695, 0, 0, 0, 1, 1,
0.01629086, -0.8815426, 3.087648, 1, 1, 1, 1, 1,
0.01720774, -0.8896564, 3.715911, 1, 1, 1, 1, 1,
0.02073119, -0.218804, 2.065952, 1, 1, 1, 1, 1,
0.0262858, -1.231505, 3.585504, 1, 1, 1, 1, 1,
0.02894831, -2.508962, 2.421089, 1, 1, 1, 1, 1,
0.03000004, -0.6765217, 4.466464, 1, 1, 1, 1, 1,
0.03239713, -2.673785, 2.840763, 1, 1, 1, 1, 1,
0.0377095, -1.937148, 2.865372, 1, 1, 1, 1, 1,
0.03832788, -0.01693123, 2.281213, 1, 1, 1, 1, 1,
0.03891349, 0.2544018, -1.090503, 1, 1, 1, 1, 1,
0.03898242, 1.041312, -0.7090934, 1, 1, 1, 1, 1,
0.04137118, 1.481386, 1.499323, 1, 1, 1, 1, 1,
0.04176817, 0.8755893, 0.8990646, 1, 1, 1, 1, 1,
0.04183784, 0.7658079, 0.08744927, 1, 1, 1, 1, 1,
0.04416782, -1.086251, 4.488667, 1, 1, 1, 1, 1,
0.04505873, 0.4760035, -0.6522589, 0, 0, 1, 1, 1,
0.04715636, 0.004725966, -0.9812433, 1, 0, 0, 1, 1,
0.04848071, -0.004472402, 2.354034, 1, 0, 0, 1, 1,
0.04913028, 0.05406646, 0.5025865, 1, 0, 0, 1, 1,
0.05224755, 0.6835012, 0.5783187, 1, 0, 0, 1, 1,
0.05269467, -0.8050542, 2.94203, 1, 0, 0, 1, 1,
0.05396902, -0.1394885, 2.74881, 0, 0, 0, 1, 1,
0.05434661, 0.7285962, 0.046466, 0, 0, 0, 1, 1,
0.06326853, -0.01756437, 1.796878, 0, 0, 0, 1, 1,
0.06356332, -0.3043568, 3.820772, 0, 0, 0, 1, 1,
0.06703737, 0.09298158, 1.435392, 0, 0, 0, 1, 1,
0.06770403, 0.001253086, 2.503246, 0, 0, 0, 1, 1,
0.0678243, 0.5217497, -0.7331343, 0, 0, 0, 1, 1,
0.0691975, -0.9859303, 2.582147, 1, 1, 1, 1, 1,
0.07205434, -0.3121163, 2.313442, 1, 1, 1, 1, 1,
0.0735036, -1.378626, 3.14219, 1, 1, 1, 1, 1,
0.07577523, 0.2513939, 2.152118, 1, 1, 1, 1, 1,
0.076459, 0.04419293, -1.149662, 1, 1, 1, 1, 1,
0.07990359, -0.1470283, 1.862972, 1, 1, 1, 1, 1,
0.08249084, 0.2514289, -0.3926245, 1, 1, 1, 1, 1,
0.08902664, 0.6621429, 1.195475, 1, 1, 1, 1, 1,
0.09282067, -1.963218, 5.190264, 1, 1, 1, 1, 1,
0.0935467, -1.61286, 5.838261, 1, 1, 1, 1, 1,
0.0955036, 2.76527, -0.2297599, 1, 1, 1, 1, 1,
0.09884246, 0.8286331, 0.08110464, 1, 1, 1, 1, 1,
0.1022024, -0.2491667, 1.979185, 1, 1, 1, 1, 1,
0.103118, -0.06985845, 2.084413, 1, 1, 1, 1, 1,
0.1061665, -0.5968516, 3.979203, 1, 1, 1, 1, 1,
0.1066825, 0.1695796, 1.782142, 0, 0, 1, 1, 1,
0.113468, 0.737213, -1.93154, 1, 0, 0, 1, 1,
0.1228147, 0.5224127, 0.5414228, 1, 0, 0, 1, 1,
0.1232031, 0.2367905, -0.6862704, 1, 0, 0, 1, 1,
0.1237415, 0.3421903, -0.1166741, 1, 0, 0, 1, 1,
0.1320515, 0.5368265, 0.07072973, 1, 0, 0, 1, 1,
0.134493, -0.2073985, 2.337802, 0, 0, 0, 1, 1,
0.139139, -0.8545061, 2.233533, 0, 0, 0, 1, 1,
0.1392171, -1.408719, 3.468099, 0, 0, 0, 1, 1,
0.1414528, -0.6279501, 3.741382, 0, 0, 0, 1, 1,
0.1442912, 0.9147918, 0.343974, 0, 0, 0, 1, 1,
0.1455121, -2.492749, 2.714181, 0, 0, 0, 1, 1,
0.1455983, 1.548073, 0.06587335, 0, 0, 0, 1, 1,
0.149307, -0.450859, 4.530084, 1, 1, 1, 1, 1,
0.1513499, 1.639249, -0.639609, 1, 1, 1, 1, 1,
0.155574, 0.04316338, 0.4768087, 1, 1, 1, 1, 1,
0.1565538, -0.1273629, 1.702268, 1, 1, 1, 1, 1,
0.1582646, 0.1871324, 1.23946, 1, 1, 1, 1, 1,
0.1589799, -1.126514, 2.226921, 1, 1, 1, 1, 1,
0.1608861, -0.8012835, 3.587546, 1, 1, 1, 1, 1,
0.1611591, -1.394233, 3.061205, 1, 1, 1, 1, 1,
0.161652, 1.877789, -0.1031007, 1, 1, 1, 1, 1,
0.1682157, -0.8326979, 1.85675, 1, 1, 1, 1, 1,
0.1709461, -0.4028384, 4.066786, 1, 1, 1, 1, 1,
0.1729102, 0.6683405, 0.02620987, 1, 1, 1, 1, 1,
0.1732195, 0.2719929, 0.2639272, 1, 1, 1, 1, 1,
0.1749595, 0.4332152, -0.7019609, 1, 1, 1, 1, 1,
0.1850557, -0.1301447, 2.710241, 1, 1, 1, 1, 1,
0.1900465, -1.36022, 2.744376, 0, 0, 1, 1, 1,
0.1914046, 0.439764, 1.152515, 1, 0, 0, 1, 1,
0.1928735, -1.288751, 3.131732, 1, 0, 0, 1, 1,
0.193489, 2.105304, 0.5817692, 1, 0, 0, 1, 1,
0.1936127, 0.06219181, 0.4213472, 1, 0, 0, 1, 1,
0.2021448, -1.647389, 2.019375, 1, 0, 0, 1, 1,
0.2031092, 0.9623197, 3.472237, 0, 0, 0, 1, 1,
0.2039175, 0.7819694, -0.3978645, 0, 0, 0, 1, 1,
0.2077466, -0.7641936, 4.856018, 0, 0, 0, 1, 1,
0.2082256, 0.4242742, 1.388523, 0, 0, 0, 1, 1,
0.2107699, -0.5917574, 1.906321, 0, 0, 0, 1, 1,
0.2138007, 1.538819, -0.8618745, 0, 0, 0, 1, 1,
0.2141021, -0.2299025, 4.737009, 0, 0, 0, 1, 1,
0.2168675, 1.861614, -1.927375, 1, 1, 1, 1, 1,
0.2202499, -0.1933566, 0.3496741, 1, 1, 1, 1, 1,
0.2227902, 0.02928644, 1.531676, 1, 1, 1, 1, 1,
0.2256987, -0.3951747, 2.61789, 1, 1, 1, 1, 1,
0.2273117, 0.05680027, 1.124274, 1, 1, 1, 1, 1,
0.2275343, -0.2678571, 2.609717, 1, 1, 1, 1, 1,
0.230942, -0.4069495, 2.193879, 1, 1, 1, 1, 1,
0.2311037, 0.7935143, 0.5276049, 1, 1, 1, 1, 1,
0.235648, -0.1362667, 2.028811, 1, 1, 1, 1, 1,
0.2375708, -0.6345344, 3.844658, 1, 1, 1, 1, 1,
0.2378526, -1.065413, 2.084555, 1, 1, 1, 1, 1,
0.2391029, -0.6068313, 2.01666, 1, 1, 1, 1, 1,
0.2392675, 0.1051589, 0.07161622, 1, 1, 1, 1, 1,
0.2435487, 0.3179286, 0.5705169, 1, 1, 1, 1, 1,
0.2494336, -1.853252, 3.816827, 1, 1, 1, 1, 1,
0.2520943, 0.2082554, 0.2971076, 0, 0, 1, 1, 1,
0.2554388, 1.193151, -0.4682445, 1, 0, 0, 1, 1,
0.2570672, -0.5955903, 4.576705, 1, 0, 0, 1, 1,
0.257965, 0.4577553, 1.225996, 1, 0, 0, 1, 1,
0.2601288, 0.2491554, -0.3016528, 1, 0, 0, 1, 1,
0.2669736, -0.2233634, 3.829331, 1, 0, 0, 1, 1,
0.2673725, -0.626114, 0.8589317, 0, 0, 0, 1, 1,
0.2694125, -0.8531925, 1.989577, 0, 0, 0, 1, 1,
0.2752745, 0.2386511, 1.181848, 0, 0, 0, 1, 1,
0.2799851, 0.4866518, 1.022076, 0, 0, 0, 1, 1,
0.2894809, -1.241656, 2.826273, 0, 0, 0, 1, 1,
0.2901588, 0.1820043, 1.355123, 0, 0, 0, 1, 1,
0.2925556, -0.06410143, 0.7332379, 0, 0, 0, 1, 1,
0.2944402, 1.095596, 0.1538289, 1, 1, 1, 1, 1,
0.2947952, 0.4165564, -0.06004746, 1, 1, 1, 1, 1,
0.2952786, -0.7270979, 0.2064083, 1, 1, 1, 1, 1,
0.2969976, 2.134154, -1.168923, 1, 1, 1, 1, 1,
0.3003303, 0.8555735, -0.7968255, 1, 1, 1, 1, 1,
0.3018367, -0.3572598, 2.658093, 1, 1, 1, 1, 1,
0.3036064, 0.6743117, -0.8259615, 1, 1, 1, 1, 1,
0.305055, -0.5380909, 1.583502, 1, 1, 1, 1, 1,
0.3061955, -0.1331368, 1.327051, 1, 1, 1, 1, 1,
0.3074819, 0.03247371, 1.482854, 1, 1, 1, 1, 1,
0.3104048, -0.4257083, 1.900413, 1, 1, 1, 1, 1,
0.3144286, 0.210392, 0.9434272, 1, 1, 1, 1, 1,
0.3179198, -0.9749295, 2.025527, 1, 1, 1, 1, 1,
0.3180548, 1.353137, 0.3192936, 1, 1, 1, 1, 1,
0.3189454, -0.5292106, 2.008292, 1, 1, 1, 1, 1,
0.3191639, 0.0002277014, -0.1871241, 0, 0, 1, 1, 1,
0.3198373, -0.7565692, 2.580631, 1, 0, 0, 1, 1,
0.3215493, -0.1610484, 2.542781, 1, 0, 0, 1, 1,
0.3221592, 0.1723816, 0.9819641, 1, 0, 0, 1, 1,
0.3300004, -0.7116216, 3.077577, 1, 0, 0, 1, 1,
0.3333075, 0.6051461, -0.189361, 1, 0, 0, 1, 1,
0.3429478, 1.395081, -0.1857188, 0, 0, 0, 1, 1,
0.3470097, -0.4835601, 4.826059, 0, 0, 0, 1, 1,
0.3491715, 0.02644752, 1.453425, 0, 0, 0, 1, 1,
0.35031, 1.664948, 0.8134883, 0, 0, 0, 1, 1,
0.3510199, -0.2320576, 5.273385, 0, 0, 0, 1, 1,
0.3579639, -0.1490868, 2.473621, 0, 0, 0, 1, 1,
0.3588252, 0.3912844, 0.8787239, 0, 0, 0, 1, 1,
0.3597882, 1.959799, -0.6135662, 1, 1, 1, 1, 1,
0.3646318, 1.352272, -0.1060536, 1, 1, 1, 1, 1,
0.3649824, -0.05955295, 2.561215, 1, 1, 1, 1, 1,
0.3693588, 0.07532375, 1.537288, 1, 1, 1, 1, 1,
0.3707887, 0.005535627, 0.5957975, 1, 1, 1, 1, 1,
0.3722308, 0.23869, 1.233986, 1, 1, 1, 1, 1,
0.3766701, 0.6842198, 0.7440816, 1, 1, 1, 1, 1,
0.388099, -2.151098, 2.376672, 1, 1, 1, 1, 1,
0.3916897, -0.2986044, 3.056844, 1, 1, 1, 1, 1,
0.3925868, -0.3654267, 1.605274, 1, 1, 1, 1, 1,
0.3978635, 0.03419776, 0.7449555, 1, 1, 1, 1, 1,
0.4001082, -0.3002527, 1.210034, 1, 1, 1, 1, 1,
0.4007251, 1.678642, 0.4425901, 1, 1, 1, 1, 1,
0.4043838, 0.5297511, -1.249509, 1, 1, 1, 1, 1,
0.4127478, 0.3364758, 1.308702, 1, 1, 1, 1, 1,
0.4128976, -0.5554686, 1.017242, 0, 0, 1, 1, 1,
0.4150336, -0.7564402, 3.07747, 1, 0, 0, 1, 1,
0.4154518, -0.7210578, 2.155618, 1, 0, 0, 1, 1,
0.416589, 1.125639, 1.278524, 1, 0, 0, 1, 1,
0.4174931, 0.1449644, 0.1174112, 1, 0, 0, 1, 1,
0.4186459, -0.03758335, 1.844159, 1, 0, 0, 1, 1,
0.4186927, 0.7944925, -0.7587331, 0, 0, 0, 1, 1,
0.419179, -0.06404088, 2.226206, 0, 0, 0, 1, 1,
0.4200218, 0.7475805, 0.2382936, 0, 0, 0, 1, 1,
0.4210359, 0.8303487, 0.3487744, 0, 0, 0, 1, 1,
0.4212534, 0.3499414, -0.9561491, 0, 0, 0, 1, 1,
0.4217033, 0.03289069, 0.7254528, 0, 0, 0, 1, 1,
0.4247931, 0.3905823, 0.0223904, 0, 0, 0, 1, 1,
0.4263272, 0.3038938, 0.09068467, 1, 1, 1, 1, 1,
0.4287896, 1.02969, 0.06335702, 1, 1, 1, 1, 1,
0.430948, -1.408178, 4.380849, 1, 1, 1, 1, 1,
0.4347248, -1.378621, 4.041195, 1, 1, 1, 1, 1,
0.4371069, -0.7810359, 2.361074, 1, 1, 1, 1, 1,
0.4400878, 0.6061358, 0.02311948, 1, 1, 1, 1, 1,
0.4481666, -0.08256999, 2.89264, 1, 1, 1, 1, 1,
0.4520685, 0.2263373, 1.583991, 1, 1, 1, 1, 1,
0.4540564, 0.7066374, -0.08145223, 1, 1, 1, 1, 1,
0.457558, 0.203087, -0.3638292, 1, 1, 1, 1, 1,
0.4601502, 0.1940815, 0.07830756, 1, 1, 1, 1, 1,
0.4603607, 1.059864, -0.1849487, 1, 1, 1, 1, 1,
0.4618811, -0.7489137, 2.378937, 1, 1, 1, 1, 1,
0.4640191, 0.09992854, 0.7274818, 1, 1, 1, 1, 1,
0.465746, 0.9166936, -0.2521657, 1, 1, 1, 1, 1,
0.4682879, 0.3619194, 2.319997, 0, 0, 1, 1, 1,
0.4688962, -0.4160683, 3.059912, 1, 0, 0, 1, 1,
0.4716553, -0.6930864, 1.997797, 1, 0, 0, 1, 1,
0.4752491, -0.3629372, 2.597789, 1, 0, 0, 1, 1,
0.4755614, -0.9022924, 1.949346, 1, 0, 0, 1, 1,
0.4765146, -1.965396, 2.186783, 1, 0, 0, 1, 1,
0.4766212, -0.2903165, 2.160886, 0, 0, 0, 1, 1,
0.4774404, 0.8474066, 0.1778755, 0, 0, 0, 1, 1,
0.4777217, -0.07413041, 1.172277, 0, 0, 0, 1, 1,
0.4786734, -0.1928055, 1.497827, 0, 0, 0, 1, 1,
0.4830377, 0.2014645, 0.08362679, 0, 0, 0, 1, 1,
0.4838164, 1.256642, 0.719997, 0, 0, 0, 1, 1,
0.491143, 0.2840101, 1.546164, 0, 0, 0, 1, 1,
0.4932724, -1.200338, 4.413568, 1, 1, 1, 1, 1,
0.5008622, -0.9783244, 3.423124, 1, 1, 1, 1, 1,
0.5039996, -1.144543, 2.562186, 1, 1, 1, 1, 1,
0.5040934, 0.05818729, 2.921464, 1, 1, 1, 1, 1,
0.5074189, -2.20307, 3.397628, 1, 1, 1, 1, 1,
0.514623, 0.5286213, 1.028181, 1, 1, 1, 1, 1,
0.5166249, -1.499851, 1.953334, 1, 1, 1, 1, 1,
0.5211901, 1.168594, 1.126153, 1, 1, 1, 1, 1,
0.5223659, -0.527057, 3.250186, 1, 1, 1, 1, 1,
0.5239592, 0.6226941, 1.641211, 1, 1, 1, 1, 1,
0.5246376, -0.293845, 2.025228, 1, 1, 1, 1, 1,
0.5271696, 0.1245766, 0.914462, 1, 1, 1, 1, 1,
0.5349356, 0.459416, 0.9839599, 1, 1, 1, 1, 1,
0.5357906, 1.19236, 0.8211902, 1, 1, 1, 1, 1,
0.5374458, 0.9253799, 2.649475, 1, 1, 1, 1, 1,
0.5381971, -0.5729027, 3.624614, 0, 0, 1, 1, 1,
0.5394428, 0.1653753, 2.021175, 1, 0, 0, 1, 1,
0.541164, -0.3240311, 2.205724, 1, 0, 0, 1, 1,
0.5428612, 1.240048, 1.360995, 1, 0, 0, 1, 1,
0.5434465, -0.4338288, 0.07518204, 1, 0, 0, 1, 1,
0.5459619, -0.1783065, 0.9609697, 1, 0, 0, 1, 1,
0.5499619, -0.2499324, 1.462616, 0, 0, 0, 1, 1,
0.5554744, 0.0492869, 0.01349305, 0, 0, 0, 1, 1,
0.5567245, 0.2715725, 2.161466, 0, 0, 0, 1, 1,
0.5577295, -0.8128005, 3.675512, 0, 0, 0, 1, 1,
0.5580744, -0.7920143, -0.425893, 0, 0, 0, 1, 1,
0.5602406, 1.89101, 0.2894018, 0, 0, 0, 1, 1,
0.5642127, 0.8384063, 0.952104, 0, 0, 0, 1, 1,
0.5668584, -0.3569274, 2.769656, 1, 1, 1, 1, 1,
0.567499, -0.7993757, 0.5708835, 1, 1, 1, 1, 1,
0.5678813, 0.4474728, 2.092328, 1, 1, 1, 1, 1,
0.5712573, 0.7191459, 1.142473, 1, 1, 1, 1, 1,
0.5767994, -1.144654, 0.8907817, 1, 1, 1, 1, 1,
0.5771224, -0.7281638, 2.772599, 1, 1, 1, 1, 1,
0.5796973, -0.9651389, 3.097478, 1, 1, 1, 1, 1,
0.5805985, -1.427963, 3.68826, 1, 1, 1, 1, 1,
0.5808368, 2.396635, 0.1533984, 1, 1, 1, 1, 1,
0.5839955, -1.219789, 3.664829, 1, 1, 1, 1, 1,
0.5867354, -1.229259, 1.412036, 1, 1, 1, 1, 1,
0.5928699, 0.6188305, 2.87725, 1, 1, 1, 1, 1,
0.5962853, 1.062769, -0.9578481, 1, 1, 1, 1, 1,
0.5968702, -0.2097234, 1.937221, 1, 1, 1, 1, 1,
0.5985623, 0.7769543, 0.8281261, 1, 1, 1, 1, 1,
0.6013764, 1.104897, 0.1513233, 0, 0, 1, 1, 1,
0.6069766, 0.4359859, 0.08367839, 1, 0, 0, 1, 1,
0.6120083, 1.500778, 0.1426541, 1, 0, 0, 1, 1,
0.6194689, -1.805564, 2.037117, 1, 0, 0, 1, 1,
0.6195359, -0.05884964, 2.653175, 1, 0, 0, 1, 1,
0.622812, 0.08315163, 0.7910768, 1, 0, 0, 1, 1,
0.6240194, 0.5972462, -1.546289, 0, 0, 0, 1, 1,
0.6243465, -1.010414, 2.591636, 0, 0, 0, 1, 1,
0.6252518, 1.239114, 2.101633, 0, 0, 0, 1, 1,
0.6311119, -0.4837154, 1.570429, 0, 0, 0, 1, 1,
0.6391495, 0.7712198, -0.5779788, 0, 0, 0, 1, 1,
0.64517, 0.9292264, 1.538036, 0, 0, 0, 1, 1,
0.6491579, -0.4663244, 2.460752, 0, 0, 0, 1, 1,
0.653763, 0.5941162, 0.6082954, 1, 1, 1, 1, 1,
0.662797, 1.723692, -0.1649381, 1, 1, 1, 1, 1,
0.6632448, 0.02725946, 1.85912, 1, 1, 1, 1, 1,
0.6634772, -0.3405474, 1.012063, 1, 1, 1, 1, 1,
0.6635081, -0.2413892, 1.872015, 1, 1, 1, 1, 1,
0.6812719, -0.4339708, 1.423725, 1, 1, 1, 1, 1,
0.6824811, 1.627235, 0.8984997, 1, 1, 1, 1, 1,
0.6838487, 0.05292819, 2.304518, 1, 1, 1, 1, 1,
0.6887428, 0.3034536, 1.56266, 1, 1, 1, 1, 1,
0.6913566, 1.604307, -0.2985986, 1, 1, 1, 1, 1,
0.703235, -0.4178366, 2.096784, 1, 1, 1, 1, 1,
0.7035322, 0.180108, -1.534353, 1, 1, 1, 1, 1,
0.7045438, -0.1980786, 2.388566, 1, 1, 1, 1, 1,
0.7062235, -1.436201, 2.074016, 1, 1, 1, 1, 1,
0.7088115, 0.09129737, 1.213693, 1, 1, 1, 1, 1,
0.7167926, -0.6801527, 1.54813, 0, 0, 1, 1, 1,
0.7172508, -0.2338987, 2.70632, 1, 0, 0, 1, 1,
0.7183319, 0.1599619, 2.977312, 1, 0, 0, 1, 1,
0.7184644, 1.742393, -0.510764, 1, 0, 0, 1, 1,
0.7186774, -1.477005, 1.929475, 1, 0, 0, 1, 1,
0.7197112, 0.2862287, 1.594718, 1, 0, 0, 1, 1,
0.7200487, 0.8907427, 0.722152, 0, 0, 0, 1, 1,
0.7202941, -1.109902, 3.454895, 0, 0, 0, 1, 1,
0.7247931, 1.168087, 0.6427954, 0, 0, 0, 1, 1,
0.7257357, -1.62018, 3.507954, 0, 0, 0, 1, 1,
0.7330194, 1.431573, 0.951699, 0, 0, 0, 1, 1,
0.734167, -0.5128589, 0.8500271, 0, 0, 0, 1, 1,
0.7365066, 1.282743, -0.1735741, 0, 0, 0, 1, 1,
0.742156, -1.509665, 2.432744, 1, 1, 1, 1, 1,
0.7529469, -0.9601321, 3.572968, 1, 1, 1, 1, 1,
0.7540472, 2.040349, -1.470538, 1, 1, 1, 1, 1,
0.7566415, -1.661951, 2.408693, 1, 1, 1, 1, 1,
0.7569338, -0.008029243, 1.859492, 1, 1, 1, 1, 1,
0.7578242, 0.402516, 1.151282, 1, 1, 1, 1, 1,
0.7597709, -2.255246, 3.177162, 1, 1, 1, 1, 1,
0.7611909, 0.8683257, -0.1000708, 1, 1, 1, 1, 1,
0.7619308, -2.285065, 1.847802, 1, 1, 1, 1, 1,
0.773381, -0.9676617, 2.27933, 1, 1, 1, 1, 1,
0.7769626, 0.1703045, 0.6542754, 1, 1, 1, 1, 1,
0.7814525, -1.704169, 1.613346, 1, 1, 1, 1, 1,
0.7825502, -1.136709, 1.60943, 1, 1, 1, 1, 1,
0.7834746, 0.02284463, -0.4556054, 1, 1, 1, 1, 1,
0.7838603, -0.773066, 1.318605, 1, 1, 1, 1, 1,
0.7882081, -0.2454151, 2.159566, 0, 0, 1, 1, 1,
0.7918411, -0.09281272, 1.623207, 1, 0, 0, 1, 1,
0.7927467, -1.017835, 3.883704, 1, 0, 0, 1, 1,
0.8121493, -1.757641, 2.440912, 1, 0, 0, 1, 1,
0.8155222, 0.5619312, 2.947115, 1, 0, 0, 1, 1,
0.8259081, -1.089604, 2.555474, 1, 0, 0, 1, 1,
0.8265601, 0.9476828, 3.252302, 0, 0, 0, 1, 1,
0.8273669, -1.733727, 2.181548, 0, 0, 0, 1, 1,
0.8323151, -0.195288, 0.2075384, 0, 0, 0, 1, 1,
0.8329525, 0.2161541, 0.0345614, 0, 0, 0, 1, 1,
0.8335437, 0.936079, 3.607536, 0, 0, 0, 1, 1,
0.8337877, 0.6506714, 2.514, 0, 0, 0, 1, 1,
0.8415953, 0.7141357, 1.525096, 0, 0, 0, 1, 1,
0.8417749, -0.3830625, 1.633995, 1, 1, 1, 1, 1,
0.8525075, 0.2413322, 0.3905172, 1, 1, 1, 1, 1,
0.8526805, -0.8463433, 2.853331, 1, 1, 1, 1, 1,
0.8558435, 1.23225, -0.4572085, 1, 1, 1, 1, 1,
0.8611706, -0.4834219, 1.549866, 1, 1, 1, 1, 1,
0.8654242, 0.679597, 0.7556228, 1, 1, 1, 1, 1,
0.8663394, -0.7198964, -0.9608407, 1, 1, 1, 1, 1,
0.8666382, 1.74873, 0.2892704, 1, 1, 1, 1, 1,
0.8700988, -1.776238, 2.583085, 1, 1, 1, 1, 1,
0.8704619, 1.093971, 0.3704629, 1, 1, 1, 1, 1,
0.8751746, -1.55646, 1.800751, 1, 1, 1, 1, 1,
0.8768799, -1.533477, 2.510629, 1, 1, 1, 1, 1,
0.8852577, 0.3355644, 0.4704298, 1, 1, 1, 1, 1,
0.895895, 0.1078979, 0.1705167, 1, 1, 1, 1, 1,
0.9000003, -0.8700291, 3.15091, 1, 1, 1, 1, 1,
0.9126365, 1.843267, 1.73078, 0, 0, 1, 1, 1,
0.9134247, -0.6232181, 2.045504, 1, 0, 0, 1, 1,
0.9144114, 0.1885252, 2.007182, 1, 0, 0, 1, 1,
0.9167282, 1.43619, -0.5758423, 1, 0, 0, 1, 1,
0.9167462, -0.5496026, 3.418429, 1, 0, 0, 1, 1,
0.9208661, -0.6524041, 4.069908, 1, 0, 0, 1, 1,
0.9272556, -0.117264, 1.105416, 0, 0, 0, 1, 1,
0.9297408, -1.42204, 2.827672, 0, 0, 0, 1, 1,
0.9402601, 0.5570982, 1.24199, 0, 0, 0, 1, 1,
0.9405814, -1.668792, 1.682495, 0, 0, 0, 1, 1,
0.9466942, -0.1929497, 1.336642, 0, 0, 0, 1, 1,
0.9471663, 2.310244, -0.9071654, 0, 0, 0, 1, 1,
0.9566156, -0.7516586, 0.8373959, 0, 0, 0, 1, 1,
0.9661586, -1.810828, 2.679731, 1, 1, 1, 1, 1,
0.9781872, 1.099901, -0.0867051, 1, 1, 1, 1, 1,
0.979527, 1.282625, 1.080386, 1, 1, 1, 1, 1,
0.9840748, -1.097129, 1.407222, 1, 1, 1, 1, 1,
0.9853856, 1.557389, 0.8332791, 1, 1, 1, 1, 1,
0.9954562, -3.793663, 2.875336, 1, 1, 1, 1, 1,
1.000906, 0.9650409, 2.276016, 1, 1, 1, 1, 1,
1.002893, -0.959233, 2.308616, 1, 1, 1, 1, 1,
1.004952, -1.957371, 1.260865, 1, 1, 1, 1, 1,
1.005679, -0.40811, 1.289942, 1, 1, 1, 1, 1,
1.015388, -0.9852849, 5.694397, 1, 1, 1, 1, 1,
1.017026, -0.4978485, 0.6619756, 1, 1, 1, 1, 1,
1.017086, -0.4256033, 3.033478, 1, 1, 1, 1, 1,
1.024281, -0.3705055, 2.830496, 1, 1, 1, 1, 1,
1.032211, 0.7155724, 1.417688, 1, 1, 1, 1, 1,
1.035161, 0.960771, -0.09558016, 0, 0, 1, 1, 1,
1.037483, -1.255376, 4.683395, 1, 0, 0, 1, 1,
1.041927, -0.479434, 0.7416373, 1, 0, 0, 1, 1,
1.0436, -0.8901665, 0.7637418, 1, 0, 0, 1, 1,
1.044713, -1.742081, 2.218226, 1, 0, 0, 1, 1,
1.05865, 1.657745, 0.9674259, 1, 0, 0, 1, 1,
1.065975, -0.1608567, 2.108391, 0, 0, 0, 1, 1,
1.080117, 2.679428, 2.670197, 0, 0, 0, 1, 1,
1.082664, -2.097029, 2.560474, 0, 0, 0, 1, 1,
1.084933, -0.7247641, 1.730803, 0, 0, 0, 1, 1,
1.08982, -0.2338585, 1.436006, 0, 0, 0, 1, 1,
1.09348, -0.6426005, 2.040287, 0, 0, 0, 1, 1,
1.100002, -0.5747457, 3.293125, 0, 0, 0, 1, 1,
1.100645, 2.143536, -0.6079644, 1, 1, 1, 1, 1,
1.102382, 0.3795602, 2.137385, 1, 1, 1, 1, 1,
1.107167, 0.3287478, 0.8230788, 1, 1, 1, 1, 1,
1.112901, 0.7682747, 0.9028322, 1, 1, 1, 1, 1,
1.123673, 1.733197, 1.588307, 1, 1, 1, 1, 1,
1.128971, 0.6267295, -0.08603069, 1, 1, 1, 1, 1,
1.132282, 1.091469, 1.377874, 1, 1, 1, 1, 1,
1.135346, -0.7181121, 1.255587, 1, 1, 1, 1, 1,
1.141701, -0.3033697, 3.134954, 1, 1, 1, 1, 1,
1.142567, -0.1682105, -0.3094098, 1, 1, 1, 1, 1,
1.1454, -0.1973958, -1.227891, 1, 1, 1, 1, 1,
1.154596, -0.1193658, 2.45942, 1, 1, 1, 1, 1,
1.155146, -0.4942324, 2.469227, 1, 1, 1, 1, 1,
1.160605, 1.045068, -1.035187, 1, 1, 1, 1, 1,
1.161643, 0.06951711, 1.940495, 1, 1, 1, 1, 1,
1.174137, -1.03112, 2.341318, 0, 0, 1, 1, 1,
1.18001, -0.9492861, 2.660804, 1, 0, 0, 1, 1,
1.194702, 0.4322847, 0.9888698, 1, 0, 0, 1, 1,
1.195486, -0.3439079, -0.1303373, 1, 0, 0, 1, 1,
1.201597, -0.1657131, 1.160277, 1, 0, 0, 1, 1,
1.206365, 0.2418947, 0.1149055, 1, 0, 0, 1, 1,
1.213101, 0.708911, 0.4939691, 0, 0, 0, 1, 1,
1.213691, -1.353878, 3.030191, 0, 0, 0, 1, 1,
1.221865, -1.085874, 2.91841, 0, 0, 0, 1, 1,
1.227721, -1.433239, 2.449236, 0, 0, 0, 1, 1,
1.238019, 1.185312, 1.125584, 0, 0, 0, 1, 1,
1.239321, 0.6512588, -1.105959, 0, 0, 0, 1, 1,
1.240874, -0.4512232, -0.2110734, 0, 0, 0, 1, 1,
1.257537, 0.1320826, 2.210899, 1, 1, 1, 1, 1,
1.258384, -0.5732729, 2.516908, 1, 1, 1, 1, 1,
1.264071, 2.54212, 0.3193374, 1, 1, 1, 1, 1,
1.264624, -0.3179055, 3.505012, 1, 1, 1, 1, 1,
1.274326, 0.3412202, 0.4552094, 1, 1, 1, 1, 1,
1.277683, 0.5217464, 1.065853, 1, 1, 1, 1, 1,
1.289901, -1.071582, 3.569296, 1, 1, 1, 1, 1,
1.296597, -0.3428853, 1.777948, 1, 1, 1, 1, 1,
1.296825, 0.320008, 1.735192, 1, 1, 1, 1, 1,
1.301016, 1.072912, 0.7377104, 1, 1, 1, 1, 1,
1.301766, -0.9331842, 3.429583, 1, 1, 1, 1, 1,
1.30215, -0.2284947, 1.312071, 1, 1, 1, 1, 1,
1.31347, 1.536378, 0.1952165, 1, 1, 1, 1, 1,
1.315241, -0.02916051, 1.355662, 1, 1, 1, 1, 1,
1.336202, -1.484875, 3.192572, 1, 1, 1, 1, 1,
1.337379, 0.1353967, 1.69821, 0, 0, 1, 1, 1,
1.348737, 0.5937387, 2.302362, 1, 0, 0, 1, 1,
1.369343, -1.200744, 1.980136, 1, 0, 0, 1, 1,
1.381683, 0.004151621, 0.02260381, 1, 0, 0, 1, 1,
1.382496, -2.282382, 2.306148, 1, 0, 0, 1, 1,
1.412163, -0.5788956, 2.482364, 1, 0, 0, 1, 1,
1.419924, -1.154181, 1.88827, 0, 0, 0, 1, 1,
1.428062, 1.376624, -0.2378538, 0, 0, 0, 1, 1,
1.435236, -0.09140723, 2.349454, 0, 0, 0, 1, 1,
1.443907, 0.8622062, 0.6211112, 0, 0, 0, 1, 1,
1.444577, -2.071401, -0.05416284, 0, 0, 0, 1, 1,
1.454603, 0.2156908, 1.296363, 0, 0, 0, 1, 1,
1.458673, -2.20391, 3.635185, 0, 0, 0, 1, 1,
1.459564, -1.058973, 0.4450027, 1, 1, 1, 1, 1,
1.462837, -1.826889, 3.411247, 1, 1, 1, 1, 1,
1.478711, 0.04229343, 1.651359, 1, 1, 1, 1, 1,
1.488978, 0.02724667, 1.229457, 1, 1, 1, 1, 1,
1.492298, 1.002347, 0.3950812, 1, 1, 1, 1, 1,
1.498163, -0.2574842, 1.921368, 1, 1, 1, 1, 1,
1.509784, -1.727669, 2.357997, 1, 1, 1, 1, 1,
1.520587, 1.729001, 0.9247513, 1, 1, 1, 1, 1,
1.53515, 0.06104555, 2.316635, 1, 1, 1, 1, 1,
1.538579, 0.9129167, 0.685506, 1, 1, 1, 1, 1,
1.548408, 0.1563, 1.892064, 1, 1, 1, 1, 1,
1.568034, 1.275663, 0.9253213, 1, 1, 1, 1, 1,
1.587795, -0.0443358, 1.797575, 1, 1, 1, 1, 1,
1.590195, 1.806256, 0.3251348, 1, 1, 1, 1, 1,
1.594108, 0.3778821, 2.086037, 1, 1, 1, 1, 1,
1.616501, -1.054048, 2.200839, 0, 0, 1, 1, 1,
1.620362, 0.3602649, 2.683993, 1, 0, 0, 1, 1,
1.624694, -1.936308, 2.631867, 1, 0, 0, 1, 1,
1.626044, 0.332101, 2.839493, 1, 0, 0, 1, 1,
1.64099, -0.5002003, 2.772352, 1, 0, 0, 1, 1,
1.665046, 1.334444, 1.17119, 1, 0, 0, 1, 1,
1.689241, 0.9416013, -0.8592642, 0, 0, 0, 1, 1,
1.731539, -1.256233, 3.367951, 0, 0, 0, 1, 1,
1.741878, 0.5914408, 0.4093612, 0, 0, 0, 1, 1,
1.770691, -0.9999296, 3.963527, 0, 0, 0, 1, 1,
1.774181, -0.2246913, 1.423849, 0, 0, 0, 1, 1,
1.78746, 0.9038938, 1.852888, 0, 0, 0, 1, 1,
1.824285, -0.00955823, 1.560547, 0, 0, 0, 1, 1,
1.834657, 0.5805526, 0.2622666, 1, 1, 1, 1, 1,
1.835098, 0.733769, 0.2389545, 1, 1, 1, 1, 1,
1.837156, -0.714187, 1.945807, 1, 1, 1, 1, 1,
1.848163, -0.2892536, 0.9511559, 1, 1, 1, 1, 1,
1.856822, -0.3896717, 0.8568188, 1, 1, 1, 1, 1,
1.860216, -0.8080028, 3.591844, 1, 1, 1, 1, 1,
1.875218, -0.7363082, 3.114928, 1, 1, 1, 1, 1,
1.902821, 1.430261, 0.03107857, 1, 1, 1, 1, 1,
1.902967, -1.38244, 2.023409, 1, 1, 1, 1, 1,
1.904477, 0.7360509, 1.257329, 1, 1, 1, 1, 1,
1.973021, -2.413395, 2.858178, 1, 1, 1, 1, 1,
2.002857, 0.7269215, 0.7508901, 1, 1, 1, 1, 1,
2.041389, 2.261105, 0.5901364, 1, 1, 1, 1, 1,
2.04571, 0.8306474, 2.147564, 1, 1, 1, 1, 1,
2.076517, 0.6217901, 1.190138, 1, 1, 1, 1, 1,
2.094489, -0.789378, 2.248506, 0, 0, 1, 1, 1,
2.095516, -1.143618, 3.598396, 1, 0, 0, 1, 1,
2.133224, -0.2401495, 2.939371, 1, 0, 0, 1, 1,
2.136453, 1.574903, 0.9624929, 1, 0, 0, 1, 1,
2.196038, 0.7427724, 0.4192455, 1, 0, 0, 1, 1,
2.20367, 0.9832103, 2.25741, 1, 0, 0, 1, 1,
2.21413, 1.644465, 0.5052028, 0, 0, 0, 1, 1,
2.251426, 0.1398225, 2.927444, 0, 0, 0, 1, 1,
2.340915, 0.8060023, 3.182111, 0, 0, 0, 1, 1,
2.359793, -1.010601, 1.985581, 0, 0, 0, 1, 1,
2.415389, 0.2921977, 2.288361, 0, 0, 0, 1, 1,
2.440143, 0.4319882, 1.183288, 0, 0, 0, 1, 1,
2.44786, -2.607053, 2.679265, 0, 0, 0, 1, 1,
2.450428, 1.287675, 0.5341701, 1, 1, 1, 1, 1,
2.561313, 1.622783, 2.338407, 1, 1, 1, 1, 1,
2.606508, -1.936613, 3.664482, 1, 1, 1, 1, 1,
2.634981, 2.020054, 0.9269657, 1, 1, 1, 1, 1,
2.643259, 0.0112945, 0.8404877, 1, 1, 1, 1, 1,
2.910119, -0.4778302, 2.808923, 1, 1, 1, 1, 1,
2.915395, -0.6094251, 1.983085, 1, 1, 1, 1, 1
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
var radius = 9.993981;
var distance = 35.10344;
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
mvMatrix.translate( 0.1336499, 0.1956174, -0.1294324 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.10344);
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
