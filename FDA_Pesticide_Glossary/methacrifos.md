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
-2.423008, 0.5615389, -1.777013, 1, 0, 0, 1,
-2.400995, 2.511473, 1.660915, 1, 0.007843138, 0, 1,
-2.268369, -0.03467779, -0.1194127, 1, 0.01176471, 0, 1,
-2.263785, 0.3402851, -1.866411, 1, 0.01960784, 0, 1,
-2.19716, 0.2320994, 0.07538679, 1, 0.02352941, 0, 1,
-2.191864, 0.04115477, -2.811982, 1, 0.03137255, 0, 1,
-2.188966, -0.6058067, -1.023486, 1, 0.03529412, 0, 1,
-2.114136, -0.06293211, -2.376165, 1, 0.04313726, 0, 1,
-2.074046, -0.3037579, -2.492183, 1, 0.04705882, 0, 1,
-2.069919, 0.6092829, -1.864875, 1, 0.05490196, 0, 1,
-2.068221, -0.7890677, -1.078672, 1, 0.05882353, 0, 1,
-1.992012, 0.6149783, 0.4347919, 1, 0.06666667, 0, 1,
-1.968356, -0.3148777, -2.057577, 1, 0.07058824, 0, 1,
-1.958887, -0.08056043, -2.368387, 1, 0.07843138, 0, 1,
-1.953302, -0.7205713, -4.32298, 1, 0.08235294, 0, 1,
-1.941357, 0.1005251, -0.3353357, 1, 0.09019608, 0, 1,
-1.938832, -0.1406352, -3.798937, 1, 0.09411765, 0, 1,
-1.918491, -2.113247, -3.678664, 1, 0.1019608, 0, 1,
-1.867448, 1.936925, 0.7842823, 1, 0.1098039, 0, 1,
-1.864288, -0.06476127, -2.841964, 1, 0.1137255, 0, 1,
-1.860741, 0.453108, -1.280805, 1, 0.1215686, 0, 1,
-1.840472, -2.016984, -2.409089, 1, 0.1254902, 0, 1,
-1.838334, 1.26527, -2.542911, 1, 0.1333333, 0, 1,
-1.833162, 0.07913583, -2.338764, 1, 0.1372549, 0, 1,
-1.823369, 1.126888, -1.633901, 1, 0.145098, 0, 1,
-1.817036, -0.1452964, -2.418429, 1, 0.1490196, 0, 1,
-1.81164, 0.4121746, -2.176644, 1, 0.1568628, 0, 1,
-1.805569, 0.4507777, -0.8362302, 1, 0.1607843, 0, 1,
-1.786437, -0.8030122, -2.088369, 1, 0.1686275, 0, 1,
-1.752268, 0.5094027, -1.240441, 1, 0.172549, 0, 1,
-1.742835, -0.6286934, -1.215691, 1, 0.1803922, 0, 1,
-1.74087, -0.4918773, -1.759865, 1, 0.1843137, 0, 1,
-1.734083, -0.4496931, -2.378064, 1, 0.1921569, 0, 1,
-1.731145, -0.5639513, -1.104468, 1, 0.1960784, 0, 1,
-1.724879, 0.8040372, -0.2146095, 1, 0.2039216, 0, 1,
-1.720282, -0.8726693, -3.176646, 1, 0.2117647, 0, 1,
-1.719845, 0.8756799, -0.5846674, 1, 0.2156863, 0, 1,
-1.719813, 0.07976515, -3.379733, 1, 0.2235294, 0, 1,
-1.718882, 1.624604, -0.5090789, 1, 0.227451, 0, 1,
-1.71686, 1.785923, 0.09771983, 1, 0.2352941, 0, 1,
-1.711338, -0.5752513, -2.205533, 1, 0.2392157, 0, 1,
-1.687478, 0.3718216, 0.1874372, 1, 0.2470588, 0, 1,
-1.678156, 0.1401956, -0.8135703, 1, 0.2509804, 0, 1,
-1.670887, -1.842248, -2.037722, 1, 0.2588235, 0, 1,
-1.663395, 0.4005313, -0.8175531, 1, 0.2627451, 0, 1,
-1.649323, -0.600765, -1.119702, 1, 0.2705882, 0, 1,
-1.649127, 1.008304, -1.459596, 1, 0.2745098, 0, 1,
-1.648075, 0.07209796, -3.218646, 1, 0.282353, 0, 1,
-1.628982, -0.6991197, -3.808957, 1, 0.2862745, 0, 1,
-1.626377, 0.8129014, -1.169694, 1, 0.2941177, 0, 1,
-1.622257, -1.769229, -3.115538, 1, 0.3019608, 0, 1,
-1.621986, 0.3651323, -0.70499, 1, 0.3058824, 0, 1,
-1.589243, 0.6881046, -1.999319, 1, 0.3137255, 0, 1,
-1.585685, 0.771044, -0.8329505, 1, 0.3176471, 0, 1,
-1.571356, -0.09501748, -1.698332, 1, 0.3254902, 0, 1,
-1.563721, 1.088558, -2.714992, 1, 0.3294118, 0, 1,
-1.563226, -1.304318, -2.551509, 1, 0.3372549, 0, 1,
-1.527836, -0.4869941, -1.131274, 1, 0.3411765, 0, 1,
-1.524711, 0.4274863, -1.427873, 1, 0.3490196, 0, 1,
-1.512179, 1.118953, 0.09610591, 1, 0.3529412, 0, 1,
-1.511372, 1.005118, -0.8141392, 1, 0.3607843, 0, 1,
-1.504747, -1.327233, -3.346035, 1, 0.3647059, 0, 1,
-1.50035, 0.4032664, -0.7663106, 1, 0.372549, 0, 1,
-1.499639, -0.4733008, -0.4002807, 1, 0.3764706, 0, 1,
-1.497937, -0.2483323, -1.013519, 1, 0.3843137, 0, 1,
-1.497212, -1.24111, -2.90515, 1, 0.3882353, 0, 1,
-1.492668, 0.4865, -0.919313, 1, 0.3960784, 0, 1,
-1.487804, 0.5770044, -0.8788981, 1, 0.4039216, 0, 1,
-1.476853, 0.09314324, -0.5719898, 1, 0.4078431, 0, 1,
-1.471645, 0.8635989, -0.8281539, 1, 0.4156863, 0, 1,
-1.471309, 0.6997719, -0.705712, 1, 0.4196078, 0, 1,
-1.466131, 0.8644296, -2.091216, 1, 0.427451, 0, 1,
-1.456229, 0.7542044, -1.36641, 1, 0.4313726, 0, 1,
-1.446979, 0.3083689, -0.9372882, 1, 0.4392157, 0, 1,
-1.435818, -2.19817, -2.575766, 1, 0.4431373, 0, 1,
-1.431413, 1.552936, 0.2800233, 1, 0.4509804, 0, 1,
-1.427699, 0.7249969, -0.6979573, 1, 0.454902, 0, 1,
-1.425933, -0.2611606, -1.602543, 1, 0.4627451, 0, 1,
-1.416038, -0.3370934, -4.456687, 1, 0.4666667, 0, 1,
-1.409872, -1.032761, -1.593648, 1, 0.4745098, 0, 1,
-1.408933, 0.4595044, -0.1420681, 1, 0.4784314, 0, 1,
-1.40795, -0.4538223, -1.805057, 1, 0.4862745, 0, 1,
-1.405146, -0.2610203, -4.873102, 1, 0.4901961, 0, 1,
-1.401776, -0.1329727, -2.413056, 1, 0.4980392, 0, 1,
-1.394889, 0.3168444, -0.4812884, 1, 0.5058824, 0, 1,
-1.388131, 0.4973229, -3.547432, 1, 0.509804, 0, 1,
-1.387458, 1.563284, -1.341666, 1, 0.5176471, 0, 1,
-1.378243, 0.3046932, -1.748006, 1, 0.5215687, 0, 1,
-1.377125, 1.367578, -0.3114929, 1, 0.5294118, 0, 1,
-1.373043, 1.098279, 0.7284535, 1, 0.5333334, 0, 1,
-1.369984, -0.6260169, -1.031249, 1, 0.5411765, 0, 1,
-1.364204, 0.8451993, -0.9730731, 1, 0.5450981, 0, 1,
-1.362091, -0.04176391, -2.079846, 1, 0.5529412, 0, 1,
-1.361029, -0.4409801, -1.554512, 1, 0.5568628, 0, 1,
-1.348602, -1.642649, -3.876111, 1, 0.5647059, 0, 1,
-1.32486, -0.9527686, -0.9424832, 1, 0.5686275, 0, 1,
-1.32286, -1.621755, -3.328752, 1, 0.5764706, 0, 1,
-1.322751, -0.1407216, -1.784633, 1, 0.5803922, 0, 1,
-1.314484, -0.4917679, -1.468132, 1, 0.5882353, 0, 1,
-1.30659, 0.441146, -0.82784, 1, 0.5921569, 0, 1,
-1.306107, 0.3907223, -2.402231, 1, 0.6, 0, 1,
-1.304916, 0.2525213, -1.192103, 1, 0.6078432, 0, 1,
-1.301147, -0.556879, -1.368497, 1, 0.6117647, 0, 1,
-1.296942, -1.343642, -3.543664, 1, 0.6196079, 0, 1,
-1.280579, -0.09930537, -2.07552, 1, 0.6235294, 0, 1,
-1.277233, 0.8438619, -0.03078653, 1, 0.6313726, 0, 1,
-1.274969, -1.60534, -3.185735, 1, 0.6352941, 0, 1,
-1.263292, 1.735908, -0.2754089, 1, 0.6431373, 0, 1,
-1.255305, -0.5398873, -0.4449919, 1, 0.6470588, 0, 1,
-1.254778, 0.4941894, -0.3149563, 1, 0.654902, 0, 1,
-1.244667, 1.146234, -0.5550403, 1, 0.6588235, 0, 1,
-1.243188, -0.3465351, -2.621732, 1, 0.6666667, 0, 1,
-1.232936, -1.777041, -3.381565, 1, 0.6705883, 0, 1,
-1.232055, 0.5002936, -0.7124914, 1, 0.6784314, 0, 1,
-1.228947, -0.2397526, -2.123044, 1, 0.682353, 0, 1,
-1.223656, -1.591579, -1.323511, 1, 0.6901961, 0, 1,
-1.218845, 0.7896664, -0.8413922, 1, 0.6941177, 0, 1,
-1.195006, -0.4531743, -1.81903, 1, 0.7019608, 0, 1,
-1.194585, -0.008876427, -2.640614, 1, 0.7098039, 0, 1,
-1.194305, -1.561794, -3.30447, 1, 0.7137255, 0, 1,
-1.183817, -0.8564651, -1.408407, 1, 0.7215686, 0, 1,
-1.18173, 0.5079424, -0.6414191, 1, 0.7254902, 0, 1,
-1.178494, 1.235307, -0.06781739, 1, 0.7333333, 0, 1,
-1.178289, -0.08733705, -1.105105, 1, 0.7372549, 0, 1,
-1.164644, 1.336644, -2.6585, 1, 0.7450981, 0, 1,
-1.159509, 0.6274161, -0.5462576, 1, 0.7490196, 0, 1,
-1.157658, -0.31695, -2.824872, 1, 0.7568628, 0, 1,
-1.14411, -1.042289, -1.671493, 1, 0.7607843, 0, 1,
-1.134558, -0.1740513, -2.703874, 1, 0.7686275, 0, 1,
-1.131471, -0.9295242, -2.94434, 1, 0.772549, 0, 1,
-1.126232, 0.5884662, -1.433098, 1, 0.7803922, 0, 1,
-1.125499, -0.1040432, -2.427415, 1, 0.7843137, 0, 1,
-1.122865, 2.159287, -2.516041, 1, 0.7921569, 0, 1,
-1.114487, 0.0931179, -0.3520598, 1, 0.7960784, 0, 1,
-1.104357, 1.008857, 0.05249393, 1, 0.8039216, 0, 1,
-1.103922, 1.577282, 0.320608, 1, 0.8117647, 0, 1,
-1.08805, -0.0503132, -1.505739, 1, 0.8156863, 0, 1,
-1.08623, 0.01490977, -0.5389831, 1, 0.8235294, 0, 1,
-1.084799, -0.450033, -2.00346, 1, 0.827451, 0, 1,
-1.083711, -1.743577, -0.4544633, 1, 0.8352941, 0, 1,
-1.080007, 0.9922578, 0.4819825, 1, 0.8392157, 0, 1,
-1.07368, -1.27585, -2.560662, 1, 0.8470588, 0, 1,
-1.073628, -0.1930588, -0.3221567, 1, 0.8509804, 0, 1,
-1.073512, -2.169996, -3.035436, 1, 0.8588235, 0, 1,
-1.071468, -2.472984, -2.674879, 1, 0.8627451, 0, 1,
-1.070179, -0.9385054, -1.709086, 1, 0.8705882, 0, 1,
-1.06933, -2.431612, 1.248873, 1, 0.8745098, 0, 1,
-1.044393, -0.442293, -1.843077, 1, 0.8823529, 0, 1,
-1.035722, -0.4560681, -2.833141, 1, 0.8862745, 0, 1,
-1.032547, 0.27271, -3.925589, 1, 0.8941177, 0, 1,
-1.032417, 0.7041478, -0.709712, 1, 0.8980392, 0, 1,
-1.006396, -1.788845, -1.341535, 1, 0.9058824, 0, 1,
-1.004997, -0.2522628, -2.374789, 1, 0.9137255, 0, 1,
-1.003672, 1.010641, -1.240849, 1, 0.9176471, 0, 1,
-1.001304, 0.2480561, -1.612275, 1, 0.9254902, 0, 1,
-0.9969027, -0.1269384, -1.921466, 1, 0.9294118, 0, 1,
-0.9809135, 1.575453, 0.5240503, 1, 0.9372549, 0, 1,
-0.980112, -0.8084625, -3.91659, 1, 0.9411765, 0, 1,
-0.9756535, 0.5399235, -0.3133394, 1, 0.9490196, 0, 1,
-0.9747158, 0.01839342, -1.612903, 1, 0.9529412, 0, 1,
-0.9694923, 0.8586503, -3.007399, 1, 0.9607843, 0, 1,
-0.9689538, 0.7180654, -0.5344941, 1, 0.9647059, 0, 1,
-0.9672102, 2.767707, -0.9961755, 1, 0.972549, 0, 1,
-0.966392, 0.156504, -1.415495, 1, 0.9764706, 0, 1,
-0.9653293, -0.9348083, -2.788554, 1, 0.9843137, 0, 1,
-0.9608065, 1.302551, -0.9983953, 1, 0.9882353, 0, 1,
-0.9605055, 0.8195434, -0.1336542, 1, 0.9960784, 0, 1,
-0.9598417, 0.6548385, 0.6403295, 0.9960784, 1, 0, 1,
-0.9597807, -1.40407, -1.066397, 0.9921569, 1, 0, 1,
-0.9595281, -0.4885499, -2.147604, 0.9843137, 1, 0, 1,
-0.9583399, 0.04335861, -2.383782, 0.9803922, 1, 0, 1,
-0.9574301, 0.8079581, -1.681195, 0.972549, 1, 0, 1,
-0.9544122, 0.8062201, -1.537511, 0.9686275, 1, 0, 1,
-0.9519693, -0.6519276, -1.595523, 0.9607843, 1, 0, 1,
-0.9478758, 0.2550991, -1.320747, 0.9568627, 1, 0, 1,
-0.9257875, -0.3832881, -1.893302, 0.9490196, 1, 0, 1,
-0.9235799, -1.38144, -2.932868, 0.945098, 1, 0, 1,
-0.9233476, 0.7682422, -1.503536, 0.9372549, 1, 0, 1,
-0.9230075, 0.9799411, -0.4908065, 0.9333333, 1, 0, 1,
-0.9223429, -0.3041084, -1.064098, 0.9254902, 1, 0, 1,
-0.9110573, 1.406595, -1.799945, 0.9215686, 1, 0, 1,
-0.9056734, 3.040007, 0.6336916, 0.9137255, 1, 0, 1,
-0.9019099, -0.6107531, -2.377865, 0.9098039, 1, 0, 1,
-0.8945428, -0.9142777, -3.774403, 0.9019608, 1, 0, 1,
-0.8835819, 0.4150034, -1.38331, 0.8941177, 1, 0, 1,
-0.8794031, -0.06356023, -0.7296861, 0.8901961, 1, 0, 1,
-0.8793023, -0.2139466, -2.199291, 0.8823529, 1, 0, 1,
-0.8757607, -0.7627993, -1.792973, 0.8784314, 1, 0, 1,
-0.8694915, 0.1495455, -2.211893, 0.8705882, 1, 0, 1,
-0.8656236, 0.08518124, -0.5492288, 0.8666667, 1, 0, 1,
-0.8645911, 0.9728758, -0.7324369, 0.8588235, 1, 0, 1,
-0.8642746, -0.05394543, -0.4998907, 0.854902, 1, 0, 1,
-0.8637257, -0.3626188, -2.085923, 0.8470588, 1, 0, 1,
-0.8602294, 1.233707, -0.5438173, 0.8431373, 1, 0, 1,
-0.8588488, 0.8299921, 0.1208927, 0.8352941, 1, 0, 1,
-0.8567634, 0.6500611, 1.074224, 0.8313726, 1, 0, 1,
-0.855028, -2.375248, -4.014919, 0.8235294, 1, 0, 1,
-0.8521868, 0.7354119, 0.2222245, 0.8196079, 1, 0, 1,
-0.8476911, 0.02224593, -2.413849, 0.8117647, 1, 0, 1,
-0.8474973, 1.644881, 0.3961895, 0.8078431, 1, 0, 1,
-0.8441621, -0.7128899, -1.433973, 0.8, 1, 0, 1,
-0.8406598, -0.1244348, -2.580889, 0.7921569, 1, 0, 1,
-0.8400561, -0.2783353, -2.119634, 0.7882353, 1, 0, 1,
-0.8370392, -1.77049, -1.840651, 0.7803922, 1, 0, 1,
-0.8357126, -0.5991392, -2.681513, 0.7764706, 1, 0, 1,
-0.8303031, 0.6805512, -1.137153, 0.7686275, 1, 0, 1,
-0.8221674, -0.8818727, -2.792634, 0.7647059, 1, 0, 1,
-0.8202715, -0.3617491, -2.37264, 0.7568628, 1, 0, 1,
-0.8090112, 1.109964, -0.3513494, 0.7529412, 1, 0, 1,
-0.8081411, -0.045221, -1.077953, 0.7450981, 1, 0, 1,
-0.8079552, 0.5065453, -0.6313998, 0.7411765, 1, 0, 1,
-0.8064402, -0.1049808, -3.116214, 0.7333333, 1, 0, 1,
-0.804678, -0.6629339, -0.7595751, 0.7294118, 1, 0, 1,
-0.7931456, 0.1168232, -1.259252, 0.7215686, 1, 0, 1,
-0.7925183, 0.4566645, -1.605213, 0.7176471, 1, 0, 1,
-0.788711, 1.281176, 0.2642882, 0.7098039, 1, 0, 1,
-0.7848671, 1.976179, 0.5110144, 0.7058824, 1, 0, 1,
-0.7791743, 0.5791646, -1.659239, 0.6980392, 1, 0, 1,
-0.773625, -0.2725902, -3.913655, 0.6901961, 1, 0, 1,
-0.7726607, -1.127602, -2.500738, 0.6862745, 1, 0, 1,
-0.7715873, -0.9788986, -2.473021, 0.6784314, 1, 0, 1,
-0.77067, 0.08262544, -2.438833, 0.6745098, 1, 0, 1,
-0.7705548, -2.72286, -1.312674, 0.6666667, 1, 0, 1,
-0.757256, -0.3811357, -1.245531, 0.6627451, 1, 0, 1,
-0.7529884, 1.157801, -0.7670586, 0.654902, 1, 0, 1,
-0.7511435, 0.6010656, -0.6195142, 0.6509804, 1, 0, 1,
-0.7506534, 0.5901774, -0.6936308, 0.6431373, 1, 0, 1,
-0.7476634, -1.456758, -1.862924, 0.6392157, 1, 0, 1,
-0.7470763, 0.2363662, -2.793617, 0.6313726, 1, 0, 1,
-0.7468917, -0.8224092, -3.086841, 0.627451, 1, 0, 1,
-0.7445243, 0.07352615, -2.156463, 0.6196079, 1, 0, 1,
-0.7418276, 1.554045, 0.1858678, 0.6156863, 1, 0, 1,
-0.7403983, 0.8814048, -2.800273, 0.6078432, 1, 0, 1,
-0.7355892, -0.2370382, -1.366587, 0.6039216, 1, 0, 1,
-0.7345077, 0.1147427, -0.1112099, 0.5960785, 1, 0, 1,
-0.7304746, 0.608332, -1.37789, 0.5882353, 1, 0, 1,
-0.7287993, -0.6708276, -2.32463, 0.5843138, 1, 0, 1,
-0.7277954, -0.6591957, -2.916314, 0.5764706, 1, 0, 1,
-0.7270526, 0.9971189, -0.1731664, 0.572549, 1, 0, 1,
-0.7193426, -0.1312811, -2.176708, 0.5647059, 1, 0, 1,
-0.7173398, 0.9522297, -1.384795, 0.5607843, 1, 0, 1,
-0.7162697, 0.5275074, -0.9935506, 0.5529412, 1, 0, 1,
-0.7148108, 0.0851846, -1.807346, 0.5490196, 1, 0, 1,
-0.7142476, -0.7247927, -2.151876, 0.5411765, 1, 0, 1,
-0.7132886, -2.591807, -1.883022, 0.5372549, 1, 0, 1,
-0.712865, -0.5082535, -2.450421, 0.5294118, 1, 0, 1,
-0.7102139, -0.9437025, -3.385307, 0.5254902, 1, 0, 1,
-0.7083244, -1.48828, -1.656183, 0.5176471, 1, 0, 1,
-0.702751, 1.020761, -0.9883489, 0.5137255, 1, 0, 1,
-0.6978151, -0.6659167, -0.9092214, 0.5058824, 1, 0, 1,
-0.6944452, -0.6930188, -1.710884, 0.5019608, 1, 0, 1,
-0.6921746, 1.37043, -0.1771827, 0.4941176, 1, 0, 1,
-0.6916768, 1.977188, -1.31304, 0.4862745, 1, 0, 1,
-0.6906517, -0.7484703, -2.981982, 0.4823529, 1, 0, 1,
-0.6905707, 0.2127327, -1.622707, 0.4745098, 1, 0, 1,
-0.6900465, -0.3451958, 1.263039, 0.4705882, 1, 0, 1,
-0.6764237, -1.182707, -1.816726, 0.4627451, 1, 0, 1,
-0.6764072, 0.6643278, -0.6743729, 0.4588235, 1, 0, 1,
-0.6718504, 0.6966685, -1.946789, 0.4509804, 1, 0, 1,
-0.6712972, -0.1763092, -2.232547, 0.4470588, 1, 0, 1,
-0.6632988, 1.365831, -0.8176653, 0.4392157, 1, 0, 1,
-0.6585594, 1.291414, -0.04453938, 0.4352941, 1, 0, 1,
-0.6528859, -1.071936, -4.201516, 0.427451, 1, 0, 1,
-0.6492486, 1.274053, -0.4012769, 0.4235294, 1, 0, 1,
-0.6484984, -1.663938, -2.687163, 0.4156863, 1, 0, 1,
-0.6476415, 0.3053973, -1.135025, 0.4117647, 1, 0, 1,
-0.6389236, 0.3744929, -1.271251, 0.4039216, 1, 0, 1,
-0.6363563, -1.321071, -3.320153, 0.3960784, 1, 0, 1,
-0.6343463, 0.8302419, 0.3803355, 0.3921569, 1, 0, 1,
-0.6323116, 1.12626, -0.5344359, 0.3843137, 1, 0, 1,
-0.6302405, 1.359521, -1.112241, 0.3803922, 1, 0, 1,
-0.6293691, -0.1362421, -2.022288, 0.372549, 1, 0, 1,
-0.6285824, 0.0951104, -2.212319, 0.3686275, 1, 0, 1,
-0.6284052, 0.4417206, -1.251566, 0.3607843, 1, 0, 1,
-0.623647, 0.253841, -1.829394, 0.3568628, 1, 0, 1,
-0.6198819, 0.1144474, -2.744287, 0.3490196, 1, 0, 1,
-0.6180151, -0.3641348, -3.064668, 0.345098, 1, 0, 1,
-0.6152989, -2.193445, -3.184628, 0.3372549, 1, 0, 1,
-0.6137852, -2.342656, -2.755011, 0.3333333, 1, 0, 1,
-0.6109472, 0.2855418, -0.5168622, 0.3254902, 1, 0, 1,
-0.6061558, 2.354738, -0.4284739, 0.3215686, 1, 0, 1,
-0.6037619, -0.4098476, -1.62392, 0.3137255, 1, 0, 1,
-0.6036115, -1.952754, -4.603886, 0.3098039, 1, 0, 1,
-0.5930685, -0.2512607, -1.884536, 0.3019608, 1, 0, 1,
-0.5906842, -2.449074, -1.993854, 0.2941177, 1, 0, 1,
-0.5895295, -1.417645, -2.054674, 0.2901961, 1, 0, 1,
-0.5822793, -0.4350112, -2.123217, 0.282353, 1, 0, 1,
-0.5805736, 0.4738818, -2.482382, 0.2784314, 1, 0, 1,
-0.5802544, -1.432091, -3.329254, 0.2705882, 1, 0, 1,
-0.5798773, 0.2876834, -1.082333, 0.2666667, 1, 0, 1,
-0.5789728, 0.4272981, -0.594049, 0.2588235, 1, 0, 1,
-0.5788348, -0.4301856, -0.8992416, 0.254902, 1, 0, 1,
-0.5763582, -1.39708, -1.798529, 0.2470588, 1, 0, 1,
-0.5762053, -0.1683019, -2.083194, 0.2431373, 1, 0, 1,
-0.5733779, 0.2387462, -0.9970745, 0.2352941, 1, 0, 1,
-0.5693699, -0.6029562, -2.390137, 0.2313726, 1, 0, 1,
-0.5689057, 0.5578994, -0.01328035, 0.2235294, 1, 0, 1,
-0.566285, -0.1617989, -3.307846, 0.2196078, 1, 0, 1,
-0.5657252, 0.5007629, 0.0166673, 0.2117647, 1, 0, 1,
-0.5650438, -0.05319681, -1.01242, 0.2078431, 1, 0, 1,
-0.5524533, 0.4986577, -3.816182, 0.2, 1, 0, 1,
-0.5518869, 1.212512, -0.6099458, 0.1921569, 1, 0, 1,
-0.5486647, -1.062845, -4.066182, 0.1882353, 1, 0, 1,
-0.5479966, 1.434302, -1.63791, 0.1803922, 1, 0, 1,
-0.5458971, -0.4025493, -3.817304, 0.1764706, 1, 0, 1,
-0.5442061, -0.02674675, -2.360398, 0.1686275, 1, 0, 1,
-0.5294527, -0.05063204, -0.1168574, 0.1647059, 1, 0, 1,
-0.5291708, -1.337973, -3.2746, 0.1568628, 1, 0, 1,
-0.5246907, -0.1376074, -4.304845, 0.1529412, 1, 0, 1,
-0.5217164, -0.1203661, -1.958618, 0.145098, 1, 0, 1,
-0.5212094, -1.056735, -3.933636, 0.1411765, 1, 0, 1,
-0.5188122, 0.1923321, -1.111889, 0.1333333, 1, 0, 1,
-0.5186552, 1.224107, -1.012033, 0.1294118, 1, 0, 1,
-0.5166582, -0.4572289, -0.5731678, 0.1215686, 1, 0, 1,
-0.5127301, 0.03992514, -2.875177, 0.1176471, 1, 0, 1,
-0.5081186, 0.03563876, -0.5416403, 0.1098039, 1, 0, 1,
-0.4958552, -0.1738547, -2.355041, 0.1058824, 1, 0, 1,
-0.4927012, -0.4004245, -0.5893531, 0.09803922, 1, 0, 1,
-0.4926872, 1.954105, 0.6778346, 0.09019608, 1, 0, 1,
-0.4907752, -0.8211086, -3.473306, 0.08627451, 1, 0, 1,
-0.4905257, 1.006665, 0.02253013, 0.07843138, 1, 0, 1,
-0.4885177, 0.8723288, -1.501238, 0.07450981, 1, 0, 1,
-0.4883601, 1.90321, -1.024522, 0.06666667, 1, 0, 1,
-0.485711, -0.1341232, -1.970356, 0.0627451, 1, 0, 1,
-0.4785385, 0.4374036, -1.013707, 0.05490196, 1, 0, 1,
-0.478287, 2.602265, -1.240129, 0.05098039, 1, 0, 1,
-0.4779572, -1.114075, -3.779884, 0.04313726, 1, 0, 1,
-0.4751467, -0.0408883, -1.011581, 0.03921569, 1, 0, 1,
-0.4713673, -1.523427, -3.149668, 0.03137255, 1, 0, 1,
-0.4672458, 0.7553586, 0.4494694, 0.02745098, 1, 0, 1,
-0.4631685, 1.214102, 0.293681, 0.01960784, 1, 0, 1,
-0.4623101, -0.4129749, -2.341618, 0.01568628, 1, 0, 1,
-0.4609362, 0.3707772, -0.7518734, 0.007843138, 1, 0, 1,
-0.4596343, 2.002392, -0.7654969, 0.003921569, 1, 0, 1,
-0.4572721, 2.191278, -0.04087854, 0, 1, 0.003921569, 1,
-0.4494279, 0.7885426, -1.097744, 0, 1, 0.01176471, 1,
-0.4470972, 0.7816533, -0.6094152, 0, 1, 0.01568628, 1,
-0.4465581, -0.5712138, -1.978402, 0, 1, 0.02352941, 1,
-0.4464595, -0.1124432, -3.010715, 0, 1, 0.02745098, 1,
-0.437756, -1.506331, -2.486703, 0, 1, 0.03529412, 1,
-0.4361323, 1.032525, -0.1582916, 0, 1, 0.03921569, 1,
-0.434962, 1.489094, 1.49078, 0, 1, 0.04705882, 1,
-0.4249403, -2.034787, -4.116458, 0, 1, 0.05098039, 1,
-0.4243491, -0.2805402, -3.080542, 0, 1, 0.05882353, 1,
-0.424051, -0.3613325, -1.996011, 0, 1, 0.0627451, 1,
-0.4210385, 0.1172823, -0.887139, 0, 1, 0.07058824, 1,
-0.4196106, -0.1163592, -1.183945, 0, 1, 0.07450981, 1,
-0.4185396, -0.1055356, -3.146349, 0, 1, 0.08235294, 1,
-0.4172968, 0.1654593, -0.742097, 0, 1, 0.08627451, 1,
-0.4165511, 0.1146942, -1.613894, 0, 1, 0.09411765, 1,
-0.4165247, -0.4726007, -3.971579, 0, 1, 0.1019608, 1,
-0.4152663, 1.070474, -0.9071798, 0, 1, 0.1058824, 1,
-0.4146994, 1.193484, -1.86196, 0, 1, 0.1137255, 1,
-0.4085632, 0.2090153, -0.1292379, 0, 1, 0.1176471, 1,
-0.4077483, 0.7509944, -0.2042031, 0, 1, 0.1254902, 1,
-0.4036442, -1.194769, -3.803649, 0, 1, 0.1294118, 1,
-0.4035066, 0.004823793, -1.065987, 0, 1, 0.1372549, 1,
-0.3997575, -0.8597767, -2.45985, 0, 1, 0.1411765, 1,
-0.3982302, 1.743242, 1.259231, 0, 1, 0.1490196, 1,
-0.3977254, -0.1356757, -1.749805, 0, 1, 0.1529412, 1,
-0.3934428, 0.3947757, -1.133454, 0, 1, 0.1607843, 1,
-0.3910318, -0.4634715, -2.519479, 0, 1, 0.1647059, 1,
-0.3866279, 0.4141002, -0.4791114, 0, 1, 0.172549, 1,
-0.3837973, 0.1831654, -0.002614502, 0, 1, 0.1764706, 1,
-0.3787117, 0.9032006, 0.7425435, 0, 1, 0.1843137, 1,
-0.376735, 0.4940747, -0.2234805, 0, 1, 0.1882353, 1,
-0.3715473, 0.2340747, -0.7163844, 0, 1, 0.1960784, 1,
-0.3629817, -0.03553973, -1.976934, 0, 1, 0.2039216, 1,
-0.3619457, -1.072296, -2.391693, 0, 1, 0.2078431, 1,
-0.3610882, 0.1156316, -2.221127, 0, 1, 0.2156863, 1,
-0.3590692, -0.03644565, -2.371014, 0, 1, 0.2196078, 1,
-0.346416, 0.3291695, -1.308702, 0, 1, 0.227451, 1,
-0.3411715, -0.2446506, -2.868762, 0, 1, 0.2313726, 1,
-0.3387666, -0.2070518, -1.049185, 0, 1, 0.2392157, 1,
-0.33343, -1.182955, -3.535205, 0, 1, 0.2431373, 1,
-0.3327145, 0.476777, -0.5648862, 0, 1, 0.2509804, 1,
-0.3325022, 0.4204723, -0.945511, 0, 1, 0.254902, 1,
-0.331822, 2.193416, -1.379861, 0, 1, 0.2627451, 1,
-0.330916, -2.511185, -1.579038, 0, 1, 0.2666667, 1,
-0.3296712, -1.209525, -3.843573, 0, 1, 0.2745098, 1,
-0.3285549, -0.7932916, -2.072482, 0, 1, 0.2784314, 1,
-0.3259498, -1.10858, -2.324757, 0, 1, 0.2862745, 1,
-0.3246009, -0.3258447, -3.273932, 0, 1, 0.2901961, 1,
-0.3225802, -0.5885664, -1.133741, 0, 1, 0.2980392, 1,
-0.3222275, -0.3745087, -3.228813, 0, 1, 0.3058824, 1,
-0.3210313, -0.4383717, -2.616098, 0, 1, 0.3098039, 1,
-0.3207209, 0.6345512, -0.9552743, 0, 1, 0.3176471, 1,
-0.3193307, -0.5544736, -1.445419, 0, 1, 0.3215686, 1,
-0.3192227, -2.707313, -2.521132, 0, 1, 0.3294118, 1,
-0.3152438, 0.4588278, -0.5934349, 0, 1, 0.3333333, 1,
-0.3140778, -1.026482, -5.252772, 0, 1, 0.3411765, 1,
-0.3116913, -0.3274082, -1.805769, 0, 1, 0.345098, 1,
-0.3110923, -0.3746824, -2.37753, 0, 1, 0.3529412, 1,
-0.3071431, -0.4930499, -3.785446, 0, 1, 0.3568628, 1,
-0.3060937, 0.9857733, 1.827978, 0, 1, 0.3647059, 1,
-0.3060014, -0.06404527, -0.7859797, 0, 1, 0.3686275, 1,
-0.2999589, 0.01951194, -1.301387, 0, 1, 0.3764706, 1,
-0.2969426, -1.06231, -3.288291, 0, 1, 0.3803922, 1,
-0.2964624, -0.7607845, -1.567555, 0, 1, 0.3882353, 1,
-0.2945335, -0.03579178, -1.327173, 0, 1, 0.3921569, 1,
-0.2904652, -1.058276, -3.417944, 0, 1, 0.4, 1,
-0.2886164, 1.17435, -1.765206, 0, 1, 0.4078431, 1,
-0.2876052, 0.4937128, -0.6716247, 0, 1, 0.4117647, 1,
-0.2858261, 1.804182, -1.133536, 0, 1, 0.4196078, 1,
-0.2828179, -0.2049211, -1.432226, 0, 1, 0.4235294, 1,
-0.2753443, -0.6977149, -3.584971, 0, 1, 0.4313726, 1,
-0.2687602, 0.9919685, 0.6473939, 0, 1, 0.4352941, 1,
-0.2649599, 2.173764, -1.310365, 0, 1, 0.4431373, 1,
-0.2645831, 0.9024416, -0.07098347, 0, 1, 0.4470588, 1,
-0.2632661, 0.07484636, -1.150602, 0, 1, 0.454902, 1,
-0.2618274, 0.8837107, 0.2676045, 0, 1, 0.4588235, 1,
-0.2592033, 0.4303146, -0.9539562, 0, 1, 0.4666667, 1,
-0.2496896, -1.08046, -1.448169, 0, 1, 0.4705882, 1,
-0.2489932, -0.6445978, -3.812474, 0, 1, 0.4784314, 1,
-0.2459972, 0.0453379, -2.828179, 0, 1, 0.4823529, 1,
-0.2453152, 0.2290187, -2.498151, 0, 1, 0.4901961, 1,
-0.2431917, -1.382437, -3.118082, 0, 1, 0.4941176, 1,
-0.2427219, 1.026761, 0.698587, 0, 1, 0.5019608, 1,
-0.2401544, 0.4438314, 0.9715451, 0, 1, 0.509804, 1,
-0.2360351, -1.677931, -2.869053, 0, 1, 0.5137255, 1,
-0.2343494, 0.9688669, -0.03904148, 0, 1, 0.5215687, 1,
-0.2335347, 0.07789306, -1.577588, 0, 1, 0.5254902, 1,
-0.232383, -1.154334, -2.935651, 0, 1, 0.5333334, 1,
-0.2302404, 1.328655, -1.746724, 0, 1, 0.5372549, 1,
-0.2300302, -0.3839018, -2.240152, 0, 1, 0.5450981, 1,
-0.2249042, -0.2581736, -2.282121, 0, 1, 0.5490196, 1,
-0.2238034, 1.96737, 1.729437, 0, 1, 0.5568628, 1,
-0.2224503, -2.195678, -0.904043, 0, 1, 0.5607843, 1,
-0.2199032, -0.7728186, -2.241493, 0, 1, 0.5686275, 1,
-0.2184438, 0.5529391, 0.5318999, 0, 1, 0.572549, 1,
-0.2168883, -0.3694791, -0.9324658, 0, 1, 0.5803922, 1,
-0.2029493, -0.7958481, -2.523711, 0, 1, 0.5843138, 1,
-0.2025425, 2.149409, 0.904182, 0, 1, 0.5921569, 1,
-0.1990721, 0.02313636, -1.74055, 0, 1, 0.5960785, 1,
-0.1988006, 0.8361142, 0.2337755, 0, 1, 0.6039216, 1,
-0.1959856, -0.6648907, -2.889803, 0, 1, 0.6117647, 1,
-0.1954153, 0.08912963, -1.554531, 0, 1, 0.6156863, 1,
-0.1911001, 0.438005, -1.147633, 0, 1, 0.6235294, 1,
-0.1909015, -0.8996341, -3.886672, 0, 1, 0.627451, 1,
-0.1879309, -0.6554356, -3.37483, 0, 1, 0.6352941, 1,
-0.1854885, -2.23171, -1.827119, 0, 1, 0.6392157, 1,
-0.1818326, 0.5340062, -1.302058, 0, 1, 0.6470588, 1,
-0.1797365, 0.4328384, -1.663967, 0, 1, 0.6509804, 1,
-0.1791731, 0.7203791, -1.841594, 0, 1, 0.6588235, 1,
-0.1762627, 0.6070538, -1.329795, 0, 1, 0.6627451, 1,
-0.1706598, 1.145563, -0.3110531, 0, 1, 0.6705883, 1,
-0.1700607, 0.06332657, -0.803171, 0, 1, 0.6745098, 1,
-0.1684545, -0.3535128, -2.008761, 0, 1, 0.682353, 1,
-0.1629408, -0.4023725, -5.14029, 0, 1, 0.6862745, 1,
-0.1623273, -0.4431356, -2.518379, 0, 1, 0.6941177, 1,
-0.1577044, 0.2582521, 1.313969, 0, 1, 0.7019608, 1,
-0.149136, -0.5846604, -2.690056, 0, 1, 0.7058824, 1,
-0.1462782, 0.3734889, 0.7426738, 0, 1, 0.7137255, 1,
-0.1439404, -0.6332667, -4.706035, 0, 1, 0.7176471, 1,
-0.138159, -0.4779819, -3.057349, 0, 1, 0.7254902, 1,
-0.1377914, -0.06587997, -4.188047, 0, 1, 0.7294118, 1,
-0.1370903, 0.1673079, -0.7146172, 0, 1, 0.7372549, 1,
-0.1363656, -0.5126232, -2.99647, 0, 1, 0.7411765, 1,
-0.1346077, 0.1212803, 0.4499804, 0, 1, 0.7490196, 1,
-0.1329419, -1.279598, -3.812993, 0, 1, 0.7529412, 1,
-0.1326689, -0.3396055, -3.266496, 0, 1, 0.7607843, 1,
-0.1293897, 0.8748642, -3.695107, 0, 1, 0.7647059, 1,
-0.1292327, 0.4057199, 2.054509, 0, 1, 0.772549, 1,
-0.1253503, 1.246476, -0.2132542, 0, 1, 0.7764706, 1,
-0.1244595, 1.687195, 0.2760491, 0, 1, 0.7843137, 1,
-0.1218171, 1.889892, -0.09354729, 0, 1, 0.7882353, 1,
-0.1199383, 0.8111309, -0.8068159, 0, 1, 0.7960784, 1,
-0.1129567, -0.682924, -0.9882224, 0, 1, 0.8039216, 1,
-0.1128444, 0.4329259, 1.333188, 0, 1, 0.8078431, 1,
-0.1104812, -0.4099866, -4.146609, 0, 1, 0.8156863, 1,
-0.1087442, -0.3739967, -1.992465, 0, 1, 0.8196079, 1,
-0.1079497, 0.9330059, -0.2089304, 0, 1, 0.827451, 1,
-0.1033601, -0.2076564, -1.441907, 0, 1, 0.8313726, 1,
-0.1024594, 1.844502, -0.708594, 0, 1, 0.8392157, 1,
-0.09014109, 0.8691989, 1.42933, 0, 1, 0.8431373, 1,
-0.0881246, 0.03160307, -1.251811, 0, 1, 0.8509804, 1,
-0.08738888, -1.025055, -2.183427, 0, 1, 0.854902, 1,
-0.0864504, 1.658034, 0.3254525, 0, 1, 0.8627451, 1,
-0.08512679, 1.365539, -0.0578576, 0, 1, 0.8666667, 1,
-0.07383281, 0.5473638, -0.1406229, 0, 1, 0.8745098, 1,
-0.07316405, -0.8048549, -3.308515, 0, 1, 0.8784314, 1,
-0.07138529, -0.7309363, -4.408488, 0, 1, 0.8862745, 1,
-0.06969797, 0.1831237, 1.467993, 0, 1, 0.8901961, 1,
-0.06473695, -0.6910049, -2.685889, 0, 1, 0.8980392, 1,
-0.05692578, 0.3852978, -2.126639, 0, 1, 0.9058824, 1,
-0.05595402, 0.02854874, -1.392169, 0, 1, 0.9098039, 1,
-0.05544969, 0.3676456, 0.6797649, 0, 1, 0.9176471, 1,
-0.04786557, 0.3862811, -0.3676057, 0, 1, 0.9215686, 1,
-0.0452186, 0.5052868, -0.2798085, 0, 1, 0.9294118, 1,
-0.04118853, 0.5976917, -0.003130581, 0, 1, 0.9333333, 1,
-0.04025953, 0.2792757, 0.6140139, 0, 1, 0.9411765, 1,
-0.03733007, 0.1714965, -0.3433264, 0, 1, 0.945098, 1,
-0.03537257, -1.736915, -4.663153, 0, 1, 0.9529412, 1,
-0.03370402, 0.8143395, 1.609824, 0, 1, 0.9568627, 1,
-0.02828718, 1.291956, -1.061086, 0, 1, 0.9647059, 1,
-0.02747775, 0.7682555, 1.209622, 0, 1, 0.9686275, 1,
-0.02173581, 0.6859206, -0.2754339, 0, 1, 0.9764706, 1,
-0.01889829, 0.04769187, 1.103988, 0, 1, 0.9803922, 1,
-0.01780151, -0.2692472, -1.367095, 0, 1, 0.9882353, 1,
-0.01632088, -0.8750955, -2.506807, 0, 1, 0.9921569, 1,
-0.01531671, -0.2978769, -1.42308, 0, 1, 1, 1,
-0.01345761, -0.406045, -3.582991, 0, 0.9921569, 1, 1,
-0.01219059, 0.3974637, 1.044212, 0, 0.9882353, 1, 1,
-0.01175401, -0.05693078, -2.526523, 0, 0.9803922, 1, 1,
-0.01134786, 0.06540871, -0.601954, 0, 0.9764706, 1, 1,
-0.00630785, 0.6979541, 1.552705, 0, 0.9686275, 1, 1,
-0.006214005, 0.6338881, 1.605821, 0, 0.9647059, 1, 1,
-0.003152158, 1.426639, 1.817188, 0, 0.9568627, 1, 1,
-0.002127539, -1.708392, -4.357865, 0, 0.9529412, 1, 1,
0.001218109, -0.03673358, 4.109771, 0, 0.945098, 1, 1,
0.005506461, -0.1909559, 4.081749, 0, 0.9411765, 1, 1,
0.00972504, -0.654766, 2.988542, 0, 0.9333333, 1, 1,
0.01041241, -0.059709, 1.804497, 0, 0.9294118, 1, 1,
0.01307266, -1.075324, 3.479581, 0, 0.9215686, 1, 1,
0.01672189, 1.68801, -1.958427, 0, 0.9176471, 1, 1,
0.01801066, 0.8940768, -0.5955739, 0, 0.9098039, 1, 1,
0.01861328, 0.8771232, 1.118395, 0, 0.9058824, 1, 1,
0.02233469, 0.6061863, -0.03006867, 0, 0.8980392, 1, 1,
0.02916135, -0.9411883, 3.555094, 0, 0.8901961, 1, 1,
0.03666861, -0.2835385, 1.942509, 0, 0.8862745, 1, 1,
0.03787309, -0.1901656, 2.971756, 0, 0.8784314, 1, 1,
0.03945969, -0.1734294, 3.338796, 0, 0.8745098, 1, 1,
0.03984187, -0.3944362, 3.357013, 0, 0.8666667, 1, 1,
0.03993291, 1.491464, 0.8132656, 0, 0.8627451, 1, 1,
0.04213115, -0.1191707, 1.22362, 0, 0.854902, 1, 1,
0.04656284, -0.05459659, 2.669295, 0, 0.8509804, 1, 1,
0.05453515, -0.001044975, 1.382524, 0, 0.8431373, 1, 1,
0.05467596, 1.021485, -0.3226871, 0, 0.8392157, 1, 1,
0.05779589, -1.333677, 1.583161, 0, 0.8313726, 1, 1,
0.06085521, -1.090446, 2.013978, 0, 0.827451, 1, 1,
0.0611766, 0.2952008, 0.8199525, 0, 0.8196079, 1, 1,
0.06358419, 0.1185887, -1.111834, 0, 0.8156863, 1, 1,
0.06573827, 0.5917984, 2.031723, 0, 0.8078431, 1, 1,
0.06703965, 0.6167393, -0.3651895, 0, 0.8039216, 1, 1,
0.06946527, -0.2241607, 2.934447, 0, 0.7960784, 1, 1,
0.07127156, -0.8743599, 2.784333, 0, 0.7882353, 1, 1,
0.07448274, 0.5625547, -0.6682646, 0, 0.7843137, 1, 1,
0.07458418, 0.4633531, -1.089218, 0, 0.7764706, 1, 1,
0.07488587, 0.1680088, 1.676795, 0, 0.772549, 1, 1,
0.07528768, -0.3744979, 2.314412, 0, 0.7647059, 1, 1,
0.07767609, -0.3455077, 2.027351, 0, 0.7607843, 1, 1,
0.08264928, -1.438064, 3.725349, 0, 0.7529412, 1, 1,
0.08302139, 0.6236896, 0.814133, 0, 0.7490196, 1, 1,
0.0854385, -0.45553, 3.967242, 0, 0.7411765, 1, 1,
0.08613293, 1.026131, -0.1932907, 0, 0.7372549, 1, 1,
0.08697013, -1.443646, 4.295846, 0, 0.7294118, 1, 1,
0.08735663, -1.519415, 3.587569, 0, 0.7254902, 1, 1,
0.08979639, -1.239758, 1.939606, 0, 0.7176471, 1, 1,
0.09537152, 1.368734, 1.821741, 0, 0.7137255, 1, 1,
0.1019637, -0.6115304, 1.578377, 0, 0.7058824, 1, 1,
0.1107799, 0.5185009, 0.06866548, 0, 0.6980392, 1, 1,
0.1222485, 0.02806026, 1.203363, 0, 0.6941177, 1, 1,
0.1242898, 0.7624204, 1.00801, 0, 0.6862745, 1, 1,
0.1328099, -0.2250534, 2.255319, 0, 0.682353, 1, 1,
0.1334031, -0.9153285, 3.133548, 0, 0.6745098, 1, 1,
0.1360404, 0.369169, 0.5522892, 0, 0.6705883, 1, 1,
0.1364591, -0.2826306, 2.97144, 0, 0.6627451, 1, 1,
0.1405711, 0.9502462, -0.8876663, 0, 0.6588235, 1, 1,
0.1445176, -0.6528475, 2.294282, 0, 0.6509804, 1, 1,
0.1521613, 0.01144205, 1.169022, 0, 0.6470588, 1, 1,
0.1527605, -0.3168246, 2.151807, 0, 0.6392157, 1, 1,
0.1551907, -0.9783768, 4.252136, 0, 0.6352941, 1, 1,
0.1580455, 1.005383, -1.576333, 0, 0.627451, 1, 1,
0.1583967, -0.4271315, 1.150891, 0, 0.6235294, 1, 1,
0.1644053, -0.7079561, 2.282445, 0, 0.6156863, 1, 1,
0.1648165, -1.078062, 1.785774, 0, 0.6117647, 1, 1,
0.1686022, 1.543834, 1.068384, 0, 0.6039216, 1, 1,
0.1702821, 0.6760338, -0.847153, 0, 0.5960785, 1, 1,
0.170387, -1.304267, 2.883603, 0, 0.5921569, 1, 1,
0.1704496, -0.9402041, 3.302154, 0, 0.5843138, 1, 1,
0.1714028, -1.449802, 3.70784, 0, 0.5803922, 1, 1,
0.1720636, 1.437861, 0.7159706, 0, 0.572549, 1, 1,
0.1747507, -0.2271828, 2.563363, 0, 0.5686275, 1, 1,
0.179721, -0.06283855, 2.324568, 0, 0.5607843, 1, 1,
0.1832863, -0.1091932, 3.492133, 0, 0.5568628, 1, 1,
0.1837241, -1.546722, 3.336297, 0, 0.5490196, 1, 1,
0.1864296, 1.1852, 0.8933989, 0, 0.5450981, 1, 1,
0.1907929, -0.3345713, 1.893045, 0, 0.5372549, 1, 1,
0.1943328, 1.235098, 1.921836, 0, 0.5333334, 1, 1,
0.1972017, -0.3063322, 4.49359, 0, 0.5254902, 1, 1,
0.1978871, 0.04511604, 1.033016, 0, 0.5215687, 1, 1,
0.201291, 1.972301, 0.4851924, 0, 0.5137255, 1, 1,
0.2014475, -0.2629865, 3.684092, 0, 0.509804, 1, 1,
0.2014945, 0.09545753, 3.741397, 0, 0.5019608, 1, 1,
0.2037356, -0.008182742, 2.054882, 0, 0.4941176, 1, 1,
0.2049671, -0.5578182, 3.73553, 0, 0.4901961, 1, 1,
0.2117494, 0.1962513, 2.470725, 0, 0.4823529, 1, 1,
0.2133483, 0.1793798, 0.946484, 0, 0.4784314, 1, 1,
0.2170204, 1.611652, -1.675331, 0, 0.4705882, 1, 1,
0.2194228, -0.2600631, 2.494853, 0, 0.4666667, 1, 1,
0.2235473, -0.06515577, 1.936329, 0, 0.4588235, 1, 1,
0.2236755, 1.903153, -1.248577, 0, 0.454902, 1, 1,
0.2247432, 0.7863784, 0.08464042, 0, 0.4470588, 1, 1,
0.2257192, 1.09482, -0.5198561, 0, 0.4431373, 1, 1,
0.2266, -1.407495, 1.188319, 0, 0.4352941, 1, 1,
0.2298403, 0.7466244, 2.018476, 0, 0.4313726, 1, 1,
0.2344553, 1.206789, -1.005374, 0, 0.4235294, 1, 1,
0.2372797, -0.737057, 3.114466, 0, 0.4196078, 1, 1,
0.2381763, -0.3525252, 0.8972842, 0, 0.4117647, 1, 1,
0.2388092, 0.329146, -0.2132336, 0, 0.4078431, 1, 1,
0.2406099, 1.187326, -0.8396008, 0, 0.4, 1, 1,
0.245445, -0.0450099, 2.285095, 0, 0.3921569, 1, 1,
0.2472753, -1.430621, 1.675038, 0, 0.3882353, 1, 1,
0.249003, -0.9696463, 2.633719, 0, 0.3803922, 1, 1,
0.2527558, -0.6426383, 1.63175, 0, 0.3764706, 1, 1,
0.2549256, 0.4824516, 1.34757, 0, 0.3686275, 1, 1,
0.2585234, 0.5845903, -0.7610082, 0, 0.3647059, 1, 1,
0.2613386, -0.4049693, 1.18649, 0, 0.3568628, 1, 1,
0.2620845, -0.3555599, 1.425833, 0, 0.3529412, 1, 1,
0.2640945, 0.792354, -1.368207, 0, 0.345098, 1, 1,
0.2662738, -1.791904, 2.17639, 0, 0.3411765, 1, 1,
0.2674271, 0.3907589, 1.096972, 0, 0.3333333, 1, 1,
0.2682956, -0.8926248, 2.793287, 0, 0.3294118, 1, 1,
0.2684106, -1.592106, 3.911263, 0, 0.3215686, 1, 1,
0.2691734, -0.5145125, 3.176462, 0, 0.3176471, 1, 1,
0.2781329, 0.3931592, -0.2200011, 0, 0.3098039, 1, 1,
0.2781694, 1.332416, -0.4255061, 0, 0.3058824, 1, 1,
0.2803357, -1.032565, 1.710917, 0, 0.2980392, 1, 1,
0.2805751, -1.326772, 2.246479, 0, 0.2901961, 1, 1,
0.2876038, 0.5763377, -0.004832092, 0, 0.2862745, 1, 1,
0.2936982, 0.2663387, -0.04308739, 0, 0.2784314, 1, 1,
0.2978692, 0.3338606, -1.22676, 0, 0.2745098, 1, 1,
0.297931, -0.165444, 1.403421, 0, 0.2666667, 1, 1,
0.2979997, 0.7197919, 0.9325416, 0, 0.2627451, 1, 1,
0.2988685, 1.014405, -1.559681, 0, 0.254902, 1, 1,
0.300369, -0.7714306, 2.142177, 0, 0.2509804, 1, 1,
0.3018123, -0.265055, 1.009555, 0, 0.2431373, 1, 1,
0.3071565, 2.780236, 0.4064116, 0, 0.2392157, 1, 1,
0.3092633, -0.9579872, 1.305082, 0, 0.2313726, 1, 1,
0.3121662, 0.4874637, 0.9584542, 0, 0.227451, 1, 1,
0.3136922, -1.378801, 3.044441, 0, 0.2196078, 1, 1,
0.313767, 0.05945674, 0.7673593, 0, 0.2156863, 1, 1,
0.3143225, 0.5979, 1.139329, 0, 0.2078431, 1, 1,
0.3150397, -2.271911, 2.673953, 0, 0.2039216, 1, 1,
0.3160032, 0.08853887, 0.7972344, 0, 0.1960784, 1, 1,
0.3185962, 0.4268548, 0.5490748, 0, 0.1882353, 1, 1,
0.3204948, -0.26785, 3.853787, 0, 0.1843137, 1, 1,
0.3223436, -1.295689, 4.104249, 0, 0.1764706, 1, 1,
0.3243293, -0.2538759, 2.163881, 0, 0.172549, 1, 1,
0.3245168, -0.8953298, 1.333983, 0, 0.1647059, 1, 1,
0.3257091, 0.7947682, -1.084898, 0, 0.1607843, 1, 1,
0.3326603, 1.402649, 1.153381, 0, 0.1529412, 1, 1,
0.3336055, 0.9558124, -0.7068505, 0, 0.1490196, 1, 1,
0.3340298, -0.7704524, 1.874128, 0, 0.1411765, 1, 1,
0.3347998, 0.9071637, -0.02897398, 0, 0.1372549, 1, 1,
0.3376301, -1.151185, 3.032213, 0, 0.1294118, 1, 1,
0.3395951, 0.4489808, 2.277489, 0, 0.1254902, 1, 1,
0.3413866, -2.407368, 2.281219, 0, 0.1176471, 1, 1,
0.3435738, 0.7040924, 1.100489, 0, 0.1137255, 1, 1,
0.3439628, -0.4610153, 3.60698, 0, 0.1058824, 1, 1,
0.3474764, 0.9992666, 0.7827122, 0, 0.09803922, 1, 1,
0.3497611, -1.382246, 3.035221, 0, 0.09411765, 1, 1,
0.3535484, 1.66942, -0.1174135, 0, 0.08627451, 1, 1,
0.3543735, 0.006159449, 3.34036, 0, 0.08235294, 1, 1,
0.3548894, -0.6653298, 3.568289, 0, 0.07450981, 1, 1,
0.3560529, -1.767182, 6.126623, 0, 0.07058824, 1, 1,
0.3566075, 0.09335598, 0.5916501, 0, 0.0627451, 1, 1,
0.3577861, -1.312761, 2.809176, 0, 0.05882353, 1, 1,
0.3586293, -0.414791, 1.97772, 0, 0.05098039, 1, 1,
0.3610888, 0.9669155, 0.9895034, 0, 0.04705882, 1, 1,
0.3614667, -0.03406661, 3.175685, 0, 0.03921569, 1, 1,
0.3661851, 1.803833, -1.034599, 0, 0.03529412, 1, 1,
0.3818342, 0.7032611, 0.01715066, 0, 0.02745098, 1, 1,
0.3877695, -0.4759544, 2.028153, 0, 0.02352941, 1, 1,
0.3892418, 1.327479, -0.6177356, 0, 0.01568628, 1, 1,
0.3948803, -0.7118065, 2.097388, 0, 0.01176471, 1, 1,
0.3964714, -1.088134, 3.519577, 0, 0.003921569, 1, 1,
0.3989642, -1.206124, 3.281535, 0.003921569, 0, 1, 1,
0.4061531, -1.572479, 2.872077, 0.007843138, 0, 1, 1,
0.4118142, -1.019495, 4.172033, 0.01568628, 0, 1, 1,
0.4119285, 0.1000951, -0.8311597, 0.01960784, 0, 1, 1,
0.4142841, -0.4275664, 3.120567, 0.02745098, 0, 1, 1,
0.4169707, 0.305514, 0.5435379, 0.03137255, 0, 1, 1,
0.4176848, 1.056388, 0.5880641, 0.03921569, 0, 1, 1,
0.4196779, 1.264635, -0.003402334, 0.04313726, 0, 1, 1,
0.4244405, 1.307955, 0.3337611, 0.05098039, 0, 1, 1,
0.4275968, -0.8655211, 2.144774, 0.05490196, 0, 1, 1,
0.4289019, 0.4493099, 2.072597, 0.0627451, 0, 1, 1,
0.4305125, -0.8248375, 1.716563, 0.06666667, 0, 1, 1,
0.436199, 1.896087, 1.26451, 0.07450981, 0, 1, 1,
0.4458798, 0.9240761, -1.252775, 0.07843138, 0, 1, 1,
0.4462852, -0.645398, 1.791528, 0.08627451, 0, 1, 1,
0.4498653, -0.2881117, 3.601312, 0.09019608, 0, 1, 1,
0.4549589, 1.189817, 1.151047, 0.09803922, 0, 1, 1,
0.456539, -0.8773158, 1.327701, 0.1058824, 0, 1, 1,
0.4574166, 2.182082, -1.10707, 0.1098039, 0, 1, 1,
0.4581534, 1.734379, 0.6012392, 0.1176471, 0, 1, 1,
0.4606453, -0.7694534, 1.864406, 0.1215686, 0, 1, 1,
0.4623304, 0.6371557, 0.8486043, 0.1294118, 0, 1, 1,
0.4639693, 0.5775203, 0.05405815, 0.1333333, 0, 1, 1,
0.4658372, -1.909418, 2.014648, 0.1411765, 0, 1, 1,
0.4698436, -1.131171, 2.23339, 0.145098, 0, 1, 1,
0.4775278, -0.4873205, 3.984566, 0.1529412, 0, 1, 1,
0.4790178, 0.6053038, 0.149217, 0.1568628, 0, 1, 1,
0.4790209, 0.4325656, 2.621916, 0.1647059, 0, 1, 1,
0.480287, 0.2809904, 1.786433, 0.1686275, 0, 1, 1,
0.4825172, -0.7411026, 3.225717, 0.1764706, 0, 1, 1,
0.482641, 0.6237147, -0.09015498, 0.1803922, 0, 1, 1,
0.4977584, -0.2188876, 2.64301, 0.1882353, 0, 1, 1,
0.4997536, 0.07145232, 4.058906, 0.1921569, 0, 1, 1,
0.5059218, -1.206051, 1.260881, 0.2, 0, 1, 1,
0.5067344, -2.300183, 1.286323, 0.2078431, 0, 1, 1,
0.5069928, -1.371697, 2.41824, 0.2117647, 0, 1, 1,
0.5097858, 0.2836676, 0.9471375, 0.2196078, 0, 1, 1,
0.511164, -0.3516004, 0.5263652, 0.2235294, 0, 1, 1,
0.5143621, -0.6027794, 2.192543, 0.2313726, 0, 1, 1,
0.5209967, -0.2251492, 0.4474274, 0.2352941, 0, 1, 1,
0.525461, -0.9392198, 4.060014, 0.2431373, 0, 1, 1,
0.5308248, -0.3953232, 2.112522, 0.2470588, 0, 1, 1,
0.5317669, 0.1148938, 0.3046407, 0.254902, 0, 1, 1,
0.5318882, 0.6594267, -1.311642, 0.2588235, 0, 1, 1,
0.5421627, 0.775911, -0.2232395, 0.2666667, 0, 1, 1,
0.5455555, -1.703937, 2.408627, 0.2705882, 0, 1, 1,
0.5482193, 0.7853255, 1.630278, 0.2784314, 0, 1, 1,
0.5538322, -1.370486, 2.261219, 0.282353, 0, 1, 1,
0.5538926, -0.9260065, 3.627656, 0.2901961, 0, 1, 1,
0.5628302, 2.069265, 2.064027, 0.2941177, 0, 1, 1,
0.5657791, -0.3479742, 1.11602, 0.3019608, 0, 1, 1,
0.5678881, -0.01793739, 0.6700231, 0.3098039, 0, 1, 1,
0.5737587, -0.7897469, 1.724172, 0.3137255, 0, 1, 1,
0.573818, 0.5360649, 0.2703952, 0.3215686, 0, 1, 1,
0.5799674, 0.04130648, 0.6349792, 0.3254902, 0, 1, 1,
0.5876517, 1.14677, 0.3770548, 0.3333333, 0, 1, 1,
0.5895759, 1.59462, 1.798879, 0.3372549, 0, 1, 1,
0.5910676, -0.06490915, 0.06237236, 0.345098, 0, 1, 1,
0.5980079, -1.031132, 3.501522, 0.3490196, 0, 1, 1,
0.6069523, -0.02293772, 1.294883, 0.3568628, 0, 1, 1,
0.6069987, -1.093051, 1.47192, 0.3607843, 0, 1, 1,
0.6107309, -0.2008931, 0.7181305, 0.3686275, 0, 1, 1,
0.6156922, -0.4649396, 0.7854828, 0.372549, 0, 1, 1,
0.6217704, 0.3244884, -0.2373447, 0.3803922, 0, 1, 1,
0.6263778, -0.6017811, 2.923252, 0.3843137, 0, 1, 1,
0.6293944, 0.7694504, 0.128751, 0.3921569, 0, 1, 1,
0.632062, 1.599375, 1.025704, 0.3960784, 0, 1, 1,
0.6333275, 0.65572, 1.072981, 0.4039216, 0, 1, 1,
0.634133, -0.1651326, 3.628634, 0.4117647, 0, 1, 1,
0.6347646, -0.3035107, 1.026349, 0.4156863, 0, 1, 1,
0.6478862, -1.224652, 1.203786, 0.4235294, 0, 1, 1,
0.6482928, -0.2615235, 1.357406, 0.427451, 0, 1, 1,
0.6495196, -0.06849993, 0.9706972, 0.4352941, 0, 1, 1,
0.6530702, -0.1320321, 2.993556, 0.4392157, 0, 1, 1,
0.6577205, 0.3405406, 0.4846557, 0.4470588, 0, 1, 1,
0.6620924, -0.7985825, 0.7967047, 0.4509804, 0, 1, 1,
0.6629323, 0.05161235, -0.08244804, 0.4588235, 0, 1, 1,
0.6645626, -1.018532, 3.801433, 0.4627451, 0, 1, 1,
0.6668214, 0.8657903, 1.681753, 0.4705882, 0, 1, 1,
0.6684099, -0.1095464, 1.903752, 0.4745098, 0, 1, 1,
0.668912, 0.8018336, 0.1279837, 0.4823529, 0, 1, 1,
0.6750869, 1.497702, 0.1883088, 0.4862745, 0, 1, 1,
0.6797205, -0.9029682, 3.174636, 0.4941176, 0, 1, 1,
0.6849117, 0.9274146, 0.5508285, 0.5019608, 0, 1, 1,
0.698432, 0.7699291, 1.004105, 0.5058824, 0, 1, 1,
0.7093806, -1.70268, 1.88301, 0.5137255, 0, 1, 1,
0.7176844, -2.095064, 1.930425, 0.5176471, 0, 1, 1,
0.7183236, -1.329981, 3.01766, 0.5254902, 0, 1, 1,
0.7212862, 1.240701, -0.2152915, 0.5294118, 0, 1, 1,
0.7232468, -0.4150578, 0.5086007, 0.5372549, 0, 1, 1,
0.7253433, 0.568047, 0.1732545, 0.5411765, 0, 1, 1,
0.7283801, -1.054109, 1.886206, 0.5490196, 0, 1, 1,
0.7365419, -2.21069, 0.9506103, 0.5529412, 0, 1, 1,
0.7565053, -0.3816175, 2.394274, 0.5607843, 0, 1, 1,
0.7569814, 0.5160471, 0.3124713, 0.5647059, 0, 1, 1,
0.762413, -0.5666057, 3.634822, 0.572549, 0, 1, 1,
0.763994, 2.204808, -0.4045275, 0.5764706, 0, 1, 1,
0.7654126, 1.885438, -0.1903483, 0.5843138, 0, 1, 1,
0.7673203, 0.9661458, 1.166541, 0.5882353, 0, 1, 1,
0.7740991, 1.326966, 0.2199207, 0.5960785, 0, 1, 1,
0.7749313, -0.3220966, 2.662921, 0.6039216, 0, 1, 1,
0.7752164, -0.7729135, 1.974344, 0.6078432, 0, 1, 1,
0.7803815, -1.590403, 4.020237, 0.6156863, 0, 1, 1,
0.786945, -0.4905392, 0.5165609, 0.6196079, 0, 1, 1,
0.7870661, 1.410903, 0.6001669, 0.627451, 0, 1, 1,
0.7914752, -0.07411181, 0.1381674, 0.6313726, 0, 1, 1,
0.7927268, -0.5444855, 1.520391, 0.6392157, 0, 1, 1,
0.7956502, 0.04115728, 1.235461, 0.6431373, 0, 1, 1,
0.8002371, -1.339935, 1.259238, 0.6509804, 0, 1, 1,
0.8028536, -0.6597106, 1.930753, 0.654902, 0, 1, 1,
0.803144, -0.3192182, 1.296581, 0.6627451, 0, 1, 1,
0.8036707, -0.3172435, 1.735613, 0.6666667, 0, 1, 1,
0.8069934, -0.7255966, 2.823305, 0.6745098, 0, 1, 1,
0.8101506, 0.611714, 0.2389307, 0.6784314, 0, 1, 1,
0.8224532, 1.651247, 0.6399879, 0.6862745, 0, 1, 1,
0.827806, -1.051649, 2.374217, 0.6901961, 0, 1, 1,
0.8343028, -0.2631642, 2.15239, 0.6980392, 0, 1, 1,
0.8426655, -0.2043686, 3.78981, 0.7058824, 0, 1, 1,
0.8485586, -1.488827, 1.010278, 0.7098039, 0, 1, 1,
0.8527356, -0.8096258, 1.91172, 0.7176471, 0, 1, 1,
0.8571998, -0.6804394, 0.6350245, 0.7215686, 0, 1, 1,
0.8590739, 0.2169659, -0.6897445, 0.7294118, 0, 1, 1,
0.8615659, 1.626804, 1.545424, 0.7333333, 0, 1, 1,
0.8625046, -0.5051627, 3.739066, 0.7411765, 0, 1, 1,
0.863698, 0.3896942, 0.8441839, 0.7450981, 0, 1, 1,
0.8671411, 1.015028, 0.08549904, 0.7529412, 0, 1, 1,
0.8672908, 1.624583, -0.1999184, 0.7568628, 0, 1, 1,
0.8727308, 1.053403, 0.7725152, 0.7647059, 0, 1, 1,
0.8736066, 0.4596999, -0.7148241, 0.7686275, 0, 1, 1,
0.884645, 0.3195892, 0.6419069, 0.7764706, 0, 1, 1,
0.8869546, 0.5217973, 2.406465, 0.7803922, 0, 1, 1,
0.8897436, -1.423958, 2.959937, 0.7882353, 0, 1, 1,
0.8899676, -0.6982577, 2.498253, 0.7921569, 0, 1, 1,
0.897193, 1.260168, -2.517212, 0.8, 0, 1, 1,
0.9005966, 0.160758, -0.2127592, 0.8078431, 0, 1, 1,
0.9018389, 0.03375885, 2.606328, 0.8117647, 0, 1, 1,
0.9076074, 0.03380359, 0.8970755, 0.8196079, 0, 1, 1,
0.9103084, -1.097566, 3.63313, 0.8235294, 0, 1, 1,
0.9174452, -0.610878, 2.76645, 0.8313726, 0, 1, 1,
0.9188711, 0.8012918, 1.0445, 0.8352941, 0, 1, 1,
0.930205, -0.7123731, 3.098108, 0.8431373, 0, 1, 1,
0.9316899, -1.246614, 1.799046, 0.8470588, 0, 1, 1,
0.9363115, 0.6740295, 1.405511, 0.854902, 0, 1, 1,
0.9386808, -0.1818455, 2.400581, 0.8588235, 0, 1, 1,
0.9443887, 1.87894, -0.6429104, 0.8666667, 0, 1, 1,
0.9470839, 0.08419622, -0.1640234, 0.8705882, 0, 1, 1,
0.9485489, 0.01741396, 1.038895, 0.8784314, 0, 1, 1,
0.9520088, -0.7232625, 1.554287, 0.8823529, 0, 1, 1,
0.9533874, -1.29302, 1.382407, 0.8901961, 0, 1, 1,
0.9596766, 0.322675, 1.18996, 0.8941177, 0, 1, 1,
0.9637901, -0.2533742, 1.685986, 0.9019608, 0, 1, 1,
0.9640161, 0.1744898, 0.431811, 0.9098039, 0, 1, 1,
0.9649085, 1.002179, -1.25306, 0.9137255, 0, 1, 1,
0.9675922, -0.458272, 1.522654, 0.9215686, 0, 1, 1,
0.9687193, -0.2351608, 2.234223, 0.9254902, 0, 1, 1,
0.9694482, -0.7856383, 3.220475, 0.9333333, 0, 1, 1,
0.9696769, 0.6144031, 2.21401, 0.9372549, 0, 1, 1,
0.9705949, -0.4476539, 3.4172, 0.945098, 0, 1, 1,
0.9767466, -0.9012433, 1.123647, 0.9490196, 0, 1, 1,
0.9771086, -0.922824, 2.238415, 0.9568627, 0, 1, 1,
0.9860629, 0.7637695, -0.09410713, 0.9607843, 0, 1, 1,
0.986105, -1.341893, 2.517822, 0.9686275, 0, 1, 1,
0.9862162, -1.249927, 1.994511, 0.972549, 0, 1, 1,
0.9863447, -1.466425, 2.370122, 0.9803922, 0, 1, 1,
0.992617, 0.191539, 0.8518304, 0.9843137, 0, 1, 1,
0.9950281, 1.205247, 0.4209419, 0.9921569, 0, 1, 1,
0.999261, 0.8697596, 1.97037, 0.9960784, 0, 1, 1,
1.001001, -0.3973319, 1.668297, 1, 0, 0.9960784, 1,
1.007778, 1.219718, 1.202031, 1, 0, 0.9882353, 1,
1.009079, 0.9782491, -0.4605956, 1, 0, 0.9843137, 1,
1.009718, -0.9048187, 2.432276, 1, 0, 0.9764706, 1,
1.013425, 1.148744, 0.6891395, 1, 0, 0.972549, 1,
1.015135, -0.1880499, 1.43783, 1, 0, 0.9647059, 1,
1.016593, -0.05639859, 1.379298, 1, 0, 0.9607843, 1,
1.016865, -0.244332, 0.8858025, 1, 0, 0.9529412, 1,
1.028383, 0.3221971, 0.08045513, 1, 0, 0.9490196, 1,
1.029927, 1.375666, 1.159782, 1, 0, 0.9411765, 1,
1.033849, 0.4499258, 0.001353856, 1, 0, 0.9372549, 1,
1.034425, 1.256598, 0.7962145, 1, 0, 0.9294118, 1,
1.036601, -0.5833434, 2.075642, 1, 0, 0.9254902, 1,
1.040901, -0.5096001, 2.768116, 1, 0, 0.9176471, 1,
1.045941, -0.6808622, 2.547374, 1, 0, 0.9137255, 1,
1.047587, 1.468183, 1.29393, 1, 0, 0.9058824, 1,
1.048635, -0.1850634, 0.3459256, 1, 0, 0.9019608, 1,
1.051742, 1.488412, 1.3895, 1, 0, 0.8941177, 1,
1.063478, 2.741247, -0.1343775, 1, 0, 0.8862745, 1,
1.072665, -1.148085, 2.500727, 1, 0, 0.8823529, 1,
1.07497, 0.4193783, 0.2992703, 1, 0, 0.8745098, 1,
1.077162, 0.8807961, 1.428106, 1, 0, 0.8705882, 1,
1.08329, -2.292889, 2.689027, 1, 0, 0.8627451, 1,
1.08493, 1.099806, 0.7840163, 1, 0, 0.8588235, 1,
1.085951, 0.9925488, 1.221367, 1, 0, 0.8509804, 1,
1.08599, 0.522305, 0.8232268, 1, 0, 0.8470588, 1,
1.088684, 0.07552977, 1.142016, 1, 0, 0.8392157, 1,
1.102065, 0.5474294, 1.811453, 1, 0, 0.8352941, 1,
1.102367, -0.07111783, 2.932823, 1, 0, 0.827451, 1,
1.113117, -2.096267, 2.698126, 1, 0, 0.8235294, 1,
1.113488, 1.093959, 0.5792271, 1, 0, 0.8156863, 1,
1.116171, 0.4849331, 2.338488, 1, 0, 0.8117647, 1,
1.124075, -0.06307716, 3.253428, 1, 0, 0.8039216, 1,
1.126237, -1.635316, 4.266178, 1, 0, 0.7960784, 1,
1.137624, 0.46567, 0.02027027, 1, 0, 0.7921569, 1,
1.141494, 1.088192, 1.869937, 1, 0, 0.7843137, 1,
1.14546, -0.3320455, -0.2169475, 1, 0, 0.7803922, 1,
1.147475, -0.2003264, 1.012301, 1, 0, 0.772549, 1,
1.152902, -0.3934855, 3.052803, 1, 0, 0.7686275, 1,
1.153064, 0.009227542, 1.486032, 1, 0, 0.7607843, 1,
1.15512, -0.6801063, 1.427336, 1, 0, 0.7568628, 1,
1.158111, -0.6130452, 1.546823, 1, 0, 0.7490196, 1,
1.161222, -1.311686, 3.945884, 1, 0, 0.7450981, 1,
1.166823, 0.6388004, 0.3821548, 1, 0, 0.7372549, 1,
1.167497, -0.6291754, 2.203518, 1, 0, 0.7333333, 1,
1.173132, 0.05125989, 3.881753, 1, 0, 0.7254902, 1,
1.173423, 1.772041, 0.6873528, 1, 0, 0.7215686, 1,
1.177892, -0.2290951, 2.875585, 1, 0, 0.7137255, 1,
1.180365, 0.2745408, 0.1449359, 1, 0, 0.7098039, 1,
1.185884, -2.178363, 1.39358, 1, 0, 0.7019608, 1,
1.189186, -1.373799, 1.780278, 1, 0, 0.6941177, 1,
1.189678, -0.1026208, -0.01863926, 1, 0, 0.6901961, 1,
1.189945, 2.822136, 1.376106, 1, 0, 0.682353, 1,
1.193109, -1.237057, 2.259714, 1, 0, 0.6784314, 1,
1.216074, 0.0840294, 2.246099, 1, 0, 0.6705883, 1,
1.21918, -1.780724, 1.766873, 1, 0, 0.6666667, 1,
1.224152, 0.1448528, 2.006517, 1, 0, 0.6588235, 1,
1.224244, -0.9175153, 1.507591, 1, 0, 0.654902, 1,
1.236117, -0.1045205, 2.099006, 1, 0, 0.6470588, 1,
1.258405, 0.4025529, -1.148271, 1, 0, 0.6431373, 1,
1.263151, -0.6782778, 2.22199, 1, 0, 0.6352941, 1,
1.275481, -0.3904383, 3.172014, 1, 0, 0.6313726, 1,
1.275579, -0.123097, 2.455099, 1, 0, 0.6235294, 1,
1.283864, 0.2085171, 1.15639, 1, 0, 0.6196079, 1,
1.285951, -1.525237, 3.740242, 1, 0, 0.6117647, 1,
1.299115, -0.02373848, 0.01932183, 1, 0, 0.6078432, 1,
1.303028, 1.111897, 0.1935525, 1, 0, 0.6, 1,
1.30489, 1.343807, 0.8162521, 1, 0, 0.5921569, 1,
1.316615, -1.109572, -0.5769027, 1, 0, 0.5882353, 1,
1.327099, 1.425451, 0.3296159, 1, 0, 0.5803922, 1,
1.328185, 1.185867, 0.6929521, 1, 0, 0.5764706, 1,
1.32918, 1.01997, 1.008417, 1, 0, 0.5686275, 1,
1.33321, -0.925011, 2.170753, 1, 0, 0.5647059, 1,
1.339715, -1.182979, 1.311976, 1, 0, 0.5568628, 1,
1.339898, -0.2223079, 3.61431, 1, 0, 0.5529412, 1,
1.387115, -0.2320815, 1.98936, 1, 0, 0.5450981, 1,
1.392881, -0.1031146, 0.5737207, 1, 0, 0.5411765, 1,
1.402427, 1.244034, -0.482168, 1, 0, 0.5333334, 1,
1.407479, -1.025307, 2.595411, 1, 0, 0.5294118, 1,
1.412221, -0.2692665, 2.552143, 1, 0, 0.5215687, 1,
1.419423, 0.4994961, 1.132598, 1, 0, 0.5176471, 1,
1.429307, 1.065164, 0.9140258, 1, 0, 0.509804, 1,
1.430707, 0.2941394, -0.3651841, 1, 0, 0.5058824, 1,
1.440299, 0.3366647, 2.642853, 1, 0, 0.4980392, 1,
1.456262, -0.4164225, 1.485936, 1, 0, 0.4901961, 1,
1.462417, -0.9614794, 1.589252, 1, 0, 0.4862745, 1,
1.464795, -0.1105866, 3.061745, 1, 0, 0.4784314, 1,
1.487576, -0.3340649, 1.046081, 1, 0, 0.4745098, 1,
1.490618, 0.9988611, 0.347298, 1, 0, 0.4666667, 1,
1.502624, 0.3530261, 1.936807, 1, 0, 0.4627451, 1,
1.505046, 0.58447, 2.602157, 1, 0, 0.454902, 1,
1.508831, -1.80158, 2.642331, 1, 0, 0.4509804, 1,
1.512338, -1.887473, 2.261841, 1, 0, 0.4431373, 1,
1.531177, -1.67061, 1.668092, 1, 0, 0.4392157, 1,
1.531464, -0.1233651, 0.03445247, 1, 0, 0.4313726, 1,
1.531693, 1.012311, 1.528556, 1, 0, 0.427451, 1,
1.533723, -1.518198, 2.814323, 1, 0, 0.4196078, 1,
1.534543, 1.282955, 0.4906718, 1, 0, 0.4156863, 1,
1.542838, -0.1588406, -1.200285, 1, 0, 0.4078431, 1,
1.546, 0.4225895, -0.2540621, 1, 0, 0.4039216, 1,
1.562224, 0.4100582, -0.07804873, 1, 0, 0.3960784, 1,
1.564657, 1.810623, -0.2204845, 1, 0, 0.3882353, 1,
1.570437, -0.950772, 1.414724, 1, 0, 0.3843137, 1,
1.581292, 0.6579935, 2.467525, 1, 0, 0.3764706, 1,
1.582876, -2.355215, 2.641244, 1, 0, 0.372549, 1,
1.585194, 0.7365771, 1.50681, 1, 0, 0.3647059, 1,
1.590901, 0.2018008, 0.7307538, 1, 0, 0.3607843, 1,
1.597973, 0.8045717, 1.993437, 1, 0, 0.3529412, 1,
1.604359, -1.385767, 3.217216, 1, 0, 0.3490196, 1,
1.608799, -0.9470391, 1.005033, 1, 0, 0.3411765, 1,
1.611791, -2.077759, 2.535196, 1, 0, 0.3372549, 1,
1.643026, -0.1246305, 1.979086, 1, 0, 0.3294118, 1,
1.651689, 1.711993, 0.7963399, 1, 0, 0.3254902, 1,
1.667624, 0.4437148, 3.069909, 1, 0, 0.3176471, 1,
1.676299, -0.3289613, 0.8788894, 1, 0, 0.3137255, 1,
1.68705, 2.438312, -0.3880713, 1, 0, 0.3058824, 1,
1.688632, -0.08164414, 3.346429, 1, 0, 0.2980392, 1,
1.690579, 0.2957315, 0.9571483, 1, 0, 0.2941177, 1,
1.697844, 0.14135, 1.631447, 1, 0, 0.2862745, 1,
1.706927, -0.6210871, 1.24712, 1, 0, 0.282353, 1,
1.708926, 0.07786654, 0.1452797, 1, 0, 0.2745098, 1,
1.712371, -0.4105842, 2.204965, 1, 0, 0.2705882, 1,
1.722419, -0.5259296, 2.42591, 1, 0, 0.2627451, 1,
1.755732, -0.9585986, 2.818549, 1, 0, 0.2588235, 1,
1.762056, 0.1064426, 0.4535246, 1, 0, 0.2509804, 1,
1.762386, 0.3981044, 2.307306, 1, 0, 0.2470588, 1,
1.807109, 1.239112, 1.34687, 1, 0, 0.2392157, 1,
1.825366, 0.8117128, 0.2179131, 1, 0, 0.2352941, 1,
1.826754, -0.2212653, 0.4533886, 1, 0, 0.227451, 1,
1.838741, -1.65527, 0.9254006, 1, 0, 0.2235294, 1,
1.843849, -0.4459789, 3.805566, 1, 0, 0.2156863, 1,
1.889545, 0.2667708, -1.957066, 1, 0, 0.2117647, 1,
1.921843, 0.9286938, 1.219575, 1, 0, 0.2039216, 1,
1.922741, -1.033836, 2.134315, 1, 0, 0.1960784, 1,
1.923674, 1.877642, -0.3452207, 1, 0, 0.1921569, 1,
1.92539, -0.3052282, 1.864409, 1, 0, 0.1843137, 1,
1.935588, -0.0536665, 1.813368, 1, 0, 0.1803922, 1,
1.941771, 0.3911111, 0.528965, 1, 0, 0.172549, 1,
1.946251, -0.6162493, 3.892071, 1, 0, 0.1686275, 1,
1.973344, -0.08515082, 2.332978, 1, 0, 0.1607843, 1,
1.973407, -0.4900853, 1.819952, 1, 0, 0.1568628, 1,
1.998802, -1.44299, 2.248876, 1, 0, 0.1490196, 1,
2.003666, 0.4400435, -0.02335462, 1, 0, 0.145098, 1,
2.079724, -1.018488, 1.776917, 1, 0, 0.1372549, 1,
2.09837, -0.2685255, 1.892513, 1, 0, 0.1333333, 1,
2.113887, -1.179395, 2.296051, 1, 0, 0.1254902, 1,
2.116698, 2.008772, 1.065797, 1, 0, 0.1215686, 1,
2.134099, 2.160832, -0.5306722, 1, 0, 0.1137255, 1,
2.156297, -0.2579993, 1.84229, 1, 0, 0.1098039, 1,
2.199207, -1.321102, 3.16354, 1, 0, 0.1019608, 1,
2.200782, 1.235606, -0.6363095, 1, 0, 0.09411765, 1,
2.273298, 0.3629566, 1.774683, 1, 0, 0.09019608, 1,
2.298286, -1.471114, 2.18811, 1, 0, 0.08235294, 1,
2.372594, 0.7585, 1.035186, 1, 0, 0.07843138, 1,
2.384922, 0.4567654, 0.06658843, 1, 0, 0.07058824, 1,
2.454529, -0.0952404, -0.6600385, 1, 0, 0.06666667, 1,
2.505065, -0.01783037, 0.4313965, 1, 0, 0.05882353, 1,
2.580562, 0.488225, -1.306586, 1, 0, 0.05490196, 1,
2.598337, -1.806195, 2.565283, 1, 0, 0.04705882, 1,
2.749604, -0.1727583, 1.360335, 1, 0, 0.04313726, 1,
2.755126, 0.8652642, -0.4165834, 1, 0, 0.03529412, 1,
2.786357, -1.14041, 2.699082, 1, 0, 0.03137255, 1,
2.896892, -1.262392, 2.592909, 1, 0, 0.02352941, 1,
3.031471, 0.3407267, 2.044847, 1, 0, 0.01960784, 1,
3.106324, 2.906147, -0.993089, 1, 0, 0.01176471, 1,
3.28491, 0.4403554, 1.835552, 1, 0, 0.007843138, 1
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
0.430951, -3.699666, -7.18158, 0, -0.5, 0.5, 0.5,
0.430951, -3.699666, -7.18158, 1, -0.5, 0.5, 0.5,
0.430951, -3.699666, -7.18158, 1, 1.5, 0.5, 0.5,
0.430951, -3.699666, -7.18158, 0, 1.5, 0.5, 0.5
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
-3.390501, 0.1585736, -7.18158, 0, -0.5, 0.5, 0.5,
-3.390501, 0.1585736, -7.18158, 1, -0.5, 0.5, 0.5,
-3.390501, 0.1585736, -7.18158, 1, 1.5, 0.5, 0.5,
-3.390501, 0.1585736, -7.18158, 0, 1.5, 0.5, 0.5
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
-3.390501, -3.699666, 0.4369252, 0, -0.5, 0.5, 0.5,
-3.390501, -3.699666, 0.4369252, 1, -0.5, 0.5, 0.5,
-3.390501, -3.699666, 0.4369252, 1, 1.5, 0.5, 0.5,
-3.390501, -3.699666, 0.4369252, 0, 1.5, 0.5, 0.5
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
-2, -2.809303, -5.423463,
3, -2.809303, -5.423463,
-2, -2.809303, -5.423463,
-2, -2.957697, -5.716483,
-1, -2.809303, -5.423463,
-1, -2.957697, -5.716483,
0, -2.809303, -5.423463,
0, -2.957697, -5.716483,
1, -2.809303, -5.423463,
1, -2.957697, -5.716483,
2, -2.809303, -5.423463,
2, -2.957697, -5.716483,
3, -2.809303, -5.423463,
3, -2.957697, -5.716483
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
-2, -3.254484, -6.302522, 0, -0.5, 0.5, 0.5,
-2, -3.254484, -6.302522, 1, -0.5, 0.5, 0.5,
-2, -3.254484, -6.302522, 1, 1.5, 0.5, 0.5,
-2, -3.254484, -6.302522, 0, 1.5, 0.5, 0.5,
-1, -3.254484, -6.302522, 0, -0.5, 0.5, 0.5,
-1, -3.254484, -6.302522, 1, -0.5, 0.5, 0.5,
-1, -3.254484, -6.302522, 1, 1.5, 0.5, 0.5,
-1, -3.254484, -6.302522, 0, 1.5, 0.5, 0.5,
0, -3.254484, -6.302522, 0, -0.5, 0.5, 0.5,
0, -3.254484, -6.302522, 1, -0.5, 0.5, 0.5,
0, -3.254484, -6.302522, 1, 1.5, 0.5, 0.5,
0, -3.254484, -6.302522, 0, 1.5, 0.5, 0.5,
1, -3.254484, -6.302522, 0, -0.5, 0.5, 0.5,
1, -3.254484, -6.302522, 1, -0.5, 0.5, 0.5,
1, -3.254484, -6.302522, 1, 1.5, 0.5, 0.5,
1, -3.254484, -6.302522, 0, 1.5, 0.5, 0.5,
2, -3.254484, -6.302522, 0, -0.5, 0.5, 0.5,
2, -3.254484, -6.302522, 1, -0.5, 0.5, 0.5,
2, -3.254484, -6.302522, 1, 1.5, 0.5, 0.5,
2, -3.254484, -6.302522, 0, 1.5, 0.5, 0.5,
3, -3.254484, -6.302522, 0, -0.5, 0.5, 0.5,
3, -3.254484, -6.302522, 1, -0.5, 0.5, 0.5,
3, -3.254484, -6.302522, 1, 1.5, 0.5, 0.5,
3, -3.254484, -6.302522, 0, 1.5, 0.5, 0.5
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
-2.508627, -2, -5.423463,
-2.508627, 3, -5.423463,
-2.508627, -2, -5.423463,
-2.655606, -2, -5.716483,
-2.508627, -1, -5.423463,
-2.655606, -1, -5.716483,
-2.508627, 0, -5.423463,
-2.655606, 0, -5.716483,
-2.508627, 1, -5.423463,
-2.655606, 1, -5.716483,
-2.508627, 2, -5.423463,
-2.655606, 2, -5.716483,
-2.508627, 3, -5.423463,
-2.655606, 3, -5.716483
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
-2.949564, -2, -6.302522, 0, -0.5, 0.5, 0.5,
-2.949564, -2, -6.302522, 1, -0.5, 0.5, 0.5,
-2.949564, -2, -6.302522, 1, 1.5, 0.5, 0.5,
-2.949564, -2, -6.302522, 0, 1.5, 0.5, 0.5,
-2.949564, -1, -6.302522, 0, -0.5, 0.5, 0.5,
-2.949564, -1, -6.302522, 1, -0.5, 0.5, 0.5,
-2.949564, -1, -6.302522, 1, 1.5, 0.5, 0.5,
-2.949564, -1, -6.302522, 0, 1.5, 0.5, 0.5,
-2.949564, 0, -6.302522, 0, -0.5, 0.5, 0.5,
-2.949564, 0, -6.302522, 1, -0.5, 0.5, 0.5,
-2.949564, 0, -6.302522, 1, 1.5, 0.5, 0.5,
-2.949564, 0, -6.302522, 0, 1.5, 0.5, 0.5,
-2.949564, 1, -6.302522, 0, -0.5, 0.5, 0.5,
-2.949564, 1, -6.302522, 1, -0.5, 0.5, 0.5,
-2.949564, 1, -6.302522, 1, 1.5, 0.5, 0.5,
-2.949564, 1, -6.302522, 0, 1.5, 0.5, 0.5,
-2.949564, 2, -6.302522, 0, -0.5, 0.5, 0.5,
-2.949564, 2, -6.302522, 1, -0.5, 0.5, 0.5,
-2.949564, 2, -6.302522, 1, 1.5, 0.5, 0.5,
-2.949564, 2, -6.302522, 0, 1.5, 0.5, 0.5,
-2.949564, 3, -6.302522, 0, -0.5, 0.5, 0.5,
-2.949564, 3, -6.302522, 1, -0.5, 0.5, 0.5,
-2.949564, 3, -6.302522, 1, 1.5, 0.5, 0.5,
-2.949564, 3, -6.302522, 0, 1.5, 0.5, 0.5
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
-2.508627, -2.809303, -4,
-2.508627, -2.809303, 6,
-2.508627, -2.809303, -4,
-2.655606, -2.957697, -4,
-2.508627, -2.809303, -2,
-2.655606, -2.957697, -2,
-2.508627, -2.809303, 0,
-2.655606, -2.957697, 0,
-2.508627, -2.809303, 2,
-2.655606, -2.957697, 2,
-2.508627, -2.809303, 4,
-2.655606, -2.957697, 4,
-2.508627, -2.809303, 6,
-2.655606, -2.957697, 6
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
"4",
"6"
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
-2.949564, -3.254484, -4, 0, -0.5, 0.5, 0.5,
-2.949564, -3.254484, -4, 1, -0.5, 0.5, 0.5,
-2.949564, -3.254484, -4, 1, 1.5, 0.5, 0.5,
-2.949564, -3.254484, -4, 0, 1.5, 0.5, 0.5,
-2.949564, -3.254484, -2, 0, -0.5, 0.5, 0.5,
-2.949564, -3.254484, -2, 1, -0.5, 0.5, 0.5,
-2.949564, -3.254484, -2, 1, 1.5, 0.5, 0.5,
-2.949564, -3.254484, -2, 0, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 0, 0, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 0, 1, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 0, 1, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 0, 0, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 2, 0, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 2, 1, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 2, 1, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 2, 0, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 4, 0, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 4, 1, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 4, 1, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 4, 0, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 6, 0, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 6, 1, -0.5, 0.5, 0.5,
-2.949564, -3.254484, 6, 1, 1.5, 0.5, 0.5,
-2.949564, -3.254484, 6, 0, 1.5, 0.5, 0.5
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
-2.508627, -2.809303, -5.423463,
-2.508627, 3.12645, -5.423463,
-2.508627, -2.809303, 6.297314,
-2.508627, 3.12645, 6.297314,
-2.508627, -2.809303, -5.423463,
-2.508627, -2.809303, 6.297314,
-2.508627, 3.12645, -5.423463,
-2.508627, 3.12645, 6.297314,
-2.508627, -2.809303, -5.423463,
3.370529, -2.809303, -5.423463,
-2.508627, -2.809303, 6.297314,
3.370529, -2.809303, 6.297314,
-2.508627, 3.12645, -5.423463,
3.370529, 3.12645, -5.423463,
-2.508627, 3.12645, 6.297314,
3.370529, 3.12645, 6.297314,
3.370529, -2.809303, -5.423463,
3.370529, 3.12645, -5.423463,
3.370529, -2.809303, 6.297314,
3.370529, 3.12645, 6.297314,
3.370529, -2.809303, -5.423463,
3.370529, -2.809303, 6.297314,
3.370529, 3.12645, -5.423463,
3.370529, 3.12645, 6.297314
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
var radius = 7.685876;
var distance = 34.19533;
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
mvMatrix.translate( -0.430951, -0.1585736, -0.4369252 );
mvMatrix.scale( 1.413488, 1.400011, 0.7090076 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19533);
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
methacrifos<-read.table("methacrifos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methacrifos$V2
```

```
## Error in eval(expr, envir, enclos): object 'methacrifos' not found
```

```r
y<-methacrifos$V3
```

```
## Error in eval(expr, envir, enclos): object 'methacrifos' not found
```

```r
z<-methacrifos$V4
```

```
## Error in eval(expr, envir, enclos): object 'methacrifos' not found
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
-2.423008, 0.5615389, -1.777013, 0, 0, 1, 1, 1,
-2.400995, 2.511473, 1.660915, 1, 0, 0, 1, 1,
-2.268369, -0.03467779, -0.1194127, 1, 0, 0, 1, 1,
-2.263785, 0.3402851, -1.866411, 1, 0, 0, 1, 1,
-2.19716, 0.2320994, 0.07538679, 1, 0, 0, 1, 1,
-2.191864, 0.04115477, -2.811982, 1, 0, 0, 1, 1,
-2.188966, -0.6058067, -1.023486, 0, 0, 0, 1, 1,
-2.114136, -0.06293211, -2.376165, 0, 0, 0, 1, 1,
-2.074046, -0.3037579, -2.492183, 0, 0, 0, 1, 1,
-2.069919, 0.6092829, -1.864875, 0, 0, 0, 1, 1,
-2.068221, -0.7890677, -1.078672, 0, 0, 0, 1, 1,
-1.992012, 0.6149783, 0.4347919, 0, 0, 0, 1, 1,
-1.968356, -0.3148777, -2.057577, 0, 0, 0, 1, 1,
-1.958887, -0.08056043, -2.368387, 1, 1, 1, 1, 1,
-1.953302, -0.7205713, -4.32298, 1, 1, 1, 1, 1,
-1.941357, 0.1005251, -0.3353357, 1, 1, 1, 1, 1,
-1.938832, -0.1406352, -3.798937, 1, 1, 1, 1, 1,
-1.918491, -2.113247, -3.678664, 1, 1, 1, 1, 1,
-1.867448, 1.936925, 0.7842823, 1, 1, 1, 1, 1,
-1.864288, -0.06476127, -2.841964, 1, 1, 1, 1, 1,
-1.860741, 0.453108, -1.280805, 1, 1, 1, 1, 1,
-1.840472, -2.016984, -2.409089, 1, 1, 1, 1, 1,
-1.838334, 1.26527, -2.542911, 1, 1, 1, 1, 1,
-1.833162, 0.07913583, -2.338764, 1, 1, 1, 1, 1,
-1.823369, 1.126888, -1.633901, 1, 1, 1, 1, 1,
-1.817036, -0.1452964, -2.418429, 1, 1, 1, 1, 1,
-1.81164, 0.4121746, -2.176644, 1, 1, 1, 1, 1,
-1.805569, 0.4507777, -0.8362302, 1, 1, 1, 1, 1,
-1.786437, -0.8030122, -2.088369, 0, 0, 1, 1, 1,
-1.752268, 0.5094027, -1.240441, 1, 0, 0, 1, 1,
-1.742835, -0.6286934, -1.215691, 1, 0, 0, 1, 1,
-1.74087, -0.4918773, -1.759865, 1, 0, 0, 1, 1,
-1.734083, -0.4496931, -2.378064, 1, 0, 0, 1, 1,
-1.731145, -0.5639513, -1.104468, 1, 0, 0, 1, 1,
-1.724879, 0.8040372, -0.2146095, 0, 0, 0, 1, 1,
-1.720282, -0.8726693, -3.176646, 0, 0, 0, 1, 1,
-1.719845, 0.8756799, -0.5846674, 0, 0, 0, 1, 1,
-1.719813, 0.07976515, -3.379733, 0, 0, 0, 1, 1,
-1.718882, 1.624604, -0.5090789, 0, 0, 0, 1, 1,
-1.71686, 1.785923, 0.09771983, 0, 0, 0, 1, 1,
-1.711338, -0.5752513, -2.205533, 0, 0, 0, 1, 1,
-1.687478, 0.3718216, 0.1874372, 1, 1, 1, 1, 1,
-1.678156, 0.1401956, -0.8135703, 1, 1, 1, 1, 1,
-1.670887, -1.842248, -2.037722, 1, 1, 1, 1, 1,
-1.663395, 0.4005313, -0.8175531, 1, 1, 1, 1, 1,
-1.649323, -0.600765, -1.119702, 1, 1, 1, 1, 1,
-1.649127, 1.008304, -1.459596, 1, 1, 1, 1, 1,
-1.648075, 0.07209796, -3.218646, 1, 1, 1, 1, 1,
-1.628982, -0.6991197, -3.808957, 1, 1, 1, 1, 1,
-1.626377, 0.8129014, -1.169694, 1, 1, 1, 1, 1,
-1.622257, -1.769229, -3.115538, 1, 1, 1, 1, 1,
-1.621986, 0.3651323, -0.70499, 1, 1, 1, 1, 1,
-1.589243, 0.6881046, -1.999319, 1, 1, 1, 1, 1,
-1.585685, 0.771044, -0.8329505, 1, 1, 1, 1, 1,
-1.571356, -0.09501748, -1.698332, 1, 1, 1, 1, 1,
-1.563721, 1.088558, -2.714992, 1, 1, 1, 1, 1,
-1.563226, -1.304318, -2.551509, 0, 0, 1, 1, 1,
-1.527836, -0.4869941, -1.131274, 1, 0, 0, 1, 1,
-1.524711, 0.4274863, -1.427873, 1, 0, 0, 1, 1,
-1.512179, 1.118953, 0.09610591, 1, 0, 0, 1, 1,
-1.511372, 1.005118, -0.8141392, 1, 0, 0, 1, 1,
-1.504747, -1.327233, -3.346035, 1, 0, 0, 1, 1,
-1.50035, 0.4032664, -0.7663106, 0, 0, 0, 1, 1,
-1.499639, -0.4733008, -0.4002807, 0, 0, 0, 1, 1,
-1.497937, -0.2483323, -1.013519, 0, 0, 0, 1, 1,
-1.497212, -1.24111, -2.90515, 0, 0, 0, 1, 1,
-1.492668, 0.4865, -0.919313, 0, 0, 0, 1, 1,
-1.487804, 0.5770044, -0.8788981, 0, 0, 0, 1, 1,
-1.476853, 0.09314324, -0.5719898, 0, 0, 0, 1, 1,
-1.471645, 0.8635989, -0.8281539, 1, 1, 1, 1, 1,
-1.471309, 0.6997719, -0.705712, 1, 1, 1, 1, 1,
-1.466131, 0.8644296, -2.091216, 1, 1, 1, 1, 1,
-1.456229, 0.7542044, -1.36641, 1, 1, 1, 1, 1,
-1.446979, 0.3083689, -0.9372882, 1, 1, 1, 1, 1,
-1.435818, -2.19817, -2.575766, 1, 1, 1, 1, 1,
-1.431413, 1.552936, 0.2800233, 1, 1, 1, 1, 1,
-1.427699, 0.7249969, -0.6979573, 1, 1, 1, 1, 1,
-1.425933, -0.2611606, -1.602543, 1, 1, 1, 1, 1,
-1.416038, -0.3370934, -4.456687, 1, 1, 1, 1, 1,
-1.409872, -1.032761, -1.593648, 1, 1, 1, 1, 1,
-1.408933, 0.4595044, -0.1420681, 1, 1, 1, 1, 1,
-1.40795, -0.4538223, -1.805057, 1, 1, 1, 1, 1,
-1.405146, -0.2610203, -4.873102, 1, 1, 1, 1, 1,
-1.401776, -0.1329727, -2.413056, 1, 1, 1, 1, 1,
-1.394889, 0.3168444, -0.4812884, 0, 0, 1, 1, 1,
-1.388131, 0.4973229, -3.547432, 1, 0, 0, 1, 1,
-1.387458, 1.563284, -1.341666, 1, 0, 0, 1, 1,
-1.378243, 0.3046932, -1.748006, 1, 0, 0, 1, 1,
-1.377125, 1.367578, -0.3114929, 1, 0, 0, 1, 1,
-1.373043, 1.098279, 0.7284535, 1, 0, 0, 1, 1,
-1.369984, -0.6260169, -1.031249, 0, 0, 0, 1, 1,
-1.364204, 0.8451993, -0.9730731, 0, 0, 0, 1, 1,
-1.362091, -0.04176391, -2.079846, 0, 0, 0, 1, 1,
-1.361029, -0.4409801, -1.554512, 0, 0, 0, 1, 1,
-1.348602, -1.642649, -3.876111, 0, 0, 0, 1, 1,
-1.32486, -0.9527686, -0.9424832, 0, 0, 0, 1, 1,
-1.32286, -1.621755, -3.328752, 0, 0, 0, 1, 1,
-1.322751, -0.1407216, -1.784633, 1, 1, 1, 1, 1,
-1.314484, -0.4917679, -1.468132, 1, 1, 1, 1, 1,
-1.30659, 0.441146, -0.82784, 1, 1, 1, 1, 1,
-1.306107, 0.3907223, -2.402231, 1, 1, 1, 1, 1,
-1.304916, 0.2525213, -1.192103, 1, 1, 1, 1, 1,
-1.301147, -0.556879, -1.368497, 1, 1, 1, 1, 1,
-1.296942, -1.343642, -3.543664, 1, 1, 1, 1, 1,
-1.280579, -0.09930537, -2.07552, 1, 1, 1, 1, 1,
-1.277233, 0.8438619, -0.03078653, 1, 1, 1, 1, 1,
-1.274969, -1.60534, -3.185735, 1, 1, 1, 1, 1,
-1.263292, 1.735908, -0.2754089, 1, 1, 1, 1, 1,
-1.255305, -0.5398873, -0.4449919, 1, 1, 1, 1, 1,
-1.254778, 0.4941894, -0.3149563, 1, 1, 1, 1, 1,
-1.244667, 1.146234, -0.5550403, 1, 1, 1, 1, 1,
-1.243188, -0.3465351, -2.621732, 1, 1, 1, 1, 1,
-1.232936, -1.777041, -3.381565, 0, 0, 1, 1, 1,
-1.232055, 0.5002936, -0.7124914, 1, 0, 0, 1, 1,
-1.228947, -0.2397526, -2.123044, 1, 0, 0, 1, 1,
-1.223656, -1.591579, -1.323511, 1, 0, 0, 1, 1,
-1.218845, 0.7896664, -0.8413922, 1, 0, 0, 1, 1,
-1.195006, -0.4531743, -1.81903, 1, 0, 0, 1, 1,
-1.194585, -0.008876427, -2.640614, 0, 0, 0, 1, 1,
-1.194305, -1.561794, -3.30447, 0, 0, 0, 1, 1,
-1.183817, -0.8564651, -1.408407, 0, 0, 0, 1, 1,
-1.18173, 0.5079424, -0.6414191, 0, 0, 0, 1, 1,
-1.178494, 1.235307, -0.06781739, 0, 0, 0, 1, 1,
-1.178289, -0.08733705, -1.105105, 0, 0, 0, 1, 1,
-1.164644, 1.336644, -2.6585, 0, 0, 0, 1, 1,
-1.159509, 0.6274161, -0.5462576, 1, 1, 1, 1, 1,
-1.157658, -0.31695, -2.824872, 1, 1, 1, 1, 1,
-1.14411, -1.042289, -1.671493, 1, 1, 1, 1, 1,
-1.134558, -0.1740513, -2.703874, 1, 1, 1, 1, 1,
-1.131471, -0.9295242, -2.94434, 1, 1, 1, 1, 1,
-1.126232, 0.5884662, -1.433098, 1, 1, 1, 1, 1,
-1.125499, -0.1040432, -2.427415, 1, 1, 1, 1, 1,
-1.122865, 2.159287, -2.516041, 1, 1, 1, 1, 1,
-1.114487, 0.0931179, -0.3520598, 1, 1, 1, 1, 1,
-1.104357, 1.008857, 0.05249393, 1, 1, 1, 1, 1,
-1.103922, 1.577282, 0.320608, 1, 1, 1, 1, 1,
-1.08805, -0.0503132, -1.505739, 1, 1, 1, 1, 1,
-1.08623, 0.01490977, -0.5389831, 1, 1, 1, 1, 1,
-1.084799, -0.450033, -2.00346, 1, 1, 1, 1, 1,
-1.083711, -1.743577, -0.4544633, 1, 1, 1, 1, 1,
-1.080007, 0.9922578, 0.4819825, 0, 0, 1, 1, 1,
-1.07368, -1.27585, -2.560662, 1, 0, 0, 1, 1,
-1.073628, -0.1930588, -0.3221567, 1, 0, 0, 1, 1,
-1.073512, -2.169996, -3.035436, 1, 0, 0, 1, 1,
-1.071468, -2.472984, -2.674879, 1, 0, 0, 1, 1,
-1.070179, -0.9385054, -1.709086, 1, 0, 0, 1, 1,
-1.06933, -2.431612, 1.248873, 0, 0, 0, 1, 1,
-1.044393, -0.442293, -1.843077, 0, 0, 0, 1, 1,
-1.035722, -0.4560681, -2.833141, 0, 0, 0, 1, 1,
-1.032547, 0.27271, -3.925589, 0, 0, 0, 1, 1,
-1.032417, 0.7041478, -0.709712, 0, 0, 0, 1, 1,
-1.006396, -1.788845, -1.341535, 0, 0, 0, 1, 1,
-1.004997, -0.2522628, -2.374789, 0, 0, 0, 1, 1,
-1.003672, 1.010641, -1.240849, 1, 1, 1, 1, 1,
-1.001304, 0.2480561, -1.612275, 1, 1, 1, 1, 1,
-0.9969027, -0.1269384, -1.921466, 1, 1, 1, 1, 1,
-0.9809135, 1.575453, 0.5240503, 1, 1, 1, 1, 1,
-0.980112, -0.8084625, -3.91659, 1, 1, 1, 1, 1,
-0.9756535, 0.5399235, -0.3133394, 1, 1, 1, 1, 1,
-0.9747158, 0.01839342, -1.612903, 1, 1, 1, 1, 1,
-0.9694923, 0.8586503, -3.007399, 1, 1, 1, 1, 1,
-0.9689538, 0.7180654, -0.5344941, 1, 1, 1, 1, 1,
-0.9672102, 2.767707, -0.9961755, 1, 1, 1, 1, 1,
-0.966392, 0.156504, -1.415495, 1, 1, 1, 1, 1,
-0.9653293, -0.9348083, -2.788554, 1, 1, 1, 1, 1,
-0.9608065, 1.302551, -0.9983953, 1, 1, 1, 1, 1,
-0.9605055, 0.8195434, -0.1336542, 1, 1, 1, 1, 1,
-0.9598417, 0.6548385, 0.6403295, 1, 1, 1, 1, 1,
-0.9597807, -1.40407, -1.066397, 0, 0, 1, 1, 1,
-0.9595281, -0.4885499, -2.147604, 1, 0, 0, 1, 1,
-0.9583399, 0.04335861, -2.383782, 1, 0, 0, 1, 1,
-0.9574301, 0.8079581, -1.681195, 1, 0, 0, 1, 1,
-0.9544122, 0.8062201, -1.537511, 1, 0, 0, 1, 1,
-0.9519693, -0.6519276, -1.595523, 1, 0, 0, 1, 1,
-0.9478758, 0.2550991, -1.320747, 0, 0, 0, 1, 1,
-0.9257875, -0.3832881, -1.893302, 0, 0, 0, 1, 1,
-0.9235799, -1.38144, -2.932868, 0, 0, 0, 1, 1,
-0.9233476, 0.7682422, -1.503536, 0, 0, 0, 1, 1,
-0.9230075, 0.9799411, -0.4908065, 0, 0, 0, 1, 1,
-0.9223429, -0.3041084, -1.064098, 0, 0, 0, 1, 1,
-0.9110573, 1.406595, -1.799945, 0, 0, 0, 1, 1,
-0.9056734, 3.040007, 0.6336916, 1, 1, 1, 1, 1,
-0.9019099, -0.6107531, -2.377865, 1, 1, 1, 1, 1,
-0.8945428, -0.9142777, -3.774403, 1, 1, 1, 1, 1,
-0.8835819, 0.4150034, -1.38331, 1, 1, 1, 1, 1,
-0.8794031, -0.06356023, -0.7296861, 1, 1, 1, 1, 1,
-0.8793023, -0.2139466, -2.199291, 1, 1, 1, 1, 1,
-0.8757607, -0.7627993, -1.792973, 1, 1, 1, 1, 1,
-0.8694915, 0.1495455, -2.211893, 1, 1, 1, 1, 1,
-0.8656236, 0.08518124, -0.5492288, 1, 1, 1, 1, 1,
-0.8645911, 0.9728758, -0.7324369, 1, 1, 1, 1, 1,
-0.8642746, -0.05394543, -0.4998907, 1, 1, 1, 1, 1,
-0.8637257, -0.3626188, -2.085923, 1, 1, 1, 1, 1,
-0.8602294, 1.233707, -0.5438173, 1, 1, 1, 1, 1,
-0.8588488, 0.8299921, 0.1208927, 1, 1, 1, 1, 1,
-0.8567634, 0.6500611, 1.074224, 1, 1, 1, 1, 1,
-0.855028, -2.375248, -4.014919, 0, 0, 1, 1, 1,
-0.8521868, 0.7354119, 0.2222245, 1, 0, 0, 1, 1,
-0.8476911, 0.02224593, -2.413849, 1, 0, 0, 1, 1,
-0.8474973, 1.644881, 0.3961895, 1, 0, 0, 1, 1,
-0.8441621, -0.7128899, -1.433973, 1, 0, 0, 1, 1,
-0.8406598, -0.1244348, -2.580889, 1, 0, 0, 1, 1,
-0.8400561, -0.2783353, -2.119634, 0, 0, 0, 1, 1,
-0.8370392, -1.77049, -1.840651, 0, 0, 0, 1, 1,
-0.8357126, -0.5991392, -2.681513, 0, 0, 0, 1, 1,
-0.8303031, 0.6805512, -1.137153, 0, 0, 0, 1, 1,
-0.8221674, -0.8818727, -2.792634, 0, 0, 0, 1, 1,
-0.8202715, -0.3617491, -2.37264, 0, 0, 0, 1, 1,
-0.8090112, 1.109964, -0.3513494, 0, 0, 0, 1, 1,
-0.8081411, -0.045221, -1.077953, 1, 1, 1, 1, 1,
-0.8079552, 0.5065453, -0.6313998, 1, 1, 1, 1, 1,
-0.8064402, -0.1049808, -3.116214, 1, 1, 1, 1, 1,
-0.804678, -0.6629339, -0.7595751, 1, 1, 1, 1, 1,
-0.7931456, 0.1168232, -1.259252, 1, 1, 1, 1, 1,
-0.7925183, 0.4566645, -1.605213, 1, 1, 1, 1, 1,
-0.788711, 1.281176, 0.2642882, 1, 1, 1, 1, 1,
-0.7848671, 1.976179, 0.5110144, 1, 1, 1, 1, 1,
-0.7791743, 0.5791646, -1.659239, 1, 1, 1, 1, 1,
-0.773625, -0.2725902, -3.913655, 1, 1, 1, 1, 1,
-0.7726607, -1.127602, -2.500738, 1, 1, 1, 1, 1,
-0.7715873, -0.9788986, -2.473021, 1, 1, 1, 1, 1,
-0.77067, 0.08262544, -2.438833, 1, 1, 1, 1, 1,
-0.7705548, -2.72286, -1.312674, 1, 1, 1, 1, 1,
-0.757256, -0.3811357, -1.245531, 1, 1, 1, 1, 1,
-0.7529884, 1.157801, -0.7670586, 0, 0, 1, 1, 1,
-0.7511435, 0.6010656, -0.6195142, 1, 0, 0, 1, 1,
-0.7506534, 0.5901774, -0.6936308, 1, 0, 0, 1, 1,
-0.7476634, -1.456758, -1.862924, 1, 0, 0, 1, 1,
-0.7470763, 0.2363662, -2.793617, 1, 0, 0, 1, 1,
-0.7468917, -0.8224092, -3.086841, 1, 0, 0, 1, 1,
-0.7445243, 0.07352615, -2.156463, 0, 0, 0, 1, 1,
-0.7418276, 1.554045, 0.1858678, 0, 0, 0, 1, 1,
-0.7403983, 0.8814048, -2.800273, 0, 0, 0, 1, 1,
-0.7355892, -0.2370382, -1.366587, 0, 0, 0, 1, 1,
-0.7345077, 0.1147427, -0.1112099, 0, 0, 0, 1, 1,
-0.7304746, 0.608332, -1.37789, 0, 0, 0, 1, 1,
-0.7287993, -0.6708276, -2.32463, 0, 0, 0, 1, 1,
-0.7277954, -0.6591957, -2.916314, 1, 1, 1, 1, 1,
-0.7270526, 0.9971189, -0.1731664, 1, 1, 1, 1, 1,
-0.7193426, -0.1312811, -2.176708, 1, 1, 1, 1, 1,
-0.7173398, 0.9522297, -1.384795, 1, 1, 1, 1, 1,
-0.7162697, 0.5275074, -0.9935506, 1, 1, 1, 1, 1,
-0.7148108, 0.0851846, -1.807346, 1, 1, 1, 1, 1,
-0.7142476, -0.7247927, -2.151876, 1, 1, 1, 1, 1,
-0.7132886, -2.591807, -1.883022, 1, 1, 1, 1, 1,
-0.712865, -0.5082535, -2.450421, 1, 1, 1, 1, 1,
-0.7102139, -0.9437025, -3.385307, 1, 1, 1, 1, 1,
-0.7083244, -1.48828, -1.656183, 1, 1, 1, 1, 1,
-0.702751, 1.020761, -0.9883489, 1, 1, 1, 1, 1,
-0.6978151, -0.6659167, -0.9092214, 1, 1, 1, 1, 1,
-0.6944452, -0.6930188, -1.710884, 1, 1, 1, 1, 1,
-0.6921746, 1.37043, -0.1771827, 1, 1, 1, 1, 1,
-0.6916768, 1.977188, -1.31304, 0, 0, 1, 1, 1,
-0.6906517, -0.7484703, -2.981982, 1, 0, 0, 1, 1,
-0.6905707, 0.2127327, -1.622707, 1, 0, 0, 1, 1,
-0.6900465, -0.3451958, 1.263039, 1, 0, 0, 1, 1,
-0.6764237, -1.182707, -1.816726, 1, 0, 0, 1, 1,
-0.6764072, 0.6643278, -0.6743729, 1, 0, 0, 1, 1,
-0.6718504, 0.6966685, -1.946789, 0, 0, 0, 1, 1,
-0.6712972, -0.1763092, -2.232547, 0, 0, 0, 1, 1,
-0.6632988, 1.365831, -0.8176653, 0, 0, 0, 1, 1,
-0.6585594, 1.291414, -0.04453938, 0, 0, 0, 1, 1,
-0.6528859, -1.071936, -4.201516, 0, 0, 0, 1, 1,
-0.6492486, 1.274053, -0.4012769, 0, 0, 0, 1, 1,
-0.6484984, -1.663938, -2.687163, 0, 0, 0, 1, 1,
-0.6476415, 0.3053973, -1.135025, 1, 1, 1, 1, 1,
-0.6389236, 0.3744929, -1.271251, 1, 1, 1, 1, 1,
-0.6363563, -1.321071, -3.320153, 1, 1, 1, 1, 1,
-0.6343463, 0.8302419, 0.3803355, 1, 1, 1, 1, 1,
-0.6323116, 1.12626, -0.5344359, 1, 1, 1, 1, 1,
-0.6302405, 1.359521, -1.112241, 1, 1, 1, 1, 1,
-0.6293691, -0.1362421, -2.022288, 1, 1, 1, 1, 1,
-0.6285824, 0.0951104, -2.212319, 1, 1, 1, 1, 1,
-0.6284052, 0.4417206, -1.251566, 1, 1, 1, 1, 1,
-0.623647, 0.253841, -1.829394, 1, 1, 1, 1, 1,
-0.6198819, 0.1144474, -2.744287, 1, 1, 1, 1, 1,
-0.6180151, -0.3641348, -3.064668, 1, 1, 1, 1, 1,
-0.6152989, -2.193445, -3.184628, 1, 1, 1, 1, 1,
-0.6137852, -2.342656, -2.755011, 1, 1, 1, 1, 1,
-0.6109472, 0.2855418, -0.5168622, 1, 1, 1, 1, 1,
-0.6061558, 2.354738, -0.4284739, 0, 0, 1, 1, 1,
-0.6037619, -0.4098476, -1.62392, 1, 0, 0, 1, 1,
-0.6036115, -1.952754, -4.603886, 1, 0, 0, 1, 1,
-0.5930685, -0.2512607, -1.884536, 1, 0, 0, 1, 1,
-0.5906842, -2.449074, -1.993854, 1, 0, 0, 1, 1,
-0.5895295, -1.417645, -2.054674, 1, 0, 0, 1, 1,
-0.5822793, -0.4350112, -2.123217, 0, 0, 0, 1, 1,
-0.5805736, 0.4738818, -2.482382, 0, 0, 0, 1, 1,
-0.5802544, -1.432091, -3.329254, 0, 0, 0, 1, 1,
-0.5798773, 0.2876834, -1.082333, 0, 0, 0, 1, 1,
-0.5789728, 0.4272981, -0.594049, 0, 0, 0, 1, 1,
-0.5788348, -0.4301856, -0.8992416, 0, 0, 0, 1, 1,
-0.5763582, -1.39708, -1.798529, 0, 0, 0, 1, 1,
-0.5762053, -0.1683019, -2.083194, 1, 1, 1, 1, 1,
-0.5733779, 0.2387462, -0.9970745, 1, 1, 1, 1, 1,
-0.5693699, -0.6029562, -2.390137, 1, 1, 1, 1, 1,
-0.5689057, 0.5578994, -0.01328035, 1, 1, 1, 1, 1,
-0.566285, -0.1617989, -3.307846, 1, 1, 1, 1, 1,
-0.5657252, 0.5007629, 0.0166673, 1, 1, 1, 1, 1,
-0.5650438, -0.05319681, -1.01242, 1, 1, 1, 1, 1,
-0.5524533, 0.4986577, -3.816182, 1, 1, 1, 1, 1,
-0.5518869, 1.212512, -0.6099458, 1, 1, 1, 1, 1,
-0.5486647, -1.062845, -4.066182, 1, 1, 1, 1, 1,
-0.5479966, 1.434302, -1.63791, 1, 1, 1, 1, 1,
-0.5458971, -0.4025493, -3.817304, 1, 1, 1, 1, 1,
-0.5442061, -0.02674675, -2.360398, 1, 1, 1, 1, 1,
-0.5294527, -0.05063204, -0.1168574, 1, 1, 1, 1, 1,
-0.5291708, -1.337973, -3.2746, 1, 1, 1, 1, 1,
-0.5246907, -0.1376074, -4.304845, 0, 0, 1, 1, 1,
-0.5217164, -0.1203661, -1.958618, 1, 0, 0, 1, 1,
-0.5212094, -1.056735, -3.933636, 1, 0, 0, 1, 1,
-0.5188122, 0.1923321, -1.111889, 1, 0, 0, 1, 1,
-0.5186552, 1.224107, -1.012033, 1, 0, 0, 1, 1,
-0.5166582, -0.4572289, -0.5731678, 1, 0, 0, 1, 1,
-0.5127301, 0.03992514, -2.875177, 0, 0, 0, 1, 1,
-0.5081186, 0.03563876, -0.5416403, 0, 0, 0, 1, 1,
-0.4958552, -0.1738547, -2.355041, 0, 0, 0, 1, 1,
-0.4927012, -0.4004245, -0.5893531, 0, 0, 0, 1, 1,
-0.4926872, 1.954105, 0.6778346, 0, 0, 0, 1, 1,
-0.4907752, -0.8211086, -3.473306, 0, 0, 0, 1, 1,
-0.4905257, 1.006665, 0.02253013, 0, 0, 0, 1, 1,
-0.4885177, 0.8723288, -1.501238, 1, 1, 1, 1, 1,
-0.4883601, 1.90321, -1.024522, 1, 1, 1, 1, 1,
-0.485711, -0.1341232, -1.970356, 1, 1, 1, 1, 1,
-0.4785385, 0.4374036, -1.013707, 1, 1, 1, 1, 1,
-0.478287, 2.602265, -1.240129, 1, 1, 1, 1, 1,
-0.4779572, -1.114075, -3.779884, 1, 1, 1, 1, 1,
-0.4751467, -0.0408883, -1.011581, 1, 1, 1, 1, 1,
-0.4713673, -1.523427, -3.149668, 1, 1, 1, 1, 1,
-0.4672458, 0.7553586, 0.4494694, 1, 1, 1, 1, 1,
-0.4631685, 1.214102, 0.293681, 1, 1, 1, 1, 1,
-0.4623101, -0.4129749, -2.341618, 1, 1, 1, 1, 1,
-0.4609362, 0.3707772, -0.7518734, 1, 1, 1, 1, 1,
-0.4596343, 2.002392, -0.7654969, 1, 1, 1, 1, 1,
-0.4572721, 2.191278, -0.04087854, 1, 1, 1, 1, 1,
-0.4494279, 0.7885426, -1.097744, 1, 1, 1, 1, 1,
-0.4470972, 0.7816533, -0.6094152, 0, 0, 1, 1, 1,
-0.4465581, -0.5712138, -1.978402, 1, 0, 0, 1, 1,
-0.4464595, -0.1124432, -3.010715, 1, 0, 0, 1, 1,
-0.437756, -1.506331, -2.486703, 1, 0, 0, 1, 1,
-0.4361323, 1.032525, -0.1582916, 1, 0, 0, 1, 1,
-0.434962, 1.489094, 1.49078, 1, 0, 0, 1, 1,
-0.4249403, -2.034787, -4.116458, 0, 0, 0, 1, 1,
-0.4243491, -0.2805402, -3.080542, 0, 0, 0, 1, 1,
-0.424051, -0.3613325, -1.996011, 0, 0, 0, 1, 1,
-0.4210385, 0.1172823, -0.887139, 0, 0, 0, 1, 1,
-0.4196106, -0.1163592, -1.183945, 0, 0, 0, 1, 1,
-0.4185396, -0.1055356, -3.146349, 0, 0, 0, 1, 1,
-0.4172968, 0.1654593, -0.742097, 0, 0, 0, 1, 1,
-0.4165511, 0.1146942, -1.613894, 1, 1, 1, 1, 1,
-0.4165247, -0.4726007, -3.971579, 1, 1, 1, 1, 1,
-0.4152663, 1.070474, -0.9071798, 1, 1, 1, 1, 1,
-0.4146994, 1.193484, -1.86196, 1, 1, 1, 1, 1,
-0.4085632, 0.2090153, -0.1292379, 1, 1, 1, 1, 1,
-0.4077483, 0.7509944, -0.2042031, 1, 1, 1, 1, 1,
-0.4036442, -1.194769, -3.803649, 1, 1, 1, 1, 1,
-0.4035066, 0.004823793, -1.065987, 1, 1, 1, 1, 1,
-0.3997575, -0.8597767, -2.45985, 1, 1, 1, 1, 1,
-0.3982302, 1.743242, 1.259231, 1, 1, 1, 1, 1,
-0.3977254, -0.1356757, -1.749805, 1, 1, 1, 1, 1,
-0.3934428, 0.3947757, -1.133454, 1, 1, 1, 1, 1,
-0.3910318, -0.4634715, -2.519479, 1, 1, 1, 1, 1,
-0.3866279, 0.4141002, -0.4791114, 1, 1, 1, 1, 1,
-0.3837973, 0.1831654, -0.002614502, 1, 1, 1, 1, 1,
-0.3787117, 0.9032006, 0.7425435, 0, 0, 1, 1, 1,
-0.376735, 0.4940747, -0.2234805, 1, 0, 0, 1, 1,
-0.3715473, 0.2340747, -0.7163844, 1, 0, 0, 1, 1,
-0.3629817, -0.03553973, -1.976934, 1, 0, 0, 1, 1,
-0.3619457, -1.072296, -2.391693, 1, 0, 0, 1, 1,
-0.3610882, 0.1156316, -2.221127, 1, 0, 0, 1, 1,
-0.3590692, -0.03644565, -2.371014, 0, 0, 0, 1, 1,
-0.346416, 0.3291695, -1.308702, 0, 0, 0, 1, 1,
-0.3411715, -0.2446506, -2.868762, 0, 0, 0, 1, 1,
-0.3387666, -0.2070518, -1.049185, 0, 0, 0, 1, 1,
-0.33343, -1.182955, -3.535205, 0, 0, 0, 1, 1,
-0.3327145, 0.476777, -0.5648862, 0, 0, 0, 1, 1,
-0.3325022, 0.4204723, -0.945511, 0, 0, 0, 1, 1,
-0.331822, 2.193416, -1.379861, 1, 1, 1, 1, 1,
-0.330916, -2.511185, -1.579038, 1, 1, 1, 1, 1,
-0.3296712, -1.209525, -3.843573, 1, 1, 1, 1, 1,
-0.3285549, -0.7932916, -2.072482, 1, 1, 1, 1, 1,
-0.3259498, -1.10858, -2.324757, 1, 1, 1, 1, 1,
-0.3246009, -0.3258447, -3.273932, 1, 1, 1, 1, 1,
-0.3225802, -0.5885664, -1.133741, 1, 1, 1, 1, 1,
-0.3222275, -0.3745087, -3.228813, 1, 1, 1, 1, 1,
-0.3210313, -0.4383717, -2.616098, 1, 1, 1, 1, 1,
-0.3207209, 0.6345512, -0.9552743, 1, 1, 1, 1, 1,
-0.3193307, -0.5544736, -1.445419, 1, 1, 1, 1, 1,
-0.3192227, -2.707313, -2.521132, 1, 1, 1, 1, 1,
-0.3152438, 0.4588278, -0.5934349, 1, 1, 1, 1, 1,
-0.3140778, -1.026482, -5.252772, 1, 1, 1, 1, 1,
-0.3116913, -0.3274082, -1.805769, 1, 1, 1, 1, 1,
-0.3110923, -0.3746824, -2.37753, 0, 0, 1, 1, 1,
-0.3071431, -0.4930499, -3.785446, 1, 0, 0, 1, 1,
-0.3060937, 0.9857733, 1.827978, 1, 0, 0, 1, 1,
-0.3060014, -0.06404527, -0.7859797, 1, 0, 0, 1, 1,
-0.2999589, 0.01951194, -1.301387, 1, 0, 0, 1, 1,
-0.2969426, -1.06231, -3.288291, 1, 0, 0, 1, 1,
-0.2964624, -0.7607845, -1.567555, 0, 0, 0, 1, 1,
-0.2945335, -0.03579178, -1.327173, 0, 0, 0, 1, 1,
-0.2904652, -1.058276, -3.417944, 0, 0, 0, 1, 1,
-0.2886164, 1.17435, -1.765206, 0, 0, 0, 1, 1,
-0.2876052, 0.4937128, -0.6716247, 0, 0, 0, 1, 1,
-0.2858261, 1.804182, -1.133536, 0, 0, 0, 1, 1,
-0.2828179, -0.2049211, -1.432226, 0, 0, 0, 1, 1,
-0.2753443, -0.6977149, -3.584971, 1, 1, 1, 1, 1,
-0.2687602, 0.9919685, 0.6473939, 1, 1, 1, 1, 1,
-0.2649599, 2.173764, -1.310365, 1, 1, 1, 1, 1,
-0.2645831, 0.9024416, -0.07098347, 1, 1, 1, 1, 1,
-0.2632661, 0.07484636, -1.150602, 1, 1, 1, 1, 1,
-0.2618274, 0.8837107, 0.2676045, 1, 1, 1, 1, 1,
-0.2592033, 0.4303146, -0.9539562, 1, 1, 1, 1, 1,
-0.2496896, -1.08046, -1.448169, 1, 1, 1, 1, 1,
-0.2489932, -0.6445978, -3.812474, 1, 1, 1, 1, 1,
-0.2459972, 0.0453379, -2.828179, 1, 1, 1, 1, 1,
-0.2453152, 0.2290187, -2.498151, 1, 1, 1, 1, 1,
-0.2431917, -1.382437, -3.118082, 1, 1, 1, 1, 1,
-0.2427219, 1.026761, 0.698587, 1, 1, 1, 1, 1,
-0.2401544, 0.4438314, 0.9715451, 1, 1, 1, 1, 1,
-0.2360351, -1.677931, -2.869053, 1, 1, 1, 1, 1,
-0.2343494, 0.9688669, -0.03904148, 0, 0, 1, 1, 1,
-0.2335347, 0.07789306, -1.577588, 1, 0, 0, 1, 1,
-0.232383, -1.154334, -2.935651, 1, 0, 0, 1, 1,
-0.2302404, 1.328655, -1.746724, 1, 0, 0, 1, 1,
-0.2300302, -0.3839018, -2.240152, 1, 0, 0, 1, 1,
-0.2249042, -0.2581736, -2.282121, 1, 0, 0, 1, 1,
-0.2238034, 1.96737, 1.729437, 0, 0, 0, 1, 1,
-0.2224503, -2.195678, -0.904043, 0, 0, 0, 1, 1,
-0.2199032, -0.7728186, -2.241493, 0, 0, 0, 1, 1,
-0.2184438, 0.5529391, 0.5318999, 0, 0, 0, 1, 1,
-0.2168883, -0.3694791, -0.9324658, 0, 0, 0, 1, 1,
-0.2029493, -0.7958481, -2.523711, 0, 0, 0, 1, 1,
-0.2025425, 2.149409, 0.904182, 0, 0, 0, 1, 1,
-0.1990721, 0.02313636, -1.74055, 1, 1, 1, 1, 1,
-0.1988006, 0.8361142, 0.2337755, 1, 1, 1, 1, 1,
-0.1959856, -0.6648907, -2.889803, 1, 1, 1, 1, 1,
-0.1954153, 0.08912963, -1.554531, 1, 1, 1, 1, 1,
-0.1911001, 0.438005, -1.147633, 1, 1, 1, 1, 1,
-0.1909015, -0.8996341, -3.886672, 1, 1, 1, 1, 1,
-0.1879309, -0.6554356, -3.37483, 1, 1, 1, 1, 1,
-0.1854885, -2.23171, -1.827119, 1, 1, 1, 1, 1,
-0.1818326, 0.5340062, -1.302058, 1, 1, 1, 1, 1,
-0.1797365, 0.4328384, -1.663967, 1, 1, 1, 1, 1,
-0.1791731, 0.7203791, -1.841594, 1, 1, 1, 1, 1,
-0.1762627, 0.6070538, -1.329795, 1, 1, 1, 1, 1,
-0.1706598, 1.145563, -0.3110531, 1, 1, 1, 1, 1,
-0.1700607, 0.06332657, -0.803171, 1, 1, 1, 1, 1,
-0.1684545, -0.3535128, -2.008761, 1, 1, 1, 1, 1,
-0.1629408, -0.4023725, -5.14029, 0, 0, 1, 1, 1,
-0.1623273, -0.4431356, -2.518379, 1, 0, 0, 1, 1,
-0.1577044, 0.2582521, 1.313969, 1, 0, 0, 1, 1,
-0.149136, -0.5846604, -2.690056, 1, 0, 0, 1, 1,
-0.1462782, 0.3734889, 0.7426738, 1, 0, 0, 1, 1,
-0.1439404, -0.6332667, -4.706035, 1, 0, 0, 1, 1,
-0.138159, -0.4779819, -3.057349, 0, 0, 0, 1, 1,
-0.1377914, -0.06587997, -4.188047, 0, 0, 0, 1, 1,
-0.1370903, 0.1673079, -0.7146172, 0, 0, 0, 1, 1,
-0.1363656, -0.5126232, -2.99647, 0, 0, 0, 1, 1,
-0.1346077, 0.1212803, 0.4499804, 0, 0, 0, 1, 1,
-0.1329419, -1.279598, -3.812993, 0, 0, 0, 1, 1,
-0.1326689, -0.3396055, -3.266496, 0, 0, 0, 1, 1,
-0.1293897, 0.8748642, -3.695107, 1, 1, 1, 1, 1,
-0.1292327, 0.4057199, 2.054509, 1, 1, 1, 1, 1,
-0.1253503, 1.246476, -0.2132542, 1, 1, 1, 1, 1,
-0.1244595, 1.687195, 0.2760491, 1, 1, 1, 1, 1,
-0.1218171, 1.889892, -0.09354729, 1, 1, 1, 1, 1,
-0.1199383, 0.8111309, -0.8068159, 1, 1, 1, 1, 1,
-0.1129567, -0.682924, -0.9882224, 1, 1, 1, 1, 1,
-0.1128444, 0.4329259, 1.333188, 1, 1, 1, 1, 1,
-0.1104812, -0.4099866, -4.146609, 1, 1, 1, 1, 1,
-0.1087442, -0.3739967, -1.992465, 1, 1, 1, 1, 1,
-0.1079497, 0.9330059, -0.2089304, 1, 1, 1, 1, 1,
-0.1033601, -0.2076564, -1.441907, 1, 1, 1, 1, 1,
-0.1024594, 1.844502, -0.708594, 1, 1, 1, 1, 1,
-0.09014109, 0.8691989, 1.42933, 1, 1, 1, 1, 1,
-0.0881246, 0.03160307, -1.251811, 1, 1, 1, 1, 1,
-0.08738888, -1.025055, -2.183427, 0, 0, 1, 1, 1,
-0.0864504, 1.658034, 0.3254525, 1, 0, 0, 1, 1,
-0.08512679, 1.365539, -0.0578576, 1, 0, 0, 1, 1,
-0.07383281, 0.5473638, -0.1406229, 1, 0, 0, 1, 1,
-0.07316405, -0.8048549, -3.308515, 1, 0, 0, 1, 1,
-0.07138529, -0.7309363, -4.408488, 1, 0, 0, 1, 1,
-0.06969797, 0.1831237, 1.467993, 0, 0, 0, 1, 1,
-0.06473695, -0.6910049, -2.685889, 0, 0, 0, 1, 1,
-0.05692578, 0.3852978, -2.126639, 0, 0, 0, 1, 1,
-0.05595402, 0.02854874, -1.392169, 0, 0, 0, 1, 1,
-0.05544969, 0.3676456, 0.6797649, 0, 0, 0, 1, 1,
-0.04786557, 0.3862811, -0.3676057, 0, 0, 0, 1, 1,
-0.0452186, 0.5052868, -0.2798085, 0, 0, 0, 1, 1,
-0.04118853, 0.5976917, -0.003130581, 1, 1, 1, 1, 1,
-0.04025953, 0.2792757, 0.6140139, 1, 1, 1, 1, 1,
-0.03733007, 0.1714965, -0.3433264, 1, 1, 1, 1, 1,
-0.03537257, -1.736915, -4.663153, 1, 1, 1, 1, 1,
-0.03370402, 0.8143395, 1.609824, 1, 1, 1, 1, 1,
-0.02828718, 1.291956, -1.061086, 1, 1, 1, 1, 1,
-0.02747775, 0.7682555, 1.209622, 1, 1, 1, 1, 1,
-0.02173581, 0.6859206, -0.2754339, 1, 1, 1, 1, 1,
-0.01889829, 0.04769187, 1.103988, 1, 1, 1, 1, 1,
-0.01780151, -0.2692472, -1.367095, 1, 1, 1, 1, 1,
-0.01632088, -0.8750955, -2.506807, 1, 1, 1, 1, 1,
-0.01531671, -0.2978769, -1.42308, 1, 1, 1, 1, 1,
-0.01345761, -0.406045, -3.582991, 1, 1, 1, 1, 1,
-0.01219059, 0.3974637, 1.044212, 1, 1, 1, 1, 1,
-0.01175401, -0.05693078, -2.526523, 1, 1, 1, 1, 1,
-0.01134786, 0.06540871, -0.601954, 0, 0, 1, 1, 1,
-0.00630785, 0.6979541, 1.552705, 1, 0, 0, 1, 1,
-0.006214005, 0.6338881, 1.605821, 1, 0, 0, 1, 1,
-0.003152158, 1.426639, 1.817188, 1, 0, 0, 1, 1,
-0.002127539, -1.708392, -4.357865, 1, 0, 0, 1, 1,
0.001218109, -0.03673358, 4.109771, 1, 0, 0, 1, 1,
0.005506461, -0.1909559, 4.081749, 0, 0, 0, 1, 1,
0.00972504, -0.654766, 2.988542, 0, 0, 0, 1, 1,
0.01041241, -0.059709, 1.804497, 0, 0, 0, 1, 1,
0.01307266, -1.075324, 3.479581, 0, 0, 0, 1, 1,
0.01672189, 1.68801, -1.958427, 0, 0, 0, 1, 1,
0.01801066, 0.8940768, -0.5955739, 0, 0, 0, 1, 1,
0.01861328, 0.8771232, 1.118395, 0, 0, 0, 1, 1,
0.02233469, 0.6061863, -0.03006867, 1, 1, 1, 1, 1,
0.02916135, -0.9411883, 3.555094, 1, 1, 1, 1, 1,
0.03666861, -0.2835385, 1.942509, 1, 1, 1, 1, 1,
0.03787309, -0.1901656, 2.971756, 1, 1, 1, 1, 1,
0.03945969, -0.1734294, 3.338796, 1, 1, 1, 1, 1,
0.03984187, -0.3944362, 3.357013, 1, 1, 1, 1, 1,
0.03993291, 1.491464, 0.8132656, 1, 1, 1, 1, 1,
0.04213115, -0.1191707, 1.22362, 1, 1, 1, 1, 1,
0.04656284, -0.05459659, 2.669295, 1, 1, 1, 1, 1,
0.05453515, -0.001044975, 1.382524, 1, 1, 1, 1, 1,
0.05467596, 1.021485, -0.3226871, 1, 1, 1, 1, 1,
0.05779589, -1.333677, 1.583161, 1, 1, 1, 1, 1,
0.06085521, -1.090446, 2.013978, 1, 1, 1, 1, 1,
0.0611766, 0.2952008, 0.8199525, 1, 1, 1, 1, 1,
0.06358419, 0.1185887, -1.111834, 1, 1, 1, 1, 1,
0.06573827, 0.5917984, 2.031723, 0, 0, 1, 1, 1,
0.06703965, 0.6167393, -0.3651895, 1, 0, 0, 1, 1,
0.06946527, -0.2241607, 2.934447, 1, 0, 0, 1, 1,
0.07127156, -0.8743599, 2.784333, 1, 0, 0, 1, 1,
0.07448274, 0.5625547, -0.6682646, 1, 0, 0, 1, 1,
0.07458418, 0.4633531, -1.089218, 1, 0, 0, 1, 1,
0.07488587, 0.1680088, 1.676795, 0, 0, 0, 1, 1,
0.07528768, -0.3744979, 2.314412, 0, 0, 0, 1, 1,
0.07767609, -0.3455077, 2.027351, 0, 0, 0, 1, 1,
0.08264928, -1.438064, 3.725349, 0, 0, 0, 1, 1,
0.08302139, 0.6236896, 0.814133, 0, 0, 0, 1, 1,
0.0854385, -0.45553, 3.967242, 0, 0, 0, 1, 1,
0.08613293, 1.026131, -0.1932907, 0, 0, 0, 1, 1,
0.08697013, -1.443646, 4.295846, 1, 1, 1, 1, 1,
0.08735663, -1.519415, 3.587569, 1, 1, 1, 1, 1,
0.08979639, -1.239758, 1.939606, 1, 1, 1, 1, 1,
0.09537152, 1.368734, 1.821741, 1, 1, 1, 1, 1,
0.1019637, -0.6115304, 1.578377, 1, 1, 1, 1, 1,
0.1107799, 0.5185009, 0.06866548, 1, 1, 1, 1, 1,
0.1222485, 0.02806026, 1.203363, 1, 1, 1, 1, 1,
0.1242898, 0.7624204, 1.00801, 1, 1, 1, 1, 1,
0.1328099, -0.2250534, 2.255319, 1, 1, 1, 1, 1,
0.1334031, -0.9153285, 3.133548, 1, 1, 1, 1, 1,
0.1360404, 0.369169, 0.5522892, 1, 1, 1, 1, 1,
0.1364591, -0.2826306, 2.97144, 1, 1, 1, 1, 1,
0.1405711, 0.9502462, -0.8876663, 1, 1, 1, 1, 1,
0.1445176, -0.6528475, 2.294282, 1, 1, 1, 1, 1,
0.1521613, 0.01144205, 1.169022, 1, 1, 1, 1, 1,
0.1527605, -0.3168246, 2.151807, 0, 0, 1, 1, 1,
0.1551907, -0.9783768, 4.252136, 1, 0, 0, 1, 1,
0.1580455, 1.005383, -1.576333, 1, 0, 0, 1, 1,
0.1583967, -0.4271315, 1.150891, 1, 0, 0, 1, 1,
0.1644053, -0.7079561, 2.282445, 1, 0, 0, 1, 1,
0.1648165, -1.078062, 1.785774, 1, 0, 0, 1, 1,
0.1686022, 1.543834, 1.068384, 0, 0, 0, 1, 1,
0.1702821, 0.6760338, -0.847153, 0, 0, 0, 1, 1,
0.170387, -1.304267, 2.883603, 0, 0, 0, 1, 1,
0.1704496, -0.9402041, 3.302154, 0, 0, 0, 1, 1,
0.1714028, -1.449802, 3.70784, 0, 0, 0, 1, 1,
0.1720636, 1.437861, 0.7159706, 0, 0, 0, 1, 1,
0.1747507, -0.2271828, 2.563363, 0, 0, 0, 1, 1,
0.179721, -0.06283855, 2.324568, 1, 1, 1, 1, 1,
0.1832863, -0.1091932, 3.492133, 1, 1, 1, 1, 1,
0.1837241, -1.546722, 3.336297, 1, 1, 1, 1, 1,
0.1864296, 1.1852, 0.8933989, 1, 1, 1, 1, 1,
0.1907929, -0.3345713, 1.893045, 1, 1, 1, 1, 1,
0.1943328, 1.235098, 1.921836, 1, 1, 1, 1, 1,
0.1972017, -0.3063322, 4.49359, 1, 1, 1, 1, 1,
0.1978871, 0.04511604, 1.033016, 1, 1, 1, 1, 1,
0.201291, 1.972301, 0.4851924, 1, 1, 1, 1, 1,
0.2014475, -0.2629865, 3.684092, 1, 1, 1, 1, 1,
0.2014945, 0.09545753, 3.741397, 1, 1, 1, 1, 1,
0.2037356, -0.008182742, 2.054882, 1, 1, 1, 1, 1,
0.2049671, -0.5578182, 3.73553, 1, 1, 1, 1, 1,
0.2117494, 0.1962513, 2.470725, 1, 1, 1, 1, 1,
0.2133483, 0.1793798, 0.946484, 1, 1, 1, 1, 1,
0.2170204, 1.611652, -1.675331, 0, 0, 1, 1, 1,
0.2194228, -0.2600631, 2.494853, 1, 0, 0, 1, 1,
0.2235473, -0.06515577, 1.936329, 1, 0, 0, 1, 1,
0.2236755, 1.903153, -1.248577, 1, 0, 0, 1, 1,
0.2247432, 0.7863784, 0.08464042, 1, 0, 0, 1, 1,
0.2257192, 1.09482, -0.5198561, 1, 0, 0, 1, 1,
0.2266, -1.407495, 1.188319, 0, 0, 0, 1, 1,
0.2298403, 0.7466244, 2.018476, 0, 0, 0, 1, 1,
0.2344553, 1.206789, -1.005374, 0, 0, 0, 1, 1,
0.2372797, -0.737057, 3.114466, 0, 0, 0, 1, 1,
0.2381763, -0.3525252, 0.8972842, 0, 0, 0, 1, 1,
0.2388092, 0.329146, -0.2132336, 0, 0, 0, 1, 1,
0.2406099, 1.187326, -0.8396008, 0, 0, 0, 1, 1,
0.245445, -0.0450099, 2.285095, 1, 1, 1, 1, 1,
0.2472753, -1.430621, 1.675038, 1, 1, 1, 1, 1,
0.249003, -0.9696463, 2.633719, 1, 1, 1, 1, 1,
0.2527558, -0.6426383, 1.63175, 1, 1, 1, 1, 1,
0.2549256, 0.4824516, 1.34757, 1, 1, 1, 1, 1,
0.2585234, 0.5845903, -0.7610082, 1, 1, 1, 1, 1,
0.2613386, -0.4049693, 1.18649, 1, 1, 1, 1, 1,
0.2620845, -0.3555599, 1.425833, 1, 1, 1, 1, 1,
0.2640945, 0.792354, -1.368207, 1, 1, 1, 1, 1,
0.2662738, -1.791904, 2.17639, 1, 1, 1, 1, 1,
0.2674271, 0.3907589, 1.096972, 1, 1, 1, 1, 1,
0.2682956, -0.8926248, 2.793287, 1, 1, 1, 1, 1,
0.2684106, -1.592106, 3.911263, 1, 1, 1, 1, 1,
0.2691734, -0.5145125, 3.176462, 1, 1, 1, 1, 1,
0.2781329, 0.3931592, -0.2200011, 1, 1, 1, 1, 1,
0.2781694, 1.332416, -0.4255061, 0, 0, 1, 1, 1,
0.2803357, -1.032565, 1.710917, 1, 0, 0, 1, 1,
0.2805751, -1.326772, 2.246479, 1, 0, 0, 1, 1,
0.2876038, 0.5763377, -0.004832092, 1, 0, 0, 1, 1,
0.2936982, 0.2663387, -0.04308739, 1, 0, 0, 1, 1,
0.2978692, 0.3338606, -1.22676, 1, 0, 0, 1, 1,
0.297931, -0.165444, 1.403421, 0, 0, 0, 1, 1,
0.2979997, 0.7197919, 0.9325416, 0, 0, 0, 1, 1,
0.2988685, 1.014405, -1.559681, 0, 0, 0, 1, 1,
0.300369, -0.7714306, 2.142177, 0, 0, 0, 1, 1,
0.3018123, -0.265055, 1.009555, 0, 0, 0, 1, 1,
0.3071565, 2.780236, 0.4064116, 0, 0, 0, 1, 1,
0.3092633, -0.9579872, 1.305082, 0, 0, 0, 1, 1,
0.3121662, 0.4874637, 0.9584542, 1, 1, 1, 1, 1,
0.3136922, -1.378801, 3.044441, 1, 1, 1, 1, 1,
0.313767, 0.05945674, 0.7673593, 1, 1, 1, 1, 1,
0.3143225, 0.5979, 1.139329, 1, 1, 1, 1, 1,
0.3150397, -2.271911, 2.673953, 1, 1, 1, 1, 1,
0.3160032, 0.08853887, 0.7972344, 1, 1, 1, 1, 1,
0.3185962, 0.4268548, 0.5490748, 1, 1, 1, 1, 1,
0.3204948, -0.26785, 3.853787, 1, 1, 1, 1, 1,
0.3223436, -1.295689, 4.104249, 1, 1, 1, 1, 1,
0.3243293, -0.2538759, 2.163881, 1, 1, 1, 1, 1,
0.3245168, -0.8953298, 1.333983, 1, 1, 1, 1, 1,
0.3257091, 0.7947682, -1.084898, 1, 1, 1, 1, 1,
0.3326603, 1.402649, 1.153381, 1, 1, 1, 1, 1,
0.3336055, 0.9558124, -0.7068505, 1, 1, 1, 1, 1,
0.3340298, -0.7704524, 1.874128, 1, 1, 1, 1, 1,
0.3347998, 0.9071637, -0.02897398, 0, 0, 1, 1, 1,
0.3376301, -1.151185, 3.032213, 1, 0, 0, 1, 1,
0.3395951, 0.4489808, 2.277489, 1, 0, 0, 1, 1,
0.3413866, -2.407368, 2.281219, 1, 0, 0, 1, 1,
0.3435738, 0.7040924, 1.100489, 1, 0, 0, 1, 1,
0.3439628, -0.4610153, 3.60698, 1, 0, 0, 1, 1,
0.3474764, 0.9992666, 0.7827122, 0, 0, 0, 1, 1,
0.3497611, -1.382246, 3.035221, 0, 0, 0, 1, 1,
0.3535484, 1.66942, -0.1174135, 0, 0, 0, 1, 1,
0.3543735, 0.006159449, 3.34036, 0, 0, 0, 1, 1,
0.3548894, -0.6653298, 3.568289, 0, 0, 0, 1, 1,
0.3560529, -1.767182, 6.126623, 0, 0, 0, 1, 1,
0.3566075, 0.09335598, 0.5916501, 0, 0, 0, 1, 1,
0.3577861, -1.312761, 2.809176, 1, 1, 1, 1, 1,
0.3586293, -0.414791, 1.97772, 1, 1, 1, 1, 1,
0.3610888, 0.9669155, 0.9895034, 1, 1, 1, 1, 1,
0.3614667, -0.03406661, 3.175685, 1, 1, 1, 1, 1,
0.3661851, 1.803833, -1.034599, 1, 1, 1, 1, 1,
0.3818342, 0.7032611, 0.01715066, 1, 1, 1, 1, 1,
0.3877695, -0.4759544, 2.028153, 1, 1, 1, 1, 1,
0.3892418, 1.327479, -0.6177356, 1, 1, 1, 1, 1,
0.3948803, -0.7118065, 2.097388, 1, 1, 1, 1, 1,
0.3964714, -1.088134, 3.519577, 1, 1, 1, 1, 1,
0.3989642, -1.206124, 3.281535, 1, 1, 1, 1, 1,
0.4061531, -1.572479, 2.872077, 1, 1, 1, 1, 1,
0.4118142, -1.019495, 4.172033, 1, 1, 1, 1, 1,
0.4119285, 0.1000951, -0.8311597, 1, 1, 1, 1, 1,
0.4142841, -0.4275664, 3.120567, 1, 1, 1, 1, 1,
0.4169707, 0.305514, 0.5435379, 0, 0, 1, 1, 1,
0.4176848, 1.056388, 0.5880641, 1, 0, 0, 1, 1,
0.4196779, 1.264635, -0.003402334, 1, 0, 0, 1, 1,
0.4244405, 1.307955, 0.3337611, 1, 0, 0, 1, 1,
0.4275968, -0.8655211, 2.144774, 1, 0, 0, 1, 1,
0.4289019, 0.4493099, 2.072597, 1, 0, 0, 1, 1,
0.4305125, -0.8248375, 1.716563, 0, 0, 0, 1, 1,
0.436199, 1.896087, 1.26451, 0, 0, 0, 1, 1,
0.4458798, 0.9240761, -1.252775, 0, 0, 0, 1, 1,
0.4462852, -0.645398, 1.791528, 0, 0, 0, 1, 1,
0.4498653, -0.2881117, 3.601312, 0, 0, 0, 1, 1,
0.4549589, 1.189817, 1.151047, 0, 0, 0, 1, 1,
0.456539, -0.8773158, 1.327701, 0, 0, 0, 1, 1,
0.4574166, 2.182082, -1.10707, 1, 1, 1, 1, 1,
0.4581534, 1.734379, 0.6012392, 1, 1, 1, 1, 1,
0.4606453, -0.7694534, 1.864406, 1, 1, 1, 1, 1,
0.4623304, 0.6371557, 0.8486043, 1, 1, 1, 1, 1,
0.4639693, 0.5775203, 0.05405815, 1, 1, 1, 1, 1,
0.4658372, -1.909418, 2.014648, 1, 1, 1, 1, 1,
0.4698436, -1.131171, 2.23339, 1, 1, 1, 1, 1,
0.4775278, -0.4873205, 3.984566, 1, 1, 1, 1, 1,
0.4790178, 0.6053038, 0.149217, 1, 1, 1, 1, 1,
0.4790209, 0.4325656, 2.621916, 1, 1, 1, 1, 1,
0.480287, 0.2809904, 1.786433, 1, 1, 1, 1, 1,
0.4825172, -0.7411026, 3.225717, 1, 1, 1, 1, 1,
0.482641, 0.6237147, -0.09015498, 1, 1, 1, 1, 1,
0.4977584, -0.2188876, 2.64301, 1, 1, 1, 1, 1,
0.4997536, 0.07145232, 4.058906, 1, 1, 1, 1, 1,
0.5059218, -1.206051, 1.260881, 0, 0, 1, 1, 1,
0.5067344, -2.300183, 1.286323, 1, 0, 0, 1, 1,
0.5069928, -1.371697, 2.41824, 1, 0, 0, 1, 1,
0.5097858, 0.2836676, 0.9471375, 1, 0, 0, 1, 1,
0.511164, -0.3516004, 0.5263652, 1, 0, 0, 1, 1,
0.5143621, -0.6027794, 2.192543, 1, 0, 0, 1, 1,
0.5209967, -0.2251492, 0.4474274, 0, 0, 0, 1, 1,
0.525461, -0.9392198, 4.060014, 0, 0, 0, 1, 1,
0.5308248, -0.3953232, 2.112522, 0, 0, 0, 1, 1,
0.5317669, 0.1148938, 0.3046407, 0, 0, 0, 1, 1,
0.5318882, 0.6594267, -1.311642, 0, 0, 0, 1, 1,
0.5421627, 0.775911, -0.2232395, 0, 0, 0, 1, 1,
0.5455555, -1.703937, 2.408627, 0, 0, 0, 1, 1,
0.5482193, 0.7853255, 1.630278, 1, 1, 1, 1, 1,
0.5538322, -1.370486, 2.261219, 1, 1, 1, 1, 1,
0.5538926, -0.9260065, 3.627656, 1, 1, 1, 1, 1,
0.5628302, 2.069265, 2.064027, 1, 1, 1, 1, 1,
0.5657791, -0.3479742, 1.11602, 1, 1, 1, 1, 1,
0.5678881, -0.01793739, 0.6700231, 1, 1, 1, 1, 1,
0.5737587, -0.7897469, 1.724172, 1, 1, 1, 1, 1,
0.573818, 0.5360649, 0.2703952, 1, 1, 1, 1, 1,
0.5799674, 0.04130648, 0.6349792, 1, 1, 1, 1, 1,
0.5876517, 1.14677, 0.3770548, 1, 1, 1, 1, 1,
0.5895759, 1.59462, 1.798879, 1, 1, 1, 1, 1,
0.5910676, -0.06490915, 0.06237236, 1, 1, 1, 1, 1,
0.5980079, -1.031132, 3.501522, 1, 1, 1, 1, 1,
0.6069523, -0.02293772, 1.294883, 1, 1, 1, 1, 1,
0.6069987, -1.093051, 1.47192, 1, 1, 1, 1, 1,
0.6107309, -0.2008931, 0.7181305, 0, 0, 1, 1, 1,
0.6156922, -0.4649396, 0.7854828, 1, 0, 0, 1, 1,
0.6217704, 0.3244884, -0.2373447, 1, 0, 0, 1, 1,
0.6263778, -0.6017811, 2.923252, 1, 0, 0, 1, 1,
0.6293944, 0.7694504, 0.128751, 1, 0, 0, 1, 1,
0.632062, 1.599375, 1.025704, 1, 0, 0, 1, 1,
0.6333275, 0.65572, 1.072981, 0, 0, 0, 1, 1,
0.634133, -0.1651326, 3.628634, 0, 0, 0, 1, 1,
0.6347646, -0.3035107, 1.026349, 0, 0, 0, 1, 1,
0.6478862, -1.224652, 1.203786, 0, 0, 0, 1, 1,
0.6482928, -0.2615235, 1.357406, 0, 0, 0, 1, 1,
0.6495196, -0.06849993, 0.9706972, 0, 0, 0, 1, 1,
0.6530702, -0.1320321, 2.993556, 0, 0, 0, 1, 1,
0.6577205, 0.3405406, 0.4846557, 1, 1, 1, 1, 1,
0.6620924, -0.7985825, 0.7967047, 1, 1, 1, 1, 1,
0.6629323, 0.05161235, -0.08244804, 1, 1, 1, 1, 1,
0.6645626, -1.018532, 3.801433, 1, 1, 1, 1, 1,
0.6668214, 0.8657903, 1.681753, 1, 1, 1, 1, 1,
0.6684099, -0.1095464, 1.903752, 1, 1, 1, 1, 1,
0.668912, 0.8018336, 0.1279837, 1, 1, 1, 1, 1,
0.6750869, 1.497702, 0.1883088, 1, 1, 1, 1, 1,
0.6797205, -0.9029682, 3.174636, 1, 1, 1, 1, 1,
0.6849117, 0.9274146, 0.5508285, 1, 1, 1, 1, 1,
0.698432, 0.7699291, 1.004105, 1, 1, 1, 1, 1,
0.7093806, -1.70268, 1.88301, 1, 1, 1, 1, 1,
0.7176844, -2.095064, 1.930425, 1, 1, 1, 1, 1,
0.7183236, -1.329981, 3.01766, 1, 1, 1, 1, 1,
0.7212862, 1.240701, -0.2152915, 1, 1, 1, 1, 1,
0.7232468, -0.4150578, 0.5086007, 0, 0, 1, 1, 1,
0.7253433, 0.568047, 0.1732545, 1, 0, 0, 1, 1,
0.7283801, -1.054109, 1.886206, 1, 0, 0, 1, 1,
0.7365419, -2.21069, 0.9506103, 1, 0, 0, 1, 1,
0.7565053, -0.3816175, 2.394274, 1, 0, 0, 1, 1,
0.7569814, 0.5160471, 0.3124713, 1, 0, 0, 1, 1,
0.762413, -0.5666057, 3.634822, 0, 0, 0, 1, 1,
0.763994, 2.204808, -0.4045275, 0, 0, 0, 1, 1,
0.7654126, 1.885438, -0.1903483, 0, 0, 0, 1, 1,
0.7673203, 0.9661458, 1.166541, 0, 0, 0, 1, 1,
0.7740991, 1.326966, 0.2199207, 0, 0, 0, 1, 1,
0.7749313, -0.3220966, 2.662921, 0, 0, 0, 1, 1,
0.7752164, -0.7729135, 1.974344, 0, 0, 0, 1, 1,
0.7803815, -1.590403, 4.020237, 1, 1, 1, 1, 1,
0.786945, -0.4905392, 0.5165609, 1, 1, 1, 1, 1,
0.7870661, 1.410903, 0.6001669, 1, 1, 1, 1, 1,
0.7914752, -0.07411181, 0.1381674, 1, 1, 1, 1, 1,
0.7927268, -0.5444855, 1.520391, 1, 1, 1, 1, 1,
0.7956502, 0.04115728, 1.235461, 1, 1, 1, 1, 1,
0.8002371, -1.339935, 1.259238, 1, 1, 1, 1, 1,
0.8028536, -0.6597106, 1.930753, 1, 1, 1, 1, 1,
0.803144, -0.3192182, 1.296581, 1, 1, 1, 1, 1,
0.8036707, -0.3172435, 1.735613, 1, 1, 1, 1, 1,
0.8069934, -0.7255966, 2.823305, 1, 1, 1, 1, 1,
0.8101506, 0.611714, 0.2389307, 1, 1, 1, 1, 1,
0.8224532, 1.651247, 0.6399879, 1, 1, 1, 1, 1,
0.827806, -1.051649, 2.374217, 1, 1, 1, 1, 1,
0.8343028, -0.2631642, 2.15239, 1, 1, 1, 1, 1,
0.8426655, -0.2043686, 3.78981, 0, 0, 1, 1, 1,
0.8485586, -1.488827, 1.010278, 1, 0, 0, 1, 1,
0.8527356, -0.8096258, 1.91172, 1, 0, 0, 1, 1,
0.8571998, -0.6804394, 0.6350245, 1, 0, 0, 1, 1,
0.8590739, 0.2169659, -0.6897445, 1, 0, 0, 1, 1,
0.8615659, 1.626804, 1.545424, 1, 0, 0, 1, 1,
0.8625046, -0.5051627, 3.739066, 0, 0, 0, 1, 1,
0.863698, 0.3896942, 0.8441839, 0, 0, 0, 1, 1,
0.8671411, 1.015028, 0.08549904, 0, 0, 0, 1, 1,
0.8672908, 1.624583, -0.1999184, 0, 0, 0, 1, 1,
0.8727308, 1.053403, 0.7725152, 0, 0, 0, 1, 1,
0.8736066, 0.4596999, -0.7148241, 0, 0, 0, 1, 1,
0.884645, 0.3195892, 0.6419069, 0, 0, 0, 1, 1,
0.8869546, 0.5217973, 2.406465, 1, 1, 1, 1, 1,
0.8897436, -1.423958, 2.959937, 1, 1, 1, 1, 1,
0.8899676, -0.6982577, 2.498253, 1, 1, 1, 1, 1,
0.897193, 1.260168, -2.517212, 1, 1, 1, 1, 1,
0.9005966, 0.160758, -0.2127592, 1, 1, 1, 1, 1,
0.9018389, 0.03375885, 2.606328, 1, 1, 1, 1, 1,
0.9076074, 0.03380359, 0.8970755, 1, 1, 1, 1, 1,
0.9103084, -1.097566, 3.63313, 1, 1, 1, 1, 1,
0.9174452, -0.610878, 2.76645, 1, 1, 1, 1, 1,
0.9188711, 0.8012918, 1.0445, 1, 1, 1, 1, 1,
0.930205, -0.7123731, 3.098108, 1, 1, 1, 1, 1,
0.9316899, -1.246614, 1.799046, 1, 1, 1, 1, 1,
0.9363115, 0.6740295, 1.405511, 1, 1, 1, 1, 1,
0.9386808, -0.1818455, 2.400581, 1, 1, 1, 1, 1,
0.9443887, 1.87894, -0.6429104, 1, 1, 1, 1, 1,
0.9470839, 0.08419622, -0.1640234, 0, 0, 1, 1, 1,
0.9485489, 0.01741396, 1.038895, 1, 0, 0, 1, 1,
0.9520088, -0.7232625, 1.554287, 1, 0, 0, 1, 1,
0.9533874, -1.29302, 1.382407, 1, 0, 0, 1, 1,
0.9596766, 0.322675, 1.18996, 1, 0, 0, 1, 1,
0.9637901, -0.2533742, 1.685986, 1, 0, 0, 1, 1,
0.9640161, 0.1744898, 0.431811, 0, 0, 0, 1, 1,
0.9649085, 1.002179, -1.25306, 0, 0, 0, 1, 1,
0.9675922, -0.458272, 1.522654, 0, 0, 0, 1, 1,
0.9687193, -0.2351608, 2.234223, 0, 0, 0, 1, 1,
0.9694482, -0.7856383, 3.220475, 0, 0, 0, 1, 1,
0.9696769, 0.6144031, 2.21401, 0, 0, 0, 1, 1,
0.9705949, -0.4476539, 3.4172, 0, 0, 0, 1, 1,
0.9767466, -0.9012433, 1.123647, 1, 1, 1, 1, 1,
0.9771086, -0.922824, 2.238415, 1, 1, 1, 1, 1,
0.9860629, 0.7637695, -0.09410713, 1, 1, 1, 1, 1,
0.986105, -1.341893, 2.517822, 1, 1, 1, 1, 1,
0.9862162, -1.249927, 1.994511, 1, 1, 1, 1, 1,
0.9863447, -1.466425, 2.370122, 1, 1, 1, 1, 1,
0.992617, 0.191539, 0.8518304, 1, 1, 1, 1, 1,
0.9950281, 1.205247, 0.4209419, 1, 1, 1, 1, 1,
0.999261, 0.8697596, 1.97037, 1, 1, 1, 1, 1,
1.001001, -0.3973319, 1.668297, 1, 1, 1, 1, 1,
1.007778, 1.219718, 1.202031, 1, 1, 1, 1, 1,
1.009079, 0.9782491, -0.4605956, 1, 1, 1, 1, 1,
1.009718, -0.9048187, 2.432276, 1, 1, 1, 1, 1,
1.013425, 1.148744, 0.6891395, 1, 1, 1, 1, 1,
1.015135, -0.1880499, 1.43783, 1, 1, 1, 1, 1,
1.016593, -0.05639859, 1.379298, 0, 0, 1, 1, 1,
1.016865, -0.244332, 0.8858025, 1, 0, 0, 1, 1,
1.028383, 0.3221971, 0.08045513, 1, 0, 0, 1, 1,
1.029927, 1.375666, 1.159782, 1, 0, 0, 1, 1,
1.033849, 0.4499258, 0.001353856, 1, 0, 0, 1, 1,
1.034425, 1.256598, 0.7962145, 1, 0, 0, 1, 1,
1.036601, -0.5833434, 2.075642, 0, 0, 0, 1, 1,
1.040901, -0.5096001, 2.768116, 0, 0, 0, 1, 1,
1.045941, -0.6808622, 2.547374, 0, 0, 0, 1, 1,
1.047587, 1.468183, 1.29393, 0, 0, 0, 1, 1,
1.048635, -0.1850634, 0.3459256, 0, 0, 0, 1, 1,
1.051742, 1.488412, 1.3895, 0, 0, 0, 1, 1,
1.063478, 2.741247, -0.1343775, 0, 0, 0, 1, 1,
1.072665, -1.148085, 2.500727, 1, 1, 1, 1, 1,
1.07497, 0.4193783, 0.2992703, 1, 1, 1, 1, 1,
1.077162, 0.8807961, 1.428106, 1, 1, 1, 1, 1,
1.08329, -2.292889, 2.689027, 1, 1, 1, 1, 1,
1.08493, 1.099806, 0.7840163, 1, 1, 1, 1, 1,
1.085951, 0.9925488, 1.221367, 1, 1, 1, 1, 1,
1.08599, 0.522305, 0.8232268, 1, 1, 1, 1, 1,
1.088684, 0.07552977, 1.142016, 1, 1, 1, 1, 1,
1.102065, 0.5474294, 1.811453, 1, 1, 1, 1, 1,
1.102367, -0.07111783, 2.932823, 1, 1, 1, 1, 1,
1.113117, -2.096267, 2.698126, 1, 1, 1, 1, 1,
1.113488, 1.093959, 0.5792271, 1, 1, 1, 1, 1,
1.116171, 0.4849331, 2.338488, 1, 1, 1, 1, 1,
1.124075, -0.06307716, 3.253428, 1, 1, 1, 1, 1,
1.126237, -1.635316, 4.266178, 1, 1, 1, 1, 1,
1.137624, 0.46567, 0.02027027, 0, 0, 1, 1, 1,
1.141494, 1.088192, 1.869937, 1, 0, 0, 1, 1,
1.14546, -0.3320455, -0.2169475, 1, 0, 0, 1, 1,
1.147475, -0.2003264, 1.012301, 1, 0, 0, 1, 1,
1.152902, -0.3934855, 3.052803, 1, 0, 0, 1, 1,
1.153064, 0.009227542, 1.486032, 1, 0, 0, 1, 1,
1.15512, -0.6801063, 1.427336, 0, 0, 0, 1, 1,
1.158111, -0.6130452, 1.546823, 0, 0, 0, 1, 1,
1.161222, -1.311686, 3.945884, 0, 0, 0, 1, 1,
1.166823, 0.6388004, 0.3821548, 0, 0, 0, 1, 1,
1.167497, -0.6291754, 2.203518, 0, 0, 0, 1, 1,
1.173132, 0.05125989, 3.881753, 0, 0, 0, 1, 1,
1.173423, 1.772041, 0.6873528, 0, 0, 0, 1, 1,
1.177892, -0.2290951, 2.875585, 1, 1, 1, 1, 1,
1.180365, 0.2745408, 0.1449359, 1, 1, 1, 1, 1,
1.185884, -2.178363, 1.39358, 1, 1, 1, 1, 1,
1.189186, -1.373799, 1.780278, 1, 1, 1, 1, 1,
1.189678, -0.1026208, -0.01863926, 1, 1, 1, 1, 1,
1.189945, 2.822136, 1.376106, 1, 1, 1, 1, 1,
1.193109, -1.237057, 2.259714, 1, 1, 1, 1, 1,
1.216074, 0.0840294, 2.246099, 1, 1, 1, 1, 1,
1.21918, -1.780724, 1.766873, 1, 1, 1, 1, 1,
1.224152, 0.1448528, 2.006517, 1, 1, 1, 1, 1,
1.224244, -0.9175153, 1.507591, 1, 1, 1, 1, 1,
1.236117, -0.1045205, 2.099006, 1, 1, 1, 1, 1,
1.258405, 0.4025529, -1.148271, 1, 1, 1, 1, 1,
1.263151, -0.6782778, 2.22199, 1, 1, 1, 1, 1,
1.275481, -0.3904383, 3.172014, 1, 1, 1, 1, 1,
1.275579, -0.123097, 2.455099, 0, 0, 1, 1, 1,
1.283864, 0.2085171, 1.15639, 1, 0, 0, 1, 1,
1.285951, -1.525237, 3.740242, 1, 0, 0, 1, 1,
1.299115, -0.02373848, 0.01932183, 1, 0, 0, 1, 1,
1.303028, 1.111897, 0.1935525, 1, 0, 0, 1, 1,
1.30489, 1.343807, 0.8162521, 1, 0, 0, 1, 1,
1.316615, -1.109572, -0.5769027, 0, 0, 0, 1, 1,
1.327099, 1.425451, 0.3296159, 0, 0, 0, 1, 1,
1.328185, 1.185867, 0.6929521, 0, 0, 0, 1, 1,
1.32918, 1.01997, 1.008417, 0, 0, 0, 1, 1,
1.33321, -0.925011, 2.170753, 0, 0, 0, 1, 1,
1.339715, -1.182979, 1.311976, 0, 0, 0, 1, 1,
1.339898, -0.2223079, 3.61431, 0, 0, 0, 1, 1,
1.387115, -0.2320815, 1.98936, 1, 1, 1, 1, 1,
1.392881, -0.1031146, 0.5737207, 1, 1, 1, 1, 1,
1.402427, 1.244034, -0.482168, 1, 1, 1, 1, 1,
1.407479, -1.025307, 2.595411, 1, 1, 1, 1, 1,
1.412221, -0.2692665, 2.552143, 1, 1, 1, 1, 1,
1.419423, 0.4994961, 1.132598, 1, 1, 1, 1, 1,
1.429307, 1.065164, 0.9140258, 1, 1, 1, 1, 1,
1.430707, 0.2941394, -0.3651841, 1, 1, 1, 1, 1,
1.440299, 0.3366647, 2.642853, 1, 1, 1, 1, 1,
1.456262, -0.4164225, 1.485936, 1, 1, 1, 1, 1,
1.462417, -0.9614794, 1.589252, 1, 1, 1, 1, 1,
1.464795, -0.1105866, 3.061745, 1, 1, 1, 1, 1,
1.487576, -0.3340649, 1.046081, 1, 1, 1, 1, 1,
1.490618, 0.9988611, 0.347298, 1, 1, 1, 1, 1,
1.502624, 0.3530261, 1.936807, 1, 1, 1, 1, 1,
1.505046, 0.58447, 2.602157, 0, 0, 1, 1, 1,
1.508831, -1.80158, 2.642331, 1, 0, 0, 1, 1,
1.512338, -1.887473, 2.261841, 1, 0, 0, 1, 1,
1.531177, -1.67061, 1.668092, 1, 0, 0, 1, 1,
1.531464, -0.1233651, 0.03445247, 1, 0, 0, 1, 1,
1.531693, 1.012311, 1.528556, 1, 0, 0, 1, 1,
1.533723, -1.518198, 2.814323, 0, 0, 0, 1, 1,
1.534543, 1.282955, 0.4906718, 0, 0, 0, 1, 1,
1.542838, -0.1588406, -1.200285, 0, 0, 0, 1, 1,
1.546, 0.4225895, -0.2540621, 0, 0, 0, 1, 1,
1.562224, 0.4100582, -0.07804873, 0, 0, 0, 1, 1,
1.564657, 1.810623, -0.2204845, 0, 0, 0, 1, 1,
1.570437, -0.950772, 1.414724, 0, 0, 0, 1, 1,
1.581292, 0.6579935, 2.467525, 1, 1, 1, 1, 1,
1.582876, -2.355215, 2.641244, 1, 1, 1, 1, 1,
1.585194, 0.7365771, 1.50681, 1, 1, 1, 1, 1,
1.590901, 0.2018008, 0.7307538, 1, 1, 1, 1, 1,
1.597973, 0.8045717, 1.993437, 1, 1, 1, 1, 1,
1.604359, -1.385767, 3.217216, 1, 1, 1, 1, 1,
1.608799, -0.9470391, 1.005033, 1, 1, 1, 1, 1,
1.611791, -2.077759, 2.535196, 1, 1, 1, 1, 1,
1.643026, -0.1246305, 1.979086, 1, 1, 1, 1, 1,
1.651689, 1.711993, 0.7963399, 1, 1, 1, 1, 1,
1.667624, 0.4437148, 3.069909, 1, 1, 1, 1, 1,
1.676299, -0.3289613, 0.8788894, 1, 1, 1, 1, 1,
1.68705, 2.438312, -0.3880713, 1, 1, 1, 1, 1,
1.688632, -0.08164414, 3.346429, 1, 1, 1, 1, 1,
1.690579, 0.2957315, 0.9571483, 1, 1, 1, 1, 1,
1.697844, 0.14135, 1.631447, 0, 0, 1, 1, 1,
1.706927, -0.6210871, 1.24712, 1, 0, 0, 1, 1,
1.708926, 0.07786654, 0.1452797, 1, 0, 0, 1, 1,
1.712371, -0.4105842, 2.204965, 1, 0, 0, 1, 1,
1.722419, -0.5259296, 2.42591, 1, 0, 0, 1, 1,
1.755732, -0.9585986, 2.818549, 1, 0, 0, 1, 1,
1.762056, 0.1064426, 0.4535246, 0, 0, 0, 1, 1,
1.762386, 0.3981044, 2.307306, 0, 0, 0, 1, 1,
1.807109, 1.239112, 1.34687, 0, 0, 0, 1, 1,
1.825366, 0.8117128, 0.2179131, 0, 0, 0, 1, 1,
1.826754, -0.2212653, 0.4533886, 0, 0, 0, 1, 1,
1.838741, -1.65527, 0.9254006, 0, 0, 0, 1, 1,
1.843849, -0.4459789, 3.805566, 0, 0, 0, 1, 1,
1.889545, 0.2667708, -1.957066, 1, 1, 1, 1, 1,
1.921843, 0.9286938, 1.219575, 1, 1, 1, 1, 1,
1.922741, -1.033836, 2.134315, 1, 1, 1, 1, 1,
1.923674, 1.877642, -0.3452207, 1, 1, 1, 1, 1,
1.92539, -0.3052282, 1.864409, 1, 1, 1, 1, 1,
1.935588, -0.0536665, 1.813368, 1, 1, 1, 1, 1,
1.941771, 0.3911111, 0.528965, 1, 1, 1, 1, 1,
1.946251, -0.6162493, 3.892071, 1, 1, 1, 1, 1,
1.973344, -0.08515082, 2.332978, 1, 1, 1, 1, 1,
1.973407, -0.4900853, 1.819952, 1, 1, 1, 1, 1,
1.998802, -1.44299, 2.248876, 1, 1, 1, 1, 1,
2.003666, 0.4400435, -0.02335462, 1, 1, 1, 1, 1,
2.079724, -1.018488, 1.776917, 1, 1, 1, 1, 1,
2.09837, -0.2685255, 1.892513, 1, 1, 1, 1, 1,
2.113887, -1.179395, 2.296051, 1, 1, 1, 1, 1,
2.116698, 2.008772, 1.065797, 0, 0, 1, 1, 1,
2.134099, 2.160832, -0.5306722, 1, 0, 0, 1, 1,
2.156297, -0.2579993, 1.84229, 1, 0, 0, 1, 1,
2.199207, -1.321102, 3.16354, 1, 0, 0, 1, 1,
2.200782, 1.235606, -0.6363095, 1, 0, 0, 1, 1,
2.273298, 0.3629566, 1.774683, 1, 0, 0, 1, 1,
2.298286, -1.471114, 2.18811, 0, 0, 0, 1, 1,
2.372594, 0.7585, 1.035186, 0, 0, 0, 1, 1,
2.384922, 0.4567654, 0.06658843, 0, 0, 0, 1, 1,
2.454529, -0.0952404, -0.6600385, 0, 0, 0, 1, 1,
2.505065, -0.01783037, 0.4313965, 0, 0, 0, 1, 1,
2.580562, 0.488225, -1.306586, 0, 0, 0, 1, 1,
2.598337, -1.806195, 2.565283, 0, 0, 0, 1, 1,
2.749604, -0.1727583, 1.360335, 1, 1, 1, 1, 1,
2.755126, 0.8652642, -0.4165834, 1, 1, 1, 1, 1,
2.786357, -1.14041, 2.699082, 1, 1, 1, 1, 1,
2.896892, -1.262392, 2.592909, 1, 1, 1, 1, 1,
3.031471, 0.3407267, 2.044847, 1, 1, 1, 1, 1,
3.106324, 2.906147, -0.993089, 1, 1, 1, 1, 1,
3.28491, 0.4403554, 1.835552, 1, 1, 1, 1, 1
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
var radius = 9.505336;
var distance = 33.38709;
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
mvMatrix.translate( -0.4309509, -0.1585736, -0.4369252 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38709);
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
