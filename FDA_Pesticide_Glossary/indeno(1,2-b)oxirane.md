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
-3.68072, -1.377681, -0.5211995, 1, 0, 0, 1,
-2.857224, 0.03997416, -0.7815884, 1, 0.007843138, 0, 1,
-2.747164, -0.2057208, -3.21993, 1, 0.01176471, 0, 1,
-2.737245, 1.098, -2.3138, 1, 0.01960784, 0, 1,
-2.559218, -0.08621189, -0.9664828, 1, 0.02352941, 0, 1,
-2.506195, -0.01309414, -1.135507, 1, 0.03137255, 0, 1,
-2.391862, -0.09099329, -2.758407, 1, 0.03529412, 0, 1,
-2.303442, 1.801044, 1.141945, 1, 0.04313726, 0, 1,
-2.298477, -0.2447058, -1.009311, 1, 0.04705882, 0, 1,
-2.260125, -0.9087802, -3.73363, 1, 0.05490196, 0, 1,
-2.25406, -1.059895, -3.211714, 1, 0.05882353, 0, 1,
-2.217407, -1.054911, -1.394614, 1, 0.06666667, 0, 1,
-2.216113, 0.3697607, -0.6855604, 1, 0.07058824, 0, 1,
-2.210711, 2.554421, -0.7496242, 1, 0.07843138, 0, 1,
-2.206048, 1.160727, -0.4349127, 1, 0.08235294, 0, 1,
-2.201144, -0.9043447, -1.149608, 1, 0.09019608, 0, 1,
-2.160509, 0.5372995, -2.305315, 1, 0.09411765, 0, 1,
-2.156818, -3.50448, -5.080818, 1, 0.1019608, 0, 1,
-2.126893, -1.094882, -0.8150556, 1, 0.1098039, 0, 1,
-2.012769, -1.395026, -1.759606, 1, 0.1137255, 0, 1,
-2.011436, -0.04930573, -2.972132, 1, 0.1215686, 0, 1,
-1.965403, 1.785176, -0.1431665, 1, 0.1254902, 0, 1,
-1.961816, 0.6804317, -3.184472, 1, 0.1333333, 0, 1,
-1.955135, -1.134559, -3.891855, 1, 0.1372549, 0, 1,
-1.951084, 0.5592489, -1.803172, 1, 0.145098, 0, 1,
-1.939363, 0.214099, -1.794671, 1, 0.1490196, 0, 1,
-1.860942, 0.3669893, -1.174815, 1, 0.1568628, 0, 1,
-1.854098, -0.730318, -1.651097, 1, 0.1607843, 0, 1,
-1.84108, 0.8976701, 0.71344, 1, 0.1686275, 0, 1,
-1.828038, -1.234042, -2.478611, 1, 0.172549, 0, 1,
-1.813944, -0.6726684, -0.1120571, 1, 0.1803922, 0, 1,
-1.799105, -0.05058865, -2.609593, 1, 0.1843137, 0, 1,
-1.794921, 0.1624906, -3.26022, 1, 0.1921569, 0, 1,
-1.752976, 1.786022, 0.1164765, 1, 0.1960784, 0, 1,
-1.749275, 0.5283368, -1.481113, 1, 0.2039216, 0, 1,
-1.748032, 1.319247, -1.237862, 1, 0.2117647, 0, 1,
-1.720928, -0.5471345, -1.312646, 1, 0.2156863, 0, 1,
-1.689013, -0.09914962, -2.417447, 1, 0.2235294, 0, 1,
-1.667495, -1.129987, -2.67499, 1, 0.227451, 0, 1,
-1.661042, -0.5182977, -2.292755, 1, 0.2352941, 0, 1,
-1.65033, 0.6350009, -0.3849271, 1, 0.2392157, 0, 1,
-1.640917, -0.8291814, -1.340308, 1, 0.2470588, 0, 1,
-1.638878, -0.083229, -3.02789, 1, 0.2509804, 0, 1,
-1.632846, -1.279906, -2.48408, 1, 0.2588235, 0, 1,
-1.631206, 1.905454, -0.4607682, 1, 0.2627451, 0, 1,
-1.598384, -0.07197102, -1.432643, 1, 0.2705882, 0, 1,
-1.587406, 0.8145196, -1.803973, 1, 0.2745098, 0, 1,
-1.586441, -0.01224347, -1.098227, 1, 0.282353, 0, 1,
-1.551054, -0.6113412, -1.973905, 1, 0.2862745, 0, 1,
-1.541168, -0.7527431, -2.383104, 1, 0.2941177, 0, 1,
-1.537099, -1.464926, -1.338075, 1, 0.3019608, 0, 1,
-1.516356, 1.771151, 0.596698, 1, 0.3058824, 0, 1,
-1.502519, -0.2520128, -1.621887, 1, 0.3137255, 0, 1,
-1.493734, -0.3669401, -0.2236151, 1, 0.3176471, 0, 1,
-1.48343, -0.1669906, -0.6097537, 1, 0.3254902, 0, 1,
-1.477661, -0.01652632, -1.856301, 1, 0.3294118, 0, 1,
-1.467082, 0.8024382, -2.8497, 1, 0.3372549, 0, 1,
-1.464817, 1.203204, -2.058059, 1, 0.3411765, 0, 1,
-1.457744, 0.5240773, -2.774798, 1, 0.3490196, 0, 1,
-1.450402, 1.254723, -0.3535244, 1, 0.3529412, 0, 1,
-1.445424, 0.1671775, -1.541126, 1, 0.3607843, 0, 1,
-1.440789, -1.416815, -1.68364, 1, 0.3647059, 0, 1,
-1.428864, 0.4960392, -0.255373, 1, 0.372549, 0, 1,
-1.423165, 0.4020583, -2.527878, 1, 0.3764706, 0, 1,
-1.418739, -0.7165937, -1.469026, 1, 0.3843137, 0, 1,
-1.418611, -0.35814, -1.461026, 1, 0.3882353, 0, 1,
-1.406849, -0.1076717, -1.22614, 1, 0.3960784, 0, 1,
-1.402079, -0.7590634, -2.311996, 1, 0.4039216, 0, 1,
-1.400509, -0.7110167, -3.226448, 1, 0.4078431, 0, 1,
-1.397283, 0.5010148, -0.7153437, 1, 0.4156863, 0, 1,
-1.396158, -0.3307616, -3.255886, 1, 0.4196078, 0, 1,
-1.390845, -1.405314, -1.918533, 1, 0.427451, 0, 1,
-1.389124, 0.8243935, -3.058044, 1, 0.4313726, 0, 1,
-1.387912, -1.081417, -1.200695, 1, 0.4392157, 0, 1,
-1.368711, 1.050953, -1.679179, 1, 0.4431373, 0, 1,
-1.367968, 0.765026, -2.909167, 1, 0.4509804, 0, 1,
-1.366751, -0.4950094, -2.037343, 1, 0.454902, 0, 1,
-1.364668, 0.8697591, -0.1318377, 1, 0.4627451, 0, 1,
-1.363362, 1.066424, -1.322523, 1, 0.4666667, 0, 1,
-1.356152, -0.07076045, -3.311732, 1, 0.4745098, 0, 1,
-1.35269, 1.271765, -0.8550996, 1, 0.4784314, 0, 1,
-1.346841, 0.3995228, -2.363231, 1, 0.4862745, 0, 1,
-1.33961, 0.6996536, -0.6708481, 1, 0.4901961, 0, 1,
-1.335626, 0.7053416, 0.01316387, 1, 0.4980392, 0, 1,
-1.333037, 0.2150721, -2.516805, 1, 0.5058824, 0, 1,
-1.325454, 0.3610336, -0.9481251, 1, 0.509804, 0, 1,
-1.314908, 0.2390273, -1.244595, 1, 0.5176471, 0, 1,
-1.312408, -1.032382, -0.9418692, 1, 0.5215687, 0, 1,
-1.311956, 0.664363, -0.5146481, 1, 0.5294118, 0, 1,
-1.294443, -2.124798, -2.832782, 1, 0.5333334, 0, 1,
-1.290872, -1.202216, -2.701982, 1, 0.5411765, 0, 1,
-1.284205, -0.009721424, -0.5381425, 1, 0.5450981, 0, 1,
-1.281181, -1.384336, -3.078769, 1, 0.5529412, 0, 1,
-1.279301, 1.779976, -0.6096185, 1, 0.5568628, 0, 1,
-1.273781, -1.521007, -1.448256, 1, 0.5647059, 0, 1,
-1.262619, 0.2749409, -0.6626264, 1, 0.5686275, 0, 1,
-1.261651, 0.9014109, 0.4250866, 1, 0.5764706, 0, 1,
-1.260436, -0.4657408, -2.612938, 1, 0.5803922, 0, 1,
-1.259795, 0.06349258, -1.013926, 1, 0.5882353, 0, 1,
-1.25923, 0.9372792, -0.6213615, 1, 0.5921569, 0, 1,
-1.257886, -0.7202399, -0.9297135, 1, 0.6, 0, 1,
-1.254536, -0.01094043, 0.8451809, 1, 0.6078432, 0, 1,
-1.252336, -1.688128, -4.797024, 1, 0.6117647, 0, 1,
-1.251227, -0.4497303, -2.586791, 1, 0.6196079, 0, 1,
-1.247038, 0.8029913, -0.009900394, 1, 0.6235294, 0, 1,
-1.245793, -0.1065395, -0.4539356, 1, 0.6313726, 0, 1,
-1.240005, -1.386284, -2.547082, 1, 0.6352941, 0, 1,
-1.236361, 1.537668, -0.1726763, 1, 0.6431373, 0, 1,
-1.228504, -0.4962656, -1.799269, 1, 0.6470588, 0, 1,
-1.227094, 2.03997, -0.07623453, 1, 0.654902, 0, 1,
-1.221273, 0.5738612, 1.015463, 1, 0.6588235, 0, 1,
-1.220296, -0.2132249, -2.415325, 1, 0.6666667, 0, 1,
-1.218132, -0.1049527, -1.466557, 1, 0.6705883, 0, 1,
-1.213214, 0.2125202, -1.606454, 1, 0.6784314, 0, 1,
-1.203794, -0.3780693, -2.34691, 1, 0.682353, 0, 1,
-1.196826, 0.1866485, -1.128825, 1, 0.6901961, 0, 1,
-1.19602, 0.6165463, -1.512417, 1, 0.6941177, 0, 1,
-1.195639, 0.9311009, -0.1577224, 1, 0.7019608, 0, 1,
-1.189265, -0.8165641, -3.121115, 1, 0.7098039, 0, 1,
-1.180171, 1.432904, -0.08644401, 1, 0.7137255, 0, 1,
-1.180055, -0.28539, -2.597556, 1, 0.7215686, 0, 1,
-1.166837, -0.39953, -1.775275, 1, 0.7254902, 0, 1,
-1.162064, 0.7926282, -0.2488412, 1, 0.7333333, 0, 1,
-1.153957, 1.98786, -1.687307, 1, 0.7372549, 0, 1,
-1.147944, 0.2969508, -1.93004, 1, 0.7450981, 0, 1,
-1.141021, 0.8572727, -1.542834, 1, 0.7490196, 0, 1,
-1.139692, -1.114613, -2.96547, 1, 0.7568628, 0, 1,
-1.123937, 0.4424966, -0.8968048, 1, 0.7607843, 0, 1,
-1.118772, -0.01831656, -0.7130182, 1, 0.7686275, 0, 1,
-1.11648, -0.5224518, -2.578047, 1, 0.772549, 0, 1,
-1.116015, -0.762519, -1.037938, 1, 0.7803922, 0, 1,
-1.11387, -0.7667506, -2.663197, 1, 0.7843137, 0, 1,
-1.111583, 0.01795241, -2.223762, 1, 0.7921569, 0, 1,
-1.11104, -1.046921, -2.622413, 1, 0.7960784, 0, 1,
-1.110003, -1.072805, -3.789558, 1, 0.8039216, 0, 1,
-1.108449, -1.079157, -2.054035, 1, 0.8117647, 0, 1,
-1.104588, -0.2550528, -2.243007, 1, 0.8156863, 0, 1,
-1.101671, 0.8761378, -1.588289, 1, 0.8235294, 0, 1,
-1.09955, 1.24606, -0.4181507, 1, 0.827451, 0, 1,
-1.087096, 1.097607, -0.2261897, 1, 0.8352941, 0, 1,
-1.086297, -0.7304131, -0.8054324, 1, 0.8392157, 0, 1,
-1.086058, -0.1592597, -2.582353, 1, 0.8470588, 0, 1,
-1.084606, 0.3338038, -1.463756, 1, 0.8509804, 0, 1,
-1.084206, 0.004570458, -2.041498, 1, 0.8588235, 0, 1,
-1.082241, 0.4719019, -1.109559, 1, 0.8627451, 0, 1,
-1.081213, 1.767801, -0.2626515, 1, 0.8705882, 0, 1,
-1.080662, 0.04635574, -3.953119, 1, 0.8745098, 0, 1,
-1.077529, 0.1014465, -1.547895, 1, 0.8823529, 0, 1,
-1.073689, -0.2431169, -1.009573, 1, 0.8862745, 0, 1,
-1.069909, -0.4279026, -0.4389567, 1, 0.8941177, 0, 1,
-1.056667, -0.2466504, -2.078983, 1, 0.8980392, 0, 1,
-1.054888, -1.104, -0.9584157, 1, 0.9058824, 0, 1,
-1.049867, -0.3783225, -0.3562323, 1, 0.9137255, 0, 1,
-1.041897, 0.7133338, -0.7864856, 1, 0.9176471, 0, 1,
-1.039342, 0.7568492, 0.6162565, 1, 0.9254902, 0, 1,
-1.035247, -3.470131, -0.7458909, 1, 0.9294118, 0, 1,
-1.03265, 0.5640738, -1.374871, 1, 0.9372549, 0, 1,
-1.031321, -0.4685555, -3.443674, 1, 0.9411765, 0, 1,
-1.031078, -0.7030149, -2.09611, 1, 0.9490196, 0, 1,
-1.026432, 1.248691, -0.7099676, 1, 0.9529412, 0, 1,
-1.025281, -0.4602539, -3.358979, 1, 0.9607843, 0, 1,
-1.019816, 0.355525, -1.537077, 1, 0.9647059, 0, 1,
-1.018893, 1.454618, 0.1924617, 1, 0.972549, 0, 1,
-1.01852, -1.436195, -3.3655, 1, 0.9764706, 0, 1,
-1.017364, -0.430227, -1.091709, 1, 0.9843137, 0, 1,
-1.012657, -0.07818263, -1.621069, 1, 0.9882353, 0, 1,
-1.005823, -1.208446, -4.614199, 1, 0.9960784, 0, 1,
-1.004318, 0.2439806, -1.393449, 0.9960784, 1, 0, 1,
-1.002145, 0.5171357, -2.109437, 0.9921569, 1, 0, 1,
-0.9989325, 0.7154689, -2.075097, 0.9843137, 1, 0, 1,
-0.9969951, -1.598306, -2.47594, 0.9803922, 1, 0, 1,
-0.9956377, -0.5119655, -2.057671, 0.972549, 1, 0, 1,
-0.9934562, 0.01639802, -0.2069262, 0.9686275, 1, 0, 1,
-0.9917747, 0.6830059, 0.1853342, 0.9607843, 1, 0, 1,
-0.9889478, 0.9080102, -0.7667801, 0.9568627, 1, 0, 1,
-0.9849116, -0.01826784, -1.555374, 0.9490196, 1, 0, 1,
-0.9766934, 1.081091, 0.9699407, 0.945098, 1, 0, 1,
-0.9756489, 1.185584, 1.596258, 0.9372549, 1, 0, 1,
-0.973703, 0.1086764, -3.338203, 0.9333333, 1, 0, 1,
-0.9712017, 0.5716237, -1.598353, 0.9254902, 1, 0, 1,
-0.9692619, -1.644834, -1.54074, 0.9215686, 1, 0, 1,
-0.9636466, 0.01293031, -0.7787018, 0.9137255, 1, 0, 1,
-0.9562094, 2.242753, -1.767021, 0.9098039, 1, 0, 1,
-0.9514145, -1.449358, -2.701981, 0.9019608, 1, 0, 1,
-0.9470186, -0.1097658, -1.048017, 0.8941177, 1, 0, 1,
-0.9461427, 0.2613507, -1.185139, 0.8901961, 1, 0, 1,
-0.9424912, 0.4973672, -1.738301, 0.8823529, 1, 0, 1,
-0.9376095, 0.5779175, -0.09618452, 0.8784314, 1, 0, 1,
-0.9331599, 0.1891977, -3.032465, 0.8705882, 1, 0, 1,
-0.9317711, 0.9309934, -2.297113, 0.8666667, 1, 0, 1,
-0.9289873, -0.8831338, -3.991732, 0.8588235, 1, 0, 1,
-0.9272054, -0.0149027, -1.880364, 0.854902, 1, 0, 1,
-0.9184337, -0.1676973, -2.373546, 0.8470588, 1, 0, 1,
-0.9163135, 0.1526743, -1.760724, 0.8431373, 1, 0, 1,
-0.9158511, 0.2413925, -0.4904622, 0.8352941, 1, 0, 1,
-0.9123169, 1.127919, -0.773867, 0.8313726, 1, 0, 1,
-0.9050788, -0.4790574, -1.323385, 0.8235294, 1, 0, 1,
-0.9047329, 0.0426108, -3.684478, 0.8196079, 1, 0, 1,
-0.9046778, -0.1027757, 0.375112, 0.8117647, 1, 0, 1,
-0.9046456, -0.3718546, -1.098572, 0.8078431, 1, 0, 1,
-0.901949, 0.120098, -2.876094, 0.8, 1, 0, 1,
-0.9003534, 1.805471, -1.674111, 0.7921569, 1, 0, 1,
-0.8902373, -0.0632826, -1.085066, 0.7882353, 1, 0, 1,
-0.8849668, -1.574704, -2.54447, 0.7803922, 1, 0, 1,
-0.8815098, 0.9299373, 0.6827934, 0.7764706, 1, 0, 1,
-0.8787344, 0.9010171, 1.566455, 0.7686275, 1, 0, 1,
-0.8740091, -0.1661762, -1.273362, 0.7647059, 1, 0, 1,
-0.865526, 1.691854, -1.685571, 0.7568628, 1, 0, 1,
-0.861288, 0.7583581, -2.002568, 0.7529412, 1, 0, 1,
-0.8601615, 1.79131, -0.09959999, 0.7450981, 1, 0, 1,
-0.8573778, 0.9923477, 1.212265, 0.7411765, 1, 0, 1,
-0.8568288, -1.223681, -2.615891, 0.7333333, 1, 0, 1,
-0.8465692, 0.4997761, -1.299259, 0.7294118, 1, 0, 1,
-0.8417187, 0.01140458, -1.192587, 0.7215686, 1, 0, 1,
-0.8408572, 1.182068, -2.192212, 0.7176471, 1, 0, 1,
-0.8405816, 0.09705236, -2.670634, 0.7098039, 1, 0, 1,
-0.8405198, 0.4876081, -0.4378017, 0.7058824, 1, 0, 1,
-0.8359749, 0.3928033, 1.409148, 0.6980392, 1, 0, 1,
-0.8320751, 0.6539576, -0.3528767, 0.6901961, 1, 0, 1,
-0.8299981, 0.2110174, -1.027805, 0.6862745, 1, 0, 1,
-0.8268708, 1.155226, -0.1659104, 0.6784314, 1, 0, 1,
-0.8197317, 0.6841299, -1.604658, 0.6745098, 1, 0, 1,
-0.8154206, -1.327083, -1.755193, 0.6666667, 1, 0, 1,
-0.8076519, -0.8193401, -1.540925, 0.6627451, 1, 0, 1,
-0.8038192, 1.526422, -1.421333, 0.654902, 1, 0, 1,
-0.8027649, 0.1662935, -1.553383, 0.6509804, 1, 0, 1,
-0.7965556, 1.738206, -0.1061428, 0.6431373, 1, 0, 1,
-0.7931509, -0.6179993, -2.529074, 0.6392157, 1, 0, 1,
-0.7930713, 0.6759029, -0.2322971, 0.6313726, 1, 0, 1,
-0.787638, -0.760455, -2.98823, 0.627451, 1, 0, 1,
-0.787148, 0.2797379, -2.112968, 0.6196079, 1, 0, 1,
-0.7807166, 0.5561935, 0.1515994, 0.6156863, 1, 0, 1,
-0.7791558, -0.3702532, -1.965359, 0.6078432, 1, 0, 1,
-0.7783751, 0.6531168, -2.115488, 0.6039216, 1, 0, 1,
-0.7776457, 1.259516, -1.106851, 0.5960785, 1, 0, 1,
-0.7775897, 0.8352778, -1.135978, 0.5882353, 1, 0, 1,
-0.7747003, -0.8177401, -2.05752, 0.5843138, 1, 0, 1,
-0.7746778, 0.5684504, -1.216941, 0.5764706, 1, 0, 1,
-0.7741854, -0.5082455, -3.509965, 0.572549, 1, 0, 1,
-0.7700236, 1.023499, -2.711157, 0.5647059, 1, 0, 1,
-0.7690916, 1.931582, -0.7871032, 0.5607843, 1, 0, 1,
-0.7686359, -1.472184, -2.460032, 0.5529412, 1, 0, 1,
-0.7650129, -0.8177199, -1.999918, 0.5490196, 1, 0, 1,
-0.7580615, 0.1990329, -0.9840171, 0.5411765, 1, 0, 1,
-0.7568795, 0.03593878, 0.2674809, 0.5372549, 1, 0, 1,
-0.7552445, 1.127481, -0.5909108, 0.5294118, 1, 0, 1,
-0.754543, -1.580477, -3.37354, 0.5254902, 1, 0, 1,
-0.7530472, 0.4552162, -1.206098, 0.5176471, 1, 0, 1,
-0.7503256, 2.196578, -1.774927, 0.5137255, 1, 0, 1,
-0.7474766, 0.6743808, -1.490657, 0.5058824, 1, 0, 1,
-0.7407353, -0.1503143, -0.9579185, 0.5019608, 1, 0, 1,
-0.7317518, -2.590507, -2.813936, 0.4941176, 1, 0, 1,
-0.730244, 0.5661079, -0.4025276, 0.4862745, 1, 0, 1,
-0.7288012, -0.1725883, -1.997761, 0.4823529, 1, 0, 1,
-0.7224464, 0.5098248, -1.644133, 0.4745098, 1, 0, 1,
-0.7183512, 1.105394, -0.6973083, 0.4705882, 1, 0, 1,
-0.7155502, 0.5030054, -0.8008925, 0.4627451, 1, 0, 1,
-0.7137179, -0.1995735, -1.560436, 0.4588235, 1, 0, 1,
-0.7049723, -0.00610632, -3.438996, 0.4509804, 1, 0, 1,
-0.7001672, -1.591427, -1.580078, 0.4470588, 1, 0, 1,
-0.6977871, -0.1498156, -1.880978, 0.4392157, 1, 0, 1,
-0.6920156, -0.5877482, -0.9371752, 0.4352941, 1, 0, 1,
-0.6906598, -0.3369669, -3.21227, 0.427451, 1, 0, 1,
-0.6874, -0.7984535, -3.36823, 0.4235294, 1, 0, 1,
-0.6837, -0.04508217, -3.539956, 0.4156863, 1, 0, 1,
-0.6769035, -1.993985, -1.76392, 0.4117647, 1, 0, 1,
-0.6744069, -0.8748559, -3.933711, 0.4039216, 1, 0, 1,
-0.6717255, -0.5286978, -3.32191, 0.3960784, 1, 0, 1,
-0.6682675, 0.4135177, 0.311662, 0.3921569, 1, 0, 1,
-0.6680933, 0.2908644, 0.5895112, 0.3843137, 1, 0, 1,
-0.6656567, 1.232845, -0.7212053, 0.3803922, 1, 0, 1,
-0.6636184, 0.4506164, -0.7383087, 0.372549, 1, 0, 1,
-0.6630611, 1.545829, 0.5140125, 0.3686275, 1, 0, 1,
-0.6612765, -0.7244611, -2.561033, 0.3607843, 1, 0, 1,
-0.6604921, -0.8316796, -2.334946, 0.3568628, 1, 0, 1,
-0.6597601, 0.2460064, -2.988568, 0.3490196, 1, 0, 1,
-0.658056, -0.2069619, -2.258167, 0.345098, 1, 0, 1,
-0.6565776, -0.5723915, -2.353903, 0.3372549, 1, 0, 1,
-0.6487526, -0.6329497, -2.569731, 0.3333333, 1, 0, 1,
-0.6483412, 0.3103954, -2.633809, 0.3254902, 1, 0, 1,
-0.6455097, 0.4298533, -0.5535442, 0.3215686, 1, 0, 1,
-0.6440325, 0.3553397, -1.658367, 0.3137255, 1, 0, 1,
-0.6394268, -1.035977, -2.188262, 0.3098039, 1, 0, 1,
-0.6260535, 1.266248, -0.4112418, 0.3019608, 1, 0, 1,
-0.6231204, -0.353959, -0.3638855, 0.2941177, 1, 0, 1,
-0.6224708, 0.1163775, -2.344269, 0.2901961, 1, 0, 1,
-0.612847, -0.2096492, -2.677824, 0.282353, 1, 0, 1,
-0.6122016, 0.3085837, -3.075588, 0.2784314, 1, 0, 1,
-0.6058792, 1.175881, -0.03483815, 0.2705882, 1, 0, 1,
-0.6005203, -0.4408325, -0.6763586, 0.2666667, 1, 0, 1,
-0.6000364, -0.04720604, -0.6331691, 0.2588235, 1, 0, 1,
-0.5984042, -0.5872871, 0.3408866, 0.254902, 1, 0, 1,
-0.5966669, 1.176451, -0.2367108, 0.2470588, 1, 0, 1,
-0.5834965, -0.2982979, -1.472649, 0.2431373, 1, 0, 1,
-0.5766134, 0.8361226, -0.566481, 0.2352941, 1, 0, 1,
-0.5697337, -0.2954343, -4.327392, 0.2313726, 1, 0, 1,
-0.5689926, -0.7792604, -1.414363, 0.2235294, 1, 0, 1,
-0.5673615, 1.104646, -1.726631, 0.2196078, 1, 0, 1,
-0.5666593, -0.7570597, -2.479307, 0.2117647, 1, 0, 1,
-0.5606021, 0.05252827, -1.285771, 0.2078431, 1, 0, 1,
-0.5593987, 1.563756, -0.1977658, 0.2, 1, 0, 1,
-0.5592377, 2.530306, 0.9021828, 0.1921569, 1, 0, 1,
-0.5583618, 1.048689, -2.046244, 0.1882353, 1, 0, 1,
-0.5580347, 1.159326, -0.5638075, 0.1803922, 1, 0, 1,
-0.5519406, 0.5486226, 0.6593857, 0.1764706, 1, 0, 1,
-0.5504623, -1.248461, -2.824127, 0.1686275, 1, 0, 1,
-0.5458601, 0.8780754, -0.8406466, 0.1647059, 1, 0, 1,
-0.5430596, 1.47394, 0.6436575, 0.1568628, 1, 0, 1,
-0.5365556, -0.173305, -3.418829, 0.1529412, 1, 0, 1,
-0.5354044, -0.5611621, -3.60373, 0.145098, 1, 0, 1,
-0.5330093, 0.01907576, -1.5833, 0.1411765, 1, 0, 1,
-0.531984, -0.6653252, -1.313234, 0.1333333, 1, 0, 1,
-0.5291592, 0.8095964, 0.6244555, 0.1294118, 1, 0, 1,
-0.5264245, 1.81493, -0.8977339, 0.1215686, 1, 0, 1,
-0.5218368, -2.469506, -2.662645, 0.1176471, 1, 0, 1,
-0.5216964, 0.7802407, -0.6693367, 0.1098039, 1, 0, 1,
-0.5191712, 0.1030774, -1.263707, 0.1058824, 1, 0, 1,
-0.5184404, 1.27227, -2.258419, 0.09803922, 1, 0, 1,
-0.5172057, -0.9800839, -3.481869, 0.09019608, 1, 0, 1,
-0.5159923, -0.6406078, -2.383581, 0.08627451, 1, 0, 1,
-0.5155169, 2.187052, 0.581999, 0.07843138, 1, 0, 1,
-0.5130961, 1.755081, 0.2882858, 0.07450981, 1, 0, 1,
-0.5129974, 0.06383204, -0.3144282, 0.06666667, 1, 0, 1,
-0.5118997, 0.5317461, -0.9004633, 0.0627451, 1, 0, 1,
-0.511067, -0.02431335, -2.09508, 0.05490196, 1, 0, 1,
-0.5110665, 1.043873, -1.913588, 0.05098039, 1, 0, 1,
-0.5038087, 1.387504, -0.2568544, 0.04313726, 1, 0, 1,
-0.5013824, 0.5718282, 0.342508, 0.03921569, 1, 0, 1,
-0.4992037, 0.7865681, -2.657874, 0.03137255, 1, 0, 1,
-0.4960901, 1.614943, -0.666264, 0.02745098, 1, 0, 1,
-0.4930434, -1.986644, -4.068151, 0.01960784, 1, 0, 1,
-0.4869466, 0.5111538, -0.4893214, 0.01568628, 1, 0, 1,
-0.4843021, -0.05927367, -2.54779, 0.007843138, 1, 0, 1,
-0.4823516, -0.1545969, -1.848436, 0.003921569, 1, 0, 1,
-0.4821365, 1.518932, 1.429628, 0, 1, 0.003921569, 1,
-0.4782861, -0.1471281, -2.882825, 0, 1, 0.01176471, 1,
-0.4772506, 0.5019417, -0.1936124, 0, 1, 0.01568628, 1,
-0.4747584, -0.9828898, -3.610193, 0, 1, 0.02352941, 1,
-0.4671016, 0.2677363, -0.5570859, 0, 1, 0.02745098, 1,
-0.4653476, -0.3730325, -2.736869, 0, 1, 0.03529412, 1,
-0.4568334, -0.2893475, -1.917013, 0, 1, 0.03921569, 1,
-0.4555395, -1.516953, -2.588665, 0, 1, 0.04705882, 1,
-0.4546845, -1.035227, -4.037252, 0, 1, 0.05098039, 1,
-0.449294, -0.8080938, -2.80809, 0, 1, 0.05882353, 1,
-0.4474797, 0.07471222, -1.385532, 0, 1, 0.0627451, 1,
-0.447128, -0.6308383, -2.2168, 0, 1, 0.07058824, 1,
-0.4434825, 0.06798651, -1.12968, 0, 1, 0.07450981, 1,
-0.4429918, -0.2920755, -2.825881, 0, 1, 0.08235294, 1,
-0.4413678, 2.19385, 0.1168198, 0, 1, 0.08627451, 1,
-0.4391869, -1.015694, -2.013544, 0, 1, 0.09411765, 1,
-0.4379348, -0.3508778, -3.20848, 0, 1, 0.1019608, 1,
-0.433686, 1.458508, -0.3372357, 0, 1, 0.1058824, 1,
-0.4329716, 1.755325, -0.6905712, 0, 1, 0.1137255, 1,
-0.4322117, -0.8408179, -3.39175, 0, 1, 0.1176471, 1,
-0.4320762, -1.552131, -1.956383, 0, 1, 0.1254902, 1,
-0.4285774, 0.9662706, 0.5524192, 0, 1, 0.1294118, 1,
-0.4251739, -0.1102247, -1.088938, 0, 1, 0.1372549, 1,
-0.4234158, 0.9143857, -0.08588793, 0, 1, 0.1411765, 1,
-0.4203314, -1.093183, -3.034937, 0, 1, 0.1490196, 1,
-0.4136657, -0.4998608, -2.210032, 0, 1, 0.1529412, 1,
-0.4121255, 0.6034617, -0.338112, 0, 1, 0.1607843, 1,
-0.4041945, -0.3661395, -2.867548, 0, 1, 0.1647059, 1,
-0.398126, -2.163274, -4.085675, 0, 1, 0.172549, 1,
-0.3927168, 0.1920583, -1.414289, 0, 1, 0.1764706, 1,
-0.3902835, -0.3901032, -1.350094, 0, 1, 0.1843137, 1,
-0.3898442, -0.1495335, -2.0818, 0, 1, 0.1882353, 1,
-0.3896285, 0.8895043, 0.2618526, 0, 1, 0.1960784, 1,
-0.3849725, -1.064417, -3.707213, 0, 1, 0.2039216, 1,
-0.3796576, -1.643827, -3.58537, 0, 1, 0.2078431, 1,
-0.3748295, 1.04938, -0.9440882, 0, 1, 0.2156863, 1,
-0.3744232, -0.1116564, -1.150689, 0, 1, 0.2196078, 1,
-0.3593663, 0.4588768, -0.03621933, 0, 1, 0.227451, 1,
-0.3582769, -0.5711117, -2.530834, 0, 1, 0.2313726, 1,
-0.3524276, -0.3056209, -2.774652, 0, 1, 0.2392157, 1,
-0.3523207, 0.4709625, -1.982937, 0, 1, 0.2431373, 1,
-0.3501028, -0.4835503, -3.252806, 0, 1, 0.2509804, 1,
-0.3445789, -0.02582519, -1.960701, 0, 1, 0.254902, 1,
-0.3436087, -1.331774, -2.071549, 0, 1, 0.2627451, 1,
-0.3425403, 0.5401554, -1.068038, 0, 1, 0.2666667, 1,
-0.3408, -0.4895004, -2.310881, 0, 1, 0.2745098, 1,
-0.3372716, -0.1045951, -1.431503, 0, 1, 0.2784314, 1,
-0.3339705, 0.09068973, -2.430969, 0, 1, 0.2862745, 1,
-0.3336709, -0.1723941, -1.888911, 0, 1, 0.2901961, 1,
-0.3276605, -2.402455, -4.168242, 0, 1, 0.2980392, 1,
-0.3266996, 2.245786, -0.6033907, 0, 1, 0.3058824, 1,
-0.3241533, -0.1820593, -3.201376, 0, 1, 0.3098039, 1,
-0.3219921, 0.9068147, -0.03199167, 0, 1, 0.3176471, 1,
-0.3169582, 0.8713177, -1.549684, 0, 1, 0.3215686, 1,
-0.313951, 0.8895142, 0.6766939, 0, 1, 0.3294118, 1,
-0.3125535, -0.3519063, -1.136085, 0, 1, 0.3333333, 1,
-0.3101782, 0.4141867, -1.97985, 0, 1, 0.3411765, 1,
-0.3093476, -1.940322, -2.510492, 0, 1, 0.345098, 1,
-0.3093092, 0.3642724, -0.02660072, 0, 1, 0.3529412, 1,
-0.3051618, -1.530817, -3.822657, 0, 1, 0.3568628, 1,
-0.3042976, -0.2601659, -1.930568, 0, 1, 0.3647059, 1,
-0.2955903, 2.063137, 1.830194, 0, 1, 0.3686275, 1,
-0.2948041, -0.7427977, -1.884248, 0, 1, 0.3764706, 1,
-0.2902579, 1.629884, -1.638004, 0, 1, 0.3803922, 1,
-0.288182, -0.1562211, 0.1497357, 0, 1, 0.3882353, 1,
-0.2857234, 0.2490324, -2.215103, 0, 1, 0.3921569, 1,
-0.2855706, -0.5928776, -1.414122, 0, 1, 0.4, 1,
-0.2855191, -1.3574, -3.591897, 0, 1, 0.4078431, 1,
-0.2847501, 1.41771, 0.4321798, 0, 1, 0.4117647, 1,
-0.284438, -0.4635864, -4.060694, 0, 1, 0.4196078, 1,
-0.2801548, 1.692999, -1.446831, 0, 1, 0.4235294, 1,
-0.2735159, 0.3503512, -1.246817, 0, 1, 0.4313726, 1,
-0.2714669, -0.1255957, -3.228484, 0, 1, 0.4352941, 1,
-0.2702636, -1.575304, -3.738814, 0, 1, 0.4431373, 1,
-0.2659662, -0.890105, -4.072659, 0, 1, 0.4470588, 1,
-0.2646047, 0.5653542, -0.6932583, 0, 1, 0.454902, 1,
-0.2638445, 0.4580616, -0.929643, 0, 1, 0.4588235, 1,
-0.2588301, 1.736436, -0.08158429, 0, 1, 0.4666667, 1,
-0.2584867, -0.9228733, -2.416978, 0, 1, 0.4705882, 1,
-0.2552831, 0.626654, -0.0854249, 0, 1, 0.4784314, 1,
-0.2526137, 1.214228, -0.5567745, 0, 1, 0.4823529, 1,
-0.2425484, 1.052954, -1.402511, 0, 1, 0.4901961, 1,
-0.2399197, -0.9682738, -3.897942, 0, 1, 0.4941176, 1,
-0.2362297, 0.1157115, -2.554133, 0, 1, 0.5019608, 1,
-0.2358222, 0.01474263, -0.6512148, 0, 1, 0.509804, 1,
-0.2343916, -0.6053618, -4.586182, 0, 1, 0.5137255, 1,
-0.2287224, -0.9625688, -2.024623, 0, 1, 0.5215687, 1,
-0.2277942, -1.549042, -4.951406, 0, 1, 0.5254902, 1,
-0.2244349, 0.4568522, -0.1217511, 0, 1, 0.5333334, 1,
-0.2213244, 0.1771091, -0.8914006, 0, 1, 0.5372549, 1,
-0.2212251, -0.1167775, -0.3245893, 0, 1, 0.5450981, 1,
-0.2210153, 0.9821911, 0.2219327, 0, 1, 0.5490196, 1,
-0.2193508, 1.122697, -0.04863758, 0, 1, 0.5568628, 1,
-0.2140038, -0.8777874, -3.071365, 0, 1, 0.5607843, 1,
-0.2136684, -0.0427133, -2.265056, 0, 1, 0.5686275, 1,
-0.21242, 0.1539309, -0.138303, 0, 1, 0.572549, 1,
-0.2080842, -2.081794, -5.415393, 0, 1, 0.5803922, 1,
-0.2063161, -0.9388371, -1.385353, 0, 1, 0.5843138, 1,
-0.1969825, -0.07807811, -3.001379, 0, 1, 0.5921569, 1,
-0.1926882, 0.9392986, -0.03907215, 0, 1, 0.5960785, 1,
-0.1892603, -0.6196337, -2.857962, 0, 1, 0.6039216, 1,
-0.1732053, 1.517152, -0.176866, 0, 1, 0.6117647, 1,
-0.1716756, -1.668207, -3.519309, 0, 1, 0.6156863, 1,
-0.1699349, 1.012973, -1.405172, 0, 1, 0.6235294, 1,
-0.1662391, -0.8664197, -3.024772, 0, 1, 0.627451, 1,
-0.1658753, 0.01775045, -2.779423, 0, 1, 0.6352941, 1,
-0.1652761, 1.062636, -0.687867, 0, 1, 0.6392157, 1,
-0.1604345, 0.928017, 0.2036908, 0, 1, 0.6470588, 1,
-0.1552264, 0.5330806, -0.16087, 0, 1, 0.6509804, 1,
-0.1551202, 1.263178, 0.6313292, 0, 1, 0.6588235, 1,
-0.1515962, -0.3191016, -4.382107, 0, 1, 0.6627451, 1,
-0.1496306, 0.4645885, -0.2861771, 0, 1, 0.6705883, 1,
-0.1443703, 0.3553488, 1.104673, 0, 1, 0.6745098, 1,
-0.1441667, -1.10556, -2.71232, 0, 1, 0.682353, 1,
-0.1414419, 0.1347422, -0.9041201, 0, 1, 0.6862745, 1,
-0.1396285, -1.005975, -2.88462, 0, 1, 0.6941177, 1,
-0.138887, -0.8530895, -1.660809, 0, 1, 0.7019608, 1,
-0.1304752, 2.298558, 2.014064, 0, 1, 0.7058824, 1,
-0.1231501, -1.632482, -2.514372, 0, 1, 0.7137255, 1,
-0.1204323, -0.8002427, -2.203265, 0, 1, 0.7176471, 1,
-0.1143705, 1.522601, -0.2495714, 0, 1, 0.7254902, 1,
-0.1061033, -1.169847, -4.153119, 0, 1, 0.7294118, 1,
-0.1025053, -1.344728, -4.106463, 0, 1, 0.7372549, 1,
-0.09984285, -1.483206, -3.217009, 0, 1, 0.7411765, 1,
-0.08604257, 1.385319, 0.2317953, 0, 1, 0.7490196, 1,
-0.0821562, -0.1147644, -3.444432, 0, 1, 0.7529412, 1,
-0.08101925, 0.5272793, -1.319382, 0, 1, 0.7607843, 1,
-0.07895114, 0.04018782, -0.177124, 0, 1, 0.7647059, 1,
-0.07835496, 1.422061, -0.9570256, 0, 1, 0.772549, 1,
-0.07684081, 2.375731, -0.1885133, 0, 1, 0.7764706, 1,
-0.07484858, -0.7074779, -2.571367, 0, 1, 0.7843137, 1,
-0.07451401, -0.6799892, -5.306536, 0, 1, 0.7882353, 1,
-0.07337232, 0.7209723, -1.775805, 0, 1, 0.7960784, 1,
-0.07178117, -1.668493, -2.81139, 0, 1, 0.8039216, 1,
-0.06438627, -0.2810038, -2.606102, 0, 1, 0.8078431, 1,
-0.05950315, 0.4216609, 0.6514661, 0, 1, 0.8156863, 1,
-0.05640014, -0.6811743, -2.760643, 0, 1, 0.8196079, 1,
-0.04710923, -0.7797025, -2.632212, 0, 1, 0.827451, 1,
-0.04630983, 0.05336538, 0.9712366, 0, 1, 0.8313726, 1,
-0.04546187, -1.664783, -3.391478, 0, 1, 0.8392157, 1,
-0.03894486, -0.2126357, -2.757463, 0, 1, 0.8431373, 1,
-0.03831394, -1.168653, -5.14798, 0, 1, 0.8509804, 1,
-0.03778177, 1.172778, -2.311566, 0, 1, 0.854902, 1,
-0.03706153, -0.7784482, -1.822321, 0, 1, 0.8627451, 1,
-0.03615585, 1.067443, -0.2436976, 0, 1, 0.8666667, 1,
-0.03544407, -0.4096583, -3.818944, 0, 1, 0.8745098, 1,
-0.03328481, 0.1896381, -0.4527874, 0, 1, 0.8784314, 1,
-0.03144068, 0.3942615, -1.184345, 0, 1, 0.8862745, 1,
-0.0256057, 1.737666, 0.4806226, 0, 1, 0.8901961, 1,
-0.01827347, 0.2576507, 0.4614718, 0, 1, 0.8980392, 1,
-0.01635736, -2.074278, -2.484028, 0, 1, 0.9058824, 1,
-0.0148889, 0.3297905, 0.2567661, 0, 1, 0.9098039, 1,
-0.01044439, 0.5333753, -1.227608, 0, 1, 0.9176471, 1,
-0.005077172, 1.079685, -0.05551019, 0, 1, 0.9215686, 1,
-0.003256975, -1.258076, -1.704966, 0, 1, 0.9294118, 1,
-0.002399902, -0.3944961, -3.217758, 0, 1, 0.9333333, 1,
-0.001444987, 0.420625, -0.9172618, 0, 1, 0.9411765, 1,
-0.0001729739, -0.5926149, -3.085003, 0, 1, 0.945098, 1,
0.001093821, -1.148005, 2.781619, 0, 1, 0.9529412, 1,
0.001508925, -0.1553374, 4.371366, 0, 1, 0.9568627, 1,
0.004196394, 0.9697806, 2.135791, 0, 1, 0.9647059, 1,
0.007678088, 1.143425, 0.5125835, 0, 1, 0.9686275, 1,
0.01137482, 0.5085201, -1.270809, 0, 1, 0.9764706, 1,
0.01460361, 0.0381965, 2.49178, 0, 1, 0.9803922, 1,
0.01928724, -0.537471, 4.33292, 0, 1, 0.9882353, 1,
0.0201292, 0.1082851, 2.021003, 0, 1, 0.9921569, 1,
0.02128402, 0.608991, 1.7154, 0, 1, 1, 1,
0.02223369, -1.016272, 2.884633, 0, 0.9921569, 1, 1,
0.02318282, -0.8718015, 1.696133, 0, 0.9882353, 1, 1,
0.03039078, 0.8682771, 1.729289, 0, 0.9803922, 1, 1,
0.03186013, -2.136168, 2.681713, 0, 0.9764706, 1, 1,
0.03299514, 1.973426, -1.366031, 0, 0.9686275, 1, 1,
0.03655301, -0.2690686, 3.333681, 0, 0.9647059, 1, 1,
0.03719123, -1.49734, 1.963092, 0, 0.9568627, 1, 1,
0.03724266, 2.180931, 0.8024619, 0, 0.9529412, 1, 1,
0.04213982, -0.7772495, 1.769841, 0, 0.945098, 1, 1,
0.04591641, 0.4927005, 0.5843473, 0, 0.9411765, 1, 1,
0.04608813, 0.1888577, -0.2877254, 0, 0.9333333, 1, 1,
0.04761993, -0.4145398, 2.837742, 0, 0.9294118, 1, 1,
0.0578537, -0.1733555, 4.040689, 0, 0.9215686, 1, 1,
0.06484402, -0.253744, 0.4030151, 0, 0.9176471, 1, 1,
0.07141876, 0.203542, 1.681843, 0, 0.9098039, 1, 1,
0.07417554, -0.008075525, 1.031554, 0, 0.9058824, 1, 1,
0.07456811, -0.3068502, 3.128534, 0, 0.8980392, 1, 1,
0.07461422, 0.4978713, 0.5244845, 0, 0.8901961, 1, 1,
0.07573005, -1.020466, 3.810586, 0, 0.8862745, 1, 1,
0.08323301, 3.158393, 0.9953681, 0, 0.8784314, 1, 1,
0.08342981, 1.347144, 0.2883392, 0, 0.8745098, 1, 1,
0.09662903, -2.127104, 3.570491, 0, 0.8666667, 1, 1,
0.09740324, 0.9548874, 0.6165934, 0, 0.8627451, 1, 1,
0.1064151, 0.1529859, 0.07340442, 0, 0.854902, 1, 1,
0.1128267, 1.188769, 0.3559315, 0, 0.8509804, 1, 1,
0.120566, 0.4070756, 0.5320234, 0, 0.8431373, 1, 1,
0.1213458, -1.673237, 3.067338, 0, 0.8392157, 1, 1,
0.1301934, 1.282616, 0.4251636, 0, 0.8313726, 1, 1,
0.1331095, -0.4457658, 2.930473, 0, 0.827451, 1, 1,
0.1334024, -1.787515, 4.100616, 0, 0.8196079, 1, 1,
0.1388216, -0.7472194, 1.841044, 0, 0.8156863, 1, 1,
0.1415689, -0.4287066, 3.348646, 0, 0.8078431, 1, 1,
0.1429922, -1.76585, 3.510217, 0, 0.8039216, 1, 1,
0.1476211, 1.368031, 2.276244, 0, 0.7960784, 1, 1,
0.1562854, 1.000373, 0.1920654, 0, 0.7882353, 1, 1,
0.1586106, -0.4550795, 1.984673, 0, 0.7843137, 1, 1,
0.1593937, 0.5900789, -0.6850401, 0, 0.7764706, 1, 1,
0.1635522, -0.5726045, 2.99298, 0, 0.772549, 1, 1,
0.1636071, -0.7845039, 3.801152, 0, 0.7647059, 1, 1,
0.1661105, 0.7285608, 0.1218581, 0, 0.7607843, 1, 1,
0.1689804, -0.4732777, 3.990707, 0, 0.7529412, 1, 1,
0.1697649, -0.7082647, 2.433783, 0, 0.7490196, 1, 1,
0.1779561, 0.02725756, 1.516389, 0, 0.7411765, 1, 1,
0.1784781, 1.46959, -0.8545433, 0, 0.7372549, 1, 1,
0.178718, -1.019838, 3.762318, 0, 0.7294118, 1, 1,
0.1814112, 0.4169185, 1.785766, 0, 0.7254902, 1, 1,
0.1827741, 1.652464, -1.390904, 0, 0.7176471, 1, 1,
0.1856958, 0.9067774, 0.2841914, 0, 0.7137255, 1, 1,
0.1904407, -0.006012042, 1.309537, 0, 0.7058824, 1, 1,
0.1928967, 0.9166784, -0.2807955, 0, 0.6980392, 1, 1,
0.194789, -0.4586642, 3.673859, 0, 0.6941177, 1, 1,
0.1950147, -0.6441604, 2.778005, 0, 0.6862745, 1, 1,
0.2002402, 0.5571535, 2.82092, 0, 0.682353, 1, 1,
0.2006486, 1.626894, -1.854676, 0, 0.6745098, 1, 1,
0.2027258, -0.4172284, 2.672324, 0, 0.6705883, 1, 1,
0.2031962, 0.8206907, 1.301244, 0, 0.6627451, 1, 1,
0.203234, 0.4327906, 0.7104639, 0, 0.6588235, 1, 1,
0.204494, -0.1678528, 1.653881, 0, 0.6509804, 1, 1,
0.2061321, 0.6766328, -0.9353695, 0, 0.6470588, 1, 1,
0.207478, -0.9940032, 2.459671, 0, 0.6392157, 1, 1,
0.2096698, -1.074973, 3.355634, 0, 0.6352941, 1, 1,
0.2121645, 1.312384, 1.04094, 0, 0.627451, 1, 1,
0.2125271, -0.02518413, 1.011093, 0, 0.6235294, 1, 1,
0.2148189, -0.2336864, 1.840904, 0, 0.6156863, 1, 1,
0.2205029, 0.6919343, 0.8037666, 0, 0.6117647, 1, 1,
0.2253512, -0.9096017, 2.906536, 0, 0.6039216, 1, 1,
0.2260041, 0.9329011, 0.3843063, 0, 0.5960785, 1, 1,
0.226361, 1.120941, -0.7543133, 0, 0.5921569, 1, 1,
0.2284562, -1.526776, 2.836749, 0, 0.5843138, 1, 1,
0.2295623, -0.02574134, 2.090178, 0, 0.5803922, 1, 1,
0.2429062, 0.04493492, 0.7775807, 0, 0.572549, 1, 1,
0.2443089, 2.864348, 0.02179194, 0, 0.5686275, 1, 1,
0.2452592, -0.8565361, 3.11605, 0, 0.5607843, 1, 1,
0.2454931, -0.9406618, 1.640752, 0, 0.5568628, 1, 1,
0.2461418, 1.261572, 0.6355091, 0, 0.5490196, 1, 1,
0.2463417, 1.227105, 1.071772, 0, 0.5450981, 1, 1,
0.2493529, -1.472119, 2.310573, 0, 0.5372549, 1, 1,
0.2494456, -0.1433935, 2.977347, 0, 0.5333334, 1, 1,
0.2518886, 0.4772254, 1.664036, 0, 0.5254902, 1, 1,
0.2529374, 0.5450981, 0.369758, 0, 0.5215687, 1, 1,
0.2535731, -0.9077294, 2.77359, 0, 0.5137255, 1, 1,
0.2594579, 0.9387643, 0.6402446, 0, 0.509804, 1, 1,
0.2603675, 1.189331, 1.817471, 0, 0.5019608, 1, 1,
0.2664783, 0.6164774, 1.228048, 0, 0.4941176, 1, 1,
0.2674374, -0.5473741, 2.413193, 0, 0.4901961, 1, 1,
0.270157, -1.508813, 2.213444, 0, 0.4823529, 1, 1,
0.2726934, 0.7847445, 1.824058, 0, 0.4784314, 1, 1,
0.2732202, -0.4659464, 2.445583, 0, 0.4705882, 1, 1,
0.2765289, -0.5826906, 3.594022, 0, 0.4666667, 1, 1,
0.278399, 0.34198, 2.730706, 0, 0.4588235, 1, 1,
0.2805111, 1.049455, -0.1371307, 0, 0.454902, 1, 1,
0.2817997, -1.275849, 3.166125, 0, 0.4470588, 1, 1,
0.2875167, -0.8185011, 0.7149742, 0, 0.4431373, 1, 1,
0.2914634, -1.139787, 2.67214, 0, 0.4352941, 1, 1,
0.2931708, 0.2114622, -0.6862367, 0, 0.4313726, 1, 1,
0.2946434, -0.131722, 3.159311, 0, 0.4235294, 1, 1,
0.2949171, 2.152809, -0.1130819, 0, 0.4196078, 1, 1,
0.2953132, 1.515484, 1.994453, 0, 0.4117647, 1, 1,
0.2999729, -0.257186, 2.374988, 0, 0.4078431, 1, 1,
0.3039814, -0.1454849, 2.564472, 0, 0.4, 1, 1,
0.3085001, 0.7813186, -0.5907775, 0, 0.3921569, 1, 1,
0.3085563, 0.1753686, 1.567974, 0, 0.3882353, 1, 1,
0.3088856, 0.9384732, 1.178485, 0, 0.3803922, 1, 1,
0.3098349, 0.1771897, 1.670471, 0, 0.3764706, 1, 1,
0.3127443, -0.6992599, 3.166136, 0, 0.3686275, 1, 1,
0.3180868, 1.503026, -0.2368405, 0, 0.3647059, 1, 1,
0.3201137, 0.5521597, 1.011541, 0, 0.3568628, 1, 1,
0.3201148, 0.03100426, 1.069004, 0, 0.3529412, 1, 1,
0.3205919, 0.7434249, 1.081598, 0, 0.345098, 1, 1,
0.324838, -0.1979469, 0.9193965, 0, 0.3411765, 1, 1,
0.3266311, 0.1134934, 1.406029, 0, 0.3333333, 1, 1,
0.3291624, -1.694407, 3.449568, 0, 0.3294118, 1, 1,
0.3292003, -0.5467142, 1.9284, 0, 0.3215686, 1, 1,
0.330981, -1.291613, 3.914875, 0, 0.3176471, 1, 1,
0.3311253, 0.8786803, 0.65775, 0, 0.3098039, 1, 1,
0.3323707, 0.5628006, -0.2679514, 0, 0.3058824, 1, 1,
0.3329392, -1.34002, 3.482633, 0, 0.2980392, 1, 1,
0.3388079, 0.5299878, 1.204083, 0, 0.2901961, 1, 1,
0.3398177, -1.292711, 2.573397, 0, 0.2862745, 1, 1,
0.339837, -1.041401, 1.90744, 0, 0.2784314, 1, 1,
0.3402942, 1.229054, 0.441, 0, 0.2745098, 1, 1,
0.3408607, 0.4587025, 0.8235374, 0, 0.2666667, 1, 1,
0.3410767, 0.7540094, 0.3175765, 0, 0.2627451, 1, 1,
0.343735, 1.160357, -1.043482, 0, 0.254902, 1, 1,
0.3472819, 0.3459062, 0.9334716, 0, 0.2509804, 1, 1,
0.3490105, 0.5793178, 1.338298, 0, 0.2431373, 1, 1,
0.3584506, 0.4219293, 1.858833, 0, 0.2392157, 1, 1,
0.3590821, -0.9998546, 3.511596, 0, 0.2313726, 1, 1,
0.3597851, 1.512244, -0.2977831, 0, 0.227451, 1, 1,
0.3601127, 0.5162116, 1.264499, 0, 0.2196078, 1, 1,
0.3621209, 0.3340548, -0.9805195, 0, 0.2156863, 1, 1,
0.3645514, 0.8608902, 0.3520084, 0, 0.2078431, 1, 1,
0.3667745, 1.175497, 1.657786, 0, 0.2039216, 1, 1,
0.3673175, 0.2439918, 1.815411, 0, 0.1960784, 1, 1,
0.368737, -1.494244, 2.67919, 0, 0.1882353, 1, 1,
0.3698172, -1.348902, 2.368667, 0, 0.1843137, 1, 1,
0.3701231, -0.7053777, 1.58064, 0, 0.1764706, 1, 1,
0.370624, -0.3602701, 0.6692182, 0, 0.172549, 1, 1,
0.3728449, -0.7938333, 2.224287, 0, 0.1647059, 1, 1,
0.3739719, 0.4767651, 1.041215, 0, 0.1607843, 1, 1,
0.37589, -1.161078, 0.9447269, 0, 0.1529412, 1, 1,
0.3779256, 0.3777666, 1.109972, 0, 0.1490196, 1, 1,
0.3803999, -0.2241628, 1.88052, 0, 0.1411765, 1, 1,
0.3810157, -0.6359187, 1.126781, 0, 0.1372549, 1, 1,
0.3844831, -0.59493, 0.3610628, 0, 0.1294118, 1, 1,
0.3852539, 1.459878, -0.3583831, 0, 0.1254902, 1, 1,
0.3865882, 1.123046, -1.192292, 0, 0.1176471, 1, 1,
0.3894434, -0.4399782, 1.908909, 0, 0.1137255, 1, 1,
0.38973, 0.6159104, 2.003734, 0, 0.1058824, 1, 1,
0.3913462, 1.9689, 1.857038, 0, 0.09803922, 1, 1,
0.3925464, 1.436228, 0.6191356, 0, 0.09411765, 1, 1,
0.3949171, 0.4987835, 0.2659701, 0, 0.08627451, 1, 1,
0.3960111, -1.186167, 2.294115, 0, 0.08235294, 1, 1,
0.3961489, -0.07449226, 2.522402, 0, 0.07450981, 1, 1,
0.3963801, -0.1117576, 2.095767, 0, 0.07058824, 1, 1,
0.3978793, 0.2785721, 0.8764248, 0, 0.0627451, 1, 1,
0.4058978, -0.4545811, 2.969773, 0, 0.05882353, 1, 1,
0.4093583, 0.7043708, 0.196712, 0, 0.05098039, 1, 1,
0.4104771, 0.0521167, 1.836095, 0, 0.04705882, 1, 1,
0.411339, -1.294952, 1.789255, 0, 0.03921569, 1, 1,
0.4159217, -1.531519, 3.804602, 0, 0.03529412, 1, 1,
0.4220176, 0.7875583, 1.637729, 0, 0.02745098, 1, 1,
0.4276187, 0.9931239, -0.8973161, 0, 0.02352941, 1, 1,
0.4312087, -1.002385, 1.610934, 0, 0.01568628, 1, 1,
0.4318886, 1.475397, 0.2537124, 0, 0.01176471, 1, 1,
0.4380876, -1.348328, 1.391211, 0, 0.003921569, 1, 1,
0.4416826, -2.750595, 2.228724, 0.003921569, 0, 1, 1,
0.4463219, 0.7161548, 0.1601202, 0.007843138, 0, 1, 1,
0.4476578, 0.6326589, -0.1848063, 0.01568628, 0, 1, 1,
0.4481365, -0.8562589, 4.869054, 0.01960784, 0, 1, 1,
0.4488773, -0.1937411, 2.414951, 0.02745098, 0, 1, 1,
0.4491857, -0.2062352, 2.777771, 0.03137255, 0, 1, 1,
0.4509382, -2.187782, 3.827311, 0.03921569, 0, 1, 1,
0.4581354, 1.609706, 0.2875964, 0.04313726, 0, 1, 1,
0.4583851, -0.7676587, 2.959415, 0.05098039, 0, 1, 1,
0.4608229, -0.8509094, 4.924919, 0.05490196, 0, 1, 1,
0.4615159, 0.1191531, 0.39862, 0.0627451, 0, 1, 1,
0.4617618, -0.713081, 3.218832, 0.06666667, 0, 1, 1,
0.463284, 0.1816651, -0.1934125, 0.07450981, 0, 1, 1,
0.4683463, -0.09063435, 2.655324, 0.07843138, 0, 1, 1,
0.474891, -1.023484, 4.146259, 0.08627451, 0, 1, 1,
0.4795648, 0.1058396, 2.643795, 0.09019608, 0, 1, 1,
0.4831907, -1.313476, 2.295018, 0.09803922, 0, 1, 1,
0.4834107, -0.09756573, 2.493529, 0.1058824, 0, 1, 1,
0.4939342, -0.3736273, 2.893372, 0.1098039, 0, 1, 1,
0.5028064, -0.6231809, 2.503512, 0.1176471, 0, 1, 1,
0.50463, -0.2749319, 3.395929, 0.1215686, 0, 1, 1,
0.5070165, 0.0766127, 1.745668, 0.1294118, 0, 1, 1,
0.5122566, 2.010319, -1.115072, 0.1333333, 0, 1, 1,
0.5134191, 1.544113, -0.5303185, 0.1411765, 0, 1, 1,
0.5151383, 0.517435, 2.380915, 0.145098, 0, 1, 1,
0.5190257, 1.340642, 0.08055893, 0.1529412, 0, 1, 1,
0.5196183, 1.075544, 0.1668906, 0.1568628, 0, 1, 1,
0.5271705, -0.8877327, 4.312881, 0.1647059, 0, 1, 1,
0.5293501, 0.6046869, 1.147218, 0.1686275, 0, 1, 1,
0.5369527, -0.7678524, 1.861009, 0.1764706, 0, 1, 1,
0.5391285, -0.7774822, 1.655849, 0.1803922, 0, 1, 1,
0.5403358, 0.4030473, 1.226238, 0.1882353, 0, 1, 1,
0.5415381, -0.7726247, 2.129332, 0.1921569, 0, 1, 1,
0.5425244, 1.70488, -1.135488, 0.2, 0, 1, 1,
0.5433248, -0.3974026, 2.563362, 0.2078431, 0, 1, 1,
0.5438184, -1.029641, 2.701328, 0.2117647, 0, 1, 1,
0.5484762, 0.005966065, 1.201418, 0.2196078, 0, 1, 1,
0.5499066, 1.138178, -0.9369446, 0.2235294, 0, 1, 1,
0.5513181, 0.6130653, 0.2037451, 0.2313726, 0, 1, 1,
0.5517994, 0.2113511, 2.203069, 0.2352941, 0, 1, 1,
0.5523081, 1.057371, -0.2724942, 0.2431373, 0, 1, 1,
0.5580726, -1.099062, 4.742501, 0.2470588, 0, 1, 1,
0.5589927, -1.129328, 3.624645, 0.254902, 0, 1, 1,
0.5625646, -0.378887, 1.819117, 0.2588235, 0, 1, 1,
0.5657687, 0.5653144, 1.022496, 0.2666667, 0, 1, 1,
0.566949, 2.211649, 0.8210241, 0.2705882, 0, 1, 1,
0.5752178, -2.099394, 1.33382, 0.2784314, 0, 1, 1,
0.5807027, -0.8239707, 1.225806, 0.282353, 0, 1, 1,
0.5807163, -0.9048697, 3.095969, 0.2901961, 0, 1, 1,
0.5828911, 0.05618859, 3.216521, 0.2941177, 0, 1, 1,
0.5855618, -1.096894, 2.07273, 0.3019608, 0, 1, 1,
0.5975008, 0.4811533, 1.013557, 0.3098039, 0, 1, 1,
0.6024966, 0.2116909, 1.12814, 0.3137255, 0, 1, 1,
0.6029995, 0.1393113, 3.750514, 0.3215686, 0, 1, 1,
0.6118975, -0.03131171, 1.584733, 0.3254902, 0, 1, 1,
0.6137891, -0.02544824, 1.150152, 0.3333333, 0, 1, 1,
0.614576, -0.02419671, 3.27568, 0.3372549, 0, 1, 1,
0.626913, -0.1594542, 2.481253, 0.345098, 0, 1, 1,
0.6271749, 0.8017694, 0.1843188, 0.3490196, 0, 1, 1,
0.6282625, 0.1442269, 0.2304834, 0.3568628, 0, 1, 1,
0.6287696, -1.334032, 2.910683, 0.3607843, 0, 1, 1,
0.6312929, 0.2225992, 2.159017, 0.3686275, 0, 1, 1,
0.633359, -1.148072, 5.513837, 0.372549, 0, 1, 1,
0.6397811, 0.4478726, 1.72343, 0.3803922, 0, 1, 1,
0.6422108, -1.182478, 2.021337, 0.3843137, 0, 1, 1,
0.6430347, 2.330041, 0.7694163, 0.3921569, 0, 1, 1,
0.645214, 0.6156995, 1.241384, 0.3960784, 0, 1, 1,
0.6468374, -1.718866, 3.734584, 0.4039216, 0, 1, 1,
0.6474077, 1.036182, 0.1209178, 0.4117647, 0, 1, 1,
0.6504732, 0.9510393, 0.5010273, 0.4156863, 0, 1, 1,
0.650942, -0.07549194, 0.8723094, 0.4235294, 0, 1, 1,
0.6596167, -1.928535, 0.3437028, 0.427451, 0, 1, 1,
0.660433, -0.4803393, 1.688761, 0.4352941, 0, 1, 1,
0.6617994, -1.357409, 2.836622, 0.4392157, 0, 1, 1,
0.6755399, 0.01852378, 2.225045, 0.4470588, 0, 1, 1,
0.6765993, 0.3412675, -0.0030494, 0.4509804, 0, 1, 1,
0.6806604, -0.2479786, 2.630805, 0.4588235, 0, 1, 1,
0.6825492, 0.1226547, 0.7956806, 0.4627451, 0, 1, 1,
0.6830698, 1.28641, 0.6650669, 0.4705882, 0, 1, 1,
0.6841542, 0.9627546, 0.625809, 0.4745098, 0, 1, 1,
0.6929649, -0.8273185, 1.563026, 0.4823529, 0, 1, 1,
0.6940858, 0.8355829, 2.819472, 0.4862745, 0, 1, 1,
0.6947011, -1.266213, 2.076743, 0.4941176, 0, 1, 1,
0.6950418, 0.8781996, -0.4971159, 0.5019608, 0, 1, 1,
0.6950474, -0.0995836, 0.2350461, 0.5058824, 0, 1, 1,
0.6988439, 0.2567576, 1.774493, 0.5137255, 0, 1, 1,
0.7000688, -0.4412423, 1.737594, 0.5176471, 0, 1, 1,
0.7031949, -0.2190736, 1.663454, 0.5254902, 0, 1, 1,
0.7059152, 1.148202, 1.645817, 0.5294118, 0, 1, 1,
0.7068728, 0.2275782, 1.295816, 0.5372549, 0, 1, 1,
0.7085658, -0.9976926, 1.626429, 0.5411765, 0, 1, 1,
0.7088298, -0.3755721, 2.941235, 0.5490196, 0, 1, 1,
0.7089524, 1.069395, 1.241694, 0.5529412, 0, 1, 1,
0.7126909, -0.0206144, 0.1090252, 0.5607843, 0, 1, 1,
0.7209089, 0.1401927, 0.8850256, 0.5647059, 0, 1, 1,
0.7255532, -0.6708032, 1.870077, 0.572549, 0, 1, 1,
0.7305157, 1.378454, -0.159803, 0.5764706, 0, 1, 1,
0.7337167, -0.4007995, 1.77861, 0.5843138, 0, 1, 1,
0.7341427, -0.5036903, 4.042212, 0.5882353, 0, 1, 1,
0.7368487, 0.442104, 1.306666, 0.5960785, 0, 1, 1,
0.7369973, -0.1421531, 0.5212603, 0.6039216, 0, 1, 1,
0.738227, -0.5688597, 4.331772, 0.6078432, 0, 1, 1,
0.7452217, -1.51879, 2.884624, 0.6156863, 0, 1, 1,
0.7498489, -0.7411734, 1.888666, 0.6196079, 0, 1, 1,
0.7519137, -0.7005805, 1.720826, 0.627451, 0, 1, 1,
0.7523957, 0.9169039, 0.0008502481, 0.6313726, 0, 1, 1,
0.7533693, -0.3659575, 1.304902, 0.6392157, 0, 1, 1,
0.7620318, -1.136419, 2.451863, 0.6431373, 0, 1, 1,
0.7660183, -0.2462392, 2.254138, 0.6509804, 0, 1, 1,
0.7662277, -0.2165443, 2.353479, 0.654902, 0, 1, 1,
0.7695996, -0.5694768, 3.585006, 0.6627451, 0, 1, 1,
0.7714652, 0.1277072, 1.392077, 0.6666667, 0, 1, 1,
0.7737682, 0.321791, 1.516591, 0.6745098, 0, 1, 1,
0.7770412, 0.5809777, 0.48709, 0.6784314, 0, 1, 1,
0.7792297, 0.01969689, 3.151042, 0.6862745, 0, 1, 1,
0.7981397, 0.02477909, 1.509154, 0.6901961, 0, 1, 1,
0.7996761, 0.6073973, 1.102931, 0.6980392, 0, 1, 1,
0.8082511, 0.018307, 2.478383, 0.7058824, 0, 1, 1,
0.8084257, -0.6017305, 1.901842, 0.7098039, 0, 1, 1,
0.8107045, 1.490588, -0.5776109, 0.7176471, 0, 1, 1,
0.8140767, -0.8739694, -0.09262186, 0.7215686, 0, 1, 1,
0.81809, -0.00715424, 1.523517, 0.7294118, 0, 1, 1,
0.8184789, -0.4885433, 2.122059, 0.7333333, 0, 1, 1,
0.8216014, -2.000215, 2.747221, 0.7411765, 0, 1, 1,
0.8218082, -0.1388941, 0.7354691, 0.7450981, 0, 1, 1,
0.824253, -0.08186904, 2.528177, 0.7529412, 0, 1, 1,
0.8253273, -1.543055, 2.78507, 0.7568628, 0, 1, 1,
0.8292437, 0.7097483, -0.4844833, 0.7647059, 0, 1, 1,
0.8295685, -0.492896, 1.926975, 0.7686275, 0, 1, 1,
0.8326989, -1.549727, 0.7915766, 0.7764706, 0, 1, 1,
0.8328809, -0.01860075, 1.650456, 0.7803922, 0, 1, 1,
0.8339958, 0.002921867, 0.01053685, 0.7882353, 0, 1, 1,
0.8356079, 0.1724038, 1.598348, 0.7921569, 0, 1, 1,
0.8407632, -0.05615302, 0.8493527, 0.8, 0, 1, 1,
0.8478184, -0.2828759, 1.388033, 0.8078431, 0, 1, 1,
0.8590599, 0.7857628, 1.072746, 0.8117647, 0, 1, 1,
0.8607897, -0.6292441, 2.313165, 0.8196079, 0, 1, 1,
0.8635488, -0.6529449, 2.206855, 0.8235294, 0, 1, 1,
0.8693534, 0.08705061, 0.7393949, 0.8313726, 0, 1, 1,
0.8761081, 1.175337, 1.514371, 0.8352941, 0, 1, 1,
0.8803902, -0.7580617, 3.077307, 0.8431373, 0, 1, 1,
0.8887155, 0.1534325, 1.813557, 0.8470588, 0, 1, 1,
0.8892196, -0.9058914, 1.710208, 0.854902, 0, 1, 1,
0.893667, -1.219468, 2.785313, 0.8588235, 0, 1, 1,
0.9042737, 0.8808624, 0.8500955, 0.8666667, 0, 1, 1,
0.9096789, 0.4343514, 1.68803, 0.8705882, 0, 1, 1,
0.9152429, -0.0883108, 4.107876, 0.8784314, 0, 1, 1,
0.9278141, -0.07613908, 1.983399, 0.8823529, 0, 1, 1,
0.9350935, -0.7026919, 2.716004, 0.8901961, 0, 1, 1,
0.9352903, 1.181279, 0.4655813, 0.8941177, 0, 1, 1,
0.9363812, 1.015469, 1.191947, 0.9019608, 0, 1, 1,
0.9407985, -1.074729, 3.351385, 0.9098039, 0, 1, 1,
0.9488475, -2.392405, 3.949118, 0.9137255, 0, 1, 1,
0.9519072, -0.7739453, 1.622415, 0.9215686, 0, 1, 1,
0.9560955, 0.3663211, 1.488477, 0.9254902, 0, 1, 1,
0.9569283, 1.110149, -0.3364174, 0.9333333, 0, 1, 1,
0.963333, -1.4017, 3.128473, 0.9372549, 0, 1, 1,
0.9652209, 1.193718, 0.35168, 0.945098, 0, 1, 1,
0.967123, -0.3183686, 3.223503, 0.9490196, 0, 1, 1,
0.9691579, -0.09436665, 2.282023, 0.9568627, 0, 1, 1,
0.974557, -1.283202, 2.434393, 0.9607843, 0, 1, 1,
0.975513, -1.089626, 2.616653, 0.9686275, 0, 1, 1,
0.9784176, 1.170574, 1.621923, 0.972549, 0, 1, 1,
0.9831585, -1.072523, 1.072515, 0.9803922, 0, 1, 1,
0.9854705, -1.011683, 3.973024, 0.9843137, 0, 1, 1,
0.9898008, 0.1588357, 2.111425, 0.9921569, 0, 1, 1,
0.9929164, 0.8701202, -0.3040845, 0.9960784, 0, 1, 1,
0.9972776, -0.4231383, 3.213385, 1, 0, 0.9960784, 1,
0.9986034, -1.608501, 2.512028, 1, 0, 0.9882353, 1,
1.004626, 0.8518657, 1.676394, 1, 0, 0.9843137, 1,
1.01086, -0.5480145, 1.992018, 1, 0, 0.9764706, 1,
1.023104, 0.07039478, -0.03537223, 1, 0, 0.972549, 1,
1.025299, 0.3212571, 1.369093, 1, 0, 0.9647059, 1,
1.028936, 2.723765, -0.530756, 1, 0, 0.9607843, 1,
1.033466, 0.4128642, 2.068967, 1, 0, 0.9529412, 1,
1.04023, -0.3468821, 1.644905, 1, 0, 0.9490196, 1,
1.042316, 0.9375298, 0.6363438, 1, 0, 0.9411765, 1,
1.043701, -1.214338, 3.687805, 1, 0, 0.9372549, 1,
1.048403, -1.425529, 1.67854, 1, 0, 0.9294118, 1,
1.049783, -0.1130388, 2.453912, 1, 0, 0.9254902, 1,
1.050905, -1.365181, 2.951612, 1, 0, 0.9176471, 1,
1.054134, 0.6669895, 0.3256004, 1, 0, 0.9137255, 1,
1.069563, 0.8879204, -0.6903555, 1, 0, 0.9058824, 1,
1.070606, 0.6646895, 2.33144, 1, 0, 0.9019608, 1,
1.079412, -0.3129906, 1.964906, 1, 0, 0.8941177, 1,
1.088692, 0.5571259, -0.4364446, 1, 0, 0.8862745, 1,
1.0903, 0.1994891, 1.269392, 1, 0, 0.8823529, 1,
1.092243, -0.2921679, 2.763731, 1, 0, 0.8745098, 1,
1.094633, 0.6244618, 0.9216516, 1, 0, 0.8705882, 1,
1.09549, -0.5198037, 2.103863, 1, 0, 0.8627451, 1,
1.09806, -0.5419266, 1.205636, 1, 0, 0.8588235, 1,
1.099162, -1.455796, 3.071427, 1, 0, 0.8509804, 1,
1.099982, -0.04693082, 2.903792, 1, 0, 0.8470588, 1,
1.100079, 0.7610418, 0.4516605, 1, 0, 0.8392157, 1,
1.10328, 1.223748, 1.23726, 1, 0, 0.8352941, 1,
1.106291, -1.044725, 2.950823, 1, 0, 0.827451, 1,
1.120608, 1.403807, 0.6053392, 1, 0, 0.8235294, 1,
1.125719, -1.50095, 0.6257835, 1, 0, 0.8156863, 1,
1.139086, 0.9145899, 1.486491, 1, 0, 0.8117647, 1,
1.145722, -0.9714414, 0.8018221, 1, 0, 0.8039216, 1,
1.14576, -0.8752541, 1.433293, 1, 0, 0.7960784, 1,
1.145761, -0.7572666, 3.640641, 1, 0, 0.7921569, 1,
1.149867, -0.2988545, -0.4425824, 1, 0, 0.7843137, 1,
1.150216, -1.769586, 3.867219, 1, 0, 0.7803922, 1,
1.156996, -0.5426853, 0.929467, 1, 0, 0.772549, 1,
1.158502, -1.802966, 1.213463, 1, 0, 0.7686275, 1,
1.158503, 1.246381, -0.9769806, 1, 0, 0.7607843, 1,
1.161133, 0.01819066, -0.2525076, 1, 0, 0.7568628, 1,
1.166513, 0.3956698, 2.292835, 1, 0, 0.7490196, 1,
1.168618, -1.615671, 3.607568, 1, 0, 0.7450981, 1,
1.17008, 0.3020698, 2.209798, 1, 0, 0.7372549, 1,
1.172942, -1.015097, 2.54428, 1, 0, 0.7333333, 1,
1.175483, -1.086943, 1.870367, 1, 0, 0.7254902, 1,
1.176457, 0.5609738, 1.76195, 1, 0, 0.7215686, 1,
1.177606, -0.8846749, 0.8349441, 1, 0, 0.7137255, 1,
1.189736, 0.7884759, 0.5290232, 1, 0, 0.7098039, 1,
1.19631, -1.022508, 2.42005, 1, 0, 0.7019608, 1,
1.197261, -0.448378, 2.460399, 1, 0, 0.6941177, 1,
1.200791, 1.217774, 1.056352, 1, 0, 0.6901961, 1,
1.207354, -1.881456, 1.202518, 1, 0, 0.682353, 1,
1.212733, 2.479187, -0.2304798, 1, 0, 0.6784314, 1,
1.213642, 1.37908, 1.975622, 1, 0, 0.6705883, 1,
1.217684, 0.9814547, 2.36639, 1, 0, 0.6666667, 1,
1.217958, 1.747942, 2.570741, 1, 0, 0.6588235, 1,
1.220943, -0.03011354, 1.014637, 1, 0, 0.654902, 1,
1.222383, -0.5650513, 2.660213, 1, 0, 0.6470588, 1,
1.232051, -0.3983905, 2.233519, 1, 0, 0.6431373, 1,
1.233956, 0.2525309, 2.380296, 1, 0, 0.6352941, 1,
1.235365, -0.09314686, 2.551778, 1, 0, 0.6313726, 1,
1.238179, -0.7057154, 2.854523, 1, 0, 0.6235294, 1,
1.26679, 0.9869918, 0.08864601, 1, 0, 0.6196079, 1,
1.270726, -1.697918, 3.465371, 1, 0, 0.6117647, 1,
1.281364, -1.091242, 2.036037, 1, 0, 0.6078432, 1,
1.285831, -0.1063314, 1.624018, 1, 0, 0.6, 1,
1.287996, -0.6876153, 1.541874, 1, 0, 0.5921569, 1,
1.298425, -0.005816761, 1.719382, 1, 0, 0.5882353, 1,
1.30335, 0.133911, 1.440823, 1, 0, 0.5803922, 1,
1.324447, 0.5324514, 0.5320151, 1, 0, 0.5764706, 1,
1.324718, 0.9905118, 1.853477, 1, 0, 0.5686275, 1,
1.334787, 0.5876016, 1.82727, 1, 0, 0.5647059, 1,
1.337628, -0.7411737, 1.581325, 1, 0, 0.5568628, 1,
1.343565, 0.753845, 0.07892136, 1, 0, 0.5529412, 1,
1.349503, -0.2811994, 2.181549, 1, 0, 0.5450981, 1,
1.358312, 0.8389091, 0.9627342, 1, 0, 0.5411765, 1,
1.359892, 0.4157273, 1.867845, 1, 0, 0.5333334, 1,
1.370026, -1.257266, 1.842051, 1, 0, 0.5294118, 1,
1.374937, 1.175428, -0.4148181, 1, 0, 0.5215687, 1,
1.378134, -2.465247, 3.615512, 1, 0, 0.5176471, 1,
1.386244, -0.526483, 1.50601, 1, 0, 0.509804, 1,
1.392977, -0.8605391, 2.268969, 1, 0, 0.5058824, 1,
1.393073, 0.4312135, -0.3969993, 1, 0, 0.4980392, 1,
1.408795, 1.769864, -0.5007755, 1, 0, 0.4901961, 1,
1.41605, 1.069832, 0.4420108, 1, 0, 0.4862745, 1,
1.416132, -1.330317, 1.92543, 1, 0, 0.4784314, 1,
1.418724, 0.7404242, 1.047757, 1, 0, 0.4745098, 1,
1.420466, -0.006718059, 1.653341, 1, 0, 0.4666667, 1,
1.428855, -0.1460405, 3.519969, 1, 0, 0.4627451, 1,
1.45574, 0.06203844, 2.590524, 1, 0, 0.454902, 1,
1.456281, 1.036607, 0.4169694, 1, 0, 0.4509804, 1,
1.457211, 1.180283, 1.641212, 1, 0, 0.4431373, 1,
1.461183, -0.2383289, 2.329739, 1, 0, 0.4392157, 1,
1.463189, -1.027642, 3.655116, 1, 0, 0.4313726, 1,
1.468612, -1.110033, 3.172132, 1, 0, 0.427451, 1,
1.469925, -0.02336972, 2.386944, 1, 0, 0.4196078, 1,
1.483777, 0.5343914, -0.2847331, 1, 0, 0.4156863, 1,
1.484664, -0.1709548, 2.949317, 1, 0, 0.4078431, 1,
1.486257, 0.4110395, -0.09823979, 1, 0, 0.4039216, 1,
1.486452, 2.31261, -0.2930353, 1, 0, 0.3960784, 1,
1.501884, -0.5337076, 2.572973, 1, 0, 0.3882353, 1,
1.502791, -0.8874269, 1.190114, 1, 0, 0.3843137, 1,
1.515873, 0.4351009, 3.346698, 1, 0, 0.3764706, 1,
1.521269, 0.863632, 0.5921973, 1, 0, 0.372549, 1,
1.525823, -0.03411812, 0.2104844, 1, 0, 0.3647059, 1,
1.537805, 0.1287397, 0.01219858, 1, 0, 0.3607843, 1,
1.542997, -0.7877036, 3.000489, 1, 0, 0.3529412, 1,
1.54762, -0.2144156, 1.560561, 1, 0, 0.3490196, 1,
1.551876, -2.545388, 2.329885, 1, 0, 0.3411765, 1,
1.574021, 0.4038399, 1.294948, 1, 0, 0.3372549, 1,
1.57915, 0.05020059, 2.981183, 1, 0, 0.3294118, 1,
1.584208, 0.4638463, 1.638838, 1, 0, 0.3254902, 1,
1.617607, -0.7359666, 0.6627189, 1, 0, 0.3176471, 1,
1.621627, 1.358193, 1.052108, 1, 0, 0.3137255, 1,
1.629908, 0.5814478, 0.5156692, 1, 0, 0.3058824, 1,
1.633265, -0.6410017, 1.789667, 1, 0, 0.2980392, 1,
1.639801, 0.01425121, 3.165646, 1, 0, 0.2941177, 1,
1.64773, 0.2301915, 0.14342, 1, 0, 0.2862745, 1,
1.649719, 0.1104741, -0.5075091, 1, 0, 0.282353, 1,
1.704094, 0.4543633, 2.766365, 1, 0, 0.2745098, 1,
1.724839, 1.107343, -0.06155184, 1, 0, 0.2705882, 1,
1.749954, -0.9490243, 1.075178, 1, 0, 0.2627451, 1,
1.766178, -1.015879, 0.3020116, 1, 0, 0.2588235, 1,
1.774934, -0.6307216, 2.116269, 1, 0, 0.2509804, 1,
1.792549, -0.3687775, 2.43625, 1, 0, 0.2470588, 1,
1.807869, -0.0533548, 1.783137, 1, 0, 0.2392157, 1,
1.814557, 0.6343731, 1.931865, 1, 0, 0.2352941, 1,
1.823157, -1.182495, 2.727028, 1, 0, 0.227451, 1,
1.825294, -0.06448275, 3.157358, 1, 0, 0.2235294, 1,
1.867578, -0.1754162, 0.2981359, 1, 0, 0.2156863, 1,
1.895916, -1.009578, 2.850176, 1, 0, 0.2117647, 1,
1.908036, -0.814138, 2.514859, 1, 0, 0.2039216, 1,
1.930749, -0.366357, 2.620457, 1, 0, 0.1960784, 1,
1.943341, -0.1851893, 2.116496, 1, 0, 0.1921569, 1,
1.943765, 0.1892899, 3.314077, 1, 0, 0.1843137, 1,
1.959193, 1.367486, 2.613048, 1, 0, 0.1803922, 1,
1.979649, 0.9250497, -0.5108786, 1, 0, 0.172549, 1,
2.013937, -1.013109, 1.37766, 1, 0, 0.1686275, 1,
2.017509, -0.275037, 1.741852, 1, 0, 0.1607843, 1,
2.093577, 0.3681043, 0.1129781, 1, 0, 0.1568628, 1,
2.099719, -0.3506489, 2.031461, 1, 0, 0.1490196, 1,
2.104978, 0.6793844, 0.5933822, 1, 0, 0.145098, 1,
2.105309, 1.033499, 2.596219, 1, 0, 0.1372549, 1,
2.120313, 0.2944069, 0.05904185, 1, 0, 0.1333333, 1,
2.214485, 0.0552232, 0.6622472, 1, 0, 0.1254902, 1,
2.245378, -1.364413, 2.423259, 1, 0, 0.1215686, 1,
2.247131, 0.1369175, 1.734657, 1, 0, 0.1137255, 1,
2.291411, 0.5273172, 0.9474834, 1, 0, 0.1098039, 1,
2.324773, 2.29953, 0.8506235, 1, 0, 0.1019608, 1,
2.337847, 0.1319265, 1.513616, 1, 0, 0.09411765, 1,
2.37175, 0.780064, 0.2257173, 1, 0, 0.09019608, 1,
2.382583, 0.9597694, 0.8676393, 1, 0, 0.08235294, 1,
2.425399, -0.3862946, 0.5218635, 1, 0, 0.07843138, 1,
2.425868, -1.332694, -0.8615848, 1, 0, 0.07058824, 1,
2.453495, 0.4828916, 1.617696, 1, 0, 0.06666667, 1,
2.477924, -1.174035, 0.4372231, 1, 0, 0.05882353, 1,
2.482681, -0.21454, 3.169203, 1, 0, 0.05490196, 1,
2.500966, -0.1803307, 2.450031, 1, 0, 0.04705882, 1,
2.511325, -0.5984508, 2.018365, 1, 0, 0.04313726, 1,
2.515215, -0.815178, 3.063986, 1, 0, 0.03529412, 1,
2.635414, -0.8323258, -1.001022, 1, 0, 0.03137255, 1,
2.711889, 0.9767805, 0.9509102, 1, 0, 0.02352941, 1,
2.765457, -2.623562, 1.141195, 1, 0, 0.01960784, 1,
2.81143, -0.03411755, 2.226375, 1, 0, 0.01176471, 1,
2.867306, -0.3365213, 2.041877, 1, 0, 0.007843138, 1
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
-0.4067069, -4.633837, -7.267898, 0, -0.5, 0.5, 0.5,
-0.4067069, -4.633837, -7.267898, 1, -0.5, 0.5, 0.5,
-0.4067069, -4.633837, -7.267898, 1, 1.5, 0.5, 0.5,
-0.4067069, -4.633837, -7.267898, 0, 1.5, 0.5, 0.5
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
-4.790611, -0.1730433, -7.267898, 0, -0.5, 0.5, 0.5,
-4.790611, -0.1730433, -7.267898, 1, -0.5, 0.5, 0.5,
-4.790611, -0.1730433, -7.267898, 1, 1.5, 0.5, 0.5,
-4.790611, -0.1730433, -7.267898, 0, 1.5, 0.5, 0.5
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
-4.790611, -4.633837, 0.04922199, 0, -0.5, 0.5, 0.5,
-4.790611, -4.633837, 0.04922199, 1, -0.5, 0.5, 0.5,
-4.790611, -4.633837, 0.04922199, 1, 1.5, 0.5, 0.5,
-4.790611, -4.633837, 0.04922199, 0, 1.5, 0.5, 0.5
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
-3, -3.604423, -5.579332,
2, -3.604423, -5.579332,
-3, -3.604423, -5.579332,
-3, -3.775992, -5.86076,
-2, -3.604423, -5.579332,
-2, -3.775992, -5.86076,
-1, -3.604423, -5.579332,
-1, -3.775992, -5.86076,
0, -3.604423, -5.579332,
0, -3.775992, -5.86076,
1, -3.604423, -5.579332,
1, -3.775992, -5.86076,
2, -3.604423, -5.579332,
2, -3.775992, -5.86076
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
-3, -4.11913, -6.423615, 0, -0.5, 0.5, 0.5,
-3, -4.11913, -6.423615, 1, -0.5, 0.5, 0.5,
-3, -4.11913, -6.423615, 1, 1.5, 0.5, 0.5,
-3, -4.11913, -6.423615, 0, 1.5, 0.5, 0.5,
-2, -4.11913, -6.423615, 0, -0.5, 0.5, 0.5,
-2, -4.11913, -6.423615, 1, -0.5, 0.5, 0.5,
-2, -4.11913, -6.423615, 1, 1.5, 0.5, 0.5,
-2, -4.11913, -6.423615, 0, 1.5, 0.5, 0.5,
-1, -4.11913, -6.423615, 0, -0.5, 0.5, 0.5,
-1, -4.11913, -6.423615, 1, -0.5, 0.5, 0.5,
-1, -4.11913, -6.423615, 1, 1.5, 0.5, 0.5,
-1, -4.11913, -6.423615, 0, 1.5, 0.5, 0.5,
0, -4.11913, -6.423615, 0, -0.5, 0.5, 0.5,
0, -4.11913, -6.423615, 1, -0.5, 0.5, 0.5,
0, -4.11913, -6.423615, 1, 1.5, 0.5, 0.5,
0, -4.11913, -6.423615, 0, 1.5, 0.5, 0.5,
1, -4.11913, -6.423615, 0, -0.5, 0.5, 0.5,
1, -4.11913, -6.423615, 1, -0.5, 0.5, 0.5,
1, -4.11913, -6.423615, 1, 1.5, 0.5, 0.5,
1, -4.11913, -6.423615, 0, 1.5, 0.5, 0.5,
2, -4.11913, -6.423615, 0, -0.5, 0.5, 0.5,
2, -4.11913, -6.423615, 1, -0.5, 0.5, 0.5,
2, -4.11913, -6.423615, 1, 1.5, 0.5, 0.5,
2, -4.11913, -6.423615, 0, 1.5, 0.5, 0.5
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
-3.778941, -3, -5.579332,
-3.778941, 3, -5.579332,
-3.778941, -3, -5.579332,
-3.947552, -3, -5.86076,
-3.778941, -2, -5.579332,
-3.947552, -2, -5.86076,
-3.778941, -1, -5.579332,
-3.947552, -1, -5.86076,
-3.778941, 0, -5.579332,
-3.947552, 0, -5.86076,
-3.778941, 1, -5.579332,
-3.947552, 1, -5.86076,
-3.778941, 2, -5.579332,
-3.947552, 2, -5.86076,
-3.778941, 3, -5.579332,
-3.947552, 3, -5.86076
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
-4.284776, -3, -6.423615, 0, -0.5, 0.5, 0.5,
-4.284776, -3, -6.423615, 1, -0.5, 0.5, 0.5,
-4.284776, -3, -6.423615, 1, 1.5, 0.5, 0.5,
-4.284776, -3, -6.423615, 0, 1.5, 0.5, 0.5,
-4.284776, -2, -6.423615, 0, -0.5, 0.5, 0.5,
-4.284776, -2, -6.423615, 1, -0.5, 0.5, 0.5,
-4.284776, -2, -6.423615, 1, 1.5, 0.5, 0.5,
-4.284776, -2, -6.423615, 0, 1.5, 0.5, 0.5,
-4.284776, -1, -6.423615, 0, -0.5, 0.5, 0.5,
-4.284776, -1, -6.423615, 1, -0.5, 0.5, 0.5,
-4.284776, -1, -6.423615, 1, 1.5, 0.5, 0.5,
-4.284776, -1, -6.423615, 0, 1.5, 0.5, 0.5,
-4.284776, 0, -6.423615, 0, -0.5, 0.5, 0.5,
-4.284776, 0, -6.423615, 1, -0.5, 0.5, 0.5,
-4.284776, 0, -6.423615, 1, 1.5, 0.5, 0.5,
-4.284776, 0, -6.423615, 0, 1.5, 0.5, 0.5,
-4.284776, 1, -6.423615, 0, -0.5, 0.5, 0.5,
-4.284776, 1, -6.423615, 1, -0.5, 0.5, 0.5,
-4.284776, 1, -6.423615, 1, 1.5, 0.5, 0.5,
-4.284776, 1, -6.423615, 0, 1.5, 0.5, 0.5,
-4.284776, 2, -6.423615, 0, -0.5, 0.5, 0.5,
-4.284776, 2, -6.423615, 1, -0.5, 0.5, 0.5,
-4.284776, 2, -6.423615, 1, 1.5, 0.5, 0.5,
-4.284776, 2, -6.423615, 0, 1.5, 0.5, 0.5,
-4.284776, 3, -6.423615, 0, -0.5, 0.5, 0.5,
-4.284776, 3, -6.423615, 1, -0.5, 0.5, 0.5,
-4.284776, 3, -6.423615, 1, 1.5, 0.5, 0.5,
-4.284776, 3, -6.423615, 0, 1.5, 0.5, 0.5
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
-3.778941, -3.604423, -4,
-3.778941, -3.604423, 4,
-3.778941, -3.604423, -4,
-3.947552, -3.775992, -4,
-3.778941, -3.604423, -2,
-3.947552, -3.775992, -2,
-3.778941, -3.604423, 0,
-3.947552, -3.775992, 0,
-3.778941, -3.604423, 2,
-3.947552, -3.775992, 2,
-3.778941, -3.604423, 4,
-3.947552, -3.775992, 4
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
-4.284776, -4.11913, -4, 0, -0.5, 0.5, 0.5,
-4.284776, -4.11913, -4, 1, -0.5, 0.5, 0.5,
-4.284776, -4.11913, -4, 1, 1.5, 0.5, 0.5,
-4.284776, -4.11913, -4, 0, 1.5, 0.5, 0.5,
-4.284776, -4.11913, -2, 0, -0.5, 0.5, 0.5,
-4.284776, -4.11913, -2, 1, -0.5, 0.5, 0.5,
-4.284776, -4.11913, -2, 1, 1.5, 0.5, 0.5,
-4.284776, -4.11913, -2, 0, 1.5, 0.5, 0.5,
-4.284776, -4.11913, 0, 0, -0.5, 0.5, 0.5,
-4.284776, -4.11913, 0, 1, -0.5, 0.5, 0.5,
-4.284776, -4.11913, 0, 1, 1.5, 0.5, 0.5,
-4.284776, -4.11913, 0, 0, 1.5, 0.5, 0.5,
-4.284776, -4.11913, 2, 0, -0.5, 0.5, 0.5,
-4.284776, -4.11913, 2, 1, -0.5, 0.5, 0.5,
-4.284776, -4.11913, 2, 1, 1.5, 0.5, 0.5,
-4.284776, -4.11913, 2, 0, 1.5, 0.5, 0.5,
-4.284776, -4.11913, 4, 0, -0.5, 0.5, 0.5,
-4.284776, -4.11913, 4, 1, -0.5, 0.5, 0.5,
-4.284776, -4.11913, 4, 1, 1.5, 0.5, 0.5,
-4.284776, -4.11913, 4, 0, 1.5, 0.5, 0.5
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
-3.778941, -3.604423, -5.579332,
-3.778941, 3.258336, -5.579332,
-3.778941, -3.604423, 5.677776,
-3.778941, 3.258336, 5.677776,
-3.778941, -3.604423, -5.579332,
-3.778941, -3.604423, 5.677776,
-3.778941, 3.258336, -5.579332,
-3.778941, 3.258336, 5.677776,
-3.778941, -3.604423, -5.579332,
2.965527, -3.604423, -5.579332,
-3.778941, -3.604423, 5.677776,
2.965527, -3.604423, 5.677776,
-3.778941, 3.258336, -5.579332,
2.965527, 3.258336, -5.579332,
-3.778941, 3.258336, 5.677776,
2.965527, 3.258336, 5.677776,
2.965527, -3.604423, -5.579332,
2.965527, 3.258336, -5.579332,
2.965527, -3.604423, 5.677776,
2.965527, 3.258336, 5.677776,
2.965527, -3.604423, -5.579332,
2.965527, -3.604423, 5.677776,
2.965527, 3.258336, -5.579332,
2.965527, 3.258336, 5.677776
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
var radius = 7.907742;
var distance = 35.18244;
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
mvMatrix.translate( 0.4067069, 0.1730433, -0.04922199 );
mvMatrix.scale( 1.267707, 1.245855, 0.7595206 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.18244);
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

