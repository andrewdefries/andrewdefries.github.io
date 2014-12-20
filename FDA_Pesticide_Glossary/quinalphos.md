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
-3.532759, 1.464479, -0.4374563, 1, 0, 0, 1,
-3.041604, 1.680841, 1.61841, 1, 0.007843138, 0, 1,
-2.744118, -0.3896731, -2.401268, 1, 0.01176471, 0, 1,
-2.726865, -0.533308, -0.7017714, 1, 0.01960784, 0, 1,
-2.582802, -1.056476, -1.173972, 1, 0.02352941, 0, 1,
-2.458402, 0.2116655, -0.1782234, 1, 0.03137255, 0, 1,
-2.390817, -0.3523939, -1.792729, 1, 0.03529412, 0, 1,
-2.26475, 1.020366, 0.2709291, 1, 0.04313726, 0, 1,
-2.264731, 1.391659, -0.910475, 1, 0.04705882, 0, 1,
-2.230428, 0.04384879, -1.197867, 1, 0.05490196, 0, 1,
-2.145673, -1.790713, -2.037399, 1, 0.05882353, 0, 1,
-2.12316, -0.08203082, -2.428235, 1, 0.06666667, 0, 1,
-2.10137, -1.005373, -1.871199, 1, 0.07058824, 0, 1,
-2.051769, -0.1202517, -2.248574, 1, 0.07843138, 0, 1,
-1.995827, -0.2579978, -0.8389552, 1, 0.08235294, 0, 1,
-1.983696, 1.020188, -2.232827, 1, 0.09019608, 0, 1,
-1.982413, -0.3217518, -2.278479, 1, 0.09411765, 0, 1,
-1.973499, -0.9795723, -2.197374, 1, 0.1019608, 0, 1,
-1.931249, 2.275936, -0.8232407, 1, 0.1098039, 0, 1,
-1.909321, 0.3090917, -1.855534, 1, 0.1137255, 0, 1,
-1.887973, 0.7574978, -2.128733, 1, 0.1215686, 0, 1,
-1.867337, -1.266479, -1.897297, 1, 0.1254902, 0, 1,
-1.861571, -0.4814022, -2.587017, 1, 0.1333333, 0, 1,
-1.851206, -0.1579947, -1.706443, 1, 0.1372549, 0, 1,
-1.849028, 0.215102, -1.79527, 1, 0.145098, 0, 1,
-1.836324, -1.10026, -3.461686, 1, 0.1490196, 0, 1,
-1.810538, 0.4067264, -0.8259593, 1, 0.1568628, 0, 1,
-1.803845, -0.9888661, -1.881949, 1, 0.1607843, 0, 1,
-1.779151, -2.416621, -2.044141, 1, 0.1686275, 0, 1,
-1.771222, -0.1941078, -2.655258, 1, 0.172549, 0, 1,
-1.769266, -0.8557585, -3.037546, 1, 0.1803922, 0, 1,
-1.759084, 1.116339, -1.836821, 1, 0.1843137, 0, 1,
-1.728668, 0.4702235, -0.9978977, 1, 0.1921569, 0, 1,
-1.719429, -0.5771277, -1.555582, 1, 0.1960784, 0, 1,
-1.7126, -0.5708316, -1.720414, 1, 0.2039216, 0, 1,
-1.711351, 1.611723, -0.5822967, 1, 0.2117647, 0, 1,
-1.656987, -0.813945, -1.153721, 1, 0.2156863, 0, 1,
-1.649472, -0.8065419, -1.634498, 1, 0.2235294, 0, 1,
-1.631084, -2.131409, -2.051936, 1, 0.227451, 0, 1,
-1.614675, 0.3170646, -2.119772, 1, 0.2352941, 0, 1,
-1.600653, -0.1471169, -1.570842, 1, 0.2392157, 0, 1,
-1.599489, -0.2452762, -2.799512, 1, 0.2470588, 0, 1,
-1.593578, -0.559259, -1.948904, 1, 0.2509804, 0, 1,
-1.583744, 0.1580585, -0.4850466, 1, 0.2588235, 0, 1,
-1.582997, -1.037755, -1.351878, 1, 0.2627451, 0, 1,
-1.56737, -0.8390636, -2.762065, 1, 0.2705882, 0, 1,
-1.558535, -1.809407, -3.094487, 1, 0.2745098, 0, 1,
-1.545771, -0.3666633, 0.1533302, 1, 0.282353, 0, 1,
-1.545086, 0.2050514, -0.3166012, 1, 0.2862745, 0, 1,
-1.534317, -0.4310146, -2.394427, 1, 0.2941177, 0, 1,
-1.530714, 0.6409152, -1.684572, 1, 0.3019608, 0, 1,
-1.525711, 0.3307061, -1.492141, 1, 0.3058824, 0, 1,
-1.522672, 1.296198, 0.340245, 1, 0.3137255, 0, 1,
-1.522159, -0.028154, -1.29809, 1, 0.3176471, 0, 1,
-1.503005, 0.8088784, -1.133138, 1, 0.3254902, 0, 1,
-1.498819, -1.373233, -2.943603, 1, 0.3294118, 0, 1,
-1.497284, 1.014359, -1.120446, 1, 0.3372549, 0, 1,
-1.497021, 0.9215783, 0.9288006, 1, 0.3411765, 0, 1,
-1.471099, 0.4160847, -1.180768, 1, 0.3490196, 0, 1,
-1.469329, 1.059685, -0.7243619, 1, 0.3529412, 0, 1,
-1.462147, -0.2069006, -1.6729, 1, 0.3607843, 0, 1,
-1.451155, 0.7045617, -1.753742, 1, 0.3647059, 0, 1,
-1.433319, -2.543169, -2.795967, 1, 0.372549, 0, 1,
-1.433133, 0.01490036, -0.2666816, 1, 0.3764706, 0, 1,
-1.430128, 0.1882974, -2.258189, 1, 0.3843137, 0, 1,
-1.413778, 0.3092272, -0.6553534, 1, 0.3882353, 0, 1,
-1.409143, -1.358401, -2.48912, 1, 0.3960784, 0, 1,
-1.402591, -0.5024003, -3.808923, 1, 0.4039216, 0, 1,
-1.39713, 0.7199807, -0.2660959, 1, 0.4078431, 0, 1,
-1.391852, 2.524943, -1.287185, 1, 0.4156863, 0, 1,
-1.387532, 0.6707171, -3.489712, 1, 0.4196078, 0, 1,
-1.382127, -0.2456145, -3.039295, 1, 0.427451, 0, 1,
-1.381212, 1.394499, 0.7438167, 1, 0.4313726, 0, 1,
-1.377371, 0.1912927, -2.245987, 1, 0.4392157, 0, 1,
-1.377156, -1.257233, -1.027132, 1, 0.4431373, 0, 1,
-1.375899, -1.272825, -2.127121, 1, 0.4509804, 0, 1,
-1.372975, -0.01292822, -1.053347, 1, 0.454902, 0, 1,
-1.370088, 0.1798153, -1.795948, 1, 0.4627451, 0, 1,
-1.350892, 0.4820106, -0.2226062, 1, 0.4666667, 0, 1,
-1.34806, -1.815957, -2.986863, 1, 0.4745098, 0, 1,
-1.347779, 2.447262, -1.480622, 1, 0.4784314, 0, 1,
-1.344812, -1.206535, -2.371989, 1, 0.4862745, 0, 1,
-1.340583, -1.369343, -2.768133, 1, 0.4901961, 0, 1,
-1.331094, 0.843012, -1.321871, 1, 0.4980392, 0, 1,
-1.323416, 1.207988, -1.43575, 1, 0.5058824, 0, 1,
-1.318762, -1.079652, -1.697054, 1, 0.509804, 0, 1,
-1.313561, -0.4393697, -1.586385, 1, 0.5176471, 0, 1,
-1.305139, -1.404163, -1.802048, 1, 0.5215687, 0, 1,
-1.299819, 0.7473794, -1.823071, 1, 0.5294118, 0, 1,
-1.299124, 1.136386, -0.9242065, 1, 0.5333334, 0, 1,
-1.296543, 0.6826108, 0.0724219, 1, 0.5411765, 0, 1,
-1.292833, -1.228195, -4.171147, 1, 0.5450981, 0, 1,
-1.292457, -2.703352, -3.777041, 1, 0.5529412, 0, 1,
-1.288556, -1.00046, -3.371105, 1, 0.5568628, 0, 1,
-1.257145, 0.2627719, -2.289926, 1, 0.5647059, 0, 1,
-1.247167, 1.402991, -1.292303, 1, 0.5686275, 0, 1,
-1.24604, -1.942852, -2.277554, 1, 0.5764706, 0, 1,
-1.242345, -1.148876, -2.67425, 1, 0.5803922, 0, 1,
-1.239548, 0.2516508, -0.146873, 1, 0.5882353, 0, 1,
-1.232792, -0.07227891, -2.314734, 1, 0.5921569, 0, 1,
-1.222196, -3.042806, -3.303014, 1, 0.6, 0, 1,
-1.211238, 0.7929005, 0.3051948, 1, 0.6078432, 0, 1,
-1.210722, 0.06529243, -1.544714, 1, 0.6117647, 0, 1,
-1.210043, -0.1577766, -0.7878593, 1, 0.6196079, 0, 1,
-1.20373, 0.1478809, -0.9449988, 1, 0.6235294, 0, 1,
-1.20328, -0.3825197, -3.049408, 1, 0.6313726, 0, 1,
-1.202646, -0.8733926, -3.030513, 1, 0.6352941, 0, 1,
-1.186625, -0.6893613, -4.561422, 1, 0.6431373, 0, 1,
-1.183638, -1.608303, -2.019188, 1, 0.6470588, 0, 1,
-1.17723, -0.6280242, -2.310397, 1, 0.654902, 0, 1,
-1.177112, 0.8024906, -1.963965, 1, 0.6588235, 0, 1,
-1.170025, 0.5170446, 0.2414007, 1, 0.6666667, 0, 1,
-1.158232, 1.79991, -1.173133, 1, 0.6705883, 0, 1,
-1.155135, -0.3275453, -0.7591706, 1, 0.6784314, 0, 1,
-1.154806, 0.8807064, -1.558057, 1, 0.682353, 0, 1,
-1.150526, 0.3447234, -0.1987474, 1, 0.6901961, 0, 1,
-1.149833, 2.010182, -1.578528, 1, 0.6941177, 0, 1,
-1.148914, -0.2554159, -1.708707, 1, 0.7019608, 0, 1,
-1.144077, -0.3161516, -3.403014, 1, 0.7098039, 0, 1,
-1.139696, -1.291651, -3.212184, 1, 0.7137255, 0, 1,
-1.130333, -1.408942, -3.656734, 1, 0.7215686, 0, 1,
-1.125736, 1.731327, -1.162398, 1, 0.7254902, 0, 1,
-1.122686, 1.590952, 0.9847923, 1, 0.7333333, 0, 1,
-1.119131, 0.583071, -2.27966, 1, 0.7372549, 0, 1,
-1.115945, -1.003893, -3.084389, 1, 0.7450981, 0, 1,
-1.112517, 0.1934737, -2.652234, 1, 0.7490196, 0, 1,
-1.111357, 0.8721579, -1.4517, 1, 0.7568628, 0, 1,
-1.110097, 0.5647123, -0.483243, 1, 0.7607843, 0, 1,
-1.098347, 0.5513353, -0.243546, 1, 0.7686275, 0, 1,
-1.095883, 1.865737, -0.6991979, 1, 0.772549, 0, 1,
-1.088602, 0.5307839, -1.734188, 1, 0.7803922, 0, 1,
-1.082986, 0.4514638, -1.608746, 1, 0.7843137, 0, 1,
-1.077491, -1.067716, -0.500907, 1, 0.7921569, 0, 1,
-1.071836, -0.2960989, 1.057958, 1, 0.7960784, 0, 1,
-1.068984, -0.8323929, -0.7247832, 1, 0.8039216, 0, 1,
-1.066479, -1.915901, -1.766636, 1, 0.8117647, 0, 1,
-1.064226, -0.6078029, -2.406582, 1, 0.8156863, 0, 1,
-1.063866, -0.4261104, -3.285593, 1, 0.8235294, 0, 1,
-1.05965, 1.200879, 0.6072549, 1, 0.827451, 0, 1,
-1.051698, 1.610748, -1.679608, 1, 0.8352941, 0, 1,
-1.050082, -1.967994, -1.16813, 1, 0.8392157, 0, 1,
-1.048416, 0.3336505, -3.381222, 1, 0.8470588, 0, 1,
-1.046958, 1.017848, 0.2330146, 1, 0.8509804, 0, 1,
-1.04613, -1.156432, -2.170869, 1, 0.8588235, 0, 1,
-1.041663, 1.014265, -0.3536424, 1, 0.8627451, 0, 1,
-1.031675, 1.48841, 0.6075282, 1, 0.8705882, 0, 1,
-1.029898, 1.3198, 0.6874456, 1, 0.8745098, 0, 1,
-1.021239, -0.04625755, -0.8985407, 1, 0.8823529, 0, 1,
-1.02012, 0.8720276, -0.05741724, 1, 0.8862745, 0, 1,
-1.017149, -0.9188946, -2.079006, 1, 0.8941177, 0, 1,
-1.015276, -0.1630898, -2.174714, 1, 0.8980392, 0, 1,
-1.015162, -1.64929, -1.986695, 1, 0.9058824, 0, 1,
-1.013511, 1.168946, -1.653953, 1, 0.9137255, 0, 1,
-1.011319, -1.506641, -2.388997, 1, 0.9176471, 0, 1,
-1.010296, 0.2329359, 0.5159485, 1, 0.9254902, 0, 1,
-1.010296, -1.572147, -2.059633, 1, 0.9294118, 0, 1,
-1.009502, 0.9276367, -1.557108, 1, 0.9372549, 0, 1,
-1.000827, -0.2999774, -2.569632, 1, 0.9411765, 0, 1,
-0.9989846, -0.4323649, -3.300506, 1, 0.9490196, 0, 1,
-0.9986247, 0.6712243, -0.4679437, 1, 0.9529412, 0, 1,
-0.9950073, -0.6546916, -2.894241, 1, 0.9607843, 0, 1,
-0.9808731, -1.509454, -1.385201, 1, 0.9647059, 0, 1,
-0.9790008, -0.1628126, -1.144138, 1, 0.972549, 0, 1,
-0.9725092, 1.238497, -0.0005594782, 1, 0.9764706, 0, 1,
-0.9646224, -0.3981432, -3.347912, 1, 0.9843137, 0, 1,
-0.962371, 0.6917143, -3.16401, 1, 0.9882353, 0, 1,
-0.9569083, 1.088318, -2.34499, 1, 0.9960784, 0, 1,
-0.9496947, -0.9953337, -2.581444, 0.9960784, 1, 0, 1,
-0.9462502, 0.8514333, -1.884907, 0.9921569, 1, 0, 1,
-0.9314951, 1.226677, -0.8669755, 0.9843137, 1, 0, 1,
-0.9278808, -0.3203846, -2.012063, 0.9803922, 1, 0, 1,
-0.9237415, -0.4235006, -3.08451, 0.972549, 1, 0, 1,
-0.9196086, -1.92869, -2.038749, 0.9686275, 1, 0, 1,
-0.9191283, 1.38434, -0.03279309, 0.9607843, 1, 0, 1,
-0.9179363, -0.3200252, -2.670838, 0.9568627, 1, 0, 1,
-0.9086691, 0.5184088, -1.546299, 0.9490196, 1, 0, 1,
-0.9039731, 0.3880362, 0.5983512, 0.945098, 1, 0, 1,
-0.9027506, 0.9879889, 1.214779, 0.9372549, 1, 0, 1,
-0.9027272, 0.5827699, -1.55047, 0.9333333, 1, 0, 1,
-0.8983252, 0.5042778, 0.412248, 0.9254902, 1, 0, 1,
-0.8951198, 1.765339, 1.131309, 0.9215686, 1, 0, 1,
-0.8937869, -0.9423602, -2.639053, 0.9137255, 1, 0, 1,
-0.8928499, 1.071612, -0.1767626, 0.9098039, 1, 0, 1,
-0.8912573, 0.2702249, -0.8241244, 0.9019608, 1, 0, 1,
-0.8896492, 0.5576842, 0.4988817, 0.8941177, 1, 0, 1,
-0.8801801, 0.567304, -0.3120158, 0.8901961, 1, 0, 1,
-0.8735207, -0.6339501, -2.195351, 0.8823529, 1, 0, 1,
-0.8733098, 0.4175225, -0.2306941, 0.8784314, 1, 0, 1,
-0.8673538, 0.03703488, -2.876714, 0.8705882, 1, 0, 1,
-0.866598, -0.8103012, -2.522378, 0.8666667, 1, 0, 1,
-0.8612696, -2.216139, -2.033574, 0.8588235, 1, 0, 1,
-0.8611355, -2.002461, -2.789137, 0.854902, 1, 0, 1,
-0.8593352, -1.501571, -2.270298, 0.8470588, 1, 0, 1,
-0.8568071, 0.1803272, -1.669223, 0.8431373, 1, 0, 1,
-0.8502874, -1.392813, -2.940147, 0.8352941, 1, 0, 1,
-0.8499672, -0.05963178, -1.829618, 0.8313726, 1, 0, 1,
-0.8498875, -1.683236, -3.71143, 0.8235294, 1, 0, 1,
-0.8491486, 0.3075091, -1.544008, 0.8196079, 1, 0, 1,
-0.8485203, -1.038354, -2.16593, 0.8117647, 1, 0, 1,
-0.8454991, -1.603207, -2.725599, 0.8078431, 1, 0, 1,
-0.8452938, -1.505597, -2.577123, 0.8, 1, 0, 1,
-0.8452054, 1.044647, -2.387069, 0.7921569, 1, 0, 1,
-0.844904, -0.09686375, -0.8918963, 0.7882353, 1, 0, 1,
-0.8438177, -0.6232697, -0.5834967, 0.7803922, 1, 0, 1,
-0.8411816, -0.08860167, -1.944622, 0.7764706, 1, 0, 1,
-0.8400649, 1.463961, -2.076667, 0.7686275, 1, 0, 1,
-0.8396015, 1.003626, -0.5057731, 0.7647059, 1, 0, 1,
-0.8354201, -0.1244748, -1.869129, 0.7568628, 1, 0, 1,
-0.8338448, -0.5119247, -3.40148, 0.7529412, 1, 0, 1,
-0.832605, 0.1023983, -2.161033, 0.7450981, 1, 0, 1,
-0.8307953, -0.6662492, -1.38571, 0.7411765, 1, 0, 1,
-0.825801, 1.117167, 1.11659, 0.7333333, 1, 0, 1,
-0.8241007, -0.194623, -2.420317, 0.7294118, 1, 0, 1,
-0.8198361, -1.464452, -3.842543, 0.7215686, 1, 0, 1,
-0.8194739, -0.1457999, -0.6893716, 0.7176471, 1, 0, 1,
-0.8174232, -0.2620934, -3.430037, 0.7098039, 1, 0, 1,
-0.8136573, -0.9468182, -3.024489, 0.7058824, 1, 0, 1,
-0.8086397, -0.8626949, -0.5014495, 0.6980392, 1, 0, 1,
-0.8076416, 1.713578, -1.894493, 0.6901961, 1, 0, 1,
-0.79682, -1.021325, -2.353308, 0.6862745, 1, 0, 1,
-0.7854842, 0.09527354, -0.103192, 0.6784314, 1, 0, 1,
-0.7842647, -1.064967, -4.367509, 0.6745098, 1, 0, 1,
-0.7813835, -0.3676312, -1.668066, 0.6666667, 1, 0, 1,
-0.779689, -0.2524949, -0.8992692, 0.6627451, 1, 0, 1,
-0.7795556, -1.651754, -4.1667, 0.654902, 1, 0, 1,
-0.7777808, -0.6207942, -2.340943, 0.6509804, 1, 0, 1,
-0.7745748, -0.2204876, -1.808196, 0.6431373, 1, 0, 1,
-0.7725429, 0.4317394, -0.8225788, 0.6392157, 1, 0, 1,
-0.770764, 0.7315389, -0.4026169, 0.6313726, 1, 0, 1,
-0.7687007, 0.1546395, -1.629858, 0.627451, 1, 0, 1,
-0.7681692, -0.2513375, -0.7977317, 0.6196079, 1, 0, 1,
-0.768037, 0.5482205, -0.5821469, 0.6156863, 1, 0, 1,
-0.7661974, 0.4386915, -1.26418, 0.6078432, 1, 0, 1,
-0.7656353, 0.5041327, -1.798633, 0.6039216, 1, 0, 1,
-0.7628968, -0.8442758, -1.77911, 0.5960785, 1, 0, 1,
-0.7563488, 0.1957557, -1.400149, 0.5882353, 1, 0, 1,
-0.7560971, -0.2446389, -2.549161, 0.5843138, 1, 0, 1,
-0.750097, -0.3046746, -1.09388, 0.5764706, 1, 0, 1,
-0.7443008, 0.3894684, -0.3850169, 0.572549, 1, 0, 1,
-0.7422436, 0.881836, -0.3214335, 0.5647059, 1, 0, 1,
-0.7409997, -1.012028, -3.569222, 0.5607843, 1, 0, 1,
-0.7381049, -0.1277664, -1.497842, 0.5529412, 1, 0, 1,
-0.7353235, -0.9699589, -2.334337, 0.5490196, 1, 0, 1,
-0.7302101, 2.319282, 0.6020909, 0.5411765, 1, 0, 1,
-0.7288586, -0.1863117, -2.981356, 0.5372549, 1, 0, 1,
-0.7224811, -0.1493211, -3.61065, 0.5294118, 1, 0, 1,
-0.7219388, -0.2021549, -2.653203, 0.5254902, 1, 0, 1,
-0.717277, 0.1855921, -0.8769878, 0.5176471, 1, 0, 1,
-0.7136976, 0.7559201, -0.7867992, 0.5137255, 1, 0, 1,
-0.7131502, -0.2844008, -2.350298, 0.5058824, 1, 0, 1,
-0.7114215, 0.1953651, -2.323592, 0.5019608, 1, 0, 1,
-0.7089439, -1.892925, -1.674012, 0.4941176, 1, 0, 1,
-0.708637, -2.082823, -2.343942, 0.4862745, 1, 0, 1,
-0.6934798, 0.5552984, -2.516493, 0.4823529, 1, 0, 1,
-0.6845729, -0.1914616, 0.530349, 0.4745098, 1, 0, 1,
-0.6791452, 0.5374095, -0.585281, 0.4705882, 1, 0, 1,
-0.6768047, 0.08973324, -0.3982675, 0.4627451, 1, 0, 1,
-0.6721026, -0.08338276, -1.425461, 0.4588235, 1, 0, 1,
-0.6680762, 0.6403399, 0.07085838, 0.4509804, 1, 0, 1,
-0.6670995, 0.4432898, 0.5917556, 0.4470588, 1, 0, 1,
-0.6666353, 0.3799908, -1.235787, 0.4392157, 1, 0, 1,
-0.6651746, 0.4099894, -0.7414827, 0.4352941, 1, 0, 1,
-0.6644444, 0.6447858, -0.2738284, 0.427451, 1, 0, 1,
-0.6624886, 2.274334, -2.030079, 0.4235294, 1, 0, 1,
-0.6611901, -0.03222404, 1.142911, 0.4156863, 1, 0, 1,
-0.659912, 0.3350016, -0.1494811, 0.4117647, 1, 0, 1,
-0.655735, 1.545893, 0.03647019, 0.4039216, 1, 0, 1,
-0.6549457, 0.1083734, -1.36108, 0.3960784, 1, 0, 1,
-0.6522264, 0.4737462, -0.6641593, 0.3921569, 1, 0, 1,
-0.6514509, 0.1622561, -1.762527, 0.3843137, 1, 0, 1,
-0.650034, 0.8731558, -0.9517177, 0.3803922, 1, 0, 1,
-0.648788, 0.7376219, 0.3792484, 0.372549, 1, 0, 1,
-0.6472415, -1.453456, -2.722384, 0.3686275, 1, 0, 1,
-0.6468104, -0.4738381, -0.5728086, 0.3607843, 1, 0, 1,
-0.6261364, -0.189332, -1.17625, 0.3568628, 1, 0, 1,
-0.6242264, -0.08291992, -0.3672063, 0.3490196, 1, 0, 1,
-0.6239498, -0.954438, -3.335651, 0.345098, 1, 0, 1,
-0.6214538, 0.1821366, -1.131652, 0.3372549, 1, 0, 1,
-0.6203594, 0.8629827, -0.1480841, 0.3333333, 1, 0, 1,
-0.616689, 1.077005, -0.5412068, 0.3254902, 1, 0, 1,
-0.6131738, -0.2039527, -2.670449, 0.3215686, 1, 0, 1,
-0.6105289, 0.4983402, -1.065947, 0.3137255, 1, 0, 1,
-0.6097431, -0.5931478, -2.245365, 0.3098039, 1, 0, 1,
-0.6093821, 0.678056, -1.987761, 0.3019608, 1, 0, 1,
-0.6009367, -0.3842345, -1.666701, 0.2941177, 1, 0, 1,
-0.5974572, -0.1825032, -1.392004, 0.2901961, 1, 0, 1,
-0.5942719, -1.321212, -2.114487, 0.282353, 1, 0, 1,
-0.587333, 0.05685248, -2.223297, 0.2784314, 1, 0, 1,
-0.5855151, 0.6496112, -1.758232, 0.2705882, 1, 0, 1,
-0.5830503, 0.2602838, 1.574342, 0.2666667, 1, 0, 1,
-0.58216, 0.02701523, -3.243197, 0.2588235, 1, 0, 1,
-0.581392, 0.6372598, -1.794424, 0.254902, 1, 0, 1,
-0.5771728, 0.2003923, -2.577607, 0.2470588, 1, 0, 1,
-0.5771613, -0.898707, -2.236951, 0.2431373, 1, 0, 1,
-0.5767918, -0.01112648, -1.746042, 0.2352941, 1, 0, 1,
-0.5743165, -1.986357, -2.058756, 0.2313726, 1, 0, 1,
-0.5737184, 0.4905604, -0.8624778, 0.2235294, 1, 0, 1,
-0.564562, -1.397304, -1.780918, 0.2196078, 1, 0, 1,
-0.5569264, 0.5466366, -1.960675, 0.2117647, 1, 0, 1,
-0.5546508, -0.266984, -2.474191, 0.2078431, 1, 0, 1,
-0.5546352, 1.461041, 1.631973, 0.2, 1, 0, 1,
-0.5530849, 0.2724437, -1.122451, 0.1921569, 1, 0, 1,
-0.5515953, -1.025653, -3.297594, 0.1882353, 1, 0, 1,
-0.5500172, 0.001130237, -1.010553, 0.1803922, 1, 0, 1,
-0.5476524, 0.8409608, 0.2051413, 0.1764706, 1, 0, 1,
-0.5408618, -0.964702, -2.405189, 0.1686275, 1, 0, 1,
-0.5393249, 2.068425, -1.129662, 0.1647059, 1, 0, 1,
-0.5383908, 0.6711355, -0.1477156, 0.1568628, 1, 0, 1,
-0.5355922, -1.667445, -2.807441, 0.1529412, 1, 0, 1,
-0.5288167, -0.4741775, -1.260192, 0.145098, 1, 0, 1,
-0.5259625, 2.185361, 2.549856, 0.1411765, 1, 0, 1,
-0.5224268, -1.609578, -1.429039, 0.1333333, 1, 0, 1,
-0.5204448, 0.3142417, -1.378078, 0.1294118, 1, 0, 1,
-0.5179311, -0.6845453, -2.084726, 0.1215686, 1, 0, 1,
-0.5173199, -0.1723706, -1.631167, 0.1176471, 1, 0, 1,
-0.5169923, 0.3374559, -1.065815, 0.1098039, 1, 0, 1,
-0.5102338, 0.5648654, -1.572378, 0.1058824, 1, 0, 1,
-0.5027949, 1.207074, 0.5449055, 0.09803922, 1, 0, 1,
-0.4973098, 1.163709, -1.901163, 0.09019608, 1, 0, 1,
-0.4960122, -0.6974356, -4.004915, 0.08627451, 1, 0, 1,
-0.4947413, 0.01161185, -1.405893, 0.07843138, 1, 0, 1,
-0.4944588, 0.9684326, -1.013762, 0.07450981, 1, 0, 1,
-0.4912944, -0.647716, -3.615366, 0.06666667, 1, 0, 1,
-0.4847519, -1.139856, -3.017687, 0.0627451, 1, 0, 1,
-0.481741, 0.02614984, -3.290065, 0.05490196, 1, 0, 1,
-0.4804556, -0.9391983, -3.30553, 0.05098039, 1, 0, 1,
-0.4787267, 1.525727, -2.209576, 0.04313726, 1, 0, 1,
-0.4715366, -0.0258962, -1.829179, 0.03921569, 1, 0, 1,
-0.4714453, 0.5515122, -1.561462, 0.03137255, 1, 0, 1,
-0.4690515, 0.07659334, -0.6010676, 0.02745098, 1, 0, 1,
-0.4659901, -1.080897, -1.342177, 0.01960784, 1, 0, 1,
-0.4657656, 0.3838399, -2.218472, 0.01568628, 1, 0, 1,
-0.4624667, -0.2022163, -1.948607, 0.007843138, 1, 0, 1,
-0.4596899, 0.6166107, 0.8349739, 0.003921569, 1, 0, 1,
-0.4536191, 0.2094713, -0.3688791, 0, 1, 0.003921569, 1,
-0.4525248, -0.7018532, -2.202205, 0, 1, 0.01176471, 1,
-0.4522727, 0.3498253, -0.3226979, 0, 1, 0.01568628, 1,
-0.4520814, 0.9780508, 0.0308607, 0, 1, 0.02352941, 1,
-0.4498328, -0.0846414, -1.365972, 0, 1, 0.02745098, 1,
-0.448113, 1.235436, -0.9019726, 0, 1, 0.03529412, 1,
-0.4446063, 1.510086, 0.4171528, 0, 1, 0.03921569, 1,
-0.4432217, 0.668596, 0.6397102, 0, 1, 0.04705882, 1,
-0.4423878, 0.7941252, 0.8575774, 0, 1, 0.05098039, 1,
-0.4417669, 1.005297, -1.857373, 0, 1, 0.05882353, 1,
-0.4326729, -0.9458166, -0.9620267, 0, 1, 0.0627451, 1,
-0.4323854, 0.03742145, -0.7989035, 0, 1, 0.07058824, 1,
-0.4312079, -0.4859515, -1.889634, 0, 1, 0.07450981, 1,
-0.4308364, 0.6881336, -0.3525346, 0, 1, 0.08235294, 1,
-0.4307331, 1.792723, -3.199991, 0, 1, 0.08627451, 1,
-0.4254749, -0.898912, -2.528978, 0, 1, 0.09411765, 1,
-0.4220092, -0.05993823, -0.5672711, 0, 1, 0.1019608, 1,
-0.4162225, 1.047619, 0.9889238, 0, 1, 0.1058824, 1,
-0.4156041, -0.003476621, -2.248689, 0, 1, 0.1137255, 1,
-0.4097131, 0.155019, -0.478424, 0, 1, 0.1176471, 1,
-0.4090433, -0.9318495, -3.427643, 0, 1, 0.1254902, 1,
-0.4067801, -0.3263834, -1.207683, 0, 1, 0.1294118, 1,
-0.3987335, 1.256658, -0.5664089, 0, 1, 0.1372549, 1,
-0.3969269, 0.9752089, -1.298685, 0, 1, 0.1411765, 1,
-0.3959589, 0.2675588, 1.450629, 0, 1, 0.1490196, 1,
-0.3914007, -1.637851, -3.180095, 0, 1, 0.1529412, 1,
-0.3886237, 0.2880924, -0.8405172, 0, 1, 0.1607843, 1,
-0.3885284, 0.6696787, -0.5033724, 0, 1, 0.1647059, 1,
-0.3879392, 0.8954191, -0.80433, 0, 1, 0.172549, 1,
-0.3870763, -0.1020247, -2.322996, 0, 1, 0.1764706, 1,
-0.3864946, -1.530873, -2.193632, 0, 1, 0.1843137, 1,
-0.3829106, -0.7168303, -3.984425, 0, 1, 0.1882353, 1,
-0.3820258, -0.9898568, -1.068351, 0, 1, 0.1960784, 1,
-0.380503, 0.009521671, -1.482563, 0, 1, 0.2039216, 1,
-0.3802531, 0.05946663, -2.198722, 0, 1, 0.2078431, 1,
-0.3771093, -0.4419677, -2.447804, 0, 1, 0.2156863, 1,
-0.3757305, -0.2643143, -2.721732, 0, 1, 0.2196078, 1,
-0.3741479, -0.9683492, -0.7434035, 0, 1, 0.227451, 1,
-0.3722323, 0.2102062, -1.58598, 0, 1, 0.2313726, 1,
-0.3720991, -0.5659807, -3.814765, 0, 1, 0.2392157, 1,
-0.3648621, 0.7260696, 0.2379752, 0, 1, 0.2431373, 1,
-0.3614242, -0.3110427, -2.442036, 0, 1, 0.2509804, 1,
-0.360443, 0.9310869, -0.3342186, 0, 1, 0.254902, 1,
-0.3574816, -1.022603, -2.887306, 0, 1, 0.2627451, 1,
-0.3530895, 0.07203746, -1.70851, 0, 1, 0.2666667, 1,
-0.3530849, -0.215413, -1.368824, 0, 1, 0.2745098, 1,
-0.3530111, 0.5961189, -1.014421, 0, 1, 0.2784314, 1,
-0.3486001, -1.137795, -2.636278, 0, 1, 0.2862745, 1,
-0.3481326, 1.335571, 0.2656744, 0, 1, 0.2901961, 1,
-0.3470318, 0.5972951, 1.139334, 0, 1, 0.2980392, 1,
-0.3462936, 1.029935, -0.06381267, 0, 1, 0.3058824, 1,
-0.3418207, 0.3114868, -2.24699, 0, 1, 0.3098039, 1,
-0.3396733, 0.9746999, -1.072325, 0, 1, 0.3176471, 1,
-0.3263294, -0.152981, -1.012703, 0, 1, 0.3215686, 1,
-0.3194157, 0.4267572, -1.369507, 0, 1, 0.3294118, 1,
-0.3171245, -1.541223, -3.440895, 0, 1, 0.3333333, 1,
-0.3150239, 0.1516687, -2.39917, 0, 1, 0.3411765, 1,
-0.312194, 0.7645764, -0.1101334, 0, 1, 0.345098, 1,
-0.3067516, 1.258925, 0.07396265, 0, 1, 0.3529412, 1,
-0.3066492, 0.6315776, -0.7639483, 0, 1, 0.3568628, 1,
-0.2972476, -0.7527517, -1.78732, 0, 1, 0.3647059, 1,
-0.2948852, -0.415844, -1.829461, 0, 1, 0.3686275, 1,
-0.2947682, -0.614621, -2.783581, 0, 1, 0.3764706, 1,
-0.2940311, 0.7211844, -0.9652308, 0, 1, 0.3803922, 1,
-0.2872285, 0.3548393, -0.9820328, 0, 1, 0.3882353, 1,
-0.2848368, -0.8811134, -2.112853, 0, 1, 0.3921569, 1,
-0.2809145, -0.8891671, -3.546915, 0, 1, 0.4, 1,
-0.2756593, 1.003744, -0.3207239, 0, 1, 0.4078431, 1,
-0.2754575, -0.1862833, -2.282759, 0, 1, 0.4117647, 1,
-0.2707058, 1.184127, -0.1465551, 0, 1, 0.4196078, 1,
-0.2702117, -0.3327148, -1.93269, 0, 1, 0.4235294, 1,
-0.2666848, 0.1061216, -2.797975, 0, 1, 0.4313726, 1,
-0.2633993, -1.107483, -2.28296, 0, 1, 0.4352941, 1,
-0.2604314, 0.972078, -0.3646848, 0, 1, 0.4431373, 1,
-0.2592097, 0.7258748, -0.3246562, 0, 1, 0.4470588, 1,
-0.2580884, -1.193478, -4.021856, 0, 1, 0.454902, 1,
-0.2540676, 0.9377308, -0.554768, 0, 1, 0.4588235, 1,
-0.253024, 0.2568818, -0.4446756, 0, 1, 0.4666667, 1,
-0.2526094, 0.8766261, 0.7669, 0, 1, 0.4705882, 1,
-0.2502286, 0.7841454, -0.8509071, 0, 1, 0.4784314, 1,
-0.2499793, 0.8834871, -0.1879869, 0, 1, 0.4823529, 1,
-0.2486564, 1.703506, 1.285927, 0, 1, 0.4901961, 1,
-0.2480004, -0.702041, -2.296137, 0, 1, 0.4941176, 1,
-0.2446809, -0.2743878, -2.451287, 0, 1, 0.5019608, 1,
-0.2426757, -0.2816215, -0.4977744, 0, 1, 0.509804, 1,
-0.2412868, 0.3378744, -0.9809187, 0, 1, 0.5137255, 1,
-0.2351173, -0.870624, -1.703098, 0, 1, 0.5215687, 1,
-0.2349226, 1.157297, 0.2625331, 0, 1, 0.5254902, 1,
-0.2341643, 0.4392863, -1.208874, 0, 1, 0.5333334, 1,
-0.2340245, 0.7130972, 0.313847, 0, 1, 0.5372549, 1,
-0.232772, 0.2541101, -0.2134891, 0, 1, 0.5450981, 1,
-0.2319696, 0.3601046, -0.0779002, 0, 1, 0.5490196, 1,
-0.2313989, 0.9306902, 0.6973612, 0, 1, 0.5568628, 1,
-0.229408, 2.995708, 0.495159, 0, 1, 0.5607843, 1,
-0.2284616, -0.2324644, -2.09393, 0, 1, 0.5686275, 1,
-0.2258954, 1.587701, -0.0944327, 0, 1, 0.572549, 1,
-0.2255734, -0.3623236, -2.406822, 0, 1, 0.5803922, 1,
-0.2209101, -1.636556, -1.324543, 0, 1, 0.5843138, 1,
-0.2156281, -0.4922324, -4.161406, 0, 1, 0.5921569, 1,
-0.2141731, 0.5505872, -0.857775, 0, 1, 0.5960785, 1,
-0.2100943, 0.6438169, 0.5590166, 0, 1, 0.6039216, 1,
-0.2082844, 0.4249077, -0.1053178, 0, 1, 0.6117647, 1,
-0.2071146, -1.124137, -0.3446913, 0, 1, 0.6156863, 1,
-0.2069471, 0.05341335, -2.615981, 0, 1, 0.6235294, 1,
-0.2024332, 2.474947, 0.9709418, 0, 1, 0.627451, 1,
-0.1966546, 1.97683, 0.3397452, 0, 1, 0.6352941, 1,
-0.1965348, -0.09709676, -3.428034, 0, 1, 0.6392157, 1,
-0.1923464, 0.7812816, 1.115677, 0, 1, 0.6470588, 1,
-0.1916735, -0.1998092, -2.832625, 0, 1, 0.6509804, 1,
-0.1910278, -1.646427, -2.45248, 0, 1, 0.6588235, 1,
-0.1892917, -0.9563749, -2.498047, 0, 1, 0.6627451, 1,
-0.1887028, 1.819225, 0.4212855, 0, 1, 0.6705883, 1,
-0.1881969, 1.086193, -0.3943863, 0, 1, 0.6745098, 1,
-0.1859354, -0.4593593, -1.095091, 0, 1, 0.682353, 1,
-0.1851719, 1.182465, -0.3241313, 0, 1, 0.6862745, 1,
-0.184286, -0.2001967, -3.496985, 0, 1, 0.6941177, 1,
-0.1825416, -0.140013, -0.6902304, 0, 1, 0.7019608, 1,
-0.1813089, -0.4742904, -1.313638, 0, 1, 0.7058824, 1,
-0.1802294, 0.8856991, -0.3388941, 0, 1, 0.7137255, 1,
-0.1783853, -1.653153, -2.825401, 0, 1, 0.7176471, 1,
-0.1780943, 0.1524194, -1.443089, 0, 1, 0.7254902, 1,
-0.1777955, 2.789648, -0.1136452, 0, 1, 0.7294118, 1,
-0.1768816, -0.3640945, -1.18023, 0, 1, 0.7372549, 1,
-0.1761716, 0.2364491, -1.007581, 0, 1, 0.7411765, 1,
-0.1734501, 0.9856765, -1.43337, 0, 1, 0.7490196, 1,
-0.172048, 0.02452341, -0.09215106, 0, 1, 0.7529412, 1,
-0.171285, -0.0599655, -2.924514, 0, 1, 0.7607843, 1,
-0.1697334, -1.364725, -3.192244, 0, 1, 0.7647059, 1,
-0.1673451, -1.016575, -2.618859, 0, 1, 0.772549, 1,
-0.166043, -0.5951032, -2.770935, 0, 1, 0.7764706, 1,
-0.1649668, -0.4027608, -2.336136, 0, 1, 0.7843137, 1,
-0.16163, -0.09303036, -2.167514, 0, 1, 0.7882353, 1,
-0.1597787, -0.1697789, -3.690244, 0, 1, 0.7960784, 1,
-0.1538053, -0.8913778, -1.958784, 0, 1, 0.8039216, 1,
-0.1522221, 1.345687, 0.4454453, 0, 1, 0.8078431, 1,
-0.1462813, -1.008609, -3.949519, 0, 1, 0.8156863, 1,
-0.1412765, -0.4961709, -2.023776, 0, 1, 0.8196079, 1,
-0.1332861, -0.2211419, -1.680839, 0, 1, 0.827451, 1,
-0.1322995, 0.56157, 1.598777, 0, 1, 0.8313726, 1,
-0.1288599, 0.5758306, 2.470643, 0, 1, 0.8392157, 1,
-0.1286193, -1.415793, -3.351923, 0, 1, 0.8431373, 1,
-0.1283038, -1.56709, -1.782905, 0, 1, 0.8509804, 1,
-0.127612, 0.1956985, 0.6359981, 0, 1, 0.854902, 1,
-0.1254868, -1.294836, -3.923939, 0, 1, 0.8627451, 1,
-0.1233989, 0.163068, -1.155648, 0, 1, 0.8666667, 1,
-0.1206235, -0.7411225, -2.691493, 0, 1, 0.8745098, 1,
-0.1163054, 0.3285985, 0.4300087, 0, 1, 0.8784314, 1,
-0.1115036, 0.03338631, -3.270293, 0, 1, 0.8862745, 1,
-0.1114184, -1.105914, -1.701447, 0, 1, 0.8901961, 1,
-0.1106814, 0.1081281, 1.182071, 0, 1, 0.8980392, 1,
-0.1102179, 0.459478, -0.6994091, 0, 1, 0.9058824, 1,
-0.1037349, 0.3830517, -1.516497, 0, 1, 0.9098039, 1,
-0.09996355, -0.5800349, -4.496419, 0, 1, 0.9176471, 1,
-0.09986331, 1.263475, -0.5483801, 0, 1, 0.9215686, 1,
-0.09507219, 0.3452357, -2.125299, 0, 1, 0.9294118, 1,
-0.09463645, 1.078433, -1.872451, 0, 1, 0.9333333, 1,
-0.08809768, 0.3214554, -1.19438, 0, 1, 0.9411765, 1,
-0.08076667, 0.4772197, 0.6590038, 0, 1, 0.945098, 1,
-0.0753682, 0.3824475, 0.3632748, 0, 1, 0.9529412, 1,
-0.07476695, -1.724366, -3.064764, 0, 1, 0.9568627, 1,
-0.07324085, -0.004182774, -2.16013, 0, 1, 0.9647059, 1,
-0.07083511, -0.057972, -1.575454, 0, 1, 0.9686275, 1,
-0.06853844, -1.633819, -4.088981, 0, 1, 0.9764706, 1,
-0.06239539, 0.4674138, -1.784855, 0, 1, 0.9803922, 1,
-0.0577809, 0.04748197, -2.431197, 0, 1, 0.9882353, 1,
-0.05571062, -1.232321, -2.472341, 0, 1, 0.9921569, 1,
-0.05563776, -1.191404, -2.957565, 0, 1, 1, 1,
-0.05423527, 1.073821, -1.818374, 0, 0.9921569, 1, 1,
-0.05136371, 1.329792, 0.8371871, 0, 0.9882353, 1, 1,
-0.051007, -0.03027217, -2.008591, 0, 0.9803922, 1, 1,
-0.04856548, -0.8697113, -0.7712438, 0, 0.9764706, 1, 1,
-0.04856025, -0.5186641, -5.20643, 0, 0.9686275, 1, 1,
-0.04673283, 0.7917524, 0.9321292, 0, 0.9647059, 1, 1,
-0.04119815, -0.5339516, -4.542187, 0, 0.9568627, 1, 1,
-0.03928586, -0.6128495, -2.576208, 0, 0.9529412, 1, 1,
-0.03875557, -0.1097278, -3.640847, 0, 0.945098, 1, 1,
-0.03694291, -1.383176, -3.575034, 0, 0.9411765, 1, 1,
-0.03578075, -0.1472859, -1.981303, 0, 0.9333333, 1, 1,
-0.03464149, 0.6581172, -0.06403717, 0, 0.9294118, 1, 1,
-0.02808188, 0.3106838, 1.316735, 0, 0.9215686, 1, 1,
-0.02802907, -1.511168, -4.250256, 0, 0.9176471, 1, 1,
-0.02711288, 0.2293419, -0.5024572, 0, 0.9098039, 1, 1,
-0.02517723, 1.450275, -0.6601557, 0, 0.9058824, 1, 1,
-0.01987047, -1.175049, -4.281442, 0, 0.8980392, 1, 1,
-0.00782426, 0.4423407, 1.921309, 0, 0.8901961, 1, 1,
-0.007665654, -1.372362, -3.585445, 0, 0.8862745, 1, 1,
-0.007353608, -0.08372755, -3.038529, 0, 0.8784314, 1, 1,
-0.003906505, 1.973994, -1.42369, 0, 0.8745098, 1, 1,
-0.001524773, -2.047804, -2.950398, 0, 0.8666667, 1, 1,
0.001043351, 0.1750811, 0.05703667, 0, 0.8627451, 1, 1,
0.003154254, 1.058888, -0.2180714, 0, 0.854902, 1, 1,
0.003390977, -0.510752, 3.144494, 0, 0.8509804, 1, 1,
0.005166227, 1.340225, 0.4621697, 0, 0.8431373, 1, 1,
0.01000558, 0.4578861, -0.566435, 0, 0.8392157, 1, 1,
0.01514566, 0.5415162, 0.1667857, 0, 0.8313726, 1, 1,
0.015428, -0.1108327, 3.234308, 0, 0.827451, 1, 1,
0.01589145, -1.182748, 3.268628, 0, 0.8196079, 1, 1,
0.01617031, 0.6965677, -0.5953371, 0, 0.8156863, 1, 1,
0.01803903, -1.330882, 3.540814, 0, 0.8078431, 1, 1,
0.02003342, 0.6393782, 0.05003078, 0, 0.8039216, 1, 1,
0.02210354, -0.07007057, 2.44204, 0, 0.7960784, 1, 1,
0.02220374, -0.5500805, 2.789473, 0, 0.7882353, 1, 1,
0.0270219, 0.5635259, 0.06463048, 0, 0.7843137, 1, 1,
0.02789987, -0.3324773, 2.308201, 0, 0.7764706, 1, 1,
0.02818711, 0.00236162, 0.8433161, 0, 0.772549, 1, 1,
0.02954226, 0.7800535, -0.4636285, 0, 0.7647059, 1, 1,
0.03273651, 0.4074104, -0.8416077, 0, 0.7607843, 1, 1,
0.03459904, 0.6587386, 0.6691847, 0, 0.7529412, 1, 1,
0.03802677, 0.363725, 0.217656, 0, 0.7490196, 1, 1,
0.04289926, -0.1015946, 1.099759, 0, 0.7411765, 1, 1,
0.04380899, -0.631056, 2.746605, 0, 0.7372549, 1, 1,
0.04669683, 0.3117058, -0.6696501, 0, 0.7294118, 1, 1,
0.05294354, -0.471241, 4.104956, 0, 0.7254902, 1, 1,
0.05325725, -1.414063, 3.784605, 0, 0.7176471, 1, 1,
0.06120914, 0.3179029, 1.965971, 0, 0.7137255, 1, 1,
0.06412821, 0.2403293, -0.1413006, 0, 0.7058824, 1, 1,
0.07259383, 0.6696831, 0.4384616, 0, 0.6980392, 1, 1,
0.07408453, -1.530605, 3.272614, 0, 0.6941177, 1, 1,
0.08023865, 0.06647417, -0.8715842, 0, 0.6862745, 1, 1,
0.08095699, 0.04937091, 1.057312, 0, 0.682353, 1, 1,
0.08281699, -1.879975, 2.485441, 0, 0.6745098, 1, 1,
0.0861856, -0.8183517, 2.835145, 0, 0.6705883, 1, 1,
0.08642665, -1.28931, 2.17113, 0, 0.6627451, 1, 1,
0.08754099, 0.3155524, 0.009042531, 0, 0.6588235, 1, 1,
0.09115126, -0.7707599, 1.555336, 0, 0.6509804, 1, 1,
0.09193127, 1.209932, -0.2819941, 0, 0.6470588, 1, 1,
0.09306236, -1.185603, 3.052479, 0, 0.6392157, 1, 1,
0.09365278, -0.5661873, 3.27134, 0, 0.6352941, 1, 1,
0.0965666, -0.2436307, 0.3381102, 0, 0.627451, 1, 1,
0.09893929, -1.041229, 4.064717, 0, 0.6235294, 1, 1,
0.1009129, -0.3413846, 2.794881, 0, 0.6156863, 1, 1,
0.101573, -1.099423, 4.114275, 0, 0.6117647, 1, 1,
0.101992, 0.5127518, 1.18044, 0, 0.6039216, 1, 1,
0.1112414, -2.253075, 2.346037, 0, 0.5960785, 1, 1,
0.1139028, 1.45386, 0.1716041, 0, 0.5921569, 1, 1,
0.1177159, -0.8197568, 2.069051, 0, 0.5843138, 1, 1,
0.1184038, 1.324913, 2.065008, 0, 0.5803922, 1, 1,
0.1185627, 0.3195262, 0.7415963, 0, 0.572549, 1, 1,
0.1192235, 0.8493885, 1.340517, 0, 0.5686275, 1, 1,
0.1214063, -0.4509578, 4.325048, 0, 0.5607843, 1, 1,
0.1215146, -1.712788, 3.434209, 0, 0.5568628, 1, 1,
0.1222283, -0.3063599, 2.346851, 0, 0.5490196, 1, 1,
0.1236726, 0.467641, 1.093215, 0, 0.5450981, 1, 1,
0.1277783, 0.8694178, -0.9538168, 0, 0.5372549, 1, 1,
0.1280949, -0.3913271, 4.339976, 0, 0.5333334, 1, 1,
0.1326434, 0.2436019, -0.5368527, 0, 0.5254902, 1, 1,
0.1332149, -0.8211765, 5.214885, 0, 0.5215687, 1, 1,
0.1366151, 2.483746, 0.2159951, 0, 0.5137255, 1, 1,
0.1378852, -0.5138297, 4.457828, 0, 0.509804, 1, 1,
0.141205, 0.3842548, 0.4472323, 0, 0.5019608, 1, 1,
0.1436056, -0.5010492, 2.957145, 0, 0.4941176, 1, 1,
0.15274, 1.380748, -1.31755, 0, 0.4901961, 1, 1,
0.1530454, -0.5884396, 2.541084, 0, 0.4823529, 1, 1,
0.1553467, -0.8240467, 1.98148, 0, 0.4784314, 1, 1,
0.1554605, -0.830681, 0.6046333, 0, 0.4705882, 1, 1,
0.1559069, 1.665927, -0.6384653, 0, 0.4666667, 1, 1,
0.1572654, 2.299943, -0.906279, 0, 0.4588235, 1, 1,
0.1584553, 0.3005761, 0.6272959, 0, 0.454902, 1, 1,
0.1591865, -0.8397596, 4.294277, 0, 0.4470588, 1, 1,
0.1600349, -0.4630871, 2.7561, 0, 0.4431373, 1, 1,
0.1614655, -0.7992882, 4.903368, 0, 0.4352941, 1, 1,
0.1623016, 0.8037353, 1.296712, 0, 0.4313726, 1, 1,
0.1652882, -1.194459, 3.087318, 0, 0.4235294, 1, 1,
0.1679705, 1.026958, 1.494485, 0, 0.4196078, 1, 1,
0.1685622, 0.8396738, 0.7460293, 0, 0.4117647, 1, 1,
0.1699265, 0.3746368, -0.06801135, 0, 0.4078431, 1, 1,
0.1724702, -0.3228084, 5.030027, 0, 0.4, 1, 1,
0.1765576, -0.7199981, 1.86632, 0, 0.3921569, 1, 1,
0.1837516, -1.581397, 3.445204, 0, 0.3882353, 1, 1,
0.1856302, -1.364466, 2.172649, 0, 0.3803922, 1, 1,
0.1877773, 0.8912416, -0.9153895, 0, 0.3764706, 1, 1,
0.1886246, -0.3909186, 2.997263, 0, 0.3686275, 1, 1,
0.1911937, -1.253941, 2.699948, 0, 0.3647059, 1, 1,
0.1989992, -0.2340585, 4.022481, 0, 0.3568628, 1, 1,
0.2036479, 0.9111776, -1.221954, 0, 0.3529412, 1, 1,
0.2061356, -0.5074347, 4.600615, 0, 0.345098, 1, 1,
0.2111399, -0.5175723, 3.691022, 0, 0.3411765, 1, 1,
0.212255, -0.348191, 2.60654, 0, 0.3333333, 1, 1,
0.2165928, -0.4743626, 3.182363, 0, 0.3294118, 1, 1,
0.2249897, -0.3928674, 3.892272, 0, 0.3215686, 1, 1,
0.2282438, 1.783953, -0.3099193, 0, 0.3176471, 1, 1,
0.2283894, 0.7281476, 0.1155845, 0, 0.3098039, 1, 1,
0.2363116, 1.383725, -2.703958, 0, 0.3058824, 1, 1,
0.2363465, 0.5936251, 0.830735, 0, 0.2980392, 1, 1,
0.2366984, -1.060593, 1.541942, 0, 0.2901961, 1, 1,
0.2406723, -0.2248506, 1.34301, 0, 0.2862745, 1, 1,
0.2411136, 1.264365, 1.055993, 0, 0.2784314, 1, 1,
0.2478612, -0.7890998, 2.263152, 0, 0.2745098, 1, 1,
0.2486363, 1.407911, -1.024856, 0, 0.2666667, 1, 1,
0.2572604, -0.08893467, 1.518533, 0, 0.2627451, 1, 1,
0.2580287, 0.9025535, 2.179231, 0, 0.254902, 1, 1,
0.2584122, 1.511071, -0.8768883, 0, 0.2509804, 1, 1,
0.2617407, 1.638946, -1.930099, 0, 0.2431373, 1, 1,
0.2624604, 0.4212671, 0.2917086, 0, 0.2392157, 1, 1,
0.2687918, 0.8070534, 0.737571, 0, 0.2313726, 1, 1,
0.2710267, -0.4204581, 3.109187, 0, 0.227451, 1, 1,
0.2787974, -0.6310399, 3.1057, 0, 0.2196078, 1, 1,
0.2818212, -0.8911768, 3.054197, 0, 0.2156863, 1, 1,
0.2895526, -1.368426, 2.579833, 0, 0.2078431, 1, 1,
0.2923715, 0.3665418, 2.286097, 0, 0.2039216, 1, 1,
0.2925025, 0.6176919, 0.8529252, 0, 0.1960784, 1, 1,
0.2941306, -0.4708056, 2.45621, 0, 0.1882353, 1, 1,
0.2950598, -0.8865674, 2.530548, 0, 0.1843137, 1, 1,
0.2953351, -0.4579534, 4.037776, 0, 0.1764706, 1, 1,
0.3054494, -0.4648989, 2.612579, 0, 0.172549, 1, 1,
0.3081072, -0.9048962, 3.170439, 0, 0.1647059, 1, 1,
0.3123795, -0.3858398, 1.939332, 0, 0.1607843, 1, 1,
0.3124235, -0.5247434, 1.370511, 0, 0.1529412, 1, 1,
0.3130246, -0.4892824, 1.309757, 0, 0.1490196, 1, 1,
0.3165541, -0.6976303, 3.831518, 0, 0.1411765, 1, 1,
0.3174389, -1.566302, 4.904378, 0, 0.1372549, 1, 1,
0.3180031, 0.3037582, 1.071728, 0, 0.1294118, 1, 1,
0.3219002, -0.1901072, 2.982775, 0, 0.1254902, 1, 1,
0.3230844, 0.6806629, 1.786585, 0, 0.1176471, 1, 1,
0.3235545, -0.8269684, 2.124111, 0, 0.1137255, 1, 1,
0.3242113, 0.853676, -1.630696, 0, 0.1058824, 1, 1,
0.3249085, -0.6798145, 2.757697, 0, 0.09803922, 1, 1,
0.3267677, 0.1467749, -0.5665048, 0, 0.09411765, 1, 1,
0.3282461, 0.1372045, 1.84185, 0, 0.08627451, 1, 1,
0.3313974, 0.911271, 1.077495, 0, 0.08235294, 1, 1,
0.3316379, 0.7548915, -0.451018, 0, 0.07450981, 1, 1,
0.3359552, 0.3223826, -0.8861583, 0, 0.07058824, 1, 1,
0.3383131, -0.9292887, 4.588471, 0, 0.0627451, 1, 1,
0.3402302, -0.8922759, 2.476463, 0, 0.05882353, 1, 1,
0.3483784, 0.4693835, 0.6208905, 0, 0.05098039, 1, 1,
0.3523928, 0.7794306, 0.6075348, 0, 0.04705882, 1, 1,
0.3530372, -0.4411762, 2.072734, 0, 0.03921569, 1, 1,
0.3540698, 0.5567231, 0.1895298, 0, 0.03529412, 1, 1,
0.3625834, -1.386737, 1.979677, 0, 0.02745098, 1, 1,
0.3686585, -0.3530415, 3.255005, 0, 0.02352941, 1, 1,
0.369117, -1.219526, 2.887449, 0, 0.01568628, 1, 1,
0.3694466, -0.205721, 2.311526, 0, 0.01176471, 1, 1,
0.37703, 0.4943215, 3.241057, 0, 0.003921569, 1, 1,
0.3803481, 0.462107, 1.419523, 0.003921569, 0, 1, 1,
0.391343, 0.1983019, 1.671104, 0.007843138, 0, 1, 1,
0.3933882, 0.453195, 0.8725618, 0.01568628, 0, 1, 1,
0.3940726, -1.802099, 2.488944, 0.01960784, 0, 1, 1,
0.3995752, 1.247433, -0.2218875, 0.02745098, 0, 1, 1,
0.401922, 1.776174, 1.671731, 0.03137255, 0, 1, 1,
0.4019724, -0.5024812, 2.655117, 0.03921569, 0, 1, 1,
0.4054269, 0.8054271, 0.2418096, 0.04313726, 0, 1, 1,
0.4075038, -0.2370477, 2.015207, 0.05098039, 0, 1, 1,
0.4096107, 0.3388239, -0.1068641, 0.05490196, 0, 1, 1,
0.413583, -1.193252, 2.758156, 0.0627451, 0, 1, 1,
0.4139621, -0.4978791, 2.166283, 0.06666667, 0, 1, 1,
0.418289, 0.04396797, 3.140812, 0.07450981, 0, 1, 1,
0.4225376, -0.3906852, 3.248151, 0.07843138, 0, 1, 1,
0.4231816, 1.390565, 0.7602635, 0.08627451, 0, 1, 1,
0.4234708, -0.5000954, 0.8764852, 0.09019608, 0, 1, 1,
0.424287, -0.3506557, 2.004322, 0.09803922, 0, 1, 1,
0.4294712, 0.6256779, -0.5832207, 0.1058824, 0, 1, 1,
0.4334702, 1.019154, 0.6609533, 0.1098039, 0, 1, 1,
0.4335499, -0.9585531, 1.85862, 0.1176471, 0, 1, 1,
0.4381394, 0.2931679, 0.8450783, 0.1215686, 0, 1, 1,
0.4393379, 0.6093846, 0.9469785, 0.1294118, 0, 1, 1,
0.4431698, 0.8955044, -0.04894006, 0.1333333, 0, 1, 1,
0.4446576, 0.9592095, 0.7403181, 0.1411765, 0, 1, 1,
0.4473567, 0.5775118, 0.8490067, 0.145098, 0, 1, 1,
0.4516565, -0.3373852, 0.5035072, 0.1529412, 0, 1, 1,
0.4518484, -0.5971799, 3.772699, 0.1568628, 0, 1, 1,
0.453485, 0.1779919, 0.3512698, 0.1647059, 0, 1, 1,
0.4577973, 0.2723479, 1.428361, 0.1686275, 0, 1, 1,
0.4589427, 0.3614402, 2.429336, 0.1764706, 0, 1, 1,
0.4599793, -0.2738352, 1.993609, 0.1803922, 0, 1, 1,
0.4604406, 1.122022, 0.6494481, 0.1882353, 0, 1, 1,
0.4624072, 1.11935, 2.213443, 0.1921569, 0, 1, 1,
0.4630747, -0.7465199, 2.880123, 0.2, 0, 1, 1,
0.4634509, 0.6066508, 1.133368, 0.2078431, 0, 1, 1,
0.464871, -0.4383001, 2.393559, 0.2117647, 0, 1, 1,
0.4650455, 0.2725963, 0.3361501, 0.2196078, 0, 1, 1,
0.4678705, -0.5569042, 2.924352, 0.2235294, 0, 1, 1,
0.4687486, 0.9236608, 0.2246274, 0.2313726, 0, 1, 1,
0.4689165, 0.5961186, 0.9019024, 0.2352941, 0, 1, 1,
0.4724291, 0.08816992, 2.273557, 0.2431373, 0, 1, 1,
0.4796039, 0.8806236, 0.3350493, 0.2470588, 0, 1, 1,
0.4854656, -0.2607687, 2.145986, 0.254902, 0, 1, 1,
0.4889199, -0.3729324, 2.603725, 0.2588235, 0, 1, 1,
0.4893643, -0.7957664, 1.655068, 0.2666667, 0, 1, 1,
0.4911765, 0.4556951, 0.1022975, 0.2705882, 0, 1, 1,
0.5043066, 0.628894, 1.838024, 0.2784314, 0, 1, 1,
0.5128369, 0.4755039, 1.949061, 0.282353, 0, 1, 1,
0.5191302, 1.221198, -0.8274938, 0.2901961, 0, 1, 1,
0.5208506, -0.463615, 0.2758701, 0.2941177, 0, 1, 1,
0.52392, -0.05047402, 1.59425, 0.3019608, 0, 1, 1,
0.5331584, -0.2751932, 2.512446, 0.3098039, 0, 1, 1,
0.5343682, -1.218117, 1.864543, 0.3137255, 0, 1, 1,
0.5359274, 0.5969567, 1.542428, 0.3215686, 0, 1, 1,
0.5369554, -0.331795, 4.078639, 0.3254902, 0, 1, 1,
0.5419069, -1.175923, 3.454334, 0.3333333, 0, 1, 1,
0.5454666, 0.2222613, 1.384652, 0.3372549, 0, 1, 1,
0.5461839, 0.7324433, 0.8810911, 0.345098, 0, 1, 1,
0.5472867, 0.925473, 1.36545, 0.3490196, 0, 1, 1,
0.5555416, 1.006706, 1.04786, 0.3568628, 0, 1, 1,
0.5556739, -0.3375648, 1.913976, 0.3607843, 0, 1, 1,
0.556168, -0.2755326, 3.942081, 0.3686275, 0, 1, 1,
0.5573303, -0.2405858, 1.697445, 0.372549, 0, 1, 1,
0.5575554, -0.1535026, 0.6861784, 0.3803922, 0, 1, 1,
0.5584292, 0.2401186, 0.6648931, 0.3843137, 0, 1, 1,
0.5586343, 1.044207, 1.361988, 0.3921569, 0, 1, 1,
0.5596538, -1.815873, 2.131833, 0.3960784, 0, 1, 1,
0.5668317, -0.1717657, 3.157431, 0.4039216, 0, 1, 1,
0.5673645, -0.08209333, 2.615008, 0.4117647, 0, 1, 1,
0.5697773, 1.208029, -0.5454425, 0.4156863, 0, 1, 1,
0.5701333, 0.7160487, -0.1412014, 0.4235294, 0, 1, 1,
0.5748135, 0.6118026, -0.9005053, 0.427451, 0, 1, 1,
0.5820845, 1.374868, 1.437445, 0.4352941, 0, 1, 1,
0.6039792, -0.637228, 3.283694, 0.4392157, 0, 1, 1,
0.6063302, 0.94342, 1.440872, 0.4470588, 0, 1, 1,
0.6068729, 1.141649, 0.01249627, 0.4509804, 0, 1, 1,
0.6081102, -0.7317895, 1.539747, 0.4588235, 0, 1, 1,
0.6099025, 1.562263, -0.6993004, 0.4627451, 0, 1, 1,
0.6134059, 0.4201268, -0.2323745, 0.4705882, 0, 1, 1,
0.613707, 0.1766124, 0.3804995, 0.4745098, 0, 1, 1,
0.616904, 0.3225075, 1.41948, 0.4823529, 0, 1, 1,
0.6169981, -0.4953958, 0.5566763, 0.4862745, 0, 1, 1,
0.6188131, 0.3453618, -0.4694653, 0.4941176, 0, 1, 1,
0.622942, 0.6757038, 1.126262, 0.5019608, 0, 1, 1,
0.6253656, -0.4652839, 2.770143, 0.5058824, 0, 1, 1,
0.6333901, -0.2183994, -0.002911761, 0.5137255, 0, 1, 1,
0.6369665, -0.03789614, 0.8102363, 0.5176471, 0, 1, 1,
0.6418, 0.2434925, 1.125535, 0.5254902, 0, 1, 1,
0.6489391, 0.8690513, 0.8251191, 0.5294118, 0, 1, 1,
0.6532968, -0.2322293, 1.79789, 0.5372549, 0, 1, 1,
0.6575598, 0.4160439, -0.650331, 0.5411765, 0, 1, 1,
0.6587857, 0.3090833, 0.8984542, 0.5490196, 0, 1, 1,
0.6597896, 0.7868634, 0.678587, 0.5529412, 0, 1, 1,
0.6607519, -0.9607599, 1.388917, 0.5607843, 0, 1, 1,
0.6686807, -0.7745451, 2.733409, 0.5647059, 0, 1, 1,
0.6710052, -1.661223, 2.164006, 0.572549, 0, 1, 1,
0.6732365, -0.8510213, 3.518817, 0.5764706, 0, 1, 1,
0.673304, 1.393934, -0.1617299, 0.5843138, 0, 1, 1,
0.677824, 0.3595913, 0.821883, 0.5882353, 0, 1, 1,
0.6823376, -1.178832, 2.222259, 0.5960785, 0, 1, 1,
0.6890464, -0.1760883, 2.853032, 0.6039216, 0, 1, 1,
0.6902939, -0.1882305, 2.593527, 0.6078432, 0, 1, 1,
0.6905131, -1.251673, 4.108111, 0.6156863, 0, 1, 1,
0.6939918, -0.4848785, 0.6998866, 0.6196079, 0, 1, 1,
0.7008435, 0.3301345, -0.07471851, 0.627451, 0, 1, 1,
0.7164567, -1.627211, 1.740951, 0.6313726, 0, 1, 1,
0.7235174, 0.2097946, 1.28352, 0.6392157, 0, 1, 1,
0.723555, 0.2378813, 1.499636, 0.6431373, 0, 1, 1,
0.7251496, -0.4930554, 1.710276, 0.6509804, 0, 1, 1,
0.7253087, -0.6611248, 3.324466, 0.654902, 0, 1, 1,
0.7259259, 1.472296, 0.01696431, 0.6627451, 0, 1, 1,
0.7296959, -0.03790359, 2.558378, 0.6666667, 0, 1, 1,
0.7335662, -1.104033, 4.036365, 0.6745098, 0, 1, 1,
0.7367972, -0.7967256, 1.149388, 0.6784314, 0, 1, 1,
0.7385709, -0.1793363, 1.386897, 0.6862745, 0, 1, 1,
0.7399931, 0.4899844, 0.2890709, 0.6901961, 0, 1, 1,
0.7506039, 0.9365461, 1.456473, 0.6980392, 0, 1, 1,
0.7510468, 0.4155505, 1.175659, 0.7058824, 0, 1, 1,
0.7536844, 0.7118506, -0.4918486, 0.7098039, 0, 1, 1,
0.7561085, 1.099871, 1.695507, 0.7176471, 0, 1, 1,
0.7564381, -0.1326851, 2.294526, 0.7215686, 0, 1, 1,
0.760055, 0.7556928, 2.104612, 0.7294118, 0, 1, 1,
0.7666342, -0.4796412, 3.001317, 0.7333333, 0, 1, 1,
0.7679553, 0.4390254, -1.21547, 0.7411765, 0, 1, 1,
0.7687506, -0.7446885, 3.833685, 0.7450981, 0, 1, 1,
0.7705461, -0.03269356, 1.820781, 0.7529412, 0, 1, 1,
0.7719167, -0.403427, 1.914279, 0.7568628, 0, 1, 1,
0.7720955, -0.2872062, 2.539312, 0.7647059, 0, 1, 1,
0.7748398, -0.6200709, 2.397447, 0.7686275, 0, 1, 1,
0.7783109, -1.6654, 1.74803, 0.7764706, 0, 1, 1,
0.7802838, -0.1154206, 1.85153, 0.7803922, 0, 1, 1,
0.7849526, 1.086064, 2.46781, 0.7882353, 0, 1, 1,
0.7849678, 1.327171, -1.059463, 0.7921569, 0, 1, 1,
0.790976, -0.4278031, 2.007361, 0.8, 0, 1, 1,
0.7971001, 0.3246848, 1.56078, 0.8078431, 0, 1, 1,
0.7988149, -0.2801385, 1.442365, 0.8117647, 0, 1, 1,
0.7993984, -0.8309727, 1.295932, 0.8196079, 0, 1, 1,
0.8107523, 0.4248308, 2.17829, 0.8235294, 0, 1, 1,
0.8157784, -0.4331501, 0.1407657, 0.8313726, 0, 1, 1,
0.820333, -0.4550245, 3.305527, 0.8352941, 0, 1, 1,
0.823094, 0.5784878, 1.042765, 0.8431373, 0, 1, 1,
0.8287646, 1.645976, 1.041377, 0.8470588, 0, 1, 1,
0.8289932, 1.284114, 0.5636641, 0.854902, 0, 1, 1,
0.8322788, -1.314919, 1.524313, 0.8588235, 0, 1, 1,
0.8328305, -0.155005, 3.443612, 0.8666667, 0, 1, 1,
0.8340948, -1.556754, 2.416698, 0.8705882, 0, 1, 1,
0.8354942, -1.507612, 1.954489, 0.8784314, 0, 1, 1,
0.8382411, 0.7742082, -0.3675856, 0.8823529, 0, 1, 1,
0.8406286, 0.2808123, 1.891377, 0.8901961, 0, 1, 1,
0.8429379, -0.564679, 2.788079, 0.8941177, 0, 1, 1,
0.8447523, 0.3110934, 0.7691833, 0.9019608, 0, 1, 1,
0.8464935, 1.471316, -1.171687, 0.9098039, 0, 1, 1,
0.8496175, 0.4158207, -1.402131, 0.9137255, 0, 1, 1,
0.8543808, -0.7885889, 4.387485, 0.9215686, 0, 1, 1,
0.8654233, -1.530414, 0.9889511, 0.9254902, 0, 1, 1,
0.8704477, 1.742103, -1.784894, 0.9333333, 0, 1, 1,
0.8736333, 0.2274729, 1.293917, 0.9372549, 0, 1, 1,
0.8739488, 0.03987451, 1.144785, 0.945098, 0, 1, 1,
0.8740984, -1.00004, 2.097757, 0.9490196, 0, 1, 1,
0.8758863, 0.840264, 0.823782, 0.9568627, 0, 1, 1,
0.8820509, 1.009315, 0.9842905, 0.9607843, 0, 1, 1,
0.8830864, 1.161393, 1.575207, 0.9686275, 0, 1, 1,
0.8950107, 0.7656525, 0.2563037, 0.972549, 0, 1, 1,
0.8957469, -0.1901872, 2.917362, 0.9803922, 0, 1, 1,
0.8984085, -0.02484586, 1.987188, 0.9843137, 0, 1, 1,
0.8988122, 1.466091, 2.103992, 0.9921569, 0, 1, 1,
0.8994139, -1.081796, 2.400099, 0.9960784, 0, 1, 1,
0.904735, 0.6223193, -0.4085921, 1, 0, 0.9960784, 1,
0.9270368, -0.21195, 1.429248, 1, 0, 0.9882353, 1,
0.9292687, 1.729112, 1.410428, 1, 0, 0.9843137, 1,
0.9293416, -0.4595858, -0.7894172, 1, 0, 0.9764706, 1,
0.9320651, -1.256743, 3.67598, 1, 0, 0.972549, 1,
0.9331369, 0.9233679, 2.396305, 1, 0, 0.9647059, 1,
0.9393559, -0.380044, 2.089424, 1, 0, 0.9607843, 1,
0.9470831, -1.115045, 1.566375, 1, 0, 0.9529412, 1,
0.9500182, 0.7275859, 1.772664, 1, 0, 0.9490196, 1,
0.9649979, -0.7605191, 1.504378, 1, 0, 0.9411765, 1,
0.96594, -0.6010165, 1.437305, 1, 0, 0.9372549, 1,
0.9663299, -0.374262, 0.3727713, 1, 0, 0.9294118, 1,
0.9676304, 0.6714547, -0.2909208, 1, 0, 0.9254902, 1,
0.975401, 0.3982009, 0.7891279, 1, 0, 0.9176471, 1,
0.9787981, 0.4423942, 1.458126, 1, 0, 0.9137255, 1,
0.9827609, 0.7973297, 0.7293809, 1, 0, 0.9058824, 1,
0.9961846, 0.2740966, 1.985135, 1, 0, 0.9019608, 1,
1.001379, 0.4694735, -0.3968894, 1, 0, 0.8941177, 1,
1.00427, 0.09687917, 2.028466, 1, 0, 0.8862745, 1,
1.005221, -0.1134287, 2.605139, 1, 0, 0.8823529, 1,
1.011454, 1.042855, -0.5026706, 1, 0, 0.8745098, 1,
1.013126, -0.6708183, 1.828807, 1, 0, 0.8705882, 1,
1.015506, -0.8606473, 2.542455, 1, 0, 0.8627451, 1,
1.015845, -1.243205, 2.140134, 1, 0, 0.8588235, 1,
1.036738, -0.2670562, 0.4457926, 1, 0, 0.8509804, 1,
1.038734, -1.396221, 1.432774, 1, 0, 0.8470588, 1,
1.042512, -0.877386, 4.164848, 1, 0, 0.8392157, 1,
1.053583, -1.52884, 3.801379, 1, 0, 0.8352941, 1,
1.059345, 0.902438, 2.786367, 1, 0, 0.827451, 1,
1.0619, 0.2512808, 1.556079, 1, 0, 0.8235294, 1,
1.064858, -0.1359276, 0.3930869, 1, 0, 0.8156863, 1,
1.068353, 0.3468505, 1.197112, 1, 0, 0.8117647, 1,
1.06878, 1.61103, 1.646854, 1, 0, 0.8039216, 1,
1.071297, -1.124217, 2.330515, 1, 0, 0.7960784, 1,
1.074828, -0.258622, 1.688993, 1, 0, 0.7921569, 1,
1.077871, -1.493571, 1.020502, 1, 0, 0.7843137, 1,
1.084201, -0.6972626, 2.873236, 1, 0, 0.7803922, 1,
1.093829, 0.7097018, 2.161105, 1, 0, 0.772549, 1,
1.094204, -1.182775, 3.602085, 1, 0, 0.7686275, 1,
1.099519, -0.5294514, 1.775044, 1, 0, 0.7607843, 1,
1.101385, -0.5031129, 2.083795, 1, 0, 0.7568628, 1,
1.106419, -0.4650481, 1.884639, 1, 0, 0.7490196, 1,
1.109038, -0.473493, 4.0682, 1, 0, 0.7450981, 1,
1.117033, 1.025029, 1.13095, 1, 0, 0.7372549, 1,
1.133168, 0.4204523, 1.63159, 1, 0, 0.7333333, 1,
1.138761, -0.3307508, 1.020988, 1, 0, 0.7254902, 1,
1.1404, -0.1720402, 1.617446, 1, 0, 0.7215686, 1,
1.142186, 0.4285033, 0.9660999, 1, 0, 0.7137255, 1,
1.142391, -0.4178093, 0.6384572, 1, 0, 0.7098039, 1,
1.149605, 0.4410377, 1.225652, 1, 0, 0.7019608, 1,
1.154301, 0.2309543, 1.620961, 1, 0, 0.6941177, 1,
1.15868, -1.327385, 4.167599, 1, 0, 0.6901961, 1,
1.160751, -0.02789543, 2.194656, 1, 0, 0.682353, 1,
1.16464, 0.1234411, 2.013395, 1, 0, 0.6784314, 1,
1.16507, -0.09864338, 0.9736829, 1, 0, 0.6705883, 1,
1.168168, -0.0944217, 2.187675, 1, 0, 0.6666667, 1,
1.168927, -0.8522251, -0.3735988, 1, 0, 0.6588235, 1,
1.177919, -0.2742226, 3.720362, 1, 0, 0.654902, 1,
1.18039, -1.709976, 2.376246, 1, 0, 0.6470588, 1,
1.186273, 0.7844766, -0.1609957, 1, 0, 0.6431373, 1,
1.20283, -0.2809355, 2.028129, 1, 0, 0.6352941, 1,
1.204445, 0.4398999, 1.898574, 1, 0, 0.6313726, 1,
1.213663, 1.315469, 1.558602, 1, 0, 0.6235294, 1,
1.222777, 0.6857113, 0.7779185, 1, 0, 0.6196079, 1,
1.22603, 1.331832, 0.5935578, 1, 0, 0.6117647, 1,
1.226149, -0.7145248, 3.776287, 1, 0, 0.6078432, 1,
1.229376, 0.1243119, -0.142898, 1, 0, 0.6, 1,
1.241184, 0.04515321, 0.5720258, 1, 0, 0.5921569, 1,
1.242996, 1.132664, 1.33898, 1, 0, 0.5882353, 1,
1.245289, 1.589776, 0.3660721, 1, 0, 0.5803922, 1,
1.250944, -1.070728, 2.687176, 1, 0, 0.5764706, 1,
1.25892, -0.3352415, 1.087795, 1, 0, 0.5686275, 1,
1.260937, -0.5884731, 2.292779, 1, 0, 0.5647059, 1,
1.261637, 0.3459058, 0.4419267, 1, 0, 0.5568628, 1,
1.263956, -0.5081537, 1.961357, 1, 0, 0.5529412, 1,
1.264579, -0.05921675, 2.379519, 1, 0, 0.5450981, 1,
1.273642, 0.5217413, 2.037189, 1, 0, 0.5411765, 1,
1.275109, 1.176043, 1.302255, 1, 0, 0.5333334, 1,
1.276409, 0.2548831, 1.058962, 1, 0, 0.5294118, 1,
1.276586, 0.9360862, 2.073516, 1, 0, 0.5215687, 1,
1.284272, -1.040412, 1.562264, 1, 0, 0.5176471, 1,
1.28977, 0.4221605, 0.8576823, 1, 0, 0.509804, 1,
1.293271, 1.238438, -0.5478508, 1, 0, 0.5058824, 1,
1.297086, -0.4117455, 1.926259, 1, 0, 0.4980392, 1,
1.307266, -0.9162693, 1.763181, 1, 0, 0.4901961, 1,
1.307978, 1.882138, -1.635633, 1, 0, 0.4862745, 1,
1.321181, 0.467148, 1.763492, 1, 0, 0.4784314, 1,
1.329388, 0.8211655, 2.049608, 1, 0, 0.4745098, 1,
1.344942, -0.2168406, 1.09336, 1, 0, 0.4666667, 1,
1.346698, -0.1094473, 2.096178, 1, 0, 0.4627451, 1,
1.350607, -0.7586584, 2.548857, 1, 0, 0.454902, 1,
1.352568, 0.3250053, 0.7427232, 1, 0, 0.4509804, 1,
1.355252, -0.6637194, 1.082631, 1, 0, 0.4431373, 1,
1.359715, -0.1319075, 1.466485, 1, 0, 0.4392157, 1,
1.376942, 0.4454509, 1.208277, 1, 0, 0.4313726, 1,
1.404168, 1.674074, 1.075654, 1, 0, 0.427451, 1,
1.410272, 1.673776, 2.076045, 1, 0, 0.4196078, 1,
1.411798, -1.308049, 0.8263975, 1, 0, 0.4156863, 1,
1.416259, 1.181581, -0.3207, 1, 0, 0.4078431, 1,
1.42595, -0.2332665, 3.331289, 1, 0, 0.4039216, 1,
1.429476, 0.6951819, 1.316239, 1, 0, 0.3960784, 1,
1.431895, -0.160833, 2.64101, 1, 0, 0.3882353, 1,
1.436769, -1.409337, 0.7697068, 1, 0, 0.3843137, 1,
1.447399, -0.9023638, 1.872711, 1, 0, 0.3764706, 1,
1.453016, 1.187972, 0.1806846, 1, 0, 0.372549, 1,
1.45509, -1.082213, 2.263042, 1, 0, 0.3647059, 1,
1.462953, 1.425029, 1.132206, 1, 0, 0.3607843, 1,
1.473077, 0.1165254, 0.05458255, 1, 0, 0.3529412, 1,
1.480194, -0.1296638, 1.56821, 1, 0, 0.3490196, 1,
1.483742, -1.011655, 0.7726109, 1, 0, 0.3411765, 1,
1.484279, -1.472013, 0.6294292, 1, 0, 0.3372549, 1,
1.494274, 0.3572968, 1.606604, 1, 0, 0.3294118, 1,
1.494386, 1.141262, 1.032933, 1, 0, 0.3254902, 1,
1.498933, 1.035687, 0.6597211, 1, 0, 0.3176471, 1,
1.512176, -0.7207617, 1.005497, 1, 0, 0.3137255, 1,
1.515725, 0.648492, 1.455902, 1, 0, 0.3058824, 1,
1.521844, -1.432826, 2.509503, 1, 0, 0.2980392, 1,
1.529868, -2.060981, 2.203838, 1, 0, 0.2941177, 1,
1.531207, 0.1009258, 2.581517, 1, 0, 0.2862745, 1,
1.537392, -0.6625311, 1.127524, 1, 0, 0.282353, 1,
1.547595, -0.2223895, 0.5563557, 1, 0, 0.2745098, 1,
1.580968, 0.1125542, 1.940337, 1, 0, 0.2705882, 1,
1.582173, 2.338247, 1.672189, 1, 0, 0.2627451, 1,
1.591112, -0.001610709, 2.729769, 1, 0, 0.2588235, 1,
1.594203, -1.235325, 3.373061, 1, 0, 0.2509804, 1,
1.608309, -1.286748, 1.712568, 1, 0, 0.2470588, 1,
1.610332, -0.2846835, 2.143806, 1, 0, 0.2392157, 1,
1.61517, -0.5919551, 2.256919, 1, 0, 0.2352941, 1,
1.627653, -0.2880177, 0.125297, 1, 0, 0.227451, 1,
1.631599, -0.988347, 2.992962, 1, 0, 0.2235294, 1,
1.648278, -1.986719, 2.635202, 1, 0, 0.2156863, 1,
1.658808, -0.643171, 2.897295, 1, 0, 0.2117647, 1,
1.681427, 1.078942, -0.08182848, 1, 0, 0.2039216, 1,
1.684271, -3.262791, 3.444971, 1, 0, 0.1960784, 1,
1.692516, 0.4125297, 1.890007, 1, 0, 0.1921569, 1,
1.727321, -1.375743, 3.221256, 1, 0, 0.1843137, 1,
1.743753, 0.5092162, 2.441342, 1, 0, 0.1803922, 1,
1.762329, -0.7688273, 1.872833, 1, 0, 0.172549, 1,
1.768767, 1.368649, 1.993555, 1, 0, 0.1686275, 1,
1.812728, 0.834979, 0.3368791, 1, 0, 0.1607843, 1,
1.816641, 0.9098371, 2.555734, 1, 0, 0.1568628, 1,
1.846473, -1.390833, 1.012858, 1, 0, 0.1490196, 1,
1.855197, -0.9333225, 1.221354, 1, 0, 0.145098, 1,
1.88868, 1.365988, 1.115407, 1, 0, 0.1372549, 1,
1.926261, 1.101034, 0.7625241, 1, 0, 0.1333333, 1,
1.941027, -1.130315, 2.775513, 1, 0, 0.1254902, 1,
1.941412, 0.5330572, 2.143826, 1, 0, 0.1215686, 1,
2.05947, -0.05149417, 1.351255, 1, 0, 0.1137255, 1,
2.07716, -0.01117691, 2.36812, 1, 0, 0.1098039, 1,
2.09276, -0.7895994, 4.235493, 1, 0, 0.1019608, 1,
2.098082, -0.0988322, 2.536527, 1, 0, 0.09411765, 1,
2.108517, -1.601029, 3.586403, 1, 0, 0.09019608, 1,
2.136647, -0.01148055, 1.206043, 1, 0, 0.08235294, 1,
2.151086, 0.7655954, 1.412289, 1, 0, 0.07843138, 1,
2.169878, 1.176966, 2.219153, 1, 0, 0.07058824, 1,
2.179718, -0.2820061, 0.4965959, 1, 0, 0.06666667, 1,
2.182385, -0.8871862, 3.146263, 1, 0, 0.05882353, 1,
2.339179, 0.6209187, -0.5474619, 1, 0, 0.05490196, 1,
2.351461, 0.1805736, 3.120379, 1, 0, 0.04705882, 1,
2.45671, -0.2609986, 0.5818378, 1, 0, 0.04313726, 1,
2.514694, -1.144252, 0.2189124, 1, 0, 0.03529412, 1,
2.570758, -0.3115256, 1.925912, 1, 0, 0.03137255, 1,
2.599216, -0.02723913, -0.2799422, 1, 0, 0.02352941, 1,
2.711784, -0.9869894, 1.665406, 1, 0, 0.01960784, 1,
2.722649, -0.2556818, 1.753144, 1, 0, 0.01176471, 1,
2.994685, 0.9027176, 1.264183, 1, 0, 0.007843138, 1
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
-0.2690369, -4.323607, -6.972843, 0, -0.5, 0.5, 0.5,
-0.2690369, -4.323607, -6.972843, 1, -0.5, 0.5, 0.5,
-0.2690369, -4.323607, -6.972843, 1, 1.5, 0.5, 0.5,
-0.2690369, -4.323607, -6.972843, 0, 1.5, 0.5, 0.5
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
-4.639161, -0.1335415, -6.972843, 0, -0.5, 0.5, 0.5,
-4.639161, -0.1335415, -6.972843, 1, -0.5, 0.5, 0.5,
-4.639161, -0.1335415, -6.972843, 1, 1.5, 0.5, 0.5,
-4.639161, -0.1335415, -6.972843, 0, 1.5, 0.5, 0.5
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
-4.639161, -4.323607, 0.004227161, 0, -0.5, 0.5, 0.5,
-4.639161, -4.323607, 0.004227161, 1, -0.5, 0.5, 0.5,
-4.639161, -4.323607, 0.004227161, 1, 1.5, 0.5, 0.5,
-4.639161, -4.323607, 0.004227161, 0, 1.5, 0.5, 0.5
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
-3, -3.356669, -5.36275,
2, -3.356669, -5.36275,
-3, -3.356669, -5.36275,
-3, -3.517825, -5.631099,
-2, -3.356669, -5.36275,
-2, -3.517825, -5.631099,
-1, -3.356669, -5.36275,
-1, -3.517825, -5.631099,
0, -3.356669, -5.36275,
0, -3.517825, -5.631099,
1, -3.356669, -5.36275,
1, -3.517825, -5.631099,
2, -3.356669, -5.36275,
2, -3.517825, -5.631099
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
-3, -3.840138, -6.167797, 0, -0.5, 0.5, 0.5,
-3, -3.840138, -6.167797, 1, -0.5, 0.5, 0.5,
-3, -3.840138, -6.167797, 1, 1.5, 0.5, 0.5,
-3, -3.840138, -6.167797, 0, 1.5, 0.5, 0.5,
-2, -3.840138, -6.167797, 0, -0.5, 0.5, 0.5,
-2, -3.840138, -6.167797, 1, -0.5, 0.5, 0.5,
-2, -3.840138, -6.167797, 1, 1.5, 0.5, 0.5,
-2, -3.840138, -6.167797, 0, 1.5, 0.5, 0.5,
-1, -3.840138, -6.167797, 0, -0.5, 0.5, 0.5,
-1, -3.840138, -6.167797, 1, -0.5, 0.5, 0.5,
-1, -3.840138, -6.167797, 1, 1.5, 0.5, 0.5,
-1, -3.840138, -6.167797, 0, 1.5, 0.5, 0.5,
0, -3.840138, -6.167797, 0, -0.5, 0.5, 0.5,
0, -3.840138, -6.167797, 1, -0.5, 0.5, 0.5,
0, -3.840138, -6.167797, 1, 1.5, 0.5, 0.5,
0, -3.840138, -6.167797, 0, 1.5, 0.5, 0.5,
1, -3.840138, -6.167797, 0, -0.5, 0.5, 0.5,
1, -3.840138, -6.167797, 1, -0.5, 0.5, 0.5,
1, -3.840138, -6.167797, 1, 1.5, 0.5, 0.5,
1, -3.840138, -6.167797, 0, 1.5, 0.5, 0.5,
2, -3.840138, -6.167797, 0, -0.5, 0.5, 0.5,
2, -3.840138, -6.167797, 1, -0.5, 0.5, 0.5,
2, -3.840138, -6.167797, 1, 1.5, 0.5, 0.5,
2, -3.840138, -6.167797, 0, 1.5, 0.5, 0.5
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
-3.630671, -3, -5.36275,
-3.630671, 2, -5.36275,
-3.630671, -3, -5.36275,
-3.798752, -3, -5.631099,
-3.630671, -2, -5.36275,
-3.798752, -2, -5.631099,
-3.630671, -1, -5.36275,
-3.798752, -1, -5.631099,
-3.630671, 0, -5.36275,
-3.798752, 0, -5.631099,
-3.630671, 1, -5.36275,
-3.798752, 1, -5.631099,
-3.630671, 2, -5.36275,
-3.798752, 2, -5.631099
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
-4.134916, -3, -6.167797, 0, -0.5, 0.5, 0.5,
-4.134916, -3, -6.167797, 1, -0.5, 0.5, 0.5,
-4.134916, -3, -6.167797, 1, 1.5, 0.5, 0.5,
-4.134916, -3, -6.167797, 0, 1.5, 0.5, 0.5,
-4.134916, -2, -6.167797, 0, -0.5, 0.5, 0.5,
-4.134916, -2, -6.167797, 1, -0.5, 0.5, 0.5,
-4.134916, -2, -6.167797, 1, 1.5, 0.5, 0.5,
-4.134916, -2, -6.167797, 0, 1.5, 0.5, 0.5,
-4.134916, -1, -6.167797, 0, -0.5, 0.5, 0.5,
-4.134916, -1, -6.167797, 1, -0.5, 0.5, 0.5,
-4.134916, -1, -6.167797, 1, 1.5, 0.5, 0.5,
-4.134916, -1, -6.167797, 0, 1.5, 0.5, 0.5,
-4.134916, 0, -6.167797, 0, -0.5, 0.5, 0.5,
-4.134916, 0, -6.167797, 1, -0.5, 0.5, 0.5,
-4.134916, 0, -6.167797, 1, 1.5, 0.5, 0.5,
-4.134916, 0, -6.167797, 0, 1.5, 0.5, 0.5,
-4.134916, 1, -6.167797, 0, -0.5, 0.5, 0.5,
-4.134916, 1, -6.167797, 1, -0.5, 0.5, 0.5,
-4.134916, 1, -6.167797, 1, 1.5, 0.5, 0.5,
-4.134916, 1, -6.167797, 0, 1.5, 0.5, 0.5,
-4.134916, 2, -6.167797, 0, -0.5, 0.5, 0.5,
-4.134916, 2, -6.167797, 1, -0.5, 0.5, 0.5,
-4.134916, 2, -6.167797, 1, 1.5, 0.5, 0.5,
-4.134916, 2, -6.167797, 0, 1.5, 0.5, 0.5
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
-3.630671, -3.356669, -4,
-3.630671, -3.356669, 4,
-3.630671, -3.356669, -4,
-3.798752, -3.517825, -4,
-3.630671, -3.356669, -2,
-3.798752, -3.517825, -2,
-3.630671, -3.356669, 0,
-3.798752, -3.517825, 0,
-3.630671, -3.356669, 2,
-3.798752, -3.517825, 2,
-3.630671, -3.356669, 4,
-3.798752, -3.517825, 4
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
-4.134916, -3.840138, -4, 0, -0.5, 0.5, 0.5,
-4.134916, -3.840138, -4, 1, -0.5, 0.5, 0.5,
-4.134916, -3.840138, -4, 1, 1.5, 0.5, 0.5,
-4.134916, -3.840138, -4, 0, 1.5, 0.5, 0.5,
-4.134916, -3.840138, -2, 0, -0.5, 0.5, 0.5,
-4.134916, -3.840138, -2, 1, -0.5, 0.5, 0.5,
-4.134916, -3.840138, -2, 1, 1.5, 0.5, 0.5,
-4.134916, -3.840138, -2, 0, 1.5, 0.5, 0.5,
-4.134916, -3.840138, 0, 0, -0.5, 0.5, 0.5,
-4.134916, -3.840138, 0, 1, -0.5, 0.5, 0.5,
-4.134916, -3.840138, 0, 1, 1.5, 0.5, 0.5,
-4.134916, -3.840138, 0, 0, 1.5, 0.5, 0.5,
-4.134916, -3.840138, 2, 0, -0.5, 0.5, 0.5,
-4.134916, -3.840138, 2, 1, -0.5, 0.5, 0.5,
-4.134916, -3.840138, 2, 1, 1.5, 0.5, 0.5,
-4.134916, -3.840138, 2, 0, 1.5, 0.5, 0.5,
-4.134916, -3.840138, 4, 0, -0.5, 0.5, 0.5,
-4.134916, -3.840138, 4, 1, -0.5, 0.5, 0.5,
-4.134916, -3.840138, 4, 1, 1.5, 0.5, 0.5,
-4.134916, -3.840138, 4, 0, 1.5, 0.5, 0.5
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
-3.630671, -3.356669, -5.36275,
-3.630671, 3.089586, -5.36275,
-3.630671, -3.356669, 5.371204,
-3.630671, 3.089586, 5.371204,
-3.630671, -3.356669, -5.36275,
-3.630671, -3.356669, 5.371204,
-3.630671, 3.089586, -5.36275,
-3.630671, 3.089586, 5.371204,
-3.630671, -3.356669, -5.36275,
3.092597, -3.356669, -5.36275,
-3.630671, -3.356669, 5.371204,
3.092597, -3.356669, 5.371204,
-3.630671, 3.089586, -5.36275,
3.092597, 3.089586, -5.36275,
-3.630671, 3.089586, 5.371204,
3.092597, 3.089586, 5.371204,
3.092597, -3.356669, -5.36275,
3.092597, 3.089586, -5.36275,
3.092597, -3.356669, 5.371204,
3.092597, 3.089586, 5.371204,
3.092597, -3.356669, -5.36275,
3.092597, -3.356669, 5.371204,
3.092597, 3.089586, -5.36275,
3.092597, 3.089586, 5.371204
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
var radius = 7.588807;
var distance = 33.76346;
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
mvMatrix.translate( 0.2690369, 0.1335415, -0.004227161 );
mvMatrix.scale( 1.220414, 1.272858, 0.7644123 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76346);
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
quinalphos<-read.table("quinalphos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinalphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinalphos' not found
```

```r
y<-quinalphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinalphos' not found
```

```r
z<-quinalphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinalphos' not found
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
-3.532759, 1.464479, -0.4374563, 0, 0, 1, 1, 1,
-3.041604, 1.680841, 1.61841, 1, 0, 0, 1, 1,
-2.744118, -0.3896731, -2.401268, 1, 0, 0, 1, 1,
-2.726865, -0.533308, -0.7017714, 1, 0, 0, 1, 1,
-2.582802, -1.056476, -1.173972, 1, 0, 0, 1, 1,
-2.458402, 0.2116655, -0.1782234, 1, 0, 0, 1, 1,
-2.390817, -0.3523939, -1.792729, 0, 0, 0, 1, 1,
-2.26475, 1.020366, 0.2709291, 0, 0, 0, 1, 1,
-2.264731, 1.391659, -0.910475, 0, 0, 0, 1, 1,
-2.230428, 0.04384879, -1.197867, 0, 0, 0, 1, 1,
-2.145673, -1.790713, -2.037399, 0, 0, 0, 1, 1,
-2.12316, -0.08203082, -2.428235, 0, 0, 0, 1, 1,
-2.10137, -1.005373, -1.871199, 0, 0, 0, 1, 1,
-2.051769, -0.1202517, -2.248574, 1, 1, 1, 1, 1,
-1.995827, -0.2579978, -0.8389552, 1, 1, 1, 1, 1,
-1.983696, 1.020188, -2.232827, 1, 1, 1, 1, 1,
-1.982413, -0.3217518, -2.278479, 1, 1, 1, 1, 1,
-1.973499, -0.9795723, -2.197374, 1, 1, 1, 1, 1,
-1.931249, 2.275936, -0.8232407, 1, 1, 1, 1, 1,
-1.909321, 0.3090917, -1.855534, 1, 1, 1, 1, 1,
-1.887973, 0.7574978, -2.128733, 1, 1, 1, 1, 1,
-1.867337, -1.266479, -1.897297, 1, 1, 1, 1, 1,
-1.861571, -0.4814022, -2.587017, 1, 1, 1, 1, 1,
-1.851206, -0.1579947, -1.706443, 1, 1, 1, 1, 1,
-1.849028, 0.215102, -1.79527, 1, 1, 1, 1, 1,
-1.836324, -1.10026, -3.461686, 1, 1, 1, 1, 1,
-1.810538, 0.4067264, -0.8259593, 1, 1, 1, 1, 1,
-1.803845, -0.9888661, -1.881949, 1, 1, 1, 1, 1,
-1.779151, -2.416621, -2.044141, 0, 0, 1, 1, 1,
-1.771222, -0.1941078, -2.655258, 1, 0, 0, 1, 1,
-1.769266, -0.8557585, -3.037546, 1, 0, 0, 1, 1,
-1.759084, 1.116339, -1.836821, 1, 0, 0, 1, 1,
-1.728668, 0.4702235, -0.9978977, 1, 0, 0, 1, 1,
-1.719429, -0.5771277, -1.555582, 1, 0, 0, 1, 1,
-1.7126, -0.5708316, -1.720414, 0, 0, 0, 1, 1,
-1.711351, 1.611723, -0.5822967, 0, 0, 0, 1, 1,
-1.656987, -0.813945, -1.153721, 0, 0, 0, 1, 1,
-1.649472, -0.8065419, -1.634498, 0, 0, 0, 1, 1,
-1.631084, -2.131409, -2.051936, 0, 0, 0, 1, 1,
-1.614675, 0.3170646, -2.119772, 0, 0, 0, 1, 1,
-1.600653, -0.1471169, -1.570842, 0, 0, 0, 1, 1,
-1.599489, -0.2452762, -2.799512, 1, 1, 1, 1, 1,
-1.593578, -0.559259, -1.948904, 1, 1, 1, 1, 1,
-1.583744, 0.1580585, -0.4850466, 1, 1, 1, 1, 1,
-1.582997, -1.037755, -1.351878, 1, 1, 1, 1, 1,
-1.56737, -0.8390636, -2.762065, 1, 1, 1, 1, 1,
-1.558535, -1.809407, -3.094487, 1, 1, 1, 1, 1,
-1.545771, -0.3666633, 0.1533302, 1, 1, 1, 1, 1,
-1.545086, 0.2050514, -0.3166012, 1, 1, 1, 1, 1,
-1.534317, -0.4310146, -2.394427, 1, 1, 1, 1, 1,
-1.530714, 0.6409152, -1.684572, 1, 1, 1, 1, 1,
-1.525711, 0.3307061, -1.492141, 1, 1, 1, 1, 1,
-1.522672, 1.296198, 0.340245, 1, 1, 1, 1, 1,
-1.522159, -0.028154, -1.29809, 1, 1, 1, 1, 1,
-1.503005, 0.8088784, -1.133138, 1, 1, 1, 1, 1,
-1.498819, -1.373233, -2.943603, 1, 1, 1, 1, 1,
-1.497284, 1.014359, -1.120446, 0, 0, 1, 1, 1,
-1.497021, 0.9215783, 0.9288006, 1, 0, 0, 1, 1,
-1.471099, 0.4160847, -1.180768, 1, 0, 0, 1, 1,
-1.469329, 1.059685, -0.7243619, 1, 0, 0, 1, 1,
-1.462147, -0.2069006, -1.6729, 1, 0, 0, 1, 1,
-1.451155, 0.7045617, -1.753742, 1, 0, 0, 1, 1,
-1.433319, -2.543169, -2.795967, 0, 0, 0, 1, 1,
-1.433133, 0.01490036, -0.2666816, 0, 0, 0, 1, 1,
-1.430128, 0.1882974, -2.258189, 0, 0, 0, 1, 1,
-1.413778, 0.3092272, -0.6553534, 0, 0, 0, 1, 1,
-1.409143, -1.358401, -2.48912, 0, 0, 0, 1, 1,
-1.402591, -0.5024003, -3.808923, 0, 0, 0, 1, 1,
-1.39713, 0.7199807, -0.2660959, 0, 0, 0, 1, 1,
-1.391852, 2.524943, -1.287185, 1, 1, 1, 1, 1,
-1.387532, 0.6707171, -3.489712, 1, 1, 1, 1, 1,
-1.382127, -0.2456145, -3.039295, 1, 1, 1, 1, 1,
-1.381212, 1.394499, 0.7438167, 1, 1, 1, 1, 1,
-1.377371, 0.1912927, -2.245987, 1, 1, 1, 1, 1,
-1.377156, -1.257233, -1.027132, 1, 1, 1, 1, 1,
-1.375899, -1.272825, -2.127121, 1, 1, 1, 1, 1,
-1.372975, -0.01292822, -1.053347, 1, 1, 1, 1, 1,
-1.370088, 0.1798153, -1.795948, 1, 1, 1, 1, 1,
-1.350892, 0.4820106, -0.2226062, 1, 1, 1, 1, 1,
-1.34806, -1.815957, -2.986863, 1, 1, 1, 1, 1,
-1.347779, 2.447262, -1.480622, 1, 1, 1, 1, 1,
-1.344812, -1.206535, -2.371989, 1, 1, 1, 1, 1,
-1.340583, -1.369343, -2.768133, 1, 1, 1, 1, 1,
-1.331094, 0.843012, -1.321871, 1, 1, 1, 1, 1,
-1.323416, 1.207988, -1.43575, 0, 0, 1, 1, 1,
-1.318762, -1.079652, -1.697054, 1, 0, 0, 1, 1,
-1.313561, -0.4393697, -1.586385, 1, 0, 0, 1, 1,
-1.305139, -1.404163, -1.802048, 1, 0, 0, 1, 1,
-1.299819, 0.7473794, -1.823071, 1, 0, 0, 1, 1,
-1.299124, 1.136386, -0.9242065, 1, 0, 0, 1, 1,
-1.296543, 0.6826108, 0.0724219, 0, 0, 0, 1, 1,
-1.292833, -1.228195, -4.171147, 0, 0, 0, 1, 1,
-1.292457, -2.703352, -3.777041, 0, 0, 0, 1, 1,
-1.288556, -1.00046, -3.371105, 0, 0, 0, 1, 1,
-1.257145, 0.2627719, -2.289926, 0, 0, 0, 1, 1,
-1.247167, 1.402991, -1.292303, 0, 0, 0, 1, 1,
-1.24604, -1.942852, -2.277554, 0, 0, 0, 1, 1,
-1.242345, -1.148876, -2.67425, 1, 1, 1, 1, 1,
-1.239548, 0.2516508, -0.146873, 1, 1, 1, 1, 1,
-1.232792, -0.07227891, -2.314734, 1, 1, 1, 1, 1,
-1.222196, -3.042806, -3.303014, 1, 1, 1, 1, 1,
-1.211238, 0.7929005, 0.3051948, 1, 1, 1, 1, 1,
-1.210722, 0.06529243, -1.544714, 1, 1, 1, 1, 1,
-1.210043, -0.1577766, -0.7878593, 1, 1, 1, 1, 1,
-1.20373, 0.1478809, -0.9449988, 1, 1, 1, 1, 1,
-1.20328, -0.3825197, -3.049408, 1, 1, 1, 1, 1,
-1.202646, -0.8733926, -3.030513, 1, 1, 1, 1, 1,
-1.186625, -0.6893613, -4.561422, 1, 1, 1, 1, 1,
-1.183638, -1.608303, -2.019188, 1, 1, 1, 1, 1,
-1.17723, -0.6280242, -2.310397, 1, 1, 1, 1, 1,
-1.177112, 0.8024906, -1.963965, 1, 1, 1, 1, 1,
-1.170025, 0.5170446, 0.2414007, 1, 1, 1, 1, 1,
-1.158232, 1.79991, -1.173133, 0, 0, 1, 1, 1,
-1.155135, -0.3275453, -0.7591706, 1, 0, 0, 1, 1,
-1.154806, 0.8807064, -1.558057, 1, 0, 0, 1, 1,
-1.150526, 0.3447234, -0.1987474, 1, 0, 0, 1, 1,
-1.149833, 2.010182, -1.578528, 1, 0, 0, 1, 1,
-1.148914, -0.2554159, -1.708707, 1, 0, 0, 1, 1,
-1.144077, -0.3161516, -3.403014, 0, 0, 0, 1, 1,
-1.139696, -1.291651, -3.212184, 0, 0, 0, 1, 1,
-1.130333, -1.408942, -3.656734, 0, 0, 0, 1, 1,
-1.125736, 1.731327, -1.162398, 0, 0, 0, 1, 1,
-1.122686, 1.590952, 0.9847923, 0, 0, 0, 1, 1,
-1.119131, 0.583071, -2.27966, 0, 0, 0, 1, 1,
-1.115945, -1.003893, -3.084389, 0, 0, 0, 1, 1,
-1.112517, 0.1934737, -2.652234, 1, 1, 1, 1, 1,
-1.111357, 0.8721579, -1.4517, 1, 1, 1, 1, 1,
-1.110097, 0.5647123, -0.483243, 1, 1, 1, 1, 1,
-1.098347, 0.5513353, -0.243546, 1, 1, 1, 1, 1,
-1.095883, 1.865737, -0.6991979, 1, 1, 1, 1, 1,
-1.088602, 0.5307839, -1.734188, 1, 1, 1, 1, 1,
-1.082986, 0.4514638, -1.608746, 1, 1, 1, 1, 1,
-1.077491, -1.067716, -0.500907, 1, 1, 1, 1, 1,
-1.071836, -0.2960989, 1.057958, 1, 1, 1, 1, 1,
-1.068984, -0.8323929, -0.7247832, 1, 1, 1, 1, 1,
-1.066479, -1.915901, -1.766636, 1, 1, 1, 1, 1,
-1.064226, -0.6078029, -2.406582, 1, 1, 1, 1, 1,
-1.063866, -0.4261104, -3.285593, 1, 1, 1, 1, 1,
-1.05965, 1.200879, 0.6072549, 1, 1, 1, 1, 1,
-1.051698, 1.610748, -1.679608, 1, 1, 1, 1, 1,
-1.050082, -1.967994, -1.16813, 0, 0, 1, 1, 1,
-1.048416, 0.3336505, -3.381222, 1, 0, 0, 1, 1,
-1.046958, 1.017848, 0.2330146, 1, 0, 0, 1, 1,
-1.04613, -1.156432, -2.170869, 1, 0, 0, 1, 1,
-1.041663, 1.014265, -0.3536424, 1, 0, 0, 1, 1,
-1.031675, 1.48841, 0.6075282, 1, 0, 0, 1, 1,
-1.029898, 1.3198, 0.6874456, 0, 0, 0, 1, 1,
-1.021239, -0.04625755, -0.8985407, 0, 0, 0, 1, 1,
-1.02012, 0.8720276, -0.05741724, 0, 0, 0, 1, 1,
-1.017149, -0.9188946, -2.079006, 0, 0, 0, 1, 1,
-1.015276, -0.1630898, -2.174714, 0, 0, 0, 1, 1,
-1.015162, -1.64929, -1.986695, 0, 0, 0, 1, 1,
-1.013511, 1.168946, -1.653953, 0, 0, 0, 1, 1,
-1.011319, -1.506641, -2.388997, 1, 1, 1, 1, 1,
-1.010296, 0.2329359, 0.5159485, 1, 1, 1, 1, 1,
-1.010296, -1.572147, -2.059633, 1, 1, 1, 1, 1,
-1.009502, 0.9276367, -1.557108, 1, 1, 1, 1, 1,
-1.000827, -0.2999774, -2.569632, 1, 1, 1, 1, 1,
-0.9989846, -0.4323649, -3.300506, 1, 1, 1, 1, 1,
-0.9986247, 0.6712243, -0.4679437, 1, 1, 1, 1, 1,
-0.9950073, -0.6546916, -2.894241, 1, 1, 1, 1, 1,
-0.9808731, -1.509454, -1.385201, 1, 1, 1, 1, 1,
-0.9790008, -0.1628126, -1.144138, 1, 1, 1, 1, 1,
-0.9725092, 1.238497, -0.0005594782, 1, 1, 1, 1, 1,
-0.9646224, -0.3981432, -3.347912, 1, 1, 1, 1, 1,
-0.962371, 0.6917143, -3.16401, 1, 1, 1, 1, 1,
-0.9569083, 1.088318, -2.34499, 1, 1, 1, 1, 1,
-0.9496947, -0.9953337, -2.581444, 1, 1, 1, 1, 1,
-0.9462502, 0.8514333, -1.884907, 0, 0, 1, 1, 1,
-0.9314951, 1.226677, -0.8669755, 1, 0, 0, 1, 1,
-0.9278808, -0.3203846, -2.012063, 1, 0, 0, 1, 1,
-0.9237415, -0.4235006, -3.08451, 1, 0, 0, 1, 1,
-0.9196086, -1.92869, -2.038749, 1, 0, 0, 1, 1,
-0.9191283, 1.38434, -0.03279309, 1, 0, 0, 1, 1,
-0.9179363, -0.3200252, -2.670838, 0, 0, 0, 1, 1,
-0.9086691, 0.5184088, -1.546299, 0, 0, 0, 1, 1,
-0.9039731, 0.3880362, 0.5983512, 0, 0, 0, 1, 1,
-0.9027506, 0.9879889, 1.214779, 0, 0, 0, 1, 1,
-0.9027272, 0.5827699, -1.55047, 0, 0, 0, 1, 1,
-0.8983252, 0.5042778, 0.412248, 0, 0, 0, 1, 1,
-0.8951198, 1.765339, 1.131309, 0, 0, 0, 1, 1,
-0.8937869, -0.9423602, -2.639053, 1, 1, 1, 1, 1,
-0.8928499, 1.071612, -0.1767626, 1, 1, 1, 1, 1,
-0.8912573, 0.2702249, -0.8241244, 1, 1, 1, 1, 1,
-0.8896492, 0.5576842, 0.4988817, 1, 1, 1, 1, 1,
-0.8801801, 0.567304, -0.3120158, 1, 1, 1, 1, 1,
-0.8735207, -0.6339501, -2.195351, 1, 1, 1, 1, 1,
-0.8733098, 0.4175225, -0.2306941, 1, 1, 1, 1, 1,
-0.8673538, 0.03703488, -2.876714, 1, 1, 1, 1, 1,
-0.866598, -0.8103012, -2.522378, 1, 1, 1, 1, 1,
-0.8612696, -2.216139, -2.033574, 1, 1, 1, 1, 1,
-0.8611355, -2.002461, -2.789137, 1, 1, 1, 1, 1,
-0.8593352, -1.501571, -2.270298, 1, 1, 1, 1, 1,
-0.8568071, 0.1803272, -1.669223, 1, 1, 1, 1, 1,
-0.8502874, -1.392813, -2.940147, 1, 1, 1, 1, 1,
-0.8499672, -0.05963178, -1.829618, 1, 1, 1, 1, 1,
-0.8498875, -1.683236, -3.71143, 0, 0, 1, 1, 1,
-0.8491486, 0.3075091, -1.544008, 1, 0, 0, 1, 1,
-0.8485203, -1.038354, -2.16593, 1, 0, 0, 1, 1,
-0.8454991, -1.603207, -2.725599, 1, 0, 0, 1, 1,
-0.8452938, -1.505597, -2.577123, 1, 0, 0, 1, 1,
-0.8452054, 1.044647, -2.387069, 1, 0, 0, 1, 1,
-0.844904, -0.09686375, -0.8918963, 0, 0, 0, 1, 1,
-0.8438177, -0.6232697, -0.5834967, 0, 0, 0, 1, 1,
-0.8411816, -0.08860167, -1.944622, 0, 0, 0, 1, 1,
-0.8400649, 1.463961, -2.076667, 0, 0, 0, 1, 1,
-0.8396015, 1.003626, -0.5057731, 0, 0, 0, 1, 1,
-0.8354201, -0.1244748, -1.869129, 0, 0, 0, 1, 1,
-0.8338448, -0.5119247, -3.40148, 0, 0, 0, 1, 1,
-0.832605, 0.1023983, -2.161033, 1, 1, 1, 1, 1,
-0.8307953, -0.6662492, -1.38571, 1, 1, 1, 1, 1,
-0.825801, 1.117167, 1.11659, 1, 1, 1, 1, 1,
-0.8241007, -0.194623, -2.420317, 1, 1, 1, 1, 1,
-0.8198361, -1.464452, -3.842543, 1, 1, 1, 1, 1,
-0.8194739, -0.1457999, -0.6893716, 1, 1, 1, 1, 1,
-0.8174232, -0.2620934, -3.430037, 1, 1, 1, 1, 1,
-0.8136573, -0.9468182, -3.024489, 1, 1, 1, 1, 1,
-0.8086397, -0.8626949, -0.5014495, 1, 1, 1, 1, 1,
-0.8076416, 1.713578, -1.894493, 1, 1, 1, 1, 1,
-0.79682, -1.021325, -2.353308, 1, 1, 1, 1, 1,
-0.7854842, 0.09527354, -0.103192, 1, 1, 1, 1, 1,
-0.7842647, -1.064967, -4.367509, 1, 1, 1, 1, 1,
-0.7813835, -0.3676312, -1.668066, 1, 1, 1, 1, 1,
-0.779689, -0.2524949, -0.8992692, 1, 1, 1, 1, 1,
-0.7795556, -1.651754, -4.1667, 0, 0, 1, 1, 1,
-0.7777808, -0.6207942, -2.340943, 1, 0, 0, 1, 1,
-0.7745748, -0.2204876, -1.808196, 1, 0, 0, 1, 1,
-0.7725429, 0.4317394, -0.8225788, 1, 0, 0, 1, 1,
-0.770764, 0.7315389, -0.4026169, 1, 0, 0, 1, 1,
-0.7687007, 0.1546395, -1.629858, 1, 0, 0, 1, 1,
-0.7681692, -0.2513375, -0.7977317, 0, 0, 0, 1, 1,
-0.768037, 0.5482205, -0.5821469, 0, 0, 0, 1, 1,
-0.7661974, 0.4386915, -1.26418, 0, 0, 0, 1, 1,
-0.7656353, 0.5041327, -1.798633, 0, 0, 0, 1, 1,
-0.7628968, -0.8442758, -1.77911, 0, 0, 0, 1, 1,
-0.7563488, 0.1957557, -1.400149, 0, 0, 0, 1, 1,
-0.7560971, -0.2446389, -2.549161, 0, 0, 0, 1, 1,
-0.750097, -0.3046746, -1.09388, 1, 1, 1, 1, 1,
-0.7443008, 0.3894684, -0.3850169, 1, 1, 1, 1, 1,
-0.7422436, 0.881836, -0.3214335, 1, 1, 1, 1, 1,
-0.7409997, -1.012028, -3.569222, 1, 1, 1, 1, 1,
-0.7381049, -0.1277664, -1.497842, 1, 1, 1, 1, 1,
-0.7353235, -0.9699589, -2.334337, 1, 1, 1, 1, 1,
-0.7302101, 2.319282, 0.6020909, 1, 1, 1, 1, 1,
-0.7288586, -0.1863117, -2.981356, 1, 1, 1, 1, 1,
-0.7224811, -0.1493211, -3.61065, 1, 1, 1, 1, 1,
-0.7219388, -0.2021549, -2.653203, 1, 1, 1, 1, 1,
-0.717277, 0.1855921, -0.8769878, 1, 1, 1, 1, 1,
-0.7136976, 0.7559201, -0.7867992, 1, 1, 1, 1, 1,
-0.7131502, -0.2844008, -2.350298, 1, 1, 1, 1, 1,
-0.7114215, 0.1953651, -2.323592, 1, 1, 1, 1, 1,
-0.7089439, -1.892925, -1.674012, 1, 1, 1, 1, 1,
-0.708637, -2.082823, -2.343942, 0, 0, 1, 1, 1,
-0.6934798, 0.5552984, -2.516493, 1, 0, 0, 1, 1,
-0.6845729, -0.1914616, 0.530349, 1, 0, 0, 1, 1,
-0.6791452, 0.5374095, -0.585281, 1, 0, 0, 1, 1,
-0.6768047, 0.08973324, -0.3982675, 1, 0, 0, 1, 1,
-0.6721026, -0.08338276, -1.425461, 1, 0, 0, 1, 1,
-0.6680762, 0.6403399, 0.07085838, 0, 0, 0, 1, 1,
-0.6670995, 0.4432898, 0.5917556, 0, 0, 0, 1, 1,
-0.6666353, 0.3799908, -1.235787, 0, 0, 0, 1, 1,
-0.6651746, 0.4099894, -0.7414827, 0, 0, 0, 1, 1,
-0.6644444, 0.6447858, -0.2738284, 0, 0, 0, 1, 1,
-0.6624886, 2.274334, -2.030079, 0, 0, 0, 1, 1,
-0.6611901, -0.03222404, 1.142911, 0, 0, 0, 1, 1,
-0.659912, 0.3350016, -0.1494811, 1, 1, 1, 1, 1,
-0.655735, 1.545893, 0.03647019, 1, 1, 1, 1, 1,
-0.6549457, 0.1083734, -1.36108, 1, 1, 1, 1, 1,
-0.6522264, 0.4737462, -0.6641593, 1, 1, 1, 1, 1,
-0.6514509, 0.1622561, -1.762527, 1, 1, 1, 1, 1,
-0.650034, 0.8731558, -0.9517177, 1, 1, 1, 1, 1,
-0.648788, 0.7376219, 0.3792484, 1, 1, 1, 1, 1,
-0.6472415, -1.453456, -2.722384, 1, 1, 1, 1, 1,
-0.6468104, -0.4738381, -0.5728086, 1, 1, 1, 1, 1,
-0.6261364, -0.189332, -1.17625, 1, 1, 1, 1, 1,
-0.6242264, -0.08291992, -0.3672063, 1, 1, 1, 1, 1,
-0.6239498, -0.954438, -3.335651, 1, 1, 1, 1, 1,
-0.6214538, 0.1821366, -1.131652, 1, 1, 1, 1, 1,
-0.6203594, 0.8629827, -0.1480841, 1, 1, 1, 1, 1,
-0.616689, 1.077005, -0.5412068, 1, 1, 1, 1, 1,
-0.6131738, -0.2039527, -2.670449, 0, 0, 1, 1, 1,
-0.6105289, 0.4983402, -1.065947, 1, 0, 0, 1, 1,
-0.6097431, -0.5931478, -2.245365, 1, 0, 0, 1, 1,
-0.6093821, 0.678056, -1.987761, 1, 0, 0, 1, 1,
-0.6009367, -0.3842345, -1.666701, 1, 0, 0, 1, 1,
-0.5974572, -0.1825032, -1.392004, 1, 0, 0, 1, 1,
-0.5942719, -1.321212, -2.114487, 0, 0, 0, 1, 1,
-0.587333, 0.05685248, -2.223297, 0, 0, 0, 1, 1,
-0.5855151, 0.6496112, -1.758232, 0, 0, 0, 1, 1,
-0.5830503, 0.2602838, 1.574342, 0, 0, 0, 1, 1,
-0.58216, 0.02701523, -3.243197, 0, 0, 0, 1, 1,
-0.581392, 0.6372598, -1.794424, 0, 0, 0, 1, 1,
-0.5771728, 0.2003923, -2.577607, 0, 0, 0, 1, 1,
-0.5771613, -0.898707, -2.236951, 1, 1, 1, 1, 1,
-0.5767918, -0.01112648, -1.746042, 1, 1, 1, 1, 1,
-0.5743165, -1.986357, -2.058756, 1, 1, 1, 1, 1,
-0.5737184, 0.4905604, -0.8624778, 1, 1, 1, 1, 1,
-0.564562, -1.397304, -1.780918, 1, 1, 1, 1, 1,
-0.5569264, 0.5466366, -1.960675, 1, 1, 1, 1, 1,
-0.5546508, -0.266984, -2.474191, 1, 1, 1, 1, 1,
-0.5546352, 1.461041, 1.631973, 1, 1, 1, 1, 1,
-0.5530849, 0.2724437, -1.122451, 1, 1, 1, 1, 1,
-0.5515953, -1.025653, -3.297594, 1, 1, 1, 1, 1,
-0.5500172, 0.001130237, -1.010553, 1, 1, 1, 1, 1,
-0.5476524, 0.8409608, 0.2051413, 1, 1, 1, 1, 1,
-0.5408618, -0.964702, -2.405189, 1, 1, 1, 1, 1,
-0.5393249, 2.068425, -1.129662, 1, 1, 1, 1, 1,
-0.5383908, 0.6711355, -0.1477156, 1, 1, 1, 1, 1,
-0.5355922, -1.667445, -2.807441, 0, 0, 1, 1, 1,
-0.5288167, -0.4741775, -1.260192, 1, 0, 0, 1, 1,
-0.5259625, 2.185361, 2.549856, 1, 0, 0, 1, 1,
-0.5224268, -1.609578, -1.429039, 1, 0, 0, 1, 1,
-0.5204448, 0.3142417, -1.378078, 1, 0, 0, 1, 1,
-0.5179311, -0.6845453, -2.084726, 1, 0, 0, 1, 1,
-0.5173199, -0.1723706, -1.631167, 0, 0, 0, 1, 1,
-0.5169923, 0.3374559, -1.065815, 0, 0, 0, 1, 1,
-0.5102338, 0.5648654, -1.572378, 0, 0, 0, 1, 1,
-0.5027949, 1.207074, 0.5449055, 0, 0, 0, 1, 1,
-0.4973098, 1.163709, -1.901163, 0, 0, 0, 1, 1,
-0.4960122, -0.6974356, -4.004915, 0, 0, 0, 1, 1,
-0.4947413, 0.01161185, -1.405893, 0, 0, 0, 1, 1,
-0.4944588, 0.9684326, -1.013762, 1, 1, 1, 1, 1,
-0.4912944, -0.647716, -3.615366, 1, 1, 1, 1, 1,
-0.4847519, -1.139856, -3.017687, 1, 1, 1, 1, 1,
-0.481741, 0.02614984, -3.290065, 1, 1, 1, 1, 1,
-0.4804556, -0.9391983, -3.30553, 1, 1, 1, 1, 1,
-0.4787267, 1.525727, -2.209576, 1, 1, 1, 1, 1,
-0.4715366, -0.0258962, -1.829179, 1, 1, 1, 1, 1,
-0.4714453, 0.5515122, -1.561462, 1, 1, 1, 1, 1,
-0.4690515, 0.07659334, -0.6010676, 1, 1, 1, 1, 1,
-0.4659901, -1.080897, -1.342177, 1, 1, 1, 1, 1,
-0.4657656, 0.3838399, -2.218472, 1, 1, 1, 1, 1,
-0.4624667, -0.2022163, -1.948607, 1, 1, 1, 1, 1,
-0.4596899, 0.6166107, 0.8349739, 1, 1, 1, 1, 1,
-0.4536191, 0.2094713, -0.3688791, 1, 1, 1, 1, 1,
-0.4525248, -0.7018532, -2.202205, 1, 1, 1, 1, 1,
-0.4522727, 0.3498253, -0.3226979, 0, 0, 1, 1, 1,
-0.4520814, 0.9780508, 0.0308607, 1, 0, 0, 1, 1,
-0.4498328, -0.0846414, -1.365972, 1, 0, 0, 1, 1,
-0.448113, 1.235436, -0.9019726, 1, 0, 0, 1, 1,
-0.4446063, 1.510086, 0.4171528, 1, 0, 0, 1, 1,
-0.4432217, 0.668596, 0.6397102, 1, 0, 0, 1, 1,
-0.4423878, 0.7941252, 0.8575774, 0, 0, 0, 1, 1,
-0.4417669, 1.005297, -1.857373, 0, 0, 0, 1, 1,
-0.4326729, -0.9458166, -0.9620267, 0, 0, 0, 1, 1,
-0.4323854, 0.03742145, -0.7989035, 0, 0, 0, 1, 1,
-0.4312079, -0.4859515, -1.889634, 0, 0, 0, 1, 1,
-0.4308364, 0.6881336, -0.3525346, 0, 0, 0, 1, 1,
-0.4307331, 1.792723, -3.199991, 0, 0, 0, 1, 1,
-0.4254749, -0.898912, -2.528978, 1, 1, 1, 1, 1,
-0.4220092, -0.05993823, -0.5672711, 1, 1, 1, 1, 1,
-0.4162225, 1.047619, 0.9889238, 1, 1, 1, 1, 1,
-0.4156041, -0.003476621, -2.248689, 1, 1, 1, 1, 1,
-0.4097131, 0.155019, -0.478424, 1, 1, 1, 1, 1,
-0.4090433, -0.9318495, -3.427643, 1, 1, 1, 1, 1,
-0.4067801, -0.3263834, -1.207683, 1, 1, 1, 1, 1,
-0.3987335, 1.256658, -0.5664089, 1, 1, 1, 1, 1,
-0.3969269, 0.9752089, -1.298685, 1, 1, 1, 1, 1,
-0.3959589, 0.2675588, 1.450629, 1, 1, 1, 1, 1,
-0.3914007, -1.637851, -3.180095, 1, 1, 1, 1, 1,
-0.3886237, 0.2880924, -0.8405172, 1, 1, 1, 1, 1,
-0.3885284, 0.6696787, -0.5033724, 1, 1, 1, 1, 1,
-0.3879392, 0.8954191, -0.80433, 1, 1, 1, 1, 1,
-0.3870763, -0.1020247, -2.322996, 1, 1, 1, 1, 1,
-0.3864946, -1.530873, -2.193632, 0, 0, 1, 1, 1,
-0.3829106, -0.7168303, -3.984425, 1, 0, 0, 1, 1,
-0.3820258, -0.9898568, -1.068351, 1, 0, 0, 1, 1,
-0.380503, 0.009521671, -1.482563, 1, 0, 0, 1, 1,
-0.3802531, 0.05946663, -2.198722, 1, 0, 0, 1, 1,
-0.3771093, -0.4419677, -2.447804, 1, 0, 0, 1, 1,
-0.3757305, -0.2643143, -2.721732, 0, 0, 0, 1, 1,
-0.3741479, -0.9683492, -0.7434035, 0, 0, 0, 1, 1,
-0.3722323, 0.2102062, -1.58598, 0, 0, 0, 1, 1,
-0.3720991, -0.5659807, -3.814765, 0, 0, 0, 1, 1,
-0.3648621, 0.7260696, 0.2379752, 0, 0, 0, 1, 1,
-0.3614242, -0.3110427, -2.442036, 0, 0, 0, 1, 1,
-0.360443, 0.9310869, -0.3342186, 0, 0, 0, 1, 1,
-0.3574816, -1.022603, -2.887306, 1, 1, 1, 1, 1,
-0.3530895, 0.07203746, -1.70851, 1, 1, 1, 1, 1,
-0.3530849, -0.215413, -1.368824, 1, 1, 1, 1, 1,
-0.3530111, 0.5961189, -1.014421, 1, 1, 1, 1, 1,
-0.3486001, -1.137795, -2.636278, 1, 1, 1, 1, 1,
-0.3481326, 1.335571, 0.2656744, 1, 1, 1, 1, 1,
-0.3470318, 0.5972951, 1.139334, 1, 1, 1, 1, 1,
-0.3462936, 1.029935, -0.06381267, 1, 1, 1, 1, 1,
-0.3418207, 0.3114868, -2.24699, 1, 1, 1, 1, 1,
-0.3396733, 0.9746999, -1.072325, 1, 1, 1, 1, 1,
-0.3263294, -0.152981, -1.012703, 1, 1, 1, 1, 1,
-0.3194157, 0.4267572, -1.369507, 1, 1, 1, 1, 1,
-0.3171245, -1.541223, -3.440895, 1, 1, 1, 1, 1,
-0.3150239, 0.1516687, -2.39917, 1, 1, 1, 1, 1,
-0.312194, 0.7645764, -0.1101334, 1, 1, 1, 1, 1,
-0.3067516, 1.258925, 0.07396265, 0, 0, 1, 1, 1,
-0.3066492, 0.6315776, -0.7639483, 1, 0, 0, 1, 1,
-0.2972476, -0.7527517, -1.78732, 1, 0, 0, 1, 1,
-0.2948852, -0.415844, -1.829461, 1, 0, 0, 1, 1,
-0.2947682, -0.614621, -2.783581, 1, 0, 0, 1, 1,
-0.2940311, 0.7211844, -0.9652308, 1, 0, 0, 1, 1,
-0.2872285, 0.3548393, -0.9820328, 0, 0, 0, 1, 1,
-0.2848368, -0.8811134, -2.112853, 0, 0, 0, 1, 1,
-0.2809145, -0.8891671, -3.546915, 0, 0, 0, 1, 1,
-0.2756593, 1.003744, -0.3207239, 0, 0, 0, 1, 1,
-0.2754575, -0.1862833, -2.282759, 0, 0, 0, 1, 1,
-0.2707058, 1.184127, -0.1465551, 0, 0, 0, 1, 1,
-0.2702117, -0.3327148, -1.93269, 0, 0, 0, 1, 1,
-0.2666848, 0.1061216, -2.797975, 1, 1, 1, 1, 1,
-0.2633993, -1.107483, -2.28296, 1, 1, 1, 1, 1,
-0.2604314, 0.972078, -0.3646848, 1, 1, 1, 1, 1,
-0.2592097, 0.7258748, -0.3246562, 1, 1, 1, 1, 1,
-0.2580884, -1.193478, -4.021856, 1, 1, 1, 1, 1,
-0.2540676, 0.9377308, -0.554768, 1, 1, 1, 1, 1,
-0.253024, 0.2568818, -0.4446756, 1, 1, 1, 1, 1,
-0.2526094, 0.8766261, 0.7669, 1, 1, 1, 1, 1,
-0.2502286, 0.7841454, -0.8509071, 1, 1, 1, 1, 1,
-0.2499793, 0.8834871, -0.1879869, 1, 1, 1, 1, 1,
-0.2486564, 1.703506, 1.285927, 1, 1, 1, 1, 1,
-0.2480004, -0.702041, -2.296137, 1, 1, 1, 1, 1,
-0.2446809, -0.2743878, -2.451287, 1, 1, 1, 1, 1,
-0.2426757, -0.2816215, -0.4977744, 1, 1, 1, 1, 1,
-0.2412868, 0.3378744, -0.9809187, 1, 1, 1, 1, 1,
-0.2351173, -0.870624, -1.703098, 0, 0, 1, 1, 1,
-0.2349226, 1.157297, 0.2625331, 1, 0, 0, 1, 1,
-0.2341643, 0.4392863, -1.208874, 1, 0, 0, 1, 1,
-0.2340245, 0.7130972, 0.313847, 1, 0, 0, 1, 1,
-0.232772, 0.2541101, -0.2134891, 1, 0, 0, 1, 1,
-0.2319696, 0.3601046, -0.0779002, 1, 0, 0, 1, 1,
-0.2313989, 0.9306902, 0.6973612, 0, 0, 0, 1, 1,
-0.229408, 2.995708, 0.495159, 0, 0, 0, 1, 1,
-0.2284616, -0.2324644, -2.09393, 0, 0, 0, 1, 1,
-0.2258954, 1.587701, -0.0944327, 0, 0, 0, 1, 1,
-0.2255734, -0.3623236, -2.406822, 0, 0, 0, 1, 1,
-0.2209101, -1.636556, -1.324543, 0, 0, 0, 1, 1,
-0.2156281, -0.4922324, -4.161406, 0, 0, 0, 1, 1,
-0.2141731, 0.5505872, -0.857775, 1, 1, 1, 1, 1,
-0.2100943, 0.6438169, 0.5590166, 1, 1, 1, 1, 1,
-0.2082844, 0.4249077, -0.1053178, 1, 1, 1, 1, 1,
-0.2071146, -1.124137, -0.3446913, 1, 1, 1, 1, 1,
-0.2069471, 0.05341335, -2.615981, 1, 1, 1, 1, 1,
-0.2024332, 2.474947, 0.9709418, 1, 1, 1, 1, 1,
-0.1966546, 1.97683, 0.3397452, 1, 1, 1, 1, 1,
-0.1965348, -0.09709676, -3.428034, 1, 1, 1, 1, 1,
-0.1923464, 0.7812816, 1.115677, 1, 1, 1, 1, 1,
-0.1916735, -0.1998092, -2.832625, 1, 1, 1, 1, 1,
-0.1910278, -1.646427, -2.45248, 1, 1, 1, 1, 1,
-0.1892917, -0.9563749, -2.498047, 1, 1, 1, 1, 1,
-0.1887028, 1.819225, 0.4212855, 1, 1, 1, 1, 1,
-0.1881969, 1.086193, -0.3943863, 1, 1, 1, 1, 1,
-0.1859354, -0.4593593, -1.095091, 1, 1, 1, 1, 1,
-0.1851719, 1.182465, -0.3241313, 0, 0, 1, 1, 1,
-0.184286, -0.2001967, -3.496985, 1, 0, 0, 1, 1,
-0.1825416, -0.140013, -0.6902304, 1, 0, 0, 1, 1,
-0.1813089, -0.4742904, -1.313638, 1, 0, 0, 1, 1,
-0.1802294, 0.8856991, -0.3388941, 1, 0, 0, 1, 1,
-0.1783853, -1.653153, -2.825401, 1, 0, 0, 1, 1,
-0.1780943, 0.1524194, -1.443089, 0, 0, 0, 1, 1,
-0.1777955, 2.789648, -0.1136452, 0, 0, 0, 1, 1,
-0.1768816, -0.3640945, -1.18023, 0, 0, 0, 1, 1,
-0.1761716, 0.2364491, -1.007581, 0, 0, 0, 1, 1,
-0.1734501, 0.9856765, -1.43337, 0, 0, 0, 1, 1,
-0.172048, 0.02452341, -0.09215106, 0, 0, 0, 1, 1,
-0.171285, -0.0599655, -2.924514, 0, 0, 0, 1, 1,
-0.1697334, -1.364725, -3.192244, 1, 1, 1, 1, 1,
-0.1673451, -1.016575, -2.618859, 1, 1, 1, 1, 1,
-0.166043, -0.5951032, -2.770935, 1, 1, 1, 1, 1,
-0.1649668, -0.4027608, -2.336136, 1, 1, 1, 1, 1,
-0.16163, -0.09303036, -2.167514, 1, 1, 1, 1, 1,
-0.1597787, -0.1697789, -3.690244, 1, 1, 1, 1, 1,
-0.1538053, -0.8913778, -1.958784, 1, 1, 1, 1, 1,
-0.1522221, 1.345687, 0.4454453, 1, 1, 1, 1, 1,
-0.1462813, -1.008609, -3.949519, 1, 1, 1, 1, 1,
-0.1412765, -0.4961709, -2.023776, 1, 1, 1, 1, 1,
-0.1332861, -0.2211419, -1.680839, 1, 1, 1, 1, 1,
-0.1322995, 0.56157, 1.598777, 1, 1, 1, 1, 1,
-0.1288599, 0.5758306, 2.470643, 1, 1, 1, 1, 1,
-0.1286193, -1.415793, -3.351923, 1, 1, 1, 1, 1,
-0.1283038, -1.56709, -1.782905, 1, 1, 1, 1, 1,
-0.127612, 0.1956985, 0.6359981, 0, 0, 1, 1, 1,
-0.1254868, -1.294836, -3.923939, 1, 0, 0, 1, 1,
-0.1233989, 0.163068, -1.155648, 1, 0, 0, 1, 1,
-0.1206235, -0.7411225, -2.691493, 1, 0, 0, 1, 1,
-0.1163054, 0.3285985, 0.4300087, 1, 0, 0, 1, 1,
-0.1115036, 0.03338631, -3.270293, 1, 0, 0, 1, 1,
-0.1114184, -1.105914, -1.701447, 0, 0, 0, 1, 1,
-0.1106814, 0.1081281, 1.182071, 0, 0, 0, 1, 1,
-0.1102179, 0.459478, -0.6994091, 0, 0, 0, 1, 1,
-0.1037349, 0.3830517, -1.516497, 0, 0, 0, 1, 1,
-0.09996355, -0.5800349, -4.496419, 0, 0, 0, 1, 1,
-0.09986331, 1.263475, -0.5483801, 0, 0, 0, 1, 1,
-0.09507219, 0.3452357, -2.125299, 0, 0, 0, 1, 1,
-0.09463645, 1.078433, -1.872451, 1, 1, 1, 1, 1,
-0.08809768, 0.3214554, -1.19438, 1, 1, 1, 1, 1,
-0.08076667, 0.4772197, 0.6590038, 1, 1, 1, 1, 1,
-0.0753682, 0.3824475, 0.3632748, 1, 1, 1, 1, 1,
-0.07476695, -1.724366, -3.064764, 1, 1, 1, 1, 1,
-0.07324085, -0.004182774, -2.16013, 1, 1, 1, 1, 1,
-0.07083511, -0.057972, -1.575454, 1, 1, 1, 1, 1,
-0.06853844, -1.633819, -4.088981, 1, 1, 1, 1, 1,
-0.06239539, 0.4674138, -1.784855, 1, 1, 1, 1, 1,
-0.0577809, 0.04748197, -2.431197, 1, 1, 1, 1, 1,
-0.05571062, -1.232321, -2.472341, 1, 1, 1, 1, 1,
-0.05563776, -1.191404, -2.957565, 1, 1, 1, 1, 1,
-0.05423527, 1.073821, -1.818374, 1, 1, 1, 1, 1,
-0.05136371, 1.329792, 0.8371871, 1, 1, 1, 1, 1,
-0.051007, -0.03027217, -2.008591, 1, 1, 1, 1, 1,
-0.04856548, -0.8697113, -0.7712438, 0, 0, 1, 1, 1,
-0.04856025, -0.5186641, -5.20643, 1, 0, 0, 1, 1,
-0.04673283, 0.7917524, 0.9321292, 1, 0, 0, 1, 1,
-0.04119815, -0.5339516, -4.542187, 1, 0, 0, 1, 1,
-0.03928586, -0.6128495, -2.576208, 1, 0, 0, 1, 1,
-0.03875557, -0.1097278, -3.640847, 1, 0, 0, 1, 1,
-0.03694291, -1.383176, -3.575034, 0, 0, 0, 1, 1,
-0.03578075, -0.1472859, -1.981303, 0, 0, 0, 1, 1,
-0.03464149, 0.6581172, -0.06403717, 0, 0, 0, 1, 1,
-0.02808188, 0.3106838, 1.316735, 0, 0, 0, 1, 1,
-0.02802907, -1.511168, -4.250256, 0, 0, 0, 1, 1,
-0.02711288, 0.2293419, -0.5024572, 0, 0, 0, 1, 1,
-0.02517723, 1.450275, -0.6601557, 0, 0, 0, 1, 1,
-0.01987047, -1.175049, -4.281442, 1, 1, 1, 1, 1,
-0.00782426, 0.4423407, 1.921309, 1, 1, 1, 1, 1,
-0.007665654, -1.372362, -3.585445, 1, 1, 1, 1, 1,
-0.007353608, -0.08372755, -3.038529, 1, 1, 1, 1, 1,
-0.003906505, 1.973994, -1.42369, 1, 1, 1, 1, 1,
-0.001524773, -2.047804, -2.950398, 1, 1, 1, 1, 1,
0.001043351, 0.1750811, 0.05703667, 1, 1, 1, 1, 1,
0.003154254, 1.058888, -0.2180714, 1, 1, 1, 1, 1,
0.003390977, -0.510752, 3.144494, 1, 1, 1, 1, 1,
0.005166227, 1.340225, 0.4621697, 1, 1, 1, 1, 1,
0.01000558, 0.4578861, -0.566435, 1, 1, 1, 1, 1,
0.01514566, 0.5415162, 0.1667857, 1, 1, 1, 1, 1,
0.015428, -0.1108327, 3.234308, 1, 1, 1, 1, 1,
0.01589145, -1.182748, 3.268628, 1, 1, 1, 1, 1,
0.01617031, 0.6965677, -0.5953371, 1, 1, 1, 1, 1,
0.01803903, -1.330882, 3.540814, 0, 0, 1, 1, 1,
0.02003342, 0.6393782, 0.05003078, 1, 0, 0, 1, 1,
0.02210354, -0.07007057, 2.44204, 1, 0, 0, 1, 1,
0.02220374, -0.5500805, 2.789473, 1, 0, 0, 1, 1,
0.0270219, 0.5635259, 0.06463048, 1, 0, 0, 1, 1,
0.02789987, -0.3324773, 2.308201, 1, 0, 0, 1, 1,
0.02818711, 0.00236162, 0.8433161, 0, 0, 0, 1, 1,
0.02954226, 0.7800535, -0.4636285, 0, 0, 0, 1, 1,
0.03273651, 0.4074104, -0.8416077, 0, 0, 0, 1, 1,
0.03459904, 0.6587386, 0.6691847, 0, 0, 0, 1, 1,
0.03802677, 0.363725, 0.217656, 0, 0, 0, 1, 1,
0.04289926, -0.1015946, 1.099759, 0, 0, 0, 1, 1,
0.04380899, -0.631056, 2.746605, 0, 0, 0, 1, 1,
0.04669683, 0.3117058, -0.6696501, 1, 1, 1, 1, 1,
0.05294354, -0.471241, 4.104956, 1, 1, 1, 1, 1,
0.05325725, -1.414063, 3.784605, 1, 1, 1, 1, 1,
0.06120914, 0.3179029, 1.965971, 1, 1, 1, 1, 1,
0.06412821, 0.2403293, -0.1413006, 1, 1, 1, 1, 1,
0.07259383, 0.6696831, 0.4384616, 1, 1, 1, 1, 1,
0.07408453, -1.530605, 3.272614, 1, 1, 1, 1, 1,
0.08023865, 0.06647417, -0.8715842, 1, 1, 1, 1, 1,
0.08095699, 0.04937091, 1.057312, 1, 1, 1, 1, 1,
0.08281699, -1.879975, 2.485441, 1, 1, 1, 1, 1,
0.0861856, -0.8183517, 2.835145, 1, 1, 1, 1, 1,
0.08642665, -1.28931, 2.17113, 1, 1, 1, 1, 1,
0.08754099, 0.3155524, 0.009042531, 1, 1, 1, 1, 1,
0.09115126, -0.7707599, 1.555336, 1, 1, 1, 1, 1,
0.09193127, 1.209932, -0.2819941, 1, 1, 1, 1, 1,
0.09306236, -1.185603, 3.052479, 0, 0, 1, 1, 1,
0.09365278, -0.5661873, 3.27134, 1, 0, 0, 1, 1,
0.0965666, -0.2436307, 0.3381102, 1, 0, 0, 1, 1,
0.09893929, -1.041229, 4.064717, 1, 0, 0, 1, 1,
0.1009129, -0.3413846, 2.794881, 1, 0, 0, 1, 1,
0.101573, -1.099423, 4.114275, 1, 0, 0, 1, 1,
0.101992, 0.5127518, 1.18044, 0, 0, 0, 1, 1,
0.1112414, -2.253075, 2.346037, 0, 0, 0, 1, 1,
0.1139028, 1.45386, 0.1716041, 0, 0, 0, 1, 1,
0.1177159, -0.8197568, 2.069051, 0, 0, 0, 1, 1,
0.1184038, 1.324913, 2.065008, 0, 0, 0, 1, 1,
0.1185627, 0.3195262, 0.7415963, 0, 0, 0, 1, 1,
0.1192235, 0.8493885, 1.340517, 0, 0, 0, 1, 1,
0.1214063, -0.4509578, 4.325048, 1, 1, 1, 1, 1,
0.1215146, -1.712788, 3.434209, 1, 1, 1, 1, 1,
0.1222283, -0.3063599, 2.346851, 1, 1, 1, 1, 1,
0.1236726, 0.467641, 1.093215, 1, 1, 1, 1, 1,
0.1277783, 0.8694178, -0.9538168, 1, 1, 1, 1, 1,
0.1280949, -0.3913271, 4.339976, 1, 1, 1, 1, 1,
0.1326434, 0.2436019, -0.5368527, 1, 1, 1, 1, 1,
0.1332149, -0.8211765, 5.214885, 1, 1, 1, 1, 1,
0.1366151, 2.483746, 0.2159951, 1, 1, 1, 1, 1,
0.1378852, -0.5138297, 4.457828, 1, 1, 1, 1, 1,
0.141205, 0.3842548, 0.4472323, 1, 1, 1, 1, 1,
0.1436056, -0.5010492, 2.957145, 1, 1, 1, 1, 1,
0.15274, 1.380748, -1.31755, 1, 1, 1, 1, 1,
0.1530454, -0.5884396, 2.541084, 1, 1, 1, 1, 1,
0.1553467, -0.8240467, 1.98148, 1, 1, 1, 1, 1,
0.1554605, -0.830681, 0.6046333, 0, 0, 1, 1, 1,
0.1559069, 1.665927, -0.6384653, 1, 0, 0, 1, 1,
0.1572654, 2.299943, -0.906279, 1, 0, 0, 1, 1,
0.1584553, 0.3005761, 0.6272959, 1, 0, 0, 1, 1,
0.1591865, -0.8397596, 4.294277, 1, 0, 0, 1, 1,
0.1600349, -0.4630871, 2.7561, 1, 0, 0, 1, 1,
0.1614655, -0.7992882, 4.903368, 0, 0, 0, 1, 1,
0.1623016, 0.8037353, 1.296712, 0, 0, 0, 1, 1,
0.1652882, -1.194459, 3.087318, 0, 0, 0, 1, 1,
0.1679705, 1.026958, 1.494485, 0, 0, 0, 1, 1,
0.1685622, 0.8396738, 0.7460293, 0, 0, 0, 1, 1,
0.1699265, 0.3746368, -0.06801135, 0, 0, 0, 1, 1,
0.1724702, -0.3228084, 5.030027, 0, 0, 0, 1, 1,
0.1765576, -0.7199981, 1.86632, 1, 1, 1, 1, 1,
0.1837516, -1.581397, 3.445204, 1, 1, 1, 1, 1,
0.1856302, -1.364466, 2.172649, 1, 1, 1, 1, 1,
0.1877773, 0.8912416, -0.9153895, 1, 1, 1, 1, 1,
0.1886246, -0.3909186, 2.997263, 1, 1, 1, 1, 1,
0.1911937, -1.253941, 2.699948, 1, 1, 1, 1, 1,
0.1989992, -0.2340585, 4.022481, 1, 1, 1, 1, 1,
0.2036479, 0.9111776, -1.221954, 1, 1, 1, 1, 1,
0.2061356, -0.5074347, 4.600615, 1, 1, 1, 1, 1,
0.2111399, -0.5175723, 3.691022, 1, 1, 1, 1, 1,
0.212255, -0.348191, 2.60654, 1, 1, 1, 1, 1,
0.2165928, -0.4743626, 3.182363, 1, 1, 1, 1, 1,
0.2249897, -0.3928674, 3.892272, 1, 1, 1, 1, 1,
0.2282438, 1.783953, -0.3099193, 1, 1, 1, 1, 1,
0.2283894, 0.7281476, 0.1155845, 1, 1, 1, 1, 1,
0.2363116, 1.383725, -2.703958, 0, 0, 1, 1, 1,
0.2363465, 0.5936251, 0.830735, 1, 0, 0, 1, 1,
0.2366984, -1.060593, 1.541942, 1, 0, 0, 1, 1,
0.2406723, -0.2248506, 1.34301, 1, 0, 0, 1, 1,
0.2411136, 1.264365, 1.055993, 1, 0, 0, 1, 1,
0.2478612, -0.7890998, 2.263152, 1, 0, 0, 1, 1,
0.2486363, 1.407911, -1.024856, 0, 0, 0, 1, 1,
0.2572604, -0.08893467, 1.518533, 0, 0, 0, 1, 1,
0.2580287, 0.9025535, 2.179231, 0, 0, 0, 1, 1,
0.2584122, 1.511071, -0.8768883, 0, 0, 0, 1, 1,
0.2617407, 1.638946, -1.930099, 0, 0, 0, 1, 1,
0.2624604, 0.4212671, 0.2917086, 0, 0, 0, 1, 1,
0.2687918, 0.8070534, 0.737571, 0, 0, 0, 1, 1,
0.2710267, -0.4204581, 3.109187, 1, 1, 1, 1, 1,
0.2787974, -0.6310399, 3.1057, 1, 1, 1, 1, 1,
0.2818212, -0.8911768, 3.054197, 1, 1, 1, 1, 1,
0.2895526, -1.368426, 2.579833, 1, 1, 1, 1, 1,
0.2923715, 0.3665418, 2.286097, 1, 1, 1, 1, 1,
0.2925025, 0.6176919, 0.8529252, 1, 1, 1, 1, 1,
0.2941306, -0.4708056, 2.45621, 1, 1, 1, 1, 1,
0.2950598, -0.8865674, 2.530548, 1, 1, 1, 1, 1,
0.2953351, -0.4579534, 4.037776, 1, 1, 1, 1, 1,
0.3054494, -0.4648989, 2.612579, 1, 1, 1, 1, 1,
0.3081072, -0.9048962, 3.170439, 1, 1, 1, 1, 1,
0.3123795, -0.3858398, 1.939332, 1, 1, 1, 1, 1,
0.3124235, -0.5247434, 1.370511, 1, 1, 1, 1, 1,
0.3130246, -0.4892824, 1.309757, 1, 1, 1, 1, 1,
0.3165541, -0.6976303, 3.831518, 1, 1, 1, 1, 1,
0.3174389, -1.566302, 4.904378, 0, 0, 1, 1, 1,
0.3180031, 0.3037582, 1.071728, 1, 0, 0, 1, 1,
0.3219002, -0.1901072, 2.982775, 1, 0, 0, 1, 1,
0.3230844, 0.6806629, 1.786585, 1, 0, 0, 1, 1,
0.3235545, -0.8269684, 2.124111, 1, 0, 0, 1, 1,
0.3242113, 0.853676, -1.630696, 1, 0, 0, 1, 1,
0.3249085, -0.6798145, 2.757697, 0, 0, 0, 1, 1,
0.3267677, 0.1467749, -0.5665048, 0, 0, 0, 1, 1,
0.3282461, 0.1372045, 1.84185, 0, 0, 0, 1, 1,
0.3313974, 0.911271, 1.077495, 0, 0, 0, 1, 1,
0.3316379, 0.7548915, -0.451018, 0, 0, 0, 1, 1,
0.3359552, 0.3223826, -0.8861583, 0, 0, 0, 1, 1,
0.3383131, -0.9292887, 4.588471, 0, 0, 0, 1, 1,
0.3402302, -0.8922759, 2.476463, 1, 1, 1, 1, 1,
0.3483784, 0.4693835, 0.6208905, 1, 1, 1, 1, 1,
0.3523928, 0.7794306, 0.6075348, 1, 1, 1, 1, 1,
0.3530372, -0.4411762, 2.072734, 1, 1, 1, 1, 1,
0.3540698, 0.5567231, 0.1895298, 1, 1, 1, 1, 1,
0.3625834, -1.386737, 1.979677, 1, 1, 1, 1, 1,
0.3686585, -0.3530415, 3.255005, 1, 1, 1, 1, 1,
0.369117, -1.219526, 2.887449, 1, 1, 1, 1, 1,
0.3694466, -0.205721, 2.311526, 1, 1, 1, 1, 1,
0.37703, 0.4943215, 3.241057, 1, 1, 1, 1, 1,
0.3803481, 0.462107, 1.419523, 1, 1, 1, 1, 1,
0.391343, 0.1983019, 1.671104, 1, 1, 1, 1, 1,
0.3933882, 0.453195, 0.8725618, 1, 1, 1, 1, 1,
0.3940726, -1.802099, 2.488944, 1, 1, 1, 1, 1,
0.3995752, 1.247433, -0.2218875, 1, 1, 1, 1, 1,
0.401922, 1.776174, 1.671731, 0, 0, 1, 1, 1,
0.4019724, -0.5024812, 2.655117, 1, 0, 0, 1, 1,
0.4054269, 0.8054271, 0.2418096, 1, 0, 0, 1, 1,
0.4075038, -0.2370477, 2.015207, 1, 0, 0, 1, 1,
0.4096107, 0.3388239, -0.1068641, 1, 0, 0, 1, 1,
0.413583, -1.193252, 2.758156, 1, 0, 0, 1, 1,
0.4139621, -0.4978791, 2.166283, 0, 0, 0, 1, 1,
0.418289, 0.04396797, 3.140812, 0, 0, 0, 1, 1,
0.4225376, -0.3906852, 3.248151, 0, 0, 0, 1, 1,
0.4231816, 1.390565, 0.7602635, 0, 0, 0, 1, 1,
0.4234708, -0.5000954, 0.8764852, 0, 0, 0, 1, 1,
0.424287, -0.3506557, 2.004322, 0, 0, 0, 1, 1,
0.4294712, 0.6256779, -0.5832207, 0, 0, 0, 1, 1,
0.4334702, 1.019154, 0.6609533, 1, 1, 1, 1, 1,
0.4335499, -0.9585531, 1.85862, 1, 1, 1, 1, 1,
0.4381394, 0.2931679, 0.8450783, 1, 1, 1, 1, 1,
0.4393379, 0.6093846, 0.9469785, 1, 1, 1, 1, 1,
0.4431698, 0.8955044, -0.04894006, 1, 1, 1, 1, 1,
0.4446576, 0.9592095, 0.7403181, 1, 1, 1, 1, 1,
0.4473567, 0.5775118, 0.8490067, 1, 1, 1, 1, 1,
0.4516565, -0.3373852, 0.5035072, 1, 1, 1, 1, 1,
0.4518484, -0.5971799, 3.772699, 1, 1, 1, 1, 1,
0.453485, 0.1779919, 0.3512698, 1, 1, 1, 1, 1,
0.4577973, 0.2723479, 1.428361, 1, 1, 1, 1, 1,
0.4589427, 0.3614402, 2.429336, 1, 1, 1, 1, 1,
0.4599793, -0.2738352, 1.993609, 1, 1, 1, 1, 1,
0.4604406, 1.122022, 0.6494481, 1, 1, 1, 1, 1,
0.4624072, 1.11935, 2.213443, 1, 1, 1, 1, 1,
0.4630747, -0.7465199, 2.880123, 0, 0, 1, 1, 1,
0.4634509, 0.6066508, 1.133368, 1, 0, 0, 1, 1,
0.464871, -0.4383001, 2.393559, 1, 0, 0, 1, 1,
0.4650455, 0.2725963, 0.3361501, 1, 0, 0, 1, 1,
0.4678705, -0.5569042, 2.924352, 1, 0, 0, 1, 1,
0.4687486, 0.9236608, 0.2246274, 1, 0, 0, 1, 1,
0.4689165, 0.5961186, 0.9019024, 0, 0, 0, 1, 1,
0.4724291, 0.08816992, 2.273557, 0, 0, 0, 1, 1,
0.4796039, 0.8806236, 0.3350493, 0, 0, 0, 1, 1,
0.4854656, -0.2607687, 2.145986, 0, 0, 0, 1, 1,
0.4889199, -0.3729324, 2.603725, 0, 0, 0, 1, 1,
0.4893643, -0.7957664, 1.655068, 0, 0, 0, 1, 1,
0.4911765, 0.4556951, 0.1022975, 0, 0, 0, 1, 1,
0.5043066, 0.628894, 1.838024, 1, 1, 1, 1, 1,
0.5128369, 0.4755039, 1.949061, 1, 1, 1, 1, 1,
0.5191302, 1.221198, -0.8274938, 1, 1, 1, 1, 1,
0.5208506, -0.463615, 0.2758701, 1, 1, 1, 1, 1,
0.52392, -0.05047402, 1.59425, 1, 1, 1, 1, 1,
0.5331584, -0.2751932, 2.512446, 1, 1, 1, 1, 1,
0.5343682, -1.218117, 1.864543, 1, 1, 1, 1, 1,
0.5359274, 0.5969567, 1.542428, 1, 1, 1, 1, 1,
0.5369554, -0.331795, 4.078639, 1, 1, 1, 1, 1,
0.5419069, -1.175923, 3.454334, 1, 1, 1, 1, 1,
0.5454666, 0.2222613, 1.384652, 1, 1, 1, 1, 1,
0.5461839, 0.7324433, 0.8810911, 1, 1, 1, 1, 1,
0.5472867, 0.925473, 1.36545, 1, 1, 1, 1, 1,
0.5555416, 1.006706, 1.04786, 1, 1, 1, 1, 1,
0.5556739, -0.3375648, 1.913976, 1, 1, 1, 1, 1,
0.556168, -0.2755326, 3.942081, 0, 0, 1, 1, 1,
0.5573303, -0.2405858, 1.697445, 1, 0, 0, 1, 1,
0.5575554, -0.1535026, 0.6861784, 1, 0, 0, 1, 1,
0.5584292, 0.2401186, 0.6648931, 1, 0, 0, 1, 1,
0.5586343, 1.044207, 1.361988, 1, 0, 0, 1, 1,
0.5596538, -1.815873, 2.131833, 1, 0, 0, 1, 1,
0.5668317, -0.1717657, 3.157431, 0, 0, 0, 1, 1,
0.5673645, -0.08209333, 2.615008, 0, 0, 0, 1, 1,
0.5697773, 1.208029, -0.5454425, 0, 0, 0, 1, 1,
0.5701333, 0.7160487, -0.1412014, 0, 0, 0, 1, 1,
0.5748135, 0.6118026, -0.9005053, 0, 0, 0, 1, 1,
0.5820845, 1.374868, 1.437445, 0, 0, 0, 1, 1,
0.6039792, -0.637228, 3.283694, 0, 0, 0, 1, 1,
0.6063302, 0.94342, 1.440872, 1, 1, 1, 1, 1,
0.6068729, 1.141649, 0.01249627, 1, 1, 1, 1, 1,
0.6081102, -0.7317895, 1.539747, 1, 1, 1, 1, 1,
0.6099025, 1.562263, -0.6993004, 1, 1, 1, 1, 1,
0.6134059, 0.4201268, -0.2323745, 1, 1, 1, 1, 1,
0.613707, 0.1766124, 0.3804995, 1, 1, 1, 1, 1,
0.616904, 0.3225075, 1.41948, 1, 1, 1, 1, 1,
0.6169981, -0.4953958, 0.5566763, 1, 1, 1, 1, 1,
0.6188131, 0.3453618, -0.4694653, 1, 1, 1, 1, 1,
0.622942, 0.6757038, 1.126262, 1, 1, 1, 1, 1,
0.6253656, -0.4652839, 2.770143, 1, 1, 1, 1, 1,
0.6333901, -0.2183994, -0.002911761, 1, 1, 1, 1, 1,
0.6369665, -0.03789614, 0.8102363, 1, 1, 1, 1, 1,
0.6418, 0.2434925, 1.125535, 1, 1, 1, 1, 1,
0.6489391, 0.8690513, 0.8251191, 1, 1, 1, 1, 1,
0.6532968, -0.2322293, 1.79789, 0, 0, 1, 1, 1,
0.6575598, 0.4160439, -0.650331, 1, 0, 0, 1, 1,
0.6587857, 0.3090833, 0.8984542, 1, 0, 0, 1, 1,
0.6597896, 0.7868634, 0.678587, 1, 0, 0, 1, 1,
0.6607519, -0.9607599, 1.388917, 1, 0, 0, 1, 1,
0.6686807, -0.7745451, 2.733409, 1, 0, 0, 1, 1,
0.6710052, -1.661223, 2.164006, 0, 0, 0, 1, 1,
0.6732365, -0.8510213, 3.518817, 0, 0, 0, 1, 1,
0.673304, 1.393934, -0.1617299, 0, 0, 0, 1, 1,
0.677824, 0.3595913, 0.821883, 0, 0, 0, 1, 1,
0.6823376, -1.178832, 2.222259, 0, 0, 0, 1, 1,
0.6890464, -0.1760883, 2.853032, 0, 0, 0, 1, 1,
0.6902939, -0.1882305, 2.593527, 0, 0, 0, 1, 1,
0.6905131, -1.251673, 4.108111, 1, 1, 1, 1, 1,
0.6939918, -0.4848785, 0.6998866, 1, 1, 1, 1, 1,
0.7008435, 0.3301345, -0.07471851, 1, 1, 1, 1, 1,
0.7164567, -1.627211, 1.740951, 1, 1, 1, 1, 1,
0.7235174, 0.2097946, 1.28352, 1, 1, 1, 1, 1,
0.723555, 0.2378813, 1.499636, 1, 1, 1, 1, 1,
0.7251496, -0.4930554, 1.710276, 1, 1, 1, 1, 1,
0.7253087, -0.6611248, 3.324466, 1, 1, 1, 1, 1,
0.7259259, 1.472296, 0.01696431, 1, 1, 1, 1, 1,
0.7296959, -0.03790359, 2.558378, 1, 1, 1, 1, 1,
0.7335662, -1.104033, 4.036365, 1, 1, 1, 1, 1,
0.7367972, -0.7967256, 1.149388, 1, 1, 1, 1, 1,
0.7385709, -0.1793363, 1.386897, 1, 1, 1, 1, 1,
0.7399931, 0.4899844, 0.2890709, 1, 1, 1, 1, 1,
0.7506039, 0.9365461, 1.456473, 1, 1, 1, 1, 1,
0.7510468, 0.4155505, 1.175659, 0, 0, 1, 1, 1,
0.7536844, 0.7118506, -0.4918486, 1, 0, 0, 1, 1,
0.7561085, 1.099871, 1.695507, 1, 0, 0, 1, 1,
0.7564381, -0.1326851, 2.294526, 1, 0, 0, 1, 1,
0.760055, 0.7556928, 2.104612, 1, 0, 0, 1, 1,
0.7666342, -0.4796412, 3.001317, 1, 0, 0, 1, 1,
0.7679553, 0.4390254, -1.21547, 0, 0, 0, 1, 1,
0.7687506, -0.7446885, 3.833685, 0, 0, 0, 1, 1,
0.7705461, -0.03269356, 1.820781, 0, 0, 0, 1, 1,
0.7719167, -0.403427, 1.914279, 0, 0, 0, 1, 1,
0.7720955, -0.2872062, 2.539312, 0, 0, 0, 1, 1,
0.7748398, -0.6200709, 2.397447, 0, 0, 0, 1, 1,
0.7783109, -1.6654, 1.74803, 0, 0, 0, 1, 1,
0.7802838, -0.1154206, 1.85153, 1, 1, 1, 1, 1,
0.7849526, 1.086064, 2.46781, 1, 1, 1, 1, 1,
0.7849678, 1.327171, -1.059463, 1, 1, 1, 1, 1,
0.790976, -0.4278031, 2.007361, 1, 1, 1, 1, 1,
0.7971001, 0.3246848, 1.56078, 1, 1, 1, 1, 1,
0.7988149, -0.2801385, 1.442365, 1, 1, 1, 1, 1,
0.7993984, -0.8309727, 1.295932, 1, 1, 1, 1, 1,
0.8107523, 0.4248308, 2.17829, 1, 1, 1, 1, 1,
0.8157784, -0.4331501, 0.1407657, 1, 1, 1, 1, 1,
0.820333, -0.4550245, 3.305527, 1, 1, 1, 1, 1,
0.823094, 0.5784878, 1.042765, 1, 1, 1, 1, 1,
0.8287646, 1.645976, 1.041377, 1, 1, 1, 1, 1,
0.8289932, 1.284114, 0.5636641, 1, 1, 1, 1, 1,
0.8322788, -1.314919, 1.524313, 1, 1, 1, 1, 1,
0.8328305, -0.155005, 3.443612, 1, 1, 1, 1, 1,
0.8340948, -1.556754, 2.416698, 0, 0, 1, 1, 1,
0.8354942, -1.507612, 1.954489, 1, 0, 0, 1, 1,
0.8382411, 0.7742082, -0.3675856, 1, 0, 0, 1, 1,
0.8406286, 0.2808123, 1.891377, 1, 0, 0, 1, 1,
0.8429379, -0.564679, 2.788079, 1, 0, 0, 1, 1,
0.8447523, 0.3110934, 0.7691833, 1, 0, 0, 1, 1,
0.8464935, 1.471316, -1.171687, 0, 0, 0, 1, 1,
0.8496175, 0.4158207, -1.402131, 0, 0, 0, 1, 1,
0.8543808, -0.7885889, 4.387485, 0, 0, 0, 1, 1,
0.8654233, -1.530414, 0.9889511, 0, 0, 0, 1, 1,
0.8704477, 1.742103, -1.784894, 0, 0, 0, 1, 1,
0.8736333, 0.2274729, 1.293917, 0, 0, 0, 1, 1,
0.8739488, 0.03987451, 1.144785, 0, 0, 0, 1, 1,
0.8740984, -1.00004, 2.097757, 1, 1, 1, 1, 1,
0.8758863, 0.840264, 0.823782, 1, 1, 1, 1, 1,
0.8820509, 1.009315, 0.9842905, 1, 1, 1, 1, 1,
0.8830864, 1.161393, 1.575207, 1, 1, 1, 1, 1,
0.8950107, 0.7656525, 0.2563037, 1, 1, 1, 1, 1,
0.8957469, -0.1901872, 2.917362, 1, 1, 1, 1, 1,
0.8984085, -0.02484586, 1.987188, 1, 1, 1, 1, 1,
0.8988122, 1.466091, 2.103992, 1, 1, 1, 1, 1,
0.8994139, -1.081796, 2.400099, 1, 1, 1, 1, 1,
0.904735, 0.6223193, -0.4085921, 1, 1, 1, 1, 1,
0.9270368, -0.21195, 1.429248, 1, 1, 1, 1, 1,
0.9292687, 1.729112, 1.410428, 1, 1, 1, 1, 1,
0.9293416, -0.4595858, -0.7894172, 1, 1, 1, 1, 1,
0.9320651, -1.256743, 3.67598, 1, 1, 1, 1, 1,
0.9331369, 0.9233679, 2.396305, 1, 1, 1, 1, 1,
0.9393559, -0.380044, 2.089424, 0, 0, 1, 1, 1,
0.9470831, -1.115045, 1.566375, 1, 0, 0, 1, 1,
0.9500182, 0.7275859, 1.772664, 1, 0, 0, 1, 1,
0.9649979, -0.7605191, 1.504378, 1, 0, 0, 1, 1,
0.96594, -0.6010165, 1.437305, 1, 0, 0, 1, 1,
0.9663299, -0.374262, 0.3727713, 1, 0, 0, 1, 1,
0.9676304, 0.6714547, -0.2909208, 0, 0, 0, 1, 1,
0.975401, 0.3982009, 0.7891279, 0, 0, 0, 1, 1,
0.9787981, 0.4423942, 1.458126, 0, 0, 0, 1, 1,
0.9827609, 0.7973297, 0.7293809, 0, 0, 0, 1, 1,
0.9961846, 0.2740966, 1.985135, 0, 0, 0, 1, 1,
1.001379, 0.4694735, -0.3968894, 0, 0, 0, 1, 1,
1.00427, 0.09687917, 2.028466, 0, 0, 0, 1, 1,
1.005221, -0.1134287, 2.605139, 1, 1, 1, 1, 1,
1.011454, 1.042855, -0.5026706, 1, 1, 1, 1, 1,
1.013126, -0.6708183, 1.828807, 1, 1, 1, 1, 1,
1.015506, -0.8606473, 2.542455, 1, 1, 1, 1, 1,
1.015845, -1.243205, 2.140134, 1, 1, 1, 1, 1,
1.036738, -0.2670562, 0.4457926, 1, 1, 1, 1, 1,
1.038734, -1.396221, 1.432774, 1, 1, 1, 1, 1,
1.042512, -0.877386, 4.164848, 1, 1, 1, 1, 1,
1.053583, -1.52884, 3.801379, 1, 1, 1, 1, 1,
1.059345, 0.902438, 2.786367, 1, 1, 1, 1, 1,
1.0619, 0.2512808, 1.556079, 1, 1, 1, 1, 1,
1.064858, -0.1359276, 0.3930869, 1, 1, 1, 1, 1,
1.068353, 0.3468505, 1.197112, 1, 1, 1, 1, 1,
1.06878, 1.61103, 1.646854, 1, 1, 1, 1, 1,
1.071297, -1.124217, 2.330515, 1, 1, 1, 1, 1,
1.074828, -0.258622, 1.688993, 0, 0, 1, 1, 1,
1.077871, -1.493571, 1.020502, 1, 0, 0, 1, 1,
1.084201, -0.6972626, 2.873236, 1, 0, 0, 1, 1,
1.093829, 0.7097018, 2.161105, 1, 0, 0, 1, 1,
1.094204, -1.182775, 3.602085, 1, 0, 0, 1, 1,
1.099519, -0.5294514, 1.775044, 1, 0, 0, 1, 1,
1.101385, -0.5031129, 2.083795, 0, 0, 0, 1, 1,
1.106419, -0.4650481, 1.884639, 0, 0, 0, 1, 1,
1.109038, -0.473493, 4.0682, 0, 0, 0, 1, 1,
1.117033, 1.025029, 1.13095, 0, 0, 0, 1, 1,
1.133168, 0.4204523, 1.63159, 0, 0, 0, 1, 1,
1.138761, -0.3307508, 1.020988, 0, 0, 0, 1, 1,
1.1404, -0.1720402, 1.617446, 0, 0, 0, 1, 1,
1.142186, 0.4285033, 0.9660999, 1, 1, 1, 1, 1,
1.142391, -0.4178093, 0.6384572, 1, 1, 1, 1, 1,
1.149605, 0.4410377, 1.225652, 1, 1, 1, 1, 1,
1.154301, 0.2309543, 1.620961, 1, 1, 1, 1, 1,
1.15868, -1.327385, 4.167599, 1, 1, 1, 1, 1,
1.160751, -0.02789543, 2.194656, 1, 1, 1, 1, 1,
1.16464, 0.1234411, 2.013395, 1, 1, 1, 1, 1,
1.16507, -0.09864338, 0.9736829, 1, 1, 1, 1, 1,
1.168168, -0.0944217, 2.187675, 1, 1, 1, 1, 1,
1.168927, -0.8522251, -0.3735988, 1, 1, 1, 1, 1,
1.177919, -0.2742226, 3.720362, 1, 1, 1, 1, 1,
1.18039, -1.709976, 2.376246, 1, 1, 1, 1, 1,
1.186273, 0.7844766, -0.1609957, 1, 1, 1, 1, 1,
1.20283, -0.2809355, 2.028129, 1, 1, 1, 1, 1,
1.204445, 0.4398999, 1.898574, 1, 1, 1, 1, 1,
1.213663, 1.315469, 1.558602, 0, 0, 1, 1, 1,
1.222777, 0.6857113, 0.7779185, 1, 0, 0, 1, 1,
1.22603, 1.331832, 0.5935578, 1, 0, 0, 1, 1,
1.226149, -0.7145248, 3.776287, 1, 0, 0, 1, 1,
1.229376, 0.1243119, -0.142898, 1, 0, 0, 1, 1,
1.241184, 0.04515321, 0.5720258, 1, 0, 0, 1, 1,
1.242996, 1.132664, 1.33898, 0, 0, 0, 1, 1,
1.245289, 1.589776, 0.3660721, 0, 0, 0, 1, 1,
1.250944, -1.070728, 2.687176, 0, 0, 0, 1, 1,
1.25892, -0.3352415, 1.087795, 0, 0, 0, 1, 1,
1.260937, -0.5884731, 2.292779, 0, 0, 0, 1, 1,
1.261637, 0.3459058, 0.4419267, 0, 0, 0, 1, 1,
1.263956, -0.5081537, 1.961357, 0, 0, 0, 1, 1,
1.264579, -0.05921675, 2.379519, 1, 1, 1, 1, 1,
1.273642, 0.5217413, 2.037189, 1, 1, 1, 1, 1,
1.275109, 1.176043, 1.302255, 1, 1, 1, 1, 1,
1.276409, 0.2548831, 1.058962, 1, 1, 1, 1, 1,
1.276586, 0.9360862, 2.073516, 1, 1, 1, 1, 1,
1.284272, -1.040412, 1.562264, 1, 1, 1, 1, 1,
1.28977, 0.4221605, 0.8576823, 1, 1, 1, 1, 1,
1.293271, 1.238438, -0.5478508, 1, 1, 1, 1, 1,
1.297086, -0.4117455, 1.926259, 1, 1, 1, 1, 1,
1.307266, -0.9162693, 1.763181, 1, 1, 1, 1, 1,
1.307978, 1.882138, -1.635633, 1, 1, 1, 1, 1,
1.321181, 0.467148, 1.763492, 1, 1, 1, 1, 1,
1.329388, 0.8211655, 2.049608, 1, 1, 1, 1, 1,
1.344942, -0.2168406, 1.09336, 1, 1, 1, 1, 1,
1.346698, -0.1094473, 2.096178, 1, 1, 1, 1, 1,
1.350607, -0.7586584, 2.548857, 0, 0, 1, 1, 1,
1.352568, 0.3250053, 0.7427232, 1, 0, 0, 1, 1,
1.355252, -0.6637194, 1.082631, 1, 0, 0, 1, 1,
1.359715, -0.1319075, 1.466485, 1, 0, 0, 1, 1,
1.376942, 0.4454509, 1.208277, 1, 0, 0, 1, 1,
1.404168, 1.674074, 1.075654, 1, 0, 0, 1, 1,
1.410272, 1.673776, 2.076045, 0, 0, 0, 1, 1,
1.411798, -1.308049, 0.8263975, 0, 0, 0, 1, 1,
1.416259, 1.181581, -0.3207, 0, 0, 0, 1, 1,
1.42595, -0.2332665, 3.331289, 0, 0, 0, 1, 1,
1.429476, 0.6951819, 1.316239, 0, 0, 0, 1, 1,
1.431895, -0.160833, 2.64101, 0, 0, 0, 1, 1,
1.436769, -1.409337, 0.7697068, 0, 0, 0, 1, 1,
1.447399, -0.9023638, 1.872711, 1, 1, 1, 1, 1,
1.453016, 1.187972, 0.1806846, 1, 1, 1, 1, 1,
1.45509, -1.082213, 2.263042, 1, 1, 1, 1, 1,
1.462953, 1.425029, 1.132206, 1, 1, 1, 1, 1,
1.473077, 0.1165254, 0.05458255, 1, 1, 1, 1, 1,
1.480194, -0.1296638, 1.56821, 1, 1, 1, 1, 1,
1.483742, -1.011655, 0.7726109, 1, 1, 1, 1, 1,
1.484279, -1.472013, 0.6294292, 1, 1, 1, 1, 1,
1.494274, 0.3572968, 1.606604, 1, 1, 1, 1, 1,
1.494386, 1.141262, 1.032933, 1, 1, 1, 1, 1,
1.498933, 1.035687, 0.6597211, 1, 1, 1, 1, 1,
1.512176, -0.7207617, 1.005497, 1, 1, 1, 1, 1,
1.515725, 0.648492, 1.455902, 1, 1, 1, 1, 1,
1.521844, -1.432826, 2.509503, 1, 1, 1, 1, 1,
1.529868, -2.060981, 2.203838, 1, 1, 1, 1, 1,
1.531207, 0.1009258, 2.581517, 0, 0, 1, 1, 1,
1.537392, -0.6625311, 1.127524, 1, 0, 0, 1, 1,
1.547595, -0.2223895, 0.5563557, 1, 0, 0, 1, 1,
1.580968, 0.1125542, 1.940337, 1, 0, 0, 1, 1,
1.582173, 2.338247, 1.672189, 1, 0, 0, 1, 1,
1.591112, -0.001610709, 2.729769, 1, 0, 0, 1, 1,
1.594203, -1.235325, 3.373061, 0, 0, 0, 1, 1,
1.608309, -1.286748, 1.712568, 0, 0, 0, 1, 1,
1.610332, -0.2846835, 2.143806, 0, 0, 0, 1, 1,
1.61517, -0.5919551, 2.256919, 0, 0, 0, 1, 1,
1.627653, -0.2880177, 0.125297, 0, 0, 0, 1, 1,
1.631599, -0.988347, 2.992962, 0, 0, 0, 1, 1,
1.648278, -1.986719, 2.635202, 0, 0, 0, 1, 1,
1.658808, -0.643171, 2.897295, 1, 1, 1, 1, 1,
1.681427, 1.078942, -0.08182848, 1, 1, 1, 1, 1,
1.684271, -3.262791, 3.444971, 1, 1, 1, 1, 1,
1.692516, 0.4125297, 1.890007, 1, 1, 1, 1, 1,
1.727321, -1.375743, 3.221256, 1, 1, 1, 1, 1,
1.743753, 0.5092162, 2.441342, 1, 1, 1, 1, 1,
1.762329, -0.7688273, 1.872833, 1, 1, 1, 1, 1,
1.768767, 1.368649, 1.993555, 1, 1, 1, 1, 1,
1.812728, 0.834979, 0.3368791, 1, 1, 1, 1, 1,
1.816641, 0.9098371, 2.555734, 1, 1, 1, 1, 1,
1.846473, -1.390833, 1.012858, 1, 1, 1, 1, 1,
1.855197, -0.9333225, 1.221354, 1, 1, 1, 1, 1,
1.88868, 1.365988, 1.115407, 1, 1, 1, 1, 1,
1.926261, 1.101034, 0.7625241, 1, 1, 1, 1, 1,
1.941027, -1.130315, 2.775513, 1, 1, 1, 1, 1,
1.941412, 0.5330572, 2.143826, 0, 0, 1, 1, 1,
2.05947, -0.05149417, 1.351255, 1, 0, 0, 1, 1,
2.07716, -0.01117691, 2.36812, 1, 0, 0, 1, 1,
2.09276, -0.7895994, 4.235493, 1, 0, 0, 1, 1,
2.098082, -0.0988322, 2.536527, 1, 0, 0, 1, 1,
2.108517, -1.601029, 3.586403, 1, 0, 0, 1, 1,
2.136647, -0.01148055, 1.206043, 0, 0, 0, 1, 1,
2.151086, 0.7655954, 1.412289, 0, 0, 0, 1, 1,
2.169878, 1.176966, 2.219153, 0, 0, 0, 1, 1,
2.179718, -0.2820061, 0.4965959, 0, 0, 0, 1, 1,
2.182385, -0.8871862, 3.146263, 0, 0, 0, 1, 1,
2.339179, 0.6209187, -0.5474619, 0, 0, 0, 1, 1,
2.351461, 0.1805736, 3.120379, 0, 0, 0, 1, 1,
2.45671, -0.2609986, 0.5818378, 1, 1, 1, 1, 1,
2.514694, -1.144252, 0.2189124, 1, 1, 1, 1, 1,
2.570758, -0.3115256, 1.925912, 1, 1, 1, 1, 1,
2.599216, -0.02723913, -0.2799422, 1, 1, 1, 1, 1,
2.711784, -0.9869894, 1.665406, 1, 1, 1, 1, 1,
2.722649, -0.2556818, 1.753144, 1, 1, 1, 1, 1,
2.994685, 0.9027176, 1.264183, 1, 1, 1, 1, 1
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
var radius = 9.449909;
var distance = 33.1924;
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
mvMatrix.translate( 0.2690368, 0.1335415, -0.004227161 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1924);
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
