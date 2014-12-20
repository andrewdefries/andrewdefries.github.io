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
-3.377447, 0.432307, -0.703788, 1, 0, 0, 1,
-3.238711, 0.3119332, -1.077551, 1, 0.007843138, 0, 1,
-2.714126, 0.7928543, -2.595319, 1, 0.01176471, 0, 1,
-2.645456, 0.5743282, -2.64317, 1, 0.01960784, 0, 1,
-2.530623, 0.4644425, -2.77628, 1, 0.02352941, 0, 1,
-2.471403, -1.110748, -2.498255, 1, 0.03137255, 0, 1,
-2.434037, -0.01635629, -1.188483, 1, 0.03529412, 0, 1,
-2.319194, 0.2165984, -2.666055, 1, 0.04313726, 0, 1,
-2.314024, 0.4648465, -3.27195, 1, 0.04705882, 0, 1,
-2.22255, -0.1328718, -3.005096, 1, 0.05490196, 0, 1,
-2.183805, -0.6991852, -0.5675536, 1, 0.05882353, 0, 1,
-2.163308, 0.3490267, -0.9692989, 1, 0.06666667, 0, 1,
-2.086627, -0.4429994, -1.965442, 1, 0.07058824, 0, 1,
-2.081811, -0.1917899, -0.1453185, 1, 0.07843138, 0, 1,
-2.078076, -0.8342764, -0.9318552, 1, 0.08235294, 0, 1,
-2.07376, -1.048498, -0.8718987, 1, 0.09019608, 0, 1,
-2.060413, 0.4761416, -1.947724, 1, 0.09411765, 0, 1,
-2.051522, 1.078485, -2.951711, 1, 0.1019608, 0, 1,
-2.007641, 1.111722, -1.273639, 1, 0.1098039, 0, 1,
-1.958326, -0.2596472, 0.0408279, 1, 0.1137255, 0, 1,
-1.957645, 0.8427014, -0.678651, 1, 0.1215686, 0, 1,
-1.936079, 0.2864113, -1.035271, 1, 0.1254902, 0, 1,
-1.930548, -0.4875625, -3.469218, 1, 0.1333333, 0, 1,
-1.927814, -1.163247, -1.546162, 1, 0.1372549, 0, 1,
-1.919892, 0.4768026, -1.26359, 1, 0.145098, 0, 1,
-1.913932, -0.04968854, -1.728484, 1, 0.1490196, 0, 1,
-1.879855, 1.564318, -0.7797869, 1, 0.1568628, 0, 1,
-1.855385, 1.807847, -1.500316, 1, 0.1607843, 0, 1,
-1.849833, 0.6542773, -2.472049, 1, 0.1686275, 0, 1,
-1.839321, -0.3289625, -2.699924, 1, 0.172549, 0, 1,
-1.810576, 2.879734, 0.1643567, 1, 0.1803922, 0, 1,
-1.803691, -0.5801739, -0.7096202, 1, 0.1843137, 0, 1,
-1.789366, 0.7309048, -0.3948234, 1, 0.1921569, 0, 1,
-1.789122, 0.6338196, -1.435936, 1, 0.1960784, 0, 1,
-1.766748, -0.8831341, -1.942542, 1, 0.2039216, 0, 1,
-1.766676, 1.191916, 0.734667, 1, 0.2117647, 0, 1,
-1.750594, 1.168344, -1.434945, 1, 0.2156863, 0, 1,
-1.749048, 0.8621825, 0.2814792, 1, 0.2235294, 0, 1,
-1.746098, -0.1084198, -1.643041, 1, 0.227451, 0, 1,
-1.723922, 0.8714104, -1.668047, 1, 0.2352941, 0, 1,
-1.719722, -0.09676711, -0.9146706, 1, 0.2392157, 0, 1,
-1.710342, 1.684569, 0.1044324, 1, 0.2470588, 0, 1,
-1.698662, 0.2220758, -1.000711, 1, 0.2509804, 0, 1,
-1.696677, -0.3280911, -0.4308557, 1, 0.2588235, 0, 1,
-1.654134, -1.38829, -3.065762, 1, 0.2627451, 0, 1,
-1.652728, 0.3938573, -1.160078, 1, 0.2705882, 0, 1,
-1.645017, -0.8820462, -3.302516, 1, 0.2745098, 0, 1,
-1.630278, -2.264697, -1.72437, 1, 0.282353, 0, 1,
-1.626472, -1.010124, -1.926463, 1, 0.2862745, 0, 1,
-1.616085, -1.267434, -2.124269, 1, 0.2941177, 0, 1,
-1.585231, -0.3588149, -2.321978, 1, 0.3019608, 0, 1,
-1.584864, -1.040169, -1.603428, 1, 0.3058824, 0, 1,
-1.583545, -0.2307325, -1.201953, 1, 0.3137255, 0, 1,
-1.554822, -0.1047739, -2.822341, 1, 0.3176471, 0, 1,
-1.552382, 1.084817, -0.4211795, 1, 0.3254902, 0, 1,
-1.552306, -0.02230361, -0.743903, 1, 0.3294118, 0, 1,
-1.54936, -0.09629833, -2.23332, 1, 0.3372549, 0, 1,
-1.534277, 0.6645181, -2.255523, 1, 0.3411765, 0, 1,
-1.533982, 0.1738679, -1.776266, 1, 0.3490196, 0, 1,
-1.527761, 0.8372948, -2.848552, 1, 0.3529412, 0, 1,
-1.513964, 0.2592446, -2.404647, 1, 0.3607843, 0, 1,
-1.505038, 0.1617589, -1.150756, 1, 0.3647059, 0, 1,
-1.491688, 0.1536186, -2.032578, 1, 0.372549, 0, 1,
-1.486375, 0.3308597, -0.1974061, 1, 0.3764706, 0, 1,
-1.462058, -1.751001, -2.803234, 1, 0.3843137, 0, 1,
-1.459697, 0.02090268, -2.944951, 1, 0.3882353, 0, 1,
-1.454178, 0.1482621, -2.513161, 1, 0.3960784, 0, 1,
-1.446892, 0.1823161, -2.35497, 1, 0.4039216, 0, 1,
-1.445673, -0.8460811, -0.7392428, 1, 0.4078431, 0, 1,
-1.437168, 1.176046, -2.713646, 1, 0.4156863, 0, 1,
-1.435286, 0.2806051, -1.663296, 1, 0.4196078, 0, 1,
-1.423356, 0.9606836, -1.33652, 1, 0.427451, 0, 1,
-1.416979, -1.053628, -1.025769, 1, 0.4313726, 0, 1,
-1.408157, 1.324434, -3.111086, 1, 0.4392157, 0, 1,
-1.406139, -1.933864, -2.37927, 1, 0.4431373, 0, 1,
-1.40577, 1.448754, 0.1654672, 1, 0.4509804, 0, 1,
-1.403977, -0.2363399, -2.310935, 1, 0.454902, 0, 1,
-1.398737, -0.3697432, -1.379387, 1, 0.4627451, 0, 1,
-1.395844, -1.409252, -2.306253, 1, 0.4666667, 0, 1,
-1.392176, -0.4226126, -1.114056, 1, 0.4745098, 0, 1,
-1.389794, 0.5862011, 0.9361508, 1, 0.4784314, 0, 1,
-1.379343, 0.02224712, 1.002762, 1, 0.4862745, 0, 1,
-1.375801, 0.593091, -0.6080789, 1, 0.4901961, 0, 1,
-1.37365, 1.491574, -0.4165239, 1, 0.4980392, 0, 1,
-1.371685, -1.0643, -2.499199, 1, 0.5058824, 0, 1,
-1.367874, -0.203308, -0.859068, 1, 0.509804, 0, 1,
-1.341178, -2.112365, -0.6735106, 1, 0.5176471, 0, 1,
-1.330652, -0.193342, -2.805251, 1, 0.5215687, 0, 1,
-1.328737, 2.484685, 0.3774424, 1, 0.5294118, 0, 1,
-1.308699, 0.3374982, -0.06478062, 1, 0.5333334, 0, 1,
-1.308045, 0.4851848, -1.243051, 1, 0.5411765, 0, 1,
-1.302583, -0.395682, -0.8226686, 1, 0.5450981, 0, 1,
-1.300198, -0.5043852, -2.607592, 1, 0.5529412, 0, 1,
-1.292534, 0.7630298, -1.729472, 1, 0.5568628, 0, 1,
-1.285121, -0.8535905, -3.166093, 1, 0.5647059, 0, 1,
-1.282768, 0.4835034, 0.4195886, 1, 0.5686275, 0, 1,
-1.279568, 0.1494363, 0.123999, 1, 0.5764706, 0, 1,
-1.27136, -1.548549, -3.25826, 1, 0.5803922, 0, 1,
-1.26878, -0.03659348, -1.245205, 1, 0.5882353, 0, 1,
-1.265517, 1.035432, -2.791974, 1, 0.5921569, 0, 1,
-1.257761, 0.8133881, -0.4960446, 1, 0.6, 0, 1,
-1.253739, 0.4010928, -0.2071494, 1, 0.6078432, 0, 1,
-1.25141, -0.6686711, -2.543919, 1, 0.6117647, 0, 1,
-1.249587, 0.1048638, -1.621421, 1, 0.6196079, 0, 1,
-1.248071, -0.9902169, -1.825122, 1, 0.6235294, 0, 1,
-1.244861, -0.3730164, -2.456151, 1, 0.6313726, 0, 1,
-1.234647, 1.008345, -2.018843, 1, 0.6352941, 0, 1,
-1.234596, -0.4517033, -1.461494, 1, 0.6431373, 0, 1,
-1.228434, 0.3800812, -2.728207, 1, 0.6470588, 0, 1,
-1.228337, -0.9299693, -2.955941, 1, 0.654902, 0, 1,
-1.225309, -0.2716754, -0.5263801, 1, 0.6588235, 0, 1,
-1.224815, 0.1365327, -2.382726, 1, 0.6666667, 0, 1,
-1.220448, 0.678744, -0.3047799, 1, 0.6705883, 0, 1,
-1.218195, 0.0467233, -0.5634274, 1, 0.6784314, 0, 1,
-1.215595, 1.733142, -0.5872139, 1, 0.682353, 0, 1,
-1.207152, -0.5883972, -0.9387059, 1, 0.6901961, 0, 1,
-1.206736, -2.471774, -2.287671, 1, 0.6941177, 0, 1,
-1.197225, -0.2769286, -1.295417, 1, 0.7019608, 0, 1,
-1.197138, -0.1222318, -1.479126, 1, 0.7098039, 0, 1,
-1.190615, 0.9106495, -1.221383, 1, 0.7137255, 0, 1,
-1.189556, 0.3905239, -0.904726, 1, 0.7215686, 0, 1,
-1.184419, -0.2016175, -2.440948, 1, 0.7254902, 0, 1,
-1.168433, -1.094195, -0.6666482, 1, 0.7333333, 0, 1,
-1.16633, -0.393419, -3.898859, 1, 0.7372549, 0, 1,
-1.162109, -1.698849, -2.611943, 1, 0.7450981, 0, 1,
-1.153236, -0.4301054, -3.460454, 1, 0.7490196, 0, 1,
-1.153041, -1.522316, -2.047478, 1, 0.7568628, 0, 1,
-1.152962, 0.3488899, -1.06581, 1, 0.7607843, 0, 1,
-1.149447, -0.4232458, 1.173472, 1, 0.7686275, 0, 1,
-1.14116, -1.227798, -2.434095, 1, 0.772549, 0, 1,
-1.136214, -0.2732094, -1.739951, 1, 0.7803922, 0, 1,
-1.135501, 0.932902, -2.632481, 1, 0.7843137, 0, 1,
-1.134364, -0.5769064, -2.210812, 1, 0.7921569, 0, 1,
-1.132233, 0.9671347, -0.01823139, 1, 0.7960784, 0, 1,
-1.131261, -0.4062937, -2.854134, 1, 0.8039216, 0, 1,
-1.125737, 0.9538075, -1.104785, 1, 0.8117647, 0, 1,
-1.123893, -0.4360395, -1.013058, 1, 0.8156863, 0, 1,
-1.108446, -0.8510596, -2.437326, 1, 0.8235294, 0, 1,
-1.105671, 0.3278105, -2.245718, 1, 0.827451, 0, 1,
-1.098689, -0.04854268, -0.4322761, 1, 0.8352941, 0, 1,
-1.095361, -1.19049, -3.044317, 1, 0.8392157, 0, 1,
-1.091522, -1.091814, -1.289002, 1, 0.8470588, 0, 1,
-1.088264, -1.440078, -3.07671, 1, 0.8509804, 0, 1,
-1.087964, 0.04241617, -1.854836, 1, 0.8588235, 0, 1,
-1.080503, 0.9924492, -1.66381, 1, 0.8627451, 0, 1,
-1.078359, 1.473673, -1.516001, 1, 0.8705882, 0, 1,
-1.076763, 0.2806551, -1.797091, 1, 0.8745098, 0, 1,
-1.0721, 0.1695776, -0.01832808, 1, 0.8823529, 0, 1,
-1.069655, -1.007204, -3.504304, 1, 0.8862745, 0, 1,
-1.068996, 0.5144421, -1.611685, 1, 0.8941177, 0, 1,
-1.068478, -0.4610645, -3.133312, 1, 0.8980392, 0, 1,
-1.05907, 0.9069022, -0.34646, 1, 0.9058824, 0, 1,
-1.043895, -1.836122, -0.7638304, 1, 0.9137255, 0, 1,
-1.043615, 0.1693518, 0.3117477, 1, 0.9176471, 0, 1,
-1.040938, 0.7989001, -1.158851, 1, 0.9254902, 0, 1,
-1.040224, -0.7878671, -3.197489, 1, 0.9294118, 0, 1,
-1.039853, -0.1059594, -2.086489, 1, 0.9372549, 0, 1,
-1.036693, -0.943003, -0.9698882, 1, 0.9411765, 0, 1,
-1.036617, 0.3557414, -1.208459, 1, 0.9490196, 0, 1,
-1.031815, 1.481132, -0.5046459, 1, 0.9529412, 0, 1,
-1.031272, -0.45518, -1.603191, 1, 0.9607843, 0, 1,
-1.030997, -1.288572, -2.848825, 1, 0.9647059, 0, 1,
-1.029099, 0.1885752, -1.955048, 1, 0.972549, 0, 1,
-1.023951, 0.2059653, -0.9384013, 1, 0.9764706, 0, 1,
-1.017355, -0.2788529, -4.032615, 1, 0.9843137, 0, 1,
-1.0107, -0.1319401, -0.5788292, 1, 0.9882353, 0, 1,
-1.006344, -0.0950394, -1.533124, 1, 0.9960784, 0, 1,
-0.9948705, -0.7450932, -1.979053, 0.9960784, 1, 0, 1,
-0.9941412, -0.6181763, -2.640751, 0.9921569, 1, 0, 1,
-0.9839634, 0.8557422, -1.102412, 0.9843137, 1, 0, 1,
-0.9832464, -0.2465457, -2.370151, 0.9803922, 1, 0, 1,
-0.9727606, -1.456816, -3.734282, 0.972549, 1, 0, 1,
-0.9709436, 1.230976, -3.079786, 0.9686275, 1, 0, 1,
-0.9606804, 1.293084, -0.5785467, 0.9607843, 1, 0, 1,
-0.9523647, 1.83527, -1.264517, 0.9568627, 1, 0, 1,
-0.9475625, 0.3598226, -1.752882, 0.9490196, 1, 0, 1,
-0.9468039, -0.7885182, -3.273952, 0.945098, 1, 0, 1,
-0.9449348, 1.321105, -1.530722, 0.9372549, 1, 0, 1,
-0.9436514, -1.114606, -2.383386, 0.9333333, 1, 0, 1,
-0.9384873, -0.8413497, -2.267536, 0.9254902, 1, 0, 1,
-0.9341229, -0.06826907, -2.282197, 0.9215686, 1, 0, 1,
-0.9331121, 1.385684, -0.4108376, 0.9137255, 1, 0, 1,
-0.9309928, -0.5931997, -2.51309, 0.9098039, 1, 0, 1,
-0.9265823, -0.2964098, -1.101529, 0.9019608, 1, 0, 1,
-0.9236068, -0.6726439, -2.700428, 0.8941177, 1, 0, 1,
-0.9227968, -0.7298332, -2.619858, 0.8901961, 1, 0, 1,
-0.9196783, -0.1932489, -2.58279, 0.8823529, 1, 0, 1,
-0.9152873, 0.2804587, -0.0818182, 0.8784314, 1, 0, 1,
-0.9149515, -0.1213721, -3.075289, 0.8705882, 1, 0, 1,
-0.9129671, -1.982709, -2.953025, 0.8666667, 1, 0, 1,
-0.908909, 0.0112877, -0.6485648, 0.8588235, 1, 0, 1,
-0.9088348, -0.6116338, -1.947456, 0.854902, 1, 0, 1,
-0.9028372, 0.679616, -1.100457, 0.8470588, 1, 0, 1,
-0.897239, 1.271381, -0.5180552, 0.8431373, 1, 0, 1,
-0.8949053, 0.2998443, -0.926609, 0.8352941, 1, 0, 1,
-0.8927449, 0.5301397, -0.9962773, 0.8313726, 1, 0, 1,
-0.8919694, 1.949019, -0.7136988, 0.8235294, 1, 0, 1,
-0.8877142, -1.086827, -1.758106, 0.8196079, 1, 0, 1,
-0.8814291, 0.8530272, 0.6552302, 0.8117647, 1, 0, 1,
-0.877439, -2.60578, -4.361279, 0.8078431, 1, 0, 1,
-0.8766421, -0.09526888, -1.876339, 0.8, 1, 0, 1,
-0.8708683, 0.815141, -0.1552281, 0.7921569, 1, 0, 1,
-0.8688813, -0.02974342, 0.1563738, 0.7882353, 1, 0, 1,
-0.868273, 0.4558548, -0.8558379, 0.7803922, 1, 0, 1,
-0.8680927, 0.5267566, -0.3232866, 0.7764706, 1, 0, 1,
-0.8656865, 0.414887, 0.1249774, 0.7686275, 1, 0, 1,
-0.8649707, 0.06180259, -2.899391, 0.7647059, 1, 0, 1,
-0.8615087, 0.4562423, -2.648427, 0.7568628, 1, 0, 1,
-0.858121, -0.125439, -0.7269896, 0.7529412, 1, 0, 1,
-0.8564506, 2.668121, 1.215265, 0.7450981, 1, 0, 1,
-0.8499804, -0.9356577, -2.198136, 0.7411765, 1, 0, 1,
-0.8457431, 2.207158, -2.00057, 0.7333333, 1, 0, 1,
-0.8452752, -1.001487, -0.8852699, 0.7294118, 1, 0, 1,
-0.8434044, -2.004387, -1.053625, 0.7215686, 1, 0, 1,
-0.8411073, 0.1692849, -1.389514, 0.7176471, 1, 0, 1,
-0.8383566, 1.133419, 0.8153436, 0.7098039, 1, 0, 1,
-0.834874, -0.1846598, 0.3557435, 0.7058824, 1, 0, 1,
-0.8339117, 0.8753393, -1.124003, 0.6980392, 1, 0, 1,
-0.8322369, 0.5965086, 0.5269853, 0.6901961, 1, 0, 1,
-0.8315697, -0.3969486, -3.347461, 0.6862745, 1, 0, 1,
-0.8314602, -0.6430959, -1.02821, 0.6784314, 1, 0, 1,
-0.8296901, 0.09973849, -1.168885, 0.6745098, 1, 0, 1,
-0.8281921, -1.32522, -3.477529, 0.6666667, 1, 0, 1,
-0.826173, 1.361924, -0.5773771, 0.6627451, 1, 0, 1,
-0.8258138, 1.813781, 1.274932, 0.654902, 1, 0, 1,
-0.8233863, -0.08097021, -0.5707353, 0.6509804, 1, 0, 1,
-0.8228855, 0.7969938, -1.869429, 0.6431373, 1, 0, 1,
-0.822274, -0.2555743, -2.33779, 0.6392157, 1, 0, 1,
-0.8191058, -2.098632, -3.55176, 0.6313726, 1, 0, 1,
-0.8093523, -1.045463, -2.953949, 0.627451, 1, 0, 1,
-0.8072525, 2.075279, -1.39972, 0.6196079, 1, 0, 1,
-0.8047668, 0.5050176, 0.07965027, 0.6156863, 1, 0, 1,
-0.8033474, 0.9404334, -0.8358548, 0.6078432, 1, 0, 1,
-0.802712, 0.480044, -1.310381, 0.6039216, 1, 0, 1,
-0.7959253, -1.253199, -3.70079, 0.5960785, 1, 0, 1,
-0.7956811, -0.100358, -1.637351, 0.5882353, 1, 0, 1,
-0.7904489, 2.413951, -1.636495, 0.5843138, 1, 0, 1,
-0.7860852, -1.819599, -2.02657, 0.5764706, 1, 0, 1,
-0.782485, -0.8234068, -3.770083, 0.572549, 1, 0, 1,
-0.7803033, -0.7948305, -3.582537, 0.5647059, 1, 0, 1,
-0.7774349, -2.092115, -4.050046, 0.5607843, 1, 0, 1,
-0.7742874, -0.9401326, -2.709632, 0.5529412, 1, 0, 1,
-0.7644075, -1.871799, -2.691767, 0.5490196, 1, 0, 1,
-0.7605125, -1.693851, -3.555365, 0.5411765, 1, 0, 1,
-0.7512339, 0.4053146, -1.820376, 0.5372549, 1, 0, 1,
-0.7430095, -1.865276, -3.110545, 0.5294118, 1, 0, 1,
-0.7399834, -0.9708024, -1.995742, 0.5254902, 1, 0, 1,
-0.7386028, -0.1380034, -3.787821, 0.5176471, 1, 0, 1,
-0.7345085, 0.09696968, 0.1724713, 0.5137255, 1, 0, 1,
-0.7252401, -0.5287061, -1.324034, 0.5058824, 1, 0, 1,
-0.721658, 2.013482, -1.218854, 0.5019608, 1, 0, 1,
-0.7070612, 0.212533, -1.452438, 0.4941176, 1, 0, 1,
-0.7049799, 0.3393455, -0.8342566, 0.4862745, 1, 0, 1,
-0.7027143, 1.348542, -0.00844288, 0.4823529, 1, 0, 1,
-0.7011141, 0.1317835, -0.5957554, 0.4745098, 1, 0, 1,
-0.6967641, 0.2637012, -0.9631581, 0.4705882, 1, 0, 1,
-0.6957104, 0.505043, -0.6419706, 0.4627451, 1, 0, 1,
-0.685599, 1.24796, -0.345372, 0.4588235, 1, 0, 1,
-0.6836713, 1.041063, 1.100114, 0.4509804, 1, 0, 1,
-0.6790056, 2.103965, -1.332934, 0.4470588, 1, 0, 1,
-0.6728343, 1.199953, -0.8291686, 0.4392157, 1, 0, 1,
-0.6709937, -0.7150385, -1.691073, 0.4352941, 1, 0, 1,
-0.6709346, 0.1177724, -2.035512, 0.427451, 1, 0, 1,
-0.6689228, -1.22221, -3.676207, 0.4235294, 1, 0, 1,
-0.6662291, -0.8662622, -3.001261, 0.4156863, 1, 0, 1,
-0.6652135, -0.422122, -3.148584, 0.4117647, 1, 0, 1,
-0.6637566, 0.3622605, -1.251183, 0.4039216, 1, 0, 1,
-0.6531096, -1.304191, -2.918813, 0.3960784, 1, 0, 1,
-0.6492378, -0.4645209, -3.147875, 0.3921569, 1, 0, 1,
-0.6477984, 0.4435946, -0.3525163, 0.3843137, 1, 0, 1,
-0.6471509, 0.09647329, -1.546935, 0.3803922, 1, 0, 1,
-0.6455124, -2.455948, -2.947138, 0.372549, 1, 0, 1,
-0.6435201, 0.5699412, -1.197541, 0.3686275, 1, 0, 1,
-0.6380354, -0.7449592, -1.242131, 0.3607843, 1, 0, 1,
-0.6337303, 1.035352, -1.030423, 0.3568628, 1, 0, 1,
-0.6318895, 0.6192975, -2.31716, 0.3490196, 1, 0, 1,
-0.6306301, -0.2202163, -2.020163, 0.345098, 1, 0, 1,
-0.6209555, -0.4245904, -2.971441, 0.3372549, 1, 0, 1,
-0.6197789, -0.6718125, -1.536844, 0.3333333, 1, 0, 1,
-0.615262, -0.8920955, -3.020242, 0.3254902, 1, 0, 1,
-0.6146896, 0.7720189, -0.3273938, 0.3215686, 1, 0, 1,
-0.6133576, 0.6712218, 0.638808, 0.3137255, 1, 0, 1,
-0.610757, -1.267017, -1.445005, 0.3098039, 1, 0, 1,
-0.6043163, -1.079418, -1.399803, 0.3019608, 1, 0, 1,
-0.5950676, 1.110512, 0.06035609, 0.2941177, 1, 0, 1,
-0.5875722, -0.2523099, -1.322273, 0.2901961, 1, 0, 1,
-0.5804238, 0.256608, -1.638676, 0.282353, 1, 0, 1,
-0.568634, 0.885703, -0.02270889, 0.2784314, 1, 0, 1,
-0.5651723, 0.0619594, -2.268124, 0.2705882, 1, 0, 1,
-0.5648277, 0.02920604, -2.455693, 0.2666667, 1, 0, 1,
-0.563279, 0.4884588, -0.5591621, 0.2588235, 1, 0, 1,
-0.5555402, -0.6545452, -4.134544, 0.254902, 1, 0, 1,
-0.5537711, -0.7240436, -1.466481, 0.2470588, 1, 0, 1,
-0.5519282, -0.01160209, -2.022707, 0.2431373, 1, 0, 1,
-0.5519227, -0.2250185, -2.268364, 0.2352941, 1, 0, 1,
-0.5510372, -0.6904861, -2.298491, 0.2313726, 1, 0, 1,
-0.5437911, 0.6597127, -1.324489, 0.2235294, 1, 0, 1,
-0.5341243, -0.7773915, -1.511504, 0.2196078, 1, 0, 1,
-0.5332351, -0.09179907, -2.112156, 0.2117647, 1, 0, 1,
-0.5323864, 0.8713447, -0.7564025, 0.2078431, 1, 0, 1,
-0.5306309, 0.1456141, -2.753201, 0.2, 1, 0, 1,
-0.5293021, 0.2262589, -1.555953, 0.1921569, 1, 0, 1,
-0.5273567, -1.810287, -3.348847, 0.1882353, 1, 0, 1,
-0.5270307, -3.28338, -2.348624, 0.1803922, 1, 0, 1,
-0.5224756, 1.353677, -0.449354, 0.1764706, 1, 0, 1,
-0.5172873, -0.1956172, -3.79806, 0.1686275, 1, 0, 1,
-0.5166218, 0.4698233, -1.976408, 0.1647059, 1, 0, 1,
-0.5153419, -0.04939299, -1.320875, 0.1568628, 1, 0, 1,
-0.5126929, -1.094705, -2.402802, 0.1529412, 1, 0, 1,
-0.5073414, -0.4302434, -1.265121, 0.145098, 1, 0, 1,
-0.5060958, -2.518951, -4.241874, 0.1411765, 1, 0, 1,
-0.5060509, -1.18146, -1.998644, 0.1333333, 1, 0, 1,
-0.5054235, 1.417609, 0.3995512, 0.1294118, 1, 0, 1,
-0.499018, -0.0854253, -2.117887, 0.1215686, 1, 0, 1,
-0.4948432, 1.941914, 0.2405908, 0.1176471, 1, 0, 1,
-0.4946036, 1.098262, -0.05267328, 0.1098039, 1, 0, 1,
-0.4942505, -0.4033282, -1.802243, 0.1058824, 1, 0, 1,
-0.4845145, -0.2277909, -1.15688, 0.09803922, 1, 0, 1,
-0.4844551, -0.1242316, -2.458316, 0.09019608, 1, 0, 1,
-0.4755306, 0.9554942, 0.9691992, 0.08627451, 1, 0, 1,
-0.4735752, -0.9434224, -2.443396, 0.07843138, 1, 0, 1,
-0.4720666, 0.4385549, -0.519118, 0.07450981, 1, 0, 1,
-0.4676372, 0.01674137, -1.69328, 0.06666667, 1, 0, 1,
-0.4663607, -1.553362, -3.151971, 0.0627451, 1, 0, 1,
-0.4621843, 0.359547, -0.6514044, 0.05490196, 1, 0, 1,
-0.4606029, -1.004829, -1.91494, 0.05098039, 1, 0, 1,
-0.4603386, -1.295521, -2.851407, 0.04313726, 1, 0, 1,
-0.4602253, -0.9542788, -3.705188, 0.03921569, 1, 0, 1,
-0.456863, 0.8645753, -0.5850748, 0.03137255, 1, 0, 1,
-0.4527295, -0.8435513, -2.113861, 0.02745098, 1, 0, 1,
-0.452179, -0.9446387, -2.144489, 0.01960784, 1, 0, 1,
-0.4468731, -0.1519311, -2.833254, 0.01568628, 1, 0, 1,
-0.4463303, 1.044247, 1.378965, 0.007843138, 1, 0, 1,
-0.4441571, 0.1071701, -1.857582, 0.003921569, 1, 0, 1,
-0.4438104, -1.159403, -1.277319, 0, 1, 0.003921569, 1,
-0.4347199, -0.4878925, -2.527869, 0, 1, 0.01176471, 1,
-0.4342189, -0.2427746, -3.894262, 0, 1, 0.01568628, 1,
-0.4316699, -0.4746411, -2.155334, 0, 1, 0.02352941, 1,
-0.4249104, 0.8411555, -2.124066, 0, 1, 0.02745098, 1,
-0.4229399, -0.127775, -1.627086, 0, 1, 0.03529412, 1,
-0.4197836, 1.982503, -0.0452672, 0, 1, 0.03921569, 1,
-0.4158779, 2.310929, -0.01049187, 0, 1, 0.04705882, 1,
-0.4143515, 1.178518, -0.9194056, 0, 1, 0.05098039, 1,
-0.4086547, -0.09412251, -4.650817, 0, 1, 0.05882353, 1,
-0.4054894, -0.2453078, -0.8104405, 0, 1, 0.0627451, 1,
-0.4014367, -3.771424, -4.526908, 0, 1, 0.07058824, 1,
-0.4014244, 0.1590531, -1.476499, 0, 1, 0.07450981, 1,
-0.3974135, 0.2598866, -2.40879, 0, 1, 0.08235294, 1,
-0.3910379, 0.4806, 1.115166, 0, 1, 0.08627451, 1,
-0.38987, -0.2842112, -4.733805, 0, 1, 0.09411765, 1,
-0.3878909, -2.0451, -2.201499, 0, 1, 0.1019608, 1,
-0.3854512, -0.7652563, -1.899894, 0, 1, 0.1058824, 1,
-0.3828174, -0.7727612, -2.013564, 0, 1, 0.1137255, 1,
-0.3767716, 0.5124245, -2.130776, 0, 1, 0.1176471, 1,
-0.3764096, 1.022055, -0.5498945, 0, 1, 0.1254902, 1,
-0.3753764, -0.329893, -3.266886, 0, 1, 0.1294118, 1,
-0.3742157, 1.231927, 0.7858223, 0, 1, 0.1372549, 1,
-0.3728592, -0.5400326, -2.168861, 0, 1, 0.1411765, 1,
-0.3719556, 0.8080373, -1.925836, 0, 1, 0.1490196, 1,
-0.3703329, -1.925532, -1.601618, 0, 1, 0.1529412, 1,
-0.3671358, -0.4968924, -0.9230724, 0, 1, 0.1607843, 1,
-0.3660703, 0.3270973, -0.4028408, 0, 1, 0.1647059, 1,
-0.3650954, 0.797673, 0.4085595, 0, 1, 0.172549, 1,
-0.3639719, 0.3933788, -0.8085292, 0, 1, 0.1764706, 1,
-0.3603845, -0.3809433, -1.674081, 0, 1, 0.1843137, 1,
-0.3597977, 1.605441, -1.39278, 0, 1, 0.1882353, 1,
-0.3585177, -0.04941026, -2.246058, 0, 1, 0.1960784, 1,
-0.3570077, 1.627195, 0.651896, 0, 1, 0.2039216, 1,
-0.3531393, -0.0004765068, -0.931132, 0, 1, 0.2078431, 1,
-0.3529263, -1.572644, -2.640065, 0, 1, 0.2156863, 1,
-0.3528773, 1.596606, -0.9262112, 0, 1, 0.2196078, 1,
-0.3490286, -3.141393, -2.423852, 0, 1, 0.227451, 1,
-0.3449655, -0.1542696, -2.027434, 0, 1, 0.2313726, 1,
-0.3415895, 0.9100374, -0.6133758, 0, 1, 0.2392157, 1,
-0.3415264, 0.4255784, -1.945028, 0, 1, 0.2431373, 1,
-0.3376953, -1.197391, -3.018361, 0, 1, 0.2509804, 1,
-0.3340198, 0.6024458, -0.3286147, 0, 1, 0.254902, 1,
-0.3306374, 0.6809837, -0.5517492, 0, 1, 0.2627451, 1,
-0.3265244, 0.5725389, 0.446879, 0, 1, 0.2666667, 1,
-0.3251859, -0.5159942, -1.835668, 0, 1, 0.2745098, 1,
-0.3224514, 0.2077491, -0.6545118, 0, 1, 0.2784314, 1,
-0.3220074, 1.007043, -0.7749837, 0, 1, 0.2862745, 1,
-0.3197565, 0.2394518, -1.110124, 0, 1, 0.2901961, 1,
-0.3176229, -0.5889089, -1.583619, 0, 1, 0.2980392, 1,
-0.3149331, -0.8616574, -1.836527, 0, 1, 0.3058824, 1,
-0.3102973, 1.377519, -1.201076, 0, 1, 0.3098039, 1,
-0.3086624, 0.8479287, 0.1842988, 0, 1, 0.3176471, 1,
-0.3065948, 0.5741693, 1.314523, 0, 1, 0.3215686, 1,
-0.3049484, -0.3633523, -2.03333, 0, 1, 0.3294118, 1,
-0.3046439, 0.4661626, -1.96186, 0, 1, 0.3333333, 1,
-0.3012323, 2.486393, 0.253511, 0, 1, 0.3411765, 1,
-0.3000661, 1.608544, 0.5821506, 0, 1, 0.345098, 1,
-0.2954592, -1.047082, -2.885986, 0, 1, 0.3529412, 1,
-0.2950197, -0.9844816, -2.97224, 0, 1, 0.3568628, 1,
-0.2912719, -1.151739, -3.715557, 0, 1, 0.3647059, 1,
-0.2892287, -0.7831094, -2.777969, 0, 1, 0.3686275, 1,
-0.2775358, -1.323244, -1.857856, 0, 1, 0.3764706, 1,
-0.2772521, -0.8332092, -2.550993, 0, 1, 0.3803922, 1,
-0.2726002, 0.4463985, 0.2226786, 0, 1, 0.3882353, 1,
-0.2701192, 0.9521534, 1.133539, 0, 1, 0.3921569, 1,
-0.2690974, -0.8847669, -3.539821, 0, 1, 0.4, 1,
-0.2662981, 0.1416673, -1.600771, 0, 1, 0.4078431, 1,
-0.2636966, -0.05292787, -2.83293, 0, 1, 0.4117647, 1,
-0.2629407, -0.5979392, -2.755414, 0, 1, 0.4196078, 1,
-0.258031, -0.8584868, -2.921052, 0, 1, 0.4235294, 1,
-0.2568304, -0.6817511, -2.896803, 0, 1, 0.4313726, 1,
-0.2511317, -0.2601633, -2.252038, 0, 1, 0.4352941, 1,
-0.2470088, 2.372832, 0.6600623, 0, 1, 0.4431373, 1,
-0.2447218, -0.9265778, -2.787231, 0, 1, 0.4470588, 1,
-0.2408125, 0.6052888, 1.782089, 0, 1, 0.454902, 1,
-0.2371808, -0.2270368, -2.907086, 0, 1, 0.4588235, 1,
-0.2371754, 0.4841897, -1.320569, 0, 1, 0.4666667, 1,
-0.2371071, -0.4633307, -4.597094, 0, 1, 0.4705882, 1,
-0.2360609, -0.8644093, -2.469609, 0, 1, 0.4784314, 1,
-0.2337676, 0.6477453, 0.3510454, 0, 1, 0.4823529, 1,
-0.2333294, 1.11696, -2.179061, 0, 1, 0.4901961, 1,
-0.2302023, -1.186234, -2.941733, 0, 1, 0.4941176, 1,
-0.2300387, -0.6784726, -4.234299, 0, 1, 0.5019608, 1,
-0.2290712, -0.6997252, -2.819266, 0, 1, 0.509804, 1,
-0.2260682, -0.3952743, -2.82263, 0, 1, 0.5137255, 1,
-0.2247399, -0.8306774, -3.58004, 0, 1, 0.5215687, 1,
-0.2195015, 0.7115451, -0.3487012, 0, 1, 0.5254902, 1,
-0.2174912, 0.8984076, 0.4747717, 0, 1, 0.5333334, 1,
-0.2153626, -0.9430077, -2.999903, 0, 1, 0.5372549, 1,
-0.2150555, -0.2206571, -2.49104, 0, 1, 0.5450981, 1,
-0.2095467, -1.759775, -3.702288, 0, 1, 0.5490196, 1,
-0.2066463, -0.5301921, -3.834497, 0, 1, 0.5568628, 1,
-0.2042577, 2.025746, 0.4217675, 0, 1, 0.5607843, 1,
-0.1997347, -0.5164906, -3.220536, 0, 1, 0.5686275, 1,
-0.1989632, -0.3510816, -1.707975, 0, 1, 0.572549, 1,
-0.1982225, -0.4686188, -4.371645, 0, 1, 0.5803922, 1,
-0.1953136, -0.5609655, -2.972052, 0, 1, 0.5843138, 1,
-0.1917202, 0.7126003, -1.592223, 0, 1, 0.5921569, 1,
-0.1903664, 1.105307, -1.205389, 0, 1, 0.5960785, 1,
-0.1893315, 0.7996012, -2.051011, 0, 1, 0.6039216, 1,
-0.1858383, 0.8040266, 0.380667, 0, 1, 0.6117647, 1,
-0.183932, 0.3727515, -0.04249039, 0, 1, 0.6156863, 1,
-0.1821189, 1.333632, 0.6623603, 0, 1, 0.6235294, 1,
-0.1811891, 0.5338882, -1.034932, 0, 1, 0.627451, 1,
-0.1777331, 0.6995186, 2.17195, 0, 1, 0.6352941, 1,
-0.1776165, 0.0900676, -2.524649, 0, 1, 0.6392157, 1,
-0.1758705, 0.4459915, 0.6078678, 0, 1, 0.6470588, 1,
-0.1717657, -1.277404, -2.621217, 0, 1, 0.6509804, 1,
-0.1604805, 0.6255989, 0.02631468, 0, 1, 0.6588235, 1,
-0.1603716, -0.5032186, -1.865086, 0, 1, 0.6627451, 1,
-0.1601755, 0.40496, 1.93396, 0, 1, 0.6705883, 1,
-0.1571086, -0.7183916, -3.280548, 0, 1, 0.6745098, 1,
-0.1524584, 1.35274, -1.630061, 0, 1, 0.682353, 1,
-0.1510811, -0.02175133, -2.169077, 0, 1, 0.6862745, 1,
-0.1497664, -0.6408905, -1.91678, 0, 1, 0.6941177, 1,
-0.1488616, -0.6243797, -2.833874, 0, 1, 0.7019608, 1,
-0.1457007, 1.346922, -0.2547528, 0, 1, 0.7058824, 1,
-0.1443217, -0.2423067, -1.27651, 0, 1, 0.7137255, 1,
-0.1438004, -0.6601537, -4.297282, 0, 1, 0.7176471, 1,
-0.1427628, -0.636825, -3.828983, 0, 1, 0.7254902, 1,
-0.1413953, -0.6894259, -3.495764, 0, 1, 0.7294118, 1,
-0.1405064, 0.2474784, -0.7799582, 0, 1, 0.7372549, 1,
-0.1400737, 0.7422893, -0.4164893, 0, 1, 0.7411765, 1,
-0.1394381, -0.1282427, -1.262045, 0, 1, 0.7490196, 1,
-0.1374587, 0.4138335, -1.876431, 0, 1, 0.7529412, 1,
-0.1366171, 0.06347001, -0.105518, 0, 1, 0.7607843, 1,
-0.1318258, 0.1963597, -0.2054934, 0, 1, 0.7647059, 1,
-0.131687, -1.599015, -1.958844, 0, 1, 0.772549, 1,
-0.1296815, -0.2243974, -3.20261, 0, 1, 0.7764706, 1,
-0.1282931, 0.255554, -0.3557099, 0, 1, 0.7843137, 1,
-0.1253561, 0.2349009, -0.8355475, 0, 1, 0.7882353, 1,
-0.1222465, -1.616977, -2.678056, 0, 1, 0.7960784, 1,
-0.1197635, 0.5225461, -0.9647415, 0, 1, 0.8039216, 1,
-0.1178192, -0.7298134, -4.078896, 0, 1, 0.8078431, 1,
-0.1161987, 1.239246, 0.8348097, 0, 1, 0.8156863, 1,
-0.1136744, 0.05724605, -1.327589, 0, 1, 0.8196079, 1,
-0.110824, 0.3897564, 0.1728234, 0, 1, 0.827451, 1,
-0.1097158, -0.9247262, -2.759866, 0, 1, 0.8313726, 1,
-0.1084292, -0.900565, -1.333059, 0, 1, 0.8392157, 1,
-0.1062932, 0.9274287, 0.02029196, 0, 1, 0.8431373, 1,
-0.1060523, 0.9094872, 0.5076534, 0, 1, 0.8509804, 1,
-0.1002388, -0.6972444, -4.573216, 0, 1, 0.854902, 1,
-0.08805358, 1.377427, -0.4597054, 0, 1, 0.8627451, 1,
-0.08464656, -0.09110362, -1.392397, 0, 1, 0.8666667, 1,
-0.08062265, 0.1094944, -0.01484956, 0, 1, 0.8745098, 1,
-0.07617839, 0.5998752, 0.6955031, 0, 1, 0.8784314, 1,
-0.07178409, -0.9349433, -2.673148, 0, 1, 0.8862745, 1,
-0.0710239, 0.6529725, 1.999457, 0, 1, 0.8901961, 1,
-0.07052542, 0.1550247, -0.8863322, 0, 1, 0.8980392, 1,
-0.06403248, 0.2762171, -2.494813, 0, 1, 0.9058824, 1,
-0.06251964, 1.976668, -2.231812, 0, 1, 0.9098039, 1,
-0.05913985, 2.443931, -0.1004817, 0, 1, 0.9176471, 1,
-0.05554169, 0.0761168, -0.08520433, 0, 1, 0.9215686, 1,
-0.04908723, -0.2744246, -2.421731, 0, 1, 0.9294118, 1,
-0.04836915, 1.166093, 0.8227685, 0, 1, 0.9333333, 1,
-0.04509965, 1.15088, -2.162444, 0, 1, 0.9411765, 1,
-0.04304821, 0.04851603, -0.3690813, 0, 1, 0.945098, 1,
-0.0413354, 0.6223732, 1.736083, 0, 1, 0.9529412, 1,
-0.04063085, 0.609189, -0.4271552, 0, 1, 0.9568627, 1,
-0.0391558, -2.267838, -2.534473, 0, 1, 0.9647059, 1,
-0.03530211, -2.462301, -3.822372, 0, 1, 0.9686275, 1,
-0.0351065, -1.413356, -2.630931, 0, 1, 0.9764706, 1,
-0.03196704, 0.2489204, -2.368321, 0, 1, 0.9803922, 1,
-0.03059366, -0.8225322, -5.076924, 0, 1, 0.9882353, 1,
-0.0300147, -1.222589, -3.297772, 0, 1, 0.9921569, 1,
-0.02943173, -1.043948, -3.844889, 0, 1, 1, 1,
-0.02883358, 0.2737314, -0.2592379, 0, 0.9921569, 1, 1,
-0.02842204, -2.156171, -2.52086, 0, 0.9882353, 1, 1,
-0.02688174, -1.816073, -3.499291, 0, 0.9803922, 1, 1,
-0.02609478, 0.7069188, -0.5171635, 0, 0.9764706, 1, 1,
-0.02505597, 2.248819, 0.1822438, 0, 0.9686275, 1, 1,
-0.0244461, -0.468768, -2.220049, 0, 0.9647059, 1, 1,
-0.02315193, 0.2180676, -0.4166017, 0, 0.9568627, 1, 1,
-0.01525083, 0.06897701, 0.9224776, 0, 0.9529412, 1, 1,
-0.01325698, -1.931907, -3.909158, 0, 0.945098, 1, 1,
-0.01222434, 0.6176788, 0.1230057, 0, 0.9411765, 1, 1,
-0.009380893, 0.8567747, -1.806998, 0, 0.9333333, 1, 1,
-0.003300356, 2.29871, 1.260495, 0, 0.9294118, 1, 1,
-0.001519913, -0.0381032, -2.637448, 0, 0.9215686, 1, 1,
-0.0001396156, -1.519822, -3.102492, 0, 0.9176471, 1, 1,
0.001682807, 0.1487325, 0.2451067, 0, 0.9098039, 1, 1,
0.003249866, -0.8041178, 4.911725, 0, 0.9058824, 1, 1,
0.004907714, 0.07213054, -0.1022911, 0, 0.8980392, 1, 1,
0.007240145, -0.6476649, 3.261972, 0, 0.8901961, 1, 1,
0.01111798, -1.169488, 3.364, 0, 0.8862745, 1, 1,
0.01496295, 0.02113253, 0.5230434, 0, 0.8784314, 1, 1,
0.01591789, 0.3797761, -0.1782977, 0, 0.8745098, 1, 1,
0.0179725, -0.8881581, 3.351019, 0, 0.8666667, 1, 1,
0.0264604, -1.593572, 2.542813, 0, 0.8627451, 1, 1,
0.02912824, 0.3340595, -0.7913822, 0, 0.854902, 1, 1,
0.02968636, 1.0451, -0.3928101, 0, 0.8509804, 1, 1,
0.04843734, 0.662441, -1.118972, 0, 0.8431373, 1, 1,
0.05030877, -1.168249, 4.047883, 0, 0.8392157, 1, 1,
0.05232627, 0.01600478, 0.728845, 0, 0.8313726, 1, 1,
0.05417641, -0.8963866, 2.770931, 0, 0.827451, 1, 1,
0.05829326, -0.5998995, 3.486475, 0, 0.8196079, 1, 1,
0.05884323, 0.1749253, 0.5990225, 0, 0.8156863, 1, 1,
0.06300127, 0.2619088, -1.778724, 0, 0.8078431, 1, 1,
0.06455933, -0.1773424, 1.017469, 0, 0.8039216, 1, 1,
0.06543368, -1.712415, 3.068158, 0, 0.7960784, 1, 1,
0.06583411, 0.7785543, -1.56151, 0, 0.7882353, 1, 1,
0.07275204, -0.6380278, 1.778412, 0, 0.7843137, 1, 1,
0.07461067, 1.153984, -0.9647508, 0, 0.7764706, 1, 1,
0.07643706, -0.2019553, 2.895437, 0, 0.772549, 1, 1,
0.07923695, -0.5043817, 3.496054, 0, 0.7647059, 1, 1,
0.07940183, -0.2863378, 3.146246, 0, 0.7607843, 1, 1,
0.07970541, 0.1005737, 1.400802, 0, 0.7529412, 1, 1,
0.08156762, -0.8239152, 3.690513, 0, 0.7490196, 1, 1,
0.08423426, 0.06680554, 2.153323, 0, 0.7411765, 1, 1,
0.08651152, -1.738888, 2.479874, 0, 0.7372549, 1, 1,
0.08826487, -0.3914574, 2.80296, 0, 0.7294118, 1, 1,
0.08894026, -1.267267, 2.966518, 0, 0.7254902, 1, 1,
0.08929995, 0.1766331, 0.1146083, 0, 0.7176471, 1, 1,
0.09061489, 0.6531634, -0.3203762, 0, 0.7137255, 1, 1,
0.09868005, 0.0587798, 1.931272, 0, 0.7058824, 1, 1,
0.1024665, 0.3343384, 0.1121234, 0, 0.6980392, 1, 1,
0.1028484, 1.625733, -0.4392235, 0, 0.6941177, 1, 1,
0.1064202, 2.166724, 0.1952091, 0, 0.6862745, 1, 1,
0.1105583, -1.277119, 3.237436, 0, 0.682353, 1, 1,
0.1144605, 1.809694, -1.106365, 0, 0.6745098, 1, 1,
0.1168573, -0.6717187, 3.512223, 0, 0.6705883, 1, 1,
0.117453, 2.34216, 2.011564, 0, 0.6627451, 1, 1,
0.1179689, -0.3206612, 4.061575, 0, 0.6588235, 1, 1,
0.1218425, -0.6425238, 2.522527, 0, 0.6509804, 1, 1,
0.121976, 0.2516892, -0.4194917, 0, 0.6470588, 1, 1,
0.122715, 1.144426, 1.380923, 0, 0.6392157, 1, 1,
0.1239897, -0.232086, 3.992652, 0, 0.6352941, 1, 1,
0.1267764, 1.019184, 0.4244366, 0, 0.627451, 1, 1,
0.1269018, 2.205514, 1.899364, 0, 0.6235294, 1, 1,
0.1275683, -1.037665, 2.464032, 0, 0.6156863, 1, 1,
0.1323547, 0.07874822, 1.642565, 0, 0.6117647, 1, 1,
0.1331704, 0.4653155, -0.3908829, 0, 0.6039216, 1, 1,
0.1332313, 0.9261219, -1.646566, 0, 0.5960785, 1, 1,
0.1337889, -1.708435, 2.077106, 0, 0.5921569, 1, 1,
0.1384535, -1.261454, 3.396354, 0, 0.5843138, 1, 1,
0.139871, 2.833434, 1.83991, 0, 0.5803922, 1, 1,
0.1415391, -0.04837825, 2.359181, 0, 0.572549, 1, 1,
0.1416702, 0.6021912, 1.459005, 0, 0.5686275, 1, 1,
0.1443778, -1.157482, 2.42905, 0, 0.5607843, 1, 1,
0.1465642, -1.798766, 3.21582, 0, 0.5568628, 1, 1,
0.1483173, -1.684502, 1.819214, 0, 0.5490196, 1, 1,
0.1526027, -1.711807, 3.221847, 0, 0.5450981, 1, 1,
0.1538828, -0.2159015, 1.264959, 0, 0.5372549, 1, 1,
0.1568547, -0.934198, 4.197578, 0, 0.5333334, 1, 1,
0.159883, 0.6280445, 0.1741913, 0, 0.5254902, 1, 1,
0.1600979, -1.227013, 0.6219117, 0, 0.5215687, 1, 1,
0.1630094, -0.6381975, 3.931141, 0, 0.5137255, 1, 1,
0.1656654, -0.2021092, 3.958738, 0, 0.509804, 1, 1,
0.1673886, -0.1428124, 2.711109, 0, 0.5019608, 1, 1,
0.1675, -1.054221, 1.883712, 0, 0.4941176, 1, 1,
0.1699877, 0.4285514, -0.2853932, 0, 0.4901961, 1, 1,
0.1701135, -0.5328632, 0.3692365, 0, 0.4823529, 1, 1,
0.1759985, 0.02721952, 2.06109, 0, 0.4784314, 1, 1,
0.1797404, 0.2833891, -0.7536752, 0, 0.4705882, 1, 1,
0.1820643, 0.7786791, 0.5067545, 0, 0.4666667, 1, 1,
0.1893545, -3.330439, 3.84983, 0, 0.4588235, 1, 1,
0.1960663, 0.6008838, -1.089338, 0, 0.454902, 1, 1,
0.1968864, 0.4941074, -0.06918178, 0, 0.4470588, 1, 1,
0.1972436, 0.83304, 0.03861195, 0, 0.4431373, 1, 1,
0.2002621, -0.1061371, 3.276361, 0, 0.4352941, 1, 1,
0.2013421, -0.2783836, 2.909796, 0, 0.4313726, 1, 1,
0.2052717, -0.2691413, 0.9426789, 0, 0.4235294, 1, 1,
0.2060397, 0.7360781, 1.439488, 0, 0.4196078, 1, 1,
0.2096995, 0.217376, 0.2365465, 0, 0.4117647, 1, 1,
0.2123919, -1.120077, 3.117936, 0, 0.4078431, 1, 1,
0.2157959, 0.6477851, 1.922876, 0, 0.4, 1, 1,
0.2172248, 0.7058329, 0.1750665, 0, 0.3921569, 1, 1,
0.2204395, 0.3802069, 0.1152752, 0, 0.3882353, 1, 1,
0.2207617, 0.660198, 0.9102994, 0, 0.3803922, 1, 1,
0.2232065, -0.9051676, 3.83724, 0, 0.3764706, 1, 1,
0.2276564, -1.231443, 2.603632, 0, 0.3686275, 1, 1,
0.2286754, 0.1368409, 2.086671, 0, 0.3647059, 1, 1,
0.2298775, -0.3383362, 2.56328, 0, 0.3568628, 1, 1,
0.231826, -1.491033, 3.531901, 0, 0.3529412, 1, 1,
0.2336435, 0.2676258, -0.03816159, 0, 0.345098, 1, 1,
0.2391563, 0.2405118, 2.917644, 0, 0.3411765, 1, 1,
0.2416036, 0.7679467, 0.4190069, 0, 0.3333333, 1, 1,
0.2425434, -0.8056097, 3.122089, 0, 0.3294118, 1, 1,
0.242637, -1.337993, 4.42151, 0, 0.3215686, 1, 1,
0.2508038, 1.146316, 0.2464392, 0, 0.3176471, 1, 1,
0.2516003, 0.2444125, 1.489876, 0, 0.3098039, 1, 1,
0.2552083, -0.06536795, 0.299658, 0, 0.3058824, 1, 1,
0.2558045, -1.144138, 3.89451, 0, 0.2980392, 1, 1,
0.2563976, 1.194652, 0.3605708, 0, 0.2901961, 1, 1,
0.2626595, 0.8591138, 0.9434267, 0, 0.2862745, 1, 1,
0.2733751, 0.7362059, 0.3867572, 0, 0.2784314, 1, 1,
0.274201, -1.042946, 3.012707, 0, 0.2745098, 1, 1,
0.278946, 0.4230473, 0.9075825, 0, 0.2666667, 1, 1,
0.2793658, 0.5257077, 0.1704513, 0, 0.2627451, 1, 1,
0.2816282, 0.9242805, 0.8138198, 0, 0.254902, 1, 1,
0.2857122, 0.438149, 1.730128, 0, 0.2509804, 1, 1,
0.2891006, -1.701939, 1.940726, 0, 0.2431373, 1, 1,
0.2923808, -1.892062, 3.98244, 0, 0.2392157, 1, 1,
0.2974324, 0.9927424, 0.8681742, 0, 0.2313726, 1, 1,
0.3009613, 0.8711177, -0.2414583, 0, 0.227451, 1, 1,
0.3015571, -1.101053, 4.075101, 0, 0.2196078, 1, 1,
0.3050145, -0.9965547, 3.331673, 0, 0.2156863, 1, 1,
0.3082447, 0.2171593, 1.309199, 0, 0.2078431, 1, 1,
0.3094698, 0.7905771, 0.790753, 0, 0.2039216, 1, 1,
0.3105268, -0.9522908, 3.966036, 0, 0.1960784, 1, 1,
0.3125136, -2.48142, 4.220744, 0, 0.1882353, 1, 1,
0.3157688, -0.6368142, 2.091958, 0, 0.1843137, 1, 1,
0.3157842, 2.538611, -0.385745, 0, 0.1764706, 1, 1,
0.3162239, 0.8189371, 0.2808941, 0, 0.172549, 1, 1,
0.3165643, -0.773232, 1.610485, 0, 0.1647059, 1, 1,
0.3172179, -0.8608476, 4.393826, 0, 0.1607843, 1, 1,
0.3194667, 0.7544703, 1.228769, 0, 0.1529412, 1, 1,
0.3223167, -0.7887744, 2.229891, 0, 0.1490196, 1, 1,
0.3226196, 0.2308652, 1.266951, 0, 0.1411765, 1, 1,
0.3316103, 0.5527609, 0.4246702, 0, 0.1372549, 1, 1,
0.3524524, 0.9495302, -0.720376, 0, 0.1294118, 1, 1,
0.3537348, -2.095795, 2.593963, 0, 0.1254902, 1, 1,
0.3558097, 0.2569501, 1.966916, 0, 0.1176471, 1, 1,
0.3620683, 1.616104, -0.5022736, 0, 0.1137255, 1, 1,
0.3623271, -0.9524889, 2.885494, 0, 0.1058824, 1, 1,
0.3628922, -0.6354181, 3.576857, 0, 0.09803922, 1, 1,
0.3641516, 0.2964172, 2.108519, 0, 0.09411765, 1, 1,
0.3649757, -0.6253319, 1.606182, 0, 0.08627451, 1, 1,
0.3671862, -0.8774705, 2.199686, 0, 0.08235294, 1, 1,
0.3679916, 1.291818, 0.1825719, 0, 0.07450981, 1, 1,
0.3707617, 0.01587374, -0.8104112, 0, 0.07058824, 1, 1,
0.3738011, 0.0596194, 2.62045, 0, 0.0627451, 1, 1,
0.3759759, -0.3588921, 3.887259, 0, 0.05882353, 1, 1,
0.3822965, 0.6114053, 0.8643866, 0, 0.05098039, 1, 1,
0.3828244, 1.039588, -2.135347, 0, 0.04705882, 1, 1,
0.3858254, -0.2699943, 1.37544, 0, 0.03921569, 1, 1,
0.3882375, 1.537476, 1.238933, 0, 0.03529412, 1, 1,
0.3902313, 1.022113, 0.5067579, 0, 0.02745098, 1, 1,
0.3961846, -1.142797, 1.458836, 0, 0.02352941, 1, 1,
0.3976448, 1.68271, -0.7748202, 0, 0.01568628, 1, 1,
0.4000816, 0.02865929, 2.270354, 0, 0.01176471, 1, 1,
0.4088661, 0.04775367, 0.6517641, 0, 0.003921569, 1, 1,
0.4092306, 0.09486163, 1.709653, 0.003921569, 0, 1, 1,
0.4129329, -0.1204365, 1.846573, 0.007843138, 0, 1, 1,
0.4154079, -0.07145412, 2.464838, 0.01568628, 0, 1, 1,
0.417264, 1.133692, 1.203968, 0.01960784, 0, 1, 1,
0.418745, 0.09360759, 0.4954762, 0.02745098, 0, 1, 1,
0.420094, -1.519018, 1.897285, 0.03137255, 0, 1, 1,
0.4205011, -1.729105, 3.749699, 0.03921569, 0, 1, 1,
0.4252814, 0.3600414, 1.105329, 0.04313726, 0, 1, 1,
0.4285737, -1.34931, 2.384763, 0.05098039, 0, 1, 1,
0.430445, -0.7647254, 3.456196, 0.05490196, 0, 1, 1,
0.4315334, -0.2595026, 2.699088, 0.0627451, 0, 1, 1,
0.4352589, 0.1031533, 2.196346, 0.06666667, 0, 1, 1,
0.4370382, -1.403614, 3.519884, 0.07450981, 0, 1, 1,
0.4422715, 1.396004, 1.233431, 0.07843138, 0, 1, 1,
0.4433863, 0.3325067, -0.07637351, 0.08627451, 0, 1, 1,
0.4437837, -1.460171, 1.673525, 0.09019608, 0, 1, 1,
0.4469836, -1.73647, 3.914119, 0.09803922, 0, 1, 1,
0.449136, -2.683516, 3.876348, 0.1058824, 0, 1, 1,
0.451185, 0.2841064, 0.9265802, 0.1098039, 0, 1, 1,
0.462012, 0.9312784, 1.470281, 0.1176471, 0, 1, 1,
0.4629002, -2.147572, 3.688181, 0.1215686, 0, 1, 1,
0.4661127, 0.3230596, 2.094847, 0.1294118, 0, 1, 1,
0.4696146, 0.1683591, 0.9966614, 0.1333333, 0, 1, 1,
0.4718491, -1.938363, 1.955902, 0.1411765, 0, 1, 1,
0.4734403, -0.2554112, 3.248232, 0.145098, 0, 1, 1,
0.4738193, 0.4183259, -2.258788, 0.1529412, 0, 1, 1,
0.475769, -0.05377134, 1.428176, 0.1568628, 0, 1, 1,
0.4776856, -0.8913112, 2.996016, 0.1647059, 0, 1, 1,
0.4823548, -1.274918, 1.953724, 0.1686275, 0, 1, 1,
0.4829987, 1.119318, 0.1652249, 0.1764706, 0, 1, 1,
0.4832345, -0.263933, 2.606793, 0.1803922, 0, 1, 1,
0.4899243, -1.01127, 1.312042, 0.1882353, 0, 1, 1,
0.4909599, 0.3599964, 1.003317, 0.1921569, 0, 1, 1,
0.49579, 0.06918601, 3.206888, 0.2, 0, 1, 1,
0.4973487, 0.7243938, 0.8032377, 0.2078431, 0, 1, 1,
0.4980601, -0.4075201, 4.070209, 0.2117647, 0, 1, 1,
0.5096533, 0.936077, 0.6736773, 0.2196078, 0, 1, 1,
0.5117235, 1.008397, 0.4814786, 0.2235294, 0, 1, 1,
0.514395, -0.2261061, 0.1834363, 0.2313726, 0, 1, 1,
0.517231, -0.06246815, 1.269626, 0.2352941, 0, 1, 1,
0.5174243, -0.01247822, 0.06452771, 0.2431373, 0, 1, 1,
0.5245522, 1.835775, -1.323352, 0.2470588, 0, 1, 1,
0.529205, -0.6210971, 3.177014, 0.254902, 0, 1, 1,
0.5324015, 0.5323275, 0.975965, 0.2588235, 0, 1, 1,
0.5372335, -0.1365338, 2.803212, 0.2666667, 0, 1, 1,
0.5372374, 1.330143, 0.01991893, 0.2705882, 0, 1, 1,
0.5405348, 0.006435584, 0.002551614, 0.2784314, 0, 1, 1,
0.5409725, -1.546911, 2.188395, 0.282353, 0, 1, 1,
0.545854, -0.7481195, 2.122388, 0.2901961, 0, 1, 1,
0.5479538, -0.09238645, 2.763956, 0.2941177, 0, 1, 1,
0.5481615, -0.141496, 2.067582, 0.3019608, 0, 1, 1,
0.5485437, -0.3155046, 3.491757, 0.3098039, 0, 1, 1,
0.5528759, -1.500669, 4.426961, 0.3137255, 0, 1, 1,
0.5549427, -1.343276, 4.597539, 0.3215686, 0, 1, 1,
0.5566289, -0.43139, 3.602376, 0.3254902, 0, 1, 1,
0.5569668, -0.5561543, 3.899035, 0.3333333, 0, 1, 1,
0.5681474, 0.7073974, -0.05072635, 0.3372549, 0, 1, 1,
0.574242, 0.816124, 0.8820371, 0.345098, 0, 1, 1,
0.5745689, 0.7051988, 0.3661918, 0.3490196, 0, 1, 1,
0.5749717, 1.413038, -1.963472, 0.3568628, 0, 1, 1,
0.575193, 1.621154, -0.4137048, 0.3607843, 0, 1, 1,
0.5794188, 0.9884187, 0.6109817, 0.3686275, 0, 1, 1,
0.5798997, -0.5288135, 3.178569, 0.372549, 0, 1, 1,
0.5809719, -0.7112689, 2.405868, 0.3803922, 0, 1, 1,
0.5835213, -0.04675369, 1.606488, 0.3843137, 0, 1, 1,
0.599008, 1.674914, 1.284305, 0.3921569, 0, 1, 1,
0.6004263, -2.174505, 3.935867, 0.3960784, 0, 1, 1,
0.606213, 0.3441955, -0.2432139, 0.4039216, 0, 1, 1,
0.6076369, 0.4732839, 0.3825023, 0.4117647, 0, 1, 1,
0.6097534, -0.9917743, 2.039017, 0.4156863, 0, 1, 1,
0.6183136, 1.192311, 0.8673463, 0.4235294, 0, 1, 1,
0.6225819, 0.7563106, 0.9478229, 0.427451, 0, 1, 1,
0.6260263, -0.3746969, 1.182986, 0.4352941, 0, 1, 1,
0.6280147, -0.2627741, 0.8064752, 0.4392157, 0, 1, 1,
0.6307687, -1.707247, 4.429684, 0.4470588, 0, 1, 1,
0.6324579, 0.005958451, 2.987301, 0.4509804, 0, 1, 1,
0.6332341, -0.4006451, 2.928149, 0.4588235, 0, 1, 1,
0.6334197, 0.4501585, 0.01202224, 0.4627451, 0, 1, 1,
0.6337007, 1.371699, 0.2641306, 0.4705882, 0, 1, 1,
0.6356108, 0.09470455, 2.170744, 0.4745098, 0, 1, 1,
0.6468162, 0.4649612, 1.233304, 0.4823529, 0, 1, 1,
0.6586758, -1.412013, 3.089398, 0.4862745, 0, 1, 1,
0.6670671, -0.8327579, 3.871474, 0.4941176, 0, 1, 1,
0.6681224, 0.8156414, 2.382417, 0.5019608, 0, 1, 1,
0.6684774, -1.449923, 3.939708, 0.5058824, 0, 1, 1,
0.6807397, -0.6004626, 1.796242, 0.5137255, 0, 1, 1,
0.6890749, -1.413626, 2.816606, 0.5176471, 0, 1, 1,
0.6901812, 1.517079, 0.2333765, 0.5254902, 0, 1, 1,
0.6919755, -1.46153, 2.364565, 0.5294118, 0, 1, 1,
0.694096, -2.333885, 3.380795, 0.5372549, 0, 1, 1,
0.6984916, -2.500792, 3.908201, 0.5411765, 0, 1, 1,
0.7004417, -1.517081, 3.810989, 0.5490196, 0, 1, 1,
0.7013755, 1.289452, 0.2999056, 0.5529412, 0, 1, 1,
0.7089202, 0.4833898, 0.4049669, 0.5607843, 0, 1, 1,
0.7130293, 1.85938, 1.413419, 0.5647059, 0, 1, 1,
0.7263349, 0.09171843, 1.216609, 0.572549, 0, 1, 1,
0.73, -0.1383734, 3.684001, 0.5764706, 0, 1, 1,
0.731463, -0.1889938, 2.83285, 0.5843138, 0, 1, 1,
0.731633, -0.1756798, 3.328884, 0.5882353, 0, 1, 1,
0.7322798, 0.04306201, 1.009793, 0.5960785, 0, 1, 1,
0.7394213, 0.4312698, 2.57645, 0.6039216, 0, 1, 1,
0.7396207, 1.400444, 0.835641, 0.6078432, 0, 1, 1,
0.7415429, -0.7482007, 0.9257518, 0.6156863, 0, 1, 1,
0.7416096, 0.7820976, 0.1712236, 0.6196079, 0, 1, 1,
0.7458609, -0.7139921, 3.044421, 0.627451, 0, 1, 1,
0.7551208, -0.05884151, 3.302966, 0.6313726, 0, 1, 1,
0.7561704, 0.4542924, 1.543953, 0.6392157, 0, 1, 1,
0.7588832, -0.9016196, 2.936928, 0.6431373, 0, 1, 1,
0.7703707, -1.40584, 3.340907, 0.6509804, 0, 1, 1,
0.773773, -0.3272732, 2.394418, 0.654902, 0, 1, 1,
0.7753863, -0.4487776, 2.107831, 0.6627451, 0, 1, 1,
0.7762888, -0.8681913, 1.858473, 0.6666667, 0, 1, 1,
0.7764412, -2.114967, 1.970247, 0.6745098, 0, 1, 1,
0.7769157, 1.362497, 0.4073685, 0.6784314, 0, 1, 1,
0.7773855, -1.21965, 2.447208, 0.6862745, 0, 1, 1,
0.7808548, 0.378801, -0.1786384, 0.6901961, 0, 1, 1,
0.7809284, 0.9789557, 0.2437473, 0.6980392, 0, 1, 1,
0.7846659, -0.02415193, 1.994538, 0.7058824, 0, 1, 1,
0.7889483, -0.6231067, 3.383466, 0.7098039, 0, 1, 1,
0.7995567, -0.5700669, 1.928398, 0.7176471, 0, 1, 1,
0.8027618, 0.2284859, 1.603473, 0.7215686, 0, 1, 1,
0.8030489, -1.668252, 3.32244, 0.7294118, 0, 1, 1,
0.8099239, 0.6827633, -0.4236478, 0.7333333, 0, 1, 1,
0.8149719, 0.1929419, 2.91645, 0.7411765, 0, 1, 1,
0.8154409, 0.7849717, 1.122569, 0.7450981, 0, 1, 1,
0.8173233, 0.8804805, -0.01353529, 0.7529412, 0, 1, 1,
0.8199775, -1.004936, 2.526071, 0.7568628, 0, 1, 1,
0.8266459, 0.8094546, 1.43424, 0.7647059, 0, 1, 1,
0.8315344, 0.01700463, 1.163973, 0.7686275, 0, 1, 1,
0.8384873, 0.5506998, -0.4942437, 0.7764706, 0, 1, 1,
0.8415475, -0.463961, 2.335413, 0.7803922, 0, 1, 1,
0.8445089, 0.655515, 0.009421046, 0.7882353, 0, 1, 1,
0.846838, 1.613644, -0.1701462, 0.7921569, 0, 1, 1,
0.8494475, 1.735684, -0.4511122, 0.8, 0, 1, 1,
0.8642375, 1.024895, -0.8204229, 0.8078431, 0, 1, 1,
0.8732272, 0.6051813, 1.955624, 0.8117647, 0, 1, 1,
0.8850781, -1.390293, 4.608493, 0.8196079, 0, 1, 1,
0.8854902, 1.127563, 0.6149791, 0.8235294, 0, 1, 1,
0.8992655, 1.510363, -1.149397, 0.8313726, 0, 1, 1,
0.9028608, 0.197248, 0.7420742, 0.8352941, 0, 1, 1,
0.9052531, 0.3178678, 0.9088692, 0.8431373, 0, 1, 1,
0.906997, 1.038039, -0.5370638, 0.8470588, 0, 1, 1,
0.9194546, 1.122881, 1.646797, 0.854902, 0, 1, 1,
0.9289099, 1.478512, 0.4291913, 0.8588235, 0, 1, 1,
0.9307208, 0.3433727, 4.388087, 0.8666667, 0, 1, 1,
0.9321921, 0.3190025, 0.5951107, 0.8705882, 0, 1, 1,
0.9332172, 0.6731222, 0.7549212, 0.8784314, 0, 1, 1,
0.9446409, 0.2683628, 2.684955, 0.8823529, 0, 1, 1,
0.9482837, -0.5956783, 2.609275, 0.8901961, 0, 1, 1,
0.9523078, 1.416826, 1.448352, 0.8941177, 0, 1, 1,
0.9757839, 2.097837, 0.6534228, 0.9019608, 0, 1, 1,
0.9900596, 0.4879216, 0.6769196, 0.9098039, 0, 1, 1,
0.990701, -0.03061746, 0.5948919, 0.9137255, 0, 1, 1,
0.9916915, -0.8701121, 1.416676, 0.9215686, 0, 1, 1,
0.9929275, -0.8864813, 1.790821, 0.9254902, 0, 1, 1,
0.9946463, 0.03819039, 1.182656, 0.9333333, 0, 1, 1,
0.9973106, -0.1787569, 1.743611, 0.9372549, 0, 1, 1,
0.9983125, 0.4612962, 0.7144684, 0.945098, 0, 1, 1,
1.007459, -1.199137, 2.500036, 0.9490196, 0, 1, 1,
1.010857, -0.7863435, 1.971206, 0.9568627, 0, 1, 1,
1.01264, -2.685707, 2.662343, 0.9607843, 0, 1, 1,
1.016371, 0.6930271, -0.3184962, 0.9686275, 0, 1, 1,
1.019008, -0.6617289, 4.185554, 0.972549, 0, 1, 1,
1.019935, -0.6943172, 3.756771, 0.9803922, 0, 1, 1,
1.031494, 1.381778, 0.3687807, 0.9843137, 0, 1, 1,
1.03611, -0.3972239, 2.599219, 0.9921569, 0, 1, 1,
1.043965, -1.038277, 2.060805, 0.9960784, 0, 1, 1,
1.048293, -0.7678519, 0.8275327, 1, 0, 0.9960784, 1,
1.051141, -0.9949135, 1.947433, 1, 0, 0.9882353, 1,
1.056565, -0.02417398, 0.6701922, 1, 0, 0.9843137, 1,
1.0566, 0.05517147, 2.371132, 1, 0, 0.9764706, 1,
1.061319, 0.192845, -0.4652206, 1, 0, 0.972549, 1,
1.062224, -0.07749547, 1.854746, 1, 0, 0.9647059, 1,
1.064631, -0.05405701, 0.09810162, 1, 0, 0.9607843, 1,
1.071536, -0.2248746, 0.1857943, 1, 0, 0.9529412, 1,
1.080831, 0.07281518, 1.022128, 1, 0, 0.9490196, 1,
1.086071, 0.7298778, 0.8723978, 1, 0, 0.9411765, 1,
1.089346, 0.3860517, 1.374671, 1, 0, 0.9372549, 1,
1.092934, -1.50252, 3.796637, 1, 0, 0.9294118, 1,
1.104309, -0.134523, 1.166003, 1, 0, 0.9254902, 1,
1.105154, -1.421482, 1.818201, 1, 0, 0.9176471, 1,
1.10638, 0.06481102, 3.182138, 1, 0, 0.9137255, 1,
1.106415, -1.103632, 1.523039, 1, 0, 0.9058824, 1,
1.113521, 0.4176915, 1.965757, 1, 0, 0.9019608, 1,
1.115783, -0.02235977, 2.20726, 1, 0, 0.8941177, 1,
1.119453, 0.4412547, 0.6596221, 1, 0, 0.8862745, 1,
1.119922, -1.965669, 2.182103, 1, 0, 0.8823529, 1,
1.121209, 1.498672, 1.614737, 1, 0, 0.8745098, 1,
1.136074, 0.7777097, 0.4394035, 1, 0, 0.8705882, 1,
1.1406, -0.3001649, 1.333371, 1, 0, 0.8627451, 1,
1.144849, -1.380541, 2.77613, 1, 0, 0.8588235, 1,
1.14991, -0.4698921, 0.7933704, 1, 0, 0.8509804, 1,
1.154095, 1.250799, 0.8679577, 1, 0, 0.8470588, 1,
1.162204, -0.7044851, 0.9485874, 1, 0, 0.8392157, 1,
1.166564, -0.3054577, 0.549465, 1, 0, 0.8352941, 1,
1.176162, 0.2601647, 2.306472, 1, 0, 0.827451, 1,
1.177022, -0.1340483, 1.226554, 1, 0, 0.8235294, 1,
1.181122, 0.8858478, 1.046988, 1, 0, 0.8156863, 1,
1.181429, -0.9199544, 2.094676, 1, 0, 0.8117647, 1,
1.182929, -0.5693273, 1.291841, 1, 0, 0.8039216, 1,
1.192352, 0.05183162, 1.349586, 1, 0, 0.7960784, 1,
1.196211, 1.024444, 1.267043, 1, 0, 0.7921569, 1,
1.202242, 0.253269, 0.1571901, 1, 0, 0.7843137, 1,
1.204164, 0.219881, 0.9603063, 1, 0, 0.7803922, 1,
1.210618, 1.007038, 2.10684, 1, 0, 0.772549, 1,
1.213329, 2.05317, 0.4316439, 1, 0, 0.7686275, 1,
1.216452, 1.554892, 0.2789747, 1, 0, 0.7607843, 1,
1.227831, 0.2798205, -0.2626995, 1, 0, 0.7568628, 1,
1.231791, -0.2424613, 1.419415, 1, 0, 0.7490196, 1,
1.23241, -0.06287356, 0.3244525, 1, 0, 0.7450981, 1,
1.235663, -0.2579302, 1.95085, 1, 0, 0.7372549, 1,
1.248162, -0.07947741, 1.29021, 1, 0, 0.7333333, 1,
1.251555, 0.6228313, 0.5305704, 1, 0, 0.7254902, 1,
1.264439, 1.506929, 2.025275, 1, 0, 0.7215686, 1,
1.266047, 0.9853081, 0.8290495, 1, 0, 0.7137255, 1,
1.273079, 1.070853, 0.2022666, 1, 0, 0.7098039, 1,
1.280928, -0.5594138, 2.985716, 1, 0, 0.7019608, 1,
1.282541, -0.4062428, 3.398167, 1, 0, 0.6941177, 1,
1.282645, 0.4148601, 1.545846, 1, 0, 0.6901961, 1,
1.283225, -1.796717, 3.991879, 1, 0, 0.682353, 1,
1.284848, -1.33676, 3.248038, 1, 0, 0.6784314, 1,
1.285523, -0.2192144, 0.05707712, 1, 0, 0.6705883, 1,
1.296046, -0.3690707, 1.158463, 1, 0, 0.6666667, 1,
1.297752, 0.5199038, 0.4120935, 1, 0, 0.6588235, 1,
1.300627, -0.08886077, 2.157841, 1, 0, 0.654902, 1,
1.310514, -0.4174196, 2.368478, 1, 0, 0.6470588, 1,
1.313765, -0.1322766, 1.954446, 1, 0, 0.6431373, 1,
1.325782, 0.6656646, 3.844941, 1, 0, 0.6352941, 1,
1.328229, -0.9244547, 0.09163325, 1, 0, 0.6313726, 1,
1.329657, -1.047546, 1.19837, 1, 0, 0.6235294, 1,
1.335751, -0.254551, 1.905036, 1, 0, 0.6196079, 1,
1.335939, 0.2021991, -0.001675041, 1, 0, 0.6117647, 1,
1.339166, 0.5740604, 1.747932, 1, 0, 0.6078432, 1,
1.34578, 0.1777688, -0.7510156, 1, 0, 0.6, 1,
1.353594, 1.357614, 1.437488, 1, 0, 0.5921569, 1,
1.354322, 1.833241, 0.8618367, 1, 0, 0.5882353, 1,
1.360473, 0.3914984, 1.116828, 1, 0, 0.5803922, 1,
1.36087, 0.5673975, 1.673222, 1, 0, 0.5764706, 1,
1.363203, 0.2402183, -1.381045, 1, 0, 0.5686275, 1,
1.384038, 0.279515, -0.4466148, 1, 0, 0.5647059, 1,
1.388833, 1.408241, -1.462757, 1, 0, 0.5568628, 1,
1.392659, 1.23038, 0.9414669, 1, 0, 0.5529412, 1,
1.394223, 0.07550603, 2.081996, 1, 0, 0.5450981, 1,
1.394474, -0.7740791, 0.6606581, 1, 0, 0.5411765, 1,
1.401232, 0.3000294, 2.250223, 1, 0, 0.5333334, 1,
1.409738, 0.885872, 0.7860809, 1, 0, 0.5294118, 1,
1.423652, 1.320255, 0.2870058, 1, 0, 0.5215687, 1,
1.426738, 0.4371181, 0.05312436, 1, 0, 0.5176471, 1,
1.427356, -1.24452, 2.262476, 1, 0, 0.509804, 1,
1.428234, -1.830467, 3.007181, 1, 0, 0.5058824, 1,
1.432127, -0.1469453, 2.622985, 1, 0, 0.4980392, 1,
1.436245, 0.2582009, 0.2595033, 1, 0, 0.4901961, 1,
1.475974, -0.6166775, 1.072746, 1, 0, 0.4862745, 1,
1.477188, 1.344631, 3.210565, 1, 0, 0.4784314, 1,
1.493327, 1.016225, 0.1757975, 1, 0, 0.4745098, 1,
1.496036, -0.7764639, 2.711725, 1, 0, 0.4666667, 1,
1.499273, 1.104101, 1.406679, 1, 0, 0.4627451, 1,
1.4997, -2.064188, 2.27569, 1, 0, 0.454902, 1,
1.504568, 0.9662497, 2.259807, 1, 0, 0.4509804, 1,
1.507125, 0.7989311, 0.5715379, 1, 0, 0.4431373, 1,
1.511019, -0.6608671, 1.537941, 1, 0, 0.4392157, 1,
1.511264, -0.02714133, 1.715532, 1, 0, 0.4313726, 1,
1.519741, -0.694102, 2.453416, 1, 0, 0.427451, 1,
1.535615, -0.0499657, 1.266643, 1, 0, 0.4196078, 1,
1.54033, 0.8588482, 2.519381, 1, 0, 0.4156863, 1,
1.552999, -0.697947, 3.59645, 1, 0, 0.4078431, 1,
1.5534, -1.882681, 3.100979, 1, 0, 0.4039216, 1,
1.554512, 0.6526244, -0.206247, 1, 0, 0.3960784, 1,
1.572003, -1.460569, 2.584181, 1, 0, 0.3882353, 1,
1.578738, -0.06691077, 2.830493, 1, 0, 0.3843137, 1,
1.581592, -0.5384744, 1.166263, 1, 0, 0.3764706, 1,
1.591324, 1.424965, 1.156484, 1, 0, 0.372549, 1,
1.599862, -2.284076, 3.784592, 1, 0, 0.3647059, 1,
1.605294, -0.475598, 1.964574, 1, 0, 0.3607843, 1,
1.607318, 0.9695296, 1.620144, 1, 0, 0.3529412, 1,
1.620782, -1.265933, 1.773143, 1, 0, 0.3490196, 1,
1.629734, 1.267943, 1.372282, 1, 0, 0.3411765, 1,
1.642009, 0.9918724, 0.1425385, 1, 0, 0.3372549, 1,
1.645271, -0.5170853, 0.6706908, 1, 0, 0.3294118, 1,
1.646729, -1.531056, 1.386949, 1, 0, 0.3254902, 1,
1.655799, -0.126918, 1.576691, 1, 0, 0.3176471, 1,
1.666827, -0.01813963, 1.207108, 1, 0, 0.3137255, 1,
1.670018, -1.400812, 1.863354, 1, 0, 0.3058824, 1,
1.682159, 0.02877142, 2.084482, 1, 0, 0.2980392, 1,
1.682275, 1.008084, 0.9001215, 1, 0, 0.2941177, 1,
1.682905, -0.2505692, 3.609015, 1, 0, 0.2862745, 1,
1.686689, 0.7727764, -0.4639429, 1, 0, 0.282353, 1,
1.696422, 1.481268, 1.421041, 1, 0, 0.2745098, 1,
1.702769, -0.4985542, 0.2323714, 1, 0, 0.2705882, 1,
1.704042, -1.623176, 1.090536, 1, 0, 0.2627451, 1,
1.706488, 0.4188035, 2.967821, 1, 0, 0.2588235, 1,
1.723623, -0.4446259, 0.8219317, 1, 0, 0.2509804, 1,
1.727662, 0.8315045, -0.5947784, 1, 0, 0.2470588, 1,
1.72825, -0.8164597, 3.764814, 1, 0, 0.2392157, 1,
1.74524, 1.727678, 0.8354447, 1, 0, 0.2352941, 1,
1.752992, -0.4899678, 1.735502, 1, 0, 0.227451, 1,
1.766879, -1.175156, 0.6011236, 1, 0, 0.2235294, 1,
1.767308, 1.202987, 0.6051744, 1, 0, 0.2156863, 1,
1.775232, -1.201893, 2.382451, 1, 0, 0.2117647, 1,
1.779176, -1.071419, 2.331182, 1, 0, 0.2039216, 1,
1.792949, 1.25925, 2.124521, 1, 0, 0.1960784, 1,
1.800089, 0.2297211, 2.039148, 1, 0, 0.1921569, 1,
1.834099, -0.3009119, 1.650098, 1, 0, 0.1843137, 1,
1.84079, -1.360659, 0.03589415, 1, 0, 0.1803922, 1,
1.92707, 0.9198543, -0.01438371, 1, 0, 0.172549, 1,
1.930021, -2.324135, 3.327783, 1, 0, 0.1686275, 1,
1.938994, -1.139504, 1.418676, 1, 0, 0.1607843, 1,
1.941342, 0.8680988, 1.330855, 1, 0, 0.1568628, 1,
1.955963, 1.497952, 2.040156, 1, 0, 0.1490196, 1,
1.967542, 0.06181332, 1.752586, 1, 0, 0.145098, 1,
1.993923, -1.921464, 2.654659, 1, 0, 0.1372549, 1,
2.000853, 0.4183943, 1.085284, 1, 0, 0.1333333, 1,
2.005316, -0.9141389, 0.8427589, 1, 0, 0.1254902, 1,
2.053873, 0.2530525, -0.1421057, 1, 0, 0.1215686, 1,
2.178271, -0.7437662, 0.9680727, 1, 0, 0.1137255, 1,
2.186925, 1.199369, 2.334113, 1, 0, 0.1098039, 1,
2.199179, -0.08570889, 0.8858164, 1, 0, 0.1019608, 1,
2.210249, -0.8891919, 3.207172, 1, 0, 0.09411765, 1,
2.213825, 0.02970004, 0.2665037, 1, 0, 0.09019608, 1,
2.252952, 1.489357, 0.2243541, 1, 0, 0.08235294, 1,
2.256145, -1.877455, 1.723356, 1, 0, 0.07843138, 1,
2.292728, 1.245958, 2.296014, 1, 0, 0.07058824, 1,
2.412994, -2.285389, 1.11349, 1, 0, 0.06666667, 1,
2.426275, -1.250895, 2.440032, 1, 0, 0.05882353, 1,
2.429499, 0.1965166, 2.150725, 1, 0, 0.05490196, 1,
2.436748, -0.4628337, 1.654094, 1, 0, 0.04705882, 1,
2.477584, -0.7674911, 0.6057122, 1, 0, 0.04313726, 1,
2.499594, 0.5817839, 1.200728, 1, 0, 0.03529412, 1,
2.700929, 0.399061, 0.7437289, 1, 0, 0.03137255, 1,
2.904379, 0.4538181, 0.5062174, 1, 0, 0.02352941, 1,
2.958078, -0.9281002, -0.04473846, 1, 0, 0.01960784, 1,
3.17032, -1.117048, 0.7789443, 1, 0, 0.01176471, 1,
3.426682, -0.9989038, 0.4287364, 1, 0, 0.007843138, 1
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
0.02461731, -4.898795, -6.77, 0, -0.5, 0.5, 0.5,
0.02461731, -4.898795, -6.77, 1, -0.5, 0.5, 0.5,
0.02461731, -4.898795, -6.77, 1, 1.5, 0.5, 0.5,
0.02461731, -4.898795, -6.77, 0, 1.5, 0.5, 0.5
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
-4.530747, -0.445845, -6.77, 0, -0.5, 0.5, 0.5,
-4.530747, -0.445845, -6.77, 1, -0.5, 0.5, 0.5,
-4.530747, -0.445845, -6.77, 1, 1.5, 0.5, 0.5,
-4.530747, -0.445845, -6.77, 0, 1.5, 0.5, 0.5
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
-4.530747, -4.898795, -0.08259988, 0, -0.5, 0.5, 0.5,
-4.530747, -4.898795, -0.08259988, 1, -0.5, 0.5, 0.5,
-4.530747, -4.898795, -0.08259988, 1, 1.5, 0.5, 0.5,
-4.530747, -4.898795, -0.08259988, 0, 1.5, 0.5, 0.5
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
-3, -3.871191, -5.226754,
3, -3.871191, -5.226754,
-3, -3.871191, -5.226754,
-3, -4.042458, -5.483962,
-2, -3.871191, -5.226754,
-2, -4.042458, -5.483962,
-1, -3.871191, -5.226754,
-1, -4.042458, -5.483962,
0, -3.871191, -5.226754,
0, -4.042458, -5.483962,
1, -3.871191, -5.226754,
1, -4.042458, -5.483962,
2, -3.871191, -5.226754,
2, -4.042458, -5.483962,
3, -3.871191, -5.226754,
3, -4.042458, -5.483962
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
-3, -4.384993, -5.998377, 0, -0.5, 0.5, 0.5,
-3, -4.384993, -5.998377, 1, -0.5, 0.5, 0.5,
-3, -4.384993, -5.998377, 1, 1.5, 0.5, 0.5,
-3, -4.384993, -5.998377, 0, 1.5, 0.5, 0.5,
-2, -4.384993, -5.998377, 0, -0.5, 0.5, 0.5,
-2, -4.384993, -5.998377, 1, -0.5, 0.5, 0.5,
-2, -4.384993, -5.998377, 1, 1.5, 0.5, 0.5,
-2, -4.384993, -5.998377, 0, 1.5, 0.5, 0.5,
-1, -4.384993, -5.998377, 0, -0.5, 0.5, 0.5,
-1, -4.384993, -5.998377, 1, -0.5, 0.5, 0.5,
-1, -4.384993, -5.998377, 1, 1.5, 0.5, 0.5,
-1, -4.384993, -5.998377, 0, 1.5, 0.5, 0.5,
0, -4.384993, -5.998377, 0, -0.5, 0.5, 0.5,
0, -4.384993, -5.998377, 1, -0.5, 0.5, 0.5,
0, -4.384993, -5.998377, 1, 1.5, 0.5, 0.5,
0, -4.384993, -5.998377, 0, 1.5, 0.5, 0.5,
1, -4.384993, -5.998377, 0, -0.5, 0.5, 0.5,
1, -4.384993, -5.998377, 1, -0.5, 0.5, 0.5,
1, -4.384993, -5.998377, 1, 1.5, 0.5, 0.5,
1, -4.384993, -5.998377, 0, 1.5, 0.5, 0.5,
2, -4.384993, -5.998377, 0, -0.5, 0.5, 0.5,
2, -4.384993, -5.998377, 1, -0.5, 0.5, 0.5,
2, -4.384993, -5.998377, 1, 1.5, 0.5, 0.5,
2, -4.384993, -5.998377, 0, 1.5, 0.5, 0.5,
3, -4.384993, -5.998377, 0, -0.5, 0.5, 0.5,
3, -4.384993, -5.998377, 1, -0.5, 0.5, 0.5,
3, -4.384993, -5.998377, 1, 1.5, 0.5, 0.5,
3, -4.384993, -5.998377, 0, 1.5, 0.5, 0.5
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
-3.479509, -3, -5.226754,
-3.479509, 2, -5.226754,
-3.479509, -3, -5.226754,
-3.654715, -3, -5.483962,
-3.479509, -2, -5.226754,
-3.654715, -2, -5.483962,
-3.479509, -1, -5.226754,
-3.654715, -1, -5.483962,
-3.479509, 0, -5.226754,
-3.654715, 0, -5.483962,
-3.479509, 1, -5.226754,
-3.654715, 1, -5.483962,
-3.479509, 2, -5.226754,
-3.654715, 2, -5.483962
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
-4.005128, -3, -5.998377, 0, -0.5, 0.5, 0.5,
-4.005128, -3, -5.998377, 1, -0.5, 0.5, 0.5,
-4.005128, -3, -5.998377, 1, 1.5, 0.5, 0.5,
-4.005128, -3, -5.998377, 0, 1.5, 0.5, 0.5,
-4.005128, -2, -5.998377, 0, -0.5, 0.5, 0.5,
-4.005128, -2, -5.998377, 1, -0.5, 0.5, 0.5,
-4.005128, -2, -5.998377, 1, 1.5, 0.5, 0.5,
-4.005128, -2, -5.998377, 0, 1.5, 0.5, 0.5,
-4.005128, -1, -5.998377, 0, -0.5, 0.5, 0.5,
-4.005128, -1, -5.998377, 1, -0.5, 0.5, 0.5,
-4.005128, -1, -5.998377, 1, 1.5, 0.5, 0.5,
-4.005128, -1, -5.998377, 0, 1.5, 0.5, 0.5,
-4.005128, 0, -5.998377, 0, -0.5, 0.5, 0.5,
-4.005128, 0, -5.998377, 1, -0.5, 0.5, 0.5,
-4.005128, 0, -5.998377, 1, 1.5, 0.5, 0.5,
-4.005128, 0, -5.998377, 0, 1.5, 0.5, 0.5,
-4.005128, 1, -5.998377, 0, -0.5, 0.5, 0.5,
-4.005128, 1, -5.998377, 1, -0.5, 0.5, 0.5,
-4.005128, 1, -5.998377, 1, 1.5, 0.5, 0.5,
-4.005128, 1, -5.998377, 0, 1.5, 0.5, 0.5,
-4.005128, 2, -5.998377, 0, -0.5, 0.5, 0.5,
-4.005128, 2, -5.998377, 1, -0.5, 0.5, 0.5,
-4.005128, 2, -5.998377, 1, 1.5, 0.5, 0.5,
-4.005128, 2, -5.998377, 0, 1.5, 0.5, 0.5
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
-3.479509, -3.871191, -4,
-3.479509, -3.871191, 4,
-3.479509, -3.871191, -4,
-3.654715, -4.042458, -4,
-3.479509, -3.871191, -2,
-3.654715, -4.042458, -2,
-3.479509, -3.871191, 0,
-3.654715, -4.042458, 0,
-3.479509, -3.871191, 2,
-3.654715, -4.042458, 2,
-3.479509, -3.871191, 4,
-3.654715, -4.042458, 4
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
-4.005128, -4.384993, -4, 0, -0.5, 0.5, 0.5,
-4.005128, -4.384993, -4, 1, -0.5, 0.5, 0.5,
-4.005128, -4.384993, -4, 1, 1.5, 0.5, 0.5,
-4.005128, -4.384993, -4, 0, 1.5, 0.5, 0.5,
-4.005128, -4.384993, -2, 0, -0.5, 0.5, 0.5,
-4.005128, -4.384993, -2, 1, -0.5, 0.5, 0.5,
-4.005128, -4.384993, -2, 1, 1.5, 0.5, 0.5,
-4.005128, -4.384993, -2, 0, 1.5, 0.5, 0.5,
-4.005128, -4.384993, 0, 0, -0.5, 0.5, 0.5,
-4.005128, -4.384993, 0, 1, -0.5, 0.5, 0.5,
-4.005128, -4.384993, 0, 1, 1.5, 0.5, 0.5,
-4.005128, -4.384993, 0, 0, 1.5, 0.5, 0.5,
-4.005128, -4.384993, 2, 0, -0.5, 0.5, 0.5,
-4.005128, -4.384993, 2, 1, -0.5, 0.5, 0.5,
-4.005128, -4.384993, 2, 1, 1.5, 0.5, 0.5,
-4.005128, -4.384993, 2, 0, 1.5, 0.5, 0.5,
-4.005128, -4.384993, 4, 0, -0.5, 0.5, 0.5,
-4.005128, -4.384993, 4, 1, -0.5, 0.5, 0.5,
-4.005128, -4.384993, 4, 1, 1.5, 0.5, 0.5,
-4.005128, -4.384993, 4, 0, 1.5, 0.5, 0.5
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
-3.479509, -3.871191, -5.226754,
-3.479509, 2.979501, -5.226754,
-3.479509, -3.871191, 5.061554,
-3.479509, 2.979501, 5.061554,
-3.479509, -3.871191, -5.226754,
-3.479509, -3.871191, 5.061554,
-3.479509, 2.979501, -5.226754,
-3.479509, 2.979501, 5.061554,
-3.479509, -3.871191, -5.226754,
3.528744, -3.871191, -5.226754,
-3.479509, -3.871191, 5.061554,
3.528744, -3.871191, 5.061554,
-3.479509, 2.979501, -5.226754,
3.528744, 2.979501, -5.226754,
-3.479509, 2.979501, 5.061554,
3.528744, 2.979501, 5.061554,
3.528744, -3.871191, -5.226754,
3.528744, 2.979501, -5.226754,
3.528744, -3.871191, 5.061554,
3.528744, 2.979501, 5.061554,
3.528744, -3.871191, -5.226754,
3.528744, -3.871191, 5.061554,
3.528744, 2.979501, -5.226754,
3.528744, 2.979501, 5.061554
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
var radius = 7.587353;
var distance = 33.75698;
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
mvMatrix.translate( -0.02461731, 0.445845, 0.08259988 );
mvMatrix.scale( 1.170562, 1.197484, 0.7973706 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.75698);
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
halfenprox<-read.table("halfenprox.xyz")
```

```
## Error in read.table("halfenprox.xyz"): no lines available in input
```

```r
x<-halfenprox$V2
```

```
## Error in eval(expr, envir, enclos): object 'halfenprox' not found
```

```r
y<-halfenprox$V3
```

```
## Error in eval(expr, envir, enclos): object 'halfenprox' not found
```

```r
z<-halfenprox$V4
```

```
## Error in eval(expr, envir, enclos): object 'halfenprox' not found
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
-3.377447, 0.432307, -0.703788, 0, 0, 1, 1, 1,
-3.238711, 0.3119332, -1.077551, 1, 0, 0, 1, 1,
-2.714126, 0.7928543, -2.595319, 1, 0, 0, 1, 1,
-2.645456, 0.5743282, -2.64317, 1, 0, 0, 1, 1,
-2.530623, 0.4644425, -2.77628, 1, 0, 0, 1, 1,
-2.471403, -1.110748, -2.498255, 1, 0, 0, 1, 1,
-2.434037, -0.01635629, -1.188483, 0, 0, 0, 1, 1,
-2.319194, 0.2165984, -2.666055, 0, 0, 0, 1, 1,
-2.314024, 0.4648465, -3.27195, 0, 0, 0, 1, 1,
-2.22255, -0.1328718, -3.005096, 0, 0, 0, 1, 1,
-2.183805, -0.6991852, -0.5675536, 0, 0, 0, 1, 1,
-2.163308, 0.3490267, -0.9692989, 0, 0, 0, 1, 1,
-2.086627, -0.4429994, -1.965442, 0, 0, 0, 1, 1,
-2.081811, -0.1917899, -0.1453185, 1, 1, 1, 1, 1,
-2.078076, -0.8342764, -0.9318552, 1, 1, 1, 1, 1,
-2.07376, -1.048498, -0.8718987, 1, 1, 1, 1, 1,
-2.060413, 0.4761416, -1.947724, 1, 1, 1, 1, 1,
-2.051522, 1.078485, -2.951711, 1, 1, 1, 1, 1,
-2.007641, 1.111722, -1.273639, 1, 1, 1, 1, 1,
-1.958326, -0.2596472, 0.0408279, 1, 1, 1, 1, 1,
-1.957645, 0.8427014, -0.678651, 1, 1, 1, 1, 1,
-1.936079, 0.2864113, -1.035271, 1, 1, 1, 1, 1,
-1.930548, -0.4875625, -3.469218, 1, 1, 1, 1, 1,
-1.927814, -1.163247, -1.546162, 1, 1, 1, 1, 1,
-1.919892, 0.4768026, -1.26359, 1, 1, 1, 1, 1,
-1.913932, -0.04968854, -1.728484, 1, 1, 1, 1, 1,
-1.879855, 1.564318, -0.7797869, 1, 1, 1, 1, 1,
-1.855385, 1.807847, -1.500316, 1, 1, 1, 1, 1,
-1.849833, 0.6542773, -2.472049, 0, 0, 1, 1, 1,
-1.839321, -0.3289625, -2.699924, 1, 0, 0, 1, 1,
-1.810576, 2.879734, 0.1643567, 1, 0, 0, 1, 1,
-1.803691, -0.5801739, -0.7096202, 1, 0, 0, 1, 1,
-1.789366, 0.7309048, -0.3948234, 1, 0, 0, 1, 1,
-1.789122, 0.6338196, -1.435936, 1, 0, 0, 1, 1,
-1.766748, -0.8831341, -1.942542, 0, 0, 0, 1, 1,
-1.766676, 1.191916, 0.734667, 0, 0, 0, 1, 1,
-1.750594, 1.168344, -1.434945, 0, 0, 0, 1, 1,
-1.749048, 0.8621825, 0.2814792, 0, 0, 0, 1, 1,
-1.746098, -0.1084198, -1.643041, 0, 0, 0, 1, 1,
-1.723922, 0.8714104, -1.668047, 0, 0, 0, 1, 1,
-1.719722, -0.09676711, -0.9146706, 0, 0, 0, 1, 1,
-1.710342, 1.684569, 0.1044324, 1, 1, 1, 1, 1,
-1.698662, 0.2220758, -1.000711, 1, 1, 1, 1, 1,
-1.696677, -0.3280911, -0.4308557, 1, 1, 1, 1, 1,
-1.654134, -1.38829, -3.065762, 1, 1, 1, 1, 1,
-1.652728, 0.3938573, -1.160078, 1, 1, 1, 1, 1,
-1.645017, -0.8820462, -3.302516, 1, 1, 1, 1, 1,
-1.630278, -2.264697, -1.72437, 1, 1, 1, 1, 1,
-1.626472, -1.010124, -1.926463, 1, 1, 1, 1, 1,
-1.616085, -1.267434, -2.124269, 1, 1, 1, 1, 1,
-1.585231, -0.3588149, -2.321978, 1, 1, 1, 1, 1,
-1.584864, -1.040169, -1.603428, 1, 1, 1, 1, 1,
-1.583545, -0.2307325, -1.201953, 1, 1, 1, 1, 1,
-1.554822, -0.1047739, -2.822341, 1, 1, 1, 1, 1,
-1.552382, 1.084817, -0.4211795, 1, 1, 1, 1, 1,
-1.552306, -0.02230361, -0.743903, 1, 1, 1, 1, 1,
-1.54936, -0.09629833, -2.23332, 0, 0, 1, 1, 1,
-1.534277, 0.6645181, -2.255523, 1, 0, 0, 1, 1,
-1.533982, 0.1738679, -1.776266, 1, 0, 0, 1, 1,
-1.527761, 0.8372948, -2.848552, 1, 0, 0, 1, 1,
-1.513964, 0.2592446, -2.404647, 1, 0, 0, 1, 1,
-1.505038, 0.1617589, -1.150756, 1, 0, 0, 1, 1,
-1.491688, 0.1536186, -2.032578, 0, 0, 0, 1, 1,
-1.486375, 0.3308597, -0.1974061, 0, 0, 0, 1, 1,
-1.462058, -1.751001, -2.803234, 0, 0, 0, 1, 1,
-1.459697, 0.02090268, -2.944951, 0, 0, 0, 1, 1,
-1.454178, 0.1482621, -2.513161, 0, 0, 0, 1, 1,
-1.446892, 0.1823161, -2.35497, 0, 0, 0, 1, 1,
-1.445673, -0.8460811, -0.7392428, 0, 0, 0, 1, 1,
-1.437168, 1.176046, -2.713646, 1, 1, 1, 1, 1,
-1.435286, 0.2806051, -1.663296, 1, 1, 1, 1, 1,
-1.423356, 0.9606836, -1.33652, 1, 1, 1, 1, 1,
-1.416979, -1.053628, -1.025769, 1, 1, 1, 1, 1,
-1.408157, 1.324434, -3.111086, 1, 1, 1, 1, 1,
-1.406139, -1.933864, -2.37927, 1, 1, 1, 1, 1,
-1.40577, 1.448754, 0.1654672, 1, 1, 1, 1, 1,
-1.403977, -0.2363399, -2.310935, 1, 1, 1, 1, 1,
-1.398737, -0.3697432, -1.379387, 1, 1, 1, 1, 1,
-1.395844, -1.409252, -2.306253, 1, 1, 1, 1, 1,
-1.392176, -0.4226126, -1.114056, 1, 1, 1, 1, 1,
-1.389794, 0.5862011, 0.9361508, 1, 1, 1, 1, 1,
-1.379343, 0.02224712, 1.002762, 1, 1, 1, 1, 1,
-1.375801, 0.593091, -0.6080789, 1, 1, 1, 1, 1,
-1.37365, 1.491574, -0.4165239, 1, 1, 1, 1, 1,
-1.371685, -1.0643, -2.499199, 0, 0, 1, 1, 1,
-1.367874, -0.203308, -0.859068, 1, 0, 0, 1, 1,
-1.341178, -2.112365, -0.6735106, 1, 0, 0, 1, 1,
-1.330652, -0.193342, -2.805251, 1, 0, 0, 1, 1,
-1.328737, 2.484685, 0.3774424, 1, 0, 0, 1, 1,
-1.308699, 0.3374982, -0.06478062, 1, 0, 0, 1, 1,
-1.308045, 0.4851848, -1.243051, 0, 0, 0, 1, 1,
-1.302583, -0.395682, -0.8226686, 0, 0, 0, 1, 1,
-1.300198, -0.5043852, -2.607592, 0, 0, 0, 1, 1,
-1.292534, 0.7630298, -1.729472, 0, 0, 0, 1, 1,
-1.285121, -0.8535905, -3.166093, 0, 0, 0, 1, 1,
-1.282768, 0.4835034, 0.4195886, 0, 0, 0, 1, 1,
-1.279568, 0.1494363, 0.123999, 0, 0, 0, 1, 1,
-1.27136, -1.548549, -3.25826, 1, 1, 1, 1, 1,
-1.26878, -0.03659348, -1.245205, 1, 1, 1, 1, 1,
-1.265517, 1.035432, -2.791974, 1, 1, 1, 1, 1,
-1.257761, 0.8133881, -0.4960446, 1, 1, 1, 1, 1,
-1.253739, 0.4010928, -0.2071494, 1, 1, 1, 1, 1,
-1.25141, -0.6686711, -2.543919, 1, 1, 1, 1, 1,
-1.249587, 0.1048638, -1.621421, 1, 1, 1, 1, 1,
-1.248071, -0.9902169, -1.825122, 1, 1, 1, 1, 1,
-1.244861, -0.3730164, -2.456151, 1, 1, 1, 1, 1,
-1.234647, 1.008345, -2.018843, 1, 1, 1, 1, 1,
-1.234596, -0.4517033, -1.461494, 1, 1, 1, 1, 1,
-1.228434, 0.3800812, -2.728207, 1, 1, 1, 1, 1,
-1.228337, -0.9299693, -2.955941, 1, 1, 1, 1, 1,
-1.225309, -0.2716754, -0.5263801, 1, 1, 1, 1, 1,
-1.224815, 0.1365327, -2.382726, 1, 1, 1, 1, 1,
-1.220448, 0.678744, -0.3047799, 0, 0, 1, 1, 1,
-1.218195, 0.0467233, -0.5634274, 1, 0, 0, 1, 1,
-1.215595, 1.733142, -0.5872139, 1, 0, 0, 1, 1,
-1.207152, -0.5883972, -0.9387059, 1, 0, 0, 1, 1,
-1.206736, -2.471774, -2.287671, 1, 0, 0, 1, 1,
-1.197225, -0.2769286, -1.295417, 1, 0, 0, 1, 1,
-1.197138, -0.1222318, -1.479126, 0, 0, 0, 1, 1,
-1.190615, 0.9106495, -1.221383, 0, 0, 0, 1, 1,
-1.189556, 0.3905239, -0.904726, 0, 0, 0, 1, 1,
-1.184419, -0.2016175, -2.440948, 0, 0, 0, 1, 1,
-1.168433, -1.094195, -0.6666482, 0, 0, 0, 1, 1,
-1.16633, -0.393419, -3.898859, 0, 0, 0, 1, 1,
-1.162109, -1.698849, -2.611943, 0, 0, 0, 1, 1,
-1.153236, -0.4301054, -3.460454, 1, 1, 1, 1, 1,
-1.153041, -1.522316, -2.047478, 1, 1, 1, 1, 1,
-1.152962, 0.3488899, -1.06581, 1, 1, 1, 1, 1,
-1.149447, -0.4232458, 1.173472, 1, 1, 1, 1, 1,
-1.14116, -1.227798, -2.434095, 1, 1, 1, 1, 1,
-1.136214, -0.2732094, -1.739951, 1, 1, 1, 1, 1,
-1.135501, 0.932902, -2.632481, 1, 1, 1, 1, 1,
-1.134364, -0.5769064, -2.210812, 1, 1, 1, 1, 1,
-1.132233, 0.9671347, -0.01823139, 1, 1, 1, 1, 1,
-1.131261, -0.4062937, -2.854134, 1, 1, 1, 1, 1,
-1.125737, 0.9538075, -1.104785, 1, 1, 1, 1, 1,
-1.123893, -0.4360395, -1.013058, 1, 1, 1, 1, 1,
-1.108446, -0.8510596, -2.437326, 1, 1, 1, 1, 1,
-1.105671, 0.3278105, -2.245718, 1, 1, 1, 1, 1,
-1.098689, -0.04854268, -0.4322761, 1, 1, 1, 1, 1,
-1.095361, -1.19049, -3.044317, 0, 0, 1, 1, 1,
-1.091522, -1.091814, -1.289002, 1, 0, 0, 1, 1,
-1.088264, -1.440078, -3.07671, 1, 0, 0, 1, 1,
-1.087964, 0.04241617, -1.854836, 1, 0, 0, 1, 1,
-1.080503, 0.9924492, -1.66381, 1, 0, 0, 1, 1,
-1.078359, 1.473673, -1.516001, 1, 0, 0, 1, 1,
-1.076763, 0.2806551, -1.797091, 0, 0, 0, 1, 1,
-1.0721, 0.1695776, -0.01832808, 0, 0, 0, 1, 1,
-1.069655, -1.007204, -3.504304, 0, 0, 0, 1, 1,
-1.068996, 0.5144421, -1.611685, 0, 0, 0, 1, 1,
-1.068478, -0.4610645, -3.133312, 0, 0, 0, 1, 1,
-1.05907, 0.9069022, -0.34646, 0, 0, 0, 1, 1,
-1.043895, -1.836122, -0.7638304, 0, 0, 0, 1, 1,
-1.043615, 0.1693518, 0.3117477, 1, 1, 1, 1, 1,
-1.040938, 0.7989001, -1.158851, 1, 1, 1, 1, 1,
-1.040224, -0.7878671, -3.197489, 1, 1, 1, 1, 1,
-1.039853, -0.1059594, -2.086489, 1, 1, 1, 1, 1,
-1.036693, -0.943003, -0.9698882, 1, 1, 1, 1, 1,
-1.036617, 0.3557414, -1.208459, 1, 1, 1, 1, 1,
-1.031815, 1.481132, -0.5046459, 1, 1, 1, 1, 1,
-1.031272, -0.45518, -1.603191, 1, 1, 1, 1, 1,
-1.030997, -1.288572, -2.848825, 1, 1, 1, 1, 1,
-1.029099, 0.1885752, -1.955048, 1, 1, 1, 1, 1,
-1.023951, 0.2059653, -0.9384013, 1, 1, 1, 1, 1,
-1.017355, -0.2788529, -4.032615, 1, 1, 1, 1, 1,
-1.0107, -0.1319401, -0.5788292, 1, 1, 1, 1, 1,
-1.006344, -0.0950394, -1.533124, 1, 1, 1, 1, 1,
-0.9948705, -0.7450932, -1.979053, 1, 1, 1, 1, 1,
-0.9941412, -0.6181763, -2.640751, 0, 0, 1, 1, 1,
-0.9839634, 0.8557422, -1.102412, 1, 0, 0, 1, 1,
-0.9832464, -0.2465457, -2.370151, 1, 0, 0, 1, 1,
-0.9727606, -1.456816, -3.734282, 1, 0, 0, 1, 1,
-0.9709436, 1.230976, -3.079786, 1, 0, 0, 1, 1,
-0.9606804, 1.293084, -0.5785467, 1, 0, 0, 1, 1,
-0.9523647, 1.83527, -1.264517, 0, 0, 0, 1, 1,
-0.9475625, 0.3598226, -1.752882, 0, 0, 0, 1, 1,
-0.9468039, -0.7885182, -3.273952, 0, 0, 0, 1, 1,
-0.9449348, 1.321105, -1.530722, 0, 0, 0, 1, 1,
-0.9436514, -1.114606, -2.383386, 0, 0, 0, 1, 1,
-0.9384873, -0.8413497, -2.267536, 0, 0, 0, 1, 1,
-0.9341229, -0.06826907, -2.282197, 0, 0, 0, 1, 1,
-0.9331121, 1.385684, -0.4108376, 1, 1, 1, 1, 1,
-0.9309928, -0.5931997, -2.51309, 1, 1, 1, 1, 1,
-0.9265823, -0.2964098, -1.101529, 1, 1, 1, 1, 1,
-0.9236068, -0.6726439, -2.700428, 1, 1, 1, 1, 1,
-0.9227968, -0.7298332, -2.619858, 1, 1, 1, 1, 1,
-0.9196783, -0.1932489, -2.58279, 1, 1, 1, 1, 1,
-0.9152873, 0.2804587, -0.0818182, 1, 1, 1, 1, 1,
-0.9149515, -0.1213721, -3.075289, 1, 1, 1, 1, 1,
-0.9129671, -1.982709, -2.953025, 1, 1, 1, 1, 1,
-0.908909, 0.0112877, -0.6485648, 1, 1, 1, 1, 1,
-0.9088348, -0.6116338, -1.947456, 1, 1, 1, 1, 1,
-0.9028372, 0.679616, -1.100457, 1, 1, 1, 1, 1,
-0.897239, 1.271381, -0.5180552, 1, 1, 1, 1, 1,
-0.8949053, 0.2998443, -0.926609, 1, 1, 1, 1, 1,
-0.8927449, 0.5301397, -0.9962773, 1, 1, 1, 1, 1,
-0.8919694, 1.949019, -0.7136988, 0, 0, 1, 1, 1,
-0.8877142, -1.086827, -1.758106, 1, 0, 0, 1, 1,
-0.8814291, 0.8530272, 0.6552302, 1, 0, 0, 1, 1,
-0.877439, -2.60578, -4.361279, 1, 0, 0, 1, 1,
-0.8766421, -0.09526888, -1.876339, 1, 0, 0, 1, 1,
-0.8708683, 0.815141, -0.1552281, 1, 0, 0, 1, 1,
-0.8688813, -0.02974342, 0.1563738, 0, 0, 0, 1, 1,
-0.868273, 0.4558548, -0.8558379, 0, 0, 0, 1, 1,
-0.8680927, 0.5267566, -0.3232866, 0, 0, 0, 1, 1,
-0.8656865, 0.414887, 0.1249774, 0, 0, 0, 1, 1,
-0.8649707, 0.06180259, -2.899391, 0, 0, 0, 1, 1,
-0.8615087, 0.4562423, -2.648427, 0, 0, 0, 1, 1,
-0.858121, -0.125439, -0.7269896, 0, 0, 0, 1, 1,
-0.8564506, 2.668121, 1.215265, 1, 1, 1, 1, 1,
-0.8499804, -0.9356577, -2.198136, 1, 1, 1, 1, 1,
-0.8457431, 2.207158, -2.00057, 1, 1, 1, 1, 1,
-0.8452752, -1.001487, -0.8852699, 1, 1, 1, 1, 1,
-0.8434044, -2.004387, -1.053625, 1, 1, 1, 1, 1,
-0.8411073, 0.1692849, -1.389514, 1, 1, 1, 1, 1,
-0.8383566, 1.133419, 0.8153436, 1, 1, 1, 1, 1,
-0.834874, -0.1846598, 0.3557435, 1, 1, 1, 1, 1,
-0.8339117, 0.8753393, -1.124003, 1, 1, 1, 1, 1,
-0.8322369, 0.5965086, 0.5269853, 1, 1, 1, 1, 1,
-0.8315697, -0.3969486, -3.347461, 1, 1, 1, 1, 1,
-0.8314602, -0.6430959, -1.02821, 1, 1, 1, 1, 1,
-0.8296901, 0.09973849, -1.168885, 1, 1, 1, 1, 1,
-0.8281921, -1.32522, -3.477529, 1, 1, 1, 1, 1,
-0.826173, 1.361924, -0.5773771, 1, 1, 1, 1, 1,
-0.8258138, 1.813781, 1.274932, 0, 0, 1, 1, 1,
-0.8233863, -0.08097021, -0.5707353, 1, 0, 0, 1, 1,
-0.8228855, 0.7969938, -1.869429, 1, 0, 0, 1, 1,
-0.822274, -0.2555743, -2.33779, 1, 0, 0, 1, 1,
-0.8191058, -2.098632, -3.55176, 1, 0, 0, 1, 1,
-0.8093523, -1.045463, -2.953949, 1, 0, 0, 1, 1,
-0.8072525, 2.075279, -1.39972, 0, 0, 0, 1, 1,
-0.8047668, 0.5050176, 0.07965027, 0, 0, 0, 1, 1,
-0.8033474, 0.9404334, -0.8358548, 0, 0, 0, 1, 1,
-0.802712, 0.480044, -1.310381, 0, 0, 0, 1, 1,
-0.7959253, -1.253199, -3.70079, 0, 0, 0, 1, 1,
-0.7956811, -0.100358, -1.637351, 0, 0, 0, 1, 1,
-0.7904489, 2.413951, -1.636495, 0, 0, 0, 1, 1,
-0.7860852, -1.819599, -2.02657, 1, 1, 1, 1, 1,
-0.782485, -0.8234068, -3.770083, 1, 1, 1, 1, 1,
-0.7803033, -0.7948305, -3.582537, 1, 1, 1, 1, 1,
-0.7774349, -2.092115, -4.050046, 1, 1, 1, 1, 1,
-0.7742874, -0.9401326, -2.709632, 1, 1, 1, 1, 1,
-0.7644075, -1.871799, -2.691767, 1, 1, 1, 1, 1,
-0.7605125, -1.693851, -3.555365, 1, 1, 1, 1, 1,
-0.7512339, 0.4053146, -1.820376, 1, 1, 1, 1, 1,
-0.7430095, -1.865276, -3.110545, 1, 1, 1, 1, 1,
-0.7399834, -0.9708024, -1.995742, 1, 1, 1, 1, 1,
-0.7386028, -0.1380034, -3.787821, 1, 1, 1, 1, 1,
-0.7345085, 0.09696968, 0.1724713, 1, 1, 1, 1, 1,
-0.7252401, -0.5287061, -1.324034, 1, 1, 1, 1, 1,
-0.721658, 2.013482, -1.218854, 1, 1, 1, 1, 1,
-0.7070612, 0.212533, -1.452438, 1, 1, 1, 1, 1,
-0.7049799, 0.3393455, -0.8342566, 0, 0, 1, 1, 1,
-0.7027143, 1.348542, -0.00844288, 1, 0, 0, 1, 1,
-0.7011141, 0.1317835, -0.5957554, 1, 0, 0, 1, 1,
-0.6967641, 0.2637012, -0.9631581, 1, 0, 0, 1, 1,
-0.6957104, 0.505043, -0.6419706, 1, 0, 0, 1, 1,
-0.685599, 1.24796, -0.345372, 1, 0, 0, 1, 1,
-0.6836713, 1.041063, 1.100114, 0, 0, 0, 1, 1,
-0.6790056, 2.103965, -1.332934, 0, 0, 0, 1, 1,
-0.6728343, 1.199953, -0.8291686, 0, 0, 0, 1, 1,
-0.6709937, -0.7150385, -1.691073, 0, 0, 0, 1, 1,
-0.6709346, 0.1177724, -2.035512, 0, 0, 0, 1, 1,
-0.6689228, -1.22221, -3.676207, 0, 0, 0, 1, 1,
-0.6662291, -0.8662622, -3.001261, 0, 0, 0, 1, 1,
-0.6652135, -0.422122, -3.148584, 1, 1, 1, 1, 1,
-0.6637566, 0.3622605, -1.251183, 1, 1, 1, 1, 1,
-0.6531096, -1.304191, -2.918813, 1, 1, 1, 1, 1,
-0.6492378, -0.4645209, -3.147875, 1, 1, 1, 1, 1,
-0.6477984, 0.4435946, -0.3525163, 1, 1, 1, 1, 1,
-0.6471509, 0.09647329, -1.546935, 1, 1, 1, 1, 1,
-0.6455124, -2.455948, -2.947138, 1, 1, 1, 1, 1,
-0.6435201, 0.5699412, -1.197541, 1, 1, 1, 1, 1,
-0.6380354, -0.7449592, -1.242131, 1, 1, 1, 1, 1,
-0.6337303, 1.035352, -1.030423, 1, 1, 1, 1, 1,
-0.6318895, 0.6192975, -2.31716, 1, 1, 1, 1, 1,
-0.6306301, -0.2202163, -2.020163, 1, 1, 1, 1, 1,
-0.6209555, -0.4245904, -2.971441, 1, 1, 1, 1, 1,
-0.6197789, -0.6718125, -1.536844, 1, 1, 1, 1, 1,
-0.615262, -0.8920955, -3.020242, 1, 1, 1, 1, 1,
-0.6146896, 0.7720189, -0.3273938, 0, 0, 1, 1, 1,
-0.6133576, 0.6712218, 0.638808, 1, 0, 0, 1, 1,
-0.610757, -1.267017, -1.445005, 1, 0, 0, 1, 1,
-0.6043163, -1.079418, -1.399803, 1, 0, 0, 1, 1,
-0.5950676, 1.110512, 0.06035609, 1, 0, 0, 1, 1,
-0.5875722, -0.2523099, -1.322273, 1, 0, 0, 1, 1,
-0.5804238, 0.256608, -1.638676, 0, 0, 0, 1, 1,
-0.568634, 0.885703, -0.02270889, 0, 0, 0, 1, 1,
-0.5651723, 0.0619594, -2.268124, 0, 0, 0, 1, 1,
-0.5648277, 0.02920604, -2.455693, 0, 0, 0, 1, 1,
-0.563279, 0.4884588, -0.5591621, 0, 0, 0, 1, 1,
-0.5555402, -0.6545452, -4.134544, 0, 0, 0, 1, 1,
-0.5537711, -0.7240436, -1.466481, 0, 0, 0, 1, 1,
-0.5519282, -0.01160209, -2.022707, 1, 1, 1, 1, 1,
-0.5519227, -0.2250185, -2.268364, 1, 1, 1, 1, 1,
-0.5510372, -0.6904861, -2.298491, 1, 1, 1, 1, 1,
-0.5437911, 0.6597127, -1.324489, 1, 1, 1, 1, 1,
-0.5341243, -0.7773915, -1.511504, 1, 1, 1, 1, 1,
-0.5332351, -0.09179907, -2.112156, 1, 1, 1, 1, 1,
-0.5323864, 0.8713447, -0.7564025, 1, 1, 1, 1, 1,
-0.5306309, 0.1456141, -2.753201, 1, 1, 1, 1, 1,
-0.5293021, 0.2262589, -1.555953, 1, 1, 1, 1, 1,
-0.5273567, -1.810287, -3.348847, 1, 1, 1, 1, 1,
-0.5270307, -3.28338, -2.348624, 1, 1, 1, 1, 1,
-0.5224756, 1.353677, -0.449354, 1, 1, 1, 1, 1,
-0.5172873, -0.1956172, -3.79806, 1, 1, 1, 1, 1,
-0.5166218, 0.4698233, -1.976408, 1, 1, 1, 1, 1,
-0.5153419, -0.04939299, -1.320875, 1, 1, 1, 1, 1,
-0.5126929, -1.094705, -2.402802, 0, 0, 1, 1, 1,
-0.5073414, -0.4302434, -1.265121, 1, 0, 0, 1, 1,
-0.5060958, -2.518951, -4.241874, 1, 0, 0, 1, 1,
-0.5060509, -1.18146, -1.998644, 1, 0, 0, 1, 1,
-0.5054235, 1.417609, 0.3995512, 1, 0, 0, 1, 1,
-0.499018, -0.0854253, -2.117887, 1, 0, 0, 1, 1,
-0.4948432, 1.941914, 0.2405908, 0, 0, 0, 1, 1,
-0.4946036, 1.098262, -0.05267328, 0, 0, 0, 1, 1,
-0.4942505, -0.4033282, -1.802243, 0, 0, 0, 1, 1,
-0.4845145, -0.2277909, -1.15688, 0, 0, 0, 1, 1,
-0.4844551, -0.1242316, -2.458316, 0, 0, 0, 1, 1,
-0.4755306, 0.9554942, 0.9691992, 0, 0, 0, 1, 1,
-0.4735752, -0.9434224, -2.443396, 0, 0, 0, 1, 1,
-0.4720666, 0.4385549, -0.519118, 1, 1, 1, 1, 1,
-0.4676372, 0.01674137, -1.69328, 1, 1, 1, 1, 1,
-0.4663607, -1.553362, -3.151971, 1, 1, 1, 1, 1,
-0.4621843, 0.359547, -0.6514044, 1, 1, 1, 1, 1,
-0.4606029, -1.004829, -1.91494, 1, 1, 1, 1, 1,
-0.4603386, -1.295521, -2.851407, 1, 1, 1, 1, 1,
-0.4602253, -0.9542788, -3.705188, 1, 1, 1, 1, 1,
-0.456863, 0.8645753, -0.5850748, 1, 1, 1, 1, 1,
-0.4527295, -0.8435513, -2.113861, 1, 1, 1, 1, 1,
-0.452179, -0.9446387, -2.144489, 1, 1, 1, 1, 1,
-0.4468731, -0.1519311, -2.833254, 1, 1, 1, 1, 1,
-0.4463303, 1.044247, 1.378965, 1, 1, 1, 1, 1,
-0.4441571, 0.1071701, -1.857582, 1, 1, 1, 1, 1,
-0.4438104, -1.159403, -1.277319, 1, 1, 1, 1, 1,
-0.4347199, -0.4878925, -2.527869, 1, 1, 1, 1, 1,
-0.4342189, -0.2427746, -3.894262, 0, 0, 1, 1, 1,
-0.4316699, -0.4746411, -2.155334, 1, 0, 0, 1, 1,
-0.4249104, 0.8411555, -2.124066, 1, 0, 0, 1, 1,
-0.4229399, -0.127775, -1.627086, 1, 0, 0, 1, 1,
-0.4197836, 1.982503, -0.0452672, 1, 0, 0, 1, 1,
-0.4158779, 2.310929, -0.01049187, 1, 0, 0, 1, 1,
-0.4143515, 1.178518, -0.9194056, 0, 0, 0, 1, 1,
-0.4086547, -0.09412251, -4.650817, 0, 0, 0, 1, 1,
-0.4054894, -0.2453078, -0.8104405, 0, 0, 0, 1, 1,
-0.4014367, -3.771424, -4.526908, 0, 0, 0, 1, 1,
-0.4014244, 0.1590531, -1.476499, 0, 0, 0, 1, 1,
-0.3974135, 0.2598866, -2.40879, 0, 0, 0, 1, 1,
-0.3910379, 0.4806, 1.115166, 0, 0, 0, 1, 1,
-0.38987, -0.2842112, -4.733805, 1, 1, 1, 1, 1,
-0.3878909, -2.0451, -2.201499, 1, 1, 1, 1, 1,
-0.3854512, -0.7652563, -1.899894, 1, 1, 1, 1, 1,
-0.3828174, -0.7727612, -2.013564, 1, 1, 1, 1, 1,
-0.3767716, 0.5124245, -2.130776, 1, 1, 1, 1, 1,
-0.3764096, 1.022055, -0.5498945, 1, 1, 1, 1, 1,
-0.3753764, -0.329893, -3.266886, 1, 1, 1, 1, 1,
-0.3742157, 1.231927, 0.7858223, 1, 1, 1, 1, 1,
-0.3728592, -0.5400326, -2.168861, 1, 1, 1, 1, 1,
-0.3719556, 0.8080373, -1.925836, 1, 1, 1, 1, 1,
-0.3703329, -1.925532, -1.601618, 1, 1, 1, 1, 1,
-0.3671358, -0.4968924, -0.9230724, 1, 1, 1, 1, 1,
-0.3660703, 0.3270973, -0.4028408, 1, 1, 1, 1, 1,
-0.3650954, 0.797673, 0.4085595, 1, 1, 1, 1, 1,
-0.3639719, 0.3933788, -0.8085292, 1, 1, 1, 1, 1,
-0.3603845, -0.3809433, -1.674081, 0, 0, 1, 1, 1,
-0.3597977, 1.605441, -1.39278, 1, 0, 0, 1, 1,
-0.3585177, -0.04941026, -2.246058, 1, 0, 0, 1, 1,
-0.3570077, 1.627195, 0.651896, 1, 0, 0, 1, 1,
-0.3531393, -0.0004765068, -0.931132, 1, 0, 0, 1, 1,
-0.3529263, -1.572644, -2.640065, 1, 0, 0, 1, 1,
-0.3528773, 1.596606, -0.9262112, 0, 0, 0, 1, 1,
-0.3490286, -3.141393, -2.423852, 0, 0, 0, 1, 1,
-0.3449655, -0.1542696, -2.027434, 0, 0, 0, 1, 1,
-0.3415895, 0.9100374, -0.6133758, 0, 0, 0, 1, 1,
-0.3415264, 0.4255784, -1.945028, 0, 0, 0, 1, 1,
-0.3376953, -1.197391, -3.018361, 0, 0, 0, 1, 1,
-0.3340198, 0.6024458, -0.3286147, 0, 0, 0, 1, 1,
-0.3306374, 0.6809837, -0.5517492, 1, 1, 1, 1, 1,
-0.3265244, 0.5725389, 0.446879, 1, 1, 1, 1, 1,
-0.3251859, -0.5159942, -1.835668, 1, 1, 1, 1, 1,
-0.3224514, 0.2077491, -0.6545118, 1, 1, 1, 1, 1,
-0.3220074, 1.007043, -0.7749837, 1, 1, 1, 1, 1,
-0.3197565, 0.2394518, -1.110124, 1, 1, 1, 1, 1,
-0.3176229, -0.5889089, -1.583619, 1, 1, 1, 1, 1,
-0.3149331, -0.8616574, -1.836527, 1, 1, 1, 1, 1,
-0.3102973, 1.377519, -1.201076, 1, 1, 1, 1, 1,
-0.3086624, 0.8479287, 0.1842988, 1, 1, 1, 1, 1,
-0.3065948, 0.5741693, 1.314523, 1, 1, 1, 1, 1,
-0.3049484, -0.3633523, -2.03333, 1, 1, 1, 1, 1,
-0.3046439, 0.4661626, -1.96186, 1, 1, 1, 1, 1,
-0.3012323, 2.486393, 0.253511, 1, 1, 1, 1, 1,
-0.3000661, 1.608544, 0.5821506, 1, 1, 1, 1, 1,
-0.2954592, -1.047082, -2.885986, 0, 0, 1, 1, 1,
-0.2950197, -0.9844816, -2.97224, 1, 0, 0, 1, 1,
-0.2912719, -1.151739, -3.715557, 1, 0, 0, 1, 1,
-0.2892287, -0.7831094, -2.777969, 1, 0, 0, 1, 1,
-0.2775358, -1.323244, -1.857856, 1, 0, 0, 1, 1,
-0.2772521, -0.8332092, -2.550993, 1, 0, 0, 1, 1,
-0.2726002, 0.4463985, 0.2226786, 0, 0, 0, 1, 1,
-0.2701192, 0.9521534, 1.133539, 0, 0, 0, 1, 1,
-0.2690974, -0.8847669, -3.539821, 0, 0, 0, 1, 1,
-0.2662981, 0.1416673, -1.600771, 0, 0, 0, 1, 1,
-0.2636966, -0.05292787, -2.83293, 0, 0, 0, 1, 1,
-0.2629407, -0.5979392, -2.755414, 0, 0, 0, 1, 1,
-0.258031, -0.8584868, -2.921052, 0, 0, 0, 1, 1,
-0.2568304, -0.6817511, -2.896803, 1, 1, 1, 1, 1,
-0.2511317, -0.2601633, -2.252038, 1, 1, 1, 1, 1,
-0.2470088, 2.372832, 0.6600623, 1, 1, 1, 1, 1,
-0.2447218, -0.9265778, -2.787231, 1, 1, 1, 1, 1,
-0.2408125, 0.6052888, 1.782089, 1, 1, 1, 1, 1,
-0.2371808, -0.2270368, -2.907086, 1, 1, 1, 1, 1,
-0.2371754, 0.4841897, -1.320569, 1, 1, 1, 1, 1,
-0.2371071, -0.4633307, -4.597094, 1, 1, 1, 1, 1,
-0.2360609, -0.8644093, -2.469609, 1, 1, 1, 1, 1,
-0.2337676, 0.6477453, 0.3510454, 1, 1, 1, 1, 1,
-0.2333294, 1.11696, -2.179061, 1, 1, 1, 1, 1,
-0.2302023, -1.186234, -2.941733, 1, 1, 1, 1, 1,
-0.2300387, -0.6784726, -4.234299, 1, 1, 1, 1, 1,
-0.2290712, -0.6997252, -2.819266, 1, 1, 1, 1, 1,
-0.2260682, -0.3952743, -2.82263, 1, 1, 1, 1, 1,
-0.2247399, -0.8306774, -3.58004, 0, 0, 1, 1, 1,
-0.2195015, 0.7115451, -0.3487012, 1, 0, 0, 1, 1,
-0.2174912, 0.8984076, 0.4747717, 1, 0, 0, 1, 1,
-0.2153626, -0.9430077, -2.999903, 1, 0, 0, 1, 1,
-0.2150555, -0.2206571, -2.49104, 1, 0, 0, 1, 1,
-0.2095467, -1.759775, -3.702288, 1, 0, 0, 1, 1,
-0.2066463, -0.5301921, -3.834497, 0, 0, 0, 1, 1,
-0.2042577, 2.025746, 0.4217675, 0, 0, 0, 1, 1,
-0.1997347, -0.5164906, -3.220536, 0, 0, 0, 1, 1,
-0.1989632, -0.3510816, -1.707975, 0, 0, 0, 1, 1,
-0.1982225, -0.4686188, -4.371645, 0, 0, 0, 1, 1,
-0.1953136, -0.5609655, -2.972052, 0, 0, 0, 1, 1,
-0.1917202, 0.7126003, -1.592223, 0, 0, 0, 1, 1,
-0.1903664, 1.105307, -1.205389, 1, 1, 1, 1, 1,
-0.1893315, 0.7996012, -2.051011, 1, 1, 1, 1, 1,
-0.1858383, 0.8040266, 0.380667, 1, 1, 1, 1, 1,
-0.183932, 0.3727515, -0.04249039, 1, 1, 1, 1, 1,
-0.1821189, 1.333632, 0.6623603, 1, 1, 1, 1, 1,
-0.1811891, 0.5338882, -1.034932, 1, 1, 1, 1, 1,
-0.1777331, 0.6995186, 2.17195, 1, 1, 1, 1, 1,
-0.1776165, 0.0900676, -2.524649, 1, 1, 1, 1, 1,
-0.1758705, 0.4459915, 0.6078678, 1, 1, 1, 1, 1,
-0.1717657, -1.277404, -2.621217, 1, 1, 1, 1, 1,
-0.1604805, 0.6255989, 0.02631468, 1, 1, 1, 1, 1,
-0.1603716, -0.5032186, -1.865086, 1, 1, 1, 1, 1,
-0.1601755, 0.40496, 1.93396, 1, 1, 1, 1, 1,
-0.1571086, -0.7183916, -3.280548, 1, 1, 1, 1, 1,
-0.1524584, 1.35274, -1.630061, 1, 1, 1, 1, 1,
-0.1510811, -0.02175133, -2.169077, 0, 0, 1, 1, 1,
-0.1497664, -0.6408905, -1.91678, 1, 0, 0, 1, 1,
-0.1488616, -0.6243797, -2.833874, 1, 0, 0, 1, 1,
-0.1457007, 1.346922, -0.2547528, 1, 0, 0, 1, 1,
-0.1443217, -0.2423067, -1.27651, 1, 0, 0, 1, 1,
-0.1438004, -0.6601537, -4.297282, 1, 0, 0, 1, 1,
-0.1427628, -0.636825, -3.828983, 0, 0, 0, 1, 1,
-0.1413953, -0.6894259, -3.495764, 0, 0, 0, 1, 1,
-0.1405064, 0.2474784, -0.7799582, 0, 0, 0, 1, 1,
-0.1400737, 0.7422893, -0.4164893, 0, 0, 0, 1, 1,
-0.1394381, -0.1282427, -1.262045, 0, 0, 0, 1, 1,
-0.1374587, 0.4138335, -1.876431, 0, 0, 0, 1, 1,
-0.1366171, 0.06347001, -0.105518, 0, 0, 0, 1, 1,
-0.1318258, 0.1963597, -0.2054934, 1, 1, 1, 1, 1,
-0.131687, -1.599015, -1.958844, 1, 1, 1, 1, 1,
-0.1296815, -0.2243974, -3.20261, 1, 1, 1, 1, 1,
-0.1282931, 0.255554, -0.3557099, 1, 1, 1, 1, 1,
-0.1253561, 0.2349009, -0.8355475, 1, 1, 1, 1, 1,
-0.1222465, -1.616977, -2.678056, 1, 1, 1, 1, 1,
-0.1197635, 0.5225461, -0.9647415, 1, 1, 1, 1, 1,
-0.1178192, -0.7298134, -4.078896, 1, 1, 1, 1, 1,
-0.1161987, 1.239246, 0.8348097, 1, 1, 1, 1, 1,
-0.1136744, 0.05724605, -1.327589, 1, 1, 1, 1, 1,
-0.110824, 0.3897564, 0.1728234, 1, 1, 1, 1, 1,
-0.1097158, -0.9247262, -2.759866, 1, 1, 1, 1, 1,
-0.1084292, -0.900565, -1.333059, 1, 1, 1, 1, 1,
-0.1062932, 0.9274287, 0.02029196, 1, 1, 1, 1, 1,
-0.1060523, 0.9094872, 0.5076534, 1, 1, 1, 1, 1,
-0.1002388, -0.6972444, -4.573216, 0, 0, 1, 1, 1,
-0.08805358, 1.377427, -0.4597054, 1, 0, 0, 1, 1,
-0.08464656, -0.09110362, -1.392397, 1, 0, 0, 1, 1,
-0.08062265, 0.1094944, -0.01484956, 1, 0, 0, 1, 1,
-0.07617839, 0.5998752, 0.6955031, 1, 0, 0, 1, 1,
-0.07178409, -0.9349433, -2.673148, 1, 0, 0, 1, 1,
-0.0710239, 0.6529725, 1.999457, 0, 0, 0, 1, 1,
-0.07052542, 0.1550247, -0.8863322, 0, 0, 0, 1, 1,
-0.06403248, 0.2762171, -2.494813, 0, 0, 0, 1, 1,
-0.06251964, 1.976668, -2.231812, 0, 0, 0, 1, 1,
-0.05913985, 2.443931, -0.1004817, 0, 0, 0, 1, 1,
-0.05554169, 0.0761168, -0.08520433, 0, 0, 0, 1, 1,
-0.04908723, -0.2744246, -2.421731, 0, 0, 0, 1, 1,
-0.04836915, 1.166093, 0.8227685, 1, 1, 1, 1, 1,
-0.04509965, 1.15088, -2.162444, 1, 1, 1, 1, 1,
-0.04304821, 0.04851603, -0.3690813, 1, 1, 1, 1, 1,
-0.0413354, 0.6223732, 1.736083, 1, 1, 1, 1, 1,
-0.04063085, 0.609189, -0.4271552, 1, 1, 1, 1, 1,
-0.0391558, -2.267838, -2.534473, 1, 1, 1, 1, 1,
-0.03530211, -2.462301, -3.822372, 1, 1, 1, 1, 1,
-0.0351065, -1.413356, -2.630931, 1, 1, 1, 1, 1,
-0.03196704, 0.2489204, -2.368321, 1, 1, 1, 1, 1,
-0.03059366, -0.8225322, -5.076924, 1, 1, 1, 1, 1,
-0.0300147, -1.222589, -3.297772, 1, 1, 1, 1, 1,
-0.02943173, -1.043948, -3.844889, 1, 1, 1, 1, 1,
-0.02883358, 0.2737314, -0.2592379, 1, 1, 1, 1, 1,
-0.02842204, -2.156171, -2.52086, 1, 1, 1, 1, 1,
-0.02688174, -1.816073, -3.499291, 1, 1, 1, 1, 1,
-0.02609478, 0.7069188, -0.5171635, 0, 0, 1, 1, 1,
-0.02505597, 2.248819, 0.1822438, 1, 0, 0, 1, 1,
-0.0244461, -0.468768, -2.220049, 1, 0, 0, 1, 1,
-0.02315193, 0.2180676, -0.4166017, 1, 0, 0, 1, 1,
-0.01525083, 0.06897701, 0.9224776, 1, 0, 0, 1, 1,
-0.01325698, -1.931907, -3.909158, 1, 0, 0, 1, 1,
-0.01222434, 0.6176788, 0.1230057, 0, 0, 0, 1, 1,
-0.009380893, 0.8567747, -1.806998, 0, 0, 0, 1, 1,
-0.003300356, 2.29871, 1.260495, 0, 0, 0, 1, 1,
-0.001519913, -0.0381032, -2.637448, 0, 0, 0, 1, 1,
-0.0001396156, -1.519822, -3.102492, 0, 0, 0, 1, 1,
0.001682807, 0.1487325, 0.2451067, 0, 0, 0, 1, 1,
0.003249866, -0.8041178, 4.911725, 0, 0, 0, 1, 1,
0.004907714, 0.07213054, -0.1022911, 1, 1, 1, 1, 1,
0.007240145, -0.6476649, 3.261972, 1, 1, 1, 1, 1,
0.01111798, -1.169488, 3.364, 1, 1, 1, 1, 1,
0.01496295, 0.02113253, 0.5230434, 1, 1, 1, 1, 1,
0.01591789, 0.3797761, -0.1782977, 1, 1, 1, 1, 1,
0.0179725, -0.8881581, 3.351019, 1, 1, 1, 1, 1,
0.0264604, -1.593572, 2.542813, 1, 1, 1, 1, 1,
0.02912824, 0.3340595, -0.7913822, 1, 1, 1, 1, 1,
0.02968636, 1.0451, -0.3928101, 1, 1, 1, 1, 1,
0.04843734, 0.662441, -1.118972, 1, 1, 1, 1, 1,
0.05030877, -1.168249, 4.047883, 1, 1, 1, 1, 1,
0.05232627, 0.01600478, 0.728845, 1, 1, 1, 1, 1,
0.05417641, -0.8963866, 2.770931, 1, 1, 1, 1, 1,
0.05829326, -0.5998995, 3.486475, 1, 1, 1, 1, 1,
0.05884323, 0.1749253, 0.5990225, 1, 1, 1, 1, 1,
0.06300127, 0.2619088, -1.778724, 0, 0, 1, 1, 1,
0.06455933, -0.1773424, 1.017469, 1, 0, 0, 1, 1,
0.06543368, -1.712415, 3.068158, 1, 0, 0, 1, 1,
0.06583411, 0.7785543, -1.56151, 1, 0, 0, 1, 1,
0.07275204, -0.6380278, 1.778412, 1, 0, 0, 1, 1,
0.07461067, 1.153984, -0.9647508, 1, 0, 0, 1, 1,
0.07643706, -0.2019553, 2.895437, 0, 0, 0, 1, 1,
0.07923695, -0.5043817, 3.496054, 0, 0, 0, 1, 1,
0.07940183, -0.2863378, 3.146246, 0, 0, 0, 1, 1,
0.07970541, 0.1005737, 1.400802, 0, 0, 0, 1, 1,
0.08156762, -0.8239152, 3.690513, 0, 0, 0, 1, 1,
0.08423426, 0.06680554, 2.153323, 0, 0, 0, 1, 1,
0.08651152, -1.738888, 2.479874, 0, 0, 0, 1, 1,
0.08826487, -0.3914574, 2.80296, 1, 1, 1, 1, 1,
0.08894026, -1.267267, 2.966518, 1, 1, 1, 1, 1,
0.08929995, 0.1766331, 0.1146083, 1, 1, 1, 1, 1,
0.09061489, 0.6531634, -0.3203762, 1, 1, 1, 1, 1,
0.09868005, 0.0587798, 1.931272, 1, 1, 1, 1, 1,
0.1024665, 0.3343384, 0.1121234, 1, 1, 1, 1, 1,
0.1028484, 1.625733, -0.4392235, 1, 1, 1, 1, 1,
0.1064202, 2.166724, 0.1952091, 1, 1, 1, 1, 1,
0.1105583, -1.277119, 3.237436, 1, 1, 1, 1, 1,
0.1144605, 1.809694, -1.106365, 1, 1, 1, 1, 1,
0.1168573, -0.6717187, 3.512223, 1, 1, 1, 1, 1,
0.117453, 2.34216, 2.011564, 1, 1, 1, 1, 1,
0.1179689, -0.3206612, 4.061575, 1, 1, 1, 1, 1,
0.1218425, -0.6425238, 2.522527, 1, 1, 1, 1, 1,
0.121976, 0.2516892, -0.4194917, 1, 1, 1, 1, 1,
0.122715, 1.144426, 1.380923, 0, 0, 1, 1, 1,
0.1239897, -0.232086, 3.992652, 1, 0, 0, 1, 1,
0.1267764, 1.019184, 0.4244366, 1, 0, 0, 1, 1,
0.1269018, 2.205514, 1.899364, 1, 0, 0, 1, 1,
0.1275683, -1.037665, 2.464032, 1, 0, 0, 1, 1,
0.1323547, 0.07874822, 1.642565, 1, 0, 0, 1, 1,
0.1331704, 0.4653155, -0.3908829, 0, 0, 0, 1, 1,
0.1332313, 0.9261219, -1.646566, 0, 0, 0, 1, 1,
0.1337889, -1.708435, 2.077106, 0, 0, 0, 1, 1,
0.1384535, -1.261454, 3.396354, 0, 0, 0, 1, 1,
0.139871, 2.833434, 1.83991, 0, 0, 0, 1, 1,
0.1415391, -0.04837825, 2.359181, 0, 0, 0, 1, 1,
0.1416702, 0.6021912, 1.459005, 0, 0, 0, 1, 1,
0.1443778, -1.157482, 2.42905, 1, 1, 1, 1, 1,
0.1465642, -1.798766, 3.21582, 1, 1, 1, 1, 1,
0.1483173, -1.684502, 1.819214, 1, 1, 1, 1, 1,
0.1526027, -1.711807, 3.221847, 1, 1, 1, 1, 1,
0.1538828, -0.2159015, 1.264959, 1, 1, 1, 1, 1,
0.1568547, -0.934198, 4.197578, 1, 1, 1, 1, 1,
0.159883, 0.6280445, 0.1741913, 1, 1, 1, 1, 1,
0.1600979, -1.227013, 0.6219117, 1, 1, 1, 1, 1,
0.1630094, -0.6381975, 3.931141, 1, 1, 1, 1, 1,
0.1656654, -0.2021092, 3.958738, 1, 1, 1, 1, 1,
0.1673886, -0.1428124, 2.711109, 1, 1, 1, 1, 1,
0.1675, -1.054221, 1.883712, 1, 1, 1, 1, 1,
0.1699877, 0.4285514, -0.2853932, 1, 1, 1, 1, 1,
0.1701135, -0.5328632, 0.3692365, 1, 1, 1, 1, 1,
0.1759985, 0.02721952, 2.06109, 1, 1, 1, 1, 1,
0.1797404, 0.2833891, -0.7536752, 0, 0, 1, 1, 1,
0.1820643, 0.7786791, 0.5067545, 1, 0, 0, 1, 1,
0.1893545, -3.330439, 3.84983, 1, 0, 0, 1, 1,
0.1960663, 0.6008838, -1.089338, 1, 0, 0, 1, 1,
0.1968864, 0.4941074, -0.06918178, 1, 0, 0, 1, 1,
0.1972436, 0.83304, 0.03861195, 1, 0, 0, 1, 1,
0.2002621, -0.1061371, 3.276361, 0, 0, 0, 1, 1,
0.2013421, -0.2783836, 2.909796, 0, 0, 0, 1, 1,
0.2052717, -0.2691413, 0.9426789, 0, 0, 0, 1, 1,
0.2060397, 0.7360781, 1.439488, 0, 0, 0, 1, 1,
0.2096995, 0.217376, 0.2365465, 0, 0, 0, 1, 1,
0.2123919, -1.120077, 3.117936, 0, 0, 0, 1, 1,
0.2157959, 0.6477851, 1.922876, 0, 0, 0, 1, 1,
0.2172248, 0.7058329, 0.1750665, 1, 1, 1, 1, 1,
0.2204395, 0.3802069, 0.1152752, 1, 1, 1, 1, 1,
0.2207617, 0.660198, 0.9102994, 1, 1, 1, 1, 1,
0.2232065, -0.9051676, 3.83724, 1, 1, 1, 1, 1,
0.2276564, -1.231443, 2.603632, 1, 1, 1, 1, 1,
0.2286754, 0.1368409, 2.086671, 1, 1, 1, 1, 1,
0.2298775, -0.3383362, 2.56328, 1, 1, 1, 1, 1,
0.231826, -1.491033, 3.531901, 1, 1, 1, 1, 1,
0.2336435, 0.2676258, -0.03816159, 1, 1, 1, 1, 1,
0.2391563, 0.2405118, 2.917644, 1, 1, 1, 1, 1,
0.2416036, 0.7679467, 0.4190069, 1, 1, 1, 1, 1,
0.2425434, -0.8056097, 3.122089, 1, 1, 1, 1, 1,
0.242637, -1.337993, 4.42151, 1, 1, 1, 1, 1,
0.2508038, 1.146316, 0.2464392, 1, 1, 1, 1, 1,
0.2516003, 0.2444125, 1.489876, 1, 1, 1, 1, 1,
0.2552083, -0.06536795, 0.299658, 0, 0, 1, 1, 1,
0.2558045, -1.144138, 3.89451, 1, 0, 0, 1, 1,
0.2563976, 1.194652, 0.3605708, 1, 0, 0, 1, 1,
0.2626595, 0.8591138, 0.9434267, 1, 0, 0, 1, 1,
0.2733751, 0.7362059, 0.3867572, 1, 0, 0, 1, 1,
0.274201, -1.042946, 3.012707, 1, 0, 0, 1, 1,
0.278946, 0.4230473, 0.9075825, 0, 0, 0, 1, 1,
0.2793658, 0.5257077, 0.1704513, 0, 0, 0, 1, 1,
0.2816282, 0.9242805, 0.8138198, 0, 0, 0, 1, 1,
0.2857122, 0.438149, 1.730128, 0, 0, 0, 1, 1,
0.2891006, -1.701939, 1.940726, 0, 0, 0, 1, 1,
0.2923808, -1.892062, 3.98244, 0, 0, 0, 1, 1,
0.2974324, 0.9927424, 0.8681742, 0, 0, 0, 1, 1,
0.3009613, 0.8711177, -0.2414583, 1, 1, 1, 1, 1,
0.3015571, -1.101053, 4.075101, 1, 1, 1, 1, 1,
0.3050145, -0.9965547, 3.331673, 1, 1, 1, 1, 1,
0.3082447, 0.2171593, 1.309199, 1, 1, 1, 1, 1,
0.3094698, 0.7905771, 0.790753, 1, 1, 1, 1, 1,
0.3105268, -0.9522908, 3.966036, 1, 1, 1, 1, 1,
0.3125136, -2.48142, 4.220744, 1, 1, 1, 1, 1,
0.3157688, -0.6368142, 2.091958, 1, 1, 1, 1, 1,
0.3157842, 2.538611, -0.385745, 1, 1, 1, 1, 1,
0.3162239, 0.8189371, 0.2808941, 1, 1, 1, 1, 1,
0.3165643, -0.773232, 1.610485, 1, 1, 1, 1, 1,
0.3172179, -0.8608476, 4.393826, 1, 1, 1, 1, 1,
0.3194667, 0.7544703, 1.228769, 1, 1, 1, 1, 1,
0.3223167, -0.7887744, 2.229891, 1, 1, 1, 1, 1,
0.3226196, 0.2308652, 1.266951, 1, 1, 1, 1, 1,
0.3316103, 0.5527609, 0.4246702, 0, 0, 1, 1, 1,
0.3524524, 0.9495302, -0.720376, 1, 0, 0, 1, 1,
0.3537348, -2.095795, 2.593963, 1, 0, 0, 1, 1,
0.3558097, 0.2569501, 1.966916, 1, 0, 0, 1, 1,
0.3620683, 1.616104, -0.5022736, 1, 0, 0, 1, 1,
0.3623271, -0.9524889, 2.885494, 1, 0, 0, 1, 1,
0.3628922, -0.6354181, 3.576857, 0, 0, 0, 1, 1,
0.3641516, 0.2964172, 2.108519, 0, 0, 0, 1, 1,
0.3649757, -0.6253319, 1.606182, 0, 0, 0, 1, 1,
0.3671862, -0.8774705, 2.199686, 0, 0, 0, 1, 1,
0.3679916, 1.291818, 0.1825719, 0, 0, 0, 1, 1,
0.3707617, 0.01587374, -0.8104112, 0, 0, 0, 1, 1,
0.3738011, 0.0596194, 2.62045, 0, 0, 0, 1, 1,
0.3759759, -0.3588921, 3.887259, 1, 1, 1, 1, 1,
0.3822965, 0.6114053, 0.8643866, 1, 1, 1, 1, 1,
0.3828244, 1.039588, -2.135347, 1, 1, 1, 1, 1,
0.3858254, -0.2699943, 1.37544, 1, 1, 1, 1, 1,
0.3882375, 1.537476, 1.238933, 1, 1, 1, 1, 1,
0.3902313, 1.022113, 0.5067579, 1, 1, 1, 1, 1,
0.3961846, -1.142797, 1.458836, 1, 1, 1, 1, 1,
0.3976448, 1.68271, -0.7748202, 1, 1, 1, 1, 1,
0.4000816, 0.02865929, 2.270354, 1, 1, 1, 1, 1,
0.4088661, 0.04775367, 0.6517641, 1, 1, 1, 1, 1,
0.4092306, 0.09486163, 1.709653, 1, 1, 1, 1, 1,
0.4129329, -0.1204365, 1.846573, 1, 1, 1, 1, 1,
0.4154079, -0.07145412, 2.464838, 1, 1, 1, 1, 1,
0.417264, 1.133692, 1.203968, 1, 1, 1, 1, 1,
0.418745, 0.09360759, 0.4954762, 1, 1, 1, 1, 1,
0.420094, -1.519018, 1.897285, 0, 0, 1, 1, 1,
0.4205011, -1.729105, 3.749699, 1, 0, 0, 1, 1,
0.4252814, 0.3600414, 1.105329, 1, 0, 0, 1, 1,
0.4285737, -1.34931, 2.384763, 1, 0, 0, 1, 1,
0.430445, -0.7647254, 3.456196, 1, 0, 0, 1, 1,
0.4315334, -0.2595026, 2.699088, 1, 0, 0, 1, 1,
0.4352589, 0.1031533, 2.196346, 0, 0, 0, 1, 1,
0.4370382, -1.403614, 3.519884, 0, 0, 0, 1, 1,
0.4422715, 1.396004, 1.233431, 0, 0, 0, 1, 1,
0.4433863, 0.3325067, -0.07637351, 0, 0, 0, 1, 1,
0.4437837, -1.460171, 1.673525, 0, 0, 0, 1, 1,
0.4469836, -1.73647, 3.914119, 0, 0, 0, 1, 1,
0.449136, -2.683516, 3.876348, 0, 0, 0, 1, 1,
0.451185, 0.2841064, 0.9265802, 1, 1, 1, 1, 1,
0.462012, 0.9312784, 1.470281, 1, 1, 1, 1, 1,
0.4629002, -2.147572, 3.688181, 1, 1, 1, 1, 1,
0.4661127, 0.3230596, 2.094847, 1, 1, 1, 1, 1,
0.4696146, 0.1683591, 0.9966614, 1, 1, 1, 1, 1,
0.4718491, -1.938363, 1.955902, 1, 1, 1, 1, 1,
0.4734403, -0.2554112, 3.248232, 1, 1, 1, 1, 1,
0.4738193, 0.4183259, -2.258788, 1, 1, 1, 1, 1,
0.475769, -0.05377134, 1.428176, 1, 1, 1, 1, 1,
0.4776856, -0.8913112, 2.996016, 1, 1, 1, 1, 1,
0.4823548, -1.274918, 1.953724, 1, 1, 1, 1, 1,
0.4829987, 1.119318, 0.1652249, 1, 1, 1, 1, 1,
0.4832345, -0.263933, 2.606793, 1, 1, 1, 1, 1,
0.4899243, -1.01127, 1.312042, 1, 1, 1, 1, 1,
0.4909599, 0.3599964, 1.003317, 1, 1, 1, 1, 1,
0.49579, 0.06918601, 3.206888, 0, 0, 1, 1, 1,
0.4973487, 0.7243938, 0.8032377, 1, 0, 0, 1, 1,
0.4980601, -0.4075201, 4.070209, 1, 0, 0, 1, 1,
0.5096533, 0.936077, 0.6736773, 1, 0, 0, 1, 1,
0.5117235, 1.008397, 0.4814786, 1, 0, 0, 1, 1,
0.514395, -0.2261061, 0.1834363, 1, 0, 0, 1, 1,
0.517231, -0.06246815, 1.269626, 0, 0, 0, 1, 1,
0.5174243, -0.01247822, 0.06452771, 0, 0, 0, 1, 1,
0.5245522, 1.835775, -1.323352, 0, 0, 0, 1, 1,
0.529205, -0.6210971, 3.177014, 0, 0, 0, 1, 1,
0.5324015, 0.5323275, 0.975965, 0, 0, 0, 1, 1,
0.5372335, -0.1365338, 2.803212, 0, 0, 0, 1, 1,
0.5372374, 1.330143, 0.01991893, 0, 0, 0, 1, 1,
0.5405348, 0.006435584, 0.002551614, 1, 1, 1, 1, 1,
0.5409725, -1.546911, 2.188395, 1, 1, 1, 1, 1,
0.545854, -0.7481195, 2.122388, 1, 1, 1, 1, 1,
0.5479538, -0.09238645, 2.763956, 1, 1, 1, 1, 1,
0.5481615, -0.141496, 2.067582, 1, 1, 1, 1, 1,
0.5485437, -0.3155046, 3.491757, 1, 1, 1, 1, 1,
0.5528759, -1.500669, 4.426961, 1, 1, 1, 1, 1,
0.5549427, -1.343276, 4.597539, 1, 1, 1, 1, 1,
0.5566289, -0.43139, 3.602376, 1, 1, 1, 1, 1,
0.5569668, -0.5561543, 3.899035, 1, 1, 1, 1, 1,
0.5681474, 0.7073974, -0.05072635, 1, 1, 1, 1, 1,
0.574242, 0.816124, 0.8820371, 1, 1, 1, 1, 1,
0.5745689, 0.7051988, 0.3661918, 1, 1, 1, 1, 1,
0.5749717, 1.413038, -1.963472, 1, 1, 1, 1, 1,
0.575193, 1.621154, -0.4137048, 1, 1, 1, 1, 1,
0.5794188, 0.9884187, 0.6109817, 0, 0, 1, 1, 1,
0.5798997, -0.5288135, 3.178569, 1, 0, 0, 1, 1,
0.5809719, -0.7112689, 2.405868, 1, 0, 0, 1, 1,
0.5835213, -0.04675369, 1.606488, 1, 0, 0, 1, 1,
0.599008, 1.674914, 1.284305, 1, 0, 0, 1, 1,
0.6004263, -2.174505, 3.935867, 1, 0, 0, 1, 1,
0.606213, 0.3441955, -0.2432139, 0, 0, 0, 1, 1,
0.6076369, 0.4732839, 0.3825023, 0, 0, 0, 1, 1,
0.6097534, -0.9917743, 2.039017, 0, 0, 0, 1, 1,
0.6183136, 1.192311, 0.8673463, 0, 0, 0, 1, 1,
0.6225819, 0.7563106, 0.9478229, 0, 0, 0, 1, 1,
0.6260263, -0.3746969, 1.182986, 0, 0, 0, 1, 1,
0.6280147, -0.2627741, 0.8064752, 0, 0, 0, 1, 1,
0.6307687, -1.707247, 4.429684, 1, 1, 1, 1, 1,
0.6324579, 0.005958451, 2.987301, 1, 1, 1, 1, 1,
0.6332341, -0.4006451, 2.928149, 1, 1, 1, 1, 1,
0.6334197, 0.4501585, 0.01202224, 1, 1, 1, 1, 1,
0.6337007, 1.371699, 0.2641306, 1, 1, 1, 1, 1,
0.6356108, 0.09470455, 2.170744, 1, 1, 1, 1, 1,
0.6468162, 0.4649612, 1.233304, 1, 1, 1, 1, 1,
0.6586758, -1.412013, 3.089398, 1, 1, 1, 1, 1,
0.6670671, -0.8327579, 3.871474, 1, 1, 1, 1, 1,
0.6681224, 0.8156414, 2.382417, 1, 1, 1, 1, 1,
0.6684774, -1.449923, 3.939708, 1, 1, 1, 1, 1,
0.6807397, -0.6004626, 1.796242, 1, 1, 1, 1, 1,
0.6890749, -1.413626, 2.816606, 1, 1, 1, 1, 1,
0.6901812, 1.517079, 0.2333765, 1, 1, 1, 1, 1,
0.6919755, -1.46153, 2.364565, 1, 1, 1, 1, 1,
0.694096, -2.333885, 3.380795, 0, 0, 1, 1, 1,
0.6984916, -2.500792, 3.908201, 1, 0, 0, 1, 1,
0.7004417, -1.517081, 3.810989, 1, 0, 0, 1, 1,
0.7013755, 1.289452, 0.2999056, 1, 0, 0, 1, 1,
0.7089202, 0.4833898, 0.4049669, 1, 0, 0, 1, 1,
0.7130293, 1.85938, 1.413419, 1, 0, 0, 1, 1,
0.7263349, 0.09171843, 1.216609, 0, 0, 0, 1, 1,
0.73, -0.1383734, 3.684001, 0, 0, 0, 1, 1,
0.731463, -0.1889938, 2.83285, 0, 0, 0, 1, 1,
0.731633, -0.1756798, 3.328884, 0, 0, 0, 1, 1,
0.7322798, 0.04306201, 1.009793, 0, 0, 0, 1, 1,
0.7394213, 0.4312698, 2.57645, 0, 0, 0, 1, 1,
0.7396207, 1.400444, 0.835641, 0, 0, 0, 1, 1,
0.7415429, -0.7482007, 0.9257518, 1, 1, 1, 1, 1,
0.7416096, 0.7820976, 0.1712236, 1, 1, 1, 1, 1,
0.7458609, -0.7139921, 3.044421, 1, 1, 1, 1, 1,
0.7551208, -0.05884151, 3.302966, 1, 1, 1, 1, 1,
0.7561704, 0.4542924, 1.543953, 1, 1, 1, 1, 1,
0.7588832, -0.9016196, 2.936928, 1, 1, 1, 1, 1,
0.7703707, -1.40584, 3.340907, 1, 1, 1, 1, 1,
0.773773, -0.3272732, 2.394418, 1, 1, 1, 1, 1,
0.7753863, -0.4487776, 2.107831, 1, 1, 1, 1, 1,
0.7762888, -0.8681913, 1.858473, 1, 1, 1, 1, 1,
0.7764412, -2.114967, 1.970247, 1, 1, 1, 1, 1,
0.7769157, 1.362497, 0.4073685, 1, 1, 1, 1, 1,
0.7773855, -1.21965, 2.447208, 1, 1, 1, 1, 1,
0.7808548, 0.378801, -0.1786384, 1, 1, 1, 1, 1,
0.7809284, 0.9789557, 0.2437473, 1, 1, 1, 1, 1,
0.7846659, -0.02415193, 1.994538, 0, 0, 1, 1, 1,
0.7889483, -0.6231067, 3.383466, 1, 0, 0, 1, 1,
0.7995567, -0.5700669, 1.928398, 1, 0, 0, 1, 1,
0.8027618, 0.2284859, 1.603473, 1, 0, 0, 1, 1,
0.8030489, -1.668252, 3.32244, 1, 0, 0, 1, 1,
0.8099239, 0.6827633, -0.4236478, 1, 0, 0, 1, 1,
0.8149719, 0.1929419, 2.91645, 0, 0, 0, 1, 1,
0.8154409, 0.7849717, 1.122569, 0, 0, 0, 1, 1,
0.8173233, 0.8804805, -0.01353529, 0, 0, 0, 1, 1,
0.8199775, -1.004936, 2.526071, 0, 0, 0, 1, 1,
0.8266459, 0.8094546, 1.43424, 0, 0, 0, 1, 1,
0.8315344, 0.01700463, 1.163973, 0, 0, 0, 1, 1,
0.8384873, 0.5506998, -0.4942437, 0, 0, 0, 1, 1,
0.8415475, -0.463961, 2.335413, 1, 1, 1, 1, 1,
0.8445089, 0.655515, 0.009421046, 1, 1, 1, 1, 1,
0.846838, 1.613644, -0.1701462, 1, 1, 1, 1, 1,
0.8494475, 1.735684, -0.4511122, 1, 1, 1, 1, 1,
0.8642375, 1.024895, -0.8204229, 1, 1, 1, 1, 1,
0.8732272, 0.6051813, 1.955624, 1, 1, 1, 1, 1,
0.8850781, -1.390293, 4.608493, 1, 1, 1, 1, 1,
0.8854902, 1.127563, 0.6149791, 1, 1, 1, 1, 1,
0.8992655, 1.510363, -1.149397, 1, 1, 1, 1, 1,
0.9028608, 0.197248, 0.7420742, 1, 1, 1, 1, 1,
0.9052531, 0.3178678, 0.9088692, 1, 1, 1, 1, 1,
0.906997, 1.038039, -0.5370638, 1, 1, 1, 1, 1,
0.9194546, 1.122881, 1.646797, 1, 1, 1, 1, 1,
0.9289099, 1.478512, 0.4291913, 1, 1, 1, 1, 1,
0.9307208, 0.3433727, 4.388087, 1, 1, 1, 1, 1,
0.9321921, 0.3190025, 0.5951107, 0, 0, 1, 1, 1,
0.9332172, 0.6731222, 0.7549212, 1, 0, 0, 1, 1,
0.9446409, 0.2683628, 2.684955, 1, 0, 0, 1, 1,
0.9482837, -0.5956783, 2.609275, 1, 0, 0, 1, 1,
0.9523078, 1.416826, 1.448352, 1, 0, 0, 1, 1,
0.9757839, 2.097837, 0.6534228, 1, 0, 0, 1, 1,
0.9900596, 0.4879216, 0.6769196, 0, 0, 0, 1, 1,
0.990701, -0.03061746, 0.5948919, 0, 0, 0, 1, 1,
0.9916915, -0.8701121, 1.416676, 0, 0, 0, 1, 1,
0.9929275, -0.8864813, 1.790821, 0, 0, 0, 1, 1,
0.9946463, 0.03819039, 1.182656, 0, 0, 0, 1, 1,
0.9973106, -0.1787569, 1.743611, 0, 0, 0, 1, 1,
0.9983125, 0.4612962, 0.7144684, 0, 0, 0, 1, 1,
1.007459, -1.199137, 2.500036, 1, 1, 1, 1, 1,
1.010857, -0.7863435, 1.971206, 1, 1, 1, 1, 1,
1.01264, -2.685707, 2.662343, 1, 1, 1, 1, 1,
1.016371, 0.6930271, -0.3184962, 1, 1, 1, 1, 1,
1.019008, -0.6617289, 4.185554, 1, 1, 1, 1, 1,
1.019935, -0.6943172, 3.756771, 1, 1, 1, 1, 1,
1.031494, 1.381778, 0.3687807, 1, 1, 1, 1, 1,
1.03611, -0.3972239, 2.599219, 1, 1, 1, 1, 1,
1.043965, -1.038277, 2.060805, 1, 1, 1, 1, 1,
1.048293, -0.7678519, 0.8275327, 1, 1, 1, 1, 1,
1.051141, -0.9949135, 1.947433, 1, 1, 1, 1, 1,
1.056565, -0.02417398, 0.6701922, 1, 1, 1, 1, 1,
1.0566, 0.05517147, 2.371132, 1, 1, 1, 1, 1,
1.061319, 0.192845, -0.4652206, 1, 1, 1, 1, 1,
1.062224, -0.07749547, 1.854746, 1, 1, 1, 1, 1,
1.064631, -0.05405701, 0.09810162, 0, 0, 1, 1, 1,
1.071536, -0.2248746, 0.1857943, 1, 0, 0, 1, 1,
1.080831, 0.07281518, 1.022128, 1, 0, 0, 1, 1,
1.086071, 0.7298778, 0.8723978, 1, 0, 0, 1, 1,
1.089346, 0.3860517, 1.374671, 1, 0, 0, 1, 1,
1.092934, -1.50252, 3.796637, 1, 0, 0, 1, 1,
1.104309, -0.134523, 1.166003, 0, 0, 0, 1, 1,
1.105154, -1.421482, 1.818201, 0, 0, 0, 1, 1,
1.10638, 0.06481102, 3.182138, 0, 0, 0, 1, 1,
1.106415, -1.103632, 1.523039, 0, 0, 0, 1, 1,
1.113521, 0.4176915, 1.965757, 0, 0, 0, 1, 1,
1.115783, -0.02235977, 2.20726, 0, 0, 0, 1, 1,
1.119453, 0.4412547, 0.6596221, 0, 0, 0, 1, 1,
1.119922, -1.965669, 2.182103, 1, 1, 1, 1, 1,
1.121209, 1.498672, 1.614737, 1, 1, 1, 1, 1,
1.136074, 0.7777097, 0.4394035, 1, 1, 1, 1, 1,
1.1406, -0.3001649, 1.333371, 1, 1, 1, 1, 1,
1.144849, -1.380541, 2.77613, 1, 1, 1, 1, 1,
1.14991, -0.4698921, 0.7933704, 1, 1, 1, 1, 1,
1.154095, 1.250799, 0.8679577, 1, 1, 1, 1, 1,
1.162204, -0.7044851, 0.9485874, 1, 1, 1, 1, 1,
1.166564, -0.3054577, 0.549465, 1, 1, 1, 1, 1,
1.176162, 0.2601647, 2.306472, 1, 1, 1, 1, 1,
1.177022, -0.1340483, 1.226554, 1, 1, 1, 1, 1,
1.181122, 0.8858478, 1.046988, 1, 1, 1, 1, 1,
1.181429, -0.9199544, 2.094676, 1, 1, 1, 1, 1,
1.182929, -0.5693273, 1.291841, 1, 1, 1, 1, 1,
1.192352, 0.05183162, 1.349586, 1, 1, 1, 1, 1,
1.196211, 1.024444, 1.267043, 0, 0, 1, 1, 1,
1.202242, 0.253269, 0.1571901, 1, 0, 0, 1, 1,
1.204164, 0.219881, 0.9603063, 1, 0, 0, 1, 1,
1.210618, 1.007038, 2.10684, 1, 0, 0, 1, 1,
1.213329, 2.05317, 0.4316439, 1, 0, 0, 1, 1,
1.216452, 1.554892, 0.2789747, 1, 0, 0, 1, 1,
1.227831, 0.2798205, -0.2626995, 0, 0, 0, 1, 1,
1.231791, -0.2424613, 1.419415, 0, 0, 0, 1, 1,
1.23241, -0.06287356, 0.3244525, 0, 0, 0, 1, 1,
1.235663, -0.2579302, 1.95085, 0, 0, 0, 1, 1,
1.248162, -0.07947741, 1.29021, 0, 0, 0, 1, 1,
1.251555, 0.6228313, 0.5305704, 0, 0, 0, 1, 1,
1.264439, 1.506929, 2.025275, 0, 0, 0, 1, 1,
1.266047, 0.9853081, 0.8290495, 1, 1, 1, 1, 1,
1.273079, 1.070853, 0.2022666, 1, 1, 1, 1, 1,
1.280928, -0.5594138, 2.985716, 1, 1, 1, 1, 1,
1.282541, -0.4062428, 3.398167, 1, 1, 1, 1, 1,
1.282645, 0.4148601, 1.545846, 1, 1, 1, 1, 1,
1.283225, -1.796717, 3.991879, 1, 1, 1, 1, 1,
1.284848, -1.33676, 3.248038, 1, 1, 1, 1, 1,
1.285523, -0.2192144, 0.05707712, 1, 1, 1, 1, 1,
1.296046, -0.3690707, 1.158463, 1, 1, 1, 1, 1,
1.297752, 0.5199038, 0.4120935, 1, 1, 1, 1, 1,
1.300627, -0.08886077, 2.157841, 1, 1, 1, 1, 1,
1.310514, -0.4174196, 2.368478, 1, 1, 1, 1, 1,
1.313765, -0.1322766, 1.954446, 1, 1, 1, 1, 1,
1.325782, 0.6656646, 3.844941, 1, 1, 1, 1, 1,
1.328229, -0.9244547, 0.09163325, 1, 1, 1, 1, 1,
1.329657, -1.047546, 1.19837, 0, 0, 1, 1, 1,
1.335751, -0.254551, 1.905036, 1, 0, 0, 1, 1,
1.335939, 0.2021991, -0.001675041, 1, 0, 0, 1, 1,
1.339166, 0.5740604, 1.747932, 1, 0, 0, 1, 1,
1.34578, 0.1777688, -0.7510156, 1, 0, 0, 1, 1,
1.353594, 1.357614, 1.437488, 1, 0, 0, 1, 1,
1.354322, 1.833241, 0.8618367, 0, 0, 0, 1, 1,
1.360473, 0.3914984, 1.116828, 0, 0, 0, 1, 1,
1.36087, 0.5673975, 1.673222, 0, 0, 0, 1, 1,
1.363203, 0.2402183, -1.381045, 0, 0, 0, 1, 1,
1.384038, 0.279515, -0.4466148, 0, 0, 0, 1, 1,
1.388833, 1.408241, -1.462757, 0, 0, 0, 1, 1,
1.392659, 1.23038, 0.9414669, 0, 0, 0, 1, 1,
1.394223, 0.07550603, 2.081996, 1, 1, 1, 1, 1,
1.394474, -0.7740791, 0.6606581, 1, 1, 1, 1, 1,
1.401232, 0.3000294, 2.250223, 1, 1, 1, 1, 1,
1.409738, 0.885872, 0.7860809, 1, 1, 1, 1, 1,
1.423652, 1.320255, 0.2870058, 1, 1, 1, 1, 1,
1.426738, 0.4371181, 0.05312436, 1, 1, 1, 1, 1,
1.427356, -1.24452, 2.262476, 1, 1, 1, 1, 1,
1.428234, -1.830467, 3.007181, 1, 1, 1, 1, 1,
1.432127, -0.1469453, 2.622985, 1, 1, 1, 1, 1,
1.436245, 0.2582009, 0.2595033, 1, 1, 1, 1, 1,
1.475974, -0.6166775, 1.072746, 1, 1, 1, 1, 1,
1.477188, 1.344631, 3.210565, 1, 1, 1, 1, 1,
1.493327, 1.016225, 0.1757975, 1, 1, 1, 1, 1,
1.496036, -0.7764639, 2.711725, 1, 1, 1, 1, 1,
1.499273, 1.104101, 1.406679, 1, 1, 1, 1, 1,
1.4997, -2.064188, 2.27569, 0, 0, 1, 1, 1,
1.504568, 0.9662497, 2.259807, 1, 0, 0, 1, 1,
1.507125, 0.7989311, 0.5715379, 1, 0, 0, 1, 1,
1.511019, -0.6608671, 1.537941, 1, 0, 0, 1, 1,
1.511264, -0.02714133, 1.715532, 1, 0, 0, 1, 1,
1.519741, -0.694102, 2.453416, 1, 0, 0, 1, 1,
1.535615, -0.0499657, 1.266643, 0, 0, 0, 1, 1,
1.54033, 0.8588482, 2.519381, 0, 0, 0, 1, 1,
1.552999, -0.697947, 3.59645, 0, 0, 0, 1, 1,
1.5534, -1.882681, 3.100979, 0, 0, 0, 1, 1,
1.554512, 0.6526244, -0.206247, 0, 0, 0, 1, 1,
1.572003, -1.460569, 2.584181, 0, 0, 0, 1, 1,
1.578738, -0.06691077, 2.830493, 0, 0, 0, 1, 1,
1.581592, -0.5384744, 1.166263, 1, 1, 1, 1, 1,
1.591324, 1.424965, 1.156484, 1, 1, 1, 1, 1,
1.599862, -2.284076, 3.784592, 1, 1, 1, 1, 1,
1.605294, -0.475598, 1.964574, 1, 1, 1, 1, 1,
1.607318, 0.9695296, 1.620144, 1, 1, 1, 1, 1,
1.620782, -1.265933, 1.773143, 1, 1, 1, 1, 1,
1.629734, 1.267943, 1.372282, 1, 1, 1, 1, 1,
1.642009, 0.9918724, 0.1425385, 1, 1, 1, 1, 1,
1.645271, -0.5170853, 0.6706908, 1, 1, 1, 1, 1,
1.646729, -1.531056, 1.386949, 1, 1, 1, 1, 1,
1.655799, -0.126918, 1.576691, 1, 1, 1, 1, 1,
1.666827, -0.01813963, 1.207108, 1, 1, 1, 1, 1,
1.670018, -1.400812, 1.863354, 1, 1, 1, 1, 1,
1.682159, 0.02877142, 2.084482, 1, 1, 1, 1, 1,
1.682275, 1.008084, 0.9001215, 1, 1, 1, 1, 1,
1.682905, -0.2505692, 3.609015, 0, 0, 1, 1, 1,
1.686689, 0.7727764, -0.4639429, 1, 0, 0, 1, 1,
1.696422, 1.481268, 1.421041, 1, 0, 0, 1, 1,
1.702769, -0.4985542, 0.2323714, 1, 0, 0, 1, 1,
1.704042, -1.623176, 1.090536, 1, 0, 0, 1, 1,
1.706488, 0.4188035, 2.967821, 1, 0, 0, 1, 1,
1.723623, -0.4446259, 0.8219317, 0, 0, 0, 1, 1,
1.727662, 0.8315045, -0.5947784, 0, 0, 0, 1, 1,
1.72825, -0.8164597, 3.764814, 0, 0, 0, 1, 1,
1.74524, 1.727678, 0.8354447, 0, 0, 0, 1, 1,
1.752992, -0.4899678, 1.735502, 0, 0, 0, 1, 1,
1.766879, -1.175156, 0.6011236, 0, 0, 0, 1, 1,
1.767308, 1.202987, 0.6051744, 0, 0, 0, 1, 1,
1.775232, -1.201893, 2.382451, 1, 1, 1, 1, 1,
1.779176, -1.071419, 2.331182, 1, 1, 1, 1, 1,
1.792949, 1.25925, 2.124521, 1, 1, 1, 1, 1,
1.800089, 0.2297211, 2.039148, 1, 1, 1, 1, 1,
1.834099, -0.3009119, 1.650098, 1, 1, 1, 1, 1,
1.84079, -1.360659, 0.03589415, 1, 1, 1, 1, 1,
1.92707, 0.9198543, -0.01438371, 1, 1, 1, 1, 1,
1.930021, -2.324135, 3.327783, 1, 1, 1, 1, 1,
1.938994, -1.139504, 1.418676, 1, 1, 1, 1, 1,
1.941342, 0.8680988, 1.330855, 1, 1, 1, 1, 1,
1.955963, 1.497952, 2.040156, 1, 1, 1, 1, 1,
1.967542, 0.06181332, 1.752586, 1, 1, 1, 1, 1,
1.993923, -1.921464, 2.654659, 1, 1, 1, 1, 1,
2.000853, 0.4183943, 1.085284, 1, 1, 1, 1, 1,
2.005316, -0.9141389, 0.8427589, 1, 1, 1, 1, 1,
2.053873, 0.2530525, -0.1421057, 0, 0, 1, 1, 1,
2.178271, -0.7437662, 0.9680727, 1, 0, 0, 1, 1,
2.186925, 1.199369, 2.334113, 1, 0, 0, 1, 1,
2.199179, -0.08570889, 0.8858164, 1, 0, 0, 1, 1,
2.210249, -0.8891919, 3.207172, 1, 0, 0, 1, 1,
2.213825, 0.02970004, 0.2665037, 1, 0, 0, 1, 1,
2.252952, 1.489357, 0.2243541, 0, 0, 0, 1, 1,
2.256145, -1.877455, 1.723356, 0, 0, 0, 1, 1,
2.292728, 1.245958, 2.296014, 0, 0, 0, 1, 1,
2.412994, -2.285389, 1.11349, 0, 0, 0, 1, 1,
2.426275, -1.250895, 2.440032, 0, 0, 0, 1, 1,
2.429499, 0.1965166, 2.150725, 0, 0, 0, 1, 1,
2.436748, -0.4628337, 1.654094, 0, 0, 0, 1, 1,
2.477584, -0.7674911, 0.6057122, 1, 1, 1, 1, 1,
2.499594, 0.5817839, 1.200728, 1, 1, 1, 1, 1,
2.700929, 0.399061, 0.7437289, 1, 1, 1, 1, 1,
2.904379, 0.4538181, 0.5062174, 1, 1, 1, 1, 1,
2.958078, -0.9281002, -0.04473846, 1, 1, 1, 1, 1,
3.17032, -1.117048, 0.7789443, 1, 1, 1, 1, 1,
3.426682, -0.9989038, 0.4287364, 1, 1, 1, 1, 1
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
var radius = 9.463883;
var distance = 33.24149;
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
mvMatrix.translate( -0.0246172, 0.4458449, 0.08259988 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.24149);
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
