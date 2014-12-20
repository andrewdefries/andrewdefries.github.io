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
-2.868631, 0.02233576, -3.546049, 1, 0, 0, 1,
-2.792849, -2.727522, -1.564222, 1, 0.007843138, 0, 1,
-2.75578, 0.1981123, -0.7645077, 1, 0.01176471, 0, 1,
-2.741162, -0.2140466, -2.056521, 1, 0.01960784, 0, 1,
-2.702306, -1.899309, -2.468943, 1, 0.02352941, 0, 1,
-2.604564, 0.5363413, -0.8888243, 1, 0.03137255, 0, 1,
-2.554576, 0.516905, -3.198679, 1, 0.03529412, 0, 1,
-2.523097, -0.5311581, -2.644453, 1, 0.04313726, 0, 1,
-2.505939, -0.8929546, -1.45622, 1, 0.04705882, 0, 1,
-2.468787, -0.9572973, -1.693169, 1, 0.05490196, 0, 1,
-2.448493, -0.7469832, -2.680771, 1, 0.05882353, 0, 1,
-2.43517, 0.004424623, -1.566444, 1, 0.06666667, 0, 1,
-2.406133, 1.270481, -1.701233, 1, 0.07058824, 0, 1,
-2.400748, -1.802174, -3.562438, 1, 0.07843138, 0, 1,
-2.185328, 0.3093689, -2.580378, 1, 0.08235294, 0, 1,
-2.165838, 1.113622, -0.378027, 1, 0.09019608, 0, 1,
-2.143243, -0.2513962, -0.7867586, 1, 0.09411765, 0, 1,
-2.086379, 1.217413, -1.021092, 1, 0.1019608, 0, 1,
-2.058857, -0.2105614, -1.799531, 1, 0.1098039, 0, 1,
-2.048266, -1.230637, -2.42939, 1, 0.1137255, 0, 1,
-2.048001, -0.3201854, -1.721138, 1, 0.1215686, 0, 1,
-2.033312, 0.9234113, -3.264034, 1, 0.1254902, 0, 1,
-2.027625, -1.263211, -2.968198, 1, 0.1333333, 0, 1,
-2.021331, -0.02074544, 0.3694822, 1, 0.1372549, 0, 1,
-1.99762, 0.8209513, -0.5153415, 1, 0.145098, 0, 1,
-1.963003, 1.252772, -2.056386, 1, 0.1490196, 0, 1,
-1.939871, -0.3918813, -2.080785, 1, 0.1568628, 0, 1,
-1.936561, -0.4035483, -0.4433354, 1, 0.1607843, 0, 1,
-1.936038, -0.01579081, -2.494754, 1, 0.1686275, 0, 1,
-1.935451, -1.955644, -3.187158, 1, 0.172549, 0, 1,
-1.931779, -0.05663061, -1.848086, 1, 0.1803922, 0, 1,
-1.920916, -1.041425, -2.598049, 1, 0.1843137, 0, 1,
-1.900628, 1.240834, 1.115213, 1, 0.1921569, 0, 1,
-1.87348, -1.195831, -2.008985, 1, 0.1960784, 0, 1,
-1.869515, 0.3649453, -2.238446, 1, 0.2039216, 0, 1,
-1.867995, -0.6375997, -2.317203, 1, 0.2117647, 0, 1,
-1.851616, -0.7082502, -1.936194, 1, 0.2156863, 0, 1,
-1.849195, 0.07137702, -2.388753, 1, 0.2235294, 0, 1,
-1.835936, 0.7453158, -0.9774892, 1, 0.227451, 0, 1,
-1.784401, -0.1436894, -0.5156463, 1, 0.2352941, 0, 1,
-1.773878, 0.008091888, -2.478157, 1, 0.2392157, 0, 1,
-1.76588, -1.194556, -2.815855, 1, 0.2470588, 0, 1,
-1.751525, -1.52546, -0.6943709, 1, 0.2509804, 0, 1,
-1.743327, 0.3392821, -2.542256, 1, 0.2588235, 0, 1,
-1.716554, -2.457754, -1.919437, 1, 0.2627451, 0, 1,
-1.713349, 0.9284381, -2.165927, 1, 0.2705882, 0, 1,
-1.705031, -1.322147, -2.291342, 1, 0.2745098, 0, 1,
-1.692795, 0.00628959, -0.5293435, 1, 0.282353, 0, 1,
-1.672303, 0.7442273, -2.74733, 1, 0.2862745, 0, 1,
-1.668933, 0.5637279, -0.4940226, 1, 0.2941177, 0, 1,
-1.656795, 0.02961144, -0.7835777, 1, 0.3019608, 0, 1,
-1.648928, 1.480422, 0.2521851, 1, 0.3058824, 0, 1,
-1.616444, -0.112489, -1.597773, 1, 0.3137255, 0, 1,
-1.612793, 1.70391, 0.04688033, 1, 0.3176471, 0, 1,
-1.604535, -0.5307899, 0.202175, 1, 0.3254902, 0, 1,
-1.588574, -0.3255424, -2.397551, 1, 0.3294118, 0, 1,
-1.577076, 1.72175, 0.85554, 1, 0.3372549, 0, 1,
-1.56461, -0.1668844, -1.90992, 1, 0.3411765, 0, 1,
-1.563711, -0.2448911, -2.805238, 1, 0.3490196, 0, 1,
-1.547522, -0.9418283, -2.037865, 1, 0.3529412, 0, 1,
-1.540951, -0.9895306, -3.966674, 1, 0.3607843, 0, 1,
-1.534439, -2.478706, -1.601921, 1, 0.3647059, 0, 1,
-1.529335, 0.06478204, -1.630568, 1, 0.372549, 0, 1,
-1.509812, 0.9383998, -1.891245, 1, 0.3764706, 0, 1,
-1.505057, 0.4717922, 1.416876, 1, 0.3843137, 0, 1,
-1.485314, -1.052182, -1.616901, 1, 0.3882353, 0, 1,
-1.485261, -0.1548051, -2.941635, 1, 0.3960784, 0, 1,
-1.484765, 0.940991, -2.017854, 1, 0.4039216, 0, 1,
-1.477415, -0.3378351, -3.213438, 1, 0.4078431, 0, 1,
-1.471746, 1.397526, -1.528554, 1, 0.4156863, 0, 1,
-1.460229, 0.5887059, -0.06574803, 1, 0.4196078, 0, 1,
-1.445684, -0.7667426, -1.439781, 1, 0.427451, 0, 1,
-1.441745, 0.3440642, -0.7179674, 1, 0.4313726, 0, 1,
-1.433564, 0.2541057, -2.535112, 1, 0.4392157, 0, 1,
-1.433104, -0.6787232, -2.007157, 1, 0.4431373, 0, 1,
-1.424945, -1.039147, -1.933654, 1, 0.4509804, 0, 1,
-1.420432, 0.7995389, -0.491627, 1, 0.454902, 0, 1,
-1.418841, -0.5793858, -0.503319, 1, 0.4627451, 0, 1,
-1.418377, 0.1567703, -2.164367, 1, 0.4666667, 0, 1,
-1.414549, 1.028492, -0.6457353, 1, 0.4745098, 0, 1,
-1.413373, 0.9178474, -0.8170595, 1, 0.4784314, 0, 1,
-1.412121, 0.9968578, -1.156587, 1, 0.4862745, 0, 1,
-1.390641, -0.6328742, -1.502239, 1, 0.4901961, 0, 1,
-1.380927, 0.2317696, -1.681365, 1, 0.4980392, 0, 1,
-1.380479, 0.006267727, -2.213211, 1, 0.5058824, 0, 1,
-1.377439, 0.8138554, -0.2524915, 1, 0.509804, 0, 1,
-1.37281, 0.6737176, -0.5735571, 1, 0.5176471, 0, 1,
-1.367077, -0.02368759, -3.010038, 1, 0.5215687, 0, 1,
-1.351379, 0.4635851, 0.01746125, 1, 0.5294118, 0, 1,
-1.341793, 0.1469792, -0.7290435, 1, 0.5333334, 0, 1,
-1.333998, -0.2998828, -1.780191, 1, 0.5411765, 0, 1,
-1.333832, -0.04252351, -1.18886, 1, 0.5450981, 0, 1,
-1.32989, -0.4650149, -1.787589, 1, 0.5529412, 0, 1,
-1.326976, -0.3764111, -3.382766, 1, 0.5568628, 0, 1,
-1.323596, -0.1137164, -1.359686, 1, 0.5647059, 0, 1,
-1.322124, -0.9647847, -2.726778, 1, 0.5686275, 0, 1,
-1.317981, 1.327383, -0.9854233, 1, 0.5764706, 0, 1,
-1.311164, 0.03901772, -0.1392778, 1, 0.5803922, 0, 1,
-1.305472, -0.05618189, -1.077648, 1, 0.5882353, 0, 1,
-1.304601, -0.1415979, -1.460224, 1, 0.5921569, 0, 1,
-1.302859, -0.3771899, -0.7666191, 1, 0.6, 0, 1,
-1.294049, -0.8799514, -1.984362, 1, 0.6078432, 0, 1,
-1.287418, -0.336684, -1.781711, 1, 0.6117647, 0, 1,
-1.284961, -0.820308, -2.221604, 1, 0.6196079, 0, 1,
-1.277592, 0.8293233, 1.340037, 1, 0.6235294, 0, 1,
-1.265745, 0.8437099, -1.291094, 1, 0.6313726, 0, 1,
-1.259122, 0.9101408, 0.2093988, 1, 0.6352941, 0, 1,
-1.25687, -0.3651618, -2.140314, 1, 0.6431373, 0, 1,
-1.255287, -3.441641, -0.8556277, 1, 0.6470588, 0, 1,
-1.253588, -0.8403569, -2.67457, 1, 0.654902, 0, 1,
-1.248903, -0.6776661, -4.005565, 1, 0.6588235, 0, 1,
-1.236594, -0.1965376, -2.503294, 1, 0.6666667, 0, 1,
-1.235127, 0.1351484, -2.102354, 1, 0.6705883, 0, 1,
-1.218892, 2.355779, -0.2750212, 1, 0.6784314, 0, 1,
-1.218044, -0.08587985, -2.093377, 1, 0.682353, 0, 1,
-1.212792, 0.3520511, -2.940985, 1, 0.6901961, 0, 1,
-1.20411, -0.2788179, -1.300363, 1, 0.6941177, 0, 1,
-1.201469, 0.2144247, -2.089456, 1, 0.7019608, 0, 1,
-1.198128, -0.7532276, -3.291185, 1, 0.7098039, 0, 1,
-1.186188, 0.2053488, -2.225568, 1, 0.7137255, 0, 1,
-1.156907, 0.6198934, -0.6849375, 1, 0.7215686, 0, 1,
-1.156005, 0.9292006, -0.2699429, 1, 0.7254902, 0, 1,
-1.153123, 0.8487249, -0.2432307, 1, 0.7333333, 0, 1,
-1.144359, 1.527557, -0.5481137, 1, 0.7372549, 0, 1,
-1.144181, -1.340663, -1.946006, 1, 0.7450981, 0, 1,
-1.13935, 0.6773911, 0.06801715, 1, 0.7490196, 0, 1,
-1.139019, -2.372606, -2.350348, 1, 0.7568628, 0, 1,
-1.126074, 1.393229, -1.797236, 1, 0.7607843, 0, 1,
-1.113742, -0.4180683, -1.300408, 1, 0.7686275, 0, 1,
-1.109632, 0.7925558, 0.9002923, 1, 0.772549, 0, 1,
-1.098344, 1.341605, -1.389056, 1, 0.7803922, 0, 1,
-1.0978, 0.784658, -1.12689, 1, 0.7843137, 0, 1,
-1.090518, 1.300982, -3.174264, 1, 0.7921569, 0, 1,
-1.076801, -0.5967181, -2.108731, 1, 0.7960784, 0, 1,
-1.076198, -1.224532, -2.982691, 1, 0.8039216, 0, 1,
-1.066146, 1.178078, -1.99349, 1, 0.8117647, 0, 1,
-1.063249, 1.732262, 0.8436564, 1, 0.8156863, 0, 1,
-1.058097, -0.8364735, -1.853495, 1, 0.8235294, 0, 1,
-1.052227, -1.034292, -1.817017, 1, 0.827451, 0, 1,
-1.047959, -0.8133189, -2.340959, 1, 0.8352941, 0, 1,
-1.040666, -0.6108898, -1.119509, 1, 0.8392157, 0, 1,
-1.039178, 1.115371, -0.7465505, 1, 0.8470588, 0, 1,
-1.032958, 0.9678381, -1.480021, 1, 0.8509804, 0, 1,
-1.025628, -0.4566864, -1.565244, 1, 0.8588235, 0, 1,
-1.02412, 1.5322, -1.174119, 1, 0.8627451, 0, 1,
-1.022232, 0.3493567, -1.259218, 1, 0.8705882, 0, 1,
-1.013862, 0.04151579, -2.365861, 1, 0.8745098, 0, 1,
-1.007155, 0.8203413, -1.856741, 1, 0.8823529, 0, 1,
-0.9997184, -0.312992, -1.830669, 1, 0.8862745, 0, 1,
-0.9984829, -0.8443744, -2.407736, 1, 0.8941177, 0, 1,
-0.9949717, -1.419864, -1.684732, 1, 0.8980392, 0, 1,
-0.9923561, -0.7653526, -1.223184, 1, 0.9058824, 0, 1,
-0.9895287, -0.1603053, -1.787317, 1, 0.9137255, 0, 1,
-0.9880792, 0.6785921, -1.248947, 1, 0.9176471, 0, 1,
-0.9858733, 1.505597, 0.7962927, 1, 0.9254902, 0, 1,
-0.9830923, 0.06533486, -0.6601591, 1, 0.9294118, 0, 1,
-0.981373, 0.6764299, -0.2559747, 1, 0.9372549, 0, 1,
-0.9798309, 0.5001781, -2.344198, 1, 0.9411765, 0, 1,
-0.973259, -0.3625564, -3.69687, 1, 0.9490196, 0, 1,
-0.9727795, -1.339381, -2.473717, 1, 0.9529412, 0, 1,
-0.9685066, -1.204146, -2.06148, 1, 0.9607843, 0, 1,
-0.968223, 0.1573706, -3.812722, 1, 0.9647059, 0, 1,
-0.9674177, -0.01244753, -1.081205, 1, 0.972549, 0, 1,
-0.9655212, -0.3617499, -3.653605, 1, 0.9764706, 0, 1,
-0.9610779, 0.04865383, -0.7889644, 1, 0.9843137, 0, 1,
-0.9605174, -0.6944512, -3.143948, 1, 0.9882353, 0, 1,
-0.9601361, 0.4378216, -0.1511414, 1, 0.9960784, 0, 1,
-0.9578947, -1.475229, -3.647325, 0.9960784, 1, 0, 1,
-0.9465136, -0.2750263, -1.981998, 0.9921569, 1, 0, 1,
-0.9388163, 1.00349, 0.3650579, 0.9843137, 1, 0, 1,
-0.9373054, -1.757814, -1.448531, 0.9803922, 1, 0, 1,
-0.9340137, -0.5997643, -0.7907138, 0.972549, 1, 0, 1,
-0.9336572, -1.062465, -1.801924, 0.9686275, 1, 0, 1,
-0.9291881, -0.9108182, -3.484539, 0.9607843, 1, 0, 1,
-0.9213203, -0.2453756, -3.500655, 0.9568627, 1, 0, 1,
-0.9183845, -0.5966701, -2.683276, 0.9490196, 1, 0, 1,
-0.9156409, 0.3949431, -1.633707, 0.945098, 1, 0, 1,
-0.9144719, -1.429372, -3.073659, 0.9372549, 1, 0, 1,
-0.9077583, 0.5965426, -2.286086, 0.9333333, 1, 0, 1,
-0.9057821, -1.227, -2.15767, 0.9254902, 1, 0, 1,
-0.9048945, 0.3534762, 0.2441541, 0.9215686, 1, 0, 1,
-0.9041788, -0.4179836, -1.48209, 0.9137255, 1, 0, 1,
-0.9014208, 0.4467577, -1.364365, 0.9098039, 1, 0, 1,
-0.9010367, 0.05288219, -1.034109, 0.9019608, 1, 0, 1,
-0.8991594, -1.356758, -2.639522, 0.8941177, 1, 0, 1,
-0.8980194, -1.216091, -0.7669907, 0.8901961, 1, 0, 1,
-0.8953752, 0.4089319, -1.761472, 0.8823529, 1, 0, 1,
-0.8901204, 0.2590675, -1.63519, 0.8784314, 1, 0, 1,
-0.8837489, -1.052803, -3.510569, 0.8705882, 1, 0, 1,
-0.8828149, -1.252695, -2.371438, 0.8666667, 1, 0, 1,
-0.8803679, 0.9919891, -0.4749883, 0.8588235, 1, 0, 1,
-0.8766397, 1.198817, -1.885749, 0.854902, 1, 0, 1,
-0.8750455, -0.6420048, -1.952344, 0.8470588, 1, 0, 1,
-0.8740731, -0.6060935, -3.130925, 0.8431373, 1, 0, 1,
-0.8671733, 0.3685624, -0.240932, 0.8352941, 1, 0, 1,
-0.8653758, 0.4779804, -1.993417, 0.8313726, 1, 0, 1,
-0.8618241, 0.1248436, -0.9768798, 0.8235294, 1, 0, 1,
-0.8415799, 1.401938, -0.1766891, 0.8196079, 1, 0, 1,
-0.8414392, 0.7241417, 0.5696412, 0.8117647, 1, 0, 1,
-0.8357431, -0.8848999, -3.199829, 0.8078431, 1, 0, 1,
-0.8321369, 2.051073, 1.795059, 0.8, 1, 0, 1,
-0.8295419, -0.3388444, 0.1164889, 0.7921569, 1, 0, 1,
-0.8294278, 0.8010734, -0.6013771, 0.7882353, 1, 0, 1,
-0.8212426, -0.01960661, -3.515361, 0.7803922, 1, 0, 1,
-0.8164409, -0.1219407, -3.389697, 0.7764706, 1, 0, 1,
-0.8082151, -0.4302205, -2.850519, 0.7686275, 1, 0, 1,
-0.8063762, -1.73097, -1.368912, 0.7647059, 1, 0, 1,
-0.8022333, -0.166895, -2.565253, 0.7568628, 1, 0, 1,
-0.8013706, 0.3826378, -1.138007, 0.7529412, 1, 0, 1,
-0.7997531, -0.2091365, -2.144321, 0.7450981, 1, 0, 1,
-0.7969207, -1.114019, -3.080807, 0.7411765, 1, 0, 1,
-0.7933758, 0.9677684, -1.210622, 0.7333333, 1, 0, 1,
-0.7919829, 1.469906, 0.4400931, 0.7294118, 1, 0, 1,
-0.7901087, -0.9577392, -3.61696, 0.7215686, 1, 0, 1,
-0.7871814, -1.514114, -4.249076, 0.7176471, 1, 0, 1,
-0.7790486, 1.285311, -0.1727348, 0.7098039, 1, 0, 1,
-0.7759958, 0.02205844, -1.434496, 0.7058824, 1, 0, 1,
-0.775949, 0.4109015, -1.46293, 0.6980392, 1, 0, 1,
-0.7748932, -0.4502679, -2.257973, 0.6901961, 1, 0, 1,
-0.7740336, -0.06659416, 0.04172729, 0.6862745, 1, 0, 1,
-0.7721753, -0.2705573, -0.9175839, 0.6784314, 1, 0, 1,
-0.770655, 0.3601835, -1.326326, 0.6745098, 1, 0, 1,
-0.7702417, -0.5721858, -2.219627, 0.6666667, 1, 0, 1,
-0.7685783, 0.9056402, -1.006151, 0.6627451, 1, 0, 1,
-0.7673222, -0.2556161, -0.9519705, 0.654902, 1, 0, 1,
-0.7614784, 0.5325984, -1.155832, 0.6509804, 1, 0, 1,
-0.7614476, -0.2483785, -3.896709, 0.6431373, 1, 0, 1,
-0.7600905, -0.1751543, -2.949245, 0.6392157, 1, 0, 1,
-0.7600288, 0.7750666, -0.2732061, 0.6313726, 1, 0, 1,
-0.7518252, -1.471885, -2.935893, 0.627451, 1, 0, 1,
-0.7503197, 0.7538242, -1.335547, 0.6196079, 1, 0, 1,
-0.7475782, 0.7379091, -1.218376, 0.6156863, 1, 0, 1,
-0.7450839, 0.529918, -0.8729117, 0.6078432, 1, 0, 1,
-0.7420217, 1.566088, -0.1233473, 0.6039216, 1, 0, 1,
-0.7203616, 1.543032, -0.5465642, 0.5960785, 1, 0, 1,
-0.7162001, 0.2455547, 0.08713331, 0.5882353, 1, 0, 1,
-0.7128156, 2.201062, -1.124666, 0.5843138, 1, 0, 1,
-0.7101275, 0.6997179, 0.03294551, 0.5764706, 1, 0, 1,
-0.7035337, -0.0650057, -2.64271, 0.572549, 1, 0, 1,
-0.7028006, 0.8115676, -1.655474, 0.5647059, 1, 0, 1,
-0.7011133, -1.155074, -3.746553, 0.5607843, 1, 0, 1,
-0.6999401, 0.8416933, -1.630863, 0.5529412, 1, 0, 1,
-0.6956346, -3.017016, -2.675656, 0.5490196, 1, 0, 1,
-0.6941062, 0.1887787, -2.193574, 0.5411765, 1, 0, 1,
-0.6929097, 0.496817, -0.4058664, 0.5372549, 1, 0, 1,
-0.6901723, -1.485638, -2.916826, 0.5294118, 1, 0, 1,
-0.6888888, 0.2049512, -1.057205, 0.5254902, 1, 0, 1,
-0.6852885, 0.2255706, 1.160774, 0.5176471, 1, 0, 1,
-0.6841159, 0.3483516, -1.825347, 0.5137255, 1, 0, 1,
-0.6819495, -1.37194, -2.613843, 0.5058824, 1, 0, 1,
-0.6804339, 0.3382196, -2.546192, 0.5019608, 1, 0, 1,
-0.6794959, 1.1302, -0.7130608, 0.4941176, 1, 0, 1,
-0.6773015, -0.3497297, -3.964343, 0.4862745, 1, 0, 1,
-0.6761525, 0.7033784, -1.153258, 0.4823529, 1, 0, 1,
-0.6729586, -0.7117037, -0.2684003, 0.4745098, 1, 0, 1,
-0.6704065, -0.63274, -2.607379, 0.4705882, 1, 0, 1,
-0.6696327, 0.1625021, -1.90843, 0.4627451, 1, 0, 1,
-0.6666952, 0.8023546, -0.9523458, 0.4588235, 1, 0, 1,
-0.6644056, 0.420794, -2.265484, 0.4509804, 1, 0, 1,
-0.6615987, -0.04601611, -2.010672, 0.4470588, 1, 0, 1,
-0.6608105, 0.4868383, -0.5179198, 0.4392157, 1, 0, 1,
-0.6606383, -0.5908628, -2.309789, 0.4352941, 1, 0, 1,
-0.6570248, -0.5181637, -2.582763, 0.427451, 1, 0, 1,
-0.6564799, 0.5120474, -1.25269, 0.4235294, 1, 0, 1,
-0.6540993, 0.2172105, -2.130705, 0.4156863, 1, 0, 1,
-0.6532283, 1.064325, 1.726545, 0.4117647, 1, 0, 1,
-0.6528837, -1.05883, -2.283107, 0.4039216, 1, 0, 1,
-0.6460724, 1.145284, -0.8578925, 0.3960784, 1, 0, 1,
-0.6458262, -0.3994555, -3.805891, 0.3921569, 1, 0, 1,
-0.6423354, -0.1580068, -1.254103, 0.3843137, 1, 0, 1,
-0.6384708, 1.088537, -0.813792, 0.3803922, 1, 0, 1,
-0.6334519, 1.231765, -0.1790878, 0.372549, 1, 0, 1,
-0.6298296, 0.1356506, -2.905966, 0.3686275, 1, 0, 1,
-0.6258004, -0.1282975, -1.668771, 0.3607843, 1, 0, 1,
-0.623248, -1.328379, -1.997934, 0.3568628, 1, 0, 1,
-0.6232378, -1.162088, -0.3004413, 0.3490196, 1, 0, 1,
-0.6200616, -0.2551797, -0.7765385, 0.345098, 1, 0, 1,
-0.6068776, -0.08278051, -2.642961, 0.3372549, 1, 0, 1,
-0.6035558, -1.208341, -3.798099, 0.3333333, 1, 0, 1,
-0.6021104, -2.145149, -2.314487, 0.3254902, 1, 0, 1,
-0.5981649, 0.5690815, -0.0538536, 0.3215686, 1, 0, 1,
-0.5943677, -0.4173485, -2.662662, 0.3137255, 1, 0, 1,
-0.5940318, -1.070525, -4.317062, 0.3098039, 1, 0, 1,
-0.5869699, 1.07454, -0.7976385, 0.3019608, 1, 0, 1,
-0.5865122, -0.8644044, -1.239651, 0.2941177, 1, 0, 1,
-0.584654, -0.004248663, -1.8863, 0.2901961, 1, 0, 1,
-0.5846061, 0.6994305, -0.1311759, 0.282353, 1, 0, 1,
-0.5824729, 0.8592013, -0.861191, 0.2784314, 1, 0, 1,
-0.5821587, -0.6348373, -1.512002, 0.2705882, 1, 0, 1,
-0.5729841, 1.354596, -1.613846, 0.2666667, 1, 0, 1,
-0.5724687, -0.1645899, -1.490693, 0.2588235, 1, 0, 1,
-0.5710692, 1.028842, 0.09216571, 0.254902, 1, 0, 1,
-0.5670961, 0.0740535, -1.920057, 0.2470588, 1, 0, 1,
-0.5652387, 0.3408206, -0.7560986, 0.2431373, 1, 0, 1,
-0.5626932, -1.211842, -2.776384, 0.2352941, 1, 0, 1,
-0.5581203, -0.8111903, -3.230825, 0.2313726, 1, 0, 1,
-0.5578816, -0.4478146, -1.977678, 0.2235294, 1, 0, 1,
-0.5551379, -1.999658, -2.882748, 0.2196078, 1, 0, 1,
-0.5532628, 1.200813, 0.1197388, 0.2117647, 1, 0, 1,
-0.5472801, -0.4104606, -3.017232, 0.2078431, 1, 0, 1,
-0.5453106, 0.4241498, -2.139424, 0.2, 1, 0, 1,
-0.5448855, 0.8725179, -0.7597459, 0.1921569, 1, 0, 1,
-0.5442344, 0.5109926, -0.9120542, 0.1882353, 1, 0, 1,
-0.5440223, -0.292558, -2.306577, 0.1803922, 1, 0, 1,
-0.5426061, -0.5618696, -0.6237843, 0.1764706, 1, 0, 1,
-0.5411323, 0.2093714, -0.6006599, 0.1686275, 1, 0, 1,
-0.5361621, -0.5423856, 0.2120831, 0.1647059, 1, 0, 1,
-0.5324639, 1.197279, 0.2233038, 0.1568628, 1, 0, 1,
-0.523357, -0.7194446, -2.026236, 0.1529412, 1, 0, 1,
-0.5221232, 1.151704, -0.832593, 0.145098, 1, 0, 1,
-0.5209255, -1.429875, -2.644858, 0.1411765, 1, 0, 1,
-0.5148785, -1.189395, -2.245568, 0.1333333, 1, 0, 1,
-0.514619, 0.4576472, -0.3961896, 0.1294118, 1, 0, 1,
-0.5117965, -2.018752, -3.335968, 0.1215686, 1, 0, 1,
-0.5115507, -0.1741887, 0.07717796, 0.1176471, 1, 0, 1,
-0.5089847, -0.3313939, -2.733739, 0.1098039, 1, 0, 1,
-0.5006201, 0.9361672, 0.5833218, 0.1058824, 1, 0, 1,
-0.4934345, 1.36035, 0.2758664, 0.09803922, 1, 0, 1,
-0.4928508, 1.076391, -2.910253, 0.09019608, 1, 0, 1,
-0.491117, 0.587266, -0.3234274, 0.08627451, 1, 0, 1,
-0.4867296, 0.4832046, 0.6359979, 0.07843138, 1, 0, 1,
-0.4856771, 0.107771, -0.4101181, 0.07450981, 1, 0, 1,
-0.4768443, 0.002531651, -0.2331461, 0.06666667, 1, 0, 1,
-0.4736231, 1.498553, -2.621946, 0.0627451, 1, 0, 1,
-0.4724624, 0.4023718, -2.632415, 0.05490196, 1, 0, 1,
-0.4722688, -0.9455177, -3.142963, 0.05098039, 1, 0, 1,
-0.4713329, -1.767794, -3.115797, 0.04313726, 1, 0, 1,
-0.4676114, -0.2291586, -0.9610006, 0.03921569, 1, 0, 1,
-0.4670068, -0.1445831, -1.394792, 0.03137255, 1, 0, 1,
-0.4646906, 1.606874, -0.4896901, 0.02745098, 1, 0, 1,
-0.458125, -0.7881285, -0.03427719, 0.01960784, 1, 0, 1,
-0.4579581, -1.002522, -1.289891, 0.01568628, 1, 0, 1,
-0.4547104, -0.3982008, -2.848758, 0.007843138, 1, 0, 1,
-0.4538499, 2.397293, 0.5637336, 0.003921569, 1, 0, 1,
-0.4537885, 0.02966653, -1.433579, 0, 1, 0.003921569, 1,
-0.4506638, 1.382581, -0.8035465, 0, 1, 0.01176471, 1,
-0.4464085, 0.07296465, -2.231583, 0, 1, 0.01568628, 1,
-0.4462913, 0.4020299, -0.39389, 0, 1, 0.02352941, 1,
-0.4452344, -0.6251843, -2.88093, 0, 1, 0.02745098, 1,
-0.4375332, 0.0837034, -1.900673, 0, 1, 0.03529412, 1,
-0.4367307, 0.6189929, -1.785608, 0, 1, 0.03921569, 1,
-0.4365043, 0.4294018, -0.5004863, 0, 1, 0.04705882, 1,
-0.4350151, -0.68202, -2.893908, 0, 1, 0.05098039, 1,
-0.4345114, 0.3260452, 1.431398, 0, 1, 0.05882353, 1,
-0.4311363, -0.6568187, -1.316106, 0, 1, 0.0627451, 1,
-0.429704, -1.558928, -2.728009, 0, 1, 0.07058824, 1,
-0.4285582, 0.655242, -0.3804168, 0, 1, 0.07450981, 1,
-0.4248618, -0.84083, -3.106523, 0, 1, 0.08235294, 1,
-0.4139114, 0.714696, -2.306875, 0, 1, 0.08627451, 1,
-0.4126433, 1.443462, 0.5293764, 0, 1, 0.09411765, 1,
-0.4114463, -1.765289, -3.910464, 0, 1, 0.1019608, 1,
-0.4073957, 0.2024471, 0.7997859, 0, 1, 0.1058824, 1,
-0.405192, 0.05738431, -2.123374, 0, 1, 0.1137255, 1,
-0.4018282, -0.4637304, -0.7531057, 0, 1, 0.1176471, 1,
-0.3982162, -0.5496318, -2.179347, 0, 1, 0.1254902, 1,
-0.3971705, -0.2145489, -1.162239, 0, 1, 0.1294118, 1,
-0.3929909, 0.6126413, -0.5382172, 0, 1, 0.1372549, 1,
-0.390155, 1.562551, 0.5962715, 0, 1, 0.1411765, 1,
-0.3863044, -0.9215568, -2.093337, 0, 1, 0.1490196, 1,
-0.3809137, 0.2452327, -1.57923, 0, 1, 0.1529412, 1,
-0.3790737, -0.378296, -1.674858, 0, 1, 0.1607843, 1,
-0.3781541, -0.1419268, -1.324986, 0, 1, 0.1647059, 1,
-0.3648373, -1.878499, -3.537136, 0, 1, 0.172549, 1,
-0.3629676, -1.733302, -3.108829, 0, 1, 0.1764706, 1,
-0.3605572, -0.5283437, -0.8966523, 0, 1, 0.1843137, 1,
-0.3564821, 0.58283, -1.47045, 0, 1, 0.1882353, 1,
-0.3500512, -0.4604187, -3.306416, 0, 1, 0.1960784, 1,
-0.3481547, 1.107952, 1.117348, 0, 1, 0.2039216, 1,
-0.3478252, -0.7306758, -4.233235, 0, 1, 0.2078431, 1,
-0.3458017, -0.01463129, -1.193879, 0, 1, 0.2156863, 1,
-0.345484, -0.9106364, -4.980168, 0, 1, 0.2196078, 1,
-0.3432217, 1.000226, -0.04061585, 0, 1, 0.227451, 1,
-0.3427111, -1.188289, -3.951158, 0, 1, 0.2313726, 1,
-0.3414266, -1.523886, -3.131217, 0, 1, 0.2392157, 1,
-0.3408948, -1.06312, -3.023183, 0, 1, 0.2431373, 1,
-0.3376035, -1.525914, -1.799448, 0, 1, 0.2509804, 1,
-0.33754, -0.7612061, -1.443775, 0, 1, 0.254902, 1,
-0.3366328, 0.4382691, -0.7493283, 0, 1, 0.2627451, 1,
-0.3293184, -0.2459109, -1.799729, 0, 1, 0.2666667, 1,
-0.324585, 3.755931, -1.319318, 0, 1, 0.2745098, 1,
-0.3200844, 1.914225, 0.5179034, 0, 1, 0.2784314, 1,
-0.3108459, -0.3762713, -1.115237, 0, 1, 0.2862745, 1,
-0.3084594, -0.09478326, -0.7521309, 0, 1, 0.2901961, 1,
-0.3073654, 1.64783, 0.189414, 0, 1, 0.2980392, 1,
-0.3021228, -0.2937251, -1.577396, 0, 1, 0.3058824, 1,
-0.2965444, 1.112647, -0.7433375, 0, 1, 0.3098039, 1,
-0.2934729, 0.7877075, -2.055961, 0, 1, 0.3176471, 1,
-0.290596, 0.1931378, -1.862269, 0, 1, 0.3215686, 1,
-0.2833073, 0.03208163, -1.743263, 0, 1, 0.3294118, 1,
-0.2829981, 0.07384346, -3.651177, 0, 1, 0.3333333, 1,
-0.2802074, 0.3215864, -0.9231344, 0, 1, 0.3411765, 1,
-0.2789547, 1.370376, -0.7983957, 0, 1, 0.345098, 1,
-0.2783847, -0.7545652, -3.913204, 0, 1, 0.3529412, 1,
-0.2740248, -0.7678722, -3.303801, 0, 1, 0.3568628, 1,
-0.273932, 2.374677, -0.8417873, 0, 1, 0.3647059, 1,
-0.2715817, 0.5278229, 0.7804146, 0, 1, 0.3686275, 1,
-0.2699659, 0.8061481, -0.1296135, 0, 1, 0.3764706, 1,
-0.2670149, 0.7729016, 0.6309983, 0, 1, 0.3803922, 1,
-0.257704, 1.039938, 0.4653543, 0, 1, 0.3882353, 1,
-0.2534036, 0.2603835, -0.03189267, 0, 1, 0.3921569, 1,
-0.2498228, -0.2535121, -1.485331, 0, 1, 0.4, 1,
-0.2496591, -0.1911807, -1.167686, 0, 1, 0.4078431, 1,
-0.2469646, 1.061694, 0.4966044, 0, 1, 0.4117647, 1,
-0.2456765, 1.08763, -2.101235, 0, 1, 0.4196078, 1,
-0.2384956, 0.1636471, -1.00202, 0, 1, 0.4235294, 1,
-0.2353534, -0.7391914, -2.150097, 0, 1, 0.4313726, 1,
-0.2335386, -0.451266, -1.928742, 0, 1, 0.4352941, 1,
-0.2313223, 1.417182, 1.085078, 0, 1, 0.4431373, 1,
-0.2306341, 0.9241207, -0.2086743, 0, 1, 0.4470588, 1,
-0.2297174, -1.582726, -3.219102, 0, 1, 0.454902, 1,
-0.2275903, -0.1179707, -3.256806, 0, 1, 0.4588235, 1,
-0.2261221, -1.080748, -5.340242, 0, 1, 0.4666667, 1,
-0.2207585, -0.5587641, -3.928523, 0, 1, 0.4705882, 1,
-0.2188234, 1.032158, 2.22424, 0, 1, 0.4784314, 1,
-0.2178194, -2.224891, -3.08698, 0, 1, 0.4823529, 1,
-0.215427, -1.506519, -2.056145, 0, 1, 0.4901961, 1,
-0.2144368, 0.7135026, -1.207364, 0, 1, 0.4941176, 1,
-0.2143616, -0.04991068, -1.304395, 0, 1, 0.5019608, 1,
-0.2142441, 0.6699244, 0.07510178, 0, 1, 0.509804, 1,
-0.2116164, 0.4959673, 0.8732209, 0, 1, 0.5137255, 1,
-0.2090443, 0.5767891, 0.5627952, 0, 1, 0.5215687, 1,
-0.2056506, -0.6059044, -0.735469, 0, 1, 0.5254902, 1,
-0.2021544, 1.870062, -0.1007569, 0, 1, 0.5333334, 1,
-0.2009862, -0.04307329, -2.321227, 0, 1, 0.5372549, 1,
-0.2003496, -0.7615133, -1.991747, 0, 1, 0.5450981, 1,
-0.1956063, -0.2422918, -3.705912, 0, 1, 0.5490196, 1,
-0.1846634, 1.984722, -2.794848, 0, 1, 0.5568628, 1,
-0.1833692, 0.2655258, -2.37009, 0, 1, 0.5607843, 1,
-0.1824776, -0.6537004, -2.353478, 0, 1, 0.5686275, 1,
-0.1814961, -1.170318, -5.100337, 0, 1, 0.572549, 1,
-0.180712, 1.327739, -1.245365, 0, 1, 0.5803922, 1,
-0.1714856, 0.1495486, -2.285122, 0, 1, 0.5843138, 1,
-0.167762, 0.6973156, -0.6612084, 0, 1, 0.5921569, 1,
-0.1674449, -0.367356, -3.384371, 0, 1, 0.5960785, 1,
-0.1648867, -0.1866949, -1.441707, 0, 1, 0.6039216, 1,
-0.1639553, 0.317885, -2.249345, 0, 1, 0.6117647, 1,
-0.161828, 0.2464914, -0.9031875, 0, 1, 0.6156863, 1,
-0.1568572, -1.19596, -3.524206, 0, 1, 0.6235294, 1,
-0.1550277, -0.2813086, -3.315535, 0, 1, 0.627451, 1,
-0.1549833, -1.439603, -1.787854, 0, 1, 0.6352941, 1,
-0.1537377, 0.5707014, -0.7635781, 0, 1, 0.6392157, 1,
-0.1505363, -0.6384883, -2.353924, 0, 1, 0.6470588, 1,
-0.1504117, -0.906909, -4.128882, 0, 1, 0.6509804, 1,
-0.1486875, 0.8915372, 0.535585, 0, 1, 0.6588235, 1,
-0.1454108, 0.1995293, -0.3456723, 0, 1, 0.6627451, 1,
-0.1386937, 1.723392, -1.41514, 0, 1, 0.6705883, 1,
-0.1374996, -0.4131054, -3.332348, 0, 1, 0.6745098, 1,
-0.1369397, 0.302582, 0.9287777, 0, 1, 0.682353, 1,
-0.1317202, 0.8415922, 0.4215934, 0, 1, 0.6862745, 1,
-0.1245166, -0.5842286, -2.773139, 0, 1, 0.6941177, 1,
-0.1212482, -0.2617344, -1.780558, 0, 1, 0.7019608, 1,
-0.1177063, 1.187687, 0.388566, 0, 1, 0.7058824, 1,
-0.1158096, 0.598428, 0.960466, 0, 1, 0.7137255, 1,
-0.1149742, 0.781386, -1.441836, 0, 1, 0.7176471, 1,
-0.1146297, 1.56444, -1.465076, 0, 1, 0.7254902, 1,
-0.1134959, -0.5166593, -3.41998, 0, 1, 0.7294118, 1,
-0.1071912, -0.9840989, -4.300707, 0, 1, 0.7372549, 1,
-0.1060748, 0.2225682, 0.18591, 0, 1, 0.7411765, 1,
-0.09979548, 0.3904149, -1.048426, 0, 1, 0.7490196, 1,
-0.09684785, 1.981347, 0.7320017, 0, 1, 0.7529412, 1,
-0.09616864, -0.2442112, -2.623015, 0, 1, 0.7607843, 1,
-0.09418125, 2.521209, -1.464701, 0, 1, 0.7647059, 1,
-0.09345791, 0.5330737, -0.4443662, 0, 1, 0.772549, 1,
-0.09190468, 0.742541, -0.6243531, 0, 1, 0.7764706, 1,
-0.09155635, -0.4862475, -1.927936, 0, 1, 0.7843137, 1,
-0.09014096, 0.7331197, 0.4610572, 0, 1, 0.7882353, 1,
-0.09002787, 0.5633081, 0.7594039, 0, 1, 0.7960784, 1,
-0.0879277, -1.722568, -5.708337, 0, 1, 0.8039216, 1,
-0.087322, -0.876487, -3.431607, 0, 1, 0.8078431, 1,
-0.08675861, -2.453912, -4.594675, 0, 1, 0.8156863, 1,
-0.08449609, 0.198624, 1.479264, 0, 1, 0.8196079, 1,
-0.08337384, 0.1530868, -1.287755, 0, 1, 0.827451, 1,
-0.07753733, -1.737929, -2.653414, 0, 1, 0.8313726, 1,
-0.06710143, 0.9180818, 1.15113, 0, 1, 0.8392157, 1,
-0.06214961, -0.7984997, -3.092137, 0, 1, 0.8431373, 1,
-0.05945435, 0.6004822, 0.09899988, 0, 1, 0.8509804, 1,
-0.04922749, 0.6022366, 1.885277, 0, 1, 0.854902, 1,
-0.04916918, 1.093012, 0.02519345, 0, 1, 0.8627451, 1,
-0.04541658, 0.8428544, -0.1741693, 0, 1, 0.8666667, 1,
-0.04057588, 1.17153, -0.5477816, 0, 1, 0.8745098, 1,
-0.03882717, -0.4787385, -3.40945, 0, 1, 0.8784314, 1,
-0.03423424, -0.2980334, -3.855942, 0, 1, 0.8862745, 1,
-0.03080879, 0.7272972, -0.2634138, 0, 1, 0.8901961, 1,
-0.02598196, 0.1968455, -1.613117, 0, 1, 0.8980392, 1,
-0.02416744, -1.227882, -2.845762, 0, 1, 0.9058824, 1,
-0.02018528, 0.4886782, 0.2738075, 0, 1, 0.9098039, 1,
-0.0127881, -1.158824, -4.308957, 0, 1, 0.9176471, 1,
-0.007728521, 0.05745573, -1.608958, 0, 1, 0.9215686, 1,
-0.002070202, 0.688033, -0.2192771, 0, 1, 0.9294118, 1,
0.00384867, -1.394632, 3.847438, 0, 1, 0.9333333, 1,
0.004831501, -0.8734456, 4.406467, 0, 1, 0.9411765, 1,
0.008657063, -0.6615922, 4.397073, 0, 1, 0.945098, 1,
0.01087136, -0.2093788, 3.995141, 0, 1, 0.9529412, 1,
0.01349015, -1.404544, 3.789248, 0, 1, 0.9568627, 1,
0.01453162, -1.036258, 2.531865, 0, 1, 0.9647059, 1,
0.01634516, -1.610578, 2.067676, 0, 1, 0.9686275, 1,
0.02001913, -1.203405, 4.078301, 0, 1, 0.9764706, 1,
0.02239969, -0.07077636, 4.061513, 0, 1, 0.9803922, 1,
0.02297913, -0.5606412, 3.711263, 0, 1, 0.9882353, 1,
0.02576767, -0.1296474, 2.621987, 0, 1, 0.9921569, 1,
0.02745031, -0.9626415, 2.035421, 0, 1, 1, 1,
0.02765987, 0.04085564, 2.247795, 0, 0.9921569, 1, 1,
0.0313514, 0.7792063, -1.105482, 0, 0.9882353, 1, 1,
0.03142507, 0.1445688, 0.2190207, 0, 0.9803922, 1, 1,
0.03207603, -1.38488, 2.937961, 0, 0.9764706, 1, 1,
0.03754313, -0.8842136, 0.8563662, 0, 0.9686275, 1, 1,
0.03774226, 1.024695, -2.002944, 0, 0.9647059, 1, 1,
0.04389457, -0.5990426, 4.545148, 0, 0.9568627, 1, 1,
0.04488249, 0.7164866, 0.02000807, 0, 0.9529412, 1, 1,
0.04542559, -0.4627158, 3.850218, 0, 0.945098, 1, 1,
0.04690553, -1.319489, 4.409522, 0, 0.9411765, 1, 1,
0.04805987, 0.8757622, 0.6439315, 0, 0.9333333, 1, 1,
0.05449643, -0.1506337, 2.475339, 0, 0.9294118, 1, 1,
0.05596873, 0.4862246, -1.5498, 0, 0.9215686, 1, 1,
0.05696406, 1.040022, 0.4870876, 0, 0.9176471, 1, 1,
0.05708187, -0.1643187, 1.465571, 0, 0.9098039, 1, 1,
0.05741682, -0.1138, 1.885495, 0, 0.9058824, 1, 1,
0.05834659, -1.37914, 2.986505, 0, 0.8980392, 1, 1,
0.05970255, -1.416666, 3.076313, 0, 0.8901961, 1, 1,
0.06072181, 0.3034807, -1.820492, 0, 0.8862745, 1, 1,
0.06360836, -0.2922525, 2.348167, 0, 0.8784314, 1, 1,
0.06587943, -0.448237, 4.185217, 0, 0.8745098, 1, 1,
0.06963919, -0.3307957, 3.349583, 0, 0.8666667, 1, 1,
0.06992804, -1.838713, 3.903966, 0, 0.8627451, 1, 1,
0.07052322, -2.09693, 2.966627, 0, 0.854902, 1, 1,
0.07990814, -1.55229, 2.385135, 0, 0.8509804, 1, 1,
0.07999682, 0.2761359, 0.5899385, 0, 0.8431373, 1, 1,
0.08145837, -1.086987, 2.409859, 0, 0.8392157, 1, 1,
0.08933374, 0.5275657, 0.4930601, 0, 0.8313726, 1, 1,
0.09016832, 0.560834, -0.5470121, 0, 0.827451, 1, 1,
0.09326205, 0.022539, 1.140084, 0, 0.8196079, 1, 1,
0.09471156, -1.414151, 4.764018, 0, 0.8156863, 1, 1,
0.09535577, -0.7102762, 2.16832, 0, 0.8078431, 1, 1,
0.09606867, 0.6731851, 1.677956, 0, 0.8039216, 1, 1,
0.09684718, 0.1456058, 0.9010281, 0, 0.7960784, 1, 1,
0.09791816, 0.8602521, -0.6462895, 0, 0.7882353, 1, 1,
0.09984012, 1.120793, 1.876039, 0, 0.7843137, 1, 1,
0.1034133, -0.673306, 3.551518, 0, 0.7764706, 1, 1,
0.1034348, -0.7798681, 4.48183, 0, 0.772549, 1, 1,
0.106701, 0.2559331, 1.362942, 0, 0.7647059, 1, 1,
0.1069525, 0.9865897, 0.4729503, 0, 0.7607843, 1, 1,
0.1087059, -1.072188, 3.985355, 0, 0.7529412, 1, 1,
0.1095091, -0.2797735, 2.590327, 0, 0.7490196, 1, 1,
0.1159311, 0.7386111, 0.3944332, 0, 0.7411765, 1, 1,
0.1163579, 1.387412, 0.0198469, 0, 0.7372549, 1, 1,
0.1169152, -1.541323, 2.464622, 0, 0.7294118, 1, 1,
0.120272, -1.510906, 3.645821, 0, 0.7254902, 1, 1,
0.1218738, 0.1793554, -0.05363935, 0, 0.7176471, 1, 1,
0.1250721, -0.2075189, 2.687066, 0, 0.7137255, 1, 1,
0.1254754, 0.7603565, 0.2701901, 0, 0.7058824, 1, 1,
0.133307, -1.074286, 0.8423295, 0, 0.6980392, 1, 1,
0.1338662, -1.358134, 3.036066, 0, 0.6941177, 1, 1,
0.134224, 0.247006, 0.181314, 0, 0.6862745, 1, 1,
0.1347118, -0.6060656, 3.753759, 0, 0.682353, 1, 1,
0.1368708, -0.1797885, 3.480181, 0, 0.6745098, 1, 1,
0.1369931, 0.9770244, 0.2862308, 0, 0.6705883, 1, 1,
0.1402668, -0.3911066, 1.448045, 0, 0.6627451, 1, 1,
0.1409729, 0.3200495, 1.480048, 0, 0.6588235, 1, 1,
0.1448597, 0.1985171, 0.04954522, 0, 0.6509804, 1, 1,
0.1506816, -1.129467, 3.659988, 0, 0.6470588, 1, 1,
0.1518493, 0.158045, -0.5351716, 0, 0.6392157, 1, 1,
0.1530588, 0.2131644, 0.4619763, 0, 0.6352941, 1, 1,
0.1547989, -1.648728, 3.365806, 0, 0.627451, 1, 1,
0.158397, 0.5949208, 1.21127, 0, 0.6235294, 1, 1,
0.1614476, -0.2795494, 1.030361, 0, 0.6156863, 1, 1,
0.1634953, 0.79658, -0.5735041, 0, 0.6117647, 1, 1,
0.1654473, 0.692972, -1.232905, 0, 0.6039216, 1, 1,
0.1662827, -2.418872, 3.81731, 0, 0.5960785, 1, 1,
0.1712734, 0.1585497, 0.4334503, 0, 0.5921569, 1, 1,
0.172425, 1.966143, 0.8307747, 0, 0.5843138, 1, 1,
0.1730044, -0.1474279, 1.128238, 0, 0.5803922, 1, 1,
0.1733515, 1.668495, -0.4780172, 0, 0.572549, 1, 1,
0.1741575, -0.672157, 3.916071, 0, 0.5686275, 1, 1,
0.1743512, 0.2215296, 0.5687615, 0, 0.5607843, 1, 1,
0.176097, -0.6925435, 1.594885, 0, 0.5568628, 1, 1,
0.1802495, 0.5869802, 1.728995, 0, 0.5490196, 1, 1,
0.1826323, -2.929106, 3.298913, 0, 0.5450981, 1, 1,
0.1851255, 1.570553, 1.219043, 0, 0.5372549, 1, 1,
0.1866283, -1.680966, 4.83292, 0, 0.5333334, 1, 1,
0.1889801, -0.6774341, 0.1239324, 0, 0.5254902, 1, 1,
0.1900024, 0.8945642, 1.542561, 0, 0.5215687, 1, 1,
0.1926008, 0.1500976, 0.269318, 0, 0.5137255, 1, 1,
0.1926054, -1.058542, 5.336317, 0, 0.509804, 1, 1,
0.1947185, 0.5830151, 0.7522658, 0, 0.5019608, 1, 1,
0.1973561, -2.552278, 2.796532, 0, 0.4941176, 1, 1,
0.1975435, -1.563325, 1.537304, 0, 0.4901961, 1, 1,
0.2000739, 0.5392927, 0.7005229, 0, 0.4823529, 1, 1,
0.2016843, -0.2858457, 4.685274, 0, 0.4784314, 1, 1,
0.2029844, 1.450253, 0.5791624, 0, 0.4705882, 1, 1,
0.2064319, 0.5181502, -0.5412493, 0, 0.4666667, 1, 1,
0.2079085, 1.907873, 0.1089255, 0, 0.4588235, 1, 1,
0.2100686, 1.699713, 0.5984462, 0, 0.454902, 1, 1,
0.2181403, 0.2050086, 1.492965, 0, 0.4470588, 1, 1,
0.2188426, -0.8675708, 1.377466, 0, 0.4431373, 1, 1,
0.2203404, -0.6678666, 2.944351, 0, 0.4352941, 1, 1,
0.2274328, 1.309125, 0.252999, 0, 0.4313726, 1, 1,
0.2298458, -0.4168686, 1.766206, 0, 0.4235294, 1, 1,
0.2304221, 2.016675, 0.5378265, 0, 0.4196078, 1, 1,
0.2315599, -0.641191, 3.291071, 0, 0.4117647, 1, 1,
0.2396456, -1.032269, 2.784218, 0, 0.4078431, 1, 1,
0.2453607, -0.1021919, 1.622909, 0, 0.4, 1, 1,
0.2549685, 0.3245792, -0.1724239, 0, 0.3921569, 1, 1,
0.2637782, 0.9056934, -0.1940412, 0, 0.3882353, 1, 1,
0.2648731, 0.4387935, 1.285944, 0, 0.3803922, 1, 1,
0.2657693, -0.729189, 1.951048, 0, 0.3764706, 1, 1,
0.2673207, -1.769508, 2.626055, 0, 0.3686275, 1, 1,
0.2675774, -0.9083283, 2.352337, 0, 0.3647059, 1, 1,
0.2690997, -0.6792529, 3.768279, 0, 0.3568628, 1, 1,
0.2728366, -0.576942, 2.748242, 0, 0.3529412, 1, 1,
0.2737655, 2.896982, 0.7180446, 0, 0.345098, 1, 1,
0.2784089, 1.399897, -1.020326, 0, 0.3411765, 1, 1,
0.2789948, 0.4835905, 0.3756267, 0, 0.3333333, 1, 1,
0.2820224, -0.2578277, 2.017728, 0, 0.3294118, 1, 1,
0.2879551, 1.418682, 1.111641, 0, 0.3215686, 1, 1,
0.2906393, 0.972789, -0.1224884, 0, 0.3176471, 1, 1,
0.292104, 1.55811, 0.8880929, 0, 0.3098039, 1, 1,
0.2923987, -1.139158, 4.557795, 0, 0.3058824, 1, 1,
0.294002, -0.424209, 2.579943, 0, 0.2980392, 1, 1,
0.2947159, -0.08203178, 3.062608, 0, 0.2901961, 1, 1,
0.2998044, 0.6206939, 0.5420484, 0, 0.2862745, 1, 1,
0.3041461, 1.198993, -0.3021279, 0, 0.2784314, 1, 1,
0.304572, -1.642628, 3.302541, 0, 0.2745098, 1, 1,
0.3068773, -1.116334, 1.269091, 0, 0.2666667, 1, 1,
0.3075042, -0.3893535, 1.944994, 0, 0.2627451, 1, 1,
0.3105942, -0.2183544, 1.528663, 0, 0.254902, 1, 1,
0.3175602, 1.118843, 1.042578, 0, 0.2509804, 1, 1,
0.3189268, 0.2164249, 2.486617, 0, 0.2431373, 1, 1,
0.3196042, -1.461307, 3.532726, 0, 0.2392157, 1, 1,
0.3199632, -0.5986679, 1.975899, 0, 0.2313726, 1, 1,
0.3212979, 1.82836, 0.878679, 0, 0.227451, 1, 1,
0.3238716, 1.653345, 2.475406, 0, 0.2196078, 1, 1,
0.3280657, -1.039754, 2.993037, 0, 0.2156863, 1, 1,
0.3313269, -0.2515304, 2.915843, 0, 0.2078431, 1, 1,
0.3316373, 0.8172358, 0.3520423, 0, 0.2039216, 1, 1,
0.3349869, 0.3451304, 0.1686229, 0, 0.1960784, 1, 1,
0.3384408, -0.7478091, 2.534174, 0, 0.1882353, 1, 1,
0.3424328, -1.924489, 4.239827, 0, 0.1843137, 1, 1,
0.3430876, -1.275207, 0.7450919, 0, 0.1764706, 1, 1,
0.3455494, -1.228776, 2.441075, 0, 0.172549, 1, 1,
0.3482727, -0.4286523, 3.179563, 0, 0.1647059, 1, 1,
0.3548401, -0.09700249, 1.671043, 0, 0.1607843, 1, 1,
0.3559191, -0.0774419, 2.070445, 0, 0.1529412, 1, 1,
0.3574656, 1.076514, -0.7635906, 0, 0.1490196, 1, 1,
0.3575611, -0.9470408, 3.745033, 0, 0.1411765, 1, 1,
0.3618342, 1.145707, 2.754219, 0, 0.1372549, 1, 1,
0.3642506, -0.9408626, 2.653446, 0, 0.1294118, 1, 1,
0.3672674, -1.507972, 2.15277, 0, 0.1254902, 1, 1,
0.3682269, 1.076586, 0.5630754, 0, 0.1176471, 1, 1,
0.3700382, 0.5277789, 0.9057088, 0, 0.1137255, 1, 1,
0.3710713, 1.460673, -0.2230278, 0, 0.1058824, 1, 1,
0.3714822, 0.006556571, 0.7253305, 0, 0.09803922, 1, 1,
0.3728294, -0.5153022, 1.726327, 0, 0.09411765, 1, 1,
0.3739908, -1.032806, 2.989562, 0, 0.08627451, 1, 1,
0.3743193, 0.4715645, 0.9109987, 0, 0.08235294, 1, 1,
0.3779999, 0.06419569, 1.82932, 0, 0.07450981, 1, 1,
0.3839705, -0.9609285, 3.278681, 0, 0.07058824, 1, 1,
0.3850634, -0.920289, 4.166132, 0, 0.0627451, 1, 1,
0.3901678, 0.4777463, 0.5456387, 0, 0.05882353, 1, 1,
0.3924765, -0.302806, 3.854427, 0, 0.05098039, 1, 1,
0.3928183, -0.1723453, 0.58423, 0, 0.04705882, 1, 1,
0.3932402, -0.4981033, 3.168189, 0, 0.03921569, 1, 1,
0.393787, 0.1490544, 1.913575, 0, 0.03529412, 1, 1,
0.3978325, -0.4231393, 3.826149, 0, 0.02745098, 1, 1,
0.4035456, -0.1390445, 2.540017, 0, 0.02352941, 1, 1,
0.405811, -0.2897815, 1.053027, 0, 0.01568628, 1, 1,
0.4063356, -0.06046442, 0.8303388, 0, 0.01176471, 1, 1,
0.4088711, -1.960563, 0.4960619, 0, 0.003921569, 1, 1,
0.4101312, 0.8228506, 0.9887124, 0.003921569, 0, 1, 1,
0.4127279, 0.1329808, 3.088152, 0.007843138, 0, 1, 1,
0.417106, -0.258853, 1.21265, 0.01568628, 0, 1, 1,
0.4182596, 1.465763, -0.7513624, 0.01960784, 0, 1, 1,
0.4197229, -0.8382797, 2.822614, 0.02745098, 0, 1, 1,
0.4329841, 0.4175302, 2.138968, 0.03137255, 0, 1, 1,
0.4331003, 0.1855766, 0.5575891, 0.03921569, 0, 1, 1,
0.4350312, 0.4473208, 1.603444, 0.04313726, 0, 1, 1,
0.4412589, 0.4984575, -0.465148, 0.05098039, 0, 1, 1,
0.4482942, -1.503435, 2.990798, 0.05490196, 0, 1, 1,
0.4496593, 0.6508599, 1.165593, 0.0627451, 0, 1, 1,
0.4513279, -1.724847, 2.781517, 0.06666667, 0, 1, 1,
0.4516656, 0.221193, 0.2042864, 0.07450981, 0, 1, 1,
0.452405, 0.6612093, 2.130329, 0.07843138, 0, 1, 1,
0.4529464, -0.0647715, 2.56751, 0.08627451, 0, 1, 1,
0.4563522, -0.789823, 2.675731, 0.09019608, 0, 1, 1,
0.4582124, 1.091503, -0.7533628, 0.09803922, 0, 1, 1,
0.4596449, -0.7282318, 3.282085, 0.1058824, 0, 1, 1,
0.4618392, -0.6495525, 4.015154, 0.1098039, 0, 1, 1,
0.463236, -0.6943501, 2.639572, 0.1176471, 0, 1, 1,
0.4688022, 0.6099449, 0.3017838, 0.1215686, 0, 1, 1,
0.4689363, 0.5535373, -0.6431428, 0.1294118, 0, 1, 1,
0.4736761, -0.6376354, 4.347119, 0.1333333, 0, 1, 1,
0.4775883, 0.4873946, 0.4473698, 0.1411765, 0, 1, 1,
0.4808677, -0.2971837, 1.101028, 0.145098, 0, 1, 1,
0.4842865, -0.07180692, 0.8751922, 0.1529412, 0, 1, 1,
0.4857289, -1.704958, 1.536113, 0.1568628, 0, 1, 1,
0.4892699, 0.1531666, 1.389111, 0.1647059, 0, 1, 1,
0.4921914, -0.376403, 2.265007, 0.1686275, 0, 1, 1,
0.4958571, 0.7456515, 2.766173, 0.1764706, 0, 1, 1,
0.4969652, 1.308946, 0.2085407, 0.1803922, 0, 1, 1,
0.5033365, -0.3084191, 1.951535, 0.1882353, 0, 1, 1,
0.5042165, -1.55286, 1.828182, 0.1921569, 0, 1, 1,
0.5124034, 0.8412759, 0.02740346, 0.2, 0, 1, 1,
0.5127132, -0.3442805, 1.835763, 0.2078431, 0, 1, 1,
0.5202289, -1.340889, 3.305169, 0.2117647, 0, 1, 1,
0.5202539, -0.4396801, 2.522897, 0.2196078, 0, 1, 1,
0.5220639, -0.9973524, 2.969035, 0.2235294, 0, 1, 1,
0.5252249, -0.6371788, 4.362728, 0.2313726, 0, 1, 1,
0.5313497, -1.357467, 2.312583, 0.2352941, 0, 1, 1,
0.5322727, 1.282382, 0.5097563, 0.2431373, 0, 1, 1,
0.5338477, 0.2723525, 0.4878412, 0.2470588, 0, 1, 1,
0.537755, -1.006706, 2.16298, 0.254902, 0, 1, 1,
0.5401816, -0.007824226, 0.7247784, 0.2588235, 0, 1, 1,
0.5407439, 0.2969542, 0.5367534, 0.2666667, 0, 1, 1,
0.5416694, 1.059817, 0.4016621, 0.2705882, 0, 1, 1,
0.5448014, -1.087989, 4.376227, 0.2784314, 0, 1, 1,
0.545381, -0.9018369, 3.477219, 0.282353, 0, 1, 1,
0.551217, 0.393858, 1.473097, 0.2901961, 0, 1, 1,
0.5643417, 0.4904548, 2.405493, 0.2941177, 0, 1, 1,
0.5651615, 0.6227575, -0.7610721, 0.3019608, 0, 1, 1,
0.5653731, -0.4068406, 1.800225, 0.3098039, 0, 1, 1,
0.5656271, -0.4071267, 0.5792134, 0.3137255, 0, 1, 1,
0.5780939, 0.7281916, 1.40786, 0.3215686, 0, 1, 1,
0.5809157, 0.5600414, -0.4162399, 0.3254902, 0, 1, 1,
0.5814956, 1.478441, 0.2783833, 0.3333333, 0, 1, 1,
0.581566, 0.5513235, 0.9196138, 0.3372549, 0, 1, 1,
0.5878211, 1.410106, 0.06505465, 0.345098, 0, 1, 1,
0.5963941, -0.8527433, 2.048457, 0.3490196, 0, 1, 1,
0.5978129, 0.3161578, 1.255434, 0.3568628, 0, 1, 1,
0.6017409, 0.517235, 1.199055, 0.3607843, 0, 1, 1,
0.6025195, -0.1073067, 2.650437, 0.3686275, 0, 1, 1,
0.6040407, -0.7327998, 2.828444, 0.372549, 0, 1, 1,
0.606017, 1.830003, -0.8172334, 0.3803922, 0, 1, 1,
0.606674, 1.211883, 1.4922, 0.3843137, 0, 1, 1,
0.6107397, -0.8814587, 2.005439, 0.3921569, 0, 1, 1,
0.6113188, 0.07387744, 0.7474677, 0.3960784, 0, 1, 1,
0.6135938, 1.669377, 0.2117314, 0.4039216, 0, 1, 1,
0.6187719, -0.8466949, 2.683477, 0.4117647, 0, 1, 1,
0.6210667, 1.482282, 0.878364, 0.4156863, 0, 1, 1,
0.6268223, -0.1255429, 1.115234, 0.4235294, 0, 1, 1,
0.6322668, -0.5583966, 2.862404, 0.427451, 0, 1, 1,
0.637239, -0.1882671, 1.064885, 0.4352941, 0, 1, 1,
0.638155, 0.05334768, 2.959837, 0.4392157, 0, 1, 1,
0.6428685, 0.1671692, 0.5016493, 0.4470588, 0, 1, 1,
0.6448151, 0.2948889, 1.547297, 0.4509804, 0, 1, 1,
0.6491023, 1.132064, -0.4930817, 0.4588235, 0, 1, 1,
0.6503829, -1.049753, 3.053921, 0.4627451, 0, 1, 1,
0.6508248, 0.5994044, 1.234322, 0.4705882, 0, 1, 1,
0.6587373, 0.8439938, 0.2079147, 0.4745098, 0, 1, 1,
0.6639801, 0.08981559, 2.454114, 0.4823529, 0, 1, 1,
0.6653204, 0.1730377, 0.5086233, 0.4862745, 0, 1, 1,
0.6685121, 0.0699604, 1.682327, 0.4941176, 0, 1, 1,
0.6699507, 2.064099, 0.1563082, 0.5019608, 0, 1, 1,
0.6781949, 1.075857, -0.1869141, 0.5058824, 0, 1, 1,
0.687013, -0.2757303, 1.737542, 0.5137255, 0, 1, 1,
0.687533, 1.820292, 1.695053, 0.5176471, 0, 1, 1,
0.6876842, -0.4161469, 3.300838, 0.5254902, 0, 1, 1,
0.6891646, -1.985116, 2.680353, 0.5294118, 0, 1, 1,
0.6900054, -0.8334882, 2.324243, 0.5372549, 0, 1, 1,
0.6956953, 0.621558, 0.6615799, 0.5411765, 0, 1, 1,
0.6973213, 0.07813837, 3.287209, 0.5490196, 0, 1, 1,
0.6998449, -0.321963, 2.074579, 0.5529412, 0, 1, 1,
0.7056851, 1.941207, 0.7774978, 0.5607843, 0, 1, 1,
0.7062652, 0.8962196, -0.3071102, 0.5647059, 0, 1, 1,
0.7080702, -0.4821628, 1.378015, 0.572549, 0, 1, 1,
0.7084035, -0.2478068, 2.856479, 0.5764706, 0, 1, 1,
0.7104826, -1.005155, 2.253027, 0.5843138, 0, 1, 1,
0.7168717, -0.1548468, 1.183251, 0.5882353, 0, 1, 1,
0.7211441, 0.0794339, 2.140961, 0.5960785, 0, 1, 1,
0.7265202, -0.362497, 3.549669, 0.6039216, 0, 1, 1,
0.7324856, 0.7697765, 2.295566, 0.6078432, 0, 1, 1,
0.7332567, -0.3115921, 1.909963, 0.6156863, 0, 1, 1,
0.7353805, 1.693921, 1.508175, 0.6196079, 0, 1, 1,
0.7359716, -0.3126681, 3.354027, 0.627451, 0, 1, 1,
0.7372126, -0.9223962, 1.137783, 0.6313726, 0, 1, 1,
0.7376997, 0.8954291, 0.3175823, 0.6392157, 0, 1, 1,
0.7384891, 0.88509, 0.6975403, 0.6431373, 0, 1, 1,
0.7430735, -0.4523845, 2.521269, 0.6509804, 0, 1, 1,
0.743589, 0.9940109, 1.312816, 0.654902, 0, 1, 1,
0.7482449, -0.2055677, 2.147541, 0.6627451, 0, 1, 1,
0.7588709, -1.305349, 2.919864, 0.6666667, 0, 1, 1,
0.7593346, -0.3550093, 1.577823, 0.6745098, 0, 1, 1,
0.7596233, 0.2133857, 2.618123, 0.6784314, 0, 1, 1,
0.7600167, -0.3882925, 1.069908, 0.6862745, 0, 1, 1,
0.7638294, 0.2943216, 1.309106, 0.6901961, 0, 1, 1,
0.7741305, 0.817169, -0.2782336, 0.6980392, 0, 1, 1,
0.7806929, 0.4702595, 0.1519922, 0.7058824, 0, 1, 1,
0.7842399, 0.6552268, 2.354719, 0.7098039, 0, 1, 1,
0.7842973, -1.382504, 2.695436, 0.7176471, 0, 1, 1,
0.7864826, -0.2425403, 3.083921, 0.7215686, 0, 1, 1,
0.7912183, -0.8563209, 1.700357, 0.7294118, 0, 1, 1,
0.7963912, 0.4027913, 1.463428, 0.7333333, 0, 1, 1,
0.7982806, -0.08773496, 1.877292, 0.7411765, 0, 1, 1,
0.8046184, -0.574841, 1.830362, 0.7450981, 0, 1, 1,
0.8086039, -0.7435417, 2.698741, 0.7529412, 0, 1, 1,
0.8132895, 1.711649, 0.9886839, 0.7568628, 0, 1, 1,
0.8138404, 0.5841007, 1.015423, 0.7647059, 0, 1, 1,
0.8139605, -0.9455563, 2.038289, 0.7686275, 0, 1, 1,
0.8172316, -0.7662593, 3.425574, 0.7764706, 0, 1, 1,
0.8197644, -0.3830603, 1.684771, 0.7803922, 0, 1, 1,
0.8209541, -0.1999535, 1.432525, 0.7882353, 0, 1, 1,
0.8284, 0.8508014, -0.9042972, 0.7921569, 0, 1, 1,
0.8301348, 0.8697457, -0.3615629, 0.8, 0, 1, 1,
0.833958, -1.17494, 3.363865, 0.8078431, 0, 1, 1,
0.8372461, 0.8021708, 0.4270862, 0.8117647, 0, 1, 1,
0.8398764, -0.3111003, 0.7181219, 0.8196079, 0, 1, 1,
0.840715, -1.956459, 2.913789, 0.8235294, 0, 1, 1,
0.8488857, -0.5091096, 1.882201, 0.8313726, 0, 1, 1,
0.8491551, -0.6476214, 1.242841, 0.8352941, 0, 1, 1,
0.8537762, -1.585442, 1.413929, 0.8431373, 0, 1, 1,
0.8589885, -0.3427145, 2.523357, 0.8470588, 0, 1, 1,
0.8619875, 0.07351019, 2.15939, 0.854902, 0, 1, 1,
0.8654543, 0.05440691, 3.801861, 0.8588235, 0, 1, 1,
0.8688223, 0.9906613, 1.969047, 0.8666667, 0, 1, 1,
0.8721082, -0.02141194, 2.039306, 0.8705882, 0, 1, 1,
0.8745225, 0.04583761, 2.263777, 0.8784314, 0, 1, 1,
0.8757845, -0.7635793, 1.123527, 0.8823529, 0, 1, 1,
0.8766435, -1.484822, 1.871134, 0.8901961, 0, 1, 1,
0.8801287, -1.734738, 3.076171, 0.8941177, 0, 1, 1,
0.8809527, 0.9320346, -0.3764258, 0.9019608, 0, 1, 1,
0.8818593, -0.3054578, 0.7191406, 0.9098039, 0, 1, 1,
0.8873577, -0.006722637, 0.7420719, 0.9137255, 0, 1, 1,
0.8892321, -0.8759671, 2.821467, 0.9215686, 0, 1, 1,
0.8913441, 0.7553139, 2.118151, 0.9254902, 0, 1, 1,
0.894618, -0.2797386, 2.972504, 0.9333333, 0, 1, 1,
0.8983021, 1.651071, 0.2337238, 0.9372549, 0, 1, 1,
0.9000035, -0.6610211, 2.044247, 0.945098, 0, 1, 1,
0.9036215, -0.009614077, 2.10663, 0.9490196, 0, 1, 1,
0.9052066, -0.003069618, 2.165273, 0.9568627, 0, 1, 1,
0.9062297, -1.262226, 3.087985, 0.9607843, 0, 1, 1,
0.9086069, -0.7243352, 2.173533, 0.9686275, 0, 1, 1,
0.9094204, -0.5538996, 1.727902, 0.972549, 0, 1, 1,
0.9106458, 0.2517225, 2.995004, 0.9803922, 0, 1, 1,
0.9233031, -2.649715, 2.478547, 0.9843137, 0, 1, 1,
0.9284445, 2.158555, 1.065863, 0.9921569, 0, 1, 1,
0.9297054, 0.5620077, 1.758665, 0.9960784, 0, 1, 1,
0.947298, -1.052979, 1.367133, 1, 0, 0.9960784, 1,
0.9553696, 0.1563539, 2.49499, 1, 0, 0.9882353, 1,
0.9554453, -0.9682665, 2.212465, 1, 0, 0.9843137, 1,
0.9634252, 0.8810477, 0.8617326, 1, 0, 0.9764706, 1,
0.970256, 0.9858547, -0.01706126, 1, 0, 0.972549, 1,
0.9723924, 1.408152, 1.861499, 1, 0, 0.9647059, 1,
0.9739021, -0.304475, 1.203138, 1, 0, 0.9607843, 1,
0.9777678, 1.300708, 0.9085615, 1, 0, 0.9529412, 1,
0.9872814, 0.3945222, 2.452129, 1, 0, 0.9490196, 1,
0.9880563, -0.7121615, 1.028039, 1, 0, 0.9411765, 1,
0.9929978, -0.3229964, 1.645389, 1, 0, 0.9372549, 1,
0.9963341, -0.7313885, 3.243024, 1, 0, 0.9294118, 1,
1.005512, -0.7272665, 3.890052, 1, 0, 0.9254902, 1,
1.007867, 0.5410762, 0.2075455, 1, 0, 0.9176471, 1,
1.012163, 0.4729367, -0.4014032, 1, 0, 0.9137255, 1,
1.027, -1.615763, 4.167343, 1, 0, 0.9058824, 1,
1.030711, -1.802478, 2.680288, 1, 0, 0.9019608, 1,
1.032537, 0.979001, 0.2572229, 1, 0, 0.8941177, 1,
1.040412, 1.872434, -2.035912, 1, 0, 0.8862745, 1,
1.040825, 0.3107149, 0.01654836, 1, 0, 0.8823529, 1,
1.04244, 1.028307, -0.1842746, 1, 0, 0.8745098, 1,
1.045356, 0.2898662, 0.2054146, 1, 0, 0.8705882, 1,
1.04632, 0.8826404, 0.8482314, 1, 0, 0.8627451, 1,
1.050467, 1.582129, 0.3754645, 1, 0, 0.8588235, 1,
1.051478, -0.3848086, 2.199781, 1, 0, 0.8509804, 1,
1.058807, 0.7522964, 1.974646, 1, 0, 0.8470588, 1,
1.059313, 0.9351096, -0.6316769, 1, 0, 0.8392157, 1,
1.065085, 1.255271, 0.8891089, 1, 0, 0.8352941, 1,
1.068879, -1.043628, 5.099846, 1, 0, 0.827451, 1,
1.069856, -0.3259282, 1.906472, 1, 0, 0.8235294, 1,
1.084028, -0.2294844, 1.115835, 1, 0, 0.8156863, 1,
1.084908, -0.7549376, 2.500654, 1, 0, 0.8117647, 1,
1.106594, 0.2250298, -0.1332092, 1, 0, 0.8039216, 1,
1.106986, 0.5844551, 1.165203, 1, 0, 0.7960784, 1,
1.110027, -0.8419315, 3.364405, 1, 0, 0.7921569, 1,
1.11004, -0.8093066, 3.174664, 1, 0, 0.7843137, 1,
1.110966, -0.693565, 1.039826, 1, 0, 0.7803922, 1,
1.130031, -0.3973432, 1.94491, 1, 0, 0.772549, 1,
1.130193, 0.7260212, 0.3904406, 1, 0, 0.7686275, 1,
1.132549, -0.3628825, 2.867949, 1, 0, 0.7607843, 1,
1.135774, -0.4326386, 0.934897, 1, 0, 0.7568628, 1,
1.138161, 2.261905, 0.08755099, 1, 0, 0.7490196, 1,
1.144962, -0.683055, 0.5243081, 1, 0, 0.7450981, 1,
1.148411, 1.132345, 0.8209218, 1, 0, 0.7372549, 1,
1.149358, -0.8912701, 2.213378, 1, 0, 0.7333333, 1,
1.150669, -0.8937047, 2.296842, 1, 0, 0.7254902, 1,
1.151626, 0.7222822, 1.940852, 1, 0, 0.7215686, 1,
1.151809, 0.08947243, 0.6728978, 1, 0, 0.7137255, 1,
1.154554, 0.4700231, -0.2164465, 1, 0, 0.7098039, 1,
1.157634, 0.9594058, -0.5947211, 1, 0, 0.7019608, 1,
1.160749, 0.4721134, 2.482506, 1, 0, 0.6941177, 1,
1.16894, -0.3842765, 1.006646, 1, 0, 0.6901961, 1,
1.172374, 0.8434424, 0.7658763, 1, 0, 0.682353, 1,
1.177142, 1.553068, 0.7009055, 1, 0, 0.6784314, 1,
1.183329, 2.499807, 0.888932, 1, 0, 0.6705883, 1,
1.187561, 0.1080061, 0.7206635, 1, 0, 0.6666667, 1,
1.18764, -0.143982, 1.832494, 1, 0, 0.6588235, 1,
1.18785, 1.415705, 0.5093074, 1, 0, 0.654902, 1,
1.197976, -0.6411036, 3.654559, 1, 0, 0.6470588, 1,
1.210344, 0.1089611, 2.310263, 1, 0, 0.6431373, 1,
1.219053, -0.8522938, 2.368874, 1, 0, 0.6352941, 1,
1.219741, -0.1717213, 2.46376, 1, 0, 0.6313726, 1,
1.222573, 1.597198, 1.679547, 1, 0, 0.6235294, 1,
1.223758, 0.4960305, -0.994038, 1, 0, 0.6196079, 1,
1.224711, 1.981432, 1.523904, 1, 0, 0.6117647, 1,
1.232357, -1.197412, 2.095743, 1, 0, 0.6078432, 1,
1.234308, -0.1434889, 2.117496, 1, 0, 0.6, 1,
1.24539, 1.05503, 0.8642938, 1, 0, 0.5921569, 1,
1.250159, 0.1052977, 0.8766368, 1, 0, 0.5882353, 1,
1.254137, -0.6153448, 1.593468, 1, 0, 0.5803922, 1,
1.260787, -1.091542, 1.478627, 1, 0, 0.5764706, 1,
1.262446, -0.1486793, 1.916673, 1, 0, 0.5686275, 1,
1.271782, 0.454291, -0.4270176, 1, 0, 0.5647059, 1,
1.271998, -1.032633, 1.735764, 1, 0, 0.5568628, 1,
1.280511, -0.5111807, 3.512777, 1, 0, 0.5529412, 1,
1.287697, -0.9893827, 0.9758925, 1, 0, 0.5450981, 1,
1.289621, 0.6507037, 0.8406196, 1, 0, 0.5411765, 1,
1.30549, -0.4271182, 3.522525, 1, 0, 0.5333334, 1,
1.306782, -1.467653, 2.268296, 1, 0, 0.5294118, 1,
1.308531, -1.53519, 2.00598, 1, 0, 0.5215687, 1,
1.310154, 0.838124, 1.157513, 1, 0, 0.5176471, 1,
1.316852, 2.535664, -0.6076224, 1, 0, 0.509804, 1,
1.322194, 2.253225, -1.053088, 1, 0, 0.5058824, 1,
1.331933, 0.2466655, 1.900776, 1, 0, 0.4980392, 1,
1.333587, -0.7056439, 2.023627, 1, 0, 0.4901961, 1,
1.336353, -0.1072107, 1.308257, 1, 0, 0.4862745, 1,
1.343898, 1.272172, 1.980399, 1, 0, 0.4784314, 1,
1.346354, -0.7933323, 2.235273, 1, 0, 0.4745098, 1,
1.359134, -0.05045227, 2.184774, 1, 0, 0.4666667, 1,
1.362047, 0.2107558, 1.365833, 1, 0, 0.4627451, 1,
1.36386, 1.051942, 2.147709, 1, 0, 0.454902, 1,
1.364573, -0.7363866, 1.808014, 1, 0, 0.4509804, 1,
1.373457, 1.05926, 0.8660777, 1, 0, 0.4431373, 1,
1.378954, -1.955601, 1.166315, 1, 0, 0.4392157, 1,
1.384905, -0.5864094, 2.452796, 1, 0, 0.4313726, 1,
1.406389, -0.5663359, 1.674097, 1, 0, 0.427451, 1,
1.407898, 0.5957148, 0.7819724, 1, 0, 0.4196078, 1,
1.412413, -0.5420547, 2.813439, 1, 0, 0.4156863, 1,
1.429439, 0.6968591, 1.304367, 1, 0, 0.4078431, 1,
1.439073, 0.7481134, 2.002598, 1, 0, 0.4039216, 1,
1.445307, 0.5739717, 1.096586, 1, 0, 0.3960784, 1,
1.454623, -0.2169816, 1.536898, 1, 0, 0.3882353, 1,
1.4829, -1.090625, 2.700409, 1, 0, 0.3843137, 1,
1.484607, 0.358671, 1.562226, 1, 0, 0.3764706, 1,
1.48763, -0.6172674, 0.5787672, 1, 0, 0.372549, 1,
1.527182, 2.033185, 0.5908517, 1, 0, 0.3647059, 1,
1.531356, -0.5246519, 1.894378, 1, 0, 0.3607843, 1,
1.53372, 1.371305, -0.7700611, 1, 0, 0.3529412, 1,
1.539912, -1.605541, 2.021203, 1, 0, 0.3490196, 1,
1.540839, -1.639682, 3.77112, 1, 0, 0.3411765, 1,
1.552446, -1.013069, 2.453385, 1, 0, 0.3372549, 1,
1.559475, 1.770837, 2.481995, 1, 0, 0.3294118, 1,
1.564909, 1.97275, 1.079151, 1, 0, 0.3254902, 1,
1.56497, -1.277522, 2.589113, 1, 0, 0.3176471, 1,
1.566364, -0.9316123, 0.8312395, 1, 0, 0.3137255, 1,
1.577244, 0.004684464, 1.241831, 1, 0, 0.3058824, 1,
1.58009, -0.3527206, 3.258721, 1, 0, 0.2980392, 1,
1.580534, 1.4785, 1.791463, 1, 0, 0.2941177, 1,
1.58133, -0.3756572, 2.040877, 1, 0, 0.2862745, 1,
1.585916, -0.09654023, 2.051165, 1, 0, 0.282353, 1,
1.617359, -0.4915226, 2.623504, 1, 0, 0.2745098, 1,
1.619891, 0.3128508, 0.3146136, 1, 0, 0.2705882, 1,
1.622118, -1.997721, 3.151799, 1, 0, 0.2627451, 1,
1.644434, -1.254695, 1.564296, 1, 0, 0.2588235, 1,
1.663815, 0.464697, 2.404556, 1, 0, 0.2509804, 1,
1.663921, 1.703581, -1.400315, 1, 0, 0.2470588, 1,
1.669547, -0.4936301, 2.323928, 1, 0, 0.2392157, 1,
1.68196, -0.6312754, 1.095312, 1, 0, 0.2352941, 1,
1.684519, -0.3062833, 0.8287548, 1, 0, 0.227451, 1,
1.712921, 1.89568, 1.586141, 1, 0, 0.2235294, 1,
1.73356, 0.2351274, 1.430434, 1, 0, 0.2156863, 1,
1.740156, 1.648941, 1.266377, 1, 0, 0.2117647, 1,
1.778706, 0.1420682, 2.060481, 1, 0, 0.2039216, 1,
1.89863, -2.075419, 2.593973, 1, 0, 0.1960784, 1,
1.906385, 0.963948, 0.5081279, 1, 0, 0.1921569, 1,
1.919174, 0.5453629, 3.15692, 1, 0, 0.1843137, 1,
1.924894, -0.4776979, 2.306147, 1, 0, 0.1803922, 1,
1.927243, 2.595263, 1.435932, 1, 0, 0.172549, 1,
1.94002, 1.285622, 1.609024, 1, 0, 0.1686275, 1,
1.941227, 1.451684, -0.8627522, 1, 0, 0.1607843, 1,
1.979618, -0.8763594, 1.117821, 1, 0, 0.1568628, 1,
1.983543, -0.5305251, 3.830465, 1, 0, 0.1490196, 1,
2.010079, 0.6478732, -0.7351897, 1, 0, 0.145098, 1,
2.018846, -0.3340548, 0.7959347, 1, 0, 0.1372549, 1,
2.043181, 0.183768, 1.713305, 1, 0, 0.1333333, 1,
2.047025, 0.2977274, 1.764548, 1, 0, 0.1254902, 1,
2.066468, -0.8279366, 0.4768754, 1, 0, 0.1215686, 1,
2.103893, -0.244682, 0.6289843, 1, 0, 0.1137255, 1,
2.145597, -1.179727, 1.343608, 1, 0, 0.1098039, 1,
2.17341, 0.2749033, 1.148589, 1, 0, 0.1019608, 1,
2.248537, 0.918242, -0.1776129, 1, 0, 0.09411765, 1,
2.322328, -0.5432935, 2.254113, 1, 0, 0.09019608, 1,
2.325288, -0.2341096, 2.493406, 1, 0, 0.08235294, 1,
2.355775, -1.083958, -0.2252984, 1, 0, 0.07843138, 1,
2.38894, -0.6514333, 3.206692, 1, 0, 0.07058824, 1,
2.542561, -0.5064628, 2.120943, 1, 0, 0.06666667, 1,
2.574305, -0.02914543, 1.811406, 1, 0, 0.05882353, 1,
2.599646, -1.374857, 2.469515, 1, 0, 0.05490196, 1,
2.639317, -2.21428, 1.665964, 1, 0, 0.04705882, 1,
2.661651, 0.463309, 0.3349875, 1, 0, 0.04313726, 1,
2.698707, 0.07828197, 1.832801, 1, 0, 0.03529412, 1,
2.742356, 0.3128375, 1.771092, 1, 0, 0.03137255, 1,
2.754514, -0.528037, 0.9360987, 1, 0, 0.02352941, 1,
2.8248, -0.9945518, 0.2245049, 1, 0, 0.01960784, 1,
2.873662, 1.079814, 1.862439, 1, 0, 0.01176471, 1,
2.918779, -2.157528, 1.226256, 1, 0, 0.007843138, 1
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
0.02507401, -4.661629, -7.580406, 0, -0.5, 0.5, 0.5,
0.02507401, -4.661629, -7.580406, 1, -0.5, 0.5, 0.5,
0.02507401, -4.661629, -7.580406, 1, 1.5, 0.5, 0.5,
0.02507401, -4.661629, -7.580406, 0, 1.5, 0.5, 0.5
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
-3.849597, 0.1571454, -7.580406, 0, -0.5, 0.5, 0.5,
-3.849597, 0.1571454, -7.580406, 1, -0.5, 0.5, 0.5,
-3.849597, 0.1571454, -7.580406, 1, 1.5, 0.5, 0.5,
-3.849597, 0.1571454, -7.580406, 0, 1.5, 0.5, 0.5
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
-3.849597, -4.661629, -0.1860104, 0, -0.5, 0.5, 0.5,
-3.849597, -4.661629, -0.1860104, 1, -0.5, 0.5, 0.5,
-3.849597, -4.661629, -0.1860104, 1, 1.5, 0.5, 0.5,
-3.849597, -4.661629, -0.1860104, 0, 1.5, 0.5, 0.5
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
-2, -3.549604, -5.874007,
2, -3.549604, -5.874007,
-2, -3.549604, -5.874007,
-2, -3.734942, -6.158407,
-1, -3.549604, -5.874007,
-1, -3.734942, -6.158407,
0, -3.549604, -5.874007,
0, -3.734942, -6.158407,
1, -3.549604, -5.874007,
1, -3.734942, -6.158407,
2, -3.549604, -5.874007,
2, -3.734942, -6.158407
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
-2, -4.105617, -6.727207, 0, -0.5, 0.5, 0.5,
-2, -4.105617, -6.727207, 1, -0.5, 0.5, 0.5,
-2, -4.105617, -6.727207, 1, 1.5, 0.5, 0.5,
-2, -4.105617, -6.727207, 0, 1.5, 0.5, 0.5,
-1, -4.105617, -6.727207, 0, -0.5, 0.5, 0.5,
-1, -4.105617, -6.727207, 1, -0.5, 0.5, 0.5,
-1, -4.105617, -6.727207, 1, 1.5, 0.5, 0.5,
-1, -4.105617, -6.727207, 0, 1.5, 0.5, 0.5,
0, -4.105617, -6.727207, 0, -0.5, 0.5, 0.5,
0, -4.105617, -6.727207, 1, -0.5, 0.5, 0.5,
0, -4.105617, -6.727207, 1, 1.5, 0.5, 0.5,
0, -4.105617, -6.727207, 0, 1.5, 0.5, 0.5,
1, -4.105617, -6.727207, 0, -0.5, 0.5, 0.5,
1, -4.105617, -6.727207, 1, -0.5, 0.5, 0.5,
1, -4.105617, -6.727207, 1, 1.5, 0.5, 0.5,
1, -4.105617, -6.727207, 0, 1.5, 0.5, 0.5,
2, -4.105617, -6.727207, 0, -0.5, 0.5, 0.5,
2, -4.105617, -6.727207, 1, -0.5, 0.5, 0.5,
2, -4.105617, -6.727207, 1, 1.5, 0.5, 0.5,
2, -4.105617, -6.727207, 0, 1.5, 0.5, 0.5
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
-2.955442, -2, -5.874007,
-2.955442, 2, -5.874007,
-2.955442, -2, -5.874007,
-3.104468, -2, -6.158407,
-2.955442, 0, -5.874007,
-3.104468, 0, -6.158407,
-2.955442, 2, -5.874007,
-3.104468, 2, -6.158407
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
-3.402519, -2, -6.727207, 0, -0.5, 0.5, 0.5,
-3.402519, -2, -6.727207, 1, -0.5, 0.5, 0.5,
-3.402519, -2, -6.727207, 1, 1.5, 0.5, 0.5,
-3.402519, -2, -6.727207, 0, 1.5, 0.5, 0.5,
-3.402519, 0, -6.727207, 0, -0.5, 0.5, 0.5,
-3.402519, 0, -6.727207, 1, -0.5, 0.5, 0.5,
-3.402519, 0, -6.727207, 1, 1.5, 0.5, 0.5,
-3.402519, 0, -6.727207, 0, 1.5, 0.5, 0.5,
-3.402519, 2, -6.727207, 0, -0.5, 0.5, 0.5,
-3.402519, 2, -6.727207, 1, -0.5, 0.5, 0.5,
-3.402519, 2, -6.727207, 1, 1.5, 0.5, 0.5,
-3.402519, 2, -6.727207, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-2.955442, -3.549604, -4,
-2.955442, -3.549604, 4,
-2.955442, -3.549604, -4,
-3.104468, -3.734942, -4,
-2.955442, -3.549604, -2,
-3.104468, -3.734942, -2,
-2.955442, -3.549604, 0,
-3.104468, -3.734942, 0,
-2.955442, -3.549604, 2,
-3.104468, -3.734942, 2,
-2.955442, -3.549604, 4,
-3.104468, -3.734942, 4
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
-3.402519, -4.105617, -4, 0, -0.5, 0.5, 0.5,
-3.402519, -4.105617, -4, 1, -0.5, 0.5, 0.5,
-3.402519, -4.105617, -4, 1, 1.5, 0.5, 0.5,
-3.402519, -4.105617, -4, 0, 1.5, 0.5, 0.5,
-3.402519, -4.105617, -2, 0, -0.5, 0.5, 0.5,
-3.402519, -4.105617, -2, 1, -0.5, 0.5, 0.5,
-3.402519, -4.105617, -2, 1, 1.5, 0.5, 0.5,
-3.402519, -4.105617, -2, 0, 1.5, 0.5, 0.5,
-3.402519, -4.105617, 0, 0, -0.5, 0.5, 0.5,
-3.402519, -4.105617, 0, 1, -0.5, 0.5, 0.5,
-3.402519, -4.105617, 0, 1, 1.5, 0.5, 0.5,
-3.402519, -4.105617, 0, 0, 1.5, 0.5, 0.5,
-3.402519, -4.105617, 2, 0, -0.5, 0.5, 0.5,
-3.402519, -4.105617, 2, 1, -0.5, 0.5, 0.5,
-3.402519, -4.105617, 2, 1, 1.5, 0.5, 0.5,
-3.402519, -4.105617, 2, 0, 1.5, 0.5, 0.5,
-3.402519, -4.105617, 4, 0, -0.5, 0.5, 0.5,
-3.402519, -4.105617, 4, 1, -0.5, 0.5, 0.5,
-3.402519, -4.105617, 4, 1, 1.5, 0.5, 0.5,
-3.402519, -4.105617, 4, 0, 1.5, 0.5, 0.5
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
-2.955442, -3.549604, -5.874007,
-2.955442, 3.863895, -5.874007,
-2.955442, -3.549604, 5.501987,
-2.955442, 3.863895, 5.501987,
-2.955442, -3.549604, -5.874007,
-2.955442, -3.549604, 5.501987,
-2.955442, 3.863895, -5.874007,
-2.955442, 3.863895, 5.501987,
-2.955442, -3.549604, -5.874007,
3.00559, -3.549604, -5.874007,
-2.955442, -3.549604, 5.501987,
3.00559, -3.549604, 5.501987,
-2.955442, 3.863895, -5.874007,
3.00559, 3.863895, -5.874007,
-2.955442, 3.863895, 5.501987,
3.00559, 3.863895, 5.501987,
3.00559, -3.549604, -5.874007,
3.00559, 3.863895, -5.874007,
3.00559, -3.549604, 5.501987,
3.00559, 3.863895, 5.501987,
3.00559, -3.549604, -5.874007,
3.00559, -3.549604, 5.501987,
3.00559, 3.863895, -5.874007,
3.00559, 3.863895, 5.501987
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
var radius = 7.918539;
var distance = 35.23047;
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
mvMatrix.translate( -0.02507401, -0.1571454, 0.1860104 );
mvMatrix.scale( 1.436275, 1.154877, 0.7526094 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.23047);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
pyributicarb<-read.table("pyributicarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyributicarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyributicarb' not found
```

```r
y<-pyributicarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyributicarb' not found
```

```r
z<-pyributicarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyributicarb' not found
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
-2.868631, 0.02233576, -3.546049, 0, 0, 1, 1, 1,
-2.792849, -2.727522, -1.564222, 1, 0, 0, 1, 1,
-2.75578, 0.1981123, -0.7645077, 1, 0, 0, 1, 1,
-2.741162, -0.2140466, -2.056521, 1, 0, 0, 1, 1,
-2.702306, -1.899309, -2.468943, 1, 0, 0, 1, 1,
-2.604564, 0.5363413, -0.8888243, 1, 0, 0, 1, 1,
-2.554576, 0.516905, -3.198679, 0, 0, 0, 1, 1,
-2.523097, -0.5311581, -2.644453, 0, 0, 0, 1, 1,
-2.505939, -0.8929546, -1.45622, 0, 0, 0, 1, 1,
-2.468787, -0.9572973, -1.693169, 0, 0, 0, 1, 1,
-2.448493, -0.7469832, -2.680771, 0, 0, 0, 1, 1,
-2.43517, 0.004424623, -1.566444, 0, 0, 0, 1, 1,
-2.406133, 1.270481, -1.701233, 0, 0, 0, 1, 1,
-2.400748, -1.802174, -3.562438, 1, 1, 1, 1, 1,
-2.185328, 0.3093689, -2.580378, 1, 1, 1, 1, 1,
-2.165838, 1.113622, -0.378027, 1, 1, 1, 1, 1,
-2.143243, -0.2513962, -0.7867586, 1, 1, 1, 1, 1,
-2.086379, 1.217413, -1.021092, 1, 1, 1, 1, 1,
-2.058857, -0.2105614, -1.799531, 1, 1, 1, 1, 1,
-2.048266, -1.230637, -2.42939, 1, 1, 1, 1, 1,
-2.048001, -0.3201854, -1.721138, 1, 1, 1, 1, 1,
-2.033312, 0.9234113, -3.264034, 1, 1, 1, 1, 1,
-2.027625, -1.263211, -2.968198, 1, 1, 1, 1, 1,
-2.021331, -0.02074544, 0.3694822, 1, 1, 1, 1, 1,
-1.99762, 0.8209513, -0.5153415, 1, 1, 1, 1, 1,
-1.963003, 1.252772, -2.056386, 1, 1, 1, 1, 1,
-1.939871, -0.3918813, -2.080785, 1, 1, 1, 1, 1,
-1.936561, -0.4035483, -0.4433354, 1, 1, 1, 1, 1,
-1.936038, -0.01579081, -2.494754, 0, 0, 1, 1, 1,
-1.935451, -1.955644, -3.187158, 1, 0, 0, 1, 1,
-1.931779, -0.05663061, -1.848086, 1, 0, 0, 1, 1,
-1.920916, -1.041425, -2.598049, 1, 0, 0, 1, 1,
-1.900628, 1.240834, 1.115213, 1, 0, 0, 1, 1,
-1.87348, -1.195831, -2.008985, 1, 0, 0, 1, 1,
-1.869515, 0.3649453, -2.238446, 0, 0, 0, 1, 1,
-1.867995, -0.6375997, -2.317203, 0, 0, 0, 1, 1,
-1.851616, -0.7082502, -1.936194, 0, 0, 0, 1, 1,
-1.849195, 0.07137702, -2.388753, 0, 0, 0, 1, 1,
-1.835936, 0.7453158, -0.9774892, 0, 0, 0, 1, 1,
-1.784401, -0.1436894, -0.5156463, 0, 0, 0, 1, 1,
-1.773878, 0.008091888, -2.478157, 0, 0, 0, 1, 1,
-1.76588, -1.194556, -2.815855, 1, 1, 1, 1, 1,
-1.751525, -1.52546, -0.6943709, 1, 1, 1, 1, 1,
-1.743327, 0.3392821, -2.542256, 1, 1, 1, 1, 1,
-1.716554, -2.457754, -1.919437, 1, 1, 1, 1, 1,
-1.713349, 0.9284381, -2.165927, 1, 1, 1, 1, 1,
-1.705031, -1.322147, -2.291342, 1, 1, 1, 1, 1,
-1.692795, 0.00628959, -0.5293435, 1, 1, 1, 1, 1,
-1.672303, 0.7442273, -2.74733, 1, 1, 1, 1, 1,
-1.668933, 0.5637279, -0.4940226, 1, 1, 1, 1, 1,
-1.656795, 0.02961144, -0.7835777, 1, 1, 1, 1, 1,
-1.648928, 1.480422, 0.2521851, 1, 1, 1, 1, 1,
-1.616444, -0.112489, -1.597773, 1, 1, 1, 1, 1,
-1.612793, 1.70391, 0.04688033, 1, 1, 1, 1, 1,
-1.604535, -0.5307899, 0.202175, 1, 1, 1, 1, 1,
-1.588574, -0.3255424, -2.397551, 1, 1, 1, 1, 1,
-1.577076, 1.72175, 0.85554, 0, 0, 1, 1, 1,
-1.56461, -0.1668844, -1.90992, 1, 0, 0, 1, 1,
-1.563711, -0.2448911, -2.805238, 1, 0, 0, 1, 1,
-1.547522, -0.9418283, -2.037865, 1, 0, 0, 1, 1,
-1.540951, -0.9895306, -3.966674, 1, 0, 0, 1, 1,
-1.534439, -2.478706, -1.601921, 1, 0, 0, 1, 1,
-1.529335, 0.06478204, -1.630568, 0, 0, 0, 1, 1,
-1.509812, 0.9383998, -1.891245, 0, 0, 0, 1, 1,
-1.505057, 0.4717922, 1.416876, 0, 0, 0, 1, 1,
-1.485314, -1.052182, -1.616901, 0, 0, 0, 1, 1,
-1.485261, -0.1548051, -2.941635, 0, 0, 0, 1, 1,
-1.484765, 0.940991, -2.017854, 0, 0, 0, 1, 1,
-1.477415, -0.3378351, -3.213438, 0, 0, 0, 1, 1,
-1.471746, 1.397526, -1.528554, 1, 1, 1, 1, 1,
-1.460229, 0.5887059, -0.06574803, 1, 1, 1, 1, 1,
-1.445684, -0.7667426, -1.439781, 1, 1, 1, 1, 1,
-1.441745, 0.3440642, -0.7179674, 1, 1, 1, 1, 1,
-1.433564, 0.2541057, -2.535112, 1, 1, 1, 1, 1,
-1.433104, -0.6787232, -2.007157, 1, 1, 1, 1, 1,
-1.424945, -1.039147, -1.933654, 1, 1, 1, 1, 1,
-1.420432, 0.7995389, -0.491627, 1, 1, 1, 1, 1,
-1.418841, -0.5793858, -0.503319, 1, 1, 1, 1, 1,
-1.418377, 0.1567703, -2.164367, 1, 1, 1, 1, 1,
-1.414549, 1.028492, -0.6457353, 1, 1, 1, 1, 1,
-1.413373, 0.9178474, -0.8170595, 1, 1, 1, 1, 1,
-1.412121, 0.9968578, -1.156587, 1, 1, 1, 1, 1,
-1.390641, -0.6328742, -1.502239, 1, 1, 1, 1, 1,
-1.380927, 0.2317696, -1.681365, 1, 1, 1, 1, 1,
-1.380479, 0.006267727, -2.213211, 0, 0, 1, 1, 1,
-1.377439, 0.8138554, -0.2524915, 1, 0, 0, 1, 1,
-1.37281, 0.6737176, -0.5735571, 1, 0, 0, 1, 1,
-1.367077, -0.02368759, -3.010038, 1, 0, 0, 1, 1,
-1.351379, 0.4635851, 0.01746125, 1, 0, 0, 1, 1,
-1.341793, 0.1469792, -0.7290435, 1, 0, 0, 1, 1,
-1.333998, -0.2998828, -1.780191, 0, 0, 0, 1, 1,
-1.333832, -0.04252351, -1.18886, 0, 0, 0, 1, 1,
-1.32989, -0.4650149, -1.787589, 0, 0, 0, 1, 1,
-1.326976, -0.3764111, -3.382766, 0, 0, 0, 1, 1,
-1.323596, -0.1137164, -1.359686, 0, 0, 0, 1, 1,
-1.322124, -0.9647847, -2.726778, 0, 0, 0, 1, 1,
-1.317981, 1.327383, -0.9854233, 0, 0, 0, 1, 1,
-1.311164, 0.03901772, -0.1392778, 1, 1, 1, 1, 1,
-1.305472, -0.05618189, -1.077648, 1, 1, 1, 1, 1,
-1.304601, -0.1415979, -1.460224, 1, 1, 1, 1, 1,
-1.302859, -0.3771899, -0.7666191, 1, 1, 1, 1, 1,
-1.294049, -0.8799514, -1.984362, 1, 1, 1, 1, 1,
-1.287418, -0.336684, -1.781711, 1, 1, 1, 1, 1,
-1.284961, -0.820308, -2.221604, 1, 1, 1, 1, 1,
-1.277592, 0.8293233, 1.340037, 1, 1, 1, 1, 1,
-1.265745, 0.8437099, -1.291094, 1, 1, 1, 1, 1,
-1.259122, 0.9101408, 0.2093988, 1, 1, 1, 1, 1,
-1.25687, -0.3651618, -2.140314, 1, 1, 1, 1, 1,
-1.255287, -3.441641, -0.8556277, 1, 1, 1, 1, 1,
-1.253588, -0.8403569, -2.67457, 1, 1, 1, 1, 1,
-1.248903, -0.6776661, -4.005565, 1, 1, 1, 1, 1,
-1.236594, -0.1965376, -2.503294, 1, 1, 1, 1, 1,
-1.235127, 0.1351484, -2.102354, 0, 0, 1, 1, 1,
-1.218892, 2.355779, -0.2750212, 1, 0, 0, 1, 1,
-1.218044, -0.08587985, -2.093377, 1, 0, 0, 1, 1,
-1.212792, 0.3520511, -2.940985, 1, 0, 0, 1, 1,
-1.20411, -0.2788179, -1.300363, 1, 0, 0, 1, 1,
-1.201469, 0.2144247, -2.089456, 1, 0, 0, 1, 1,
-1.198128, -0.7532276, -3.291185, 0, 0, 0, 1, 1,
-1.186188, 0.2053488, -2.225568, 0, 0, 0, 1, 1,
-1.156907, 0.6198934, -0.6849375, 0, 0, 0, 1, 1,
-1.156005, 0.9292006, -0.2699429, 0, 0, 0, 1, 1,
-1.153123, 0.8487249, -0.2432307, 0, 0, 0, 1, 1,
-1.144359, 1.527557, -0.5481137, 0, 0, 0, 1, 1,
-1.144181, -1.340663, -1.946006, 0, 0, 0, 1, 1,
-1.13935, 0.6773911, 0.06801715, 1, 1, 1, 1, 1,
-1.139019, -2.372606, -2.350348, 1, 1, 1, 1, 1,
-1.126074, 1.393229, -1.797236, 1, 1, 1, 1, 1,
-1.113742, -0.4180683, -1.300408, 1, 1, 1, 1, 1,
-1.109632, 0.7925558, 0.9002923, 1, 1, 1, 1, 1,
-1.098344, 1.341605, -1.389056, 1, 1, 1, 1, 1,
-1.0978, 0.784658, -1.12689, 1, 1, 1, 1, 1,
-1.090518, 1.300982, -3.174264, 1, 1, 1, 1, 1,
-1.076801, -0.5967181, -2.108731, 1, 1, 1, 1, 1,
-1.076198, -1.224532, -2.982691, 1, 1, 1, 1, 1,
-1.066146, 1.178078, -1.99349, 1, 1, 1, 1, 1,
-1.063249, 1.732262, 0.8436564, 1, 1, 1, 1, 1,
-1.058097, -0.8364735, -1.853495, 1, 1, 1, 1, 1,
-1.052227, -1.034292, -1.817017, 1, 1, 1, 1, 1,
-1.047959, -0.8133189, -2.340959, 1, 1, 1, 1, 1,
-1.040666, -0.6108898, -1.119509, 0, 0, 1, 1, 1,
-1.039178, 1.115371, -0.7465505, 1, 0, 0, 1, 1,
-1.032958, 0.9678381, -1.480021, 1, 0, 0, 1, 1,
-1.025628, -0.4566864, -1.565244, 1, 0, 0, 1, 1,
-1.02412, 1.5322, -1.174119, 1, 0, 0, 1, 1,
-1.022232, 0.3493567, -1.259218, 1, 0, 0, 1, 1,
-1.013862, 0.04151579, -2.365861, 0, 0, 0, 1, 1,
-1.007155, 0.8203413, -1.856741, 0, 0, 0, 1, 1,
-0.9997184, -0.312992, -1.830669, 0, 0, 0, 1, 1,
-0.9984829, -0.8443744, -2.407736, 0, 0, 0, 1, 1,
-0.9949717, -1.419864, -1.684732, 0, 0, 0, 1, 1,
-0.9923561, -0.7653526, -1.223184, 0, 0, 0, 1, 1,
-0.9895287, -0.1603053, -1.787317, 0, 0, 0, 1, 1,
-0.9880792, 0.6785921, -1.248947, 1, 1, 1, 1, 1,
-0.9858733, 1.505597, 0.7962927, 1, 1, 1, 1, 1,
-0.9830923, 0.06533486, -0.6601591, 1, 1, 1, 1, 1,
-0.981373, 0.6764299, -0.2559747, 1, 1, 1, 1, 1,
-0.9798309, 0.5001781, -2.344198, 1, 1, 1, 1, 1,
-0.973259, -0.3625564, -3.69687, 1, 1, 1, 1, 1,
-0.9727795, -1.339381, -2.473717, 1, 1, 1, 1, 1,
-0.9685066, -1.204146, -2.06148, 1, 1, 1, 1, 1,
-0.968223, 0.1573706, -3.812722, 1, 1, 1, 1, 1,
-0.9674177, -0.01244753, -1.081205, 1, 1, 1, 1, 1,
-0.9655212, -0.3617499, -3.653605, 1, 1, 1, 1, 1,
-0.9610779, 0.04865383, -0.7889644, 1, 1, 1, 1, 1,
-0.9605174, -0.6944512, -3.143948, 1, 1, 1, 1, 1,
-0.9601361, 0.4378216, -0.1511414, 1, 1, 1, 1, 1,
-0.9578947, -1.475229, -3.647325, 1, 1, 1, 1, 1,
-0.9465136, -0.2750263, -1.981998, 0, 0, 1, 1, 1,
-0.9388163, 1.00349, 0.3650579, 1, 0, 0, 1, 1,
-0.9373054, -1.757814, -1.448531, 1, 0, 0, 1, 1,
-0.9340137, -0.5997643, -0.7907138, 1, 0, 0, 1, 1,
-0.9336572, -1.062465, -1.801924, 1, 0, 0, 1, 1,
-0.9291881, -0.9108182, -3.484539, 1, 0, 0, 1, 1,
-0.9213203, -0.2453756, -3.500655, 0, 0, 0, 1, 1,
-0.9183845, -0.5966701, -2.683276, 0, 0, 0, 1, 1,
-0.9156409, 0.3949431, -1.633707, 0, 0, 0, 1, 1,
-0.9144719, -1.429372, -3.073659, 0, 0, 0, 1, 1,
-0.9077583, 0.5965426, -2.286086, 0, 0, 0, 1, 1,
-0.9057821, -1.227, -2.15767, 0, 0, 0, 1, 1,
-0.9048945, 0.3534762, 0.2441541, 0, 0, 0, 1, 1,
-0.9041788, -0.4179836, -1.48209, 1, 1, 1, 1, 1,
-0.9014208, 0.4467577, -1.364365, 1, 1, 1, 1, 1,
-0.9010367, 0.05288219, -1.034109, 1, 1, 1, 1, 1,
-0.8991594, -1.356758, -2.639522, 1, 1, 1, 1, 1,
-0.8980194, -1.216091, -0.7669907, 1, 1, 1, 1, 1,
-0.8953752, 0.4089319, -1.761472, 1, 1, 1, 1, 1,
-0.8901204, 0.2590675, -1.63519, 1, 1, 1, 1, 1,
-0.8837489, -1.052803, -3.510569, 1, 1, 1, 1, 1,
-0.8828149, -1.252695, -2.371438, 1, 1, 1, 1, 1,
-0.8803679, 0.9919891, -0.4749883, 1, 1, 1, 1, 1,
-0.8766397, 1.198817, -1.885749, 1, 1, 1, 1, 1,
-0.8750455, -0.6420048, -1.952344, 1, 1, 1, 1, 1,
-0.8740731, -0.6060935, -3.130925, 1, 1, 1, 1, 1,
-0.8671733, 0.3685624, -0.240932, 1, 1, 1, 1, 1,
-0.8653758, 0.4779804, -1.993417, 1, 1, 1, 1, 1,
-0.8618241, 0.1248436, -0.9768798, 0, 0, 1, 1, 1,
-0.8415799, 1.401938, -0.1766891, 1, 0, 0, 1, 1,
-0.8414392, 0.7241417, 0.5696412, 1, 0, 0, 1, 1,
-0.8357431, -0.8848999, -3.199829, 1, 0, 0, 1, 1,
-0.8321369, 2.051073, 1.795059, 1, 0, 0, 1, 1,
-0.8295419, -0.3388444, 0.1164889, 1, 0, 0, 1, 1,
-0.8294278, 0.8010734, -0.6013771, 0, 0, 0, 1, 1,
-0.8212426, -0.01960661, -3.515361, 0, 0, 0, 1, 1,
-0.8164409, -0.1219407, -3.389697, 0, 0, 0, 1, 1,
-0.8082151, -0.4302205, -2.850519, 0, 0, 0, 1, 1,
-0.8063762, -1.73097, -1.368912, 0, 0, 0, 1, 1,
-0.8022333, -0.166895, -2.565253, 0, 0, 0, 1, 1,
-0.8013706, 0.3826378, -1.138007, 0, 0, 0, 1, 1,
-0.7997531, -0.2091365, -2.144321, 1, 1, 1, 1, 1,
-0.7969207, -1.114019, -3.080807, 1, 1, 1, 1, 1,
-0.7933758, 0.9677684, -1.210622, 1, 1, 1, 1, 1,
-0.7919829, 1.469906, 0.4400931, 1, 1, 1, 1, 1,
-0.7901087, -0.9577392, -3.61696, 1, 1, 1, 1, 1,
-0.7871814, -1.514114, -4.249076, 1, 1, 1, 1, 1,
-0.7790486, 1.285311, -0.1727348, 1, 1, 1, 1, 1,
-0.7759958, 0.02205844, -1.434496, 1, 1, 1, 1, 1,
-0.775949, 0.4109015, -1.46293, 1, 1, 1, 1, 1,
-0.7748932, -0.4502679, -2.257973, 1, 1, 1, 1, 1,
-0.7740336, -0.06659416, 0.04172729, 1, 1, 1, 1, 1,
-0.7721753, -0.2705573, -0.9175839, 1, 1, 1, 1, 1,
-0.770655, 0.3601835, -1.326326, 1, 1, 1, 1, 1,
-0.7702417, -0.5721858, -2.219627, 1, 1, 1, 1, 1,
-0.7685783, 0.9056402, -1.006151, 1, 1, 1, 1, 1,
-0.7673222, -0.2556161, -0.9519705, 0, 0, 1, 1, 1,
-0.7614784, 0.5325984, -1.155832, 1, 0, 0, 1, 1,
-0.7614476, -0.2483785, -3.896709, 1, 0, 0, 1, 1,
-0.7600905, -0.1751543, -2.949245, 1, 0, 0, 1, 1,
-0.7600288, 0.7750666, -0.2732061, 1, 0, 0, 1, 1,
-0.7518252, -1.471885, -2.935893, 1, 0, 0, 1, 1,
-0.7503197, 0.7538242, -1.335547, 0, 0, 0, 1, 1,
-0.7475782, 0.7379091, -1.218376, 0, 0, 0, 1, 1,
-0.7450839, 0.529918, -0.8729117, 0, 0, 0, 1, 1,
-0.7420217, 1.566088, -0.1233473, 0, 0, 0, 1, 1,
-0.7203616, 1.543032, -0.5465642, 0, 0, 0, 1, 1,
-0.7162001, 0.2455547, 0.08713331, 0, 0, 0, 1, 1,
-0.7128156, 2.201062, -1.124666, 0, 0, 0, 1, 1,
-0.7101275, 0.6997179, 0.03294551, 1, 1, 1, 1, 1,
-0.7035337, -0.0650057, -2.64271, 1, 1, 1, 1, 1,
-0.7028006, 0.8115676, -1.655474, 1, 1, 1, 1, 1,
-0.7011133, -1.155074, -3.746553, 1, 1, 1, 1, 1,
-0.6999401, 0.8416933, -1.630863, 1, 1, 1, 1, 1,
-0.6956346, -3.017016, -2.675656, 1, 1, 1, 1, 1,
-0.6941062, 0.1887787, -2.193574, 1, 1, 1, 1, 1,
-0.6929097, 0.496817, -0.4058664, 1, 1, 1, 1, 1,
-0.6901723, -1.485638, -2.916826, 1, 1, 1, 1, 1,
-0.6888888, 0.2049512, -1.057205, 1, 1, 1, 1, 1,
-0.6852885, 0.2255706, 1.160774, 1, 1, 1, 1, 1,
-0.6841159, 0.3483516, -1.825347, 1, 1, 1, 1, 1,
-0.6819495, -1.37194, -2.613843, 1, 1, 1, 1, 1,
-0.6804339, 0.3382196, -2.546192, 1, 1, 1, 1, 1,
-0.6794959, 1.1302, -0.7130608, 1, 1, 1, 1, 1,
-0.6773015, -0.3497297, -3.964343, 0, 0, 1, 1, 1,
-0.6761525, 0.7033784, -1.153258, 1, 0, 0, 1, 1,
-0.6729586, -0.7117037, -0.2684003, 1, 0, 0, 1, 1,
-0.6704065, -0.63274, -2.607379, 1, 0, 0, 1, 1,
-0.6696327, 0.1625021, -1.90843, 1, 0, 0, 1, 1,
-0.6666952, 0.8023546, -0.9523458, 1, 0, 0, 1, 1,
-0.6644056, 0.420794, -2.265484, 0, 0, 0, 1, 1,
-0.6615987, -0.04601611, -2.010672, 0, 0, 0, 1, 1,
-0.6608105, 0.4868383, -0.5179198, 0, 0, 0, 1, 1,
-0.6606383, -0.5908628, -2.309789, 0, 0, 0, 1, 1,
-0.6570248, -0.5181637, -2.582763, 0, 0, 0, 1, 1,
-0.6564799, 0.5120474, -1.25269, 0, 0, 0, 1, 1,
-0.6540993, 0.2172105, -2.130705, 0, 0, 0, 1, 1,
-0.6532283, 1.064325, 1.726545, 1, 1, 1, 1, 1,
-0.6528837, -1.05883, -2.283107, 1, 1, 1, 1, 1,
-0.6460724, 1.145284, -0.8578925, 1, 1, 1, 1, 1,
-0.6458262, -0.3994555, -3.805891, 1, 1, 1, 1, 1,
-0.6423354, -0.1580068, -1.254103, 1, 1, 1, 1, 1,
-0.6384708, 1.088537, -0.813792, 1, 1, 1, 1, 1,
-0.6334519, 1.231765, -0.1790878, 1, 1, 1, 1, 1,
-0.6298296, 0.1356506, -2.905966, 1, 1, 1, 1, 1,
-0.6258004, -0.1282975, -1.668771, 1, 1, 1, 1, 1,
-0.623248, -1.328379, -1.997934, 1, 1, 1, 1, 1,
-0.6232378, -1.162088, -0.3004413, 1, 1, 1, 1, 1,
-0.6200616, -0.2551797, -0.7765385, 1, 1, 1, 1, 1,
-0.6068776, -0.08278051, -2.642961, 1, 1, 1, 1, 1,
-0.6035558, -1.208341, -3.798099, 1, 1, 1, 1, 1,
-0.6021104, -2.145149, -2.314487, 1, 1, 1, 1, 1,
-0.5981649, 0.5690815, -0.0538536, 0, 0, 1, 1, 1,
-0.5943677, -0.4173485, -2.662662, 1, 0, 0, 1, 1,
-0.5940318, -1.070525, -4.317062, 1, 0, 0, 1, 1,
-0.5869699, 1.07454, -0.7976385, 1, 0, 0, 1, 1,
-0.5865122, -0.8644044, -1.239651, 1, 0, 0, 1, 1,
-0.584654, -0.004248663, -1.8863, 1, 0, 0, 1, 1,
-0.5846061, 0.6994305, -0.1311759, 0, 0, 0, 1, 1,
-0.5824729, 0.8592013, -0.861191, 0, 0, 0, 1, 1,
-0.5821587, -0.6348373, -1.512002, 0, 0, 0, 1, 1,
-0.5729841, 1.354596, -1.613846, 0, 0, 0, 1, 1,
-0.5724687, -0.1645899, -1.490693, 0, 0, 0, 1, 1,
-0.5710692, 1.028842, 0.09216571, 0, 0, 0, 1, 1,
-0.5670961, 0.0740535, -1.920057, 0, 0, 0, 1, 1,
-0.5652387, 0.3408206, -0.7560986, 1, 1, 1, 1, 1,
-0.5626932, -1.211842, -2.776384, 1, 1, 1, 1, 1,
-0.5581203, -0.8111903, -3.230825, 1, 1, 1, 1, 1,
-0.5578816, -0.4478146, -1.977678, 1, 1, 1, 1, 1,
-0.5551379, -1.999658, -2.882748, 1, 1, 1, 1, 1,
-0.5532628, 1.200813, 0.1197388, 1, 1, 1, 1, 1,
-0.5472801, -0.4104606, -3.017232, 1, 1, 1, 1, 1,
-0.5453106, 0.4241498, -2.139424, 1, 1, 1, 1, 1,
-0.5448855, 0.8725179, -0.7597459, 1, 1, 1, 1, 1,
-0.5442344, 0.5109926, -0.9120542, 1, 1, 1, 1, 1,
-0.5440223, -0.292558, -2.306577, 1, 1, 1, 1, 1,
-0.5426061, -0.5618696, -0.6237843, 1, 1, 1, 1, 1,
-0.5411323, 0.2093714, -0.6006599, 1, 1, 1, 1, 1,
-0.5361621, -0.5423856, 0.2120831, 1, 1, 1, 1, 1,
-0.5324639, 1.197279, 0.2233038, 1, 1, 1, 1, 1,
-0.523357, -0.7194446, -2.026236, 0, 0, 1, 1, 1,
-0.5221232, 1.151704, -0.832593, 1, 0, 0, 1, 1,
-0.5209255, -1.429875, -2.644858, 1, 0, 0, 1, 1,
-0.5148785, -1.189395, -2.245568, 1, 0, 0, 1, 1,
-0.514619, 0.4576472, -0.3961896, 1, 0, 0, 1, 1,
-0.5117965, -2.018752, -3.335968, 1, 0, 0, 1, 1,
-0.5115507, -0.1741887, 0.07717796, 0, 0, 0, 1, 1,
-0.5089847, -0.3313939, -2.733739, 0, 0, 0, 1, 1,
-0.5006201, 0.9361672, 0.5833218, 0, 0, 0, 1, 1,
-0.4934345, 1.36035, 0.2758664, 0, 0, 0, 1, 1,
-0.4928508, 1.076391, -2.910253, 0, 0, 0, 1, 1,
-0.491117, 0.587266, -0.3234274, 0, 0, 0, 1, 1,
-0.4867296, 0.4832046, 0.6359979, 0, 0, 0, 1, 1,
-0.4856771, 0.107771, -0.4101181, 1, 1, 1, 1, 1,
-0.4768443, 0.002531651, -0.2331461, 1, 1, 1, 1, 1,
-0.4736231, 1.498553, -2.621946, 1, 1, 1, 1, 1,
-0.4724624, 0.4023718, -2.632415, 1, 1, 1, 1, 1,
-0.4722688, -0.9455177, -3.142963, 1, 1, 1, 1, 1,
-0.4713329, -1.767794, -3.115797, 1, 1, 1, 1, 1,
-0.4676114, -0.2291586, -0.9610006, 1, 1, 1, 1, 1,
-0.4670068, -0.1445831, -1.394792, 1, 1, 1, 1, 1,
-0.4646906, 1.606874, -0.4896901, 1, 1, 1, 1, 1,
-0.458125, -0.7881285, -0.03427719, 1, 1, 1, 1, 1,
-0.4579581, -1.002522, -1.289891, 1, 1, 1, 1, 1,
-0.4547104, -0.3982008, -2.848758, 1, 1, 1, 1, 1,
-0.4538499, 2.397293, 0.5637336, 1, 1, 1, 1, 1,
-0.4537885, 0.02966653, -1.433579, 1, 1, 1, 1, 1,
-0.4506638, 1.382581, -0.8035465, 1, 1, 1, 1, 1,
-0.4464085, 0.07296465, -2.231583, 0, 0, 1, 1, 1,
-0.4462913, 0.4020299, -0.39389, 1, 0, 0, 1, 1,
-0.4452344, -0.6251843, -2.88093, 1, 0, 0, 1, 1,
-0.4375332, 0.0837034, -1.900673, 1, 0, 0, 1, 1,
-0.4367307, 0.6189929, -1.785608, 1, 0, 0, 1, 1,
-0.4365043, 0.4294018, -0.5004863, 1, 0, 0, 1, 1,
-0.4350151, -0.68202, -2.893908, 0, 0, 0, 1, 1,
-0.4345114, 0.3260452, 1.431398, 0, 0, 0, 1, 1,
-0.4311363, -0.6568187, -1.316106, 0, 0, 0, 1, 1,
-0.429704, -1.558928, -2.728009, 0, 0, 0, 1, 1,
-0.4285582, 0.655242, -0.3804168, 0, 0, 0, 1, 1,
-0.4248618, -0.84083, -3.106523, 0, 0, 0, 1, 1,
-0.4139114, 0.714696, -2.306875, 0, 0, 0, 1, 1,
-0.4126433, 1.443462, 0.5293764, 1, 1, 1, 1, 1,
-0.4114463, -1.765289, -3.910464, 1, 1, 1, 1, 1,
-0.4073957, 0.2024471, 0.7997859, 1, 1, 1, 1, 1,
-0.405192, 0.05738431, -2.123374, 1, 1, 1, 1, 1,
-0.4018282, -0.4637304, -0.7531057, 1, 1, 1, 1, 1,
-0.3982162, -0.5496318, -2.179347, 1, 1, 1, 1, 1,
-0.3971705, -0.2145489, -1.162239, 1, 1, 1, 1, 1,
-0.3929909, 0.6126413, -0.5382172, 1, 1, 1, 1, 1,
-0.390155, 1.562551, 0.5962715, 1, 1, 1, 1, 1,
-0.3863044, -0.9215568, -2.093337, 1, 1, 1, 1, 1,
-0.3809137, 0.2452327, -1.57923, 1, 1, 1, 1, 1,
-0.3790737, -0.378296, -1.674858, 1, 1, 1, 1, 1,
-0.3781541, -0.1419268, -1.324986, 1, 1, 1, 1, 1,
-0.3648373, -1.878499, -3.537136, 1, 1, 1, 1, 1,
-0.3629676, -1.733302, -3.108829, 1, 1, 1, 1, 1,
-0.3605572, -0.5283437, -0.8966523, 0, 0, 1, 1, 1,
-0.3564821, 0.58283, -1.47045, 1, 0, 0, 1, 1,
-0.3500512, -0.4604187, -3.306416, 1, 0, 0, 1, 1,
-0.3481547, 1.107952, 1.117348, 1, 0, 0, 1, 1,
-0.3478252, -0.7306758, -4.233235, 1, 0, 0, 1, 1,
-0.3458017, -0.01463129, -1.193879, 1, 0, 0, 1, 1,
-0.345484, -0.9106364, -4.980168, 0, 0, 0, 1, 1,
-0.3432217, 1.000226, -0.04061585, 0, 0, 0, 1, 1,
-0.3427111, -1.188289, -3.951158, 0, 0, 0, 1, 1,
-0.3414266, -1.523886, -3.131217, 0, 0, 0, 1, 1,
-0.3408948, -1.06312, -3.023183, 0, 0, 0, 1, 1,
-0.3376035, -1.525914, -1.799448, 0, 0, 0, 1, 1,
-0.33754, -0.7612061, -1.443775, 0, 0, 0, 1, 1,
-0.3366328, 0.4382691, -0.7493283, 1, 1, 1, 1, 1,
-0.3293184, -0.2459109, -1.799729, 1, 1, 1, 1, 1,
-0.324585, 3.755931, -1.319318, 1, 1, 1, 1, 1,
-0.3200844, 1.914225, 0.5179034, 1, 1, 1, 1, 1,
-0.3108459, -0.3762713, -1.115237, 1, 1, 1, 1, 1,
-0.3084594, -0.09478326, -0.7521309, 1, 1, 1, 1, 1,
-0.3073654, 1.64783, 0.189414, 1, 1, 1, 1, 1,
-0.3021228, -0.2937251, -1.577396, 1, 1, 1, 1, 1,
-0.2965444, 1.112647, -0.7433375, 1, 1, 1, 1, 1,
-0.2934729, 0.7877075, -2.055961, 1, 1, 1, 1, 1,
-0.290596, 0.1931378, -1.862269, 1, 1, 1, 1, 1,
-0.2833073, 0.03208163, -1.743263, 1, 1, 1, 1, 1,
-0.2829981, 0.07384346, -3.651177, 1, 1, 1, 1, 1,
-0.2802074, 0.3215864, -0.9231344, 1, 1, 1, 1, 1,
-0.2789547, 1.370376, -0.7983957, 1, 1, 1, 1, 1,
-0.2783847, -0.7545652, -3.913204, 0, 0, 1, 1, 1,
-0.2740248, -0.7678722, -3.303801, 1, 0, 0, 1, 1,
-0.273932, 2.374677, -0.8417873, 1, 0, 0, 1, 1,
-0.2715817, 0.5278229, 0.7804146, 1, 0, 0, 1, 1,
-0.2699659, 0.8061481, -0.1296135, 1, 0, 0, 1, 1,
-0.2670149, 0.7729016, 0.6309983, 1, 0, 0, 1, 1,
-0.257704, 1.039938, 0.4653543, 0, 0, 0, 1, 1,
-0.2534036, 0.2603835, -0.03189267, 0, 0, 0, 1, 1,
-0.2498228, -0.2535121, -1.485331, 0, 0, 0, 1, 1,
-0.2496591, -0.1911807, -1.167686, 0, 0, 0, 1, 1,
-0.2469646, 1.061694, 0.4966044, 0, 0, 0, 1, 1,
-0.2456765, 1.08763, -2.101235, 0, 0, 0, 1, 1,
-0.2384956, 0.1636471, -1.00202, 0, 0, 0, 1, 1,
-0.2353534, -0.7391914, -2.150097, 1, 1, 1, 1, 1,
-0.2335386, -0.451266, -1.928742, 1, 1, 1, 1, 1,
-0.2313223, 1.417182, 1.085078, 1, 1, 1, 1, 1,
-0.2306341, 0.9241207, -0.2086743, 1, 1, 1, 1, 1,
-0.2297174, -1.582726, -3.219102, 1, 1, 1, 1, 1,
-0.2275903, -0.1179707, -3.256806, 1, 1, 1, 1, 1,
-0.2261221, -1.080748, -5.340242, 1, 1, 1, 1, 1,
-0.2207585, -0.5587641, -3.928523, 1, 1, 1, 1, 1,
-0.2188234, 1.032158, 2.22424, 1, 1, 1, 1, 1,
-0.2178194, -2.224891, -3.08698, 1, 1, 1, 1, 1,
-0.215427, -1.506519, -2.056145, 1, 1, 1, 1, 1,
-0.2144368, 0.7135026, -1.207364, 1, 1, 1, 1, 1,
-0.2143616, -0.04991068, -1.304395, 1, 1, 1, 1, 1,
-0.2142441, 0.6699244, 0.07510178, 1, 1, 1, 1, 1,
-0.2116164, 0.4959673, 0.8732209, 1, 1, 1, 1, 1,
-0.2090443, 0.5767891, 0.5627952, 0, 0, 1, 1, 1,
-0.2056506, -0.6059044, -0.735469, 1, 0, 0, 1, 1,
-0.2021544, 1.870062, -0.1007569, 1, 0, 0, 1, 1,
-0.2009862, -0.04307329, -2.321227, 1, 0, 0, 1, 1,
-0.2003496, -0.7615133, -1.991747, 1, 0, 0, 1, 1,
-0.1956063, -0.2422918, -3.705912, 1, 0, 0, 1, 1,
-0.1846634, 1.984722, -2.794848, 0, 0, 0, 1, 1,
-0.1833692, 0.2655258, -2.37009, 0, 0, 0, 1, 1,
-0.1824776, -0.6537004, -2.353478, 0, 0, 0, 1, 1,
-0.1814961, -1.170318, -5.100337, 0, 0, 0, 1, 1,
-0.180712, 1.327739, -1.245365, 0, 0, 0, 1, 1,
-0.1714856, 0.1495486, -2.285122, 0, 0, 0, 1, 1,
-0.167762, 0.6973156, -0.6612084, 0, 0, 0, 1, 1,
-0.1674449, -0.367356, -3.384371, 1, 1, 1, 1, 1,
-0.1648867, -0.1866949, -1.441707, 1, 1, 1, 1, 1,
-0.1639553, 0.317885, -2.249345, 1, 1, 1, 1, 1,
-0.161828, 0.2464914, -0.9031875, 1, 1, 1, 1, 1,
-0.1568572, -1.19596, -3.524206, 1, 1, 1, 1, 1,
-0.1550277, -0.2813086, -3.315535, 1, 1, 1, 1, 1,
-0.1549833, -1.439603, -1.787854, 1, 1, 1, 1, 1,
-0.1537377, 0.5707014, -0.7635781, 1, 1, 1, 1, 1,
-0.1505363, -0.6384883, -2.353924, 1, 1, 1, 1, 1,
-0.1504117, -0.906909, -4.128882, 1, 1, 1, 1, 1,
-0.1486875, 0.8915372, 0.535585, 1, 1, 1, 1, 1,
-0.1454108, 0.1995293, -0.3456723, 1, 1, 1, 1, 1,
-0.1386937, 1.723392, -1.41514, 1, 1, 1, 1, 1,
-0.1374996, -0.4131054, -3.332348, 1, 1, 1, 1, 1,
-0.1369397, 0.302582, 0.9287777, 1, 1, 1, 1, 1,
-0.1317202, 0.8415922, 0.4215934, 0, 0, 1, 1, 1,
-0.1245166, -0.5842286, -2.773139, 1, 0, 0, 1, 1,
-0.1212482, -0.2617344, -1.780558, 1, 0, 0, 1, 1,
-0.1177063, 1.187687, 0.388566, 1, 0, 0, 1, 1,
-0.1158096, 0.598428, 0.960466, 1, 0, 0, 1, 1,
-0.1149742, 0.781386, -1.441836, 1, 0, 0, 1, 1,
-0.1146297, 1.56444, -1.465076, 0, 0, 0, 1, 1,
-0.1134959, -0.5166593, -3.41998, 0, 0, 0, 1, 1,
-0.1071912, -0.9840989, -4.300707, 0, 0, 0, 1, 1,
-0.1060748, 0.2225682, 0.18591, 0, 0, 0, 1, 1,
-0.09979548, 0.3904149, -1.048426, 0, 0, 0, 1, 1,
-0.09684785, 1.981347, 0.7320017, 0, 0, 0, 1, 1,
-0.09616864, -0.2442112, -2.623015, 0, 0, 0, 1, 1,
-0.09418125, 2.521209, -1.464701, 1, 1, 1, 1, 1,
-0.09345791, 0.5330737, -0.4443662, 1, 1, 1, 1, 1,
-0.09190468, 0.742541, -0.6243531, 1, 1, 1, 1, 1,
-0.09155635, -0.4862475, -1.927936, 1, 1, 1, 1, 1,
-0.09014096, 0.7331197, 0.4610572, 1, 1, 1, 1, 1,
-0.09002787, 0.5633081, 0.7594039, 1, 1, 1, 1, 1,
-0.0879277, -1.722568, -5.708337, 1, 1, 1, 1, 1,
-0.087322, -0.876487, -3.431607, 1, 1, 1, 1, 1,
-0.08675861, -2.453912, -4.594675, 1, 1, 1, 1, 1,
-0.08449609, 0.198624, 1.479264, 1, 1, 1, 1, 1,
-0.08337384, 0.1530868, -1.287755, 1, 1, 1, 1, 1,
-0.07753733, -1.737929, -2.653414, 1, 1, 1, 1, 1,
-0.06710143, 0.9180818, 1.15113, 1, 1, 1, 1, 1,
-0.06214961, -0.7984997, -3.092137, 1, 1, 1, 1, 1,
-0.05945435, 0.6004822, 0.09899988, 1, 1, 1, 1, 1,
-0.04922749, 0.6022366, 1.885277, 0, 0, 1, 1, 1,
-0.04916918, 1.093012, 0.02519345, 1, 0, 0, 1, 1,
-0.04541658, 0.8428544, -0.1741693, 1, 0, 0, 1, 1,
-0.04057588, 1.17153, -0.5477816, 1, 0, 0, 1, 1,
-0.03882717, -0.4787385, -3.40945, 1, 0, 0, 1, 1,
-0.03423424, -0.2980334, -3.855942, 1, 0, 0, 1, 1,
-0.03080879, 0.7272972, -0.2634138, 0, 0, 0, 1, 1,
-0.02598196, 0.1968455, -1.613117, 0, 0, 0, 1, 1,
-0.02416744, -1.227882, -2.845762, 0, 0, 0, 1, 1,
-0.02018528, 0.4886782, 0.2738075, 0, 0, 0, 1, 1,
-0.0127881, -1.158824, -4.308957, 0, 0, 0, 1, 1,
-0.007728521, 0.05745573, -1.608958, 0, 0, 0, 1, 1,
-0.002070202, 0.688033, -0.2192771, 0, 0, 0, 1, 1,
0.00384867, -1.394632, 3.847438, 1, 1, 1, 1, 1,
0.004831501, -0.8734456, 4.406467, 1, 1, 1, 1, 1,
0.008657063, -0.6615922, 4.397073, 1, 1, 1, 1, 1,
0.01087136, -0.2093788, 3.995141, 1, 1, 1, 1, 1,
0.01349015, -1.404544, 3.789248, 1, 1, 1, 1, 1,
0.01453162, -1.036258, 2.531865, 1, 1, 1, 1, 1,
0.01634516, -1.610578, 2.067676, 1, 1, 1, 1, 1,
0.02001913, -1.203405, 4.078301, 1, 1, 1, 1, 1,
0.02239969, -0.07077636, 4.061513, 1, 1, 1, 1, 1,
0.02297913, -0.5606412, 3.711263, 1, 1, 1, 1, 1,
0.02576767, -0.1296474, 2.621987, 1, 1, 1, 1, 1,
0.02745031, -0.9626415, 2.035421, 1, 1, 1, 1, 1,
0.02765987, 0.04085564, 2.247795, 1, 1, 1, 1, 1,
0.0313514, 0.7792063, -1.105482, 1, 1, 1, 1, 1,
0.03142507, 0.1445688, 0.2190207, 1, 1, 1, 1, 1,
0.03207603, -1.38488, 2.937961, 0, 0, 1, 1, 1,
0.03754313, -0.8842136, 0.8563662, 1, 0, 0, 1, 1,
0.03774226, 1.024695, -2.002944, 1, 0, 0, 1, 1,
0.04389457, -0.5990426, 4.545148, 1, 0, 0, 1, 1,
0.04488249, 0.7164866, 0.02000807, 1, 0, 0, 1, 1,
0.04542559, -0.4627158, 3.850218, 1, 0, 0, 1, 1,
0.04690553, -1.319489, 4.409522, 0, 0, 0, 1, 1,
0.04805987, 0.8757622, 0.6439315, 0, 0, 0, 1, 1,
0.05449643, -0.1506337, 2.475339, 0, 0, 0, 1, 1,
0.05596873, 0.4862246, -1.5498, 0, 0, 0, 1, 1,
0.05696406, 1.040022, 0.4870876, 0, 0, 0, 1, 1,
0.05708187, -0.1643187, 1.465571, 0, 0, 0, 1, 1,
0.05741682, -0.1138, 1.885495, 0, 0, 0, 1, 1,
0.05834659, -1.37914, 2.986505, 1, 1, 1, 1, 1,
0.05970255, -1.416666, 3.076313, 1, 1, 1, 1, 1,
0.06072181, 0.3034807, -1.820492, 1, 1, 1, 1, 1,
0.06360836, -0.2922525, 2.348167, 1, 1, 1, 1, 1,
0.06587943, -0.448237, 4.185217, 1, 1, 1, 1, 1,
0.06963919, -0.3307957, 3.349583, 1, 1, 1, 1, 1,
0.06992804, -1.838713, 3.903966, 1, 1, 1, 1, 1,
0.07052322, -2.09693, 2.966627, 1, 1, 1, 1, 1,
0.07990814, -1.55229, 2.385135, 1, 1, 1, 1, 1,
0.07999682, 0.2761359, 0.5899385, 1, 1, 1, 1, 1,
0.08145837, -1.086987, 2.409859, 1, 1, 1, 1, 1,
0.08933374, 0.5275657, 0.4930601, 1, 1, 1, 1, 1,
0.09016832, 0.560834, -0.5470121, 1, 1, 1, 1, 1,
0.09326205, 0.022539, 1.140084, 1, 1, 1, 1, 1,
0.09471156, -1.414151, 4.764018, 1, 1, 1, 1, 1,
0.09535577, -0.7102762, 2.16832, 0, 0, 1, 1, 1,
0.09606867, 0.6731851, 1.677956, 1, 0, 0, 1, 1,
0.09684718, 0.1456058, 0.9010281, 1, 0, 0, 1, 1,
0.09791816, 0.8602521, -0.6462895, 1, 0, 0, 1, 1,
0.09984012, 1.120793, 1.876039, 1, 0, 0, 1, 1,
0.1034133, -0.673306, 3.551518, 1, 0, 0, 1, 1,
0.1034348, -0.7798681, 4.48183, 0, 0, 0, 1, 1,
0.106701, 0.2559331, 1.362942, 0, 0, 0, 1, 1,
0.1069525, 0.9865897, 0.4729503, 0, 0, 0, 1, 1,
0.1087059, -1.072188, 3.985355, 0, 0, 0, 1, 1,
0.1095091, -0.2797735, 2.590327, 0, 0, 0, 1, 1,
0.1159311, 0.7386111, 0.3944332, 0, 0, 0, 1, 1,
0.1163579, 1.387412, 0.0198469, 0, 0, 0, 1, 1,
0.1169152, -1.541323, 2.464622, 1, 1, 1, 1, 1,
0.120272, -1.510906, 3.645821, 1, 1, 1, 1, 1,
0.1218738, 0.1793554, -0.05363935, 1, 1, 1, 1, 1,
0.1250721, -0.2075189, 2.687066, 1, 1, 1, 1, 1,
0.1254754, 0.7603565, 0.2701901, 1, 1, 1, 1, 1,
0.133307, -1.074286, 0.8423295, 1, 1, 1, 1, 1,
0.1338662, -1.358134, 3.036066, 1, 1, 1, 1, 1,
0.134224, 0.247006, 0.181314, 1, 1, 1, 1, 1,
0.1347118, -0.6060656, 3.753759, 1, 1, 1, 1, 1,
0.1368708, -0.1797885, 3.480181, 1, 1, 1, 1, 1,
0.1369931, 0.9770244, 0.2862308, 1, 1, 1, 1, 1,
0.1402668, -0.3911066, 1.448045, 1, 1, 1, 1, 1,
0.1409729, 0.3200495, 1.480048, 1, 1, 1, 1, 1,
0.1448597, 0.1985171, 0.04954522, 1, 1, 1, 1, 1,
0.1506816, -1.129467, 3.659988, 1, 1, 1, 1, 1,
0.1518493, 0.158045, -0.5351716, 0, 0, 1, 1, 1,
0.1530588, 0.2131644, 0.4619763, 1, 0, 0, 1, 1,
0.1547989, -1.648728, 3.365806, 1, 0, 0, 1, 1,
0.158397, 0.5949208, 1.21127, 1, 0, 0, 1, 1,
0.1614476, -0.2795494, 1.030361, 1, 0, 0, 1, 1,
0.1634953, 0.79658, -0.5735041, 1, 0, 0, 1, 1,
0.1654473, 0.692972, -1.232905, 0, 0, 0, 1, 1,
0.1662827, -2.418872, 3.81731, 0, 0, 0, 1, 1,
0.1712734, 0.1585497, 0.4334503, 0, 0, 0, 1, 1,
0.172425, 1.966143, 0.8307747, 0, 0, 0, 1, 1,
0.1730044, -0.1474279, 1.128238, 0, 0, 0, 1, 1,
0.1733515, 1.668495, -0.4780172, 0, 0, 0, 1, 1,
0.1741575, -0.672157, 3.916071, 0, 0, 0, 1, 1,
0.1743512, 0.2215296, 0.5687615, 1, 1, 1, 1, 1,
0.176097, -0.6925435, 1.594885, 1, 1, 1, 1, 1,
0.1802495, 0.5869802, 1.728995, 1, 1, 1, 1, 1,
0.1826323, -2.929106, 3.298913, 1, 1, 1, 1, 1,
0.1851255, 1.570553, 1.219043, 1, 1, 1, 1, 1,
0.1866283, -1.680966, 4.83292, 1, 1, 1, 1, 1,
0.1889801, -0.6774341, 0.1239324, 1, 1, 1, 1, 1,
0.1900024, 0.8945642, 1.542561, 1, 1, 1, 1, 1,
0.1926008, 0.1500976, 0.269318, 1, 1, 1, 1, 1,
0.1926054, -1.058542, 5.336317, 1, 1, 1, 1, 1,
0.1947185, 0.5830151, 0.7522658, 1, 1, 1, 1, 1,
0.1973561, -2.552278, 2.796532, 1, 1, 1, 1, 1,
0.1975435, -1.563325, 1.537304, 1, 1, 1, 1, 1,
0.2000739, 0.5392927, 0.7005229, 1, 1, 1, 1, 1,
0.2016843, -0.2858457, 4.685274, 1, 1, 1, 1, 1,
0.2029844, 1.450253, 0.5791624, 0, 0, 1, 1, 1,
0.2064319, 0.5181502, -0.5412493, 1, 0, 0, 1, 1,
0.2079085, 1.907873, 0.1089255, 1, 0, 0, 1, 1,
0.2100686, 1.699713, 0.5984462, 1, 0, 0, 1, 1,
0.2181403, 0.2050086, 1.492965, 1, 0, 0, 1, 1,
0.2188426, -0.8675708, 1.377466, 1, 0, 0, 1, 1,
0.2203404, -0.6678666, 2.944351, 0, 0, 0, 1, 1,
0.2274328, 1.309125, 0.252999, 0, 0, 0, 1, 1,
0.2298458, -0.4168686, 1.766206, 0, 0, 0, 1, 1,
0.2304221, 2.016675, 0.5378265, 0, 0, 0, 1, 1,
0.2315599, -0.641191, 3.291071, 0, 0, 0, 1, 1,
0.2396456, -1.032269, 2.784218, 0, 0, 0, 1, 1,
0.2453607, -0.1021919, 1.622909, 0, 0, 0, 1, 1,
0.2549685, 0.3245792, -0.1724239, 1, 1, 1, 1, 1,
0.2637782, 0.9056934, -0.1940412, 1, 1, 1, 1, 1,
0.2648731, 0.4387935, 1.285944, 1, 1, 1, 1, 1,
0.2657693, -0.729189, 1.951048, 1, 1, 1, 1, 1,
0.2673207, -1.769508, 2.626055, 1, 1, 1, 1, 1,
0.2675774, -0.9083283, 2.352337, 1, 1, 1, 1, 1,
0.2690997, -0.6792529, 3.768279, 1, 1, 1, 1, 1,
0.2728366, -0.576942, 2.748242, 1, 1, 1, 1, 1,
0.2737655, 2.896982, 0.7180446, 1, 1, 1, 1, 1,
0.2784089, 1.399897, -1.020326, 1, 1, 1, 1, 1,
0.2789948, 0.4835905, 0.3756267, 1, 1, 1, 1, 1,
0.2820224, -0.2578277, 2.017728, 1, 1, 1, 1, 1,
0.2879551, 1.418682, 1.111641, 1, 1, 1, 1, 1,
0.2906393, 0.972789, -0.1224884, 1, 1, 1, 1, 1,
0.292104, 1.55811, 0.8880929, 1, 1, 1, 1, 1,
0.2923987, -1.139158, 4.557795, 0, 0, 1, 1, 1,
0.294002, -0.424209, 2.579943, 1, 0, 0, 1, 1,
0.2947159, -0.08203178, 3.062608, 1, 0, 0, 1, 1,
0.2998044, 0.6206939, 0.5420484, 1, 0, 0, 1, 1,
0.3041461, 1.198993, -0.3021279, 1, 0, 0, 1, 1,
0.304572, -1.642628, 3.302541, 1, 0, 0, 1, 1,
0.3068773, -1.116334, 1.269091, 0, 0, 0, 1, 1,
0.3075042, -0.3893535, 1.944994, 0, 0, 0, 1, 1,
0.3105942, -0.2183544, 1.528663, 0, 0, 0, 1, 1,
0.3175602, 1.118843, 1.042578, 0, 0, 0, 1, 1,
0.3189268, 0.2164249, 2.486617, 0, 0, 0, 1, 1,
0.3196042, -1.461307, 3.532726, 0, 0, 0, 1, 1,
0.3199632, -0.5986679, 1.975899, 0, 0, 0, 1, 1,
0.3212979, 1.82836, 0.878679, 1, 1, 1, 1, 1,
0.3238716, 1.653345, 2.475406, 1, 1, 1, 1, 1,
0.3280657, -1.039754, 2.993037, 1, 1, 1, 1, 1,
0.3313269, -0.2515304, 2.915843, 1, 1, 1, 1, 1,
0.3316373, 0.8172358, 0.3520423, 1, 1, 1, 1, 1,
0.3349869, 0.3451304, 0.1686229, 1, 1, 1, 1, 1,
0.3384408, -0.7478091, 2.534174, 1, 1, 1, 1, 1,
0.3424328, -1.924489, 4.239827, 1, 1, 1, 1, 1,
0.3430876, -1.275207, 0.7450919, 1, 1, 1, 1, 1,
0.3455494, -1.228776, 2.441075, 1, 1, 1, 1, 1,
0.3482727, -0.4286523, 3.179563, 1, 1, 1, 1, 1,
0.3548401, -0.09700249, 1.671043, 1, 1, 1, 1, 1,
0.3559191, -0.0774419, 2.070445, 1, 1, 1, 1, 1,
0.3574656, 1.076514, -0.7635906, 1, 1, 1, 1, 1,
0.3575611, -0.9470408, 3.745033, 1, 1, 1, 1, 1,
0.3618342, 1.145707, 2.754219, 0, 0, 1, 1, 1,
0.3642506, -0.9408626, 2.653446, 1, 0, 0, 1, 1,
0.3672674, -1.507972, 2.15277, 1, 0, 0, 1, 1,
0.3682269, 1.076586, 0.5630754, 1, 0, 0, 1, 1,
0.3700382, 0.5277789, 0.9057088, 1, 0, 0, 1, 1,
0.3710713, 1.460673, -0.2230278, 1, 0, 0, 1, 1,
0.3714822, 0.006556571, 0.7253305, 0, 0, 0, 1, 1,
0.3728294, -0.5153022, 1.726327, 0, 0, 0, 1, 1,
0.3739908, -1.032806, 2.989562, 0, 0, 0, 1, 1,
0.3743193, 0.4715645, 0.9109987, 0, 0, 0, 1, 1,
0.3779999, 0.06419569, 1.82932, 0, 0, 0, 1, 1,
0.3839705, -0.9609285, 3.278681, 0, 0, 0, 1, 1,
0.3850634, -0.920289, 4.166132, 0, 0, 0, 1, 1,
0.3901678, 0.4777463, 0.5456387, 1, 1, 1, 1, 1,
0.3924765, -0.302806, 3.854427, 1, 1, 1, 1, 1,
0.3928183, -0.1723453, 0.58423, 1, 1, 1, 1, 1,
0.3932402, -0.4981033, 3.168189, 1, 1, 1, 1, 1,
0.393787, 0.1490544, 1.913575, 1, 1, 1, 1, 1,
0.3978325, -0.4231393, 3.826149, 1, 1, 1, 1, 1,
0.4035456, -0.1390445, 2.540017, 1, 1, 1, 1, 1,
0.405811, -0.2897815, 1.053027, 1, 1, 1, 1, 1,
0.4063356, -0.06046442, 0.8303388, 1, 1, 1, 1, 1,
0.4088711, -1.960563, 0.4960619, 1, 1, 1, 1, 1,
0.4101312, 0.8228506, 0.9887124, 1, 1, 1, 1, 1,
0.4127279, 0.1329808, 3.088152, 1, 1, 1, 1, 1,
0.417106, -0.258853, 1.21265, 1, 1, 1, 1, 1,
0.4182596, 1.465763, -0.7513624, 1, 1, 1, 1, 1,
0.4197229, -0.8382797, 2.822614, 1, 1, 1, 1, 1,
0.4329841, 0.4175302, 2.138968, 0, 0, 1, 1, 1,
0.4331003, 0.1855766, 0.5575891, 1, 0, 0, 1, 1,
0.4350312, 0.4473208, 1.603444, 1, 0, 0, 1, 1,
0.4412589, 0.4984575, -0.465148, 1, 0, 0, 1, 1,
0.4482942, -1.503435, 2.990798, 1, 0, 0, 1, 1,
0.4496593, 0.6508599, 1.165593, 1, 0, 0, 1, 1,
0.4513279, -1.724847, 2.781517, 0, 0, 0, 1, 1,
0.4516656, 0.221193, 0.2042864, 0, 0, 0, 1, 1,
0.452405, 0.6612093, 2.130329, 0, 0, 0, 1, 1,
0.4529464, -0.0647715, 2.56751, 0, 0, 0, 1, 1,
0.4563522, -0.789823, 2.675731, 0, 0, 0, 1, 1,
0.4582124, 1.091503, -0.7533628, 0, 0, 0, 1, 1,
0.4596449, -0.7282318, 3.282085, 0, 0, 0, 1, 1,
0.4618392, -0.6495525, 4.015154, 1, 1, 1, 1, 1,
0.463236, -0.6943501, 2.639572, 1, 1, 1, 1, 1,
0.4688022, 0.6099449, 0.3017838, 1, 1, 1, 1, 1,
0.4689363, 0.5535373, -0.6431428, 1, 1, 1, 1, 1,
0.4736761, -0.6376354, 4.347119, 1, 1, 1, 1, 1,
0.4775883, 0.4873946, 0.4473698, 1, 1, 1, 1, 1,
0.4808677, -0.2971837, 1.101028, 1, 1, 1, 1, 1,
0.4842865, -0.07180692, 0.8751922, 1, 1, 1, 1, 1,
0.4857289, -1.704958, 1.536113, 1, 1, 1, 1, 1,
0.4892699, 0.1531666, 1.389111, 1, 1, 1, 1, 1,
0.4921914, -0.376403, 2.265007, 1, 1, 1, 1, 1,
0.4958571, 0.7456515, 2.766173, 1, 1, 1, 1, 1,
0.4969652, 1.308946, 0.2085407, 1, 1, 1, 1, 1,
0.5033365, -0.3084191, 1.951535, 1, 1, 1, 1, 1,
0.5042165, -1.55286, 1.828182, 1, 1, 1, 1, 1,
0.5124034, 0.8412759, 0.02740346, 0, 0, 1, 1, 1,
0.5127132, -0.3442805, 1.835763, 1, 0, 0, 1, 1,
0.5202289, -1.340889, 3.305169, 1, 0, 0, 1, 1,
0.5202539, -0.4396801, 2.522897, 1, 0, 0, 1, 1,
0.5220639, -0.9973524, 2.969035, 1, 0, 0, 1, 1,
0.5252249, -0.6371788, 4.362728, 1, 0, 0, 1, 1,
0.5313497, -1.357467, 2.312583, 0, 0, 0, 1, 1,
0.5322727, 1.282382, 0.5097563, 0, 0, 0, 1, 1,
0.5338477, 0.2723525, 0.4878412, 0, 0, 0, 1, 1,
0.537755, -1.006706, 2.16298, 0, 0, 0, 1, 1,
0.5401816, -0.007824226, 0.7247784, 0, 0, 0, 1, 1,
0.5407439, 0.2969542, 0.5367534, 0, 0, 0, 1, 1,
0.5416694, 1.059817, 0.4016621, 0, 0, 0, 1, 1,
0.5448014, -1.087989, 4.376227, 1, 1, 1, 1, 1,
0.545381, -0.9018369, 3.477219, 1, 1, 1, 1, 1,
0.551217, 0.393858, 1.473097, 1, 1, 1, 1, 1,
0.5643417, 0.4904548, 2.405493, 1, 1, 1, 1, 1,
0.5651615, 0.6227575, -0.7610721, 1, 1, 1, 1, 1,
0.5653731, -0.4068406, 1.800225, 1, 1, 1, 1, 1,
0.5656271, -0.4071267, 0.5792134, 1, 1, 1, 1, 1,
0.5780939, 0.7281916, 1.40786, 1, 1, 1, 1, 1,
0.5809157, 0.5600414, -0.4162399, 1, 1, 1, 1, 1,
0.5814956, 1.478441, 0.2783833, 1, 1, 1, 1, 1,
0.581566, 0.5513235, 0.9196138, 1, 1, 1, 1, 1,
0.5878211, 1.410106, 0.06505465, 1, 1, 1, 1, 1,
0.5963941, -0.8527433, 2.048457, 1, 1, 1, 1, 1,
0.5978129, 0.3161578, 1.255434, 1, 1, 1, 1, 1,
0.6017409, 0.517235, 1.199055, 1, 1, 1, 1, 1,
0.6025195, -0.1073067, 2.650437, 0, 0, 1, 1, 1,
0.6040407, -0.7327998, 2.828444, 1, 0, 0, 1, 1,
0.606017, 1.830003, -0.8172334, 1, 0, 0, 1, 1,
0.606674, 1.211883, 1.4922, 1, 0, 0, 1, 1,
0.6107397, -0.8814587, 2.005439, 1, 0, 0, 1, 1,
0.6113188, 0.07387744, 0.7474677, 1, 0, 0, 1, 1,
0.6135938, 1.669377, 0.2117314, 0, 0, 0, 1, 1,
0.6187719, -0.8466949, 2.683477, 0, 0, 0, 1, 1,
0.6210667, 1.482282, 0.878364, 0, 0, 0, 1, 1,
0.6268223, -0.1255429, 1.115234, 0, 0, 0, 1, 1,
0.6322668, -0.5583966, 2.862404, 0, 0, 0, 1, 1,
0.637239, -0.1882671, 1.064885, 0, 0, 0, 1, 1,
0.638155, 0.05334768, 2.959837, 0, 0, 0, 1, 1,
0.6428685, 0.1671692, 0.5016493, 1, 1, 1, 1, 1,
0.6448151, 0.2948889, 1.547297, 1, 1, 1, 1, 1,
0.6491023, 1.132064, -0.4930817, 1, 1, 1, 1, 1,
0.6503829, -1.049753, 3.053921, 1, 1, 1, 1, 1,
0.6508248, 0.5994044, 1.234322, 1, 1, 1, 1, 1,
0.6587373, 0.8439938, 0.2079147, 1, 1, 1, 1, 1,
0.6639801, 0.08981559, 2.454114, 1, 1, 1, 1, 1,
0.6653204, 0.1730377, 0.5086233, 1, 1, 1, 1, 1,
0.6685121, 0.0699604, 1.682327, 1, 1, 1, 1, 1,
0.6699507, 2.064099, 0.1563082, 1, 1, 1, 1, 1,
0.6781949, 1.075857, -0.1869141, 1, 1, 1, 1, 1,
0.687013, -0.2757303, 1.737542, 1, 1, 1, 1, 1,
0.687533, 1.820292, 1.695053, 1, 1, 1, 1, 1,
0.6876842, -0.4161469, 3.300838, 1, 1, 1, 1, 1,
0.6891646, -1.985116, 2.680353, 1, 1, 1, 1, 1,
0.6900054, -0.8334882, 2.324243, 0, 0, 1, 1, 1,
0.6956953, 0.621558, 0.6615799, 1, 0, 0, 1, 1,
0.6973213, 0.07813837, 3.287209, 1, 0, 0, 1, 1,
0.6998449, -0.321963, 2.074579, 1, 0, 0, 1, 1,
0.7056851, 1.941207, 0.7774978, 1, 0, 0, 1, 1,
0.7062652, 0.8962196, -0.3071102, 1, 0, 0, 1, 1,
0.7080702, -0.4821628, 1.378015, 0, 0, 0, 1, 1,
0.7084035, -0.2478068, 2.856479, 0, 0, 0, 1, 1,
0.7104826, -1.005155, 2.253027, 0, 0, 0, 1, 1,
0.7168717, -0.1548468, 1.183251, 0, 0, 0, 1, 1,
0.7211441, 0.0794339, 2.140961, 0, 0, 0, 1, 1,
0.7265202, -0.362497, 3.549669, 0, 0, 0, 1, 1,
0.7324856, 0.7697765, 2.295566, 0, 0, 0, 1, 1,
0.7332567, -0.3115921, 1.909963, 1, 1, 1, 1, 1,
0.7353805, 1.693921, 1.508175, 1, 1, 1, 1, 1,
0.7359716, -0.3126681, 3.354027, 1, 1, 1, 1, 1,
0.7372126, -0.9223962, 1.137783, 1, 1, 1, 1, 1,
0.7376997, 0.8954291, 0.3175823, 1, 1, 1, 1, 1,
0.7384891, 0.88509, 0.6975403, 1, 1, 1, 1, 1,
0.7430735, -0.4523845, 2.521269, 1, 1, 1, 1, 1,
0.743589, 0.9940109, 1.312816, 1, 1, 1, 1, 1,
0.7482449, -0.2055677, 2.147541, 1, 1, 1, 1, 1,
0.7588709, -1.305349, 2.919864, 1, 1, 1, 1, 1,
0.7593346, -0.3550093, 1.577823, 1, 1, 1, 1, 1,
0.7596233, 0.2133857, 2.618123, 1, 1, 1, 1, 1,
0.7600167, -0.3882925, 1.069908, 1, 1, 1, 1, 1,
0.7638294, 0.2943216, 1.309106, 1, 1, 1, 1, 1,
0.7741305, 0.817169, -0.2782336, 1, 1, 1, 1, 1,
0.7806929, 0.4702595, 0.1519922, 0, 0, 1, 1, 1,
0.7842399, 0.6552268, 2.354719, 1, 0, 0, 1, 1,
0.7842973, -1.382504, 2.695436, 1, 0, 0, 1, 1,
0.7864826, -0.2425403, 3.083921, 1, 0, 0, 1, 1,
0.7912183, -0.8563209, 1.700357, 1, 0, 0, 1, 1,
0.7963912, 0.4027913, 1.463428, 1, 0, 0, 1, 1,
0.7982806, -0.08773496, 1.877292, 0, 0, 0, 1, 1,
0.8046184, -0.574841, 1.830362, 0, 0, 0, 1, 1,
0.8086039, -0.7435417, 2.698741, 0, 0, 0, 1, 1,
0.8132895, 1.711649, 0.9886839, 0, 0, 0, 1, 1,
0.8138404, 0.5841007, 1.015423, 0, 0, 0, 1, 1,
0.8139605, -0.9455563, 2.038289, 0, 0, 0, 1, 1,
0.8172316, -0.7662593, 3.425574, 0, 0, 0, 1, 1,
0.8197644, -0.3830603, 1.684771, 1, 1, 1, 1, 1,
0.8209541, -0.1999535, 1.432525, 1, 1, 1, 1, 1,
0.8284, 0.8508014, -0.9042972, 1, 1, 1, 1, 1,
0.8301348, 0.8697457, -0.3615629, 1, 1, 1, 1, 1,
0.833958, -1.17494, 3.363865, 1, 1, 1, 1, 1,
0.8372461, 0.8021708, 0.4270862, 1, 1, 1, 1, 1,
0.8398764, -0.3111003, 0.7181219, 1, 1, 1, 1, 1,
0.840715, -1.956459, 2.913789, 1, 1, 1, 1, 1,
0.8488857, -0.5091096, 1.882201, 1, 1, 1, 1, 1,
0.8491551, -0.6476214, 1.242841, 1, 1, 1, 1, 1,
0.8537762, -1.585442, 1.413929, 1, 1, 1, 1, 1,
0.8589885, -0.3427145, 2.523357, 1, 1, 1, 1, 1,
0.8619875, 0.07351019, 2.15939, 1, 1, 1, 1, 1,
0.8654543, 0.05440691, 3.801861, 1, 1, 1, 1, 1,
0.8688223, 0.9906613, 1.969047, 1, 1, 1, 1, 1,
0.8721082, -0.02141194, 2.039306, 0, 0, 1, 1, 1,
0.8745225, 0.04583761, 2.263777, 1, 0, 0, 1, 1,
0.8757845, -0.7635793, 1.123527, 1, 0, 0, 1, 1,
0.8766435, -1.484822, 1.871134, 1, 0, 0, 1, 1,
0.8801287, -1.734738, 3.076171, 1, 0, 0, 1, 1,
0.8809527, 0.9320346, -0.3764258, 1, 0, 0, 1, 1,
0.8818593, -0.3054578, 0.7191406, 0, 0, 0, 1, 1,
0.8873577, -0.006722637, 0.7420719, 0, 0, 0, 1, 1,
0.8892321, -0.8759671, 2.821467, 0, 0, 0, 1, 1,
0.8913441, 0.7553139, 2.118151, 0, 0, 0, 1, 1,
0.894618, -0.2797386, 2.972504, 0, 0, 0, 1, 1,
0.8983021, 1.651071, 0.2337238, 0, 0, 0, 1, 1,
0.9000035, -0.6610211, 2.044247, 0, 0, 0, 1, 1,
0.9036215, -0.009614077, 2.10663, 1, 1, 1, 1, 1,
0.9052066, -0.003069618, 2.165273, 1, 1, 1, 1, 1,
0.9062297, -1.262226, 3.087985, 1, 1, 1, 1, 1,
0.9086069, -0.7243352, 2.173533, 1, 1, 1, 1, 1,
0.9094204, -0.5538996, 1.727902, 1, 1, 1, 1, 1,
0.9106458, 0.2517225, 2.995004, 1, 1, 1, 1, 1,
0.9233031, -2.649715, 2.478547, 1, 1, 1, 1, 1,
0.9284445, 2.158555, 1.065863, 1, 1, 1, 1, 1,
0.9297054, 0.5620077, 1.758665, 1, 1, 1, 1, 1,
0.947298, -1.052979, 1.367133, 1, 1, 1, 1, 1,
0.9553696, 0.1563539, 2.49499, 1, 1, 1, 1, 1,
0.9554453, -0.9682665, 2.212465, 1, 1, 1, 1, 1,
0.9634252, 0.8810477, 0.8617326, 1, 1, 1, 1, 1,
0.970256, 0.9858547, -0.01706126, 1, 1, 1, 1, 1,
0.9723924, 1.408152, 1.861499, 1, 1, 1, 1, 1,
0.9739021, -0.304475, 1.203138, 0, 0, 1, 1, 1,
0.9777678, 1.300708, 0.9085615, 1, 0, 0, 1, 1,
0.9872814, 0.3945222, 2.452129, 1, 0, 0, 1, 1,
0.9880563, -0.7121615, 1.028039, 1, 0, 0, 1, 1,
0.9929978, -0.3229964, 1.645389, 1, 0, 0, 1, 1,
0.9963341, -0.7313885, 3.243024, 1, 0, 0, 1, 1,
1.005512, -0.7272665, 3.890052, 0, 0, 0, 1, 1,
1.007867, 0.5410762, 0.2075455, 0, 0, 0, 1, 1,
1.012163, 0.4729367, -0.4014032, 0, 0, 0, 1, 1,
1.027, -1.615763, 4.167343, 0, 0, 0, 1, 1,
1.030711, -1.802478, 2.680288, 0, 0, 0, 1, 1,
1.032537, 0.979001, 0.2572229, 0, 0, 0, 1, 1,
1.040412, 1.872434, -2.035912, 0, 0, 0, 1, 1,
1.040825, 0.3107149, 0.01654836, 1, 1, 1, 1, 1,
1.04244, 1.028307, -0.1842746, 1, 1, 1, 1, 1,
1.045356, 0.2898662, 0.2054146, 1, 1, 1, 1, 1,
1.04632, 0.8826404, 0.8482314, 1, 1, 1, 1, 1,
1.050467, 1.582129, 0.3754645, 1, 1, 1, 1, 1,
1.051478, -0.3848086, 2.199781, 1, 1, 1, 1, 1,
1.058807, 0.7522964, 1.974646, 1, 1, 1, 1, 1,
1.059313, 0.9351096, -0.6316769, 1, 1, 1, 1, 1,
1.065085, 1.255271, 0.8891089, 1, 1, 1, 1, 1,
1.068879, -1.043628, 5.099846, 1, 1, 1, 1, 1,
1.069856, -0.3259282, 1.906472, 1, 1, 1, 1, 1,
1.084028, -0.2294844, 1.115835, 1, 1, 1, 1, 1,
1.084908, -0.7549376, 2.500654, 1, 1, 1, 1, 1,
1.106594, 0.2250298, -0.1332092, 1, 1, 1, 1, 1,
1.106986, 0.5844551, 1.165203, 1, 1, 1, 1, 1,
1.110027, -0.8419315, 3.364405, 0, 0, 1, 1, 1,
1.11004, -0.8093066, 3.174664, 1, 0, 0, 1, 1,
1.110966, -0.693565, 1.039826, 1, 0, 0, 1, 1,
1.130031, -0.3973432, 1.94491, 1, 0, 0, 1, 1,
1.130193, 0.7260212, 0.3904406, 1, 0, 0, 1, 1,
1.132549, -0.3628825, 2.867949, 1, 0, 0, 1, 1,
1.135774, -0.4326386, 0.934897, 0, 0, 0, 1, 1,
1.138161, 2.261905, 0.08755099, 0, 0, 0, 1, 1,
1.144962, -0.683055, 0.5243081, 0, 0, 0, 1, 1,
1.148411, 1.132345, 0.8209218, 0, 0, 0, 1, 1,
1.149358, -0.8912701, 2.213378, 0, 0, 0, 1, 1,
1.150669, -0.8937047, 2.296842, 0, 0, 0, 1, 1,
1.151626, 0.7222822, 1.940852, 0, 0, 0, 1, 1,
1.151809, 0.08947243, 0.6728978, 1, 1, 1, 1, 1,
1.154554, 0.4700231, -0.2164465, 1, 1, 1, 1, 1,
1.157634, 0.9594058, -0.5947211, 1, 1, 1, 1, 1,
1.160749, 0.4721134, 2.482506, 1, 1, 1, 1, 1,
1.16894, -0.3842765, 1.006646, 1, 1, 1, 1, 1,
1.172374, 0.8434424, 0.7658763, 1, 1, 1, 1, 1,
1.177142, 1.553068, 0.7009055, 1, 1, 1, 1, 1,
1.183329, 2.499807, 0.888932, 1, 1, 1, 1, 1,
1.187561, 0.1080061, 0.7206635, 1, 1, 1, 1, 1,
1.18764, -0.143982, 1.832494, 1, 1, 1, 1, 1,
1.18785, 1.415705, 0.5093074, 1, 1, 1, 1, 1,
1.197976, -0.6411036, 3.654559, 1, 1, 1, 1, 1,
1.210344, 0.1089611, 2.310263, 1, 1, 1, 1, 1,
1.219053, -0.8522938, 2.368874, 1, 1, 1, 1, 1,
1.219741, -0.1717213, 2.46376, 1, 1, 1, 1, 1,
1.222573, 1.597198, 1.679547, 0, 0, 1, 1, 1,
1.223758, 0.4960305, -0.994038, 1, 0, 0, 1, 1,
1.224711, 1.981432, 1.523904, 1, 0, 0, 1, 1,
1.232357, -1.197412, 2.095743, 1, 0, 0, 1, 1,
1.234308, -0.1434889, 2.117496, 1, 0, 0, 1, 1,
1.24539, 1.05503, 0.8642938, 1, 0, 0, 1, 1,
1.250159, 0.1052977, 0.8766368, 0, 0, 0, 1, 1,
1.254137, -0.6153448, 1.593468, 0, 0, 0, 1, 1,
1.260787, -1.091542, 1.478627, 0, 0, 0, 1, 1,
1.262446, -0.1486793, 1.916673, 0, 0, 0, 1, 1,
1.271782, 0.454291, -0.4270176, 0, 0, 0, 1, 1,
1.271998, -1.032633, 1.735764, 0, 0, 0, 1, 1,
1.280511, -0.5111807, 3.512777, 0, 0, 0, 1, 1,
1.287697, -0.9893827, 0.9758925, 1, 1, 1, 1, 1,
1.289621, 0.6507037, 0.8406196, 1, 1, 1, 1, 1,
1.30549, -0.4271182, 3.522525, 1, 1, 1, 1, 1,
1.306782, -1.467653, 2.268296, 1, 1, 1, 1, 1,
1.308531, -1.53519, 2.00598, 1, 1, 1, 1, 1,
1.310154, 0.838124, 1.157513, 1, 1, 1, 1, 1,
1.316852, 2.535664, -0.6076224, 1, 1, 1, 1, 1,
1.322194, 2.253225, -1.053088, 1, 1, 1, 1, 1,
1.331933, 0.2466655, 1.900776, 1, 1, 1, 1, 1,
1.333587, -0.7056439, 2.023627, 1, 1, 1, 1, 1,
1.336353, -0.1072107, 1.308257, 1, 1, 1, 1, 1,
1.343898, 1.272172, 1.980399, 1, 1, 1, 1, 1,
1.346354, -0.7933323, 2.235273, 1, 1, 1, 1, 1,
1.359134, -0.05045227, 2.184774, 1, 1, 1, 1, 1,
1.362047, 0.2107558, 1.365833, 1, 1, 1, 1, 1,
1.36386, 1.051942, 2.147709, 0, 0, 1, 1, 1,
1.364573, -0.7363866, 1.808014, 1, 0, 0, 1, 1,
1.373457, 1.05926, 0.8660777, 1, 0, 0, 1, 1,
1.378954, -1.955601, 1.166315, 1, 0, 0, 1, 1,
1.384905, -0.5864094, 2.452796, 1, 0, 0, 1, 1,
1.406389, -0.5663359, 1.674097, 1, 0, 0, 1, 1,
1.407898, 0.5957148, 0.7819724, 0, 0, 0, 1, 1,
1.412413, -0.5420547, 2.813439, 0, 0, 0, 1, 1,
1.429439, 0.6968591, 1.304367, 0, 0, 0, 1, 1,
1.439073, 0.7481134, 2.002598, 0, 0, 0, 1, 1,
1.445307, 0.5739717, 1.096586, 0, 0, 0, 1, 1,
1.454623, -0.2169816, 1.536898, 0, 0, 0, 1, 1,
1.4829, -1.090625, 2.700409, 0, 0, 0, 1, 1,
1.484607, 0.358671, 1.562226, 1, 1, 1, 1, 1,
1.48763, -0.6172674, 0.5787672, 1, 1, 1, 1, 1,
1.527182, 2.033185, 0.5908517, 1, 1, 1, 1, 1,
1.531356, -0.5246519, 1.894378, 1, 1, 1, 1, 1,
1.53372, 1.371305, -0.7700611, 1, 1, 1, 1, 1,
1.539912, -1.605541, 2.021203, 1, 1, 1, 1, 1,
1.540839, -1.639682, 3.77112, 1, 1, 1, 1, 1,
1.552446, -1.013069, 2.453385, 1, 1, 1, 1, 1,
1.559475, 1.770837, 2.481995, 1, 1, 1, 1, 1,
1.564909, 1.97275, 1.079151, 1, 1, 1, 1, 1,
1.56497, -1.277522, 2.589113, 1, 1, 1, 1, 1,
1.566364, -0.9316123, 0.8312395, 1, 1, 1, 1, 1,
1.577244, 0.004684464, 1.241831, 1, 1, 1, 1, 1,
1.58009, -0.3527206, 3.258721, 1, 1, 1, 1, 1,
1.580534, 1.4785, 1.791463, 1, 1, 1, 1, 1,
1.58133, -0.3756572, 2.040877, 0, 0, 1, 1, 1,
1.585916, -0.09654023, 2.051165, 1, 0, 0, 1, 1,
1.617359, -0.4915226, 2.623504, 1, 0, 0, 1, 1,
1.619891, 0.3128508, 0.3146136, 1, 0, 0, 1, 1,
1.622118, -1.997721, 3.151799, 1, 0, 0, 1, 1,
1.644434, -1.254695, 1.564296, 1, 0, 0, 1, 1,
1.663815, 0.464697, 2.404556, 0, 0, 0, 1, 1,
1.663921, 1.703581, -1.400315, 0, 0, 0, 1, 1,
1.669547, -0.4936301, 2.323928, 0, 0, 0, 1, 1,
1.68196, -0.6312754, 1.095312, 0, 0, 0, 1, 1,
1.684519, -0.3062833, 0.8287548, 0, 0, 0, 1, 1,
1.712921, 1.89568, 1.586141, 0, 0, 0, 1, 1,
1.73356, 0.2351274, 1.430434, 0, 0, 0, 1, 1,
1.740156, 1.648941, 1.266377, 1, 1, 1, 1, 1,
1.778706, 0.1420682, 2.060481, 1, 1, 1, 1, 1,
1.89863, -2.075419, 2.593973, 1, 1, 1, 1, 1,
1.906385, 0.963948, 0.5081279, 1, 1, 1, 1, 1,
1.919174, 0.5453629, 3.15692, 1, 1, 1, 1, 1,
1.924894, -0.4776979, 2.306147, 1, 1, 1, 1, 1,
1.927243, 2.595263, 1.435932, 1, 1, 1, 1, 1,
1.94002, 1.285622, 1.609024, 1, 1, 1, 1, 1,
1.941227, 1.451684, -0.8627522, 1, 1, 1, 1, 1,
1.979618, -0.8763594, 1.117821, 1, 1, 1, 1, 1,
1.983543, -0.5305251, 3.830465, 1, 1, 1, 1, 1,
2.010079, 0.6478732, -0.7351897, 1, 1, 1, 1, 1,
2.018846, -0.3340548, 0.7959347, 1, 1, 1, 1, 1,
2.043181, 0.183768, 1.713305, 1, 1, 1, 1, 1,
2.047025, 0.2977274, 1.764548, 1, 1, 1, 1, 1,
2.066468, -0.8279366, 0.4768754, 0, 0, 1, 1, 1,
2.103893, -0.244682, 0.6289843, 1, 0, 0, 1, 1,
2.145597, -1.179727, 1.343608, 1, 0, 0, 1, 1,
2.17341, 0.2749033, 1.148589, 1, 0, 0, 1, 1,
2.248537, 0.918242, -0.1776129, 1, 0, 0, 1, 1,
2.322328, -0.5432935, 2.254113, 1, 0, 0, 1, 1,
2.325288, -0.2341096, 2.493406, 0, 0, 0, 1, 1,
2.355775, -1.083958, -0.2252984, 0, 0, 0, 1, 1,
2.38894, -0.6514333, 3.206692, 0, 0, 0, 1, 1,
2.542561, -0.5064628, 2.120943, 0, 0, 0, 1, 1,
2.574305, -0.02914543, 1.811406, 0, 0, 0, 1, 1,
2.599646, -1.374857, 2.469515, 0, 0, 0, 1, 1,
2.639317, -2.21428, 1.665964, 0, 0, 0, 1, 1,
2.661651, 0.463309, 0.3349875, 1, 1, 1, 1, 1,
2.698707, 0.07828197, 1.832801, 1, 1, 1, 1, 1,
2.742356, 0.3128375, 1.771092, 1, 1, 1, 1, 1,
2.754514, -0.528037, 0.9360987, 1, 1, 1, 1, 1,
2.8248, -0.9945518, 0.2245049, 1, 1, 1, 1, 1,
2.873662, 1.079814, 1.862439, 1, 1, 1, 1, 1,
2.918779, -2.157528, 1.226256, 1, 1, 1, 1, 1
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
var radius = 9.76776;
var distance = 34.30884;
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
mvMatrix.translate( -0.02507401, -0.1571453, 0.1860104 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.30884);
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
