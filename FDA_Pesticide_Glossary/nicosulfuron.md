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
-2.987351, 2.002904, -1.633814, 1, 0, 0, 1,
-2.848916, -1.0748, -2.61452, 1, 0.007843138, 0, 1,
-2.725496, -1.904843, -2.757618, 1, 0.01176471, 0, 1,
-2.635946, 2.596744, -0.2347976, 1, 0.01960784, 0, 1,
-2.603968, 1.062553, -1.213304, 1, 0.02352941, 0, 1,
-2.582844, 0.2084747, -0.2555829, 1, 0.03137255, 0, 1,
-2.361978, 0.3796487, -2.006296, 1, 0.03529412, 0, 1,
-2.305525, -0.7759879, -2.332987, 1, 0.04313726, 0, 1,
-2.302177, -0.6914497, -1.467054, 1, 0.04705882, 0, 1,
-2.261002, -0.9183757, -2.436707, 1, 0.05490196, 0, 1,
-2.230212, 0.2335692, -3.022023, 1, 0.05882353, 0, 1,
-2.229281, 1.127616, -0.1172835, 1, 0.06666667, 0, 1,
-2.109139, 0.5239121, -1.191627, 1, 0.07058824, 0, 1,
-2.042018, 1.002141, -0.8602076, 1, 0.07843138, 0, 1,
-2.02566, -0.3794979, -2.013179, 1, 0.08235294, 0, 1,
-1.986241, -0.1329663, -1.256502, 1, 0.09019608, 0, 1,
-1.97227, 3.265737, -0.9985376, 1, 0.09411765, 0, 1,
-1.957438, 0.07832773, -1.724448, 1, 0.1019608, 0, 1,
-1.947823, 1.028457, -1.990284, 1, 0.1098039, 0, 1,
-1.940486, 1.974102, -0.6234368, 1, 0.1137255, 0, 1,
-1.94042, -0.4613349, -1.156223, 1, 0.1215686, 0, 1,
-1.935179, -0.309266, -2.388173, 1, 0.1254902, 0, 1,
-1.930154, 0.09003101, -1.374725, 1, 0.1333333, 0, 1,
-1.923675, -0.636585, -3.78511, 1, 0.1372549, 0, 1,
-1.916355, -2.36499, -1.821443, 1, 0.145098, 0, 1,
-1.881489, 0.6365758, -1.926475, 1, 0.1490196, 0, 1,
-1.879704, 0.6906887, -0.904134, 1, 0.1568628, 0, 1,
-1.849683, 2.352842, -2.109272, 1, 0.1607843, 0, 1,
-1.848414, 0.06793854, 0.4081239, 1, 0.1686275, 0, 1,
-1.827642, -1.466249, -0.3225542, 1, 0.172549, 0, 1,
-1.82107, -0.8571352, -1.520923, 1, 0.1803922, 0, 1,
-1.819184, 0.4761608, -1.281706, 1, 0.1843137, 0, 1,
-1.804525, -0.7485774, -1.956155, 1, 0.1921569, 0, 1,
-1.784613, 0.3931584, -1.547131, 1, 0.1960784, 0, 1,
-1.777452, 0.5541205, -2.455504, 1, 0.2039216, 0, 1,
-1.771798, -0.5035053, -1.063767, 1, 0.2117647, 0, 1,
-1.69762, -0.8924912, -4.248632, 1, 0.2156863, 0, 1,
-1.695686, 0.4160989, -0.08364839, 1, 0.2235294, 0, 1,
-1.692939, 0.2797112, -1.235704, 1, 0.227451, 0, 1,
-1.680802, -0.2969137, -2.402647, 1, 0.2352941, 0, 1,
-1.665378, -1.361768, -2.664091, 1, 0.2392157, 0, 1,
-1.661077, -0.8086281, -1.178763, 1, 0.2470588, 0, 1,
-1.659542, 0.8477554, -1.152702, 1, 0.2509804, 0, 1,
-1.632039, 0.6366213, -1.016864, 1, 0.2588235, 0, 1,
-1.626045, 0.4174032, -1.958847, 1, 0.2627451, 0, 1,
-1.62451, -1.650275, -1.705349, 1, 0.2705882, 0, 1,
-1.623942, 0.1896158, -2.303837, 1, 0.2745098, 0, 1,
-1.623161, -0.8400647, -1.701095, 1, 0.282353, 0, 1,
-1.62225, 0.4002238, 0.008224221, 1, 0.2862745, 0, 1,
-1.620399, -0.6107793, -4.267194, 1, 0.2941177, 0, 1,
-1.619847, 0.2589093, -0.3739522, 1, 0.3019608, 0, 1,
-1.612201, 1.126166, -1.576135, 1, 0.3058824, 0, 1,
-1.608882, -0.9089287, -3.537563, 1, 0.3137255, 0, 1,
-1.606288, -1.308006, -3.391563, 1, 0.3176471, 0, 1,
-1.599739, -0.3786855, -1.036879, 1, 0.3254902, 0, 1,
-1.598775, 0.7907084, -0.3477297, 1, 0.3294118, 0, 1,
-1.596291, -1.114872, -1.645696, 1, 0.3372549, 0, 1,
-1.585637, -1.137768, -3.559236, 1, 0.3411765, 0, 1,
-1.584536, 1.077046, -2.061061, 1, 0.3490196, 0, 1,
-1.563272, 1.782761, -0.03941601, 1, 0.3529412, 0, 1,
-1.552814, -0.02156015, -1.172596, 1, 0.3607843, 0, 1,
-1.552637, 0.5313984, -2.54011, 1, 0.3647059, 0, 1,
-1.550257, -0.6636443, -1.345448, 1, 0.372549, 0, 1,
-1.546061, -2.339272, -3.988604, 1, 0.3764706, 0, 1,
-1.545558, -0.1790108, -1.79297, 1, 0.3843137, 0, 1,
-1.531679, -0.07438415, -2.108564, 1, 0.3882353, 0, 1,
-1.529319, -0.6854265, -2.917057, 1, 0.3960784, 0, 1,
-1.527003, -0.3293267, -3.296363, 1, 0.4039216, 0, 1,
-1.50537, 2.605584, -1.224285, 1, 0.4078431, 0, 1,
-1.500386, -0.5277662, -1.671858, 1, 0.4156863, 0, 1,
-1.482491, -0.5046144, -0.6274523, 1, 0.4196078, 0, 1,
-1.476314, 0.1969533, 1.324477, 1, 0.427451, 0, 1,
-1.475697, 0.3114839, -2.68533, 1, 0.4313726, 0, 1,
-1.468004, 0.04202643, 0.733038, 1, 0.4392157, 0, 1,
-1.445178, -1.681569, -2.607121, 1, 0.4431373, 0, 1,
-1.444088, 2.817553, -1.285335, 1, 0.4509804, 0, 1,
-1.439505, 0.4032867, -1.272303, 1, 0.454902, 0, 1,
-1.431942, 1.127917, -1.526547, 1, 0.4627451, 0, 1,
-1.413809, 0.9457955, -0.7065947, 1, 0.4666667, 0, 1,
-1.410289, -0.9769601, -3.071131, 1, 0.4745098, 0, 1,
-1.390375, -0.700093, -3.104817, 1, 0.4784314, 0, 1,
-1.38157, -0.009298106, -1.882847, 1, 0.4862745, 0, 1,
-1.37418, 0.5741966, -0.3706543, 1, 0.4901961, 0, 1,
-1.372819, -0.5680977, -1.079385, 1, 0.4980392, 0, 1,
-1.371826, -1.491048, -2.066815, 1, 0.5058824, 0, 1,
-1.353301, 0.02031527, -0.5625988, 1, 0.509804, 0, 1,
-1.341083, 1.311724, -1.971729, 1, 0.5176471, 0, 1,
-1.329268, -1.519282, -1.307491, 1, 0.5215687, 0, 1,
-1.327975, 1.001794, -1.782263, 1, 0.5294118, 0, 1,
-1.325175, 1.093251, -1.17899, 1, 0.5333334, 0, 1,
-1.320655, -2.044116, -1.86715, 1, 0.5411765, 0, 1,
-1.316591, 0.8263375, -1.377273, 1, 0.5450981, 0, 1,
-1.307782, -0.01662877, -1.698736, 1, 0.5529412, 0, 1,
-1.300223, -0.009542544, 0.2637643, 1, 0.5568628, 0, 1,
-1.299679, 0.7535194, -0.9024524, 1, 0.5647059, 0, 1,
-1.29624, 0.3262056, -1.196994, 1, 0.5686275, 0, 1,
-1.294147, -0.6827102, -0.9686437, 1, 0.5764706, 0, 1,
-1.292051, -0.3518988, -0.7497377, 1, 0.5803922, 0, 1,
-1.286453, 0.8416404, -1.279531, 1, 0.5882353, 0, 1,
-1.284362, -1.26693, -4.433457, 1, 0.5921569, 0, 1,
-1.282847, 1.849153, -0.2446782, 1, 0.6, 0, 1,
-1.277137, 0.2239977, -1.314063, 1, 0.6078432, 0, 1,
-1.270322, -2.282404, -2.289768, 1, 0.6117647, 0, 1,
-1.262647, 0.1910378, -1.315885, 1, 0.6196079, 0, 1,
-1.262091, -0.9615906, -2.321182, 1, 0.6235294, 0, 1,
-1.26195, 0.6007169, -1.481091, 1, 0.6313726, 0, 1,
-1.254784, 2.824008, -0.008746366, 1, 0.6352941, 0, 1,
-1.253891, -0.06857449, -1.659839, 1, 0.6431373, 0, 1,
-1.241791, -1.574162, -2.632688, 1, 0.6470588, 0, 1,
-1.237085, 0.4367239, -1.75573, 1, 0.654902, 0, 1,
-1.230355, -2.342652, -2.953861, 1, 0.6588235, 0, 1,
-1.228994, -1.195069, -0.8035727, 1, 0.6666667, 0, 1,
-1.225787, -0.2189856, -3.214104, 1, 0.6705883, 0, 1,
-1.217067, 1.156903, 0.68808, 1, 0.6784314, 0, 1,
-1.214685, 1.016007, -3.185851, 1, 0.682353, 0, 1,
-1.213972, 0.9928034, -1.21452, 1, 0.6901961, 0, 1,
-1.194946, -0.3869584, -0.7106912, 1, 0.6941177, 0, 1,
-1.19075, 1.061503, 0.256564, 1, 0.7019608, 0, 1,
-1.189993, -1.858017, -2.145211, 1, 0.7098039, 0, 1,
-1.187939, -0.145809, -1.941846, 1, 0.7137255, 0, 1,
-1.187712, 0.2965007, -0.3399095, 1, 0.7215686, 0, 1,
-1.181832, -2.918253, 0.1035889, 1, 0.7254902, 0, 1,
-1.164732, -0.6749152, -3.882642, 1, 0.7333333, 0, 1,
-1.162188, 0.7469459, -1.094814, 1, 0.7372549, 0, 1,
-1.150772, 1.113255, -1.694403, 1, 0.7450981, 0, 1,
-1.142584, 0.01286235, -2.747061, 1, 0.7490196, 0, 1,
-1.134279, 1.246221, -1.673838, 1, 0.7568628, 0, 1,
-1.130424, -0.1521391, -2.927112, 1, 0.7607843, 0, 1,
-1.129194, -1.520237, -4.570618, 1, 0.7686275, 0, 1,
-1.118092, -1.350427, -2.190082, 1, 0.772549, 0, 1,
-1.109115, -0.8880655, -1.938991, 1, 0.7803922, 0, 1,
-1.100825, -0.1884962, -1.084045, 1, 0.7843137, 0, 1,
-1.099574, -0.8631561, -2.584004, 1, 0.7921569, 0, 1,
-1.097713, 0.06411731, -1.024686, 1, 0.7960784, 0, 1,
-1.09522, -0.2564347, -1.908877, 1, 0.8039216, 0, 1,
-1.081948, -3.078322, -1.456267, 1, 0.8117647, 0, 1,
-1.081216, -0.7165265, -0.8360916, 1, 0.8156863, 0, 1,
-1.062868, 2.508963, -0.1748996, 1, 0.8235294, 0, 1,
-1.061619, -0.1496754, -3.217526, 1, 0.827451, 0, 1,
-1.058656, -0.8502684, -1.90321, 1, 0.8352941, 0, 1,
-1.058517, -0.5895284, -1.978232, 1, 0.8392157, 0, 1,
-1.053405, 1.358915, -0.5599216, 1, 0.8470588, 0, 1,
-1.048179, 0.3325424, -1.532559, 1, 0.8509804, 0, 1,
-1.045444, -0.2320542, -3.407985, 1, 0.8588235, 0, 1,
-1.040436, 0.006918977, -1.674699, 1, 0.8627451, 0, 1,
-1.034436, 0.9290929, -0.8234967, 1, 0.8705882, 0, 1,
-1.029462, 0.3997696, -1.544287, 1, 0.8745098, 0, 1,
-1.026583, -0.6710254, -3.095242, 1, 0.8823529, 0, 1,
-1.015275, -1.098038, -2.963279, 1, 0.8862745, 0, 1,
-1.013956, 0.3461097, -1.624877, 1, 0.8941177, 0, 1,
-1.012856, 1.252866, -0.5724961, 1, 0.8980392, 0, 1,
-1.007691, 0.6683113, 0.1034728, 1, 0.9058824, 0, 1,
-1.005031, 0.2315246, -1.238976, 1, 0.9137255, 0, 1,
-1.001252, -0.7850438, -2.136103, 1, 0.9176471, 0, 1,
-0.9995534, -0.6456892, -2.140299, 1, 0.9254902, 0, 1,
-0.9982073, -1.246198, -2.859325, 1, 0.9294118, 0, 1,
-0.9878618, -0.3379323, -5.304005, 1, 0.9372549, 0, 1,
-0.9844185, 0.5107184, -0.2377741, 1, 0.9411765, 0, 1,
-0.9762131, -0.4980732, -4.153244, 1, 0.9490196, 0, 1,
-0.9745871, -0.3464239, -1.433816, 1, 0.9529412, 0, 1,
-0.9681596, -2.437042, -3.771256, 1, 0.9607843, 0, 1,
-0.9655091, -0.8306639, -1.745109, 1, 0.9647059, 0, 1,
-0.9606907, -0.9481649, -1.94464, 1, 0.972549, 0, 1,
-0.9545925, 0.5651369, -0.4691302, 1, 0.9764706, 0, 1,
-0.9516926, 0.6773097, -0.6943734, 1, 0.9843137, 0, 1,
-0.9449023, 0.224916, 0.1032728, 1, 0.9882353, 0, 1,
-0.9442032, -0.9765908, -3.2591, 1, 0.9960784, 0, 1,
-0.9424827, 1.48687, -0.852293, 0.9960784, 1, 0, 1,
-0.9422405, 1.094843, -0.253061, 0.9921569, 1, 0, 1,
-0.9417686, -1.27813, -2.434402, 0.9843137, 1, 0, 1,
-0.9390984, -0.3183488, -0.3476835, 0.9803922, 1, 0, 1,
-0.938005, 0.01161135, -4.230756, 0.972549, 1, 0, 1,
-0.9349993, 0.2933213, -1.901675, 0.9686275, 1, 0, 1,
-0.9336303, 0.8338764, -0.05179669, 0.9607843, 1, 0, 1,
-0.9323572, 0.9937193, -0.108532, 0.9568627, 1, 0, 1,
-0.9274441, 0.1790587, -1.695499, 0.9490196, 1, 0, 1,
-0.9237951, -1.186307, -3.033608, 0.945098, 1, 0, 1,
-0.9231122, -1.301852, -1.521332, 0.9372549, 1, 0, 1,
-0.9219792, -0.414739, -2.58794, 0.9333333, 1, 0, 1,
-0.9184813, 1.736084, -0.8853019, 0.9254902, 1, 0, 1,
-0.9093054, 0.6387835, -0.4483615, 0.9215686, 1, 0, 1,
-0.9082531, 0.1856518, -2.296648, 0.9137255, 1, 0, 1,
-0.9028902, -0.2366706, -0.7784708, 0.9098039, 1, 0, 1,
-0.9006809, 0.04650558, -1.025963, 0.9019608, 1, 0, 1,
-0.8859734, 1.516497, -0.6386942, 0.8941177, 1, 0, 1,
-0.8813151, 0.5437376, 0.02653419, 0.8901961, 1, 0, 1,
-0.8809463, -0.8433282, -3.591094, 0.8823529, 1, 0, 1,
-0.8770391, 0.4721105, -1.508687, 0.8784314, 1, 0, 1,
-0.8703167, 0.7883117, -2.058183, 0.8705882, 1, 0, 1,
-0.867439, -1.193128, -4.315324, 0.8666667, 1, 0, 1,
-0.8658305, -0.002710089, -0.7212884, 0.8588235, 1, 0, 1,
-0.8644174, 0.9691448, -0.08462378, 0.854902, 1, 0, 1,
-0.8614438, -0.5273484, -2.21209, 0.8470588, 1, 0, 1,
-0.8612436, 0.2971752, 0.1977575, 0.8431373, 1, 0, 1,
-0.8580855, 2.641139, -1.284773, 0.8352941, 1, 0, 1,
-0.8556918, 1.107788, -2.110599, 0.8313726, 1, 0, 1,
-0.8399668, 1.770879, -1.249409, 0.8235294, 1, 0, 1,
-0.8381321, -0.1921473, 0.003150667, 0.8196079, 1, 0, 1,
-0.8336546, 1.556849, -0.6303237, 0.8117647, 1, 0, 1,
-0.8259409, 0.6486519, 0.8001372, 0.8078431, 1, 0, 1,
-0.8243304, 1.845541, 0.9272928, 0.8, 1, 0, 1,
-0.8232372, 1.390765, -1.734762, 0.7921569, 1, 0, 1,
-0.8219298, 0.1189376, -0.578617, 0.7882353, 1, 0, 1,
-0.8205907, 1.159299, 1.483895, 0.7803922, 1, 0, 1,
-0.8147364, -0.0792381, -2.066025, 0.7764706, 1, 0, 1,
-0.8103853, -0.2282773, -0.9294199, 0.7686275, 1, 0, 1,
-0.805511, 1.405701, 1.28069, 0.7647059, 1, 0, 1,
-0.8036202, 1.197525, -0.04541054, 0.7568628, 1, 0, 1,
-0.8006752, 0.3853389, 1.272054, 0.7529412, 1, 0, 1,
-0.7999756, -1.906791, -2.162638, 0.7450981, 1, 0, 1,
-0.7985266, 1.525635, -0.3396513, 0.7411765, 1, 0, 1,
-0.7981918, -1.035921, -2.664966, 0.7333333, 1, 0, 1,
-0.7944368, 0.7006359, 0.3644081, 0.7294118, 1, 0, 1,
-0.7921035, -0.7735255, -4.932165, 0.7215686, 1, 0, 1,
-0.7910651, -0.05231317, -2.604168, 0.7176471, 1, 0, 1,
-0.7906398, 0.02666249, -2.821223, 0.7098039, 1, 0, 1,
-0.7904229, 0.3674909, -3.256563, 0.7058824, 1, 0, 1,
-0.7885775, 1.754365, -1.71757, 0.6980392, 1, 0, 1,
-0.777177, 0.3111349, 2.415702, 0.6901961, 1, 0, 1,
-0.7760571, 0.09370489, -1.960723, 0.6862745, 1, 0, 1,
-0.7738105, 0.9979949, -0.1676707, 0.6784314, 1, 0, 1,
-0.7737918, 0.954159, -2.394441, 0.6745098, 1, 0, 1,
-0.7707096, -1.47811, -3.25791, 0.6666667, 1, 0, 1,
-0.7706738, 1.321738, -1.131828, 0.6627451, 1, 0, 1,
-0.7624184, 0.7097781, -1.433613, 0.654902, 1, 0, 1,
-0.7586718, -1.576723, -2.547005, 0.6509804, 1, 0, 1,
-0.75112, 0.8180069, -1.798711, 0.6431373, 1, 0, 1,
-0.7508194, -1.617404, -3.953086, 0.6392157, 1, 0, 1,
-0.7501574, -2.088922, -3.071991, 0.6313726, 1, 0, 1,
-0.7467942, -0.002400924, -0.3869936, 0.627451, 1, 0, 1,
-0.741907, -0.2230694, -0.5234831, 0.6196079, 1, 0, 1,
-0.7381326, -0.7918504, -1.42228, 0.6156863, 1, 0, 1,
-0.7370961, 0.2839252, 0.08592517, 0.6078432, 1, 0, 1,
-0.7267718, 1.621582, 1.706275, 0.6039216, 1, 0, 1,
-0.7265576, 1.954041, 1.793556, 0.5960785, 1, 0, 1,
-0.7243551, -0.677889, -2.472933, 0.5882353, 1, 0, 1,
-0.7209519, -1.07097, -1.499825, 0.5843138, 1, 0, 1,
-0.7181441, -0.1883238, -2.750373, 0.5764706, 1, 0, 1,
-0.717817, 1.054508, 0.0891408, 0.572549, 1, 0, 1,
-0.7171955, -1.371527, -2.793509, 0.5647059, 1, 0, 1,
-0.7110389, -0.1368471, -3.296112, 0.5607843, 1, 0, 1,
-0.7106799, 0.1376757, -2.668095, 0.5529412, 1, 0, 1,
-0.7049183, -0.009136744, -2.599444, 0.5490196, 1, 0, 1,
-0.7008255, -1.024607, -3.154003, 0.5411765, 1, 0, 1,
-0.6987648, -0.4844887, -1.937763, 0.5372549, 1, 0, 1,
-0.6856508, -1.858354, -1.525155, 0.5294118, 1, 0, 1,
-0.6854853, -0.5906215, -4.006507, 0.5254902, 1, 0, 1,
-0.6853579, -0.9934016, -4.009117, 0.5176471, 1, 0, 1,
-0.6845208, 1.174866, -0.1189165, 0.5137255, 1, 0, 1,
-0.6842055, -1.041736, -1.881311, 0.5058824, 1, 0, 1,
-0.6813089, -1.550771, -2.225916, 0.5019608, 1, 0, 1,
-0.6792844, -1.968401, -3.078503, 0.4941176, 1, 0, 1,
-0.6750932, 0.562224, -1.162508, 0.4862745, 1, 0, 1,
-0.6741701, 0.3669554, -1.328656, 0.4823529, 1, 0, 1,
-0.6731705, -0.8510447, -3.573792, 0.4745098, 1, 0, 1,
-0.6724807, 0.1024318, -1.414742, 0.4705882, 1, 0, 1,
-0.6667866, 0.2200105, -1.014622, 0.4627451, 1, 0, 1,
-0.6618502, 1.021438, -1.795402, 0.4588235, 1, 0, 1,
-0.6607656, -0.7939662, -2.774143, 0.4509804, 1, 0, 1,
-0.6574322, -0.1144253, -2.778949, 0.4470588, 1, 0, 1,
-0.6513478, 0.4667986, -0.8548742, 0.4392157, 1, 0, 1,
-0.6466521, 0.3033533, -2.20026, 0.4352941, 1, 0, 1,
-0.6457441, -1.075768, -1.855059, 0.427451, 1, 0, 1,
-0.6453571, -1.834017, -4.517146, 0.4235294, 1, 0, 1,
-0.6374054, 1.256358, 0.5312839, 0.4156863, 1, 0, 1,
-0.6366795, 0.5419045, -3.130134, 0.4117647, 1, 0, 1,
-0.632534, 1.156451, 0.4317544, 0.4039216, 1, 0, 1,
-0.632325, -0.7246521, 0.1078617, 0.3960784, 1, 0, 1,
-0.6291494, 0.9464918, -0.3945532, 0.3921569, 1, 0, 1,
-0.6256091, 1.106244, -1.945862, 0.3843137, 1, 0, 1,
-0.6171226, -0.7818257, -1.934573, 0.3803922, 1, 0, 1,
-0.6157115, -1.208914, -2.886966, 0.372549, 1, 0, 1,
-0.6150883, -1.975903, -3.844821, 0.3686275, 1, 0, 1,
-0.6138662, -1.160751, -1.857726, 0.3607843, 1, 0, 1,
-0.609801, -0.140062, -1.125284, 0.3568628, 1, 0, 1,
-0.6041185, -0.1265203, -2.316548, 0.3490196, 1, 0, 1,
-0.6001077, 0.4042137, -0.9945903, 0.345098, 1, 0, 1,
-0.5988067, -0.1609164, -0.6701428, 0.3372549, 1, 0, 1,
-0.595204, -0.2421975, -4.174709, 0.3333333, 1, 0, 1,
-0.5946345, -0.8054226, -1.421728, 0.3254902, 1, 0, 1,
-0.59168, -1.090115, -3.739497, 0.3215686, 1, 0, 1,
-0.5872998, -0.4059407, -1.435602, 0.3137255, 1, 0, 1,
-0.5871426, 0.7078764, -0.4067522, 0.3098039, 1, 0, 1,
-0.5844964, 0.1425561, -1.772932, 0.3019608, 1, 0, 1,
-0.5824344, 1.271867, -0.8747637, 0.2941177, 1, 0, 1,
-0.5799082, 0.8718697, -0.06825978, 0.2901961, 1, 0, 1,
-0.5788032, 0.3330959, -0.4613928, 0.282353, 1, 0, 1,
-0.5767198, 0.535413, 0.2608907, 0.2784314, 1, 0, 1,
-0.5743052, -0.2385932, -1.09275, 0.2705882, 1, 0, 1,
-0.5739579, -0.1044379, -0.528966, 0.2666667, 1, 0, 1,
-0.5728599, 0.211271, -2.17335, 0.2588235, 1, 0, 1,
-0.5702592, 0.9414448, -0.4293672, 0.254902, 1, 0, 1,
-0.5684738, -0.8067023, -0.9206862, 0.2470588, 1, 0, 1,
-0.5675069, -0.5822353, -0.6584218, 0.2431373, 1, 0, 1,
-0.5673698, 0.7293697, 0.3187484, 0.2352941, 1, 0, 1,
-0.5639093, -1.744143, -2.54361, 0.2313726, 1, 0, 1,
-0.5623302, -2.198306, -2.240216, 0.2235294, 1, 0, 1,
-0.5620242, -0.4356942, -1.532683, 0.2196078, 1, 0, 1,
-0.5590155, -0.2148676, -1.80337, 0.2117647, 1, 0, 1,
-0.5574426, -1.66157, -3.868724, 0.2078431, 1, 0, 1,
-0.5526677, -0.3108458, -2.262532, 0.2, 1, 0, 1,
-0.5509469, 0.4027447, -0.1560517, 0.1921569, 1, 0, 1,
-0.5495394, 0.3495458, -0.3953207, 0.1882353, 1, 0, 1,
-0.5459136, 0.225224, -1.756821, 0.1803922, 1, 0, 1,
-0.5431374, 0.9842995, -0.6709453, 0.1764706, 1, 0, 1,
-0.5382242, -0.6514301, -1.825688, 0.1686275, 1, 0, 1,
-0.5334274, 0.6965383, -2.417644, 0.1647059, 1, 0, 1,
-0.5317943, 0.1373793, -0.5626935, 0.1568628, 1, 0, 1,
-0.526807, -0.6905791, -1.155863, 0.1529412, 1, 0, 1,
-0.526419, -0.6330202, -2.791116, 0.145098, 1, 0, 1,
-0.5193419, -0.373175, -4.339811, 0.1411765, 1, 0, 1,
-0.5162632, 1.348524, -0.1727819, 0.1333333, 1, 0, 1,
-0.5152572, 1.326524, -1.989997, 0.1294118, 1, 0, 1,
-0.5152285, 1.013783, -0.91234, 0.1215686, 1, 0, 1,
-0.510272, -0.7698787, -2.626957, 0.1176471, 1, 0, 1,
-0.5079917, -1.226338, -2.674942, 0.1098039, 1, 0, 1,
-0.5061119, -0.5950221, -2.337937, 0.1058824, 1, 0, 1,
-0.5049402, 1.562206, -0.5283317, 0.09803922, 1, 0, 1,
-0.5049172, -0.3734897, -2.446999, 0.09019608, 1, 0, 1,
-0.503588, 0.8023242, -1.784433, 0.08627451, 1, 0, 1,
-0.5014028, 0.5534167, 0.9639127, 0.07843138, 1, 0, 1,
-0.4983707, 0.5261471, 0.273251, 0.07450981, 1, 0, 1,
-0.4941231, 0.1930078, -1.261078, 0.06666667, 1, 0, 1,
-0.4928308, -0.2767757, -1.223734, 0.0627451, 1, 0, 1,
-0.4914314, 1.129243, 0.6195269, 0.05490196, 1, 0, 1,
-0.4904902, -2.015532, -3.189407, 0.05098039, 1, 0, 1,
-0.4898265, -1.872165, -3.176401, 0.04313726, 1, 0, 1,
-0.4829572, 0.2527132, -1.004475, 0.03921569, 1, 0, 1,
-0.4824929, -0.2744444, -3.233465, 0.03137255, 1, 0, 1,
-0.4796869, 1.781275, 0.3596948, 0.02745098, 1, 0, 1,
-0.4772354, 1.387075, 1.391866, 0.01960784, 1, 0, 1,
-0.4699347, -1.627503, -2.073929, 0.01568628, 1, 0, 1,
-0.4660736, 0.496629, 0.8707616, 0.007843138, 1, 0, 1,
-0.4597293, -0.5713604, -3.604221, 0.003921569, 1, 0, 1,
-0.4582188, -0.853644, 0.2114432, 0, 1, 0.003921569, 1,
-0.4578143, -0.09473944, -1.110587, 0, 1, 0.01176471, 1,
-0.4564989, -0.2167123, -2.154459, 0, 1, 0.01568628, 1,
-0.4505452, -0.6605437, -1.315022, 0, 1, 0.02352941, 1,
-0.4425113, -2.090911, -4.586085, 0, 1, 0.02745098, 1,
-0.4405055, -0.2276553, -1.415725, 0, 1, 0.03529412, 1,
-0.4388614, 1.218104, 0.01151117, 0, 1, 0.03921569, 1,
-0.4367849, 0.8361322, -0.2894178, 0, 1, 0.04705882, 1,
-0.4347255, 0.3575705, -1.305369, 0, 1, 0.05098039, 1,
-0.4326123, 1.838193, -0.9925311, 0, 1, 0.05882353, 1,
-0.4300801, 2.040822, -0.2585064, 0, 1, 0.0627451, 1,
-0.4249021, -0.1385764, -3.921758, 0, 1, 0.07058824, 1,
-0.42449, 1.433091, -0.7781854, 0, 1, 0.07450981, 1,
-0.4216444, 0.3572764, 0.4563537, 0, 1, 0.08235294, 1,
-0.4193726, -0.9275146, -1.269151, 0, 1, 0.08627451, 1,
-0.4188972, -0.06993081, -2.376878, 0, 1, 0.09411765, 1,
-0.4140822, 1.915718, -0.7794152, 0, 1, 0.1019608, 1,
-0.4132293, -0.6177444, -2.681887, 0, 1, 0.1058824, 1,
-0.4119059, 1.261506, -0.3242203, 0, 1, 0.1137255, 1,
-0.4110828, -0.7949063, -1.649895, 0, 1, 0.1176471, 1,
-0.4097113, 0.101958, -1.425667, 0, 1, 0.1254902, 1,
-0.4080945, -0.2602369, -1.403853, 0, 1, 0.1294118, 1,
-0.407185, 0.7723047, -0.4788116, 0, 1, 0.1372549, 1,
-0.4046846, -0.8416703, -3.050277, 0, 1, 0.1411765, 1,
-0.4020575, 1.218419, -0.5462105, 0, 1, 0.1490196, 1,
-0.3989737, -1.998547, -1.797992, 0, 1, 0.1529412, 1,
-0.3984147, 0.9542485, -1.559689, 0, 1, 0.1607843, 1,
-0.3971671, 0.6620163, 0.1261445, 0, 1, 0.1647059, 1,
-0.3960355, 1.822824, -0.5356955, 0, 1, 0.172549, 1,
-0.3953064, 0.5203929, 0.3122422, 0, 1, 0.1764706, 1,
-0.3917338, 0.9195434, -0.855056, 0, 1, 0.1843137, 1,
-0.3916569, 0.4842153, -0.1728761, 0, 1, 0.1882353, 1,
-0.3909955, -2.376928, -2.221874, 0, 1, 0.1960784, 1,
-0.3901553, 0.2426015, 0.18812, 0, 1, 0.2039216, 1,
-0.3893908, -1.522804, -2.610701, 0, 1, 0.2078431, 1,
-0.3877699, -1.415758, -2.701631, 0, 1, 0.2156863, 1,
-0.3855038, -0.1208602, -0.9210891, 0, 1, 0.2196078, 1,
-0.384891, 2.068072, -0.3331166, 0, 1, 0.227451, 1,
-0.3846638, -0.8657961, -3.539649, 0, 1, 0.2313726, 1,
-0.381756, 1.796625, -1.004915, 0, 1, 0.2392157, 1,
-0.3817402, -0.9695935, -2.426959, 0, 1, 0.2431373, 1,
-0.38172, 1.822288, -0.5489794, 0, 1, 0.2509804, 1,
-0.3800909, 0.7208933, -1.124587, 0, 1, 0.254902, 1,
-0.3786682, -1.200953, -2.708948, 0, 1, 0.2627451, 1,
-0.3783467, 1.767484, -0.7669831, 0, 1, 0.2666667, 1,
-0.3764717, 0.06715481, 1.32593, 0, 1, 0.2745098, 1,
-0.3748143, -0.9053445, -0.9405499, 0, 1, 0.2784314, 1,
-0.3722854, -1.099637, -2.358951, 0, 1, 0.2862745, 1,
-0.371747, -1.677415, -4.360762, 0, 1, 0.2901961, 1,
-0.3714245, 0.6208957, -1.238039, 0, 1, 0.2980392, 1,
-0.3696613, 0.3860795, -0.6783403, 0, 1, 0.3058824, 1,
-0.3678806, 0.8563285, -3.085083, 0, 1, 0.3098039, 1,
-0.3677996, 0.6151905, -0.1910142, 0, 1, 0.3176471, 1,
-0.3671314, -2.029325, -2.854039, 0, 1, 0.3215686, 1,
-0.3563919, 0.2463127, -1.395856, 0, 1, 0.3294118, 1,
-0.3527277, -0.390339, -1.804295, 0, 1, 0.3333333, 1,
-0.351927, 0.7110473, -1.077893, 0, 1, 0.3411765, 1,
-0.3502584, 0.7196167, 0.4794659, 0, 1, 0.345098, 1,
-0.3466405, 0.2272788, -2.014302, 0, 1, 0.3529412, 1,
-0.3441026, -0.9439625, -1.351037, 0, 1, 0.3568628, 1,
-0.3418645, 1.053895, -0.6651488, 0, 1, 0.3647059, 1,
-0.3415956, 0.314865, -0.05785798, 0, 1, 0.3686275, 1,
-0.3314964, 1.212065, -1.61045, 0, 1, 0.3764706, 1,
-0.3311292, 0.5187017, -1.189479, 0, 1, 0.3803922, 1,
-0.3287822, 0.4601529, 0.7659624, 0, 1, 0.3882353, 1,
-0.3269801, 0.729618, 0.1792431, 0, 1, 0.3921569, 1,
-0.323763, 2.376247, -0.177787, 0, 1, 0.4, 1,
-0.3235382, 0.8210911, -0.7911052, 0, 1, 0.4078431, 1,
-0.3195251, -1.34331, -1.801961, 0, 1, 0.4117647, 1,
-0.3180321, 1.10289, -0.001740929, 0, 1, 0.4196078, 1,
-0.3160733, -0.1575631, -2.376403, 0, 1, 0.4235294, 1,
-0.3158821, 0.5918118, -1.249382, 0, 1, 0.4313726, 1,
-0.3118787, -0.03342043, -2.087086, 0, 1, 0.4352941, 1,
-0.3071419, -1.429975, -2.856885, 0, 1, 0.4431373, 1,
-0.3067731, 0.02396313, -1.636477, 0, 1, 0.4470588, 1,
-0.3048252, -0.02427553, -0.7389649, 0, 1, 0.454902, 1,
-0.3032818, -0.1386076, -3.506573, 0, 1, 0.4588235, 1,
-0.302988, 0.3487422, 0.4912049, 0, 1, 0.4666667, 1,
-0.2936275, 1.291951, 0.9399037, 0, 1, 0.4705882, 1,
-0.2928661, -0.922409, -2.560932, 0, 1, 0.4784314, 1,
-0.2921139, -0.569487, -4.052077, 0, 1, 0.4823529, 1,
-0.2872489, -1.634297, -2.52948, 0, 1, 0.4901961, 1,
-0.2808271, -0.9911237, -4.64039, 0, 1, 0.4941176, 1,
-0.2796877, -0.5988067, -3.134473, 0, 1, 0.5019608, 1,
-0.2778938, -1.980554, -4.1998, 0, 1, 0.509804, 1,
-0.2655715, -1.636612, -3.096233, 0, 1, 0.5137255, 1,
-0.2602301, -0.4377159, -2.780689, 0, 1, 0.5215687, 1,
-0.2504756, 1.488781, -0.4517457, 0, 1, 0.5254902, 1,
-0.2458566, -0.8205381, -2.613132, 0, 1, 0.5333334, 1,
-0.2455545, -0.2919747, -3.410018, 0, 1, 0.5372549, 1,
-0.2443232, 0.8920075, -0.2166843, 0, 1, 0.5450981, 1,
-0.242509, 1.281314, -1.071886, 0, 1, 0.5490196, 1,
-0.2407961, 1.529858, 0.2611642, 0, 1, 0.5568628, 1,
-0.2391815, 1.39589, -0.1898693, 0, 1, 0.5607843, 1,
-0.2385514, -1.32146, -3.472267, 0, 1, 0.5686275, 1,
-0.2349637, -0.3456997, -3.519418, 0, 1, 0.572549, 1,
-0.2311611, -0.07809901, -1.614256, 0, 1, 0.5803922, 1,
-0.2268734, 0.008900978, -1.011379, 0, 1, 0.5843138, 1,
-0.2268655, 0.7150525, 1.386718, 0, 1, 0.5921569, 1,
-0.2228358, 0.6568535, -1.263136, 0, 1, 0.5960785, 1,
-0.2152644, 0.4978697, -0.7143835, 0, 1, 0.6039216, 1,
-0.2149143, 0.2416759, -0.8183078, 0, 1, 0.6117647, 1,
-0.214084, -1.079945, -1.979227, 0, 1, 0.6156863, 1,
-0.2134297, 0.08643619, -1.947992, 0, 1, 0.6235294, 1,
-0.2116484, 0.9461651, 0.9468088, 0, 1, 0.627451, 1,
-0.2062594, 0.5152866, -0.08987848, 0, 1, 0.6352941, 1,
-0.2021509, -1.77882, -3.738458, 0, 1, 0.6392157, 1,
-0.1979637, 0.1088227, -1.516892, 0, 1, 0.6470588, 1,
-0.1976635, 0.334026, 1.44285, 0, 1, 0.6509804, 1,
-0.1969989, 0.02134987, -1.804258, 0, 1, 0.6588235, 1,
-0.1948088, 0.1359722, -0.9451472, 0, 1, 0.6627451, 1,
-0.1919439, -0.9233218, -3.637804, 0, 1, 0.6705883, 1,
-0.1861143, -1.106101, -3.666421, 0, 1, 0.6745098, 1,
-0.1805537, -0.7717836, -2.309633, 0, 1, 0.682353, 1,
-0.1780152, 0.5221038, -2.083022, 0, 1, 0.6862745, 1,
-0.1774549, -0.5456984, -2.408219, 0, 1, 0.6941177, 1,
-0.1767004, 0.588144, -1.977293, 0, 1, 0.7019608, 1,
-0.1669932, 0.4403977, -0.07367277, 0, 1, 0.7058824, 1,
-0.1666176, -0.02174062, -1.700853, 0, 1, 0.7137255, 1,
-0.1660554, 1.196608, -1.118271, 0, 1, 0.7176471, 1,
-0.1518154, 0.3752272, 0.1758541, 0, 1, 0.7254902, 1,
-0.1473675, 0.9988346, -1.667655, 0, 1, 0.7294118, 1,
-0.1468894, -1.233253, -2.649215, 0, 1, 0.7372549, 1,
-0.1441742, 1.304136, 0.4473088, 0, 1, 0.7411765, 1,
-0.1435295, 0.3012571, 0.7549784, 0, 1, 0.7490196, 1,
-0.141383, -0.3519796, -2.709551, 0, 1, 0.7529412, 1,
-0.141073, 1.236495, -1.023669, 0, 1, 0.7607843, 1,
-0.1377383, -1.171799, -3.544098, 0, 1, 0.7647059, 1,
-0.134793, -0.1314915, -1.867855, 0, 1, 0.772549, 1,
-0.1321523, -2.024991, -2.955837, 0, 1, 0.7764706, 1,
-0.1263715, -0.2615274, -3.266754, 0, 1, 0.7843137, 1,
-0.1233823, 1.033051, 1.078796, 0, 1, 0.7882353, 1,
-0.1232242, 0.7241563, 0.9494326, 0, 1, 0.7960784, 1,
-0.1214568, -0.2111322, -3.121293, 0, 1, 0.8039216, 1,
-0.1214413, 0.2758255, -0.5549649, 0, 1, 0.8078431, 1,
-0.1204022, -1.551525, -1.337948, 0, 1, 0.8156863, 1,
-0.1166178, 0.7573056, 0.5967423, 0, 1, 0.8196079, 1,
-0.1124225, -0.9289952, -3.059585, 0, 1, 0.827451, 1,
-0.1111949, 0.8949043, 0.6568735, 0, 1, 0.8313726, 1,
-0.1103711, -0.7445994, -3.55429, 0, 1, 0.8392157, 1,
-0.1067238, -0.05331155, -3.092908, 0, 1, 0.8431373, 1,
-0.09442595, -0.09963003, -2.588596, 0, 1, 0.8509804, 1,
-0.086611, 0.1702166, -1.302669, 0, 1, 0.854902, 1,
-0.08642596, -0.7691348, -4.862819, 0, 1, 0.8627451, 1,
-0.08472501, -0.6359221, -3.015358, 0, 1, 0.8666667, 1,
-0.08465166, -0.3771517, -3.474546, 0, 1, 0.8745098, 1,
-0.08441965, 0.3456043, -0.7214582, 0, 1, 0.8784314, 1,
-0.08399344, 0.2623366, -0.8659394, 0, 1, 0.8862745, 1,
-0.08118596, -0.4367961, -1.378657, 0, 1, 0.8901961, 1,
-0.0802532, -0.1688866, -2.532232, 0, 1, 0.8980392, 1,
-0.07757752, 1.859344, 1.204239, 0, 1, 0.9058824, 1,
-0.07536659, -0.01917764, -1.320069, 0, 1, 0.9098039, 1,
-0.07251221, 0.7471475, -1.308933, 0, 1, 0.9176471, 1,
-0.07242647, 0.1820567, -1.602924, 0, 1, 0.9215686, 1,
-0.06844109, 0.9275479, -1.916215, 0, 1, 0.9294118, 1,
-0.06786317, -2.091517, -2.880213, 0, 1, 0.9333333, 1,
-0.06634628, -1.014457, -4.873159, 0, 1, 0.9411765, 1,
-0.05582257, -0.08636831, -3.006316, 0, 1, 0.945098, 1,
-0.05465284, -1.209211, -3.01459, 0, 1, 0.9529412, 1,
-0.05325675, 0.3607578, 1.538124, 0, 1, 0.9568627, 1,
-0.03710065, 1.084952, -0.02766348, 0, 1, 0.9647059, 1,
-0.03331168, -0.4648383, -3.717705, 0, 1, 0.9686275, 1,
-0.03195463, 0.1003656, 2.100586, 0, 1, 0.9764706, 1,
-0.03021743, -1.476456, -1.88161, 0, 1, 0.9803922, 1,
-0.02892965, 0.7674655, -0.09207601, 0, 1, 0.9882353, 1,
-0.02874336, 0.8431346, -0.04404373, 0, 1, 0.9921569, 1,
-0.02077875, 0.6188449, -0.359145, 0, 1, 1, 1,
-0.01955396, -0.06455997, -4.006112, 0, 0.9921569, 1, 1,
-0.01952099, 0.9857479, 0.9660779, 0, 0.9882353, 1, 1,
-0.01160752, 0.08886234, -2.641656, 0, 0.9803922, 1, 1,
-0.009749108, 1.395321, 1.071834, 0, 0.9764706, 1, 1,
-0.008540206, 0.007969067, -1.131782, 0, 0.9686275, 1, 1,
-0.00807275, -1.246646, -2.939264, 0, 0.9647059, 1, 1,
-0.007036665, -0.561986, -2.523463, 0, 0.9568627, 1, 1,
-0.004819229, 0.9098127, -1.264381, 0, 0.9529412, 1, 1,
-0.003510454, 0.7481905, -0.5671239, 0, 0.945098, 1, 1,
-0.003112542, 0.6281398, 0.1435719, 0, 0.9411765, 1, 1,
-0.0007880269, -0.457382, -1.895095, 0, 0.9333333, 1, 1,
3.96018e-05, 0.3296158, -1.261662, 0, 0.9294118, 1, 1,
0.003463724, 0.858498, -0.6401941, 0, 0.9215686, 1, 1,
0.004066776, 0.6647614, -0.6756124, 0, 0.9176471, 1, 1,
0.004639647, 0.9401183, -2.079504, 0, 0.9098039, 1, 1,
0.005744868, 2.834377, 2.818304, 0, 0.9058824, 1, 1,
0.01112908, 0.01170788, 0.8873116, 0, 0.8980392, 1, 1,
0.01837676, -0.121549, 4.044223, 0, 0.8901961, 1, 1,
0.01939427, 0.7168037, 0.009768481, 0, 0.8862745, 1, 1,
0.02082658, 1.257342, 0.1856198, 0, 0.8784314, 1, 1,
0.02157667, 0.1189067, -0.6507344, 0, 0.8745098, 1, 1,
0.02620712, -0.7145891, 1.795349, 0, 0.8666667, 1, 1,
0.02814885, 0.7178804, -2.065773, 0, 0.8627451, 1, 1,
0.02815619, -0.1583548, 3.157258, 0, 0.854902, 1, 1,
0.03247769, -1.057026, 3.553327, 0, 0.8509804, 1, 1,
0.03323283, -1.235958, 4.534442, 0, 0.8431373, 1, 1,
0.0350862, -0.8899308, 2.803063, 0, 0.8392157, 1, 1,
0.05025946, -1.223243, 3.666764, 0, 0.8313726, 1, 1,
0.05240628, -0.957902, 3.305768, 0, 0.827451, 1, 1,
0.05274614, -1.450549, 5.034524, 0, 0.8196079, 1, 1,
0.05459424, -0.6988093, 3.230297, 0, 0.8156863, 1, 1,
0.05721271, 1.250297, 0.6149909, 0, 0.8078431, 1, 1,
0.05745656, -0.09983385, 3.535085, 0, 0.8039216, 1, 1,
0.05798497, 0.5594796, 1.210046, 0, 0.7960784, 1, 1,
0.05932432, -2.262037, 4.060108, 0, 0.7882353, 1, 1,
0.06449369, -0.1176787, 2.369934, 0, 0.7843137, 1, 1,
0.0678136, -0.3668878, 3.359919, 0, 0.7764706, 1, 1,
0.06791467, -1.066513, 5.542859, 0, 0.772549, 1, 1,
0.06905814, 0.005898909, 0.3077385, 0, 0.7647059, 1, 1,
0.069093, -1.924842, 4.502183, 0, 0.7607843, 1, 1,
0.07128103, 0.9200156, -0.7757892, 0, 0.7529412, 1, 1,
0.07720082, 1.212929, 1.041522, 0, 0.7490196, 1, 1,
0.08176392, -1.720733, 2.772956, 0, 0.7411765, 1, 1,
0.08603352, -0.2323881, 2.795513, 0, 0.7372549, 1, 1,
0.08749757, -0.4909448, 3.439349, 0, 0.7294118, 1, 1,
0.08966192, 0.667784, -1.158526, 0, 0.7254902, 1, 1,
0.09100562, -0.2579502, 3.948117, 0, 0.7176471, 1, 1,
0.09379516, 0.5705507, -1.857721, 0, 0.7137255, 1, 1,
0.09490732, 0.884672, 2.139994, 0, 0.7058824, 1, 1,
0.09542958, 1.075838, 0.6895691, 0, 0.6980392, 1, 1,
0.09575334, -0.3327481, 3.846529, 0, 0.6941177, 1, 1,
0.09897048, -0.8070049, 3.445774, 0, 0.6862745, 1, 1,
0.103105, 0.7273587, 0.8428757, 0, 0.682353, 1, 1,
0.1110814, -0.4522552, 3.907273, 0, 0.6745098, 1, 1,
0.1217507, 0.5067316, 1.250405, 0, 0.6705883, 1, 1,
0.1221619, 0.248106, 1.207204, 0, 0.6627451, 1, 1,
0.1237143, 1.13296, -1.118791, 0, 0.6588235, 1, 1,
0.1262345, 0.533089, 0.8853735, 0, 0.6509804, 1, 1,
0.1300192, -0.8661643, 4.183564, 0, 0.6470588, 1, 1,
0.1307351, 0.2050552, 0.6649504, 0, 0.6392157, 1, 1,
0.1341431, 0.9960763, -0.4705001, 0, 0.6352941, 1, 1,
0.1347647, 0.1817213, 1.406356, 0, 0.627451, 1, 1,
0.1391026, -0.08851606, 0.4340149, 0, 0.6235294, 1, 1,
0.1424236, -0.7579226, 3.770721, 0, 0.6156863, 1, 1,
0.1441237, -0.09616099, 2.686703, 0, 0.6117647, 1, 1,
0.1445725, -0.9902493, 3.103098, 0, 0.6039216, 1, 1,
0.1456503, -0.1011036, 1.89408, 0, 0.5960785, 1, 1,
0.1512193, 1.703847, 1.688279, 0, 0.5921569, 1, 1,
0.1515415, -0.2075418, 2.558006, 0, 0.5843138, 1, 1,
0.1554165, 0.547895, -0.9420694, 0, 0.5803922, 1, 1,
0.1561252, -0.4968756, 2.781128, 0, 0.572549, 1, 1,
0.1606914, -0.6209742, 3.365586, 0, 0.5686275, 1, 1,
0.1646649, 1.275928, -0.001351934, 0, 0.5607843, 1, 1,
0.1648029, 0.04381322, 2.044161, 0, 0.5568628, 1, 1,
0.1710087, -0.3237021, 2.028797, 0, 0.5490196, 1, 1,
0.1727403, -0.5142394, 3.334861, 0, 0.5450981, 1, 1,
0.1727611, 2.2945, -0.4813324, 0, 0.5372549, 1, 1,
0.1759786, 0.3172535, 0.7967558, 0, 0.5333334, 1, 1,
0.1761538, 1.025698, 0.5313521, 0, 0.5254902, 1, 1,
0.1769611, 0.9019495, 0.3240627, 0, 0.5215687, 1, 1,
0.178818, 1.061888, 0.0211389, 0, 0.5137255, 1, 1,
0.179231, 1.333468, 1.578959, 0, 0.509804, 1, 1,
0.1846444, -0.190474, 3.331494, 0, 0.5019608, 1, 1,
0.1942522, 0.5002148, 0.5622447, 0, 0.4941176, 1, 1,
0.195868, 1.408598, 0.7238146, 0, 0.4901961, 1, 1,
0.1961029, 1.653382, 0.4649821, 0, 0.4823529, 1, 1,
0.20085, -1.232319, 4.014679, 0, 0.4784314, 1, 1,
0.2031091, 0.6761554, 0.00524139, 0, 0.4705882, 1, 1,
0.205645, 0.8240749, 3.18181, 0, 0.4666667, 1, 1,
0.2064759, 0.6806702, 0.7486273, 0, 0.4588235, 1, 1,
0.206854, -1.005547, 1.742225, 0, 0.454902, 1, 1,
0.2092642, 0.1762466, 1.811573, 0, 0.4470588, 1, 1,
0.2096549, -0.5714063, 1.729215, 0, 0.4431373, 1, 1,
0.2192456, -0.5513467, 2.520151, 0, 0.4352941, 1, 1,
0.2208128, -0.107131, 3.512497, 0, 0.4313726, 1, 1,
0.2217686, -0.0261661, 1.137116, 0, 0.4235294, 1, 1,
0.2328683, 1.345875, -0.1262312, 0, 0.4196078, 1, 1,
0.2335313, 0.930939, 0.8554255, 0, 0.4117647, 1, 1,
0.2344975, 0.5103026, 1.394807, 0, 0.4078431, 1, 1,
0.2354985, 0.520871, 0.09776206, 0, 0.4, 1, 1,
0.2387177, -0.510814, 2.989109, 0, 0.3921569, 1, 1,
0.240027, 0.04384096, 0.6231081, 0, 0.3882353, 1, 1,
0.2408939, -0.01507959, 2.187115, 0, 0.3803922, 1, 1,
0.2413661, -0.6901876, 3.383219, 0, 0.3764706, 1, 1,
0.2435639, 1.101009, 1.276569, 0, 0.3686275, 1, 1,
0.2490659, -0.3289632, 3.308119, 0, 0.3647059, 1, 1,
0.2502506, -0.7782374, 1.832735, 0, 0.3568628, 1, 1,
0.2521025, -0.3666228, 1.118121, 0, 0.3529412, 1, 1,
0.2531185, 0.6893072, -0.3499746, 0, 0.345098, 1, 1,
0.2654448, -0.4572788, 2.399873, 0, 0.3411765, 1, 1,
0.2691513, 1.210562, -0.5033727, 0, 0.3333333, 1, 1,
0.2696643, -0.23438, 2.64755, 0, 0.3294118, 1, 1,
0.2698212, -1.464193, 2.189138, 0, 0.3215686, 1, 1,
0.2736797, -0.2151822, 4.677607, 0, 0.3176471, 1, 1,
0.2754946, -0.4489161, 3.294303, 0, 0.3098039, 1, 1,
0.2829563, 0.6808968, -1.273473, 0, 0.3058824, 1, 1,
0.2830941, -0.6743454, 3.772605, 0, 0.2980392, 1, 1,
0.2836651, 2.438286, 0.7997108, 0, 0.2901961, 1, 1,
0.2852752, -1.316288, 2.728226, 0, 0.2862745, 1, 1,
0.2864747, -1.13565, 2.489097, 0, 0.2784314, 1, 1,
0.2911524, -0.6524312, 2.614516, 0, 0.2745098, 1, 1,
0.291758, -0.2456211, 0.8315434, 0, 0.2666667, 1, 1,
0.2951033, -1.278191, 1.59826, 0, 0.2627451, 1, 1,
0.2953883, -0.2408828, 1.279692, 0, 0.254902, 1, 1,
0.2975878, -1.603261, 3.412806, 0, 0.2509804, 1, 1,
0.29895, 0.7292761, -0.2971755, 0, 0.2431373, 1, 1,
0.3004199, 0.6675649, 0.8395526, 0, 0.2392157, 1, 1,
0.3069012, 0.3380391, -0.7039385, 0, 0.2313726, 1, 1,
0.3106557, 1.286389, 0.9732617, 0, 0.227451, 1, 1,
0.311381, 1.256528, -0.5968181, 0, 0.2196078, 1, 1,
0.3119465, -0.7854211, 4.222088, 0, 0.2156863, 1, 1,
0.3120344, 0.04642634, 1.729922, 0, 0.2078431, 1, 1,
0.3124305, -1.788032, 2.209371, 0, 0.2039216, 1, 1,
0.315432, 0.5125282, -0.006972257, 0, 0.1960784, 1, 1,
0.3160642, 0.2209034, 1.194337, 0, 0.1882353, 1, 1,
0.321677, 0.8343003, -3.23741, 0, 0.1843137, 1, 1,
0.3234836, 0.5949934, 0.7449527, 0, 0.1764706, 1, 1,
0.3246899, -1.305474, 1.948304, 0, 0.172549, 1, 1,
0.3266014, 0.8890004, 0.7619087, 0, 0.1647059, 1, 1,
0.3280658, -0.9941715, 2.96966, 0, 0.1607843, 1, 1,
0.3280826, 0.8160652, 1.690145, 0, 0.1529412, 1, 1,
0.3312204, -1.553953, 3.560161, 0, 0.1490196, 1, 1,
0.3346792, -0.5684163, 3.516659, 0, 0.1411765, 1, 1,
0.3350166, -1.908584, 2.0436, 0, 0.1372549, 1, 1,
0.3431417, -2.819453, 3.758357, 0, 0.1294118, 1, 1,
0.3452541, -1.415613, 2.587362, 0, 0.1254902, 1, 1,
0.3561259, -0.5085835, 3.669106, 0, 0.1176471, 1, 1,
0.3623077, 0.8897957, 1.110882, 0, 0.1137255, 1, 1,
0.3669149, 0.4055339, 0.6211727, 0, 0.1058824, 1, 1,
0.3687914, -0.4637559, 2.265318, 0, 0.09803922, 1, 1,
0.3752017, 0.1879809, 1.741851, 0, 0.09411765, 1, 1,
0.3766762, 0.672857, -0.3606575, 0, 0.08627451, 1, 1,
0.381577, -0.3365926, 2.595315, 0, 0.08235294, 1, 1,
0.3840554, -1.185362, 1.227124, 0, 0.07450981, 1, 1,
0.3851989, -1.261772, 1.869916, 0, 0.07058824, 1, 1,
0.4041751, 1.750866, 1.05292, 0, 0.0627451, 1, 1,
0.4049846, 1.184566, 0.08977229, 0, 0.05882353, 1, 1,
0.405698, 0.2023082, 1.08893, 0, 0.05098039, 1, 1,
0.4062597, -0.2515944, 2.530671, 0, 0.04705882, 1, 1,
0.406373, 0.1684909, 1.324183, 0, 0.03921569, 1, 1,
0.4067841, -0.9484563, 1.956221, 0, 0.03529412, 1, 1,
0.4075392, -1.190681, 4.634505, 0, 0.02745098, 1, 1,
0.4101004, -0.2630748, 1.870272, 0, 0.02352941, 1, 1,
0.4147958, -0.998981, 2.921854, 0, 0.01568628, 1, 1,
0.4154414, -1.00103, 2.672229, 0, 0.01176471, 1, 1,
0.4184743, 1.209222, 1.320429, 0, 0.003921569, 1, 1,
0.4269865, 1.671913, 1.056754, 0.003921569, 0, 1, 1,
0.4306035, -0.1494012, 0.8856, 0.007843138, 0, 1, 1,
0.4321937, 0.8556861, 0.3801227, 0.01568628, 0, 1, 1,
0.4341855, -0.1919351, 2.374859, 0.01960784, 0, 1, 1,
0.4422189, -0.7898108, 1.869781, 0.02745098, 0, 1, 1,
0.4458843, 1.299944, -0.948966, 0.03137255, 0, 1, 1,
0.4548019, -1.034157, 3.240239, 0.03921569, 0, 1, 1,
0.4573838, -0.5213177, 2.407854, 0.04313726, 0, 1, 1,
0.4590605, 0.09527773, 2.745506, 0.05098039, 0, 1, 1,
0.4603185, -0.4520471, 1.352057, 0.05490196, 0, 1, 1,
0.4644471, 0.3194082, 2.822236, 0.0627451, 0, 1, 1,
0.4645064, 0.08888672, 1.610218, 0.06666667, 0, 1, 1,
0.4678138, -1.466153, 2.758029, 0.07450981, 0, 1, 1,
0.4727695, 0.128666, 0.08012964, 0.07843138, 0, 1, 1,
0.4748058, 1.305084, -2.588373, 0.08627451, 0, 1, 1,
0.4748602, 0.269382, -0.05110968, 0.09019608, 0, 1, 1,
0.4763224, 0.08266275, 1.593379, 0.09803922, 0, 1, 1,
0.4837306, 0.4534205, 0.7765418, 0.1058824, 0, 1, 1,
0.4902178, -0.9560065, 2.064758, 0.1098039, 0, 1, 1,
0.4903011, 1.093974, 0.6381832, 0.1176471, 0, 1, 1,
0.4922533, 1.147346, 1.144343, 0.1215686, 0, 1, 1,
0.4930258, 0.7184141, -0.2548195, 0.1294118, 0, 1, 1,
0.4975761, 1.468943, -1.343151, 0.1333333, 0, 1, 1,
0.4980468, -2.143345, 2.150483, 0.1411765, 0, 1, 1,
0.5019178, 1.773364, -1.466558, 0.145098, 0, 1, 1,
0.5049165, 1.109583, 1.054263, 0.1529412, 0, 1, 1,
0.5108078, 0.769701, 0.01191421, 0.1568628, 0, 1, 1,
0.5172557, -0.4842994, 3.071574, 0.1647059, 0, 1, 1,
0.523972, 0.1547914, 2.616686, 0.1686275, 0, 1, 1,
0.5311513, 0.5590603, 1.059043, 0.1764706, 0, 1, 1,
0.5377577, 0.1602174, 1.134441, 0.1803922, 0, 1, 1,
0.5385333, -1.546232, 2.009834, 0.1882353, 0, 1, 1,
0.5413429, 0.1539394, 2.152405, 0.1921569, 0, 1, 1,
0.5463084, 0.507515, 0.8671497, 0.2, 0, 1, 1,
0.5490772, -0.04021018, 2.49895, 0.2078431, 0, 1, 1,
0.5518041, 1.491209, -1.943865, 0.2117647, 0, 1, 1,
0.5525495, -0.2461206, 2.500453, 0.2196078, 0, 1, 1,
0.5533749, -2.96897, 1.805831, 0.2235294, 0, 1, 1,
0.5545683, -0.4822702, 2.130864, 0.2313726, 0, 1, 1,
0.5554179, -0.9218623, 1.719811, 0.2352941, 0, 1, 1,
0.5616257, -0.153916, 1.171375, 0.2431373, 0, 1, 1,
0.5648592, -0.5210122, 1.481808, 0.2470588, 0, 1, 1,
0.5655081, -0.1993861, 1.465829, 0.254902, 0, 1, 1,
0.5682496, 1.774553, -0.7337238, 0.2588235, 0, 1, 1,
0.5698479, -0.468708, 2.400595, 0.2666667, 0, 1, 1,
0.5707707, 1.879307, 0.4557594, 0.2705882, 0, 1, 1,
0.5714263, 0.8762634, 1.564233, 0.2784314, 0, 1, 1,
0.5727878, 1.370382, 0.4153492, 0.282353, 0, 1, 1,
0.5733343, -0.5904253, 2.778579, 0.2901961, 0, 1, 1,
0.575229, 0.7742718, 0.05510909, 0.2941177, 0, 1, 1,
0.5810467, 0.4130446, 0.2140425, 0.3019608, 0, 1, 1,
0.5813418, -1.017595, 3.302994, 0.3098039, 0, 1, 1,
0.5857108, 1.662771, 0.5247751, 0.3137255, 0, 1, 1,
0.591961, 0.06527176, 1.300007, 0.3215686, 0, 1, 1,
0.6016648, -1.219476, 2.324739, 0.3254902, 0, 1, 1,
0.6030097, 1.090297, 2.593468, 0.3333333, 0, 1, 1,
0.6080157, 1.316996, 0.08081279, 0.3372549, 0, 1, 1,
0.6088848, -0.2699254, 2.496986, 0.345098, 0, 1, 1,
0.611868, 0.08959687, 1.979518, 0.3490196, 0, 1, 1,
0.6132286, -1.478791, 2.088518, 0.3568628, 0, 1, 1,
0.6150622, -0.642513, 4.019509, 0.3607843, 0, 1, 1,
0.6213174, -1.038942, 4.359923, 0.3686275, 0, 1, 1,
0.6243541, 0.7169753, 2.59485, 0.372549, 0, 1, 1,
0.6275533, -0.1540664, 1.22654, 0.3803922, 0, 1, 1,
0.6293809, -0.4021972, 3.717312, 0.3843137, 0, 1, 1,
0.6300827, 0.5961589, 1.387862, 0.3921569, 0, 1, 1,
0.6304086, -0.8758907, 2.861758, 0.3960784, 0, 1, 1,
0.6363239, 0.1202176, 3.729852, 0.4039216, 0, 1, 1,
0.6376042, -1.062889, 3.693411, 0.4117647, 0, 1, 1,
0.641668, 1.197271, 0.5588997, 0.4156863, 0, 1, 1,
0.6432627, 0.6988953, -0.6302943, 0.4235294, 0, 1, 1,
0.6441882, 1.772687, -3.036939, 0.427451, 0, 1, 1,
0.652728, 0.9239135, 0.7342573, 0.4352941, 0, 1, 1,
0.6538494, -0.7739701, 1.660271, 0.4392157, 0, 1, 1,
0.6542954, 0.2222241, 0.8388997, 0.4470588, 0, 1, 1,
0.6555552, -0.5932477, 1.946548, 0.4509804, 0, 1, 1,
0.6623347, 0.8623313, 2.084157, 0.4588235, 0, 1, 1,
0.6638238, 0.4603655, 1.326911, 0.4627451, 0, 1, 1,
0.6640521, 0.0575674, 0.5299886, 0.4705882, 0, 1, 1,
0.6688988, 0.5044426, 0.9930468, 0.4745098, 0, 1, 1,
0.6720985, 0.7279692, -1.25207, 0.4823529, 0, 1, 1,
0.6772835, -0.4608432, 2.479186, 0.4862745, 0, 1, 1,
0.6774224, -0.04334158, 2.286669, 0.4941176, 0, 1, 1,
0.6827407, 0.04925366, 0.9652742, 0.5019608, 0, 1, 1,
0.690566, 0.2376216, -0.1796223, 0.5058824, 0, 1, 1,
0.6936078, 0.2459754, 0.2323098, 0.5137255, 0, 1, 1,
0.7078959, 1.062759, 0.8271012, 0.5176471, 0, 1, 1,
0.7096733, -1.779548, 3.680254, 0.5254902, 0, 1, 1,
0.7119328, 0.003330261, 1.859104, 0.5294118, 0, 1, 1,
0.7213817, -0.2488215, 2.245899, 0.5372549, 0, 1, 1,
0.7273028, 0.03754772, 0.2785269, 0.5411765, 0, 1, 1,
0.7310111, 1.264412, 1.506153, 0.5490196, 0, 1, 1,
0.7314712, 0.7234197, 0.3452683, 0.5529412, 0, 1, 1,
0.7476518, 0.04294065, 2.753737, 0.5607843, 0, 1, 1,
0.7503573, -0.3516571, 0.07651674, 0.5647059, 0, 1, 1,
0.7510602, 0.08714692, 1.435113, 0.572549, 0, 1, 1,
0.7540575, -0.287455, 2.747447, 0.5764706, 0, 1, 1,
0.7593278, 1.689788, -0.2474024, 0.5843138, 0, 1, 1,
0.7607189, 0.3652971, 0.9091312, 0.5882353, 0, 1, 1,
0.7607467, -0.3631023, 1.944688, 0.5960785, 0, 1, 1,
0.7618201, 1.477299, 0.7604038, 0.6039216, 0, 1, 1,
0.7704238, 0.5759503, 2.611219, 0.6078432, 0, 1, 1,
0.7706186, -2.179487, 0.9646778, 0.6156863, 0, 1, 1,
0.7721951, -0.7691891, 4.603748, 0.6196079, 0, 1, 1,
0.7750443, -1.271414, 4.139616, 0.627451, 0, 1, 1,
0.7794072, 1.329067, 1.471262, 0.6313726, 0, 1, 1,
0.7831567, -0.9238505, 4.774273, 0.6392157, 0, 1, 1,
0.7971755, 2.930397, -0.8485698, 0.6431373, 0, 1, 1,
0.8083376, 1.022179, 1.424971, 0.6509804, 0, 1, 1,
0.8091778, 0.07418812, 1.199232, 0.654902, 0, 1, 1,
0.8181611, 0.9315389, 0.5077434, 0.6627451, 0, 1, 1,
0.8185408, -0.9387605, 1.802648, 0.6666667, 0, 1, 1,
0.8225641, 0.7578344, -0.1249244, 0.6745098, 0, 1, 1,
0.8244363, -0.3184782, 1.292035, 0.6784314, 0, 1, 1,
0.8248121, -1.399055, 3.026811, 0.6862745, 0, 1, 1,
0.8333977, 0.9994738, 0.5590549, 0.6901961, 0, 1, 1,
0.8354555, 1.244267, 2.768356, 0.6980392, 0, 1, 1,
0.8371315, 1.660273, 1.011099, 0.7058824, 0, 1, 1,
0.8413854, 1.904615, -0.1660661, 0.7098039, 0, 1, 1,
0.8418979, -1.227796, 1.199746, 0.7176471, 0, 1, 1,
0.844816, -0.1074719, 1.399076, 0.7215686, 0, 1, 1,
0.8540521, 0.4693483, 1.186947, 0.7294118, 0, 1, 1,
0.8566877, 0.8232973, -1.422012, 0.7333333, 0, 1, 1,
0.858353, -1.068089, 3.470253, 0.7411765, 0, 1, 1,
0.8631777, 1.275295, 1.194764, 0.7450981, 0, 1, 1,
0.8653486, 1.232002, -0.6276527, 0.7529412, 0, 1, 1,
0.8677615, -0.0636449, 2.569894, 0.7568628, 0, 1, 1,
0.8691068, 0.8446134, 0.418171, 0.7647059, 0, 1, 1,
0.869472, 0.8507957, -0.1690853, 0.7686275, 0, 1, 1,
0.8696656, 1.097115, 1.223901, 0.7764706, 0, 1, 1,
0.8705704, -1.243573, 1.496974, 0.7803922, 0, 1, 1,
0.8778533, 0.2604245, 0.224529, 0.7882353, 0, 1, 1,
0.8820012, 0.1852289, -0.851174, 0.7921569, 0, 1, 1,
0.8830132, 2.102331, 0.6913059, 0.8, 0, 1, 1,
0.8888105, 0.6955771, 1.006934, 0.8078431, 0, 1, 1,
0.8924357, -0.5974926, 0.745628, 0.8117647, 0, 1, 1,
0.8939156, -1.265889, 2.543242, 0.8196079, 0, 1, 1,
0.913565, 0.2086264, 1.417082, 0.8235294, 0, 1, 1,
0.9159409, 0.31937, 0.7294295, 0.8313726, 0, 1, 1,
0.9181179, 1.265846, -1.055843, 0.8352941, 0, 1, 1,
0.9190216, -0.04245679, 0.6479638, 0.8431373, 0, 1, 1,
0.9292039, 2.120589, -0.2189917, 0.8470588, 0, 1, 1,
0.9333439, 0.1996047, 1.880336, 0.854902, 0, 1, 1,
0.934922, 1.444355, 0.5615992, 0.8588235, 0, 1, 1,
0.9360853, 0.05148793, 2.843178, 0.8666667, 0, 1, 1,
0.9385897, 0.01343417, 1.340679, 0.8705882, 0, 1, 1,
0.9422988, -1.636915, 3.313178, 0.8784314, 0, 1, 1,
0.9600129, -0.778093, 2.168097, 0.8823529, 0, 1, 1,
0.9601786, -0.03196573, 0.02515413, 0.8901961, 0, 1, 1,
0.9627396, -0.3100711, 1.019819, 0.8941177, 0, 1, 1,
0.96472, -1.515845, 2.015905, 0.9019608, 0, 1, 1,
0.9660523, -1.023263, 2.773636, 0.9098039, 0, 1, 1,
0.9759157, -2.707728, 2.514367, 0.9137255, 0, 1, 1,
0.9816865, -1.284656, 2.059334, 0.9215686, 0, 1, 1,
0.9838865, 0.9360477, 1.680081, 0.9254902, 0, 1, 1,
0.9854172, -1.83697, 3.337563, 0.9333333, 0, 1, 1,
0.9887142, -0.390999, 1.780543, 0.9372549, 0, 1, 1,
0.9902375, -2.506593, 3.791498, 0.945098, 0, 1, 1,
0.9942605, 1.642002, -1.079832, 0.9490196, 0, 1, 1,
0.9946135, -0.1065341, 1.452522, 0.9568627, 0, 1, 1,
0.9946275, -0.382277, 0.6618791, 0.9607843, 0, 1, 1,
0.9967498, -0.6390672, 3.307395, 0.9686275, 0, 1, 1,
0.9980359, 0.007795513, 2.120007, 0.972549, 0, 1, 1,
1.006098, 0.4465595, 2.317195, 0.9803922, 0, 1, 1,
1.010962, -0.07549883, -0.5092725, 0.9843137, 0, 1, 1,
1.012382, 0.6706663, 1.942244, 0.9921569, 0, 1, 1,
1.01388, 0.8155992, 1.327303, 0.9960784, 0, 1, 1,
1.014292, -1.194848, 1.90116, 1, 0, 0.9960784, 1,
1.014322, -1.515694, 2.740002, 1, 0, 0.9882353, 1,
1.01592, -0.3269102, 4.445904, 1, 0, 0.9843137, 1,
1.017031, -0.2757141, 1.38526, 1, 0, 0.9764706, 1,
1.022526, 0.200593, -0.07630727, 1, 0, 0.972549, 1,
1.03441, 0.996149, 2.55376, 1, 0, 0.9647059, 1,
1.035652, 1.403941, 2.503059, 1, 0, 0.9607843, 1,
1.048671, 1.328872, -1.89301, 1, 0, 0.9529412, 1,
1.053584, 0.4844088, 1.558948, 1, 0, 0.9490196, 1,
1.05493, 0.3397314, 3.072715, 1, 0, 0.9411765, 1,
1.062047, -1.647497, 0.6735956, 1, 0, 0.9372549, 1,
1.065567, -0.5073149, 0.8838795, 1, 0, 0.9294118, 1,
1.066163, 1.391911, 0.6274582, 1, 0, 0.9254902, 1,
1.072653, -0.8633808, 3.570376, 1, 0, 0.9176471, 1,
1.074293, 0.1810608, 0.6284813, 1, 0, 0.9137255, 1,
1.077264, 0.6344187, 2.165098, 1, 0, 0.9058824, 1,
1.083828, -0.9848493, 3.385528, 1, 0, 0.9019608, 1,
1.086036, 0.2917048, 1.680503, 1, 0, 0.8941177, 1,
1.087595, -0.9434707, 2.73397, 1, 0, 0.8862745, 1,
1.087613, 0.09012815, 0.3907517, 1, 0, 0.8823529, 1,
1.095515, -0.7278317, 2.138355, 1, 0, 0.8745098, 1,
1.097, -1.113008, 2.334285, 1, 0, 0.8705882, 1,
1.097639, 1.097112, 2.187062, 1, 0, 0.8627451, 1,
1.098383, 0.3703842, 2.086273, 1, 0, 0.8588235, 1,
1.102563, 0.4409078, -0.2995006, 1, 0, 0.8509804, 1,
1.108137, -1.132771, 2.241172, 1, 0, 0.8470588, 1,
1.109226, -1.510807, 4.060043, 1, 0, 0.8392157, 1,
1.111593, -0.4046573, 2.290473, 1, 0, 0.8352941, 1,
1.112443, 0.2125457, 2.904417, 1, 0, 0.827451, 1,
1.11352, -1.301129, 3.033143, 1, 0, 0.8235294, 1,
1.121137, 0.3930418, -0.5282272, 1, 0, 0.8156863, 1,
1.12261, -1.454267, 2.635568, 1, 0, 0.8117647, 1,
1.128572, 0.01290847, 1.591359, 1, 0, 0.8039216, 1,
1.132223, 0.4296974, 1.100278, 1, 0, 0.7960784, 1,
1.145028, -1.084029, 2.637898, 1, 0, 0.7921569, 1,
1.154529, 0.2340901, 0.05769012, 1, 0, 0.7843137, 1,
1.161827, -0.3018486, 0.5505152, 1, 0, 0.7803922, 1,
1.16929, 0.575506, 2.134587, 1, 0, 0.772549, 1,
1.172539, 1.031688, 0.3431247, 1, 0, 0.7686275, 1,
1.173608, -1.357983, 2.651057, 1, 0, 0.7607843, 1,
1.182676, 0.2928992, 1.345998, 1, 0, 0.7568628, 1,
1.186192, -0.4875897, 1.346989, 1, 0, 0.7490196, 1,
1.189015, 0.5783964, 0.6311463, 1, 0, 0.7450981, 1,
1.19598, -2.503334, 2.85054, 1, 0, 0.7372549, 1,
1.204995, -0.3823977, 2.567703, 1, 0, 0.7333333, 1,
1.206521, 0.04163291, 1.519748, 1, 0, 0.7254902, 1,
1.208492, 1.764731, -0.2572297, 1, 0, 0.7215686, 1,
1.221195, -0.4659273, 2.917951, 1, 0, 0.7137255, 1,
1.222297, 0.2473031, 1.231783, 1, 0, 0.7098039, 1,
1.22408, -1.22382, 0.6501737, 1, 0, 0.7019608, 1,
1.224536, -1.096315, 3.776094, 1, 0, 0.6941177, 1,
1.236776, 2.078105, 0.09651653, 1, 0, 0.6901961, 1,
1.245951, 0.577399, 1.547369, 1, 0, 0.682353, 1,
1.24742, -0.03137075, 2.54628, 1, 0, 0.6784314, 1,
1.248955, -0.6697619, 2.158965, 1, 0, 0.6705883, 1,
1.249315, 0.6410133, 0.8893561, 1, 0, 0.6666667, 1,
1.259714, -0.1296711, 2.915676, 1, 0, 0.6588235, 1,
1.263509, -0.8888606, 2.614101, 1, 0, 0.654902, 1,
1.270753, -0.2168154, 1.131505, 1, 0, 0.6470588, 1,
1.278859, -0.3239624, 0.9783105, 1, 0, 0.6431373, 1,
1.287084, -1.029921, 1.742916, 1, 0, 0.6352941, 1,
1.293917, 1.391019, 0.7690462, 1, 0, 0.6313726, 1,
1.294129, 0.2666343, 1.664689, 1, 0, 0.6235294, 1,
1.294749, 0.4557007, 0.7640881, 1, 0, 0.6196079, 1,
1.300378, 1.606773, 0.8305408, 1, 0, 0.6117647, 1,
1.300821, 0.9985403, 0.7564742, 1, 0, 0.6078432, 1,
1.308953, -2.284289, 2.63534, 1, 0, 0.6, 1,
1.31141, -1.299896, 2.607384, 1, 0, 0.5921569, 1,
1.314608, -1.363522, 3.420055, 1, 0, 0.5882353, 1,
1.317537, -0.4177035, 1.352389, 1, 0, 0.5803922, 1,
1.317838, 0.4497894, 1.012236, 1, 0, 0.5764706, 1,
1.319851, -0.01854775, -1.074682, 1, 0, 0.5686275, 1,
1.337823, -0.1800063, 1.815302, 1, 0, 0.5647059, 1,
1.34166, 0.196631, 2.506784, 1, 0, 0.5568628, 1,
1.343214, 0.1440814, 0.965521, 1, 0, 0.5529412, 1,
1.376919, -1.400788, 1.404541, 1, 0, 0.5450981, 1,
1.390318, -0.9324111, 0.7567065, 1, 0, 0.5411765, 1,
1.395188, -0.2088367, 0.7999145, 1, 0, 0.5333334, 1,
1.41366, 0.7461609, 0.8293134, 1, 0, 0.5294118, 1,
1.419211, 0.6517625, 1.504542, 1, 0, 0.5215687, 1,
1.427662, -0.7575265, 2.497989, 1, 0, 0.5176471, 1,
1.443118, 0.3376557, 1.62634, 1, 0, 0.509804, 1,
1.443753, 0.1812577, 1.566946, 1, 0, 0.5058824, 1,
1.448983, 0.1067032, 2.364815, 1, 0, 0.4980392, 1,
1.462849, 0.6081868, 2.220022, 1, 0, 0.4901961, 1,
1.468612, 0.9365792, 1.365806, 1, 0, 0.4862745, 1,
1.470632, -0.9199055, 3.378154, 1, 0, 0.4784314, 1,
1.49171, -1.795974, 3.188753, 1, 0, 0.4745098, 1,
1.492842, -0.3130889, 1.534456, 1, 0, 0.4666667, 1,
1.495588, 0.2792743, 0.9097416, 1, 0, 0.4627451, 1,
1.497331, -0.330005, 1.260847, 1, 0, 0.454902, 1,
1.50663, 1.343079, 1.361328, 1, 0, 0.4509804, 1,
1.507801, 0.9348556, 1.806008, 1, 0, 0.4431373, 1,
1.510625, -0.4823727, 0.337181, 1, 0, 0.4392157, 1,
1.512097, -0.06082184, 0.5007876, 1, 0, 0.4313726, 1,
1.523087, -1.45176, 3.011335, 1, 0, 0.427451, 1,
1.538932, -0.4427868, 1.31953, 1, 0, 0.4196078, 1,
1.539236, 0.7164522, 0.4221745, 1, 0, 0.4156863, 1,
1.540324, -0.05488151, 0.6162073, 1, 0, 0.4078431, 1,
1.550661, -0.7917358, 1.03679, 1, 0, 0.4039216, 1,
1.552074, 1.042616, 0.8513777, 1, 0, 0.3960784, 1,
1.557866, -0.7339256, 1.740825, 1, 0, 0.3882353, 1,
1.560346, 0.3235396, 1.415198, 1, 0, 0.3843137, 1,
1.565463, 1.613484, -1.112691, 1, 0, 0.3764706, 1,
1.592502, -0.2923391, 3.021947, 1, 0, 0.372549, 1,
1.596695, 2.009546, -0.1804992, 1, 0, 0.3647059, 1,
1.605453, -0.05994784, 1.111343, 1, 0, 0.3607843, 1,
1.612005, 0.7901621, -0.966866, 1, 0, 0.3529412, 1,
1.612949, 0.6692232, 1.281853, 1, 0, 0.3490196, 1,
1.646448, 1.719023, 0.4876444, 1, 0, 0.3411765, 1,
1.646969, 2.051337, 1.531727, 1, 0, 0.3372549, 1,
1.65153, -0.5848371, 2.640747, 1, 0, 0.3294118, 1,
1.672501, -0.9312111, 2.87133, 1, 0, 0.3254902, 1,
1.689246, 0.1161786, 1.3542, 1, 0, 0.3176471, 1,
1.689413, 0.6670358, -0.4490766, 1, 0, 0.3137255, 1,
1.716856, -0.1150205, 4.376737, 1, 0, 0.3058824, 1,
1.740542, 0.8515185, 0.265625, 1, 0, 0.2980392, 1,
1.742282, 0.434534, 1.731974, 1, 0, 0.2941177, 1,
1.747159, -0.893301, 2.774602, 1, 0, 0.2862745, 1,
1.748203, 0.6667308, 2.876188, 1, 0, 0.282353, 1,
1.770623, -2.389972, 1.873003, 1, 0, 0.2745098, 1,
1.776299, -0.6584414, 2.515097, 1, 0, 0.2705882, 1,
1.782957, 1.532315, -0.5302826, 1, 0, 0.2627451, 1,
1.784232, 0.1639962, 1.206892, 1, 0, 0.2588235, 1,
1.799733, -1.505424, 1.1429, 1, 0, 0.2509804, 1,
1.809126, -0.1046779, -0.2783541, 1, 0, 0.2470588, 1,
1.814386, -0.9764662, 3.136702, 1, 0, 0.2392157, 1,
1.817781, -0.09683406, 1.048921, 1, 0, 0.2352941, 1,
1.819907, -1.074968, 0.4949337, 1, 0, 0.227451, 1,
1.848009, -1.185833, 1.601634, 1, 0, 0.2235294, 1,
1.854086, 0.5475476, 3.469779, 1, 0, 0.2156863, 1,
1.860165, -1.623918, 3.803645, 1, 0, 0.2117647, 1,
1.892953, -0.427375, -0.05623244, 1, 0, 0.2039216, 1,
1.897493, -0.1774995, 2.377877, 1, 0, 0.1960784, 1,
1.922227, -1.83363, 1.577086, 1, 0, 0.1921569, 1,
1.923998, -0.2615051, 1.492687, 1, 0, 0.1843137, 1,
1.930517, -0.413844, 0.06280077, 1, 0, 0.1803922, 1,
1.934346, 0.1418749, 1.558139, 1, 0, 0.172549, 1,
1.937567, -0.05123771, 1.819306, 1, 0, 0.1686275, 1,
1.938205, -1.970475, 1.009101, 1, 0, 0.1607843, 1,
1.970188, -0.02127644, 2.083136, 1, 0, 0.1568628, 1,
1.971813, 1.198987, 1.265689, 1, 0, 0.1490196, 1,
1.976361, 1.195883, 0.8766798, 1, 0, 0.145098, 1,
1.978199, 1.401268, -0.5159677, 1, 0, 0.1372549, 1,
1.981504, -0.7956259, 0.6189681, 1, 0, 0.1333333, 1,
1.997037, 0.743763, 0.1641672, 1, 0, 0.1254902, 1,
2.005803, 0.1699274, 2.969329, 1, 0, 0.1215686, 1,
2.041643, -1.31774, 0.4367627, 1, 0, 0.1137255, 1,
2.07436, 0.08515745, 3.471057, 1, 0, 0.1098039, 1,
2.119217, 0.6231664, 1.361981, 1, 0, 0.1019608, 1,
2.155766, 0.1050676, 2.40408, 1, 0, 0.09411765, 1,
2.157774, -0.04443941, 0.6851838, 1, 0, 0.09019608, 1,
2.162879, -0.7545099, 2.856174, 1, 0, 0.08235294, 1,
2.175744, 0.3054596, 0.7971455, 1, 0, 0.07843138, 1,
2.194677, -0.1225802, 2.147383, 1, 0, 0.07058824, 1,
2.222609, -1.88618, 4.015197, 1, 0, 0.06666667, 1,
2.23007, -0.9905847, 1.950593, 1, 0, 0.05882353, 1,
2.269223, 0.03494127, 0.8810291, 1, 0, 0.05490196, 1,
2.287087, -1.418173, 0.8077663, 1, 0, 0.04705882, 1,
2.314793, 0.5342571, 0.6535602, 1, 0, 0.04313726, 1,
2.439871, 0.8876074, 1.527232, 1, 0, 0.03529412, 1,
2.445533, 0.2913036, 1.186803, 1, 0, 0.03137255, 1,
2.495646, 0.2915697, 1.291193, 1, 0, 0.02352941, 1,
2.508562, 1.606058, 0.9499471, 1, 0, 0.01960784, 1,
2.5901, -2.293416, 2.592424, 1, 0, 0.01176471, 1,
3.099277, 1.174742, 2.940451, 1, 0, 0.007843138, 1
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
0.0559628, -4.15364, -7.142548, 0, -0.5, 0.5, 0.5,
0.0559628, -4.15364, -7.142548, 1, -0.5, 0.5, 0.5,
0.0559628, -4.15364, -7.142548, 1, 1.5, 0.5, 0.5,
0.0559628, -4.15364, -7.142548, 0, 1.5, 0.5, 0.5
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
-4.019035, 0.09370768, -7.142548, 0, -0.5, 0.5, 0.5,
-4.019035, 0.09370768, -7.142548, 1, -0.5, 0.5, 0.5,
-4.019035, 0.09370768, -7.142548, 1, 1.5, 0.5, 0.5,
-4.019035, 0.09370768, -7.142548, 0, 1.5, 0.5, 0.5
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
-4.019035, -4.15364, 0.119427, 0, -0.5, 0.5, 0.5,
-4.019035, -4.15364, 0.119427, 1, -0.5, 0.5, 0.5,
-4.019035, -4.15364, 0.119427, 1, 1.5, 0.5, 0.5,
-4.019035, -4.15364, 0.119427, 0, 1.5, 0.5, 0.5
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
-2, -3.173483, -5.466708,
3, -3.173483, -5.466708,
-2, -3.173483, -5.466708,
-2, -3.336842, -5.746014,
-1, -3.173483, -5.466708,
-1, -3.336842, -5.746014,
0, -3.173483, -5.466708,
0, -3.336842, -5.746014,
1, -3.173483, -5.466708,
1, -3.336842, -5.746014,
2, -3.173483, -5.466708,
2, -3.336842, -5.746014,
3, -3.173483, -5.466708,
3, -3.336842, -5.746014
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
-2, -3.663561, -6.304628, 0, -0.5, 0.5, 0.5,
-2, -3.663561, -6.304628, 1, -0.5, 0.5, 0.5,
-2, -3.663561, -6.304628, 1, 1.5, 0.5, 0.5,
-2, -3.663561, -6.304628, 0, 1.5, 0.5, 0.5,
-1, -3.663561, -6.304628, 0, -0.5, 0.5, 0.5,
-1, -3.663561, -6.304628, 1, -0.5, 0.5, 0.5,
-1, -3.663561, -6.304628, 1, 1.5, 0.5, 0.5,
-1, -3.663561, -6.304628, 0, 1.5, 0.5, 0.5,
0, -3.663561, -6.304628, 0, -0.5, 0.5, 0.5,
0, -3.663561, -6.304628, 1, -0.5, 0.5, 0.5,
0, -3.663561, -6.304628, 1, 1.5, 0.5, 0.5,
0, -3.663561, -6.304628, 0, 1.5, 0.5, 0.5,
1, -3.663561, -6.304628, 0, -0.5, 0.5, 0.5,
1, -3.663561, -6.304628, 1, -0.5, 0.5, 0.5,
1, -3.663561, -6.304628, 1, 1.5, 0.5, 0.5,
1, -3.663561, -6.304628, 0, 1.5, 0.5, 0.5,
2, -3.663561, -6.304628, 0, -0.5, 0.5, 0.5,
2, -3.663561, -6.304628, 1, -0.5, 0.5, 0.5,
2, -3.663561, -6.304628, 1, 1.5, 0.5, 0.5,
2, -3.663561, -6.304628, 0, 1.5, 0.5, 0.5,
3, -3.663561, -6.304628, 0, -0.5, 0.5, 0.5,
3, -3.663561, -6.304628, 1, -0.5, 0.5, 0.5,
3, -3.663561, -6.304628, 1, 1.5, 0.5, 0.5,
3, -3.663561, -6.304628, 0, 1.5, 0.5, 0.5
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
-3.078651, -3, -5.466708,
-3.078651, 3, -5.466708,
-3.078651, -3, -5.466708,
-3.235382, -3, -5.746014,
-3.078651, -2, -5.466708,
-3.235382, -2, -5.746014,
-3.078651, -1, -5.466708,
-3.235382, -1, -5.746014,
-3.078651, 0, -5.466708,
-3.235382, 0, -5.746014,
-3.078651, 1, -5.466708,
-3.235382, 1, -5.746014,
-3.078651, 2, -5.466708,
-3.235382, 2, -5.746014,
-3.078651, 3, -5.466708,
-3.235382, 3, -5.746014
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
-3.548843, -3, -6.304628, 0, -0.5, 0.5, 0.5,
-3.548843, -3, -6.304628, 1, -0.5, 0.5, 0.5,
-3.548843, -3, -6.304628, 1, 1.5, 0.5, 0.5,
-3.548843, -3, -6.304628, 0, 1.5, 0.5, 0.5,
-3.548843, -2, -6.304628, 0, -0.5, 0.5, 0.5,
-3.548843, -2, -6.304628, 1, -0.5, 0.5, 0.5,
-3.548843, -2, -6.304628, 1, 1.5, 0.5, 0.5,
-3.548843, -2, -6.304628, 0, 1.5, 0.5, 0.5,
-3.548843, -1, -6.304628, 0, -0.5, 0.5, 0.5,
-3.548843, -1, -6.304628, 1, -0.5, 0.5, 0.5,
-3.548843, -1, -6.304628, 1, 1.5, 0.5, 0.5,
-3.548843, -1, -6.304628, 0, 1.5, 0.5, 0.5,
-3.548843, 0, -6.304628, 0, -0.5, 0.5, 0.5,
-3.548843, 0, -6.304628, 1, -0.5, 0.5, 0.5,
-3.548843, 0, -6.304628, 1, 1.5, 0.5, 0.5,
-3.548843, 0, -6.304628, 0, 1.5, 0.5, 0.5,
-3.548843, 1, -6.304628, 0, -0.5, 0.5, 0.5,
-3.548843, 1, -6.304628, 1, -0.5, 0.5, 0.5,
-3.548843, 1, -6.304628, 1, 1.5, 0.5, 0.5,
-3.548843, 1, -6.304628, 0, 1.5, 0.5, 0.5,
-3.548843, 2, -6.304628, 0, -0.5, 0.5, 0.5,
-3.548843, 2, -6.304628, 1, -0.5, 0.5, 0.5,
-3.548843, 2, -6.304628, 1, 1.5, 0.5, 0.5,
-3.548843, 2, -6.304628, 0, 1.5, 0.5, 0.5,
-3.548843, 3, -6.304628, 0, -0.5, 0.5, 0.5,
-3.548843, 3, -6.304628, 1, -0.5, 0.5, 0.5,
-3.548843, 3, -6.304628, 1, 1.5, 0.5, 0.5,
-3.548843, 3, -6.304628, 0, 1.5, 0.5, 0.5
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
-3.078651, -3.173483, -4,
-3.078651, -3.173483, 4,
-3.078651, -3.173483, -4,
-3.235382, -3.336842, -4,
-3.078651, -3.173483, -2,
-3.235382, -3.336842, -2,
-3.078651, -3.173483, 0,
-3.235382, -3.336842, 0,
-3.078651, -3.173483, 2,
-3.235382, -3.336842, 2,
-3.078651, -3.173483, 4,
-3.235382, -3.336842, 4
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
-3.548843, -3.663561, -4, 0, -0.5, 0.5, 0.5,
-3.548843, -3.663561, -4, 1, -0.5, 0.5, 0.5,
-3.548843, -3.663561, -4, 1, 1.5, 0.5, 0.5,
-3.548843, -3.663561, -4, 0, 1.5, 0.5, 0.5,
-3.548843, -3.663561, -2, 0, -0.5, 0.5, 0.5,
-3.548843, -3.663561, -2, 1, -0.5, 0.5, 0.5,
-3.548843, -3.663561, -2, 1, 1.5, 0.5, 0.5,
-3.548843, -3.663561, -2, 0, 1.5, 0.5, 0.5,
-3.548843, -3.663561, 0, 0, -0.5, 0.5, 0.5,
-3.548843, -3.663561, 0, 1, -0.5, 0.5, 0.5,
-3.548843, -3.663561, 0, 1, 1.5, 0.5, 0.5,
-3.548843, -3.663561, 0, 0, 1.5, 0.5, 0.5,
-3.548843, -3.663561, 2, 0, -0.5, 0.5, 0.5,
-3.548843, -3.663561, 2, 1, -0.5, 0.5, 0.5,
-3.548843, -3.663561, 2, 1, 1.5, 0.5, 0.5,
-3.548843, -3.663561, 2, 0, 1.5, 0.5, 0.5,
-3.548843, -3.663561, 4, 0, -0.5, 0.5, 0.5,
-3.548843, -3.663561, 4, 1, -0.5, 0.5, 0.5,
-3.548843, -3.663561, 4, 1, 1.5, 0.5, 0.5,
-3.548843, -3.663561, 4, 0, 1.5, 0.5, 0.5
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
-3.078651, -3.173483, -5.466708,
-3.078651, 3.360898, -5.466708,
-3.078651, -3.173483, 5.705562,
-3.078651, 3.360898, 5.705562,
-3.078651, -3.173483, -5.466708,
-3.078651, -3.173483, 5.705562,
-3.078651, 3.360898, -5.466708,
-3.078651, 3.360898, 5.705562,
-3.078651, -3.173483, -5.466708,
3.190577, -3.173483, -5.466708,
-3.078651, -3.173483, 5.705562,
3.190577, -3.173483, 5.705562,
-3.078651, 3.360898, -5.466708,
3.190577, 3.360898, -5.466708,
-3.078651, 3.360898, 5.705562,
3.190577, 3.360898, 5.705562,
3.190577, -3.173483, -5.466708,
3.190577, 3.360898, -5.466708,
3.190577, -3.173483, 5.705562,
3.190577, 3.360898, 5.705562,
3.190577, -3.173483, -5.466708,
3.190577, -3.173483, 5.705562,
3.190577, 3.360898, -5.466708,
3.190577, 3.360898, 5.705562
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
var radius = 7.679319;
var distance = 34.16616;
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
mvMatrix.translate( -0.0559628, -0.09370768, -0.119427 );
mvMatrix.scale( 1.324411, 1.270668, 0.7431821 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16616);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
nicosulfuron<-read.table("nicosulfuron.xyz")
```

```
## Error in read.table("nicosulfuron.xyz"): no lines available in input
```

```r
x<-nicosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
```

```r
y<-nicosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
```

```r
z<-nicosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
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
-2.987351, 2.002904, -1.633814, 0, 0, 1, 1, 1,
-2.848916, -1.0748, -2.61452, 1, 0, 0, 1, 1,
-2.725496, -1.904843, -2.757618, 1, 0, 0, 1, 1,
-2.635946, 2.596744, -0.2347976, 1, 0, 0, 1, 1,
-2.603968, 1.062553, -1.213304, 1, 0, 0, 1, 1,
-2.582844, 0.2084747, -0.2555829, 1, 0, 0, 1, 1,
-2.361978, 0.3796487, -2.006296, 0, 0, 0, 1, 1,
-2.305525, -0.7759879, -2.332987, 0, 0, 0, 1, 1,
-2.302177, -0.6914497, -1.467054, 0, 0, 0, 1, 1,
-2.261002, -0.9183757, -2.436707, 0, 0, 0, 1, 1,
-2.230212, 0.2335692, -3.022023, 0, 0, 0, 1, 1,
-2.229281, 1.127616, -0.1172835, 0, 0, 0, 1, 1,
-2.109139, 0.5239121, -1.191627, 0, 0, 0, 1, 1,
-2.042018, 1.002141, -0.8602076, 1, 1, 1, 1, 1,
-2.02566, -0.3794979, -2.013179, 1, 1, 1, 1, 1,
-1.986241, -0.1329663, -1.256502, 1, 1, 1, 1, 1,
-1.97227, 3.265737, -0.9985376, 1, 1, 1, 1, 1,
-1.957438, 0.07832773, -1.724448, 1, 1, 1, 1, 1,
-1.947823, 1.028457, -1.990284, 1, 1, 1, 1, 1,
-1.940486, 1.974102, -0.6234368, 1, 1, 1, 1, 1,
-1.94042, -0.4613349, -1.156223, 1, 1, 1, 1, 1,
-1.935179, -0.309266, -2.388173, 1, 1, 1, 1, 1,
-1.930154, 0.09003101, -1.374725, 1, 1, 1, 1, 1,
-1.923675, -0.636585, -3.78511, 1, 1, 1, 1, 1,
-1.916355, -2.36499, -1.821443, 1, 1, 1, 1, 1,
-1.881489, 0.6365758, -1.926475, 1, 1, 1, 1, 1,
-1.879704, 0.6906887, -0.904134, 1, 1, 1, 1, 1,
-1.849683, 2.352842, -2.109272, 1, 1, 1, 1, 1,
-1.848414, 0.06793854, 0.4081239, 0, 0, 1, 1, 1,
-1.827642, -1.466249, -0.3225542, 1, 0, 0, 1, 1,
-1.82107, -0.8571352, -1.520923, 1, 0, 0, 1, 1,
-1.819184, 0.4761608, -1.281706, 1, 0, 0, 1, 1,
-1.804525, -0.7485774, -1.956155, 1, 0, 0, 1, 1,
-1.784613, 0.3931584, -1.547131, 1, 0, 0, 1, 1,
-1.777452, 0.5541205, -2.455504, 0, 0, 0, 1, 1,
-1.771798, -0.5035053, -1.063767, 0, 0, 0, 1, 1,
-1.69762, -0.8924912, -4.248632, 0, 0, 0, 1, 1,
-1.695686, 0.4160989, -0.08364839, 0, 0, 0, 1, 1,
-1.692939, 0.2797112, -1.235704, 0, 0, 0, 1, 1,
-1.680802, -0.2969137, -2.402647, 0, 0, 0, 1, 1,
-1.665378, -1.361768, -2.664091, 0, 0, 0, 1, 1,
-1.661077, -0.8086281, -1.178763, 1, 1, 1, 1, 1,
-1.659542, 0.8477554, -1.152702, 1, 1, 1, 1, 1,
-1.632039, 0.6366213, -1.016864, 1, 1, 1, 1, 1,
-1.626045, 0.4174032, -1.958847, 1, 1, 1, 1, 1,
-1.62451, -1.650275, -1.705349, 1, 1, 1, 1, 1,
-1.623942, 0.1896158, -2.303837, 1, 1, 1, 1, 1,
-1.623161, -0.8400647, -1.701095, 1, 1, 1, 1, 1,
-1.62225, 0.4002238, 0.008224221, 1, 1, 1, 1, 1,
-1.620399, -0.6107793, -4.267194, 1, 1, 1, 1, 1,
-1.619847, 0.2589093, -0.3739522, 1, 1, 1, 1, 1,
-1.612201, 1.126166, -1.576135, 1, 1, 1, 1, 1,
-1.608882, -0.9089287, -3.537563, 1, 1, 1, 1, 1,
-1.606288, -1.308006, -3.391563, 1, 1, 1, 1, 1,
-1.599739, -0.3786855, -1.036879, 1, 1, 1, 1, 1,
-1.598775, 0.7907084, -0.3477297, 1, 1, 1, 1, 1,
-1.596291, -1.114872, -1.645696, 0, 0, 1, 1, 1,
-1.585637, -1.137768, -3.559236, 1, 0, 0, 1, 1,
-1.584536, 1.077046, -2.061061, 1, 0, 0, 1, 1,
-1.563272, 1.782761, -0.03941601, 1, 0, 0, 1, 1,
-1.552814, -0.02156015, -1.172596, 1, 0, 0, 1, 1,
-1.552637, 0.5313984, -2.54011, 1, 0, 0, 1, 1,
-1.550257, -0.6636443, -1.345448, 0, 0, 0, 1, 1,
-1.546061, -2.339272, -3.988604, 0, 0, 0, 1, 1,
-1.545558, -0.1790108, -1.79297, 0, 0, 0, 1, 1,
-1.531679, -0.07438415, -2.108564, 0, 0, 0, 1, 1,
-1.529319, -0.6854265, -2.917057, 0, 0, 0, 1, 1,
-1.527003, -0.3293267, -3.296363, 0, 0, 0, 1, 1,
-1.50537, 2.605584, -1.224285, 0, 0, 0, 1, 1,
-1.500386, -0.5277662, -1.671858, 1, 1, 1, 1, 1,
-1.482491, -0.5046144, -0.6274523, 1, 1, 1, 1, 1,
-1.476314, 0.1969533, 1.324477, 1, 1, 1, 1, 1,
-1.475697, 0.3114839, -2.68533, 1, 1, 1, 1, 1,
-1.468004, 0.04202643, 0.733038, 1, 1, 1, 1, 1,
-1.445178, -1.681569, -2.607121, 1, 1, 1, 1, 1,
-1.444088, 2.817553, -1.285335, 1, 1, 1, 1, 1,
-1.439505, 0.4032867, -1.272303, 1, 1, 1, 1, 1,
-1.431942, 1.127917, -1.526547, 1, 1, 1, 1, 1,
-1.413809, 0.9457955, -0.7065947, 1, 1, 1, 1, 1,
-1.410289, -0.9769601, -3.071131, 1, 1, 1, 1, 1,
-1.390375, -0.700093, -3.104817, 1, 1, 1, 1, 1,
-1.38157, -0.009298106, -1.882847, 1, 1, 1, 1, 1,
-1.37418, 0.5741966, -0.3706543, 1, 1, 1, 1, 1,
-1.372819, -0.5680977, -1.079385, 1, 1, 1, 1, 1,
-1.371826, -1.491048, -2.066815, 0, 0, 1, 1, 1,
-1.353301, 0.02031527, -0.5625988, 1, 0, 0, 1, 1,
-1.341083, 1.311724, -1.971729, 1, 0, 0, 1, 1,
-1.329268, -1.519282, -1.307491, 1, 0, 0, 1, 1,
-1.327975, 1.001794, -1.782263, 1, 0, 0, 1, 1,
-1.325175, 1.093251, -1.17899, 1, 0, 0, 1, 1,
-1.320655, -2.044116, -1.86715, 0, 0, 0, 1, 1,
-1.316591, 0.8263375, -1.377273, 0, 0, 0, 1, 1,
-1.307782, -0.01662877, -1.698736, 0, 0, 0, 1, 1,
-1.300223, -0.009542544, 0.2637643, 0, 0, 0, 1, 1,
-1.299679, 0.7535194, -0.9024524, 0, 0, 0, 1, 1,
-1.29624, 0.3262056, -1.196994, 0, 0, 0, 1, 1,
-1.294147, -0.6827102, -0.9686437, 0, 0, 0, 1, 1,
-1.292051, -0.3518988, -0.7497377, 1, 1, 1, 1, 1,
-1.286453, 0.8416404, -1.279531, 1, 1, 1, 1, 1,
-1.284362, -1.26693, -4.433457, 1, 1, 1, 1, 1,
-1.282847, 1.849153, -0.2446782, 1, 1, 1, 1, 1,
-1.277137, 0.2239977, -1.314063, 1, 1, 1, 1, 1,
-1.270322, -2.282404, -2.289768, 1, 1, 1, 1, 1,
-1.262647, 0.1910378, -1.315885, 1, 1, 1, 1, 1,
-1.262091, -0.9615906, -2.321182, 1, 1, 1, 1, 1,
-1.26195, 0.6007169, -1.481091, 1, 1, 1, 1, 1,
-1.254784, 2.824008, -0.008746366, 1, 1, 1, 1, 1,
-1.253891, -0.06857449, -1.659839, 1, 1, 1, 1, 1,
-1.241791, -1.574162, -2.632688, 1, 1, 1, 1, 1,
-1.237085, 0.4367239, -1.75573, 1, 1, 1, 1, 1,
-1.230355, -2.342652, -2.953861, 1, 1, 1, 1, 1,
-1.228994, -1.195069, -0.8035727, 1, 1, 1, 1, 1,
-1.225787, -0.2189856, -3.214104, 0, 0, 1, 1, 1,
-1.217067, 1.156903, 0.68808, 1, 0, 0, 1, 1,
-1.214685, 1.016007, -3.185851, 1, 0, 0, 1, 1,
-1.213972, 0.9928034, -1.21452, 1, 0, 0, 1, 1,
-1.194946, -0.3869584, -0.7106912, 1, 0, 0, 1, 1,
-1.19075, 1.061503, 0.256564, 1, 0, 0, 1, 1,
-1.189993, -1.858017, -2.145211, 0, 0, 0, 1, 1,
-1.187939, -0.145809, -1.941846, 0, 0, 0, 1, 1,
-1.187712, 0.2965007, -0.3399095, 0, 0, 0, 1, 1,
-1.181832, -2.918253, 0.1035889, 0, 0, 0, 1, 1,
-1.164732, -0.6749152, -3.882642, 0, 0, 0, 1, 1,
-1.162188, 0.7469459, -1.094814, 0, 0, 0, 1, 1,
-1.150772, 1.113255, -1.694403, 0, 0, 0, 1, 1,
-1.142584, 0.01286235, -2.747061, 1, 1, 1, 1, 1,
-1.134279, 1.246221, -1.673838, 1, 1, 1, 1, 1,
-1.130424, -0.1521391, -2.927112, 1, 1, 1, 1, 1,
-1.129194, -1.520237, -4.570618, 1, 1, 1, 1, 1,
-1.118092, -1.350427, -2.190082, 1, 1, 1, 1, 1,
-1.109115, -0.8880655, -1.938991, 1, 1, 1, 1, 1,
-1.100825, -0.1884962, -1.084045, 1, 1, 1, 1, 1,
-1.099574, -0.8631561, -2.584004, 1, 1, 1, 1, 1,
-1.097713, 0.06411731, -1.024686, 1, 1, 1, 1, 1,
-1.09522, -0.2564347, -1.908877, 1, 1, 1, 1, 1,
-1.081948, -3.078322, -1.456267, 1, 1, 1, 1, 1,
-1.081216, -0.7165265, -0.8360916, 1, 1, 1, 1, 1,
-1.062868, 2.508963, -0.1748996, 1, 1, 1, 1, 1,
-1.061619, -0.1496754, -3.217526, 1, 1, 1, 1, 1,
-1.058656, -0.8502684, -1.90321, 1, 1, 1, 1, 1,
-1.058517, -0.5895284, -1.978232, 0, 0, 1, 1, 1,
-1.053405, 1.358915, -0.5599216, 1, 0, 0, 1, 1,
-1.048179, 0.3325424, -1.532559, 1, 0, 0, 1, 1,
-1.045444, -0.2320542, -3.407985, 1, 0, 0, 1, 1,
-1.040436, 0.006918977, -1.674699, 1, 0, 0, 1, 1,
-1.034436, 0.9290929, -0.8234967, 1, 0, 0, 1, 1,
-1.029462, 0.3997696, -1.544287, 0, 0, 0, 1, 1,
-1.026583, -0.6710254, -3.095242, 0, 0, 0, 1, 1,
-1.015275, -1.098038, -2.963279, 0, 0, 0, 1, 1,
-1.013956, 0.3461097, -1.624877, 0, 0, 0, 1, 1,
-1.012856, 1.252866, -0.5724961, 0, 0, 0, 1, 1,
-1.007691, 0.6683113, 0.1034728, 0, 0, 0, 1, 1,
-1.005031, 0.2315246, -1.238976, 0, 0, 0, 1, 1,
-1.001252, -0.7850438, -2.136103, 1, 1, 1, 1, 1,
-0.9995534, -0.6456892, -2.140299, 1, 1, 1, 1, 1,
-0.9982073, -1.246198, -2.859325, 1, 1, 1, 1, 1,
-0.9878618, -0.3379323, -5.304005, 1, 1, 1, 1, 1,
-0.9844185, 0.5107184, -0.2377741, 1, 1, 1, 1, 1,
-0.9762131, -0.4980732, -4.153244, 1, 1, 1, 1, 1,
-0.9745871, -0.3464239, -1.433816, 1, 1, 1, 1, 1,
-0.9681596, -2.437042, -3.771256, 1, 1, 1, 1, 1,
-0.9655091, -0.8306639, -1.745109, 1, 1, 1, 1, 1,
-0.9606907, -0.9481649, -1.94464, 1, 1, 1, 1, 1,
-0.9545925, 0.5651369, -0.4691302, 1, 1, 1, 1, 1,
-0.9516926, 0.6773097, -0.6943734, 1, 1, 1, 1, 1,
-0.9449023, 0.224916, 0.1032728, 1, 1, 1, 1, 1,
-0.9442032, -0.9765908, -3.2591, 1, 1, 1, 1, 1,
-0.9424827, 1.48687, -0.852293, 1, 1, 1, 1, 1,
-0.9422405, 1.094843, -0.253061, 0, 0, 1, 1, 1,
-0.9417686, -1.27813, -2.434402, 1, 0, 0, 1, 1,
-0.9390984, -0.3183488, -0.3476835, 1, 0, 0, 1, 1,
-0.938005, 0.01161135, -4.230756, 1, 0, 0, 1, 1,
-0.9349993, 0.2933213, -1.901675, 1, 0, 0, 1, 1,
-0.9336303, 0.8338764, -0.05179669, 1, 0, 0, 1, 1,
-0.9323572, 0.9937193, -0.108532, 0, 0, 0, 1, 1,
-0.9274441, 0.1790587, -1.695499, 0, 0, 0, 1, 1,
-0.9237951, -1.186307, -3.033608, 0, 0, 0, 1, 1,
-0.9231122, -1.301852, -1.521332, 0, 0, 0, 1, 1,
-0.9219792, -0.414739, -2.58794, 0, 0, 0, 1, 1,
-0.9184813, 1.736084, -0.8853019, 0, 0, 0, 1, 1,
-0.9093054, 0.6387835, -0.4483615, 0, 0, 0, 1, 1,
-0.9082531, 0.1856518, -2.296648, 1, 1, 1, 1, 1,
-0.9028902, -0.2366706, -0.7784708, 1, 1, 1, 1, 1,
-0.9006809, 0.04650558, -1.025963, 1, 1, 1, 1, 1,
-0.8859734, 1.516497, -0.6386942, 1, 1, 1, 1, 1,
-0.8813151, 0.5437376, 0.02653419, 1, 1, 1, 1, 1,
-0.8809463, -0.8433282, -3.591094, 1, 1, 1, 1, 1,
-0.8770391, 0.4721105, -1.508687, 1, 1, 1, 1, 1,
-0.8703167, 0.7883117, -2.058183, 1, 1, 1, 1, 1,
-0.867439, -1.193128, -4.315324, 1, 1, 1, 1, 1,
-0.8658305, -0.002710089, -0.7212884, 1, 1, 1, 1, 1,
-0.8644174, 0.9691448, -0.08462378, 1, 1, 1, 1, 1,
-0.8614438, -0.5273484, -2.21209, 1, 1, 1, 1, 1,
-0.8612436, 0.2971752, 0.1977575, 1, 1, 1, 1, 1,
-0.8580855, 2.641139, -1.284773, 1, 1, 1, 1, 1,
-0.8556918, 1.107788, -2.110599, 1, 1, 1, 1, 1,
-0.8399668, 1.770879, -1.249409, 0, 0, 1, 1, 1,
-0.8381321, -0.1921473, 0.003150667, 1, 0, 0, 1, 1,
-0.8336546, 1.556849, -0.6303237, 1, 0, 0, 1, 1,
-0.8259409, 0.6486519, 0.8001372, 1, 0, 0, 1, 1,
-0.8243304, 1.845541, 0.9272928, 1, 0, 0, 1, 1,
-0.8232372, 1.390765, -1.734762, 1, 0, 0, 1, 1,
-0.8219298, 0.1189376, -0.578617, 0, 0, 0, 1, 1,
-0.8205907, 1.159299, 1.483895, 0, 0, 0, 1, 1,
-0.8147364, -0.0792381, -2.066025, 0, 0, 0, 1, 1,
-0.8103853, -0.2282773, -0.9294199, 0, 0, 0, 1, 1,
-0.805511, 1.405701, 1.28069, 0, 0, 0, 1, 1,
-0.8036202, 1.197525, -0.04541054, 0, 0, 0, 1, 1,
-0.8006752, 0.3853389, 1.272054, 0, 0, 0, 1, 1,
-0.7999756, -1.906791, -2.162638, 1, 1, 1, 1, 1,
-0.7985266, 1.525635, -0.3396513, 1, 1, 1, 1, 1,
-0.7981918, -1.035921, -2.664966, 1, 1, 1, 1, 1,
-0.7944368, 0.7006359, 0.3644081, 1, 1, 1, 1, 1,
-0.7921035, -0.7735255, -4.932165, 1, 1, 1, 1, 1,
-0.7910651, -0.05231317, -2.604168, 1, 1, 1, 1, 1,
-0.7906398, 0.02666249, -2.821223, 1, 1, 1, 1, 1,
-0.7904229, 0.3674909, -3.256563, 1, 1, 1, 1, 1,
-0.7885775, 1.754365, -1.71757, 1, 1, 1, 1, 1,
-0.777177, 0.3111349, 2.415702, 1, 1, 1, 1, 1,
-0.7760571, 0.09370489, -1.960723, 1, 1, 1, 1, 1,
-0.7738105, 0.9979949, -0.1676707, 1, 1, 1, 1, 1,
-0.7737918, 0.954159, -2.394441, 1, 1, 1, 1, 1,
-0.7707096, -1.47811, -3.25791, 1, 1, 1, 1, 1,
-0.7706738, 1.321738, -1.131828, 1, 1, 1, 1, 1,
-0.7624184, 0.7097781, -1.433613, 0, 0, 1, 1, 1,
-0.7586718, -1.576723, -2.547005, 1, 0, 0, 1, 1,
-0.75112, 0.8180069, -1.798711, 1, 0, 0, 1, 1,
-0.7508194, -1.617404, -3.953086, 1, 0, 0, 1, 1,
-0.7501574, -2.088922, -3.071991, 1, 0, 0, 1, 1,
-0.7467942, -0.002400924, -0.3869936, 1, 0, 0, 1, 1,
-0.741907, -0.2230694, -0.5234831, 0, 0, 0, 1, 1,
-0.7381326, -0.7918504, -1.42228, 0, 0, 0, 1, 1,
-0.7370961, 0.2839252, 0.08592517, 0, 0, 0, 1, 1,
-0.7267718, 1.621582, 1.706275, 0, 0, 0, 1, 1,
-0.7265576, 1.954041, 1.793556, 0, 0, 0, 1, 1,
-0.7243551, -0.677889, -2.472933, 0, 0, 0, 1, 1,
-0.7209519, -1.07097, -1.499825, 0, 0, 0, 1, 1,
-0.7181441, -0.1883238, -2.750373, 1, 1, 1, 1, 1,
-0.717817, 1.054508, 0.0891408, 1, 1, 1, 1, 1,
-0.7171955, -1.371527, -2.793509, 1, 1, 1, 1, 1,
-0.7110389, -0.1368471, -3.296112, 1, 1, 1, 1, 1,
-0.7106799, 0.1376757, -2.668095, 1, 1, 1, 1, 1,
-0.7049183, -0.009136744, -2.599444, 1, 1, 1, 1, 1,
-0.7008255, -1.024607, -3.154003, 1, 1, 1, 1, 1,
-0.6987648, -0.4844887, -1.937763, 1, 1, 1, 1, 1,
-0.6856508, -1.858354, -1.525155, 1, 1, 1, 1, 1,
-0.6854853, -0.5906215, -4.006507, 1, 1, 1, 1, 1,
-0.6853579, -0.9934016, -4.009117, 1, 1, 1, 1, 1,
-0.6845208, 1.174866, -0.1189165, 1, 1, 1, 1, 1,
-0.6842055, -1.041736, -1.881311, 1, 1, 1, 1, 1,
-0.6813089, -1.550771, -2.225916, 1, 1, 1, 1, 1,
-0.6792844, -1.968401, -3.078503, 1, 1, 1, 1, 1,
-0.6750932, 0.562224, -1.162508, 0, 0, 1, 1, 1,
-0.6741701, 0.3669554, -1.328656, 1, 0, 0, 1, 1,
-0.6731705, -0.8510447, -3.573792, 1, 0, 0, 1, 1,
-0.6724807, 0.1024318, -1.414742, 1, 0, 0, 1, 1,
-0.6667866, 0.2200105, -1.014622, 1, 0, 0, 1, 1,
-0.6618502, 1.021438, -1.795402, 1, 0, 0, 1, 1,
-0.6607656, -0.7939662, -2.774143, 0, 0, 0, 1, 1,
-0.6574322, -0.1144253, -2.778949, 0, 0, 0, 1, 1,
-0.6513478, 0.4667986, -0.8548742, 0, 0, 0, 1, 1,
-0.6466521, 0.3033533, -2.20026, 0, 0, 0, 1, 1,
-0.6457441, -1.075768, -1.855059, 0, 0, 0, 1, 1,
-0.6453571, -1.834017, -4.517146, 0, 0, 0, 1, 1,
-0.6374054, 1.256358, 0.5312839, 0, 0, 0, 1, 1,
-0.6366795, 0.5419045, -3.130134, 1, 1, 1, 1, 1,
-0.632534, 1.156451, 0.4317544, 1, 1, 1, 1, 1,
-0.632325, -0.7246521, 0.1078617, 1, 1, 1, 1, 1,
-0.6291494, 0.9464918, -0.3945532, 1, 1, 1, 1, 1,
-0.6256091, 1.106244, -1.945862, 1, 1, 1, 1, 1,
-0.6171226, -0.7818257, -1.934573, 1, 1, 1, 1, 1,
-0.6157115, -1.208914, -2.886966, 1, 1, 1, 1, 1,
-0.6150883, -1.975903, -3.844821, 1, 1, 1, 1, 1,
-0.6138662, -1.160751, -1.857726, 1, 1, 1, 1, 1,
-0.609801, -0.140062, -1.125284, 1, 1, 1, 1, 1,
-0.6041185, -0.1265203, -2.316548, 1, 1, 1, 1, 1,
-0.6001077, 0.4042137, -0.9945903, 1, 1, 1, 1, 1,
-0.5988067, -0.1609164, -0.6701428, 1, 1, 1, 1, 1,
-0.595204, -0.2421975, -4.174709, 1, 1, 1, 1, 1,
-0.5946345, -0.8054226, -1.421728, 1, 1, 1, 1, 1,
-0.59168, -1.090115, -3.739497, 0, 0, 1, 1, 1,
-0.5872998, -0.4059407, -1.435602, 1, 0, 0, 1, 1,
-0.5871426, 0.7078764, -0.4067522, 1, 0, 0, 1, 1,
-0.5844964, 0.1425561, -1.772932, 1, 0, 0, 1, 1,
-0.5824344, 1.271867, -0.8747637, 1, 0, 0, 1, 1,
-0.5799082, 0.8718697, -0.06825978, 1, 0, 0, 1, 1,
-0.5788032, 0.3330959, -0.4613928, 0, 0, 0, 1, 1,
-0.5767198, 0.535413, 0.2608907, 0, 0, 0, 1, 1,
-0.5743052, -0.2385932, -1.09275, 0, 0, 0, 1, 1,
-0.5739579, -0.1044379, -0.528966, 0, 0, 0, 1, 1,
-0.5728599, 0.211271, -2.17335, 0, 0, 0, 1, 1,
-0.5702592, 0.9414448, -0.4293672, 0, 0, 0, 1, 1,
-0.5684738, -0.8067023, -0.9206862, 0, 0, 0, 1, 1,
-0.5675069, -0.5822353, -0.6584218, 1, 1, 1, 1, 1,
-0.5673698, 0.7293697, 0.3187484, 1, 1, 1, 1, 1,
-0.5639093, -1.744143, -2.54361, 1, 1, 1, 1, 1,
-0.5623302, -2.198306, -2.240216, 1, 1, 1, 1, 1,
-0.5620242, -0.4356942, -1.532683, 1, 1, 1, 1, 1,
-0.5590155, -0.2148676, -1.80337, 1, 1, 1, 1, 1,
-0.5574426, -1.66157, -3.868724, 1, 1, 1, 1, 1,
-0.5526677, -0.3108458, -2.262532, 1, 1, 1, 1, 1,
-0.5509469, 0.4027447, -0.1560517, 1, 1, 1, 1, 1,
-0.5495394, 0.3495458, -0.3953207, 1, 1, 1, 1, 1,
-0.5459136, 0.225224, -1.756821, 1, 1, 1, 1, 1,
-0.5431374, 0.9842995, -0.6709453, 1, 1, 1, 1, 1,
-0.5382242, -0.6514301, -1.825688, 1, 1, 1, 1, 1,
-0.5334274, 0.6965383, -2.417644, 1, 1, 1, 1, 1,
-0.5317943, 0.1373793, -0.5626935, 1, 1, 1, 1, 1,
-0.526807, -0.6905791, -1.155863, 0, 0, 1, 1, 1,
-0.526419, -0.6330202, -2.791116, 1, 0, 0, 1, 1,
-0.5193419, -0.373175, -4.339811, 1, 0, 0, 1, 1,
-0.5162632, 1.348524, -0.1727819, 1, 0, 0, 1, 1,
-0.5152572, 1.326524, -1.989997, 1, 0, 0, 1, 1,
-0.5152285, 1.013783, -0.91234, 1, 0, 0, 1, 1,
-0.510272, -0.7698787, -2.626957, 0, 0, 0, 1, 1,
-0.5079917, -1.226338, -2.674942, 0, 0, 0, 1, 1,
-0.5061119, -0.5950221, -2.337937, 0, 0, 0, 1, 1,
-0.5049402, 1.562206, -0.5283317, 0, 0, 0, 1, 1,
-0.5049172, -0.3734897, -2.446999, 0, 0, 0, 1, 1,
-0.503588, 0.8023242, -1.784433, 0, 0, 0, 1, 1,
-0.5014028, 0.5534167, 0.9639127, 0, 0, 0, 1, 1,
-0.4983707, 0.5261471, 0.273251, 1, 1, 1, 1, 1,
-0.4941231, 0.1930078, -1.261078, 1, 1, 1, 1, 1,
-0.4928308, -0.2767757, -1.223734, 1, 1, 1, 1, 1,
-0.4914314, 1.129243, 0.6195269, 1, 1, 1, 1, 1,
-0.4904902, -2.015532, -3.189407, 1, 1, 1, 1, 1,
-0.4898265, -1.872165, -3.176401, 1, 1, 1, 1, 1,
-0.4829572, 0.2527132, -1.004475, 1, 1, 1, 1, 1,
-0.4824929, -0.2744444, -3.233465, 1, 1, 1, 1, 1,
-0.4796869, 1.781275, 0.3596948, 1, 1, 1, 1, 1,
-0.4772354, 1.387075, 1.391866, 1, 1, 1, 1, 1,
-0.4699347, -1.627503, -2.073929, 1, 1, 1, 1, 1,
-0.4660736, 0.496629, 0.8707616, 1, 1, 1, 1, 1,
-0.4597293, -0.5713604, -3.604221, 1, 1, 1, 1, 1,
-0.4582188, -0.853644, 0.2114432, 1, 1, 1, 1, 1,
-0.4578143, -0.09473944, -1.110587, 1, 1, 1, 1, 1,
-0.4564989, -0.2167123, -2.154459, 0, 0, 1, 1, 1,
-0.4505452, -0.6605437, -1.315022, 1, 0, 0, 1, 1,
-0.4425113, -2.090911, -4.586085, 1, 0, 0, 1, 1,
-0.4405055, -0.2276553, -1.415725, 1, 0, 0, 1, 1,
-0.4388614, 1.218104, 0.01151117, 1, 0, 0, 1, 1,
-0.4367849, 0.8361322, -0.2894178, 1, 0, 0, 1, 1,
-0.4347255, 0.3575705, -1.305369, 0, 0, 0, 1, 1,
-0.4326123, 1.838193, -0.9925311, 0, 0, 0, 1, 1,
-0.4300801, 2.040822, -0.2585064, 0, 0, 0, 1, 1,
-0.4249021, -0.1385764, -3.921758, 0, 0, 0, 1, 1,
-0.42449, 1.433091, -0.7781854, 0, 0, 0, 1, 1,
-0.4216444, 0.3572764, 0.4563537, 0, 0, 0, 1, 1,
-0.4193726, -0.9275146, -1.269151, 0, 0, 0, 1, 1,
-0.4188972, -0.06993081, -2.376878, 1, 1, 1, 1, 1,
-0.4140822, 1.915718, -0.7794152, 1, 1, 1, 1, 1,
-0.4132293, -0.6177444, -2.681887, 1, 1, 1, 1, 1,
-0.4119059, 1.261506, -0.3242203, 1, 1, 1, 1, 1,
-0.4110828, -0.7949063, -1.649895, 1, 1, 1, 1, 1,
-0.4097113, 0.101958, -1.425667, 1, 1, 1, 1, 1,
-0.4080945, -0.2602369, -1.403853, 1, 1, 1, 1, 1,
-0.407185, 0.7723047, -0.4788116, 1, 1, 1, 1, 1,
-0.4046846, -0.8416703, -3.050277, 1, 1, 1, 1, 1,
-0.4020575, 1.218419, -0.5462105, 1, 1, 1, 1, 1,
-0.3989737, -1.998547, -1.797992, 1, 1, 1, 1, 1,
-0.3984147, 0.9542485, -1.559689, 1, 1, 1, 1, 1,
-0.3971671, 0.6620163, 0.1261445, 1, 1, 1, 1, 1,
-0.3960355, 1.822824, -0.5356955, 1, 1, 1, 1, 1,
-0.3953064, 0.5203929, 0.3122422, 1, 1, 1, 1, 1,
-0.3917338, 0.9195434, -0.855056, 0, 0, 1, 1, 1,
-0.3916569, 0.4842153, -0.1728761, 1, 0, 0, 1, 1,
-0.3909955, -2.376928, -2.221874, 1, 0, 0, 1, 1,
-0.3901553, 0.2426015, 0.18812, 1, 0, 0, 1, 1,
-0.3893908, -1.522804, -2.610701, 1, 0, 0, 1, 1,
-0.3877699, -1.415758, -2.701631, 1, 0, 0, 1, 1,
-0.3855038, -0.1208602, -0.9210891, 0, 0, 0, 1, 1,
-0.384891, 2.068072, -0.3331166, 0, 0, 0, 1, 1,
-0.3846638, -0.8657961, -3.539649, 0, 0, 0, 1, 1,
-0.381756, 1.796625, -1.004915, 0, 0, 0, 1, 1,
-0.3817402, -0.9695935, -2.426959, 0, 0, 0, 1, 1,
-0.38172, 1.822288, -0.5489794, 0, 0, 0, 1, 1,
-0.3800909, 0.7208933, -1.124587, 0, 0, 0, 1, 1,
-0.3786682, -1.200953, -2.708948, 1, 1, 1, 1, 1,
-0.3783467, 1.767484, -0.7669831, 1, 1, 1, 1, 1,
-0.3764717, 0.06715481, 1.32593, 1, 1, 1, 1, 1,
-0.3748143, -0.9053445, -0.9405499, 1, 1, 1, 1, 1,
-0.3722854, -1.099637, -2.358951, 1, 1, 1, 1, 1,
-0.371747, -1.677415, -4.360762, 1, 1, 1, 1, 1,
-0.3714245, 0.6208957, -1.238039, 1, 1, 1, 1, 1,
-0.3696613, 0.3860795, -0.6783403, 1, 1, 1, 1, 1,
-0.3678806, 0.8563285, -3.085083, 1, 1, 1, 1, 1,
-0.3677996, 0.6151905, -0.1910142, 1, 1, 1, 1, 1,
-0.3671314, -2.029325, -2.854039, 1, 1, 1, 1, 1,
-0.3563919, 0.2463127, -1.395856, 1, 1, 1, 1, 1,
-0.3527277, -0.390339, -1.804295, 1, 1, 1, 1, 1,
-0.351927, 0.7110473, -1.077893, 1, 1, 1, 1, 1,
-0.3502584, 0.7196167, 0.4794659, 1, 1, 1, 1, 1,
-0.3466405, 0.2272788, -2.014302, 0, 0, 1, 1, 1,
-0.3441026, -0.9439625, -1.351037, 1, 0, 0, 1, 1,
-0.3418645, 1.053895, -0.6651488, 1, 0, 0, 1, 1,
-0.3415956, 0.314865, -0.05785798, 1, 0, 0, 1, 1,
-0.3314964, 1.212065, -1.61045, 1, 0, 0, 1, 1,
-0.3311292, 0.5187017, -1.189479, 1, 0, 0, 1, 1,
-0.3287822, 0.4601529, 0.7659624, 0, 0, 0, 1, 1,
-0.3269801, 0.729618, 0.1792431, 0, 0, 0, 1, 1,
-0.323763, 2.376247, -0.177787, 0, 0, 0, 1, 1,
-0.3235382, 0.8210911, -0.7911052, 0, 0, 0, 1, 1,
-0.3195251, -1.34331, -1.801961, 0, 0, 0, 1, 1,
-0.3180321, 1.10289, -0.001740929, 0, 0, 0, 1, 1,
-0.3160733, -0.1575631, -2.376403, 0, 0, 0, 1, 1,
-0.3158821, 0.5918118, -1.249382, 1, 1, 1, 1, 1,
-0.3118787, -0.03342043, -2.087086, 1, 1, 1, 1, 1,
-0.3071419, -1.429975, -2.856885, 1, 1, 1, 1, 1,
-0.3067731, 0.02396313, -1.636477, 1, 1, 1, 1, 1,
-0.3048252, -0.02427553, -0.7389649, 1, 1, 1, 1, 1,
-0.3032818, -0.1386076, -3.506573, 1, 1, 1, 1, 1,
-0.302988, 0.3487422, 0.4912049, 1, 1, 1, 1, 1,
-0.2936275, 1.291951, 0.9399037, 1, 1, 1, 1, 1,
-0.2928661, -0.922409, -2.560932, 1, 1, 1, 1, 1,
-0.2921139, -0.569487, -4.052077, 1, 1, 1, 1, 1,
-0.2872489, -1.634297, -2.52948, 1, 1, 1, 1, 1,
-0.2808271, -0.9911237, -4.64039, 1, 1, 1, 1, 1,
-0.2796877, -0.5988067, -3.134473, 1, 1, 1, 1, 1,
-0.2778938, -1.980554, -4.1998, 1, 1, 1, 1, 1,
-0.2655715, -1.636612, -3.096233, 1, 1, 1, 1, 1,
-0.2602301, -0.4377159, -2.780689, 0, 0, 1, 1, 1,
-0.2504756, 1.488781, -0.4517457, 1, 0, 0, 1, 1,
-0.2458566, -0.8205381, -2.613132, 1, 0, 0, 1, 1,
-0.2455545, -0.2919747, -3.410018, 1, 0, 0, 1, 1,
-0.2443232, 0.8920075, -0.2166843, 1, 0, 0, 1, 1,
-0.242509, 1.281314, -1.071886, 1, 0, 0, 1, 1,
-0.2407961, 1.529858, 0.2611642, 0, 0, 0, 1, 1,
-0.2391815, 1.39589, -0.1898693, 0, 0, 0, 1, 1,
-0.2385514, -1.32146, -3.472267, 0, 0, 0, 1, 1,
-0.2349637, -0.3456997, -3.519418, 0, 0, 0, 1, 1,
-0.2311611, -0.07809901, -1.614256, 0, 0, 0, 1, 1,
-0.2268734, 0.008900978, -1.011379, 0, 0, 0, 1, 1,
-0.2268655, 0.7150525, 1.386718, 0, 0, 0, 1, 1,
-0.2228358, 0.6568535, -1.263136, 1, 1, 1, 1, 1,
-0.2152644, 0.4978697, -0.7143835, 1, 1, 1, 1, 1,
-0.2149143, 0.2416759, -0.8183078, 1, 1, 1, 1, 1,
-0.214084, -1.079945, -1.979227, 1, 1, 1, 1, 1,
-0.2134297, 0.08643619, -1.947992, 1, 1, 1, 1, 1,
-0.2116484, 0.9461651, 0.9468088, 1, 1, 1, 1, 1,
-0.2062594, 0.5152866, -0.08987848, 1, 1, 1, 1, 1,
-0.2021509, -1.77882, -3.738458, 1, 1, 1, 1, 1,
-0.1979637, 0.1088227, -1.516892, 1, 1, 1, 1, 1,
-0.1976635, 0.334026, 1.44285, 1, 1, 1, 1, 1,
-0.1969989, 0.02134987, -1.804258, 1, 1, 1, 1, 1,
-0.1948088, 0.1359722, -0.9451472, 1, 1, 1, 1, 1,
-0.1919439, -0.9233218, -3.637804, 1, 1, 1, 1, 1,
-0.1861143, -1.106101, -3.666421, 1, 1, 1, 1, 1,
-0.1805537, -0.7717836, -2.309633, 1, 1, 1, 1, 1,
-0.1780152, 0.5221038, -2.083022, 0, 0, 1, 1, 1,
-0.1774549, -0.5456984, -2.408219, 1, 0, 0, 1, 1,
-0.1767004, 0.588144, -1.977293, 1, 0, 0, 1, 1,
-0.1669932, 0.4403977, -0.07367277, 1, 0, 0, 1, 1,
-0.1666176, -0.02174062, -1.700853, 1, 0, 0, 1, 1,
-0.1660554, 1.196608, -1.118271, 1, 0, 0, 1, 1,
-0.1518154, 0.3752272, 0.1758541, 0, 0, 0, 1, 1,
-0.1473675, 0.9988346, -1.667655, 0, 0, 0, 1, 1,
-0.1468894, -1.233253, -2.649215, 0, 0, 0, 1, 1,
-0.1441742, 1.304136, 0.4473088, 0, 0, 0, 1, 1,
-0.1435295, 0.3012571, 0.7549784, 0, 0, 0, 1, 1,
-0.141383, -0.3519796, -2.709551, 0, 0, 0, 1, 1,
-0.141073, 1.236495, -1.023669, 0, 0, 0, 1, 1,
-0.1377383, -1.171799, -3.544098, 1, 1, 1, 1, 1,
-0.134793, -0.1314915, -1.867855, 1, 1, 1, 1, 1,
-0.1321523, -2.024991, -2.955837, 1, 1, 1, 1, 1,
-0.1263715, -0.2615274, -3.266754, 1, 1, 1, 1, 1,
-0.1233823, 1.033051, 1.078796, 1, 1, 1, 1, 1,
-0.1232242, 0.7241563, 0.9494326, 1, 1, 1, 1, 1,
-0.1214568, -0.2111322, -3.121293, 1, 1, 1, 1, 1,
-0.1214413, 0.2758255, -0.5549649, 1, 1, 1, 1, 1,
-0.1204022, -1.551525, -1.337948, 1, 1, 1, 1, 1,
-0.1166178, 0.7573056, 0.5967423, 1, 1, 1, 1, 1,
-0.1124225, -0.9289952, -3.059585, 1, 1, 1, 1, 1,
-0.1111949, 0.8949043, 0.6568735, 1, 1, 1, 1, 1,
-0.1103711, -0.7445994, -3.55429, 1, 1, 1, 1, 1,
-0.1067238, -0.05331155, -3.092908, 1, 1, 1, 1, 1,
-0.09442595, -0.09963003, -2.588596, 1, 1, 1, 1, 1,
-0.086611, 0.1702166, -1.302669, 0, 0, 1, 1, 1,
-0.08642596, -0.7691348, -4.862819, 1, 0, 0, 1, 1,
-0.08472501, -0.6359221, -3.015358, 1, 0, 0, 1, 1,
-0.08465166, -0.3771517, -3.474546, 1, 0, 0, 1, 1,
-0.08441965, 0.3456043, -0.7214582, 1, 0, 0, 1, 1,
-0.08399344, 0.2623366, -0.8659394, 1, 0, 0, 1, 1,
-0.08118596, -0.4367961, -1.378657, 0, 0, 0, 1, 1,
-0.0802532, -0.1688866, -2.532232, 0, 0, 0, 1, 1,
-0.07757752, 1.859344, 1.204239, 0, 0, 0, 1, 1,
-0.07536659, -0.01917764, -1.320069, 0, 0, 0, 1, 1,
-0.07251221, 0.7471475, -1.308933, 0, 0, 0, 1, 1,
-0.07242647, 0.1820567, -1.602924, 0, 0, 0, 1, 1,
-0.06844109, 0.9275479, -1.916215, 0, 0, 0, 1, 1,
-0.06786317, -2.091517, -2.880213, 1, 1, 1, 1, 1,
-0.06634628, -1.014457, -4.873159, 1, 1, 1, 1, 1,
-0.05582257, -0.08636831, -3.006316, 1, 1, 1, 1, 1,
-0.05465284, -1.209211, -3.01459, 1, 1, 1, 1, 1,
-0.05325675, 0.3607578, 1.538124, 1, 1, 1, 1, 1,
-0.03710065, 1.084952, -0.02766348, 1, 1, 1, 1, 1,
-0.03331168, -0.4648383, -3.717705, 1, 1, 1, 1, 1,
-0.03195463, 0.1003656, 2.100586, 1, 1, 1, 1, 1,
-0.03021743, -1.476456, -1.88161, 1, 1, 1, 1, 1,
-0.02892965, 0.7674655, -0.09207601, 1, 1, 1, 1, 1,
-0.02874336, 0.8431346, -0.04404373, 1, 1, 1, 1, 1,
-0.02077875, 0.6188449, -0.359145, 1, 1, 1, 1, 1,
-0.01955396, -0.06455997, -4.006112, 1, 1, 1, 1, 1,
-0.01952099, 0.9857479, 0.9660779, 1, 1, 1, 1, 1,
-0.01160752, 0.08886234, -2.641656, 1, 1, 1, 1, 1,
-0.009749108, 1.395321, 1.071834, 0, 0, 1, 1, 1,
-0.008540206, 0.007969067, -1.131782, 1, 0, 0, 1, 1,
-0.00807275, -1.246646, -2.939264, 1, 0, 0, 1, 1,
-0.007036665, -0.561986, -2.523463, 1, 0, 0, 1, 1,
-0.004819229, 0.9098127, -1.264381, 1, 0, 0, 1, 1,
-0.003510454, 0.7481905, -0.5671239, 1, 0, 0, 1, 1,
-0.003112542, 0.6281398, 0.1435719, 0, 0, 0, 1, 1,
-0.0007880269, -0.457382, -1.895095, 0, 0, 0, 1, 1,
3.96018e-05, 0.3296158, -1.261662, 0, 0, 0, 1, 1,
0.003463724, 0.858498, -0.6401941, 0, 0, 0, 1, 1,
0.004066776, 0.6647614, -0.6756124, 0, 0, 0, 1, 1,
0.004639647, 0.9401183, -2.079504, 0, 0, 0, 1, 1,
0.005744868, 2.834377, 2.818304, 0, 0, 0, 1, 1,
0.01112908, 0.01170788, 0.8873116, 1, 1, 1, 1, 1,
0.01837676, -0.121549, 4.044223, 1, 1, 1, 1, 1,
0.01939427, 0.7168037, 0.009768481, 1, 1, 1, 1, 1,
0.02082658, 1.257342, 0.1856198, 1, 1, 1, 1, 1,
0.02157667, 0.1189067, -0.6507344, 1, 1, 1, 1, 1,
0.02620712, -0.7145891, 1.795349, 1, 1, 1, 1, 1,
0.02814885, 0.7178804, -2.065773, 1, 1, 1, 1, 1,
0.02815619, -0.1583548, 3.157258, 1, 1, 1, 1, 1,
0.03247769, -1.057026, 3.553327, 1, 1, 1, 1, 1,
0.03323283, -1.235958, 4.534442, 1, 1, 1, 1, 1,
0.0350862, -0.8899308, 2.803063, 1, 1, 1, 1, 1,
0.05025946, -1.223243, 3.666764, 1, 1, 1, 1, 1,
0.05240628, -0.957902, 3.305768, 1, 1, 1, 1, 1,
0.05274614, -1.450549, 5.034524, 1, 1, 1, 1, 1,
0.05459424, -0.6988093, 3.230297, 1, 1, 1, 1, 1,
0.05721271, 1.250297, 0.6149909, 0, 0, 1, 1, 1,
0.05745656, -0.09983385, 3.535085, 1, 0, 0, 1, 1,
0.05798497, 0.5594796, 1.210046, 1, 0, 0, 1, 1,
0.05932432, -2.262037, 4.060108, 1, 0, 0, 1, 1,
0.06449369, -0.1176787, 2.369934, 1, 0, 0, 1, 1,
0.0678136, -0.3668878, 3.359919, 1, 0, 0, 1, 1,
0.06791467, -1.066513, 5.542859, 0, 0, 0, 1, 1,
0.06905814, 0.005898909, 0.3077385, 0, 0, 0, 1, 1,
0.069093, -1.924842, 4.502183, 0, 0, 0, 1, 1,
0.07128103, 0.9200156, -0.7757892, 0, 0, 0, 1, 1,
0.07720082, 1.212929, 1.041522, 0, 0, 0, 1, 1,
0.08176392, -1.720733, 2.772956, 0, 0, 0, 1, 1,
0.08603352, -0.2323881, 2.795513, 0, 0, 0, 1, 1,
0.08749757, -0.4909448, 3.439349, 1, 1, 1, 1, 1,
0.08966192, 0.667784, -1.158526, 1, 1, 1, 1, 1,
0.09100562, -0.2579502, 3.948117, 1, 1, 1, 1, 1,
0.09379516, 0.5705507, -1.857721, 1, 1, 1, 1, 1,
0.09490732, 0.884672, 2.139994, 1, 1, 1, 1, 1,
0.09542958, 1.075838, 0.6895691, 1, 1, 1, 1, 1,
0.09575334, -0.3327481, 3.846529, 1, 1, 1, 1, 1,
0.09897048, -0.8070049, 3.445774, 1, 1, 1, 1, 1,
0.103105, 0.7273587, 0.8428757, 1, 1, 1, 1, 1,
0.1110814, -0.4522552, 3.907273, 1, 1, 1, 1, 1,
0.1217507, 0.5067316, 1.250405, 1, 1, 1, 1, 1,
0.1221619, 0.248106, 1.207204, 1, 1, 1, 1, 1,
0.1237143, 1.13296, -1.118791, 1, 1, 1, 1, 1,
0.1262345, 0.533089, 0.8853735, 1, 1, 1, 1, 1,
0.1300192, -0.8661643, 4.183564, 1, 1, 1, 1, 1,
0.1307351, 0.2050552, 0.6649504, 0, 0, 1, 1, 1,
0.1341431, 0.9960763, -0.4705001, 1, 0, 0, 1, 1,
0.1347647, 0.1817213, 1.406356, 1, 0, 0, 1, 1,
0.1391026, -0.08851606, 0.4340149, 1, 0, 0, 1, 1,
0.1424236, -0.7579226, 3.770721, 1, 0, 0, 1, 1,
0.1441237, -0.09616099, 2.686703, 1, 0, 0, 1, 1,
0.1445725, -0.9902493, 3.103098, 0, 0, 0, 1, 1,
0.1456503, -0.1011036, 1.89408, 0, 0, 0, 1, 1,
0.1512193, 1.703847, 1.688279, 0, 0, 0, 1, 1,
0.1515415, -0.2075418, 2.558006, 0, 0, 0, 1, 1,
0.1554165, 0.547895, -0.9420694, 0, 0, 0, 1, 1,
0.1561252, -0.4968756, 2.781128, 0, 0, 0, 1, 1,
0.1606914, -0.6209742, 3.365586, 0, 0, 0, 1, 1,
0.1646649, 1.275928, -0.001351934, 1, 1, 1, 1, 1,
0.1648029, 0.04381322, 2.044161, 1, 1, 1, 1, 1,
0.1710087, -0.3237021, 2.028797, 1, 1, 1, 1, 1,
0.1727403, -0.5142394, 3.334861, 1, 1, 1, 1, 1,
0.1727611, 2.2945, -0.4813324, 1, 1, 1, 1, 1,
0.1759786, 0.3172535, 0.7967558, 1, 1, 1, 1, 1,
0.1761538, 1.025698, 0.5313521, 1, 1, 1, 1, 1,
0.1769611, 0.9019495, 0.3240627, 1, 1, 1, 1, 1,
0.178818, 1.061888, 0.0211389, 1, 1, 1, 1, 1,
0.179231, 1.333468, 1.578959, 1, 1, 1, 1, 1,
0.1846444, -0.190474, 3.331494, 1, 1, 1, 1, 1,
0.1942522, 0.5002148, 0.5622447, 1, 1, 1, 1, 1,
0.195868, 1.408598, 0.7238146, 1, 1, 1, 1, 1,
0.1961029, 1.653382, 0.4649821, 1, 1, 1, 1, 1,
0.20085, -1.232319, 4.014679, 1, 1, 1, 1, 1,
0.2031091, 0.6761554, 0.00524139, 0, 0, 1, 1, 1,
0.205645, 0.8240749, 3.18181, 1, 0, 0, 1, 1,
0.2064759, 0.6806702, 0.7486273, 1, 0, 0, 1, 1,
0.206854, -1.005547, 1.742225, 1, 0, 0, 1, 1,
0.2092642, 0.1762466, 1.811573, 1, 0, 0, 1, 1,
0.2096549, -0.5714063, 1.729215, 1, 0, 0, 1, 1,
0.2192456, -0.5513467, 2.520151, 0, 0, 0, 1, 1,
0.2208128, -0.107131, 3.512497, 0, 0, 0, 1, 1,
0.2217686, -0.0261661, 1.137116, 0, 0, 0, 1, 1,
0.2328683, 1.345875, -0.1262312, 0, 0, 0, 1, 1,
0.2335313, 0.930939, 0.8554255, 0, 0, 0, 1, 1,
0.2344975, 0.5103026, 1.394807, 0, 0, 0, 1, 1,
0.2354985, 0.520871, 0.09776206, 0, 0, 0, 1, 1,
0.2387177, -0.510814, 2.989109, 1, 1, 1, 1, 1,
0.240027, 0.04384096, 0.6231081, 1, 1, 1, 1, 1,
0.2408939, -0.01507959, 2.187115, 1, 1, 1, 1, 1,
0.2413661, -0.6901876, 3.383219, 1, 1, 1, 1, 1,
0.2435639, 1.101009, 1.276569, 1, 1, 1, 1, 1,
0.2490659, -0.3289632, 3.308119, 1, 1, 1, 1, 1,
0.2502506, -0.7782374, 1.832735, 1, 1, 1, 1, 1,
0.2521025, -0.3666228, 1.118121, 1, 1, 1, 1, 1,
0.2531185, 0.6893072, -0.3499746, 1, 1, 1, 1, 1,
0.2654448, -0.4572788, 2.399873, 1, 1, 1, 1, 1,
0.2691513, 1.210562, -0.5033727, 1, 1, 1, 1, 1,
0.2696643, -0.23438, 2.64755, 1, 1, 1, 1, 1,
0.2698212, -1.464193, 2.189138, 1, 1, 1, 1, 1,
0.2736797, -0.2151822, 4.677607, 1, 1, 1, 1, 1,
0.2754946, -0.4489161, 3.294303, 1, 1, 1, 1, 1,
0.2829563, 0.6808968, -1.273473, 0, 0, 1, 1, 1,
0.2830941, -0.6743454, 3.772605, 1, 0, 0, 1, 1,
0.2836651, 2.438286, 0.7997108, 1, 0, 0, 1, 1,
0.2852752, -1.316288, 2.728226, 1, 0, 0, 1, 1,
0.2864747, -1.13565, 2.489097, 1, 0, 0, 1, 1,
0.2911524, -0.6524312, 2.614516, 1, 0, 0, 1, 1,
0.291758, -0.2456211, 0.8315434, 0, 0, 0, 1, 1,
0.2951033, -1.278191, 1.59826, 0, 0, 0, 1, 1,
0.2953883, -0.2408828, 1.279692, 0, 0, 0, 1, 1,
0.2975878, -1.603261, 3.412806, 0, 0, 0, 1, 1,
0.29895, 0.7292761, -0.2971755, 0, 0, 0, 1, 1,
0.3004199, 0.6675649, 0.8395526, 0, 0, 0, 1, 1,
0.3069012, 0.3380391, -0.7039385, 0, 0, 0, 1, 1,
0.3106557, 1.286389, 0.9732617, 1, 1, 1, 1, 1,
0.311381, 1.256528, -0.5968181, 1, 1, 1, 1, 1,
0.3119465, -0.7854211, 4.222088, 1, 1, 1, 1, 1,
0.3120344, 0.04642634, 1.729922, 1, 1, 1, 1, 1,
0.3124305, -1.788032, 2.209371, 1, 1, 1, 1, 1,
0.315432, 0.5125282, -0.006972257, 1, 1, 1, 1, 1,
0.3160642, 0.2209034, 1.194337, 1, 1, 1, 1, 1,
0.321677, 0.8343003, -3.23741, 1, 1, 1, 1, 1,
0.3234836, 0.5949934, 0.7449527, 1, 1, 1, 1, 1,
0.3246899, -1.305474, 1.948304, 1, 1, 1, 1, 1,
0.3266014, 0.8890004, 0.7619087, 1, 1, 1, 1, 1,
0.3280658, -0.9941715, 2.96966, 1, 1, 1, 1, 1,
0.3280826, 0.8160652, 1.690145, 1, 1, 1, 1, 1,
0.3312204, -1.553953, 3.560161, 1, 1, 1, 1, 1,
0.3346792, -0.5684163, 3.516659, 1, 1, 1, 1, 1,
0.3350166, -1.908584, 2.0436, 0, 0, 1, 1, 1,
0.3431417, -2.819453, 3.758357, 1, 0, 0, 1, 1,
0.3452541, -1.415613, 2.587362, 1, 0, 0, 1, 1,
0.3561259, -0.5085835, 3.669106, 1, 0, 0, 1, 1,
0.3623077, 0.8897957, 1.110882, 1, 0, 0, 1, 1,
0.3669149, 0.4055339, 0.6211727, 1, 0, 0, 1, 1,
0.3687914, -0.4637559, 2.265318, 0, 0, 0, 1, 1,
0.3752017, 0.1879809, 1.741851, 0, 0, 0, 1, 1,
0.3766762, 0.672857, -0.3606575, 0, 0, 0, 1, 1,
0.381577, -0.3365926, 2.595315, 0, 0, 0, 1, 1,
0.3840554, -1.185362, 1.227124, 0, 0, 0, 1, 1,
0.3851989, -1.261772, 1.869916, 0, 0, 0, 1, 1,
0.4041751, 1.750866, 1.05292, 0, 0, 0, 1, 1,
0.4049846, 1.184566, 0.08977229, 1, 1, 1, 1, 1,
0.405698, 0.2023082, 1.08893, 1, 1, 1, 1, 1,
0.4062597, -0.2515944, 2.530671, 1, 1, 1, 1, 1,
0.406373, 0.1684909, 1.324183, 1, 1, 1, 1, 1,
0.4067841, -0.9484563, 1.956221, 1, 1, 1, 1, 1,
0.4075392, -1.190681, 4.634505, 1, 1, 1, 1, 1,
0.4101004, -0.2630748, 1.870272, 1, 1, 1, 1, 1,
0.4147958, -0.998981, 2.921854, 1, 1, 1, 1, 1,
0.4154414, -1.00103, 2.672229, 1, 1, 1, 1, 1,
0.4184743, 1.209222, 1.320429, 1, 1, 1, 1, 1,
0.4269865, 1.671913, 1.056754, 1, 1, 1, 1, 1,
0.4306035, -0.1494012, 0.8856, 1, 1, 1, 1, 1,
0.4321937, 0.8556861, 0.3801227, 1, 1, 1, 1, 1,
0.4341855, -0.1919351, 2.374859, 1, 1, 1, 1, 1,
0.4422189, -0.7898108, 1.869781, 1, 1, 1, 1, 1,
0.4458843, 1.299944, -0.948966, 0, 0, 1, 1, 1,
0.4548019, -1.034157, 3.240239, 1, 0, 0, 1, 1,
0.4573838, -0.5213177, 2.407854, 1, 0, 0, 1, 1,
0.4590605, 0.09527773, 2.745506, 1, 0, 0, 1, 1,
0.4603185, -0.4520471, 1.352057, 1, 0, 0, 1, 1,
0.4644471, 0.3194082, 2.822236, 1, 0, 0, 1, 1,
0.4645064, 0.08888672, 1.610218, 0, 0, 0, 1, 1,
0.4678138, -1.466153, 2.758029, 0, 0, 0, 1, 1,
0.4727695, 0.128666, 0.08012964, 0, 0, 0, 1, 1,
0.4748058, 1.305084, -2.588373, 0, 0, 0, 1, 1,
0.4748602, 0.269382, -0.05110968, 0, 0, 0, 1, 1,
0.4763224, 0.08266275, 1.593379, 0, 0, 0, 1, 1,
0.4837306, 0.4534205, 0.7765418, 0, 0, 0, 1, 1,
0.4902178, -0.9560065, 2.064758, 1, 1, 1, 1, 1,
0.4903011, 1.093974, 0.6381832, 1, 1, 1, 1, 1,
0.4922533, 1.147346, 1.144343, 1, 1, 1, 1, 1,
0.4930258, 0.7184141, -0.2548195, 1, 1, 1, 1, 1,
0.4975761, 1.468943, -1.343151, 1, 1, 1, 1, 1,
0.4980468, -2.143345, 2.150483, 1, 1, 1, 1, 1,
0.5019178, 1.773364, -1.466558, 1, 1, 1, 1, 1,
0.5049165, 1.109583, 1.054263, 1, 1, 1, 1, 1,
0.5108078, 0.769701, 0.01191421, 1, 1, 1, 1, 1,
0.5172557, -0.4842994, 3.071574, 1, 1, 1, 1, 1,
0.523972, 0.1547914, 2.616686, 1, 1, 1, 1, 1,
0.5311513, 0.5590603, 1.059043, 1, 1, 1, 1, 1,
0.5377577, 0.1602174, 1.134441, 1, 1, 1, 1, 1,
0.5385333, -1.546232, 2.009834, 1, 1, 1, 1, 1,
0.5413429, 0.1539394, 2.152405, 1, 1, 1, 1, 1,
0.5463084, 0.507515, 0.8671497, 0, 0, 1, 1, 1,
0.5490772, -0.04021018, 2.49895, 1, 0, 0, 1, 1,
0.5518041, 1.491209, -1.943865, 1, 0, 0, 1, 1,
0.5525495, -0.2461206, 2.500453, 1, 0, 0, 1, 1,
0.5533749, -2.96897, 1.805831, 1, 0, 0, 1, 1,
0.5545683, -0.4822702, 2.130864, 1, 0, 0, 1, 1,
0.5554179, -0.9218623, 1.719811, 0, 0, 0, 1, 1,
0.5616257, -0.153916, 1.171375, 0, 0, 0, 1, 1,
0.5648592, -0.5210122, 1.481808, 0, 0, 0, 1, 1,
0.5655081, -0.1993861, 1.465829, 0, 0, 0, 1, 1,
0.5682496, 1.774553, -0.7337238, 0, 0, 0, 1, 1,
0.5698479, -0.468708, 2.400595, 0, 0, 0, 1, 1,
0.5707707, 1.879307, 0.4557594, 0, 0, 0, 1, 1,
0.5714263, 0.8762634, 1.564233, 1, 1, 1, 1, 1,
0.5727878, 1.370382, 0.4153492, 1, 1, 1, 1, 1,
0.5733343, -0.5904253, 2.778579, 1, 1, 1, 1, 1,
0.575229, 0.7742718, 0.05510909, 1, 1, 1, 1, 1,
0.5810467, 0.4130446, 0.2140425, 1, 1, 1, 1, 1,
0.5813418, -1.017595, 3.302994, 1, 1, 1, 1, 1,
0.5857108, 1.662771, 0.5247751, 1, 1, 1, 1, 1,
0.591961, 0.06527176, 1.300007, 1, 1, 1, 1, 1,
0.6016648, -1.219476, 2.324739, 1, 1, 1, 1, 1,
0.6030097, 1.090297, 2.593468, 1, 1, 1, 1, 1,
0.6080157, 1.316996, 0.08081279, 1, 1, 1, 1, 1,
0.6088848, -0.2699254, 2.496986, 1, 1, 1, 1, 1,
0.611868, 0.08959687, 1.979518, 1, 1, 1, 1, 1,
0.6132286, -1.478791, 2.088518, 1, 1, 1, 1, 1,
0.6150622, -0.642513, 4.019509, 1, 1, 1, 1, 1,
0.6213174, -1.038942, 4.359923, 0, 0, 1, 1, 1,
0.6243541, 0.7169753, 2.59485, 1, 0, 0, 1, 1,
0.6275533, -0.1540664, 1.22654, 1, 0, 0, 1, 1,
0.6293809, -0.4021972, 3.717312, 1, 0, 0, 1, 1,
0.6300827, 0.5961589, 1.387862, 1, 0, 0, 1, 1,
0.6304086, -0.8758907, 2.861758, 1, 0, 0, 1, 1,
0.6363239, 0.1202176, 3.729852, 0, 0, 0, 1, 1,
0.6376042, -1.062889, 3.693411, 0, 0, 0, 1, 1,
0.641668, 1.197271, 0.5588997, 0, 0, 0, 1, 1,
0.6432627, 0.6988953, -0.6302943, 0, 0, 0, 1, 1,
0.6441882, 1.772687, -3.036939, 0, 0, 0, 1, 1,
0.652728, 0.9239135, 0.7342573, 0, 0, 0, 1, 1,
0.6538494, -0.7739701, 1.660271, 0, 0, 0, 1, 1,
0.6542954, 0.2222241, 0.8388997, 1, 1, 1, 1, 1,
0.6555552, -0.5932477, 1.946548, 1, 1, 1, 1, 1,
0.6623347, 0.8623313, 2.084157, 1, 1, 1, 1, 1,
0.6638238, 0.4603655, 1.326911, 1, 1, 1, 1, 1,
0.6640521, 0.0575674, 0.5299886, 1, 1, 1, 1, 1,
0.6688988, 0.5044426, 0.9930468, 1, 1, 1, 1, 1,
0.6720985, 0.7279692, -1.25207, 1, 1, 1, 1, 1,
0.6772835, -0.4608432, 2.479186, 1, 1, 1, 1, 1,
0.6774224, -0.04334158, 2.286669, 1, 1, 1, 1, 1,
0.6827407, 0.04925366, 0.9652742, 1, 1, 1, 1, 1,
0.690566, 0.2376216, -0.1796223, 1, 1, 1, 1, 1,
0.6936078, 0.2459754, 0.2323098, 1, 1, 1, 1, 1,
0.7078959, 1.062759, 0.8271012, 1, 1, 1, 1, 1,
0.7096733, -1.779548, 3.680254, 1, 1, 1, 1, 1,
0.7119328, 0.003330261, 1.859104, 1, 1, 1, 1, 1,
0.7213817, -0.2488215, 2.245899, 0, 0, 1, 1, 1,
0.7273028, 0.03754772, 0.2785269, 1, 0, 0, 1, 1,
0.7310111, 1.264412, 1.506153, 1, 0, 0, 1, 1,
0.7314712, 0.7234197, 0.3452683, 1, 0, 0, 1, 1,
0.7476518, 0.04294065, 2.753737, 1, 0, 0, 1, 1,
0.7503573, -0.3516571, 0.07651674, 1, 0, 0, 1, 1,
0.7510602, 0.08714692, 1.435113, 0, 0, 0, 1, 1,
0.7540575, -0.287455, 2.747447, 0, 0, 0, 1, 1,
0.7593278, 1.689788, -0.2474024, 0, 0, 0, 1, 1,
0.7607189, 0.3652971, 0.9091312, 0, 0, 0, 1, 1,
0.7607467, -0.3631023, 1.944688, 0, 0, 0, 1, 1,
0.7618201, 1.477299, 0.7604038, 0, 0, 0, 1, 1,
0.7704238, 0.5759503, 2.611219, 0, 0, 0, 1, 1,
0.7706186, -2.179487, 0.9646778, 1, 1, 1, 1, 1,
0.7721951, -0.7691891, 4.603748, 1, 1, 1, 1, 1,
0.7750443, -1.271414, 4.139616, 1, 1, 1, 1, 1,
0.7794072, 1.329067, 1.471262, 1, 1, 1, 1, 1,
0.7831567, -0.9238505, 4.774273, 1, 1, 1, 1, 1,
0.7971755, 2.930397, -0.8485698, 1, 1, 1, 1, 1,
0.8083376, 1.022179, 1.424971, 1, 1, 1, 1, 1,
0.8091778, 0.07418812, 1.199232, 1, 1, 1, 1, 1,
0.8181611, 0.9315389, 0.5077434, 1, 1, 1, 1, 1,
0.8185408, -0.9387605, 1.802648, 1, 1, 1, 1, 1,
0.8225641, 0.7578344, -0.1249244, 1, 1, 1, 1, 1,
0.8244363, -0.3184782, 1.292035, 1, 1, 1, 1, 1,
0.8248121, -1.399055, 3.026811, 1, 1, 1, 1, 1,
0.8333977, 0.9994738, 0.5590549, 1, 1, 1, 1, 1,
0.8354555, 1.244267, 2.768356, 1, 1, 1, 1, 1,
0.8371315, 1.660273, 1.011099, 0, 0, 1, 1, 1,
0.8413854, 1.904615, -0.1660661, 1, 0, 0, 1, 1,
0.8418979, -1.227796, 1.199746, 1, 0, 0, 1, 1,
0.844816, -0.1074719, 1.399076, 1, 0, 0, 1, 1,
0.8540521, 0.4693483, 1.186947, 1, 0, 0, 1, 1,
0.8566877, 0.8232973, -1.422012, 1, 0, 0, 1, 1,
0.858353, -1.068089, 3.470253, 0, 0, 0, 1, 1,
0.8631777, 1.275295, 1.194764, 0, 0, 0, 1, 1,
0.8653486, 1.232002, -0.6276527, 0, 0, 0, 1, 1,
0.8677615, -0.0636449, 2.569894, 0, 0, 0, 1, 1,
0.8691068, 0.8446134, 0.418171, 0, 0, 0, 1, 1,
0.869472, 0.8507957, -0.1690853, 0, 0, 0, 1, 1,
0.8696656, 1.097115, 1.223901, 0, 0, 0, 1, 1,
0.8705704, -1.243573, 1.496974, 1, 1, 1, 1, 1,
0.8778533, 0.2604245, 0.224529, 1, 1, 1, 1, 1,
0.8820012, 0.1852289, -0.851174, 1, 1, 1, 1, 1,
0.8830132, 2.102331, 0.6913059, 1, 1, 1, 1, 1,
0.8888105, 0.6955771, 1.006934, 1, 1, 1, 1, 1,
0.8924357, -0.5974926, 0.745628, 1, 1, 1, 1, 1,
0.8939156, -1.265889, 2.543242, 1, 1, 1, 1, 1,
0.913565, 0.2086264, 1.417082, 1, 1, 1, 1, 1,
0.9159409, 0.31937, 0.7294295, 1, 1, 1, 1, 1,
0.9181179, 1.265846, -1.055843, 1, 1, 1, 1, 1,
0.9190216, -0.04245679, 0.6479638, 1, 1, 1, 1, 1,
0.9292039, 2.120589, -0.2189917, 1, 1, 1, 1, 1,
0.9333439, 0.1996047, 1.880336, 1, 1, 1, 1, 1,
0.934922, 1.444355, 0.5615992, 1, 1, 1, 1, 1,
0.9360853, 0.05148793, 2.843178, 1, 1, 1, 1, 1,
0.9385897, 0.01343417, 1.340679, 0, 0, 1, 1, 1,
0.9422988, -1.636915, 3.313178, 1, 0, 0, 1, 1,
0.9600129, -0.778093, 2.168097, 1, 0, 0, 1, 1,
0.9601786, -0.03196573, 0.02515413, 1, 0, 0, 1, 1,
0.9627396, -0.3100711, 1.019819, 1, 0, 0, 1, 1,
0.96472, -1.515845, 2.015905, 1, 0, 0, 1, 1,
0.9660523, -1.023263, 2.773636, 0, 0, 0, 1, 1,
0.9759157, -2.707728, 2.514367, 0, 0, 0, 1, 1,
0.9816865, -1.284656, 2.059334, 0, 0, 0, 1, 1,
0.9838865, 0.9360477, 1.680081, 0, 0, 0, 1, 1,
0.9854172, -1.83697, 3.337563, 0, 0, 0, 1, 1,
0.9887142, -0.390999, 1.780543, 0, 0, 0, 1, 1,
0.9902375, -2.506593, 3.791498, 0, 0, 0, 1, 1,
0.9942605, 1.642002, -1.079832, 1, 1, 1, 1, 1,
0.9946135, -0.1065341, 1.452522, 1, 1, 1, 1, 1,
0.9946275, -0.382277, 0.6618791, 1, 1, 1, 1, 1,
0.9967498, -0.6390672, 3.307395, 1, 1, 1, 1, 1,
0.9980359, 0.007795513, 2.120007, 1, 1, 1, 1, 1,
1.006098, 0.4465595, 2.317195, 1, 1, 1, 1, 1,
1.010962, -0.07549883, -0.5092725, 1, 1, 1, 1, 1,
1.012382, 0.6706663, 1.942244, 1, 1, 1, 1, 1,
1.01388, 0.8155992, 1.327303, 1, 1, 1, 1, 1,
1.014292, -1.194848, 1.90116, 1, 1, 1, 1, 1,
1.014322, -1.515694, 2.740002, 1, 1, 1, 1, 1,
1.01592, -0.3269102, 4.445904, 1, 1, 1, 1, 1,
1.017031, -0.2757141, 1.38526, 1, 1, 1, 1, 1,
1.022526, 0.200593, -0.07630727, 1, 1, 1, 1, 1,
1.03441, 0.996149, 2.55376, 1, 1, 1, 1, 1,
1.035652, 1.403941, 2.503059, 0, 0, 1, 1, 1,
1.048671, 1.328872, -1.89301, 1, 0, 0, 1, 1,
1.053584, 0.4844088, 1.558948, 1, 0, 0, 1, 1,
1.05493, 0.3397314, 3.072715, 1, 0, 0, 1, 1,
1.062047, -1.647497, 0.6735956, 1, 0, 0, 1, 1,
1.065567, -0.5073149, 0.8838795, 1, 0, 0, 1, 1,
1.066163, 1.391911, 0.6274582, 0, 0, 0, 1, 1,
1.072653, -0.8633808, 3.570376, 0, 0, 0, 1, 1,
1.074293, 0.1810608, 0.6284813, 0, 0, 0, 1, 1,
1.077264, 0.6344187, 2.165098, 0, 0, 0, 1, 1,
1.083828, -0.9848493, 3.385528, 0, 0, 0, 1, 1,
1.086036, 0.2917048, 1.680503, 0, 0, 0, 1, 1,
1.087595, -0.9434707, 2.73397, 0, 0, 0, 1, 1,
1.087613, 0.09012815, 0.3907517, 1, 1, 1, 1, 1,
1.095515, -0.7278317, 2.138355, 1, 1, 1, 1, 1,
1.097, -1.113008, 2.334285, 1, 1, 1, 1, 1,
1.097639, 1.097112, 2.187062, 1, 1, 1, 1, 1,
1.098383, 0.3703842, 2.086273, 1, 1, 1, 1, 1,
1.102563, 0.4409078, -0.2995006, 1, 1, 1, 1, 1,
1.108137, -1.132771, 2.241172, 1, 1, 1, 1, 1,
1.109226, -1.510807, 4.060043, 1, 1, 1, 1, 1,
1.111593, -0.4046573, 2.290473, 1, 1, 1, 1, 1,
1.112443, 0.2125457, 2.904417, 1, 1, 1, 1, 1,
1.11352, -1.301129, 3.033143, 1, 1, 1, 1, 1,
1.121137, 0.3930418, -0.5282272, 1, 1, 1, 1, 1,
1.12261, -1.454267, 2.635568, 1, 1, 1, 1, 1,
1.128572, 0.01290847, 1.591359, 1, 1, 1, 1, 1,
1.132223, 0.4296974, 1.100278, 1, 1, 1, 1, 1,
1.145028, -1.084029, 2.637898, 0, 0, 1, 1, 1,
1.154529, 0.2340901, 0.05769012, 1, 0, 0, 1, 1,
1.161827, -0.3018486, 0.5505152, 1, 0, 0, 1, 1,
1.16929, 0.575506, 2.134587, 1, 0, 0, 1, 1,
1.172539, 1.031688, 0.3431247, 1, 0, 0, 1, 1,
1.173608, -1.357983, 2.651057, 1, 0, 0, 1, 1,
1.182676, 0.2928992, 1.345998, 0, 0, 0, 1, 1,
1.186192, -0.4875897, 1.346989, 0, 0, 0, 1, 1,
1.189015, 0.5783964, 0.6311463, 0, 0, 0, 1, 1,
1.19598, -2.503334, 2.85054, 0, 0, 0, 1, 1,
1.204995, -0.3823977, 2.567703, 0, 0, 0, 1, 1,
1.206521, 0.04163291, 1.519748, 0, 0, 0, 1, 1,
1.208492, 1.764731, -0.2572297, 0, 0, 0, 1, 1,
1.221195, -0.4659273, 2.917951, 1, 1, 1, 1, 1,
1.222297, 0.2473031, 1.231783, 1, 1, 1, 1, 1,
1.22408, -1.22382, 0.6501737, 1, 1, 1, 1, 1,
1.224536, -1.096315, 3.776094, 1, 1, 1, 1, 1,
1.236776, 2.078105, 0.09651653, 1, 1, 1, 1, 1,
1.245951, 0.577399, 1.547369, 1, 1, 1, 1, 1,
1.24742, -0.03137075, 2.54628, 1, 1, 1, 1, 1,
1.248955, -0.6697619, 2.158965, 1, 1, 1, 1, 1,
1.249315, 0.6410133, 0.8893561, 1, 1, 1, 1, 1,
1.259714, -0.1296711, 2.915676, 1, 1, 1, 1, 1,
1.263509, -0.8888606, 2.614101, 1, 1, 1, 1, 1,
1.270753, -0.2168154, 1.131505, 1, 1, 1, 1, 1,
1.278859, -0.3239624, 0.9783105, 1, 1, 1, 1, 1,
1.287084, -1.029921, 1.742916, 1, 1, 1, 1, 1,
1.293917, 1.391019, 0.7690462, 1, 1, 1, 1, 1,
1.294129, 0.2666343, 1.664689, 0, 0, 1, 1, 1,
1.294749, 0.4557007, 0.7640881, 1, 0, 0, 1, 1,
1.300378, 1.606773, 0.8305408, 1, 0, 0, 1, 1,
1.300821, 0.9985403, 0.7564742, 1, 0, 0, 1, 1,
1.308953, -2.284289, 2.63534, 1, 0, 0, 1, 1,
1.31141, -1.299896, 2.607384, 1, 0, 0, 1, 1,
1.314608, -1.363522, 3.420055, 0, 0, 0, 1, 1,
1.317537, -0.4177035, 1.352389, 0, 0, 0, 1, 1,
1.317838, 0.4497894, 1.012236, 0, 0, 0, 1, 1,
1.319851, -0.01854775, -1.074682, 0, 0, 0, 1, 1,
1.337823, -0.1800063, 1.815302, 0, 0, 0, 1, 1,
1.34166, 0.196631, 2.506784, 0, 0, 0, 1, 1,
1.343214, 0.1440814, 0.965521, 0, 0, 0, 1, 1,
1.376919, -1.400788, 1.404541, 1, 1, 1, 1, 1,
1.390318, -0.9324111, 0.7567065, 1, 1, 1, 1, 1,
1.395188, -0.2088367, 0.7999145, 1, 1, 1, 1, 1,
1.41366, 0.7461609, 0.8293134, 1, 1, 1, 1, 1,
1.419211, 0.6517625, 1.504542, 1, 1, 1, 1, 1,
1.427662, -0.7575265, 2.497989, 1, 1, 1, 1, 1,
1.443118, 0.3376557, 1.62634, 1, 1, 1, 1, 1,
1.443753, 0.1812577, 1.566946, 1, 1, 1, 1, 1,
1.448983, 0.1067032, 2.364815, 1, 1, 1, 1, 1,
1.462849, 0.6081868, 2.220022, 1, 1, 1, 1, 1,
1.468612, 0.9365792, 1.365806, 1, 1, 1, 1, 1,
1.470632, -0.9199055, 3.378154, 1, 1, 1, 1, 1,
1.49171, -1.795974, 3.188753, 1, 1, 1, 1, 1,
1.492842, -0.3130889, 1.534456, 1, 1, 1, 1, 1,
1.495588, 0.2792743, 0.9097416, 1, 1, 1, 1, 1,
1.497331, -0.330005, 1.260847, 0, 0, 1, 1, 1,
1.50663, 1.343079, 1.361328, 1, 0, 0, 1, 1,
1.507801, 0.9348556, 1.806008, 1, 0, 0, 1, 1,
1.510625, -0.4823727, 0.337181, 1, 0, 0, 1, 1,
1.512097, -0.06082184, 0.5007876, 1, 0, 0, 1, 1,
1.523087, -1.45176, 3.011335, 1, 0, 0, 1, 1,
1.538932, -0.4427868, 1.31953, 0, 0, 0, 1, 1,
1.539236, 0.7164522, 0.4221745, 0, 0, 0, 1, 1,
1.540324, -0.05488151, 0.6162073, 0, 0, 0, 1, 1,
1.550661, -0.7917358, 1.03679, 0, 0, 0, 1, 1,
1.552074, 1.042616, 0.8513777, 0, 0, 0, 1, 1,
1.557866, -0.7339256, 1.740825, 0, 0, 0, 1, 1,
1.560346, 0.3235396, 1.415198, 0, 0, 0, 1, 1,
1.565463, 1.613484, -1.112691, 1, 1, 1, 1, 1,
1.592502, -0.2923391, 3.021947, 1, 1, 1, 1, 1,
1.596695, 2.009546, -0.1804992, 1, 1, 1, 1, 1,
1.605453, -0.05994784, 1.111343, 1, 1, 1, 1, 1,
1.612005, 0.7901621, -0.966866, 1, 1, 1, 1, 1,
1.612949, 0.6692232, 1.281853, 1, 1, 1, 1, 1,
1.646448, 1.719023, 0.4876444, 1, 1, 1, 1, 1,
1.646969, 2.051337, 1.531727, 1, 1, 1, 1, 1,
1.65153, -0.5848371, 2.640747, 1, 1, 1, 1, 1,
1.672501, -0.9312111, 2.87133, 1, 1, 1, 1, 1,
1.689246, 0.1161786, 1.3542, 1, 1, 1, 1, 1,
1.689413, 0.6670358, -0.4490766, 1, 1, 1, 1, 1,
1.716856, -0.1150205, 4.376737, 1, 1, 1, 1, 1,
1.740542, 0.8515185, 0.265625, 1, 1, 1, 1, 1,
1.742282, 0.434534, 1.731974, 1, 1, 1, 1, 1,
1.747159, -0.893301, 2.774602, 0, 0, 1, 1, 1,
1.748203, 0.6667308, 2.876188, 1, 0, 0, 1, 1,
1.770623, -2.389972, 1.873003, 1, 0, 0, 1, 1,
1.776299, -0.6584414, 2.515097, 1, 0, 0, 1, 1,
1.782957, 1.532315, -0.5302826, 1, 0, 0, 1, 1,
1.784232, 0.1639962, 1.206892, 1, 0, 0, 1, 1,
1.799733, -1.505424, 1.1429, 0, 0, 0, 1, 1,
1.809126, -0.1046779, -0.2783541, 0, 0, 0, 1, 1,
1.814386, -0.9764662, 3.136702, 0, 0, 0, 1, 1,
1.817781, -0.09683406, 1.048921, 0, 0, 0, 1, 1,
1.819907, -1.074968, 0.4949337, 0, 0, 0, 1, 1,
1.848009, -1.185833, 1.601634, 0, 0, 0, 1, 1,
1.854086, 0.5475476, 3.469779, 0, 0, 0, 1, 1,
1.860165, -1.623918, 3.803645, 1, 1, 1, 1, 1,
1.892953, -0.427375, -0.05623244, 1, 1, 1, 1, 1,
1.897493, -0.1774995, 2.377877, 1, 1, 1, 1, 1,
1.922227, -1.83363, 1.577086, 1, 1, 1, 1, 1,
1.923998, -0.2615051, 1.492687, 1, 1, 1, 1, 1,
1.930517, -0.413844, 0.06280077, 1, 1, 1, 1, 1,
1.934346, 0.1418749, 1.558139, 1, 1, 1, 1, 1,
1.937567, -0.05123771, 1.819306, 1, 1, 1, 1, 1,
1.938205, -1.970475, 1.009101, 1, 1, 1, 1, 1,
1.970188, -0.02127644, 2.083136, 1, 1, 1, 1, 1,
1.971813, 1.198987, 1.265689, 1, 1, 1, 1, 1,
1.976361, 1.195883, 0.8766798, 1, 1, 1, 1, 1,
1.978199, 1.401268, -0.5159677, 1, 1, 1, 1, 1,
1.981504, -0.7956259, 0.6189681, 1, 1, 1, 1, 1,
1.997037, 0.743763, 0.1641672, 1, 1, 1, 1, 1,
2.005803, 0.1699274, 2.969329, 0, 0, 1, 1, 1,
2.041643, -1.31774, 0.4367627, 1, 0, 0, 1, 1,
2.07436, 0.08515745, 3.471057, 1, 0, 0, 1, 1,
2.119217, 0.6231664, 1.361981, 1, 0, 0, 1, 1,
2.155766, 0.1050676, 2.40408, 1, 0, 0, 1, 1,
2.157774, -0.04443941, 0.6851838, 1, 0, 0, 1, 1,
2.162879, -0.7545099, 2.856174, 0, 0, 0, 1, 1,
2.175744, 0.3054596, 0.7971455, 0, 0, 0, 1, 1,
2.194677, -0.1225802, 2.147383, 0, 0, 0, 1, 1,
2.222609, -1.88618, 4.015197, 0, 0, 0, 1, 1,
2.23007, -0.9905847, 1.950593, 0, 0, 0, 1, 1,
2.269223, 0.03494127, 0.8810291, 0, 0, 0, 1, 1,
2.287087, -1.418173, 0.8077663, 0, 0, 0, 1, 1,
2.314793, 0.5342571, 0.6535602, 1, 1, 1, 1, 1,
2.439871, 0.8876074, 1.527232, 1, 1, 1, 1, 1,
2.445533, 0.2913036, 1.186803, 1, 1, 1, 1, 1,
2.495646, 0.2915697, 1.291193, 1, 1, 1, 1, 1,
2.508562, 1.606058, 0.9499471, 1, 1, 1, 1, 1,
2.5901, -2.293416, 2.592424, 1, 1, 1, 1, 1,
3.099277, 1.174742, 2.940451, 1, 1, 1, 1, 1
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
var radius = 9.527213;
var distance = 33.46393;
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
mvMatrix.translate( -0.0559628, -0.0937078, -0.119427 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46393);
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
