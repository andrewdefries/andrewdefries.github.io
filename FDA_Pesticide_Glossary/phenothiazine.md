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
-3.436023, -0.783394, -0.84558, 1, 0, 0, 1,
-2.78029, -0.8120305, -2.466145, 1, 0.007843138, 0, 1,
-2.505949, 0.05861302, -2.86264, 1, 0.01176471, 0, 1,
-2.484093, 0.3461871, -2.234688, 1, 0.01960784, 0, 1,
-2.448006, -0.2342305, -0.5638237, 1, 0.02352941, 0, 1,
-2.365607, -0.8782967, -3.02282, 1, 0.03137255, 0, 1,
-2.355884, 0.5592943, -2.071624, 1, 0.03529412, 0, 1,
-2.306868, 0.4213874, -1.474005, 1, 0.04313726, 0, 1,
-2.279319, -1.337596, -2.614629, 1, 0.04705882, 0, 1,
-2.2712, 0.543575, 1.025718, 1, 0.05490196, 0, 1,
-2.268118, 0.9291175, -1.490147, 1, 0.05882353, 0, 1,
-2.213219, -0.639648, -0.7259139, 1, 0.06666667, 0, 1,
-2.199854, -0.7858041, -3.220967, 1, 0.07058824, 0, 1,
-2.199251, 0.2735216, -3.480954, 1, 0.07843138, 0, 1,
-2.187459, 0.526533, -3.482341, 1, 0.08235294, 0, 1,
-2.182185, -1.181055, -2.306538, 1, 0.09019608, 0, 1,
-2.18084, 0.01860246, -1.529588, 1, 0.09411765, 0, 1,
-2.129239, -0.7834601, -2.218314, 1, 0.1019608, 0, 1,
-2.120787, 0.5220081, -0.9062213, 1, 0.1098039, 0, 1,
-2.117877, 0.773522, -0.4477044, 1, 0.1137255, 0, 1,
-2.114767, 1.640287, -0.8608825, 1, 0.1215686, 0, 1,
-2.102966, -1.037162, -3.625139, 1, 0.1254902, 0, 1,
-2.099545, -1.269877, -1.135924, 1, 0.1333333, 0, 1,
-2.091446, 0.8943044, -1.290515, 1, 0.1372549, 0, 1,
-2.070408, -1.392826, -2.777359, 1, 0.145098, 0, 1,
-2.003855, 0.9579774, 0.440077, 1, 0.1490196, 0, 1,
-1.996475, 0.7533433, 0.08753913, 1, 0.1568628, 0, 1,
-1.99381, 0.5321507, -0.4461059, 1, 0.1607843, 0, 1,
-1.965856, -0.326964, -0.3638933, 1, 0.1686275, 0, 1,
-1.964618, -1.340232, -2.198638, 1, 0.172549, 0, 1,
-1.949137, -0.3021362, -0.8727938, 1, 0.1803922, 0, 1,
-1.945035, 0.4567302, -0.9397078, 1, 0.1843137, 0, 1,
-1.941662, 0.7143345, -2.96498, 1, 0.1921569, 0, 1,
-1.904048, -0.5137036, -1.4884, 1, 0.1960784, 0, 1,
-1.895794, -0.881782, -3.90273, 1, 0.2039216, 0, 1,
-1.883526, -0.1899153, -1.362618, 1, 0.2117647, 0, 1,
-1.873455, 0.1209348, -1.153402, 1, 0.2156863, 0, 1,
-1.867535, 0.9762536, -1.47388, 1, 0.2235294, 0, 1,
-1.837548, 0.1701517, -0.9594181, 1, 0.227451, 0, 1,
-1.809725, 0.134861, -4.122645, 1, 0.2352941, 0, 1,
-1.809314, -0.5680676, -0.4143433, 1, 0.2392157, 0, 1,
-1.798823, -1.100769, -2.144815, 1, 0.2470588, 0, 1,
-1.793477, -0.7294294, -3.323367, 1, 0.2509804, 0, 1,
-1.749271, -0.08474741, -0.9183413, 1, 0.2588235, 0, 1,
-1.745392, 0.2567573, -0.4193784, 1, 0.2627451, 0, 1,
-1.730799, -1.218114, -2.873876, 1, 0.2705882, 0, 1,
-1.729866, 0.5150205, -1.437187, 1, 0.2745098, 0, 1,
-1.728093, -1.577696, -3.940133, 1, 0.282353, 0, 1,
-1.704342, -0.238281, -1.444018, 1, 0.2862745, 0, 1,
-1.699026, 2.355976, -0.2981291, 1, 0.2941177, 0, 1,
-1.674827, 0.9607985, -0.9762521, 1, 0.3019608, 0, 1,
-1.65975, -1.115298, -1.187916, 1, 0.3058824, 0, 1,
-1.655391, -0.5402938, -3.077344, 1, 0.3137255, 0, 1,
-1.64264, 0.4998724, -1.036056, 1, 0.3176471, 0, 1,
-1.613327, -0.4144131, -2.143253, 1, 0.3254902, 0, 1,
-1.609626, 2.098727, -1.252869, 1, 0.3294118, 0, 1,
-1.60786, -1.996136, -0.9664571, 1, 0.3372549, 0, 1,
-1.60088, 1.467931, -1.428036, 1, 0.3411765, 0, 1,
-1.597778, -1.000374, -2.951471, 1, 0.3490196, 0, 1,
-1.591976, 2.064613, -0.5354482, 1, 0.3529412, 0, 1,
-1.586055, -0.3167408, -3.429788, 1, 0.3607843, 0, 1,
-1.582217, 1.730949, 0.5183524, 1, 0.3647059, 0, 1,
-1.577159, 0.450177, -1.582685, 1, 0.372549, 0, 1,
-1.572571, -0.2044473, -1.065885, 1, 0.3764706, 0, 1,
-1.56679, 0.08449316, -0.8871921, 1, 0.3843137, 0, 1,
-1.564686, -0.002013174, -1.163357, 1, 0.3882353, 0, 1,
-1.559349, -0.9617889, -1.229782, 1, 0.3960784, 0, 1,
-1.556828, 0.08210456, -0.6960887, 1, 0.4039216, 0, 1,
-1.544406, -0.1126275, -1.742102, 1, 0.4078431, 0, 1,
-1.541498, -0.31298, -2.722513, 1, 0.4156863, 0, 1,
-1.540529, -0.2718963, -1.633947, 1, 0.4196078, 0, 1,
-1.51348, -0.2339431, -1.71117, 1, 0.427451, 0, 1,
-1.507121, -0.1853993, -2.37676, 1, 0.4313726, 0, 1,
-1.497294, -0.1173656, -2.353785, 1, 0.4392157, 0, 1,
-1.495661, 0.5215683, -0.7965655, 1, 0.4431373, 0, 1,
-1.491897, -0.8038013, -1.882465, 1, 0.4509804, 0, 1,
-1.475341, -0.5434566, -2.661458, 1, 0.454902, 0, 1,
-1.473546, 0.3790986, 0.9365593, 1, 0.4627451, 0, 1,
-1.471371, 0.6043476, -1.262531, 1, 0.4666667, 0, 1,
-1.471041, 0.2431383, -0.9045508, 1, 0.4745098, 0, 1,
-1.461981, 1.109032, -1.388648, 1, 0.4784314, 0, 1,
-1.448415, -0.6098582, -1.954569, 1, 0.4862745, 0, 1,
-1.39804, -0.08085912, -1.435836, 1, 0.4901961, 0, 1,
-1.391646, 1.130207, -0.08775291, 1, 0.4980392, 0, 1,
-1.390468, -0.03427918, -3.725796, 1, 0.5058824, 0, 1,
-1.38831, 0.2622451, -0.9259436, 1, 0.509804, 0, 1,
-1.351241, -0.3360844, -3.697212, 1, 0.5176471, 0, 1,
-1.342435, -1.192054, -1.574096, 1, 0.5215687, 0, 1,
-1.341599, 0.2236899, -0.09354626, 1, 0.5294118, 0, 1,
-1.340299, 0.449122, -1.835353, 1, 0.5333334, 0, 1,
-1.332796, -0.4118092, -2.37377, 1, 0.5411765, 0, 1,
-1.317438, -0.272157, -2.687429, 1, 0.5450981, 0, 1,
-1.303854, 0.6125776, -1.813007, 1, 0.5529412, 0, 1,
-1.303555, 0.6437259, -0.8117178, 1, 0.5568628, 0, 1,
-1.302675, 1.3626, -0.08783357, 1, 0.5647059, 0, 1,
-1.297895, -0.2292366, -1.245491, 1, 0.5686275, 0, 1,
-1.280825, -3.005934, -1.568494, 1, 0.5764706, 0, 1,
-1.279338, 0.3854505, -2.28434, 1, 0.5803922, 0, 1,
-1.266629, -0.360707, -1.758245, 1, 0.5882353, 0, 1,
-1.258049, -0.08474179, -0.4603626, 1, 0.5921569, 0, 1,
-1.257516, 0.7603899, -2.584628, 1, 0.6, 0, 1,
-1.250709, -0.4172769, -2.184952, 1, 0.6078432, 0, 1,
-1.226674, 0.5971585, -1.443377, 1, 0.6117647, 0, 1,
-1.217602, -0.3134698, -1.002092, 1, 0.6196079, 0, 1,
-1.216976, 0.7788632, -0.7341549, 1, 0.6235294, 0, 1,
-1.211967, -0.06091188, -0.1849878, 1, 0.6313726, 0, 1,
-1.211834, -0.7744328, -3.035957, 1, 0.6352941, 0, 1,
-1.205515, 0.8443393, -1.40677, 1, 0.6431373, 0, 1,
-1.205435, -1.643673, -3.918307, 1, 0.6470588, 0, 1,
-1.198964, 0.8138092, -0.06674373, 1, 0.654902, 0, 1,
-1.18758, -0.2705118, -2.660078, 1, 0.6588235, 0, 1,
-1.186306, 0.2075645, -0.6921163, 1, 0.6666667, 0, 1,
-1.181183, -0.02323454, -1.60705, 1, 0.6705883, 0, 1,
-1.16921, 1.582108, -1.286939, 1, 0.6784314, 0, 1,
-1.169129, 0.2151902, -1.838777, 1, 0.682353, 0, 1,
-1.168455, 1.836389, -0.09567137, 1, 0.6901961, 0, 1,
-1.166531, 0.5298891, 1.804767, 1, 0.6941177, 0, 1,
-1.164316, 0.01734908, -1.662084, 1, 0.7019608, 0, 1,
-1.160249, 0.1960109, -1.069613, 1, 0.7098039, 0, 1,
-1.15883, 0.8211638, -0.0988498, 1, 0.7137255, 0, 1,
-1.156265, 0.2962761, -2.17147, 1, 0.7215686, 0, 1,
-1.143416, -0.0996367, -3.04174, 1, 0.7254902, 0, 1,
-1.142337, -0.6064098, -0.5015171, 1, 0.7333333, 0, 1,
-1.139036, -0.2719966, -0.8807097, 1, 0.7372549, 0, 1,
-1.137641, 0.7943741, -0.7869558, 1, 0.7450981, 0, 1,
-1.13246, 0.4832742, -0.8679131, 1, 0.7490196, 0, 1,
-1.1247, -0.3135722, -2.90662, 1, 0.7568628, 0, 1,
-1.120937, -1.444925, -3.15383, 1, 0.7607843, 0, 1,
-1.115938, -1.11007, -2.118445, 1, 0.7686275, 0, 1,
-1.115217, 0.6222227, -2.049099, 1, 0.772549, 0, 1,
-1.111635, 0.7191486, -1.156653, 1, 0.7803922, 0, 1,
-1.105693, -0.6410478, -1.633082, 1, 0.7843137, 0, 1,
-1.105292, 0.8915468, 0.1606384, 1, 0.7921569, 0, 1,
-1.103448, -2.968797, -3.368104, 1, 0.7960784, 0, 1,
-1.101663, 0.8052426, -0.06491076, 1, 0.8039216, 0, 1,
-1.099236, -0.1795521, -1.156366, 1, 0.8117647, 0, 1,
-1.096921, -1.662497, -0.9701427, 1, 0.8156863, 0, 1,
-1.09619, -0.9291006, -2.825461, 1, 0.8235294, 0, 1,
-1.093397, -0.6605522, -3.030354, 1, 0.827451, 0, 1,
-1.083907, 0.6367472, -1.435399, 1, 0.8352941, 0, 1,
-1.083904, 0.2796139, -1.021092, 1, 0.8392157, 0, 1,
-1.079253, 0.5009774, 0.7689942, 1, 0.8470588, 0, 1,
-1.078875, -0.1642173, 0.9070509, 1, 0.8509804, 0, 1,
-1.073446, 0.181529, -1.126212, 1, 0.8588235, 0, 1,
-1.06883, -1.444731, -3.25745, 1, 0.8627451, 0, 1,
-1.067254, -0.5813037, -2.402126, 1, 0.8705882, 0, 1,
-1.062875, 1.078657, 0.5837765, 1, 0.8745098, 0, 1,
-1.060997, -0.8628502, -2.610743, 1, 0.8823529, 0, 1,
-1.060674, 1.592054, -1.316874, 1, 0.8862745, 0, 1,
-1.057624, -0.731425, -1.517351, 1, 0.8941177, 0, 1,
-1.048712, 0.8020497, -0.9758406, 1, 0.8980392, 0, 1,
-1.040834, -1.260053, -2.345879, 1, 0.9058824, 0, 1,
-1.037006, -0.3631472, -0.8286477, 1, 0.9137255, 0, 1,
-1.023384, 0.2616022, -0.4807217, 1, 0.9176471, 0, 1,
-1.0215, -0.705148, -1.660581, 1, 0.9254902, 0, 1,
-1.018646, -1.931469, -5.014069, 1, 0.9294118, 0, 1,
-1.018281, 1.233769, -1.824362, 1, 0.9372549, 0, 1,
-1.004437, 0.008691474, -0.3306552, 1, 0.9411765, 0, 1,
-0.9968963, -0.3010561, -1.125061, 1, 0.9490196, 0, 1,
-0.995594, -1.171333, -2.67024, 1, 0.9529412, 0, 1,
-0.9949772, -0.7166171, -1.689894, 1, 0.9607843, 0, 1,
-0.9945274, -0.885691, -3.003919, 1, 0.9647059, 0, 1,
-0.9832929, 0.08696598, -1.061291, 1, 0.972549, 0, 1,
-0.9707395, -1.584891, -3.305546, 1, 0.9764706, 0, 1,
-0.968767, 0.7340226, -0.2998821, 1, 0.9843137, 0, 1,
-0.9633135, -1.051758, -3.343021, 1, 0.9882353, 0, 1,
-0.9592054, 2.677866, -0.2500739, 1, 0.9960784, 0, 1,
-0.9562808, 0.6956189, -1.098178, 0.9960784, 1, 0, 1,
-0.9472865, 0.9106204, -0.8177934, 0.9921569, 1, 0, 1,
-0.9465067, 1.487482, -1.138301, 0.9843137, 1, 0, 1,
-0.9446771, 0.07356692, -2.07114, 0.9803922, 1, 0, 1,
-0.9444904, 0.239241, -0.4724813, 0.972549, 1, 0, 1,
-0.944338, -0.6416858, -0.4464569, 0.9686275, 1, 0, 1,
-0.941932, -0.8507929, -3.930879, 0.9607843, 1, 0, 1,
-0.9389579, 2.291801, -1.577693, 0.9568627, 1, 0, 1,
-0.9271349, -1.704876, -3.228106, 0.9490196, 1, 0, 1,
-0.9246646, -0.7237936, -2.52861, 0.945098, 1, 0, 1,
-0.9221575, 0.9085646, -0.6118761, 0.9372549, 1, 0, 1,
-0.9129023, -1.586003, -2.794345, 0.9333333, 1, 0, 1,
-0.9097075, 0.5927745, -2.153863, 0.9254902, 1, 0, 1,
-0.9049942, 0.1390769, -3.014324, 0.9215686, 1, 0, 1,
-0.9032654, 0.5414098, -1.314414, 0.9137255, 1, 0, 1,
-0.9028485, 1.531252, 1.168887, 0.9098039, 1, 0, 1,
-0.8966145, 0.9225904, -2.356745, 0.9019608, 1, 0, 1,
-0.8947244, 0.4951492, -1.460368, 0.8941177, 1, 0, 1,
-0.876784, -0.7323923, -1.499787, 0.8901961, 1, 0, 1,
-0.8720458, -0.6517575, -1.0798, 0.8823529, 1, 0, 1,
-0.8716363, -0.1453618, -1.279593, 0.8784314, 1, 0, 1,
-0.8629279, -0.2486816, -0.1993105, 0.8705882, 1, 0, 1,
-0.861019, 1.673334, -0.3647382, 0.8666667, 1, 0, 1,
-0.860729, 1.090857, 1.281574, 0.8588235, 1, 0, 1,
-0.8581473, 1.553373, -1.503187, 0.854902, 1, 0, 1,
-0.8536872, -1.051848, -1.888828, 0.8470588, 1, 0, 1,
-0.8528593, 1.434635, -1.42703, 0.8431373, 1, 0, 1,
-0.8497298, 0.4913417, -1.485109, 0.8352941, 1, 0, 1,
-0.8460849, -1.537449, -3.490218, 0.8313726, 1, 0, 1,
-0.8445076, -0.5446573, -2.926552, 0.8235294, 1, 0, 1,
-0.8433955, 0.3882411, -1.575873, 0.8196079, 1, 0, 1,
-0.8433487, -0.7381191, -1.957301, 0.8117647, 1, 0, 1,
-0.8348837, -1.334933, -1.236204, 0.8078431, 1, 0, 1,
-0.8320368, 0.5637879, -1.719612, 0.8, 1, 0, 1,
-0.8319435, 1.479068, -0.2646503, 0.7921569, 1, 0, 1,
-0.8307917, 1.098867, 1.680117, 0.7882353, 1, 0, 1,
-0.8282744, -0.2956639, -1.711521, 0.7803922, 1, 0, 1,
-0.8232601, 0.3968787, 1.021464, 0.7764706, 1, 0, 1,
-0.8227056, -1.114125, -3.715438, 0.7686275, 1, 0, 1,
-0.8217009, -0.2198987, -3.037241, 0.7647059, 1, 0, 1,
-0.8168253, 0.1455529, -0.4005832, 0.7568628, 1, 0, 1,
-0.8120394, 1.660824, -0.7340587, 0.7529412, 1, 0, 1,
-0.8043451, -0.1540107, -0.7024654, 0.7450981, 1, 0, 1,
-0.8013878, 0.8104216, -1.082302, 0.7411765, 1, 0, 1,
-0.8006846, 0.3548053, -1.039608, 0.7333333, 1, 0, 1,
-0.80019, -1.195662, -2.9148, 0.7294118, 1, 0, 1,
-0.794279, 0.1353608, -1.413956, 0.7215686, 1, 0, 1,
-0.7883094, -0.6922931, -1.424083, 0.7176471, 1, 0, 1,
-0.7828274, -0.6146175, -0.1831097, 0.7098039, 1, 0, 1,
-0.7825698, 0.7800223, -0.03954535, 0.7058824, 1, 0, 1,
-0.7807565, -1.588015, -0.2702223, 0.6980392, 1, 0, 1,
-0.7779835, -1.527013, -1.952179, 0.6901961, 1, 0, 1,
-0.7757041, 0.2299634, -2.735196, 0.6862745, 1, 0, 1,
-0.7690456, -0.1596537, -2.706856, 0.6784314, 1, 0, 1,
-0.7628204, -0.7031459, -1.587963, 0.6745098, 1, 0, 1,
-0.7621127, 1.085932, 1.193311, 0.6666667, 1, 0, 1,
-0.7611235, 0.9678896, -0.6673799, 0.6627451, 1, 0, 1,
-0.7591226, 0.2107572, -2.435839, 0.654902, 1, 0, 1,
-0.748663, 0.1966467, -1.113703, 0.6509804, 1, 0, 1,
-0.7460724, -0.1946465, -3.033485, 0.6431373, 1, 0, 1,
-0.7446209, 1.765317, -0.1196804, 0.6392157, 1, 0, 1,
-0.743606, 1.133065, -0.403866, 0.6313726, 1, 0, 1,
-0.7390066, 1.607287, 0.4528038, 0.627451, 1, 0, 1,
-0.7344015, -1.405677, -2.432201, 0.6196079, 1, 0, 1,
-0.7332171, 0.4829787, -0.3843221, 0.6156863, 1, 0, 1,
-0.7276617, 0.197825, -1.32421, 0.6078432, 1, 0, 1,
-0.7260001, -0.6900789, -3.079226, 0.6039216, 1, 0, 1,
-0.7230293, 1.314327, -1.702575, 0.5960785, 1, 0, 1,
-0.7204177, 0.7704929, -0.7735651, 0.5882353, 1, 0, 1,
-0.7197795, -1.104075, -2.103081, 0.5843138, 1, 0, 1,
-0.7182928, 0.9620478, -2.384689, 0.5764706, 1, 0, 1,
-0.7176335, 0.2568946, -1.240798, 0.572549, 1, 0, 1,
-0.7151142, -1.98402, -2.922741, 0.5647059, 1, 0, 1,
-0.7044185, -0.6064882, -3.226354, 0.5607843, 1, 0, 1,
-0.7031782, 0.8301014, -0.8999605, 0.5529412, 1, 0, 1,
-0.6992217, 0.1683093, -0.4084088, 0.5490196, 1, 0, 1,
-0.6984202, -0.01640264, -1.44537, 0.5411765, 1, 0, 1,
-0.6954975, 0.07356835, 0.4480116, 0.5372549, 1, 0, 1,
-0.6947481, -0.4428563, -2.443444, 0.5294118, 1, 0, 1,
-0.6902153, 0.01449749, -2.936855, 0.5254902, 1, 0, 1,
-0.6880906, 1.301763, -2.03522, 0.5176471, 1, 0, 1,
-0.683422, -0.318852, -1.081614, 0.5137255, 1, 0, 1,
-0.6805531, -0.3633526, -2.198599, 0.5058824, 1, 0, 1,
-0.6744269, 1.107213, 1.052497, 0.5019608, 1, 0, 1,
-0.6730207, 0.5253633, -0.3205593, 0.4941176, 1, 0, 1,
-0.6719025, 0.03508561, 0.3352037, 0.4862745, 1, 0, 1,
-0.6683991, 0.6027283, -2.354363, 0.4823529, 1, 0, 1,
-0.6683745, -1.612441, -2.827883, 0.4745098, 1, 0, 1,
-0.6664956, -1.231851, -2.055254, 0.4705882, 1, 0, 1,
-0.663515, 1.188565, 1.600431, 0.4627451, 1, 0, 1,
-0.661696, -1.067473, -3.287353, 0.4588235, 1, 0, 1,
-0.6579951, -1.591475, -2.701239, 0.4509804, 1, 0, 1,
-0.6576573, -0.04883637, -0.8182539, 0.4470588, 1, 0, 1,
-0.6569827, 0.7481253, -1.078526, 0.4392157, 1, 0, 1,
-0.6464026, 0.8226275, -1.656616, 0.4352941, 1, 0, 1,
-0.6460559, -0.7348281, -1.475311, 0.427451, 1, 0, 1,
-0.6438044, -0.1289538, -2.728553, 0.4235294, 1, 0, 1,
-0.6400431, 0.08647681, -1.601842, 0.4156863, 1, 0, 1,
-0.6383629, -0.3953441, -1.248737, 0.4117647, 1, 0, 1,
-0.6313163, -0.6299517, -1.856142, 0.4039216, 1, 0, 1,
-0.6293821, 0.09924586, 0.6413366, 0.3960784, 1, 0, 1,
-0.6224673, -0.7052099, -2.051833, 0.3921569, 1, 0, 1,
-0.6215976, 0.05312261, -1.980285, 0.3843137, 1, 0, 1,
-0.6214409, -1.056124, -1.328827, 0.3803922, 1, 0, 1,
-0.6199415, -0.8353979, -2.123354, 0.372549, 1, 0, 1,
-0.6185794, -0.4279881, -2.559502, 0.3686275, 1, 0, 1,
-0.6175659, -1.360534, -2.632433, 0.3607843, 1, 0, 1,
-0.6169811, 0.7210869, -0.6942138, 0.3568628, 1, 0, 1,
-0.616348, -0.1451598, -0.5962516, 0.3490196, 1, 0, 1,
-0.6156368, 0.1017402, -2.014853, 0.345098, 1, 0, 1,
-0.6132987, -0.1299593, -1.111052, 0.3372549, 1, 0, 1,
-0.6059256, -1.015359, -2.068065, 0.3333333, 1, 0, 1,
-0.6025013, 0.2131514, 0.3549893, 0.3254902, 1, 0, 1,
-0.5965322, 1.489484, -2.775473, 0.3215686, 1, 0, 1,
-0.5920749, 0.7323253, -0.2664, 0.3137255, 1, 0, 1,
-0.5864463, -1.615874, -4.604555, 0.3098039, 1, 0, 1,
-0.5832424, -0.0597376, -0.5039196, 0.3019608, 1, 0, 1,
-0.5817836, -1.183768, -2.629894, 0.2941177, 1, 0, 1,
-0.5785969, 0.5949682, -1.711964, 0.2901961, 1, 0, 1,
-0.5775223, -0.1353089, -2.33376, 0.282353, 1, 0, 1,
-0.576657, 1.006372, -1.442786, 0.2784314, 1, 0, 1,
-0.5765473, -0.4384215, -0.8254446, 0.2705882, 1, 0, 1,
-0.5759715, -0.1824687, -2.259882, 0.2666667, 1, 0, 1,
-0.5755279, 0.365158, -1.940411, 0.2588235, 1, 0, 1,
-0.5736964, -2.394012, -1.572021, 0.254902, 1, 0, 1,
-0.5735302, -0.6056231, -2.391401, 0.2470588, 1, 0, 1,
-0.5728285, 0.7241607, -0.1208911, 0.2431373, 1, 0, 1,
-0.5702289, -2.640861, -3.513985, 0.2352941, 1, 0, 1,
-0.5700669, 0.1143907, -0.05663556, 0.2313726, 1, 0, 1,
-0.5652897, -0.8440306, -2.599184, 0.2235294, 1, 0, 1,
-0.5616408, 0.6386986, 0.5444744, 0.2196078, 1, 0, 1,
-0.5554726, -1.261673, -3.225123, 0.2117647, 1, 0, 1,
-0.55387, 1.144298, 0.8671817, 0.2078431, 1, 0, 1,
-0.5484047, 0.2061342, -2.214041, 0.2, 1, 0, 1,
-0.5448162, -0.8297651, -2.418084, 0.1921569, 1, 0, 1,
-0.5426248, -1.135704, -2.608057, 0.1882353, 1, 0, 1,
-0.5425943, 2.256098, -0.5063523, 0.1803922, 1, 0, 1,
-0.5396306, 0.3857301, 0.1635984, 0.1764706, 1, 0, 1,
-0.5370942, -1.103901, -1.768406, 0.1686275, 1, 0, 1,
-0.5353676, -0.2844455, -0.4272342, 0.1647059, 1, 0, 1,
-0.533734, 0.9770214, -0.4267123, 0.1568628, 1, 0, 1,
-0.5325678, 0.5500996, -0.6641967, 0.1529412, 1, 0, 1,
-0.52533, 0.8511296, 0.9975483, 0.145098, 1, 0, 1,
-0.5233237, -1.141322, -2.252702, 0.1411765, 1, 0, 1,
-0.5169414, -0.07333861, -2.723562, 0.1333333, 1, 0, 1,
-0.5161266, -0.1105166, -3.059843, 0.1294118, 1, 0, 1,
-0.5157323, -2.716259, -5.15456, 0.1215686, 1, 0, 1,
-0.5129582, 0.4258032, 0.7830329, 0.1176471, 1, 0, 1,
-0.5102404, -0.2489222, -2.360917, 0.1098039, 1, 0, 1,
-0.508803, 0.4374889, -1.55722, 0.1058824, 1, 0, 1,
-0.506502, -0.04151882, -1.355129, 0.09803922, 1, 0, 1,
-0.5041405, -0.05335425, -1.842234, 0.09019608, 1, 0, 1,
-0.5005136, -1.23678, -3.333827, 0.08627451, 1, 0, 1,
-0.4954, 0.707768, -1.731736, 0.07843138, 1, 0, 1,
-0.4922693, 0.01417548, -1.288077, 0.07450981, 1, 0, 1,
-0.4896221, 0.0163048, -3.062339, 0.06666667, 1, 0, 1,
-0.4882911, -0.4259401, -2.570472, 0.0627451, 1, 0, 1,
-0.4805971, 0.4887734, -1.456776, 0.05490196, 1, 0, 1,
-0.4708613, 0.2807485, -0.3845209, 0.05098039, 1, 0, 1,
-0.4690928, -0.3359704, -1.459931, 0.04313726, 1, 0, 1,
-0.4642038, 0.2058717, -0.8674564, 0.03921569, 1, 0, 1,
-0.4609718, 0.05899256, -3.091467, 0.03137255, 1, 0, 1,
-0.4574024, 0.8337182, -2.44779, 0.02745098, 1, 0, 1,
-0.4566936, -2.043367, -2.616745, 0.01960784, 1, 0, 1,
-0.4563116, 1.720868, -0.2514225, 0.01568628, 1, 0, 1,
-0.4550266, 0.1180484, -1.17221, 0.007843138, 1, 0, 1,
-0.4523244, -0.8687415, -4.130898, 0.003921569, 1, 0, 1,
-0.4512373, -1.683411, -1.924203, 0, 1, 0.003921569, 1,
-0.4498465, 1.408795, -0.5498663, 0, 1, 0.01176471, 1,
-0.4478667, 0.6474052, -0.5679145, 0, 1, 0.01568628, 1,
-0.4465479, 0.6948581, -1.300319, 0, 1, 0.02352941, 1,
-0.4445561, -0.8504097, -2.408329, 0, 1, 0.02745098, 1,
-0.4434396, 1.211823, -0.3534436, 0, 1, 0.03529412, 1,
-0.4426493, 0.4739922, -1.093945, 0, 1, 0.03921569, 1,
-0.4358658, -1.017824, -2.968839, 0, 1, 0.04705882, 1,
-0.4356783, -0.4107753, -0.6531708, 0, 1, 0.05098039, 1,
-0.4347515, 1.108713, -0.1435183, 0, 1, 0.05882353, 1,
-0.4339533, -0.2598521, -0.8593382, 0, 1, 0.0627451, 1,
-0.4310161, 0.598148, -1.508817, 0, 1, 0.07058824, 1,
-0.4226011, -0.3821209, -2.15587, 0, 1, 0.07450981, 1,
-0.4067247, -0.04542609, -2.874245, 0, 1, 0.08235294, 1,
-0.4050651, -0.5225575, -4.319452, 0, 1, 0.08627451, 1,
-0.4007411, -1.962693, -2.749871, 0, 1, 0.09411765, 1,
-0.4004022, 0.8916301, -0.280506, 0, 1, 0.1019608, 1,
-0.3977498, 0.3972608, -1.706254, 0, 1, 0.1058824, 1,
-0.3943692, -0.3915001, -3.265423, 0, 1, 0.1137255, 1,
-0.3930799, 1.602672, 1.756624, 0, 1, 0.1176471, 1,
-0.390205, -0.8027726, -1.729247, 0, 1, 0.1254902, 1,
-0.3875637, 0.3478042, -0.2123769, 0, 1, 0.1294118, 1,
-0.385714, 0.8796311, 0.7231081, 0, 1, 0.1372549, 1,
-0.3840776, 1.299717, 1.078621, 0, 1, 0.1411765, 1,
-0.3832296, -0.3765481, -0.7118168, 0, 1, 0.1490196, 1,
-0.382699, 0.5949966, -0.0778344, 0, 1, 0.1529412, 1,
-0.3718503, 0.5371206, -0.9067295, 0, 1, 0.1607843, 1,
-0.3703006, 0.8820241, -1.164485, 0, 1, 0.1647059, 1,
-0.3697498, 0.05852302, -0.2682551, 0, 1, 0.172549, 1,
-0.3659024, -0.2927973, -3.464135, 0, 1, 0.1764706, 1,
-0.361007, 0.8513139, 0.02813356, 0, 1, 0.1843137, 1,
-0.3553196, 0.2266312, -2.093762, 0, 1, 0.1882353, 1,
-0.3544148, 0.1161307, -1.678514, 0, 1, 0.1960784, 1,
-0.3521541, -0.6075477, -1.002628, 0, 1, 0.2039216, 1,
-0.3470106, 0.3405308, 0.7418608, 0, 1, 0.2078431, 1,
-0.3437341, -0.3016343, -3.424856, 0, 1, 0.2156863, 1,
-0.338718, 0.001664199, -0.6334316, 0, 1, 0.2196078, 1,
-0.3385844, -0.6503947, -2.900195, 0, 1, 0.227451, 1,
-0.3346936, 0.3904434, -2.687492, 0, 1, 0.2313726, 1,
-0.3329349, -0.6745655, -2.655739, 0, 1, 0.2392157, 1,
-0.3287812, 1.461812, -0.1931535, 0, 1, 0.2431373, 1,
-0.3279412, 1.29215, -1.408577, 0, 1, 0.2509804, 1,
-0.3272617, 0.05269842, -0.7388402, 0, 1, 0.254902, 1,
-0.3266497, 0.5064069, -1.316855, 0, 1, 0.2627451, 1,
-0.3239082, 1.251303, -1.222445, 0, 1, 0.2666667, 1,
-0.3204693, 1.225857, -1.238028, 0, 1, 0.2745098, 1,
-0.3176873, -4.171393, -3.438321, 0, 1, 0.2784314, 1,
-0.3132614, -0.9901504, -2.489218, 0, 1, 0.2862745, 1,
-0.3097831, 0.4630547, -2.187557, 0, 1, 0.2901961, 1,
-0.3012397, 0.5752209, -0.7548611, 0, 1, 0.2980392, 1,
-0.299238, 1.583846, -0.7676147, 0, 1, 0.3058824, 1,
-0.2975464, 0.8200719, 0.9608284, 0, 1, 0.3098039, 1,
-0.2847178, 0.8580769, -0.04695056, 0, 1, 0.3176471, 1,
-0.284259, 0.1024145, -0.7349445, 0, 1, 0.3215686, 1,
-0.2829881, -0.5291649, -3.036689, 0, 1, 0.3294118, 1,
-0.2818678, 0.2458281, -0.3256983, 0, 1, 0.3333333, 1,
-0.2810577, 0.1160145, -0.7593071, 0, 1, 0.3411765, 1,
-0.2790041, -0.7485507, -2.151501, 0, 1, 0.345098, 1,
-0.2786129, 0.08839016, -1.645535, 0, 1, 0.3529412, 1,
-0.2752142, -0.5737476, -1.410873, 0, 1, 0.3568628, 1,
-0.2735544, -0.9081462, -2.624476, 0, 1, 0.3647059, 1,
-0.2734787, -0.7510255, -1.243453, 0, 1, 0.3686275, 1,
-0.2705224, -0.5167886, -3.993221, 0, 1, 0.3764706, 1,
-0.2690891, -2.553815, -3.346131, 0, 1, 0.3803922, 1,
-0.2687067, 0.7652077, 0.7345184, 0, 1, 0.3882353, 1,
-0.2684611, -0.643957, -3.949452, 0, 1, 0.3921569, 1,
-0.266611, -3.080711, -2.336905, 0, 1, 0.4, 1,
-0.2646038, -0.2047691, -2.05708, 0, 1, 0.4078431, 1,
-0.2631661, -0.7425814, -3.65565, 0, 1, 0.4117647, 1,
-0.2594875, 1.485754, -0.8391916, 0, 1, 0.4196078, 1,
-0.2548024, -0.3881626, -2.54053, 0, 1, 0.4235294, 1,
-0.2545251, -0.02993422, -0.7986599, 0, 1, 0.4313726, 1,
-0.2519903, 1.286924, 0.7163764, 0, 1, 0.4352941, 1,
-0.250233, -0.5863891, -3.12685, 0, 1, 0.4431373, 1,
-0.2475873, -0.7606801, -2.73755, 0, 1, 0.4470588, 1,
-0.2427751, 1.419184, -0.3267035, 0, 1, 0.454902, 1,
-0.2420067, -0.332698, -3.767502, 0, 1, 0.4588235, 1,
-0.2386405, -1.9551, -3.253597, 0, 1, 0.4666667, 1,
-0.238137, 0.9977764, 1.164033, 0, 1, 0.4705882, 1,
-0.2352305, 0.8432281, 0.831383, 0, 1, 0.4784314, 1,
-0.2351634, 1.091291, -0.366792, 0, 1, 0.4823529, 1,
-0.2309769, 0.5050706, -0.4802771, 0, 1, 0.4901961, 1,
-0.2306261, 0.7665598, -0.2692938, 0, 1, 0.4941176, 1,
-0.2239723, 0.6220893, -0.7906095, 0, 1, 0.5019608, 1,
-0.2140212, -0.7158525, -1.674428, 0, 1, 0.509804, 1,
-0.2093634, -1.748422, -0.1285446, 0, 1, 0.5137255, 1,
-0.2081328, -0.0900571, -1.869012, 0, 1, 0.5215687, 1,
-0.2054572, -0.1262607, -1.801333, 0, 1, 0.5254902, 1,
-0.2047245, -1.662067, -2.562143, 0, 1, 0.5333334, 1,
-0.2044883, -0.1140733, -4.461059, 0, 1, 0.5372549, 1,
-0.2029047, 0.8911235, -1.019729, 0, 1, 0.5450981, 1,
-0.2022734, 2.056926, 0.3421527, 0, 1, 0.5490196, 1,
-0.1953468, -0.7297714, -2.259377, 0, 1, 0.5568628, 1,
-0.1936266, -1.740763, -4.616662, 0, 1, 0.5607843, 1,
-0.188749, -0.0552798, -0.3255713, 0, 1, 0.5686275, 1,
-0.1882364, 0.06002244, -0.7157043, 0, 1, 0.572549, 1,
-0.1881359, 0.07216761, -3.001413, 0, 1, 0.5803922, 1,
-0.1877191, -1.717282, -3.003335, 0, 1, 0.5843138, 1,
-0.1875211, -0.1350992, -2.335117, 0, 1, 0.5921569, 1,
-0.1822636, 1.27542, 1.394438, 0, 1, 0.5960785, 1,
-0.1805352, -0.09497754, -0.7484143, 0, 1, 0.6039216, 1,
-0.1772484, -0.5067312, -2.189779, 0, 1, 0.6117647, 1,
-0.176957, 1.198606, -1.748394, 0, 1, 0.6156863, 1,
-0.1731088, -1.535329, -2.407226, 0, 1, 0.6235294, 1,
-0.1715431, 1.461103, 0.6204277, 0, 1, 0.627451, 1,
-0.1687255, -0.2293117, -2.177223, 0, 1, 0.6352941, 1,
-0.1685106, -2.13084, -2.208884, 0, 1, 0.6392157, 1,
-0.1678597, 1.13613, 0.2069142, 0, 1, 0.6470588, 1,
-0.1606753, -0.7820397, -1.31144, 0, 1, 0.6509804, 1,
-0.1604293, 1.033851, 0.760812, 0, 1, 0.6588235, 1,
-0.1585081, -0.7727715, -4.067472, 0, 1, 0.6627451, 1,
-0.1569677, -1.729677, -3.735389, 0, 1, 0.6705883, 1,
-0.1555504, 2.547512, -0.5124014, 0, 1, 0.6745098, 1,
-0.1541815, 0.621812, 0.5156453, 0, 1, 0.682353, 1,
-0.1537195, 0.3285525, -0.4871338, 0, 1, 0.6862745, 1,
-0.1519573, 0.3707869, -0.4164556, 0, 1, 0.6941177, 1,
-0.1518383, 0.7869961, -1.435314, 0, 1, 0.7019608, 1,
-0.1511712, 0.4159568, -0.1686876, 0, 1, 0.7058824, 1,
-0.147818, 2.328158, -1.107072, 0, 1, 0.7137255, 1,
-0.1440783, -1.278205, -4.267645, 0, 1, 0.7176471, 1,
-0.1440528, 0.3895965, -0.5233417, 0, 1, 0.7254902, 1,
-0.1424974, 0.6661001, -1.309318, 0, 1, 0.7294118, 1,
-0.1402252, 1.123209, -0.9480478, 0, 1, 0.7372549, 1,
-0.1371879, 2.025239, -0.01961751, 0, 1, 0.7411765, 1,
-0.137104, 0.1043612, -2.030521, 0, 1, 0.7490196, 1,
-0.1343968, -0.2183753, -3.456119, 0, 1, 0.7529412, 1,
-0.133284, 0.7530786, -2.452338, 0, 1, 0.7607843, 1,
-0.1277695, -1.547481, -3.950475, 0, 1, 0.7647059, 1,
-0.125609, 0.206178, -0.2346641, 0, 1, 0.772549, 1,
-0.1233701, 0.1245502, 0.3237142, 0, 1, 0.7764706, 1,
-0.1223965, 0.3666959, 0.1551594, 0, 1, 0.7843137, 1,
-0.1198031, -0.4545873, -2.259416, 0, 1, 0.7882353, 1,
-0.1124303, 0.2340064, -0.2602451, 0, 1, 0.7960784, 1,
-0.1086426, -0.7463366, -3.976738, 0, 1, 0.8039216, 1,
-0.1056819, -0.5110044, -2.218739, 0, 1, 0.8078431, 1,
-0.1017133, -0.3677208, -3.782414, 0, 1, 0.8156863, 1,
-0.1008578, -1.377923, -3.808339, 0, 1, 0.8196079, 1,
-0.09879554, 0.9653523, -1.184362, 0, 1, 0.827451, 1,
-0.09805691, -0.5117609, -2.140086, 0, 1, 0.8313726, 1,
-0.09388048, -0.2200886, -1.432587, 0, 1, 0.8392157, 1,
-0.09166069, -0.4819409, -2.912416, 0, 1, 0.8431373, 1,
-0.08731796, -0.2995903, -2.72052, 0, 1, 0.8509804, 1,
-0.07483263, 1.326312, 0.3033768, 0, 1, 0.854902, 1,
-0.07440207, 0.3047798, 0.3417535, 0, 1, 0.8627451, 1,
-0.06904092, -0.2496323, -2.938359, 0, 1, 0.8666667, 1,
-0.06885563, -0.6322539, -1.307057, 0, 1, 0.8745098, 1,
-0.06791229, 1.122952, -1.314308, 0, 1, 0.8784314, 1,
-0.06474533, 1.704494, -0.6252478, 0, 1, 0.8862745, 1,
-0.06350628, -0.222864, -2.616694, 0, 1, 0.8901961, 1,
-0.06120912, -2.325682, -1.965818, 0, 1, 0.8980392, 1,
-0.0602138, -0.0704971, -1.761635, 0, 1, 0.9058824, 1,
-0.05206608, -0.891209, -1.945095, 0, 1, 0.9098039, 1,
-0.05145105, -0.9593241, -3.777098, 0, 1, 0.9176471, 1,
-0.05115953, -1.175489, -4.181008, 0, 1, 0.9215686, 1,
-0.0502758, -0.2766215, -1.137179, 0, 1, 0.9294118, 1,
-0.04695517, -0.07288183, -2.861581, 0, 1, 0.9333333, 1,
-0.04665464, -1.114694, -2.912207, 0, 1, 0.9411765, 1,
-0.03968441, -0.01555956, -0.8604451, 0, 1, 0.945098, 1,
-0.03452782, -1.39653, -0.7847313, 0, 1, 0.9529412, 1,
-0.02941749, -0.1980062, -3.149159, 0, 1, 0.9568627, 1,
-0.02791762, -0.8619992, -3.527364, 0, 1, 0.9647059, 1,
-0.02735864, -0.1465688, -3.327337, 0, 1, 0.9686275, 1,
-0.02306277, -1.206482, -3.571703, 0, 1, 0.9764706, 1,
-0.02215726, 0.769404, -0.4882016, 0, 1, 0.9803922, 1,
-0.02215676, -0.3465579, -4.159176, 0, 1, 0.9882353, 1,
-0.01695004, 0.5325154, -1.370837, 0, 1, 0.9921569, 1,
-0.01573888, 0.01318927, -1.40896, 0, 1, 1, 1,
-0.01399277, 0.3734907, 1.028677, 0, 0.9921569, 1, 1,
-0.01113126, -0.3756191, -3.444476, 0, 0.9882353, 1, 1,
-0.01059899, 1.569041, 2.410833, 0, 0.9803922, 1, 1,
-0.008411376, 0.2152218, -0.4769474, 0, 0.9764706, 1, 1,
-0.007143082, 0.3913138, -0.4253535, 0, 0.9686275, 1, 1,
0.00334595, 0.03789691, -2.331343, 0, 0.9647059, 1, 1,
0.004142168, 0.7544909, 0.3509433, 0, 0.9568627, 1, 1,
0.008022672, 0.1080268, 0.4271058, 0, 0.9529412, 1, 1,
0.01270367, -1.098101, 2.232117, 0, 0.945098, 1, 1,
0.01688281, -0.480137, 1.285836, 0, 0.9411765, 1, 1,
0.02077151, 1.556588, -0.2951359, 0, 0.9333333, 1, 1,
0.02086262, 0.9536096, 1.381431, 0, 0.9294118, 1, 1,
0.02151077, 0.1074451, 1.902863, 0, 0.9215686, 1, 1,
0.02217434, -0.8838359, 2.768748, 0, 0.9176471, 1, 1,
0.02239328, 0.5688431, -0.07559199, 0, 0.9098039, 1, 1,
0.02525318, 2.343844, -1.262739, 0, 0.9058824, 1, 1,
0.02902984, -0.165922, 4.0288, 0, 0.8980392, 1, 1,
0.02929442, -1.1318, 2.625277, 0, 0.8901961, 1, 1,
0.0478921, -0.5129026, 3.377819, 0, 0.8862745, 1, 1,
0.05721613, -1.036831, 3.803838, 0, 0.8784314, 1, 1,
0.057331, 0.2435924, 0.9703342, 0, 0.8745098, 1, 1,
0.05952556, 0.8465731, 1.800021, 0, 0.8666667, 1, 1,
0.05953884, 0.5929435, 0.3698229, 0, 0.8627451, 1, 1,
0.05991353, -0.968252, 3.629218, 0, 0.854902, 1, 1,
0.06333925, -0.8893269, 1.741919, 0, 0.8509804, 1, 1,
0.06451394, -0.9497371, 1.710269, 0, 0.8431373, 1, 1,
0.06668647, -1.857913, 3.025797, 0, 0.8392157, 1, 1,
0.07427375, -1.545967, 4.885551, 0, 0.8313726, 1, 1,
0.09040766, 1.407182, 1.20502, 0, 0.827451, 1, 1,
0.09285011, -0.275207, 3.286206, 0, 0.8196079, 1, 1,
0.09586459, 0.7862045, 0.8753632, 0, 0.8156863, 1, 1,
0.09734341, -0.6149825, 2.255053, 0, 0.8078431, 1, 1,
0.0983488, -0.1136369, 2.332779, 0, 0.8039216, 1, 1,
0.1006334, 2.069475, -1.040248, 0, 0.7960784, 1, 1,
0.1020944, -2.155622, 3.281918, 0, 0.7882353, 1, 1,
0.1037938, -0.5230047, 1.496865, 0, 0.7843137, 1, 1,
0.1059716, 1.4731, -0.04343545, 0, 0.7764706, 1, 1,
0.107434, -0.6161214, 2.603505, 0, 0.772549, 1, 1,
0.1087572, 0.6367139, 1.402763, 0, 0.7647059, 1, 1,
0.1109977, -0.003095296, 2.441273, 0, 0.7607843, 1, 1,
0.1126864, -0.3560772, 3.82942, 0, 0.7529412, 1, 1,
0.1139329, -0.5592827, 2.751718, 0, 0.7490196, 1, 1,
0.1145128, 0.3023697, 0.7285144, 0, 0.7411765, 1, 1,
0.1153778, 0.649792, 0.4997664, 0, 0.7372549, 1, 1,
0.1186275, 0.05291111, -0.2715606, 0, 0.7294118, 1, 1,
0.1204197, -0.8900268, 1.973575, 0, 0.7254902, 1, 1,
0.1207924, -0.08383898, 2.094954, 0, 0.7176471, 1, 1,
0.1211731, 0.01658381, 1.648729, 0, 0.7137255, 1, 1,
0.122438, -0.2001149, 3.275156, 0, 0.7058824, 1, 1,
0.1247333, -1.544858, 4.106185, 0, 0.6980392, 1, 1,
0.1259174, -0.3374653, 1.966189, 0, 0.6941177, 1, 1,
0.1274742, 0.2065754, -0.8291067, 0, 0.6862745, 1, 1,
0.1278856, -0.5281224, 4.352819, 0, 0.682353, 1, 1,
0.1285261, 1.904744, 0.06807943, 0, 0.6745098, 1, 1,
0.1337793, 1.297085, -1.357669, 0, 0.6705883, 1, 1,
0.1348033, -2.034599, 3.077988, 0, 0.6627451, 1, 1,
0.1379492, -1.213877, 2.713162, 0, 0.6588235, 1, 1,
0.1407764, 0.8911055, 0.3606891, 0, 0.6509804, 1, 1,
0.1420673, 0.5375037, 0.1202278, 0, 0.6470588, 1, 1,
0.1428595, 1.408993, 0.4121424, 0, 0.6392157, 1, 1,
0.1435068, -2.521931, 4.30461, 0, 0.6352941, 1, 1,
0.145502, -0.8864086, 2.231736, 0, 0.627451, 1, 1,
0.1461162, 0.6815713, -0.3098587, 0, 0.6235294, 1, 1,
0.1503311, 1.277822, 0.1344403, 0, 0.6156863, 1, 1,
0.1503843, -0.4757195, 2.8008, 0, 0.6117647, 1, 1,
0.1505173, -1.933397, 4.390226, 0, 0.6039216, 1, 1,
0.1546994, -1.082179, 4.938148, 0, 0.5960785, 1, 1,
0.163847, 0.5309618, -0.2009629, 0, 0.5921569, 1, 1,
0.1660263, 1.073544, 0.7226238, 0, 0.5843138, 1, 1,
0.1670975, -0.8261149, 3.605514, 0, 0.5803922, 1, 1,
0.1686379, -0.3804012, 2.01903, 0, 0.572549, 1, 1,
0.1734331, -0.06683441, 0.8334317, 0, 0.5686275, 1, 1,
0.1802336, -0.08101591, 1.925601, 0, 0.5607843, 1, 1,
0.1859344, 0.7660021, 0.8138998, 0, 0.5568628, 1, 1,
0.1880736, -0.7624612, 5.258889, 0, 0.5490196, 1, 1,
0.1881705, 1.684286, 2.609024, 0, 0.5450981, 1, 1,
0.1939287, 2.132788, -0.605085, 0, 0.5372549, 1, 1,
0.1991583, -0.5030999, 3.58111, 0, 0.5333334, 1, 1,
0.2022888, 0.920802, 0.1618245, 0, 0.5254902, 1, 1,
0.204369, -1.134456, 5.413258, 0, 0.5215687, 1, 1,
0.2050556, 0.1258824, 2.652439, 0, 0.5137255, 1, 1,
0.206442, 1.02152, 2.100355, 0, 0.509804, 1, 1,
0.2073379, -0.193503, 1.180138, 0, 0.5019608, 1, 1,
0.2082589, -1.348237, 4.813411, 0, 0.4941176, 1, 1,
0.2089727, 2.234805, -0.067417, 0, 0.4901961, 1, 1,
0.2117442, -0.3935333, 2.941533, 0, 0.4823529, 1, 1,
0.2132364, -3.632235, 3.30401, 0, 0.4784314, 1, 1,
0.2136186, 1.718963, 2.376783, 0, 0.4705882, 1, 1,
0.2141692, 1.773751, -0.5394548, 0, 0.4666667, 1, 1,
0.2164733, -0.6582411, 2.782183, 0, 0.4588235, 1, 1,
0.2176287, 0.6487637, -1.410151, 0, 0.454902, 1, 1,
0.2256269, 0.290628, -0.4557638, 0, 0.4470588, 1, 1,
0.2258358, 0.07824603, 1.949268, 0, 0.4431373, 1, 1,
0.226697, 0.6052605, 0.9744378, 0, 0.4352941, 1, 1,
0.2271116, -1.186159, 3.129113, 0, 0.4313726, 1, 1,
0.2309635, -0.59375, 2.969186, 0, 0.4235294, 1, 1,
0.2316549, 0.1235536, 1.726074, 0, 0.4196078, 1, 1,
0.231883, -0.4439616, 3.117963, 0, 0.4117647, 1, 1,
0.2369139, 0.8887334, 0.4093259, 0, 0.4078431, 1, 1,
0.2385865, 0.3081374, 1.373682, 0, 0.4, 1, 1,
0.2402808, 0.3470525, 0.8123687, 0, 0.3921569, 1, 1,
0.2483198, 0.6292378, -0.308332, 0, 0.3882353, 1, 1,
0.2533041, 1.664806, -0.1311747, 0, 0.3803922, 1, 1,
0.2542994, 0.5276554, 0.5821412, 0, 0.3764706, 1, 1,
0.2597923, 1.644114, -0.3010095, 0, 0.3686275, 1, 1,
0.2599939, 1.588675, 1.759789, 0, 0.3647059, 1, 1,
0.2656726, 0.4022019, 2.700485, 0, 0.3568628, 1, 1,
0.2679903, -0.6506805, 3.766049, 0, 0.3529412, 1, 1,
0.2714526, 1.043881, -1.387859, 0, 0.345098, 1, 1,
0.2740059, -1.158491, 2.263762, 0, 0.3411765, 1, 1,
0.2740932, 1.356967, 1.911146, 0, 0.3333333, 1, 1,
0.2775635, -2.077199, 2.518721, 0, 0.3294118, 1, 1,
0.2832651, -0.7669971, 1.054523, 0, 0.3215686, 1, 1,
0.2865039, -0.7545399, 3.671862, 0, 0.3176471, 1, 1,
0.2869078, 0.274203, 1.058366, 0, 0.3098039, 1, 1,
0.2869534, -2.261305, 4.694468, 0, 0.3058824, 1, 1,
0.2898034, -2.266267, 1.573936, 0, 0.2980392, 1, 1,
0.2934892, 0.02330943, 2.256599, 0, 0.2901961, 1, 1,
0.2956265, -0.5476019, 1.882804, 0, 0.2862745, 1, 1,
0.3032585, -0.5280588, 2.992621, 0, 0.2784314, 1, 1,
0.305193, 0.08582825, 0.9088144, 0, 0.2745098, 1, 1,
0.3086703, 0.1956401, 1.513402, 0, 0.2666667, 1, 1,
0.3154514, 0.446702, -1.339094, 0, 0.2627451, 1, 1,
0.3159988, -0.2114683, 3.637249, 0, 0.254902, 1, 1,
0.3166243, 0.1148181, 2.012077, 0, 0.2509804, 1, 1,
0.3167753, -1.646393, 2.144664, 0, 0.2431373, 1, 1,
0.3185658, 1.481748, -0.8627955, 0, 0.2392157, 1, 1,
0.3213951, -0.2254144, 1.593002, 0, 0.2313726, 1, 1,
0.324402, 0.1969349, 1.842243, 0, 0.227451, 1, 1,
0.3316224, 1.388217, -0.6089519, 0, 0.2196078, 1, 1,
0.3335852, -0.9055911, 3.691219, 0, 0.2156863, 1, 1,
0.3344873, -0.3481368, 1.995352, 0, 0.2078431, 1, 1,
0.3349525, -1.967705, 2.601204, 0, 0.2039216, 1, 1,
0.3385307, 1.084849, -1.284521, 0, 0.1960784, 1, 1,
0.3415462, -0.7049791, 2.602212, 0, 0.1882353, 1, 1,
0.3437729, 1.118009, 1.01988, 0, 0.1843137, 1, 1,
0.3451301, 1.072197, -0.5275034, 0, 0.1764706, 1, 1,
0.3476838, -0.6428328, 3.859104, 0, 0.172549, 1, 1,
0.3481772, -0.9992585, 2.090396, 0, 0.1647059, 1, 1,
0.3520814, -0.1011586, 1.243582, 0, 0.1607843, 1, 1,
0.3525219, -0.7477551, 3.909873, 0, 0.1529412, 1, 1,
0.3590617, 0.7984621, 1.306896, 0, 0.1490196, 1, 1,
0.3611812, -0.1744224, 1.513033, 0, 0.1411765, 1, 1,
0.365353, 0.7264419, -0.8153386, 0, 0.1372549, 1, 1,
0.370696, -0.8590465, 2.818023, 0, 0.1294118, 1, 1,
0.3716259, 2.078572, 0.3679092, 0, 0.1254902, 1, 1,
0.3734344, -1.125649, 0.3874309, 0, 0.1176471, 1, 1,
0.3828047, -0.1448498, 0.370322, 0, 0.1137255, 1, 1,
0.3850214, -1.776023, 2.857334, 0, 0.1058824, 1, 1,
0.3856099, -1.422278, 3.046371, 0, 0.09803922, 1, 1,
0.3856509, -1.682759, 2.307712, 0, 0.09411765, 1, 1,
0.3892198, 1.228617, 0.542836, 0, 0.08627451, 1, 1,
0.391212, -1.573654, 3.743146, 0, 0.08235294, 1, 1,
0.3924505, -0.808287, 0.6066366, 0, 0.07450981, 1, 1,
0.395524, -2.414842, 2.302777, 0, 0.07058824, 1, 1,
0.3958931, 1.638644, 0.990435, 0, 0.0627451, 1, 1,
0.4047947, 0.8176208, 0.5081522, 0, 0.05882353, 1, 1,
0.4052922, 0.9994606, -0.9719985, 0, 0.05098039, 1, 1,
0.405686, -0.2690051, 1.363989, 0, 0.04705882, 1, 1,
0.4097582, -0.4291733, 1.634131, 0, 0.03921569, 1, 1,
0.4100499, 0.5968394, 0.1780213, 0, 0.03529412, 1, 1,
0.4213706, 1.86374, -0.6570992, 0, 0.02745098, 1, 1,
0.429389, -0.7383471, 4.023424, 0, 0.02352941, 1, 1,
0.4302265, 0.8920575, 0.196163, 0, 0.01568628, 1, 1,
0.4345669, -1.317329, 1.94297, 0, 0.01176471, 1, 1,
0.4390053, -0.1570711, 1.767994, 0, 0.003921569, 1, 1,
0.4393714, -1.519391, 2.011416, 0.003921569, 0, 1, 1,
0.4402051, 1.837501, 0.6690382, 0.007843138, 0, 1, 1,
0.4467997, 0.3304066, -0.3897305, 0.01568628, 0, 1, 1,
0.4469821, 0.7978517, -1.014394, 0.01960784, 0, 1, 1,
0.4474105, 0.178692, 1.934599, 0.02745098, 0, 1, 1,
0.4486863, -0.2413296, 2.347647, 0.03137255, 0, 1, 1,
0.4492411, 0.4261828, 0.2738086, 0.03921569, 0, 1, 1,
0.4496047, 0.7152332, 0.5649488, 0.04313726, 0, 1, 1,
0.4500971, 0.7208754, 2.256603, 0.05098039, 0, 1, 1,
0.453687, -0.4095513, 0.5644534, 0.05490196, 0, 1, 1,
0.4548885, -0.4727894, 2.045251, 0.0627451, 0, 1, 1,
0.456165, 1.098633, 0.03952011, 0.06666667, 0, 1, 1,
0.4624098, -0.4867702, 1.626721, 0.07450981, 0, 1, 1,
0.4628018, -1.045197, 2.830041, 0.07843138, 0, 1, 1,
0.4684594, -1.263353, 3.980702, 0.08627451, 0, 1, 1,
0.4689674, -0.0536329, 1.585852, 0.09019608, 0, 1, 1,
0.4708808, 0.7737767, -1.162757, 0.09803922, 0, 1, 1,
0.4743161, -0.1637872, 2.955771, 0.1058824, 0, 1, 1,
0.4753144, -1.256539, 2.958298, 0.1098039, 0, 1, 1,
0.4756038, -1.738334, 1.768839, 0.1176471, 0, 1, 1,
0.4835868, 1.847803, 3.14929, 0.1215686, 0, 1, 1,
0.4874574, -0.1203733, 1.857889, 0.1294118, 0, 1, 1,
0.4905294, 0.5176706, 0.2589316, 0.1333333, 0, 1, 1,
0.4919397, 0.1120521, 0.8875251, 0.1411765, 0, 1, 1,
0.4923116, -1.190448, 2.804303, 0.145098, 0, 1, 1,
0.4939221, -1.506122, 2.565825, 0.1529412, 0, 1, 1,
0.4978419, 0.6625828, -0.1239905, 0.1568628, 0, 1, 1,
0.4993236, 1.93384, 1.041451, 0.1647059, 0, 1, 1,
0.5050811, 0.8015093, 0.5589846, 0.1686275, 0, 1, 1,
0.5053636, 0.3563773, -0.3035488, 0.1764706, 0, 1, 1,
0.508544, -0.0771633, 3.20064, 0.1803922, 0, 1, 1,
0.5093689, 2.062691, 1.100646, 0.1882353, 0, 1, 1,
0.5141841, 0.9066074, -0.01914064, 0.1921569, 0, 1, 1,
0.5144165, -1.469973, 4.01728, 0.2, 0, 1, 1,
0.5147913, -0.4665322, 2.74891, 0.2078431, 0, 1, 1,
0.5160964, -0.6519536, 3.601708, 0.2117647, 0, 1, 1,
0.5161097, 0.4986936, -0.9565004, 0.2196078, 0, 1, 1,
0.5179721, 1.064965, -2.023025, 0.2235294, 0, 1, 1,
0.5227548, 0.6417496, 2.015812, 0.2313726, 0, 1, 1,
0.5279427, 2.048045, -1.042298, 0.2352941, 0, 1, 1,
0.5279731, 0.1324944, 1.093658, 0.2431373, 0, 1, 1,
0.5295841, 0.6959469, -0.07207413, 0.2470588, 0, 1, 1,
0.5320058, 1.339162, 0.166061, 0.254902, 0, 1, 1,
0.532735, 1.016514, -1.180319, 0.2588235, 0, 1, 1,
0.5335373, -1.885059, 4.595963, 0.2666667, 0, 1, 1,
0.5345732, 0.7481536, 0.6329366, 0.2705882, 0, 1, 1,
0.5352198, 0.1965967, 0.1652826, 0.2784314, 0, 1, 1,
0.5388649, 1.224139, 0.007158763, 0.282353, 0, 1, 1,
0.5453128, -0.6169389, 1.099272, 0.2901961, 0, 1, 1,
0.5517259, -1.015097, 4.100631, 0.2941177, 0, 1, 1,
0.5580727, 0.8364204, 0.7996325, 0.3019608, 0, 1, 1,
0.5641268, -0.2941245, 1.551875, 0.3098039, 0, 1, 1,
0.5656748, -1.554707, 2.39215, 0.3137255, 0, 1, 1,
0.5696043, -1.976978, -0.3250178, 0.3215686, 0, 1, 1,
0.5704015, -2.578163, 4.236539, 0.3254902, 0, 1, 1,
0.5749155, -1.543586, 1.043413, 0.3333333, 0, 1, 1,
0.5749443, 0.934555, 1.569942, 0.3372549, 0, 1, 1,
0.5830368, -0.6760165, 2.214196, 0.345098, 0, 1, 1,
0.5856841, 0.1347609, 1.744833, 0.3490196, 0, 1, 1,
0.5874612, -1.880278, 3.387628, 0.3568628, 0, 1, 1,
0.5886629, 0.6642663, 1.643375, 0.3607843, 0, 1, 1,
0.5918376, -1.312047, 3.950055, 0.3686275, 0, 1, 1,
0.5934591, -0.8338361, 1.846299, 0.372549, 0, 1, 1,
0.5951486, 1.491879, 0.1342286, 0.3803922, 0, 1, 1,
0.6069994, -0.6467026, 3.620979, 0.3843137, 0, 1, 1,
0.6089294, 0.1058388, 0.5630999, 0.3921569, 0, 1, 1,
0.6120643, -1.436507, 4.436062, 0.3960784, 0, 1, 1,
0.6129979, -2.106793, 2.132989, 0.4039216, 0, 1, 1,
0.6166825, 0.02497127, 2.283874, 0.4117647, 0, 1, 1,
0.6236037, -1.3381, 1.519179, 0.4156863, 0, 1, 1,
0.6254557, -0.4150353, 0.7640747, 0.4235294, 0, 1, 1,
0.6279459, -1.135605, 4.19631, 0.427451, 0, 1, 1,
0.6310973, 0.3172788, 0.354847, 0.4352941, 0, 1, 1,
0.6350738, -0.01963141, 2.128564, 0.4392157, 0, 1, 1,
0.6359053, 0.03793504, 1.396463, 0.4470588, 0, 1, 1,
0.6362484, -0.3270455, 2.456603, 0.4509804, 0, 1, 1,
0.6565669, -1.699256, 3.448311, 0.4588235, 0, 1, 1,
0.6575228, 0.1263224, 0.9230707, 0.4627451, 0, 1, 1,
0.665203, -1.143703, 3.198876, 0.4705882, 0, 1, 1,
0.6718433, 1.193343, -0.7688909, 0.4745098, 0, 1, 1,
0.6751141, -0.5157372, 1.574032, 0.4823529, 0, 1, 1,
0.6819108, 0.1172712, -0.3132192, 0.4862745, 0, 1, 1,
0.6841747, 0.2581546, 0.1788016, 0.4941176, 0, 1, 1,
0.6862072, 1.143216, -0.6638672, 0.5019608, 0, 1, 1,
0.6864704, 0.1466175, 3.032536, 0.5058824, 0, 1, 1,
0.6881655, -0.8803003, 2.936935, 0.5137255, 0, 1, 1,
0.6958815, 0.2574086, 1.237886, 0.5176471, 0, 1, 1,
0.7031219, -0.6723644, 2.411547, 0.5254902, 0, 1, 1,
0.7039209, 1.297422, -1.220881, 0.5294118, 0, 1, 1,
0.7067798, -0.6270689, 2.553379, 0.5372549, 0, 1, 1,
0.7194337, 0.1083429, 0.1467825, 0.5411765, 0, 1, 1,
0.7217203, -0.6476038, 2.688371, 0.5490196, 0, 1, 1,
0.721905, 0.4177077, 3.026683, 0.5529412, 0, 1, 1,
0.7235838, 1.59981, -0.08505397, 0.5607843, 0, 1, 1,
0.7241149, 0.2346953, 2.583284, 0.5647059, 0, 1, 1,
0.7321501, -0.8601655, 1.623909, 0.572549, 0, 1, 1,
0.7329971, -0.7615505, 2.89683, 0.5764706, 0, 1, 1,
0.7338775, 0.214369, 1.347299, 0.5843138, 0, 1, 1,
0.7421145, 0.7977726, -1.182244, 0.5882353, 0, 1, 1,
0.7441097, 1.367352, 0.1940219, 0.5960785, 0, 1, 1,
0.7446703, 0.5328119, 0.9203711, 0.6039216, 0, 1, 1,
0.7450836, 0.0489432, 2.06456, 0.6078432, 0, 1, 1,
0.7459475, 2.741376, 2.534029, 0.6156863, 0, 1, 1,
0.7487901, -0.6916695, 1.568761, 0.6196079, 0, 1, 1,
0.7663757, -1.411149, 1.194877, 0.627451, 0, 1, 1,
0.7667286, 0.6178252, 0.2446793, 0.6313726, 0, 1, 1,
0.7688099, 0.9422898, -1.139591, 0.6392157, 0, 1, 1,
0.7737456, -0.3335507, 3.489439, 0.6431373, 0, 1, 1,
0.7758834, 1.311012, -1.926203, 0.6509804, 0, 1, 1,
0.77638, -0.05514669, 3.11727, 0.654902, 0, 1, 1,
0.7766863, -0.600731, 2.13104, 0.6627451, 0, 1, 1,
0.7775752, -0.1945586, 1.314441, 0.6666667, 0, 1, 1,
0.7787235, -0.3803332, 1.223687, 0.6745098, 0, 1, 1,
0.7812082, 0.7754337, 1.9444, 0.6784314, 0, 1, 1,
0.7815622, -0.4546316, 2.816614, 0.6862745, 0, 1, 1,
0.7822418, 1.029032, 1.940549, 0.6901961, 0, 1, 1,
0.7883174, -0.5070301, 1.741864, 0.6980392, 0, 1, 1,
0.7893264, -1.642362, 4.156191, 0.7058824, 0, 1, 1,
0.7902648, 0.2035028, 2.380098, 0.7098039, 0, 1, 1,
0.7906126, 0.2665863, 0.3427559, 0.7176471, 0, 1, 1,
0.7916312, 0.126693, 1.868786, 0.7215686, 0, 1, 1,
0.7982339, -0.1076506, 0.6436341, 0.7294118, 0, 1, 1,
0.799226, -0.9275222, 1.586152, 0.7333333, 0, 1, 1,
0.800866, -0.6175543, 2.071171, 0.7411765, 0, 1, 1,
0.8013516, -0.9729953, 4.141344, 0.7450981, 0, 1, 1,
0.8084831, 0.358656, 0.2898071, 0.7529412, 0, 1, 1,
0.8098291, -0.3956873, 0.8798712, 0.7568628, 0, 1, 1,
0.8110963, -1.237402, 2.420856, 0.7647059, 0, 1, 1,
0.8127128, 0.6558689, 0.4597739, 0.7686275, 0, 1, 1,
0.8136521, 0.6244122, 2.333752, 0.7764706, 0, 1, 1,
0.8222657, -0.09062087, -0.3240259, 0.7803922, 0, 1, 1,
0.8308872, -0.1273919, 3.039924, 0.7882353, 0, 1, 1,
0.8348752, 2.003839, 0.2082782, 0.7921569, 0, 1, 1,
0.8372025, 0.5291527, 2.16569, 0.8, 0, 1, 1,
0.8426049, -0.3897227, 1.832656, 0.8078431, 0, 1, 1,
0.8434752, -0.4471478, 1.010688, 0.8117647, 0, 1, 1,
0.8455843, 1.18889, -0.4997748, 0.8196079, 0, 1, 1,
0.8462117, -0.9393436, 2.856928, 0.8235294, 0, 1, 1,
0.8473981, 0.469943, 1.67045, 0.8313726, 0, 1, 1,
0.8498225, -1.896309, 3.210591, 0.8352941, 0, 1, 1,
0.8519529, -0.9019207, 1.472347, 0.8431373, 0, 1, 1,
0.853579, 1.141391, -0.2258708, 0.8470588, 0, 1, 1,
0.8561068, -0.1812675, 2.09439, 0.854902, 0, 1, 1,
0.8575792, -0.858687, -0.1254779, 0.8588235, 0, 1, 1,
0.8600895, -0.4887589, 1.084507, 0.8666667, 0, 1, 1,
0.8603091, -1.146274, 2.502074, 0.8705882, 0, 1, 1,
0.8655388, -2.482338, 1.498382, 0.8784314, 0, 1, 1,
0.8661953, 1.051726, -0.5744389, 0.8823529, 0, 1, 1,
0.8734936, -1.043763, 2.760463, 0.8901961, 0, 1, 1,
0.8850206, -0.2637733, 2.55105, 0.8941177, 0, 1, 1,
0.8901222, 0.2886819, 2.041601, 0.9019608, 0, 1, 1,
0.893273, -1.137073, 0.9679493, 0.9098039, 0, 1, 1,
0.8955821, -0.8881525, 2.670658, 0.9137255, 0, 1, 1,
0.8986526, 1.054838, 0.2337779, 0.9215686, 0, 1, 1,
0.9011241, -1.839245, 3.502271, 0.9254902, 0, 1, 1,
0.9046734, -0.5471067, 1.035997, 0.9333333, 0, 1, 1,
0.9070928, -0.09779381, 2.627903, 0.9372549, 0, 1, 1,
0.913587, -0.04864345, 2.531767, 0.945098, 0, 1, 1,
0.914258, -0.06697282, 3.456095, 0.9490196, 0, 1, 1,
0.9176932, 0.7470607, 1.67471, 0.9568627, 0, 1, 1,
0.9178078, 0.2265849, 1.028339, 0.9607843, 0, 1, 1,
0.9239452, 0.9700424, 1.691776, 0.9686275, 0, 1, 1,
0.9258278, 0.9884725, 0.9943998, 0.972549, 0, 1, 1,
0.9289989, -1.294802, 2.497019, 0.9803922, 0, 1, 1,
0.9312113, 1.036228, 1.877514, 0.9843137, 0, 1, 1,
0.9361355, -0.9661189, 2.19874, 0.9921569, 0, 1, 1,
0.9385628, 0.198561, 1.087092, 0.9960784, 0, 1, 1,
0.9439197, -0.140837, 1.661025, 1, 0, 0.9960784, 1,
0.9465584, 0.4954694, 1.975523, 1, 0, 0.9882353, 1,
0.9496141, 0.4600829, 1.501555, 1, 0, 0.9843137, 1,
0.9576621, 3.179176, -0.4043892, 1, 0, 0.9764706, 1,
0.9583269, 1.075863, 2.112078, 1, 0, 0.972549, 1,
0.960588, -0.6415913, 3.869734, 1, 0, 0.9647059, 1,
0.9700506, -0.7996564, 1.016633, 1, 0, 0.9607843, 1,
0.9703639, 0.5262831, 1.148925, 1, 0, 0.9529412, 1,
0.9751579, 0.004573676, 1.296001, 1, 0, 0.9490196, 1,
0.9782542, 0.8787433, 1.703695, 1, 0, 0.9411765, 1,
0.9801317, 0.9266673, 1.674908, 1, 0, 0.9372549, 1,
0.986392, -1.224901, 1.485763, 1, 0, 0.9294118, 1,
0.9969527, 1.933754, 0.8035977, 1, 0, 0.9254902, 1,
0.9981243, -1.177995, 3.240713, 1, 0, 0.9176471, 1,
1.005058, 0.6247799, 1.326341, 1, 0, 0.9137255, 1,
1.02092, 1.36489, -0.7461652, 1, 0, 0.9058824, 1,
1.020929, 1.296203, -0.8898181, 1, 0, 0.9019608, 1,
1.024331, 0.9766633, 1.323264, 1, 0, 0.8941177, 1,
1.028179, 1.978697, -0.1596002, 1, 0, 0.8862745, 1,
1.035546, 1.578529, -0.03845726, 1, 0, 0.8823529, 1,
1.038934, -0.5055214, 4.014239, 1, 0, 0.8745098, 1,
1.039073, 0.3147933, 0.652298, 1, 0, 0.8705882, 1,
1.042151, 1.068318, 0.7870241, 1, 0, 0.8627451, 1,
1.060145, 0.2413536, 1.773741, 1, 0, 0.8588235, 1,
1.063274, -0.6744878, 1.961925, 1, 0, 0.8509804, 1,
1.063394, 0.5326851, 1.581371, 1, 0, 0.8470588, 1,
1.068262, 0.565314, -0.2047431, 1, 0, 0.8392157, 1,
1.077505, 0.1487232, 1.606027, 1, 0, 0.8352941, 1,
1.080995, 1.125533, 1.185422, 1, 0, 0.827451, 1,
1.083093, 0.08390293, 1.726427, 1, 0, 0.8235294, 1,
1.084619, 1.155124, 0.707868, 1, 0, 0.8156863, 1,
1.106905, -0.6625269, 2.352895, 1, 0, 0.8117647, 1,
1.108115, -0.7616454, 1.298383, 1, 0, 0.8039216, 1,
1.115125, -0.1678426, 0.9728516, 1, 0, 0.7960784, 1,
1.116719, -1.446942, 3.283298, 1, 0, 0.7921569, 1,
1.124933, -0.06312005, 1.378109, 1, 0, 0.7843137, 1,
1.127622, -0.2112132, 0.6687647, 1, 0, 0.7803922, 1,
1.132901, 1.301156, -0.8812804, 1, 0, 0.772549, 1,
1.136082, 0.2897952, 0.8748317, 1, 0, 0.7686275, 1,
1.146433, 1.813335, 1.01083, 1, 0, 0.7607843, 1,
1.148035, 0.4988013, 0.6476369, 1, 0, 0.7568628, 1,
1.159112, 0.7183362, 0.3464968, 1, 0, 0.7490196, 1,
1.16054, -0.6445563, 1.167184, 1, 0, 0.7450981, 1,
1.161272, -0.836468, 2.722971, 1, 0, 0.7372549, 1,
1.167285, -0.3735268, 1.454293, 1, 0, 0.7333333, 1,
1.172367, -2.124347, 3.068975, 1, 0, 0.7254902, 1,
1.178037, -0.945507, 2.263608, 1, 0, 0.7215686, 1,
1.184558, -0.1721412, 0.5422322, 1, 0, 0.7137255, 1,
1.188086, -1.579079, 1.758829, 1, 0, 0.7098039, 1,
1.197728, 0.3190388, 1.529936, 1, 0, 0.7019608, 1,
1.199082, -0.1934592, 2.073244, 1, 0, 0.6941177, 1,
1.2019, 0.2507772, 1.725083, 1, 0, 0.6901961, 1,
1.212479, -0.3108663, 0.5720206, 1, 0, 0.682353, 1,
1.212651, -0.3635933, 2.965629, 1, 0, 0.6784314, 1,
1.215387, -2.089665, 2.089925, 1, 0, 0.6705883, 1,
1.215951, -0.2795985, 3.328231, 1, 0, 0.6666667, 1,
1.232832, 0.0009625088, 0.7087054, 1, 0, 0.6588235, 1,
1.2336, 0.6239042, 1.369295, 1, 0, 0.654902, 1,
1.235034, 0.5827247, 0.703679, 1, 0, 0.6470588, 1,
1.235691, 2.213384, 1.288323, 1, 0, 0.6431373, 1,
1.237521, -0.3828461, 0.702725, 1, 0, 0.6352941, 1,
1.237549, -1.377445, 2.835761, 1, 0, 0.6313726, 1,
1.23914, -0.2980702, 2.022916, 1, 0, 0.6235294, 1,
1.245325, 0.7088619, 1.416471, 1, 0, 0.6196079, 1,
1.250336, 1.188481, 2.162123, 1, 0, 0.6117647, 1,
1.25602, -0.4928113, 2.608878, 1, 0, 0.6078432, 1,
1.257915, -1.127534, 3.118981, 1, 0, 0.6, 1,
1.265815, -1.221671, 4.348426, 1, 0, 0.5921569, 1,
1.268833, -0.2523583, 1.839262, 1, 0, 0.5882353, 1,
1.270319, -0.3603023, 0.1449129, 1, 0, 0.5803922, 1,
1.277205, -0.05119157, 3.124352, 1, 0, 0.5764706, 1,
1.278092, 0.6051174, 0.8449886, 1, 0, 0.5686275, 1,
1.278805, -0.3847434, 1.559594, 1, 0, 0.5647059, 1,
1.280992, 0.889488, 0.8015557, 1, 0, 0.5568628, 1,
1.293256, 1.539978, -0.9137062, 1, 0, 0.5529412, 1,
1.296556, -0.4165707, 2.648808, 1, 0, 0.5450981, 1,
1.296896, -0.04092906, 1.342825, 1, 0, 0.5411765, 1,
1.311478, 0.2580536, 0.9583228, 1, 0, 0.5333334, 1,
1.311752, 0.8071746, 0.1930461, 1, 0, 0.5294118, 1,
1.343808, -0.6922562, 2.192669, 1, 0, 0.5215687, 1,
1.346953, 0.6295659, 2.821693, 1, 0, 0.5176471, 1,
1.350645, -0.6443152, 2.253757, 1, 0, 0.509804, 1,
1.357173, 0.4630812, 1.552884, 1, 0, 0.5058824, 1,
1.365069, -0.3640316, 2.032935, 1, 0, 0.4980392, 1,
1.371123, -0.1734035, -0.2482638, 1, 0, 0.4901961, 1,
1.371786, 0.5514396, 1.529611, 1, 0, 0.4862745, 1,
1.373495, 2.333565, 0.3672558, 1, 0, 0.4784314, 1,
1.382409, 0.3656236, 1.390155, 1, 0, 0.4745098, 1,
1.383647, -0.1584433, 1.325695, 1, 0, 0.4666667, 1,
1.422341, 1.483534, 0.8629983, 1, 0, 0.4627451, 1,
1.424965, -0.6275007, 2.468572, 1, 0, 0.454902, 1,
1.438841, 0.398133, 1.413934, 1, 0, 0.4509804, 1,
1.441846, -0.4945103, 1.27479, 1, 0, 0.4431373, 1,
1.444916, -0.4882317, 2.067626, 1, 0, 0.4392157, 1,
1.450006, 0.1845544, 1.341379, 1, 0, 0.4313726, 1,
1.45118, -0.6139894, 3.495969, 1, 0, 0.427451, 1,
1.456824, -0.4127414, 1.263344, 1, 0, 0.4196078, 1,
1.46147, 1.083378, -1.095776, 1, 0, 0.4156863, 1,
1.47521, -0.6880493, 3.016853, 1, 0, 0.4078431, 1,
1.47781, 0.4932641, 0.5614129, 1, 0, 0.4039216, 1,
1.478613, 0.2460398, 2.766855, 1, 0, 0.3960784, 1,
1.481024, -0.03592388, 1.373273, 1, 0, 0.3882353, 1,
1.491949, -2.403245, 3.947434, 1, 0, 0.3843137, 1,
1.504168, -0.1611005, 0.800848, 1, 0, 0.3764706, 1,
1.507204, -0.7298091, 0.5599443, 1, 0, 0.372549, 1,
1.511133, 1.030176, 0.1446344, 1, 0, 0.3647059, 1,
1.530071, 0.2621172, 0.2679015, 1, 0, 0.3607843, 1,
1.534314, -0.1374616, 1.229599, 1, 0, 0.3529412, 1,
1.536354, -0.2456101, 1.51507, 1, 0, 0.3490196, 1,
1.538038, 0.2752625, 0.9420139, 1, 0, 0.3411765, 1,
1.538644, 0.2841206, -0.5455009, 1, 0, 0.3372549, 1,
1.540179, -0.8129518, 1.295094, 1, 0, 0.3294118, 1,
1.541063, -0.2457153, 2.763271, 1, 0, 0.3254902, 1,
1.578523, -2.078001, 0.5037807, 1, 0, 0.3176471, 1,
1.582028, -0.1282794, 2.367898, 1, 0, 0.3137255, 1,
1.586041, -0.6258832, -1.138724, 1, 0, 0.3058824, 1,
1.588232, 0.4778958, 0.8642164, 1, 0, 0.2980392, 1,
1.593622, 0.5503581, 0.4017893, 1, 0, 0.2941177, 1,
1.593715, -0.03211244, 1.005002, 1, 0, 0.2862745, 1,
1.61036, -0.3340203, 0.7295917, 1, 0, 0.282353, 1,
1.61048, -0.5496495, 1.325344, 1, 0, 0.2745098, 1,
1.618339, 0.457529, 0.7234813, 1, 0, 0.2705882, 1,
1.620548, -1.561649, 1.411165, 1, 0, 0.2627451, 1,
1.6271, 0.1768401, 0.02732855, 1, 0, 0.2588235, 1,
1.650342, 1.114331, -0.1851782, 1, 0, 0.2509804, 1,
1.652387, -0.25183, 3.190591, 1, 0, 0.2470588, 1,
1.677332, -1.723011, 4.387513, 1, 0, 0.2392157, 1,
1.678485, 0.1747522, 2.448327, 1, 0, 0.2352941, 1,
1.689221, 0.1477945, 1.402376, 1, 0, 0.227451, 1,
1.699403, 0.7646508, 1.737898, 1, 0, 0.2235294, 1,
1.706004, -0.008082374, 1.169398, 1, 0, 0.2156863, 1,
1.722017, 1.42722, 0.7939824, 1, 0, 0.2117647, 1,
1.746567, 0.5691444, 0.9550024, 1, 0, 0.2039216, 1,
1.779094, -0.9273081, 0.9462739, 1, 0, 0.1960784, 1,
1.801102, 1.703442, 1.672452, 1, 0, 0.1921569, 1,
1.816048, 1.104814, 1.15025, 1, 0, 0.1843137, 1,
1.849373, -1.825282, 1.551064, 1, 0, 0.1803922, 1,
1.863624, -0.5633751, 2.697144, 1, 0, 0.172549, 1,
1.866274, -0.3716162, 1.946782, 1, 0, 0.1686275, 1,
1.868179, -1.70997, 2.717839, 1, 0, 0.1607843, 1,
1.872354, 0.7117065, 0.9798926, 1, 0, 0.1568628, 1,
1.877982, 0.1397025, 1.226473, 1, 0, 0.1490196, 1,
1.892612, 0.2918399, 1.485655, 1, 0, 0.145098, 1,
1.898103, 1.569271, 0.8599734, 1, 0, 0.1372549, 1,
1.902069, 0.7184426, 1.55386, 1, 0, 0.1333333, 1,
1.928712, -0.4782529, 1.267949, 1, 0, 0.1254902, 1,
1.956569, 0.2510369, 2.881968, 1, 0, 0.1215686, 1,
1.966925, 1.686682, 1.527704, 1, 0, 0.1137255, 1,
1.999388, 0.2472691, 3.347453, 1, 0, 0.1098039, 1,
2.045886, 0.8220514, 2.345461, 1, 0, 0.1019608, 1,
2.060668, 1.330103, 0.1900073, 1, 0, 0.09411765, 1,
2.065834, -1.892096, 2.924072, 1, 0, 0.09019608, 1,
2.20208, -0.5659742, 1.210687, 1, 0, 0.08235294, 1,
2.310451, 0.342818, 1.630424, 1, 0, 0.07843138, 1,
2.316719, -0.499934, 0.958961, 1, 0, 0.07058824, 1,
2.34625, 0.9552558, 1.117772, 1, 0, 0.06666667, 1,
2.367685, 0.5390011, 3.986759, 1, 0, 0.05882353, 1,
2.39482, -0.8798151, 1.707707, 1, 0, 0.05490196, 1,
2.41164, 0.9421207, 1.340646, 1, 0, 0.04705882, 1,
2.412626, -0.7789029, 1.328294, 1, 0, 0.04313726, 1,
2.475934, 0.5370625, 1.124899, 1, 0, 0.03529412, 1,
2.715745, -1.312483, 0.6069258, 1, 0, 0.03137255, 1,
2.755431, 1.854294, 1.839307, 1, 0, 0.02352941, 1,
2.768612, -0.7354702, 1.889971, 1, 0, 0.01960784, 1,
2.781665, -0.2965141, 1.255983, 1, 0, 0.01176471, 1,
2.868366, 0.1042977, 0.08178363, 1, 0, 0.007843138, 1
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
-0.2838284, -5.417315, -6.945805, 0, -0.5, 0.5, 0.5,
-0.2838284, -5.417315, -6.945805, 1, -0.5, 0.5, 0.5,
-0.2838284, -5.417315, -6.945805, 1, 1.5, 0.5, 0.5,
-0.2838284, -5.417315, -6.945805, 0, 1.5, 0.5, 0.5
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
-4.504617, -0.4961085, -6.945805, 0, -0.5, 0.5, 0.5,
-4.504617, -0.4961085, -6.945805, 1, -0.5, 0.5, 0.5,
-4.504617, -0.4961085, -6.945805, 1, 1.5, 0.5, 0.5,
-4.504617, -0.4961085, -6.945805, 0, 1.5, 0.5, 0.5
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
-4.504617, -5.417315, 0.1293492, 0, -0.5, 0.5, 0.5,
-4.504617, -5.417315, 0.1293492, 1, -0.5, 0.5, 0.5,
-4.504617, -5.417315, 0.1293492, 1, 1.5, 0.5, 0.5,
-4.504617, -5.417315, 0.1293492, 0, 1.5, 0.5, 0.5
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
-3, -4.281652, -5.313077,
2, -4.281652, -5.313077,
-3, -4.281652, -5.313077,
-3, -4.470929, -5.585198,
-2, -4.281652, -5.313077,
-2, -4.470929, -5.585198,
-1, -4.281652, -5.313077,
-1, -4.470929, -5.585198,
0, -4.281652, -5.313077,
0, -4.470929, -5.585198,
1, -4.281652, -5.313077,
1, -4.470929, -5.585198,
2, -4.281652, -5.313077,
2, -4.470929, -5.585198
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
-3, -4.849483, -6.129441, 0, -0.5, 0.5, 0.5,
-3, -4.849483, -6.129441, 1, -0.5, 0.5, 0.5,
-3, -4.849483, -6.129441, 1, 1.5, 0.5, 0.5,
-3, -4.849483, -6.129441, 0, 1.5, 0.5, 0.5,
-2, -4.849483, -6.129441, 0, -0.5, 0.5, 0.5,
-2, -4.849483, -6.129441, 1, -0.5, 0.5, 0.5,
-2, -4.849483, -6.129441, 1, 1.5, 0.5, 0.5,
-2, -4.849483, -6.129441, 0, 1.5, 0.5, 0.5,
-1, -4.849483, -6.129441, 0, -0.5, 0.5, 0.5,
-1, -4.849483, -6.129441, 1, -0.5, 0.5, 0.5,
-1, -4.849483, -6.129441, 1, 1.5, 0.5, 0.5,
-1, -4.849483, -6.129441, 0, 1.5, 0.5, 0.5,
0, -4.849483, -6.129441, 0, -0.5, 0.5, 0.5,
0, -4.849483, -6.129441, 1, -0.5, 0.5, 0.5,
0, -4.849483, -6.129441, 1, 1.5, 0.5, 0.5,
0, -4.849483, -6.129441, 0, 1.5, 0.5, 0.5,
1, -4.849483, -6.129441, 0, -0.5, 0.5, 0.5,
1, -4.849483, -6.129441, 1, -0.5, 0.5, 0.5,
1, -4.849483, -6.129441, 1, 1.5, 0.5, 0.5,
1, -4.849483, -6.129441, 0, 1.5, 0.5, 0.5,
2, -4.849483, -6.129441, 0, -0.5, 0.5, 0.5,
2, -4.849483, -6.129441, 1, -0.5, 0.5, 0.5,
2, -4.849483, -6.129441, 1, 1.5, 0.5, 0.5,
2, -4.849483, -6.129441, 0, 1.5, 0.5, 0.5
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
-3.530589, -4, -5.313077,
-3.530589, 2, -5.313077,
-3.530589, -4, -5.313077,
-3.692927, -4, -5.585198,
-3.530589, -2, -5.313077,
-3.692927, -2, -5.585198,
-3.530589, 0, -5.313077,
-3.692927, 0, -5.585198,
-3.530589, 2, -5.313077,
-3.692927, 2, -5.585198
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
-4.017602, -4, -6.129441, 0, -0.5, 0.5, 0.5,
-4.017602, -4, -6.129441, 1, -0.5, 0.5, 0.5,
-4.017602, -4, -6.129441, 1, 1.5, 0.5, 0.5,
-4.017602, -4, -6.129441, 0, 1.5, 0.5, 0.5,
-4.017602, -2, -6.129441, 0, -0.5, 0.5, 0.5,
-4.017602, -2, -6.129441, 1, -0.5, 0.5, 0.5,
-4.017602, -2, -6.129441, 1, 1.5, 0.5, 0.5,
-4.017602, -2, -6.129441, 0, 1.5, 0.5, 0.5,
-4.017602, 0, -6.129441, 0, -0.5, 0.5, 0.5,
-4.017602, 0, -6.129441, 1, -0.5, 0.5, 0.5,
-4.017602, 0, -6.129441, 1, 1.5, 0.5, 0.5,
-4.017602, 0, -6.129441, 0, 1.5, 0.5, 0.5,
-4.017602, 2, -6.129441, 0, -0.5, 0.5, 0.5,
-4.017602, 2, -6.129441, 1, -0.5, 0.5, 0.5,
-4.017602, 2, -6.129441, 1, 1.5, 0.5, 0.5,
-4.017602, 2, -6.129441, 0, 1.5, 0.5, 0.5
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
-3.530589, -4.281652, -4,
-3.530589, -4.281652, 4,
-3.530589, -4.281652, -4,
-3.692927, -4.470929, -4,
-3.530589, -4.281652, -2,
-3.692927, -4.470929, -2,
-3.530589, -4.281652, 0,
-3.692927, -4.470929, 0,
-3.530589, -4.281652, 2,
-3.692927, -4.470929, 2,
-3.530589, -4.281652, 4,
-3.692927, -4.470929, 4
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
-4.017602, -4.849483, -4, 0, -0.5, 0.5, 0.5,
-4.017602, -4.849483, -4, 1, -0.5, 0.5, 0.5,
-4.017602, -4.849483, -4, 1, 1.5, 0.5, 0.5,
-4.017602, -4.849483, -4, 0, 1.5, 0.5, 0.5,
-4.017602, -4.849483, -2, 0, -0.5, 0.5, 0.5,
-4.017602, -4.849483, -2, 1, -0.5, 0.5, 0.5,
-4.017602, -4.849483, -2, 1, 1.5, 0.5, 0.5,
-4.017602, -4.849483, -2, 0, 1.5, 0.5, 0.5,
-4.017602, -4.849483, 0, 0, -0.5, 0.5, 0.5,
-4.017602, -4.849483, 0, 1, -0.5, 0.5, 0.5,
-4.017602, -4.849483, 0, 1, 1.5, 0.5, 0.5,
-4.017602, -4.849483, 0, 0, 1.5, 0.5, 0.5,
-4.017602, -4.849483, 2, 0, -0.5, 0.5, 0.5,
-4.017602, -4.849483, 2, 1, -0.5, 0.5, 0.5,
-4.017602, -4.849483, 2, 1, 1.5, 0.5, 0.5,
-4.017602, -4.849483, 2, 0, 1.5, 0.5, 0.5,
-4.017602, -4.849483, 4, 0, -0.5, 0.5, 0.5,
-4.017602, -4.849483, 4, 1, -0.5, 0.5, 0.5,
-4.017602, -4.849483, 4, 1, 1.5, 0.5, 0.5,
-4.017602, -4.849483, 4, 0, 1.5, 0.5, 0.5
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
-3.530589, -4.281652, -5.313077,
-3.530589, 3.289435, -5.313077,
-3.530589, -4.281652, 5.571775,
-3.530589, 3.289435, 5.571775,
-3.530589, -4.281652, -5.313077,
-3.530589, -4.281652, 5.571775,
-3.530589, 3.289435, -5.313077,
-3.530589, 3.289435, 5.571775,
-3.530589, -4.281652, -5.313077,
2.962932, -4.281652, -5.313077,
-3.530589, -4.281652, 5.571775,
2.962932, -4.281652, 5.571775,
-3.530589, 3.289435, -5.313077,
2.962932, 3.289435, -5.313077,
-3.530589, 3.289435, 5.571775,
2.962932, 3.289435, 5.571775,
2.962932, -4.281652, -5.313077,
2.962932, 3.289435, -5.313077,
2.962932, -4.281652, 5.571775,
2.962932, 3.289435, 5.571775,
2.962932, -4.281652, -5.313077,
2.962932, -4.281652, 5.571775,
2.962932, 3.289435, -5.313077,
2.962932, 3.289435, 5.571775
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
var radius = 7.883535;
var distance = 35.07474;
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
mvMatrix.translate( 0.2838284, 0.4961085, -0.1293492 );
mvMatrix.scale( 1.312667, 1.12584, 0.7830912 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.07474);
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
phenothiazine<-read.table("phenothiazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phenothiazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenothiazine' not found
```

```r
y<-phenothiazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenothiazine' not found
```

```r
z<-phenothiazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenothiazine' not found
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
-3.436023, -0.783394, -0.84558, 0, 0, 1, 1, 1,
-2.78029, -0.8120305, -2.466145, 1, 0, 0, 1, 1,
-2.505949, 0.05861302, -2.86264, 1, 0, 0, 1, 1,
-2.484093, 0.3461871, -2.234688, 1, 0, 0, 1, 1,
-2.448006, -0.2342305, -0.5638237, 1, 0, 0, 1, 1,
-2.365607, -0.8782967, -3.02282, 1, 0, 0, 1, 1,
-2.355884, 0.5592943, -2.071624, 0, 0, 0, 1, 1,
-2.306868, 0.4213874, -1.474005, 0, 0, 0, 1, 1,
-2.279319, -1.337596, -2.614629, 0, 0, 0, 1, 1,
-2.2712, 0.543575, 1.025718, 0, 0, 0, 1, 1,
-2.268118, 0.9291175, -1.490147, 0, 0, 0, 1, 1,
-2.213219, -0.639648, -0.7259139, 0, 0, 0, 1, 1,
-2.199854, -0.7858041, -3.220967, 0, 0, 0, 1, 1,
-2.199251, 0.2735216, -3.480954, 1, 1, 1, 1, 1,
-2.187459, 0.526533, -3.482341, 1, 1, 1, 1, 1,
-2.182185, -1.181055, -2.306538, 1, 1, 1, 1, 1,
-2.18084, 0.01860246, -1.529588, 1, 1, 1, 1, 1,
-2.129239, -0.7834601, -2.218314, 1, 1, 1, 1, 1,
-2.120787, 0.5220081, -0.9062213, 1, 1, 1, 1, 1,
-2.117877, 0.773522, -0.4477044, 1, 1, 1, 1, 1,
-2.114767, 1.640287, -0.8608825, 1, 1, 1, 1, 1,
-2.102966, -1.037162, -3.625139, 1, 1, 1, 1, 1,
-2.099545, -1.269877, -1.135924, 1, 1, 1, 1, 1,
-2.091446, 0.8943044, -1.290515, 1, 1, 1, 1, 1,
-2.070408, -1.392826, -2.777359, 1, 1, 1, 1, 1,
-2.003855, 0.9579774, 0.440077, 1, 1, 1, 1, 1,
-1.996475, 0.7533433, 0.08753913, 1, 1, 1, 1, 1,
-1.99381, 0.5321507, -0.4461059, 1, 1, 1, 1, 1,
-1.965856, -0.326964, -0.3638933, 0, 0, 1, 1, 1,
-1.964618, -1.340232, -2.198638, 1, 0, 0, 1, 1,
-1.949137, -0.3021362, -0.8727938, 1, 0, 0, 1, 1,
-1.945035, 0.4567302, -0.9397078, 1, 0, 0, 1, 1,
-1.941662, 0.7143345, -2.96498, 1, 0, 0, 1, 1,
-1.904048, -0.5137036, -1.4884, 1, 0, 0, 1, 1,
-1.895794, -0.881782, -3.90273, 0, 0, 0, 1, 1,
-1.883526, -0.1899153, -1.362618, 0, 0, 0, 1, 1,
-1.873455, 0.1209348, -1.153402, 0, 0, 0, 1, 1,
-1.867535, 0.9762536, -1.47388, 0, 0, 0, 1, 1,
-1.837548, 0.1701517, -0.9594181, 0, 0, 0, 1, 1,
-1.809725, 0.134861, -4.122645, 0, 0, 0, 1, 1,
-1.809314, -0.5680676, -0.4143433, 0, 0, 0, 1, 1,
-1.798823, -1.100769, -2.144815, 1, 1, 1, 1, 1,
-1.793477, -0.7294294, -3.323367, 1, 1, 1, 1, 1,
-1.749271, -0.08474741, -0.9183413, 1, 1, 1, 1, 1,
-1.745392, 0.2567573, -0.4193784, 1, 1, 1, 1, 1,
-1.730799, -1.218114, -2.873876, 1, 1, 1, 1, 1,
-1.729866, 0.5150205, -1.437187, 1, 1, 1, 1, 1,
-1.728093, -1.577696, -3.940133, 1, 1, 1, 1, 1,
-1.704342, -0.238281, -1.444018, 1, 1, 1, 1, 1,
-1.699026, 2.355976, -0.2981291, 1, 1, 1, 1, 1,
-1.674827, 0.9607985, -0.9762521, 1, 1, 1, 1, 1,
-1.65975, -1.115298, -1.187916, 1, 1, 1, 1, 1,
-1.655391, -0.5402938, -3.077344, 1, 1, 1, 1, 1,
-1.64264, 0.4998724, -1.036056, 1, 1, 1, 1, 1,
-1.613327, -0.4144131, -2.143253, 1, 1, 1, 1, 1,
-1.609626, 2.098727, -1.252869, 1, 1, 1, 1, 1,
-1.60786, -1.996136, -0.9664571, 0, 0, 1, 1, 1,
-1.60088, 1.467931, -1.428036, 1, 0, 0, 1, 1,
-1.597778, -1.000374, -2.951471, 1, 0, 0, 1, 1,
-1.591976, 2.064613, -0.5354482, 1, 0, 0, 1, 1,
-1.586055, -0.3167408, -3.429788, 1, 0, 0, 1, 1,
-1.582217, 1.730949, 0.5183524, 1, 0, 0, 1, 1,
-1.577159, 0.450177, -1.582685, 0, 0, 0, 1, 1,
-1.572571, -0.2044473, -1.065885, 0, 0, 0, 1, 1,
-1.56679, 0.08449316, -0.8871921, 0, 0, 0, 1, 1,
-1.564686, -0.002013174, -1.163357, 0, 0, 0, 1, 1,
-1.559349, -0.9617889, -1.229782, 0, 0, 0, 1, 1,
-1.556828, 0.08210456, -0.6960887, 0, 0, 0, 1, 1,
-1.544406, -0.1126275, -1.742102, 0, 0, 0, 1, 1,
-1.541498, -0.31298, -2.722513, 1, 1, 1, 1, 1,
-1.540529, -0.2718963, -1.633947, 1, 1, 1, 1, 1,
-1.51348, -0.2339431, -1.71117, 1, 1, 1, 1, 1,
-1.507121, -0.1853993, -2.37676, 1, 1, 1, 1, 1,
-1.497294, -0.1173656, -2.353785, 1, 1, 1, 1, 1,
-1.495661, 0.5215683, -0.7965655, 1, 1, 1, 1, 1,
-1.491897, -0.8038013, -1.882465, 1, 1, 1, 1, 1,
-1.475341, -0.5434566, -2.661458, 1, 1, 1, 1, 1,
-1.473546, 0.3790986, 0.9365593, 1, 1, 1, 1, 1,
-1.471371, 0.6043476, -1.262531, 1, 1, 1, 1, 1,
-1.471041, 0.2431383, -0.9045508, 1, 1, 1, 1, 1,
-1.461981, 1.109032, -1.388648, 1, 1, 1, 1, 1,
-1.448415, -0.6098582, -1.954569, 1, 1, 1, 1, 1,
-1.39804, -0.08085912, -1.435836, 1, 1, 1, 1, 1,
-1.391646, 1.130207, -0.08775291, 1, 1, 1, 1, 1,
-1.390468, -0.03427918, -3.725796, 0, 0, 1, 1, 1,
-1.38831, 0.2622451, -0.9259436, 1, 0, 0, 1, 1,
-1.351241, -0.3360844, -3.697212, 1, 0, 0, 1, 1,
-1.342435, -1.192054, -1.574096, 1, 0, 0, 1, 1,
-1.341599, 0.2236899, -0.09354626, 1, 0, 0, 1, 1,
-1.340299, 0.449122, -1.835353, 1, 0, 0, 1, 1,
-1.332796, -0.4118092, -2.37377, 0, 0, 0, 1, 1,
-1.317438, -0.272157, -2.687429, 0, 0, 0, 1, 1,
-1.303854, 0.6125776, -1.813007, 0, 0, 0, 1, 1,
-1.303555, 0.6437259, -0.8117178, 0, 0, 0, 1, 1,
-1.302675, 1.3626, -0.08783357, 0, 0, 0, 1, 1,
-1.297895, -0.2292366, -1.245491, 0, 0, 0, 1, 1,
-1.280825, -3.005934, -1.568494, 0, 0, 0, 1, 1,
-1.279338, 0.3854505, -2.28434, 1, 1, 1, 1, 1,
-1.266629, -0.360707, -1.758245, 1, 1, 1, 1, 1,
-1.258049, -0.08474179, -0.4603626, 1, 1, 1, 1, 1,
-1.257516, 0.7603899, -2.584628, 1, 1, 1, 1, 1,
-1.250709, -0.4172769, -2.184952, 1, 1, 1, 1, 1,
-1.226674, 0.5971585, -1.443377, 1, 1, 1, 1, 1,
-1.217602, -0.3134698, -1.002092, 1, 1, 1, 1, 1,
-1.216976, 0.7788632, -0.7341549, 1, 1, 1, 1, 1,
-1.211967, -0.06091188, -0.1849878, 1, 1, 1, 1, 1,
-1.211834, -0.7744328, -3.035957, 1, 1, 1, 1, 1,
-1.205515, 0.8443393, -1.40677, 1, 1, 1, 1, 1,
-1.205435, -1.643673, -3.918307, 1, 1, 1, 1, 1,
-1.198964, 0.8138092, -0.06674373, 1, 1, 1, 1, 1,
-1.18758, -0.2705118, -2.660078, 1, 1, 1, 1, 1,
-1.186306, 0.2075645, -0.6921163, 1, 1, 1, 1, 1,
-1.181183, -0.02323454, -1.60705, 0, 0, 1, 1, 1,
-1.16921, 1.582108, -1.286939, 1, 0, 0, 1, 1,
-1.169129, 0.2151902, -1.838777, 1, 0, 0, 1, 1,
-1.168455, 1.836389, -0.09567137, 1, 0, 0, 1, 1,
-1.166531, 0.5298891, 1.804767, 1, 0, 0, 1, 1,
-1.164316, 0.01734908, -1.662084, 1, 0, 0, 1, 1,
-1.160249, 0.1960109, -1.069613, 0, 0, 0, 1, 1,
-1.15883, 0.8211638, -0.0988498, 0, 0, 0, 1, 1,
-1.156265, 0.2962761, -2.17147, 0, 0, 0, 1, 1,
-1.143416, -0.0996367, -3.04174, 0, 0, 0, 1, 1,
-1.142337, -0.6064098, -0.5015171, 0, 0, 0, 1, 1,
-1.139036, -0.2719966, -0.8807097, 0, 0, 0, 1, 1,
-1.137641, 0.7943741, -0.7869558, 0, 0, 0, 1, 1,
-1.13246, 0.4832742, -0.8679131, 1, 1, 1, 1, 1,
-1.1247, -0.3135722, -2.90662, 1, 1, 1, 1, 1,
-1.120937, -1.444925, -3.15383, 1, 1, 1, 1, 1,
-1.115938, -1.11007, -2.118445, 1, 1, 1, 1, 1,
-1.115217, 0.6222227, -2.049099, 1, 1, 1, 1, 1,
-1.111635, 0.7191486, -1.156653, 1, 1, 1, 1, 1,
-1.105693, -0.6410478, -1.633082, 1, 1, 1, 1, 1,
-1.105292, 0.8915468, 0.1606384, 1, 1, 1, 1, 1,
-1.103448, -2.968797, -3.368104, 1, 1, 1, 1, 1,
-1.101663, 0.8052426, -0.06491076, 1, 1, 1, 1, 1,
-1.099236, -0.1795521, -1.156366, 1, 1, 1, 1, 1,
-1.096921, -1.662497, -0.9701427, 1, 1, 1, 1, 1,
-1.09619, -0.9291006, -2.825461, 1, 1, 1, 1, 1,
-1.093397, -0.6605522, -3.030354, 1, 1, 1, 1, 1,
-1.083907, 0.6367472, -1.435399, 1, 1, 1, 1, 1,
-1.083904, 0.2796139, -1.021092, 0, 0, 1, 1, 1,
-1.079253, 0.5009774, 0.7689942, 1, 0, 0, 1, 1,
-1.078875, -0.1642173, 0.9070509, 1, 0, 0, 1, 1,
-1.073446, 0.181529, -1.126212, 1, 0, 0, 1, 1,
-1.06883, -1.444731, -3.25745, 1, 0, 0, 1, 1,
-1.067254, -0.5813037, -2.402126, 1, 0, 0, 1, 1,
-1.062875, 1.078657, 0.5837765, 0, 0, 0, 1, 1,
-1.060997, -0.8628502, -2.610743, 0, 0, 0, 1, 1,
-1.060674, 1.592054, -1.316874, 0, 0, 0, 1, 1,
-1.057624, -0.731425, -1.517351, 0, 0, 0, 1, 1,
-1.048712, 0.8020497, -0.9758406, 0, 0, 0, 1, 1,
-1.040834, -1.260053, -2.345879, 0, 0, 0, 1, 1,
-1.037006, -0.3631472, -0.8286477, 0, 0, 0, 1, 1,
-1.023384, 0.2616022, -0.4807217, 1, 1, 1, 1, 1,
-1.0215, -0.705148, -1.660581, 1, 1, 1, 1, 1,
-1.018646, -1.931469, -5.014069, 1, 1, 1, 1, 1,
-1.018281, 1.233769, -1.824362, 1, 1, 1, 1, 1,
-1.004437, 0.008691474, -0.3306552, 1, 1, 1, 1, 1,
-0.9968963, -0.3010561, -1.125061, 1, 1, 1, 1, 1,
-0.995594, -1.171333, -2.67024, 1, 1, 1, 1, 1,
-0.9949772, -0.7166171, -1.689894, 1, 1, 1, 1, 1,
-0.9945274, -0.885691, -3.003919, 1, 1, 1, 1, 1,
-0.9832929, 0.08696598, -1.061291, 1, 1, 1, 1, 1,
-0.9707395, -1.584891, -3.305546, 1, 1, 1, 1, 1,
-0.968767, 0.7340226, -0.2998821, 1, 1, 1, 1, 1,
-0.9633135, -1.051758, -3.343021, 1, 1, 1, 1, 1,
-0.9592054, 2.677866, -0.2500739, 1, 1, 1, 1, 1,
-0.9562808, 0.6956189, -1.098178, 1, 1, 1, 1, 1,
-0.9472865, 0.9106204, -0.8177934, 0, 0, 1, 1, 1,
-0.9465067, 1.487482, -1.138301, 1, 0, 0, 1, 1,
-0.9446771, 0.07356692, -2.07114, 1, 0, 0, 1, 1,
-0.9444904, 0.239241, -0.4724813, 1, 0, 0, 1, 1,
-0.944338, -0.6416858, -0.4464569, 1, 0, 0, 1, 1,
-0.941932, -0.8507929, -3.930879, 1, 0, 0, 1, 1,
-0.9389579, 2.291801, -1.577693, 0, 0, 0, 1, 1,
-0.9271349, -1.704876, -3.228106, 0, 0, 0, 1, 1,
-0.9246646, -0.7237936, -2.52861, 0, 0, 0, 1, 1,
-0.9221575, 0.9085646, -0.6118761, 0, 0, 0, 1, 1,
-0.9129023, -1.586003, -2.794345, 0, 0, 0, 1, 1,
-0.9097075, 0.5927745, -2.153863, 0, 0, 0, 1, 1,
-0.9049942, 0.1390769, -3.014324, 0, 0, 0, 1, 1,
-0.9032654, 0.5414098, -1.314414, 1, 1, 1, 1, 1,
-0.9028485, 1.531252, 1.168887, 1, 1, 1, 1, 1,
-0.8966145, 0.9225904, -2.356745, 1, 1, 1, 1, 1,
-0.8947244, 0.4951492, -1.460368, 1, 1, 1, 1, 1,
-0.876784, -0.7323923, -1.499787, 1, 1, 1, 1, 1,
-0.8720458, -0.6517575, -1.0798, 1, 1, 1, 1, 1,
-0.8716363, -0.1453618, -1.279593, 1, 1, 1, 1, 1,
-0.8629279, -0.2486816, -0.1993105, 1, 1, 1, 1, 1,
-0.861019, 1.673334, -0.3647382, 1, 1, 1, 1, 1,
-0.860729, 1.090857, 1.281574, 1, 1, 1, 1, 1,
-0.8581473, 1.553373, -1.503187, 1, 1, 1, 1, 1,
-0.8536872, -1.051848, -1.888828, 1, 1, 1, 1, 1,
-0.8528593, 1.434635, -1.42703, 1, 1, 1, 1, 1,
-0.8497298, 0.4913417, -1.485109, 1, 1, 1, 1, 1,
-0.8460849, -1.537449, -3.490218, 1, 1, 1, 1, 1,
-0.8445076, -0.5446573, -2.926552, 0, 0, 1, 1, 1,
-0.8433955, 0.3882411, -1.575873, 1, 0, 0, 1, 1,
-0.8433487, -0.7381191, -1.957301, 1, 0, 0, 1, 1,
-0.8348837, -1.334933, -1.236204, 1, 0, 0, 1, 1,
-0.8320368, 0.5637879, -1.719612, 1, 0, 0, 1, 1,
-0.8319435, 1.479068, -0.2646503, 1, 0, 0, 1, 1,
-0.8307917, 1.098867, 1.680117, 0, 0, 0, 1, 1,
-0.8282744, -0.2956639, -1.711521, 0, 0, 0, 1, 1,
-0.8232601, 0.3968787, 1.021464, 0, 0, 0, 1, 1,
-0.8227056, -1.114125, -3.715438, 0, 0, 0, 1, 1,
-0.8217009, -0.2198987, -3.037241, 0, 0, 0, 1, 1,
-0.8168253, 0.1455529, -0.4005832, 0, 0, 0, 1, 1,
-0.8120394, 1.660824, -0.7340587, 0, 0, 0, 1, 1,
-0.8043451, -0.1540107, -0.7024654, 1, 1, 1, 1, 1,
-0.8013878, 0.8104216, -1.082302, 1, 1, 1, 1, 1,
-0.8006846, 0.3548053, -1.039608, 1, 1, 1, 1, 1,
-0.80019, -1.195662, -2.9148, 1, 1, 1, 1, 1,
-0.794279, 0.1353608, -1.413956, 1, 1, 1, 1, 1,
-0.7883094, -0.6922931, -1.424083, 1, 1, 1, 1, 1,
-0.7828274, -0.6146175, -0.1831097, 1, 1, 1, 1, 1,
-0.7825698, 0.7800223, -0.03954535, 1, 1, 1, 1, 1,
-0.7807565, -1.588015, -0.2702223, 1, 1, 1, 1, 1,
-0.7779835, -1.527013, -1.952179, 1, 1, 1, 1, 1,
-0.7757041, 0.2299634, -2.735196, 1, 1, 1, 1, 1,
-0.7690456, -0.1596537, -2.706856, 1, 1, 1, 1, 1,
-0.7628204, -0.7031459, -1.587963, 1, 1, 1, 1, 1,
-0.7621127, 1.085932, 1.193311, 1, 1, 1, 1, 1,
-0.7611235, 0.9678896, -0.6673799, 1, 1, 1, 1, 1,
-0.7591226, 0.2107572, -2.435839, 0, 0, 1, 1, 1,
-0.748663, 0.1966467, -1.113703, 1, 0, 0, 1, 1,
-0.7460724, -0.1946465, -3.033485, 1, 0, 0, 1, 1,
-0.7446209, 1.765317, -0.1196804, 1, 0, 0, 1, 1,
-0.743606, 1.133065, -0.403866, 1, 0, 0, 1, 1,
-0.7390066, 1.607287, 0.4528038, 1, 0, 0, 1, 1,
-0.7344015, -1.405677, -2.432201, 0, 0, 0, 1, 1,
-0.7332171, 0.4829787, -0.3843221, 0, 0, 0, 1, 1,
-0.7276617, 0.197825, -1.32421, 0, 0, 0, 1, 1,
-0.7260001, -0.6900789, -3.079226, 0, 0, 0, 1, 1,
-0.7230293, 1.314327, -1.702575, 0, 0, 0, 1, 1,
-0.7204177, 0.7704929, -0.7735651, 0, 0, 0, 1, 1,
-0.7197795, -1.104075, -2.103081, 0, 0, 0, 1, 1,
-0.7182928, 0.9620478, -2.384689, 1, 1, 1, 1, 1,
-0.7176335, 0.2568946, -1.240798, 1, 1, 1, 1, 1,
-0.7151142, -1.98402, -2.922741, 1, 1, 1, 1, 1,
-0.7044185, -0.6064882, -3.226354, 1, 1, 1, 1, 1,
-0.7031782, 0.8301014, -0.8999605, 1, 1, 1, 1, 1,
-0.6992217, 0.1683093, -0.4084088, 1, 1, 1, 1, 1,
-0.6984202, -0.01640264, -1.44537, 1, 1, 1, 1, 1,
-0.6954975, 0.07356835, 0.4480116, 1, 1, 1, 1, 1,
-0.6947481, -0.4428563, -2.443444, 1, 1, 1, 1, 1,
-0.6902153, 0.01449749, -2.936855, 1, 1, 1, 1, 1,
-0.6880906, 1.301763, -2.03522, 1, 1, 1, 1, 1,
-0.683422, -0.318852, -1.081614, 1, 1, 1, 1, 1,
-0.6805531, -0.3633526, -2.198599, 1, 1, 1, 1, 1,
-0.6744269, 1.107213, 1.052497, 1, 1, 1, 1, 1,
-0.6730207, 0.5253633, -0.3205593, 1, 1, 1, 1, 1,
-0.6719025, 0.03508561, 0.3352037, 0, 0, 1, 1, 1,
-0.6683991, 0.6027283, -2.354363, 1, 0, 0, 1, 1,
-0.6683745, -1.612441, -2.827883, 1, 0, 0, 1, 1,
-0.6664956, -1.231851, -2.055254, 1, 0, 0, 1, 1,
-0.663515, 1.188565, 1.600431, 1, 0, 0, 1, 1,
-0.661696, -1.067473, -3.287353, 1, 0, 0, 1, 1,
-0.6579951, -1.591475, -2.701239, 0, 0, 0, 1, 1,
-0.6576573, -0.04883637, -0.8182539, 0, 0, 0, 1, 1,
-0.6569827, 0.7481253, -1.078526, 0, 0, 0, 1, 1,
-0.6464026, 0.8226275, -1.656616, 0, 0, 0, 1, 1,
-0.6460559, -0.7348281, -1.475311, 0, 0, 0, 1, 1,
-0.6438044, -0.1289538, -2.728553, 0, 0, 0, 1, 1,
-0.6400431, 0.08647681, -1.601842, 0, 0, 0, 1, 1,
-0.6383629, -0.3953441, -1.248737, 1, 1, 1, 1, 1,
-0.6313163, -0.6299517, -1.856142, 1, 1, 1, 1, 1,
-0.6293821, 0.09924586, 0.6413366, 1, 1, 1, 1, 1,
-0.6224673, -0.7052099, -2.051833, 1, 1, 1, 1, 1,
-0.6215976, 0.05312261, -1.980285, 1, 1, 1, 1, 1,
-0.6214409, -1.056124, -1.328827, 1, 1, 1, 1, 1,
-0.6199415, -0.8353979, -2.123354, 1, 1, 1, 1, 1,
-0.6185794, -0.4279881, -2.559502, 1, 1, 1, 1, 1,
-0.6175659, -1.360534, -2.632433, 1, 1, 1, 1, 1,
-0.6169811, 0.7210869, -0.6942138, 1, 1, 1, 1, 1,
-0.616348, -0.1451598, -0.5962516, 1, 1, 1, 1, 1,
-0.6156368, 0.1017402, -2.014853, 1, 1, 1, 1, 1,
-0.6132987, -0.1299593, -1.111052, 1, 1, 1, 1, 1,
-0.6059256, -1.015359, -2.068065, 1, 1, 1, 1, 1,
-0.6025013, 0.2131514, 0.3549893, 1, 1, 1, 1, 1,
-0.5965322, 1.489484, -2.775473, 0, 0, 1, 1, 1,
-0.5920749, 0.7323253, -0.2664, 1, 0, 0, 1, 1,
-0.5864463, -1.615874, -4.604555, 1, 0, 0, 1, 1,
-0.5832424, -0.0597376, -0.5039196, 1, 0, 0, 1, 1,
-0.5817836, -1.183768, -2.629894, 1, 0, 0, 1, 1,
-0.5785969, 0.5949682, -1.711964, 1, 0, 0, 1, 1,
-0.5775223, -0.1353089, -2.33376, 0, 0, 0, 1, 1,
-0.576657, 1.006372, -1.442786, 0, 0, 0, 1, 1,
-0.5765473, -0.4384215, -0.8254446, 0, 0, 0, 1, 1,
-0.5759715, -0.1824687, -2.259882, 0, 0, 0, 1, 1,
-0.5755279, 0.365158, -1.940411, 0, 0, 0, 1, 1,
-0.5736964, -2.394012, -1.572021, 0, 0, 0, 1, 1,
-0.5735302, -0.6056231, -2.391401, 0, 0, 0, 1, 1,
-0.5728285, 0.7241607, -0.1208911, 1, 1, 1, 1, 1,
-0.5702289, -2.640861, -3.513985, 1, 1, 1, 1, 1,
-0.5700669, 0.1143907, -0.05663556, 1, 1, 1, 1, 1,
-0.5652897, -0.8440306, -2.599184, 1, 1, 1, 1, 1,
-0.5616408, 0.6386986, 0.5444744, 1, 1, 1, 1, 1,
-0.5554726, -1.261673, -3.225123, 1, 1, 1, 1, 1,
-0.55387, 1.144298, 0.8671817, 1, 1, 1, 1, 1,
-0.5484047, 0.2061342, -2.214041, 1, 1, 1, 1, 1,
-0.5448162, -0.8297651, -2.418084, 1, 1, 1, 1, 1,
-0.5426248, -1.135704, -2.608057, 1, 1, 1, 1, 1,
-0.5425943, 2.256098, -0.5063523, 1, 1, 1, 1, 1,
-0.5396306, 0.3857301, 0.1635984, 1, 1, 1, 1, 1,
-0.5370942, -1.103901, -1.768406, 1, 1, 1, 1, 1,
-0.5353676, -0.2844455, -0.4272342, 1, 1, 1, 1, 1,
-0.533734, 0.9770214, -0.4267123, 1, 1, 1, 1, 1,
-0.5325678, 0.5500996, -0.6641967, 0, 0, 1, 1, 1,
-0.52533, 0.8511296, 0.9975483, 1, 0, 0, 1, 1,
-0.5233237, -1.141322, -2.252702, 1, 0, 0, 1, 1,
-0.5169414, -0.07333861, -2.723562, 1, 0, 0, 1, 1,
-0.5161266, -0.1105166, -3.059843, 1, 0, 0, 1, 1,
-0.5157323, -2.716259, -5.15456, 1, 0, 0, 1, 1,
-0.5129582, 0.4258032, 0.7830329, 0, 0, 0, 1, 1,
-0.5102404, -0.2489222, -2.360917, 0, 0, 0, 1, 1,
-0.508803, 0.4374889, -1.55722, 0, 0, 0, 1, 1,
-0.506502, -0.04151882, -1.355129, 0, 0, 0, 1, 1,
-0.5041405, -0.05335425, -1.842234, 0, 0, 0, 1, 1,
-0.5005136, -1.23678, -3.333827, 0, 0, 0, 1, 1,
-0.4954, 0.707768, -1.731736, 0, 0, 0, 1, 1,
-0.4922693, 0.01417548, -1.288077, 1, 1, 1, 1, 1,
-0.4896221, 0.0163048, -3.062339, 1, 1, 1, 1, 1,
-0.4882911, -0.4259401, -2.570472, 1, 1, 1, 1, 1,
-0.4805971, 0.4887734, -1.456776, 1, 1, 1, 1, 1,
-0.4708613, 0.2807485, -0.3845209, 1, 1, 1, 1, 1,
-0.4690928, -0.3359704, -1.459931, 1, 1, 1, 1, 1,
-0.4642038, 0.2058717, -0.8674564, 1, 1, 1, 1, 1,
-0.4609718, 0.05899256, -3.091467, 1, 1, 1, 1, 1,
-0.4574024, 0.8337182, -2.44779, 1, 1, 1, 1, 1,
-0.4566936, -2.043367, -2.616745, 1, 1, 1, 1, 1,
-0.4563116, 1.720868, -0.2514225, 1, 1, 1, 1, 1,
-0.4550266, 0.1180484, -1.17221, 1, 1, 1, 1, 1,
-0.4523244, -0.8687415, -4.130898, 1, 1, 1, 1, 1,
-0.4512373, -1.683411, -1.924203, 1, 1, 1, 1, 1,
-0.4498465, 1.408795, -0.5498663, 1, 1, 1, 1, 1,
-0.4478667, 0.6474052, -0.5679145, 0, 0, 1, 1, 1,
-0.4465479, 0.6948581, -1.300319, 1, 0, 0, 1, 1,
-0.4445561, -0.8504097, -2.408329, 1, 0, 0, 1, 1,
-0.4434396, 1.211823, -0.3534436, 1, 0, 0, 1, 1,
-0.4426493, 0.4739922, -1.093945, 1, 0, 0, 1, 1,
-0.4358658, -1.017824, -2.968839, 1, 0, 0, 1, 1,
-0.4356783, -0.4107753, -0.6531708, 0, 0, 0, 1, 1,
-0.4347515, 1.108713, -0.1435183, 0, 0, 0, 1, 1,
-0.4339533, -0.2598521, -0.8593382, 0, 0, 0, 1, 1,
-0.4310161, 0.598148, -1.508817, 0, 0, 0, 1, 1,
-0.4226011, -0.3821209, -2.15587, 0, 0, 0, 1, 1,
-0.4067247, -0.04542609, -2.874245, 0, 0, 0, 1, 1,
-0.4050651, -0.5225575, -4.319452, 0, 0, 0, 1, 1,
-0.4007411, -1.962693, -2.749871, 1, 1, 1, 1, 1,
-0.4004022, 0.8916301, -0.280506, 1, 1, 1, 1, 1,
-0.3977498, 0.3972608, -1.706254, 1, 1, 1, 1, 1,
-0.3943692, -0.3915001, -3.265423, 1, 1, 1, 1, 1,
-0.3930799, 1.602672, 1.756624, 1, 1, 1, 1, 1,
-0.390205, -0.8027726, -1.729247, 1, 1, 1, 1, 1,
-0.3875637, 0.3478042, -0.2123769, 1, 1, 1, 1, 1,
-0.385714, 0.8796311, 0.7231081, 1, 1, 1, 1, 1,
-0.3840776, 1.299717, 1.078621, 1, 1, 1, 1, 1,
-0.3832296, -0.3765481, -0.7118168, 1, 1, 1, 1, 1,
-0.382699, 0.5949966, -0.0778344, 1, 1, 1, 1, 1,
-0.3718503, 0.5371206, -0.9067295, 1, 1, 1, 1, 1,
-0.3703006, 0.8820241, -1.164485, 1, 1, 1, 1, 1,
-0.3697498, 0.05852302, -0.2682551, 1, 1, 1, 1, 1,
-0.3659024, -0.2927973, -3.464135, 1, 1, 1, 1, 1,
-0.361007, 0.8513139, 0.02813356, 0, 0, 1, 1, 1,
-0.3553196, 0.2266312, -2.093762, 1, 0, 0, 1, 1,
-0.3544148, 0.1161307, -1.678514, 1, 0, 0, 1, 1,
-0.3521541, -0.6075477, -1.002628, 1, 0, 0, 1, 1,
-0.3470106, 0.3405308, 0.7418608, 1, 0, 0, 1, 1,
-0.3437341, -0.3016343, -3.424856, 1, 0, 0, 1, 1,
-0.338718, 0.001664199, -0.6334316, 0, 0, 0, 1, 1,
-0.3385844, -0.6503947, -2.900195, 0, 0, 0, 1, 1,
-0.3346936, 0.3904434, -2.687492, 0, 0, 0, 1, 1,
-0.3329349, -0.6745655, -2.655739, 0, 0, 0, 1, 1,
-0.3287812, 1.461812, -0.1931535, 0, 0, 0, 1, 1,
-0.3279412, 1.29215, -1.408577, 0, 0, 0, 1, 1,
-0.3272617, 0.05269842, -0.7388402, 0, 0, 0, 1, 1,
-0.3266497, 0.5064069, -1.316855, 1, 1, 1, 1, 1,
-0.3239082, 1.251303, -1.222445, 1, 1, 1, 1, 1,
-0.3204693, 1.225857, -1.238028, 1, 1, 1, 1, 1,
-0.3176873, -4.171393, -3.438321, 1, 1, 1, 1, 1,
-0.3132614, -0.9901504, -2.489218, 1, 1, 1, 1, 1,
-0.3097831, 0.4630547, -2.187557, 1, 1, 1, 1, 1,
-0.3012397, 0.5752209, -0.7548611, 1, 1, 1, 1, 1,
-0.299238, 1.583846, -0.7676147, 1, 1, 1, 1, 1,
-0.2975464, 0.8200719, 0.9608284, 1, 1, 1, 1, 1,
-0.2847178, 0.8580769, -0.04695056, 1, 1, 1, 1, 1,
-0.284259, 0.1024145, -0.7349445, 1, 1, 1, 1, 1,
-0.2829881, -0.5291649, -3.036689, 1, 1, 1, 1, 1,
-0.2818678, 0.2458281, -0.3256983, 1, 1, 1, 1, 1,
-0.2810577, 0.1160145, -0.7593071, 1, 1, 1, 1, 1,
-0.2790041, -0.7485507, -2.151501, 1, 1, 1, 1, 1,
-0.2786129, 0.08839016, -1.645535, 0, 0, 1, 1, 1,
-0.2752142, -0.5737476, -1.410873, 1, 0, 0, 1, 1,
-0.2735544, -0.9081462, -2.624476, 1, 0, 0, 1, 1,
-0.2734787, -0.7510255, -1.243453, 1, 0, 0, 1, 1,
-0.2705224, -0.5167886, -3.993221, 1, 0, 0, 1, 1,
-0.2690891, -2.553815, -3.346131, 1, 0, 0, 1, 1,
-0.2687067, 0.7652077, 0.7345184, 0, 0, 0, 1, 1,
-0.2684611, -0.643957, -3.949452, 0, 0, 0, 1, 1,
-0.266611, -3.080711, -2.336905, 0, 0, 0, 1, 1,
-0.2646038, -0.2047691, -2.05708, 0, 0, 0, 1, 1,
-0.2631661, -0.7425814, -3.65565, 0, 0, 0, 1, 1,
-0.2594875, 1.485754, -0.8391916, 0, 0, 0, 1, 1,
-0.2548024, -0.3881626, -2.54053, 0, 0, 0, 1, 1,
-0.2545251, -0.02993422, -0.7986599, 1, 1, 1, 1, 1,
-0.2519903, 1.286924, 0.7163764, 1, 1, 1, 1, 1,
-0.250233, -0.5863891, -3.12685, 1, 1, 1, 1, 1,
-0.2475873, -0.7606801, -2.73755, 1, 1, 1, 1, 1,
-0.2427751, 1.419184, -0.3267035, 1, 1, 1, 1, 1,
-0.2420067, -0.332698, -3.767502, 1, 1, 1, 1, 1,
-0.2386405, -1.9551, -3.253597, 1, 1, 1, 1, 1,
-0.238137, 0.9977764, 1.164033, 1, 1, 1, 1, 1,
-0.2352305, 0.8432281, 0.831383, 1, 1, 1, 1, 1,
-0.2351634, 1.091291, -0.366792, 1, 1, 1, 1, 1,
-0.2309769, 0.5050706, -0.4802771, 1, 1, 1, 1, 1,
-0.2306261, 0.7665598, -0.2692938, 1, 1, 1, 1, 1,
-0.2239723, 0.6220893, -0.7906095, 1, 1, 1, 1, 1,
-0.2140212, -0.7158525, -1.674428, 1, 1, 1, 1, 1,
-0.2093634, -1.748422, -0.1285446, 1, 1, 1, 1, 1,
-0.2081328, -0.0900571, -1.869012, 0, 0, 1, 1, 1,
-0.2054572, -0.1262607, -1.801333, 1, 0, 0, 1, 1,
-0.2047245, -1.662067, -2.562143, 1, 0, 0, 1, 1,
-0.2044883, -0.1140733, -4.461059, 1, 0, 0, 1, 1,
-0.2029047, 0.8911235, -1.019729, 1, 0, 0, 1, 1,
-0.2022734, 2.056926, 0.3421527, 1, 0, 0, 1, 1,
-0.1953468, -0.7297714, -2.259377, 0, 0, 0, 1, 1,
-0.1936266, -1.740763, -4.616662, 0, 0, 0, 1, 1,
-0.188749, -0.0552798, -0.3255713, 0, 0, 0, 1, 1,
-0.1882364, 0.06002244, -0.7157043, 0, 0, 0, 1, 1,
-0.1881359, 0.07216761, -3.001413, 0, 0, 0, 1, 1,
-0.1877191, -1.717282, -3.003335, 0, 0, 0, 1, 1,
-0.1875211, -0.1350992, -2.335117, 0, 0, 0, 1, 1,
-0.1822636, 1.27542, 1.394438, 1, 1, 1, 1, 1,
-0.1805352, -0.09497754, -0.7484143, 1, 1, 1, 1, 1,
-0.1772484, -0.5067312, -2.189779, 1, 1, 1, 1, 1,
-0.176957, 1.198606, -1.748394, 1, 1, 1, 1, 1,
-0.1731088, -1.535329, -2.407226, 1, 1, 1, 1, 1,
-0.1715431, 1.461103, 0.6204277, 1, 1, 1, 1, 1,
-0.1687255, -0.2293117, -2.177223, 1, 1, 1, 1, 1,
-0.1685106, -2.13084, -2.208884, 1, 1, 1, 1, 1,
-0.1678597, 1.13613, 0.2069142, 1, 1, 1, 1, 1,
-0.1606753, -0.7820397, -1.31144, 1, 1, 1, 1, 1,
-0.1604293, 1.033851, 0.760812, 1, 1, 1, 1, 1,
-0.1585081, -0.7727715, -4.067472, 1, 1, 1, 1, 1,
-0.1569677, -1.729677, -3.735389, 1, 1, 1, 1, 1,
-0.1555504, 2.547512, -0.5124014, 1, 1, 1, 1, 1,
-0.1541815, 0.621812, 0.5156453, 1, 1, 1, 1, 1,
-0.1537195, 0.3285525, -0.4871338, 0, 0, 1, 1, 1,
-0.1519573, 0.3707869, -0.4164556, 1, 0, 0, 1, 1,
-0.1518383, 0.7869961, -1.435314, 1, 0, 0, 1, 1,
-0.1511712, 0.4159568, -0.1686876, 1, 0, 0, 1, 1,
-0.147818, 2.328158, -1.107072, 1, 0, 0, 1, 1,
-0.1440783, -1.278205, -4.267645, 1, 0, 0, 1, 1,
-0.1440528, 0.3895965, -0.5233417, 0, 0, 0, 1, 1,
-0.1424974, 0.6661001, -1.309318, 0, 0, 0, 1, 1,
-0.1402252, 1.123209, -0.9480478, 0, 0, 0, 1, 1,
-0.1371879, 2.025239, -0.01961751, 0, 0, 0, 1, 1,
-0.137104, 0.1043612, -2.030521, 0, 0, 0, 1, 1,
-0.1343968, -0.2183753, -3.456119, 0, 0, 0, 1, 1,
-0.133284, 0.7530786, -2.452338, 0, 0, 0, 1, 1,
-0.1277695, -1.547481, -3.950475, 1, 1, 1, 1, 1,
-0.125609, 0.206178, -0.2346641, 1, 1, 1, 1, 1,
-0.1233701, 0.1245502, 0.3237142, 1, 1, 1, 1, 1,
-0.1223965, 0.3666959, 0.1551594, 1, 1, 1, 1, 1,
-0.1198031, -0.4545873, -2.259416, 1, 1, 1, 1, 1,
-0.1124303, 0.2340064, -0.2602451, 1, 1, 1, 1, 1,
-0.1086426, -0.7463366, -3.976738, 1, 1, 1, 1, 1,
-0.1056819, -0.5110044, -2.218739, 1, 1, 1, 1, 1,
-0.1017133, -0.3677208, -3.782414, 1, 1, 1, 1, 1,
-0.1008578, -1.377923, -3.808339, 1, 1, 1, 1, 1,
-0.09879554, 0.9653523, -1.184362, 1, 1, 1, 1, 1,
-0.09805691, -0.5117609, -2.140086, 1, 1, 1, 1, 1,
-0.09388048, -0.2200886, -1.432587, 1, 1, 1, 1, 1,
-0.09166069, -0.4819409, -2.912416, 1, 1, 1, 1, 1,
-0.08731796, -0.2995903, -2.72052, 1, 1, 1, 1, 1,
-0.07483263, 1.326312, 0.3033768, 0, 0, 1, 1, 1,
-0.07440207, 0.3047798, 0.3417535, 1, 0, 0, 1, 1,
-0.06904092, -0.2496323, -2.938359, 1, 0, 0, 1, 1,
-0.06885563, -0.6322539, -1.307057, 1, 0, 0, 1, 1,
-0.06791229, 1.122952, -1.314308, 1, 0, 0, 1, 1,
-0.06474533, 1.704494, -0.6252478, 1, 0, 0, 1, 1,
-0.06350628, -0.222864, -2.616694, 0, 0, 0, 1, 1,
-0.06120912, -2.325682, -1.965818, 0, 0, 0, 1, 1,
-0.0602138, -0.0704971, -1.761635, 0, 0, 0, 1, 1,
-0.05206608, -0.891209, -1.945095, 0, 0, 0, 1, 1,
-0.05145105, -0.9593241, -3.777098, 0, 0, 0, 1, 1,
-0.05115953, -1.175489, -4.181008, 0, 0, 0, 1, 1,
-0.0502758, -0.2766215, -1.137179, 0, 0, 0, 1, 1,
-0.04695517, -0.07288183, -2.861581, 1, 1, 1, 1, 1,
-0.04665464, -1.114694, -2.912207, 1, 1, 1, 1, 1,
-0.03968441, -0.01555956, -0.8604451, 1, 1, 1, 1, 1,
-0.03452782, -1.39653, -0.7847313, 1, 1, 1, 1, 1,
-0.02941749, -0.1980062, -3.149159, 1, 1, 1, 1, 1,
-0.02791762, -0.8619992, -3.527364, 1, 1, 1, 1, 1,
-0.02735864, -0.1465688, -3.327337, 1, 1, 1, 1, 1,
-0.02306277, -1.206482, -3.571703, 1, 1, 1, 1, 1,
-0.02215726, 0.769404, -0.4882016, 1, 1, 1, 1, 1,
-0.02215676, -0.3465579, -4.159176, 1, 1, 1, 1, 1,
-0.01695004, 0.5325154, -1.370837, 1, 1, 1, 1, 1,
-0.01573888, 0.01318927, -1.40896, 1, 1, 1, 1, 1,
-0.01399277, 0.3734907, 1.028677, 1, 1, 1, 1, 1,
-0.01113126, -0.3756191, -3.444476, 1, 1, 1, 1, 1,
-0.01059899, 1.569041, 2.410833, 1, 1, 1, 1, 1,
-0.008411376, 0.2152218, -0.4769474, 0, 0, 1, 1, 1,
-0.007143082, 0.3913138, -0.4253535, 1, 0, 0, 1, 1,
0.00334595, 0.03789691, -2.331343, 1, 0, 0, 1, 1,
0.004142168, 0.7544909, 0.3509433, 1, 0, 0, 1, 1,
0.008022672, 0.1080268, 0.4271058, 1, 0, 0, 1, 1,
0.01270367, -1.098101, 2.232117, 1, 0, 0, 1, 1,
0.01688281, -0.480137, 1.285836, 0, 0, 0, 1, 1,
0.02077151, 1.556588, -0.2951359, 0, 0, 0, 1, 1,
0.02086262, 0.9536096, 1.381431, 0, 0, 0, 1, 1,
0.02151077, 0.1074451, 1.902863, 0, 0, 0, 1, 1,
0.02217434, -0.8838359, 2.768748, 0, 0, 0, 1, 1,
0.02239328, 0.5688431, -0.07559199, 0, 0, 0, 1, 1,
0.02525318, 2.343844, -1.262739, 0, 0, 0, 1, 1,
0.02902984, -0.165922, 4.0288, 1, 1, 1, 1, 1,
0.02929442, -1.1318, 2.625277, 1, 1, 1, 1, 1,
0.0478921, -0.5129026, 3.377819, 1, 1, 1, 1, 1,
0.05721613, -1.036831, 3.803838, 1, 1, 1, 1, 1,
0.057331, 0.2435924, 0.9703342, 1, 1, 1, 1, 1,
0.05952556, 0.8465731, 1.800021, 1, 1, 1, 1, 1,
0.05953884, 0.5929435, 0.3698229, 1, 1, 1, 1, 1,
0.05991353, -0.968252, 3.629218, 1, 1, 1, 1, 1,
0.06333925, -0.8893269, 1.741919, 1, 1, 1, 1, 1,
0.06451394, -0.9497371, 1.710269, 1, 1, 1, 1, 1,
0.06668647, -1.857913, 3.025797, 1, 1, 1, 1, 1,
0.07427375, -1.545967, 4.885551, 1, 1, 1, 1, 1,
0.09040766, 1.407182, 1.20502, 1, 1, 1, 1, 1,
0.09285011, -0.275207, 3.286206, 1, 1, 1, 1, 1,
0.09586459, 0.7862045, 0.8753632, 1, 1, 1, 1, 1,
0.09734341, -0.6149825, 2.255053, 0, 0, 1, 1, 1,
0.0983488, -0.1136369, 2.332779, 1, 0, 0, 1, 1,
0.1006334, 2.069475, -1.040248, 1, 0, 0, 1, 1,
0.1020944, -2.155622, 3.281918, 1, 0, 0, 1, 1,
0.1037938, -0.5230047, 1.496865, 1, 0, 0, 1, 1,
0.1059716, 1.4731, -0.04343545, 1, 0, 0, 1, 1,
0.107434, -0.6161214, 2.603505, 0, 0, 0, 1, 1,
0.1087572, 0.6367139, 1.402763, 0, 0, 0, 1, 1,
0.1109977, -0.003095296, 2.441273, 0, 0, 0, 1, 1,
0.1126864, -0.3560772, 3.82942, 0, 0, 0, 1, 1,
0.1139329, -0.5592827, 2.751718, 0, 0, 0, 1, 1,
0.1145128, 0.3023697, 0.7285144, 0, 0, 0, 1, 1,
0.1153778, 0.649792, 0.4997664, 0, 0, 0, 1, 1,
0.1186275, 0.05291111, -0.2715606, 1, 1, 1, 1, 1,
0.1204197, -0.8900268, 1.973575, 1, 1, 1, 1, 1,
0.1207924, -0.08383898, 2.094954, 1, 1, 1, 1, 1,
0.1211731, 0.01658381, 1.648729, 1, 1, 1, 1, 1,
0.122438, -0.2001149, 3.275156, 1, 1, 1, 1, 1,
0.1247333, -1.544858, 4.106185, 1, 1, 1, 1, 1,
0.1259174, -0.3374653, 1.966189, 1, 1, 1, 1, 1,
0.1274742, 0.2065754, -0.8291067, 1, 1, 1, 1, 1,
0.1278856, -0.5281224, 4.352819, 1, 1, 1, 1, 1,
0.1285261, 1.904744, 0.06807943, 1, 1, 1, 1, 1,
0.1337793, 1.297085, -1.357669, 1, 1, 1, 1, 1,
0.1348033, -2.034599, 3.077988, 1, 1, 1, 1, 1,
0.1379492, -1.213877, 2.713162, 1, 1, 1, 1, 1,
0.1407764, 0.8911055, 0.3606891, 1, 1, 1, 1, 1,
0.1420673, 0.5375037, 0.1202278, 1, 1, 1, 1, 1,
0.1428595, 1.408993, 0.4121424, 0, 0, 1, 1, 1,
0.1435068, -2.521931, 4.30461, 1, 0, 0, 1, 1,
0.145502, -0.8864086, 2.231736, 1, 0, 0, 1, 1,
0.1461162, 0.6815713, -0.3098587, 1, 0, 0, 1, 1,
0.1503311, 1.277822, 0.1344403, 1, 0, 0, 1, 1,
0.1503843, -0.4757195, 2.8008, 1, 0, 0, 1, 1,
0.1505173, -1.933397, 4.390226, 0, 0, 0, 1, 1,
0.1546994, -1.082179, 4.938148, 0, 0, 0, 1, 1,
0.163847, 0.5309618, -0.2009629, 0, 0, 0, 1, 1,
0.1660263, 1.073544, 0.7226238, 0, 0, 0, 1, 1,
0.1670975, -0.8261149, 3.605514, 0, 0, 0, 1, 1,
0.1686379, -0.3804012, 2.01903, 0, 0, 0, 1, 1,
0.1734331, -0.06683441, 0.8334317, 0, 0, 0, 1, 1,
0.1802336, -0.08101591, 1.925601, 1, 1, 1, 1, 1,
0.1859344, 0.7660021, 0.8138998, 1, 1, 1, 1, 1,
0.1880736, -0.7624612, 5.258889, 1, 1, 1, 1, 1,
0.1881705, 1.684286, 2.609024, 1, 1, 1, 1, 1,
0.1939287, 2.132788, -0.605085, 1, 1, 1, 1, 1,
0.1991583, -0.5030999, 3.58111, 1, 1, 1, 1, 1,
0.2022888, 0.920802, 0.1618245, 1, 1, 1, 1, 1,
0.204369, -1.134456, 5.413258, 1, 1, 1, 1, 1,
0.2050556, 0.1258824, 2.652439, 1, 1, 1, 1, 1,
0.206442, 1.02152, 2.100355, 1, 1, 1, 1, 1,
0.2073379, -0.193503, 1.180138, 1, 1, 1, 1, 1,
0.2082589, -1.348237, 4.813411, 1, 1, 1, 1, 1,
0.2089727, 2.234805, -0.067417, 1, 1, 1, 1, 1,
0.2117442, -0.3935333, 2.941533, 1, 1, 1, 1, 1,
0.2132364, -3.632235, 3.30401, 1, 1, 1, 1, 1,
0.2136186, 1.718963, 2.376783, 0, 0, 1, 1, 1,
0.2141692, 1.773751, -0.5394548, 1, 0, 0, 1, 1,
0.2164733, -0.6582411, 2.782183, 1, 0, 0, 1, 1,
0.2176287, 0.6487637, -1.410151, 1, 0, 0, 1, 1,
0.2256269, 0.290628, -0.4557638, 1, 0, 0, 1, 1,
0.2258358, 0.07824603, 1.949268, 1, 0, 0, 1, 1,
0.226697, 0.6052605, 0.9744378, 0, 0, 0, 1, 1,
0.2271116, -1.186159, 3.129113, 0, 0, 0, 1, 1,
0.2309635, -0.59375, 2.969186, 0, 0, 0, 1, 1,
0.2316549, 0.1235536, 1.726074, 0, 0, 0, 1, 1,
0.231883, -0.4439616, 3.117963, 0, 0, 0, 1, 1,
0.2369139, 0.8887334, 0.4093259, 0, 0, 0, 1, 1,
0.2385865, 0.3081374, 1.373682, 0, 0, 0, 1, 1,
0.2402808, 0.3470525, 0.8123687, 1, 1, 1, 1, 1,
0.2483198, 0.6292378, -0.308332, 1, 1, 1, 1, 1,
0.2533041, 1.664806, -0.1311747, 1, 1, 1, 1, 1,
0.2542994, 0.5276554, 0.5821412, 1, 1, 1, 1, 1,
0.2597923, 1.644114, -0.3010095, 1, 1, 1, 1, 1,
0.2599939, 1.588675, 1.759789, 1, 1, 1, 1, 1,
0.2656726, 0.4022019, 2.700485, 1, 1, 1, 1, 1,
0.2679903, -0.6506805, 3.766049, 1, 1, 1, 1, 1,
0.2714526, 1.043881, -1.387859, 1, 1, 1, 1, 1,
0.2740059, -1.158491, 2.263762, 1, 1, 1, 1, 1,
0.2740932, 1.356967, 1.911146, 1, 1, 1, 1, 1,
0.2775635, -2.077199, 2.518721, 1, 1, 1, 1, 1,
0.2832651, -0.7669971, 1.054523, 1, 1, 1, 1, 1,
0.2865039, -0.7545399, 3.671862, 1, 1, 1, 1, 1,
0.2869078, 0.274203, 1.058366, 1, 1, 1, 1, 1,
0.2869534, -2.261305, 4.694468, 0, 0, 1, 1, 1,
0.2898034, -2.266267, 1.573936, 1, 0, 0, 1, 1,
0.2934892, 0.02330943, 2.256599, 1, 0, 0, 1, 1,
0.2956265, -0.5476019, 1.882804, 1, 0, 0, 1, 1,
0.3032585, -0.5280588, 2.992621, 1, 0, 0, 1, 1,
0.305193, 0.08582825, 0.9088144, 1, 0, 0, 1, 1,
0.3086703, 0.1956401, 1.513402, 0, 0, 0, 1, 1,
0.3154514, 0.446702, -1.339094, 0, 0, 0, 1, 1,
0.3159988, -0.2114683, 3.637249, 0, 0, 0, 1, 1,
0.3166243, 0.1148181, 2.012077, 0, 0, 0, 1, 1,
0.3167753, -1.646393, 2.144664, 0, 0, 0, 1, 1,
0.3185658, 1.481748, -0.8627955, 0, 0, 0, 1, 1,
0.3213951, -0.2254144, 1.593002, 0, 0, 0, 1, 1,
0.324402, 0.1969349, 1.842243, 1, 1, 1, 1, 1,
0.3316224, 1.388217, -0.6089519, 1, 1, 1, 1, 1,
0.3335852, -0.9055911, 3.691219, 1, 1, 1, 1, 1,
0.3344873, -0.3481368, 1.995352, 1, 1, 1, 1, 1,
0.3349525, -1.967705, 2.601204, 1, 1, 1, 1, 1,
0.3385307, 1.084849, -1.284521, 1, 1, 1, 1, 1,
0.3415462, -0.7049791, 2.602212, 1, 1, 1, 1, 1,
0.3437729, 1.118009, 1.01988, 1, 1, 1, 1, 1,
0.3451301, 1.072197, -0.5275034, 1, 1, 1, 1, 1,
0.3476838, -0.6428328, 3.859104, 1, 1, 1, 1, 1,
0.3481772, -0.9992585, 2.090396, 1, 1, 1, 1, 1,
0.3520814, -0.1011586, 1.243582, 1, 1, 1, 1, 1,
0.3525219, -0.7477551, 3.909873, 1, 1, 1, 1, 1,
0.3590617, 0.7984621, 1.306896, 1, 1, 1, 1, 1,
0.3611812, -0.1744224, 1.513033, 1, 1, 1, 1, 1,
0.365353, 0.7264419, -0.8153386, 0, 0, 1, 1, 1,
0.370696, -0.8590465, 2.818023, 1, 0, 0, 1, 1,
0.3716259, 2.078572, 0.3679092, 1, 0, 0, 1, 1,
0.3734344, -1.125649, 0.3874309, 1, 0, 0, 1, 1,
0.3828047, -0.1448498, 0.370322, 1, 0, 0, 1, 1,
0.3850214, -1.776023, 2.857334, 1, 0, 0, 1, 1,
0.3856099, -1.422278, 3.046371, 0, 0, 0, 1, 1,
0.3856509, -1.682759, 2.307712, 0, 0, 0, 1, 1,
0.3892198, 1.228617, 0.542836, 0, 0, 0, 1, 1,
0.391212, -1.573654, 3.743146, 0, 0, 0, 1, 1,
0.3924505, -0.808287, 0.6066366, 0, 0, 0, 1, 1,
0.395524, -2.414842, 2.302777, 0, 0, 0, 1, 1,
0.3958931, 1.638644, 0.990435, 0, 0, 0, 1, 1,
0.4047947, 0.8176208, 0.5081522, 1, 1, 1, 1, 1,
0.4052922, 0.9994606, -0.9719985, 1, 1, 1, 1, 1,
0.405686, -0.2690051, 1.363989, 1, 1, 1, 1, 1,
0.4097582, -0.4291733, 1.634131, 1, 1, 1, 1, 1,
0.4100499, 0.5968394, 0.1780213, 1, 1, 1, 1, 1,
0.4213706, 1.86374, -0.6570992, 1, 1, 1, 1, 1,
0.429389, -0.7383471, 4.023424, 1, 1, 1, 1, 1,
0.4302265, 0.8920575, 0.196163, 1, 1, 1, 1, 1,
0.4345669, -1.317329, 1.94297, 1, 1, 1, 1, 1,
0.4390053, -0.1570711, 1.767994, 1, 1, 1, 1, 1,
0.4393714, -1.519391, 2.011416, 1, 1, 1, 1, 1,
0.4402051, 1.837501, 0.6690382, 1, 1, 1, 1, 1,
0.4467997, 0.3304066, -0.3897305, 1, 1, 1, 1, 1,
0.4469821, 0.7978517, -1.014394, 1, 1, 1, 1, 1,
0.4474105, 0.178692, 1.934599, 1, 1, 1, 1, 1,
0.4486863, -0.2413296, 2.347647, 0, 0, 1, 1, 1,
0.4492411, 0.4261828, 0.2738086, 1, 0, 0, 1, 1,
0.4496047, 0.7152332, 0.5649488, 1, 0, 0, 1, 1,
0.4500971, 0.7208754, 2.256603, 1, 0, 0, 1, 1,
0.453687, -0.4095513, 0.5644534, 1, 0, 0, 1, 1,
0.4548885, -0.4727894, 2.045251, 1, 0, 0, 1, 1,
0.456165, 1.098633, 0.03952011, 0, 0, 0, 1, 1,
0.4624098, -0.4867702, 1.626721, 0, 0, 0, 1, 1,
0.4628018, -1.045197, 2.830041, 0, 0, 0, 1, 1,
0.4684594, -1.263353, 3.980702, 0, 0, 0, 1, 1,
0.4689674, -0.0536329, 1.585852, 0, 0, 0, 1, 1,
0.4708808, 0.7737767, -1.162757, 0, 0, 0, 1, 1,
0.4743161, -0.1637872, 2.955771, 0, 0, 0, 1, 1,
0.4753144, -1.256539, 2.958298, 1, 1, 1, 1, 1,
0.4756038, -1.738334, 1.768839, 1, 1, 1, 1, 1,
0.4835868, 1.847803, 3.14929, 1, 1, 1, 1, 1,
0.4874574, -0.1203733, 1.857889, 1, 1, 1, 1, 1,
0.4905294, 0.5176706, 0.2589316, 1, 1, 1, 1, 1,
0.4919397, 0.1120521, 0.8875251, 1, 1, 1, 1, 1,
0.4923116, -1.190448, 2.804303, 1, 1, 1, 1, 1,
0.4939221, -1.506122, 2.565825, 1, 1, 1, 1, 1,
0.4978419, 0.6625828, -0.1239905, 1, 1, 1, 1, 1,
0.4993236, 1.93384, 1.041451, 1, 1, 1, 1, 1,
0.5050811, 0.8015093, 0.5589846, 1, 1, 1, 1, 1,
0.5053636, 0.3563773, -0.3035488, 1, 1, 1, 1, 1,
0.508544, -0.0771633, 3.20064, 1, 1, 1, 1, 1,
0.5093689, 2.062691, 1.100646, 1, 1, 1, 1, 1,
0.5141841, 0.9066074, -0.01914064, 1, 1, 1, 1, 1,
0.5144165, -1.469973, 4.01728, 0, 0, 1, 1, 1,
0.5147913, -0.4665322, 2.74891, 1, 0, 0, 1, 1,
0.5160964, -0.6519536, 3.601708, 1, 0, 0, 1, 1,
0.5161097, 0.4986936, -0.9565004, 1, 0, 0, 1, 1,
0.5179721, 1.064965, -2.023025, 1, 0, 0, 1, 1,
0.5227548, 0.6417496, 2.015812, 1, 0, 0, 1, 1,
0.5279427, 2.048045, -1.042298, 0, 0, 0, 1, 1,
0.5279731, 0.1324944, 1.093658, 0, 0, 0, 1, 1,
0.5295841, 0.6959469, -0.07207413, 0, 0, 0, 1, 1,
0.5320058, 1.339162, 0.166061, 0, 0, 0, 1, 1,
0.532735, 1.016514, -1.180319, 0, 0, 0, 1, 1,
0.5335373, -1.885059, 4.595963, 0, 0, 0, 1, 1,
0.5345732, 0.7481536, 0.6329366, 0, 0, 0, 1, 1,
0.5352198, 0.1965967, 0.1652826, 1, 1, 1, 1, 1,
0.5388649, 1.224139, 0.007158763, 1, 1, 1, 1, 1,
0.5453128, -0.6169389, 1.099272, 1, 1, 1, 1, 1,
0.5517259, -1.015097, 4.100631, 1, 1, 1, 1, 1,
0.5580727, 0.8364204, 0.7996325, 1, 1, 1, 1, 1,
0.5641268, -0.2941245, 1.551875, 1, 1, 1, 1, 1,
0.5656748, -1.554707, 2.39215, 1, 1, 1, 1, 1,
0.5696043, -1.976978, -0.3250178, 1, 1, 1, 1, 1,
0.5704015, -2.578163, 4.236539, 1, 1, 1, 1, 1,
0.5749155, -1.543586, 1.043413, 1, 1, 1, 1, 1,
0.5749443, 0.934555, 1.569942, 1, 1, 1, 1, 1,
0.5830368, -0.6760165, 2.214196, 1, 1, 1, 1, 1,
0.5856841, 0.1347609, 1.744833, 1, 1, 1, 1, 1,
0.5874612, -1.880278, 3.387628, 1, 1, 1, 1, 1,
0.5886629, 0.6642663, 1.643375, 1, 1, 1, 1, 1,
0.5918376, -1.312047, 3.950055, 0, 0, 1, 1, 1,
0.5934591, -0.8338361, 1.846299, 1, 0, 0, 1, 1,
0.5951486, 1.491879, 0.1342286, 1, 0, 0, 1, 1,
0.6069994, -0.6467026, 3.620979, 1, 0, 0, 1, 1,
0.6089294, 0.1058388, 0.5630999, 1, 0, 0, 1, 1,
0.6120643, -1.436507, 4.436062, 1, 0, 0, 1, 1,
0.6129979, -2.106793, 2.132989, 0, 0, 0, 1, 1,
0.6166825, 0.02497127, 2.283874, 0, 0, 0, 1, 1,
0.6236037, -1.3381, 1.519179, 0, 0, 0, 1, 1,
0.6254557, -0.4150353, 0.7640747, 0, 0, 0, 1, 1,
0.6279459, -1.135605, 4.19631, 0, 0, 0, 1, 1,
0.6310973, 0.3172788, 0.354847, 0, 0, 0, 1, 1,
0.6350738, -0.01963141, 2.128564, 0, 0, 0, 1, 1,
0.6359053, 0.03793504, 1.396463, 1, 1, 1, 1, 1,
0.6362484, -0.3270455, 2.456603, 1, 1, 1, 1, 1,
0.6565669, -1.699256, 3.448311, 1, 1, 1, 1, 1,
0.6575228, 0.1263224, 0.9230707, 1, 1, 1, 1, 1,
0.665203, -1.143703, 3.198876, 1, 1, 1, 1, 1,
0.6718433, 1.193343, -0.7688909, 1, 1, 1, 1, 1,
0.6751141, -0.5157372, 1.574032, 1, 1, 1, 1, 1,
0.6819108, 0.1172712, -0.3132192, 1, 1, 1, 1, 1,
0.6841747, 0.2581546, 0.1788016, 1, 1, 1, 1, 1,
0.6862072, 1.143216, -0.6638672, 1, 1, 1, 1, 1,
0.6864704, 0.1466175, 3.032536, 1, 1, 1, 1, 1,
0.6881655, -0.8803003, 2.936935, 1, 1, 1, 1, 1,
0.6958815, 0.2574086, 1.237886, 1, 1, 1, 1, 1,
0.7031219, -0.6723644, 2.411547, 1, 1, 1, 1, 1,
0.7039209, 1.297422, -1.220881, 1, 1, 1, 1, 1,
0.7067798, -0.6270689, 2.553379, 0, 0, 1, 1, 1,
0.7194337, 0.1083429, 0.1467825, 1, 0, 0, 1, 1,
0.7217203, -0.6476038, 2.688371, 1, 0, 0, 1, 1,
0.721905, 0.4177077, 3.026683, 1, 0, 0, 1, 1,
0.7235838, 1.59981, -0.08505397, 1, 0, 0, 1, 1,
0.7241149, 0.2346953, 2.583284, 1, 0, 0, 1, 1,
0.7321501, -0.8601655, 1.623909, 0, 0, 0, 1, 1,
0.7329971, -0.7615505, 2.89683, 0, 0, 0, 1, 1,
0.7338775, 0.214369, 1.347299, 0, 0, 0, 1, 1,
0.7421145, 0.7977726, -1.182244, 0, 0, 0, 1, 1,
0.7441097, 1.367352, 0.1940219, 0, 0, 0, 1, 1,
0.7446703, 0.5328119, 0.9203711, 0, 0, 0, 1, 1,
0.7450836, 0.0489432, 2.06456, 0, 0, 0, 1, 1,
0.7459475, 2.741376, 2.534029, 1, 1, 1, 1, 1,
0.7487901, -0.6916695, 1.568761, 1, 1, 1, 1, 1,
0.7663757, -1.411149, 1.194877, 1, 1, 1, 1, 1,
0.7667286, 0.6178252, 0.2446793, 1, 1, 1, 1, 1,
0.7688099, 0.9422898, -1.139591, 1, 1, 1, 1, 1,
0.7737456, -0.3335507, 3.489439, 1, 1, 1, 1, 1,
0.7758834, 1.311012, -1.926203, 1, 1, 1, 1, 1,
0.77638, -0.05514669, 3.11727, 1, 1, 1, 1, 1,
0.7766863, -0.600731, 2.13104, 1, 1, 1, 1, 1,
0.7775752, -0.1945586, 1.314441, 1, 1, 1, 1, 1,
0.7787235, -0.3803332, 1.223687, 1, 1, 1, 1, 1,
0.7812082, 0.7754337, 1.9444, 1, 1, 1, 1, 1,
0.7815622, -0.4546316, 2.816614, 1, 1, 1, 1, 1,
0.7822418, 1.029032, 1.940549, 1, 1, 1, 1, 1,
0.7883174, -0.5070301, 1.741864, 1, 1, 1, 1, 1,
0.7893264, -1.642362, 4.156191, 0, 0, 1, 1, 1,
0.7902648, 0.2035028, 2.380098, 1, 0, 0, 1, 1,
0.7906126, 0.2665863, 0.3427559, 1, 0, 0, 1, 1,
0.7916312, 0.126693, 1.868786, 1, 0, 0, 1, 1,
0.7982339, -0.1076506, 0.6436341, 1, 0, 0, 1, 1,
0.799226, -0.9275222, 1.586152, 1, 0, 0, 1, 1,
0.800866, -0.6175543, 2.071171, 0, 0, 0, 1, 1,
0.8013516, -0.9729953, 4.141344, 0, 0, 0, 1, 1,
0.8084831, 0.358656, 0.2898071, 0, 0, 0, 1, 1,
0.8098291, -0.3956873, 0.8798712, 0, 0, 0, 1, 1,
0.8110963, -1.237402, 2.420856, 0, 0, 0, 1, 1,
0.8127128, 0.6558689, 0.4597739, 0, 0, 0, 1, 1,
0.8136521, 0.6244122, 2.333752, 0, 0, 0, 1, 1,
0.8222657, -0.09062087, -0.3240259, 1, 1, 1, 1, 1,
0.8308872, -0.1273919, 3.039924, 1, 1, 1, 1, 1,
0.8348752, 2.003839, 0.2082782, 1, 1, 1, 1, 1,
0.8372025, 0.5291527, 2.16569, 1, 1, 1, 1, 1,
0.8426049, -0.3897227, 1.832656, 1, 1, 1, 1, 1,
0.8434752, -0.4471478, 1.010688, 1, 1, 1, 1, 1,
0.8455843, 1.18889, -0.4997748, 1, 1, 1, 1, 1,
0.8462117, -0.9393436, 2.856928, 1, 1, 1, 1, 1,
0.8473981, 0.469943, 1.67045, 1, 1, 1, 1, 1,
0.8498225, -1.896309, 3.210591, 1, 1, 1, 1, 1,
0.8519529, -0.9019207, 1.472347, 1, 1, 1, 1, 1,
0.853579, 1.141391, -0.2258708, 1, 1, 1, 1, 1,
0.8561068, -0.1812675, 2.09439, 1, 1, 1, 1, 1,
0.8575792, -0.858687, -0.1254779, 1, 1, 1, 1, 1,
0.8600895, -0.4887589, 1.084507, 1, 1, 1, 1, 1,
0.8603091, -1.146274, 2.502074, 0, 0, 1, 1, 1,
0.8655388, -2.482338, 1.498382, 1, 0, 0, 1, 1,
0.8661953, 1.051726, -0.5744389, 1, 0, 0, 1, 1,
0.8734936, -1.043763, 2.760463, 1, 0, 0, 1, 1,
0.8850206, -0.2637733, 2.55105, 1, 0, 0, 1, 1,
0.8901222, 0.2886819, 2.041601, 1, 0, 0, 1, 1,
0.893273, -1.137073, 0.9679493, 0, 0, 0, 1, 1,
0.8955821, -0.8881525, 2.670658, 0, 0, 0, 1, 1,
0.8986526, 1.054838, 0.2337779, 0, 0, 0, 1, 1,
0.9011241, -1.839245, 3.502271, 0, 0, 0, 1, 1,
0.9046734, -0.5471067, 1.035997, 0, 0, 0, 1, 1,
0.9070928, -0.09779381, 2.627903, 0, 0, 0, 1, 1,
0.913587, -0.04864345, 2.531767, 0, 0, 0, 1, 1,
0.914258, -0.06697282, 3.456095, 1, 1, 1, 1, 1,
0.9176932, 0.7470607, 1.67471, 1, 1, 1, 1, 1,
0.9178078, 0.2265849, 1.028339, 1, 1, 1, 1, 1,
0.9239452, 0.9700424, 1.691776, 1, 1, 1, 1, 1,
0.9258278, 0.9884725, 0.9943998, 1, 1, 1, 1, 1,
0.9289989, -1.294802, 2.497019, 1, 1, 1, 1, 1,
0.9312113, 1.036228, 1.877514, 1, 1, 1, 1, 1,
0.9361355, -0.9661189, 2.19874, 1, 1, 1, 1, 1,
0.9385628, 0.198561, 1.087092, 1, 1, 1, 1, 1,
0.9439197, -0.140837, 1.661025, 1, 1, 1, 1, 1,
0.9465584, 0.4954694, 1.975523, 1, 1, 1, 1, 1,
0.9496141, 0.4600829, 1.501555, 1, 1, 1, 1, 1,
0.9576621, 3.179176, -0.4043892, 1, 1, 1, 1, 1,
0.9583269, 1.075863, 2.112078, 1, 1, 1, 1, 1,
0.960588, -0.6415913, 3.869734, 1, 1, 1, 1, 1,
0.9700506, -0.7996564, 1.016633, 0, 0, 1, 1, 1,
0.9703639, 0.5262831, 1.148925, 1, 0, 0, 1, 1,
0.9751579, 0.004573676, 1.296001, 1, 0, 0, 1, 1,
0.9782542, 0.8787433, 1.703695, 1, 0, 0, 1, 1,
0.9801317, 0.9266673, 1.674908, 1, 0, 0, 1, 1,
0.986392, -1.224901, 1.485763, 1, 0, 0, 1, 1,
0.9969527, 1.933754, 0.8035977, 0, 0, 0, 1, 1,
0.9981243, -1.177995, 3.240713, 0, 0, 0, 1, 1,
1.005058, 0.6247799, 1.326341, 0, 0, 0, 1, 1,
1.02092, 1.36489, -0.7461652, 0, 0, 0, 1, 1,
1.020929, 1.296203, -0.8898181, 0, 0, 0, 1, 1,
1.024331, 0.9766633, 1.323264, 0, 0, 0, 1, 1,
1.028179, 1.978697, -0.1596002, 0, 0, 0, 1, 1,
1.035546, 1.578529, -0.03845726, 1, 1, 1, 1, 1,
1.038934, -0.5055214, 4.014239, 1, 1, 1, 1, 1,
1.039073, 0.3147933, 0.652298, 1, 1, 1, 1, 1,
1.042151, 1.068318, 0.7870241, 1, 1, 1, 1, 1,
1.060145, 0.2413536, 1.773741, 1, 1, 1, 1, 1,
1.063274, -0.6744878, 1.961925, 1, 1, 1, 1, 1,
1.063394, 0.5326851, 1.581371, 1, 1, 1, 1, 1,
1.068262, 0.565314, -0.2047431, 1, 1, 1, 1, 1,
1.077505, 0.1487232, 1.606027, 1, 1, 1, 1, 1,
1.080995, 1.125533, 1.185422, 1, 1, 1, 1, 1,
1.083093, 0.08390293, 1.726427, 1, 1, 1, 1, 1,
1.084619, 1.155124, 0.707868, 1, 1, 1, 1, 1,
1.106905, -0.6625269, 2.352895, 1, 1, 1, 1, 1,
1.108115, -0.7616454, 1.298383, 1, 1, 1, 1, 1,
1.115125, -0.1678426, 0.9728516, 1, 1, 1, 1, 1,
1.116719, -1.446942, 3.283298, 0, 0, 1, 1, 1,
1.124933, -0.06312005, 1.378109, 1, 0, 0, 1, 1,
1.127622, -0.2112132, 0.6687647, 1, 0, 0, 1, 1,
1.132901, 1.301156, -0.8812804, 1, 0, 0, 1, 1,
1.136082, 0.2897952, 0.8748317, 1, 0, 0, 1, 1,
1.146433, 1.813335, 1.01083, 1, 0, 0, 1, 1,
1.148035, 0.4988013, 0.6476369, 0, 0, 0, 1, 1,
1.159112, 0.7183362, 0.3464968, 0, 0, 0, 1, 1,
1.16054, -0.6445563, 1.167184, 0, 0, 0, 1, 1,
1.161272, -0.836468, 2.722971, 0, 0, 0, 1, 1,
1.167285, -0.3735268, 1.454293, 0, 0, 0, 1, 1,
1.172367, -2.124347, 3.068975, 0, 0, 0, 1, 1,
1.178037, -0.945507, 2.263608, 0, 0, 0, 1, 1,
1.184558, -0.1721412, 0.5422322, 1, 1, 1, 1, 1,
1.188086, -1.579079, 1.758829, 1, 1, 1, 1, 1,
1.197728, 0.3190388, 1.529936, 1, 1, 1, 1, 1,
1.199082, -0.1934592, 2.073244, 1, 1, 1, 1, 1,
1.2019, 0.2507772, 1.725083, 1, 1, 1, 1, 1,
1.212479, -0.3108663, 0.5720206, 1, 1, 1, 1, 1,
1.212651, -0.3635933, 2.965629, 1, 1, 1, 1, 1,
1.215387, -2.089665, 2.089925, 1, 1, 1, 1, 1,
1.215951, -0.2795985, 3.328231, 1, 1, 1, 1, 1,
1.232832, 0.0009625088, 0.7087054, 1, 1, 1, 1, 1,
1.2336, 0.6239042, 1.369295, 1, 1, 1, 1, 1,
1.235034, 0.5827247, 0.703679, 1, 1, 1, 1, 1,
1.235691, 2.213384, 1.288323, 1, 1, 1, 1, 1,
1.237521, -0.3828461, 0.702725, 1, 1, 1, 1, 1,
1.237549, -1.377445, 2.835761, 1, 1, 1, 1, 1,
1.23914, -0.2980702, 2.022916, 0, 0, 1, 1, 1,
1.245325, 0.7088619, 1.416471, 1, 0, 0, 1, 1,
1.250336, 1.188481, 2.162123, 1, 0, 0, 1, 1,
1.25602, -0.4928113, 2.608878, 1, 0, 0, 1, 1,
1.257915, -1.127534, 3.118981, 1, 0, 0, 1, 1,
1.265815, -1.221671, 4.348426, 1, 0, 0, 1, 1,
1.268833, -0.2523583, 1.839262, 0, 0, 0, 1, 1,
1.270319, -0.3603023, 0.1449129, 0, 0, 0, 1, 1,
1.277205, -0.05119157, 3.124352, 0, 0, 0, 1, 1,
1.278092, 0.6051174, 0.8449886, 0, 0, 0, 1, 1,
1.278805, -0.3847434, 1.559594, 0, 0, 0, 1, 1,
1.280992, 0.889488, 0.8015557, 0, 0, 0, 1, 1,
1.293256, 1.539978, -0.9137062, 0, 0, 0, 1, 1,
1.296556, -0.4165707, 2.648808, 1, 1, 1, 1, 1,
1.296896, -0.04092906, 1.342825, 1, 1, 1, 1, 1,
1.311478, 0.2580536, 0.9583228, 1, 1, 1, 1, 1,
1.311752, 0.8071746, 0.1930461, 1, 1, 1, 1, 1,
1.343808, -0.6922562, 2.192669, 1, 1, 1, 1, 1,
1.346953, 0.6295659, 2.821693, 1, 1, 1, 1, 1,
1.350645, -0.6443152, 2.253757, 1, 1, 1, 1, 1,
1.357173, 0.4630812, 1.552884, 1, 1, 1, 1, 1,
1.365069, -0.3640316, 2.032935, 1, 1, 1, 1, 1,
1.371123, -0.1734035, -0.2482638, 1, 1, 1, 1, 1,
1.371786, 0.5514396, 1.529611, 1, 1, 1, 1, 1,
1.373495, 2.333565, 0.3672558, 1, 1, 1, 1, 1,
1.382409, 0.3656236, 1.390155, 1, 1, 1, 1, 1,
1.383647, -0.1584433, 1.325695, 1, 1, 1, 1, 1,
1.422341, 1.483534, 0.8629983, 1, 1, 1, 1, 1,
1.424965, -0.6275007, 2.468572, 0, 0, 1, 1, 1,
1.438841, 0.398133, 1.413934, 1, 0, 0, 1, 1,
1.441846, -0.4945103, 1.27479, 1, 0, 0, 1, 1,
1.444916, -0.4882317, 2.067626, 1, 0, 0, 1, 1,
1.450006, 0.1845544, 1.341379, 1, 0, 0, 1, 1,
1.45118, -0.6139894, 3.495969, 1, 0, 0, 1, 1,
1.456824, -0.4127414, 1.263344, 0, 0, 0, 1, 1,
1.46147, 1.083378, -1.095776, 0, 0, 0, 1, 1,
1.47521, -0.6880493, 3.016853, 0, 0, 0, 1, 1,
1.47781, 0.4932641, 0.5614129, 0, 0, 0, 1, 1,
1.478613, 0.2460398, 2.766855, 0, 0, 0, 1, 1,
1.481024, -0.03592388, 1.373273, 0, 0, 0, 1, 1,
1.491949, -2.403245, 3.947434, 0, 0, 0, 1, 1,
1.504168, -0.1611005, 0.800848, 1, 1, 1, 1, 1,
1.507204, -0.7298091, 0.5599443, 1, 1, 1, 1, 1,
1.511133, 1.030176, 0.1446344, 1, 1, 1, 1, 1,
1.530071, 0.2621172, 0.2679015, 1, 1, 1, 1, 1,
1.534314, -0.1374616, 1.229599, 1, 1, 1, 1, 1,
1.536354, -0.2456101, 1.51507, 1, 1, 1, 1, 1,
1.538038, 0.2752625, 0.9420139, 1, 1, 1, 1, 1,
1.538644, 0.2841206, -0.5455009, 1, 1, 1, 1, 1,
1.540179, -0.8129518, 1.295094, 1, 1, 1, 1, 1,
1.541063, -0.2457153, 2.763271, 1, 1, 1, 1, 1,
1.578523, -2.078001, 0.5037807, 1, 1, 1, 1, 1,
1.582028, -0.1282794, 2.367898, 1, 1, 1, 1, 1,
1.586041, -0.6258832, -1.138724, 1, 1, 1, 1, 1,
1.588232, 0.4778958, 0.8642164, 1, 1, 1, 1, 1,
1.593622, 0.5503581, 0.4017893, 1, 1, 1, 1, 1,
1.593715, -0.03211244, 1.005002, 0, 0, 1, 1, 1,
1.61036, -0.3340203, 0.7295917, 1, 0, 0, 1, 1,
1.61048, -0.5496495, 1.325344, 1, 0, 0, 1, 1,
1.618339, 0.457529, 0.7234813, 1, 0, 0, 1, 1,
1.620548, -1.561649, 1.411165, 1, 0, 0, 1, 1,
1.6271, 0.1768401, 0.02732855, 1, 0, 0, 1, 1,
1.650342, 1.114331, -0.1851782, 0, 0, 0, 1, 1,
1.652387, -0.25183, 3.190591, 0, 0, 0, 1, 1,
1.677332, -1.723011, 4.387513, 0, 0, 0, 1, 1,
1.678485, 0.1747522, 2.448327, 0, 0, 0, 1, 1,
1.689221, 0.1477945, 1.402376, 0, 0, 0, 1, 1,
1.699403, 0.7646508, 1.737898, 0, 0, 0, 1, 1,
1.706004, -0.008082374, 1.169398, 0, 0, 0, 1, 1,
1.722017, 1.42722, 0.7939824, 1, 1, 1, 1, 1,
1.746567, 0.5691444, 0.9550024, 1, 1, 1, 1, 1,
1.779094, -0.9273081, 0.9462739, 1, 1, 1, 1, 1,
1.801102, 1.703442, 1.672452, 1, 1, 1, 1, 1,
1.816048, 1.104814, 1.15025, 1, 1, 1, 1, 1,
1.849373, -1.825282, 1.551064, 1, 1, 1, 1, 1,
1.863624, -0.5633751, 2.697144, 1, 1, 1, 1, 1,
1.866274, -0.3716162, 1.946782, 1, 1, 1, 1, 1,
1.868179, -1.70997, 2.717839, 1, 1, 1, 1, 1,
1.872354, 0.7117065, 0.9798926, 1, 1, 1, 1, 1,
1.877982, 0.1397025, 1.226473, 1, 1, 1, 1, 1,
1.892612, 0.2918399, 1.485655, 1, 1, 1, 1, 1,
1.898103, 1.569271, 0.8599734, 1, 1, 1, 1, 1,
1.902069, 0.7184426, 1.55386, 1, 1, 1, 1, 1,
1.928712, -0.4782529, 1.267949, 1, 1, 1, 1, 1,
1.956569, 0.2510369, 2.881968, 0, 0, 1, 1, 1,
1.966925, 1.686682, 1.527704, 1, 0, 0, 1, 1,
1.999388, 0.2472691, 3.347453, 1, 0, 0, 1, 1,
2.045886, 0.8220514, 2.345461, 1, 0, 0, 1, 1,
2.060668, 1.330103, 0.1900073, 1, 0, 0, 1, 1,
2.065834, -1.892096, 2.924072, 1, 0, 0, 1, 1,
2.20208, -0.5659742, 1.210687, 0, 0, 0, 1, 1,
2.310451, 0.342818, 1.630424, 0, 0, 0, 1, 1,
2.316719, -0.499934, 0.958961, 0, 0, 0, 1, 1,
2.34625, 0.9552558, 1.117772, 0, 0, 0, 1, 1,
2.367685, 0.5390011, 3.986759, 0, 0, 0, 1, 1,
2.39482, -0.8798151, 1.707707, 0, 0, 0, 1, 1,
2.41164, 0.9421207, 1.340646, 0, 0, 0, 1, 1,
2.412626, -0.7789029, 1.328294, 1, 1, 1, 1, 1,
2.475934, 0.5370625, 1.124899, 1, 1, 1, 1, 1,
2.715745, -1.312483, 0.6069258, 1, 1, 1, 1, 1,
2.755431, 1.854294, 1.839307, 1, 1, 1, 1, 1,
2.768612, -0.7354702, 1.889971, 1, 1, 1, 1, 1,
2.781665, -0.2965141, 1.255983, 1, 1, 1, 1, 1,
2.868366, 0.1042977, 0.08178363, 1, 1, 1, 1, 1
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
var radius = 9.751394;
var distance = 34.25136;
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
mvMatrix.translate( 0.2838284, 0.4961085, -0.1293492 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.25136);
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