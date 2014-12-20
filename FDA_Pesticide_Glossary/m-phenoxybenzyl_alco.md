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
-2.516486, 0.07407647, 0.04412607, 1, 0, 0, 1,
-2.431914, 0.7647903, -1.882408, 1, 0.007843138, 0, 1,
-2.365287, -0.9306483, -3.311914, 1, 0.01176471, 0, 1,
-2.349315, 0.9626417, -3.763889, 1, 0.01960784, 0, 1,
-2.328149, -0.04702985, -1.597643, 1, 0.02352941, 0, 1,
-2.206432, -0.1353085, -2.855573, 1, 0.03137255, 0, 1,
-2.179169, -0.2296994, -2.66202, 1, 0.03529412, 0, 1,
-2.153488, -1.676523, -2.555013, 1, 0.04313726, 0, 1,
-2.140629, 0.345484, -1.858305, 1, 0.04705882, 0, 1,
-2.11177, 0.4017244, -1.159387, 1, 0.05490196, 0, 1,
-2.096699, -0.06191709, -3.456169, 1, 0.05882353, 0, 1,
-2.027669, -1.493829, -1.153914, 1, 0.06666667, 0, 1,
-2.015452, 0.9026914, 0.7115831, 1, 0.07058824, 0, 1,
-2.015296, -0.5904147, -1.454303, 1, 0.07843138, 0, 1,
-2.010055, 0.07618356, -1.427694, 1, 0.08235294, 0, 1,
-1.989211, 0.9942208, -1.688324, 1, 0.09019608, 0, 1,
-1.96832, 0.5953111, -1.952933, 1, 0.09411765, 0, 1,
-1.960978, -0.479567, -1.375291, 1, 0.1019608, 0, 1,
-1.946143, 0.009997197, -1.280304, 1, 0.1098039, 0, 1,
-1.934357, 0.7840878, -0.5832484, 1, 0.1137255, 0, 1,
-1.931171, 0.4214039, -2.139246, 1, 0.1215686, 0, 1,
-1.928849, 0.8886882, -1.176673, 1, 0.1254902, 0, 1,
-1.925743, 0.7055939, -0.9595686, 1, 0.1333333, 0, 1,
-1.918048, -1.684523, -2.146167, 1, 0.1372549, 0, 1,
-1.915637, -1.14944, -1.546983, 1, 0.145098, 0, 1,
-1.89354, 1.460142, -2.138397, 1, 0.1490196, 0, 1,
-1.882285, -0.9124001, -2.245116, 1, 0.1568628, 0, 1,
-1.878347, 0.8303441, -0.3225064, 1, 0.1607843, 0, 1,
-1.860447, -0.6334751, -0.1688182, 1, 0.1686275, 0, 1,
-1.836816, 3.270947, -0.1918078, 1, 0.172549, 0, 1,
-1.827658, -0.9680652, -1.237242, 1, 0.1803922, 0, 1,
-1.774651, 0.9781371, -0.7838235, 1, 0.1843137, 0, 1,
-1.765867, -0.2817971, -0.06032246, 1, 0.1921569, 0, 1,
-1.743517, -0.9364747, -2.27035, 1, 0.1960784, 0, 1,
-1.741102, -0.4738238, -2.882186, 1, 0.2039216, 0, 1,
-1.734932, 0.7950887, 0.1941838, 1, 0.2117647, 0, 1,
-1.720951, -0.4224787, -1.857147, 1, 0.2156863, 0, 1,
-1.716005, 1.766413, -0.2478625, 1, 0.2235294, 0, 1,
-1.710932, 1.046977, -2.159345, 1, 0.227451, 0, 1,
-1.694138, 1.302898, 0.6356345, 1, 0.2352941, 0, 1,
-1.68411, -1.246379, -3.192656, 1, 0.2392157, 0, 1,
-1.675857, -1.377667, -2.244445, 1, 0.2470588, 0, 1,
-1.661837, 0.8649553, -0.9643556, 1, 0.2509804, 0, 1,
-1.653401, -0.1694128, -1.058816, 1, 0.2588235, 0, 1,
-1.64529, -1.551651, -0.02838699, 1, 0.2627451, 0, 1,
-1.636534, 0.7243928, -3.512023, 1, 0.2705882, 0, 1,
-1.614744, 2.134612, -0.01621901, 1, 0.2745098, 0, 1,
-1.610821, -1.045421, -3.861757, 1, 0.282353, 0, 1,
-1.596587, -0.1915225, -0.4509362, 1, 0.2862745, 0, 1,
-1.586597, -0.6592988, -4.961596, 1, 0.2941177, 0, 1,
-1.582278, 1.150755, -2.544666, 1, 0.3019608, 0, 1,
-1.563926, -1.505585, -2.179625, 1, 0.3058824, 0, 1,
-1.55324, 0.2111445, -1.984717, 1, 0.3137255, 0, 1,
-1.535757, -0.02800865, -1.594361, 1, 0.3176471, 0, 1,
-1.535324, 0.3934587, -1.813759, 1, 0.3254902, 0, 1,
-1.513063, 0.2109401, 0.7574708, 1, 0.3294118, 0, 1,
-1.51088, 0.6925133, 0.3204761, 1, 0.3372549, 0, 1,
-1.508424, -0.6163324, -2.007456, 1, 0.3411765, 0, 1,
-1.502412, -0.779576, -1.742929, 1, 0.3490196, 0, 1,
-1.489583, -0.2958586, -2.368565, 1, 0.3529412, 0, 1,
-1.480621, 0.01004104, -0.3681598, 1, 0.3607843, 0, 1,
-1.473025, -1.102382, -4.77073, 1, 0.3647059, 0, 1,
-1.452145, 0.2421323, -1.621546, 1, 0.372549, 0, 1,
-1.44268, 0.3124572, -1.678387, 1, 0.3764706, 0, 1,
-1.442169, -0.1852474, -2.606662, 1, 0.3843137, 0, 1,
-1.441369, -0.6889791, -2.921097, 1, 0.3882353, 0, 1,
-1.43579, 0.02749408, -2.438338, 1, 0.3960784, 0, 1,
-1.435618, -0.2812833, -0.8975625, 1, 0.4039216, 0, 1,
-1.433603, 0.4540663, -0.5031531, 1, 0.4078431, 0, 1,
-1.429226, 1.406, -0.2033408, 1, 0.4156863, 0, 1,
-1.424141, -0.4250316, -0.3372874, 1, 0.4196078, 0, 1,
-1.422056, -0.6694666, -2.931289, 1, 0.427451, 0, 1,
-1.417823, -0.04520699, -2.449177, 1, 0.4313726, 0, 1,
-1.396827, -2.341119, -1.409809, 1, 0.4392157, 0, 1,
-1.394263, -1.440518, -3.741035, 1, 0.4431373, 0, 1,
-1.364011, 1.596751, -0.4779792, 1, 0.4509804, 0, 1,
-1.345293, -1.68823, -1.50002, 1, 0.454902, 0, 1,
-1.341649, 0.6112441, -1.733499, 1, 0.4627451, 0, 1,
-1.313696, -1.256286, -2.53696, 1, 0.4666667, 0, 1,
-1.311602, 1.420878, -1.701551, 1, 0.4745098, 0, 1,
-1.299325, -0.6485855, -1.322654, 1, 0.4784314, 0, 1,
-1.290287, 0.7941131, -1.310804, 1, 0.4862745, 0, 1,
-1.283577, 0.1366682, -2.358342, 1, 0.4901961, 0, 1,
-1.275231, -0.4849216, -2.275721, 1, 0.4980392, 0, 1,
-1.269449, 1.27239, -2.022476, 1, 0.5058824, 0, 1,
-1.258617, 0.7269066, -0.3198922, 1, 0.509804, 0, 1,
-1.251911, 0.1061184, 0.9664677, 1, 0.5176471, 0, 1,
-1.226474, 1.28038, -0.9583771, 1, 0.5215687, 0, 1,
-1.224792, -0.03848117, -2.588212, 1, 0.5294118, 0, 1,
-1.222973, -0.02434104, -0.8099121, 1, 0.5333334, 0, 1,
-1.218142, 0.0006866773, -1.261491, 1, 0.5411765, 0, 1,
-1.212579, 1.011679, 0.5231184, 1, 0.5450981, 0, 1,
-1.211927, 0.20284, -2.148434, 1, 0.5529412, 0, 1,
-1.208796, 0.674145, 0.1442734, 1, 0.5568628, 0, 1,
-1.203538, -0.2359765, -2.289962, 1, 0.5647059, 0, 1,
-1.197774, -0.4946286, -2.712583, 1, 0.5686275, 0, 1,
-1.194721, -0.1896119, -1.925385, 1, 0.5764706, 0, 1,
-1.190768, -0.8860984, -2.737639, 1, 0.5803922, 0, 1,
-1.188336, 0.800606, -2.518656, 1, 0.5882353, 0, 1,
-1.171391, 0.04818029, -0.570111, 1, 0.5921569, 0, 1,
-1.169673, 0.3262529, -0.6610957, 1, 0.6, 0, 1,
-1.167054, -0.8113069, -2.404541, 1, 0.6078432, 0, 1,
-1.164229, -2.468364, -1.710601, 1, 0.6117647, 0, 1,
-1.162801, 0.3938755, -1.291916, 1, 0.6196079, 0, 1,
-1.16192, -0.9753091, -0.08326782, 1, 0.6235294, 0, 1,
-1.15553, -1.172864, -4.473916, 1, 0.6313726, 0, 1,
-1.154858, 0.8266345, -0.6286471, 1, 0.6352941, 0, 1,
-1.152793, 0.2096218, -3.019879, 1, 0.6431373, 0, 1,
-1.148451, 0.1999775, -1.949002, 1, 0.6470588, 0, 1,
-1.136274, -2.676487, -1.849491, 1, 0.654902, 0, 1,
-1.133528, -0.04995098, -1.992653, 1, 0.6588235, 0, 1,
-1.127294, -0.223722, -2.458349, 1, 0.6666667, 0, 1,
-1.124944, 0.1100556, -0.4467323, 1, 0.6705883, 0, 1,
-1.117014, -1.364716, -3.573897, 1, 0.6784314, 0, 1,
-1.112947, 0.036918, -1.445584, 1, 0.682353, 0, 1,
-1.112915, 1.08602, -1.070068, 1, 0.6901961, 0, 1,
-1.102684, -1.057408, -2.007167, 1, 0.6941177, 0, 1,
-1.095676, 1.049475, -0.1158703, 1, 0.7019608, 0, 1,
-1.091798, -0.3117979, -2.683676, 1, 0.7098039, 0, 1,
-1.084829, -1.303369, -2.786989, 1, 0.7137255, 0, 1,
-1.083314, -0.1025378, -1.513957, 1, 0.7215686, 0, 1,
-1.082633, 1.405214, -1.532078, 1, 0.7254902, 0, 1,
-1.073437, -0.9730904, -3.262033, 1, 0.7333333, 0, 1,
-1.07205, 0.5220293, -1.383629, 1, 0.7372549, 0, 1,
-1.071794, -0.7361008, -0.1622646, 1, 0.7450981, 0, 1,
-1.064609, 2.212102, -0.5689091, 1, 0.7490196, 0, 1,
-1.06363, -0.7432746, -0.753963, 1, 0.7568628, 0, 1,
-1.061405, 0.9298373, -0.9208158, 1, 0.7607843, 0, 1,
-1.058419, 0.5881112, -0.3889614, 1, 0.7686275, 0, 1,
-1.055018, -1.826505, -2.843338, 1, 0.772549, 0, 1,
-1.051223, 2.08661, 0.4615816, 1, 0.7803922, 0, 1,
-1.04734, -0.2136488, -4.151532, 1, 0.7843137, 0, 1,
-1.04449, -0.1555075, -1.149459, 1, 0.7921569, 0, 1,
-1.031732, -1.393857, -2.635425, 1, 0.7960784, 0, 1,
-1.028083, -0.543957, -3.523455, 1, 0.8039216, 0, 1,
-1.016174, -0.4177683, -1.526466, 1, 0.8117647, 0, 1,
-1.012962, 1.490054, 0.616528, 1, 0.8156863, 0, 1,
-1.001139, -0.6474773, -2.708912, 1, 0.8235294, 0, 1,
-1.00096, 0.4945976, -3.445682, 1, 0.827451, 0, 1,
-1.000161, 0.9498147, -0.5516282, 1, 0.8352941, 0, 1,
-0.9976165, -0.9262152, -3.91781, 1, 0.8392157, 0, 1,
-0.9962999, -1.842978, -2.866214, 1, 0.8470588, 0, 1,
-0.9895715, -0.3508206, -1.359329, 1, 0.8509804, 0, 1,
-0.9887038, 1.142166, -0.1372799, 1, 0.8588235, 0, 1,
-0.9827425, -1.2727, -2.361202, 1, 0.8627451, 0, 1,
-0.9808564, -1.513871, -4.248367, 1, 0.8705882, 0, 1,
-0.9806402, 0.7711914, -1.745802, 1, 0.8745098, 0, 1,
-0.9796002, -1.522074, -2.109245, 1, 0.8823529, 0, 1,
-0.9714014, -0.2053041, -2.082158, 1, 0.8862745, 0, 1,
-0.9702642, 0.4385662, -0.8738521, 1, 0.8941177, 0, 1,
-0.9574397, -1.809419, -4.618388, 1, 0.8980392, 0, 1,
-0.9572392, 0.5351876, -0.9001558, 1, 0.9058824, 0, 1,
-0.9535558, 0.240949, -0.2328903, 1, 0.9137255, 0, 1,
-0.9499824, 0.3018314, -1.076227, 1, 0.9176471, 0, 1,
-0.9459307, -1.605706, -2.958411, 1, 0.9254902, 0, 1,
-0.9455645, -0.3176025, -0.8606854, 1, 0.9294118, 0, 1,
-0.9406503, 3.133368, 1.682259, 1, 0.9372549, 0, 1,
-0.9394572, 1.364765, 0.5372827, 1, 0.9411765, 0, 1,
-0.938775, -1.278702, -1.727813, 1, 0.9490196, 0, 1,
-0.9385644, -0.7015464, -0.7487078, 1, 0.9529412, 0, 1,
-0.9296334, 0.1802657, -1.508791, 1, 0.9607843, 0, 1,
-0.9262217, -0.439792, -0.8502561, 1, 0.9647059, 0, 1,
-0.9169233, -0.6124139, -1.050186, 1, 0.972549, 0, 1,
-0.9153239, 0.1345815, -1.003259, 1, 0.9764706, 0, 1,
-0.9145216, -1.031839, -1.676972, 1, 0.9843137, 0, 1,
-0.9102907, -1.568849, -4.366733, 1, 0.9882353, 0, 1,
-0.9090614, 1.537093, 0.7659577, 1, 0.9960784, 0, 1,
-0.9026287, -0.1858579, -1.908078, 0.9960784, 1, 0, 1,
-0.901592, -0.4602488, -2.408647, 0.9921569, 1, 0, 1,
-0.899656, -1.011409, -2.0104, 0.9843137, 1, 0, 1,
-0.898365, 0.1188401, -0.8491407, 0.9803922, 1, 0, 1,
-0.8936163, 0.2364965, -0.2279658, 0.972549, 1, 0, 1,
-0.8910695, 1.385825, 0.8003805, 0.9686275, 1, 0, 1,
-0.8903375, 0.9716023, 0.6280856, 0.9607843, 1, 0, 1,
-0.8861901, -0.819422, -1.026452, 0.9568627, 1, 0, 1,
-0.879353, 0.364078, -1.799378, 0.9490196, 1, 0, 1,
-0.8775335, 0.2248954, -0.1545579, 0.945098, 1, 0, 1,
-0.8766724, 0.7381421, -1.21991, 0.9372549, 1, 0, 1,
-0.8756723, -0.3672452, -2.486328, 0.9333333, 1, 0, 1,
-0.875373, 1.165849, -1.62778, 0.9254902, 1, 0, 1,
-0.8752519, -1.010017, -1.949301, 0.9215686, 1, 0, 1,
-0.8683835, 0.4781882, -3.181548, 0.9137255, 1, 0, 1,
-0.8666044, -0.2797533, -0.843925, 0.9098039, 1, 0, 1,
-0.8610059, -0.303317, -1.361297, 0.9019608, 1, 0, 1,
-0.8609823, -0.671653, -2.644244, 0.8941177, 1, 0, 1,
-0.8554609, 0.3162742, -0.5492342, 0.8901961, 1, 0, 1,
-0.8521586, -0.8715659, -2.494175, 0.8823529, 1, 0, 1,
-0.8452728, -0.6034675, -3.006933, 0.8784314, 1, 0, 1,
-0.8387898, 0.1659816, -2.903023, 0.8705882, 1, 0, 1,
-0.8373863, 0.0981745, -2.184106, 0.8666667, 1, 0, 1,
-0.8321708, -1.252799, -4.505672, 0.8588235, 1, 0, 1,
-0.8218477, -1.972083, -4.836594, 0.854902, 1, 0, 1,
-0.821125, -0.8561687, -2.671045, 0.8470588, 1, 0, 1,
-0.8156409, -0.1926358, -3.066752, 0.8431373, 1, 0, 1,
-0.8150204, 0.2380489, -2.055529, 0.8352941, 1, 0, 1,
-0.8139502, -2.915976, -1.618475, 0.8313726, 1, 0, 1,
-0.8106871, -0.2675722, -2.372237, 0.8235294, 1, 0, 1,
-0.8038651, 0.8126581, -0.3962331, 0.8196079, 1, 0, 1,
-0.8031613, 0.4371172, -0.917248, 0.8117647, 1, 0, 1,
-0.8025906, 1.70779, 0.4915287, 0.8078431, 1, 0, 1,
-0.8010329, 0.3106968, 1.161161, 0.8, 1, 0, 1,
-0.8003368, 0.8824559, -0.2609634, 0.7921569, 1, 0, 1,
-0.7937167, 1.255611, -2.031564, 0.7882353, 1, 0, 1,
-0.7920938, 0.2610036, -2.475923, 0.7803922, 1, 0, 1,
-0.7872659, -0.4269462, -2.43973, 0.7764706, 1, 0, 1,
-0.783966, 0.3771027, -1.063462, 0.7686275, 1, 0, 1,
-0.7827362, 1.085036, -1.00979, 0.7647059, 1, 0, 1,
-0.7827033, -1.312907, -2.447159, 0.7568628, 1, 0, 1,
-0.7771377, -0.5417047, -2.280958, 0.7529412, 1, 0, 1,
-0.7738775, -1.179833, -1.161765, 0.7450981, 1, 0, 1,
-0.767508, -1.532019, -3.304297, 0.7411765, 1, 0, 1,
-0.7668911, -2.054899, -3.067904, 0.7333333, 1, 0, 1,
-0.7655831, -0.2475146, -2.715205, 0.7294118, 1, 0, 1,
-0.7638296, 2.573702, -1.174533, 0.7215686, 1, 0, 1,
-0.761771, -1.370183, -2.983212, 0.7176471, 1, 0, 1,
-0.7422161, -1.124677, -2.916555, 0.7098039, 1, 0, 1,
-0.740617, -1.640026, -3.085675, 0.7058824, 1, 0, 1,
-0.7369717, 0.3950728, -1.401488, 0.6980392, 1, 0, 1,
-0.7365648, 0.7160124, 1.31168, 0.6901961, 1, 0, 1,
-0.7356912, 1.196114, -0.5156049, 0.6862745, 1, 0, 1,
-0.7328017, 0.3836929, -2.994588, 0.6784314, 1, 0, 1,
-0.7314063, -0.2080741, -3.018623, 0.6745098, 1, 0, 1,
-0.7281135, -0.3062714, -2.834171, 0.6666667, 1, 0, 1,
-0.7218468, -0.1330695, -1.618776, 0.6627451, 1, 0, 1,
-0.7150725, -0.1973672, -1.380438, 0.654902, 1, 0, 1,
-0.7117932, -1.748364, -3.923429, 0.6509804, 1, 0, 1,
-0.7076324, -0.5947847, -2.407892, 0.6431373, 1, 0, 1,
-0.703502, -0.374497, -1.051259, 0.6392157, 1, 0, 1,
-0.6984479, -0.5880843, -2.819297, 0.6313726, 1, 0, 1,
-0.6973844, -0.7511231, -2.840785, 0.627451, 1, 0, 1,
-0.6964477, -1.14933, -0.9619049, 0.6196079, 1, 0, 1,
-0.6957413, -1.491785, -3.192018, 0.6156863, 1, 0, 1,
-0.6845779, -0.8519704, -1.349857, 0.6078432, 1, 0, 1,
-0.683771, -1.251038, -2.471859, 0.6039216, 1, 0, 1,
-0.6816841, -1.189226, -1.282754, 0.5960785, 1, 0, 1,
-0.6745372, 1.153528, 0.3808967, 0.5882353, 1, 0, 1,
-0.6643854, -0.7690151, -2.288233, 0.5843138, 1, 0, 1,
-0.6641759, 0.622044, -0.1006464, 0.5764706, 1, 0, 1,
-0.6632189, -1.251915, -4.502132, 0.572549, 1, 0, 1,
-0.6605846, 0.1053993, -2.941291, 0.5647059, 1, 0, 1,
-0.6581474, -0.2471447, -3.138232, 0.5607843, 1, 0, 1,
-0.6578764, -0.2071175, -1.004518, 0.5529412, 1, 0, 1,
-0.6578432, 1.632388, -1.329395, 0.5490196, 1, 0, 1,
-0.6538873, -0.03213073, -2.732933, 0.5411765, 1, 0, 1,
-0.6523539, 1.220339, -1.582819, 0.5372549, 1, 0, 1,
-0.6493918, 0.8315144, 0.4478216, 0.5294118, 1, 0, 1,
-0.6461089, 0.199279, -0.7057852, 0.5254902, 1, 0, 1,
-0.6417654, -1.494136, -2.526844, 0.5176471, 1, 0, 1,
-0.6396928, 0.2918627, -2.091416, 0.5137255, 1, 0, 1,
-0.6344298, 1.076055, -0.5302926, 0.5058824, 1, 0, 1,
-0.6335634, -0.1152052, -1.338059, 0.5019608, 1, 0, 1,
-0.6270047, -0.7702942, -0.8980475, 0.4941176, 1, 0, 1,
-0.625308, 0.712344, -3.517154, 0.4862745, 1, 0, 1,
-0.6244431, -0.2892484, -2.053636, 0.4823529, 1, 0, 1,
-0.6242849, 0.09190729, 0.6575945, 0.4745098, 1, 0, 1,
-0.6194898, 0.788085, 0.4520699, 0.4705882, 1, 0, 1,
-0.6109418, -1.763044, -3.511164, 0.4627451, 1, 0, 1,
-0.6090592, -1.445651, -2.885363, 0.4588235, 1, 0, 1,
-0.6078944, -0.6129795, -1.907323, 0.4509804, 1, 0, 1,
-0.6049495, -0.464575, -0.7408318, 0.4470588, 1, 0, 1,
-0.6011773, 0.4961918, -1.056247, 0.4392157, 1, 0, 1,
-0.6005722, 0.03165067, -2.229869, 0.4352941, 1, 0, 1,
-0.5890411, -0.05320603, -1.810305, 0.427451, 1, 0, 1,
-0.5761129, -0.7362545, -1.963624, 0.4235294, 1, 0, 1,
-0.572434, 0.02652152, -0.4343722, 0.4156863, 1, 0, 1,
-0.5682885, 0.08349131, -2.005653, 0.4117647, 1, 0, 1,
-0.5682247, 1.643423, 0.197854, 0.4039216, 1, 0, 1,
-0.5663757, 1.509977, -1.370267, 0.3960784, 1, 0, 1,
-0.5620893, -0.8911508, -2.810364, 0.3921569, 1, 0, 1,
-0.5614834, -0.3725961, -0.8523914, 0.3843137, 1, 0, 1,
-0.5574416, -1.454217, -2.286921, 0.3803922, 1, 0, 1,
-0.5522676, -0.3022869, -3.180882, 0.372549, 1, 0, 1,
-0.5490881, -1.929069, -3.084927, 0.3686275, 1, 0, 1,
-0.541461, -2.195379, -3.290683, 0.3607843, 1, 0, 1,
-0.5400895, -0.8264934, -2.12154, 0.3568628, 1, 0, 1,
-0.5383884, -0.0764633, -2.918083, 0.3490196, 1, 0, 1,
-0.5374724, -0.3255502, -2.37253, 0.345098, 1, 0, 1,
-0.5274857, 1.619265, -2.152796, 0.3372549, 1, 0, 1,
-0.5261775, 2.012132, 0.009630161, 0.3333333, 1, 0, 1,
-0.5216112, 0.4190431, -0.4104254, 0.3254902, 1, 0, 1,
-0.5181817, -0.3698872, -3.021003, 0.3215686, 1, 0, 1,
-0.5172155, -1.187282, -1.476196, 0.3137255, 1, 0, 1,
-0.515122, 1.087274, 1.264035, 0.3098039, 1, 0, 1,
-0.5142034, -1.111085, -0.6678716, 0.3019608, 1, 0, 1,
-0.5104358, 1.202518, 0.2842619, 0.2941177, 1, 0, 1,
-0.5091303, 1.450974, -1.009041, 0.2901961, 1, 0, 1,
-0.5078718, 0.5114496, -1.248184, 0.282353, 1, 0, 1,
-0.5075134, -0.2623062, -2.450601, 0.2784314, 1, 0, 1,
-0.5024668, 0.2049291, -0.160864, 0.2705882, 1, 0, 1,
-0.4970154, -0.1637153, -2.316882, 0.2666667, 1, 0, 1,
-0.4960205, 0.1335777, -1.604558, 0.2588235, 1, 0, 1,
-0.4926608, -0.05122403, -2.939886, 0.254902, 1, 0, 1,
-0.4893065, -1.608147, -3.19503, 0.2470588, 1, 0, 1,
-0.481665, 1.355577, -0.4731751, 0.2431373, 1, 0, 1,
-0.4773933, -0.6510714, -2.049914, 0.2352941, 1, 0, 1,
-0.4772184, 1.969954, -1.253927, 0.2313726, 1, 0, 1,
-0.4730451, -1.115385, -4.222188, 0.2235294, 1, 0, 1,
-0.4717565, -0.8033102, -2.195371, 0.2196078, 1, 0, 1,
-0.4691918, -1.626545, -4.284746, 0.2117647, 1, 0, 1,
-0.4661666, -0.7266282, -2.436852, 0.2078431, 1, 0, 1,
-0.4642682, -0.03845188, -1.000129, 0.2, 1, 0, 1,
-0.4608714, -0.0008772762, -1.276007, 0.1921569, 1, 0, 1,
-0.4580615, -0.9904851, -2.203822, 0.1882353, 1, 0, 1,
-0.4550289, 0.1012752, -2.902289, 0.1803922, 1, 0, 1,
-0.4536997, 0.3051019, -0.6242352, 0.1764706, 1, 0, 1,
-0.4487832, -0.4755195, -2.506663, 0.1686275, 1, 0, 1,
-0.446008, 0.01060236, -3.445725, 0.1647059, 1, 0, 1,
-0.4439943, 0.6538324, 0.6832222, 0.1568628, 1, 0, 1,
-0.442876, -0.5297365, -2.909395, 0.1529412, 1, 0, 1,
-0.4426427, -1.790739, -4.497581, 0.145098, 1, 0, 1,
-0.4418423, -0.1540287, -2.045391, 0.1411765, 1, 0, 1,
-0.4400614, 0.3408755, -0.3004702, 0.1333333, 1, 0, 1,
-0.436704, -1.775181, -2.721029, 0.1294118, 1, 0, 1,
-0.4367034, -2.429301, -2.815289, 0.1215686, 1, 0, 1,
-0.4341323, -1.292338, -1.906127, 0.1176471, 1, 0, 1,
-0.4337531, -0.7884505, -2.079184, 0.1098039, 1, 0, 1,
-0.4314075, 0.6110576, 0.3920742, 0.1058824, 1, 0, 1,
-0.4274171, 0.06344812, -1.627078, 0.09803922, 1, 0, 1,
-0.4211046, 0.01393097, -1.725958, 0.09019608, 1, 0, 1,
-0.4199293, -1.704808, -2.68654, 0.08627451, 1, 0, 1,
-0.4179715, 0.6865438, 0.4476162, 0.07843138, 1, 0, 1,
-0.4161289, -1.305254, -1.812403, 0.07450981, 1, 0, 1,
-0.4161131, 0.4579434, 1.000182, 0.06666667, 1, 0, 1,
-0.4142287, -0.008901532, -1.141919, 0.0627451, 1, 0, 1,
-0.406702, -0.1441526, -2.035038, 0.05490196, 1, 0, 1,
-0.4061382, 1.488124, -1.552868, 0.05098039, 1, 0, 1,
-0.4061368, -1.80101, -2.128407, 0.04313726, 1, 0, 1,
-0.4036291, 1.599005, -0.9162497, 0.03921569, 1, 0, 1,
-0.4026948, -0.1621062, -0.8775237, 0.03137255, 1, 0, 1,
-0.4019066, 0.4327111, -1.666348, 0.02745098, 1, 0, 1,
-0.400727, -0.5890228, -1.997819, 0.01960784, 1, 0, 1,
-0.4003682, 0.303324, -0.3618654, 0.01568628, 1, 0, 1,
-0.4002369, 0.2566732, 0.05472443, 0.007843138, 1, 0, 1,
-0.398272, 1.557352, -1.097967, 0.003921569, 1, 0, 1,
-0.3971062, 0.9073036, 1.696943, 0, 1, 0.003921569, 1,
-0.3914051, 0.1112767, -2.252997, 0, 1, 0.01176471, 1,
-0.3913584, 0.8876977, -1.023867, 0, 1, 0.01568628, 1,
-0.39122, 1.531415, 0.8991624, 0, 1, 0.02352941, 1,
-0.3899999, -0.5847389, -1.494704, 0, 1, 0.02745098, 1,
-0.3899802, -0.9627001, -2.551301, 0, 1, 0.03529412, 1,
-0.3889413, -0.494612, -2.617063, 0, 1, 0.03921569, 1,
-0.3886431, -0.335395, -2.547755, 0, 1, 0.04705882, 1,
-0.3880093, 1.525996, -1.795791, 0, 1, 0.05098039, 1,
-0.3874826, -0.09816105, -2.545299, 0, 1, 0.05882353, 1,
-0.3870015, 0.6313561, -1.138622, 0, 1, 0.0627451, 1,
-0.3868999, -0.05022231, -0.7903093, 0, 1, 0.07058824, 1,
-0.3822446, -0.7542844, -3.903497, 0, 1, 0.07450981, 1,
-0.3820568, -0.08601429, -0.8235993, 0, 1, 0.08235294, 1,
-0.379724, -1.429726, -3.177458, 0, 1, 0.08627451, 1,
-0.377789, 0.7059361, 0.1223051, 0, 1, 0.09411765, 1,
-0.3777663, 0.06075902, 0.4658122, 0, 1, 0.1019608, 1,
-0.3762353, -0.884443, -3.950619, 0, 1, 0.1058824, 1,
-0.3724509, 0.2457436, -1.039075, 0, 1, 0.1137255, 1,
-0.3711087, -0.07605469, -0.5820718, 0, 1, 0.1176471, 1,
-0.3708167, 0.6433665, -1.768144, 0, 1, 0.1254902, 1,
-0.3706583, 0.9124104, 0.1985971, 0, 1, 0.1294118, 1,
-0.3641645, -0.5381166, -3.095214, 0, 1, 0.1372549, 1,
-0.3609725, -1.65124, -4.359705, 0, 1, 0.1411765, 1,
-0.3536935, 0.4156243, -0.618966, 0, 1, 0.1490196, 1,
-0.3511488, 0.08598116, -0.8657673, 0, 1, 0.1529412, 1,
-0.350929, -1.019966, -1.477961, 0, 1, 0.1607843, 1,
-0.3372105, -1.452355, -2.024735, 0, 1, 0.1647059, 1,
-0.3359716, 0.458728, -1.845737, 0, 1, 0.172549, 1,
-0.3356257, 0.3992717, -0.6943641, 0, 1, 0.1764706, 1,
-0.3350183, 0.6113122, -2.263003, 0, 1, 0.1843137, 1,
-0.3303781, -1.76827, -2.925621, 0, 1, 0.1882353, 1,
-0.3283178, -0.1770564, -2.030657, 0, 1, 0.1960784, 1,
-0.3250853, -0.4151323, -3.51398, 0, 1, 0.2039216, 1,
-0.3175245, -0.03703501, -2.0926, 0, 1, 0.2078431, 1,
-0.3173156, -0.00566243, -0.1972637, 0, 1, 0.2156863, 1,
-0.3130113, -0.1243184, -0.3165416, 0, 1, 0.2196078, 1,
-0.3083921, -0.1282897, -2.4276, 0, 1, 0.227451, 1,
-0.3076288, 0.2654944, -1.445245, 0, 1, 0.2313726, 1,
-0.3041591, 1.093329, -0.2015039, 0, 1, 0.2392157, 1,
-0.2979278, -1.090143, -3.23843, 0, 1, 0.2431373, 1,
-0.2939728, 1.348178, 1.570787, 0, 1, 0.2509804, 1,
-0.2930899, -0.7878762, -2.52762, 0, 1, 0.254902, 1,
-0.2911379, -0.4166836, -3.421233, 0, 1, 0.2627451, 1,
-0.2906346, -0.80618, -4.395791, 0, 1, 0.2666667, 1,
-0.2902095, 0.9485493, -2.331485, 0, 1, 0.2745098, 1,
-0.2887452, 0.2526605, -0.3070556, 0, 1, 0.2784314, 1,
-0.2864799, -1.935711, -3.240173, 0, 1, 0.2862745, 1,
-0.2844481, 1.192151, -1.017804, 0, 1, 0.2901961, 1,
-0.2830254, -0.2933622, -3.204778, 0, 1, 0.2980392, 1,
-0.2815835, -0.3447042, -3.144887, 0, 1, 0.3058824, 1,
-0.2813216, -1.089183, -4.552402, 0, 1, 0.3098039, 1,
-0.2805003, 1.183358, 0.7299187, 0, 1, 0.3176471, 1,
-0.2732717, -1.262119, -2.252064, 0, 1, 0.3215686, 1,
-0.2690292, 0.9762424, 1.449108, 0, 1, 0.3294118, 1,
-0.2685284, 0.4299869, -1.106935, 0, 1, 0.3333333, 1,
-0.2622989, -1.379583, -3.671199, 0, 1, 0.3411765, 1,
-0.2597545, 0.3442819, -0.3960936, 0, 1, 0.345098, 1,
-0.2522818, -0.511141, -2.265335, 0, 1, 0.3529412, 1,
-0.2455706, 0.3584993, -0.2731211, 0, 1, 0.3568628, 1,
-0.2442162, -0.4482575, -1.241857, 0, 1, 0.3647059, 1,
-0.2441917, -0.5417978, -1.304734, 0, 1, 0.3686275, 1,
-0.2418244, -1.472571, -1.621119, 0, 1, 0.3764706, 1,
-0.2407999, 2.132072, 0.04599436, 0, 1, 0.3803922, 1,
-0.2403834, -0.2389925, -2.90252, 0, 1, 0.3882353, 1,
-0.237564, -1.225526, -2.649533, 0, 1, 0.3921569, 1,
-0.2363392, -0.1070519, -1.661934, 0, 1, 0.4, 1,
-0.2363386, 2.372427, 0.8467903, 0, 1, 0.4078431, 1,
-0.2243946, 0.4173283, -0.1568834, 0, 1, 0.4117647, 1,
-0.222881, -0.05206387, -3.388227, 0, 1, 0.4196078, 1,
-0.2199705, -0.5856479, -4.739929, 0, 1, 0.4235294, 1,
-0.2183449, -0.7380856, -2.988183, 0, 1, 0.4313726, 1,
-0.2156556, -0.81455, -3.787342, 0, 1, 0.4352941, 1,
-0.2152372, 1.11942, -0.5544464, 0, 1, 0.4431373, 1,
-0.2094661, 1.658908, -1.490814, 0, 1, 0.4470588, 1,
-0.2057407, -1.529625, -2.628467, 0, 1, 0.454902, 1,
-0.2050114, 0.6132679, -0.1500928, 0, 1, 0.4588235, 1,
-0.2041909, -2.390279, -2.47062, 0, 1, 0.4666667, 1,
-0.2018224, -1.304497, -3.77416, 0, 1, 0.4705882, 1,
-0.1995283, -1.52268, -2.918737, 0, 1, 0.4784314, 1,
-0.1983106, -0.6850822, -0.9485552, 0, 1, 0.4823529, 1,
-0.1972357, -1.697798, -3.604019, 0, 1, 0.4901961, 1,
-0.195484, -1.180585, -1.455795, 0, 1, 0.4941176, 1,
-0.1937296, -0.5350807, -1.836852, 0, 1, 0.5019608, 1,
-0.1927373, 2.327812, -0.9450033, 0, 1, 0.509804, 1,
-0.1923949, 1.716753, 1.717742, 0, 1, 0.5137255, 1,
-0.1848521, 0.3478676, 0.2010047, 0, 1, 0.5215687, 1,
-0.1847454, -1.759429, -3.606233, 0, 1, 0.5254902, 1,
-0.1843991, -0.2570574, -2.807212, 0, 1, 0.5333334, 1,
-0.1812603, -0.6753948, -3.253699, 0, 1, 0.5372549, 1,
-0.179785, -0.007582359, -2.740418, 0, 1, 0.5450981, 1,
-0.1784352, -0.4694533, -1.329065, 0, 1, 0.5490196, 1,
-0.1765916, 1.767436, -0.6247088, 0, 1, 0.5568628, 1,
-0.162177, 2.060791, 0.1652804, 0, 1, 0.5607843, 1,
-0.1544514, 0.8976869, -0.1023229, 0, 1, 0.5686275, 1,
-0.151982, 0.6030206, 0.4130743, 0, 1, 0.572549, 1,
-0.1482284, 1.046856, -1.955229, 0, 1, 0.5803922, 1,
-0.146825, 0.8099278, -0.7207898, 0, 1, 0.5843138, 1,
-0.1463807, -1.480558, -3.66223, 0, 1, 0.5921569, 1,
-0.1450045, 1.769561, -0.6384663, 0, 1, 0.5960785, 1,
-0.1400841, 0.9293649, -0.3942288, 0, 1, 0.6039216, 1,
-0.1394362, -1.313166, -2.443732, 0, 1, 0.6117647, 1,
-0.1390947, 0.7730302, 0.469786, 0, 1, 0.6156863, 1,
-0.1374392, -0.04706782, -0.4566837, 0, 1, 0.6235294, 1,
-0.1326016, -0.6944334, -2.878862, 0, 1, 0.627451, 1,
-0.131914, 0.7790448, -0.2212257, 0, 1, 0.6352941, 1,
-0.1288858, -0.1479038, -2.651073, 0, 1, 0.6392157, 1,
-0.1246809, 1.852272, -1.706699, 0, 1, 0.6470588, 1,
-0.123955, -0.6974976, -2.234701, 0, 1, 0.6509804, 1,
-0.1225653, -1.681738, -1.23355, 0, 1, 0.6588235, 1,
-0.1216856, 0.06856579, -3.224556, 0, 1, 0.6627451, 1,
-0.1176911, -0.0867863, -2.219157, 0, 1, 0.6705883, 1,
-0.1169705, -0.9406732, -3.193903, 0, 1, 0.6745098, 1,
-0.1155303, -0.05055236, -4.263479, 0, 1, 0.682353, 1,
-0.1122412, 2.246393, 0.5472224, 0, 1, 0.6862745, 1,
-0.112036, 0.7373326, 0.7307613, 0, 1, 0.6941177, 1,
-0.108877, -0.8769876, -1.219848, 0, 1, 0.7019608, 1,
-0.10622, -0.679204, -3.591535, 0, 1, 0.7058824, 1,
-0.1041681, -1.379311, -3.261034, 0, 1, 0.7137255, 1,
-0.103827, 1.069516, 0.5543777, 0, 1, 0.7176471, 1,
-0.0990153, 0.09658155, -2.08865, 0, 1, 0.7254902, 1,
-0.09767298, 1.002397, 0.9906683, 0, 1, 0.7294118, 1,
-0.09655256, 0.9760619, 1.471557, 0, 1, 0.7372549, 1,
-0.09391429, 1.144516, -0.676212, 0, 1, 0.7411765, 1,
-0.08283395, 0.6094243, 0.7120163, 0, 1, 0.7490196, 1,
-0.07936467, -0.9583035, -2.592398, 0, 1, 0.7529412, 1,
-0.07886976, -0.9925746, -0.1595938, 0, 1, 0.7607843, 1,
-0.07514231, 0.6394799, 0.3646298, 0, 1, 0.7647059, 1,
-0.0738628, 1.072094, 0.3483035, 0, 1, 0.772549, 1,
-0.07187407, 2.022675, 0.3608845, 0, 1, 0.7764706, 1,
-0.07053315, 0.5532396, -0.3988518, 0, 1, 0.7843137, 1,
-0.07013111, -1.447597, -2.044977, 0, 1, 0.7882353, 1,
-0.06793632, -0.7941216, -3.303314, 0, 1, 0.7960784, 1,
-0.06241167, -0.3911358, -3.473339, 0, 1, 0.8039216, 1,
-0.0609064, -0.00433847, -2.84406, 0, 1, 0.8078431, 1,
-0.05916863, -0.3188788, -3.719742, 0, 1, 0.8156863, 1,
-0.05815201, -0.1456034, -1.200562, 0, 1, 0.8196079, 1,
-0.05755349, 0.1367126, -0.2585148, 0, 1, 0.827451, 1,
-0.05426591, -1.345454, -4.030233, 0, 1, 0.8313726, 1,
-0.05138662, 0.8597351, 0.1737566, 0, 1, 0.8392157, 1,
-0.05066792, 1.540331, 1.613382, 0, 1, 0.8431373, 1,
-0.04962972, -0.06226712, -1.806667, 0, 1, 0.8509804, 1,
-0.04850538, 1.305119, 1.358647, 0, 1, 0.854902, 1,
-0.04561486, -1.788561, -3.27796, 0, 1, 0.8627451, 1,
-0.04459973, 1.457541, -0.1923163, 0, 1, 0.8666667, 1,
-0.04396946, 0.1277595, 0.2342048, 0, 1, 0.8745098, 1,
-0.04358974, 1.633979, -0.6388075, 0, 1, 0.8784314, 1,
-0.04342437, -1.223574, -1.801809, 0, 1, 0.8862745, 1,
-0.04277561, -0.09588342, -4.727317, 0, 1, 0.8901961, 1,
-0.03832139, 0.7991442, 0.6559979, 0, 1, 0.8980392, 1,
-0.03482029, 0.9077806, 0.2024593, 0, 1, 0.9058824, 1,
-0.03258417, -0.3879918, -3.131954, 0, 1, 0.9098039, 1,
-0.02604854, -0.2107375, -1.706911, 0, 1, 0.9176471, 1,
-0.02255099, 0.305891, -2.471577, 0, 1, 0.9215686, 1,
-0.02241192, -1.39252, -1.254677, 0, 1, 0.9294118, 1,
-0.01866158, -1.182418, -2.829537, 0, 1, 0.9333333, 1,
-0.01812881, 0.6812106, 1.175044, 0, 1, 0.9411765, 1,
-0.01759423, -1.529235, -3.938026, 0, 1, 0.945098, 1,
-0.01616109, 0.6428471, 0.4100001, 0, 1, 0.9529412, 1,
-0.01528464, -0.3720436, -3.713199, 0, 1, 0.9568627, 1,
-0.01505385, 1.946003, -0.164251, 0, 1, 0.9647059, 1,
-0.01331567, -1.321082, -1.775309, 0, 1, 0.9686275, 1,
-0.01236328, -1.087252, -3.754077, 0, 1, 0.9764706, 1,
-0.01154545, 0.7207747, -0.6600881, 0, 1, 0.9803922, 1,
-0.009047707, 0.9936816, -0.3349015, 0, 1, 0.9882353, 1,
-0.006201246, 0.1746116, -0.163743, 0, 1, 0.9921569, 1,
-0.005997445, 0.07204439, 0.8990288, 0, 1, 1, 1,
-0.001561868, -0.5591983, -2.055547, 0, 0.9921569, 1, 1,
0.001756406, -1.520158, 4.70337, 0, 0.9882353, 1, 1,
0.009098, 0.2883077, -0.01669465, 0, 0.9803922, 1, 1,
0.01208967, 0.2612442, 2.027589, 0, 0.9764706, 1, 1,
0.01366758, -0.2982793, 4.757685, 0, 0.9686275, 1, 1,
0.01483444, -2.239733, 2.854075, 0, 0.9647059, 1, 1,
0.01625233, -0.9712995, 3.935799, 0, 0.9568627, 1, 1,
0.01663648, -0.9504575, 5.17848, 0, 0.9529412, 1, 1,
0.01956866, 1.045541, -1.647388, 0, 0.945098, 1, 1,
0.02134278, 0.007683798, 1.267437, 0, 0.9411765, 1, 1,
0.02266027, -0.553618, 2.047424, 0, 0.9333333, 1, 1,
0.02511649, 1.67171, 0.09274581, 0, 0.9294118, 1, 1,
0.02514978, 0.4981745, -1.103182, 0, 0.9215686, 1, 1,
0.02630215, -0.3823877, 4.111439, 0, 0.9176471, 1, 1,
0.02722374, -1.132701, 3.872823, 0, 0.9098039, 1, 1,
0.03473612, -0.8263667, 4.783339, 0, 0.9058824, 1, 1,
0.03792062, -0.2937835, 2.424105, 0, 0.8980392, 1, 1,
0.03923125, -0.427856, 4.437685, 0, 0.8901961, 1, 1,
0.04038984, -0.9987475, 3.794549, 0, 0.8862745, 1, 1,
0.04626117, 0.6762838, -0.1963286, 0, 0.8784314, 1, 1,
0.04807031, -1.440035, 2.906946, 0, 0.8745098, 1, 1,
0.05021499, -0.8075604, 2.890992, 0, 0.8666667, 1, 1,
0.05533881, 1.310574, 0.7703155, 0, 0.8627451, 1, 1,
0.05591282, -0.3483826, 3.552874, 0, 0.854902, 1, 1,
0.05763442, -0.815736, 2.713559, 0, 0.8509804, 1, 1,
0.05800536, 0.3512406, -0.5744834, 0, 0.8431373, 1, 1,
0.06007428, -1.361851, 3.078189, 0, 0.8392157, 1, 1,
0.0618105, -0.587738, 2.089208, 0, 0.8313726, 1, 1,
0.06796268, -0.8349327, 3.267543, 0, 0.827451, 1, 1,
0.07387549, -1.491631, 2.810183, 0, 0.8196079, 1, 1,
0.07719281, -0.3197124, 1.847881, 0, 0.8156863, 1, 1,
0.08116789, -0.2480651, 2.257667, 0, 0.8078431, 1, 1,
0.0878473, 0.4207975, 1.783983, 0, 0.8039216, 1, 1,
0.08802985, -1.389252, 2.780334, 0, 0.7960784, 1, 1,
0.09314819, -1.387393, 2.823131, 0, 0.7882353, 1, 1,
0.09472927, 0.5465478, 0.2756388, 0, 0.7843137, 1, 1,
0.1032488, 0.2955367, 0.1017662, 0, 0.7764706, 1, 1,
0.105276, 0.4816073, -1.209426, 0, 0.772549, 1, 1,
0.1068031, 1.121548, -0.1461668, 0, 0.7647059, 1, 1,
0.1088317, 0.008030826, -0.6188039, 0, 0.7607843, 1, 1,
0.1118634, -0.7400067, 2.371158, 0, 0.7529412, 1, 1,
0.112343, 0.902465, -0.5711378, 0, 0.7490196, 1, 1,
0.1133563, 2.023521, 0.5382418, 0, 0.7411765, 1, 1,
0.1136444, -0.4429829, 1.605941, 0, 0.7372549, 1, 1,
0.1154665, 0.357779, -0.217627, 0, 0.7294118, 1, 1,
0.1169646, -0.4141948, 1.586689, 0, 0.7254902, 1, 1,
0.1182154, 1.379217, 0.04245892, 0, 0.7176471, 1, 1,
0.1271884, -1.356999, 3.315746, 0, 0.7137255, 1, 1,
0.1286001, 0.5072267, 0.3126926, 0, 0.7058824, 1, 1,
0.1336106, -1.202113, 4.278245, 0, 0.6980392, 1, 1,
0.136583, 0.2693278, 0.8170229, 0, 0.6941177, 1, 1,
0.1378383, 0.9759992, 0.5360652, 0, 0.6862745, 1, 1,
0.1412192, -0.238969, 4.68914, 0, 0.682353, 1, 1,
0.1428544, 1.445772, -0.09209064, 0, 0.6745098, 1, 1,
0.1442046, 1.602655, 1.926316, 0, 0.6705883, 1, 1,
0.1502661, 0.6078597, -0.3592681, 0, 0.6627451, 1, 1,
0.1535684, 0.6717911, 1.770595, 0, 0.6588235, 1, 1,
0.1550717, 1.14081, -1.011351, 0, 0.6509804, 1, 1,
0.1568197, -1.074901, 3.391773, 0, 0.6470588, 1, 1,
0.1612516, 0.3143849, -0.8995733, 0, 0.6392157, 1, 1,
0.1657209, 0.5299988, -0.5046052, 0, 0.6352941, 1, 1,
0.1667513, 0.8837604, 1.451697, 0, 0.627451, 1, 1,
0.1738537, -1.736328, 3.357556, 0, 0.6235294, 1, 1,
0.1762164, 1.488964, -0.1019752, 0, 0.6156863, 1, 1,
0.1798026, -0.3124621, 3.290508, 0, 0.6117647, 1, 1,
0.1848232, 1.128535, 0.527247, 0, 0.6039216, 1, 1,
0.1856829, -0.0663584, 3.885791, 0, 0.5960785, 1, 1,
0.1859485, 0.6286027, -0.08619843, 0, 0.5921569, 1, 1,
0.1865145, 2.395248, 1.929898, 0, 0.5843138, 1, 1,
0.1867493, 1.263282, -1.949287, 0, 0.5803922, 1, 1,
0.1980343, 0.9912913, 0.7572653, 0, 0.572549, 1, 1,
0.198054, 0.8791166, 1.383923, 0, 0.5686275, 1, 1,
0.1984204, -0.5725159, 2.47007, 0, 0.5607843, 1, 1,
0.2066746, -1.146151, 1.439938, 0, 0.5568628, 1, 1,
0.2110767, -0.5345721, -0.1537238, 0, 0.5490196, 1, 1,
0.2117819, 1.190111, 1.384558, 0, 0.5450981, 1, 1,
0.2127116, 0.04136408, 2.811208, 0, 0.5372549, 1, 1,
0.2146736, 0.3798426, 0.06348899, 0, 0.5333334, 1, 1,
0.2161983, -1.355271, 4.005229, 0, 0.5254902, 1, 1,
0.2178852, 2.142597, 0.7568181, 0, 0.5215687, 1, 1,
0.2194189, -0.1063727, 2.245938, 0, 0.5137255, 1, 1,
0.219636, -1.333939, 3.397284, 0, 0.509804, 1, 1,
0.2219146, 0.7717317, -0.4845206, 0, 0.5019608, 1, 1,
0.2323747, -0.1535932, 0.07881664, 0, 0.4941176, 1, 1,
0.2328717, 0.07019317, 0.1257333, 0, 0.4901961, 1, 1,
0.2333128, -0.5477949, 4.300229, 0, 0.4823529, 1, 1,
0.2361129, -0.1587324, 3.396147, 0, 0.4784314, 1, 1,
0.2422498, -1.360064, 3.080662, 0, 0.4705882, 1, 1,
0.2429199, 0.9765185, 0.09903475, 0, 0.4666667, 1, 1,
0.2446784, -0.2444513, 2.353576, 0, 0.4588235, 1, 1,
0.2472923, 0.4721204, 1.705683, 0, 0.454902, 1, 1,
0.2482322, -0.111039, 0.3645988, 0, 0.4470588, 1, 1,
0.2507525, 0.3293979, -0.4119807, 0, 0.4431373, 1, 1,
0.2582957, -0.1221107, 3.149268, 0, 0.4352941, 1, 1,
0.2585155, 0.7147826, 0.2457068, 0, 0.4313726, 1, 1,
0.2585862, -0.7301837, 4.937085, 0, 0.4235294, 1, 1,
0.2587043, 0.6783167, 0.6993621, 0, 0.4196078, 1, 1,
0.2703777, -0.427411, 2.275583, 0, 0.4117647, 1, 1,
0.2727453, 0.4472347, 2.107395, 0, 0.4078431, 1, 1,
0.2731076, 0.3479943, 1.256634, 0, 0.4, 1, 1,
0.2737205, -0.8569174, 3.801536, 0, 0.3921569, 1, 1,
0.2772191, -0.6148198, 3.46627, 0, 0.3882353, 1, 1,
0.2780687, 1.449456, 1.083661, 0, 0.3803922, 1, 1,
0.2782707, -0.5750086, 2.723116, 0, 0.3764706, 1, 1,
0.2786575, 0.03546659, 1.80053, 0, 0.3686275, 1, 1,
0.2846954, 0.4504317, -0.07542765, 0, 0.3647059, 1, 1,
0.2873258, 0.8095791, -0.400122, 0, 0.3568628, 1, 1,
0.2891617, 0.1563083, 2.833902, 0, 0.3529412, 1, 1,
0.2944496, 1.772811, -0.832388, 0, 0.345098, 1, 1,
0.2963401, 1.271965, 2.383095, 0, 0.3411765, 1, 1,
0.2972064, -0.4543003, 3.694013, 0, 0.3333333, 1, 1,
0.2991673, -0.352626, 2.026831, 0, 0.3294118, 1, 1,
0.2998132, -0.6507835, 3.268332, 0, 0.3215686, 1, 1,
0.3031574, 0.3266366, -0.6790811, 0, 0.3176471, 1, 1,
0.304601, 0.676708, 2.165036, 0, 0.3098039, 1, 1,
0.3082755, -0.2539892, 2.114637, 0, 0.3058824, 1, 1,
0.3168907, -1.08389, 2.626946, 0, 0.2980392, 1, 1,
0.3184578, 1.779863, -1.482773, 0, 0.2901961, 1, 1,
0.3188056, -1.173338, 2.160112, 0, 0.2862745, 1, 1,
0.3190663, 0.4258439, 0.8640554, 0, 0.2784314, 1, 1,
0.3215031, -1.381102, 2.841823, 0, 0.2745098, 1, 1,
0.3232688, 2.878361, 0.07799672, 0, 0.2666667, 1, 1,
0.3264955, 0.3708329, 1.712201, 0, 0.2627451, 1, 1,
0.3326862, -1.553032, 1.42361, 0, 0.254902, 1, 1,
0.3328069, 0.6808934, 0.756222, 0, 0.2509804, 1, 1,
0.3347874, 1.137437, 1.350502, 0, 0.2431373, 1, 1,
0.3379339, 1.214519, 0.3467376, 0, 0.2392157, 1, 1,
0.339826, 0.5840669, -0.4077873, 0, 0.2313726, 1, 1,
0.3441181, -0.9590427, 2.615815, 0, 0.227451, 1, 1,
0.3528585, -0.8258386, 3.039383, 0, 0.2196078, 1, 1,
0.3536828, -1.97479, 3.464466, 0, 0.2156863, 1, 1,
0.3551983, 0.3586616, -0.2145872, 0, 0.2078431, 1, 1,
0.361166, 1.61378, 1.492423, 0, 0.2039216, 1, 1,
0.365208, 0.2685777, 2.786246, 0, 0.1960784, 1, 1,
0.3694724, 2.22735, 0.712858, 0, 0.1882353, 1, 1,
0.3699574, 0.157067, 2.32552, 0, 0.1843137, 1, 1,
0.3713324, -1.570137, 2.3085, 0, 0.1764706, 1, 1,
0.3725032, 0.1212884, -0.6859043, 0, 0.172549, 1, 1,
0.3743401, -0.6292161, 2.399638, 0, 0.1647059, 1, 1,
0.3753974, 1.043991, 0.9334943, 0, 0.1607843, 1, 1,
0.3762037, -0.2871389, 5.19238, 0, 0.1529412, 1, 1,
0.3782534, 2.061436, 2.128677, 0, 0.1490196, 1, 1,
0.3803714, 0.2644992, -0.1523939, 0, 0.1411765, 1, 1,
0.3811197, -1.594413, 3.47145, 0, 0.1372549, 1, 1,
0.3830166, -0.8215418, 2.754161, 0, 0.1294118, 1, 1,
0.3830583, 1.915842, -0.009048758, 0, 0.1254902, 1, 1,
0.3831791, 0.2950967, 0.3833384, 0, 0.1176471, 1, 1,
0.3950847, 0.337332, 0.8938251, 0, 0.1137255, 1, 1,
0.3955799, -0.3582969, 1.881042, 0, 0.1058824, 1, 1,
0.3976627, 0.05483656, 0.3059841, 0, 0.09803922, 1, 1,
0.4033427, 1.095115, 1.720823, 0, 0.09411765, 1, 1,
0.4099092, -0.3495347, 4.339112, 0, 0.08627451, 1, 1,
0.4103296, -0.1460916, 1.393189, 0, 0.08235294, 1, 1,
0.4164999, 0.3103512, 0.486005, 0, 0.07450981, 1, 1,
0.4189565, -0.9525595, 2.660877, 0, 0.07058824, 1, 1,
0.426885, -0.01593448, 1.623408, 0, 0.0627451, 1, 1,
0.4297305, -1.301093, 2.366874, 0, 0.05882353, 1, 1,
0.4376651, -0.3029472, 1.885078, 0, 0.05098039, 1, 1,
0.4419812, 0.4526172, 0.7122116, 0, 0.04705882, 1, 1,
0.4436474, 0.1489903, 3.060259, 0, 0.03921569, 1, 1,
0.443734, 0.5499902, 0.8794207, 0, 0.03529412, 1, 1,
0.4469893, 1.72147, 0.8198988, 0, 0.02745098, 1, 1,
0.4505369, -0.7068892, 4.199675, 0, 0.02352941, 1, 1,
0.4575643, -0.5596175, 3.415064, 0, 0.01568628, 1, 1,
0.4576367, 0.9817261, 0.8998845, 0, 0.01176471, 1, 1,
0.4582699, -0.2169133, 3.393244, 0, 0.003921569, 1, 1,
0.4597814, 1.996758, -0.3278314, 0.003921569, 0, 1, 1,
0.4604272, 0.6763753, 1.122652, 0.007843138, 0, 1, 1,
0.4638739, -1.276786, 2.769014, 0.01568628, 0, 1, 1,
0.4655525, -1.122982, 3.364789, 0.01960784, 0, 1, 1,
0.4670278, -0.19836, 3.92424, 0.02745098, 0, 1, 1,
0.4689512, 0.2060218, 0.729255, 0.03137255, 0, 1, 1,
0.4699549, 0.3347766, 2.329373, 0.03921569, 0, 1, 1,
0.4711576, -0.3118545, 3.114305, 0.04313726, 0, 1, 1,
0.4733085, -1.942925, 1.301715, 0.05098039, 0, 1, 1,
0.4751191, -0.4519269, 2.315515, 0.05490196, 0, 1, 1,
0.4765748, -0.5282509, 3.988514, 0.0627451, 0, 1, 1,
0.4790677, 0.799619, 0.3114411, 0.06666667, 0, 1, 1,
0.4852061, 0.8203915, -1.492533, 0.07450981, 0, 1, 1,
0.4863066, -0.6415302, 1.46637, 0.07843138, 0, 1, 1,
0.4866543, -0.8219489, 1.128362, 0.08627451, 0, 1, 1,
0.4871937, 1.060973, -0.5977041, 0.09019608, 0, 1, 1,
0.4874312, 0.08791226, 3.26703, 0.09803922, 0, 1, 1,
0.4907576, 0.6804464, 0.3597524, 0.1058824, 0, 1, 1,
0.4934433, -0.5194738, 2.583612, 0.1098039, 0, 1, 1,
0.4944887, 1.776814, 0.2902867, 0.1176471, 0, 1, 1,
0.5003105, -0.3595986, 2.381743, 0.1215686, 0, 1, 1,
0.5017067, -1.244569, 3.646874, 0.1294118, 0, 1, 1,
0.5028039, 0.1284291, 2.973284, 0.1333333, 0, 1, 1,
0.5050091, 0.4536472, 1.849858, 0.1411765, 0, 1, 1,
0.5075337, 0.4071755, -0.1589192, 0.145098, 0, 1, 1,
0.5076544, 0.1141555, 0.9462142, 0.1529412, 0, 1, 1,
0.513061, 0.01109148, -0.4139245, 0.1568628, 0, 1, 1,
0.523884, 0.5685393, -0.1617495, 0.1647059, 0, 1, 1,
0.52398, -2.061254, 3.259106, 0.1686275, 0, 1, 1,
0.5248373, -0.1702132, 1.917764, 0.1764706, 0, 1, 1,
0.5260732, -0.2150498, 1.823427, 0.1803922, 0, 1, 1,
0.532544, -0.895092, 1.91757, 0.1882353, 0, 1, 1,
0.535204, 0.8940403, -0.02088343, 0.1921569, 0, 1, 1,
0.5363401, 1.1163, 1.845011, 0.2, 0, 1, 1,
0.536675, 0.6442783, 2.246317, 0.2078431, 0, 1, 1,
0.5387033, 0.1493257, 0.957624, 0.2117647, 0, 1, 1,
0.543846, 1.971155, 0.1972093, 0.2196078, 0, 1, 1,
0.5469019, 0.4936989, 0.8696919, 0.2235294, 0, 1, 1,
0.5479912, -0.05144548, 2.952159, 0.2313726, 0, 1, 1,
0.5506052, -0.8347224, 1.935047, 0.2352941, 0, 1, 1,
0.5547204, -0.07694871, -0.129235, 0.2431373, 0, 1, 1,
0.5592278, -0.8311355, 1.184396, 0.2470588, 0, 1, 1,
0.5595332, -0.1745595, 3.14294, 0.254902, 0, 1, 1,
0.5662656, 2.026074, 1.603827, 0.2588235, 0, 1, 1,
0.5665282, 2.131251, -1.145173, 0.2666667, 0, 1, 1,
0.5670496, 0.2177552, 2.277609, 0.2705882, 0, 1, 1,
0.5709733, -1.228746, 2.760105, 0.2784314, 0, 1, 1,
0.5725613, -0.8656819, 3.003309, 0.282353, 0, 1, 1,
0.5773749, 1.684749, -0.0741213, 0.2901961, 0, 1, 1,
0.5775195, -2.132586, 3.220993, 0.2941177, 0, 1, 1,
0.5804393, -0.5414734, 1.846235, 0.3019608, 0, 1, 1,
0.5822025, 1.94151, -1.24933, 0.3098039, 0, 1, 1,
0.5861681, -1.592841, 3.691683, 0.3137255, 0, 1, 1,
0.5896776, -1.261181, 3.215876, 0.3215686, 0, 1, 1,
0.5967268, -1.062851, 1.699076, 0.3254902, 0, 1, 1,
0.5986927, 0.4038833, 0.8524388, 0.3333333, 0, 1, 1,
0.5990035, -0.3343767, 1.32773, 0.3372549, 0, 1, 1,
0.5993589, 1.262508, 0.4691244, 0.345098, 0, 1, 1,
0.5999344, -0.393968, 1.440069, 0.3490196, 0, 1, 1,
0.6025268, 0.2847756, 1.454571, 0.3568628, 0, 1, 1,
0.612026, -1.101699, 1.527007, 0.3607843, 0, 1, 1,
0.6130278, -0.898104, 3.538867, 0.3686275, 0, 1, 1,
0.6152889, 1.342054, 0.6580659, 0.372549, 0, 1, 1,
0.616663, -0.7228004, 3.300767, 0.3803922, 0, 1, 1,
0.6167779, -0.3521518, 1.775524, 0.3843137, 0, 1, 1,
0.617758, -0.4157144, 2.117705, 0.3921569, 0, 1, 1,
0.6256559, -0.3855186, 0.3305341, 0.3960784, 0, 1, 1,
0.6269257, -0.4882673, 1.295374, 0.4039216, 0, 1, 1,
0.632266, -0.580623, -0.1800158, 0.4117647, 0, 1, 1,
0.6364147, 0.686253, 1.709065, 0.4156863, 0, 1, 1,
0.6395618, -1.165501, 3.506912, 0.4235294, 0, 1, 1,
0.6426787, -0.787257, 3.827815, 0.427451, 0, 1, 1,
0.6515605, 0.7727991, 1.499299, 0.4352941, 0, 1, 1,
0.6531671, 0.1953924, 1.513869, 0.4392157, 0, 1, 1,
0.6544033, 0.3764813, 0.7760863, 0.4470588, 0, 1, 1,
0.6550586, 0.5998434, 0.3387679, 0.4509804, 0, 1, 1,
0.6605481, 0.103087, 3.812089, 0.4588235, 0, 1, 1,
0.6627985, 0.8585684, 0.530472, 0.4627451, 0, 1, 1,
0.6638684, 0.1997786, 1.215284, 0.4705882, 0, 1, 1,
0.6640819, 0.7481374, -0.4354821, 0.4745098, 0, 1, 1,
0.664325, 1.050284, 0.7734976, 0.4823529, 0, 1, 1,
0.6661763, -0.7544973, 1.861113, 0.4862745, 0, 1, 1,
0.6666097, 0.6429471, 3.391008, 0.4941176, 0, 1, 1,
0.6668931, 0.6514838, 1.788096, 0.5019608, 0, 1, 1,
0.6686408, -0.5662648, 2.168003, 0.5058824, 0, 1, 1,
0.6708455, 0.9052509, -0.1755105, 0.5137255, 0, 1, 1,
0.6725864, 1.161187, -0.1770259, 0.5176471, 0, 1, 1,
0.6731312, -1.113642, 3.038119, 0.5254902, 0, 1, 1,
0.6815004, 0.7102277, 0.6724608, 0.5294118, 0, 1, 1,
0.6873283, -0.2109901, 1.079771, 0.5372549, 0, 1, 1,
0.6881123, -0.1467921, 1.599305, 0.5411765, 0, 1, 1,
0.6921889, 0.3782699, 2.391445, 0.5490196, 0, 1, 1,
0.6926492, -0.3111908, 1.563587, 0.5529412, 0, 1, 1,
0.6952356, 0.7748269, 0.3331633, 0.5607843, 0, 1, 1,
0.7010174, -0.7636471, 3.298983, 0.5647059, 0, 1, 1,
0.7015707, -0.8913224, 2.379046, 0.572549, 0, 1, 1,
0.7059909, 1.544565, 0.1754591, 0.5764706, 0, 1, 1,
0.7060556, -1.413368, 3.017657, 0.5843138, 0, 1, 1,
0.7127891, -0.01353035, 3.849693, 0.5882353, 0, 1, 1,
0.7136752, 0.2482097, 2.745696, 0.5960785, 0, 1, 1,
0.7176532, -0.3548336, 0.088677, 0.6039216, 0, 1, 1,
0.7255998, -0.8980781, 3.551141, 0.6078432, 0, 1, 1,
0.7321273, 1.125999, 0.7133675, 0.6156863, 0, 1, 1,
0.732569, -0.3919533, 2.227204, 0.6196079, 0, 1, 1,
0.7341917, -1.081479, 3.691773, 0.627451, 0, 1, 1,
0.7382082, 0.6975194, 1.015969, 0.6313726, 0, 1, 1,
0.7392727, -0.5709794, 1.395378, 0.6392157, 0, 1, 1,
0.7416136, 1.150426, -0.9629196, 0.6431373, 0, 1, 1,
0.7430442, 0.6116949, 0.7935308, 0.6509804, 0, 1, 1,
0.7436618, 0.267291, 1.326591, 0.654902, 0, 1, 1,
0.7451949, -0.09057829, 0.05495254, 0.6627451, 0, 1, 1,
0.747421, 1.436546, 0.2380003, 0.6666667, 0, 1, 1,
0.7477716, 1.17596, 2.395387, 0.6745098, 0, 1, 1,
0.7501026, -0.3264927, 2.157861, 0.6784314, 0, 1, 1,
0.755214, 0.1195309, 3.197746, 0.6862745, 0, 1, 1,
0.7596592, 1.324265, 0.132306, 0.6901961, 0, 1, 1,
0.7601964, -1.248958, 1.662985, 0.6980392, 0, 1, 1,
0.7608629, 0.3928749, 1.034067, 0.7058824, 0, 1, 1,
0.7714366, -1.332532, 2.454746, 0.7098039, 0, 1, 1,
0.7744513, 0.9098234, -1.254496, 0.7176471, 0, 1, 1,
0.7746655, -0.4016427, 2.232475, 0.7215686, 0, 1, 1,
0.7874884, 0.2782778, 0.8612843, 0.7294118, 0, 1, 1,
0.7878429, -0.2621049, 3.078155, 0.7333333, 0, 1, 1,
0.7883927, -0.7440383, 3.134159, 0.7411765, 0, 1, 1,
0.7896184, 0.9385514, 1.575063, 0.7450981, 0, 1, 1,
0.79601, 1.393547, 1.265956, 0.7529412, 0, 1, 1,
0.7996607, 0.831506, 1.027806, 0.7568628, 0, 1, 1,
0.8003659, -0.3771798, 1.758583, 0.7647059, 0, 1, 1,
0.8036549, 0.9087756, 1.364174, 0.7686275, 0, 1, 1,
0.8067079, -1.76315, 3.268607, 0.7764706, 0, 1, 1,
0.8082696, -0.5819062, 2.36861, 0.7803922, 0, 1, 1,
0.8126787, -0.518383, 5.024732, 0.7882353, 0, 1, 1,
0.8128042, 1.017757, 0.6217459, 0.7921569, 0, 1, 1,
0.8165745, -0.9248909, 2.216654, 0.8, 0, 1, 1,
0.8187332, 0.003588692, 0.1310873, 0.8078431, 0, 1, 1,
0.8220273, -1.407693, 1.2061, 0.8117647, 0, 1, 1,
0.8237768, 0.4875084, 1.420779, 0.8196079, 0, 1, 1,
0.8248249, 0.1149511, 2.450703, 0.8235294, 0, 1, 1,
0.8282646, 0.7142476, 0.4137182, 0.8313726, 0, 1, 1,
0.8324507, -0.7187718, 2.45982, 0.8352941, 0, 1, 1,
0.8325711, 0.09092514, 1.34347, 0.8431373, 0, 1, 1,
0.8398054, 1.475839, -0.2163112, 0.8470588, 0, 1, 1,
0.8415076, -0.1737467, 3.106269, 0.854902, 0, 1, 1,
0.8447821, -0.02974063, 0.7841535, 0.8588235, 0, 1, 1,
0.8541566, -1.957598, 3.457561, 0.8666667, 0, 1, 1,
0.8627885, -0.6108457, 2.067979, 0.8705882, 0, 1, 1,
0.8709762, -0.3629959, 1.521824, 0.8784314, 0, 1, 1,
0.872754, -1.284179, 3.366513, 0.8823529, 0, 1, 1,
0.8774241, -0.4830155, 0.7540447, 0.8901961, 0, 1, 1,
0.8777479, -0.7788379, 0.3350943, 0.8941177, 0, 1, 1,
0.8916657, 1.512989, -0.9503234, 0.9019608, 0, 1, 1,
0.903147, -0.6226333, 1.528226, 0.9098039, 0, 1, 1,
0.9040381, -0.2205359, 1.368418, 0.9137255, 0, 1, 1,
0.9082106, 1.447879, 0.003547975, 0.9215686, 0, 1, 1,
0.9100989, -1.136599, 2.820779, 0.9254902, 0, 1, 1,
0.9126025, 1.073121, 0.5025221, 0.9333333, 0, 1, 1,
0.9157521, -1.522819, 3.092852, 0.9372549, 0, 1, 1,
0.917704, -0.05535807, 2.258587, 0.945098, 0, 1, 1,
0.9179832, 0.4363199, -0.2157752, 0.9490196, 0, 1, 1,
0.9195637, -1.36219, 1.677177, 0.9568627, 0, 1, 1,
0.920001, 0.3767515, 0.994281, 0.9607843, 0, 1, 1,
0.9200135, -2.812858, 1.479786, 0.9686275, 0, 1, 1,
0.9313607, -0.3161774, 0.9042672, 0.972549, 0, 1, 1,
0.9388279, 1.508773, 0.1610219, 0.9803922, 0, 1, 1,
0.9395687, 0.5410973, -0.8825851, 0.9843137, 0, 1, 1,
0.94158, -0.1857681, 3.306629, 0.9921569, 0, 1, 1,
0.9463996, -0.2075917, 1.199459, 0.9960784, 0, 1, 1,
0.9481473, -0.2000358, 1.376029, 1, 0, 0.9960784, 1,
0.9507342, -0.6422236, 2.185228, 1, 0, 0.9882353, 1,
0.9595485, 0.7235601, 1.284083, 1, 0, 0.9843137, 1,
0.9607776, 0.916002, -1.063085, 1, 0, 0.9764706, 1,
0.9728012, -1.937397, 2.713796, 1, 0, 0.972549, 1,
0.9756237, 0.3291116, 2.888798, 1, 0, 0.9647059, 1,
0.9763759, -0.7236465, 1.423445, 1, 0, 0.9607843, 1,
0.9861645, 1.210475, 2.314255, 1, 0, 0.9529412, 1,
0.9946002, 0.8953899, 0.6891578, 1, 0, 0.9490196, 1,
0.9981697, -1.494952, 0.6145206, 1, 0, 0.9411765, 1,
1.003843, 0.1107365, 0.995603, 1, 0, 0.9372549, 1,
1.005473, 0.6395739, 2.924238, 1, 0, 0.9294118, 1,
1.006256, 1.004771, 0.2783264, 1, 0, 0.9254902, 1,
1.007914, 1.237691, 1.465466, 1, 0, 0.9176471, 1,
1.01104, 0.8077802, 1.751296, 1, 0, 0.9137255, 1,
1.019254, 1.758242, 0.3155651, 1, 0, 0.9058824, 1,
1.020792, -0.7251536, 1.098506, 1, 0, 0.9019608, 1,
1.036227, -0.6357494, 1.733406, 1, 0, 0.8941177, 1,
1.042332, -0.1255545, 0.4027091, 1, 0, 0.8862745, 1,
1.048554, 0.01803276, 2.403642, 1, 0, 0.8823529, 1,
1.051877, -0.721568, 3.688166, 1, 0, 0.8745098, 1,
1.054066, -0.1687621, 1.913964, 1, 0, 0.8705882, 1,
1.058175, 0.5437177, 1.239835, 1, 0, 0.8627451, 1,
1.060754, 1.046131, 1.253797, 1, 0, 0.8588235, 1,
1.072552, -0.6638159, 1.230252, 1, 0, 0.8509804, 1,
1.073336, 0.4235528, -0.6677196, 1, 0, 0.8470588, 1,
1.073773, 0.3191549, 1.269992, 1, 0, 0.8392157, 1,
1.077051, 2.963342, 0.656524, 1, 0, 0.8352941, 1,
1.085106, 1.302287, 0.8251477, 1, 0, 0.827451, 1,
1.092324, 1.146437, 0.7545407, 1, 0, 0.8235294, 1,
1.110505, -0.521149, 2.497822, 1, 0, 0.8156863, 1,
1.116287, -0.6266026, 2.112561, 1, 0, 0.8117647, 1,
1.121582, -1.368343, 2.155988, 1, 0, 0.8039216, 1,
1.125519, -0.2885682, 1.019072, 1, 0, 0.7960784, 1,
1.136653, -0.443996, 2.692163, 1, 0, 0.7921569, 1,
1.13801, -0.8684028, 2.128818, 1, 0, 0.7843137, 1,
1.139948, -0.4284875, 2.082762, 1, 0, 0.7803922, 1,
1.143904, 0.4491266, 0.1238514, 1, 0, 0.772549, 1,
1.147065, 0.8690504, 0.1659687, 1, 0, 0.7686275, 1,
1.148063, 1.757937, -0.5488621, 1, 0, 0.7607843, 1,
1.151879, -0.2095321, 1.83077, 1, 0, 0.7568628, 1,
1.158168, -0.3435626, 1.392862, 1, 0, 0.7490196, 1,
1.167134, 0.01838863, 2.060312, 1, 0, 0.7450981, 1,
1.167376, -0.3348004, 1.973638, 1, 0, 0.7372549, 1,
1.172125, -0.6930886, 2.036851, 1, 0, 0.7333333, 1,
1.176412, 0.6553538, 2.100215, 1, 0, 0.7254902, 1,
1.18313, 0.7748944, -0.5873613, 1, 0, 0.7215686, 1,
1.185771, -0.7059944, 2.419466, 1, 0, 0.7137255, 1,
1.194745, 1.606447, 0.9785496, 1, 0, 0.7098039, 1,
1.197503, -0.7848583, 1.758706, 1, 0, 0.7019608, 1,
1.200034, -0.6329573, 2.754912, 1, 0, 0.6941177, 1,
1.200611, -0.2512269, 1.25816, 1, 0, 0.6901961, 1,
1.203887, -0.8855429, 1.710765, 1, 0, 0.682353, 1,
1.207483, -1.181248, 4.066423, 1, 0, 0.6784314, 1,
1.207799, 0.1672246, 1.987669, 1, 0, 0.6705883, 1,
1.213682, -0.9496224, 3.035493, 1, 0, 0.6666667, 1,
1.222001, 0.282404, 1.81525, 1, 0, 0.6588235, 1,
1.230531, 0.5048735, 1.156319, 1, 0, 0.654902, 1,
1.233253, 1.46379, 1.109211, 1, 0, 0.6470588, 1,
1.234706, 0.1808256, 1.679024, 1, 0, 0.6431373, 1,
1.237007, -1.205284, 2.710209, 1, 0, 0.6352941, 1,
1.237198, -1.50969, 0.1335285, 1, 0, 0.6313726, 1,
1.237934, -1.273989, 2.591359, 1, 0, 0.6235294, 1,
1.241267, 0.4000024, 0.2888422, 1, 0, 0.6196079, 1,
1.246725, 1.514881, 0.5573937, 1, 0, 0.6117647, 1,
1.251452, 0.6530041, 2.84105, 1, 0, 0.6078432, 1,
1.285971, 1.600598, 1.414829, 1, 0, 0.6, 1,
1.286975, 1.705958, -1.203038, 1, 0, 0.5921569, 1,
1.290406, 1.221754, 0.2592082, 1, 0, 0.5882353, 1,
1.296144, 0.08022195, -0.1493324, 1, 0, 0.5803922, 1,
1.300866, -1.619269, 3.026642, 1, 0, 0.5764706, 1,
1.304264, 0.03967547, 1.031695, 1, 0, 0.5686275, 1,
1.308313, 1.15031, 0.5898527, 1, 0, 0.5647059, 1,
1.314361, 1.185197, 0.9991119, 1, 0, 0.5568628, 1,
1.315845, 0.0865283, 1.461591, 1, 0, 0.5529412, 1,
1.316244, -0.9642157, 1.083001, 1, 0, 0.5450981, 1,
1.317171, 1.143441, 1.710588, 1, 0, 0.5411765, 1,
1.340442, -0.8346312, 0.9092926, 1, 0, 0.5333334, 1,
1.344817, 0.094803, 1.740368, 1, 0, 0.5294118, 1,
1.35159, 1.139237, -0.8500717, 1, 0, 0.5215687, 1,
1.355682, 0.2324508, 1.576236, 1, 0, 0.5176471, 1,
1.363759, -0.8395599, 2.817109, 1, 0, 0.509804, 1,
1.364038, 0.07884353, 0.8908231, 1, 0, 0.5058824, 1,
1.364313, -0.5794365, 1.03304, 1, 0, 0.4980392, 1,
1.378015, -1.141842, 2.054539, 1, 0, 0.4901961, 1,
1.383035, -1.368954, 2.904782, 1, 0, 0.4862745, 1,
1.383702, 0.484651, 2.186946, 1, 0, 0.4784314, 1,
1.384515, -0.5986525, 2.431499, 1, 0, 0.4745098, 1,
1.389668, -0.1791349, 0.9264589, 1, 0, 0.4666667, 1,
1.396552, 1.544657, 1.880783, 1, 0, 0.4627451, 1,
1.400404, 0.8242474, 1.108049, 1, 0, 0.454902, 1,
1.401932, 0.2437757, 2.266179, 1, 0, 0.4509804, 1,
1.416597, -1.668998, 1.983216, 1, 0, 0.4431373, 1,
1.418367, -0.07442056, 1.06906, 1, 0, 0.4392157, 1,
1.418507, 0.1376196, 2.217213, 1, 0, 0.4313726, 1,
1.422627, 1.702577, 1.157541, 1, 0, 0.427451, 1,
1.422996, 0.3017632, 3.818361, 1, 0, 0.4196078, 1,
1.435195, 0.7729637, 0.9346773, 1, 0, 0.4156863, 1,
1.44, -0.8707544, 2.620553, 1, 0, 0.4078431, 1,
1.44026, -0.4083423, 1.159519, 1, 0, 0.4039216, 1,
1.454415, 0.3501048, 1.275909, 1, 0, 0.3960784, 1,
1.46403, 0.464535, 1.086063, 1, 0, 0.3882353, 1,
1.466101, 0.4428878, 2.588646, 1, 0, 0.3843137, 1,
1.469378, 0.4713888, -0.9554963, 1, 0, 0.3764706, 1,
1.485342, -0.7571968, 2.687351, 1, 0, 0.372549, 1,
1.487461, -1.454381, 2.843137, 1, 0, 0.3647059, 1,
1.496296, -0.000992602, 2.230592, 1, 0, 0.3607843, 1,
1.525665, -1.70932, 2.44661, 1, 0, 0.3529412, 1,
1.534308, -0.8479849, 1.710145, 1, 0, 0.3490196, 1,
1.539153, -0.3376954, 2.821926, 1, 0, 0.3411765, 1,
1.547305, -0.4603185, 2.388836, 1, 0, 0.3372549, 1,
1.565364, -0.3885293, 2.911388, 1, 0, 0.3294118, 1,
1.57064, 0.2242891, -0.5630699, 1, 0, 0.3254902, 1,
1.593459, 2.24796, 1.002427, 1, 0, 0.3176471, 1,
1.612829, -0.06671404, 2.774106, 1, 0, 0.3137255, 1,
1.614816, -0.3702388, 2.272021, 1, 0, 0.3058824, 1,
1.668058, -0.9440475, 3.084244, 1, 0, 0.2980392, 1,
1.684273, 0.5984179, 0.09792235, 1, 0, 0.2941177, 1,
1.688931, 1.204469, 0.6765316, 1, 0, 0.2862745, 1,
1.697608, -1.06008, 2.47578, 1, 0, 0.282353, 1,
1.707304, -0.5551721, 3.367932, 1, 0, 0.2745098, 1,
1.710773, -0.4731211, 2.175378, 1, 0, 0.2705882, 1,
1.712973, 0.3173208, 2.629059, 1, 0, 0.2627451, 1,
1.713451, 0.568671, -0.7385151, 1, 0, 0.2588235, 1,
1.714911, 0.5516212, 0.9695901, 1, 0, 0.2509804, 1,
1.729142, 0.5221528, -0.3112222, 1, 0, 0.2470588, 1,
1.756927, 0.8398887, 0.5729656, 1, 0, 0.2392157, 1,
1.762925, 1.257603, 0.7830338, 1, 0, 0.2352941, 1,
1.769705, -1.397426, 2.734292, 1, 0, 0.227451, 1,
1.777527, -0.2920884, 2.372651, 1, 0, 0.2235294, 1,
1.801629, 0.1914612, 2.261783, 1, 0, 0.2156863, 1,
1.812185, 0.2553773, 2.433934, 1, 0, 0.2117647, 1,
1.831476, -0.297958, 2.075623, 1, 0, 0.2039216, 1,
1.862274, 0.9189795, 2.421851, 1, 0, 0.1960784, 1,
1.870411, -0.4478192, 1.025958, 1, 0, 0.1921569, 1,
1.874625, -0.655702, 1.080312, 1, 0, 0.1843137, 1,
1.877059, 1.457832, 0.1408982, 1, 0, 0.1803922, 1,
1.909782, -0.2666346, 2.599239, 1, 0, 0.172549, 1,
1.937511, -2.510201, 3.000948, 1, 0, 0.1686275, 1,
1.959892, 1.07851, 0.9652279, 1, 0, 0.1607843, 1,
1.973871, -1.79841, 1.645734, 1, 0, 0.1568628, 1,
1.998546, 2.240743, -0.4070322, 1, 0, 0.1490196, 1,
2.019258, 1.889436, 1.432308, 1, 0, 0.145098, 1,
2.097092, -0.03247832, 1.740178, 1, 0, 0.1372549, 1,
2.100545, -0.6620625, 0.8313639, 1, 0, 0.1333333, 1,
2.104477, 1.279636, 2.052376, 1, 0, 0.1254902, 1,
2.111964, -1.822618, 1.961649, 1, 0, 0.1215686, 1,
2.126274, 0.918813, 2.683218, 1, 0, 0.1137255, 1,
2.136494, -1.129271, 0.6465862, 1, 0, 0.1098039, 1,
2.200337, -0.6805145, 1.779127, 1, 0, 0.1019608, 1,
2.226819, 0.8927116, 0.2585299, 1, 0, 0.09411765, 1,
2.235663, -1.299137, 3.15641, 1, 0, 0.09019608, 1,
2.237654, 0.7392356, -0.3130935, 1, 0, 0.08235294, 1,
2.316975, 0.126876, 2.044947, 1, 0, 0.07843138, 1,
2.368016, -0.3562191, 1.725603, 1, 0, 0.07058824, 1,
2.411001, 0.002072261, 1.203607, 1, 0, 0.06666667, 1,
2.46643, 1.158828, 3.722628, 1, 0, 0.05882353, 1,
2.509043, -0.4090343, 1.763147, 1, 0, 0.05490196, 1,
2.540237, 1.354707, 1.191768, 1, 0, 0.04705882, 1,
2.591739, 0.2536876, 1.259912, 1, 0, 0.04313726, 1,
2.618118, -0.8235128, 3.490761, 1, 0, 0.03529412, 1,
2.747681, 0.233048, 1.414272, 1, 0, 0.03137255, 1,
2.75156, 2.080025, 0.9932181, 1, 0, 0.02352941, 1,
2.867114, -0.09991132, 0.5523888, 1, 0, 0.01960784, 1,
2.927174, -0.5713973, 1.074772, 1, 0, 0.01176471, 1,
3.118254, -1.026033, 1.091215, 1, 0, 0.007843138, 1
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
0.3008842, -3.964659, -6.682695, 0, -0.5, 0.5, 0.5,
0.3008842, -3.964659, -6.682695, 1, -0.5, 0.5, 0.5,
0.3008842, -3.964659, -6.682695, 1, 1.5, 0.5, 0.5,
0.3008842, -3.964659, -6.682695, 0, 1.5, 0.5, 0.5
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
-3.471574, 0.1774853, -6.682695, 0, -0.5, 0.5, 0.5,
-3.471574, 0.1774853, -6.682695, 1, -0.5, 0.5, 0.5,
-3.471574, 0.1774853, -6.682695, 1, 1.5, 0.5, 0.5,
-3.471574, 0.1774853, -6.682695, 0, 1.5, 0.5, 0.5
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
-3.471574, -3.964659, 0.1153917, 0, -0.5, 0.5, 0.5,
-3.471574, -3.964659, 0.1153917, 1, -0.5, 0.5, 0.5,
-3.471574, -3.964659, 0.1153917, 1, 1.5, 0.5, 0.5,
-3.471574, -3.964659, 0.1153917, 0, 1.5, 0.5, 0.5
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
-2, -3.00878, -5.113906,
3, -3.00878, -5.113906,
-2, -3.00878, -5.113906,
-2, -3.168093, -5.375371,
-1, -3.00878, -5.113906,
-1, -3.168093, -5.375371,
0, -3.00878, -5.113906,
0, -3.168093, -5.375371,
1, -3.00878, -5.113906,
1, -3.168093, -5.375371,
2, -3.00878, -5.113906,
2, -3.168093, -5.375371,
3, -3.00878, -5.113906,
3, -3.168093, -5.375371
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
-2, -3.48672, -5.898301, 0, -0.5, 0.5, 0.5,
-2, -3.48672, -5.898301, 1, -0.5, 0.5, 0.5,
-2, -3.48672, -5.898301, 1, 1.5, 0.5, 0.5,
-2, -3.48672, -5.898301, 0, 1.5, 0.5, 0.5,
-1, -3.48672, -5.898301, 0, -0.5, 0.5, 0.5,
-1, -3.48672, -5.898301, 1, -0.5, 0.5, 0.5,
-1, -3.48672, -5.898301, 1, 1.5, 0.5, 0.5,
-1, -3.48672, -5.898301, 0, 1.5, 0.5, 0.5,
0, -3.48672, -5.898301, 0, -0.5, 0.5, 0.5,
0, -3.48672, -5.898301, 1, -0.5, 0.5, 0.5,
0, -3.48672, -5.898301, 1, 1.5, 0.5, 0.5,
0, -3.48672, -5.898301, 0, 1.5, 0.5, 0.5,
1, -3.48672, -5.898301, 0, -0.5, 0.5, 0.5,
1, -3.48672, -5.898301, 1, -0.5, 0.5, 0.5,
1, -3.48672, -5.898301, 1, 1.5, 0.5, 0.5,
1, -3.48672, -5.898301, 0, 1.5, 0.5, 0.5,
2, -3.48672, -5.898301, 0, -0.5, 0.5, 0.5,
2, -3.48672, -5.898301, 1, -0.5, 0.5, 0.5,
2, -3.48672, -5.898301, 1, 1.5, 0.5, 0.5,
2, -3.48672, -5.898301, 0, 1.5, 0.5, 0.5,
3, -3.48672, -5.898301, 0, -0.5, 0.5, 0.5,
3, -3.48672, -5.898301, 1, -0.5, 0.5, 0.5,
3, -3.48672, -5.898301, 1, 1.5, 0.5, 0.5,
3, -3.48672, -5.898301, 0, 1.5, 0.5, 0.5
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
-2.601007, -2, -5.113906,
-2.601007, 3, -5.113906,
-2.601007, -2, -5.113906,
-2.746102, -2, -5.375371,
-2.601007, -1, -5.113906,
-2.746102, -1, -5.375371,
-2.601007, 0, -5.113906,
-2.746102, 0, -5.375371,
-2.601007, 1, -5.113906,
-2.746102, 1, -5.375371,
-2.601007, 2, -5.113906,
-2.746102, 2, -5.375371,
-2.601007, 3, -5.113906,
-2.746102, 3, -5.375371
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
-3.036291, -2, -5.898301, 0, -0.5, 0.5, 0.5,
-3.036291, -2, -5.898301, 1, -0.5, 0.5, 0.5,
-3.036291, -2, -5.898301, 1, 1.5, 0.5, 0.5,
-3.036291, -2, -5.898301, 0, 1.5, 0.5, 0.5,
-3.036291, -1, -5.898301, 0, -0.5, 0.5, 0.5,
-3.036291, -1, -5.898301, 1, -0.5, 0.5, 0.5,
-3.036291, -1, -5.898301, 1, 1.5, 0.5, 0.5,
-3.036291, -1, -5.898301, 0, 1.5, 0.5, 0.5,
-3.036291, 0, -5.898301, 0, -0.5, 0.5, 0.5,
-3.036291, 0, -5.898301, 1, -0.5, 0.5, 0.5,
-3.036291, 0, -5.898301, 1, 1.5, 0.5, 0.5,
-3.036291, 0, -5.898301, 0, 1.5, 0.5, 0.5,
-3.036291, 1, -5.898301, 0, -0.5, 0.5, 0.5,
-3.036291, 1, -5.898301, 1, -0.5, 0.5, 0.5,
-3.036291, 1, -5.898301, 1, 1.5, 0.5, 0.5,
-3.036291, 1, -5.898301, 0, 1.5, 0.5, 0.5,
-3.036291, 2, -5.898301, 0, -0.5, 0.5, 0.5,
-3.036291, 2, -5.898301, 1, -0.5, 0.5, 0.5,
-3.036291, 2, -5.898301, 1, 1.5, 0.5, 0.5,
-3.036291, 2, -5.898301, 0, 1.5, 0.5, 0.5,
-3.036291, 3, -5.898301, 0, -0.5, 0.5, 0.5,
-3.036291, 3, -5.898301, 1, -0.5, 0.5, 0.5,
-3.036291, 3, -5.898301, 1, 1.5, 0.5, 0.5,
-3.036291, 3, -5.898301, 0, 1.5, 0.5, 0.5
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
-2.601007, -3.00878, -4,
-2.601007, -3.00878, 4,
-2.601007, -3.00878, -4,
-2.746102, -3.168093, -4,
-2.601007, -3.00878, -2,
-2.746102, -3.168093, -2,
-2.601007, -3.00878, 0,
-2.746102, -3.168093, 0,
-2.601007, -3.00878, 2,
-2.746102, -3.168093, 2,
-2.601007, -3.00878, 4,
-2.746102, -3.168093, 4
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
-3.036291, -3.48672, -4, 0, -0.5, 0.5, 0.5,
-3.036291, -3.48672, -4, 1, -0.5, 0.5, 0.5,
-3.036291, -3.48672, -4, 1, 1.5, 0.5, 0.5,
-3.036291, -3.48672, -4, 0, 1.5, 0.5, 0.5,
-3.036291, -3.48672, -2, 0, -0.5, 0.5, 0.5,
-3.036291, -3.48672, -2, 1, -0.5, 0.5, 0.5,
-3.036291, -3.48672, -2, 1, 1.5, 0.5, 0.5,
-3.036291, -3.48672, -2, 0, 1.5, 0.5, 0.5,
-3.036291, -3.48672, 0, 0, -0.5, 0.5, 0.5,
-3.036291, -3.48672, 0, 1, -0.5, 0.5, 0.5,
-3.036291, -3.48672, 0, 1, 1.5, 0.5, 0.5,
-3.036291, -3.48672, 0, 0, 1.5, 0.5, 0.5,
-3.036291, -3.48672, 2, 0, -0.5, 0.5, 0.5,
-3.036291, -3.48672, 2, 1, -0.5, 0.5, 0.5,
-3.036291, -3.48672, 2, 1, 1.5, 0.5, 0.5,
-3.036291, -3.48672, 2, 0, 1.5, 0.5, 0.5,
-3.036291, -3.48672, 4, 0, -0.5, 0.5, 0.5,
-3.036291, -3.48672, 4, 1, -0.5, 0.5, 0.5,
-3.036291, -3.48672, 4, 1, 1.5, 0.5, 0.5,
-3.036291, -3.48672, 4, 0, 1.5, 0.5, 0.5
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
-2.601007, -3.00878, -5.113906,
-2.601007, 3.363751, -5.113906,
-2.601007, -3.00878, 5.344689,
-2.601007, 3.363751, 5.344689,
-2.601007, -3.00878, -5.113906,
-2.601007, -3.00878, 5.344689,
-2.601007, 3.363751, -5.113906,
-2.601007, 3.363751, 5.344689,
-2.601007, -3.00878, -5.113906,
3.202775, -3.00878, -5.113906,
-2.601007, -3.00878, 5.344689,
3.202775, -3.00878, 5.344689,
-2.601007, 3.363751, -5.113906,
3.202775, 3.363751, -5.113906,
-2.601007, 3.363751, 5.344689,
3.202775, 3.363751, 5.344689,
3.202775, -3.00878, -5.113906,
3.202775, 3.363751, -5.113906,
3.202775, -3.00878, 5.344689,
3.202775, 3.363751, 5.344689,
3.202775, -3.00878, -5.113906,
3.202775, -3.00878, 5.344689,
3.202775, 3.363751, -5.113906,
3.202775, 3.363751, 5.344689
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
var radius = 7.236871;
var distance = 32.19765;
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
mvMatrix.translate( -0.3008842, -0.1774853, -0.1153917 );
mvMatrix.scale( 1.348198, 1.227871, 0.7481546 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.19765);
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
m-phenoxybenzyl_alco<-read.table("m-phenoxybenzyl_alco.xyz")
```

```
## Error in read.table("m-phenoxybenzyl_alco.xyz"): no lines available in input
```

```r
x<-m-phenoxybenzyl_alco$V2
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
```

```r
y<-m-phenoxybenzyl_alco$V3
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
```

```r
z<-m-phenoxybenzyl_alco$V4
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
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
-2.516486, 0.07407647, 0.04412607, 0, 0, 1, 1, 1,
-2.431914, 0.7647903, -1.882408, 1, 0, 0, 1, 1,
-2.365287, -0.9306483, -3.311914, 1, 0, 0, 1, 1,
-2.349315, 0.9626417, -3.763889, 1, 0, 0, 1, 1,
-2.328149, -0.04702985, -1.597643, 1, 0, 0, 1, 1,
-2.206432, -0.1353085, -2.855573, 1, 0, 0, 1, 1,
-2.179169, -0.2296994, -2.66202, 0, 0, 0, 1, 1,
-2.153488, -1.676523, -2.555013, 0, 0, 0, 1, 1,
-2.140629, 0.345484, -1.858305, 0, 0, 0, 1, 1,
-2.11177, 0.4017244, -1.159387, 0, 0, 0, 1, 1,
-2.096699, -0.06191709, -3.456169, 0, 0, 0, 1, 1,
-2.027669, -1.493829, -1.153914, 0, 0, 0, 1, 1,
-2.015452, 0.9026914, 0.7115831, 0, 0, 0, 1, 1,
-2.015296, -0.5904147, -1.454303, 1, 1, 1, 1, 1,
-2.010055, 0.07618356, -1.427694, 1, 1, 1, 1, 1,
-1.989211, 0.9942208, -1.688324, 1, 1, 1, 1, 1,
-1.96832, 0.5953111, -1.952933, 1, 1, 1, 1, 1,
-1.960978, -0.479567, -1.375291, 1, 1, 1, 1, 1,
-1.946143, 0.009997197, -1.280304, 1, 1, 1, 1, 1,
-1.934357, 0.7840878, -0.5832484, 1, 1, 1, 1, 1,
-1.931171, 0.4214039, -2.139246, 1, 1, 1, 1, 1,
-1.928849, 0.8886882, -1.176673, 1, 1, 1, 1, 1,
-1.925743, 0.7055939, -0.9595686, 1, 1, 1, 1, 1,
-1.918048, -1.684523, -2.146167, 1, 1, 1, 1, 1,
-1.915637, -1.14944, -1.546983, 1, 1, 1, 1, 1,
-1.89354, 1.460142, -2.138397, 1, 1, 1, 1, 1,
-1.882285, -0.9124001, -2.245116, 1, 1, 1, 1, 1,
-1.878347, 0.8303441, -0.3225064, 1, 1, 1, 1, 1,
-1.860447, -0.6334751, -0.1688182, 0, 0, 1, 1, 1,
-1.836816, 3.270947, -0.1918078, 1, 0, 0, 1, 1,
-1.827658, -0.9680652, -1.237242, 1, 0, 0, 1, 1,
-1.774651, 0.9781371, -0.7838235, 1, 0, 0, 1, 1,
-1.765867, -0.2817971, -0.06032246, 1, 0, 0, 1, 1,
-1.743517, -0.9364747, -2.27035, 1, 0, 0, 1, 1,
-1.741102, -0.4738238, -2.882186, 0, 0, 0, 1, 1,
-1.734932, 0.7950887, 0.1941838, 0, 0, 0, 1, 1,
-1.720951, -0.4224787, -1.857147, 0, 0, 0, 1, 1,
-1.716005, 1.766413, -0.2478625, 0, 0, 0, 1, 1,
-1.710932, 1.046977, -2.159345, 0, 0, 0, 1, 1,
-1.694138, 1.302898, 0.6356345, 0, 0, 0, 1, 1,
-1.68411, -1.246379, -3.192656, 0, 0, 0, 1, 1,
-1.675857, -1.377667, -2.244445, 1, 1, 1, 1, 1,
-1.661837, 0.8649553, -0.9643556, 1, 1, 1, 1, 1,
-1.653401, -0.1694128, -1.058816, 1, 1, 1, 1, 1,
-1.64529, -1.551651, -0.02838699, 1, 1, 1, 1, 1,
-1.636534, 0.7243928, -3.512023, 1, 1, 1, 1, 1,
-1.614744, 2.134612, -0.01621901, 1, 1, 1, 1, 1,
-1.610821, -1.045421, -3.861757, 1, 1, 1, 1, 1,
-1.596587, -0.1915225, -0.4509362, 1, 1, 1, 1, 1,
-1.586597, -0.6592988, -4.961596, 1, 1, 1, 1, 1,
-1.582278, 1.150755, -2.544666, 1, 1, 1, 1, 1,
-1.563926, -1.505585, -2.179625, 1, 1, 1, 1, 1,
-1.55324, 0.2111445, -1.984717, 1, 1, 1, 1, 1,
-1.535757, -0.02800865, -1.594361, 1, 1, 1, 1, 1,
-1.535324, 0.3934587, -1.813759, 1, 1, 1, 1, 1,
-1.513063, 0.2109401, 0.7574708, 1, 1, 1, 1, 1,
-1.51088, 0.6925133, 0.3204761, 0, 0, 1, 1, 1,
-1.508424, -0.6163324, -2.007456, 1, 0, 0, 1, 1,
-1.502412, -0.779576, -1.742929, 1, 0, 0, 1, 1,
-1.489583, -0.2958586, -2.368565, 1, 0, 0, 1, 1,
-1.480621, 0.01004104, -0.3681598, 1, 0, 0, 1, 1,
-1.473025, -1.102382, -4.77073, 1, 0, 0, 1, 1,
-1.452145, 0.2421323, -1.621546, 0, 0, 0, 1, 1,
-1.44268, 0.3124572, -1.678387, 0, 0, 0, 1, 1,
-1.442169, -0.1852474, -2.606662, 0, 0, 0, 1, 1,
-1.441369, -0.6889791, -2.921097, 0, 0, 0, 1, 1,
-1.43579, 0.02749408, -2.438338, 0, 0, 0, 1, 1,
-1.435618, -0.2812833, -0.8975625, 0, 0, 0, 1, 1,
-1.433603, 0.4540663, -0.5031531, 0, 0, 0, 1, 1,
-1.429226, 1.406, -0.2033408, 1, 1, 1, 1, 1,
-1.424141, -0.4250316, -0.3372874, 1, 1, 1, 1, 1,
-1.422056, -0.6694666, -2.931289, 1, 1, 1, 1, 1,
-1.417823, -0.04520699, -2.449177, 1, 1, 1, 1, 1,
-1.396827, -2.341119, -1.409809, 1, 1, 1, 1, 1,
-1.394263, -1.440518, -3.741035, 1, 1, 1, 1, 1,
-1.364011, 1.596751, -0.4779792, 1, 1, 1, 1, 1,
-1.345293, -1.68823, -1.50002, 1, 1, 1, 1, 1,
-1.341649, 0.6112441, -1.733499, 1, 1, 1, 1, 1,
-1.313696, -1.256286, -2.53696, 1, 1, 1, 1, 1,
-1.311602, 1.420878, -1.701551, 1, 1, 1, 1, 1,
-1.299325, -0.6485855, -1.322654, 1, 1, 1, 1, 1,
-1.290287, 0.7941131, -1.310804, 1, 1, 1, 1, 1,
-1.283577, 0.1366682, -2.358342, 1, 1, 1, 1, 1,
-1.275231, -0.4849216, -2.275721, 1, 1, 1, 1, 1,
-1.269449, 1.27239, -2.022476, 0, 0, 1, 1, 1,
-1.258617, 0.7269066, -0.3198922, 1, 0, 0, 1, 1,
-1.251911, 0.1061184, 0.9664677, 1, 0, 0, 1, 1,
-1.226474, 1.28038, -0.9583771, 1, 0, 0, 1, 1,
-1.224792, -0.03848117, -2.588212, 1, 0, 0, 1, 1,
-1.222973, -0.02434104, -0.8099121, 1, 0, 0, 1, 1,
-1.218142, 0.0006866773, -1.261491, 0, 0, 0, 1, 1,
-1.212579, 1.011679, 0.5231184, 0, 0, 0, 1, 1,
-1.211927, 0.20284, -2.148434, 0, 0, 0, 1, 1,
-1.208796, 0.674145, 0.1442734, 0, 0, 0, 1, 1,
-1.203538, -0.2359765, -2.289962, 0, 0, 0, 1, 1,
-1.197774, -0.4946286, -2.712583, 0, 0, 0, 1, 1,
-1.194721, -0.1896119, -1.925385, 0, 0, 0, 1, 1,
-1.190768, -0.8860984, -2.737639, 1, 1, 1, 1, 1,
-1.188336, 0.800606, -2.518656, 1, 1, 1, 1, 1,
-1.171391, 0.04818029, -0.570111, 1, 1, 1, 1, 1,
-1.169673, 0.3262529, -0.6610957, 1, 1, 1, 1, 1,
-1.167054, -0.8113069, -2.404541, 1, 1, 1, 1, 1,
-1.164229, -2.468364, -1.710601, 1, 1, 1, 1, 1,
-1.162801, 0.3938755, -1.291916, 1, 1, 1, 1, 1,
-1.16192, -0.9753091, -0.08326782, 1, 1, 1, 1, 1,
-1.15553, -1.172864, -4.473916, 1, 1, 1, 1, 1,
-1.154858, 0.8266345, -0.6286471, 1, 1, 1, 1, 1,
-1.152793, 0.2096218, -3.019879, 1, 1, 1, 1, 1,
-1.148451, 0.1999775, -1.949002, 1, 1, 1, 1, 1,
-1.136274, -2.676487, -1.849491, 1, 1, 1, 1, 1,
-1.133528, -0.04995098, -1.992653, 1, 1, 1, 1, 1,
-1.127294, -0.223722, -2.458349, 1, 1, 1, 1, 1,
-1.124944, 0.1100556, -0.4467323, 0, 0, 1, 1, 1,
-1.117014, -1.364716, -3.573897, 1, 0, 0, 1, 1,
-1.112947, 0.036918, -1.445584, 1, 0, 0, 1, 1,
-1.112915, 1.08602, -1.070068, 1, 0, 0, 1, 1,
-1.102684, -1.057408, -2.007167, 1, 0, 0, 1, 1,
-1.095676, 1.049475, -0.1158703, 1, 0, 0, 1, 1,
-1.091798, -0.3117979, -2.683676, 0, 0, 0, 1, 1,
-1.084829, -1.303369, -2.786989, 0, 0, 0, 1, 1,
-1.083314, -0.1025378, -1.513957, 0, 0, 0, 1, 1,
-1.082633, 1.405214, -1.532078, 0, 0, 0, 1, 1,
-1.073437, -0.9730904, -3.262033, 0, 0, 0, 1, 1,
-1.07205, 0.5220293, -1.383629, 0, 0, 0, 1, 1,
-1.071794, -0.7361008, -0.1622646, 0, 0, 0, 1, 1,
-1.064609, 2.212102, -0.5689091, 1, 1, 1, 1, 1,
-1.06363, -0.7432746, -0.753963, 1, 1, 1, 1, 1,
-1.061405, 0.9298373, -0.9208158, 1, 1, 1, 1, 1,
-1.058419, 0.5881112, -0.3889614, 1, 1, 1, 1, 1,
-1.055018, -1.826505, -2.843338, 1, 1, 1, 1, 1,
-1.051223, 2.08661, 0.4615816, 1, 1, 1, 1, 1,
-1.04734, -0.2136488, -4.151532, 1, 1, 1, 1, 1,
-1.04449, -0.1555075, -1.149459, 1, 1, 1, 1, 1,
-1.031732, -1.393857, -2.635425, 1, 1, 1, 1, 1,
-1.028083, -0.543957, -3.523455, 1, 1, 1, 1, 1,
-1.016174, -0.4177683, -1.526466, 1, 1, 1, 1, 1,
-1.012962, 1.490054, 0.616528, 1, 1, 1, 1, 1,
-1.001139, -0.6474773, -2.708912, 1, 1, 1, 1, 1,
-1.00096, 0.4945976, -3.445682, 1, 1, 1, 1, 1,
-1.000161, 0.9498147, -0.5516282, 1, 1, 1, 1, 1,
-0.9976165, -0.9262152, -3.91781, 0, 0, 1, 1, 1,
-0.9962999, -1.842978, -2.866214, 1, 0, 0, 1, 1,
-0.9895715, -0.3508206, -1.359329, 1, 0, 0, 1, 1,
-0.9887038, 1.142166, -0.1372799, 1, 0, 0, 1, 1,
-0.9827425, -1.2727, -2.361202, 1, 0, 0, 1, 1,
-0.9808564, -1.513871, -4.248367, 1, 0, 0, 1, 1,
-0.9806402, 0.7711914, -1.745802, 0, 0, 0, 1, 1,
-0.9796002, -1.522074, -2.109245, 0, 0, 0, 1, 1,
-0.9714014, -0.2053041, -2.082158, 0, 0, 0, 1, 1,
-0.9702642, 0.4385662, -0.8738521, 0, 0, 0, 1, 1,
-0.9574397, -1.809419, -4.618388, 0, 0, 0, 1, 1,
-0.9572392, 0.5351876, -0.9001558, 0, 0, 0, 1, 1,
-0.9535558, 0.240949, -0.2328903, 0, 0, 0, 1, 1,
-0.9499824, 0.3018314, -1.076227, 1, 1, 1, 1, 1,
-0.9459307, -1.605706, -2.958411, 1, 1, 1, 1, 1,
-0.9455645, -0.3176025, -0.8606854, 1, 1, 1, 1, 1,
-0.9406503, 3.133368, 1.682259, 1, 1, 1, 1, 1,
-0.9394572, 1.364765, 0.5372827, 1, 1, 1, 1, 1,
-0.938775, -1.278702, -1.727813, 1, 1, 1, 1, 1,
-0.9385644, -0.7015464, -0.7487078, 1, 1, 1, 1, 1,
-0.9296334, 0.1802657, -1.508791, 1, 1, 1, 1, 1,
-0.9262217, -0.439792, -0.8502561, 1, 1, 1, 1, 1,
-0.9169233, -0.6124139, -1.050186, 1, 1, 1, 1, 1,
-0.9153239, 0.1345815, -1.003259, 1, 1, 1, 1, 1,
-0.9145216, -1.031839, -1.676972, 1, 1, 1, 1, 1,
-0.9102907, -1.568849, -4.366733, 1, 1, 1, 1, 1,
-0.9090614, 1.537093, 0.7659577, 1, 1, 1, 1, 1,
-0.9026287, -0.1858579, -1.908078, 1, 1, 1, 1, 1,
-0.901592, -0.4602488, -2.408647, 0, 0, 1, 1, 1,
-0.899656, -1.011409, -2.0104, 1, 0, 0, 1, 1,
-0.898365, 0.1188401, -0.8491407, 1, 0, 0, 1, 1,
-0.8936163, 0.2364965, -0.2279658, 1, 0, 0, 1, 1,
-0.8910695, 1.385825, 0.8003805, 1, 0, 0, 1, 1,
-0.8903375, 0.9716023, 0.6280856, 1, 0, 0, 1, 1,
-0.8861901, -0.819422, -1.026452, 0, 0, 0, 1, 1,
-0.879353, 0.364078, -1.799378, 0, 0, 0, 1, 1,
-0.8775335, 0.2248954, -0.1545579, 0, 0, 0, 1, 1,
-0.8766724, 0.7381421, -1.21991, 0, 0, 0, 1, 1,
-0.8756723, -0.3672452, -2.486328, 0, 0, 0, 1, 1,
-0.875373, 1.165849, -1.62778, 0, 0, 0, 1, 1,
-0.8752519, -1.010017, -1.949301, 0, 0, 0, 1, 1,
-0.8683835, 0.4781882, -3.181548, 1, 1, 1, 1, 1,
-0.8666044, -0.2797533, -0.843925, 1, 1, 1, 1, 1,
-0.8610059, -0.303317, -1.361297, 1, 1, 1, 1, 1,
-0.8609823, -0.671653, -2.644244, 1, 1, 1, 1, 1,
-0.8554609, 0.3162742, -0.5492342, 1, 1, 1, 1, 1,
-0.8521586, -0.8715659, -2.494175, 1, 1, 1, 1, 1,
-0.8452728, -0.6034675, -3.006933, 1, 1, 1, 1, 1,
-0.8387898, 0.1659816, -2.903023, 1, 1, 1, 1, 1,
-0.8373863, 0.0981745, -2.184106, 1, 1, 1, 1, 1,
-0.8321708, -1.252799, -4.505672, 1, 1, 1, 1, 1,
-0.8218477, -1.972083, -4.836594, 1, 1, 1, 1, 1,
-0.821125, -0.8561687, -2.671045, 1, 1, 1, 1, 1,
-0.8156409, -0.1926358, -3.066752, 1, 1, 1, 1, 1,
-0.8150204, 0.2380489, -2.055529, 1, 1, 1, 1, 1,
-0.8139502, -2.915976, -1.618475, 1, 1, 1, 1, 1,
-0.8106871, -0.2675722, -2.372237, 0, 0, 1, 1, 1,
-0.8038651, 0.8126581, -0.3962331, 1, 0, 0, 1, 1,
-0.8031613, 0.4371172, -0.917248, 1, 0, 0, 1, 1,
-0.8025906, 1.70779, 0.4915287, 1, 0, 0, 1, 1,
-0.8010329, 0.3106968, 1.161161, 1, 0, 0, 1, 1,
-0.8003368, 0.8824559, -0.2609634, 1, 0, 0, 1, 1,
-0.7937167, 1.255611, -2.031564, 0, 0, 0, 1, 1,
-0.7920938, 0.2610036, -2.475923, 0, 0, 0, 1, 1,
-0.7872659, -0.4269462, -2.43973, 0, 0, 0, 1, 1,
-0.783966, 0.3771027, -1.063462, 0, 0, 0, 1, 1,
-0.7827362, 1.085036, -1.00979, 0, 0, 0, 1, 1,
-0.7827033, -1.312907, -2.447159, 0, 0, 0, 1, 1,
-0.7771377, -0.5417047, -2.280958, 0, 0, 0, 1, 1,
-0.7738775, -1.179833, -1.161765, 1, 1, 1, 1, 1,
-0.767508, -1.532019, -3.304297, 1, 1, 1, 1, 1,
-0.7668911, -2.054899, -3.067904, 1, 1, 1, 1, 1,
-0.7655831, -0.2475146, -2.715205, 1, 1, 1, 1, 1,
-0.7638296, 2.573702, -1.174533, 1, 1, 1, 1, 1,
-0.761771, -1.370183, -2.983212, 1, 1, 1, 1, 1,
-0.7422161, -1.124677, -2.916555, 1, 1, 1, 1, 1,
-0.740617, -1.640026, -3.085675, 1, 1, 1, 1, 1,
-0.7369717, 0.3950728, -1.401488, 1, 1, 1, 1, 1,
-0.7365648, 0.7160124, 1.31168, 1, 1, 1, 1, 1,
-0.7356912, 1.196114, -0.5156049, 1, 1, 1, 1, 1,
-0.7328017, 0.3836929, -2.994588, 1, 1, 1, 1, 1,
-0.7314063, -0.2080741, -3.018623, 1, 1, 1, 1, 1,
-0.7281135, -0.3062714, -2.834171, 1, 1, 1, 1, 1,
-0.7218468, -0.1330695, -1.618776, 1, 1, 1, 1, 1,
-0.7150725, -0.1973672, -1.380438, 0, 0, 1, 1, 1,
-0.7117932, -1.748364, -3.923429, 1, 0, 0, 1, 1,
-0.7076324, -0.5947847, -2.407892, 1, 0, 0, 1, 1,
-0.703502, -0.374497, -1.051259, 1, 0, 0, 1, 1,
-0.6984479, -0.5880843, -2.819297, 1, 0, 0, 1, 1,
-0.6973844, -0.7511231, -2.840785, 1, 0, 0, 1, 1,
-0.6964477, -1.14933, -0.9619049, 0, 0, 0, 1, 1,
-0.6957413, -1.491785, -3.192018, 0, 0, 0, 1, 1,
-0.6845779, -0.8519704, -1.349857, 0, 0, 0, 1, 1,
-0.683771, -1.251038, -2.471859, 0, 0, 0, 1, 1,
-0.6816841, -1.189226, -1.282754, 0, 0, 0, 1, 1,
-0.6745372, 1.153528, 0.3808967, 0, 0, 0, 1, 1,
-0.6643854, -0.7690151, -2.288233, 0, 0, 0, 1, 1,
-0.6641759, 0.622044, -0.1006464, 1, 1, 1, 1, 1,
-0.6632189, -1.251915, -4.502132, 1, 1, 1, 1, 1,
-0.6605846, 0.1053993, -2.941291, 1, 1, 1, 1, 1,
-0.6581474, -0.2471447, -3.138232, 1, 1, 1, 1, 1,
-0.6578764, -0.2071175, -1.004518, 1, 1, 1, 1, 1,
-0.6578432, 1.632388, -1.329395, 1, 1, 1, 1, 1,
-0.6538873, -0.03213073, -2.732933, 1, 1, 1, 1, 1,
-0.6523539, 1.220339, -1.582819, 1, 1, 1, 1, 1,
-0.6493918, 0.8315144, 0.4478216, 1, 1, 1, 1, 1,
-0.6461089, 0.199279, -0.7057852, 1, 1, 1, 1, 1,
-0.6417654, -1.494136, -2.526844, 1, 1, 1, 1, 1,
-0.6396928, 0.2918627, -2.091416, 1, 1, 1, 1, 1,
-0.6344298, 1.076055, -0.5302926, 1, 1, 1, 1, 1,
-0.6335634, -0.1152052, -1.338059, 1, 1, 1, 1, 1,
-0.6270047, -0.7702942, -0.8980475, 1, 1, 1, 1, 1,
-0.625308, 0.712344, -3.517154, 0, 0, 1, 1, 1,
-0.6244431, -0.2892484, -2.053636, 1, 0, 0, 1, 1,
-0.6242849, 0.09190729, 0.6575945, 1, 0, 0, 1, 1,
-0.6194898, 0.788085, 0.4520699, 1, 0, 0, 1, 1,
-0.6109418, -1.763044, -3.511164, 1, 0, 0, 1, 1,
-0.6090592, -1.445651, -2.885363, 1, 0, 0, 1, 1,
-0.6078944, -0.6129795, -1.907323, 0, 0, 0, 1, 1,
-0.6049495, -0.464575, -0.7408318, 0, 0, 0, 1, 1,
-0.6011773, 0.4961918, -1.056247, 0, 0, 0, 1, 1,
-0.6005722, 0.03165067, -2.229869, 0, 0, 0, 1, 1,
-0.5890411, -0.05320603, -1.810305, 0, 0, 0, 1, 1,
-0.5761129, -0.7362545, -1.963624, 0, 0, 0, 1, 1,
-0.572434, 0.02652152, -0.4343722, 0, 0, 0, 1, 1,
-0.5682885, 0.08349131, -2.005653, 1, 1, 1, 1, 1,
-0.5682247, 1.643423, 0.197854, 1, 1, 1, 1, 1,
-0.5663757, 1.509977, -1.370267, 1, 1, 1, 1, 1,
-0.5620893, -0.8911508, -2.810364, 1, 1, 1, 1, 1,
-0.5614834, -0.3725961, -0.8523914, 1, 1, 1, 1, 1,
-0.5574416, -1.454217, -2.286921, 1, 1, 1, 1, 1,
-0.5522676, -0.3022869, -3.180882, 1, 1, 1, 1, 1,
-0.5490881, -1.929069, -3.084927, 1, 1, 1, 1, 1,
-0.541461, -2.195379, -3.290683, 1, 1, 1, 1, 1,
-0.5400895, -0.8264934, -2.12154, 1, 1, 1, 1, 1,
-0.5383884, -0.0764633, -2.918083, 1, 1, 1, 1, 1,
-0.5374724, -0.3255502, -2.37253, 1, 1, 1, 1, 1,
-0.5274857, 1.619265, -2.152796, 1, 1, 1, 1, 1,
-0.5261775, 2.012132, 0.009630161, 1, 1, 1, 1, 1,
-0.5216112, 0.4190431, -0.4104254, 1, 1, 1, 1, 1,
-0.5181817, -0.3698872, -3.021003, 0, 0, 1, 1, 1,
-0.5172155, -1.187282, -1.476196, 1, 0, 0, 1, 1,
-0.515122, 1.087274, 1.264035, 1, 0, 0, 1, 1,
-0.5142034, -1.111085, -0.6678716, 1, 0, 0, 1, 1,
-0.5104358, 1.202518, 0.2842619, 1, 0, 0, 1, 1,
-0.5091303, 1.450974, -1.009041, 1, 0, 0, 1, 1,
-0.5078718, 0.5114496, -1.248184, 0, 0, 0, 1, 1,
-0.5075134, -0.2623062, -2.450601, 0, 0, 0, 1, 1,
-0.5024668, 0.2049291, -0.160864, 0, 0, 0, 1, 1,
-0.4970154, -0.1637153, -2.316882, 0, 0, 0, 1, 1,
-0.4960205, 0.1335777, -1.604558, 0, 0, 0, 1, 1,
-0.4926608, -0.05122403, -2.939886, 0, 0, 0, 1, 1,
-0.4893065, -1.608147, -3.19503, 0, 0, 0, 1, 1,
-0.481665, 1.355577, -0.4731751, 1, 1, 1, 1, 1,
-0.4773933, -0.6510714, -2.049914, 1, 1, 1, 1, 1,
-0.4772184, 1.969954, -1.253927, 1, 1, 1, 1, 1,
-0.4730451, -1.115385, -4.222188, 1, 1, 1, 1, 1,
-0.4717565, -0.8033102, -2.195371, 1, 1, 1, 1, 1,
-0.4691918, -1.626545, -4.284746, 1, 1, 1, 1, 1,
-0.4661666, -0.7266282, -2.436852, 1, 1, 1, 1, 1,
-0.4642682, -0.03845188, -1.000129, 1, 1, 1, 1, 1,
-0.4608714, -0.0008772762, -1.276007, 1, 1, 1, 1, 1,
-0.4580615, -0.9904851, -2.203822, 1, 1, 1, 1, 1,
-0.4550289, 0.1012752, -2.902289, 1, 1, 1, 1, 1,
-0.4536997, 0.3051019, -0.6242352, 1, 1, 1, 1, 1,
-0.4487832, -0.4755195, -2.506663, 1, 1, 1, 1, 1,
-0.446008, 0.01060236, -3.445725, 1, 1, 1, 1, 1,
-0.4439943, 0.6538324, 0.6832222, 1, 1, 1, 1, 1,
-0.442876, -0.5297365, -2.909395, 0, 0, 1, 1, 1,
-0.4426427, -1.790739, -4.497581, 1, 0, 0, 1, 1,
-0.4418423, -0.1540287, -2.045391, 1, 0, 0, 1, 1,
-0.4400614, 0.3408755, -0.3004702, 1, 0, 0, 1, 1,
-0.436704, -1.775181, -2.721029, 1, 0, 0, 1, 1,
-0.4367034, -2.429301, -2.815289, 1, 0, 0, 1, 1,
-0.4341323, -1.292338, -1.906127, 0, 0, 0, 1, 1,
-0.4337531, -0.7884505, -2.079184, 0, 0, 0, 1, 1,
-0.4314075, 0.6110576, 0.3920742, 0, 0, 0, 1, 1,
-0.4274171, 0.06344812, -1.627078, 0, 0, 0, 1, 1,
-0.4211046, 0.01393097, -1.725958, 0, 0, 0, 1, 1,
-0.4199293, -1.704808, -2.68654, 0, 0, 0, 1, 1,
-0.4179715, 0.6865438, 0.4476162, 0, 0, 0, 1, 1,
-0.4161289, -1.305254, -1.812403, 1, 1, 1, 1, 1,
-0.4161131, 0.4579434, 1.000182, 1, 1, 1, 1, 1,
-0.4142287, -0.008901532, -1.141919, 1, 1, 1, 1, 1,
-0.406702, -0.1441526, -2.035038, 1, 1, 1, 1, 1,
-0.4061382, 1.488124, -1.552868, 1, 1, 1, 1, 1,
-0.4061368, -1.80101, -2.128407, 1, 1, 1, 1, 1,
-0.4036291, 1.599005, -0.9162497, 1, 1, 1, 1, 1,
-0.4026948, -0.1621062, -0.8775237, 1, 1, 1, 1, 1,
-0.4019066, 0.4327111, -1.666348, 1, 1, 1, 1, 1,
-0.400727, -0.5890228, -1.997819, 1, 1, 1, 1, 1,
-0.4003682, 0.303324, -0.3618654, 1, 1, 1, 1, 1,
-0.4002369, 0.2566732, 0.05472443, 1, 1, 1, 1, 1,
-0.398272, 1.557352, -1.097967, 1, 1, 1, 1, 1,
-0.3971062, 0.9073036, 1.696943, 1, 1, 1, 1, 1,
-0.3914051, 0.1112767, -2.252997, 1, 1, 1, 1, 1,
-0.3913584, 0.8876977, -1.023867, 0, 0, 1, 1, 1,
-0.39122, 1.531415, 0.8991624, 1, 0, 0, 1, 1,
-0.3899999, -0.5847389, -1.494704, 1, 0, 0, 1, 1,
-0.3899802, -0.9627001, -2.551301, 1, 0, 0, 1, 1,
-0.3889413, -0.494612, -2.617063, 1, 0, 0, 1, 1,
-0.3886431, -0.335395, -2.547755, 1, 0, 0, 1, 1,
-0.3880093, 1.525996, -1.795791, 0, 0, 0, 1, 1,
-0.3874826, -0.09816105, -2.545299, 0, 0, 0, 1, 1,
-0.3870015, 0.6313561, -1.138622, 0, 0, 0, 1, 1,
-0.3868999, -0.05022231, -0.7903093, 0, 0, 0, 1, 1,
-0.3822446, -0.7542844, -3.903497, 0, 0, 0, 1, 1,
-0.3820568, -0.08601429, -0.8235993, 0, 0, 0, 1, 1,
-0.379724, -1.429726, -3.177458, 0, 0, 0, 1, 1,
-0.377789, 0.7059361, 0.1223051, 1, 1, 1, 1, 1,
-0.3777663, 0.06075902, 0.4658122, 1, 1, 1, 1, 1,
-0.3762353, -0.884443, -3.950619, 1, 1, 1, 1, 1,
-0.3724509, 0.2457436, -1.039075, 1, 1, 1, 1, 1,
-0.3711087, -0.07605469, -0.5820718, 1, 1, 1, 1, 1,
-0.3708167, 0.6433665, -1.768144, 1, 1, 1, 1, 1,
-0.3706583, 0.9124104, 0.1985971, 1, 1, 1, 1, 1,
-0.3641645, -0.5381166, -3.095214, 1, 1, 1, 1, 1,
-0.3609725, -1.65124, -4.359705, 1, 1, 1, 1, 1,
-0.3536935, 0.4156243, -0.618966, 1, 1, 1, 1, 1,
-0.3511488, 0.08598116, -0.8657673, 1, 1, 1, 1, 1,
-0.350929, -1.019966, -1.477961, 1, 1, 1, 1, 1,
-0.3372105, -1.452355, -2.024735, 1, 1, 1, 1, 1,
-0.3359716, 0.458728, -1.845737, 1, 1, 1, 1, 1,
-0.3356257, 0.3992717, -0.6943641, 1, 1, 1, 1, 1,
-0.3350183, 0.6113122, -2.263003, 0, 0, 1, 1, 1,
-0.3303781, -1.76827, -2.925621, 1, 0, 0, 1, 1,
-0.3283178, -0.1770564, -2.030657, 1, 0, 0, 1, 1,
-0.3250853, -0.4151323, -3.51398, 1, 0, 0, 1, 1,
-0.3175245, -0.03703501, -2.0926, 1, 0, 0, 1, 1,
-0.3173156, -0.00566243, -0.1972637, 1, 0, 0, 1, 1,
-0.3130113, -0.1243184, -0.3165416, 0, 0, 0, 1, 1,
-0.3083921, -0.1282897, -2.4276, 0, 0, 0, 1, 1,
-0.3076288, 0.2654944, -1.445245, 0, 0, 0, 1, 1,
-0.3041591, 1.093329, -0.2015039, 0, 0, 0, 1, 1,
-0.2979278, -1.090143, -3.23843, 0, 0, 0, 1, 1,
-0.2939728, 1.348178, 1.570787, 0, 0, 0, 1, 1,
-0.2930899, -0.7878762, -2.52762, 0, 0, 0, 1, 1,
-0.2911379, -0.4166836, -3.421233, 1, 1, 1, 1, 1,
-0.2906346, -0.80618, -4.395791, 1, 1, 1, 1, 1,
-0.2902095, 0.9485493, -2.331485, 1, 1, 1, 1, 1,
-0.2887452, 0.2526605, -0.3070556, 1, 1, 1, 1, 1,
-0.2864799, -1.935711, -3.240173, 1, 1, 1, 1, 1,
-0.2844481, 1.192151, -1.017804, 1, 1, 1, 1, 1,
-0.2830254, -0.2933622, -3.204778, 1, 1, 1, 1, 1,
-0.2815835, -0.3447042, -3.144887, 1, 1, 1, 1, 1,
-0.2813216, -1.089183, -4.552402, 1, 1, 1, 1, 1,
-0.2805003, 1.183358, 0.7299187, 1, 1, 1, 1, 1,
-0.2732717, -1.262119, -2.252064, 1, 1, 1, 1, 1,
-0.2690292, 0.9762424, 1.449108, 1, 1, 1, 1, 1,
-0.2685284, 0.4299869, -1.106935, 1, 1, 1, 1, 1,
-0.2622989, -1.379583, -3.671199, 1, 1, 1, 1, 1,
-0.2597545, 0.3442819, -0.3960936, 1, 1, 1, 1, 1,
-0.2522818, -0.511141, -2.265335, 0, 0, 1, 1, 1,
-0.2455706, 0.3584993, -0.2731211, 1, 0, 0, 1, 1,
-0.2442162, -0.4482575, -1.241857, 1, 0, 0, 1, 1,
-0.2441917, -0.5417978, -1.304734, 1, 0, 0, 1, 1,
-0.2418244, -1.472571, -1.621119, 1, 0, 0, 1, 1,
-0.2407999, 2.132072, 0.04599436, 1, 0, 0, 1, 1,
-0.2403834, -0.2389925, -2.90252, 0, 0, 0, 1, 1,
-0.237564, -1.225526, -2.649533, 0, 0, 0, 1, 1,
-0.2363392, -0.1070519, -1.661934, 0, 0, 0, 1, 1,
-0.2363386, 2.372427, 0.8467903, 0, 0, 0, 1, 1,
-0.2243946, 0.4173283, -0.1568834, 0, 0, 0, 1, 1,
-0.222881, -0.05206387, -3.388227, 0, 0, 0, 1, 1,
-0.2199705, -0.5856479, -4.739929, 0, 0, 0, 1, 1,
-0.2183449, -0.7380856, -2.988183, 1, 1, 1, 1, 1,
-0.2156556, -0.81455, -3.787342, 1, 1, 1, 1, 1,
-0.2152372, 1.11942, -0.5544464, 1, 1, 1, 1, 1,
-0.2094661, 1.658908, -1.490814, 1, 1, 1, 1, 1,
-0.2057407, -1.529625, -2.628467, 1, 1, 1, 1, 1,
-0.2050114, 0.6132679, -0.1500928, 1, 1, 1, 1, 1,
-0.2041909, -2.390279, -2.47062, 1, 1, 1, 1, 1,
-0.2018224, -1.304497, -3.77416, 1, 1, 1, 1, 1,
-0.1995283, -1.52268, -2.918737, 1, 1, 1, 1, 1,
-0.1983106, -0.6850822, -0.9485552, 1, 1, 1, 1, 1,
-0.1972357, -1.697798, -3.604019, 1, 1, 1, 1, 1,
-0.195484, -1.180585, -1.455795, 1, 1, 1, 1, 1,
-0.1937296, -0.5350807, -1.836852, 1, 1, 1, 1, 1,
-0.1927373, 2.327812, -0.9450033, 1, 1, 1, 1, 1,
-0.1923949, 1.716753, 1.717742, 1, 1, 1, 1, 1,
-0.1848521, 0.3478676, 0.2010047, 0, 0, 1, 1, 1,
-0.1847454, -1.759429, -3.606233, 1, 0, 0, 1, 1,
-0.1843991, -0.2570574, -2.807212, 1, 0, 0, 1, 1,
-0.1812603, -0.6753948, -3.253699, 1, 0, 0, 1, 1,
-0.179785, -0.007582359, -2.740418, 1, 0, 0, 1, 1,
-0.1784352, -0.4694533, -1.329065, 1, 0, 0, 1, 1,
-0.1765916, 1.767436, -0.6247088, 0, 0, 0, 1, 1,
-0.162177, 2.060791, 0.1652804, 0, 0, 0, 1, 1,
-0.1544514, 0.8976869, -0.1023229, 0, 0, 0, 1, 1,
-0.151982, 0.6030206, 0.4130743, 0, 0, 0, 1, 1,
-0.1482284, 1.046856, -1.955229, 0, 0, 0, 1, 1,
-0.146825, 0.8099278, -0.7207898, 0, 0, 0, 1, 1,
-0.1463807, -1.480558, -3.66223, 0, 0, 0, 1, 1,
-0.1450045, 1.769561, -0.6384663, 1, 1, 1, 1, 1,
-0.1400841, 0.9293649, -0.3942288, 1, 1, 1, 1, 1,
-0.1394362, -1.313166, -2.443732, 1, 1, 1, 1, 1,
-0.1390947, 0.7730302, 0.469786, 1, 1, 1, 1, 1,
-0.1374392, -0.04706782, -0.4566837, 1, 1, 1, 1, 1,
-0.1326016, -0.6944334, -2.878862, 1, 1, 1, 1, 1,
-0.131914, 0.7790448, -0.2212257, 1, 1, 1, 1, 1,
-0.1288858, -0.1479038, -2.651073, 1, 1, 1, 1, 1,
-0.1246809, 1.852272, -1.706699, 1, 1, 1, 1, 1,
-0.123955, -0.6974976, -2.234701, 1, 1, 1, 1, 1,
-0.1225653, -1.681738, -1.23355, 1, 1, 1, 1, 1,
-0.1216856, 0.06856579, -3.224556, 1, 1, 1, 1, 1,
-0.1176911, -0.0867863, -2.219157, 1, 1, 1, 1, 1,
-0.1169705, -0.9406732, -3.193903, 1, 1, 1, 1, 1,
-0.1155303, -0.05055236, -4.263479, 1, 1, 1, 1, 1,
-0.1122412, 2.246393, 0.5472224, 0, 0, 1, 1, 1,
-0.112036, 0.7373326, 0.7307613, 1, 0, 0, 1, 1,
-0.108877, -0.8769876, -1.219848, 1, 0, 0, 1, 1,
-0.10622, -0.679204, -3.591535, 1, 0, 0, 1, 1,
-0.1041681, -1.379311, -3.261034, 1, 0, 0, 1, 1,
-0.103827, 1.069516, 0.5543777, 1, 0, 0, 1, 1,
-0.0990153, 0.09658155, -2.08865, 0, 0, 0, 1, 1,
-0.09767298, 1.002397, 0.9906683, 0, 0, 0, 1, 1,
-0.09655256, 0.9760619, 1.471557, 0, 0, 0, 1, 1,
-0.09391429, 1.144516, -0.676212, 0, 0, 0, 1, 1,
-0.08283395, 0.6094243, 0.7120163, 0, 0, 0, 1, 1,
-0.07936467, -0.9583035, -2.592398, 0, 0, 0, 1, 1,
-0.07886976, -0.9925746, -0.1595938, 0, 0, 0, 1, 1,
-0.07514231, 0.6394799, 0.3646298, 1, 1, 1, 1, 1,
-0.0738628, 1.072094, 0.3483035, 1, 1, 1, 1, 1,
-0.07187407, 2.022675, 0.3608845, 1, 1, 1, 1, 1,
-0.07053315, 0.5532396, -0.3988518, 1, 1, 1, 1, 1,
-0.07013111, -1.447597, -2.044977, 1, 1, 1, 1, 1,
-0.06793632, -0.7941216, -3.303314, 1, 1, 1, 1, 1,
-0.06241167, -0.3911358, -3.473339, 1, 1, 1, 1, 1,
-0.0609064, -0.00433847, -2.84406, 1, 1, 1, 1, 1,
-0.05916863, -0.3188788, -3.719742, 1, 1, 1, 1, 1,
-0.05815201, -0.1456034, -1.200562, 1, 1, 1, 1, 1,
-0.05755349, 0.1367126, -0.2585148, 1, 1, 1, 1, 1,
-0.05426591, -1.345454, -4.030233, 1, 1, 1, 1, 1,
-0.05138662, 0.8597351, 0.1737566, 1, 1, 1, 1, 1,
-0.05066792, 1.540331, 1.613382, 1, 1, 1, 1, 1,
-0.04962972, -0.06226712, -1.806667, 1, 1, 1, 1, 1,
-0.04850538, 1.305119, 1.358647, 0, 0, 1, 1, 1,
-0.04561486, -1.788561, -3.27796, 1, 0, 0, 1, 1,
-0.04459973, 1.457541, -0.1923163, 1, 0, 0, 1, 1,
-0.04396946, 0.1277595, 0.2342048, 1, 0, 0, 1, 1,
-0.04358974, 1.633979, -0.6388075, 1, 0, 0, 1, 1,
-0.04342437, -1.223574, -1.801809, 1, 0, 0, 1, 1,
-0.04277561, -0.09588342, -4.727317, 0, 0, 0, 1, 1,
-0.03832139, 0.7991442, 0.6559979, 0, 0, 0, 1, 1,
-0.03482029, 0.9077806, 0.2024593, 0, 0, 0, 1, 1,
-0.03258417, -0.3879918, -3.131954, 0, 0, 0, 1, 1,
-0.02604854, -0.2107375, -1.706911, 0, 0, 0, 1, 1,
-0.02255099, 0.305891, -2.471577, 0, 0, 0, 1, 1,
-0.02241192, -1.39252, -1.254677, 0, 0, 0, 1, 1,
-0.01866158, -1.182418, -2.829537, 1, 1, 1, 1, 1,
-0.01812881, 0.6812106, 1.175044, 1, 1, 1, 1, 1,
-0.01759423, -1.529235, -3.938026, 1, 1, 1, 1, 1,
-0.01616109, 0.6428471, 0.4100001, 1, 1, 1, 1, 1,
-0.01528464, -0.3720436, -3.713199, 1, 1, 1, 1, 1,
-0.01505385, 1.946003, -0.164251, 1, 1, 1, 1, 1,
-0.01331567, -1.321082, -1.775309, 1, 1, 1, 1, 1,
-0.01236328, -1.087252, -3.754077, 1, 1, 1, 1, 1,
-0.01154545, 0.7207747, -0.6600881, 1, 1, 1, 1, 1,
-0.009047707, 0.9936816, -0.3349015, 1, 1, 1, 1, 1,
-0.006201246, 0.1746116, -0.163743, 1, 1, 1, 1, 1,
-0.005997445, 0.07204439, 0.8990288, 1, 1, 1, 1, 1,
-0.001561868, -0.5591983, -2.055547, 1, 1, 1, 1, 1,
0.001756406, -1.520158, 4.70337, 1, 1, 1, 1, 1,
0.009098, 0.2883077, -0.01669465, 1, 1, 1, 1, 1,
0.01208967, 0.2612442, 2.027589, 0, 0, 1, 1, 1,
0.01366758, -0.2982793, 4.757685, 1, 0, 0, 1, 1,
0.01483444, -2.239733, 2.854075, 1, 0, 0, 1, 1,
0.01625233, -0.9712995, 3.935799, 1, 0, 0, 1, 1,
0.01663648, -0.9504575, 5.17848, 1, 0, 0, 1, 1,
0.01956866, 1.045541, -1.647388, 1, 0, 0, 1, 1,
0.02134278, 0.007683798, 1.267437, 0, 0, 0, 1, 1,
0.02266027, -0.553618, 2.047424, 0, 0, 0, 1, 1,
0.02511649, 1.67171, 0.09274581, 0, 0, 0, 1, 1,
0.02514978, 0.4981745, -1.103182, 0, 0, 0, 1, 1,
0.02630215, -0.3823877, 4.111439, 0, 0, 0, 1, 1,
0.02722374, -1.132701, 3.872823, 0, 0, 0, 1, 1,
0.03473612, -0.8263667, 4.783339, 0, 0, 0, 1, 1,
0.03792062, -0.2937835, 2.424105, 1, 1, 1, 1, 1,
0.03923125, -0.427856, 4.437685, 1, 1, 1, 1, 1,
0.04038984, -0.9987475, 3.794549, 1, 1, 1, 1, 1,
0.04626117, 0.6762838, -0.1963286, 1, 1, 1, 1, 1,
0.04807031, -1.440035, 2.906946, 1, 1, 1, 1, 1,
0.05021499, -0.8075604, 2.890992, 1, 1, 1, 1, 1,
0.05533881, 1.310574, 0.7703155, 1, 1, 1, 1, 1,
0.05591282, -0.3483826, 3.552874, 1, 1, 1, 1, 1,
0.05763442, -0.815736, 2.713559, 1, 1, 1, 1, 1,
0.05800536, 0.3512406, -0.5744834, 1, 1, 1, 1, 1,
0.06007428, -1.361851, 3.078189, 1, 1, 1, 1, 1,
0.0618105, -0.587738, 2.089208, 1, 1, 1, 1, 1,
0.06796268, -0.8349327, 3.267543, 1, 1, 1, 1, 1,
0.07387549, -1.491631, 2.810183, 1, 1, 1, 1, 1,
0.07719281, -0.3197124, 1.847881, 1, 1, 1, 1, 1,
0.08116789, -0.2480651, 2.257667, 0, 0, 1, 1, 1,
0.0878473, 0.4207975, 1.783983, 1, 0, 0, 1, 1,
0.08802985, -1.389252, 2.780334, 1, 0, 0, 1, 1,
0.09314819, -1.387393, 2.823131, 1, 0, 0, 1, 1,
0.09472927, 0.5465478, 0.2756388, 1, 0, 0, 1, 1,
0.1032488, 0.2955367, 0.1017662, 1, 0, 0, 1, 1,
0.105276, 0.4816073, -1.209426, 0, 0, 0, 1, 1,
0.1068031, 1.121548, -0.1461668, 0, 0, 0, 1, 1,
0.1088317, 0.008030826, -0.6188039, 0, 0, 0, 1, 1,
0.1118634, -0.7400067, 2.371158, 0, 0, 0, 1, 1,
0.112343, 0.902465, -0.5711378, 0, 0, 0, 1, 1,
0.1133563, 2.023521, 0.5382418, 0, 0, 0, 1, 1,
0.1136444, -0.4429829, 1.605941, 0, 0, 0, 1, 1,
0.1154665, 0.357779, -0.217627, 1, 1, 1, 1, 1,
0.1169646, -0.4141948, 1.586689, 1, 1, 1, 1, 1,
0.1182154, 1.379217, 0.04245892, 1, 1, 1, 1, 1,
0.1271884, -1.356999, 3.315746, 1, 1, 1, 1, 1,
0.1286001, 0.5072267, 0.3126926, 1, 1, 1, 1, 1,
0.1336106, -1.202113, 4.278245, 1, 1, 1, 1, 1,
0.136583, 0.2693278, 0.8170229, 1, 1, 1, 1, 1,
0.1378383, 0.9759992, 0.5360652, 1, 1, 1, 1, 1,
0.1412192, -0.238969, 4.68914, 1, 1, 1, 1, 1,
0.1428544, 1.445772, -0.09209064, 1, 1, 1, 1, 1,
0.1442046, 1.602655, 1.926316, 1, 1, 1, 1, 1,
0.1502661, 0.6078597, -0.3592681, 1, 1, 1, 1, 1,
0.1535684, 0.6717911, 1.770595, 1, 1, 1, 1, 1,
0.1550717, 1.14081, -1.011351, 1, 1, 1, 1, 1,
0.1568197, -1.074901, 3.391773, 1, 1, 1, 1, 1,
0.1612516, 0.3143849, -0.8995733, 0, 0, 1, 1, 1,
0.1657209, 0.5299988, -0.5046052, 1, 0, 0, 1, 1,
0.1667513, 0.8837604, 1.451697, 1, 0, 0, 1, 1,
0.1738537, -1.736328, 3.357556, 1, 0, 0, 1, 1,
0.1762164, 1.488964, -0.1019752, 1, 0, 0, 1, 1,
0.1798026, -0.3124621, 3.290508, 1, 0, 0, 1, 1,
0.1848232, 1.128535, 0.527247, 0, 0, 0, 1, 1,
0.1856829, -0.0663584, 3.885791, 0, 0, 0, 1, 1,
0.1859485, 0.6286027, -0.08619843, 0, 0, 0, 1, 1,
0.1865145, 2.395248, 1.929898, 0, 0, 0, 1, 1,
0.1867493, 1.263282, -1.949287, 0, 0, 0, 1, 1,
0.1980343, 0.9912913, 0.7572653, 0, 0, 0, 1, 1,
0.198054, 0.8791166, 1.383923, 0, 0, 0, 1, 1,
0.1984204, -0.5725159, 2.47007, 1, 1, 1, 1, 1,
0.2066746, -1.146151, 1.439938, 1, 1, 1, 1, 1,
0.2110767, -0.5345721, -0.1537238, 1, 1, 1, 1, 1,
0.2117819, 1.190111, 1.384558, 1, 1, 1, 1, 1,
0.2127116, 0.04136408, 2.811208, 1, 1, 1, 1, 1,
0.2146736, 0.3798426, 0.06348899, 1, 1, 1, 1, 1,
0.2161983, -1.355271, 4.005229, 1, 1, 1, 1, 1,
0.2178852, 2.142597, 0.7568181, 1, 1, 1, 1, 1,
0.2194189, -0.1063727, 2.245938, 1, 1, 1, 1, 1,
0.219636, -1.333939, 3.397284, 1, 1, 1, 1, 1,
0.2219146, 0.7717317, -0.4845206, 1, 1, 1, 1, 1,
0.2323747, -0.1535932, 0.07881664, 1, 1, 1, 1, 1,
0.2328717, 0.07019317, 0.1257333, 1, 1, 1, 1, 1,
0.2333128, -0.5477949, 4.300229, 1, 1, 1, 1, 1,
0.2361129, -0.1587324, 3.396147, 1, 1, 1, 1, 1,
0.2422498, -1.360064, 3.080662, 0, 0, 1, 1, 1,
0.2429199, 0.9765185, 0.09903475, 1, 0, 0, 1, 1,
0.2446784, -0.2444513, 2.353576, 1, 0, 0, 1, 1,
0.2472923, 0.4721204, 1.705683, 1, 0, 0, 1, 1,
0.2482322, -0.111039, 0.3645988, 1, 0, 0, 1, 1,
0.2507525, 0.3293979, -0.4119807, 1, 0, 0, 1, 1,
0.2582957, -0.1221107, 3.149268, 0, 0, 0, 1, 1,
0.2585155, 0.7147826, 0.2457068, 0, 0, 0, 1, 1,
0.2585862, -0.7301837, 4.937085, 0, 0, 0, 1, 1,
0.2587043, 0.6783167, 0.6993621, 0, 0, 0, 1, 1,
0.2703777, -0.427411, 2.275583, 0, 0, 0, 1, 1,
0.2727453, 0.4472347, 2.107395, 0, 0, 0, 1, 1,
0.2731076, 0.3479943, 1.256634, 0, 0, 0, 1, 1,
0.2737205, -0.8569174, 3.801536, 1, 1, 1, 1, 1,
0.2772191, -0.6148198, 3.46627, 1, 1, 1, 1, 1,
0.2780687, 1.449456, 1.083661, 1, 1, 1, 1, 1,
0.2782707, -0.5750086, 2.723116, 1, 1, 1, 1, 1,
0.2786575, 0.03546659, 1.80053, 1, 1, 1, 1, 1,
0.2846954, 0.4504317, -0.07542765, 1, 1, 1, 1, 1,
0.2873258, 0.8095791, -0.400122, 1, 1, 1, 1, 1,
0.2891617, 0.1563083, 2.833902, 1, 1, 1, 1, 1,
0.2944496, 1.772811, -0.832388, 1, 1, 1, 1, 1,
0.2963401, 1.271965, 2.383095, 1, 1, 1, 1, 1,
0.2972064, -0.4543003, 3.694013, 1, 1, 1, 1, 1,
0.2991673, -0.352626, 2.026831, 1, 1, 1, 1, 1,
0.2998132, -0.6507835, 3.268332, 1, 1, 1, 1, 1,
0.3031574, 0.3266366, -0.6790811, 1, 1, 1, 1, 1,
0.304601, 0.676708, 2.165036, 1, 1, 1, 1, 1,
0.3082755, -0.2539892, 2.114637, 0, 0, 1, 1, 1,
0.3168907, -1.08389, 2.626946, 1, 0, 0, 1, 1,
0.3184578, 1.779863, -1.482773, 1, 0, 0, 1, 1,
0.3188056, -1.173338, 2.160112, 1, 0, 0, 1, 1,
0.3190663, 0.4258439, 0.8640554, 1, 0, 0, 1, 1,
0.3215031, -1.381102, 2.841823, 1, 0, 0, 1, 1,
0.3232688, 2.878361, 0.07799672, 0, 0, 0, 1, 1,
0.3264955, 0.3708329, 1.712201, 0, 0, 0, 1, 1,
0.3326862, -1.553032, 1.42361, 0, 0, 0, 1, 1,
0.3328069, 0.6808934, 0.756222, 0, 0, 0, 1, 1,
0.3347874, 1.137437, 1.350502, 0, 0, 0, 1, 1,
0.3379339, 1.214519, 0.3467376, 0, 0, 0, 1, 1,
0.339826, 0.5840669, -0.4077873, 0, 0, 0, 1, 1,
0.3441181, -0.9590427, 2.615815, 1, 1, 1, 1, 1,
0.3528585, -0.8258386, 3.039383, 1, 1, 1, 1, 1,
0.3536828, -1.97479, 3.464466, 1, 1, 1, 1, 1,
0.3551983, 0.3586616, -0.2145872, 1, 1, 1, 1, 1,
0.361166, 1.61378, 1.492423, 1, 1, 1, 1, 1,
0.365208, 0.2685777, 2.786246, 1, 1, 1, 1, 1,
0.3694724, 2.22735, 0.712858, 1, 1, 1, 1, 1,
0.3699574, 0.157067, 2.32552, 1, 1, 1, 1, 1,
0.3713324, -1.570137, 2.3085, 1, 1, 1, 1, 1,
0.3725032, 0.1212884, -0.6859043, 1, 1, 1, 1, 1,
0.3743401, -0.6292161, 2.399638, 1, 1, 1, 1, 1,
0.3753974, 1.043991, 0.9334943, 1, 1, 1, 1, 1,
0.3762037, -0.2871389, 5.19238, 1, 1, 1, 1, 1,
0.3782534, 2.061436, 2.128677, 1, 1, 1, 1, 1,
0.3803714, 0.2644992, -0.1523939, 1, 1, 1, 1, 1,
0.3811197, -1.594413, 3.47145, 0, 0, 1, 1, 1,
0.3830166, -0.8215418, 2.754161, 1, 0, 0, 1, 1,
0.3830583, 1.915842, -0.009048758, 1, 0, 0, 1, 1,
0.3831791, 0.2950967, 0.3833384, 1, 0, 0, 1, 1,
0.3950847, 0.337332, 0.8938251, 1, 0, 0, 1, 1,
0.3955799, -0.3582969, 1.881042, 1, 0, 0, 1, 1,
0.3976627, 0.05483656, 0.3059841, 0, 0, 0, 1, 1,
0.4033427, 1.095115, 1.720823, 0, 0, 0, 1, 1,
0.4099092, -0.3495347, 4.339112, 0, 0, 0, 1, 1,
0.4103296, -0.1460916, 1.393189, 0, 0, 0, 1, 1,
0.4164999, 0.3103512, 0.486005, 0, 0, 0, 1, 1,
0.4189565, -0.9525595, 2.660877, 0, 0, 0, 1, 1,
0.426885, -0.01593448, 1.623408, 0, 0, 0, 1, 1,
0.4297305, -1.301093, 2.366874, 1, 1, 1, 1, 1,
0.4376651, -0.3029472, 1.885078, 1, 1, 1, 1, 1,
0.4419812, 0.4526172, 0.7122116, 1, 1, 1, 1, 1,
0.4436474, 0.1489903, 3.060259, 1, 1, 1, 1, 1,
0.443734, 0.5499902, 0.8794207, 1, 1, 1, 1, 1,
0.4469893, 1.72147, 0.8198988, 1, 1, 1, 1, 1,
0.4505369, -0.7068892, 4.199675, 1, 1, 1, 1, 1,
0.4575643, -0.5596175, 3.415064, 1, 1, 1, 1, 1,
0.4576367, 0.9817261, 0.8998845, 1, 1, 1, 1, 1,
0.4582699, -0.2169133, 3.393244, 1, 1, 1, 1, 1,
0.4597814, 1.996758, -0.3278314, 1, 1, 1, 1, 1,
0.4604272, 0.6763753, 1.122652, 1, 1, 1, 1, 1,
0.4638739, -1.276786, 2.769014, 1, 1, 1, 1, 1,
0.4655525, -1.122982, 3.364789, 1, 1, 1, 1, 1,
0.4670278, -0.19836, 3.92424, 1, 1, 1, 1, 1,
0.4689512, 0.2060218, 0.729255, 0, 0, 1, 1, 1,
0.4699549, 0.3347766, 2.329373, 1, 0, 0, 1, 1,
0.4711576, -0.3118545, 3.114305, 1, 0, 0, 1, 1,
0.4733085, -1.942925, 1.301715, 1, 0, 0, 1, 1,
0.4751191, -0.4519269, 2.315515, 1, 0, 0, 1, 1,
0.4765748, -0.5282509, 3.988514, 1, 0, 0, 1, 1,
0.4790677, 0.799619, 0.3114411, 0, 0, 0, 1, 1,
0.4852061, 0.8203915, -1.492533, 0, 0, 0, 1, 1,
0.4863066, -0.6415302, 1.46637, 0, 0, 0, 1, 1,
0.4866543, -0.8219489, 1.128362, 0, 0, 0, 1, 1,
0.4871937, 1.060973, -0.5977041, 0, 0, 0, 1, 1,
0.4874312, 0.08791226, 3.26703, 0, 0, 0, 1, 1,
0.4907576, 0.6804464, 0.3597524, 0, 0, 0, 1, 1,
0.4934433, -0.5194738, 2.583612, 1, 1, 1, 1, 1,
0.4944887, 1.776814, 0.2902867, 1, 1, 1, 1, 1,
0.5003105, -0.3595986, 2.381743, 1, 1, 1, 1, 1,
0.5017067, -1.244569, 3.646874, 1, 1, 1, 1, 1,
0.5028039, 0.1284291, 2.973284, 1, 1, 1, 1, 1,
0.5050091, 0.4536472, 1.849858, 1, 1, 1, 1, 1,
0.5075337, 0.4071755, -0.1589192, 1, 1, 1, 1, 1,
0.5076544, 0.1141555, 0.9462142, 1, 1, 1, 1, 1,
0.513061, 0.01109148, -0.4139245, 1, 1, 1, 1, 1,
0.523884, 0.5685393, -0.1617495, 1, 1, 1, 1, 1,
0.52398, -2.061254, 3.259106, 1, 1, 1, 1, 1,
0.5248373, -0.1702132, 1.917764, 1, 1, 1, 1, 1,
0.5260732, -0.2150498, 1.823427, 1, 1, 1, 1, 1,
0.532544, -0.895092, 1.91757, 1, 1, 1, 1, 1,
0.535204, 0.8940403, -0.02088343, 1, 1, 1, 1, 1,
0.5363401, 1.1163, 1.845011, 0, 0, 1, 1, 1,
0.536675, 0.6442783, 2.246317, 1, 0, 0, 1, 1,
0.5387033, 0.1493257, 0.957624, 1, 0, 0, 1, 1,
0.543846, 1.971155, 0.1972093, 1, 0, 0, 1, 1,
0.5469019, 0.4936989, 0.8696919, 1, 0, 0, 1, 1,
0.5479912, -0.05144548, 2.952159, 1, 0, 0, 1, 1,
0.5506052, -0.8347224, 1.935047, 0, 0, 0, 1, 1,
0.5547204, -0.07694871, -0.129235, 0, 0, 0, 1, 1,
0.5592278, -0.8311355, 1.184396, 0, 0, 0, 1, 1,
0.5595332, -0.1745595, 3.14294, 0, 0, 0, 1, 1,
0.5662656, 2.026074, 1.603827, 0, 0, 0, 1, 1,
0.5665282, 2.131251, -1.145173, 0, 0, 0, 1, 1,
0.5670496, 0.2177552, 2.277609, 0, 0, 0, 1, 1,
0.5709733, -1.228746, 2.760105, 1, 1, 1, 1, 1,
0.5725613, -0.8656819, 3.003309, 1, 1, 1, 1, 1,
0.5773749, 1.684749, -0.0741213, 1, 1, 1, 1, 1,
0.5775195, -2.132586, 3.220993, 1, 1, 1, 1, 1,
0.5804393, -0.5414734, 1.846235, 1, 1, 1, 1, 1,
0.5822025, 1.94151, -1.24933, 1, 1, 1, 1, 1,
0.5861681, -1.592841, 3.691683, 1, 1, 1, 1, 1,
0.5896776, -1.261181, 3.215876, 1, 1, 1, 1, 1,
0.5967268, -1.062851, 1.699076, 1, 1, 1, 1, 1,
0.5986927, 0.4038833, 0.8524388, 1, 1, 1, 1, 1,
0.5990035, -0.3343767, 1.32773, 1, 1, 1, 1, 1,
0.5993589, 1.262508, 0.4691244, 1, 1, 1, 1, 1,
0.5999344, -0.393968, 1.440069, 1, 1, 1, 1, 1,
0.6025268, 0.2847756, 1.454571, 1, 1, 1, 1, 1,
0.612026, -1.101699, 1.527007, 1, 1, 1, 1, 1,
0.6130278, -0.898104, 3.538867, 0, 0, 1, 1, 1,
0.6152889, 1.342054, 0.6580659, 1, 0, 0, 1, 1,
0.616663, -0.7228004, 3.300767, 1, 0, 0, 1, 1,
0.6167779, -0.3521518, 1.775524, 1, 0, 0, 1, 1,
0.617758, -0.4157144, 2.117705, 1, 0, 0, 1, 1,
0.6256559, -0.3855186, 0.3305341, 1, 0, 0, 1, 1,
0.6269257, -0.4882673, 1.295374, 0, 0, 0, 1, 1,
0.632266, -0.580623, -0.1800158, 0, 0, 0, 1, 1,
0.6364147, 0.686253, 1.709065, 0, 0, 0, 1, 1,
0.6395618, -1.165501, 3.506912, 0, 0, 0, 1, 1,
0.6426787, -0.787257, 3.827815, 0, 0, 0, 1, 1,
0.6515605, 0.7727991, 1.499299, 0, 0, 0, 1, 1,
0.6531671, 0.1953924, 1.513869, 0, 0, 0, 1, 1,
0.6544033, 0.3764813, 0.7760863, 1, 1, 1, 1, 1,
0.6550586, 0.5998434, 0.3387679, 1, 1, 1, 1, 1,
0.6605481, 0.103087, 3.812089, 1, 1, 1, 1, 1,
0.6627985, 0.8585684, 0.530472, 1, 1, 1, 1, 1,
0.6638684, 0.1997786, 1.215284, 1, 1, 1, 1, 1,
0.6640819, 0.7481374, -0.4354821, 1, 1, 1, 1, 1,
0.664325, 1.050284, 0.7734976, 1, 1, 1, 1, 1,
0.6661763, -0.7544973, 1.861113, 1, 1, 1, 1, 1,
0.6666097, 0.6429471, 3.391008, 1, 1, 1, 1, 1,
0.6668931, 0.6514838, 1.788096, 1, 1, 1, 1, 1,
0.6686408, -0.5662648, 2.168003, 1, 1, 1, 1, 1,
0.6708455, 0.9052509, -0.1755105, 1, 1, 1, 1, 1,
0.6725864, 1.161187, -0.1770259, 1, 1, 1, 1, 1,
0.6731312, -1.113642, 3.038119, 1, 1, 1, 1, 1,
0.6815004, 0.7102277, 0.6724608, 1, 1, 1, 1, 1,
0.6873283, -0.2109901, 1.079771, 0, 0, 1, 1, 1,
0.6881123, -0.1467921, 1.599305, 1, 0, 0, 1, 1,
0.6921889, 0.3782699, 2.391445, 1, 0, 0, 1, 1,
0.6926492, -0.3111908, 1.563587, 1, 0, 0, 1, 1,
0.6952356, 0.7748269, 0.3331633, 1, 0, 0, 1, 1,
0.7010174, -0.7636471, 3.298983, 1, 0, 0, 1, 1,
0.7015707, -0.8913224, 2.379046, 0, 0, 0, 1, 1,
0.7059909, 1.544565, 0.1754591, 0, 0, 0, 1, 1,
0.7060556, -1.413368, 3.017657, 0, 0, 0, 1, 1,
0.7127891, -0.01353035, 3.849693, 0, 0, 0, 1, 1,
0.7136752, 0.2482097, 2.745696, 0, 0, 0, 1, 1,
0.7176532, -0.3548336, 0.088677, 0, 0, 0, 1, 1,
0.7255998, -0.8980781, 3.551141, 0, 0, 0, 1, 1,
0.7321273, 1.125999, 0.7133675, 1, 1, 1, 1, 1,
0.732569, -0.3919533, 2.227204, 1, 1, 1, 1, 1,
0.7341917, -1.081479, 3.691773, 1, 1, 1, 1, 1,
0.7382082, 0.6975194, 1.015969, 1, 1, 1, 1, 1,
0.7392727, -0.5709794, 1.395378, 1, 1, 1, 1, 1,
0.7416136, 1.150426, -0.9629196, 1, 1, 1, 1, 1,
0.7430442, 0.6116949, 0.7935308, 1, 1, 1, 1, 1,
0.7436618, 0.267291, 1.326591, 1, 1, 1, 1, 1,
0.7451949, -0.09057829, 0.05495254, 1, 1, 1, 1, 1,
0.747421, 1.436546, 0.2380003, 1, 1, 1, 1, 1,
0.7477716, 1.17596, 2.395387, 1, 1, 1, 1, 1,
0.7501026, -0.3264927, 2.157861, 1, 1, 1, 1, 1,
0.755214, 0.1195309, 3.197746, 1, 1, 1, 1, 1,
0.7596592, 1.324265, 0.132306, 1, 1, 1, 1, 1,
0.7601964, -1.248958, 1.662985, 1, 1, 1, 1, 1,
0.7608629, 0.3928749, 1.034067, 0, 0, 1, 1, 1,
0.7714366, -1.332532, 2.454746, 1, 0, 0, 1, 1,
0.7744513, 0.9098234, -1.254496, 1, 0, 0, 1, 1,
0.7746655, -0.4016427, 2.232475, 1, 0, 0, 1, 1,
0.7874884, 0.2782778, 0.8612843, 1, 0, 0, 1, 1,
0.7878429, -0.2621049, 3.078155, 1, 0, 0, 1, 1,
0.7883927, -0.7440383, 3.134159, 0, 0, 0, 1, 1,
0.7896184, 0.9385514, 1.575063, 0, 0, 0, 1, 1,
0.79601, 1.393547, 1.265956, 0, 0, 0, 1, 1,
0.7996607, 0.831506, 1.027806, 0, 0, 0, 1, 1,
0.8003659, -0.3771798, 1.758583, 0, 0, 0, 1, 1,
0.8036549, 0.9087756, 1.364174, 0, 0, 0, 1, 1,
0.8067079, -1.76315, 3.268607, 0, 0, 0, 1, 1,
0.8082696, -0.5819062, 2.36861, 1, 1, 1, 1, 1,
0.8126787, -0.518383, 5.024732, 1, 1, 1, 1, 1,
0.8128042, 1.017757, 0.6217459, 1, 1, 1, 1, 1,
0.8165745, -0.9248909, 2.216654, 1, 1, 1, 1, 1,
0.8187332, 0.003588692, 0.1310873, 1, 1, 1, 1, 1,
0.8220273, -1.407693, 1.2061, 1, 1, 1, 1, 1,
0.8237768, 0.4875084, 1.420779, 1, 1, 1, 1, 1,
0.8248249, 0.1149511, 2.450703, 1, 1, 1, 1, 1,
0.8282646, 0.7142476, 0.4137182, 1, 1, 1, 1, 1,
0.8324507, -0.7187718, 2.45982, 1, 1, 1, 1, 1,
0.8325711, 0.09092514, 1.34347, 1, 1, 1, 1, 1,
0.8398054, 1.475839, -0.2163112, 1, 1, 1, 1, 1,
0.8415076, -0.1737467, 3.106269, 1, 1, 1, 1, 1,
0.8447821, -0.02974063, 0.7841535, 1, 1, 1, 1, 1,
0.8541566, -1.957598, 3.457561, 1, 1, 1, 1, 1,
0.8627885, -0.6108457, 2.067979, 0, 0, 1, 1, 1,
0.8709762, -0.3629959, 1.521824, 1, 0, 0, 1, 1,
0.872754, -1.284179, 3.366513, 1, 0, 0, 1, 1,
0.8774241, -0.4830155, 0.7540447, 1, 0, 0, 1, 1,
0.8777479, -0.7788379, 0.3350943, 1, 0, 0, 1, 1,
0.8916657, 1.512989, -0.9503234, 1, 0, 0, 1, 1,
0.903147, -0.6226333, 1.528226, 0, 0, 0, 1, 1,
0.9040381, -0.2205359, 1.368418, 0, 0, 0, 1, 1,
0.9082106, 1.447879, 0.003547975, 0, 0, 0, 1, 1,
0.9100989, -1.136599, 2.820779, 0, 0, 0, 1, 1,
0.9126025, 1.073121, 0.5025221, 0, 0, 0, 1, 1,
0.9157521, -1.522819, 3.092852, 0, 0, 0, 1, 1,
0.917704, -0.05535807, 2.258587, 0, 0, 0, 1, 1,
0.9179832, 0.4363199, -0.2157752, 1, 1, 1, 1, 1,
0.9195637, -1.36219, 1.677177, 1, 1, 1, 1, 1,
0.920001, 0.3767515, 0.994281, 1, 1, 1, 1, 1,
0.9200135, -2.812858, 1.479786, 1, 1, 1, 1, 1,
0.9313607, -0.3161774, 0.9042672, 1, 1, 1, 1, 1,
0.9388279, 1.508773, 0.1610219, 1, 1, 1, 1, 1,
0.9395687, 0.5410973, -0.8825851, 1, 1, 1, 1, 1,
0.94158, -0.1857681, 3.306629, 1, 1, 1, 1, 1,
0.9463996, -0.2075917, 1.199459, 1, 1, 1, 1, 1,
0.9481473, -0.2000358, 1.376029, 1, 1, 1, 1, 1,
0.9507342, -0.6422236, 2.185228, 1, 1, 1, 1, 1,
0.9595485, 0.7235601, 1.284083, 1, 1, 1, 1, 1,
0.9607776, 0.916002, -1.063085, 1, 1, 1, 1, 1,
0.9728012, -1.937397, 2.713796, 1, 1, 1, 1, 1,
0.9756237, 0.3291116, 2.888798, 1, 1, 1, 1, 1,
0.9763759, -0.7236465, 1.423445, 0, 0, 1, 1, 1,
0.9861645, 1.210475, 2.314255, 1, 0, 0, 1, 1,
0.9946002, 0.8953899, 0.6891578, 1, 0, 0, 1, 1,
0.9981697, -1.494952, 0.6145206, 1, 0, 0, 1, 1,
1.003843, 0.1107365, 0.995603, 1, 0, 0, 1, 1,
1.005473, 0.6395739, 2.924238, 1, 0, 0, 1, 1,
1.006256, 1.004771, 0.2783264, 0, 0, 0, 1, 1,
1.007914, 1.237691, 1.465466, 0, 0, 0, 1, 1,
1.01104, 0.8077802, 1.751296, 0, 0, 0, 1, 1,
1.019254, 1.758242, 0.3155651, 0, 0, 0, 1, 1,
1.020792, -0.7251536, 1.098506, 0, 0, 0, 1, 1,
1.036227, -0.6357494, 1.733406, 0, 0, 0, 1, 1,
1.042332, -0.1255545, 0.4027091, 0, 0, 0, 1, 1,
1.048554, 0.01803276, 2.403642, 1, 1, 1, 1, 1,
1.051877, -0.721568, 3.688166, 1, 1, 1, 1, 1,
1.054066, -0.1687621, 1.913964, 1, 1, 1, 1, 1,
1.058175, 0.5437177, 1.239835, 1, 1, 1, 1, 1,
1.060754, 1.046131, 1.253797, 1, 1, 1, 1, 1,
1.072552, -0.6638159, 1.230252, 1, 1, 1, 1, 1,
1.073336, 0.4235528, -0.6677196, 1, 1, 1, 1, 1,
1.073773, 0.3191549, 1.269992, 1, 1, 1, 1, 1,
1.077051, 2.963342, 0.656524, 1, 1, 1, 1, 1,
1.085106, 1.302287, 0.8251477, 1, 1, 1, 1, 1,
1.092324, 1.146437, 0.7545407, 1, 1, 1, 1, 1,
1.110505, -0.521149, 2.497822, 1, 1, 1, 1, 1,
1.116287, -0.6266026, 2.112561, 1, 1, 1, 1, 1,
1.121582, -1.368343, 2.155988, 1, 1, 1, 1, 1,
1.125519, -0.2885682, 1.019072, 1, 1, 1, 1, 1,
1.136653, -0.443996, 2.692163, 0, 0, 1, 1, 1,
1.13801, -0.8684028, 2.128818, 1, 0, 0, 1, 1,
1.139948, -0.4284875, 2.082762, 1, 0, 0, 1, 1,
1.143904, 0.4491266, 0.1238514, 1, 0, 0, 1, 1,
1.147065, 0.8690504, 0.1659687, 1, 0, 0, 1, 1,
1.148063, 1.757937, -0.5488621, 1, 0, 0, 1, 1,
1.151879, -0.2095321, 1.83077, 0, 0, 0, 1, 1,
1.158168, -0.3435626, 1.392862, 0, 0, 0, 1, 1,
1.167134, 0.01838863, 2.060312, 0, 0, 0, 1, 1,
1.167376, -0.3348004, 1.973638, 0, 0, 0, 1, 1,
1.172125, -0.6930886, 2.036851, 0, 0, 0, 1, 1,
1.176412, 0.6553538, 2.100215, 0, 0, 0, 1, 1,
1.18313, 0.7748944, -0.5873613, 0, 0, 0, 1, 1,
1.185771, -0.7059944, 2.419466, 1, 1, 1, 1, 1,
1.194745, 1.606447, 0.9785496, 1, 1, 1, 1, 1,
1.197503, -0.7848583, 1.758706, 1, 1, 1, 1, 1,
1.200034, -0.6329573, 2.754912, 1, 1, 1, 1, 1,
1.200611, -0.2512269, 1.25816, 1, 1, 1, 1, 1,
1.203887, -0.8855429, 1.710765, 1, 1, 1, 1, 1,
1.207483, -1.181248, 4.066423, 1, 1, 1, 1, 1,
1.207799, 0.1672246, 1.987669, 1, 1, 1, 1, 1,
1.213682, -0.9496224, 3.035493, 1, 1, 1, 1, 1,
1.222001, 0.282404, 1.81525, 1, 1, 1, 1, 1,
1.230531, 0.5048735, 1.156319, 1, 1, 1, 1, 1,
1.233253, 1.46379, 1.109211, 1, 1, 1, 1, 1,
1.234706, 0.1808256, 1.679024, 1, 1, 1, 1, 1,
1.237007, -1.205284, 2.710209, 1, 1, 1, 1, 1,
1.237198, -1.50969, 0.1335285, 1, 1, 1, 1, 1,
1.237934, -1.273989, 2.591359, 0, 0, 1, 1, 1,
1.241267, 0.4000024, 0.2888422, 1, 0, 0, 1, 1,
1.246725, 1.514881, 0.5573937, 1, 0, 0, 1, 1,
1.251452, 0.6530041, 2.84105, 1, 0, 0, 1, 1,
1.285971, 1.600598, 1.414829, 1, 0, 0, 1, 1,
1.286975, 1.705958, -1.203038, 1, 0, 0, 1, 1,
1.290406, 1.221754, 0.2592082, 0, 0, 0, 1, 1,
1.296144, 0.08022195, -0.1493324, 0, 0, 0, 1, 1,
1.300866, -1.619269, 3.026642, 0, 0, 0, 1, 1,
1.304264, 0.03967547, 1.031695, 0, 0, 0, 1, 1,
1.308313, 1.15031, 0.5898527, 0, 0, 0, 1, 1,
1.314361, 1.185197, 0.9991119, 0, 0, 0, 1, 1,
1.315845, 0.0865283, 1.461591, 0, 0, 0, 1, 1,
1.316244, -0.9642157, 1.083001, 1, 1, 1, 1, 1,
1.317171, 1.143441, 1.710588, 1, 1, 1, 1, 1,
1.340442, -0.8346312, 0.9092926, 1, 1, 1, 1, 1,
1.344817, 0.094803, 1.740368, 1, 1, 1, 1, 1,
1.35159, 1.139237, -0.8500717, 1, 1, 1, 1, 1,
1.355682, 0.2324508, 1.576236, 1, 1, 1, 1, 1,
1.363759, -0.8395599, 2.817109, 1, 1, 1, 1, 1,
1.364038, 0.07884353, 0.8908231, 1, 1, 1, 1, 1,
1.364313, -0.5794365, 1.03304, 1, 1, 1, 1, 1,
1.378015, -1.141842, 2.054539, 1, 1, 1, 1, 1,
1.383035, -1.368954, 2.904782, 1, 1, 1, 1, 1,
1.383702, 0.484651, 2.186946, 1, 1, 1, 1, 1,
1.384515, -0.5986525, 2.431499, 1, 1, 1, 1, 1,
1.389668, -0.1791349, 0.9264589, 1, 1, 1, 1, 1,
1.396552, 1.544657, 1.880783, 1, 1, 1, 1, 1,
1.400404, 0.8242474, 1.108049, 0, 0, 1, 1, 1,
1.401932, 0.2437757, 2.266179, 1, 0, 0, 1, 1,
1.416597, -1.668998, 1.983216, 1, 0, 0, 1, 1,
1.418367, -0.07442056, 1.06906, 1, 0, 0, 1, 1,
1.418507, 0.1376196, 2.217213, 1, 0, 0, 1, 1,
1.422627, 1.702577, 1.157541, 1, 0, 0, 1, 1,
1.422996, 0.3017632, 3.818361, 0, 0, 0, 1, 1,
1.435195, 0.7729637, 0.9346773, 0, 0, 0, 1, 1,
1.44, -0.8707544, 2.620553, 0, 0, 0, 1, 1,
1.44026, -0.4083423, 1.159519, 0, 0, 0, 1, 1,
1.454415, 0.3501048, 1.275909, 0, 0, 0, 1, 1,
1.46403, 0.464535, 1.086063, 0, 0, 0, 1, 1,
1.466101, 0.4428878, 2.588646, 0, 0, 0, 1, 1,
1.469378, 0.4713888, -0.9554963, 1, 1, 1, 1, 1,
1.485342, -0.7571968, 2.687351, 1, 1, 1, 1, 1,
1.487461, -1.454381, 2.843137, 1, 1, 1, 1, 1,
1.496296, -0.000992602, 2.230592, 1, 1, 1, 1, 1,
1.525665, -1.70932, 2.44661, 1, 1, 1, 1, 1,
1.534308, -0.8479849, 1.710145, 1, 1, 1, 1, 1,
1.539153, -0.3376954, 2.821926, 1, 1, 1, 1, 1,
1.547305, -0.4603185, 2.388836, 1, 1, 1, 1, 1,
1.565364, -0.3885293, 2.911388, 1, 1, 1, 1, 1,
1.57064, 0.2242891, -0.5630699, 1, 1, 1, 1, 1,
1.593459, 2.24796, 1.002427, 1, 1, 1, 1, 1,
1.612829, -0.06671404, 2.774106, 1, 1, 1, 1, 1,
1.614816, -0.3702388, 2.272021, 1, 1, 1, 1, 1,
1.668058, -0.9440475, 3.084244, 1, 1, 1, 1, 1,
1.684273, 0.5984179, 0.09792235, 1, 1, 1, 1, 1,
1.688931, 1.204469, 0.6765316, 0, 0, 1, 1, 1,
1.697608, -1.06008, 2.47578, 1, 0, 0, 1, 1,
1.707304, -0.5551721, 3.367932, 1, 0, 0, 1, 1,
1.710773, -0.4731211, 2.175378, 1, 0, 0, 1, 1,
1.712973, 0.3173208, 2.629059, 1, 0, 0, 1, 1,
1.713451, 0.568671, -0.7385151, 1, 0, 0, 1, 1,
1.714911, 0.5516212, 0.9695901, 0, 0, 0, 1, 1,
1.729142, 0.5221528, -0.3112222, 0, 0, 0, 1, 1,
1.756927, 0.8398887, 0.5729656, 0, 0, 0, 1, 1,
1.762925, 1.257603, 0.7830338, 0, 0, 0, 1, 1,
1.769705, -1.397426, 2.734292, 0, 0, 0, 1, 1,
1.777527, -0.2920884, 2.372651, 0, 0, 0, 1, 1,
1.801629, 0.1914612, 2.261783, 0, 0, 0, 1, 1,
1.812185, 0.2553773, 2.433934, 1, 1, 1, 1, 1,
1.831476, -0.297958, 2.075623, 1, 1, 1, 1, 1,
1.862274, 0.9189795, 2.421851, 1, 1, 1, 1, 1,
1.870411, -0.4478192, 1.025958, 1, 1, 1, 1, 1,
1.874625, -0.655702, 1.080312, 1, 1, 1, 1, 1,
1.877059, 1.457832, 0.1408982, 1, 1, 1, 1, 1,
1.909782, -0.2666346, 2.599239, 1, 1, 1, 1, 1,
1.937511, -2.510201, 3.000948, 1, 1, 1, 1, 1,
1.959892, 1.07851, 0.9652279, 1, 1, 1, 1, 1,
1.973871, -1.79841, 1.645734, 1, 1, 1, 1, 1,
1.998546, 2.240743, -0.4070322, 1, 1, 1, 1, 1,
2.019258, 1.889436, 1.432308, 1, 1, 1, 1, 1,
2.097092, -0.03247832, 1.740178, 1, 1, 1, 1, 1,
2.100545, -0.6620625, 0.8313639, 1, 1, 1, 1, 1,
2.104477, 1.279636, 2.052376, 1, 1, 1, 1, 1,
2.111964, -1.822618, 1.961649, 0, 0, 1, 1, 1,
2.126274, 0.918813, 2.683218, 1, 0, 0, 1, 1,
2.136494, -1.129271, 0.6465862, 1, 0, 0, 1, 1,
2.200337, -0.6805145, 1.779127, 1, 0, 0, 1, 1,
2.226819, 0.8927116, 0.2585299, 1, 0, 0, 1, 1,
2.235663, -1.299137, 3.15641, 1, 0, 0, 1, 1,
2.237654, 0.7392356, -0.3130935, 0, 0, 0, 1, 1,
2.316975, 0.126876, 2.044947, 0, 0, 0, 1, 1,
2.368016, -0.3562191, 1.725603, 0, 0, 0, 1, 1,
2.411001, 0.002072261, 1.203607, 0, 0, 0, 1, 1,
2.46643, 1.158828, 3.722628, 0, 0, 0, 1, 1,
2.509043, -0.4090343, 1.763147, 0, 0, 0, 1, 1,
2.540237, 1.354707, 1.191768, 0, 0, 0, 1, 1,
2.591739, 0.2536876, 1.259912, 1, 1, 1, 1, 1,
2.618118, -0.8235128, 3.490761, 1, 1, 1, 1, 1,
2.747681, 0.233048, 1.414272, 1, 1, 1, 1, 1,
2.75156, 2.080025, 0.9932181, 1, 1, 1, 1, 1,
2.867114, -0.09991132, 0.5523888, 1, 1, 1, 1, 1,
2.927174, -0.5713973, 1.074772, 1, 1, 1, 1, 1,
3.118254, -1.026033, 1.091215, 1, 1, 1, 1, 1
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
var radius = 9.088059;
var distance = 31.92142;
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
mvMatrix.translate( -0.3008844, -0.1774852, -0.1153917 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.92142);
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
