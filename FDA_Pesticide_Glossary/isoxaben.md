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
-3.271317, -1.98243, -1.026371, 1, 0, 0, 1,
-3.123867, 0.840829, 0.0274292, 1, 0.007843138, 0, 1,
-2.95808, 1.725629, 0.6916017, 1, 0.01176471, 0, 1,
-2.857305, -0.7729843, -1.493183, 1, 0.01960784, 0, 1,
-2.752997, 0.2147805, -0.9012089, 1, 0.02352941, 0, 1,
-2.573632, 0.6751133, -1.096586, 1, 0.03137255, 0, 1,
-2.413135, 1.061967, -2.406423, 1, 0.03529412, 0, 1,
-2.373986, 0.4666846, -1.162674, 1, 0.04313726, 0, 1,
-2.351674, 1.040184, -1.461301, 1, 0.04705882, 0, 1,
-2.332649, 0.9167546, -2.43396, 1, 0.05490196, 0, 1,
-2.2109, -1.109751, -1.889851, 1, 0.05882353, 0, 1,
-2.199615, 0.9574307, -0.4399983, 1, 0.06666667, 0, 1,
-2.182014, 0.6872948, -1.649845, 1, 0.07058824, 0, 1,
-2.154916, 0.4085593, -0.5298209, 1, 0.07843138, 0, 1,
-2.152077, -0.2785316, -0.5695976, 1, 0.08235294, 0, 1,
-2.130613, -0.2511507, -1.210616, 1, 0.09019608, 0, 1,
-2.102557, -1.087635, -2.31636, 1, 0.09411765, 0, 1,
-2.095086, -0.6684687, -2.182652, 1, 0.1019608, 0, 1,
-2.071173, -0.05944176, -0.8061647, 1, 0.1098039, 0, 1,
-2.058791, 0.1785784, -1.975762, 1, 0.1137255, 0, 1,
-2.017984, -0.7267214, -2.372321, 1, 0.1215686, 0, 1,
-1.983998, -0.06583558, -1.621071, 1, 0.1254902, 0, 1,
-1.981781, 0.2615968, -2.074176, 1, 0.1333333, 0, 1,
-1.944825, -0.2949452, -1.273683, 1, 0.1372549, 0, 1,
-1.941258, -0.5763215, -0.09742229, 1, 0.145098, 0, 1,
-1.939147, -0.4593335, -2.123917, 1, 0.1490196, 0, 1,
-1.883023, -1.012218, -1.80177, 1, 0.1568628, 0, 1,
-1.87366, 0.7742891, -2.953365, 1, 0.1607843, 0, 1,
-1.872946, -1.10934, -2.043797, 1, 0.1686275, 0, 1,
-1.832573, 1.349957, -0.434679, 1, 0.172549, 0, 1,
-1.817252, 1.25077, -1.4565, 1, 0.1803922, 0, 1,
-1.814448, -1.979991, -3.693103, 1, 0.1843137, 0, 1,
-1.797079, 0.6007475, -1.32117, 1, 0.1921569, 0, 1,
-1.762951, 1.449316, -0.9927802, 1, 0.1960784, 0, 1,
-1.755969, 1.394458, 0.7721952, 1, 0.2039216, 0, 1,
-1.746384, 0.1963989, -2.610354, 1, 0.2117647, 0, 1,
-1.739351, -0.8041728, -2.220414, 1, 0.2156863, 0, 1,
-1.73266, 1.796388, -1.586915, 1, 0.2235294, 0, 1,
-1.72829, 0.3288182, -1.288996, 1, 0.227451, 0, 1,
-1.715007, -1.892002, -3.898921, 1, 0.2352941, 0, 1,
-1.701055, -0.8620284, -1.102785, 1, 0.2392157, 0, 1,
-1.691272, 0.350128, -1.369451, 1, 0.2470588, 0, 1,
-1.691129, -1.929234, -1.685972, 1, 0.2509804, 0, 1,
-1.672838, 0.1148459, -2.995777, 1, 0.2588235, 0, 1,
-1.665042, -0.4581075, -0.3812639, 1, 0.2627451, 0, 1,
-1.653743, -0.5905946, -0.8891913, 1, 0.2705882, 0, 1,
-1.643119, 0.1835701, -0.7969273, 1, 0.2745098, 0, 1,
-1.630707, -0.3396685, -3.397895, 1, 0.282353, 0, 1,
-1.620998, 0.5071672, -1.652418, 1, 0.2862745, 0, 1,
-1.614938, -1.10341, -2.332837, 1, 0.2941177, 0, 1,
-1.613374, -0.6692991, -0.9197632, 1, 0.3019608, 0, 1,
-1.595786, -0.05478849, -2.59367, 1, 0.3058824, 0, 1,
-1.592807, 0.9613001, -0.3756363, 1, 0.3137255, 0, 1,
-1.576904, -1.155895, -1.913514, 1, 0.3176471, 0, 1,
-1.573424, 0.1930471, -1.649807, 1, 0.3254902, 0, 1,
-1.564994, -0.3541898, -3.744786, 1, 0.3294118, 0, 1,
-1.564994, 1.571308, -1.997891, 1, 0.3372549, 0, 1,
-1.561552, 0.8342904, -0.3613344, 1, 0.3411765, 0, 1,
-1.549592, -0.8214362, -2.685491, 1, 0.3490196, 0, 1,
-1.537741, -0.3715594, -3.228657, 1, 0.3529412, 0, 1,
-1.518954, -0.1762135, -4.326246, 1, 0.3607843, 0, 1,
-1.490735, -0.6510834, -2.240895, 1, 0.3647059, 0, 1,
-1.48616, 0.6919045, -1.4531, 1, 0.372549, 0, 1,
-1.484884, 0.8996823, -0.421918, 1, 0.3764706, 0, 1,
-1.48482, -0.352603, -0.7726633, 1, 0.3843137, 0, 1,
-1.481447, 0.263267, -2.251271, 1, 0.3882353, 0, 1,
-1.480847, 1.584337, 0.9909313, 1, 0.3960784, 0, 1,
-1.48076, -0.3983325, -0.7113837, 1, 0.4039216, 0, 1,
-1.479265, -0.2210679, -1.302231, 1, 0.4078431, 0, 1,
-1.478447, -0.3101448, -2.539036, 1, 0.4156863, 0, 1,
-1.466981, -0.004921495, 1.729367, 1, 0.4196078, 0, 1,
-1.460759, 0.8270346, -3.558831, 1, 0.427451, 0, 1,
-1.452267, -1.001059, -1.53299, 1, 0.4313726, 0, 1,
-1.446282, -0.597002, -3.554079, 1, 0.4392157, 0, 1,
-1.44042, -0.1231174, 0.04335089, 1, 0.4431373, 0, 1,
-1.422322, 1.33353, -1.71625, 1, 0.4509804, 0, 1,
-1.41762, 0.2171351, -1.397442, 1, 0.454902, 0, 1,
-1.406812, 0.9724799, -0.5800303, 1, 0.4627451, 0, 1,
-1.404597, 1.339616, 0.3621266, 1, 0.4666667, 0, 1,
-1.402527, 0.1264506, -0.9537634, 1, 0.4745098, 0, 1,
-1.390767, -0.7315846, -2.741923, 1, 0.4784314, 0, 1,
-1.382937, -0.2507206, -3.287705, 1, 0.4862745, 0, 1,
-1.375132, 0.5467193, -1.435851, 1, 0.4901961, 0, 1,
-1.371075, -1.029847, -0.6876367, 1, 0.4980392, 0, 1,
-1.363567, 0.8540713, -0.4770382, 1, 0.5058824, 0, 1,
-1.361044, -0.1520122, -1.873125, 1, 0.509804, 0, 1,
-1.350341, -1.065833, -2.391403, 1, 0.5176471, 0, 1,
-1.347359, 0.7279164, -1.199051, 1, 0.5215687, 0, 1,
-1.340313, -0.7366573, -2.640126, 1, 0.5294118, 0, 1,
-1.33446, -1.37287, -0.9871505, 1, 0.5333334, 0, 1,
-1.334366, 0.7421149, -1.324338, 1, 0.5411765, 0, 1,
-1.329863, -0.9805155, -1.349677, 1, 0.5450981, 0, 1,
-1.322761, 0.6357915, -0.2805154, 1, 0.5529412, 0, 1,
-1.30826, 0.5557526, -1.075338, 1, 0.5568628, 0, 1,
-1.305727, 0.5469723, -1.645884, 1, 0.5647059, 0, 1,
-1.296647, -2.114373, -3.203747, 1, 0.5686275, 0, 1,
-1.290517, 0.3669338, -0.6407496, 1, 0.5764706, 0, 1,
-1.289338, -0.09388096, -1.564291, 1, 0.5803922, 0, 1,
-1.284797, -1.303547, -1.349209, 1, 0.5882353, 0, 1,
-1.28293, 2.328794, -0.7025065, 1, 0.5921569, 0, 1,
-1.282776, -0.4061493, -1.984859, 1, 0.6, 0, 1,
-1.261864, 1.069618, -0.987977, 1, 0.6078432, 0, 1,
-1.25262, -0.3100631, -1.905488, 1, 0.6117647, 0, 1,
-1.251149, 0.9261725, -1.012211, 1, 0.6196079, 0, 1,
-1.249763, -0.009924361, -1.127566, 1, 0.6235294, 0, 1,
-1.24612, 0.1063442, -1.208048, 1, 0.6313726, 0, 1,
-1.238389, 1.878013, 0.7647338, 1, 0.6352941, 0, 1,
-1.202448, -0.3267046, -0.6080843, 1, 0.6431373, 0, 1,
-1.198333, -0.2657089, -2.851791, 1, 0.6470588, 0, 1,
-1.19625, -0.1424355, -1.327162, 1, 0.654902, 0, 1,
-1.194849, 2.098833, -0.7669794, 1, 0.6588235, 0, 1,
-1.193881, 0.5036109, -0.8726026, 1, 0.6666667, 0, 1,
-1.187241, 2.3935, -1.382937, 1, 0.6705883, 0, 1,
-1.177318, 0.01379385, -2.248533, 1, 0.6784314, 0, 1,
-1.17537, 1.036198, -0.7645493, 1, 0.682353, 0, 1,
-1.171071, 1.129044, -0.841529, 1, 0.6901961, 0, 1,
-1.161125, -1.338631, -2.008014, 1, 0.6941177, 0, 1,
-1.161002, -0.6037528, -3.786629, 1, 0.7019608, 0, 1,
-1.156863, -1.748707, -2.109129, 1, 0.7098039, 0, 1,
-1.156195, -0.6814907, -2.613523, 1, 0.7137255, 0, 1,
-1.154618, -0.4949961, -1.649912, 1, 0.7215686, 0, 1,
-1.14896, 0.761279, -0.8596308, 1, 0.7254902, 0, 1,
-1.147972, -0.719716, 0.6934264, 1, 0.7333333, 0, 1,
-1.145495, 1.682188, -1.794597, 1, 0.7372549, 0, 1,
-1.13703, -1.337472, -0.4654492, 1, 0.7450981, 0, 1,
-1.128436, 0.1966473, -0.7513338, 1, 0.7490196, 0, 1,
-1.124564, -0.006075931, -0.6835518, 1, 0.7568628, 0, 1,
-1.122028, 0.6960306, -3.301779, 1, 0.7607843, 0, 1,
-1.114324, 0.5760348, -3.287089, 1, 0.7686275, 0, 1,
-1.113259, -0.9034685, -1.50969, 1, 0.772549, 0, 1,
-1.100506, -0.9302539, -1.243555, 1, 0.7803922, 0, 1,
-1.099168, 1.485018, -2.331249, 1, 0.7843137, 0, 1,
-1.097185, 0.9862267, -0.8871052, 1, 0.7921569, 0, 1,
-1.097101, -1.047665, -1.000936, 1, 0.7960784, 0, 1,
-1.095586, -1.503783, -3.004276, 1, 0.8039216, 0, 1,
-1.092367, 0.9026858, -0.1629865, 1, 0.8117647, 0, 1,
-1.09033, 1.300042, -0.3075654, 1, 0.8156863, 0, 1,
-1.089226, -0.02597801, -1.317607, 1, 0.8235294, 0, 1,
-1.088751, -0.6875532, -2.795749, 1, 0.827451, 0, 1,
-1.084837, -0.6721402, -2.202016, 1, 0.8352941, 0, 1,
-1.07978, 0.2754669, -2.371474, 1, 0.8392157, 0, 1,
-1.075284, -0.3383862, -1.352287, 1, 0.8470588, 0, 1,
-1.072443, 0.3933546, -0.7122287, 1, 0.8509804, 0, 1,
-1.06903, 0.03038616, -0.3885272, 1, 0.8588235, 0, 1,
-1.066011, -1.020722, -2.920053, 1, 0.8627451, 0, 1,
-1.064196, -0.2250202, -1.794626, 1, 0.8705882, 0, 1,
-1.061831, 0.3887896, -1.426305, 1, 0.8745098, 0, 1,
-1.060299, -1.005985, -1.045857, 1, 0.8823529, 0, 1,
-1.060208, -0.2469202, -0.9647824, 1, 0.8862745, 0, 1,
-1.056194, -0.3469459, -1.516449, 1, 0.8941177, 0, 1,
-1.052028, -0.08296282, -1.764115, 1, 0.8980392, 0, 1,
-1.050426, 0.5883417, -0.8083015, 1, 0.9058824, 0, 1,
-1.04938, -0.8698673, -3.17329, 1, 0.9137255, 0, 1,
-1.039709, -0.6562321, -4.123914, 1, 0.9176471, 0, 1,
-1.034622, -1.79603, -1.851243, 1, 0.9254902, 0, 1,
-1.032952, -0.1741811, 0.9493779, 1, 0.9294118, 0, 1,
-1.029687, -1.716072, -1.540869, 1, 0.9372549, 0, 1,
-1.024534, 0.9481501, -3.395772, 1, 0.9411765, 0, 1,
-1.02161, -0.4863919, -2.167622, 1, 0.9490196, 0, 1,
-1.0203, -1.770703, -2.844373, 1, 0.9529412, 0, 1,
-1.018811, 0.009281358, -1.364409, 1, 0.9607843, 0, 1,
-1.016522, -0.7324688, -2.533229, 1, 0.9647059, 0, 1,
-1.016513, -1.121537, -3.289422, 1, 0.972549, 0, 1,
-1.012891, 0.7659111, -0.4584944, 1, 0.9764706, 0, 1,
-1.006996, 1.20235, 0.7233816, 1, 0.9843137, 0, 1,
-0.9986277, 1.382575, -0.2509591, 1, 0.9882353, 0, 1,
-0.9934616, 1.042706, -0.6268966, 1, 0.9960784, 0, 1,
-0.9851864, -0.9985476, -2.631254, 0.9960784, 1, 0, 1,
-0.9814426, 1.157648, -0.6287047, 0.9921569, 1, 0, 1,
-0.9783375, -2.409814, -3.207196, 0.9843137, 1, 0, 1,
-0.9780593, 0.1591482, -2.406972, 0.9803922, 1, 0, 1,
-0.9729297, 0.5764222, 1.265203, 0.972549, 1, 0, 1,
-0.968523, 1.789169, -0.5482298, 0.9686275, 1, 0, 1,
-0.9618907, 0.5574931, 0.5014403, 0.9607843, 1, 0, 1,
-0.954127, -1.950473, -3.401578, 0.9568627, 1, 0, 1,
-0.9512725, -0.4353089, -2.806744, 0.9490196, 1, 0, 1,
-0.9508948, -0.5582472, -1.823038, 0.945098, 1, 0, 1,
-0.9407328, -0.9474221, -2.427184, 0.9372549, 1, 0, 1,
-0.9358603, -1.555798, -3.318151, 0.9333333, 1, 0, 1,
-0.9351668, 0.1501503, -1.50706, 0.9254902, 1, 0, 1,
-0.9343679, 0.1129404, -2.69731, 0.9215686, 1, 0, 1,
-0.9263284, 0.02245277, -0.8757557, 0.9137255, 1, 0, 1,
-0.925551, -0.06790058, -0.38895, 0.9098039, 1, 0, 1,
-0.9251971, 0.2029899, 0.02586366, 0.9019608, 1, 0, 1,
-0.9174898, -0.02346268, -1.251679, 0.8941177, 1, 0, 1,
-0.908573, -0.0703024, -2.788611, 0.8901961, 1, 0, 1,
-0.9058993, -0.09644402, -0.4739985, 0.8823529, 1, 0, 1,
-0.8986554, -1.05779, -1.47348, 0.8784314, 1, 0, 1,
-0.8980373, -0.1585218, -1.124304, 0.8705882, 1, 0, 1,
-0.8962795, 2.253484, -0.6226495, 0.8666667, 1, 0, 1,
-0.8888709, -1.134843, -3.452786, 0.8588235, 1, 0, 1,
-0.8874653, -0.7153271, -1.344182, 0.854902, 1, 0, 1,
-0.8845633, -0.77504, -1.080911, 0.8470588, 1, 0, 1,
-0.8813962, 0.4356369, -1.51971, 0.8431373, 1, 0, 1,
-0.8788612, -0.9857831, -0.8492958, 0.8352941, 1, 0, 1,
-0.8775077, 0.5096352, -0.8630127, 0.8313726, 1, 0, 1,
-0.8755549, -0.442233, -2.525032, 0.8235294, 1, 0, 1,
-0.8750402, -0.1223326, -1.816445, 0.8196079, 1, 0, 1,
-0.8742191, 1.249568, -0.2282611, 0.8117647, 1, 0, 1,
-0.8721435, -0.1928424, -1.012164, 0.8078431, 1, 0, 1,
-0.8708336, -0.05672159, -2.87386, 0.8, 1, 0, 1,
-0.8705685, -0.5097439, -1.602554, 0.7921569, 1, 0, 1,
-0.8683182, -2.983428, -2.400922, 0.7882353, 1, 0, 1,
-0.8667974, -2.426542, -2.872041, 0.7803922, 1, 0, 1,
-0.8659288, 0.1353235, -1.385226, 0.7764706, 1, 0, 1,
-0.8658308, -0.3518978, -1.191339, 0.7686275, 1, 0, 1,
-0.8644192, 1.928037, 1.314586, 0.7647059, 1, 0, 1,
-0.8618382, 0.9747603, -0.9863682, 0.7568628, 1, 0, 1,
-0.8618219, 0.9781004, 0.3936244, 0.7529412, 1, 0, 1,
-0.8607312, -0.6336508, -0.4456601, 0.7450981, 1, 0, 1,
-0.8603469, -0.3599088, -1.671452, 0.7411765, 1, 0, 1,
-0.8551357, 0.8758969, -1.147991, 0.7333333, 1, 0, 1,
-0.8533764, 0.3448913, 0.6243373, 0.7294118, 1, 0, 1,
-0.8499645, -0.394842, 0.1033326, 0.7215686, 1, 0, 1,
-0.8494933, 1.102313, -0.6247243, 0.7176471, 1, 0, 1,
-0.8483739, -0.5180935, -1.700968, 0.7098039, 1, 0, 1,
-0.8461444, 0.8107218, -1.396827, 0.7058824, 1, 0, 1,
-0.8437587, -0.501994, -1.194252, 0.6980392, 1, 0, 1,
-0.8427774, 0.3679796, 0.2159763, 0.6901961, 1, 0, 1,
-0.8424391, 0.1632762, -0.4449545, 0.6862745, 1, 0, 1,
-0.8382843, 0.09355641, -1.717233, 0.6784314, 1, 0, 1,
-0.8362184, -0.5160533, -1.707857, 0.6745098, 1, 0, 1,
-0.8335881, -0.001895555, -0.8557539, 0.6666667, 1, 0, 1,
-0.8323483, 1.002325, -0.6651673, 0.6627451, 1, 0, 1,
-0.8308387, 1.694836, 0.2829088, 0.654902, 1, 0, 1,
-0.822282, 0.1723072, -1.351752, 0.6509804, 1, 0, 1,
-0.8215333, -1.652942, -3.019359, 0.6431373, 1, 0, 1,
-0.8207026, -0.3755797, -2.199638, 0.6392157, 1, 0, 1,
-0.8201444, 1.521306, 0.003598295, 0.6313726, 1, 0, 1,
-0.8135139, 0.4249992, 0.2532932, 0.627451, 1, 0, 1,
-0.8109133, 0.8091793, 0.4818197, 0.6196079, 1, 0, 1,
-0.8069991, -0.07017443, -0.9105873, 0.6156863, 1, 0, 1,
-0.8015223, -0.09620796, -1.950683, 0.6078432, 1, 0, 1,
-0.8003439, 0.08822766, -1.961705, 0.6039216, 1, 0, 1,
-0.795198, -1.365822, -4.642862, 0.5960785, 1, 0, 1,
-0.7938228, 0.3133967, -0.4136613, 0.5882353, 1, 0, 1,
-0.7923818, -0.2778886, -2.04639, 0.5843138, 1, 0, 1,
-0.7878998, 0.6109073, -1.060788, 0.5764706, 1, 0, 1,
-0.7833602, -1.422563, -3.234229, 0.572549, 1, 0, 1,
-0.7821918, 0.6283656, -1.404014, 0.5647059, 1, 0, 1,
-0.7802954, -0.3947972, -1.958801, 0.5607843, 1, 0, 1,
-0.7765075, -1.069113, -2.144116, 0.5529412, 1, 0, 1,
-0.773391, -0.04218461, -1.837982, 0.5490196, 1, 0, 1,
-0.7693501, -0.4324188, 0.1036995, 0.5411765, 1, 0, 1,
-0.767249, -0.4540311, -2.88147, 0.5372549, 1, 0, 1,
-0.7652647, 0.4842829, -0.8967806, 0.5294118, 1, 0, 1,
-0.76503, -0.4345523, -1.349085, 0.5254902, 1, 0, 1,
-0.7565662, 1.527342, 0.8852476, 0.5176471, 1, 0, 1,
-0.7503052, 0.1716092, -0.597118, 0.5137255, 1, 0, 1,
-0.7478945, -0.2300094, -2.049052, 0.5058824, 1, 0, 1,
-0.7476444, -0.7704709, -2.556076, 0.5019608, 1, 0, 1,
-0.7473848, 0.5937837, -2.53255, 0.4941176, 1, 0, 1,
-0.7370557, 0.725619, -1.300017, 0.4862745, 1, 0, 1,
-0.7317457, 0.5394497, -1.435912, 0.4823529, 1, 0, 1,
-0.7305592, -0.7544909, -1.911848, 0.4745098, 1, 0, 1,
-0.7274592, -0.6408734, -1.940928, 0.4705882, 1, 0, 1,
-0.7252151, 0.7642953, 0.1647679, 0.4627451, 1, 0, 1,
-0.7209123, -0.1813233, 0.4321913, 0.4588235, 1, 0, 1,
-0.7180043, 1.08936, -0.65406, 0.4509804, 1, 0, 1,
-0.7136247, 1.369966, -1.353277, 0.4470588, 1, 0, 1,
-0.7127748, -0.6447569, -3.531864, 0.4392157, 1, 0, 1,
-0.7126572, -0.9242771, -3.908799, 0.4352941, 1, 0, 1,
-0.7104011, -0.3047831, -1.382033, 0.427451, 1, 0, 1,
-0.7099445, -0.8719103, -1.95699, 0.4235294, 1, 0, 1,
-0.7093678, -0.7389257, -2.694329, 0.4156863, 1, 0, 1,
-0.7078664, 1.255519, 0.4860241, 0.4117647, 1, 0, 1,
-0.7045223, -1.079258, -3.286963, 0.4039216, 1, 0, 1,
-0.7016568, 1.378788, 0.673241, 0.3960784, 1, 0, 1,
-0.6968319, -0.5543078, -1.386412, 0.3921569, 1, 0, 1,
-0.6953294, -0.5316821, -1.988214, 0.3843137, 1, 0, 1,
-0.6950624, 0.1646019, -2.661726, 0.3803922, 1, 0, 1,
-0.6911003, 1.341339, -1.068354, 0.372549, 1, 0, 1,
-0.6910844, 1.161879, -0.2894889, 0.3686275, 1, 0, 1,
-0.6856506, 0.330166, -0.06008529, 0.3607843, 1, 0, 1,
-0.6777397, 0.5957134, -3.472206, 0.3568628, 1, 0, 1,
-0.6720148, 1.615464, 1.426573, 0.3490196, 1, 0, 1,
-0.6709984, 1.843419, -1.127494, 0.345098, 1, 0, 1,
-0.6682379, 0.4395349, -1.326481, 0.3372549, 1, 0, 1,
-0.6672787, 0.7659801, 0.2998126, 0.3333333, 1, 0, 1,
-0.6662104, 0.9312769, -0.05283634, 0.3254902, 1, 0, 1,
-0.6621555, -0.9960738, -2.996284, 0.3215686, 1, 0, 1,
-0.6564159, -0.2140934, 0.06405808, 0.3137255, 1, 0, 1,
-0.6488908, -0.1032995, -1.322301, 0.3098039, 1, 0, 1,
-0.6427696, -1.628215, -3.814603, 0.3019608, 1, 0, 1,
-0.640525, 1.31087, 0.4180016, 0.2941177, 1, 0, 1,
-0.6302115, -0.05460911, -2.861973, 0.2901961, 1, 0, 1,
-0.6285374, 0.5392437, -0.4573077, 0.282353, 1, 0, 1,
-0.6278964, 0.1518166, -0.8179414, 0.2784314, 1, 0, 1,
-0.6265274, 0.9769185, -0.9675255, 0.2705882, 1, 0, 1,
-0.6233053, 0.731926, 0.6290055, 0.2666667, 1, 0, 1,
-0.6204001, -2.754896, -2.787138, 0.2588235, 1, 0, 1,
-0.6153117, -1.063406, -2.010098, 0.254902, 1, 0, 1,
-0.5959219, -0.5098013, -3.274716, 0.2470588, 1, 0, 1,
-0.5951542, -0.6795461, -1.111203, 0.2431373, 1, 0, 1,
-0.5939676, -0.6401878, -2.916453, 0.2352941, 1, 0, 1,
-0.5938236, -0.554352, -1.774021, 0.2313726, 1, 0, 1,
-0.5916612, -1.161779, -3.558714, 0.2235294, 1, 0, 1,
-0.5898162, 0.4852544, -0.6213485, 0.2196078, 1, 0, 1,
-0.5890885, -0.5025811, -2.045884, 0.2117647, 1, 0, 1,
-0.5860934, 0.9061621, -0.03614581, 0.2078431, 1, 0, 1,
-0.5857406, 0.2034196, -0.3931642, 0.2, 1, 0, 1,
-0.5791304, -0.03075692, -2.462695, 0.1921569, 1, 0, 1,
-0.5786971, 0.8537552, 1.472927, 0.1882353, 1, 0, 1,
-0.575129, 1.712999, 2.358839, 0.1803922, 1, 0, 1,
-0.5709748, 0.3785799, 0.7862408, 0.1764706, 1, 0, 1,
-0.5671831, -1.52588, -3.355055, 0.1686275, 1, 0, 1,
-0.5630344, 0.1460879, -0.1828963, 0.1647059, 1, 0, 1,
-0.5586389, 0.8450465, -1.778567, 0.1568628, 1, 0, 1,
-0.558175, 0.8484163, -2.341906, 0.1529412, 1, 0, 1,
-0.5581618, 0.1384771, -0.9260647, 0.145098, 1, 0, 1,
-0.5546637, -1.288335, -2.183637, 0.1411765, 1, 0, 1,
-0.5527859, 1.587041, -0.7339298, 0.1333333, 1, 0, 1,
-0.5522207, 0.5343224, -0.06053974, 0.1294118, 1, 0, 1,
-0.5493872, 1.168628, 1.091024, 0.1215686, 1, 0, 1,
-0.5473804, -0.5216776, -2.730168, 0.1176471, 1, 0, 1,
-0.5460052, -1.037135, -3.451477, 0.1098039, 1, 0, 1,
-0.5453235, -0.830367, -0.6652415, 0.1058824, 1, 0, 1,
-0.5411118, 0.2078864, -1.816068, 0.09803922, 1, 0, 1,
-0.5383043, -0.4134023, -2.424117, 0.09019608, 1, 0, 1,
-0.5375562, -1.411136, -2.624869, 0.08627451, 1, 0, 1,
-0.5369892, -0.03366299, -1.278941, 0.07843138, 1, 0, 1,
-0.5340306, 0.193672, -0.6455918, 0.07450981, 1, 0, 1,
-0.5324808, -1.517566, -3.608935, 0.06666667, 1, 0, 1,
-0.5271986, -0.4138557, -2.103981, 0.0627451, 1, 0, 1,
-0.5252175, 0.1775606, 0.2175138, 0.05490196, 1, 0, 1,
-0.5238498, 0.3773441, -2.858625, 0.05098039, 1, 0, 1,
-0.5182639, 0.6827605, -0.6310791, 0.04313726, 1, 0, 1,
-0.5168589, -0.212458, -2.530466, 0.03921569, 1, 0, 1,
-0.516181, 0.6830084, -1.3314, 0.03137255, 1, 0, 1,
-0.5124436, 0.168904, -1.198342, 0.02745098, 1, 0, 1,
-0.507159, -0.2328698, -0.8721, 0.01960784, 1, 0, 1,
-0.5069534, -1.159272, -2.389129, 0.01568628, 1, 0, 1,
-0.5041699, 0.8337139, 1.549047, 0.007843138, 1, 0, 1,
-0.487065, 1.036376, -1.519518, 0.003921569, 1, 0, 1,
-0.4819325, 1.134472, -1.590225, 0, 1, 0.003921569, 1,
-0.4804629, 0.426275, 1.057337, 0, 1, 0.01176471, 1,
-0.4796862, -0.1084636, -1.930223, 0, 1, 0.01568628, 1,
-0.4782309, 0.822156, -0.3634548, 0, 1, 0.02352941, 1,
-0.4780716, 0.3971093, -2.207882, 0, 1, 0.02745098, 1,
-0.4775018, -1.871623, -4.821996, 0, 1, 0.03529412, 1,
-0.4728436, -0.1279126, -2.130212, 0, 1, 0.03921569, 1,
-0.4650044, -0.2619231, -0.3678786, 0, 1, 0.04705882, 1,
-0.4642521, -0.03756187, -0.4416825, 0, 1, 0.05098039, 1,
-0.4642501, 0.7592316, -0.282674, 0, 1, 0.05882353, 1,
-0.4547194, 1.588466, -0.4829036, 0, 1, 0.0627451, 1,
-0.453794, 0.5567029, -0.08425651, 0, 1, 0.07058824, 1,
-0.4394934, 0.1447436, -0.9245905, 0, 1, 0.07450981, 1,
-0.4364173, -0.5525795, -2.872203, 0, 1, 0.08235294, 1,
-0.4361949, -1.030541, -3.563124, 0, 1, 0.08627451, 1,
-0.4356747, 1.315747, 1.736822, 0, 1, 0.09411765, 1,
-0.4290994, 0.3712132, 0.1019133, 0, 1, 0.1019608, 1,
-0.4268345, 1.198114, -1.0979, 0, 1, 0.1058824, 1,
-0.4245198, 0.9541732, 0.4948533, 0, 1, 0.1137255, 1,
-0.4225859, -0.3172887, -3.486846, 0, 1, 0.1176471, 1,
-0.4166261, -0.7240829, -1.185763, 0, 1, 0.1254902, 1,
-0.414512, -1.530757, -4.023534, 0, 1, 0.1294118, 1,
-0.4136124, 0.1828322, -2.445383, 0, 1, 0.1372549, 1,
-0.4106934, 1.298005, -0.4793144, 0, 1, 0.1411765, 1,
-0.4092132, -0.7124207, -3.108502, 0, 1, 0.1490196, 1,
-0.407213, 1.82948, 0.08016082, 0, 1, 0.1529412, 1,
-0.4034174, 1.294532, -1.951889, 0, 1, 0.1607843, 1,
-0.4024652, 0.5045123, -0.7878314, 0, 1, 0.1647059, 1,
-0.400775, -0.2377025, -3.542604, 0, 1, 0.172549, 1,
-0.3999952, -0.3985806, -2.650312, 0, 1, 0.1764706, 1,
-0.3978541, 0.6738986, -0.04795099, 0, 1, 0.1843137, 1,
-0.3964542, -1.183829, -1.464378, 0, 1, 0.1882353, 1,
-0.3929603, -1.312876, -3.274081, 0, 1, 0.1960784, 1,
-0.3888514, 0.6143537, -0.1402768, 0, 1, 0.2039216, 1,
-0.3884578, -0.552887, -2.648956, 0, 1, 0.2078431, 1,
-0.3866612, -1.456262, -2.120907, 0, 1, 0.2156863, 1,
-0.3815747, 0.3054358, -1.754033, 0, 1, 0.2196078, 1,
-0.3799027, -2.451502, -5.865497, 0, 1, 0.227451, 1,
-0.3789389, -1.814001, -3.205024, 0, 1, 0.2313726, 1,
-0.3778566, 0.3274013, -0.8701135, 0, 1, 0.2392157, 1,
-0.3631692, 1.078965, 0.2573864, 0, 1, 0.2431373, 1,
-0.3600504, -0.8491179, -1.726896, 0, 1, 0.2509804, 1,
-0.3596737, -0.1324097, 0.1611866, 0, 1, 0.254902, 1,
-0.3543494, 0.8524887, -0.4473968, 0, 1, 0.2627451, 1,
-0.3538728, -0.5814868, -2.954398, 0, 1, 0.2666667, 1,
-0.353275, -1.605838, -4.462357, 0, 1, 0.2745098, 1,
-0.3483042, -0.9182441, -1.481052, 0, 1, 0.2784314, 1,
-0.3424586, 0.6956712, 0.04354008, 0, 1, 0.2862745, 1,
-0.3413444, 0.8628982, 1.531703, 0, 1, 0.2901961, 1,
-0.3374294, -0.3980879, -0.5264181, 0, 1, 0.2980392, 1,
-0.3338315, -0.04065444, -2.77549, 0, 1, 0.3058824, 1,
-0.3304647, 0.1939926, 0.176319, 0, 1, 0.3098039, 1,
-0.3303248, -1.509524, -2.280867, 0, 1, 0.3176471, 1,
-0.3207157, 0.5912293, 0.9194518, 0, 1, 0.3215686, 1,
-0.3196145, -0.7642958, -3.066596, 0, 1, 0.3294118, 1,
-0.3188258, -0.7009662, -2.170865, 0, 1, 0.3333333, 1,
-0.3157299, 0.4083911, -0.787199, 0, 1, 0.3411765, 1,
-0.3106595, -0.4562987, -1.198565, 0, 1, 0.345098, 1,
-0.3017922, -0.4245499, -2.075667, 0, 1, 0.3529412, 1,
-0.3013368, 0.8861691, -0.5002289, 0, 1, 0.3568628, 1,
-0.2943251, -1.237816, -2.178137, 0, 1, 0.3647059, 1,
-0.2932386, 0.171288, 0.9977877, 0, 1, 0.3686275, 1,
-0.2921027, -0.7897275, -3.392562, 0, 1, 0.3764706, 1,
-0.2878904, -1.779736, -3.446833, 0, 1, 0.3803922, 1,
-0.2840351, -1.402895, -2.749844, 0, 1, 0.3882353, 1,
-0.2834232, -0.5855851, -3.407364, 0, 1, 0.3921569, 1,
-0.2817242, -1.302079, -2.469096, 0, 1, 0.4, 1,
-0.2810509, -0.6080049, -5.761539, 0, 1, 0.4078431, 1,
-0.2791215, 0.2939023, -0.5186828, 0, 1, 0.4117647, 1,
-0.2730386, 0.5526779, 1.150183, 0, 1, 0.4196078, 1,
-0.272853, -0.7615941, -2.104412, 0, 1, 0.4235294, 1,
-0.2728267, -0.7227409, -1.868067, 0, 1, 0.4313726, 1,
-0.2706974, 1.667633, -0.4641383, 0, 1, 0.4352941, 1,
-0.2600607, -0.3106271, -3.771311, 0, 1, 0.4431373, 1,
-0.2495059, 0.3349384, 0.1536528, 0, 1, 0.4470588, 1,
-0.2482859, -0.2153915, -0.313879, 0, 1, 0.454902, 1,
-0.2475691, 0.6530023, -1.073992, 0, 1, 0.4588235, 1,
-0.2440848, -0.1929602, -2.210298, 0, 1, 0.4666667, 1,
-0.2437058, -2.302689, -2.656407, 0, 1, 0.4705882, 1,
-0.2412793, -0.1945943, -2.687893, 0, 1, 0.4784314, 1,
-0.2391686, -1.021366, -3.025707, 0, 1, 0.4823529, 1,
-0.2377181, -1.30914, -2.531907, 0, 1, 0.4901961, 1,
-0.2363787, -0.08983096, -2.264187, 0, 1, 0.4941176, 1,
-0.2354416, 1.447224, 0.3141776, 0, 1, 0.5019608, 1,
-0.2296418, 0.330824, -1.729177, 0, 1, 0.509804, 1,
-0.2282687, 1.035481, 1.142253, 0, 1, 0.5137255, 1,
-0.2278061, -0.1326249, -2.478096, 0, 1, 0.5215687, 1,
-0.2251641, -1.483904, -3.157808, 0, 1, 0.5254902, 1,
-0.2213013, 1.52916, 0.7258584, 0, 1, 0.5333334, 1,
-0.2092313, -0.9526193, -4.288628, 0, 1, 0.5372549, 1,
-0.2090743, -1.113959, -3.525944, 0, 1, 0.5450981, 1,
-0.208717, -0.6592555, -3.45976, 0, 1, 0.5490196, 1,
-0.2082816, -1.222577, -3.118053, 0, 1, 0.5568628, 1,
-0.2079753, 1.297038, 0.1314298, 0, 1, 0.5607843, 1,
-0.2070803, 0.6239932, -1.614891, 0, 1, 0.5686275, 1,
-0.2052215, 1.157234, -0.2961439, 0, 1, 0.572549, 1,
-0.2046133, -1.659247, -3.948447, 0, 1, 0.5803922, 1,
-0.2039959, 1.00232, -0.2027232, 0, 1, 0.5843138, 1,
-0.2011465, -0.05536579, -2.808631, 0, 1, 0.5921569, 1,
-0.2000377, 0.3637158, -1.684547, 0, 1, 0.5960785, 1,
-0.1995538, -0.9258125, -2.016831, 0, 1, 0.6039216, 1,
-0.1983811, 0.8304939, -0.4825734, 0, 1, 0.6117647, 1,
-0.1940561, 0.6048356, -0.1639421, 0, 1, 0.6156863, 1,
-0.1906327, -0.4338307, -1.358524, 0, 1, 0.6235294, 1,
-0.1879282, -0.7017897, -2.230173, 0, 1, 0.627451, 1,
-0.1862767, -0.7615428, -1.951512, 0, 1, 0.6352941, 1,
-0.17798, -0.1887372, -1.708998, 0, 1, 0.6392157, 1,
-0.1751984, 0.3936141, -0.5848919, 0, 1, 0.6470588, 1,
-0.1712944, -0.6285663, -3.111444, 0, 1, 0.6509804, 1,
-0.1712369, -1.628662, -2.123457, 0, 1, 0.6588235, 1,
-0.1673587, -0.5039812, -2.426635, 0, 1, 0.6627451, 1,
-0.1595114, -0.3050947, -1.474325, 0, 1, 0.6705883, 1,
-0.1594087, 0.4560248, 2.358409, 0, 1, 0.6745098, 1,
-0.1571255, 0.003918224, -0.9174394, 0, 1, 0.682353, 1,
-0.1565215, -1.286343, -2.847426, 0, 1, 0.6862745, 1,
-0.1563215, 0.1364167, 0.1681696, 0, 1, 0.6941177, 1,
-0.1518733, 0.2119547, -0.2729361, 0, 1, 0.7019608, 1,
-0.1418926, -0.3712736, -2.281903, 0, 1, 0.7058824, 1,
-0.139298, -0.09581485, -2.744191, 0, 1, 0.7137255, 1,
-0.1351311, -0.8521605, -1.928285, 0, 1, 0.7176471, 1,
-0.1349999, -0.6186957, -1.626109, 0, 1, 0.7254902, 1,
-0.1330155, 0.8760824, 1.157434, 0, 1, 0.7294118, 1,
-0.126066, -1.599158, -4.263633, 0, 1, 0.7372549, 1,
-0.1185268, -1.271052, -4.580613, 0, 1, 0.7411765, 1,
-0.1154412, -0.4219783, -2.925387, 0, 1, 0.7490196, 1,
-0.1116236, 2.771898, 0.92314, 0, 1, 0.7529412, 1,
-0.1098353, 0.4970748, 0.8840931, 0, 1, 0.7607843, 1,
-0.1088198, 0.6227527, 1.024827, 0, 1, 0.7647059, 1,
-0.1072417, -1.047241, -3.653164, 0, 1, 0.772549, 1,
-0.1024723, -0.1795161, -3.396992, 0, 1, 0.7764706, 1,
-0.1005033, -1.238879, -2.151893, 0, 1, 0.7843137, 1,
-0.09785062, -0.3501294, -3.17573, 0, 1, 0.7882353, 1,
-0.0943883, -0.1944948, -2.52418, 0, 1, 0.7960784, 1,
-0.09062164, 1.102181, -1.311667, 0, 1, 0.8039216, 1,
-0.08674627, 0.1343681, -0.4847853, 0, 1, 0.8078431, 1,
-0.08666742, -0.2884944, -3.663623, 0, 1, 0.8156863, 1,
-0.08528121, 2.157267, -2.447013, 0, 1, 0.8196079, 1,
-0.0850378, -0.8509849, -3.158133, 0, 1, 0.827451, 1,
-0.0845992, -2.422516, -4.393282, 0, 1, 0.8313726, 1,
-0.08459891, -0.1064481, -3.155816, 0, 1, 0.8392157, 1,
-0.08129084, 2.132267, -0.4428278, 0, 1, 0.8431373, 1,
-0.07834851, 0.01333448, -1.595962, 0, 1, 0.8509804, 1,
-0.07737796, 1.108965, -0.8299987, 0, 1, 0.854902, 1,
-0.07156576, -0.04066365, -3.0913, 0, 1, 0.8627451, 1,
-0.06921269, 0.6622638, -0.371049, 0, 1, 0.8666667, 1,
-0.06405859, 0.4294391, -0.749255, 0, 1, 0.8745098, 1,
-0.06139167, 1.424417, 0.6343237, 0, 1, 0.8784314, 1,
-0.05779935, 1.080254, 1.33259, 0, 1, 0.8862745, 1,
-0.05646507, -0.4251375, -2.516437, 0, 1, 0.8901961, 1,
-0.05608276, -1.335883, -2.839166, 0, 1, 0.8980392, 1,
-0.05314038, 0.3029405, -1.840038, 0, 1, 0.9058824, 1,
-0.05304336, -0.484923, -4.902449, 0, 1, 0.9098039, 1,
-0.05248269, 0.6151403, -0.8433955, 0, 1, 0.9176471, 1,
-0.05220621, -1.697078, -2.132942, 0, 1, 0.9215686, 1,
-0.04601171, 0.5937303, -0.1738223, 0, 1, 0.9294118, 1,
-0.04512529, 1.926721, 0.8507164, 0, 1, 0.9333333, 1,
-0.03867127, 1.756803, 0.3400692, 0, 1, 0.9411765, 1,
-0.03442322, -0.4524658, -3.975013, 0, 1, 0.945098, 1,
-0.02442658, -1.394999, -3.275768, 0, 1, 0.9529412, 1,
-0.02401529, -0.1252647, -3.420756, 0, 1, 0.9568627, 1,
-0.02188162, -0.8921284, -4.401852, 0, 1, 0.9647059, 1,
-0.02132586, -1.182431, -2.630354, 0, 1, 0.9686275, 1,
-0.0169413, 0.5279385, -1.127938, 0, 1, 0.9764706, 1,
-0.006164536, -0.4688673, -3.398392, 0, 1, 0.9803922, 1,
-0.002344412, 1.160563, 0.9289889, 0, 1, 0.9882353, 1,
0.001468462, -0.6423789, 4.596313, 0, 1, 0.9921569, 1,
0.00269006, -0.1739572, 2.812432, 0, 1, 1, 1,
0.00426359, -0.4149516, 2.749484, 0, 0.9921569, 1, 1,
0.009747538, 2.219509, -0.1157217, 0, 0.9882353, 1, 1,
0.01027102, -0.1495814, 2.72136, 0, 0.9803922, 1, 1,
0.01228548, 1.95669, 1.243878, 0, 0.9764706, 1, 1,
0.01502472, -0.5894531, 2.425406, 0, 0.9686275, 1, 1,
0.01592938, 2.754886, -0.006584377, 0, 0.9647059, 1, 1,
0.01945241, -0.7393934, 3.685452, 0, 0.9568627, 1, 1,
0.02457893, 0.4593684, 0.6492549, 0, 0.9529412, 1, 1,
0.02925389, 2.560721, -0.8653591, 0, 0.945098, 1, 1,
0.02998593, 0.2948965, 0.516996, 0, 0.9411765, 1, 1,
0.03203578, -0.2053108, 3.730675, 0, 0.9333333, 1, 1,
0.03543405, -0.1376174, 4.07296, 0, 0.9294118, 1, 1,
0.03668043, -1.451176, 0.7737685, 0, 0.9215686, 1, 1,
0.04114445, 2.043848, 0.7304252, 0, 0.9176471, 1, 1,
0.04745677, 0.2195524, 1.499494, 0, 0.9098039, 1, 1,
0.0512399, -1.258322, 1.913283, 0, 0.9058824, 1, 1,
0.05136636, -0.6448277, 3.5874, 0, 0.8980392, 1, 1,
0.05196297, 0.7291355, 0.2822949, 0, 0.8901961, 1, 1,
0.05419952, 0.2241127, -0.2935966, 0, 0.8862745, 1, 1,
0.05430797, -0.5872258, 4.43202, 0, 0.8784314, 1, 1,
0.0553381, -1.368062, 3.126523, 0, 0.8745098, 1, 1,
0.05705012, -1.264456, 4.95389, 0, 0.8666667, 1, 1,
0.05907358, 0.2624844, -0.8141231, 0, 0.8627451, 1, 1,
0.06198948, 0.3908479, -0.8299249, 0, 0.854902, 1, 1,
0.07256565, -0.5799925, 3.796845, 0, 0.8509804, 1, 1,
0.07422727, -0.1103175, 2.61305, 0, 0.8431373, 1, 1,
0.07743473, 1.114612, -1.331353, 0, 0.8392157, 1, 1,
0.07834523, -0.8276848, 2.349801, 0, 0.8313726, 1, 1,
0.07893583, -0.478225, 4.340355, 0, 0.827451, 1, 1,
0.07981816, 0.4088611, 0.09646315, 0, 0.8196079, 1, 1,
0.07982251, -0.5574528, 3.941017, 0, 0.8156863, 1, 1,
0.08026415, -0.3363134, 2.265754, 0, 0.8078431, 1, 1,
0.08253288, -0.4616462, 1.758332, 0, 0.8039216, 1, 1,
0.08876318, -0.6257305, 1.64119, 0, 0.7960784, 1, 1,
0.09423064, -0.5239899, 2.549132, 0, 0.7882353, 1, 1,
0.09672464, 1.902364, 1.948396, 0, 0.7843137, 1, 1,
0.09715267, -0.4730126, 2.705614, 0, 0.7764706, 1, 1,
0.09717182, -0.2100921, 2.486698, 0, 0.772549, 1, 1,
0.1015174, 0.9020721, -0.302896, 0, 0.7647059, 1, 1,
0.1017993, -1.040194, 2.779288, 0, 0.7607843, 1, 1,
0.1063961, -0.1566937, 1.798689, 0, 0.7529412, 1, 1,
0.1112116, 0.2781082, 1.919495, 0, 0.7490196, 1, 1,
0.1130517, 1.461053, -0.1866588, 0, 0.7411765, 1, 1,
0.1143349, 0.2961471, 1.276707, 0, 0.7372549, 1, 1,
0.1152266, 0.9284326, 0.6983889, 0, 0.7294118, 1, 1,
0.1177157, -0.6229168, 3.046804, 0, 0.7254902, 1, 1,
0.1180597, -0.1208169, 3.068133, 0, 0.7176471, 1, 1,
0.1248971, 0.7695463, -1.442589, 0, 0.7137255, 1, 1,
0.1268096, 0.8099075, -1.037015, 0, 0.7058824, 1, 1,
0.1273983, 0.2433867, 1.937806, 0, 0.6980392, 1, 1,
0.1287649, -0.1180198, 2.606686, 0, 0.6941177, 1, 1,
0.1320652, -0.2180936, 2.637538, 0, 0.6862745, 1, 1,
0.1351339, -0.7295666, 3.551809, 0, 0.682353, 1, 1,
0.1352176, -0.05322728, 1.199679, 0, 0.6745098, 1, 1,
0.1353998, -1.716845, 2.789468, 0, 0.6705883, 1, 1,
0.1355787, -0.1267072, 2.20897, 0, 0.6627451, 1, 1,
0.1355902, -0.3183018, 1.187864, 0, 0.6588235, 1, 1,
0.1371105, 1.445017, -0.8516704, 0, 0.6509804, 1, 1,
0.1386934, 1.426876, 0.6319534, 0, 0.6470588, 1, 1,
0.1526094, -0.2046325, 1.542408, 0, 0.6392157, 1, 1,
0.1529084, -0.5386847, 3.965857, 0, 0.6352941, 1, 1,
0.1533025, 0.3461272, -0.7794716, 0, 0.627451, 1, 1,
0.15578, 1.241857, 1.14659, 0, 0.6235294, 1, 1,
0.1560056, -0.4570931, 4.279165, 0, 0.6156863, 1, 1,
0.1566385, -0.3266047, 2.260679, 0, 0.6117647, 1, 1,
0.1589793, 0.04053995, -0.108533, 0, 0.6039216, 1, 1,
0.1592643, -0.3133811, 2.918396, 0, 0.5960785, 1, 1,
0.1613418, 0.3809462, 1.679371, 0, 0.5921569, 1, 1,
0.1637415, 0.28563, -0.2787868, 0, 0.5843138, 1, 1,
0.1651188, 0.04440921, 1.363013, 0, 0.5803922, 1, 1,
0.1702436, 0.6032258, -0.2495751, 0, 0.572549, 1, 1,
0.1733392, 0.5973008, -0.821448, 0, 0.5686275, 1, 1,
0.1742066, 2.281269, 0.8618104, 0, 0.5607843, 1, 1,
0.1766387, -1.658963, 3.556303, 0, 0.5568628, 1, 1,
0.1794551, 0.8165624, -0.7889639, 0, 0.5490196, 1, 1,
0.1866383, -1.948793, 2.747416, 0, 0.5450981, 1, 1,
0.1871247, -0.2423439, 3.473454, 0, 0.5372549, 1, 1,
0.188496, 1.018655, -0.8535678, 0, 0.5333334, 1, 1,
0.1891744, 1.300406, 0.7471889, 0, 0.5254902, 1, 1,
0.1918643, 1.657454, -0.3366552, 0, 0.5215687, 1, 1,
0.1984781, 0.4193586, -0.1973102, 0, 0.5137255, 1, 1,
0.2000268, 0.344228, 1.460711, 0, 0.509804, 1, 1,
0.2001008, 1.819103, -0.06750757, 0, 0.5019608, 1, 1,
0.2026443, 0.8006186, 0.1256561, 0, 0.4941176, 1, 1,
0.2029501, 0.3571981, 0.513982, 0, 0.4901961, 1, 1,
0.2033106, -0.736837, 1.551658, 0, 0.4823529, 1, 1,
0.2152767, -0.5340549, 2.425052, 0, 0.4784314, 1, 1,
0.2178827, 1.216866, 0.657882, 0, 0.4705882, 1, 1,
0.2186611, 0.1430474, 1.680415, 0, 0.4666667, 1, 1,
0.2261866, -0.0007112659, 0.5831712, 0, 0.4588235, 1, 1,
0.2265588, 1.50855, 1.110927, 0, 0.454902, 1, 1,
0.2296561, -0.9801111, 2.08533, 0, 0.4470588, 1, 1,
0.2336578, 0.1268842, -0.2595944, 0, 0.4431373, 1, 1,
0.2336881, 0.4069821, 0.2651769, 0, 0.4352941, 1, 1,
0.235695, 0.8123433, -0.8138477, 0, 0.4313726, 1, 1,
0.2369267, 0.1200914, 3.385958, 0, 0.4235294, 1, 1,
0.2407705, -1.022452, 1.870745, 0, 0.4196078, 1, 1,
0.2542385, -1.976445, 5.218521, 0, 0.4117647, 1, 1,
0.254265, -0.2088829, 3.008981, 0, 0.4078431, 1, 1,
0.2555565, 0.1263659, 2.056782, 0, 0.4, 1, 1,
0.2559814, -0.5687724, 3.477038, 0, 0.3921569, 1, 1,
0.2614573, -1.086042, 1.895518, 0, 0.3882353, 1, 1,
0.2633133, -0.4468163, 0.6574938, 0, 0.3803922, 1, 1,
0.2696766, -0.2732732, 2.640347, 0, 0.3764706, 1, 1,
0.2736464, -0.7955664, 2.461022, 0, 0.3686275, 1, 1,
0.2761987, -0.01641062, -0.198064, 0, 0.3647059, 1, 1,
0.280017, 1.599924, -0.2867753, 0, 0.3568628, 1, 1,
0.2806922, -0.2495706, 2.250308, 0, 0.3529412, 1, 1,
0.2833692, -0.8727027, 2.622776, 0, 0.345098, 1, 1,
0.2844294, 1.000704, 0.6839387, 0, 0.3411765, 1, 1,
0.2852134, -1.355551, 2.777892, 0, 0.3333333, 1, 1,
0.2871599, 0.823667, 1.118153, 0, 0.3294118, 1, 1,
0.2923045, 3.590436, -1.160335, 0, 0.3215686, 1, 1,
0.2929852, 0.7370625, -1.282243, 0, 0.3176471, 1, 1,
0.3005849, -0.6258255, 2.317692, 0, 0.3098039, 1, 1,
0.3023594, -0.514608, 1.470865, 0, 0.3058824, 1, 1,
0.3025236, -0.2377857, 1.646446, 0, 0.2980392, 1, 1,
0.3062894, -0.2013707, 1.635554, 0, 0.2901961, 1, 1,
0.3111607, -0.6208441, 3.436839, 0, 0.2862745, 1, 1,
0.3126908, -1.43713, 1.87234, 0, 0.2784314, 1, 1,
0.3165363, -0.1055793, 1.824319, 0, 0.2745098, 1, 1,
0.3205365, 0.4264597, -0.844024, 0, 0.2666667, 1, 1,
0.3219136, 0.009782438, 0.1878771, 0, 0.2627451, 1, 1,
0.3227201, -0.7521388, 1.507946, 0, 0.254902, 1, 1,
0.3281956, -0.2059219, 2.000175, 0, 0.2509804, 1, 1,
0.3314746, -0.5832114, 2.324329, 0, 0.2431373, 1, 1,
0.3344799, -1.593512, 2.435158, 0, 0.2392157, 1, 1,
0.3353101, 0.1727837, -0.1614308, 0, 0.2313726, 1, 1,
0.3394289, -0.3764452, 2.793085, 0, 0.227451, 1, 1,
0.3413743, 0.05789614, 1.433159, 0, 0.2196078, 1, 1,
0.3419364, -0.005974453, 1.578795, 0, 0.2156863, 1, 1,
0.3447085, -0.7496992, 3.252183, 0, 0.2078431, 1, 1,
0.3480678, 0.684868, 1.682858, 0, 0.2039216, 1, 1,
0.3512918, 0.9241279, -0.962997, 0, 0.1960784, 1, 1,
0.352251, -0.433537, 3.371354, 0, 0.1882353, 1, 1,
0.3550349, 0.09283961, 3.020129, 0, 0.1843137, 1, 1,
0.3564947, -0.3224844, 1.77319, 0, 0.1764706, 1, 1,
0.3648773, 0.08331547, 1.400877, 0, 0.172549, 1, 1,
0.3656048, -0.6156117, 3.328711, 0, 0.1647059, 1, 1,
0.3665758, -0.05110867, 2.125697, 0, 0.1607843, 1, 1,
0.3731898, -0.1978748, 2.223069, 0, 0.1529412, 1, 1,
0.3733665, 0.509508, 0.9468822, 0, 0.1490196, 1, 1,
0.3801001, 1.505454, 0.543241, 0, 0.1411765, 1, 1,
0.3812504, 0.0451078, 1.992241, 0, 0.1372549, 1, 1,
0.3830154, -0.3369918, 3.024416, 0, 0.1294118, 1, 1,
0.3833653, 0.4009807, 1.343649, 0, 0.1254902, 1, 1,
0.3846967, 1.379558, 0.3618787, 0, 0.1176471, 1, 1,
0.3861614, -0.128687, 0.9264218, 0, 0.1137255, 1, 1,
0.3891806, -0.967989, 3.7886, 0, 0.1058824, 1, 1,
0.3973604, -1.023332, 2.642259, 0, 0.09803922, 1, 1,
0.4032684, 0.1163492, 1.39589, 0, 0.09411765, 1, 1,
0.4074685, -0.6479957, 0.5174595, 0, 0.08627451, 1, 1,
0.414177, 1.558129, 1.445725, 0, 0.08235294, 1, 1,
0.4157375, 0.4794193, -1.137404, 0, 0.07450981, 1, 1,
0.4162081, 0.615793, 0.7252899, 0, 0.07058824, 1, 1,
0.4186301, -1.099229, 1.580086, 0, 0.0627451, 1, 1,
0.4199637, -0.2533316, 3.465923, 0, 0.05882353, 1, 1,
0.4228108, 0.04538928, 3.586409, 0, 0.05098039, 1, 1,
0.4232649, 0.4862137, -0.626935, 0, 0.04705882, 1, 1,
0.4240343, 0.9945146, -0.595467, 0, 0.03921569, 1, 1,
0.4249646, -1.47994, 3.610454, 0, 0.03529412, 1, 1,
0.4293393, -0.5690566, 1.380394, 0, 0.02745098, 1, 1,
0.4305813, 0.1082313, 2.851382, 0, 0.02352941, 1, 1,
0.4325792, 0.2933687, 2.896245, 0, 0.01568628, 1, 1,
0.4329815, -1.349067, 2.16764, 0, 0.01176471, 1, 1,
0.4377903, 0.8818325, 1.697786, 0, 0.003921569, 1, 1,
0.4391225, -1.498592, 2.531905, 0.003921569, 0, 1, 1,
0.4425982, 0.7476189, 1.3269, 0.007843138, 0, 1, 1,
0.4444729, 1.027732, -1.459365, 0.01568628, 0, 1, 1,
0.4451899, -0.3315436, 3.341947, 0.01960784, 0, 1, 1,
0.4454185, -1.364822, 4.459432, 0.02745098, 0, 1, 1,
0.4495567, 0.6329018, 1.600205, 0.03137255, 0, 1, 1,
0.4553938, 0.9350497, 0.8727297, 0.03921569, 0, 1, 1,
0.457665, 0.370023, 0.7080796, 0.04313726, 0, 1, 1,
0.4628901, 1.73887, -0.2078141, 0.05098039, 0, 1, 1,
0.4650917, -0.844804, 2.894043, 0.05490196, 0, 1, 1,
0.4662358, 0.1720576, -0.07082486, 0.0627451, 0, 1, 1,
0.4724072, -0.7695632, 2.863042, 0.06666667, 0, 1, 1,
0.47405, 1.516931, 1.122239, 0.07450981, 0, 1, 1,
0.4753404, -0.4302958, 1.689289, 0.07843138, 0, 1, 1,
0.4838042, -0.4057462, 3.303829, 0.08627451, 0, 1, 1,
0.4850169, -0.9081239, 1.962698, 0.09019608, 0, 1, 1,
0.48635, -1.298302, 2.356257, 0.09803922, 0, 1, 1,
0.4882437, 0.02731265, 0.8744981, 0.1058824, 0, 1, 1,
0.49065, -1.498942, 1.6385, 0.1098039, 0, 1, 1,
0.4912803, 0.8324435, 0.4417408, 0.1176471, 0, 1, 1,
0.4938359, 1.119801, 0.7682579, 0.1215686, 0, 1, 1,
0.4959634, 0.3655575, 1.129876, 0.1294118, 0, 1, 1,
0.498764, 1.670373, -1.104909, 0.1333333, 0, 1, 1,
0.4988401, 0.2679569, 0.724712, 0.1411765, 0, 1, 1,
0.5019295, 1.168507, 0.122946, 0.145098, 0, 1, 1,
0.5128396, -1.302289, 1.950981, 0.1529412, 0, 1, 1,
0.5134392, 1.189433, -0.05244144, 0.1568628, 0, 1, 1,
0.5164512, -2.36045, 3.487592, 0.1647059, 0, 1, 1,
0.5194032, -0.56641, 4.128838, 0.1686275, 0, 1, 1,
0.5230439, 1.443307, 0.2162322, 0.1764706, 0, 1, 1,
0.5234131, 0.9189554, 1.729285, 0.1803922, 0, 1, 1,
0.5239457, -0.115341, 2.025976, 0.1882353, 0, 1, 1,
0.5254781, 0.801767, -1.149779, 0.1921569, 0, 1, 1,
0.5255747, -0.6275615, 1.534019, 0.2, 0, 1, 1,
0.5259027, -0.5886921, 2.601497, 0.2078431, 0, 1, 1,
0.5283917, 1.432532, 0.1355595, 0.2117647, 0, 1, 1,
0.5346963, 0.2700198, 0.5502918, 0.2196078, 0, 1, 1,
0.535018, 0.6831818, 1.021883, 0.2235294, 0, 1, 1,
0.5369442, -0.784094, 1.324262, 0.2313726, 0, 1, 1,
0.5425041, -0.8808789, 2.569733, 0.2352941, 0, 1, 1,
0.5432618, -0.299203, 0.3809212, 0.2431373, 0, 1, 1,
0.5514696, -1.31625, 3.883223, 0.2470588, 0, 1, 1,
0.5560443, -1.32839, 1.690397, 0.254902, 0, 1, 1,
0.5583552, -0.6821066, 3.313759, 0.2588235, 0, 1, 1,
0.559801, -1.064957, 4.02254, 0.2666667, 0, 1, 1,
0.5672246, -0.7430215, 2.492208, 0.2705882, 0, 1, 1,
0.5685186, -0.845719, 1.339675, 0.2784314, 0, 1, 1,
0.5687431, -0.05111999, 1.765377, 0.282353, 0, 1, 1,
0.5699024, -0.2783647, 1.348914, 0.2901961, 0, 1, 1,
0.576184, -0.2589808, 0.04169419, 0.2941177, 0, 1, 1,
0.5763627, 0.4726195, 0.3862978, 0.3019608, 0, 1, 1,
0.5770949, -2.996614, 3.872092, 0.3098039, 0, 1, 1,
0.5866406, -1.026377, 2.527052, 0.3137255, 0, 1, 1,
0.5880803, 0.9130259, 1.456204, 0.3215686, 0, 1, 1,
0.5901923, 0.8358485, 0.4174967, 0.3254902, 0, 1, 1,
0.5912979, 0.8802794, 2.33044, 0.3333333, 0, 1, 1,
0.5914058, 0.03084954, -0.02908234, 0.3372549, 0, 1, 1,
0.5962935, 0.7100546, 0.4409446, 0.345098, 0, 1, 1,
0.5989971, 0.4864164, 1.111367, 0.3490196, 0, 1, 1,
0.59949, 0.943137, 1.402936, 0.3568628, 0, 1, 1,
0.6004512, 0.3196026, 0.1773567, 0.3607843, 0, 1, 1,
0.608324, -0.04702254, 2.367687, 0.3686275, 0, 1, 1,
0.6085611, 0.2617311, 1.135288, 0.372549, 0, 1, 1,
0.6093028, 1.32889, 0.283909, 0.3803922, 0, 1, 1,
0.60933, 1.898051, -0.6936263, 0.3843137, 0, 1, 1,
0.6094093, -0.5195395, -0.3466885, 0.3921569, 0, 1, 1,
0.619662, -0.2069039, 0.07076837, 0.3960784, 0, 1, 1,
0.6197064, 0.2295277, 1.916248, 0.4039216, 0, 1, 1,
0.6253651, 0.4764672, -0.08295634, 0.4117647, 0, 1, 1,
0.6276528, -0.1364138, 0.6219372, 0.4156863, 0, 1, 1,
0.628782, -0.01936632, 1.949607, 0.4235294, 0, 1, 1,
0.639942, 0.8192772, 0.8871326, 0.427451, 0, 1, 1,
0.6416931, 0.3125322, 2.909464, 0.4352941, 0, 1, 1,
0.6440004, -1.730036, 2.319521, 0.4392157, 0, 1, 1,
0.6461717, 1.203299, -0.2767451, 0.4470588, 0, 1, 1,
0.6462643, -0.3031577, 3.614909, 0.4509804, 0, 1, 1,
0.6468521, -0.5331254, 1.374496, 0.4588235, 0, 1, 1,
0.6477408, -1.315452, 3.80108, 0.4627451, 0, 1, 1,
0.647943, -0.7247241, 3.026994, 0.4705882, 0, 1, 1,
0.6501167, 1.633895, -0.6980079, 0.4745098, 0, 1, 1,
0.6508273, -0.4260718, 0.7787858, 0.4823529, 0, 1, 1,
0.6549203, -0.3090788, 2.266361, 0.4862745, 0, 1, 1,
0.6549654, -0.6125631, 2.91327, 0.4941176, 0, 1, 1,
0.6743988, -2.601307, 1.132847, 0.5019608, 0, 1, 1,
0.6744295, -0.0193606, 1.419871, 0.5058824, 0, 1, 1,
0.6855693, -0.9177262, 2.633193, 0.5137255, 0, 1, 1,
0.6883738, -0.4589376, 3.634352, 0.5176471, 0, 1, 1,
0.6885144, -0.4022989, 1.562816, 0.5254902, 0, 1, 1,
0.6917681, 0.507615, 1.014304, 0.5294118, 0, 1, 1,
0.7012411, -0.3409308, 1.184072, 0.5372549, 0, 1, 1,
0.7023488, 0.6186244, 1.514937, 0.5411765, 0, 1, 1,
0.7030938, -0.5355812, 2.892746, 0.5490196, 0, 1, 1,
0.7032821, -0.7639366, 1.944438, 0.5529412, 0, 1, 1,
0.7035106, -0.08081106, 1.640044, 0.5607843, 0, 1, 1,
0.7062934, -1.486163, 2.600196, 0.5647059, 0, 1, 1,
0.7069084, -1.751543, 3.39405, 0.572549, 0, 1, 1,
0.7074277, 0.4100652, 1.449362, 0.5764706, 0, 1, 1,
0.7085667, -1.633426, 3.243728, 0.5843138, 0, 1, 1,
0.7107999, -0.1355231, 1.634397, 0.5882353, 0, 1, 1,
0.7132329, 0.3593764, 1.369653, 0.5960785, 0, 1, 1,
0.7161682, -0.02068971, 3.097582, 0.6039216, 0, 1, 1,
0.7175323, 1.59988, 0.02136545, 0.6078432, 0, 1, 1,
0.7284479, -0.8633574, 2.717742, 0.6156863, 0, 1, 1,
0.7369294, -0.2293475, 0.8482347, 0.6196079, 0, 1, 1,
0.7374195, 0.7990255, 0.05756512, 0.627451, 0, 1, 1,
0.7396439, -0.2021358, 0.854542, 0.6313726, 0, 1, 1,
0.7416093, -2.306583, 2.083339, 0.6392157, 0, 1, 1,
0.7490583, 0.01347637, 3.258282, 0.6431373, 0, 1, 1,
0.7497281, -1.639626, 4.133036, 0.6509804, 0, 1, 1,
0.7512386, -0.4405547, 1.955513, 0.654902, 0, 1, 1,
0.7512971, -0.4648326, 3.243766, 0.6627451, 0, 1, 1,
0.7518789, -0.1676911, 1.621012, 0.6666667, 0, 1, 1,
0.757125, -0.7494693, 1.131561, 0.6745098, 0, 1, 1,
0.7578918, 0.5182727, 1.736265, 0.6784314, 0, 1, 1,
0.7611915, -1.201781, 1.428346, 0.6862745, 0, 1, 1,
0.7639427, 0.2081435, 1.111638, 0.6901961, 0, 1, 1,
0.7665304, -0.4344485, 0.4909208, 0.6980392, 0, 1, 1,
0.7696602, 0.2994084, 2.57434, 0.7058824, 0, 1, 1,
0.7746747, -0.1306205, 0.3939619, 0.7098039, 0, 1, 1,
0.7808481, -0.5509741, 3.278996, 0.7176471, 0, 1, 1,
0.7893565, -0.04876276, 3.109847, 0.7215686, 0, 1, 1,
0.7966728, -0.3843352, 2.042935, 0.7294118, 0, 1, 1,
0.79859, -0.7423886, 3.020502, 0.7333333, 0, 1, 1,
0.8000522, 1.323318, 0.8501475, 0.7411765, 0, 1, 1,
0.8028668, -2.361951, 1.786595, 0.7450981, 0, 1, 1,
0.8058071, -0.3735005, 0.9742925, 0.7529412, 0, 1, 1,
0.806876, -0.595903, 2.20462, 0.7568628, 0, 1, 1,
0.810219, 0.07991595, 1.628628, 0.7647059, 0, 1, 1,
0.8201342, 0.9173487, 1.121956, 0.7686275, 0, 1, 1,
0.8249267, -0.4528476, 1.169261, 0.7764706, 0, 1, 1,
0.8263986, 0.5692739, 1.216951, 0.7803922, 0, 1, 1,
0.8277299, -0.06133992, -0.834078, 0.7882353, 0, 1, 1,
0.8342581, -0.5075693, 3.33759, 0.7921569, 0, 1, 1,
0.8526014, 0.2142168, 0.6165689, 0.8, 0, 1, 1,
0.8526567, 0.8136005, 0.3278934, 0.8078431, 0, 1, 1,
0.8575214, 0.7605577, 1.608746, 0.8117647, 0, 1, 1,
0.8586059, 1.007223, 1.400131, 0.8196079, 0, 1, 1,
0.8618129, 0.0558896, 2.8052, 0.8235294, 0, 1, 1,
0.8626887, 0.8559114, -0.07172527, 0.8313726, 0, 1, 1,
0.8693864, -0.3298078, 1.643022, 0.8352941, 0, 1, 1,
0.8706725, 1.481472, 0.1695882, 0.8431373, 0, 1, 1,
0.8822775, -0.3495639, 1.193522, 0.8470588, 0, 1, 1,
0.8890724, 1.157544, 3.292101, 0.854902, 0, 1, 1,
0.9116458, -0.08606283, 2.796904, 0.8588235, 0, 1, 1,
0.9117218, 1.295704, 0.7216656, 0.8666667, 0, 1, 1,
0.9125397, 0.6229784, 1.827476, 0.8705882, 0, 1, 1,
0.9156452, 0.7374641, 1.783376, 0.8784314, 0, 1, 1,
0.9217426, 0.3765543, -0.2785929, 0.8823529, 0, 1, 1,
0.9288161, 0.1507761, 2.813473, 0.8901961, 0, 1, 1,
0.9419321, -0.6779626, 0.4716191, 0.8941177, 0, 1, 1,
0.942799, 1.199446, 0.493026, 0.9019608, 0, 1, 1,
0.9494725, 0.2913234, 0.5373939, 0.9098039, 0, 1, 1,
0.9501305, -0.2327967, 2.857153, 0.9137255, 0, 1, 1,
0.9591908, -1.933472, 2.441564, 0.9215686, 0, 1, 1,
0.9607236, 0.719192, 2.139403, 0.9254902, 0, 1, 1,
0.9684594, -0.2224105, 1.557669, 0.9333333, 0, 1, 1,
0.9687529, -0.1609664, 2.149825, 0.9372549, 0, 1, 1,
0.970423, 0.5271792, 1.16339, 0.945098, 0, 1, 1,
0.9751262, 0.2643971, 1.691938, 0.9490196, 0, 1, 1,
0.9781072, -0.4473286, 2.656131, 0.9568627, 0, 1, 1,
0.9813759, -0.71203, 1.806475, 0.9607843, 0, 1, 1,
0.9844254, -1.125329, 3.199332, 0.9686275, 0, 1, 1,
0.9848988, -1.500903, 3.384382, 0.972549, 0, 1, 1,
0.9862927, 0.7612584, 2.120004, 0.9803922, 0, 1, 1,
0.9880791, 0.3477013, -0.547384, 0.9843137, 0, 1, 1,
0.9898119, 0.02510699, 1.390983, 0.9921569, 0, 1, 1,
0.9916412, 1.008802, 0.1520326, 0.9960784, 0, 1, 1,
0.994145, 0.4600427, -0.08098667, 1, 0, 0.9960784, 1,
1.00271, -0.4564347, 1.841159, 1, 0, 0.9882353, 1,
1.006774, -0.5523629, 3.007731, 1, 0, 0.9843137, 1,
1.006848, 0.6183881, -0.2864919, 1, 0, 0.9764706, 1,
1.009503, -0.1139398, 1.959225, 1, 0, 0.972549, 1,
1.010918, 0.1143162, 2.328906, 1, 0, 0.9647059, 1,
1.011154, -0.2545163, 1.978617, 1, 0, 0.9607843, 1,
1.014946, 1.165768, 0.8874775, 1, 0, 0.9529412, 1,
1.026085, 0.7185577, 2.159998, 1, 0, 0.9490196, 1,
1.029491, -0.7178784, 2.070905, 1, 0, 0.9411765, 1,
1.040599, 2.304676, 1.076113, 1, 0, 0.9372549, 1,
1.040787, 0.5981084, 0.8431565, 1, 0, 0.9294118, 1,
1.048913, -0.1362831, 1.64533, 1, 0, 0.9254902, 1,
1.069524, -1.627532, 2.796224, 1, 0, 0.9176471, 1,
1.073008, -0.2678254, 2.531894, 1, 0, 0.9137255, 1,
1.074247, 0.1579555, 1.434158, 1, 0, 0.9058824, 1,
1.075817, -0.788816, -0.2169306, 1, 0, 0.9019608, 1,
1.079479, 0.5868871, -0.8567206, 1, 0, 0.8941177, 1,
1.083453, 1.080241, 0.5478443, 1, 0, 0.8862745, 1,
1.086599, 0.8742108, -0.5125576, 1, 0, 0.8823529, 1,
1.099663, -0.7692019, 1.854905, 1, 0, 0.8745098, 1,
1.099693, -0.4824164, 1.666236, 1, 0, 0.8705882, 1,
1.100923, 1.25176, -0.5354924, 1, 0, 0.8627451, 1,
1.102915, 0.5915331, 1.800885, 1, 0, 0.8588235, 1,
1.109443, -0.5417878, 1.543987, 1, 0, 0.8509804, 1,
1.11253, -0.1727154, -0.7399992, 1, 0, 0.8470588, 1,
1.114514, -1.158657, 3.109159, 1, 0, 0.8392157, 1,
1.126039, 0.9760472, 0.01818549, 1, 0, 0.8352941, 1,
1.126056, -0.2596965, 0.8321647, 1, 0, 0.827451, 1,
1.133363, 0.1024635, 0.5319951, 1, 0, 0.8235294, 1,
1.135181, -1.228104, 3.401561, 1, 0, 0.8156863, 1,
1.144212, -0.4453512, 1.314435, 1, 0, 0.8117647, 1,
1.152627, 0.4128425, 0.8539247, 1, 0, 0.8039216, 1,
1.155181, 0.8657678, -0.1034461, 1, 0, 0.7960784, 1,
1.156366, 2.331916, 0.4818075, 1, 0, 0.7921569, 1,
1.16155, 1.048171, 0.7946057, 1, 0, 0.7843137, 1,
1.167161, -0.06121034, 3.567044, 1, 0, 0.7803922, 1,
1.169807, -0.1393196, 3.769645, 1, 0, 0.772549, 1,
1.182612, -1.175822, 3.740221, 1, 0, 0.7686275, 1,
1.183286, -1.445388, 3.448089, 1, 0, 0.7607843, 1,
1.183603, 0.8544387, 1.449291, 1, 0, 0.7568628, 1,
1.1874, 0.1040628, 1.490318, 1, 0, 0.7490196, 1,
1.189166, 0.6151162, 1.688605, 1, 0, 0.7450981, 1,
1.190361, 0.5893847, 2.338614, 1, 0, 0.7372549, 1,
1.193218, 0.2548027, 1.09685, 1, 0, 0.7333333, 1,
1.193447, 2.647601, 0.1254023, 1, 0, 0.7254902, 1,
1.196842, 0.2788124, 2.208464, 1, 0, 0.7215686, 1,
1.212875, -0.5165491, 2.595368, 1, 0, 0.7137255, 1,
1.217458, 1.874724, 1.48811, 1, 0, 0.7098039, 1,
1.220507, -0.5383438, 2.037901, 1, 0, 0.7019608, 1,
1.229061, -1.623039, 2.064579, 1, 0, 0.6941177, 1,
1.232779, -0.7017308, 2.829541, 1, 0, 0.6901961, 1,
1.232789, -1.210485, 3.840045, 1, 0, 0.682353, 1,
1.233969, -0.7436839, 2.850245, 1, 0, 0.6784314, 1,
1.241979, 0.1692398, 1.110368, 1, 0, 0.6705883, 1,
1.253257, 0.5091676, 2.793226, 1, 0, 0.6666667, 1,
1.255945, 2.484174, -1.182952, 1, 0, 0.6588235, 1,
1.270947, 0.01580459, 1.615888, 1, 0, 0.654902, 1,
1.271645, 0.211576, 1.929719, 1, 0, 0.6470588, 1,
1.27287, -0.4347857, 2.136888, 1, 0, 0.6431373, 1,
1.289335, 0.5245537, 1.371345, 1, 0, 0.6352941, 1,
1.291502, 1.335848, -0.1282127, 1, 0, 0.6313726, 1,
1.299905, 0.2389039, 0.7016882, 1, 0, 0.6235294, 1,
1.300962, -0.3742217, 2.080609, 1, 0, 0.6196079, 1,
1.302351, 0.3969442, -0.1017338, 1, 0, 0.6117647, 1,
1.304669, -0.4839183, 3.611432, 1, 0, 0.6078432, 1,
1.306835, -0.3619769, 1.160084, 1, 0, 0.6, 1,
1.30916, -0.08351285, 1.369028, 1, 0, 0.5921569, 1,
1.310688, 0.1582562, 1.735194, 1, 0, 0.5882353, 1,
1.321895, -2.147831, 3.529073, 1, 0, 0.5803922, 1,
1.322353, -0.2322265, 2.38253, 1, 0, 0.5764706, 1,
1.323212, 1.594277, 0.8306365, 1, 0, 0.5686275, 1,
1.325153, 1.403057, 2.68802, 1, 0, 0.5647059, 1,
1.33507, 1.036536, 0.2567549, 1, 0, 0.5568628, 1,
1.345517, -0.7832811, 1.611466, 1, 0, 0.5529412, 1,
1.367532, -0.8664082, 3.002564, 1, 0, 0.5450981, 1,
1.370647, -1.611844, 5.238409, 1, 0, 0.5411765, 1,
1.374554, -0.6695653, 2.655731, 1, 0, 0.5333334, 1,
1.374948, -3.544101, 2.319211, 1, 0, 0.5294118, 1,
1.379597, -0.5080183, 0.8702, 1, 0, 0.5215687, 1,
1.385468, 0.232907, -0.5363805, 1, 0, 0.5176471, 1,
1.386336, -1.011998, 1.479741, 1, 0, 0.509804, 1,
1.388026, -0.8075308, 2.943124, 1, 0, 0.5058824, 1,
1.39503, -0.7610654, 2.918843, 1, 0, 0.4980392, 1,
1.39923, 0.03986884, -0.4491273, 1, 0, 0.4901961, 1,
1.419641, 1.031089, 0.08109904, 1, 0, 0.4862745, 1,
1.42425, 1.720023, 2.121733, 1, 0, 0.4784314, 1,
1.42451, 1.716782, 0.225394, 1, 0, 0.4745098, 1,
1.426771, -0.6692055, -0.3952453, 1, 0, 0.4666667, 1,
1.434251, 1.078132, 0.7042969, 1, 0, 0.4627451, 1,
1.438445, 0.9929887, 2.68037, 1, 0, 0.454902, 1,
1.438591, -0.5035924, 1.753946, 1, 0, 0.4509804, 1,
1.461704, 0.07963059, 0.2692409, 1, 0, 0.4431373, 1,
1.461913, 0.08360315, 1.906816, 1, 0, 0.4392157, 1,
1.463464, -0.4961255, 2.409426, 1, 0, 0.4313726, 1,
1.472637, 0.7575957, 1.874229, 1, 0, 0.427451, 1,
1.474561, -0.09166221, 1.528284, 1, 0, 0.4196078, 1,
1.480179, -0.4644044, 1.922091, 1, 0, 0.4156863, 1,
1.487824, -1.602253, 3.541078, 1, 0, 0.4078431, 1,
1.493421, 1.698162, -0.9951144, 1, 0, 0.4039216, 1,
1.500788, 1.067293, 0.8130403, 1, 0, 0.3960784, 1,
1.501912, 0.2499388, 2.044945, 1, 0, 0.3882353, 1,
1.505131, -1.925011, 3.055958, 1, 0, 0.3843137, 1,
1.514922, -0.9127218, 3.672896, 1, 0, 0.3764706, 1,
1.516445, 1.283844, 1.366117, 1, 0, 0.372549, 1,
1.533076, 1.462321, 0.02031763, 1, 0, 0.3647059, 1,
1.561313, -0.4436866, 3.118492, 1, 0, 0.3607843, 1,
1.56626, 0.8310943, 3.242644, 1, 0, 0.3529412, 1,
1.576968, 2.389315, 0.6264685, 1, 0, 0.3490196, 1,
1.585453, -0.1198758, 1.152273, 1, 0, 0.3411765, 1,
1.591754, -1.540504, 2.951127, 1, 0, 0.3372549, 1,
1.596584, 1.346108, 1.476215, 1, 0, 0.3294118, 1,
1.613338, -1.153822, 2.244831, 1, 0, 0.3254902, 1,
1.615821, 0.4827875, 0.5477078, 1, 0, 0.3176471, 1,
1.623371, 0.9551344, 0.2768691, 1, 0, 0.3137255, 1,
1.647783, -0.09951814, 1.790878, 1, 0, 0.3058824, 1,
1.659979, -0.3993745, 3.51488, 1, 0, 0.2980392, 1,
1.688936, -0.003446076, -0.05576381, 1, 0, 0.2941177, 1,
1.700869, -0.4289658, 1.499444, 1, 0, 0.2862745, 1,
1.705478, 0.9850653, -0.02307821, 1, 0, 0.282353, 1,
1.718159, 0.8570581, 1.645368, 1, 0, 0.2745098, 1,
1.720608, 0.1431319, 2.670672, 1, 0, 0.2705882, 1,
1.721369, -0.7164263, 2.98481, 1, 0, 0.2627451, 1,
1.723609, -1.362978, 1.962826, 1, 0, 0.2588235, 1,
1.743496, 0.7782568, -0.9175932, 1, 0, 0.2509804, 1,
1.746921, -0.765838, 2.954198, 1, 0, 0.2470588, 1,
1.747722, 0.8924748, 1.386861, 1, 0, 0.2392157, 1,
1.793483, -0.3053379, 0.9850789, 1, 0, 0.2352941, 1,
1.79582, 0.7771719, 0.9847132, 1, 0, 0.227451, 1,
1.799203, 0.9470902, 0.372914, 1, 0, 0.2235294, 1,
1.816451, 2.136144, 2.473049, 1, 0, 0.2156863, 1,
1.819011, -0.3747377, 1.535824, 1, 0, 0.2117647, 1,
1.843163, -1.448997, 2.183972, 1, 0, 0.2039216, 1,
1.844902, -0.08004676, 0.3402213, 1, 0, 0.1960784, 1,
1.873688, -0.03813536, 1.638157, 1, 0, 0.1921569, 1,
1.890132, -1.949435, 2.848536, 1, 0, 0.1843137, 1,
1.893839, -1.001627, 1.060038, 1, 0, 0.1803922, 1,
1.895076, 1.695705, 0.2513262, 1, 0, 0.172549, 1,
1.907477, -0.8172724, 1.590239, 1, 0, 0.1686275, 1,
1.911914, -1.540123, 2.662514, 1, 0, 0.1607843, 1,
1.954758, 0.440244, 1.82181, 1, 0, 0.1568628, 1,
1.965432, 1.096635, 0.4119861, 1, 0, 0.1490196, 1,
1.96779, 1.263822, -0.4948297, 1, 0, 0.145098, 1,
1.969716, -0.8493855, 1.962868, 1, 0, 0.1372549, 1,
2.004461, -1.869767, 1.99606, 1, 0, 0.1333333, 1,
2.019193, -0.7158958, 1.422055, 1, 0, 0.1254902, 1,
2.020386, 0.3895515, 1.564745, 1, 0, 0.1215686, 1,
2.075208, -0.02748388, 0.324806, 1, 0, 0.1137255, 1,
2.12836, 0.1235742, 1.547134, 1, 0, 0.1098039, 1,
2.134712, -0.4546717, 5.078733, 1, 0, 0.1019608, 1,
2.150579, 1.426088, 1.561028, 1, 0, 0.09411765, 1,
2.1576, -1.365877, 0.9256017, 1, 0, 0.09019608, 1,
2.162154, -0.1597991, 1.522914, 1, 0, 0.08235294, 1,
2.220671, -0.418736, 3.151291, 1, 0, 0.07843138, 1,
2.271538, -0.9367588, 2.217041, 1, 0, 0.07058824, 1,
2.279781, 0.4437061, 0.2451972, 1, 0, 0.06666667, 1,
2.329946, -0.5569888, 2.895145, 1, 0, 0.05882353, 1,
2.391135, -0.8545958, 2.23621, 1, 0, 0.05490196, 1,
2.450294, 1.431394, 3.247781, 1, 0, 0.04705882, 1,
2.549525, -0.1601327, 1.547034, 1, 0, 0.04313726, 1,
2.5923, 2.108019, 1.390743, 1, 0, 0.03529412, 1,
2.592673, -0.2068388, 1.420773, 1, 0, 0.03137255, 1,
2.710517, 0.04382709, 1.328357, 1, 0, 0.02352941, 1,
2.857937, 0.1104331, 2.232425, 1, 0, 0.01960784, 1,
2.871124, -0.1670506, 2.142554, 1, 0, 0.01176471, 1,
3.097305, 0.5388899, -0.4244967, 1, 0, 0.007843138, 1
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
-0.08700633, -4.753405, -7.747609, 0, -0.5, 0.5, 0.5,
-0.08700633, -4.753405, -7.747609, 1, -0.5, 0.5, 0.5,
-0.08700633, -4.753405, -7.747609, 1, 1.5, 0.5, 0.5,
-0.08700633, -4.753405, -7.747609, 0, 1.5, 0.5, 0.5
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
-4.350799, 0.02316773, -7.747609, 0, -0.5, 0.5, 0.5,
-4.350799, 0.02316773, -7.747609, 1, -0.5, 0.5, 0.5,
-4.350799, 0.02316773, -7.747609, 1, 1.5, 0.5, 0.5,
-4.350799, 0.02316773, -7.747609, 0, 1.5, 0.5, 0.5
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
-4.350799, -4.753405, -0.3135443, 0, -0.5, 0.5, 0.5,
-4.350799, -4.753405, -0.3135443, 1, -0.5, 0.5, 0.5,
-4.350799, -4.753405, -0.3135443, 1, 1.5, 0.5, 0.5,
-4.350799, -4.753405, -0.3135443, 0, 1.5, 0.5, 0.5
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
-3, -3.651119, -6.032056,
3, -3.651119, -6.032056,
-3, -3.651119, -6.032056,
-3, -3.834833, -6.317981,
-2, -3.651119, -6.032056,
-2, -3.834833, -6.317981,
-1, -3.651119, -6.032056,
-1, -3.834833, -6.317981,
0, -3.651119, -6.032056,
0, -3.834833, -6.317981,
1, -3.651119, -6.032056,
1, -3.834833, -6.317981,
2, -3.651119, -6.032056,
2, -3.834833, -6.317981,
3, -3.651119, -6.032056,
3, -3.834833, -6.317981
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
-3, -4.202261, -6.889832, 0, -0.5, 0.5, 0.5,
-3, -4.202261, -6.889832, 1, -0.5, 0.5, 0.5,
-3, -4.202261, -6.889832, 1, 1.5, 0.5, 0.5,
-3, -4.202261, -6.889832, 0, 1.5, 0.5, 0.5,
-2, -4.202261, -6.889832, 0, -0.5, 0.5, 0.5,
-2, -4.202261, -6.889832, 1, -0.5, 0.5, 0.5,
-2, -4.202261, -6.889832, 1, 1.5, 0.5, 0.5,
-2, -4.202261, -6.889832, 0, 1.5, 0.5, 0.5,
-1, -4.202261, -6.889832, 0, -0.5, 0.5, 0.5,
-1, -4.202261, -6.889832, 1, -0.5, 0.5, 0.5,
-1, -4.202261, -6.889832, 1, 1.5, 0.5, 0.5,
-1, -4.202261, -6.889832, 0, 1.5, 0.5, 0.5,
0, -4.202261, -6.889832, 0, -0.5, 0.5, 0.5,
0, -4.202261, -6.889832, 1, -0.5, 0.5, 0.5,
0, -4.202261, -6.889832, 1, 1.5, 0.5, 0.5,
0, -4.202261, -6.889832, 0, 1.5, 0.5, 0.5,
1, -4.202261, -6.889832, 0, -0.5, 0.5, 0.5,
1, -4.202261, -6.889832, 1, -0.5, 0.5, 0.5,
1, -4.202261, -6.889832, 1, 1.5, 0.5, 0.5,
1, -4.202261, -6.889832, 0, 1.5, 0.5, 0.5,
2, -4.202261, -6.889832, 0, -0.5, 0.5, 0.5,
2, -4.202261, -6.889832, 1, -0.5, 0.5, 0.5,
2, -4.202261, -6.889832, 1, 1.5, 0.5, 0.5,
2, -4.202261, -6.889832, 0, 1.5, 0.5, 0.5,
3, -4.202261, -6.889832, 0, -0.5, 0.5, 0.5,
3, -4.202261, -6.889832, 1, -0.5, 0.5, 0.5,
3, -4.202261, -6.889832, 1, 1.5, 0.5, 0.5,
3, -4.202261, -6.889832, 0, 1.5, 0.5, 0.5
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
-3.366847, -2, -6.032056,
-3.366847, 2, -6.032056,
-3.366847, -2, -6.032056,
-3.530839, -2, -6.317981,
-3.366847, 0, -6.032056,
-3.530839, 0, -6.317981,
-3.366847, 2, -6.032056,
-3.530839, 2, -6.317981
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
-3.858823, -2, -6.889832, 0, -0.5, 0.5, 0.5,
-3.858823, -2, -6.889832, 1, -0.5, 0.5, 0.5,
-3.858823, -2, -6.889832, 1, 1.5, 0.5, 0.5,
-3.858823, -2, -6.889832, 0, 1.5, 0.5, 0.5,
-3.858823, 0, -6.889832, 0, -0.5, 0.5, 0.5,
-3.858823, 0, -6.889832, 1, -0.5, 0.5, 0.5,
-3.858823, 0, -6.889832, 1, 1.5, 0.5, 0.5,
-3.858823, 0, -6.889832, 0, 1.5, 0.5, 0.5,
-3.858823, 2, -6.889832, 0, -0.5, 0.5, 0.5,
-3.858823, 2, -6.889832, 1, -0.5, 0.5, 0.5,
-3.858823, 2, -6.889832, 1, 1.5, 0.5, 0.5,
-3.858823, 2, -6.889832, 0, 1.5, 0.5, 0.5
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
-3.366847, -3.651119, -4,
-3.366847, -3.651119, 4,
-3.366847, -3.651119, -4,
-3.530839, -3.834833, -4,
-3.366847, -3.651119, -2,
-3.530839, -3.834833, -2,
-3.366847, -3.651119, 0,
-3.530839, -3.834833, 0,
-3.366847, -3.651119, 2,
-3.530839, -3.834833, 2,
-3.366847, -3.651119, 4,
-3.530839, -3.834833, 4
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
-3.858823, -4.202261, -4, 0, -0.5, 0.5, 0.5,
-3.858823, -4.202261, -4, 1, -0.5, 0.5, 0.5,
-3.858823, -4.202261, -4, 1, 1.5, 0.5, 0.5,
-3.858823, -4.202261, -4, 0, 1.5, 0.5, 0.5,
-3.858823, -4.202261, -2, 0, -0.5, 0.5, 0.5,
-3.858823, -4.202261, -2, 1, -0.5, 0.5, 0.5,
-3.858823, -4.202261, -2, 1, 1.5, 0.5, 0.5,
-3.858823, -4.202261, -2, 0, 1.5, 0.5, 0.5,
-3.858823, -4.202261, 0, 0, -0.5, 0.5, 0.5,
-3.858823, -4.202261, 0, 1, -0.5, 0.5, 0.5,
-3.858823, -4.202261, 0, 1, 1.5, 0.5, 0.5,
-3.858823, -4.202261, 0, 0, 1.5, 0.5, 0.5,
-3.858823, -4.202261, 2, 0, -0.5, 0.5, 0.5,
-3.858823, -4.202261, 2, 1, -0.5, 0.5, 0.5,
-3.858823, -4.202261, 2, 1, 1.5, 0.5, 0.5,
-3.858823, -4.202261, 2, 0, 1.5, 0.5, 0.5,
-3.858823, -4.202261, 4, 0, -0.5, 0.5, 0.5,
-3.858823, -4.202261, 4, 1, -0.5, 0.5, 0.5,
-3.858823, -4.202261, 4, 1, 1.5, 0.5, 0.5,
-3.858823, -4.202261, 4, 0, 1.5, 0.5, 0.5
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
-3.366847, -3.651119, -6.032056,
-3.366847, 3.697454, -6.032056,
-3.366847, -3.651119, 5.404967,
-3.366847, 3.697454, 5.404967,
-3.366847, -3.651119, -6.032056,
-3.366847, -3.651119, 5.404967,
-3.366847, 3.697454, -6.032056,
-3.366847, 3.697454, 5.404967,
-3.366847, -3.651119, -6.032056,
3.192834, -3.651119, -6.032056,
-3.366847, -3.651119, 5.404967,
3.192834, -3.651119, 5.404967,
-3.366847, 3.697454, -6.032056,
3.192834, 3.697454, -6.032056,
-3.366847, 3.697454, 5.404967,
3.192834, 3.697454, 5.404967,
3.192834, -3.651119, -6.032056,
3.192834, 3.697454, -6.032056,
3.192834, -3.651119, 5.404967,
3.192834, 3.697454, 5.404967,
3.192834, -3.651119, -6.032056,
3.192834, -3.651119, 5.404967,
3.192834, 3.697454, -6.032056,
3.192834, 3.697454, 5.404967
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
var radius = 8.060037;
var distance = 35.86002;
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
mvMatrix.translate( 0.08700633, -0.02316773, 0.3135443 );
mvMatrix.scale( 1.32852, 1.1859, 0.7619702 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.86002);
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
isoxaben<-read.table("isoxaben.xyz")
```

```
## Error in read.table("isoxaben.xyz"): no lines available in input
```

```r
x<-isoxaben$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxaben' not found
```

```r
y<-isoxaben$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxaben' not found
```

```r
z<-isoxaben$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxaben' not found
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
-3.271317, -1.98243, -1.026371, 0, 0, 1, 1, 1,
-3.123867, 0.840829, 0.0274292, 1, 0, 0, 1, 1,
-2.95808, 1.725629, 0.6916017, 1, 0, 0, 1, 1,
-2.857305, -0.7729843, -1.493183, 1, 0, 0, 1, 1,
-2.752997, 0.2147805, -0.9012089, 1, 0, 0, 1, 1,
-2.573632, 0.6751133, -1.096586, 1, 0, 0, 1, 1,
-2.413135, 1.061967, -2.406423, 0, 0, 0, 1, 1,
-2.373986, 0.4666846, -1.162674, 0, 0, 0, 1, 1,
-2.351674, 1.040184, -1.461301, 0, 0, 0, 1, 1,
-2.332649, 0.9167546, -2.43396, 0, 0, 0, 1, 1,
-2.2109, -1.109751, -1.889851, 0, 0, 0, 1, 1,
-2.199615, 0.9574307, -0.4399983, 0, 0, 0, 1, 1,
-2.182014, 0.6872948, -1.649845, 0, 0, 0, 1, 1,
-2.154916, 0.4085593, -0.5298209, 1, 1, 1, 1, 1,
-2.152077, -0.2785316, -0.5695976, 1, 1, 1, 1, 1,
-2.130613, -0.2511507, -1.210616, 1, 1, 1, 1, 1,
-2.102557, -1.087635, -2.31636, 1, 1, 1, 1, 1,
-2.095086, -0.6684687, -2.182652, 1, 1, 1, 1, 1,
-2.071173, -0.05944176, -0.8061647, 1, 1, 1, 1, 1,
-2.058791, 0.1785784, -1.975762, 1, 1, 1, 1, 1,
-2.017984, -0.7267214, -2.372321, 1, 1, 1, 1, 1,
-1.983998, -0.06583558, -1.621071, 1, 1, 1, 1, 1,
-1.981781, 0.2615968, -2.074176, 1, 1, 1, 1, 1,
-1.944825, -0.2949452, -1.273683, 1, 1, 1, 1, 1,
-1.941258, -0.5763215, -0.09742229, 1, 1, 1, 1, 1,
-1.939147, -0.4593335, -2.123917, 1, 1, 1, 1, 1,
-1.883023, -1.012218, -1.80177, 1, 1, 1, 1, 1,
-1.87366, 0.7742891, -2.953365, 1, 1, 1, 1, 1,
-1.872946, -1.10934, -2.043797, 0, 0, 1, 1, 1,
-1.832573, 1.349957, -0.434679, 1, 0, 0, 1, 1,
-1.817252, 1.25077, -1.4565, 1, 0, 0, 1, 1,
-1.814448, -1.979991, -3.693103, 1, 0, 0, 1, 1,
-1.797079, 0.6007475, -1.32117, 1, 0, 0, 1, 1,
-1.762951, 1.449316, -0.9927802, 1, 0, 0, 1, 1,
-1.755969, 1.394458, 0.7721952, 0, 0, 0, 1, 1,
-1.746384, 0.1963989, -2.610354, 0, 0, 0, 1, 1,
-1.739351, -0.8041728, -2.220414, 0, 0, 0, 1, 1,
-1.73266, 1.796388, -1.586915, 0, 0, 0, 1, 1,
-1.72829, 0.3288182, -1.288996, 0, 0, 0, 1, 1,
-1.715007, -1.892002, -3.898921, 0, 0, 0, 1, 1,
-1.701055, -0.8620284, -1.102785, 0, 0, 0, 1, 1,
-1.691272, 0.350128, -1.369451, 1, 1, 1, 1, 1,
-1.691129, -1.929234, -1.685972, 1, 1, 1, 1, 1,
-1.672838, 0.1148459, -2.995777, 1, 1, 1, 1, 1,
-1.665042, -0.4581075, -0.3812639, 1, 1, 1, 1, 1,
-1.653743, -0.5905946, -0.8891913, 1, 1, 1, 1, 1,
-1.643119, 0.1835701, -0.7969273, 1, 1, 1, 1, 1,
-1.630707, -0.3396685, -3.397895, 1, 1, 1, 1, 1,
-1.620998, 0.5071672, -1.652418, 1, 1, 1, 1, 1,
-1.614938, -1.10341, -2.332837, 1, 1, 1, 1, 1,
-1.613374, -0.6692991, -0.9197632, 1, 1, 1, 1, 1,
-1.595786, -0.05478849, -2.59367, 1, 1, 1, 1, 1,
-1.592807, 0.9613001, -0.3756363, 1, 1, 1, 1, 1,
-1.576904, -1.155895, -1.913514, 1, 1, 1, 1, 1,
-1.573424, 0.1930471, -1.649807, 1, 1, 1, 1, 1,
-1.564994, -0.3541898, -3.744786, 1, 1, 1, 1, 1,
-1.564994, 1.571308, -1.997891, 0, 0, 1, 1, 1,
-1.561552, 0.8342904, -0.3613344, 1, 0, 0, 1, 1,
-1.549592, -0.8214362, -2.685491, 1, 0, 0, 1, 1,
-1.537741, -0.3715594, -3.228657, 1, 0, 0, 1, 1,
-1.518954, -0.1762135, -4.326246, 1, 0, 0, 1, 1,
-1.490735, -0.6510834, -2.240895, 1, 0, 0, 1, 1,
-1.48616, 0.6919045, -1.4531, 0, 0, 0, 1, 1,
-1.484884, 0.8996823, -0.421918, 0, 0, 0, 1, 1,
-1.48482, -0.352603, -0.7726633, 0, 0, 0, 1, 1,
-1.481447, 0.263267, -2.251271, 0, 0, 0, 1, 1,
-1.480847, 1.584337, 0.9909313, 0, 0, 0, 1, 1,
-1.48076, -0.3983325, -0.7113837, 0, 0, 0, 1, 1,
-1.479265, -0.2210679, -1.302231, 0, 0, 0, 1, 1,
-1.478447, -0.3101448, -2.539036, 1, 1, 1, 1, 1,
-1.466981, -0.004921495, 1.729367, 1, 1, 1, 1, 1,
-1.460759, 0.8270346, -3.558831, 1, 1, 1, 1, 1,
-1.452267, -1.001059, -1.53299, 1, 1, 1, 1, 1,
-1.446282, -0.597002, -3.554079, 1, 1, 1, 1, 1,
-1.44042, -0.1231174, 0.04335089, 1, 1, 1, 1, 1,
-1.422322, 1.33353, -1.71625, 1, 1, 1, 1, 1,
-1.41762, 0.2171351, -1.397442, 1, 1, 1, 1, 1,
-1.406812, 0.9724799, -0.5800303, 1, 1, 1, 1, 1,
-1.404597, 1.339616, 0.3621266, 1, 1, 1, 1, 1,
-1.402527, 0.1264506, -0.9537634, 1, 1, 1, 1, 1,
-1.390767, -0.7315846, -2.741923, 1, 1, 1, 1, 1,
-1.382937, -0.2507206, -3.287705, 1, 1, 1, 1, 1,
-1.375132, 0.5467193, -1.435851, 1, 1, 1, 1, 1,
-1.371075, -1.029847, -0.6876367, 1, 1, 1, 1, 1,
-1.363567, 0.8540713, -0.4770382, 0, 0, 1, 1, 1,
-1.361044, -0.1520122, -1.873125, 1, 0, 0, 1, 1,
-1.350341, -1.065833, -2.391403, 1, 0, 0, 1, 1,
-1.347359, 0.7279164, -1.199051, 1, 0, 0, 1, 1,
-1.340313, -0.7366573, -2.640126, 1, 0, 0, 1, 1,
-1.33446, -1.37287, -0.9871505, 1, 0, 0, 1, 1,
-1.334366, 0.7421149, -1.324338, 0, 0, 0, 1, 1,
-1.329863, -0.9805155, -1.349677, 0, 0, 0, 1, 1,
-1.322761, 0.6357915, -0.2805154, 0, 0, 0, 1, 1,
-1.30826, 0.5557526, -1.075338, 0, 0, 0, 1, 1,
-1.305727, 0.5469723, -1.645884, 0, 0, 0, 1, 1,
-1.296647, -2.114373, -3.203747, 0, 0, 0, 1, 1,
-1.290517, 0.3669338, -0.6407496, 0, 0, 0, 1, 1,
-1.289338, -0.09388096, -1.564291, 1, 1, 1, 1, 1,
-1.284797, -1.303547, -1.349209, 1, 1, 1, 1, 1,
-1.28293, 2.328794, -0.7025065, 1, 1, 1, 1, 1,
-1.282776, -0.4061493, -1.984859, 1, 1, 1, 1, 1,
-1.261864, 1.069618, -0.987977, 1, 1, 1, 1, 1,
-1.25262, -0.3100631, -1.905488, 1, 1, 1, 1, 1,
-1.251149, 0.9261725, -1.012211, 1, 1, 1, 1, 1,
-1.249763, -0.009924361, -1.127566, 1, 1, 1, 1, 1,
-1.24612, 0.1063442, -1.208048, 1, 1, 1, 1, 1,
-1.238389, 1.878013, 0.7647338, 1, 1, 1, 1, 1,
-1.202448, -0.3267046, -0.6080843, 1, 1, 1, 1, 1,
-1.198333, -0.2657089, -2.851791, 1, 1, 1, 1, 1,
-1.19625, -0.1424355, -1.327162, 1, 1, 1, 1, 1,
-1.194849, 2.098833, -0.7669794, 1, 1, 1, 1, 1,
-1.193881, 0.5036109, -0.8726026, 1, 1, 1, 1, 1,
-1.187241, 2.3935, -1.382937, 0, 0, 1, 1, 1,
-1.177318, 0.01379385, -2.248533, 1, 0, 0, 1, 1,
-1.17537, 1.036198, -0.7645493, 1, 0, 0, 1, 1,
-1.171071, 1.129044, -0.841529, 1, 0, 0, 1, 1,
-1.161125, -1.338631, -2.008014, 1, 0, 0, 1, 1,
-1.161002, -0.6037528, -3.786629, 1, 0, 0, 1, 1,
-1.156863, -1.748707, -2.109129, 0, 0, 0, 1, 1,
-1.156195, -0.6814907, -2.613523, 0, 0, 0, 1, 1,
-1.154618, -0.4949961, -1.649912, 0, 0, 0, 1, 1,
-1.14896, 0.761279, -0.8596308, 0, 0, 0, 1, 1,
-1.147972, -0.719716, 0.6934264, 0, 0, 0, 1, 1,
-1.145495, 1.682188, -1.794597, 0, 0, 0, 1, 1,
-1.13703, -1.337472, -0.4654492, 0, 0, 0, 1, 1,
-1.128436, 0.1966473, -0.7513338, 1, 1, 1, 1, 1,
-1.124564, -0.006075931, -0.6835518, 1, 1, 1, 1, 1,
-1.122028, 0.6960306, -3.301779, 1, 1, 1, 1, 1,
-1.114324, 0.5760348, -3.287089, 1, 1, 1, 1, 1,
-1.113259, -0.9034685, -1.50969, 1, 1, 1, 1, 1,
-1.100506, -0.9302539, -1.243555, 1, 1, 1, 1, 1,
-1.099168, 1.485018, -2.331249, 1, 1, 1, 1, 1,
-1.097185, 0.9862267, -0.8871052, 1, 1, 1, 1, 1,
-1.097101, -1.047665, -1.000936, 1, 1, 1, 1, 1,
-1.095586, -1.503783, -3.004276, 1, 1, 1, 1, 1,
-1.092367, 0.9026858, -0.1629865, 1, 1, 1, 1, 1,
-1.09033, 1.300042, -0.3075654, 1, 1, 1, 1, 1,
-1.089226, -0.02597801, -1.317607, 1, 1, 1, 1, 1,
-1.088751, -0.6875532, -2.795749, 1, 1, 1, 1, 1,
-1.084837, -0.6721402, -2.202016, 1, 1, 1, 1, 1,
-1.07978, 0.2754669, -2.371474, 0, 0, 1, 1, 1,
-1.075284, -0.3383862, -1.352287, 1, 0, 0, 1, 1,
-1.072443, 0.3933546, -0.7122287, 1, 0, 0, 1, 1,
-1.06903, 0.03038616, -0.3885272, 1, 0, 0, 1, 1,
-1.066011, -1.020722, -2.920053, 1, 0, 0, 1, 1,
-1.064196, -0.2250202, -1.794626, 1, 0, 0, 1, 1,
-1.061831, 0.3887896, -1.426305, 0, 0, 0, 1, 1,
-1.060299, -1.005985, -1.045857, 0, 0, 0, 1, 1,
-1.060208, -0.2469202, -0.9647824, 0, 0, 0, 1, 1,
-1.056194, -0.3469459, -1.516449, 0, 0, 0, 1, 1,
-1.052028, -0.08296282, -1.764115, 0, 0, 0, 1, 1,
-1.050426, 0.5883417, -0.8083015, 0, 0, 0, 1, 1,
-1.04938, -0.8698673, -3.17329, 0, 0, 0, 1, 1,
-1.039709, -0.6562321, -4.123914, 1, 1, 1, 1, 1,
-1.034622, -1.79603, -1.851243, 1, 1, 1, 1, 1,
-1.032952, -0.1741811, 0.9493779, 1, 1, 1, 1, 1,
-1.029687, -1.716072, -1.540869, 1, 1, 1, 1, 1,
-1.024534, 0.9481501, -3.395772, 1, 1, 1, 1, 1,
-1.02161, -0.4863919, -2.167622, 1, 1, 1, 1, 1,
-1.0203, -1.770703, -2.844373, 1, 1, 1, 1, 1,
-1.018811, 0.009281358, -1.364409, 1, 1, 1, 1, 1,
-1.016522, -0.7324688, -2.533229, 1, 1, 1, 1, 1,
-1.016513, -1.121537, -3.289422, 1, 1, 1, 1, 1,
-1.012891, 0.7659111, -0.4584944, 1, 1, 1, 1, 1,
-1.006996, 1.20235, 0.7233816, 1, 1, 1, 1, 1,
-0.9986277, 1.382575, -0.2509591, 1, 1, 1, 1, 1,
-0.9934616, 1.042706, -0.6268966, 1, 1, 1, 1, 1,
-0.9851864, -0.9985476, -2.631254, 1, 1, 1, 1, 1,
-0.9814426, 1.157648, -0.6287047, 0, 0, 1, 1, 1,
-0.9783375, -2.409814, -3.207196, 1, 0, 0, 1, 1,
-0.9780593, 0.1591482, -2.406972, 1, 0, 0, 1, 1,
-0.9729297, 0.5764222, 1.265203, 1, 0, 0, 1, 1,
-0.968523, 1.789169, -0.5482298, 1, 0, 0, 1, 1,
-0.9618907, 0.5574931, 0.5014403, 1, 0, 0, 1, 1,
-0.954127, -1.950473, -3.401578, 0, 0, 0, 1, 1,
-0.9512725, -0.4353089, -2.806744, 0, 0, 0, 1, 1,
-0.9508948, -0.5582472, -1.823038, 0, 0, 0, 1, 1,
-0.9407328, -0.9474221, -2.427184, 0, 0, 0, 1, 1,
-0.9358603, -1.555798, -3.318151, 0, 0, 0, 1, 1,
-0.9351668, 0.1501503, -1.50706, 0, 0, 0, 1, 1,
-0.9343679, 0.1129404, -2.69731, 0, 0, 0, 1, 1,
-0.9263284, 0.02245277, -0.8757557, 1, 1, 1, 1, 1,
-0.925551, -0.06790058, -0.38895, 1, 1, 1, 1, 1,
-0.9251971, 0.2029899, 0.02586366, 1, 1, 1, 1, 1,
-0.9174898, -0.02346268, -1.251679, 1, 1, 1, 1, 1,
-0.908573, -0.0703024, -2.788611, 1, 1, 1, 1, 1,
-0.9058993, -0.09644402, -0.4739985, 1, 1, 1, 1, 1,
-0.8986554, -1.05779, -1.47348, 1, 1, 1, 1, 1,
-0.8980373, -0.1585218, -1.124304, 1, 1, 1, 1, 1,
-0.8962795, 2.253484, -0.6226495, 1, 1, 1, 1, 1,
-0.8888709, -1.134843, -3.452786, 1, 1, 1, 1, 1,
-0.8874653, -0.7153271, -1.344182, 1, 1, 1, 1, 1,
-0.8845633, -0.77504, -1.080911, 1, 1, 1, 1, 1,
-0.8813962, 0.4356369, -1.51971, 1, 1, 1, 1, 1,
-0.8788612, -0.9857831, -0.8492958, 1, 1, 1, 1, 1,
-0.8775077, 0.5096352, -0.8630127, 1, 1, 1, 1, 1,
-0.8755549, -0.442233, -2.525032, 0, 0, 1, 1, 1,
-0.8750402, -0.1223326, -1.816445, 1, 0, 0, 1, 1,
-0.8742191, 1.249568, -0.2282611, 1, 0, 0, 1, 1,
-0.8721435, -0.1928424, -1.012164, 1, 0, 0, 1, 1,
-0.8708336, -0.05672159, -2.87386, 1, 0, 0, 1, 1,
-0.8705685, -0.5097439, -1.602554, 1, 0, 0, 1, 1,
-0.8683182, -2.983428, -2.400922, 0, 0, 0, 1, 1,
-0.8667974, -2.426542, -2.872041, 0, 0, 0, 1, 1,
-0.8659288, 0.1353235, -1.385226, 0, 0, 0, 1, 1,
-0.8658308, -0.3518978, -1.191339, 0, 0, 0, 1, 1,
-0.8644192, 1.928037, 1.314586, 0, 0, 0, 1, 1,
-0.8618382, 0.9747603, -0.9863682, 0, 0, 0, 1, 1,
-0.8618219, 0.9781004, 0.3936244, 0, 0, 0, 1, 1,
-0.8607312, -0.6336508, -0.4456601, 1, 1, 1, 1, 1,
-0.8603469, -0.3599088, -1.671452, 1, 1, 1, 1, 1,
-0.8551357, 0.8758969, -1.147991, 1, 1, 1, 1, 1,
-0.8533764, 0.3448913, 0.6243373, 1, 1, 1, 1, 1,
-0.8499645, -0.394842, 0.1033326, 1, 1, 1, 1, 1,
-0.8494933, 1.102313, -0.6247243, 1, 1, 1, 1, 1,
-0.8483739, -0.5180935, -1.700968, 1, 1, 1, 1, 1,
-0.8461444, 0.8107218, -1.396827, 1, 1, 1, 1, 1,
-0.8437587, -0.501994, -1.194252, 1, 1, 1, 1, 1,
-0.8427774, 0.3679796, 0.2159763, 1, 1, 1, 1, 1,
-0.8424391, 0.1632762, -0.4449545, 1, 1, 1, 1, 1,
-0.8382843, 0.09355641, -1.717233, 1, 1, 1, 1, 1,
-0.8362184, -0.5160533, -1.707857, 1, 1, 1, 1, 1,
-0.8335881, -0.001895555, -0.8557539, 1, 1, 1, 1, 1,
-0.8323483, 1.002325, -0.6651673, 1, 1, 1, 1, 1,
-0.8308387, 1.694836, 0.2829088, 0, 0, 1, 1, 1,
-0.822282, 0.1723072, -1.351752, 1, 0, 0, 1, 1,
-0.8215333, -1.652942, -3.019359, 1, 0, 0, 1, 1,
-0.8207026, -0.3755797, -2.199638, 1, 0, 0, 1, 1,
-0.8201444, 1.521306, 0.003598295, 1, 0, 0, 1, 1,
-0.8135139, 0.4249992, 0.2532932, 1, 0, 0, 1, 1,
-0.8109133, 0.8091793, 0.4818197, 0, 0, 0, 1, 1,
-0.8069991, -0.07017443, -0.9105873, 0, 0, 0, 1, 1,
-0.8015223, -0.09620796, -1.950683, 0, 0, 0, 1, 1,
-0.8003439, 0.08822766, -1.961705, 0, 0, 0, 1, 1,
-0.795198, -1.365822, -4.642862, 0, 0, 0, 1, 1,
-0.7938228, 0.3133967, -0.4136613, 0, 0, 0, 1, 1,
-0.7923818, -0.2778886, -2.04639, 0, 0, 0, 1, 1,
-0.7878998, 0.6109073, -1.060788, 1, 1, 1, 1, 1,
-0.7833602, -1.422563, -3.234229, 1, 1, 1, 1, 1,
-0.7821918, 0.6283656, -1.404014, 1, 1, 1, 1, 1,
-0.7802954, -0.3947972, -1.958801, 1, 1, 1, 1, 1,
-0.7765075, -1.069113, -2.144116, 1, 1, 1, 1, 1,
-0.773391, -0.04218461, -1.837982, 1, 1, 1, 1, 1,
-0.7693501, -0.4324188, 0.1036995, 1, 1, 1, 1, 1,
-0.767249, -0.4540311, -2.88147, 1, 1, 1, 1, 1,
-0.7652647, 0.4842829, -0.8967806, 1, 1, 1, 1, 1,
-0.76503, -0.4345523, -1.349085, 1, 1, 1, 1, 1,
-0.7565662, 1.527342, 0.8852476, 1, 1, 1, 1, 1,
-0.7503052, 0.1716092, -0.597118, 1, 1, 1, 1, 1,
-0.7478945, -0.2300094, -2.049052, 1, 1, 1, 1, 1,
-0.7476444, -0.7704709, -2.556076, 1, 1, 1, 1, 1,
-0.7473848, 0.5937837, -2.53255, 1, 1, 1, 1, 1,
-0.7370557, 0.725619, -1.300017, 0, 0, 1, 1, 1,
-0.7317457, 0.5394497, -1.435912, 1, 0, 0, 1, 1,
-0.7305592, -0.7544909, -1.911848, 1, 0, 0, 1, 1,
-0.7274592, -0.6408734, -1.940928, 1, 0, 0, 1, 1,
-0.7252151, 0.7642953, 0.1647679, 1, 0, 0, 1, 1,
-0.7209123, -0.1813233, 0.4321913, 1, 0, 0, 1, 1,
-0.7180043, 1.08936, -0.65406, 0, 0, 0, 1, 1,
-0.7136247, 1.369966, -1.353277, 0, 0, 0, 1, 1,
-0.7127748, -0.6447569, -3.531864, 0, 0, 0, 1, 1,
-0.7126572, -0.9242771, -3.908799, 0, 0, 0, 1, 1,
-0.7104011, -0.3047831, -1.382033, 0, 0, 0, 1, 1,
-0.7099445, -0.8719103, -1.95699, 0, 0, 0, 1, 1,
-0.7093678, -0.7389257, -2.694329, 0, 0, 0, 1, 1,
-0.7078664, 1.255519, 0.4860241, 1, 1, 1, 1, 1,
-0.7045223, -1.079258, -3.286963, 1, 1, 1, 1, 1,
-0.7016568, 1.378788, 0.673241, 1, 1, 1, 1, 1,
-0.6968319, -0.5543078, -1.386412, 1, 1, 1, 1, 1,
-0.6953294, -0.5316821, -1.988214, 1, 1, 1, 1, 1,
-0.6950624, 0.1646019, -2.661726, 1, 1, 1, 1, 1,
-0.6911003, 1.341339, -1.068354, 1, 1, 1, 1, 1,
-0.6910844, 1.161879, -0.2894889, 1, 1, 1, 1, 1,
-0.6856506, 0.330166, -0.06008529, 1, 1, 1, 1, 1,
-0.6777397, 0.5957134, -3.472206, 1, 1, 1, 1, 1,
-0.6720148, 1.615464, 1.426573, 1, 1, 1, 1, 1,
-0.6709984, 1.843419, -1.127494, 1, 1, 1, 1, 1,
-0.6682379, 0.4395349, -1.326481, 1, 1, 1, 1, 1,
-0.6672787, 0.7659801, 0.2998126, 1, 1, 1, 1, 1,
-0.6662104, 0.9312769, -0.05283634, 1, 1, 1, 1, 1,
-0.6621555, -0.9960738, -2.996284, 0, 0, 1, 1, 1,
-0.6564159, -0.2140934, 0.06405808, 1, 0, 0, 1, 1,
-0.6488908, -0.1032995, -1.322301, 1, 0, 0, 1, 1,
-0.6427696, -1.628215, -3.814603, 1, 0, 0, 1, 1,
-0.640525, 1.31087, 0.4180016, 1, 0, 0, 1, 1,
-0.6302115, -0.05460911, -2.861973, 1, 0, 0, 1, 1,
-0.6285374, 0.5392437, -0.4573077, 0, 0, 0, 1, 1,
-0.6278964, 0.1518166, -0.8179414, 0, 0, 0, 1, 1,
-0.6265274, 0.9769185, -0.9675255, 0, 0, 0, 1, 1,
-0.6233053, 0.731926, 0.6290055, 0, 0, 0, 1, 1,
-0.6204001, -2.754896, -2.787138, 0, 0, 0, 1, 1,
-0.6153117, -1.063406, -2.010098, 0, 0, 0, 1, 1,
-0.5959219, -0.5098013, -3.274716, 0, 0, 0, 1, 1,
-0.5951542, -0.6795461, -1.111203, 1, 1, 1, 1, 1,
-0.5939676, -0.6401878, -2.916453, 1, 1, 1, 1, 1,
-0.5938236, -0.554352, -1.774021, 1, 1, 1, 1, 1,
-0.5916612, -1.161779, -3.558714, 1, 1, 1, 1, 1,
-0.5898162, 0.4852544, -0.6213485, 1, 1, 1, 1, 1,
-0.5890885, -0.5025811, -2.045884, 1, 1, 1, 1, 1,
-0.5860934, 0.9061621, -0.03614581, 1, 1, 1, 1, 1,
-0.5857406, 0.2034196, -0.3931642, 1, 1, 1, 1, 1,
-0.5791304, -0.03075692, -2.462695, 1, 1, 1, 1, 1,
-0.5786971, 0.8537552, 1.472927, 1, 1, 1, 1, 1,
-0.575129, 1.712999, 2.358839, 1, 1, 1, 1, 1,
-0.5709748, 0.3785799, 0.7862408, 1, 1, 1, 1, 1,
-0.5671831, -1.52588, -3.355055, 1, 1, 1, 1, 1,
-0.5630344, 0.1460879, -0.1828963, 1, 1, 1, 1, 1,
-0.5586389, 0.8450465, -1.778567, 1, 1, 1, 1, 1,
-0.558175, 0.8484163, -2.341906, 0, 0, 1, 1, 1,
-0.5581618, 0.1384771, -0.9260647, 1, 0, 0, 1, 1,
-0.5546637, -1.288335, -2.183637, 1, 0, 0, 1, 1,
-0.5527859, 1.587041, -0.7339298, 1, 0, 0, 1, 1,
-0.5522207, 0.5343224, -0.06053974, 1, 0, 0, 1, 1,
-0.5493872, 1.168628, 1.091024, 1, 0, 0, 1, 1,
-0.5473804, -0.5216776, -2.730168, 0, 0, 0, 1, 1,
-0.5460052, -1.037135, -3.451477, 0, 0, 0, 1, 1,
-0.5453235, -0.830367, -0.6652415, 0, 0, 0, 1, 1,
-0.5411118, 0.2078864, -1.816068, 0, 0, 0, 1, 1,
-0.5383043, -0.4134023, -2.424117, 0, 0, 0, 1, 1,
-0.5375562, -1.411136, -2.624869, 0, 0, 0, 1, 1,
-0.5369892, -0.03366299, -1.278941, 0, 0, 0, 1, 1,
-0.5340306, 0.193672, -0.6455918, 1, 1, 1, 1, 1,
-0.5324808, -1.517566, -3.608935, 1, 1, 1, 1, 1,
-0.5271986, -0.4138557, -2.103981, 1, 1, 1, 1, 1,
-0.5252175, 0.1775606, 0.2175138, 1, 1, 1, 1, 1,
-0.5238498, 0.3773441, -2.858625, 1, 1, 1, 1, 1,
-0.5182639, 0.6827605, -0.6310791, 1, 1, 1, 1, 1,
-0.5168589, -0.212458, -2.530466, 1, 1, 1, 1, 1,
-0.516181, 0.6830084, -1.3314, 1, 1, 1, 1, 1,
-0.5124436, 0.168904, -1.198342, 1, 1, 1, 1, 1,
-0.507159, -0.2328698, -0.8721, 1, 1, 1, 1, 1,
-0.5069534, -1.159272, -2.389129, 1, 1, 1, 1, 1,
-0.5041699, 0.8337139, 1.549047, 1, 1, 1, 1, 1,
-0.487065, 1.036376, -1.519518, 1, 1, 1, 1, 1,
-0.4819325, 1.134472, -1.590225, 1, 1, 1, 1, 1,
-0.4804629, 0.426275, 1.057337, 1, 1, 1, 1, 1,
-0.4796862, -0.1084636, -1.930223, 0, 0, 1, 1, 1,
-0.4782309, 0.822156, -0.3634548, 1, 0, 0, 1, 1,
-0.4780716, 0.3971093, -2.207882, 1, 0, 0, 1, 1,
-0.4775018, -1.871623, -4.821996, 1, 0, 0, 1, 1,
-0.4728436, -0.1279126, -2.130212, 1, 0, 0, 1, 1,
-0.4650044, -0.2619231, -0.3678786, 1, 0, 0, 1, 1,
-0.4642521, -0.03756187, -0.4416825, 0, 0, 0, 1, 1,
-0.4642501, 0.7592316, -0.282674, 0, 0, 0, 1, 1,
-0.4547194, 1.588466, -0.4829036, 0, 0, 0, 1, 1,
-0.453794, 0.5567029, -0.08425651, 0, 0, 0, 1, 1,
-0.4394934, 0.1447436, -0.9245905, 0, 0, 0, 1, 1,
-0.4364173, -0.5525795, -2.872203, 0, 0, 0, 1, 1,
-0.4361949, -1.030541, -3.563124, 0, 0, 0, 1, 1,
-0.4356747, 1.315747, 1.736822, 1, 1, 1, 1, 1,
-0.4290994, 0.3712132, 0.1019133, 1, 1, 1, 1, 1,
-0.4268345, 1.198114, -1.0979, 1, 1, 1, 1, 1,
-0.4245198, 0.9541732, 0.4948533, 1, 1, 1, 1, 1,
-0.4225859, -0.3172887, -3.486846, 1, 1, 1, 1, 1,
-0.4166261, -0.7240829, -1.185763, 1, 1, 1, 1, 1,
-0.414512, -1.530757, -4.023534, 1, 1, 1, 1, 1,
-0.4136124, 0.1828322, -2.445383, 1, 1, 1, 1, 1,
-0.4106934, 1.298005, -0.4793144, 1, 1, 1, 1, 1,
-0.4092132, -0.7124207, -3.108502, 1, 1, 1, 1, 1,
-0.407213, 1.82948, 0.08016082, 1, 1, 1, 1, 1,
-0.4034174, 1.294532, -1.951889, 1, 1, 1, 1, 1,
-0.4024652, 0.5045123, -0.7878314, 1, 1, 1, 1, 1,
-0.400775, -0.2377025, -3.542604, 1, 1, 1, 1, 1,
-0.3999952, -0.3985806, -2.650312, 1, 1, 1, 1, 1,
-0.3978541, 0.6738986, -0.04795099, 0, 0, 1, 1, 1,
-0.3964542, -1.183829, -1.464378, 1, 0, 0, 1, 1,
-0.3929603, -1.312876, -3.274081, 1, 0, 0, 1, 1,
-0.3888514, 0.6143537, -0.1402768, 1, 0, 0, 1, 1,
-0.3884578, -0.552887, -2.648956, 1, 0, 0, 1, 1,
-0.3866612, -1.456262, -2.120907, 1, 0, 0, 1, 1,
-0.3815747, 0.3054358, -1.754033, 0, 0, 0, 1, 1,
-0.3799027, -2.451502, -5.865497, 0, 0, 0, 1, 1,
-0.3789389, -1.814001, -3.205024, 0, 0, 0, 1, 1,
-0.3778566, 0.3274013, -0.8701135, 0, 0, 0, 1, 1,
-0.3631692, 1.078965, 0.2573864, 0, 0, 0, 1, 1,
-0.3600504, -0.8491179, -1.726896, 0, 0, 0, 1, 1,
-0.3596737, -0.1324097, 0.1611866, 0, 0, 0, 1, 1,
-0.3543494, 0.8524887, -0.4473968, 1, 1, 1, 1, 1,
-0.3538728, -0.5814868, -2.954398, 1, 1, 1, 1, 1,
-0.353275, -1.605838, -4.462357, 1, 1, 1, 1, 1,
-0.3483042, -0.9182441, -1.481052, 1, 1, 1, 1, 1,
-0.3424586, 0.6956712, 0.04354008, 1, 1, 1, 1, 1,
-0.3413444, 0.8628982, 1.531703, 1, 1, 1, 1, 1,
-0.3374294, -0.3980879, -0.5264181, 1, 1, 1, 1, 1,
-0.3338315, -0.04065444, -2.77549, 1, 1, 1, 1, 1,
-0.3304647, 0.1939926, 0.176319, 1, 1, 1, 1, 1,
-0.3303248, -1.509524, -2.280867, 1, 1, 1, 1, 1,
-0.3207157, 0.5912293, 0.9194518, 1, 1, 1, 1, 1,
-0.3196145, -0.7642958, -3.066596, 1, 1, 1, 1, 1,
-0.3188258, -0.7009662, -2.170865, 1, 1, 1, 1, 1,
-0.3157299, 0.4083911, -0.787199, 1, 1, 1, 1, 1,
-0.3106595, -0.4562987, -1.198565, 1, 1, 1, 1, 1,
-0.3017922, -0.4245499, -2.075667, 0, 0, 1, 1, 1,
-0.3013368, 0.8861691, -0.5002289, 1, 0, 0, 1, 1,
-0.2943251, -1.237816, -2.178137, 1, 0, 0, 1, 1,
-0.2932386, 0.171288, 0.9977877, 1, 0, 0, 1, 1,
-0.2921027, -0.7897275, -3.392562, 1, 0, 0, 1, 1,
-0.2878904, -1.779736, -3.446833, 1, 0, 0, 1, 1,
-0.2840351, -1.402895, -2.749844, 0, 0, 0, 1, 1,
-0.2834232, -0.5855851, -3.407364, 0, 0, 0, 1, 1,
-0.2817242, -1.302079, -2.469096, 0, 0, 0, 1, 1,
-0.2810509, -0.6080049, -5.761539, 0, 0, 0, 1, 1,
-0.2791215, 0.2939023, -0.5186828, 0, 0, 0, 1, 1,
-0.2730386, 0.5526779, 1.150183, 0, 0, 0, 1, 1,
-0.272853, -0.7615941, -2.104412, 0, 0, 0, 1, 1,
-0.2728267, -0.7227409, -1.868067, 1, 1, 1, 1, 1,
-0.2706974, 1.667633, -0.4641383, 1, 1, 1, 1, 1,
-0.2600607, -0.3106271, -3.771311, 1, 1, 1, 1, 1,
-0.2495059, 0.3349384, 0.1536528, 1, 1, 1, 1, 1,
-0.2482859, -0.2153915, -0.313879, 1, 1, 1, 1, 1,
-0.2475691, 0.6530023, -1.073992, 1, 1, 1, 1, 1,
-0.2440848, -0.1929602, -2.210298, 1, 1, 1, 1, 1,
-0.2437058, -2.302689, -2.656407, 1, 1, 1, 1, 1,
-0.2412793, -0.1945943, -2.687893, 1, 1, 1, 1, 1,
-0.2391686, -1.021366, -3.025707, 1, 1, 1, 1, 1,
-0.2377181, -1.30914, -2.531907, 1, 1, 1, 1, 1,
-0.2363787, -0.08983096, -2.264187, 1, 1, 1, 1, 1,
-0.2354416, 1.447224, 0.3141776, 1, 1, 1, 1, 1,
-0.2296418, 0.330824, -1.729177, 1, 1, 1, 1, 1,
-0.2282687, 1.035481, 1.142253, 1, 1, 1, 1, 1,
-0.2278061, -0.1326249, -2.478096, 0, 0, 1, 1, 1,
-0.2251641, -1.483904, -3.157808, 1, 0, 0, 1, 1,
-0.2213013, 1.52916, 0.7258584, 1, 0, 0, 1, 1,
-0.2092313, -0.9526193, -4.288628, 1, 0, 0, 1, 1,
-0.2090743, -1.113959, -3.525944, 1, 0, 0, 1, 1,
-0.208717, -0.6592555, -3.45976, 1, 0, 0, 1, 1,
-0.2082816, -1.222577, -3.118053, 0, 0, 0, 1, 1,
-0.2079753, 1.297038, 0.1314298, 0, 0, 0, 1, 1,
-0.2070803, 0.6239932, -1.614891, 0, 0, 0, 1, 1,
-0.2052215, 1.157234, -0.2961439, 0, 0, 0, 1, 1,
-0.2046133, -1.659247, -3.948447, 0, 0, 0, 1, 1,
-0.2039959, 1.00232, -0.2027232, 0, 0, 0, 1, 1,
-0.2011465, -0.05536579, -2.808631, 0, 0, 0, 1, 1,
-0.2000377, 0.3637158, -1.684547, 1, 1, 1, 1, 1,
-0.1995538, -0.9258125, -2.016831, 1, 1, 1, 1, 1,
-0.1983811, 0.8304939, -0.4825734, 1, 1, 1, 1, 1,
-0.1940561, 0.6048356, -0.1639421, 1, 1, 1, 1, 1,
-0.1906327, -0.4338307, -1.358524, 1, 1, 1, 1, 1,
-0.1879282, -0.7017897, -2.230173, 1, 1, 1, 1, 1,
-0.1862767, -0.7615428, -1.951512, 1, 1, 1, 1, 1,
-0.17798, -0.1887372, -1.708998, 1, 1, 1, 1, 1,
-0.1751984, 0.3936141, -0.5848919, 1, 1, 1, 1, 1,
-0.1712944, -0.6285663, -3.111444, 1, 1, 1, 1, 1,
-0.1712369, -1.628662, -2.123457, 1, 1, 1, 1, 1,
-0.1673587, -0.5039812, -2.426635, 1, 1, 1, 1, 1,
-0.1595114, -0.3050947, -1.474325, 1, 1, 1, 1, 1,
-0.1594087, 0.4560248, 2.358409, 1, 1, 1, 1, 1,
-0.1571255, 0.003918224, -0.9174394, 1, 1, 1, 1, 1,
-0.1565215, -1.286343, -2.847426, 0, 0, 1, 1, 1,
-0.1563215, 0.1364167, 0.1681696, 1, 0, 0, 1, 1,
-0.1518733, 0.2119547, -0.2729361, 1, 0, 0, 1, 1,
-0.1418926, -0.3712736, -2.281903, 1, 0, 0, 1, 1,
-0.139298, -0.09581485, -2.744191, 1, 0, 0, 1, 1,
-0.1351311, -0.8521605, -1.928285, 1, 0, 0, 1, 1,
-0.1349999, -0.6186957, -1.626109, 0, 0, 0, 1, 1,
-0.1330155, 0.8760824, 1.157434, 0, 0, 0, 1, 1,
-0.126066, -1.599158, -4.263633, 0, 0, 0, 1, 1,
-0.1185268, -1.271052, -4.580613, 0, 0, 0, 1, 1,
-0.1154412, -0.4219783, -2.925387, 0, 0, 0, 1, 1,
-0.1116236, 2.771898, 0.92314, 0, 0, 0, 1, 1,
-0.1098353, 0.4970748, 0.8840931, 0, 0, 0, 1, 1,
-0.1088198, 0.6227527, 1.024827, 1, 1, 1, 1, 1,
-0.1072417, -1.047241, -3.653164, 1, 1, 1, 1, 1,
-0.1024723, -0.1795161, -3.396992, 1, 1, 1, 1, 1,
-0.1005033, -1.238879, -2.151893, 1, 1, 1, 1, 1,
-0.09785062, -0.3501294, -3.17573, 1, 1, 1, 1, 1,
-0.0943883, -0.1944948, -2.52418, 1, 1, 1, 1, 1,
-0.09062164, 1.102181, -1.311667, 1, 1, 1, 1, 1,
-0.08674627, 0.1343681, -0.4847853, 1, 1, 1, 1, 1,
-0.08666742, -0.2884944, -3.663623, 1, 1, 1, 1, 1,
-0.08528121, 2.157267, -2.447013, 1, 1, 1, 1, 1,
-0.0850378, -0.8509849, -3.158133, 1, 1, 1, 1, 1,
-0.0845992, -2.422516, -4.393282, 1, 1, 1, 1, 1,
-0.08459891, -0.1064481, -3.155816, 1, 1, 1, 1, 1,
-0.08129084, 2.132267, -0.4428278, 1, 1, 1, 1, 1,
-0.07834851, 0.01333448, -1.595962, 1, 1, 1, 1, 1,
-0.07737796, 1.108965, -0.8299987, 0, 0, 1, 1, 1,
-0.07156576, -0.04066365, -3.0913, 1, 0, 0, 1, 1,
-0.06921269, 0.6622638, -0.371049, 1, 0, 0, 1, 1,
-0.06405859, 0.4294391, -0.749255, 1, 0, 0, 1, 1,
-0.06139167, 1.424417, 0.6343237, 1, 0, 0, 1, 1,
-0.05779935, 1.080254, 1.33259, 1, 0, 0, 1, 1,
-0.05646507, -0.4251375, -2.516437, 0, 0, 0, 1, 1,
-0.05608276, -1.335883, -2.839166, 0, 0, 0, 1, 1,
-0.05314038, 0.3029405, -1.840038, 0, 0, 0, 1, 1,
-0.05304336, -0.484923, -4.902449, 0, 0, 0, 1, 1,
-0.05248269, 0.6151403, -0.8433955, 0, 0, 0, 1, 1,
-0.05220621, -1.697078, -2.132942, 0, 0, 0, 1, 1,
-0.04601171, 0.5937303, -0.1738223, 0, 0, 0, 1, 1,
-0.04512529, 1.926721, 0.8507164, 1, 1, 1, 1, 1,
-0.03867127, 1.756803, 0.3400692, 1, 1, 1, 1, 1,
-0.03442322, -0.4524658, -3.975013, 1, 1, 1, 1, 1,
-0.02442658, -1.394999, -3.275768, 1, 1, 1, 1, 1,
-0.02401529, -0.1252647, -3.420756, 1, 1, 1, 1, 1,
-0.02188162, -0.8921284, -4.401852, 1, 1, 1, 1, 1,
-0.02132586, -1.182431, -2.630354, 1, 1, 1, 1, 1,
-0.0169413, 0.5279385, -1.127938, 1, 1, 1, 1, 1,
-0.006164536, -0.4688673, -3.398392, 1, 1, 1, 1, 1,
-0.002344412, 1.160563, 0.9289889, 1, 1, 1, 1, 1,
0.001468462, -0.6423789, 4.596313, 1, 1, 1, 1, 1,
0.00269006, -0.1739572, 2.812432, 1, 1, 1, 1, 1,
0.00426359, -0.4149516, 2.749484, 1, 1, 1, 1, 1,
0.009747538, 2.219509, -0.1157217, 1, 1, 1, 1, 1,
0.01027102, -0.1495814, 2.72136, 1, 1, 1, 1, 1,
0.01228548, 1.95669, 1.243878, 0, 0, 1, 1, 1,
0.01502472, -0.5894531, 2.425406, 1, 0, 0, 1, 1,
0.01592938, 2.754886, -0.006584377, 1, 0, 0, 1, 1,
0.01945241, -0.7393934, 3.685452, 1, 0, 0, 1, 1,
0.02457893, 0.4593684, 0.6492549, 1, 0, 0, 1, 1,
0.02925389, 2.560721, -0.8653591, 1, 0, 0, 1, 1,
0.02998593, 0.2948965, 0.516996, 0, 0, 0, 1, 1,
0.03203578, -0.2053108, 3.730675, 0, 0, 0, 1, 1,
0.03543405, -0.1376174, 4.07296, 0, 0, 0, 1, 1,
0.03668043, -1.451176, 0.7737685, 0, 0, 0, 1, 1,
0.04114445, 2.043848, 0.7304252, 0, 0, 0, 1, 1,
0.04745677, 0.2195524, 1.499494, 0, 0, 0, 1, 1,
0.0512399, -1.258322, 1.913283, 0, 0, 0, 1, 1,
0.05136636, -0.6448277, 3.5874, 1, 1, 1, 1, 1,
0.05196297, 0.7291355, 0.2822949, 1, 1, 1, 1, 1,
0.05419952, 0.2241127, -0.2935966, 1, 1, 1, 1, 1,
0.05430797, -0.5872258, 4.43202, 1, 1, 1, 1, 1,
0.0553381, -1.368062, 3.126523, 1, 1, 1, 1, 1,
0.05705012, -1.264456, 4.95389, 1, 1, 1, 1, 1,
0.05907358, 0.2624844, -0.8141231, 1, 1, 1, 1, 1,
0.06198948, 0.3908479, -0.8299249, 1, 1, 1, 1, 1,
0.07256565, -0.5799925, 3.796845, 1, 1, 1, 1, 1,
0.07422727, -0.1103175, 2.61305, 1, 1, 1, 1, 1,
0.07743473, 1.114612, -1.331353, 1, 1, 1, 1, 1,
0.07834523, -0.8276848, 2.349801, 1, 1, 1, 1, 1,
0.07893583, -0.478225, 4.340355, 1, 1, 1, 1, 1,
0.07981816, 0.4088611, 0.09646315, 1, 1, 1, 1, 1,
0.07982251, -0.5574528, 3.941017, 1, 1, 1, 1, 1,
0.08026415, -0.3363134, 2.265754, 0, 0, 1, 1, 1,
0.08253288, -0.4616462, 1.758332, 1, 0, 0, 1, 1,
0.08876318, -0.6257305, 1.64119, 1, 0, 0, 1, 1,
0.09423064, -0.5239899, 2.549132, 1, 0, 0, 1, 1,
0.09672464, 1.902364, 1.948396, 1, 0, 0, 1, 1,
0.09715267, -0.4730126, 2.705614, 1, 0, 0, 1, 1,
0.09717182, -0.2100921, 2.486698, 0, 0, 0, 1, 1,
0.1015174, 0.9020721, -0.302896, 0, 0, 0, 1, 1,
0.1017993, -1.040194, 2.779288, 0, 0, 0, 1, 1,
0.1063961, -0.1566937, 1.798689, 0, 0, 0, 1, 1,
0.1112116, 0.2781082, 1.919495, 0, 0, 0, 1, 1,
0.1130517, 1.461053, -0.1866588, 0, 0, 0, 1, 1,
0.1143349, 0.2961471, 1.276707, 0, 0, 0, 1, 1,
0.1152266, 0.9284326, 0.6983889, 1, 1, 1, 1, 1,
0.1177157, -0.6229168, 3.046804, 1, 1, 1, 1, 1,
0.1180597, -0.1208169, 3.068133, 1, 1, 1, 1, 1,
0.1248971, 0.7695463, -1.442589, 1, 1, 1, 1, 1,
0.1268096, 0.8099075, -1.037015, 1, 1, 1, 1, 1,
0.1273983, 0.2433867, 1.937806, 1, 1, 1, 1, 1,
0.1287649, -0.1180198, 2.606686, 1, 1, 1, 1, 1,
0.1320652, -0.2180936, 2.637538, 1, 1, 1, 1, 1,
0.1351339, -0.7295666, 3.551809, 1, 1, 1, 1, 1,
0.1352176, -0.05322728, 1.199679, 1, 1, 1, 1, 1,
0.1353998, -1.716845, 2.789468, 1, 1, 1, 1, 1,
0.1355787, -0.1267072, 2.20897, 1, 1, 1, 1, 1,
0.1355902, -0.3183018, 1.187864, 1, 1, 1, 1, 1,
0.1371105, 1.445017, -0.8516704, 1, 1, 1, 1, 1,
0.1386934, 1.426876, 0.6319534, 1, 1, 1, 1, 1,
0.1526094, -0.2046325, 1.542408, 0, 0, 1, 1, 1,
0.1529084, -0.5386847, 3.965857, 1, 0, 0, 1, 1,
0.1533025, 0.3461272, -0.7794716, 1, 0, 0, 1, 1,
0.15578, 1.241857, 1.14659, 1, 0, 0, 1, 1,
0.1560056, -0.4570931, 4.279165, 1, 0, 0, 1, 1,
0.1566385, -0.3266047, 2.260679, 1, 0, 0, 1, 1,
0.1589793, 0.04053995, -0.108533, 0, 0, 0, 1, 1,
0.1592643, -0.3133811, 2.918396, 0, 0, 0, 1, 1,
0.1613418, 0.3809462, 1.679371, 0, 0, 0, 1, 1,
0.1637415, 0.28563, -0.2787868, 0, 0, 0, 1, 1,
0.1651188, 0.04440921, 1.363013, 0, 0, 0, 1, 1,
0.1702436, 0.6032258, -0.2495751, 0, 0, 0, 1, 1,
0.1733392, 0.5973008, -0.821448, 0, 0, 0, 1, 1,
0.1742066, 2.281269, 0.8618104, 1, 1, 1, 1, 1,
0.1766387, -1.658963, 3.556303, 1, 1, 1, 1, 1,
0.1794551, 0.8165624, -0.7889639, 1, 1, 1, 1, 1,
0.1866383, -1.948793, 2.747416, 1, 1, 1, 1, 1,
0.1871247, -0.2423439, 3.473454, 1, 1, 1, 1, 1,
0.188496, 1.018655, -0.8535678, 1, 1, 1, 1, 1,
0.1891744, 1.300406, 0.7471889, 1, 1, 1, 1, 1,
0.1918643, 1.657454, -0.3366552, 1, 1, 1, 1, 1,
0.1984781, 0.4193586, -0.1973102, 1, 1, 1, 1, 1,
0.2000268, 0.344228, 1.460711, 1, 1, 1, 1, 1,
0.2001008, 1.819103, -0.06750757, 1, 1, 1, 1, 1,
0.2026443, 0.8006186, 0.1256561, 1, 1, 1, 1, 1,
0.2029501, 0.3571981, 0.513982, 1, 1, 1, 1, 1,
0.2033106, -0.736837, 1.551658, 1, 1, 1, 1, 1,
0.2152767, -0.5340549, 2.425052, 1, 1, 1, 1, 1,
0.2178827, 1.216866, 0.657882, 0, 0, 1, 1, 1,
0.2186611, 0.1430474, 1.680415, 1, 0, 0, 1, 1,
0.2261866, -0.0007112659, 0.5831712, 1, 0, 0, 1, 1,
0.2265588, 1.50855, 1.110927, 1, 0, 0, 1, 1,
0.2296561, -0.9801111, 2.08533, 1, 0, 0, 1, 1,
0.2336578, 0.1268842, -0.2595944, 1, 0, 0, 1, 1,
0.2336881, 0.4069821, 0.2651769, 0, 0, 0, 1, 1,
0.235695, 0.8123433, -0.8138477, 0, 0, 0, 1, 1,
0.2369267, 0.1200914, 3.385958, 0, 0, 0, 1, 1,
0.2407705, -1.022452, 1.870745, 0, 0, 0, 1, 1,
0.2542385, -1.976445, 5.218521, 0, 0, 0, 1, 1,
0.254265, -0.2088829, 3.008981, 0, 0, 0, 1, 1,
0.2555565, 0.1263659, 2.056782, 0, 0, 0, 1, 1,
0.2559814, -0.5687724, 3.477038, 1, 1, 1, 1, 1,
0.2614573, -1.086042, 1.895518, 1, 1, 1, 1, 1,
0.2633133, -0.4468163, 0.6574938, 1, 1, 1, 1, 1,
0.2696766, -0.2732732, 2.640347, 1, 1, 1, 1, 1,
0.2736464, -0.7955664, 2.461022, 1, 1, 1, 1, 1,
0.2761987, -0.01641062, -0.198064, 1, 1, 1, 1, 1,
0.280017, 1.599924, -0.2867753, 1, 1, 1, 1, 1,
0.2806922, -0.2495706, 2.250308, 1, 1, 1, 1, 1,
0.2833692, -0.8727027, 2.622776, 1, 1, 1, 1, 1,
0.2844294, 1.000704, 0.6839387, 1, 1, 1, 1, 1,
0.2852134, -1.355551, 2.777892, 1, 1, 1, 1, 1,
0.2871599, 0.823667, 1.118153, 1, 1, 1, 1, 1,
0.2923045, 3.590436, -1.160335, 1, 1, 1, 1, 1,
0.2929852, 0.7370625, -1.282243, 1, 1, 1, 1, 1,
0.3005849, -0.6258255, 2.317692, 1, 1, 1, 1, 1,
0.3023594, -0.514608, 1.470865, 0, 0, 1, 1, 1,
0.3025236, -0.2377857, 1.646446, 1, 0, 0, 1, 1,
0.3062894, -0.2013707, 1.635554, 1, 0, 0, 1, 1,
0.3111607, -0.6208441, 3.436839, 1, 0, 0, 1, 1,
0.3126908, -1.43713, 1.87234, 1, 0, 0, 1, 1,
0.3165363, -0.1055793, 1.824319, 1, 0, 0, 1, 1,
0.3205365, 0.4264597, -0.844024, 0, 0, 0, 1, 1,
0.3219136, 0.009782438, 0.1878771, 0, 0, 0, 1, 1,
0.3227201, -0.7521388, 1.507946, 0, 0, 0, 1, 1,
0.3281956, -0.2059219, 2.000175, 0, 0, 0, 1, 1,
0.3314746, -0.5832114, 2.324329, 0, 0, 0, 1, 1,
0.3344799, -1.593512, 2.435158, 0, 0, 0, 1, 1,
0.3353101, 0.1727837, -0.1614308, 0, 0, 0, 1, 1,
0.3394289, -0.3764452, 2.793085, 1, 1, 1, 1, 1,
0.3413743, 0.05789614, 1.433159, 1, 1, 1, 1, 1,
0.3419364, -0.005974453, 1.578795, 1, 1, 1, 1, 1,
0.3447085, -0.7496992, 3.252183, 1, 1, 1, 1, 1,
0.3480678, 0.684868, 1.682858, 1, 1, 1, 1, 1,
0.3512918, 0.9241279, -0.962997, 1, 1, 1, 1, 1,
0.352251, -0.433537, 3.371354, 1, 1, 1, 1, 1,
0.3550349, 0.09283961, 3.020129, 1, 1, 1, 1, 1,
0.3564947, -0.3224844, 1.77319, 1, 1, 1, 1, 1,
0.3648773, 0.08331547, 1.400877, 1, 1, 1, 1, 1,
0.3656048, -0.6156117, 3.328711, 1, 1, 1, 1, 1,
0.3665758, -0.05110867, 2.125697, 1, 1, 1, 1, 1,
0.3731898, -0.1978748, 2.223069, 1, 1, 1, 1, 1,
0.3733665, 0.509508, 0.9468822, 1, 1, 1, 1, 1,
0.3801001, 1.505454, 0.543241, 1, 1, 1, 1, 1,
0.3812504, 0.0451078, 1.992241, 0, 0, 1, 1, 1,
0.3830154, -0.3369918, 3.024416, 1, 0, 0, 1, 1,
0.3833653, 0.4009807, 1.343649, 1, 0, 0, 1, 1,
0.3846967, 1.379558, 0.3618787, 1, 0, 0, 1, 1,
0.3861614, -0.128687, 0.9264218, 1, 0, 0, 1, 1,
0.3891806, -0.967989, 3.7886, 1, 0, 0, 1, 1,
0.3973604, -1.023332, 2.642259, 0, 0, 0, 1, 1,
0.4032684, 0.1163492, 1.39589, 0, 0, 0, 1, 1,
0.4074685, -0.6479957, 0.5174595, 0, 0, 0, 1, 1,
0.414177, 1.558129, 1.445725, 0, 0, 0, 1, 1,
0.4157375, 0.4794193, -1.137404, 0, 0, 0, 1, 1,
0.4162081, 0.615793, 0.7252899, 0, 0, 0, 1, 1,
0.4186301, -1.099229, 1.580086, 0, 0, 0, 1, 1,
0.4199637, -0.2533316, 3.465923, 1, 1, 1, 1, 1,
0.4228108, 0.04538928, 3.586409, 1, 1, 1, 1, 1,
0.4232649, 0.4862137, -0.626935, 1, 1, 1, 1, 1,
0.4240343, 0.9945146, -0.595467, 1, 1, 1, 1, 1,
0.4249646, -1.47994, 3.610454, 1, 1, 1, 1, 1,
0.4293393, -0.5690566, 1.380394, 1, 1, 1, 1, 1,
0.4305813, 0.1082313, 2.851382, 1, 1, 1, 1, 1,
0.4325792, 0.2933687, 2.896245, 1, 1, 1, 1, 1,
0.4329815, -1.349067, 2.16764, 1, 1, 1, 1, 1,
0.4377903, 0.8818325, 1.697786, 1, 1, 1, 1, 1,
0.4391225, -1.498592, 2.531905, 1, 1, 1, 1, 1,
0.4425982, 0.7476189, 1.3269, 1, 1, 1, 1, 1,
0.4444729, 1.027732, -1.459365, 1, 1, 1, 1, 1,
0.4451899, -0.3315436, 3.341947, 1, 1, 1, 1, 1,
0.4454185, -1.364822, 4.459432, 1, 1, 1, 1, 1,
0.4495567, 0.6329018, 1.600205, 0, 0, 1, 1, 1,
0.4553938, 0.9350497, 0.8727297, 1, 0, 0, 1, 1,
0.457665, 0.370023, 0.7080796, 1, 0, 0, 1, 1,
0.4628901, 1.73887, -0.2078141, 1, 0, 0, 1, 1,
0.4650917, -0.844804, 2.894043, 1, 0, 0, 1, 1,
0.4662358, 0.1720576, -0.07082486, 1, 0, 0, 1, 1,
0.4724072, -0.7695632, 2.863042, 0, 0, 0, 1, 1,
0.47405, 1.516931, 1.122239, 0, 0, 0, 1, 1,
0.4753404, -0.4302958, 1.689289, 0, 0, 0, 1, 1,
0.4838042, -0.4057462, 3.303829, 0, 0, 0, 1, 1,
0.4850169, -0.9081239, 1.962698, 0, 0, 0, 1, 1,
0.48635, -1.298302, 2.356257, 0, 0, 0, 1, 1,
0.4882437, 0.02731265, 0.8744981, 0, 0, 0, 1, 1,
0.49065, -1.498942, 1.6385, 1, 1, 1, 1, 1,
0.4912803, 0.8324435, 0.4417408, 1, 1, 1, 1, 1,
0.4938359, 1.119801, 0.7682579, 1, 1, 1, 1, 1,
0.4959634, 0.3655575, 1.129876, 1, 1, 1, 1, 1,
0.498764, 1.670373, -1.104909, 1, 1, 1, 1, 1,
0.4988401, 0.2679569, 0.724712, 1, 1, 1, 1, 1,
0.5019295, 1.168507, 0.122946, 1, 1, 1, 1, 1,
0.5128396, -1.302289, 1.950981, 1, 1, 1, 1, 1,
0.5134392, 1.189433, -0.05244144, 1, 1, 1, 1, 1,
0.5164512, -2.36045, 3.487592, 1, 1, 1, 1, 1,
0.5194032, -0.56641, 4.128838, 1, 1, 1, 1, 1,
0.5230439, 1.443307, 0.2162322, 1, 1, 1, 1, 1,
0.5234131, 0.9189554, 1.729285, 1, 1, 1, 1, 1,
0.5239457, -0.115341, 2.025976, 1, 1, 1, 1, 1,
0.5254781, 0.801767, -1.149779, 1, 1, 1, 1, 1,
0.5255747, -0.6275615, 1.534019, 0, 0, 1, 1, 1,
0.5259027, -0.5886921, 2.601497, 1, 0, 0, 1, 1,
0.5283917, 1.432532, 0.1355595, 1, 0, 0, 1, 1,
0.5346963, 0.2700198, 0.5502918, 1, 0, 0, 1, 1,
0.535018, 0.6831818, 1.021883, 1, 0, 0, 1, 1,
0.5369442, -0.784094, 1.324262, 1, 0, 0, 1, 1,
0.5425041, -0.8808789, 2.569733, 0, 0, 0, 1, 1,
0.5432618, -0.299203, 0.3809212, 0, 0, 0, 1, 1,
0.5514696, -1.31625, 3.883223, 0, 0, 0, 1, 1,
0.5560443, -1.32839, 1.690397, 0, 0, 0, 1, 1,
0.5583552, -0.6821066, 3.313759, 0, 0, 0, 1, 1,
0.559801, -1.064957, 4.02254, 0, 0, 0, 1, 1,
0.5672246, -0.7430215, 2.492208, 0, 0, 0, 1, 1,
0.5685186, -0.845719, 1.339675, 1, 1, 1, 1, 1,
0.5687431, -0.05111999, 1.765377, 1, 1, 1, 1, 1,
0.5699024, -0.2783647, 1.348914, 1, 1, 1, 1, 1,
0.576184, -0.2589808, 0.04169419, 1, 1, 1, 1, 1,
0.5763627, 0.4726195, 0.3862978, 1, 1, 1, 1, 1,
0.5770949, -2.996614, 3.872092, 1, 1, 1, 1, 1,
0.5866406, -1.026377, 2.527052, 1, 1, 1, 1, 1,
0.5880803, 0.9130259, 1.456204, 1, 1, 1, 1, 1,
0.5901923, 0.8358485, 0.4174967, 1, 1, 1, 1, 1,
0.5912979, 0.8802794, 2.33044, 1, 1, 1, 1, 1,
0.5914058, 0.03084954, -0.02908234, 1, 1, 1, 1, 1,
0.5962935, 0.7100546, 0.4409446, 1, 1, 1, 1, 1,
0.5989971, 0.4864164, 1.111367, 1, 1, 1, 1, 1,
0.59949, 0.943137, 1.402936, 1, 1, 1, 1, 1,
0.6004512, 0.3196026, 0.1773567, 1, 1, 1, 1, 1,
0.608324, -0.04702254, 2.367687, 0, 0, 1, 1, 1,
0.6085611, 0.2617311, 1.135288, 1, 0, 0, 1, 1,
0.6093028, 1.32889, 0.283909, 1, 0, 0, 1, 1,
0.60933, 1.898051, -0.6936263, 1, 0, 0, 1, 1,
0.6094093, -0.5195395, -0.3466885, 1, 0, 0, 1, 1,
0.619662, -0.2069039, 0.07076837, 1, 0, 0, 1, 1,
0.6197064, 0.2295277, 1.916248, 0, 0, 0, 1, 1,
0.6253651, 0.4764672, -0.08295634, 0, 0, 0, 1, 1,
0.6276528, -0.1364138, 0.6219372, 0, 0, 0, 1, 1,
0.628782, -0.01936632, 1.949607, 0, 0, 0, 1, 1,
0.639942, 0.8192772, 0.8871326, 0, 0, 0, 1, 1,
0.6416931, 0.3125322, 2.909464, 0, 0, 0, 1, 1,
0.6440004, -1.730036, 2.319521, 0, 0, 0, 1, 1,
0.6461717, 1.203299, -0.2767451, 1, 1, 1, 1, 1,
0.6462643, -0.3031577, 3.614909, 1, 1, 1, 1, 1,
0.6468521, -0.5331254, 1.374496, 1, 1, 1, 1, 1,
0.6477408, -1.315452, 3.80108, 1, 1, 1, 1, 1,
0.647943, -0.7247241, 3.026994, 1, 1, 1, 1, 1,
0.6501167, 1.633895, -0.6980079, 1, 1, 1, 1, 1,
0.6508273, -0.4260718, 0.7787858, 1, 1, 1, 1, 1,
0.6549203, -0.3090788, 2.266361, 1, 1, 1, 1, 1,
0.6549654, -0.6125631, 2.91327, 1, 1, 1, 1, 1,
0.6743988, -2.601307, 1.132847, 1, 1, 1, 1, 1,
0.6744295, -0.0193606, 1.419871, 1, 1, 1, 1, 1,
0.6855693, -0.9177262, 2.633193, 1, 1, 1, 1, 1,
0.6883738, -0.4589376, 3.634352, 1, 1, 1, 1, 1,
0.6885144, -0.4022989, 1.562816, 1, 1, 1, 1, 1,
0.6917681, 0.507615, 1.014304, 1, 1, 1, 1, 1,
0.7012411, -0.3409308, 1.184072, 0, 0, 1, 1, 1,
0.7023488, 0.6186244, 1.514937, 1, 0, 0, 1, 1,
0.7030938, -0.5355812, 2.892746, 1, 0, 0, 1, 1,
0.7032821, -0.7639366, 1.944438, 1, 0, 0, 1, 1,
0.7035106, -0.08081106, 1.640044, 1, 0, 0, 1, 1,
0.7062934, -1.486163, 2.600196, 1, 0, 0, 1, 1,
0.7069084, -1.751543, 3.39405, 0, 0, 0, 1, 1,
0.7074277, 0.4100652, 1.449362, 0, 0, 0, 1, 1,
0.7085667, -1.633426, 3.243728, 0, 0, 0, 1, 1,
0.7107999, -0.1355231, 1.634397, 0, 0, 0, 1, 1,
0.7132329, 0.3593764, 1.369653, 0, 0, 0, 1, 1,
0.7161682, -0.02068971, 3.097582, 0, 0, 0, 1, 1,
0.7175323, 1.59988, 0.02136545, 0, 0, 0, 1, 1,
0.7284479, -0.8633574, 2.717742, 1, 1, 1, 1, 1,
0.7369294, -0.2293475, 0.8482347, 1, 1, 1, 1, 1,
0.7374195, 0.7990255, 0.05756512, 1, 1, 1, 1, 1,
0.7396439, -0.2021358, 0.854542, 1, 1, 1, 1, 1,
0.7416093, -2.306583, 2.083339, 1, 1, 1, 1, 1,
0.7490583, 0.01347637, 3.258282, 1, 1, 1, 1, 1,
0.7497281, -1.639626, 4.133036, 1, 1, 1, 1, 1,
0.7512386, -0.4405547, 1.955513, 1, 1, 1, 1, 1,
0.7512971, -0.4648326, 3.243766, 1, 1, 1, 1, 1,
0.7518789, -0.1676911, 1.621012, 1, 1, 1, 1, 1,
0.757125, -0.7494693, 1.131561, 1, 1, 1, 1, 1,
0.7578918, 0.5182727, 1.736265, 1, 1, 1, 1, 1,
0.7611915, -1.201781, 1.428346, 1, 1, 1, 1, 1,
0.7639427, 0.2081435, 1.111638, 1, 1, 1, 1, 1,
0.7665304, -0.4344485, 0.4909208, 1, 1, 1, 1, 1,
0.7696602, 0.2994084, 2.57434, 0, 0, 1, 1, 1,
0.7746747, -0.1306205, 0.3939619, 1, 0, 0, 1, 1,
0.7808481, -0.5509741, 3.278996, 1, 0, 0, 1, 1,
0.7893565, -0.04876276, 3.109847, 1, 0, 0, 1, 1,
0.7966728, -0.3843352, 2.042935, 1, 0, 0, 1, 1,
0.79859, -0.7423886, 3.020502, 1, 0, 0, 1, 1,
0.8000522, 1.323318, 0.8501475, 0, 0, 0, 1, 1,
0.8028668, -2.361951, 1.786595, 0, 0, 0, 1, 1,
0.8058071, -0.3735005, 0.9742925, 0, 0, 0, 1, 1,
0.806876, -0.595903, 2.20462, 0, 0, 0, 1, 1,
0.810219, 0.07991595, 1.628628, 0, 0, 0, 1, 1,
0.8201342, 0.9173487, 1.121956, 0, 0, 0, 1, 1,
0.8249267, -0.4528476, 1.169261, 0, 0, 0, 1, 1,
0.8263986, 0.5692739, 1.216951, 1, 1, 1, 1, 1,
0.8277299, -0.06133992, -0.834078, 1, 1, 1, 1, 1,
0.8342581, -0.5075693, 3.33759, 1, 1, 1, 1, 1,
0.8526014, 0.2142168, 0.6165689, 1, 1, 1, 1, 1,
0.8526567, 0.8136005, 0.3278934, 1, 1, 1, 1, 1,
0.8575214, 0.7605577, 1.608746, 1, 1, 1, 1, 1,
0.8586059, 1.007223, 1.400131, 1, 1, 1, 1, 1,
0.8618129, 0.0558896, 2.8052, 1, 1, 1, 1, 1,
0.8626887, 0.8559114, -0.07172527, 1, 1, 1, 1, 1,
0.8693864, -0.3298078, 1.643022, 1, 1, 1, 1, 1,
0.8706725, 1.481472, 0.1695882, 1, 1, 1, 1, 1,
0.8822775, -0.3495639, 1.193522, 1, 1, 1, 1, 1,
0.8890724, 1.157544, 3.292101, 1, 1, 1, 1, 1,
0.9116458, -0.08606283, 2.796904, 1, 1, 1, 1, 1,
0.9117218, 1.295704, 0.7216656, 1, 1, 1, 1, 1,
0.9125397, 0.6229784, 1.827476, 0, 0, 1, 1, 1,
0.9156452, 0.7374641, 1.783376, 1, 0, 0, 1, 1,
0.9217426, 0.3765543, -0.2785929, 1, 0, 0, 1, 1,
0.9288161, 0.1507761, 2.813473, 1, 0, 0, 1, 1,
0.9419321, -0.6779626, 0.4716191, 1, 0, 0, 1, 1,
0.942799, 1.199446, 0.493026, 1, 0, 0, 1, 1,
0.9494725, 0.2913234, 0.5373939, 0, 0, 0, 1, 1,
0.9501305, -0.2327967, 2.857153, 0, 0, 0, 1, 1,
0.9591908, -1.933472, 2.441564, 0, 0, 0, 1, 1,
0.9607236, 0.719192, 2.139403, 0, 0, 0, 1, 1,
0.9684594, -0.2224105, 1.557669, 0, 0, 0, 1, 1,
0.9687529, -0.1609664, 2.149825, 0, 0, 0, 1, 1,
0.970423, 0.5271792, 1.16339, 0, 0, 0, 1, 1,
0.9751262, 0.2643971, 1.691938, 1, 1, 1, 1, 1,
0.9781072, -0.4473286, 2.656131, 1, 1, 1, 1, 1,
0.9813759, -0.71203, 1.806475, 1, 1, 1, 1, 1,
0.9844254, -1.125329, 3.199332, 1, 1, 1, 1, 1,
0.9848988, -1.500903, 3.384382, 1, 1, 1, 1, 1,
0.9862927, 0.7612584, 2.120004, 1, 1, 1, 1, 1,
0.9880791, 0.3477013, -0.547384, 1, 1, 1, 1, 1,
0.9898119, 0.02510699, 1.390983, 1, 1, 1, 1, 1,
0.9916412, 1.008802, 0.1520326, 1, 1, 1, 1, 1,
0.994145, 0.4600427, -0.08098667, 1, 1, 1, 1, 1,
1.00271, -0.4564347, 1.841159, 1, 1, 1, 1, 1,
1.006774, -0.5523629, 3.007731, 1, 1, 1, 1, 1,
1.006848, 0.6183881, -0.2864919, 1, 1, 1, 1, 1,
1.009503, -0.1139398, 1.959225, 1, 1, 1, 1, 1,
1.010918, 0.1143162, 2.328906, 1, 1, 1, 1, 1,
1.011154, -0.2545163, 1.978617, 0, 0, 1, 1, 1,
1.014946, 1.165768, 0.8874775, 1, 0, 0, 1, 1,
1.026085, 0.7185577, 2.159998, 1, 0, 0, 1, 1,
1.029491, -0.7178784, 2.070905, 1, 0, 0, 1, 1,
1.040599, 2.304676, 1.076113, 1, 0, 0, 1, 1,
1.040787, 0.5981084, 0.8431565, 1, 0, 0, 1, 1,
1.048913, -0.1362831, 1.64533, 0, 0, 0, 1, 1,
1.069524, -1.627532, 2.796224, 0, 0, 0, 1, 1,
1.073008, -0.2678254, 2.531894, 0, 0, 0, 1, 1,
1.074247, 0.1579555, 1.434158, 0, 0, 0, 1, 1,
1.075817, -0.788816, -0.2169306, 0, 0, 0, 1, 1,
1.079479, 0.5868871, -0.8567206, 0, 0, 0, 1, 1,
1.083453, 1.080241, 0.5478443, 0, 0, 0, 1, 1,
1.086599, 0.8742108, -0.5125576, 1, 1, 1, 1, 1,
1.099663, -0.7692019, 1.854905, 1, 1, 1, 1, 1,
1.099693, -0.4824164, 1.666236, 1, 1, 1, 1, 1,
1.100923, 1.25176, -0.5354924, 1, 1, 1, 1, 1,
1.102915, 0.5915331, 1.800885, 1, 1, 1, 1, 1,
1.109443, -0.5417878, 1.543987, 1, 1, 1, 1, 1,
1.11253, -0.1727154, -0.7399992, 1, 1, 1, 1, 1,
1.114514, -1.158657, 3.109159, 1, 1, 1, 1, 1,
1.126039, 0.9760472, 0.01818549, 1, 1, 1, 1, 1,
1.126056, -0.2596965, 0.8321647, 1, 1, 1, 1, 1,
1.133363, 0.1024635, 0.5319951, 1, 1, 1, 1, 1,
1.135181, -1.228104, 3.401561, 1, 1, 1, 1, 1,
1.144212, -0.4453512, 1.314435, 1, 1, 1, 1, 1,
1.152627, 0.4128425, 0.8539247, 1, 1, 1, 1, 1,
1.155181, 0.8657678, -0.1034461, 1, 1, 1, 1, 1,
1.156366, 2.331916, 0.4818075, 0, 0, 1, 1, 1,
1.16155, 1.048171, 0.7946057, 1, 0, 0, 1, 1,
1.167161, -0.06121034, 3.567044, 1, 0, 0, 1, 1,
1.169807, -0.1393196, 3.769645, 1, 0, 0, 1, 1,
1.182612, -1.175822, 3.740221, 1, 0, 0, 1, 1,
1.183286, -1.445388, 3.448089, 1, 0, 0, 1, 1,
1.183603, 0.8544387, 1.449291, 0, 0, 0, 1, 1,
1.1874, 0.1040628, 1.490318, 0, 0, 0, 1, 1,
1.189166, 0.6151162, 1.688605, 0, 0, 0, 1, 1,
1.190361, 0.5893847, 2.338614, 0, 0, 0, 1, 1,
1.193218, 0.2548027, 1.09685, 0, 0, 0, 1, 1,
1.193447, 2.647601, 0.1254023, 0, 0, 0, 1, 1,
1.196842, 0.2788124, 2.208464, 0, 0, 0, 1, 1,
1.212875, -0.5165491, 2.595368, 1, 1, 1, 1, 1,
1.217458, 1.874724, 1.48811, 1, 1, 1, 1, 1,
1.220507, -0.5383438, 2.037901, 1, 1, 1, 1, 1,
1.229061, -1.623039, 2.064579, 1, 1, 1, 1, 1,
1.232779, -0.7017308, 2.829541, 1, 1, 1, 1, 1,
1.232789, -1.210485, 3.840045, 1, 1, 1, 1, 1,
1.233969, -0.7436839, 2.850245, 1, 1, 1, 1, 1,
1.241979, 0.1692398, 1.110368, 1, 1, 1, 1, 1,
1.253257, 0.5091676, 2.793226, 1, 1, 1, 1, 1,
1.255945, 2.484174, -1.182952, 1, 1, 1, 1, 1,
1.270947, 0.01580459, 1.615888, 1, 1, 1, 1, 1,
1.271645, 0.211576, 1.929719, 1, 1, 1, 1, 1,
1.27287, -0.4347857, 2.136888, 1, 1, 1, 1, 1,
1.289335, 0.5245537, 1.371345, 1, 1, 1, 1, 1,
1.291502, 1.335848, -0.1282127, 1, 1, 1, 1, 1,
1.299905, 0.2389039, 0.7016882, 0, 0, 1, 1, 1,
1.300962, -0.3742217, 2.080609, 1, 0, 0, 1, 1,
1.302351, 0.3969442, -0.1017338, 1, 0, 0, 1, 1,
1.304669, -0.4839183, 3.611432, 1, 0, 0, 1, 1,
1.306835, -0.3619769, 1.160084, 1, 0, 0, 1, 1,
1.30916, -0.08351285, 1.369028, 1, 0, 0, 1, 1,
1.310688, 0.1582562, 1.735194, 0, 0, 0, 1, 1,
1.321895, -2.147831, 3.529073, 0, 0, 0, 1, 1,
1.322353, -0.2322265, 2.38253, 0, 0, 0, 1, 1,
1.323212, 1.594277, 0.8306365, 0, 0, 0, 1, 1,
1.325153, 1.403057, 2.68802, 0, 0, 0, 1, 1,
1.33507, 1.036536, 0.2567549, 0, 0, 0, 1, 1,
1.345517, -0.7832811, 1.611466, 0, 0, 0, 1, 1,
1.367532, -0.8664082, 3.002564, 1, 1, 1, 1, 1,
1.370647, -1.611844, 5.238409, 1, 1, 1, 1, 1,
1.374554, -0.6695653, 2.655731, 1, 1, 1, 1, 1,
1.374948, -3.544101, 2.319211, 1, 1, 1, 1, 1,
1.379597, -0.5080183, 0.8702, 1, 1, 1, 1, 1,
1.385468, 0.232907, -0.5363805, 1, 1, 1, 1, 1,
1.386336, -1.011998, 1.479741, 1, 1, 1, 1, 1,
1.388026, -0.8075308, 2.943124, 1, 1, 1, 1, 1,
1.39503, -0.7610654, 2.918843, 1, 1, 1, 1, 1,
1.39923, 0.03986884, -0.4491273, 1, 1, 1, 1, 1,
1.419641, 1.031089, 0.08109904, 1, 1, 1, 1, 1,
1.42425, 1.720023, 2.121733, 1, 1, 1, 1, 1,
1.42451, 1.716782, 0.225394, 1, 1, 1, 1, 1,
1.426771, -0.6692055, -0.3952453, 1, 1, 1, 1, 1,
1.434251, 1.078132, 0.7042969, 1, 1, 1, 1, 1,
1.438445, 0.9929887, 2.68037, 0, 0, 1, 1, 1,
1.438591, -0.5035924, 1.753946, 1, 0, 0, 1, 1,
1.461704, 0.07963059, 0.2692409, 1, 0, 0, 1, 1,
1.461913, 0.08360315, 1.906816, 1, 0, 0, 1, 1,
1.463464, -0.4961255, 2.409426, 1, 0, 0, 1, 1,
1.472637, 0.7575957, 1.874229, 1, 0, 0, 1, 1,
1.474561, -0.09166221, 1.528284, 0, 0, 0, 1, 1,
1.480179, -0.4644044, 1.922091, 0, 0, 0, 1, 1,
1.487824, -1.602253, 3.541078, 0, 0, 0, 1, 1,
1.493421, 1.698162, -0.9951144, 0, 0, 0, 1, 1,
1.500788, 1.067293, 0.8130403, 0, 0, 0, 1, 1,
1.501912, 0.2499388, 2.044945, 0, 0, 0, 1, 1,
1.505131, -1.925011, 3.055958, 0, 0, 0, 1, 1,
1.514922, -0.9127218, 3.672896, 1, 1, 1, 1, 1,
1.516445, 1.283844, 1.366117, 1, 1, 1, 1, 1,
1.533076, 1.462321, 0.02031763, 1, 1, 1, 1, 1,
1.561313, -0.4436866, 3.118492, 1, 1, 1, 1, 1,
1.56626, 0.8310943, 3.242644, 1, 1, 1, 1, 1,
1.576968, 2.389315, 0.6264685, 1, 1, 1, 1, 1,
1.585453, -0.1198758, 1.152273, 1, 1, 1, 1, 1,
1.591754, -1.540504, 2.951127, 1, 1, 1, 1, 1,
1.596584, 1.346108, 1.476215, 1, 1, 1, 1, 1,
1.613338, -1.153822, 2.244831, 1, 1, 1, 1, 1,
1.615821, 0.4827875, 0.5477078, 1, 1, 1, 1, 1,
1.623371, 0.9551344, 0.2768691, 1, 1, 1, 1, 1,
1.647783, -0.09951814, 1.790878, 1, 1, 1, 1, 1,
1.659979, -0.3993745, 3.51488, 1, 1, 1, 1, 1,
1.688936, -0.003446076, -0.05576381, 1, 1, 1, 1, 1,
1.700869, -0.4289658, 1.499444, 0, 0, 1, 1, 1,
1.705478, 0.9850653, -0.02307821, 1, 0, 0, 1, 1,
1.718159, 0.8570581, 1.645368, 1, 0, 0, 1, 1,
1.720608, 0.1431319, 2.670672, 1, 0, 0, 1, 1,
1.721369, -0.7164263, 2.98481, 1, 0, 0, 1, 1,
1.723609, -1.362978, 1.962826, 1, 0, 0, 1, 1,
1.743496, 0.7782568, -0.9175932, 0, 0, 0, 1, 1,
1.746921, -0.765838, 2.954198, 0, 0, 0, 1, 1,
1.747722, 0.8924748, 1.386861, 0, 0, 0, 1, 1,
1.793483, -0.3053379, 0.9850789, 0, 0, 0, 1, 1,
1.79582, 0.7771719, 0.9847132, 0, 0, 0, 1, 1,
1.799203, 0.9470902, 0.372914, 0, 0, 0, 1, 1,
1.816451, 2.136144, 2.473049, 0, 0, 0, 1, 1,
1.819011, -0.3747377, 1.535824, 1, 1, 1, 1, 1,
1.843163, -1.448997, 2.183972, 1, 1, 1, 1, 1,
1.844902, -0.08004676, 0.3402213, 1, 1, 1, 1, 1,
1.873688, -0.03813536, 1.638157, 1, 1, 1, 1, 1,
1.890132, -1.949435, 2.848536, 1, 1, 1, 1, 1,
1.893839, -1.001627, 1.060038, 1, 1, 1, 1, 1,
1.895076, 1.695705, 0.2513262, 1, 1, 1, 1, 1,
1.907477, -0.8172724, 1.590239, 1, 1, 1, 1, 1,
1.911914, -1.540123, 2.662514, 1, 1, 1, 1, 1,
1.954758, 0.440244, 1.82181, 1, 1, 1, 1, 1,
1.965432, 1.096635, 0.4119861, 1, 1, 1, 1, 1,
1.96779, 1.263822, -0.4948297, 1, 1, 1, 1, 1,
1.969716, -0.8493855, 1.962868, 1, 1, 1, 1, 1,
2.004461, -1.869767, 1.99606, 1, 1, 1, 1, 1,
2.019193, -0.7158958, 1.422055, 1, 1, 1, 1, 1,
2.020386, 0.3895515, 1.564745, 0, 0, 1, 1, 1,
2.075208, -0.02748388, 0.324806, 1, 0, 0, 1, 1,
2.12836, 0.1235742, 1.547134, 1, 0, 0, 1, 1,
2.134712, -0.4546717, 5.078733, 1, 0, 0, 1, 1,
2.150579, 1.426088, 1.561028, 1, 0, 0, 1, 1,
2.1576, -1.365877, 0.9256017, 1, 0, 0, 1, 1,
2.162154, -0.1597991, 1.522914, 0, 0, 0, 1, 1,
2.220671, -0.418736, 3.151291, 0, 0, 0, 1, 1,
2.271538, -0.9367588, 2.217041, 0, 0, 0, 1, 1,
2.279781, 0.4437061, 0.2451972, 0, 0, 0, 1, 1,
2.329946, -0.5569888, 2.895145, 0, 0, 0, 1, 1,
2.391135, -0.8545958, 2.23621, 0, 0, 0, 1, 1,
2.450294, 1.431394, 3.247781, 0, 0, 0, 1, 1,
2.549525, -0.1601327, 1.547034, 1, 1, 1, 1, 1,
2.5923, 2.108019, 1.390743, 1, 1, 1, 1, 1,
2.592673, -0.2068388, 1.420773, 1, 1, 1, 1, 1,
2.710517, 0.04382709, 1.328357, 1, 1, 1, 1, 1,
2.857937, 0.1104331, 2.232425, 1, 1, 1, 1, 1,
2.871124, -0.1670506, 2.142554, 1, 1, 1, 1, 1,
3.097305, 0.5388899, -0.4244967, 1, 1, 1, 1, 1
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
var radius = 9.918102;
var distance = 34.83691;
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
mvMatrix.translate( 0.08700633, -0.02316761, 0.3135443 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.83691);
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
