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
-3.504894, 0.7443243, -1.99597, 1, 0, 0, 1,
-3.174093, -0.455858, -0.4965911, 1, 0.007843138, 0, 1,
-2.956387, -0.1927544, -2.550671, 1, 0.01176471, 0, 1,
-2.861943, -0.5846611, -2.205112, 1, 0.01960784, 0, 1,
-2.671, -1.791541, 0.5540605, 1, 0.02352941, 0, 1,
-2.66291, -1.173605, -3.198162, 1, 0.03137255, 0, 1,
-2.588115, -2.050879, -2.49244, 1, 0.03529412, 0, 1,
-2.555635, -1.223717, -0.2212397, 1, 0.04313726, 0, 1,
-2.527465, 0.8659615, -1.378436, 1, 0.04705882, 0, 1,
-2.515101, 0.7564372, -2.298784, 1, 0.05490196, 0, 1,
-2.513888, -1.325385, -2.472574, 1, 0.05882353, 0, 1,
-2.463019, -0.2397422, -3.036393, 1, 0.06666667, 0, 1,
-2.421766, -0.8546209, -3.062406, 1, 0.07058824, 0, 1,
-2.407339, -0.2051409, -2.22998, 1, 0.07843138, 0, 1,
-2.392042, 0.4432628, -1.493982, 1, 0.08235294, 0, 1,
-2.339957, 1.462992, -1.214535, 1, 0.09019608, 0, 1,
-2.2809, -0.7752511, -1.379416, 1, 0.09411765, 0, 1,
-2.273539, 1.004356, -0.5391662, 1, 0.1019608, 0, 1,
-2.269618, 0.6288473, -0.3114369, 1, 0.1098039, 0, 1,
-2.215394, 0.5339025, -1.825951, 1, 0.1137255, 0, 1,
-2.212737, 0.6444134, -1.35014, 1, 0.1215686, 0, 1,
-2.122424, -0.517454, -1.250669, 1, 0.1254902, 0, 1,
-2.00609, 1.282617, -0.1142552, 1, 0.1333333, 0, 1,
-2.003708, -0.1074092, -3.104119, 1, 0.1372549, 0, 1,
-1.993548, 0.3337013, -2.687124, 1, 0.145098, 0, 1,
-1.972745, -0.3399226, -2.281291, 1, 0.1490196, 0, 1,
-1.960918, 2.49444, 0.09290373, 1, 0.1568628, 0, 1,
-1.956734, 0.7896574, -0.2580593, 1, 0.1607843, 0, 1,
-1.935197, -1.693878, -1.601106, 1, 0.1686275, 0, 1,
-1.927516, 0.4326557, -1.311008, 1, 0.172549, 0, 1,
-1.923002, 0.09295745, -1.390399, 1, 0.1803922, 0, 1,
-1.917634, 1.247143, -2.041354, 1, 0.1843137, 0, 1,
-1.907738, -0.7493784, -1.116349, 1, 0.1921569, 0, 1,
-1.879362, 1.937662, -0.7937262, 1, 0.1960784, 0, 1,
-1.860344, -0.967494, -2.415248, 1, 0.2039216, 0, 1,
-1.836756, -0.6171356, -2.083244, 1, 0.2117647, 0, 1,
-1.810118, -0.7419468, -2.501285, 1, 0.2156863, 0, 1,
-1.776978, -0.35956, -1.173656, 1, 0.2235294, 0, 1,
-1.771926, -0.04981119, -2.458137, 1, 0.227451, 0, 1,
-1.764526, 0.4173587, -0.3650841, 1, 0.2352941, 0, 1,
-1.763923, 0.9239234, -0.7527009, 1, 0.2392157, 0, 1,
-1.763116, -1.892605, -2.073739, 1, 0.2470588, 0, 1,
-1.736689, 0.1725566, -0.3865137, 1, 0.2509804, 0, 1,
-1.682025, -0.4031731, -0.4428995, 1, 0.2588235, 0, 1,
-1.667701, 0.01613699, -1.978698, 1, 0.2627451, 0, 1,
-1.65746, 1.460603, 0.1395708, 1, 0.2705882, 0, 1,
-1.642774, 0.2420503, -2.699907, 1, 0.2745098, 0, 1,
-1.638287, -2.497513, -2.284811, 1, 0.282353, 0, 1,
-1.63551, 0.1166824, -2.811821, 1, 0.2862745, 0, 1,
-1.625813, 0.6987161, 0.00947516, 1, 0.2941177, 0, 1,
-1.603839, -0.2175778, -1.885851, 1, 0.3019608, 0, 1,
-1.574023, -0.6513025, -1.708033, 1, 0.3058824, 0, 1,
-1.569297, 3.242147, -1.364005, 1, 0.3137255, 0, 1,
-1.528106, 1.853092, -0.9201019, 1, 0.3176471, 0, 1,
-1.520739, 0.6072681, -0.8073235, 1, 0.3254902, 0, 1,
-1.518544, 0.9019993, -0.5926152, 1, 0.3294118, 0, 1,
-1.508822, -0.173255, -0.6397852, 1, 0.3372549, 0, 1,
-1.496008, 0.4258935, -0.8939305, 1, 0.3411765, 0, 1,
-1.478349, 0.6735329, -2.303058, 1, 0.3490196, 0, 1,
-1.466081, -0.6744246, -3.044226, 1, 0.3529412, 0, 1,
-1.461174, 0.1905883, -1.078693, 1, 0.3607843, 0, 1,
-1.446971, 0.3030306, -0.6422377, 1, 0.3647059, 0, 1,
-1.442136, 0.1794047, -2.206558, 1, 0.372549, 0, 1,
-1.429406, -1.187112, -3.349999, 1, 0.3764706, 0, 1,
-1.422945, -1.858393, -3.686002, 1, 0.3843137, 0, 1,
-1.422209, -1.281054, -1.407226, 1, 0.3882353, 0, 1,
-1.393336, -0.2710846, -1.670487, 1, 0.3960784, 0, 1,
-1.389909, -0.4488498, -2.161994, 1, 0.4039216, 0, 1,
-1.388762, -1.174736, -1.39362, 1, 0.4078431, 0, 1,
-1.387532, 0.03211276, -2.953899, 1, 0.4156863, 0, 1,
-1.37425, 0.1320341, -1.300407, 1, 0.4196078, 0, 1,
-1.369429, 1.447885, -1.970041, 1, 0.427451, 0, 1,
-1.368675, 1.059604, -0.5418459, 1, 0.4313726, 0, 1,
-1.362076, 0.7159398, -1.198336, 1, 0.4392157, 0, 1,
-1.358581, -0.04759037, -2.431734, 1, 0.4431373, 0, 1,
-1.3462, 0.2847092, -1.638261, 1, 0.4509804, 0, 1,
-1.345165, 0.4428343, -0.04106638, 1, 0.454902, 0, 1,
-1.338947, -1.582954, -2.314053, 1, 0.4627451, 0, 1,
-1.336216, 0.2842829, -1.867645, 1, 0.4666667, 0, 1,
-1.332502, 0.4459011, -0.1248749, 1, 0.4745098, 0, 1,
-1.327618, -1.372832, -1.499769, 1, 0.4784314, 0, 1,
-1.322604, 1.224258, -0.5253725, 1, 0.4862745, 0, 1,
-1.297771, -0.4154062, -2.713346, 1, 0.4901961, 0, 1,
-1.287094, -1.03116, -2.327644, 1, 0.4980392, 0, 1,
-1.286107, 1.675519, -0.1410879, 1, 0.5058824, 0, 1,
-1.280546, -0.4173817, -2.780043, 1, 0.509804, 0, 1,
-1.279524, 1.051998, 0.6131595, 1, 0.5176471, 0, 1,
-1.273318, -1.509511, -0.3826101, 1, 0.5215687, 0, 1,
-1.271989, -0.3042709, -2.513932, 1, 0.5294118, 0, 1,
-1.269722, -1.322555, -3.989694, 1, 0.5333334, 0, 1,
-1.267842, -0.2692845, -0.7920319, 1, 0.5411765, 0, 1,
-1.264373, 1.102567, -2.181522, 1, 0.5450981, 0, 1,
-1.262709, 1.321511, -0.06820417, 1, 0.5529412, 0, 1,
-1.262409, -1.223433, -4.663746, 1, 0.5568628, 0, 1,
-1.259563, 1.209088, -0.4541346, 1, 0.5647059, 0, 1,
-1.251653, 2.216625, 1.774502, 1, 0.5686275, 0, 1,
-1.232485, -3.435219, -3.036139, 1, 0.5764706, 0, 1,
-1.231499, 0.1276377, -0.1339069, 1, 0.5803922, 0, 1,
-1.230361, -0.07061058, -2.464359, 1, 0.5882353, 0, 1,
-1.225978, -0.3372337, -1.413315, 1, 0.5921569, 0, 1,
-1.225522, 0.3272969, 0.228377, 1, 0.6, 0, 1,
-1.217121, 2.612992, 0.3370927, 1, 0.6078432, 0, 1,
-1.214743, -0.3752715, -2.226997, 1, 0.6117647, 0, 1,
-1.214742, 1.665842, 0.3007977, 1, 0.6196079, 0, 1,
-1.209852, 1.128157, -1.132969, 1, 0.6235294, 0, 1,
-1.206334, -0.785007, -1.213977, 1, 0.6313726, 0, 1,
-1.205888, 0.8511047, -1.759367, 1, 0.6352941, 0, 1,
-1.204994, 0.5619962, 0.296308, 1, 0.6431373, 0, 1,
-1.200529, 0.8896981, -0.6609818, 1, 0.6470588, 0, 1,
-1.193596, -0.998413, -3.459177, 1, 0.654902, 0, 1,
-1.189438, -1.361173, -1.481389, 1, 0.6588235, 0, 1,
-1.169757, 0.9662223, 1.198987, 1, 0.6666667, 0, 1,
-1.162481, 0.1226442, -1.94988, 1, 0.6705883, 0, 1,
-1.162276, -0.04350321, -1.995139, 1, 0.6784314, 0, 1,
-1.160915, -1.096909, -2.221611, 1, 0.682353, 0, 1,
-1.159503, -0.06935884, -2.525023, 1, 0.6901961, 0, 1,
-1.156807, -0.4502419, -0.5038735, 1, 0.6941177, 0, 1,
-1.15667, -0.7665454, -1.240773, 1, 0.7019608, 0, 1,
-1.152518, 0.8978992, -1.934521, 1, 0.7098039, 0, 1,
-1.149512, 0.6445146, -1.554091, 1, 0.7137255, 0, 1,
-1.144211, -0.5178791, -1.266566, 1, 0.7215686, 0, 1,
-1.142506, 0.04389178, -0.3914754, 1, 0.7254902, 0, 1,
-1.138589, 0.5993716, -0.6090645, 1, 0.7333333, 0, 1,
-1.138503, -0.1595537, 0.07176193, 1, 0.7372549, 0, 1,
-1.128559, 0.2546132, -1.65883, 1, 0.7450981, 0, 1,
-1.126328, -1.797628, -2.30178, 1, 0.7490196, 0, 1,
-1.124223, -1.147121, -1.245559, 1, 0.7568628, 0, 1,
-1.113144, -0.9262797, -3.474113, 1, 0.7607843, 0, 1,
-1.112927, -2.234006, -3.327852, 1, 0.7686275, 0, 1,
-1.108969, 0.3898793, -2.956891, 1, 0.772549, 0, 1,
-1.101429, 0.1699807, 0.2478604, 1, 0.7803922, 0, 1,
-1.08799, 0.9756176, -0.5435734, 1, 0.7843137, 0, 1,
-1.087609, -0.2927676, -1.714949, 1, 0.7921569, 0, 1,
-1.084607, 0.3287638, -0.2878219, 1, 0.7960784, 0, 1,
-1.080482, 0.8117051, -0.8716671, 1, 0.8039216, 0, 1,
-1.077487, 0.3672756, 0.09992466, 1, 0.8117647, 0, 1,
-1.076543, 0.5405283, -0.6025407, 1, 0.8156863, 0, 1,
-1.064201, -1.878288, -3.066837, 1, 0.8235294, 0, 1,
-1.058151, 2.481582, 1.119762, 1, 0.827451, 0, 1,
-1.057899, -0.003583542, -2.099775, 1, 0.8352941, 0, 1,
-1.057046, -1.426886, -4.56872, 1, 0.8392157, 0, 1,
-1.055687, 0.09278063, -0.7685661, 1, 0.8470588, 0, 1,
-1.054281, 0.4957751, -0.7551, 1, 0.8509804, 0, 1,
-1.050232, 1.062051, 0.9782121, 1, 0.8588235, 0, 1,
-1.043448, 1.299699, -0.9622577, 1, 0.8627451, 0, 1,
-1.041588, 0.6623585, -2.09632, 1, 0.8705882, 0, 1,
-1.041215, -0.09774336, -1.923082, 1, 0.8745098, 0, 1,
-1.040939, 0.3927465, -0.5032403, 1, 0.8823529, 0, 1,
-1.034663, -0.8291665, -2.504018, 1, 0.8862745, 0, 1,
-1.029597, 0.1615683, -2.236348, 1, 0.8941177, 0, 1,
-1.026653, -1.580061, -1.758596, 1, 0.8980392, 0, 1,
-1.025255, -0.2140669, -2.458584, 1, 0.9058824, 0, 1,
-1.024219, -0.8567182, -2.233137, 1, 0.9137255, 0, 1,
-1.023383, -1.131485, -3.55996, 1, 0.9176471, 0, 1,
-1.01844, 1.903767, -0.06356235, 1, 0.9254902, 0, 1,
-1.017926, 1.24601, -0.6062119, 1, 0.9294118, 0, 1,
-1.013548, -0.2919329, -3.773062, 1, 0.9372549, 0, 1,
-1.01279, -1.078141, -0.6590647, 1, 0.9411765, 0, 1,
-1.012769, -1.28793, -2.22975, 1, 0.9490196, 0, 1,
-1.007965, 1.263326, -0.3908028, 1, 0.9529412, 0, 1,
-1.005566, 0.56964, 0.1578397, 1, 0.9607843, 0, 1,
-1.004615, -0.2400942, -0.254825, 1, 0.9647059, 0, 1,
-0.9934157, 0.1380401, -1.685117, 1, 0.972549, 0, 1,
-0.9929428, -0.6883844, -1.498968, 1, 0.9764706, 0, 1,
-0.9916291, 0.1448883, -0.4948756, 1, 0.9843137, 0, 1,
-0.9869148, -0.6158743, -0.3927088, 1, 0.9882353, 0, 1,
-0.9862722, 0.8297729, -0.7129593, 1, 0.9960784, 0, 1,
-0.9747751, -1.364208, -2.844234, 0.9960784, 1, 0, 1,
-0.9718747, -0.335198, -2.892126, 0.9921569, 1, 0, 1,
-0.9572036, -2.431009, -1.908599, 0.9843137, 1, 0, 1,
-0.9563308, 0.4160318, -1.305174, 0.9803922, 1, 0, 1,
-0.950686, -0.9410357, -2.313088, 0.972549, 1, 0, 1,
-0.9492098, 0.650921, 0.728458, 0.9686275, 1, 0, 1,
-0.9477692, 1.795981, 1.711051, 0.9607843, 1, 0, 1,
-0.9471023, 0.05575502, -1.330706, 0.9568627, 1, 0, 1,
-0.9372686, -1.488514, -1.689879, 0.9490196, 1, 0, 1,
-0.9323383, 0.08212735, -1.270269, 0.945098, 1, 0, 1,
-0.9303591, 0.5014343, -0.8489339, 0.9372549, 1, 0, 1,
-0.9299421, 0.4773261, -0.949258, 0.9333333, 1, 0, 1,
-0.9271383, -0.8311849, -2.106219, 0.9254902, 1, 0, 1,
-0.9236971, -1.033108, -4.306207, 0.9215686, 1, 0, 1,
-0.9187604, -2.091851, -1.909345, 0.9137255, 1, 0, 1,
-0.9138498, 0.144348, -2.188147, 0.9098039, 1, 0, 1,
-0.9124386, -0.8821841, -1.840748, 0.9019608, 1, 0, 1,
-0.9107615, -0.7939115, -1.600594, 0.8941177, 1, 0, 1,
-0.9011537, 2.034022, -0.02080757, 0.8901961, 1, 0, 1,
-0.8996969, 0.586997, -1.253531, 0.8823529, 1, 0, 1,
-0.8951397, 1.560072, -1.040789, 0.8784314, 1, 0, 1,
-0.8925152, 0.5663287, -0.1190554, 0.8705882, 1, 0, 1,
-0.8742785, 0.7242471, -0.7011243, 0.8666667, 1, 0, 1,
-0.8673868, 0.6241092, 0.9640182, 0.8588235, 1, 0, 1,
-0.8633415, -0.6908172, -1.015331, 0.854902, 1, 0, 1,
-0.8547296, 0.9423671, -1.790298, 0.8470588, 1, 0, 1,
-0.8538132, 0.8336519, -0.3878446, 0.8431373, 1, 0, 1,
-0.8534349, -0.2782306, -1.376469, 0.8352941, 1, 0, 1,
-0.8513301, 0.594703, -0.4380898, 0.8313726, 1, 0, 1,
-0.8462499, 0.184958, -1.766844, 0.8235294, 1, 0, 1,
-0.843276, 0.2254958, -2.539346, 0.8196079, 1, 0, 1,
-0.8362882, -1.378471, -2.141952, 0.8117647, 1, 0, 1,
-0.8300768, -0.1722737, -3.437181, 0.8078431, 1, 0, 1,
-0.8299001, -0.1062705, -2.566501, 0.8, 1, 0, 1,
-0.825824, 0.8933305, 0.7575791, 0.7921569, 1, 0, 1,
-0.8253406, -0.727029, -2.054132, 0.7882353, 1, 0, 1,
-0.8189867, -0.6250982, -1.646019, 0.7803922, 1, 0, 1,
-0.8182138, 0.2064827, -0.2958844, 0.7764706, 1, 0, 1,
-0.8152089, 0.6391978, -2.952475, 0.7686275, 1, 0, 1,
-0.8059565, 1.173064, -1.298344, 0.7647059, 1, 0, 1,
-0.8014402, -1.699252, -4.136574, 0.7568628, 1, 0, 1,
-0.7936869, 0.4899718, -1.262879, 0.7529412, 1, 0, 1,
-0.7924094, 1.279534, 0.8469265, 0.7450981, 1, 0, 1,
-0.7897828, 2.280509, -1.476921, 0.7411765, 1, 0, 1,
-0.7894908, -2.450375, -3.127169, 0.7333333, 1, 0, 1,
-0.7846161, 0.1280767, -2.185895, 0.7294118, 1, 0, 1,
-0.7844689, -1.151019, -1.225994, 0.7215686, 1, 0, 1,
-0.7822421, 0.3175669, -1.258133, 0.7176471, 1, 0, 1,
-0.775776, -0.4980326, -2.195994, 0.7098039, 1, 0, 1,
-0.7751907, 0.7680171, -1.171904, 0.7058824, 1, 0, 1,
-0.7717364, -1.180133, -1.752149, 0.6980392, 1, 0, 1,
-0.770955, 0.148799, -0.4400882, 0.6901961, 1, 0, 1,
-0.7697546, 0.2268284, -0.7841616, 0.6862745, 1, 0, 1,
-0.7673684, 0.2850488, -3.035891, 0.6784314, 1, 0, 1,
-0.7665125, -2.190835, -3.672154, 0.6745098, 1, 0, 1,
-0.7659598, 1.717009, -1.213738, 0.6666667, 1, 0, 1,
-0.7649296, -0.2286531, -2.350238, 0.6627451, 1, 0, 1,
-0.7589141, -0.382756, -1.145967, 0.654902, 1, 0, 1,
-0.7474184, 1.530185, 0.1159478, 0.6509804, 1, 0, 1,
-0.7402182, 1.366678, 0.4455561, 0.6431373, 1, 0, 1,
-0.73689, 1.219615, 0.701932, 0.6392157, 1, 0, 1,
-0.7321477, 0.477017, -0.2866473, 0.6313726, 1, 0, 1,
-0.7300991, -1.138929, -3.219056, 0.627451, 1, 0, 1,
-0.7256345, -0.04606638, -1.065838, 0.6196079, 1, 0, 1,
-0.7251464, 0.7414367, -1.074351, 0.6156863, 1, 0, 1,
-0.7244557, -0.6318966, -1.028637, 0.6078432, 1, 0, 1,
-0.7215827, -1.448374, -2.127659, 0.6039216, 1, 0, 1,
-0.7199275, 0.02541392, -1.33064, 0.5960785, 1, 0, 1,
-0.7155318, -0.9482602, -2.0315, 0.5882353, 1, 0, 1,
-0.7106518, 0.6662175, -1.791687, 0.5843138, 1, 0, 1,
-0.7074031, -1.250349, -3.05036, 0.5764706, 1, 0, 1,
-0.7016301, 1.592427, -0.4309869, 0.572549, 1, 0, 1,
-0.6827604, -0.4679371, -0.5959987, 0.5647059, 1, 0, 1,
-0.6757649, 0.2322679, -0.882786, 0.5607843, 1, 0, 1,
-0.6747088, 0.5022697, -1.413532, 0.5529412, 1, 0, 1,
-0.6716772, -0.3998542, -2.758605, 0.5490196, 1, 0, 1,
-0.6703745, 0.6555508, -0.6973253, 0.5411765, 1, 0, 1,
-0.6678683, 1.655064, 1.259461, 0.5372549, 1, 0, 1,
-0.6666316, 0.6695958, -1.520884, 0.5294118, 1, 0, 1,
-0.6595581, -0.9940767, -1.680292, 0.5254902, 1, 0, 1,
-0.6589184, -1.462564, -2.432574, 0.5176471, 1, 0, 1,
-0.6584069, -0.2314923, -3.48151, 0.5137255, 1, 0, 1,
-0.6559874, -1.151577, -1.58208, 0.5058824, 1, 0, 1,
-0.6458042, 0.1927267, 0.6104012, 0.5019608, 1, 0, 1,
-0.645659, 0.8734465, -0.7716174, 0.4941176, 1, 0, 1,
-0.645101, 0.1850534, -0.6200367, 0.4862745, 1, 0, 1,
-0.6424181, 0.245931, 0.5067248, 0.4823529, 1, 0, 1,
-0.6395466, -1.493786, -1.738184, 0.4745098, 1, 0, 1,
-0.6383564, -2.623724, -4.002212, 0.4705882, 1, 0, 1,
-0.6332543, 0.6830186, 0.8566266, 0.4627451, 1, 0, 1,
-0.6278996, 0.007640773, -0.9329737, 0.4588235, 1, 0, 1,
-0.6267638, 0.2215323, -1.64895, 0.4509804, 1, 0, 1,
-0.6252359, -1.314535, -2.921821, 0.4470588, 1, 0, 1,
-0.6233563, 0.8709435, -0.7941128, 0.4392157, 1, 0, 1,
-0.6193824, -0.5976607, -1.201318, 0.4352941, 1, 0, 1,
-0.6152221, -0.9453061, -3.103589, 0.427451, 1, 0, 1,
-0.6137855, 1.102242, -2.288434, 0.4235294, 1, 0, 1,
-0.6012064, -0.1194482, -1.039945, 0.4156863, 1, 0, 1,
-0.5993345, -0.5945723, -2.899779, 0.4117647, 1, 0, 1,
-0.5922464, 0.9192923, -1.422973, 0.4039216, 1, 0, 1,
-0.5898584, -1.201245, -1.406323, 0.3960784, 1, 0, 1,
-0.5873469, -2.065295, -2.913843, 0.3921569, 1, 0, 1,
-0.5770877, -0.4930652, -2.928705, 0.3843137, 1, 0, 1,
-0.5720347, -0.755871, -3.345135, 0.3803922, 1, 0, 1,
-0.567008, 0.7052462, 1.547308, 0.372549, 1, 0, 1,
-0.5661623, 2.122434, 0.753475, 0.3686275, 1, 0, 1,
-0.5658294, -0.008922902, -1.635605, 0.3607843, 1, 0, 1,
-0.5656685, 0.01943029, -1.304942, 0.3568628, 1, 0, 1,
-0.5654484, 0.9833351, -1.243511, 0.3490196, 1, 0, 1,
-0.5654182, 0.5998346, -2.434767, 0.345098, 1, 0, 1,
-0.5614842, 0.6998498, -0.5331393, 0.3372549, 1, 0, 1,
-0.5557455, 0.03944501, -0.8936123, 0.3333333, 1, 0, 1,
-0.5537042, -1.043656, -2.174866, 0.3254902, 1, 0, 1,
-0.5462203, 0.2981936, -1.959972, 0.3215686, 1, 0, 1,
-0.5451525, 1.511254, 0.02498085, 0.3137255, 1, 0, 1,
-0.5448017, 0.913954, 0.009167418, 0.3098039, 1, 0, 1,
-0.5368223, -0.4345872, -0.7666876, 0.3019608, 1, 0, 1,
-0.5352495, 0.7696764, -0.07639947, 0.2941177, 1, 0, 1,
-0.5323384, -0.6359432, -2.717932, 0.2901961, 1, 0, 1,
-0.5261461, 0.7288791, -0.5753114, 0.282353, 1, 0, 1,
-0.5254326, -0.3896252, -4.16602, 0.2784314, 1, 0, 1,
-0.5239815, -0.2440339, -0.5216913, 0.2705882, 1, 0, 1,
-0.5220539, -1.376983, -4.622008, 0.2666667, 1, 0, 1,
-0.5215111, -0.3543991, -1.150926, 0.2588235, 1, 0, 1,
-0.5207555, -0.1372393, -0.4226287, 0.254902, 1, 0, 1,
-0.5186112, 0.8544129, 0.7503853, 0.2470588, 1, 0, 1,
-0.5163917, -0.587624, -4.618044, 0.2431373, 1, 0, 1,
-0.5113373, -0.61625, -1.918879, 0.2352941, 1, 0, 1,
-0.5040355, 1.420066, 0.388103, 0.2313726, 1, 0, 1,
-0.4981382, -1.347831, -1.675381, 0.2235294, 1, 0, 1,
-0.4970802, 0.9452824, -0.3372392, 0.2196078, 1, 0, 1,
-0.4911994, 1.568303, -1.056467, 0.2117647, 1, 0, 1,
-0.4864406, 0.6537053, -0.3979039, 0.2078431, 1, 0, 1,
-0.4823588, -0.9700913, -3.082837, 0.2, 1, 0, 1,
-0.4800958, -0.03230808, -3.085276, 0.1921569, 1, 0, 1,
-0.4790426, 0.7203285, 0.3016919, 0.1882353, 1, 0, 1,
-0.4762492, -1.636103, -1.409294, 0.1803922, 1, 0, 1,
-0.4750513, -0.1821983, -2.080172, 0.1764706, 1, 0, 1,
-0.4706858, 1.421339, 0.8793255, 0.1686275, 1, 0, 1,
-0.4602103, -0.7466784, -4.888912, 0.1647059, 1, 0, 1,
-0.4601401, 0.6083577, -1.41771, 0.1568628, 1, 0, 1,
-0.4581855, 2.104784, 0.8033811, 0.1529412, 1, 0, 1,
-0.4549943, 0.9245475, 0.4166157, 0.145098, 1, 0, 1,
-0.4496068, 0.5046669, -0.3483388, 0.1411765, 1, 0, 1,
-0.4411085, 0.007997102, 1.336135, 0.1333333, 1, 0, 1,
-0.4389066, -0.4897942, -3.698589, 0.1294118, 1, 0, 1,
-0.4384676, -0.6521832, -1.13772, 0.1215686, 1, 0, 1,
-0.4369435, -0.2560129, -1.509799, 0.1176471, 1, 0, 1,
-0.4264434, 0.6574062, -1.759611, 0.1098039, 1, 0, 1,
-0.4244414, 0.2670488, -1.915607, 0.1058824, 1, 0, 1,
-0.4243232, 0.9908078, 1.32059, 0.09803922, 1, 0, 1,
-0.4239263, -0.04322523, -2.105935, 0.09019608, 1, 0, 1,
-0.4237259, 1.840395, 0.354091, 0.08627451, 1, 0, 1,
-0.4228379, -0.4349316, -1.697397, 0.07843138, 1, 0, 1,
-0.4219822, 0.1807847, 0.4575078, 0.07450981, 1, 0, 1,
-0.4202543, -0.4775068, -2.588387, 0.06666667, 1, 0, 1,
-0.4200633, -1.018863, -2.098123, 0.0627451, 1, 0, 1,
-0.4175142, 0.7707769, -0.9064699, 0.05490196, 1, 0, 1,
-0.4115458, 1.786388, 0.1885877, 0.05098039, 1, 0, 1,
-0.4090622, -0.2626126, -1.712961, 0.04313726, 1, 0, 1,
-0.4019442, -1.422212, -3.119162, 0.03921569, 1, 0, 1,
-0.3989781, -0.9640073, -1.31876, 0.03137255, 1, 0, 1,
-0.3937216, 3.496465, -1.178934, 0.02745098, 1, 0, 1,
-0.393097, -2.339736, -1.756257, 0.01960784, 1, 0, 1,
-0.3916993, -1.816733, -2.285473, 0.01568628, 1, 0, 1,
-0.3898684, -0.4044409, -1.674815, 0.007843138, 1, 0, 1,
-0.389063, -0.9978786, -2.331754, 0.003921569, 1, 0, 1,
-0.387252, -1.273761, -3.117831, 0, 1, 0.003921569, 1,
-0.3869477, -0.5256748, -2.496857, 0, 1, 0.01176471, 1,
-0.3848555, -1.415443, -3.471208, 0, 1, 0.01568628, 1,
-0.3835404, -0.3467456, -3.285892, 0, 1, 0.02352941, 1,
-0.3770059, -0.7506794, -2.654747, 0, 1, 0.02745098, 1,
-0.3766212, 0.2734688, 0.4018297, 0, 1, 0.03529412, 1,
-0.3714778, 0.4054384, -1.225504, 0, 1, 0.03921569, 1,
-0.3693817, 1.305391, -0.8831282, 0, 1, 0.04705882, 1,
-0.3665519, -0.1498574, -2.679517, 0, 1, 0.05098039, 1,
-0.3602801, -0.8284994, -1.927925, 0, 1, 0.05882353, 1,
-0.3595041, 0.6673087, -0.2538342, 0, 1, 0.0627451, 1,
-0.3556929, -0.5473124, -3.043925, 0, 1, 0.07058824, 1,
-0.3502621, -2.500108, -3.204308, 0, 1, 0.07450981, 1,
-0.3479066, -0.6246499, -2.17003, 0, 1, 0.08235294, 1,
-0.3464252, 1.228872, 0.01406265, 0, 1, 0.08627451, 1,
-0.3458378, 1.759842, -2.172649, 0, 1, 0.09411765, 1,
-0.3447621, -0.08555252, -1.244705, 0, 1, 0.1019608, 1,
-0.3445292, -0.8229444, -3.638649, 0, 1, 0.1058824, 1,
-0.3437124, 0.3652215, -0.592887, 0, 1, 0.1137255, 1,
-0.3429989, -1.326377, -1.970733, 0, 1, 0.1176471, 1,
-0.34294, -0.7721508, -2.302911, 0, 1, 0.1254902, 1,
-0.3396688, -1.051098, -2.180445, 0, 1, 0.1294118, 1,
-0.3383821, -0.9064655, -1.157014, 0, 1, 0.1372549, 1,
-0.3356959, -1.298137, -3.523533, 0, 1, 0.1411765, 1,
-0.331784, -0.2649984, -3.031337, 0, 1, 0.1490196, 1,
-0.33011, 0.233301, -0.9966143, 0, 1, 0.1529412, 1,
-0.328445, 1.520757, 0.04141965, 0, 1, 0.1607843, 1,
-0.3225805, 0.006285929, -0.6025195, 0, 1, 0.1647059, 1,
-0.3200631, -0.4299428, -4.142057, 0, 1, 0.172549, 1,
-0.3193174, 0.6262548, -2.321212, 0, 1, 0.1764706, 1,
-0.3182954, -1.231684, -1.969079, 0, 1, 0.1843137, 1,
-0.3171144, 0.5129735, -1.314877, 0, 1, 0.1882353, 1,
-0.3143069, -0.01150958, -0.01294586, 0, 1, 0.1960784, 1,
-0.3098545, -0.3898227, -3.881855, 0, 1, 0.2039216, 1,
-0.309472, -0.2212171, -1.997146, 0, 1, 0.2078431, 1,
-0.3093008, 0.7760214, -0.7962393, 0, 1, 0.2156863, 1,
-0.3065255, -0.05792147, -1.835793, 0, 1, 0.2196078, 1,
-0.305593, -1.233631, -1.993908, 0, 1, 0.227451, 1,
-0.3041566, 0.1778417, -1.011381, 0, 1, 0.2313726, 1,
-0.2981327, 1.032828, 0.6643188, 0, 1, 0.2392157, 1,
-0.2948588, 0.5884782, 2.92258, 0, 1, 0.2431373, 1,
-0.29451, -0.3644111, -1.123128, 0, 1, 0.2509804, 1,
-0.2907794, 2.060193, -1.671574, 0, 1, 0.254902, 1,
-0.2894378, -1.330464, -2.048953, 0, 1, 0.2627451, 1,
-0.286292, 1.245061, 0.3891973, 0, 1, 0.2666667, 1,
-0.2862687, -0.7240682, -2.236956, 0, 1, 0.2745098, 1,
-0.2710329, -0.7367387, -2.755621, 0, 1, 0.2784314, 1,
-0.2684728, 0.3412477, -0.6292895, 0, 1, 0.2862745, 1,
-0.2676951, -0.1792063, -4.170878, 0, 1, 0.2901961, 1,
-0.2645085, -0.0244583, -2.86889, 0, 1, 0.2980392, 1,
-0.2513818, -0.8596566, -2.872566, 0, 1, 0.3058824, 1,
-0.2488523, 2.239913, -1.37381, 0, 1, 0.3098039, 1,
-0.2437503, -0.5411286, -2.405758, 0, 1, 0.3176471, 1,
-0.2426706, -0.6380616, -4.427661, 0, 1, 0.3215686, 1,
-0.241171, -0.9309345, -2.095806, 0, 1, 0.3294118, 1,
-0.2367556, -0.2983792, -2.623383, 0, 1, 0.3333333, 1,
-0.2344311, -0.6912721, -2.374627, 0, 1, 0.3411765, 1,
-0.2244913, 1.978049, 0.6919295, 0, 1, 0.345098, 1,
-0.2243119, 0.381866, -0.1273491, 0, 1, 0.3529412, 1,
-0.2168444, 0.780154, -0.3849702, 0, 1, 0.3568628, 1,
-0.2140088, 0.2826444, -1.377598, 0, 1, 0.3647059, 1,
-0.2135111, 1.980538, -0.1297336, 0, 1, 0.3686275, 1,
-0.2126955, -2.406001, -3.369984, 0, 1, 0.3764706, 1,
-0.2108217, -1.449328, -4.939515, 0, 1, 0.3803922, 1,
-0.2085183, 0.182068, -1.570696, 0, 1, 0.3882353, 1,
-0.2030525, -0.9598187, -2.551474, 0, 1, 0.3921569, 1,
-0.1943732, -1.199003, -4.588143, 0, 1, 0.4, 1,
-0.1893762, 0.7350959, -0.9566472, 0, 1, 0.4078431, 1,
-0.188382, -1.204097, -3.208025, 0, 1, 0.4117647, 1,
-0.1881195, -0.07018584, -1.533009, 0, 1, 0.4196078, 1,
-0.1854245, -0.3541155, -3.78273, 0, 1, 0.4235294, 1,
-0.1844488, -1.508566, -3.835178, 0, 1, 0.4313726, 1,
-0.1800877, 2.252959, -1.495911, 0, 1, 0.4352941, 1,
-0.1782953, 0.4280347, 0.2745104, 0, 1, 0.4431373, 1,
-0.1725042, -1.526598, -3.34397, 0, 1, 0.4470588, 1,
-0.1707005, -0.3903074, -3.00217, 0, 1, 0.454902, 1,
-0.1689864, 2.419953, 0.0216675, 0, 1, 0.4588235, 1,
-0.1641579, -0.8572261, -3.136434, 0, 1, 0.4666667, 1,
-0.1640381, -0.6218642, -2.6422, 0, 1, 0.4705882, 1,
-0.1615958, -2.59803, -2.718745, 0, 1, 0.4784314, 1,
-0.159158, -0.5347272, -2.234813, 0, 1, 0.4823529, 1,
-0.1571323, 0.1604806, 0.6149666, 0, 1, 0.4901961, 1,
-0.1549797, 0.4980876, -0.6863962, 0, 1, 0.4941176, 1,
-0.1532075, -1.614113, -1.146752, 0, 1, 0.5019608, 1,
-0.1531877, -0.524587, -2.241307, 0, 1, 0.509804, 1,
-0.151198, 0.006741064, -1.306881, 0, 1, 0.5137255, 1,
-0.1503692, 0.5170785, -2.313724, 0, 1, 0.5215687, 1,
-0.14709, 0.9705111, 1.037052, 0, 1, 0.5254902, 1,
-0.1451128, 0.4335268, 0.656152, 0, 1, 0.5333334, 1,
-0.1449317, 0.302909, -0.2285152, 0, 1, 0.5372549, 1,
-0.1436277, 0.8787504, 0.2745747, 0, 1, 0.5450981, 1,
-0.1336579, -0.002222551, -1.656146, 0, 1, 0.5490196, 1,
-0.1315616, -1.68991, -2.445217, 0, 1, 0.5568628, 1,
-0.1301319, 1.763581, 0.9413004, 0, 1, 0.5607843, 1,
-0.1289272, 0.03469573, -1.251222, 0, 1, 0.5686275, 1,
-0.1220117, -1.0853, -1.978299, 0, 1, 0.572549, 1,
-0.1193006, -1.65393, -3.744404, 0, 1, 0.5803922, 1,
-0.1171144, 1.329455, -0.2142796, 0, 1, 0.5843138, 1,
-0.1110283, -0.9121357, -2.043056, 0, 1, 0.5921569, 1,
-0.1091218, -1.522931, -2.533645, 0, 1, 0.5960785, 1,
-0.1043327, 1.286988, 2.038318, 0, 1, 0.6039216, 1,
-0.102248, 0.4703919, 0.7358751, 0, 1, 0.6117647, 1,
-0.09926747, -0.9372129, -3.239605, 0, 1, 0.6156863, 1,
-0.08947122, 1.036601, 0.1183427, 0, 1, 0.6235294, 1,
-0.08912771, -0.01110111, -3.410989, 0, 1, 0.627451, 1,
-0.08639786, -1.712487, -2.363858, 0, 1, 0.6352941, 1,
-0.08559798, 1.712957, -2.071749, 0, 1, 0.6392157, 1,
-0.0849197, 1.568041, -0.9101481, 0, 1, 0.6470588, 1,
-0.07987214, -1.70089, -2.299826, 0, 1, 0.6509804, 1,
-0.07977022, 0.9065762, -0.3006037, 0, 1, 0.6588235, 1,
-0.07574815, 2.111738, 0.1712897, 0, 1, 0.6627451, 1,
-0.07518667, -0.6571972, -2.946561, 0, 1, 0.6705883, 1,
-0.07489227, 1.199354, 0.03842194, 0, 1, 0.6745098, 1,
-0.07147623, -0.08274138, -0.4978925, 0, 1, 0.682353, 1,
-0.06689808, 0.04888891, -0.8815404, 0, 1, 0.6862745, 1,
-0.06683683, 1.625618, 1.876782, 0, 1, 0.6941177, 1,
-0.06105665, 1.373681, -0.9900894, 0, 1, 0.7019608, 1,
-0.05784446, 1.440142, 0.05616555, 0, 1, 0.7058824, 1,
-0.05372813, -0.4313538, -3.593903, 0, 1, 0.7137255, 1,
-0.05333529, -0.8856606, -0.9660305, 0, 1, 0.7176471, 1,
-0.04601778, 0.3859289, 1.560616, 0, 1, 0.7254902, 1,
-0.03638005, -0.7623414, -4.595459, 0, 1, 0.7294118, 1,
-0.03572142, -0.4284025, -4.606359, 0, 1, 0.7372549, 1,
-0.03533722, -0.8521474, -2.929807, 0, 1, 0.7411765, 1,
-0.0341524, 0.05599871, -0.8319784, 0, 1, 0.7490196, 1,
-0.03212352, -1.782314, -3.615056, 0, 1, 0.7529412, 1,
-0.03088262, 0.2284593, -0.8195562, 0, 1, 0.7607843, 1,
-0.030243, 0.3987919, -0.1089657, 0, 1, 0.7647059, 1,
-0.02521452, 0.2002082, -1.522294, 0, 1, 0.772549, 1,
-0.02367877, -0.001776268, -1.42221, 0, 1, 0.7764706, 1,
-0.02359972, -1.771145, -4.067894, 0, 1, 0.7843137, 1,
-0.01956272, 0.1461179, 2.01582, 0, 1, 0.7882353, 1,
-0.01857207, -1.023705, -2.570223, 0, 1, 0.7960784, 1,
-0.01801837, -0.6331544, -1.735645, 0, 1, 0.8039216, 1,
-0.01750633, -1.520435, -2.650874, 0, 1, 0.8078431, 1,
-0.01679684, 1.667957, -0.08599896, 0, 1, 0.8156863, 1,
-0.01299926, 1.118122, 0.7312939, 0, 1, 0.8196079, 1,
-0.01291926, -0.1066961, -4.620549, 0, 1, 0.827451, 1,
-0.01175585, -1.431857, -2.417743, 0, 1, 0.8313726, 1,
-0.01124219, 0.311849, 0.2832136, 0, 1, 0.8392157, 1,
-0.01088323, 1.754254, 0.2310478, 0, 1, 0.8431373, 1,
-0.01018396, 0.5909005, -0.5789856, 0, 1, 0.8509804, 1,
-0.006543578, -1.448808, -4.936467, 0, 1, 0.854902, 1,
-0.004496745, 1.082943, -0.6633808, 0, 1, 0.8627451, 1,
-0.002907112, -0.4184932, -2.211355, 0, 1, 0.8666667, 1,
-0.002768548, 0.008144819, 0.4804023, 0, 1, 0.8745098, 1,
-5.805877e-05, 0.5691751, 0.9723085, 0, 1, 0.8784314, 1,
0.008806157, -0.2171902, 2.671306, 0, 1, 0.8862745, 1,
0.009306952, -0.8383141, 2.843477, 0, 1, 0.8901961, 1,
0.009390032, 0.5500094, -1.045104, 0, 1, 0.8980392, 1,
0.009737892, 1.693882, 1.786322, 0, 1, 0.9058824, 1,
0.01566684, -1.020041, 1.958266, 0, 1, 0.9098039, 1,
0.01763763, -0.7959921, 0.7483708, 0, 1, 0.9176471, 1,
0.01945216, -0.3583454, 3.251087, 0, 1, 0.9215686, 1,
0.02633025, 0.9714314, 0.5223891, 0, 1, 0.9294118, 1,
0.02912454, 0.4180293, 1.534116, 0, 1, 0.9333333, 1,
0.03317643, -1.354198, 3.062037, 0, 1, 0.9411765, 1,
0.03490682, 0.03195143, 1.069642, 0, 1, 0.945098, 1,
0.03495836, -0.8728227, 2.357736, 0, 1, 0.9529412, 1,
0.03555397, -0.7315391, 2.896009, 0, 1, 0.9568627, 1,
0.03755042, 0.46832, 2.005867, 0, 1, 0.9647059, 1,
0.03855559, 1.03736, 0.5103062, 0, 1, 0.9686275, 1,
0.03893153, 0.2329689, 1.533174, 0, 1, 0.9764706, 1,
0.03912527, 0.1753928, 0.6825112, 0, 1, 0.9803922, 1,
0.05102444, -0.02635739, 2.228268, 0, 1, 0.9882353, 1,
0.05142865, 0.2011617, 1.130196, 0, 1, 0.9921569, 1,
0.05152033, -1.7569, 3.057747, 0, 1, 1, 1,
0.05177038, -1.370316, 2.361448, 0, 0.9921569, 1, 1,
0.05362452, -0.9750026, 5.079698, 0, 0.9882353, 1, 1,
0.054236, -0.6657283, 3.141607, 0, 0.9803922, 1, 1,
0.05835221, 0.4390699, -0.9579586, 0, 0.9764706, 1, 1,
0.05962313, -2.320714, 3.66054, 0, 0.9686275, 1, 1,
0.06130612, -0.7135791, 2.970789, 0, 0.9647059, 1, 1,
0.0650079, 0.7501453, -0.2698005, 0, 0.9568627, 1, 1,
0.06620583, 2.042543, -0.06065889, 0, 0.9529412, 1, 1,
0.06901727, -1.619431, 2.664453, 0, 0.945098, 1, 1,
0.0737929, 1.386476, 1.781347, 0, 0.9411765, 1, 1,
0.07399163, 0.4937339, -0.4409983, 0, 0.9333333, 1, 1,
0.07427971, -0.0661609, 2.333131, 0, 0.9294118, 1, 1,
0.07525437, 0.1219727, 0.778842, 0, 0.9215686, 1, 1,
0.07709847, -0.6406096, 3.723301, 0, 0.9176471, 1, 1,
0.07883976, -0.1875792, 3.208746, 0, 0.9098039, 1, 1,
0.08266345, -0.06685957, 1.197727, 0, 0.9058824, 1, 1,
0.08290317, 0.06354677, 1.242247, 0, 0.8980392, 1, 1,
0.08660343, -0.3670606, 3.07355, 0, 0.8901961, 1, 1,
0.08855324, 0.8218839, 0.0660293, 0, 0.8862745, 1, 1,
0.08893955, -1.126615, 2.223578, 0, 0.8784314, 1, 1,
0.08901171, -0.03273362, 1.870492, 0, 0.8745098, 1, 1,
0.08917952, -0.3610986, 3.017906, 0, 0.8666667, 1, 1,
0.09209502, -0.04766684, 1.446466, 0, 0.8627451, 1, 1,
0.09684771, -0.07812827, 2.665881, 0, 0.854902, 1, 1,
0.0997395, 1.267858, 0.9998905, 0, 0.8509804, 1, 1,
0.1004436, 1.184621, 0.3540961, 0, 0.8431373, 1, 1,
0.1054726, 0.08160555, 0.7352014, 0, 0.8392157, 1, 1,
0.1098375, -1.232034, 3.992014, 0, 0.8313726, 1, 1,
0.1116677, -1.212005, 1.323899, 0, 0.827451, 1, 1,
0.1260827, -1.576421, 2.916683, 0, 0.8196079, 1, 1,
0.1313616, 0.1697309, 0.6566415, 0, 0.8156863, 1, 1,
0.1345731, -0.05132886, 1.761899, 0, 0.8078431, 1, 1,
0.1365238, 0.1871028, 1.141745, 0, 0.8039216, 1, 1,
0.1404256, -0.6080636, 2.465673, 0, 0.7960784, 1, 1,
0.1417698, -0.8539762, 2.45602, 0, 0.7882353, 1, 1,
0.1439579, 0.5395323, -0.5144712, 0, 0.7843137, 1, 1,
0.146318, 1.076223, -0.3602376, 0, 0.7764706, 1, 1,
0.1475744, -0.9553363, 3.27844, 0, 0.772549, 1, 1,
0.1531549, -0.01246813, 1.611263, 0, 0.7647059, 1, 1,
0.1535839, 0.04307887, 0.7703384, 0, 0.7607843, 1, 1,
0.158993, -0.9530591, 2.832371, 0, 0.7529412, 1, 1,
0.1604662, 0.4227903, 1.409269, 0, 0.7490196, 1, 1,
0.1612185, 0.4265002, 0.8360723, 0, 0.7411765, 1, 1,
0.1616863, 0.4978226, 1.442571, 0, 0.7372549, 1, 1,
0.16321, -1.063952, 2.538784, 0, 0.7294118, 1, 1,
0.164282, 1.667183, 1.331017, 0, 0.7254902, 1, 1,
0.1667564, -0.6459902, 3.958568, 0, 0.7176471, 1, 1,
0.1712389, 0.753876, -0.3557028, 0, 0.7137255, 1, 1,
0.1777334, -0.6964086, 3.78063, 0, 0.7058824, 1, 1,
0.1782763, 1.94595, -0.3074731, 0, 0.6980392, 1, 1,
0.1798932, -1.153406, 5.588299, 0, 0.6941177, 1, 1,
0.1806435, -0.2218366, 1.20201, 0, 0.6862745, 1, 1,
0.181683, 0.2283571, 1.081407, 0, 0.682353, 1, 1,
0.1819699, 0.7537256, 1.682079, 0, 0.6745098, 1, 1,
0.1819785, 0.3884782, -0.5390624, 0, 0.6705883, 1, 1,
0.1863205, -1.039341, 4.100699, 0, 0.6627451, 1, 1,
0.1868164, -0.5976829, 4.045155, 0, 0.6588235, 1, 1,
0.1916605, 0.08807355, 2.039608, 0, 0.6509804, 1, 1,
0.1922725, 1.600474, 2.746553, 0, 0.6470588, 1, 1,
0.1949607, 0.7158757, -0.1268732, 0, 0.6392157, 1, 1,
0.1956974, 0.9990831, 1.525944, 0, 0.6352941, 1, 1,
0.1983925, -0.3860626, 0.5617322, 0, 0.627451, 1, 1,
0.2044097, -0.3566625, 3.222311, 0, 0.6235294, 1, 1,
0.2064767, 0.1727842, 0.6658536, 0, 0.6156863, 1, 1,
0.2072722, -1.741267, 1.835649, 0, 0.6117647, 1, 1,
0.2147211, 1.94102, 0.2175484, 0, 0.6039216, 1, 1,
0.2160386, 0.1659719, 1.150447, 0, 0.5960785, 1, 1,
0.2175079, -0.6934264, 3.924414, 0, 0.5921569, 1, 1,
0.2218559, -0.06805959, 1.419606, 0, 0.5843138, 1, 1,
0.2221098, -2.944145, 2.606143, 0, 0.5803922, 1, 1,
0.2230565, -0.4007665, 2.539613, 0, 0.572549, 1, 1,
0.223148, -0.7885804, 3.29963, 0, 0.5686275, 1, 1,
0.224346, -0.9591151, 1.070472, 0, 0.5607843, 1, 1,
0.2246025, 0.2190438, 1.335208, 0, 0.5568628, 1, 1,
0.2256562, 0.1730083, 1.853804, 0, 0.5490196, 1, 1,
0.225795, 1.049397, -0.5641583, 0, 0.5450981, 1, 1,
0.2278795, -0.4716338, 4.136539, 0, 0.5372549, 1, 1,
0.2283433, -0.5539116, 1.449742, 0, 0.5333334, 1, 1,
0.2324395, -0.9095827, 2.640471, 0, 0.5254902, 1, 1,
0.2341758, -2.344021, 3.423483, 0, 0.5215687, 1, 1,
0.2357181, -0.9281225, 4.127343, 0, 0.5137255, 1, 1,
0.2391772, 0.563286, -0.3253552, 0, 0.509804, 1, 1,
0.2425342, 0.04777313, 1.102273, 0, 0.5019608, 1, 1,
0.2425472, 0.5919864, 0.8049474, 0, 0.4941176, 1, 1,
0.243637, 0.6781335, 1.212045, 0, 0.4901961, 1, 1,
0.2439633, -0.8340088, 2.20417, 0, 0.4823529, 1, 1,
0.2456033, -0.7519892, 3.135908, 0, 0.4784314, 1, 1,
0.246143, -0.811649, 2.665886, 0, 0.4705882, 1, 1,
0.2467278, 0.03833871, 2.482821, 0, 0.4666667, 1, 1,
0.2488425, -0.4656567, 4.404177, 0, 0.4588235, 1, 1,
0.2496734, 0.7123576, 0.09964973, 0, 0.454902, 1, 1,
0.2607829, 0.1055449, 1.485684, 0, 0.4470588, 1, 1,
0.2612921, -0.6298625, 2.448743, 0, 0.4431373, 1, 1,
0.261856, -0.8430431, 2.357854, 0, 0.4352941, 1, 1,
0.2619116, -2.488182, 3.588252, 0, 0.4313726, 1, 1,
0.2627478, -0.2788025, 3.361157, 0, 0.4235294, 1, 1,
0.2666975, -0.4429157, 2.407474, 0, 0.4196078, 1, 1,
0.2676126, 0.4274366, 1.463922, 0, 0.4117647, 1, 1,
0.2676412, 0.5966206, 3.538806, 0, 0.4078431, 1, 1,
0.2697819, -1.243376, 1.651729, 0, 0.4, 1, 1,
0.2737512, 0.08813724, 1.149031, 0, 0.3921569, 1, 1,
0.2762576, 0.435287, 2.07084, 0, 0.3882353, 1, 1,
0.2792776, -0.2721372, 1.91163, 0, 0.3803922, 1, 1,
0.28075, 1.466748, 0.9838324, 0, 0.3764706, 1, 1,
0.2808085, 0.01877774, 1.312803, 0, 0.3686275, 1, 1,
0.2827387, 1.686516, -0.05661899, 0, 0.3647059, 1, 1,
0.2834364, 1.970981, 0.8614785, 0, 0.3568628, 1, 1,
0.2858626, 1.414931, 0.5793149, 0, 0.3529412, 1, 1,
0.2901244, 0.9108267, -0.2610923, 0, 0.345098, 1, 1,
0.2989494, 0.3037521, 0.87195, 0, 0.3411765, 1, 1,
0.2994147, -0.9647877, 2.014671, 0, 0.3333333, 1, 1,
0.3019261, -0.8072454, 3.768113, 0, 0.3294118, 1, 1,
0.3034308, 0.2281526, -1.668683, 0, 0.3215686, 1, 1,
0.3037645, -0.9001032, 3.016681, 0, 0.3176471, 1, 1,
0.3047727, 0.2693034, 2.423482, 0, 0.3098039, 1, 1,
0.3118847, -0.3103167, 1.85421, 0, 0.3058824, 1, 1,
0.3147848, -0.3214222, 2.088923, 0, 0.2980392, 1, 1,
0.3161695, 0.07089383, 0.7263263, 0, 0.2901961, 1, 1,
0.3192793, 1.437721, 0.9078736, 0, 0.2862745, 1, 1,
0.3193597, 0.5462953, 1.218168, 0, 0.2784314, 1, 1,
0.3200439, 0.1881096, 1.870431, 0, 0.2745098, 1, 1,
0.3237626, -0.2164806, 3.350786, 0, 0.2666667, 1, 1,
0.3250216, 0.8185564, 1.601556, 0, 0.2627451, 1, 1,
0.3290597, 0.3584336, 1.662379, 0, 0.254902, 1, 1,
0.3312127, -1.550368, 3.513942, 0, 0.2509804, 1, 1,
0.3325792, -1.148893, 2.402945, 0, 0.2431373, 1, 1,
0.3369303, 0.1364588, 3.422156, 0, 0.2392157, 1, 1,
0.3374099, 0.417034, 0.7768819, 0, 0.2313726, 1, 1,
0.3592261, -0.07714532, 3.841149, 0, 0.227451, 1, 1,
0.3613137, -1.39458, 2.327743, 0, 0.2196078, 1, 1,
0.3627723, -1.165002, 3.97596, 0, 0.2156863, 1, 1,
0.3647274, -0.4702283, 3.107639, 0, 0.2078431, 1, 1,
0.3682326, -0.4660094, 2.630396, 0, 0.2039216, 1, 1,
0.370421, -0.4598089, 2.433926, 0, 0.1960784, 1, 1,
0.3712063, -0.4123888, 2.992787, 0, 0.1882353, 1, 1,
0.380334, 1.753022, 0.04524224, 0, 0.1843137, 1, 1,
0.3805119, 1.307753, -2.164574, 0, 0.1764706, 1, 1,
0.3810816, 0.02985737, 1.58413, 0, 0.172549, 1, 1,
0.3828102, -1.651704, 3.258892, 0, 0.1647059, 1, 1,
0.3845516, -0.1783554, 1.306353, 0, 0.1607843, 1, 1,
0.3852724, -0.4789884, 1.951979, 0, 0.1529412, 1, 1,
0.3884158, -1.236344, 4.011079, 0, 0.1490196, 1, 1,
0.3897065, 1.89044, 0.9253514, 0, 0.1411765, 1, 1,
0.3921956, 0.08389065, 1.88682, 0, 0.1372549, 1, 1,
0.3939832, 1.867482, 2.389298, 0, 0.1294118, 1, 1,
0.3947503, -1.251011, 3.449417, 0, 0.1254902, 1, 1,
0.3951322, 0.4849138, 1.283152, 0, 0.1176471, 1, 1,
0.3960931, 0.3671678, 0.2051874, 0, 0.1137255, 1, 1,
0.3970497, 0.3863922, -0.9615817, 0, 0.1058824, 1, 1,
0.4008979, 1.791678, -0.4528398, 0, 0.09803922, 1, 1,
0.4110183, -1.608382, 2.289386, 0, 0.09411765, 1, 1,
0.4113862, 0.7167782, 0.9061785, 0, 0.08627451, 1, 1,
0.4114226, -0.4602822, 2.829716, 0, 0.08235294, 1, 1,
0.4199267, 0.5632575, -0.4192113, 0, 0.07450981, 1, 1,
0.4233168, -0.2857427, 1.587727, 0, 0.07058824, 1, 1,
0.4251994, 1.035296, 0.1293135, 0, 0.0627451, 1, 1,
0.42931, -1.381571, 3.172015, 0, 0.05882353, 1, 1,
0.4309915, 1.257333, 0.5463285, 0, 0.05098039, 1, 1,
0.4311986, 0.06290437, 0.4605249, 0, 0.04705882, 1, 1,
0.434717, -0.4080785, 2.406865, 0, 0.03921569, 1, 1,
0.4399248, 0.6668697, -0.6874874, 0, 0.03529412, 1, 1,
0.4432041, -1.049643, 3.24188, 0, 0.02745098, 1, 1,
0.4448718, 0.6644707, 0.1172668, 0, 0.02352941, 1, 1,
0.4463682, 1.030022, 1.76675, 0, 0.01568628, 1, 1,
0.4484922, -0.1358625, 1.299429, 0, 0.01176471, 1, 1,
0.4505726, 1.16105, -0.2048991, 0, 0.003921569, 1, 1,
0.4508995, -0.1012521, 1.519412, 0.003921569, 0, 1, 1,
0.4516575, 1.515562, 1.849583, 0.007843138, 0, 1, 1,
0.4529184, 1.00566, -1.746467, 0.01568628, 0, 1, 1,
0.4533783, 0.05596361, 2.904469, 0.01960784, 0, 1, 1,
0.4583434, -0.980864, 2.193301, 0.02745098, 0, 1, 1,
0.4599038, -0.1152489, 1.768037, 0.03137255, 0, 1, 1,
0.4639668, -1.412201, 4.838609, 0.03921569, 0, 1, 1,
0.4665692, 1.232565, 0.143686, 0.04313726, 0, 1, 1,
0.4685468, -1.086217, 2.920094, 0.05098039, 0, 1, 1,
0.4710568, 1.250408, -0.354271, 0.05490196, 0, 1, 1,
0.4718873, 0.5521343, -0.6316298, 0.0627451, 0, 1, 1,
0.4753191, -0.8864454, 1.43764, 0.06666667, 0, 1, 1,
0.4760291, 1.99826, 0.1679782, 0.07450981, 0, 1, 1,
0.4769955, -2.295534, 3.512897, 0.07843138, 0, 1, 1,
0.4819186, 0.6258878, 0.4782164, 0.08627451, 0, 1, 1,
0.4850522, -0.5848845, 4.371102, 0.09019608, 0, 1, 1,
0.4855372, 0.3027752, 0.7803763, 0.09803922, 0, 1, 1,
0.4889921, -0.7559096, 3.03028, 0.1058824, 0, 1, 1,
0.4892811, -0.9793722, 2.478125, 0.1098039, 0, 1, 1,
0.4953747, 0.5066069, 1.285722, 0.1176471, 0, 1, 1,
0.4956231, -0.414046, 2.453399, 0.1215686, 0, 1, 1,
0.4985841, -1.763271, 3.999829, 0.1294118, 0, 1, 1,
0.4990646, -0.8363101, 2.730732, 0.1333333, 0, 1, 1,
0.5005758, 0.30825, 0.7498047, 0.1411765, 0, 1, 1,
0.5015708, 0.7530921, 1.546527, 0.145098, 0, 1, 1,
0.5019146, -0.5482487, 2.670152, 0.1529412, 0, 1, 1,
0.5040787, 0.2619465, 1.477472, 0.1568628, 0, 1, 1,
0.5049795, 0.9711632, 0.6709215, 0.1647059, 0, 1, 1,
0.5075772, 1.107937, 0.1739684, 0.1686275, 0, 1, 1,
0.5096887, -0.1333707, 1.053415, 0.1764706, 0, 1, 1,
0.5101814, -0.7057037, 2.36424, 0.1803922, 0, 1, 1,
0.5123463, 1.379759, -1.232831, 0.1882353, 0, 1, 1,
0.5139115, 0.436514, 1.070641, 0.1921569, 0, 1, 1,
0.5142097, 0.6019512, -0.5773401, 0.2, 0, 1, 1,
0.5142962, 0.6087938, 0.5708956, 0.2078431, 0, 1, 1,
0.5178843, -0.3026553, 2.503489, 0.2117647, 0, 1, 1,
0.5197194, 0.120823, 0.5034987, 0.2196078, 0, 1, 1,
0.5216177, -0.3253453, 2.736871, 0.2235294, 0, 1, 1,
0.5218052, 0.6729958, 1.219051, 0.2313726, 0, 1, 1,
0.5221829, -0.9093132, 3.745736, 0.2352941, 0, 1, 1,
0.5231987, 1.143442, 1.122074, 0.2431373, 0, 1, 1,
0.5252646, 1.563337, -0.2077724, 0.2470588, 0, 1, 1,
0.5315703, -2.934195, 4.005148, 0.254902, 0, 1, 1,
0.5343066, 0.4267178, 1.351625, 0.2588235, 0, 1, 1,
0.5369316, 1.502899, -0.0400263, 0.2666667, 0, 1, 1,
0.5382094, 0.01020006, 0.8680379, 0.2705882, 0, 1, 1,
0.5415405, -0.3716163, 2.893772, 0.2784314, 0, 1, 1,
0.5446295, -0.971284, 3.551463, 0.282353, 0, 1, 1,
0.54972, -0.08073609, 3.706078, 0.2901961, 0, 1, 1,
0.5505529, 0.2075358, 1.263335, 0.2941177, 0, 1, 1,
0.556967, 1.236356, 0.6283131, 0.3019608, 0, 1, 1,
0.5573574, -0.1741598, 2.467164, 0.3098039, 0, 1, 1,
0.5618604, -1.148051, 4.816509, 0.3137255, 0, 1, 1,
0.5630225, -0.07229998, 2.429441, 0.3215686, 0, 1, 1,
0.5662094, -0.214918, 2.031645, 0.3254902, 0, 1, 1,
0.5669805, 0.89193, 0.2803679, 0.3333333, 0, 1, 1,
0.5677733, -0.6749075, 2.047764, 0.3372549, 0, 1, 1,
0.5776999, -0.446246, 3.274797, 0.345098, 0, 1, 1,
0.5821749, -0.7302209, 2.759201, 0.3490196, 0, 1, 1,
0.5890226, -0.5276425, 3.395625, 0.3568628, 0, 1, 1,
0.5891994, -0.5639256, 1.617477, 0.3607843, 0, 1, 1,
0.5978062, -0.5253372, 1.98602, 0.3686275, 0, 1, 1,
0.6014719, 0.4016198, 1.090109, 0.372549, 0, 1, 1,
0.6064994, 0.2776264, 0.5538871, 0.3803922, 0, 1, 1,
0.6082984, 1.074596, 0.01107083, 0.3843137, 0, 1, 1,
0.6100144, -0.3657269, 3.350904, 0.3921569, 0, 1, 1,
0.6146914, 1.295029, 1.102507, 0.3960784, 0, 1, 1,
0.6179018, 0.4160729, 1.771747, 0.4039216, 0, 1, 1,
0.619533, -0.8177128, 1.197261, 0.4117647, 0, 1, 1,
0.6224409, -0.1893749, 1.709504, 0.4156863, 0, 1, 1,
0.6253218, 1.602989, 1.151442, 0.4235294, 0, 1, 1,
0.6270773, 0.5860516, 1.076569, 0.427451, 0, 1, 1,
0.6285487, 0.3143506, 2.008396, 0.4352941, 0, 1, 1,
0.6307447, 0.2222057, 1.693357, 0.4392157, 0, 1, 1,
0.6321954, -0.1496102, 1.399355, 0.4470588, 0, 1, 1,
0.6408002, 0.02286397, 1.903147, 0.4509804, 0, 1, 1,
0.6440657, -0.8924322, 3.500777, 0.4588235, 0, 1, 1,
0.6472136, -0.6641479, 3.355636, 0.4627451, 0, 1, 1,
0.6480506, -0.5175011, 1.89814, 0.4705882, 0, 1, 1,
0.6500419, 0.3941549, 0.4946901, 0.4745098, 0, 1, 1,
0.6503838, 0.4176554, -0.4485399, 0.4823529, 0, 1, 1,
0.6525581, -0.6221946, 0.6640276, 0.4862745, 0, 1, 1,
0.6543635, -0.7455522, 2.272645, 0.4941176, 0, 1, 1,
0.6637818, -0.8833622, 2.446757, 0.5019608, 0, 1, 1,
0.6652229, 1.078257, 0.5797601, 0.5058824, 0, 1, 1,
0.6688088, -1.21849, 3.62466, 0.5137255, 0, 1, 1,
0.6749008, 1.454773, 0.5563992, 0.5176471, 0, 1, 1,
0.6759031, -0.5831026, 1.360928, 0.5254902, 0, 1, 1,
0.6823097, -0.1636955, 1.940756, 0.5294118, 0, 1, 1,
0.6831082, 2.046742, 0.9678279, 0.5372549, 0, 1, 1,
0.6913882, -1.65852, 3.903031, 0.5411765, 0, 1, 1,
0.6921005, 0.5373501, 0.850181, 0.5490196, 0, 1, 1,
0.7003239, 0.37203, 1.547692, 0.5529412, 0, 1, 1,
0.7015798, 1.0504, 0.1735613, 0.5607843, 0, 1, 1,
0.7035959, 2.112003, 1.11982, 0.5647059, 0, 1, 1,
0.7070345, -0.132143, 1.540858, 0.572549, 0, 1, 1,
0.7090757, -0.9060376, 2.513445, 0.5764706, 0, 1, 1,
0.7134258, 0.979028, 0.1008159, 0.5843138, 0, 1, 1,
0.7149878, -0.3955015, 2.587809, 0.5882353, 0, 1, 1,
0.7163334, -0.5001678, 2.037709, 0.5960785, 0, 1, 1,
0.725682, 1.55805, 0.7395285, 0.6039216, 0, 1, 1,
0.7316323, 1.071611, -0.9353194, 0.6078432, 0, 1, 1,
0.7376977, -0.2936299, -0.04789188, 0.6156863, 0, 1, 1,
0.7394348, -0.7795807, 3.642122, 0.6196079, 0, 1, 1,
0.7421778, 0.9506579, -0.5907311, 0.627451, 0, 1, 1,
0.7474949, 0.4166705, 1.172207, 0.6313726, 0, 1, 1,
0.7503769, -1.035931, 3.073982, 0.6392157, 0, 1, 1,
0.7556426, -0.4422998, 0.4658056, 0.6431373, 0, 1, 1,
0.7559381, 0.5344951, 0.7545565, 0.6509804, 0, 1, 1,
0.7567975, -1.732772, 2.899506, 0.654902, 0, 1, 1,
0.7570034, 1.602685, 0.829994, 0.6627451, 0, 1, 1,
0.7706898, -0.6729749, 1.67683, 0.6666667, 0, 1, 1,
0.7712328, -0.02717801, 1.595531, 0.6745098, 0, 1, 1,
0.7733985, -0.4329599, 2.262293, 0.6784314, 0, 1, 1,
0.7735407, 0.2225575, 0.8992624, 0.6862745, 0, 1, 1,
0.7758742, -0.1038702, 2.039083, 0.6901961, 0, 1, 1,
0.7811677, 0.5662483, -0.258254, 0.6980392, 0, 1, 1,
0.7816169, -0.02803377, 3.023941, 0.7058824, 0, 1, 1,
0.7941908, 2.083995, -0.7002995, 0.7098039, 0, 1, 1,
0.7948471, 0.7392985, 1.767819, 0.7176471, 0, 1, 1,
0.7952828, -1.221171, 3.442929, 0.7215686, 0, 1, 1,
0.8001792, 0.4129039, 1.585283, 0.7294118, 0, 1, 1,
0.8012179, -0.7663889, 0.3753228, 0.7333333, 0, 1, 1,
0.8046773, -1.281418, 3.423692, 0.7411765, 0, 1, 1,
0.8055937, 0.4987226, 1.084362, 0.7450981, 0, 1, 1,
0.8063457, 0.4433922, 0.6286318, 0.7529412, 0, 1, 1,
0.8074122, 0.7494, 1.567301, 0.7568628, 0, 1, 1,
0.8084358, -1.147634, 1.018138, 0.7647059, 0, 1, 1,
0.8102568, -0.7436962, 1.945385, 0.7686275, 0, 1, 1,
0.8163416, 1.575567, 1.434358, 0.7764706, 0, 1, 1,
0.8190539, -0.2674094, 2.011959, 0.7803922, 0, 1, 1,
0.8244643, 0.327425, 0.9843907, 0.7882353, 0, 1, 1,
0.8271164, -1.152072, 2.923725, 0.7921569, 0, 1, 1,
0.828732, 0.4631695, 2.549443, 0.8, 0, 1, 1,
0.8315482, 2.140402, 1.940561, 0.8078431, 0, 1, 1,
0.8320585, 0.2912105, 2.134984, 0.8117647, 0, 1, 1,
0.832696, -1.136766, 2.763508, 0.8196079, 0, 1, 1,
0.8343149, -0.1250819, 1.020106, 0.8235294, 0, 1, 1,
0.8346912, -0.0307959, 1.516675, 0.8313726, 0, 1, 1,
0.8377308, 1.196303, -1.068143, 0.8352941, 0, 1, 1,
0.8401724, 0.1457294, 1.586334, 0.8431373, 0, 1, 1,
0.8477187, -0.7195433, 0.6590263, 0.8470588, 0, 1, 1,
0.8485799, -1.530357, 3.566738, 0.854902, 0, 1, 1,
0.8491257, -0.6640743, 1.264732, 0.8588235, 0, 1, 1,
0.8569893, 0.7629584, 0.6853676, 0.8666667, 0, 1, 1,
0.865407, -1.502747, 2.463352, 0.8705882, 0, 1, 1,
0.8657764, -1.006358, 1.210128, 0.8784314, 0, 1, 1,
0.8682603, -0.3543653, 2.16964, 0.8823529, 0, 1, 1,
0.87133, -0.3500981, 1.060352, 0.8901961, 0, 1, 1,
0.8773223, -1.992238, 3.206478, 0.8941177, 0, 1, 1,
0.8786002, 1.182947, 1.057768, 0.9019608, 0, 1, 1,
0.8819584, -0.8156236, 1.513064, 0.9098039, 0, 1, 1,
0.8855624, 1.317854, 0.8821152, 0.9137255, 0, 1, 1,
0.8856618, -1.306525, 2.672802, 0.9215686, 0, 1, 1,
0.8864086, -0.7888644, 2.561203, 0.9254902, 0, 1, 1,
0.8952392, 1.636093, 0.9976316, 0.9333333, 0, 1, 1,
0.8970477, -0.175443, 0.04987181, 0.9372549, 0, 1, 1,
0.8980244, 0.7117755, 0.7802927, 0.945098, 0, 1, 1,
0.9000617, 0.1582548, 0.5761768, 0.9490196, 0, 1, 1,
0.9104939, 0.9069797, 0.1133585, 0.9568627, 0, 1, 1,
0.9134382, -0.5197023, 3.680941, 0.9607843, 0, 1, 1,
0.9192047, 1.879162, -0.4530173, 0.9686275, 0, 1, 1,
0.9206363, -1.252493, 2.267727, 0.972549, 0, 1, 1,
0.9291182, 0.06373555, 2.205156, 0.9803922, 0, 1, 1,
0.9300718, 0.1272096, 1.541662, 0.9843137, 0, 1, 1,
0.9358556, 1.893107, -0.8652767, 0.9921569, 0, 1, 1,
0.9400373, -0.2803252, 1.01215, 0.9960784, 0, 1, 1,
0.9407333, 0.2078609, 1.907679, 1, 0, 0.9960784, 1,
0.9528059, -0.8533013, 3.029766, 1, 0, 0.9882353, 1,
0.9577047, -1.102026, 0.3714665, 1, 0, 0.9843137, 1,
0.9615723, -1.203931, 2.386008, 1, 0, 0.9764706, 1,
0.9646526, -2.461689, 3.647996, 1, 0, 0.972549, 1,
0.9651811, -2.636427, 2.838603, 1, 0, 0.9647059, 1,
0.9736086, 1.086803, -0.01948344, 1, 0, 0.9607843, 1,
0.9769792, 2.606666, -0.3706307, 1, 0, 0.9529412, 1,
0.9786049, -0.4950977, 2.093688, 1, 0, 0.9490196, 1,
0.9809174, 2.386119, -1.438943, 1, 0, 0.9411765, 1,
0.98141, 1.22763, 1.535972, 1, 0, 0.9372549, 1,
0.9817724, 1.215228, 0.1018964, 1, 0, 0.9294118, 1,
0.9881924, -1.303036, 3.732988, 1, 0, 0.9254902, 1,
0.9913102, -1.729869, 3.142381, 1, 0, 0.9176471, 1,
0.9970942, 0.4856468, 0.737711, 1, 0, 0.9137255, 1,
1.003407, 0.7408413, 0.4114266, 1, 0, 0.9058824, 1,
1.00684, 1.059362, 2.42768, 1, 0, 0.9019608, 1,
1.014667, -1.284298, 1.905395, 1, 0, 0.8941177, 1,
1.024915, -1.062421, 3.14733, 1, 0, 0.8862745, 1,
1.028301, -0.01279881, 3.228669, 1, 0, 0.8823529, 1,
1.029796, -0.2256124, 2.293821, 1, 0, 0.8745098, 1,
1.030632, 0.250158, -0.5139828, 1, 0, 0.8705882, 1,
1.042309, 1.06927, 1.362088, 1, 0, 0.8627451, 1,
1.042536, 1.017244, -0.8523867, 1, 0, 0.8588235, 1,
1.042919, -0.8976153, 1.901421, 1, 0, 0.8509804, 1,
1.04713, 0.4458101, 2.087674, 1, 0, 0.8470588, 1,
1.047305, 1.219227, 0.9708339, 1, 0, 0.8392157, 1,
1.060158, 0.6790797, 1.162755, 1, 0, 0.8352941, 1,
1.061092, -1.837536, 2.414113, 1, 0, 0.827451, 1,
1.063024, 0.5225534, 0.5899669, 1, 0, 0.8235294, 1,
1.0648, 0.437261, 2.897118, 1, 0, 0.8156863, 1,
1.065225, 0.1801018, 1.587193, 1, 0, 0.8117647, 1,
1.066108, 0.6057402, 0.1277404, 1, 0, 0.8039216, 1,
1.079753, 0.4275922, 1.979807, 1, 0, 0.7960784, 1,
1.081654, -1.864344, 2.809276, 1, 0, 0.7921569, 1,
1.082304, -0.9193655, 3.55875, 1, 0, 0.7843137, 1,
1.084487, 0.3705982, 1.317799, 1, 0, 0.7803922, 1,
1.087747, -1.217509, 2.947756, 1, 0, 0.772549, 1,
1.09036, -1.589006, 3.746239, 1, 0, 0.7686275, 1,
1.090944, -0.02220835, -0.6261615, 1, 0, 0.7607843, 1,
1.091365, 1.864175, 0.1044249, 1, 0, 0.7568628, 1,
1.098889, -1.48033, 2.323468, 1, 0, 0.7490196, 1,
1.100588, -0.191186, 0.0302844, 1, 0, 0.7450981, 1,
1.114859, -0.2284777, 1.964451, 1, 0, 0.7372549, 1,
1.121342, 0.882085, 1.887564, 1, 0, 0.7333333, 1,
1.128711, -0.6418294, 3.460369, 1, 0, 0.7254902, 1,
1.135873, -2.079012, 1.71118, 1, 0, 0.7215686, 1,
1.140276, -1.127855, 3.113978, 1, 0, 0.7137255, 1,
1.140975, 1.957335, 1.654958, 1, 0, 0.7098039, 1,
1.149406, 0.5108523, 1.979521, 1, 0, 0.7019608, 1,
1.151407, -0.1614331, 2.082417, 1, 0, 0.6941177, 1,
1.154629, -1.305347, 1.557143, 1, 0, 0.6901961, 1,
1.159406, -0.2520472, 1.912766, 1, 0, 0.682353, 1,
1.161537, 0.6210912, 2.509362, 1, 0, 0.6784314, 1,
1.167293, 0.5206175, 0.2636652, 1, 0, 0.6705883, 1,
1.168211, 0.7469076, 0.8268232, 1, 0, 0.6666667, 1,
1.171441, 0.3730652, 2.535617, 1, 0, 0.6588235, 1,
1.172048, 0.336979, -0.1124735, 1, 0, 0.654902, 1,
1.205773, 1.375356, 0.1895178, 1, 0, 0.6470588, 1,
1.207736, 0.2103489, 2.906807, 1, 0, 0.6431373, 1,
1.223065, 0.3774276, 0.8177518, 1, 0, 0.6352941, 1,
1.223606, 1.752814, 1.539841, 1, 0, 0.6313726, 1,
1.227572, 0.5450752, 2.045842, 1, 0, 0.6235294, 1,
1.228321, -2.109752, 3.582045, 1, 0, 0.6196079, 1,
1.228525, 1.176265, 1.203637, 1, 0, 0.6117647, 1,
1.235554, -0.9737835, 1.845144, 1, 0, 0.6078432, 1,
1.247132, -1.497246, 2.355671, 1, 0, 0.6, 1,
1.247855, 0.2417182, 1.086653, 1, 0, 0.5921569, 1,
1.254635, -1.988527, 3.985387, 1, 0, 0.5882353, 1,
1.259138, 0.2503549, 0.04287999, 1, 0, 0.5803922, 1,
1.269982, -1.438328, 2.143613, 1, 0, 0.5764706, 1,
1.273481, -1.729628, 4.264838, 1, 0, 0.5686275, 1,
1.27564, -0.4023081, 3.76467, 1, 0, 0.5647059, 1,
1.290391, 1.032201, -0.06642319, 1, 0, 0.5568628, 1,
1.298216, -0.7733828, 3.129928, 1, 0, 0.5529412, 1,
1.329132, 0.2912156, 1.141995, 1, 0, 0.5450981, 1,
1.332417, -0.2431694, 1.108739, 1, 0, 0.5411765, 1,
1.339697, 0.3017645, 2.221564, 1, 0, 0.5333334, 1,
1.343742, 1.048089, 1.11852, 1, 0, 0.5294118, 1,
1.347788, -0.3417112, 0.9281951, 1, 0, 0.5215687, 1,
1.348144, -2.067729, 2.76514, 1, 0, 0.5176471, 1,
1.350748, 1.433582, 0.5201304, 1, 0, 0.509804, 1,
1.354853, 0.1462391, 1.4558, 1, 0, 0.5058824, 1,
1.359225, -0.06532446, 1.672943, 1, 0, 0.4980392, 1,
1.359841, 0.6965925, 0.6891328, 1, 0, 0.4901961, 1,
1.368444, -0.1602113, 2.425085, 1, 0, 0.4862745, 1,
1.369728, 0.6634488, 0.4646825, 1, 0, 0.4784314, 1,
1.371301, -1.562738, 4.801413, 1, 0, 0.4745098, 1,
1.372046, -0.5598629, -0.1211108, 1, 0, 0.4666667, 1,
1.375074, -0.3679624, 1.151194, 1, 0, 0.4627451, 1,
1.385761, -0.1523608, 2.600419, 1, 0, 0.454902, 1,
1.399977, -0.91212, 2.192329, 1, 0, 0.4509804, 1,
1.403375, 1.150942, -0.9904583, 1, 0, 0.4431373, 1,
1.410952, -3.028106, 3.421738, 1, 0, 0.4392157, 1,
1.425707, -0.2099639, 3.414874, 1, 0, 0.4313726, 1,
1.435706, -0.2638035, 1.196697, 1, 0, 0.427451, 1,
1.439061, -0.766772, 4.300134, 1, 0, 0.4196078, 1,
1.446293, -0.04281662, 2.737559, 1, 0, 0.4156863, 1,
1.459506, 0.5671259, 2.407851, 1, 0, 0.4078431, 1,
1.460419, -0.4335082, 1.57202, 1, 0, 0.4039216, 1,
1.461005, 0.902975, 1.197342, 1, 0, 0.3960784, 1,
1.464224, 0.3460228, 3.576932, 1, 0, 0.3882353, 1,
1.487839, -0.1764398, 0.9196078, 1, 0, 0.3843137, 1,
1.504739, -0.1283581, 0.7162688, 1, 0, 0.3764706, 1,
1.50475, -0.1441315, 2.866745, 1, 0, 0.372549, 1,
1.525143, 0.2708121, 1.579483, 1, 0, 0.3647059, 1,
1.529106, -0.7465057, 3.933672, 1, 0, 0.3607843, 1,
1.541645, 0.5129561, 1.955443, 1, 0, 0.3529412, 1,
1.546484, 0.4968587, 1.271086, 1, 0, 0.3490196, 1,
1.550793, 0.7491655, 0.9610877, 1, 0, 0.3411765, 1,
1.55632, 1.290104, 1.559085, 1, 0, 0.3372549, 1,
1.572883, -0.5416347, 2.111774, 1, 0, 0.3294118, 1,
1.574984, 0.4976722, 1.789924, 1, 0, 0.3254902, 1,
1.581579, 1.046691, 2.875542, 1, 0, 0.3176471, 1,
1.597801, 0.4537667, 0.6547287, 1, 0, 0.3137255, 1,
1.598924, 0.03733468, 1.162045, 1, 0, 0.3058824, 1,
1.614512, 0.1859212, 2.204359, 1, 0, 0.2980392, 1,
1.626124, 1.035103, 2.104723, 1, 0, 0.2941177, 1,
1.633384, -0.07249406, 1.113675, 1, 0, 0.2862745, 1,
1.664896, -0.9122319, 1.543379, 1, 0, 0.282353, 1,
1.690498, 0.9823567, 1.046797, 1, 0, 0.2745098, 1,
1.691239, 1.153437, -0.6251655, 1, 0, 0.2705882, 1,
1.694529, 0.4540384, 1.192865, 1, 0, 0.2627451, 1,
1.701533, -0.3041307, 3.066727, 1, 0, 0.2588235, 1,
1.720085, -1.086137, 2.310471, 1, 0, 0.2509804, 1,
1.723763, 0.9903252, 1.204185, 1, 0, 0.2470588, 1,
1.746222, -0.6499448, 1.972809, 1, 0, 0.2392157, 1,
1.747865, 1.429762, 1.426926, 1, 0, 0.2352941, 1,
1.75139, 0.5058785, 1.542065, 1, 0, 0.227451, 1,
1.75172, 1.745735, 0.7729664, 1, 0, 0.2235294, 1,
1.76149, -0.4508191, 0.6700642, 1, 0, 0.2156863, 1,
1.790567, -2.053665, 3.263933, 1, 0, 0.2117647, 1,
1.807938, 2.445742, -0.6827387, 1, 0, 0.2039216, 1,
1.827667, -0.6957811, 2.691838, 1, 0, 0.1960784, 1,
1.848787, -1.952783, 3.67779, 1, 0, 0.1921569, 1,
1.876028, 0.9063644, 0.710506, 1, 0, 0.1843137, 1,
1.899128, -1.802078, 1.765316, 1, 0, 0.1803922, 1,
1.905552, 0.8041858, 1.186309, 1, 0, 0.172549, 1,
1.924454, 1.1356, 0.1556541, 1, 0, 0.1686275, 1,
1.951746, -0.5677415, 1.166215, 1, 0, 0.1607843, 1,
1.984179, -0.2330624, 2.3367, 1, 0, 0.1568628, 1,
1.999387, -2.052563, 2.097333, 1, 0, 0.1490196, 1,
2.015632, 0.1590788, -0.6832802, 1, 0, 0.145098, 1,
2.042597, -1.328135, 3.027653, 1, 0, 0.1372549, 1,
2.062917, 0.5339081, 2.06409, 1, 0, 0.1333333, 1,
2.070508, -0.80478, 1.852278, 1, 0, 0.1254902, 1,
2.071975, 0.6434381, 0.2300387, 1, 0, 0.1215686, 1,
2.07464, -0.09966882, 2.583589, 1, 0, 0.1137255, 1,
2.076704, -1.858347, 2.314112, 1, 0, 0.1098039, 1,
2.140806, -1.338477, 2.820727, 1, 0, 0.1019608, 1,
2.164276, 0.7688866, 2.61834, 1, 0, 0.09411765, 1,
2.174814, 0.002040011, 3.939875, 1, 0, 0.09019608, 1,
2.222899, -0.4655114, 2.824239, 1, 0, 0.08235294, 1,
2.232996, 0.2116983, 1.969464, 1, 0, 0.07843138, 1,
2.33354, -0.5439295, 1.875141, 1, 0, 0.07058824, 1,
2.348872, 1.401556, 1.193511, 1, 0, 0.06666667, 1,
2.34942, 1.142135, 1.206452, 1, 0, 0.05882353, 1,
2.416935, -1.341282, 0.07883885, 1, 0, 0.05490196, 1,
2.420127, -0.3652285, 2.213373, 1, 0, 0.04705882, 1,
2.469368, 0.2999268, 2.150786, 1, 0, 0.04313726, 1,
2.470324, 0.2561469, 0.5292177, 1, 0, 0.03529412, 1,
2.502657, -0.2959066, 2.846863, 1, 0, 0.03137255, 1,
2.543075, 0.2533479, 1.512583, 1, 0, 0.02352941, 1,
2.596873, -1.627522, 1.345534, 1, 0, 0.01960784, 1,
2.642787, -0.9899418, 1.368758, 1, 0, 0.01176471, 1,
2.983788, -1.134727, 1.934098, 1, 0, 0.007843138, 1
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
-0.2605526, -4.61014, -6.723979, 0, -0.5, 0.5, 0.5,
-0.2605526, -4.61014, -6.723979, 1, -0.5, 0.5, 0.5,
-0.2605526, -4.61014, -6.723979, 1, 1.5, 0.5, 0.5,
-0.2605526, -4.61014, -6.723979, 0, 1.5, 0.5, 0.5
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
-4.604725, 0.03062308, -6.723979, 0, -0.5, 0.5, 0.5,
-4.604725, 0.03062308, -6.723979, 1, -0.5, 0.5, 0.5,
-4.604725, 0.03062308, -6.723979, 1, 1.5, 0.5, 0.5,
-4.604725, 0.03062308, -6.723979, 0, 1.5, 0.5, 0.5
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
-4.604725, -4.61014, 0.3243921, 0, -0.5, 0.5, 0.5,
-4.604725, -4.61014, 0.3243921, 1, -0.5, 0.5, 0.5,
-4.604725, -4.61014, 0.3243921, 1, 1.5, 0.5, 0.5,
-4.604725, -4.61014, 0.3243921, 0, 1.5, 0.5, 0.5
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
-3, -3.539195, -5.097432,
2, -3.539195, -5.097432,
-3, -3.539195, -5.097432,
-3, -3.717685, -5.368523,
-2, -3.539195, -5.097432,
-2, -3.717685, -5.368523,
-1, -3.539195, -5.097432,
-1, -3.717685, -5.368523,
0, -3.539195, -5.097432,
0, -3.717685, -5.368523,
1, -3.539195, -5.097432,
1, -3.717685, -5.368523,
2, -3.539195, -5.097432,
2, -3.717685, -5.368523
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
-3, -4.074667, -5.910706, 0, -0.5, 0.5, 0.5,
-3, -4.074667, -5.910706, 1, -0.5, 0.5, 0.5,
-3, -4.074667, -5.910706, 1, 1.5, 0.5, 0.5,
-3, -4.074667, -5.910706, 0, 1.5, 0.5, 0.5,
-2, -4.074667, -5.910706, 0, -0.5, 0.5, 0.5,
-2, -4.074667, -5.910706, 1, -0.5, 0.5, 0.5,
-2, -4.074667, -5.910706, 1, 1.5, 0.5, 0.5,
-2, -4.074667, -5.910706, 0, 1.5, 0.5, 0.5,
-1, -4.074667, -5.910706, 0, -0.5, 0.5, 0.5,
-1, -4.074667, -5.910706, 1, -0.5, 0.5, 0.5,
-1, -4.074667, -5.910706, 1, 1.5, 0.5, 0.5,
-1, -4.074667, -5.910706, 0, 1.5, 0.5, 0.5,
0, -4.074667, -5.910706, 0, -0.5, 0.5, 0.5,
0, -4.074667, -5.910706, 1, -0.5, 0.5, 0.5,
0, -4.074667, -5.910706, 1, 1.5, 0.5, 0.5,
0, -4.074667, -5.910706, 0, 1.5, 0.5, 0.5,
1, -4.074667, -5.910706, 0, -0.5, 0.5, 0.5,
1, -4.074667, -5.910706, 1, -0.5, 0.5, 0.5,
1, -4.074667, -5.910706, 1, 1.5, 0.5, 0.5,
1, -4.074667, -5.910706, 0, 1.5, 0.5, 0.5,
2, -4.074667, -5.910706, 0, -0.5, 0.5, 0.5,
2, -4.074667, -5.910706, 1, -0.5, 0.5, 0.5,
2, -4.074667, -5.910706, 1, 1.5, 0.5, 0.5,
2, -4.074667, -5.910706, 0, 1.5, 0.5, 0.5
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
-3.602224, -3, -5.097432,
-3.602224, 3, -5.097432,
-3.602224, -3, -5.097432,
-3.769307, -3, -5.368523,
-3.602224, -2, -5.097432,
-3.769307, -2, -5.368523,
-3.602224, -1, -5.097432,
-3.769307, -1, -5.368523,
-3.602224, 0, -5.097432,
-3.769307, 0, -5.368523,
-3.602224, 1, -5.097432,
-3.769307, 1, -5.368523,
-3.602224, 2, -5.097432,
-3.769307, 2, -5.368523,
-3.602224, 3, -5.097432,
-3.769307, 3, -5.368523
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
-4.103475, -3, -5.910706, 0, -0.5, 0.5, 0.5,
-4.103475, -3, -5.910706, 1, -0.5, 0.5, 0.5,
-4.103475, -3, -5.910706, 1, 1.5, 0.5, 0.5,
-4.103475, -3, -5.910706, 0, 1.5, 0.5, 0.5,
-4.103475, -2, -5.910706, 0, -0.5, 0.5, 0.5,
-4.103475, -2, -5.910706, 1, -0.5, 0.5, 0.5,
-4.103475, -2, -5.910706, 1, 1.5, 0.5, 0.5,
-4.103475, -2, -5.910706, 0, 1.5, 0.5, 0.5,
-4.103475, -1, -5.910706, 0, -0.5, 0.5, 0.5,
-4.103475, -1, -5.910706, 1, -0.5, 0.5, 0.5,
-4.103475, -1, -5.910706, 1, 1.5, 0.5, 0.5,
-4.103475, -1, -5.910706, 0, 1.5, 0.5, 0.5,
-4.103475, 0, -5.910706, 0, -0.5, 0.5, 0.5,
-4.103475, 0, -5.910706, 1, -0.5, 0.5, 0.5,
-4.103475, 0, -5.910706, 1, 1.5, 0.5, 0.5,
-4.103475, 0, -5.910706, 0, 1.5, 0.5, 0.5,
-4.103475, 1, -5.910706, 0, -0.5, 0.5, 0.5,
-4.103475, 1, -5.910706, 1, -0.5, 0.5, 0.5,
-4.103475, 1, -5.910706, 1, 1.5, 0.5, 0.5,
-4.103475, 1, -5.910706, 0, 1.5, 0.5, 0.5,
-4.103475, 2, -5.910706, 0, -0.5, 0.5, 0.5,
-4.103475, 2, -5.910706, 1, -0.5, 0.5, 0.5,
-4.103475, 2, -5.910706, 1, 1.5, 0.5, 0.5,
-4.103475, 2, -5.910706, 0, 1.5, 0.5, 0.5,
-4.103475, 3, -5.910706, 0, -0.5, 0.5, 0.5,
-4.103475, 3, -5.910706, 1, -0.5, 0.5, 0.5,
-4.103475, 3, -5.910706, 1, 1.5, 0.5, 0.5,
-4.103475, 3, -5.910706, 0, 1.5, 0.5, 0.5
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
-3.602224, -3.539195, -4,
-3.602224, -3.539195, 4,
-3.602224, -3.539195, -4,
-3.769307, -3.717685, -4,
-3.602224, -3.539195, -2,
-3.769307, -3.717685, -2,
-3.602224, -3.539195, 0,
-3.769307, -3.717685, 0,
-3.602224, -3.539195, 2,
-3.769307, -3.717685, 2,
-3.602224, -3.539195, 4,
-3.769307, -3.717685, 4
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
-4.103475, -4.074667, -4, 0, -0.5, 0.5, 0.5,
-4.103475, -4.074667, -4, 1, -0.5, 0.5, 0.5,
-4.103475, -4.074667, -4, 1, 1.5, 0.5, 0.5,
-4.103475, -4.074667, -4, 0, 1.5, 0.5, 0.5,
-4.103475, -4.074667, -2, 0, -0.5, 0.5, 0.5,
-4.103475, -4.074667, -2, 1, -0.5, 0.5, 0.5,
-4.103475, -4.074667, -2, 1, 1.5, 0.5, 0.5,
-4.103475, -4.074667, -2, 0, 1.5, 0.5, 0.5,
-4.103475, -4.074667, 0, 0, -0.5, 0.5, 0.5,
-4.103475, -4.074667, 0, 1, -0.5, 0.5, 0.5,
-4.103475, -4.074667, 0, 1, 1.5, 0.5, 0.5,
-4.103475, -4.074667, 0, 0, 1.5, 0.5, 0.5,
-4.103475, -4.074667, 2, 0, -0.5, 0.5, 0.5,
-4.103475, -4.074667, 2, 1, -0.5, 0.5, 0.5,
-4.103475, -4.074667, 2, 1, 1.5, 0.5, 0.5,
-4.103475, -4.074667, 2, 0, 1.5, 0.5, 0.5,
-4.103475, -4.074667, 4, 0, -0.5, 0.5, 0.5,
-4.103475, -4.074667, 4, 1, -0.5, 0.5, 0.5,
-4.103475, -4.074667, 4, 1, 1.5, 0.5, 0.5,
-4.103475, -4.074667, 4, 0, 1.5, 0.5, 0.5
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
-3.602224, -3.539195, -5.097432,
-3.602224, 3.600441, -5.097432,
-3.602224, -3.539195, 5.746216,
-3.602224, 3.600441, 5.746216,
-3.602224, -3.539195, -5.097432,
-3.602224, -3.539195, 5.746216,
-3.602224, 3.600441, -5.097432,
-3.602224, 3.600441, 5.746216,
-3.602224, -3.539195, -5.097432,
3.081119, -3.539195, -5.097432,
-3.602224, -3.539195, 5.746216,
3.081119, -3.539195, 5.746216,
-3.602224, 3.600441, -5.097432,
3.081119, 3.600441, -5.097432,
-3.602224, 3.600441, 5.746216,
3.081119, 3.600441, 5.746216,
3.081119, -3.539195, -5.097432,
3.081119, 3.600441, -5.097432,
3.081119, -3.539195, 5.746216,
3.081119, 3.600441, 5.746216,
3.081119, -3.539195, -5.097432,
3.081119, -3.539195, 5.746216,
3.081119, 3.600441, -5.097432,
3.081119, 3.600441, 5.746216
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
var radius = 7.797326;
var distance = 34.69118;
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
mvMatrix.translate( 0.2605526, -0.03062308, -0.3243921 );
mvMatrix.scale( 1.261438, 1.18082, 0.777471 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.69118);
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
piperidine-1-carboth<-read.table("piperidine-1-carboth.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-piperidine-1-carboth$V2
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
```

```r
y<-piperidine-1-carboth$V3
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
```

```r
z<-piperidine-1-carboth$V4
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
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
-3.504894, 0.7443243, -1.99597, 0, 0, 1, 1, 1,
-3.174093, -0.455858, -0.4965911, 1, 0, 0, 1, 1,
-2.956387, -0.1927544, -2.550671, 1, 0, 0, 1, 1,
-2.861943, -0.5846611, -2.205112, 1, 0, 0, 1, 1,
-2.671, -1.791541, 0.5540605, 1, 0, 0, 1, 1,
-2.66291, -1.173605, -3.198162, 1, 0, 0, 1, 1,
-2.588115, -2.050879, -2.49244, 0, 0, 0, 1, 1,
-2.555635, -1.223717, -0.2212397, 0, 0, 0, 1, 1,
-2.527465, 0.8659615, -1.378436, 0, 0, 0, 1, 1,
-2.515101, 0.7564372, -2.298784, 0, 0, 0, 1, 1,
-2.513888, -1.325385, -2.472574, 0, 0, 0, 1, 1,
-2.463019, -0.2397422, -3.036393, 0, 0, 0, 1, 1,
-2.421766, -0.8546209, -3.062406, 0, 0, 0, 1, 1,
-2.407339, -0.2051409, -2.22998, 1, 1, 1, 1, 1,
-2.392042, 0.4432628, -1.493982, 1, 1, 1, 1, 1,
-2.339957, 1.462992, -1.214535, 1, 1, 1, 1, 1,
-2.2809, -0.7752511, -1.379416, 1, 1, 1, 1, 1,
-2.273539, 1.004356, -0.5391662, 1, 1, 1, 1, 1,
-2.269618, 0.6288473, -0.3114369, 1, 1, 1, 1, 1,
-2.215394, 0.5339025, -1.825951, 1, 1, 1, 1, 1,
-2.212737, 0.6444134, -1.35014, 1, 1, 1, 1, 1,
-2.122424, -0.517454, -1.250669, 1, 1, 1, 1, 1,
-2.00609, 1.282617, -0.1142552, 1, 1, 1, 1, 1,
-2.003708, -0.1074092, -3.104119, 1, 1, 1, 1, 1,
-1.993548, 0.3337013, -2.687124, 1, 1, 1, 1, 1,
-1.972745, -0.3399226, -2.281291, 1, 1, 1, 1, 1,
-1.960918, 2.49444, 0.09290373, 1, 1, 1, 1, 1,
-1.956734, 0.7896574, -0.2580593, 1, 1, 1, 1, 1,
-1.935197, -1.693878, -1.601106, 0, 0, 1, 1, 1,
-1.927516, 0.4326557, -1.311008, 1, 0, 0, 1, 1,
-1.923002, 0.09295745, -1.390399, 1, 0, 0, 1, 1,
-1.917634, 1.247143, -2.041354, 1, 0, 0, 1, 1,
-1.907738, -0.7493784, -1.116349, 1, 0, 0, 1, 1,
-1.879362, 1.937662, -0.7937262, 1, 0, 0, 1, 1,
-1.860344, -0.967494, -2.415248, 0, 0, 0, 1, 1,
-1.836756, -0.6171356, -2.083244, 0, 0, 0, 1, 1,
-1.810118, -0.7419468, -2.501285, 0, 0, 0, 1, 1,
-1.776978, -0.35956, -1.173656, 0, 0, 0, 1, 1,
-1.771926, -0.04981119, -2.458137, 0, 0, 0, 1, 1,
-1.764526, 0.4173587, -0.3650841, 0, 0, 0, 1, 1,
-1.763923, 0.9239234, -0.7527009, 0, 0, 0, 1, 1,
-1.763116, -1.892605, -2.073739, 1, 1, 1, 1, 1,
-1.736689, 0.1725566, -0.3865137, 1, 1, 1, 1, 1,
-1.682025, -0.4031731, -0.4428995, 1, 1, 1, 1, 1,
-1.667701, 0.01613699, -1.978698, 1, 1, 1, 1, 1,
-1.65746, 1.460603, 0.1395708, 1, 1, 1, 1, 1,
-1.642774, 0.2420503, -2.699907, 1, 1, 1, 1, 1,
-1.638287, -2.497513, -2.284811, 1, 1, 1, 1, 1,
-1.63551, 0.1166824, -2.811821, 1, 1, 1, 1, 1,
-1.625813, 0.6987161, 0.00947516, 1, 1, 1, 1, 1,
-1.603839, -0.2175778, -1.885851, 1, 1, 1, 1, 1,
-1.574023, -0.6513025, -1.708033, 1, 1, 1, 1, 1,
-1.569297, 3.242147, -1.364005, 1, 1, 1, 1, 1,
-1.528106, 1.853092, -0.9201019, 1, 1, 1, 1, 1,
-1.520739, 0.6072681, -0.8073235, 1, 1, 1, 1, 1,
-1.518544, 0.9019993, -0.5926152, 1, 1, 1, 1, 1,
-1.508822, -0.173255, -0.6397852, 0, 0, 1, 1, 1,
-1.496008, 0.4258935, -0.8939305, 1, 0, 0, 1, 1,
-1.478349, 0.6735329, -2.303058, 1, 0, 0, 1, 1,
-1.466081, -0.6744246, -3.044226, 1, 0, 0, 1, 1,
-1.461174, 0.1905883, -1.078693, 1, 0, 0, 1, 1,
-1.446971, 0.3030306, -0.6422377, 1, 0, 0, 1, 1,
-1.442136, 0.1794047, -2.206558, 0, 0, 0, 1, 1,
-1.429406, -1.187112, -3.349999, 0, 0, 0, 1, 1,
-1.422945, -1.858393, -3.686002, 0, 0, 0, 1, 1,
-1.422209, -1.281054, -1.407226, 0, 0, 0, 1, 1,
-1.393336, -0.2710846, -1.670487, 0, 0, 0, 1, 1,
-1.389909, -0.4488498, -2.161994, 0, 0, 0, 1, 1,
-1.388762, -1.174736, -1.39362, 0, 0, 0, 1, 1,
-1.387532, 0.03211276, -2.953899, 1, 1, 1, 1, 1,
-1.37425, 0.1320341, -1.300407, 1, 1, 1, 1, 1,
-1.369429, 1.447885, -1.970041, 1, 1, 1, 1, 1,
-1.368675, 1.059604, -0.5418459, 1, 1, 1, 1, 1,
-1.362076, 0.7159398, -1.198336, 1, 1, 1, 1, 1,
-1.358581, -0.04759037, -2.431734, 1, 1, 1, 1, 1,
-1.3462, 0.2847092, -1.638261, 1, 1, 1, 1, 1,
-1.345165, 0.4428343, -0.04106638, 1, 1, 1, 1, 1,
-1.338947, -1.582954, -2.314053, 1, 1, 1, 1, 1,
-1.336216, 0.2842829, -1.867645, 1, 1, 1, 1, 1,
-1.332502, 0.4459011, -0.1248749, 1, 1, 1, 1, 1,
-1.327618, -1.372832, -1.499769, 1, 1, 1, 1, 1,
-1.322604, 1.224258, -0.5253725, 1, 1, 1, 1, 1,
-1.297771, -0.4154062, -2.713346, 1, 1, 1, 1, 1,
-1.287094, -1.03116, -2.327644, 1, 1, 1, 1, 1,
-1.286107, 1.675519, -0.1410879, 0, 0, 1, 1, 1,
-1.280546, -0.4173817, -2.780043, 1, 0, 0, 1, 1,
-1.279524, 1.051998, 0.6131595, 1, 0, 0, 1, 1,
-1.273318, -1.509511, -0.3826101, 1, 0, 0, 1, 1,
-1.271989, -0.3042709, -2.513932, 1, 0, 0, 1, 1,
-1.269722, -1.322555, -3.989694, 1, 0, 0, 1, 1,
-1.267842, -0.2692845, -0.7920319, 0, 0, 0, 1, 1,
-1.264373, 1.102567, -2.181522, 0, 0, 0, 1, 1,
-1.262709, 1.321511, -0.06820417, 0, 0, 0, 1, 1,
-1.262409, -1.223433, -4.663746, 0, 0, 0, 1, 1,
-1.259563, 1.209088, -0.4541346, 0, 0, 0, 1, 1,
-1.251653, 2.216625, 1.774502, 0, 0, 0, 1, 1,
-1.232485, -3.435219, -3.036139, 0, 0, 0, 1, 1,
-1.231499, 0.1276377, -0.1339069, 1, 1, 1, 1, 1,
-1.230361, -0.07061058, -2.464359, 1, 1, 1, 1, 1,
-1.225978, -0.3372337, -1.413315, 1, 1, 1, 1, 1,
-1.225522, 0.3272969, 0.228377, 1, 1, 1, 1, 1,
-1.217121, 2.612992, 0.3370927, 1, 1, 1, 1, 1,
-1.214743, -0.3752715, -2.226997, 1, 1, 1, 1, 1,
-1.214742, 1.665842, 0.3007977, 1, 1, 1, 1, 1,
-1.209852, 1.128157, -1.132969, 1, 1, 1, 1, 1,
-1.206334, -0.785007, -1.213977, 1, 1, 1, 1, 1,
-1.205888, 0.8511047, -1.759367, 1, 1, 1, 1, 1,
-1.204994, 0.5619962, 0.296308, 1, 1, 1, 1, 1,
-1.200529, 0.8896981, -0.6609818, 1, 1, 1, 1, 1,
-1.193596, -0.998413, -3.459177, 1, 1, 1, 1, 1,
-1.189438, -1.361173, -1.481389, 1, 1, 1, 1, 1,
-1.169757, 0.9662223, 1.198987, 1, 1, 1, 1, 1,
-1.162481, 0.1226442, -1.94988, 0, 0, 1, 1, 1,
-1.162276, -0.04350321, -1.995139, 1, 0, 0, 1, 1,
-1.160915, -1.096909, -2.221611, 1, 0, 0, 1, 1,
-1.159503, -0.06935884, -2.525023, 1, 0, 0, 1, 1,
-1.156807, -0.4502419, -0.5038735, 1, 0, 0, 1, 1,
-1.15667, -0.7665454, -1.240773, 1, 0, 0, 1, 1,
-1.152518, 0.8978992, -1.934521, 0, 0, 0, 1, 1,
-1.149512, 0.6445146, -1.554091, 0, 0, 0, 1, 1,
-1.144211, -0.5178791, -1.266566, 0, 0, 0, 1, 1,
-1.142506, 0.04389178, -0.3914754, 0, 0, 0, 1, 1,
-1.138589, 0.5993716, -0.6090645, 0, 0, 0, 1, 1,
-1.138503, -0.1595537, 0.07176193, 0, 0, 0, 1, 1,
-1.128559, 0.2546132, -1.65883, 0, 0, 0, 1, 1,
-1.126328, -1.797628, -2.30178, 1, 1, 1, 1, 1,
-1.124223, -1.147121, -1.245559, 1, 1, 1, 1, 1,
-1.113144, -0.9262797, -3.474113, 1, 1, 1, 1, 1,
-1.112927, -2.234006, -3.327852, 1, 1, 1, 1, 1,
-1.108969, 0.3898793, -2.956891, 1, 1, 1, 1, 1,
-1.101429, 0.1699807, 0.2478604, 1, 1, 1, 1, 1,
-1.08799, 0.9756176, -0.5435734, 1, 1, 1, 1, 1,
-1.087609, -0.2927676, -1.714949, 1, 1, 1, 1, 1,
-1.084607, 0.3287638, -0.2878219, 1, 1, 1, 1, 1,
-1.080482, 0.8117051, -0.8716671, 1, 1, 1, 1, 1,
-1.077487, 0.3672756, 0.09992466, 1, 1, 1, 1, 1,
-1.076543, 0.5405283, -0.6025407, 1, 1, 1, 1, 1,
-1.064201, -1.878288, -3.066837, 1, 1, 1, 1, 1,
-1.058151, 2.481582, 1.119762, 1, 1, 1, 1, 1,
-1.057899, -0.003583542, -2.099775, 1, 1, 1, 1, 1,
-1.057046, -1.426886, -4.56872, 0, 0, 1, 1, 1,
-1.055687, 0.09278063, -0.7685661, 1, 0, 0, 1, 1,
-1.054281, 0.4957751, -0.7551, 1, 0, 0, 1, 1,
-1.050232, 1.062051, 0.9782121, 1, 0, 0, 1, 1,
-1.043448, 1.299699, -0.9622577, 1, 0, 0, 1, 1,
-1.041588, 0.6623585, -2.09632, 1, 0, 0, 1, 1,
-1.041215, -0.09774336, -1.923082, 0, 0, 0, 1, 1,
-1.040939, 0.3927465, -0.5032403, 0, 0, 0, 1, 1,
-1.034663, -0.8291665, -2.504018, 0, 0, 0, 1, 1,
-1.029597, 0.1615683, -2.236348, 0, 0, 0, 1, 1,
-1.026653, -1.580061, -1.758596, 0, 0, 0, 1, 1,
-1.025255, -0.2140669, -2.458584, 0, 0, 0, 1, 1,
-1.024219, -0.8567182, -2.233137, 0, 0, 0, 1, 1,
-1.023383, -1.131485, -3.55996, 1, 1, 1, 1, 1,
-1.01844, 1.903767, -0.06356235, 1, 1, 1, 1, 1,
-1.017926, 1.24601, -0.6062119, 1, 1, 1, 1, 1,
-1.013548, -0.2919329, -3.773062, 1, 1, 1, 1, 1,
-1.01279, -1.078141, -0.6590647, 1, 1, 1, 1, 1,
-1.012769, -1.28793, -2.22975, 1, 1, 1, 1, 1,
-1.007965, 1.263326, -0.3908028, 1, 1, 1, 1, 1,
-1.005566, 0.56964, 0.1578397, 1, 1, 1, 1, 1,
-1.004615, -0.2400942, -0.254825, 1, 1, 1, 1, 1,
-0.9934157, 0.1380401, -1.685117, 1, 1, 1, 1, 1,
-0.9929428, -0.6883844, -1.498968, 1, 1, 1, 1, 1,
-0.9916291, 0.1448883, -0.4948756, 1, 1, 1, 1, 1,
-0.9869148, -0.6158743, -0.3927088, 1, 1, 1, 1, 1,
-0.9862722, 0.8297729, -0.7129593, 1, 1, 1, 1, 1,
-0.9747751, -1.364208, -2.844234, 1, 1, 1, 1, 1,
-0.9718747, -0.335198, -2.892126, 0, 0, 1, 1, 1,
-0.9572036, -2.431009, -1.908599, 1, 0, 0, 1, 1,
-0.9563308, 0.4160318, -1.305174, 1, 0, 0, 1, 1,
-0.950686, -0.9410357, -2.313088, 1, 0, 0, 1, 1,
-0.9492098, 0.650921, 0.728458, 1, 0, 0, 1, 1,
-0.9477692, 1.795981, 1.711051, 1, 0, 0, 1, 1,
-0.9471023, 0.05575502, -1.330706, 0, 0, 0, 1, 1,
-0.9372686, -1.488514, -1.689879, 0, 0, 0, 1, 1,
-0.9323383, 0.08212735, -1.270269, 0, 0, 0, 1, 1,
-0.9303591, 0.5014343, -0.8489339, 0, 0, 0, 1, 1,
-0.9299421, 0.4773261, -0.949258, 0, 0, 0, 1, 1,
-0.9271383, -0.8311849, -2.106219, 0, 0, 0, 1, 1,
-0.9236971, -1.033108, -4.306207, 0, 0, 0, 1, 1,
-0.9187604, -2.091851, -1.909345, 1, 1, 1, 1, 1,
-0.9138498, 0.144348, -2.188147, 1, 1, 1, 1, 1,
-0.9124386, -0.8821841, -1.840748, 1, 1, 1, 1, 1,
-0.9107615, -0.7939115, -1.600594, 1, 1, 1, 1, 1,
-0.9011537, 2.034022, -0.02080757, 1, 1, 1, 1, 1,
-0.8996969, 0.586997, -1.253531, 1, 1, 1, 1, 1,
-0.8951397, 1.560072, -1.040789, 1, 1, 1, 1, 1,
-0.8925152, 0.5663287, -0.1190554, 1, 1, 1, 1, 1,
-0.8742785, 0.7242471, -0.7011243, 1, 1, 1, 1, 1,
-0.8673868, 0.6241092, 0.9640182, 1, 1, 1, 1, 1,
-0.8633415, -0.6908172, -1.015331, 1, 1, 1, 1, 1,
-0.8547296, 0.9423671, -1.790298, 1, 1, 1, 1, 1,
-0.8538132, 0.8336519, -0.3878446, 1, 1, 1, 1, 1,
-0.8534349, -0.2782306, -1.376469, 1, 1, 1, 1, 1,
-0.8513301, 0.594703, -0.4380898, 1, 1, 1, 1, 1,
-0.8462499, 0.184958, -1.766844, 0, 0, 1, 1, 1,
-0.843276, 0.2254958, -2.539346, 1, 0, 0, 1, 1,
-0.8362882, -1.378471, -2.141952, 1, 0, 0, 1, 1,
-0.8300768, -0.1722737, -3.437181, 1, 0, 0, 1, 1,
-0.8299001, -0.1062705, -2.566501, 1, 0, 0, 1, 1,
-0.825824, 0.8933305, 0.7575791, 1, 0, 0, 1, 1,
-0.8253406, -0.727029, -2.054132, 0, 0, 0, 1, 1,
-0.8189867, -0.6250982, -1.646019, 0, 0, 0, 1, 1,
-0.8182138, 0.2064827, -0.2958844, 0, 0, 0, 1, 1,
-0.8152089, 0.6391978, -2.952475, 0, 0, 0, 1, 1,
-0.8059565, 1.173064, -1.298344, 0, 0, 0, 1, 1,
-0.8014402, -1.699252, -4.136574, 0, 0, 0, 1, 1,
-0.7936869, 0.4899718, -1.262879, 0, 0, 0, 1, 1,
-0.7924094, 1.279534, 0.8469265, 1, 1, 1, 1, 1,
-0.7897828, 2.280509, -1.476921, 1, 1, 1, 1, 1,
-0.7894908, -2.450375, -3.127169, 1, 1, 1, 1, 1,
-0.7846161, 0.1280767, -2.185895, 1, 1, 1, 1, 1,
-0.7844689, -1.151019, -1.225994, 1, 1, 1, 1, 1,
-0.7822421, 0.3175669, -1.258133, 1, 1, 1, 1, 1,
-0.775776, -0.4980326, -2.195994, 1, 1, 1, 1, 1,
-0.7751907, 0.7680171, -1.171904, 1, 1, 1, 1, 1,
-0.7717364, -1.180133, -1.752149, 1, 1, 1, 1, 1,
-0.770955, 0.148799, -0.4400882, 1, 1, 1, 1, 1,
-0.7697546, 0.2268284, -0.7841616, 1, 1, 1, 1, 1,
-0.7673684, 0.2850488, -3.035891, 1, 1, 1, 1, 1,
-0.7665125, -2.190835, -3.672154, 1, 1, 1, 1, 1,
-0.7659598, 1.717009, -1.213738, 1, 1, 1, 1, 1,
-0.7649296, -0.2286531, -2.350238, 1, 1, 1, 1, 1,
-0.7589141, -0.382756, -1.145967, 0, 0, 1, 1, 1,
-0.7474184, 1.530185, 0.1159478, 1, 0, 0, 1, 1,
-0.7402182, 1.366678, 0.4455561, 1, 0, 0, 1, 1,
-0.73689, 1.219615, 0.701932, 1, 0, 0, 1, 1,
-0.7321477, 0.477017, -0.2866473, 1, 0, 0, 1, 1,
-0.7300991, -1.138929, -3.219056, 1, 0, 0, 1, 1,
-0.7256345, -0.04606638, -1.065838, 0, 0, 0, 1, 1,
-0.7251464, 0.7414367, -1.074351, 0, 0, 0, 1, 1,
-0.7244557, -0.6318966, -1.028637, 0, 0, 0, 1, 1,
-0.7215827, -1.448374, -2.127659, 0, 0, 0, 1, 1,
-0.7199275, 0.02541392, -1.33064, 0, 0, 0, 1, 1,
-0.7155318, -0.9482602, -2.0315, 0, 0, 0, 1, 1,
-0.7106518, 0.6662175, -1.791687, 0, 0, 0, 1, 1,
-0.7074031, -1.250349, -3.05036, 1, 1, 1, 1, 1,
-0.7016301, 1.592427, -0.4309869, 1, 1, 1, 1, 1,
-0.6827604, -0.4679371, -0.5959987, 1, 1, 1, 1, 1,
-0.6757649, 0.2322679, -0.882786, 1, 1, 1, 1, 1,
-0.6747088, 0.5022697, -1.413532, 1, 1, 1, 1, 1,
-0.6716772, -0.3998542, -2.758605, 1, 1, 1, 1, 1,
-0.6703745, 0.6555508, -0.6973253, 1, 1, 1, 1, 1,
-0.6678683, 1.655064, 1.259461, 1, 1, 1, 1, 1,
-0.6666316, 0.6695958, -1.520884, 1, 1, 1, 1, 1,
-0.6595581, -0.9940767, -1.680292, 1, 1, 1, 1, 1,
-0.6589184, -1.462564, -2.432574, 1, 1, 1, 1, 1,
-0.6584069, -0.2314923, -3.48151, 1, 1, 1, 1, 1,
-0.6559874, -1.151577, -1.58208, 1, 1, 1, 1, 1,
-0.6458042, 0.1927267, 0.6104012, 1, 1, 1, 1, 1,
-0.645659, 0.8734465, -0.7716174, 1, 1, 1, 1, 1,
-0.645101, 0.1850534, -0.6200367, 0, 0, 1, 1, 1,
-0.6424181, 0.245931, 0.5067248, 1, 0, 0, 1, 1,
-0.6395466, -1.493786, -1.738184, 1, 0, 0, 1, 1,
-0.6383564, -2.623724, -4.002212, 1, 0, 0, 1, 1,
-0.6332543, 0.6830186, 0.8566266, 1, 0, 0, 1, 1,
-0.6278996, 0.007640773, -0.9329737, 1, 0, 0, 1, 1,
-0.6267638, 0.2215323, -1.64895, 0, 0, 0, 1, 1,
-0.6252359, -1.314535, -2.921821, 0, 0, 0, 1, 1,
-0.6233563, 0.8709435, -0.7941128, 0, 0, 0, 1, 1,
-0.6193824, -0.5976607, -1.201318, 0, 0, 0, 1, 1,
-0.6152221, -0.9453061, -3.103589, 0, 0, 0, 1, 1,
-0.6137855, 1.102242, -2.288434, 0, 0, 0, 1, 1,
-0.6012064, -0.1194482, -1.039945, 0, 0, 0, 1, 1,
-0.5993345, -0.5945723, -2.899779, 1, 1, 1, 1, 1,
-0.5922464, 0.9192923, -1.422973, 1, 1, 1, 1, 1,
-0.5898584, -1.201245, -1.406323, 1, 1, 1, 1, 1,
-0.5873469, -2.065295, -2.913843, 1, 1, 1, 1, 1,
-0.5770877, -0.4930652, -2.928705, 1, 1, 1, 1, 1,
-0.5720347, -0.755871, -3.345135, 1, 1, 1, 1, 1,
-0.567008, 0.7052462, 1.547308, 1, 1, 1, 1, 1,
-0.5661623, 2.122434, 0.753475, 1, 1, 1, 1, 1,
-0.5658294, -0.008922902, -1.635605, 1, 1, 1, 1, 1,
-0.5656685, 0.01943029, -1.304942, 1, 1, 1, 1, 1,
-0.5654484, 0.9833351, -1.243511, 1, 1, 1, 1, 1,
-0.5654182, 0.5998346, -2.434767, 1, 1, 1, 1, 1,
-0.5614842, 0.6998498, -0.5331393, 1, 1, 1, 1, 1,
-0.5557455, 0.03944501, -0.8936123, 1, 1, 1, 1, 1,
-0.5537042, -1.043656, -2.174866, 1, 1, 1, 1, 1,
-0.5462203, 0.2981936, -1.959972, 0, 0, 1, 1, 1,
-0.5451525, 1.511254, 0.02498085, 1, 0, 0, 1, 1,
-0.5448017, 0.913954, 0.009167418, 1, 0, 0, 1, 1,
-0.5368223, -0.4345872, -0.7666876, 1, 0, 0, 1, 1,
-0.5352495, 0.7696764, -0.07639947, 1, 0, 0, 1, 1,
-0.5323384, -0.6359432, -2.717932, 1, 0, 0, 1, 1,
-0.5261461, 0.7288791, -0.5753114, 0, 0, 0, 1, 1,
-0.5254326, -0.3896252, -4.16602, 0, 0, 0, 1, 1,
-0.5239815, -0.2440339, -0.5216913, 0, 0, 0, 1, 1,
-0.5220539, -1.376983, -4.622008, 0, 0, 0, 1, 1,
-0.5215111, -0.3543991, -1.150926, 0, 0, 0, 1, 1,
-0.5207555, -0.1372393, -0.4226287, 0, 0, 0, 1, 1,
-0.5186112, 0.8544129, 0.7503853, 0, 0, 0, 1, 1,
-0.5163917, -0.587624, -4.618044, 1, 1, 1, 1, 1,
-0.5113373, -0.61625, -1.918879, 1, 1, 1, 1, 1,
-0.5040355, 1.420066, 0.388103, 1, 1, 1, 1, 1,
-0.4981382, -1.347831, -1.675381, 1, 1, 1, 1, 1,
-0.4970802, 0.9452824, -0.3372392, 1, 1, 1, 1, 1,
-0.4911994, 1.568303, -1.056467, 1, 1, 1, 1, 1,
-0.4864406, 0.6537053, -0.3979039, 1, 1, 1, 1, 1,
-0.4823588, -0.9700913, -3.082837, 1, 1, 1, 1, 1,
-0.4800958, -0.03230808, -3.085276, 1, 1, 1, 1, 1,
-0.4790426, 0.7203285, 0.3016919, 1, 1, 1, 1, 1,
-0.4762492, -1.636103, -1.409294, 1, 1, 1, 1, 1,
-0.4750513, -0.1821983, -2.080172, 1, 1, 1, 1, 1,
-0.4706858, 1.421339, 0.8793255, 1, 1, 1, 1, 1,
-0.4602103, -0.7466784, -4.888912, 1, 1, 1, 1, 1,
-0.4601401, 0.6083577, -1.41771, 1, 1, 1, 1, 1,
-0.4581855, 2.104784, 0.8033811, 0, 0, 1, 1, 1,
-0.4549943, 0.9245475, 0.4166157, 1, 0, 0, 1, 1,
-0.4496068, 0.5046669, -0.3483388, 1, 0, 0, 1, 1,
-0.4411085, 0.007997102, 1.336135, 1, 0, 0, 1, 1,
-0.4389066, -0.4897942, -3.698589, 1, 0, 0, 1, 1,
-0.4384676, -0.6521832, -1.13772, 1, 0, 0, 1, 1,
-0.4369435, -0.2560129, -1.509799, 0, 0, 0, 1, 1,
-0.4264434, 0.6574062, -1.759611, 0, 0, 0, 1, 1,
-0.4244414, 0.2670488, -1.915607, 0, 0, 0, 1, 1,
-0.4243232, 0.9908078, 1.32059, 0, 0, 0, 1, 1,
-0.4239263, -0.04322523, -2.105935, 0, 0, 0, 1, 1,
-0.4237259, 1.840395, 0.354091, 0, 0, 0, 1, 1,
-0.4228379, -0.4349316, -1.697397, 0, 0, 0, 1, 1,
-0.4219822, 0.1807847, 0.4575078, 1, 1, 1, 1, 1,
-0.4202543, -0.4775068, -2.588387, 1, 1, 1, 1, 1,
-0.4200633, -1.018863, -2.098123, 1, 1, 1, 1, 1,
-0.4175142, 0.7707769, -0.9064699, 1, 1, 1, 1, 1,
-0.4115458, 1.786388, 0.1885877, 1, 1, 1, 1, 1,
-0.4090622, -0.2626126, -1.712961, 1, 1, 1, 1, 1,
-0.4019442, -1.422212, -3.119162, 1, 1, 1, 1, 1,
-0.3989781, -0.9640073, -1.31876, 1, 1, 1, 1, 1,
-0.3937216, 3.496465, -1.178934, 1, 1, 1, 1, 1,
-0.393097, -2.339736, -1.756257, 1, 1, 1, 1, 1,
-0.3916993, -1.816733, -2.285473, 1, 1, 1, 1, 1,
-0.3898684, -0.4044409, -1.674815, 1, 1, 1, 1, 1,
-0.389063, -0.9978786, -2.331754, 1, 1, 1, 1, 1,
-0.387252, -1.273761, -3.117831, 1, 1, 1, 1, 1,
-0.3869477, -0.5256748, -2.496857, 1, 1, 1, 1, 1,
-0.3848555, -1.415443, -3.471208, 0, 0, 1, 1, 1,
-0.3835404, -0.3467456, -3.285892, 1, 0, 0, 1, 1,
-0.3770059, -0.7506794, -2.654747, 1, 0, 0, 1, 1,
-0.3766212, 0.2734688, 0.4018297, 1, 0, 0, 1, 1,
-0.3714778, 0.4054384, -1.225504, 1, 0, 0, 1, 1,
-0.3693817, 1.305391, -0.8831282, 1, 0, 0, 1, 1,
-0.3665519, -0.1498574, -2.679517, 0, 0, 0, 1, 1,
-0.3602801, -0.8284994, -1.927925, 0, 0, 0, 1, 1,
-0.3595041, 0.6673087, -0.2538342, 0, 0, 0, 1, 1,
-0.3556929, -0.5473124, -3.043925, 0, 0, 0, 1, 1,
-0.3502621, -2.500108, -3.204308, 0, 0, 0, 1, 1,
-0.3479066, -0.6246499, -2.17003, 0, 0, 0, 1, 1,
-0.3464252, 1.228872, 0.01406265, 0, 0, 0, 1, 1,
-0.3458378, 1.759842, -2.172649, 1, 1, 1, 1, 1,
-0.3447621, -0.08555252, -1.244705, 1, 1, 1, 1, 1,
-0.3445292, -0.8229444, -3.638649, 1, 1, 1, 1, 1,
-0.3437124, 0.3652215, -0.592887, 1, 1, 1, 1, 1,
-0.3429989, -1.326377, -1.970733, 1, 1, 1, 1, 1,
-0.34294, -0.7721508, -2.302911, 1, 1, 1, 1, 1,
-0.3396688, -1.051098, -2.180445, 1, 1, 1, 1, 1,
-0.3383821, -0.9064655, -1.157014, 1, 1, 1, 1, 1,
-0.3356959, -1.298137, -3.523533, 1, 1, 1, 1, 1,
-0.331784, -0.2649984, -3.031337, 1, 1, 1, 1, 1,
-0.33011, 0.233301, -0.9966143, 1, 1, 1, 1, 1,
-0.328445, 1.520757, 0.04141965, 1, 1, 1, 1, 1,
-0.3225805, 0.006285929, -0.6025195, 1, 1, 1, 1, 1,
-0.3200631, -0.4299428, -4.142057, 1, 1, 1, 1, 1,
-0.3193174, 0.6262548, -2.321212, 1, 1, 1, 1, 1,
-0.3182954, -1.231684, -1.969079, 0, 0, 1, 1, 1,
-0.3171144, 0.5129735, -1.314877, 1, 0, 0, 1, 1,
-0.3143069, -0.01150958, -0.01294586, 1, 0, 0, 1, 1,
-0.3098545, -0.3898227, -3.881855, 1, 0, 0, 1, 1,
-0.309472, -0.2212171, -1.997146, 1, 0, 0, 1, 1,
-0.3093008, 0.7760214, -0.7962393, 1, 0, 0, 1, 1,
-0.3065255, -0.05792147, -1.835793, 0, 0, 0, 1, 1,
-0.305593, -1.233631, -1.993908, 0, 0, 0, 1, 1,
-0.3041566, 0.1778417, -1.011381, 0, 0, 0, 1, 1,
-0.2981327, 1.032828, 0.6643188, 0, 0, 0, 1, 1,
-0.2948588, 0.5884782, 2.92258, 0, 0, 0, 1, 1,
-0.29451, -0.3644111, -1.123128, 0, 0, 0, 1, 1,
-0.2907794, 2.060193, -1.671574, 0, 0, 0, 1, 1,
-0.2894378, -1.330464, -2.048953, 1, 1, 1, 1, 1,
-0.286292, 1.245061, 0.3891973, 1, 1, 1, 1, 1,
-0.2862687, -0.7240682, -2.236956, 1, 1, 1, 1, 1,
-0.2710329, -0.7367387, -2.755621, 1, 1, 1, 1, 1,
-0.2684728, 0.3412477, -0.6292895, 1, 1, 1, 1, 1,
-0.2676951, -0.1792063, -4.170878, 1, 1, 1, 1, 1,
-0.2645085, -0.0244583, -2.86889, 1, 1, 1, 1, 1,
-0.2513818, -0.8596566, -2.872566, 1, 1, 1, 1, 1,
-0.2488523, 2.239913, -1.37381, 1, 1, 1, 1, 1,
-0.2437503, -0.5411286, -2.405758, 1, 1, 1, 1, 1,
-0.2426706, -0.6380616, -4.427661, 1, 1, 1, 1, 1,
-0.241171, -0.9309345, -2.095806, 1, 1, 1, 1, 1,
-0.2367556, -0.2983792, -2.623383, 1, 1, 1, 1, 1,
-0.2344311, -0.6912721, -2.374627, 1, 1, 1, 1, 1,
-0.2244913, 1.978049, 0.6919295, 1, 1, 1, 1, 1,
-0.2243119, 0.381866, -0.1273491, 0, 0, 1, 1, 1,
-0.2168444, 0.780154, -0.3849702, 1, 0, 0, 1, 1,
-0.2140088, 0.2826444, -1.377598, 1, 0, 0, 1, 1,
-0.2135111, 1.980538, -0.1297336, 1, 0, 0, 1, 1,
-0.2126955, -2.406001, -3.369984, 1, 0, 0, 1, 1,
-0.2108217, -1.449328, -4.939515, 1, 0, 0, 1, 1,
-0.2085183, 0.182068, -1.570696, 0, 0, 0, 1, 1,
-0.2030525, -0.9598187, -2.551474, 0, 0, 0, 1, 1,
-0.1943732, -1.199003, -4.588143, 0, 0, 0, 1, 1,
-0.1893762, 0.7350959, -0.9566472, 0, 0, 0, 1, 1,
-0.188382, -1.204097, -3.208025, 0, 0, 0, 1, 1,
-0.1881195, -0.07018584, -1.533009, 0, 0, 0, 1, 1,
-0.1854245, -0.3541155, -3.78273, 0, 0, 0, 1, 1,
-0.1844488, -1.508566, -3.835178, 1, 1, 1, 1, 1,
-0.1800877, 2.252959, -1.495911, 1, 1, 1, 1, 1,
-0.1782953, 0.4280347, 0.2745104, 1, 1, 1, 1, 1,
-0.1725042, -1.526598, -3.34397, 1, 1, 1, 1, 1,
-0.1707005, -0.3903074, -3.00217, 1, 1, 1, 1, 1,
-0.1689864, 2.419953, 0.0216675, 1, 1, 1, 1, 1,
-0.1641579, -0.8572261, -3.136434, 1, 1, 1, 1, 1,
-0.1640381, -0.6218642, -2.6422, 1, 1, 1, 1, 1,
-0.1615958, -2.59803, -2.718745, 1, 1, 1, 1, 1,
-0.159158, -0.5347272, -2.234813, 1, 1, 1, 1, 1,
-0.1571323, 0.1604806, 0.6149666, 1, 1, 1, 1, 1,
-0.1549797, 0.4980876, -0.6863962, 1, 1, 1, 1, 1,
-0.1532075, -1.614113, -1.146752, 1, 1, 1, 1, 1,
-0.1531877, -0.524587, -2.241307, 1, 1, 1, 1, 1,
-0.151198, 0.006741064, -1.306881, 1, 1, 1, 1, 1,
-0.1503692, 0.5170785, -2.313724, 0, 0, 1, 1, 1,
-0.14709, 0.9705111, 1.037052, 1, 0, 0, 1, 1,
-0.1451128, 0.4335268, 0.656152, 1, 0, 0, 1, 1,
-0.1449317, 0.302909, -0.2285152, 1, 0, 0, 1, 1,
-0.1436277, 0.8787504, 0.2745747, 1, 0, 0, 1, 1,
-0.1336579, -0.002222551, -1.656146, 1, 0, 0, 1, 1,
-0.1315616, -1.68991, -2.445217, 0, 0, 0, 1, 1,
-0.1301319, 1.763581, 0.9413004, 0, 0, 0, 1, 1,
-0.1289272, 0.03469573, -1.251222, 0, 0, 0, 1, 1,
-0.1220117, -1.0853, -1.978299, 0, 0, 0, 1, 1,
-0.1193006, -1.65393, -3.744404, 0, 0, 0, 1, 1,
-0.1171144, 1.329455, -0.2142796, 0, 0, 0, 1, 1,
-0.1110283, -0.9121357, -2.043056, 0, 0, 0, 1, 1,
-0.1091218, -1.522931, -2.533645, 1, 1, 1, 1, 1,
-0.1043327, 1.286988, 2.038318, 1, 1, 1, 1, 1,
-0.102248, 0.4703919, 0.7358751, 1, 1, 1, 1, 1,
-0.09926747, -0.9372129, -3.239605, 1, 1, 1, 1, 1,
-0.08947122, 1.036601, 0.1183427, 1, 1, 1, 1, 1,
-0.08912771, -0.01110111, -3.410989, 1, 1, 1, 1, 1,
-0.08639786, -1.712487, -2.363858, 1, 1, 1, 1, 1,
-0.08559798, 1.712957, -2.071749, 1, 1, 1, 1, 1,
-0.0849197, 1.568041, -0.9101481, 1, 1, 1, 1, 1,
-0.07987214, -1.70089, -2.299826, 1, 1, 1, 1, 1,
-0.07977022, 0.9065762, -0.3006037, 1, 1, 1, 1, 1,
-0.07574815, 2.111738, 0.1712897, 1, 1, 1, 1, 1,
-0.07518667, -0.6571972, -2.946561, 1, 1, 1, 1, 1,
-0.07489227, 1.199354, 0.03842194, 1, 1, 1, 1, 1,
-0.07147623, -0.08274138, -0.4978925, 1, 1, 1, 1, 1,
-0.06689808, 0.04888891, -0.8815404, 0, 0, 1, 1, 1,
-0.06683683, 1.625618, 1.876782, 1, 0, 0, 1, 1,
-0.06105665, 1.373681, -0.9900894, 1, 0, 0, 1, 1,
-0.05784446, 1.440142, 0.05616555, 1, 0, 0, 1, 1,
-0.05372813, -0.4313538, -3.593903, 1, 0, 0, 1, 1,
-0.05333529, -0.8856606, -0.9660305, 1, 0, 0, 1, 1,
-0.04601778, 0.3859289, 1.560616, 0, 0, 0, 1, 1,
-0.03638005, -0.7623414, -4.595459, 0, 0, 0, 1, 1,
-0.03572142, -0.4284025, -4.606359, 0, 0, 0, 1, 1,
-0.03533722, -0.8521474, -2.929807, 0, 0, 0, 1, 1,
-0.0341524, 0.05599871, -0.8319784, 0, 0, 0, 1, 1,
-0.03212352, -1.782314, -3.615056, 0, 0, 0, 1, 1,
-0.03088262, 0.2284593, -0.8195562, 0, 0, 0, 1, 1,
-0.030243, 0.3987919, -0.1089657, 1, 1, 1, 1, 1,
-0.02521452, 0.2002082, -1.522294, 1, 1, 1, 1, 1,
-0.02367877, -0.001776268, -1.42221, 1, 1, 1, 1, 1,
-0.02359972, -1.771145, -4.067894, 1, 1, 1, 1, 1,
-0.01956272, 0.1461179, 2.01582, 1, 1, 1, 1, 1,
-0.01857207, -1.023705, -2.570223, 1, 1, 1, 1, 1,
-0.01801837, -0.6331544, -1.735645, 1, 1, 1, 1, 1,
-0.01750633, -1.520435, -2.650874, 1, 1, 1, 1, 1,
-0.01679684, 1.667957, -0.08599896, 1, 1, 1, 1, 1,
-0.01299926, 1.118122, 0.7312939, 1, 1, 1, 1, 1,
-0.01291926, -0.1066961, -4.620549, 1, 1, 1, 1, 1,
-0.01175585, -1.431857, -2.417743, 1, 1, 1, 1, 1,
-0.01124219, 0.311849, 0.2832136, 1, 1, 1, 1, 1,
-0.01088323, 1.754254, 0.2310478, 1, 1, 1, 1, 1,
-0.01018396, 0.5909005, -0.5789856, 1, 1, 1, 1, 1,
-0.006543578, -1.448808, -4.936467, 0, 0, 1, 1, 1,
-0.004496745, 1.082943, -0.6633808, 1, 0, 0, 1, 1,
-0.002907112, -0.4184932, -2.211355, 1, 0, 0, 1, 1,
-0.002768548, 0.008144819, 0.4804023, 1, 0, 0, 1, 1,
-5.805877e-05, 0.5691751, 0.9723085, 1, 0, 0, 1, 1,
0.008806157, -0.2171902, 2.671306, 1, 0, 0, 1, 1,
0.009306952, -0.8383141, 2.843477, 0, 0, 0, 1, 1,
0.009390032, 0.5500094, -1.045104, 0, 0, 0, 1, 1,
0.009737892, 1.693882, 1.786322, 0, 0, 0, 1, 1,
0.01566684, -1.020041, 1.958266, 0, 0, 0, 1, 1,
0.01763763, -0.7959921, 0.7483708, 0, 0, 0, 1, 1,
0.01945216, -0.3583454, 3.251087, 0, 0, 0, 1, 1,
0.02633025, 0.9714314, 0.5223891, 0, 0, 0, 1, 1,
0.02912454, 0.4180293, 1.534116, 1, 1, 1, 1, 1,
0.03317643, -1.354198, 3.062037, 1, 1, 1, 1, 1,
0.03490682, 0.03195143, 1.069642, 1, 1, 1, 1, 1,
0.03495836, -0.8728227, 2.357736, 1, 1, 1, 1, 1,
0.03555397, -0.7315391, 2.896009, 1, 1, 1, 1, 1,
0.03755042, 0.46832, 2.005867, 1, 1, 1, 1, 1,
0.03855559, 1.03736, 0.5103062, 1, 1, 1, 1, 1,
0.03893153, 0.2329689, 1.533174, 1, 1, 1, 1, 1,
0.03912527, 0.1753928, 0.6825112, 1, 1, 1, 1, 1,
0.05102444, -0.02635739, 2.228268, 1, 1, 1, 1, 1,
0.05142865, 0.2011617, 1.130196, 1, 1, 1, 1, 1,
0.05152033, -1.7569, 3.057747, 1, 1, 1, 1, 1,
0.05177038, -1.370316, 2.361448, 1, 1, 1, 1, 1,
0.05362452, -0.9750026, 5.079698, 1, 1, 1, 1, 1,
0.054236, -0.6657283, 3.141607, 1, 1, 1, 1, 1,
0.05835221, 0.4390699, -0.9579586, 0, 0, 1, 1, 1,
0.05962313, -2.320714, 3.66054, 1, 0, 0, 1, 1,
0.06130612, -0.7135791, 2.970789, 1, 0, 0, 1, 1,
0.0650079, 0.7501453, -0.2698005, 1, 0, 0, 1, 1,
0.06620583, 2.042543, -0.06065889, 1, 0, 0, 1, 1,
0.06901727, -1.619431, 2.664453, 1, 0, 0, 1, 1,
0.0737929, 1.386476, 1.781347, 0, 0, 0, 1, 1,
0.07399163, 0.4937339, -0.4409983, 0, 0, 0, 1, 1,
0.07427971, -0.0661609, 2.333131, 0, 0, 0, 1, 1,
0.07525437, 0.1219727, 0.778842, 0, 0, 0, 1, 1,
0.07709847, -0.6406096, 3.723301, 0, 0, 0, 1, 1,
0.07883976, -0.1875792, 3.208746, 0, 0, 0, 1, 1,
0.08266345, -0.06685957, 1.197727, 0, 0, 0, 1, 1,
0.08290317, 0.06354677, 1.242247, 1, 1, 1, 1, 1,
0.08660343, -0.3670606, 3.07355, 1, 1, 1, 1, 1,
0.08855324, 0.8218839, 0.0660293, 1, 1, 1, 1, 1,
0.08893955, -1.126615, 2.223578, 1, 1, 1, 1, 1,
0.08901171, -0.03273362, 1.870492, 1, 1, 1, 1, 1,
0.08917952, -0.3610986, 3.017906, 1, 1, 1, 1, 1,
0.09209502, -0.04766684, 1.446466, 1, 1, 1, 1, 1,
0.09684771, -0.07812827, 2.665881, 1, 1, 1, 1, 1,
0.0997395, 1.267858, 0.9998905, 1, 1, 1, 1, 1,
0.1004436, 1.184621, 0.3540961, 1, 1, 1, 1, 1,
0.1054726, 0.08160555, 0.7352014, 1, 1, 1, 1, 1,
0.1098375, -1.232034, 3.992014, 1, 1, 1, 1, 1,
0.1116677, -1.212005, 1.323899, 1, 1, 1, 1, 1,
0.1260827, -1.576421, 2.916683, 1, 1, 1, 1, 1,
0.1313616, 0.1697309, 0.6566415, 1, 1, 1, 1, 1,
0.1345731, -0.05132886, 1.761899, 0, 0, 1, 1, 1,
0.1365238, 0.1871028, 1.141745, 1, 0, 0, 1, 1,
0.1404256, -0.6080636, 2.465673, 1, 0, 0, 1, 1,
0.1417698, -0.8539762, 2.45602, 1, 0, 0, 1, 1,
0.1439579, 0.5395323, -0.5144712, 1, 0, 0, 1, 1,
0.146318, 1.076223, -0.3602376, 1, 0, 0, 1, 1,
0.1475744, -0.9553363, 3.27844, 0, 0, 0, 1, 1,
0.1531549, -0.01246813, 1.611263, 0, 0, 0, 1, 1,
0.1535839, 0.04307887, 0.7703384, 0, 0, 0, 1, 1,
0.158993, -0.9530591, 2.832371, 0, 0, 0, 1, 1,
0.1604662, 0.4227903, 1.409269, 0, 0, 0, 1, 1,
0.1612185, 0.4265002, 0.8360723, 0, 0, 0, 1, 1,
0.1616863, 0.4978226, 1.442571, 0, 0, 0, 1, 1,
0.16321, -1.063952, 2.538784, 1, 1, 1, 1, 1,
0.164282, 1.667183, 1.331017, 1, 1, 1, 1, 1,
0.1667564, -0.6459902, 3.958568, 1, 1, 1, 1, 1,
0.1712389, 0.753876, -0.3557028, 1, 1, 1, 1, 1,
0.1777334, -0.6964086, 3.78063, 1, 1, 1, 1, 1,
0.1782763, 1.94595, -0.3074731, 1, 1, 1, 1, 1,
0.1798932, -1.153406, 5.588299, 1, 1, 1, 1, 1,
0.1806435, -0.2218366, 1.20201, 1, 1, 1, 1, 1,
0.181683, 0.2283571, 1.081407, 1, 1, 1, 1, 1,
0.1819699, 0.7537256, 1.682079, 1, 1, 1, 1, 1,
0.1819785, 0.3884782, -0.5390624, 1, 1, 1, 1, 1,
0.1863205, -1.039341, 4.100699, 1, 1, 1, 1, 1,
0.1868164, -0.5976829, 4.045155, 1, 1, 1, 1, 1,
0.1916605, 0.08807355, 2.039608, 1, 1, 1, 1, 1,
0.1922725, 1.600474, 2.746553, 1, 1, 1, 1, 1,
0.1949607, 0.7158757, -0.1268732, 0, 0, 1, 1, 1,
0.1956974, 0.9990831, 1.525944, 1, 0, 0, 1, 1,
0.1983925, -0.3860626, 0.5617322, 1, 0, 0, 1, 1,
0.2044097, -0.3566625, 3.222311, 1, 0, 0, 1, 1,
0.2064767, 0.1727842, 0.6658536, 1, 0, 0, 1, 1,
0.2072722, -1.741267, 1.835649, 1, 0, 0, 1, 1,
0.2147211, 1.94102, 0.2175484, 0, 0, 0, 1, 1,
0.2160386, 0.1659719, 1.150447, 0, 0, 0, 1, 1,
0.2175079, -0.6934264, 3.924414, 0, 0, 0, 1, 1,
0.2218559, -0.06805959, 1.419606, 0, 0, 0, 1, 1,
0.2221098, -2.944145, 2.606143, 0, 0, 0, 1, 1,
0.2230565, -0.4007665, 2.539613, 0, 0, 0, 1, 1,
0.223148, -0.7885804, 3.29963, 0, 0, 0, 1, 1,
0.224346, -0.9591151, 1.070472, 1, 1, 1, 1, 1,
0.2246025, 0.2190438, 1.335208, 1, 1, 1, 1, 1,
0.2256562, 0.1730083, 1.853804, 1, 1, 1, 1, 1,
0.225795, 1.049397, -0.5641583, 1, 1, 1, 1, 1,
0.2278795, -0.4716338, 4.136539, 1, 1, 1, 1, 1,
0.2283433, -0.5539116, 1.449742, 1, 1, 1, 1, 1,
0.2324395, -0.9095827, 2.640471, 1, 1, 1, 1, 1,
0.2341758, -2.344021, 3.423483, 1, 1, 1, 1, 1,
0.2357181, -0.9281225, 4.127343, 1, 1, 1, 1, 1,
0.2391772, 0.563286, -0.3253552, 1, 1, 1, 1, 1,
0.2425342, 0.04777313, 1.102273, 1, 1, 1, 1, 1,
0.2425472, 0.5919864, 0.8049474, 1, 1, 1, 1, 1,
0.243637, 0.6781335, 1.212045, 1, 1, 1, 1, 1,
0.2439633, -0.8340088, 2.20417, 1, 1, 1, 1, 1,
0.2456033, -0.7519892, 3.135908, 1, 1, 1, 1, 1,
0.246143, -0.811649, 2.665886, 0, 0, 1, 1, 1,
0.2467278, 0.03833871, 2.482821, 1, 0, 0, 1, 1,
0.2488425, -0.4656567, 4.404177, 1, 0, 0, 1, 1,
0.2496734, 0.7123576, 0.09964973, 1, 0, 0, 1, 1,
0.2607829, 0.1055449, 1.485684, 1, 0, 0, 1, 1,
0.2612921, -0.6298625, 2.448743, 1, 0, 0, 1, 1,
0.261856, -0.8430431, 2.357854, 0, 0, 0, 1, 1,
0.2619116, -2.488182, 3.588252, 0, 0, 0, 1, 1,
0.2627478, -0.2788025, 3.361157, 0, 0, 0, 1, 1,
0.2666975, -0.4429157, 2.407474, 0, 0, 0, 1, 1,
0.2676126, 0.4274366, 1.463922, 0, 0, 0, 1, 1,
0.2676412, 0.5966206, 3.538806, 0, 0, 0, 1, 1,
0.2697819, -1.243376, 1.651729, 0, 0, 0, 1, 1,
0.2737512, 0.08813724, 1.149031, 1, 1, 1, 1, 1,
0.2762576, 0.435287, 2.07084, 1, 1, 1, 1, 1,
0.2792776, -0.2721372, 1.91163, 1, 1, 1, 1, 1,
0.28075, 1.466748, 0.9838324, 1, 1, 1, 1, 1,
0.2808085, 0.01877774, 1.312803, 1, 1, 1, 1, 1,
0.2827387, 1.686516, -0.05661899, 1, 1, 1, 1, 1,
0.2834364, 1.970981, 0.8614785, 1, 1, 1, 1, 1,
0.2858626, 1.414931, 0.5793149, 1, 1, 1, 1, 1,
0.2901244, 0.9108267, -0.2610923, 1, 1, 1, 1, 1,
0.2989494, 0.3037521, 0.87195, 1, 1, 1, 1, 1,
0.2994147, -0.9647877, 2.014671, 1, 1, 1, 1, 1,
0.3019261, -0.8072454, 3.768113, 1, 1, 1, 1, 1,
0.3034308, 0.2281526, -1.668683, 1, 1, 1, 1, 1,
0.3037645, -0.9001032, 3.016681, 1, 1, 1, 1, 1,
0.3047727, 0.2693034, 2.423482, 1, 1, 1, 1, 1,
0.3118847, -0.3103167, 1.85421, 0, 0, 1, 1, 1,
0.3147848, -0.3214222, 2.088923, 1, 0, 0, 1, 1,
0.3161695, 0.07089383, 0.7263263, 1, 0, 0, 1, 1,
0.3192793, 1.437721, 0.9078736, 1, 0, 0, 1, 1,
0.3193597, 0.5462953, 1.218168, 1, 0, 0, 1, 1,
0.3200439, 0.1881096, 1.870431, 1, 0, 0, 1, 1,
0.3237626, -0.2164806, 3.350786, 0, 0, 0, 1, 1,
0.3250216, 0.8185564, 1.601556, 0, 0, 0, 1, 1,
0.3290597, 0.3584336, 1.662379, 0, 0, 0, 1, 1,
0.3312127, -1.550368, 3.513942, 0, 0, 0, 1, 1,
0.3325792, -1.148893, 2.402945, 0, 0, 0, 1, 1,
0.3369303, 0.1364588, 3.422156, 0, 0, 0, 1, 1,
0.3374099, 0.417034, 0.7768819, 0, 0, 0, 1, 1,
0.3592261, -0.07714532, 3.841149, 1, 1, 1, 1, 1,
0.3613137, -1.39458, 2.327743, 1, 1, 1, 1, 1,
0.3627723, -1.165002, 3.97596, 1, 1, 1, 1, 1,
0.3647274, -0.4702283, 3.107639, 1, 1, 1, 1, 1,
0.3682326, -0.4660094, 2.630396, 1, 1, 1, 1, 1,
0.370421, -0.4598089, 2.433926, 1, 1, 1, 1, 1,
0.3712063, -0.4123888, 2.992787, 1, 1, 1, 1, 1,
0.380334, 1.753022, 0.04524224, 1, 1, 1, 1, 1,
0.3805119, 1.307753, -2.164574, 1, 1, 1, 1, 1,
0.3810816, 0.02985737, 1.58413, 1, 1, 1, 1, 1,
0.3828102, -1.651704, 3.258892, 1, 1, 1, 1, 1,
0.3845516, -0.1783554, 1.306353, 1, 1, 1, 1, 1,
0.3852724, -0.4789884, 1.951979, 1, 1, 1, 1, 1,
0.3884158, -1.236344, 4.011079, 1, 1, 1, 1, 1,
0.3897065, 1.89044, 0.9253514, 1, 1, 1, 1, 1,
0.3921956, 0.08389065, 1.88682, 0, 0, 1, 1, 1,
0.3939832, 1.867482, 2.389298, 1, 0, 0, 1, 1,
0.3947503, -1.251011, 3.449417, 1, 0, 0, 1, 1,
0.3951322, 0.4849138, 1.283152, 1, 0, 0, 1, 1,
0.3960931, 0.3671678, 0.2051874, 1, 0, 0, 1, 1,
0.3970497, 0.3863922, -0.9615817, 1, 0, 0, 1, 1,
0.4008979, 1.791678, -0.4528398, 0, 0, 0, 1, 1,
0.4110183, -1.608382, 2.289386, 0, 0, 0, 1, 1,
0.4113862, 0.7167782, 0.9061785, 0, 0, 0, 1, 1,
0.4114226, -0.4602822, 2.829716, 0, 0, 0, 1, 1,
0.4199267, 0.5632575, -0.4192113, 0, 0, 0, 1, 1,
0.4233168, -0.2857427, 1.587727, 0, 0, 0, 1, 1,
0.4251994, 1.035296, 0.1293135, 0, 0, 0, 1, 1,
0.42931, -1.381571, 3.172015, 1, 1, 1, 1, 1,
0.4309915, 1.257333, 0.5463285, 1, 1, 1, 1, 1,
0.4311986, 0.06290437, 0.4605249, 1, 1, 1, 1, 1,
0.434717, -0.4080785, 2.406865, 1, 1, 1, 1, 1,
0.4399248, 0.6668697, -0.6874874, 1, 1, 1, 1, 1,
0.4432041, -1.049643, 3.24188, 1, 1, 1, 1, 1,
0.4448718, 0.6644707, 0.1172668, 1, 1, 1, 1, 1,
0.4463682, 1.030022, 1.76675, 1, 1, 1, 1, 1,
0.4484922, -0.1358625, 1.299429, 1, 1, 1, 1, 1,
0.4505726, 1.16105, -0.2048991, 1, 1, 1, 1, 1,
0.4508995, -0.1012521, 1.519412, 1, 1, 1, 1, 1,
0.4516575, 1.515562, 1.849583, 1, 1, 1, 1, 1,
0.4529184, 1.00566, -1.746467, 1, 1, 1, 1, 1,
0.4533783, 0.05596361, 2.904469, 1, 1, 1, 1, 1,
0.4583434, -0.980864, 2.193301, 1, 1, 1, 1, 1,
0.4599038, -0.1152489, 1.768037, 0, 0, 1, 1, 1,
0.4639668, -1.412201, 4.838609, 1, 0, 0, 1, 1,
0.4665692, 1.232565, 0.143686, 1, 0, 0, 1, 1,
0.4685468, -1.086217, 2.920094, 1, 0, 0, 1, 1,
0.4710568, 1.250408, -0.354271, 1, 0, 0, 1, 1,
0.4718873, 0.5521343, -0.6316298, 1, 0, 0, 1, 1,
0.4753191, -0.8864454, 1.43764, 0, 0, 0, 1, 1,
0.4760291, 1.99826, 0.1679782, 0, 0, 0, 1, 1,
0.4769955, -2.295534, 3.512897, 0, 0, 0, 1, 1,
0.4819186, 0.6258878, 0.4782164, 0, 0, 0, 1, 1,
0.4850522, -0.5848845, 4.371102, 0, 0, 0, 1, 1,
0.4855372, 0.3027752, 0.7803763, 0, 0, 0, 1, 1,
0.4889921, -0.7559096, 3.03028, 0, 0, 0, 1, 1,
0.4892811, -0.9793722, 2.478125, 1, 1, 1, 1, 1,
0.4953747, 0.5066069, 1.285722, 1, 1, 1, 1, 1,
0.4956231, -0.414046, 2.453399, 1, 1, 1, 1, 1,
0.4985841, -1.763271, 3.999829, 1, 1, 1, 1, 1,
0.4990646, -0.8363101, 2.730732, 1, 1, 1, 1, 1,
0.5005758, 0.30825, 0.7498047, 1, 1, 1, 1, 1,
0.5015708, 0.7530921, 1.546527, 1, 1, 1, 1, 1,
0.5019146, -0.5482487, 2.670152, 1, 1, 1, 1, 1,
0.5040787, 0.2619465, 1.477472, 1, 1, 1, 1, 1,
0.5049795, 0.9711632, 0.6709215, 1, 1, 1, 1, 1,
0.5075772, 1.107937, 0.1739684, 1, 1, 1, 1, 1,
0.5096887, -0.1333707, 1.053415, 1, 1, 1, 1, 1,
0.5101814, -0.7057037, 2.36424, 1, 1, 1, 1, 1,
0.5123463, 1.379759, -1.232831, 1, 1, 1, 1, 1,
0.5139115, 0.436514, 1.070641, 1, 1, 1, 1, 1,
0.5142097, 0.6019512, -0.5773401, 0, 0, 1, 1, 1,
0.5142962, 0.6087938, 0.5708956, 1, 0, 0, 1, 1,
0.5178843, -0.3026553, 2.503489, 1, 0, 0, 1, 1,
0.5197194, 0.120823, 0.5034987, 1, 0, 0, 1, 1,
0.5216177, -0.3253453, 2.736871, 1, 0, 0, 1, 1,
0.5218052, 0.6729958, 1.219051, 1, 0, 0, 1, 1,
0.5221829, -0.9093132, 3.745736, 0, 0, 0, 1, 1,
0.5231987, 1.143442, 1.122074, 0, 0, 0, 1, 1,
0.5252646, 1.563337, -0.2077724, 0, 0, 0, 1, 1,
0.5315703, -2.934195, 4.005148, 0, 0, 0, 1, 1,
0.5343066, 0.4267178, 1.351625, 0, 0, 0, 1, 1,
0.5369316, 1.502899, -0.0400263, 0, 0, 0, 1, 1,
0.5382094, 0.01020006, 0.8680379, 0, 0, 0, 1, 1,
0.5415405, -0.3716163, 2.893772, 1, 1, 1, 1, 1,
0.5446295, -0.971284, 3.551463, 1, 1, 1, 1, 1,
0.54972, -0.08073609, 3.706078, 1, 1, 1, 1, 1,
0.5505529, 0.2075358, 1.263335, 1, 1, 1, 1, 1,
0.556967, 1.236356, 0.6283131, 1, 1, 1, 1, 1,
0.5573574, -0.1741598, 2.467164, 1, 1, 1, 1, 1,
0.5618604, -1.148051, 4.816509, 1, 1, 1, 1, 1,
0.5630225, -0.07229998, 2.429441, 1, 1, 1, 1, 1,
0.5662094, -0.214918, 2.031645, 1, 1, 1, 1, 1,
0.5669805, 0.89193, 0.2803679, 1, 1, 1, 1, 1,
0.5677733, -0.6749075, 2.047764, 1, 1, 1, 1, 1,
0.5776999, -0.446246, 3.274797, 1, 1, 1, 1, 1,
0.5821749, -0.7302209, 2.759201, 1, 1, 1, 1, 1,
0.5890226, -0.5276425, 3.395625, 1, 1, 1, 1, 1,
0.5891994, -0.5639256, 1.617477, 1, 1, 1, 1, 1,
0.5978062, -0.5253372, 1.98602, 0, 0, 1, 1, 1,
0.6014719, 0.4016198, 1.090109, 1, 0, 0, 1, 1,
0.6064994, 0.2776264, 0.5538871, 1, 0, 0, 1, 1,
0.6082984, 1.074596, 0.01107083, 1, 0, 0, 1, 1,
0.6100144, -0.3657269, 3.350904, 1, 0, 0, 1, 1,
0.6146914, 1.295029, 1.102507, 1, 0, 0, 1, 1,
0.6179018, 0.4160729, 1.771747, 0, 0, 0, 1, 1,
0.619533, -0.8177128, 1.197261, 0, 0, 0, 1, 1,
0.6224409, -0.1893749, 1.709504, 0, 0, 0, 1, 1,
0.6253218, 1.602989, 1.151442, 0, 0, 0, 1, 1,
0.6270773, 0.5860516, 1.076569, 0, 0, 0, 1, 1,
0.6285487, 0.3143506, 2.008396, 0, 0, 0, 1, 1,
0.6307447, 0.2222057, 1.693357, 0, 0, 0, 1, 1,
0.6321954, -0.1496102, 1.399355, 1, 1, 1, 1, 1,
0.6408002, 0.02286397, 1.903147, 1, 1, 1, 1, 1,
0.6440657, -0.8924322, 3.500777, 1, 1, 1, 1, 1,
0.6472136, -0.6641479, 3.355636, 1, 1, 1, 1, 1,
0.6480506, -0.5175011, 1.89814, 1, 1, 1, 1, 1,
0.6500419, 0.3941549, 0.4946901, 1, 1, 1, 1, 1,
0.6503838, 0.4176554, -0.4485399, 1, 1, 1, 1, 1,
0.6525581, -0.6221946, 0.6640276, 1, 1, 1, 1, 1,
0.6543635, -0.7455522, 2.272645, 1, 1, 1, 1, 1,
0.6637818, -0.8833622, 2.446757, 1, 1, 1, 1, 1,
0.6652229, 1.078257, 0.5797601, 1, 1, 1, 1, 1,
0.6688088, -1.21849, 3.62466, 1, 1, 1, 1, 1,
0.6749008, 1.454773, 0.5563992, 1, 1, 1, 1, 1,
0.6759031, -0.5831026, 1.360928, 1, 1, 1, 1, 1,
0.6823097, -0.1636955, 1.940756, 1, 1, 1, 1, 1,
0.6831082, 2.046742, 0.9678279, 0, 0, 1, 1, 1,
0.6913882, -1.65852, 3.903031, 1, 0, 0, 1, 1,
0.6921005, 0.5373501, 0.850181, 1, 0, 0, 1, 1,
0.7003239, 0.37203, 1.547692, 1, 0, 0, 1, 1,
0.7015798, 1.0504, 0.1735613, 1, 0, 0, 1, 1,
0.7035959, 2.112003, 1.11982, 1, 0, 0, 1, 1,
0.7070345, -0.132143, 1.540858, 0, 0, 0, 1, 1,
0.7090757, -0.9060376, 2.513445, 0, 0, 0, 1, 1,
0.7134258, 0.979028, 0.1008159, 0, 0, 0, 1, 1,
0.7149878, -0.3955015, 2.587809, 0, 0, 0, 1, 1,
0.7163334, -0.5001678, 2.037709, 0, 0, 0, 1, 1,
0.725682, 1.55805, 0.7395285, 0, 0, 0, 1, 1,
0.7316323, 1.071611, -0.9353194, 0, 0, 0, 1, 1,
0.7376977, -0.2936299, -0.04789188, 1, 1, 1, 1, 1,
0.7394348, -0.7795807, 3.642122, 1, 1, 1, 1, 1,
0.7421778, 0.9506579, -0.5907311, 1, 1, 1, 1, 1,
0.7474949, 0.4166705, 1.172207, 1, 1, 1, 1, 1,
0.7503769, -1.035931, 3.073982, 1, 1, 1, 1, 1,
0.7556426, -0.4422998, 0.4658056, 1, 1, 1, 1, 1,
0.7559381, 0.5344951, 0.7545565, 1, 1, 1, 1, 1,
0.7567975, -1.732772, 2.899506, 1, 1, 1, 1, 1,
0.7570034, 1.602685, 0.829994, 1, 1, 1, 1, 1,
0.7706898, -0.6729749, 1.67683, 1, 1, 1, 1, 1,
0.7712328, -0.02717801, 1.595531, 1, 1, 1, 1, 1,
0.7733985, -0.4329599, 2.262293, 1, 1, 1, 1, 1,
0.7735407, 0.2225575, 0.8992624, 1, 1, 1, 1, 1,
0.7758742, -0.1038702, 2.039083, 1, 1, 1, 1, 1,
0.7811677, 0.5662483, -0.258254, 1, 1, 1, 1, 1,
0.7816169, -0.02803377, 3.023941, 0, 0, 1, 1, 1,
0.7941908, 2.083995, -0.7002995, 1, 0, 0, 1, 1,
0.7948471, 0.7392985, 1.767819, 1, 0, 0, 1, 1,
0.7952828, -1.221171, 3.442929, 1, 0, 0, 1, 1,
0.8001792, 0.4129039, 1.585283, 1, 0, 0, 1, 1,
0.8012179, -0.7663889, 0.3753228, 1, 0, 0, 1, 1,
0.8046773, -1.281418, 3.423692, 0, 0, 0, 1, 1,
0.8055937, 0.4987226, 1.084362, 0, 0, 0, 1, 1,
0.8063457, 0.4433922, 0.6286318, 0, 0, 0, 1, 1,
0.8074122, 0.7494, 1.567301, 0, 0, 0, 1, 1,
0.8084358, -1.147634, 1.018138, 0, 0, 0, 1, 1,
0.8102568, -0.7436962, 1.945385, 0, 0, 0, 1, 1,
0.8163416, 1.575567, 1.434358, 0, 0, 0, 1, 1,
0.8190539, -0.2674094, 2.011959, 1, 1, 1, 1, 1,
0.8244643, 0.327425, 0.9843907, 1, 1, 1, 1, 1,
0.8271164, -1.152072, 2.923725, 1, 1, 1, 1, 1,
0.828732, 0.4631695, 2.549443, 1, 1, 1, 1, 1,
0.8315482, 2.140402, 1.940561, 1, 1, 1, 1, 1,
0.8320585, 0.2912105, 2.134984, 1, 1, 1, 1, 1,
0.832696, -1.136766, 2.763508, 1, 1, 1, 1, 1,
0.8343149, -0.1250819, 1.020106, 1, 1, 1, 1, 1,
0.8346912, -0.0307959, 1.516675, 1, 1, 1, 1, 1,
0.8377308, 1.196303, -1.068143, 1, 1, 1, 1, 1,
0.8401724, 0.1457294, 1.586334, 1, 1, 1, 1, 1,
0.8477187, -0.7195433, 0.6590263, 1, 1, 1, 1, 1,
0.8485799, -1.530357, 3.566738, 1, 1, 1, 1, 1,
0.8491257, -0.6640743, 1.264732, 1, 1, 1, 1, 1,
0.8569893, 0.7629584, 0.6853676, 1, 1, 1, 1, 1,
0.865407, -1.502747, 2.463352, 0, 0, 1, 1, 1,
0.8657764, -1.006358, 1.210128, 1, 0, 0, 1, 1,
0.8682603, -0.3543653, 2.16964, 1, 0, 0, 1, 1,
0.87133, -0.3500981, 1.060352, 1, 0, 0, 1, 1,
0.8773223, -1.992238, 3.206478, 1, 0, 0, 1, 1,
0.8786002, 1.182947, 1.057768, 1, 0, 0, 1, 1,
0.8819584, -0.8156236, 1.513064, 0, 0, 0, 1, 1,
0.8855624, 1.317854, 0.8821152, 0, 0, 0, 1, 1,
0.8856618, -1.306525, 2.672802, 0, 0, 0, 1, 1,
0.8864086, -0.7888644, 2.561203, 0, 0, 0, 1, 1,
0.8952392, 1.636093, 0.9976316, 0, 0, 0, 1, 1,
0.8970477, -0.175443, 0.04987181, 0, 0, 0, 1, 1,
0.8980244, 0.7117755, 0.7802927, 0, 0, 0, 1, 1,
0.9000617, 0.1582548, 0.5761768, 1, 1, 1, 1, 1,
0.9104939, 0.9069797, 0.1133585, 1, 1, 1, 1, 1,
0.9134382, -0.5197023, 3.680941, 1, 1, 1, 1, 1,
0.9192047, 1.879162, -0.4530173, 1, 1, 1, 1, 1,
0.9206363, -1.252493, 2.267727, 1, 1, 1, 1, 1,
0.9291182, 0.06373555, 2.205156, 1, 1, 1, 1, 1,
0.9300718, 0.1272096, 1.541662, 1, 1, 1, 1, 1,
0.9358556, 1.893107, -0.8652767, 1, 1, 1, 1, 1,
0.9400373, -0.2803252, 1.01215, 1, 1, 1, 1, 1,
0.9407333, 0.2078609, 1.907679, 1, 1, 1, 1, 1,
0.9528059, -0.8533013, 3.029766, 1, 1, 1, 1, 1,
0.9577047, -1.102026, 0.3714665, 1, 1, 1, 1, 1,
0.9615723, -1.203931, 2.386008, 1, 1, 1, 1, 1,
0.9646526, -2.461689, 3.647996, 1, 1, 1, 1, 1,
0.9651811, -2.636427, 2.838603, 1, 1, 1, 1, 1,
0.9736086, 1.086803, -0.01948344, 0, 0, 1, 1, 1,
0.9769792, 2.606666, -0.3706307, 1, 0, 0, 1, 1,
0.9786049, -0.4950977, 2.093688, 1, 0, 0, 1, 1,
0.9809174, 2.386119, -1.438943, 1, 0, 0, 1, 1,
0.98141, 1.22763, 1.535972, 1, 0, 0, 1, 1,
0.9817724, 1.215228, 0.1018964, 1, 0, 0, 1, 1,
0.9881924, -1.303036, 3.732988, 0, 0, 0, 1, 1,
0.9913102, -1.729869, 3.142381, 0, 0, 0, 1, 1,
0.9970942, 0.4856468, 0.737711, 0, 0, 0, 1, 1,
1.003407, 0.7408413, 0.4114266, 0, 0, 0, 1, 1,
1.00684, 1.059362, 2.42768, 0, 0, 0, 1, 1,
1.014667, -1.284298, 1.905395, 0, 0, 0, 1, 1,
1.024915, -1.062421, 3.14733, 0, 0, 0, 1, 1,
1.028301, -0.01279881, 3.228669, 1, 1, 1, 1, 1,
1.029796, -0.2256124, 2.293821, 1, 1, 1, 1, 1,
1.030632, 0.250158, -0.5139828, 1, 1, 1, 1, 1,
1.042309, 1.06927, 1.362088, 1, 1, 1, 1, 1,
1.042536, 1.017244, -0.8523867, 1, 1, 1, 1, 1,
1.042919, -0.8976153, 1.901421, 1, 1, 1, 1, 1,
1.04713, 0.4458101, 2.087674, 1, 1, 1, 1, 1,
1.047305, 1.219227, 0.9708339, 1, 1, 1, 1, 1,
1.060158, 0.6790797, 1.162755, 1, 1, 1, 1, 1,
1.061092, -1.837536, 2.414113, 1, 1, 1, 1, 1,
1.063024, 0.5225534, 0.5899669, 1, 1, 1, 1, 1,
1.0648, 0.437261, 2.897118, 1, 1, 1, 1, 1,
1.065225, 0.1801018, 1.587193, 1, 1, 1, 1, 1,
1.066108, 0.6057402, 0.1277404, 1, 1, 1, 1, 1,
1.079753, 0.4275922, 1.979807, 1, 1, 1, 1, 1,
1.081654, -1.864344, 2.809276, 0, 0, 1, 1, 1,
1.082304, -0.9193655, 3.55875, 1, 0, 0, 1, 1,
1.084487, 0.3705982, 1.317799, 1, 0, 0, 1, 1,
1.087747, -1.217509, 2.947756, 1, 0, 0, 1, 1,
1.09036, -1.589006, 3.746239, 1, 0, 0, 1, 1,
1.090944, -0.02220835, -0.6261615, 1, 0, 0, 1, 1,
1.091365, 1.864175, 0.1044249, 0, 0, 0, 1, 1,
1.098889, -1.48033, 2.323468, 0, 0, 0, 1, 1,
1.100588, -0.191186, 0.0302844, 0, 0, 0, 1, 1,
1.114859, -0.2284777, 1.964451, 0, 0, 0, 1, 1,
1.121342, 0.882085, 1.887564, 0, 0, 0, 1, 1,
1.128711, -0.6418294, 3.460369, 0, 0, 0, 1, 1,
1.135873, -2.079012, 1.71118, 0, 0, 0, 1, 1,
1.140276, -1.127855, 3.113978, 1, 1, 1, 1, 1,
1.140975, 1.957335, 1.654958, 1, 1, 1, 1, 1,
1.149406, 0.5108523, 1.979521, 1, 1, 1, 1, 1,
1.151407, -0.1614331, 2.082417, 1, 1, 1, 1, 1,
1.154629, -1.305347, 1.557143, 1, 1, 1, 1, 1,
1.159406, -0.2520472, 1.912766, 1, 1, 1, 1, 1,
1.161537, 0.6210912, 2.509362, 1, 1, 1, 1, 1,
1.167293, 0.5206175, 0.2636652, 1, 1, 1, 1, 1,
1.168211, 0.7469076, 0.8268232, 1, 1, 1, 1, 1,
1.171441, 0.3730652, 2.535617, 1, 1, 1, 1, 1,
1.172048, 0.336979, -0.1124735, 1, 1, 1, 1, 1,
1.205773, 1.375356, 0.1895178, 1, 1, 1, 1, 1,
1.207736, 0.2103489, 2.906807, 1, 1, 1, 1, 1,
1.223065, 0.3774276, 0.8177518, 1, 1, 1, 1, 1,
1.223606, 1.752814, 1.539841, 1, 1, 1, 1, 1,
1.227572, 0.5450752, 2.045842, 0, 0, 1, 1, 1,
1.228321, -2.109752, 3.582045, 1, 0, 0, 1, 1,
1.228525, 1.176265, 1.203637, 1, 0, 0, 1, 1,
1.235554, -0.9737835, 1.845144, 1, 0, 0, 1, 1,
1.247132, -1.497246, 2.355671, 1, 0, 0, 1, 1,
1.247855, 0.2417182, 1.086653, 1, 0, 0, 1, 1,
1.254635, -1.988527, 3.985387, 0, 0, 0, 1, 1,
1.259138, 0.2503549, 0.04287999, 0, 0, 0, 1, 1,
1.269982, -1.438328, 2.143613, 0, 0, 0, 1, 1,
1.273481, -1.729628, 4.264838, 0, 0, 0, 1, 1,
1.27564, -0.4023081, 3.76467, 0, 0, 0, 1, 1,
1.290391, 1.032201, -0.06642319, 0, 0, 0, 1, 1,
1.298216, -0.7733828, 3.129928, 0, 0, 0, 1, 1,
1.329132, 0.2912156, 1.141995, 1, 1, 1, 1, 1,
1.332417, -0.2431694, 1.108739, 1, 1, 1, 1, 1,
1.339697, 0.3017645, 2.221564, 1, 1, 1, 1, 1,
1.343742, 1.048089, 1.11852, 1, 1, 1, 1, 1,
1.347788, -0.3417112, 0.9281951, 1, 1, 1, 1, 1,
1.348144, -2.067729, 2.76514, 1, 1, 1, 1, 1,
1.350748, 1.433582, 0.5201304, 1, 1, 1, 1, 1,
1.354853, 0.1462391, 1.4558, 1, 1, 1, 1, 1,
1.359225, -0.06532446, 1.672943, 1, 1, 1, 1, 1,
1.359841, 0.6965925, 0.6891328, 1, 1, 1, 1, 1,
1.368444, -0.1602113, 2.425085, 1, 1, 1, 1, 1,
1.369728, 0.6634488, 0.4646825, 1, 1, 1, 1, 1,
1.371301, -1.562738, 4.801413, 1, 1, 1, 1, 1,
1.372046, -0.5598629, -0.1211108, 1, 1, 1, 1, 1,
1.375074, -0.3679624, 1.151194, 1, 1, 1, 1, 1,
1.385761, -0.1523608, 2.600419, 0, 0, 1, 1, 1,
1.399977, -0.91212, 2.192329, 1, 0, 0, 1, 1,
1.403375, 1.150942, -0.9904583, 1, 0, 0, 1, 1,
1.410952, -3.028106, 3.421738, 1, 0, 0, 1, 1,
1.425707, -0.2099639, 3.414874, 1, 0, 0, 1, 1,
1.435706, -0.2638035, 1.196697, 1, 0, 0, 1, 1,
1.439061, -0.766772, 4.300134, 0, 0, 0, 1, 1,
1.446293, -0.04281662, 2.737559, 0, 0, 0, 1, 1,
1.459506, 0.5671259, 2.407851, 0, 0, 0, 1, 1,
1.460419, -0.4335082, 1.57202, 0, 0, 0, 1, 1,
1.461005, 0.902975, 1.197342, 0, 0, 0, 1, 1,
1.464224, 0.3460228, 3.576932, 0, 0, 0, 1, 1,
1.487839, -0.1764398, 0.9196078, 0, 0, 0, 1, 1,
1.504739, -0.1283581, 0.7162688, 1, 1, 1, 1, 1,
1.50475, -0.1441315, 2.866745, 1, 1, 1, 1, 1,
1.525143, 0.2708121, 1.579483, 1, 1, 1, 1, 1,
1.529106, -0.7465057, 3.933672, 1, 1, 1, 1, 1,
1.541645, 0.5129561, 1.955443, 1, 1, 1, 1, 1,
1.546484, 0.4968587, 1.271086, 1, 1, 1, 1, 1,
1.550793, 0.7491655, 0.9610877, 1, 1, 1, 1, 1,
1.55632, 1.290104, 1.559085, 1, 1, 1, 1, 1,
1.572883, -0.5416347, 2.111774, 1, 1, 1, 1, 1,
1.574984, 0.4976722, 1.789924, 1, 1, 1, 1, 1,
1.581579, 1.046691, 2.875542, 1, 1, 1, 1, 1,
1.597801, 0.4537667, 0.6547287, 1, 1, 1, 1, 1,
1.598924, 0.03733468, 1.162045, 1, 1, 1, 1, 1,
1.614512, 0.1859212, 2.204359, 1, 1, 1, 1, 1,
1.626124, 1.035103, 2.104723, 1, 1, 1, 1, 1,
1.633384, -0.07249406, 1.113675, 0, 0, 1, 1, 1,
1.664896, -0.9122319, 1.543379, 1, 0, 0, 1, 1,
1.690498, 0.9823567, 1.046797, 1, 0, 0, 1, 1,
1.691239, 1.153437, -0.6251655, 1, 0, 0, 1, 1,
1.694529, 0.4540384, 1.192865, 1, 0, 0, 1, 1,
1.701533, -0.3041307, 3.066727, 1, 0, 0, 1, 1,
1.720085, -1.086137, 2.310471, 0, 0, 0, 1, 1,
1.723763, 0.9903252, 1.204185, 0, 0, 0, 1, 1,
1.746222, -0.6499448, 1.972809, 0, 0, 0, 1, 1,
1.747865, 1.429762, 1.426926, 0, 0, 0, 1, 1,
1.75139, 0.5058785, 1.542065, 0, 0, 0, 1, 1,
1.75172, 1.745735, 0.7729664, 0, 0, 0, 1, 1,
1.76149, -0.4508191, 0.6700642, 0, 0, 0, 1, 1,
1.790567, -2.053665, 3.263933, 1, 1, 1, 1, 1,
1.807938, 2.445742, -0.6827387, 1, 1, 1, 1, 1,
1.827667, -0.6957811, 2.691838, 1, 1, 1, 1, 1,
1.848787, -1.952783, 3.67779, 1, 1, 1, 1, 1,
1.876028, 0.9063644, 0.710506, 1, 1, 1, 1, 1,
1.899128, -1.802078, 1.765316, 1, 1, 1, 1, 1,
1.905552, 0.8041858, 1.186309, 1, 1, 1, 1, 1,
1.924454, 1.1356, 0.1556541, 1, 1, 1, 1, 1,
1.951746, -0.5677415, 1.166215, 1, 1, 1, 1, 1,
1.984179, -0.2330624, 2.3367, 1, 1, 1, 1, 1,
1.999387, -2.052563, 2.097333, 1, 1, 1, 1, 1,
2.015632, 0.1590788, -0.6832802, 1, 1, 1, 1, 1,
2.042597, -1.328135, 3.027653, 1, 1, 1, 1, 1,
2.062917, 0.5339081, 2.06409, 1, 1, 1, 1, 1,
2.070508, -0.80478, 1.852278, 1, 1, 1, 1, 1,
2.071975, 0.6434381, 0.2300387, 0, 0, 1, 1, 1,
2.07464, -0.09966882, 2.583589, 1, 0, 0, 1, 1,
2.076704, -1.858347, 2.314112, 1, 0, 0, 1, 1,
2.140806, -1.338477, 2.820727, 1, 0, 0, 1, 1,
2.164276, 0.7688866, 2.61834, 1, 0, 0, 1, 1,
2.174814, 0.002040011, 3.939875, 1, 0, 0, 1, 1,
2.222899, -0.4655114, 2.824239, 0, 0, 0, 1, 1,
2.232996, 0.2116983, 1.969464, 0, 0, 0, 1, 1,
2.33354, -0.5439295, 1.875141, 0, 0, 0, 1, 1,
2.348872, 1.401556, 1.193511, 0, 0, 0, 1, 1,
2.34942, 1.142135, 1.206452, 0, 0, 0, 1, 1,
2.416935, -1.341282, 0.07883885, 0, 0, 0, 1, 1,
2.420127, -0.3652285, 2.213373, 0, 0, 0, 1, 1,
2.469368, 0.2999268, 2.150786, 1, 1, 1, 1, 1,
2.470324, 0.2561469, 0.5292177, 1, 1, 1, 1, 1,
2.502657, -0.2959066, 2.846863, 1, 1, 1, 1, 1,
2.543075, 0.2533479, 1.512583, 1, 1, 1, 1, 1,
2.596873, -1.627522, 1.345534, 1, 1, 1, 1, 1,
2.642787, -0.9899418, 1.368758, 1, 1, 1, 1, 1,
2.983788, -1.134727, 1.934098, 1, 1, 1, 1, 1
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
var radius = 9.664657;
var distance = 33.9467;
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
mvMatrix.translate( 0.2605525, -0.0306232, -0.3243921 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.9467);
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
