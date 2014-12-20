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
-3.243288, 1.956207, -1.494916, 1, 0, 0, 1,
-3.084879, -1.008253, -0.7433989, 1, 0.007843138, 0, 1,
-2.810442, -1.112865, -1.703054, 1, 0.01176471, 0, 1,
-2.661072, 0.1123533, -2.50187, 1, 0.01960784, 0, 1,
-2.604427, -1.287015, -2.762243, 1, 0.02352941, 0, 1,
-2.40078, 1.055864, 0.1070086, 1, 0.03137255, 0, 1,
-2.362434, 0.7574734, -0.4050899, 1, 0.03529412, 0, 1,
-2.35062, 0.6460786, 0.2455061, 1, 0.04313726, 0, 1,
-2.337891, -2.691298, -3.413699, 1, 0.04705882, 0, 1,
-2.326807, 0.08466817, -1.72698, 1, 0.05490196, 0, 1,
-2.302844, -0.1188371, -1.782917, 1, 0.05882353, 0, 1,
-2.28338, 1.571392, -1.913682, 1, 0.06666667, 0, 1,
-2.283101, 0.9769439, -0.9193515, 1, 0.07058824, 0, 1,
-2.252648, 0.04310613, -0.4804406, 1, 0.07843138, 0, 1,
-2.19034, 0.773048, -2.218317, 1, 0.08235294, 0, 1,
-2.154483, 0.8108526, -2.143969, 1, 0.09019608, 0, 1,
-2.149144, 0.6230792, -1.605078, 1, 0.09411765, 0, 1,
-2.052004, -1.310168, -2.750886, 1, 0.1019608, 0, 1,
-2.046951, -0.3428357, -1.045682, 1, 0.1098039, 0, 1,
-2.03188, -1.029327, -2.119985, 1, 0.1137255, 0, 1,
-2.006256, 0.1625698, -2.303532, 1, 0.1215686, 0, 1,
-1.992757, 0.789887, -0.08370014, 1, 0.1254902, 0, 1,
-1.991479, -0.6543763, -3.37511, 1, 0.1333333, 0, 1,
-1.987575, 1.347915, -2.157446, 1, 0.1372549, 0, 1,
-1.982018, -2.266435, -3.004141, 1, 0.145098, 0, 1,
-1.973341, -0.008947467, -0.4295843, 1, 0.1490196, 0, 1,
-1.96161, -0.05440402, -1.047471, 1, 0.1568628, 0, 1,
-1.961424, 0.0009410118, -1.191916, 1, 0.1607843, 0, 1,
-1.941069, 0.4336887, 0.1110571, 1, 0.1686275, 0, 1,
-1.936439, 0.5823521, -0.2386402, 1, 0.172549, 0, 1,
-1.904667, -1.686992, -2.935783, 1, 0.1803922, 0, 1,
-1.897907, 2.72958, -0.9883029, 1, 0.1843137, 0, 1,
-1.89738, 3.1737, -1.40621, 1, 0.1921569, 0, 1,
-1.880166, -0.2512519, -1.182701, 1, 0.1960784, 0, 1,
-1.870332, 1.382204, -0.3122624, 1, 0.2039216, 0, 1,
-1.835719, -0.2567853, -1.105342, 1, 0.2117647, 0, 1,
-1.828508, -0.7783966, -2.39371, 1, 0.2156863, 0, 1,
-1.821621, 0.3157427, -1.468005, 1, 0.2235294, 0, 1,
-1.804077, -0.1114129, -2.307209, 1, 0.227451, 0, 1,
-1.791174, -0.8653713, -1.002549, 1, 0.2352941, 0, 1,
-1.787488, 1.128454, -0.09828058, 1, 0.2392157, 0, 1,
-1.786487, 3.000981, -1.529595, 1, 0.2470588, 0, 1,
-1.760741, 0.303148, -1.365686, 1, 0.2509804, 0, 1,
-1.754777, 0.2926852, -0.9803548, 1, 0.2588235, 0, 1,
-1.748386, -0.7009394, -2.33061, 1, 0.2627451, 0, 1,
-1.728231, 0.8953358, -0.3329113, 1, 0.2705882, 0, 1,
-1.727689, -0.1851957, -2.353827, 1, 0.2745098, 0, 1,
-1.710335, -1.006755, -0.517801, 1, 0.282353, 0, 1,
-1.693931, -0.5365001, -1.765585, 1, 0.2862745, 0, 1,
-1.691831, -1.83964, -2.922621, 1, 0.2941177, 0, 1,
-1.681376, -0.4995984, -0.6282076, 1, 0.3019608, 0, 1,
-1.67191, -0.2027032, -1.293068, 1, 0.3058824, 0, 1,
-1.671787, 0.4171354, -1.099032, 1, 0.3137255, 0, 1,
-1.663931, -0.6119196, -2.955897, 1, 0.3176471, 0, 1,
-1.65002, 0.1381499, -2.371764, 1, 0.3254902, 0, 1,
-1.6271, 0.9038644, -0.3982777, 1, 0.3294118, 0, 1,
-1.625425, 1.060382, 0.3201973, 1, 0.3372549, 0, 1,
-1.617353, 0.3052215, -2.172494, 1, 0.3411765, 0, 1,
-1.614708, 0.9227338, -2.102729, 1, 0.3490196, 0, 1,
-1.605476, 1.696602, -0.3120611, 1, 0.3529412, 0, 1,
-1.597729, 0.5641215, -0.3159422, 1, 0.3607843, 0, 1,
-1.595145, 1.960479, -0.03973389, 1, 0.3647059, 0, 1,
-1.59074, 0.5623439, -1.795174, 1, 0.372549, 0, 1,
-1.588273, -1.10333, 0.4705413, 1, 0.3764706, 0, 1,
-1.585747, 0.3217323, -1.440293, 1, 0.3843137, 0, 1,
-1.568965, 0.4433298, -2.152184, 1, 0.3882353, 0, 1,
-1.554814, 1.499358, -1.455443, 1, 0.3960784, 0, 1,
-1.539353, -0.3613632, -2.704395, 1, 0.4039216, 0, 1,
-1.536707, 0.5475108, -2.009485, 1, 0.4078431, 0, 1,
-1.532029, 0.7039726, -0.9374641, 1, 0.4156863, 0, 1,
-1.530882, 0.6008809, -2.095331, 1, 0.4196078, 0, 1,
-1.528618, -1.248833, -3.874995, 1, 0.427451, 0, 1,
-1.528017, -0.6290913, -1.115329, 1, 0.4313726, 0, 1,
-1.527553, -1.887751, -0.7645178, 1, 0.4392157, 0, 1,
-1.525693, -0.7103665, -1.634609, 1, 0.4431373, 0, 1,
-1.518233, 0.467795, -1.693372, 1, 0.4509804, 0, 1,
-1.51306, 0.641192, -2.275007, 1, 0.454902, 0, 1,
-1.496013, 0.1840631, 0.3704113, 1, 0.4627451, 0, 1,
-1.479377, -0.7631478, -1.857516, 1, 0.4666667, 0, 1,
-1.475487, -0.8923224, -2.645294, 1, 0.4745098, 0, 1,
-1.4338, -0.1671563, -1.803826, 1, 0.4784314, 0, 1,
-1.422146, 1.128817, -1.536174, 1, 0.4862745, 0, 1,
-1.420453, 1.311438, -1.734198, 1, 0.4901961, 0, 1,
-1.417119, 0.6308956, 0.009914468, 1, 0.4980392, 0, 1,
-1.409667, -0.1054307, 0.1632459, 1, 0.5058824, 0, 1,
-1.402062, 0.3166927, -0.5902297, 1, 0.509804, 0, 1,
-1.387959, 0.489022, -1.997609, 1, 0.5176471, 0, 1,
-1.375068, -1.191212, -2.078197, 1, 0.5215687, 0, 1,
-1.375046, -0.3426376, -0.7352754, 1, 0.5294118, 0, 1,
-1.370791, 1.552473, 0.2779766, 1, 0.5333334, 0, 1,
-1.354941, -0.6284552, -2.327239, 1, 0.5411765, 0, 1,
-1.349837, 2.119896, -0.524658, 1, 0.5450981, 0, 1,
-1.348163, 0.3486058, 0.6198981, 1, 0.5529412, 0, 1,
-1.347883, 0.2501922, -0.2590142, 1, 0.5568628, 0, 1,
-1.346616, 2.312173, 0.2010039, 1, 0.5647059, 0, 1,
-1.34171, 0.7708975, -0.5965385, 1, 0.5686275, 0, 1,
-1.341358, 0.5925849, -1.058107, 1, 0.5764706, 0, 1,
-1.334435, 0.3473102, -1.335439, 1, 0.5803922, 0, 1,
-1.328643, -0.6727588, 0.7646995, 1, 0.5882353, 0, 1,
-1.32117, 0.3651855, -1.718635, 1, 0.5921569, 0, 1,
-1.291583, 0.5085279, -1.721196, 1, 0.6, 0, 1,
-1.290143, -0.2360076, -1.408726, 1, 0.6078432, 0, 1,
-1.289146, -0.8876255, -0.3844707, 1, 0.6117647, 0, 1,
-1.288681, -0.07307854, -1.505648, 1, 0.6196079, 0, 1,
-1.284462, -0.05093675, -1.923735, 1, 0.6235294, 0, 1,
-1.281618, 1.832415, 0.3569996, 1, 0.6313726, 0, 1,
-1.277416, -0.7593143, -0.921083, 1, 0.6352941, 0, 1,
-1.273406, -0.6289642, -3.274598, 1, 0.6431373, 0, 1,
-1.269786, -0.7542942, -3.560629, 1, 0.6470588, 0, 1,
-1.265269, 0.5640059, -0.3267069, 1, 0.654902, 0, 1,
-1.255484, 1.263456, -1.360289, 1, 0.6588235, 0, 1,
-1.254459, -0.5470501, -3.231005, 1, 0.6666667, 0, 1,
-1.242481, -0.9151471, -2.06854, 1, 0.6705883, 0, 1,
-1.236979, 0.01170981, -2.013084, 1, 0.6784314, 0, 1,
-1.231169, 0.2087954, -1.332581, 1, 0.682353, 0, 1,
-1.22476, -2.257927, -1.860062, 1, 0.6901961, 0, 1,
-1.217993, 1.332595, -0.09469456, 1, 0.6941177, 0, 1,
-1.216189, 0.9173086, -0.8556664, 1, 0.7019608, 0, 1,
-1.198482, -0.4851061, -3.99655, 1, 0.7098039, 0, 1,
-1.193496, -0.01453459, -0.8890464, 1, 0.7137255, 0, 1,
-1.181309, 0.8732651, -2.481458, 1, 0.7215686, 0, 1,
-1.178578, 0.2191403, -1.008892, 1, 0.7254902, 0, 1,
-1.172651, 1.450817, -0.2756364, 1, 0.7333333, 0, 1,
-1.167853, 1.014862, -2.147399, 1, 0.7372549, 0, 1,
-1.160441, 0.6341915, -2.597963, 1, 0.7450981, 0, 1,
-1.150402, -1.050253, -1.08152, 1, 0.7490196, 0, 1,
-1.148189, -1.939892, -2.749749, 1, 0.7568628, 0, 1,
-1.144708, -1.391712, -2.910559, 1, 0.7607843, 0, 1,
-1.141975, 0.5028037, -0.6059442, 1, 0.7686275, 0, 1,
-1.14119, 0.1859561, -1.004701, 1, 0.772549, 0, 1,
-1.139163, -0.3175659, -1.979591, 1, 0.7803922, 0, 1,
-1.133726, -0.496061, -2.595512, 1, 0.7843137, 0, 1,
-1.130715, 0.338485, -1.989144, 1, 0.7921569, 0, 1,
-1.130019, -1.195789, -5.185044, 1, 0.7960784, 0, 1,
-1.124253, 1.62202, -0.07444984, 1, 0.8039216, 0, 1,
-1.123458, 0.7559702, -0.1629732, 1, 0.8117647, 0, 1,
-1.112546, 1.404834, 0.1649865, 1, 0.8156863, 0, 1,
-1.112451, 0.4115217, 0.1635738, 1, 0.8235294, 0, 1,
-1.107259, 1.822771, -0.2094667, 1, 0.827451, 0, 1,
-1.106992, 2.040323, 0.04972532, 1, 0.8352941, 0, 1,
-1.10076, -0.341712, -1.484934, 1, 0.8392157, 0, 1,
-1.097202, -0.3342184, -2.517808, 1, 0.8470588, 0, 1,
-1.094938, -0.2862402, -0.775227, 1, 0.8509804, 0, 1,
-1.085456, 1.514589, -0.2837306, 1, 0.8588235, 0, 1,
-1.083253, 0.3474233, -2.061884, 1, 0.8627451, 0, 1,
-1.063034, -0.2437739, -0.813939, 1, 0.8705882, 0, 1,
-1.061488, 0.8470482, -1.328859, 1, 0.8745098, 0, 1,
-1.052576, 1.030132, -2.293003, 1, 0.8823529, 0, 1,
-1.046385, 0.3472163, -0.5185347, 1, 0.8862745, 0, 1,
-1.046269, 1.092455, -0.4383894, 1, 0.8941177, 0, 1,
-1.044275, -0.9479181, -2.002451, 1, 0.8980392, 0, 1,
-1.037789, 0.5107217, -0.8418925, 1, 0.9058824, 0, 1,
-1.036517, -0.656601, -2.504646, 1, 0.9137255, 0, 1,
-1.033113, 0.6430644, -0.9134374, 1, 0.9176471, 0, 1,
-1.027765, 0.3508478, -0.08625296, 1, 0.9254902, 0, 1,
-1.023892, -0.2748567, -0.7114155, 1, 0.9294118, 0, 1,
-1.023684, -1.719917, -3.299828, 1, 0.9372549, 0, 1,
-1.021816, 2.088432, -0.75222, 1, 0.9411765, 0, 1,
-1.019278, -1.46423, -1.323768, 1, 0.9490196, 0, 1,
-1.007226, 2.00476, -0.09279237, 1, 0.9529412, 0, 1,
-0.9908085, 1.631963, -0.08677758, 1, 0.9607843, 0, 1,
-0.9856719, -0.9634596, -1.810878, 1, 0.9647059, 0, 1,
-0.981625, -0.04462045, -2.156338, 1, 0.972549, 0, 1,
-0.9811297, 1.943684, -0.915056, 1, 0.9764706, 0, 1,
-0.9796216, 1.061075, -0.2252918, 1, 0.9843137, 0, 1,
-0.9723601, 1.632599, 0.7275702, 1, 0.9882353, 0, 1,
-0.9666672, -2.031741, -0.4813195, 1, 0.9960784, 0, 1,
-0.9608299, -0.696892, -0.3850041, 0.9960784, 1, 0, 1,
-0.9594511, -0.216882, -2.686733, 0.9921569, 1, 0, 1,
-0.9569578, 0.5933838, -1.35699, 0.9843137, 1, 0, 1,
-0.949675, -0.2333699, -1.757312, 0.9803922, 1, 0, 1,
-0.9466641, 1.879448, -0.3315644, 0.972549, 1, 0, 1,
-0.9449838, 0.8929299, 0.2206516, 0.9686275, 1, 0, 1,
-0.9438075, -0.1926201, -1.450945, 0.9607843, 1, 0, 1,
-0.9296206, -0.8680565, -2.46779, 0.9568627, 1, 0, 1,
-0.929434, 0.3615741, -0.8306652, 0.9490196, 1, 0, 1,
-0.9264792, 1.684464, -2.375267, 0.945098, 1, 0, 1,
-0.9236067, 0.7199979, -1.715245, 0.9372549, 1, 0, 1,
-0.9140602, 2.874501, -0.2535509, 0.9333333, 1, 0, 1,
-0.9115183, -0.9603313, -4.375359, 0.9254902, 1, 0, 1,
-0.9042671, -0.1418776, -1.966833, 0.9215686, 1, 0, 1,
-0.9030843, 0.362839, -0.3610843, 0.9137255, 1, 0, 1,
-0.8962206, -0.7507066, -2.641836, 0.9098039, 1, 0, 1,
-0.8753895, -1.129643, -1.690224, 0.9019608, 1, 0, 1,
-0.8618393, -0.21214, -0.07610419, 0.8941177, 1, 0, 1,
-0.8605841, -0.5099689, -2.065668, 0.8901961, 1, 0, 1,
-0.8569677, 0.97685, 0.02294167, 0.8823529, 1, 0, 1,
-0.8541559, 0.2664489, -1.284816, 0.8784314, 1, 0, 1,
-0.8486382, -1.225619, -2.320283, 0.8705882, 1, 0, 1,
-0.8478108, 1.118088, 0.6285804, 0.8666667, 1, 0, 1,
-0.847115, 0.282785, -1.610786, 0.8588235, 1, 0, 1,
-0.8452441, 0.612564, 0.5118375, 0.854902, 1, 0, 1,
-0.8384117, 0.3664274, -0.6790707, 0.8470588, 1, 0, 1,
-0.8368044, -2.487179, -3.050931, 0.8431373, 1, 0, 1,
-0.8343996, -1.852662, -3.257933, 0.8352941, 1, 0, 1,
-0.8342592, 1.037569, -0.9426222, 0.8313726, 1, 0, 1,
-0.8214194, 2.351329, -0.03264515, 0.8235294, 1, 0, 1,
-0.8198486, 1.667537, -0.9283791, 0.8196079, 1, 0, 1,
-0.8097982, 0.1953192, -2.800128, 0.8117647, 1, 0, 1,
-0.8094307, -0.1857529, -1.991318, 0.8078431, 1, 0, 1,
-0.807983, -1.188403, -1.763161, 0.8, 1, 0, 1,
-0.8068293, 1.154168, -0.7676089, 0.7921569, 1, 0, 1,
-0.8061444, -0.6685893, -1.820615, 0.7882353, 1, 0, 1,
-0.8056237, -0.4198876, -2.412488, 0.7803922, 1, 0, 1,
-0.8053188, 0.1521863, -0.762314, 0.7764706, 1, 0, 1,
-0.7970343, -1.002209, -2.339223, 0.7686275, 1, 0, 1,
-0.7956989, 0.6925786, -2.599883, 0.7647059, 1, 0, 1,
-0.7882715, 0.5633665, -2.222118, 0.7568628, 1, 0, 1,
-0.7875106, -0.03970027, -0.5431666, 0.7529412, 1, 0, 1,
-0.7801508, -0.5546177, -2.157789, 0.7450981, 1, 0, 1,
-0.7756578, 0.1773802, -2.729738, 0.7411765, 1, 0, 1,
-0.774252, -2.194911, -1.796838, 0.7333333, 1, 0, 1,
-0.7737277, 0.1824733, -1.829957, 0.7294118, 1, 0, 1,
-0.7713876, -0.5341802, -1.641352, 0.7215686, 1, 0, 1,
-0.7691652, 0.1785214, -3.423179, 0.7176471, 1, 0, 1,
-0.7656092, -0.2457785, -1.106754, 0.7098039, 1, 0, 1,
-0.7568316, -0.1457798, -2.227491, 0.7058824, 1, 0, 1,
-0.7548186, 1.039009, -1.910382, 0.6980392, 1, 0, 1,
-0.7506738, 1.263965, -0.6130515, 0.6901961, 1, 0, 1,
-0.7471722, 1.71231, 0.3652169, 0.6862745, 1, 0, 1,
-0.7463066, -0.4522231, -2.098914, 0.6784314, 1, 0, 1,
-0.7436014, 0.2422977, -0.9175585, 0.6745098, 1, 0, 1,
-0.7434886, -0.8707708, -3.1806, 0.6666667, 1, 0, 1,
-0.7388811, -0.958645, -3.408404, 0.6627451, 1, 0, 1,
-0.7298843, 0.7177992, 0.02640011, 0.654902, 1, 0, 1,
-0.7267339, -1.742486, -3.59446, 0.6509804, 1, 0, 1,
-0.7256742, -0.3343628, -0.7380419, 0.6431373, 1, 0, 1,
-0.7241023, 0.1339779, -1.080429, 0.6392157, 1, 0, 1,
-0.7235795, 1.352094, -0.6861296, 0.6313726, 1, 0, 1,
-0.7057775, -0.01530339, -2.3975, 0.627451, 1, 0, 1,
-0.6983579, -0.5731228, -1.680689, 0.6196079, 1, 0, 1,
-0.6974828, 0.8974365, -0.7649846, 0.6156863, 1, 0, 1,
-0.696255, 1.175015, -0.8897836, 0.6078432, 1, 0, 1,
-0.6942726, 0.05157836, -3.157885, 0.6039216, 1, 0, 1,
-0.6941957, -1.010034, -3.594081, 0.5960785, 1, 0, 1,
-0.6830418, 1.564847, -1.839871, 0.5882353, 1, 0, 1,
-0.6734048, -0.2056275, -1.35193, 0.5843138, 1, 0, 1,
-0.6733897, -0.03451073, -2.489632, 0.5764706, 1, 0, 1,
-0.6685884, 0.8931885, -1.237796, 0.572549, 1, 0, 1,
-0.667885, 0.981261, -1.435054, 0.5647059, 1, 0, 1,
-0.6652601, 0.9762614, 0.1314362, 0.5607843, 1, 0, 1,
-0.6647175, -0.2715127, -1.463313, 0.5529412, 1, 0, 1,
-0.6571376, 0.1377483, -2.820273, 0.5490196, 1, 0, 1,
-0.6545665, 0.1653347, -2.207194, 0.5411765, 1, 0, 1,
-0.6522738, 0.1128642, -0.4500794, 0.5372549, 1, 0, 1,
-0.6515236, -1.540412, -3.457904, 0.5294118, 1, 0, 1,
-0.651372, -0.1015123, -1.470095, 0.5254902, 1, 0, 1,
-0.6479934, 0.6304729, -1.455262, 0.5176471, 1, 0, 1,
-0.6460741, -1.998576, -1.549253, 0.5137255, 1, 0, 1,
-0.6354389, -0.3459332, -1.859731, 0.5058824, 1, 0, 1,
-0.6302294, 0.8230292, 0.06971659, 0.5019608, 1, 0, 1,
-0.6280092, -0.187715, -3.265675, 0.4941176, 1, 0, 1,
-0.6252626, -0.8936201, -3.104362, 0.4862745, 1, 0, 1,
-0.6195768, 0.6684526, 0.06017531, 0.4823529, 1, 0, 1,
-0.6173427, 0.4435806, -2.208765, 0.4745098, 1, 0, 1,
-0.6166095, -0.7595164, -4.104609, 0.4705882, 1, 0, 1,
-0.6140138, 0.08238201, -1.112652, 0.4627451, 1, 0, 1,
-0.6095823, 0.1509364, -2.054769, 0.4588235, 1, 0, 1,
-0.6063042, 0.1497283, -2.049368, 0.4509804, 1, 0, 1,
-0.5991136, 0.2009406, -2.242758, 0.4470588, 1, 0, 1,
-0.5988589, 0.6403207, 1.759059, 0.4392157, 1, 0, 1,
-0.5941338, -0.4528348, -2.446685, 0.4352941, 1, 0, 1,
-0.5928961, 1.393005, -2.28216, 0.427451, 1, 0, 1,
-0.5908098, -1.614641, -1.17793, 0.4235294, 1, 0, 1,
-0.589694, 0.9309034, -0.7160064, 0.4156863, 1, 0, 1,
-0.5853741, 0.7093693, 0.6048343, 0.4117647, 1, 0, 1,
-0.5832316, -1.291107, -2.663461, 0.4039216, 1, 0, 1,
-0.5818647, 0.07905537, 0.7496501, 0.3960784, 1, 0, 1,
-0.5814489, -1.308096, -2.767121, 0.3921569, 1, 0, 1,
-0.5807868, 0.6090016, -1.857897, 0.3843137, 1, 0, 1,
-0.5778075, -0.2404284, -0.8500581, 0.3803922, 1, 0, 1,
-0.5712075, 0.7184098, -2.385067, 0.372549, 1, 0, 1,
-0.5674138, -0.5631024, -2.270516, 0.3686275, 1, 0, 1,
-0.5637287, 1.4694, 0.3941188, 0.3607843, 1, 0, 1,
-0.56095, -2.373032, -2.080053, 0.3568628, 1, 0, 1,
-0.5566671, -0.09662039, -1.951948, 0.3490196, 1, 0, 1,
-0.5538507, -1.146681, -2.306679, 0.345098, 1, 0, 1,
-0.5476666, 0.1782781, -0.6220335, 0.3372549, 1, 0, 1,
-0.5473956, -2.635487, -2.724359, 0.3333333, 1, 0, 1,
-0.5400684, 0.6041501, -0.575601, 0.3254902, 1, 0, 1,
-0.5392733, 0.8439754, 0.7039041, 0.3215686, 1, 0, 1,
-0.5380604, 0.2228066, -1.779063, 0.3137255, 1, 0, 1,
-0.5362133, -0.380816, -2.231134, 0.3098039, 1, 0, 1,
-0.5336098, 0.5162395, -1.817152, 0.3019608, 1, 0, 1,
-0.526969, -1.032641, -0.8763846, 0.2941177, 1, 0, 1,
-0.5264834, -0.150625, -1.438338, 0.2901961, 1, 0, 1,
-0.5243495, 0.8684516, -1.677788, 0.282353, 1, 0, 1,
-0.5202049, -2.050905, -2.783091, 0.2784314, 1, 0, 1,
-0.5172663, -0.456927, -2.627676, 0.2705882, 1, 0, 1,
-0.5170009, -1.058441, -4.262158, 0.2666667, 1, 0, 1,
-0.5114065, 0.6840873, -0.1630992, 0.2588235, 1, 0, 1,
-0.5097311, -0.4731221, -2.610518, 0.254902, 1, 0, 1,
-0.5093569, -0.1471712, -1.320248, 0.2470588, 1, 0, 1,
-0.5088625, 2.362473, -0.1786392, 0.2431373, 1, 0, 1,
-0.5075417, 2.024684, -0.5088128, 0.2352941, 1, 0, 1,
-0.5064337, -2.146216, -2.454242, 0.2313726, 1, 0, 1,
-0.5058979, -0.07507227, -2.334371, 0.2235294, 1, 0, 1,
-0.5043495, -0.7776631, -2.476666, 0.2196078, 1, 0, 1,
-0.5001991, 2.307945, -1.091301, 0.2117647, 1, 0, 1,
-0.4997715, 0.6599634, -0.01199012, 0.2078431, 1, 0, 1,
-0.4982405, 1.268129, -0.2602991, 0.2, 1, 0, 1,
-0.497624, -0.1662808, -2.127641, 0.1921569, 1, 0, 1,
-0.4951843, 0.6969273, 1.126379, 0.1882353, 1, 0, 1,
-0.4920847, 1.557555, -1.197446, 0.1803922, 1, 0, 1,
-0.4900655, 1.069173, -1.781796, 0.1764706, 1, 0, 1,
-0.4865008, 0.823234, -2.171157, 0.1686275, 1, 0, 1,
-0.4856299, -1.853561, -3.476313, 0.1647059, 1, 0, 1,
-0.485447, 0.2826064, 0.427399, 0.1568628, 1, 0, 1,
-0.4830998, -0.6157335, -3.70151, 0.1529412, 1, 0, 1,
-0.4822586, 0.5904453, -0.5171854, 0.145098, 1, 0, 1,
-0.4822136, 0.0006752029, -0.3392697, 0.1411765, 1, 0, 1,
-0.48044, 0.7337696, -0.2234947, 0.1333333, 1, 0, 1,
-0.4781711, -0.2764412, -2.160706, 0.1294118, 1, 0, 1,
-0.477309, -0.4458201, -0.7742491, 0.1215686, 1, 0, 1,
-0.4736117, -0.3451075, -1.789068, 0.1176471, 1, 0, 1,
-0.4728469, -0.3720467, -0.4996556, 0.1098039, 1, 0, 1,
-0.4685412, 0.0370305, -2.509287, 0.1058824, 1, 0, 1,
-0.4655378, -0.127603, -1.06188, 0.09803922, 1, 0, 1,
-0.4605211, -1.752014, -3.080462, 0.09019608, 1, 0, 1,
-0.457975, -2.251419, -4.411229, 0.08627451, 1, 0, 1,
-0.4572845, 0.6862267, 0.04010845, 0.07843138, 1, 0, 1,
-0.4554736, 0.07480016, -2.100747, 0.07450981, 1, 0, 1,
-0.4542011, -0.1582741, -2.170659, 0.06666667, 1, 0, 1,
-0.4532844, -2.181319, -2.987221, 0.0627451, 1, 0, 1,
-0.4509916, 0.7475049, -1.650694, 0.05490196, 1, 0, 1,
-0.4433165, 0.2729189, -1.125966, 0.05098039, 1, 0, 1,
-0.4429888, 0.3255487, -0.4036295, 0.04313726, 1, 0, 1,
-0.4381455, 0.8256695, -1.224238, 0.03921569, 1, 0, 1,
-0.4320977, -0.3040194, -1.154263, 0.03137255, 1, 0, 1,
-0.4268503, 0.1568205, -2.380692, 0.02745098, 1, 0, 1,
-0.4262998, 0.9818533, 1.10125, 0.01960784, 1, 0, 1,
-0.4230149, 0.0473046, -0.575736, 0.01568628, 1, 0, 1,
-0.4219896, -0.2650233, -3.408441, 0.007843138, 1, 0, 1,
-0.4213631, 0.9477031, -1.41229, 0.003921569, 1, 0, 1,
-0.4124135, -1.383152, -2.781182, 0, 1, 0.003921569, 1,
-0.4083411, -0.2052227, -1.573368, 0, 1, 0.01176471, 1,
-0.4072776, -0.7609962, -0.933309, 0, 1, 0.01568628, 1,
-0.4058644, 0.4624606, -1.011008, 0, 1, 0.02352941, 1,
-0.3999187, 0.497563, 0.3688719, 0, 1, 0.02745098, 1,
-0.3989803, -0.9660531, -3.249645, 0, 1, 0.03529412, 1,
-0.3875827, 0.9867383, -1.576803, 0, 1, 0.03921569, 1,
-0.3875308, 0.2077919, -2.91721, 0, 1, 0.04705882, 1,
-0.3827889, -1.611917, -4.342613, 0, 1, 0.05098039, 1,
-0.377445, -0.9710621, -3.82025, 0, 1, 0.05882353, 1,
-0.3753139, 1.146886, -0.9119524, 0, 1, 0.0627451, 1,
-0.3720664, 0.1872226, -1.018516, 0, 1, 0.07058824, 1,
-0.3706971, -2.399838, -2.306592, 0, 1, 0.07450981, 1,
-0.364506, 0.09982792, -0.4235427, 0, 1, 0.08235294, 1,
-0.3611372, -0.2123685, -2.673566, 0, 1, 0.08627451, 1,
-0.3592299, -1.119735, -2.267963, 0, 1, 0.09411765, 1,
-0.3560243, 0.9515185, -0.8922396, 0, 1, 0.1019608, 1,
-0.3513882, -0.5248235, -1.271501, 0, 1, 0.1058824, 1,
-0.3508608, 0.785939, -0.05361441, 0, 1, 0.1137255, 1,
-0.3508586, 1.553081, 0.2170837, 0, 1, 0.1176471, 1,
-0.3498431, -0.4916181, -2.99799, 0, 1, 0.1254902, 1,
-0.3467425, 0.4064073, -0.6336306, 0, 1, 0.1294118, 1,
-0.3390868, 0.9939657, 0.7969335, 0, 1, 0.1372549, 1,
-0.3384583, 0.3826604, -0.712598, 0, 1, 0.1411765, 1,
-0.3294487, 1.344648, -1.636484, 0, 1, 0.1490196, 1,
-0.3263183, -0.729564, -0.6939023, 0, 1, 0.1529412, 1,
-0.3254192, 0.7186579, 0.2443413, 0, 1, 0.1607843, 1,
-0.3227365, 0.4445081, -0.9173433, 0, 1, 0.1647059, 1,
-0.312036, 1.712952, -0.6984668, 0, 1, 0.172549, 1,
-0.3080751, -1.977188, -3.161906, 0, 1, 0.1764706, 1,
-0.3065404, 3.219756, -0.742909, 0, 1, 0.1843137, 1,
-0.3029185, 1.815142, -0.6546103, 0, 1, 0.1882353, 1,
-0.3027853, -1.226994, -2.8922, 0, 1, 0.1960784, 1,
-0.3008619, -1.171847, -3.519707, 0, 1, 0.2039216, 1,
-0.2908421, -0.6441889, -3.111671, 0, 1, 0.2078431, 1,
-0.2902648, 1.321939, -0.3050638, 0, 1, 0.2156863, 1,
-0.2881492, 1.115068, -0.735586, 0, 1, 0.2196078, 1,
-0.2870939, 1.380683, 0.244142, 0, 1, 0.227451, 1,
-0.2856341, -0.9156724, -0.3723086, 0, 1, 0.2313726, 1,
-0.2845068, 0.1747817, -2.572826, 0, 1, 0.2392157, 1,
-0.280904, 1.1595, -0.7632195, 0, 1, 0.2431373, 1,
-0.2801196, 0.2267705, -1.914338, 0, 1, 0.2509804, 1,
-0.2781135, -1.813133, -2.465891, 0, 1, 0.254902, 1,
-0.2771302, 0.443663, -1.474571, 0, 1, 0.2627451, 1,
-0.2744951, 1.492033, 1.135783, 0, 1, 0.2666667, 1,
-0.2738539, -1.600783, -1.868751, 0, 1, 0.2745098, 1,
-0.273544, -0.06289184, -0.4416732, 0, 1, 0.2784314, 1,
-0.273267, -0.05712898, -0.6777073, 0, 1, 0.2862745, 1,
-0.2729412, 1.378872, 0.8983819, 0, 1, 0.2901961, 1,
-0.2713365, -0.01563168, -1.144059, 0, 1, 0.2980392, 1,
-0.269973, -0.7476082, -2.263773, 0, 1, 0.3058824, 1,
-0.2699203, 1.328361, 0.1494483, 0, 1, 0.3098039, 1,
-0.2691883, -0.9143932, -1.359876, 0, 1, 0.3176471, 1,
-0.2673054, 0.6304766, 0.2025957, 0, 1, 0.3215686, 1,
-0.2660193, -0.9773731, -1.700172, 0, 1, 0.3294118, 1,
-0.2617203, -1.935978, -2.783023, 0, 1, 0.3333333, 1,
-0.2612602, 0.2071388, 1.35066, 0, 1, 0.3411765, 1,
-0.2604717, -0.5846115, -2.876377, 0, 1, 0.345098, 1,
-0.2604636, -0.07069281, -1.511708, 0, 1, 0.3529412, 1,
-0.2603991, -0.05954686, -1.26552, 0, 1, 0.3568628, 1,
-0.2591663, 0.1534448, -1.109705, 0, 1, 0.3647059, 1,
-0.257262, -0.3714274, -5.24168, 0, 1, 0.3686275, 1,
-0.2542517, -0.5482454, -2.217683, 0, 1, 0.3764706, 1,
-0.2533936, 0.8141752, -1.308712, 0, 1, 0.3803922, 1,
-0.2527504, 1.353576, 0.1037129, 0, 1, 0.3882353, 1,
-0.2527016, -0.5874354, -3.675453, 0, 1, 0.3921569, 1,
-0.2451893, -1.210208, -2.085452, 0, 1, 0.4, 1,
-0.2378478, -0.5843798, -1.348468, 0, 1, 0.4078431, 1,
-0.2350531, 0.7328678, 0.3772465, 0, 1, 0.4117647, 1,
-0.2333672, -0.4173653, -2.790372, 0, 1, 0.4196078, 1,
-0.2319059, -0.6388198, -3.424026, 0, 1, 0.4235294, 1,
-0.230834, -0.01701059, -0.8592583, 0, 1, 0.4313726, 1,
-0.2269857, -0.3887219, -1.206059, 0, 1, 0.4352941, 1,
-0.2268651, 0.1045122, 1.002672, 0, 1, 0.4431373, 1,
-0.2238312, -0.2538556, -2.696375, 0, 1, 0.4470588, 1,
-0.2236793, 0.08880144, -1.168207, 0, 1, 0.454902, 1,
-0.2235902, 1.055582, -1.868285, 0, 1, 0.4588235, 1,
-0.2216887, 0.56221, -1.897582, 0, 1, 0.4666667, 1,
-0.2216575, -0.3454551, -2.125736, 0, 1, 0.4705882, 1,
-0.2207783, 1.51035, -0.7653911, 0, 1, 0.4784314, 1,
-0.2199568, 0.2024471, -0.7108483, 0, 1, 0.4823529, 1,
-0.2143461, 0.1448949, -0.5064092, 0, 1, 0.4901961, 1,
-0.2108677, 0.3381813, -0.8208683, 0, 1, 0.4941176, 1,
-0.2051264, -0.1882009, -2.3468, 0, 1, 0.5019608, 1,
-0.2036968, 1.567938, 0.5104027, 0, 1, 0.509804, 1,
-0.1920987, 0.122712, -2.394387, 0, 1, 0.5137255, 1,
-0.1883231, -1.145445, -1.707334, 0, 1, 0.5215687, 1,
-0.1882222, -0.7576308, -0.5735944, 0, 1, 0.5254902, 1,
-0.1852118, -0.7734686, -1.01026, 0, 1, 0.5333334, 1,
-0.1842192, -0.7702047, -1.834319, 0, 1, 0.5372549, 1,
-0.1830192, 0.6910066, -1.044034, 0, 1, 0.5450981, 1,
-0.1828073, -0.2799362, -1.010375, 0, 1, 0.5490196, 1,
-0.181806, -1.25029, -3.293531, 0, 1, 0.5568628, 1,
-0.1813181, 2.949861, -1.36237, 0, 1, 0.5607843, 1,
-0.1807512, 1.459549, 0.4724667, 0, 1, 0.5686275, 1,
-0.1799455, 0.5022179, -0.8584076, 0, 1, 0.572549, 1,
-0.1787262, 1.059362, 1.344918, 0, 1, 0.5803922, 1,
-0.1779336, 1.028466, 0.5461481, 0, 1, 0.5843138, 1,
-0.17264, -0.174418, -3.423215, 0, 1, 0.5921569, 1,
-0.1703337, -1.500223, -4.234588, 0, 1, 0.5960785, 1,
-0.1692096, -0.5206444, -3.330286, 0, 1, 0.6039216, 1,
-0.1675365, 0.6384864, -1.743374, 0, 1, 0.6117647, 1,
-0.1668752, 0.5392486, -1.028986, 0, 1, 0.6156863, 1,
-0.1656773, 1.09958, -2.40513, 0, 1, 0.6235294, 1,
-0.165561, 2.781609, -1.909757, 0, 1, 0.627451, 1,
-0.1620455, -0.2828515, -2.411093, 0, 1, 0.6352941, 1,
-0.1604296, -0.6110891, -1.879151, 0, 1, 0.6392157, 1,
-0.156702, 0.7771731, -0.9854149, 0, 1, 0.6470588, 1,
-0.1557595, -0.4053321, -3.590233, 0, 1, 0.6509804, 1,
-0.155757, 1.893202, -2.45066, 0, 1, 0.6588235, 1,
-0.1361385, -0.7064019, -1.78702, 0, 1, 0.6627451, 1,
-0.1301395, 1.224112, -2.171089, 0, 1, 0.6705883, 1,
-0.126927, 0.7802125, 0.3128189, 0, 1, 0.6745098, 1,
-0.1252708, -0.9404648, -3.141147, 0, 1, 0.682353, 1,
-0.1233385, 2.04034, 0.7231914, 0, 1, 0.6862745, 1,
-0.1111035, 1.787939, 0.7530286, 0, 1, 0.6941177, 1,
-0.109858, -0.7852837, -2.85126, 0, 1, 0.7019608, 1,
-0.1073205, -0.9845631, -1.08257, 0, 1, 0.7058824, 1,
-0.1057268, 0.295792, -0.8809161, 0, 1, 0.7137255, 1,
-0.09946504, -0.04053039, -1.296461, 0, 1, 0.7176471, 1,
-0.09561538, 0.3508005, -1.232492, 0, 1, 0.7254902, 1,
-0.09045837, 0.1985423, 0.173517, 0, 1, 0.7294118, 1,
-0.09016041, 0.4923721, -0.3537672, 0, 1, 0.7372549, 1,
-0.08476485, 1.460418, -1.415163, 0, 1, 0.7411765, 1,
-0.0843889, 0.7628233, -0.05028734, 0, 1, 0.7490196, 1,
-0.08081481, -0.5013177, -2.075115, 0, 1, 0.7529412, 1,
-0.06893636, -0.69761, -3.58192, 0, 1, 0.7607843, 1,
-0.06640305, 0.2929141, 0.9057293, 0, 1, 0.7647059, 1,
-0.06339628, 0.3943802, -1.300282, 0, 1, 0.772549, 1,
-0.06196948, -0.4257793, -3.077192, 0, 1, 0.7764706, 1,
-0.06114944, 0.1671091, -2.905197, 0, 1, 0.7843137, 1,
-0.05915937, -0.1916582, -3.132435, 0, 1, 0.7882353, 1,
-0.05888592, -1.333732, -4.554112, 0, 1, 0.7960784, 1,
-0.05647552, -2.140619, -4.599379, 0, 1, 0.8039216, 1,
-0.05487635, -0.4153416, -2.468973, 0, 1, 0.8078431, 1,
-0.05314305, -0.1515538, -3.447746, 0, 1, 0.8156863, 1,
-0.05036145, -1.527509, -3.346684, 0, 1, 0.8196079, 1,
-0.04931334, 0.8806252, -0.5668479, 0, 1, 0.827451, 1,
-0.04731051, -1.186604, -3.229662, 0, 1, 0.8313726, 1,
-0.04097215, 0.1050154, -0.3162291, 0, 1, 0.8392157, 1,
-0.03518892, 0.1930555, -2.448408, 0, 1, 0.8431373, 1,
-0.03451586, -0.2747193, -1.748492, 0, 1, 0.8509804, 1,
-0.03383133, -0.2180979, -2.217648, 0, 1, 0.854902, 1,
-0.03043482, -0.6112612, -2.77268, 0, 1, 0.8627451, 1,
-0.03001744, -2.936355, -1.65853, 0, 1, 0.8666667, 1,
-0.02790393, 0.04519087, 1.148674, 0, 1, 0.8745098, 1,
-0.02691232, -0.1266321, -4.401866, 0, 1, 0.8784314, 1,
-0.02294443, 1.658452, -0.2883015, 0, 1, 0.8862745, 1,
-0.02201411, -0.4499622, -2.368377, 0, 1, 0.8901961, 1,
-0.02101929, 0.9035924, 1.789324, 0, 1, 0.8980392, 1,
-0.01390741, 0.7825003, 0.8670754, 0, 1, 0.9058824, 1,
-0.01171914, 0.8698025, 1.374463, 0, 1, 0.9098039, 1,
-0.002123476, -0.3307685, -2.169614, 0, 1, 0.9176471, 1,
-0.001918958, 3.151849, -1.538727, 0, 1, 0.9215686, 1,
-0.001607816, -0.7238188, -4.303445, 0, 1, 0.9294118, 1,
-0.001593531, 0.6753527, 0.6567387, 0, 1, 0.9333333, 1,
0.0002151975, -0.5298985, 3.687866, 0, 1, 0.9411765, 1,
0.003452982, 1.274904, 0.2285264, 0, 1, 0.945098, 1,
0.005155324, -0.4830472, 3.925062, 0, 1, 0.9529412, 1,
0.005194147, -0.1402922, 3.734664, 0, 1, 0.9568627, 1,
0.01052612, -2.340653, 4.249996, 0, 1, 0.9647059, 1,
0.01294332, -0.01980521, 2.179068, 0, 1, 0.9686275, 1,
0.01838825, -1.040305, 3.884035, 0, 1, 0.9764706, 1,
0.01966695, 0.856681, -2.272702, 0, 1, 0.9803922, 1,
0.02051309, 0.9414847, -2.214769, 0, 1, 0.9882353, 1,
0.02087197, 0.8833656, 1.572299, 0, 1, 0.9921569, 1,
0.02406249, -1.395959, 3.426794, 0, 1, 1, 1,
0.02671847, 1.248154, -0.6836885, 0, 0.9921569, 1, 1,
0.03079673, 2.032832, -0.2602974, 0, 0.9882353, 1, 1,
0.0319462, -0.1956219, -0.00993145, 0, 0.9803922, 1, 1,
0.03457195, -0.9354578, 3.884082, 0, 0.9764706, 1, 1,
0.03505918, -0.9367871, 2.774339, 0, 0.9686275, 1, 1,
0.04356019, -2.04212, 2.598103, 0, 0.9647059, 1, 1,
0.04650686, -0.5641623, 4.444106, 0, 0.9568627, 1, 1,
0.04746615, -0.07883557, 2.511404, 0, 0.9529412, 1, 1,
0.05109419, 0.0897845, -0.01291998, 0, 0.945098, 1, 1,
0.05117088, -1.959962, 1.718438, 0, 0.9411765, 1, 1,
0.05617914, 0.9641675, 1.042723, 0, 0.9333333, 1, 1,
0.0575797, 0.6233504, 0.9188104, 0, 0.9294118, 1, 1,
0.05769811, 0.1323992, -0.8681225, 0, 0.9215686, 1, 1,
0.0584255, -0.0288334, 1.572885, 0, 0.9176471, 1, 1,
0.06173643, 2.116766, -2.264281, 0, 0.9098039, 1, 1,
0.06228252, 1.56582, -1.682771, 0, 0.9058824, 1, 1,
0.06284489, 0.4395606, -1.629636, 0, 0.8980392, 1, 1,
0.06563048, -2.828357, 2.197001, 0, 0.8901961, 1, 1,
0.06581703, -1.465266, 4.294966, 0, 0.8862745, 1, 1,
0.06738133, -0.604451, 3.363625, 0, 0.8784314, 1, 1,
0.06841297, -0.2020493, 2.187118, 0, 0.8745098, 1, 1,
0.073125, 0.6857207, -0.6508535, 0, 0.8666667, 1, 1,
0.07350647, -1.41498, 2.356956, 0, 0.8627451, 1, 1,
0.0788871, -1.425708, 3.095293, 0, 0.854902, 1, 1,
0.08077469, -2.925307, 3.695832, 0, 0.8509804, 1, 1,
0.08218212, 1.546272, 1.09022, 0, 0.8431373, 1, 1,
0.0828902, -0.5593668, 2.841611, 0, 0.8392157, 1, 1,
0.08672095, 1.10383, -0.09737672, 0, 0.8313726, 1, 1,
0.08927056, -0.6780432, 3.373091, 0, 0.827451, 1, 1,
0.08976571, 0.08912062, 0.9733019, 0, 0.8196079, 1, 1,
0.0940332, 0.7827177, -0.4715911, 0, 0.8156863, 1, 1,
0.09763672, 0.7041571, -0.7866328, 0, 0.8078431, 1, 1,
0.09919845, 2.01746, 0.8250293, 0, 0.8039216, 1, 1,
0.1002556, 1.905367, -0.04479521, 0, 0.7960784, 1, 1,
0.100575, -1.313204, 0.8736404, 0, 0.7882353, 1, 1,
0.1013858, 1.221176, 0.1022963, 0, 0.7843137, 1, 1,
0.1018594, -0.973646, 2.48339, 0, 0.7764706, 1, 1,
0.1046018, 1.009703, -1.178025, 0, 0.772549, 1, 1,
0.1102811, -1.358574, 2.038006, 0, 0.7647059, 1, 1,
0.1135874, -0.9497558, 4.209005, 0, 0.7607843, 1, 1,
0.1141902, 1.105819, -0.3767806, 0, 0.7529412, 1, 1,
0.1166876, 0.04677815, 0.9031651, 0, 0.7490196, 1, 1,
0.1182522, -0.5202395, 2.440664, 0, 0.7411765, 1, 1,
0.1246633, 0.7638622, 1.654657, 0, 0.7372549, 1, 1,
0.1256741, -0.2998603, 3.317348, 0, 0.7294118, 1, 1,
0.1287605, 0.7133567, -0.1956498, 0, 0.7254902, 1, 1,
0.1303518, 1.683473, 0.3587641, 0, 0.7176471, 1, 1,
0.1309829, -0.4022334, 2.376126, 0, 0.7137255, 1, 1,
0.1365498, 0.09211943, 0.3970105, 0, 0.7058824, 1, 1,
0.145809, 0.9504956, -0.7304052, 0, 0.6980392, 1, 1,
0.1470216, -1.553481, 3.786362, 0, 0.6941177, 1, 1,
0.1471869, -1.168107, 2.347663, 0, 0.6862745, 1, 1,
0.1498731, 0.351548, 0.176187, 0, 0.682353, 1, 1,
0.1538906, 1.047127, 0.434608, 0, 0.6745098, 1, 1,
0.1583503, 0.745402, 2.15433, 0, 0.6705883, 1, 1,
0.1586161, -0.7747069, 2.805472, 0, 0.6627451, 1, 1,
0.1596682, -0.7078763, 2.652395, 0, 0.6588235, 1, 1,
0.1598821, -0.2515453, 3.039119, 0, 0.6509804, 1, 1,
0.162192, -0.1635314, 3.110862, 0, 0.6470588, 1, 1,
0.1684525, 0.2759423, 0.8641748, 0, 0.6392157, 1, 1,
0.1703548, 0.5529441, -0.2915505, 0, 0.6352941, 1, 1,
0.1717459, 2.310362, 1.841309, 0, 0.627451, 1, 1,
0.1728819, -0.5576215, 2.921613, 0, 0.6235294, 1, 1,
0.1736499, 1.055788, 1.835665, 0, 0.6156863, 1, 1,
0.1742636, 0.6385505, 2.849122, 0, 0.6117647, 1, 1,
0.1743802, -4.069049, 2.851848, 0, 0.6039216, 1, 1,
0.1748122, 0.950501, -1.211261, 0, 0.5960785, 1, 1,
0.1766353, 0.1444732, 0.7797627, 0, 0.5921569, 1, 1,
0.1780163, -0.3288819, 2.983236, 0, 0.5843138, 1, 1,
0.1800619, 1.182521, 1.519857, 0, 0.5803922, 1, 1,
0.1879974, -0.4832437, 1.689314, 0, 0.572549, 1, 1,
0.1893416, -1.47362, 3.402824, 0, 0.5686275, 1, 1,
0.1896978, -0.4837323, 3.385906, 0, 0.5607843, 1, 1,
0.1897351, 0.7348318, -0.3394891, 0, 0.5568628, 1, 1,
0.1916443, 0.3793679, 0.550464, 0, 0.5490196, 1, 1,
0.192553, 0.3655189, 1.144961, 0, 0.5450981, 1, 1,
0.1989155, -2.473702, 3.212884, 0, 0.5372549, 1, 1,
0.2015305, -1.219636, 4.879817, 0, 0.5333334, 1, 1,
0.2024591, 0.3430178, 1.330155, 0, 0.5254902, 1, 1,
0.2024604, 0.2450714, 0.4960907, 0, 0.5215687, 1, 1,
0.203147, -1.376323, 3.277587, 0, 0.5137255, 1, 1,
0.2033655, 0.2930486, 1.279598, 0, 0.509804, 1, 1,
0.2035563, -0.1759474, 3.524799, 0, 0.5019608, 1, 1,
0.2089039, -0.1577388, 2.12839, 0, 0.4941176, 1, 1,
0.2111001, 0.7314045, -0.4937613, 0, 0.4901961, 1, 1,
0.2171865, -0.6102429, 0.9912564, 0, 0.4823529, 1, 1,
0.2197142, -1.210155, 2.886947, 0, 0.4784314, 1, 1,
0.2209146, -0.2019822, 3.165332, 0, 0.4705882, 1, 1,
0.2225189, -0.7617137, 3.295642, 0, 0.4666667, 1, 1,
0.2228913, 0.4862304, 0.5386175, 0, 0.4588235, 1, 1,
0.2238182, -1.047239, 3.018291, 0, 0.454902, 1, 1,
0.2259976, 1.547582, 2.415452, 0, 0.4470588, 1, 1,
0.2290633, 0.5460913, 0.9940814, 0, 0.4431373, 1, 1,
0.2335213, -0.2864711, 2.485125, 0, 0.4352941, 1, 1,
0.235937, 0.02719452, 4.317912, 0, 0.4313726, 1, 1,
0.2367378, -0.5634772, 2.85731, 0, 0.4235294, 1, 1,
0.2370626, 1.053308, 1.077613, 0, 0.4196078, 1, 1,
0.239641, 0.5314555, -1.757962, 0, 0.4117647, 1, 1,
0.2422018, 0.6759707, -0.07064851, 0, 0.4078431, 1, 1,
0.243105, 0.3760794, -0.9665711, 0, 0.4, 1, 1,
0.2454597, 0.6957968, 0.9467502, 0, 0.3921569, 1, 1,
0.2467678, 0.8062822, -0.974799, 0, 0.3882353, 1, 1,
0.2472007, 1.876413, 2.109198, 0, 0.3803922, 1, 1,
0.2480694, -0.448549, 3.810894, 0, 0.3764706, 1, 1,
0.2486673, 1.365453, -0.7249964, 0, 0.3686275, 1, 1,
0.2550348, -1.920304, 2.115976, 0, 0.3647059, 1, 1,
0.2555889, 0.09919718, 0.9846345, 0, 0.3568628, 1, 1,
0.2571187, -3.235162, 3.641071, 0, 0.3529412, 1, 1,
0.2599078, -1.28465, 2.243359, 0, 0.345098, 1, 1,
0.260008, -0.8657415, 4.322668, 0, 0.3411765, 1, 1,
0.2631216, 0.4450227, 0.8153293, 0, 0.3333333, 1, 1,
0.2659598, 1.048226, 0.8037457, 0, 0.3294118, 1, 1,
0.2708114, 0.1152394, 1.824227, 0, 0.3215686, 1, 1,
0.2719173, 0.164013, 1.636798, 0, 0.3176471, 1, 1,
0.2723365, -0.8039041, 2.039998, 0, 0.3098039, 1, 1,
0.2768795, 1.018669, 0.02404377, 0, 0.3058824, 1, 1,
0.277676, -0.2042416, 2.348083, 0, 0.2980392, 1, 1,
0.2817563, -0.7073915, 2.122693, 0, 0.2901961, 1, 1,
0.2827784, 0.8651217, 2.014431, 0, 0.2862745, 1, 1,
0.2897461, -1.503513, 3.511038, 0, 0.2784314, 1, 1,
0.2903838, 0.324719, -0.006167467, 0, 0.2745098, 1, 1,
0.2943352, 0.2247001, 0.2556053, 0, 0.2666667, 1, 1,
0.2958255, 1.902169, 0.6296918, 0, 0.2627451, 1, 1,
0.3028982, -0.6812229, 3.702263, 0, 0.254902, 1, 1,
0.3072812, 0.1195757, 2.655885, 0, 0.2509804, 1, 1,
0.314844, -1.326002, 2.670071, 0, 0.2431373, 1, 1,
0.3157534, -2.02188, 5.170475, 0, 0.2392157, 1, 1,
0.3181216, 2.280367, 0.1860875, 0, 0.2313726, 1, 1,
0.3184813, -0.4948981, 2.15937, 0, 0.227451, 1, 1,
0.3215338, -0.6572614, 1.436179, 0, 0.2196078, 1, 1,
0.3230565, -1.97721, 5.197153, 0, 0.2156863, 1, 1,
0.3259745, 0.4769439, -0.1810889, 0, 0.2078431, 1, 1,
0.3268175, 0.5000626, 0.004407045, 0, 0.2039216, 1, 1,
0.3277944, -0.3053874, 2.429457, 0, 0.1960784, 1, 1,
0.3312739, -0.3431366, 3.041629, 0, 0.1882353, 1, 1,
0.3330906, 1.113485, 0.05253265, 0, 0.1843137, 1, 1,
0.3333271, 0.2685265, -0.1270725, 0, 0.1764706, 1, 1,
0.335763, -0.2586577, 3.15068, 0, 0.172549, 1, 1,
0.3449441, 0.8814486, 0.2590053, 0, 0.1647059, 1, 1,
0.3455003, -0.203801, 1.698466, 0, 0.1607843, 1, 1,
0.3459464, 0.3230106, -0.02946017, 0, 0.1529412, 1, 1,
0.3483318, 0.5301402, -1.337051, 0, 0.1490196, 1, 1,
0.3541023, 0.2623377, -1.484851, 0, 0.1411765, 1, 1,
0.3542548, -0.6799613, 3.923437, 0, 0.1372549, 1, 1,
0.3566206, 1.993787, 0.6932118, 0, 0.1294118, 1, 1,
0.3575894, 0.6329716, 2.045518, 0, 0.1254902, 1, 1,
0.3585012, 1.550374, 1.034976, 0, 0.1176471, 1, 1,
0.3673221, -2.216688, 2.664797, 0, 0.1137255, 1, 1,
0.3695677, 0.3427993, 1.368656, 0, 0.1058824, 1, 1,
0.378836, 0.1048401, 1.049662, 0, 0.09803922, 1, 1,
0.3851319, 1.987252, -0.6165798, 0, 0.09411765, 1, 1,
0.385331, 0.2020905, 1.230771, 0, 0.08627451, 1, 1,
0.3855695, 0.8730555, -0.1732951, 0, 0.08235294, 1, 1,
0.3857051, -2.375373, 4.03549, 0, 0.07450981, 1, 1,
0.3888259, 0.2924344, -0.9111367, 0, 0.07058824, 1, 1,
0.389311, -0.7654185, 4.193748, 0, 0.0627451, 1, 1,
0.3900995, -1.20105, 1.246185, 0, 0.05882353, 1, 1,
0.4010665, -0.394222, 1.451285, 0, 0.05098039, 1, 1,
0.4016681, -0.3244038, 0.3293176, 0, 0.04705882, 1, 1,
0.405746, 0.7110995, -0.4208833, 0, 0.03921569, 1, 1,
0.407218, -0.2299623, 2.994956, 0, 0.03529412, 1, 1,
0.4074214, -2.052187, 3.962998, 0, 0.02745098, 1, 1,
0.4086902, 0.1103691, 0.02885831, 0, 0.02352941, 1, 1,
0.4097327, -0.5371886, 1.744223, 0, 0.01568628, 1, 1,
0.4100587, -0.03502448, 1.468445, 0, 0.01176471, 1, 1,
0.4102837, 0.7101004, -0.1119274, 0, 0.003921569, 1, 1,
0.4113694, -0.5790814, 3.554564, 0.003921569, 0, 1, 1,
0.4167295, -0.2414116, 2.483363, 0.007843138, 0, 1, 1,
0.4177842, -0.4956942, 3.237678, 0.01568628, 0, 1, 1,
0.4236118, -1.115452, 2.222769, 0.01960784, 0, 1, 1,
0.4239458, 0.5061567, 0.1867864, 0.02745098, 0, 1, 1,
0.4241017, -0.6412142, 1.319642, 0.03137255, 0, 1, 1,
0.4323719, -0.7730447, 2.035721, 0.03921569, 0, 1, 1,
0.4328728, -0.2847005, 3.085999, 0.04313726, 0, 1, 1,
0.4370074, -0.5811362, 2.601106, 0.05098039, 0, 1, 1,
0.4376444, -1.244038, 1.554817, 0.05490196, 0, 1, 1,
0.4392737, -0.5201653, 2.645106, 0.0627451, 0, 1, 1,
0.442508, -0.2709402, 2.328074, 0.06666667, 0, 1, 1,
0.444198, -1.198401, 2.696095, 0.07450981, 0, 1, 1,
0.4534526, -0.3001647, 2.126939, 0.07843138, 0, 1, 1,
0.4535817, -0.7967719, 4.214275, 0.08627451, 0, 1, 1,
0.4538, -0.0932609, 3.075025, 0.09019608, 0, 1, 1,
0.4557675, -1.278537, 1.715476, 0.09803922, 0, 1, 1,
0.4632012, 0.1433287, 3.253937, 0.1058824, 0, 1, 1,
0.4642969, 0.2235345, 0.4462205, 0.1098039, 0, 1, 1,
0.4652619, 0.4212439, 0.9291834, 0.1176471, 0, 1, 1,
0.4721947, -1.146895, 3.42075, 0.1215686, 0, 1, 1,
0.4750992, -1.114132, 3.089226, 0.1294118, 0, 1, 1,
0.475296, 1.330719, 1.233974, 0.1333333, 0, 1, 1,
0.4793634, 1.150018, 0.9023634, 0.1411765, 0, 1, 1,
0.4812605, -0.1115298, 0.1065333, 0.145098, 0, 1, 1,
0.4853225, 0.2330564, 1.491219, 0.1529412, 0, 1, 1,
0.4858882, 2.205273, 0.2662727, 0.1568628, 0, 1, 1,
0.4963242, -0.5725214, 3.048644, 0.1647059, 0, 1, 1,
0.5007997, 0.62145, 0.3951267, 0.1686275, 0, 1, 1,
0.5017065, 1.058843, 0.1947791, 0.1764706, 0, 1, 1,
0.5025339, 0.4842374, 1.225485, 0.1803922, 0, 1, 1,
0.5045776, -0.8580437, 2.894347, 0.1882353, 0, 1, 1,
0.5046217, -1.455015, 3.020133, 0.1921569, 0, 1, 1,
0.505445, 0.7261956, 0.4465949, 0.2, 0, 1, 1,
0.5137582, 1.272962, -0.5777211, 0.2078431, 0, 1, 1,
0.5236889, -0.02545005, 0.6932349, 0.2117647, 0, 1, 1,
0.5251687, 1.090622, 1.482012, 0.2196078, 0, 1, 1,
0.5354204, 0.1623321, 0.3175482, 0.2235294, 0, 1, 1,
0.5419225, -0.7223668, 2.947603, 0.2313726, 0, 1, 1,
0.5436106, 0.2548144, 2.155078, 0.2352941, 0, 1, 1,
0.5449448, -1.592696, 2.131287, 0.2431373, 0, 1, 1,
0.5501978, -0.7062204, 2.34092, 0.2470588, 0, 1, 1,
0.5515487, -0.3883745, 2.880659, 0.254902, 0, 1, 1,
0.5622263, 1.649256, 0.3790888, 0.2588235, 0, 1, 1,
0.563149, 0.08271807, 1.09033, 0.2666667, 0, 1, 1,
0.5669651, -0.3894908, 2.585029, 0.2705882, 0, 1, 1,
0.567425, 1.267306, -0.1687132, 0.2784314, 0, 1, 1,
0.5745757, 0.5141439, 0.7306829, 0.282353, 0, 1, 1,
0.5859042, 1.165002, 0.09123721, 0.2901961, 0, 1, 1,
0.5860135, -0.05834629, -0.2176192, 0.2941177, 0, 1, 1,
0.5864613, -1.509505, 3.120078, 0.3019608, 0, 1, 1,
0.5940942, 0.04527983, 1.666929, 0.3098039, 0, 1, 1,
0.5965974, -1.4858, 2.551078, 0.3137255, 0, 1, 1,
0.5990114, 1.498764, -0.5469904, 0.3215686, 0, 1, 1,
0.6005175, -0.7937939, 3.694441, 0.3254902, 0, 1, 1,
0.6059349, -0.7482494, 3.403701, 0.3333333, 0, 1, 1,
0.6110834, 0.002235659, 1.248211, 0.3372549, 0, 1, 1,
0.6163381, 0.5050173, 2.429714, 0.345098, 0, 1, 1,
0.6184607, -0.7769883, 2.724868, 0.3490196, 0, 1, 1,
0.6216088, -0.6028237, 1.474967, 0.3568628, 0, 1, 1,
0.6234951, 0.9763982, 0.1439987, 0.3607843, 0, 1, 1,
0.6238304, -0.3252886, 0.2300036, 0.3686275, 0, 1, 1,
0.6245104, 0.8883169, -0.2725581, 0.372549, 0, 1, 1,
0.6273315, -0.9420076, 2.959635, 0.3803922, 0, 1, 1,
0.6287897, 0.3173718, 1.949398, 0.3843137, 0, 1, 1,
0.6336971, -0.7940887, 1.195955, 0.3921569, 0, 1, 1,
0.6386004, 2.156516, 0.1319596, 0.3960784, 0, 1, 1,
0.6429541, -1.557604, 3.838567, 0.4039216, 0, 1, 1,
0.6443217, -1.095171, 3.247799, 0.4117647, 0, 1, 1,
0.648562, -0.1316478, 1.368753, 0.4156863, 0, 1, 1,
0.6490688, -0.4423903, 1.957616, 0.4235294, 0, 1, 1,
0.6540236, -0.6416943, 0.3336603, 0.427451, 0, 1, 1,
0.6624004, -0.08890952, 1.490199, 0.4352941, 0, 1, 1,
0.666563, -0.2429494, 2.076349, 0.4392157, 0, 1, 1,
0.6678941, -0.2703929, 1.843656, 0.4470588, 0, 1, 1,
0.66858, 2.228021, 0.7266353, 0.4509804, 0, 1, 1,
0.6702317, 0.3084915, 1.136146, 0.4588235, 0, 1, 1,
0.6723858, 0.3407194, 1.272749, 0.4627451, 0, 1, 1,
0.6814396, 0.5198681, 0.7501803, 0.4705882, 0, 1, 1,
0.6898296, 0.8506959, 1.079588, 0.4745098, 0, 1, 1,
0.6914462, 1.08149, 1.571273, 0.4823529, 0, 1, 1,
0.694841, -0.9782603, 1.772089, 0.4862745, 0, 1, 1,
0.6953061, 2.745038, -1.616323, 0.4941176, 0, 1, 1,
0.6959848, 0.3570085, 2.213868, 0.5019608, 0, 1, 1,
0.6989628, -0.1637437, 1.368752, 0.5058824, 0, 1, 1,
0.6996624, 2.340109, 0.6886074, 0.5137255, 0, 1, 1,
0.7026466, 1.859308, -0.07380541, 0.5176471, 0, 1, 1,
0.7032181, 1.785264, -0.4976979, 0.5254902, 0, 1, 1,
0.7114441, -1.940532, 2.896319, 0.5294118, 0, 1, 1,
0.712357, -0.7752371, 1.252713, 0.5372549, 0, 1, 1,
0.7126819, 0.2843893, 0.7462974, 0.5411765, 0, 1, 1,
0.716697, 1.00835, 0.1480103, 0.5490196, 0, 1, 1,
0.721196, -1.026459, 3.412556, 0.5529412, 0, 1, 1,
0.7238051, -0.5505124, 1.199127, 0.5607843, 0, 1, 1,
0.7241426, 2.027747, 0.6634781, 0.5647059, 0, 1, 1,
0.7251483, 0.806639, 0.857712, 0.572549, 0, 1, 1,
0.7309289, -0.305856, 3.461622, 0.5764706, 0, 1, 1,
0.731231, -0.260315, 2.40306, 0.5843138, 0, 1, 1,
0.7465954, 0.3371401, 3.311664, 0.5882353, 0, 1, 1,
0.7481058, -0.4951392, 2.161711, 0.5960785, 0, 1, 1,
0.7485215, -0.03439988, 1.864802, 0.6039216, 0, 1, 1,
0.7495934, 0.9333521, -1.388531, 0.6078432, 0, 1, 1,
0.7543314, -0.4650682, 1.943239, 0.6156863, 0, 1, 1,
0.7619125, 0.325951, 2.045637, 0.6196079, 0, 1, 1,
0.7689708, -1.372506, 1.228295, 0.627451, 0, 1, 1,
0.7691095, -1.901883, 1.304837, 0.6313726, 0, 1, 1,
0.7736477, 1.911687, 0.5442189, 0.6392157, 0, 1, 1,
0.7821781, 0.5931775, -0.02518675, 0.6431373, 0, 1, 1,
0.7847115, 0.6149206, 0.1991841, 0.6509804, 0, 1, 1,
0.7904733, -1.04046, 3.817424, 0.654902, 0, 1, 1,
0.7913774, 0.4934148, 0.9575339, 0.6627451, 0, 1, 1,
0.7924851, 0.2543657, 1.270199, 0.6666667, 0, 1, 1,
0.792589, -1.355915, 1.820099, 0.6745098, 0, 1, 1,
0.8003337, -0.774431, 2.812847, 0.6784314, 0, 1, 1,
0.8027678, -1.77529, 2.960918, 0.6862745, 0, 1, 1,
0.8049249, 1.477953, 0.8477832, 0.6901961, 0, 1, 1,
0.8073238, 0.1900657, 1.356048, 0.6980392, 0, 1, 1,
0.8079768, 0.332483, -0.4239321, 0.7058824, 0, 1, 1,
0.8135014, 0.4958172, 1.209932, 0.7098039, 0, 1, 1,
0.8238695, 0.2144686, -0.1945718, 0.7176471, 0, 1, 1,
0.82757, 0.6840566, 1.592632, 0.7215686, 0, 1, 1,
0.8277007, 1.011717, -0.06698462, 0.7294118, 0, 1, 1,
0.8319696, -0.6229586, 0.3895597, 0.7333333, 0, 1, 1,
0.843731, -1.206164, 2.959141, 0.7411765, 0, 1, 1,
0.8470382, 0.1561613, 0.7229279, 0.7450981, 0, 1, 1,
0.8641704, -0.6633533, 2.499238, 0.7529412, 0, 1, 1,
0.8643477, -0.03161339, 2.187261, 0.7568628, 0, 1, 1,
0.8670217, -0.006478881, 1.177559, 0.7647059, 0, 1, 1,
0.8743079, 0.5637918, 1.657544, 0.7686275, 0, 1, 1,
0.8844149, -0.401418, 3.14712, 0.7764706, 0, 1, 1,
0.8854972, -0.4605411, -0.6778972, 0.7803922, 0, 1, 1,
0.8857438, -1.058804, 2.561525, 0.7882353, 0, 1, 1,
0.8964117, -0.3131322, 2.652637, 0.7921569, 0, 1, 1,
0.899734, -0.2029827, 1.997015, 0.8, 0, 1, 1,
0.9000216, 0.09586125, 1.579746, 0.8078431, 0, 1, 1,
0.9004061, -0.7555053, 1.11672, 0.8117647, 0, 1, 1,
0.9066318, 0.9544103, 2.351942, 0.8196079, 0, 1, 1,
0.9097025, -0.5648356, 1.920954, 0.8235294, 0, 1, 1,
0.917259, -0.2843254, 1.374559, 0.8313726, 0, 1, 1,
0.9202942, -0.3119585, 1.758677, 0.8352941, 0, 1, 1,
0.9217879, -1.18042, 1.581832, 0.8431373, 0, 1, 1,
0.9225256, 0.8609844, 0.9498251, 0.8470588, 0, 1, 1,
0.9296756, 0.5374607, 0.4606892, 0.854902, 0, 1, 1,
0.9312151, 2.10139, 1.099032, 0.8588235, 0, 1, 1,
0.9331315, 0.3922887, 0.7845114, 0.8666667, 0, 1, 1,
0.9337544, -0.2200083, 1.475266, 0.8705882, 0, 1, 1,
0.9337675, -0.7381498, 0.7023604, 0.8784314, 0, 1, 1,
0.9348212, -0.8922086, 1.063203, 0.8823529, 0, 1, 1,
0.9463598, 0.3606568, 0.3504003, 0.8901961, 0, 1, 1,
0.9484143, 1.952814, 0.2969013, 0.8941177, 0, 1, 1,
0.950483, 1.190453, 0.9650645, 0.9019608, 0, 1, 1,
0.9535989, -0.2993717, 2.118012, 0.9098039, 0, 1, 1,
0.9559286, 0.2703193, 0.716422, 0.9137255, 0, 1, 1,
0.9562864, -0.623053, 2.702747, 0.9215686, 0, 1, 1,
0.9613866, 1.434561, 0.8513306, 0.9254902, 0, 1, 1,
0.9636127, 0.2206692, 0.6278357, 0.9333333, 0, 1, 1,
0.9655553, 0.8724827, 2.106722, 0.9372549, 0, 1, 1,
0.9689137, -0.2576392, 2.118815, 0.945098, 0, 1, 1,
0.9695676, -0.1916799, 2.42503, 0.9490196, 0, 1, 1,
0.9696043, 1.732954, 0.6014015, 0.9568627, 0, 1, 1,
0.9729154, -0.6214121, 3.080467, 0.9607843, 0, 1, 1,
0.9744588, 0.07154652, 2.084718, 0.9686275, 0, 1, 1,
0.9871547, 0.7806565, -0.6469861, 0.972549, 0, 1, 1,
0.9923108, 1.203945, 0.03959372, 0.9803922, 0, 1, 1,
0.9928123, 0.6251442, 0.309074, 0.9843137, 0, 1, 1,
0.9944951, -1.094919, 3.383505, 0.9921569, 0, 1, 1,
0.9986058, -0.8250501, 1.252273, 0.9960784, 0, 1, 1,
1.006525, -1.265624, 2.710427, 1, 0, 0.9960784, 1,
1.02318, -1.648157, 3.402853, 1, 0, 0.9882353, 1,
1.024238, 0.8530693, 2.382734, 1, 0, 0.9843137, 1,
1.0277, -0.1303987, 2.373319, 1, 0, 0.9764706, 1,
1.037546, -0.290628, 1.590763, 1, 0, 0.972549, 1,
1.043908, 2.152509, -0.7254677, 1, 0, 0.9647059, 1,
1.044198, -0.8061162, 3.301061, 1, 0, 0.9607843, 1,
1.044967, 0.2270495, -0.2023548, 1, 0, 0.9529412, 1,
1.045282, -0.9286926, 2.32207, 1, 0, 0.9490196, 1,
1.046025, 0.3717785, 2.839132, 1, 0, 0.9411765, 1,
1.047252, 0.9988455, 1.004818, 1, 0, 0.9372549, 1,
1.04898, 0.9937211, -0.4860844, 1, 0, 0.9294118, 1,
1.054766, 0.4103025, 1.485692, 1, 0, 0.9254902, 1,
1.061251, -0.2144276, 2.015499, 1, 0, 0.9176471, 1,
1.064084, 0.4309065, 1.126265, 1, 0, 0.9137255, 1,
1.06617, -1.353469, 2.561507, 1, 0, 0.9058824, 1,
1.066725, 0.1645686, 0.6512973, 1, 0, 0.9019608, 1,
1.077039, -0.2411397, 0.831862, 1, 0, 0.8941177, 1,
1.079339, -0.2252424, 2.172282, 1, 0, 0.8862745, 1,
1.084313, 0.7554292, 0.9431815, 1, 0, 0.8823529, 1,
1.089125, -0.3655826, 3.389672, 1, 0, 0.8745098, 1,
1.095103, 0.1031839, 1.386871, 1, 0, 0.8705882, 1,
1.097272, 1.309869, 1.876355, 1, 0, 0.8627451, 1,
1.098912, -2.901219, 3.657127, 1, 0, 0.8588235, 1,
1.099994, -0.3953602, 2.986224, 1, 0, 0.8509804, 1,
1.10235, 0.8507719, 1.573294, 1, 0, 0.8470588, 1,
1.106268, -0.9852518, 2.170811, 1, 0, 0.8392157, 1,
1.109621, 0.06267877, 0.8872438, 1, 0, 0.8352941, 1,
1.110898, -0.03026167, 1.431114, 1, 0, 0.827451, 1,
1.118999, 0.2730261, 1.647092, 1, 0, 0.8235294, 1,
1.124653, -0.3443344, 2.453338, 1, 0, 0.8156863, 1,
1.128684, -0.8891745, 1.491299, 1, 0, 0.8117647, 1,
1.131583, 0.4256447, 1.122617, 1, 0, 0.8039216, 1,
1.132207, 0.5492526, 0.9586568, 1, 0, 0.7960784, 1,
1.138772, -1.406849, 2.476436, 1, 0, 0.7921569, 1,
1.140238, 0.4893248, 0.6796625, 1, 0, 0.7843137, 1,
1.146192, -0.7663028, 2.450651, 1, 0, 0.7803922, 1,
1.14807, 0.4996789, 2.187682, 1, 0, 0.772549, 1,
1.151196, -1.441129, 2.613995, 1, 0, 0.7686275, 1,
1.151229, 2.114781, -0.08396739, 1, 0, 0.7607843, 1,
1.153231, 0.05599375, 1.943019, 1, 0, 0.7568628, 1,
1.153255, 1.439444, 0.699417, 1, 0, 0.7490196, 1,
1.155501, 0.6497979, 1.797075, 1, 0, 0.7450981, 1,
1.165307, 1.727009, -0.1324566, 1, 0, 0.7372549, 1,
1.173741, 0.1202476, 2.073435, 1, 0, 0.7333333, 1,
1.175731, 0.8587312, 0.746303, 1, 0, 0.7254902, 1,
1.176767, -1.317145, 3.458451, 1, 0, 0.7215686, 1,
1.183435, -0.6958579, 1.62118, 1, 0, 0.7137255, 1,
1.190635, 1.383649, 1.993743, 1, 0, 0.7098039, 1,
1.192732, -1.093549, 5.286384, 1, 0, 0.7019608, 1,
1.1949, -1.007521, 1.242781, 1, 0, 0.6941177, 1,
1.196984, 0.1938976, -0.318536, 1, 0, 0.6901961, 1,
1.20563, -0.5856939, 3.811864, 1, 0, 0.682353, 1,
1.209872, -1.250496, 3.217447, 1, 0, 0.6784314, 1,
1.215944, -0.3372945, 2.351259, 1, 0, 0.6705883, 1,
1.217832, 1.092398, -0.7886559, 1, 0, 0.6666667, 1,
1.222304, 0.6078333, 1.588401, 1, 0, 0.6588235, 1,
1.237644, 0.4578494, 0.5843947, 1, 0, 0.654902, 1,
1.245175, -0.3342911, 0.2839412, 1, 0, 0.6470588, 1,
1.261759, -0.4011592, 1.527594, 1, 0, 0.6431373, 1,
1.267393, -0.2195986, 0.2613211, 1, 0, 0.6352941, 1,
1.271158, 1.665779, -0.7474356, 1, 0, 0.6313726, 1,
1.280137, -0.5035294, 1.670763, 1, 0, 0.6235294, 1,
1.28645, 1.112938, 0.1804812, 1, 0, 0.6196079, 1,
1.286579, -0.2199717, 1.873499, 1, 0, 0.6117647, 1,
1.289614, 0.1975916, 0.7269685, 1, 0, 0.6078432, 1,
1.292228, -0.3123648, 1.864998, 1, 0, 0.6, 1,
1.299262, 1.182645, 2.890719, 1, 0, 0.5921569, 1,
1.30185, 0.7909315, 2.358798, 1, 0, 0.5882353, 1,
1.303057, -0.02470508, 0.6566957, 1, 0, 0.5803922, 1,
1.303161, -0.1597134, 3.796719, 1, 0, 0.5764706, 1,
1.306472, 0.03240627, 1.647454, 1, 0, 0.5686275, 1,
1.313465, -1.284488, 3.182809, 1, 0, 0.5647059, 1,
1.334667, -0.8677478, 0.01205239, 1, 0, 0.5568628, 1,
1.356671, 0.6978812, 1.05619, 1, 0, 0.5529412, 1,
1.357311, 0.3047812, 1.952683, 1, 0, 0.5450981, 1,
1.362019, 0.7909087, 0.2777762, 1, 0, 0.5411765, 1,
1.374057, -0.3371303, 1.931259, 1, 0, 0.5333334, 1,
1.381701, 0.9848711, 0.6546314, 1, 0, 0.5294118, 1,
1.38578, 0.4172723, -1.35945, 1, 0, 0.5215687, 1,
1.386666, 0.8526492, 2.967424, 1, 0, 0.5176471, 1,
1.396673, 0.9116724, 0.9615286, 1, 0, 0.509804, 1,
1.398124, -1.682201, 3.080179, 1, 0, 0.5058824, 1,
1.401052, -0.7645996, 2.245686, 1, 0, 0.4980392, 1,
1.407049, -0.6995035, 1.994269, 1, 0, 0.4901961, 1,
1.410284, -1.013426, 2.142111, 1, 0, 0.4862745, 1,
1.419184, -2.16872, 2.513994, 1, 0, 0.4784314, 1,
1.424736, 0.8518219, 0.901609, 1, 0, 0.4745098, 1,
1.429763, 0.9390398, -0.3823242, 1, 0, 0.4666667, 1,
1.430067, 0.1543345, 1.802582, 1, 0, 0.4627451, 1,
1.438186, 0.4647036, 2.114648, 1, 0, 0.454902, 1,
1.442645, -0.3737946, 1.83057, 1, 0, 0.4509804, 1,
1.447942, 0.7336067, -1.604011, 1, 0, 0.4431373, 1,
1.458822, -1.322522, 2.925582, 1, 0, 0.4392157, 1,
1.458846, -0.6122792, 1.331263, 1, 0, 0.4313726, 1,
1.460253, -0.4687773, -0.2845113, 1, 0, 0.427451, 1,
1.475932, -1.220464, 0.6690251, 1, 0, 0.4196078, 1,
1.478348, 0.8373808, 2.618878, 1, 0, 0.4156863, 1,
1.478545, -0.6439424, 2.893792, 1, 0, 0.4078431, 1,
1.493577, 0.7378572, 0.7227362, 1, 0, 0.4039216, 1,
1.497882, -0.2493109, 2.888602, 1, 0, 0.3960784, 1,
1.504385, -0.9971734, 1.255627, 1, 0, 0.3882353, 1,
1.516231, 1.649552, 0.8492424, 1, 0, 0.3843137, 1,
1.518235, -0.7020386, 2.341293, 1, 0, 0.3764706, 1,
1.520885, -0.1675453, 2.046796, 1, 0, 0.372549, 1,
1.525055, -1.259463, 0.3841867, 1, 0, 0.3647059, 1,
1.5252, -0.1647473, 0.7755712, 1, 0, 0.3607843, 1,
1.532197, 1.79192, 2.282136, 1, 0, 0.3529412, 1,
1.540515, 0.4301167, 0.7758527, 1, 0, 0.3490196, 1,
1.560134, 0.492304, 1.153355, 1, 0, 0.3411765, 1,
1.562548, -0.1684986, 1.749017, 1, 0, 0.3372549, 1,
1.594417, 1.225747, -0.2927831, 1, 0, 0.3294118, 1,
1.601459, 0.4210468, 3.184612, 1, 0, 0.3254902, 1,
1.610476, -0.663043, 1.722033, 1, 0, 0.3176471, 1,
1.610958, -0.1404234, 1.662902, 1, 0, 0.3137255, 1,
1.615637, -0.2965048, 2.377967, 1, 0, 0.3058824, 1,
1.630978, -0.1944572, -0.8997852, 1, 0, 0.2980392, 1,
1.636999, -0.2533049, 2.993703, 1, 0, 0.2941177, 1,
1.650302, -0.905175, 1.979482, 1, 0, 0.2862745, 1,
1.652532, -0.0660169, 2.441041, 1, 0, 0.282353, 1,
1.656003, -0.3277755, 2.545185, 1, 0, 0.2745098, 1,
1.657632, 0.09200449, 1.339794, 1, 0, 0.2705882, 1,
1.658388, 0.8326564, 0.3086933, 1, 0, 0.2627451, 1,
1.669821, -1.039024, 1.748993, 1, 0, 0.2588235, 1,
1.67283, -0.4417208, 0.4772188, 1, 0, 0.2509804, 1,
1.673261, 0.2639833, 1.830773, 1, 0, 0.2470588, 1,
1.688437, 1.81061, 1.917544, 1, 0, 0.2392157, 1,
1.694294, -1.918733, 1.607277, 1, 0, 0.2352941, 1,
1.747641, 0.1146032, 1.787963, 1, 0, 0.227451, 1,
1.758002, 0.8469987, 1.307545, 1, 0, 0.2235294, 1,
1.776075, -0.6676994, 2.889317, 1, 0, 0.2156863, 1,
1.794524, 0.9641207, 0.3799778, 1, 0, 0.2117647, 1,
1.79689, -1.855608, 0.9177803, 1, 0, 0.2039216, 1,
1.801891, -0.5934128, 0.05225846, 1, 0, 0.1960784, 1,
1.812183, -0.8799275, 1.37257, 1, 0, 0.1921569, 1,
1.831625, 1.183071, 1.059936, 1, 0, 0.1843137, 1,
1.839194, -0.04231875, 3.516505, 1, 0, 0.1803922, 1,
1.8658, -1.027464, 3.307926, 1, 0, 0.172549, 1,
1.867001, -0.003176323, 0.4852458, 1, 0, 0.1686275, 1,
1.877359, 0.9709711, 0.4682206, 1, 0, 0.1607843, 1,
1.883268, -2.04906, 2.631737, 1, 0, 0.1568628, 1,
1.903992, 0.2557887, -0.1151355, 1, 0, 0.1490196, 1,
1.907833, 0.2872162, 2.574507, 1, 0, 0.145098, 1,
1.93182, 0.7624461, 1.487453, 1, 0, 0.1372549, 1,
1.934924, -0.5925187, 2.002138, 1, 0, 0.1333333, 1,
1.951596, -0.8417884, 0.6349231, 1, 0, 0.1254902, 1,
1.962431, 1.520958, 2.844754, 1, 0, 0.1215686, 1,
1.971499, 1.324958, 0.03620671, 1, 0, 0.1137255, 1,
1.977649, 0.3181586, 1.473533, 1, 0, 0.1098039, 1,
2.006679, 0.3213356, 0.9236285, 1, 0, 0.1019608, 1,
2.018689, -0.1307923, 2.580019, 1, 0, 0.09411765, 1,
2.044156, -0.6848731, 1.640211, 1, 0, 0.09019608, 1,
2.169415, 0.899131, 2.030187, 1, 0, 0.08235294, 1,
2.213102, 0.07995559, 1.955428, 1, 0, 0.07843138, 1,
2.230288, 0.2008695, 1.891978, 1, 0, 0.07058824, 1,
2.230301, -0.4170721, 1.704471, 1, 0, 0.06666667, 1,
2.249968, -1.803115, 0.9947428, 1, 0, 0.05882353, 1,
2.34605, 1.302715, 3.237072, 1, 0, 0.05490196, 1,
2.365935, -0.2253592, 3.011191, 1, 0, 0.04705882, 1,
2.480452, 0.7494284, 0.1222629, 1, 0, 0.04313726, 1,
2.521784, -1.097551, 2.189121, 1, 0, 0.03529412, 1,
2.54167, -1.173001, 1.095284, 1, 0, 0.03137255, 1,
2.545466, 0.2542505, 2.000932, 1, 0, 0.02352941, 1,
2.551867, 0.07392716, 1.02805, 1, 0, 0.01960784, 1,
2.625065, -0.6927974, 2.648525, 1, 0, 0.01176471, 1,
2.841788, -0.7144281, 1.103545, 1, 0, 0.007843138, 1
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
-0.20075, -5.304502, -7.026186, 0, -0.5, 0.5, 0.5,
-0.20075, -5.304502, -7.026186, 1, -0.5, 0.5, 0.5,
-0.20075, -5.304502, -7.026186, 1, 1.5, 0.5, 0.5,
-0.20075, -5.304502, -7.026186, 0, 1.5, 0.5, 0.5
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
-4.274708, -0.4246464, -7.026186, 0, -0.5, 0.5, 0.5,
-4.274708, -0.4246464, -7.026186, 1, -0.5, 0.5, 0.5,
-4.274708, -0.4246464, -7.026186, 1, 1.5, 0.5, 0.5,
-4.274708, -0.4246464, -7.026186, 0, 1.5, 0.5, 0.5
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
-4.274708, -5.304502, 0.02235198, 0, -0.5, 0.5, 0.5,
-4.274708, -5.304502, 0.02235198, 1, -0.5, 0.5, 0.5,
-4.274708, -5.304502, 0.02235198, 1, 1.5, 0.5, 0.5,
-4.274708, -5.304502, 0.02235198, 0, 1.5, 0.5, 0.5
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
-3, -4.178381, -5.399601,
2, -4.178381, -5.399601,
-3, -4.178381, -5.399601,
-3, -4.366068, -5.670698,
-2, -4.178381, -5.399601,
-2, -4.366068, -5.670698,
-1, -4.178381, -5.399601,
-1, -4.366068, -5.670698,
0, -4.178381, -5.399601,
0, -4.366068, -5.670698,
1, -4.178381, -5.399601,
1, -4.366068, -5.670698,
2, -4.178381, -5.399601,
2, -4.366068, -5.670698
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
-3, -4.741441, -6.212893, 0, -0.5, 0.5, 0.5,
-3, -4.741441, -6.212893, 1, -0.5, 0.5, 0.5,
-3, -4.741441, -6.212893, 1, 1.5, 0.5, 0.5,
-3, -4.741441, -6.212893, 0, 1.5, 0.5, 0.5,
-2, -4.741441, -6.212893, 0, -0.5, 0.5, 0.5,
-2, -4.741441, -6.212893, 1, -0.5, 0.5, 0.5,
-2, -4.741441, -6.212893, 1, 1.5, 0.5, 0.5,
-2, -4.741441, -6.212893, 0, 1.5, 0.5, 0.5,
-1, -4.741441, -6.212893, 0, -0.5, 0.5, 0.5,
-1, -4.741441, -6.212893, 1, -0.5, 0.5, 0.5,
-1, -4.741441, -6.212893, 1, 1.5, 0.5, 0.5,
-1, -4.741441, -6.212893, 0, 1.5, 0.5, 0.5,
0, -4.741441, -6.212893, 0, -0.5, 0.5, 0.5,
0, -4.741441, -6.212893, 1, -0.5, 0.5, 0.5,
0, -4.741441, -6.212893, 1, 1.5, 0.5, 0.5,
0, -4.741441, -6.212893, 0, 1.5, 0.5, 0.5,
1, -4.741441, -6.212893, 0, -0.5, 0.5, 0.5,
1, -4.741441, -6.212893, 1, -0.5, 0.5, 0.5,
1, -4.741441, -6.212893, 1, 1.5, 0.5, 0.5,
1, -4.741441, -6.212893, 0, 1.5, 0.5, 0.5,
2, -4.741441, -6.212893, 0, -0.5, 0.5, 0.5,
2, -4.741441, -6.212893, 1, -0.5, 0.5, 0.5,
2, -4.741441, -6.212893, 1, 1.5, 0.5, 0.5,
2, -4.741441, -6.212893, 0, 1.5, 0.5, 0.5
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
-3.334564, -4, -5.399601,
-3.334564, 2, -5.399601,
-3.334564, -4, -5.399601,
-3.491255, -4, -5.670698,
-3.334564, -2, -5.399601,
-3.491255, -2, -5.670698,
-3.334564, 0, -5.399601,
-3.491255, 0, -5.670698,
-3.334564, 2, -5.399601,
-3.491255, 2, -5.670698
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
"-4",
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
-3.804636, -4, -6.212893, 0, -0.5, 0.5, 0.5,
-3.804636, -4, -6.212893, 1, -0.5, 0.5, 0.5,
-3.804636, -4, -6.212893, 1, 1.5, 0.5, 0.5,
-3.804636, -4, -6.212893, 0, 1.5, 0.5, 0.5,
-3.804636, -2, -6.212893, 0, -0.5, 0.5, 0.5,
-3.804636, -2, -6.212893, 1, -0.5, 0.5, 0.5,
-3.804636, -2, -6.212893, 1, 1.5, 0.5, 0.5,
-3.804636, -2, -6.212893, 0, 1.5, 0.5, 0.5,
-3.804636, 0, -6.212893, 0, -0.5, 0.5, 0.5,
-3.804636, 0, -6.212893, 1, -0.5, 0.5, 0.5,
-3.804636, 0, -6.212893, 1, 1.5, 0.5, 0.5,
-3.804636, 0, -6.212893, 0, 1.5, 0.5, 0.5,
-3.804636, 2, -6.212893, 0, -0.5, 0.5, 0.5,
-3.804636, 2, -6.212893, 1, -0.5, 0.5, 0.5,
-3.804636, 2, -6.212893, 1, 1.5, 0.5, 0.5,
-3.804636, 2, -6.212893, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.334564, -4.178381, -4,
-3.334564, -4.178381, 4,
-3.334564, -4.178381, -4,
-3.491255, -4.366068, -4,
-3.334564, -4.178381, -2,
-3.491255, -4.366068, -2,
-3.334564, -4.178381, 0,
-3.491255, -4.366068, 0,
-3.334564, -4.178381, 2,
-3.491255, -4.366068, 2,
-3.334564, -4.178381, 4,
-3.491255, -4.366068, 4
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
-3.804636, -4.741441, -4, 0, -0.5, 0.5, 0.5,
-3.804636, -4.741441, -4, 1, -0.5, 0.5, 0.5,
-3.804636, -4.741441, -4, 1, 1.5, 0.5, 0.5,
-3.804636, -4.741441, -4, 0, 1.5, 0.5, 0.5,
-3.804636, -4.741441, -2, 0, -0.5, 0.5, 0.5,
-3.804636, -4.741441, -2, 1, -0.5, 0.5, 0.5,
-3.804636, -4.741441, -2, 1, 1.5, 0.5, 0.5,
-3.804636, -4.741441, -2, 0, 1.5, 0.5, 0.5,
-3.804636, -4.741441, 0, 0, -0.5, 0.5, 0.5,
-3.804636, -4.741441, 0, 1, -0.5, 0.5, 0.5,
-3.804636, -4.741441, 0, 1, 1.5, 0.5, 0.5,
-3.804636, -4.741441, 0, 0, 1.5, 0.5, 0.5,
-3.804636, -4.741441, 2, 0, -0.5, 0.5, 0.5,
-3.804636, -4.741441, 2, 1, -0.5, 0.5, 0.5,
-3.804636, -4.741441, 2, 1, 1.5, 0.5, 0.5,
-3.804636, -4.741441, 2, 0, 1.5, 0.5, 0.5,
-3.804636, -4.741441, 4, 0, -0.5, 0.5, 0.5,
-3.804636, -4.741441, 4, 1, -0.5, 0.5, 0.5,
-3.804636, -4.741441, 4, 1, 1.5, 0.5, 0.5,
-3.804636, -4.741441, 4, 0, 1.5, 0.5, 0.5
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
-3.334564, -4.178381, -5.399601,
-3.334564, 3.329088, -5.399601,
-3.334564, -4.178381, 5.444304,
-3.334564, 3.329088, 5.444304,
-3.334564, -4.178381, -5.399601,
-3.334564, -4.178381, 5.444304,
-3.334564, 3.329088, -5.399601,
-3.334564, 3.329088, 5.444304,
-3.334564, -4.178381, -5.399601,
2.933064, -4.178381, -5.399601,
-3.334564, -4.178381, 5.444304,
2.933064, -4.178381, 5.444304,
-3.334564, 3.329088, -5.399601,
2.933064, 3.329088, -5.399601,
-3.334564, 3.329088, 5.444304,
2.933064, 3.329088, 5.444304,
2.933064, -4.178381, -5.399601,
2.933064, 3.329088, -5.399601,
2.933064, -4.178381, 5.444304,
2.933064, 3.329088, 5.444304,
2.933064, -4.178381, -5.399601,
2.933064, -4.178381, 5.444304,
2.933064, 3.329088, -5.399601,
2.933064, 3.329088, 5.444304
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
var radius = 7.797498;
var distance = 34.69195;
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
mvMatrix.translate( 0.20075, 0.4246464, -0.02235198 );
mvMatrix.scale( 1.345135, 1.122989, 0.7774697 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.69195);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
hydroxyimidazole<-read.table("hydroxyimidazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hydroxyimidazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyimidazole' not found
```

```r
y<-hydroxyimidazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyimidazole' not found
```

```r
z<-hydroxyimidazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyimidazole' not found
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
-3.243288, 1.956207, -1.494916, 0, 0, 1, 1, 1,
-3.084879, -1.008253, -0.7433989, 1, 0, 0, 1, 1,
-2.810442, -1.112865, -1.703054, 1, 0, 0, 1, 1,
-2.661072, 0.1123533, -2.50187, 1, 0, 0, 1, 1,
-2.604427, -1.287015, -2.762243, 1, 0, 0, 1, 1,
-2.40078, 1.055864, 0.1070086, 1, 0, 0, 1, 1,
-2.362434, 0.7574734, -0.4050899, 0, 0, 0, 1, 1,
-2.35062, 0.6460786, 0.2455061, 0, 0, 0, 1, 1,
-2.337891, -2.691298, -3.413699, 0, 0, 0, 1, 1,
-2.326807, 0.08466817, -1.72698, 0, 0, 0, 1, 1,
-2.302844, -0.1188371, -1.782917, 0, 0, 0, 1, 1,
-2.28338, 1.571392, -1.913682, 0, 0, 0, 1, 1,
-2.283101, 0.9769439, -0.9193515, 0, 0, 0, 1, 1,
-2.252648, 0.04310613, -0.4804406, 1, 1, 1, 1, 1,
-2.19034, 0.773048, -2.218317, 1, 1, 1, 1, 1,
-2.154483, 0.8108526, -2.143969, 1, 1, 1, 1, 1,
-2.149144, 0.6230792, -1.605078, 1, 1, 1, 1, 1,
-2.052004, -1.310168, -2.750886, 1, 1, 1, 1, 1,
-2.046951, -0.3428357, -1.045682, 1, 1, 1, 1, 1,
-2.03188, -1.029327, -2.119985, 1, 1, 1, 1, 1,
-2.006256, 0.1625698, -2.303532, 1, 1, 1, 1, 1,
-1.992757, 0.789887, -0.08370014, 1, 1, 1, 1, 1,
-1.991479, -0.6543763, -3.37511, 1, 1, 1, 1, 1,
-1.987575, 1.347915, -2.157446, 1, 1, 1, 1, 1,
-1.982018, -2.266435, -3.004141, 1, 1, 1, 1, 1,
-1.973341, -0.008947467, -0.4295843, 1, 1, 1, 1, 1,
-1.96161, -0.05440402, -1.047471, 1, 1, 1, 1, 1,
-1.961424, 0.0009410118, -1.191916, 1, 1, 1, 1, 1,
-1.941069, 0.4336887, 0.1110571, 0, 0, 1, 1, 1,
-1.936439, 0.5823521, -0.2386402, 1, 0, 0, 1, 1,
-1.904667, -1.686992, -2.935783, 1, 0, 0, 1, 1,
-1.897907, 2.72958, -0.9883029, 1, 0, 0, 1, 1,
-1.89738, 3.1737, -1.40621, 1, 0, 0, 1, 1,
-1.880166, -0.2512519, -1.182701, 1, 0, 0, 1, 1,
-1.870332, 1.382204, -0.3122624, 0, 0, 0, 1, 1,
-1.835719, -0.2567853, -1.105342, 0, 0, 0, 1, 1,
-1.828508, -0.7783966, -2.39371, 0, 0, 0, 1, 1,
-1.821621, 0.3157427, -1.468005, 0, 0, 0, 1, 1,
-1.804077, -0.1114129, -2.307209, 0, 0, 0, 1, 1,
-1.791174, -0.8653713, -1.002549, 0, 0, 0, 1, 1,
-1.787488, 1.128454, -0.09828058, 0, 0, 0, 1, 1,
-1.786487, 3.000981, -1.529595, 1, 1, 1, 1, 1,
-1.760741, 0.303148, -1.365686, 1, 1, 1, 1, 1,
-1.754777, 0.2926852, -0.9803548, 1, 1, 1, 1, 1,
-1.748386, -0.7009394, -2.33061, 1, 1, 1, 1, 1,
-1.728231, 0.8953358, -0.3329113, 1, 1, 1, 1, 1,
-1.727689, -0.1851957, -2.353827, 1, 1, 1, 1, 1,
-1.710335, -1.006755, -0.517801, 1, 1, 1, 1, 1,
-1.693931, -0.5365001, -1.765585, 1, 1, 1, 1, 1,
-1.691831, -1.83964, -2.922621, 1, 1, 1, 1, 1,
-1.681376, -0.4995984, -0.6282076, 1, 1, 1, 1, 1,
-1.67191, -0.2027032, -1.293068, 1, 1, 1, 1, 1,
-1.671787, 0.4171354, -1.099032, 1, 1, 1, 1, 1,
-1.663931, -0.6119196, -2.955897, 1, 1, 1, 1, 1,
-1.65002, 0.1381499, -2.371764, 1, 1, 1, 1, 1,
-1.6271, 0.9038644, -0.3982777, 1, 1, 1, 1, 1,
-1.625425, 1.060382, 0.3201973, 0, 0, 1, 1, 1,
-1.617353, 0.3052215, -2.172494, 1, 0, 0, 1, 1,
-1.614708, 0.9227338, -2.102729, 1, 0, 0, 1, 1,
-1.605476, 1.696602, -0.3120611, 1, 0, 0, 1, 1,
-1.597729, 0.5641215, -0.3159422, 1, 0, 0, 1, 1,
-1.595145, 1.960479, -0.03973389, 1, 0, 0, 1, 1,
-1.59074, 0.5623439, -1.795174, 0, 0, 0, 1, 1,
-1.588273, -1.10333, 0.4705413, 0, 0, 0, 1, 1,
-1.585747, 0.3217323, -1.440293, 0, 0, 0, 1, 1,
-1.568965, 0.4433298, -2.152184, 0, 0, 0, 1, 1,
-1.554814, 1.499358, -1.455443, 0, 0, 0, 1, 1,
-1.539353, -0.3613632, -2.704395, 0, 0, 0, 1, 1,
-1.536707, 0.5475108, -2.009485, 0, 0, 0, 1, 1,
-1.532029, 0.7039726, -0.9374641, 1, 1, 1, 1, 1,
-1.530882, 0.6008809, -2.095331, 1, 1, 1, 1, 1,
-1.528618, -1.248833, -3.874995, 1, 1, 1, 1, 1,
-1.528017, -0.6290913, -1.115329, 1, 1, 1, 1, 1,
-1.527553, -1.887751, -0.7645178, 1, 1, 1, 1, 1,
-1.525693, -0.7103665, -1.634609, 1, 1, 1, 1, 1,
-1.518233, 0.467795, -1.693372, 1, 1, 1, 1, 1,
-1.51306, 0.641192, -2.275007, 1, 1, 1, 1, 1,
-1.496013, 0.1840631, 0.3704113, 1, 1, 1, 1, 1,
-1.479377, -0.7631478, -1.857516, 1, 1, 1, 1, 1,
-1.475487, -0.8923224, -2.645294, 1, 1, 1, 1, 1,
-1.4338, -0.1671563, -1.803826, 1, 1, 1, 1, 1,
-1.422146, 1.128817, -1.536174, 1, 1, 1, 1, 1,
-1.420453, 1.311438, -1.734198, 1, 1, 1, 1, 1,
-1.417119, 0.6308956, 0.009914468, 1, 1, 1, 1, 1,
-1.409667, -0.1054307, 0.1632459, 0, 0, 1, 1, 1,
-1.402062, 0.3166927, -0.5902297, 1, 0, 0, 1, 1,
-1.387959, 0.489022, -1.997609, 1, 0, 0, 1, 1,
-1.375068, -1.191212, -2.078197, 1, 0, 0, 1, 1,
-1.375046, -0.3426376, -0.7352754, 1, 0, 0, 1, 1,
-1.370791, 1.552473, 0.2779766, 1, 0, 0, 1, 1,
-1.354941, -0.6284552, -2.327239, 0, 0, 0, 1, 1,
-1.349837, 2.119896, -0.524658, 0, 0, 0, 1, 1,
-1.348163, 0.3486058, 0.6198981, 0, 0, 0, 1, 1,
-1.347883, 0.2501922, -0.2590142, 0, 0, 0, 1, 1,
-1.346616, 2.312173, 0.2010039, 0, 0, 0, 1, 1,
-1.34171, 0.7708975, -0.5965385, 0, 0, 0, 1, 1,
-1.341358, 0.5925849, -1.058107, 0, 0, 0, 1, 1,
-1.334435, 0.3473102, -1.335439, 1, 1, 1, 1, 1,
-1.328643, -0.6727588, 0.7646995, 1, 1, 1, 1, 1,
-1.32117, 0.3651855, -1.718635, 1, 1, 1, 1, 1,
-1.291583, 0.5085279, -1.721196, 1, 1, 1, 1, 1,
-1.290143, -0.2360076, -1.408726, 1, 1, 1, 1, 1,
-1.289146, -0.8876255, -0.3844707, 1, 1, 1, 1, 1,
-1.288681, -0.07307854, -1.505648, 1, 1, 1, 1, 1,
-1.284462, -0.05093675, -1.923735, 1, 1, 1, 1, 1,
-1.281618, 1.832415, 0.3569996, 1, 1, 1, 1, 1,
-1.277416, -0.7593143, -0.921083, 1, 1, 1, 1, 1,
-1.273406, -0.6289642, -3.274598, 1, 1, 1, 1, 1,
-1.269786, -0.7542942, -3.560629, 1, 1, 1, 1, 1,
-1.265269, 0.5640059, -0.3267069, 1, 1, 1, 1, 1,
-1.255484, 1.263456, -1.360289, 1, 1, 1, 1, 1,
-1.254459, -0.5470501, -3.231005, 1, 1, 1, 1, 1,
-1.242481, -0.9151471, -2.06854, 0, 0, 1, 1, 1,
-1.236979, 0.01170981, -2.013084, 1, 0, 0, 1, 1,
-1.231169, 0.2087954, -1.332581, 1, 0, 0, 1, 1,
-1.22476, -2.257927, -1.860062, 1, 0, 0, 1, 1,
-1.217993, 1.332595, -0.09469456, 1, 0, 0, 1, 1,
-1.216189, 0.9173086, -0.8556664, 1, 0, 0, 1, 1,
-1.198482, -0.4851061, -3.99655, 0, 0, 0, 1, 1,
-1.193496, -0.01453459, -0.8890464, 0, 0, 0, 1, 1,
-1.181309, 0.8732651, -2.481458, 0, 0, 0, 1, 1,
-1.178578, 0.2191403, -1.008892, 0, 0, 0, 1, 1,
-1.172651, 1.450817, -0.2756364, 0, 0, 0, 1, 1,
-1.167853, 1.014862, -2.147399, 0, 0, 0, 1, 1,
-1.160441, 0.6341915, -2.597963, 0, 0, 0, 1, 1,
-1.150402, -1.050253, -1.08152, 1, 1, 1, 1, 1,
-1.148189, -1.939892, -2.749749, 1, 1, 1, 1, 1,
-1.144708, -1.391712, -2.910559, 1, 1, 1, 1, 1,
-1.141975, 0.5028037, -0.6059442, 1, 1, 1, 1, 1,
-1.14119, 0.1859561, -1.004701, 1, 1, 1, 1, 1,
-1.139163, -0.3175659, -1.979591, 1, 1, 1, 1, 1,
-1.133726, -0.496061, -2.595512, 1, 1, 1, 1, 1,
-1.130715, 0.338485, -1.989144, 1, 1, 1, 1, 1,
-1.130019, -1.195789, -5.185044, 1, 1, 1, 1, 1,
-1.124253, 1.62202, -0.07444984, 1, 1, 1, 1, 1,
-1.123458, 0.7559702, -0.1629732, 1, 1, 1, 1, 1,
-1.112546, 1.404834, 0.1649865, 1, 1, 1, 1, 1,
-1.112451, 0.4115217, 0.1635738, 1, 1, 1, 1, 1,
-1.107259, 1.822771, -0.2094667, 1, 1, 1, 1, 1,
-1.106992, 2.040323, 0.04972532, 1, 1, 1, 1, 1,
-1.10076, -0.341712, -1.484934, 0, 0, 1, 1, 1,
-1.097202, -0.3342184, -2.517808, 1, 0, 0, 1, 1,
-1.094938, -0.2862402, -0.775227, 1, 0, 0, 1, 1,
-1.085456, 1.514589, -0.2837306, 1, 0, 0, 1, 1,
-1.083253, 0.3474233, -2.061884, 1, 0, 0, 1, 1,
-1.063034, -0.2437739, -0.813939, 1, 0, 0, 1, 1,
-1.061488, 0.8470482, -1.328859, 0, 0, 0, 1, 1,
-1.052576, 1.030132, -2.293003, 0, 0, 0, 1, 1,
-1.046385, 0.3472163, -0.5185347, 0, 0, 0, 1, 1,
-1.046269, 1.092455, -0.4383894, 0, 0, 0, 1, 1,
-1.044275, -0.9479181, -2.002451, 0, 0, 0, 1, 1,
-1.037789, 0.5107217, -0.8418925, 0, 0, 0, 1, 1,
-1.036517, -0.656601, -2.504646, 0, 0, 0, 1, 1,
-1.033113, 0.6430644, -0.9134374, 1, 1, 1, 1, 1,
-1.027765, 0.3508478, -0.08625296, 1, 1, 1, 1, 1,
-1.023892, -0.2748567, -0.7114155, 1, 1, 1, 1, 1,
-1.023684, -1.719917, -3.299828, 1, 1, 1, 1, 1,
-1.021816, 2.088432, -0.75222, 1, 1, 1, 1, 1,
-1.019278, -1.46423, -1.323768, 1, 1, 1, 1, 1,
-1.007226, 2.00476, -0.09279237, 1, 1, 1, 1, 1,
-0.9908085, 1.631963, -0.08677758, 1, 1, 1, 1, 1,
-0.9856719, -0.9634596, -1.810878, 1, 1, 1, 1, 1,
-0.981625, -0.04462045, -2.156338, 1, 1, 1, 1, 1,
-0.9811297, 1.943684, -0.915056, 1, 1, 1, 1, 1,
-0.9796216, 1.061075, -0.2252918, 1, 1, 1, 1, 1,
-0.9723601, 1.632599, 0.7275702, 1, 1, 1, 1, 1,
-0.9666672, -2.031741, -0.4813195, 1, 1, 1, 1, 1,
-0.9608299, -0.696892, -0.3850041, 1, 1, 1, 1, 1,
-0.9594511, -0.216882, -2.686733, 0, 0, 1, 1, 1,
-0.9569578, 0.5933838, -1.35699, 1, 0, 0, 1, 1,
-0.949675, -0.2333699, -1.757312, 1, 0, 0, 1, 1,
-0.9466641, 1.879448, -0.3315644, 1, 0, 0, 1, 1,
-0.9449838, 0.8929299, 0.2206516, 1, 0, 0, 1, 1,
-0.9438075, -0.1926201, -1.450945, 1, 0, 0, 1, 1,
-0.9296206, -0.8680565, -2.46779, 0, 0, 0, 1, 1,
-0.929434, 0.3615741, -0.8306652, 0, 0, 0, 1, 1,
-0.9264792, 1.684464, -2.375267, 0, 0, 0, 1, 1,
-0.9236067, 0.7199979, -1.715245, 0, 0, 0, 1, 1,
-0.9140602, 2.874501, -0.2535509, 0, 0, 0, 1, 1,
-0.9115183, -0.9603313, -4.375359, 0, 0, 0, 1, 1,
-0.9042671, -0.1418776, -1.966833, 0, 0, 0, 1, 1,
-0.9030843, 0.362839, -0.3610843, 1, 1, 1, 1, 1,
-0.8962206, -0.7507066, -2.641836, 1, 1, 1, 1, 1,
-0.8753895, -1.129643, -1.690224, 1, 1, 1, 1, 1,
-0.8618393, -0.21214, -0.07610419, 1, 1, 1, 1, 1,
-0.8605841, -0.5099689, -2.065668, 1, 1, 1, 1, 1,
-0.8569677, 0.97685, 0.02294167, 1, 1, 1, 1, 1,
-0.8541559, 0.2664489, -1.284816, 1, 1, 1, 1, 1,
-0.8486382, -1.225619, -2.320283, 1, 1, 1, 1, 1,
-0.8478108, 1.118088, 0.6285804, 1, 1, 1, 1, 1,
-0.847115, 0.282785, -1.610786, 1, 1, 1, 1, 1,
-0.8452441, 0.612564, 0.5118375, 1, 1, 1, 1, 1,
-0.8384117, 0.3664274, -0.6790707, 1, 1, 1, 1, 1,
-0.8368044, -2.487179, -3.050931, 1, 1, 1, 1, 1,
-0.8343996, -1.852662, -3.257933, 1, 1, 1, 1, 1,
-0.8342592, 1.037569, -0.9426222, 1, 1, 1, 1, 1,
-0.8214194, 2.351329, -0.03264515, 0, 0, 1, 1, 1,
-0.8198486, 1.667537, -0.9283791, 1, 0, 0, 1, 1,
-0.8097982, 0.1953192, -2.800128, 1, 0, 0, 1, 1,
-0.8094307, -0.1857529, -1.991318, 1, 0, 0, 1, 1,
-0.807983, -1.188403, -1.763161, 1, 0, 0, 1, 1,
-0.8068293, 1.154168, -0.7676089, 1, 0, 0, 1, 1,
-0.8061444, -0.6685893, -1.820615, 0, 0, 0, 1, 1,
-0.8056237, -0.4198876, -2.412488, 0, 0, 0, 1, 1,
-0.8053188, 0.1521863, -0.762314, 0, 0, 0, 1, 1,
-0.7970343, -1.002209, -2.339223, 0, 0, 0, 1, 1,
-0.7956989, 0.6925786, -2.599883, 0, 0, 0, 1, 1,
-0.7882715, 0.5633665, -2.222118, 0, 0, 0, 1, 1,
-0.7875106, -0.03970027, -0.5431666, 0, 0, 0, 1, 1,
-0.7801508, -0.5546177, -2.157789, 1, 1, 1, 1, 1,
-0.7756578, 0.1773802, -2.729738, 1, 1, 1, 1, 1,
-0.774252, -2.194911, -1.796838, 1, 1, 1, 1, 1,
-0.7737277, 0.1824733, -1.829957, 1, 1, 1, 1, 1,
-0.7713876, -0.5341802, -1.641352, 1, 1, 1, 1, 1,
-0.7691652, 0.1785214, -3.423179, 1, 1, 1, 1, 1,
-0.7656092, -0.2457785, -1.106754, 1, 1, 1, 1, 1,
-0.7568316, -0.1457798, -2.227491, 1, 1, 1, 1, 1,
-0.7548186, 1.039009, -1.910382, 1, 1, 1, 1, 1,
-0.7506738, 1.263965, -0.6130515, 1, 1, 1, 1, 1,
-0.7471722, 1.71231, 0.3652169, 1, 1, 1, 1, 1,
-0.7463066, -0.4522231, -2.098914, 1, 1, 1, 1, 1,
-0.7436014, 0.2422977, -0.9175585, 1, 1, 1, 1, 1,
-0.7434886, -0.8707708, -3.1806, 1, 1, 1, 1, 1,
-0.7388811, -0.958645, -3.408404, 1, 1, 1, 1, 1,
-0.7298843, 0.7177992, 0.02640011, 0, 0, 1, 1, 1,
-0.7267339, -1.742486, -3.59446, 1, 0, 0, 1, 1,
-0.7256742, -0.3343628, -0.7380419, 1, 0, 0, 1, 1,
-0.7241023, 0.1339779, -1.080429, 1, 0, 0, 1, 1,
-0.7235795, 1.352094, -0.6861296, 1, 0, 0, 1, 1,
-0.7057775, -0.01530339, -2.3975, 1, 0, 0, 1, 1,
-0.6983579, -0.5731228, -1.680689, 0, 0, 0, 1, 1,
-0.6974828, 0.8974365, -0.7649846, 0, 0, 0, 1, 1,
-0.696255, 1.175015, -0.8897836, 0, 0, 0, 1, 1,
-0.6942726, 0.05157836, -3.157885, 0, 0, 0, 1, 1,
-0.6941957, -1.010034, -3.594081, 0, 0, 0, 1, 1,
-0.6830418, 1.564847, -1.839871, 0, 0, 0, 1, 1,
-0.6734048, -0.2056275, -1.35193, 0, 0, 0, 1, 1,
-0.6733897, -0.03451073, -2.489632, 1, 1, 1, 1, 1,
-0.6685884, 0.8931885, -1.237796, 1, 1, 1, 1, 1,
-0.667885, 0.981261, -1.435054, 1, 1, 1, 1, 1,
-0.6652601, 0.9762614, 0.1314362, 1, 1, 1, 1, 1,
-0.6647175, -0.2715127, -1.463313, 1, 1, 1, 1, 1,
-0.6571376, 0.1377483, -2.820273, 1, 1, 1, 1, 1,
-0.6545665, 0.1653347, -2.207194, 1, 1, 1, 1, 1,
-0.6522738, 0.1128642, -0.4500794, 1, 1, 1, 1, 1,
-0.6515236, -1.540412, -3.457904, 1, 1, 1, 1, 1,
-0.651372, -0.1015123, -1.470095, 1, 1, 1, 1, 1,
-0.6479934, 0.6304729, -1.455262, 1, 1, 1, 1, 1,
-0.6460741, -1.998576, -1.549253, 1, 1, 1, 1, 1,
-0.6354389, -0.3459332, -1.859731, 1, 1, 1, 1, 1,
-0.6302294, 0.8230292, 0.06971659, 1, 1, 1, 1, 1,
-0.6280092, -0.187715, -3.265675, 1, 1, 1, 1, 1,
-0.6252626, -0.8936201, -3.104362, 0, 0, 1, 1, 1,
-0.6195768, 0.6684526, 0.06017531, 1, 0, 0, 1, 1,
-0.6173427, 0.4435806, -2.208765, 1, 0, 0, 1, 1,
-0.6166095, -0.7595164, -4.104609, 1, 0, 0, 1, 1,
-0.6140138, 0.08238201, -1.112652, 1, 0, 0, 1, 1,
-0.6095823, 0.1509364, -2.054769, 1, 0, 0, 1, 1,
-0.6063042, 0.1497283, -2.049368, 0, 0, 0, 1, 1,
-0.5991136, 0.2009406, -2.242758, 0, 0, 0, 1, 1,
-0.5988589, 0.6403207, 1.759059, 0, 0, 0, 1, 1,
-0.5941338, -0.4528348, -2.446685, 0, 0, 0, 1, 1,
-0.5928961, 1.393005, -2.28216, 0, 0, 0, 1, 1,
-0.5908098, -1.614641, -1.17793, 0, 0, 0, 1, 1,
-0.589694, 0.9309034, -0.7160064, 0, 0, 0, 1, 1,
-0.5853741, 0.7093693, 0.6048343, 1, 1, 1, 1, 1,
-0.5832316, -1.291107, -2.663461, 1, 1, 1, 1, 1,
-0.5818647, 0.07905537, 0.7496501, 1, 1, 1, 1, 1,
-0.5814489, -1.308096, -2.767121, 1, 1, 1, 1, 1,
-0.5807868, 0.6090016, -1.857897, 1, 1, 1, 1, 1,
-0.5778075, -0.2404284, -0.8500581, 1, 1, 1, 1, 1,
-0.5712075, 0.7184098, -2.385067, 1, 1, 1, 1, 1,
-0.5674138, -0.5631024, -2.270516, 1, 1, 1, 1, 1,
-0.5637287, 1.4694, 0.3941188, 1, 1, 1, 1, 1,
-0.56095, -2.373032, -2.080053, 1, 1, 1, 1, 1,
-0.5566671, -0.09662039, -1.951948, 1, 1, 1, 1, 1,
-0.5538507, -1.146681, -2.306679, 1, 1, 1, 1, 1,
-0.5476666, 0.1782781, -0.6220335, 1, 1, 1, 1, 1,
-0.5473956, -2.635487, -2.724359, 1, 1, 1, 1, 1,
-0.5400684, 0.6041501, -0.575601, 1, 1, 1, 1, 1,
-0.5392733, 0.8439754, 0.7039041, 0, 0, 1, 1, 1,
-0.5380604, 0.2228066, -1.779063, 1, 0, 0, 1, 1,
-0.5362133, -0.380816, -2.231134, 1, 0, 0, 1, 1,
-0.5336098, 0.5162395, -1.817152, 1, 0, 0, 1, 1,
-0.526969, -1.032641, -0.8763846, 1, 0, 0, 1, 1,
-0.5264834, -0.150625, -1.438338, 1, 0, 0, 1, 1,
-0.5243495, 0.8684516, -1.677788, 0, 0, 0, 1, 1,
-0.5202049, -2.050905, -2.783091, 0, 0, 0, 1, 1,
-0.5172663, -0.456927, -2.627676, 0, 0, 0, 1, 1,
-0.5170009, -1.058441, -4.262158, 0, 0, 0, 1, 1,
-0.5114065, 0.6840873, -0.1630992, 0, 0, 0, 1, 1,
-0.5097311, -0.4731221, -2.610518, 0, 0, 0, 1, 1,
-0.5093569, -0.1471712, -1.320248, 0, 0, 0, 1, 1,
-0.5088625, 2.362473, -0.1786392, 1, 1, 1, 1, 1,
-0.5075417, 2.024684, -0.5088128, 1, 1, 1, 1, 1,
-0.5064337, -2.146216, -2.454242, 1, 1, 1, 1, 1,
-0.5058979, -0.07507227, -2.334371, 1, 1, 1, 1, 1,
-0.5043495, -0.7776631, -2.476666, 1, 1, 1, 1, 1,
-0.5001991, 2.307945, -1.091301, 1, 1, 1, 1, 1,
-0.4997715, 0.6599634, -0.01199012, 1, 1, 1, 1, 1,
-0.4982405, 1.268129, -0.2602991, 1, 1, 1, 1, 1,
-0.497624, -0.1662808, -2.127641, 1, 1, 1, 1, 1,
-0.4951843, 0.6969273, 1.126379, 1, 1, 1, 1, 1,
-0.4920847, 1.557555, -1.197446, 1, 1, 1, 1, 1,
-0.4900655, 1.069173, -1.781796, 1, 1, 1, 1, 1,
-0.4865008, 0.823234, -2.171157, 1, 1, 1, 1, 1,
-0.4856299, -1.853561, -3.476313, 1, 1, 1, 1, 1,
-0.485447, 0.2826064, 0.427399, 1, 1, 1, 1, 1,
-0.4830998, -0.6157335, -3.70151, 0, 0, 1, 1, 1,
-0.4822586, 0.5904453, -0.5171854, 1, 0, 0, 1, 1,
-0.4822136, 0.0006752029, -0.3392697, 1, 0, 0, 1, 1,
-0.48044, 0.7337696, -0.2234947, 1, 0, 0, 1, 1,
-0.4781711, -0.2764412, -2.160706, 1, 0, 0, 1, 1,
-0.477309, -0.4458201, -0.7742491, 1, 0, 0, 1, 1,
-0.4736117, -0.3451075, -1.789068, 0, 0, 0, 1, 1,
-0.4728469, -0.3720467, -0.4996556, 0, 0, 0, 1, 1,
-0.4685412, 0.0370305, -2.509287, 0, 0, 0, 1, 1,
-0.4655378, -0.127603, -1.06188, 0, 0, 0, 1, 1,
-0.4605211, -1.752014, -3.080462, 0, 0, 0, 1, 1,
-0.457975, -2.251419, -4.411229, 0, 0, 0, 1, 1,
-0.4572845, 0.6862267, 0.04010845, 0, 0, 0, 1, 1,
-0.4554736, 0.07480016, -2.100747, 1, 1, 1, 1, 1,
-0.4542011, -0.1582741, -2.170659, 1, 1, 1, 1, 1,
-0.4532844, -2.181319, -2.987221, 1, 1, 1, 1, 1,
-0.4509916, 0.7475049, -1.650694, 1, 1, 1, 1, 1,
-0.4433165, 0.2729189, -1.125966, 1, 1, 1, 1, 1,
-0.4429888, 0.3255487, -0.4036295, 1, 1, 1, 1, 1,
-0.4381455, 0.8256695, -1.224238, 1, 1, 1, 1, 1,
-0.4320977, -0.3040194, -1.154263, 1, 1, 1, 1, 1,
-0.4268503, 0.1568205, -2.380692, 1, 1, 1, 1, 1,
-0.4262998, 0.9818533, 1.10125, 1, 1, 1, 1, 1,
-0.4230149, 0.0473046, -0.575736, 1, 1, 1, 1, 1,
-0.4219896, -0.2650233, -3.408441, 1, 1, 1, 1, 1,
-0.4213631, 0.9477031, -1.41229, 1, 1, 1, 1, 1,
-0.4124135, -1.383152, -2.781182, 1, 1, 1, 1, 1,
-0.4083411, -0.2052227, -1.573368, 1, 1, 1, 1, 1,
-0.4072776, -0.7609962, -0.933309, 0, 0, 1, 1, 1,
-0.4058644, 0.4624606, -1.011008, 1, 0, 0, 1, 1,
-0.3999187, 0.497563, 0.3688719, 1, 0, 0, 1, 1,
-0.3989803, -0.9660531, -3.249645, 1, 0, 0, 1, 1,
-0.3875827, 0.9867383, -1.576803, 1, 0, 0, 1, 1,
-0.3875308, 0.2077919, -2.91721, 1, 0, 0, 1, 1,
-0.3827889, -1.611917, -4.342613, 0, 0, 0, 1, 1,
-0.377445, -0.9710621, -3.82025, 0, 0, 0, 1, 1,
-0.3753139, 1.146886, -0.9119524, 0, 0, 0, 1, 1,
-0.3720664, 0.1872226, -1.018516, 0, 0, 0, 1, 1,
-0.3706971, -2.399838, -2.306592, 0, 0, 0, 1, 1,
-0.364506, 0.09982792, -0.4235427, 0, 0, 0, 1, 1,
-0.3611372, -0.2123685, -2.673566, 0, 0, 0, 1, 1,
-0.3592299, -1.119735, -2.267963, 1, 1, 1, 1, 1,
-0.3560243, 0.9515185, -0.8922396, 1, 1, 1, 1, 1,
-0.3513882, -0.5248235, -1.271501, 1, 1, 1, 1, 1,
-0.3508608, 0.785939, -0.05361441, 1, 1, 1, 1, 1,
-0.3508586, 1.553081, 0.2170837, 1, 1, 1, 1, 1,
-0.3498431, -0.4916181, -2.99799, 1, 1, 1, 1, 1,
-0.3467425, 0.4064073, -0.6336306, 1, 1, 1, 1, 1,
-0.3390868, 0.9939657, 0.7969335, 1, 1, 1, 1, 1,
-0.3384583, 0.3826604, -0.712598, 1, 1, 1, 1, 1,
-0.3294487, 1.344648, -1.636484, 1, 1, 1, 1, 1,
-0.3263183, -0.729564, -0.6939023, 1, 1, 1, 1, 1,
-0.3254192, 0.7186579, 0.2443413, 1, 1, 1, 1, 1,
-0.3227365, 0.4445081, -0.9173433, 1, 1, 1, 1, 1,
-0.312036, 1.712952, -0.6984668, 1, 1, 1, 1, 1,
-0.3080751, -1.977188, -3.161906, 1, 1, 1, 1, 1,
-0.3065404, 3.219756, -0.742909, 0, 0, 1, 1, 1,
-0.3029185, 1.815142, -0.6546103, 1, 0, 0, 1, 1,
-0.3027853, -1.226994, -2.8922, 1, 0, 0, 1, 1,
-0.3008619, -1.171847, -3.519707, 1, 0, 0, 1, 1,
-0.2908421, -0.6441889, -3.111671, 1, 0, 0, 1, 1,
-0.2902648, 1.321939, -0.3050638, 1, 0, 0, 1, 1,
-0.2881492, 1.115068, -0.735586, 0, 0, 0, 1, 1,
-0.2870939, 1.380683, 0.244142, 0, 0, 0, 1, 1,
-0.2856341, -0.9156724, -0.3723086, 0, 0, 0, 1, 1,
-0.2845068, 0.1747817, -2.572826, 0, 0, 0, 1, 1,
-0.280904, 1.1595, -0.7632195, 0, 0, 0, 1, 1,
-0.2801196, 0.2267705, -1.914338, 0, 0, 0, 1, 1,
-0.2781135, -1.813133, -2.465891, 0, 0, 0, 1, 1,
-0.2771302, 0.443663, -1.474571, 1, 1, 1, 1, 1,
-0.2744951, 1.492033, 1.135783, 1, 1, 1, 1, 1,
-0.2738539, -1.600783, -1.868751, 1, 1, 1, 1, 1,
-0.273544, -0.06289184, -0.4416732, 1, 1, 1, 1, 1,
-0.273267, -0.05712898, -0.6777073, 1, 1, 1, 1, 1,
-0.2729412, 1.378872, 0.8983819, 1, 1, 1, 1, 1,
-0.2713365, -0.01563168, -1.144059, 1, 1, 1, 1, 1,
-0.269973, -0.7476082, -2.263773, 1, 1, 1, 1, 1,
-0.2699203, 1.328361, 0.1494483, 1, 1, 1, 1, 1,
-0.2691883, -0.9143932, -1.359876, 1, 1, 1, 1, 1,
-0.2673054, 0.6304766, 0.2025957, 1, 1, 1, 1, 1,
-0.2660193, -0.9773731, -1.700172, 1, 1, 1, 1, 1,
-0.2617203, -1.935978, -2.783023, 1, 1, 1, 1, 1,
-0.2612602, 0.2071388, 1.35066, 1, 1, 1, 1, 1,
-0.2604717, -0.5846115, -2.876377, 1, 1, 1, 1, 1,
-0.2604636, -0.07069281, -1.511708, 0, 0, 1, 1, 1,
-0.2603991, -0.05954686, -1.26552, 1, 0, 0, 1, 1,
-0.2591663, 0.1534448, -1.109705, 1, 0, 0, 1, 1,
-0.257262, -0.3714274, -5.24168, 1, 0, 0, 1, 1,
-0.2542517, -0.5482454, -2.217683, 1, 0, 0, 1, 1,
-0.2533936, 0.8141752, -1.308712, 1, 0, 0, 1, 1,
-0.2527504, 1.353576, 0.1037129, 0, 0, 0, 1, 1,
-0.2527016, -0.5874354, -3.675453, 0, 0, 0, 1, 1,
-0.2451893, -1.210208, -2.085452, 0, 0, 0, 1, 1,
-0.2378478, -0.5843798, -1.348468, 0, 0, 0, 1, 1,
-0.2350531, 0.7328678, 0.3772465, 0, 0, 0, 1, 1,
-0.2333672, -0.4173653, -2.790372, 0, 0, 0, 1, 1,
-0.2319059, -0.6388198, -3.424026, 0, 0, 0, 1, 1,
-0.230834, -0.01701059, -0.8592583, 1, 1, 1, 1, 1,
-0.2269857, -0.3887219, -1.206059, 1, 1, 1, 1, 1,
-0.2268651, 0.1045122, 1.002672, 1, 1, 1, 1, 1,
-0.2238312, -0.2538556, -2.696375, 1, 1, 1, 1, 1,
-0.2236793, 0.08880144, -1.168207, 1, 1, 1, 1, 1,
-0.2235902, 1.055582, -1.868285, 1, 1, 1, 1, 1,
-0.2216887, 0.56221, -1.897582, 1, 1, 1, 1, 1,
-0.2216575, -0.3454551, -2.125736, 1, 1, 1, 1, 1,
-0.2207783, 1.51035, -0.7653911, 1, 1, 1, 1, 1,
-0.2199568, 0.2024471, -0.7108483, 1, 1, 1, 1, 1,
-0.2143461, 0.1448949, -0.5064092, 1, 1, 1, 1, 1,
-0.2108677, 0.3381813, -0.8208683, 1, 1, 1, 1, 1,
-0.2051264, -0.1882009, -2.3468, 1, 1, 1, 1, 1,
-0.2036968, 1.567938, 0.5104027, 1, 1, 1, 1, 1,
-0.1920987, 0.122712, -2.394387, 1, 1, 1, 1, 1,
-0.1883231, -1.145445, -1.707334, 0, 0, 1, 1, 1,
-0.1882222, -0.7576308, -0.5735944, 1, 0, 0, 1, 1,
-0.1852118, -0.7734686, -1.01026, 1, 0, 0, 1, 1,
-0.1842192, -0.7702047, -1.834319, 1, 0, 0, 1, 1,
-0.1830192, 0.6910066, -1.044034, 1, 0, 0, 1, 1,
-0.1828073, -0.2799362, -1.010375, 1, 0, 0, 1, 1,
-0.181806, -1.25029, -3.293531, 0, 0, 0, 1, 1,
-0.1813181, 2.949861, -1.36237, 0, 0, 0, 1, 1,
-0.1807512, 1.459549, 0.4724667, 0, 0, 0, 1, 1,
-0.1799455, 0.5022179, -0.8584076, 0, 0, 0, 1, 1,
-0.1787262, 1.059362, 1.344918, 0, 0, 0, 1, 1,
-0.1779336, 1.028466, 0.5461481, 0, 0, 0, 1, 1,
-0.17264, -0.174418, -3.423215, 0, 0, 0, 1, 1,
-0.1703337, -1.500223, -4.234588, 1, 1, 1, 1, 1,
-0.1692096, -0.5206444, -3.330286, 1, 1, 1, 1, 1,
-0.1675365, 0.6384864, -1.743374, 1, 1, 1, 1, 1,
-0.1668752, 0.5392486, -1.028986, 1, 1, 1, 1, 1,
-0.1656773, 1.09958, -2.40513, 1, 1, 1, 1, 1,
-0.165561, 2.781609, -1.909757, 1, 1, 1, 1, 1,
-0.1620455, -0.2828515, -2.411093, 1, 1, 1, 1, 1,
-0.1604296, -0.6110891, -1.879151, 1, 1, 1, 1, 1,
-0.156702, 0.7771731, -0.9854149, 1, 1, 1, 1, 1,
-0.1557595, -0.4053321, -3.590233, 1, 1, 1, 1, 1,
-0.155757, 1.893202, -2.45066, 1, 1, 1, 1, 1,
-0.1361385, -0.7064019, -1.78702, 1, 1, 1, 1, 1,
-0.1301395, 1.224112, -2.171089, 1, 1, 1, 1, 1,
-0.126927, 0.7802125, 0.3128189, 1, 1, 1, 1, 1,
-0.1252708, -0.9404648, -3.141147, 1, 1, 1, 1, 1,
-0.1233385, 2.04034, 0.7231914, 0, 0, 1, 1, 1,
-0.1111035, 1.787939, 0.7530286, 1, 0, 0, 1, 1,
-0.109858, -0.7852837, -2.85126, 1, 0, 0, 1, 1,
-0.1073205, -0.9845631, -1.08257, 1, 0, 0, 1, 1,
-0.1057268, 0.295792, -0.8809161, 1, 0, 0, 1, 1,
-0.09946504, -0.04053039, -1.296461, 1, 0, 0, 1, 1,
-0.09561538, 0.3508005, -1.232492, 0, 0, 0, 1, 1,
-0.09045837, 0.1985423, 0.173517, 0, 0, 0, 1, 1,
-0.09016041, 0.4923721, -0.3537672, 0, 0, 0, 1, 1,
-0.08476485, 1.460418, -1.415163, 0, 0, 0, 1, 1,
-0.0843889, 0.7628233, -0.05028734, 0, 0, 0, 1, 1,
-0.08081481, -0.5013177, -2.075115, 0, 0, 0, 1, 1,
-0.06893636, -0.69761, -3.58192, 0, 0, 0, 1, 1,
-0.06640305, 0.2929141, 0.9057293, 1, 1, 1, 1, 1,
-0.06339628, 0.3943802, -1.300282, 1, 1, 1, 1, 1,
-0.06196948, -0.4257793, -3.077192, 1, 1, 1, 1, 1,
-0.06114944, 0.1671091, -2.905197, 1, 1, 1, 1, 1,
-0.05915937, -0.1916582, -3.132435, 1, 1, 1, 1, 1,
-0.05888592, -1.333732, -4.554112, 1, 1, 1, 1, 1,
-0.05647552, -2.140619, -4.599379, 1, 1, 1, 1, 1,
-0.05487635, -0.4153416, -2.468973, 1, 1, 1, 1, 1,
-0.05314305, -0.1515538, -3.447746, 1, 1, 1, 1, 1,
-0.05036145, -1.527509, -3.346684, 1, 1, 1, 1, 1,
-0.04931334, 0.8806252, -0.5668479, 1, 1, 1, 1, 1,
-0.04731051, -1.186604, -3.229662, 1, 1, 1, 1, 1,
-0.04097215, 0.1050154, -0.3162291, 1, 1, 1, 1, 1,
-0.03518892, 0.1930555, -2.448408, 1, 1, 1, 1, 1,
-0.03451586, -0.2747193, -1.748492, 1, 1, 1, 1, 1,
-0.03383133, -0.2180979, -2.217648, 0, 0, 1, 1, 1,
-0.03043482, -0.6112612, -2.77268, 1, 0, 0, 1, 1,
-0.03001744, -2.936355, -1.65853, 1, 0, 0, 1, 1,
-0.02790393, 0.04519087, 1.148674, 1, 0, 0, 1, 1,
-0.02691232, -0.1266321, -4.401866, 1, 0, 0, 1, 1,
-0.02294443, 1.658452, -0.2883015, 1, 0, 0, 1, 1,
-0.02201411, -0.4499622, -2.368377, 0, 0, 0, 1, 1,
-0.02101929, 0.9035924, 1.789324, 0, 0, 0, 1, 1,
-0.01390741, 0.7825003, 0.8670754, 0, 0, 0, 1, 1,
-0.01171914, 0.8698025, 1.374463, 0, 0, 0, 1, 1,
-0.002123476, -0.3307685, -2.169614, 0, 0, 0, 1, 1,
-0.001918958, 3.151849, -1.538727, 0, 0, 0, 1, 1,
-0.001607816, -0.7238188, -4.303445, 0, 0, 0, 1, 1,
-0.001593531, 0.6753527, 0.6567387, 1, 1, 1, 1, 1,
0.0002151975, -0.5298985, 3.687866, 1, 1, 1, 1, 1,
0.003452982, 1.274904, 0.2285264, 1, 1, 1, 1, 1,
0.005155324, -0.4830472, 3.925062, 1, 1, 1, 1, 1,
0.005194147, -0.1402922, 3.734664, 1, 1, 1, 1, 1,
0.01052612, -2.340653, 4.249996, 1, 1, 1, 1, 1,
0.01294332, -0.01980521, 2.179068, 1, 1, 1, 1, 1,
0.01838825, -1.040305, 3.884035, 1, 1, 1, 1, 1,
0.01966695, 0.856681, -2.272702, 1, 1, 1, 1, 1,
0.02051309, 0.9414847, -2.214769, 1, 1, 1, 1, 1,
0.02087197, 0.8833656, 1.572299, 1, 1, 1, 1, 1,
0.02406249, -1.395959, 3.426794, 1, 1, 1, 1, 1,
0.02671847, 1.248154, -0.6836885, 1, 1, 1, 1, 1,
0.03079673, 2.032832, -0.2602974, 1, 1, 1, 1, 1,
0.0319462, -0.1956219, -0.00993145, 1, 1, 1, 1, 1,
0.03457195, -0.9354578, 3.884082, 0, 0, 1, 1, 1,
0.03505918, -0.9367871, 2.774339, 1, 0, 0, 1, 1,
0.04356019, -2.04212, 2.598103, 1, 0, 0, 1, 1,
0.04650686, -0.5641623, 4.444106, 1, 0, 0, 1, 1,
0.04746615, -0.07883557, 2.511404, 1, 0, 0, 1, 1,
0.05109419, 0.0897845, -0.01291998, 1, 0, 0, 1, 1,
0.05117088, -1.959962, 1.718438, 0, 0, 0, 1, 1,
0.05617914, 0.9641675, 1.042723, 0, 0, 0, 1, 1,
0.0575797, 0.6233504, 0.9188104, 0, 0, 0, 1, 1,
0.05769811, 0.1323992, -0.8681225, 0, 0, 0, 1, 1,
0.0584255, -0.0288334, 1.572885, 0, 0, 0, 1, 1,
0.06173643, 2.116766, -2.264281, 0, 0, 0, 1, 1,
0.06228252, 1.56582, -1.682771, 0, 0, 0, 1, 1,
0.06284489, 0.4395606, -1.629636, 1, 1, 1, 1, 1,
0.06563048, -2.828357, 2.197001, 1, 1, 1, 1, 1,
0.06581703, -1.465266, 4.294966, 1, 1, 1, 1, 1,
0.06738133, -0.604451, 3.363625, 1, 1, 1, 1, 1,
0.06841297, -0.2020493, 2.187118, 1, 1, 1, 1, 1,
0.073125, 0.6857207, -0.6508535, 1, 1, 1, 1, 1,
0.07350647, -1.41498, 2.356956, 1, 1, 1, 1, 1,
0.0788871, -1.425708, 3.095293, 1, 1, 1, 1, 1,
0.08077469, -2.925307, 3.695832, 1, 1, 1, 1, 1,
0.08218212, 1.546272, 1.09022, 1, 1, 1, 1, 1,
0.0828902, -0.5593668, 2.841611, 1, 1, 1, 1, 1,
0.08672095, 1.10383, -0.09737672, 1, 1, 1, 1, 1,
0.08927056, -0.6780432, 3.373091, 1, 1, 1, 1, 1,
0.08976571, 0.08912062, 0.9733019, 1, 1, 1, 1, 1,
0.0940332, 0.7827177, -0.4715911, 1, 1, 1, 1, 1,
0.09763672, 0.7041571, -0.7866328, 0, 0, 1, 1, 1,
0.09919845, 2.01746, 0.8250293, 1, 0, 0, 1, 1,
0.1002556, 1.905367, -0.04479521, 1, 0, 0, 1, 1,
0.100575, -1.313204, 0.8736404, 1, 0, 0, 1, 1,
0.1013858, 1.221176, 0.1022963, 1, 0, 0, 1, 1,
0.1018594, -0.973646, 2.48339, 1, 0, 0, 1, 1,
0.1046018, 1.009703, -1.178025, 0, 0, 0, 1, 1,
0.1102811, -1.358574, 2.038006, 0, 0, 0, 1, 1,
0.1135874, -0.9497558, 4.209005, 0, 0, 0, 1, 1,
0.1141902, 1.105819, -0.3767806, 0, 0, 0, 1, 1,
0.1166876, 0.04677815, 0.9031651, 0, 0, 0, 1, 1,
0.1182522, -0.5202395, 2.440664, 0, 0, 0, 1, 1,
0.1246633, 0.7638622, 1.654657, 0, 0, 0, 1, 1,
0.1256741, -0.2998603, 3.317348, 1, 1, 1, 1, 1,
0.1287605, 0.7133567, -0.1956498, 1, 1, 1, 1, 1,
0.1303518, 1.683473, 0.3587641, 1, 1, 1, 1, 1,
0.1309829, -0.4022334, 2.376126, 1, 1, 1, 1, 1,
0.1365498, 0.09211943, 0.3970105, 1, 1, 1, 1, 1,
0.145809, 0.9504956, -0.7304052, 1, 1, 1, 1, 1,
0.1470216, -1.553481, 3.786362, 1, 1, 1, 1, 1,
0.1471869, -1.168107, 2.347663, 1, 1, 1, 1, 1,
0.1498731, 0.351548, 0.176187, 1, 1, 1, 1, 1,
0.1538906, 1.047127, 0.434608, 1, 1, 1, 1, 1,
0.1583503, 0.745402, 2.15433, 1, 1, 1, 1, 1,
0.1586161, -0.7747069, 2.805472, 1, 1, 1, 1, 1,
0.1596682, -0.7078763, 2.652395, 1, 1, 1, 1, 1,
0.1598821, -0.2515453, 3.039119, 1, 1, 1, 1, 1,
0.162192, -0.1635314, 3.110862, 1, 1, 1, 1, 1,
0.1684525, 0.2759423, 0.8641748, 0, 0, 1, 1, 1,
0.1703548, 0.5529441, -0.2915505, 1, 0, 0, 1, 1,
0.1717459, 2.310362, 1.841309, 1, 0, 0, 1, 1,
0.1728819, -0.5576215, 2.921613, 1, 0, 0, 1, 1,
0.1736499, 1.055788, 1.835665, 1, 0, 0, 1, 1,
0.1742636, 0.6385505, 2.849122, 1, 0, 0, 1, 1,
0.1743802, -4.069049, 2.851848, 0, 0, 0, 1, 1,
0.1748122, 0.950501, -1.211261, 0, 0, 0, 1, 1,
0.1766353, 0.1444732, 0.7797627, 0, 0, 0, 1, 1,
0.1780163, -0.3288819, 2.983236, 0, 0, 0, 1, 1,
0.1800619, 1.182521, 1.519857, 0, 0, 0, 1, 1,
0.1879974, -0.4832437, 1.689314, 0, 0, 0, 1, 1,
0.1893416, -1.47362, 3.402824, 0, 0, 0, 1, 1,
0.1896978, -0.4837323, 3.385906, 1, 1, 1, 1, 1,
0.1897351, 0.7348318, -0.3394891, 1, 1, 1, 1, 1,
0.1916443, 0.3793679, 0.550464, 1, 1, 1, 1, 1,
0.192553, 0.3655189, 1.144961, 1, 1, 1, 1, 1,
0.1989155, -2.473702, 3.212884, 1, 1, 1, 1, 1,
0.2015305, -1.219636, 4.879817, 1, 1, 1, 1, 1,
0.2024591, 0.3430178, 1.330155, 1, 1, 1, 1, 1,
0.2024604, 0.2450714, 0.4960907, 1, 1, 1, 1, 1,
0.203147, -1.376323, 3.277587, 1, 1, 1, 1, 1,
0.2033655, 0.2930486, 1.279598, 1, 1, 1, 1, 1,
0.2035563, -0.1759474, 3.524799, 1, 1, 1, 1, 1,
0.2089039, -0.1577388, 2.12839, 1, 1, 1, 1, 1,
0.2111001, 0.7314045, -0.4937613, 1, 1, 1, 1, 1,
0.2171865, -0.6102429, 0.9912564, 1, 1, 1, 1, 1,
0.2197142, -1.210155, 2.886947, 1, 1, 1, 1, 1,
0.2209146, -0.2019822, 3.165332, 0, 0, 1, 1, 1,
0.2225189, -0.7617137, 3.295642, 1, 0, 0, 1, 1,
0.2228913, 0.4862304, 0.5386175, 1, 0, 0, 1, 1,
0.2238182, -1.047239, 3.018291, 1, 0, 0, 1, 1,
0.2259976, 1.547582, 2.415452, 1, 0, 0, 1, 1,
0.2290633, 0.5460913, 0.9940814, 1, 0, 0, 1, 1,
0.2335213, -0.2864711, 2.485125, 0, 0, 0, 1, 1,
0.235937, 0.02719452, 4.317912, 0, 0, 0, 1, 1,
0.2367378, -0.5634772, 2.85731, 0, 0, 0, 1, 1,
0.2370626, 1.053308, 1.077613, 0, 0, 0, 1, 1,
0.239641, 0.5314555, -1.757962, 0, 0, 0, 1, 1,
0.2422018, 0.6759707, -0.07064851, 0, 0, 0, 1, 1,
0.243105, 0.3760794, -0.9665711, 0, 0, 0, 1, 1,
0.2454597, 0.6957968, 0.9467502, 1, 1, 1, 1, 1,
0.2467678, 0.8062822, -0.974799, 1, 1, 1, 1, 1,
0.2472007, 1.876413, 2.109198, 1, 1, 1, 1, 1,
0.2480694, -0.448549, 3.810894, 1, 1, 1, 1, 1,
0.2486673, 1.365453, -0.7249964, 1, 1, 1, 1, 1,
0.2550348, -1.920304, 2.115976, 1, 1, 1, 1, 1,
0.2555889, 0.09919718, 0.9846345, 1, 1, 1, 1, 1,
0.2571187, -3.235162, 3.641071, 1, 1, 1, 1, 1,
0.2599078, -1.28465, 2.243359, 1, 1, 1, 1, 1,
0.260008, -0.8657415, 4.322668, 1, 1, 1, 1, 1,
0.2631216, 0.4450227, 0.8153293, 1, 1, 1, 1, 1,
0.2659598, 1.048226, 0.8037457, 1, 1, 1, 1, 1,
0.2708114, 0.1152394, 1.824227, 1, 1, 1, 1, 1,
0.2719173, 0.164013, 1.636798, 1, 1, 1, 1, 1,
0.2723365, -0.8039041, 2.039998, 1, 1, 1, 1, 1,
0.2768795, 1.018669, 0.02404377, 0, 0, 1, 1, 1,
0.277676, -0.2042416, 2.348083, 1, 0, 0, 1, 1,
0.2817563, -0.7073915, 2.122693, 1, 0, 0, 1, 1,
0.2827784, 0.8651217, 2.014431, 1, 0, 0, 1, 1,
0.2897461, -1.503513, 3.511038, 1, 0, 0, 1, 1,
0.2903838, 0.324719, -0.006167467, 1, 0, 0, 1, 1,
0.2943352, 0.2247001, 0.2556053, 0, 0, 0, 1, 1,
0.2958255, 1.902169, 0.6296918, 0, 0, 0, 1, 1,
0.3028982, -0.6812229, 3.702263, 0, 0, 0, 1, 1,
0.3072812, 0.1195757, 2.655885, 0, 0, 0, 1, 1,
0.314844, -1.326002, 2.670071, 0, 0, 0, 1, 1,
0.3157534, -2.02188, 5.170475, 0, 0, 0, 1, 1,
0.3181216, 2.280367, 0.1860875, 0, 0, 0, 1, 1,
0.3184813, -0.4948981, 2.15937, 1, 1, 1, 1, 1,
0.3215338, -0.6572614, 1.436179, 1, 1, 1, 1, 1,
0.3230565, -1.97721, 5.197153, 1, 1, 1, 1, 1,
0.3259745, 0.4769439, -0.1810889, 1, 1, 1, 1, 1,
0.3268175, 0.5000626, 0.004407045, 1, 1, 1, 1, 1,
0.3277944, -0.3053874, 2.429457, 1, 1, 1, 1, 1,
0.3312739, -0.3431366, 3.041629, 1, 1, 1, 1, 1,
0.3330906, 1.113485, 0.05253265, 1, 1, 1, 1, 1,
0.3333271, 0.2685265, -0.1270725, 1, 1, 1, 1, 1,
0.335763, -0.2586577, 3.15068, 1, 1, 1, 1, 1,
0.3449441, 0.8814486, 0.2590053, 1, 1, 1, 1, 1,
0.3455003, -0.203801, 1.698466, 1, 1, 1, 1, 1,
0.3459464, 0.3230106, -0.02946017, 1, 1, 1, 1, 1,
0.3483318, 0.5301402, -1.337051, 1, 1, 1, 1, 1,
0.3541023, 0.2623377, -1.484851, 1, 1, 1, 1, 1,
0.3542548, -0.6799613, 3.923437, 0, 0, 1, 1, 1,
0.3566206, 1.993787, 0.6932118, 1, 0, 0, 1, 1,
0.3575894, 0.6329716, 2.045518, 1, 0, 0, 1, 1,
0.3585012, 1.550374, 1.034976, 1, 0, 0, 1, 1,
0.3673221, -2.216688, 2.664797, 1, 0, 0, 1, 1,
0.3695677, 0.3427993, 1.368656, 1, 0, 0, 1, 1,
0.378836, 0.1048401, 1.049662, 0, 0, 0, 1, 1,
0.3851319, 1.987252, -0.6165798, 0, 0, 0, 1, 1,
0.385331, 0.2020905, 1.230771, 0, 0, 0, 1, 1,
0.3855695, 0.8730555, -0.1732951, 0, 0, 0, 1, 1,
0.3857051, -2.375373, 4.03549, 0, 0, 0, 1, 1,
0.3888259, 0.2924344, -0.9111367, 0, 0, 0, 1, 1,
0.389311, -0.7654185, 4.193748, 0, 0, 0, 1, 1,
0.3900995, -1.20105, 1.246185, 1, 1, 1, 1, 1,
0.4010665, -0.394222, 1.451285, 1, 1, 1, 1, 1,
0.4016681, -0.3244038, 0.3293176, 1, 1, 1, 1, 1,
0.405746, 0.7110995, -0.4208833, 1, 1, 1, 1, 1,
0.407218, -0.2299623, 2.994956, 1, 1, 1, 1, 1,
0.4074214, -2.052187, 3.962998, 1, 1, 1, 1, 1,
0.4086902, 0.1103691, 0.02885831, 1, 1, 1, 1, 1,
0.4097327, -0.5371886, 1.744223, 1, 1, 1, 1, 1,
0.4100587, -0.03502448, 1.468445, 1, 1, 1, 1, 1,
0.4102837, 0.7101004, -0.1119274, 1, 1, 1, 1, 1,
0.4113694, -0.5790814, 3.554564, 1, 1, 1, 1, 1,
0.4167295, -0.2414116, 2.483363, 1, 1, 1, 1, 1,
0.4177842, -0.4956942, 3.237678, 1, 1, 1, 1, 1,
0.4236118, -1.115452, 2.222769, 1, 1, 1, 1, 1,
0.4239458, 0.5061567, 0.1867864, 1, 1, 1, 1, 1,
0.4241017, -0.6412142, 1.319642, 0, 0, 1, 1, 1,
0.4323719, -0.7730447, 2.035721, 1, 0, 0, 1, 1,
0.4328728, -0.2847005, 3.085999, 1, 0, 0, 1, 1,
0.4370074, -0.5811362, 2.601106, 1, 0, 0, 1, 1,
0.4376444, -1.244038, 1.554817, 1, 0, 0, 1, 1,
0.4392737, -0.5201653, 2.645106, 1, 0, 0, 1, 1,
0.442508, -0.2709402, 2.328074, 0, 0, 0, 1, 1,
0.444198, -1.198401, 2.696095, 0, 0, 0, 1, 1,
0.4534526, -0.3001647, 2.126939, 0, 0, 0, 1, 1,
0.4535817, -0.7967719, 4.214275, 0, 0, 0, 1, 1,
0.4538, -0.0932609, 3.075025, 0, 0, 0, 1, 1,
0.4557675, -1.278537, 1.715476, 0, 0, 0, 1, 1,
0.4632012, 0.1433287, 3.253937, 0, 0, 0, 1, 1,
0.4642969, 0.2235345, 0.4462205, 1, 1, 1, 1, 1,
0.4652619, 0.4212439, 0.9291834, 1, 1, 1, 1, 1,
0.4721947, -1.146895, 3.42075, 1, 1, 1, 1, 1,
0.4750992, -1.114132, 3.089226, 1, 1, 1, 1, 1,
0.475296, 1.330719, 1.233974, 1, 1, 1, 1, 1,
0.4793634, 1.150018, 0.9023634, 1, 1, 1, 1, 1,
0.4812605, -0.1115298, 0.1065333, 1, 1, 1, 1, 1,
0.4853225, 0.2330564, 1.491219, 1, 1, 1, 1, 1,
0.4858882, 2.205273, 0.2662727, 1, 1, 1, 1, 1,
0.4963242, -0.5725214, 3.048644, 1, 1, 1, 1, 1,
0.5007997, 0.62145, 0.3951267, 1, 1, 1, 1, 1,
0.5017065, 1.058843, 0.1947791, 1, 1, 1, 1, 1,
0.5025339, 0.4842374, 1.225485, 1, 1, 1, 1, 1,
0.5045776, -0.8580437, 2.894347, 1, 1, 1, 1, 1,
0.5046217, -1.455015, 3.020133, 1, 1, 1, 1, 1,
0.505445, 0.7261956, 0.4465949, 0, 0, 1, 1, 1,
0.5137582, 1.272962, -0.5777211, 1, 0, 0, 1, 1,
0.5236889, -0.02545005, 0.6932349, 1, 0, 0, 1, 1,
0.5251687, 1.090622, 1.482012, 1, 0, 0, 1, 1,
0.5354204, 0.1623321, 0.3175482, 1, 0, 0, 1, 1,
0.5419225, -0.7223668, 2.947603, 1, 0, 0, 1, 1,
0.5436106, 0.2548144, 2.155078, 0, 0, 0, 1, 1,
0.5449448, -1.592696, 2.131287, 0, 0, 0, 1, 1,
0.5501978, -0.7062204, 2.34092, 0, 0, 0, 1, 1,
0.5515487, -0.3883745, 2.880659, 0, 0, 0, 1, 1,
0.5622263, 1.649256, 0.3790888, 0, 0, 0, 1, 1,
0.563149, 0.08271807, 1.09033, 0, 0, 0, 1, 1,
0.5669651, -0.3894908, 2.585029, 0, 0, 0, 1, 1,
0.567425, 1.267306, -0.1687132, 1, 1, 1, 1, 1,
0.5745757, 0.5141439, 0.7306829, 1, 1, 1, 1, 1,
0.5859042, 1.165002, 0.09123721, 1, 1, 1, 1, 1,
0.5860135, -0.05834629, -0.2176192, 1, 1, 1, 1, 1,
0.5864613, -1.509505, 3.120078, 1, 1, 1, 1, 1,
0.5940942, 0.04527983, 1.666929, 1, 1, 1, 1, 1,
0.5965974, -1.4858, 2.551078, 1, 1, 1, 1, 1,
0.5990114, 1.498764, -0.5469904, 1, 1, 1, 1, 1,
0.6005175, -0.7937939, 3.694441, 1, 1, 1, 1, 1,
0.6059349, -0.7482494, 3.403701, 1, 1, 1, 1, 1,
0.6110834, 0.002235659, 1.248211, 1, 1, 1, 1, 1,
0.6163381, 0.5050173, 2.429714, 1, 1, 1, 1, 1,
0.6184607, -0.7769883, 2.724868, 1, 1, 1, 1, 1,
0.6216088, -0.6028237, 1.474967, 1, 1, 1, 1, 1,
0.6234951, 0.9763982, 0.1439987, 1, 1, 1, 1, 1,
0.6238304, -0.3252886, 0.2300036, 0, 0, 1, 1, 1,
0.6245104, 0.8883169, -0.2725581, 1, 0, 0, 1, 1,
0.6273315, -0.9420076, 2.959635, 1, 0, 0, 1, 1,
0.6287897, 0.3173718, 1.949398, 1, 0, 0, 1, 1,
0.6336971, -0.7940887, 1.195955, 1, 0, 0, 1, 1,
0.6386004, 2.156516, 0.1319596, 1, 0, 0, 1, 1,
0.6429541, -1.557604, 3.838567, 0, 0, 0, 1, 1,
0.6443217, -1.095171, 3.247799, 0, 0, 0, 1, 1,
0.648562, -0.1316478, 1.368753, 0, 0, 0, 1, 1,
0.6490688, -0.4423903, 1.957616, 0, 0, 0, 1, 1,
0.6540236, -0.6416943, 0.3336603, 0, 0, 0, 1, 1,
0.6624004, -0.08890952, 1.490199, 0, 0, 0, 1, 1,
0.666563, -0.2429494, 2.076349, 0, 0, 0, 1, 1,
0.6678941, -0.2703929, 1.843656, 1, 1, 1, 1, 1,
0.66858, 2.228021, 0.7266353, 1, 1, 1, 1, 1,
0.6702317, 0.3084915, 1.136146, 1, 1, 1, 1, 1,
0.6723858, 0.3407194, 1.272749, 1, 1, 1, 1, 1,
0.6814396, 0.5198681, 0.7501803, 1, 1, 1, 1, 1,
0.6898296, 0.8506959, 1.079588, 1, 1, 1, 1, 1,
0.6914462, 1.08149, 1.571273, 1, 1, 1, 1, 1,
0.694841, -0.9782603, 1.772089, 1, 1, 1, 1, 1,
0.6953061, 2.745038, -1.616323, 1, 1, 1, 1, 1,
0.6959848, 0.3570085, 2.213868, 1, 1, 1, 1, 1,
0.6989628, -0.1637437, 1.368752, 1, 1, 1, 1, 1,
0.6996624, 2.340109, 0.6886074, 1, 1, 1, 1, 1,
0.7026466, 1.859308, -0.07380541, 1, 1, 1, 1, 1,
0.7032181, 1.785264, -0.4976979, 1, 1, 1, 1, 1,
0.7114441, -1.940532, 2.896319, 1, 1, 1, 1, 1,
0.712357, -0.7752371, 1.252713, 0, 0, 1, 1, 1,
0.7126819, 0.2843893, 0.7462974, 1, 0, 0, 1, 1,
0.716697, 1.00835, 0.1480103, 1, 0, 0, 1, 1,
0.721196, -1.026459, 3.412556, 1, 0, 0, 1, 1,
0.7238051, -0.5505124, 1.199127, 1, 0, 0, 1, 1,
0.7241426, 2.027747, 0.6634781, 1, 0, 0, 1, 1,
0.7251483, 0.806639, 0.857712, 0, 0, 0, 1, 1,
0.7309289, -0.305856, 3.461622, 0, 0, 0, 1, 1,
0.731231, -0.260315, 2.40306, 0, 0, 0, 1, 1,
0.7465954, 0.3371401, 3.311664, 0, 0, 0, 1, 1,
0.7481058, -0.4951392, 2.161711, 0, 0, 0, 1, 1,
0.7485215, -0.03439988, 1.864802, 0, 0, 0, 1, 1,
0.7495934, 0.9333521, -1.388531, 0, 0, 0, 1, 1,
0.7543314, -0.4650682, 1.943239, 1, 1, 1, 1, 1,
0.7619125, 0.325951, 2.045637, 1, 1, 1, 1, 1,
0.7689708, -1.372506, 1.228295, 1, 1, 1, 1, 1,
0.7691095, -1.901883, 1.304837, 1, 1, 1, 1, 1,
0.7736477, 1.911687, 0.5442189, 1, 1, 1, 1, 1,
0.7821781, 0.5931775, -0.02518675, 1, 1, 1, 1, 1,
0.7847115, 0.6149206, 0.1991841, 1, 1, 1, 1, 1,
0.7904733, -1.04046, 3.817424, 1, 1, 1, 1, 1,
0.7913774, 0.4934148, 0.9575339, 1, 1, 1, 1, 1,
0.7924851, 0.2543657, 1.270199, 1, 1, 1, 1, 1,
0.792589, -1.355915, 1.820099, 1, 1, 1, 1, 1,
0.8003337, -0.774431, 2.812847, 1, 1, 1, 1, 1,
0.8027678, -1.77529, 2.960918, 1, 1, 1, 1, 1,
0.8049249, 1.477953, 0.8477832, 1, 1, 1, 1, 1,
0.8073238, 0.1900657, 1.356048, 1, 1, 1, 1, 1,
0.8079768, 0.332483, -0.4239321, 0, 0, 1, 1, 1,
0.8135014, 0.4958172, 1.209932, 1, 0, 0, 1, 1,
0.8238695, 0.2144686, -0.1945718, 1, 0, 0, 1, 1,
0.82757, 0.6840566, 1.592632, 1, 0, 0, 1, 1,
0.8277007, 1.011717, -0.06698462, 1, 0, 0, 1, 1,
0.8319696, -0.6229586, 0.3895597, 1, 0, 0, 1, 1,
0.843731, -1.206164, 2.959141, 0, 0, 0, 1, 1,
0.8470382, 0.1561613, 0.7229279, 0, 0, 0, 1, 1,
0.8641704, -0.6633533, 2.499238, 0, 0, 0, 1, 1,
0.8643477, -0.03161339, 2.187261, 0, 0, 0, 1, 1,
0.8670217, -0.006478881, 1.177559, 0, 0, 0, 1, 1,
0.8743079, 0.5637918, 1.657544, 0, 0, 0, 1, 1,
0.8844149, -0.401418, 3.14712, 0, 0, 0, 1, 1,
0.8854972, -0.4605411, -0.6778972, 1, 1, 1, 1, 1,
0.8857438, -1.058804, 2.561525, 1, 1, 1, 1, 1,
0.8964117, -0.3131322, 2.652637, 1, 1, 1, 1, 1,
0.899734, -0.2029827, 1.997015, 1, 1, 1, 1, 1,
0.9000216, 0.09586125, 1.579746, 1, 1, 1, 1, 1,
0.9004061, -0.7555053, 1.11672, 1, 1, 1, 1, 1,
0.9066318, 0.9544103, 2.351942, 1, 1, 1, 1, 1,
0.9097025, -0.5648356, 1.920954, 1, 1, 1, 1, 1,
0.917259, -0.2843254, 1.374559, 1, 1, 1, 1, 1,
0.9202942, -0.3119585, 1.758677, 1, 1, 1, 1, 1,
0.9217879, -1.18042, 1.581832, 1, 1, 1, 1, 1,
0.9225256, 0.8609844, 0.9498251, 1, 1, 1, 1, 1,
0.9296756, 0.5374607, 0.4606892, 1, 1, 1, 1, 1,
0.9312151, 2.10139, 1.099032, 1, 1, 1, 1, 1,
0.9331315, 0.3922887, 0.7845114, 1, 1, 1, 1, 1,
0.9337544, -0.2200083, 1.475266, 0, 0, 1, 1, 1,
0.9337675, -0.7381498, 0.7023604, 1, 0, 0, 1, 1,
0.9348212, -0.8922086, 1.063203, 1, 0, 0, 1, 1,
0.9463598, 0.3606568, 0.3504003, 1, 0, 0, 1, 1,
0.9484143, 1.952814, 0.2969013, 1, 0, 0, 1, 1,
0.950483, 1.190453, 0.9650645, 1, 0, 0, 1, 1,
0.9535989, -0.2993717, 2.118012, 0, 0, 0, 1, 1,
0.9559286, 0.2703193, 0.716422, 0, 0, 0, 1, 1,
0.9562864, -0.623053, 2.702747, 0, 0, 0, 1, 1,
0.9613866, 1.434561, 0.8513306, 0, 0, 0, 1, 1,
0.9636127, 0.2206692, 0.6278357, 0, 0, 0, 1, 1,
0.9655553, 0.8724827, 2.106722, 0, 0, 0, 1, 1,
0.9689137, -0.2576392, 2.118815, 0, 0, 0, 1, 1,
0.9695676, -0.1916799, 2.42503, 1, 1, 1, 1, 1,
0.9696043, 1.732954, 0.6014015, 1, 1, 1, 1, 1,
0.9729154, -0.6214121, 3.080467, 1, 1, 1, 1, 1,
0.9744588, 0.07154652, 2.084718, 1, 1, 1, 1, 1,
0.9871547, 0.7806565, -0.6469861, 1, 1, 1, 1, 1,
0.9923108, 1.203945, 0.03959372, 1, 1, 1, 1, 1,
0.9928123, 0.6251442, 0.309074, 1, 1, 1, 1, 1,
0.9944951, -1.094919, 3.383505, 1, 1, 1, 1, 1,
0.9986058, -0.8250501, 1.252273, 1, 1, 1, 1, 1,
1.006525, -1.265624, 2.710427, 1, 1, 1, 1, 1,
1.02318, -1.648157, 3.402853, 1, 1, 1, 1, 1,
1.024238, 0.8530693, 2.382734, 1, 1, 1, 1, 1,
1.0277, -0.1303987, 2.373319, 1, 1, 1, 1, 1,
1.037546, -0.290628, 1.590763, 1, 1, 1, 1, 1,
1.043908, 2.152509, -0.7254677, 1, 1, 1, 1, 1,
1.044198, -0.8061162, 3.301061, 0, 0, 1, 1, 1,
1.044967, 0.2270495, -0.2023548, 1, 0, 0, 1, 1,
1.045282, -0.9286926, 2.32207, 1, 0, 0, 1, 1,
1.046025, 0.3717785, 2.839132, 1, 0, 0, 1, 1,
1.047252, 0.9988455, 1.004818, 1, 0, 0, 1, 1,
1.04898, 0.9937211, -0.4860844, 1, 0, 0, 1, 1,
1.054766, 0.4103025, 1.485692, 0, 0, 0, 1, 1,
1.061251, -0.2144276, 2.015499, 0, 0, 0, 1, 1,
1.064084, 0.4309065, 1.126265, 0, 0, 0, 1, 1,
1.06617, -1.353469, 2.561507, 0, 0, 0, 1, 1,
1.066725, 0.1645686, 0.6512973, 0, 0, 0, 1, 1,
1.077039, -0.2411397, 0.831862, 0, 0, 0, 1, 1,
1.079339, -0.2252424, 2.172282, 0, 0, 0, 1, 1,
1.084313, 0.7554292, 0.9431815, 1, 1, 1, 1, 1,
1.089125, -0.3655826, 3.389672, 1, 1, 1, 1, 1,
1.095103, 0.1031839, 1.386871, 1, 1, 1, 1, 1,
1.097272, 1.309869, 1.876355, 1, 1, 1, 1, 1,
1.098912, -2.901219, 3.657127, 1, 1, 1, 1, 1,
1.099994, -0.3953602, 2.986224, 1, 1, 1, 1, 1,
1.10235, 0.8507719, 1.573294, 1, 1, 1, 1, 1,
1.106268, -0.9852518, 2.170811, 1, 1, 1, 1, 1,
1.109621, 0.06267877, 0.8872438, 1, 1, 1, 1, 1,
1.110898, -0.03026167, 1.431114, 1, 1, 1, 1, 1,
1.118999, 0.2730261, 1.647092, 1, 1, 1, 1, 1,
1.124653, -0.3443344, 2.453338, 1, 1, 1, 1, 1,
1.128684, -0.8891745, 1.491299, 1, 1, 1, 1, 1,
1.131583, 0.4256447, 1.122617, 1, 1, 1, 1, 1,
1.132207, 0.5492526, 0.9586568, 1, 1, 1, 1, 1,
1.138772, -1.406849, 2.476436, 0, 0, 1, 1, 1,
1.140238, 0.4893248, 0.6796625, 1, 0, 0, 1, 1,
1.146192, -0.7663028, 2.450651, 1, 0, 0, 1, 1,
1.14807, 0.4996789, 2.187682, 1, 0, 0, 1, 1,
1.151196, -1.441129, 2.613995, 1, 0, 0, 1, 1,
1.151229, 2.114781, -0.08396739, 1, 0, 0, 1, 1,
1.153231, 0.05599375, 1.943019, 0, 0, 0, 1, 1,
1.153255, 1.439444, 0.699417, 0, 0, 0, 1, 1,
1.155501, 0.6497979, 1.797075, 0, 0, 0, 1, 1,
1.165307, 1.727009, -0.1324566, 0, 0, 0, 1, 1,
1.173741, 0.1202476, 2.073435, 0, 0, 0, 1, 1,
1.175731, 0.8587312, 0.746303, 0, 0, 0, 1, 1,
1.176767, -1.317145, 3.458451, 0, 0, 0, 1, 1,
1.183435, -0.6958579, 1.62118, 1, 1, 1, 1, 1,
1.190635, 1.383649, 1.993743, 1, 1, 1, 1, 1,
1.192732, -1.093549, 5.286384, 1, 1, 1, 1, 1,
1.1949, -1.007521, 1.242781, 1, 1, 1, 1, 1,
1.196984, 0.1938976, -0.318536, 1, 1, 1, 1, 1,
1.20563, -0.5856939, 3.811864, 1, 1, 1, 1, 1,
1.209872, -1.250496, 3.217447, 1, 1, 1, 1, 1,
1.215944, -0.3372945, 2.351259, 1, 1, 1, 1, 1,
1.217832, 1.092398, -0.7886559, 1, 1, 1, 1, 1,
1.222304, 0.6078333, 1.588401, 1, 1, 1, 1, 1,
1.237644, 0.4578494, 0.5843947, 1, 1, 1, 1, 1,
1.245175, -0.3342911, 0.2839412, 1, 1, 1, 1, 1,
1.261759, -0.4011592, 1.527594, 1, 1, 1, 1, 1,
1.267393, -0.2195986, 0.2613211, 1, 1, 1, 1, 1,
1.271158, 1.665779, -0.7474356, 1, 1, 1, 1, 1,
1.280137, -0.5035294, 1.670763, 0, 0, 1, 1, 1,
1.28645, 1.112938, 0.1804812, 1, 0, 0, 1, 1,
1.286579, -0.2199717, 1.873499, 1, 0, 0, 1, 1,
1.289614, 0.1975916, 0.7269685, 1, 0, 0, 1, 1,
1.292228, -0.3123648, 1.864998, 1, 0, 0, 1, 1,
1.299262, 1.182645, 2.890719, 1, 0, 0, 1, 1,
1.30185, 0.7909315, 2.358798, 0, 0, 0, 1, 1,
1.303057, -0.02470508, 0.6566957, 0, 0, 0, 1, 1,
1.303161, -0.1597134, 3.796719, 0, 0, 0, 1, 1,
1.306472, 0.03240627, 1.647454, 0, 0, 0, 1, 1,
1.313465, -1.284488, 3.182809, 0, 0, 0, 1, 1,
1.334667, -0.8677478, 0.01205239, 0, 0, 0, 1, 1,
1.356671, 0.6978812, 1.05619, 0, 0, 0, 1, 1,
1.357311, 0.3047812, 1.952683, 1, 1, 1, 1, 1,
1.362019, 0.7909087, 0.2777762, 1, 1, 1, 1, 1,
1.374057, -0.3371303, 1.931259, 1, 1, 1, 1, 1,
1.381701, 0.9848711, 0.6546314, 1, 1, 1, 1, 1,
1.38578, 0.4172723, -1.35945, 1, 1, 1, 1, 1,
1.386666, 0.8526492, 2.967424, 1, 1, 1, 1, 1,
1.396673, 0.9116724, 0.9615286, 1, 1, 1, 1, 1,
1.398124, -1.682201, 3.080179, 1, 1, 1, 1, 1,
1.401052, -0.7645996, 2.245686, 1, 1, 1, 1, 1,
1.407049, -0.6995035, 1.994269, 1, 1, 1, 1, 1,
1.410284, -1.013426, 2.142111, 1, 1, 1, 1, 1,
1.419184, -2.16872, 2.513994, 1, 1, 1, 1, 1,
1.424736, 0.8518219, 0.901609, 1, 1, 1, 1, 1,
1.429763, 0.9390398, -0.3823242, 1, 1, 1, 1, 1,
1.430067, 0.1543345, 1.802582, 1, 1, 1, 1, 1,
1.438186, 0.4647036, 2.114648, 0, 0, 1, 1, 1,
1.442645, -0.3737946, 1.83057, 1, 0, 0, 1, 1,
1.447942, 0.7336067, -1.604011, 1, 0, 0, 1, 1,
1.458822, -1.322522, 2.925582, 1, 0, 0, 1, 1,
1.458846, -0.6122792, 1.331263, 1, 0, 0, 1, 1,
1.460253, -0.4687773, -0.2845113, 1, 0, 0, 1, 1,
1.475932, -1.220464, 0.6690251, 0, 0, 0, 1, 1,
1.478348, 0.8373808, 2.618878, 0, 0, 0, 1, 1,
1.478545, -0.6439424, 2.893792, 0, 0, 0, 1, 1,
1.493577, 0.7378572, 0.7227362, 0, 0, 0, 1, 1,
1.497882, -0.2493109, 2.888602, 0, 0, 0, 1, 1,
1.504385, -0.9971734, 1.255627, 0, 0, 0, 1, 1,
1.516231, 1.649552, 0.8492424, 0, 0, 0, 1, 1,
1.518235, -0.7020386, 2.341293, 1, 1, 1, 1, 1,
1.520885, -0.1675453, 2.046796, 1, 1, 1, 1, 1,
1.525055, -1.259463, 0.3841867, 1, 1, 1, 1, 1,
1.5252, -0.1647473, 0.7755712, 1, 1, 1, 1, 1,
1.532197, 1.79192, 2.282136, 1, 1, 1, 1, 1,
1.540515, 0.4301167, 0.7758527, 1, 1, 1, 1, 1,
1.560134, 0.492304, 1.153355, 1, 1, 1, 1, 1,
1.562548, -0.1684986, 1.749017, 1, 1, 1, 1, 1,
1.594417, 1.225747, -0.2927831, 1, 1, 1, 1, 1,
1.601459, 0.4210468, 3.184612, 1, 1, 1, 1, 1,
1.610476, -0.663043, 1.722033, 1, 1, 1, 1, 1,
1.610958, -0.1404234, 1.662902, 1, 1, 1, 1, 1,
1.615637, -0.2965048, 2.377967, 1, 1, 1, 1, 1,
1.630978, -0.1944572, -0.8997852, 1, 1, 1, 1, 1,
1.636999, -0.2533049, 2.993703, 1, 1, 1, 1, 1,
1.650302, -0.905175, 1.979482, 0, 0, 1, 1, 1,
1.652532, -0.0660169, 2.441041, 1, 0, 0, 1, 1,
1.656003, -0.3277755, 2.545185, 1, 0, 0, 1, 1,
1.657632, 0.09200449, 1.339794, 1, 0, 0, 1, 1,
1.658388, 0.8326564, 0.3086933, 1, 0, 0, 1, 1,
1.669821, -1.039024, 1.748993, 1, 0, 0, 1, 1,
1.67283, -0.4417208, 0.4772188, 0, 0, 0, 1, 1,
1.673261, 0.2639833, 1.830773, 0, 0, 0, 1, 1,
1.688437, 1.81061, 1.917544, 0, 0, 0, 1, 1,
1.694294, -1.918733, 1.607277, 0, 0, 0, 1, 1,
1.747641, 0.1146032, 1.787963, 0, 0, 0, 1, 1,
1.758002, 0.8469987, 1.307545, 0, 0, 0, 1, 1,
1.776075, -0.6676994, 2.889317, 0, 0, 0, 1, 1,
1.794524, 0.9641207, 0.3799778, 1, 1, 1, 1, 1,
1.79689, -1.855608, 0.9177803, 1, 1, 1, 1, 1,
1.801891, -0.5934128, 0.05225846, 1, 1, 1, 1, 1,
1.812183, -0.8799275, 1.37257, 1, 1, 1, 1, 1,
1.831625, 1.183071, 1.059936, 1, 1, 1, 1, 1,
1.839194, -0.04231875, 3.516505, 1, 1, 1, 1, 1,
1.8658, -1.027464, 3.307926, 1, 1, 1, 1, 1,
1.867001, -0.003176323, 0.4852458, 1, 1, 1, 1, 1,
1.877359, 0.9709711, 0.4682206, 1, 1, 1, 1, 1,
1.883268, -2.04906, 2.631737, 1, 1, 1, 1, 1,
1.903992, 0.2557887, -0.1151355, 1, 1, 1, 1, 1,
1.907833, 0.2872162, 2.574507, 1, 1, 1, 1, 1,
1.93182, 0.7624461, 1.487453, 1, 1, 1, 1, 1,
1.934924, -0.5925187, 2.002138, 1, 1, 1, 1, 1,
1.951596, -0.8417884, 0.6349231, 1, 1, 1, 1, 1,
1.962431, 1.520958, 2.844754, 0, 0, 1, 1, 1,
1.971499, 1.324958, 0.03620671, 1, 0, 0, 1, 1,
1.977649, 0.3181586, 1.473533, 1, 0, 0, 1, 1,
2.006679, 0.3213356, 0.9236285, 1, 0, 0, 1, 1,
2.018689, -0.1307923, 2.580019, 1, 0, 0, 1, 1,
2.044156, -0.6848731, 1.640211, 1, 0, 0, 1, 1,
2.169415, 0.899131, 2.030187, 0, 0, 0, 1, 1,
2.213102, 0.07995559, 1.955428, 0, 0, 0, 1, 1,
2.230288, 0.2008695, 1.891978, 0, 0, 0, 1, 1,
2.230301, -0.4170721, 1.704471, 0, 0, 0, 1, 1,
2.249968, -1.803115, 0.9947428, 0, 0, 0, 1, 1,
2.34605, 1.302715, 3.237072, 0, 0, 0, 1, 1,
2.365935, -0.2253592, 3.011191, 0, 0, 0, 1, 1,
2.480452, 0.7494284, 0.1222629, 1, 1, 1, 1, 1,
2.521784, -1.097551, 2.189121, 1, 1, 1, 1, 1,
2.54167, -1.173001, 1.095284, 1, 1, 1, 1, 1,
2.545466, 0.2542505, 2.000932, 1, 1, 1, 1, 1,
2.551867, 0.07392716, 1.02805, 1, 1, 1, 1, 1,
2.625065, -0.6927974, 2.648525, 1, 1, 1, 1, 1,
2.841788, -0.7144281, 1.103545, 1, 1, 1, 1, 1
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
var radius = 9.661901;
var distance = 33.93702;
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
mvMatrix.translate( 0.20075, 0.4246464, -0.02235198 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93702);
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
