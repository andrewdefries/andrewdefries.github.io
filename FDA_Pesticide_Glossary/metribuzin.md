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
-3.111328, -1.33925, -2.268764, 1, 0, 0, 1,
-2.910583, 0.1702603, -3.674832, 1, 0.007843138, 0, 1,
-2.732368, -1.485528, -1.412049, 1, 0.01176471, 0, 1,
-2.732337, 1.94339, -1.478845, 1, 0.01960784, 0, 1,
-2.635356, -2.147202, -2.223368, 1, 0.02352941, 0, 1,
-2.549584, -0.03839807, -1.149734, 1, 0.03137255, 0, 1,
-2.523669, 0.615129, -0.4659873, 1, 0.03529412, 0, 1,
-2.443158, 0.5263748, -0.8475775, 1, 0.04313726, 0, 1,
-2.31031, -0.4690579, -1.92255, 1, 0.04705882, 0, 1,
-2.296766, -0.9291798, -2.562727, 1, 0.05490196, 0, 1,
-2.250464, 1.297841, -1.534843, 1, 0.05882353, 0, 1,
-2.189735, -1.981118, -2.936526, 1, 0.06666667, 0, 1,
-2.096618, 0.4483187, -1.644502, 1, 0.07058824, 0, 1,
-2.052079, -2.06952, -3.407943, 1, 0.07843138, 0, 1,
-2.00342, -1.177449, -3.188679, 1, 0.08235294, 0, 1,
-1.986165, 0.5408077, -0.90562, 1, 0.09019608, 0, 1,
-1.986053, -0.667766, -3.462172, 1, 0.09411765, 0, 1,
-1.980116, -0.4564967, -0.4778568, 1, 0.1019608, 0, 1,
-1.963179, -0.6178033, -2.593465, 1, 0.1098039, 0, 1,
-1.953008, 0.6889264, -1.645009, 1, 0.1137255, 0, 1,
-1.901282, 0.260999, -1.512417, 1, 0.1215686, 0, 1,
-1.891085, 0.4839269, -1.181773, 1, 0.1254902, 0, 1,
-1.888194, 0.8997849, -1.229699, 1, 0.1333333, 0, 1,
-1.884027, -0.8751827, -2.099373, 1, 0.1372549, 0, 1,
-1.861612, 0.05329064, -0.5535365, 1, 0.145098, 0, 1,
-1.852795, 0.03525798, -1.175414, 1, 0.1490196, 0, 1,
-1.818982, 0.2776688, -2.365314, 1, 0.1568628, 0, 1,
-1.787936, 0.7364021, -2.724748, 1, 0.1607843, 0, 1,
-1.783408, -1.19338, -0.9141353, 1, 0.1686275, 0, 1,
-1.729884, -1.795859, -0.6368601, 1, 0.172549, 0, 1,
-1.720957, -0.5349469, -1.032108, 1, 0.1803922, 0, 1,
-1.714452, 0.5568062, -1.531021, 1, 0.1843137, 0, 1,
-1.699681, -1.503978, -3.171815, 1, 0.1921569, 0, 1,
-1.68532, -0.01700366, -1.232087, 1, 0.1960784, 0, 1,
-1.670339, 1.614529, -0.7646129, 1, 0.2039216, 0, 1,
-1.669969, -1.678153, -1.034658, 1, 0.2117647, 0, 1,
-1.668973, -0.4598927, 0.9858065, 1, 0.2156863, 0, 1,
-1.657313, 1.750175, -1.468768, 1, 0.2235294, 0, 1,
-1.652624, -0.3528311, -2.937719, 1, 0.227451, 0, 1,
-1.64746, 0.2264044, -0.3007854, 1, 0.2352941, 0, 1,
-1.646613, -0.2331365, -3.14975, 1, 0.2392157, 0, 1,
-1.646496, -0.9703309, -2.078562, 1, 0.2470588, 0, 1,
-1.623816, -0.08068172, -3.51696, 1, 0.2509804, 0, 1,
-1.594839, -0.5522667, 0.9217338, 1, 0.2588235, 0, 1,
-1.593267, -1.049689, -2.11338, 1, 0.2627451, 0, 1,
-1.573971, -0.0435158, -2.824581, 1, 0.2705882, 0, 1,
-1.573615, 1.112505, -1.697742, 1, 0.2745098, 0, 1,
-1.573406, 0.05510383, -2.361443, 1, 0.282353, 0, 1,
-1.572475, -0.6770081, -2.332454, 1, 0.2862745, 0, 1,
-1.565938, 0.1830999, -2.293691, 1, 0.2941177, 0, 1,
-1.558497, -0.7961372, -2.569911, 1, 0.3019608, 0, 1,
-1.555307, 1.186802, 0.5794231, 1, 0.3058824, 0, 1,
-1.522428, 0.7169597, -1.432036, 1, 0.3137255, 0, 1,
-1.5128, 0.004470595, -1.692213, 1, 0.3176471, 0, 1,
-1.491097, -0.9842069, -3.184753, 1, 0.3254902, 0, 1,
-1.475158, 0.009943471, -1.245653, 1, 0.3294118, 0, 1,
-1.467108, -2.43199, -3.552789, 1, 0.3372549, 0, 1,
-1.446183, -1.279622, -2.889308, 1, 0.3411765, 0, 1,
-1.444454, 1.326179, -1.733166, 1, 0.3490196, 0, 1,
-1.432908, 1.481482, 0.2263068, 1, 0.3529412, 0, 1,
-1.428681, -0.85577, -1.566121, 1, 0.3607843, 0, 1,
-1.427663, -0.5525623, -3.182551, 1, 0.3647059, 0, 1,
-1.412566, 0.9643331, -1.08529, 1, 0.372549, 0, 1,
-1.411051, -1.04176, -1.702876, 1, 0.3764706, 0, 1,
-1.396535, 0.07397491, -3.884547, 1, 0.3843137, 0, 1,
-1.38763, -0.1176021, -2.012104, 1, 0.3882353, 0, 1,
-1.380629, -1.637415, -2.891657, 1, 0.3960784, 0, 1,
-1.380254, -0.07495494, -1.857169, 1, 0.4039216, 0, 1,
-1.377441, 1.062322, -2.892978, 1, 0.4078431, 0, 1,
-1.376748, 1.128765, -1.928353, 1, 0.4156863, 0, 1,
-1.371737, -1.360657, -2.73937, 1, 0.4196078, 0, 1,
-1.360776, 1.375896, -1.208429, 1, 0.427451, 0, 1,
-1.359804, 0.5107948, 0.2711903, 1, 0.4313726, 0, 1,
-1.352108, 1.463109, -0.9418985, 1, 0.4392157, 0, 1,
-1.345357, 0.08725932, -1.657205, 1, 0.4431373, 0, 1,
-1.334605, -1.475861, -3.620705, 1, 0.4509804, 0, 1,
-1.310752, 0.3258504, -0.8939989, 1, 0.454902, 0, 1,
-1.297789, -0.05165177, -1.588121, 1, 0.4627451, 0, 1,
-1.284398, -1.075331, -4.547127, 1, 0.4666667, 0, 1,
-1.282681, -0.2363363, -3.061283, 1, 0.4745098, 0, 1,
-1.278262, -0.7165514, -0.649533, 1, 0.4784314, 0, 1,
-1.275853, 0.1204767, -0.2148461, 1, 0.4862745, 0, 1,
-1.272281, -2.444246, -2.511718, 1, 0.4901961, 0, 1,
-1.270879, -1.396868, -2.686881, 1, 0.4980392, 0, 1,
-1.270223, -0.407562, -0.6654576, 1, 0.5058824, 0, 1,
-1.264635, 1.359805, -0.6797983, 1, 0.509804, 0, 1,
-1.261625, -0.6251196, 0.3718188, 1, 0.5176471, 0, 1,
-1.259602, -0.5121837, -1.436335, 1, 0.5215687, 0, 1,
-1.25487, -1.390185, -2.107708, 1, 0.5294118, 0, 1,
-1.247945, 0.4815383, -0.05498627, 1, 0.5333334, 0, 1,
-1.234253, 0.563454, -1.400329, 1, 0.5411765, 0, 1,
-1.223141, 0.7532151, -0.6184263, 1, 0.5450981, 0, 1,
-1.222502, 0.1769145, -1.645437, 1, 0.5529412, 0, 1,
-1.221505, 0.8459315, -1.785102, 1, 0.5568628, 0, 1,
-1.218885, 0.1737214, 0.397583, 1, 0.5647059, 0, 1,
-1.216176, 0.878702, -1.436193, 1, 0.5686275, 0, 1,
-1.209435, 0.5686898, 0.9855103, 1, 0.5764706, 0, 1,
-1.203069, 1.181172, -1.223182, 1, 0.5803922, 0, 1,
-1.196819, -0.3629353, -2.292207, 1, 0.5882353, 0, 1,
-1.193597, 2.59863, -0.8160452, 1, 0.5921569, 0, 1,
-1.190611, -0.8795648, -1.208835, 1, 0.6, 0, 1,
-1.175951, 0.2357516, -1.505536, 1, 0.6078432, 0, 1,
-1.167467, -0.635108, -1.201295, 1, 0.6117647, 0, 1,
-1.166059, -1.440742, -2.436531, 1, 0.6196079, 0, 1,
-1.164865, -1.08853, -3.428687, 1, 0.6235294, 0, 1,
-1.163262, -2.469598, -3.456173, 1, 0.6313726, 0, 1,
-1.159693, -0.08504791, -2.629445, 1, 0.6352941, 0, 1,
-1.158163, -1.252924, -2.566865, 1, 0.6431373, 0, 1,
-1.15613, 1.08669, 0.3192619, 1, 0.6470588, 0, 1,
-1.155986, 0.002377392, -1.341774, 1, 0.654902, 0, 1,
-1.151308, 0.6679882, -1.138863, 1, 0.6588235, 0, 1,
-1.148334, 1.712793, -3.13581, 1, 0.6666667, 0, 1,
-1.145656, 0.7724075, 0.1182317, 1, 0.6705883, 0, 1,
-1.140441, 0.08925407, -2.866477, 1, 0.6784314, 0, 1,
-1.139005, -0.2970487, -0.6203036, 1, 0.682353, 0, 1,
-1.138771, 0.03821478, -0.09317459, 1, 0.6901961, 0, 1,
-1.13469, 0.2416908, -2.488041, 1, 0.6941177, 0, 1,
-1.131672, 1.853232, -2.145831, 1, 0.7019608, 0, 1,
-1.128426, -0.398816, -2.933074, 1, 0.7098039, 0, 1,
-1.12219, -1.118305, -3.996036, 1, 0.7137255, 0, 1,
-1.114739, 1.152318, 1.304949, 1, 0.7215686, 0, 1,
-1.101493, -0.2937527, -2.44429, 1, 0.7254902, 0, 1,
-1.098861, -0.05901641, -3.413604, 1, 0.7333333, 0, 1,
-1.095814, 0.8479416, 0.1742265, 1, 0.7372549, 0, 1,
-1.088554, 0.1648077, -0.9097775, 1, 0.7450981, 0, 1,
-1.086643, 1.016307, -2.137779, 1, 0.7490196, 0, 1,
-1.080661, 0.1595759, -2.963938, 1, 0.7568628, 0, 1,
-1.062741, -1.935154, -2.817352, 1, 0.7607843, 0, 1,
-1.058071, -0.8567597, -2.735797, 1, 0.7686275, 0, 1,
-1.050545, -0.2663676, -1.338493, 1, 0.772549, 0, 1,
-1.049861, -0.4803753, -2.113362, 1, 0.7803922, 0, 1,
-1.048299, -0.2053861, -2.364331, 1, 0.7843137, 0, 1,
-1.048236, 1.061965, -1.198194, 1, 0.7921569, 0, 1,
-1.043571, 0.7829896, -0.3392071, 1, 0.7960784, 0, 1,
-1.039785, -0.3326322, -1.822764, 1, 0.8039216, 0, 1,
-1.024081, -0.6852177, -1.184694, 1, 0.8117647, 0, 1,
-1.023858, -0.9089978, -2.72293, 1, 0.8156863, 0, 1,
-1.018008, -0.509091, -0.2657795, 1, 0.8235294, 0, 1,
-1.012836, -0.03334158, 0.314665, 1, 0.827451, 0, 1,
-1.012479, 0.5853549, -1.943689, 1, 0.8352941, 0, 1,
-1.006327, 0.6112543, 0.6761283, 1, 0.8392157, 0, 1,
-1.0051, 0.331214, -0.4674557, 1, 0.8470588, 0, 1,
-1.00179, 0.9936113, -0.8710569, 1, 0.8509804, 0, 1,
-1.001562, 0.6305875, -1.71761, 1, 0.8588235, 0, 1,
-1.001142, -0.009302397, -3.296732, 1, 0.8627451, 0, 1,
-0.9944099, -0.1647738, -0.8847619, 1, 0.8705882, 0, 1,
-0.9932334, -0.4280767, -1.129602, 1, 0.8745098, 0, 1,
-0.9900252, 1.128105, -1.946642, 1, 0.8823529, 0, 1,
-0.9899055, 0.4343964, -0.6776943, 1, 0.8862745, 0, 1,
-0.9799505, -1.789678, -2.333199, 1, 0.8941177, 0, 1,
-0.978576, -0.27885, -0.6547834, 1, 0.8980392, 0, 1,
-0.9735031, 0.6570436, -1.786452, 1, 0.9058824, 0, 1,
-0.959931, 0.8317856, -3.411092, 1, 0.9137255, 0, 1,
-0.9556924, -0.6699519, -1.48634, 1, 0.9176471, 0, 1,
-0.9511296, -2.281529, -4.070093, 1, 0.9254902, 0, 1,
-0.9498429, -0.7279339, -2.973665, 1, 0.9294118, 0, 1,
-0.9473538, 2.915797, -1.272263, 1, 0.9372549, 0, 1,
-0.9422056, 0.5379205, 0.6323063, 1, 0.9411765, 0, 1,
-0.9296735, 0.02051547, -2.580063, 1, 0.9490196, 0, 1,
-0.9270478, -0.1373424, -2.493969, 1, 0.9529412, 0, 1,
-0.9219322, 0.4947482, -2.009467, 1, 0.9607843, 0, 1,
-0.9217544, -0.004641296, -1.716034, 1, 0.9647059, 0, 1,
-0.921487, 1.424567, 0.2861073, 1, 0.972549, 0, 1,
-0.9212549, -0.2364642, -3.228068, 1, 0.9764706, 0, 1,
-0.9162234, 0.1238216, -2.070989, 1, 0.9843137, 0, 1,
-0.9159598, -0.73099, -2.306827, 1, 0.9882353, 0, 1,
-0.9075055, 0.4229756, 0.3425367, 1, 0.9960784, 0, 1,
-0.8913484, 0.2592678, -1.290427, 0.9960784, 1, 0, 1,
-0.8906808, 0.8684825, -0.8805217, 0.9921569, 1, 0, 1,
-0.88486, -0.8699378, -3.083026, 0.9843137, 1, 0, 1,
-0.8745981, -0.6943628, -0.7689226, 0.9803922, 1, 0, 1,
-0.8723031, 0.3156867, -2.090016, 0.972549, 1, 0, 1,
-0.871027, -0.8565241, -1.686113, 0.9686275, 1, 0, 1,
-0.8687212, -0.9602144, -1.252645, 0.9607843, 1, 0, 1,
-0.8651772, -0.8127335, -3.106983, 0.9568627, 1, 0, 1,
-0.8633534, -0.07198223, -0.8246761, 0.9490196, 1, 0, 1,
-0.8620852, 0.1740831, -0.5636769, 0.945098, 1, 0, 1,
-0.8535315, 2.067316, -0.01163873, 0.9372549, 1, 0, 1,
-0.8487515, -0.2892768, -1.712307, 0.9333333, 1, 0, 1,
-0.8480241, -1.375291, -3.379109, 0.9254902, 1, 0, 1,
-0.8393824, -1.193315, -2.207532, 0.9215686, 1, 0, 1,
-0.8357302, -0.7018346, -1.637948, 0.9137255, 1, 0, 1,
-0.8327311, -0.4316008, -0.5335513, 0.9098039, 1, 0, 1,
-0.8290472, -0.698138, -2.195311, 0.9019608, 1, 0, 1,
-0.8289491, -0.180813, -3.014684, 0.8941177, 1, 0, 1,
-0.828405, 1.595893, -0.5188957, 0.8901961, 1, 0, 1,
-0.8221428, 0.6159632, -0.6880941, 0.8823529, 1, 0, 1,
-0.8219844, -1.135261, -2.376202, 0.8784314, 1, 0, 1,
-0.8192235, 0.6763337, -1.174303, 0.8705882, 1, 0, 1,
-0.8149105, 1.330284, -2.519029, 0.8666667, 1, 0, 1,
-0.8122727, -0.2290425, -2.755744, 0.8588235, 1, 0, 1,
-0.8116861, 0.9160073, 0.04602757, 0.854902, 1, 0, 1,
-0.8031974, 0.5459309, -2.396041, 0.8470588, 1, 0, 1,
-0.8024909, 0.002204667, -1.885943, 0.8431373, 1, 0, 1,
-0.7987033, 1.585555, -0.4915847, 0.8352941, 1, 0, 1,
-0.7939604, 0.1135506, -1.580705, 0.8313726, 1, 0, 1,
-0.7929082, 0.6652094, -0.9843237, 0.8235294, 1, 0, 1,
-0.7925788, -0.3063672, -1.611627, 0.8196079, 1, 0, 1,
-0.7907116, 0.0632815, -3.704214, 0.8117647, 1, 0, 1,
-0.7830924, -0.008402373, -3.070416, 0.8078431, 1, 0, 1,
-0.7713251, 2.807359, -0.02106352, 0.8, 1, 0, 1,
-0.7670602, 0.200079, -0.6734282, 0.7921569, 1, 0, 1,
-0.7640398, -0.3326764, -1.238337, 0.7882353, 1, 0, 1,
-0.7639385, 0.2547688, -1.897151, 0.7803922, 1, 0, 1,
-0.7583961, -0.4448396, -3.447239, 0.7764706, 1, 0, 1,
-0.7576277, -0.8831724, -4.229042, 0.7686275, 1, 0, 1,
-0.7548426, 0.5455784, -0.6433159, 0.7647059, 1, 0, 1,
-0.7519135, -0.2853468, -2.335256, 0.7568628, 1, 0, 1,
-0.7512386, -0.9872874, -1.899903, 0.7529412, 1, 0, 1,
-0.743798, -0.4482756, -3.096851, 0.7450981, 1, 0, 1,
-0.7407784, -0.8145561, -2.814526, 0.7411765, 1, 0, 1,
-0.7372106, -1.015833, -1.165252, 0.7333333, 1, 0, 1,
-0.72655, -1.677533, -3.304168, 0.7294118, 1, 0, 1,
-0.719359, -0.2287861, -4.145941, 0.7215686, 1, 0, 1,
-0.7147253, 0.3830871, 0.4595686, 0.7176471, 1, 0, 1,
-0.7124186, 1.249949, 0.2199714, 0.7098039, 1, 0, 1,
-0.7103866, -0.3086493, -1.897676, 0.7058824, 1, 0, 1,
-0.708855, -1.5299, -3.62533, 0.6980392, 1, 0, 1,
-0.7080969, 0.306844, 0.5652823, 0.6901961, 1, 0, 1,
-0.7061064, -1.95121, -2.227373, 0.6862745, 1, 0, 1,
-0.7057834, -1.627881, -1.679666, 0.6784314, 1, 0, 1,
-0.7047285, 1.479816, -1.153328, 0.6745098, 1, 0, 1,
-0.7044066, -0.2784238, -1.186686, 0.6666667, 1, 0, 1,
-0.7032231, -1.818546, -2.241146, 0.6627451, 1, 0, 1,
-0.7002277, 2.148849, -0.4263498, 0.654902, 1, 0, 1,
-0.6935923, -1.041261, -3.500715, 0.6509804, 1, 0, 1,
-0.6927175, -0.9732426, -4.049001, 0.6431373, 1, 0, 1,
-0.6872422, -1.120631, -2.462363, 0.6392157, 1, 0, 1,
-0.6861308, 0.9848286, -1.271732, 0.6313726, 1, 0, 1,
-0.6792737, 0.5346087, 0.3437827, 0.627451, 1, 0, 1,
-0.6773198, -0.591471, -2.106961, 0.6196079, 1, 0, 1,
-0.6762816, 0.4893024, -0.181015, 0.6156863, 1, 0, 1,
-0.6749797, -0.01728649, -1.6597, 0.6078432, 1, 0, 1,
-0.6734875, -1.818384, -1.307313, 0.6039216, 1, 0, 1,
-0.6723354, 0.4391855, -1.877931, 0.5960785, 1, 0, 1,
-0.6711557, 0.5959508, -1.61033, 0.5882353, 1, 0, 1,
-0.6674517, 1.73583, -0.4601643, 0.5843138, 1, 0, 1,
-0.6665816, 0.6088083, -0.2705052, 0.5764706, 1, 0, 1,
-0.665341, 0.2305027, -0.7438431, 0.572549, 1, 0, 1,
-0.6620927, -1.188859, -1.859986, 0.5647059, 1, 0, 1,
-0.6584013, 0.3289852, 0.7710392, 0.5607843, 1, 0, 1,
-0.6545391, -0.4211219, -2.78135, 0.5529412, 1, 0, 1,
-0.6535301, -0.2604459, -2.206327, 0.5490196, 1, 0, 1,
-0.6508002, -0.1854356, -2.973786, 0.5411765, 1, 0, 1,
-0.6457016, -1.420493, -2.490767, 0.5372549, 1, 0, 1,
-0.641184, 0.4056334, -0.4617622, 0.5294118, 1, 0, 1,
-0.6407951, 0.3272415, -1.689407, 0.5254902, 1, 0, 1,
-0.6366502, -0.01524255, -0.009810768, 0.5176471, 1, 0, 1,
-0.6328189, 0.5606729, 0.7291934, 0.5137255, 1, 0, 1,
-0.6307935, -0.6418595, -2.660854, 0.5058824, 1, 0, 1,
-0.6265935, -1.175136, -2.939312, 0.5019608, 1, 0, 1,
-0.6247946, -0.03446474, -1.261411, 0.4941176, 1, 0, 1,
-0.6214111, 1.503914, -0.07917044, 0.4862745, 1, 0, 1,
-0.6199662, 1.043392, -1.281027, 0.4823529, 1, 0, 1,
-0.613035, 0.8245287, -0.9994859, 0.4745098, 1, 0, 1,
-0.6127349, -0.8027686, -2.65855, 0.4705882, 1, 0, 1,
-0.6094028, -0.6583536, -0.6076626, 0.4627451, 1, 0, 1,
-0.6071091, -0.6716673, -3.00566, 0.4588235, 1, 0, 1,
-0.6048025, -0.3902158, -1.078081, 0.4509804, 1, 0, 1,
-0.6033494, -0.3931022, -1.187386, 0.4470588, 1, 0, 1,
-0.6029308, 0.5438839, -0.6051636, 0.4392157, 1, 0, 1,
-0.6024172, 0.3388193, -0.6876341, 0.4352941, 1, 0, 1,
-0.6023909, 0.7279024, -0.3014816, 0.427451, 1, 0, 1,
-0.5924978, 0.01126412, -0.4514403, 0.4235294, 1, 0, 1,
-0.5907931, 1.393958, -0.7263965, 0.4156863, 1, 0, 1,
-0.5848324, -0.9975997, -4.324444, 0.4117647, 1, 0, 1,
-0.5832176, -0.4191692, -2.126199, 0.4039216, 1, 0, 1,
-0.5811892, -1.257275, -2.006022, 0.3960784, 1, 0, 1,
-0.5800229, -1.106228, -2.70741, 0.3921569, 1, 0, 1,
-0.5755813, 0.2610782, -0.1431028, 0.3843137, 1, 0, 1,
-0.572544, -0.1051376, -2.796967, 0.3803922, 1, 0, 1,
-0.5701744, -0.7106527, -2.126032, 0.372549, 1, 0, 1,
-0.5695149, -1.078839, -1.898658, 0.3686275, 1, 0, 1,
-0.5655414, 0.7361813, 0.2778929, 0.3607843, 1, 0, 1,
-0.5600861, -0.8095804, -3.659153, 0.3568628, 1, 0, 1,
-0.5549486, 0.238023, -0.3636805, 0.3490196, 1, 0, 1,
-0.5538566, 0.463119, -2.964602, 0.345098, 1, 0, 1,
-0.5514752, -0.1875739, -2.521435, 0.3372549, 1, 0, 1,
-0.5491654, 0.8981978, -0.6141997, 0.3333333, 1, 0, 1,
-0.5490355, 1.389218, -0.3042198, 0.3254902, 1, 0, 1,
-0.5375636, -0.1554383, -1.952317, 0.3215686, 1, 0, 1,
-0.5359689, 0.8924071, -0.3348349, 0.3137255, 1, 0, 1,
-0.5325356, 2.040536, -2.263281, 0.3098039, 1, 0, 1,
-0.5292763, -0.08725064, -1.935527, 0.3019608, 1, 0, 1,
-0.5260846, -0.3073365, -1.42381, 0.2941177, 1, 0, 1,
-0.5237342, 0.1522507, 0.2459717, 0.2901961, 1, 0, 1,
-0.5213737, 0.5674538, -1.8539, 0.282353, 1, 0, 1,
-0.5205766, -0.6020381, -1.676909, 0.2784314, 1, 0, 1,
-0.5149348, -0.9049068, -3.005047, 0.2705882, 1, 0, 1,
-0.5090704, 0.01232865, -3.975836, 0.2666667, 1, 0, 1,
-0.508108, -0.08767319, -2.571156, 0.2588235, 1, 0, 1,
-0.5047035, -0.2680065, -2.353479, 0.254902, 1, 0, 1,
-0.5020971, -1.059293, -2.466897, 0.2470588, 1, 0, 1,
-0.5014099, 1.662526, -0.4848139, 0.2431373, 1, 0, 1,
-0.5012748, 2.124843, 0.3297471, 0.2352941, 1, 0, 1,
-0.498289, 0.693841, 0.7726527, 0.2313726, 1, 0, 1,
-0.4976476, -0.3628674, -0.7829462, 0.2235294, 1, 0, 1,
-0.4965903, -0.7772573, -2.219228, 0.2196078, 1, 0, 1,
-0.4886646, -1.836683, -2.685123, 0.2117647, 1, 0, 1,
-0.4858502, 0.2788938, -2.185086, 0.2078431, 1, 0, 1,
-0.4806912, -1.29973, -2.701869, 0.2, 1, 0, 1,
-0.4776745, 0.2945799, -1.78653, 0.1921569, 1, 0, 1,
-0.4749675, 0.4498557, -2.288531, 0.1882353, 1, 0, 1,
-0.4747304, 1.44317, -2.745695, 0.1803922, 1, 0, 1,
-0.4727969, 0.4207433, -1.44516, 0.1764706, 1, 0, 1,
-0.4717331, 0.6080521, -1.218417, 0.1686275, 1, 0, 1,
-0.4695788, 0.7312033, -1.342804, 0.1647059, 1, 0, 1,
-0.4659105, 0.1637153, -1.990861, 0.1568628, 1, 0, 1,
-0.4620741, -0.1224772, -1.966562, 0.1529412, 1, 0, 1,
-0.4614923, 0.09487061, -0.3121227, 0.145098, 1, 0, 1,
-0.4611142, -0.7683244, -2.601002, 0.1411765, 1, 0, 1,
-0.4594596, -0.4384805, -3.138358, 0.1333333, 1, 0, 1,
-0.4515396, 1.144839, 0.7521613, 0.1294118, 1, 0, 1,
-0.4474547, 1.108053, -1.111826, 0.1215686, 1, 0, 1,
-0.4446468, 0.4421377, -1.668886, 0.1176471, 1, 0, 1,
-0.4411951, -1.120241, -3.203355, 0.1098039, 1, 0, 1,
-0.4386067, 0.8043556, -0.347293, 0.1058824, 1, 0, 1,
-0.4385712, 0.5128168, -1.824228, 0.09803922, 1, 0, 1,
-0.4351529, 0.779951, -1.759312, 0.09019608, 1, 0, 1,
-0.4328345, -1.079328, -3.983811, 0.08627451, 1, 0, 1,
-0.4307814, -0.548909, -2.106559, 0.07843138, 1, 0, 1,
-0.429043, 0.1244315, -0.4945116, 0.07450981, 1, 0, 1,
-0.4279819, 0.1947994, -2.559091, 0.06666667, 1, 0, 1,
-0.4241797, -1.145114, -5.059286, 0.0627451, 1, 0, 1,
-0.4209949, 0.03991522, 0.9981243, 0.05490196, 1, 0, 1,
-0.4180181, 0.6986287, -1.192088, 0.05098039, 1, 0, 1,
-0.4156258, 1.151981, -0.6738718, 0.04313726, 1, 0, 1,
-0.414098, -1.39031, -4.072213, 0.03921569, 1, 0, 1,
-0.4125616, -0.3046688, -3.763025, 0.03137255, 1, 0, 1,
-0.4110606, -0.3463126, -2.769724, 0.02745098, 1, 0, 1,
-0.4108178, -0.8890931, -1.942897, 0.01960784, 1, 0, 1,
-0.4081399, -0.3119224, -0.550062, 0.01568628, 1, 0, 1,
-0.4071261, -0.04077396, -2.136935, 0.007843138, 1, 0, 1,
-0.4052922, 1.149715, -1.476358, 0.003921569, 1, 0, 1,
-0.404216, -0.6126587, -2.011901, 0, 1, 0.003921569, 1,
-0.3985503, 0.7792609, -0.2057563, 0, 1, 0.01176471, 1,
-0.3936698, -0.4300397, -2.56053, 0, 1, 0.01568628, 1,
-0.3900108, -0.370527, -0.4533831, 0, 1, 0.02352941, 1,
-0.3895858, -1.796043, -2.962315, 0, 1, 0.02745098, 1,
-0.3878692, 0.6490597, -1.504634, 0, 1, 0.03529412, 1,
-0.3819523, 0.550131, 0.1110892, 0, 1, 0.03921569, 1,
-0.3806095, -0.1534802, -0.6234747, 0, 1, 0.04705882, 1,
-0.3793292, -0.352381, -3.249634, 0, 1, 0.05098039, 1,
-0.3754335, 0.5114873, -0.3393998, 0, 1, 0.05882353, 1,
-0.3748951, 0.3653975, 0.08163927, 0, 1, 0.0627451, 1,
-0.3716706, 0.6912926, -1.812793, 0, 1, 0.07058824, 1,
-0.3709018, -0.2314988, -2.570365, 0, 1, 0.07450981, 1,
-0.3699124, -0.22806, -1.110663, 0, 1, 0.08235294, 1,
-0.3629482, 1.963134, -1.024824, 0, 1, 0.08627451, 1,
-0.3607393, 0.5572043, -0.806599, 0, 1, 0.09411765, 1,
-0.3599166, -0.8876354, -1.906837, 0, 1, 0.1019608, 1,
-0.3531299, 1.614511, -0.05558974, 0, 1, 0.1058824, 1,
-0.3514759, 1.617623, 0.9177101, 0, 1, 0.1137255, 1,
-0.3510796, -0.1775791, -1.878028, 0, 1, 0.1176471, 1,
-0.3503284, -1.577739, -3.186174, 0, 1, 0.1254902, 1,
-0.3416137, -0.184409, -2.829612, 0, 1, 0.1294118, 1,
-0.3391654, 0.09115972, -2.771863, 0, 1, 0.1372549, 1,
-0.3373958, 0.4877068, -0.0311619, 0, 1, 0.1411765, 1,
-0.3373914, 1.227702, -0.6140445, 0, 1, 0.1490196, 1,
-0.3355406, -0.1980609, -2.706372, 0, 1, 0.1529412, 1,
-0.3338832, 0.8570871, 1.102165, 0, 1, 0.1607843, 1,
-0.3282918, 1.005107, -0.7180685, 0, 1, 0.1647059, 1,
-0.3241946, 2.478793, -0.4015604, 0, 1, 0.172549, 1,
-0.3217718, -0.4693454, -4.167888, 0, 1, 0.1764706, 1,
-0.3165131, 1.011695, 0.166047, 0, 1, 0.1843137, 1,
-0.3165027, 1.225556, -0.6326935, 0, 1, 0.1882353, 1,
-0.3146464, -0.6978777, -2.168703, 0, 1, 0.1960784, 1,
-0.3140725, 0.1889075, 0.6496315, 0, 1, 0.2039216, 1,
-0.3094381, -1.422133, -4.08328, 0, 1, 0.2078431, 1,
-0.2986264, -1.515328, -2.479657, 0, 1, 0.2156863, 1,
-0.2937398, 0.3576667, 0.9317455, 0, 1, 0.2196078, 1,
-0.2935687, 0.3782482, -1.28992, 0, 1, 0.227451, 1,
-0.2888585, 1.68979, 2.203709, 0, 1, 0.2313726, 1,
-0.2860478, 0.7417448, 0.8093606, 0, 1, 0.2392157, 1,
-0.2850028, -0.2000142, -2.863293, 0, 1, 0.2431373, 1,
-0.2844625, -1.737858, -2.492982, 0, 1, 0.2509804, 1,
-0.2813313, -1.518033, -4.371066, 0, 1, 0.254902, 1,
-0.2807997, 0.02213394, -1.662036, 0, 1, 0.2627451, 1,
-0.2766374, -0.2745631, -3.697245, 0, 1, 0.2666667, 1,
-0.2725001, -1.750857, -3.937521, 0, 1, 0.2745098, 1,
-0.2679756, -0.9468451, -3.886541, 0, 1, 0.2784314, 1,
-0.2671885, 0.1835791, -0.02478585, 0, 1, 0.2862745, 1,
-0.2670667, 0.2257208, -1.735711, 0, 1, 0.2901961, 1,
-0.2666301, -0.7989916, -3.276429, 0, 1, 0.2980392, 1,
-0.2646775, 0.2475622, -1.802883, 0, 1, 0.3058824, 1,
-0.2598876, 0.5259359, -0.7960624, 0, 1, 0.3098039, 1,
-0.25765, -0.514945, -1.176816, 0, 1, 0.3176471, 1,
-0.2514555, -0.05825584, -1.502599, 0, 1, 0.3215686, 1,
-0.2486875, 0.1596092, -1.510378, 0, 1, 0.3294118, 1,
-0.2477748, -1.118497, -1.516671, 0, 1, 0.3333333, 1,
-0.2471679, -0.5826992, -4.798667, 0, 1, 0.3411765, 1,
-0.2441475, -0.6718187, -3.128896, 0, 1, 0.345098, 1,
-0.2387563, -0.5134464, -3.591408, 0, 1, 0.3529412, 1,
-0.237225, -1.456021, -2.581778, 0, 1, 0.3568628, 1,
-0.2366938, -1.372096, -2.385624, 0, 1, 0.3647059, 1,
-0.2329611, 0.5727337, -0.3604389, 0, 1, 0.3686275, 1,
-0.2291947, 2.958972, 1.659499, 0, 1, 0.3764706, 1,
-0.2287478, -0.07261536, -2.5681, 0, 1, 0.3803922, 1,
-0.2248657, 0.7117772, -1.097287, 0, 1, 0.3882353, 1,
-0.2248274, -1.194153, -1.568116, 0, 1, 0.3921569, 1,
-0.2208839, 0.2235066, -0.7509342, 0, 1, 0.4, 1,
-0.218603, -0.8127717, -3.715587, 0, 1, 0.4078431, 1,
-0.2172178, -0.1520269, -2.067591, 0, 1, 0.4117647, 1,
-0.2170322, -0.02675638, -1.896647, 0, 1, 0.4196078, 1,
-0.2165319, 0.6539505, -1.72928, 0, 1, 0.4235294, 1,
-0.2163994, -1.697605, -3.115219, 0, 1, 0.4313726, 1,
-0.2153088, 1.534883, -1.214288, 0, 1, 0.4352941, 1,
-0.2098183, 0.08930637, -1.225088, 0, 1, 0.4431373, 1,
-0.2084036, -1.036193, -4.162034, 0, 1, 0.4470588, 1,
-0.2065706, 1.263527, -0.4746797, 0, 1, 0.454902, 1,
-0.2056322, 0.1924161, -0.7570163, 0, 1, 0.4588235, 1,
-0.2041749, 0.2393831, -0.5988125, 0, 1, 0.4666667, 1,
-0.2035318, 1.296491, -0.9608182, 0, 1, 0.4705882, 1,
-0.2024476, 0.2118142, -0.8734881, 0, 1, 0.4784314, 1,
-0.2020402, 1.589065, -0.3002259, 0, 1, 0.4823529, 1,
-0.1975871, 0.1214051, -0.5596259, 0, 1, 0.4901961, 1,
-0.1964894, -0.8708101, -2.880302, 0, 1, 0.4941176, 1,
-0.1949003, -0.8610064, -1.338169, 0, 1, 0.5019608, 1,
-0.1921662, 0.7854212, -1.101295, 0, 1, 0.509804, 1,
-0.1892482, -1.3138, -3.842901, 0, 1, 0.5137255, 1,
-0.1888908, 0.4275973, 0.3910107, 0, 1, 0.5215687, 1,
-0.1886618, 0.8047948, -1.082921, 0, 1, 0.5254902, 1,
-0.1835147, -0.5855708, -0.5437233, 0, 1, 0.5333334, 1,
-0.1789661, -0.339788, -4.343393, 0, 1, 0.5372549, 1,
-0.1785458, -1.362117, -2.14885, 0, 1, 0.5450981, 1,
-0.1747274, 0.81287, -1.057439, 0, 1, 0.5490196, 1,
-0.1743216, -1.057366, -2.081238, 0, 1, 0.5568628, 1,
-0.1730682, -0.3426979, -1.618917, 0, 1, 0.5607843, 1,
-0.1726716, -0.2890703, -3.788772, 0, 1, 0.5686275, 1,
-0.1723651, 0.6630924, -0.3332764, 0, 1, 0.572549, 1,
-0.1718875, -0.8118824, -2.785373, 0, 1, 0.5803922, 1,
-0.1707742, 0.0583171, -1.799788, 0, 1, 0.5843138, 1,
-0.1676498, 0.2850929, -0.9006739, 0, 1, 0.5921569, 1,
-0.1649877, -0.5547505, -3.047286, 0, 1, 0.5960785, 1,
-0.1623972, 1.814198, 0.5502028, 0, 1, 0.6039216, 1,
-0.1616629, -0.9558095, -2.931942, 0, 1, 0.6117647, 1,
-0.1609073, 0.2533295, -2.337404, 0, 1, 0.6156863, 1,
-0.1553192, 1.041331, 1.975377, 0, 1, 0.6235294, 1,
-0.1533003, -0.9884308, -2.260659, 0, 1, 0.627451, 1,
-0.1510892, -0.193469, -1.187004, 0, 1, 0.6352941, 1,
-0.1488279, -0.7884179, -3.092809, 0, 1, 0.6392157, 1,
-0.1476358, 0.0006695908, -2.284836, 0, 1, 0.6470588, 1,
-0.14506, -1.122818, -3.012748, 0, 1, 0.6509804, 1,
-0.1436296, -0.1988041, -0.4654945, 0, 1, 0.6588235, 1,
-0.1385473, 1.278477, -0.5518282, 0, 1, 0.6627451, 1,
-0.1375347, -0.8430373, -4.409016, 0, 1, 0.6705883, 1,
-0.1312822, -1.376177, -2.428991, 0, 1, 0.6745098, 1,
-0.1291137, 0.214617, -0.4692914, 0, 1, 0.682353, 1,
-0.1289685, 1.29376, 1.583907, 0, 1, 0.6862745, 1,
-0.1271845, -0.701256, -1.68867, 0, 1, 0.6941177, 1,
-0.1230592, -0.4355985, -1.074747, 0, 1, 0.7019608, 1,
-0.1196694, 0.4009586, -0.1743129, 0, 1, 0.7058824, 1,
-0.1151633, 2.018091, 0.2269048, 0, 1, 0.7137255, 1,
-0.1142467, -1.098898, -2.884212, 0, 1, 0.7176471, 1,
-0.103376, -0.0554534, -2.578981, 0, 1, 0.7254902, 1,
-0.1012699, 0.7701734, -1.040964, 0, 1, 0.7294118, 1,
-0.09796197, -0.1116561, -3.11675, 0, 1, 0.7372549, 1,
-0.09559247, -1.743297, -3.239625, 0, 1, 0.7411765, 1,
-0.09274429, -1.070698, -5.753939, 0, 1, 0.7490196, 1,
-0.09265556, 2.242366, 0.09672421, 0, 1, 0.7529412, 1,
-0.08535428, 0.3964227, -1.020837, 0, 1, 0.7607843, 1,
-0.08515013, -0.6027786, -2.154388, 0, 1, 0.7647059, 1,
-0.08155616, 0.2025205, 0.06552397, 0, 1, 0.772549, 1,
-0.08029022, -0.2527628, -1.319137, 0, 1, 0.7764706, 1,
-0.07908837, -0.1656214, -3.106121, 0, 1, 0.7843137, 1,
-0.07641492, -1.013533, -3.97606, 0, 1, 0.7882353, 1,
-0.07350055, -0.9178069, -2.792292, 0, 1, 0.7960784, 1,
-0.06195683, 2.837584, -1.088745, 0, 1, 0.8039216, 1,
-0.05691305, 1.3295, -0.935483, 0, 1, 0.8078431, 1,
-0.05608154, -0.6776713, -1.569973, 0, 1, 0.8156863, 1,
-0.05323688, -1.587334, -3.425828, 0, 1, 0.8196079, 1,
-0.05101622, 0.8068308, -1.10659, 0, 1, 0.827451, 1,
-0.0497308, 0.2783692, -0.8788672, 0, 1, 0.8313726, 1,
-0.04901357, 0.552244, -0.3568928, 0, 1, 0.8392157, 1,
-0.0482697, -0.7671837, -4.890244, 0, 1, 0.8431373, 1,
-0.0467285, 0.6381129, -0.5384935, 0, 1, 0.8509804, 1,
-0.04508793, -0.8560007, -1.944781, 0, 1, 0.854902, 1,
-0.04451101, -0.6445841, -2.575227, 0, 1, 0.8627451, 1,
-0.04178787, 1.813945, -0.6485111, 0, 1, 0.8666667, 1,
-0.04122075, -1.505718, -4.293745, 0, 1, 0.8745098, 1,
-0.04075906, 1.791677, 0.3495651, 0, 1, 0.8784314, 1,
-0.03806263, -0.4327562, -1.131882, 0, 1, 0.8862745, 1,
-0.03566059, 0.719272, -0.3033419, 0, 1, 0.8901961, 1,
-0.03560899, 1.619231, -0.4063606, 0, 1, 0.8980392, 1,
-0.03480085, -1.211902, -3.011486, 0, 1, 0.9058824, 1,
-0.03325925, -0.4358895, -2.991319, 0, 1, 0.9098039, 1,
-0.03169615, 0.4742826, 0.9656166, 0, 1, 0.9176471, 1,
-0.03059463, 0.1204352, 0.06445503, 0, 1, 0.9215686, 1,
-0.02915765, 1.275585, 0.4789307, 0, 1, 0.9294118, 1,
-0.02903906, -0.5606228, -2.777186, 0, 1, 0.9333333, 1,
-0.02427908, -1.048798, -2.493772, 0, 1, 0.9411765, 1,
-0.02416141, 1.659679, -0.1324561, 0, 1, 0.945098, 1,
-0.02357822, -2.668211, -1.902091, 0, 1, 0.9529412, 1,
-0.02302603, 1.007566, -1.138395, 0, 1, 0.9568627, 1,
-0.02286044, 1.177668, -0.9318, 0, 1, 0.9647059, 1,
-0.01019559, 0.0005536263, -0.7983171, 0, 1, 0.9686275, 1,
-0.01006015, -0.4874758, -1.867506, 0, 1, 0.9764706, 1,
-0.009242665, 1.197685, -1.635312, 0, 1, 0.9803922, 1,
-0.007485606, -1.836372, -3.2804, 0, 1, 0.9882353, 1,
-0.006774123, -0.5998696, -3.722537, 0, 1, 0.9921569, 1,
-0.003122068, 0.3165897, 1.315971, 0, 1, 1, 1,
-0.002098565, -1.352442, -3.313136, 0, 0.9921569, 1, 1,
-0.0005955439, 0.01445828, 0.09363522, 0, 0.9882353, 1, 1,
0.000965476, -0.5170706, 4.975049, 0, 0.9803922, 1, 1,
0.001603079, -1.19244, 4.85339, 0, 0.9764706, 1, 1,
0.003484208, -0.7771851, 0.8880783, 0, 0.9686275, 1, 1,
0.005765267, -0.1422635, 2.811458, 0, 0.9647059, 1, 1,
0.007851915, 0.8997173, 0.6895867, 0, 0.9568627, 1, 1,
0.01198699, 0.2607993, -0.4742013, 0, 0.9529412, 1, 1,
0.01209627, 1.564024, 0.3043111, 0, 0.945098, 1, 1,
0.01376448, -0.9973806, 1.560926, 0, 0.9411765, 1, 1,
0.01524452, -0.08920378, 1.770542, 0, 0.9333333, 1, 1,
0.01594578, 0.02243316, 0.3706917, 0, 0.9294118, 1, 1,
0.01762221, 0.798362, 1.03377, 0, 0.9215686, 1, 1,
0.02003992, -1.22316, 4.092994, 0, 0.9176471, 1, 1,
0.02315493, -0.4280795, 3.906967, 0, 0.9098039, 1, 1,
0.02471522, 0.08717225, 0.5371203, 0, 0.9058824, 1, 1,
0.02818106, 0.8348003, 0.01105065, 0, 0.8980392, 1, 1,
0.02894396, -0.2106106, 3.02325, 0, 0.8901961, 1, 1,
0.0328161, -0.1970299, 1.756034, 0, 0.8862745, 1, 1,
0.03407659, 1.219433, 0.3776736, 0, 0.8784314, 1, 1,
0.03548332, 0.1955072, 2.201056, 0, 0.8745098, 1, 1,
0.04077622, 0.2188975, 0.4840026, 0, 0.8666667, 1, 1,
0.04523245, -0.8462164, 3.028632, 0, 0.8627451, 1, 1,
0.04597005, -0.7319967, 2.815854, 0, 0.854902, 1, 1,
0.04898219, 0.462995, -1.086224, 0, 0.8509804, 1, 1,
0.04943534, -0.5534517, 4.354244, 0, 0.8431373, 1, 1,
0.05383012, 0.8749268, -1.554276, 0, 0.8392157, 1, 1,
0.0550975, 0.6744696, 1.176541, 0, 0.8313726, 1, 1,
0.05570175, 1.38891, -0.02182732, 0, 0.827451, 1, 1,
0.0588428, 0.4208078, -0.1738747, 0, 0.8196079, 1, 1,
0.0607289, -1.557981, 3.991574, 0, 0.8156863, 1, 1,
0.06491362, 0.964079, 1.874483, 0, 0.8078431, 1, 1,
0.06635091, 0.6228749, -1.175444, 0, 0.8039216, 1, 1,
0.06767236, 1.003485, 1.732518, 0, 0.7960784, 1, 1,
0.06981282, 1.165283, -1.651858, 0, 0.7882353, 1, 1,
0.07086826, -0.387655, 2.657348, 0, 0.7843137, 1, 1,
0.07559373, 0.8384475, 0.04850246, 0, 0.7764706, 1, 1,
0.09691761, 0.5591055, -1.936392, 0, 0.772549, 1, 1,
0.1005643, -0.6622061, 3.654498, 0, 0.7647059, 1, 1,
0.1031793, 1.088928, -0.3910248, 0, 0.7607843, 1, 1,
0.1079731, -0.8308384, 3.691244, 0, 0.7529412, 1, 1,
0.1106289, -0.7546936, 2.9202, 0, 0.7490196, 1, 1,
0.1123078, 0.5067114, -1.167221, 0, 0.7411765, 1, 1,
0.1170953, 1.821965, -0.6832535, 0, 0.7372549, 1, 1,
0.1176447, 0.2585465, 0.3316712, 0, 0.7294118, 1, 1,
0.1182907, -1.294359, 2.400695, 0, 0.7254902, 1, 1,
0.119883, -0.509798, 3.231942, 0, 0.7176471, 1, 1,
0.1212469, 0.6445121, 1.457444, 0, 0.7137255, 1, 1,
0.1243613, -0.05298764, 3.387604, 0, 0.7058824, 1, 1,
0.1249728, -0.8110459, 2.85015, 0, 0.6980392, 1, 1,
0.1250236, -0.1963751, 2.533556, 0, 0.6941177, 1, 1,
0.1291912, 0.5093817, 1.143208, 0, 0.6862745, 1, 1,
0.1293264, 1.05674, -0.1127884, 0, 0.682353, 1, 1,
0.1323546, 0.07233699, 3.250458, 0, 0.6745098, 1, 1,
0.1347501, 0.1110436, 0.2283136, 0, 0.6705883, 1, 1,
0.1467773, 0.5440173, -0.07763153, 0, 0.6627451, 1, 1,
0.1477766, -0.2233762, 2.561524, 0, 0.6588235, 1, 1,
0.1484442, -1.07615, 1.342571, 0, 0.6509804, 1, 1,
0.1500175, 0.01265202, 1.198865, 0, 0.6470588, 1, 1,
0.1517127, -0.114078, 3.438941, 0, 0.6392157, 1, 1,
0.1575347, 2.022133, -0.1687464, 0, 0.6352941, 1, 1,
0.1604353, 1.360193, -0.827996, 0, 0.627451, 1, 1,
0.1607381, 0.3759668, -0.006453258, 0, 0.6235294, 1, 1,
0.1608159, -1.059931, 2.66864, 0, 0.6156863, 1, 1,
0.1723493, -0.4992661, 1.707341, 0, 0.6117647, 1, 1,
0.1742951, -0.168152, 1.815301, 0, 0.6039216, 1, 1,
0.1778694, 0.7957404, 0.8604031, 0, 0.5960785, 1, 1,
0.1784473, 0.152206, 3.465491, 0, 0.5921569, 1, 1,
0.181961, 0.4012822, 1.165913, 0, 0.5843138, 1, 1,
0.1894955, -1.539036, 5.371269, 0, 0.5803922, 1, 1,
0.1968101, -0.280175, 3.483742, 0, 0.572549, 1, 1,
0.1969602, 0.179021, 2.274756, 0, 0.5686275, 1, 1,
0.2016956, 0.5957906, -0.7457647, 0, 0.5607843, 1, 1,
0.2033406, 1.715651, 0.03162522, 0, 0.5568628, 1, 1,
0.2035295, -0.3552073, 2.513846, 0, 0.5490196, 1, 1,
0.2035775, -1.718806, 3.287838, 0, 0.5450981, 1, 1,
0.2044914, -0.6293619, 2.082591, 0, 0.5372549, 1, 1,
0.2052339, -0.6154161, 2.435004, 0, 0.5333334, 1, 1,
0.2110134, -0.8979537, 2.212863, 0, 0.5254902, 1, 1,
0.2189042, -0.7026841, 1.613925, 0, 0.5215687, 1, 1,
0.2194802, 0.6923223, -0.5269728, 0, 0.5137255, 1, 1,
0.2207443, 0.1787231, 0.4319904, 0, 0.509804, 1, 1,
0.2210838, 0.9922536, 2.266276, 0, 0.5019608, 1, 1,
0.2213273, -1.211375, 4.222959, 0, 0.4941176, 1, 1,
0.2254232, 0.8795349, 0.9300365, 0, 0.4901961, 1, 1,
0.226696, 1.052301, 0.2542636, 0, 0.4823529, 1, 1,
0.2297621, -0.8547516, 3.441474, 0, 0.4784314, 1, 1,
0.2298916, -0.9350129, 3.067819, 0, 0.4705882, 1, 1,
0.2300185, 0.2964792, 0.2468343, 0, 0.4666667, 1, 1,
0.2305716, 0.6242968, 0.8248188, 0, 0.4588235, 1, 1,
0.2399379, 1.033692, 1.715972, 0, 0.454902, 1, 1,
0.2421118, 1.808725, -0.7153382, 0, 0.4470588, 1, 1,
0.2434267, 0.9827728, 0.6186267, 0, 0.4431373, 1, 1,
0.2448075, -0.100309, 2.556845, 0, 0.4352941, 1, 1,
0.2461621, 0.006811092, 1.377633, 0, 0.4313726, 1, 1,
0.2535111, 1.462864, 1.611979, 0, 0.4235294, 1, 1,
0.2539204, -0.4715196, 2.131701, 0, 0.4196078, 1, 1,
0.2563245, 0.5150248, 0.07242698, 0, 0.4117647, 1, 1,
0.2631018, -1.113007, 4.20699, 0, 0.4078431, 1, 1,
0.268584, 0.240605, 2.040936, 0, 0.4, 1, 1,
0.2690396, -1.731155, 3.12518, 0, 0.3921569, 1, 1,
0.2717967, -0.0776763, 0.6078506, 0, 0.3882353, 1, 1,
0.2821426, -1.854112, 1.910545, 0, 0.3803922, 1, 1,
0.2889431, 0.5445264, -0.0645474, 0, 0.3764706, 1, 1,
0.2947081, -0.6520745, 2.568299, 0, 0.3686275, 1, 1,
0.3000703, -0.5537713, 2.511848, 0, 0.3647059, 1, 1,
0.3020913, -1.553256, 4.355069, 0, 0.3568628, 1, 1,
0.3069785, -1.222059, 2.578605, 0, 0.3529412, 1, 1,
0.3179066, 0.8935252, 0.3412494, 0, 0.345098, 1, 1,
0.3180141, -0.1067128, 2.627289, 0, 0.3411765, 1, 1,
0.3221978, 0.5327024, 1.05468, 0, 0.3333333, 1, 1,
0.3232366, 0.3210238, 0.7767055, 0, 0.3294118, 1, 1,
0.3245385, -0.9665588, 3.792422, 0, 0.3215686, 1, 1,
0.3259805, 0.4010859, 0.6301989, 0, 0.3176471, 1, 1,
0.3293649, 0.8234085, 0.9705089, 0, 0.3098039, 1, 1,
0.3311898, 2.525067, -0.1510533, 0, 0.3058824, 1, 1,
0.3356366, -1.890764, 3.664716, 0, 0.2980392, 1, 1,
0.3419189, -0.06247295, 2.048499, 0, 0.2901961, 1, 1,
0.3456177, -1.169717, 3.622799, 0, 0.2862745, 1, 1,
0.3457155, 1.548501, -0.5512831, 0, 0.2784314, 1, 1,
0.3464749, 0.5159127, -0.3737728, 0, 0.2745098, 1, 1,
0.3471994, 0.5837539, 0.7497079, 0, 0.2666667, 1, 1,
0.3477148, 0.801358, 1.717183, 0, 0.2627451, 1, 1,
0.3505996, 1.677935, 0.9141028, 0, 0.254902, 1, 1,
0.3506702, 0.6000291, 1.04065, 0, 0.2509804, 1, 1,
0.3534796, 0.1499189, 0.600531, 0, 0.2431373, 1, 1,
0.3537308, -0.922911, 2.981454, 0, 0.2392157, 1, 1,
0.3601974, -1.350816, 3.372451, 0, 0.2313726, 1, 1,
0.3632788, -0.2014747, 1.026531, 0, 0.227451, 1, 1,
0.3672352, -1.672552, 0.9998016, 0, 0.2196078, 1, 1,
0.368113, -0.05276721, 2.280448, 0, 0.2156863, 1, 1,
0.3715498, -1.226187, 2.176206, 0, 0.2078431, 1, 1,
0.3732332, -1.039937, 2.803632, 0, 0.2039216, 1, 1,
0.373253, 1.106065, 0.2042478, 0, 0.1960784, 1, 1,
0.3778694, 0.4017826, -0.6888295, 0, 0.1882353, 1, 1,
0.3805237, 0.3581987, 0.2266016, 0, 0.1843137, 1, 1,
0.3822223, -0.02570849, 0.9152229, 0, 0.1764706, 1, 1,
0.3828459, -1.097534, 3.043001, 0, 0.172549, 1, 1,
0.3833262, 1.08069, 0.1203026, 0, 0.1647059, 1, 1,
0.3862284, -1.333778, 0.9764677, 0, 0.1607843, 1, 1,
0.3929928, 0.8755292, 0.09215009, 0, 0.1529412, 1, 1,
0.3980976, -0.7875482, 3.593788, 0, 0.1490196, 1, 1,
0.3999602, -0.3239833, 1.850904, 0, 0.1411765, 1, 1,
0.4062974, 0.5577925, 0.5987152, 0, 0.1372549, 1, 1,
0.4084127, -0.2946356, 0.8027087, 0, 0.1294118, 1, 1,
0.410415, -0.09668846, 2.510563, 0, 0.1254902, 1, 1,
0.4203717, -0.8854283, 2.481842, 0, 0.1176471, 1, 1,
0.4211042, 1.197196, 1.153823, 0, 0.1137255, 1, 1,
0.4226649, 0.3625516, 0.5672575, 0, 0.1058824, 1, 1,
0.4260726, 0.578222, 1.64615, 0, 0.09803922, 1, 1,
0.4347803, -1.611772, 2.232809, 0, 0.09411765, 1, 1,
0.4357512, -0.2249346, 0.5946621, 0, 0.08627451, 1, 1,
0.4376407, 1.572045, 2.166664, 0, 0.08235294, 1, 1,
0.4417742, 1.006707, 1.6535, 0, 0.07450981, 1, 1,
0.4458967, -2.16181, 2.256789, 0, 0.07058824, 1, 1,
0.453902, -0.7950507, 1.65434, 0, 0.0627451, 1, 1,
0.4570255, 0.5934545, -0.6923203, 0, 0.05882353, 1, 1,
0.4588958, 1.029006, 0.2657204, 0, 0.05098039, 1, 1,
0.4619364, 1.262656, -0.1239282, 0, 0.04705882, 1, 1,
0.4632724, -0.1742388, 3.647707, 0, 0.03921569, 1, 1,
0.4633915, -0.346698, 1.898548, 0, 0.03529412, 1, 1,
0.4647851, -0.2663094, 1.931308, 0, 0.02745098, 1, 1,
0.4651666, -0.08367515, 2.336916, 0, 0.02352941, 1, 1,
0.4664552, 1.034507, -0.6769338, 0, 0.01568628, 1, 1,
0.4666725, -0.5487474, 3.016592, 0, 0.01176471, 1, 1,
0.474046, 1.085984, 2.702749, 0, 0.003921569, 1, 1,
0.4741458, 0.1435153, 1.639282, 0.003921569, 0, 1, 1,
0.4769663, -0.05671154, 0.08675402, 0.007843138, 0, 1, 1,
0.4777444, -0.1659313, 1.880673, 0.01568628, 0, 1, 1,
0.4790814, -1.769688, 2.899984, 0.01960784, 0, 1, 1,
0.4806782, -1.372584, 2.451238, 0.02745098, 0, 1, 1,
0.4809712, 0.02642953, 2.527093, 0.03137255, 0, 1, 1,
0.4825587, -0.7790993, 4.62218, 0.03921569, 0, 1, 1,
0.4878123, -0.9121177, 3.162503, 0.04313726, 0, 1, 1,
0.4948768, -1.833991, 3.965059, 0.05098039, 0, 1, 1,
0.4959534, 0.7526231, 0.7251531, 0.05490196, 0, 1, 1,
0.4962403, -0.3938878, 2.869435, 0.0627451, 0, 1, 1,
0.5014828, 0.4839964, -0.1879804, 0.06666667, 0, 1, 1,
0.503001, 1.2137, 1.230724, 0.07450981, 0, 1, 1,
0.5030692, 0.2187653, 0.8790079, 0.07843138, 0, 1, 1,
0.5031739, 1.201619, 1.654581, 0.08627451, 0, 1, 1,
0.5064006, 0.6194032, 0.9081686, 0.09019608, 0, 1, 1,
0.5080412, -1.109821, 1.93971, 0.09803922, 0, 1, 1,
0.5138587, -1.173573, 3.276437, 0.1058824, 0, 1, 1,
0.516308, 1.436439, -1.386136, 0.1098039, 0, 1, 1,
0.5174109, 0.02995361, 1.177377, 0.1176471, 0, 1, 1,
0.5243939, 0.05224464, 1.996355, 0.1215686, 0, 1, 1,
0.5244606, 0.7025197, 1.665975, 0.1294118, 0, 1, 1,
0.5338523, 0.816547, 0.7279202, 0.1333333, 0, 1, 1,
0.5345542, 2.316257, 0.1726291, 0.1411765, 0, 1, 1,
0.534591, 0.1793969, -0.2320324, 0.145098, 0, 1, 1,
0.5348638, 1.779466, -0.1808753, 0.1529412, 0, 1, 1,
0.5359295, -0.4782831, 1.4158, 0.1568628, 0, 1, 1,
0.5373544, -0.9377462, 2.51656, 0.1647059, 0, 1, 1,
0.537835, 0.07573739, 0.5681269, 0.1686275, 0, 1, 1,
0.5397022, 0.1281412, 2.678693, 0.1764706, 0, 1, 1,
0.5410742, 0.7987754, 2.531841, 0.1803922, 0, 1, 1,
0.5436661, 1.291362, 0.7632819, 0.1882353, 0, 1, 1,
0.5448732, 0.1954126, 3.076482, 0.1921569, 0, 1, 1,
0.5451221, 1.247108, -1.340148, 0.2, 0, 1, 1,
0.5478816, -0.8839017, 3.099499, 0.2078431, 0, 1, 1,
0.5480857, -0.5720789, 2.167403, 0.2117647, 0, 1, 1,
0.5487773, 0.4630637, 1.046193, 0.2196078, 0, 1, 1,
0.5522771, -1.464406, 0.5731795, 0.2235294, 0, 1, 1,
0.5523713, -0.7787471, 3.402654, 0.2313726, 0, 1, 1,
0.5538363, -0.7928968, 1.434101, 0.2352941, 0, 1, 1,
0.5561246, 0.6420213, -1.322752, 0.2431373, 0, 1, 1,
0.5603472, -1.492984, 2.189778, 0.2470588, 0, 1, 1,
0.56331, 2.026613, -0.2235477, 0.254902, 0, 1, 1,
0.5658551, -0.09156051, 2.244965, 0.2588235, 0, 1, 1,
0.5666232, -0.3360502, 2.429945, 0.2666667, 0, 1, 1,
0.5784649, -1.364788, 1.907672, 0.2705882, 0, 1, 1,
0.5829076, -0.6798503, 1.182771, 0.2784314, 0, 1, 1,
0.58351, 1.180534, -0.2275825, 0.282353, 0, 1, 1,
0.5912831, 1.048846, 0.1429905, 0.2901961, 0, 1, 1,
0.5947062, -0.4177969, 1.19103, 0.2941177, 0, 1, 1,
0.6014935, 0.8115906, 0.8615491, 0.3019608, 0, 1, 1,
0.6027005, 0.2053104, 1.129106, 0.3098039, 0, 1, 1,
0.603546, 0.9903752, 1.393863, 0.3137255, 0, 1, 1,
0.6083983, 2.235399, -0.850354, 0.3215686, 0, 1, 1,
0.6102011, -0.3777067, 2.177509, 0.3254902, 0, 1, 1,
0.6120986, 1.522702, 0.5132003, 0.3333333, 0, 1, 1,
0.6132312, -0.5764023, 2.594288, 0.3372549, 0, 1, 1,
0.6148934, -0.8809311, -0.07821246, 0.345098, 0, 1, 1,
0.6185207, -0.2433639, 3.846278, 0.3490196, 0, 1, 1,
0.6206679, 1.052219, 0.2627152, 0.3568628, 0, 1, 1,
0.622588, 1.867119, 0.1829547, 0.3607843, 0, 1, 1,
0.6229418, -1.251215, 2.403336, 0.3686275, 0, 1, 1,
0.6256353, 0.8418353, -0.4026869, 0.372549, 0, 1, 1,
0.6307289, 0.09188212, 1.263563, 0.3803922, 0, 1, 1,
0.6311942, -0.4167192, -0.3030641, 0.3843137, 0, 1, 1,
0.6334346, 0.2170029, 1.589472, 0.3921569, 0, 1, 1,
0.6392259, 0.8272023, 3.197104, 0.3960784, 0, 1, 1,
0.6401206, -0.07021653, 1.152032, 0.4039216, 0, 1, 1,
0.6425999, 0.5708421, 1.549772, 0.4117647, 0, 1, 1,
0.644339, 0.1948988, 0.3545268, 0.4156863, 0, 1, 1,
0.6448405, 0.8367702, 1.565177, 0.4235294, 0, 1, 1,
0.6470824, 2.695632, 0.4546655, 0.427451, 0, 1, 1,
0.651832, 0.1484099, 1.389279, 0.4352941, 0, 1, 1,
0.6518808, -0.120016, 2.834558, 0.4392157, 0, 1, 1,
0.6558214, -2.368381, 1.986159, 0.4470588, 0, 1, 1,
0.6563665, -1.719497, 3.524223, 0.4509804, 0, 1, 1,
0.6576208, 0.1505389, -0.6167091, 0.4588235, 0, 1, 1,
0.6643032, 0.2759803, 0.3055352, 0.4627451, 0, 1, 1,
0.6670483, 0.380318, 0.09670226, 0.4705882, 0, 1, 1,
0.6675186, -0.07346899, 2.578769, 0.4745098, 0, 1, 1,
0.6714838, -0.3455351, 2.361168, 0.4823529, 0, 1, 1,
0.672249, 0.5455257, -0.1624395, 0.4862745, 0, 1, 1,
0.6745857, -0.8851764, 3.461784, 0.4941176, 0, 1, 1,
0.6794556, 0.6387272, 0.4442562, 0.5019608, 0, 1, 1,
0.6807809, -0.3748651, 2.659608, 0.5058824, 0, 1, 1,
0.6842073, 0.2966547, 0.4772384, 0.5137255, 0, 1, 1,
0.6852328, -1.567708, 0.67157, 0.5176471, 0, 1, 1,
0.6895497, -0.8864348, 3.26653, 0.5254902, 0, 1, 1,
0.6914849, 1.551246, 1.144538, 0.5294118, 0, 1, 1,
0.6936214, -1.732118, 2.608604, 0.5372549, 0, 1, 1,
0.6951638, 0.7537326, -0.0915079, 0.5411765, 0, 1, 1,
0.6967455, 0.4380567, 1.099029, 0.5490196, 0, 1, 1,
0.698964, -0.552316, 0.3837453, 0.5529412, 0, 1, 1,
0.7003204, -0.8508752, 4.326079, 0.5607843, 0, 1, 1,
0.7050433, -1.053231, 3.122371, 0.5647059, 0, 1, 1,
0.7095495, 1.909001, -0.697049, 0.572549, 0, 1, 1,
0.7104178, -1.194521, 2.838845, 0.5764706, 0, 1, 1,
0.7109023, -1.496921, 1.052167, 0.5843138, 0, 1, 1,
0.7147838, 1.757149, 1.221399, 0.5882353, 0, 1, 1,
0.7193796, -0.9014181, 1.306166, 0.5960785, 0, 1, 1,
0.7288003, 1.10568, -0.4253929, 0.6039216, 0, 1, 1,
0.7334861, -0.4257946, 2.655721, 0.6078432, 0, 1, 1,
0.7344267, 0.971532, 1.281071, 0.6156863, 0, 1, 1,
0.7369502, 0.6488068, 1.309001, 0.6196079, 0, 1, 1,
0.7373924, -0.730002, 4.531696, 0.627451, 0, 1, 1,
0.7439341, -0.8493203, 0.1726276, 0.6313726, 0, 1, 1,
0.7442099, 0.9604256, 0.5861543, 0.6392157, 0, 1, 1,
0.7457788, 1.821388, 0.4719656, 0.6431373, 0, 1, 1,
0.7470288, -0.9121885, 3.344146, 0.6509804, 0, 1, 1,
0.7484251, -1.693539, 3.417603, 0.654902, 0, 1, 1,
0.7486935, 0.1835861, 1.045076, 0.6627451, 0, 1, 1,
0.7661607, -0.01416903, 2.15308, 0.6666667, 0, 1, 1,
0.7665517, 2.613158, -0.307281, 0.6745098, 0, 1, 1,
0.7752779, 1.394595, 0.7125744, 0.6784314, 0, 1, 1,
0.7772678, 0.2853053, 1.584396, 0.6862745, 0, 1, 1,
0.7869284, -1.078302, 3.852212, 0.6901961, 0, 1, 1,
0.7879975, 0.4698142, -0.2095128, 0.6980392, 0, 1, 1,
0.7892612, -1.133159, 2.921298, 0.7058824, 0, 1, 1,
0.7966346, 3.183687, 0.5379409, 0.7098039, 0, 1, 1,
0.7972299, 0.7366505, 0.4892044, 0.7176471, 0, 1, 1,
0.8227253, -0.9103788, 2.076773, 0.7215686, 0, 1, 1,
0.8231759, 1.979748, -1.100824, 0.7294118, 0, 1, 1,
0.8249832, 1.085556, 0.7322932, 0.7333333, 0, 1, 1,
0.8254405, -0.2722772, 2.341002, 0.7411765, 0, 1, 1,
0.8276591, 0.1308861, 0.684282, 0.7450981, 0, 1, 1,
0.8448848, 0.3998775, 1.578263, 0.7529412, 0, 1, 1,
0.8453463, -0.4083976, 1.987208, 0.7568628, 0, 1, 1,
0.8479077, -0.02492774, 2.164477, 0.7647059, 0, 1, 1,
0.856923, 0.4820389, 0.6806641, 0.7686275, 0, 1, 1,
0.8620678, 1.689082, 0.8165476, 0.7764706, 0, 1, 1,
0.8664681, 0.0862224, 0.7007574, 0.7803922, 0, 1, 1,
0.8696085, 0.955622, 0.2297407, 0.7882353, 0, 1, 1,
0.8710142, -0.5059952, 1.197781, 0.7921569, 0, 1, 1,
0.8725826, -1.233449, 2.458838, 0.8, 0, 1, 1,
0.8733045, -0.287556, 1.117919, 0.8078431, 0, 1, 1,
0.8818816, -1.047289, 2.595925, 0.8117647, 0, 1, 1,
0.8828751, -0.2023387, -0.2855785, 0.8196079, 0, 1, 1,
0.88732, 0.007560507, 0.1584906, 0.8235294, 0, 1, 1,
0.8895136, 0.3215324, 2.134956, 0.8313726, 0, 1, 1,
0.8931999, -0.3882907, 1.504735, 0.8352941, 0, 1, 1,
0.8953655, 1.632532, 0.3694643, 0.8431373, 0, 1, 1,
0.8958037, 1.186997, 0.5656176, 0.8470588, 0, 1, 1,
0.8961334, 0.965702, -0.7652606, 0.854902, 0, 1, 1,
0.8998769, -1.448622, 1.737441, 0.8588235, 0, 1, 1,
0.9009976, 2.418487, 0.2979605, 0.8666667, 0, 1, 1,
0.906323, 0.6428551, 0.7452455, 0.8705882, 0, 1, 1,
0.913161, 0.07023142, 0.5723386, 0.8784314, 0, 1, 1,
0.9148118, 1.28503, 2.671949, 0.8823529, 0, 1, 1,
0.9155756, -0.660571, 2.708581, 0.8901961, 0, 1, 1,
0.9189661, -0.4855582, 2.732992, 0.8941177, 0, 1, 1,
0.9268401, -1.884634, 2.376569, 0.9019608, 0, 1, 1,
0.9291584, 1.120758, -0.8724091, 0.9098039, 0, 1, 1,
0.9299837, 0.07400332, 1.785203, 0.9137255, 0, 1, 1,
0.933877, -1.557128, 2.600975, 0.9215686, 0, 1, 1,
0.9397408, 0.191044, 1.971634, 0.9254902, 0, 1, 1,
0.9445814, 0.2444975, 1.199454, 0.9333333, 0, 1, 1,
0.9474435, -1.404536, 2.576694, 0.9372549, 0, 1, 1,
0.9610626, 0.1130623, 0.5477815, 0.945098, 0, 1, 1,
0.9615185, 0.8882213, 0.4124438, 0.9490196, 0, 1, 1,
0.9628064, -0.4139386, 1.2022, 0.9568627, 0, 1, 1,
0.963983, 1.764426, -0.978808, 0.9607843, 0, 1, 1,
0.9641819, -0.1186779, 3.174304, 0.9686275, 0, 1, 1,
0.9667689, 0.6596803, 0.7328166, 0.972549, 0, 1, 1,
0.9716159, 0.4447178, -0.03444918, 0.9803922, 0, 1, 1,
0.9724731, 0.3317517, 2.184933, 0.9843137, 0, 1, 1,
0.9753766, 1.186242, 0.5607781, 0.9921569, 0, 1, 1,
0.9766399, 0.3808258, 1.797664, 0.9960784, 0, 1, 1,
0.9773683, -1.745494, 3.375108, 1, 0, 0.9960784, 1,
0.9872603, -1.448986, 1.38264, 1, 0, 0.9882353, 1,
0.9893494, -1.241608, 1.825156, 1, 0, 0.9843137, 1,
1.004293, 0.5590167, 1.164665, 1, 0, 0.9764706, 1,
1.008245, -1.357383, 0.7602687, 1, 0, 0.972549, 1,
1.009961, -1.105501, 2.231986, 1, 0, 0.9647059, 1,
1.01163, 1.454803, -0.4069652, 1, 0, 0.9607843, 1,
1.026913, 0.4009628, 1.564093, 1, 0, 0.9529412, 1,
1.028083, 0.0028925, 3.101563, 1, 0, 0.9490196, 1,
1.038093, 1.560538, 2.142992, 1, 0, 0.9411765, 1,
1.048842, 0.04265982, 2.877438, 1, 0, 0.9372549, 1,
1.05463, 0.2069337, 2.248366, 1, 0, 0.9294118, 1,
1.060101, 1.135684, 1.618949, 1, 0, 0.9254902, 1,
1.062328, -0.5495725, 2.29778, 1, 0, 0.9176471, 1,
1.064021, 0.9609577, 0.1786908, 1, 0, 0.9137255, 1,
1.070017, -0.0297395, 1.50507, 1, 0, 0.9058824, 1,
1.071047, -0.2489409, 2.004357, 1, 0, 0.9019608, 1,
1.072129, 0.2941753, 1.473629, 1, 0, 0.8941177, 1,
1.072656, -0.1760585, 1.487636, 1, 0, 0.8862745, 1,
1.090105, -2.990676, 3.086036, 1, 0, 0.8823529, 1,
1.099928, -0.3584799, 2.247525, 1, 0, 0.8745098, 1,
1.104721, -1.270812, 1.385358, 1, 0, 0.8705882, 1,
1.105451, 0.6411961, -0.9893224, 1, 0, 0.8627451, 1,
1.108661, -0.07191351, 1.366263, 1, 0, 0.8588235, 1,
1.130644, 1.879452, 1.567723, 1, 0, 0.8509804, 1,
1.135008, 0.4776711, 3.190196, 1, 0, 0.8470588, 1,
1.144692, 0.2979952, 1.712521, 1, 0, 0.8392157, 1,
1.146398, -1.597637, 1.658203, 1, 0, 0.8352941, 1,
1.14676, -1.02694, 2.024889, 1, 0, 0.827451, 1,
1.153533, 0.9723756, 1.725892, 1, 0, 0.8235294, 1,
1.163332, -0.209858, 1.143509, 1, 0, 0.8156863, 1,
1.168354, 0.7110231, 1.801835, 1, 0, 0.8117647, 1,
1.168656, 0.9489582, -0.7178479, 1, 0, 0.8039216, 1,
1.174397, 1.139407, -0.2319131, 1, 0, 0.7960784, 1,
1.174981, -0.1096835, 2.610768, 1, 0, 0.7921569, 1,
1.180505, 1.08481, 1.208315, 1, 0, 0.7843137, 1,
1.183842, 0.5821645, 1.676312, 1, 0, 0.7803922, 1,
1.185454, -1.13953, 1.630029, 1, 0, 0.772549, 1,
1.186576, -0.7273123, 1.670673, 1, 0, 0.7686275, 1,
1.186894, -2.161396, 3.43343, 1, 0, 0.7607843, 1,
1.188258, -0.1052704, 2.313254, 1, 0, 0.7568628, 1,
1.189296, -0.9049712, 1.665785, 1, 0, 0.7490196, 1,
1.200949, 0.3992824, 0.8628551, 1, 0, 0.7450981, 1,
1.201961, 0.6574435, 1.2827, 1, 0, 0.7372549, 1,
1.202659, -0.4647723, 0.7310174, 1, 0, 0.7333333, 1,
1.204694, 0.5068737, 0.5614331, 1, 0, 0.7254902, 1,
1.20505, -0.1139578, 2.693018, 1, 0, 0.7215686, 1,
1.210963, -2.866388, 2.108082, 1, 0, 0.7137255, 1,
1.213685, 0.2184391, 2.330178, 1, 0, 0.7098039, 1,
1.213842, 0.03831582, 1.489837, 1, 0, 0.7019608, 1,
1.214226, 1.00294, 2.128832, 1, 0, 0.6941177, 1,
1.21826, -0.2144603, 2.058195, 1, 0, 0.6901961, 1,
1.223525, 0.4180263, 0.06940416, 1, 0, 0.682353, 1,
1.227456, 0.2212455, 0.7692852, 1, 0, 0.6784314, 1,
1.22751, 0.4420778, 0.8302187, 1, 0, 0.6705883, 1,
1.229154, 0.258755, 2.72542, 1, 0, 0.6666667, 1,
1.232072, 1.118896, 0.3047432, 1, 0, 0.6588235, 1,
1.241594, -1.46037, 3.721992, 1, 0, 0.654902, 1,
1.25089, 0.3417729, 1.18227, 1, 0, 0.6470588, 1,
1.258104, -2.033612, 2.995694, 1, 0, 0.6431373, 1,
1.277888, -0.5640074, 1.805489, 1, 0, 0.6352941, 1,
1.296965, -1.389181, 2.80828, 1, 0, 0.6313726, 1,
1.301183, 2.624054, -0.4577154, 1, 0, 0.6235294, 1,
1.306824, 0.3208513, 0.68643, 1, 0, 0.6196079, 1,
1.308349, 0.4320809, 0.3557255, 1, 0, 0.6117647, 1,
1.313967, -1.498824, 1.500986, 1, 0, 0.6078432, 1,
1.318543, 0.1390837, 1.871194, 1, 0, 0.6, 1,
1.319274, 1.569715, 1.178915, 1, 0, 0.5921569, 1,
1.327345, 1.883105, -0.7317664, 1, 0, 0.5882353, 1,
1.32771, -0.3211316, 0.944307, 1, 0, 0.5803922, 1,
1.344433, -0.4927313, 2.184565, 1, 0, 0.5764706, 1,
1.35564, 0.7018638, -0.0003993304, 1, 0, 0.5686275, 1,
1.35869, -0.01883117, 1.378348, 1, 0, 0.5647059, 1,
1.358822, 0.03273708, 2.8463, 1, 0, 0.5568628, 1,
1.362244, -1.435418, 1.243822, 1, 0, 0.5529412, 1,
1.362811, 0.0576314, 1.154731, 1, 0, 0.5450981, 1,
1.37443, 0.2338504, 2.299726, 1, 0, 0.5411765, 1,
1.378716, -0.5553428, -0.04355952, 1, 0, 0.5333334, 1,
1.388684, 0.9630654, 1.74321, 1, 0, 0.5294118, 1,
1.392443, -1.478742, 1.810529, 1, 0, 0.5215687, 1,
1.398018, -0.0807116, 1.613386, 1, 0, 0.5176471, 1,
1.403457, -1.378833, 3.336976, 1, 0, 0.509804, 1,
1.421276, -0.8978844, 0.6404026, 1, 0, 0.5058824, 1,
1.442703, 0.1093802, 2.214138, 1, 0, 0.4980392, 1,
1.453954, 0.1047279, 0.3736551, 1, 0, 0.4901961, 1,
1.457207, 1.543544, 1.105398, 1, 0, 0.4862745, 1,
1.458727, -1.006722, 1.057641, 1, 0, 0.4784314, 1,
1.460451, 0.2622084, 0.7455895, 1, 0, 0.4745098, 1,
1.464477, -0.1217999, 1.289241, 1, 0, 0.4666667, 1,
1.470123, 1.391651, 0.6721153, 1, 0, 0.4627451, 1,
1.472297, 0.7401003, 0.3634611, 1, 0, 0.454902, 1,
1.476482, -0.7996597, 2.250034, 1, 0, 0.4509804, 1,
1.485057, -0.7172549, 1.287638, 1, 0, 0.4431373, 1,
1.490003, -1.044289, 3.008626, 1, 0, 0.4392157, 1,
1.490022, 0.02231067, 1.423398, 1, 0, 0.4313726, 1,
1.496221, 0.2618793, 0.258118, 1, 0, 0.427451, 1,
1.500967, -0.3414589, 2.523596, 1, 0, 0.4196078, 1,
1.504546, -0.0418689, 0.9829162, 1, 0, 0.4156863, 1,
1.504617, 1.250792, 2.888618, 1, 0, 0.4078431, 1,
1.510811, -2.087853, 2.345623, 1, 0, 0.4039216, 1,
1.511775, 0.08037036, -0.1708402, 1, 0, 0.3960784, 1,
1.514223, -0.3792981, 1.240249, 1, 0, 0.3882353, 1,
1.514468, -2.355253, 2.46435, 1, 0, 0.3843137, 1,
1.515037, -0.1092293, 2.256443, 1, 0, 0.3764706, 1,
1.516844, 0.6133401, 1.428768, 1, 0, 0.372549, 1,
1.517042, -0.4299923, 1.072574, 1, 0, 0.3647059, 1,
1.5206, 0.5021576, 1.673554, 1, 0, 0.3607843, 1,
1.529153, -1.839942, 1.967069, 1, 0, 0.3529412, 1,
1.535536, -0.5617214, 2.750441, 1, 0, 0.3490196, 1,
1.557662, -0.4648649, 1.557098, 1, 0, 0.3411765, 1,
1.562449, -0.1823679, 1.014168, 1, 0, 0.3372549, 1,
1.567269, -0.3653256, 2.210138, 1, 0, 0.3294118, 1,
1.587198, -0.09337971, 1.364157, 1, 0, 0.3254902, 1,
1.594831, -0.6603909, 1.436679, 1, 0, 0.3176471, 1,
1.600864, 0.009933813, 1.951765, 1, 0, 0.3137255, 1,
1.606909, -0.6822183, 0.4999003, 1, 0, 0.3058824, 1,
1.622755, -0.290156, 1.720018, 1, 0, 0.2980392, 1,
1.628226, 0.1989798, 1.633026, 1, 0, 0.2941177, 1,
1.65814, -1.259528, 3.414078, 1, 0, 0.2862745, 1,
1.663509, 0.01748884, 0.7617512, 1, 0, 0.282353, 1,
1.669443, -0.7340277, 3.081422, 1, 0, 0.2745098, 1,
1.6914, 0.8253627, 0.2887843, 1, 0, 0.2705882, 1,
1.70822, -1.02378, 1.381181, 1, 0, 0.2627451, 1,
1.710418, -0.4525901, 1.686402, 1, 0, 0.2588235, 1,
1.719581, 0.5269665, 2.108843, 1, 0, 0.2509804, 1,
1.737377, 0.1340864, 2.506106, 1, 0, 0.2470588, 1,
1.750169, 0.8054063, 0.487613, 1, 0, 0.2392157, 1,
1.757241, -2.093915, 2.79276, 1, 0, 0.2352941, 1,
1.772911, 0.07317524, 2.012506, 1, 0, 0.227451, 1,
1.774082, -2.307875, 3.154068, 1, 0, 0.2235294, 1,
1.778935, -0.1791195, 3.347554, 1, 0, 0.2156863, 1,
1.803789, -0.9414666, 1.108185, 1, 0, 0.2117647, 1,
1.807797, -0.5687296, -0.6289382, 1, 0, 0.2039216, 1,
1.81692, -1.646108, 5.558537, 1, 0, 0.1960784, 1,
1.834749, -2.334916, 2.495697, 1, 0, 0.1921569, 1,
1.851136, -0.2305433, 2.691376, 1, 0, 0.1843137, 1,
1.86541, 2.07474, 0.5819399, 1, 0, 0.1803922, 1,
1.872554, 0.2617283, 0.3634715, 1, 0, 0.172549, 1,
1.876602, -0.1044876, 0.8438499, 1, 0, 0.1686275, 1,
1.877822, -0.7090693, 1.690133, 1, 0, 0.1607843, 1,
1.909354, -0.1381425, 0.3190693, 1, 0, 0.1568628, 1,
1.920342, 0.2493043, 0.5677443, 1, 0, 0.1490196, 1,
1.928446, -0.1428238, 4.172459, 1, 0, 0.145098, 1,
1.965626, 0.4281759, 0.6807359, 1, 0, 0.1372549, 1,
1.986632, 0.3161544, 1.245712, 1, 0, 0.1333333, 1,
2.017748, -1.138413, 1.733049, 1, 0, 0.1254902, 1,
2.059454, 0.1659446, -0.4879122, 1, 0, 0.1215686, 1,
2.105344, 0.05705146, 1.015881, 1, 0, 0.1137255, 1,
2.119619, -0.4116088, 0.1999009, 1, 0, 0.1098039, 1,
2.156275, 0.2767993, 1.49287, 1, 0, 0.1019608, 1,
2.237115, -0.4313408, 0.6650963, 1, 0, 0.09411765, 1,
2.326992, 1.737939, 0.5672243, 1, 0, 0.09019608, 1,
2.362767, -0.5480606, 2.689471, 1, 0, 0.08235294, 1,
2.402963, -0.4135691, 2.475911, 1, 0, 0.07843138, 1,
2.422652, 1.156622, 1.881169, 1, 0, 0.07058824, 1,
2.452798, 0.4340844, 0.9351583, 1, 0, 0.06666667, 1,
2.508839, -0.2323629, 0.4213332, 1, 0, 0.05882353, 1,
2.601009, 0.9937677, 0.3114192, 1, 0, 0.05490196, 1,
2.621257, 1.458916, 1.386187, 1, 0, 0.04705882, 1,
2.628002, 0.01870614, 1.056616, 1, 0, 0.04313726, 1,
2.632922, 0.9107386, 1.033062, 1, 0, 0.03529412, 1,
2.690631, -0.9854153, 2.639142, 1, 0, 0.03137255, 1,
2.739915, 0.7100133, 3.495527, 1, 0, 0.02352941, 1,
2.77949, 1.170032, 1.807095, 1, 0, 0.01960784, 1,
3.141518, 0.7862749, 1.737016, 1, 0, 0.01176471, 1,
3.404484, 1.441424, -0.9318873, 1, 0, 0.007843138, 1
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
0.1465778, -4.03723, -7.671404, 0, -0.5, 0.5, 0.5,
0.1465778, -4.03723, -7.671404, 1, -0.5, 0.5, 0.5,
0.1465778, -4.03723, -7.671404, 1, 1.5, 0.5, 0.5,
0.1465778, -4.03723, -7.671404, 0, 1.5, 0.5, 0.5
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
-4.215758, 0.09650576, -7.671404, 0, -0.5, 0.5, 0.5,
-4.215758, 0.09650576, -7.671404, 1, -0.5, 0.5, 0.5,
-4.215758, 0.09650576, -7.671404, 1, 1.5, 0.5, 0.5,
-4.215758, 0.09650576, -7.671404, 0, 1.5, 0.5, 0.5
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
-4.215758, -4.03723, -0.09770131, 0, -0.5, 0.5, 0.5,
-4.215758, -4.03723, -0.09770131, 1, -0.5, 0.5, 0.5,
-4.215758, -4.03723, -0.09770131, 1, 1.5, 0.5, 0.5,
-4.215758, -4.03723, -0.09770131, 0, 1.5, 0.5, 0.5
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
-3, -3.083291, -5.923626,
3, -3.083291, -5.923626,
-3, -3.083291, -5.923626,
-3, -3.242281, -6.214922,
-2, -3.083291, -5.923626,
-2, -3.242281, -6.214922,
-1, -3.083291, -5.923626,
-1, -3.242281, -6.214922,
0, -3.083291, -5.923626,
0, -3.242281, -6.214922,
1, -3.083291, -5.923626,
1, -3.242281, -6.214922,
2, -3.083291, -5.923626,
2, -3.242281, -6.214922,
3, -3.083291, -5.923626,
3, -3.242281, -6.214922
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
-3, -3.560261, -6.797515, 0, -0.5, 0.5, 0.5,
-3, -3.560261, -6.797515, 1, -0.5, 0.5, 0.5,
-3, -3.560261, -6.797515, 1, 1.5, 0.5, 0.5,
-3, -3.560261, -6.797515, 0, 1.5, 0.5, 0.5,
-2, -3.560261, -6.797515, 0, -0.5, 0.5, 0.5,
-2, -3.560261, -6.797515, 1, -0.5, 0.5, 0.5,
-2, -3.560261, -6.797515, 1, 1.5, 0.5, 0.5,
-2, -3.560261, -6.797515, 0, 1.5, 0.5, 0.5,
-1, -3.560261, -6.797515, 0, -0.5, 0.5, 0.5,
-1, -3.560261, -6.797515, 1, -0.5, 0.5, 0.5,
-1, -3.560261, -6.797515, 1, 1.5, 0.5, 0.5,
-1, -3.560261, -6.797515, 0, 1.5, 0.5, 0.5,
0, -3.560261, -6.797515, 0, -0.5, 0.5, 0.5,
0, -3.560261, -6.797515, 1, -0.5, 0.5, 0.5,
0, -3.560261, -6.797515, 1, 1.5, 0.5, 0.5,
0, -3.560261, -6.797515, 0, 1.5, 0.5, 0.5,
1, -3.560261, -6.797515, 0, -0.5, 0.5, 0.5,
1, -3.560261, -6.797515, 1, -0.5, 0.5, 0.5,
1, -3.560261, -6.797515, 1, 1.5, 0.5, 0.5,
1, -3.560261, -6.797515, 0, 1.5, 0.5, 0.5,
2, -3.560261, -6.797515, 0, -0.5, 0.5, 0.5,
2, -3.560261, -6.797515, 1, -0.5, 0.5, 0.5,
2, -3.560261, -6.797515, 1, 1.5, 0.5, 0.5,
2, -3.560261, -6.797515, 0, 1.5, 0.5, 0.5,
3, -3.560261, -6.797515, 0, -0.5, 0.5, 0.5,
3, -3.560261, -6.797515, 1, -0.5, 0.5, 0.5,
3, -3.560261, -6.797515, 1, 1.5, 0.5, 0.5,
3, -3.560261, -6.797515, 0, 1.5, 0.5, 0.5
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
-3.209065, -2, -5.923626,
-3.209065, 3, -5.923626,
-3.209065, -2, -5.923626,
-3.376847, -2, -6.214922,
-3.209065, -1, -5.923626,
-3.376847, -1, -6.214922,
-3.209065, 0, -5.923626,
-3.376847, 0, -6.214922,
-3.209065, 1, -5.923626,
-3.376847, 1, -6.214922,
-3.209065, 2, -5.923626,
-3.376847, 2, -6.214922,
-3.209065, 3, -5.923626,
-3.376847, 3, -6.214922
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
-3.712411, -2, -6.797515, 0, -0.5, 0.5, 0.5,
-3.712411, -2, -6.797515, 1, -0.5, 0.5, 0.5,
-3.712411, -2, -6.797515, 1, 1.5, 0.5, 0.5,
-3.712411, -2, -6.797515, 0, 1.5, 0.5, 0.5,
-3.712411, -1, -6.797515, 0, -0.5, 0.5, 0.5,
-3.712411, -1, -6.797515, 1, -0.5, 0.5, 0.5,
-3.712411, -1, -6.797515, 1, 1.5, 0.5, 0.5,
-3.712411, -1, -6.797515, 0, 1.5, 0.5, 0.5,
-3.712411, 0, -6.797515, 0, -0.5, 0.5, 0.5,
-3.712411, 0, -6.797515, 1, -0.5, 0.5, 0.5,
-3.712411, 0, -6.797515, 1, 1.5, 0.5, 0.5,
-3.712411, 0, -6.797515, 0, 1.5, 0.5, 0.5,
-3.712411, 1, -6.797515, 0, -0.5, 0.5, 0.5,
-3.712411, 1, -6.797515, 1, -0.5, 0.5, 0.5,
-3.712411, 1, -6.797515, 1, 1.5, 0.5, 0.5,
-3.712411, 1, -6.797515, 0, 1.5, 0.5, 0.5,
-3.712411, 2, -6.797515, 0, -0.5, 0.5, 0.5,
-3.712411, 2, -6.797515, 1, -0.5, 0.5, 0.5,
-3.712411, 2, -6.797515, 1, 1.5, 0.5, 0.5,
-3.712411, 2, -6.797515, 0, 1.5, 0.5, 0.5,
-3.712411, 3, -6.797515, 0, -0.5, 0.5, 0.5,
-3.712411, 3, -6.797515, 1, -0.5, 0.5, 0.5,
-3.712411, 3, -6.797515, 1, 1.5, 0.5, 0.5,
-3.712411, 3, -6.797515, 0, 1.5, 0.5, 0.5
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
-3.209065, -3.083291, -4,
-3.209065, -3.083291, 4,
-3.209065, -3.083291, -4,
-3.376847, -3.242281, -4,
-3.209065, -3.083291, -2,
-3.376847, -3.242281, -2,
-3.209065, -3.083291, 0,
-3.376847, -3.242281, 0,
-3.209065, -3.083291, 2,
-3.376847, -3.242281, 2,
-3.209065, -3.083291, 4,
-3.376847, -3.242281, 4
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
-3.712411, -3.560261, -4, 0, -0.5, 0.5, 0.5,
-3.712411, -3.560261, -4, 1, -0.5, 0.5, 0.5,
-3.712411, -3.560261, -4, 1, 1.5, 0.5, 0.5,
-3.712411, -3.560261, -4, 0, 1.5, 0.5, 0.5,
-3.712411, -3.560261, -2, 0, -0.5, 0.5, 0.5,
-3.712411, -3.560261, -2, 1, -0.5, 0.5, 0.5,
-3.712411, -3.560261, -2, 1, 1.5, 0.5, 0.5,
-3.712411, -3.560261, -2, 0, 1.5, 0.5, 0.5,
-3.712411, -3.560261, 0, 0, -0.5, 0.5, 0.5,
-3.712411, -3.560261, 0, 1, -0.5, 0.5, 0.5,
-3.712411, -3.560261, 0, 1, 1.5, 0.5, 0.5,
-3.712411, -3.560261, 0, 0, 1.5, 0.5, 0.5,
-3.712411, -3.560261, 2, 0, -0.5, 0.5, 0.5,
-3.712411, -3.560261, 2, 1, -0.5, 0.5, 0.5,
-3.712411, -3.560261, 2, 1, 1.5, 0.5, 0.5,
-3.712411, -3.560261, 2, 0, 1.5, 0.5, 0.5,
-3.712411, -3.560261, 4, 0, -0.5, 0.5, 0.5,
-3.712411, -3.560261, 4, 1, -0.5, 0.5, 0.5,
-3.712411, -3.560261, 4, 1, 1.5, 0.5, 0.5,
-3.712411, -3.560261, 4, 0, 1.5, 0.5, 0.5
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
-3.209065, -3.083291, -5.923626,
-3.209065, 3.276303, -5.923626,
-3.209065, -3.083291, 5.728224,
-3.209065, 3.276303, 5.728224,
-3.209065, -3.083291, -5.923626,
-3.209065, -3.083291, 5.728224,
-3.209065, 3.276303, -5.923626,
-3.209065, 3.276303, 5.728224,
-3.209065, -3.083291, -5.923626,
3.502221, -3.083291, -5.923626,
-3.209065, -3.083291, 5.728224,
3.502221, -3.083291, 5.728224,
-3.209065, 3.276303, -5.923626,
3.502221, 3.276303, -5.923626,
-3.209065, 3.276303, 5.728224,
3.502221, 3.276303, 5.728224,
3.502221, -3.083291, -5.923626,
3.502221, 3.276303, -5.923626,
3.502221, -3.083291, 5.728224,
3.502221, 3.276303, 5.728224,
3.502221, -3.083291, -5.923626,
3.502221, -3.083291, 5.728224,
3.502221, 3.276303, -5.923626,
3.502221, 3.276303, 5.728224
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
var radius = 7.942706;
var distance = 35.338;
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
mvMatrix.translate( -0.1465778, -0.09650576, 0.09770131 );
mvMatrix.scale( 1.279607, 1.350371, 0.737034 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.338);
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
metribuzin<-read.table("metribuzin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metribuzin$V2
```

```
## Error in eval(expr, envir, enclos): object 'metribuzin' not found
```

```r
y<-metribuzin$V3
```

```
## Error in eval(expr, envir, enclos): object 'metribuzin' not found
```

```r
z<-metribuzin$V4
```

```
## Error in eval(expr, envir, enclos): object 'metribuzin' not found
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
-3.111328, -1.33925, -2.268764, 0, 0, 1, 1, 1,
-2.910583, 0.1702603, -3.674832, 1, 0, 0, 1, 1,
-2.732368, -1.485528, -1.412049, 1, 0, 0, 1, 1,
-2.732337, 1.94339, -1.478845, 1, 0, 0, 1, 1,
-2.635356, -2.147202, -2.223368, 1, 0, 0, 1, 1,
-2.549584, -0.03839807, -1.149734, 1, 0, 0, 1, 1,
-2.523669, 0.615129, -0.4659873, 0, 0, 0, 1, 1,
-2.443158, 0.5263748, -0.8475775, 0, 0, 0, 1, 1,
-2.31031, -0.4690579, -1.92255, 0, 0, 0, 1, 1,
-2.296766, -0.9291798, -2.562727, 0, 0, 0, 1, 1,
-2.250464, 1.297841, -1.534843, 0, 0, 0, 1, 1,
-2.189735, -1.981118, -2.936526, 0, 0, 0, 1, 1,
-2.096618, 0.4483187, -1.644502, 0, 0, 0, 1, 1,
-2.052079, -2.06952, -3.407943, 1, 1, 1, 1, 1,
-2.00342, -1.177449, -3.188679, 1, 1, 1, 1, 1,
-1.986165, 0.5408077, -0.90562, 1, 1, 1, 1, 1,
-1.986053, -0.667766, -3.462172, 1, 1, 1, 1, 1,
-1.980116, -0.4564967, -0.4778568, 1, 1, 1, 1, 1,
-1.963179, -0.6178033, -2.593465, 1, 1, 1, 1, 1,
-1.953008, 0.6889264, -1.645009, 1, 1, 1, 1, 1,
-1.901282, 0.260999, -1.512417, 1, 1, 1, 1, 1,
-1.891085, 0.4839269, -1.181773, 1, 1, 1, 1, 1,
-1.888194, 0.8997849, -1.229699, 1, 1, 1, 1, 1,
-1.884027, -0.8751827, -2.099373, 1, 1, 1, 1, 1,
-1.861612, 0.05329064, -0.5535365, 1, 1, 1, 1, 1,
-1.852795, 0.03525798, -1.175414, 1, 1, 1, 1, 1,
-1.818982, 0.2776688, -2.365314, 1, 1, 1, 1, 1,
-1.787936, 0.7364021, -2.724748, 1, 1, 1, 1, 1,
-1.783408, -1.19338, -0.9141353, 0, 0, 1, 1, 1,
-1.729884, -1.795859, -0.6368601, 1, 0, 0, 1, 1,
-1.720957, -0.5349469, -1.032108, 1, 0, 0, 1, 1,
-1.714452, 0.5568062, -1.531021, 1, 0, 0, 1, 1,
-1.699681, -1.503978, -3.171815, 1, 0, 0, 1, 1,
-1.68532, -0.01700366, -1.232087, 1, 0, 0, 1, 1,
-1.670339, 1.614529, -0.7646129, 0, 0, 0, 1, 1,
-1.669969, -1.678153, -1.034658, 0, 0, 0, 1, 1,
-1.668973, -0.4598927, 0.9858065, 0, 0, 0, 1, 1,
-1.657313, 1.750175, -1.468768, 0, 0, 0, 1, 1,
-1.652624, -0.3528311, -2.937719, 0, 0, 0, 1, 1,
-1.64746, 0.2264044, -0.3007854, 0, 0, 0, 1, 1,
-1.646613, -0.2331365, -3.14975, 0, 0, 0, 1, 1,
-1.646496, -0.9703309, -2.078562, 1, 1, 1, 1, 1,
-1.623816, -0.08068172, -3.51696, 1, 1, 1, 1, 1,
-1.594839, -0.5522667, 0.9217338, 1, 1, 1, 1, 1,
-1.593267, -1.049689, -2.11338, 1, 1, 1, 1, 1,
-1.573971, -0.0435158, -2.824581, 1, 1, 1, 1, 1,
-1.573615, 1.112505, -1.697742, 1, 1, 1, 1, 1,
-1.573406, 0.05510383, -2.361443, 1, 1, 1, 1, 1,
-1.572475, -0.6770081, -2.332454, 1, 1, 1, 1, 1,
-1.565938, 0.1830999, -2.293691, 1, 1, 1, 1, 1,
-1.558497, -0.7961372, -2.569911, 1, 1, 1, 1, 1,
-1.555307, 1.186802, 0.5794231, 1, 1, 1, 1, 1,
-1.522428, 0.7169597, -1.432036, 1, 1, 1, 1, 1,
-1.5128, 0.004470595, -1.692213, 1, 1, 1, 1, 1,
-1.491097, -0.9842069, -3.184753, 1, 1, 1, 1, 1,
-1.475158, 0.009943471, -1.245653, 1, 1, 1, 1, 1,
-1.467108, -2.43199, -3.552789, 0, 0, 1, 1, 1,
-1.446183, -1.279622, -2.889308, 1, 0, 0, 1, 1,
-1.444454, 1.326179, -1.733166, 1, 0, 0, 1, 1,
-1.432908, 1.481482, 0.2263068, 1, 0, 0, 1, 1,
-1.428681, -0.85577, -1.566121, 1, 0, 0, 1, 1,
-1.427663, -0.5525623, -3.182551, 1, 0, 0, 1, 1,
-1.412566, 0.9643331, -1.08529, 0, 0, 0, 1, 1,
-1.411051, -1.04176, -1.702876, 0, 0, 0, 1, 1,
-1.396535, 0.07397491, -3.884547, 0, 0, 0, 1, 1,
-1.38763, -0.1176021, -2.012104, 0, 0, 0, 1, 1,
-1.380629, -1.637415, -2.891657, 0, 0, 0, 1, 1,
-1.380254, -0.07495494, -1.857169, 0, 0, 0, 1, 1,
-1.377441, 1.062322, -2.892978, 0, 0, 0, 1, 1,
-1.376748, 1.128765, -1.928353, 1, 1, 1, 1, 1,
-1.371737, -1.360657, -2.73937, 1, 1, 1, 1, 1,
-1.360776, 1.375896, -1.208429, 1, 1, 1, 1, 1,
-1.359804, 0.5107948, 0.2711903, 1, 1, 1, 1, 1,
-1.352108, 1.463109, -0.9418985, 1, 1, 1, 1, 1,
-1.345357, 0.08725932, -1.657205, 1, 1, 1, 1, 1,
-1.334605, -1.475861, -3.620705, 1, 1, 1, 1, 1,
-1.310752, 0.3258504, -0.8939989, 1, 1, 1, 1, 1,
-1.297789, -0.05165177, -1.588121, 1, 1, 1, 1, 1,
-1.284398, -1.075331, -4.547127, 1, 1, 1, 1, 1,
-1.282681, -0.2363363, -3.061283, 1, 1, 1, 1, 1,
-1.278262, -0.7165514, -0.649533, 1, 1, 1, 1, 1,
-1.275853, 0.1204767, -0.2148461, 1, 1, 1, 1, 1,
-1.272281, -2.444246, -2.511718, 1, 1, 1, 1, 1,
-1.270879, -1.396868, -2.686881, 1, 1, 1, 1, 1,
-1.270223, -0.407562, -0.6654576, 0, 0, 1, 1, 1,
-1.264635, 1.359805, -0.6797983, 1, 0, 0, 1, 1,
-1.261625, -0.6251196, 0.3718188, 1, 0, 0, 1, 1,
-1.259602, -0.5121837, -1.436335, 1, 0, 0, 1, 1,
-1.25487, -1.390185, -2.107708, 1, 0, 0, 1, 1,
-1.247945, 0.4815383, -0.05498627, 1, 0, 0, 1, 1,
-1.234253, 0.563454, -1.400329, 0, 0, 0, 1, 1,
-1.223141, 0.7532151, -0.6184263, 0, 0, 0, 1, 1,
-1.222502, 0.1769145, -1.645437, 0, 0, 0, 1, 1,
-1.221505, 0.8459315, -1.785102, 0, 0, 0, 1, 1,
-1.218885, 0.1737214, 0.397583, 0, 0, 0, 1, 1,
-1.216176, 0.878702, -1.436193, 0, 0, 0, 1, 1,
-1.209435, 0.5686898, 0.9855103, 0, 0, 0, 1, 1,
-1.203069, 1.181172, -1.223182, 1, 1, 1, 1, 1,
-1.196819, -0.3629353, -2.292207, 1, 1, 1, 1, 1,
-1.193597, 2.59863, -0.8160452, 1, 1, 1, 1, 1,
-1.190611, -0.8795648, -1.208835, 1, 1, 1, 1, 1,
-1.175951, 0.2357516, -1.505536, 1, 1, 1, 1, 1,
-1.167467, -0.635108, -1.201295, 1, 1, 1, 1, 1,
-1.166059, -1.440742, -2.436531, 1, 1, 1, 1, 1,
-1.164865, -1.08853, -3.428687, 1, 1, 1, 1, 1,
-1.163262, -2.469598, -3.456173, 1, 1, 1, 1, 1,
-1.159693, -0.08504791, -2.629445, 1, 1, 1, 1, 1,
-1.158163, -1.252924, -2.566865, 1, 1, 1, 1, 1,
-1.15613, 1.08669, 0.3192619, 1, 1, 1, 1, 1,
-1.155986, 0.002377392, -1.341774, 1, 1, 1, 1, 1,
-1.151308, 0.6679882, -1.138863, 1, 1, 1, 1, 1,
-1.148334, 1.712793, -3.13581, 1, 1, 1, 1, 1,
-1.145656, 0.7724075, 0.1182317, 0, 0, 1, 1, 1,
-1.140441, 0.08925407, -2.866477, 1, 0, 0, 1, 1,
-1.139005, -0.2970487, -0.6203036, 1, 0, 0, 1, 1,
-1.138771, 0.03821478, -0.09317459, 1, 0, 0, 1, 1,
-1.13469, 0.2416908, -2.488041, 1, 0, 0, 1, 1,
-1.131672, 1.853232, -2.145831, 1, 0, 0, 1, 1,
-1.128426, -0.398816, -2.933074, 0, 0, 0, 1, 1,
-1.12219, -1.118305, -3.996036, 0, 0, 0, 1, 1,
-1.114739, 1.152318, 1.304949, 0, 0, 0, 1, 1,
-1.101493, -0.2937527, -2.44429, 0, 0, 0, 1, 1,
-1.098861, -0.05901641, -3.413604, 0, 0, 0, 1, 1,
-1.095814, 0.8479416, 0.1742265, 0, 0, 0, 1, 1,
-1.088554, 0.1648077, -0.9097775, 0, 0, 0, 1, 1,
-1.086643, 1.016307, -2.137779, 1, 1, 1, 1, 1,
-1.080661, 0.1595759, -2.963938, 1, 1, 1, 1, 1,
-1.062741, -1.935154, -2.817352, 1, 1, 1, 1, 1,
-1.058071, -0.8567597, -2.735797, 1, 1, 1, 1, 1,
-1.050545, -0.2663676, -1.338493, 1, 1, 1, 1, 1,
-1.049861, -0.4803753, -2.113362, 1, 1, 1, 1, 1,
-1.048299, -0.2053861, -2.364331, 1, 1, 1, 1, 1,
-1.048236, 1.061965, -1.198194, 1, 1, 1, 1, 1,
-1.043571, 0.7829896, -0.3392071, 1, 1, 1, 1, 1,
-1.039785, -0.3326322, -1.822764, 1, 1, 1, 1, 1,
-1.024081, -0.6852177, -1.184694, 1, 1, 1, 1, 1,
-1.023858, -0.9089978, -2.72293, 1, 1, 1, 1, 1,
-1.018008, -0.509091, -0.2657795, 1, 1, 1, 1, 1,
-1.012836, -0.03334158, 0.314665, 1, 1, 1, 1, 1,
-1.012479, 0.5853549, -1.943689, 1, 1, 1, 1, 1,
-1.006327, 0.6112543, 0.6761283, 0, 0, 1, 1, 1,
-1.0051, 0.331214, -0.4674557, 1, 0, 0, 1, 1,
-1.00179, 0.9936113, -0.8710569, 1, 0, 0, 1, 1,
-1.001562, 0.6305875, -1.71761, 1, 0, 0, 1, 1,
-1.001142, -0.009302397, -3.296732, 1, 0, 0, 1, 1,
-0.9944099, -0.1647738, -0.8847619, 1, 0, 0, 1, 1,
-0.9932334, -0.4280767, -1.129602, 0, 0, 0, 1, 1,
-0.9900252, 1.128105, -1.946642, 0, 0, 0, 1, 1,
-0.9899055, 0.4343964, -0.6776943, 0, 0, 0, 1, 1,
-0.9799505, -1.789678, -2.333199, 0, 0, 0, 1, 1,
-0.978576, -0.27885, -0.6547834, 0, 0, 0, 1, 1,
-0.9735031, 0.6570436, -1.786452, 0, 0, 0, 1, 1,
-0.959931, 0.8317856, -3.411092, 0, 0, 0, 1, 1,
-0.9556924, -0.6699519, -1.48634, 1, 1, 1, 1, 1,
-0.9511296, -2.281529, -4.070093, 1, 1, 1, 1, 1,
-0.9498429, -0.7279339, -2.973665, 1, 1, 1, 1, 1,
-0.9473538, 2.915797, -1.272263, 1, 1, 1, 1, 1,
-0.9422056, 0.5379205, 0.6323063, 1, 1, 1, 1, 1,
-0.9296735, 0.02051547, -2.580063, 1, 1, 1, 1, 1,
-0.9270478, -0.1373424, -2.493969, 1, 1, 1, 1, 1,
-0.9219322, 0.4947482, -2.009467, 1, 1, 1, 1, 1,
-0.9217544, -0.004641296, -1.716034, 1, 1, 1, 1, 1,
-0.921487, 1.424567, 0.2861073, 1, 1, 1, 1, 1,
-0.9212549, -0.2364642, -3.228068, 1, 1, 1, 1, 1,
-0.9162234, 0.1238216, -2.070989, 1, 1, 1, 1, 1,
-0.9159598, -0.73099, -2.306827, 1, 1, 1, 1, 1,
-0.9075055, 0.4229756, 0.3425367, 1, 1, 1, 1, 1,
-0.8913484, 0.2592678, -1.290427, 1, 1, 1, 1, 1,
-0.8906808, 0.8684825, -0.8805217, 0, 0, 1, 1, 1,
-0.88486, -0.8699378, -3.083026, 1, 0, 0, 1, 1,
-0.8745981, -0.6943628, -0.7689226, 1, 0, 0, 1, 1,
-0.8723031, 0.3156867, -2.090016, 1, 0, 0, 1, 1,
-0.871027, -0.8565241, -1.686113, 1, 0, 0, 1, 1,
-0.8687212, -0.9602144, -1.252645, 1, 0, 0, 1, 1,
-0.8651772, -0.8127335, -3.106983, 0, 0, 0, 1, 1,
-0.8633534, -0.07198223, -0.8246761, 0, 0, 0, 1, 1,
-0.8620852, 0.1740831, -0.5636769, 0, 0, 0, 1, 1,
-0.8535315, 2.067316, -0.01163873, 0, 0, 0, 1, 1,
-0.8487515, -0.2892768, -1.712307, 0, 0, 0, 1, 1,
-0.8480241, -1.375291, -3.379109, 0, 0, 0, 1, 1,
-0.8393824, -1.193315, -2.207532, 0, 0, 0, 1, 1,
-0.8357302, -0.7018346, -1.637948, 1, 1, 1, 1, 1,
-0.8327311, -0.4316008, -0.5335513, 1, 1, 1, 1, 1,
-0.8290472, -0.698138, -2.195311, 1, 1, 1, 1, 1,
-0.8289491, -0.180813, -3.014684, 1, 1, 1, 1, 1,
-0.828405, 1.595893, -0.5188957, 1, 1, 1, 1, 1,
-0.8221428, 0.6159632, -0.6880941, 1, 1, 1, 1, 1,
-0.8219844, -1.135261, -2.376202, 1, 1, 1, 1, 1,
-0.8192235, 0.6763337, -1.174303, 1, 1, 1, 1, 1,
-0.8149105, 1.330284, -2.519029, 1, 1, 1, 1, 1,
-0.8122727, -0.2290425, -2.755744, 1, 1, 1, 1, 1,
-0.8116861, 0.9160073, 0.04602757, 1, 1, 1, 1, 1,
-0.8031974, 0.5459309, -2.396041, 1, 1, 1, 1, 1,
-0.8024909, 0.002204667, -1.885943, 1, 1, 1, 1, 1,
-0.7987033, 1.585555, -0.4915847, 1, 1, 1, 1, 1,
-0.7939604, 0.1135506, -1.580705, 1, 1, 1, 1, 1,
-0.7929082, 0.6652094, -0.9843237, 0, 0, 1, 1, 1,
-0.7925788, -0.3063672, -1.611627, 1, 0, 0, 1, 1,
-0.7907116, 0.0632815, -3.704214, 1, 0, 0, 1, 1,
-0.7830924, -0.008402373, -3.070416, 1, 0, 0, 1, 1,
-0.7713251, 2.807359, -0.02106352, 1, 0, 0, 1, 1,
-0.7670602, 0.200079, -0.6734282, 1, 0, 0, 1, 1,
-0.7640398, -0.3326764, -1.238337, 0, 0, 0, 1, 1,
-0.7639385, 0.2547688, -1.897151, 0, 0, 0, 1, 1,
-0.7583961, -0.4448396, -3.447239, 0, 0, 0, 1, 1,
-0.7576277, -0.8831724, -4.229042, 0, 0, 0, 1, 1,
-0.7548426, 0.5455784, -0.6433159, 0, 0, 0, 1, 1,
-0.7519135, -0.2853468, -2.335256, 0, 0, 0, 1, 1,
-0.7512386, -0.9872874, -1.899903, 0, 0, 0, 1, 1,
-0.743798, -0.4482756, -3.096851, 1, 1, 1, 1, 1,
-0.7407784, -0.8145561, -2.814526, 1, 1, 1, 1, 1,
-0.7372106, -1.015833, -1.165252, 1, 1, 1, 1, 1,
-0.72655, -1.677533, -3.304168, 1, 1, 1, 1, 1,
-0.719359, -0.2287861, -4.145941, 1, 1, 1, 1, 1,
-0.7147253, 0.3830871, 0.4595686, 1, 1, 1, 1, 1,
-0.7124186, 1.249949, 0.2199714, 1, 1, 1, 1, 1,
-0.7103866, -0.3086493, -1.897676, 1, 1, 1, 1, 1,
-0.708855, -1.5299, -3.62533, 1, 1, 1, 1, 1,
-0.7080969, 0.306844, 0.5652823, 1, 1, 1, 1, 1,
-0.7061064, -1.95121, -2.227373, 1, 1, 1, 1, 1,
-0.7057834, -1.627881, -1.679666, 1, 1, 1, 1, 1,
-0.7047285, 1.479816, -1.153328, 1, 1, 1, 1, 1,
-0.7044066, -0.2784238, -1.186686, 1, 1, 1, 1, 1,
-0.7032231, -1.818546, -2.241146, 1, 1, 1, 1, 1,
-0.7002277, 2.148849, -0.4263498, 0, 0, 1, 1, 1,
-0.6935923, -1.041261, -3.500715, 1, 0, 0, 1, 1,
-0.6927175, -0.9732426, -4.049001, 1, 0, 0, 1, 1,
-0.6872422, -1.120631, -2.462363, 1, 0, 0, 1, 1,
-0.6861308, 0.9848286, -1.271732, 1, 0, 0, 1, 1,
-0.6792737, 0.5346087, 0.3437827, 1, 0, 0, 1, 1,
-0.6773198, -0.591471, -2.106961, 0, 0, 0, 1, 1,
-0.6762816, 0.4893024, -0.181015, 0, 0, 0, 1, 1,
-0.6749797, -0.01728649, -1.6597, 0, 0, 0, 1, 1,
-0.6734875, -1.818384, -1.307313, 0, 0, 0, 1, 1,
-0.6723354, 0.4391855, -1.877931, 0, 0, 0, 1, 1,
-0.6711557, 0.5959508, -1.61033, 0, 0, 0, 1, 1,
-0.6674517, 1.73583, -0.4601643, 0, 0, 0, 1, 1,
-0.6665816, 0.6088083, -0.2705052, 1, 1, 1, 1, 1,
-0.665341, 0.2305027, -0.7438431, 1, 1, 1, 1, 1,
-0.6620927, -1.188859, -1.859986, 1, 1, 1, 1, 1,
-0.6584013, 0.3289852, 0.7710392, 1, 1, 1, 1, 1,
-0.6545391, -0.4211219, -2.78135, 1, 1, 1, 1, 1,
-0.6535301, -0.2604459, -2.206327, 1, 1, 1, 1, 1,
-0.6508002, -0.1854356, -2.973786, 1, 1, 1, 1, 1,
-0.6457016, -1.420493, -2.490767, 1, 1, 1, 1, 1,
-0.641184, 0.4056334, -0.4617622, 1, 1, 1, 1, 1,
-0.6407951, 0.3272415, -1.689407, 1, 1, 1, 1, 1,
-0.6366502, -0.01524255, -0.009810768, 1, 1, 1, 1, 1,
-0.6328189, 0.5606729, 0.7291934, 1, 1, 1, 1, 1,
-0.6307935, -0.6418595, -2.660854, 1, 1, 1, 1, 1,
-0.6265935, -1.175136, -2.939312, 1, 1, 1, 1, 1,
-0.6247946, -0.03446474, -1.261411, 1, 1, 1, 1, 1,
-0.6214111, 1.503914, -0.07917044, 0, 0, 1, 1, 1,
-0.6199662, 1.043392, -1.281027, 1, 0, 0, 1, 1,
-0.613035, 0.8245287, -0.9994859, 1, 0, 0, 1, 1,
-0.6127349, -0.8027686, -2.65855, 1, 0, 0, 1, 1,
-0.6094028, -0.6583536, -0.6076626, 1, 0, 0, 1, 1,
-0.6071091, -0.6716673, -3.00566, 1, 0, 0, 1, 1,
-0.6048025, -0.3902158, -1.078081, 0, 0, 0, 1, 1,
-0.6033494, -0.3931022, -1.187386, 0, 0, 0, 1, 1,
-0.6029308, 0.5438839, -0.6051636, 0, 0, 0, 1, 1,
-0.6024172, 0.3388193, -0.6876341, 0, 0, 0, 1, 1,
-0.6023909, 0.7279024, -0.3014816, 0, 0, 0, 1, 1,
-0.5924978, 0.01126412, -0.4514403, 0, 0, 0, 1, 1,
-0.5907931, 1.393958, -0.7263965, 0, 0, 0, 1, 1,
-0.5848324, -0.9975997, -4.324444, 1, 1, 1, 1, 1,
-0.5832176, -0.4191692, -2.126199, 1, 1, 1, 1, 1,
-0.5811892, -1.257275, -2.006022, 1, 1, 1, 1, 1,
-0.5800229, -1.106228, -2.70741, 1, 1, 1, 1, 1,
-0.5755813, 0.2610782, -0.1431028, 1, 1, 1, 1, 1,
-0.572544, -0.1051376, -2.796967, 1, 1, 1, 1, 1,
-0.5701744, -0.7106527, -2.126032, 1, 1, 1, 1, 1,
-0.5695149, -1.078839, -1.898658, 1, 1, 1, 1, 1,
-0.5655414, 0.7361813, 0.2778929, 1, 1, 1, 1, 1,
-0.5600861, -0.8095804, -3.659153, 1, 1, 1, 1, 1,
-0.5549486, 0.238023, -0.3636805, 1, 1, 1, 1, 1,
-0.5538566, 0.463119, -2.964602, 1, 1, 1, 1, 1,
-0.5514752, -0.1875739, -2.521435, 1, 1, 1, 1, 1,
-0.5491654, 0.8981978, -0.6141997, 1, 1, 1, 1, 1,
-0.5490355, 1.389218, -0.3042198, 1, 1, 1, 1, 1,
-0.5375636, -0.1554383, -1.952317, 0, 0, 1, 1, 1,
-0.5359689, 0.8924071, -0.3348349, 1, 0, 0, 1, 1,
-0.5325356, 2.040536, -2.263281, 1, 0, 0, 1, 1,
-0.5292763, -0.08725064, -1.935527, 1, 0, 0, 1, 1,
-0.5260846, -0.3073365, -1.42381, 1, 0, 0, 1, 1,
-0.5237342, 0.1522507, 0.2459717, 1, 0, 0, 1, 1,
-0.5213737, 0.5674538, -1.8539, 0, 0, 0, 1, 1,
-0.5205766, -0.6020381, -1.676909, 0, 0, 0, 1, 1,
-0.5149348, -0.9049068, -3.005047, 0, 0, 0, 1, 1,
-0.5090704, 0.01232865, -3.975836, 0, 0, 0, 1, 1,
-0.508108, -0.08767319, -2.571156, 0, 0, 0, 1, 1,
-0.5047035, -0.2680065, -2.353479, 0, 0, 0, 1, 1,
-0.5020971, -1.059293, -2.466897, 0, 0, 0, 1, 1,
-0.5014099, 1.662526, -0.4848139, 1, 1, 1, 1, 1,
-0.5012748, 2.124843, 0.3297471, 1, 1, 1, 1, 1,
-0.498289, 0.693841, 0.7726527, 1, 1, 1, 1, 1,
-0.4976476, -0.3628674, -0.7829462, 1, 1, 1, 1, 1,
-0.4965903, -0.7772573, -2.219228, 1, 1, 1, 1, 1,
-0.4886646, -1.836683, -2.685123, 1, 1, 1, 1, 1,
-0.4858502, 0.2788938, -2.185086, 1, 1, 1, 1, 1,
-0.4806912, -1.29973, -2.701869, 1, 1, 1, 1, 1,
-0.4776745, 0.2945799, -1.78653, 1, 1, 1, 1, 1,
-0.4749675, 0.4498557, -2.288531, 1, 1, 1, 1, 1,
-0.4747304, 1.44317, -2.745695, 1, 1, 1, 1, 1,
-0.4727969, 0.4207433, -1.44516, 1, 1, 1, 1, 1,
-0.4717331, 0.6080521, -1.218417, 1, 1, 1, 1, 1,
-0.4695788, 0.7312033, -1.342804, 1, 1, 1, 1, 1,
-0.4659105, 0.1637153, -1.990861, 1, 1, 1, 1, 1,
-0.4620741, -0.1224772, -1.966562, 0, 0, 1, 1, 1,
-0.4614923, 0.09487061, -0.3121227, 1, 0, 0, 1, 1,
-0.4611142, -0.7683244, -2.601002, 1, 0, 0, 1, 1,
-0.4594596, -0.4384805, -3.138358, 1, 0, 0, 1, 1,
-0.4515396, 1.144839, 0.7521613, 1, 0, 0, 1, 1,
-0.4474547, 1.108053, -1.111826, 1, 0, 0, 1, 1,
-0.4446468, 0.4421377, -1.668886, 0, 0, 0, 1, 1,
-0.4411951, -1.120241, -3.203355, 0, 0, 0, 1, 1,
-0.4386067, 0.8043556, -0.347293, 0, 0, 0, 1, 1,
-0.4385712, 0.5128168, -1.824228, 0, 0, 0, 1, 1,
-0.4351529, 0.779951, -1.759312, 0, 0, 0, 1, 1,
-0.4328345, -1.079328, -3.983811, 0, 0, 0, 1, 1,
-0.4307814, -0.548909, -2.106559, 0, 0, 0, 1, 1,
-0.429043, 0.1244315, -0.4945116, 1, 1, 1, 1, 1,
-0.4279819, 0.1947994, -2.559091, 1, 1, 1, 1, 1,
-0.4241797, -1.145114, -5.059286, 1, 1, 1, 1, 1,
-0.4209949, 0.03991522, 0.9981243, 1, 1, 1, 1, 1,
-0.4180181, 0.6986287, -1.192088, 1, 1, 1, 1, 1,
-0.4156258, 1.151981, -0.6738718, 1, 1, 1, 1, 1,
-0.414098, -1.39031, -4.072213, 1, 1, 1, 1, 1,
-0.4125616, -0.3046688, -3.763025, 1, 1, 1, 1, 1,
-0.4110606, -0.3463126, -2.769724, 1, 1, 1, 1, 1,
-0.4108178, -0.8890931, -1.942897, 1, 1, 1, 1, 1,
-0.4081399, -0.3119224, -0.550062, 1, 1, 1, 1, 1,
-0.4071261, -0.04077396, -2.136935, 1, 1, 1, 1, 1,
-0.4052922, 1.149715, -1.476358, 1, 1, 1, 1, 1,
-0.404216, -0.6126587, -2.011901, 1, 1, 1, 1, 1,
-0.3985503, 0.7792609, -0.2057563, 1, 1, 1, 1, 1,
-0.3936698, -0.4300397, -2.56053, 0, 0, 1, 1, 1,
-0.3900108, -0.370527, -0.4533831, 1, 0, 0, 1, 1,
-0.3895858, -1.796043, -2.962315, 1, 0, 0, 1, 1,
-0.3878692, 0.6490597, -1.504634, 1, 0, 0, 1, 1,
-0.3819523, 0.550131, 0.1110892, 1, 0, 0, 1, 1,
-0.3806095, -0.1534802, -0.6234747, 1, 0, 0, 1, 1,
-0.3793292, -0.352381, -3.249634, 0, 0, 0, 1, 1,
-0.3754335, 0.5114873, -0.3393998, 0, 0, 0, 1, 1,
-0.3748951, 0.3653975, 0.08163927, 0, 0, 0, 1, 1,
-0.3716706, 0.6912926, -1.812793, 0, 0, 0, 1, 1,
-0.3709018, -0.2314988, -2.570365, 0, 0, 0, 1, 1,
-0.3699124, -0.22806, -1.110663, 0, 0, 0, 1, 1,
-0.3629482, 1.963134, -1.024824, 0, 0, 0, 1, 1,
-0.3607393, 0.5572043, -0.806599, 1, 1, 1, 1, 1,
-0.3599166, -0.8876354, -1.906837, 1, 1, 1, 1, 1,
-0.3531299, 1.614511, -0.05558974, 1, 1, 1, 1, 1,
-0.3514759, 1.617623, 0.9177101, 1, 1, 1, 1, 1,
-0.3510796, -0.1775791, -1.878028, 1, 1, 1, 1, 1,
-0.3503284, -1.577739, -3.186174, 1, 1, 1, 1, 1,
-0.3416137, -0.184409, -2.829612, 1, 1, 1, 1, 1,
-0.3391654, 0.09115972, -2.771863, 1, 1, 1, 1, 1,
-0.3373958, 0.4877068, -0.0311619, 1, 1, 1, 1, 1,
-0.3373914, 1.227702, -0.6140445, 1, 1, 1, 1, 1,
-0.3355406, -0.1980609, -2.706372, 1, 1, 1, 1, 1,
-0.3338832, 0.8570871, 1.102165, 1, 1, 1, 1, 1,
-0.3282918, 1.005107, -0.7180685, 1, 1, 1, 1, 1,
-0.3241946, 2.478793, -0.4015604, 1, 1, 1, 1, 1,
-0.3217718, -0.4693454, -4.167888, 1, 1, 1, 1, 1,
-0.3165131, 1.011695, 0.166047, 0, 0, 1, 1, 1,
-0.3165027, 1.225556, -0.6326935, 1, 0, 0, 1, 1,
-0.3146464, -0.6978777, -2.168703, 1, 0, 0, 1, 1,
-0.3140725, 0.1889075, 0.6496315, 1, 0, 0, 1, 1,
-0.3094381, -1.422133, -4.08328, 1, 0, 0, 1, 1,
-0.2986264, -1.515328, -2.479657, 1, 0, 0, 1, 1,
-0.2937398, 0.3576667, 0.9317455, 0, 0, 0, 1, 1,
-0.2935687, 0.3782482, -1.28992, 0, 0, 0, 1, 1,
-0.2888585, 1.68979, 2.203709, 0, 0, 0, 1, 1,
-0.2860478, 0.7417448, 0.8093606, 0, 0, 0, 1, 1,
-0.2850028, -0.2000142, -2.863293, 0, 0, 0, 1, 1,
-0.2844625, -1.737858, -2.492982, 0, 0, 0, 1, 1,
-0.2813313, -1.518033, -4.371066, 0, 0, 0, 1, 1,
-0.2807997, 0.02213394, -1.662036, 1, 1, 1, 1, 1,
-0.2766374, -0.2745631, -3.697245, 1, 1, 1, 1, 1,
-0.2725001, -1.750857, -3.937521, 1, 1, 1, 1, 1,
-0.2679756, -0.9468451, -3.886541, 1, 1, 1, 1, 1,
-0.2671885, 0.1835791, -0.02478585, 1, 1, 1, 1, 1,
-0.2670667, 0.2257208, -1.735711, 1, 1, 1, 1, 1,
-0.2666301, -0.7989916, -3.276429, 1, 1, 1, 1, 1,
-0.2646775, 0.2475622, -1.802883, 1, 1, 1, 1, 1,
-0.2598876, 0.5259359, -0.7960624, 1, 1, 1, 1, 1,
-0.25765, -0.514945, -1.176816, 1, 1, 1, 1, 1,
-0.2514555, -0.05825584, -1.502599, 1, 1, 1, 1, 1,
-0.2486875, 0.1596092, -1.510378, 1, 1, 1, 1, 1,
-0.2477748, -1.118497, -1.516671, 1, 1, 1, 1, 1,
-0.2471679, -0.5826992, -4.798667, 1, 1, 1, 1, 1,
-0.2441475, -0.6718187, -3.128896, 1, 1, 1, 1, 1,
-0.2387563, -0.5134464, -3.591408, 0, 0, 1, 1, 1,
-0.237225, -1.456021, -2.581778, 1, 0, 0, 1, 1,
-0.2366938, -1.372096, -2.385624, 1, 0, 0, 1, 1,
-0.2329611, 0.5727337, -0.3604389, 1, 0, 0, 1, 1,
-0.2291947, 2.958972, 1.659499, 1, 0, 0, 1, 1,
-0.2287478, -0.07261536, -2.5681, 1, 0, 0, 1, 1,
-0.2248657, 0.7117772, -1.097287, 0, 0, 0, 1, 1,
-0.2248274, -1.194153, -1.568116, 0, 0, 0, 1, 1,
-0.2208839, 0.2235066, -0.7509342, 0, 0, 0, 1, 1,
-0.218603, -0.8127717, -3.715587, 0, 0, 0, 1, 1,
-0.2172178, -0.1520269, -2.067591, 0, 0, 0, 1, 1,
-0.2170322, -0.02675638, -1.896647, 0, 0, 0, 1, 1,
-0.2165319, 0.6539505, -1.72928, 0, 0, 0, 1, 1,
-0.2163994, -1.697605, -3.115219, 1, 1, 1, 1, 1,
-0.2153088, 1.534883, -1.214288, 1, 1, 1, 1, 1,
-0.2098183, 0.08930637, -1.225088, 1, 1, 1, 1, 1,
-0.2084036, -1.036193, -4.162034, 1, 1, 1, 1, 1,
-0.2065706, 1.263527, -0.4746797, 1, 1, 1, 1, 1,
-0.2056322, 0.1924161, -0.7570163, 1, 1, 1, 1, 1,
-0.2041749, 0.2393831, -0.5988125, 1, 1, 1, 1, 1,
-0.2035318, 1.296491, -0.9608182, 1, 1, 1, 1, 1,
-0.2024476, 0.2118142, -0.8734881, 1, 1, 1, 1, 1,
-0.2020402, 1.589065, -0.3002259, 1, 1, 1, 1, 1,
-0.1975871, 0.1214051, -0.5596259, 1, 1, 1, 1, 1,
-0.1964894, -0.8708101, -2.880302, 1, 1, 1, 1, 1,
-0.1949003, -0.8610064, -1.338169, 1, 1, 1, 1, 1,
-0.1921662, 0.7854212, -1.101295, 1, 1, 1, 1, 1,
-0.1892482, -1.3138, -3.842901, 1, 1, 1, 1, 1,
-0.1888908, 0.4275973, 0.3910107, 0, 0, 1, 1, 1,
-0.1886618, 0.8047948, -1.082921, 1, 0, 0, 1, 1,
-0.1835147, -0.5855708, -0.5437233, 1, 0, 0, 1, 1,
-0.1789661, -0.339788, -4.343393, 1, 0, 0, 1, 1,
-0.1785458, -1.362117, -2.14885, 1, 0, 0, 1, 1,
-0.1747274, 0.81287, -1.057439, 1, 0, 0, 1, 1,
-0.1743216, -1.057366, -2.081238, 0, 0, 0, 1, 1,
-0.1730682, -0.3426979, -1.618917, 0, 0, 0, 1, 1,
-0.1726716, -0.2890703, -3.788772, 0, 0, 0, 1, 1,
-0.1723651, 0.6630924, -0.3332764, 0, 0, 0, 1, 1,
-0.1718875, -0.8118824, -2.785373, 0, 0, 0, 1, 1,
-0.1707742, 0.0583171, -1.799788, 0, 0, 0, 1, 1,
-0.1676498, 0.2850929, -0.9006739, 0, 0, 0, 1, 1,
-0.1649877, -0.5547505, -3.047286, 1, 1, 1, 1, 1,
-0.1623972, 1.814198, 0.5502028, 1, 1, 1, 1, 1,
-0.1616629, -0.9558095, -2.931942, 1, 1, 1, 1, 1,
-0.1609073, 0.2533295, -2.337404, 1, 1, 1, 1, 1,
-0.1553192, 1.041331, 1.975377, 1, 1, 1, 1, 1,
-0.1533003, -0.9884308, -2.260659, 1, 1, 1, 1, 1,
-0.1510892, -0.193469, -1.187004, 1, 1, 1, 1, 1,
-0.1488279, -0.7884179, -3.092809, 1, 1, 1, 1, 1,
-0.1476358, 0.0006695908, -2.284836, 1, 1, 1, 1, 1,
-0.14506, -1.122818, -3.012748, 1, 1, 1, 1, 1,
-0.1436296, -0.1988041, -0.4654945, 1, 1, 1, 1, 1,
-0.1385473, 1.278477, -0.5518282, 1, 1, 1, 1, 1,
-0.1375347, -0.8430373, -4.409016, 1, 1, 1, 1, 1,
-0.1312822, -1.376177, -2.428991, 1, 1, 1, 1, 1,
-0.1291137, 0.214617, -0.4692914, 1, 1, 1, 1, 1,
-0.1289685, 1.29376, 1.583907, 0, 0, 1, 1, 1,
-0.1271845, -0.701256, -1.68867, 1, 0, 0, 1, 1,
-0.1230592, -0.4355985, -1.074747, 1, 0, 0, 1, 1,
-0.1196694, 0.4009586, -0.1743129, 1, 0, 0, 1, 1,
-0.1151633, 2.018091, 0.2269048, 1, 0, 0, 1, 1,
-0.1142467, -1.098898, -2.884212, 1, 0, 0, 1, 1,
-0.103376, -0.0554534, -2.578981, 0, 0, 0, 1, 1,
-0.1012699, 0.7701734, -1.040964, 0, 0, 0, 1, 1,
-0.09796197, -0.1116561, -3.11675, 0, 0, 0, 1, 1,
-0.09559247, -1.743297, -3.239625, 0, 0, 0, 1, 1,
-0.09274429, -1.070698, -5.753939, 0, 0, 0, 1, 1,
-0.09265556, 2.242366, 0.09672421, 0, 0, 0, 1, 1,
-0.08535428, 0.3964227, -1.020837, 0, 0, 0, 1, 1,
-0.08515013, -0.6027786, -2.154388, 1, 1, 1, 1, 1,
-0.08155616, 0.2025205, 0.06552397, 1, 1, 1, 1, 1,
-0.08029022, -0.2527628, -1.319137, 1, 1, 1, 1, 1,
-0.07908837, -0.1656214, -3.106121, 1, 1, 1, 1, 1,
-0.07641492, -1.013533, -3.97606, 1, 1, 1, 1, 1,
-0.07350055, -0.9178069, -2.792292, 1, 1, 1, 1, 1,
-0.06195683, 2.837584, -1.088745, 1, 1, 1, 1, 1,
-0.05691305, 1.3295, -0.935483, 1, 1, 1, 1, 1,
-0.05608154, -0.6776713, -1.569973, 1, 1, 1, 1, 1,
-0.05323688, -1.587334, -3.425828, 1, 1, 1, 1, 1,
-0.05101622, 0.8068308, -1.10659, 1, 1, 1, 1, 1,
-0.0497308, 0.2783692, -0.8788672, 1, 1, 1, 1, 1,
-0.04901357, 0.552244, -0.3568928, 1, 1, 1, 1, 1,
-0.0482697, -0.7671837, -4.890244, 1, 1, 1, 1, 1,
-0.0467285, 0.6381129, -0.5384935, 1, 1, 1, 1, 1,
-0.04508793, -0.8560007, -1.944781, 0, 0, 1, 1, 1,
-0.04451101, -0.6445841, -2.575227, 1, 0, 0, 1, 1,
-0.04178787, 1.813945, -0.6485111, 1, 0, 0, 1, 1,
-0.04122075, -1.505718, -4.293745, 1, 0, 0, 1, 1,
-0.04075906, 1.791677, 0.3495651, 1, 0, 0, 1, 1,
-0.03806263, -0.4327562, -1.131882, 1, 0, 0, 1, 1,
-0.03566059, 0.719272, -0.3033419, 0, 0, 0, 1, 1,
-0.03560899, 1.619231, -0.4063606, 0, 0, 0, 1, 1,
-0.03480085, -1.211902, -3.011486, 0, 0, 0, 1, 1,
-0.03325925, -0.4358895, -2.991319, 0, 0, 0, 1, 1,
-0.03169615, 0.4742826, 0.9656166, 0, 0, 0, 1, 1,
-0.03059463, 0.1204352, 0.06445503, 0, 0, 0, 1, 1,
-0.02915765, 1.275585, 0.4789307, 0, 0, 0, 1, 1,
-0.02903906, -0.5606228, -2.777186, 1, 1, 1, 1, 1,
-0.02427908, -1.048798, -2.493772, 1, 1, 1, 1, 1,
-0.02416141, 1.659679, -0.1324561, 1, 1, 1, 1, 1,
-0.02357822, -2.668211, -1.902091, 1, 1, 1, 1, 1,
-0.02302603, 1.007566, -1.138395, 1, 1, 1, 1, 1,
-0.02286044, 1.177668, -0.9318, 1, 1, 1, 1, 1,
-0.01019559, 0.0005536263, -0.7983171, 1, 1, 1, 1, 1,
-0.01006015, -0.4874758, -1.867506, 1, 1, 1, 1, 1,
-0.009242665, 1.197685, -1.635312, 1, 1, 1, 1, 1,
-0.007485606, -1.836372, -3.2804, 1, 1, 1, 1, 1,
-0.006774123, -0.5998696, -3.722537, 1, 1, 1, 1, 1,
-0.003122068, 0.3165897, 1.315971, 1, 1, 1, 1, 1,
-0.002098565, -1.352442, -3.313136, 1, 1, 1, 1, 1,
-0.0005955439, 0.01445828, 0.09363522, 1, 1, 1, 1, 1,
0.000965476, -0.5170706, 4.975049, 1, 1, 1, 1, 1,
0.001603079, -1.19244, 4.85339, 0, 0, 1, 1, 1,
0.003484208, -0.7771851, 0.8880783, 1, 0, 0, 1, 1,
0.005765267, -0.1422635, 2.811458, 1, 0, 0, 1, 1,
0.007851915, 0.8997173, 0.6895867, 1, 0, 0, 1, 1,
0.01198699, 0.2607993, -0.4742013, 1, 0, 0, 1, 1,
0.01209627, 1.564024, 0.3043111, 1, 0, 0, 1, 1,
0.01376448, -0.9973806, 1.560926, 0, 0, 0, 1, 1,
0.01524452, -0.08920378, 1.770542, 0, 0, 0, 1, 1,
0.01594578, 0.02243316, 0.3706917, 0, 0, 0, 1, 1,
0.01762221, 0.798362, 1.03377, 0, 0, 0, 1, 1,
0.02003992, -1.22316, 4.092994, 0, 0, 0, 1, 1,
0.02315493, -0.4280795, 3.906967, 0, 0, 0, 1, 1,
0.02471522, 0.08717225, 0.5371203, 0, 0, 0, 1, 1,
0.02818106, 0.8348003, 0.01105065, 1, 1, 1, 1, 1,
0.02894396, -0.2106106, 3.02325, 1, 1, 1, 1, 1,
0.0328161, -0.1970299, 1.756034, 1, 1, 1, 1, 1,
0.03407659, 1.219433, 0.3776736, 1, 1, 1, 1, 1,
0.03548332, 0.1955072, 2.201056, 1, 1, 1, 1, 1,
0.04077622, 0.2188975, 0.4840026, 1, 1, 1, 1, 1,
0.04523245, -0.8462164, 3.028632, 1, 1, 1, 1, 1,
0.04597005, -0.7319967, 2.815854, 1, 1, 1, 1, 1,
0.04898219, 0.462995, -1.086224, 1, 1, 1, 1, 1,
0.04943534, -0.5534517, 4.354244, 1, 1, 1, 1, 1,
0.05383012, 0.8749268, -1.554276, 1, 1, 1, 1, 1,
0.0550975, 0.6744696, 1.176541, 1, 1, 1, 1, 1,
0.05570175, 1.38891, -0.02182732, 1, 1, 1, 1, 1,
0.0588428, 0.4208078, -0.1738747, 1, 1, 1, 1, 1,
0.0607289, -1.557981, 3.991574, 1, 1, 1, 1, 1,
0.06491362, 0.964079, 1.874483, 0, 0, 1, 1, 1,
0.06635091, 0.6228749, -1.175444, 1, 0, 0, 1, 1,
0.06767236, 1.003485, 1.732518, 1, 0, 0, 1, 1,
0.06981282, 1.165283, -1.651858, 1, 0, 0, 1, 1,
0.07086826, -0.387655, 2.657348, 1, 0, 0, 1, 1,
0.07559373, 0.8384475, 0.04850246, 1, 0, 0, 1, 1,
0.09691761, 0.5591055, -1.936392, 0, 0, 0, 1, 1,
0.1005643, -0.6622061, 3.654498, 0, 0, 0, 1, 1,
0.1031793, 1.088928, -0.3910248, 0, 0, 0, 1, 1,
0.1079731, -0.8308384, 3.691244, 0, 0, 0, 1, 1,
0.1106289, -0.7546936, 2.9202, 0, 0, 0, 1, 1,
0.1123078, 0.5067114, -1.167221, 0, 0, 0, 1, 1,
0.1170953, 1.821965, -0.6832535, 0, 0, 0, 1, 1,
0.1176447, 0.2585465, 0.3316712, 1, 1, 1, 1, 1,
0.1182907, -1.294359, 2.400695, 1, 1, 1, 1, 1,
0.119883, -0.509798, 3.231942, 1, 1, 1, 1, 1,
0.1212469, 0.6445121, 1.457444, 1, 1, 1, 1, 1,
0.1243613, -0.05298764, 3.387604, 1, 1, 1, 1, 1,
0.1249728, -0.8110459, 2.85015, 1, 1, 1, 1, 1,
0.1250236, -0.1963751, 2.533556, 1, 1, 1, 1, 1,
0.1291912, 0.5093817, 1.143208, 1, 1, 1, 1, 1,
0.1293264, 1.05674, -0.1127884, 1, 1, 1, 1, 1,
0.1323546, 0.07233699, 3.250458, 1, 1, 1, 1, 1,
0.1347501, 0.1110436, 0.2283136, 1, 1, 1, 1, 1,
0.1467773, 0.5440173, -0.07763153, 1, 1, 1, 1, 1,
0.1477766, -0.2233762, 2.561524, 1, 1, 1, 1, 1,
0.1484442, -1.07615, 1.342571, 1, 1, 1, 1, 1,
0.1500175, 0.01265202, 1.198865, 1, 1, 1, 1, 1,
0.1517127, -0.114078, 3.438941, 0, 0, 1, 1, 1,
0.1575347, 2.022133, -0.1687464, 1, 0, 0, 1, 1,
0.1604353, 1.360193, -0.827996, 1, 0, 0, 1, 1,
0.1607381, 0.3759668, -0.006453258, 1, 0, 0, 1, 1,
0.1608159, -1.059931, 2.66864, 1, 0, 0, 1, 1,
0.1723493, -0.4992661, 1.707341, 1, 0, 0, 1, 1,
0.1742951, -0.168152, 1.815301, 0, 0, 0, 1, 1,
0.1778694, 0.7957404, 0.8604031, 0, 0, 0, 1, 1,
0.1784473, 0.152206, 3.465491, 0, 0, 0, 1, 1,
0.181961, 0.4012822, 1.165913, 0, 0, 0, 1, 1,
0.1894955, -1.539036, 5.371269, 0, 0, 0, 1, 1,
0.1968101, -0.280175, 3.483742, 0, 0, 0, 1, 1,
0.1969602, 0.179021, 2.274756, 0, 0, 0, 1, 1,
0.2016956, 0.5957906, -0.7457647, 1, 1, 1, 1, 1,
0.2033406, 1.715651, 0.03162522, 1, 1, 1, 1, 1,
0.2035295, -0.3552073, 2.513846, 1, 1, 1, 1, 1,
0.2035775, -1.718806, 3.287838, 1, 1, 1, 1, 1,
0.2044914, -0.6293619, 2.082591, 1, 1, 1, 1, 1,
0.2052339, -0.6154161, 2.435004, 1, 1, 1, 1, 1,
0.2110134, -0.8979537, 2.212863, 1, 1, 1, 1, 1,
0.2189042, -0.7026841, 1.613925, 1, 1, 1, 1, 1,
0.2194802, 0.6923223, -0.5269728, 1, 1, 1, 1, 1,
0.2207443, 0.1787231, 0.4319904, 1, 1, 1, 1, 1,
0.2210838, 0.9922536, 2.266276, 1, 1, 1, 1, 1,
0.2213273, -1.211375, 4.222959, 1, 1, 1, 1, 1,
0.2254232, 0.8795349, 0.9300365, 1, 1, 1, 1, 1,
0.226696, 1.052301, 0.2542636, 1, 1, 1, 1, 1,
0.2297621, -0.8547516, 3.441474, 1, 1, 1, 1, 1,
0.2298916, -0.9350129, 3.067819, 0, 0, 1, 1, 1,
0.2300185, 0.2964792, 0.2468343, 1, 0, 0, 1, 1,
0.2305716, 0.6242968, 0.8248188, 1, 0, 0, 1, 1,
0.2399379, 1.033692, 1.715972, 1, 0, 0, 1, 1,
0.2421118, 1.808725, -0.7153382, 1, 0, 0, 1, 1,
0.2434267, 0.9827728, 0.6186267, 1, 0, 0, 1, 1,
0.2448075, -0.100309, 2.556845, 0, 0, 0, 1, 1,
0.2461621, 0.006811092, 1.377633, 0, 0, 0, 1, 1,
0.2535111, 1.462864, 1.611979, 0, 0, 0, 1, 1,
0.2539204, -0.4715196, 2.131701, 0, 0, 0, 1, 1,
0.2563245, 0.5150248, 0.07242698, 0, 0, 0, 1, 1,
0.2631018, -1.113007, 4.20699, 0, 0, 0, 1, 1,
0.268584, 0.240605, 2.040936, 0, 0, 0, 1, 1,
0.2690396, -1.731155, 3.12518, 1, 1, 1, 1, 1,
0.2717967, -0.0776763, 0.6078506, 1, 1, 1, 1, 1,
0.2821426, -1.854112, 1.910545, 1, 1, 1, 1, 1,
0.2889431, 0.5445264, -0.0645474, 1, 1, 1, 1, 1,
0.2947081, -0.6520745, 2.568299, 1, 1, 1, 1, 1,
0.3000703, -0.5537713, 2.511848, 1, 1, 1, 1, 1,
0.3020913, -1.553256, 4.355069, 1, 1, 1, 1, 1,
0.3069785, -1.222059, 2.578605, 1, 1, 1, 1, 1,
0.3179066, 0.8935252, 0.3412494, 1, 1, 1, 1, 1,
0.3180141, -0.1067128, 2.627289, 1, 1, 1, 1, 1,
0.3221978, 0.5327024, 1.05468, 1, 1, 1, 1, 1,
0.3232366, 0.3210238, 0.7767055, 1, 1, 1, 1, 1,
0.3245385, -0.9665588, 3.792422, 1, 1, 1, 1, 1,
0.3259805, 0.4010859, 0.6301989, 1, 1, 1, 1, 1,
0.3293649, 0.8234085, 0.9705089, 1, 1, 1, 1, 1,
0.3311898, 2.525067, -0.1510533, 0, 0, 1, 1, 1,
0.3356366, -1.890764, 3.664716, 1, 0, 0, 1, 1,
0.3419189, -0.06247295, 2.048499, 1, 0, 0, 1, 1,
0.3456177, -1.169717, 3.622799, 1, 0, 0, 1, 1,
0.3457155, 1.548501, -0.5512831, 1, 0, 0, 1, 1,
0.3464749, 0.5159127, -0.3737728, 1, 0, 0, 1, 1,
0.3471994, 0.5837539, 0.7497079, 0, 0, 0, 1, 1,
0.3477148, 0.801358, 1.717183, 0, 0, 0, 1, 1,
0.3505996, 1.677935, 0.9141028, 0, 0, 0, 1, 1,
0.3506702, 0.6000291, 1.04065, 0, 0, 0, 1, 1,
0.3534796, 0.1499189, 0.600531, 0, 0, 0, 1, 1,
0.3537308, -0.922911, 2.981454, 0, 0, 0, 1, 1,
0.3601974, -1.350816, 3.372451, 0, 0, 0, 1, 1,
0.3632788, -0.2014747, 1.026531, 1, 1, 1, 1, 1,
0.3672352, -1.672552, 0.9998016, 1, 1, 1, 1, 1,
0.368113, -0.05276721, 2.280448, 1, 1, 1, 1, 1,
0.3715498, -1.226187, 2.176206, 1, 1, 1, 1, 1,
0.3732332, -1.039937, 2.803632, 1, 1, 1, 1, 1,
0.373253, 1.106065, 0.2042478, 1, 1, 1, 1, 1,
0.3778694, 0.4017826, -0.6888295, 1, 1, 1, 1, 1,
0.3805237, 0.3581987, 0.2266016, 1, 1, 1, 1, 1,
0.3822223, -0.02570849, 0.9152229, 1, 1, 1, 1, 1,
0.3828459, -1.097534, 3.043001, 1, 1, 1, 1, 1,
0.3833262, 1.08069, 0.1203026, 1, 1, 1, 1, 1,
0.3862284, -1.333778, 0.9764677, 1, 1, 1, 1, 1,
0.3929928, 0.8755292, 0.09215009, 1, 1, 1, 1, 1,
0.3980976, -0.7875482, 3.593788, 1, 1, 1, 1, 1,
0.3999602, -0.3239833, 1.850904, 1, 1, 1, 1, 1,
0.4062974, 0.5577925, 0.5987152, 0, 0, 1, 1, 1,
0.4084127, -0.2946356, 0.8027087, 1, 0, 0, 1, 1,
0.410415, -0.09668846, 2.510563, 1, 0, 0, 1, 1,
0.4203717, -0.8854283, 2.481842, 1, 0, 0, 1, 1,
0.4211042, 1.197196, 1.153823, 1, 0, 0, 1, 1,
0.4226649, 0.3625516, 0.5672575, 1, 0, 0, 1, 1,
0.4260726, 0.578222, 1.64615, 0, 0, 0, 1, 1,
0.4347803, -1.611772, 2.232809, 0, 0, 0, 1, 1,
0.4357512, -0.2249346, 0.5946621, 0, 0, 0, 1, 1,
0.4376407, 1.572045, 2.166664, 0, 0, 0, 1, 1,
0.4417742, 1.006707, 1.6535, 0, 0, 0, 1, 1,
0.4458967, -2.16181, 2.256789, 0, 0, 0, 1, 1,
0.453902, -0.7950507, 1.65434, 0, 0, 0, 1, 1,
0.4570255, 0.5934545, -0.6923203, 1, 1, 1, 1, 1,
0.4588958, 1.029006, 0.2657204, 1, 1, 1, 1, 1,
0.4619364, 1.262656, -0.1239282, 1, 1, 1, 1, 1,
0.4632724, -0.1742388, 3.647707, 1, 1, 1, 1, 1,
0.4633915, -0.346698, 1.898548, 1, 1, 1, 1, 1,
0.4647851, -0.2663094, 1.931308, 1, 1, 1, 1, 1,
0.4651666, -0.08367515, 2.336916, 1, 1, 1, 1, 1,
0.4664552, 1.034507, -0.6769338, 1, 1, 1, 1, 1,
0.4666725, -0.5487474, 3.016592, 1, 1, 1, 1, 1,
0.474046, 1.085984, 2.702749, 1, 1, 1, 1, 1,
0.4741458, 0.1435153, 1.639282, 1, 1, 1, 1, 1,
0.4769663, -0.05671154, 0.08675402, 1, 1, 1, 1, 1,
0.4777444, -0.1659313, 1.880673, 1, 1, 1, 1, 1,
0.4790814, -1.769688, 2.899984, 1, 1, 1, 1, 1,
0.4806782, -1.372584, 2.451238, 1, 1, 1, 1, 1,
0.4809712, 0.02642953, 2.527093, 0, 0, 1, 1, 1,
0.4825587, -0.7790993, 4.62218, 1, 0, 0, 1, 1,
0.4878123, -0.9121177, 3.162503, 1, 0, 0, 1, 1,
0.4948768, -1.833991, 3.965059, 1, 0, 0, 1, 1,
0.4959534, 0.7526231, 0.7251531, 1, 0, 0, 1, 1,
0.4962403, -0.3938878, 2.869435, 1, 0, 0, 1, 1,
0.5014828, 0.4839964, -0.1879804, 0, 0, 0, 1, 1,
0.503001, 1.2137, 1.230724, 0, 0, 0, 1, 1,
0.5030692, 0.2187653, 0.8790079, 0, 0, 0, 1, 1,
0.5031739, 1.201619, 1.654581, 0, 0, 0, 1, 1,
0.5064006, 0.6194032, 0.9081686, 0, 0, 0, 1, 1,
0.5080412, -1.109821, 1.93971, 0, 0, 0, 1, 1,
0.5138587, -1.173573, 3.276437, 0, 0, 0, 1, 1,
0.516308, 1.436439, -1.386136, 1, 1, 1, 1, 1,
0.5174109, 0.02995361, 1.177377, 1, 1, 1, 1, 1,
0.5243939, 0.05224464, 1.996355, 1, 1, 1, 1, 1,
0.5244606, 0.7025197, 1.665975, 1, 1, 1, 1, 1,
0.5338523, 0.816547, 0.7279202, 1, 1, 1, 1, 1,
0.5345542, 2.316257, 0.1726291, 1, 1, 1, 1, 1,
0.534591, 0.1793969, -0.2320324, 1, 1, 1, 1, 1,
0.5348638, 1.779466, -0.1808753, 1, 1, 1, 1, 1,
0.5359295, -0.4782831, 1.4158, 1, 1, 1, 1, 1,
0.5373544, -0.9377462, 2.51656, 1, 1, 1, 1, 1,
0.537835, 0.07573739, 0.5681269, 1, 1, 1, 1, 1,
0.5397022, 0.1281412, 2.678693, 1, 1, 1, 1, 1,
0.5410742, 0.7987754, 2.531841, 1, 1, 1, 1, 1,
0.5436661, 1.291362, 0.7632819, 1, 1, 1, 1, 1,
0.5448732, 0.1954126, 3.076482, 1, 1, 1, 1, 1,
0.5451221, 1.247108, -1.340148, 0, 0, 1, 1, 1,
0.5478816, -0.8839017, 3.099499, 1, 0, 0, 1, 1,
0.5480857, -0.5720789, 2.167403, 1, 0, 0, 1, 1,
0.5487773, 0.4630637, 1.046193, 1, 0, 0, 1, 1,
0.5522771, -1.464406, 0.5731795, 1, 0, 0, 1, 1,
0.5523713, -0.7787471, 3.402654, 1, 0, 0, 1, 1,
0.5538363, -0.7928968, 1.434101, 0, 0, 0, 1, 1,
0.5561246, 0.6420213, -1.322752, 0, 0, 0, 1, 1,
0.5603472, -1.492984, 2.189778, 0, 0, 0, 1, 1,
0.56331, 2.026613, -0.2235477, 0, 0, 0, 1, 1,
0.5658551, -0.09156051, 2.244965, 0, 0, 0, 1, 1,
0.5666232, -0.3360502, 2.429945, 0, 0, 0, 1, 1,
0.5784649, -1.364788, 1.907672, 0, 0, 0, 1, 1,
0.5829076, -0.6798503, 1.182771, 1, 1, 1, 1, 1,
0.58351, 1.180534, -0.2275825, 1, 1, 1, 1, 1,
0.5912831, 1.048846, 0.1429905, 1, 1, 1, 1, 1,
0.5947062, -0.4177969, 1.19103, 1, 1, 1, 1, 1,
0.6014935, 0.8115906, 0.8615491, 1, 1, 1, 1, 1,
0.6027005, 0.2053104, 1.129106, 1, 1, 1, 1, 1,
0.603546, 0.9903752, 1.393863, 1, 1, 1, 1, 1,
0.6083983, 2.235399, -0.850354, 1, 1, 1, 1, 1,
0.6102011, -0.3777067, 2.177509, 1, 1, 1, 1, 1,
0.6120986, 1.522702, 0.5132003, 1, 1, 1, 1, 1,
0.6132312, -0.5764023, 2.594288, 1, 1, 1, 1, 1,
0.6148934, -0.8809311, -0.07821246, 1, 1, 1, 1, 1,
0.6185207, -0.2433639, 3.846278, 1, 1, 1, 1, 1,
0.6206679, 1.052219, 0.2627152, 1, 1, 1, 1, 1,
0.622588, 1.867119, 0.1829547, 1, 1, 1, 1, 1,
0.6229418, -1.251215, 2.403336, 0, 0, 1, 1, 1,
0.6256353, 0.8418353, -0.4026869, 1, 0, 0, 1, 1,
0.6307289, 0.09188212, 1.263563, 1, 0, 0, 1, 1,
0.6311942, -0.4167192, -0.3030641, 1, 0, 0, 1, 1,
0.6334346, 0.2170029, 1.589472, 1, 0, 0, 1, 1,
0.6392259, 0.8272023, 3.197104, 1, 0, 0, 1, 1,
0.6401206, -0.07021653, 1.152032, 0, 0, 0, 1, 1,
0.6425999, 0.5708421, 1.549772, 0, 0, 0, 1, 1,
0.644339, 0.1948988, 0.3545268, 0, 0, 0, 1, 1,
0.6448405, 0.8367702, 1.565177, 0, 0, 0, 1, 1,
0.6470824, 2.695632, 0.4546655, 0, 0, 0, 1, 1,
0.651832, 0.1484099, 1.389279, 0, 0, 0, 1, 1,
0.6518808, -0.120016, 2.834558, 0, 0, 0, 1, 1,
0.6558214, -2.368381, 1.986159, 1, 1, 1, 1, 1,
0.6563665, -1.719497, 3.524223, 1, 1, 1, 1, 1,
0.6576208, 0.1505389, -0.6167091, 1, 1, 1, 1, 1,
0.6643032, 0.2759803, 0.3055352, 1, 1, 1, 1, 1,
0.6670483, 0.380318, 0.09670226, 1, 1, 1, 1, 1,
0.6675186, -0.07346899, 2.578769, 1, 1, 1, 1, 1,
0.6714838, -0.3455351, 2.361168, 1, 1, 1, 1, 1,
0.672249, 0.5455257, -0.1624395, 1, 1, 1, 1, 1,
0.6745857, -0.8851764, 3.461784, 1, 1, 1, 1, 1,
0.6794556, 0.6387272, 0.4442562, 1, 1, 1, 1, 1,
0.6807809, -0.3748651, 2.659608, 1, 1, 1, 1, 1,
0.6842073, 0.2966547, 0.4772384, 1, 1, 1, 1, 1,
0.6852328, -1.567708, 0.67157, 1, 1, 1, 1, 1,
0.6895497, -0.8864348, 3.26653, 1, 1, 1, 1, 1,
0.6914849, 1.551246, 1.144538, 1, 1, 1, 1, 1,
0.6936214, -1.732118, 2.608604, 0, 0, 1, 1, 1,
0.6951638, 0.7537326, -0.0915079, 1, 0, 0, 1, 1,
0.6967455, 0.4380567, 1.099029, 1, 0, 0, 1, 1,
0.698964, -0.552316, 0.3837453, 1, 0, 0, 1, 1,
0.7003204, -0.8508752, 4.326079, 1, 0, 0, 1, 1,
0.7050433, -1.053231, 3.122371, 1, 0, 0, 1, 1,
0.7095495, 1.909001, -0.697049, 0, 0, 0, 1, 1,
0.7104178, -1.194521, 2.838845, 0, 0, 0, 1, 1,
0.7109023, -1.496921, 1.052167, 0, 0, 0, 1, 1,
0.7147838, 1.757149, 1.221399, 0, 0, 0, 1, 1,
0.7193796, -0.9014181, 1.306166, 0, 0, 0, 1, 1,
0.7288003, 1.10568, -0.4253929, 0, 0, 0, 1, 1,
0.7334861, -0.4257946, 2.655721, 0, 0, 0, 1, 1,
0.7344267, 0.971532, 1.281071, 1, 1, 1, 1, 1,
0.7369502, 0.6488068, 1.309001, 1, 1, 1, 1, 1,
0.7373924, -0.730002, 4.531696, 1, 1, 1, 1, 1,
0.7439341, -0.8493203, 0.1726276, 1, 1, 1, 1, 1,
0.7442099, 0.9604256, 0.5861543, 1, 1, 1, 1, 1,
0.7457788, 1.821388, 0.4719656, 1, 1, 1, 1, 1,
0.7470288, -0.9121885, 3.344146, 1, 1, 1, 1, 1,
0.7484251, -1.693539, 3.417603, 1, 1, 1, 1, 1,
0.7486935, 0.1835861, 1.045076, 1, 1, 1, 1, 1,
0.7661607, -0.01416903, 2.15308, 1, 1, 1, 1, 1,
0.7665517, 2.613158, -0.307281, 1, 1, 1, 1, 1,
0.7752779, 1.394595, 0.7125744, 1, 1, 1, 1, 1,
0.7772678, 0.2853053, 1.584396, 1, 1, 1, 1, 1,
0.7869284, -1.078302, 3.852212, 1, 1, 1, 1, 1,
0.7879975, 0.4698142, -0.2095128, 1, 1, 1, 1, 1,
0.7892612, -1.133159, 2.921298, 0, 0, 1, 1, 1,
0.7966346, 3.183687, 0.5379409, 1, 0, 0, 1, 1,
0.7972299, 0.7366505, 0.4892044, 1, 0, 0, 1, 1,
0.8227253, -0.9103788, 2.076773, 1, 0, 0, 1, 1,
0.8231759, 1.979748, -1.100824, 1, 0, 0, 1, 1,
0.8249832, 1.085556, 0.7322932, 1, 0, 0, 1, 1,
0.8254405, -0.2722772, 2.341002, 0, 0, 0, 1, 1,
0.8276591, 0.1308861, 0.684282, 0, 0, 0, 1, 1,
0.8448848, 0.3998775, 1.578263, 0, 0, 0, 1, 1,
0.8453463, -0.4083976, 1.987208, 0, 0, 0, 1, 1,
0.8479077, -0.02492774, 2.164477, 0, 0, 0, 1, 1,
0.856923, 0.4820389, 0.6806641, 0, 0, 0, 1, 1,
0.8620678, 1.689082, 0.8165476, 0, 0, 0, 1, 1,
0.8664681, 0.0862224, 0.7007574, 1, 1, 1, 1, 1,
0.8696085, 0.955622, 0.2297407, 1, 1, 1, 1, 1,
0.8710142, -0.5059952, 1.197781, 1, 1, 1, 1, 1,
0.8725826, -1.233449, 2.458838, 1, 1, 1, 1, 1,
0.8733045, -0.287556, 1.117919, 1, 1, 1, 1, 1,
0.8818816, -1.047289, 2.595925, 1, 1, 1, 1, 1,
0.8828751, -0.2023387, -0.2855785, 1, 1, 1, 1, 1,
0.88732, 0.007560507, 0.1584906, 1, 1, 1, 1, 1,
0.8895136, 0.3215324, 2.134956, 1, 1, 1, 1, 1,
0.8931999, -0.3882907, 1.504735, 1, 1, 1, 1, 1,
0.8953655, 1.632532, 0.3694643, 1, 1, 1, 1, 1,
0.8958037, 1.186997, 0.5656176, 1, 1, 1, 1, 1,
0.8961334, 0.965702, -0.7652606, 1, 1, 1, 1, 1,
0.8998769, -1.448622, 1.737441, 1, 1, 1, 1, 1,
0.9009976, 2.418487, 0.2979605, 1, 1, 1, 1, 1,
0.906323, 0.6428551, 0.7452455, 0, 0, 1, 1, 1,
0.913161, 0.07023142, 0.5723386, 1, 0, 0, 1, 1,
0.9148118, 1.28503, 2.671949, 1, 0, 0, 1, 1,
0.9155756, -0.660571, 2.708581, 1, 0, 0, 1, 1,
0.9189661, -0.4855582, 2.732992, 1, 0, 0, 1, 1,
0.9268401, -1.884634, 2.376569, 1, 0, 0, 1, 1,
0.9291584, 1.120758, -0.8724091, 0, 0, 0, 1, 1,
0.9299837, 0.07400332, 1.785203, 0, 0, 0, 1, 1,
0.933877, -1.557128, 2.600975, 0, 0, 0, 1, 1,
0.9397408, 0.191044, 1.971634, 0, 0, 0, 1, 1,
0.9445814, 0.2444975, 1.199454, 0, 0, 0, 1, 1,
0.9474435, -1.404536, 2.576694, 0, 0, 0, 1, 1,
0.9610626, 0.1130623, 0.5477815, 0, 0, 0, 1, 1,
0.9615185, 0.8882213, 0.4124438, 1, 1, 1, 1, 1,
0.9628064, -0.4139386, 1.2022, 1, 1, 1, 1, 1,
0.963983, 1.764426, -0.978808, 1, 1, 1, 1, 1,
0.9641819, -0.1186779, 3.174304, 1, 1, 1, 1, 1,
0.9667689, 0.6596803, 0.7328166, 1, 1, 1, 1, 1,
0.9716159, 0.4447178, -0.03444918, 1, 1, 1, 1, 1,
0.9724731, 0.3317517, 2.184933, 1, 1, 1, 1, 1,
0.9753766, 1.186242, 0.5607781, 1, 1, 1, 1, 1,
0.9766399, 0.3808258, 1.797664, 1, 1, 1, 1, 1,
0.9773683, -1.745494, 3.375108, 1, 1, 1, 1, 1,
0.9872603, -1.448986, 1.38264, 1, 1, 1, 1, 1,
0.9893494, -1.241608, 1.825156, 1, 1, 1, 1, 1,
1.004293, 0.5590167, 1.164665, 1, 1, 1, 1, 1,
1.008245, -1.357383, 0.7602687, 1, 1, 1, 1, 1,
1.009961, -1.105501, 2.231986, 1, 1, 1, 1, 1,
1.01163, 1.454803, -0.4069652, 0, 0, 1, 1, 1,
1.026913, 0.4009628, 1.564093, 1, 0, 0, 1, 1,
1.028083, 0.0028925, 3.101563, 1, 0, 0, 1, 1,
1.038093, 1.560538, 2.142992, 1, 0, 0, 1, 1,
1.048842, 0.04265982, 2.877438, 1, 0, 0, 1, 1,
1.05463, 0.2069337, 2.248366, 1, 0, 0, 1, 1,
1.060101, 1.135684, 1.618949, 0, 0, 0, 1, 1,
1.062328, -0.5495725, 2.29778, 0, 0, 0, 1, 1,
1.064021, 0.9609577, 0.1786908, 0, 0, 0, 1, 1,
1.070017, -0.0297395, 1.50507, 0, 0, 0, 1, 1,
1.071047, -0.2489409, 2.004357, 0, 0, 0, 1, 1,
1.072129, 0.2941753, 1.473629, 0, 0, 0, 1, 1,
1.072656, -0.1760585, 1.487636, 0, 0, 0, 1, 1,
1.090105, -2.990676, 3.086036, 1, 1, 1, 1, 1,
1.099928, -0.3584799, 2.247525, 1, 1, 1, 1, 1,
1.104721, -1.270812, 1.385358, 1, 1, 1, 1, 1,
1.105451, 0.6411961, -0.9893224, 1, 1, 1, 1, 1,
1.108661, -0.07191351, 1.366263, 1, 1, 1, 1, 1,
1.130644, 1.879452, 1.567723, 1, 1, 1, 1, 1,
1.135008, 0.4776711, 3.190196, 1, 1, 1, 1, 1,
1.144692, 0.2979952, 1.712521, 1, 1, 1, 1, 1,
1.146398, -1.597637, 1.658203, 1, 1, 1, 1, 1,
1.14676, -1.02694, 2.024889, 1, 1, 1, 1, 1,
1.153533, 0.9723756, 1.725892, 1, 1, 1, 1, 1,
1.163332, -0.209858, 1.143509, 1, 1, 1, 1, 1,
1.168354, 0.7110231, 1.801835, 1, 1, 1, 1, 1,
1.168656, 0.9489582, -0.7178479, 1, 1, 1, 1, 1,
1.174397, 1.139407, -0.2319131, 1, 1, 1, 1, 1,
1.174981, -0.1096835, 2.610768, 0, 0, 1, 1, 1,
1.180505, 1.08481, 1.208315, 1, 0, 0, 1, 1,
1.183842, 0.5821645, 1.676312, 1, 0, 0, 1, 1,
1.185454, -1.13953, 1.630029, 1, 0, 0, 1, 1,
1.186576, -0.7273123, 1.670673, 1, 0, 0, 1, 1,
1.186894, -2.161396, 3.43343, 1, 0, 0, 1, 1,
1.188258, -0.1052704, 2.313254, 0, 0, 0, 1, 1,
1.189296, -0.9049712, 1.665785, 0, 0, 0, 1, 1,
1.200949, 0.3992824, 0.8628551, 0, 0, 0, 1, 1,
1.201961, 0.6574435, 1.2827, 0, 0, 0, 1, 1,
1.202659, -0.4647723, 0.7310174, 0, 0, 0, 1, 1,
1.204694, 0.5068737, 0.5614331, 0, 0, 0, 1, 1,
1.20505, -0.1139578, 2.693018, 0, 0, 0, 1, 1,
1.210963, -2.866388, 2.108082, 1, 1, 1, 1, 1,
1.213685, 0.2184391, 2.330178, 1, 1, 1, 1, 1,
1.213842, 0.03831582, 1.489837, 1, 1, 1, 1, 1,
1.214226, 1.00294, 2.128832, 1, 1, 1, 1, 1,
1.21826, -0.2144603, 2.058195, 1, 1, 1, 1, 1,
1.223525, 0.4180263, 0.06940416, 1, 1, 1, 1, 1,
1.227456, 0.2212455, 0.7692852, 1, 1, 1, 1, 1,
1.22751, 0.4420778, 0.8302187, 1, 1, 1, 1, 1,
1.229154, 0.258755, 2.72542, 1, 1, 1, 1, 1,
1.232072, 1.118896, 0.3047432, 1, 1, 1, 1, 1,
1.241594, -1.46037, 3.721992, 1, 1, 1, 1, 1,
1.25089, 0.3417729, 1.18227, 1, 1, 1, 1, 1,
1.258104, -2.033612, 2.995694, 1, 1, 1, 1, 1,
1.277888, -0.5640074, 1.805489, 1, 1, 1, 1, 1,
1.296965, -1.389181, 2.80828, 1, 1, 1, 1, 1,
1.301183, 2.624054, -0.4577154, 0, 0, 1, 1, 1,
1.306824, 0.3208513, 0.68643, 1, 0, 0, 1, 1,
1.308349, 0.4320809, 0.3557255, 1, 0, 0, 1, 1,
1.313967, -1.498824, 1.500986, 1, 0, 0, 1, 1,
1.318543, 0.1390837, 1.871194, 1, 0, 0, 1, 1,
1.319274, 1.569715, 1.178915, 1, 0, 0, 1, 1,
1.327345, 1.883105, -0.7317664, 0, 0, 0, 1, 1,
1.32771, -0.3211316, 0.944307, 0, 0, 0, 1, 1,
1.344433, -0.4927313, 2.184565, 0, 0, 0, 1, 1,
1.35564, 0.7018638, -0.0003993304, 0, 0, 0, 1, 1,
1.35869, -0.01883117, 1.378348, 0, 0, 0, 1, 1,
1.358822, 0.03273708, 2.8463, 0, 0, 0, 1, 1,
1.362244, -1.435418, 1.243822, 0, 0, 0, 1, 1,
1.362811, 0.0576314, 1.154731, 1, 1, 1, 1, 1,
1.37443, 0.2338504, 2.299726, 1, 1, 1, 1, 1,
1.378716, -0.5553428, -0.04355952, 1, 1, 1, 1, 1,
1.388684, 0.9630654, 1.74321, 1, 1, 1, 1, 1,
1.392443, -1.478742, 1.810529, 1, 1, 1, 1, 1,
1.398018, -0.0807116, 1.613386, 1, 1, 1, 1, 1,
1.403457, -1.378833, 3.336976, 1, 1, 1, 1, 1,
1.421276, -0.8978844, 0.6404026, 1, 1, 1, 1, 1,
1.442703, 0.1093802, 2.214138, 1, 1, 1, 1, 1,
1.453954, 0.1047279, 0.3736551, 1, 1, 1, 1, 1,
1.457207, 1.543544, 1.105398, 1, 1, 1, 1, 1,
1.458727, -1.006722, 1.057641, 1, 1, 1, 1, 1,
1.460451, 0.2622084, 0.7455895, 1, 1, 1, 1, 1,
1.464477, -0.1217999, 1.289241, 1, 1, 1, 1, 1,
1.470123, 1.391651, 0.6721153, 1, 1, 1, 1, 1,
1.472297, 0.7401003, 0.3634611, 0, 0, 1, 1, 1,
1.476482, -0.7996597, 2.250034, 1, 0, 0, 1, 1,
1.485057, -0.7172549, 1.287638, 1, 0, 0, 1, 1,
1.490003, -1.044289, 3.008626, 1, 0, 0, 1, 1,
1.490022, 0.02231067, 1.423398, 1, 0, 0, 1, 1,
1.496221, 0.2618793, 0.258118, 1, 0, 0, 1, 1,
1.500967, -0.3414589, 2.523596, 0, 0, 0, 1, 1,
1.504546, -0.0418689, 0.9829162, 0, 0, 0, 1, 1,
1.504617, 1.250792, 2.888618, 0, 0, 0, 1, 1,
1.510811, -2.087853, 2.345623, 0, 0, 0, 1, 1,
1.511775, 0.08037036, -0.1708402, 0, 0, 0, 1, 1,
1.514223, -0.3792981, 1.240249, 0, 0, 0, 1, 1,
1.514468, -2.355253, 2.46435, 0, 0, 0, 1, 1,
1.515037, -0.1092293, 2.256443, 1, 1, 1, 1, 1,
1.516844, 0.6133401, 1.428768, 1, 1, 1, 1, 1,
1.517042, -0.4299923, 1.072574, 1, 1, 1, 1, 1,
1.5206, 0.5021576, 1.673554, 1, 1, 1, 1, 1,
1.529153, -1.839942, 1.967069, 1, 1, 1, 1, 1,
1.535536, -0.5617214, 2.750441, 1, 1, 1, 1, 1,
1.557662, -0.4648649, 1.557098, 1, 1, 1, 1, 1,
1.562449, -0.1823679, 1.014168, 1, 1, 1, 1, 1,
1.567269, -0.3653256, 2.210138, 1, 1, 1, 1, 1,
1.587198, -0.09337971, 1.364157, 1, 1, 1, 1, 1,
1.594831, -0.6603909, 1.436679, 1, 1, 1, 1, 1,
1.600864, 0.009933813, 1.951765, 1, 1, 1, 1, 1,
1.606909, -0.6822183, 0.4999003, 1, 1, 1, 1, 1,
1.622755, -0.290156, 1.720018, 1, 1, 1, 1, 1,
1.628226, 0.1989798, 1.633026, 1, 1, 1, 1, 1,
1.65814, -1.259528, 3.414078, 0, 0, 1, 1, 1,
1.663509, 0.01748884, 0.7617512, 1, 0, 0, 1, 1,
1.669443, -0.7340277, 3.081422, 1, 0, 0, 1, 1,
1.6914, 0.8253627, 0.2887843, 1, 0, 0, 1, 1,
1.70822, -1.02378, 1.381181, 1, 0, 0, 1, 1,
1.710418, -0.4525901, 1.686402, 1, 0, 0, 1, 1,
1.719581, 0.5269665, 2.108843, 0, 0, 0, 1, 1,
1.737377, 0.1340864, 2.506106, 0, 0, 0, 1, 1,
1.750169, 0.8054063, 0.487613, 0, 0, 0, 1, 1,
1.757241, -2.093915, 2.79276, 0, 0, 0, 1, 1,
1.772911, 0.07317524, 2.012506, 0, 0, 0, 1, 1,
1.774082, -2.307875, 3.154068, 0, 0, 0, 1, 1,
1.778935, -0.1791195, 3.347554, 0, 0, 0, 1, 1,
1.803789, -0.9414666, 1.108185, 1, 1, 1, 1, 1,
1.807797, -0.5687296, -0.6289382, 1, 1, 1, 1, 1,
1.81692, -1.646108, 5.558537, 1, 1, 1, 1, 1,
1.834749, -2.334916, 2.495697, 1, 1, 1, 1, 1,
1.851136, -0.2305433, 2.691376, 1, 1, 1, 1, 1,
1.86541, 2.07474, 0.5819399, 1, 1, 1, 1, 1,
1.872554, 0.2617283, 0.3634715, 1, 1, 1, 1, 1,
1.876602, -0.1044876, 0.8438499, 1, 1, 1, 1, 1,
1.877822, -0.7090693, 1.690133, 1, 1, 1, 1, 1,
1.909354, -0.1381425, 0.3190693, 1, 1, 1, 1, 1,
1.920342, 0.2493043, 0.5677443, 1, 1, 1, 1, 1,
1.928446, -0.1428238, 4.172459, 1, 1, 1, 1, 1,
1.965626, 0.4281759, 0.6807359, 1, 1, 1, 1, 1,
1.986632, 0.3161544, 1.245712, 1, 1, 1, 1, 1,
2.017748, -1.138413, 1.733049, 1, 1, 1, 1, 1,
2.059454, 0.1659446, -0.4879122, 0, 0, 1, 1, 1,
2.105344, 0.05705146, 1.015881, 1, 0, 0, 1, 1,
2.119619, -0.4116088, 0.1999009, 1, 0, 0, 1, 1,
2.156275, 0.2767993, 1.49287, 1, 0, 0, 1, 1,
2.237115, -0.4313408, 0.6650963, 1, 0, 0, 1, 1,
2.326992, 1.737939, 0.5672243, 1, 0, 0, 1, 1,
2.362767, -0.5480606, 2.689471, 0, 0, 0, 1, 1,
2.402963, -0.4135691, 2.475911, 0, 0, 0, 1, 1,
2.422652, 1.156622, 1.881169, 0, 0, 0, 1, 1,
2.452798, 0.4340844, 0.9351583, 0, 0, 0, 1, 1,
2.508839, -0.2323629, 0.4213332, 0, 0, 0, 1, 1,
2.601009, 0.9937677, 0.3114192, 0, 0, 0, 1, 1,
2.621257, 1.458916, 1.386187, 0, 0, 0, 1, 1,
2.628002, 0.01870614, 1.056616, 1, 1, 1, 1, 1,
2.632922, 0.9107386, 1.033062, 1, 1, 1, 1, 1,
2.690631, -0.9854153, 2.639142, 1, 1, 1, 1, 1,
2.739915, 0.7100133, 3.495527, 1, 1, 1, 1, 1,
2.77949, 1.170032, 1.807095, 1, 1, 1, 1, 1,
3.141518, 0.7862749, 1.737016, 1, 1, 1, 1, 1,
3.404484, 1.441424, -0.9318873, 1, 1, 1, 1, 1
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
var radius = 9.785693;
var distance = 34.37183;
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
mvMatrix.translate( -0.1465778, -0.09650576, 0.09770131 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37183);
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
