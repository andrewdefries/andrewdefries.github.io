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
-3.207544, 0.5903038, -0.4003852, 1, 0, 0, 1,
-3.118654, 1.587589, -1.703894, 1, 0.007843138, 0, 1,
-3.051315, -1.863362, -1.975087, 1, 0.01176471, 0, 1,
-3.028897, -1.765923, -1.497606, 1, 0.01960784, 0, 1,
-2.999757, -0.7560288, -1.98353, 1, 0.02352941, 0, 1,
-2.974281, -0.7602779, -1.275484, 1, 0.03137255, 0, 1,
-2.672864, 0.8583277, -2.205015, 1, 0.03529412, 0, 1,
-2.518254, 2.159742, -1.863483, 1, 0.04313726, 0, 1,
-2.454982, -0.08372777, -1.826484, 1, 0.04705882, 0, 1,
-2.448756, -0.6210697, -2.095083, 1, 0.05490196, 0, 1,
-2.446214, 1.515169, -0.9361848, 1, 0.05882353, 0, 1,
-2.345917, 1.198774, -2.395699, 1, 0.06666667, 0, 1,
-2.304046, 0.8235582, -0.9372624, 1, 0.07058824, 0, 1,
-2.283173, 0.6841757, -1.351593, 1, 0.07843138, 0, 1,
-2.19112, 1.742745, -1.020047, 1, 0.08235294, 0, 1,
-2.177891, -0.9425735, -2.928596, 1, 0.09019608, 0, 1,
-2.144913, 0.8792243, -0.2170404, 1, 0.09411765, 0, 1,
-2.138721, 0.9047571, -3.006984, 1, 0.1019608, 0, 1,
-2.119199, -0.2212011, -0.5458272, 1, 0.1098039, 0, 1,
-2.050466, -0.1329301, -0.9241747, 1, 0.1137255, 0, 1,
-2.03939, 0.06775169, 0.4192234, 1, 0.1215686, 0, 1,
-2.011299, -1.4878, -1.833838, 1, 0.1254902, 0, 1,
-2.005924, -1.087572, -1.643425, 1, 0.1333333, 0, 1,
-1.971061, -1.289932, -0.6063904, 1, 0.1372549, 0, 1,
-1.952649, 0.8898776, -0.9996566, 1, 0.145098, 0, 1,
-1.938739, 0.06687725, 0.1189138, 1, 0.1490196, 0, 1,
-1.933224, 0.6054761, -0.7047815, 1, 0.1568628, 0, 1,
-1.90761, -1.10597, -1.473165, 1, 0.1607843, 0, 1,
-1.907402, -0.5325424, -1.876237, 1, 0.1686275, 0, 1,
-1.897461, -0.1194678, -2.594358, 1, 0.172549, 0, 1,
-1.885579, -0.08055273, -0.5473197, 1, 0.1803922, 0, 1,
-1.864728, 0.1509319, -0.3423872, 1, 0.1843137, 0, 1,
-1.839223, 0.1981824, -3.620804, 1, 0.1921569, 0, 1,
-1.825938, 1.103716, -1.684338, 1, 0.1960784, 0, 1,
-1.823336, -0.3011548, -2.20293, 1, 0.2039216, 0, 1,
-1.823285, 0.798366, 0.2248944, 1, 0.2117647, 0, 1,
-1.822044, 1.641137, 0.2197316, 1, 0.2156863, 0, 1,
-1.805102, 2.097339, -0.5188103, 1, 0.2235294, 0, 1,
-1.783442, 0.8583975, -0.6362287, 1, 0.227451, 0, 1,
-1.778239, -1.469204, -2.224015, 1, 0.2352941, 0, 1,
-1.770195, 1.050643, -2.224952, 1, 0.2392157, 0, 1,
-1.725289, 1.199808, 0.5054541, 1, 0.2470588, 0, 1,
-1.68109, -0.1368841, -2.580528, 1, 0.2509804, 0, 1,
-1.667912, 1.022106, -0.4640779, 1, 0.2588235, 0, 1,
-1.642822, 0.6082595, -3.416963, 1, 0.2627451, 0, 1,
-1.629033, -0.4078524, -2.125675, 1, 0.2705882, 0, 1,
-1.621529, 0.5763189, -0.5538023, 1, 0.2745098, 0, 1,
-1.620067, -0.1081871, -1.281709, 1, 0.282353, 0, 1,
-1.607307, 0.3284233, 0.2168922, 1, 0.2862745, 0, 1,
-1.595703, 0.4843064, -1.724157, 1, 0.2941177, 0, 1,
-1.588277, 1.077934, -0.3717949, 1, 0.3019608, 0, 1,
-1.584587, 1.104138, -0.9634898, 1, 0.3058824, 0, 1,
-1.572875, -0.1960317, -1.155796, 1, 0.3137255, 0, 1,
-1.565674, 0.5327621, -0.3462656, 1, 0.3176471, 0, 1,
-1.563008, 0.190911, 0.2523254, 1, 0.3254902, 0, 1,
-1.541545, -0.918597, -2.192322, 1, 0.3294118, 0, 1,
-1.54015, 0.2299737, -2.739511, 1, 0.3372549, 0, 1,
-1.523707, 1.434597, -0.6902758, 1, 0.3411765, 0, 1,
-1.517071, 1.636945, 0.1895527, 1, 0.3490196, 0, 1,
-1.504011, 0.8388503, -1.666668, 1, 0.3529412, 0, 1,
-1.497795, -2.101471, -2.597424, 1, 0.3607843, 0, 1,
-1.494409, -0.6025183, -4.118739, 1, 0.3647059, 0, 1,
-1.477354, -1.589665, -3.272619, 1, 0.372549, 0, 1,
-1.474436, -0.2827907, -1.974643, 1, 0.3764706, 0, 1,
-1.468797, -0.1763291, -1.325805, 1, 0.3843137, 0, 1,
-1.463317, -0.0964221, -1.844467, 1, 0.3882353, 0, 1,
-1.458955, -0.9658736, -1.225418, 1, 0.3960784, 0, 1,
-1.448946, 0.4881518, -0.9218819, 1, 0.4039216, 0, 1,
-1.43423, 0.9153364, -0.4199314, 1, 0.4078431, 0, 1,
-1.417825, 1.007705, 0.4879042, 1, 0.4156863, 0, 1,
-1.41241, 1.356239, -1.735817, 1, 0.4196078, 0, 1,
-1.399425, -0.73743, -1.856008, 1, 0.427451, 0, 1,
-1.385459, -0.04888537, -1.632847, 1, 0.4313726, 0, 1,
-1.38235, -0.1263044, -3.176031, 1, 0.4392157, 0, 1,
-1.380236, 1.016734, -2.053252, 1, 0.4431373, 0, 1,
-1.375062, -0.4435144, -2.323971, 1, 0.4509804, 0, 1,
-1.365345, -0.6728512, -2.12778, 1, 0.454902, 0, 1,
-1.360646, -0.6153904, -3.646918, 1, 0.4627451, 0, 1,
-1.323395, 0.7225876, -0.2658745, 1, 0.4666667, 0, 1,
-1.313304, -0.7963582, -2.38426, 1, 0.4745098, 0, 1,
-1.310974, 0.700084, -2.485713, 1, 0.4784314, 0, 1,
-1.307099, -1.167922, -2.48524, 1, 0.4862745, 0, 1,
-1.306435, 1.3008, 0.09402444, 1, 0.4901961, 0, 1,
-1.306213, -1.028473, -2.597638, 1, 0.4980392, 0, 1,
-1.302264, -0.3177173, -2.203619, 1, 0.5058824, 0, 1,
-1.296354, 0.1161266, -2.600902, 1, 0.509804, 0, 1,
-1.294258, 0.3961782, -1.650151, 1, 0.5176471, 0, 1,
-1.276093, 0.1020292, 0.2610604, 1, 0.5215687, 0, 1,
-1.275065, 1.286618, -2.33312, 1, 0.5294118, 0, 1,
-1.272136, -0.3344381, -2.094321, 1, 0.5333334, 0, 1,
-1.271575, -1.684423, -2.340168, 1, 0.5411765, 0, 1,
-1.256814, 0.7114874, -0.8108074, 1, 0.5450981, 0, 1,
-1.248659, -0.1627005, -2.661844, 1, 0.5529412, 0, 1,
-1.245879, -1.382926, -3.891651, 1, 0.5568628, 0, 1,
-1.243256, 1.233849, 0.2513886, 1, 0.5647059, 0, 1,
-1.240134, -0.6253236, -1.033144, 1, 0.5686275, 0, 1,
-1.235733, 1.513836, -0.07963865, 1, 0.5764706, 0, 1,
-1.23068, -1.281323, -3.155461, 1, 0.5803922, 0, 1,
-1.228892, 1.454979, 0.8092681, 1, 0.5882353, 0, 1,
-1.224706, 0.469664, -2.167101, 1, 0.5921569, 0, 1,
-1.222092, 1.791662, -0.8010859, 1, 0.6, 0, 1,
-1.214207, -0.05971671, -1.560745, 1, 0.6078432, 0, 1,
-1.206027, 0.6350831, -2.04575, 1, 0.6117647, 0, 1,
-1.203952, -2.509352, -2.302259, 1, 0.6196079, 0, 1,
-1.196654, 0.2914363, -1.196669, 1, 0.6235294, 0, 1,
-1.190832, 1.284762, -2.246079, 1, 0.6313726, 0, 1,
-1.189625, 0.6324475, -0.662464, 1, 0.6352941, 0, 1,
-1.186434, -0.6077107, -1.23387, 1, 0.6431373, 0, 1,
-1.186008, 0.8128088, -0.6195567, 1, 0.6470588, 0, 1,
-1.179473, -0.3304738, -0.7882892, 1, 0.654902, 0, 1,
-1.174887, -0.5741944, -1.05465, 1, 0.6588235, 0, 1,
-1.169024, 0.4167602, -1.420738, 1, 0.6666667, 0, 1,
-1.167551, 2.275608, 2.122113, 1, 0.6705883, 0, 1,
-1.167351, -0.2710468, -1.81154, 1, 0.6784314, 0, 1,
-1.166565, 0.4531346, -2.296035, 1, 0.682353, 0, 1,
-1.154504, 0.2025484, -0.02130355, 1, 0.6901961, 0, 1,
-1.153564, 0.7574143, -1.351486, 1, 0.6941177, 0, 1,
-1.147926, 0.8440095, -1.487006, 1, 0.7019608, 0, 1,
-1.141445, -2.034859, -2.203939, 1, 0.7098039, 0, 1,
-1.128819, -0.7832119, -0.3244509, 1, 0.7137255, 0, 1,
-1.127527, -0.1857012, -3.531743, 1, 0.7215686, 0, 1,
-1.12413, -1.894486, -2.303905, 1, 0.7254902, 0, 1,
-1.109753, -0.9844355, -3.087143, 1, 0.7333333, 0, 1,
-1.107111, -1.648645, -1.232591, 1, 0.7372549, 0, 1,
-1.082185, -1.763207, -2.244165, 1, 0.7450981, 0, 1,
-1.081393, 0.01834289, -3.282722, 1, 0.7490196, 0, 1,
-1.080666, 0.1433437, -0.7432771, 1, 0.7568628, 0, 1,
-1.079535, -1.138145, -3.745884, 1, 0.7607843, 0, 1,
-1.079027, 0.4858548, -2.372581, 1, 0.7686275, 0, 1,
-1.075047, 0.2957404, -2.045265, 1, 0.772549, 0, 1,
-1.070311, 1.061566, -0.7918696, 1, 0.7803922, 0, 1,
-1.068393, 0.799661, -0.5916624, 1, 0.7843137, 0, 1,
-1.039725, 0.41791, 0.593809, 1, 0.7921569, 0, 1,
-1.037671, -1.06195, -1.413403, 1, 0.7960784, 0, 1,
-1.036114, 0.3105674, -3.440587, 1, 0.8039216, 0, 1,
-1.017233, -1.382793, -0.8488173, 1, 0.8117647, 0, 1,
-1.014441, -0.3442384, -0.6275169, 1, 0.8156863, 0, 1,
-1.013975, -0.3085061, -1.449916, 1, 0.8235294, 0, 1,
-1.007786, -0.4322255, 0.214447, 1, 0.827451, 0, 1,
-0.9949142, -0.6020168, -2.084601, 1, 0.8352941, 0, 1,
-0.9892141, -0.1847128, -0.1482511, 1, 0.8392157, 0, 1,
-0.9849547, 1.212334, -1.386096, 1, 0.8470588, 0, 1,
-0.9844922, 0.08499647, -2.434045, 1, 0.8509804, 0, 1,
-0.9770545, 0.5856374, -0.9488023, 1, 0.8588235, 0, 1,
-0.9769317, -0.06916329, -1.474744, 1, 0.8627451, 0, 1,
-0.9701101, -0.3158043, -3.565124, 1, 0.8705882, 0, 1,
-0.9699207, 1.083532, -0.5545419, 1, 0.8745098, 0, 1,
-0.9670466, 0.007397973, -2.229264, 1, 0.8823529, 0, 1,
-0.9669276, -0.4583884, -1.477395, 1, 0.8862745, 0, 1,
-0.9616089, 0.9517248, -2.329471, 1, 0.8941177, 0, 1,
-0.9553133, 0.1100823, -1.57065, 1, 0.8980392, 0, 1,
-0.9440669, -1.200292, -2.218584, 1, 0.9058824, 0, 1,
-0.9263205, 0.7942616, -1.856336, 1, 0.9137255, 0, 1,
-0.9219668, 0.1236715, -0.4599371, 1, 0.9176471, 0, 1,
-0.9218808, 0.9310625, -1.670988, 1, 0.9254902, 0, 1,
-0.9205499, 0.8204582, -1.869309, 1, 0.9294118, 0, 1,
-0.9108143, 0.7846565, -1.171234, 1, 0.9372549, 0, 1,
-0.9103501, 0.4682039, -0.6006611, 1, 0.9411765, 0, 1,
-0.9068663, 1.148634, -0.4507633, 1, 0.9490196, 0, 1,
-0.9043871, -1.940257, -3.164414, 1, 0.9529412, 0, 1,
-0.9039087, -0.6352783, -1.480815, 1, 0.9607843, 0, 1,
-0.8938871, -0.8697965, -2.824832, 1, 0.9647059, 0, 1,
-0.8920281, -2.509097, -3.761872, 1, 0.972549, 0, 1,
-0.8904757, 0.2364441, -2.24887, 1, 0.9764706, 0, 1,
-0.8869881, -1.268547, -3.097378, 1, 0.9843137, 0, 1,
-0.8854172, -0.7316352, -0.6858826, 1, 0.9882353, 0, 1,
-0.8823815, 0.2783936, -2.762482, 1, 0.9960784, 0, 1,
-0.8818441, 0.02114138, -1.839525, 0.9960784, 1, 0, 1,
-0.8780978, -0.07271511, -0.867131, 0.9921569, 1, 0, 1,
-0.8769447, 1.934701, -1.405992, 0.9843137, 1, 0, 1,
-0.872783, -0.3095999, -1.580379, 0.9803922, 1, 0, 1,
-0.8710725, -0.4744577, -1.027727, 0.972549, 1, 0, 1,
-0.870501, -0.7602032, -0.6649095, 0.9686275, 1, 0, 1,
-0.870333, -0.7511925, -3.073713, 0.9607843, 1, 0, 1,
-0.8703145, -0.00537813, -2.702294, 0.9568627, 1, 0, 1,
-0.8689398, -0.8019807, -1.528453, 0.9490196, 1, 0, 1,
-0.8657327, -0.4521486, -3.343814, 0.945098, 1, 0, 1,
-0.8656042, -0.4734675, -2.611645, 0.9372549, 1, 0, 1,
-0.8635319, 1.299768, -1.134651, 0.9333333, 1, 0, 1,
-0.8611899, 0.2300471, -3.445419, 0.9254902, 1, 0, 1,
-0.8499302, -1.150913, -4.120252, 0.9215686, 1, 0, 1,
-0.8430219, -0.4768674, -0.9782445, 0.9137255, 1, 0, 1,
-0.8363049, 0.7214454, -2.506228, 0.9098039, 1, 0, 1,
-0.8267133, -0.2068463, -0.398591, 0.9019608, 1, 0, 1,
-0.8211889, -0.7135102, -1.485707, 0.8941177, 1, 0, 1,
-0.8117876, 0.8548977, -0.777599, 0.8901961, 1, 0, 1,
-0.8109061, -1.090586, -3.655432, 0.8823529, 1, 0, 1,
-0.8095856, 0.6843581, -1.620619, 0.8784314, 1, 0, 1,
-0.8081111, 2.043938, 0.1924971, 0.8705882, 1, 0, 1,
-0.8058426, -0.7895122, -1.78632, 0.8666667, 1, 0, 1,
-0.8054115, -1.409043, -1.962341, 0.8588235, 1, 0, 1,
-0.8013215, -1.340701, -3.539706, 0.854902, 1, 0, 1,
-0.7992779, -2.675677, -3.314022, 0.8470588, 1, 0, 1,
-0.7908359, -1.795547, -3.250944, 0.8431373, 1, 0, 1,
-0.7891895, -0.4594074, -0.6597351, 0.8352941, 1, 0, 1,
-0.7881563, 1.298082, -2.073965, 0.8313726, 1, 0, 1,
-0.7836118, -0.1096014, -2.516108, 0.8235294, 1, 0, 1,
-0.783383, -0.7138175, -0.6133721, 0.8196079, 1, 0, 1,
-0.7801927, 1.385948, 1.585439, 0.8117647, 1, 0, 1,
-0.7753628, 0.002020066, -1.064706, 0.8078431, 1, 0, 1,
-0.7742394, 0.3614584, -1.414317, 0.8, 1, 0, 1,
-0.7712042, 0.6846524, -0.2094253, 0.7921569, 1, 0, 1,
-0.7693748, 2.604416, -1.85138, 0.7882353, 1, 0, 1,
-0.766723, -0.07653183, -0.4328769, 0.7803922, 1, 0, 1,
-0.760487, -1.061621, -1.672341, 0.7764706, 1, 0, 1,
-0.7595928, 1.835651, -1.921232, 0.7686275, 1, 0, 1,
-0.7581301, -0.1227603, -1.847406, 0.7647059, 1, 0, 1,
-0.7565187, -0.4256119, -3.078815, 0.7568628, 1, 0, 1,
-0.7512908, 1.35098, -0.6497499, 0.7529412, 1, 0, 1,
-0.7510642, -0.5971317, -3.229021, 0.7450981, 1, 0, 1,
-0.7455758, -0.3016746, -1.753085, 0.7411765, 1, 0, 1,
-0.7427465, -1.4709, -1.279065, 0.7333333, 1, 0, 1,
-0.7380886, 1.348639, -1.266308, 0.7294118, 1, 0, 1,
-0.7370675, 0.5277436, -0.4526919, 0.7215686, 1, 0, 1,
-0.735763, 0.2352657, -1.114008, 0.7176471, 1, 0, 1,
-0.7334905, 1.028268, -0.5182754, 0.7098039, 1, 0, 1,
-0.7324199, 1.128225, -0.3941616, 0.7058824, 1, 0, 1,
-0.7296872, 0.7430847, -0.9811365, 0.6980392, 1, 0, 1,
-0.7277192, 0.09763949, -0.6734289, 0.6901961, 1, 0, 1,
-0.719913, 0.4813852, -2.514664, 0.6862745, 1, 0, 1,
-0.7168625, 0.5608436, -0.001202372, 0.6784314, 1, 0, 1,
-0.7087504, 0.2040314, -1.817654, 0.6745098, 1, 0, 1,
-0.7075873, -1.957256, -2.349597, 0.6666667, 1, 0, 1,
-0.7042117, 1.263971, 0.3406934, 0.6627451, 1, 0, 1,
-0.7011031, 1.303374, -1.17706, 0.654902, 1, 0, 1,
-0.6997929, 0.08346001, -0.9838039, 0.6509804, 1, 0, 1,
-0.6970141, 0.4039216, -0.3568701, 0.6431373, 1, 0, 1,
-0.6936275, -0.2337105, -0.7381622, 0.6392157, 1, 0, 1,
-0.6928493, -0.1884228, -1.532583, 0.6313726, 1, 0, 1,
-0.6913675, -1.697593, -1.467571, 0.627451, 1, 0, 1,
-0.6894178, 0.5447516, -1.03975, 0.6196079, 1, 0, 1,
-0.6856734, -0.4813922, -1.238911, 0.6156863, 1, 0, 1,
-0.6842608, 0.9593497, -2.28966, 0.6078432, 1, 0, 1,
-0.6813281, 0.01496227, -1.064074, 0.6039216, 1, 0, 1,
-0.6808757, -1.815736, -3.528337, 0.5960785, 1, 0, 1,
-0.6779168, -1.248281, -2.401512, 0.5882353, 1, 0, 1,
-0.6765661, -1.7389, -1.773636, 0.5843138, 1, 0, 1,
-0.6762699, -0.7591788, -2.437875, 0.5764706, 1, 0, 1,
-0.6731881, 0.9530689, -2.835783, 0.572549, 1, 0, 1,
-0.6706104, 0.1480353, -2.136797, 0.5647059, 1, 0, 1,
-0.6701992, 0.1709622, -1.048518, 0.5607843, 1, 0, 1,
-0.6697843, 0.1548777, -0.661052, 0.5529412, 1, 0, 1,
-0.6613361, 0.03482733, -1.97124, 0.5490196, 1, 0, 1,
-0.6593141, 0.1627053, -1.675972, 0.5411765, 1, 0, 1,
-0.6585615, 0.09691045, -1.994503, 0.5372549, 1, 0, 1,
-0.6561464, -0.2385436, -1.730444, 0.5294118, 1, 0, 1,
-0.6517076, 1.424943, -0.2160485, 0.5254902, 1, 0, 1,
-0.6502723, 0.9452871, -0.6356069, 0.5176471, 1, 0, 1,
-0.6488636, -0.09421813, -0.612054, 0.5137255, 1, 0, 1,
-0.6473233, 0.571584, -2.99782, 0.5058824, 1, 0, 1,
-0.6432404, -0.2697599, -1.723618, 0.5019608, 1, 0, 1,
-0.6381741, 0.8196875, -0.2307998, 0.4941176, 1, 0, 1,
-0.6347796, 1.295737, 0.2692322, 0.4862745, 1, 0, 1,
-0.6343607, 0.3331799, -3.014225, 0.4823529, 1, 0, 1,
-0.6306397, 0.777147, 0.3600988, 0.4745098, 1, 0, 1,
-0.6267539, -0.01794463, -1.602445, 0.4705882, 1, 0, 1,
-0.6251615, -0.3124837, -2.26627, 0.4627451, 1, 0, 1,
-0.6233866, 1.064737, 0.4509076, 0.4588235, 1, 0, 1,
-0.6193203, -0.6929356, -2.372166, 0.4509804, 1, 0, 1,
-0.6175526, 0.282813, 0.0002843785, 0.4470588, 1, 0, 1,
-0.6165303, -1.775982, -1.970538, 0.4392157, 1, 0, 1,
-0.6164979, -0.8095098, -3.220742, 0.4352941, 1, 0, 1,
-0.6156508, 0.4699369, -2.575503, 0.427451, 1, 0, 1,
-0.6154569, 0.5260072, -1.845381, 0.4235294, 1, 0, 1,
-0.6152202, 0.4874273, -2.366428, 0.4156863, 1, 0, 1,
-0.6145325, -0.4365107, -2.843988, 0.4117647, 1, 0, 1,
-0.6123922, 1.134617, 0.8900357, 0.4039216, 1, 0, 1,
-0.6117426, -0.5612953, -2.168102, 0.3960784, 1, 0, 1,
-0.6105831, 0.5328697, -1.26812, 0.3921569, 1, 0, 1,
-0.6078199, 0.1498416, -1.526557, 0.3843137, 1, 0, 1,
-0.6056718, -0.8834943, -3.143372, 0.3803922, 1, 0, 1,
-0.600611, 0.378644, -0.9236432, 0.372549, 1, 0, 1,
-0.6003048, -0.2912788, -0.817564, 0.3686275, 1, 0, 1,
-0.5988186, -0.4389062, -2.770964, 0.3607843, 1, 0, 1,
-0.596998, 1.011747, -1.529591, 0.3568628, 1, 0, 1,
-0.5954139, -0.1851784, -3.3354, 0.3490196, 1, 0, 1,
-0.5947783, -0.1533466, -1.820045, 0.345098, 1, 0, 1,
-0.5898718, 0.4454027, -2.773163, 0.3372549, 1, 0, 1,
-0.5883543, 0.1371326, -1.076348, 0.3333333, 1, 0, 1,
-0.586819, -1.069047, -1.774856, 0.3254902, 1, 0, 1,
-0.5837375, -0.03454568, -0.6802641, 0.3215686, 1, 0, 1,
-0.5801801, -0.7174731, -2.312209, 0.3137255, 1, 0, 1,
-0.5781748, -0.9986774, -1.986172, 0.3098039, 1, 0, 1,
-0.5692958, -1.277615, -1.100039, 0.3019608, 1, 0, 1,
-0.5686431, -1.682082, -2.76995, 0.2941177, 1, 0, 1,
-0.5673553, 0.0230993, -2.490493, 0.2901961, 1, 0, 1,
-0.5659336, -0.6416239, -0.9907922, 0.282353, 1, 0, 1,
-0.5653726, -0.876268, -2.216123, 0.2784314, 1, 0, 1,
-0.5637311, -0.5593262, -1.82253, 0.2705882, 1, 0, 1,
-0.5620052, 1.552655, -2.076994, 0.2666667, 1, 0, 1,
-0.5615857, -0.993852, -3.494161, 0.2588235, 1, 0, 1,
-0.5580723, 0.9342743, -1.142541, 0.254902, 1, 0, 1,
-0.5538787, 3.177268, -1.011312, 0.2470588, 1, 0, 1,
-0.5535457, 2.403668, -0.2382098, 0.2431373, 1, 0, 1,
-0.5519905, -0.525423, -4.816845, 0.2352941, 1, 0, 1,
-0.5489603, -0.7980046, -1.846671, 0.2313726, 1, 0, 1,
-0.5484198, 0.9874871, -0.0413639, 0.2235294, 1, 0, 1,
-0.5453805, -1.015105, -2.40805, 0.2196078, 1, 0, 1,
-0.5449875, 1.529931, -0.258814, 0.2117647, 1, 0, 1,
-0.5404778, 0.9158313, 0.8074418, 0.2078431, 1, 0, 1,
-0.5403596, -0.1952927, -0.758586, 0.2, 1, 0, 1,
-0.5388809, 0.04364538, -2.666742, 0.1921569, 1, 0, 1,
-0.5363606, -0.9447516, -3.766542, 0.1882353, 1, 0, 1,
-0.5358282, -0.8095431, -1.29671, 0.1803922, 1, 0, 1,
-0.5352421, 0.5891833, -0.8131796, 0.1764706, 1, 0, 1,
-0.5338051, -0.3595512, -2.346266, 0.1686275, 1, 0, 1,
-0.529318, 1.2665, 0.4436885, 0.1647059, 1, 0, 1,
-0.5208509, 0.09651864, -1.031778, 0.1568628, 1, 0, 1,
-0.519592, -0.4639989, -1.645259, 0.1529412, 1, 0, 1,
-0.5165408, -0.5098607, -2.664161, 0.145098, 1, 0, 1,
-0.5067844, 0.3005217, -1.48862, 0.1411765, 1, 0, 1,
-0.5061265, -0.9389551, -1.724663, 0.1333333, 1, 0, 1,
-0.5050015, -0.3035432, -3.694427, 0.1294118, 1, 0, 1,
-0.5045885, -1.037742, -4.234825, 0.1215686, 1, 0, 1,
-0.4999007, -1.039022, -3.259358, 0.1176471, 1, 0, 1,
-0.4963568, 1.010377, -1.139087, 0.1098039, 1, 0, 1,
-0.4939691, -0.7645068, -3.03472, 0.1058824, 1, 0, 1,
-0.4925922, -1.005248, -1.942242, 0.09803922, 1, 0, 1,
-0.4911856, -1.308397, -2.776962, 0.09019608, 1, 0, 1,
-0.4877968, -0.8312386, -1.619031, 0.08627451, 1, 0, 1,
-0.4825729, 1.982826, 1.198838, 0.07843138, 1, 0, 1,
-0.474118, 1.347762, -1.022693, 0.07450981, 1, 0, 1,
-0.4733421, -0.3622926, -3.151474, 0.06666667, 1, 0, 1,
-0.4701476, -1.79244, -2.852497, 0.0627451, 1, 0, 1,
-0.4678604, 1.560739, -1.796519, 0.05490196, 1, 0, 1,
-0.4505704, 0.2341104, -2.473486, 0.05098039, 1, 0, 1,
-0.4487223, -1.333393, -4.485473, 0.04313726, 1, 0, 1,
-0.4474829, 0.2462403, -2.460893, 0.03921569, 1, 0, 1,
-0.44605, 0.04809986, -1.585512, 0.03137255, 1, 0, 1,
-0.4419165, -0.3843648, -1.855812, 0.02745098, 1, 0, 1,
-0.4403816, -0.05685339, -1.139218, 0.01960784, 1, 0, 1,
-0.436774, 1.407822, 0.2121727, 0.01568628, 1, 0, 1,
-0.4332035, 1.150143, -0.1138662, 0.007843138, 1, 0, 1,
-0.4316328, -1.543164, -4.520612, 0.003921569, 1, 0, 1,
-0.4286555, -0.04944566, -2.580637, 0, 1, 0.003921569, 1,
-0.4280264, 0.5777787, 0.3645842, 0, 1, 0.01176471, 1,
-0.4184768, 0.02835924, -0.9538676, 0, 1, 0.01568628, 1,
-0.4175994, 0.898023, 0.811144, 0, 1, 0.02352941, 1,
-0.4167007, 1.483987, -1.273219, 0, 1, 0.02745098, 1,
-0.4115011, -1.07291, -3.029219, 0, 1, 0.03529412, 1,
-0.4071241, 1.144096, -0.8871183, 0, 1, 0.03921569, 1,
-0.4059349, 0.7149907, 0.007508515, 0, 1, 0.04705882, 1,
-0.4041681, 0.2510819, -2.244565, 0, 1, 0.05098039, 1,
-0.4027224, 0.9085777, 1.095228, 0, 1, 0.05882353, 1,
-0.4021122, -0.2906784, -0.7065883, 0, 1, 0.0627451, 1,
-0.3950965, 0.5757924, 0.8123096, 0, 1, 0.07058824, 1,
-0.3927824, 1.975166, 2.92802, 0, 1, 0.07450981, 1,
-0.3905542, 1.425996, -0.9651528, 0, 1, 0.08235294, 1,
-0.3886708, -0.06576933, -2.403888, 0, 1, 0.08627451, 1,
-0.3631414, 0.6822121, 1.382084, 0, 1, 0.09411765, 1,
-0.3604719, -2.338796, -3.635535, 0, 1, 0.1019608, 1,
-0.3574371, 1.173736, 0.02800747, 0, 1, 0.1058824, 1,
-0.354855, 0.5502019, 1.187063, 0, 1, 0.1137255, 1,
-0.3431305, 1.661183, -1.627537, 0, 1, 0.1176471, 1,
-0.3429701, -0.8923463, -1.283502, 0, 1, 0.1254902, 1,
-0.3426118, -0.9287057, -2.461028, 0, 1, 0.1294118, 1,
-0.3240124, -1.021898, -5.342263, 0, 1, 0.1372549, 1,
-0.3227659, -0.8004452, -2.64103, 0, 1, 0.1411765, 1,
-0.3182494, 0.8174419, -0.3605275, 0, 1, 0.1490196, 1,
-0.3180627, -0.7578514, -4.129795, 0, 1, 0.1529412, 1,
-0.3178547, -1.537006, -3.424938, 0, 1, 0.1607843, 1,
-0.3170455, 0.5673935, 0.1888346, 0, 1, 0.1647059, 1,
-0.3157029, -0.7287378, -3.507103, 0, 1, 0.172549, 1,
-0.3135048, 0.3182845, -1.400879, 0, 1, 0.1764706, 1,
-0.3099222, -0.0461756, -2.978258, 0, 1, 0.1843137, 1,
-0.3089664, 1.24595, -1.982836, 0, 1, 0.1882353, 1,
-0.3079841, -0.2591442, -1.814147, 0, 1, 0.1960784, 1,
-0.307943, -0.01301015, -2.054155, 0, 1, 0.2039216, 1,
-0.3009686, -0.9809856, -4.288786, 0, 1, 0.2078431, 1,
-0.2901683, -0.625791, -2.429941, 0, 1, 0.2156863, 1,
-0.2868925, -1.657661, -2.438595, 0, 1, 0.2196078, 1,
-0.2868451, 0.6947072, -1.669362, 0, 1, 0.227451, 1,
-0.2846393, 0.2442266, -1.453153, 0, 1, 0.2313726, 1,
-0.2835272, -0.3429076, -0.8897877, 0, 1, 0.2392157, 1,
-0.2830225, -0.9102123, -2.730096, 0, 1, 0.2431373, 1,
-0.2792684, -1.868992, -3.779783, 0, 1, 0.2509804, 1,
-0.2771538, 0.7804012, 0.9962932, 0, 1, 0.254902, 1,
-0.2766877, -1.522912, -1.949772, 0, 1, 0.2627451, 1,
-0.2738447, -0.3876626, -2.2316, 0, 1, 0.2666667, 1,
-0.2687988, 1.560272, -0.5360449, 0, 1, 0.2745098, 1,
-0.2679946, 0.7917306, -1.326737, 0, 1, 0.2784314, 1,
-0.26289, 1.361317, -0.7671387, 0, 1, 0.2862745, 1,
-0.2562985, -1.47112, -2.930273, 0, 1, 0.2901961, 1,
-0.255869, -1.423911, -2.402058, 0, 1, 0.2980392, 1,
-0.2554596, -0.1073669, -3.325744, 0, 1, 0.3058824, 1,
-0.2548883, -1.206196, -1.439515, 0, 1, 0.3098039, 1,
-0.2538815, -1.225762, -3.087894, 0, 1, 0.3176471, 1,
-0.2492271, 0.392577, 2.440339, 0, 1, 0.3215686, 1,
-0.2432278, 0.3555836, -0.3316596, 0, 1, 0.3294118, 1,
-0.2425918, -0.1317939, -2.883077, 0, 1, 0.3333333, 1,
-0.2379208, -0.6678095, -3.031374, 0, 1, 0.3411765, 1,
-0.2366526, -1.114233, -3.154531, 0, 1, 0.345098, 1,
-0.2315558, 1.227477, -0.3399825, 0, 1, 0.3529412, 1,
-0.2260989, -0.5220525, -2.891481, 0, 1, 0.3568628, 1,
-0.2228663, -0.3445735, -2.790844, 0, 1, 0.3647059, 1,
-0.2217279, 0.918663, -2.891713, 0, 1, 0.3686275, 1,
-0.2210508, 0.9161846, -0.2158788, 0, 1, 0.3764706, 1,
-0.2205048, 0.09105772, -2.045233, 0, 1, 0.3803922, 1,
-0.2189335, -0.48378, -2.802974, 0, 1, 0.3882353, 1,
-0.2180126, 0.06942839, 0.9132976, 0, 1, 0.3921569, 1,
-0.2179589, 2.071182, -0.6891041, 0, 1, 0.4, 1,
-0.2145198, -2.392798, -3.301231, 0, 1, 0.4078431, 1,
-0.2113848, -0.6319432, -0.9789347, 0, 1, 0.4117647, 1,
-0.2057851, 0.6436499, -0.8760368, 0, 1, 0.4196078, 1,
-0.2038179, -0.5924525, -2.233394, 0, 1, 0.4235294, 1,
-0.196144, -1.200464, -2.36544, 0, 1, 0.4313726, 1,
-0.1866095, 0.3035895, 1.173275, 0, 1, 0.4352941, 1,
-0.1840955, -0.7065225, -1.681115, 0, 1, 0.4431373, 1,
-0.1828036, 0.7639956, -1.524602, 0, 1, 0.4470588, 1,
-0.1781028, -1.389045, -5.27598, 0, 1, 0.454902, 1,
-0.1777906, -1.402873, -5.03686, 0, 1, 0.4588235, 1,
-0.1769313, -1.028889, -3.240131, 0, 1, 0.4666667, 1,
-0.176838, -0.1044298, -2.724074, 0, 1, 0.4705882, 1,
-0.1749719, -1.051583, -2.652251, 0, 1, 0.4784314, 1,
-0.1740554, 0.6781894, 0.6203154, 0, 1, 0.4823529, 1,
-0.1662704, -0.8266774, -5.553911, 0, 1, 0.4901961, 1,
-0.1610757, -0.7680102, -1.885059, 0, 1, 0.4941176, 1,
-0.1609624, 0.6642632, 1.650883, 0, 1, 0.5019608, 1,
-0.160333, -0.7002507, -3.674607, 0, 1, 0.509804, 1,
-0.160192, 0.2421279, 0.1516335, 0, 1, 0.5137255, 1,
-0.1580937, -1.628793, -3.593774, 0, 1, 0.5215687, 1,
-0.1539996, 0.2844637, -1.072064, 0, 1, 0.5254902, 1,
-0.1513077, 0.769328, 1.332359, 0, 1, 0.5333334, 1,
-0.1511752, -0.5853053, -3.811946, 0, 1, 0.5372549, 1,
-0.1472444, 1.251377, 0.3123899, 0, 1, 0.5450981, 1,
-0.1443218, -1.17745, -4.561075, 0, 1, 0.5490196, 1,
-0.1424344, 0.06653695, -1.505226, 0, 1, 0.5568628, 1,
-0.1384322, 1.369046, -1.647488, 0, 1, 0.5607843, 1,
-0.1364026, -1.024472, -2.222436, 0, 1, 0.5686275, 1,
-0.1345667, -1.440548, -1.634978, 0, 1, 0.572549, 1,
-0.1325069, -1.263863, -3.679842, 0, 1, 0.5803922, 1,
-0.1310595, -0.2510708, -4.573673, 0, 1, 0.5843138, 1,
-0.1299273, 0.09889298, -0.6756341, 0, 1, 0.5921569, 1,
-0.1291585, 0.5946219, 0.1674719, 0, 1, 0.5960785, 1,
-0.1283726, 0.8936949, -0.3826982, 0, 1, 0.6039216, 1,
-0.1260031, -1.002034, -1.875243, 0, 1, 0.6117647, 1,
-0.1257229, 1.413147, -1.543, 0, 1, 0.6156863, 1,
-0.1245809, 1.598701, -1.137521, 0, 1, 0.6235294, 1,
-0.1231321, -0.06011122, -2.785785, 0, 1, 0.627451, 1,
-0.117345, 0.2346402, -1.215248, 0, 1, 0.6352941, 1,
-0.1139218, 0.7835078, 0.6913184, 0, 1, 0.6392157, 1,
-0.1135285, 0.1417505, -1.394705, 0, 1, 0.6470588, 1,
-0.1123266, 1.2667, -0.223336, 0, 1, 0.6509804, 1,
-0.1097153, -0.3409715, -2.013092, 0, 1, 0.6588235, 1,
-0.1045978, -0.5894864, -4.470388, 0, 1, 0.6627451, 1,
-0.1034496, 1.530308, -0.6841984, 0, 1, 0.6705883, 1,
-0.09601794, -0.803835, -1.40783, 0, 1, 0.6745098, 1,
-0.09566035, -0.5419981, -3.56617, 0, 1, 0.682353, 1,
-0.09195423, -1.186882, -2.90602, 0, 1, 0.6862745, 1,
-0.09094135, -1.817389, -2.373585, 0, 1, 0.6941177, 1,
-0.09079289, 0.2739414, -0.2210478, 0, 1, 0.7019608, 1,
-0.0804216, -0.25446, -2.217518, 0, 1, 0.7058824, 1,
-0.07887615, 0.3156237, 2.139956, 0, 1, 0.7137255, 1,
-0.074821, -0.2232261, -1.113497, 0, 1, 0.7176471, 1,
-0.07442696, -1.427502, -2.7019, 0, 1, 0.7254902, 1,
-0.0735641, 0.1354102, -0.5340719, 0, 1, 0.7294118, 1,
-0.07342336, 0.3929766, -0.4878634, 0, 1, 0.7372549, 1,
-0.07244744, -0.2702996, -3.624386, 0, 1, 0.7411765, 1,
-0.0716282, 0.523953, 0.4842566, 0, 1, 0.7490196, 1,
-0.07020552, -0.0763717, -1.850535, 0, 1, 0.7529412, 1,
-0.06914997, 1.985107, -1.083003, 0, 1, 0.7607843, 1,
-0.06816886, 0.4121888, 0.3421059, 0, 1, 0.7647059, 1,
-0.0641126, -1.861714, -2.996511, 0, 1, 0.772549, 1,
-0.06362627, 0.3878227, -1.459471, 0, 1, 0.7764706, 1,
-0.06358942, -1.129395, -3.389437, 0, 1, 0.7843137, 1,
-0.06127944, -1.455555, -6.106793, 0, 1, 0.7882353, 1,
-0.06091748, 1.420226, -0.4974634, 0, 1, 0.7960784, 1,
-0.05774565, 1.965138, -1.792815, 0, 1, 0.8039216, 1,
-0.05493378, 0.5958169, -0.4002347, 0, 1, 0.8078431, 1,
-0.05443626, -0.1200903, -2.829046, 0, 1, 0.8156863, 1,
-0.05409998, -0.06974784, -2.475747, 0, 1, 0.8196079, 1,
-0.04719332, 0.1257489, -0.7116078, 0, 1, 0.827451, 1,
-0.04630189, -1.585519, -3.011609, 0, 1, 0.8313726, 1,
-0.04627935, -0.3617226, -1.402131, 0, 1, 0.8392157, 1,
-0.03952423, 1.817354, -0.7956275, 0, 1, 0.8431373, 1,
-0.0381247, -1.599481, -5.095716, 0, 1, 0.8509804, 1,
-0.03508177, 0.549762, 0.7793982, 0, 1, 0.854902, 1,
-0.03501409, 1.655095, 0.1468731, 0, 1, 0.8627451, 1,
-0.02878797, -0.3599341, -1.985106, 0, 1, 0.8666667, 1,
-0.02606539, -0.0408713, -5.349698, 0, 1, 0.8745098, 1,
-0.02564725, -0.7164112, -1.492558, 0, 1, 0.8784314, 1,
-0.02531443, -0.01056837, -3.241714, 0, 1, 0.8862745, 1,
-0.02431449, 0.5788675, -0.3299252, 0, 1, 0.8901961, 1,
-0.02426574, 0.3877647, -1.813969, 0, 1, 0.8980392, 1,
-0.01663698, 0.9812799, 0.4044489, 0, 1, 0.9058824, 1,
-0.01549403, 0.8396036, 1.370621, 0, 1, 0.9098039, 1,
-0.01417568, 1.473517, 0.3821839, 0, 1, 0.9176471, 1,
-0.01256028, 0.2133186, -0.3884566, 0, 1, 0.9215686, 1,
-0.01177135, -0.1027427, -2.100378, 0, 1, 0.9294118, 1,
-0.01159488, 0.002888157, -0.6150294, 0, 1, 0.9333333, 1,
-0.008963253, -0.438717, -3.157987, 0, 1, 0.9411765, 1,
-0.008413197, 1.840309, 1.242791, 0, 1, 0.945098, 1,
-0.003755761, 0.86496, 0.6582159, 0, 1, 0.9529412, 1,
-8.173673e-05, -1.697899, -2.69853, 0, 1, 0.9568627, 1,
0.008087487, 1.733397, -0.2608337, 0, 1, 0.9647059, 1,
0.01274467, 0.4323413, 0.6333244, 0, 1, 0.9686275, 1,
0.01839704, -1.255805, 2.610903, 0, 1, 0.9764706, 1,
0.02054552, 0.7140655, 0.8339926, 0, 1, 0.9803922, 1,
0.02247284, 0.02699879, 1.189219, 0, 1, 0.9882353, 1,
0.0230706, -1.78739, 3.47507, 0, 1, 0.9921569, 1,
0.03369803, -0.07502639, 2.142588, 0, 1, 1, 1,
0.03829959, 0.1736298, -1.16331, 0, 0.9921569, 1, 1,
0.04129695, 0.6110483, 1.426784, 0, 0.9882353, 1, 1,
0.0432508, 0.05043992, 0.7876897, 0, 0.9803922, 1, 1,
0.04489171, -0.1287708, 3.193183, 0, 0.9764706, 1, 1,
0.0457738, 0.270167, -0.1618483, 0, 0.9686275, 1, 1,
0.04815133, 1.097395, 1.01274, 0, 0.9647059, 1, 1,
0.05052666, 1.802756, -0.6842857, 0, 0.9568627, 1, 1,
0.05170638, 1.188259, 0.8123596, 0, 0.9529412, 1, 1,
0.05951032, -0.1404546, 3.09813, 0, 0.945098, 1, 1,
0.06017986, 0.3708336, 0.1948272, 0, 0.9411765, 1, 1,
0.06171444, 1.119571, 0.3373524, 0, 0.9333333, 1, 1,
0.06178175, 2.22863, 0.849637, 0, 0.9294118, 1, 1,
0.06184772, 0.6278691, 0.5094604, 0, 0.9215686, 1, 1,
0.06846061, -0.394224, 1.595868, 0, 0.9176471, 1, 1,
0.07148729, -0.1296034, 1.851313, 0, 0.9098039, 1, 1,
0.07264905, 0.1899238, 0.4168317, 0, 0.9058824, 1, 1,
0.07408568, 0.0681221, -1.325594, 0, 0.8980392, 1, 1,
0.07570039, 0.957395, -0.1747349, 0, 0.8901961, 1, 1,
0.07573095, 1.979927, 0.7014505, 0, 0.8862745, 1, 1,
0.07697401, 2.368863, 0.339684, 0, 0.8784314, 1, 1,
0.07937368, 0.8658291, -0.08894957, 0, 0.8745098, 1, 1,
0.08058141, 0.4104666, 1.164128, 0, 0.8666667, 1, 1,
0.08127823, -0.2035174, 3.386522, 0, 0.8627451, 1, 1,
0.08289856, 1.120716, 0.8361338, 0, 0.854902, 1, 1,
0.08757028, -0.3736801, 1.786309, 0, 0.8509804, 1, 1,
0.09058612, -2.33396, 4.415262, 0, 0.8431373, 1, 1,
0.09107348, -1.013193, 1.907423, 0, 0.8392157, 1, 1,
0.09163076, -1.755363, 2.347013, 0, 0.8313726, 1, 1,
0.09709623, -1.541267, 1.141983, 0, 0.827451, 1, 1,
0.09806204, -0.5307026, 4.087292, 0, 0.8196079, 1, 1,
0.1024196, 0.9628934, -1.025689, 0, 0.8156863, 1, 1,
0.1050267, -0.884111, 2.283234, 0, 0.8078431, 1, 1,
0.1054296, 0.8363947, -1.078004, 0, 0.8039216, 1, 1,
0.1140932, -1.553966, 4.841111, 0, 0.7960784, 1, 1,
0.1232132, 1.333456, -0.2386899, 0, 0.7882353, 1, 1,
0.1266329, -0.7719288, 3.474864, 0, 0.7843137, 1, 1,
0.1293729, 0.6037427, -1.842973, 0, 0.7764706, 1, 1,
0.1294848, 0.801339, 1.825338, 0, 0.772549, 1, 1,
0.1323168, -0.02967014, 3.049073, 0, 0.7647059, 1, 1,
0.1328948, 0.5202004, 1.237864, 0, 0.7607843, 1, 1,
0.1345371, -1.56991, 2.855313, 0, 0.7529412, 1, 1,
0.1349851, 0.9475499, 0.6607966, 0, 0.7490196, 1, 1,
0.1400226, 1.398589, 2.57116, 0, 0.7411765, 1, 1,
0.1402749, -0.5730673, 4.676754, 0, 0.7372549, 1, 1,
0.1419318, -0.1006702, 0.4216439, 0, 0.7294118, 1, 1,
0.1421798, -0.4315404, 3.863779, 0, 0.7254902, 1, 1,
0.1457226, 0.1643594, 3.412468, 0, 0.7176471, 1, 1,
0.145873, 0.004952503, 3.397595, 0, 0.7137255, 1, 1,
0.1497949, 1.247603, -0.4203626, 0, 0.7058824, 1, 1,
0.1511384, -1.053005, 2.974502, 0, 0.6980392, 1, 1,
0.1522744, -0.3598248, 2.088349, 0, 0.6941177, 1, 1,
0.1546502, -0.5552895, 3.517935, 0, 0.6862745, 1, 1,
0.1599832, -1.562321, 2.286822, 0, 0.682353, 1, 1,
0.1677102, 0.3325368, 0.1010438, 0, 0.6745098, 1, 1,
0.1699215, 1.49492, -0.6040315, 0, 0.6705883, 1, 1,
0.1744193, -0.7461346, 3.093207, 0, 0.6627451, 1, 1,
0.1748882, 1.70541, -0.6538015, 0, 0.6588235, 1, 1,
0.1756403, 1.114327, -0.3652738, 0, 0.6509804, 1, 1,
0.1767895, 1.765997, -0.1694882, 0, 0.6470588, 1, 1,
0.1780732, -0.9219005, 3.505065, 0, 0.6392157, 1, 1,
0.183103, 0.707396, -0.04921117, 0, 0.6352941, 1, 1,
0.1872638, -1.661803, 3.481045, 0, 0.627451, 1, 1,
0.1873475, 1.491719, 0.7549854, 0, 0.6235294, 1, 1,
0.1892815, 0.3873523, -0.4697621, 0, 0.6156863, 1, 1,
0.1898466, 0.1859882, 0.3721232, 0, 0.6117647, 1, 1,
0.1907504, -0.8385089, 3.824436, 0, 0.6039216, 1, 1,
0.1915179, 0.71861, 2.656554, 0, 0.5960785, 1, 1,
0.1930974, -0.6498185, 4.578576, 0, 0.5921569, 1, 1,
0.1954907, 0.1935386, -0.06048218, 0, 0.5843138, 1, 1,
0.1973391, -0.5674322, 2.85062, 0, 0.5803922, 1, 1,
0.1977476, -0.1840103, 3.789014, 0, 0.572549, 1, 1,
0.2021763, 0.172994, 2.214807, 0, 0.5686275, 1, 1,
0.2055087, -0.5768901, 3.587086, 0, 0.5607843, 1, 1,
0.2117438, 0.7431998, -0.4920204, 0, 0.5568628, 1, 1,
0.2118935, -0.8194709, 4.248307, 0, 0.5490196, 1, 1,
0.2127032, -0.246135, 1.462087, 0, 0.5450981, 1, 1,
0.2132516, -1.510104, 1.932081, 0, 0.5372549, 1, 1,
0.2174172, -1.330444, 2.90146, 0, 0.5333334, 1, 1,
0.2186851, -0.5746367, 3.932462, 0, 0.5254902, 1, 1,
0.22039, 0.3582191, 1.204506, 0, 0.5215687, 1, 1,
0.2255122, -1.472594, 3.482623, 0, 0.5137255, 1, 1,
0.2273849, 1.501472, 0.1352887, 0, 0.509804, 1, 1,
0.2308237, 0.6736429, 0.9539708, 0, 0.5019608, 1, 1,
0.2327487, -1.513357, 4.428699, 0, 0.4941176, 1, 1,
0.2344301, 1.000483, -0.2372115, 0, 0.4901961, 1, 1,
0.2378086, 2.095993, -2.302622, 0, 0.4823529, 1, 1,
0.2386399, 0.906595, -0.04955235, 0, 0.4784314, 1, 1,
0.2398932, 0.02235902, 1.840048, 0, 0.4705882, 1, 1,
0.2401513, -0.2152765, 2.865406, 0, 0.4666667, 1, 1,
0.2416022, 0.196168, 3.682185, 0, 0.4588235, 1, 1,
0.244709, 0.4334322, 0.6032066, 0, 0.454902, 1, 1,
0.2464907, -1.902834, 2.678791, 0, 0.4470588, 1, 1,
0.2481299, -0.7351994, 2.397635, 0, 0.4431373, 1, 1,
0.2489079, -1.697675, 5.737211, 0, 0.4352941, 1, 1,
0.2506661, 0.04524477, 3.253772, 0, 0.4313726, 1, 1,
0.2527817, 0.2402123, 1.283312, 0, 0.4235294, 1, 1,
0.2598133, -0.1982211, 1.151865, 0, 0.4196078, 1, 1,
0.265991, 1.170169, 0.6007074, 0, 0.4117647, 1, 1,
0.2698591, 0.7631379, 2.938656, 0, 0.4078431, 1, 1,
0.2721854, -0.387797, 3.586556, 0, 0.4, 1, 1,
0.2739666, -0.7068246, 2.833385, 0, 0.3921569, 1, 1,
0.2756328, -1.493013, 4.63513, 0, 0.3882353, 1, 1,
0.2765088, -0.2169671, 1.921263, 0, 0.3803922, 1, 1,
0.2767598, 0.1165481, 1.961362, 0, 0.3764706, 1, 1,
0.2841841, 0.2096006, 1.444158, 0, 0.3686275, 1, 1,
0.2903509, 2.349504, 2.195002, 0, 0.3647059, 1, 1,
0.291043, -1.158959, 3.359091, 0, 0.3568628, 1, 1,
0.2921387, -1.247728, 2.840689, 0, 0.3529412, 1, 1,
0.2934161, -1.416341, 3.778284, 0, 0.345098, 1, 1,
0.293691, -0.7877288, 3.818929, 0, 0.3411765, 1, 1,
0.294372, -1.028136, 4.225617, 0, 0.3333333, 1, 1,
0.2968313, 1.094797, 0.1642274, 0, 0.3294118, 1, 1,
0.2980226, -1.119031, 1.544518, 0, 0.3215686, 1, 1,
0.3039643, 0.234425, 1.903534, 0, 0.3176471, 1, 1,
0.3072795, 1.011364, -0.9378409, 0, 0.3098039, 1, 1,
0.309044, -0.07964432, 3.557011, 0, 0.3058824, 1, 1,
0.3092338, -0.9133674, 1.346365, 0, 0.2980392, 1, 1,
0.3100733, 0.1742046, 0.8959379, 0, 0.2901961, 1, 1,
0.3101211, -2.358227, 3.763647, 0, 0.2862745, 1, 1,
0.3103898, 0.1760706, 1.282568, 0, 0.2784314, 1, 1,
0.3118819, 0.3609787, 1.566455, 0, 0.2745098, 1, 1,
0.3137921, -0.861936, 4.104396, 0, 0.2666667, 1, 1,
0.3157011, -0.3201116, 3.596683, 0, 0.2627451, 1, 1,
0.3193285, 0.6853389, 3.028363, 0, 0.254902, 1, 1,
0.3269943, 0.5149654, -0.7895394, 0, 0.2509804, 1, 1,
0.3345156, 1.415758, 0.8483148, 0, 0.2431373, 1, 1,
0.3360885, 1.001768, 2.389708, 0, 0.2392157, 1, 1,
0.340727, -0.1465166, 1.966658, 0, 0.2313726, 1, 1,
0.3410091, -1.122145, 1.915992, 0, 0.227451, 1, 1,
0.3428554, 0.1166717, 0.9355152, 0, 0.2196078, 1, 1,
0.3436656, 1.793294, 1.055732, 0, 0.2156863, 1, 1,
0.3446045, 0.8395998, 0.8361425, 0, 0.2078431, 1, 1,
0.3476406, -0.2682346, 2.22775, 0, 0.2039216, 1, 1,
0.3480975, 0.9230573, 0.457526, 0, 0.1960784, 1, 1,
0.351052, -0.2774672, 1.331767, 0, 0.1882353, 1, 1,
0.3604794, 0.8289323, 0.1698552, 0, 0.1843137, 1, 1,
0.3613071, 0.2849507, 0.6985932, 0, 0.1764706, 1, 1,
0.362092, -0.9209966, 2.502153, 0, 0.172549, 1, 1,
0.3641575, -0.07331919, 1.278898, 0, 0.1647059, 1, 1,
0.3663804, 0.6646442, -1.200884, 0, 0.1607843, 1, 1,
0.3713525, 1.946451, -0.3547845, 0, 0.1529412, 1, 1,
0.3716901, 1.016868, 0.3925827, 0, 0.1490196, 1, 1,
0.3729171, 0.9618914, 0.2869402, 0, 0.1411765, 1, 1,
0.3741602, -0.2370013, 3.093151, 0, 0.1372549, 1, 1,
0.3771346, 1.976239, -0.3929287, 0, 0.1294118, 1, 1,
0.38105, 0.9131573, -0.7247341, 0, 0.1254902, 1, 1,
0.3870422, -0.3894526, 1.891884, 0, 0.1176471, 1, 1,
0.3874814, 0.5513872, 0.4373768, 0, 0.1137255, 1, 1,
0.3942471, -0.6329563, 3.643767, 0, 0.1058824, 1, 1,
0.396884, 0.4636162, 1.0999, 0, 0.09803922, 1, 1,
0.4026256, -0.8297682, 3.031918, 0, 0.09411765, 1, 1,
0.405775, 0.9502968, 0.6759946, 0, 0.08627451, 1, 1,
0.4066229, -1.297132, 2.256809, 0, 0.08235294, 1, 1,
0.4078179, -1.103034, 2.977593, 0, 0.07450981, 1, 1,
0.4107082, -0.2625075, 1.423627, 0, 0.07058824, 1, 1,
0.4141288, -1.036411, 2.181134, 0, 0.0627451, 1, 1,
0.4215479, -0.4553112, 2.082033, 0, 0.05882353, 1, 1,
0.4236818, -1.16006, 1.964057, 0, 0.05098039, 1, 1,
0.4278077, 0.4878253, 3.465104, 0, 0.04705882, 1, 1,
0.4280663, -1.500683, 2.520511, 0, 0.03921569, 1, 1,
0.4282166, 1.87267, 0.543981, 0, 0.03529412, 1, 1,
0.4325357, 0.6681488, -0.138751, 0, 0.02745098, 1, 1,
0.4346371, -1.535681, 1.94907, 0, 0.02352941, 1, 1,
0.4346749, -0.5869483, 2.43468, 0, 0.01568628, 1, 1,
0.4347656, 0.2039755, 0.2458642, 0, 0.01176471, 1, 1,
0.4414372, 0.05625525, 1.848334, 0, 0.003921569, 1, 1,
0.4416671, 1.350562, 0.3983332, 0.003921569, 0, 1, 1,
0.4453756, 0.4605321, 0.4354513, 0.007843138, 0, 1, 1,
0.4480173, 0.4746805, 0.2913355, 0.01568628, 0, 1, 1,
0.4504326, -1.131948, 4.949366, 0.01960784, 0, 1, 1,
0.4528211, -0.3552314, 1.531646, 0.02745098, 0, 1, 1,
0.4554864, -0.05411591, 3.718663, 0.03137255, 0, 1, 1,
0.4556604, 0.3910512, 0.6536916, 0.03921569, 0, 1, 1,
0.4622878, -0.6226447, 1.286389, 0.04313726, 0, 1, 1,
0.4649476, 0.3544852, 2.490645, 0.05098039, 0, 1, 1,
0.4692462, 0.5009053, 0.1785678, 0.05490196, 0, 1, 1,
0.4740248, 0.5288046, 0.5505097, 0.0627451, 0, 1, 1,
0.4751133, -0.1683656, -0.07697036, 0.06666667, 0, 1, 1,
0.4771232, 0.1312806, 0.3023176, 0.07450981, 0, 1, 1,
0.4816945, 0.2620631, 0.4203105, 0.07843138, 0, 1, 1,
0.4819443, -1.635344, 3.380679, 0.08627451, 0, 1, 1,
0.4846818, -0.3140236, 0.9215469, 0.09019608, 0, 1, 1,
0.4865127, -0.9637294, 2.413641, 0.09803922, 0, 1, 1,
0.4877644, 0.2905108, 0.4053053, 0.1058824, 0, 1, 1,
0.4908348, 0.03099706, 1.191182, 0.1098039, 0, 1, 1,
0.4926124, -1.482355, 2.035231, 0.1176471, 0, 1, 1,
0.5032105, 0.4276575, 0.7356327, 0.1215686, 0, 1, 1,
0.5046452, -0.6559411, 0.7903152, 0.1294118, 0, 1, 1,
0.5059806, 1.341329, 0.07024033, 0.1333333, 0, 1, 1,
0.5066802, -1.08891, 0.8305165, 0.1411765, 0, 1, 1,
0.5081366, -1.242271, 1.681547, 0.145098, 0, 1, 1,
0.5087197, -0.3459185, 1.28853, 0.1529412, 0, 1, 1,
0.5113124, -0.2127625, 2.307341, 0.1568628, 0, 1, 1,
0.5149522, -0.9565009, 2.893321, 0.1647059, 0, 1, 1,
0.517804, -0.7843208, 2.971313, 0.1686275, 0, 1, 1,
0.517942, -1.111709, 1.672646, 0.1764706, 0, 1, 1,
0.5179995, 0.6845711, 1.01783, 0.1803922, 0, 1, 1,
0.521525, 0.971242, 1.002405, 0.1882353, 0, 1, 1,
0.5222931, -0.8315607, 2.110241, 0.1921569, 0, 1, 1,
0.5249, -0.1834239, 2.255112, 0.2, 0, 1, 1,
0.529285, 0.2189772, 2.14478, 0.2078431, 0, 1, 1,
0.5313547, -1.672278, 4.015644, 0.2117647, 0, 1, 1,
0.5352507, 0.9972615, 1.05288, 0.2196078, 0, 1, 1,
0.5372337, -0.6057372, 1.265096, 0.2235294, 0, 1, 1,
0.5531291, 0.6856186, -0.1376824, 0.2313726, 0, 1, 1,
0.5567625, -1.485481, 1.51696, 0.2352941, 0, 1, 1,
0.5610692, -0.05557023, 0.9888808, 0.2431373, 0, 1, 1,
0.5688218, -0.1515381, 1.291389, 0.2470588, 0, 1, 1,
0.572185, -1.015847, 4.635221, 0.254902, 0, 1, 1,
0.580301, 0.3490343, 0.8000233, 0.2588235, 0, 1, 1,
0.5825497, -0.9901034, 2.535266, 0.2666667, 0, 1, 1,
0.5874152, 1.463886, -0.01985958, 0.2705882, 0, 1, 1,
0.5875011, -0.5256805, 2.256059, 0.2784314, 0, 1, 1,
0.5944711, 0.7514465, -0.3939022, 0.282353, 0, 1, 1,
0.600868, 0.5729959, -0.0861256, 0.2901961, 0, 1, 1,
0.6016341, -0.3956591, 1.365899, 0.2941177, 0, 1, 1,
0.6026384, 1.08605, -0.8657956, 0.3019608, 0, 1, 1,
0.6027179, 1.484457, 1.298261, 0.3098039, 0, 1, 1,
0.6039056, 0.9484843, 0.03462392, 0.3137255, 0, 1, 1,
0.606827, -0.775023, 3.326494, 0.3215686, 0, 1, 1,
0.6103415, -0.1406328, 0.6098303, 0.3254902, 0, 1, 1,
0.6105248, -1.129508, 2.788819, 0.3333333, 0, 1, 1,
0.6106603, 0.1762161, 1.489801, 0.3372549, 0, 1, 1,
0.6116818, 1.122655, -1.636541, 0.345098, 0, 1, 1,
0.61336, -1.360914, 2.451979, 0.3490196, 0, 1, 1,
0.6148234, -0.1435619, 2.460011, 0.3568628, 0, 1, 1,
0.6185298, 0.534964, 2.180619, 0.3607843, 0, 1, 1,
0.6228738, -0.6691111, 3.183063, 0.3686275, 0, 1, 1,
0.6294523, -0.3115084, 1.281866, 0.372549, 0, 1, 1,
0.6297359, -1.105564, 1.260542, 0.3803922, 0, 1, 1,
0.6357997, -0.9706497, 2.998781, 0.3843137, 0, 1, 1,
0.636997, -1.08046, 2.061643, 0.3921569, 0, 1, 1,
0.6419036, -1.189181, 2.841386, 0.3960784, 0, 1, 1,
0.6431378, -0.1557643, 1.272806, 0.4039216, 0, 1, 1,
0.645752, 0.2089387, 1.276861, 0.4117647, 0, 1, 1,
0.6508352, 0.8418051, 0.8091512, 0.4156863, 0, 1, 1,
0.6519637, -0.8682531, 3.098294, 0.4235294, 0, 1, 1,
0.6603875, 0.9646766, -0.1479362, 0.427451, 0, 1, 1,
0.6621812, 1.227276, 1.930441, 0.4352941, 0, 1, 1,
0.6627111, -1.294106, 4.033917, 0.4392157, 0, 1, 1,
0.6711214, 0.9049811, 0.9501395, 0.4470588, 0, 1, 1,
0.6730683, -0.5641592, 2.185039, 0.4509804, 0, 1, 1,
0.6780318, -0.3284132, 2.364357, 0.4588235, 0, 1, 1,
0.6782345, -0.0350245, 1.023393, 0.4627451, 0, 1, 1,
0.6787925, 0.3616221, 0.231693, 0.4705882, 0, 1, 1,
0.6837522, -1.801064, 1.506786, 0.4745098, 0, 1, 1,
0.6839432, -0.814325, 2.890321, 0.4823529, 0, 1, 1,
0.689042, 0.8518966, 0.8083062, 0.4862745, 0, 1, 1,
0.6932502, -0.9163931, 3.603778, 0.4941176, 0, 1, 1,
0.6991469, -1.86081, 2.207808, 0.5019608, 0, 1, 1,
0.6997323, 0.3028127, 1.987594, 0.5058824, 0, 1, 1,
0.7019252, -2.022764, 2.389383, 0.5137255, 0, 1, 1,
0.7046993, 0.1469484, 1.770128, 0.5176471, 0, 1, 1,
0.7066828, 0.1446084, 0.9489461, 0.5254902, 0, 1, 1,
0.7073847, -1.087585, 3.32798, 0.5294118, 0, 1, 1,
0.7185992, -1.91957, 3.014435, 0.5372549, 0, 1, 1,
0.7246703, -0.191062, 1.890236, 0.5411765, 0, 1, 1,
0.7272976, 1.325876, -0.2757923, 0.5490196, 0, 1, 1,
0.7283643, 0.8960652, 0.7379059, 0.5529412, 0, 1, 1,
0.7320684, -0.6065567, 1.627709, 0.5607843, 0, 1, 1,
0.7328736, 0.1060491, 1.811181, 0.5647059, 0, 1, 1,
0.7353364, 0.8203312, 2.241423, 0.572549, 0, 1, 1,
0.7397166, -0.2439569, 2.689979, 0.5764706, 0, 1, 1,
0.7440608, 0.350984, -0.02019092, 0.5843138, 0, 1, 1,
0.7458438, -0.2582704, 2.763904, 0.5882353, 0, 1, 1,
0.7467206, 1.268723, -0.476242, 0.5960785, 0, 1, 1,
0.7472355, 0.3422381, 0.8313644, 0.6039216, 0, 1, 1,
0.7478013, -0.08420148, 2.863595, 0.6078432, 0, 1, 1,
0.747815, 1.063558, -0.08759297, 0.6156863, 0, 1, 1,
0.7533814, 2.16676, 0.3673127, 0.6196079, 0, 1, 1,
0.765137, 0.4374745, -0.06700412, 0.627451, 0, 1, 1,
0.7658799, 0.04848948, 0.7660977, 0.6313726, 0, 1, 1,
0.7745112, -0.4247287, 2.488091, 0.6392157, 0, 1, 1,
0.7753502, -2.443385, 2.832649, 0.6431373, 0, 1, 1,
0.780531, -2.582683, 2.314456, 0.6509804, 0, 1, 1,
0.7880474, 0.2402511, 1.273939, 0.654902, 0, 1, 1,
0.7972967, -1.396725, 0.5787107, 0.6627451, 0, 1, 1,
0.8018357, -0.5585427, 2.953709, 0.6666667, 0, 1, 1,
0.8047646, 1.740453, -1.123385, 0.6745098, 0, 1, 1,
0.810483, 1.350558, 1.853207, 0.6784314, 0, 1, 1,
0.8175218, -0.9754429, 1.947399, 0.6862745, 0, 1, 1,
0.8237193, -0.4475467, 2.338453, 0.6901961, 0, 1, 1,
0.8263191, 0.08059442, 2.148131, 0.6980392, 0, 1, 1,
0.8313895, -0.731199, 0.2747841, 0.7058824, 0, 1, 1,
0.8342267, -0.03173354, 1.094889, 0.7098039, 0, 1, 1,
0.8347782, -1.574074, 2.475225, 0.7176471, 0, 1, 1,
0.8361588, 0.6815333, 1.274319, 0.7215686, 0, 1, 1,
0.842401, 0.1133216, 1.783221, 0.7294118, 0, 1, 1,
0.8441943, -0.9801834, 1.5884, 0.7333333, 0, 1, 1,
0.8444371, -0.8245469, 2.532087, 0.7411765, 0, 1, 1,
0.8479902, -2.004617, 3.245698, 0.7450981, 0, 1, 1,
0.8514385, -0.04400371, 1.571215, 0.7529412, 0, 1, 1,
0.8539777, -0.3140715, 2.876409, 0.7568628, 0, 1, 1,
0.8558122, 1.053065, -0.2541851, 0.7647059, 0, 1, 1,
0.8567897, -0.4574093, 0.4548635, 0.7686275, 0, 1, 1,
0.8578281, -0.4035992, 3.282961, 0.7764706, 0, 1, 1,
0.8579361, 0.6436762, 0.4920998, 0.7803922, 0, 1, 1,
0.8594916, 0.7319103, -0.5865211, 0.7882353, 0, 1, 1,
0.8615908, 0.6372918, 1.226253, 0.7921569, 0, 1, 1,
0.8653248, 0.6467581, 0.1040578, 0.8, 0, 1, 1,
0.8661987, -0.9396753, 1.492207, 0.8078431, 0, 1, 1,
0.8662448, 0.230095, 2.071258, 0.8117647, 0, 1, 1,
0.8694473, 0.73549, -0.9736403, 0.8196079, 0, 1, 1,
0.87256, 0.5410025, 0.8964531, 0.8235294, 0, 1, 1,
0.8817381, 1.082297, 0.265225, 0.8313726, 0, 1, 1,
0.8869944, -1.218023, 0.553974, 0.8352941, 0, 1, 1,
0.8888284, 1.038717, 1.261514, 0.8431373, 0, 1, 1,
0.8934551, -1.658408, 2.180501, 0.8470588, 0, 1, 1,
0.8961053, -0.4467078, 1.562925, 0.854902, 0, 1, 1,
0.8980358, 0.07541826, 0.1372775, 0.8588235, 0, 1, 1,
0.899606, -1.16455, 1.994539, 0.8666667, 0, 1, 1,
0.900135, -0.16965, 2.211452, 0.8705882, 0, 1, 1,
0.9047367, -0.4898093, 3.230659, 0.8784314, 0, 1, 1,
0.9126393, -0.6385075, 2.18245, 0.8823529, 0, 1, 1,
0.9132969, -0.5509776, 0.8552189, 0.8901961, 0, 1, 1,
0.9160652, 0.3955023, 1.977984, 0.8941177, 0, 1, 1,
0.9171227, 0.8350465, 1.375232, 0.9019608, 0, 1, 1,
0.9175744, 0.3212332, 1.12281, 0.9098039, 0, 1, 1,
0.9204856, -1.689396, 1.736522, 0.9137255, 0, 1, 1,
0.9208755, 0.3129058, 1.613858, 0.9215686, 0, 1, 1,
0.921799, -0.756118, 3.333563, 0.9254902, 0, 1, 1,
0.9285511, -0.3771566, 2.244274, 0.9333333, 0, 1, 1,
0.9330668, 0.9886451, 1.198841, 0.9372549, 0, 1, 1,
0.933374, 0.03173149, 0.9044164, 0.945098, 0, 1, 1,
0.9338964, 0.8748291, -1.644313e-05, 0.9490196, 0, 1, 1,
0.9360999, -0.9667149, 2.447295, 0.9568627, 0, 1, 1,
0.939127, -0.4107273, 2.695851, 0.9607843, 0, 1, 1,
0.9473279, -0.1385001, 0.2814442, 0.9686275, 0, 1, 1,
0.9522967, -0.05395014, 1.628159, 0.972549, 0, 1, 1,
0.9537649, -0.05704845, 3.015052, 0.9803922, 0, 1, 1,
0.9542076, -0.09042384, 1.212016, 0.9843137, 0, 1, 1,
0.9727753, -2.276649, 3.444346, 0.9921569, 0, 1, 1,
0.9789193, 1.113296, -0.3666684, 0.9960784, 0, 1, 1,
0.9813961, 0.1329738, 2.186042, 1, 0, 0.9960784, 1,
1.001082, 1.798781, 0.2212611, 1, 0, 0.9882353, 1,
1.004789, -0.9050527, 3.060851, 1, 0, 0.9843137, 1,
1.009211, -1.875585, 2.508426, 1, 0, 0.9764706, 1,
1.014865, 0.02728597, 1.189671, 1, 0, 0.972549, 1,
1.016434, -0.5027804, 0.1237414, 1, 0, 0.9647059, 1,
1.017008, -1.228203, 4.288747, 1, 0, 0.9607843, 1,
1.021599, -0.2830122, 2.644404, 1, 0, 0.9529412, 1,
1.025765, -0.6129175, 1.531325, 1, 0, 0.9490196, 1,
1.032621, 0.3038739, 2.08932, 1, 0, 0.9411765, 1,
1.040576, 0.1576522, 1.701514, 1, 0, 0.9372549, 1,
1.044637, 0.05753898, 2.575681, 1, 0, 0.9294118, 1,
1.054777, 1.525792, 0.6720781, 1, 0, 0.9254902, 1,
1.057642, 0.226843, 1.8812, 1, 0, 0.9176471, 1,
1.059887, -0.6815522, 1.273659, 1, 0, 0.9137255, 1,
1.061527, 0.1889943, 3.00776, 1, 0, 0.9058824, 1,
1.069348, 0.1492095, 4.246934, 1, 0, 0.9019608, 1,
1.069834, 2.843238, 0.8815683, 1, 0, 0.8941177, 1,
1.069863, -0.9276746, 0.7868921, 1, 0, 0.8862745, 1,
1.073663, 2.10365, -0.5263472, 1, 0, 0.8823529, 1,
1.074872, 2.628678, 0.1239513, 1, 0, 0.8745098, 1,
1.077379, 0.4752631, 1.156972, 1, 0, 0.8705882, 1,
1.083638, 1.873932, 1.21816, 1, 0, 0.8627451, 1,
1.085322, 1.594903, 2.397984, 1, 0, 0.8588235, 1,
1.087875, 0.7278028, 2.088161, 1, 0, 0.8509804, 1,
1.091343, 1.26897, 0.6468361, 1, 0, 0.8470588, 1,
1.095028, 0.4602029, 0.1274701, 1, 0, 0.8392157, 1,
1.095083, -0.9489218, 1.226392, 1, 0, 0.8352941, 1,
1.095127, 0.2876713, 1.5473, 1, 0, 0.827451, 1,
1.099602, -0.2795971, 2.405054, 1, 0, 0.8235294, 1,
1.100677, -0.7845638, 0.8073485, 1, 0, 0.8156863, 1,
1.101689, -1.062215, 1.365772, 1, 0, 0.8117647, 1,
1.113263, -0.0658301, 1.731427, 1, 0, 0.8039216, 1,
1.124159, 0.6079129, 2.421259, 1, 0, 0.7960784, 1,
1.127514, 1.542656, 0.7918022, 1, 0, 0.7921569, 1,
1.128461, -0.8528202, 1.750092, 1, 0, 0.7843137, 1,
1.131566, 1.18609, -0.6596015, 1, 0, 0.7803922, 1,
1.135548, -1.444029, 3.22192, 1, 0, 0.772549, 1,
1.136116, 1.438234, 0.7188445, 1, 0, 0.7686275, 1,
1.139191, 0.5107354, 1.6477, 1, 0, 0.7607843, 1,
1.149164, -0.478577, 2.461359, 1, 0, 0.7568628, 1,
1.156857, -1.240988, -0.549452, 1, 0, 0.7490196, 1,
1.159569, -1.446686, 2.936192, 1, 0, 0.7450981, 1,
1.162243, -2.479575, 1.161032, 1, 0, 0.7372549, 1,
1.166318, -0.3483098, 3.103657, 1, 0, 0.7333333, 1,
1.169515, -1.085917, 3.130935, 1, 0, 0.7254902, 1,
1.175352, -1.171677, 2.185533, 1, 0, 0.7215686, 1,
1.178554, 1.044098, 1.554933, 1, 0, 0.7137255, 1,
1.180674, 0.869927, 2.033504, 1, 0, 0.7098039, 1,
1.180689, -1.859262, 1.268694, 1, 0, 0.7019608, 1,
1.182471, 1.051723, 0.1444448, 1, 0, 0.6941177, 1,
1.184453, -0.4674432, 2.247516, 1, 0, 0.6901961, 1,
1.185073, 0.01717542, 1.787032, 1, 0, 0.682353, 1,
1.185245, -1.377273, -0.2215248, 1, 0, 0.6784314, 1,
1.194576, -1.839035, 2.685447, 1, 0, 0.6705883, 1,
1.195121, 1.344061, 3.466059, 1, 0, 0.6666667, 1,
1.201444, 0.3774502, 1.121996, 1, 0, 0.6588235, 1,
1.202725, 2.539593, 0.1269913, 1, 0, 0.654902, 1,
1.209951, 0.275334, 1.489697, 1, 0, 0.6470588, 1,
1.211927, 1.067876, 1.109416, 1, 0, 0.6431373, 1,
1.219289, 0.9994351, -0.5651807, 1, 0, 0.6352941, 1,
1.231256, -0.443633, 3.524383, 1, 0, 0.6313726, 1,
1.241011, -1.16082, 1.058095, 1, 0, 0.6235294, 1,
1.246582, 1.120704, -0.1667967, 1, 0, 0.6196079, 1,
1.247967, -0.1119783, 0.7395037, 1, 0, 0.6117647, 1,
1.24928, -0.8693842, 3.637378, 1, 0, 0.6078432, 1,
1.254453, -1.249371, 2.788558, 1, 0, 0.6, 1,
1.256999, -1.926197, 4.296672, 1, 0, 0.5921569, 1,
1.268836, 0.2979626, 0.5859464, 1, 0, 0.5882353, 1,
1.271218, -1.624297, 4.875863, 1, 0, 0.5803922, 1,
1.271735, -0.7058969, 2.16021, 1, 0, 0.5764706, 1,
1.272946, 0.3484329, 2.821757, 1, 0, 0.5686275, 1,
1.27379, -1.023679, 4.031885, 1, 0, 0.5647059, 1,
1.283774, -1.278518, 2.205351, 1, 0, 0.5568628, 1,
1.283792, -1.577215, 3.577779, 1, 0, 0.5529412, 1,
1.29104, -0.8207411, -0.1106823, 1, 0, 0.5450981, 1,
1.291337, -0.5251378, 1.498993, 1, 0, 0.5411765, 1,
1.294031, -2.671743, 0.6487269, 1, 0, 0.5333334, 1,
1.300582, 0.1464808, 1.041148, 1, 0, 0.5294118, 1,
1.305045, -2.742479, 3.387665, 1, 0, 0.5215687, 1,
1.308481, -0.1681378, 2.905697, 1, 0, 0.5176471, 1,
1.310797, -0.0871831, 2.294312, 1, 0, 0.509804, 1,
1.31258, -0.303838, 1.057452, 1, 0, 0.5058824, 1,
1.322046, 1.035698, 1.966252, 1, 0, 0.4980392, 1,
1.325376, 0.4085599, 1.34766, 1, 0, 0.4901961, 1,
1.325818, 1.225576, 0.7647077, 1, 0, 0.4862745, 1,
1.340739, 1.275877, 0.4261923, 1, 0, 0.4784314, 1,
1.342774, -0.09740005, 0.695484, 1, 0, 0.4745098, 1,
1.349149, 1.259774, 1.390386, 1, 0, 0.4666667, 1,
1.35261, -1.823045, 1.718892, 1, 0, 0.4627451, 1,
1.362391, -1.354797, 2.47649, 1, 0, 0.454902, 1,
1.365109, 1.96727, 1.654367, 1, 0, 0.4509804, 1,
1.365699, -0.5631512, -0.02688727, 1, 0, 0.4431373, 1,
1.373801, 2.242115, -0.3689679, 1, 0, 0.4392157, 1,
1.374981, 1.083903, -1.39905, 1, 0, 0.4313726, 1,
1.380316, 0.2845166, 0.4873882, 1, 0, 0.427451, 1,
1.38822, -0.9542207, 0.177688, 1, 0, 0.4196078, 1,
1.392255, 1.871774, -0.45367, 1, 0, 0.4156863, 1,
1.395133, 0.7109788, 1.504503, 1, 0, 0.4078431, 1,
1.403026, -0.07830351, 0.5760683, 1, 0, 0.4039216, 1,
1.411674, -0.5559208, 1.681594, 1, 0, 0.3960784, 1,
1.447671, -0.1295928, 3.17788, 1, 0, 0.3882353, 1,
1.466253, 0.1728644, -0.5348224, 1, 0, 0.3843137, 1,
1.468016, -0.2461979, 2.44853, 1, 0, 0.3764706, 1,
1.47074, 1.413799, 0.5325614, 1, 0, 0.372549, 1,
1.473186, -0.4408103, 2.771041, 1, 0, 0.3647059, 1,
1.481687, -0.3843147, 2.530288, 1, 0, 0.3607843, 1,
1.483116, -0.5275372, 2.710688, 1, 0, 0.3529412, 1,
1.500716, 0.4703327, 1.969671, 1, 0, 0.3490196, 1,
1.506933, -1.234255, 1.574637, 1, 0, 0.3411765, 1,
1.507113, -0.1121365, 2.380485, 1, 0, 0.3372549, 1,
1.55757, -0.7713694, 1.737693, 1, 0, 0.3294118, 1,
1.580602, -0.1553024, 1.480014, 1, 0, 0.3254902, 1,
1.587693, 0.01454112, 1.669518, 1, 0, 0.3176471, 1,
1.588875, 0.2089402, 1.575968, 1, 0, 0.3137255, 1,
1.591368, 0.4793192, 0.2300635, 1, 0, 0.3058824, 1,
1.598159, 1.788281, 0.7820055, 1, 0, 0.2980392, 1,
1.599835, -0.771104, 2.026575, 1, 0, 0.2941177, 1,
1.622326, -0.8448023, 0.3853409, 1, 0, 0.2862745, 1,
1.632962, -0.1466032, 2.250959, 1, 0, 0.282353, 1,
1.636156, 0.4923681, 2.389803, 1, 0, 0.2745098, 1,
1.671592, 1.056923, 2.099198, 1, 0, 0.2705882, 1,
1.680967, -1.290982, 1.961687, 1, 0, 0.2627451, 1,
1.682632, -0.3327393, 2.557217, 1, 0, 0.2588235, 1,
1.685126, -1.753137, 3.059021, 1, 0, 0.2509804, 1,
1.699974, 0.6100502, 2.464818, 1, 0, 0.2470588, 1,
1.708289, -0.126155, 1.932433, 1, 0, 0.2392157, 1,
1.737029, -0.1515467, 0.7681601, 1, 0, 0.2352941, 1,
1.745814, -1.790956, 1.457375, 1, 0, 0.227451, 1,
1.754722, 0.351256, 2.485402, 1, 0, 0.2235294, 1,
1.790629, 0.9937876, 2.866822, 1, 0, 0.2156863, 1,
1.809306, -0.9020879, 1.859133, 1, 0, 0.2117647, 1,
1.809525, 0.3554794, 2.150703, 1, 0, 0.2039216, 1,
1.811504, -0.3318461, 2.249807, 1, 0, 0.1960784, 1,
1.814043, -0.3917909, 2.708815, 1, 0, 0.1921569, 1,
1.829809, -0.1809765, 1.413561, 1, 0, 0.1843137, 1,
1.862017, 0.7689466, 2.671968, 1, 0, 0.1803922, 1,
1.954807, -0.2800442, 1.824372, 1, 0, 0.172549, 1,
1.96575, 1.567549, 2.543777, 1, 0, 0.1686275, 1,
2.004687, -0.7113618, 1.378884, 1, 0, 0.1607843, 1,
2.058779, -0.9295693, 3.97566, 1, 0, 0.1568628, 1,
2.108494, -0.08942941, 1.790752, 1, 0, 0.1490196, 1,
2.127663, 0.6167031, 2.337373, 1, 0, 0.145098, 1,
2.127873, 0.09033213, 0.6224274, 1, 0, 0.1372549, 1,
2.132849, -1.239381, 3.116384, 1, 0, 0.1333333, 1,
2.178448, -0.005892684, 0.1791765, 1, 0, 0.1254902, 1,
2.189759, 1.178605, 2.53059, 1, 0, 0.1215686, 1,
2.195304, -0.1900661, 0.5152123, 1, 0, 0.1137255, 1,
2.244059, -0.5233138, 2.261924, 1, 0, 0.1098039, 1,
2.247148, -0.6637489, 0.2555667, 1, 0, 0.1019608, 1,
2.304826, 1.022422, 1.371711, 1, 0, 0.09411765, 1,
2.306617, 1.852871, 0.2927519, 1, 0, 0.09019608, 1,
2.313059, -0.5487518, 1.138763, 1, 0, 0.08235294, 1,
2.344221, 0.3271491, 0.3680446, 1, 0, 0.07843138, 1,
2.396328, 1.697073, -0.2129508, 1, 0, 0.07058824, 1,
2.473234, -0.01849514, 2.51144, 1, 0, 0.06666667, 1,
2.484134, 2.275157, 0.8880023, 1, 0, 0.05882353, 1,
2.499102, -0.5368117, 0.9846925, 1, 0, 0.05490196, 1,
2.502803, 1.029695, 1.801956, 1, 0, 0.04705882, 1,
2.616632, -1.279927, 1.697355, 1, 0, 0.04313726, 1,
2.631091, 1.296018, 0.8802742, 1, 0, 0.03529412, 1,
2.634404, 0.4555027, 1.527356, 1, 0, 0.03137255, 1,
2.651861, -0.1459066, 2.185443, 1, 0, 0.02352941, 1,
2.671055, 0.173886, 2.291203, 1, 0, 0.01960784, 1,
2.727535, 0.1684692, 1.275406, 1, 0, 0.01176471, 1,
2.84622, -0.04278923, 4.015206, 1, 0, 0.007843138, 1
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
-0.1806622, -3.745876, -8.114351, 0, -0.5, 0.5, 0.5,
-0.1806622, -3.745876, -8.114351, 1, -0.5, 0.5, 0.5,
-0.1806622, -3.745876, -8.114351, 1, 1.5, 0.5, 0.5,
-0.1806622, -3.745876, -8.114351, 0, 1.5, 0.5, 0.5
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
-4.233657, 0.2173944, -8.114351, 0, -0.5, 0.5, 0.5,
-4.233657, 0.2173944, -8.114351, 1, -0.5, 0.5, 0.5,
-4.233657, 0.2173944, -8.114351, 1, 1.5, 0.5, 0.5,
-4.233657, 0.2173944, -8.114351, 0, 1.5, 0.5, 0.5
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
-4.233657, -3.745876, -0.1847908, 0, -0.5, 0.5, 0.5,
-4.233657, -3.745876, -0.1847908, 1, -0.5, 0.5, 0.5,
-4.233657, -3.745876, -0.1847908, 1, 1.5, 0.5, 0.5,
-4.233657, -3.745876, -0.1847908, 0, 1.5, 0.5, 0.5
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
-3, -2.831275, -6.284453,
2, -2.831275, -6.284453,
-3, -2.831275, -6.284453,
-3, -2.983709, -6.589436,
-2, -2.831275, -6.284453,
-2, -2.983709, -6.589436,
-1, -2.831275, -6.284453,
-1, -2.983709, -6.589436,
0, -2.831275, -6.284453,
0, -2.983709, -6.589436,
1, -2.831275, -6.284453,
1, -2.983709, -6.589436,
2, -2.831275, -6.284453,
2, -2.983709, -6.589436
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
-3, -3.288575, -7.199402, 0, -0.5, 0.5, 0.5,
-3, -3.288575, -7.199402, 1, -0.5, 0.5, 0.5,
-3, -3.288575, -7.199402, 1, 1.5, 0.5, 0.5,
-3, -3.288575, -7.199402, 0, 1.5, 0.5, 0.5,
-2, -3.288575, -7.199402, 0, -0.5, 0.5, 0.5,
-2, -3.288575, -7.199402, 1, -0.5, 0.5, 0.5,
-2, -3.288575, -7.199402, 1, 1.5, 0.5, 0.5,
-2, -3.288575, -7.199402, 0, 1.5, 0.5, 0.5,
-1, -3.288575, -7.199402, 0, -0.5, 0.5, 0.5,
-1, -3.288575, -7.199402, 1, -0.5, 0.5, 0.5,
-1, -3.288575, -7.199402, 1, 1.5, 0.5, 0.5,
-1, -3.288575, -7.199402, 0, 1.5, 0.5, 0.5,
0, -3.288575, -7.199402, 0, -0.5, 0.5, 0.5,
0, -3.288575, -7.199402, 1, -0.5, 0.5, 0.5,
0, -3.288575, -7.199402, 1, 1.5, 0.5, 0.5,
0, -3.288575, -7.199402, 0, 1.5, 0.5, 0.5,
1, -3.288575, -7.199402, 0, -0.5, 0.5, 0.5,
1, -3.288575, -7.199402, 1, -0.5, 0.5, 0.5,
1, -3.288575, -7.199402, 1, 1.5, 0.5, 0.5,
1, -3.288575, -7.199402, 0, 1.5, 0.5, 0.5,
2, -3.288575, -7.199402, 0, -0.5, 0.5, 0.5,
2, -3.288575, -7.199402, 1, -0.5, 0.5, 0.5,
2, -3.288575, -7.199402, 1, 1.5, 0.5, 0.5,
2, -3.288575, -7.199402, 0, 1.5, 0.5, 0.5
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
-3.29835, -2, -6.284453,
-3.29835, 3, -6.284453,
-3.29835, -2, -6.284453,
-3.454235, -2, -6.589436,
-3.29835, -1, -6.284453,
-3.454235, -1, -6.589436,
-3.29835, 0, -6.284453,
-3.454235, 0, -6.589436,
-3.29835, 1, -6.284453,
-3.454235, 1, -6.589436,
-3.29835, 2, -6.284453,
-3.454235, 2, -6.589436,
-3.29835, 3, -6.284453,
-3.454235, 3, -6.589436
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
-3.766004, -2, -7.199402, 0, -0.5, 0.5, 0.5,
-3.766004, -2, -7.199402, 1, -0.5, 0.5, 0.5,
-3.766004, -2, -7.199402, 1, 1.5, 0.5, 0.5,
-3.766004, -2, -7.199402, 0, 1.5, 0.5, 0.5,
-3.766004, -1, -7.199402, 0, -0.5, 0.5, 0.5,
-3.766004, -1, -7.199402, 1, -0.5, 0.5, 0.5,
-3.766004, -1, -7.199402, 1, 1.5, 0.5, 0.5,
-3.766004, -1, -7.199402, 0, 1.5, 0.5, 0.5,
-3.766004, 0, -7.199402, 0, -0.5, 0.5, 0.5,
-3.766004, 0, -7.199402, 1, -0.5, 0.5, 0.5,
-3.766004, 0, -7.199402, 1, 1.5, 0.5, 0.5,
-3.766004, 0, -7.199402, 0, 1.5, 0.5, 0.5,
-3.766004, 1, -7.199402, 0, -0.5, 0.5, 0.5,
-3.766004, 1, -7.199402, 1, -0.5, 0.5, 0.5,
-3.766004, 1, -7.199402, 1, 1.5, 0.5, 0.5,
-3.766004, 1, -7.199402, 0, 1.5, 0.5, 0.5,
-3.766004, 2, -7.199402, 0, -0.5, 0.5, 0.5,
-3.766004, 2, -7.199402, 1, -0.5, 0.5, 0.5,
-3.766004, 2, -7.199402, 1, 1.5, 0.5, 0.5,
-3.766004, 2, -7.199402, 0, 1.5, 0.5, 0.5,
-3.766004, 3, -7.199402, 0, -0.5, 0.5, 0.5,
-3.766004, 3, -7.199402, 1, -0.5, 0.5, 0.5,
-3.766004, 3, -7.199402, 1, 1.5, 0.5, 0.5,
-3.766004, 3, -7.199402, 0, 1.5, 0.5, 0.5
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
-3.29835, -2.831275, -6,
-3.29835, -2.831275, 4,
-3.29835, -2.831275, -6,
-3.454235, -2.983709, -6,
-3.29835, -2.831275, -4,
-3.454235, -2.983709, -4,
-3.29835, -2.831275, -2,
-3.454235, -2.983709, -2,
-3.29835, -2.831275, 0,
-3.454235, -2.983709, 0,
-3.29835, -2.831275, 2,
-3.454235, -2.983709, 2,
-3.29835, -2.831275, 4,
-3.454235, -2.983709, 4
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
"-6",
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
-3.766004, -3.288575, -6, 0, -0.5, 0.5, 0.5,
-3.766004, -3.288575, -6, 1, -0.5, 0.5, 0.5,
-3.766004, -3.288575, -6, 1, 1.5, 0.5, 0.5,
-3.766004, -3.288575, -6, 0, 1.5, 0.5, 0.5,
-3.766004, -3.288575, -4, 0, -0.5, 0.5, 0.5,
-3.766004, -3.288575, -4, 1, -0.5, 0.5, 0.5,
-3.766004, -3.288575, -4, 1, 1.5, 0.5, 0.5,
-3.766004, -3.288575, -4, 0, 1.5, 0.5, 0.5,
-3.766004, -3.288575, -2, 0, -0.5, 0.5, 0.5,
-3.766004, -3.288575, -2, 1, -0.5, 0.5, 0.5,
-3.766004, -3.288575, -2, 1, 1.5, 0.5, 0.5,
-3.766004, -3.288575, -2, 0, 1.5, 0.5, 0.5,
-3.766004, -3.288575, 0, 0, -0.5, 0.5, 0.5,
-3.766004, -3.288575, 0, 1, -0.5, 0.5, 0.5,
-3.766004, -3.288575, 0, 1, 1.5, 0.5, 0.5,
-3.766004, -3.288575, 0, 0, 1.5, 0.5, 0.5,
-3.766004, -3.288575, 2, 0, -0.5, 0.5, 0.5,
-3.766004, -3.288575, 2, 1, -0.5, 0.5, 0.5,
-3.766004, -3.288575, 2, 1, 1.5, 0.5, 0.5,
-3.766004, -3.288575, 2, 0, 1.5, 0.5, 0.5,
-3.766004, -3.288575, 4, 0, -0.5, 0.5, 0.5,
-3.766004, -3.288575, 4, 1, -0.5, 0.5, 0.5,
-3.766004, -3.288575, 4, 1, 1.5, 0.5, 0.5,
-3.766004, -3.288575, 4, 0, 1.5, 0.5, 0.5
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
-3.29835, -2.831275, -6.284453,
-3.29835, 3.266064, -6.284453,
-3.29835, -2.831275, 5.914871,
-3.29835, 3.266064, 5.914871,
-3.29835, -2.831275, -6.284453,
-3.29835, -2.831275, 5.914871,
-3.29835, 3.266064, -6.284453,
-3.29835, 3.266064, 5.914871,
-3.29835, -2.831275, -6.284453,
2.937026, -2.831275, -6.284453,
-3.29835, -2.831275, 5.914871,
2.937026, -2.831275, 5.914871,
-3.29835, 3.266064, -6.284453,
2.937026, 3.266064, -6.284453,
-3.29835, 3.266064, 5.914871,
2.937026, 3.266064, 5.914871,
2.937026, -2.831275, -6.284453,
2.937026, 3.266064, -6.284453,
2.937026, -2.831275, 5.914871,
2.937026, 3.266064, 5.914871,
2.937026, -2.831275, -6.284453,
2.937026, -2.831275, 5.914871,
2.937026, 3.266064, -6.284453,
2.937026, 3.266064, 5.914871
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
var radius = 8.00759;
var distance = 35.62667;
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
mvMatrix.translate( 0.1806622, -0.2173944, 0.1847908 );
mvMatrix.scale( 1.388523, 1.419958, 0.7097084 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.62667);
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
oxadiargyl<-read.table("oxadiargyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxadiargyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
```

```r
y<-oxadiargyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
```

```r
z<-oxadiargyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
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
-3.207544, 0.5903038, -0.4003852, 0, 0, 1, 1, 1,
-3.118654, 1.587589, -1.703894, 1, 0, 0, 1, 1,
-3.051315, -1.863362, -1.975087, 1, 0, 0, 1, 1,
-3.028897, -1.765923, -1.497606, 1, 0, 0, 1, 1,
-2.999757, -0.7560288, -1.98353, 1, 0, 0, 1, 1,
-2.974281, -0.7602779, -1.275484, 1, 0, 0, 1, 1,
-2.672864, 0.8583277, -2.205015, 0, 0, 0, 1, 1,
-2.518254, 2.159742, -1.863483, 0, 0, 0, 1, 1,
-2.454982, -0.08372777, -1.826484, 0, 0, 0, 1, 1,
-2.448756, -0.6210697, -2.095083, 0, 0, 0, 1, 1,
-2.446214, 1.515169, -0.9361848, 0, 0, 0, 1, 1,
-2.345917, 1.198774, -2.395699, 0, 0, 0, 1, 1,
-2.304046, 0.8235582, -0.9372624, 0, 0, 0, 1, 1,
-2.283173, 0.6841757, -1.351593, 1, 1, 1, 1, 1,
-2.19112, 1.742745, -1.020047, 1, 1, 1, 1, 1,
-2.177891, -0.9425735, -2.928596, 1, 1, 1, 1, 1,
-2.144913, 0.8792243, -0.2170404, 1, 1, 1, 1, 1,
-2.138721, 0.9047571, -3.006984, 1, 1, 1, 1, 1,
-2.119199, -0.2212011, -0.5458272, 1, 1, 1, 1, 1,
-2.050466, -0.1329301, -0.9241747, 1, 1, 1, 1, 1,
-2.03939, 0.06775169, 0.4192234, 1, 1, 1, 1, 1,
-2.011299, -1.4878, -1.833838, 1, 1, 1, 1, 1,
-2.005924, -1.087572, -1.643425, 1, 1, 1, 1, 1,
-1.971061, -1.289932, -0.6063904, 1, 1, 1, 1, 1,
-1.952649, 0.8898776, -0.9996566, 1, 1, 1, 1, 1,
-1.938739, 0.06687725, 0.1189138, 1, 1, 1, 1, 1,
-1.933224, 0.6054761, -0.7047815, 1, 1, 1, 1, 1,
-1.90761, -1.10597, -1.473165, 1, 1, 1, 1, 1,
-1.907402, -0.5325424, -1.876237, 0, 0, 1, 1, 1,
-1.897461, -0.1194678, -2.594358, 1, 0, 0, 1, 1,
-1.885579, -0.08055273, -0.5473197, 1, 0, 0, 1, 1,
-1.864728, 0.1509319, -0.3423872, 1, 0, 0, 1, 1,
-1.839223, 0.1981824, -3.620804, 1, 0, 0, 1, 1,
-1.825938, 1.103716, -1.684338, 1, 0, 0, 1, 1,
-1.823336, -0.3011548, -2.20293, 0, 0, 0, 1, 1,
-1.823285, 0.798366, 0.2248944, 0, 0, 0, 1, 1,
-1.822044, 1.641137, 0.2197316, 0, 0, 0, 1, 1,
-1.805102, 2.097339, -0.5188103, 0, 0, 0, 1, 1,
-1.783442, 0.8583975, -0.6362287, 0, 0, 0, 1, 1,
-1.778239, -1.469204, -2.224015, 0, 0, 0, 1, 1,
-1.770195, 1.050643, -2.224952, 0, 0, 0, 1, 1,
-1.725289, 1.199808, 0.5054541, 1, 1, 1, 1, 1,
-1.68109, -0.1368841, -2.580528, 1, 1, 1, 1, 1,
-1.667912, 1.022106, -0.4640779, 1, 1, 1, 1, 1,
-1.642822, 0.6082595, -3.416963, 1, 1, 1, 1, 1,
-1.629033, -0.4078524, -2.125675, 1, 1, 1, 1, 1,
-1.621529, 0.5763189, -0.5538023, 1, 1, 1, 1, 1,
-1.620067, -0.1081871, -1.281709, 1, 1, 1, 1, 1,
-1.607307, 0.3284233, 0.2168922, 1, 1, 1, 1, 1,
-1.595703, 0.4843064, -1.724157, 1, 1, 1, 1, 1,
-1.588277, 1.077934, -0.3717949, 1, 1, 1, 1, 1,
-1.584587, 1.104138, -0.9634898, 1, 1, 1, 1, 1,
-1.572875, -0.1960317, -1.155796, 1, 1, 1, 1, 1,
-1.565674, 0.5327621, -0.3462656, 1, 1, 1, 1, 1,
-1.563008, 0.190911, 0.2523254, 1, 1, 1, 1, 1,
-1.541545, -0.918597, -2.192322, 1, 1, 1, 1, 1,
-1.54015, 0.2299737, -2.739511, 0, 0, 1, 1, 1,
-1.523707, 1.434597, -0.6902758, 1, 0, 0, 1, 1,
-1.517071, 1.636945, 0.1895527, 1, 0, 0, 1, 1,
-1.504011, 0.8388503, -1.666668, 1, 0, 0, 1, 1,
-1.497795, -2.101471, -2.597424, 1, 0, 0, 1, 1,
-1.494409, -0.6025183, -4.118739, 1, 0, 0, 1, 1,
-1.477354, -1.589665, -3.272619, 0, 0, 0, 1, 1,
-1.474436, -0.2827907, -1.974643, 0, 0, 0, 1, 1,
-1.468797, -0.1763291, -1.325805, 0, 0, 0, 1, 1,
-1.463317, -0.0964221, -1.844467, 0, 0, 0, 1, 1,
-1.458955, -0.9658736, -1.225418, 0, 0, 0, 1, 1,
-1.448946, 0.4881518, -0.9218819, 0, 0, 0, 1, 1,
-1.43423, 0.9153364, -0.4199314, 0, 0, 0, 1, 1,
-1.417825, 1.007705, 0.4879042, 1, 1, 1, 1, 1,
-1.41241, 1.356239, -1.735817, 1, 1, 1, 1, 1,
-1.399425, -0.73743, -1.856008, 1, 1, 1, 1, 1,
-1.385459, -0.04888537, -1.632847, 1, 1, 1, 1, 1,
-1.38235, -0.1263044, -3.176031, 1, 1, 1, 1, 1,
-1.380236, 1.016734, -2.053252, 1, 1, 1, 1, 1,
-1.375062, -0.4435144, -2.323971, 1, 1, 1, 1, 1,
-1.365345, -0.6728512, -2.12778, 1, 1, 1, 1, 1,
-1.360646, -0.6153904, -3.646918, 1, 1, 1, 1, 1,
-1.323395, 0.7225876, -0.2658745, 1, 1, 1, 1, 1,
-1.313304, -0.7963582, -2.38426, 1, 1, 1, 1, 1,
-1.310974, 0.700084, -2.485713, 1, 1, 1, 1, 1,
-1.307099, -1.167922, -2.48524, 1, 1, 1, 1, 1,
-1.306435, 1.3008, 0.09402444, 1, 1, 1, 1, 1,
-1.306213, -1.028473, -2.597638, 1, 1, 1, 1, 1,
-1.302264, -0.3177173, -2.203619, 0, 0, 1, 1, 1,
-1.296354, 0.1161266, -2.600902, 1, 0, 0, 1, 1,
-1.294258, 0.3961782, -1.650151, 1, 0, 0, 1, 1,
-1.276093, 0.1020292, 0.2610604, 1, 0, 0, 1, 1,
-1.275065, 1.286618, -2.33312, 1, 0, 0, 1, 1,
-1.272136, -0.3344381, -2.094321, 1, 0, 0, 1, 1,
-1.271575, -1.684423, -2.340168, 0, 0, 0, 1, 1,
-1.256814, 0.7114874, -0.8108074, 0, 0, 0, 1, 1,
-1.248659, -0.1627005, -2.661844, 0, 0, 0, 1, 1,
-1.245879, -1.382926, -3.891651, 0, 0, 0, 1, 1,
-1.243256, 1.233849, 0.2513886, 0, 0, 0, 1, 1,
-1.240134, -0.6253236, -1.033144, 0, 0, 0, 1, 1,
-1.235733, 1.513836, -0.07963865, 0, 0, 0, 1, 1,
-1.23068, -1.281323, -3.155461, 1, 1, 1, 1, 1,
-1.228892, 1.454979, 0.8092681, 1, 1, 1, 1, 1,
-1.224706, 0.469664, -2.167101, 1, 1, 1, 1, 1,
-1.222092, 1.791662, -0.8010859, 1, 1, 1, 1, 1,
-1.214207, -0.05971671, -1.560745, 1, 1, 1, 1, 1,
-1.206027, 0.6350831, -2.04575, 1, 1, 1, 1, 1,
-1.203952, -2.509352, -2.302259, 1, 1, 1, 1, 1,
-1.196654, 0.2914363, -1.196669, 1, 1, 1, 1, 1,
-1.190832, 1.284762, -2.246079, 1, 1, 1, 1, 1,
-1.189625, 0.6324475, -0.662464, 1, 1, 1, 1, 1,
-1.186434, -0.6077107, -1.23387, 1, 1, 1, 1, 1,
-1.186008, 0.8128088, -0.6195567, 1, 1, 1, 1, 1,
-1.179473, -0.3304738, -0.7882892, 1, 1, 1, 1, 1,
-1.174887, -0.5741944, -1.05465, 1, 1, 1, 1, 1,
-1.169024, 0.4167602, -1.420738, 1, 1, 1, 1, 1,
-1.167551, 2.275608, 2.122113, 0, 0, 1, 1, 1,
-1.167351, -0.2710468, -1.81154, 1, 0, 0, 1, 1,
-1.166565, 0.4531346, -2.296035, 1, 0, 0, 1, 1,
-1.154504, 0.2025484, -0.02130355, 1, 0, 0, 1, 1,
-1.153564, 0.7574143, -1.351486, 1, 0, 0, 1, 1,
-1.147926, 0.8440095, -1.487006, 1, 0, 0, 1, 1,
-1.141445, -2.034859, -2.203939, 0, 0, 0, 1, 1,
-1.128819, -0.7832119, -0.3244509, 0, 0, 0, 1, 1,
-1.127527, -0.1857012, -3.531743, 0, 0, 0, 1, 1,
-1.12413, -1.894486, -2.303905, 0, 0, 0, 1, 1,
-1.109753, -0.9844355, -3.087143, 0, 0, 0, 1, 1,
-1.107111, -1.648645, -1.232591, 0, 0, 0, 1, 1,
-1.082185, -1.763207, -2.244165, 0, 0, 0, 1, 1,
-1.081393, 0.01834289, -3.282722, 1, 1, 1, 1, 1,
-1.080666, 0.1433437, -0.7432771, 1, 1, 1, 1, 1,
-1.079535, -1.138145, -3.745884, 1, 1, 1, 1, 1,
-1.079027, 0.4858548, -2.372581, 1, 1, 1, 1, 1,
-1.075047, 0.2957404, -2.045265, 1, 1, 1, 1, 1,
-1.070311, 1.061566, -0.7918696, 1, 1, 1, 1, 1,
-1.068393, 0.799661, -0.5916624, 1, 1, 1, 1, 1,
-1.039725, 0.41791, 0.593809, 1, 1, 1, 1, 1,
-1.037671, -1.06195, -1.413403, 1, 1, 1, 1, 1,
-1.036114, 0.3105674, -3.440587, 1, 1, 1, 1, 1,
-1.017233, -1.382793, -0.8488173, 1, 1, 1, 1, 1,
-1.014441, -0.3442384, -0.6275169, 1, 1, 1, 1, 1,
-1.013975, -0.3085061, -1.449916, 1, 1, 1, 1, 1,
-1.007786, -0.4322255, 0.214447, 1, 1, 1, 1, 1,
-0.9949142, -0.6020168, -2.084601, 1, 1, 1, 1, 1,
-0.9892141, -0.1847128, -0.1482511, 0, 0, 1, 1, 1,
-0.9849547, 1.212334, -1.386096, 1, 0, 0, 1, 1,
-0.9844922, 0.08499647, -2.434045, 1, 0, 0, 1, 1,
-0.9770545, 0.5856374, -0.9488023, 1, 0, 0, 1, 1,
-0.9769317, -0.06916329, -1.474744, 1, 0, 0, 1, 1,
-0.9701101, -0.3158043, -3.565124, 1, 0, 0, 1, 1,
-0.9699207, 1.083532, -0.5545419, 0, 0, 0, 1, 1,
-0.9670466, 0.007397973, -2.229264, 0, 0, 0, 1, 1,
-0.9669276, -0.4583884, -1.477395, 0, 0, 0, 1, 1,
-0.9616089, 0.9517248, -2.329471, 0, 0, 0, 1, 1,
-0.9553133, 0.1100823, -1.57065, 0, 0, 0, 1, 1,
-0.9440669, -1.200292, -2.218584, 0, 0, 0, 1, 1,
-0.9263205, 0.7942616, -1.856336, 0, 0, 0, 1, 1,
-0.9219668, 0.1236715, -0.4599371, 1, 1, 1, 1, 1,
-0.9218808, 0.9310625, -1.670988, 1, 1, 1, 1, 1,
-0.9205499, 0.8204582, -1.869309, 1, 1, 1, 1, 1,
-0.9108143, 0.7846565, -1.171234, 1, 1, 1, 1, 1,
-0.9103501, 0.4682039, -0.6006611, 1, 1, 1, 1, 1,
-0.9068663, 1.148634, -0.4507633, 1, 1, 1, 1, 1,
-0.9043871, -1.940257, -3.164414, 1, 1, 1, 1, 1,
-0.9039087, -0.6352783, -1.480815, 1, 1, 1, 1, 1,
-0.8938871, -0.8697965, -2.824832, 1, 1, 1, 1, 1,
-0.8920281, -2.509097, -3.761872, 1, 1, 1, 1, 1,
-0.8904757, 0.2364441, -2.24887, 1, 1, 1, 1, 1,
-0.8869881, -1.268547, -3.097378, 1, 1, 1, 1, 1,
-0.8854172, -0.7316352, -0.6858826, 1, 1, 1, 1, 1,
-0.8823815, 0.2783936, -2.762482, 1, 1, 1, 1, 1,
-0.8818441, 0.02114138, -1.839525, 1, 1, 1, 1, 1,
-0.8780978, -0.07271511, -0.867131, 0, 0, 1, 1, 1,
-0.8769447, 1.934701, -1.405992, 1, 0, 0, 1, 1,
-0.872783, -0.3095999, -1.580379, 1, 0, 0, 1, 1,
-0.8710725, -0.4744577, -1.027727, 1, 0, 0, 1, 1,
-0.870501, -0.7602032, -0.6649095, 1, 0, 0, 1, 1,
-0.870333, -0.7511925, -3.073713, 1, 0, 0, 1, 1,
-0.8703145, -0.00537813, -2.702294, 0, 0, 0, 1, 1,
-0.8689398, -0.8019807, -1.528453, 0, 0, 0, 1, 1,
-0.8657327, -0.4521486, -3.343814, 0, 0, 0, 1, 1,
-0.8656042, -0.4734675, -2.611645, 0, 0, 0, 1, 1,
-0.8635319, 1.299768, -1.134651, 0, 0, 0, 1, 1,
-0.8611899, 0.2300471, -3.445419, 0, 0, 0, 1, 1,
-0.8499302, -1.150913, -4.120252, 0, 0, 0, 1, 1,
-0.8430219, -0.4768674, -0.9782445, 1, 1, 1, 1, 1,
-0.8363049, 0.7214454, -2.506228, 1, 1, 1, 1, 1,
-0.8267133, -0.2068463, -0.398591, 1, 1, 1, 1, 1,
-0.8211889, -0.7135102, -1.485707, 1, 1, 1, 1, 1,
-0.8117876, 0.8548977, -0.777599, 1, 1, 1, 1, 1,
-0.8109061, -1.090586, -3.655432, 1, 1, 1, 1, 1,
-0.8095856, 0.6843581, -1.620619, 1, 1, 1, 1, 1,
-0.8081111, 2.043938, 0.1924971, 1, 1, 1, 1, 1,
-0.8058426, -0.7895122, -1.78632, 1, 1, 1, 1, 1,
-0.8054115, -1.409043, -1.962341, 1, 1, 1, 1, 1,
-0.8013215, -1.340701, -3.539706, 1, 1, 1, 1, 1,
-0.7992779, -2.675677, -3.314022, 1, 1, 1, 1, 1,
-0.7908359, -1.795547, -3.250944, 1, 1, 1, 1, 1,
-0.7891895, -0.4594074, -0.6597351, 1, 1, 1, 1, 1,
-0.7881563, 1.298082, -2.073965, 1, 1, 1, 1, 1,
-0.7836118, -0.1096014, -2.516108, 0, 0, 1, 1, 1,
-0.783383, -0.7138175, -0.6133721, 1, 0, 0, 1, 1,
-0.7801927, 1.385948, 1.585439, 1, 0, 0, 1, 1,
-0.7753628, 0.002020066, -1.064706, 1, 0, 0, 1, 1,
-0.7742394, 0.3614584, -1.414317, 1, 0, 0, 1, 1,
-0.7712042, 0.6846524, -0.2094253, 1, 0, 0, 1, 1,
-0.7693748, 2.604416, -1.85138, 0, 0, 0, 1, 1,
-0.766723, -0.07653183, -0.4328769, 0, 0, 0, 1, 1,
-0.760487, -1.061621, -1.672341, 0, 0, 0, 1, 1,
-0.7595928, 1.835651, -1.921232, 0, 0, 0, 1, 1,
-0.7581301, -0.1227603, -1.847406, 0, 0, 0, 1, 1,
-0.7565187, -0.4256119, -3.078815, 0, 0, 0, 1, 1,
-0.7512908, 1.35098, -0.6497499, 0, 0, 0, 1, 1,
-0.7510642, -0.5971317, -3.229021, 1, 1, 1, 1, 1,
-0.7455758, -0.3016746, -1.753085, 1, 1, 1, 1, 1,
-0.7427465, -1.4709, -1.279065, 1, 1, 1, 1, 1,
-0.7380886, 1.348639, -1.266308, 1, 1, 1, 1, 1,
-0.7370675, 0.5277436, -0.4526919, 1, 1, 1, 1, 1,
-0.735763, 0.2352657, -1.114008, 1, 1, 1, 1, 1,
-0.7334905, 1.028268, -0.5182754, 1, 1, 1, 1, 1,
-0.7324199, 1.128225, -0.3941616, 1, 1, 1, 1, 1,
-0.7296872, 0.7430847, -0.9811365, 1, 1, 1, 1, 1,
-0.7277192, 0.09763949, -0.6734289, 1, 1, 1, 1, 1,
-0.719913, 0.4813852, -2.514664, 1, 1, 1, 1, 1,
-0.7168625, 0.5608436, -0.001202372, 1, 1, 1, 1, 1,
-0.7087504, 0.2040314, -1.817654, 1, 1, 1, 1, 1,
-0.7075873, -1.957256, -2.349597, 1, 1, 1, 1, 1,
-0.7042117, 1.263971, 0.3406934, 1, 1, 1, 1, 1,
-0.7011031, 1.303374, -1.17706, 0, 0, 1, 1, 1,
-0.6997929, 0.08346001, -0.9838039, 1, 0, 0, 1, 1,
-0.6970141, 0.4039216, -0.3568701, 1, 0, 0, 1, 1,
-0.6936275, -0.2337105, -0.7381622, 1, 0, 0, 1, 1,
-0.6928493, -0.1884228, -1.532583, 1, 0, 0, 1, 1,
-0.6913675, -1.697593, -1.467571, 1, 0, 0, 1, 1,
-0.6894178, 0.5447516, -1.03975, 0, 0, 0, 1, 1,
-0.6856734, -0.4813922, -1.238911, 0, 0, 0, 1, 1,
-0.6842608, 0.9593497, -2.28966, 0, 0, 0, 1, 1,
-0.6813281, 0.01496227, -1.064074, 0, 0, 0, 1, 1,
-0.6808757, -1.815736, -3.528337, 0, 0, 0, 1, 1,
-0.6779168, -1.248281, -2.401512, 0, 0, 0, 1, 1,
-0.6765661, -1.7389, -1.773636, 0, 0, 0, 1, 1,
-0.6762699, -0.7591788, -2.437875, 1, 1, 1, 1, 1,
-0.6731881, 0.9530689, -2.835783, 1, 1, 1, 1, 1,
-0.6706104, 0.1480353, -2.136797, 1, 1, 1, 1, 1,
-0.6701992, 0.1709622, -1.048518, 1, 1, 1, 1, 1,
-0.6697843, 0.1548777, -0.661052, 1, 1, 1, 1, 1,
-0.6613361, 0.03482733, -1.97124, 1, 1, 1, 1, 1,
-0.6593141, 0.1627053, -1.675972, 1, 1, 1, 1, 1,
-0.6585615, 0.09691045, -1.994503, 1, 1, 1, 1, 1,
-0.6561464, -0.2385436, -1.730444, 1, 1, 1, 1, 1,
-0.6517076, 1.424943, -0.2160485, 1, 1, 1, 1, 1,
-0.6502723, 0.9452871, -0.6356069, 1, 1, 1, 1, 1,
-0.6488636, -0.09421813, -0.612054, 1, 1, 1, 1, 1,
-0.6473233, 0.571584, -2.99782, 1, 1, 1, 1, 1,
-0.6432404, -0.2697599, -1.723618, 1, 1, 1, 1, 1,
-0.6381741, 0.8196875, -0.2307998, 1, 1, 1, 1, 1,
-0.6347796, 1.295737, 0.2692322, 0, 0, 1, 1, 1,
-0.6343607, 0.3331799, -3.014225, 1, 0, 0, 1, 1,
-0.6306397, 0.777147, 0.3600988, 1, 0, 0, 1, 1,
-0.6267539, -0.01794463, -1.602445, 1, 0, 0, 1, 1,
-0.6251615, -0.3124837, -2.26627, 1, 0, 0, 1, 1,
-0.6233866, 1.064737, 0.4509076, 1, 0, 0, 1, 1,
-0.6193203, -0.6929356, -2.372166, 0, 0, 0, 1, 1,
-0.6175526, 0.282813, 0.0002843785, 0, 0, 0, 1, 1,
-0.6165303, -1.775982, -1.970538, 0, 0, 0, 1, 1,
-0.6164979, -0.8095098, -3.220742, 0, 0, 0, 1, 1,
-0.6156508, 0.4699369, -2.575503, 0, 0, 0, 1, 1,
-0.6154569, 0.5260072, -1.845381, 0, 0, 0, 1, 1,
-0.6152202, 0.4874273, -2.366428, 0, 0, 0, 1, 1,
-0.6145325, -0.4365107, -2.843988, 1, 1, 1, 1, 1,
-0.6123922, 1.134617, 0.8900357, 1, 1, 1, 1, 1,
-0.6117426, -0.5612953, -2.168102, 1, 1, 1, 1, 1,
-0.6105831, 0.5328697, -1.26812, 1, 1, 1, 1, 1,
-0.6078199, 0.1498416, -1.526557, 1, 1, 1, 1, 1,
-0.6056718, -0.8834943, -3.143372, 1, 1, 1, 1, 1,
-0.600611, 0.378644, -0.9236432, 1, 1, 1, 1, 1,
-0.6003048, -0.2912788, -0.817564, 1, 1, 1, 1, 1,
-0.5988186, -0.4389062, -2.770964, 1, 1, 1, 1, 1,
-0.596998, 1.011747, -1.529591, 1, 1, 1, 1, 1,
-0.5954139, -0.1851784, -3.3354, 1, 1, 1, 1, 1,
-0.5947783, -0.1533466, -1.820045, 1, 1, 1, 1, 1,
-0.5898718, 0.4454027, -2.773163, 1, 1, 1, 1, 1,
-0.5883543, 0.1371326, -1.076348, 1, 1, 1, 1, 1,
-0.586819, -1.069047, -1.774856, 1, 1, 1, 1, 1,
-0.5837375, -0.03454568, -0.6802641, 0, 0, 1, 1, 1,
-0.5801801, -0.7174731, -2.312209, 1, 0, 0, 1, 1,
-0.5781748, -0.9986774, -1.986172, 1, 0, 0, 1, 1,
-0.5692958, -1.277615, -1.100039, 1, 0, 0, 1, 1,
-0.5686431, -1.682082, -2.76995, 1, 0, 0, 1, 1,
-0.5673553, 0.0230993, -2.490493, 1, 0, 0, 1, 1,
-0.5659336, -0.6416239, -0.9907922, 0, 0, 0, 1, 1,
-0.5653726, -0.876268, -2.216123, 0, 0, 0, 1, 1,
-0.5637311, -0.5593262, -1.82253, 0, 0, 0, 1, 1,
-0.5620052, 1.552655, -2.076994, 0, 0, 0, 1, 1,
-0.5615857, -0.993852, -3.494161, 0, 0, 0, 1, 1,
-0.5580723, 0.9342743, -1.142541, 0, 0, 0, 1, 1,
-0.5538787, 3.177268, -1.011312, 0, 0, 0, 1, 1,
-0.5535457, 2.403668, -0.2382098, 1, 1, 1, 1, 1,
-0.5519905, -0.525423, -4.816845, 1, 1, 1, 1, 1,
-0.5489603, -0.7980046, -1.846671, 1, 1, 1, 1, 1,
-0.5484198, 0.9874871, -0.0413639, 1, 1, 1, 1, 1,
-0.5453805, -1.015105, -2.40805, 1, 1, 1, 1, 1,
-0.5449875, 1.529931, -0.258814, 1, 1, 1, 1, 1,
-0.5404778, 0.9158313, 0.8074418, 1, 1, 1, 1, 1,
-0.5403596, -0.1952927, -0.758586, 1, 1, 1, 1, 1,
-0.5388809, 0.04364538, -2.666742, 1, 1, 1, 1, 1,
-0.5363606, -0.9447516, -3.766542, 1, 1, 1, 1, 1,
-0.5358282, -0.8095431, -1.29671, 1, 1, 1, 1, 1,
-0.5352421, 0.5891833, -0.8131796, 1, 1, 1, 1, 1,
-0.5338051, -0.3595512, -2.346266, 1, 1, 1, 1, 1,
-0.529318, 1.2665, 0.4436885, 1, 1, 1, 1, 1,
-0.5208509, 0.09651864, -1.031778, 1, 1, 1, 1, 1,
-0.519592, -0.4639989, -1.645259, 0, 0, 1, 1, 1,
-0.5165408, -0.5098607, -2.664161, 1, 0, 0, 1, 1,
-0.5067844, 0.3005217, -1.48862, 1, 0, 0, 1, 1,
-0.5061265, -0.9389551, -1.724663, 1, 0, 0, 1, 1,
-0.5050015, -0.3035432, -3.694427, 1, 0, 0, 1, 1,
-0.5045885, -1.037742, -4.234825, 1, 0, 0, 1, 1,
-0.4999007, -1.039022, -3.259358, 0, 0, 0, 1, 1,
-0.4963568, 1.010377, -1.139087, 0, 0, 0, 1, 1,
-0.4939691, -0.7645068, -3.03472, 0, 0, 0, 1, 1,
-0.4925922, -1.005248, -1.942242, 0, 0, 0, 1, 1,
-0.4911856, -1.308397, -2.776962, 0, 0, 0, 1, 1,
-0.4877968, -0.8312386, -1.619031, 0, 0, 0, 1, 1,
-0.4825729, 1.982826, 1.198838, 0, 0, 0, 1, 1,
-0.474118, 1.347762, -1.022693, 1, 1, 1, 1, 1,
-0.4733421, -0.3622926, -3.151474, 1, 1, 1, 1, 1,
-0.4701476, -1.79244, -2.852497, 1, 1, 1, 1, 1,
-0.4678604, 1.560739, -1.796519, 1, 1, 1, 1, 1,
-0.4505704, 0.2341104, -2.473486, 1, 1, 1, 1, 1,
-0.4487223, -1.333393, -4.485473, 1, 1, 1, 1, 1,
-0.4474829, 0.2462403, -2.460893, 1, 1, 1, 1, 1,
-0.44605, 0.04809986, -1.585512, 1, 1, 1, 1, 1,
-0.4419165, -0.3843648, -1.855812, 1, 1, 1, 1, 1,
-0.4403816, -0.05685339, -1.139218, 1, 1, 1, 1, 1,
-0.436774, 1.407822, 0.2121727, 1, 1, 1, 1, 1,
-0.4332035, 1.150143, -0.1138662, 1, 1, 1, 1, 1,
-0.4316328, -1.543164, -4.520612, 1, 1, 1, 1, 1,
-0.4286555, -0.04944566, -2.580637, 1, 1, 1, 1, 1,
-0.4280264, 0.5777787, 0.3645842, 1, 1, 1, 1, 1,
-0.4184768, 0.02835924, -0.9538676, 0, 0, 1, 1, 1,
-0.4175994, 0.898023, 0.811144, 1, 0, 0, 1, 1,
-0.4167007, 1.483987, -1.273219, 1, 0, 0, 1, 1,
-0.4115011, -1.07291, -3.029219, 1, 0, 0, 1, 1,
-0.4071241, 1.144096, -0.8871183, 1, 0, 0, 1, 1,
-0.4059349, 0.7149907, 0.007508515, 1, 0, 0, 1, 1,
-0.4041681, 0.2510819, -2.244565, 0, 0, 0, 1, 1,
-0.4027224, 0.9085777, 1.095228, 0, 0, 0, 1, 1,
-0.4021122, -0.2906784, -0.7065883, 0, 0, 0, 1, 1,
-0.3950965, 0.5757924, 0.8123096, 0, 0, 0, 1, 1,
-0.3927824, 1.975166, 2.92802, 0, 0, 0, 1, 1,
-0.3905542, 1.425996, -0.9651528, 0, 0, 0, 1, 1,
-0.3886708, -0.06576933, -2.403888, 0, 0, 0, 1, 1,
-0.3631414, 0.6822121, 1.382084, 1, 1, 1, 1, 1,
-0.3604719, -2.338796, -3.635535, 1, 1, 1, 1, 1,
-0.3574371, 1.173736, 0.02800747, 1, 1, 1, 1, 1,
-0.354855, 0.5502019, 1.187063, 1, 1, 1, 1, 1,
-0.3431305, 1.661183, -1.627537, 1, 1, 1, 1, 1,
-0.3429701, -0.8923463, -1.283502, 1, 1, 1, 1, 1,
-0.3426118, -0.9287057, -2.461028, 1, 1, 1, 1, 1,
-0.3240124, -1.021898, -5.342263, 1, 1, 1, 1, 1,
-0.3227659, -0.8004452, -2.64103, 1, 1, 1, 1, 1,
-0.3182494, 0.8174419, -0.3605275, 1, 1, 1, 1, 1,
-0.3180627, -0.7578514, -4.129795, 1, 1, 1, 1, 1,
-0.3178547, -1.537006, -3.424938, 1, 1, 1, 1, 1,
-0.3170455, 0.5673935, 0.1888346, 1, 1, 1, 1, 1,
-0.3157029, -0.7287378, -3.507103, 1, 1, 1, 1, 1,
-0.3135048, 0.3182845, -1.400879, 1, 1, 1, 1, 1,
-0.3099222, -0.0461756, -2.978258, 0, 0, 1, 1, 1,
-0.3089664, 1.24595, -1.982836, 1, 0, 0, 1, 1,
-0.3079841, -0.2591442, -1.814147, 1, 0, 0, 1, 1,
-0.307943, -0.01301015, -2.054155, 1, 0, 0, 1, 1,
-0.3009686, -0.9809856, -4.288786, 1, 0, 0, 1, 1,
-0.2901683, -0.625791, -2.429941, 1, 0, 0, 1, 1,
-0.2868925, -1.657661, -2.438595, 0, 0, 0, 1, 1,
-0.2868451, 0.6947072, -1.669362, 0, 0, 0, 1, 1,
-0.2846393, 0.2442266, -1.453153, 0, 0, 0, 1, 1,
-0.2835272, -0.3429076, -0.8897877, 0, 0, 0, 1, 1,
-0.2830225, -0.9102123, -2.730096, 0, 0, 0, 1, 1,
-0.2792684, -1.868992, -3.779783, 0, 0, 0, 1, 1,
-0.2771538, 0.7804012, 0.9962932, 0, 0, 0, 1, 1,
-0.2766877, -1.522912, -1.949772, 1, 1, 1, 1, 1,
-0.2738447, -0.3876626, -2.2316, 1, 1, 1, 1, 1,
-0.2687988, 1.560272, -0.5360449, 1, 1, 1, 1, 1,
-0.2679946, 0.7917306, -1.326737, 1, 1, 1, 1, 1,
-0.26289, 1.361317, -0.7671387, 1, 1, 1, 1, 1,
-0.2562985, -1.47112, -2.930273, 1, 1, 1, 1, 1,
-0.255869, -1.423911, -2.402058, 1, 1, 1, 1, 1,
-0.2554596, -0.1073669, -3.325744, 1, 1, 1, 1, 1,
-0.2548883, -1.206196, -1.439515, 1, 1, 1, 1, 1,
-0.2538815, -1.225762, -3.087894, 1, 1, 1, 1, 1,
-0.2492271, 0.392577, 2.440339, 1, 1, 1, 1, 1,
-0.2432278, 0.3555836, -0.3316596, 1, 1, 1, 1, 1,
-0.2425918, -0.1317939, -2.883077, 1, 1, 1, 1, 1,
-0.2379208, -0.6678095, -3.031374, 1, 1, 1, 1, 1,
-0.2366526, -1.114233, -3.154531, 1, 1, 1, 1, 1,
-0.2315558, 1.227477, -0.3399825, 0, 0, 1, 1, 1,
-0.2260989, -0.5220525, -2.891481, 1, 0, 0, 1, 1,
-0.2228663, -0.3445735, -2.790844, 1, 0, 0, 1, 1,
-0.2217279, 0.918663, -2.891713, 1, 0, 0, 1, 1,
-0.2210508, 0.9161846, -0.2158788, 1, 0, 0, 1, 1,
-0.2205048, 0.09105772, -2.045233, 1, 0, 0, 1, 1,
-0.2189335, -0.48378, -2.802974, 0, 0, 0, 1, 1,
-0.2180126, 0.06942839, 0.9132976, 0, 0, 0, 1, 1,
-0.2179589, 2.071182, -0.6891041, 0, 0, 0, 1, 1,
-0.2145198, -2.392798, -3.301231, 0, 0, 0, 1, 1,
-0.2113848, -0.6319432, -0.9789347, 0, 0, 0, 1, 1,
-0.2057851, 0.6436499, -0.8760368, 0, 0, 0, 1, 1,
-0.2038179, -0.5924525, -2.233394, 0, 0, 0, 1, 1,
-0.196144, -1.200464, -2.36544, 1, 1, 1, 1, 1,
-0.1866095, 0.3035895, 1.173275, 1, 1, 1, 1, 1,
-0.1840955, -0.7065225, -1.681115, 1, 1, 1, 1, 1,
-0.1828036, 0.7639956, -1.524602, 1, 1, 1, 1, 1,
-0.1781028, -1.389045, -5.27598, 1, 1, 1, 1, 1,
-0.1777906, -1.402873, -5.03686, 1, 1, 1, 1, 1,
-0.1769313, -1.028889, -3.240131, 1, 1, 1, 1, 1,
-0.176838, -0.1044298, -2.724074, 1, 1, 1, 1, 1,
-0.1749719, -1.051583, -2.652251, 1, 1, 1, 1, 1,
-0.1740554, 0.6781894, 0.6203154, 1, 1, 1, 1, 1,
-0.1662704, -0.8266774, -5.553911, 1, 1, 1, 1, 1,
-0.1610757, -0.7680102, -1.885059, 1, 1, 1, 1, 1,
-0.1609624, 0.6642632, 1.650883, 1, 1, 1, 1, 1,
-0.160333, -0.7002507, -3.674607, 1, 1, 1, 1, 1,
-0.160192, 0.2421279, 0.1516335, 1, 1, 1, 1, 1,
-0.1580937, -1.628793, -3.593774, 0, 0, 1, 1, 1,
-0.1539996, 0.2844637, -1.072064, 1, 0, 0, 1, 1,
-0.1513077, 0.769328, 1.332359, 1, 0, 0, 1, 1,
-0.1511752, -0.5853053, -3.811946, 1, 0, 0, 1, 1,
-0.1472444, 1.251377, 0.3123899, 1, 0, 0, 1, 1,
-0.1443218, -1.17745, -4.561075, 1, 0, 0, 1, 1,
-0.1424344, 0.06653695, -1.505226, 0, 0, 0, 1, 1,
-0.1384322, 1.369046, -1.647488, 0, 0, 0, 1, 1,
-0.1364026, -1.024472, -2.222436, 0, 0, 0, 1, 1,
-0.1345667, -1.440548, -1.634978, 0, 0, 0, 1, 1,
-0.1325069, -1.263863, -3.679842, 0, 0, 0, 1, 1,
-0.1310595, -0.2510708, -4.573673, 0, 0, 0, 1, 1,
-0.1299273, 0.09889298, -0.6756341, 0, 0, 0, 1, 1,
-0.1291585, 0.5946219, 0.1674719, 1, 1, 1, 1, 1,
-0.1283726, 0.8936949, -0.3826982, 1, 1, 1, 1, 1,
-0.1260031, -1.002034, -1.875243, 1, 1, 1, 1, 1,
-0.1257229, 1.413147, -1.543, 1, 1, 1, 1, 1,
-0.1245809, 1.598701, -1.137521, 1, 1, 1, 1, 1,
-0.1231321, -0.06011122, -2.785785, 1, 1, 1, 1, 1,
-0.117345, 0.2346402, -1.215248, 1, 1, 1, 1, 1,
-0.1139218, 0.7835078, 0.6913184, 1, 1, 1, 1, 1,
-0.1135285, 0.1417505, -1.394705, 1, 1, 1, 1, 1,
-0.1123266, 1.2667, -0.223336, 1, 1, 1, 1, 1,
-0.1097153, -0.3409715, -2.013092, 1, 1, 1, 1, 1,
-0.1045978, -0.5894864, -4.470388, 1, 1, 1, 1, 1,
-0.1034496, 1.530308, -0.6841984, 1, 1, 1, 1, 1,
-0.09601794, -0.803835, -1.40783, 1, 1, 1, 1, 1,
-0.09566035, -0.5419981, -3.56617, 1, 1, 1, 1, 1,
-0.09195423, -1.186882, -2.90602, 0, 0, 1, 1, 1,
-0.09094135, -1.817389, -2.373585, 1, 0, 0, 1, 1,
-0.09079289, 0.2739414, -0.2210478, 1, 0, 0, 1, 1,
-0.0804216, -0.25446, -2.217518, 1, 0, 0, 1, 1,
-0.07887615, 0.3156237, 2.139956, 1, 0, 0, 1, 1,
-0.074821, -0.2232261, -1.113497, 1, 0, 0, 1, 1,
-0.07442696, -1.427502, -2.7019, 0, 0, 0, 1, 1,
-0.0735641, 0.1354102, -0.5340719, 0, 0, 0, 1, 1,
-0.07342336, 0.3929766, -0.4878634, 0, 0, 0, 1, 1,
-0.07244744, -0.2702996, -3.624386, 0, 0, 0, 1, 1,
-0.0716282, 0.523953, 0.4842566, 0, 0, 0, 1, 1,
-0.07020552, -0.0763717, -1.850535, 0, 0, 0, 1, 1,
-0.06914997, 1.985107, -1.083003, 0, 0, 0, 1, 1,
-0.06816886, 0.4121888, 0.3421059, 1, 1, 1, 1, 1,
-0.0641126, -1.861714, -2.996511, 1, 1, 1, 1, 1,
-0.06362627, 0.3878227, -1.459471, 1, 1, 1, 1, 1,
-0.06358942, -1.129395, -3.389437, 1, 1, 1, 1, 1,
-0.06127944, -1.455555, -6.106793, 1, 1, 1, 1, 1,
-0.06091748, 1.420226, -0.4974634, 1, 1, 1, 1, 1,
-0.05774565, 1.965138, -1.792815, 1, 1, 1, 1, 1,
-0.05493378, 0.5958169, -0.4002347, 1, 1, 1, 1, 1,
-0.05443626, -0.1200903, -2.829046, 1, 1, 1, 1, 1,
-0.05409998, -0.06974784, -2.475747, 1, 1, 1, 1, 1,
-0.04719332, 0.1257489, -0.7116078, 1, 1, 1, 1, 1,
-0.04630189, -1.585519, -3.011609, 1, 1, 1, 1, 1,
-0.04627935, -0.3617226, -1.402131, 1, 1, 1, 1, 1,
-0.03952423, 1.817354, -0.7956275, 1, 1, 1, 1, 1,
-0.0381247, -1.599481, -5.095716, 1, 1, 1, 1, 1,
-0.03508177, 0.549762, 0.7793982, 0, 0, 1, 1, 1,
-0.03501409, 1.655095, 0.1468731, 1, 0, 0, 1, 1,
-0.02878797, -0.3599341, -1.985106, 1, 0, 0, 1, 1,
-0.02606539, -0.0408713, -5.349698, 1, 0, 0, 1, 1,
-0.02564725, -0.7164112, -1.492558, 1, 0, 0, 1, 1,
-0.02531443, -0.01056837, -3.241714, 1, 0, 0, 1, 1,
-0.02431449, 0.5788675, -0.3299252, 0, 0, 0, 1, 1,
-0.02426574, 0.3877647, -1.813969, 0, 0, 0, 1, 1,
-0.01663698, 0.9812799, 0.4044489, 0, 0, 0, 1, 1,
-0.01549403, 0.8396036, 1.370621, 0, 0, 0, 1, 1,
-0.01417568, 1.473517, 0.3821839, 0, 0, 0, 1, 1,
-0.01256028, 0.2133186, -0.3884566, 0, 0, 0, 1, 1,
-0.01177135, -0.1027427, -2.100378, 0, 0, 0, 1, 1,
-0.01159488, 0.002888157, -0.6150294, 1, 1, 1, 1, 1,
-0.008963253, -0.438717, -3.157987, 1, 1, 1, 1, 1,
-0.008413197, 1.840309, 1.242791, 1, 1, 1, 1, 1,
-0.003755761, 0.86496, 0.6582159, 1, 1, 1, 1, 1,
-8.173673e-05, -1.697899, -2.69853, 1, 1, 1, 1, 1,
0.008087487, 1.733397, -0.2608337, 1, 1, 1, 1, 1,
0.01274467, 0.4323413, 0.6333244, 1, 1, 1, 1, 1,
0.01839704, -1.255805, 2.610903, 1, 1, 1, 1, 1,
0.02054552, 0.7140655, 0.8339926, 1, 1, 1, 1, 1,
0.02247284, 0.02699879, 1.189219, 1, 1, 1, 1, 1,
0.0230706, -1.78739, 3.47507, 1, 1, 1, 1, 1,
0.03369803, -0.07502639, 2.142588, 1, 1, 1, 1, 1,
0.03829959, 0.1736298, -1.16331, 1, 1, 1, 1, 1,
0.04129695, 0.6110483, 1.426784, 1, 1, 1, 1, 1,
0.0432508, 0.05043992, 0.7876897, 1, 1, 1, 1, 1,
0.04489171, -0.1287708, 3.193183, 0, 0, 1, 1, 1,
0.0457738, 0.270167, -0.1618483, 1, 0, 0, 1, 1,
0.04815133, 1.097395, 1.01274, 1, 0, 0, 1, 1,
0.05052666, 1.802756, -0.6842857, 1, 0, 0, 1, 1,
0.05170638, 1.188259, 0.8123596, 1, 0, 0, 1, 1,
0.05951032, -0.1404546, 3.09813, 1, 0, 0, 1, 1,
0.06017986, 0.3708336, 0.1948272, 0, 0, 0, 1, 1,
0.06171444, 1.119571, 0.3373524, 0, 0, 0, 1, 1,
0.06178175, 2.22863, 0.849637, 0, 0, 0, 1, 1,
0.06184772, 0.6278691, 0.5094604, 0, 0, 0, 1, 1,
0.06846061, -0.394224, 1.595868, 0, 0, 0, 1, 1,
0.07148729, -0.1296034, 1.851313, 0, 0, 0, 1, 1,
0.07264905, 0.1899238, 0.4168317, 0, 0, 0, 1, 1,
0.07408568, 0.0681221, -1.325594, 1, 1, 1, 1, 1,
0.07570039, 0.957395, -0.1747349, 1, 1, 1, 1, 1,
0.07573095, 1.979927, 0.7014505, 1, 1, 1, 1, 1,
0.07697401, 2.368863, 0.339684, 1, 1, 1, 1, 1,
0.07937368, 0.8658291, -0.08894957, 1, 1, 1, 1, 1,
0.08058141, 0.4104666, 1.164128, 1, 1, 1, 1, 1,
0.08127823, -0.2035174, 3.386522, 1, 1, 1, 1, 1,
0.08289856, 1.120716, 0.8361338, 1, 1, 1, 1, 1,
0.08757028, -0.3736801, 1.786309, 1, 1, 1, 1, 1,
0.09058612, -2.33396, 4.415262, 1, 1, 1, 1, 1,
0.09107348, -1.013193, 1.907423, 1, 1, 1, 1, 1,
0.09163076, -1.755363, 2.347013, 1, 1, 1, 1, 1,
0.09709623, -1.541267, 1.141983, 1, 1, 1, 1, 1,
0.09806204, -0.5307026, 4.087292, 1, 1, 1, 1, 1,
0.1024196, 0.9628934, -1.025689, 1, 1, 1, 1, 1,
0.1050267, -0.884111, 2.283234, 0, 0, 1, 1, 1,
0.1054296, 0.8363947, -1.078004, 1, 0, 0, 1, 1,
0.1140932, -1.553966, 4.841111, 1, 0, 0, 1, 1,
0.1232132, 1.333456, -0.2386899, 1, 0, 0, 1, 1,
0.1266329, -0.7719288, 3.474864, 1, 0, 0, 1, 1,
0.1293729, 0.6037427, -1.842973, 1, 0, 0, 1, 1,
0.1294848, 0.801339, 1.825338, 0, 0, 0, 1, 1,
0.1323168, -0.02967014, 3.049073, 0, 0, 0, 1, 1,
0.1328948, 0.5202004, 1.237864, 0, 0, 0, 1, 1,
0.1345371, -1.56991, 2.855313, 0, 0, 0, 1, 1,
0.1349851, 0.9475499, 0.6607966, 0, 0, 0, 1, 1,
0.1400226, 1.398589, 2.57116, 0, 0, 0, 1, 1,
0.1402749, -0.5730673, 4.676754, 0, 0, 0, 1, 1,
0.1419318, -0.1006702, 0.4216439, 1, 1, 1, 1, 1,
0.1421798, -0.4315404, 3.863779, 1, 1, 1, 1, 1,
0.1457226, 0.1643594, 3.412468, 1, 1, 1, 1, 1,
0.145873, 0.004952503, 3.397595, 1, 1, 1, 1, 1,
0.1497949, 1.247603, -0.4203626, 1, 1, 1, 1, 1,
0.1511384, -1.053005, 2.974502, 1, 1, 1, 1, 1,
0.1522744, -0.3598248, 2.088349, 1, 1, 1, 1, 1,
0.1546502, -0.5552895, 3.517935, 1, 1, 1, 1, 1,
0.1599832, -1.562321, 2.286822, 1, 1, 1, 1, 1,
0.1677102, 0.3325368, 0.1010438, 1, 1, 1, 1, 1,
0.1699215, 1.49492, -0.6040315, 1, 1, 1, 1, 1,
0.1744193, -0.7461346, 3.093207, 1, 1, 1, 1, 1,
0.1748882, 1.70541, -0.6538015, 1, 1, 1, 1, 1,
0.1756403, 1.114327, -0.3652738, 1, 1, 1, 1, 1,
0.1767895, 1.765997, -0.1694882, 1, 1, 1, 1, 1,
0.1780732, -0.9219005, 3.505065, 0, 0, 1, 1, 1,
0.183103, 0.707396, -0.04921117, 1, 0, 0, 1, 1,
0.1872638, -1.661803, 3.481045, 1, 0, 0, 1, 1,
0.1873475, 1.491719, 0.7549854, 1, 0, 0, 1, 1,
0.1892815, 0.3873523, -0.4697621, 1, 0, 0, 1, 1,
0.1898466, 0.1859882, 0.3721232, 1, 0, 0, 1, 1,
0.1907504, -0.8385089, 3.824436, 0, 0, 0, 1, 1,
0.1915179, 0.71861, 2.656554, 0, 0, 0, 1, 1,
0.1930974, -0.6498185, 4.578576, 0, 0, 0, 1, 1,
0.1954907, 0.1935386, -0.06048218, 0, 0, 0, 1, 1,
0.1973391, -0.5674322, 2.85062, 0, 0, 0, 1, 1,
0.1977476, -0.1840103, 3.789014, 0, 0, 0, 1, 1,
0.2021763, 0.172994, 2.214807, 0, 0, 0, 1, 1,
0.2055087, -0.5768901, 3.587086, 1, 1, 1, 1, 1,
0.2117438, 0.7431998, -0.4920204, 1, 1, 1, 1, 1,
0.2118935, -0.8194709, 4.248307, 1, 1, 1, 1, 1,
0.2127032, -0.246135, 1.462087, 1, 1, 1, 1, 1,
0.2132516, -1.510104, 1.932081, 1, 1, 1, 1, 1,
0.2174172, -1.330444, 2.90146, 1, 1, 1, 1, 1,
0.2186851, -0.5746367, 3.932462, 1, 1, 1, 1, 1,
0.22039, 0.3582191, 1.204506, 1, 1, 1, 1, 1,
0.2255122, -1.472594, 3.482623, 1, 1, 1, 1, 1,
0.2273849, 1.501472, 0.1352887, 1, 1, 1, 1, 1,
0.2308237, 0.6736429, 0.9539708, 1, 1, 1, 1, 1,
0.2327487, -1.513357, 4.428699, 1, 1, 1, 1, 1,
0.2344301, 1.000483, -0.2372115, 1, 1, 1, 1, 1,
0.2378086, 2.095993, -2.302622, 1, 1, 1, 1, 1,
0.2386399, 0.906595, -0.04955235, 1, 1, 1, 1, 1,
0.2398932, 0.02235902, 1.840048, 0, 0, 1, 1, 1,
0.2401513, -0.2152765, 2.865406, 1, 0, 0, 1, 1,
0.2416022, 0.196168, 3.682185, 1, 0, 0, 1, 1,
0.244709, 0.4334322, 0.6032066, 1, 0, 0, 1, 1,
0.2464907, -1.902834, 2.678791, 1, 0, 0, 1, 1,
0.2481299, -0.7351994, 2.397635, 1, 0, 0, 1, 1,
0.2489079, -1.697675, 5.737211, 0, 0, 0, 1, 1,
0.2506661, 0.04524477, 3.253772, 0, 0, 0, 1, 1,
0.2527817, 0.2402123, 1.283312, 0, 0, 0, 1, 1,
0.2598133, -0.1982211, 1.151865, 0, 0, 0, 1, 1,
0.265991, 1.170169, 0.6007074, 0, 0, 0, 1, 1,
0.2698591, 0.7631379, 2.938656, 0, 0, 0, 1, 1,
0.2721854, -0.387797, 3.586556, 0, 0, 0, 1, 1,
0.2739666, -0.7068246, 2.833385, 1, 1, 1, 1, 1,
0.2756328, -1.493013, 4.63513, 1, 1, 1, 1, 1,
0.2765088, -0.2169671, 1.921263, 1, 1, 1, 1, 1,
0.2767598, 0.1165481, 1.961362, 1, 1, 1, 1, 1,
0.2841841, 0.2096006, 1.444158, 1, 1, 1, 1, 1,
0.2903509, 2.349504, 2.195002, 1, 1, 1, 1, 1,
0.291043, -1.158959, 3.359091, 1, 1, 1, 1, 1,
0.2921387, -1.247728, 2.840689, 1, 1, 1, 1, 1,
0.2934161, -1.416341, 3.778284, 1, 1, 1, 1, 1,
0.293691, -0.7877288, 3.818929, 1, 1, 1, 1, 1,
0.294372, -1.028136, 4.225617, 1, 1, 1, 1, 1,
0.2968313, 1.094797, 0.1642274, 1, 1, 1, 1, 1,
0.2980226, -1.119031, 1.544518, 1, 1, 1, 1, 1,
0.3039643, 0.234425, 1.903534, 1, 1, 1, 1, 1,
0.3072795, 1.011364, -0.9378409, 1, 1, 1, 1, 1,
0.309044, -0.07964432, 3.557011, 0, 0, 1, 1, 1,
0.3092338, -0.9133674, 1.346365, 1, 0, 0, 1, 1,
0.3100733, 0.1742046, 0.8959379, 1, 0, 0, 1, 1,
0.3101211, -2.358227, 3.763647, 1, 0, 0, 1, 1,
0.3103898, 0.1760706, 1.282568, 1, 0, 0, 1, 1,
0.3118819, 0.3609787, 1.566455, 1, 0, 0, 1, 1,
0.3137921, -0.861936, 4.104396, 0, 0, 0, 1, 1,
0.3157011, -0.3201116, 3.596683, 0, 0, 0, 1, 1,
0.3193285, 0.6853389, 3.028363, 0, 0, 0, 1, 1,
0.3269943, 0.5149654, -0.7895394, 0, 0, 0, 1, 1,
0.3345156, 1.415758, 0.8483148, 0, 0, 0, 1, 1,
0.3360885, 1.001768, 2.389708, 0, 0, 0, 1, 1,
0.340727, -0.1465166, 1.966658, 0, 0, 0, 1, 1,
0.3410091, -1.122145, 1.915992, 1, 1, 1, 1, 1,
0.3428554, 0.1166717, 0.9355152, 1, 1, 1, 1, 1,
0.3436656, 1.793294, 1.055732, 1, 1, 1, 1, 1,
0.3446045, 0.8395998, 0.8361425, 1, 1, 1, 1, 1,
0.3476406, -0.2682346, 2.22775, 1, 1, 1, 1, 1,
0.3480975, 0.9230573, 0.457526, 1, 1, 1, 1, 1,
0.351052, -0.2774672, 1.331767, 1, 1, 1, 1, 1,
0.3604794, 0.8289323, 0.1698552, 1, 1, 1, 1, 1,
0.3613071, 0.2849507, 0.6985932, 1, 1, 1, 1, 1,
0.362092, -0.9209966, 2.502153, 1, 1, 1, 1, 1,
0.3641575, -0.07331919, 1.278898, 1, 1, 1, 1, 1,
0.3663804, 0.6646442, -1.200884, 1, 1, 1, 1, 1,
0.3713525, 1.946451, -0.3547845, 1, 1, 1, 1, 1,
0.3716901, 1.016868, 0.3925827, 1, 1, 1, 1, 1,
0.3729171, 0.9618914, 0.2869402, 1, 1, 1, 1, 1,
0.3741602, -0.2370013, 3.093151, 0, 0, 1, 1, 1,
0.3771346, 1.976239, -0.3929287, 1, 0, 0, 1, 1,
0.38105, 0.9131573, -0.7247341, 1, 0, 0, 1, 1,
0.3870422, -0.3894526, 1.891884, 1, 0, 0, 1, 1,
0.3874814, 0.5513872, 0.4373768, 1, 0, 0, 1, 1,
0.3942471, -0.6329563, 3.643767, 1, 0, 0, 1, 1,
0.396884, 0.4636162, 1.0999, 0, 0, 0, 1, 1,
0.4026256, -0.8297682, 3.031918, 0, 0, 0, 1, 1,
0.405775, 0.9502968, 0.6759946, 0, 0, 0, 1, 1,
0.4066229, -1.297132, 2.256809, 0, 0, 0, 1, 1,
0.4078179, -1.103034, 2.977593, 0, 0, 0, 1, 1,
0.4107082, -0.2625075, 1.423627, 0, 0, 0, 1, 1,
0.4141288, -1.036411, 2.181134, 0, 0, 0, 1, 1,
0.4215479, -0.4553112, 2.082033, 1, 1, 1, 1, 1,
0.4236818, -1.16006, 1.964057, 1, 1, 1, 1, 1,
0.4278077, 0.4878253, 3.465104, 1, 1, 1, 1, 1,
0.4280663, -1.500683, 2.520511, 1, 1, 1, 1, 1,
0.4282166, 1.87267, 0.543981, 1, 1, 1, 1, 1,
0.4325357, 0.6681488, -0.138751, 1, 1, 1, 1, 1,
0.4346371, -1.535681, 1.94907, 1, 1, 1, 1, 1,
0.4346749, -0.5869483, 2.43468, 1, 1, 1, 1, 1,
0.4347656, 0.2039755, 0.2458642, 1, 1, 1, 1, 1,
0.4414372, 0.05625525, 1.848334, 1, 1, 1, 1, 1,
0.4416671, 1.350562, 0.3983332, 1, 1, 1, 1, 1,
0.4453756, 0.4605321, 0.4354513, 1, 1, 1, 1, 1,
0.4480173, 0.4746805, 0.2913355, 1, 1, 1, 1, 1,
0.4504326, -1.131948, 4.949366, 1, 1, 1, 1, 1,
0.4528211, -0.3552314, 1.531646, 1, 1, 1, 1, 1,
0.4554864, -0.05411591, 3.718663, 0, 0, 1, 1, 1,
0.4556604, 0.3910512, 0.6536916, 1, 0, 0, 1, 1,
0.4622878, -0.6226447, 1.286389, 1, 0, 0, 1, 1,
0.4649476, 0.3544852, 2.490645, 1, 0, 0, 1, 1,
0.4692462, 0.5009053, 0.1785678, 1, 0, 0, 1, 1,
0.4740248, 0.5288046, 0.5505097, 1, 0, 0, 1, 1,
0.4751133, -0.1683656, -0.07697036, 0, 0, 0, 1, 1,
0.4771232, 0.1312806, 0.3023176, 0, 0, 0, 1, 1,
0.4816945, 0.2620631, 0.4203105, 0, 0, 0, 1, 1,
0.4819443, -1.635344, 3.380679, 0, 0, 0, 1, 1,
0.4846818, -0.3140236, 0.9215469, 0, 0, 0, 1, 1,
0.4865127, -0.9637294, 2.413641, 0, 0, 0, 1, 1,
0.4877644, 0.2905108, 0.4053053, 0, 0, 0, 1, 1,
0.4908348, 0.03099706, 1.191182, 1, 1, 1, 1, 1,
0.4926124, -1.482355, 2.035231, 1, 1, 1, 1, 1,
0.5032105, 0.4276575, 0.7356327, 1, 1, 1, 1, 1,
0.5046452, -0.6559411, 0.7903152, 1, 1, 1, 1, 1,
0.5059806, 1.341329, 0.07024033, 1, 1, 1, 1, 1,
0.5066802, -1.08891, 0.8305165, 1, 1, 1, 1, 1,
0.5081366, -1.242271, 1.681547, 1, 1, 1, 1, 1,
0.5087197, -0.3459185, 1.28853, 1, 1, 1, 1, 1,
0.5113124, -0.2127625, 2.307341, 1, 1, 1, 1, 1,
0.5149522, -0.9565009, 2.893321, 1, 1, 1, 1, 1,
0.517804, -0.7843208, 2.971313, 1, 1, 1, 1, 1,
0.517942, -1.111709, 1.672646, 1, 1, 1, 1, 1,
0.5179995, 0.6845711, 1.01783, 1, 1, 1, 1, 1,
0.521525, 0.971242, 1.002405, 1, 1, 1, 1, 1,
0.5222931, -0.8315607, 2.110241, 1, 1, 1, 1, 1,
0.5249, -0.1834239, 2.255112, 0, 0, 1, 1, 1,
0.529285, 0.2189772, 2.14478, 1, 0, 0, 1, 1,
0.5313547, -1.672278, 4.015644, 1, 0, 0, 1, 1,
0.5352507, 0.9972615, 1.05288, 1, 0, 0, 1, 1,
0.5372337, -0.6057372, 1.265096, 1, 0, 0, 1, 1,
0.5531291, 0.6856186, -0.1376824, 1, 0, 0, 1, 1,
0.5567625, -1.485481, 1.51696, 0, 0, 0, 1, 1,
0.5610692, -0.05557023, 0.9888808, 0, 0, 0, 1, 1,
0.5688218, -0.1515381, 1.291389, 0, 0, 0, 1, 1,
0.572185, -1.015847, 4.635221, 0, 0, 0, 1, 1,
0.580301, 0.3490343, 0.8000233, 0, 0, 0, 1, 1,
0.5825497, -0.9901034, 2.535266, 0, 0, 0, 1, 1,
0.5874152, 1.463886, -0.01985958, 0, 0, 0, 1, 1,
0.5875011, -0.5256805, 2.256059, 1, 1, 1, 1, 1,
0.5944711, 0.7514465, -0.3939022, 1, 1, 1, 1, 1,
0.600868, 0.5729959, -0.0861256, 1, 1, 1, 1, 1,
0.6016341, -0.3956591, 1.365899, 1, 1, 1, 1, 1,
0.6026384, 1.08605, -0.8657956, 1, 1, 1, 1, 1,
0.6027179, 1.484457, 1.298261, 1, 1, 1, 1, 1,
0.6039056, 0.9484843, 0.03462392, 1, 1, 1, 1, 1,
0.606827, -0.775023, 3.326494, 1, 1, 1, 1, 1,
0.6103415, -0.1406328, 0.6098303, 1, 1, 1, 1, 1,
0.6105248, -1.129508, 2.788819, 1, 1, 1, 1, 1,
0.6106603, 0.1762161, 1.489801, 1, 1, 1, 1, 1,
0.6116818, 1.122655, -1.636541, 1, 1, 1, 1, 1,
0.61336, -1.360914, 2.451979, 1, 1, 1, 1, 1,
0.6148234, -0.1435619, 2.460011, 1, 1, 1, 1, 1,
0.6185298, 0.534964, 2.180619, 1, 1, 1, 1, 1,
0.6228738, -0.6691111, 3.183063, 0, 0, 1, 1, 1,
0.6294523, -0.3115084, 1.281866, 1, 0, 0, 1, 1,
0.6297359, -1.105564, 1.260542, 1, 0, 0, 1, 1,
0.6357997, -0.9706497, 2.998781, 1, 0, 0, 1, 1,
0.636997, -1.08046, 2.061643, 1, 0, 0, 1, 1,
0.6419036, -1.189181, 2.841386, 1, 0, 0, 1, 1,
0.6431378, -0.1557643, 1.272806, 0, 0, 0, 1, 1,
0.645752, 0.2089387, 1.276861, 0, 0, 0, 1, 1,
0.6508352, 0.8418051, 0.8091512, 0, 0, 0, 1, 1,
0.6519637, -0.8682531, 3.098294, 0, 0, 0, 1, 1,
0.6603875, 0.9646766, -0.1479362, 0, 0, 0, 1, 1,
0.6621812, 1.227276, 1.930441, 0, 0, 0, 1, 1,
0.6627111, -1.294106, 4.033917, 0, 0, 0, 1, 1,
0.6711214, 0.9049811, 0.9501395, 1, 1, 1, 1, 1,
0.6730683, -0.5641592, 2.185039, 1, 1, 1, 1, 1,
0.6780318, -0.3284132, 2.364357, 1, 1, 1, 1, 1,
0.6782345, -0.0350245, 1.023393, 1, 1, 1, 1, 1,
0.6787925, 0.3616221, 0.231693, 1, 1, 1, 1, 1,
0.6837522, -1.801064, 1.506786, 1, 1, 1, 1, 1,
0.6839432, -0.814325, 2.890321, 1, 1, 1, 1, 1,
0.689042, 0.8518966, 0.8083062, 1, 1, 1, 1, 1,
0.6932502, -0.9163931, 3.603778, 1, 1, 1, 1, 1,
0.6991469, -1.86081, 2.207808, 1, 1, 1, 1, 1,
0.6997323, 0.3028127, 1.987594, 1, 1, 1, 1, 1,
0.7019252, -2.022764, 2.389383, 1, 1, 1, 1, 1,
0.7046993, 0.1469484, 1.770128, 1, 1, 1, 1, 1,
0.7066828, 0.1446084, 0.9489461, 1, 1, 1, 1, 1,
0.7073847, -1.087585, 3.32798, 1, 1, 1, 1, 1,
0.7185992, -1.91957, 3.014435, 0, 0, 1, 1, 1,
0.7246703, -0.191062, 1.890236, 1, 0, 0, 1, 1,
0.7272976, 1.325876, -0.2757923, 1, 0, 0, 1, 1,
0.7283643, 0.8960652, 0.7379059, 1, 0, 0, 1, 1,
0.7320684, -0.6065567, 1.627709, 1, 0, 0, 1, 1,
0.7328736, 0.1060491, 1.811181, 1, 0, 0, 1, 1,
0.7353364, 0.8203312, 2.241423, 0, 0, 0, 1, 1,
0.7397166, -0.2439569, 2.689979, 0, 0, 0, 1, 1,
0.7440608, 0.350984, -0.02019092, 0, 0, 0, 1, 1,
0.7458438, -0.2582704, 2.763904, 0, 0, 0, 1, 1,
0.7467206, 1.268723, -0.476242, 0, 0, 0, 1, 1,
0.7472355, 0.3422381, 0.8313644, 0, 0, 0, 1, 1,
0.7478013, -0.08420148, 2.863595, 0, 0, 0, 1, 1,
0.747815, 1.063558, -0.08759297, 1, 1, 1, 1, 1,
0.7533814, 2.16676, 0.3673127, 1, 1, 1, 1, 1,
0.765137, 0.4374745, -0.06700412, 1, 1, 1, 1, 1,
0.7658799, 0.04848948, 0.7660977, 1, 1, 1, 1, 1,
0.7745112, -0.4247287, 2.488091, 1, 1, 1, 1, 1,
0.7753502, -2.443385, 2.832649, 1, 1, 1, 1, 1,
0.780531, -2.582683, 2.314456, 1, 1, 1, 1, 1,
0.7880474, 0.2402511, 1.273939, 1, 1, 1, 1, 1,
0.7972967, -1.396725, 0.5787107, 1, 1, 1, 1, 1,
0.8018357, -0.5585427, 2.953709, 1, 1, 1, 1, 1,
0.8047646, 1.740453, -1.123385, 1, 1, 1, 1, 1,
0.810483, 1.350558, 1.853207, 1, 1, 1, 1, 1,
0.8175218, -0.9754429, 1.947399, 1, 1, 1, 1, 1,
0.8237193, -0.4475467, 2.338453, 1, 1, 1, 1, 1,
0.8263191, 0.08059442, 2.148131, 1, 1, 1, 1, 1,
0.8313895, -0.731199, 0.2747841, 0, 0, 1, 1, 1,
0.8342267, -0.03173354, 1.094889, 1, 0, 0, 1, 1,
0.8347782, -1.574074, 2.475225, 1, 0, 0, 1, 1,
0.8361588, 0.6815333, 1.274319, 1, 0, 0, 1, 1,
0.842401, 0.1133216, 1.783221, 1, 0, 0, 1, 1,
0.8441943, -0.9801834, 1.5884, 1, 0, 0, 1, 1,
0.8444371, -0.8245469, 2.532087, 0, 0, 0, 1, 1,
0.8479902, -2.004617, 3.245698, 0, 0, 0, 1, 1,
0.8514385, -0.04400371, 1.571215, 0, 0, 0, 1, 1,
0.8539777, -0.3140715, 2.876409, 0, 0, 0, 1, 1,
0.8558122, 1.053065, -0.2541851, 0, 0, 0, 1, 1,
0.8567897, -0.4574093, 0.4548635, 0, 0, 0, 1, 1,
0.8578281, -0.4035992, 3.282961, 0, 0, 0, 1, 1,
0.8579361, 0.6436762, 0.4920998, 1, 1, 1, 1, 1,
0.8594916, 0.7319103, -0.5865211, 1, 1, 1, 1, 1,
0.8615908, 0.6372918, 1.226253, 1, 1, 1, 1, 1,
0.8653248, 0.6467581, 0.1040578, 1, 1, 1, 1, 1,
0.8661987, -0.9396753, 1.492207, 1, 1, 1, 1, 1,
0.8662448, 0.230095, 2.071258, 1, 1, 1, 1, 1,
0.8694473, 0.73549, -0.9736403, 1, 1, 1, 1, 1,
0.87256, 0.5410025, 0.8964531, 1, 1, 1, 1, 1,
0.8817381, 1.082297, 0.265225, 1, 1, 1, 1, 1,
0.8869944, -1.218023, 0.553974, 1, 1, 1, 1, 1,
0.8888284, 1.038717, 1.261514, 1, 1, 1, 1, 1,
0.8934551, -1.658408, 2.180501, 1, 1, 1, 1, 1,
0.8961053, -0.4467078, 1.562925, 1, 1, 1, 1, 1,
0.8980358, 0.07541826, 0.1372775, 1, 1, 1, 1, 1,
0.899606, -1.16455, 1.994539, 1, 1, 1, 1, 1,
0.900135, -0.16965, 2.211452, 0, 0, 1, 1, 1,
0.9047367, -0.4898093, 3.230659, 1, 0, 0, 1, 1,
0.9126393, -0.6385075, 2.18245, 1, 0, 0, 1, 1,
0.9132969, -0.5509776, 0.8552189, 1, 0, 0, 1, 1,
0.9160652, 0.3955023, 1.977984, 1, 0, 0, 1, 1,
0.9171227, 0.8350465, 1.375232, 1, 0, 0, 1, 1,
0.9175744, 0.3212332, 1.12281, 0, 0, 0, 1, 1,
0.9204856, -1.689396, 1.736522, 0, 0, 0, 1, 1,
0.9208755, 0.3129058, 1.613858, 0, 0, 0, 1, 1,
0.921799, -0.756118, 3.333563, 0, 0, 0, 1, 1,
0.9285511, -0.3771566, 2.244274, 0, 0, 0, 1, 1,
0.9330668, 0.9886451, 1.198841, 0, 0, 0, 1, 1,
0.933374, 0.03173149, 0.9044164, 0, 0, 0, 1, 1,
0.9338964, 0.8748291, -1.644313e-05, 1, 1, 1, 1, 1,
0.9360999, -0.9667149, 2.447295, 1, 1, 1, 1, 1,
0.939127, -0.4107273, 2.695851, 1, 1, 1, 1, 1,
0.9473279, -0.1385001, 0.2814442, 1, 1, 1, 1, 1,
0.9522967, -0.05395014, 1.628159, 1, 1, 1, 1, 1,
0.9537649, -0.05704845, 3.015052, 1, 1, 1, 1, 1,
0.9542076, -0.09042384, 1.212016, 1, 1, 1, 1, 1,
0.9727753, -2.276649, 3.444346, 1, 1, 1, 1, 1,
0.9789193, 1.113296, -0.3666684, 1, 1, 1, 1, 1,
0.9813961, 0.1329738, 2.186042, 1, 1, 1, 1, 1,
1.001082, 1.798781, 0.2212611, 1, 1, 1, 1, 1,
1.004789, -0.9050527, 3.060851, 1, 1, 1, 1, 1,
1.009211, -1.875585, 2.508426, 1, 1, 1, 1, 1,
1.014865, 0.02728597, 1.189671, 1, 1, 1, 1, 1,
1.016434, -0.5027804, 0.1237414, 1, 1, 1, 1, 1,
1.017008, -1.228203, 4.288747, 0, 0, 1, 1, 1,
1.021599, -0.2830122, 2.644404, 1, 0, 0, 1, 1,
1.025765, -0.6129175, 1.531325, 1, 0, 0, 1, 1,
1.032621, 0.3038739, 2.08932, 1, 0, 0, 1, 1,
1.040576, 0.1576522, 1.701514, 1, 0, 0, 1, 1,
1.044637, 0.05753898, 2.575681, 1, 0, 0, 1, 1,
1.054777, 1.525792, 0.6720781, 0, 0, 0, 1, 1,
1.057642, 0.226843, 1.8812, 0, 0, 0, 1, 1,
1.059887, -0.6815522, 1.273659, 0, 0, 0, 1, 1,
1.061527, 0.1889943, 3.00776, 0, 0, 0, 1, 1,
1.069348, 0.1492095, 4.246934, 0, 0, 0, 1, 1,
1.069834, 2.843238, 0.8815683, 0, 0, 0, 1, 1,
1.069863, -0.9276746, 0.7868921, 0, 0, 0, 1, 1,
1.073663, 2.10365, -0.5263472, 1, 1, 1, 1, 1,
1.074872, 2.628678, 0.1239513, 1, 1, 1, 1, 1,
1.077379, 0.4752631, 1.156972, 1, 1, 1, 1, 1,
1.083638, 1.873932, 1.21816, 1, 1, 1, 1, 1,
1.085322, 1.594903, 2.397984, 1, 1, 1, 1, 1,
1.087875, 0.7278028, 2.088161, 1, 1, 1, 1, 1,
1.091343, 1.26897, 0.6468361, 1, 1, 1, 1, 1,
1.095028, 0.4602029, 0.1274701, 1, 1, 1, 1, 1,
1.095083, -0.9489218, 1.226392, 1, 1, 1, 1, 1,
1.095127, 0.2876713, 1.5473, 1, 1, 1, 1, 1,
1.099602, -0.2795971, 2.405054, 1, 1, 1, 1, 1,
1.100677, -0.7845638, 0.8073485, 1, 1, 1, 1, 1,
1.101689, -1.062215, 1.365772, 1, 1, 1, 1, 1,
1.113263, -0.0658301, 1.731427, 1, 1, 1, 1, 1,
1.124159, 0.6079129, 2.421259, 1, 1, 1, 1, 1,
1.127514, 1.542656, 0.7918022, 0, 0, 1, 1, 1,
1.128461, -0.8528202, 1.750092, 1, 0, 0, 1, 1,
1.131566, 1.18609, -0.6596015, 1, 0, 0, 1, 1,
1.135548, -1.444029, 3.22192, 1, 0, 0, 1, 1,
1.136116, 1.438234, 0.7188445, 1, 0, 0, 1, 1,
1.139191, 0.5107354, 1.6477, 1, 0, 0, 1, 1,
1.149164, -0.478577, 2.461359, 0, 0, 0, 1, 1,
1.156857, -1.240988, -0.549452, 0, 0, 0, 1, 1,
1.159569, -1.446686, 2.936192, 0, 0, 0, 1, 1,
1.162243, -2.479575, 1.161032, 0, 0, 0, 1, 1,
1.166318, -0.3483098, 3.103657, 0, 0, 0, 1, 1,
1.169515, -1.085917, 3.130935, 0, 0, 0, 1, 1,
1.175352, -1.171677, 2.185533, 0, 0, 0, 1, 1,
1.178554, 1.044098, 1.554933, 1, 1, 1, 1, 1,
1.180674, 0.869927, 2.033504, 1, 1, 1, 1, 1,
1.180689, -1.859262, 1.268694, 1, 1, 1, 1, 1,
1.182471, 1.051723, 0.1444448, 1, 1, 1, 1, 1,
1.184453, -0.4674432, 2.247516, 1, 1, 1, 1, 1,
1.185073, 0.01717542, 1.787032, 1, 1, 1, 1, 1,
1.185245, -1.377273, -0.2215248, 1, 1, 1, 1, 1,
1.194576, -1.839035, 2.685447, 1, 1, 1, 1, 1,
1.195121, 1.344061, 3.466059, 1, 1, 1, 1, 1,
1.201444, 0.3774502, 1.121996, 1, 1, 1, 1, 1,
1.202725, 2.539593, 0.1269913, 1, 1, 1, 1, 1,
1.209951, 0.275334, 1.489697, 1, 1, 1, 1, 1,
1.211927, 1.067876, 1.109416, 1, 1, 1, 1, 1,
1.219289, 0.9994351, -0.5651807, 1, 1, 1, 1, 1,
1.231256, -0.443633, 3.524383, 1, 1, 1, 1, 1,
1.241011, -1.16082, 1.058095, 0, 0, 1, 1, 1,
1.246582, 1.120704, -0.1667967, 1, 0, 0, 1, 1,
1.247967, -0.1119783, 0.7395037, 1, 0, 0, 1, 1,
1.24928, -0.8693842, 3.637378, 1, 0, 0, 1, 1,
1.254453, -1.249371, 2.788558, 1, 0, 0, 1, 1,
1.256999, -1.926197, 4.296672, 1, 0, 0, 1, 1,
1.268836, 0.2979626, 0.5859464, 0, 0, 0, 1, 1,
1.271218, -1.624297, 4.875863, 0, 0, 0, 1, 1,
1.271735, -0.7058969, 2.16021, 0, 0, 0, 1, 1,
1.272946, 0.3484329, 2.821757, 0, 0, 0, 1, 1,
1.27379, -1.023679, 4.031885, 0, 0, 0, 1, 1,
1.283774, -1.278518, 2.205351, 0, 0, 0, 1, 1,
1.283792, -1.577215, 3.577779, 0, 0, 0, 1, 1,
1.29104, -0.8207411, -0.1106823, 1, 1, 1, 1, 1,
1.291337, -0.5251378, 1.498993, 1, 1, 1, 1, 1,
1.294031, -2.671743, 0.6487269, 1, 1, 1, 1, 1,
1.300582, 0.1464808, 1.041148, 1, 1, 1, 1, 1,
1.305045, -2.742479, 3.387665, 1, 1, 1, 1, 1,
1.308481, -0.1681378, 2.905697, 1, 1, 1, 1, 1,
1.310797, -0.0871831, 2.294312, 1, 1, 1, 1, 1,
1.31258, -0.303838, 1.057452, 1, 1, 1, 1, 1,
1.322046, 1.035698, 1.966252, 1, 1, 1, 1, 1,
1.325376, 0.4085599, 1.34766, 1, 1, 1, 1, 1,
1.325818, 1.225576, 0.7647077, 1, 1, 1, 1, 1,
1.340739, 1.275877, 0.4261923, 1, 1, 1, 1, 1,
1.342774, -0.09740005, 0.695484, 1, 1, 1, 1, 1,
1.349149, 1.259774, 1.390386, 1, 1, 1, 1, 1,
1.35261, -1.823045, 1.718892, 1, 1, 1, 1, 1,
1.362391, -1.354797, 2.47649, 0, 0, 1, 1, 1,
1.365109, 1.96727, 1.654367, 1, 0, 0, 1, 1,
1.365699, -0.5631512, -0.02688727, 1, 0, 0, 1, 1,
1.373801, 2.242115, -0.3689679, 1, 0, 0, 1, 1,
1.374981, 1.083903, -1.39905, 1, 0, 0, 1, 1,
1.380316, 0.2845166, 0.4873882, 1, 0, 0, 1, 1,
1.38822, -0.9542207, 0.177688, 0, 0, 0, 1, 1,
1.392255, 1.871774, -0.45367, 0, 0, 0, 1, 1,
1.395133, 0.7109788, 1.504503, 0, 0, 0, 1, 1,
1.403026, -0.07830351, 0.5760683, 0, 0, 0, 1, 1,
1.411674, -0.5559208, 1.681594, 0, 0, 0, 1, 1,
1.447671, -0.1295928, 3.17788, 0, 0, 0, 1, 1,
1.466253, 0.1728644, -0.5348224, 0, 0, 0, 1, 1,
1.468016, -0.2461979, 2.44853, 1, 1, 1, 1, 1,
1.47074, 1.413799, 0.5325614, 1, 1, 1, 1, 1,
1.473186, -0.4408103, 2.771041, 1, 1, 1, 1, 1,
1.481687, -0.3843147, 2.530288, 1, 1, 1, 1, 1,
1.483116, -0.5275372, 2.710688, 1, 1, 1, 1, 1,
1.500716, 0.4703327, 1.969671, 1, 1, 1, 1, 1,
1.506933, -1.234255, 1.574637, 1, 1, 1, 1, 1,
1.507113, -0.1121365, 2.380485, 1, 1, 1, 1, 1,
1.55757, -0.7713694, 1.737693, 1, 1, 1, 1, 1,
1.580602, -0.1553024, 1.480014, 1, 1, 1, 1, 1,
1.587693, 0.01454112, 1.669518, 1, 1, 1, 1, 1,
1.588875, 0.2089402, 1.575968, 1, 1, 1, 1, 1,
1.591368, 0.4793192, 0.2300635, 1, 1, 1, 1, 1,
1.598159, 1.788281, 0.7820055, 1, 1, 1, 1, 1,
1.599835, -0.771104, 2.026575, 1, 1, 1, 1, 1,
1.622326, -0.8448023, 0.3853409, 0, 0, 1, 1, 1,
1.632962, -0.1466032, 2.250959, 1, 0, 0, 1, 1,
1.636156, 0.4923681, 2.389803, 1, 0, 0, 1, 1,
1.671592, 1.056923, 2.099198, 1, 0, 0, 1, 1,
1.680967, -1.290982, 1.961687, 1, 0, 0, 1, 1,
1.682632, -0.3327393, 2.557217, 1, 0, 0, 1, 1,
1.685126, -1.753137, 3.059021, 0, 0, 0, 1, 1,
1.699974, 0.6100502, 2.464818, 0, 0, 0, 1, 1,
1.708289, -0.126155, 1.932433, 0, 0, 0, 1, 1,
1.737029, -0.1515467, 0.7681601, 0, 0, 0, 1, 1,
1.745814, -1.790956, 1.457375, 0, 0, 0, 1, 1,
1.754722, 0.351256, 2.485402, 0, 0, 0, 1, 1,
1.790629, 0.9937876, 2.866822, 0, 0, 0, 1, 1,
1.809306, -0.9020879, 1.859133, 1, 1, 1, 1, 1,
1.809525, 0.3554794, 2.150703, 1, 1, 1, 1, 1,
1.811504, -0.3318461, 2.249807, 1, 1, 1, 1, 1,
1.814043, -0.3917909, 2.708815, 1, 1, 1, 1, 1,
1.829809, -0.1809765, 1.413561, 1, 1, 1, 1, 1,
1.862017, 0.7689466, 2.671968, 1, 1, 1, 1, 1,
1.954807, -0.2800442, 1.824372, 1, 1, 1, 1, 1,
1.96575, 1.567549, 2.543777, 1, 1, 1, 1, 1,
2.004687, -0.7113618, 1.378884, 1, 1, 1, 1, 1,
2.058779, -0.9295693, 3.97566, 1, 1, 1, 1, 1,
2.108494, -0.08942941, 1.790752, 1, 1, 1, 1, 1,
2.127663, 0.6167031, 2.337373, 1, 1, 1, 1, 1,
2.127873, 0.09033213, 0.6224274, 1, 1, 1, 1, 1,
2.132849, -1.239381, 3.116384, 1, 1, 1, 1, 1,
2.178448, -0.005892684, 0.1791765, 1, 1, 1, 1, 1,
2.189759, 1.178605, 2.53059, 0, 0, 1, 1, 1,
2.195304, -0.1900661, 0.5152123, 1, 0, 0, 1, 1,
2.244059, -0.5233138, 2.261924, 1, 0, 0, 1, 1,
2.247148, -0.6637489, 0.2555667, 1, 0, 0, 1, 1,
2.304826, 1.022422, 1.371711, 1, 0, 0, 1, 1,
2.306617, 1.852871, 0.2927519, 1, 0, 0, 1, 1,
2.313059, -0.5487518, 1.138763, 0, 0, 0, 1, 1,
2.344221, 0.3271491, 0.3680446, 0, 0, 0, 1, 1,
2.396328, 1.697073, -0.2129508, 0, 0, 0, 1, 1,
2.473234, -0.01849514, 2.51144, 0, 0, 0, 1, 1,
2.484134, 2.275157, 0.8880023, 0, 0, 0, 1, 1,
2.499102, -0.5368117, 0.9846925, 0, 0, 0, 1, 1,
2.502803, 1.029695, 1.801956, 0, 0, 0, 1, 1,
2.616632, -1.279927, 1.697355, 1, 1, 1, 1, 1,
2.631091, 1.296018, 0.8802742, 1, 1, 1, 1, 1,
2.634404, 0.4555027, 1.527356, 1, 1, 1, 1, 1,
2.651861, -0.1459066, 2.185443, 1, 1, 1, 1, 1,
2.671055, 0.173886, 2.291203, 1, 1, 1, 1, 1,
2.727535, 0.1684692, 1.275406, 1, 1, 1, 1, 1,
2.84622, -0.04278923, 4.015206, 1, 1, 1, 1, 1
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
var radius = 9.827039;
var distance = 34.51706;
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
mvMatrix.translate( 0.1806622, -0.2173944, 0.1847908 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.51706);
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