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
-3.715689, 0.2128766, -0.980081, 1, 0, 0, 1,
-3.369655, 0.3886082, -3.040057, 1, 0.007843138, 0, 1,
-3.074629, 1.034389, -1.520181, 1, 0.01176471, 0, 1,
-2.881163, 0.04349488, -1.186578, 1, 0.01960784, 0, 1,
-2.717414, -0.7348587, -1.998326, 1, 0.02352941, 0, 1,
-2.514366, -0.5852416, -2.616578, 1, 0.03137255, 0, 1,
-2.506796, -1.703551, -1.11771, 1, 0.03529412, 0, 1,
-2.467387, 1.307879, -0.9997221, 1, 0.04313726, 0, 1,
-2.450617, -1.44646, -1.842822, 1, 0.04705882, 0, 1,
-2.418544, -0.1477495, -2.019952, 1, 0.05490196, 0, 1,
-2.306726, -0.5832599, -0.6307814, 1, 0.05882353, 0, 1,
-2.262309, 0.6569283, -2.528636, 1, 0.06666667, 0, 1,
-2.205166, -2.295332, -1.871907, 1, 0.07058824, 0, 1,
-2.200988, 0.1020158, 0.3226823, 1, 0.07843138, 0, 1,
-2.198323, -0.7213221, -1.857322, 1, 0.08235294, 0, 1,
-2.192699, 0.2334238, -1.454764, 1, 0.09019608, 0, 1,
-2.177989, -0.1150179, -1.610203, 1, 0.09411765, 0, 1,
-2.160936, 0.7718611, -0.539947, 1, 0.1019608, 0, 1,
-2.109524, 1.98638, -2.254088, 1, 0.1098039, 0, 1,
-2.082387, 0.6375037, 0.1668858, 1, 0.1137255, 0, 1,
-2.079494, -0.1926945, -0.4780577, 1, 0.1215686, 0, 1,
-2.050128, 0.4862921, -2.310144, 1, 0.1254902, 0, 1,
-2.028502, 0.2337062, -2.368672, 1, 0.1333333, 0, 1,
-2.024113, 0.3690647, -1.54456, 1, 0.1372549, 0, 1,
-2.002022, -1.43543, -1.029078, 1, 0.145098, 0, 1,
-1.987566, -0.8791611, -2.961567, 1, 0.1490196, 0, 1,
-1.901636, 0.06733713, -2.665685, 1, 0.1568628, 0, 1,
-1.874802, 0.6013424, -2.249941, 1, 0.1607843, 0, 1,
-1.874631, -1.574556, -2.55455, 1, 0.1686275, 0, 1,
-1.869723, 1.624135, -1.377244, 1, 0.172549, 0, 1,
-1.867156, 0.9384767, -0.4386288, 1, 0.1803922, 0, 1,
-1.864285, -1.340935, -3.2037, 1, 0.1843137, 0, 1,
-1.845627, 1.150988, -1.550265, 1, 0.1921569, 0, 1,
-1.83406, 1.282056, -1.721151, 1, 0.1960784, 0, 1,
-1.83243, 2.174899, 0.08428048, 1, 0.2039216, 0, 1,
-1.788259, 0.3270879, 0.3188638, 1, 0.2117647, 0, 1,
-1.783753, -1.641078, -2.849834, 1, 0.2156863, 0, 1,
-1.76392, 2.058564, -1.219387, 1, 0.2235294, 0, 1,
-1.759926, -0.2006195, -4.081066, 1, 0.227451, 0, 1,
-1.758791, -0.889663, -1.963422, 1, 0.2352941, 0, 1,
-1.751123, 0.6658824, -1.40576, 1, 0.2392157, 0, 1,
-1.749464, -1.131859, -1.577043, 1, 0.2470588, 0, 1,
-1.749033, 1.708568, -0.2554139, 1, 0.2509804, 0, 1,
-1.729771, -0.4729179, -1.345784, 1, 0.2588235, 0, 1,
-1.720819, 0.32827, -2.65357, 1, 0.2627451, 0, 1,
-1.715389, -0.8925739, -0.895825, 1, 0.2705882, 0, 1,
-1.712332, 0.4722871, -1.709257, 1, 0.2745098, 0, 1,
-1.703453, 0.9553139, -1.179339, 1, 0.282353, 0, 1,
-1.694255, 0.6407203, 0.2816113, 1, 0.2862745, 0, 1,
-1.688904, -0.4672619, -3.15832, 1, 0.2941177, 0, 1,
-1.679962, -1.993438, -1.941513, 1, 0.3019608, 0, 1,
-1.672796, -0.767265, -1.713281, 1, 0.3058824, 0, 1,
-1.667226, 2.487396, 0.843667, 1, 0.3137255, 0, 1,
-1.666425, 0.5298236, -0.7219919, 1, 0.3176471, 0, 1,
-1.658795, 0.09361327, -2.07178, 1, 0.3254902, 0, 1,
-1.654372, -1.909374, -3.372514, 1, 0.3294118, 0, 1,
-1.642017, 0.7288234, -1.745658, 1, 0.3372549, 0, 1,
-1.640016, -0.5595967, -1.421613, 1, 0.3411765, 0, 1,
-1.615014, -0.6254871, -1.227883, 1, 0.3490196, 0, 1,
-1.603819, 0.7102423, -0.1622588, 1, 0.3529412, 0, 1,
-1.594843, -0.06098198, -3.180493, 1, 0.3607843, 0, 1,
-1.554914, -1.612269, -1.109694, 1, 0.3647059, 0, 1,
-1.539488, 0.9738392, -0.6907818, 1, 0.372549, 0, 1,
-1.528355, -0.6423256, -2.760391, 1, 0.3764706, 0, 1,
-1.526828, -0.5321428, -0.4117218, 1, 0.3843137, 0, 1,
-1.525946, -0.9174753, -1.073373, 1, 0.3882353, 0, 1,
-1.522822, 0.7350457, 1.275291, 1, 0.3960784, 0, 1,
-1.513523, 2.302855, 0.06633089, 1, 0.4039216, 0, 1,
-1.506302, 1.21671, -1.611369, 1, 0.4078431, 0, 1,
-1.503412, -0.6771401, -4.454338, 1, 0.4156863, 0, 1,
-1.490387, 1.034318, -0.9672329, 1, 0.4196078, 0, 1,
-1.468644, 0.04898518, -1.277634, 1, 0.427451, 0, 1,
-1.445322, -0.647212, -2.678783, 1, 0.4313726, 0, 1,
-1.436782, -0.7956154, -1.750992, 1, 0.4392157, 0, 1,
-1.434867, 1.462593, -2.658445, 1, 0.4431373, 0, 1,
-1.432152, 0.6368984, 0.1832686, 1, 0.4509804, 0, 1,
-1.429975, -0.625407, -0.7933503, 1, 0.454902, 0, 1,
-1.4262, 1.648931, -0.7694373, 1, 0.4627451, 0, 1,
-1.425365, -0.7858554, -1.572793, 1, 0.4666667, 0, 1,
-1.410109, 1.163786, -1.976667, 1, 0.4745098, 0, 1,
-1.404983, -0.312932, -0.7669402, 1, 0.4784314, 0, 1,
-1.392756, 1.933372, -1.25772, 1, 0.4862745, 0, 1,
-1.388312, 1.352599, -2.240136, 1, 0.4901961, 0, 1,
-1.3865, 1.055536, -2.154819, 1, 0.4980392, 0, 1,
-1.385319, -0.8054897, -1.478915, 1, 0.5058824, 0, 1,
-1.38227, -0.4705794, -2.87753, 1, 0.509804, 0, 1,
-1.38118, 0.5606806, -2.272569, 1, 0.5176471, 0, 1,
-1.379647, -0.2432313, -4.27949, 1, 0.5215687, 0, 1,
-1.373797, -0.0679687, -0.8334126, 1, 0.5294118, 0, 1,
-1.370573, -0.2424553, -2.151655, 1, 0.5333334, 0, 1,
-1.370542, -0.6207926, -1.52954, 1, 0.5411765, 0, 1,
-1.361617, 1.149141, -2.19873, 1, 0.5450981, 0, 1,
-1.349391, -0.6777408, -0.4702218, 1, 0.5529412, 0, 1,
-1.348884, 0.6928664, -2.032169, 1, 0.5568628, 0, 1,
-1.347061, 2.021216, -1.617931, 1, 0.5647059, 0, 1,
-1.343979, -1.867976, -3.406167, 1, 0.5686275, 0, 1,
-1.341311, 1.427674, -0.9914693, 1, 0.5764706, 0, 1,
-1.339269, -1.647113, -2.430272, 1, 0.5803922, 0, 1,
-1.335691, -0.3681245, -3.901645, 1, 0.5882353, 0, 1,
-1.325244, -0.6258076, -2.385571, 1, 0.5921569, 0, 1,
-1.321458, -0.5034438, -2.886574, 1, 0.6, 0, 1,
-1.308182, -1.19283, -3.592009, 1, 0.6078432, 0, 1,
-1.299935, 0.1269578, -1.79494, 1, 0.6117647, 0, 1,
-1.286187, -0.3636751, -3.714588, 1, 0.6196079, 0, 1,
-1.282774, 0.2940746, -2.536439, 1, 0.6235294, 0, 1,
-1.281616, 1.378906, -0.840281, 1, 0.6313726, 0, 1,
-1.274664, 0.672831, -2.613614, 1, 0.6352941, 0, 1,
-1.266836, 0.7077597, -1.937966, 1, 0.6431373, 0, 1,
-1.262284, -0.4146434, -1.232536, 1, 0.6470588, 0, 1,
-1.254632, 0.3627703, -1.901868, 1, 0.654902, 0, 1,
-1.245606, 0.6164246, -0.5937977, 1, 0.6588235, 0, 1,
-1.238588, -1.276798, -0.9650319, 1, 0.6666667, 0, 1,
-1.236577, 1.258108, -0.690079, 1, 0.6705883, 0, 1,
-1.232695, -0.1371788, -1.167851, 1, 0.6784314, 0, 1,
-1.230316, 1.256359, 0.781705, 1, 0.682353, 0, 1,
-1.226735, -0.1382739, -2.192027, 1, 0.6901961, 0, 1,
-1.214065, 0.8822551, -0.9590846, 1, 0.6941177, 0, 1,
-1.208176, 0.0976037, -2.315212, 1, 0.7019608, 0, 1,
-1.207277, 0.6957793, -1.746164, 1, 0.7098039, 0, 1,
-1.203897, 1.125709, -0.8782639, 1, 0.7137255, 0, 1,
-1.200174, 0.2475397, -3.314953, 1, 0.7215686, 0, 1,
-1.194072, 1.196655, -1.561427, 1, 0.7254902, 0, 1,
-1.192922, -2.238795, -2.238994, 1, 0.7333333, 0, 1,
-1.188225, -0.3858123, -0.7852338, 1, 0.7372549, 0, 1,
-1.17924, -1.708762, -3.59408, 1, 0.7450981, 0, 1,
-1.178108, -0.6447739, -2.718588, 1, 0.7490196, 0, 1,
-1.177316, 0.09077935, -1.000344, 1, 0.7568628, 0, 1,
-1.163948, 0.7022216, -0.5025181, 1, 0.7607843, 0, 1,
-1.160367, 1.291927, -2.071552, 1, 0.7686275, 0, 1,
-1.159374, 0.3177705, -1.869634, 1, 0.772549, 0, 1,
-1.158006, -0.4436404, -1.3357, 1, 0.7803922, 0, 1,
-1.147469, -1.537499, -2.5246, 1, 0.7843137, 0, 1,
-1.145161, 0.4010877, -2.288357, 1, 0.7921569, 0, 1,
-1.144995, 0.5829538, -1.518469, 1, 0.7960784, 0, 1,
-1.134842, 0.3470024, -0.8497276, 1, 0.8039216, 0, 1,
-1.128432, -0.0004558424, -1.954712, 1, 0.8117647, 0, 1,
-1.123325, 1.07544, -1.966215, 1, 0.8156863, 0, 1,
-1.105656, -0.5749291, -3.258016, 1, 0.8235294, 0, 1,
-1.104718, -0.2563885, -1.115228, 1, 0.827451, 0, 1,
-1.085317, 1.325993, -1.678129, 1, 0.8352941, 0, 1,
-1.081363, 2.52652, -1.005202, 1, 0.8392157, 0, 1,
-1.081087, 0.2384331, -1.148265, 1, 0.8470588, 0, 1,
-1.073644, 0.01160272, -2.713325, 1, 0.8509804, 0, 1,
-1.06174, -1.223814, -4.762416, 1, 0.8588235, 0, 1,
-1.06051, 0.4469279, -2.660808, 1, 0.8627451, 0, 1,
-1.042489, -0.9941171, -2.356823, 1, 0.8705882, 0, 1,
-1.041723, -0.5269995, -3.380301, 1, 0.8745098, 0, 1,
-1.039671, 1.251169, 0.9438306, 1, 0.8823529, 0, 1,
-1.029313, -0.5503639, -2.884313, 1, 0.8862745, 0, 1,
-1.02889, -0.5663837, -3.093472, 1, 0.8941177, 0, 1,
-1.027659, 0.2782816, -0.4846998, 1, 0.8980392, 0, 1,
-1.021371, 0.109953, -0.9075613, 1, 0.9058824, 0, 1,
-1.015526, -0.1490463, 0.7728693, 1, 0.9137255, 0, 1,
-0.9995356, -0.7239391, -1.662657, 1, 0.9176471, 0, 1,
-0.9942067, -1.31519, -3.267517, 1, 0.9254902, 0, 1,
-0.9931191, -0.7347354, -1.716494, 1, 0.9294118, 0, 1,
-0.9893621, 0.8350592, -0.5607899, 1, 0.9372549, 0, 1,
-0.9872301, 1.676769, -1.123698, 1, 0.9411765, 0, 1,
-0.9862476, -1.379974, -0.8083832, 1, 0.9490196, 0, 1,
-0.9847047, 1.33701, -1.518749, 1, 0.9529412, 0, 1,
-0.979444, -1.271735, -2.480577, 1, 0.9607843, 0, 1,
-0.9790287, 0.1626442, -2.799423, 1, 0.9647059, 0, 1,
-0.968172, -0.4712136, -2.513703, 1, 0.972549, 0, 1,
-0.9632951, 0.9778861, -1.444652, 1, 0.9764706, 0, 1,
-0.9503304, -0.8395644, -2.791754, 1, 0.9843137, 0, 1,
-0.9465016, 0.3202904, -1.253428, 1, 0.9882353, 0, 1,
-0.9435721, -0.05205137, -0.7281528, 1, 0.9960784, 0, 1,
-0.9402809, 1.010105, 0.1776993, 0.9960784, 1, 0, 1,
-0.9370246, 0.2783201, -3.288431, 0.9921569, 1, 0, 1,
-0.9353153, 0.9782277, -1.228963, 0.9843137, 1, 0, 1,
-0.9344739, 1.276669, -1.268199, 0.9803922, 1, 0, 1,
-0.9331297, -1.398268, -1.486416, 0.972549, 1, 0, 1,
-0.9253153, 0.8914027, -0.470788, 0.9686275, 1, 0, 1,
-0.909104, -0.6622136, -1.629089, 0.9607843, 1, 0, 1,
-0.9089768, -1.76531, -2.946599, 0.9568627, 1, 0, 1,
-0.9078844, -0.0117684, -1.168393, 0.9490196, 1, 0, 1,
-0.9057718, 0.1352163, -2.299319, 0.945098, 1, 0, 1,
-0.8992141, 0.1903029, -0.9306878, 0.9372549, 1, 0, 1,
-0.8986983, -1.650159, -2.694664, 0.9333333, 1, 0, 1,
-0.8977278, -0.4467779, -2.181948, 0.9254902, 1, 0, 1,
-0.8873912, -0.604082, -2.113084, 0.9215686, 1, 0, 1,
-0.8812811, 0.7899806, -2.228431, 0.9137255, 1, 0, 1,
-0.8800578, 0.3175627, -3.62173, 0.9098039, 1, 0, 1,
-0.8759131, -1.201388, -3.166338, 0.9019608, 1, 0, 1,
-0.8751879, -0.7053112, -2.657981, 0.8941177, 1, 0, 1,
-0.8658535, -0.1920626, -1.62246, 0.8901961, 1, 0, 1,
-0.852134, 0.1068235, -2.013558, 0.8823529, 1, 0, 1,
-0.8511484, 1.258027, -1.041149, 0.8784314, 1, 0, 1,
-0.8503256, 0.1821029, -1.097238, 0.8705882, 1, 0, 1,
-0.8437211, -0.7120366, -0.9775857, 0.8666667, 1, 0, 1,
-0.8380815, -0.9118168, -1.985433, 0.8588235, 1, 0, 1,
-0.8339036, 1.47487, -0.2046608, 0.854902, 1, 0, 1,
-0.8317888, -0.03150228, -1.852487, 0.8470588, 1, 0, 1,
-0.8298739, 0.4639309, 0.03766316, 0.8431373, 1, 0, 1,
-0.8290714, -1.300443, -1.541256, 0.8352941, 1, 0, 1,
-0.8229737, -1.109037, -5.540431, 0.8313726, 1, 0, 1,
-0.822442, 0.4960375, 0.07007252, 0.8235294, 1, 0, 1,
-0.8206301, 1.385407, -0.005032586, 0.8196079, 1, 0, 1,
-0.8173974, -0.2825327, -1.798082, 0.8117647, 1, 0, 1,
-0.8092507, 1.062177, -0.6581812, 0.8078431, 1, 0, 1,
-0.8089282, -1.57952, -0.9799074, 0.8, 1, 0, 1,
-0.8004812, 0.5587654, -1.196596, 0.7921569, 1, 0, 1,
-0.7972002, -1.667376, -3.447849, 0.7882353, 1, 0, 1,
-0.7951839, 0.4643128, -1.370987, 0.7803922, 1, 0, 1,
-0.7893424, -0.2457827, -1.327688, 0.7764706, 1, 0, 1,
-0.7842488, 0.3716846, -0.8527165, 0.7686275, 1, 0, 1,
-0.7773149, 0.01011218, -1.029999, 0.7647059, 1, 0, 1,
-0.7760248, -1.020399, -2.882705, 0.7568628, 1, 0, 1,
-0.7747495, 0.6611542, -2.493602, 0.7529412, 1, 0, 1,
-0.7703317, 0.1275818, -2.55116, 0.7450981, 1, 0, 1,
-0.7699763, -1.163708, -2.719401, 0.7411765, 1, 0, 1,
-0.763922, 0.7867247, -2.341836, 0.7333333, 1, 0, 1,
-0.7598004, -0.7832174, -3.060712, 0.7294118, 1, 0, 1,
-0.7574987, 0.2763014, -1.397246, 0.7215686, 1, 0, 1,
-0.7565102, 0.02536028, -0.77561, 0.7176471, 1, 0, 1,
-0.7550268, -0.1127679, -1.983713, 0.7098039, 1, 0, 1,
-0.7489161, 2.270268, -0.3575705, 0.7058824, 1, 0, 1,
-0.7487816, -0.1940843, -3.287179, 0.6980392, 1, 0, 1,
-0.7474071, 1.39427, 0.01353593, 0.6901961, 1, 0, 1,
-0.745937, -1.088639, -2.505467, 0.6862745, 1, 0, 1,
-0.7389852, 0.9039512, 0.406608, 0.6784314, 1, 0, 1,
-0.7272803, -0.3963341, -0.73285, 0.6745098, 1, 0, 1,
-0.7253844, 0.6130325, -0.7293774, 0.6666667, 1, 0, 1,
-0.7236828, -1.48025, -3.864436, 0.6627451, 1, 0, 1,
-0.7174383, 0.2506214, -1.244467, 0.654902, 1, 0, 1,
-0.7168819, 0.08662555, 1.789988, 0.6509804, 1, 0, 1,
-0.7124282, 0.4343304, -1.88941, 0.6431373, 1, 0, 1,
-0.7108273, -1.941562, -2.713898, 0.6392157, 1, 0, 1,
-0.6983526, 0.5752601, -2.004072, 0.6313726, 1, 0, 1,
-0.6975956, 0.4042814, 0.4305725, 0.627451, 1, 0, 1,
-0.6971709, -1.65021, -2.255709, 0.6196079, 1, 0, 1,
-0.6970874, 0.7959654, -0.3907766, 0.6156863, 1, 0, 1,
-0.6956866, -0.3122976, -2.683596, 0.6078432, 1, 0, 1,
-0.6926174, 0.8620909, -1.071537, 0.6039216, 1, 0, 1,
-0.6900202, -1.143638, -3.456112, 0.5960785, 1, 0, 1,
-0.6886133, 0.644693, -0.2762094, 0.5882353, 1, 0, 1,
-0.6882387, -0.7584782, -1.641635, 0.5843138, 1, 0, 1,
-0.6849078, -1.216721, -2.652538, 0.5764706, 1, 0, 1,
-0.6847854, 1.675982, 1.607152, 0.572549, 1, 0, 1,
-0.6776075, 0.7211003, -1.114589, 0.5647059, 1, 0, 1,
-0.675694, 0.4769008, -0.2606281, 0.5607843, 1, 0, 1,
-0.6719335, -1.289215, -4.171501, 0.5529412, 1, 0, 1,
-0.6709415, -1.194397, -2.358012, 0.5490196, 1, 0, 1,
-0.6706083, -1.104549, -1.674828, 0.5411765, 1, 0, 1,
-0.6660032, 0.2202429, -0.1590535, 0.5372549, 1, 0, 1,
-0.66588, -0.8075272, -3.746428, 0.5294118, 1, 0, 1,
-0.664861, 1.275339, -0.4251158, 0.5254902, 1, 0, 1,
-0.6582665, 1.355805, -0.5661405, 0.5176471, 1, 0, 1,
-0.6566495, -0.7834232, -1.090357, 0.5137255, 1, 0, 1,
-0.6527013, 1.287193, -0.411714, 0.5058824, 1, 0, 1,
-0.6522115, -0.5685608, -1.577889, 0.5019608, 1, 0, 1,
-0.6507649, 0.9121451, -0.6840627, 0.4941176, 1, 0, 1,
-0.6501973, -1.504779, -3.330204, 0.4862745, 1, 0, 1,
-0.6496736, 1.262702, -0.1456732, 0.4823529, 1, 0, 1,
-0.6471925, 1.309162, -1.47621, 0.4745098, 1, 0, 1,
-0.6415504, 1.007615, -0.7114044, 0.4705882, 1, 0, 1,
-0.6388049, -0.08847358, -1.176942, 0.4627451, 1, 0, 1,
-0.6363025, 2.036101, -1.023363, 0.4588235, 1, 0, 1,
-0.6343552, 0.04564428, -2.117816, 0.4509804, 1, 0, 1,
-0.6336083, 0.6108321, 0.1515265, 0.4470588, 1, 0, 1,
-0.6261588, -1.219111, -3.805839, 0.4392157, 1, 0, 1,
-0.6231425, 0.1215293, -0.7480095, 0.4352941, 1, 0, 1,
-0.6220267, -0.4908862, -1.862473, 0.427451, 1, 0, 1,
-0.6192399, -0.8834301, -3.609691, 0.4235294, 1, 0, 1,
-0.617847, -0.155798, -2.991326, 0.4156863, 1, 0, 1,
-0.6173657, -0.4695998, -1.046585, 0.4117647, 1, 0, 1,
-0.6144276, 0.02583376, -2.072415, 0.4039216, 1, 0, 1,
-0.611076, -0.27674, -1.549581, 0.3960784, 1, 0, 1,
-0.6095806, 0.5924113, -0.2520372, 0.3921569, 1, 0, 1,
-0.6071437, -0.3285205, -1.433383, 0.3843137, 1, 0, 1,
-0.6066731, -0.1352399, -0.08068471, 0.3803922, 1, 0, 1,
-0.6064776, 0.9302669, -1.815327, 0.372549, 1, 0, 1,
-0.6058899, -0.6470326, -2.861989, 0.3686275, 1, 0, 1,
-0.6048428, -0.9160722, -3.2387, 0.3607843, 1, 0, 1,
-0.6037892, -0.32259, -3.460652, 0.3568628, 1, 0, 1,
-0.601697, 1.577106, -0.02012542, 0.3490196, 1, 0, 1,
-0.5979916, -0.06211696, -2.076441, 0.345098, 1, 0, 1,
-0.5979263, 0.2002991, -0.4874016, 0.3372549, 1, 0, 1,
-0.5976592, 0.1009287, -0.5139287, 0.3333333, 1, 0, 1,
-0.5962587, 1.870901, -0.5082334, 0.3254902, 1, 0, 1,
-0.5819849, 0.2022103, -2.134013, 0.3215686, 1, 0, 1,
-0.5661018, -0.7284055, -3.40436, 0.3137255, 1, 0, 1,
-0.5609987, -1.5105, -2.127539, 0.3098039, 1, 0, 1,
-0.5535762, -0.09396209, -3.420819, 0.3019608, 1, 0, 1,
-0.5408353, -0.3704728, -2.058016, 0.2941177, 1, 0, 1,
-0.5403055, -1.527512, -3.265214, 0.2901961, 1, 0, 1,
-0.5394863, -1.394956, -5.080265, 0.282353, 1, 0, 1,
-0.5391974, -1.245275, -2.456036, 0.2784314, 1, 0, 1,
-0.5383033, -2.124364, -2.200224, 0.2705882, 1, 0, 1,
-0.5208257, 0.4870531, -2.7044, 0.2666667, 1, 0, 1,
-0.5200626, -0.3256784, -3.254217, 0.2588235, 1, 0, 1,
-0.5144234, -1.215934, -2.979504, 0.254902, 1, 0, 1,
-0.514114, -0.3172582, -2.142887, 0.2470588, 1, 0, 1,
-0.5135752, 0.1833716, -3.471517, 0.2431373, 1, 0, 1,
-0.5135563, 0.4514668, -0.3684981, 0.2352941, 1, 0, 1,
-0.5128482, -0.8484722, -1.986036, 0.2313726, 1, 0, 1,
-0.5106254, 0.6875717, -0.2563784, 0.2235294, 1, 0, 1,
-0.5094647, 0.303238, -1.809332, 0.2196078, 1, 0, 1,
-0.5074613, -0.6428945, -2.473241, 0.2117647, 1, 0, 1,
-0.5052567, 0.3851042, -1.512841, 0.2078431, 1, 0, 1,
-0.5015782, -0.1602167, -2.947551, 0.2, 1, 0, 1,
-0.4977274, 0.2423169, -2.716253, 0.1921569, 1, 0, 1,
-0.4969257, -1.40216, -3.430895, 0.1882353, 1, 0, 1,
-0.4955605, 0.03896074, -0.7154447, 0.1803922, 1, 0, 1,
-0.4938407, -0.1055851, -2.141068, 0.1764706, 1, 0, 1,
-0.4921451, -0.2567252, -0.5546704, 0.1686275, 1, 0, 1,
-0.4893276, 0.6636382, 0.5656604, 0.1647059, 1, 0, 1,
-0.4863018, 1.703887, -0.7648218, 0.1568628, 1, 0, 1,
-0.4811618, -1.632736, -3.853287, 0.1529412, 1, 0, 1,
-0.4773943, -0.5683938, -2.687634, 0.145098, 1, 0, 1,
-0.4766603, -1.759052, -2.94736, 0.1411765, 1, 0, 1,
-0.4759343, -0.5996075, -1.957013, 0.1333333, 1, 0, 1,
-0.4749039, -1.176419, -0.6145871, 0.1294118, 1, 0, 1,
-0.4744344, 0.2038544, -2.077536, 0.1215686, 1, 0, 1,
-0.4733463, -1.0814, -2.357741, 0.1176471, 1, 0, 1,
-0.4707739, -0.8352462, -2.707796, 0.1098039, 1, 0, 1,
-0.4696101, 0.7009325, -1.45688, 0.1058824, 1, 0, 1,
-0.4648255, -0.7340302, -2.934338, 0.09803922, 1, 0, 1,
-0.4626148, 0.2362221, -0.6523076, 0.09019608, 1, 0, 1,
-0.4590276, 0.4001706, -1.568654, 0.08627451, 1, 0, 1,
-0.4587131, 1.018709, -0.9147252, 0.07843138, 1, 0, 1,
-0.4571415, -1.350094, -2.980579, 0.07450981, 1, 0, 1,
-0.4566232, 0.0255309, -0.9216344, 0.06666667, 1, 0, 1,
-0.4476249, -1.025587, -2.867164, 0.0627451, 1, 0, 1,
-0.4462526, -0.7627934, -2.926991, 0.05490196, 1, 0, 1,
-0.4452606, -1.656737, -1.491477, 0.05098039, 1, 0, 1,
-0.4449742, -0.1361359, -2.258911, 0.04313726, 1, 0, 1,
-0.4420294, -0.6038603, -3.531481, 0.03921569, 1, 0, 1,
-0.4381879, 0.8888292, 0.5228813, 0.03137255, 1, 0, 1,
-0.4371152, 0.006466453, -0.04409621, 0.02745098, 1, 0, 1,
-0.4365256, -0.4549904, -1.838209, 0.01960784, 1, 0, 1,
-0.4358076, -0.0375396, -1.453769, 0.01568628, 1, 0, 1,
-0.4325297, 1.339364, 0.02336233, 0.007843138, 1, 0, 1,
-0.4244721, -0.8026298, -0.9238529, 0.003921569, 1, 0, 1,
-0.4234638, 0.7403834, -1.066589, 0, 1, 0.003921569, 1,
-0.4177337, 0.6381096, -1.919133, 0, 1, 0.01176471, 1,
-0.4174635, 0.2246024, -2.129436, 0, 1, 0.01568628, 1,
-0.4171979, -0.6320943, -3.442084, 0, 1, 0.02352941, 1,
-0.4126986, 0.1546067, -1.004405, 0, 1, 0.02745098, 1,
-0.4067246, 1.757286, 0.661567, 0, 1, 0.03529412, 1,
-0.4055363, 0.2898938, -0.07651697, 0, 1, 0.03921569, 1,
-0.4054457, -0.09976617, -1.857475, 0, 1, 0.04705882, 1,
-0.4047456, -1.731194, -2.944463, 0, 1, 0.05098039, 1,
-0.4034203, -0.6214026, -2.205563, 0, 1, 0.05882353, 1,
-0.4018292, 1.691675, -0.87767, 0, 1, 0.0627451, 1,
-0.3984641, 0.5522875, -0.119854, 0, 1, 0.07058824, 1,
-0.3967966, 1.216237, -0.6058913, 0, 1, 0.07450981, 1,
-0.3949151, 0.1821988, -1.386994, 0, 1, 0.08235294, 1,
-0.3874254, -1.152929, -0.6474422, 0, 1, 0.08627451, 1,
-0.3861016, -1.691149, -2.273593, 0, 1, 0.09411765, 1,
-0.3854376, 0.01741892, -0.9058882, 0, 1, 0.1019608, 1,
-0.3823434, -1.307627, -2.616698, 0, 1, 0.1058824, 1,
-0.3822774, -0.2567412, -1.724728, 0, 1, 0.1137255, 1,
-0.3808164, -0.4548754, -3.211649, 0, 1, 0.1176471, 1,
-0.3790266, 1.346926, -0.05001574, 0, 1, 0.1254902, 1,
-0.376682, -0.6109545, -3.54333, 0, 1, 0.1294118, 1,
-0.374966, 0.1316384, -1.324426, 0, 1, 0.1372549, 1,
-0.3747062, -0.4100954, -1.417216, 0, 1, 0.1411765, 1,
-0.3746912, -0.4097642, -2.514502, 0, 1, 0.1490196, 1,
-0.3731586, 0.8906628, -0.454024, 0, 1, 0.1529412, 1,
-0.3695337, -1.026716, -2.216336, 0, 1, 0.1607843, 1,
-0.3683196, 0.6256784, -0.9474961, 0, 1, 0.1647059, 1,
-0.3652554, -0.04441861, -3.233946, 0, 1, 0.172549, 1,
-0.3607652, -0.2733818, -1.929706, 0, 1, 0.1764706, 1,
-0.3601657, 0.7110704, -2.136692, 0, 1, 0.1843137, 1,
-0.3592025, -0.1440476, -2.899261, 0, 1, 0.1882353, 1,
-0.3588976, -1.809161, -2.722107, 0, 1, 0.1960784, 1,
-0.3581568, 0.6543955, 0.9753831, 0, 1, 0.2039216, 1,
-0.3542679, 0.6955065, -0.9840159, 0, 1, 0.2078431, 1,
-0.353916, -1.069686, -3.523356, 0, 1, 0.2156863, 1,
-0.353398, 1.208096, 0.8318172, 0, 1, 0.2196078, 1,
-0.3531398, -0.2147166, -3.461952, 0, 1, 0.227451, 1,
-0.3495477, 1.213627, -3.535053, 0, 1, 0.2313726, 1,
-0.3484585, 1.576466, 0.1753867, 0, 1, 0.2392157, 1,
-0.3461311, -0.8120832, -4.670844, 0, 1, 0.2431373, 1,
-0.3425193, 1.185659, 0.4629523, 0, 1, 0.2509804, 1,
-0.3392672, -0.04146716, -1.37563, 0, 1, 0.254902, 1,
-0.3368677, 0.8031807, 2.163175, 0, 1, 0.2627451, 1,
-0.3341861, 2.447046, -0.7346839, 0, 1, 0.2666667, 1,
-0.3241883, 0.1513311, -0.834437, 0, 1, 0.2745098, 1,
-0.3229454, 0.1882759, -2.344602, 0, 1, 0.2784314, 1,
-0.3164366, 0.1999319, -0.623904, 0, 1, 0.2862745, 1,
-0.3141261, 0.5251265, 0.3924371, 0, 1, 0.2901961, 1,
-0.3140948, -1.076982, -3.621764, 0, 1, 0.2980392, 1,
-0.307135, -0.519265, -3.122798, 0, 1, 0.3058824, 1,
-0.3067404, -0.4101969, -2.389629, 0, 1, 0.3098039, 1,
-0.304363, -0.5900309, -2.357195, 0, 1, 0.3176471, 1,
-0.3027512, 0.5161824, -0.0272057, 0, 1, 0.3215686, 1,
-0.3014736, -0.4018931, -3.608219, 0, 1, 0.3294118, 1,
-0.3003165, -1.23032, -3.679104, 0, 1, 0.3333333, 1,
-0.2995222, 0.1119683, -1.291028, 0, 1, 0.3411765, 1,
-0.2988529, 1.684462, -0.01684929, 0, 1, 0.345098, 1,
-0.2984723, -0.4466219, -4.761754, 0, 1, 0.3529412, 1,
-0.2919219, -0.6581429, -2.477756, 0, 1, 0.3568628, 1,
-0.2901643, -0.09903117, -1.064494, 0, 1, 0.3647059, 1,
-0.2858608, -1.745299, -3.410133, 0, 1, 0.3686275, 1,
-0.2826379, 0.7434759, -0.01382553, 0, 1, 0.3764706, 1,
-0.2768216, 0.2515339, -0.2584461, 0, 1, 0.3803922, 1,
-0.2765567, -0.5995331, -2.342944, 0, 1, 0.3882353, 1,
-0.2758343, -0.1478704, -1.440402, 0, 1, 0.3921569, 1,
-0.2729789, -0.06796716, 0.3473819, 0, 1, 0.4, 1,
-0.2720485, 0.1550986, 0.9947571, 0, 1, 0.4078431, 1,
-0.2715903, -1.423443, -3.08832, 0, 1, 0.4117647, 1,
-0.2707031, 0.09613883, -1.681808, 0, 1, 0.4196078, 1,
-0.2694322, -0.2507878, -1.837664, 0, 1, 0.4235294, 1,
-0.2690675, 0.07567229, -1.910359, 0, 1, 0.4313726, 1,
-0.2675771, -0.2600502, -2.52114, 0, 1, 0.4352941, 1,
-0.2653221, -0.274266, -2.568883, 0, 1, 0.4431373, 1,
-0.2621722, -0.1579404, -2.76685, 0, 1, 0.4470588, 1,
-0.260381, 0.07693764, -0.0662335, 0, 1, 0.454902, 1,
-0.2592762, -0.558741, -3.038644, 0, 1, 0.4588235, 1,
-0.2588398, 0.5115319, 0.6351893, 0, 1, 0.4666667, 1,
-0.2575554, -0.1602501, -2.158877, 0, 1, 0.4705882, 1,
-0.2490594, -0.5355233, -2.088529, 0, 1, 0.4784314, 1,
-0.2459083, -1.832345, -3.511183, 0, 1, 0.4823529, 1,
-0.2457804, 0.8100042, -1.494352, 0, 1, 0.4901961, 1,
-0.2440523, -0.4994727, -3.62395, 0, 1, 0.4941176, 1,
-0.2431575, -1.354069, -3.604859, 0, 1, 0.5019608, 1,
-0.2360569, 1.322671, -0.305397, 0, 1, 0.509804, 1,
-0.2333786, -1.388724, -3.714627, 0, 1, 0.5137255, 1,
-0.2312976, -0.5853132, -4.666221, 0, 1, 0.5215687, 1,
-0.2224729, -0.4877834, -1.487392, 0, 1, 0.5254902, 1,
-0.2221214, -0.6115503, -3.107646, 0, 1, 0.5333334, 1,
-0.2150426, -0.09657514, -2.560632, 0, 1, 0.5372549, 1,
-0.2092589, 0.7561514, 0.5031675, 0, 1, 0.5450981, 1,
-0.2080613, 1.185178, -0.3626457, 0, 1, 0.5490196, 1,
-0.2077623, 0.2482427, 0.6714531, 0, 1, 0.5568628, 1,
-0.2058625, -1.636109, -2.161365, 0, 1, 0.5607843, 1,
-0.2039516, 1.358007, -0.3153079, 0, 1, 0.5686275, 1,
-0.2013692, 0.1696684, -0.3013525, 0, 1, 0.572549, 1,
-0.1981215, 0.8485711, 1.749896, 0, 1, 0.5803922, 1,
-0.1939437, -0.03930572, -1.511075, 0, 1, 0.5843138, 1,
-0.1931692, 0.6725005, -0.2459265, 0, 1, 0.5921569, 1,
-0.1881902, -0.2320606, -2.098474, 0, 1, 0.5960785, 1,
-0.1849978, 0.515128, -1.429916, 0, 1, 0.6039216, 1,
-0.1824855, -1.369148, -2.545071, 0, 1, 0.6117647, 1,
-0.1805947, 0.7672482, -0.2611894, 0, 1, 0.6156863, 1,
-0.1793115, 0.5389796, -1.265791, 0, 1, 0.6235294, 1,
-0.1784373, -0.7851233, -2.991451, 0, 1, 0.627451, 1,
-0.1764461, -0.9261902, -1.659205, 0, 1, 0.6352941, 1,
-0.1754937, 0.7852185, -0.7314464, 0, 1, 0.6392157, 1,
-0.1744549, 1.682461, -0.930353, 0, 1, 0.6470588, 1,
-0.1737087, 0.1773761, -0.08035307, 0, 1, 0.6509804, 1,
-0.1718106, -0.7624064, -2.584723, 0, 1, 0.6588235, 1,
-0.1686103, -0.1782924, -2.803812, 0, 1, 0.6627451, 1,
-0.1684961, -1.772076, -3.139505, 0, 1, 0.6705883, 1,
-0.1663523, -0.01951789, -1.566298, 0, 1, 0.6745098, 1,
-0.1657426, 0.03123481, -1.63246, 0, 1, 0.682353, 1,
-0.165615, -1.427041, -3.660775, 0, 1, 0.6862745, 1,
-0.1634192, 0.1047399, -1.431084, 0, 1, 0.6941177, 1,
-0.1609302, 0.6261425, 0.6118414, 0, 1, 0.7019608, 1,
-0.1574288, 0.6829947, -0.3371464, 0, 1, 0.7058824, 1,
-0.155443, -0.7841271, -3.091888, 0, 1, 0.7137255, 1,
-0.1542092, -2.571515, -2.724017, 0, 1, 0.7176471, 1,
-0.1493799, 0.5021104, 0.6519537, 0, 1, 0.7254902, 1,
-0.1476574, -0.308328, -1.15226, 0, 1, 0.7294118, 1,
-0.1415483, 0.4205287, -0.5461184, 0, 1, 0.7372549, 1,
-0.1353821, 0.1780039, -0.9806075, 0, 1, 0.7411765, 1,
-0.1342688, 0.6273319, -0.7779524, 0, 1, 0.7490196, 1,
-0.1314693, -0.9782573, -4.47961, 0, 1, 0.7529412, 1,
-0.1265675, -0.01425507, -2.831944, 0, 1, 0.7607843, 1,
-0.1265614, 1.315409, 1.136083, 0, 1, 0.7647059, 1,
-0.125665, -1.113696, -2.215993, 0, 1, 0.772549, 1,
-0.1248918, 0.7263508, -0.1674504, 0, 1, 0.7764706, 1,
-0.1231945, -0.5735607, -2.58569, 0, 1, 0.7843137, 1,
-0.1225037, -0.6694458, -2.639707, 0, 1, 0.7882353, 1,
-0.1192478, 1.475907, -0.1651411, 0, 1, 0.7960784, 1,
-0.1182217, 0.1630618, -0.553824, 0, 1, 0.8039216, 1,
-0.115514, 0.7321084, 0.4822189, 0, 1, 0.8078431, 1,
-0.1128762, -0.7948496, -3.588041, 0, 1, 0.8156863, 1,
-0.1092937, -1.398956, -2.515285, 0, 1, 0.8196079, 1,
-0.1059605, 1.004277, -0.7572232, 0, 1, 0.827451, 1,
-0.1031789, 0.6590554, 0.5529081, 0, 1, 0.8313726, 1,
-0.101435, -0.4327362, -0.6191324, 0, 1, 0.8392157, 1,
-0.1001627, -0.8728951, -2.58576, 0, 1, 0.8431373, 1,
-0.09575182, 0.4305268, 0.576808, 0, 1, 0.8509804, 1,
-0.09199148, 1.156091, -0.4089696, 0, 1, 0.854902, 1,
-0.08596066, -0.9333687, -4.35017, 0, 1, 0.8627451, 1,
-0.08565356, 0.4542007, -0.7916597, 0, 1, 0.8666667, 1,
-0.08151948, -0.464297, -3.586124, 0, 1, 0.8745098, 1,
-0.08014781, 1.045581, 0.1223538, 0, 1, 0.8784314, 1,
-0.07422612, 1.312529, 0.4691753, 0, 1, 0.8862745, 1,
-0.07395104, -0.01283798, -1.390305, 0, 1, 0.8901961, 1,
-0.06853205, -0.5700997, -3.712253, 0, 1, 0.8980392, 1,
-0.06323238, 0.1470475, -0.630759, 0, 1, 0.9058824, 1,
-0.06148813, 0.4320118, 0.02480125, 0, 1, 0.9098039, 1,
-0.05928569, -1.136574, -2.361582, 0, 1, 0.9176471, 1,
-0.05809849, 1.342322, -0.8911259, 0, 1, 0.9215686, 1,
-0.05804447, -0.6124958, -3.500574, 0, 1, 0.9294118, 1,
-0.05729102, -0.7425492, -4.181652, 0, 1, 0.9333333, 1,
-0.05635726, 1.398806, -1.372753, 0, 1, 0.9411765, 1,
-0.05550352, 0.7051035, -0.1555346, 0, 1, 0.945098, 1,
-0.05320856, -0.2330848, -4.296124, 0, 1, 0.9529412, 1,
-0.05098354, -0.3667772, -2.236701, 0, 1, 0.9568627, 1,
-0.04849568, -1.37034, -2.731355, 0, 1, 0.9647059, 1,
-0.04540134, 1.43625, 1.570647, 0, 1, 0.9686275, 1,
-0.042508, -1.712662, -3.049905, 0, 1, 0.9764706, 1,
-0.02578042, 0.2607352, 0.2439347, 0, 1, 0.9803922, 1,
-0.02491041, -0.1571625, -3.546795, 0, 1, 0.9882353, 1,
-0.02321558, 1.061942, 0.3882882, 0, 1, 0.9921569, 1,
-0.02190555, 0.05089476, 0.2793062, 0, 1, 1, 1,
-0.02176597, -0.783878, -2.630749, 0, 0.9921569, 1, 1,
-0.02111002, 1.249669, 1.654243, 0, 0.9882353, 1, 1,
-0.02054454, 0.194987, 0.7071869, 0, 0.9803922, 1, 1,
-0.01840079, 0.333292, 0.3484187, 0, 0.9764706, 1, 1,
-0.0177423, -1.039634, -1.200384, 0, 0.9686275, 1, 1,
-0.01695571, 0.1889627, -1.605566, 0, 0.9647059, 1, 1,
-0.01253619, -0.5034735, -4.204786, 0, 0.9568627, 1, 1,
-0.009636828, 1.517886, -0.820578, 0, 0.9529412, 1, 1,
-0.00569787, -1.430405, -3.268115, 0, 0.945098, 1, 1,
-0.00504354, -2.242946, -2.015759, 0, 0.9411765, 1, 1,
0.001848761, 0.2779306, 1.110188, 0, 0.9333333, 1, 1,
0.003583021, -0.4323775, 1.929869, 0, 0.9294118, 1, 1,
0.01507246, 2.177167, -0.8120131, 0, 0.9215686, 1, 1,
0.01636746, 1.716211, -3.373369, 0, 0.9176471, 1, 1,
0.01922631, -1.568902, 3.451589, 0, 0.9098039, 1, 1,
0.02206793, -0.06572271, 2.76545, 0, 0.9058824, 1, 1,
0.02272909, -0.4247425, 3.867875, 0, 0.8980392, 1, 1,
0.02805408, 0.1346792, -0.5410821, 0, 0.8901961, 1, 1,
0.02918386, 0.04186559, -0.06080806, 0, 0.8862745, 1, 1,
0.03323573, 0.8657222, 1.350713, 0, 0.8784314, 1, 1,
0.03330716, -0.946174, 4.265113, 0, 0.8745098, 1, 1,
0.03477599, -0.2932906, 3.133821, 0, 0.8666667, 1, 1,
0.04089218, -0.1805264, 1.223048, 0, 0.8627451, 1, 1,
0.04115851, 1.612353, -0.9941794, 0, 0.854902, 1, 1,
0.04526, -1.708683, 3.418457, 0, 0.8509804, 1, 1,
0.0458975, 0.7902523, 0.2250579, 0, 0.8431373, 1, 1,
0.046183, -0.957994, 3.252435, 0, 0.8392157, 1, 1,
0.04800437, -0.109883, 2.978057, 0, 0.8313726, 1, 1,
0.04898923, 0.5877852, -0.3135904, 0, 0.827451, 1, 1,
0.04989988, 0.1539703, 0.3039232, 0, 0.8196079, 1, 1,
0.05576429, -2.161356, 3.196256, 0, 0.8156863, 1, 1,
0.05840454, -0.5410294, 3.78472, 0, 0.8078431, 1, 1,
0.061689, 0.1080603, 1.004304, 0, 0.8039216, 1, 1,
0.06193902, -1.211977, 3.805855, 0, 0.7960784, 1, 1,
0.0622434, 0.07284613, -0.5908858, 0, 0.7882353, 1, 1,
0.06388932, -0.6406483, 3.605017, 0, 0.7843137, 1, 1,
0.07061118, 0.8465758, -0.8011936, 0, 0.7764706, 1, 1,
0.07355458, -0.616944, 3.086771, 0, 0.772549, 1, 1,
0.07374249, 0.6175177, 1.354581, 0, 0.7647059, 1, 1,
0.07525732, 1.974495, 2.870665, 0, 0.7607843, 1, 1,
0.07644352, -0.2853734, 1.752925, 0, 0.7529412, 1, 1,
0.07915683, -1.31152, 3.648956, 0, 0.7490196, 1, 1,
0.08390765, -0.0809066, 2.778294, 0, 0.7411765, 1, 1,
0.08434524, 2.395211, -1.125795, 0, 0.7372549, 1, 1,
0.08522177, -1.336969, 3.121149, 0, 0.7294118, 1, 1,
0.0861482, 1.756871, -2.21861, 0, 0.7254902, 1, 1,
0.09761719, 0.1232614, 1.041558, 0, 0.7176471, 1, 1,
0.09904666, -0.7139069, 1.650091, 0, 0.7137255, 1, 1,
0.1003717, 2.103518, 0.8707594, 0, 0.7058824, 1, 1,
0.1019606, 0.7784502, -1.329806, 0, 0.6980392, 1, 1,
0.1022022, 0.1992854, 0.4745021, 0, 0.6941177, 1, 1,
0.1047582, 1.513141, -1.268006, 0, 0.6862745, 1, 1,
0.1048345, 2.103396, -0.2093939, 0, 0.682353, 1, 1,
0.1110511, 0.2403779, -1.355725, 0, 0.6745098, 1, 1,
0.1124022, -1.640773, 2.456462, 0, 0.6705883, 1, 1,
0.1150822, 0.8381574, -0.5704805, 0, 0.6627451, 1, 1,
0.1174554, -1.187097, 2.272716, 0, 0.6588235, 1, 1,
0.1184175, 0.4662261, -1.313386, 0, 0.6509804, 1, 1,
0.1242834, 0.2986729, -0.1073564, 0, 0.6470588, 1, 1,
0.1279283, 0.7760205, -0.491109, 0, 0.6392157, 1, 1,
0.1282538, 0.8446879, -0.1098636, 0, 0.6352941, 1, 1,
0.130358, 0.2360387, 1.127044, 0, 0.627451, 1, 1,
0.1335191, -0.9073696, 3.855784, 0, 0.6235294, 1, 1,
0.1393168, 1.879488, 0.5552506, 0, 0.6156863, 1, 1,
0.1426793, -1.300841, 2.814575, 0, 0.6117647, 1, 1,
0.1461369, 0.4443898, -1.055378, 0, 0.6039216, 1, 1,
0.1477894, -0.768342, 2.569432, 0, 0.5960785, 1, 1,
0.1502308, -0.06633569, 3.603527, 0, 0.5921569, 1, 1,
0.1521464, -1.036821, 2.173029, 0, 0.5843138, 1, 1,
0.1522767, -1.324529, 2.482452, 0, 0.5803922, 1, 1,
0.1580399, 0.7576541, 0.2269513, 0, 0.572549, 1, 1,
0.1584091, -0.4741566, 3.71115, 0, 0.5686275, 1, 1,
0.1619316, -1.075186, 2.254194, 0, 0.5607843, 1, 1,
0.1647751, 0.5662212, 1.267887, 0, 0.5568628, 1, 1,
0.1733486, 1.11523, 0.9549947, 0, 0.5490196, 1, 1,
0.1746917, -1.005609, 3.854872, 0, 0.5450981, 1, 1,
0.1766159, 0.3168136, 1.46549, 0, 0.5372549, 1, 1,
0.1788207, 0.6278833, 0.1580166, 0, 0.5333334, 1, 1,
0.1831957, -1.454815, 1.991198, 0, 0.5254902, 1, 1,
0.1839611, 0.920935, 0.242524, 0, 0.5215687, 1, 1,
0.1887607, -0.4943828, 3.396372, 0, 0.5137255, 1, 1,
0.1910471, -1.0385, 2.417052, 0, 0.509804, 1, 1,
0.1957514, 0.1101571, 2.274183, 0, 0.5019608, 1, 1,
0.2061212, -1.827016, 2.762151, 0, 0.4941176, 1, 1,
0.2075255, -0.7773944, 2.423337, 0, 0.4901961, 1, 1,
0.2125067, -0.2593534, 2.635262, 0, 0.4823529, 1, 1,
0.2151731, 0.9226536, 0.1603296, 0, 0.4784314, 1, 1,
0.2152424, -1.051103, 3.394305, 0, 0.4705882, 1, 1,
0.2238891, 1.421256, 1.206714, 0, 0.4666667, 1, 1,
0.2247065, -0.9204364, 2.763576, 0, 0.4588235, 1, 1,
0.227763, 0.6260482, -0.5501513, 0, 0.454902, 1, 1,
0.2299192, 1.073916, 2.001324, 0, 0.4470588, 1, 1,
0.2312275, -0.353552, 1.023971, 0, 0.4431373, 1, 1,
0.2314743, -0.8505666, 3.223011, 0, 0.4352941, 1, 1,
0.234284, -0.7276005, 1.624686, 0, 0.4313726, 1, 1,
0.2360088, 0.6880876, 1.558822, 0, 0.4235294, 1, 1,
0.2378934, -1.493911, 3.373272, 0, 0.4196078, 1, 1,
0.240263, 1.706667, -1.723254, 0, 0.4117647, 1, 1,
0.2421115, 1.195803, -0.446259, 0, 0.4078431, 1, 1,
0.2428433, 0.185369, -0.02551454, 0, 0.4, 1, 1,
0.245421, -0.3383422, 3.850879, 0, 0.3921569, 1, 1,
0.2488028, -0.09762026, 3.200658, 0, 0.3882353, 1, 1,
0.2488315, 1.324338, 2.609791, 0, 0.3803922, 1, 1,
0.2497, 1.500154, -0.3178133, 0, 0.3764706, 1, 1,
0.2519958, -0.5981079, 3.968565, 0, 0.3686275, 1, 1,
0.2522829, 1.231799, 0.2609169, 0, 0.3647059, 1, 1,
0.2577752, 0.06819835, 0.1930866, 0, 0.3568628, 1, 1,
0.2592131, 0.2544748, 0.5761778, 0, 0.3529412, 1, 1,
0.2594291, -1.753703, 3.638125, 0, 0.345098, 1, 1,
0.2604706, 1.283349, -0.6837741, 0, 0.3411765, 1, 1,
0.260845, -1.185915, 2.192599, 0, 0.3333333, 1, 1,
0.2637173, -0.3231936, 2.629256, 0, 0.3294118, 1, 1,
0.2694994, -0.08843943, 1.896936, 0, 0.3215686, 1, 1,
0.2719666, -0.3587463, 4.970432, 0, 0.3176471, 1, 1,
0.2754553, -0.4202864, 1.56682, 0, 0.3098039, 1, 1,
0.2767723, -1.395087, 4.031874, 0, 0.3058824, 1, 1,
0.2801595, 1.021763, 1.521719, 0, 0.2980392, 1, 1,
0.28559, -0.1294845, 0.831885, 0, 0.2901961, 1, 1,
0.2867607, 0.4823163, 1.3276, 0, 0.2862745, 1, 1,
0.2875144, 0.596527, 0.8107188, 0, 0.2784314, 1, 1,
0.289019, -0.6988109, 3.48397, 0, 0.2745098, 1, 1,
0.2904154, -1.233997, 2.637898, 0, 0.2666667, 1, 1,
0.2909567, 0.9255939, 0.09087606, 0, 0.2627451, 1, 1,
0.2921756, 0.3333707, -0.2168774, 0, 0.254902, 1, 1,
0.2928452, 0.12442, 0.1410112, 0, 0.2509804, 1, 1,
0.2956712, -0.751074, 2.920717, 0, 0.2431373, 1, 1,
0.297685, -2.015285, 3.070701, 0, 0.2392157, 1, 1,
0.2988978, -0.6384795, 3.173006, 0, 0.2313726, 1, 1,
0.2992338, -0.4269349, 1.070731, 0, 0.227451, 1, 1,
0.2995164, 0.4747171, 1.094153, 0, 0.2196078, 1, 1,
0.3056567, -0.4178956, 0.9132615, 0, 0.2156863, 1, 1,
0.3124949, -1.869058, 1.748641, 0, 0.2078431, 1, 1,
0.3184925, 0.910928, 0.7839643, 0, 0.2039216, 1, 1,
0.3198365, -0.4598362, 2.032488, 0, 0.1960784, 1, 1,
0.3235599, -0.6223806, 2.836933, 0, 0.1882353, 1, 1,
0.3277671, 1.344944, 0.06702254, 0, 0.1843137, 1, 1,
0.3325572, -0.1640067, 2.543924, 0, 0.1764706, 1, 1,
0.3372577, -1.568461, 3.543507, 0, 0.172549, 1, 1,
0.341483, 0.2679829, 0.9759179, 0, 0.1647059, 1, 1,
0.3418372, -0.506015, 3.551258, 0, 0.1607843, 1, 1,
0.3472336, 0.1143814, 0.6193302, 0, 0.1529412, 1, 1,
0.3491252, 0.4884542, 2.441272, 0, 0.1490196, 1, 1,
0.3522484, -1.031808, 2.369109, 0, 0.1411765, 1, 1,
0.3550933, -1.355499, 2.621646, 0, 0.1372549, 1, 1,
0.3573374, 0.1557788, 1.632585, 0, 0.1294118, 1, 1,
0.3581477, 0.4757788, 0.9618306, 0, 0.1254902, 1, 1,
0.3596281, -0.007043374, 1.79051, 0, 0.1176471, 1, 1,
0.3776256, 1.387469, 0.1396201, 0, 0.1137255, 1, 1,
0.3782651, 0.9014944, -0.03327627, 0, 0.1058824, 1, 1,
0.3795074, 1.711358, 0.277759, 0, 0.09803922, 1, 1,
0.3843575, -1.132039, 4.440579, 0, 0.09411765, 1, 1,
0.3887948, 0.5022183, 0.7527386, 0, 0.08627451, 1, 1,
0.3919617, -0.5604455, 1.392623, 0, 0.08235294, 1, 1,
0.3950489, 0.4505471, 2.004976, 0, 0.07450981, 1, 1,
0.3965168, 0.2100842, 2.138516, 0, 0.07058824, 1, 1,
0.3986168, 0.001282901, -0.7871774, 0, 0.0627451, 1, 1,
0.3987633, -1.144609, 2.568943, 0, 0.05882353, 1, 1,
0.4026232, 0.07884462, 0.9861364, 0, 0.05098039, 1, 1,
0.4101057, 1.11992, 1.002655, 0, 0.04705882, 1, 1,
0.4102879, 0.3188401, 0.5551029, 0, 0.03921569, 1, 1,
0.4112627, 0.7891829, -1.174979, 0, 0.03529412, 1, 1,
0.4147559, -0.5957572, 3.083954, 0, 0.02745098, 1, 1,
0.4155684, -0.6534713, 2.908386, 0, 0.02352941, 1, 1,
0.4190573, -0.2459628, 1.786098, 0, 0.01568628, 1, 1,
0.4204624, 0.005396752, 0.07721196, 0, 0.01176471, 1, 1,
0.4300256, -0.01348721, 1.449108, 0, 0.003921569, 1, 1,
0.4316715, -0.1640282, 1.976134, 0.003921569, 0, 1, 1,
0.4377254, -1.180788, 3.714162, 0.007843138, 0, 1, 1,
0.4417816, 2.21081, -0.9763507, 0.01568628, 0, 1, 1,
0.4475362, 0.445883, 0.9509692, 0.01960784, 0, 1, 1,
0.4501543, -2.040608, 2.260979, 0.02745098, 0, 1, 1,
0.4524577, -1.122585, 2.195955, 0.03137255, 0, 1, 1,
0.4526777, 1.183965, 1.78092, 0.03921569, 0, 1, 1,
0.4535965, 1.810077, 0.6266556, 0.04313726, 0, 1, 1,
0.4571911, 0.2909688, 2.836437, 0.05098039, 0, 1, 1,
0.4575956, -0.3449599, 1.665001, 0.05490196, 0, 1, 1,
0.4581559, -0.9424545, 3.110771, 0.0627451, 0, 1, 1,
0.4610435, -0.3765593, 4.08649, 0.06666667, 0, 1, 1,
0.4630737, -1.437847, 0.4205291, 0.07450981, 0, 1, 1,
0.4675962, 0.649829, -1.510069, 0.07843138, 0, 1, 1,
0.4684798, -0.7800988, 4.000963, 0.08627451, 0, 1, 1,
0.4726406, -0.148339, 0.7758908, 0.09019608, 0, 1, 1,
0.4738108, 1.09582, 2.625144, 0.09803922, 0, 1, 1,
0.4748144, 1.271599, 0.7882981, 0.1058824, 0, 1, 1,
0.4752138, 0.3131508, 0.8542753, 0.1098039, 0, 1, 1,
0.477649, -0.8691396, 2.287501, 0.1176471, 0, 1, 1,
0.4794008, 0.5317253, 0.2444069, 0.1215686, 0, 1, 1,
0.4844756, -0.3011613, 1.720241, 0.1294118, 0, 1, 1,
0.4845258, -0.07693485, 2.447264, 0.1333333, 0, 1, 1,
0.4852852, -1.354193, 2.309886, 0.1411765, 0, 1, 1,
0.4911987, 0.1830513, 3.445088, 0.145098, 0, 1, 1,
0.4932054, 1.45953, -0.4606529, 0.1529412, 0, 1, 1,
0.4944853, -0.4074306, 2.286612, 0.1568628, 0, 1, 1,
0.4961606, -0.03006399, -0.3013555, 0.1647059, 0, 1, 1,
0.4973062, -0.462835, 1.440596, 0.1686275, 0, 1, 1,
0.4987429, -0.5695565, 2.240686, 0.1764706, 0, 1, 1,
0.4991285, 0.2682323, -0.4494031, 0.1803922, 0, 1, 1,
0.505832, -1.018794, 2.529633, 0.1882353, 0, 1, 1,
0.5064086, 0.4945303, 1.47518, 0.1921569, 0, 1, 1,
0.5094515, -1.102312, 2.627196, 0.2, 0, 1, 1,
0.5164882, -1.584195, 2.609964, 0.2078431, 0, 1, 1,
0.516499, -3.095219, 2.549793, 0.2117647, 0, 1, 1,
0.5187897, -0.07217202, -0.7202903, 0.2196078, 0, 1, 1,
0.5216344, 1.53864, 0.3597794, 0.2235294, 0, 1, 1,
0.5217167, -0.05505143, 0.8609931, 0.2313726, 0, 1, 1,
0.5249459, -0.2365865, 3.188538, 0.2352941, 0, 1, 1,
0.5260517, 1.649045, 0.6147803, 0.2431373, 0, 1, 1,
0.5368057, 0.7748801, 0.6685416, 0.2470588, 0, 1, 1,
0.5395932, -0.5117748, 3.221961, 0.254902, 0, 1, 1,
0.5412291, -0.05162838, 3.556655, 0.2588235, 0, 1, 1,
0.5457911, 0.1092543, 1.631562, 0.2666667, 0, 1, 1,
0.5491914, 0.6380043, 1.665379, 0.2705882, 0, 1, 1,
0.5525838, -1.132716, 3.05392, 0.2784314, 0, 1, 1,
0.5600009, 0.2464083, 1.113332, 0.282353, 0, 1, 1,
0.5612376, 1.340088, -0.1920973, 0.2901961, 0, 1, 1,
0.5633987, -1.551317, 2.001779, 0.2941177, 0, 1, 1,
0.5654901, -0.3536645, 2.325222, 0.3019608, 0, 1, 1,
0.5661715, -0.02317397, 1.20328, 0.3098039, 0, 1, 1,
0.5662633, 1.027696, -0.4417109, 0.3137255, 0, 1, 1,
0.5666246, 1.353842, 0.8060844, 0.3215686, 0, 1, 1,
0.5678419, -1.104525, 2.024674, 0.3254902, 0, 1, 1,
0.5725889, 0.4018082, 1.761419, 0.3333333, 0, 1, 1,
0.5748392, 0.4623612, 0.67326, 0.3372549, 0, 1, 1,
0.5785392, 0.6126902, 1.104155, 0.345098, 0, 1, 1,
0.5797876, 0.8112627, 1.374718, 0.3490196, 0, 1, 1,
0.5884903, 1.437909, 1.799034, 0.3568628, 0, 1, 1,
0.5904524, -1.493682, 1.827033, 0.3607843, 0, 1, 1,
0.5924526, -0.2799675, 2.790876, 0.3686275, 0, 1, 1,
0.5945278, -0.8831944, 1.584337, 0.372549, 0, 1, 1,
0.595858, 0.04684364, 2.168495, 0.3803922, 0, 1, 1,
0.5999613, -0.2546253, 3.171042, 0.3843137, 0, 1, 1,
0.6071965, 0.1237164, 1.162729, 0.3921569, 0, 1, 1,
0.6100346, -0.8974763, 1.401514, 0.3960784, 0, 1, 1,
0.6137934, -1.507408, 1.175738, 0.4039216, 0, 1, 1,
0.6183521, 0.653402, 1.084514, 0.4117647, 0, 1, 1,
0.6192429, 0.9296726, 3.237848, 0.4156863, 0, 1, 1,
0.6209753, 0.8836447, 1.865654, 0.4235294, 0, 1, 1,
0.62212, -0.3837936, 1.655606, 0.427451, 0, 1, 1,
0.6227683, -1.037954, 2.156358, 0.4352941, 0, 1, 1,
0.6229988, 0.9881984, 0.2598615, 0.4392157, 0, 1, 1,
0.6355679, -1.587741, 3.466401, 0.4470588, 0, 1, 1,
0.6419006, 1.352052, -0.3524425, 0.4509804, 0, 1, 1,
0.6525148, -0.6385974, 2.292966, 0.4588235, 0, 1, 1,
0.6525678, 0.9850525, -1.160751, 0.4627451, 0, 1, 1,
0.6538719, -0.2822247, 2.034814, 0.4705882, 0, 1, 1,
0.663066, 0.701262, -0.2812891, 0.4745098, 0, 1, 1,
0.6643649, -1.618035, 3.83895, 0.4823529, 0, 1, 1,
0.6649634, -0.6489008, 1.954121, 0.4862745, 0, 1, 1,
0.6663384, 0.582555, 1.480634, 0.4941176, 0, 1, 1,
0.669528, 1.183935, 2.138876, 0.5019608, 0, 1, 1,
0.6695749, -0.6195483, 3.004546, 0.5058824, 0, 1, 1,
0.6701651, -0.1124934, 2.681817, 0.5137255, 0, 1, 1,
0.6743931, -0.5175178, 2.800336, 0.5176471, 0, 1, 1,
0.6749055, -0.2769049, 1.759655, 0.5254902, 0, 1, 1,
0.6815798, -1.109563, 3.461714, 0.5294118, 0, 1, 1,
0.681711, 1.357196, -0.5531332, 0.5372549, 0, 1, 1,
0.682946, 0.1736266, -1.468212, 0.5411765, 0, 1, 1,
0.6849151, -0.1265977, 1.395973, 0.5490196, 0, 1, 1,
0.6871125, -1.563158, 1.795333, 0.5529412, 0, 1, 1,
0.6887429, 0.487843, 1.888386, 0.5607843, 0, 1, 1,
0.6893331, -0.6101141, 1.791212, 0.5647059, 0, 1, 1,
0.6976118, 0.2178676, 0.9407967, 0.572549, 0, 1, 1,
0.6980895, -1.069429, 1.444541, 0.5764706, 0, 1, 1,
0.6996859, 0.5811135, 1.220672, 0.5843138, 0, 1, 1,
0.701488, -1.653463, 1.616346, 0.5882353, 0, 1, 1,
0.7038435, 0.8624447, 0.03302383, 0.5960785, 0, 1, 1,
0.7040958, -0.1893618, 1.305923, 0.6039216, 0, 1, 1,
0.71154, -0.4843037, 3.189006, 0.6078432, 0, 1, 1,
0.7123042, 0.4268523, 0.7737138, 0.6156863, 0, 1, 1,
0.7287909, 0.8826264, 1.2042, 0.6196079, 0, 1, 1,
0.7355561, -0.2542473, 0.5785648, 0.627451, 0, 1, 1,
0.7374588, -0.6222754, 1.189506, 0.6313726, 0, 1, 1,
0.7385074, 0.04072193, 1.816648, 0.6392157, 0, 1, 1,
0.7426755, 0.6145085, 1.230934, 0.6431373, 0, 1, 1,
0.7463169, 0.7903648, 0.2628378, 0.6509804, 0, 1, 1,
0.747889, 0.2453607, 2.894219, 0.654902, 0, 1, 1,
0.7544528, 1.514723, 0.02800698, 0.6627451, 0, 1, 1,
0.7556773, -0.6002852, 2.909788, 0.6666667, 0, 1, 1,
0.755708, -0.3038731, 1.4046, 0.6745098, 0, 1, 1,
0.7568408, -0.4470576, 2.055911, 0.6784314, 0, 1, 1,
0.7584204, 1.123959, 1.527805, 0.6862745, 0, 1, 1,
0.7626635, -0.5593876, 3.023976, 0.6901961, 0, 1, 1,
0.7631599, 0.6367497, 3.180252, 0.6980392, 0, 1, 1,
0.7632893, 0.01600689, 1.857679, 0.7058824, 0, 1, 1,
0.7643182, -0.6494136, 3.327206, 0.7098039, 0, 1, 1,
0.7664847, -1.102869, 2.013289, 0.7176471, 0, 1, 1,
0.778218, -0.5907198, 2.326603, 0.7215686, 0, 1, 1,
0.7831075, 0.9413115, 2.145614, 0.7294118, 0, 1, 1,
0.7852271, -1.268628, 2.540603, 0.7333333, 0, 1, 1,
0.7883545, 0.8047, -0.3551583, 0.7411765, 0, 1, 1,
0.789616, -0.5760675, 1.663341, 0.7450981, 0, 1, 1,
0.795696, 1.633151, 0.09365467, 0.7529412, 0, 1, 1,
0.7968391, -1.180127, 4.071692, 0.7568628, 0, 1, 1,
0.7997727, 0.8931669, 0.3022995, 0.7647059, 0, 1, 1,
0.8006628, 1.254818, 0.3356985, 0.7686275, 0, 1, 1,
0.805217, -0.8371664, 2.414707, 0.7764706, 0, 1, 1,
0.8072056, -0.1566348, 1.386113, 0.7803922, 0, 1, 1,
0.8160456, -1.225136, 4.874196, 0.7882353, 0, 1, 1,
0.819294, -0.3457851, 1.170539, 0.7921569, 0, 1, 1,
0.8234949, -0.1448985, 0.04955924, 0.8, 0, 1, 1,
0.8255682, 0.07134082, 0.9754653, 0.8078431, 0, 1, 1,
0.8348914, -0.3017679, 3.120921, 0.8117647, 0, 1, 1,
0.8369914, -0.01704452, 3.495793, 0.8196079, 0, 1, 1,
0.840489, 0.5056094, 1.251942, 0.8235294, 0, 1, 1,
0.8507705, 0.8711761, 1.804191, 0.8313726, 0, 1, 1,
0.851357, 1.033774, 1.526629, 0.8352941, 0, 1, 1,
0.8541241, -0.5512643, 1.062413, 0.8431373, 0, 1, 1,
0.854919, 0.8005569, -0.05439319, 0.8470588, 0, 1, 1,
0.8569025, 0.116127, 1.691258, 0.854902, 0, 1, 1,
0.8685228, 1.082204, -1.061589, 0.8588235, 0, 1, 1,
0.8706356, 0.8621836, 1.14657, 0.8666667, 0, 1, 1,
0.8775685, 0.202886, 1.671698, 0.8705882, 0, 1, 1,
0.8796035, 2.403198, -0.9641432, 0.8784314, 0, 1, 1,
0.8799357, -0.1215818, 2.825254, 0.8823529, 0, 1, 1,
0.8835175, 2.565752, -0.2944001, 0.8901961, 0, 1, 1,
0.8847274, -1.331937, 2.331971, 0.8941177, 0, 1, 1,
0.894475, 0.03201655, 1.306328, 0.9019608, 0, 1, 1,
0.8981099, -1.163559, 2.775018, 0.9098039, 0, 1, 1,
0.900722, 1.192482, 2.250968, 0.9137255, 0, 1, 1,
0.9037488, 0.05528811, -0.1588124, 0.9215686, 0, 1, 1,
0.9049911, -2.045229, 1.96587, 0.9254902, 0, 1, 1,
0.9080263, -1.364437, 2.987656, 0.9333333, 0, 1, 1,
0.910024, -0.1865521, 0.9561698, 0.9372549, 0, 1, 1,
0.9132493, -0.6045766, 1.563004, 0.945098, 0, 1, 1,
0.9143503, -0.9644836, 2.480691, 0.9490196, 0, 1, 1,
0.9165374, 0.2860415, 0.5867733, 0.9568627, 0, 1, 1,
0.9185495, -0.3484405, 4.303289, 0.9607843, 0, 1, 1,
0.9289969, 0.6801655, -0.1086083, 0.9686275, 0, 1, 1,
0.9291828, 0.2887447, 2.962905, 0.972549, 0, 1, 1,
0.930263, 1.349696, 1.047669, 0.9803922, 0, 1, 1,
0.9356121, -0.7574075, 1.3398, 0.9843137, 0, 1, 1,
0.9459721, 0.7714222, -1.308826, 0.9921569, 0, 1, 1,
0.9480624, -1.275182, 2.707764, 0.9960784, 0, 1, 1,
0.9681015, -0.8175353, 2.49554, 1, 0, 0.9960784, 1,
0.9788661, -2.42421, 3.515638, 1, 0, 0.9882353, 1,
0.9839182, 0.1765801, 1.157368, 1, 0, 0.9843137, 1,
0.9868736, -0.8289546, 1.16648, 1, 0, 0.9764706, 1,
0.9872794, -0.6156702, 0.6915857, 1, 0, 0.972549, 1,
0.988735, 0.2722926, -0.834783, 1, 0, 0.9647059, 1,
0.9921249, 0.4275716, 0.5946826, 1, 0, 0.9607843, 1,
0.9958439, 0.4031365, 2.278913, 1, 0, 0.9529412, 1,
0.9973353, -0.2303754, 2.210299, 1, 0, 0.9490196, 1,
0.9985557, 0.9219835, 1.861426, 1, 0, 0.9411765, 1,
0.9987892, 0.859801, 1.336733, 1, 0, 0.9372549, 1,
1.001703, -0.8704019, 2.985134, 1, 0, 0.9294118, 1,
1.002544, 0.3673307, 0.3636937, 1, 0, 0.9254902, 1,
1.008105, -0.04585417, 1.809491, 1, 0, 0.9176471, 1,
1.00937, -0.8646289, 2.078428, 1, 0, 0.9137255, 1,
1.015833, 0.8028536, 1.321747, 1, 0, 0.9058824, 1,
1.025005, 0.2353637, -0.2535077, 1, 0, 0.9019608, 1,
1.025215, -0.3338123, 2.284275, 1, 0, 0.8941177, 1,
1.035794, -0.4315384, 1.617649, 1, 0, 0.8862745, 1,
1.040224, 0.7632148, 0.8673989, 1, 0, 0.8823529, 1,
1.040388, 0.7354749, 1.93144, 1, 0, 0.8745098, 1,
1.042197, -1.054988, 2.269887, 1, 0, 0.8705882, 1,
1.043872, -0.5677345, 0.7328861, 1, 0, 0.8627451, 1,
1.045825, 0.02658875, 1.982009, 1, 0, 0.8588235, 1,
1.050957, -0.585186, 2.355573, 1, 0, 0.8509804, 1,
1.057293, -0.549944, 1.762891, 1, 0, 0.8470588, 1,
1.058212, 1.938888, -0.8083082, 1, 0, 0.8392157, 1,
1.063362, -0.3844838, 2.848948, 1, 0, 0.8352941, 1,
1.069148, 1.317002, 2.059834, 1, 0, 0.827451, 1,
1.077325, -0.6168013, 2.771108, 1, 0, 0.8235294, 1,
1.078786, 1.633028, 2.279564, 1, 0, 0.8156863, 1,
1.085801, 0.3514274, 0.8211565, 1, 0, 0.8117647, 1,
1.087373, 0.8129106, 1.37819, 1, 0, 0.8039216, 1,
1.088773, 0.007912609, 1.329211, 1, 0, 0.7960784, 1,
1.104626, 0.1346338, 1.306141, 1, 0, 0.7921569, 1,
1.111237, -0.2501804, 2.721872, 1, 0, 0.7843137, 1,
1.112438, -2.919788, 3.161021, 1, 0, 0.7803922, 1,
1.114714, -1.065315, 2.017889, 1, 0, 0.772549, 1,
1.116376, -1.885199, 2.413804, 1, 0, 0.7686275, 1,
1.123097, -0.0518874, -0.530027, 1, 0, 0.7607843, 1,
1.134032, -0.2089844, 0.9446941, 1, 0, 0.7568628, 1,
1.134156, 0.4987298, 3.485824, 1, 0, 0.7490196, 1,
1.141376, 0.4620996, 1.251624, 1, 0, 0.7450981, 1,
1.142185, 0.3103587, 0.2876746, 1, 0, 0.7372549, 1,
1.142926, -1.113511, 2.341393, 1, 0, 0.7333333, 1,
1.152207, -0.8828582, 2.684978, 1, 0, 0.7254902, 1,
1.152774, 0.04620945, 1.577464, 1, 0, 0.7215686, 1,
1.156201, 0.04640531, 2.154751, 1, 0, 0.7137255, 1,
1.164698, -0.3046685, 0.400315, 1, 0, 0.7098039, 1,
1.164958, 1.220432, -0.5632732, 1, 0, 0.7019608, 1,
1.170779, 1.919029, 1.686142, 1, 0, 0.6941177, 1,
1.187368, -0.130152, 2.261776, 1, 0, 0.6901961, 1,
1.187527, -1.005239, 2.728617, 1, 0, 0.682353, 1,
1.189469, 0.1981392, 1.207194, 1, 0, 0.6784314, 1,
1.198868, 1.346666, 0.7389444, 1, 0, 0.6705883, 1,
1.201442, -0.7647802, 2.297493, 1, 0, 0.6666667, 1,
1.20921, -0.5395746, 2.747191, 1, 0, 0.6588235, 1,
1.216697, 0.7397889, 1.482051, 1, 0, 0.654902, 1,
1.225372, -1.027966, 3.259728, 1, 0, 0.6470588, 1,
1.226906, -0.6250738, 2.523989, 1, 0, 0.6431373, 1,
1.227367, 1.518301, 3.226128, 1, 0, 0.6352941, 1,
1.232715, -0.1011159, 1.534862, 1, 0, 0.6313726, 1,
1.239091, -0.06009237, 1.695598, 1, 0, 0.6235294, 1,
1.244182, -0.3764194, 1.193368, 1, 0, 0.6196079, 1,
1.248901, -0.6118453, 1.016654, 1, 0, 0.6117647, 1,
1.262235, 1.276564, 1.344934, 1, 0, 0.6078432, 1,
1.264449, -0.3850486, 1.888235, 1, 0, 0.6, 1,
1.272617, -2.698735, 3.638895, 1, 0, 0.5921569, 1,
1.276641, 1.904299, 1.656195, 1, 0, 0.5882353, 1,
1.279309, 1.276139, 0.4039793, 1, 0, 0.5803922, 1,
1.281813, -0.9262861, 2.257464, 1, 0, 0.5764706, 1,
1.288348, -2.170202, 2.506469, 1, 0, 0.5686275, 1,
1.291558, -0.07714918, 1.141046, 1, 0, 0.5647059, 1,
1.293505, -1.876173, 2.927743, 1, 0, 0.5568628, 1,
1.300607, 0.5909278, 0.2986791, 1, 0, 0.5529412, 1,
1.303906, -1.013129, 1.010952, 1, 0, 0.5450981, 1,
1.313266, -0.9834576, 1.518526, 1, 0, 0.5411765, 1,
1.318413, -0.5375915, 1.869193, 1, 0, 0.5333334, 1,
1.322411, -3.026257, 2.619058, 1, 0, 0.5294118, 1,
1.34272, 0.6123071, 0.1479692, 1, 0, 0.5215687, 1,
1.349646, 1.772717, 1.533124, 1, 0, 0.5176471, 1,
1.354654, 1.313169, -0.8573409, 1, 0, 0.509804, 1,
1.373347, -0.2316145, 0.8221608, 1, 0, 0.5058824, 1,
1.382566, 0.005261981, 2.344976, 1, 0, 0.4980392, 1,
1.385266, -0.7040257, 2.120877, 1, 0, 0.4901961, 1,
1.397172, 0.2881276, 1.51456, 1, 0, 0.4862745, 1,
1.398577, -0.05906146, 1.310251, 1, 0, 0.4784314, 1,
1.400584, -1.099799, 3.858127, 1, 0, 0.4745098, 1,
1.413123, -1.48666, 3.821546, 1, 0, 0.4666667, 1,
1.423635, -1.249993, 3.193125, 1, 0, 0.4627451, 1,
1.431311, 1.212397, 1.873617, 1, 0, 0.454902, 1,
1.436836, -0.06353521, 0.1741622, 1, 0, 0.4509804, 1,
1.442499, 0.05283838, 1.882961, 1, 0, 0.4431373, 1,
1.451089, 0.4817963, 1.426836, 1, 0, 0.4392157, 1,
1.451582, 2.06599, 0.0326261, 1, 0, 0.4313726, 1,
1.452644, 0.6015108, 2.531789, 1, 0, 0.427451, 1,
1.472028, -1.409673, 2.515789, 1, 0, 0.4196078, 1,
1.47261, -0.07406637, 1.996057, 1, 0, 0.4156863, 1,
1.479454, -0.73176, 0.3644361, 1, 0, 0.4078431, 1,
1.485737, 0.8954057, 0.5895635, 1, 0, 0.4039216, 1,
1.498863, -0.719798, 0.3656753, 1, 0, 0.3960784, 1,
1.511451, -0.6526959, 2.510246, 1, 0, 0.3882353, 1,
1.512787, -0.616196, 0.8491785, 1, 0, 0.3843137, 1,
1.517254, -0.2893651, 0.1241649, 1, 0, 0.3764706, 1,
1.518728, -1.614571, 0.6965103, 1, 0, 0.372549, 1,
1.5222, -0.3155156, 2.269126, 1, 0, 0.3647059, 1,
1.526031, -2.137626, 2.698291, 1, 0, 0.3607843, 1,
1.535653, -0.7494851, 2.878443, 1, 0, 0.3529412, 1,
1.541433, 0.8683158, 2.07036, 1, 0, 0.3490196, 1,
1.547173, -0.8583497, 4.188844, 1, 0, 0.3411765, 1,
1.560549, -0.1383896, 1.682872, 1, 0, 0.3372549, 1,
1.566625, -0.2233303, 0.9494274, 1, 0, 0.3294118, 1,
1.571272, -0.240153, 0.561333, 1, 0, 0.3254902, 1,
1.576508, -0.06847494, 1.247809, 1, 0, 0.3176471, 1,
1.579661, 1.663942, -0.02261274, 1, 0, 0.3137255, 1,
1.588181, 1.087565, 0.8134314, 1, 0, 0.3058824, 1,
1.589521, 0.5737188, 1.990248, 1, 0, 0.2980392, 1,
1.598021, 0.9132273, 0.03164596, 1, 0, 0.2941177, 1,
1.603015, -0.8352389, 4.955614, 1, 0, 0.2862745, 1,
1.608222, -1.184751, 1.94026, 1, 0, 0.282353, 1,
1.617824, 0.05766056, 1.79068, 1, 0, 0.2745098, 1,
1.62001, 0.4007657, 2.505324, 1, 0, 0.2705882, 1,
1.624336, -1.955062, 1.040164, 1, 0, 0.2627451, 1,
1.658585, -0.6645751, 1.769423, 1, 0, 0.2588235, 1,
1.661305, -0.2320097, 2.016651, 1, 0, 0.2509804, 1,
1.662567, -0.5267208, 1.295721, 1, 0, 0.2470588, 1,
1.668787, 0.231654, 2.147805, 1, 0, 0.2392157, 1,
1.703336, 0.140238, 1.6081, 1, 0, 0.2352941, 1,
1.711367, 1.656868, 0.7002679, 1, 0, 0.227451, 1,
1.719719, -0.1429749, 1.701497, 1, 0, 0.2235294, 1,
1.731347, 0.6300007, 1.829859, 1, 0, 0.2156863, 1,
1.731569, 0.5012318, 0.03076014, 1, 0, 0.2117647, 1,
1.759932, -0.7057011, 0.8692517, 1, 0, 0.2039216, 1,
1.761091, -0.8534362, 1.369155, 1, 0, 0.1960784, 1,
1.770134, -0.117156, 1.301562, 1, 0, 0.1921569, 1,
1.777301, 1.663353, 0.0458376, 1, 0, 0.1843137, 1,
1.777736, 0.9991174, 2.0373, 1, 0, 0.1803922, 1,
1.798376, -2.885687, 2.284646, 1, 0, 0.172549, 1,
1.801963, 0.7172899, 1.832114, 1, 0, 0.1686275, 1,
1.84346, 0.2100511, 2.507674, 1, 0, 0.1607843, 1,
1.84997, -0.07207537, 2.725514, 1, 0, 0.1568628, 1,
1.872908, -0.4703101, 2.147097, 1, 0, 0.1490196, 1,
1.890347, -0.6821753, 2.00625, 1, 0, 0.145098, 1,
1.8936, 0.02992763, 2.790327, 1, 0, 0.1372549, 1,
1.90473, 0.2323353, 1.048799, 1, 0, 0.1333333, 1,
1.90758, -0.2610632, -0.2298154, 1, 0, 0.1254902, 1,
1.915268, 0.4385123, 0.04766407, 1, 0, 0.1215686, 1,
1.933736, -0.07578003, 1.083283, 1, 0, 0.1137255, 1,
1.949227, 0.7677238, 1.137829, 1, 0, 0.1098039, 1,
1.972918, 1.433028, 0.1211136, 1, 0, 0.1019608, 1,
2.002154, -0.4053278, 4.233262, 1, 0, 0.09411765, 1,
2.002248, 0.4463027, 0.1667644, 1, 0, 0.09019608, 1,
2.034187, 0.4657216, 1.917691, 1, 0, 0.08235294, 1,
2.092974, -0.02538107, 2.303378, 1, 0, 0.07843138, 1,
2.120335, 1.758308, 1.424609, 1, 0, 0.07058824, 1,
2.161589, 0.3481815, 1.344324, 1, 0, 0.06666667, 1,
2.193066, -0.5977566, 1.925982, 1, 0, 0.05882353, 1,
2.294381, 0.4306343, 1.357693, 1, 0, 0.05490196, 1,
2.365497, -0.6028459, 1.814401, 1, 0, 0.04705882, 1,
2.388318, 0.570889, 1.151496, 1, 0, 0.04313726, 1,
2.515384, 0.3527716, 1.95487, 1, 0, 0.03529412, 1,
2.534727, 1.742174, 2.546253, 1, 0, 0.03137255, 1,
2.638644, -0.2470312, 1.319981, 1, 0, 0.02352941, 1,
2.724702, -0.762904, 1.175816, 1, 0, 0.01960784, 1,
2.803168, -0.4983174, 2.06744, 1, 0, 0.01176471, 1,
2.939005, -0.1535434, 1.30942, 1, 0, 0.007843138, 1
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
-0.388342, -4.054754, -7.322022, 0, -0.5, 0.5, 0.5,
-0.388342, -4.054754, -7.322022, 1, -0.5, 0.5, 0.5,
-0.388342, -4.054754, -7.322022, 1, 1.5, 0.5, 0.5,
-0.388342, -4.054754, -7.322022, 0, 1.5, 0.5, 0.5
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
-4.843659, -0.2647336, -7.322022, 0, -0.5, 0.5, 0.5,
-4.843659, -0.2647336, -7.322022, 1, -0.5, 0.5, 0.5,
-4.843659, -0.2647336, -7.322022, 1, 1.5, 0.5, 0.5,
-4.843659, -0.2647336, -7.322022, 0, 1.5, 0.5, 0.5
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
-4.843659, -4.054754, -0.2849994, 0, -0.5, 0.5, 0.5,
-4.843659, -4.054754, -0.2849994, 1, -0.5, 0.5, 0.5,
-4.843659, -4.054754, -0.2849994, 1, 1.5, 0.5, 0.5,
-4.843659, -4.054754, -0.2849994, 0, 1.5, 0.5, 0.5
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
-3, -3.180134, -5.698094,
2, -3.180134, -5.698094,
-3, -3.180134, -5.698094,
-3, -3.325904, -5.968749,
-2, -3.180134, -5.698094,
-2, -3.325904, -5.968749,
-1, -3.180134, -5.698094,
-1, -3.325904, -5.968749,
0, -3.180134, -5.698094,
0, -3.325904, -5.968749,
1, -3.180134, -5.698094,
1, -3.325904, -5.968749,
2, -3.180134, -5.698094,
2, -3.325904, -5.968749
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
-3, -3.617444, -6.510058, 0, -0.5, 0.5, 0.5,
-3, -3.617444, -6.510058, 1, -0.5, 0.5, 0.5,
-3, -3.617444, -6.510058, 1, 1.5, 0.5, 0.5,
-3, -3.617444, -6.510058, 0, 1.5, 0.5, 0.5,
-2, -3.617444, -6.510058, 0, -0.5, 0.5, 0.5,
-2, -3.617444, -6.510058, 1, -0.5, 0.5, 0.5,
-2, -3.617444, -6.510058, 1, 1.5, 0.5, 0.5,
-2, -3.617444, -6.510058, 0, 1.5, 0.5, 0.5,
-1, -3.617444, -6.510058, 0, -0.5, 0.5, 0.5,
-1, -3.617444, -6.510058, 1, -0.5, 0.5, 0.5,
-1, -3.617444, -6.510058, 1, 1.5, 0.5, 0.5,
-1, -3.617444, -6.510058, 0, 1.5, 0.5, 0.5,
0, -3.617444, -6.510058, 0, -0.5, 0.5, 0.5,
0, -3.617444, -6.510058, 1, -0.5, 0.5, 0.5,
0, -3.617444, -6.510058, 1, 1.5, 0.5, 0.5,
0, -3.617444, -6.510058, 0, 1.5, 0.5, 0.5,
1, -3.617444, -6.510058, 0, -0.5, 0.5, 0.5,
1, -3.617444, -6.510058, 1, -0.5, 0.5, 0.5,
1, -3.617444, -6.510058, 1, 1.5, 0.5, 0.5,
1, -3.617444, -6.510058, 0, 1.5, 0.5, 0.5,
2, -3.617444, -6.510058, 0, -0.5, 0.5, 0.5,
2, -3.617444, -6.510058, 1, -0.5, 0.5, 0.5,
2, -3.617444, -6.510058, 1, 1.5, 0.5, 0.5,
2, -3.617444, -6.510058, 0, 1.5, 0.5, 0.5
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
-3.815509, -3, -5.698094,
-3.815509, 2, -5.698094,
-3.815509, -3, -5.698094,
-3.986868, -3, -5.968749,
-3.815509, -2, -5.698094,
-3.986868, -2, -5.968749,
-3.815509, -1, -5.698094,
-3.986868, -1, -5.968749,
-3.815509, 0, -5.698094,
-3.986868, 0, -5.968749,
-3.815509, 1, -5.698094,
-3.986868, 1, -5.968749,
-3.815509, 2, -5.698094,
-3.986868, 2, -5.968749
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
-4.329585, -3, -6.510058, 0, -0.5, 0.5, 0.5,
-4.329585, -3, -6.510058, 1, -0.5, 0.5, 0.5,
-4.329585, -3, -6.510058, 1, 1.5, 0.5, 0.5,
-4.329585, -3, -6.510058, 0, 1.5, 0.5, 0.5,
-4.329585, -2, -6.510058, 0, -0.5, 0.5, 0.5,
-4.329585, -2, -6.510058, 1, -0.5, 0.5, 0.5,
-4.329585, -2, -6.510058, 1, 1.5, 0.5, 0.5,
-4.329585, -2, -6.510058, 0, 1.5, 0.5, 0.5,
-4.329585, -1, -6.510058, 0, -0.5, 0.5, 0.5,
-4.329585, -1, -6.510058, 1, -0.5, 0.5, 0.5,
-4.329585, -1, -6.510058, 1, 1.5, 0.5, 0.5,
-4.329585, -1, -6.510058, 0, 1.5, 0.5, 0.5,
-4.329585, 0, -6.510058, 0, -0.5, 0.5, 0.5,
-4.329585, 0, -6.510058, 1, -0.5, 0.5, 0.5,
-4.329585, 0, -6.510058, 1, 1.5, 0.5, 0.5,
-4.329585, 0, -6.510058, 0, 1.5, 0.5, 0.5,
-4.329585, 1, -6.510058, 0, -0.5, 0.5, 0.5,
-4.329585, 1, -6.510058, 1, -0.5, 0.5, 0.5,
-4.329585, 1, -6.510058, 1, 1.5, 0.5, 0.5,
-4.329585, 1, -6.510058, 0, 1.5, 0.5, 0.5,
-4.329585, 2, -6.510058, 0, -0.5, 0.5, 0.5,
-4.329585, 2, -6.510058, 1, -0.5, 0.5, 0.5,
-4.329585, 2, -6.510058, 1, 1.5, 0.5, 0.5,
-4.329585, 2, -6.510058, 0, 1.5, 0.5, 0.5
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
-3.815509, -3.180134, -4,
-3.815509, -3.180134, 4,
-3.815509, -3.180134, -4,
-3.986868, -3.325904, -4,
-3.815509, -3.180134, -2,
-3.986868, -3.325904, -2,
-3.815509, -3.180134, 0,
-3.986868, -3.325904, 0,
-3.815509, -3.180134, 2,
-3.986868, -3.325904, 2,
-3.815509, -3.180134, 4,
-3.986868, -3.325904, 4
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
-4.329585, -3.617444, -4, 0, -0.5, 0.5, 0.5,
-4.329585, -3.617444, -4, 1, -0.5, 0.5, 0.5,
-4.329585, -3.617444, -4, 1, 1.5, 0.5, 0.5,
-4.329585, -3.617444, -4, 0, 1.5, 0.5, 0.5,
-4.329585, -3.617444, -2, 0, -0.5, 0.5, 0.5,
-4.329585, -3.617444, -2, 1, -0.5, 0.5, 0.5,
-4.329585, -3.617444, -2, 1, 1.5, 0.5, 0.5,
-4.329585, -3.617444, -2, 0, 1.5, 0.5, 0.5,
-4.329585, -3.617444, 0, 0, -0.5, 0.5, 0.5,
-4.329585, -3.617444, 0, 1, -0.5, 0.5, 0.5,
-4.329585, -3.617444, 0, 1, 1.5, 0.5, 0.5,
-4.329585, -3.617444, 0, 0, 1.5, 0.5, 0.5,
-4.329585, -3.617444, 2, 0, -0.5, 0.5, 0.5,
-4.329585, -3.617444, 2, 1, -0.5, 0.5, 0.5,
-4.329585, -3.617444, 2, 1, 1.5, 0.5, 0.5,
-4.329585, -3.617444, 2, 0, 1.5, 0.5, 0.5,
-4.329585, -3.617444, 4, 0, -0.5, 0.5, 0.5,
-4.329585, -3.617444, 4, 1, -0.5, 0.5, 0.5,
-4.329585, -3.617444, 4, 1, 1.5, 0.5, 0.5,
-4.329585, -3.617444, 4, 0, 1.5, 0.5, 0.5
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
-3.815509, -3.180134, -5.698094,
-3.815509, 2.650667, -5.698094,
-3.815509, -3.180134, 5.128095,
-3.815509, 2.650667, 5.128095,
-3.815509, -3.180134, -5.698094,
-3.815509, -3.180134, 5.128095,
-3.815509, 2.650667, -5.698094,
-3.815509, 2.650667, 5.128095,
-3.815509, -3.180134, -5.698094,
3.038825, -3.180134, -5.698094,
-3.815509, -3.180134, 5.128095,
3.038825, -3.180134, 5.128095,
-3.815509, 2.650667, -5.698094,
3.038825, 2.650667, -5.698094,
-3.815509, 2.650667, 5.128095,
3.038825, 2.650667, 5.128095,
3.038825, -3.180134, -5.698094,
3.038825, 2.650667, -5.698094,
3.038825, -3.180134, 5.128095,
3.038825, 2.650667, 5.128095,
3.038825, -3.180134, -5.698094,
3.038825, -3.180134, 5.128095,
3.038825, 2.650667, -5.698094,
3.038825, 2.650667, 5.128095
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
var radius = 7.517311;
var distance = 33.44537;
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
mvMatrix.translate( 0.388342, 0.2647336, 0.2849994 );
mvMatrix.scale( 1.185799, 1.393953, 0.7507595 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.44537);
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
prometryn<-read.table("prometryn.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prometryn$V2
```

```
## Error in eval(expr, envir, enclos): object 'prometryn' not found
```

```r
y<-prometryn$V3
```

```
## Error in eval(expr, envir, enclos): object 'prometryn' not found
```

```r
z<-prometryn$V4
```

```
## Error in eval(expr, envir, enclos): object 'prometryn' not found
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
-3.715689, 0.2128766, -0.980081, 0, 0, 1, 1, 1,
-3.369655, 0.3886082, -3.040057, 1, 0, 0, 1, 1,
-3.074629, 1.034389, -1.520181, 1, 0, 0, 1, 1,
-2.881163, 0.04349488, -1.186578, 1, 0, 0, 1, 1,
-2.717414, -0.7348587, -1.998326, 1, 0, 0, 1, 1,
-2.514366, -0.5852416, -2.616578, 1, 0, 0, 1, 1,
-2.506796, -1.703551, -1.11771, 0, 0, 0, 1, 1,
-2.467387, 1.307879, -0.9997221, 0, 0, 0, 1, 1,
-2.450617, -1.44646, -1.842822, 0, 0, 0, 1, 1,
-2.418544, -0.1477495, -2.019952, 0, 0, 0, 1, 1,
-2.306726, -0.5832599, -0.6307814, 0, 0, 0, 1, 1,
-2.262309, 0.6569283, -2.528636, 0, 0, 0, 1, 1,
-2.205166, -2.295332, -1.871907, 0, 0, 0, 1, 1,
-2.200988, 0.1020158, 0.3226823, 1, 1, 1, 1, 1,
-2.198323, -0.7213221, -1.857322, 1, 1, 1, 1, 1,
-2.192699, 0.2334238, -1.454764, 1, 1, 1, 1, 1,
-2.177989, -0.1150179, -1.610203, 1, 1, 1, 1, 1,
-2.160936, 0.7718611, -0.539947, 1, 1, 1, 1, 1,
-2.109524, 1.98638, -2.254088, 1, 1, 1, 1, 1,
-2.082387, 0.6375037, 0.1668858, 1, 1, 1, 1, 1,
-2.079494, -0.1926945, -0.4780577, 1, 1, 1, 1, 1,
-2.050128, 0.4862921, -2.310144, 1, 1, 1, 1, 1,
-2.028502, 0.2337062, -2.368672, 1, 1, 1, 1, 1,
-2.024113, 0.3690647, -1.54456, 1, 1, 1, 1, 1,
-2.002022, -1.43543, -1.029078, 1, 1, 1, 1, 1,
-1.987566, -0.8791611, -2.961567, 1, 1, 1, 1, 1,
-1.901636, 0.06733713, -2.665685, 1, 1, 1, 1, 1,
-1.874802, 0.6013424, -2.249941, 1, 1, 1, 1, 1,
-1.874631, -1.574556, -2.55455, 0, 0, 1, 1, 1,
-1.869723, 1.624135, -1.377244, 1, 0, 0, 1, 1,
-1.867156, 0.9384767, -0.4386288, 1, 0, 0, 1, 1,
-1.864285, -1.340935, -3.2037, 1, 0, 0, 1, 1,
-1.845627, 1.150988, -1.550265, 1, 0, 0, 1, 1,
-1.83406, 1.282056, -1.721151, 1, 0, 0, 1, 1,
-1.83243, 2.174899, 0.08428048, 0, 0, 0, 1, 1,
-1.788259, 0.3270879, 0.3188638, 0, 0, 0, 1, 1,
-1.783753, -1.641078, -2.849834, 0, 0, 0, 1, 1,
-1.76392, 2.058564, -1.219387, 0, 0, 0, 1, 1,
-1.759926, -0.2006195, -4.081066, 0, 0, 0, 1, 1,
-1.758791, -0.889663, -1.963422, 0, 0, 0, 1, 1,
-1.751123, 0.6658824, -1.40576, 0, 0, 0, 1, 1,
-1.749464, -1.131859, -1.577043, 1, 1, 1, 1, 1,
-1.749033, 1.708568, -0.2554139, 1, 1, 1, 1, 1,
-1.729771, -0.4729179, -1.345784, 1, 1, 1, 1, 1,
-1.720819, 0.32827, -2.65357, 1, 1, 1, 1, 1,
-1.715389, -0.8925739, -0.895825, 1, 1, 1, 1, 1,
-1.712332, 0.4722871, -1.709257, 1, 1, 1, 1, 1,
-1.703453, 0.9553139, -1.179339, 1, 1, 1, 1, 1,
-1.694255, 0.6407203, 0.2816113, 1, 1, 1, 1, 1,
-1.688904, -0.4672619, -3.15832, 1, 1, 1, 1, 1,
-1.679962, -1.993438, -1.941513, 1, 1, 1, 1, 1,
-1.672796, -0.767265, -1.713281, 1, 1, 1, 1, 1,
-1.667226, 2.487396, 0.843667, 1, 1, 1, 1, 1,
-1.666425, 0.5298236, -0.7219919, 1, 1, 1, 1, 1,
-1.658795, 0.09361327, -2.07178, 1, 1, 1, 1, 1,
-1.654372, -1.909374, -3.372514, 1, 1, 1, 1, 1,
-1.642017, 0.7288234, -1.745658, 0, 0, 1, 1, 1,
-1.640016, -0.5595967, -1.421613, 1, 0, 0, 1, 1,
-1.615014, -0.6254871, -1.227883, 1, 0, 0, 1, 1,
-1.603819, 0.7102423, -0.1622588, 1, 0, 0, 1, 1,
-1.594843, -0.06098198, -3.180493, 1, 0, 0, 1, 1,
-1.554914, -1.612269, -1.109694, 1, 0, 0, 1, 1,
-1.539488, 0.9738392, -0.6907818, 0, 0, 0, 1, 1,
-1.528355, -0.6423256, -2.760391, 0, 0, 0, 1, 1,
-1.526828, -0.5321428, -0.4117218, 0, 0, 0, 1, 1,
-1.525946, -0.9174753, -1.073373, 0, 0, 0, 1, 1,
-1.522822, 0.7350457, 1.275291, 0, 0, 0, 1, 1,
-1.513523, 2.302855, 0.06633089, 0, 0, 0, 1, 1,
-1.506302, 1.21671, -1.611369, 0, 0, 0, 1, 1,
-1.503412, -0.6771401, -4.454338, 1, 1, 1, 1, 1,
-1.490387, 1.034318, -0.9672329, 1, 1, 1, 1, 1,
-1.468644, 0.04898518, -1.277634, 1, 1, 1, 1, 1,
-1.445322, -0.647212, -2.678783, 1, 1, 1, 1, 1,
-1.436782, -0.7956154, -1.750992, 1, 1, 1, 1, 1,
-1.434867, 1.462593, -2.658445, 1, 1, 1, 1, 1,
-1.432152, 0.6368984, 0.1832686, 1, 1, 1, 1, 1,
-1.429975, -0.625407, -0.7933503, 1, 1, 1, 1, 1,
-1.4262, 1.648931, -0.7694373, 1, 1, 1, 1, 1,
-1.425365, -0.7858554, -1.572793, 1, 1, 1, 1, 1,
-1.410109, 1.163786, -1.976667, 1, 1, 1, 1, 1,
-1.404983, -0.312932, -0.7669402, 1, 1, 1, 1, 1,
-1.392756, 1.933372, -1.25772, 1, 1, 1, 1, 1,
-1.388312, 1.352599, -2.240136, 1, 1, 1, 1, 1,
-1.3865, 1.055536, -2.154819, 1, 1, 1, 1, 1,
-1.385319, -0.8054897, -1.478915, 0, 0, 1, 1, 1,
-1.38227, -0.4705794, -2.87753, 1, 0, 0, 1, 1,
-1.38118, 0.5606806, -2.272569, 1, 0, 0, 1, 1,
-1.379647, -0.2432313, -4.27949, 1, 0, 0, 1, 1,
-1.373797, -0.0679687, -0.8334126, 1, 0, 0, 1, 1,
-1.370573, -0.2424553, -2.151655, 1, 0, 0, 1, 1,
-1.370542, -0.6207926, -1.52954, 0, 0, 0, 1, 1,
-1.361617, 1.149141, -2.19873, 0, 0, 0, 1, 1,
-1.349391, -0.6777408, -0.4702218, 0, 0, 0, 1, 1,
-1.348884, 0.6928664, -2.032169, 0, 0, 0, 1, 1,
-1.347061, 2.021216, -1.617931, 0, 0, 0, 1, 1,
-1.343979, -1.867976, -3.406167, 0, 0, 0, 1, 1,
-1.341311, 1.427674, -0.9914693, 0, 0, 0, 1, 1,
-1.339269, -1.647113, -2.430272, 1, 1, 1, 1, 1,
-1.335691, -0.3681245, -3.901645, 1, 1, 1, 1, 1,
-1.325244, -0.6258076, -2.385571, 1, 1, 1, 1, 1,
-1.321458, -0.5034438, -2.886574, 1, 1, 1, 1, 1,
-1.308182, -1.19283, -3.592009, 1, 1, 1, 1, 1,
-1.299935, 0.1269578, -1.79494, 1, 1, 1, 1, 1,
-1.286187, -0.3636751, -3.714588, 1, 1, 1, 1, 1,
-1.282774, 0.2940746, -2.536439, 1, 1, 1, 1, 1,
-1.281616, 1.378906, -0.840281, 1, 1, 1, 1, 1,
-1.274664, 0.672831, -2.613614, 1, 1, 1, 1, 1,
-1.266836, 0.7077597, -1.937966, 1, 1, 1, 1, 1,
-1.262284, -0.4146434, -1.232536, 1, 1, 1, 1, 1,
-1.254632, 0.3627703, -1.901868, 1, 1, 1, 1, 1,
-1.245606, 0.6164246, -0.5937977, 1, 1, 1, 1, 1,
-1.238588, -1.276798, -0.9650319, 1, 1, 1, 1, 1,
-1.236577, 1.258108, -0.690079, 0, 0, 1, 1, 1,
-1.232695, -0.1371788, -1.167851, 1, 0, 0, 1, 1,
-1.230316, 1.256359, 0.781705, 1, 0, 0, 1, 1,
-1.226735, -0.1382739, -2.192027, 1, 0, 0, 1, 1,
-1.214065, 0.8822551, -0.9590846, 1, 0, 0, 1, 1,
-1.208176, 0.0976037, -2.315212, 1, 0, 0, 1, 1,
-1.207277, 0.6957793, -1.746164, 0, 0, 0, 1, 1,
-1.203897, 1.125709, -0.8782639, 0, 0, 0, 1, 1,
-1.200174, 0.2475397, -3.314953, 0, 0, 0, 1, 1,
-1.194072, 1.196655, -1.561427, 0, 0, 0, 1, 1,
-1.192922, -2.238795, -2.238994, 0, 0, 0, 1, 1,
-1.188225, -0.3858123, -0.7852338, 0, 0, 0, 1, 1,
-1.17924, -1.708762, -3.59408, 0, 0, 0, 1, 1,
-1.178108, -0.6447739, -2.718588, 1, 1, 1, 1, 1,
-1.177316, 0.09077935, -1.000344, 1, 1, 1, 1, 1,
-1.163948, 0.7022216, -0.5025181, 1, 1, 1, 1, 1,
-1.160367, 1.291927, -2.071552, 1, 1, 1, 1, 1,
-1.159374, 0.3177705, -1.869634, 1, 1, 1, 1, 1,
-1.158006, -0.4436404, -1.3357, 1, 1, 1, 1, 1,
-1.147469, -1.537499, -2.5246, 1, 1, 1, 1, 1,
-1.145161, 0.4010877, -2.288357, 1, 1, 1, 1, 1,
-1.144995, 0.5829538, -1.518469, 1, 1, 1, 1, 1,
-1.134842, 0.3470024, -0.8497276, 1, 1, 1, 1, 1,
-1.128432, -0.0004558424, -1.954712, 1, 1, 1, 1, 1,
-1.123325, 1.07544, -1.966215, 1, 1, 1, 1, 1,
-1.105656, -0.5749291, -3.258016, 1, 1, 1, 1, 1,
-1.104718, -0.2563885, -1.115228, 1, 1, 1, 1, 1,
-1.085317, 1.325993, -1.678129, 1, 1, 1, 1, 1,
-1.081363, 2.52652, -1.005202, 0, 0, 1, 1, 1,
-1.081087, 0.2384331, -1.148265, 1, 0, 0, 1, 1,
-1.073644, 0.01160272, -2.713325, 1, 0, 0, 1, 1,
-1.06174, -1.223814, -4.762416, 1, 0, 0, 1, 1,
-1.06051, 0.4469279, -2.660808, 1, 0, 0, 1, 1,
-1.042489, -0.9941171, -2.356823, 1, 0, 0, 1, 1,
-1.041723, -0.5269995, -3.380301, 0, 0, 0, 1, 1,
-1.039671, 1.251169, 0.9438306, 0, 0, 0, 1, 1,
-1.029313, -0.5503639, -2.884313, 0, 0, 0, 1, 1,
-1.02889, -0.5663837, -3.093472, 0, 0, 0, 1, 1,
-1.027659, 0.2782816, -0.4846998, 0, 0, 0, 1, 1,
-1.021371, 0.109953, -0.9075613, 0, 0, 0, 1, 1,
-1.015526, -0.1490463, 0.7728693, 0, 0, 0, 1, 1,
-0.9995356, -0.7239391, -1.662657, 1, 1, 1, 1, 1,
-0.9942067, -1.31519, -3.267517, 1, 1, 1, 1, 1,
-0.9931191, -0.7347354, -1.716494, 1, 1, 1, 1, 1,
-0.9893621, 0.8350592, -0.5607899, 1, 1, 1, 1, 1,
-0.9872301, 1.676769, -1.123698, 1, 1, 1, 1, 1,
-0.9862476, -1.379974, -0.8083832, 1, 1, 1, 1, 1,
-0.9847047, 1.33701, -1.518749, 1, 1, 1, 1, 1,
-0.979444, -1.271735, -2.480577, 1, 1, 1, 1, 1,
-0.9790287, 0.1626442, -2.799423, 1, 1, 1, 1, 1,
-0.968172, -0.4712136, -2.513703, 1, 1, 1, 1, 1,
-0.9632951, 0.9778861, -1.444652, 1, 1, 1, 1, 1,
-0.9503304, -0.8395644, -2.791754, 1, 1, 1, 1, 1,
-0.9465016, 0.3202904, -1.253428, 1, 1, 1, 1, 1,
-0.9435721, -0.05205137, -0.7281528, 1, 1, 1, 1, 1,
-0.9402809, 1.010105, 0.1776993, 1, 1, 1, 1, 1,
-0.9370246, 0.2783201, -3.288431, 0, 0, 1, 1, 1,
-0.9353153, 0.9782277, -1.228963, 1, 0, 0, 1, 1,
-0.9344739, 1.276669, -1.268199, 1, 0, 0, 1, 1,
-0.9331297, -1.398268, -1.486416, 1, 0, 0, 1, 1,
-0.9253153, 0.8914027, -0.470788, 1, 0, 0, 1, 1,
-0.909104, -0.6622136, -1.629089, 1, 0, 0, 1, 1,
-0.9089768, -1.76531, -2.946599, 0, 0, 0, 1, 1,
-0.9078844, -0.0117684, -1.168393, 0, 0, 0, 1, 1,
-0.9057718, 0.1352163, -2.299319, 0, 0, 0, 1, 1,
-0.8992141, 0.1903029, -0.9306878, 0, 0, 0, 1, 1,
-0.8986983, -1.650159, -2.694664, 0, 0, 0, 1, 1,
-0.8977278, -0.4467779, -2.181948, 0, 0, 0, 1, 1,
-0.8873912, -0.604082, -2.113084, 0, 0, 0, 1, 1,
-0.8812811, 0.7899806, -2.228431, 1, 1, 1, 1, 1,
-0.8800578, 0.3175627, -3.62173, 1, 1, 1, 1, 1,
-0.8759131, -1.201388, -3.166338, 1, 1, 1, 1, 1,
-0.8751879, -0.7053112, -2.657981, 1, 1, 1, 1, 1,
-0.8658535, -0.1920626, -1.62246, 1, 1, 1, 1, 1,
-0.852134, 0.1068235, -2.013558, 1, 1, 1, 1, 1,
-0.8511484, 1.258027, -1.041149, 1, 1, 1, 1, 1,
-0.8503256, 0.1821029, -1.097238, 1, 1, 1, 1, 1,
-0.8437211, -0.7120366, -0.9775857, 1, 1, 1, 1, 1,
-0.8380815, -0.9118168, -1.985433, 1, 1, 1, 1, 1,
-0.8339036, 1.47487, -0.2046608, 1, 1, 1, 1, 1,
-0.8317888, -0.03150228, -1.852487, 1, 1, 1, 1, 1,
-0.8298739, 0.4639309, 0.03766316, 1, 1, 1, 1, 1,
-0.8290714, -1.300443, -1.541256, 1, 1, 1, 1, 1,
-0.8229737, -1.109037, -5.540431, 1, 1, 1, 1, 1,
-0.822442, 0.4960375, 0.07007252, 0, 0, 1, 1, 1,
-0.8206301, 1.385407, -0.005032586, 1, 0, 0, 1, 1,
-0.8173974, -0.2825327, -1.798082, 1, 0, 0, 1, 1,
-0.8092507, 1.062177, -0.6581812, 1, 0, 0, 1, 1,
-0.8089282, -1.57952, -0.9799074, 1, 0, 0, 1, 1,
-0.8004812, 0.5587654, -1.196596, 1, 0, 0, 1, 1,
-0.7972002, -1.667376, -3.447849, 0, 0, 0, 1, 1,
-0.7951839, 0.4643128, -1.370987, 0, 0, 0, 1, 1,
-0.7893424, -0.2457827, -1.327688, 0, 0, 0, 1, 1,
-0.7842488, 0.3716846, -0.8527165, 0, 0, 0, 1, 1,
-0.7773149, 0.01011218, -1.029999, 0, 0, 0, 1, 1,
-0.7760248, -1.020399, -2.882705, 0, 0, 0, 1, 1,
-0.7747495, 0.6611542, -2.493602, 0, 0, 0, 1, 1,
-0.7703317, 0.1275818, -2.55116, 1, 1, 1, 1, 1,
-0.7699763, -1.163708, -2.719401, 1, 1, 1, 1, 1,
-0.763922, 0.7867247, -2.341836, 1, 1, 1, 1, 1,
-0.7598004, -0.7832174, -3.060712, 1, 1, 1, 1, 1,
-0.7574987, 0.2763014, -1.397246, 1, 1, 1, 1, 1,
-0.7565102, 0.02536028, -0.77561, 1, 1, 1, 1, 1,
-0.7550268, -0.1127679, -1.983713, 1, 1, 1, 1, 1,
-0.7489161, 2.270268, -0.3575705, 1, 1, 1, 1, 1,
-0.7487816, -0.1940843, -3.287179, 1, 1, 1, 1, 1,
-0.7474071, 1.39427, 0.01353593, 1, 1, 1, 1, 1,
-0.745937, -1.088639, -2.505467, 1, 1, 1, 1, 1,
-0.7389852, 0.9039512, 0.406608, 1, 1, 1, 1, 1,
-0.7272803, -0.3963341, -0.73285, 1, 1, 1, 1, 1,
-0.7253844, 0.6130325, -0.7293774, 1, 1, 1, 1, 1,
-0.7236828, -1.48025, -3.864436, 1, 1, 1, 1, 1,
-0.7174383, 0.2506214, -1.244467, 0, 0, 1, 1, 1,
-0.7168819, 0.08662555, 1.789988, 1, 0, 0, 1, 1,
-0.7124282, 0.4343304, -1.88941, 1, 0, 0, 1, 1,
-0.7108273, -1.941562, -2.713898, 1, 0, 0, 1, 1,
-0.6983526, 0.5752601, -2.004072, 1, 0, 0, 1, 1,
-0.6975956, 0.4042814, 0.4305725, 1, 0, 0, 1, 1,
-0.6971709, -1.65021, -2.255709, 0, 0, 0, 1, 1,
-0.6970874, 0.7959654, -0.3907766, 0, 0, 0, 1, 1,
-0.6956866, -0.3122976, -2.683596, 0, 0, 0, 1, 1,
-0.6926174, 0.8620909, -1.071537, 0, 0, 0, 1, 1,
-0.6900202, -1.143638, -3.456112, 0, 0, 0, 1, 1,
-0.6886133, 0.644693, -0.2762094, 0, 0, 0, 1, 1,
-0.6882387, -0.7584782, -1.641635, 0, 0, 0, 1, 1,
-0.6849078, -1.216721, -2.652538, 1, 1, 1, 1, 1,
-0.6847854, 1.675982, 1.607152, 1, 1, 1, 1, 1,
-0.6776075, 0.7211003, -1.114589, 1, 1, 1, 1, 1,
-0.675694, 0.4769008, -0.2606281, 1, 1, 1, 1, 1,
-0.6719335, -1.289215, -4.171501, 1, 1, 1, 1, 1,
-0.6709415, -1.194397, -2.358012, 1, 1, 1, 1, 1,
-0.6706083, -1.104549, -1.674828, 1, 1, 1, 1, 1,
-0.6660032, 0.2202429, -0.1590535, 1, 1, 1, 1, 1,
-0.66588, -0.8075272, -3.746428, 1, 1, 1, 1, 1,
-0.664861, 1.275339, -0.4251158, 1, 1, 1, 1, 1,
-0.6582665, 1.355805, -0.5661405, 1, 1, 1, 1, 1,
-0.6566495, -0.7834232, -1.090357, 1, 1, 1, 1, 1,
-0.6527013, 1.287193, -0.411714, 1, 1, 1, 1, 1,
-0.6522115, -0.5685608, -1.577889, 1, 1, 1, 1, 1,
-0.6507649, 0.9121451, -0.6840627, 1, 1, 1, 1, 1,
-0.6501973, -1.504779, -3.330204, 0, 0, 1, 1, 1,
-0.6496736, 1.262702, -0.1456732, 1, 0, 0, 1, 1,
-0.6471925, 1.309162, -1.47621, 1, 0, 0, 1, 1,
-0.6415504, 1.007615, -0.7114044, 1, 0, 0, 1, 1,
-0.6388049, -0.08847358, -1.176942, 1, 0, 0, 1, 1,
-0.6363025, 2.036101, -1.023363, 1, 0, 0, 1, 1,
-0.6343552, 0.04564428, -2.117816, 0, 0, 0, 1, 1,
-0.6336083, 0.6108321, 0.1515265, 0, 0, 0, 1, 1,
-0.6261588, -1.219111, -3.805839, 0, 0, 0, 1, 1,
-0.6231425, 0.1215293, -0.7480095, 0, 0, 0, 1, 1,
-0.6220267, -0.4908862, -1.862473, 0, 0, 0, 1, 1,
-0.6192399, -0.8834301, -3.609691, 0, 0, 0, 1, 1,
-0.617847, -0.155798, -2.991326, 0, 0, 0, 1, 1,
-0.6173657, -0.4695998, -1.046585, 1, 1, 1, 1, 1,
-0.6144276, 0.02583376, -2.072415, 1, 1, 1, 1, 1,
-0.611076, -0.27674, -1.549581, 1, 1, 1, 1, 1,
-0.6095806, 0.5924113, -0.2520372, 1, 1, 1, 1, 1,
-0.6071437, -0.3285205, -1.433383, 1, 1, 1, 1, 1,
-0.6066731, -0.1352399, -0.08068471, 1, 1, 1, 1, 1,
-0.6064776, 0.9302669, -1.815327, 1, 1, 1, 1, 1,
-0.6058899, -0.6470326, -2.861989, 1, 1, 1, 1, 1,
-0.6048428, -0.9160722, -3.2387, 1, 1, 1, 1, 1,
-0.6037892, -0.32259, -3.460652, 1, 1, 1, 1, 1,
-0.601697, 1.577106, -0.02012542, 1, 1, 1, 1, 1,
-0.5979916, -0.06211696, -2.076441, 1, 1, 1, 1, 1,
-0.5979263, 0.2002991, -0.4874016, 1, 1, 1, 1, 1,
-0.5976592, 0.1009287, -0.5139287, 1, 1, 1, 1, 1,
-0.5962587, 1.870901, -0.5082334, 1, 1, 1, 1, 1,
-0.5819849, 0.2022103, -2.134013, 0, 0, 1, 1, 1,
-0.5661018, -0.7284055, -3.40436, 1, 0, 0, 1, 1,
-0.5609987, -1.5105, -2.127539, 1, 0, 0, 1, 1,
-0.5535762, -0.09396209, -3.420819, 1, 0, 0, 1, 1,
-0.5408353, -0.3704728, -2.058016, 1, 0, 0, 1, 1,
-0.5403055, -1.527512, -3.265214, 1, 0, 0, 1, 1,
-0.5394863, -1.394956, -5.080265, 0, 0, 0, 1, 1,
-0.5391974, -1.245275, -2.456036, 0, 0, 0, 1, 1,
-0.5383033, -2.124364, -2.200224, 0, 0, 0, 1, 1,
-0.5208257, 0.4870531, -2.7044, 0, 0, 0, 1, 1,
-0.5200626, -0.3256784, -3.254217, 0, 0, 0, 1, 1,
-0.5144234, -1.215934, -2.979504, 0, 0, 0, 1, 1,
-0.514114, -0.3172582, -2.142887, 0, 0, 0, 1, 1,
-0.5135752, 0.1833716, -3.471517, 1, 1, 1, 1, 1,
-0.5135563, 0.4514668, -0.3684981, 1, 1, 1, 1, 1,
-0.5128482, -0.8484722, -1.986036, 1, 1, 1, 1, 1,
-0.5106254, 0.6875717, -0.2563784, 1, 1, 1, 1, 1,
-0.5094647, 0.303238, -1.809332, 1, 1, 1, 1, 1,
-0.5074613, -0.6428945, -2.473241, 1, 1, 1, 1, 1,
-0.5052567, 0.3851042, -1.512841, 1, 1, 1, 1, 1,
-0.5015782, -0.1602167, -2.947551, 1, 1, 1, 1, 1,
-0.4977274, 0.2423169, -2.716253, 1, 1, 1, 1, 1,
-0.4969257, -1.40216, -3.430895, 1, 1, 1, 1, 1,
-0.4955605, 0.03896074, -0.7154447, 1, 1, 1, 1, 1,
-0.4938407, -0.1055851, -2.141068, 1, 1, 1, 1, 1,
-0.4921451, -0.2567252, -0.5546704, 1, 1, 1, 1, 1,
-0.4893276, 0.6636382, 0.5656604, 1, 1, 1, 1, 1,
-0.4863018, 1.703887, -0.7648218, 1, 1, 1, 1, 1,
-0.4811618, -1.632736, -3.853287, 0, 0, 1, 1, 1,
-0.4773943, -0.5683938, -2.687634, 1, 0, 0, 1, 1,
-0.4766603, -1.759052, -2.94736, 1, 0, 0, 1, 1,
-0.4759343, -0.5996075, -1.957013, 1, 0, 0, 1, 1,
-0.4749039, -1.176419, -0.6145871, 1, 0, 0, 1, 1,
-0.4744344, 0.2038544, -2.077536, 1, 0, 0, 1, 1,
-0.4733463, -1.0814, -2.357741, 0, 0, 0, 1, 1,
-0.4707739, -0.8352462, -2.707796, 0, 0, 0, 1, 1,
-0.4696101, 0.7009325, -1.45688, 0, 0, 0, 1, 1,
-0.4648255, -0.7340302, -2.934338, 0, 0, 0, 1, 1,
-0.4626148, 0.2362221, -0.6523076, 0, 0, 0, 1, 1,
-0.4590276, 0.4001706, -1.568654, 0, 0, 0, 1, 1,
-0.4587131, 1.018709, -0.9147252, 0, 0, 0, 1, 1,
-0.4571415, -1.350094, -2.980579, 1, 1, 1, 1, 1,
-0.4566232, 0.0255309, -0.9216344, 1, 1, 1, 1, 1,
-0.4476249, -1.025587, -2.867164, 1, 1, 1, 1, 1,
-0.4462526, -0.7627934, -2.926991, 1, 1, 1, 1, 1,
-0.4452606, -1.656737, -1.491477, 1, 1, 1, 1, 1,
-0.4449742, -0.1361359, -2.258911, 1, 1, 1, 1, 1,
-0.4420294, -0.6038603, -3.531481, 1, 1, 1, 1, 1,
-0.4381879, 0.8888292, 0.5228813, 1, 1, 1, 1, 1,
-0.4371152, 0.006466453, -0.04409621, 1, 1, 1, 1, 1,
-0.4365256, -0.4549904, -1.838209, 1, 1, 1, 1, 1,
-0.4358076, -0.0375396, -1.453769, 1, 1, 1, 1, 1,
-0.4325297, 1.339364, 0.02336233, 1, 1, 1, 1, 1,
-0.4244721, -0.8026298, -0.9238529, 1, 1, 1, 1, 1,
-0.4234638, 0.7403834, -1.066589, 1, 1, 1, 1, 1,
-0.4177337, 0.6381096, -1.919133, 1, 1, 1, 1, 1,
-0.4174635, 0.2246024, -2.129436, 0, 0, 1, 1, 1,
-0.4171979, -0.6320943, -3.442084, 1, 0, 0, 1, 1,
-0.4126986, 0.1546067, -1.004405, 1, 0, 0, 1, 1,
-0.4067246, 1.757286, 0.661567, 1, 0, 0, 1, 1,
-0.4055363, 0.2898938, -0.07651697, 1, 0, 0, 1, 1,
-0.4054457, -0.09976617, -1.857475, 1, 0, 0, 1, 1,
-0.4047456, -1.731194, -2.944463, 0, 0, 0, 1, 1,
-0.4034203, -0.6214026, -2.205563, 0, 0, 0, 1, 1,
-0.4018292, 1.691675, -0.87767, 0, 0, 0, 1, 1,
-0.3984641, 0.5522875, -0.119854, 0, 0, 0, 1, 1,
-0.3967966, 1.216237, -0.6058913, 0, 0, 0, 1, 1,
-0.3949151, 0.1821988, -1.386994, 0, 0, 0, 1, 1,
-0.3874254, -1.152929, -0.6474422, 0, 0, 0, 1, 1,
-0.3861016, -1.691149, -2.273593, 1, 1, 1, 1, 1,
-0.3854376, 0.01741892, -0.9058882, 1, 1, 1, 1, 1,
-0.3823434, -1.307627, -2.616698, 1, 1, 1, 1, 1,
-0.3822774, -0.2567412, -1.724728, 1, 1, 1, 1, 1,
-0.3808164, -0.4548754, -3.211649, 1, 1, 1, 1, 1,
-0.3790266, 1.346926, -0.05001574, 1, 1, 1, 1, 1,
-0.376682, -0.6109545, -3.54333, 1, 1, 1, 1, 1,
-0.374966, 0.1316384, -1.324426, 1, 1, 1, 1, 1,
-0.3747062, -0.4100954, -1.417216, 1, 1, 1, 1, 1,
-0.3746912, -0.4097642, -2.514502, 1, 1, 1, 1, 1,
-0.3731586, 0.8906628, -0.454024, 1, 1, 1, 1, 1,
-0.3695337, -1.026716, -2.216336, 1, 1, 1, 1, 1,
-0.3683196, 0.6256784, -0.9474961, 1, 1, 1, 1, 1,
-0.3652554, -0.04441861, -3.233946, 1, 1, 1, 1, 1,
-0.3607652, -0.2733818, -1.929706, 1, 1, 1, 1, 1,
-0.3601657, 0.7110704, -2.136692, 0, 0, 1, 1, 1,
-0.3592025, -0.1440476, -2.899261, 1, 0, 0, 1, 1,
-0.3588976, -1.809161, -2.722107, 1, 0, 0, 1, 1,
-0.3581568, 0.6543955, 0.9753831, 1, 0, 0, 1, 1,
-0.3542679, 0.6955065, -0.9840159, 1, 0, 0, 1, 1,
-0.353916, -1.069686, -3.523356, 1, 0, 0, 1, 1,
-0.353398, 1.208096, 0.8318172, 0, 0, 0, 1, 1,
-0.3531398, -0.2147166, -3.461952, 0, 0, 0, 1, 1,
-0.3495477, 1.213627, -3.535053, 0, 0, 0, 1, 1,
-0.3484585, 1.576466, 0.1753867, 0, 0, 0, 1, 1,
-0.3461311, -0.8120832, -4.670844, 0, 0, 0, 1, 1,
-0.3425193, 1.185659, 0.4629523, 0, 0, 0, 1, 1,
-0.3392672, -0.04146716, -1.37563, 0, 0, 0, 1, 1,
-0.3368677, 0.8031807, 2.163175, 1, 1, 1, 1, 1,
-0.3341861, 2.447046, -0.7346839, 1, 1, 1, 1, 1,
-0.3241883, 0.1513311, -0.834437, 1, 1, 1, 1, 1,
-0.3229454, 0.1882759, -2.344602, 1, 1, 1, 1, 1,
-0.3164366, 0.1999319, -0.623904, 1, 1, 1, 1, 1,
-0.3141261, 0.5251265, 0.3924371, 1, 1, 1, 1, 1,
-0.3140948, -1.076982, -3.621764, 1, 1, 1, 1, 1,
-0.307135, -0.519265, -3.122798, 1, 1, 1, 1, 1,
-0.3067404, -0.4101969, -2.389629, 1, 1, 1, 1, 1,
-0.304363, -0.5900309, -2.357195, 1, 1, 1, 1, 1,
-0.3027512, 0.5161824, -0.0272057, 1, 1, 1, 1, 1,
-0.3014736, -0.4018931, -3.608219, 1, 1, 1, 1, 1,
-0.3003165, -1.23032, -3.679104, 1, 1, 1, 1, 1,
-0.2995222, 0.1119683, -1.291028, 1, 1, 1, 1, 1,
-0.2988529, 1.684462, -0.01684929, 1, 1, 1, 1, 1,
-0.2984723, -0.4466219, -4.761754, 0, 0, 1, 1, 1,
-0.2919219, -0.6581429, -2.477756, 1, 0, 0, 1, 1,
-0.2901643, -0.09903117, -1.064494, 1, 0, 0, 1, 1,
-0.2858608, -1.745299, -3.410133, 1, 0, 0, 1, 1,
-0.2826379, 0.7434759, -0.01382553, 1, 0, 0, 1, 1,
-0.2768216, 0.2515339, -0.2584461, 1, 0, 0, 1, 1,
-0.2765567, -0.5995331, -2.342944, 0, 0, 0, 1, 1,
-0.2758343, -0.1478704, -1.440402, 0, 0, 0, 1, 1,
-0.2729789, -0.06796716, 0.3473819, 0, 0, 0, 1, 1,
-0.2720485, 0.1550986, 0.9947571, 0, 0, 0, 1, 1,
-0.2715903, -1.423443, -3.08832, 0, 0, 0, 1, 1,
-0.2707031, 0.09613883, -1.681808, 0, 0, 0, 1, 1,
-0.2694322, -0.2507878, -1.837664, 0, 0, 0, 1, 1,
-0.2690675, 0.07567229, -1.910359, 1, 1, 1, 1, 1,
-0.2675771, -0.2600502, -2.52114, 1, 1, 1, 1, 1,
-0.2653221, -0.274266, -2.568883, 1, 1, 1, 1, 1,
-0.2621722, -0.1579404, -2.76685, 1, 1, 1, 1, 1,
-0.260381, 0.07693764, -0.0662335, 1, 1, 1, 1, 1,
-0.2592762, -0.558741, -3.038644, 1, 1, 1, 1, 1,
-0.2588398, 0.5115319, 0.6351893, 1, 1, 1, 1, 1,
-0.2575554, -0.1602501, -2.158877, 1, 1, 1, 1, 1,
-0.2490594, -0.5355233, -2.088529, 1, 1, 1, 1, 1,
-0.2459083, -1.832345, -3.511183, 1, 1, 1, 1, 1,
-0.2457804, 0.8100042, -1.494352, 1, 1, 1, 1, 1,
-0.2440523, -0.4994727, -3.62395, 1, 1, 1, 1, 1,
-0.2431575, -1.354069, -3.604859, 1, 1, 1, 1, 1,
-0.2360569, 1.322671, -0.305397, 1, 1, 1, 1, 1,
-0.2333786, -1.388724, -3.714627, 1, 1, 1, 1, 1,
-0.2312976, -0.5853132, -4.666221, 0, 0, 1, 1, 1,
-0.2224729, -0.4877834, -1.487392, 1, 0, 0, 1, 1,
-0.2221214, -0.6115503, -3.107646, 1, 0, 0, 1, 1,
-0.2150426, -0.09657514, -2.560632, 1, 0, 0, 1, 1,
-0.2092589, 0.7561514, 0.5031675, 1, 0, 0, 1, 1,
-0.2080613, 1.185178, -0.3626457, 1, 0, 0, 1, 1,
-0.2077623, 0.2482427, 0.6714531, 0, 0, 0, 1, 1,
-0.2058625, -1.636109, -2.161365, 0, 0, 0, 1, 1,
-0.2039516, 1.358007, -0.3153079, 0, 0, 0, 1, 1,
-0.2013692, 0.1696684, -0.3013525, 0, 0, 0, 1, 1,
-0.1981215, 0.8485711, 1.749896, 0, 0, 0, 1, 1,
-0.1939437, -0.03930572, -1.511075, 0, 0, 0, 1, 1,
-0.1931692, 0.6725005, -0.2459265, 0, 0, 0, 1, 1,
-0.1881902, -0.2320606, -2.098474, 1, 1, 1, 1, 1,
-0.1849978, 0.515128, -1.429916, 1, 1, 1, 1, 1,
-0.1824855, -1.369148, -2.545071, 1, 1, 1, 1, 1,
-0.1805947, 0.7672482, -0.2611894, 1, 1, 1, 1, 1,
-0.1793115, 0.5389796, -1.265791, 1, 1, 1, 1, 1,
-0.1784373, -0.7851233, -2.991451, 1, 1, 1, 1, 1,
-0.1764461, -0.9261902, -1.659205, 1, 1, 1, 1, 1,
-0.1754937, 0.7852185, -0.7314464, 1, 1, 1, 1, 1,
-0.1744549, 1.682461, -0.930353, 1, 1, 1, 1, 1,
-0.1737087, 0.1773761, -0.08035307, 1, 1, 1, 1, 1,
-0.1718106, -0.7624064, -2.584723, 1, 1, 1, 1, 1,
-0.1686103, -0.1782924, -2.803812, 1, 1, 1, 1, 1,
-0.1684961, -1.772076, -3.139505, 1, 1, 1, 1, 1,
-0.1663523, -0.01951789, -1.566298, 1, 1, 1, 1, 1,
-0.1657426, 0.03123481, -1.63246, 1, 1, 1, 1, 1,
-0.165615, -1.427041, -3.660775, 0, 0, 1, 1, 1,
-0.1634192, 0.1047399, -1.431084, 1, 0, 0, 1, 1,
-0.1609302, 0.6261425, 0.6118414, 1, 0, 0, 1, 1,
-0.1574288, 0.6829947, -0.3371464, 1, 0, 0, 1, 1,
-0.155443, -0.7841271, -3.091888, 1, 0, 0, 1, 1,
-0.1542092, -2.571515, -2.724017, 1, 0, 0, 1, 1,
-0.1493799, 0.5021104, 0.6519537, 0, 0, 0, 1, 1,
-0.1476574, -0.308328, -1.15226, 0, 0, 0, 1, 1,
-0.1415483, 0.4205287, -0.5461184, 0, 0, 0, 1, 1,
-0.1353821, 0.1780039, -0.9806075, 0, 0, 0, 1, 1,
-0.1342688, 0.6273319, -0.7779524, 0, 0, 0, 1, 1,
-0.1314693, -0.9782573, -4.47961, 0, 0, 0, 1, 1,
-0.1265675, -0.01425507, -2.831944, 0, 0, 0, 1, 1,
-0.1265614, 1.315409, 1.136083, 1, 1, 1, 1, 1,
-0.125665, -1.113696, -2.215993, 1, 1, 1, 1, 1,
-0.1248918, 0.7263508, -0.1674504, 1, 1, 1, 1, 1,
-0.1231945, -0.5735607, -2.58569, 1, 1, 1, 1, 1,
-0.1225037, -0.6694458, -2.639707, 1, 1, 1, 1, 1,
-0.1192478, 1.475907, -0.1651411, 1, 1, 1, 1, 1,
-0.1182217, 0.1630618, -0.553824, 1, 1, 1, 1, 1,
-0.115514, 0.7321084, 0.4822189, 1, 1, 1, 1, 1,
-0.1128762, -0.7948496, -3.588041, 1, 1, 1, 1, 1,
-0.1092937, -1.398956, -2.515285, 1, 1, 1, 1, 1,
-0.1059605, 1.004277, -0.7572232, 1, 1, 1, 1, 1,
-0.1031789, 0.6590554, 0.5529081, 1, 1, 1, 1, 1,
-0.101435, -0.4327362, -0.6191324, 1, 1, 1, 1, 1,
-0.1001627, -0.8728951, -2.58576, 1, 1, 1, 1, 1,
-0.09575182, 0.4305268, 0.576808, 1, 1, 1, 1, 1,
-0.09199148, 1.156091, -0.4089696, 0, 0, 1, 1, 1,
-0.08596066, -0.9333687, -4.35017, 1, 0, 0, 1, 1,
-0.08565356, 0.4542007, -0.7916597, 1, 0, 0, 1, 1,
-0.08151948, -0.464297, -3.586124, 1, 0, 0, 1, 1,
-0.08014781, 1.045581, 0.1223538, 1, 0, 0, 1, 1,
-0.07422612, 1.312529, 0.4691753, 1, 0, 0, 1, 1,
-0.07395104, -0.01283798, -1.390305, 0, 0, 0, 1, 1,
-0.06853205, -0.5700997, -3.712253, 0, 0, 0, 1, 1,
-0.06323238, 0.1470475, -0.630759, 0, 0, 0, 1, 1,
-0.06148813, 0.4320118, 0.02480125, 0, 0, 0, 1, 1,
-0.05928569, -1.136574, -2.361582, 0, 0, 0, 1, 1,
-0.05809849, 1.342322, -0.8911259, 0, 0, 0, 1, 1,
-0.05804447, -0.6124958, -3.500574, 0, 0, 0, 1, 1,
-0.05729102, -0.7425492, -4.181652, 1, 1, 1, 1, 1,
-0.05635726, 1.398806, -1.372753, 1, 1, 1, 1, 1,
-0.05550352, 0.7051035, -0.1555346, 1, 1, 1, 1, 1,
-0.05320856, -0.2330848, -4.296124, 1, 1, 1, 1, 1,
-0.05098354, -0.3667772, -2.236701, 1, 1, 1, 1, 1,
-0.04849568, -1.37034, -2.731355, 1, 1, 1, 1, 1,
-0.04540134, 1.43625, 1.570647, 1, 1, 1, 1, 1,
-0.042508, -1.712662, -3.049905, 1, 1, 1, 1, 1,
-0.02578042, 0.2607352, 0.2439347, 1, 1, 1, 1, 1,
-0.02491041, -0.1571625, -3.546795, 1, 1, 1, 1, 1,
-0.02321558, 1.061942, 0.3882882, 1, 1, 1, 1, 1,
-0.02190555, 0.05089476, 0.2793062, 1, 1, 1, 1, 1,
-0.02176597, -0.783878, -2.630749, 1, 1, 1, 1, 1,
-0.02111002, 1.249669, 1.654243, 1, 1, 1, 1, 1,
-0.02054454, 0.194987, 0.7071869, 1, 1, 1, 1, 1,
-0.01840079, 0.333292, 0.3484187, 0, 0, 1, 1, 1,
-0.0177423, -1.039634, -1.200384, 1, 0, 0, 1, 1,
-0.01695571, 0.1889627, -1.605566, 1, 0, 0, 1, 1,
-0.01253619, -0.5034735, -4.204786, 1, 0, 0, 1, 1,
-0.009636828, 1.517886, -0.820578, 1, 0, 0, 1, 1,
-0.00569787, -1.430405, -3.268115, 1, 0, 0, 1, 1,
-0.00504354, -2.242946, -2.015759, 0, 0, 0, 1, 1,
0.001848761, 0.2779306, 1.110188, 0, 0, 0, 1, 1,
0.003583021, -0.4323775, 1.929869, 0, 0, 0, 1, 1,
0.01507246, 2.177167, -0.8120131, 0, 0, 0, 1, 1,
0.01636746, 1.716211, -3.373369, 0, 0, 0, 1, 1,
0.01922631, -1.568902, 3.451589, 0, 0, 0, 1, 1,
0.02206793, -0.06572271, 2.76545, 0, 0, 0, 1, 1,
0.02272909, -0.4247425, 3.867875, 1, 1, 1, 1, 1,
0.02805408, 0.1346792, -0.5410821, 1, 1, 1, 1, 1,
0.02918386, 0.04186559, -0.06080806, 1, 1, 1, 1, 1,
0.03323573, 0.8657222, 1.350713, 1, 1, 1, 1, 1,
0.03330716, -0.946174, 4.265113, 1, 1, 1, 1, 1,
0.03477599, -0.2932906, 3.133821, 1, 1, 1, 1, 1,
0.04089218, -0.1805264, 1.223048, 1, 1, 1, 1, 1,
0.04115851, 1.612353, -0.9941794, 1, 1, 1, 1, 1,
0.04526, -1.708683, 3.418457, 1, 1, 1, 1, 1,
0.0458975, 0.7902523, 0.2250579, 1, 1, 1, 1, 1,
0.046183, -0.957994, 3.252435, 1, 1, 1, 1, 1,
0.04800437, -0.109883, 2.978057, 1, 1, 1, 1, 1,
0.04898923, 0.5877852, -0.3135904, 1, 1, 1, 1, 1,
0.04989988, 0.1539703, 0.3039232, 1, 1, 1, 1, 1,
0.05576429, -2.161356, 3.196256, 1, 1, 1, 1, 1,
0.05840454, -0.5410294, 3.78472, 0, 0, 1, 1, 1,
0.061689, 0.1080603, 1.004304, 1, 0, 0, 1, 1,
0.06193902, -1.211977, 3.805855, 1, 0, 0, 1, 1,
0.0622434, 0.07284613, -0.5908858, 1, 0, 0, 1, 1,
0.06388932, -0.6406483, 3.605017, 1, 0, 0, 1, 1,
0.07061118, 0.8465758, -0.8011936, 1, 0, 0, 1, 1,
0.07355458, -0.616944, 3.086771, 0, 0, 0, 1, 1,
0.07374249, 0.6175177, 1.354581, 0, 0, 0, 1, 1,
0.07525732, 1.974495, 2.870665, 0, 0, 0, 1, 1,
0.07644352, -0.2853734, 1.752925, 0, 0, 0, 1, 1,
0.07915683, -1.31152, 3.648956, 0, 0, 0, 1, 1,
0.08390765, -0.0809066, 2.778294, 0, 0, 0, 1, 1,
0.08434524, 2.395211, -1.125795, 0, 0, 0, 1, 1,
0.08522177, -1.336969, 3.121149, 1, 1, 1, 1, 1,
0.0861482, 1.756871, -2.21861, 1, 1, 1, 1, 1,
0.09761719, 0.1232614, 1.041558, 1, 1, 1, 1, 1,
0.09904666, -0.7139069, 1.650091, 1, 1, 1, 1, 1,
0.1003717, 2.103518, 0.8707594, 1, 1, 1, 1, 1,
0.1019606, 0.7784502, -1.329806, 1, 1, 1, 1, 1,
0.1022022, 0.1992854, 0.4745021, 1, 1, 1, 1, 1,
0.1047582, 1.513141, -1.268006, 1, 1, 1, 1, 1,
0.1048345, 2.103396, -0.2093939, 1, 1, 1, 1, 1,
0.1110511, 0.2403779, -1.355725, 1, 1, 1, 1, 1,
0.1124022, -1.640773, 2.456462, 1, 1, 1, 1, 1,
0.1150822, 0.8381574, -0.5704805, 1, 1, 1, 1, 1,
0.1174554, -1.187097, 2.272716, 1, 1, 1, 1, 1,
0.1184175, 0.4662261, -1.313386, 1, 1, 1, 1, 1,
0.1242834, 0.2986729, -0.1073564, 1, 1, 1, 1, 1,
0.1279283, 0.7760205, -0.491109, 0, 0, 1, 1, 1,
0.1282538, 0.8446879, -0.1098636, 1, 0, 0, 1, 1,
0.130358, 0.2360387, 1.127044, 1, 0, 0, 1, 1,
0.1335191, -0.9073696, 3.855784, 1, 0, 0, 1, 1,
0.1393168, 1.879488, 0.5552506, 1, 0, 0, 1, 1,
0.1426793, -1.300841, 2.814575, 1, 0, 0, 1, 1,
0.1461369, 0.4443898, -1.055378, 0, 0, 0, 1, 1,
0.1477894, -0.768342, 2.569432, 0, 0, 0, 1, 1,
0.1502308, -0.06633569, 3.603527, 0, 0, 0, 1, 1,
0.1521464, -1.036821, 2.173029, 0, 0, 0, 1, 1,
0.1522767, -1.324529, 2.482452, 0, 0, 0, 1, 1,
0.1580399, 0.7576541, 0.2269513, 0, 0, 0, 1, 1,
0.1584091, -0.4741566, 3.71115, 0, 0, 0, 1, 1,
0.1619316, -1.075186, 2.254194, 1, 1, 1, 1, 1,
0.1647751, 0.5662212, 1.267887, 1, 1, 1, 1, 1,
0.1733486, 1.11523, 0.9549947, 1, 1, 1, 1, 1,
0.1746917, -1.005609, 3.854872, 1, 1, 1, 1, 1,
0.1766159, 0.3168136, 1.46549, 1, 1, 1, 1, 1,
0.1788207, 0.6278833, 0.1580166, 1, 1, 1, 1, 1,
0.1831957, -1.454815, 1.991198, 1, 1, 1, 1, 1,
0.1839611, 0.920935, 0.242524, 1, 1, 1, 1, 1,
0.1887607, -0.4943828, 3.396372, 1, 1, 1, 1, 1,
0.1910471, -1.0385, 2.417052, 1, 1, 1, 1, 1,
0.1957514, 0.1101571, 2.274183, 1, 1, 1, 1, 1,
0.2061212, -1.827016, 2.762151, 1, 1, 1, 1, 1,
0.2075255, -0.7773944, 2.423337, 1, 1, 1, 1, 1,
0.2125067, -0.2593534, 2.635262, 1, 1, 1, 1, 1,
0.2151731, 0.9226536, 0.1603296, 1, 1, 1, 1, 1,
0.2152424, -1.051103, 3.394305, 0, 0, 1, 1, 1,
0.2238891, 1.421256, 1.206714, 1, 0, 0, 1, 1,
0.2247065, -0.9204364, 2.763576, 1, 0, 0, 1, 1,
0.227763, 0.6260482, -0.5501513, 1, 0, 0, 1, 1,
0.2299192, 1.073916, 2.001324, 1, 0, 0, 1, 1,
0.2312275, -0.353552, 1.023971, 1, 0, 0, 1, 1,
0.2314743, -0.8505666, 3.223011, 0, 0, 0, 1, 1,
0.234284, -0.7276005, 1.624686, 0, 0, 0, 1, 1,
0.2360088, 0.6880876, 1.558822, 0, 0, 0, 1, 1,
0.2378934, -1.493911, 3.373272, 0, 0, 0, 1, 1,
0.240263, 1.706667, -1.723254, 0, 0, 0, 1, 1,
0.2421115, 1.195803, -0.446259, 0, 0, 0, 1, 1,
0.2428433, 0.185369, -0.02551454, 0, 0, 0, 1, 1,
0.245421, -0.3383422, 3.850879, 1, 1, 1, 1, 1,
0.2488028, -0.09762026, 3.200658, 1, 1, 1, 1, 1,
0.2488315, 1.324338, 2.609791, 1, 1, 1, 1, 1,
0.2497, 1.500154, -0.3178133, 1, 1, 1, 1, 1,
0.2519958, -0.5981079, 3.968565, 1, 1, 1, 1, 1,
0.2522829, 1.231799, 0.2609169, 1, 1, 1, 1, 1,
0.2577752, 0.06819835, 0.1930866, 1, 1, 1, 1, 1,
0.2592131, 0.2544748, 0.5761778, 1, 1, 1, 1, 1,
0.2594291, -1.753703, 3.638125, 1, 1, 1, 1, 1,
0.2604706, 1.283349, -0.6837741, 1, 1, 1, 1, 1,
0.260845, -1.185915, 2.192599, 1, 1, 1, 1, 1,
0.2637173, -0.3231936, 2.629256, 1, 1, 1, 1, 1,
0.2694994, -0.08843943, 1.896936, 1, 1, 1, 1, 1,
0.2719666, -0.3587463, 4.970432, 1, 1, 1, 1, 1,
0.2754553, -0.4202864, 1.56682, 1, 1, 1, 1, 1,
0.2767723, -1.395087, 4.031874, 0, 0, 1, 1, 1,
0.2801595, 1.021763, 1.521719, 1, 0, 0, 1, 1,
0.28559, -0.1294845, 0.831885, 1, 0, 0, 1, 1,
0.2867607, 0.4823163, 1.3276, 1, 0, 0, 1, 1,
0.2875144, 0.596527, 0.8107188, 1, 0, 0, 1, 1,
0.289019, -0.6988109, 3.48397, 1, 0, 0, 1, 1,
0.2904154, -1.233997, 2.637898, 0, 0, 0, 1, 1,
0.2909567, 0.9255939, 0.09087606, 0, 0, 0, 1, 1,
0.2921756, 0.3333707, -0.2168774, 0, 0, 0, 1, 1,
0.2928452, 0.12442, 0.1410112, 0, 0, 0, 1, 1,
0.2956712, -0.751074, 2.920717, 0, 0, 0, 1, 1,
0.297685, -2.015285, 3.070701, 0, 0, 0, 1, 1,
0.2988978, -0.6384795, 3.173006, 0, 0, 0, 1, 1,
0.2992338, -0.4269349, 1.070731, 1, 1, 1, 1, 1,
0.2995164, 0.4747171, 1.094153, 1, 1, 1, 1, 1,
0.3056567, -0.4178956, 0.9132615, 1, 1, 1, 1, 1,
0.3124949, -1.869058, 1.748641, 1, 1, 1, 1, 1,
0.3184925, 0.910928, 0.7839643, 1, 1, 1, 1, 1,
0.3198365, -0.4598362, 2.032488, 1, 1, 1, 1, 1,
0.3235599, -0.6223806, 2.836933, 1, 1, 1, 1, 1,
0.3277671, 1.344944, 0.06702254, 1, 1, 1, 1, 1,
0.3325572, -0.1640067, 2.543924, 1, 1, 1, 1, 1,
0.3372577, -1.568461, 3.543507, 1, 1, 1, 1, 1,
0.341483, 0.2679829, 0.9759179, 1, 1, 1, 1, 1,
0.3418372, -0.506015, 3.551258, 1, 1, 1, 1, 1,
0.3472336, 0.1143814, 0.6193302, 1, 1, 1, 1, 1,
0.3491252, 0.4884542, 2.441272, 1, 1, 1, 1, 1,
0.3522484, -1.031808, 2.369109, 1, 1, 1, 1, 1,
0.3550933, -1.355499, 2.621646, 0, 0, 1, 1, 1,
0.3573374, 0.1557788, 1.632585, 1, 0, 0, 1, 1,
0.3581477, 0.4757788, 0.9618306, 1, 0, 0, 1, 1,
0.3596281, -0.007043374, 1.79051, 1, 0, 0, 1, 1,
0.3776256, 1.387469, 0.1396201, 1, 0, 0, 1, 1,
0.3782651, 0.9014944, -0.03327627, 1, 0, 0, 1, 1,
0.3795074, 1.711358, 0.277759, 0, 0, 0, 1, 1,
0.3843575, -1.132039, 4.440579, 0, 0, 0, 1, 1,
0.3887948, 0.5022183, 0.7527386, 0, 0, 0, 1, 1,
0.3919617, -0.5604455, 1.392623, 0, 0, 0, 1, 1,
0.3950489, 0.4505471, 2.004976, 0, 0, 0, 1, 1,
0.3965168, 0.2100842, 2.138516, 0, 0, 0, 1, 1,
0.3986168, 0.001282901, -0.7871774, 0, 0, 0, 1, 1,
0.3987633, -1.144609, 2.568943, 1, 1, 1, 1, 1,
0.4026232, 0.07884462, 0.9861364, 1, 1, 1, 1, 1,
0.4101057, 1.11992, 1.002655, 1, 1, 1, 1, 1,
0.4102879, 0.3188401, 0.5551029, 1, 1, 1, 1, 1,
0.4112627, 0.7891829, -1.174979, 1, 1, 1, 1, 1,
0.4147559, -0.5957572, 3.083954, 1, 1, 1, 1, 1,
0.4155684, -0.6534713, 2.908386, 1, 1, 1, 1, 1,
0.4190573, -0.2459628, 1.786098, 1, 1, 1, 1, 1,
0.4204624, 0.005396752, 0.07721196, 1, 1, 1, 1, 1,
0.4300256, -0.01348721, 1.449108, 1, 1, 1, 1, 1,
0.4316715, -0.1640282, 1.976134, 1, 1, 1, 1, 1,
0.4377254, -1.180788, 3.714162, 1, 1, 1, 1, 1,
0.4417816, 2.21081, -0.9763507, 1, 1, 1, 1, 1,
0.4475362, 0.445883, 0.9509692, 1, 1, 1, 1, 1,
0.4501543, -2.040608, 2.260979, 1, 1, 1, 1, 1,
0.4524577, -1.122585, 2.195955, 0, 0, 1, 1, 1,
0.4526777, 1.183965, 1.78092, 1, 0, 0, 1, 1,
0.4535965, 1.810077, 0.6266556, 1, 0, 0, 1, 1,
0.4571911, 0.2909688, 2.836437, 1, 0, 0, 1, 1,
0.4575956, -0.3449599, 1.665001, 1, 0, 0, 1, 1,
0.4581559, -0.9424545, 3.110771, 1, 0, 0, 1, 1,
0.4610435, -0.3765593, 4.08649, 0, 0, 0, 1, 1,
0.4630737, -1.437847, 0.4205291, 0, 0, 0, 1, 1,
0.4675962, 0.649829, -1.510069, 0, 0, 0, 1, 1,
0.4684798, -0.7800988, 4.000963, 0, 0, 0, 1, 1,
0.4726406, -0.148339, 0.7758908, 0, 0, 0, 1, 1,
0.4738108, 1.09582, 2.625144, 0, 0, 0, 1, 1,
0.4748144, 1.271599, 0.7882981, 0, 0, 0, 1, 1,
0.4752138, 0.3131508, 0.8542753, 1, 1, 1, 1, 1,
0.477649, -0.8691396, 2.287501, 1, 1, 1, 1, 1,
0.4794008, 0.5317253, 0.2444069, 1, 1, 1, 1, 1,
0.4844756, -0.3011613, 1.720241, 1, 1, 1, 1, 1,
0.4845258, -0.07693485, 2.447264, 1, 1, 1, 1, 1,
0.4852852, -1.354193, 2.309886, 1, 1, 1, 1, 1,
0.4911987, 0.1830513, 3.445088, 1, 1, 1, 1, 1,
0.4932054, 1.45953, -0.4606529, 1, 1, 1, 1, 1,
0.4944853, -0.4074306, 2.286612, 1, 1, 1, 1, 1,
0.4961606, -0.03006399, -0.3013555, 1, 1, 1, 1, 1,
0.4973062, -0.462835, 1.440596, 1, 1, 1, 1, 1,
0.4987429, -0.5695565, 2.240686, 1, 1, 1, 1, 1,
0.4991285, 0.2682323, -0.4494031, 1, 1, 1, 1, 1,
0.505832, -1.018794, 2.529633, 1, 1, 1, 1, 1,
0.5064086, 0.4945303, 1.47518, 1, 1, 1, 1, 1,
0.5094515, -1.102312, 2.627196, 0, 0, 1, 1, 1,
0.5164882, -1.584195, 2.609964, 1, 0, 0, 1, 1,
0.516499, -3.095219, 2.549793, 1, 0, 0, 1, 1,
0.5187897, -0.07217202, -0.7202903, 1, 0, 0, 1, 1,
0.5216344, 1.53864, 0.3597794, 1, 0, 0, 1, 1,
0.5217167, -0.05505143, 0.8609931, 1, 0, 0, 1, 1,
0.5249459, -0.2365865, 3.188538, 0, 0, 0, 1, 1,
0.5260517, 1.649045, 0.6147803, 0, 0, 0, 1, 1,
0.5368057, 0.7748801, 0.6685416, 0, 0, 0, 1, 1,
0.5395932, -0.5117748, 3.221961, 0, 0, 0, 1, 1,
0.5412291, -0.05162838, 3.556655, 0, 0, 0, 1, 1,
0.5457911, 0.1092543, 1.631562, 0, 0, 0, 1, 1,
0.5491914, 0.6380043, 1.665379, 0, 0, 0, 1, 1,
0.5525838, -1.132716, 3.05392, 1, 1, 1, 1, 1,
0.5600009, 0.2464083, 1.113332, 1, 1, 1, 1, 1,
0.5612376, 1.340088, -0.1920973, 1, 1, 1, 1, 1,
0.5633987, -1.551317, 2.001779, 1, 1, 1, 1, 1,
0.5654901, -0.3536645, 2.325222, 1, 1, 1, 1, 1,
0.5661715, -0.02317397, 1.20328, 1, 1, 1, 1, 1,
0.5662633, 1.027696, -0.4417109, 1, 1, 1, 1, 1,
0.5666246, 1.353842, 0.8060844, 1, 1, 1, 1, 1,
0.5678419, -1.104525, 2.024674, 1, 1, 1, 1, 1,
0.5725889, 0.4018082, 1.761419, 1, 1, 1, 1, 1,
0.5748392, 0.4623612, 0.67326, 1, 1, 1, 1, 1,
0.5785392, 0.6126902, 1.104155, 1, 1, 1, 1, 1,
0.5797876, 0.8112627, 1.374718, 1, 1, 1, 1, 1,
0.5884903, 1.437909, 1.799034, 1, 1, 1, 1, 1,
0.5904524, -1.493682, 1.827033, 1, 1, 1, 1, 1,
0.5924526, -0.2799675, 2.790876, 0, 0, 1, 1, 1,
0.5945278, -0.8831944, 1.584337, 1, 0, 0, 1, 1,
0.595858, 0.04684364, 2.168495, 1, 0, 0, 1, 1,
0.5999613, -0.2546253, 3.171042, 1, 0, 0, 1, 1,
0.6071965, 0.1237164, 1.162729, 1, 0, 0, 1, 1,
0.6100346, -0.8974763, 1.401514, 1, 0, 0, 1, 1,
0.6137934, -1.507408, 1.175738, 0, 0, 0, 1, 1,
0.6183521, 0.653402, 1.084514, 0, 0, 0, 1, 1,
0.6192429, 0.9296726, 3.237848, 0, 0, 0, 1, 1,
0.6209753, 0.8836447, 1.865654, 0, 0, 0, 1, 1,
0.62212, -0.3837936, 1.655606, 0, 0, 0, 1, 1,
0.6227683, -1.037954, 2.156358, 0, 0, 0, 1, 1,
0.6229988, 0.9881984, 0.2598615, 0, 0, 0, 1, 1,
0.6355679, -1.587741, 3.466401, 1, 1, 1, 1, 1,
0.6419006, 1.352052, -0.3524425, 1, 1, 1, 1, 1,
0.6525148, -0.6385974, 2.292966, 1, 1, 1, 1, 1,
0.6525678, 0.9850525, -1.160751, 1, 1, 1, 1, 1,
0.6538719, -0.2822247, 2.034814, 1, 1, 1, 1, 1,
0.663066, 0.701262, -0.2812891, 1, 1, 1, 1, 1,
0.6643649, -1.618035, 3.83895, 1, 1, 1, 1, 1,
0.6649634, -0.6489008, 1.954121, 1, 1, 1, 1, 1,
0.6663384, 0.582555, 1.480634, 1, 1, 1, 1, 1,
0.669528, 1.183935, 2.138876, 1, 1, 1, 1, 1,
0.6695749, -0.6195483, 3.004546, 1, 1, 1, 1, 1,
0.6701651, -0.1124934, 2.681817, 1, 1, 1, 1, 1,
0.6743931, -0.5175178, 2.800336, 1, 1, 1, 1, 1,
0.6749055, -0.2769049, 1.759655, 1, 1, 1, 1, 1,
0.6815798, -1.109563, 3.461714, 1, 1, 1, 1, 1,
0.681711, 1.357196, -0.5531332, 0, 0, 1, 1, 1,
0.682946, 0.1736266, -1.468212, 1, 0, 0, 1, 1,
0.6849151, -0.1265977, 1.395973, 1, 0, 0, 1, 1,
0.6871125, -1.563158, 1.795333, 1, 0, 0, 1, 1,
0.6887429, 0.487843, 1.888386, 1, 0, 0, 1, 1,
0.6893331, -0.6101141, 1.791212, 1, 0, 0, 1, 1,
0.6976118, 0.2178676, 0.9407967, 0, 0, 0, 1, 1,
0.6980895, -1.069429, 1.444541, 0, 0, 0, 1, 1,
0.6996859, 0.5811135, 1.220672, 0, 0, 0, 1, 1,
0.701488, -1.653463, 1.616346, 0, 0, 0, 1, 1,
0.7038435, 0.8624447, 0.03302383, 0, 0, 0, 1, 1,
0.7040958, -0.1893618, 1.305923, 0, 0, 0, 1, 1,
0.71154, -0.4843037, 3.189006, 0, 0, 0, 1, 1,
0.7123042, 0.4268523, 0.7737138, 1, 1, 1, 1, 1,
0.7287909, 0.8826264, 1.2042, 1, 1, 1, 1, 1,
0.7355561, -0.2542473, 0.5785648, 1, 1, 1, 1, 1,
0.7374588, -0.6222754, 1.189506, 1, 1, 1, 1, 1,
0.7385074, 0.04072193, 1.816648, 1, 1, 1, 1, 1,
0.7426755, 0.6145085, 1.230934, 1, 1, 1, 1, 1,
0.7463169, 0.7903648, 0.2628378, 1, 1, 1, 1, 1,
0.747889, 0.2453607, 2.894219, 1, 1, 1, 1, 1,
0.7544528, 1.514723, 0.02800698, 1, 1, 1, 1, 1,
0.7556773, -0.6002852, 2.909788, 1, 1, 1, 1, 1,
0.755708, -0.3038731, 1.4046, 1, 1, 1, 1, 1,
0.7568408, -0.4470576, 2.055911, 1, 1, 1, 1, 1,
0.7584204, 1.123959, 1.527805, 1, 1, 1, 1, 1,
0.7626635, -0.5593876, 3.023976, 1, 1, 1, 1, 1,
0.7631599, 0.6367497, 3.180252, 1, 1, 1, 1, 1,
0.7632893, 0.01600689, 1.857679, 0, 0, 1, 1, 1,
0.7643182, -0.6494136, 3.327206, 1, 0, 0, 1, 1,
0.7664847, -1.102869, 2.013289, 1, 0, 0, 1, 1,
0.778218, -0.5907198, 2.326603, 1, 0, 0, 1, 1,
0.7831075, 0.9413115, 2.145614, 1, 0, 0, 1, 1,
0.7852271, -1.268628, 2.540603, 1, 0, 0, 1, 1,
0.7883545, 0.8047, -0.3551583, 0, 0, 0, 1, 1,
0.789616, -0.5760675, 1.663341, 0, 0, 0, 1, 1,
0.795696, 1.633151, 0.09365467, 0, 0, 0, 1, 1,
0.7968391, -1.180127, 4.071692, 0, 0, 0, 1, 1,
0.7997727, 0.8931669, 0.3022995, 0, 0, 0, 1, 1,
0.8006628, 1.254818, 0.3356985, 0, 0, 0, 1, 1,
0.805217, -0.8371664, 2.414707, 0, 0, 0, 1, 1,
0.8072056, -0.1566348, 1.386113, 1, 1, 1, 1, 1,
0.8160456, -1.225136, 4.874196, 1, 1, 1, 1, 1,
0.819294, -0.3457851, 1.170539, 1, 1, 1, 1, 1,
0.8234949, -0.1448985, 0.04955924, 1, 1, 1, 1, 1,
0.8255682, 0.07134082, 0.9754653, 1, 1, 1, 1, 1,
0.8348914, -0.3017679, 3.120921, 1, 1, 1, 1, 1,
0.8369914, -0.01704452, 3.495793, 1, 1, 1, 1, 1,
0.840489, 0.5056094, 1.251942, 1, 1, 1, 1, 1,
0.8507705, 0.8711761, 1.804191, 1, 1, 1, 1, 1,
0.851357, 1.033774, 1.526629, 1, 1, 1, 1, 1,
0.8541241, -0.5512643, 1.062413, 1, 1, 1, 1, 1,
0.854919, 0.8005569, -0.05439319, 1, 1, 1, 1, 1,
0.8569025, 0.116127, 1.691258, 1, 1, 1, 1, 1,
0.8685228, 1.082204, -1.061589, 1, 1, 1, 1, 1,
0.8706356, 0.8621836, 1.14657, 1, 1, 1, 1, 1,
0.8775685, 0.202886, 1.671698, 0, 0, 1, 1, 1,
0.8796035, 2.403198, -0.9641432, 1, 0, 0, 1, 1,
0.8799357, -0.1215818, 2.825254, 1, 0, 0, 1, 1,
0.8835175, 2.565752, -0.2944001, 1, 0, 0, 1, 1,
0.8847274, -1.331937, 2.331971, 1, 0, 0, 1, 1,
0.894475, 0.03201655, 1.306328, 1, 0, 0, 1, 1,
0.8981099, -1.163559, 2.775018, 0, 0, 0, 1, 1,
0.900722, 1.192482, 2.250968, 0, 0, 0, 1, 1,
0.9037488, 0.05528811, -0.1588124, 0, 0, 0, 1, 1,
0.9049911, -2.045229, 1.96587, 0, 0, 0, 1, 1,
0.9080263, -1.364437, 2.987656, 0, 0, 0, 1, 1,
0.910024, -0.1865521, 0.9561698, 0, 0, 0, 1, 1,
0.9132493, -0.6045766, 1.563004, 0, 0, 0, 1, 1,
0.9143503, -0.9644836, 2.480691, 1, 1, 1, 1, 1,
0.9165374, 0.2860415, 0.5867733, 1, 1, 1, 1, 1,
0.9185495, -0.3484405, 4.303289, 1, 1, 1, 1, 1,
0.9289969, 0.6801655, -0.1086083, 1, 1, 1, 1, 1,
0.9291828, 0.2887447, 2.962905, 1, 1, 1, 1, 1,
0.930263, 1.349696, 1.047669, 1, 1, 1, 1, 1,
0.9356121, -0.7574075, 1.3398, 1, 1, 1, 1, 1,
0.9459721, 0.7714222, -1.308826, 1, 1, 1, 1, 1,
0.9480624, -1.275182, 2.707764, 1, 1, 1, 1, 1,
0.9681015, -0.8175353, 2.49554, 1, 1, 1, 1, 1,
0.9788661, -2.42421, 3.515638, 1, 1, 1, 1, 1,
0.9839182, 0.1765801, 1.157368, 1, 1, 1, 1, 1,
0.9868736, -0.8289546, 1.16648, 1, 1, 1, 1, 1,
0.9872794, -0.6156702, 0.6915857, 1, 1, 1, 1, 1,
0.988735, 0.2722926, -0.834783, 1, 1, 1, 1, 1,
0.9921249, 0.4275716, 0.5946826, 0, 0, 1, 1, 1,
0.9958439, 0.4031365, 2.278913, 1, 0, 0, 1, 1,
0.9973353, -0.2303754, 2.210299, 1, 0, 0, 1, 1,
0.9985557, 0.9219835, 1.861426, 1, 0, 0, 1, 1,
0.9987892, 0.859801, 1.336733, 1, 0, 0, 1, 1,
1.001703, -0.8704019, 2.985134, 1, 0, 0, 1, 1,
1.002544, 0.3673307, 0.3636937, 0, 0, 0, 1, 1,
1.008105, -0.04585417, 1.809491, 0, 0, 0, 1, 1,
1.00937, -0.8646289, 2.078428, 0, 0, 0, 1, 1,
1.015833, 0.8028536, 1.321747, 0, 0, 0, 1, 1,
1.025005, 0.2353637, -0.2535077, 0, 0, 0, 1, 1,
1.025215, -0.3338123, 2.284275, 0, 0, 0, 1, 1,
1.035794, -0.4315384, 1.617649, 0, 0, 0, 1, 1,
1.040224, 0.7632148, 0.8673989, 1, 1, 1, 1, 1,
1.040388, 0.7354749, 1.93144, 1, 1, 1, 1, 1,
1.042197, -1.054988, 2.269887, 1, 1, 1, 1, 1,
1.043872, -0.5677345, 0.7328861, 1, 1, 1, 1, 1,
1.045825, 0.02658875, 1.982009, 1, 1, 1, 1, 1,
1.050957, -0.585186, 2.355573, 1, 1, 1, 1, 1,
1.057293, -0.549944, 1.762891, 1, 1, 1, 1, 1,
1.058212, 1.938888, -0.8083082, 1, 1, 1, 1, 1,
1.063362, -0.3844838, 2.848948, 1, 1, 1, 1, 1,
1.069148, 1.317002, 2.059834, 1, 1, 1, 1, 1,
1.077325, -0.6168013, 2.771108, 1, 1, 1, 1, 1,
1.078786, 1.633028, 2.279564, 1, 1, 1, 1, 1,
1.085801, 0.3514274, 0.8211565, 1, 1, 1, 1, 1,
1.087373, 0.8129106, 1.37819, 1, 1, 1, 1, 1,
1.088773, 0.007912609, 1.329211, 1, 1, 1, 1, 1,
1.104626, 0.1346338, 1.306141, 0, 0, 1, 1, 1,
1.111237, -0.2501804, 2.721872, 1, 0, 0, 1, 1,
1.112438, -2.919788, 3.161021, 1, 0, 0, 1, 1,
1.114714, -1.065315, 2.017889, 1, 0, 0, 1, 1,
1.116376, -1.885199, 2.413804, 1, 0, 0, 1, 1,
1.123097, -0.0518874, -0.530027, 1, 0, 0, 1, 1,
1.134032, -0.2089844, 0.9446941, 0, 0, 0, 1, 1,
1.134156, 0.4987298, 3.485824, 0, 0, 0, 1, 1,
1.141376, 0.4620996, 1.251624, 0, 0, 0, 1, 1,
1.142185, 0.3103587, 0.2876746, 0, 0, 0, 1, 1,
1.142926, -1.113511, 2.341393, 0, 0, 0, 1, 1,
1.152207, -0.8828582, 2.684978, 0, 0, 0, 1, 1,
1.152774, 0.04620945, 1.577464, 0, 0, 0, 1, 1,
1.156201, 0.04640531, 2.154751, 1, 1, 1, 1, 1,
1.164698, -0.3046685, 0.400315, 1, 1, 1, 1, 1,
1.164958, 1.220432, -0.5632732, 1, 1, 1, 1, 1,
1.170779, 1.919029, 1.686142, 1, 1, 1, 1, 1,
1.187368, -0.130152, 2.261776, 1, 1, 1, 1, 1,
1.187527, -1.005239, 2.728617, 1, 1, 1, 1, 1,
1.189469, 0.1981392, 1.207194, 1, 1, 1, 1, 1,
1.198868, 1.346666, 0.7389444, 1, 1, 1, 1, 1,
1.201442, -0.7647802, 2.297493, 1, 1, 1, 1, 1,
1.20921, -0.5395746, 2.747191, 1, 1, 1, 1, 1,
1.216697, 0.7397889, 1.482051, 1, 1, 1, 1, 1,
1.225372, -1.027966, 3.259728, 1, 1, 1, 1, 1,
1.226906, -0.6250738, 2.523989, 1, 1, 1, 1, 1,
1.227367, 1.518301, 3.226128, 1, 1, 1, 1, 1,
1.232715, -0.1011159, 1.534862, 1, 1, 1, 1, 1,
1.239091, -0.06009237, 1.695598, 0, 0, 1, 1, 1,
1.244182, -0.3764194, 1.193368, 1, 0, 0, 1, 1,
1.248901, -0.6118453, 1.016654, 1, 0, 0, 1, 1,
1.262235, 1.276564, 1.344934, 1, 0, 0, 1, 1,
1.264449, -0.3850486, 1.888235, 1, 0, 0, 1, 1,
1.272617, -2.698735, 3.638895, 1, 0, 0, 1, 1,
1.276641, 1.904299, 1.656195, 0, 0, 0, 1, 1,
1.279309, 1.276139, 0.4039793, 0, 0, 0, 1, 1,
1.281813, -0.9262861, 2.257464, 0, 0, 0, 1, 1,
1.288348, -2.170202, 2.506469, 0, 0, 0, 1, 1,
1.291558, -0.07714918, 1.141046, 0, 0, 0, 1, 1,
1.293505, -1.876173, 2.927743, 0, 0, 0, 1, 1,
1.300607, 0.5909278, 0.2986791, 0, 0, 0, 1, 1,
1.303906, -1.013129, 1.010952, 1, 1, 1, 1, 1,
1.313266, -0.9834576, 1.518526, 1, 1, 1, 1, 1,
1.318413, -0.5375915, 1.869193, 1, 1, 1, 1, 1,
1.322411, -3.026257, 2.619058, 1, 1, 1, 1, 1,
1.34272, 0.6123071, 0.1479692, 1, 1, 1, 1, 1,
1.349646, 1.772717, 1.533124, 1, 1, 1, 1, 1,
1.354654, 1.313169, -0.8573409, 1, 1, 1, 1, 1,
1.373347, -0.2316145, 0.8221608, 1, 1, 1, 1, 1,
1.382566, 0.005261981, 2.344976, 1, 1, 1, 1, 1,
1.385266, -0.7040257, 2.120877, 1, 1, 1, 1, 1,
1.397172, 0.2881276, 1.51456, 1, 1, 1, 1, 1,
1.398577, -0.05906146, 1.310251, 1, 1, 1, 1, 1,
1.400584, -1.099799, 3.858127, 1, 1, 1, 1, 1,
1.413123, -1.48666, 3.821546, 1, 1, 1, 1, 1,
1.423635, -1.249993, 3.193125, 1, 1, 1, 1, 1,
1.431311, 1.212397, 1.873617, 0, 0, 1, 1, 1,
1.436836, -0.06353521, 0.1741622, 1, 0, 0, 1, 1,
1.442499, 0.05283838, 1.882961, 1, 0, 0, 1, 1,
1.451089, 0.4817963, 1.426836, 1, 0, 0, 1, 1,
1.451582, 2.06599, 0.0326261, 1, 0, 0, 1, 1,
1.452644, 0.6015108, 2.531789, 1, 0, 0, 1, 1,
1.472028, -1.409673, 2.515789, 0, 0, 0, 1, 1,
1.47261, -0.07406637, 1.996057, 0, 0, 0, 1, 1,
1.479454, -0.73176, 0.3644361, 0, 0, 0, 1, 1,
1.485737, 0.8954057, 0.5895635, 0, 0, 0, 1, 1,
1.498863, -0.719798, 0.3656753, 0, 0, 0, 1, 1,
1.511451, -0.6526959, 2.510246, 0, 0, 0, 1, 1,
1.512787, -0.616196, 0.8491785, 0, 0, 0, 1, 1,
1.517254, -0.2893651, 0.1241649, 1, 1, 1, 1, 1,
1.518728, -1.614571, 0.6965103, 1, 1, 1, 1, 1,
1.5222, -0.3155156, 2.269126, 1, 1, 1, 1, 1,
1.526031, -2.137626, 2.698291, 1, 1, 1, 1, 1,
1.535653, -0.7494851, 2.878443, 1, 1, 1, 1, 1,
1.541433, 0.8683158, 2.07036, 1, 1, 1, 1, 1,
1.547173, -0.8583497, 4.188844, 1, 1, 1, 1, 1,
1.560549, -0.1383896, 1.682872, 1, 1, 1, 1, 1,
1.566625, -0.2233303, 0.9494274, 1, 1, 1, 1, 1,
1.571272, -0.240153, 0.561333, 1, 1, 1, 1, 1,
1.576508, -0.06847494, 1.247809, 1, 1, 1, 1, 1,
1.579661, 1.663942, -0.02261274, 1, 1, 1, 1, 1,
1.588181, 1.087565, 0.8134314, 1, 1, 1, 1, 1,
1.589521, 0.5737188, 1.990248, 1, 1, 1, 1, 1,
1.598021, 0.9132273, 0.03164596, 1, 1, 1, 1, 1,
1.603015, -0.8352389, 4.955614, 0, 0, 1, 1, 1,
1.608222, -1.184751, 1.94026, 1, 0, 0, 1, 1,
1.617824, 0.05766056, 1.79068, 1, 0, 0, 1, 1,
1.62001, 0.4007657, 2.505324, 1, 0, 0, 1, 1,
1.624336, -1.955062, 1.040164, 1, 0, 0, 1, 1,
1.658585, -0.6645751, 1.769423, 1, 0, 0, 1, 1,
1.661305, -0.2320097, 2.016651, 0, 0, 0, 1, 1,
1.662567, -0.5267208, 1.295721, 0, 0, 0, 1, 1,
1.668787, 0.231654, 2.147805, 0, 0, 0, 1, 1,
1.703336, 0.140238, 1.6081, 0, 0, 0, 1, 1,
1.711367, 1.656868, 0.7002679, 0, 0, 0, 1, 1,
1.719719, -0.1429749, 1.701497, 0, 0, 0, 1, 1,
1.731347, 0.6300007, 1.829859, 0, 0, 0, 1, 1,
1.731569, 0.5012318, 0.03076014, 1, 1, 1, 1, 1,
1.759932, -0.7057011, 0.8692517, 1, 1, 1, 1, 1,
1.761091, -0.8534362, 1.369155, 1, 1, 1, 1, 1,
1.770134, -0.117156, 1.301562, 1, 1, 1, 1, 1,
1.777301, 1.663353, 0.0458376, 1, 1, 1, 1, 1,
1.777736, 0.9991174, 2.0373, 1, 1, 1, 1, 1,
1.798376, -2.885687, 2.284646, 1, 1, 1, 1, 1,
1.801963, 0.7172899, 1.832114, 1, 1, 1, 1, 1,
1.84346, 0.2100511, 2.507674, 1, 1, 1, 1, 1,
1.84997, -0.07207537, 2.725514, 1, 1, 1, 1, 1,
1.872908, -0.4703101, 2.147097, 1, 1, 1, 1, 1,
1.890347, -0.6821753, 2.00625, 1, 1, 1, 1, 1,
1.8936, 0.02992763, 2.790327, 1, 1, 1, 1, 1,
1.90473, 0.2323353, 1.048799, 1, 1, 1, 1, 1,
1.90758, -0.2610632, -0.2298154, 1, 1, 1, 1, 1,
1.915268, 0.4385123, 0.04766407, 0, 0, 1, 1, 1,
1.933736, -0.07578003, 1.083283, 1, 0, 0, 1, 1,
1.949227, 0.7677238, 1.137829, 1, 0, 0, 1, 1,
1.972918, 1.433028, 0.1211136, 1, 0, 0, 1, 1,
2.002154, -0.4053278, 4.233262, 1, 0, 0, 1, 1,
2.002248, 0.4463027, 0.1667644, 1, 0, 0, 1, 1,
2.034187, 0.4657216, 1.917691, 0, 0, 0, 1, 1,
2.092974, -0.02538107, 2.303378, 0, 0, 0, 1, 1,
2.120335, 1.758308, 1.424609, 0, 0, 0, 1, 1,
2.161589, 0.3481815, 1.344324, 0, 0, 0, 1, 1,
2.193066, -0.5977566, 1.925982, 0, 0, 0, 1, 1,
2.294381, 0.4306343, 1.357693, 0, 0, 0, 1, 1,
2.365497, -0.6028459, 1.814401, 0, 0, 0, 1, 1,
2.388318, 0.570889, 1.151496, 1, 1, 1, 1, 1,
2.515384, 0.3527716, 1.95487, 1, 1, 1, 1, 1,
2.534727, 1.742174, 2.546253, 1, 1, 1, 1, 1,
2.638644, -0.2470312, 1.319981, 1, 1, 1, 1, 1,
2.724702, -0.762904, 1.175816, 1, 1, 1, 1, 1,
2.803168, -0.4983174, 2.06744, 1, 1, 1, 1, 1,
2.939005, -0.1535434, 1.30942, 1, 1, 1, 1, 1
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
var radius = 9.368034;
var distance = 32.90482;
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
mvMatrix.translate( 0.3883419, 0.2647337, 0.2849994 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.90482);
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
