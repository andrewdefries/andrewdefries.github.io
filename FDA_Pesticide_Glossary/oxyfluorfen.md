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
-3.288993, 2.315678, -2.454331, 1, 0, 0, 1,
-3.237468, 0.1021239, -3.364825, 1, 0.007843138, 0, 1,
-2.742563, -1.138409, -2.450907, 1, 0.01176471, 0, 1,
-2.529552, 0.6015162, -1.985976, 1, 0.01960784, 0, 1,
-2.408496, 1.747607, 0.4193507, 1, 0.02352941, 0, 1,
-2.328592, -1.961027, 0.1795382, 1, 0.03137255, 0, 1,
-2.324289, 1.669601, 0.7626379, 1, 0.03529412, 0, 1,
-2.316286, -0.8732079, -2.289803, 1, 0.04313726, 0, 1,
-2.267626, -0.4880452, -1.841009, 1, 0.04705882, 0, 1,
-2.264291, -0.5133868, -0.1923455, 1, 0.05490196, 0, 1,
-2.233271, 0.3417437, -1.658704, 1, 0.05882353, 0, 1,
-2.203869, -1.005257, -1.858815, 1, 0.06666667, 0, 1,
-2.191729, 0.7397209, -2.031187, 1, 0.07058824, 0, 1,
-2.175294, -1.067793, -0.8123592, 1, 0.07843138, 0, 1,
-2.151087, -0.556976, -1.819809, 1, 0.08235294, 0, 1,
-2.14081, 0.5978113, 0.2057374, 1, 0.09019608, 0, 1,
-2.117046, 1.534729, -1.703953, 1, 0.09411765, 0, 1,
-2.103165, 0.1241116, -0.8137684, 1, 0.1019608, 0, 1,
-2.063802, 1.209691, -1.291487, 1, 0.1098039, 0, 1,
-2.04516, -0.4338535, -3.0037, 1, 0.1137255, 0, 1,
-2.035531, -0.6445556, -1.837559, 1, 0.1215686, 0, 1,
-2.009926, -0.9570317, -2.353491, 1, 0.1254902, 0, 1,
-1.978529, 0.4778464, 0.2146298, 1, 0.1333333, 0, 1,
-1.978478, -1.598295, -3.103946, 1, 0.1372549, 0, 1,
-1.966001, -1.484141, -2.344277, 1, 0.145098, 0, 1,
-1.947408, 1.002398, -2.766812, 1, 0.1490196, 0, 1,
-1.919978, 0.7816159, 0.7286286, 1, 0.1568628, 0, 1,
-1.889501, -0.651687, -1.523237, 1, 0.1607843, 0, 1,
-1.887459, 0.578711, -1.435863, 1, 0.1686275, 0, 1,
-1.88408, -0.2768818, -3.755129, 1, 0.172549, 0, 1,
-1.842412, 1.552412, -0.1351737, 1, 0.1803922, 0, 1,
-1.811747, -0.7336795, -2.593365, 1, 0.1843137, 0, 1,
-1.802709, -0.8550175, -1.976539, 1, 0.1921569, 0, 1,
-1.799965, 1.296953, -0.8497084, 1, 0.1960784, 0, 1,
-1.772346, 1.144525, -3.001775, 1, 0.2039216, 0, 1,
-1.747398, 0.673515, -0.606142, 1, 0.2117647, 0, 1,
-1.739163, 1.703952, -0.7784875, 1, 0.2156863, 0, 1,
-1.729826, -1.793931, -5.613022, 1, 0.2235294, 0, 1,
-1.727981, 0.4315813, -1.085725, 1, 0.227451, 0, 1,
-1.71644, 0.6357528, -2.538346, 1, 0.2352941, 0, 1,
-1.699638, 1.994541, -0.6313212, 1, 0.2392157, 0, 1,
-1.695798, -0.9409583, -1.557961, 1, 0.2470588, 0, 1,
-1.695255, 0.1608246, -0.3455149, 1, 0.2509804, 0, 1,
-1.691947, 0.09478164, -1.689469, 1, 0.2588235, 0, 1,
-1.690166, -0.1548319, -1.136356, 1, 0.2627451, 0, 1,
-1.688777, 0.210913, -3.057512, 1, 0.2705882, 0, 1,
-1.687458, 2.198467, 2.602447, 1, 0.2745098, 0, 1,
-1.666956, -1.588575, -2.930789, 1, 0.282353, 0, 1,
-1.662454, -0.3387362, -0.8102006, 1, 0.2862745, 0, 1,
-1.651624, 0.283224, -1.753964, 1, 0.2941177, 0, 1,
-1.633015, -0.1869091, -1.302417, 1, 0.3019608, 0, 1,
-1.626691, -0.7266319, -2.099084, 1, 0.3058824, 0, 1,
-1.623247, 0.5609143, -1.039216, 1, 0.3137255, 0, 1,
-1.623072, 1.562966, -0.8403984, 1, 0.3176471, 0, 1,
-1.615626, 0.7084509, -1.068434, 1, 0.3254902, 0, 1,
-1.614963, -1.10576, -4.737405, 1, 0.3294118, 0, 1,
-1.610989, 1.01038, -1.001761, 1, 0.3372549, 0, 1,
-1.601967, -0.08932266, 1.16536, 1, 0.3411765, 0, 1,
-1.599724, 1.39707, -1.450948, 1, 0.3490196, 0, 1,
-1.596291, 0.8262666, -1.960288, 1, 0.3529412, 0, 1,
-1.596019, 0.2034868, -2.855693, 1, 0.3607843, 0, 1,
-1.579982, 1.123656, -0.9581719, 1, 0.3647059, 0, 1,
-1.561165, 0.3578909, -1.415209, 1, 0.372549, 0, 1,
-1.54962, 0.002830788, -1.072139, 1, 0.3764706, 0, 1,
-1.538233, -0.9180034, -2.794357, 1, 0.3843137, 0, 1,
-1.523961, -0.8213657, -0.8284107, 1, 0.3882353, 0, 1,
-1.520746, 0.940052, -1.264818, 1, 0.3960784, 0, 1,
-1.495266, -0.1236722, -2.324217, 1, 0.4039216, 0, 1,
-1.491297, 0.1643909, -3.188512, 1, 0.4078431, 0, 1,
-1.476846, 0.3838371, -2.625748, 1, 0.4156863, 0, 1,
-1.476062, -0.8663021, -3.151363, 1, 0.4196078, 0, 1,
-1.457537, 0.03692806, -1.008811, 1, 0.427451, 0, 1,
-1.456935, -0.4259539, -1.12029, 1, 0.4313726, 0, 1,
-1.453786, 0.186273, -0.3510696, 1, 0.4392157, 0, 1,
-1.453545, -0.3514117, -3.377595, 1, 0.4431373, 0, 1,
-1.45023, -0.1501429, -2.076625, 1, 0.4509804, 0, 1,
-1.445056, -0.6222277, -1.487108, 1, 0.454902, 0, 1,
-1.430306, -0.3430239, -0.9922158, 1, 0.4627451, 0, 1,
-1.426441, -0.03491242, -0.5649678, 1, 0.4666667, 0, 1,
-1.413438, 0.0765318, -1.586308, 1, 0.4745098, 0, 1,
-1.404598, 0.443522, -1.462287, 1, 0.4784314, 0, 1,
-1.394647, -0.7093014, -2.669457, 1, 0.4862745, 0, 1,
-1.392141, -1.224573, -2.68154, 1, 0.4901961, 0, 1,
-1.386343, -0.8635239, -1.360416, 1, 0.4980392, 0, 1,
-1.384912, -0.1934705, -2.623403, 1, 0.5058824, 0, 1,
-1.38287, -0.09881048, -1.968905, 1, 0.509804, 0, 1,
-1.378596, -0.778244, -3.780511, 1, 0.5176471, 0, 1,
-1.378194, -1.186299, -1.160458, 1, 0.5215687, 0, 1,
-1.374368, 2.531269, -0.7952307, 1, 0.5294118, 0, 1,
-1.370421, -0.9081089, -1.662658, 1, 0.5333334, 0, 1,
-1.367757, -2.550466, -2.878262, 1, 0.5411765, 0, 1,
-1.360606, -0.1733192, -2.920537, 1, 0.5450981, 0, 1,
-1.354884, -1.107937, -3.427384, 1, 0.5529412, 0, 1,
-1.353456, 0.4124152, -0.7308478, 1, 0.5568628, 0, 1,
-1.339704, 1.505957, -1.811888, 1, 0.5647059, 0, 1,
-1.339042, -2.269735, -3.514891, 1, 0.5686275, 0, 1,
-1.337334, -0.3224153, -2.659128, 1, 0.5764706, 0, 1,
-1.328889, 0.6546357, -2.506248, 1, 0.5803922, 0, 1,
-1.321161, 0.2743233, 0.4270577, 1, 0.5882353, 0, 1,
-1.320488, 0.5502071, -0.7718161, 1, 0.5921569, 0, 1,
-1.310377, -1.228075, -1.167153, 1, 0.6, 0, 1,
-1.304796, -1.323169, -1.90764, 1, 0.6078432, 0, 1,
-1.292568, 1.236022, -0.4095685, 1, 0.6117647, 0, 1,
-1.283768, 0.4418231, -2.032252, 1, 0.6196079, 0, 1,
-1.281853, 2.113535, -1.546642, 1, 0.6235294, 0, 1,
-1.275406, -0.3040256, -1.11995, 1, 0.6313726, 0, 1,
-1.272535, -0.5332053, -2.121649, 1, 0.6352941, 0, 1,
-1.265853, 0.6229802, -1.208062, 1, 0.6431373, 0, 1,
-1.258748, -0.142548, -1.332366, 1, 0.6470588, 0, 1,
-1.257918, 0.1606552, 0.3089042, 1, 0.654902, 0, 1,
-1.25572, -0.4898987, -1.42426, 1, 0.6588235, 0, 1,
-1.252843, 0.5877858, -0.8882169, 1, 0.6666667, 0, 1,
-1.249676, -0.4225056, -1.18303, 1, 0.6705883, 0, 1,
-1.245754, -0.3316189, -0.5067201, 1, 0.6784314, 0, 1,
-1.24203, 1.676079, -0.9005642, 1, 0.682353, 0, 1,
-1.232251, -0.8264922, -1.283525, 1, 0.6901961, 0, 1,
-1.231582, -0.8464372, -2.649539, 1, 0.6941177, 0, 1,
-1.22958, 0.203713, -1.889264, 1, 0.7019608, 0, 1,
-1.223768, -1.302135, -2.028269, 1, 0.7098039, 0, 1,
-1.220145, -0.8672659, -3.20259, 1, 0.7137255, 0, 1,
-1.210817, -0.01748621, -1.824039, 1, 0.7215686, 0, 1,
-1.206506, -0.5495377, -0.9249628, 1, 0.7254902, 0, 1,
-1.196879, -1.403901, -4.056862, 1, 0.7333333, 0, 1,
-1.192581, 0.1137799, -2.05599, 1, 0.7372549, 0, 1,
-1.191104, -0.7848329, -3.446174, 1, 0.7450981, 0, 1,
-1.186967, -0.5073237, -2.157612, 1, 0.7490196, 0, 1,
-1.174007, 0.4376268, 0.00465256, 1, 0.7568628, 0, 1,
-1.172536, -0.9770586, -2.370082, 1, 0.7607843, 0, 1,
-1.163039, 0.1913605, -2.447551, 1, 0.7686275, 0, 1,
-1.15595, -0.379478, -1.750164, 1, 0.772549, 0, 1,
-1.140091, -2.103286, -1.696957, 1, 0.7803922, 0, 1,
-1.124979, 0.3564569, -0.8241792, 1, 0.7843137, 0, 1,
-1.117347, 1.663976, 0.5898309, 1, 0.7921569, 0, 1,
-1.113383, -2.066058, -2.34024, 1, 0.7960784, 0, 1,
-1.111419, -0.5266442, -2.177374, 1, 0.8039216, 0, 1,
-1.107756, 0.4618362, -0.2317806, 1, 0.8117647, 0, 1,
-1.101193, -1.162061, -1.526201, 1, 0.8156863, 0, 1,
-1.084554, 0.3060986, 0.1955984, 1, 0.8235294, 0, 1,
-1.079192, 0.555207, -2.960402, 1, 0.827451, 0, 1,
-1.077878, 0.793609, -0.1503711, 1, 0.8352941, 0, 1,
-1.068148, -0.05481495, -0.9123938, 1, 0.8392157, 0, 1,
-1.054077, 0.9186997, -1.893618, 1, 0.8470588, 0, 1,
-1.043703, -0.2205998, -1.115311, 1, 0.8509804, 0, 1,
-1.041577, -0.3811008, -0.5901206, 1, 0.8588235, 0, 1,
-1.038732, 1.843417, -0.9216099, 1, 0.8627451, 0, 1,
-1.036837, 1.261459, -0.3095224, 1, 0.8705882, 0, 1,
-1.035498, -0.5670772, -1.521383, 1, 0.8745098, 0, 1,
-1.03251, -1.195291, -2.793005, 1, 0.8823529, 0, 1,
-1.026132, 0.1200825, -1.745608, 1, 0.8862745, 0, 1,
-1.021659, 0.2125364, -2.494247, 1, 0.8941177, 0, 1,
-1.017209, -0.5688816, -3.771578, 1, 0.8980392, 0, 1,
-1.00591, -0.7013323, -1.541409, 1, 0.9058824, 0, 1,
-1.001538, -1.805774, -1.41083, 1, 0.9137255, 0, 1,
-0.9966221, -1.797976, -3.47862, 1, 0.9176471, 0, 1,
-0.9934262, -2.387714, -2.110866, 1, 0.9254902, 0, 1,
-0.9899251, -1.54719, -4.61229, 1, 0.9294118, 0, 1,
-0.9873835, 0.3900302, -1.738258, 1, 0.9372549, 0, 1,
-0.9836413, 0.1172971, -1.805967, 1, 0.9411765, 0, 1,
-0.9786434, -0.3486338, -3.516365, 1, 0.9490196, 0, 1,
-0.9762894, 1.688536, 1.056189, 1, 0.9529412, 0, 1,
-0.9713154, 1.203342, 0.07652254, 1, 0.9607843, 0, 1,
-0.9687247, 1.061085, 0.03328379, 1, 0.9647059, 0, 1,
-0.9684287, 2.191359, -0.7361613, 1, 0.972549, 0, 1,
-0.9668497, 0.2707896, -2.583952, 1, 0.9764706, 0, 1,
-0.9617596, 1.221681, 0.5373927, 1, 0.9843137, 0, 1,
-0.9448382, 0.2673867, 0.2935672, 1, 0.9882353, 0, 1,
-0.9446991, -0.8133974, -2.599193, 1, 0.9960784, 0, 1,
-0.9230253, -1.243658, -1.459357, 0.9960784, 1, 0, 1,
-0.9210584, -1.093542, -1.619831, 0.9921569, 1, 0, 1,
-0.916327, -0.6754252, -2.207793, 0.9843137, 1, 0, 1,
-0.912165, 1.455827, -1.034643, 0.9803922, 1, 0, 1,
-0.9111735, 2.04736, -1.670924, 0.972549, 1, 0, 1,
-0.9025278, -0.03682052, -1.632956, 0.9686275, 1, 0, 1,
-0.8971085, 1.693434, -1.579483, 0.9607843, 1, 0, 1,
-0.8970848, -1.286079, -2.005441, 0.9568627, 1, 0, 1,
-0.8969429, -0.09163187, 0.9864511, 0.9490196, 1, 0, 1,
-0.8957612, -0.3726198, -0.9189228, 0.945098, 1, 0, 1,
-0.8939342, 0.3214336, -1.610849, 0.9372549, 1, 0, 1,
-0.8932353, 0.05605045, -2.228249, 0.9333333, 1, 0, 1,
-0.8879719, 0.3176955, -1.104807, 0.9254902, 1, 0, 1,
-0.8838559, 0.8300052, -0.728721, 0.9215686, 1, 0, 1,
-0.8815451, 1.252692, -1.557138, 0.9137255, 1, 0, 1,
-0.8814654, 0.6841297, -2.396347, 0.9098039, 1, 0, 1,
-0.8790031, 0.4698238, -0.9308301, 0.9019608, 1, 0, 1,
-0.8743635, 0.7168144, -1.540491, 0.8941177, 1, 0, 1,
-0.8725329, -1.961947, -3.978055, 0.8901961, 1, 0, 1,
-0.8696327, -1.995317, -2.588973, 0.8823529, 1, 0, 1,
-0.8633157, 0.1631747, -0.9485477, 0.8784314, 1, 0, 1,
-0.8631455, 0.05813504, -1.939702, 0.8705882, 1, 0, 1,
-0.8622515, 2.016036, 1.190115, 0.8666667, 1, 0, 1,
-0.860565, -0.6792992, -4.086684, 0.8588235, 1, 0, 1,
-0.8497695, -0.14292, -1.093226, 0.854902, 1, 0, 1,
-0.8497284, -2.443851, -2.262933, 0.8470588, 1, 0, 1,
-0.8463507, -0.3254861, -2.477554, 0.8431373, 1, 0, 1,
-0.8428973, 1.269926, -1.44084, 0.8352941, 1, 0, 1,
-0.8291073, 2.016461, -2.307159, 0.8313726, 1, 0, 1,
-0.823117, 0.5423834, 0.0476348, 0.8235294, 1, 0, 1,
-0.8132687, 0.7239196, -1.43813, 0.8196079, 1, 0, 1,
-0.8119184, -1.092756, -1.749668, 0.8117647, 1, 0, 1,
-0.8110205, 0.09711178, -1.80557, 0.8078431, 1, 0, 1,
-0.8108522, -0.4368418, -3.393185, 0.8, 1, 0, 1,
-0.8044291, -0.6053207, -0.9388928, 0.7921569, 1, 0, 1,
-0.8032538, -1.310009, -3.028859, 0.7882353, 1, 0, 1,
-0.7999713, -0.08671802, -2.252349, 0.7803922, 1, 0, 1,
-0.797779, -0.2598654, -0.5505008, 0.7764706, 1, 0, 1,
-0.7947268, -0.5202532, -1.885361, 0.7686275, 1, 0, 1,
-0.7943345, -1.042923, -2.763899, 0.7647059, 1, 0, 1,
-0.7939555, 1.863271, -2.109884, 0.7568628, 1, 0, 1,
-0.7906815, 0.7783843, -2.752405, 0.7529412, 1, 0, 1,
-0.7633116, 0.2926905, -2.608905, 0.7450981, 1, 0, 1,
-0.7570741, 1.871852, -2.145073, 0.7411765, 1, 0, 1,
-0.7565984, 0.7344739, 1.299066, 0.7333333, 1, 0, 1,
-0.7555722, 0.7783601, -1.49896, 0.7294118, 1, 0, 1,
-0.7538412, -1.344606, -5.44329, 0.7215686, 1, 0, 1,
-0.7473607, 1.51244, -0.3504169, 0.7176471, 1, 0, 1,
-0.7458315, 1.276313, -0.0672888, 0.7098039, 1, 0, 1,
-0.7450543, -0.5087215, -2.730048, 0.7058824, 1, 0, 1,
-0.7444963, -0.21983, -0.1651047, 0.6980392, 1, 0, 1,
-0.7347023, 0.1184786, -3.088912, 0.6901961, 1, 0, 1,
-0.7311511, -1.031665, -3.14214, 0.6862745, 1, 0, 1,
-0.7259842, 1.619701, -1.067858, 0.6784314, 1, 0, 1,
-0.7229961, 0.6749753, 0.05693374, 0.6745098, 1, 0, 1,
-0.7221884, 0.02939171, -0.2123461, 0.6666667, 1, 0, 1,
-0.7197861, -1.666403, -2.672922, 0.6627451, 1, 0, 1,
-0.7176255, 0.4051514, -2.469801, 0.654902, 1, 0, 1,
-0.7138394, 0.5451458, -1.798254, 0.6509804, 1, 0, 1,
-0.7137283, 0.04344446, -3.085772, 0.6431373, 1, 0, 1,
-0.7097329, -1.161219, -2.636416, 0.6392157, 1, 0, 1,
-0.6978443, -0.392188, -5.332327, 0.6313726, 1, 0, 1,
-0.6955767, -0.219256, -2.037899, 0.627451, 1, 0, 1,
-0.6925027, -1.297061, -4.102206, 0.6196079, 1, 0, 1,
-0.6910551, -0.7637782, -1.304988, 0.6156863, 1, 0, 1,
-0.690063, 0.7326065, -0.2472956, 0.6078432, 1, 0, 1,
-0.6896249, 1.091521, 0.5633513, 0.6039216, 1, 0, 1,
-0.6892658, -1.344493, -2.417993, 0.5960785, 1, 0, 1,
-0.6886426, -0.3469253, -3.318105, 0.5882353, 1, 0, 1,
-0.6772342, 0.8628922, -0.5714236, 0.5843138, 1, 0, 1,
-0.6755739, 0.7012989, -0.9028375, 0.5764706, 1, 0, 1,
-0.6715574, -0.2988696, -0.1332596, 0.572549, 1, 0, 1,
-0.6701016, 1.222557, -1.743602, 0.5647059, 1, 0, 1,
-0.6686635, -0.467068, -1.514042, 0.5607843, 1, 0, 1,
-0.6590691, 0.2170196, -0.4079312, 0.5529412, 1, 0, 1,
-0.6556587, -0.5852236, -2.721275, 0.5490196, 1, 0, 1,
-0.6419171, 1.475486, -0.5403839, 0.5411765, 1, 0, 1,
-0.6394992, -0.6030801, -2.168577, 0.5372549, 1, 0, 1,
-0.63708, -0.4692048, -3.761625, 0.5294118, 1, 0, 1,
-0.6365629, 0.9145867, 0.3911705, 0.5254902, 1, 0, 1,
-0.6352118, 0.3897156, -2.713933, 0.5176471, 1, 0, 1,
-0.6290171, -0.01829891, -2.180726, 0.5137255, 1, 0, 1,
-0.620974, 1.985332, -0.1151431, 0.5058824, 1, 0, 1,
-0.620744, -0.7625057, -0.1251757, 0.5019608, 1, 0, 1,
-0.6195085, -0.8443985, -2.275947, 0.4941176, 1, 0, 1,
-0.6190293, -0.281141, -1.908749, 0.4862745, 1, 0, 1,
-0.6178931, 0.8340321, -0.6675585, 0.4823529, 1, 0, 1,
-0.6170003, -0.7519164, -1.659301, 0.4745098, 1, 0, 1,
-0.6166073, 0.7172373, -0.9099855, 0.4705882, 1, 0, 1,
-0.6134248, 0.20644, -1.068687, 0.4627451, 1, 0, 1,
-0.6106276, -0.1274181, -0.08225451, 0.4588235, 1, 0, 1,
-0.5954377, -0.5394491, -2.983716, 0.4509804, 1, 0, 1,
-0.5944378, 0.4526628, -1.063422, 0.4470588, 1, 0, 1,
-0.5939528, 0.781067, 0.1520804, 0.4392157, 1, 0, 1,
-0.5846711, 0.07453634, -1.722477, 0.4352941, 1, 0, 1,
-0.5840665, -1.124175, -1.981332, 0.427451, 1, 0, 1,
-0.582691, -0.3899246, -2.25823, 0.4235294, 1, 0, 1,
-0.576939, -0.400044, -2.486222, 0.4156863, 1, 0, 1,
-0.5740794, -0.8654056, -2.958, 0.4117647, 1, 0, 1,
-0.5719606, -0.581058, -2.528369, 0.4039216, 1, 0, 1,
-0.5685166, 0.4511088, -0.873116, 0.3960784, 1, 0, 1,
-0.5625374, 0.2150869, -1.63405, 0.3921569, 1, 0, 1,
-0.5603298, 2.246623, -1.537881, 0.3843137, 1, 0, 1,
-0.5581319, -0.8669554, -3.133533, 0.3803922, 1, 0, 1,
-0.5562082, 0.228708, -0.2390063, 0.372549, 1, 0, 1,
-0.5552513, -0.1874392, -1.318965, 0.3686275, 1, 0, 1,
-0.5493531, 0.01818492, -1.652543, 0.3607843, 1, 0, 1,
-0.5463795, -0.428895, -4.100708, 0.3568628, 1, 0, 1,
-0.5371232, -2.112791, -4.171319, 0.3490196, 1, 0, 1,
-0.5343902, 1.341232, -0.9594054, 0.345098, 1, 0, 1,
-0.5243958, 0.129417, -1.092987, 0.3372549, 1, 0, 1,
-0.5227903, -1.375069, -0.7375527, 0.3333333, 1, 0, 1,
-0.5162064, 2.788116, -0.8257735, 0.3254902, 1, 0, 1,
-0.5122186, 0.01896087, -0.4535266, 0.3215686, 1, 0, 1,
-0.5117666, 0.02684833, -4.53426, 0.3137255, 1, 0, 1,
-0.5094006, -0.07492881, -1.410126, 0.3098039, 1, 0, 1,
-0.5047666, -0.5351352, -3.767924, 0.3019608, 1, 0, 1,
-0.5026792, 0.489647, -0.2660219, 0.2941177, 1, 0, 1,
-0.5012453, 2.87525, 1.100098, 0.2901961, 1, 0, 1,
-0.4936711, -0.2246864, -2.240661, 0.282353, 1, 0, 1,
-0.4872892, -0.5837067, -2.938965, 0.2784314, 1, 0, 1,
-0.4834803, 0.7753724, 0.7952868, 0.2705882, 1, 0, 1,
-0.4820707, -0.05923349, -0.8424146, 0.2666667, 1, 0, 1,
-0.4799519, -1.411902, -3.593532, 0.2588235, 1, 0, 1,
-0.4768426, 0.2364248, -0.0869845, 0.254902, 1, 0, 1,
-0.4759282, 0.4864886, -0.7388836, 0.2470588, 1, 0, 1,
-0.4755459, -0.1720364, -1.387675, 0.2431373, 1, 0, 1,
-0.4754413, 0.6726115, -1.103713, 0.2352941, 1, 0, 1,
-0.47439, -0.745576, -2.25178, 0.2313726, 1, 0, 1,
-0.4725746, -0.2417183, -2.017478, 0.2235294, 1, 0, 1,
-0.4675301, -0.01751737, -3.481974, 0.2196078, 1, 0, 1,
-0.4663145, -0.5938849, -2.040416, 0.2117647, 1, 0, 1,
-0.4662035, 0.9988615, -1.644136, 0.2078431, 1, 0, 1,
-0.4650709, 2.128265, -2.824508, 0.2, 1, 0, 1,
-0.463899, 0.05766852, -1.511531, 0.1921569, 1, 0, 1,
-0.4617023, 0.08168329, -3.613624, 0.1882353, 1, 0, 1,
-0.4602325, 3.524818, -0.6003376, 0.1803922, 1, 0, 1,
-0.4601299, -0.07174856, -1.877981, 0.1764706, 1, 0, 1,
-0.4574924, -0.6028281, -3.541333, 0.1686275, 1, 0, 1,
-0.457283, -0.2518165, -1.545323, 0.1647059, 1, 0, 1,
-0.4541519, -0.9996861, -1.988541, 0.1568628, 1, 0, 1,
-0.4509803, 0.7851757, -0.8386045, 0.1529412, 1, 0, 1,
-0.4501548, 0.3246426, 0.7342525, 0.145098, 1, 0, 1,
-0.4445667, -0.8935474, -3.958007, 0.1411765, 1, 0, 1,
-0.4415272, -1.087462, -0.6671799, 0.1333333, 1, 0, 1,
-0.4398219, 0.6235399, -0.394438, 0.1294118, 1, 0, 1,
-0.4356348, 0.3816531, 0.9552585, 0.1215686, 1, 0, 1,
-0.4355878, -0.2898178, -5.061182, 0.1176471, 1, 0, 1,
-0.4341998, 0.8100944, 1.596604, 0.1098039, 1, 0, 1,
-0.4303504, 0.3068326, -0.9242432, 0.1058824, 1, 0, 1,
-0.428568, -0.2951588, -2.160648, 0.09803922, 1, 0, 1,
-0.4271348, -0.06729367, -2.98263, 0.09019608, 1, 0, 1,
-0.4268389, -0.1722733, -1.909462, 0.08627451, 1, 0, 1,
-0.4213899, -0.9164171, -2.382707, 0.07843138, 1, 0, 1,
-0.4184192, -0.07879994, -2.853769, 0.07450981, 1, 0, 1,
-0.4177223, 0.2102128, -1.210842, 0.06666667, 1, 0, 1,
-0.4168444, -0.7022328, -3.779357, 0.0627451, 1, 0, 1,
-0.414326, 0.8675163, 1.488967, 0.05490196, 1, 0, 1,
-0.4094301, -0.621066, -3.035198, 0.05098039, 1, 0, 1,
-0.3961589, 0.1508748, -1.920053, 0.04313726, 1, 0, 1,
-0.3924854, 0.6494392, -0.6105789, 0.03921569, 1, 0, 1,
-0.3904616, 1.150372, -0.03298451, 0.03137255, 1, 0, 1,
-0.3898856, 0.8235989, 1.156655, 0.02745098, 1, 0, 1,
-0.3876642, -0.8374277, -2.303335, 0.01960784, 1, 0, 1,
-0.3854273, 0.5043501, -0.9649692, 0.01568628, 1, 0, 1,
-0.3838854, -0.3776896, -0.4332145, 0.007843138, 1, 0, 1,
-0.3837216, -0.009704656, -1.206036, 0.003921569, 1, 0, 1,
-0.3793475, -1.525756, -1.515822, 0, 1, 0.003921569, 1,
-0.3741393, -0.1527919, -1.257976, 0, 1, 0.01176471, 1,
-0.3683357, 0.3216019, 0.9670586, 0, 1, 0.01568628, 1,
-0.3673821, 1.897168, 1.274681, 0, 1, 0.02352941, 1,
-0.3657559, 0.6981857, -0.7082644, 0, 1, 0.02745098, 1,
-0.3628457, -0.3124748, -1.6796, 0, 1, 0.03529412, 1,
-0.3598056, -0.3716419, -3.581012, 0, 1, 0.03921569, 1,
-0.3596948, 0.9588084, -1.145705, 0, 1, 0.04705882, 1,
-0.3589162, -0.1537029, -1.895078, 0, 1, 0.05098039, 1,
-0.3575273, -0.9703022, -1.688082, 0, 1, 0.05882353, 1,
-0.3553699, -0.639127, -0.8749736, 0, 1, 0.0627451, 1,
-0.354415, 1.119053, -0.1585365, 0, 1, 0.07058824, 1,
-0.3533202, -0.405598, -1.96921, 0, 1, 0.07450981, 1,
-0.347187, -0.8878202, -2.622346, 0, 1, 0.08235294, 1,
-0.3445654, -1.059638, -3.130387, 0, 1, 0.08627451, 1,
-0.3444602, 0.6231129, 0.961435, 0, 1, 0.09411765, 1,
-0.3440285, -0.4884042, -3.157812, 0, 1, 0.1019608, 1,
-0.3413791, -2.67979, -2.145226, 0, 1, 0.1058824, 1,
-0.3394644, 0.5214777, -0.420096, 0, 1, 0.1137255, 1,
-0.338888, 0.9816445, -1.006931, 0, 1, 0.1176471, 1,
-0.336983, -0.2800373, -1.609837, 0, 1, 0.1254902, 1,
-0.3368844, -2.057375, -3.648451, 0, 1, 0.1294118, 1,
-0.3364488, -0.1731351, -0.2699351, 0, 1, 0.1372549, 1,
-0.3345463, -0.6615766, -1.649956, 0, 1, 0.1411765, 1,
-0.3327538, 0.2116198, -0.6075599, 0, 1, 0.1490196, 1,
-0.3291005, -1.570281, -1.88989, 0, 1, 0.1529412, 1,
-0.328318, 0.2752164, -1.250451, 0, 1, 0.1607843, 1,
-0.3280248, 1.886508, 1.033354, 0, 1, 0.1647059, 1,
-0.3248691, -0.6384577, -3.415535, 0, 1, 0.172549, 1,
-0.319308, 0.6871147, 0.2491303, 0, 1, 0.1764706, 1,
-0.3167542, -0.3917073, -1.684572, 0, 1, 0.1843137, 1,
-0.3154359, -0.1180696, -1.368731, 0, 1, 0.1882353, 1,
-0.3129741, -1.761532, -3.788063, 0, 1, 0.1960784, 1,
-0.3045373, -1.084245, -1.951762, 0, 1, 0.2039216, 1,
-0.3026119, -0.6410292, -1.621776, 0, 1, 0.2078431, 1,
-0.3015625, 0.09748022, -0.8175123, 0, 1, 0.2156863, 1,
-0.3003727, -0.4575062, -2.874905, 0, 1, 0.2196078, 1,
-0.2957663, 0.9481438, -0.181784, 0, 1, 0.227451, 1,
-0.2946255, 0.463315, 1.09184, 0, 1, 0.2313726, 1,
-0.2934749, 3.217354, 1.220793, 0, 1, 0.2392157, 1,
-0.2909874, -2.786221, -3.873791, 0, 1, 0.2431373, 1,
-0.2892185, -0.02053797, -2.027065, 0, 1, 0.2509804, 1,
-0.2875824, 0.09347614, -2.89018, 0, 1, 0.254902, 1,
-0.2871382, 0.2630672, -3.343105, 0, 1, 0.2627451, 1,
-0.287004, -0.9704285, -1.830022, 0, 1, 0.2666667, 1,
-0.286345, -0.05931433, -2.475249, 0, 1, 0.2745098, 1,
-0.2856472, -0.4140084, -2.968551, 0, 1, 0.2784314, 1,
-0.2832366, -1.527516, -4.27563, 0, 1, 0.2862745, 1,
-0.2730667, -1.389898, -4.585873, 0, 1, 0.2901961, 1,
-0.2719885, -0.6431515, -3.272119, 0, 1, 0.2980392, 1,
-0.2696235, 2.400914, 1.175359, 0, 1, 0.3058824, 1,
-0.2693121, 1.613381, -1.627044, 0, 1, 0.3098039, 1,
-0.2649168, -0.1173526, -0.5493439, 0, 1, 0.3176471, 1,
-0.2632425, 0.6580565, -1.567072, 0, 1, 0.3215686, 1,
-0.2626356, -2.169538, -3.320958, 0, 1, 0.3294118, 1,
-0.2621987, 0.6074007, -1.328534, 0, 1, 0.3333333, 1,
-0.2556455, 0.7494813, -0.1006761, 0, 1, 0.3411765, 1,
-0.2537403, -0.9578259, -1.547507, 0, 1, 0.345098, 1,
-0.2523961, 0.05082068, -0.6706409, 0, 1, 0.3529412, 1,
-0.2502916, 0.6242113, 0.80845, 0, 1, 0.3568628, 1,
-0.2502009, -1.804831, -2.947738, 0, 1, 0.3647059, 1,
-0.2484411, 1.29231, -1.118381, 0, 1, 0.3686275, 1,
-0.2444804, 0.2721537, -0.2085833, 0, 1, 0.3764706, 1,
-0.2415754, 0.1463156, -1.686031, 0, 1, 0.3803922, 1,
-0.2339698, 0.1922091, -0.7677346, 0, 1, 0.3882353, 1,
-0.2335316, -1.197481, -3.158018, 0, 1, 0.3921569, 1,
-0.2280057, -0.08413884, -3.280854, 0, 1, 0.4, 1,
-0.2268992, -0.4931595, -2.645438, 0, 1, 0.4078431, 1,
-0.2240338, -0.623751, -1.097522, 0, 1, 0.4117647, 1,
-0.2172929, 0.1323658, -0.6952124, 0, 1, 0.4196078, 1,
-0.2148499, 0.06392499, -2.172006, 0, 1, 0.4235294, 1,
-0.2118128, -0.1173537, -3.002504, 0, 1, 0.4313726, 1,
-0.2099917, -2.798686, -3.775219, 0, 1, 0.4352941, 1,
-0.2093671, -0.09785241, -0.1121952, 0, 1, 0.4431373, 1,
-0.2087629, -2.362187, -2.289896, 0, 1, 0.4470588, 1,
-0.2066791, -0.573916, -2.691261, 0, 1, 0.454902, 1,
-0.2057543, -0.6352412, -3.00051, 0, 1, 0.4588235, 1,
-0.2033113, 0.1267696, -0.1733755, 0, 1, 0.4666667, 1,
-0.2004072, -1.812138, -2.673524, 0, 1, 0.4705882, 1,
-0.2001405, 1.715284, 0.8689722, 0, 1, 0.4784314, 1,
-0.1965129, -0.6170887, -3.773811, 0, 1, 0.4823529, 1,
-0.1956458, -1.310028, -1.207279, 0, 1, 0.4901961, 1,
-0.1902137, 0.2672233, -0.1061636, 0, 1, 0.4941176, 1,
-0.1877673, 1.089487, -0.4639432, 0, 1, 0.5019608, 1,
-0.1788832, -0.7301691, -1.023616, 0, 1, 0.509804, 1,
-0.1750436, 0.3205492, -0.03024185, 0, 1, 0.5137255, 1,
-0.1740646, 0.3764224, 0.1708774, 0, 1, 0.5215687, 1,
-0.1724036, 1.785192, 0.3695315, 0, 1, 0.5254902, 1,
-0.1710307, 1.575518, -0.2649907, 0, 1, 0.5333334, 1,
-0.1702154, -0.2663916, -4.402527, 0, 1, 0.5372549, 1,
-0.1701434, -0.01412522, -1.417735, 0, 1, 0.5450981, 1,
-0.1672179, 0.970157, -0.8880935, 0, 1, 0.5490196, 1,
-0.1630327, -0.6095279, -2.873727, 0, 1, 0.5568628, 1,
-0.1617817, 0.07948666, -1.976995, 0, 1, 0.5607843, 1,
-0.1610453, -0.8365651, -1.457895, 0, 1, 0.5686275, 1,
-0.1602945, 0.4140761, -0.6311191, 0, 1, 0.572549, 1,
-0.150867, 0.7057485, 0.07213338, 0, 1, 0.5803922, 1,
-0.1468602, -0.8697981, -3.0765, 0, 1, 0.5843138, 1,
-0.1445112, 1.326799, -0.03440344, 0, 1, 0.5921569, 1,
-0.1430471, -0.9166735, -2.625471, 0, 1, 0.5960785, 1,
-0.1423202, 0.4775952, 0.6262526, 0, 1, 0.6039216, 1,
-0.1413767, 0.923951, 0.484459, 0, 1, 0.6117647, 1,
-0.1381732, -1.159015, -2.717152, 0, 1, 0.6156863, 1,
-0.1371619, -0.2054465, -2.1669, 0, 1, 0.6235294, 1,
-0.1370272, 0.4063719, 1.641535, 0, 1, 0.627451, 1,
-0.1276502, 1.121388, -0.9870745, 0, 1, 0.6352941, 1,
-0.1269979, -1.969351, -4.101049, 0, 1, 0.6392157, 1,
-0.1258807, 0.5838255, 1.265991, 0, 1, 0.6470588, 1,
-0.1217344, -0.2425294, -0.5321441, 0, 1, 0.6509804, 1,
-0.1181964, -1.288901, -1.976594, 0, 1, 0.6588235, 1,
-0.116664, -0.458815, -2.347958, 0, 1, 0.6627451, 1,
-0.108969, -0.896902, -2.700127, 0, 1, 0.6705883, 1,
-0.1066245, 1.227559, -0.9507251, 0, 1, 0.6745098, 1,
-0.1065578, 0.3610212, -1.197115, 0, 1, 0.682353, 1,
-0.09983037, 0.5094349, 0.02673714, 0, 1, 0.6862745, 1,
-0.09958288, 0.2038817, -0.03720514, 0, 1, 0.6941177, 1,
-0.09453497, -2.012087, -4.147708, 0, 1, 0.7019608, 1,
-0.08567838, -0.9082514, -2.560009, 0, 1, 0.7058824, 1,
-0.08532648, -1.786686, -2.846658, 0, 1, 0.7137255, 1,
-0.08040459, 0.170907, 0.5844799, 0, 1, 0.7176471, 1,
-0.0802779, -1.37629, -2.114064, 0, 1, 0.7254902, 1,
-0.07902392, 0.3479694, -0.7847448, 0, 1, 0.7294118, 1,
-0.07849073, 1.595838, 0.6586613, 0, 1, 0.7372549, 1,
-0.07662454, -0.8340952, -5.460606, 0, 1, 0.7411765, 1,
-0.07635282, 1.931836, -0.6925066, 0, 1, 0.7490196, 1,
-0.07039977, 0.01753183, -1.231048, 0, 1, 0.7529412, 1,
-0.06644057, -0.803672, -1.766834, 0, 1, 0.7607843, 1,
-0.06538714, 0.08772924, -1.171487, 0, 1, 0.7647059, 1,
-0.06414148, 0.8506975, -0.3435282, 0, 1, 0.772549, 1,
-0.06337062, -0.7423797, -4.174691, 0, 1, 0.7764706, 1,
-0.05692004, 0.2084268, -0.1235396, 0, 1, 0.7843137, 1,
-0.05636951, 0.255975, 1.330358, 0, 1, 0.7882353, 1,
-0.04868112, -0.391695, -2.967334, 0, 1, 0.7960784, 1,
-0.04852999, -1.071487, -2.72648, 0, 1, 0.8039216, 1,
-0.04638584, 0.4188149, -0.2201552, 0, 1, 0.8078431, 1,
-0.04184917, -0.01419648, -3.313396, 0, 1, 0.8156863, 1,
-0.04045142, -0.3109978, -3.559684, 0, 1, 0.8196079, 1,
-0.03770191, -1.387252, -3.631955, 0, 1, 0.827451, 1,
-0.03759918, 1.702836, 1.655226, 0, 1, 0.8313726, 1,
-0.03743003, -0.9962822, -3.39132, 0, 1, 0.8392157, 1,
-0.02843181, -0.6835802, -1.570276, 0, 1, 0.8431373, 1,
-0.02729994, 0.5069095, 1.351676, 0, 1, 0.8509804, 1,
-0.0256314, -0.4700393, -4.478986, 0, 1, 0.854902, 1,
-0.01198962, 0.9908853, 0.8192526, 0, 1, 0.8627451, 1,
-0.01005104, -0.8011895, -4.137857, 0, 1, 0.8666667, 1,
-0.00978693, -0.9657399, -1.515924, 0, 1, 0.8745098, 1,
-0.009527097, 0.8369934, -1.231568, 0, 1, 0.8784314, 1,
-0.005351267, 1.575159, -0.1816732, 0, 1, 0.8862745, 1,
-0.005098261, -0.3073247, -3.614316, 0, 1, 0.8901961, 1,
-0.001454266, -2.023223, -4.524781, 0, 1, 0.8980392, 1,
-0.0003651324, 1.230643, -0.1187926, 0, 1, 0.9058824, 1,
0.002456634, -0.3158155, 1.718301, 0, 1, 0.9098039, 1,
0.003286768, -0.194675, 2.674326, 0, 1, 0.9176471, 1,
0.005128784, 0.6376949, 0.05419258, 0, 1, 0.9215686, 1,
0.007310159, 0.5383376, -0.3346837, 0, 1, 0.9294118, 1,
0.007344604, -0.006571065, 3.09409, 0, 1, 0.9333333, 1,
0.009020403, 1.041012, 1.340095, 0, 1, 0.9411765, 1,
0.01073378, 0.4363414, -0.947269, 0, 1, 0.945098, 1,
0.01107712, -0.5572633, 3.986511, 0, 1, 0.9529412, 1,
0.012651, 2.398673, 1.54244, 0, 1, 0.9568627, 1,
0.0233215, 0.345694, 0.06472108, 0, 1, 0.9647059, 1,
0.02679548, 0.258209, 0.3155183, 0, 1, 0.9686275, 1,
0.02804414, -0.6021482, 3.632524, 0, 1, 0.9764706, 1,
0.02951288, 0.919037, -1.314182, 0, 1, 0.9803922, 1,
0.03389467, -0.3847745, 3.998906, 0, 1, 0.9882353, 1,
0.04129303, -0.2991038, 2.049339, 0, 1, 0.9921569, 1,
0.04405994, -1.202108, 3.462875, 0, 1, 1, 1,
0.04512707, 1.513789, -2.543913, 0, 0.9921569, 1, 1,
0.04716229, 0.09062818, 3.105389, 0, 0.9882353, 1, 1,
0.04953332, 0.102987, 1.939664, 0, 0.9803922, 1, 1,
0.05212697, -1.869303, 3.361845, 0, 0.9764706, 1, 1,
0.05295245, 1.558074, 1.188602, 0, 0.9686275, 1, 1,
0.0535062, -0.5267224, 0.7632044, 0, 0.9647059, 1, 1,
0.05910962, -0.5704598, 2.246885, 0, 0.9568627, 1, 1,
0.0596742, -0.3064598, 2.117879, 0, 0.9529412, 1, 1,
0.06066636, -0.4359818, 3.767121, 0, 0.945098, 1, 1,
0.06227915, -0.0795935, 2.433093, 0, 0.9411765, 1, 1,
0.06234039, 0.4224309, 0.854139, 0, 0.9333333, 1, 1,
0.06260861, -1.59466, 3.442286, 0, 0.9294118, 1, 1,
0.06628996, -1.098829, 1.805931, 0, 0.9215686, 1, 1,
0.06879066, 2.795166, -0.3657427, 0, 0.9176471, 1, 1,
0.07328179, -2.103761, 1.211809, 0, 0.9098039, 1, 1,
0.07358524, -0.9068844, 2.951837, 0, 0.9058824, 1, 1,
0.08313593, -0.09451909, 3.25615, 0, 0.8980392, 1, 1,
0.08560662, -0.1490952, 3.261025, 0, 0.8901961, 1, 1,
0.0881421, -0.1786564, 2.027848, 0, 0.8862745, 1, 1,
0.09050046, -0.9604471, 2.731764, 0, 0.8784314, 1, 1,
0.09093207, -0.3599879, 2.367853, 0, 0.8745098, 1, 1,
0.0919402, -1.27671, 2.74725, 0, 0.8666667, 1, 1,
0.09251543, 0.7107508, -0.4291235, 0, 0.8627451, 1, 1,
0.09708613, 1.316853, 0.1572735, 0, 0.854902, 1, 1,
0.09790197, -0.07482623, 2.628188, 0, 0.8509804, 1, 1,
0.09811918, -1.1479, 3.94249, 0, 0.8431373, 1, 1,
0.09821043, 0.5954719, -0.1548536, 0, 0.8392157, 1, 1,
0.1002403, 0.1233405, 1.489738, 0, 0.8313726, 1, 1,
0.1002847, 0.2572311, -0.1519277, 0, 0.827451, 1, 1,
0.1012145, -0.5541181, 4.045186, 0, 0.8196079, 1, 1,
0.1012492, 0.5878751, -0.03846474, 0, 0.8156863, 1, 1,
0.1048685, 0.3099479, 0.4761529, 0, 0.8078431, 1, 1,
0.1063509, 1.45121, 0.6027098, 0, 0.8039216, 1, 1,
0.1073329, -0.1545653, 1.661422, 0, 0.7960784, 1, 1,
0.1166966, 0.3734451, 0.5463428, 0, 0.7882353, 1, 1,
0.1206604, 1.685946, 1.430937, 0, 0.7843137, 1, 1,
0.1306126, 0.5650027, -0.2515327, 0, 0.7764706, 1, 1,
0.1322135, 0.9491158, -0.8741218, 0, 0.772549, 1, 1,
0.132392, 0.8005195, -0.3252783, 0, 0.7647059, 1, 1,
0.1335118, -0.5817765, 1.437, 0, 0.7607843, 1, 1,
0.1350835, -0.3060239, 2.788862, 0, 0.7529412, 1, 1,
0.1373465, 0.4360656, 0.9414425, 0, 0.7490196, 1, 1,
0.1419149, -1.411253, 3.295042, 0, 0.7411765, 1, 1,
0.1422408, 0.8963968, 0.3278266, 0, 0.7372549, 1, 1,
0.1426396, -0.6374009, 2.603056, 0, 0.7294118, 1, 1,
0.1499561, -0.4398489, 4.061526, 0, 0.7254902, 1, 1,
0.1513392, -0.6527838, 1.099299, 0, 0.7176471, 1, 1,
0.1554761, -0.4503151, 2.745301, 0, 0.7137255, 1, 1,
0.1571035, 0.1865086, 0.6435605, 0, 0.7058824, 1, 1,
0.1603412, -0.5663605, 1.798046, 0, 0.6980392, 1, 1,
0.1624117, -0.7743959, 2.603592, 0, 0.6941177, 1, 1,
0.1626211, 0.5696592, 0.3179258, 0, 0.6862745, 1, 1,
0.1658629, 0.2382588, -0.6867066, 0, 0.682353, 1, 1,
0.1752253, 0.4085737, -0.6506315, 0, 0.6745098, 1, 1,
0.1804107, -0.03837583, 2.68862, 0, 0.6705883, 1, 1,
0.1830438, -1.364356, 3.583853, 0, 0.6627451, 1, 1,
0.1845592, -1.167642, 2.708594, 0, 0.6588235, 1, 1,
0.1900115, 2.544042, 1.330858, 0, 0.6509804, 1, 1,
0.1900439, -0.5270064, 3.2245, 0, 0.6470588, 1, 1,
0.1928006, -1.361, 1.855611, 0, 0.6392157, 1, 1,
0.193018, -1.826715, 3.743207, 0, 0.6352941, 1, 1,
0.1933532, 0.8437667, -1.721812, 0, 0.627451, 1, 1,
0.1942091, 0.4180329, -1.411425, 0, 0.6235294, 1, 1,
0.2028922, 0.4154665, -0.5725, 0, 0.6156863, 1, 1,
0.2028929, -0.9298213, 3.764817, 0, 0.6117647, 1, 1,
0.2032119, 0.5211596, -1.90923, 0, 0.6039216, 1, 1,
0.2032318, 0.04512735, 0.4955874, 0, 0.5960785, 1, 1,
0.2040973, 0.693594, -0.03626836, 0, 0.5921569, 1, 1,
0.2084344, 0.6990668, 0.640344, 0, 0.5843138, 1, 1,
0.2149868, 0.5925014, -0.8764774, 0, 0.5803922, 1, 1,
0.2162633, 0.0896057, 1.674997, 0, 0.572549, 1, 1,
0.2183732, 1.211901, -1.26625, 0, 0.5686275, 1, 1,
0.2189994, -0.6021699, 2.651302, 0, 0.5607843, 1, 1,
0.2201535, -0.8753878, 2.610466, 0, 0.5568628, 1, 1,
0.2230561, 2.357833, -0.7305722, 0, 0.5490196, 1, 1,
0.2238976, -0.5900952, 2.497299, 0, 0.5450981, 1, 1,
0.2247556, -0.7464324, 1.969211, 0, 0.5372549, 1, 1,
0.2270279, -0.5297468, 1.577747, 0, 0.5333334, 1, 1,
0.2285055, -0.9219676, 3.109576, 0, 0.5254902, 1, 1,
0.2329012, -1.044883, 2.735639, 0, 0.5215687, 1, 1,
0.2404721, 0.7274041, 0.6287908, 0, 0.5137255, 1, 1,
0.243087, -1.439092, 1.947336, 0, 0.509804, 1, 1,
0.2436322, 0.7668223, -0.2943517, 0, 0.5019608, 1, 1,
0.2457158, 0.8536935, 0.4894872, 0, 0.4941176, 1, 1,
0.2470476, 0.7186801, 0.3111215, 0, 0.4901961, 1, 1,
0.2481886, -0.2013921, 1.32627, 0, 0.4823529, 1, 1,
0.2519742, -0.07157729, 1.927154, 0, 0.4784314, 1, 1,
0.2526863, -0.05374894, 2.979, 0, 0.4705882, 1, 1,
0.2527522, 0.09772418, 0.4273857, 0, 0.4666667, 1, 1,
0.2557279, 0.3595651, -0.1823332, 0, 0.4588235, 1, 1,
0.2559275, 0.8439059, 0.006057051, 0, 0.454902, 1, 1,
0.260378, 1.584874, -0.720177, 0, 0.4470588, 1, 1,
0.261721, 1.312289, 0.2236397, 0, 0.4431373, 1, 1,
0.2681209, -1.105456, 2.604002, 0, 0.4352941, 1, 1,
0.2684765, -0.5104186, 1.703277, 0, 0.4313726, 1, 1,
0.270099, -0.1526886, 1.592837, 0, 0.4235294, 1, 1,
0.2723294, 1.974661, 0.1583461, 0, 0.4196078, 1, 1,
0.2724139, 0.2422514, 1.547965, 0, 0.4117647, 1, 1,
0.2728373, 0.1576285, 1.463645, 0, 0.4078431, 1, 1,
0.2759081, 0.6378096, -0.9950537, 0, 0.4, 1, 1,
0.2773727, 0.5440218, 0.678152, 0, 0.3921569, 1, 1,
0.2793449, 0.6004533, -0.2436268, 0, 0.3882353, 1, 1,
0.2810079, -0.4971499, 2.648727, 0, 0.3803922, 1, 1,
0.2823832, 0.464085, 1.778063, 0, 0.3764706, 1, 1,
0.2828112, 0.03834444, 2.12094, 0, 0.3686275, 1, 1,
0.2833976, -0.5037912, 2.609524, 0, 0.3647059, 1, 1,
0.2860473, -1.00427, 0.6556376, 0, 0.3568628, 1, 1,
0.289226, 0.692701, 0.6349906, 0, 0.3529412, 1, 1,
0.2892715, 1.333795, 1.673615, 0, 0.345098, 1, 1,
0.2915569, -0.2259126, 2.135634, 0, 0.3411765, 1, 1,
0.2924235, 1.001385, -0.300839, 0, 0.3333333, 1, 1,
0.2925133, 0.6925783, -0.4569671, 0, 0.3294118, 1, 1,
0.293021, -1.899504, 2.566684, 0, 0.3215686, 1, 1,
0.2933014, -0.9704615, 3.402868, 0, 0.3176471, 1, 1,
0.2937038, 0.9424427, 0.1420763, 0, 0.3098039, 1, 1,
0.2962797, -0.1844375, 2.183089, 0, 0.3058824, 1, 1,
0.3004352, 1.065119, -1.405127, 0, 0.2980392, 1, 1,
0.301331, 0.2331524, 0.6712488, 0, 0.2901961, 1, 1,
0.3018717, 0.6497226, -0.3409857, 0, 0.2862745, 1, 1,
0.3063116, 0.1856303, 1.576046, 0, 0.2784314, 1, 1,
0.3210271, 1.54681, 0.183782, 0, 0.2745098, 1, 1,
0.3212661, -0.3894428, 2.29351, 0, 0.2666667, 1, 1,
0.3271432, -1.173391, 2.825931, 0, 0.2627451, 1, 1,
0.3328025, 2.360743, 0.3406926, 0, 0.254902, 1, 1,
0.3349465, -0.0007121142, 0.8031709, 0, 0.2509804, 1, 1,
0.3367543, 0.7917811, 0.5374383, 0, 0.2431373, 1, 1,
0.3377854, 0.527598, 0.1471282, 0, 0.2392157, 1, 1,
0.3388264, 1.465558, 0.5586513, 0, 0.2313726, 1, 1,
0.3414231, -0.9354429, 3.373164, 0, 0.227451, 1, 1,
0.341807, 0.05366606, 0.4138829, 0, 0.2196078, 1, 1,
0.3420965, 1.083127, 0.2862889, 0, 0.2156863, 1, 1,
0.3468055, -0.4473561, 2.125895, 0, 0.2078431, 1, 1,
0.3532491, -0.09366585, 2.318338, 0, 0.2039216, 1, 1,
0.3593822, -1.790708, 2.432132, 0, 0.1960784, 1, 1,
0.3605715, 1.863649, -0.6053374, 0, 0.1882353, 1, 1,
0.3608713, -0.6089696, 2.226779, 0, 0.1843137, 1, 1,
0.3630577, -0.06690826, 0.9966441, 0, 0.1764706, 1, 1,
0.3641364, 0.0210086, 2.159871, 0, 0.172549, 1, 1,
0.3665548, -0.3083961, 3.160349, 0, 0.1647059, 1, 1,
0.3705156, -1.404767, 3.593192, 0, 0.1607843, 1, 1,
0.3706048, -1.21381, 3.310362, 0, 0.1529412, 1, 1,
0.3707019, -0.4987579, 3.759939, 0, 0.1490196, 1, 1,
0.3772798, -0.4586256, 1.684325, 0, 0.1411765, 1, 1,
0.3779341, -0.3527204, 3.967133, 0, 0.1372549, 1, 1,
0.382817, -1.205282, 3.889076, 0, 0.1294118, 1, 1,
0.3899947, -0.672611, 3.064692, 0, 0.1254902, 1, 1,
0.3904915, 2.042883, -0.8458142, 0, 0.1176471, 1, 1,
0.3961989, -0.1181545, 2.040168, 0, 0.1137255, 1, 1,
0.3974484, 0.4860039, 0.7640125, 0, 0.1058824, 1, 1,
0.3985417, -1.945568, 1.99547, 0, 0.09803922, 1, 1,
0.4013925, 0.01619718, 1.399497, 0, 0.09411765, 1, 1,
0.4087548, 0.369013, 1.626289, 0, 0.08627451, 1, 1,
0.4101999, 0.3665366, -0.06427789, 0, 0.08235294, 1, 1,
0.4117028, 0.1516867, 1.644391, 0, 0.07450981, 1, 1,
0.4122521, 0.5733829, -0.6940952, 0, 0.07058824, 1, 1,
0.4171815, -0.2242837, 0.5568572, 0, 0.0627451, 1, 1,
0.4206038, -1.340427, 3.565802, 0, 0.05882353, 1, 1,
0.4213496, -0.1200254, 1.857161, 0, 0.05098039, 1, 1,
0.4308876, 1.213543, 0.9431595, 0, 0.04705882, 1, 1,
0.4318808, 0.4342487, 0.5459768, 0, 0.03921569, 1, 1,
0.4365496, 0.8117793, 1.094428, 0, 0.03529412, 1, 1,
0.438234, 0.5781556, 2.356409, 0, 0.02745098, 1, 1,
0.4390444, -0.841877, 2.143679, 0, 0.02352941, 1, 1,
0.44032, 0.5562136, 0.9353464, 0, 0.01568628, 1, 1,
0.4414595, -0.7746126, 1.270879, 0, 0.01176471, 1, 1,
0.4419015, -0.08416881, 0.8666289, 0, 0.003921569, 1, 1,
0.4453652, -0.103491, 3.002799, 0.003921569, 0, 1, 1,
0.4469209, 0.1818629, 0.7750573, 0.007843138, 0, 1, 1,
0.4491363, -0.8166382, 1.894602, 0.01568628, 0, 1, 1,
0.4513887, 0.2688887, -0.2377944, 0.01960784, 0, 1, 1,
0.4556261, -0.6731845, 4.128248, 0.02745098, 0, 1, 1,
0.4559875, -0.05071963, 0.6992286, 0.03137255, 0, 1, 1,
0.45671, 1.738912, 0.5225891, 0.03921569, 0, 1, 1,
0.4572113, 1.652159, -0.1694659, 0.04313726, 0, 1, 1,
0.4572699, 0.3041673, 0.1052822, 0.05098039, 0, 1, 1,
0.4612705, 2.441746, 1.299191, 0.05490196, 0, 1, 1,
0.4631464, 0.2096653, -0.612228, 0.0627451, 0, 1, 1,
0.4669124, 1.092695, 1.262562, 0.06666667, 0, 1, 1,
0.4682115, -0.1785812, 2.163812, 0.07450981, 0, 1, 1,
0.4705085, 0.8076206, 2.040144, 0.07843138, 0, 1, 1,
0.4720775, 0.7704899, 0.04730753, 0.08627451, 0, 1, 1,
0.4722176, -1.231914, 3.448055, 0.09019608, 0, 1, 1,
0.4777217, -1.651137, 3.017675, 0.09803922, 0, 1, 1,
0.4780042, -0.6336825, 2.692329, 0.1058824, 0, 1, 1,
0.4789352, 0.4675753, 3.506654, 0.1098039, 0, 1, 1,
0.4821316, 2.734064, 1.789602, 0.1176471, 0, 1, 1,
0.4876951, 0.2360688, -0.119491, 0.1215686, 0, 1, 1,
0.4926292, -1.268856, 3.942734, 0.1294118, 0, 1, 1,
0.4948563, 0.706145, -0.5180696, 0.1333333, 0, 1, 1,
0.5011042, -0.7837591, 3.306043, 0.1411765, 0, 1, 1,
0.5037773, -0.4802824, 2.743907, 0.145098, 0, 1, 1,
0.5077022, -1.074113, 2.518937, 0.1529412, 0, 1, 1,
0.5108411, 0.8329777, 0.05648161, 0.1568628, 0, 1, 1,
0.5163587, -0.7023208, 2.173684, 0.1647059, 0, 1, 1,
0.5224404, 1.322086, 0.4465427, 0.1686275, 0, 1, 1,
0.5243959, -1.317349, 4.306933, 0.1764706, 0, 1, 1,
0.5267116, 2.252473, 1.036453, 0.1803922, 0, 1, 1,
0.529733, 0.4282278, 0.3579574, 0.1882353, 0, 1, 1,
0.5486172, 0.8331061, 0.03242945, 0.1921569, 0, 1, 1,
0.5489019, 0.06661484, 3.325967, 0.2, 0, 1, 1,
0.5492578, 0.7378939, 1.232867, 0.2078431, 0, 1, 1,
0.5501161, -0.801334, 2.726311, 0.2117647, 0, 1, 1,
0.5522915, -1.199319, 1.703454, 0.2196078, 0, 1, 1,
0.5527354, -0.3446553, 1.907817, 0.2235294, 0, 1, 1,
0.5557556, -0.3773337, 3.739645, 0.2313726, 0, 1, 1,
0.556971, -1.031793, 1.171087, 0.2352941, 0, 1, 1,
0.5571293, 0.7835835, 0.8400864, 0.2431373, 0, 1, 1,
0.5621904, -1.57055, 1.747735, 0.2470588, 0, 1, 1,
0.5644107, 1.038943, 3.690338, 0.254902, 0, 1, 1,
0.5661249, 0.8436459, 0.9463277, 0.2588235, 0, 1, 1,
0.5668446, 0.1731362, 0.9161536, 0.2666667, 0, 1, 1,
0.5679141, -0.2435971, 0.8518875, 0.2705882, 0, 1, 1,
0.5706625, -0.9799126, 2.592388, 0.2784314, 0, 1, 1,
0.5804994, -0.5135522, 3.511634, 0.282353, 0, 1, 1,
0.5809727, 0.8360084, -1.159346, 0.2901961, 0, 1, 1,
0.5810732, -1.956075, 1.554831, 0.2941177, 0, 1, 1,
0.5821683, 0.1305567, 1.194991, 0.3019608, 0, 1, 1,
0.5837355, 0.7859422, 1.848775, 0.3098039, 0, 1, 1,
0.5854707, 0.05495917, 2.209096, 0.3137255, 0, 1, 1,
0.5944213, 0.04056094, 0.1655437, 0.3215686, 0, 1, 1,
0.5986429, 1.782965, 2.078041, 0.3254902, 0, 1, 1,
0.5991243, 0.7467906, 0.8141763, 0.3333333, 0, 1, 1,
0.5999095, 0.2431482, 1.415732, 0.3372549, 0, 1, 1,
0.6041722, 0.8489792, 0.906444, 0.345098, 0, 1, 1,
0.6072257, 1.764427, 0.2828923, 0.3490196, 0, 1, 1,
0.6119384, -1.389654, 0.9384259, 0.3568628, 0, 1, 1,
0.6139882, 0.1466889, -0.4294634, 0.3607843, 0, 1, 1,
0.6170242, 0.3246126, -0.5531491, 0.3686275, 0, 1, 1,
0.6172135, 0.4471914, 1.542681, 0.372549, 0, 1, 1,
0.6218933, -0.1417521, 1.561675, 0.3803922, 0, 1, 1,
0.6240739, 2.324872, -0.2514888, 0.3843137, 0, 1, 1,
0.625891, -0.2676911, 1.424142, 0.3921569, 0, 1, 1,
0.6301386, -0.1011933, 1.402508, 0.3960784, 0, 1, 1,
0.630696, -0.7362451, 1.150212, 0.4039216, 0, 1, 1,
0.6325303, 1.016019, 0.1014431, 0.4117647, 0, 1, 1,
0.6343887, 2.360471, 1.832445, 0.4156863, 0, 1, 1,
0.6398528, 0.3464784, 1.39381, 0.4235294, 0, 1, 1,
0.640867, 0.5804504, 0.8631041, 0.427451, 0, 1, 1,
0.6410174, 0.7721742, 0.6125833, 0.4352941, 0, 1, 1,
0.6434165, 0.6215597, 2.018735, 0.4392157, 0, 1, 1,
0.6465291, -1.050978, 4.143755, 0.4470588, 0, 1, 1,
0.6488834, 0.9050445, 0.5172921, 0.4509804, 0, 1, 1,
0.6503993, 0.3685866, 1.820006, 0.4588235, 0, 1, 1,
0.6550125, 0.7351301, -1.362082, 0.4627451, 0, 1, 1,
0.658736, -1.024534, 3.150593, 0.4705882, 0, 1, 1,
0.6651392, -1.030152, 3.26949, 0.4745098, 0, 1, 1,
0.6681437, 0.8604268, 1.383272, 0.4823529, 0, 1, 1,
0.6714826, 1.716894, 2.05519, 0.4862745, 0, 1, 1,
0.6725404, 2.110233, 1.039707, 0.4941176, 0, 1, 1,
0.6739082, 1.562234, 1.320688, 0.5019608, 0, 1, 1,
0.6754804, -1.261509, 1.824706, 0.5058824, 0, 1, 1,
0.6782044, -0.3643545, 1.173998, 0.5137255, 0, 1, 1,
0.6796559, 0.0950919, 3.157105, 0.5176471, 0, 1, 1,
0.6846133, -0.1395464, 0.08314662, 0.5254902, 0, 1, 1,
0.6885902, -0.909061, 1.894382, 0.5294118, 0, 1, 1,
0.6888515, -1.256422, 2.985933, 0.5372549, 0, 1, 1,
0.6908659, 0.1091754, 2.519367, 0.5411765, 0, 1, 1,
0.6911626, 0.5073712, 0.8866974, 0.5490196, 0, 1, 1,
0.6923366, -0.5966681, 1.673739, 0.5529412, 0, 1, 1,
0.6948282, 1.146989, 0.01972172, 0.5607843, 0, 1, 1,
0.6995985, 0.01049999, 1.235075, 0.5647059, 0, 1, 1,
0.7018819, 0.4786888, 1.825349, 0.572549, 0, 1, 1,
0.7028934, 0.5506449, 0.9663414, 0.5764706, 0, 1, 1,
0.7031136, 0.5711513, 1.633411, 0.5843138, 0, 1, 1,
0.7084885, -1.133961, 1.010473, 0.5882353, 0, 1, 1,
0.7111689, -1.276896, 3.826963, 0.5960785, 0, 1, 1,
0.711441, -0.3233982, -0.142219, 0.6039216, 0, 1, 1,
0.7114539, 0.9397129, 0.9907476, 0.6078432, 0, 1, 1,
0.7169811, 0.6861062, 3.721362, 0.6156863, 0, 1, 1,
0.7178, 0.6265331, 1.646732, 0.6196079, 0, 1, 1,
0.7187249, 0.1735244, 0.658773, 0.627451, 0, 1, 1,
0.7208129, -0.5068335, 3.025119, 0.6313726, 0, 1, 1,
0.7287943, 1.76038, 1.074848, 0.6392157, 0, 1, 1,
0.7308998, 0.3517758, -0.6407129, 0.6431373, 0, 1, 1,
0.7436881, 1.3381, -0.2315177, 0.6509804, 0, 1, 1,
0.746346, -0.07186177, 1.704458, 0.654902, 0, 1, 1,
0.7515901, 0.9767038, -1.0846, 0.6627451, 0, 1, 1,
0.7530707, -0.02794219, 3.168844, 0.6666667, 0, 1, 1,
0.7583882, 1.286342, 1.818825, 0.6745098, 0, 1, 1,
0.7633193, 0.2723047, 2.467795, 0.6784314, 0, 1, 1,
0.7694016, 0.4758238, 0.6616354, 0.6862745, 0, 1, 1,
0.7739711, -0.9834559, 3.156071, 0.6901961, 0, 1, 1,
0.7776601, -0.8688391, 2.351706, 0.6980392, 0, 1, 1,
0.7844755, 0.1248478, 2.006248, 0.7058824, 0, 1, 1,
0.7905664, -0.3149014, 1.962952, 0.7098039, 0, 1, 1,
0.7937053, 0.2583553, 1.316037, 0.7176471, 0, 1, 1,
0.797421, -0.405698, 2.72301, 0.7215686, 0, 1, 1,
0.7991968, 1.07101, 0.8122952, 0.7294118, 0, 1, 1,
0.8006808, -0.6012445, 0.7560914, 0.7333333, 0, 1, 1,
0.804127, 0.002545641, 0.04729689, 0.7411765, 0, 1, 1,
0.8059387, -0.08023448, 1.614046, 0.7450981, 0, 1, 1,
0.8076523, -0.8400182, 4.001448, 0.7529412, 0, 1, 1,
0.8095815, -0.4372376, 3.149939, 0.7568628, 0, 1, 1,
0.8183404, 0.7624226, 2.264659, 0.7647059, 0, 1, 1,
0.8189427, -1.715929, 1.322198, 0.7686275, 0, 1, 1,
0.8232877, -2.279241, 2.366196, 0.7764706, 0, 1, 1,
0.8361059, -0.1552013, 2.176338, 0.7803922, 0, 1, 1,
0.8365031, 1.764288, 1.050691, 0.7882353, 0, 1, 1,
0.8402777, 0.4786083, 0.6241925, 0.7921569, 0, 1, 1,
0.854819, -0.8186839, 1.552558, 0.8, 0, 1, 1,
0.8555966, 1.771241, 0.6856144, 0.8078431, 0, 1, 1,
0.8561817, -0.598375, 0.547358, 0.8117647, 0, 1, 1,
0.8704617, 0.9417576, 2.165378, 0.8196079, 0, 1, 1,
0.8729169, 0.7185691, -1.011223, 0.8235294, 0, 1, 1,
0.8735844, -1.78153, 1.62316, 0.8313726, 0, 1, 1,
0.8738582, 0.1677729, 2.651431, 0.8352941, 0, 1, 1,
0.87737, 0.7123884, 1.173384, 0.8431373, 0, 1, 1,
0.8792202, -0.1807639, 1.821838, 0.8470588, 0, 1, 1,
0.881268, 1.342289, -1.419845, 0.854902, 0, 1, 1,
0.8813788, -1.741624, 3.648099, 0.8588235, 0, 1, 1,
0.8849316, 1.839914, 0.6165479, 0.8666667, 0, 1, 1,
0.8855367, -1.471351, 1.547479, 0.8705882, 0, 1, 1,
0.8947165, -1.215891, 1.661807, 0.8784314, 0, 1, 1,
0.9004135, 0.3036471, 2.291591, 0.8823529, 0, 1, 1,
0.9030795, -0.7866915, 2.770043, 0.8901961, 0, 1, 1,
0.9051295, -0.5605274, 3.370762, 0.8941177, 0, 1, 1,
0.90582, -1.23797, 3.92648, 0.9019608, 0, 1, 1,
0.9059594, -0.2475408, 1.851851, 0.9098039, 0, 1, 1,
0.9106542, 0.1166293, 0.5056797, 0.9137255, 0, 1, 1,
0.9122468, -0.5013056, 0.8314281, 0.9215686, 0, 1, 1,
0.9152938, 1.821491, 0.07008696, 0.9254902, 0, 1, 1,
0.9323696, -0.5883936, 0.8281239, 0.9333333, 0, 1, 1,
0.9348019, 1.531982, 1.507683, 0.9372549, 0, 1, 1,
0.9370614, -1.08619, 1.738914, 0.945098, 0, 1, 1,
0.9388977, 0.1943646, 0.7586322, 0.9490196, 0, 1, 1,
0.9435252, -1.456646, 3.404202, 0.9568627, 0, 1, 1,
0.9442126, 1.742601, 0.9917985, 0.9607843, 0, 1, 1,
0.944282, 0.5817764, 1.416782, 0.9686275, 0, 1, 1,
0.9456739, 0.1705443, 1.697612, 0.972549, 0, 1, 1,
0.9457263, -1.90683, 1.79863, 0.9803922, 0, 1, 1,
0.9535419, -0.7961172, 3.633304, 0.9843137, 0, 1, 1,
0.9560233, -1.119216, 2.935588, 0.9921569, 0, 1, 1,
0.9598666, 1.172801, 1.531675, 0.9960784, 0, 1, 1,
0.9671431, -0.4747569, 1.310046, 1, 0, 0.9960784, 1,
0.9821779, -0.4617233, 3.600672, 1, 0, 0.9882353, 1,
0.9906475, 0.350459, -0.382057, 1, 0, 0.9843137, 1,
0.9926729, -1.884523, 3.326531, 1, 0, 0.9764706, 1,
0.9936179, 1.534915, 0.1660847, 1, 0, 0.972549, 1,
0.9955555, 1.373022, 0.9023572, 1, 0, 0.9647059, 1,
0.9988421, -0.9323289, 3.069572, 1, 0, 0.9607843, 1,
0.9995053, 0.6569825, 0.4931259, 1, 0, 0.9529412, 1,
1.000597, -0.5635835, 3.73531, 1, 0, 0.9490196, 1,
1.007884, 0.5114041, 2.057864, 1, 0, 0.9411765, 1,
1.008822, 0.1429968, 1.50082, 1, 0, 0.9372549, 1,
1.009376, -0.7886975, 2.824575, 1, 0, 0.9294118, 1,
1.026204, -0.04806176, 3.599524, 1, 0, 0.9254902, 1,
1.031958, 0.5101253, 1.598179, 1, 0, 0.9176471, 1,
1.034791, -0.5774038, 1.662777, 1, 0, 0.9137255, 1,
1.035463, 0.8303775, 0.7033406, 1, 0, 0.9058824, 1,
1.040175, -0.6775017, 0.8639456, 1, 0, 0.9019608, 1,
1.047539, 1.009312, -0.9222803, 1, 0, 0.8941177, 1,
1.052175, 0.7183892, 1.075789, 1, 0, 0.8862745, 1,
1.053768, 0.7765628, 2.417268, 1, 0, 0.8823529, 1,
1.057354, -0.2299031, 1.645704, 1, 0, 0.8745098, 1,
1.060969, -1.476262, 0.5156107, 1, 0, 0.8705882, 1,
1.062767, -0.6917087, 1.862541, 1, 0, 0.8627451, 1,
1.065367, 1.148116, -0.7483789, 1, 0, 0.8588235, 1,
1.069382, 0.2289038, 0.5790267, 1, 0, 0.8509804, 1,
1.071952, -0.3511369, 1.210661, 1, 0, 0.8470588, 1,
1.07299, -1.219023, 2.407699, 1, 0, 0.8392157, 1,
1.075908, 1.676754, 1.456296, 1, 0, 0.8352941, 1,
1.080679, -2.795247, 2.043904, 1, 0, 0.827451, 1,
1.087369, 0.9621258, 0.4825833, 1, 0, 0.8235294, 1,
1.093236, 0.2207456, 0.2123227, 1, 0, 0.8156863, 1,
1.096589, 1.876462, -0.5953804, 1, 0, 0.8117647, 1,
1.104331, 1.534674, 1.068735, 1, 0, 0.8039216, 1,
1.114809, 0.8973072, -0.5531247, 1, 0, 0.7960784, 1,
1.115007, -1.098137, 1.903978, 1, 0, 0.7921569, 1,
1.117206, -0.1801053, 2.107015, 1, 0, 0.7843137, 1,
1.122233, 0.820951, 1.890404, 1, 0, 0.7803922, 1,
1.128829, 0.4224304, -0.3408129, 1, 0, 0.772549, 1,
1.135307, -0.5289415, 1.834443, 1, 0, 0.7686275, 1,
1.139793, -0.8152562, 3.189163, 1, 0, 0.7607843, 1,
1.144962, -2.364079, 2.708314, 1, 0, 0.7568628, 1,
1.148259, -2.032309, 2.126545, 1, 0, 0.7490196, 1,
1.149421, -0.9191171, 2.651139, 1, 0, 0.7450981, 1,
1.153048, 0.7246731, 0.2231293, 1, 0, 0.7372549, 1,
1.153211, 1.682666, 1.034158, 1, 0, 0.7333333, 1,
1.153777, -0.8434249, 0.8186065, 1, 0, 0.7254902, 1,
1.159651, 0.9287003, -0.1189471, 1, 0, 0.7215686, 1,
1.171576, -1.075579, 2.031261, 1, 0, 0.7137255, 1,
1.202774, -0.2413487, 1.81435, 1, 0, 0.7098039, 1,
1.203479, -0.1957238, 1.034504, 1, 0, 0.7019608, 1,
1.222492, -0.3281186, 2.309863, 1, 0, 0.6941177, 1,
1.222513, 0.6614629, 0.8314611, 1, 0, 0.6901961, 1,
1.247634, 0.3062016, 1.488455, 1, 0, 0.682353, 1,
1.249506, 1.179949, 0.8716401, 1, 0, 0.6784314, 1,
1.250572, 0.8671222, 1.608924, 1, 0, 0.6705883, 1,
1.25878, 1.251444, 0.6957829, 1, 0, 0.6666667, 1,
1.271335, 0.2103449, -0.2277596, 1, 0, 0.6588235, 1,
1.278956, -0.3503008, 2.747707, 1, 0, 0.654902, 1,
1.280006, -0.3523261, 1.779361, 1, 0, 0.6470588, 1,
1.281059, -1.299837, 1.079856, 1, 0, 0.6431373, 1,
1.281186, 0.6149157, 1.628011, 1, 0, 0.6352941, 1,
1.295059, 0.04198299, 1.297928, 1, 0, 0.6313726, 1,
1.296693, -2.80639, 2.117827, 1, 0, 0.6235294, 1,
1.298498, 0.6546637, 1.318388, 1, 0, 0.6196079, 1,
1.313177, 1.474891, -0.1331531, 1, 0, 0.6117647, 1,
1.326987, 0.5413256, -1.163886, 1, 0, 0.6078432, 1,
1.330023, 0.6357652, -0.5728908, 1, 0, 0.6, 1,
1.33539, -1.087849, 1.472597, 1, 0, 0.5921569, 1,
1.347106, 1.087398, 1.248909, 1, 0, 0.5882353, 1,
1.347691, 0.5316194, 1.262547, 1, 0, 0.5803922, 1,
1.355793, 1.055456, 1.948234, 1, 0, 0.5764706, 1,
1.361762, -1.247895, 3.215977, 1, 0, 0.5686275, 1,
1.370483, -1.837101, 2.26715, 1, 0, 0.5647059, 1,
1.386972, 1.303079, -0.07298425, 1, 0, 0.5568628, 1,
1.387585, 0.9976296, 1.207086, 1, 0, 0.5529412, 1,
1.388697, 0.3645731, 0.01335753, 1, 0, 0.5450981, 1,
1.41723, -0.7388658, 1.350183, 1, 0, 0.5411765, 1,
1.426147, 0.626318, 0.2583337, 1, 0, 0.5333334, 1,
1.427778, -1.826324, 3.239639, 1, 0, 0.5294118, 1,
1.432729, 1.880738, 2.809589, 1, 0, 0.5215687, 1,
1.438545, -1.083257, 3.113859, 1, 0, 0.5176471, 1,
1.440514, 0.2670939, 2.843433, 1, 0, 0.509804, 1,
1.454781, -2.025245, 3.573749, 1, 0, 0.5058824, 1,
1.455742, -0.4760658, 2.119693, 1, 0, 0.4980392, 1,
1.461244, 0.4661069, 2.290418, 1, 0, 0.4901961, 1,
1.465818, -0.03855835, 1.120986, 1, 0, 0.4862745, 1,
1.468193, 1.516612, -0.5697528, 1, 0, 0.4784314, 1,
1.468983, 0.9910505, 2.147261, 1, 0, 0.4745098, 1,
1.478173, -0.9613586, 2.703672, 1, 0, 0.4666667, 1,
1.48016, -0.2163126, 1.953328, 1, 0, 0.4627451, 1,
1.481058, -0.2778139, 1.344753, 1, 0, 0.454902, 1,
1.488529, 1.035176, 1.0505, 1, 0, 0.4509804, 1,
1.503363, -1.23127, 1.233855, 1, 0, 0.4431373, 1,
1.506018, 0.2427015, 2.18364, 1, 0, 0.4392157, 1,
1.507871, -0.1493979, 2.952715, 1, 0, 0.4313726, 1,
1.523078, 1.141938, 1.634356, 1, 0, 0.427451, 1,
1.525308, -1.77914, 3.714335, 1, 0, 0.4196078, 1,
1.533239, 1.874843, 0.7199319, 1, 0, 0.4156863, 1,
1.554149, 0.5148109, 0.4305064, 1, 0, 0.4078431, 1,
1.561214, -0.296018, 2.415752, 1, 0, 0.4039216, 1,
1.561897, 0.2112561, 2.965295, 1, 0, 0.3960784, 1,
1.578509, -0.423501, 0.8475639, 1, 0, 0.3882353, 1,
1.603722, -1.318867, 3.008759, 1, 0, 0.3843137, 1,
1.613814, 1.399557, 2.681774, 1, 0, 0.3764706, 1,
1.619425, 1.122721, 3.273538, 1, 0, 0.372549, 1,
1.636303, -0.6220388, 1.876449, 1, 0, 0.3647059, 1,
1.640783, -1.924825, 1.642345, 1, 0, 0.3607843, 1,
1.646024, 2.701229, 0.8684471, 1, 0, 0.3529412, 1,
1.652066, -1.423099, 2.850855, 1, 0, 0.3490196, 1,
1.660042, -0.5725956, 1.765257, 1, 0, 0.3411765, 1,
1.661602, 0.3824443, 2.301743, 1, 0, 0.3372549, 1,
1.666099, 1.096963, 2.342831, 1, 0, 0.3294118, 1,
1.673851, 1.175454, 1.21859, 1, 0, 0.3254902, 1,
1.692685, 0.2086118, 1.497749, 1, 0, 0.3176471, 1,
1.706874, -1.166192, 1.039784, 1, 0, 0.3137255, 1,
1.712098, 0.6939654, 1.127554, 1, 0, 0.3058824, 1,
1.714063, 0.3795193, 0.1290394, 1, 0, 0.2980392, 1,
1.718387, -0.04592822, -0.3509371, 1, 0, 0.2941177, 1,
1.733797, 0.9019422, 2.645613, 1, 0, 0.2862745, 1,
1.737493, -0.4593347, 4.178253, 1, 0, 0.282353, 1,
1.75554, 0.7104446, 1.862376, 1, 0, 0.2745098, 1,
1.764219, -0.4002833, 1.917204, 1, 0, 0.2705882, 1,
1.764356, -0.5376306, 1.093514, 1, 0, 0.2627451, 1,
1.77725, -0.895444, 2.578181, 1, 0, 0.2588235, 1,
1.779223, -1.506327, 2.69715, 1, 0, 0.2509804, 1,
1.802761, 1.745731, 2.243711, 1, 0, 0.2470588, 1,
1.804056, -1.759465, 3.323561, 1, 0, 0.2392157, 1,
1.827063, -0.8425748, 2.400252, 1, 0, 0.2352941, 1,
1.834784, 1.67584, -0.6806012, 1, 0, 0.227451, 1,
1.850283, -1.23221, 2.685654, 1, 0, 0.2235294, 1,
1.865619, 0.1605194, 0.8290765, 1, 0, 0.2156863, 1,
1.868091, 0.04260008, 1.488968, 1, 0, 0.2117647, 1,
1.874442, 0.8311599, 0.9560436, 1, 0, 0.2039216, 1,
1.901623, 0.6020522, 1.833886, 1, 0, 0.1960784, 1,
1.913514, 0.7376397, 1.114157, 1, 0, 0.1921569, 1,
1.926373, -1.078163, 1.812707, 1, 0, 0.1843137, 1,
1.943875, 0.2650309, 2.604422, 1, 0, 0.1803922, 1,
1.95552, 0.7262548, 0.4725811, 1, 0, 0.172549, 1,
1.997538, 1.254367, 1.235774, 1, 0, 0.1686275, 1,
2.003689, 0.4545101, 1.589665, 1, 0, 0.1607843, 1,
2.009255, 0.857095, -0.7372808, 1, 0, 0.1568628, 1,
2.029725, 2.507474, 1.902755, 1, 0, 0.1490196, 1,
2.030961, 0.2228902, 3.95497, 1, 0, 0.145098, 1,
2.031628, 1.194833, 2.893212, 1, 0, 0.1372549, 1,
2.078307, -1.278101, 1.472062, 1, 0, 0.1333333, 1,
2.106157, -0.2397536, 1.608482, 1, 0, 0.1254902, 1,
2.109232, -0.01148966, 1.290775, 1, 0, 0.1215686, 1,
2.141438, 2.001149, 0.352802, 1, 0, 0.1137255, 1,
2.170745, 0.4282349, 2.398226, 1, 0, 0.1098039, 1,
2.223176, -1.070011, 1.797107, 1, 0, 0.1019608, 1,
2.238788, 1.133845, 0.09427602, 1, 0, 0.09411765, 1,
2.266206, 0.5311606, 1.143288, 1, 0, 0.09019608, 1,
2.285173, -0.1597122, -0.5149475, 1, 0, 0.08235294, 1,
2.389249, -0.4219818, 0.9167157, 1, 0, 0.07843138, 1,
2.407115, -0.7813182, 3.163456, 1, 0, 0.07058824, 1,
2.411391, 0.2522778, 2.219937, 1, 0, 0.06666667, 1,
2.447701, -0.8470359, 1.742558, 1, 0, 0.05882353, 1,
2.52997, -0.2975868, 2.859111, 1, 0, 0.05490196, 1,
2.615597, 0.6248176, 0.6782658, 1, 0, 0.04705882, 1,
2.62285, -0.3568706, 3.786919, 1, 0, 0.04313726, 1,
2.686092, -1.415826, 1.486556, 1, 0, 0.03529412, 1,
2.697573, 0.5655919, 1.013053, 1, 0, 0.03137255, 1,
2.721953, -0.0003462135, 1.242899, 1, 0, 0.02352941, 1,
2.799594, 0.3757489, 3.357327, 1, 0, 0.01960784, 1,
2.81756, -0.7023708, 0.2479003, 1, 0, 0.01176471, 1,
3.257969, 0.5664024, 0.4614429, 1, 0, 0.007843138, 1
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
-0.01551175, -3.87953, -7.294454, 0, -0.5, 0.5, 0.5,
-0.01551175, -3.87953, -7.294454, 1, -0.5, 0.5, 0.5,
-0.01551175, -3.87953, -7.294454, 1, 1.5, 0.5, 0.5,
-0.01551175, -3.87953, -7.294454, 0, 1.5, 0.5, 0.5
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
-4.398703, 0.3592138, -7.294454, 0, -0.5, 0.5, 0.5,
-4.398703, 0.3592138, -7.294454, 1, -0.5, 0.5, 0.5,
-4.398703, 0.3592138, -7.294454, 1, 1.5, 0.5, 0.5,
-4.398703, 0.3592138, -7.294454, 0, 1.5, 0.5, 0.5
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
-4.398703, -3.87953, -0.6530445, 0, -0.5, 0.5, 0.5,
-4.398703, -3.87953, -0.6530445, 1, -0.5, 0.5, 0.5,
-4.398703, -3.87953, -0.6530445, 1, 1.5, 0.5, 0.5,
-4.398703, -3.87953, -0.6530445, 0, 1.5, 0.5, 0.5
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
-3, -2.901358, -5.761821,
3, -2.901358, -5.761821,
-3, -2.901358, -5.761821,
-3, -3.064387, -6.01726,
-2, -2.901358, -5.761821,
-2, -3.064387, -6.01726,
-1, -2.901358, -5.761821,
-1, -3.064387, -6.01726,
0, -2.901358, -5.761821,
0, -3.064387, -6.01726,
1, -2.901358, -5.761821,
1, -3.064387, -6.01726,
2, -2.901358, -5.761821,
2, -3.064387, -6.01726,
3, -2.901358, -5.761821,
3, -3.064387, -6.01726
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
-3, -3.390444, -6.528138, 0, -0.5, 0.5, 0.5,
-3, -3.390444, -6.528138, 1, -0.5, 0.5, 0.5,
-3, -3.390444, -6.528138, 1, 1.5, 0.5, 0.5,
-3, -3.390444, -6.528138, 0, 1.5, 0.5, 0.5,
-2, -3.390444, -6.528138, 0, -0.5, 0.5, 0.5,
-2, -3.390444, -6.528138, 1, -0.5, 0.5, 0.5,
-2, -3.390444, -6.528138, 1, 1.5, 0.5, 0.5,
-2, -3.390444, -6.528138, 0, 1.5, 0.5, 0.5,
-1, -3.390444, -6.528138, 0, -0.5, 0.5, 0.5,
-1, -3.390444, -6.528138, 1, -0.5, 0.5, 0.5,
-1, -3.390444, -6.528138, 1, 1.5, 0.5, 0.5,
-1, -3.390444, -6.528138, 0, 1.5, 0.5, 0.5,
0, -3.390444, -6.528138, 0, -0.5, 0.5, 0.5,
0, -3.390444, -6.528138, 1, -0.5, 0.5, 0.5,
0, -3.390444, -6.528138, 1, 1.5, 0.5, 0.5,
0, -3.390444, -6.528138, 0, 1.5, 0.5, 0.5,
1, -3.390444, -6.528138, 0, -0.5, 0.5, 0.5,
1, -3.390444, -6.528138, 1, -0.5, 0.5, 0.5,
1, -3.390444, -6.528138, 1, 1.5, 0.5, 0.5,
1, -3.390444, -6.528138, 0, 1.5, 0.5, 0.5,
2, -3.390444, -6.528138, 0, -0.5, 0.5, 0.5,
2, -3.390444, -6.528138, 1, -0.5, 0.5, 0.5,
2, -3.390444, -6.528138, 1, 1.5, 0.5, 0.5,
2, -3.390444, -6.528138, 0, 1.5, 0.5, 0.5,
3, -3.390444, -6.528138, 0, -0.5, 0.5, 0.5,
3, -3.390444, -6.528138, 1, -0.5, 0.5, 0.5,
3, -3.390444, -6.528138, 1, 1.5, 0.5, 0.5,
3, -3.390444, -6.528138, 0, 1.5, 0.5, 0.5
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
-3.387197, -2, -5.761821,
-3.387197, 3, -5.761821,
-3.387197, -2, -5.761821,
-3.555781, -2, -6.01726,
-3.387197, -1, -5.761821,
-3.555781, -1, -6.01726,
-3.387197, 0, -5.761821,
-3.555781, 0, -6.01726,
-3.387197, 1, -5.761821,
-3.555781, 1, -6.01726,
-3.387197, 2, -5.761821,
-3.555781, 2, -6.01726,
-3.387197, 3, -5.761821,
-3.555781, 3, -6.01726
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
-3.89295, -2, -6.528138, 0, -0.5, 0.5, 0.5,
-3.89295, -2, -6.528138, 1, -0.5, 0.5, 0.5,
-3.89295, -2, -6.528138, 1, 1.5, 0.5, 0.5,
-3.89295, -2, -6.528138, 0, 1.5, 0.5, 0.5,
-3.89295, -1, -6.528138, 0, -0.5, 0.5, 0.5,
-3.89295, -1, -6.528138, 1, -0.5, 0.5, 0.5,
-3.89295, -1, -6.528138, 1, 1.5, 0.5, 0.5,
-3.89295, -1, -6.528138, 0, 1.5, 0.5, 0.5,
-3.89295, 0, -6.528138, 0, -0.5, 0.5, 0.5,
-3.89295, 0, -6.528138, 1, -0.5, 0.5, 0.5,
-3.89295, 0, -6.528138, 1, 1.5, 0.5, 0.5,
-3.89295, 0, -6.528138, 0, 1.5, 0.5, 0.5,
-3.89295, 1, -6.528138, 0, -0.5, 0.5, 0.5,
-3.89295, 1, -6.528138, 1, -0.5, 0.5, 0.5,
-3.89295, 1, -6.528138, 1, 1.5, 0.5, 0.5,
-3.89295, 1, -6.528138, 0, 1.5, 0.5, 0.5,
-3.89295, 2, -6.528138, 0, -0.5, 0.5, 0.5,
-3.89295, 2, -6.528138, 1, -0.5, 0.5, 0.5,
-3.89295, 2, -6.528138, 1, 1.5, 0.5, 0.5,
-3.89295, 2, -6.528138, 0, 1.5, 0.5, 0.5,
-3.89295, 3, -6.528138, 0, -0.5, 0.5, 0.5,
-3.89295, 3, -6.528138, 1, -0.5, 0.5, 0.5,
-3.89295, 3, -6.528138, 1, 1.5, 0.5, 0.5,
-3.89295, 3, -6.528138, 0, 1.5, 0.5, 0.5
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
-3.387197, -2.901358, -4,
-3.387197, -2.901358, 4,
-3.387197, -2.901358, -4,
-3.555781, -3.064387, -4,
-3.387197, -2.901358, -2,
-3.555781, -3.064387, -2,
-3.387197, -2.901358, 0,
-3.555781, -3.064387, 0,
-3.387197, -2.901358, 2,
-3.555781, -3.064387, 2,
-3.387197, -2.901358, 4,
-3.555781, -3.064387, 4
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
-3.89295, -3.390444, -4, 0, -0.5, 0.5, 0.5,
-3.89295, -3.390444, -4, 1, -0.5, 0.5, 0.5,
-3.89295, -3.390444, -4, 1, 1.5, 0.5, 0.5,
-3.89295, -3.390444, -4, 0, 1.5, 0.5, 0.5,
-3.89295, -3.390444, -2, 0, -0.5, 0.5, 0.5,
-3.89295, -3.390444, -2, 1, -0.5, 0.5, 0.5,
-3.89295, -3.390444, -2, 1, 1.5, 0.5, 0.5,
-3.89295, -3.390444, -2, 0, 1.5, 0.5, 0.5,
-3.89295, -3.390444, 0, 0, -0.5, 0.5, 0.5,
-3.89295, -3.390444, 0, 1, -0.5, 0.5, 0.5,
-3.89295, -3.390444, 0, 1, 1.5, 0.5, 0.5,
-3.89295, -3.390444, 0, 0, 1.5, 0.5, 0.5,
-3.89295, -3.390444, 2, 0, -0.5, 0.5, 0.5,
-3.89295, -3.390444, 2, 1, -0.5, 0.5, 0.5,
-3.89295, -3.390444, 2, 1, 1.5, 0.5, 0.5,
-3.89295, -3.390444, 2, 0, 1.5, 0.5, 0.5,
-3.89295, -3.390444, 4, 0, -0.5, 0.5, 0.5,
-3.89295, -3.390444, 4, 1, -0.5, 0.5, 0.5,
-3.89295, -3.390444, 4, 1, 1.5, 0.5, 0.5,
-3.89295, -3.390444, 4, 0, 1.5, 0.5, 0.5
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
-3.387197, -2.901358, -5.761821,
-3.387197, 3.619786, -5.761821,
-3.387197, -2.901358, 4.455732,
-3.387197, 3.619786, 4.455732,
-3.387197, -2.901358, -5.761821,
-3.387197, -2.901358, 4.455732,
-3.387197, 3.619786, -5.761821,
-3.387197, 3.619786, 4.455732,
-3.387197, -2.901358, -5.761821,
3.356174, -2.901358, -5.761821,
-3.387197, -2.901358, 4.455732,
3.356174, -2.901358, 4.455732,
-3.387197, 3.619786, -5.761821,
3.356174, 3.619786, -5.761821,
-3.387197, 3.619786, 4.455732,
3.356174, 3.619786, 4.455732,
3.356174, -2.901358, -5.761821,
3.356174, 3.619786, -5.761821,
3.356174, -2.901358, 4.455732,
3.356174, 3.619786, 4.455732,
3.356174, -2.901358, -5.761821,
3.356174, -2.901358, 4.455732,
3.356174, 3.619786, -5.761821,
3.356174, 3.619786, 4.455732
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
var radius = 7.406693;
var distance = 32.95321;
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
mvMatrix.translate( 0.01551175, -0.3592138, 0.6530445 );
mvMatrix.scale( 1.187575, 1.228045, 0.7837749 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.95321);
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
oxyfluorfen<-read.table("oxyfluorfen.xyz")
```

```
## Error in read.table("oxyfluorfen.xyz"): no lines available in input
```

```r
x<-oxyfluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
```

```r
y<-oxyfluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
```

```r
z<-oxyfluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
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
-3.288993, 2.315678, -2.454331, 0, 0, 1, 1, 1,
-3.237468, 0.1021239, -3.364825, 1, 0, 0, 1, 1,
-2.742563, -1.138409, -2.450907, 1, 0, 0, 1, 1,
-2.529552, 0.6015162, -1.985976, 1, 0, 0, 1, 1,
-2.408496, 1.747607, 0.4193507, 1, 0, 0, 1, 1,
-2.328592, -1.961027, 0.1795382, 1, 0, 0, 1, 1,
-2.324289, 1.669601, 0.7626379, 0, 0, 0, 1, 1,
-2.316286, -0.8732079, -2.289803, 0, 0, 0, 1, 1,
-2.267626, -0.4880452, -1.841009, 0, 0, 0, 1, 1,
-2.264291, -0.5133868, -0.1923455, 0, 0, 0, 1, 1,
-2.233271, 0.3417437, -1.658704, 0, 0, 0, 1, 1,
-2.203869, -1.005257, -1.858815, 0, 0, 0, 1, 1,
-2.191729, 0.7397209, -2.031187, 0, 0, 0, 1, 1,
-2.175294, -1.067793, -0.8123592, 1, 1, 1, 1, 1,
-2.151087, -0.556976, -1.819809, 1, 1, 1, 1, 1,
-2.14081, 0.5978113, 0.2057374, 1, 1, 1, 1, 1,
-2.117046, 1.534729, -1.703953, 1, 1, 1, 1, 1,
-2.103165, 0.1241116, -0.8137684, 1, 1, 1, 1, 1,
-2.063802, 1.209691, -1.291487, 1, 1, 1, 1, 1,
-2.04516, -0.4338535, -3.0037, 1, 1, 1, 1, 1,
-2.035531, -0.6445556, -1.837559, 1, 1, 1, 1, 1,
-2.009926, -0.9570317, -2.353491, 1, 1, 1, 1, 1,
-1.978529, 0.4778464, 0.2146298, 1, 1, 1, 1, 1,
-1.978478, -1.598295, -3.103946, 1, 1, 1, 1, 1,
-1.966001, -1.484141, -2.344277, 1, 1, 1, 1, 1,
-1.947408, 1.002398, -2.766812, 1, 1, 1, 1, 1,
-1.919978, 0.7816159, 0.7286286, 1, 1, 1, 1, 1,
-1.889501, -0.651687, -1.523237, 1, 1, 1, 1, 1,
-1.887459, 0.578711, -1.435863, 0, 0, 1, 1, 1,
-1.88408, -0.2768818, -3.755129, 1, 0, 0, 1, 1,
-1.842412, 1.552412, -0.1351737, 1, 0, 0, 1, 1,
-1.811747, -0.7336795, -2.593365, 1, 0, 0, 1, 1,
-1.802709, -0.8550175, -1.976539, 1, 0, 0, 1, 1,
-1.799965, 1.296953, -0.8497084, 1, 0, 0, 1, 1,
-1.772346, 1.144525, -3.001775, 0, 0, 0, 1, 1,
-1.747398, 0.673515, -0.606142, 0, 0, 0, 1, 1,
-1.739163, 1.703952, -0.7784875, 0, 0, 0, 1, 1,
-1.729826, -1.793931, -5.613022, 0, 0, 0, 1, 1,
-1.727981, 0.4315813, -1.085725, 0, 0, 0, 1, 1,
-1.71644, 0.6357528, -2.538346, 0, 0, 0, 1, 1,
-1.699638, 1.994541, -0.6313212, 0, 0, 0, 1, 1,
-1.695798, -0.9409583, -1.557961, 1, 1, 1, 1, 1,
-1.695255, 0.1608246, -0.3455149, 1, 1, 1, 1, 1,
-1.691947, 0.09478164, -1.689469, 1, 1, 1, 1, 1,
-1.690166, -0.1548319, -1.136356, 1, 1, 1, 1, 1,
-1.688777, 0.210913, -3.057512, 1, 1, 1, 1, 1,
-1.687458, 2.198467, 2.602447, 1, 1, 1, 1, 1,
-1.666956, -1.588575, -2.930789, 1, 1, 1, 1, 1,
-1.662454, -0.3387362, -0.8102006, 1, 1, 1, 1, 1,
-1.651624, 0.283224, -1.753964, 1, 1, 1, 1, 1,
-1.633015, -0.1869091, -1.302417, 1, 1, 1, 1, 1,
-1.626691, -0.7266319, -2.099084, 1, 1, 1, 1, 1,
-1.623247, 0.5609143, -1.039216, 1, 1, 1, 1, 1,
-1.623072, 1.562966, -0.8403984, 1, 1, 1, 1, 1,
-1.615626, 0.7084509, -1.068434, 1, 1, 1, 1, 1,
-1.614963, -1.10576, -4.737405, 1, 1, 1, 1, 1,
-1.610989, 1.01038, -1.001761, 0, 0, 1, 1, 1,
-1.601967, -0.08932266, 1.16536, 1, 0, 0, 1, 1,
-1.599724, 1.39707, -1.450948, 1, 0, 0, 1, 1,
-1.596291, 0.8262666, -1.960288, 1, 0, 0, 1, 1,
-1.596019, 0.2034868, -2.855693, 1, 0, 0, 1, 1,
-1.579982, 1.123656, -0.9581719, 1, 0, 0, 1, 1,
-1.561165, 0.3578909, -1.415209, 0, 0, 0, 1, 1,
-1.54962, 0.002830788, -1.072139, 0, 0, 0, 1, 1,
-1.538233, -0.9180034, -2.794357, 0, 0, 0, 1, 1,
-1.523961, -0.8213657, -0.8284107, 0, 0, 0, 1, 1,
-1.520746, 0.940052, -1.264818, 0, 0, 0, 1, 1,
-1.495266, -0.1236722, -2.324217, 0, 0, 0, 1, 1,
-1.491297, 0.1643909, -3.188512, 0, 0, 0, 1, 1,
-1.476846, 0.3838371, -2.625748, 1, 1, 1, 1, 1,
-1.476062, -0.8663021, -3.151363, 1, 1, 1, 1, 1,
-1.457537, 0.03692806, -1.008811, 1, 1, 1, 1, 1,
-1.456935, -0.4259539, -1.12029, 1, 1, 1, 1, 1,
-1.453786, 0.186273, -0.3510696, 1, 1, 1, 1, 1,
-1.453545, -0.3514117, -3.377595, 1, 1, 1, 1, 1,
-1.45023, -0.1501429, -2.076625, 1, 1, 1, 1, 1,
-1.445056, -0.6222277, -1.487108, 1, 1, 1, 1, 1,
-1.430306, -0.3430239, -0.9922158, 1, 1, 1, 1, 1,
-1.426441, -0.03491242, -0.5649678, 1, 1, 1, 1, 1,
-1.413438, 0.0765318, -1.586308, 1, 1, 1, 1, 1,
-1.404598, 0.443522, -1.462287, 1, 1, 1, 1, 1,
-1.394647, -0.7093014, -2.669457, 1, 1, 1, 1, 1,
-1.392141, -1.224573, -2.68154, 1, 1, 1, 1, 1,
-1.386343, -0.8635239, -1.360416, 1, 1, 1, 1, 1,
-1.384912, -0.1934705, -2.623403, 0, 0, 1, 1, 1,
-1.38287, -0.09881048, -1.968905, 1, 0, 0, 1, 1,
-1.378596, -0.778244, -3.780511, 1, 0, 0, 1, 1,
-1.378194, -1.186299, -1.160458, 1, 0, 0, 1, 1,
-1.374368, 2.531269, -0.7952307, 1, 0, 0, 1, 1,
-1.370421, -0.9081089, -1.662658, 1, 0, 0, 1, 1,
-1.367757, -2.550466, -2.878262, 0, 0, 0, 1, 1,
-1.360606, -0.1733192, -2.920537, 0, 0, 0, 1, 1,
-1.354884, -1.107937, -3.427384, 0, 0, 0, 1, 1,
-1.353456, 0.4124152, -0.7308478, 0, 0, 0, 1, 1,
-1.339704, 1.505957, -1.811888, 0, 0, 0, 1, 1,
-1.339042, -2.269735, -3.514891, 0, 0, 0, 1, 1,
-1.337334, -0.3224153, -2.659128, 0, 0, 0, 1, 1,
-1.328889, 0.6546357, -2.506248, 1, 1, 1, 1, 1,
-1.321161, 0.2743233, 0.4270577, 1, 1, 1, 1, 1,
-1.320488, 0.5502071, -0.7718161, 1, 1, 1, 1, 1,
-1.310377, -1.228075, -1.167153, 1, 1, 1, 1, 1,
-1.304796, -1.323169, -1.90764, 1, 1, 1, 1, 1,
-1.292568, 1.236022, -0.4095685, 1, 1, 1, 1, 1,
-1.283768, 0.4418231, -2.032252, 1, 1, 1, 1, 1,
-1.281853, 2.113535, -1.546642, 1, 1, 1, 1, 1,
-1.275406, -0.3040256, -1.11995, 1, 1, 1, 1, 1,
-1.272535, -0.5332053, -2.121649, 1, 1, 1, 1, 1,
-1.265853, 0.6229802, -1.208062, 1, 1, 1, 1, 1,
-1.258748, -0.142548, -1.332366, 1, 1, 1, 1, 1,
-1.257918, 0.1606552, 0.3089042, 1, 1, 1, 1, 1,
-1.25572, -0.4898987, -1.42426, 1, 1, 1, 1, 1,
-1.252843, 0.5877858, -0.8882169, 1, 1, 1, 1, 1,
-1.249676, -0.4225056, -1.18303, 0, 0, 1, 1, 1,
-1.245754, -0.3316189, -0.5067201, 1, 0, 0, 1, 1,
-1.24203, 1.676079, -0.9005642, 1, 0, 0, 1, 1,
-1.232251, -0.8264922, -1.283525, 1, 0, 0, 1, 1,
-1.231582, -0.8464372, -2.649539, 1, 0, 0, 1, 1,
-1.22958, 0.203713, -1.889264, 1, 0, 0, 1, 1,
-1.223768, -1.302135, -2.028269, 0, 0, 0, 1, 1,
-1.220145, -0.8672659, -3.20259, 0, 0, 0, 1, 1,
-1.210817, -0.01748621, -1.824039, 0, 0, 0, 1, 1,
-1.206506, -0.5495377, -0.9249628, 0, 0, 0, 1, 1,
-1.196879, -1.403901, -4.056862, 0, 0, 0, 1, 1,
-1.192581, 0.1137799, -2.05599, 0, 0, 0, 1, 1,
-1.191104, -0.7848329, -3.446174, 0, 0, 0, 1, 1,
-1.186967, -0.5073237, -2.157612, 1, 1, 1, 1, 1,
-1.174007, 0.4376268, 0.00465256, 1, 1, 1, 1, 1,
-1.172536, -0.9770586, -2.370082, 1, 1, 1, 1, 1,
-1.163039, 0.1913605, -2.447551, 1, 1, 1, 1, 1,
-1.15595, -0.379478, -1.750164, 1, 1, 1, 1, 1,
-1.140091, -2.103286, -1.696957, 1, 1, 1, 1, 1,
-1.124979, 0.3564569, -0.8241792, 1, 1, 1, 1, 1,
-1.117347, 1.663976, 0.5898309, 1, 1, 1, 1, 1,
-1.113383, -2.066058, -2.34024, 1, 1, 1, 1, 1,
-1.111419, -0.5266442, -2.177374, 1, 1, 1, 1, 1,
-1.107756, 0.4618362, -0.2317806, 1, 1, 1, 1, 1,
-1.101193, -1.162061, -1.526201, 1, 1, 1, 1, 1,
-1.084554, 0.3060986, 0.1955984, 1, 1, 1, 1, 1,
-1.079192, 0.555207, -2.960402, 1, 1, 1, 1, 1,
-1.077878, 0.793609, -0.1503711, 1, 1, 1, 1, 1,
-1.068148, -0.05481495, -0.9123938, 0, 0, 1, 1, 1,
-1.054077, 0.9186997, -1.893618, 1, 0, 0, 1, 1,
-1.043703, -0.2205998, -1.115311, 1, 0, 0, 1, 1,
-1.041577, -0.3811008, -0.5901206, 1, 0, 0, 1, 1,
-1.038732, 1.843417, -0.9216099, 1, 0, 0, 1, 1,
-1.036837, 1.261459, -0.3095224, 1, 0, 0, 1, 1,
-1.035498, -0.5670772, -1.521383, 0, 0, 0, 1, 1,
-1.03251, -1.195291, -2.793005, 0, 0, 0, 1, 1,
-1.026132, 0.1200825, -1.745608, 0, 0, 0, 1, 1,
-1.021659, 0.2125364, -2.494247, 0, 0, 0, 1, 1,
-1.017209, -0.5688816, -3.771578, 0, 0, 0, 1, 1,
-1.00591, -0.7013323, -1.541409, 0, 0, 0, 1, 1,
-1.001538, -1.805774, -1.41083, 0, 0, 0, 1, 1,
-0.9966221, -1.797976, -3.47862, 1, 1, 1, 1, 1,
-0.9934262, -2.387714, -2.110866, 1, 1, 1, 1, 1,
-0.9899251, -1.54719, -4.61229, 1, 1, 1, 1, 1,
-0.9873835, 0.3900302, -1.738258, 1, 1, 1, 1, 1,
-0.9836413, 0.1172971, -1.805967, 1, 1, 1, 1, 1,
-0.9786434, -0.3486338, -3.516365, 1, 1, 1, 1, 1,
-0.9762894, 1.688536, 1.056189, 1, 1, 1, 1, 1,
-0.9713154, 1.203342, 0.07652254, 1, 1, 1, 1, 1,
-0.9687247, 1.061085, 0.03328379, 1, 1, 1, 1, 1,
-0.9684287, 2.191359, -0.7361613, 1, 1, 1, 1, 1,
-0.9668497, 0.2707896, -2.583952, 1, 1, 1, 1, 1,
-0.9617596, 1.221681, 0.5373927, 1, 1, 1, 1, 1,
-0.9448382, 0.2673867, 0.2935672, 1, 1, 1, 1, 1,
-0.9446991, -0.8133974, -2.599193, 1, 1, 1, 1, 1,
-0.9230253, -1.243658, -1.459357, 1, 1, 1, 1, 1,
-0.9210584, -1.093542, -1.619831, 0, 0, 1, 1, 1,
-0.916327, -0.6754252, -2.207793, 1, 0, 0, 1, 1,
-0.912165, 1.455827, -1.034643, 1, 0, 0, 1, 1,
-0.9111735, 2.04736, -1.670924, 1, 0, 0, 1, 1,
-0.9025278, -0.03682052, -1.632956, 1, 0, 0, 1, 1,
-0.8971085, 1.693434, -1.579483, 1, 0, 0, 1, 1,
-0.8970848, -1.286079, -2.005441, 0, 0, 0, 1, 1,
-0.8969429, -0.09163187, 0.9864511, 0, 0, 0, 1, 1,
-0.8957612, -0.3726198, -0.9189228, 0, 0, 0, 1, 1,
-0.8939342, 0.3214336, -1.610849, 0, 0, 0, 1, 1,
-0.8932353, 0.05605045, -2.228249, 0, 0, 0, 1, 1,
-0.8879719, 0.3176955, -1.104807, 0, 0, 0, 1, 1,
-0.8838559, 0.8300052, -0.728721, 0, 0, 0, 1, 1,
-0.8815451, 1.252692, -1.557138, 1, 1, 1, 1, 1,
-0.8814654, 0.6841297, -2.396347, 1, 1, 1, 1, 1,
-0.8790031, 0.4698238, -0.9308301, 1, 1, 1, 1, 1,
-0.8743635, 0.7168144, -1.540491, 1, 1, 1, 1, 1,
-0.8725329, -1.961947, -3.978055, 1, 1, 1, 1, 1,
-0.8696327, -1.995317, -2.588973, 1, 1, 1, 1, 1,
-0.8633157, 0.1631747, -0.9485477, 1, 1, 1, 1, 1,
-0.8631455, 0.05813504, -1.939702, 1, 1, 1, 1, 1,
-0.8622515, 2.016036, 1.190115, 1, 1, 1, 1, 1,
-0.860565, -0.6792992, -4.086684, 1, 1, 1, 1, 1,
-0.8497695, -0.14292, -1.093226, 1, 1, 1, 1, 1,
-0.8497284, -2.443851, -2.262933, 1, 1, 1, 1, 1,
-0.8463507, -0.3254861, -2.477554, 1, 1, 1, 1, 1,
-0.8428973, 1.269926, -1.44084, 1, 1, 1, 1, 1,
-0.8291073, 2.016461, -2.307159, 1, 1, 1, 1, 1,
-0.823117, 0.5423834, 0.0476348, 0, 0, 1, 1, 1,
-0.8132687, 0.7239196, -1.43813, 1, 0, 0, 1, 1,
-0.8119184, -1.092756, -1.749668, 1, 0, 0, 1, 1,
-0.8110205, 0.09711178, -1.80557, 1, 0, 0, 1, 1,
-0.8108522, -0.4368418, -3.393185, 1, 0, 0, 1, 1,
-0.8044291, -0.6053207, -0.9388928, 1, 0, 0, 1, 1,
-0.8032538, -1.310009, -3.028859, 0, 0, 0, 1, 1,
-0.7999713, -0.08671802, -2.252349, 0, 0, 0, 1, 1,
-0.797779, -0.2598654, -0.5505008, 0, 0, 0, 1, 1,
-0.7947268, -0.5202532, -1.885361, 0, 0, 0, 1, 1,
-0.7943345, -1.042923, -2.763899, 0, 0, 0, 1, 1,
-0.7939555, 1.863271, -2.109884, 0, 0, 0, 1, 1,
-0.7906815, 0.7783843, -2.752405, 0, 0, 0, 1, 1,
-0.7633116, 0.2926905, -2.608905, 1, 1, 1, 1, 1,
-0.7570741, 1.871852, -2.145073, 1, 1, 1, 1, 1,
-0.7565984, 0.7344739, 1.299066, 1, 1, 1, 1, 1,
-0.7555722, 0.7783601, -1.49896, 1, 1, 1, 1, 1,
-0.7538412, -1.344606, -5.44329, 1, 1, 1, 1, 1,
-0.7473607, 1.51244, -0.3504169, 1, 1, 1, 1, 1,
-0.7458315, 1.276313, -0.0672888, 1, 1, 1, 1, 1,
-0.7450543, -0.5087215, -2.730048, 1, 1, 1, 1, 1,
-0.7444963, -0.21983, -0.1651047, 1, 1, 1, 1, 1,
-0.7347023, 0.1184786, -3.088912, 1, 1, 1, 1, 1,
-0.7311511, -1.031665, -3.14214, 1, 1, 1, 1, 1,
-0.7259842, 1.619701, -1.067858, 1, 1, 1, 1, 1,
-0.7229961, 0.6749753, 0.05693374, 1, 1, 1, 1, 1,
-0.7221884, 0.02939171, -0.2123461, 1, 1, 1, 1, 1,
-0.7197861, -1.666403, -2.672922, 1, 1, 1, 1, 1,
-0.7176255, 0.4051514, -2.469801, 0, 0, 1, 1, 1,
-0.7138394, 0.5451458, -1.798254, 1, 0, 0, 1, 1,
-0.7137283, 0.04344446, -3.085772, 1, 0, 0, 1, 1,
-0.7097329, -1.161219, -2.636416, 1, 0, 0, 1, 1,
-0.6978443, -0.392188, -5.332327, 1, 0, 0, 1, 1,
-0.6955767, -0.219256, -2.037899, 1, 0, 0, 1, 1,
-0.6925027, -1.297061, -4.102206, 0, 0, 0, 1, 1,
-0.6910551, -0.7637782, -1.304988, 0, 0, 0, 1, 1,
-0.690063, 0.7326065, -0.2472956, 0, 0, 0, 1, 1,
-0.6896249, 1.091521, 0.5633513, 0, 0, 0, 1, 1,
-0.6892658, -1.344493, -2.417993, 0, 0, 0, 1, 1,
-0.6886426, -0.3469253, -3.318105, 0, 0, 0, 1, 1,
-0.6772342, 0.8628922, -0.5714236, 0, 0, 0, 1, 1,
-0.6755739, 0.7012989, -0.9028375, 1, 1, 1, 1, 1,
-0.6715574, -0.2988696, -0.1332596, 1, 1, 1, 1, 1,
-0.6701016, 1.222557, -1.743602, 1, 1, 1, 1, 1,
-0.6686635, -0.467068, -1.514042, 1, 1, 1, 1, 1,
-0.6590691, 0.2170196, -0.4079312, 1, 1, 1, 1, 1,
-0.6556587, -0.5852236, -2.721275, 1, 1, 1, 1, 1,
-0.6419171, 1.475486, -0.5403839, 1, 1, 1, 1, 1,
-0.6394992, -0.6030801, -2.168577, 1, 1, 1, 1, 1,
-0.63708, -0.4692048, -3.761625, 1, 1, 1, 1, 1,
-0.6365629, 0.9145867, 0.3911705, 1, 1, 1, 1, 1,
-0.6352118, 0.3897156, -2.713933, 1, 1, 1, 1, 1,
-0.6290171, -0.01829891, -2.180726, 1, 1, 1, 1, 1,
-0.620974, 1.985332, -0.1151431, 1, 1, 1, 1, 1,
-0.620744, -0.7625057, -0.1251757, 1, 1, 1, 1, 1,
-0.6195085, -0.8443985, -2.275947, 1, 1, 1, 1, 1,
-0.6190293, -0.281141, -1.908749, 0, 0, 1, 1, 1,
-0.6178931, 0.8340321, -0.6675585, 1, 0, 0, 1, 1,
-0.6170003, -0.7519164, -1.659301, 1, 0, 0, 1, 1,
-0.6166073, 0.7172373, -0.9099855, 1, 0, 0, 1, 1,
-0.6134248, 0.20644, -1.068687, 1, 0, 0, 1, 1,
-0.6106276, -0.1274181, -0.08225451, 1, 0, 0, 1, 1,
-0.5954377, -0.5394491, -2.983716, 0, 0, 0, 1, 1,
-0.5944378, 0.4526628, -1.063422, 0, 0, 0, 1, 1,
-0.5939528, 0.781067, 0.1520804, 0, 0, 0, 1, 1,
-0.5846711, 0.07453634, -1.722477, 0, 0, 0, 1, 1,
-0.5840665, -1.124175, -1.981332, 0, 0, 0, 1, 1,
-0.582691, -0.3899246, -2.25823, 0, 0, 0, 1, 1,
-0.576939, -0.400044, -2.486222, 0, 0, 0, 1, 1,
-0.5740794, -0.8654056, -2.958, 1, 1, 1, 1, 1,
-0.5719606, -0.581058, -2.528369, 1, 1, 1, 1, 1,
-0.5685166, 0.4511088, -0.873116, 1, 1, 1, 1, 1,
-0.5625374, 0.2150869, -1.63405, 1, 1, 1, 1, 1,
-0.5603298, 2.246623, -1.537881, 1, 1, 1, 1, 1,
-0.5581319, -0.8669554, -3.133533, 1, 1, 1, 1, 1,
-0.5562082, 0.228708, -0.2390063, 1, 1, 1, 1, 1,
-0.5552513, -0.1874392, -1.318965, 1, 1, 1, 1, 1,
-0.5493531, 0.01818492, -1.652543, 1, 1, 1, 1, 1,
-0.5463795, -0.428895, -4.100708, 1, 1, 1, 1, 1,
-0.5371232, -2.112791, -4.171319, 1, 1, 1, 1, 1,
-0.5343902, 1.341232, -0.9594054, 1, 1, 1, 1, 1,
-0.5243958, 0.129417, -1.092987, 1, 1, 1, 1, 1,
-0.5227903, -1.375069, -0.7375527, 1, 1, 1, 1, 1,
-0.5162064, 2.788116, -0.8257735, 1, 1, 1, 1, 1,
-0.5122186, 0.01896087, -0.4535266, 0, 0, 1, 1, 1,
-0.5117666, 0.02684833, -4.53426, 1, 0, 0, 1, 1,
-0.5094006, -0.07492881, -1.410126, 1, 0, 0, 1, 1,
-0.5047666, -0.5351352, -3.767924, 1, 0, 0, 1, 1,
-0.5026792, 0.489647, -0.2660219, 1, 0, 0, 1, 1,
-0.5012453, 2.87525, 1.100098, 1, 0, 0, 1, 1,
-0.4936711, -0.2246864, -2.240661, 0, 0, 0, 1, 1,
-0.4872892, -0.5837067, -2.938965, 0, 0, 0, 1, 1,
-0.4834803, 0.7753724, 0.7952868, 0, 0, 0, 1, 1,
-0.4820707, -0.05923349, -0.8424146, 0, 0, 0, 1, 1,
-0.4799519, -1.411902, -3.593532, 0, 0, 0, 1, 1,
-0.4768426, 0.2364248, -0.0869845, 0, 0, 0, 1, 1,
-0.4759282, 0.4864886, -0.7388836, 0, 0, 0, 1, 1,
-0.4755459, -0.1720364, -1.387675, 1, 1, 1, 1, 1,
-0.4754413, 0.6726115, -1.103713, 1, 1, 1, 1, 1,
-0.47439, -0.745576, -2.25178, 1, 1, 1, 1, 1,
-0.4725746, -0.2417183, -2.017478, 1, 1, 1, 1, 1,
-0.4675301, -0.01751737, -3.481974, 1, 1, 1, 1, 1,
-0.4663145, -0.5938849, -2.040416, 1, 1, 1, 1, 1,
-0.4662035, 0.9988615, -1.644136, 1, 1, 1, 1, 1,
-0.4650709, 2.128265, -2.824508, 1, 1, 1, 1, 1,
-0.463899, 0.05766852, -1.511531, 1, 1, 1, 1, 1,
-0.4617023, 0.08168329, -3.613624, 1, 1, 1, 1, 1,
-0.4602325, 3.524818, -0.6003376, 1, 1, 1, 1, 1,
-0.4601299, -0.07174856, -1.877981, 1, 1, 1, 1, 1,
-0.4574924, -0.6028281, -3.541333, 1, 1, 1, 1, 1,
-0.457283, -0.2518165, -1.545323, 1, 1, 1, 1, 1,
-0.4541519, -0.9996861, -1.988541, 1, 1, 1, 1, 1,
-0.4509803, 0.7851757, -0.8386045, 0, 0, 1, 1, 1,
-0.4501548, 0.3246426, 0.7342525, 1, 0, 0, 1, 1,
-0.4445667, -0.8935474, -3.958007, 1, 0, 0, 1, 1,
-0.4415272, -1.087462, -0.6671799, 1, 0, 0, 1, 1,
-0.4398219, 0.6235399, -0.394438, 1, 0, 0, 1, 1,
-0.4356348, 0.3816531, 0.9552585, 1, 0, 0, 1, 1,
-0.4355878, -0.2898178, -5.061182, 0, 0, 0, 1, 1,
-0.4341998, 0.8100944, 1.596604, 0, 0, 0, 1, 1,
-0.4303504, 0.3068326, -0.9242432, 0, 0, 0, 1, 1,
-0.428568, -0.2951588, -2.160648, 0, 0, 0, 1, 1,
-0.4271348, -0.06729367, -2.98263, 0, 0, 0, 1, 1,
-0.4268389, -0.1722733, -1.909462, 0, 0, 0, 1, 1,
-0.4213899, -0.9164171, -2.382707, 0, 0, 0, 1, 1,
-0.4184192, -0.07879994, -2.853769, 1, 1, 1, 1, 1,
-0.4177223, 0.2102128, -1.210842, 1, 1, 1, 1, 1,
-0.4168444, -0.7022328, -3.779357, 1, 1, 1, 1, 1,
-0.414326, 0.8675163, 1.488967, 1, 1, 1, 1, 1,
-0.4094301, -0.621066, -3.035198, 1, 1, 1, 1, 1,
-0.3961589, 0.1508748, -1.920053, 1, 1, 1, 1, 1,
-0.3924854, 0.6494392, -0.6105789, 1, 1, 1, 1, 1,
-0.3904616, 1.150372, -0.03298451, 1, 1, 1, 1, 1,
-0.3898856, 0.8235989, 1.156655, 1, 1, 1, 1, 1,
-0.3876642, -0.8374277, -2.303335, 1, 1, 1, 1, 1,
-0.3854273, 0.5043501, -0.9649692, 1, 1, 1, 1, 1,
-0.3838854, -0.3776896, -0.4332145, 1, 1, 1, 1, 1,
-0.3837216, -0.009704656, -1.206036, 1, 1, 1, 1, 1,
-0.3793475, -1.525756, -1.515822, 1, 1, 1, 1, 1,
-0.3741393, -0.1527919, -1.257976, 1, 1, 1, 1, 1,
-0.3683357, 0.3216019, 0.9670586, 0, 0, 1, 1, 1,
-0.3673821, 1.897168, 1.274681, 1, 0, 0, 1, 1,
-0.3657559, 0.6981857, -0.7082644, 1, 0, 0, 1, 1,
-0.3628457, -0.3124748, -1.6796, 1, 0, 0, 1, 1,
-0.3598056, -0.3716419, -3.581012, 1, 0, 0, 1, 1,
-0.3596948, 0.9588084, -1.145705, 1, 0, 0, 1, 1,
-0.3589162, -0.1537029, -1.895078, 0, 0, 0, 1, 1,
-0.3575273, -0.9703022, -1.688082, 0, 0, 0, 1, 1,
-0.3553699, -0.639127, -0.8749736, 0, 0, 0, 1, 1,
-0.354415, 1.119053, -0.1585365, 0, 0, 0, 1, 1,
-0.3533202, -0.405598, -1.96921, 0, 0, 0, 1, 1,
-0.347187, -0.8878202, -2.622346, 0, 0, 0, 1, 1,
-0.3445654, -1.059638, -3.130387, 0, 0, 0, 1, 1,
-0.3444602, 0.6231129, 0.961435, 1, 1, 1, 1, 1,
-0.3440285, -0.4884042, -3.157812, 1, 1, 1, 1, 1,
-0.3413791, -2.67979, -2.145226, 1, 1, 1, 1, 1,
-0.3394644, 0.5214777, -0.420096, 1, 1, 1, 1, 1,
-0.338888, 0.9816445, -1.006931, 1, 1, 1, 1, 1,
-0.336983, -0.2800373, -1.609837, 1, 1, 1, 1, 1,
-0.3368844, -2.057375, -3.648451, 1, 1, 1, 1, 1,
-0.3364488, -0.1731351, -0.2699351, 1, 1, 1, 1, 1,
-0.3345463, -0.6615766, -1.649956, 1, 1, 1, 1, 1,
-0.3327538, 0.2116198, -0.6075599, 1, 1, 1, 1, 1,
-0.3291005, -1.570281, -1.88989, 1, 1, 1, 1, 1,
-0.328318, 0.2752164, -1.250451, 1, 1, 1, 1, 1,
-0.3280248, 1.886508, 1.033354, 1, 1, 1, 1, 1,
-0.3248691, -0.6384577, -3.415535, 1, 1, 1, 1, 1,
-0.319308, 0.6871147, 0.2491303, 1, 1, 1, 1, 1,
-0.3167542, -0.3917073, -1.684572, 0, 0, 1, 1, 1,
-0.3154359, -0.1180696, -1.368731, 1, 0, 0, 1, 1,
-0.3129741, -1.761532, -3.788063, 1, 0, 0, 1, 1,
-0.3045373, -1.084245, -1.951762, 1, 0, 0, 1, 1,
-0.3026119, -0.6410292, -1.621776, 1, 0, 0, 1, 1,
-0.3015625, 0.09748022, -0.8175123, 1, 0, 0, 1, 1,
-0.3003727, -0.4575062, -2.874905, 0, 0, 0, 1, 1,
-0.2957663, 0.9481438, -0.181784, 0, 0, 0, 1, 1,
-0.2946255, 0.463315, 1.09184, 0, 0, 0, 1, 1,
-0.2934749, 3.217354, 1.220793, 0, 0, 0, 1, 1,
-0.2909874, -2.786221, -3.873791, 0, 0, 0, 1, 1,
-0.2892185, -0.02053797, -2.027065, 0, 0, 0, 1, 1,
-0.2875824, 0.09347614, -2.89018, 0, 0, 0, 1, 1,
-0.2871382, 0.2630672, -3.343105, 1, 1, 1, 1, 1,
-0.287004, -0.9704285, -1.830022, 1, 1, 1, 1, 1,
-0.286345, -0.05931433, -2.475249, 1, 1, 1, 1, 1,
-0.2856472, -0.4140084, -2.968551, 1, 1, 1, 1, 1,
-0.2832366, -1.527516, -4.27563, 1, 1, 1, 1, 1,
-0.2730667, -1.389898, -4.585873, 1, 1, 1, 1, 1,
-0.2719885, -0.6431515, -3.272119, 1, 1, 1, 1, 1,
-0.2696235, 2.400914, 1.175359, 1, 1, 1, 1, 1,
-0.2693121, 1.613381, -1.627044, 1, 1, 1, 1, 1,
-0.2649168, -0.1173526, -0.5493439, 1, 1, 1, 1, 1,
-0.2632425, 0.6580565, -1.567072, 1, 1, 1, 1, 1,
-0.2626356, -2.169538, -3.320958, 1, 1, 1, 1, 1,
-0.2621987, 0.6074007, -1.328534, 1, 1, 1, 1, 1,
-0.2556455, 0.7494813, -0.1006761, 1, 1, 1, 1, 1,
-0.2537403, -0.9578259, -1.547507, 1, 1, 1, 1, 1,
-0.2523961, 0.05082068, -0.6706409, 0, 0, 1, 1, 1,
-0.2502916, 0.6242113, 0.80845, 1, 0, 0, 1, 1,
-0.2502009, -1.804831, -2.947738, 1, 0, 0, 1, 1,
-0.2484411, 1.29231, -1.118381, 1, 0, 0, 1, 1,
-0.2444804, 0.2721537, -0.2085833, 1, 0, 0, 1, 1,
-0.2415754, 0.1463156, -1.686031, 1, 0, 0, 1, 1,
-0.2339698, 0.1922091, -0.7677346, 0, 0, 0, 1, 1,
-0.2335316, -1.197481, -3.158018, 0, 0, 0, 1, 1,
-0.2280057, -0.08413884, -3.280854, 0, 0, 0, 1, 1,
-0.2268992, -0.4931595, -2.645438, 0, 0, 0, 1, 1,
-0.2240338, -0.623751, -1.097522, 0, 0, 0, 1, 1,
-0.2172929, 0.1323658, -0.6952124, 0, 0, 0, 1, 1,
-0.2148499, 0.06392499, -2.172006, 0, 0, 0, 1, 1,
-0.2118128, -0.1173537, -3.002504, 1, 1, 1, 1, 1,
-0.2099917, -2.798686, -3.775219, 1, 1, 1, 1, 1,
-0.2093671, -0.09785241, -0.1121952, 1, 1, 1, 1, 1,
-0.2087629, -2.362187, -2.289896, 1, 1, 1, 1, 1,
-0.2066791, -0.573916, -2.691261, 1, 1, 1, 1, 1,
-0.2057543, -0.6352412, -3.00051, 1, 1, 1, 1, 1,
-0.2033113, 0.1267696, -0.1733755, 1, 1, 1, 1, 1,
-0.2004072, -1.812138, -2.673524, 1, 1, 1, 1, 1,
-0.2001405, 1.715284, 0.8689722, 1, 1, 1, 1, 1,
-0.1965129, -0.6170887, -3.773811, 1, 1, 1, 1, 1,
-0.1956458, -1.310028, -1.207279, 1, 1, 1, 1, 1,
-0.1902137, 0.2672233, -0.1061636, 1, 1, 1, 1, 1,
-0.1877673, 1.089487, -0.4639432, 1, 1, 1, 1, 1,
-0.1788832, -0.7301691, -1.023616, 1, 1, 1, 1, 1,
-0.1750436, 0.3205492, -0.03024185, 1, 1, 1, 1, 1,
-0.1740646, 0.3764224, 0.1708774, 0, 0, 1, 1, 1,
-0.1724036, 1.785192, 0.3695315, 1, 0, 0, 1, 1,
-0.1710307, 1.575518, -0.2649907, 1, 0, 0, 1, 1,
-0.1702154, -0.2663916, -4.402527, 1, 0, 0, 1, 1,
-0.1701434, -0.01412522, -1.417735, 1, 0, 0, 1, 1,
-0.1672179, 0.970157, -0.8880935, 1, 0, 0, 1, 1,
-0.1630327, -0.6095279, -2.873727, 0, 0, 0, 1, 1,
-0.1617817, 0.07948666, -1.976995, 0, 0, 0, 1, 1,
-0.1610453, -0.8365651, -1.457895, 0, 0, 0, 1, 1,
-0.1602945, 0.4140761, -0.6311191, 0, 0, 0, 1, 1,
-0.150867, 0.7057485, 0.07213338, 0, 0, 0, 1, 1,
-0.1468602, -0.8697981, -3.0765, 0, 0, 0, 1, 1,
-0.1445112, 1.326799, -0.03440344, 0, 0, 0, 1, 1,
-0.1430471, -0.9166735, -2.625471, 1, 1, 1, 1, 1,
-0.1423202, 0.4775952, 0.6262526, 1, 1, 1, 1, 1,
-0.1413767, 0.923951, 0.484459, 1, 1, 1, 1, 1,
-0.1381732, -1.159015, -2.717152, 1, 1, 1, 1, 1,
-0.1371619, -0.2054465, -2.1669, 1, 1, 1, 1, 1,
-0.1370272, 0.4063719, 1.641535, 1, 1, 1, 1, 1,
-0.1276502, 1.121388, -0.9870745, 1, 1, 1, 1, 1,
-0.1269979, -1.969351, -4.101049, 1, 1, 1, 1, 1,
-0.1258807, 0.5838255, 1.265991, 1, 1, 1, 1, 1,
-0.1217344, -0.2425294, -0.5321441, 1, 1, 1, 1, 1,
-0.1181964, -1.288901, -1.976594, 1, 1, 1, 1, 1,
-0.116664, -0.458815, -2.347958, 1, 1, 1, 1, 1,
-0.108969, -0.896902, -2.700127, 1, 1, 1, 1, 1,
-0.1066245, 1.227559, -0.9507251, 1, 1, 1, 1, 1,
-0.1065578, 0.3610212, -1.197115, 1, 1, 1, 1, 1,
-0.09983037, 0.5094349, 0.02673714, 0, 0, 1, 1, 1,
-0.09958288, 0.2038817, -0.03720514, 1, 0, 0, 1, 1,
-0.09453497, -2.012087, -4.147708, 1, 0, 0, 1, 1,
-0.08567838, -0.9082514, -2.560009, 1, 0, 0, 1, 1,
-0.08532648, -1.786686, -2.846658, 1, 0, 0, 1, 1,
-0.08040459, 0.170907, 0.5844799, 1, 0, 0, 1, 1,
-0.0802779, -1.37629, -2.114064, 0, 0, 0, 1, 1,
-0.07902392, 0.3479694, -0.7847448, 0, 0, 0, 1, 1,
-0.07849073, 1.595838, 0.6586613, 0, 0, 0, 1, 1,
-0.07662454, -0.8340952, -5.460606, 0, 0, 0, 1, 1,
-0.07635282, 1.931836, -0.6925066, 0, 0, 0, 1, 1,
-0.07039977, 0.01753183, -1.231048, 0, 0, 0, 1, 1,
-0.06644057, -0.803672, -1.766834, 0, 0, 0, 1, 1,
-0.06538714, 0.08772924, -1.171487, 1, 1, 1, 1, 1,
-0.06414148, 0.8506975, -0.3435282, 1, 1, 1, 1, 1,
-0.06337062, -0.7423797, -4.174691, 1, 1, 1, 1, 1,
-0.05692004, 0.2084268, -0.1235396, 1, 1, 1, 1, 1,
-0.05636951, 0.255975, 1.330358, 1, 1, 1, 1, 1,
-0.04868112, -0.391695, -2.967334, 1, 1, 1, 1, 1,
-0.04852999, -1.071487, -2.72648, 1, 1, 1, 1, 1,
-0.04638584, 0.4188149, -0.2201552, 1, 1, 1, 1, 1,
-0.04184917, -0.01419648, -3.313396, 1, 1, 1, 1, 1,
-0.04045142, -0.3109978, -3.559684, 1, 1, 1, 1, 1,
-0.03770191, -1.387252, -3.631955, 1, 1, 1, 1, 1,
-0.03759918, 1.702836, 1.655226, 1, 1, 1, 1, 1,
-0.03743003, -0.9962822, -3.39132, 1, 1, 1, 1, 1,
-0.02843181, -0.6835802, -1.570276, 1, 1, 1, 1, 1,
-0.02729994, 0.5069095, 1.351676, 1, 1, 1, 1, 1,
-0.0256314, -0.4700393, -4.478986, 0, 0, 1, 1, 1,
-0.01198962, 0.9908853, 0.8192526, 1, 0, 0, 1, 1,
-0.01005104, -0.8011895, -4.137857, 1, 0, 0, 1, 1,
-0.00978693, -0.9657399, -1.515924, 1, 0, 0, 1, 1,
-0.009527097, 0.8369934, -1.231568, 1, 0, 0, 1, 1,
-0.005351267, 1.575159, -0.1816732, 1, 0, 0, 1, 1,
-0.005098261, -0.3073247, -3.614316, 0, 0, 0, 1, 1,
-0.001454266, -2.023223, -4.524781, 0, 0, 0, 1, 1,
-0.0003651324, 1.230643, -0.1187926, 0, 0, 0, 1, 1,
0.002456634, -0.3158155, 1.718301, 0, 0, 0, 1, 1,
0.003286768, -0.194675, 2.674326, 0, 0, 0, 1, 1,
0.005128784, 0.6376949, 0.05419258, 0, 0, 0, 1, 1,
0.007310159, 0.5383376, -0.3346837, 0, 0, 0, 1, 1,
0.007344604, -0.006571065, 3.09409, 1, 1, 1, 1, 1,
0.009020403, 1.041012, 1.340095, 1, 1, 1, 1, 1,
0.01073378, 0.4363414, -0.947269, 1, 1, 1, 1, 1,
0.01107712, -0.5572633, 3.986511, 1, 1, 1, 1, 1,
0.012651, 2.398673, 1.54244, 1, 1, 1, 1, 1,
0.0233215, 0.345694, 0.06472108, 1, 1, 1, 1, 1,
0.02679548, 0.258209, 0.3155183, 1, 1, 1, 1, 1,
0.02804414, -0.6021482, 3.632524, 1, 1, 1, 1, 1,
0.02951288, 0.919037, -1.314182, 1, 1, 1, 1, 1,
0.03389467, -0.3847745, 3.998906, 1, 1, 1, 1, 1,
0.04129303, -0.2991038, 2.049339, 1, 1, 1, 1, 1,
0.04405994, -1.202108, 3.462875, 1, 1, 1, 1, 1,
0.04512707, 1.513789, -2.543913, 1, 1, 1, 1, 1,
0.04716229, 0.09062818, 3.105389, 1, 1, 1, 1, 1,
0.04953332, 0.102987, 1.939664, 1, 1, 1, 1, 1,
0.05212697, -1.869303, 3.361845, 0, 0, 1, 1, 1,
0.05295245, 1.558074, 1.188602, 1, 0, 0, 1, 1,
0.0535062, -0.5267224, 0.7632044, 1, 0, 0, 1, 1,
0.05910962, -0.5704598, 2.246885, 1, 0, 0, 1, 1,
0.0596742, -0.3064598, 2.117879, 1, 0, 0, 1, 1,
0.06066636, -0.4359818, 3.767121, 1, 0, 0, 1, 1,
0.06227915, -0.0795935, 2.433093, 0, 0, 0, 1, 1,
0.06234039, 0.4224309, 0.854139, 0, 0, 0, 1, 1,
0.06260861, -1.59466, 3.442286, 0, 0, 0, 1, 1,
0.06628996, -1.098829, 1.805931, 0, 0, 0, 1, 1,
0.06879066, 2.795166, -0.3657427, 0, 0, 0, 1, 1,
0.07328179, -2.103761, 1.211809, 0, 0, 0, 1, 1,
0.07358524, -0.9068844, 2.951837, 0, 0, 0, 1, 1,
0.08313593, -0.09451909, 3.25615, 1, 1, 1, 1, 1,
0.08560662, -0.1490952, 3.261025, 1, 1, 1, 1, 1,
0.0881421, -0.1786564, 2.027848, 1, 1, 1, 1, 1,
0.09050046, -0.9604471, 2.731764, 1, 1, 1, 1, 1,
0.09093207, -0.3599879, 2.367853, 1, 1, 1, 1, 1,
0.0919402, -1.27671, 2.74725, 1, 1, 1, 1, 1,
0.09251543, 0.7107508, -0.4291235, 1, 1, 1, 1, 1,
0.09708613, 1.316853, 0.1572735, 1, 1, 1, 1, 1,
0.09790197, -0.07482623, 2.628188, 1, 1, 1, 1, 1,
0.09811918, -1.1479, 3.94249, 1, 1, 1, 1, 1,
0.09821043, 0.5954719, -0.1548536, 1, 1, 1, 1, 1,
0.1002403, 0.1233405, 1.489738, 1, 1, 1, 1, 1,
0.1002847, 0.2572311, -0.1519277, 1, 1, 1, 1, 1,
0.1012145, -0.5541181, 4.045186, 1, 1, 1, 1, 1,
0.1012492, 0.5878751, -0.03846474, 1, 1, 1, 1, 1,
0.1048685, 0.3099479, 0.4761529, 0, 0, 1, 1, 1,
0.1063509, 1.45121, 0.6027098, 1, 0, 0, 1, 1,
0.1073329, -0.1545653, 1.661422, 1, 0, 0, 1, 1,
0.1166966, 0.3734451, 0.5463428, 1, 0, 0, 1, 1,
0.1206604, 1.685946, 1.430937, 1, 0, 0, 1, 1,
0.1306126, 0.5650027, -0.2515327, 1, 0, 0, 1, 1,
0.1322135, 0.9491158, -0.8741218, 0, 0, 0, 1, 1,
0.132392, 0.8005195, -0.3252783, 0, 0, 0, 1, 1,
0.1335118, -0.5817765, 1.437, 0, 0, 0, 1, 1,
0.1350835, -0.3060239, 2.788862, 0, 0, 0, 1, 1,
0.1373465, 0.4360656, 0.9414425, 0, 0, 0, 1, 1,
0.1419149, -1.411253, 3.295042, 0, 0, 0, 1, 1,
0.1422408, 0.8963968, 0.3278266, 0, 0, 0, 1, 1,
0.1426396, -0.6374009, 2.603056, 1, 1, 1, 1, 1,
0.1499561, -0.4398489, 4.061526, 1, 1, 1, 1, 1,
0.1513392, -0.6527838, 1.099299, 1, 1, 1, 1, 1,
0.1554761, -0.4503151, 2.745301, 1, 1, 1, 1, 1,
0.1571035, 0.1865086, 0.6435605, 1, 1, 1, 1, 1,
0.1603412, -0.5663605, 1.798046, 1, 1, 1, 1, 1,
0.1624117, -0.7743959, 2.603592, 1, 1, 1, 1, 1,
0.1626211, 0.5696592, 0.3179258, 1, 1, 1, 1, 1,
0.1658629, 0.2382588, -0.6867066, 1, 1, 1, 1, 1,
0.1752253, 0.4085737, -0.6506315, 1, 1, 1, 1, 1,
0.1804107, -0.03837583, 2.68862, 1, 1, 1, 1, 1,
0.1830438, -1.364356, 3.583853, 1, 1, 1, 1, 1,
0.1845592, -1.167642, 2.708594, 1, 1, 1, 1, 1,
0.1900115, 2.544042, 1.330858, 1, 1, 1, 1, 1,
0.1900439, -0.5270064, 3.2245, 1, 1, 1, 1, 1,
0.1928006, -1.361, 1.855611, 0, 0, 1, 1, 1,
0.193018, -1.826715, 3.743207, 1, 0, 0, 1, 1,
0.1933532, 0.8437667, -1.721812, 1, 0, 0, 1, 1,
0.1942091, 0.4180329, -1.411425, 1, 0, 0, 1, 1,
0.2028922, 0.4154665, -0.5725, 1, 0, 0, 1, 1,
0.2028929, -0.9298213, 3.764817, 1, 0, 0, 1, 1,
0.2032119, 0.5211596, -1.90923, 0, 0, 0, 1, 1,
0.2032318, 0.04512735, 0.4955874, 0, 0, 0, 1, 1,
0.2040973, 0.693594, -0.03626836, 0, 0, 0, 1, 1,
0.2084344, 0.6990668, 0.640344, 0, 0, 0, 1, 1,
0.2149868, 0.5925014, -0.8764774, 0, 0, 0, 1, 1,
0.2162633, 0.0896057, 1.674997, 0, 0, 0, 1, 1,
0.2183732, 1.211901, -1.26625, 0, 0, 0, 1, 1,
0.2189994, -0.6021699, 2.651302, 1, 1, 1, 1, 1,
0.2201535, -0.8753878, 2.610466, 1, 1, 1, 1, 1,
0.2230561, 2.357833, -0.7305722, 1, 1, 1, 1, 1,
0.2238976, -0.5900952, 2.497299, 1, 1, 1, 1, 1,
0.2247556, -0.7464324, 1.969211, 1, 1, 1, 1, 1,
0.2270279, -0.5297468, 1.577747, 1, 1, 1, 1, 1,
0.2285055, -0.9219676, 3.109576, 1, 1, 1, 1, 1,
0.2329012, -1.044883, 2.735639, 1, 1, 1, 1, 1,
0.2404721, 0.7274041, 0.6287908, 1, 1, 1, 1, 1,
0.243087, -1.439092, 1.947336, 1, 1, 1, 1, 1,
0.2436322, 0.7668223, -0.2943517, 1, 1, 1, 1, 1,
0.2457158, 0.8536935, 0.4894872, 1, 1, 1, 1, 1,
0.2470476, 0.7186801, 0.3111215, 1, 1, 1, 1, 1,
0.2481886, -0.2013921, 1.32627, 1, 1, 1, 1, 1,
0.2519742, -0.07157729, 1.927154, 1, 1, 1, 1, 1,
0.2526863, -0.05374894, 2.979, 0, 0, 1, 1, 1,
0.2527522, 0.09772418, 0.4273857, 1, 0, 0, 1, 1,
0.2557279, 0.3595651, -0.1823332, 1, 0, 0, 1, 1,
0.2559275, 0.8439059, 0.006057051, 1, 0, 0, 1, 1,
0.260378, 1.584874, -0.720177, 1, 0, 0, 1, 1,
0.261721, 1.312289, 0.2236397, 1, 0, 0, 1, 1,
0.2681209, -1.105456, 2.604002, 0, 0, 0, 1, 1,
0.2684765, -0.5104186, 1.703277, 0, 0, 0, 1, 1,
0.270099, -0.1526886, 1.592837, 0, 0, 0, 1, 1,
0.2723294, 1.974661, 0.1583461, 0, 0, 0, 1, 1,
0.2724139, 0.2422514, 1.547965, 0, 0, 0, 1, 1,
0.2728373, 0.1576285, 1.463645, 0, 0, 0, 1, 1,
0.2759081, 0.6378096, -0.9950537, 0, 0, 0, 1, 1,
0.2773727, 0.5440218, 0.678152, 1, 1, 1, 1, 1,
0.2793449, 0.6004533, -0.2436268, 1, 1, 1, 1, 1,
0.2810079, -0.4971499, 2.648727, 1, 1, 1, 1, 1,
0.2823832, 0.464085, 1.778063, 1, 1, 1, 1, 1,
0.2828112, 0.03834444, 2.12094, 1, 1, 1, 1, 1,
0.2833976, -0.5037912, 2.609524, 1, 1, 1, 1, 1,
0.2860473, -1.00427, 0.6556376, 1, 1, 1, 1, 1,
0.289226, 0.692701, 0.6349906, 1, 1, 1, 1, 1,
0.2892715, 1.333795, 1.673615, 1, 1, 1, 1, 1,
0.2915569, -0.2259126, 2.135634, 1, 1, 1, 1, 1,
0.2924235, 1.001385, -0.300839, 1, 1, 1, 1, 1,
0.2925133, 0.6925783, -0.4569671, 1, 1, 1, 1, 1,
0.293021, -1.899504, 2.566684, 1, 1, 1, 1, 1,
0.2933014, -0.9704615, 3.402868, 1, 1, 1, 1, 1,
0.2937038, 0.9424427, 0.1420763, 1, 1, 1, 1, 1,
0.2962797, -0.1844375, 2.183089, 0, 0, 1, 1, 1,
0.3004352, 1.065119, -1.405127, 1, 0, 0, 1, 1,
0.301331, 0.2331524, 0.6712488, 1, 0, 0, 1, 1,
0.3018717, 0.6497226, -0.3409857, 1, 0, 0, 1, 1,
0.3063116, 0.1856303, 1.576046, 1, 0, 0, 1, 1,
0.3210271, 1.54681, 0.183782, 1, 0, 0, 1, 1,
0.3212661, -0.3894428, 2.29351, 0, 0, 0, 1, 1,
0.3271432, -1.173391, 2.825931, 0, 0, 0, 1, 1,
0.3328025, 2.360743, 0.3406926, 0, 0, 0, 1, 1,
0.3349465, -0.0007121142, 0.8031709, 0, 0, 0, 1, 1,
0.3367543, 0.7917811, 0.5374383, 0, 0, 0, 1, 1,
0.3377854, 0.527598, 0.1471282, 0, 0, 0, 1, 1,
0.3388264, 1.465558, 0.5586513, 0, 0, 0, 1, 1,
0.3414231, -0.9354429, 3.373164, 1, 1, 1, 1, 1,
0.341807, 0.05366606, 0.4138829, 1, 1, 1, 1, 1,
0.3420965, 1.083127, 0.2862889, 1, 1, 1, 1, 1,
0.3468055, -0.4473561, 2.125895, 1, 1, 1, 1, 1,
0.3532491, -0.09366585, 2.318338, 1, 1, 1, 1, 1,
0.3593822, -1.790708, 2.432132, 1, 1, 1, 1, 1,
0.3605715, 1.863649, -0.6053374, 1, 1, 1, 1, 1,
0.3608713, -0.6089696, 2.226779, 1, 1, 1, 1, 1,
0.3630577, -0.06690826, 0.9966441, 1, 1, 1, 1, 1,
0.3641364, 0.0210086, 2.159871, 1, 1, 1, 1, 1,
0.3665548, -0.3083961, 3.160349, 1, 1, 1, 1, 1,
0.3705156, -1.404767, 3.593192, 1, 1, 1, 1, 1,
0.3706048, -1.21381, 3.310362, 1, 1, 1, 1, 1,
0.3707019, -0.4987579, 3.759939, 1, 1, 1, 1, 1,
0.3772798, -0.4586256, 1.684325, 1, 1, 1, 1, 1,
0.3779341, -0.3527204, 3.967133, 0, 0, 1, 1, 1,
0.382817, -1.205282, 3.889076, 1, 0, 0, 1, 1,
0.3899947, -0.672611, 3.064692, 1, 0, 0, 1, 1,
0.3904915, 2.042883, -0.8458142, 1, 0, 0, 1, 1,
0.3961989, -0.1181545, 2.040168, 1, 0, 0, 1, 1,
0.3974484, 0.4860039, 0.7640125, 1, 0, 0, 1, 1,
0.3985417, -1.945568, 1.99547, 0, 0, 0, 1, 1,
0.4013925, 0.01619718, 1.399497, 0, 0, 0, 1, 1,
0.4087548, 0.369013, 1.626289, 0, 0, 0, 1, 1,
0.4101999, 0.3665366, -0.06427789, 0, 0, 0, 1, 1,
0.4117028, 0.1516867, 1.644391, 0, 0, 0, 1, 1,
0.4122521, 0.5733829, -0.6940952, 0, 0, 0, 1, 1,
0.4171815, -0.2242837, 0.5568572, 0, 0, 0, 1, 1,
0.4206038, -1.340427, 3.565802, 1, 1, 1, 1, 1,
0.4213496, -0.1200254, 1.857161, 1, 1, 1, 1, 1,
0.4308876, 1.213543, 0.9431595, 1, 1, 1, 1, 1,
0.4318808, 0.4342487, 0.5459768, 1, 1, 1, 1, 1,
0.4365496, 0.8117793, 1.094428, 1, 1, 1, 1, 1,
0.438234, 0.5781556, 2.356409, 1, 1, 1, 1, 1,
0.4390444, -0.841877, 2.143679, 1, 1, 1, 1, 1,
0.44032, 0.5562136, 0.9353464, 1, 1, 1, 1, 1,
0.4414595, -0.7746126, 1.270879, 1, 1, 1, 1, 1,
0.4419015, -0.08416881, 0.8666289, 1, 1, 1, 1, 1,
0.4453652, -0.103491, 3.002799, 1, 1, 1, 1, 1,
0.4469209, 0.1818629, 0.7750573, 1, 1, 1, 1, 1,
0.4491363, -0.8166382, 1.894602, 1, 1, 1, 1, 1,
0.4513887, 0.2688887, -0.2377944, 1, 1, 1, 1, 1,
0.4556261, -0.6731845, 4.128248, 1, 1, 1, 1, 1,
0.4559875, -0.05071963, 0.6992286, 0, 0, 1, 1, 1,
0.45671, 1.738912, 0.5225891, 1, 0, 0, 1, 1,
0.4572113, 1.652159, -0.1694659, 1, 0, 0, 1, 1,
0.4572699, 0.3041673, 0.1052822, 1, 0, 0, 1, 1,
0.4612705, 2.441746, 1.299191, 1, 0, 0, 1, 1,
0.4631464, 0.2096653, -0.612228, 1, 0, 0, 1, 1,
0.4669124, 1.092695, 1.262562, 0, 0, 0, 1, 1,
0.4682115, -0.1785812, 2.163812, 0, 0, 0, 1, 1,
0.4705085, 0.8076206, 2.040144, 0, 0, 0, 1, 1,
0.4720775, 0.7704899, 0.04730753, 0, 0, 0, 1, 1,
0.4722176, -1.231914, 3.448055, 0, 0, 0, 1, 1,
0.4777217, -1.651137, 3.017675, 0, 0, 0, 1, 1,
0.4780042, -0.6336825, 2.692329, 0, 0, 0, 1, 1,
0.4789352, 0.4675753, 3.506654, 1, 1, 1, 1, 1,
0.4821316, 2.734064, 1.789602, 1, 1, 1, 1, 1,
0.4876951, 0.2360688, -0.119491, 1, 1, 1, 1, 1,
0.4926292, -1.268856, 3.942734, 1, 1, 1, 1, 1,
0.4948563, 0.706145, -0.5180696, 1, 1, 1, 1, 1,
0.5011042, -0.7837591, 3.306043, 1, 1, 1, 1, 1,
0.5037773, -0.4802824, 2.743907, 1, 1, 1, 1, 1,
0.5077022, -1.074113, 2.518937, 1, 1, 1, 1, 1,
0.5108411, 0.8329777, 0.05648161, 1, 1, 1, 1, 1,
0.5163587, -0.7023208, 2.173684, 1, 1, 1, 1, 1,
0.5224404, 1.322086, 0.4465427, 1, 1, 1, 1, 1,
0.5243959, -1.317349, 4.306933, 1, 1, 1, 1, 1,
0.5267116, 2.252473, 1.036453, 1, 1, 1, 1, 1,
0.529733, 0.4282278, 0.3579574, 1, 1, 1, 1, 1,
0.5486172, 0.8331061, 0.03242945, 1, 1, 1, 1, 1,
0.5489019, 0.06661484, 3.325967, 0, 0, 1, 1, 1,
0.5492578, 0.7378939, 1.232867, 1, 0, 0, 1, 1,
0.5501161, -0.801334, 2.726311, 1, 0, 0, 1, 1,
0.5522915, -1.199319, 1.703454, 1, 0, 0, 1, 1,
0.5527354, -0.3446553, 1.907817, 1, 0, 0, 1, 1,
0.5557556, -0.3773337, 3.739645, 1, 0, 0, 1, 1,
0.556971, -1.031793, 1.171087, 0, 0, 0, 1, 1,
0.5571293, 0.7835835, 0.8400864, 0, 0, 0, 1, 1,
0.5621904, -1.57055, 1.747735, 0, 0, 0, 1, 1,
0.5644107, 1.038943, 3.690338, 0, 0, 0, 1, 1,
0.5661249, 0.8436459, 0.9463277, 0, 0, 0, 1, 1,
0.5668446, 0.1731362, 0.9161536, 0, 0, 0, 1, 1,
0.5679141, -0.2435971, 0.8518875, 0, 0, 0, 1, 1,
0.5706625, -0.9799126, 2.592388, 1, 1, 1, 1, 1,
0.5804994, -0.5135522, 3.511634, 1, 1, 1, 1, 1,
0.5809727, 0.8360084, -1.159346, 1, 1, 1, 1, 1,
0.5810732, -1.956075, 1.554831, 1, 1, 1, 1, 1,
0.5821683, 0.1305567, 1.194991, 1, 1, 1, 1, 1,
0.5837355, 0.7859422, 1.848775, 1, 1, 1, 1, 1,
0.5854707, 0.05495917, 2.209096, 1, 1, 1, 1, 1,
0.5944213, 0.04056094, 0.1655437, 1, 1, 1, 1, 1,
0.5986429, 1.782965, 2.078041, 1, 1, 1, 1, 1,
0.5991243, 0.7467906, 0.8141763, 1, 1, 1, 1, 1,
0.5999095, 0.2431482, 1.415732, 1, 1, 1, 1, 1,
0.6041722, 0.8489792, 0.906444, 1, 1, 1, 1, 1,
0.6072257, 1.764427, 0.2828923, 1, 1, 1, 1, 1,
0.6119384, -1.389654, 0.9384259, 1, 1, 1, 1, 1,
0.6139882, 0.1466889, -0.4294634, 1, 1, 1, 1, 1,
0.6170242, 0.3246126, -0.5531491, 0, 0, 1, 1, 1,
0.6172135, 0.4471914, 1.542681, 1, 0, 0, 1, 1,
0.6218933, -0.1417521, 1.561675, 1, 0, 0, 1, 1,
0.6240739, 2.324872, -0.2514888, 1, 0, 0, 1, 1,
0.625891, -0.2676911, 1.424142, 1, 0, 0, 1, 1,
0.6301386, -0.1011933, 1.402508, 1, 0, 0, 1, 1,
0.630696, -0.7362451, 1.150212, 0, 0, 0, 1, 1,
0.6325303, 1.016019, 0.1014431, 0, 0, 0, 1, 1,
0.6343887, 2.360471, 1.832445, 0, 0, 0, 1, 1,
0.6398528, 0.3464784, 1.39381, 0, 0, 0, 1, 1,
0.640867, 0.5804504, 0.8631041, 0, 0, 0, 1, 1,
0.6410174, 0.7721742, 0.6125833, 0, 0, 0, 1, 1,
0.6434165, 0.6215597, 2.018735, 0, 0, 0, 1, 1,
0.6465291, -1.050978, 4.143755, 1, 1, 1, 1, 1,
0.6488834, 0.9050445, 0.5172921, 1, 1, 1, 1, 1,
0.6503993, 0.3685866, 1.820006, 1, 1, 1, 1, 1,
0.6550125, 0.7351301, -1.362082, 1, 1, 1, 1, 1,
0.658736, -1.024534, 3.150593, 1, 1, 1, 1, 1,
0.6651392, -1.030152, 3.26949, 1, 1, 1, 1, 1,
0.6681437, 0.8604268, 1.383272, 1, 1, 1, 1, 1,
0.6714826, 1.716894, 2.05519, 1, 1, 1, 1, 1,
0.6725404, 2.110233, 1.039707, 1, 1, 1, 1, 1,
0.6739082, 1.562234, 1.320688, 1, 1, 1, 1, 1,
0.6754804, -1.261509, 1.824706, 1, 1, 1, 1, 1,
0.6782044, -0.3643545, 1.173998, 1, 1, 1, 1, 1,
0.6796559, 0.0950919, 3.157105, 1, 1, 1, 1, 1,
0.6846133, -0.1395464, 0.08314662, 1, 1, 1, 1, 1,
0.6885902, -0.909061, 1.894382, 1, 1, 1, 1, 1,
0.6888515, -1.256422, 2.985933, 0, 0, 1, 1, 1,
0.6908659, 0.1091754, 2.519367, 1, 0, 0, 1, 1,
0.6911626, 0.5073712, 0.8866974, 1, 0, 0, 1, 1,
0.6923366, -0.5966681, 1.673739, 1, 0, 0, 1, 1,
0.6948282, 1.146989, 0.01972172, 1, 0, 0, 1, 1,
0.6995985, 0.01049999, 1.235075, 1, 0, 0, 1, 1,
0.7018819, 0.4786888, 1.825349, 0, 0, 0, 1, 1,
0.7028934, 0.5506449, 0.9663414, 0, 0, 0, 1, 1,
0.7031136, 0.5711513, 1.633411, 0, 0, 0, 1, 1,
0.7084885, -1.133961, 1.010473, 0, 0, 0, 1, 1,
0.7111689, -1.276896, 3.826963, 0, 0, 0, 1, 1,
0.711441, -0.3233982, -0.142219, 0, 0, 0, 1, 1,
0.7114539, 0.9397129, 0.9907476, 0, 0, 0, 1, 1,
0.7169811, 0.6861062, 3.721362, 1, 1, 1, 1, 1,
0.7178, 0.6265331, 1.646732, 1, 1, 1, 1, 1,
0.7187249, 0.1735244, 0.658773, 1, 1, 1, 1, 1,
0.7208129, -0.5068335, 3.025119, 1, 1, 1, 1, 1,
0.7287943, 1.76038, 1.074848, 1, 1, 1, 1, 1,
0.7308998, 0.3517758, -0.6407129, 1, 1, 1, 1, 1,
0.7436881, 1.3381, -0.2315177, 1, 1, 1, 1, 1,
0.746346, -0.07186177, 1.704458, 1, 1, 1, 1, 1,
0.7515901, 0.9767038, -1.0846, 1, 1, 1, 1, 1,
0.7530707, -0.02794219, 3.168844, 1, 1, 1, 1, 1,
0.7583882, 1.286342, 1.818825, 1, 1, 1, 1, 1,
0.7633193, 0.2723047, 2.467795, 1, 1, 1, 1, 1,
0.7694016, 0.4758238, 0.6616354, 1, 1, 1, 1, 1,
0.7739711, -0.9834559, 3.156071, 1, 1, 1, 1, 1,
0.7776601, -0.8688391, 2.351706, 1, 1, 1, 1, 1,
0.7844755, 0.1248478, 2.006248, 0, 0, 1, 1, 1,
0.7905664, -0.3149014, 1.962952, 1, 0, 0, 1, 1,
0.7937053, 0.2583553, 1.316037, 1, 0, 0, 1, 1,
0.797421, -0.405698, 2.72301, 1, 0, 0, 1, 1,
0.7991968, 1.07101, 0.8122952, 1, 0, 0, 1, 1,
0.8006808, -0.6012445, 0.7560914, 1, 0, 0, 1, 1,
0.804127, 0.002545641, 0.04729689, 0, 0, 0, 1, 1,
0.8059387, -0.08023448, 1.614046, 0, 0, 0, 1, 1,
0.8076523, -0.8400182, 4.001448, 0, 0, 0, 1, 1,
0.8095815, -0.4372376, 3.149939, 0, 0, 0, 1, 1,
0.8183404, 0.7624226, 2.264659, 0, 0, 0, 1, 1,
0.8189427, -1.715929, 1.322198, 0, 0, 0, 1, 1,
0.8232877, -2.279241, 2.366196, 0, 0, 0, 1, 1,
0.8361059, -0.1552013, 2.176338, 1, 1, 1, 1, 1,
0.8365031, 1.764288, 1.050691, 1, 1, 1, 1, 1,
0.8402777, 0.4786083, 0.6241925, 1, 1, 1, 1, 1,
0.854819, -0.8186839, 1.552558, 1, 1, 1, 1, 1,
0.8555966, 1.771241, 0.6856144, 1, 1, 1, 1, 1,
0.8561817, -0.598375, 0.547358, 1, 1, 1, 1, 1,
0.8704617, 0.9417576, 2.165378, 1, 1, 1, 1, 1,
0.8729169, 0.7185691, -1.011223, 1, 1, 1, 1, 1,
0.8735844, -1.78153, 1.62316, 1, 1, 1, 1, 1,
0.8738582, 0.1677729, 2.651431, 1, 1, 1, 1, 1,
0.87737, 0.7123884, 1.173384, 1, 1, 1, 1, 1,
0.8792202, -0.1807639, 1.821838, 1, 1, 1, 1, 1,
0.881268, 1.342289, -1.419845, 1, 1, 1, 1, 1,
0.8813788, -1.741624, 3.648099, 1, 1, 1, 1, 1,
0.8849316, 1.839914, 0.6165479, 1, 1, 1, 1, 1,
0.8855367, -1.471351, 1.547479, 0, 0, 1, 1, 1,
0.8947165, -1.215891, 1.661807, 1, 0, 0, 1, 1,
0.9004135, 0.3036471, 2.291591, 1, 0, 0, 1, 1,
0.9030795, -0.7866915, 2.770043, 1, 0, 0, 1, 1,
0.9051295, -0.5605274, 3.370762, 1, 0, 0, 1, 1,
0.90582, -1.23797, 3.92648, 1, 0, 0, 1, 1,
0.9059594, -0.2475408, 1.851851, 0, 0, 0, 1, 1,
0.9106542, 0.1166293, 0.5056797, 0, 0, 0, 1, 1,
0.9122468, -0.5013056, 0.8314281, 0, 0, 0, 1, 1,
0.9152938, 1.821491, 0.07008696, 0, 0, 0, 1, 1,
0.9323696, -0.5883936, 0.8281239, 0, 0, 0, 1, 1,
0.9348019, 1.531982, 1.507683, 0, 0, 0, 1, 1,
0.9370614, -1.08619, 1.738914, 0, 0, 0, 1, 1,
0.9388977, 0.1943646, 0.7586322, 1, 1, 1, 1, 1,
0.9435252, -1.456646, 3.404202, 1, 1, 1, 1, 1,
0.9442126, 1.742601, 0.9917985, 1, 1, 1, 1, 1,
0.944282, 0.5817764, 1.416782, 1, 1, 1, 1, 1,
0.9456739, 0.1705443, 1.697612, 1, 1, 1, 1, 1,
0.9457263, -1.90683, 1.79863, 1, 1, 1, 1, 1,
0.9535419, -0.7961172, 3.633304, 1, 1, 1, 1, 1,
0.9560233, -1.119216, 2.935588, 1, 1, 1, 1, 1,
0.9598666, 1.172801, 1.531675, 1, 1, 1, 1, 1,
0.9671431, -0.4747569, 1.310046, 1, 1, 1, 1, 1,
0.9821779, -0.4617233, 3.600672, 1, 1, 1, 1, 1,
0.9906475, 0.350459, -0.382057, 1, 1, 1, 1, 1,
0.9926729, -1.884523, 3.326531, 1, 1, 1, 1, 1,
0.9936179, 1.534915, 0.1660847, 1, 1, 1, 1, 1,
0.9955555, 1.373022, 0.9023572, 1, 1, 1, 1, 1,
0.9988421, -0.9323289, 3.069572, 0, 0, 1, 1, 1,
0.9995053, 0.6569825, 0.4931259, 1, 0, 0, 1, 1,
1.000597, -0.5635835, 3.73531, 1, 0, 0, 1, 1,
1.007884, 0.5114041, 2.057864, 1, 0, 0, 1, 1,
1.008822, 0.1429968, 1.50082, 1, 0, 0, 1, 1,
1.009376, -0.7886975, 2.824575, 1, 0, 0, 1, 1,
1.026204, -0.04806176, 3.599524, 0, 0, 0, 1, 1,
1.031958, 0.5101253, 1.598179, 0, 0, 0, 1, 1,
1.034791, -0.5774038, 1.662777, 0, 0, 0, 1, 1,
1.035463, 0.8303775, 0.7033406, 0, 0, 0, 1, 1,
1.040175, -0.6775017, 0.8639456, 0, 0, 0, 1, 1,
1.047539, 1.009312, -0.9222803, 0, 0, 0, 1, 1,
1.052175, 0.7183892, 1.075789, 0, 0, 0, 1, 1,
1.053768, 0.7765628, 2.417268, 1, 1, 1, 1, 1,
1.057354, -0.2299031, 1.645704, 1, 1, 1, 1, 1,
1.060969, -1.476262, 0.5156107, 1, 1, 1, 1, 1,
1.062767, -0.6917087, 1.862541, 1, 1, 1, 1, 1,
1.065367, 1.148116, -0.7483789, 1, 1, 1, 1, 1,
1.069382, 0.2289038, 0.5790267, 1, 1, 1, 1, 1,
1.071952, -0.3511369, 1.210661, 1, 1, 1, 1, 1,
1.07299, -1.219023, 2.407699, 1, 1, 1, 1, 1,
1.075908, 1.676754, 1.456296, 1, 1, 1, 1, 1,
1.080679, -2.795247, 2.043904, 1, 1, 1, 1, 1,
1.087369, 0.9621258, 0.4825833, 1, 1, 1, 1, 1,
1.093236, 0.2207456, 0.2123227, 1, 1, 1, 1, 1,
1.096589, 1.876462, -0.5953804, 1, 1, 1, 1, 1,
1.104331, 1.534674, 1.068735, 1, 1, 1, 1, 1,
1.114809, 0.8973072, -0.5531247, 1, 1, 1, 1, 1,
1.115007, -1.098137, 1.903978, 0, 0, 1, 1, 1,
1.117206, -0.1801053, 2.107015, 1, 0, 0, 1, 1,
1.122233, 0.820951, 1.890404, 1, 0, 0, 1, 1,
1.128829, 0.4224304, -0.3408129, 1, 0, 0, 1, 1,
1.135307, -0.5289415, 1.834443, 1, 0, 0, 1, 1,
1.139793, -0.8152562, 3.189163, 1, 0, 0, 1, 1,
1.144962, -2.364079, 2.708314, 0, 0, 0, 1, 1,
1.148259, -2.032309, 2.126545, 0, 0, 0, 1, 1,
1.149421, -0.9191171, 2.651139, 0, 0, 0, 1, 1,
1.153048, 0.7246731, 0.2231293, 0, 0, 0, 1, 1,
1.153211, 1.682666, 1.034158, 0, 0, 0, 1, 1,
1.153777, -0.8434249, 0.8186065, 0, 0, 0, 1, 1,
1.159651, 0.9287003, -0.1189471, 0, 0, 0, 1, 1,
1.171576, -1.075579, 2.031261, 1, 1, 1, 1, 1,
1.202774, -0.2413487, 1.81435, 1, 1, 1, 1, 1,
1.203479, -0.1957238, 1.034504, 1, 1, 1, 1, 1,
1.222492, -0.3281186, 2.309863, 1, 1, 1, 1, 1,
1.222513, 0.6614629, 0.8314611, 1, 1, 1, 1, 1,
1.247634, 0.3062016, 1.488455, 1, 1, 1, 1, 1,
1.249506, 1.179949, 0.8716401, 1, 1, 1, 1, 1,
1.250572, 0.8671222, 1.608924, 1, 1, 1, 1, 1,
1.25878, 1.251444, 0.6957829, 1, 1, 1, 1, 1,
1.271335, 0.2103449, -0.2277596, 1, 1, 1, 1, 1,
1.278956, -0.3503008, 2.747707, 1, 1, 1, 1, 1,
1.280006, -0.3523261, 1.779361, 1, 1, 1, 1, 1,
1.281059, -1.299837, 1.079856, 1, 1, 1, 1, 1,
1.281186, 0.6149157, 1.628011, 1, 1, 1, 1, 1,
1.295059, 0.04198299, 1.297928, 1, 1, 1, 1, 1,
1.296693, -2.80639, 2.117827, 0, 0, 1, 1, 1,
1.298498, 0.6546637, 1.318388, 1, 0, 0, 1, 1,
1.313177, 1.474891, -0.1331531, 1, 0, 0, 1, 1,
1.326987, 0.5413256, -1.163886, 1, 0, 0, 1, 1,
1.330023, 0.6357652, -0.5728908, 1, 0, 0, 1, 1,
1.33539, -1.087849, 1.472597, 1, 0, 0, 1, 1,
1.347106, 1.087398, 1.248909, 0, 0, 0, 1, 1,
1.347691, 0.5316194, 1.262547, 0, 0, 0, 1, 1,
1.355793, 1.055456, 1.948234, 0, 0, 0, 1, 1,
1.361762, -1.247895, 3.215977, 0, 0, 0, 1, 1,
1.370483, -1.837101, 2.26715, 0, 0, 0, 1, 1,
1.386972, 1.303079, -0.07298425, 0, 0, 0, 1, 1,
1.387585, 0.9976296, 1.207086, 0, 0, 0, 1, 1,
1.388697, 0.3645731, 0.01335753, 1, 1, 1, 1, 1,
1.41723, -0.7388658, 1.350183, 1, 1, 1, 1, 1,
1.426147, 0.626318, 0.2583337, 1, 1, 1, 1, 1,
1.427778, -1.826324, 3.239639, 1, 1, 1, 1, 1,
1.432729, 1.880738, 2.809589, 1, 1, 1, 1, 1,
1.438545, -1.083257, 3.113859, 1, 1, 1, 1, 1,
1.440514, 0.2670939, 2.843433, 1, 1, 1, 1, 1,
1.454781, -2.025245, 3.573749, 1, 1, 1, 1, 1,
1.455742, -0.4760658, 2.119693, 1, 1, 1, 1, 1,
1.461244, 0.4661069, 2.290418, 1, 1, 1, 1, 1,
1.465818, -0.03855835, 1.120986, 1, 1, 1, 1, 1,
1.468193, 1.516612, -0.5697528, 1, 1, 1, 1, 1,
1.468983, 0.9910505, 2.147261, 1, 1, 1, 1, 1,
1.478173, -0.9613586, 2.703672, 1, 1, 1, 1, 1,
1.48016, -0.2163126, 1.953328, 1, 1, 1, 1, 1,
1.481058, -0.2778139, 1.344753, 0, 0, 1, 1, 1,
1.488529, 1.035176, 1.0505, 1, 0, 0, 1, 1,
1.503363, -1.23127, 1.233855, 1, 0, 0, 1, 1,
1.506018, 0.2427015, 2.18364, 1, 0, 0, 1, 1,
1.507871, -0.1493979, 2.952715, 1, 0, 0, 1, 1,
1.523078, 1.141938, 1.634356, 1, 0, 0, 1, 1,
1.525308, -1.77914, 3.714335, 0, 0, 0, 1, 1,
1.533239, 1.874843, 0.7199319, 0, 0, 0, 1, 1,
1.554149, 0.5148109, 0.4305064, 0, 0, 0, 1, 1,
1.561214, -0.296018, 2.415752, 0, 0, 0, 1, 1,
1.561897, 0.2112561, 2.965295, 0, 0, 0, 1, 1,
1.578509, -0.423501, 0.8475639, 0, 0, 0, 1, 1,
1.603722, -1.318867, 3.008759, 0, 0, 0, 1, 1,
1.613814, 1.399557, 2.681774, 1, 1, 1, 1, 1,
1.619425, 1.122721, 3.273538, 1, 1, 1, 1, 1,
1.636303, -0.6220388, 1.876449, 1, 1, 1, 1, 1,
1.640783, -1.924825, 1.642345, 1, 1, 1, 1, 1,
1.646024, 2.701229, 0.8684471, 1, 1, 1, 1, 1,
1.652066, -1.423099, 2.850855, 1, 1, 1, 1, 1,
1.660042, -0.5725956, 1.765257, 1, 1, 1, 1, 1,
1.661602, 0.3824443, 2.301743, 1, 1, 1, 1, 1,
1.666099, 1.096963, 2.342831, 1, 1, 1, 1, 1,
1.673851, 1.175454, 1.21859, 1, 1, 1, 1, 1,
1.692685, 0.2086118, 1.497749, 1, 1, 1, 1, 1,
1.706874, -1.166192, 1.039784, 1, 1, 1, 1, 1,
1.712098, 0.6939654, 1.127554, 1, 1, 1, 1, 1,
1.714063, 0.3795193, 0.1290394, 1, 1, 1, 1, 1,
1.718387, -0.04592822, -0.3509371, 1, 1, 1, 1, 1,
1.733797, 0.9019422, 2.645613, 0, 0, 1, 1, 1,
1.737493, -0.4593347, 4.178253, 1, 0, 0, 1, 1,
1.75554, 0.7104446, 1.862376, 1, 0, 0, 1, 1,
1.764219, -0.4002833, 1.917204, 1, 0, 0, 1, 1,
1.764356, -0.5376306, 1.093514, 1, 0, 0, 1, 1,
1.77725, -0.895444, 2.578181, 1, 0, 0, 1, 1,
1.779223, -1.506327, 2.69715, 0, 0, 0, 1, 1,
1.802761, 1.745731, 2.243711, 0, 0, 0, 1, 1,
1.804056, -1.759465, 3.323561, 0, 0, 0, 1, 1,
1.827063, -0.8425748, 2.400252, 0, 0, 0, 1, 1,
1.834784, 1.67584, -0.6806012, 0, 0, 0, 1, 1,
1.850283, -1.23221, 2.685654, 0, 0, 0, 1, 1,
1.865619, 0.1605194, 0.8290765, 0, 0, 0, 1, 1,
1.868091, 0.04260008, 1.488968, 1, 1, 1, 1, 1,
1.874442, 0.8311599, 0.9560436, 1, 1, 1, 1, 1,
1.901623, 0.6020522, 1.833886, 1, 1, 1, 1, 1,
1.913514, 0.7376397, 1.114157, 1, 1, 1, 1, 1,
1.926373, -1.078163, 1.812707, 1, 1, 1, 1, 1,
1.943875, 0.2650309, 2.604422, 1, 1, 1, 1, 1,
1.95552, 0.7262548, 0.4725811, 1, 1, 1, 1, 1,
1.997538, 1.254367, 1.235774, 1, 1, 1, 1, 1,
2.003689, 0.4545101, 1.589665, 1, 1, 1, 1, 1,
2.009255, 0.857095, -0.7372808, 1, 1, 1, 1, 1,
2.029725, 2.507474, 1.902755, 1, 1, 1, 1, 1,
2.030961, 0.2228902, 3.95497, 1, 1, 1, 1, 1,
2.031628, 1.194833, 2.893212, 1, 1, 1, 1, 1,
2.078307, -1.278101, 1.472062, 1, 1, 1, 1, 1,
2.106157, -0.2397536, 1.608482, 1, 1, 1, 1, 1,
2.109232, -0.01148966, 1.290775, 0, 0, 1, 1, 1,
2.141438, 2.001149, 0.352802, 1, 0, 0, 1, 1,
2.170745, 0.4282349, 2.398226, 1, 0, 0, 1, 1,
2.223176, -1.070011, 1.797107, 1, 0, 0, 1, 1,
2.238788, 1.133845, 0.09427602, 1, 0, 0, 1, 1,
2.266206, 0.5311606, 1.143288, 1, 0, 0, 1, 1,
2.285173, -0.1597122, -0.5149475, 0, 0, 0, 1, 1,
2.389249, -0.4219818, 0.9167157, 0, 0, 0, 1, 1,
2.407115, -0.7813182, 3.163456, 0, 0, 0, 1, 1,
2.411391, 0.2522778, 2.219937, 0, 0, 0, 1, 1,
2.447701, -0.8470359, 1.742558, 0, 0, 0, 1, 1,
2.52997, -0.2975868, 2.859111, 0, 0, 0, 1, 1,
2.615597, 0.6248176, 0.6782658, 0, 0, 0, 1, 1,
2.62285, -0.3568706, 3.786919, 1, 1, 1, 1, 1,
2.686092, -1.415826, 1.486556, 1, 1, 1, 1, 1,
2.697573, 0.5655919, 1.013053, 1, 1, 1, 1, 1,
2.721953, -0.0003462135, 1.242899, 1, 1, 1, 1, 1,
2.799594, 0.3757489, 3.357327, 1, 1, 1, 1, 1,
2.81756, -0.7023708, 0.2479003, 1, 1, 1, 1, 1,
3.257969, 0.5664024, 0.4614429, 1, 1, 1, 1, 1
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
var radius = 9.277652;
var distance = 32.58736;
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
mvMatrix.translate( 0.01551199, -0.3592138, 0.6530445 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.58736);
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
