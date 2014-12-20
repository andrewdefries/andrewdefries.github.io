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
-3.382468, -0.2584745, -1.701176, 1, 0, 0, 1,
-2.956867, -0.8930701, -2.727592, 1, 0.007843138, 0, 1,
-2.934115, -0.516908, -1.561639, 1, 0.01176471, 0, 1,
-2.860699, -0.3849305, -1.466286, 1, 0.01960784, 0, 1,
-2.81877, 1.421294, -1.677771, 1, 0.02352941, 0, 1,
-2.811268, 0.588807, -0.09864113, 1, 0.03137255, 0, 1,
-2.701334, -1.189931, -0.5813209, 1, 0.03529412, 0, 1,
-2.645716, -1.027417, -1.865793, 1, 0.04313726, 0, 1,
-2.559537, 0.6400172, 0.2651559, 1, 0.04705882, 0, 1,
-2.545053, -0.9130656, -2.208891, 1, 0.05490196, 0, 1,
-2.483042, 0.8687295, -1.547462, 1, 0.05882353, 0, 1,
-2.478831, -1.259523, -3.159209, 1, 0.06666667, 0, 1,
-2.430415, 0.8675783, -0.9136946, 1, 0.07058824, 0, 1,
-2.414323, -0.8412427, -1.654781, 1, 0.07843138, 0, 1,
-2.31401, -0.9457744, -2.573472, 1, 0.08235294, 0, 1,
-2.297937, -0.05994868, -1.082384, 1, 0.09019608, 0, 1,
-2.214901, -0.5334728, -0.6032984, 1, 0.09411765, 0, 1,
-2.188577, -1.961652, -3.852559, 1, 0.1019608, 0, 1,
-2.185988, 1.661976, -0.46299, 1, 0.1098039, 0, 1,
-2.181355, -3.253283, -3.077117, 1, 0.1137255, 0, 1,
-2.176105, -0.4262813, -1.918729, 1, 0.1215686, 0, 1,
-2.167878, 0.6441422, -1.480709, 1, 0.1254902, 0, 1,
-2.119977, -0.3146324, -0.7036667, 1, 0.1333333, 0, 1,
-2.114984, 1.119202, -0.7366335, 1, 0.1372549, 0, 1,
-2.06446, 0.03144954, -0.1929399, 1, 0.145098, 0, 1,
-2.014439, -2.285825, -2.804211, 1, 0.1490196, 0, 1,
-2.013894, 0.332703, -0.8123285, 1, 0.1568628, 0, 1,
-2.011238, -1.352537, -2.238537, 1, 0.1607843, 0, 1,
-1.993918, 1.930312, 0.3560851, 1, 0.1686275, 0, 1,
-1.941893, -0.9151004, -1.169438, 1, 0.172549, 0, 1,
-1.933361, -1.525654, -1.713242, 1, 0.1803922, 0, 1,
-1.924765, 0.175878, -2.63641, 1, 0.1843137, 0, 1,
-1.919338, 0.07444479, -1.379125, 1, 0.1921569, 0, 1,
-1.914966, 2.703867, -0.3649046, 1, 0.1960784, 0, 1,
-1.911154, -0.432296, -0.957405, 1, 0.2039216, 0, 1,
-1.858084, -1.671816, -0.9545221, 1, 0.2117647, 0, 1,
-1.843648, 1.384669, -1.976346, 1, 0.2156863, 0, 1,
-1.805702, 1.451248, -2.043419, 1, 0.2235294, 0, 1,
-1.802696, -1.743705, -0.3649905, 1, 0.227451, 0, 1,
-1.786367, -0.7229853, -2.860002, 1, 0.2352941, 0, 1,
-1.777436, 0.8140948, 0.7300615, 1, 0.2392157, 0, 1,
-1.776638, 2.248624, -1.167491, 1, 0.2470588, 0, 1,
-1.747641, -1.466332, -2.21898, 1, 0.2509804, 0, 1,
-1.734509, -0.5809999, -1.787259, 1, 0.2588235, 0, 1,
-1.706632, -1.239002, -1.71536, 1, 0.2627451, 0, 1,
-1.680397, 1.227076, 0.6674283, 1, 0.2705882, 0, 1,
-1.67084, -0.1802083, -2.261927, 1, 0.2745098, 0, 1,
-1.669853, -0.8224165, -2.811074, 1, 0.282353, 0, 1,
-1.653082, -0.959006, -1.833741, 1, 0.2862745, 0, 1,
-1.648538, -0.9574006, -2.024073, 1, 0.2941177, 0, 1,
-1.646202, 0.2196095, -2.210257, 1, 0.3019608, 0, 1,
-1.643101, 0.6858044, -2.708946, 1, 0.3058824, 0, 1,
-1.630084, -1.343271, -2.243869, 1, 0.3137255, 0, 1,
-1.621349, 0.1166715, -3.406687, 1, 0.3176471, 0, 1,
-1.618311, -1.204499, -2.041975, 1, 0.3254902, 0, 1,
-1.591764, -0.8932247, -1.513672, 1, 0.3294118, 0, 1,
-1.579345, -0.3205139, -0.1789789, 1, 0.3372549, 0, 1,
-1.57909, 0.4927697, -0.8852881, 1, 0.3411765, 0, 1,
-1.565599, 1.182331, -1.499139, 1, 0.3490196, 0, 1,
-1.549893, 1.283332, -1.948134, 1, 0.3529412, 0, 1,
-1.541623, -0.1295751, -2.331768, 1, 0.3607843, 0, 1,
-1.538039, 0.7221854, -1.581121, 1, 0.3647059, 0, 1,
-1.535845, -0.2110402, -2.702508, 1, 0.372549, 0, 1,
-1.525383, 0.1835382, -1.991051, 1, 0.3764706, 0, 1,
-1.513055, -1.445284, -2.137771, 1, 0.3843137, 0, 1,
-1.504752, 0.7910299, 0.5687684, 1, 0.3882353, 0, 1,
-1.499669, -1.039969, -0.417049, 1, 0.3960784, 0, 1,
-1.481263, -0.09854738, -2.076064, 1, 0.4039216, 0, 1,
-1.478849, -0.6886116, -1.931521, 1, 0.4078431, 0, 1,
-1.476243, -1.125549, -1.244886, 1, 0.4156863, 0, 1,
-1.473441, -0.1895613, -1.569331, 1, 0.4196078, 0, 1,
-1.469203, 0.7214419, -3.10672, 1, 0.427451, 0, 1,
-1.45877, 0.4702246, -2.355339, 1, 0.4313726, 0, 1,
-1.44541, 2.265734, 1.477843, 1, 0.4392157, 0, 1,
-1.43622, -0.7025443, -3.213021, 1, 0.4431373, 0, 1,
-1.427564, 0.7075366, -1.165138, 1, 0.4509804, 0, 1,
-1.418235, 0.008061591, -1.975392, 1, 0.454902, 0, 1,
-1.38215, 1.10676, -0.9929662, 1, 0.4627451, 0, 1,
-1.375691, 0.009275218, -2.196666, 1, 0.4666667, 0, 1,
-1.370615, 0.6011378, -3.725358, 1, 0.4745098, 0, 1,
-1.365962, 1.306003, -2.066588, 1, 0.4784314, 0, 1,
-1.364275, 1.115089, -0.9649239, 1, 0.4862745, 0, 1,
-1.358086, -0.5040235, -3.296691, 1, 0.4901961, 0, 1,
-1.352896, 1.124808, -1.250738, 1, 0.4980392, 0, 1,
-1.337634, -0.1058581, -2.610999, 1, 0.5058824, 0, 1,
-1.336104, -0.8839363, -3.552526, 1, 0.509804, 0, 1,
-1.326743, 0.3853432, -0.06569841, 1, 0.5176471, 0, 1,
-1.316101, -0.3136619, -3.460695, 1, 0.5215687, 0, 1,
-1.315559, 0.5317049, -0.7677892, 1, 0.5294118, 0, 1,
-1.30856, -0.06066, -2.892519, 1, 0.5333334, 0, 1,
-1.308409, -1.32636, -0.7259889, 1, 0.5411765, 0, 1,
-1.306157, -0.5923082, -1.434947, 1, 0.5450981, 0, 1,
-1.288697, -0.8700025, -2.229615, 1, 0.5529412, 0, 1,
-1.281955, 0.1544174, -0.2051238, 1, 0.5568628, 0, 1,
-1.272131, -1.51503, -2.224562, 1, 0.5647059, 0, 1,
-1.252105, -0.7859675, -1.679444, 1, 0.5686275, 0, 1,
-1.251518, 0.285304, -1.848851, 1, 0.5764706, 0, 1,
-1.251, 1.036111, -2.1261, 1, 0.5803922, 0, 1,
-1.230784, -0.07227254, 0.8870302, 1, 0.5882353, 0, 1,
-1.224946, 0.1887677, 0.7144544, 1, 0.5921569, 0, 1,
-1.218724, -0.608012, -2.589545, 1, 0.6, 0, 1,
-1.217802, -1.855499, -4.081127, 1, 0.6078432, 0, 1,
-1.217386, -0.008520165, -1.37565, 1, 0.6117647, 0, 1,
-1.216886, 0.2881916, -2.209304, 1, 0.6196079, 0, 1,
-1.215595, 0.1891337, -1.647824, 1, 0.6235294, 0, 1,
-1.213259, -0.04920204, -1.998427, 1, 0.6313726, 0, 1,
-1.209975, -0.9791988, -1.812865, 1, 0.6352941, 0, 1,
-1.207981, 0.2446029, -2.43393, 1, 0.6431373, 0, 1,
-1.207109, -1.435115, -3.399978, 1, 0.6470588, 0, 1,
-1.19348, -0.2414638, -0.8120003, 1, 0.654902, 0, 1,
-1.181089, 0.7385041, -1.536509, 1, 0.6588235, 0, 1,
-1.179401, -0.3190406, -0.5481031, 1, 0.6666667, 0, 1,
-1.1762, 1.113559, 0.1574797, 1, 0.6705883, 0, 1,
-1.170618, 0.1969022, -0.7090569, 1, 0.6784314, 0, 1,
-1.166917, 0.5225199, 0.5384779, 1, 0.682353, 0, 1,
-1.166028, -0.960795, -2.049181, 1, 0.6901961, 0, 1,
-1.164693, 0.07341264, -1.833995, 1, 0.6941177, 0, 1,
-1.149487, -2.028662, -2.631057, 1, 0.7019608, 0, 1,
-1.138456, 0.3182237, -1.374594, 1, 0.7098039, 0, 1,
-1.137008, -0.1865057, -1.656296, 1, 0.7137255, 0, 1,
-1.129723, -0.5962565, -1.72398, 1, 0.7215686, 0, 1,
-1.127005, -0.4808517, -1.517869, 1, 0.7254902, 0, 1,
-1.124082, 0.8699758, -1.097828, 1, 0.7333333, 0, 1,
-1.118897, -0.1868401, -3.915081, 1, 0.7372549, 0, 1,
-1.114824, -0.139296, -2.690157, 1, 0.7450981, 0, 1,
-1.10672, 1.136667, -1.137993, 1, 0.7490196, 0, 1,
-1.106564, -0.3804061, -1.183809, 1, 0.7568628, 0, 1,
-1.104964, 1.604883, -1.734838, 1, 0.7607843, 0, 1,
-1.09758, 0.7839137, -0.6660001, 1, 0.7686275, 0, 1,
-1.083336, 0.1967019, -1.546417, 1, 0.772549, 0, 1,
-1.08122, -1.268776, -2.25715, 1, 0.7803922, 0, 1,
-1.061549, -0.1294057, -2.805021, 1, 0.7843137, 0, 1,
-1.056204, 0.7848535, -1.149155, 1, 0.7921569, 0, 1,
-1.053123, 0.009443766, -0.5762358, 1, 0.7960784, 0, 1,
-1.048091, 2.547542, -1.193032, 1, 0.8039216, 0, 1,
-1.043415, -1.690171, -3.418679, 1, 0.8117647, 0, 1,
-1.040952, -0.0440595, -0.8914241, 1, 0.8156863, 0, 1,
-1.03538, 0.7781488, -2.571295, 1, 0.8235294, 0, 1,
-1.033471, 1.127953, 0.284796, 1, 0.827451, 0, 1,
-1.021325, 0.6288975, -2.08655, 1, 0.8352941, 0, 1,
-1.019107, -1.036094, -1.662273, 1, 0.8392157, 0, 1,
-1.018551, 0.1223384, -1.807617, 1, 0.8470588, 0, 1,
-1.014516, 1.358005, -1.721354, 1, 0.8509804, 0, 1,
-1.008326, -1.174592, -3.460611, 1, 0.8588235, 0, 1,
-1.002784, -0.6075939, -1.895895, 1, 0.8627451, 0, 1,
-0.9929226, -0.009072996, -2.744847, 1, 0.8705882, 0, 1,
-0.9846618, -0.5064964, -2.580412, 1, 0.8745098, 0, 1,
-0.9846129, 0.3980978, -2.330977, 1, 0.8823529, 0, 1,
-0.9834501, 0.1573055, -0.4452132, 1, 0.8862745, 0, 1,
-0.9766281, 0.9110882, -2.476353, 1, 0.8941177, 0, 1,
-0.9674756, -0.3656213, -2.273968, 1, 0.8980392, 0, 1,
-0.9666294, -0.0707578, 0.2644035, 1, 0.9058824, 0, 1,
-0.9646794, 1.180286, -1.843618, 1, 0.9137255, 0, 1,
-0.9636426, -0.6535831, -3.55857, 1, 0.9176471, 0, 1,
-0.957652, 0.858286, -1.742134, 1, 0.9254902, 0, 1,
-0.9518049, 0.372811, -2.110901, 1, 0.9294118, 0, 1,
-0.9489477, 1.057366, -0.4691563, 1, 0.9372549, 0, 1,
-0.9487172, 0.5460868, -1.370936, 1, 0.9411765, 0, 1,
-0.9452652, -1.543981, -3.200202, 1, 0.9490196, 0, 1,
-0.944159, -0.1415562, -1.517265, 1, 0.9529412, 0, 1,
-0.9431975, -0.8563671, -2.992539, 1, 0.9607843, 0, 1,
-0.9385392, -1.767557, -1.768876, 1, 0.9647059, 0, 1,
-0.9364747, 0.8445119, -1.799645, 1, 0.972549, 0, 1,
-0.9334297, 0.9430202, -1.437391, 1, 0.9764706, 0, 1,
-0.928354, -1.23035, -3.08376, 1, 0.9843137, 0, 1,
-0.9201706, -0.2248521, -1.687926, 1, 0.9882353, 0, 1,
-0.9191687, -1.332131, -2.968019, 1, 0.9960784, 0, 1,
-0.9137648, -0.7269966, -1.902403, 0.9960784, 1, 0, 1,
-0.9134775, 0.02969724, -1.469477, 0.9921569, 1, 0, 1,
-0.9060665, -0.1599844, -2.329029, 0.9843137, 1, 0, 1,
-0.9039963, 0.161485, -2.135247, 0.9803922, 1, 0, 1,
-0.9022507, 0.349971, -2.446565, 0.972549, 1, 0, 1,
-0.8991701, 0.2273771, -1.367173, 0.9686275, 1, 0, 1,
-0.897427, -0.4985235, -1.512493, 0.9607843, 1, 0, 1,
-0.8892465, 0.6705037, -0.2339395, 0.9568627, 1, 0, 1,
-0.8825274, -0.8147463, -2.605333, 0.9490196, 1, 0, 1,
-0.8733149, -0.7560116, -1.589897, 0.945098, 1, 0, 1,
-0.8709122, 1.558585, -1.763323, 0.9372549, 1, 0, 1,
-0.8654336, 0.2012396, -2.30189, 0.9333333, 1, 0, 1,
-0.8634264, 0.1708649, -1.319673, 0.9254902, 1, 0, 1,
-0.85878, -0.3563276, -3.946433, 0.9215686, 1, 0, 1,
-0.8578324, -0.7266746, -1.555278, 0.9137255, 1, 0, 1,
-0.8459649, -0.7157365, -1.850739, 0.9098039, 1, 0, 1,
-0.8418491, -0.03461389, -1.532846, 0.9019608, 1, 0, 1,
-0.8410873, -0.6121706, -1.490214, 0.8941177, 1, 0, 1,
-0.8377504, -0.5214776, -2.133247, 0.8901961, 1, 0, 1,
-0.8349085, -0.4904964, -3.159698, 0.8823529, 1, 0, 1,
-0.8329895, 1.406924, -0.3567039, 0.8784314, 1, 0, 1,
-0.8316692, -0.4624356, -1.111339, 0.8705882, 1, 0, 1,
-0.8290018, 0.4933805, -1.48155, 0.8666667, 1, 0, 1,
-0.827893, -0.3229537, -2.89088, 0.8588235, 1, 0, 1,
-0.8242366, -0.1059185, -0.2034183, 0.854902, 1, 0, 1,
-0.8236637, 1.974226, -2.389633, 0.8470588, 1, 0, 1,
-0.8220841, 0.3640407, -0.9092797, 0.8431373, 1, 0, 1,
-0.8204798, -0.6723691, -1.615993, 0.8352941, 1, 0, 1,
-0.8193615, 0.9156517, -0.2160604, 0.8313726, 1, 0, 1,
-0.8185923, -0.5574456, -2.574184, 0.8235294, 1, 0, 1,
-0.8126096, 0.7680033, -1.6126, 0.8196079, 1, 0, 1,
-0.8085865, -0.660753, -2.309858, 0.8117647, 1, 0, 1,
-0.8050154, -1.730345, -2.725598, 0.8078431, 1, 0, 1,
-0.8017901, 0.1264923, -0.6765353, 0.8, 1, 0, 1,
-0.7986472, -0.04413952, -0.2282491, 0.7921569, 1, 0, 1,
-0.7954987, 1.723476, -2.332932, 0.7882353, 1, 0, 1,
-0.793326, 0.5185941, 0.3673873, 0.7803922, 1, 0, 1,
-0.7877256, -1.857891, -1.16966, 0.7764706, 1, 0, 1,
-0.7875427, 0.9086841, 0.07111887, 0.7686275, 1, 0, 1,
-0.7834163, 0.4852943, -0.2747816, 0.7647059, 1, 0, 1,
-0.7815282, -0.6719712, -1.633101, 0.7568628, 1, 0, 1,
-0.7792021, 1.277882, -1.120966, 0.7529412, 1, 0, 1,
-0.7780377, 0.002353739, -1.224515, 0.7450981, 1, 0, 1,
-0.7780314, -1.247404, -2.504604, 0.7411765, 1, 0, 1,
-0.7775915, 0.7630703, -1.894494, 0.7333333, 1, 0, 1,
-0.7757565, 1.00315, -0.6072786, 0.7294118, 1, 0, 1,
-0.7742044, -0.1830815, -2.045964, 0.7215686, 1, 0, 1,
-0.7679928, 0.2742689, -1.780695, 0.7176471, 1, 0, 1,
-0.7649698, -0.3030994, -2.349928, 0.7098039, 1, 0, 1,
-0.7602816, -0.4065621, -5.532688, 0.7058824, 1, 0, 1,
-0.7599653, -1.283721, -3.388756, 0.6980392, 1, 0, 1,
-0.7575398, -0.6174498, -3.690608, 0.6901961, 1, 0, 1,
-0.7546377, -0.2507799, 0.1293442, 0.6862745, 1, 0, 1,
-0.7484384, -0.03746819, -1.761973, 0.6784314, 1, 0, 1,
-0.7458884, 0.9823604, -1.060047, 0.6745098, 1, 0, 1,
-0.7454515, 0.2184171, -2.663405, 0.6666667, 1, 0, 1,
-0.7428614, 0.1741113, -1.498109, 0.6627451, 1, 0, 1,
-0.742221, 1.500855, 0.03917612, 0.654902, 1, 0, 1,
-0.7326711, 0.4365959, 0.1540046, 0.6509804, 1, 0, 1,
-0.7285776, -0.3958804, -2.17471, 0.6431373, 1, 0, 1,
-0.725384, 1.66218, 1.906905, 0.6392157, 1, 0, 1,
-0.7253183, -0.2797211, -2.05918, 0.6313726, 1, 0, 1,
-0.724175, -0.6767088, -2.650788, 0.627451, 1, 0, 1,
-0.7190969, 0.4448877, 0.1119003, 0.6196079, 1, 0, 1,
-0.7161823, 0.09547592, -1.191322, 0.6156863, 1, 0, 1,
-0.7121761, 0.2545661, -0.5133232, 0.6078432, 1, 0, 1,
-0.7084516, 1.255108, -0.3726812, 0.6039216, 1, 0, 1,
-0.7071115, -0.6509882, -2.59919, 0.5960785, 1, 0, 1,
-0.7068812, -1.141521, -2.78413, 0.5882353, 1, 0, 1,
-0.7004066, 0.6607495, -1.342962, 0.5843138, 1, 0, 1,
-0.6998857, 0.04941718, -1.458572, 0.5764706, 1, 0, 1,
-0.6982931, 0.7509929, 0.14695, 0.572549, 1, 0, 1,
-0.6879299, 0.6045676, -0.600803, 0.5647059, 1, 0, 1,
-0.6865877, -0.6804256, -1.91753, 0.5607843, 1, 0, 1,
-0.6841092, 2.44384, -1.160968, 0.5529412, 1, 0, 1,
-0.6767376, -0.548852, -1.852475, 0.5490196, 1, 0, 1,
-0.6743978, -0.7878393, 0.0634559, 0.5411765, 1, 0, 1,
-0.6738382, -0.8991685, -2.516146, 0.5372549, 1, 0, 1,
-0.6704608, -0.4764336, -1.395915, 0.5294118, 1, 0, 1,
-0.6689366, -0.2341841, 0.5629927, 0.5254902, 1, 0, 1,
-0.6688206, -0.5442353, -2.707522, 0.5176471, 1, 0, 1,
-0.6681859, 1.662471, 1.923267, 0.5137255, 1, 0, 1,
-0.6672156, -0.3494152, -2.048974, 0.5058824, 1, 0, 1,
-0.6670881, -0.4279286, -2.793607, 0.5019608, 1, 0, 1,
-0.6662696, -1.209862, -1.000833, 0.4941176, 1, 0, 1,
-0.6658884, 0.7205654, 0.08673178, 0.4862745, 1, 0, 1,
-0.664267, -1.433856, -5.56963, 0.4823529, 1, 0, 1,
-0.6580975, -1.021801, -2.766018, 0.4745098, 1, 0, 1,
-0.6558758, 0.1325807, -1.578093, 0.4705882, 1, 0, 1,
-0.6550847, 0.8351464, -0.02231218, 0.4627451, 1, 0, 1,
-0.6453193, 0.1422729, -2.515653, 0.4588235, 1, 0, 1,
-0.6438205, -1.355972, -1.600432, 0.4509804, 1, 0, 1,
-0.6375426, 1.142776, -1.363044, 0.4470588, 1, 0, 1,
-0.6361551, -0.572668, -3.035649, 0.4392157, 1, 0, 1,
-0.6331079, -0.2627572, -3.593914, 0.4352941, 1, 0, 1,
-0.6326819, 0.3277486, -0.3207164, 0.427451, 1, 0, 1,
-0.6315848, 0.1273963, -2.005297, 0.4235294, 1, 0, 1,
-0.6305003, 0.5590541, 0.04201737, 0.4156863, 1, 0, 1,
-0.6295657, -0.2024307, -1.619282, 0.4117647, 1, 0, 1,
-0.6287852, 1.70635, 0.03226088, 0.4039216, 1, 0, 1,
-0.6231362, -0.8853258, -1.529379, 0.3960784, 1, 0, 1,
-0.6203759, -0.0006613797, -1.724017, 0.3921569, 1, 0, 1,
-0.6175496, -0.6837977, -2.775536, 0.3843137, 1, 0, 1,
-0.6170734, -0.3807108, -1.399208, 0.3803922, 1, 0, 1,
-0.6129372, 0.2779214, 0.392643, 0.372549, 1, 0, 1,
-0.6064296, 0.001791335, -2.304211, 0.3686275, 1, 0, 1,
-0.6063176, -0.7945315, -1.764198, 0.3607843, 1, 0, 1,
-0.605321, 0.1166302, -2.264044, 0.3568628, 1, 0, 1,
-0.6044298, 0.4591828, -1.329436, 0.3490196, 1, 0, 1,
-0.6019151, -0.2668195, -1.581434, 0.345098, 1, 0, 1,
-0.5995466, 0.3890793, -0.4954847, 0.3372549, 1, 0, 1,
-0.5978732, -0.02748733, -1.433548, 0.3333333, 1, 0, 1,
-0.5892534, -0.6017253, -1.905875, 0.3254902, 1, 0, 1,
-0.5881173, -1.045613, -3.767275, 0.3215686, 1, 0, 1,
-0.5877804, 0.7165656, -2.164772, 0.3137255, 1, 0, 1,
-0.5855353, 0.4286073, -1.002052, 0.3098039, 1, 0, 1,
-0.5850562, 0.9071643, -0.6568183, 0.3019608, 1, 0, 1,
-0.5824856, -1.1234, -2.111763, 0.2941177, 1, 0, 1,
-0.5759727, 0.02703969, -2.245066, 0.2901961, 1, 0, 1,
-0.572551, 0.2567517, 0.2710289, 0.282353, 1, 0, 1,
-0.5715393, 1.037221, 0.5620395, 0.2784314, 1, 0, 1,
-0.5693078, -0.5324438, -1.295512, 0.2705882, 1, 0, 1,
-0.5686643, -0.09059203, -0.5302424, 0.2666667, 1, 0, 1,
-0.5652094, 0.7118232, -0.3484969, 0.2588235, 1, 0, 1,
-0.5629785, -0.7322126, -3.106274, 0.254902, 1, 0, 1,
-0.5605779, 1.308543, -0.8945005, 0.2470588, 1, 0, 1,
-0.5596035, 0.627204, -0.873111, 0.2431373, 1, 0, 1,
-0.5588924, 1.423217, 0.1510428, 0.2352941, 1, 0, 1,
-0.5585431, -1.355875, -2.662487, 0.2313726, 1, 0, 1,
-0.5527767, 0.3396848, -2.631447, 0.2235294, 1, 0, 1,
-0.5474291, 0.1787514, -0.4522408, 0.2196078, 1, 0, 1,
-0.5435218, 1.571104, -0.5252721, 0.2117647, 1, 0, 1,
-0.5417485, 0.8956562, -2.408137, 0.2078431, 1, 0, 1,
-0.5370357, -1.278723, -1.942196, 0.2, 1, 0, 1,
-0.5364659, 1.494237, 0.07684549, 0.1921569, 1, 0, 1,
-0.5362313, 2.137365, -0.8642598, 0.1882353, 1, 0, 1,
-0.5251575, 1.517654, -0.377656, 0.1803922, 1, 0, 1,
-0.5224512, -0.1104017, -2.330166, 0.1764706, 1, 0, 1,
-0.5210119, -1.270042, -1.93696, 0.1686275, 1, 0, 1,
-0.5203405, 0.4951439, 0.2017227, 0.1647059, 1, 0, 1,
-0.5178813, -0.183709, -2.083245, 0.1568628, 1, 0, 1,
-0.5038384, 0.9640944, -1.019647, 0.1529412, 1, 0, 1,
-0.5036002, -1.108163, -2.866472, 0.145098, 1, 0, 1,
-0.5016448, 0.3409867, -2.133386, 0.1411765, 1, 0, 1,
-0.4984692, 0.2359577, 0.07424145, 0.1333333, 1, 0, 1,
-0.4976799, 0.7670628, -0.7869208, 0.1294118, 1, 0, 1,
-0.4957715, -0.8019359, -1.845801, 0.1215686, 1, 0, 1,
-0.4907601, -0.0769811, -0.3627519, 0.1176471, 1, 0, 1,
-0.4851187, -0.5509568, -1.996781, 0.1098039, 1, 0, 1,
-0.4844911, -0.4405039, -3.831256, 0.1058824, 1, 0, 1,
-0.4827238, 1.613111, -1.829767, 0.09803922, 1, 0, 1,
-0.4775652, -2.561044, -2.35602, 0.09019608, 1, 0, 1,
-0.4769081, 0.5620956, -1.266709, 0.08627451, 1, 0, 1,
-0.4640837, 2.247892, -0.1517265, 0.07843138, 1, 0, 1,
-0.4610527, 0.270377, -0.8575478, 0.07450981, 1, 0, 1,
-0.4609698, -0.678822, -1.905095, 0.06666667, 1, 0, 1,
-0.4603182, 0.5937001, -1.986911, 0.0627451, 1, 0, 1,
-0.4602499, -0.2288243, -3.827921, 0.05490196, 1, 0, 1,
-0.4571626, -0.1137029, -1.830531, 0.05098039, 1, 0, 1,
-0.456873, 1.380118, 1.047746, 0.04313726, 1, 0, 1,
-0.4516486, -0.2940824, -2.350954, 0.03921569, 1, 0, 1,
-0.4487765, -0.5948617, -1.88294, 0.03137255, 1, 0, 1,
-0.4440904, -0.9972558, -2.94265, 0.02745098, 1, 0, 1,
-0.4422644, 0.07360425, -0.2803342, 0.01960784, 1, 0, 1,
-0.438808, -1.900677, -2.645416, 0.01568628, 1, 0, 1,
-0.4362771, 1.073849, -1.134487, 0.007843138, 1, 0, 1,
-0.4335759, -1.546984, -2.948821, 0.003921569, 1, 0, 1,
-0.4312358, -0.6108397, -2.163381, 0, 1, 0.003921569, 1,
-0.4292378, -0.4730475, -2.016265, 0, 1, 0.01176471, 1,
-0.4260941, -0.8765319, -2.715804, 0, 1, 0.01568628, 1,
-0.4242706, 0.6652768, 0.02797954, 0, 1, 0.02352941, 1,
-0.4230186, -1.441564, -3.668652, 0, 1, 0.02745098, 1,
-0.4219623, 2.181638, 0.6484897, 0, 1, 0.03529412, 1,
-0.4188878, 0.6893778, 0.4650357, 0, 1, 0.03921569, 1,
-0.4169022, -0.1247207, -2.560368, 0, 1, 0.04705882, 1,
-0.4136971, -0.8320485, -1.599543, 0, 1, 0.05098039, 1,
-0.409176, 1.608201, -0.7554507, 0, 1, 0.05882353, 1,
-0.4085572, 0.1790227, -1.229619, 0, 1, 0.0627451, 1,
-0.4067087, -1.14778, -4.012086, 0, 1, 0.07058824, 1,
-0.4054365, 0.3857077, -0.9623858, 0, 1, 0.07450981, 1,
-0.4045835, 2.294755, 2.648988, 0, 1, 0.08235294, 1,
-0.4004655, 0.5666903, 0.4065009, 0, 1, 0.08627451, 1,
-0.4004138, 0.7720512, 0.6956971, 0, 1, 0.09411765, 1,
-0.3986825, -2.441489, -1.963784, 0, 1, 0.1019608, 1,
-0.3983219, 0.7080423, 0.4112184, 0, 1, 0.1058824, 1,
-0.398315, 0.8390075, -0.2715415, 0, 1, 0.1137255, 1,
-0.3947589, 1.750995, 0.5795916, 0, 1, 0.1176471, 1,
-0.3889425, -1.079786, -2.665451, 0, 1, 0.1254902, 1,
-0.3888234, 1.783463, 0.287069, 0, 1, 0.1294118, 1,
-0.387111, 0.3411089, 0.0064251, 0, 1, 0.1372549, 1,
-0.3844437, -1.039766, -3.395344, 0, 1, 0.1411765, 1,
-0.383257, -0.05091345, -2.535293, 0, 1, 0.1490196, 1,
-0.376379, -0.8738292, -2.607326, 0, 1, 0.1529412, 1,
-0.3735985, 0.07138526, -0.7013708, 0, 1, 0.1607843, 1,
-0.3726764, -0.8372061, -1.468489, 0, 1, 0.1647059, 1,
-0.369757, -0.7665434, -2.099292, 0, 1, 0.172549, 1,
-0.3655968, 2.16595, -1.11031, 0, 1, 0.1764706, 1,
-0.3636998, 0.8676882, 0.1512958, 0, 1, 0.1843137, 1,
-0.3625447, 0.7668495, -0.7387427, 0, 1, 0.1882353, 1,
-0.3577445, -1.075651, -1.130509, 0, 1, 0.1960784, 1,
-0.3533844, 1.282069, -1.77214, 0, 1, 0.2039216, 1,
-0.3514706, 1.887204, 1.46979, 0, 1, 0.2078431, 1,
-0.350877, 0.1747426, -0.6596659, 0, 1, 0.2156863, 1,
-0.3505939, 0.8230874, 0.3164157, 0, 1, 0.2196078, 1,
-0.3475362, 0.8432164, 0.1624718, 0, 1, 0.227451, 1,
-0.3471722, -0.7785298, -3.714851, 0, 1, 0.2313726, 1,
-0.3411737, -0.8437437, -2.818886, 0, 1, 0.2392157, 1,
-0.3397018, -0.1308223, -2.968508, 0, 1, 0.2431373, 1,
-0.3372279, -0.873834, -1.629993, 0, 1, 0.2509804, 1,
-0.3351541, 1.108712, 1.033856, 0, 1, 0.254902, 1,
-0.3277149, 0.6034623, -0.8087345, 0, 1, 0.2627451, 1,
-0.326619, -0.8935764, -1.852629, 0, 1, 0.2666667, 1,
-0.3248952, 0.3877526, 1.798107, 0, 1, 0.2745098, 1,
-0.3229379, -0.04102641, -1.983419, 0, 1, 0.2784314, 1,
-0.3223565, 0.7657695, -0.2512713, 0, 1, 0.2862745, 1,
-0.3188342, 0.361419, -0.3214479, 0, 1, 0.2901961, 1,
-0.3184473, -0.01702676, -0.9267443, 0, 1, 0.2980392, 1,
-0.3152371, 0.3385244, 0.03049258, 0, 1, 0.3058824, 1,
-0.3071412, -0.2315904, -0.753589, 0, 1, 0.3098039, 1,
-0.3044889, -0.4920776, -4.048553, 0, 1, 0.3176471, 1,
-0.3035031, -0.2230384, -1.876275, 0, 1, 0.3215686, 1,
-0.3029045, -1.098536, -1.878821, 0, 1, 0.3294118, 1,
-0.3018766, -0.1302543, -2.799739, 0, 1, 0.3333333, 1,
-0.2994404, -0.2723383, -1.231048, 0, 1, 0.3411765, 1,
-0.2994247, -0.9078527, -1.900978, 0, 1, 0.345098, 1,
-0.2973192, -1.831916, -2.408899, 0, 1, 0.3529412, 1,
-0.2968737, -0.1702114, -2.448587, 0, 1, 0.3568628, 1,
-0.2938672, -0.1525212, -1.799686, 0, 1, 0.3647059, 1,
-0.2923291, -1.856387, -3.034217, 0, 1, 0.3686275, 1,
-0.2895823, 0.185462, 0.3126568, 0, 1, 0.3764706, 1,
-0.2890577, -0.6907706, -3.708005, 0, 1, 0.3803922, 1,
-0.2875397, 1.268874, -1.193144, 0, 1, 0.3882353, 1,
-0.2858404, -0.4108859, -3.272388, 0, 1, 0.3921569, 1,
-0.2819375, 1.80892, 2.227804, 0, 1, 0.4, 1,
-0.280442, -0.2512237, -2.377543, 0, 1, 0.4078431, 1,
-0.2692432, 0.2751898, -1.441635, 0, 1, 0.4117647, 1,
-0.2671958, 0.8798478, -1.341424, 0, 1, 0.4196078, 1,
-0.2642258, 0.2614747, -1.209943, 0, 1, 0.4235294, 1,
-0.2641543, -0.05817345, -2.590003, 0, 1, 0.4313726, 1,
-0.2629204, -0.5057784, -2.870397, 0, 1, 0.4352941, 1,
-0.2619675, -0.2634482, -1.205377, 0, 1, 0.4431373, 1,
-0.2598351, -1.211986, -2.433121, 0, 1, 0.4470588, 1,
-0.258763, -0.5813925, -3.472649, 0, 1, 0.454902, 1,
-0.2526699, -1.733634, -4.295995, 0, 1, 0.4588235, 1,
-0.2511317, 0.7646725, -0.2249888, 0, 1, 0.4666667, 1,
-0.2486269, 0.3917287, -1.325386, 0, 1, 0.4705882, 1,
-0.2478163, 0.4078015, -0.197829, 0, 1, 0.4784314, 1,
-0.2470495, 0.4241444, -0.8398037, 0, 1, 0.4823529, 1,
-0.2467431, -1.922029, -2.463976, 0, 1, 0.4901961, 1,
-0.2464922, 0.7967516, 1.278935, 0, 1, 0.4941176, 1,
-0.2441651, -0.04909534, -1.406191, 0, 1, 0.5019608, 1,
-0.2436002, -0.4132964, -0.553621, 0, 1, 0.509804, 1,
-0.2366621, 0.2678383, -1.260531, 0, 1, 0.5137255, 1,
-0.2363438, -0.9215356, -2.49787, 0, 1, 0.5215687, 1,
-0.2306639, -0.7096879, -3.85266, 0, 1, 0.5254902, 1,
-0.2264273, -0.5335979, -1.943776, 0, 1, 0.5333334, 1,
-0.2236528, 0.899731, 0.53964, 0, 1, 0.5372549, 1,
-0.2231292, -0.1953279, -1.070814, 0, 1, 0.5450981, 1,
-0.2214288, -0.1448648, -5.22381, 0, 1, 0.5490196, 1,
-0.2183027, -1.416541, -1.517323, 0, 1, 0.5568628, 1,
-0.2179551, 1.022599, -0.1863676, 0, 1, 0.5607843, 1,
-0.2174147, 1.752146, 0.1819934, 0, 1, 0.5686275, 1,
-0.2168754, 0.01678752, -1.105463, 0, 1, 0.572549, 1,
-0.2148564, -1.39119, -4.261382, 0, 1, 0.5803922, 1,
-0.2130922, -0.769933, -1.027342, 0, 1, 0.5843138, 1,
-0.2094406, -0.3335226, -1.539499, 0, 1, 0.5921569, 1,
-0.2092799, -0.402051, -1.133931, 0, 1, 0.5960785, 1,
-0.2085623, -0.9057148, -1.078246, 0, 1, 0.6039216, 1,
-0.2078004, -1.63697, -3.618826, 0, 1, 0.6117647, 1,
-0.2076079, 0.09079891, -2.164629, 0, 1, 0.6156863, 1,
-0.2057568, 0.7398744, -0.6443805, 0, 1, 0.6235294, 1,
-0.2046086, 1.552159, 0.3218409, 0, 1, 0.627451, 1,
-0.2044817, -0.6055623, -0.6549059, 0, 1, 0.6352941, 1,
-0.1989188, -0.2810085, -2.995294, 0, 1, 0.6392157, 1,
-0.1982909, -0.1813799, -1.172801, 0, 1, 0.6470588, 1,
-0.189885, 0.2471575, 0.7380379, 0, 1, 0.6509804, 1,
-0.1895816, -1.162304, -2.495666, 0, 1, 0.6588235, 1,
-0.188705, 1.08997, 0.3942043, 0, 1, 0.6627451, 1,
-0.1878091, -0.9953507, -2.780547, 0, 1, 0.6705883, 1,
-0.1829242, -0.5492564, -3.741795, 0, 1, 0.6745098, 1,
-0.1820982, 0.01607807, -1.253345, 0, 1, 0.682353, 1,
-0.1820058, 1.174379, -0.6547543, 0, 1, 0.6862745, 1,
-0.1802987, -0.0698049, -1.697027, 0, 1, 0.6941177, 1,
-0.1794021, -0.7732518, -3.015609, 0, 1, 0.7019608, 1,
-0.166635, 0.08900382, -1.66018, 0, 1, 0.7058824, 1,
-0.1663559, 0.6625294, 0.2246268, 0, 1, 0.7137255, 1,
-0.161615, 0.4586936, -1.900989, 0, 1, 0.7176471, 1,
-0.1581109, 0.2339688, -1.621047, 0, 1, 0.7254902, 1,
-0.1543467, 0.2140216, -1.587661, 0, 1, 0.7294118, 1,
-0.1538736, 0.1661233, 0.3941435, 0, 1, 0.7372549, 1,
-0.1504564, -0.7493297, -2.251499, 0, 1, 0.7411765, 1,
-0.1474168, 0.6792425, -0.3948642, 0, 1, 0.7490196, 1,
-0.1398333, 1.698014, -0.7388796, 0, 1, 0.7529412, 1,
-0.1264179, 0.9757702, 0.2525016, 0, 1, 0.7607843, 1,
-0.1246582, 0.6425828, -0.03614594, 0, 1, 0.7647059, 1,
-0.1233822, -0.8901678, -4.695676, 0, 1, 0.772549, 1,
-0.1229604, 0.5517769, -0.575974, 0, 1, 0.7764706, 1,
-0.121113, 1.351658, -0.3151727, 0, 1, 0.7843137, 1,
-0.1201384, 0.1928121, -0.4235989, 0, 1, 0.7882353, 1,
-0.1193586, 0.05596662, -3.050864, 0, 1, 0.7960784, 1,
-0.1142142, 1.248284, 2.059021, 0, 1, 0.8039216, 1,
-0.1085753, 0.4774245, -0.7447366, 0, 1, 0.8078431, 1,
-0.1081501, 0.7940481, -0.9870819, 0, 1, 0.8156863, 1,
-0.1051673, -0.03429787, -1.126432, 0, 1, 0.8196079, 1,
-0.1038392, 0.9060571, -0.05634182, 0, 1, 0.827451, 1,
-0.09545697, 1.786373, -1.471112, 0, 1, 0.8313726, 1,
-0.09325603, 0.4018016, -1.449325, 0, 1, 0.8392157, 1,
-0.09020095, -0.5360283, -3.567067, 0, 1, 0.8431373, 1,
-0.08491852, -0.3686259, -2.930139, 0, 1, 0.8509804, 1,
-0.0844297, -0.7067747, -4.61774, 0, 1, 0.854902, 1,
-0.08437143, -0.3547983, -2.125793, 0, 1, 0.8627451, 1,
-0.08425896, 0.7416328, 0.3297172, 0, 1, 0.8666667, 1,
-0.08395014, -0.8889611, -2.558732, 0, 1, 0.8745098, 1,
-0.07932793, -0.5638289, -2.676043, 0, 1, 0.8784314, 1,
-0.07472651, 0.9021206, 1.383182, 0, 1, 0.8862745, 1,
-0.06515066, 1.524509, 1.577711, 0, 1, 0.8901961, 1,
-0.06183677, 0.6480661, 1.34202, 0, 1, 0.8980392, 1,
-0.05738021, -1.106812, -4.025291, 0, 1, 0.9058824, 1,
-0.04599975, -1.381912, -2.911231, 0, 1, 0.9098039, 1,
-0.04553179, -0.6646982, -3.933135, 0, 1, 0.9176471, 1,
-0.04253953, -0.2273671, -4.730136, 0, 1, 0.9215686, 1,
-0.04202186, -0.9292999, -5.721953, 0, 1, 0.9294118, 1,
-0.04171543, -1.000823, -3.0916, 0, 1, 0.9333333, 1,
-0.04011185, -1.51485, -3.023283, 0, 1, 0.9411765, 1,
-0.03964345, -0.02697512, -3.748526, 0, 1, 0.945098, 1,
-0.03374369, 0.70568, 0.7092043, 0, 1, 0.9529412, 1,
-0.02905501, -1.200968, -4.622995, 0, 1, 0.9568627, 1,
-0.02495098, 0.9926134, 0.008023608, 0, 1, 0.9647059, 1,
-0.01752195, 2.074437, 0.7564537, 0, 1, 0.9686275, 1,
-0.0151577, 0.1767382, 0.05418059, 0, 1, 0.9764706, 1,
-0.002997834, -0.5522193, -5.775369, 0, 1, 0.9803922, 1,
0.0003547115, 0.3755468, 1.538427, 0, 1, 0.9882353, 1,
0.004045414, 0.8100893, -0.04541182, 0, 1, 0.9921569, 1,
0.004116531, -0.4351518, 3.084952, 0, 1, 1, 1,
0.004299277, -1.401585, 5.402937, 0, 0.9921569, 1, 1,
0.004659099, 0.154985, 0.3171338, 0, 0.9882353, 1, 1,
0.008280141, 0.2653814, -0.5461662, 0, 0.9803922, 1, 1,
0.008790053, -0.5879644, 4.922892, 0, 0.9764706, 1, 1,
0.008834576, 0.1393049, -0.8855879, 0, 0.9686275, 1, 1,
0.01033087, 1.007357, 0.1551768, 0, 0.9647059, 1, 1,
0.01192693, -1.662709, 2.650258, 0, 0.9568627, 1, 1,
0.01310367, -0.5861533, 2.981397, 0, 0.9529412, 1, 1,
0.01410849, 1.03082, -1.762802, 0, 0.945098, 1, 1,
0.02168867, 0.7651687, 0.05076576, 0, 0.9411765, 1, 1,
0.02202456, 0.6428012, 0.3228323, 0, 0.9333333, 1, 1,
0.02275613, -0.8705357, 1.881701, 0, 0.9294118, 1, 1,
0.02289487, -1.70502, 2.745468, 0, 0.9215686, 1, 1,
0.02373214, 0.08252128, 0.6937937, 0, 0.9176471, 1, 1,
0.02420111, -0.1503007, 2.322962, 0, 0.9098039, 1, 1,
0.02643528, -0.1407097, 2.585536, 0, 0.9058824, 1, 1,
0.02972823, -0.1391215, 2.749003, 0, 0.8980392, 1, 1,
0.03151108, -0.4169622, 2.406312, 0, 0.8901961, 1, 1,
0.03474239, -0.2471452, 2.12995, 0, 0.8862745, 1, 1,
0.03808891, -0.8965298, 5.320704, 0, 0.8784314, 1, 1,
0.04041006, -0.2119263, 3.085402, 0, 0.8745098, 1, 1,
0.04050409, -1.755516, 4.711384, 0, 0.8666667, 1, 1,
0.0411264, -1.758352, 3.925758, 0, 0.8627451, 1, 1,
0.04363808, -0.2600771, 3.070096, 0, 0.854902, 1, 1,
0.04505508, 1.028497, 0.3362596, 0, 0.8509804, 1, 1,
0.04683204, 0.9017356, -0.1032987, 0, 0.8431373, 1, 1,
0.0485068, -1.630361, 4.693925, 0, 0.8392157, 1, 1,
0.05489209, -0.04784681, -0.002214765, 0, 0.8313726, 1, 1,
0.05584608, 0.5898752, -0.00876398, 0, 0.827451, 1, 1,
0.05902221, -0.3255014, 3.146314, 0, 0.8196079, 1, 1,
0.06003685, -1.194388, 3.709618, 0, 0.8156863, 1, 1,
0.06236081, 1.482852, -0.5990139, 0, 0.8078431, 1, 1,
0.06370823, -0.5124709, 3.923248, 0, 0.8039216, 1, 1,
0.06407529, 0.9266484, 0.2713069, 0, 0.7960784, 1, 1,
0.06965488, -0.04884855, 0.2403441, 0, 0.7882353, 1, 1,
0.07574525, 1.105081, 0.584693, 0, 0.7843137, 1, 1,
0.07917508, -0.9215016, 4.594306, 0, 0.7764706, 1, 1,
0.07994551, 1.526504, -0.2433217, 0, 0.772549, 1, 1,
0.08296726, -0.7402234, 2.735713, 0, 0.7647059, 1, 1,
0.08578619, -0.4673258, 3.547033, 0, 0.7607843, 1, 1,
0.08804401, -2.62758, 2.184811, 0, 0.7529412, 1, 1,
0.08807936, 1.039557, -1.35035, 0, 0.7490196, 1, 1,
0.0893213, -0.457422, 3.466167, 0, 0.7411765, 1, 1,
0.0897513, -0.34727, 4.066393, 0, 0.7372549, 1, 1,
0.09022934, -1.280544, 2.779522, 0, 0.7294118, 1, 1,
0.0904043, -0.1721654, 4.52657, 0, 0.7254902, 1, 1,
0.09410851, -0.8400862, 3.066373, 0, 0.7176471, 1, 1,
0.09980055, 0.464086, 0.1184368, 0, 0.7137255, 1, 1,
0.1027957, 0.3674651, 0.9728698, 0, 0.7058824, 1, 1,
0.1072675, -1.145361, 3.116307, 0, 0.6980392, 1, 1,
0.1074744, 0.6695204, -0.386225, 0, 0.6941177, 1, 1,
0.1121054, 0.8609645, 0.2536997, 0, 0.6862745, 1, 1,
0.1132089, 1.299999, 0.01980396, 0, 0.682353, 1, 1,
0.1154211, -1.352719, 1.485002, 0, 0.6745098, 1, 1,
0.1222631, -0.6775496, 2.944405, 0, 0.6705883, 1, 1,
0.1224388, -1.64432, 3.103618, 0, 0.6627451, 1, 1,
0.1228429, -0.5392552, 2.075857, 0, 0.6588235, 1, 1,
0.1229187, -0.5164459, 3.570138, 0, 0.6509804, 1, 1,
0.1236605, -0.7825146, 3.350684, 0, 0.6470588, 1, 1,
0.1323966, 0.04692963, -0.02818508, 0, 0.6392157, 1, 1,
0.1331652, 1.091903, -0.8297384, 0, 0.6352941, 1, 1,
0.1344314, 0.3116393, -0.8491645, 0, 0.627451, 1, 1,
0.1366947, -0.313363, 2.381202, 0, 0.6235294, 1, 1,
0.1399461, 0.4182848, 0.3668413, 0, 0.6156863, 1, 1,
0.1406403, -0.5891776, 2.670559, 0, 0.6117647, 1, 1,
0.1427998, -1.141054, 3.051802, 0, 0.6039216, 1, 1,
0.1480352, 1.122236, 1.66671, 0, 0.5960785, 1, 1,
0.149785, -0.5246687, 3.434948, 0, 0.5921569, 1, 1,
0.1600879, -0.2119617, 1.337504, 0, 0.5843138, 1, 1,
0.168152, -0.7087252, 2.578557, 0, 0.5803922, 1, 1,
0.1709173, 0.2249975, 0.2727539, 0, 0.572549, 1, 1,
0.171853, -1.29132, 3.348179, 0, 0.5686275, 1, 1,
0.1727729, -0.3801639, 1.5126, 0, 0.5607843, 1, 1,
0.1809629, -0.8538053, 4.173307, 0, 0.5568628, 1, 1,
0.1811676, -1.280783, 2.556965, 0, 0.5490196, 1, 1,
0.1818646, 0.04992349, 0.7958096, 0, 0.5450981, 1, 1,
0.1830402, -1.128303, 3.42325, 0, 0.5372549, 1, 1,
0.1838988, 1.936961, -1.14891, 0, 0.5333334, 1, 1,
0.1848994, -1.642116, 4.171006, 0, 0.5254902, 1, 1,
0.1885747, -0.5271727, 2.221651, 0, 0.5215687, 1, 1,
0.189467, 0.8099481, -0.4461413, 0, 0.5137255, 1, 1,
0.1895515, 2.543209, -0.50309, 0, 0.509804, 1, 1,
0.1898449, -0.3213636, 4.197076, 0, 0.5019608, 1, 1,
0.1907447, -0.4973502, 3.856656, 0, 0.4941176, 1, 1,
0.1940566, 0.5043696, 1.207276, 0, 0.4901961, 1, 1,
0.1954972, 1.734954, -1.195472, 0, 0.4823529, 1, 1,
0.1957829, -1.07768, 1.781655, 0, 0.4784314, 1, 1,
0.1968144, 1.883443, 0.2154389, 0, 0.4705882, 1, 1,
0.2023305, -1.644433, 2.331103, 0, 0.4666667, 1, 1,
0.2048306, -0.5214038, 3.347383, 0, 0.4588235, 1, 1,
0.2070521, -0.710818, 4.490334, 0, 0.454902, 1, 1,
0.2114388, -0.8288682, 2.498333, 0, 0.4470588, 1, 1,
0.2117631, 0.8174802, 1.6955, 0, 0.4431373, 1, 1,
0.2162705, 0.3108696, -0.7920324, 0, 0.4352941, 1, 1,
0.2183731, -0.2521335, 2.968638, 0, 0.4313726, 1, 1,
0.2222796, 0.04418448, 0.7324873, 0, 0.4235294, 1, 1,
0.2256128, -0.9788589, 1.334772, 0, 0.4196078, 1, 1,
0.2266015, -1.631507, 2.545502, 0, 0.4117647, 1, 1,
0.2275025, 0.6530099, 0.161809, 0, 0.4078431, 1, 1,
0.2276395, -0.5517181, 2.647785, 0, 0.4, 1, 1,
0.2355893, 0.08578645, 1.928965, 0, 0.3921569, 1, 1,
0.2426852, -1.124032, 1.764942, 0, 0.3882353, 1, 1,
0.2427763, 0.4280034, 1.484862, 0, 0.3803922, 1, 1,
0.244981, -0.9066374, 3.708642, 0, 0.3764706, 1, 1,
0.2477215, 1.655614, 1.133851, 0, 0.3686275, 1, 1,
0.2488917, 1.704721, 0.6409116, 0, 0.3647059, 1, 1,
0.2510427, 0.2975264, 1.995602, 0, 0.3568628, 1, 1,
0.2515679, 0.1980446, 0.8350586, 0, 0.3529412, 1, 1,
0.2515824, 1.052275, -0.3373363, 0, 0.345098, 1, 1,
0.2530288, 1.138122, -0.144847, 0, 0.3411765, 1, 1,
0.2546999, 0.03483161, 1.417202, 0, 0.3333333, 1, 1,
0.2548601, -1.74212, 2.447465, 0, 0.3294118, 1, 1,
0.256466, -1.36063, 3.731488, 0, 0.3215686, 1, 1,
0.2580746, 0.9888582, 1.770993, 0, 0.3176471, 1, 1,
0.2602364, 0.1336586, 0.2247052, 0, 0.3098039, 1, 1,
0.2638871, -0.9764374, 3.715977, 0, 0.3058824, 1, 1,
0.2653614, 1.398786, -0.3279725, 0, 0.2980392, 1, 1,
0.266985, 2.340705, 2.32037, 0, 0.2901961, 1, 1,
0.26751, 1.368548, 1.701343, 0, 0.2862745, 1, 1,
0.2685953, -2.066346, 1.612612, 0, 0.2784314, 1, 1,
0.2718953, 0.1001276, 0.927112, 0, 0.2745098, 1, 1,
0.2727381, 0.5608208, 0.786149, 0, 0.2666667, 1, 1,
0.2754259, -0.4945774, 2.773433, 0, 0.2627451, 1, 1,
0.2763108, 2.700445, -1.537879, 0, 0.254902, 1, 1,
0.2787232, 1.389663, 2.126035, 0, 0.2509804, 1, 1,
0.2957888, 1.169467, 1.460951, 0, 0.2431373, 1, 1,
0.2963831, -0.4759849, 1.563901, 0, 0.2392157, 1, 1,
0.308803, 0.80924, -1.445032, 0, 0.2313726, 1, 1,
0.3105548, 0.2943265, 1.495118, 0, 0.227451, 1, 1,
0.3115608, -0.5192305, 2.667889, 0, 0.2196078, 1, 1,
0.3128065, 0.2383946, 1.345901, 0, 0.2156863, 1, 1,
0.3155772, -1.10594, 3.66201, 0, 0.2078431, 1, 1,
0.319495, -2.373634, 2.476707, 0, 0.2039216, 1, 1,
0.321799, 1.349542, 0.9411847, 0, 0.1960784, 1, 1,
0.3294934, -1.942574, 1.666988, 0, 0.1882353, 1, 1,
0.3317052, 1.385732, -0.2282099, 0, 0.1843137, 1, 1,
0.3366143, -1.731732, 4.264957, 0, 0.1764706, 1, 1,
0.3366357, 2.430984, -0.8139167, 0, 0.172549, 1, 1,
0.3375265, -1.112839, 0.4101902, 0, 0.1647059, 1, 1,
0.3387998, 1.443287, 1.363078, 0, 0.1607843, 1, 1,
0.3411122, 0.8109645, -1.315202, 0, 0.1529412, 1, 1,
0.343788, 0.3339516, 0.8414654, 0, 0.1490196, 1, 1,
0.3511144, 1.613867, 0.4979914, 0, 0.1411765, 1, 1,
0.3529777, 0.9106326, 1.377315, 0, 0.1372549, 1, 1,
0.3569967, -0.4622109, 3.90868, 0, 0.1294118, 1, 1,
0.3573057, -0.9256933, 2.150099, 0, 0.1254902, 1, 1,
0.3621526, -0.67177, 2.951086, 0, 0.1176471, 1, 1,
0.3632762, 0.01956982, 1.572763, 0, 0.1137255, 1, 1,
0.3642838, -0.5190838, 2.343778, 0, 0.1058824, 1, 1,
0.3700506, -1.635807, 2.8272, 0, 0.09803922, 1, 1,
0.3708109, -1.053323, 2.037789, 0, 0.09411765, 1, 1,
0.3720532, -0.0449865, 0.07466067, 0, 0.08627451, 1, 1,
0.3730284, 0.3226996, -1.762483, 0, 0.08235294, 1, 1,
0.3734639, 0.4361531, 1.741849, 0, 0.07450981, 1, 1,
0.3744926, 1.830366, 1.298647, 0, 0.07058824, 1, 1,
0.3790267, 0.001805846, 1.071365, 0, 0.0627451, 1, 1,
0.3800386, -0.8196862, 2.633453, 0, 0.05882353, 1, 1,
0.3801151, -0.06631377, 2.679962, 0, 0.05098039, 1, 1,
0.3802352, 0.2967497, 0.701925, 0, 0.04705882, 1, 1,
0.3833531, 0.4230158, 2.156773, 0, 0.03921569, 1, 1,
0.3889583, 0.5581592, 0.6993951, 0, 0.03529412, 1, 1,
0.390197, -0.7294027, 4.110981, 0, 0.02745098, 1, 1,
0.3945993, -0.1629814, 3.673355, 0, 0.02352941, 1, 1,
0.395818, -0.2859823, 1.185759, 0, 0.01568628, 1, 1,
0.3958201, -0.4528584, 2.201958, 0, 0.01176471, 1, 1,
0.3963098, -0.564502, 2.324747, 0, 0.003921569, 1, 1,
0.3996882, 0.518395, 1.204745, 0.003921569, 0, 1, 1,
0.407977, -0.2228233, 3.327286, 0.007843138, 0, 1, 1,
0.41339, -2.636409, 1.931494, 0.01568628, 0, 1, 1,
0.4198715, 0.4018524, 0.8659647, 0.01960784, 0, 1, 1,
0.4230594, 0.5103563, 0.6278098, 0.02745098, 0, 1, 1,
0.4280048, 0.5722866, -0.8258391, 0.03137255, 0, 1, 1,
0.4358983, -0.2089639, 0.8048536, 0.03921569, 0, 1, 1,
0.4359415, 1.913634, -1.158103, 0.04313726, 0, 1, 1,
0.4388604, -1.291343, 2.750557, 0.05098039, 0, 1, 1,
0.4409887, -1.039907, 3.079933, 0.05490196, 0, 1, 1,
0.4450058, 0.131002, 1.105047, 0.0627451, 0, 1, 1,
0.4489105, -0.06858347, 1.376811, 0.06666667, 0, 1, 1,
0.4559394, 0.8398701, -0.713534, 0.07450981, 0, 1, 1,
0.4564692, -0.09794233, 0.5643245, 0.07843138, 0, 1, 1,
0.4566747, -1.032794, -0.286617, 0.08627451, 0, 1, 1,
0.4597752, 1.114554, 0.2904487, 0.09019608, 0, 1, 1,
0.4626607, -0.4643888, 2.875271, 0.09803922, 0, 1, 1,
0.4639783, 0.3526637, 1.800157, 0.1058824, 0, 1, 1,
0.4702774, 1.014368, 0.8136589, 0.1098039, 0, 1, 1,
0.4714291, 0.1786431, 0.8672526, 0.1176471, 0, 1, 1,
0.4717301, 1.939592, -0.7316809, 0.1215686, 0, 1, 1,
0.4720465, 0.04606928, 2.988338, 0.1294118, 0, 1, 1,
0.4771841, 1.095034, 2.416514, 0.1333333, 0, 1, 1,
0.4786545, -0.7407235, 2.410838, 0.1411765, 0, 1, 1,
0.4837634, 0.7492375, 0.6475738, 0.145098, 0, 1, 1,
0.4866956, -0.8669622, 2.859025, 0.1529412, 0, 1, 1,
0.4877717, 0.06306041, 0.3560554, 0.1568628, 0, 1, 1,
0.488254, 1.52236, 0.3276071, 0.1647059, 0, 1, 1,
0.4906752, -2.06718, 2.499517, 0.1686275, 0, 1, 1,
0.4918183, 1.364241, -0.1540767, 0.1764706, 0, 1, 1,
0.4929461, -2.086165, 1.777088, 0.1803922, 0, 1, 1,
0.4933839, -0.2721602, 3.688412, 0.1882353, 0, 1, 1,
0.4952435, -1.547258, 2.798214, 0.1921569, 0, 1, 1,
0.4986391, 0.002271347, 2.579456, 0.2, 0, 1, 1,
0.5065038, 0.3164397, 1.729415, 0.2078431, 0, 1, 1,
0.5073523, 0.6877813, 1.291554, 0.2117647, 0, 1, 1,
0.5079895, -0.4882359, 3.17926, 0.2196078, 0, 1, 1,
0.5090668, -1.974242, 2.601082, 0.2235294, 0, 1, 1,
0.5093808, -0.02554076, 1.337503, 0.2313726, 0, 1, 1,
0.5102857, -0.5957657, 3.171047, 0.2352941, 0, 1, 1,
0.5112922, 0.04642786, 1.80295, 0.2431373, 0, 1, 1,
0.5113632, 0.366539, 2.933767, 0.2470588, 0, 1, 1,
0.5126548, -1.783673, 2.092454, 0.254902, 0, 1, 1,
0.5136003, 0.1744853, 1.669462, 0.2588235, 0, 1, 1,
0.5141095, 0.243228, 1.44115, 0.2666667, 0, 1, 1,
0.5171233, -1.999852, 1.896912, 0.2705882, 0, 1, 1,
0.5218511, -0.0904007, 2.756994, 0.2784314, 0, 1, 1,
0.5235709, 0.1586001, 0.8578376, 0.282353, 0, 1, 1,
0.5251976, -0.1699179, 0.4293421, 0.2901961, 0, 1, 1,
0.5273803, 2.151711, 0.03518146, 0.2941177, 0, 1, 1,
0.5279502, -1.260528, 3.216916, 0.3019608, 0, 1, 1,
0.5361904, 0.5790495, 1.026154, 0.3098039, 0, 1, 1,
0.5386995, 0.1237593, 0.2522313, 0.3137255, 0, 1, 1,
0.539143, 0.7032321, 2.434769, 0.3215686, 0, 1, 1,
0.5485358, -0.719319, 1.486607, 0.3254902, 0, 1, 1,
0.5498224, 2.317074, -1.100708, 0.3333333, 0, 1, 1,
0.5516732, 1.382166, -1.097199, 0.3372549, 0, 1, 1,
0.5559731, 0.7655982, 0.9404544, 0.345098, 0, 1, 1,
0.5580992, 1.925581, -0.5334096, 0.3490196, 0, 1, 1,
0.5595244, -1.408578, 3.599478, 0.3568628, 0, 1, 1,
0.5602365, -0.6637015, 3.551063, 0.3607843, 0, 1, 1,
0.5633367, -1.597242, 3.186457, 0.3686275, 0, 1, 1,
0.5641261, 0.4087913, 1.116417, 0.372549, 0, 1, 1,
0.5683761, -0.8700079, 2.115474, 0.3803922, 0, 1, 1,
0.5732986, -0.3219614, -0.2645305, 0.3843137, 0, 1, 1,
0.5792193, -0.2928994, 0.2936971, 0.3921569, 0, 1, 1,
0.581536, -0.07541557, 1.673909, 0.3960784, 0, 1, 1,
0.5895105, 1.074301, 0.05105661, 0.4039216, 0, 1, 1,
0.5909136, 0.3513854, 0.8536613, 0.4117647, 0, 1, 1,
0.5973178, -1.204151, 3.222744, 0.4156863, 0, 1, 1,
0.5976064, 0.6894245, -0.9700027, 0.4235294, 0, 1, 1,
0.6005911, -0.6111603, 1.384576, 0.427451, 0, 1, 1,
0.6033474, 0.5578523, -0.3977011, 0.4352941, 0, 1, 1,
0.6066129, 0.06971118, 1.133226, 0.4392157, 0, 1, 1,
0.6109341, -0.1933351, 0.5716466, 0.4470588, 0, 1, 1,
0.6123337, 0.1600059, 3.048865, 0.4509804, 0, 1, 1,
0.6170313, 0.8967263, -0.1816873, 0.4588235, 0, 1, 1,
0.6178079, 0.9972513, 0.3957425, 0.4627451, 0, 1, 1,
0.6200054, -0.2304708, 2.468982, 0.4705882, 0, 1, 1,
0.6200202, -0.2577585, 0.8585767, 0.4745098, 0, 1, 1,
0.6209248, 0.6366323, 2.417106, 0.4823529, 0, 1, 1,
0.6261739, 0.8254613, 1.168985, 0.4862745, 0, 1, 1,
0.62715, -0.4346368, 1.958334, 0.4941176, 0, 1, 1,
0.6350397, -0.004715997, 2.473584, 0.5019608, 0, 1, 1,
0.6367033, 0.3845745, 1.380797, 0.5058824, 0, 1, 1,
0.6367407, 2.059359, -1.241193, 0.5137255, 0, 1, 1,
0.6418145, -0.4063084, 1.896575, 0.5176471, 0, 1, 1,
0.6423161, 0.1150682, 1.843774, 0.5254902, 0, 1, 1,
0.6437224, 0.1578072, 2.048746, 0.5294118, 0, 1, 1,
0.6475826, 1.501198, 1.836546, 0.5372549, 0, 1, 1,
0.6519012, 1.990797, -1.255146, 0.5411765, 0, 1, 1,
0.6628987, 0.7755875, 1.24141, 0.5490196, 0, 1, 1,
0.6652676, -1.154202, 2.723988, 0.5529412, 0, 1, 1,
0.6677969, -0.7572786, 3.504001, 0.5607843, 0, 1, 1,
0.6700155, 0.8339705, -0.5285879, 0.5647059, 0, 1, 1,
0.6749163, 1.856893, -0.7249198, 0.572549, 0, 1, 1,
0.675982, -0.3436472, 3.456082, 0.5764706, 0, 1, 1,
0.68571, -0.06105848, 0.04914594, 0.5843138, 0, 1, 1,
0.6860258, 0.4504963, -0.4830455, 0.5882353, 0, 1, 1,
0.6921114, -0.5795393, 1.226584, 0.5960785, 0, 1, 1,
0.6926211, -0.9617407, 3.757204, 0.6039216, 0, 1, 1,
0.6961732, 0.4191906, 2.488722, 0.6078432, 0, 1, 1,
0.6973662, -0.005914568, 1.531695, 0.6156863, 0, 1, 1,
0.6997401, -0.5309172, 1.151172, 0.6196079, 0, 1, 1,
0.7042837, 0.1420051, 1.710483, 0.627451, 0, 1, 1,
0.7080734, 0.4673452, 1.279637, 0.6313726, 0, 1, 1,
0.7088792, 0.6223379, 0.864391, 0.6392157, 0, 1, 1,
0.7110344, 0.08977246, 1.969161, 0.6431373, 0, 1, 1,
0.7125341, -1.280779, 1.67173, 0.6509804, 0, 1, 1,
0.7132112, 0.8364469, -0.2600482, 0.654902, 0, 1, 1,
0.7156266, -0.8112403, 2.608696, 0.6627451, 0, 1, 1,
0.724633, 0.5998088, 0.1180626, 0.6666667, 0, 1, 1,
0.7271533, -0.6930161, 2.612668, 0.6745098, 0, 1, 1,
0.7292084, -0.1823004, 1.230229, 0.6784314, 0, 1, 1,
0.7320195, 0.1567625, 1.811048, 0.6862745, 0, 1, 1,
0.7321296, 0.6601735, 1.119266, 0.6901961, 0, 1, 1,
0.7351838, -0.3639936, 1.833364, 0.6980392, 0, 1, 1,
0.7353794, 1.323053, 2.808362, 0.7058824, 0, 1, 1,
0.7428794, -0.5952748, 3.251404, 0.7098039, 0, 1, 1,
0.7445837, 0.2683529, 0.5702628, 0.7176471, 0, 1, 1,
0.7529283, -1.251948, 3.572045, 0.7215686, 0, 1, 1,
0.7667786, 0.8858816, 0.1864154, 0.7294118, 0, 1, 1,
0.7716543, -0.4527927, 1.421972, 0.7333333, 0, 1, 1,
0.7730366, -0.8572831, 1.341821, 0.7411765, 0, 1, 1,
0.7736081, 0.9213388, -1.074216, 0.7450981, 0, 1, 1,
0.7747475, -0.0239852, 1.680177, 0.7529412, 0, 1, 1,
0.7754397, -0.2065286, 2.426221, 0.7568628, 0, 1, 1,
0.7782435, 0.6340964, 2.910233, 0.7647059, 0, 1, 1,
0.7800182, -0.04846529, 2.111702, 0.7686275, 0, 1, 1,
0.7837836, -1.8223, 2.157193, 0.7764706, 0, 1, 1,
0.7883831, 1.379309, -0.6743509, 0.7803922, 0, 1, 1,
0.7941679, 0.1128599, 0.1565382, 0.7882353, 0, 1, 1,
0.7992023, -0.1874361, 3.090255, 0.7921569, 0, 1, 1,
0.7997049, 0.03393855, 1.53487, 0.8, 0, 1, 1,
0.8008137, -0.760972, 2.609692, 0.8078431, 0, 1, 1,
0.8022287, -1.213282, 3.609273, 0.8117647, 0, 1, 1,
0.8097278, 0.8191288, 1.282505, 0.8196079, 0, 1, 1,
0.8116092, 0.8745314, 0.7312288, 0.8235294, 0, 1, 1,
0.8118679, 0.8610854, 1.355948, 0.8313726, 0, 1, 1,
0.8252295, -1.045841, 3.2606, 0.8352941, 0, 1, 1,
0.8273757, -0.4673145, 1.360108, 0.8431373, 0, 1, 1,
0.8370554, 0.1519184, 2.917381, 0.8470588, 0, 1, 1,
0.8436052, 0.9043468, 1.319738, 0.854902, 0, 1, 1,
0.8521749, -0.3208414, 0.1855884, 0.8588235, 0, 1, 1,
0.8527139, 0.7673411, 1.289524, 0.8666667, 0, 1, 1,
0.8535656, 0.1417527, 1.453615, 0.8705882, 0, 1, 1,
0.8564324, -1.276088, 1.941481, 0.8784314, 0, 1, 1,
0.8583797, -0.01765469, 1.74669, 0.8823529, 0, 1, 1,
0.8591023, -0.096967, 1.686978, 0.8901961, 0, 1, 1,
0.8597013, -0.03457154, 0.9724408, 0.8941177, 0, 1, 1,
0.8694409, 2.489042, 0.5215339, 0.9019608, 0, 1, 1,
0.8714302, -0.3785463, 2.485004, 0.9098039, 0, 1, 1,
0.8754442, -1.522719, 1.927584, 0.9137255, 0, 1, 1,
0.8766236, 0.5497686, 1.413754, 0.9215686, 0, 1, 1,
0.8774976, -0.609452, 2.879838, 0.9254902, 0, 1, 1,
0.8782091, 0.1251232, 3.337848, 0.9333333, 0, 1, 1,
0.8803418, -0.1062914, 3.185214, 0.9372549, 0, 1, 1,
0.8860767, 0.4169134, 1.355617, 0.945098, 0, 1, 1,
0.8877198, -2.019921, 2.866064, 0.9490196, 0, 1, 1,
0.8898251, -0.4723672, 2.005866, 0.9568627, 0, 1, 1,
0.8898417, -0.2219709, 4.051151, 0.9607843, 0, 1, 1,
0.8900474, 1.277129, 0.1519137, 0.9686275, 0, 1, 1,
0.8931433, 0.243838, 1.427576, 0.972549, 0, 1, 1,
0.8934991, 1.679601, 0.257293, 0.9803922, 0, 1, 1,
0.896044, -0.4527042, 2.027806, 0.9843137, 0, 1, 1,
0.8985742, -1.041358, 1.049146, 0.9921569, 0, 1, 1,
0.8994836, 0.1964914, 0.33394, 0.9960784, 0, 1, 1,
0.9040648, 0.8315675, 1.791812, 1, 0, 0.9960784, 1,
0.9080042, -2.207772, 3.916315, 1, 0, 0.9882353, 1,
0.9082891, 0.3433293, 1.191109, 1, 0, 0.9843137, 1,
0.9231402, 0.7348497, 0.4465105, 1, 0, 0.9764706, 1,
0.9232263, -0.175584, 1.49035, 1, 0, 0.972549, 1,
0.9246056, -0.2576433, 2.685663, 1, 0, 0.9647059, 1,
0.9449973, -2.192929, 1.823136, 1, 0, 0.9607843, 1,
0.9475868, 1.512125, -0.7912291, 1, 0, 0.9529412, 1,
0.9490352, -0.2514466, 1.642598, 1, 0, 0.9490196, 1,
0.9498952, -0.7661703, 1.936959, 1, 0, 0.9411765, 1,
0.9502453, 0.04154146, 1.412413, 1, 0, 0.9372549, 1,
0.9575659, 0.8855752, -0.2517006, 1, 0, 0.9294118, 1,
0.9593815, 1.275651, -0.6678283, 1, 0, 0.9254902, 1,
0.9599015, -1.427723, 3.877161, 1, 0, 0.9176471, 1,
0.9602471, -1.291286, 2.171834, 1, 0, 0.9137255, 1,
0.9640864, 0.06399032, 0.8669503, 1, 0, 0.9058824, 1,
0.977229, 0.003618618, 2.404792, 1, 0, 0.9019608, 1,
0.9774652, -0.9772948, 2.763048, 1, 0, 0.8941177, 1,
0.9871469, -0.9400775, 1.142387, 1, 0, 0.8862745, 1,
0.9890529, -0.03851077, 1.490419, 1, 0, 0.8823529, 1,
1.0026, 0.05191918, 0.9370057, 1, 0, 0.8745098, 1,
1.021869, -0.03239429, 0.6409017, 1, 0, 0.8705882, 1,
1.029042, 1.21048, -0.9678196, 1, 0, 0.8627451, 1,
1.030773, 0.5077399, 0.1039292, 1, 0, 0.8588235, 1,
1.031288, 0.3283578, 2.509374, 1, 0, 0.8509804, 1,
1.036272, 0.5514854, -0.1188435, 1, 0, 0.8470588, 1,
1.039913, -0.1600558, 1.565728, 1, 0, 0.8392157, 1,
1.046356, 2.651506, 1.361602, 1, 0, 0.8352941, 1,
1.049715, -0.4121508, 1.906596, 1, 0, 0.827451, 1,
1.055279, 0.1974243, 2.251353, 1, 0, 0.8235294, 1,
1.058321, 1.155239, 0.4143619, 1, 0, 0.8156863, 1,
1.058642, -0.2123453, 1.309451, 1, 0, 0.8117647, 1,
1.067119, 1.457205, 1.811273, 1, 0, 0.8039216, 1,
1.082234, -2.309748, 3.432855, 1, 0, 0.7960784, 1,
1.089807, 1.017558, -0.4104255, 1, 0, 0.7921569, 1,
1.093969, 0.6421027, 1.670418, 1, 0, 0.7843137, 1,
1.09653, -0.5038002, 2.533634, 1, 0, 0.7803922, 1,
1.101199, -0.3004358, 0.09628654, 1, 0, 0.772549, 1,
1.108095, -0.4933718, 2.37175, 1, 0, 0.7686275, 1,
1.110019, 0.6912834, 0.5833076, 1, 0, 0.7607843, 1,
1.110421, -0.6042293, 0.6794587, 1, 0, 0.7568628, 1,
1.118127, 0.7381108, 1.0768, 1, 0, 0.7490196, 1,
1.119563, 0.1006631, 0.7252546, 1, 0, 0.7450981, 1,
1.124571, 0.1345682, 1.864974, 1, 0, 0.7372549, 1,
1.127245, 1.709206, 0.4363446, 1, 0, 0.7333333, 1,
1.129848, 2.556611, 2.443308, 1, 0, 0.7254902, 1,
1.13141, -1.682288, 1.14187, 1, 0, 0.7215686, 1,
1.131838, 0.2257886, 0.5352342, 1, 0, 0.7137255, 1,
1.133022, -0.05196137, 0.91316, 1, 0, 0.7098039, 1,
1.138241, 0.017688, 2.756076, 1, 0, 0.7019608, 1,
1.149058, 0.09824187, 1.275295, 1, 0, 0.6941177, 1,
1.160077, 0.8391826, -1.362635, 1, 0, 0.6901961, 1,
1.160486, -1.66713, 2.556782, 1, 0, 0.682353, 1,
1.167658, -1.74806, 2.451348, 1, 0, 0.6784314, 1,
1.185743, -0.8567616, 0.7141587, 1, 0, 0.6705883, 1,
1.187959, -0.09740859, 2.389089, 1, 0, 0.6666667, 1,
1.190599, 0.9512248, 0.9803863, 1, 0, 0.6588235, 1,
1.191273, 0.2920664, 2.301291, 1, 0, 0.654902, 1,
1.194734, -0.106871, 2.439086, 1, 0, 0.6470588, 1,
1.195003, -0.5970949, 0.9705136, 1, 0, 0.6431373, 1,
1.201938, 0.3680013, 2.97774, 1, 0, 0.6352941, 1,
1.210463, -0.6860889, 2.623663, 1, 0, 0.6313726, 1,
1.210973, -0.01238985, 2.389951, 1, 0, 0.6235294, 1,
1.21143, -0.8609961, 2.460874, 1, 0, 0.6196079, 1,
1.217909, -1.792974, 2.735588, 1, 0, 0.6117647, 1,
1.2183, 2.907771, -1.377763, 1, 0, 0.6078432, 1,
1.220268, -1.583224, 2.659549, 1, 0, 0.6, 1,
1.229961, 0.6445231, -0.04441832, 1, 0, 0.5921569, 1,
1.232805, -0.5836146, 1.327216, 1, 0, 0.5882353, 1,
1.233008, 0.7169735, 0.6684868, 1, 0, 0.5803922, 1,
1.235252, 0.08656762, 0.9666193, 1, 0, 0.5764706, 1,
1.242042, 0.811222, 0.1462093, 1, 0, 0.5686275, 1,
1.242672, -0.999616, 2.097679, 1, 0, 0.5647059, 1,
1.247385, -0.76747, 2.154128, 1, 0, 0.5568628, 1,
1.249722, 0.7512932, 0.3782229, 1, 0, 0.5529412, 1,
1.261434, 1.381286, 1.109999, 1, 0, 0.5450981, 1,
1.26546, -0.7053598, 3.226629, 1, 0, 0.5411765, 1,
1.283033, 0.2382526, 1.505958, 1, 0, 0.5333334, 1,
1.283984, 0.7313513, 0.7277821, 1, 0, 0.5294118, 1,
1.287831, -1.41293, 2.006604, 1, 0, 0.5215687, 1,
1.309785, 0.6037125, 1.988563, 1, 0, 0.5176471, 1,
1.313434, -0.3042694, 1.723743, 1, 0, 0.509804, 1,
1.316161, 0.7320075, 3.013855, 1, 0, 0.5058824, 1,
1.323154, -1.511554, 2.60691, 1, 0, 0.4980392, 1,
1.331846, 0.2561191, 2.584625, 1, 0, 0.4901961, 1,
1.340535, -0.5175408, 2.285619, 1, 0, 0.4862745, 1,
1.347051, -2.279521, 4.129993, 1, 0, 0.4784314, 1,
1.370157, 0.7093903, 0.4486691, 1, 0, 0.4745098, 1,
1.370913, 0.0997434, 1.72226, 1, 0, 0.4666667, 1,
1.372975, 3.104517, 0.2842652, 1, 0, 0.4627451, 1,
1.379899, 1.575881, 0.07377789, 1, 0, 0.454902, 1,
1.383959, -0.5603347, 1.457705, 1, 0, 0.4509804, 1,
1.384277, -1.418597, 1.159896, 1, 0, 0.4431373, 1,
1.408298, 0.05285253, 2.547138, 1, 0, 0.4392157, 1,
1.431348, -0.9520735, 2.204625, 1, 0, 0.4313726, 1,
1.434387, -0.06134924, 0.5628585, 1, 0, 0.427451, 1,
1.434832, 0.1314855, 1.038512, 1, 0, 0.4196078, 1,
1.448007, -0.8695082, 1.505726, 1, 0, 0.4156863, 1,
1.448303, 0.02120098, 0.7411797, 1, 0, 0.4078431, 1,
1.450827, -0.09067239, 2.86677, 1, 0, 0.4039216, 1,
1.454927, -0.4116385, 2.101747, 1, 0, 0.3960784, 1,
1.455851, -0.05357349, 3.62517, 1, 0, 0.3882353, 1,
1.4647, 2.10569, 0.1446782, 1, 0, 0.3843137, 1,
1.498929, -0.3068168, 2.716857, 1, 0, 0.3764706, 1,
1.503777, 0.4128475, 4.853391, 1, 0, 0.372549, 1,
1.513509, 1.408392, 0.8764342, 1, 0, 0.3647059, 1,
1.513837, -0.5899873, 2.202351, 1, 0, 0.3607843, 1,
1.516424, -0.4391362, 1.619959, 1, 0, 0.3529412, 1,
1.525476, -2.828202, 1.880337, 1, 0, 0.3490196, 1,
1.538411, -0.1034235, 2.634705, 1, 0, 0.3411765, 1,
1.53987, -1.373996, 2.751941, 1, 0, 0.3372549, 1,
1.541218, 0.8350443, 1.923588, 1, 0, 0.3294118, 1,
1.543667, 0.7611231, 0.1611622, 1, 0, 0.3254902, 1,
1.565298, 0.04078216, -0.113945, 1, 0, 0.3176471, 1,
1.579204, 0.7123672, 1.438404, 1, 0, 0.3137255, 1,
1.582131, 0.9193512, 0.311866, 1, 0, 0.3058824, 1,
1.605207, -1.2991, 2.854014, 1, 0, 0.2980392, 1,
1.631181, -0.1972443, 2.009361, 1, 0, 0.2941177, 1,
1.639239, -0.767876, 2.190035, 1, 0, 0.2862745, 1,
1.646975, 1.899255, 0.5924332, 1, 0, 0.282353, 1,
1.681591, -0.001275314, 1.698988, 1, 0, 0.2745098, 1,
1.713417, -0.7073909, 1.749539, 1, 0, 0.2705882, 1,
1.713618, -0.3685197, 2.208082, 1, 0, 0.2627451, 1,
1.722577, -1.748089, 2.460531, 1, 0, 0.2588235, 1,
1.730497, -0.4387655, 0.49387, 1, 0, 0.2509804, 1,
1.753049, -0.1392168, 0.3866063, 1, 0, 0.2470588, 1,
1.759823, 1.038247, 1.256106, 1, 0, 0.2392157, 1,
1.766277, -2.073667, 0.002905281, 1, 0, 0.2352941, 1,
1.772741, 0.1514851, 1.102278, 1, 0, 0.227451, 1,
1.779448, -0.4876525, 3.731155, 1, 0, 0.2235294, 1,
1.780007, 1.34425, 1.916763, 1, 0, 0.2156863, 1,
1.78604, -0.3468795, 1.847953, 1, 0, 0.2117647, 1,
1.813369, 0.2003796, 0.6255849, 1, 0, 0.2039216, 1,
1.819699, -1.161191, 2.711389, 1, 0, 0.1960784, 1,
1.825009, 1.788059, 3.705597, 1, 0, 0.1921569, 1,
1.833529, -0.9517746, 2.628919, 1, 0, 0.1843137, 1,
1.835018, 1.043373, 1.118218, 1, 0, 0.1803922, 1,
1.835272, -0.01027371, 0.6896366, 1, 0, 0.172549, 1,
1.841344, 0.3873753, 0.8008305, 1, 0, 0.1686275, 1,
1.867018, -0.5632144, 1.851058, 1, 0, 0.1607843, 1,
1.874438, -0.8940144, 1.990064, 1, 0, 0.1568628, 1,
1.877144, 0.7036825, 2.784359, 1, 0, 0.1490196, 1,
1.884002, 0.6052465, 1.020755, 1, 0, 0.145098, 1,
1.909794, -0.6051326, 1.928778, 1, 0, 0.1372549, 1,
1.914438, 1.063682, 0.5803941, 1, 0, 0.1333333, 1,
1.940388, -1.727875, 1.931693, 1, 0, 0.1254902, 1,
1.9749, -1.013175, 3.151523, 1, 0, 0.1215686, 1,
1.975882, 1.073327, -0.9162115, 1, 0, 0.1137255, 1,
1.978199, 0.3138267, 2.899738, 1, 0, 0.1098039, 1,
1.993277, -0.8591549, 2.506532, 1, 0, 0.1019608, 1,
1.997365, -0.7332801, 2.400704, 1, 0, 0.09411765, 1,
2.021225, 0.704859, -0.06071614, 1, 0, 0.09019608, 1,
2.021989, 0.09648477, 2.244214, 1, 0, 0.08235294, 1,
2.025933, -0.4450293, 1.213309, 1, 0, 0.07843138, 1,
2.045382, -0.2300072, 2.212958, 1, 0, 0.07058824, 1,
2.074151, -0.6532104, 1.966, 1, 0, 0.06666667, 1,
2.080513, 1.379519, 1.391806, 1, 0, 0.05882353, 1,
2.145849, -0.04417066, 2.95151, 1, 0, 0.05490196, 1,
2.176608, -0.5934533, 1.517271, 1, 0, 0.04705882, 1,
2.186089, 0.08097505, 1.072156, 1, 0, 0.04313726, 1,
2.211382, -0.1565011, 2.063371, 1, 0, 0.03529412, 1,
2.283416, -0.5399698, 1.986986, 1, 0, 0.03137255, 1,
2.695202, -0.5719752, 1.257083, 1, 0, 0.02352941, 1,
2.710282, 2.828269, 0.1133418, 1, 0, 0.01960784, 1,
3.128124, 0.9287967, 2.102139, 1, 0, 0.01176471, 1,
3.429742, 1.07839, 0.1212456, 1, 0, 0.007843138, 1
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
0.02363694, -4.33093, -7.670092, 0, -0.5, 0.5, 0.5,
0.02363694, -4.33093, -7.670092, 1, -0.5, 0.5, 0.5,
0.02363694, -4.33093, -7.670092, 1, 1.5, 0.5, 0.5,
0.02363694, -4.33093, -7.670092, 0, 1.5, 0.5, 0.5
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
-4.537138, -0.07438266, -7.670092, 0, -0.5, 0.5, 0.5,
-4.537138, -0.07438266, -7.670092, 1, -0.5, 0.5, 0.5,
-4.537138, -0.07438266, -7.670092, 1, 1.5, 0.5, 0.5,
-4.537138, -0.07438266, -7.670092, 0, 1.5, 0.5, 0.5
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
-4.537138, -4.33093, -0.1862159, 0, -0.5, 0.5, 0.5,
-4.537138, -4.33093, -0.1862159, 1, -0.5, 0.5, 0.5,
-4.537138, -4.33093, -0.1862159, 1, 1.5, 0.5, 0.5,
-4.537138, -4.33093, -0.1862159, 0, 1.5, 0.5, 0.5
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
-3, -3.34865, -5.943044,
3, -3.34865, -5.943044,
-3, -3.34865, -5.943044,
-3, -3.512363, -6.230885,
-2, -3.34865, -5.943044,
-2, -3.512363, -6.230885,
-1, -3.34865, -5.943044,
-1, -3.512363, -6.230885,
0, -3.34865, -5.943044,
0, -3.512363, -6.230885,
1, -3.34865, -5.943044,
1, -3.512363, -6.230885,
2, -3.34865, -5.943044,
2, -3.512363, -6.230885,
3, -3.34865, -5.943044,
3, -3.512363, -6.230885
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
-3, -3.83979, -6.806568, 0, -0.5, 0.5, 0.5,
-3, -3.83979, -6.806568, 1, -0.5, 0.5, 0.5,
-3, -3.83979, -6.806568, 1, 1.5, 0.5, 0.5,
-3, -3.83979, -6.806568, 0, 1.5, 0.5, 0.5,
-2, -3.83979, -6.806568, 0, -0.5, 0.5, 0.5,
-2, -3.83979, -6.806568, 1, -0.5, 0.5, 0.5,
-2, -3.83979, -6.806568, 1, 1.5, 0.5, 0.5,
-2, -3.83979, -6.806568, 0, 1.5, 0.5, 0.5,
-1, -3.83979, -6.806568, 0, -0.5, 0.5, 0.5,
-1, -3.83979, -6.806568, 1, -0.5, 0.5, 0.5,
-1, -3.83979, -6.806568, 1, 1.5, 0.5, 0.5,
-1, -3.83979, -6.806568, 0, 1.5, 0.5, 0.5,
0, -3.83979, -6.806568, 0, -0.5, 0.5, 0.5,
0, -3.83979, -6.806568, 1, -0.5, 0.5, 0.5,
0, -3.83979, -6.806568, 1, 1.5, 0.5, 0.5,
0, -3.83979, -6.806568, 0, 1.5, 0.5, 0.5,
1, -3.83979, -6.806568, 0, -0.5, 0.5, 0.5,
1, -3.83979, -6.806568, 1, -0.5, 0.5, 0.5,
1, -3.83979, -6.806568, 1, 1.5, 0.5, 0.5,
1, -3.83979, -6.806568, 0, 1.5, 0.5, 0.5,
2, -3.83979, -6.806568, 0, -0.5, 0.5, 0.5,
2, -3.83979, -6.806568, 1, -0.5, 0.5, 0.5,
2, -3.83979, -6.806568, 1, 1.5, 0.5, 0.5,
2, -3.83979, -6.806568, 0, 1.5, 0.5, 0.5,
3, -3.83979, -6.806568, 0, -0.5, 0.5, 0.5,
3, -3.83979, -6.806568, 1, -0.5, 0.5, 0.5,
3, -3.83979, -6.806568, 1, 1.5, 0.5, 0.5,
3, -3.83979, -6.806568, 0, 1.5, 0.5, 0.5
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
-3.484652, -3, -5.943044,
-3.484652, 3, -5.943044,
-3.484652, -3, -5.943044,
-3.660066, -3, -6.230885,
-3.484652, -2, -5.943044,
-3.660066, -2, -6.230885,
-3.484652, -1, -5.943044,
-3.660066, -1, -6.230885,
-3.484652, 0, -5.943044,
-3.660066, 0, -6.230885,
-3.484652, 1, -5.943044,
-3.660066, 1, -6.230885,
-3.484652, 2, -5.943044,
-3.660066, 2, -6.230885,
-3.484652, 3, -5.943044,
-3.660066, 3, -6.230885
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
-4.010895, -3, -6.806568, 0, -0.5, 0.5, 0.5,
-4.010895, -3, -6.806568, 1, -0.5, 0.5, 0.5,
-4.010895, -3, -6.806568, 1, 1.5, 0.5, 0.5,
-4.010895, -3, -6.806568, 0, 1.5, 0.5, 0.5,
-4.010895, -2, -6.806568, 0, -0.5, 0.5, 0.5,
-4.010895, -2, -6.806568, 1, -0.5, 0.5, 0.5,
-4.010895, -2, -6.806568, 1, 1.5, 0.5, 0.5,
-4.010895, -2, -6.806568, 0, 1.5, 0.5, 0.5,
-4.010895, -1, -6.806568, 0, -0.5, 0.5, 0.5,
-4.010895, -1, -6.806568, 1, -0.5, 0.5, 0.5,
-4.010895, -1, -6.806568, 1, 1.5, 0.5, 0.5,
-4.010895, -1, -6.806568, 0, 1.5, 0.5, 0.5,
-4.010895, 0, -6.806568, 0, -0.5, 0.5, 0.5,
-4.010895, 0, -6.806568, 1, -0.5, 0.5, 0.5,
-4.010895, 0, -6.806568, 1, 1.5, 0.5, 0.5,
-4.010895, 0, -6.806568, 0, 1.5, 0.5, 0.5,
-4.010895, 1, -6.806568, 0, -0.5, 0.5, 0.5,
-4.010895, 1, -6.806568, 1, -0.5, 0.5, 0.5,
-4.010895, 1, -6.806568, 1, 1.5, 0.5, 0.5,
-4.010895, 1, -6.806568, 0, 1.5, 0.5, 0.5,
-4.010895, 2, -6.806568, 0, -0.5, 0.5, 0.5,
-4.010895, 2, -6.806568, 1, -0.5, 0.5, 0.5,
-4.010895, 2, -6.806568, 1, 1.5, 0.5, 0.5,
-4.010895, 2, -6.806568, 0, 1.5, 0.5, 0.5,
-4.010895, 3, -6.806568, 0, -0.5, 0.5, 0.5,
-4.010895, 3, -6.806568, 1, -0.5, 0.5, 0.5,
-4.010895, 3, -6.806568, 1, 1.5, 0.5, 0.5,
-4.010895, 3, -6.806568, 0, 1.5, 0.5, 0.5
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
-3.484652, -3.34865, -4,
-3.484652, -3.34865, 4,
-3.484652, -3.34865, -4,
-3.660066, -3.512363, -4,
-3.484652, -3.34865, -2,
-3.660066, -3.512363, -2,
-3.484652, -3.34865, 0,
-3.660066, -3.512363, 0,
-3.484652, -3.34865, 2,
-3.660066, -3.512363, 2,
-3.484652, -3.34865, 4,
-3.660066, -3.512363, 4
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
-4.010895, -3.83979, -4, 0, -0.5, 0.5, 0.5,
-4.010895, -3.83979, -4, 1, -0.5, 0.5, 0.5,
-4.010895, -3.83979, -4, 1, 1.5, 0.5, 0.5,
-4.010895, -3.83979, -4, 0, 1.5, 0.5, 0.5,
-4.010895, -3.83979, -2, 0, -0.5, 0.5, 0.5,
-4.010895, -3.83979, -2, 1, -0.5, 0.5, 0.5,
-4.010895, -3.83979, -2, 1, 1.5, 0.5, 0.5,
-4.010895, -3.83979, -2, 0, 1.5, 0.5, 0.5,
-4.010895, -3.83979, 0, 0, -0.5, 0.5, 0.5,
-4.010895, -3.83979, 0, 1, -0.5, 0.5, 0.5,
-4.010895, -3.83979, 0, 1, 1.5, 0.5, 0.5,
-4.010895, -3.83979, 0, 0, 1.5, 0.5, 0.5,
-4.010895, -3.83979, 2, 0, -0.5, 0.5, 0.5,
-4.010895, -3.83979, 2, 1, -0.5, 0.5, 0.5,
-4.010895, -3.83979, 2, 1, 1.5, 0.5, 0.5,
-4.010895, -3.83979, 2, 0, 1.5, 0.5, 0.5,
-4.010895, -3.83979, 4, 0, -0.5, 0.5, 0.5,
-4.010895, -3.83979, 4, 1, -0.5, 0.5, 0.5,
-4.010895, -3.83979, 4, 1, 1.5, 0.5, 0.5,
-4.010895, -3.83979, 4, 0, 1.5, 0.5, 0.5
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
-3.484652, -3.34865, -5.943044,
-3.484652, 3.199884, -5.943044,
-3.484652, -3.34865, 5.570612,
-3.484652, 3.199884, 5.570612,
-3.484652, -3.34865, -5.943044,
-3.484652, -3.34865, 5.570612,
-3.484652, 3.199884, -5.943044,
-3.484652, 3.199884, 5.570612,
-3.484652, -3.34865, -5.943044,
3.531925, -3.34865, -5.943044,
-3.484652, -3.34865, 5.570612,
3.531925, -3.34865, 5.570612,
-3.484652, 3.199884, -5.943044,
3.531925, 3.199884, -5.943044,
-3.484652, 3.199884, 5.570612,
3.531925, 3.199884, 5.570612,
3.531925, -3.34865, -5.943044,
3.531925, 3.199884, -5.943044,
3.531925, -3.34865, 5.570612,
3.531925, 3.199884, 5.570612,
3.531925, -3.34865, -5.943044,
3.531925, -3.34865, 5.570612,
3.531925, 3.199884, -5.943044,
3.531925, 3.199884, 5.570612
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
var radius = 8.004009;
var distance = 35.61074;
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
mvMatrix.translate( -0.02363694, 0.07438266, 0.1862159 );
mvMatrix.scale( 1.233378, 1.321531, 0.7516372 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.61074);
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
prothiofos<-read.table("prothiofos.xyz")
```

```
## Error in read.table("prothiofos.xyz"): no lines available in input
```

```r
x<-prothiofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'prothiofos' not found
```

```r
y<-prothiofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'prothiofos' not found
```

```r
z<-prothiofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'prothiofos' not found
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
-3.382468, -0.2584745, -1.701176, 0, 0, 1, 1, 1,
-2.956867, -0.8930701, -2.727592, 1, 0, 0, 1, 1,
-2.934115, -0.516908, -1.561639, 1, 0, 0, 1, 1,
-2.860699, -0.3849305, -1.466286, 1, 0, 0, 1, 1,
-2.81877, 1.421294, -1.677771, 1, 0, 0, 1, 1,
-2.811268, 0.588807, -0.09864113, 1, 0, 0, 1, 1,
-2.701334, -1.189931, -0.5813209, 0, 0, 0, 1, 1,
-2.645716, -1.027417, -1.865793, 0, 0, 0, 1, 1,
-2.559537, 0.6400172, 0.2651559, 0, 0, 0, 1, 1,
-2.545053, -0.9130656, -2.208891, 0, 0, 0, 1, 1,
-2.483042, 0.8687295, -1.547462, 0, 0, 0, 1, 1,
-2.478831, -1.259523, -3.159209, 0, 0, 0, 1, 1,
-2.430415, 0.8675783, -0.9136946, 0, 0, 0, 1, 1,
-2.414323, -0.8412427, -1.654781, 1, 1, 1, 1, 1,
-2.31401, -0.9457744, -2.573472, 1, 1, 1, 1, 1,
-2.297937, -0.05994868, -1.082384, 1, 1, 1, 1, 1,
-2.214901, -0.5334728, -0.6032984, 1, 1, 1, 1, 1,
-2.188577, -1.961652, -3.852559, 1, 1, 1, 1, 1,
-2.185988, 1.661976, -0.46299, 1, 1, 1, 1, 1,
-2.181355, -3.253283, -3.077117, 1, 1, 1, 1, 1,
-2.176105, -0.4262813, -1.918729, 1, 1, 1, 1, 1,
-2.167878, 0.6441422, -1.480709, 1, 1, 1, 1, 1,
-2.119977, -0.3146324, -0.7036667, 1, 1, 1, 1, 1,
-2.114984, 1.119202, -0.7366335, 1, 1, 1, 1, 1,
-2.06446, 0.03144954, -0.1929399, 1, 1, 1, 1, 1,
-2.014439, -2.285825, -2.804211, 1, 1, 1, 1, 1,
-2.013894, 0.332703, -0.8123285, 1, 1, 1, 1, 1,
-2.011238, -1.352537, -2.238537, 1, 1, 1, 1, 1,
-1.993918, 1.930312, 0.3560851, 0, 0, 1, 1, 1,
-1.941893, -0.9151004, -1.169438, 1, 0, 0, 1, 1,
-1.933361, -1.525654, -1.713242, 1, 0, 0, 1, 1,
-1.924765, 0.175878, -2.63641, 1, 0, 0, 1, 1,
-1.919338, 0.07444479, -1.379125, 1, 0, 0, 1, 1,
-1.914966, 2.703867, -0.3649046, 1, 0, 0, 1, 1,
-1.911154, -0.432296, -0.957405, 0, 0, 0, 1, 1,
-1.858084, -1.671816, -0.9545221, 0, 0, 0, 1, 1,
-1.843648, 1.384669, -1.976346, 0, 0, 0, 1, 1,
-1.805702, 1.451248, -2.043419, 0, 0, 0, 1, 1,
-1.802696, -1.743705, -0.3649905, 0, 0, 0, 1, 1,
-1.786367, -0.7229853, -2.860002, 0, 0, 0, 1, 1,
-1.777436, 0.8140948, 0.7300615, 0, 0, 0, 1, 1,
-1.776638, 2.248624, -1.167491, 1, 1, 1, 1, 1,
-1.747641, -1.466332, -2.21898, 1, 1, 1, 1, 1,
-1.734509, -0.5809999, -1.787259, 1, 1, 1, 1, 1,
-1.706632, -1.239002, -1.71536, 1, 1, 1, 1, 1,
-1.680397, 1.227076, 0.6674283, 1, 1, 1, 1, 1,
-1.67084, -0.1802083, -2.261927, 1, 1, 1, 1, 1,
-1.669853, -0.8224165, -2.811074, 1, 1, 1, 1, 1,
-1.653082, -0.959006, -1.833741, 1, 1, 1, 1, 1,
-1.648538, -0.9574006, -2.024073, 1, 1, 1, 1, 1,
-1.646202, 0.2196095, -2.210257, 1, 1, 1, 1, 1,
-1.643101, 0.6858044, -2.708946, 1, 1, 1, 1, 1,
-1.630084, -1.343271, -2.243869, 1, 1, 1, 1, 1,
-1.621349, 0.1166715, -3.406687, 1, 1, 1, 1, 1,
-1.618311, -1.204499, -2.041975, 1, 1, 1, 1, 1,
-1.591764, -0.8932247, -1.513672, 1, 1, 1, 1, 1,
-1.579345, -0.3205139, -0.1789789, 0, 0, 1, 1, 1,
-1.57909, 0.4927697, -0.8852881, 1, 0, 0, 1, 1,
-1.565599, 1.182331, -1.499139, 1, 0, 0, 1, 1,
-1.549893, 1.283332, -1.948134, 1, 0, 0, 1, 1,
-1.541623, -0.1295751, -2.331768, 1, 0, 0, 1, 1,
-1.538039, 0.7221854, -1.581121, 1, 0, 0, 1, 1,
-1.535845, -0.2110402, -2.702508, 0, 0, 0, 1, 1,
-1.525383, 0.1835382, -1.991051, 0, 0, 0, 1, 1,
-1.513055, -1.445284, -2.137771, 0, 0, 0, 1, 1,
-1.504752, 0.7910299, 0.5687684, 0, 0, 0, 1, 1,
-1.499669, -1.039969, -0.417049, 0, 0, 0, 1, 1,
-1.481263, -0.09854738, -2.076064, 0, 0, 0, 1, 1,
-1.478849, -0.6886116, -1.931521, 0, 0, 0, 1, 1,
-1.476243, -1.125549, -1.244886, 1, 1, 1, 1, 1,
-1.473441, -0.1895613, -1.569331, 1, 1, 1, 1, 1,
-1.469203, 0.7214419, -3.10672, 1, 1, 1, 1, 1,
-1.45877, 0.4702246, -2.355339, 1, 1, 1, 1, 1,
-1.44541, 2.265734, 1.477843, 1, 1, 1, 1, 1,
-1.43622, -0.7025443, -3.213021, 1, 1, 1, 1, 1,
-1.427564, 0.7075366, -1.165138, 1, 1, 1, 1, 1,
-1.418235, 0.008061591, -1.975392, 1, 1, 1, 1, 1,
-1.38215, 1.10676, -0.9929662, 1, 1, 1, 1, 1,
-1.375691, 0.009275218, -2.196666, 1, 1, 1, 1, 1,
-1.370615, 0.6011378, -3.725358, 1, 1, 1, 1, 1,
-1.365962, 1.306003, -2.066588, 1, 1, 1, 1, 1,
-1.364275, 1.115089, -0.9649239, 1, 1, 1, 1, 1,
-1.358086, -0.5040235, -3.296691, 1, 1, 1, 1, 1,
-1.352896, 1.124808, -1.250738, 1, 1, 1, 1, 1,
-1.337634, -0.1058581, -2.610999, 0, 0, 1, 1, 1,
-1.336104, -0.8839363, -3.552526, 1, 0, 0, 1, 1,
-1.326743, 0.3853432, -0.06569841, 1, 0, 0, 1, 1,
-1.316101, -0.3136619, -3.460695, 1, 0, 0, 1, 1,
-1.315559, 0.5317049, -0.7677892, 1, 0, 0, 1, 1,
-1.30856, -0.06066, -2.892519, 1, 0, 0, 1, 1,
-1.308409, -1.32636, -0.7259889, 0, 0, 0, 1, 1,
-1.306157, -0.5923082, -1.434947, 0, 0, 0, 1, 1,
-1.288697, -0.8700025, -2.229615, 0, 0, 0, 1, 1,
-1.281955, 0.1544174, -0.2051238, 0, 0, 0, 1, 1,
-1.272131, -1.51503, -2.224562, 0, 0, 0, 1, 1,
-1.252105, -0.7859675, -1.679444, 0, 0, 0, 1, 1,
-1.251518, 0.285304, -1.848851, 0, 0, 0, 1, 1,
-1.251, 1.036111, -2.1261, 1, 1, 1, 1, 1,
-1.230784, -0.07227254, 0.8870302, 1, 1, 1, 1, 1,
-1.224946, 0.1887677, 0.7144544, 1, 1, 1, 1, 1,
-1.218724, -0.608012, -2.589545, 1, 1, 1, 1, 1,
-1.217802, -1.855499, -4.081127, 1, 1, 1, 1, 1,
-1.217386, -0.008520165, -1.37565, 1, 1, 1, 1, 1,
-1.216886, 0.2881916, -2.209304, 1, 1, 1, 1, 1,
-1.215595, 0.1891337, -1.647824, 1, 1, 1, 1, 1,
-1.213259, -0.04920204, -1.998427, 1, 1, 1, 1, 1,
-1.209975, -0.9791988, -1.812865, 1, 1, 1, 1, 1,
-1.207981, 0.2446029, -2.43393, 1, 1, 1, 1, 1,
-1.207109, -1.435115, -3.399978, 1, 1, 1, 1, 1,
-1.19348, -0.2414638, -0.8120003, 1, 1, 1, 1, 1,
-1.181089, 0.7385041, -1.536509, 1, 1, 1, 1, 1,
-1.179401, -0.3190406, -0.5481031, 1, 1, 1, 1, 1,
-1.1762, 1.113559, 0.1574797, 0, 0, 1, 1, 1,
-1.170618, 0.1969022, -0.7090569, 1, 0, 0, 1, 1,
-1.166917, 0.5225199, 0.5384779, 1, 0, 0, 1, 1,
-1.166028, -0.960795, -2.049181, 1, 0, 0, 1, 1,
-1.164693, 0.07341264, -1.833995, 1, 0, 0, 1, 1,
-1.149487, -2.028662, -2.631057, 1, 0, 0, 1, 1,
-1.138456, 0.3182237, -1.374594, 0, 0, 0, 1, 1,
-1.137008, -0.1865057, -1.656296, 0, 0, 0, 1, 1,
-1.129723, -0.5962565, -1.72398, 0, 0, 0, 1, 1,
-1.127005, -0.4808517, -1.517869, 0, 0, 0, 1, 1,
-1.124082, 0.8699758, -1.097828, 0, 0, 0, 1, 1,
-1.118897, -0.1868401, -3.915081, 0, 0, 0, 1, 1,
-1.114824, -0.139296, -2.690157, 0, 0, 0, 1, 1,
-1.10672, 1.136667, -1.137993, 1, 1, 1, 1, 1,
-1.106564, -0.3804061, -1.183809, 1, 1, 1, 1, 1,
-1.104964, 1.604883, -1.734838, 1, 1, 1, 1, 1,
-1.09758, 0.7839137, -0.6660001, 1, 1, 1, 1, 1,
-1.083336, 0.1967019, -1.546417, 1, 1, 1, 1, 1,
-1.08122, -1.268776, -2.25715, 1, 1, 1, 1, 1,
-1.061549, -0.1294057, -2.805021, 1, 1, 1, 1, 1,
-1.056204, 0.7848535, -1.149155, 1, 1, 1, 1, 1,
-1.053123, 0.009443766, -0.5762358, 1, 1, 1, 1, 1,
-1.048091, 2.547542, -1.193032, 1, 1, 1, 1, 1,
-1.043415, -1.690171, -3.418679, 1, 1, 1, 1, 1,
-1.040952, -0.0440595, -0.8914241, 1, 1, 1, 1, 1,
-1.03538, 0.7781488, -2.571295, 1, 1, 1, 1, 1,
-1.033471, 1.127953, 0.284796, 1, 1, 1, 1, 1,
-1.021325, 0.6288975, -2.08655, 1, 1, 1, 1, 1,
-1.019107, -1.036094, -1.662273, 0, 0, 1, 1, 1,
-1.018551, 0.1223384, -1.807617, 1, 0, 0, 1, 1,
-1.014516, 1.358005, -1.721354, 1, 0, 0, 1, 1,
-1.008326, -1.174592, -3.460611, 1, 0, 0, 1, 1,
-1.002784, -0.6075939, -1.895895, 1, 0, 0, 1, 1,
-0.9929226, -0.009072996, -2.744847, 1, 0, 0, 1, 1,
-0.9846618, -0.5064964, -2.580412, 0, 0, 0, 1, 1,
-0.9846129, 0.3980978, -2.330977, 0, 0, 0, 1, 1,
-0.9834501, 0.1573055, -0.4452132, 0, 0, 0, 1, 1,
-0.9766281, 0.9110882, -2.476353, 0, 0, 0, 1, 1,
-0.9674756, -0.3656213, -2.273968, 0, 0, 0, 1, 1,
-0.9666294, -0.0707578, 0.2644035, 0, 0, 0, 1, 1,
-0.9646794, 1.180286, -1.843618, 0, 0, 0, 1, 1,
-0.9636426, -0.6535831, -3.55857, 1, 1, 1, 1, 1,
-0.957652, 0.858286, -1.742134, 1, 1, 1, 1, 1,
-0.9518049, 0.372811, -2.110901, 1, 1, 1, 1, 1,
-0.9489477, 1.057366, -0.4691563, 1, 1, 1, 1, 1,
-0.9487172, 0.5460868, -1.370936, 1, 1, 1, 1, 1,
-0.9452652, -1.543981, -3.200202, 1, 1, 1, 1, 1,
-0.944159, -0.1415562, -1.517265, 1, 1, 1, 1, 1,
-0.9431975, -0.8563671, -2.992539, 1, 1, 1, 1, 1,
-0.9385392, -1.767557, -1.768876, 1, 1, 1, 1, 1,
-0.9364747, 0.8445119, -1.799645, 1, 1, 1, 1, 1,
-0.9334297, 0.9430202, -1.437391, 1, 1, 1, 1, 1,
-0.928354, -1.23035, -3.08376, 1, 1, 1, 1, 1,
-0.9201706, -0.2248521, -1.687926, 1, 1, 1, 1, 1,
-0.9191687, -1.332131, -2.968019, 1, 1, 1, 1, 1,
-0.9137648, -0.7269966, -1.902403, 1, 1, 1, 1, 1,
-0.9134775, 0.02969724, -1.469477, 0, 0, 1, 1, 1,
-0.9060665, -0.1599844, -2.329029, 1, 0, 0, 1, 1,
-0.9039963, 0.161485, -2.135247, 1, 0, 0, 1, 1,
-0.9022507, 0.349971, -2.446565, 1, 0, 0, 1, 1,
-0.8991701, 0.2273771, -1.367173, 1, 0, 0, 1, 1,
-0.897427, -0.4985235, -1.512493, 1, 0, 0, 1, 1,
-0.8892465, 0.6705037, -0.2339395, 0, 0, 0, 1, 1,
-0.8825274, -0.8147463, -2.605333, 0, 0, 0, 1, 1,
-0.8733149, -0.7560116, -1.589897, 0, 0, 0, 1, 1,
-0.8709122, 1.558585, -1.763323, 0, 0, 0, 1, 1,
-0.8654336, 0.2012396, -2.30189, 0, 0, 0, 1, 1,
-0.8634264, 0.1708649, -1.319673, 0, 0, 0, 1, 1,
-0.85878, -0.3563276, -3.946433, 0, 0, 0, 1, 1,
-0.8578324, -0.7266746, -1.555278, 1, 1, 1, 1, 1,
-0.8459649, -0.7157365, -1.850739, 1, 1, 1, 1, 1,
-0.8418491, -0.03461389, -1.532846, 1, 1, 1, 1, 1,
-0.8410873, -0.6121706, -1.490214, 1, 1, 1, 1, 1,
-0.8377504, -0.5214776, -2.133247, 1, 1, 1, 1, 1,
-0.8349085, -0.4904964, -3.159698, 1, 1, 1, 1, 1,
-0.8329895, 1.406924, -0.3567039, 1, 1, 1, 1, 1,
-0.8316692, -0.4624356, -1.111339, 1, 1, 1, 1, 1,
-0.8290018, 0.4933805, -1.48155, 1, 1, 1, 1, 1,
-0.827893, -0.3229537, -2.89088, 1, 1, 1, 1, 1,
-0.8242366, -0.1059185, -0.2034183, 1, 1, 1, 1, 1,
-0.8236637, 1.974226, -2.389633, 1, 1, 1, 1, 1,
-0.8220841, 0.3640407, -0.9092797, 1, 1, 1, 1, 1,
-0.8204798, -0.6723691, -1.615993, 1, 1, 1, 1, 1,
-0.8193615, 0.9156517, -0.2160604, 1, 1, 1, 1, 1,
-0.8185923, -0.5574456, -2.574184, 0, 0, 1, 1, 1,
-0.8126096, 0.7680033, -1.6126, 1, 0, 0, 1, 1,
-0.8085865, -0.660753, -2.309858, 1, 0, 0, 1, 1,
-0.8050154, -1.730345, -2.725598, 1, 0, 0, 1, 1,
-0.8017901, 0.1264923, -0.6765353, 1, 0, 0, 1, 1,
-0.7986472, -0.04413952, -0.2282491, 1, 0, 0, 1, 1,
-0.7954987, 1.723476, -2.332932, 0, 0, 0, 1, 1,
-0.793326, 0.5185941, 0.3673873, 0, 0, 0, 1, 1,
-0.7877256, -1.857891, -1.16966, 0, 0, 0, 1, 1,
-0.7875427, 0.9086841, 0.07111887, 0, 0, 0, 1, 1,
-0.7834163, 0.4852943, -0.2747816, 0, 0, 0, 1, 1,
-0.7815282, -0.6719712, -1.633101, 0, 0, 0, 1, 1,
-0.7792021, 1.277882, -1.120966, 0, 0, 0, 1, 1,
-0.7780377, 0.002353739, -1.224515, 1, 1, 1, 1, 1,
-0.7780314, -1.247404, -2.504604, 1, 1, 1, 1, 1,
-0.7775915, 0.7630703, -1.894494, 1, 1, 1, 1, 1,
-0.7757565, 1.00315, -0.6072786, 1, 1, 1, 1, 1,
-0.7742044, -0.1830815, -2.045964, 1, 1, 1, 1, 1,
-0.7679928, 0.2742689, -1.780695, 1, 1, 1, 1, 1,
-0.7649698, -0.3030994, -2.349928, 1, 1, 1, 1, 1,
-0.7602816, -0.4065621, -5.532688, 1, 1, 1, 1, 1,
-0.7599653, -1.283721, -3.388756, 1, 1, 1, 1, 1,
-0.7575398, -0.6174498, -3.690608, 1, 1, 1, 1, 1,
-0.7546377, -0.2507799, 0.1293442, 1, 1, 1, 1, 1,
-0.7484384, -0.03746819, -1.761973, 1, 1, 1, 1, 1,
-0.7458884, 0.9823604, -1.060047, 1, 1, 1, 1, 1,
-0.7454515, 0.2184171, -2.663405, 1, 1, 1, 1, 1,
-0.7428614, 0.1741113, -1.498109, 1, 1, 1, 1, 1,
-0.742221, 1.500855, 0.03917612, 0, 0, 1, 1, 1,
-0.7326711, 0.4365959, 0.1540046, 1, 0, 0, 1, 1,
-0.7285776, -0.3958804, -2.17471, 1, 0, 0, 1, 1,
-0.725384, 1.66218, 1.906905, 1, 0, 0, 1, 1,
-0.7253183, -0.2797211, -2.05918, 1, 0, 0, 1, 1,
-0.724175, -0.6767088, -2.650788, 1, 0, 0, 1, 1,
-0.7190969, 0.4448877, 0.1119003, 0, 0, 0, 1, 1,
-0.7161823, 0.09547592, -1.191322, 0, 0, 0, 1, 1,
-0.7121761, 0.2545661, -0.5133232, 0, 0, 0, 1, 1,
-0.7084516, 1.255108, -0.3726812, 0, 0, 0, 1, 1,
-0.7071115, -0.6509882, -2.59919, 0, 0, 0, 1, 1,
-0.7068812, -1.141521, -2.78413, 0, 0, 0, 1, 1,
-0.7004066, 0.6607495, -1.342962, 0, 0, 0, 1, 1,
-0.6998857, 0.04941718, -1.458572, 1, 1, 1, 1, 1,
-0.6982931, 0.7509929, 0.14695, 1, 1, 1, 1, 1,
-0.6879299, 0.6045676, -0.600803, 1, 1, 1, 1, 1,
-0.6865877, -0.6804256, -1.91753, 1, 1, 1, 1, 1,
-0.6841092, 2.44384, -1.160968, 1, 1, 1, 1, 1,
-0.6767376, -0.548852, -1.852475, 1, 1, 1, 1, 1,
-0.6743978, -0.7878393, 0.0634559, 1, 1, 1, 1, 1,
-0.6738382, -0.8991685, -2.516146, 1, 1, 1, 1, 1,
-0.6704608, -0.4764336, -1.395915, 1, 1, 1, 1, 1,
-0.6689366, -0.2341841, 0.5629927, 1, 1, 1, 1, 1,
-0.6688206, -0.5442353, -2.707522, 1, 1, 1, 1, 1,
-0.6681859, 1.662471, 1.923267, 1, 1, 1, 1, 1,
-0.6672156, -0.3494152, -2.048974, 1, 1, 1, 1, 1,
-0.6670881, -0.4279286, -2.793607, 1, 1, 1, 1, 1,
-0.6662696, -1.209862, -1.000833, 1, 1, 1, 1, 1,
-0.6658884, 0.7205654, 0.08673178, 0, 0, 1, 1, 1,
-0.664267, -1.433856, -5.56963, 1, 0, 0, 1, 1,
-0.6580975, -1.021801, -2.766018, 1, 0, 0, 1, 1,
-0.6558758, 0.1325807, -1.578093, 1, 0, 0, 1, 1,
-0.6550847, 0.8351464, -0.02231218, 1, 0, 0, 1, 1,
-0.6453193, 0.1422729, -2.515653, 1, 0, 0, 1, 1,
-0.6438205, -1.355972, -1.600432, 0, 0, 0, 1, 1,
-0.6375426, 1.142776, -1.363044, 0, 0, 0, 1, 1,
-0.6361551, -0.572668, -3.035649, 0, 0, 0, 1, 1,
-0.6331079, -0.2627572, -3.593914, 0, 0, 0, 1, 1,
-0.6326819, 0.3277486, -0.3207164, 0, 0, 0, 1, 1,
-0.6315848, 0.1273963, -2.005297, 0, 0, 0, 1, 1,
-0.6305003, 0.5590541, 0.04201737, 0, 0, 0, 1, 1,
-0.6295657, -0.2024307, -1.619282, 1, 1, 1, 1, 1,
-0.6287852, 1.70635, 0.03226088, 1, 1, 1, 1, 1,
-0.6231362, -0.8853258, -1.529379, 1, 1, 1, 1, 1,
-0.6203759, -0.0006613797, -1.724017, 1, 1, 1, 1, 1,
-0.6175496, -0.6837977, -2.775536, 1, 1, 1, 1, 1,
-0.6170734, -0.3807108, -1.399208, 1, 1, 1, 1, 1,
-0.6129372, 0.2779214, 0.392643, 1, 1, 1, 1, 1,
-0.6064296, 0.001791335, -2.304211, 1, 1, 1, 1, 1,
-0.6063176, -0.7945315, -1.764198, 1, 1, 1, 1, 1,
-0.605321, 0.1166302, -2.264044, 1, 1, 1, 1, 1,
-0.6044298, 0.4591828, -1.329436, 1, 1, 1, 1, 1,
-0.6019151, -0.2668195, -1.581434, 1, 1, 1, 1, 1,
-0.5995466, 0.3890793, -0.4954847, 1, 1, 1, 1, 1,
-0.5978732, -0.02748733, -1.433548, 1, 1, 1, 1, 1,
-0.5892534, -0.6017253, -1.905875, 1, 1, 1, 1, 1,
-0.5881173, -1.045613, -3.767275, 0, 0, 1, 1, 1,
-0.5877804, 0.7165656, -2.164772, 1, 0, 0, 1, 1,
-0.5855353, 0.4286073, -1.002052, 1, 0, 0, 1, 1,
-0.5850562, 0.9071643, -0.6568183, 1, 0, 0, 1, 1,
-0.5824856, -1.1234, -2.111763, 1, 0, 0, 1, 1,
-0.5759727, 0.02703969, -2.245066, 1, 0, 0, 1, 1,
-0.572551, 0.2567517, 0.2710289, 0, 0, 0, 1, 1,
-0.5715393, 1.037221, 0.5620395, 0, 0, 0, 1, 1,
-0.5693078, -0.5324438, -1.295512, 0, 0, 0, 1, 1,
-0.5686643, -0.09059203, -0.5302424, 0, 0, 0, 1, 1,
-0.5652094, 0.7118232, -0.3484969, 0, 0, 0, 1, 1,
-0.5629785, -0.7322126, -3.106274, 0, 0, 0, 1, 1,
-0.5605779, 1.308543, -0.8945005, 0, 0, 0, 1, 1,
-0.5596035, 0.627204, -0.873111, 1, 1, 1, 1, 1,
-0.5588924, 1.423217, 0.1510428, 1, 1, 1, 1, 1,
-0.5585431, -1.355875, -2.662487, 1, 1, 1, 1, 1,
-0.5527767, 0.3396848, -2.631447, 1, 1, 1, 1, 1,
-0.5474291, 0.1787514, -0.4522408, 1, 1, 1, 1, 1,
-0.5435218, 1.571104, -0.5252721, 1, 1, 1, 1, 1,
-0.5417485, 0.8956562, -2.408137, 1, 1, 1, 1, 1,
-0.5370357, -1.278723, -1.942196, 1, 1, 1, 1, 1,
-0.5364659, 1.494237, 0.07684549, 1, 1, 1, 1, 1,
-0.5362313, 2.137365, -0.8642598, 1, 1, 1, 1, 1,
-0.5251575, 1.517654, -0.377656, 1, 1, 1, 1, 1,
-0.5224512, -0.1104017, -2.330166, 1, 1, 1, 1, 1,
-0.5210119, -1.270042, -1.93696, 1, 1, 1, 1, 1,
-0.5203405, 0.4951439, 0.2017227, 1, 1, 1, 1, 1,
-0.5178813, -0.183709, -2.083245, 1, 1, 1, 1, 1,
-0.5038384, 0.9640944, -1.019647, 0, 0, 1, 1, 1,
-0.5036002, -1.108163, -2.866472, 1, 0, 0, 1, 1,
-0.5016448, 0.3409867, -2.133386, 1, 0, 0, 1, 1,
-0.4984692, 0.2359577, 0.07424145, 1, 0, 0, 1, 1,
-0.4976799, 0.7670628, -0.7869208, 1, 0, 0, 1, 1,
-0.4957715, -0.8019359, -1.845801, 1, 0, 0, 1, 1,
-0.4907601, -0.0769811, -0.3627519, 0, 0, 0, 1, 1,
-0.4851187, -0.5509568, -1.996781, 0, 0, 0, 1, 1,
-0.4844911, -0.4405039, -3.831256, 0, 0, 0, 1, 1,
-0.4827238, 1.613111, -1.829767, 0, 0, 0, 1, 1,
-0.4775652, -2.561044, -2.35602, 0, 0, 0, 1, 1,
-0.4769081, 0.5620956, -1.266709, 0, 0, 0, 1, 1,
-0.4640837, 2.247892, -0.1517265, 0, 0, 0, 1, 1,
-0.4610527, 0.270377, -0.8575478, 1, 1, 1, 1, 1,
-0.4609698, -0.678822, -1.905095, 1, 1, 1, 1, 1,
-0.4603182, 0.5937001, -1.986911, 1, 1, 1, 1, 1,
-0.4602499, -0.2288243, -3.827921, 1, 1, 1, 1, 1,
-0.4571626, -0.1137029, -1.830531, 1, 1, 1, 1, 1,
-0.456873, 1.380118, 1.047746, 1, 1, 1, 1, 1,
-0.4516486, -0.2940824, -2.350954, 1, 1, 1, 1, 1,
-0.4487765, -0.5948617, -1.88294, 1, 1, 1, 1, 1,
-0.4440904, -0.9972558, -2.94265, 1, 1, 1, 1, 1,
-0.4422644, 0.07360425, -0.2803342, 1, 1, 1, 1, 1,
-0.438808, -1.900677, -2.645416, 1, 1, 1, 1, 1,
-0.4362771, 1.073849, -1.134487, 1, 1, 1, 1, 1,
-0.4335759, -1.546984, -2.948821, 1, 1, 1, 1, 1,
-0.4312358, -0.6108397, -2.163381, 1, 1, 1, 1, 1,
-0.4292378, -0.4730475, -2.016265, 1, 1, 1, 1, 1,
-0.4260941, -0.8765319, -2.715804, 0, 0, 1, 1, 1,
-0.4242706, 0.6652768, 0.02797954, 1, 0, 0, 1, 1,
-0.4230186, -1.441564, -3.668652, 1, 0, 0, 1, 1,
-0.4219623, 2.181638, 0.6484897, 1, 0, 0, 1, 1,
-0.4188878, 0.6893778, 0.4650357, 1, 0, 0, 1, 1,
-0.4169022, -0.1247207, -2.560368, 1, 0, 0, 1, 1,
-0.4136971, -0.8320485, -1.599543, 0, 0, 0, 1, 1,
-0.409176, 1.608201, -0.7554507, 0, 0, 0, 1, 1,
-0.4085572, 0.1790227, -1.229619, 0, 0, 0, 1, 1,
-0.4067087, -1.14778, -4.012086, 0, 0, 0, 1, 1,
-0.4054365, 0.3857077, -0.9623858, 0, 0, 0, 1, 1,
-0.4045835, 2.294755, 2.648988, 0, 0, 0, 1, 1,
-0.4004655, 0.5666903, 0.4065009, 0, 0, 0, 1, 1,
-0.4004138, 0.7720512, 0.6956971, 1, 1, 1, 1, 1,
-0.3986825, -2.441489, -1.963784, 1, 1, 1, 1, 1,
-0.3983219, 0.7080423, 0.4112184, 1, 1, 1, 1, 1,
-0.398315, 0.8390075, -0.2715415, 1, 1, 1, 1, 1,
-0.3947589, 1.750995, 0.5795916, 1, 1, 1, 1, 1,
-0.3889425, -1.079786, -2.665451, 1, 1, 1, 1, 1,
-0.3888234, 1.783463, 0.287069, 1, 1, 1, 1, 1,
-0.387111, 0.3411089, 0.0064251, 1, 1, 1, 1, 1,
-0.3844437, -1.039766, -3.395344, 1, 1, 1, 1, 1,
-0.383257, -0.05091345, -2.535293, 1, 1, 1, 1, 1,
-0.376379, -0.8738292, -2.607326, 1, 1, 1, 1, 1,
-0.3735985, 0.07138526, -0.7013708, 1, 1, 1, 1, 1,
-0.3726764, -0.8372061, -1.468489, 1, 1, 1, 1, 1,
-0.369757, -0.7665434, -2.099292, 1, 1, 1, 1, 1,
-0.3655968, 2.16595, -1.11031, 1, 1, 1, 1, 1,
-0.3636998, 0.8676882, 0.1512958, 0, 0, 1, 1, 1,
-0.3625447, 0.7668495, -0.7387427, 1, 0, 0, 1, 1,
-0.3577445, -1.075651, -1.130509, 1, 0, 0, 1, 1,
-0.3533844, 1.282069, -1.77214, 1, 0, 0, 1, 1,
-0.3514706, 1.887204, 1.46979, 1, 0, 0, 1, 1,
-0.350877, 0.1747426, -0.6596659, 1, 0, 0, 1, 1,
-0.3505939, 0.8230874, 0.3164157, 0, 0, 0, 1, 1,
-0.3475362, 0.8432164, 0.1624718, 0, 0, 0, 1, 1,
-0.3471722, -0.7785298, -3.714851, 0, 0, 0, 1, 1,
-0.3411737, -0.8437437, -2.818886, 0, 0, 0, 1, 1,
-0.3397018, -0.1308223, -2.968508, 0, 0, 0, 1, 1,
-0.3372279, -0.873834, -1.629993, 0, 0, 0, 1, 1,
-0.3351541, 1.108712, 1.033856, 0, 0, 0, 1, 1,
-0.3277149, 0.6034623, -0.8087345, 1, 1, 1, 1, 1,
-0.326619, -0.8935764, -1.852629, 1, 1, 1, 1, 1,
-0.3248952, 0.3877526, 1.798107, 1, 1, 1, 1, 1,
-0.3229379, -0.04102641, -1.983419, 1, 1, 1, 1, 1,
-0.3223565, 0.7657695, -0.2512713, 1, 1, 1, 1, 1,
-0.3188342, 0.361419, -0.3214479, 1, 1, 1, 1, 1,
-0.3184473, -0.01702676, -0.9267443, 1, 1, 1, 1, 1,
-0.3152371, 0.3385244, 0.03049258, 1, 1, 1, 1, 1,
-0.3071412, -0.2315904, -0.753589, 1, 1, 1, 1, 1,
-0.3044889, -0.4920776, -4.048553, 1, 1, 1, 1, 1,
-0.3035031, -0.2230384, -1.876275, 1, 1, 1, 1, 1,
-0.3029045, -1.098536, -1.878821, 1, 1, 1, 1, 1,
-0.3018766, -0.1302543, -2.799739, 1, 1, 1, 1, 1,
-0.2994404, -0.2723383, -1.231048, 1, 1, 1, 1, 1,
-0.2994247, -0.9078527, -1.900978, 1, 1, 1, 1, 1,
-0.2973192, -1.831916, -2.408899, 0, 0, 1, 1, 1,
-0.2968737, -0.1702114, -2.448587, 1, 0, 0, 1, 1,
-0.2938672, -0.1525212, -1.799686, 1, 0, 0, 1, 1,
-0.2923291, -1.856387, -3.034217, 1, 0, 0, 1, 1,
-0.2895823, 0.185462, 0.3126568, 1, 0, 0, 1, 1,
-0.2890577, -0.6907706, -3.708005, 1, 0, 0, 1, 1,
-0.2875397, 1.268874, -1.193144, 0, 0, 0, 1, 1,
-0.2858404, -0.4108859, -3.272388, 0, 0, 0, 1, 1,
-0.2819375, 1.80892, 2.227804, 0, 0, 0, 1, 1,
-0.280442, -0.2512237, -2.377543, 0, 0, 0, 1, 1,
-0.2692432, 0.2751898, -1.441635, 0, 0, 0, 1, 1,
-0.2671958, 0.8798478, -1.341424, 0, 0, 0, 1, 1,
-0.2642258, 0.2614747, -1.209943, 0, 0, 0, 1, 1,
-0.2641543, -0.05817345, -2.590003, 1, 1, 1, 1, 1,
-0.2629204, -0.5057784, -2.870397, 1, 1, 1, 1, 1,
-0.2619675, -0.2634482, -1.205377, 1, 1, 1, 1, 1,
-0.2598351, -1.211986, -2.433121, 1, 1, 1, 1, 1,
-0.258763, -0.5813925, -3.472649, 1, 1, 1, 1, 1,
-0.2526699, -1.733634, -4.295995, 1, 1, 1, 1, 1,
-0.2511317, 0.7646725, -0.2249888, 1, 1, 1, 1, 1,
-0.2486269, 0.3917287, -1.325386, 1, 1, 1, 1, 1,
-0.2478163, 0.4078015, -0.197829, 1, 1, 1, 1, 1,
-0.2470495, 0.4241444, -0.8398037, 1, 1, 1, 1, 1,
-0.2467431, -1.922029, -2.463976, 1, 1, 1, 1, 1,
-0.2464922, 0.7967516, 1.278935, 1, 1, 1, 1, 1,
-0.2441651, -0.04909534, -1.406191, 1, 1, 1, 1, 1,
-0.2436002, -0.4132964, -0.553621, 1, 1, 1, 1, 1,
-0.2366621, 0.2678383, -1.260531, 1, 1, 1, 1, 1,
-0.2363438, -0.9215356, -2.49787, 0, 0, 1, 1, 1,
-0.2306639, -0.7096879, -3.85266, 1, 0, 0, 1, 1,
-0.2264273, -0.5335979, -1.943776, 1, 0, 0, 1, 1,
-0.2236528, 0.899731, 0.53964, 1, 0, 0, 1, 1,
-0.2231292, -0.1953279, -1.070814, 1, 0, 0, 1, 1,
-0.2214288, -0.1448648, -5.22381, 1, 0, 0, 1, 1,
-0.2183027, -1.416541, -1.517323, 0, 0, 0, 1, 1,
-0.2179551, 1.022599, -0.1863676, 0, 0, 0, 1, 1,
-0.2174147, 1.752146, 0.1819934, 0, 0, 0, 1, 1,
-0.2168754, 0.01678752, -1.105463, 0, 0, 0, 1, 1,
-0.2148564, -1.39119, -4.261382, 0, 0, 0, 1, 1,
-0.2130922, -0.769933, -1.027342, 0, 0, 0, 1, 1,
-0.2094406, -0.3335226, -1.539499, 0, 0, 0, 1, 1,
-0.2092799, -0.402051, -1.133931, 1, 1, 1, 1, 1,
-0.2085623, -0.9057148, -1.078246, 1, 1, 1, 1, 1,
-0.2078004, -1.63697, -3.618826, 1, 1, 1, 1, 1,
-0.2076079, 0.09079891, -2.164629, 1, 1, 1, 1, 1,
-0.2057568, 0.7398744, -0.6443805, 1, 1, 1, 1, 1,
-0.2046086, 1.552159, 0.3218409, 1, 1, 1, 1, 1,
-0.2044817, -0.6055623, -0.6549059, 1, 1, 1, 1, 1,
-0.1989188, -0.2810085, -2.995294, 1, 1, 1, 1, 1,
-0.1982909, -0.1813799, -1.172801, 1, 1, 1, 1, 1,
-0.189885, 0.2471575, 0.7380379, 1, 1, 1, 1, 1,
-0.1895816, -1.162304, -2.495666, 1, 1, 1, 1, 1,
-0.188705, 1.08997, 0.3942043, 1, 1, 1, 1, 1,
-0.1878091, -0.9953507, -2.780547, 1, 1, 1, 1, 1,
-0.1829242, -0.5492564, -3.741795, 1, 1, 1, 1, 1,
-0.1820982, 0.01607807, -1.253345, 1, 1, 1, 1, 1,
-0.1820058, 1.174379, -0.6547543, 0, 0, 1, 1, 1,
-0.1802987, -0.0698049, -1.697027, 1, 0, 0, 1, 1,
-0.1794021, -0.7732518, -3.015609, 1, 0, 0, 1, 1,
-0.166635, 0.08900382, -1.66018, 1, 0, 0, 1, 1,
-0.1663559, 0.6625294, 0.2246268, 1, 0, 0, 1, 1,
-0.161615, 0.4586936, -1.900989, 1, 0, 0, 1, 1,
-0.1581109, 0.2339688, -1.621047, 0, 0, 0, 1, 1,
-0.1543467, 0.2140216, -1.587661, 0, 0, 0, 1, 1,
-0.1538736, 0.1661233, 0.3941435, 0, 0, 0, 1, 1,
-0.1504564, -0.7493297, -2.251499, 0, 0, 0, 1, 1,
-0.1474168, 0.6792425, -0.3948642, 0, 0, 0, 1, 1,
-0.1398333, 1.698014, -0.7388796, 0, 0, 0, 1, 1,
-0.1264179, 0.9757702, 0.2525016, 0, 0, 0, 1, 1,
-0.1246582, 0.6425828, -0.03614594, 1, 1, 1, 1, 1,
-0.1233822, -0.8901678, -4.695676, 1, 1, 1, 1, 1,
-0.1229604, 0.5517769, -0.575974, 1, 1, 1, 1, 1,
-0.121113, 1.351658, -0.3151727, 1, 1, 1, 1, 1,
-0.1201384, 0.1928121, -0.4235989, 1, 1, 1, 1, 1,
-0.1193586, 0.05596662, -3.050864, 1, 1, 1, 1, 1,
-0.1142142, 1.248284, 2.059021, 1, 1, 1, 1, 1,
-0.1085753, 0.4774245, -0.7447366, 1, 1, 1, 1, 1,
-0.1081501, 0.7940481, -0.9870819, 1, 1, 1, 1, 1,
-0.1051673, -0.03429787, -1.126432, 1, 1, 1, 1, 1,
-0.1038392, 0.9060571, -0.05634182, 1, 1, 1, 1, 1,
-0.09545697, 1.786373, -1.471112, 1, 1, 1, 1, 1,
-0.09325603, 0.4018016, -1.449325, 1, 1, 1, 1, 1,
-0.09020095, -0.5360283, -3.567067, 1, 1, 1, 1, 1,
-0.08491852, -0.3686259, -2.930139, 1, 1, 1, 1, 1,
-0.0844297, -0.7067747, -4.61774, 0, 0, 1, 1, 1,
-0.08437143, -0.3547983, -2.125793, 1, 0, 0, 1, 1,
-0.08425896, 0.7416328, 0.3297172, 1, 0, 0, 1, 1,
-0.08395014, -0.8889611, -2.558732, 1, 0, 0, 1, 1,
-0.07932793, -0.5638289, -2.676043, 1, 0, 0, 1, 1,
-0.07472651, 0.9021206, 1.383182, 1, 0, 0, 1, 1,
-0.06515066, 1.524509, 1.577711, 0, 0, 0, 1, 1,
-0.06183677, 0.6480661, 1.34202, 0, 0, 0, 1, 1,
-0.05738021, -1.106812, -4.025291, 0, 0, 0, 1, 1,
-0.04599975, -1.381912, -2.911231, 0, 0, 0, 1, 1,
-0.04553179, -0.6646982, -3.933135, 0, 0, 0, 1, 1,
-0.04253953, -0.2273671, -4.730136, 0, 0, 0, 1, 1,
-0.04202186, -0.9292999, -5.721953, 0, 0, 0, 1, 1,
-0.04171543, -1.000823, -3.0916, 1, 1, 1, 1, 1,
-0.04011185, -1.51485, -3.023283, 1, 1, 1, 1, 1,
-0.03964345, -0.02697512, -3.748526, 1, 1, 1, 1, 1,
-0.03374369, 0.70568, 0.7092043, 1, 1, 1, 1, 1,
-0.02905501, -1.200968, -4.622995, 1, 1, 1, 1, 1,
-0.02495098, 0.9926134, 0.008023608, 1, 1, 1, 1, 1,
-0.01752195, 2.074437, 0.7564537, 1, 1, 1, 1, 1,
-0.0151577, 0.1767382, 0.05418059, 1, 1, 1, 1, 1,
-0.002997834, -0.5522193, -5.775369, 1, 1, 1, 1, 1,
0.0003547115, 0.3755468, 1.538427, 1, 1, 1, 1, 1,
0.004045414, 0.8100893, -0.04541182, 1, 1, 1, 1, 1,
0.004116531, -0.4351518, 3.084952, 1, 1, 1, 1, 1,
0.004299277, -1.401585, 5.402937, 1, 1, 1, 1, 1,
0.004659099, 0.154985, 0.3171338, 1, 1, 1, 1, 1,
0.008280141, 0.2653814, -0.5461662, 1, 1, 1, 1, 1,
0.008790053, -0.5879644, 4.922892, 0, 0, 1, 1, 1,
0.008834576, 0.1393049, -0.8855879, 1, 0, 0, 1, 1,
0.01033087, 1.007357, 0.1551768, 1, 0, 0, 1, 1,
0.01192693, -1.662709, 2.650258, 1, 0, 0, 1, 1,
0.01310367, -0.5861533, 2.981397, 1, 0, 0, 1, 1,
0.01410849, 1.03082, -1.762802, 1, 0, 0, 1, 1,
0.02168867, 0.7651687, 0.05076576, 0, 0, 0, 1, 1,
0.02202456, 0.6428012, 0.3228323, 0, 0, 0, 1, 1,
0.02275613, -0.8705357, 1.881701, 0, 0, 0, 1, 1,
0.02289487, -1.70502, 2.745468, 0, 0, 0, 1, 1,
0.02373214, 0.08252128, 0.6937937, 0, 0, 0, 1, 1,
0.02420111, -0.1503007, 2.322962, 0, 0, 0, 1, 1,
0.02643528, -0.1407097, 2.585536, 0, 0, 0, 1, 1,
0.02972823, -0.1391215, 2.749003, 1, 1, 1, 1, 1,
0.03151108, -0.4169622, 2.406312, 1, 1, 1, 1, 1,
0.03474239, -0.2471452, 2.12995, 1, 1, 1, 1, 1,
0.03808891, -0.8965298, 5.320704, 1, 1, 1, 1, 1,
0.04041006, -0.2119263, 3.085402, 1, 1, 1, 1, 1,
0.04050409, -1.755516, 4.711384, 1, 1, 1, 1, 1,
0.0411264, -1.758352, 3.925758, 1, 1, 1, 1, 1,
0.04363808, -0.2600771, 3.070096, 1, 1, 1, 1, 1,
0.04505508, 1.028497, 0.3362596, 1, 1, 1, 1, 1,
0.04683204, 0.9017356, -0.1032987, 1, 1, 1, 1, 1,
0.0485068, -1.630361, 4.693925, 1, 1, 1, 1, 1,
0.05489209, -0.04784681, -0.002214765, 1, 1, 1, 1, 1,
0.05584608, 0.5898752, -0.00876398, 1, 1, 1, 1, 1,
0.05902221, -0.3255014, 3.146314, 1, 1, 1, 1, 1,
0.06003685, -1.194388, 3.709618, 1, 1, 1, 1, 1,
0.06236081, 1.482852, -0.5990139, 0, 0, 1, 1, 1,
0.06370823, -0.5124709, 3.923248, 1, 0, 0, 1, 1,
0.06407529, 0.9266484, 0.2713069, 1, 0, 0, 1, 1,
0.06965488, -0.04884855, 0.2403441, 1, 0, 0, 1, 1,
0.07574525, 1.105081, 0.584693, 1, 0, 0, 1, 1,
0.07917508, -0.9215016, 4.594306, 1, 0, 0, 1, 1,
0.07994551, 1.526504, -0.2433217, 0, 0, 0, 1, 1,
0.08296726, -0.7402234, 2.735713, 0, 0, 0, 1, 1,
0.08578619, -0.4673258, 3.547033, 0, 0, 0, 1, 1,
0.08804401, -2.62758, 2.184811, 0, 0, 0, 1, 1,
0.08807936, 1.039557, -1.35035, 0, 0, 0, 1, 1,
0.0893213, -0.457422, 3.466167, 0, 0, 0, 1, 1,
0.0897513, -0.34727, 4.066393, 0, 0, 0, 1, 1,
0.09022934, -1.280544, 2.779522, 1, 1, 1, 1, 1,
0.0904043, -0.1721654, 4.52657, 1, 1, 1, 1, 1,
0.09410851, -0.8400862, 3.066373, 1, 1, 1, 1, 1,
0.09980055, 0.464086, 0.1184368, 1, 1, 1, 1, 1,
0.1027957, 0.3674651, 0.9728698, 1, 1, 1, 1, 1,
0.1072675, -1.145361, 3.116307, 1, 1, 1, 1, 1,
0.1074744, 0.6695204, -0.386225, 1, 1, 1, 1, 1,
0.1121054, 0.8609645, 0.2536997, 1, 1, 1, 1, 1,
0.1132089, 1.299999, 0.01980396, 1, 1, 1, 1, 1,
0.1154211, -1.352719, 1.485002, 1, 1, 1, 1, 1,
0.1222631, -0.6775496, 2.944405, 1, 1, 1, 1, 1,
0.1224388, -1.64432, 3.103618, 1, 1, 1, 1, 1,
0.1228429, -0.5392552, 2.075857, 1, 1, 1, 1, 1,
0.1229187, -0.5164459, 3.570138, 1, 1, 1, 1, 1,
0.1236605, -0.7825146, 3.350684, 1, 1, 1, 1, 1,
0.1323966, 0.04692963, -0.02818508, 0, 0, 1, 1, 1,
0.1331652, 1.091903, -0.8297384, 1, 0, 0, 1, 1,
0.1344314, 0.3116393, -0.8491645, 1, 0, 0, 1, 1,
0.1366947, -0.313363, 2.381202, 1, 0, 0, 1, 1,
0.1399461, 0.4182848, 0.3668413, 1, 0, 0, 1, 1,
0.1406403, -0.5891776, 2.670559, 1, 0, 0, 1, 1,
0.1427998, -1.141054, 3.051802, 0, 0, 0, 1, 1,
0.1480352, 1.122236, 1.66671, 0, 0, 0, 1, 1,
0.149785, -0.5246687, 3.434948, 0, 0, 0, 1, 1,
0.1600879, -0.2119617, 1.337504, 0, 0, 0, 1, 1,
0.168152, -0.7087252, 2.578557, 0, 0, 0, 1, 1,
0.1709173, 0.2249975, 0.2727539, 0, 0, 0, 1, 1,
0.171853, -1.29132, 3.348179, 0, 0, 0, 1, 1,
0.1727729, -0.3801639, 1.5126, 1, 1, 1, 1, 1,
0.1809629, -0.8538053, 4.173307, 1, 1, 1, 1, 1,
0.1811676, -1.280783, 2.556965, 1, 1, 1, 1, 1,
0.1818646, 0.04992349, 0.7958096, 1, 1, 1, 1, 1,
0.1830402, -1.128303, 3.42325, 1, 1, 1, 1, 1,
0.1838988, 1.936961, -1.14891, 1, 1, 1, 1, 1,
0.1848994, -1.642116, 4.171006, 1, 1, 1, 1, 1,
0.1885747, -0.5271727, 2.221651, 1, 1, 1, 1, 1,
0.189467, 0.8099481, -0.4461413, 1, 1, 1, 1, 1,
0.1895515, 2.543209, -0.50309, 1, 1, 1, 1, 1,
0.1898449, -0.3213636, 4.197076, 1, 1, 1, 1, 1,
0.1907447, -0.4973502, 3.856656, 1, 1, 1, 1, 1,
0.1940566, 0.5043696, 1.207276, 1, 1, 1, 1, 1,
0.1954972, 1.734954, -1.195472, 1, 1, 1, 1, 1,
0.1957829, -1.07768, 1.781655, 1, 1, 1, 1, 1,
0.1968144, 1.883443, 0.2154389, 0, 0, 1, 1, 1,
0.2023305, -1.644433, 2.331103, 1, 0, 0, 1, 1,
0.2048306, -0.5214038, 3.347383, 1, 0, 0, 1, 1,
0.2070521, -0.710818, 4.490334, 1, 0, 0, 1, 1,
0.2114388, -0.8288682, 2.498333, 1, 0, 0, 1, 1,
0.2117631, 0.8174802, 1.6955, 1, 0, 0, 1, 1,
0.2162705, 0.3108696, -0.7920324, 0, 0, 0, 1, 1,
0.2183731, -0.2521335, 2.968638, 0, 0, 0, 1, 1,
0.2222796, 0.04418448, 0.7324873, 0, 0, 0, 1, 1,
0.2256128, -0.9788589, 1.334772, 0, 0, 0, 1, 1,
0.2266015, -1.631507, 2.545502, 0, 0, 0, 1, 1,
0.2275025, 0.6530099, 0.161809, 0, 0, 0, 1, 1,
0.2276395, -0.5517181, 2.647785, 0, 0, 0, 1, 1,
0.2355893, 0.08578645, 1.928965, 1, 1, 1, 1, 1,
0.2426852, -1.124032, 1.764942, 1, 1, 1, 1, 1,
0.2427763, 0.4280034, 1.484862, 1, 1, 1, 1, 1,
0.244981, -0.9066374, 3.708642, 1, 1, 1, 1, 1,
0.2477215, 1.655614, 1.133851, 1, 1, 1, 1, 1,
0.2488917, 1.704721, 0.6409116, 1, 1, 1, 1, 1,
0.2510427, 0.2975264, 1.995602, 1, 1, 1, 1, 1,
0.2515679, 0.1980446, 0.8350586, 1, 1, 1, 1, 1,
0.2515824, 1.052275, -0.3373363, 1, 1, 1, 1, 1,
0.2530288, 1.138122, -0.144847, 1, 1, 1, 1, 1,
0.2546999, 0.03483161, 1.417202, 1, 1, 1, 1, 1,
0.2548601, -1.74212, 2.447465, 1, 1, 1, 1, 1,
0.256466, -1.36063, 3.731488, 1, 1, 1, 1, 1,
0.2580746, 0.9888582, 1.770993, 1, 1, 1, 1, 1,
0.2602364, 0.1336586, 0.2247052, 1, 1, 1, 1, 1,
0.2638871, -0.9764374, 3.715977, 0, 0, 1, 1, 1,
0.2653614, 1.398786, -0.3279725, 1, 0, 0, 1, 1,
0.266985, 2.340705, 2.32037, 1, 0, 0, 1, 1,
0.26751, 1.368548, 1.701343, 1, 0, 0, 1, 1,
0.2685953, -2.066346, 1.612612, 1, 0, 0, 1, 1,
0.2718953, 0.1001276, 0.927112, 1, 0, 0, 1, 1,
0.2727381, 0.5608208, 0.786149, 0, 0, 0, 1, 1,
0.2754259, -0.4945774, 2.773433, 0, 0, 0, 1, 1,
0.2763108, 2.700445, -1.537879, 0, 0, 0, 1, 1,
0.2787232, 1.389663, 2.126035, 0, 0, 0, 1, 1,
0.2957888, 1.169467, 1.460951, 0, 0, 0, 1, 1,
0.2963831, -0.4759849, 1.563901, 0, 0, 0, 1, 1,
0.308803, 0.80924, -1.445032, 0, 0, 0, 1, 1,
0.3105548, 0.2943265, 1.495118, 1, 1, 1, 1, 1,
0.3115608, -0.5192305, 2.667889, 1, 1, 1, 1, 1,
0.3128065, 0.2383946, 1.345901, 1, 1, 1, 1, 1,
0.3155772, -1.10594, 3.66201, 1, 1, 1, 1, 1,
0.319495, -2.373634, 2.476707, 1, 1, 1, 1, 1,
0.321799, 1.349542, 0.9411847, 1, 1, 1, 1, 1,
0.3294934, -1.942574, 1.666988, 1, 1, 1, 1, 1,
0.3317052, 1.385732, -0.2282099, 1, 1, 1, 1, 1,
0.3366143, -1.731732, 4.264957, 1, 1, 1, 1, 1,
0.3366357, 2.430984, -0.8139167, 1, 1, 1, 1, 1,
0.3375265, -1.112839, 0.4101902, 1, 1, 1, 1, 1,
0.3387998, 1.443287, 1.363078, 1, 1, 1, 1, 1,
0.3411122, 0.8109645, -1.315202, 1, 1, 1, 1, 1,
0.343788, 0.3339516, 0.8414654, 1, 1, 1, 1, 1,
0.3511144, 1.613867, 0.4979914, 1, 1, 1, 1, 1,
0.3529777, 0.9106326, 1.377315, 0, 0, 1, 1, 1,
0.3569967, -0.4622109, 3.90868, 1, 0, 0, 1, 1,
0.3573057, -0.9256933, 2.150099, 1, 0, 0, 1, 1,
0.3621526, -0.67177, 2.951086, 1, 0, 0, 1, 1,
0.3632762, 0.01956982, 1.572763, 1, 0, 0, 1, 1,
0.3642838, -0.5190838, 2.343778, 1, 0, 0, 1, 1,
0.3700506, -1.635807, 2.8272, 0, 0, 0, 1, 1,
0.3708109, -1.053323, 2.037789, 0, 0, 0, 1, 1,
0.3720532, -0.0449865, 0.07466067, 0, 0, 0, 1, 1,
0.3730284, 0.3226996, -1.762483, 0, 0, 0, 1, 1,
0.3734639, 0.4361531, 1.741849, 0, 0, 0, 1, 1,
0.3744926, 1.830366, 1.298647, 0, 0, 0, 1, 1,
0.3790267, 0.001805846, 1.071365, 0, 0, 0, 1, 1,
0.3800386, -0.8196862, 2.633453, 1, 1, 1, 1, 1,
0.3801151, -0.06631377, 2.679962, 1, 1, 1, 1, 1,
0.3802352, 0.2967497, 0.701925, 1, 1, 1, 1, 1,
0.3833531, 0.4230158, 2.156773, 1, 1, 1, 1, 1,
0.3889583, 0.5581592, 0.6993951, 1, 1, 1, 1, 1,
0.390197, -0.7294027, 4.110981, 1, 1, 1, 1, 1,
0.3945993, -0.1629814, 3.673355, 1, 1, 1, 1, 1,
0.395818, -0.2859823, 1.185759, 1, 1, 1, 1, 1,
0.3958201, -0.4528584, 2.201958, 1, 1, 1, 1, 1,
0.3963098, -0.564502, 2.324747, 1, 1, 1, 1, 1,
0.3996882, 0.518395, 1.204745, 1, 1, 1, 1, 1,
0.407977, -0.2228233, 3.327286, 1, 1, 1, 1, 1,
0.41339, -2.636409, 1.931494, 1, 1, 1, 1, 1,
0.4198715, 0.4018524, 0.8659647, 1, 1, 1, 1, 1,
0.4230594, 0.5103563, 0.6278098, 1, 1, 1, 1, 1,
0.4280048, 0.5722866, -0.8258391, 0, 0, 1, 1, 1,
0.4358983, -0.2089639, 0.8048536, 1, 0, 0, 1, 1,
0.4359415, 1.913634, -1.158103, 1, 0, 0, 1, 1,
0.4388604, -1.291343, 2.750557, 1, 0, 0, 1, 1,
0.4409887, -1.039907, 3.079933, 1, 0, 0, 1, 1,
0.4450058, 0.131002, 1.105047, 1, 0, 0, 1, 1,
0.4489105, -0.06858347, 1.376811, 0, 0, 0, 1, 1,
0.4559394, 0.8398701, -0.713534, 0, 0, 0, 1, 1,
0.4564692, -0.09794233, 0.5643245, 0, 0, 0, 1, 1,
0.4566747, -1.032794, -0.286617, 0, 0, 0, 1, 1,
0.4597752, 1.114554, 0.2904487, 0, 0, 0, 1, 1,
0.4626607, -0.4643888, 2.875271, 0, 0, 0, 1, 1,
0.4639783, 0.3526637, 1.800157, 0, 0, 0, 1, 1,
0.4702774, 1.014368, 0.8136589, 1, 1, 1, 1, 1,
0.4714291, 0.1786431, 0.8672526, 1, 1, 1, 1, 1,
0.4717301, 1.939592, -0.7316809, 1, 1, 1, 1, 1,
0.4720465, 0.04606928, 2.988338, 1, 1, 1, 1, 1,
0.4771841, 1.095034, 2.416514, 1, 1, 1, 1, 1,
0.4786545, -0.7407235, 2.410838, 1, 1, 1, 1, 1,
0.4837634, 0.7492375, 0.6475738, 1, 1, 1, 1, 1,
0.4866956, -0.8669622, 2.859025, 1, 1, 1, 1, 1,
0.4877717, 0.06306041, 0.3560554, 1, 1, 1, 1, 1,
0.488254, 1.52236, 0.3276071, 1, 1, 1, 1, 1,
0.4906752, -2.06718, 2.499517, 1, 1, 1, 1, 1,
0.4918183, 1.364241, -0.1540767, 1, 1, 1, 1, 1,
0.4929461, -2.086165, 1.777088, 1, 1, 1, 1, 1,
0.4933839, -0.2721602, 3.688412, 1, 1, 1, 1, 1,
0.4952435, -1.547258, 2.798214, 1, 1, 1, 1, 1,
0.4986391, 0.002271347, 2.579456, 0, 0, 1, 1, 1,
0.5065038, 0.3164397, 1.729415, 1, 0, 0, 1, 1,
0.5073523, 0.6877813, 1.291554, 1, 0, 0, 1, 1,
0.5079895, -0.4882359, 3.17926, 1, 0, 0, 1, 1,
0.5090668, -1.974242, 2.601082, 1, 0, 0, 1, 1,
0.5093808, -0.02554076, 1.337503, 1, 0, 0, 1, 1,
0.5102857, -0.5957657, 3.171047, 0, 0, 0, 1, 1,
0.5112922, 0.04642786, 1.80295, 0, 0, 0, 1, 1,
0.5113632, 0.366539, 2.933767, 0, 0, 0, 1, 1,
0.5126548, -1.783673, 2.092454, 0, 0, 0, 1, 1,
0.5136003, 0.1744853, 1.669462, 0, 0, 0, 1, 1,
0.5141095, 0.243228, 1.44115, 0, 0, 0, 1, 1,
0.5171233, -1.999852, 1.896912, 0, 0, 0, 1, 1,
0.5218511, -0.0904007, 2.756994, 1, 1, 1, 1, 1,
0.5235709, 0.1586001, 0.8578376, 1, 1, 1, 1, 1,
0.5251976, -0.1699179, 0.4293421, 1, 1, 1, 1, 1,
0.5273803, 2.151711, 0.03518146, 1, 1, 1, 1, 1,
0.5279502, -1.260528, 3.216916, 1, 1, 1, 1, 1,
0.5361904, 0.5790495, 1.026154, 1, 1, 1, 1, 1,
0.5386995, 0.1237593, 0.2522313, 1, 1, 1, 1, 1,
0.539143, 0.7032321, 2.434769, 1, 1, 1, 1, 1,
0.5485358, -0.719319, 1.486607, 1, 1, 1, 1, 1,
0.5498224, 2.317074, -1.100708, 1, 1, 1, 1, 1,
0.5516732, 1.382166, -1.097199, 1, 1, 1, 1, 1,
0.5559731, 0.7655982, 0.9404544, 1, 1, 1, 1, 1,
0.5580992, 1.925581, -0.5334096, 1, 1, 1, 1, 1,
0.5595244, -1.408578, 3.599478, 1, 1, 1, 1, 1,
0.5602365, -0.6637015, 3.551063, 1, 1, 1, 1, 1,
0.5633367, -1.597242, 3.186457, 0, 0, 1, 1, 1,
0.5641261, 0.4087913, 1.116417, 1, 0, 0, 1, 1,
0.5683761, -0.8700079, 2.115474, 1, 0, 0, 1, 1,
0.5732986, -0.3219614, -0.2645305, 1, 0, 0, 1, 1,
0.5792193, -0.2928994, 0.2936971, 1, 0, 0, 1, 1,
0.581536, -0.07541557, 1.673909, 1, 0, 0, 1, 1,
0.5895105, 1.074301, 0.05105661, 0, 0, 0, 1, 1,
0.5909136, 0.3513854, 0.8536613, 0, 0, 0, 1, 1,
0.5973178, -1.204151, 3.222744, 0, 0, 0, 1, 1,
0.5976064, 0.6894245, -0.9700027, 0, 0, 0, 1, 1,
0.6005911, -0.6111603, 1.384576, 0, 0, 0, 1, 1,
0.6033474, 0.5578523, -0.3977011, 0, 0, 0, 1, 1,
0.6066129, 0.06971118, 1.133226, 0, 0, 0, 1, 1,
0.6109341, -0.1933351, 0.5716466, 1, 1, 1, 1, 1,
0.6123337, 0.1600059, 3.048865, 1, 1, 1, 1, 1,
0.6170313, 0.8967263, -0.1816873, 1, 1, 1, 1, 1,
0.6178079, 0.9972513, 0.3957425, 1, 1, 1, 1, 1,
0.6200054, -0.2304708, 2.468982, 1, 1, 1, 1, 1,
0.6200202, -0.2577585, 0.8585767, 1, 1, 1, 1, 1,
0.6209248, 0.6366323, 2.417106, 1, 1, 1, 1, 1,
0.6261739, 0.8254613, 1.168985, 1, 1, 1, 1, 1,
0.62715, -0.4346368, 1.958334, 1, 1, 1, 1, 1,
0.6350397, -0.004715997, 2.473584, 1, 1, 1, 1, 1,
0.6367033, 0.3845745, 1.380797, 1, 1, 1, 1, 1,
0.6367407, 2.059359, -1.241193, 1, 1, 1, 1, 1,
0.6418145, -0.4063084, 1.896575, 1, 1, 1, 1, 1,
0.6423161, 0.1150682, 1.843774, 1, 1, 1, 1, 1,
0.6437224, 0.1578072, 2.048746, 1, 1, 1, 1, 1,
0.6475826, 1.501198, 1.836546, 0, 0, 1, 1, 1,
0.6519012, 1.990797, -1.255146, 1, 0, 0, 1, 1,
0.6628987, 0.7755875, 1.24141, 1, 0, 0, 1, 1,
0.6652676, -1.154202, 2.723988, 1, 0, 0, 1, 1,
0.6677969, -0.7572786, 3.504001, 1, 0, 0, 1, 1,
0.6700155, 0.8339705, -0.5285879, 1, 0, 0, 1, 1,
0.6749163, 1.856893, -0.7249198, 0, 0, 0, 1, 1,
0.675982, -0.3436472, 3.456082, 0, 0, 0, 1, 1,
0.68571, -0.06105848, 0.04914594, 0, 0, 0, 1, 1,
0.6860258, 0.4504963, -0.4830455, 0, 0, 0, 1, 1,
0.6921114, -0.5795393, 1.226584, 0, 0, 0, 1, 1,
0.6926211, -0.9617407, 3.757204, 0, 0, 0, 1, 1,
0.6961732, 0.4191906, 2.488722, 0, 0, 0, 1, 1,
0.6973662, -0.005914568, 1.531695, 1, 1, 1, 1, 1,
0.6997401, -0.5309172, 1.151172, 1, 1, 1, 1, 1,
0.7042837, 0.1420051, 1.710483, 1, 1, 1, 1, 1,
0.7080734, 0.4673452, 1.279637, 1, 1, 1, 1, 1,
0.7088792, 0.6223379, 0.864391, 1, 1, 1, 1, 1,
0.7110344, 0.08977246, 1.969161, 1, 1, 1, 1, 1,
0.7125341, -1.280779, 1.67173, 1, 1, 1, 1, 1,
0.7132112, 0.8364469, -0.2600482, 1, 1, 1, 1, 1,
0.7156266, -0.8112403, 2.608696, 1, 1, 1, 1, 1,
0.724633, 0.5998088, 0.1180626, 1, 1, 1, 1, 1,
0.7271533, -0.6930161, 2.612668, 1, 1, 1, 1, 1,
0.7292084, -0.1823004, 1.230229, 1, 1, 1, 1, 1,
0.7320195, 0.1567625, 1.811048, 1, 1, 1, 1, 1,
0.7321296, 0.6601735, 1.119266, 1, 1, 1, 1, 1,
0.7351838, -0.3639936, 1.833364, 1, 1, 1, 1, 1,
0.7353794, 1.323053, 2.808362, 0, 0, 1, 1, 1,
0.7428794, -0.5952748, 3.251404, 1, 0, 0, 1, 1,
0.7445837, 0.2683529, 0.5702628, 1, 0, 0, 1, 1,
0.7529283, -1.251948, 3.572045, 1, 0, 0, 1, 1,
0.7667786, 0.8858816, 0.1864154, 1, 0, 0, 1, 1,
0.7716543, -0.4527927, 1.421972, 1, 0, 0, 1, 1,
0.7730366, -0.8572831, 1.341821, 0, 0, 0, 1, 1,
0.7736081, 0.9213388, -1.074216, 0, 0, 0, 1, 1,
0.7747475, -0.0239852, 1.680177, 0, 0, 0, 1, 1,
0.7754397, -0.2065286, 2.426221, 0, 0, 0, 1, 1,
0.7782435, 0.6340964, 2.910233, 0, 0, 0, 1, 1,
0.7800182, -0.04846529, 2.111702, 0, 0, 0, 1, 1,
0.7837836, -1.8223, 2.157193, 0, 0, 0, 1, 1,
0.7883831, 1.379309, -0.6743509, 1, 1, 1, 1, 1,
0.7941679, 0.1128599, 0.1565382, 1, 1, 1, 1, 1,
0.7992023, -0.1874361, 3.090255, 1, 1, 1, 1, 1,
0.7997049, 0.03393855, 1.53487, 1, 1, 1, 1, 1,
0.8008137, -0.760972, 2.609692, 1, 1, 1, 1, 1,
0.8022287, -1.213282, 3.609273, 1, 1, 1, 1, 1,
0.8097278, 0.8191288, 1.282505, 1, 1, 1, 1, 1,
0.8116092, 0.8745314, 0.7312288, 1, 1, 1, 1, 1,
0.8118679, 0.8610854, 1.355948, 1, 1, 1, 1, 1,
0.8252295, -1.045841, 3.2606, 1, 1, 1, 1, 1,
0.8273757, -0.4673145, 1.360108, 1, 1, 1, 1, 1,
0.8370554, 0.1519184, 2.917381, 1, 1, 1, 1, 1,
0.8436052, 0.9043468, 1.319738, 1, 1, 1, 1, 1,
0.8521749, -0.3208414, 0.1855884, 1, 1, 1, 1, 1,
0.8527139, 0.7673411, 1.289524, 1, 1, 1, 1, 1,
0.8535656, 0.1417527, 1.453615, 0, 0, 1, 1, 1,
0.8564324, -1.276088, 1.941481, 1, 0, 0, 1, 1,
0.8583797, -0.01765469, 1.74669, 1, 0, 0, 1, 1,
0.8591023, -0.096967, 1.686978, 1, 0, 0, 1, 1,
0.8597013, -0.03457154, 0.9724408, 1, 0, 0, 1, 1,
0.8694409, 2.489042, 0.5215339, 1, 0, 0, 1, 1,
0.8714302, -0.3785463, 2.485004, 0, 0, 0, 1, 1,
0.8754442, -1.522719, 1.927584, 0, 0, 0, 1, 1,
0.8766236, 0.5497686, 1.413754, 0, 0, 0, 1, 1,
0.8774976, -0.609452, 2.879838, 0, 0, 0, 1, 1,
0.8782091, 0.1251232, 3.337848, 0, 0, 0, 1, 1,
0.8803418, -0.1062914, 3.185214, 0, 0, 0, 1, 1,
0.8860767, 0.4169134, 1.355617, 0, 0, 0, 1, 1,
0.8877198, -2.019921, 2.866064, 1, 1, 1, 1, 1,
0.8898251, -0.4723672, 2.005866, 1, 1, 1, 1, 1,
0.8898417, -0.2219709, 4.051151, 1, 1, 1, 1, 1,
0.8900474, 1.277129, 0.1519137, 1, 1, 1, 1, 1,
0.8931433, 0.243838, 1.427576, 1, 1, 1, 1, 1,
0.8934991, 1.679601, 0.257293, 1, 1, 1, 1, 1,
0.896044, -0.4527042, 2.027806, 1, 1, 1, 1, 1,
0.8985742, -1.041358, 1.049146, 1, 1, 1, 1, 1,
0.8994836, 0.1964914, 0.33394, 1, 1, 1, 1, 1,
0.9040648, 0.8315675, 1.791812, 1, 1, 1, 1, 1,
0.9080042, -2.207772, 3.916315, 1, 1, 1, 1, 1,
0.9082891, 0.3433293, 1.191109, 1, 1, 1, 1, 1,
0.9231402, 0.7348497, 0.4465105, 1, 1, 1, 1, 1,
0.9232263, -0.175584, 1.49035, 1, 1, 1, 1, 1,
0.9246056, -0.2576433, 2.685663, 1, 1, 1, 1, 1,
0.9449973, -2.192929, 1.823136, 0, 0, 1, 1, 1,
0.9475868, 1.512125, -0.7912291, 1, 0, 0, 1, 1,
0.9490352, -0.2514466, 1.642598, 1, 0, 0, 1, 1,
0.9498952, -0.7661703, 1.936959, 1, 0, 0, 1, 1,
0.9502453, 0.04154146, 1.412413, 1, 0, 0, 1, 1,
0.9575659, 0.8855752, -0.2517006, 1, 0, 0, 1, 1,
0.9593815, 1.275651, -0.6678283, 0, 0, 0, 1, 1,
0.9599015, -1.427723, 3.877161, 0, 0, 0, 1, 1,
0.9602471, -1.291286, 2.171834, 0, 0, 0, 1, 1,
0.9640864, 0.06399032, 0.8669503, 0, 0, 0, 1, 1,
0.977229, 0.003618618, 2.404792, 0, 0, 0, 1, 1,
0.9774652, -0.9772948, 2.763048, 0, 0, 0, 1, 1,
0.9871469, -0.9400775, 1.142387, 0, 0, 0, 1, 1,
0.9890529, -0.03851077, 1.490419, 1, 1, 1, 1, 1,
1.0026, 0.05191918, 0.9370057, 1, 1, 1, 1, 1,
1.021869, -0.03239429, 0.6409017, 1, 1, 1, 1, 1,
1.029042, 1.21048, -0.9678196, 1, 1, 1, 1, 1,
1.030773, 0.5077399, 0.1039292, 1, 1, 1, 1, 1,
1.031288, 0.3283578, 2.509374, 1, 1, 1, 1, 1,
1.036272, 0.5514854, -0.1188435, 1, 1, 1, 1, 1,
1.039913, -0.1600558, 1.565728, 1, 1, 1, 1, 1,
1.046356, 2.651506, 1.361602, 1, 1, 1, 1, 1,
1.049715, -0.4121508, 1.906596, 1, 1, 1, 1, 1,
1.055279, 0.1974243, 2.251353, 1, 1, 1, 1, 1,
1.058321, 1.155239, 0.4143619, 1, 1, 1, 1, 1,
1.058642, -0.2123453, 1.309451, 1, 1, 1, 1, 1,
1.067119, 1.457205, 1.811273, 1, 1, 1, 1, 1,
1.082234, -2.309748, 3.432855, 1, 1, 1, 1, 1,
1.089807, 1.017558, -0.4104255, 0, 0, 1, 1, 1,
1.093969, 0.6421027, 1.670418, 1, 0, 0, 1, 1,
1.09653, -0.5038002, 2.533634, 1, 0, 0, 1, 1,
1.101199, -0.3004358, 0.09628654, 1, 0, 0, 1, 1,
1.108095, -0.4933718, 2.37175, 1, 0, 0, 1, 1,
1.110019, 0.6912834, 0.5833076, 1, 0, 0, 1, 1,
1.110421, -0.6042293, 0.6794587, 0, 0, 0, 1, 1,
1.118127, 0.7381108, 1.0768, 0, 0, 0, 1, 1,
1.119563, 0.1006631, 0.7252546, 0, 0, 0, 1, 1,
1.124571, 0.1345682, 1.864974, 0, 0, 0, 1, 1,
1.127245, 1.709206, 0.4363446, 0, 0, 0, 1, 1,
1.129848, 2.556611, 2.443308, 0, 0, 0, 1, 1,
1.13141, -1.682288, 1.14187, 0, 0, 0, 1, 1,
1.131838, 0.2257886, 0.5352342, 1, 1, 1, 1, 1,
1.133022, -0.05196137, 0.91316, 1, 1, 1, 1, 1,
1.138241, 0.017688, 2.756076, 1, 1, 1, 1, 1,
1.149058, 0.09824187, 1.275295, 1, 1, 1, 1, 1,
1.160077, 0.8391826, -1.362635, 1, 1, 1, 1, 1,
1.160486, -1.66713, 2.556782, 1, 1, 1, 1, 1,
1.167658, -1.74806, 2.451348, 1, 1, 1, 1, 1,
1.185743, -0.8567616, 0.7141587, 1, 1, 1, 1, 1,
1.187959, -0.09740859, 2.389089, 1, 1, 1, 1, 1,
1.190599, 0.9512248, 0.9803863, 1, 1, 1, 1, 1,
1.191273, 0.2920664, 2.301291, 1, 1, 1, 1, 1,
1.194734, -0.106871, 2.439086, 1, 1, 1, 1, 1,
1.195003, -0.5970949, 0.9705136, 1, 1, 1, 1, 1,
1.201938, 0.3680013, 2.97774, 1, 1, 1, 1, 1,
1.210463, -0.6860889, 2.623663, 1, 1, 1, 1, 1,
1.210973, -0.01238985, 2.389951, 0, 0, 1, 1, 1,
1.21143, -0.8609961, 2.460874, 1, 0, 0, 1, 1,
1.217909, -1.792974, 2.735588, 1, 0, 0, 1, 1,
1.2183, 2.907771, -1.377763, 1, 0, 0, 1, 1,
1.220268, -1.583224, 2.659549, 1, 0, 0, 1, 1,
1.229961, 0.6445231, -0.04441832, 1, 0, 0, 1, 1,
1.232805, -0.5836146, 1.327216, 0, 0, 0, 1, 1,
1.233008, 0.7169735, 0.6684868, 0, 0, 0, 1, 1,
1.235252, 0.08656762, 0.9666193, 0, 0, 0, 1, 1,
1.242042, 0.811222, 0.1462093, 0, 0, 0, 1, 1,
1.242672, -0.999616, 2.097679, 0, 0, 0, 1, 1,
1.247385, -0.76747, 2.154128, 0, 0, 0, 1, 1,
1.249722, 0.7512932, 0.3782229, 0, 0, 0, 1, 1,
1.261434, 1.381286, 1.109999, 1, 1, 1, 1, 1,
1.26546, -0.7053598, 3.226629, 1, 1, 1, 1, 1,
1.283033, 0.2382526, 1.505958, 1, 1, 1, 1, 1,
1.283984, 0.7313513, 0.7277821, 1, 1, 1, 1, 1,
1.287831, -1.41293, 2.006604, 1, 1, 1, 1, 1,
1.309785, 0.6037125, 1.988563, 1, 1, 1, 1, 1,
1.313434, -0.3042694, 1.723743, 1, 1, 1, 1, 1,
1.316161, 0.7320075, 3.013855, 1, 1, 1, 1, 1,
1.323154, -1.511554, 2.60691, 1, 1, 1, 1, 1,
1.331846, 0.2561191, 2.584625, 1, 1, 1, 1, 1,
1.340535, -0.5175408, 2.285619, 1, 1, 1, 1, 1,
1.347051, -2.279521, 4.129993, 1, 1, 1, 1, 1,
1.370157, 0.7093903, 0.4486691, 1, 1, 1, 1, 1,
1.370913, 0.0997434, 1.72226, 1, 1, 1, 1, 1,
1.372975, 3.104517, 0.2842652, 1, 1, 1, 1, 1,
1.379899, 1.575881, 0.07377789, 0, 0, 1, 1, 1,
1.383959, -0.5603347, 1.457705, 1, 0, 0, 1, 1,
1.384277, -1.418597, 1.159896, 1, 0, 0, 1, 1,
1.408298, 0.05285253, 2.547138, 1, 0, 0, 1, 1,
1.431348, -0.9520735, 2.204625, 1, 0, 0, 1, 1,
1.434387, -0.06134924, 0.5628585, 1, 0, 0, 1, 1,
1.434832, 0.1314855, 1.038512, 0, 0, 0, 1, 1,
1.448007, -0.8695082, 1.505726, 0, 0, 0, 1, 1,
1.448303, 0.02120098, 0.7411797, 0, 0, 0, 1, 1,
1.450827, -0.09067239, 2.86677, 0, 0, 0, 1, 1,
1.454927, -0.4116385, 2.101747, 0, 0, 0, 1, 1,
1.455851, -0.05357349, 3.62517, 0, 0, 0, 1, 1,
1.4647, 2.10569, 0.1446782, 0, 0, 0, 1, 1,
1.498929, -0.3068168, 2.716857, 1, 1, 1, 1, 1,
1.503777, 0.4128475, 4.853391, 1, 1, 1, 1, 1,
1.513509, 1.408392, 0.8764342, 1, 1, 1, 1, 1,
1.513837, -0.5899873, 2.202351, 1, 1, 1, 1, 1,
1.516424, -0.4391362, 1.619959, 1, 1, 1, 1, 1,
1.525476, -2.828202, 1.880337, 1, 1, 1, 1, 1,
1.538411, -0.1034235, 2.634705, 1, 1, 1, 1, 1,
1.53987, -1.373996, 2.751941, 1, 1, 1, 1, 1,
1.541218, 0.8350443, 1.923588, 1, 1, 1, 1, 1,
1.543667, 0.7611231, 0.1611622, 1, 1, 1, 1, 1,
1.565298, 0.04078216, -0.113945, 1, 1, 1, 1, 1,
1.579204, 0.7123672, 1.438404, 1, 1, 1, 1, 1,
1.582131, 0.9193512, 0.311866, 1, 1, 1, 1, 1,
1.605207, -1.2991, 2.854014, 1, 1, 1, 1, 1,
1.631181, -0.1972443, 2.009361, 1, 1, 1, 1, 1,
1.639239, -0.767876, 2.190035, 0, 0, 1, 1, 1,
1.646975, 1.899255, 0.5924332, 1, 0, 0, 1, 1,
1.681591, -0.001275314, 1.698988, 1, 0, 0, 1, 1,
1.713417, -0.7073909, 1.749539, 1, 0, 0, 1, 1,
1.713618, -0.3685197, 2.208082, 1, 0, 0, 1, 1,
1.722577, -1.748089, 2.460531, 1, 0, 0, 1, 1,
1.730497, -0.4387655, 0.49387, 0, 0, 0, 1, 1,
1.753049, -0.1392168, 0.3866063, 0, 0, 0, 1, 1,
1.759823, 1.038247, 1.256106, 0, 0, 0, 1, 1,
1.766277, -2.073667, 0.002905281, 0, 0, 0, 1, 1,
1.772741, 0.1514851, 1.102278, 0, 0, 0, 1, 1,
1.779448, -0.4876525, 3.731155, 0, 0, 0, 1, 1,
1.780007, 1.34425, 1.916763, 0, 0, 0, 1, 1,
1.78604, -0.3468795, 1.847953, 1, 1, 1, 1, 1,
1.813369, 0.2003796, 0.6255849, 1, 1, 1, 1, 1,
1.819699, -1.161191, 2.711389, 1, 1, 1, 1, 1,
1.825009, 1.788059, 3.705597, 1, 1, 1, 1, 1,
1.833529, -0.9517746, 2.628919, 1, 1, 1, 1, 1,
1.835018, 1.043373, 1.118218, 1, 1, 1, 1, 1,
1.835272, -0.01027371, 0.6896366, 1, 1, 1, 1, 1,
1.841344, 0.3873753, 0.8008305, 1, 1, 1, 1, 1,
1.867018, -0.5632144, 1.851058, 1, 1, 1, 1, 1,
1.874438, -0.8940144, 1.990064, 1, 1, 1, 1, 1,
1.877144, 0.7036825, 2.784359, 1, 1, 1, 1, 1,
1.884002, 0.6052465, 1.020755, 1, 1, 1, 1, 1,
1.909794, -0.6051326, 1.928778, 1, 1, 1, 1, 1,
1.914438, 1.063682, 0.5803941, 1, 1, 1, 1, 1,
1.940388, -1.727875, 1.931693, 1, 1, 1, 1, 1,
1.9749, -1.013175, 3.151523, 0, 0, 1, 1, 1,
1.975882, 1.073327, -0.9162115, 1, 0, 0, 1, 1,
1.978199, 0.3138267, 2.899738, 1, 0, 0, 1, 1,
1.993277, -0.8591549, 2.506532, 1, 0, 0, 1, 1,
1.997365, -0.7332801, 2.400704, 1, 0, 0, 1, 1,
2.021225, 0.704859, -0.06071614, 1, 0, 0, 1, 1,
2.021989, 0.09648477, 2.244214, 0, 0, 0, 1, 1,
2.025933, -0.4450293, 1.213309, 0, 0, 0, 1, 1,
2.045382, -0.2300072, 2.212958, 0, 0, 0, 1, 1,
2.074151, -0.6532104, 1.966, 0, 0, 0, 1, 1,
2.080513, 1.379519, 1.391806, 0, 0, 0, 1, 1,
2.145849, -0.04417066, 2.95151, 0, 0, 0, 1, 1,
2.176608, -0.5934533, 1.517271, 0, 0, 0, 1, 1,
2.186089, 0.08097505, 1.072156, 1, 1, 1, 1, 1,
2.211382, -0.1565011, 2.063371, 1, 1, 1, 1, 1,
2.283416, -0.5399698, 1.986986, 1, 1, 1, 1, 1,
2.695202, -0.5719752, 1.257083, 1, 1, 1, 1, 1,
2.710282, 2.828269, 0.1133418, 1, 1, 1, 1, 1,
3.128124, 0.9287967, 2.102139, 1, 1, 1, 1, 1,
3.429742, 1.07839, 0.1212456, 1, 1, 1, 1, 1
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
var radius = 9.856755;
var distance = 34.62143;
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
mvMatrix.translate( -0.02363706, 0.07438278, 0.1862159 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.62143);
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
