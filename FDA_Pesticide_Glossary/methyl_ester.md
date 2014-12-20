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
-3.60687, 1.413438, 0.2739471, 1, 0, 0, 1,
-3.099065, 0.776523, -1.625817, 1, 0.007843138, 0, 1,
-3.046313, 1.982844, -1.189433, 1, 0.01176471, 0, 1,
-2.979763, -0.3071708, 0.09701958, 1, 0.01960784, 0, 1,
-2.490898, 0.7307184, -0.7256605, 1, 0.02352941, 0, 1,
-2.488688, -0.8580516, -1.763418, 1, 0.03137255, 0, 1,
-2.439403, -0.9561811, -1.526905, 1, 0.03529412, 0, 1,
-2.399588, -1.439296, -1.945253, 1, 0.04313726, 0, 1,
-2.375355, -0.3009311, -1.321109, 1, 0.04705882, 0, 1,
-2.262201, -1.437848, -1.532548, 1, 0.05490196, 0, 1,
-2.2496, -1.057581, -2.131239, 1, 0.05882353, 0, 1,
-2.244051, 0.7797353, -3.401406, 1, 0.06666667, 0, 1,
-2.227116, -0.9707581, -3.508648, 1, 0.07058824, 0, 1,
-2.226561, 2.770295, -0.3810157, 1, 0.07843138, 0, 1,
-2.180999, 0.2990329, 0.02832981, 1, 0.08235294, 0, 1,
-2.12838, 0.1980259, -2.045721, 1, 0.09019608, 0, 1,
-2.098284, 0.08746732, -1.778452, 1, 0.09411765, 0, 1,
-2.071963, -0.554806, -2.704637, 1, 0.1019608, 0, 1,
-2.063128, -0.3678535, -3.154951, 1, 0.1098039, 0, 1,
-2.031431, -0.9510615, -0.3801602, 1, 0.1137255, 0, 1,
-2.006892, 0.08792729, -0.5215988, 1, 0.1215686, 0, 1,
-1.993841, 0.5970364, -1.349701, 1, 0.1254902, 0, 1,
-1.972878, -0.7253729, -2.346917, 1, 0.1333333, 0, 1,
-1.968574, 0.1469773, -0.7342353, 1, 0.1372549, 0, 1,
-1.951782, 1.076868, -0.6074036, 1, 0.145098, 0, 1,
-1.941682, 1.107921, -1.634299, 1, 0.1490196, 0, 1,
-1.934875, -0.23399, -1.083863, 1, 0.1568628, 0, 1,
-1.895078, -0.8688903, -1.49393, 1, 0.1607843, 0, 1,
-1.829399, -1.543923, -1.967988, 1, 0.1686275, 0, 1,
-1.780738, -0.01885563, -1.717667, 1, 0.172549, 0, 1,
-1.777643, 0.1163279, -1.066977, 1, 0.1803922, 0, 1,
-1.765529, 0.6524802, -1.790596, 1, 0.1843137, 0, 1,
-1.757004, 1.586869, -0.3902678, 1, 0.1921569, 0, 1,
-1.754248, -0.1495641, -2.656008, 1, 0.1960784, 0, 1,
-1.736194, 0.1397321, -2.028677, 1, 0.2039216, 0, 1,
-1.732186, 0.7568823, -0.007057896, 1, 0.2117647, 0, 1,
-1.728741, 0.009657216, -2.127089, 1, 0.2156863, 0, 1,
-1.727178, 1.549694, -1.250053, 1, 0.2235294, 0, 1,
-1.707655, -0.7928756, -1.99007, 1, 0.227451, 0, 1,
-1.706234, 1.018815, 0.5872282, 1, 0.2352941, 0, 1,
-1.702089, -1.033007, -3.557304, 1, 0.2392157, 0, 1,
-1.684865, -0.5127547, -1.380272, 1, 0.2470588, 0, 1,
-1.670105, 0.4976215, -1.813324, 1, 0.2509804, 0, 1,
-1.6614, 0.07653707, -2.60268, 1, 0.2588235, 0, 1,
-1.655972, 0.9700506, -1.133724, 1, 0.2627451, 0, 1,
-1.632424, 0.1482771, -1.354964, 1, 0.2705882, 0, 1,
-1.630164, 0.1894903, -0.5190038, 1, 0.2745098, 0, 1,
-1.619391, 0.10671, 1.188929, 1, 0.282353, 0, 1,
-1.618625, 1.02681, -1.343997, 1, 0.2862745, 0, 1,
-1.610911, -0.7130235, -3.312758, 1, 0.2941177, 0, 1,
-1.609302, 0.06322155, -1.198065, 1, 0.3019608, 0, 1,
-1.596788, -0.5908174, -1.121788, 1, 0.3058824, 0, 1,
-1.592527, -0.01835732, -2.057254, 1, 0.3137255, 0, 1,
-1.582292, 1.332494, -1.215394, 1, 0.3176471, 0, 1,
-1.548241, 0.3747936, -2.859436, 1, 0.3254902, 0, 1,
-1.547158, 1.695865, -1.217197, 1, 0.3294118, 0, 1,
-1.539445, -0.4769518, -1.479749, 1, 0.3372549, 0, 1,
-1.534029, -0.8292038, -0.7092944, 1, 0.3411765, 0, 1,
-1.492675, -0.4420905, -3.080254, 1, 0.3490196, 0, 1,
-1.490785, -0.8139527, -2.269489, 1, 0.3529412, 0, 1,
-1.477026, 1.381317, -0.1765987, 1, 0.3607843, 0, 1,
-1.476976, -0.04986275, -1.739403, 1, 0.3647059, 0, 1,
-1.472141, -0.1650096, -2.237613, 1, 0.372549, 0, 1,
-1.450026, -0.4769824, -0.8355028, 1, 0.3764706, 0, 1,
-1.432806, 0.3943097, -2.752943, 1, 0.3843137, 0, 1,
-1.428344, 1.06125, -0.6141344, 1, 0.3882353, 0, 1,
-1.426396, -0.7131055, -1.936878, 1, 0.3960784, 0, 1,
-1.423371, -0.7839099, -0.8206372, 1, 0.4039216, 0, 1,
-1.412348, 1.665799, -2.289678, 1, 0.4078431, 0, 1,
-1.411286, -0.1820908, -3.365581, 1, 0.4156863, 0, 1,
-1.40656, 0.5299401, -1.013935, 1, 0.4196078, 0, 1,
-1.402968, -0.5127879, -1.537674, 1, 0.427451, 0, 1,
-1.400325, 0.7801486, -3.656072, 1, 0.4313726, 0, 1,
-1.398246, -0.654748, -0.8488444, 1, 0.4392157, 0, 1,
-1.396813, 0.3947001, -2.089586, 1, 0.4431373, 0, 1,
-1.394439, -0.1010175, -4.757685, 1, 0.4509804, 0, 1,
-1.371717, -1.153775, -3.216919, 1, 0.454902, 0, 1,
-1.366303, 1.661434, 0.4538944, 1, 0.4627451, 0, 1,
-1.364043, 0.259638, -1.30699, 1, 0.4666667, 0, 1,
-1.353659, 1.163476, -1.012715, 1, 0.4745098, 0, 1,
-1.350073, 0.4610794, -0.3414872, 1, 0.4784314, 0, 1,
-1.342358, -1.655137, -2.145991, 1, 0.4862745, 0, 1,
-1.327919, 0.2286216, -1.659582, 1, 0.4901961, 0, 1,
-1.327333, 1.387531, -2.186096, 1, 0.4980392, 0, 1,
-1.325325, 0.1026812, -2.635243, 1, 0.5058824, 0, 1,
-1.314718, -0.8003781, -1.877034, 1, 0.509804, 0, 1,
-1.310313, 2.787658, 0.3652289, 1, 0.5176471, 0, 1,
-1.308317, 0.9427115, -2.387403, 1, 0.5215687, 0, 1,
-1.293554, 0.6667387, -1.759775, 1, 0.5294118, 0, 1,
-1.290412, 1.067245, -1.017017, 1, 0.5333334, 0, 1,
-1.286115, 0.9232995, -1.603623, 1, 0.5411765, 0, 1,
-1.28194, -0.4284321, -2.008586, 1, 0.5450981, 0, 1,
-1.28092, -0.9395922, -2.32994, 1, 0.5529412, 0, 1,
-1.280836, 0.8356336, -0.2692078, 1, 0.5568628, 0, 1,
-1.279818, 0.5407174, -1.358482, 1, 0.5647059, 0, 1,
-1.276031, 0.6054743, 0.03609252, 1, 0.5686275, 0, 1,
-1.273727, 0.2758614, -1.587187, 1, 0.5764706, 0, 1,
-1.272841, -0.4075227, -2.905801, 1, 0.5803922, 0, 1,
-1.27067, 1.871173, 1.319267, 1, 0.5882353, 0, 1,
-1.265272, -0.4708771, -2.723984, 1, 0.5921569, 0, 1,
-1.244614, -0.8729406, -2.602974, 1, 0.6, 0, 1,
-1.244193, 0.7407926, -1.186336, 1, 0.6078432, 0, 1,
-1.243708, -0.658197, -3.265749, 1, 0.6117647, 0, 1,
-1.238303, -1.080485, -2.524148, 1, 0.6196079, 0, 1,
-1.236227, -0.9779081, -0.6136243, 1, 0.6235294, 0, 1,
-1.223473, 0.103066, -1.374985, 1, 0.6313726, 0, 1,
-1.212148, 0.2023681, -0.3613792, 1, 0.6352941, 0, 1,
-1.206998, -0.7695785, -1.783011, 1, 0.6431373, 0, 1,
-1.200493, 0.241485, -0.7199743, 1, 0.6470588, 0, 1,
-1.196605, -0.7651285, -1.888893, 1, 0.654902, 0, 1,
-1.196066, 0.5942801, -1.293562, 1, 0.6588235, 0, 1,
-1.194245, -0.7602841, -2.368864, 1, 0.6666667, 0, 1,
-1.192324, -1.792376, -1.348397, 1, 0.6705883, 0, 1,
-1.175817, -0.4541532, -3.14818, 1, 0.6784314, 0, 1,
-1.174873, 0.2145934, -2.217727, 1, 0.682353, 0, 1,
-1.166798, 0.3304921, -1.587657, 1, 0.6901961, 0, 1,
-1.165985, -1.517111, -1.613685, 1, 0.6941177, 0, 1,
-1.162281, 0.2037684, 0.4886465, 1, 0.7019608, 0, 1,
-1.161853, 0.03117152, -1.392105, 1, 0.7098039, 0, 1,
-1.159283, -0.1016029, -1.738856, 1, 0.7137255, 0, 1,
-1.159217, 0.2748897, -1.550151, 1, 0.7215686, 0, 1,
-1.151219, 0.6457431, -2.524475, 1, 0.7254902, 0, 1,
-1.149458, 0.281702, -2.226659, 1, 0.7333333, 0, 1,
-1.149178, 0.09076507, -2.676541, 1, 0.7372549, 0, 1,
-1.144846, 0.4274302, -0.6680982, 1, 0.7450981, 0, 1,
-1.144739, -0.9856672, -3.166626, 1, 0.7490196, 0, 1,
-1.138076, -0.8397973, -2.458024, 1, 0.7568628, 0, 1,
-1.114846, 2.132606, -0.7886419, 1, 0.7607843, 0, 1,
-1.114123, -0.7483823, -1.48669, 1, 0.7686275, 0, 1,
-1.10939, -1.039538, -2.588831, 1, 0.772549, 0, 1,
-1.094181, -1.288213, -2.706783, 1, 0.7803922, 0, 1,
-1.0882, -0.1337578, -2.24271, 1, 0.7843137, 0, 1,
-1.08177, 0.3588004, -0.4367887, 1, 0.7921569, 0, 1,
-1.076738, -0.2867421, -1.668595, 1, 0.7960784, 0, 1,
-1.069242, 0.2601689, -1.236558, 1, 0.8039216, 0, 1,
-1.067097, -0.5706746, -1.483981, 1, 0.8117647, 0, 1,
-1.064148, -1.632291, -3.336138, 1, 0.8156863, 0, 1,
-1.062704, -0.5486088, -3.306747, 1, 0.8235294, 0, 1,
-1.055475, -0.4965608, -1.072205, 1, 0.827451, 0, 1,
-1.053271, 0.961149, -0.7848744, 1, 0.8352941, 0, 1,
-1.052302, -1.104237, -1.358146, 1, 0.8392157, 0, 1,
-1.049621, 1.436284, -1.099456, 1, 0.8470588, 0, 1,
-1.048815, 0.9956526, -1.507112, 1, 0.8509804, 0, 1,
-1.048343, -1.123404, -2.966351, 1, 0.8588235, 0, 1,
-1.046294, 0.234241, -2.367218, 1, 0.8627451, 0, 1,
-1.039081, -0.2126453, -4.258152, 1, 0.8705882, 0, 1,
-1.038962, -2.011498, -0.5112919, 1, 0.8745098, 0, 1,
-1.036535, 1.434348, -0.1453264, 1, 0.8823529, 0, 1,
-1.035398, 1.049906, -1.258921, 1, 0.8862745, 0, 1,
-1.034817, 0.4167712, -0.7683887, 1, 0.8941177, 0, 1,
-1.033652, -2.190908, -2.901722, 1, 0.8980392, 0, 1,
-1.031617, 1.143925, 0.9442448, 1, 0.9058824, 0, 1,
-1.030971, 1.264163, -1.061347, 1, 0.9137255, 0, 1,
-1.026974, -0.2043687, -0.7749419, 1, 0.9176471, 0, 1,
-1.016352, 0.3463868, 0.07801875, 1, 0.9254902, 0, 1,
-1.00368, 0.6920812, -2.020059, 1, 0.9294118, 0, 1,
-1.003345, 0.8762251, -0.6165583, 1, 0.9372549, 0, 1,
-1.000346, 0.9347925, 0.2193331, 1, 0.9411765, 0, 1,
-0.9967787, -0.1990171, -3.290786, 1, 0.9490196, 0, 1,
-0.9950938, -1.653741, -2.394169, 1, 0.9529412, 0, 1,
-0.9889417, 1.052583, 0.2333716, 1, 0.9607843, 0, 1,
-0.9856365, -0.9423305, -3.056045, 1, 0.9647059, 0, 1,
-0.9840451, 0.2709941, -1.076503, 1, 0.972549, 0, 1,
-0.9806789, -0.7713243, -2.747954, 1, 0.9764706, 0, 1,
-0.9796566, 0.2687795, -0.8939067, 1, 0.9843137, 0, 1,
-0.9781834, 0.4196105, -0.8445203, 1, 0.9882353, 0, 1,
-0.9774158, -0.5306609, -1.226116, 1, 0.9960784, 0, 1,
-0.9751303, -0.3636035, -2.089964, 0.9960784, 1, 0, 1,
-0.9746586, 1.674662, 0.3823714, 0.9921569, 1, 0, 1,
-0.9744013, 0.321739, -1.058794, 0.9843137, 1, 0, 1,
-0.9734899, -0.8908585, -1.669739, 0.9803922, 1, 0, 1,
-0.9566159, -0.6983027, -2.998229, 0.972549, 1, 0, 1,
-0.953452, 1.038278, -0.335118, 0.9686275, 1, 0, 1,
-0.9510746, -1.072864, -3.42653, 0.9607843, 1, 0, 1,
-0.949611, 0.7115263, 0.40147, 0.9568627, 1, 0, 1,
-0.9493214, -1.015275, -2.098428, 0.9490196, 1, 0, 1,
-0.9451489, 0.2006208, -1.624823, 0.945098, 1, 0, 1,
-0.94346, -0.9161566, -2.282896, 0.9372549, 1, 0, 1,
-0.9302785, 0.8600097, -1.574468, 0.9333333, 1, 0, 1,
-0.9274155, -0.0126134, -1.512182, 0.9254902, 1, 0, 1,
-0.9230672, 4.451463, 0.2967783, 0.9215686, 1, 0, 1,
-0.9210864, -0.3886855, -2.045892, 0.9137255, 1, 0, 1,
-0.9135458, -1.094069, -0.9234875, 0.9098039, 1, 0, 1,
-0.900836, 0.671181, 0.9637669, 0.9019608, 1, 0, 1,
-0.8951631, 0.26177, -2.322766, 0.8941177, 1, 0, 1,
-0.8934768, 2.415377, 2.68416, 0.8901961, 1, 0, 1,
-0.8933958, -0.1827106, -1.285938, 0.8823529, 1, 0, 1,
-0.8867353, -0.5004427, -3.438628, 0.8784314, 1, 0, 1,
-0.8861806, -0.08166044, -1.576833, 0.8705882, 1, 0, 1,
-0.8763992, -1.290159, -2.438387, 0.8666667, 1, 0, 1,
-0.8739727, -0.3716757, -1.737103, 0.8588235, 1, 0, 1,
-0.8709849, -0.1122403, -2.962691, 0.854902, 1, 0, 1,
-0.8550634, -0.7844965, -2.160811, 0.8470588, 1, 0, 1,
-0.8539388, -0.5650774, -2.755428, 0.8431373, 1, 0, 1,
-0.8539152, 1.010397, -0.05269676, 0.8352941, 1, 0, 1,
-0.844235, -0.2561697, -1.511176, 0.8313726, 1, 0, 1,
-0.8363491, -0.7461823, -1.54188, 0.8235294, 1, 0, 1,
-0.8252897, 1.315569, 1.240535, 0.8196079, 1, 0, 1,
-0.8173156, 0.9853005, 1.223378, 0.8117647, 1, 0, 1,
-0.8154005, -0.08972771, -0.8530695, 0.8078431, 1, 0, 1,
-0.8093563, -0.08239538, -1.378259, 0.8, 1, 0, 1,
-0.8080533, -0.4434372, -3.724933, 0.7921569, 1, 0, 1,
-0.8047927, -0.5119975, -2.428638, 0.7882353, 1, 0, 1,
-0.8038403, 0.08078066, -1.216498, 0.7803922, 1, 0, 1,
-0.7988946, 0.01199419, -2.439678, 0.7764706, 1, 0, 1,
-0.7982047, -1.764251, -2.708714, 0.7686275, 1, 0, 1,
-0.7942516, 1.76161, -0.1060156, 0.7647059, 1, 0, 1,
-0.7919993, 1.148699, -0.6321004, 0.7568628, 1, 0, 1,
-0.7901688, -1.157013, -2.706796, 0.7529412, 1, 0, 1,
-0.7862442, 0.4415609, -2.007936, 0.7450981, 1, 0, 1,
-0.7846262, 0.09584798, -1.241685, 0.7411765, 1, 0, 1,
-0.7817364, 0.2837448, -1.23135, 0.7333333, 1, 0, 1,
-0.7806688, -0.1948656, -1.852183, 0.7294118, 1, 0, 1,
-0.780503, 1.305379, -1.582278, 0.7215686, 1, 0, 1,
-0.7778414, -1.05257, -3.097538, 0.7176471, 1, 0, 1,
-0.7726631, -2.10696, -3.872245, 0.7098039, 1, 0, 1,
-0.7599856, -0.8212799, -3.109476, 0.7058824, 1, 0, 1,
-0.7599639, -0.6573029, -1.912364, 0.6980392, 1, 0, 1,
-0.7486377, 0.9101139, -1.026493, 0.6901961, 1, 0, 1,
-0.7357481, -0.7367447, -0.9542753, 0.6862745, 1, 0, 1,
-0.7346517, -1.325001, -1.141281, 0.6784314, 1, 0, 1,
-0.7342427, 1.336737, 0.001491675, 0.6745098, 1, 0, 1,
-0.7292643, 1.030704, -1.88194, 0.6666667, 1, 0, 1,
-0.7284295, 1.870356, -2.553855, 0.6627451, 1, 0, 1,
-0.7248809, -0.4328711, -1.357204, 0.654902, 1, 0, 1,
-0.72333, 0.1349222, -1.778874, 0.6509804, 1, 0, 1,
-0.7228739, 0.04251308, -1.199055, 0.6431373, 1, 0, 1,
-0.7198119, 0.5319919, -2.707717, 0.6392157, 1, 0, 1,
-0.7176747, 1.579498, -1.160846, 0.6313726, 1, 0, 1,
-0.7166486, 0.3762697, -1.566176, 0.627451, 1, 0, 1,
-0.7114168, 1.688654, -0.9406414, 0.6196079, 1, 0, 1,
-0.7099949, 1.083531, 0.6793203, 0.6156863, 1, 0, 1,
-0.7096309, 0.6054105, 0.0468943, 0.6078432, 1, 0, 1,
-0.7076218, -0.0310073, -1.892683, 0.6039216, 1, 0, 1,
-0.7074012, -1.230086, -2.696153, 0.5960785, 1, 0, 1,
-0.695851, -0.0713148, -1.530461, 0.5882353, 1, 0, 1,
-0.6938351, -0.4492868, -0.9891313, 0.5843138, 1, 0, 1,
-0.6868225, -0.9820981, -3.491699, 0.5764706, 1, 0, 1,
-0.6841015, 0.03055998, -1.621369, 0.572549, 1, 0, 1,
-0.683217, -0.5863076, -2.703469, 0.5647059, 1, 0, 1,
-0.68316, -0.7425123, -1.517356, 0.5607843, 1, 0, 1,
-0.6646782, -1.260715, -1.967394, 0.5529412, 1, 0, 1,
-0.6515827, 0.1595796, -1.577066, 0.5490196, 1, 0, 1,
-0.6500078, 0.2621545, -0.5826464, 0.5411765, 1, 0, 1,
-0.6475943, -0.3793414, -2.372929, 0.5372549, 1, 0, 1,
-0.6470344, -1.23912, -2.50828, 0.5294118, 1, 0, 1,
-0.6468548, 0.1012124, -0.03407381, 0.5254902, 1, 0, 1,
-0.6426446, 0.4302993, -1.519351, 0.5176471, 1, 0, 1,
-0.6417631, 0.1626407, -1.175226, 0.5137255, 1, 0, 1,
-0.6416835, 0.3280635, -2.719772, 0.5058824, 1, 0, 1,
-0.6383891, -0.7735543, -3.14237, 0.5019608, 1, 0, 1,
-0.6332424, -1.446612, -1.46937, 0.4941176, 1, 0, 1,
-0.6242722, -0.644158, -3.086096, 0.4862745, 1, 0, 1,
-0.6213013, -0.1773501, -0.5835221, 0.4823529, 1, 0, 1,
-0.6162667, -0.4626424, -2.981141, 0.4745098, 1, 0, 1,
-0.6126252, 0.06301559, -2.594215, 0.4705882, 1, 0, 1,
-0.609698, -1.59857, -2.971588, 0.4627451, 1, 0, 1,
-0.6075185, 1.061525, -2.69594, 0.4588235, 1, 0, 1,
-0.6030482, 0.1635031, -1.442446, 0.4509804, 1, 0, 1,
-0.6023349, 1.363099, -0.04654686, 0.4470588, 1, 0, 1,
-0.6004407, -0.6814686, -1.263554, 0.4392157, 1, 0, 1,
-0.5977175, -1.696747, -3.80078, 0.4352941, 1, 0, 1,
-0.595306, -2.997954, -3.152478, 0.427451, 1, 0, 1,
-0.5903355, 1.522505, -1.970606, 0.4235294, 1, 0, 1,
-0.5879962, -1.288221, -3.525829, 0.4156863, 1, 0, 1,
-0.5877974, -0.1893066, -1.922296, 0.4117647, 1, 0, 1,
-0.5860334, -1.050344, -3.187788, 0.4039216, 1, 0, 1,
-0.5824848, 1.371013, -1.121945, 0.3960784, 1, 0, 1,
-0.5817798, -1.429245, -3.803906, 0.3921569, 1, 0, 1,
-0.5806571, 1.62975, -2.492131, 0.3843137, 1, 0, 1,
-0.5779269, -1.07472, -1.100026, 0.3803922, 1, 0, 1,
-0.5712641, 0.8874898, -1.437656, 0.372549, 1, 0, 1,
-0.5696084, -1.015537, -0.9189228, 0.3686275, 1, 0, 1,
-0.5652151, 0.1661516, -1.941475, 0.3607843, 1, 0, 1,
-0.5634149, -0.5793791, -2.817901, 0.3568628, 1, 0, 1,
-0.5629508, -0.8692281, -3.381915, 0.3490196, 1, 0, 1,
-0.5534557, 0.5309173, -0.006097443, 0.345098, 1, 0, 1,
-0.5471309, -0.3894205, -3.038478, 0.3372549, 1, 0, 1,
-0.5465848, 1.960526, -1.511369, 0.3333333, 1, 0, 1,
-0.5442184, 0.4693638, -1.081431, 0.3254902, 1, 0, 1,
-0.5437158, -0.4051102, -2.730209, 0.3215686, 1, 0, 1,
-0.5428463, 0.8231178, -2.147957, 0.3137255, 1, 0, 1,
-0.5423997, -0.2561505, -1.944223, 0.3098039, 1, 0, 1,
-0.5414889, -0.3443333, -1.490414, 0.3019608, 1, 0, 1,
-0.540395, -0.3706317, -3.930409, 0.2941177, 1, 0, 1,
-0.5398667, -2.042039, -3.182305, 0.2901961, 1, 0, 1,
-0.5396722, 0.5183851, -0.5801032, 0.282353, 1, 0, 1,
-0.5356809, 1.511876, 0.4527081, 0.2784314, 1, 0, 1,
-0.5336095, -0.6451872, -2.595189, 0.2705882, 1, 0, 1,
-0.5267389, -1.951301, -2.346741, 0.2666667, 1, 0, 1,
-0.5259141, 0.1239505, -2.105805, 0.2588235, 1, 0, 1,
-0.5257236, -0.6074116, -1.770055, 0.254902, 1, 0, 1,
-0.5244942, -0.3984062, -3.121104, 0.2470588, 1, 0, 1,
-0.5240012, 1.324802, -0.5459735, 0.2431373, 1, 0, 1,
-0.5237762, -2.049268, -3.703529, 0.2352941, 1, 0, 1,
-0.5182695, 1.469391, -0.330875, 0.2313726, 1, 0, 1,
-0.5163032, -0.7326781, -1.636934, 0.2235294, 1, 0, 1,
-0.5158533, -0.1102573, -0.4801532, 0.2196078, 1, 0, 1,
-0.5118407, 1.381517, -0.8193184, 0.2117647, 1, 0, 1,
-0.51151, -0.5943184, -3.962928, 0.2078431, 1, 0, 1,
-0.5090424, 0.8566389, 0.1996958, 0.2, 1, 0, 1,
-0.502423, -0.3541154, -3.15003, 0.1921569, 1, 0, 1,
-0.500725, 1.023184, -0.4297997, 0.1882353, 1, 0, 1,
-0.5000948, 0.3002988, -1.045596, 0.1803922, 1, 0, 1,
-0.4909314, 0.09905564, -1.282251, 0.1764706, 1, 0, 1,
-0.4904297, -1.457784, -1.739821, 0.1686275, 1, 0, 1,
-0.490009, -0.03873654, -0.8771635, 0.1647059, 1, 0, 1,
-0.4882161, -1.850184, -3.455711, 0.1568628, 1, 0, 1,
-0.4853654, 0.2963872, -0.7377824, 0.1529412, 1, 0, 1,
-0.4835179, 0.1314617, -0.79054, 0.145098, 1, 0, 1,
-0.4825129, -0.2075347, -2.028645, 0.1411765, 1, 0, 1,
-0.4766142, -0.5006832, -2.753809, 0.1333333, 1, 0, 1,
-0.4763712, 0.4616318, -0.3060237, 0.1294118, 1, 0, 1,
-0.4740172, 0.7599667, 0.0306644, 0.1215686, 1, 0, 1,
-0.4723091, 0.4598085, 0.4641954, 0.1176471, 1, 0, 1,
-0.4662033, 0.549877, -0.1463175, 0.1098039, 1, 0, 1,
-0.4621706, 1.096611, -0.3248512, 0.1058824, 1, 0, 1,
-0.4587575, 3.138219, -1.795991, 0.09803922, 1, 0, 1,
-0.4562629, -1.781619, -4.698017, 0.09019608, 1, 0, 1,
-0.4552296, 0.006982912, -1.115879, 0.08627451, 1, 0, 1,
-0.4527731, -0.4593444, -2.980818, 0.07843138, 1, 0, 1,
-0.4501599, -0.7741957, -0.942392, 0.07450981, 1, 0, 1,
-0.4477713, 1.053256, -0.875405, 0.06666667, 1, 0, 1,
-0.4443393, -0.9886282, -3.933684, 0.0627451, 1, 0, 1,
-0.4441274, 1.455509, -0.08162984, 0.05490196, 1, 0, 1,
-0.4438054, 2.281156, -1.212917, 0.05098039, 1, 0, 1,
-0.4385272, -0.288106, -2.013844, 0.04313726, 1, 0, 1,
-0.4381921, 0.2290591, -1.33068, 0.03921569, 1, 0, 1,
-0.4366697, -0.177857, -1.510458, 0.03137255, 1, 0, 1,
-0.4355592, -1.340322, -2.297887, 0.02745098, 1, 0, 1,
-0.4349225, 0.8822266, 0.264424, 0.01960784, 1, 0, 1,
-0.4311829, 1.257102, -0.4829872, 0.01568628, 1, 0, 1,
-0.4278907, 1.41181, 0.4802343, 0.007843138, 1, 0, 1,
-0.4272487, -0.4909452, -3.558194, 0.003921569, 1, 0, 1,
-0.4260861, -0.3669634, -2.797635, 0, 1, 0.003921569, 1,
-0.4252847, -0.2853479, -2.836214, 0, 1, 0.01176471, 1,
-0.4240476, 0.4850025, -0.9792292, 0, 1, 0.01568628, 1,
-0.4232472, 1.946543, 1.790555, 0, 1, 0.02352941, 1,
-0.4195879, -1.432062, -3.431041, 0, 1, 0.02745098, 1,
-0.419533, -0.8077511, -2.635549, 0, 1, 0.03529412, 1,
-0.4186175, 0.8717152, -0.6883046, 0, 1, 0.03921569, 1,
-0.4177427, -1.886453, -1.237909, 0, 1, 0.04705882, 1,
-0.4176254, 0.9520131, 0.136578, 0, 1, 0.05098039, 1,
-0.4170786, -1.21243, -2.235871, 0, 1, 0.05882353, 1,
-0.4097002, 0.4310221, 0.02141928, 0, 1, 0.0627451, 1,
-0.3998124, -1.101101, -4.027306, 0, 1, 0.07058824, 1,
-0.3987487, 1.687013, -0.2045046, 0, 1, 0.07450981, 1,
-0.397045, -1.240146, -2.359206, 0, 1, 0.08235294, 1,
-0.3913396, 1.737283, 0.07738253, 0, 1, 0.08627451, 1,
-0.3808961, 0.3399116, -1.093452, 0, 1, 0.09411765, 1,
-0.3775329, 0.4851472, 1.450846, 0, 1, 0.1019608, 1,
-0.3727783, 0.7008347, -0.8702434, 0, 1, 0.1058824, 1,
-0.3724518, -0.9945396, -1.876436, 0, 1, 0.1137255, 1,
-0.3679025, -3.131253, -2.789503, 0, 1, 0.1176471, 1,
-0.366659, -0.2287175, -2.465988, 0, 1, 0.1254902, 1,
-0.3634379, -0.6635718, -2.084267, 0, 1, 0.1294118, 1,
-0.3625062, 0.6068133, 0.706961, 0, 1, 0.1372549, 1,
-0.3589802, -0.7397527, -2.927301, 0, 1, 0.1411765, 1,
-0.3581158, -1.376128, -3.42912, 0, 1, 0.1490196, 1,
-0.3578645, 0.04509817, -4.424426, 0, 1, 0.1529412, 1,
-0.351219, -0.9722001, -1.971652, 0, 1, 0.1607843, 1,
-0.3505214, -0.7997714, -2.283616, 0, 1, 0.1647059, 1,
-0.350151, -0.0356149, -1.778888, 0, 1, 0.172549, 1,
-0.3482155, -0.3925844, -1.806225, 0, 1, 0.1764706, 1,
-0.3388939, -2.756338, -1.883599, 0, 1, 0.1843137, 1,
-0.3377751, -1.683942, -1.84709, 0, 1, 0.1882353, 1,
-0.337458, -0.3565478, -2.738591, 0, 1, 0.1960784, 1,
-0.3359185, 0.2119957, -2.027473, 0, 1, 0.2039216, 1,
-0.3334261, 1.918955, -1.187804, 0, 1, 0.2078431, 1,
-0.3333429, 0.1651418, -0.9347662, 0, 1, 0.2156863, 1,
-0.3300132, -1.863251, -3.663046, 0, 1, 0.2196078, 1,
-0.3288276, 0.5290515, -0.3832014, 0, 1, 0.227451, 1,
-0.3194392, -1.407251, -2.933313, 0, 1, 0.2313726, 1,
-0.3194326, -1.161302, -3.230144, 0, 1, 0.2392157, 1,
-0.3175741, 0.5354248, -0.306977, 0, 1, 0.2431373, 1,
-0.3166357, -0.3615591, -1.91094, 0, 1, 0.2509804, 1,
-0.3159721, 0.4160942, -1.37866, 0, 1, 0.254902, 1,
-0.3128549, -2.151725, -2.528276, 0, 1, 0.2627451, 1,
-0.3076375, -0.6309278, -2.133451, 0, 1, 0.2666667, 1,
-0.3067763, -0.77262, -3.862016, 0, 1, 0.2745098, 1,
-0.3044549, 1.111855, -1.412878, 0, 1, 0.2784314, 1,
-0.3038262, 1.85983, -0.4180512, 0, 1, 0.2862745, 1,
-0.3036115, 0.29066, -0.3613637, 0, 1, 0.2901961, 1,
-0.2968597, 0.5419605, 0.4524177, 0, 1, 0.2980392, 1,
-0.2941536, 0.5028088, 0.3499576, 0, 1, 0.3058824, 1,
-0.2939514, -0.4006602, -2.808827, 0, 1, 0.3098039, 1,
-0.2867914, 0.3367284, -0.6295062, 0, 1, 0.3176471, 1,
-0.2853254, 0.6094796, -0.5876844, 0, 1, 0.3215686, 1,
-0.2837927, -1.080016, -1.946518, 0, 1, 0.3294118, 1,
-0.2781864, 0.6376791, 0.002102941, 0, 1, 0.3333333, 1,
-0.2775894, -0.4847026, -2.350669, 0, 1, 0.3411765, 1,
-0.2760493, -0.6840873, -1.916016, 0, 1, 0.345098, 1,
-0.2745104, 0.625542, 0.4195022, 0, 1, 0.3529412, 1,
-0.2724621, 1.464699, 0.8173922, 0, 1, 0.3568628, 1,
-0.2696739, -0.1918039, -4.481438, 0, 1, 0.3647059, 1,
-0.2621398, 0.2492827, -2.489058, 0, 1, 0.3686275, 1,
-0.2605687, -0.6111025, -2.96304, 0, 1, 0.3764706, 1,
-0.2599394, -0.08755981, -1.087804, 0, 1, 0.3803922, 1,
-0.2579775, 1.795927, 0.3833571, 0, 1, 0.3882353, 1,
-0.2563404, 1.012539, -0.8650143, 0, 1, 0.3921569, 1,
-0.2499729, 0.7907663, 0.08048826, 0, 1, 0.4, 1,
-0.2492882, 0.2077009, -0.25212, 0, 1, 0.4078431, 1,
-0.2447099, -0.5794342, -3.603514, 0, 1, 0.4117647, 1,
-0.2436144, -1.212501, -3.198567, 0, 1, 0.4196078, 1,
-0.2388955, 0.8077822, -2.63875, 0, 1, 0.4235294, 1,
-0.2376578, 1.451966, -1.541116, 0, 1, 0.4313726, 1,
-0.2307247, -0.7652909, -3.582737, 0, 1, 0.4352941, 1,
-0.2287385, -0.546235, -2.203643, 0, 1, 0.4431373, 1,
-0.2261501, 0.5249893, 0.6867585, 0, 1, 0.4470588, 1,
-0.2184658, 0.001198539, -3.154592, 0, 1, 0.454902, 1,
-0.2180453, 1.978747, 0.5808333, 0, 1, 0.4588235, 1,
-0.2159928, -1.320428, -3.426666, 0, 1, 0.4666667, 1,
-0.2154988, -0.6031758, -3.093942, 0, 1, 0.4705882, 1,
-0.2097761, 0.1954591, -2.056382, 0, 1, 0.4784314, 1,
-0.2092081, 0.2258827, -0.4850913, 0, 1, 0.4823529, 1,
-0.208149, -0.1905717, -2.624653, 0, 1, 0.4901961, 1,
-0.2019381, 1.276127, -0.3003883, 0, 1, 0.4941176, 1,
-0.2007779, 0.07912772, -1.309985, 0, 1, 0.5019608, 1,
-0.1958499, -1.392879, -1.690147, 0, 1, 0.509804, 1,
-0.188817, 0.4012298, -0.4313749, 0, 1, 0.5137255, 1,
-0.1841062, -0.8827481, -2.172091, 0, 1, 0.5215687, 1,
-0.1824553, -1.869297, -4.386065, 0, 1, 0.5254902, 1,
-0.1809026, 0.1317294, 0.4817827, 0, 1, 0.5333334, 1,
-0.1738412, -2.062318, -3.718157, 0, 1, 0.5372549, 1,
-0.1715962, 0.4191414, -1.454678, 0, 1, 0.5450981, 1,
-0.1715333, 1.246166, 0.3481742, 0, 1, 0.5490196, 1,
-0.1707141, 1.625287, 0.1596411, 0, 1, 0.5568628, 1,
-0.1632634, 0.1613649, 0.3812794, 0, 1, 0.5607843, 1,
-0.1615889, 0.5375434, 1.367911, 0, 1, 0.5686275, 1,
-0.1599231, -1.178754, -1.035412, 0, 1, 0.572549, 1,
-0.1584155, -0.8098758, -3.080574, 0, 1, 0.5803922, 1,
-0.1563903, -0.2350107, -1.919365, 0, 1, 0.5843138, 1,
-0.1524308, 0.7447695, 0.7248219, 0, 1, 0.5921569, 1,
-0.1439747, -1.366425, -4.026804, 0, 1, 0.5960785, 1,
-0.1407067, 2.400551, 1.865879, 0, 1, 0.6039216, 1,
-0.1354205, -0.2330921, -1.82638, 0, 1, 0.6117647, 1,
-0.1353498, -0.692901, -2.18613, 0, 1, 0.6156863, 1,
-0.1347545, 1.135472, -1.074118, 0, 1, 0.6235294, 1,
-0.133875, -1.21922, -3.66216, 0, 1, 0.627451, 1,
-0.1315845, -0.7542407, -3.914504, 0, 1, 0.6352941, 1,
-0.122918, 1.400824, -0.1672933, 0, 1, 0.6392157, 1,
-0.1221529, 0.0218176, -3.450269, 0, 1, 0.6470588, 1,
-0.1172839, -2.772914, -1.529047, 0, 1, 0.6509804, 1,
-0.1117568, 1.188516, 0.1299629, 0, 1, 0.6588235, 1,
-0.1106665, 0.3405636, 0.1234966, 0, 1, 0.6627451, 1,
-0.1086769, 1.337081, -0.5641028, 0, 1, 0.6705883, 1,
-0.1068741, 0.9036098, -2.130777, 0, 1, 0.6745098, 1,
-0.1062757, -0.5269635, -3.744245, 0, 1, 0.682353, 1,
-0.1055341, -1.677003, -3.119159, 0, 1, 0.6862745, 1,
-0.1049607, 0.5198815, -0.8242988, 0, 1, 0.6941177, 1,
-0.1037915, -0.9906034, -2.470545, 0, 1, 0.7019608, 1,
-0.1022635, 1.136439, 1.399094, 0, 1, 0.7058824, 1,
-0.1017759, 1.808285, 1.200444, 0, 1, 0.7137255, 1,
-0.1010651, -0.7358565, -2.450159, 0, 1, 0.7176471, 1,
-0.09661471, -0.6589482, -3.840379, 0, 1, 0.7254902, 1,
-0.09661309, 0.37526, -0.3476084, 0, 1, 0.7294118, 1,
-0.09319416, -0.1364149, -3.80188, 0, 1, 0.7372549, 1,
-0.09203083, 1.326861, -0.7705027, 0, 1, 0.7411765, 1,
-0.08833638, -2.128987, -4.112879, 0, 1, 0.7490196, 1,
-0.08789608, 0.4421832, 0.3984136, 0, 1, 0.7529412, 1,
-0.08366977, 0.3931541, 0.9400151, 0, 1, 0.7607843, 1,
-0.08268763, -0.7693037, -1.642185, 0, 1, 0.7647059, 1,
-0.07828414, 1.053126, 0.2405857, 0, 1, 0.772549, 1,
-0.07823697, 0.2198376, -0.5557064, 0, 1, 0.7764706, 1,
-0.07759687, 0.3060651, -0.4043956, 0, 1, 0.7843137, 1,
-0.07715402, 0.1524213, -0.3131072, 0, 1, 0.7882353, 1,
-0.07601506, -0.797433, -2.033799, 0, 1, 0.7960784, 1,
-0.07596025, 0.5149573, -2.368413, 0, 1, 0.8039216, 1,
-0.06648207, -0.9492927, -3.929804, 0, 1, 0.8078431, 1,
-0.06332272, -0.5151311, -3.284723, 0, 1, 0.8156863, 1,
-0.06238334, -0.1540836, -3.643416, 0, 1, 0.8196079, 1,
-0.06228181, 0.5282663, -1.227888, 0, 1, 0.827451, 1,
-0.05742764, 0.7681651, -0.0009501246, 0, 1, 0.8313726, 1,
-0.05285337, -0.5740446, -3.376064, 0, 1, 0.8392157, 1,
-0.05044513, -0.3348049, -2.84485, 0, 1, 0.8431373, 1,
-0.04723811, -0.4978562, -3.841011, 0, 1, 0.8509804, 1,
-0.04446242, -2.84014, -3.1637, 0, 1, 0.854902, 1,
-0.04070865, -0.05892586, -2.314923, 0, 1, 0.8627451, 1,
-0.0365306, -1.134833, -2.501159, 0, 1, 0.8666667, 1,
-0.02710126, 0.6637355, 0.7865381, 0, 1, 0.8745098, 1,
-0.02547948, 0.276133, -0.3353099, 0, 1, 0.8784314, 1,
-0.02352378, 0.6777641, 1.577897, 0, 1, 0.8862745, 1,
-0.02131931, 1.890442, -1.040182, 0, 1, 0.8901961, 1,
-0.020643, 0.1179227, -0.216668, 0, 1, 0.8980392, 1,
-0.01393086, -0.3849107, -3.760187, 0, 1, 0.9058824, 1,
-0.01186441, 0.0555676, -0.9631754, 0, 1, 0.9098039, 1,
-0.008421278, -1.067173, -3.869286, 0, 1, 0.9176471, 1,
-0.004391361, 0.482787, 0.4064752, 0, 1, 0.9215686, 1,
-0.003529845, 0.05599765, 1.250355, 0, 1, 0.9294118, 1,
-0.003495029, -0.7526771, -2.855801, 0, 1, 0.9333333, 1,
0.001102325, 1.388072, 0.9686187, 0, 1, 0.9411765, 1,
0.003154998, 0.622427, -0.8857374, 0, 1, 0.945098, 1,
0.006091759, 0.5027754, -0.3854704, 0, 1, 0.9529412, 1,
0.00682639, -1.446726, 4.13993, 0, 1, 0.9568627, 1,
0.007193301, -0.4376457, 1.658694, 0, 1, 0.9647059, 1,
0.009778223, 0.8775705, -0.04507077, 0, 1, 0.9686275, 1,
0.01274121, 0.6008633, 0.2239657, 0, 1, 0.9764706, 1,
0.0174186, 1.473229, 0.7126759, 0, 1, 0.9803922, 1,
0.01780448, -1.217452, 2.633461, 0, 1, 0.9882353, 1,
0.01802304, 0.4384772, 0.6984434, 0, 1, 0.9921569, 1,
0.01810692, -0.1386223, 2.927375, 0, 1, 1, 1,
0.0221217, -0.1849659, 3.929352, 0, 0.9921569, 1, 1,
0.02326334, -1.272591, 3.673103, 0, 0.9882353, 1, 1,
0.02482189, -1.873004, 2.039343, 0, 0.9803922, 1, 1,
0.02652092, 0.7196522, -0.08245826, 0, 0.9764706, 1, 1,
0.0296459, 0.949048, -0.2528914, 0, 0.9686275, 1, 1,
0.03127525, 1.368613, -2.090562, 0, 0.9647059, 1, 1,
0.0317722, 0.1408446, 1.587213, 0, 0.9568627, 1, 1,
0.03313221, 1.565551, 1.496522, 0, 0.9529412, 1, 1,
0.03584145, -1.664668, 2.974442, 0, 0.945098, 1, 1,
0.03728773, 0.5149974, -2.30407, 0, 0.9411765, 1, 1,
0.03770507, -0.7186257, 2.268628, 0, 0.9333333, 1, 1,
0.04246244, 0.1361703, -1.20155, 0, 0.9294118, 1, 1,
0.04509081, -0.1753553, 3.733303, 0, 0.9215686, 1, 1,
0.05039685, -0.912911, 3.059136, 0, 0.9176471, 1, 1,
0.05040198, 1.159215, 0.1742895, 0, 0.9098039, 1, 1,
0.05226036, -1.641759, 2.133572, 0, 0.9058824, 1, 1,
0.05580688, -0.4349324, 2.524438, 0, 0.8980392, 1, 1,
0.05757765, -2.275873, 2.491289, 0, 0.8901961, 1, 1,
0.06206661, -0.5495643, 3.571045, 0, 0.8862745, 1, 1,
0.06298373, -0.1462345, 1.679381, 0, 0.8784314, 1, 1,
0.06562144, 0.04257063, 0.1795331, 0, 0.8745098, 1, 1,
0.07113761, 1.715398, -1.049615, 0, 0.8666667, 1, 1,
0.07173271, 0.4548206, 0.8379754, 0, 0.8627451, 1, 1,
0.07209947, 0.9476203, 0.1948673, 0, 0.854902, 1, 1,
0.07933361, 1.016416, -1.234058, 0, 0.8509804, 1, 1,
0.08075172, 0.8241861, 0.3799998, 0, 0.8431373, 1, 1,
0.08306993, 0.4436631, 0.9175617, 0, 0.8392157, 1, 1,
0.08558528, -1.693022, 2.299586, 0, 0.8313726, 1, 1,
0.08606537, 0.4740551, 0.9237387, 0, 0.827451, 1, 1,
0.08940212, 0.6502964, -0.5220177, 0, 0.8196079, 1, 1,
0.09087446, -1.129663, 2.73459, 0, 0.8156863, 1, 1,
0.09366708, 3.221148, -1.97013, 0, 0.8078431, 1, 1,
0.09804864, 1.392143, 0.6105681, 0, 0.8039216, 1, 1,
0.0995978, 0.01749512, 2.303658, 0, 0.7960784, 1, 1,
0.1018656, -0.7612629, 2.877133, 0, 0.7882353, 1, 1,
0.1082689, -1.303228, 3.19314, 0, 0.7843137, 1, 1,
0.1134789, 0.4710097, 0.3039957, 0, 0.7764706, 1, 1,
0.1145516, 1.53094, -0.2403508, 0, 0.772549, 1, 1,
0.1150872, -0.0741664, 1.613295, 0, 0.7647059, 1, 1,
0.1194067, -1.869494, 2.31186, 0, 0.7607843, 1, 1,
0.1250703, -0.1763519, 3.498282, 0, 0.7529412, 1, 1,
0.1295651, -0.5971827, 3.017148, 0, 0.7490196, 1, 1,
0.1306818, -1.307594, 3.946884, 0, 0.7411765, 1, 1,
0.1367517, -0.7410477, 1.83876, 0, 0.7372549, 1, 1,
0.1390783, -0.4726159, 3.758309, 0, 0.7294118, 1, 1,
0.1467953, 0.4901216, -0.5619518, 0, 0.7254902, 1, 1,
0.1523373, -0.9724414, 2.440075, 0, 0.7176471, 1, 1,
0.1566158, -0.8294355, 2.209664, 0, 0.7137255, 1, 1,
0.1591174, -0.3328877, 4.462187, 0, 0.7058824, 1, 1,
0.1594303, 1.137365, -0.7973127, 0, 0.6980392, 1, 1,
0.1617379, 0.1271436, 0.275452, 0, 0.6941177, 1, 1,
0.168982, 0.4337993, -0.1309434, 0, 0.6862745, 1, 1,
0.1735182, -0.7170779, 2.820114, 0, 0.682353, 1, 1,
0.1771547, 0.06740356, 0.702419, 0, 0.6745098, 1, 1,
0.1820389, -1.223075, 4.74755, 0, 0.6705883, 1, 1,
0.186211, -0.9691507, 2.813176, 0, 0.6627451, 1, 1,
0.1892457, 0.1000163, -0.1107996, 0, 0.6588235, 1, 1,
0.1951586, 0.6693163, -0.4403798, 0, 0.6509804, 1, 1,
0.1982669, -1.534913, 1.625102, 0, 0.6470588, 1, 1,
0.2017466, 0.7181857, 1.030623, 0, 0.6392157, 1, 1,
0.2041399, 0.9649454, -2.784959, 0, 0.6352941, 1, 1,
0.2049104, 0.1793201, -0.7298347, 0, 0.627451, 1, 1,
0.2071002, 0.611912, 0.1193179, 0, 0.6235294, 1, 1,
0.2080212, -0.2628658, 1.170437, 0, 0.6156863, 1, 1,
0.2116975, -1.264103, 4.236584, 0, 0.6117647, 1, 1,
0.2155048, -1.74379, 2.939457, 0, 0.6039216, 1, 1,
0.2210009, 0.7668624, 1.267643, 0, 0.5960785, 1, 1,
0.2219999, 0.04036519, -0.4859516, 0, 0.5921569, 1, 1,
0.2241849, -0.5025338, 2.03199, 0, 0.5843138, 1, 1,
0.2356265, 0.3352838, 1.237727, 0, 0.5803922, 1, 1,
0.2363675, -0.7594978, 4.722232, 0, 0.572549, 1, 1,
0.237242, -0.2283198, 2.645584, 0, 0.5686275, 1, 1,
0.2379661, -0.2939416, 2.503088, 0, 0.5607843, 1, 1,
0.2405548, -0.3814754, 3.450391, 0, 0.5568628, 1, 1,
0.2437129, 0.8499238, 0.02785227, 0, 0.5490196, 1, 1,
0.2437426, -0.6064345, 2.053965, 0, 0.5450981, 1, 1,
0.246657, 1.636081, 0.7611874, 0, 0.5372549, 1, 1,
0.2470466, 0.2818342, 1.308175, 0, 0.5333334, 1, 1,
0.2490676, 2.619826, -0.6627489, 0, 0.5254902, 1, 1,
0.2506432, 1.400482, 1.314848, 0, 0.5215687, 1, 1,
0.2507171, 0.2657252, -0.1842743, 0, 0.5137255, 1, 1,
0.2551665, 1.016671, -0.3045812, 0, 0.509804, 1, 1,
0.2560903, 0.166838, 0.8274853, 0, 0.5019608, 1, 1,
0.2605728, 0.2293988, 1.664555, 0, 0.4941176, 1, 1,
0.2621224, -0.3915096, 3.220546, 0, 0.4901961, 1, 1,
0.2649019, 0.6481043, 1.912914, 0, 0.4823529, 1, 1,
0.2678396, 0.5558487, 0.5056319, 0, 0.4784314, 1, 1,
0.2686689, -0.3943776, 2.675479, 0, 0.4705882, 1, 1,
0.2728467, 0.9036367, 2.177388, 0, 0.4666667, 1, 1,
0.2769869, 1.161001, 0.192735, 0, 0.4588235, 1, 1,
0.2821646, -0.3984874, 2.893411, 0, 0.454902, 1, 1,
0.2849772, -0.2818721, 2.905311, 0, 0.4470588, 1, 1,
0.2971304, -1.180364, 1.395868, 0, 0.4431373, 1, 1,
0.2979623, -0.1340127, 3.339501, 0, 0.4352941, 1, 1,
0.2990162, 1.499888, -0.5601289, 0, 0.4313726, 1, 1,
0.3001218, 0.08090229, 1.284004, 0, 0.4235294, 1, 1,
0.3020255, -1.157947, 3.14641, 0, 0.4196078, 1, 1,
0.3024071, 0.0676128, 0.1624399, 0, 0.4117647, 1, 1,
0.3042995, -1.930193, 3.282709, 0, 0.4078431, 1, 1,
0.3084162, -1.510939, 2.622766, 0, 0.4, 1, 1,
0.3095624, -0.4088444, 1.519259, 0, 0.3921569, 1, 1,
0.3108445, 0.6349163, 3.353561, 0, 0.3882353, 1, 1,
0.3144327, -0.1236582, 1.254303, 0, 0.3803922, 1, 1,
0.3272499, 1.535324, 0.5247604, 0, 0.3764706, 1, 1,
0.3280192, 0.25173, 0.6079625, 0, 0.3686275, 1, 1,
0.3335927, 1.33506, 0.4079393, 0, 0.3647059, 1, 1,
0.3348199, -0.1505334, 1.232776, 0, 0.3568628, 1, 1,
0.3349146, -0.1237826, 1.492649, 0, 0.3529412, 1, 1,
0.3376501, -1.54255, 2.837462, 0, 0.345098, 1, 1,
0.3376745, 0.2777567, -0.3236978, 0, 0.3411765, 1, 1,
0.3508631, 0.5598167, 0.7112743, 0, 0.3333333, 1, 1,
0.3525944, 0.04954069, 0.6913289, 0, 0.3294118, 1, 1,
0.3578704, 1.015682, -0.08423616, 0, 0.3215686, 1, 1,
0.3584358, 1.097037, 0.6928036, 0, 0.3176471, 1, 1,
0.3608772, 0.7784234, 1.75305, 0, 0.3098039, 1, 1,
0.3616878, -0.07877377, -0.4725, 0, 0.3058824, 1, 1,
0.3627875, -1.185126, 3.356736, 0, 0.2980392, 1, 1,
0.3630288, 0.6135562, 1.04114, 0, 0.2901961, 1, 1,
0.3639595, -0.067826, -0.252029, 0, 0.2862745, 1, 1,
0.3687404, 0.291645, -0.895377, 0, 0.2784314, 1, 1,
0.3716387, 0.1249067, 3.109254, 0, 0.2745098, 1, 1,
0.3734496, 0.05494393, 2.150065, 0, 0.2666667, 1, 1,
0.3746321, -0.6281652, 1.9811, 0, 0.2627451, 1, 1,
0.3815286, -1.17329, 3.163864, 0, 0.254902, 1, 1,
0.3848497, 0.6950688, 1.589318, 0, 0.2509804, 1, 1,
0.3854871, 0.3172116, 0.2751206, 0, 0.2431373, 1, 1,
0.387181, -0.9721702, 2.708051, 0, 0.2392157, 1, 1,
0.3940691, -0.1819991, 0.7649401, 0, 0.2313726, 1, 1,
0.3946708, 0.42874, 1.106608, 0, 0.227451, 1, 1,
0.3981347, 0.357671, 1.53967, 0, 0.2196078, 1, 1,
0.398775, 0.2792561, 0.5306303, 0, 0.2156863, 1, 1,
0.4010186, 0.6224367, 1.314692, 0, 0.2078431, 1, 1,
0.4035417, 0.684607, -1.213832, 0, 0.2039216, 1, 1,
0.4052697, 0.4571985, 0.4231077, 0, 0.1960784, 1, 1,
0.406454, 1.367185, 0.1399819, 0, 0.1882353, 1, 1,
0.4068977, -0.6632013, 2.58333, 0, 0.1843137, 1, 1,
0.4076788, -0.4465846, 2.881254, 0, 0.1764706, 1, 1,
0.4083838, 0.73261, -0.9504263, 0, 0.172549, 1, 1,
0.4087677, -1.242829, 1.907603, 0, 0.1647059, 1, 1,
0.4128458, 1.924478, 0.307099, 0, 0.1607843, 1, 1,
0.4166771, 1.003671, 1.880369, 0, 0.1529412, 1, 1,
0.4195406, -1.189917, 3.176208, 0, 0.1490196, 1, 1,
0.4265443, -0.504318, 2.005484, 0, 0.1411765, 1, 1,
0.4276717, -0.4183244, 3.175254, 0, 0.1372549, 1, 1,
0.439153, -1.275556, 3.050299, 0, 0.1294118, 1, 1,
0.4468993, 0.7588366, 1.189995, 0, 0.1254902, 1, 1,
0.4497408, 0.08906925, 1.845477, 0, 0.1176471, 1, 1,
0.4538474, 0.6136022, 0.3331024, 0, 0.1137255, 1, 1,
0.4551943, 0.3158642, -0.602508, 0, 0.1058824, 1, 1,
0.4577594, -0.04995728, 1.660298, 0, 0.09803922, 1, 1,
0.4593959, 0.8877716, 0.9046572, 0, 0.09411765, 1, 1,
0.4603093, -0.6523119, 2.33442, 0, 0.08627451, 1, 1,
0.4638215, -0.6053698, 2.533642, 0, 0.08235294, 1, 1,
0.4647067, 0.1818434, 0.6849524, 0, 0.07450981, 1, 1,
0.4674433, -0.5567594, 2.084044, 0, 0.07058824, 1, 1,
0.4734235, 0.7077784, -1.191587, 0, 0.0627451, 1, 1,
0.4758336, 0.4570944, 0.5470596, 0, 0.05882353, 1, 1,
0.4771696, -1.117741, 0.3513423, 0, 0.05098039, 1, 1,
0.4778423, -0.3285044, 2.30011, 0, 0.04705882, 1, 1,
0.4855427, -0.2085898, 0.7063668, 0, 0.03921569, 1, 1,
0.4861418, -0.6888555, 1.893285, 0, 0.03529412, 1, 1,
0.4866582, -0.05858461, 1.636108, 0, 0.02745098, 1, 1,
0.4871594, -0.2736257, 2.254305, 0, 0.02352941, 1, 1,
0.4893656, -1.072804, 0.02848176, 0, 0.01568628, 1, 1,
0.4911377, 0.6748921, 0.7978889, 0, 0.01176471, 1, 1,
0.5026007, -2.64187, 2.830369, 0, 0.003921569, 1, 1,
0.5041524, -0.287334, 3.899188, 0.003921569, 0, 1, 1,
0.505163, 1.300486, -1.198508, 0.007843138, 0, 1, 1,
0.507241, 0.3900564, 1.521331, 0.01568628, 0, 1, 1,
0.5094787, 0.6028648, 0.8329898, 0.01960784, 0, 1, 1,
0.5096287, -1.614033, 2.468981, 0.02745098, 0, 1, 1,
0.511539, -0.5236279, 3.130211, 0.03137255, 0, 1, 1,
0.5120556, -1.903841, 4.225, 0.03921569, 0, 1, 1,
0.5166598, 1.196857, 2.102775, 0.04313726, 0, 1, 1,
0.5189512, -0.6074102, 2.130701, 0.05098039, 0, 1, 1,
0.5207385, 0.09374393, 1.672133, 0.05490196, 0, 1, 1,
0.5224715, -2.119987, 2.305449, 0.0627451, 0, 1, 1,
0.5234728, 0.6006007, 0.9439585, 0.06666667, 0, 1, 1,
0.5243852, -1.783077, 2.860172, 0.07450981, 0, 1, 1,
0.5280793, -0.06456464, 2.204709, 0.07843138, 0, 1, 1,
0.5345932, -0.6239815, 3.557781, 0.08627451, 0, 1, 1,
0.5386913, -0.9380039, 5.192025, 0.09019608, 0, 1, 1,
0.5400016, 0.66066, 0.5385513, 0.09803922, 0, 1, 1,
0.5410679, -0.4882671, 2.932969, 0.1058824, 0, 1, 1,
0.5420451, 0.9183049, 0.2829218, 0.1098039, 0, 1, 1,
0.5481332, -0.616826, 2.106024, 0.1176471, 0, 1, 1,
0.5542204, 0.05736036, 1.620894, 0.1215686, 0, 1, 1,
0.5554382, -0.4470618, 4.285064, 0.1294118, 0, 1, 1,
0.5567505, 0.3362017, -0.3029432, 0.1333333, 0, 1, 1,
0.5587265, -0.2453561, 1.681078, 0.1411765, 0, 1, 1,
0.5606837, -1.276639, 4.801768, 0.145098, 0, 1, 1,
0.5634694, -0.8916443, 2.481644, 0.1529412, 0, 1, 1,
0.5736472, 0.2590955, 1.532663, 0.1568628, 0, 1, 1,
0.5765206, 1.587912, -0.07760902, 0.1647059, 0, 1, 1,
0.5785916, -0.6857978, 2.843809, 0.1686275, 0, 1, 1,
0.5844505, -1.255628, 2.573939, 0.1764706, 0, 1, 1,
0.5881798, -0.2383255, 1.969112, 0.1803922, 0, 1, 1,
0.5894838, -0.4442265, 1.658947, 0.1882353, 0, 1, 1,
0.5930661, -0.7759, 3.328366, 0.1921569, 0, 1, 1,
0.5934394, 0.7324265, 2.241435, 0.2, 0, 1, 1,
0.5945199, 0.8765574, 0.2626718, 0.2078431, 0, 1, 1,
0.5955114, 0.2064614, 1.545863, 0.2117647, 0, 1, 1,
0.5960063, 0.6050523, 0.5924793, 0.2196078, 0, 1, 1,
0.5963624, 0.3816317, 0.4383608, 0.2235294, 0, 1, 1,
0.5997741, -0.7464194, 2.358905, 0.2313726, 0, 1, 1,
0.601455, 1.706578, -0.09050156, 0.2352941, 0, 1, 1,
0.601995, -0.5647279, 3.005916, 0.2431373, 0, 1, 1,
0.6041634, -2.238878, 1.743508, 0.2470588, 0, 1, 1,
0.6051312, -1.685572, 2.906103, 0.254902, 0, 1, 1,
0.6056572, 0.4633951, 0.8016679, 0.2588235, 0, 1, 1,
0.6122748, -0.0001131171, -1.028332, 0.2666667, 0, 1, 1,
0.6141571, 2.388699, 0.5365278, 0.2705882, 0, 1, 1,
0.6208568, -1.66069, 1.45261, 0.2784314, 0, 1, 1,
0.6239324, 0.8744505, 2.200821, 0.282353, 0, 1, 1,
0.6332573, -0.272479, 1.66325, 0.2901961, 0, 1, 1,
0.6382394, -0.2592394, 3.003614, 0.2941177, 0, 1, 1,
0.6405297, 1.291121, 0.9999167, 0.3019608, 0, 1, 1,
0.6408547, -0.370377, 2.886949, 0.3098039, 0, 1, 1,
0.6423545, 0.5253066, 1.505634, 0.3137255, 0, 1, 1,
0.6464147, 2.007416, 0.8146508, 0.3215686, 0, 1, 1,
0.6464638, -1.377737, 2.999568, 0.3254902, 0, 1, 1,
0.6483365, 1.501662, -0.3870512, 0.3333333, 0, 1, 1,
0.6493109, -0.2119988, 1.109399, 0.3372549, 0, 1, 1,
0.6516521, -1.085248, 3.404152, 0.345098, 0, 1, 1,
0.6628878, -0.5862725, 2.072435, 0.3490196, 0, 1, 1,
0.6665535, 0.009169541, 2.333315, 0.3568628, 0, 1, 1,
0.6674474, 0.5342181, 1.076658, 0.3607843, 0, 1, 1,
0.6691678, 0.3065884, 1.816785, 0.3686275, 0, 1, 1,
0.6725379, -0.7069694, 2.328776, 0.372549, 0, 1, 1,
0.6738457, 1.564487, 0.09375656, 0.3803922, 0, 1, 1,
0.6740307, -0.1645056, 1.754902, 0.3843137, 0, 1, 1,
0.6762261, -1.120351, 2.532876, 0.3921569, 0, 1, 1,
0.6771016, -0.4769565, 2.041829, 0.3960784, 0, 1, 1,
0.6771292, -1.557375, 3.167551, 0.4039216, 0, 1, 1,
0.6824221, 0.7955154, 0.9552645, 0.4117647, 0, 1, 1,
0.6824827, -0.3194361, 1.65622, 0.4156863, 0, 1, 1,
0.6884648, -0.5897956, 1.680095, 0.4235294, 0, 1, 1,
0.6923808, -1.683685, 2.670849, 0.427451, 0, 1, 1,
0.6996213, -0.7689142, 3.049356, 0.4352941, 0, 1, 1,
0.7025484, 0.9519884, -0.2384259, 0.4392157, 0, 1, 1,
0.7033966, 0.1074043, 1.098884, 0.4470588, 0, 1, 1,
0.7061313, 0.6649369, 1.774982, 0.4509804, 0, 1, 1,
0.7091119, -0.3261445, 1.921864, 0.4588235, 0, 1, 1,
0.7098342, -0.4382404, 3.32491, 0.4627451, 0, 1, 1,
0.7103771, -0.1936009, 2.800032, 0.4705882, 0, 1, 1,
0.7150761, 1.39674, 0.2441432, 0.4745098, 0, 1, 1,
0.7185531, 0.420544, 0.9915648, 0.4823529, 0, 1, 1,
0.7195415, -1.592431, 2.243906, 0.4862745, 0, 1, 1,
0.7225651, -0.3590054, 2.475541, 0.4941176, 0, 1, 1,
0.7278997, -0.7523592, 2.430501, 0.5019608, 0, 1, 1,
0.7331145, -0.08256225, 0.5055007, 0.5058824, 0, 1, 1,
0.7373152, 0.9779624, 0.01143621, 0.5137255, 0, 1, 1,
0.7437345, -0.8518041, -0.4784223, 0.5176471, 0, 1, 1,
0.7503057, -0.658316, 0.5851817, 0.5254902, 0, 1, 1,
0.7517585, -0.8205526, 0.9610319, 0.5294118, 0, 1, 1,
0.7525087, -1.112116, 2.668806, 0.5372549, 0, 1, 1,
0.761722, 0.07170165, 1.926954, 0.5411765, 0, 1, 1,
0.7638075, -1.422499, 2.016541, 0.5490196, 0, 1, 1,
0.7641934, -1.235174, 2.797174, 0.5529412, 0, 1, 1,
0.7711286, 1.507228, 0.9032391, 0.5607843, 0, 1, 1,
0.7722241, 0.1859412, -0.3392042, 0.5647059, 0, 1, 1,
0.7777902, 0.3688793, 1.837676, 0.572549, 0, 1, 1,
0.7808316, -0.7807316, 2.259701, 0.5764706, 0, 1, 1,
0.7822262, 0.4072913, 0.9172375, 0.5843138, 0, 1, 1,
0.7832065, -0.1767173, 1.475716, 0.5882353, 0, 1, 1,
0.7897399, -1.468195, 1.53482, 0.5960785, 0, 1, 1,
0.7968681, 1.230052, 0.7304552, 0.6039216, 0, 1, 1,
0.798909, -0.9953583, 0.7715908, 0.6078432, 0, 1, 1,
0.8073974, -0.4956542, 2.86478, 0.6156863, 0, 1, 1,
0.8079967, 0.608427, 2.87837, 0.6196079, 0, 1, 1,
0.8095517, 0.4405079, 2.553656, 0.627451, 0, 1, 1,
0.8183867, 1.416991, 1.442374, 0.6313726, 0, 1, 1,
0.819309, -0.4809183, 2.19975, 0.6392157, 0, 1, 1,
0.8203995, -0.6528358, 1.422835, 0.6431373, 0, 1, 1,
0.8352497, -0.3827758, 2.799113, 0.6509804, 0, 1, 1,
0.8379025, -0.1329169, 2.414319, 0.654902, 0, 1, 1,
0.8423126, 1.49774, 0.3320289, 0.6627451, 0, 1, 1,
0.8445137, 0.8965501, 0.4096155, 0.6666667, 0, 1, 1,
0.8449212, 0.1226855, 0.7197049, 0.6745098, 0, 1, 1,
0.8479756, 1.512997, -0.003029091, 0.6784314, 0, 1, 1,
0.8537281, -0.001837891, 2.287234, 0.6862745, 0, 1, 1,
0.854557, 0.9667737, -0.6038354, 0.6901961, 0, 1, 1,
0.8575082, -1.573328, 1.955519, 0.6980392, 0, 1, 1,
0.858499, 0.5257763, 1.368921, 0.7058824, 0, 1, 1,
0.8610932, -2.372353, 2.458502, 0.7098039, 0, 1, 1,
0.8627936, -0.8515289, 2.643624, 0.7176471, 0, 1, 1,
0.8643356, -0.1029395, 1.249127, 0.7215686, 0, 1, 1,
0.865267, 0.2885045, 0.708174, 0.7294118, 0, 1, 1,
0.867397, 0.1803098, 0.5227406, 0.7333333, 0, 1, 1,
0.8680845, 0.5923405, 1.371623, 0.7411765, 0, 1, 1,
0.8699616, -0.03235948, -0.3357383, 0.7450981, 0, 1, 1,
0.8705766, -0.4138493, 0.3635068, 0.7529412, 0, 1, 1,
0.8763771, 0.2508961, 1.284797, 0.7568628, 0, 1, 1,
0.8792228, -0.3938518, -0.7416602, 0.7647059, 0, 1, 1,
0.8815381, -0.6341907, 1.973082, 0.7686275, 0, 1, 1,
0.8829403, -0.4984794, 2.122411, 0.7764706, 0, 1, 1,
0.8846334, 0.5331986, 2.406621, 0.7803922, 0, 1, 1,
0.8889257, -1.304504, 1.901071, 0.7882353, 0, 1, 1,
0.8922759, 0.827177, 0.4301872, 0.7921569, 0, 1, 1,
0.8938042, 0.02644293, 1.377215, 0.8, 0, 1, 1,
0.901446, 0.63284, 1.236121, 0.8078431, 0, 1, 1,
0.9019372, -0.5073742, 2.859483, 0.8117647, 0, 1, 1,
0.9090108, 0.9388476, 0.2701432, 0.8196079, 0, 1, 1,
0.9172001, 0.05008847, 0.4031106, 0.8235294, 0, 1, 1,
0.9191507, 0.5609131, 0.06823798, 0.8313726, 0, 1, 1,
0.93178, 1.218866, 1.419615, 0.8352941, 0, 1, 1,
0.9449456, 1.993017, -0.4606516, 0.8431373, 0, 1, 1,
0.9465249, 0.04620063, 1.369918, 0.8470588, 0, 1, 1,
0.9485578, -0.03348765, 2.33639, 0.854902, 0, 1, 1,
0.9523507, 0.6508043, 2.240214, 0.8588235, 0, 1, 1,
0.9599134, -0.7634829, 1.296545, 0.8666667, 0, 1, 1,
0.9601757, -0.855801, 2.343671, 0.8705882, 0, 1, 1,
0.9659207, 0.5420778, 0.5132321, 0.8784314, 0, 1, 1,
0.9672958, 1.192113, 0.5545114, 0.8823529, 0, 1, 1,
0.9752149, -1.159051, 1.466981, 0.8901961, 0, 1, 1,
0.9771799, -0.3447965, 1.031444, 0.8941177, 0, 1, 1,
0.9817066, -1.643543, 2.525949, 0.9019608, 0, 1, 1,
0.9828526, 0.7971948, 1.180693, 0.9098039, 0, 1, 1,
0.9953917, -0.3241691, 1.731685, 0.9137255, 0, 1, 1,
1.005896, -0.03534399, 1.485604, 0.9215686, 0, 1, 1,
1.00724, -0.2554339, 0.638965, 0.9254902, 0, 1, 1,
1.023249, -2.298086, 3.009025, 0.9333333, 0, 1, 1,
1.025167, 0.4418746, 0.5645345, 0.9372549, 0, 1, 1,
1.030541, 1.671133, 1.334094, 0.945098, 0, 1, 1,
1.032286, -0.9279519, 2.700004, 0.9490196, 0, 1, 1,
1.033891, 0.7337855, -0.4059647, 0.9568627, 0, 1, 1,
1.037055, 0.502058, 0.6296808, 0.9607843, 0, 1, 1,
1.045737, -0.8601838, 2.923761, 0.9686275, 0, 1, 1,
1.047497, -0.8380455, 3.487557, 0.972549, 0, 1, 1,
1.056581, 0.2967311, 0.5039902, 0.9803922, 0, 1, 1,
1.056791, -1.319946, 0.7226729, 0.9843137, 0, 1, 1,
1.05858, -0.7066395, 3.799539, 0.9921569, 0, 1, 1,
1.059515, -1.195351, 3.131294, 0.9960784, 0, 1, 1,
1.061891, 0.2813482, -0.5031861, 1, 0, 0.9960784, 1,
1.062371, 0.4497057, 3.296351, 1, 0, 0.9882353, 1,
1.068443, -1.705005, 0.4872527, 1, 0, 0.9843137, 1,
1.075493, 1.588407, 1.438424, 1, 0, 0.9764706, 1,
1.078515, -0.9347689, 2.520212, 1, 0, 0.972549, 1,
1.084509, -0.6584244, 5.063736, 1, 0, 0.9647059, 1,
1.088024, -0.2889836, 3.413326, 1, 0, 0.9607843, 1,
1.095605, -0.7314588, 2.692852, 1, 0, 0.9529412, 1,
1.097962, -0.5887315, 3.12238, 1, 0, 0.9490196, 1,
1.101115, -0.009737467, 0.6359069, 1, 0, 0.9411765, 1,
1.104294, 1.021021, 1.450272, 1, 0, 0.9372549, 1,
1.110114, -1.6381, 0.3559493, 1, 0, 0.9294118, 1,
1.111513, -0.606031, 2.083276, 1, 0, 0.9254902, 1,
1.11627, -2.030973, 4.37565, 1, 0, 0.9176471, 1,
1.122509, 0.956564, 1.943615, 1, 0, 0.9137255, 1,
1.133223, -1.245309, 2.118608, 1, 0, 0.9058824, 1,
1.136461, -0.1147195, -0.5042695, 1, 0, 0.9019608, 1,
1.141983, 1.91238, 0.09885305, 1, 0, 0.8941177, 1,
1.14398, -1.231803, 3.575727, 1, 0, 0.8862745, 1,
1.146923, -1.285736, 3.365257, 1, 0, 0.8823529, 1,
1.154806, -0.4123099, 2.819261, 1, 0, 0.8745098, 1,
1.157311, 0.05184056, 1.739851, 1, 0, 0.8705882, 1,
1.157939, 0.1168589, 1.294953, 1, 0, 0.8627451, 1,
1.159975, 0.07607798, 2.902182, 1, 0, 0.8588235, 1,
1.160749, 0.9547262, 1.865987, 1, 0, 0.8509804, 1,
1.163069, -0.2274497, 5.08039, 1, 0, 0.8470588, 1,
1.16811, -1.099472, 1.260961, 1, 0, 0.8392157, 1,
1.180412, 0.453208, -0.3309366, 1, 0, 0.8352941, 1,
1.180678, -0.447852, 1.800503, 1, 0, 0.827451, 1,
1.190141, -0.1995381, 2.808996, 1, 0, 0.8235294, 1,
1.195083, -0.7742981, 1.462029, 1, 0, 0.8156863, 1,
1.197116, -1.169781, 2.807971, 1, 0, 0.8117647, 1,
1.197684, 1.183551, 1.603993, 1, 0, 0.8039216, 1,
1.201857, -0.5487943, 1.230812, 1, 0, 0.7960784, 1,
1.20275, -1.041828, 4.334441, 1, 0, 0.7921569, 1,
1.206401, 1.560073, 1.189689, 1, 0, 0.7843137, 1,
1.210904, -1.120561, 2.609953, 1, 0, 0.7803922, 1,
1.212065, -1.032795, 2.213497, 1, 0, 0.772549, 1,
1.213081, -0.04156926, 1.847828, 1, 0, 0.7686275, 1,
1.215353, -0.7101626, 0.7988033, 1, 0, 0.7607843, 1,
1.216579, -1.06837, -0.2558055, 1, 0, 0.7568628, 1,
1.218511, 2.245973, -1.2612, 1, 0, 0.7490196, 1,
1.221956, -0.8861023, 1.203865, 1, 0, 0.7450981, 1,
1.223336, -0.0863303, 0.6805053, 1, 0, 0.7372549, 1,
1.225271, -0.1510351, 3.245989, 1, 0, 0.7333333, 1,
1.236706, 3.47894, 0.6082414, 1, 0, 0.7254902, 1,
1.238999, -0.5411307, 1.962638, 1, 0, 0.7215686, 1,
1.244839, -0.05263579, 3.492615, 1, 0, 0.7137255, 1,
1.247445, 0.316635, 0.04246876, 1, 0, 0.7098039, 1,
1.273708, -0.5022458, 0.5342634, 1, 0, 0.7019608, 1,
1.282125, 0.5395818, 2.135781, 1, 0, 0.6941177, 1,
1.288869, -0.1041576, 2.842282, 1, 0, 0.6901961, 1,
1.289882, 0.1089997, -0.2604163, 1, 0, 0.682353, 1,
1.290351, -0.8685266, 1.804776, 1, 0, 0.6784314, 1,
1.294736, 0.6236132, -0.2005829, 1, 0, 0.6705883, 1,
1.296317, 0.6227532, -0.3294077, 1, 0, 0.6666667, 1,
1.299521, 0.1365258, 1.001057, 1, 0, 0.6588235, 1,
1.311175, 1.423535, -0.2392687, 1, 0, 0.654902, 1,
1.31433, 0.848164, 0.3776636, 1, 0, 0.6470588, 1,
1.335948, -1.229425, 1.571831, 1, 0, 0.6431373, 1,
1.338613, -0.5379725, -0.6724507, 1, 0, 0.6352941, 1,
1.347977, -1.566965, 1.185386, 1, 0, 0.6313726, 1,
1.353684, 0.6773403, -0.01378922, 1, 0, 0.6235294, 1,
1.356856, -0.2428088, 1.023668, 1, 0, 0.6196079, 1,
1.360417, 0.03726967, 1.610296, 1, 0, 0.6117647, 1,
1.363309, 0.02767028, 2.676792, 1, 0, 0.6078432, 1,
1.364404, 0.5842492, 1.274076, 1, 0, 0.6, 1,
1.38147, 1.05408, 1.259197, 1, 0, 0.5921569, 1,
1.397017, -0.4990825, 3.205371, 1, 0, 0.5882353, 1,
1.40238, -1.051904, 3.343922, 1, 0, 0.5803922, 1,
1.407732, 0.4740348, 1.434431, 1, 0, 0.5764706, 1,
1.414565, -0.3929624, 1.419086, 1, 0, 0.5686275, 1,
1.416062, -0.8516082, 2.617852, 1, 0, 0.5647059, 1,
1.418825, -0.8569189, 2.592323, 1, 0, 0.5568628, 1,
1.432916, 0.3144433, 0.7429994, 1, 0, 0.5529412, 1,
1.432943, 0.5300033, 0.7136838, 1, 0, 0.5450981, 1,
1.435891, 0.2293128, 2.851847, 1, 0, 0.5411765, 1,
1.436188, 1.525295, -0.8743767, 1, 0, 0.5333334, 1,
1.438854, 1.833542, -1.728915, 1, 0, 0.5294118, 1,
1.453883, 0.5463187, 0.1755625, 1, 0, 0.5215687, 1,
1.455608, 0.9218789, 1.470344, 1, 0, 0.5176471, 1,
1.458968, 0.7849372, 0.9021739, 1, 0, 0.509804, 1,
1.487073, 0.7217291, 0.9575328, 1, 0, 0.5058824, 1,
1.487972, -1.913787, 2.801989, 1, 0, 0.4980392, 1,
1.490373, 1.51934, 0.2945879, 1, 0, 0.4901961, 1,
1.496653, 0.4214621, 0.4242764, 1, 0, 0.4862745, 1,
1.505528, -0.7670647, 1.85933, 1, 0, 0.4784314, 1,
1.507481, 0.04320651, 1.029589, 1, 0, 0.4745098, 1,
1.509543, 0.3018308, 0.9204933, 1, 0, 0.4666667, 1,
1.516342, 0.9772781, -0.2396264, 1, 0, 0.4627451, 1,
1.521138, -1.501788, 2.007385, 1, 0, 0.454902, 1,
1.52287, 2.665149, 1.916209, 1, 0, 0.4509804, 1,
1.528086, 1.223591, 0.4550677, 1, 0, 0.4431373, 1,
1.543491, -0.2070756, 1.944113, 1, 0, 0.4392157, 1,
1.544816, 0.05229225, 0.4373365, 1, 0, 0.4313726, 1,
1.550419, 1.097452, 0.05731647, 1, 0, 0.427451, 1,
1.557913, -0.4840415, 3.509024, 1, 0, 0.4196078, 1,
1.568411, -0.478579, 1.301129, 1, 0, 0.4156863, 1,
1.575781, -0.02408674, 1.887541, 1, 0, 0.4078431, 1,
1.576832, 0.1862136, 0.5687941, 1, 0, 0.4039216, 1,
1.578465, 0.933741, 0.4366178, 1, 0, 0.3960784, 1,
1.581965, 1.023711, 1.78384, 1, 0, 0.3882353, 1,
1.587918, 0.3492211, 0.742277, 1, 0, 0.3843137, 1,
1.592124, -0.3471719, 2.841426, 1, 0, 0.3764706, 1,
1.602825, -1.321346, 1.154607, 1, 0, 0.372549, 1,
1.613, 2.577921, -0.3859143, 1, 0, 0.3647059, 1,
1.629097, 1.289513, 2.740309, 1, 0, 0.3607843, 1,
1.635321, 0.1226741, 1.602444, 1, 0, 0.3529412, 1,
1.63847, 0.09273745, 0.2270317, 1, 0, 0.3490196, 1,
1.648334, -0.5868884, 2.309986, 1, 0, 0.3411765, 1,
1.651055, 0.6376103, -0.3395073, 1, 0, 0.3372549, 1,
1.651882, -1.442119, 1.78085, 1, 0, 0.3294118, 1,
1.665324, 0.5403117, 1.032548, 1, 0, 0.3254902, 1,
1.667436, 0.2249, -1.145337, 1, 0, 0.3176471, 1,
1.667821, -1.005139, 1.767648, 1, 0, 0.3137255, 1,
1.668401, -1.886921, 5.171587, 1, 0, 0.3058824, 1,
1.686329, -0.102291, 1.254116, 1, 0, 0.2980392, 1,
1.689755, 1.028825, 2.141321, 1, 0, 0.2941177, 1,
1.720459, 0.3973709, 1.353523, 1, 0, 0.2862745, 1,
1.732787, 0.267228, 2.185623, 1, 0, 0.282353, 1,
1.733779, 1.035982, -0.436956, 1, 0, 0.2745098, 1,
1.74124, 0.4850939, 2.290111, 1, 0, 0.2705882, 1,
1.741703, -1.930468, 0.4123971, 1, 0, 0.2627451, 1,
1.745865, -1.897434, 2.734865, 1, 0, 0.2588235, 1,
1.787472, 0.05797223, 0.9319169, 1, 0, 0.2509804, 1,
1.790056, 0.3116397, 0.5367876, 1, 0, 0.2470588, 1,
1.790135, -0.3986968, 1.826741, 1, 0, 0.2392157, 1,
1.791602, 0.302579, 0.3123336, 1, 0, 0.2352941, 1,
1.796611, 1.394497, 1.649241, 1, 0, 0.227451, 1,
1.799489, -0.05731366, 3.497513, 1, 0, 0.2235294, 1,
1.804944, -2.119552, 1.803862, 1, 0, 0.2156863, 1,
1.822936, -0.1291363, 0.5043728, 1, 0, 0.2117647, 1,
1.842562, 0.1100723, 3.263419, 1, 0, 0.2039216, 1,
1.843841, -0.7214236, 1.298338, 1, 0, 0.1960784, 1,
1.866472, -0.7159002, 0.9174277, 1, 0, 0.1921569, 1,
1.888394, 1.419471, 0.4032342, 1, 0, 0.1843137, 1,
1.890632, -0.2491555, 1.068805, 1, 0, 0.1803922, 1,
1.975139, 0.3246715, 0.8886909, 1, 0, 0.172549, 1,
1.977009, -0.5475575, 3.894875, 1, 0, 0.1686275, 1,
1.993367, -0.5699551, 1.110415, 1, 0, 0.1607843, 1,
2.03093, -0.2185799, 2.98403, 1, 0, 0.1568628, 1,
2.030979, 0.2359073, 0.9634421, 1, 0, 0.1490196, 1,
2.039309, -1.530122, 1.207989, 1, 0, 0.145098, 1,
2.04418, 0.8307392, 1.229356, 1, 0, 0.1372549, 1,
2.055388, 0.3923952, 1.804955, 1, 0, 0.1333333, 1,
2.059479, -0.688348, 1.797329, 1, 0, 0.1254902, 1,
2.060891, 0.04703574, -0.6999703, 1, 0, 0.1215686, 1,
2.063836, -0.3638211, 1.101107, 1, 0, 0.1137255, 1,
2.07625, -1.07835, 3.599351, 1, 0, 0.1098039, 1,
2.077199, -2.629941, 2.159674, 1, 0, 0.1019608, 1,
2.124869, 0.2152087, 1.926153, 1, 0, 0.09411765, 1,
2.127267, 0.6555504, 3.177552, 1, 0, 0.09019608, 1,
2.14244, -0.7826232, 2.956007, 1, 0, 0.08235294, 1,
2.150306, 0.9579653, 1.379725, 1, 0, 0.07843138, 1,
2.198692, 0.5406989, 1.1588, 1, 0, 0.07058824, 1,
2.198972, 0.4937019, 1.924573, 1, 0, 0.06666667, 1,
2.203604, 0.7858882, -0.09302785, 1, 0, 0.05882353, 1,
2.271797, -0.2054804, 0.107427, 1, 0, 0.05490196, 1,
2.353925, -0.2082866, 1.199104, 1, 0, 0.04705882, 1,
2.372912, -0.6433728, 3.357594, 1, 0, 0.04313726, 1,
2.41645, 2.110728, -0.1643846, 1, 0, 0.03529412, 1,
2.457162, -1.685066, 4.5048, 1, 0, 0.03137255, 1,
2.521461, 0.1255549, 1.10351, 1, 0, 0.02352941, 1,
2.61473, -0.408276, 0.892549, 1, 0, 0.01960784, 1,
2.776496, 1.406453, 1.687983, 1, 0, 0.01176471, 1,
2.850832, 0.92726, 1.647901, 1, 0, 0.007843138, 1
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
-0.378019, -4.416523, -6.444161, 0, -0.5, 0.5, 0.5,
-0.378019, -4.416523, -6.444161, 1, -0.5, 0.5, 0.5,
-0.378019, -4.416523, -6.444161, 1, 1.5, 0.5, 0.5,
-0.378019, -4.416523, -6.444161, 0, 1.5, 0.5, 0.5
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
-4.70145, 0.6601051, -6.444161, 0, -0.5, 0.5, 0.5,
-4.70145, 0.6601051, -6.444161, 1, -0.5, 0.5, 0.5,
-4.70145, 0.6601051, -6.444161, 1, 1.5, 0.5, 0.5,
-4.70145, 0.6601051, -6.444161, 0, 1.5, 0.5, 0.5
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
-4.70145, -4.416523, 0.21717, 0, -0.5, 0.5, 0.5,
-4.70145, -4.416523, 0.21717, 1, -0.5, 0.5, 0.5,
-4.70145, -4.416523, 0.21717, 1, 1.5, 0.5, 0.5,
-4.70145, -4.416523, 0.21717, 0, 1.5, 0.5, 0.5
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
-3, -3.244994, -4.906931,
2, -3.244994, -4.906931,
-3, -3.244994, -4.906931,
-3, -3.440249, -5.163136,
-2, -3.244994, -4.906931,
-2, -3.440249, -5.163136,
-1, -3.244994, -4.906931,
-1, -3.440249, -5.163136,
0, -3.244994, -4.906931,
0, -3.440249, -5.163136,
1, -3.244994, -4.906931,
1, -3.440249, -5.163136,
2, -3.244994, -4.906931,
2, -3.440249, -5.163136
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
-3, -3.830759, -5.675546, 0, -0.5, 0.5, 0.5,
-3, -3.830759, -5.675546, 1, -0.5, 0.5, 0.5,
-3, -3.830759, -5.675546, 1, 1.5, 0.5, 0.5,
-3, -3.830759, -5.675546, 0, 1.5, 0.5, 0.5,
-2, -3.830759, -5.675546, 0, -0.5, 0.5, 0.5,
-2, -3.830759, -5.675546, 1, -0.5, 0.5, 0.5,
-2, -3.830759, -5.675546, 1, 1.5, 0.5, 0.5,
-2, -3.830759, -5.675546, 0, 1.5, 0.5, 0.5,
-1, -3.830759, -5.675546, 0, -0.5, 0.5, 0.5,
-1, -3.830759, -5.675546, 1, -0.5, 0.5, 0.5,
-1, -3.830759, -5.675546, 1, 1.5, 0.5, 0.5,
-1, -3.830759, -5.675546, 0, 1.5, 0.5, 0.5,
0, -3.830759, -5.675546, 0, -0.5, 0.5, 0.5,
0, -3.830759, -5.675546, 1, -0.5, 0.5, 0.5,
0, -3.830759, -5.675546, 1, 1.5, 0.5, 0.5,
0, -3.830759, -5.675546, 0, 1.5, 0.5, 0.5,
1, -3.830759, -5.675546, 0, -0.5, 0.5, 0.5,
1, -3.830759, -5.675546, 1, -0.5, 0.5, 0.5,
1, -3.830759, -5.675546, 1, 1.5, 0.5, 0.5,
1, -3.830759, -5.675546, 0, 1.5, 0.5, 0.5,
2, -3.830759, -5.675546, 0, -0.5, 0.5, 0.5,
2, -3.830759, -5.675546, 1, -0.5, 0.5, 0.5,
2, -3.830759, -5.675546, 1, 1.5, 0.5, 0.5,
2, -3.830759, -5.675546, 0, 1.5, 0.5, 0.5
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
-3.703735, -2, -4.906931,
-3.703735, 4, -4.906931,
-3.703735, -2, -4.906931,
-3.870021, -2, -5.163136,
-3.703735, 0, -4.906931,
-3.870021, 0, -5.163136,
-3.703735, 2, -4.906931,
-3.870021, 2, -5.163136,
-3.703735, 4, -4.906931,
-3.870021, 4, -5.163136
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
"2",
"4"
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
-4.202593, -2, -5.675546, 0, -0.5, 0.5, 0.5,
-4.202593, -2, -5.675546, 1, -0.5, 0.5, 0.5,
-4.202593, -2, -5.675546, 1, 1.5, 0.5, 0.5,
-4.202593, -2, -5.675546, 0, 1.5, 0.5, 0.5,
-4.202593, 0, -5.675546, 0, -0.5, 0.5, 0.5,
-4.202593, 0, -5.675546, 1, -0.5, 0.5, 0.5,
-4.202593, 0, -5.675546, 1, 1.5, 0.5, 0.5,
-4.202593, 0, -5.675546, 0, 1.5, 0.5, 0.5,
-4.202593, 2, -5.675546, 0, -0.5, 0.5, 0.5,
-4.202593, 2, -5.675546, 1, -0.5, 0.5, 0.5,
-4.202593, 2, -5.675546, 1, 1.5, 0.5, 0.5,
-4.202593, 2, -5.675546, 0, 1.5, 0.5, 0.5,
-4.202593, 4, -5.675546, 0, -0.5, 0.5, 0.5,
-4.202593, 4, -5.675546, 1, -0.5, 0.5, 0.5,
-4.202593, 4, -5.675546, 1, 1.5, 0.5, 0.5,
-4.202593, 4, -5.675546, 0, 1.5, 0.5, 0.5
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
-3.703735, -3.244994, -4,
-3.703735, -3.244994, 4,
-3.703735, -3.244994, -4,
-3.870021, -3.440249, -4,
-3.703735, -3.244994, -2,
-3.870021, -3.440249, -2,
-3.703735, -3.244994, 0,
-3.870021, -3.440249, 0,
-3.703735, -3.244994, 2,
-3.870021, -3.440249, 2,
-3.703735, -3.244994, 4,
-3.870021, -3.440249, 4
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
-4.202593, -3.830759, -4, 0, -0.5, 0.5, 0.5,
-4.202593, -3.830759, -4, 1, -0.5, 0.5, 0.5,
-4.202593, -3.830759, -4, 1, 1.5, 0.5, 0.5,
-4.202593, -3.830759, -4, 0, 1.5, 0.5, 0.5,
-4.202593, -3.830759, -2, 0, -0.5, 0.5, 0.5,
-4.202593, -3.830759, -2, 1, -0.5, 0.5, 0.5,
-4.202593, -3.830759, -2, 1, 1.5, 0.5, 0.5,
-4.202593, -3.830759, -2, 0, 1.5, 0.5, 0.5,
-4.202593, -3.830759, 0, 0, -0.5, 0.5, 0.5,
-4.202593, -3.830759, 0, 1, -0.5, 0.5, 0.5,
-4.202593, -3.830759, 0, 1, 1.5, 0.5, 0.5,
-4.202593, -3.830759, 0, 0, 1.5, 0.5, 0.5,
-4.202593, -3.830759, 2, 0, -0.5, 0.5, 0.5,
-4.202593, -3.830759, 2, 1, -0.5, 0.5, 0.5,
-4.202593, -3.830759, 2, 1, 1.5, 0.5, 0.5,
-4.202593, -3.830759, 2, 0, 1.5, 0.5, 0.5,
-4.202593, -3.830759, 4, 0, -0.5, 0.5, 0.5,
-4.202593, -3.830759, 4, 1, -0.5, 0.5, 0.5,
-4.202593, -3.830759, 4, 1, 1.5, 0.5, 0.5,
-4.202593, -3.830759, 4, 0, 1.5, 0.5, 0.5
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
-3.703735, -3.244994, -4.906931,
-3.703735, 4.565204, -4.906931,
-3.703735, -3.244994, 5.341271,
-3.703735, 4.565204, 5.341271,
-3.703735, -3.244994, -4.906931,
-3.703735, -3.244994, 5.341271,
-3.703735, 4.565204, -4.906931,
-3.703735, 4.565204, 5.341271,
-3.703735, -3.244994, -4.906931,
2.947697, -3.244994, -4.906931,
-3.703735, -3.244994, 5.341271,
2.947697, -3.244994, 5.341271,
-3.703735, 4.565204, -4.906931,
2.947697, 4.565204, -4.906931,
-3.703735, 4.565204, 5.341271,
2.947697, 4.565204, 5.341271,
2.947697, -3.244994, -4.906931,
2.947697, 4.565204, -4.906931,
2.947697, -3.244994, 5.341271,
2.947697, 4.565204, 5.341271,
2.947697, -3.244994, -4.906931,
2.947697, -3.244994, 5.341271,
2.947697, 4.565204, -4.906931,
2.947697, 4.565204, 5.341271
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
var radius = 7.74302;
var distance = 34.44957;
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
mvMatrix.translate( 0.378019, -0.6601051, -0.21717 );
mvMatrix.scale( 1.258662, 1.07192, 0.8169146 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.44957);
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
methyl_ester<-read.table("methyl_ester.xyz")
```

```
## Error in read.table("methyl_ester.xyz"): no lines available in input
```

```r
x<-methyl_ester$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
```

```r
y<-methyl_ester$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
```

```r
z<-methyl_ester$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
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
-3.60687, 1.413438, 0.2739471, 0, 0, 1, 1, 1,
-3.099065, 0.776523, -1.625817, 1, 0, 0, 1, 1,
-3.046313, 1.982844, -1.189433, 1, 0, 0, 1, 1,
-2.979763, -0.3071708, 0.09701958, 1, 0, 0, 1, 1,
-2.490898, 0.7307184, -0.7256605, 1, 0, 0, 1, 1,
-2.488688, -0.8580516, -1.763418, 1, 0, 0, 1, 1,
-2.439403, -0.9561811, -1.526905, 0, 0, 0, 1, 1,
-2.399588, -1.439296, -1.945253, 0, 0, 0, 1, 1,
-2.375355, -0.3009311, -1.321109, 0, 0, 0, 1, 1,
-2.262201, -1.437848, -1.532548, 0, 0, 0, 1, 1,
-2.2496, -1.057581, -2.131239, 0, 0, 0, 1, 1,
-2.244051, 0.7797353, -3.401406, 0, 0, 0, 1, 1,
-2.227116, -0.9707581, -3.508648, 0, 0, 0, 1, 1,
-2.226561, 2.770295, -0.3810157, 1, 1, 1, 1, 1,
-2.180999, 0.2990329, 0.02832981, 1, 1, 1, 1, 1,
-2.12838, 0.1980259, -2.045721, 1, 1, 1, 1, 1,
-2.098284, 0.08746732, -1.778452, 1, 1, 1, 1, 1,
-2.071963, -0.554806, -2.704637, 1, 1, 1, 1, 1,
-2.063128, -0.3678535, -3.154951, 1, 1, 1, 1, 1,
-2.031431, -0.9510615, -0.3801602, 1, 1, 1, 1, 1,
-2.006892, 0.08792729, -0.5215988, 1, 1, 1, 1, 1,
-1.993841, 0.5970364, -1.349701, 1, 1, 1, 1, 1,
-1.972878, -0.7253729, -2.346917, 1, 1, 1, 1, 1,
-1.968574, 0.1469773, -0.7342353, 1, 1, 1, 1, 1,
-1.951782, 1.076868, -0.6074036, 1, 1, 1, 1, 1,
-1.941682, 1.107921, -1.634299, 1, 1, 1, 1, 1,
-1.934875, -0.23399, -1.083863, 1, 1, 1, 1, 1,
-1.895078, -0.8688903, -1.49393, 1, 1, 1, 1, 1,
-1.829399, -1.543923, -1.967988, 0, 0, 1, 1, 1,
-1.780738, -0.01885563, -1.717667, 1, 0, 0, 1, 1,
-1.777643, 0.1163279, -1.066977, 1, 0, 0, 1, 1,
-1.765529, 0.6524802, -1.790596, 1, 0, 0, 1, 1,
-1.757004, 1.586869, -0.3902678, 1, 0, 0, 1, 1,
-1.754248, -0.1495641, -2.656008, 1, 0, 0, 1, 1,
-1.736194, 0.1397321, -2.028677, 0, 0, 0, 1, 1,
-1.732186, 0.7568823, -0.007057896, 0, 0, 0, 1, 1,
-1.728741, 0.009657216, -2.127089, 0, 0, 0, 1, 1,
-1.727178, 1.549694, -1.250053, 0, 0, 0, 1, 1,
-1.707655, -0.7928756, -1.99007, 0, 0, 0, 1, 1,
-1.706234, 1.018815, 0.5872282, 0, 0, 0, 1, 1,
-1.702089, -1.033007, -3.557304, 0, 0, 0, 1, 1,
-1.684865, -0.5127547, -1.380272, 1, 1, 1, 1, 1,
-1.670105, 0.4976215, -1.813324, 1, 1, 1, 1, 1,
-1.6614, 0.07653707, -2.60268, 1, 1, 1, 1, 1,
-1.655972, 0.9700506, -1.133724, 1, 1, 1, 1, 1,
-1.632424, 0.1482771, -1.354964, 1, 1, 1, 1, 1,
-1.630164, 0.1894903, -0.5190038, 1, 1, 1, 1, 1,
-1.619391, 0.10671, 1.188929, 1, 1, 1, 1, 1,
-1.618625, 1.02681, -1.343997, 1, 1, 1, 1, 1,
-1.610911, -0.7130235, -3.312758, 1, 1, 1, 1, 1,
-1.609302, 0.06322155, -1.198065, 1, 1, 1, 1, 1,
-1.596788, -0.5908174, -1.121788, 1, 1, 1, 1, 1,
-1.592527, -0.01835732, -2.057254, 1, 1, 1, 1, 1,
-1.582292, 1.332494, -1.215394, 1, 1, 1, 1, 1,
-1.548241, 0.3747936, -2.859436, 1, 1, 1, 1, 1,
-1.547158, 1.695865, -1.217197, 1, 1, 1, 1, 1,
-1.539445, -0.4769518, -1.479749, 0, 0, 1, 1, 1,
-1.534029, -0.8292038, -0.7092944, 1, 0, 0, 1, 1,
-1.492675, -0.4420905, -3.080254, 1, 0, 0, 1, 1,
-1.490785, -0.8139527, -2.269489, 1, 0, 0, 1, 1,
-1.477026, 1.381317, -0.1765987, 1, 0, 0, 1, 1,
-1.476976, -0.04986275, -1.739403, 1, 0, 0, 1, 1,
-1.472141, -0.1650096, -2.237613, 0, 0, 0, 1, 1,
-1.450026, -0.4769824, -0.8355028, 0, 0, 0, 1, 1,
-1.432806, 0.3943097, -2.752943, 0, 0, 0, 1, 1,
-1.428344, 1.06125, -0.6141344, 0, 0, 0, 1, 1,
-1.426396, -0.7131055, -1.936878, 0, 0, 0, 1, 1,
-1.423371, -0.7839099, -0.8206372, 0, 0, 0, 1, 1,
-1.412348, 1.665799, -2.289678, 0, 0, 0, 1, 1,
-1.411286, -0.1820908, -3.365581, 1, 1, 1, 1, 1,
-1.40656, 0.5299401, -1.013935, 1, 1, 1, 1, 1,
-1.402968, -0.5127879, -1.537674, 1, 1, 1, 1, 1,
-1.400325, 0.7801486, -3.656072, 1, 1, 1, 1, 1,
-1.398246, -0.654748, -0.8488444, 1, 1, 1, 1, 1,
-1.396813, 0.3947001, -2.089586, 1, 1, 1, 1, 1,
-1.394439, -0.1010175, -4.757685, 1, 1, 1, 1, 1,
-1.371717, -1.153775, -3.216919, 1, 1, 1, 1, 1,
-1.366303, 1.661434, 0.4538944, 1, 1, 1, 1, 1,
-1.364043, 0.259638, -1.30699, 1, 1, 1, 1, 1,
-1.353659, 1.163476, -1.012715, 1, 1, 1, 1, 1,
-1.350073, 0.4610794, -0.3414872, 1, 1, 1, 1, 1,
-1.342358, -1.655137, -2.145991, 1, 1, 1, 1, 1,
-1.327919, 0.2286216, -1.659582, 1, 1, 1, 1, 1,
-1.327333, 1.387531, -2.186096, 1, 1, 1, 1, 1,
-1.325325, 0.1026812, -2.635243, 0, 0, 1, 1, 1,
-1.314718, -0.8003781, -1.877034, 1, 0, 0, 1, 1,
-1.310313, 2.787658, 0.3652289, 1, 0, 0, 1, 1,
-1.308317, 0.9427115, -2.387403, 1, 0, 0, 1, 1,
-1.293554, 0.6667387, -1.759775, 1, 0, 0, 1, 1,
-1.290412, 1.067245, -1.017017, 1, 0, 0, 1, 1,
-1.286115, 0.9232995, -1.603623, 0, 0, 0, 1, 1,
-1.28194, -0.4284321, -2.008586, 0, 0, 0, 1, 1,
-1.28092, -0.9395922, -2.32994, 0, 0, 0, 1, 1,
-1.280836, 0.8356336, -0.2692078, 0, 0, 0, 1, 1,
-1.279818, 0.5407174, -1.358482, 0, 0, 0, 1, 1,
-1.276031, 0.6054743, 0.03609252, 0, 0, 0, 1, 1,
-1.273727, 0.2758614, -1.587187, 0, 0, 0, 1, 1,
-1.272841, -0.4075227, -2.905801, 1, 1, 1, 1, 1,
-1.27067, 1.871173, 1.319267, 1, 1, 1, 1, 1,
-1.265272, -0.4708771, -2.723984, 1, 1, 1, 1, 1,
-1.244614, -0.8729406, -2.602974, 1, 1, 1, 1, 1,
-1.244193, 0.7407926, -1.186336, 1, 1, 1, 1, 1,
-1.243708, -0.658197, -3.265749, 1, 1, 1, 1, 1,
-1.238303, -1.080485, -2.524148, 1, 1, 1, 1, 1,
-1.236227, -0.9779081, -0.6136243, 1, 1, 1, 1, 1,
-1.223473, 0.103066, -1.374985, 1, 1, 1, 1, 1,
-1.212148, 0.2023681, -0.3613792, 1, 1, 1, 1, 1,
-1.206998, -0.7695785, -1.783011, 1, 1, 1, 1, 1,
-1.200493, 0.241485, -0.7199743, 1, 1, 1, 1, 1,
-1.196605, -0.7651285, -1.888893, 1, 1, 1, 1, 1,
-1.196066, 0.5942801, -1.293562, 1, 1, 1, 1, 1,
-1.194245, -0.7602841, -2.368864, 1, 1, 1, 1, 1,
-1.192324, -1.792376, -1.348397, 0, 0, 1, 1, 1,
-1.175817, -0.4541532, -3.14818, 1, 0, 0, 1, 1,
-1.174873, 0.2145934, -2.217727, 1, 0, 0, 1, 1,
-1.166798, 0.3304921, -1.587657, 1, 0, 0, 1, 1,
-1.165985, -1.517111, -1.613685, 1, 0, 0, 1, 1,
-1.162281, 0.2037684, 0.4886465, 1, 0, 0, 1, 1,
-1.161853, 0.03117152, -1.392105, 0, 0, 0, 1, 1,
-1.159283, -0.1016029, -1.738856, 0, 0, 0, 1, 1,
-1.159217, 0.2748897, -1.550151, 0, 0, 0, 1, 1,
-1.151219, 0.6457431, -2.524475, 0, 0, 0, 1, 1,
-1.149458, 0.281702, -2.226659, 0, 0, 0, 1, 1,
-1.149178, 0.09076507, -2.676541, 0, 0, 0, 1, 1,
-1.144846, 0.4274302, -0.6680982, 0, 0, 0, 1, 1,
-1.144739, -0.9856672, -3.166626, 1, 1, 1, 1, 1,
-1.138076, -0.8397973, -2.458024, 1, 1, 1, 1, 1,
-1.114846, 2.132606, -0.7886419, 1, 1, 1, 1, 1,
-1.114123, -0.7483823, -1.48669, 1, 1, 1, 1, 1,
-1.10939, -1.039538, -2.588831, 1, 1, 1, 1, 1,
-1.094181, -1.288213, -2.706783, 1, 1, 1, 1, 1,
-1.0882, -0.1337578, -2.24271, 1, 1, 1, 1, 1,
-1.08177, 0.3588004, -0.4367887, 1, 1, 1, 1, 1,
-1.076738, -0.2867421, -1.668595, 1, 1, 1, 1, 1,
-1.069242, 0.2601689, -1.236558, 1, 1, 1, 1, 1,
-1.067097, -0.5706746, -1.483981, 1, 1, 1, 1, 1,
-1.064148, -1.632291, -3.336138, 1, 1, 1, 1, 1,
-1.062704, -0.5486088, -3.306747, 1, 1, 1, 1, 1,
-1.055475, -0.4965608, -1.072205, 1, 1, 1, 1, 1,
-1.053271, 0.961149, -0.7848744, 1, 1, 1, 1, 1,
-1.052302, -1.104237, -1.358146, 0, 0, 1, 1, 1,
-1.049621, 1.436284, -1.099456, 1, 0, 0, 1, 1,
-1.048815, 0.9956526, -1.507112, 1, 0, 0, 1, 1,
-1.048343, -1.123404, -2.966351, 1, 0, 0, 1, 1,
-1.046294, 0.234241, -2.367218, 1, 0, 0, 1, 1,
-1.039081, -0.2126453, -4.258152, 1, 0, 0, 1, 1,
-1.038962, -2.011498, -0.5112919, 0, 0, 0, 1, 1,
-1.036535, 1.434348, -0.1453264, 0, 0, 0, 1, 1,
-1.035398, 1.049906, -1.258921, 0, 0, 0, 1, 1,
-1.034817, 0.4167712, -0.7683887, 0, 0, 0, 1, 1,
-1.033652, -2.190908, -2.901722, 0, 0, 0, 1, 1,
-1.031617, 1.143925, 0.9442448, 0, 0, 0, 1, 1,
-1.030971, 1.264163, -1.061347, 0, 0, 0, 1, 1,
-1.026974, -0.2043687, -0.7749419, 1, 1, 1, 1, 1,
-1.016352, 0.3463868, 0.07801875, 1, 1, 1, 1, 1,
-1.00368, 0.6920812, -2.020059, 1, 1, 1, 1, 1,
-1.003345, 0.8762251, -0.6165583, 1, 1, 1, 1, 1,
-1.000346, 0.9347925, 0.2193331, 1, 1, 1, 1, 1,
-0.9967787, -0.1990171, -3.290786, 1, 1, 1, 1, 1,
-0.9950938, -1.653741, -2.394169, 1, 1, 1, 1, 1,
-0.9889417, 1.052583, 0.2333716, 1, 1, 1, 1, 1,
-0.9856365, -0.9423305, -3.056045, 1, 1, 1, 1, 1,
-0.9840451, 0.2709941, -1.076503, 1, 1, 1, 1, 1,
-0.9806789, -0.7713243, -2.747954, 1, 1, 1, 1, 1,
-0.9796566, 0.2687795, -0.8939067, 1, 1, 1, 1, 1,
-0.9781834, 0.4196105, -0.8445203, 1, 1, 1, 1, 1,
-0.9774158, -0.5306609, -1.226116, 1, 1, 1, 1, 1,
-0.9751303, -0.3636035, -2.089964, 1, 1, 1, 1, 1,
-0.9746586, 1.674662, 0.3823714, 0, 0, 1, 1, 1,
-0.9744013, 0.321739, -1.058794, 1, 0, 0, 1, 1,
-0.9734899, -0.8908585, -1.669739, 1, 0, 0, 1, 1,
-0.9566159, -0.6983027, -2.998229, 1, 0, 0, 1, 1,
-0.953452, 1.038278, -0.335118, 1, 0, 0, 1, 1,
-0.9510746, -1.072864, -3.42653, 1, 0, 0, 1, 1,
-0.949611, 0.7115263, 0.40147, 0, 0, 0, 1, 1,
-0.9493214, -1.015275, -2.098428, 0, 0, 0, 1, 1,
-0.9451489, 0.2006208, -1.624823, 0, 0, 0, 1, 1,
-0.94346, -0.9161566, -2.282896, 0, 0, 0, 1, 1,
-0.9302785, 0.8600097, -1.574468, 0, 0, 0, 1, 1,
-0.9274155, -0.0126134, -1.512182, 0, 0, 0, 1, 1,
-0.9230672, 4.451463, 0.2967783, 0, 0, 0, 1, 1,
-0.9210864, -0.3886855, -2.045892, 1, 1, 1, 1, 1,
-0.9135458, -1.094069, -0.9234875, 1, 1, 1, 1, 1,
-0.900836, 0.671181, 0.9637669, 1, 1, 1, 1, 1,
-0.8951631, 0.26177, -2.322766, 1, 1, 1, 1, 1,
-0.8934768, 2.415377, 2.68416, 1, 1, 1, 1, 1,
-0.8933958, -0.1827106, -1.285938, 1, 1, 1, 1, 1,
-0.8867353, -0.5004427, -3.438628, 1, 1, 1, 1, 1,
-0.8861806, -0.08166044, -1.576833, 1, 1, 1, 1, 1,
-0.8763992, -1.290159, -2.438387, 1, 1, 1, 1, 1,
-0.8739727, -0.3716757, -1.737103, 1, 1, 1, 1, 1,
-0.8709849, -0.1122403, -2.962691, 1, 1, 1, 1, 1,
-0.8550634, -0.7844965, -2.160811, 1, 1, 1, 1, 1,
-0.8539388, -0.5650774, -2.755428, 1, 1, 1, 1, 1,
-0.8539152, 1.010397, -0.05269676, 1, 1, 1, 1, 1,
-0.844235, -0.2561697, -1.511176, 1, 1, 1, 1, 1,
-0.8363491, -0.7461823, -1.54188, 0, 0, 1, 1, 1,
-0.8252897, 1.315569, 1.240535, 1, 0, 0, 1, 1,
-0.8173156, 0.9853005, 1.223378, 1, 0, 0, 1, 1,
-0.8154005, -0.08972771, -0.8530695, 1, 0, 0, 1, 1,
-0.8093563, -0.08239538, -1.378259, 1, 0, 0, 1, 1,
-0.8080533, -0.4434372, -3.724933, 1, 0, 0, 1, 1,
-0.8047927, -0.5119975, -2.428638, 0, 0, 0, 1, 1,
-0.8038403, 0.08078066, -1.216498, 0, 0, 0, 1, 1,
-0.7988946, 0.01199419, -2.439678, 0, 0, 0, 1, 1,
-0.7982047, -1.764251, -2.708714, 0, 0, 0, 1, 1,
-0.7942516, 1.76161, -0.1060156, 0, 0, 0, 1, 1,
-0.7919993, 1.148699, -0.6321004, 0, 0, 0, 1, 1,
-0.7901688, -1.157013, -2.706796, 0, 0, 0, 1, 1,
-0.7862442, 0.4415609, -2.007936, 1, 1, 1, 1, 1,
-0.7846262, 0.09584798, -1.241685, 1, 1, 1, 1, 1,
-0.7817364, 0.2837448, -1.23135, 1, 1, 1, 1, 1,
-0.7806688, -0.1948656, -1.852183, 1, 1, 1, 1, 1,
-0.780503, 1.305379, -1.582278, 1, 1, 1, 1, 1,
-0.7778414, -1.05257, -3.097538, 1, 1, 1, 1, 1,
-0.7726631, -2.10696, -3.872245, 1, 1, 1, 1, 1,
-0.7599856, -0.8212799, -3.109476, 1, 1, 1, 1, 1,
-0.7599639, -0.6573029, -1.912364, 1, 1, 1, 1, 1,
-0.7486377, 0.9101139, -1.026493, 1, 1, 1, 1, 1,
-0.7357481, -0.7367447, -0.9542753, 1, 1, 1, 1, 1,
-0.7346517, -1.325001, -1.141281, 1, 1, 1, 1, 1,
-0.7342427, 1.336737, 0.001491675, 1, 1, 1, 1, 1,
-0.7292643, 1.030704, -1.88194, 1, 1, 1, 1, 1,
-0.7284295, 1.870356, -2.553855, 1, 1, 1, 1, 1,
-0.7248809, -0.4328711, -1.357204, 0, 0, 1, 1, 1,
-0.72333, 0.1349222, -1.778874, 1, 0, 0, 1, 1,
-0.7228739, 0.04251308, -1.199055, 1, 0, 0, 1, 1,
-0.7198119, 0.5319919, -2.707717, 1, 0, 0, 1, 1,
-0.7176747, 1.579498, -1.160846, 1, 0, 0, 1, 1,
-0.7166486, 0.3762697, -1.566176, 1, 0, 0, 1, 1,
-0.7114168, 1.688654, -0.9406414, 0, 0, 0, 1, 1,
-0.7099949, 1.083531, 0.6793203, 0, 0, 0, 1, 1,
-0.7096309, 0.6054105, 0.0468943, 0, 0, 0, 1, 1,
-0.7076218, -0.0310073, -1.892683, 0, 0, 0, 1, 1,
-0.7074012, -1.230086, -2.696153, 0, 0, 0, 1, 1,
-0.695851, -0.0713148, -1.530461, 0, 0, 0, 1, 1,
-0.6938351, -0.4492868, -0.9891313, 0, 0, 0, 1, 1,
-0.6868225, -0.9820981, -3.491699, 1, 1, 1, 1, 1,
-0.6841015, 0.03055998, -1.621369, 1, 1, 1, 1, 1,
-0.683217, -0.5863076, -2.703469, 1, 1, 1, 1, 1,
-0.68316, -0.7425123, -1.517356, 1, 1, 1, 1, 1,
-0.6646782, -1.260715, -1.967394, 1, 1, 1, 1, 1,
-0.6515827, 0.1595796, -1.577066, 1, 1, 1, 1, 1,
-0.6500078, 0.2621545, -0.5826464, 1, 1, 1, 1, 1,
-0.6475943, -0.3793414, -2.372929, 1, 1, 1, 1, 1,
-0.6470344, -1.23912, -2.50828, 1, 1, 1, 1, 1,
-0.6468548, 0.1012124, -0.03407381, 1, 1, 1, 1, 1,
-0.6426446, 0.4302993, -1.519351, 1, 1, 1, 1, 1,
-0.6417631, 0.1626407, -1.175226, 1, 1, 1, 1, 1,
-0.6416835, 0.3280635, -2.719772, 1, 1, 1, 1, 1,
-0.6383891, -0.7735543, -3.14237, 1, 1, 1, 1, 1,
-0.6332424, -1.446612, -1.46937, 1, 1, 1, 1, 1,
-0.6242722, -0.644158, -3.086096, 0, 0, 1, 1, 1,
-0.6213013, -0.1773501, -0.5835221, 1, 0, 0, 1, 1,
-0.6162667, -0.4626424, -2.981141, 1, 0, 0, 1, 1,
-0.6126252, 0.06301559, -2.594215, 1, 0, 0, 1, 1,
-0.609698, -1.59857, -2.971588, 1, 0, 0, 1, 1,
-0.6075185, 1.061525, -2.69594, 1, 0, 0, 1, 1,
-0.6030482, 0.1635031, -1.442446, 0, 0, 0, 1, 1,
-0.6023349, 1.363099, -0.04654686, 0, 0, 0, 1, 1,
-0.6004407, -0.6814686, -1.263554, 0, 0, 0, 1, 1,
-0.5977175, -1.696747, -3.80078, 0, 0, 0, 1, 1,
-0.595306, -2.997954, -3.152478, 0, 0, 0, 1, 1,
-0.5903355, 1.522505, -1.970606, 0, 0, 0, 1, 1,
-0.5879962, -1.288221, -3.525829, 0, 0, 0, 1, 1,
-0.5877974, -0.1893066, -1.922296, 1, 1, 1, 1, 1,
-0.5860334, -1.050344, -3.187788, 1, 1, 1, 1, 1,
-0.5824848, 1.371013, -1.121945, 1, 1, 1, 1, 1,
-0.5817798, -1.429245, -3.803906, 1, 1, 1, 1, 1,
-0.5806571, 1.62975, -2.492131, 1, 1, 1, 1, 1,
-0.5779269, -1.07472, -1.100026, 1, 1, 1, 1, 1,
-0.5712641, 0.8874898, -1.437656, 1, 1, 1, 1, 1,
-0.5696084, -1.015537, -0.9189228, 1, 1, 1, 1, 1,
-0.5652151, 0.1661516, -1.941475, 1, 1, 1, 1, 1,
-0.5634149, -0.5793791, -2.817901, 1, 1, 1, 1, 1,
-0.5629508, -0.8692281, -3.381915, 1, 1, 1, 1, 1,
-0.5534557, 0.5309173, -0.006097443, 1, 1, 1, 1, 1,
-0.5471309, -0.3894205, -3.038478, 1, 1, 1, 1, 1,
-0.5465848, 1.960526, -1.511369, 1, 1, 1, 1, 1,
-0.5442184, 0.4693638, -1.081431, 1, 1, 1, 1, 1,
-0.5437158, -0.4051102, -2.730209, 0, 0, 1, 1, 1,
-0.5428463, 0.8231178, -2.147957, 1, 0, 0, 1, 1,
-0.5423997, -0.2561505, -1.944223, 1, 0, 0, 1, 1,
-0.5414889, -0.3443333, -1.490414, 1, 0, 0, 1, 1,
-0.540395, -0.3706317, -3.930409, 1, 0, 0, 1, 1,
-0.5398667, -2.042039, -3.182305, 1, 0, 0, 1, 1,
-0.5396722, 0.5183851, -0.5801032, 0, 0, 0, 1, 1,
-0.5356809, 1.511876, 0.4527081, 0, 0, 0, 1, 1,
-0.5336095, -0.6451872, -2.595189, 0, 0, 0, 1, 1,
-0.5267389, -1.951301, -2.346741, 0, 0, 0, 1, 1,
-0.5259141, 0.1239505, -2.105805, 0, 0, 0, 1, 1,
-0.5257236, -0.6074116, -1.770055, 0, 0, 0, 1, 1,
-0.5244942, -0.3984062, -3.121104, 0, 0, 0, 1, 1,
-0.5240012, 1.324802, -0.5459735, 1, 1, 1, 1, 1,
-0.5237762, -2.049268, -3.703529, 1, 1, 1, 1, 1,
-0.5182695, 1.469391, -0.330875, 1, 1, 1, 1, 1,
-0.5163032, -0.7326781, -1.636934, 1, 1, 1, 1, 1,
-0.5158533, -0.1102573, -0.4801532, 1, 1, 1, 1, 1,
-0.5118407, 1.381517, -0.8193184, 1, 1, 1, 1, 1,
-0.51151, -0.5943184, -3.962928, 1, 1, 1, 1, 1,
-0.5090424, 0.8566389, 0.1996958, 1, 1, 1, 1, 1,
-0.502423, -0.3541154, -3.15003, 1, 1, 1, 1, 1,
-0.500725, 1.023184, -0.4297997, 1, 1, 1, 1, 1,
-0.5000948, 0.3002988, -1.045596, 1, 1, 1, 1, 1,
-0.4909314, 0.09905564, -1.282251, 1, 1, 1, 1, 1,
-0.4904297, -1.457784, -1.739821, 1, 1, 1, 1, 1,
-0.490009, -0.03873654, -0.8771635, 1, 1, 1, 1, 1,
-0.4882161, -1.850184, -3.455711, 1, 1, 1, 1, 1,
-0.4853654, 0.2963872, -0.7377824, 0, 0, 1, 1, 1,
-0.4835179, 0.1314617, -0.79054, 1, 0, 0, 1, 1,
-0.4825129, -0.2075347, -2.028645, 1, 0, 0, 1, 1,
-0.4766142, -0.5006832, -2.753809, 1, 0, 0, 1, 1,
-0.4763712, 0.4616318, -0.3060237, 1, 0, 0, 1, 1,
-0.4740172, 0.7599667, 0.0306644, 1, 0, 0, 1, 1,
-0.4723091, 0.4598085, 0.4641954, 0, 0, 0, 1, 1,
-0.4662033, 0.549877, -0.1463175, 0, 0, 0, 1, 1,
-0.4621706, 1.096611, -0.3248512, 0, 0, 0, 1, 1,
-0.4587575, 3.138219, -1.795991, 0, 0, 0, 1, 1,
-0.4562629, -1.781619, -4.698017, 0, 0, 0, 1, 1,
-0.4552296, 0.006982912, -1.115879, 0, 0, 0, 1, 1,
-0.4527731, -0.4593444, -2.980818, 0, 0, 0, 1, 1,
-0.4501599, -0.7741957, -0.942392, 1, 1, 1, 1, 1,
-0.4477713, 1.053256, -0.875405, 1, 1, 1, 1, 1,
-0.4443393, -0.9886282, -3.933684, 1, 1, 1, 1, 1,
-0.4441274, 1.455509, -0.08162984, 1, 1, 1, 1, 1,
-0.4438054, 2.281156, -1.212917, 1, 1, 1, 1, 1,
-0.4385272, -0.288106, -2.013844, 1, 1, 1, 1, 1,
-0.4381921, 0.2290591, -1.33068, 1, 1, 1, 1, 1,
-0.4366697, -0.177857, -1.510458, 1, 1, 1, 1, 1,
-0.4355592, -1.340322, -2.297887, 1, 1, 1, 1, 1,
-0.4349225, 0.8822266, 0.264424, 1, 1, 1, 1, 1,
-0.4311829, 1.257102, -0.4829872, 1, 1, 1, 1, 1,
-0.4278907, 1.41181, 0.4802343, 1, 1, 1, 1, 1,
-0.4272487, -0.4909452, -3.558194, 1, 1, 1, 1, 1,
-0.4260861, -0.3669634, -2.797635, 1, 1, 1, 1, 1,
-0.4252847, -0.2853479, -2.836214, 1, 1, 1, 1, 1,
-0.4240476, 0.4850025, -0.9792292, 0, 0, 1, 1, 1,
-0.4232472, 1.946543, 1.790555, 1, 0, 0, 1, 1,
-0.4195879, -1.432062, -3.431041, 1, 0, 0, 1, 1,
-0.419533, -0.8077511, -2.635549, 1, 0, 0, 1, 1,
-0.4186175, 0.8717152, -0.6883046, 1, 0, 0, 1, 1,
-0.4177427, -1.886453, -1.237909, 1, 0, 0, 1, 1,
-0.4176254, 0.9520131, 0.136578, 0, 0, 0, 1, 1,
-0.4170786, -1.21243, -2.235871, 0, 0, 0, 1, 1,
-0.4097002, 0.4310221, 0.02141928, 0, 0, 0, 1, 1,
-0.3998124, -1.101101, -4.027306, 0, 0, 0, 1, 1,
-0.3987487, 1.687013, -0.2045046, 0, 0, 0, 1, 1,
-0.397045, -1.240146, -2.359206, 0, 0, 0, 1, 1,
-0.3913396, 1.737283, 0.07738253, 0, 0, 0, 1, 1,
-0.3808961, 0.3399116, -1.093452, 1, 1, 1, 1, 1,
-0.3775329, 0.4851472, 1.450846, 1, 1, 1, 1, 1,
-0.3727783, 0.7008347, -0.8702434, 1, 1, 1, 1, 1,
-0.3724518, -0.9945396, -1.876436, 1, 1, 1, 1, 1,
-0.3679025, -3.131253, -2.789503, 1, 1, 1, 1, 1,
-0.366659, -0.2287175, -2.465988, 1, 1, 1, 1, 1,
-0.3634379, -0.6635718, -2.084267, 1, 1, 1, 1, 1,
-0.3625062, 0.6068133, 0.706961, 1, 1, 1, 1, 1,
-0.3589802, -0.7397527, -2.927301, 1, 1, 1, 1, 1,
-0.3581158, -1.376128, -3.42912, 1, 1, 1, 1, 1,
-0.3578645, 0.04509817, -4.424426, 1, 1, 1, 1, 1,
-0.351219, -0.9722001, -1.971652, 1, 1, 1, 1, 1,
-0.3505214, -0.7997714, -2.283616, 1, 1, 1, 1, 1,
-0.350151, -0.0356149, -1.778888, 1, 1, 1, 1, 1,
-0.3482155, -0.3925844, -1.806225, 1, 1, 1, 1, 1,
-0.3388939, -2.756338, -1.883599, 0, 0, 1, 1, 1,
-0.3377751, -1.683942, -1.84709, 1, 0, 0, 1, 1,
-0.337458, -0.3565478, -2.738591, 1, 0, 0, 1, 1,
-0.3359185, 0.2119957, -2.027473, 1, 0, 0, 1, 1,
-0.3334261, 1.918955, -1.187804, 1, 0, 0, 1, 1,
-0.3333429, 0.1651418, -0.9347662, 1, 0, 0, 1, 1,
-0.3300132, -1.863251, -3.663046, 0, 0, 0, 1, 1,
-0.3288276, 0.5290515, -0.3832014, 0, 0, 0, 1, 1,
-0.3194392, -1.407251, -2.933313, 0, 0, 0, 1, 1,
-0.3194326, -1.161302, -3.230144, 0, 0, 0, 1, 1,
-0.3175741, 0.5354248, -0.306977, 0, 0, 0, 1, 1,
-0.3166357, -0.3615591, -1.91094, 0, 0, 0, 1, 1,
-0.3159721, 0.4160942, -1.37866, 0, 0, 0, 1, 1,
-0.3128549, -2.151725, -2.528276, 1, 1, 1, 1, 1,
-0.3076375, -0.6309278, -2.133451, 1, 1, 1, 1, 1,
-0.3067763, -0.77262, -3.862016, 1, 1, 1, 1, 1,
-0.3044549, 1.111855, -1.412878, 1, 1, 1, 1, 1,
-0.3038262, 1.85983, -0.4180512, 1, 1, 1, 1, 1,
-0.3036115, 0.29066, -0.3613637, 1, 1, 1, 1, 1,
-0.2968597, 0.5419605, 0.4524177, 1, 1, 1, 1, 1,
-0.2941536, 0.5028088, 0.3499576, 1, 1, 1, 1, 1,
-0.2939514, -0.4006602, -2.808827, 1, 1, 1, 1, 1,
-0.2867914, 0.3367284, -0.6295062, 1, 1, 1, 1, 1,
-0.2853254, 0.6094796, -0.5876844, 1, 1, 1, 1, 1,
-0.2837927, -1.080016, -1.946518, 1, 1, 1, 1, 1,
-0.2781864, 0.6376791, 0.002102941, 1, 1, 1, 1, 1,
-0.2775894, -0.4847026, -2.350669, 1, 1, 1, 1, 1,
-0.2760493, -0.6840873, -1.916016, 1, 1, 1, 1, 1,
-0.2745104, 0.625542, 0.4195022, 0, 0, 1, 1, 1,
-0.2724621, 1.464699, 0.8173922, 1, 0, 0, 1, 1,
-0.2696739, -0.1918039, -4.481438, 1, 0, 0, 1, 1,
-0.2621398, 0.2492827, -2.489058, 1, 0, 0, 1, 1,
-0.2605687, -0.6111025, -2.96304, 1, 0, 0, 1, 1,
-0.2599394, -0.08755981, -1.087804, 1, 0, 0, 1, 1,
-0.2579775, 1.795927, 0.3833571, 0, 0, 0, 1, 1,
-0.2563404, 1.012539, -0.8650143, 0, 0, 0, 1, 1,
-0.2499729, 0.7907663, 0.08048826, 0, 0, 0, 1, 1,
-0.2492882, 0.2077009, -0.25212, 0, 0, 0, 1, 1,
-0.2447099, -0.5794342, -3.603514, 0, 0, 0, 1, 1,
-0.2436144, -1.212501, -3.198567, 0, 0, 0, 1, 1,
-0.2388955, 0.8077822, -2.63875, 0, 0, 0, 1, 1,
-0.2376578, 1.451966, -1.541116, 1, 1, 1, 1, 1,
-0.2307247, -0.7652909, -3.582737, 1, 1, 1, 1, 1,
-0.2287385, -0.546235, -2.203643, 1, 1, 1, 1, 1,
-0.2261501, 0.5249893, 0.6867585, 1, 1, 1, 1, 1,
-0.2184658, 0.001198539, -3.154592, 1, 1, 1, 1, 1,
-0.2180453, 1.978747, 0.5808333, 1, 1, 1, 1, 1,
-0.2159928, -1.320428, -3.426666, 1, 1, 1, 1, 1,
-0.2154988, -0.6031758, -3.093942, 1, 1, 1, 1, 1,
-0.2097761, 0.1954591, -2.056382, 1, 1, 1, 1, 1,
-0.2092081, 0.2258827, -0.4850913, 1, 1, 1, 1, 1,
-0.208149, -0.1905717, -2.624653, 1, 1, 1, 1, 1,
-0.2019381, 1.276127, -0.3003883, 1, 1, 1, 1, 1,
-0.2007779, 0.07912772, -1.309985, 1, 1, 1, 1, 1,
-0.1958499, -1.392879, -1.690147, 1, 1, 1, 1, 1,
-0.188817, 0.4012298, -0.4313749, 1, 1, 1, 1, 1,
-0.1841062, -0.8827481, -2.172091, 0, 0, 1, 1, 1,
-0.1824553, -1.869297, -4.386065, 1, 0, 0, 1, 1,
-0.1809026, 0.1317294, 0.4817827, 1, 0, 0, 1, 1,
-0.1738412, -2.062318, -3.718157, 1, 0, 0, 1, 1,
-0.1715962, 0.4191414, -1.454678, 1, 0, 0, 1, 1,
-0.1715333, 1.246166, 0.3481742, 1, 0, 0, 1, 1,
-0.1707141, 1.625287, 0.1596411, 0, 0, 0, 1, 1,
-0.1632634, 0.1613649, 0.3812794, 0, 0, 0, 1, 1,
-0.1615889, 0.5375434, 1.367911, 0, 0, 0, 1, 1,
-0.1599231, -1.178754, -1.035412, 0, 0, 0, 1, 1,
-0.1584155, -0.8098758, -3.080574, 0, 0, 0, 1, 1,
-0.1563903, -0.2350107, -1.919365, 0, 0, 0, 1, 1,
-0.1524308, 0.7447695, 0.7248219, 0, 0, 0, 1, 1,
-0.1439747, -1.366425, -4.026804, 1, 1, 1, 1, 1,
-0.1407067, 2.400551, 1.865879, 1, 1, 1, 1, 1,
-0.1354205, -0.2330921, -1.82638, 1, 1, 1, 1, 1,
-0.1353498, -0.692901, -2.18613, 1, 1, 1, 1, 1,
-0.1347545, 1.135472, -1.074118, 1, 1, 1, 1, 1,
-0.133875, -1.21922, -3.66216, 1, 1, 1, 1, 1,
-0.1315845, -0.7542407, -3.914504, 1, 1, 1, 1, 1,
-0.122918, 1.400824, -0.1672933, 1, 1, 1, 1, 1,
-0.1221529, 0.0218176, -3.450269, 1, 1, 1, 1, 1,
-0.1172839, -2.772914, -1.529047, 1, 1, 1, 1, 1,
-0.1117568, 1.188516, 0.1299629, 1, 1, 1, 1, 1,
-0.1106665, 0.3405636, 0.1234966, 1, 1, 1, 1, 1,
-0.1086769, 1.337081, -0.5641028, 1, 1, 1, 1, 1,
-0.1068741, 0.9036098, -2.130777, 1, 1, 1, 1, 1,
-0.1062757, -0.5269635, -3.744245, 1, 1, 1, 1, 1,
-0.1055341, -1.677003, -3.119159, 0, 0, 1, 1, 1,
-0.1049607, 0.5198815, -0.8242988, 1, 0, 0, 1, 1,
-0.1037915, -0.9906034, -2.470545, 1, 0, 0, 1, 1,
-0.1022635, 1.136439, 1.399094, 1, 0, 0, 1, 1,
-0.1017759, 1.808285, 1.200444, 1, 0, 0, 1, 1,
-0.1010651, -0.7358565, -2.450159, 1, 0, 0, 1, 1,
-0.09661471, -0.6589482, -3.840379, 0, 0, 0, 1, 1,
-0.09661309, 0.37526, -0.3476084, 0, 0, 0, 1, 1,
-0.09319416, -0.1364149, -3.80188, 0, 0, 0, 1, 1,
-0.09203083, 1.326861, -0.7705027, 0, 0, 0, 1, 1,
-0.08833638, -2.128987, -4.112879, 0, 0, 0, 1, 1,
-0.08789608, 0.4421832, 0.3984136, 0, 0, 0, 1, 1,
-0.08366977, 0.3931541, 0.9400151, 0, 0, 0, 1, 1,
-0.08268763, -0.7693037, -1.642185, 1, 1, 1, 1, 1,
-0.07828414, 1.053126, 0.2405857, 1, 1, 1, 1, 1,
-0.07823697, 0.2198376, -0.5557064, 1, 1, 1, 1, 1,
-0.07759687, 0.3060651, -0.4043956, 1, 1, 1, 1, 1,
-0.07715402, 0.1524213, -0.3131072, 1, 1, 1, 1, 1,
-0.07601506, -0.797433, -2.033799, 1, 1, 1, 1, 1,
-0.07596025, 0.5149573, -2.368413, 1, 1, 1, 1, 1,
-0.06648207, -0.9492927, -3.929804, 1, 1, 1, 1, 1,
-0.06332272, -0.5151311, -3.284723, 1, 1, 1, 1, 1,
-0.06238334, -0.1540836, -3.643416, 1, 1, 1, 1, 1,
-0.06228181, 0.5282663, -1.227888, 1, 1, 1, 1, 1,
-0.05742764, 0.7681651, -0.0009501246, 1, 1, 1, 1, 1,
-0.05285337, -0.5740446, -3.376064, 1, 1, 1, 1, 1,
-0.05044513, -0.3348049, -2.84485, 1, 1, 1, 1, 1,
-0.04723811, -0.4978562, -3.841011, 1, 1, 1, 1, 1,
-0.04446242, -2.84014, -3.1637, 0, 0, 1, 1, 1,
-0.04070865, -0.05892586, -2.314923, 1, 0, 0, 1, 1,
-0.0365306, -1.134833, -2.501159, 1, 0, 0, 1, 1,
-0.02710126, 0.6637355, 0.7865381, 1, 0, 0, 1, 1,
-0.02547948, 0.276133, -0.3353099, 1, 0, 0, 1, 1,
-0.02352378, 0.6777641, 1.577897, 1, 0, 0, 1, 1,
-0.02131931, 1.890442, -1.040182, 0, 0, 0, 1, 1,
-0.020643, 0.1179227, -0.216668, 0, 0, 0, 1, 1,
-0.01393086, -0.3849107, -3.760187, 0, 0, 0, 1, 1,
-0.01186441, 0.0555676, -0.9631754, 0, 0, 0, 1, 1,
-0.008421278, -1.067173, -3.869286, 0, 0, 0, 1, 1,
-0.004391361, 0.482787, 0.4064752, 0, 0, 0, 1, 1,
-0.003529845, 0.05599765, 1.250355, 0, 0, 0, 1, 1,
-0.003495029, -0.7526771, -2.855801, 1, 1, 1, 1, 1,
0.001102325, 1.388072, 0.9686187, 1, 1, 1, 1, 1,
0.003154998, 0.622427, -0.8857374, 1, 1, 1, 1, 1,
0.006091759, 0.5027754, -0.3854704, 1, 1, 1, 1, 1,
0.00682639, -1.446726, 4.13993, 1, 1, 1, 1, 1,
0.007193301, -0.4376457, 1.658694, 1, 1, 1, 1, 1,
0.009778223, 0.8775705, -0.04507077, 1, 1, 1, 1, 1,
0.01274121, 0.6008633, 0.2239657, 1, 1, 1, 1, 1,
0.0174186, 1.473229, 0.7126759, 1, 1, 1, 1, 1,
0.01780448, -1.217452, 2.633461, 1, 1, 1, 1, 1,
0.01802304, 0.4384772, 0.6984434, 1, 1, 1, 1, 1,
0.01810692, -0.1386223, 2.927375, 1, 1, 1, 1, 1,
0.0221217, -0.1849659, 3.929352, 1, 1, 1, 1, 1,
0.02326334, -1.272591, 3.673103, 1, 1, 1, 1, 1,
0.02482189, -1.873004, 2.039343, 1, 1, 1, 1, 1,
0.02652092, 0.7196522, -0.08245826, 0, 0, 1, 1, 1,
0.0296459, 0.949048, -0.2528914, 1, 0, 0, 1, 1,
0.03127525, 1.368613, -2.090562, 1, 0, 0, 1, 1,
0.0317722, 0.1408446, 1.587213, 1, 0, 0, 1, 1,
0.03313221, 1.565551, 1.496522, 1, 0, 0, 1, 1,
0.03584145, -1.664668, 2.974442, 1, 0, 0, 1, 1,
0.03728773, 0.5149974, -2.30407, 0, 0, 0, 1, 1,
0.03770507, -0.7186257, 2.268628, 0, 0, 0, 1, 1,
0.04246244, 0.1361703, -1.20155, 0, 0, 0, 1, 1,
0.04509081, -0.1753553, 3.733303, 0, 0, 0, 1, 1,
0.05039685, -0.912911, 3.059136, 0, 0, 0, 1, 1,
0.05040198, 1.159215, 0.1742895, 0, 0, 0, 1, 1,
0.05226036, -1.641759, 2.133572, 0, 0, 0, 1, 1,
0.05580688, -0.4349324, 2.524438, 1, 1, 1, 1, 1,
0.05757765, -2.275873, 2.491289, 1, 1, 1, 1, 1,
0.06206661, -0.5495643, 3.571045, 1, 1, 1, 1, 1,
0.06298373, -0.1462345, 1.679381, 1, 1, 1, 1, 1,
0.06562144, 0.04257063, 0.1795331, 1, 1, 1, 1, 1,
0.07113761, 1.715398, -1.049615, 1, 1, 1, 1, 1,
0.07173271, 0.4548206, 0.8379754, 1, 1, 1, 1, 1,
0.07209947, 0.9476203, 0.1948673, 1, 1, 1, 1, 1,
0.07933361, 1.016416, -1.234058, 1, 1, 1, 1, 1,
0.08075172, 0.8241861, 0.3799998, 1, 1, 1, 1, 1,
0.08306993, 0.4436631, 0.9175617, 1, 1, 1, 1, 1,
0.08558528, -1.693022, 2.299586, 1, 1, 1, 1, 1,
0.08606537, 0.4740551, 0.9237387, 1, 1, 1, 1, 1,
0.08940212, 0.6502964, -0.5220177, 1, 1, 1, 1, 1,
0.09087446, -1.129663, 2.73459, 1, 1, 1, 1, 1,
0.09366708, 3.221148, -1.97013, 0, 0, 1, 1, 1,
0.09804864, 1.392143, 0.6105681, 1, 0, 0, 1, 1,
0.0995978, 0.01749512, 2.303658, 1, 0, 0, 1, 1,
0.1018656, -0.7612629, 2.877133, 1, 0, 0, 1, 1,
0.1082689, -1.303228, 3.19314, 1, 0, 0, 1, 1,
0.1134789, 0.4710097, 0.3039957, 1, 0, 0, 1, 1,
0.1145516, 1.53094, -0.2403508, 0, 0, 0, 1, 1,
0.1150872, -0.0741664, 1.613295, 0, 0, 0, 1, 1,
0.1194067, -1.869494, 2.31186, 0, 0, 0, 1, 1,
0.1250703, -0.1763519, 3.498282, 0, 0, 0, 1, 1,
0.1295651, -0.5971827, 3.017148, 0, 0, 0, 1, 1,
0.1306818, -1.307594, 3.946884, 0, 0, 0, 1, 1,
0.1367517, -0.7410477, 1.83876, 0, 0, 0, 1, 1,
0.1390783, -0.4726159, 3.758309, 1, 1, 1, 1, 1,
0.1467953, 0.4901216, -0.5619518, 1, 1, 1, 1, 1,
0.1523373, -0.9724414, 2.440075, 1, 1, 1, 1, 1,
0.1566158, -0.8294355, 2.209664, 1, 1, 1, 1, 1,
0.1591174, -0.3328877, 4.462187, 1, 1, 1, 1, 1,
0.1594303, 1.137365, -0.7973127, 1, 1, 1, 1, 1,
0.1617379, 0.1271436, 0.275452, 1, 1, 1, 1, 1,
0.168982, 0.4337993, -0.1309434, 1, 1, 1, 1, 1,
0.1735182, -0.7170779, 2.820114, 1, 1, 1, 1, 1,
0.1771547, 0.06740356, 0.702419, 1, 1, 1, 1, 1,
0.1820389, -1.223075, 4.74755, 1, 1, 1, 1, 1,
0.186211, -0.9691507, 2.813176, 1, 1, 1, 1, 1,
0.1892457, 0.1000163, -0.1107996, 1, 1, 1, 1, 1,
0.1951586, 0.6693163, -0.4403798, 1, 1, 1, 1, 1,
0.1982669, -1.534913, 1.625102, 1, 1, 1, 1, 1,
0.2017466, 0.7181857, 1.030623, 0, 0, 1, 1, 1,
0.2041399, 0.9649454, -2.784959, 1, 0, 0, 1, 1,
0.2049104, 0.1793201, -0.7298347, 1, 0, 0, 1, 1,
0.2071002, 0.611912, 0.1193179, 1, 0, 0, 1, 1,
0.2080212, -0.2628658, 1.170437, 1, 0, 0, 1, 1,
0.2116975, -1.264103, 4.236584, 1, 0, 0, 1, 1,
0.2155048, -1.74379, 2.939457, 0, 0, 0, 1, 1,
0.2210009, 0.7668624, 1.267643, 0, 0, 0, 1, 1,
0.2219999, 0.04036519, -0.4859516, 0, 0, 0, 1, 1,
0.2241849, -0.5025338, 2.03199, 0, 0, 0, 1, 1,
0.2356265, 0.3352838, 1.237727, 0, 0, 0, 1, 1,
0.2363675, -0.7594978, 4.722232, 0, 0, 0, 1, 1,
0.237242, -0.2283198, 2.645584, 0, 0, 0, 1, 1,
0.2379661, -0.2939416, 2.503088, 1, 1, 1, 1, 1,
0.2405548, -0.3814754, 3.450391, 1, 1, 1, 1, 1,
0.2437129, 0.8499238, 0.02785227, 1, 1, 1, 1, 1,
0.2437426, -0.6064345, 2.053965, 1, 1, 1, 1, 1,
0.246657, 1.636081, 0.7611874, 1, 1, 1, 1, 1,
0.2470466, 0.2818342, 1.308175, 1, 1, 1, 1, 1,
0.2490676, 2.619826, -0.6627489, 1, 1, 1, 1, 1,
0.2506432, 1.400482, 1.314848, 1, 1, 1, 1, 1,
0.2507171, 0.2657252, -0.1842743, 1, 1, 1, 1, 1,
0.2551665, 1.016671, -0.3045812, 1, 1, 1, 1, 1,
0.2560903, 0.166838, 0.8274853, 1, 1, 1, 1, 1,
0.2605728, 0.2293988, 1.664555, 1, 1, 1, 1, 1,
0.2621224, -0.3915096, 3.220546, 1, 1, 1, 1, 1,
0.2649019, 0.6481043, 1.912914, 1, 1, 1, 1, 1,
0.2678396, 0.5558487, 0.5056319, 1, 1, 1, 1, 1,
0.2686689, -0.3943776, 2.675479, 0, 0, 1, 1, 1,
0.2728467, 0.9036367, 2.177388, 1, 0, 0, 1, 1,
0.2769869, 1.161001, 0.192735, 1, 0, 0, 1, 1,
0.2821646, -0.3984874, 2.893411, 1, 0, 0, 1, 1,
0.2849772, -0.2818721, 2.905311, 1, 0, 0, 1, 1,
0.2971304, -1.180364, 1.395868, 1, 0, 0, 1, 1,
0.2979623, -0.1340127, 3.339501, 0, 0, 0, 1, 1,
0.2990162, 1.499888, -0.5601289, 0, 0, 0, 1, 1,
0.3001218, 0.08090229, 1.284004, 0, 0, 0, 1, 1,
0.3020255, -1.157947, 3.14641, 0, 0, 0, 1, 1,
0.3024071, 0.0676128, 0.1624399, 0, 0, 0, 1, 1,
0.3042995, -1.930193, 3.282709, 0, 0, 0, 1, 1,
0.3084162, -1.510939, 2.622766, 0, 0, 0, 1, 1,
0.3095624, -0.4088444, 1.519259, 1, 1, 1, 1, 1,
0.3108445, 0.6349163, 3.353561, 1, 1, 1, 1, 1,
0.3144327, -0.1236582, 1.254303, 1, 1, 1, 1, 1,
0.3272499, 1.535324, 0.5247604, 1, 1, 1, 1, 1,
0.3280192, 0.25173, 0.6079625, 1, 1, 1, 1, 1,
0.3335927, 1.33506, 0.4079393, 1, 1, 1, 1, 1,
0.3348199, -0.1505334, 1.232776, 1, 1, 1, 1, 1,
0.3349146, -0.1237826, 1.492649, 1, 1, 1, 1, 1,
0.3376501, -1.54255, 2.837462, 1, 1, 1, 1, 1,
0.3376745, 0.2777567, -0.3236978, 1, 1, 1, 1, 1,
0.3508631, 0.5598167, 0.7112743, 1, 1, 1, 1, 1,
0.3525944, 0.04954069, 0.6913289, 1, 1, 1, 1, 1,
0.3578704, 1.015682, -0.08423616, 1, 1, 1, 1, 1,
0.3584358, 1.097037, 0.6928036, 1, 1, 1, 1, 1,
0.3608772, 0.7784234, 1.75305, 1, 1, 1, 1, 1,
0.3616878, -0.07877377, -0.4725, 0, 0, 1, 1, 1,
0.3627875, -1.185126, 3.356736, 1, 0, 0, 1, 1,
0.3630288, 0.6135562, 1.04114, 1, 0, 0, 1, 1,
0.3639595, -0.067826, -0.252029, 1, 0, 0, 1, 1,
0.3687404, 0.291645, -0.895377, 1, 0, 0, 1, 1,
0.3716387, 0.1249067, 3.109254, 1, 0, 0, 1, 1,
0.3734496, 0.05494393, 2.150065, 0, 0, 0, 1, 1,
0.3746321, -0.6281652, 1.9811, 0, 0, 0, 1, 1,
0.3815286, -1.17329, 3.163864, 0, 0, 0, 1, 1,
0.3848497, 0.6950688, 1.589318, 0, 0, 0, 1, 1,
0.3854871, 0.3172116, 0.2751206, 0, 0, 0, 1, 1,
0.387181, -0.9721702, 2.708051, 0, 0, 0, 1, 1,
0.3940691, -0.1819991, 0.7649401, 0, 0, 0, 1, 1,
0.3946708, 0.42874, 1.106608, 1, 1, 1, 1, 1,
0.3981347, 0.357671, 1.53967, 1, 1, 1, 1, 1,
0.398775, 0.2792561, 0.5306303, 1, 1, 1, 1, 1,
0.4010186, 0.6224367, 1.314692, 1, 1, 1, 1, 1,
0.4035417, 0.684607, -1.213832, 1, 1, 1, 1, 1,
0.4052697, 0.4571985, 0.4231077, 1, 1, 1, 1, 1,
0.406454, 1.367185, 0.1399819, 1, 1, 1, 1, 1,
0.4068977, -0.6632013, 2.58333, 1, 1, 1, 1, 1,
0.4076788, -0.4465846, 2.881254, 1, 1, 1, 1, 1,
0.4083838, 0.73261, -0.9504263, 1, 1, 1, 1, 1,
0.4087677, -1.242829, 1.907603, 1, 1, 1, 1, 1,
0.4128458, 1.924478, 0.307099, 1, 1, 1, 1, 1,
0.4166771, 1.003671, 1.880369, 1, 1, 1, 1, 1,
0.4195406, -1.189917, 3.176208, 1, 1, 1, 1, 1,
0.4265443, -0.504318, 2.005484, 1, 1, 1, 1, 1,
0.4276717, -0.4183244, 3.175254, 0, 0, 1, 1, 1,
0.439153, -1.275556, 3.050299, 1, 0, 0, 1, 1,
0.4468993, 0.7588366, 1.189995, 1, 0, 0, 1, 1,
0.4497408, 0.08906925, 1.845477, 1, 0, 0, 1, 1,
0.4538474, 0.6136022, 0.3331024, 1, 0, 0, 1, 1,
0.4551943, 0.3158642, -0.602508, 1, 0, 0, 1, 1,
0.4577594, -0.04995728, 1.660298, 0, 0, 0, 1, 1,
0.4593959, 0.8877716, 0.9046572, 0, 0, 0, 1, 1,
0.4603093, -0.6523119, 2.33442, 0, 0, 0, 1, 1,
0.4638215, -0.6053698, 2.533642, 0, 0, 0, 1, 1,
0.4647067, 0.1818434, 0.6849524, 0, 0, 0, 1, 1,
0.4674433, -0.5567594, 2.084044, 0, 0, 0, 1, 1,
0.4734235, 0.7077784, -1.191587, 0, 0, 0, 1, 1,
0.4758336, 0.4570944, 0.5470596, 1, 1, 1, 1, 1,
0.4771696, -1.117741, 0.3513423, 1, 1, 1, 1, 1,
0.4778423, -0.3285044, 2.30011, 1, 1, 1, 1, 1,
0.4855427, -0.2085898, 0.7063668, 1, 1, 1, 1, 1,
0.4861418, -0.6888555, 1.893285, 1, 1, 1, 1, 1,
0.4866582, -0.05858461, 1.636108, 1, 1, 1, 1, 1,
0.4871594, -0.2736257, 2.254305, 1, 1, 1, 1, 1,
0.4893656, -1.072804, 0.02848176, 1, 1, 1, 1, 1,
0.4911377, 0.6748921, 0.7978889, 1, 1, 1, 1, 1,
0.5026007, -2.64187, 2.830369, 1, 1, 1, 1, 1,
0.5041524, -0.287334, 3.899188, 1, 1, 1, 1, 1,
0.505163, 1.300486, -1.198508, 1, 1, 1, 1, 1,
0.507241, 0.3900564, 1.521331, 1, 1, 1, 1, 1,
0.5094787, 0.6028648, 0.8329898, 1, 1, 1, 1, 1,
0.5096287, -1.614033, 2.468981, 1, 1, 1, 1, 1,
0.511539, -0.5236279, 3.130211, 0, 0, 1, 1, 1,
0.5120556, -1.903841, 4.225, 1, 0, 0, 1, 1,
0.5166598, 1.196857, 2.102775, 1, 0, 0, 1, 1,
0.5189512, -0.6074102, 2.130701, 1, 0, 0, 1, 1,
0.5207385, 0.09374393, 1.672133, 1, 0, 0, 1, 1,
0.5224715, -2.119987, 2.305449, 1, 0, 0, 1, 1,
0.5234728, 0.6006007, 0.9439585, 0, 0, 0, 1, 1,
0.5243852, -1.783077, 2.860172, 0, 0, 0, 1, 1,
0.5280793, -0.06456464, 2.204709, 0, 0, 0, 1, 1,
0.5345932, -0.6239815, 3.557781, 0, 0, 0, 1, 1,
0.5386913, -0.9380039, 5.192025, 0, 0, 0, 1, 1,
0.5400016, 0.66066, 0.5385513, 0, 0, 0, 1, 1,
0.5410679, -0.4882671, 2.932969, 0, 0, 0, 1, 1,
0.5420451, 0.9183049, 0.2829218, 1, 1, 1, 1, 1,
0.5481332, -0.616826, 2.106024, 1, 1, 1, 1, 1,
0.5542204, 0.05736036, 1.620894, 1, 1, 1, 1, 1,
0.5554382, -0.4470618, 4.285064, 1, 1, 1, 1, 1,
0.5567505, 0.3362017, -0.3029432, 1, 1, 1, 1, 1,
0.5587265, -0.2453561, 1.681078, 1, 1, 1, 1, 1,
0.5606837, -1.276639, 4.801768, 1, 1, 1, 1, 1,
0.5634694, -0.8916443, 2.481644, 1, 1, 1, 1, 1,
0.5736472, 0.2590955, 1.532663, 1, 1, 1, 1, 1,
0.5765206, 1.587912, -0.07760902, 1, 1, 1, 1, 1,
0.5785916, -0.6857978, 2.843809, 1, 1, 1, 1, 1,
0.5844505, -1.255628, 2.573939, 1, 1, 1, 1, 1,
0.5881798, -0.2383255, 1.969112, 1, 1, 1, 1, 1,
0.5894838, -0.4442265, 1.658947, 1, 1, 1, 1, 1,
0.5930661, -0.7759, 3.328366, 1, 1, 1, 1, 1,
0.5934394, 0.7324265, 2.241435, 0, 0, 1, 1, 1,
0.5945199, 0.8765574, 0.2626718, 1, 0, 0, 1, 1,
0.5955114, 0.2064614, 1.545863, 1, 0, 0, 1, 1,
0.5960063, 0.6050523, 0.5924793, 1, 0, 0, 1, 1,
0.5963624, 0.3816317, 0.4383608, 1, 0, 0, 1, 1,
0.5997741, -0.7464194, 2.358905, 1, 0, 0, 1, 1,
0.601455, 1.706578, -0.09050156, 0, 0, 0, 1, 1,
0.601995, -0.5647279, 3.005916, 0, 0, 0, 1, 1,
0.6041634, -2.238878, 1.743508, 0, 0, 0, 1, 1,
0.6051312, -1.685572, 2.906103, 0, 0, 0, 1, 1,
0.6056572, 0.4633951, 0.8016679, 0, 0, 0, 1, 1,
0.6122748, -0.0001131171, -1.028332, 0, 0, 0, 1, 1,
0.6141571, 2.388699, 0.5365278, 0, 0, 0, 1, 1,
0.6208568, -1.66069, 1.45261, 1, 1, 1, 1, 1,
0.6239324, 0.8744505, 2.200821, 1, 1, 1, 1, 1,
0.6332573, -0.272479, 1.66325, 1, 1, 1, 1, 1,
0.6382394, -0.2592394, 3.003614, 1, 1, 1, 1, 1,
0.6405297, 1.291121, 0.9999167, 1, 1, 1, 1, 1,
0.6408547, -0.370377, 2.886949, 1, 1, 1, 1, 1,
0.6423545, 0.5253066, 1.505634, 1, 1, 1, 1, 1,
0.6464147, 2.007416, 0.8146508, 1, 1, 1, 1, 1,
0.6464638, -1.377737, 2.999568, 1, 1, 1, 1, 1,
0.6483365, 1.501662, -0.3870512, 1, 1, 1, 1, 1,
0.6493109, -0.2119988, 1.109399, 1, 1, 1, 1, 1,
0.6516521, -1.085248, 3.404152, 1, 1, 1, 1, 1,
0.6628878, -0.5862725, 2.072435, 1, 1, 1, 1, 1,
0.6665535, 0.009169541, 2.333315, 1, 1, 1, 1, 1,
0.6674474, 0.5342181, 1.076658, 1, 1, 1, 1, 1,
0.6691678, 0.3065884, 1.816785, 0, 0, 1, 1, 1,
0.6725379, -0.7069694, 2.328776, 1, 0, 0, 1, 1,
0.6738457, 1.564487, 0.09375656, 1, 0, 0, 1, 1,
0.6740307, -0.1645056, 1.754902, 1, 0, 0, 1, 1,
0.6762261, -1.120351, 2.532876, 1, 0, 0, 1, 1,
0.6771016, -0.4769565, 2.041829, 1, 0, 0, 1, 1,
0.6771292, -1.557375, 3.167551, 0, 0, 0, 1, 1,
0.6824221, 0.7955154, 0.9552645, 0, 0, 0, 1, 1,
0.6824827, -0.3194361, 1.65622, 0, 0, 0, 1, 1,
0.6884648, -0.5897956, 1.680095, 0, 0, 0, 1, 1,
0.6923808, -1.683685, 2.670849, 0, 0, 0, 1, 1,
0.6996213, -0.7689142, 3.049356, 0, 0, 0, 1, 1,
0.7025484, 0.9519884, -0.2384259, 0, 0, 0, 1, 1,
0.7033966, 0.1074043, 1.098884, 1, 1, 1, 1, 1,
0.7061313, 0.6649369, 1.774982, 1, 1, 1, 1, 1,
0.7091119, -0.3261445, 1.921864, 1, 1, 1, 1, 1,
0.7098342, -0.4382404, 3.32491, 1, 1, 1, 1, 1,
0.7103771, -0.1936009, 2.800032, 1, 1, 1, 1, 1,
0.7150761, 1.39674, 0.2441432, 1, 1, 1, 1, 1,
0.7185531, 0.420544, 0.9915648, 1, 1, 1, 1, 1,
0.7195415, -1.592431, 2.243906, 1, 1, 1, 1, 1,
0.7225651, -0.3590054, 2.475541, 1, 1, 1, 1, 1,
0.7278997, -0.7523592, 2.430501, 1, 1, 1, 1, 1,
0.7331145, -0.08256225, 0.5055007, 1, 1, 1, 1, 1,
0.7373152, 0.9779624, 0.01143621, 1, 1, 1, 1, 1,
0.7437345, -0.8518041, -0.4784223, 1, 1, 1, 1, 1,
0.7503057, -0.658316, 0.5851817, 1, 1, 1, 1, 1,
0.7517585, -0.8205526, 0.9610319, 1, 1, 1, 1, 1,
0.7525087, -1.112116, 2.668806, 0, 0, 1, 1, 1,
0.761722, 0.07170165, 1.926954, 1, 0, 0, 1, 1,
0.7638075, -1.422499, 2.016541, 1, 0, 0, 1, 1,
0.7641934, -1.235174, 2.797174, 1, 0, 0, 1, 1,
0.7711286, 1.507228, 0.9032391, 1, 0, 0, 1, 1,
0.7722241, 0.1859412, -0.3392042, 1, 0, 0, 1, 1,
0.7777902, 0.3688793, 1.837676, 0, 0, 0, 1, 1,
0.7808316, -0.7807316, 2.259701, 0, 0, 0, 1, 1,
0.7822262, 0.4072913, 0.9172375, 0, 0, 0, 1, 1,
0.7832065, -0.1767173, 1.475716, 0, 0, 0, 1, 1,
0.7897399, -1.468195, 1.53482, 0, 0, 0, 1, 1,
0.7968681, 1.230052, 0.7304552, 0, 0, 0, 1, 1,
0.798909, -0.9953583, 0.7715908, 0, 0, 0, 1, 1,
0.8073974, -0.4956542, 2.86478, 1, 1, 1, 1, 1,
0.8079967, 0.608427, 2.87837, 1, 1, 1, 1, 1,
0.8095517, 0.4405079, 2.553656, 1, 1, 1, 1, 1,
0.8183867, 1.416991, 1.442374, 1, 1, 1, 1, 1,
0.819309, -0.4809183, 2.19975, 1, 1, 1, 1, 1,
0.8203995, -0.6528358, 1.422835, 1, 1, 1, 1, 1,
0.8352497, -0.3827758, 2.799113, 1, 1, 1, 1, 1,
0.8379025, -0.1329169, 2.414319, 1, 1, 1, 1, 1,
0.8423126, 1.49774, 0.3320289, 1, 1, 1, 1, 1,
0.8445137, 0.8965501, 0.4096155, 1, 1, 1, 1, 1,
0.8449212, 0.1226855, 0.7197049, 1, 1, 1, 1, 1,
0.8479756, 1.512997, -0.003029091, 1, 1, 1, 1, 1,
0.8537281, -0.001837891, 2.287234, 1, 1, 1, 1, 1,
0.854557, 0.9667737, -0.6038354, 1, 1, 1, 1, 1,
0.8575082, -1.573328, 1.955519, 1, 1, 1, 1, 1,
0.858499, 0.5257763, 1.368921, 0, 0, 1, 1, 1,
0.8610932, -2.372353, 2.458502, 1, 0, 0, 1, 1,
0.8627936, -0.8515289, 2.643624, 1, 0, 0, 1, 1,
0.8643356, -0.1029395, 1.249127, 1, 0, 0, 1, 1,
0.865267, 0.2885045, 0.708174, 1, 0, 0, 1, 1,
0.867397, 0.1803098, 0.5227406, 1, 0, 0, 1, 1,
0.8680845, 0.5923405, 1.371623, 0, 0, 0, 1, 1,
0.8699616, -0.03235948, -0.3357383, 0, 0, 0, 1, 1,
0.8705766, -0.4138493, 0.3635068, 0, 0, 0, 1, 1,
0.8763771, 0.2508961, 1.284797, 0, 0, 0, 1, 1,
0.8792228, -0.3938518, -0.7416602, 0, 0, 0, 1, 1,
0.8815381, -0.6341907, 1.973082, 0, 0, 0, 1, 1,
0.8829403, -0.4984794, 2.122411, 0, 0, 0, 1, 1,
0.8846334, 0.5331986, 2.406621, 1, 1, 1, 1, 1,
0.8889257, -1.304504, 1.901071, 1, 1, 1, 1, 1,
0.8922759, 0.827177, 0.4301872, 1, 1, 1, 1, 1,
0.8938042, 0.02644293, 1.377215, 1, 1, 1, 1, 1,
0.901446, 0.63284, 1.236121, 1, 1, 1, 1, 1,
0.9019372, -0.5073742, 2.859483, 1, 1, 1, 1, 1,
0.9090108, 0.9388476, 0.2701432, 1, 1, 1, 1, 1,
0.9172001, 0.05008847, 0.4031106, 1, 1, 1, 1, 1,
0.9191507, 0.5609131, 0.06823798, 1, 1, 1, 1, 1,
0.93178, 1.218866, 1.419615, 1, 1, 1, 1, 1,
0.9449456, 1.993017, -0.4606516, 1, 1, 1, 1, 1,
0.9465249, 0.04620063, 1.369918, 1, 1, 1, 1, 1,
0.9485578, -0.03348765, 2.33639, 1, 1, 1, 1, 1,
0.9523507, 0.6508043, 2.240214, 1, 1, 1, 1, 1,
0.9599134, -0.7634829, 1.296545, 1, 1, 1, 1, 1,
0.9601757, -0.855801, 2.343671, 0, 0, 1, 1, 1,
0.9659207, 0.5420778, 0.5132321, 1, 0, 0, 1, 1,
0.9672958, 1.192113, 0.5545114, 1, 0, 0, 1, 1,
0.9752149, -1.159051, 1.466981, 1, 0, 0, 1, 1,
0.9771799, -0.3447965, 1.031444, 1, 0, 0, 1, 1,
0.9817066, -1.643543, 2.525949, 1, 0, 0, 1, 1,
0.9828526, 0.7971948, 1.180693, 0, 0, 0, 1, 1,
0.9953917, -0.3241691, 1.731685, 0, 0, 0, 1, 1,
1.005896, -0.03534399, 1.485604, 0, 0, 0, 1, 1,
1.00724, -0.2554339, 0.638965, 0, 0, 0, 1, 1,
1.023249, -2.298086, 3.009025, 0, 0, 0, 1, 1,
1.025167, 0.4418746, 0.5645345, 0, 0, 0, 1, 1,
1.030541, 1.671133, 1.334094, 0, 0, 0, 1, 1,
1.032286, -0.9279519, 2.700004, 1, 1, 1, 1, 1,
1.033891, 0.7337855, -0.4059647, 1, 1, 1, 1, 1,
1.037055, 0.502058, 0.6296808, 1, 1, 1, 1, 1,
1.045737, -0.8601838, 2.923761, 1, 1, 1, 1, 1,
1.047497, -0.8380455, 3.487557, 1, 1, 1, 1, 1,
1.056581, 0.2967311, 0.5039902, 1, 1, 1, 1, 1,
1.056791, -1.319946, 0.7226729, 1, 1, 1, 1, 1,
1.05858, -0.7066395, 3.799539, 1, 1, 1, 1, 1,
1.059515, -1.195351, 3.131294, 1, 1, 1, 1, 1,
1.061891, 0.2813482, -0.5031861, 1, 1, 1, 1, 1,
1.062371, 0.4497057, 3.296351, 1, 1, 1, 1, 1,
1.068443, -1.705005, 0.4872527, 1, 1, 1, 1, 1,
1.075493, 1.588407, 1.438424, 1, 1, 1, 1, 1,
1.078515, -0.9347689, 2.520212, 1, 1, 1, 1, 1,
1.084509, -0.6584244, 5.063736, 1, 1, 1, 1, 1,
1.088024, -0.2889836, 3.413326, 0, 0, 1, 1, 1,
1.095605, -0.7314588, 2.692852, 1, 0, 0, 1, 1,
1.097962, -0.5887315, 3.12238, 1, 0, 0, 1, 1,
1.101115, -0.009737467, 0.6359069, 1, 0, 0, 1, 1,
1.104294, 1.021021, 1.450272, 1, 0, 0, 1, 1,
1.110114, -1.6381, 0.3559493, 1, 0, 0, 1, 1,
1.111513, -0.606031, 2.083276, 0, 0, 0, 1, 1,
1.11627, -2.030973, 4.37565, 0, 0, 0, 1, 1,
1.122509, 0.956564, 1.943615, 0, 0, 0, 1, 1,
1.133223, -1.245309, 2.118608, 0, 0, 0, 1, 1,
1.136461, -0.1147195, -0.5042695, 0, 0, 0, 1, 1,
1.141983, 1.91238, 0.09885305, 0, 0, 0, 1, 1,
1.14398, -1.231803, 3.575727, 0, 0, 0, 1, 1,
1.146923, -1.285736, 3.365257, 1, 1, 1, 1, 1,
1.154806, -0.4123099, 2.819261, 1, 1, 1, 1, 1,
1.157311, 0.05184056, 1.739851, 1, 1, 1, 1, 1,
1.157939, 0.1168589, 1.294953, 1, 1, 1, 1, 1,
1.159975, 0.07607798, 2.902182, 1, 1, 1, 1, 1,
1.160749, 0.9547262, 1.865987, 1, 1, 1, 1, 1,
1.163069, -0.2274497, 5.08039, 1, 1, 1, 1, 1,
1.16811, -1.099472, 1.260961, 1, 1, 1, 1, 1,
1.180412, 0.453208, -0.3309366, 1, 1, 1, 1, 1,
1.180678, -0.447852, 1.800503, 1, 1, 1, 1, 1,
1.190141, -0.1995381, 2.808996, 1, 1, 1, 1, 1,
1.195083, -0.7742981, 1.462029, 1, 1, 1, 1, 1,
1.197116, -1.169781, 2.807971, 1, 1, 1, 1, 1,
1.197684, 1.183551, 1.603993, 1, 1, 1, 1, 1,
1.201857, -0.5487943, 1.230812, 1, 1, 1, 1, 1,
1.20275, -1.041828, 4.334441, 0, 0, 1, 1, 1,
1.206401, 1.560073, 1.189689, 1, 0, 0, 1, 1,
1.210904, -1.120561, 2.609953, 1, 0, 0, 1, 1,
1.212065, -1.032795, 2.213497, 1, 0, 0, 1, 1,
1.213081, -0.04156926, 1.847828, 1, 0, 0, 1, 1,
1.215353, -0.7101626, 0.7988033, 1, 0, 0, 1, 1,
1.216579, -1.06837, -0.2558055, 0, 0, 0, 1, 1,
1.218511, 2.245973, -1.2612, 0, 0, 0, 1, 1,
1.221956, -0.8861023, 1.203865, 0, 0, 0, 1, 1,
1.223336, -0.0863303, 0.6805053, 0, 0, 0, 1, 1,
1.225271, -0.1510351, 3.245989, 0, 0, 0, 1, 1,
1.236706, 3.47894, 0.6082414, 0, 0, 0, 1, 1,
1.238999, -0.5411307, 1.962638, 0, 0, 0, 1, 1,
1.244839, -0.05263579, 3.492615, 1, 1, 1, 1, 1,
1.247445, 0.316635, 0.04246876, 1, 1, 1, 1, 1,
1.273708, -0.5022458, 0.5342634, 1, 1, 1, 1, 1,
1.282125, 0.5395818, 2.135781, 1, 1, 1, 1, 1,
1.288869, -0.1041576, 2.842282, 1, 1, 1, 1, 1,
1.289882, 0.1089997, -0.2604163, 1, 1, 1, 1, 1,
1.290351, -0.8685266, 1.804776, 1, 1, 1, 1, 1,
1.294736, 0.6236132, -0.2005829, 1, 1, 1, 1, 1,
1.296317, 0.6227532, -0.3294077, 1, 1, 1, 1, 1,
1.299521, 0.1365258, 1.001057, 1, 1, 1, 1, 1,
1.311175, 1.423535, -0.2392687, 1, 1, 1, 1, 1,
1.31433, 0.848164, 0.3776636, 1, 1, 1, 1, 1,
1.335948, -1.229425, 1.571831, 1, 1, 1, 1, 1,
1.338613, -0.5379725, -0.6724507, 1, 1, 1, 1, 1,
1.347977, -1.566965, 1.185386, 1, 1, 1, 1, 1,
1.353684, 0.6773403, -0.01378922, 0, 0, 1, 1, 1,
1.356856, -0.2428088, 1.023668, 1, 0, 0, 1, 1,
1.360417, 0.03726967, 1.610296, 1, 0, 0, 1, 1,
1.363309, 0.02767028, 2.676792, 1, 0, 0, 1, 1,
1.364404, 0.5842492, 1.274076, 1, 0, 0, 1, 1,
1.38147, 1.05408, 1.259197, 1, 0, 0, 1, 1,
1.397017, -0.4990825, 3.205371, 0, 0, 0, 1, 1,
1.40238, -1.051904, 3.343922, 0, 0, 0, 1, 1,
1.407732, 0.4740348, 1.434431, 0, 0, 0, 1, 1,
1.414565, -0.3929624, 1.419086, 0, 0, 0, 1, 1,
1.416062, -0.8516082, 2.617852, 0, 0, 0, 1, 1,
1.418825, -0.8569189, 2.592323, 0, 0, 0, 1, 1,
1.432916, 0.3144433, 0.7429994, 0, 0, 0, 1, 1,
1.432943, 0.5300033, 0.7136838, 1, 1, 1, 1, 1,
1.435891, 0.2293128, 2.851847, 1, 1, 1, 1, 1,
1.436188, 1.525295, -0.8743767, 1, 1, 1, 1, 1,
1.438854, 1.833542, -1.728915, 1, 1, 1, 1, 1,
1.453883, 0.5463187, 0.1755625, 1, 1, 1, 1, 1,
1.455608, 0.9218789, 1.470344, 1, 1, 1, 1, 1,
1.458968, 0.7849372, 0.9021739, 1, 1, 1, 1, 1,
1.487073, 0.7217291, 0.9575328, 1, 1, 1, 1, 1,
1.487972, -1.913787, 2.801989, 1, 1, 1, 1, 1,
1.490373, 1.51934, 0.2945879, 1, 1, 1, 1, 1,
1.496653, 0.4214621, 0.4242764, 1, 1, 1, 1, 1,
1.505528, -0.7670647, 1.85933, 1, 1, 1, 1, 1,
1.507481, 0.04320651, 1.029589, 1, 1, 1, 1, 1,
1.509543, 0.3018308, 0.9204933, 1, 1, 1, 1, 1,
1.516342, 0.9772781, -0.2396264, 1, 1, 1, 1, 1,
1.521138, -1.501788, 2.007385, 0, 0, 1, 1, 1,
1.52287, 2.665149, 1.916209, 1, 0, 0, 1, 1,
1.528086, 1.223591, 0.4550677, 1, 0, 0, 1, 1,
1.543491, -0.2070756, 1.944113, 1, 0, 0, 1, 1,
1.544816, 0.05229225, 0.4373365, 1, 0, 0, 1, 1,
1.550419, 1.097452, 0.05731647, 1, 0, 0, 1, 1,
1.557913, -0.4840415, 3.509024, 0, 0, 0, 1, 1,
1.568411, -0.478579, 1.301129, 0, 0, 0, 1, 1,
1.575781, -0.02408674, 1.887541, 0, 0, 0, 1, 1,
1.576832, 0.1862136, 0.5687941, 0, 0, 0, 1, 1,
1.578465, 0.933741, 0.4366178, 0, 0, 0, 1, 1,
1.581965, 1.023711, 1.78384, 0, 0, 0, 1, 1,
1.587918, 0.3492211, 0.742277, 0, 0, 0, 1, 1,
1.592124, -0.3471719, 2.841426, 1, 1, 1, 1, 1,
1.602825, -1.321346, 1.154607, 1, 1, 1, 1, 1,
1.613, 2.577921, -0.3859143, 1, 1, 1, 1, 1,
1.629097, 1.289513, 2.740309, 1, 1, 1, 1, 1,
1.635321, 0.1226741, 1.602444, 1, 1, 1, 1, 1,
1.63847, 0.09273745, 0.2270317, 1, 1, 1, 1, 1,
1.648334, -0.5868884, 2.309986, 1, 1, 1, 1, 1,
1.651055, 0.6376103, -0.3395073, 1, 1, 1, 1, 1,
1.651882, -1.442119, 1.78085, 1, 1, 1, 1, 1,
1.665324, 0.5403117, 1.032548, 1, 1, 1, 1, 1,
1.667436, 0.2249, -1.145337, 1, 1, 1, 1, 1,
1.667821, -1.005139, 1.767648, 1, 1, 1, 1, 1,
1.668401, -1.886921, 5.171587, 1, 1, 1, 1, 1,
1.686329, -0.102291, 1.254116, 1, 1, 1, 1, 1,
1.689755, 1.028825, 2.141321, 1, 1, 1, 1, 1,
1.720459, 0.3973709, 1.353523, 0, 0, 1, 1, 1,
1.732787, 0.267228, 2.185623, 1, 0, 0, 1, 1,
1.733779, 1.035982, -0.436956, 1, 0, 0, 1, 1,
1.74124, 0.4850939, 2.290111, 1, 0, 0, 1, 1,
1.741703, -1.930468, 0.4123971, 1, 0, 0, 1, 1,
1.745865, -1.897434, 2.734865, 1, 0, 0, 1, 1,
1.787472, 0.05797223, 0.9319169, 0, 0, 0, 1, 1,
1.790056, 0.3116397, 0.5367876, 0, 0, 0, 1, 1,
1.790135, -0.3986968, 1.826741, 0, 0, 0, 1, 1,
1.791602, 0.302579, 0.3123336, 0, 0, 0, 1, 1,
1.796611, 1.394497, 1.649241, 0, 0, 0, 1, 1,
1.799489, -0.05731366, 3.497513, 0, 0, 0, 1, 1,
1.804944, -2.119552, 1.803862, 0, 0, 0, 1, 1,
1.822936, -0.1291363, 0.5043728, 1, 1, 1, 1, 1,
1.842562, 0.1100723, 3.263419, 1, 1, 1, 1, 1,
1.843841, -0.7214236, 1.298338, 1, 1, 1, 1, 1,
1.866472, -0.7159002, 0.9174277, 1, 1, 1, 1, 1,
1.888394, 1.419471, 0.4032342, 1, 1, 1, 1, 1,
1.890632, -0.2491555, 1.068805, 1, 1, 1, 1, 1,
1.975139, 0.3246715, 0.8886909, 1, 1, 1, 1, 1,
1.977009, -0.5475575, 3.894875, 1, 1, 1, 1, 1,
1.993367, -0.5699551, 1.110415, 1, 1, 1, 1, 1,
2.03093, -0.2185799, 2.98403, 1, 1, 1, 1, 1,
2.030979, 0.2359073, 0.9634421, 1, 1, 1, 1, 1,
2.039309, -1.530122, 1.207989, 1, 1, 1, 1, 1,
2.04418, 0.8307392, 1.229356, 1, 1, 1, 1, 1,
2.055388, 0.3923952, 1.804955, 1, 1, 1, 1, 1,
2.059479, -0.688348, 1.797329, 1, 1, 1, 1, 1,
2.060891, 0.04703574, -0.6999703, 0, 0, 1, 1, 1,
2.063836, -0.3638211, 1.101107, 1, 0, 0, 1, 1,
2.07625, -1.07835, 3.599351, 1, 0, 0, 1, 1,
2.077199, -2.629941, 2.159674, 1, 0, 0, 1, 1,
2.124869, 0.2152087, 1.926153, 1, 0, 0, 1, 1,
2.127267, 0.6555504, 3.177552, 1, 0, 0, 1, 1,
2.14244, -0.7826232, 2.956007, 0, 0, 0, 1, 1,
2.150306, 0.9579653, 1.379725, 0, 0, 0, 1, 1,
2.198692, 0.5406989, 1.1588, 0, 0, 0, 1, 1,
2.198972, 0.4937019, 1.924573, 0, 0, 0, 1, 1,
2.203604, 0.7858882, -0.09302785, 0, 0, 0, 1, 1,
2.271797, -0.2054804, 0.107427, 0, 0, 0, 1, 1,
2.353925, -0.2082866, 1.199104, 0, 0, 0, 1, 1,
2.372912, -0.6433728, 3.357594, 1, 1, 1, 1, 1,
2.41645, 2.110728, -0.1643846, 1, 1, 1, 1, 1,
2.457162, -1.685066, 4.5048, 1, 1, 1, 1, 1,
2.521461, 0.1255549, 1.10351, 1, 1, 1, 1, 1,
2.61473, -0.408276, 0.892549, 1, 1, 1, 1, 1,
2.776496, 1.406453, 1.687983, 1, 1, 1, 1, 1,
2.850832, 0.92726, 1.647901, 1, 1, 1, 1, 1
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
var radius = 9.623534;
var distance = 33.80226;
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
mvMatrix.translate( 0.378019, -0.660105, -0.21717 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.80226);
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
