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
-3.365956, -0.4687982, -1.223846, 1, 0, 0, 1,
-3.182289, 0.1016145, -2.359123, 1, 0.007843138, 0, 1,
-3.123674, -1.023185, -2.24643, 1, 0.01176471, 0, 1,
-3.058647, 1.014995, -2.50143, 1, 0.01960784, 0, 1,
-2.899591, 0.9125116, -1.865358, 1, 0.02352941, 0, 1,
-2.722469, -1.121315, -1.467725, 1, 0.03137255, 0, 1,
-2.614012, -1.064468, -2.39683, 1, 0.03529412, 0, 1,
-2.511262, -0.9310563, -1.169384, 1, 0.04313726, 0, 1,
-2.370627, -0.316448, -2.655449, 1, 0.04705882, 0, 1,
-2.30685, -0.5241014, -1.73725, 1, 0.05490196, 0, 1,
-2.297744, -2.423914, -3.311541, 1, 0.05882353, 0, 1,
-2.293729, 0.7270305, -0.4399305, 1, 0.06666667, 0, 1,
-2.290393, -0.4036079, -1.646023, 1, 0.07058824, 0, 1,
-2.217834, -1.000621, -2.137493, 1, 0.07843138, 0, 1,
-2.164027, 2.659138, -0.9230155, 1, 0.08235294, 0, 1,
-2.15334, -0.5713059, -0.6948696, 1, 0.09019608, 0, 1,
-2.130441, -1.212313, -1.190742, 1, 0.09411765, 0, 1,
-2.084304, 0.6183771, -2.131563, 1, 0.1019608, 0, 1,
-2.049804, 0.2315001, -2.488781, 1, 0.1098039, 0, 1,
-2.008186, 0.7516943, -1.765066, 1, 0.1137255, 0, 1,
-1.997752, -0.2306069, -3.414798, 1, 0.1215686, 0, 1,
-1.963037, -1.691493, -2.446691, 1, 0.1254902, 0, 1,
-1.938895, 0.1462867, -2.5973, 1, 0.1333333, 0, 1,
-1.925779, -0.3604876, -1.383809, 1, 0.1372549, 0, 1,
-1.91963, -0.6353379, -0.5439667, 1, 0.145098, 0, 1,
-1.918596, -0.7203487, -1.563, 1, 0.1490196, 0, 1,
-1.912902, 0.2414908, -2.61989, 1, 0.1568628, 0, 1,
-1.880809, 0.3464486, -0.843477, 1, 0.1607843, 0, 1,
-1.866382, 0.5327252, -1.323481, 1, 0.1686275, 0, 1,
-1.86428, 0.8119489, -0.04892016, 1, 0.172549, 0, 1,
-1.859629, -0.1149833, -2.640263, 1, 0.1803922, 0, 1,
-1.847378, -0.7896571, -1.745501, 1, 0.1843137, 0, 1,
-1.830858, -1.295941, -0.9382622, 1, 0.1921569, 0, 1,
-1.830425, 0.870182, -1.686843, 1, 0.1960784, 0, 1,
-1.817498, 0.3351079, -2.064382, 1, 0.2039216, 0, 1,
-1.799747, -0.202787, -1.750459, 1, 0.2117647, 0, 1,
-1.798798, 1.960186, -0.5849849, 1, 0.2156863, 0, 1,
-1.795788, 0.2755524, 0.09779295, 1, 0.2235294, 0, 1,
-1.791308, -1.210067, -1.370382, 1, 0.227451, 0, 1,
-1.787081, 0.5415662, -1.934454, 1, 0.2352941, 0, 1,
-1.757832, -0.1027696, -1.156545, 1, 0.2392157, 0, 1,
-1.753169, -0.2287057, -0.1128587, 1, 0.2470588, 0, 1,
-1.736038, -2.38092, -3.28711, 1, 0.2509804, 0, 1,
-1.732912, 0.9214551, -2.560319, 1, 0.2588235, 0, 1,
-1.729342, -0.5411081, -1.655029, 1, 0.2627451, 0, 1,
-1.72472, 0.7173886, -0.1474968, 1, 0.2705882, 0, 1,
-1.695369, 0.02058998, -0.9904433, 1, 0.2745098, 0, 1,
-1.694319, -0.6046849, -2.399478, 1, 0.282353, 0, 1,
-1.693133, -0.01151794, -0.3153378, 1, 0.2862745, 0, 1,
-1.681836, -0.9224489, -2.495863, 1, 0.2941177, 0, 1,
-1.679598, -1.472319, -1.988667, 1, 0.3019608, 0, 1,
-1.674269, -0.3819709, 0.0843704, 1, 0.3058824, 0, 1,
-1.631013, -0.1368282, 0.37287, 1, 0.3137255, 0, 1,
-1.623925, 1.302275, 0.07061128, 1, 0.3176471, 0, 1,
-1.622606, -0.1782516, -1.685094, 1, 0.3254902, 0, 1,
-1.620345, 1.545816, -0.3211416, 1, 0.3294118, 0, 1,
-1.592638, 2.139673, -0.03182224, 1, 0.3372549, 0, 1,
-1.569426, 0.1600879, -2.087977, 1, 0.3411765, 0, 1,
-1.565564, 0.4802509, -0.998749, 1, 0.3490196, 0, 1,
-1.565513, -1.206405, -1.84865, 1, 0.3529412, 0, 1,
-1.562492, -0.9800689, -2.789057, 1, 0.3607843, 0, 1,
-1.557993, 0.003475299, -1.859204, 1, 0.3647059, 0, 1,
-1.553845, 0.6046993, -1.619492, 1, 0.372549, 0, 1,
-1.545198, -1.467888, -3.083061, 1, 0.3764706, 0, 1,
-1.537487, -0.7331653, -0.7442343, 1, 0.3843137, 0, 1,
-1.533822, 1.207047, 0.307833, 1, 0.3882353, 0, 1,
-1.517671, -0.5207657, -0.5820831, 1, 0.3960784, 0, 1,
-1.513827, 0.6473095, -0.07609859, 1, 0.4039216, 0, 1,
-1.511795, -0.288314, -0.4970922, 1, 0.4078431, 0, 1,
-1.503982, 0.9756179, -1.180252, 1, 0.4156863, 0, 1,
-1.489213, -0.06131444, -2.083995, 1, 0.4196078, 0, 1,
-1.475396, -0.9017017, -2.231597, 1, 0.427451, 0, 1,
-1.470421, 0.8654722, 0.6459503, 1, 0.4313726, 0, 1,
-1.465999, 1.297285, 0.9328652, 1, 0.4392157, 0, 1,
-1.457555, -0.540298, -0.9396268, 1, 0.4431373, 0, 1,
-1.445151, -0.2803237, -1.005669, 1, 0.4509804, 0, 1,
-1.441716, -0.7310495, -0.7566171, 1, 0.454902, 0, 1,
-1.436726, 0.2473371, -1.915363, 1, 0.4627451, 0, 1,
-1.433206, -0.2455743, -2.447563, 1, 0.4666667, 0, 1,
-1.426575, -0.8832068, -2.477781, 1, 0.4745098, 0, 1,
-1.422755, -0.5694829, -3.741013, 1, 0.4784314, 0, 1,
-1.422337, 0.6126134, -0.874065, 1, 0.4862745, 0, 1,
-1.413889, -0.3737004, -3.606057, 1, 0.4901961, 0, 1,
-1.404844, -0.1441359, -1.823136, 1, 0.4980392, 0, 1,
-1.393594, -0.7042235, -2.896809, 1, 0.5058824, 0, 1,
-1.383343, -1.817144, -1.644652, 1, 0.509804, 0, 1,
-1.380367, -1.055262, -1.577674, 1, 0.5176471, 0, 1,
-1.37413, -1.634493, -2.629972, 1, 0.5215687, 0, 1,
-1.352746, -1.197184, -2.373326, 1, 0.5294118, 0, 1,
-1.352309, 1.121303, 0.2256274, 1, 0.5333334, 0, 1,
-1.34687, 1.195592, 0.5319803, 1, 0.5411765, 0, 1,
-1.343417, -1.084763, -2.341694, 1, 0.5450981, 0, 1,
-1.341254, -0.01306827, 0.7942799, 1, 0.5529412, 0, 1,
-1.335549, -0.7022807, -1.097376, 1, 0.5568628, 0, 1,
-1.33456, 0.1887141, -0.361459, 1, 0.5647059, 0, 1,
-1.331135, 0.3150918, 0.3605562, 1, 0.5686275, 0, 1,
-1.322539, -1.165586, -2.01909, 1, 0.5764706, 0, 1,
-1.317646, -0.7635463, -2.70942, 1, 0.5803922, 0, 1,
-1.316539, 0.5277507, -1.844602, 1, 0.5882353, 0, 1,
-1.310767, 0.1118976, 0.8785525, 1, 0.5921569, 0, 1,
-1.306319, -0.4737736, -2.862428, 1, 0.6, 0, 1,
-1.305085, -0.2398543, -1.931274, 1, 0.6078432, 0, 1,
-1.302398, -1.071836, -3.031921, 1, 0.6117647, 0, 1,
-1.279689, 0.5536783, -0.5332404, 1, 0.6196079, 0, 1,
-1.27768, -0.3339405, -1.10608, 1, 0.6235294, 0, 1,
-1.275833, -0.1946915, -1.654135, 1, 0.6313726, 0, 1,
-1.256478, -0.2363939, -1.93817, 1, 0.6352941, 0, 1,
-1.250449, -0.4598535, -0.6801429, 1, 0.6431373, 0, 1,
-1.248688, 1.110558, 0.4074818, 1, 0.6470588, 0, 1,
-1.242829, -1.029545, -2.413313, 1, 0.654902, 0, 1,
-1.242355, 0.3110119, -1.431747, 1, 0.6588235, 0, 1,
-1.240384, 0.3685869, -1.00486, 1, 0.6666667, 0, 1,
-1.231001, -1.03494, -1.018888, 1, 0.6705883, 0, 1,
-1.229446, -0.4574821, -2.398547, 1, 0.6784314, 0, 1,
-1.224945, -0.376053, -2.306481, 1, 0.682353, 0, 1,
-1.224015, -1.792345, -2.163352, 1, 0.6901961, 0, 1,
-1.222527, -1.293284, -2.003493, 1, 0.6941177, 0, 1,
-1.222051, 0.223024, -2.110435, 1, 0.7019608, 0, 1,
-1.219154, -1.262832, -2.67664, 1, 0.7098039, 0, 1,
-1.216297, 0.952803, -0.4863594, 1, 0.7137255, 0, 1,
-1.215703, -0.4753525, -1.76569, 1, 0.7215686, 0, 1,
-1.214171, -0.4442655, -1.377912, 1, 0.7254902, 0, 1,
-1.213956, -0.6926284, -2.691251, 1, 0.7333333, 0, 1,
-1.208739, -1.255735, -0.9139011, 1, 0.7372549, 0, 1,
-1.206499, -0.2312911, -0.6432347, 1, 0.7450981, 0, 1,
-1.204172, -0.1878639, -2.309434, 1, 0.7490196, 0, 1,
-1.203276, -0.03298851, -0.7409742, 1, 0.7568628, 0, 1,
-1.20066, -0.6922459, -1.072925, 1, 0.7607843, 0, 1,
-1.199346, -0.6449616, -2.089734, 1, 0.7686275, 0, 1,
-1.183964, -1.565531, -1.082713, 1, 0.772549, 0, 1,
-1.177644, -0.9107608, -2.687159, 1, 0.7803922, 0, 1,
-1.169923, -1.555923, -2.631618, 1, 0.7843137, 0, 1,
-1.165761, 0.1287336, -2.41446, 1, 0.7921569, 0, 1,
-1.161376, 0.2235045, -2.640756, 1, 0.7960784, 0, 1,
-1.159822, -0.6084478, -0.1622985, 1, 0.8039216, 0, 1,
-1.15701, 0.3003144, -0.5498136, 1, 0.8117647, 0, 1,
-1.156145, -0.6363139, -3.606954, 1, 0.8156863, 0, 1,
-1.150747, 0.05581801, -0.8224457, 1, 0.8235294, 0, 1,
-1.147967, -2.209726, -0.5753425, 1, 0.827451, 0, 1,
-1.135677, -0.4987203, -1.380114, 1, 0.8352941, 0, 1,
-1.133696, -1.1142, -1.172705, 1, 0.8392157, 0, 1,
-1.132287, 0.4372716, -0.2959108, 1, 0.8470588, 0, 1,
-1.131195, -0.4396718, 0.7181307, 1, 0.8509804, 0, 1,
-1.127281, -0.3106239, -2.762248, 1, 0.8588235, 0, 1,
-1.125989, -2.147477, -1.396884, 1, 0.8627451, 0, 1,
-1.125584, 1.571912, -1.097683, 1, 0.8705882, 0, 1,
-1.124904, 2.482872, -0.1392875, 1, 0.8745098, 0, 1,
-1.122135, 0.4744712, 0.4138489, 1, 0.8823529, 0, 1,
-1.120587, -1.570064, -4.213801, 1, 0.8862745, 0, 1,
-1.119911, 1.890306, -0.9539814, 1, 0.8941177, 0, 1,
-1.11988, -0.5064943, -0.5183697, 1, 0.8980392, 0, 1,
-1.115311, 0.371085, -1.93169, 1, 0.9058824, 0, 1,
-1.103956, 0.1074291, -1.763266, 1, 0.9137255, 0, 1,
-1.097178, 0.3019552, -2.724638, 1, 0.9176471, 0, 1,
-1.092378, -0.6768163, -1.451, 1, 0.9254902, 0, 1,
-1.090971, -0.3187984, -1.032863, 1, 0.9294118, 0, 1,
-1.085611, 1.704718, -1.56547, 1, 0.9372549, 0, 1,
-1.080004, -0.2103254, -1.755072, 1, 0.9411765, 0, 1,
-1.077404, -0.9875729, -2.600821, 1, 0.9490196, 0, 1,
-1.07168, -1.021862, -0.6750945, 1, 0.9529412, 0, 1,
-1.071277, 0.9388021, -1.03443, 1, 0.9607843, 0, 1,
-1.070127, -1.436845, -1.139351, 1, 0.9647059, 0, 1,
-1.064338, -1.585768, -2.786728, 1, 0.972549, 0, 1,
-1.063735, 0.9911227, 1.412163, 1, 0.9764706, 0, 1,
-1.060665, -1.001443, -1.545277, 1, 0.9843137, 0, 1,
-1.059921, -0.2689862, -3.557678, 1, 0.9882353, 0, 1,
-1.059836, -0.8579098, -3.221678, 1, 0.9960784, 0, 1,
-1.051567, -0.1232674, -2.969953, 0.9960784, 1, 0, 1,
-1.038058, -0.2044457, -1.394028, 0.9921569, 1, 0, 1,
-1.020828, 1.985097, -0.7670733, 0.9843137, 1, 0, 1,
-1.016406, -0.3137956, -3.174882, 0.9803922, 1, 0, 1,
-1.008321, -0.178606, -1.341823, 0.972549, 1, 0, 1,
-1.001016, 0.169707, -2.160336, 0.9686275, 1, 0, 1,
-0.9886051, -0.03119897, -1.444352, 0.9607843, 1, 0, 1,
-0.9842799, 0.03170871, -3.694462, 0.9568627, 1, 0, 1,
-0.9832791, 0.4713821, -1.442082, 0.9490196, 1, 0, 1,
-0.9812657, 0.9912992, -0.4035683, 0.945098, 1, 0, 1,
-0.9760553, 0.9340236, -1.431451, 0.9372549, 1, 0, 1,
-0.97497, -2.316475, -4.169415, 0.9333333, 1, 0, 1,
-0.9709565, -0.7333711, -2.148689, 0.9254902, 1, 0, 1,
-0.9605688, 0.6010191, -2.399765, 0.9215686, 1, 0, 1,
-0.9479288, -0.3260565, -0.5133495, 0.9137255, 1, 0, 1,
-0.947013, 0.8737245, 0.002477618, 0.9098039, 1, 0, 1,
-0.9385212, 0.6655223, 0.3649996, 0.9019608, 1, 0, 1,
-0.9363378, -1.744333, -2.892641, 0.8941177, 1, 0, 1,
-0.9335811, -0.1211194, -1.177701, 0.8901961, 1, 0, 1,
-0.9281077, -1.305729, -3.004716, 0.8823529, 1, 0, 1,
-0.917364, -2.330571, -2.37342, 0.8784314, 1, 0, 1,
-0.9106275, 0.7750574, -1.736759, 0.8705882, 1, 0, 1,
-0.910605, -0.09617235, -3.594746, 0.8666667, 1, 0, 1,
-0.9040892, -0.2811388, -1.942147, 0.8588235, 1, 0, 1,
-0.9036465, 1.109286, 0.05857364, 0.854902, 1, 0, 1,
-0.8951572, -1.723515, -2.780333, 0.8470588, 1, 0, 1,
-0.8915191, 2.275775, 0.2633263, 0.8431373, 1, 0, 1,
-0.8913567, 0.2564386, -0.1614154, 0.8352941, 1, 0, 1,
-0.8911375, -1.557197, -1.468726, 0.8313726, 1, 0, 1,
-0.8847364, -0.03970059, -0.7349576, 0.8235294, 1, 0, 1,
-0.8838611, 0.4681143, -1.205226, 0.8196079, 1, 0, 1,
-0.8820372, 0.3595372, -2.226501, 0.8117647, 1, 0, 1,
-0.8756918, -2.099109, -2.714701, 0.8078431, 1, 0, 1,
-0.8727379, 0.6999246, 1.15356, 0.8, 1, 0, 1,
-0.871139, 0.3998466, 0.1901652, 0.7921569, 1, 0, 1,
-0.8702742, -0.4301668, -2.976432, 0.7882353, 1, 0, 1,
-0.8643298, 0.966836, -1.044622, 0.7803922, 1, 0, 1,
-0.8636387, -0.6230973, -1.004526, 0.7764706, 1, 0, 1,
-0.8633823, 0.0142509, -0.8497417, 0.7686275, 1, 0, 1,
-0.8627446, -0.3853453, -1.237807, 0.7647059, 1, 0, 1,
-0.8584931, 1.611809, 0.2999879, 0.7568628, 1, 0, 1,
-0.8543408, -0.3302326, -2.644145, 0.7529412, 1, 0, 1,
-0.8533167, 1.262011, -0.1800433, 0.7450981, 1, 0, 1,
-0.8517798, -1.140456, -3.619024, 0.7411765, 1, 0, 1,
-0.8515113, 0.2853688, -1.832678, 0.7333333, 1, 0, 1,
-0.8462677, -0.4783596, -1.822185, 0.7294118, 1, 0, 1,
-0.8426666, 0.1601636, -1.410195, 0.7215686, 1, 0, 1,
-0.8391013, -0.01271282, -0.5261164, 0.7176471, 1, 0, 1,
-0.8381528, 0.6058017, -0.01259565, 0.7098039, 1, 0, 1,
-0.8368726, -1.023667, -2.406474, 0.7058824, 1, 0, 1,
-0.8235164, 0.8075958, -0.1948287, 0.6980392, 1, 0, 1,
-0.8198241, -0.2501047, -1.467739, 0.6901961, 1, 0, 1,
-0.81728, 1.015184, -1.573764, 0.6862745, 1, 0, 1,
-0.8155187, -1.75724, -1.813637, 0.6784314, 1, 0, 1,
-0.8103366, 0.1104207, -0.6833041, 0.6745098, 1, 0, 1,
-0.8024225, 0.5079384, -2.307451, 0.6666667, 1, 0, 1,
-0.8003122, -1.222673, -1.931453, 0.6627451, 1, 0, 1,
-0.7965619, 1.79694, 0.8842506, 0.654902, 1, 0, 1,
-0.795328, -1.547496, -3.447013, 0.6509804, 1, 0, 1,
-0.7870937, -1.817455, -2.188549, 0.6431373, 1, 0, 1,
-0.7839922, 0.9975592, -2.095733, 0.6392157, 1, 0, 1,
-0.7837628, 0.7730725, -2.940571, 0.6313726, 1, 0, 1,
-0.7814088, 0.08712933, -3.315838, 0.627451, 1, 0, 1,
-0.7739877, -0.150204, -0.1874105, 0.6196079, 1, 0, 1,
-0.7720355, -0.3500645, -1.486351, 0.6156863, 1, 0, 1,
-0.7655867, 1.188998, -2.322819, 0.6078432, 1, 0, 1,
-0.761252, 1.323598, -0.7872548, 0.6039216, 1, 0, 1,
-0.7600861, 0.7891966, -0.6172711, 0.5960785, 1, 0, 1,
-0.7593601, -1.314081, -1.223203, 0.5882353, 1, 0, 1,
-0.7558107, 0.8876022, -1.873514, 0.5843138, 1, 0, 1,
-0.753207, -0.9770817, -2.142603, 0.5764706, 1, 0, 1,
-0.752689, 0.4327641, -1.58991, 0.572549, 1, 0, 1,
-0.7508489, 0.361211, -0.2831738, 0.5647059, 1, 0, 1,
-0.7484235, 0.9029142, -0.827021, 0.5607843, 1, 0, 1,
-0.745038, 0.795172, 1.479086, 0.5529412, 1, 0, 1,
-0.744266, -0.2151967, -1.173234, 0.5490196, 1, 0, 1,
-0.743331, 0.1589557, -2.8251, 0.5411765, 1, 0, 1,
-0.7425653, 0.9845424, -0.2523099, 0.5372549, 1, 0, 1,
-0.7416519, 2.114824, 0.5130969, 0.5294118, 1, 0, 1,
-0.7399492, -2.38454, -2.848256, 0.5254902, 1, 0, 1,
-0.7340613, -1.146144, -2.450385, 0.5176471, 1, 0, 1,
-0.7334203, 0.02336695, -2.947825, 0.5137255, 1, 0, 1,
-0.7325136, 1.042776, -0.2471871, 0.5058824, 1, 0, 1,
-0.7304749, -0.175209, -2.098197, 0.5019608, 1, 0, 1,
-0.7258648, 1.384328, -2.455452, 0.4941176, 1, 0, 1,
-0.7255015, 0.7607267, -1.525687, 0.4862745, 1, 0, 1,
-0.7249413, -0.3256416, -1.677245, 0.4823529, 1, 0, 1,
-0.7248563, 0.3622032, -1.536708, 0.4745098, 1, 0, 1,
-0.7198085, 0.3124963, -2.017453, 0.4705882, 1, 0, 1,
-0.7181029, -0.2721014, -2.91877, 0.4627451, 1, 0, 1,
-0.7109631, 1.304018, -1.995352, 0.4588235, 1, 0, 1,
-0.7072825, -0.4925108, -1.824348, 0.4509804, 1, 0, 1,
-0.704622, 1.293504, 0.5461242, 0.4470588, 1, 0, 1,
-0.702502, -2.09041, -2.637356, 0.4392157, 1, 0, 1,
-0.7009798, -0.8609176, -2.67961, 0.4352941, 1, 0, 1,
-0.7008603, -1.141429, -2.049634, 0.427451, 1, 0, 1,
-0.6948525, -1.803789, -6.190607, 0.4235294, 1, 0, 1,
-0.6940705, 0.5879829, -0.8800746, 0.4156863, 1, 0, 1,
-0.6911867, -1.348274, -3.352671, 0.4117647, 1, 0, 1,
-0.6880385, -0.4347773, -1.422268, 0.4039216, 1, 0, 1,
-0.6876741, 1.072238, -0.3305293, 0.3960784, 1, 0, 1,
-0.687643, -0.2585264, -2.639791, 0.3921569, 1, 0, 1,
-0.6832955, -0.3950916, -3.49309, 0.3843137, 1, 0, 1,
-0.6803181, 0.3158308, -1.13075, 0.3803922, 1, 0, 1,
-0.6773987, -2.11971, -2.660479, 0.372549, 1, 0, 1,
-0.6594499, 1.732292, -0.4687327, 0.3686275, 1, 0, 1,
-0.659111, 0.5222182, -1.885222, 0.3607843, 1, 0, 1,
-0.6583735, -0.8826488, -3.465775, 0.3568628, 1, 0, 1,
-0.6582774, -0.5290202, -1.819205, 0.3490196, 1, 0, 1,
-0.6574808, 0.4029487, -1.844552, 0.345098, 1, 0, 1,
-0.6558357, 0.7540368, -1.445488, 0.3372549, 1, 0, 1,
-0.6527289, 1.037944, -1.90684, 0.3333333, 1, 0, 1,
-0.6476151, -0.9854631, -4.394803, 0.3254902, 1, 0, 1,
-0.6459069, 1.053455, -1.623922, 0.3215686, 1, 0, 1,
-0.6453097, 0.1915383, -1.477342, 0.3137255, 1, 0, 1,
-0.6404224, 0.3871786, -1.202309, 0.3098039, 1, 0, 1,
-0.6308551, 1.610129, 0.6385732, 0.3019608, 1, 0, 1,
-0.628063, -0.08066058, -1.104133, 0.2941177, 1, 0, 1,
-0.6256168, 0.7578443, 0.8787004, 0.2901961, 1, 0, 1,
-0.618517, -1.314479, -2.054185, 0.282353, 1, 0, 1,
-0.6159378, 0.9356202, -0.3761111, 0.2784314, 1, 0, 1,
-0.6157021, -2.142203, -3.671163, 0.2705882, 1, 0, 1,
-0.6148825, -0.404224, -1.908933, 0.2666667, 1, 0, 1,
-0.6113134, -0.8458624, -0.8337322, 0.2588235, 1, 0, 1,
-0.6065555, 1.503671, -2.423067, 0.254902, 1, 0, 1,
-0.6061792, 1.709907, 0.8293638, 0.2470588, 1, 0, 1,
-0.6058452, 1.108272, 0.05450895, 0.2431373, 1, 0, 1,
-0.6037317, -0.398629, -1.32232, 0.2352941, 1, 0, 1,
-0.5899133, 2.575238, 0.4320509, 0.2313726, 1, 0, 1,
-0.5837756, -1.156663, -3.096287, 0.2235294, 1, 0, 1,
-0.577708, 0.4902253, -1.174813, 0.2196078, 1, 0, 1,
-0.5737153, 0.2513583, -3.991253, 0.2117647, 1, 0, 1,
-0.5719814, 0.4717691, -2.291884, 0.2078431, 1, 0, 1,
-0.5711091, -1.597436, -2.464227, 0.2, 1, 0, 1,
-0.5681372, -0.3929725, -2.261393, 0.1921569, 1, 0, 1,
-0.5664021, -0.6573837, -0.7042408, 0.1882353, 1, 0, 1,
-0.5621008, 0.1666777, -1.19581, 0.1803922, 1, 0, 1,
-0.5580769, -0.01681089, -2.474552, 0.1764706, 1, 0, 1,
-0.5558193, -1.123825, -1.999093, 0.1686275, 1, 0, 1,
-0.5548961, -1.059105, -2.927194, 0.1647059, 1, 0, 1,
-0.5481454, 0.154921, -1.565599, 0.1568628, 1, 0, 1,
-0.54535, -0.6399401, 0.07945481, 0.1529412, 1, 0, 1,
-0.5450535, -1.258494, -3.953241, 0.145098, 1, 0, 1,
-0.5431433, -1.878493, -2.382025, 0.1411765, 1, 0, 1,
-0.5399008, 0.1692856, -1.605058, 0.1333333, 1, 0, 1,
-0.539689, 0.2009171, -1.301058, 0.1294118, 1, 0, 1,
-0.5298967, 0.4735067, -0.1801065, 0.1215686, 1, 0, 1,
-0.525016, -0.6627235, -3.009128, 0.1176471, 1, 0, 1,
-0.5205612, -0.2940708, -0.8130155, 0.1098039, 1, 0, 1,
-0.5194511, -0.7462358, -3.315853, 0.1058824, 1, 0, 1,
-0.5191234, -0.06667887, -2.183806, 0.09803922, 1, 0, 1,
-0.5183814, -0.8870845, -0.4802056, 0.09019608, 1, 0, 1,
-0.513864, -0.0927018, -2.953267, 0.08627451, 1, 0, 1,
-0.5091067, -1.153094, -3.86796, 0.07843138, 1, 0, 1,
-0.5088316, -0.9045506, -2.043006, 0.07450981, 1, 0, 1,
-0.5085613, 0.2476325, -0.9389769, 0.06666667, 1, 0, 1,
-0.5054277, -0.3612528, -2.272126, 0.0627451, 1, 0, 1,
-0.5038646, 0.223793, -0.4692139, 0.05490196, 1, 0, 1,
-0.5037997, 1.000005, -0.8066794, 0.05098039, 1, 0, 1,
-0.5008214, 0.6722519, -0.8249552, 0.04313726, 1, 0, 1,
-0.4985331, 2.362579, -0.1805477, 0.03921569, 1, 0, 1,
-0.4963132, 0.7555097, -1.254032, 0.03137255, 1, 0, 1,
-0.4947309, 0.1240393, -1.066867, 0.02745098, 1, 0, 1,
-0.4916013, -0.6982535, -2.720549, 0.01960784, 1, 0, 1,
-0.4907786, 0.5385277, -1.443115, 0.01568628, 1, 0, 1,
-0.4903205, 1.985831, -1.706847, 0.007843138, 1, 0, 1,
-0.4887568, 0.2701362, -1.620935, 0.003921569, 1, 0, 1,
-0.4884937, 0.125069, -1.080986, 0, 1, 0.003921569, 1,
-0.488134, 0.4911056, -0.7125654, 0, 1, 0.01176471, 1,
-0.4749396, -0.4671125, -1.398186, 0, 1, 0.01568628, 1,
-0.4739946, 1.623335, -1.032111, 0, 1, 0.02352941, 1,
-0.4682039, -0.7081434, -3.306582, 0, 1, 0.02745098, 1,
-0.4663668, 0.6829803, -1.005473, 0, 1, 0.03529412, 1,
-0.4654648, 1.052111, -1.044822, 0, 1, 0.03921569, 1,
-0.4650425, 1.283751, -0.1142158, 0, 1, 0.04705882, 1,
-0.4645106, -0.4966518, -0.6664983, 0, 1, 0.05098039, 1,
-0.46436, 1.189846, 0.0679259, 0, 1, 0.05882353, 1,
-0.4557634, -0.9043511, -1.658537, 0, 1, 0.0627451, 1,
-0.4539744, -0.9728473, -3.834067, 0, 1, 0.07058824, 1,
-0.4434564, -0.5923751, -2.191214, 0, 1, 0.07450981, 1,
-0.4424039, 0.2805589, -0.4435536, 0, 1, 0.08235294, 1,
-0.4389801, -0.6356652, -1.267748, 0, 1, 0.08627451, 1,
-0.4344477, 2.106663, -1.077943, 0, 1, 0.09411765, 1,
-0.4336095, 0.4212244, -0.05516509, 0, 1, 0.1019608, 1,
-0.4291531, 0.1124662, -2.660691, 0, 1, 0.1058824, 1,
-0.4288881, -0.5535671, -1.541149, 0, 1, 0.1137255, 1,
-0.4282564, -1.973665, -2.046843, 0, 1, 0.1176471, 1,
-0.4279874, -0.3162305, -2.88925, 0, 1, 0.1254902, 1,
-0.4259225, 0.05251202, -1.901919, 0, 1, 0.1294118, 1,
-0.4255896, -0.4360054, -4.238384, 0, 1, 0.1372549, 1,
-0.4166971, 1.568874, 0.09499333, 0, 1, 0.1411765, 1,
-0.4092763, -0.01035577, 0.3719805, 0, 1, 0.1490196, 1,
-0.4084959, 0.0003961966, -2.365415, 0, 1, 0.1529412, 1,
-0.4084634, 0.5617736, -2.380589, 0, 1, 0.1607843, 1,
-0.4068161, 1.532961, -1.704188, 0, 1, 0.1647059, 1,
-0.4056732, 0.1866965, -1.533855, 0, 1, 0.172549, 1,
-0.3993779, 1.282726, -1.437959, 0, 1, 0.1764706, 1,
-0.3987701, -1.180785, -3.793407, 0, 1, 0.1843137, 1,
-0.3979434, 0.8287197, 0.9332577, 0, 1, 0.1882353, 1,
-0.3944125, -0.3483269, -3.492635, 0, 1, 0.1960784, 1,
-0.39387, 1.204357, -1.571073, 0, 1, 0.2039216, 1,
-0.3928076, 0.4775838, -1.305981, 0, 1, 0.2078431, 1,
-0.3896776, -1.419998, -3.181586, 0, 1, 0.2156863, 1,
-0.3875151, -0.2182085, -2.816101, 0, 1, 0.2196078, 1,
-0.3849302, 0.036881, 0.1069787, 0, 1, 0.227451, 1,
-0.381084, -0.54907, -2.278739, 0, 1, 0.2313726, 1,
-0.3785911, -0.8675027, -2.542922, 0, 1, 0.2392157, 1,
-0.3731948, 1.500733, 0.4560629, 0, 1, 0.2431373, 1,
-0.3676119, 1.193846, -1.989503, 0, 1, 0.2509804, 1,
-0.3669364, -1.619335, -4.001808, 0, 1, 0.254902, 1,
-0.3663889, 0.1766437, -1.550827, 0, 1, 0.2627451, 1,
-0.3599696, 0.4860947, -1.286589, 0, 1, 0.2666667, 1,
-0.3592375, -1.843134, -3.717355, 0, 1, 0.2745098, 1,
-0.3581054, 1.222544, -0.9505035, 0, 1, 0.2784314, 1,
-0.3579919, -0.7975957, -1.873872, 0, 1, 0.2862745, 1,
-0.3577659, 1.802684, -1.72983, 0, 1, 0.2901961, 1,
-0.3566271, 0.08776543, -1.315414, 0, 1, 0.2980392, 1,
-0.356178, 0.255565, -1.727023, 0, 1, 0.3058824, 1,
-0.3547843, 2.378211, -0.1060635, 0, 1, 0.3098039, 1,
-0.3545067, 0.2718175, -0.1559627, 0, 1, 0.3176471, 1,
-0.3537816, -2.112364, -3.49929, 0, 1, 0.3215686, 1,
-0.3528756, 1.661973, 0.9269338, 0, 1, 0.3294118, 1,
-0.3503893, 0.5219494, -2.782723, 0, 1, 0.3333333, 1,
-0.3501618, 0.02153548, -2.582565, 0, 1, 0.3411765, 1,
-0.3491398, 0.3439445, -1.940105, 0, 1, 0.345098, 1,
-0.3471516, -0.2275684, -1.449186, 0, 1, 0.3529412, 1,
-0.3469423, 0.5216442, 0.5262072, 0, 1, 0.3568628, 1,
-0.3410104, -1.506219, -3.952284, 0, 1, 0.3647059, 1,
-0.3365241, -1.32169, -3.43637, 0, 1, 0.3686275, 1,
-0.3326568, -1.464127, -2.863917, 0, 1, 0.3764706, 1,
-0.3221591, -0.1197155, -0.8688585, 0, 1, 0.3803922, 1,
-0.3188587, -0.3637306, -2.487638, 0, 1, 0.3882353, 1,
-0.3100919, 0.25434, -0.9476811, 0, 1, 0.3921569, 1,
-0.3098632, 0.3065866, 0.1017225, 0, 1, 0.4, 1,
-0.3097933, 1.082469, 2.393697, 0, 1, 0.4078431, 1,
-0.3081056, 2.138806, -0.5165114, 0, 1, 0.4117647, 1,
-0.3055383, -0.266142, -2.203976, 0, 1, 0.4196078, 1,
-0.3029212, 2.016338, 1.796669, 0, 1, 0.4235294, 1,
-0.3013135, 1.955197, -2.005832, 0, 1, 0.4313726, 1,
-0.2983009, -1.790164, -1.914356, 0, 1, 0.4352941, 1,
-0.2963361, -0.7674635, -3.43573, 0, 1, 0.4431373, 1,
-0.2956844, -0.4048653, -2.946315, 0, 1, 0.4470588, 1,
-0.2941996, -0.5556149, -2.168358, 0, 1, 0.454902, 1,
-0.2934236, -0.5054069, -1.935979, 0, 1, 0.4588235, 1,
-0.2933892, 0.1542281, -2.110433, 0, 1, 0.4666667, 1,
-0.2897168, -0.3045583, -2.466194, 0, 1, 0.4705882, 1,
-0.2869121, 0.2217027, -0.5566761, 0, 1, 0.4784314, 1,
-0.2831412, 1.080042, 3.168398, 0, 1, 0.4823529, 1,
-0.2815264, -0.7877793, -3.913482, 0, 1, 0.4901961, 1,
-0.2805685, -0.4251753, -2.431194, 0, 1, 0.4941176, 1,
-0.2802964, -0.08461697, -2.317661, 0, 1, 0.5019608, 1,
-0.27689, 1.008446, 0.7026315, 0, 1, 0.509804, 1,
-0.2751561, 0.05921692, -0.4032545, 0, 1, 0.5137255, 1,
-0.2745197, 1.528358, 0.8505341, 0, 1, 0.5215687, 1,
-0.2729952, -0.692424, -3.685124, 0, 1, 0.5254902, 1,
-0.2673092, -0.3391607, -2.405956, 0, 1, 0.5333334, 1,
-0.2659871, -1.911606, -1.891116, 0, 1, 0.5372549, 1,
-0.2658908, -1.020089, -1.093513, 0, 1, 0.5450981, 1,
-0.261669, -0.1303234, -2.077465, 0, 1, 0.5490196, 1,
-0.2566341, 0.6208988, -0.6923832, 0, 1, 0.5568628, 1,
-0.2547905, 0.4031383, -0.9067909, 0, 1, 0.5607843, 1,
-0.2541827, 2.373347, -1.51296, 0, 1, 0.5686275, 1,
-0.2530428, -1.305283, -2.602541, 0, 1, 0.572549, 1,
-0.2506658, 0.8766896, 0.6780403, 0, 1, 0.5803922, 1,
-0.2504869, 0.8064867, 1.286053, 0, 1, 0.5843138, 1,
-0.2492308, 1.053238, -1.175378, 0, 1, 0.5921569, 1,
-0.2480341, 1.544933, -1.4349, 0, 1, 0.5960785, 1,
-0.2479016, -1.203658, -0.5252384, 0, 1, 0.6039216, 1,
-0.2437739, -0.6063058, -2.222675, 0, 1, 0.6117647, 1,
-0.2404344, 1.262008, -2.827181, 0, 1, 0.6156863, 1,
-0.2389807, -0.1640318, -1.009065, 0, 1, 0.6235294, 1,
-0.2382759, -0.4319404, -3.163151, 0, 1, 0.627451, 1,
-0.2326238, 0.3284316, -0.7035624, 0, 1, 0.6352941, 1,
-0.2307028, 0.3770168, 0.07565586, 0, 1, 0.6392157, 1,
-0.2216257, -2.155668, -3.149292, 0, 1, 0.6470588, 1,
-0.2142072, -2.080286, -3.083434, 0, 1, 0.6509804, 1,
-0.2109655, 0.7216827, -1.551941, 0, 1, 0.6588235, 1,
-0.2098002, 1.079097, -1.135748, 0, 1, 0.6627451, 1,
-0.2069114, -1.163176, -2.790375, 0, 1, 0.6705883, 1,
-0.2059049, 0.1838929, -0.9838084, 0, 1, 0.6745098, 1,
-0.202233, -0.8681049, -2.932651, 0, 1, 0.682353, 1,
-0.2016044, 0.319704, -0.5380655, 0, 1, 0.6862745, 1,
-0.1962495, -1.883817, -2.462728, 0, 1, 0.6941177, 1,
-0.1955877, 0.8099638, 2.324175, 0, 1, 0.7019608, 1,
-0.1955135, 1.009505, 0.3053804, 0, 1, 0.7058824, 1,
-0.1947242, 0.1437362, -1.36533, 0, 1, 0.7137255, 1,
-0.1901173, -0.4657112, -3.052852, 0, 1, 0.7176471, 1,
-0.1896198, -1.588245, -3.25655, 0, 1, 0.7254902, 1,
-0.1876732, 0.5675886, -1.92079, 0, 1, 0.7294118, 1,
-0.1839839, -0.5691713, -1.819296, 0, 1, 0.7372549, 1,
-0.1824455, -0.6164432, -1.612674, 0, 1, 0.7411765, 1,
-0.1739899, 0.9897891, -0.07295964, 0, 1, 0.7490196, 1,
-0.1722067, -1.273303, -3.786935, 0, 1, 0.7529412, 1,
-0.1720442, 1.51294, 0.981573, 0, 1, 0.7607843, 1,
-0.1700196, 1.514512, 1.107303, 0, 1, 0.7647059, 1,
-0.1636212, -0.2844337, -3.214494, 0, 1, 0.772549, 1,
-0.1622857, 0.3055698, 1.002756, 0, 1, 0.7764706, 1,
-0.1611768, 0.1743773, -2.007855, 0, 1, 0.7843137, 1,
-0.1562293, 0.5151774, -1.327291, 0, 1, 0.7882353, 1,
-0.1537415, 0.2119528, -0.729291, 0, 1, 0.7960784, 1,
-0.1531785, 0.4051379, -0.2831228, 0, 1, 0.8039216, 1,
-0.1501002, 1.831769, -0.05540236, 0, 1, 0.8078431, 1,
-0.1460421, 0.1826376, -0.9997818, 0, 1, 0.8156863, 1,
-0.1456181, 0.1023872, -0.1523708, 0, 1, 0.8196079, 1,
-0.1446426, -0.2454002, -0.9373028, 0, 1, 0.827451, 1,
-0.1442536, 0.6050526, -1.479308, 0, 1, 0.8313726, 1,
-0.1432498, 0.3660384, -0.6408138, 0, 1, 0.8392157, 1,
-0.1403842, -2.750032, -3.126076, 0, 1, 0.8431373, 1,
-0.1398659, -1.173323, -3.538804, 0, 1, 0.8509804, 1,
-0.1398485, 0.3435776, 0.2334305, 0, 1, 0.854902, 1,
-0.1382331, -0.1804938, -3.777404, 0, 1, 0.8627451, 1,
-0.1352875, -0.7451242, -3.560817, 0, 1, 0.8666667, 1,
-0.130336, 1.807771, -1.236544, 0, 1, 0.8745098, 1,
-0.1287001, -0.4826773, -2.538893, 0, 1, 0.8784314, 1,
-0.1269366, 0.2731128, 1.045579, 0, 1, 0.8862745, 1,
-0.1259174, 0.8906832, -0.2080069, 0, 1, 0.8901961, 1,
-0.1253741, -1.686185, -1.679573, 0, 1, 0.8980392, 1,
-0.1181922, -1.475946, -4.068483, 0, 1, 0.9058824, 1,
-0.1155432, -1.037374, -3.458441, 0, 1, 0.9098039, 1,
-0.1142856, -0.2502083, -2.441138, 0, 1, 0.9176471, 1,
-0.1125229, -0.09114842, -3.089437, 0, 1, 0.9215686, 1,
-0.1107584, -0.2147889, -1.746411, 0, 1, 0.9294118, 1,
-0.1022327, -1.206781, -3.527234, 0, 1, 0.9333333, 1,
-0.09672519, 0.09527156, -0.8554435, 0, 1, 0.9411765, 1,
-0.09627412, 0.09807421, -0.9874684, 0, 1, 0.945098, 1,
-0.09433533, 1.249699, -0.2125073, 0, 1, 0.9529412, 1,
-0.09273812, -0.5038841, -5.588383, 0, 1, 0.9568627, 1,
-0.08935084, 1.15642, -0.1623466, 0, 1, 0.9647059, 1,
-0.08926336, 0.1117756, -0.7753147, 0, 1, 0.9686275, 1,
-0.08865046, 0.3009475, 0.3956671, 0, 1, 0.9764706, 1,
-0.08859462, 0.2428516, 0.2342547, 0, 1, 0.9803922, 1,
-0.08691379, 0.6521074, -0.4927104, 0, 1, 0.9882353, 1,
-0.08459137, 0.06776358, -2.038729, 0, 1, 0.9921569, 1,
-0.08398221, -0.8530784, -1.883912, 0, 1, 1, 1,
-0.0813958, 1.896145, -0.8025479, 0, 0.9921569, 1, 1,
-0.08018965, 0.8818174, -0.1867926, 0, 0.9882353, 1, 1,
-0.08003747, -0.9411861, -4.428132, 0, 0.9803922, 1, 1,
-0.07575344, 0.5046759, 1.550493, 0, 0.9764706, 1, 1,
-0.07559447, -0.5672503, -2.772289, 0, 0.9686275, 1, 1,
-0.07552588, -0.3201721, -3.455198, 0, 0.9647059, 1, 1,
-0.07258841, -0.2120262, -2.955496, 0, 0.9568627, 1, 1,
-0.07165332, -1.336508, -3.070166, 0, 0.9529412, 1, 1,
-0.0662836, 0.2282711, -0.4727349, 0, 0.945098, 1, 1,
-0.06311996, -0.0008662093, -1.154176, 0, 0.9411765, 1, 1,
-0.06056378, -0.08566358, -2.951662, 0, 0.9333333, 1, 1,
-0.05618693, -1.120822, -4.425605, 0, 0.9294118, 1, 1,
-0.05553775, 0.6327534, -0.8966151, 0, 0.9215686, 1, 1,
-0.05276849, -0.9405801, -4.444062, 0, 0.9176471, 1, 1,
-0.05173076, 1.075574, -1.556518, 0, 0.9098039, 1, 1,
-0.05096608, 0.4029456, -0.1630547, 0, 0.9058824, 1, 1,
-0.05085956, 1.178997, 0.246742, 0, 0.8980392, 1, 1,
-0.04464225, 0.005615018, -1.919387, 0, 0.8901961, 1, 1,
-0.04425365, 0.8831295, -0.1227302, 0, 0.8862745, 1, 1,
-0.03834084, -0.7608182, -2.191504, 0, 0.8784314, 1, 1,
-0.03587807, -0.02026022, -2.430715, 0, 0.8745098, 1, 1,
-0.03220115, -0.7110516, -3.054253, 0, 0.8666667, 1, 1,
-0.0298128, 0.2696512, -2.547213, 0, 0.8627451, 1, 1,
-0.0236084, -0.2114406, -3.609886, 0, 0.854902, 1, 1,
-0.01891216, -2.29116, -4.022473, 0, 0.8509804, 1, 1,
-0.0149498, 0.6545085, 1.012106, 0, 0.8431373, 1, 1,
-0.01490388, -1.509624, -3.180523, 0, 0.8392157, 1, 1,
-0.01332342, -0.8934625, -1.886416, 0, 0.8313726, 1, 1,
-0.01266292, 0.2170844, -0.785719, 0, 0.827451, 1, 1,
-0.01158108, -1.429548, -2.904723, 0, 0.8196079, 1, 1,
-0.009953656, -0.3375295, -3.697709, 0, 0.8156863, 1, 1,
-0.00971315, 0.549673, -0.6129643, 0, 0.8078431, 1, 1,
-0.003367371, -1.14368, -2.343614, 0, 0.8039216, 1, 1,
0.003556465, -0.8797405, 4.470656, 0, 0.7960784, 1, 1,
0.00469923, -0.2644729, 3.313993, 0, 0.7882353, 1, 1,
0.005254415, -0.8738114, 3.627881, 0, 0.7843137, 1, 1,
0.008546758, -0.2022263, 3.099199, 0, 0.7764706, 1, 1,
0.010353, 1.176742, -0.0780887, 0, 0.772549, 1, 1,
0.01077875, 0.4471456, 0.5675984, 0, 0.7647059, 1, 1,
0.01485875, -1.052009, 2.872258, 0, 0.7607843, 1, 1,
0.01627829, 2.757095, 0.8922809, 0, 0.7529412, 1, 1,
0.02410758, 0.6960669, -1.217063, 0, 0.7490196, 1, 1,
0.02435872, 0.2774242, 0.5427564, 0, 0.7411765, 1, 1,
0.02460451, -1.177997, 3.455897, 0, 0.7372549, 1, 1,
0.0248403, 1.975146, 0.8265917, 0, 0.7294118, 1, 1,
0.02630324, 1.592623, 0.2024088, 0, 0.7254902, 1, 1,
0.03121036, 1.924613, -0.6136847, 0, 0.7176471, 1, 1,
0.03308163, 0.4072115, -0.1691007, 0, 0.7137255, 1, 1,
0.0339858, 0.4793858, -0.3297076, 0, 0.7058824, 1, 1,
0.03500797, 0.1469437, 1.199897, 0, 0.6980392, 1, 1,
0.03765326, -0.1636111, 1.551595, 0, 0.6941177, 1, 1,
0.03784416, 0.9798515, -0.7407542, 0, 0.6862745, 1, 1,
0.04128212, 1.440786, -0.4681398, 0, 0.682353, 1, 1,
0.0432316, -1.19152, 1.595977, 0, 0.6745098, 1, 1,
0.04497005, 1.419835, -0.731799, 0, 0.6705883, 1, 1,
0.04593311, -1.378215, 4.107603, 0, 0.6627451, 1, 1,
0.04736007, 0.9173496, -0.6826584, 0, 0.6588235, 1, 1,
0.05287411, -0.3703494, 2.56903, 0, 0.6509804, 1, 1,
0.05368408, 0.8134899, 0.1949167, 0, 0.6470588, 1, 1,
0.05408979, 1.249778, 2.559782, 0, 0.6392157, 1, 1,
0.06213047, -0.03804678, 3.037061, 0, 0.6352941, 1, 1,
0.0630803, 1.026538, 0.4516074, 0, 0.627451, 1, 1,
0.06324998, -0.9937065, 2.690747, 0, 0.6235294, 1, 1,
0.06454217, 1.721261, 0.598401, 0, 0.6156863, 1, 1,
0.07269417, 0.04757877, 0.364548, 0, 0.6117647, 1, 1,
0.07585565, 0.816134, 0.136237, 0, 0.6039216, 1, 1,
0.07599978, -0.03731655, 2.370557, 0, 0.5960785, 1, 1,
0.08019536, -2.022713, 2.474903, 0, 0.5921569, 1, 1,
0.08114112, 0.5235419, -0.8120666, 0, 0.5843138, 1, 1,
0.0815405, 0.483131, -0.09837454, 0, 0.5803922, 1, 1,
0.08605535, 0.7201856, 0.8999442, 0, 0.572549, 1, 1,
0.08641228, -0.6489506, 4.846506, 0, 0.5686275, 1, 1,
0.09094192, 0.08857714, 0.3342858, 0, 0.5607843, 1, 1,
0.09173486, 1.156588, 0.01199259, 0, 0.5568628, 1, 1,
0.09279475, -0.1148576, 2.131314, 0, 0.5490196, 1, 1,
0.0935811, 1.144272, 1.302701, 0, 0.5450981, 1, 1,
0.09404353, -0.9561947, 3.697925, 0, 0.5372549, 1, 1,
0.09414743, 2.281223, 0.9019561, 0, 0.5333334, 1, 1,
0.09596111, -0.7601186, 2.774088, 0, 0.5254902, 1, 1,
0.09749819, 1.060572, 0.7600316, 0, 0.5215687, 1, 1,
0.1136139, 0.4919912, -0.06016773, 0, 0.5137255, 1, 1,
0.1165539, -0.5819222, 2.632872, 0, 0.509804, 1, 1,
0.1170409, -0.9326892, 2.716055, 0, 0.5019608, 1, 1,
0.1175546, 0.7598638, 0.5455928, 0, 0.4941176, 1, 1,
0.1228156, 0.4243941, 0.6452575, 0, 0.4901961, 1, 1,
0.1246832, -0.1392542, 3.79502, 0, 0.4823529, 1, 1,
0.1247606, -1.360369, 3.826506, 0, 0.4784314, 1, 1,
0.1258948, 1.457997, -0.7087508, 0, 0.4705882, 1, 1,
0.126338, -0.703358, 2.365776, 0, 0.4666667, 1, 1,
0.1308973, 0.5269353, 3.141477, 0, 0.4588235, 1, 1,
0.1364188, -0.7759624, 1.87325, 0, 0.454902, 1, 1,
0.139281, 0.1146801, 0.6126657, 0, 0.4470588, 1, 1,
0.1444904, -0.2916351, 3.570975, 0, 0.4431373, 1, 1,
0.147289, 0.8982885, -1.262074, 0, 0.4352941, 1, 1,
0.1485717, 0.5257886, 1.665649, 0, 0.4313726, 1, 1,
0.1496622, -2.077525, 2.776416, 0, 0.4235294, 1, 1,
0.1548927, -0.3235372, 2.660175, 0, 0.4196078, 1, 1,
0.1580259, 1.181413, 0.1917257, 0, 0.4117647, 1, 1,
0.158519, -2.668674, 2.795089, 0, 0.4078431, 1, 1,
0.1587452, 0.6142388, -0.08211552, 0, 0.4, 1, 1,
0.1626639, 0.1865442, -1.541537, 0, 0.3921569, 1, 1,
0.1627824, 0.03288865, 2.730146, 0, 0.3882353, 1, 1,
0.1634765, 0.2458047, 0.7167425, 0, 0.3803922, 1, 1,
0.1676137, -0.396429, 1.05976, 0, 0.3764706, 1, 1,
0.1688641, -0.05882867, 2.340411, 0, 0.3686275, 1, 1,
0.1701368, 1.113748, 2.449284, 0, 0.3647059, 1, 1,
0.1704908, 2.18448, -1.107475, 0, 0.3568628, 1, 1,
0.17431, -0.366673, 3.153111, 0, 0.3529412, 1, 1,
0.1756446, -0.1538026, 2.45369, 0, 0.345098, 1, 1,
0.1771223, 1.323559, 0.6406516, 0, 0.3411765, 1, 1,
0.1797958, -0.8305622, 2.714839, 0, 0.3333333, 1, 1,
0.18235, -1.080834, 5.273203, 0, 0.3294118, 1, 1,
0.1873078, 1.619488, 0.3192485, 0, 0.3215686, 1, 1,
0.1929494, 0.7985895, -0.391076, 0, 0.3176471, 1, 1,
0.1932297, 1.780006, -0.09438696, 0, 0.3098039, 1, 1,
0.1977422, -0.2427967, 2.433517, 0, 0.3058824, 1, 1,
0.2017908, 1.918698, -0.071148, 0, 0.2980392, 1, 1,
0.2088314, -0.8564332, 2.441842, 0, 0.2901961, 1, 1,
0.2124319, 0.4723611, 0.2570588, 0, 0.2862745, 1, 1,
0.214121, 1.313764, -0.7545199, 0, 0.2784314, 1, 1,
0.2164378, -1.036023, 2.600828, 0, 0.2745098, 1, 1,
0.2188243, -0.176607, 2.716979, 0, 0.2666667, 1, 1,
0.2237151, 1.054062, 1.052638, 0, 0.2627451, 1, 1,
0.2261884, -0.8179551, 3.069835, 0, 0.254902, 1, 1,
0.2273577, 0.2839155, 0.4341215, 0, 0.2509804, 1, 1,
0.2286496, 0.5678897, 0.6258001, 0, 0.2431373, 1, 1,
0.228896, 0.4256751, -0.8159051, 0, 0.2392157, 1, 1,
0.2299764, 2.189239, 0.6107267, 0, 0.2313726, 1, 1,
0.2312498, 0.2343874, -0.6722688, 0, 0.227451, 1, 1,
0.2345124, -0.6160752, 3.739273, 0, 0.2196078, 1, 1,
0.2348094, -0.291158, 1.61888, 0, 0.2156863, 1, 1,
0.2412718, -2.043594, 1.705489, 0, 0.2078431, 1, 1,
0.243907, 0.2663783, 0.7456867, 0, 0.2039216, 1, 1,
0.2491387, -2.428609, 3.185952, 0, 0.1960784, 1, 1,
0.2492116, 0.6949327, 0.1496338, 0, 0.1882353, 1, 1,
0.2492138, 0.9324776, 0.8322973, 0, 0.1843137, 1, 1,
0.2531132, 1.989994, -0.05384351, 0, 0.1764706, 1, 1,
0.2551181, 0.6375242, 1.592959, 0, 0.172549, 1, 1,
0.2564667, -1.007123, 3.116281, 0, 0.1647059, 1, 1,
0.2613127, -0.02238242, 0.957433, 0, 0.1607843, 1, 1,
0.2618626, -1.45648, 2.38032, 0, 0.1529412, 1, 1,
0.2634334, -0.9493588, 1.650411, 0, 0.1490196, 1, 1,
0.2635358, 0.6184222, -0.4082032, 0, 0.1411765, 1, 1,
0.2640787, -1.231687, 2.338799, 0, 0.1372549, 1, 1,
0.2646723, -0.1015216, 2.457609, 0, 0.1294118, 1, 1,
0.2658179, -0.7074694, 1.939906, 0, 0.1254902, 1, 1,
0.269705, -1.112344, 3.043761, 0, 0.1176471, 1, 1,
0.27164, 0.1971808, 0.9804758, 0, 0.1137255, 1, 1,
0.2729626, 1.2366, 1.349413, 0, 0.1058824, 1, 1,
0.2756421, -1.244874, 4.037855, 0, 0.09803922, 1, 1,
0.2760446, 1.050003, -0.4961652, 0, 0.09411765, 1, 1,
0.2774279, 1.005516, 1.517567, 0, 0.08627451, 1, 1,
0.2779419, -1.492868, 2.860262, 0, 0.08235294, 1, 1,
0.2794396, -1.191627, 2.153406, 0, 0.07450981, 1, 1,
0.2829354, -0.5166528, -0.1253751, 0, 0.07058824, 1, 1,
0.2837822, 0.8107486, 1.634902, 0, 0.0627451, 1, 1,
0.2841284, -1.169571, 3.229298, 0, 0.05882353, 1, 1,
0.2876874, 0.6187858, 0.3142234, 0, 0.05098039, 1, 1,
0.2877956, 0.6188761, 1.003145, 0, 0.04705882, 1, 1,
0.2884914, -0.547191, 2.080634, 0, 0.03921569, 1, 1,
0.2916415, -0.6416379, 3.462178, 0, 0.03529412, 1, 1,
0.298334, -2.400676, 2.535201, 0, 0.02745098, 1, 1,
0.3016686, -0.9690762, 2.57662, 0, 0.02352941, 1, 1,
0.3029429, -0.04159584, 1.275624, 0, 0.01568628, 1, 1,
0.303963, 0.3889809, 2.134176, 0, 0.01176471, 1, 1,
0.3062854, -0.9773952, 2.369461, 0, 0.003921569, 1, 1,
0.3095337, -2.035255, 3.232985, 0.003921569, 0, 1, 1,
0.3121758, -0.6861727, 1.486821, 0.007843138, 0, 1, 1,
0.3219615, 0.8441134, -0.6434014, 0.01568628, 0, 1, 1,
0.323954, -0.1586274, 1.910012, 0.01960784, 0, 1, 1,
0.3241211, 0.7624931, -1.570538, 0.02745098, 0, 1, 1,
0.3387555, -1.233809, 2.759851, 0.03137255, 0, 1, 1,
0.342714, 0.7502509, 0.06161888, 0.03921569, 0, 1, 1,
0.3445879, 0.5544155, -0.2727078, 0.04313726, 0, 1, 1,
0.3449277, -0.4935128, 2.47698, 0.05098039, 0, 1, 1,
0.3471359, -0.006001229, 2.387792, 0.05490196, 0, 1, 1,
0.3486304, -1.525466, 2.443689, 0.0627451, 0, 1, 1,
0.3488994, 0.01651348, 2.360553, 0.06666667, 0, 1, 1,
0.3500699, -0.006375221, 0.5203393, 0.07450981, 0, 1, 1,
0.3521255, -0.09091961, 2.180198, 0.07843138, 0, 1, 1,
0.3563319, -0.04513108, 2.468739, 0.08627451, 0, 1, 1,
0.357555, 0.827754, 0.5196878, 0.09019608, 0, 1, 1,
0.363665, -1.722484, 3.381974, 0.09803922, 0, 1, 1,
0.3678044, 0.8444388, 0.6424496, 0.1058824, 0, 1, 1,
0.3704737, 0.3066315, 1.223485, 0.1098039, 0, 1, 1,
0.3780231, -0.09020638, 2.444471, 0.1176471, 0, 1, 1,
0.3853022, 0.7988427, 1.534025, 0.1215686, 0, 1, 1,
0.3868703, 0.03504641, 0.4586661, 0.1294118, 0, 1, 1,
0.3913629, -0.8980184, 1.803212, 0.1333333, 0, 1, 1,
0.3939381, -0.4628065, 1.897171, 0.1411765, 0, 1, 1,
0.3946702, -0.9280897, 2.21929, 0.145098, 0, 1, 1,
0.3953271, -0.3719122, 3.7557, 0.1529412, 0, 1, 1,
0.3959847, -1.05148, 2.575234, 0.1568628, 0, 1, 1,
0.4018795, 0.08152041, 1.800879, 0.1647059, 0, 1, 1,
0.4049306, 0.3733766, 1.053369, 0.1686275, 0, 1, 1,
0.406924, -1.330683, 1.118979, 0.1764706, 0, 1, 1,
0.4086643, -0.7856334, 2.758793, 0.1803922, 0, 1, 1,
0.409069, -0.7865632, 4.163769, 0.1882353, 0, 1, 1,
0.411094, 2.194103, -1.030074, 0.1921569, 0, 1, 1,
0.4172626, -0.8049608, 2.078296, 0.2, 0, 1, 1,
0.4213826, 0.8783644, 1.828555, 0.2078431, 0, 1, 1,
0.42557, -0.4484874, 1.73193, 0.2117647, 0, 1, 1,
0.4287123, -0.2173073, 0.7983738, 0.2196078, 0, 1, 1,
0.4328023, 0.9318556, 0.6753352, 0.2235294, 0, 1, 1,
0.4358366, 0.9235401, 0.7779105, 0.2313726, 0, 1, 1,
0.4372571, -0.1675759, 1.731711, 0.2352941, 0, 1, 1,
0.4386607, 0.6684798, 0.5160784, 0.2431373, 0, 1, 1,
0.444194, 0.9537204, -0.4829374, 0.2470588, 0, 1, 1,
0.446304, -0.006695446, 2.524149, 0.254902, 0, 1, 1,
0.4477871, -1.181862, 2.287071, 0.2588235, 0, 1, 1,
0.4553789, -0.4195455, 1.55053, 0.2666667, 0, 1, 1,
0.4643505, 0.4696039, 2.32121, 0.2705882, 0, 1, 1,
0.4666017, 2.643305, 0.4337587, 0.2784314, 0, 1, 1,
0.4670742, -0.9507758, 3.182445, 0.282353, 0, 1, 1,
0.4750447, 0.2115338, 1.11671, 0.2901961, 0, 1, 1,
0.4763904, 1.549259, 0.7685286, 0.2941177, 0, 1, 1,
0.4811071, 0.7200532, -0.8689782, 0.3019608, 0, 1, 1,
0.4826466, 1.809283, 0.2666797, 0.3098039, 0, 1, 1,
0.4840087, 0.1096977, 1.985838, 0.3137255, 0, 1, 1,
0.486885, -1.390706, 4.197797, 0.3215686, 0, 1, 1,
0.4909612, 1.890224, -0.5919259, 0.3254902, 0, 1, 1,
0.4944204, 0.1927544, 1.653653, 0.3333333, 0, 1, 1,
0.4969075, 0.6029784, -0.08408213, 0.3372549, 0, 1, 1,
0.4984214, 1.79975, 0.4761386, 0.345098, 0, 1, 1,
0.4993231, -0.6781559, 1.859652, 0.3490196, 0, 1, 1,
0.505867, -0.9422143, 4.219942, 0.3568628, 0, 1, 1,
0.5072522, 2.603411, 0.116957, 0.3607843, 0, 1, 1,
0.5106872, 0.6128024, 1.706949, 0.3686275, 0, 1, 1,
0.5149117, -0.2991215, 3.019533, 0.372549, 0, 1, 1,
0.5193633, -1.094933, 2.884325, 0.3803922, 0, 1, 1,
0.5207973, -0.5040062, 1.970126, 0.3843137, 0, 1, 1,
0.5258434, -1.949852, 3.957086, 0.3921569, 0, 1, 1,
0.5275899, 1.092332, 1.895646, 0.3960784, 0, 1, 1,
0.5290052, 1.656705, -1.318904, 0.4039216, 0, 1, 1,
0.5309029, -0.4987413, 3.067141, 0.4117647, 0, 1, 1,
0.5353634, 0.0009414285, 2.184058, 0.4156863, 0, 1, 1,
0.5375393, -0.604256, 2.813863, 0.4235294, 0, 1, 1,
0.5403798, -0.02705807, 2.936081, 0.427451, 0, 1, 1,
0.5410231, 0.7086135, 0.7932835, 0.4352941, 0, 1, 1,
0.5443026, 0.993716, 1.178691, 0.4392157, 0, 1, 1,
0.5454174, 0.5909787, 0.1351288, 0.4470588, 0, 1, 1,
0.5454993, -0.9051501, 1.651498, 0.4509804, 0, 1, 1,
0.5461918, -2.347859, 3.48123, 0.4588235, 0, 1, 1,
0.550217, 0.9888607, 0.8927425, 0.4627451, 0, 1, 1,
0.551703, -0.2315398, 3.176485, 0.4705882, 0, 1, 1,
0.5519862, 0.8547875, 0.9864584, 0.4745098, 0, 1, 1,
0.5527543, 0.4258425, 0.5506266, 0.4823529, 0, 1, 1,
0.5622485, 1.43105, -1.339558, 0.4862745, 0, 1, 1,
0.5626569, 1.872107, 1.654739, 0.4941176, 0, 1, 1,
0.5627227, -1.171342, 2.2649, 0.5019608, 0, 1, 1,
0.565329, 0.2903241, 3.429049, 0.5058824, 0, 1, 1,
0.5702835, -0.1676087, 0.8018366, 0.5137255, 0, 1, 1,
0.5713108, 0.2587081, 1.591146, 0.5176471, 0, 1, 1,
0.5761303, -1.480186, 4.468729, 0.5254902, 0, 1, 1,
0.5768644, -0.6254639, 1.706216, 0.5294118, 0, 1, 1,
0.5864999, 0.4304565, 1.742592, 0.5372549, 0, 1, 1,
0.5928751, -1.452233, 1.246107, 0.5411765, 0, 1, 1,
0.5943999, -0.5147536, 1.425717, 0.5490196, 0, 1, 1,
0.595284, -0.1398469, 0.8285403, 0.5529412, 0, 1, 1,
0.5959341, 1.590978, 1.419073, 0.5607843, 0, 1, 1,
0.6035259, -0.346017, 1.840831, 0.5647059, 0, 1, 1,
0.621121, 0.3751017, 1.557411, 0.572549, 0, 1, 1,
0.6238212, 0.0722378, 3.365415, 0.5764706, 0, 1, 1,
0.6259218, -0.710191, 0.6388415, 0.5843138, 0, 1, 1,
0.632786, -2.155375, 3.623469, 0.5882353, 0, 1, 1,
0.6343837, -1.531608, 3.85404, 0.5960785, 0, 1, 1,
0.6410534, -0.2145571, 0.9129499, 0.6039216, 0, 1, 1,
0.6417452, -0.879112, 3.07292, 0.6078432, 0, 1, 1,
0.6421303, 0.8930001, 0.5999937, 0.6156863, 0, 1, 1,
0.6459436, 1.027366, 0.7723593, 0.6196079, 0, 1, 1,
0.6464118, -0.6706926, 2.663888, 0.627451, 0, 1, 1,
0.6465532, 0.5219377, -0.2850823, 0.6313726, 0, 1, 1,
0.65266, -1.125993, 2.515597, 0.6392157, 0, 1, 1,
0.6563651, 0.7455524, -0.2730027, 0.6431373, 0, 1, 1,
0.6648058, -0.04903885, 1.824551, 0.6509804, 0, 1, 1,
0.6658919, -0.538705, 4.010369, 0.654902, 0, 1, 1,
0.6679122, -0.4263661, 2.616112, 0.6627451, 0, 1, 1,
0.6726806, 0.7846093, 0.1627808, 0.6666667, 0, 1, 1,
0.683139, 0.8404142, -1.39635, 0.6745098, 0, 1, 1,
0.6910309, 0.2616419, -0.5996383, 0.6784314, 0, 1, 1,
0.6918986, 0.4545748, 1.385942, 0.6862745, 0, 1, 1,
0.6993788, -2.505468, 3.485434, 0.6901961, 0, 1, 1,
0.7017307, 0.7618175, 0.5420284, 0.6980392, 0, 1, 1,
0.7043113, -0.9743155, 2.694819, 0.7058824, 0, 1, 1,
0.7044586, -0.2295125, 3.31215, 0.7098039, 0, 1, 1,
0.7072052, 1.330828, 2.240874, 0.7176471, 0, 1, 1,
0.7220201, -0.3173423, 1.149895, 0.7215686, 0, 1, 1,
0.7220791, -0.7531282, 3.775109, 0.7294118, 0, 1, 1,
0.722387, 1.044959, 1.004499, 0.7333333, 0, 1, 1,
0.7238345, -0.9418744, 3.127658, 0.7411765, 0, 1, 1,
0.7255285, 0.5447544, 0.6730009, 0.7450981, 0, 1, 1,
0.7290266, -0.9958452, 2.942024, 0.7529412, 0, 1, 1,
0.7328887, 0.9256401, -0.3849152, 0.7568628, 0, 1, 1,
0.7331569, -0.1367984, 0.9721547, 0.7647059, 0, 1, 1,
0.7378573, 0.898828, 1.068442, 0.7686275, 0, 1, 1,
0.7416649, -1.502244, 1.416839, 0.7764706, 0, 1, 1,
0.7430236, -0.7444099, 2.115741, 0.7803922, 0, 1, 1,
0.7491268, -1.266313, 3.102828, 0.7882353, 0, 1, 1,
0.7545083, -0.2252939, 1.185131, 0.7921569, 0, 1, 1,
0.7549438, 0.6353852, -0.1618427, 0.8, 0, 1, 1,
0.7652693, 1.50476, 0.03044092, 0.8078431, 0, 1, 1,
0.7746409, 0.06840303, 1.715494, 0.8117647, 0, 1, 1,
0.7750643, 0.6575798, 0.4826455, 0.8196079, 0, 1, 1,
0.7761796, 0.6716207, 0.7196825, 0.8235294, 0, 1, 1,
0.7821155, 0.5651412, 1.142808, 0.8313726, 0, 1, 1,
0.7848767, -0.05126052, 3.413857, 0.8352941, 0, 1, 1,
0.7859257, -0.04767372, 0.4729506, 0.8431373, 0, 1, 1,
0.7896679, -0.5792817, 3.149064, 0.8470588, 0, 1, 1,
0.7944337, 0.06264579, -0.3930607, 0.854902, 0, 1, 1,
0.8001898, 1.198864, 1.050623, 0.8588235, 0, 1, 1,
0.8024578, -0.4115821, 2.991325, 0.8666667, 0, 1, 1,
0.8064131, -0.5516334, 2.816466, 0.8705882, 0, 1, 1,
0.8070338, -0.3568583, 0.06214668, 0.8784314, 0, 1, 1,
0.8070989, 0.0339315, 2.58737, 0.8823529, 0, 1, 1,
0.8085677, 0.3920245, 0.7326605, 0.8901961, 0, 1, 1,
0.8086674, -0.7807819, 3.828762, 0.8941177, 0, 1, 1,
0.8148011, 2.73774, 1.71744, 0.9019608, 0, 1, 1,
0.8161097, -0.6144862, 0.8400668, 0.9098039, 0, 1, 1,
0.8186493, 1.042256, 1.068251, 0.9137255, 0, 1, 1,
0.818725, -0.1728437, 2.906117, 0.9215686, 0, 1, 1,
0.8193365, -2.529866, 1.35236, 0.9254902, 0, 1, 1,
0.8194776, -0.09471443, 2.258099, 0.9333333, 0, 1, 1,
0.8258567, -0.8243537, -0.01767801, 0.9372549, 0, 1, 1,
0.8272444, 0.6859385, 0.3450325, 0.945098, 0, 1, 1,
0.8360054, -0.5106795, 1.152219, 0.9490196, 0, 1, 1,
0.8362834, 0.7023662, 0.7472756, 0.9568627, 0, 1, 1,
0.8365046, 0.6292672, 1.213198, 0.9607843, 0, 1, 1,
0.8368371, -0.9307786, 2.546312, 0.9686275, 0, 1, 1,
0.8466421, -0.5898082, 1.793635, 0.972549, 0, 1, 1,
0.8478141, -0.1479687, 1.184262, 0.9803922, 0, 1, 1,
0.8519815, 0.2283187, 0.5766048, 0.9843137, 0, 1, 1,
0.8550292, -1.497367, 2.336421, 0.9921569, 0, 1, 1,
0.8627103, 1.153489, -0.4147057, 0.9960784, 0, 1, 1,
0.8629, -0.181785, -0.3990223, 1, 0, 0.9960784, 1,
0.864396, -0.1468596, 1.493523, 1, 0, 0.9882353, 1,
0.8648983, -0.08008354, -0.1211513, 1, 0, 0.9843137, 1,
0.8729515, -0.9633226, 1.691985, 1, 0, 0.9764706, 1,
0.881918, 0.4790783, 0.7284753, 1, 0, 0.972549, 1,
0.8829194, -0.4049891, 1.652321, 1, 0, 0.9647059, 1,
0.8829783, -0.4681834, -0.4017315, 1, 0, 0.9607843, 1,
0.8836225, -2.740041, 0.7782667, 1, 0, 0.9529412, 1,
0.8919571, 1.343944, 0.8205802, 1, 0, 0.9490196, 1,
0.8959399, -1.109771, 1.825916, 1, 0, 0.9411765, 1,
0.900162, -0.2991767, 1.768095, 1, 0, 0.9372549, 1,
0.9011893, 0.3573569, 2.279591, 1, 0, 0.9294118, 1,
0.9083871, -1.009325, 3.040457, 1, 0, 0.9254902, 1,
0.9138607, 0.3799688, 1.294271, 1, 0, 0.9176471, 1,
0.9165375, -0.2361249, 1.106219, 1, 0, 0.9137255, 1,
0.9186177, 0.2688849, 0.5911152, 1, 0, 0.9058824, 1,
0.9207708, 0.4006904, 0.4201307, 1, 0, 0.9019608, 1,
0.9219498, 0.2888384, 0.5710617, 1, 0, 0.8941177, 1,
0.9314094, -0.3227839, 1.951575, 1, 0, 0.8862745, 1,
0.9347348, -0.05969508, 0.4160996, 1, 0, 0.8823529, 1,
0.935751, 0.3332069, 0.7934301, 1, 0, 0.8745098, 1,
0.939992, 1.151996, 1.599536, 1, 0, 0.8705882, 1,
0.9432492, -1.086233, 2.980942, 1, 0, 0.8627451, 1,
0.9459807, -1.553516, 2.774971, 1, 0, 0.8588235, 1,
0.9494459, 1.53872, -0.2473511, 1, 0, 0.8509804, 1,
0.9548336, -1.263298, 1.628772, 1, 0, 0.8470588, 1,
0.9548934, -1.103682, 3.864853, 1, 0, 0.8392157, 1,
0.9572833, -1.059367, 1.827425, 1, 0, 0.8352941, 1,
0.9591891, -0.572973, 1.863549, 1, 0, 0.827451, 1,
0.9662873, 1.027575, -0.9654498, 1, 0, 0.8235294, 1,
0.970179, -0.03044472, 2.700812, 1, 0, 0.8156863, 1,
0.9749207, 1.089573, 0.7315782, 1, 0, 0.8117647, 1,
0.9773813, -1.945751, 3.27002, 1, 0, 0.8039216, 1,
0.9799824, -0.05526475, 1.006138, 1, 0, 0.7960784, 1,
0.9824272, -0.01481231, 2.006715, 1, 0, 0.7921569, 1,
0.9890738, 0.433886, 0.3384684, 1, 0, 0.7843137, 1,
0.9893409, 1.789917, -0.08224922, 1, 0, 0.7803922, 1,
0.9918076, 1.553844, 0.8354105, 1, 0, 0.772549, 1,
0.9962984, -1.516905, 1.843519, 1, 0, 0.7686275, 1,
1.000226, 0.6954963, -0.2148939, 1, 0, 0.7607843, 1,
1.006458, -0.248883, -0.07236796, 1, 0, 0.7568628, 1,
1.012769, -0.7977948, 1.964726, 1, 0, 0.7490196, 1,
1.015278, -0.8416428, 2.528283, 1, 0, 0.7450981, 1,
1.021926, -0.7013238, 2.330265, 1, 0, 0.7372549, 1,
1.026907, -0.7352057, 2.710674, 1, 0, 0.7333333, 1,
1.028933, 1.709211, -0.8009654, 1, 0, 0.7254902, 1,
1.038199, 0.7063236, 1.857247, 1, 0, 0.7215686, 1,
1.041798, -1.071429, 2.450986, 1, 0, 0.7137255, 1,
1.046555, 1.041164, 0.8703641, 1, 0, 0.7098039, 1,
1.051045, -0.7548978, 2.811637, 1, 0, 0.7019608, 1,
1.060013, -1.34522, 3.404237, 1, 0, 0.6941177, 1,
1.061166, -0.2899986, 0.4547847, 1, 0, 0.6901961, 1,
1.065356, -1.674406, 2.120596, 1, 0, 0.682353, 1,
1.069047, -0.7638364, 1.716244, 1, 0, 0.6784314, 1,
1.083691, -1.492151, 3.322124, 1, 0, 0.6705883, 1,
1.086071, 0.7177751, 1.363273, 1, 0, 0.6666667, 1,
1.093851, 0.2702159, 2.322579, 1, 0, 0.6588235, 1,
1.1037, -1.420273, 3.737387, 1, 0, 0.654902, 1,
1.108389, 0.544638, 0.6239535, 1, 0, 0.6470588, 1,
1.110364, 0.2820865, 3.389575, 1, 0, 0.6431373, 1,
1.112145, 0.09487996, 0.3372704, 1, 0, 0.6352941, 1,
1.112249, -0.06253729, 2.346281, 1, 0, 0.6313726, 1,
1.135808, 0.1952441, 1.253245, 1, 0, 0.6235294, 1,
1.138986, 2.300956, -1.01414, 1, 0, 0.6196079, 1,
1.139021, -0.4454813, 2.422727, 1, 0, 0.6117647, 1,
1.140823, -1.312871, 2.13025, 1, 0, 0.6078432, 1,
1.147999, 0.3006212, 2.304486, 1, 0, 0.6, 1,
1.149304, -0.443748, 1.255819, 1, 0, 0.5921569, 1,
1.149664, 0.6704847, 1.336173, 1, 0, 0.5882353, 1,
1.151145, 2.450803, 0.6608462, 1, 0, 0.5803922, 1,
1.154972, -0.6328174, 2.709204, 1, 0, 0.5764706, 1,
1.158441, -0.7838235, 1.916965, 1, 0, 0.5686275, 1,
1.159897, -0.619033, 0.7375686, 1, 0, 0.5647059, 1,
1.167714, 0.8878999, 1.367418, 1, 0, 0.5568628, 1,
1.169834, -0.9217691, 1.916031, 1, 0, 0.5529412, 1,
1.169888, -0.3705566, 1.171317, 1, 0, 0.5450981, 1,
1.171783, -0.7917613, 0.4263969, 1, 0, 0.5411765, 1,
1.198233, 0.1978775, 1.671783, 1, 0, 0.5333334, 1,
1.20064, 0.8971277, 1.848557, 1, 0, 0.5294118, 1,
1.213917, 1.915848, -1.568405, 1, 0, 0.5215687, 1,
1.214634, -0.861512, 1.66722, 1, 0, 0.5176471, 1,
1.215531, -1.157754, 2.214869, 1, 0, 0.509804, 1,
1.230722, -0.4037623, 1.187943, 1, 0, 0.5058824, 1,
1.23951, 1.076041, 1.249212, 1, 0, 0.4980392, 1,
1.249978, 0.4505484, 1.027644, 1, 0, 0.4901961, 1,
1.255705, 0.3381786, 2.59263, 1, 0, 0.4862745, 1,
1.257944, -0.788696, 4.179038, 1, 0, 0.4784314, 1,
1.272713, 0.1246844, -0.6877277, 1, 0, 0.4745098, 1,
1.278104, -1.749645, 0.7301745, 1, 0, 0.4666667, 1,
1.2851, 0.6731459, -0.2769413, 1, 0, 0.4627451, 1,
1.285157, -1.300706, 4.620913, 1, 0, 0.454902, 1,
1.289909, 0.6029238, -0.02140809, 1, 0, 0.4509804, 1,
1.293805, 2.159142, 1.066274, 1, 0, 0.4431373, 1,
1.299075, -1.036301, 2.11214, 1, 0, 0.4392157, 1,
1.305174, 0.8599316, 2.640547, 1, 0, 0.4313726, 1,
1.308641, -0.05115613, 2.014301, 1, 0, 0.427451, 1,
1.3172, 2.693935, 0.9354848, 1, 0, 0.4196078, 1,
1.326401, 1.013469, 1.271391, 1, 0, 0.4156863, 1,
1.339644, 0.9461332, 0.7805894, 1, 0, 0.4078431, 1,
1.35138, 1.230861, 1.155665, 1, 0, 0.4039216, 1,
1.356251, -0.4874289, 1.6516, 1, 0, 0.3960784, 1,
1.372722, -0.7871929, 1.590848, 1, 0, 0.3882353, 1,
1.375912, -0.8534811, 3.250475, 1, 0, 0.3843137, 1,
1.380924, 0.8162536, 0.5223143, 1, 0, 0.3764706, 1,
1.40052, -0.5646457, 2.275868, 1, 0, 0.372549, 1,
1.40107, 0.956872, 1.144192, 1, 0, 0.3647059, 1,
1.406245, 0.07219958, 0.5884593, 1, 0, 0.3607843, 1,
1.411827, -0.7180659, 1.797609, 1, 0, 0.3529412, 1,
1.421276, -1.145039, 1.41828, 1, 0, 0.3490196, 1,
1.422172, 0.7644443, 0.7680637, 1, 0, 0.3411765, 1,
1.424904, -0.07326169, -0.05807125, 1, 0, 0.3372549, 1,
1.42932, -0.7787175, 1.222694, 1, 0, 0.3294118, 1,
1.434248, -1.106561, 2.909463, 1, 0, 0.3254902, 1,
1.451709, -1.364749, 2.777749, 1, 0, 0.3176471, 1,
1.480601, -0.773394, 1.124225, 1, 0, 0.3137255, 1,
1.485425, 0.2991443, 1.691231, 1, 0, 0.3058824, 1,
1.492792, -0.9625742, 2.511584, 1, 0, 0.2980392, 1,
1.509166, 0.6167023, 0.3421031, 1, 0, 0.2941177, 1,
1.521478, -0.08426011, 1.729285, 1, 0, 0.2862745, 1,
1.526102, -2.536166, 3.403324, 1, 0, 0.282353, 1,
1.530535, 1.973225, 0.2204332, 1, 0, 0.2745098, 1,
1.539103, -1.174535, 2.722023, 1, 0, 0.2705882, 1,
1.545068, -1.479419, 2.20085, 1, 0, 0.2627451, 1,
1.55511, -0.2189536, 2.010671, 1, 0, 0.2588235, 1,
1.564383, 0.1930089, 2.206765, 1, 0, 0.2509804, 1,
1.619059, -2.291307, 2.692446, 1, 0, 0.2470588, 1,
1.627131, -1.573327, 2.832635, 1, 0, 0.2392157, 1,
1.634796, 0.4415862, 1.463032, 1, 0, 0.2352941, 1,
1.635583, 1.267982, 0.08799423, 1, 0, 0.227451, 1,
1.639522, -0.114662, -0.2043968, 1, 0, 0.2235294, 1,
1.65997, 1.257647, 2.799356, 1, 0, 0.2156863, 1,
1.663103, 0.4812752, 1.005852, 1, 0, 0.2117647, 1,
1.671603, -0.7141523, 1.777654, 1, 0, 0.2039216, 1,
1.679941, 1.281962, 1.995945, 1, 0, 0.1960784, 1,
1.711668, 0.5813093, 1.666919, 1, 0, 0.1921569, 1,
1.753906, -0.1109397, 3.243879, 1, 0, 0.1843137, 1,
1.770343, -0.01378307, 0.5479694, 1, 0, 0.1803922, 1,
1.77106, 0.6577623, 1.102445, 1, 0, 0.172549, 1,
1.791182, 1.649763, 0.3546838, 1, 0, 0.1686275, 1,
1.802427, 0.3797054, 0.4359606, 1, 0, 0.1607843, 1,
1.815674, -0.5084934, 1.031471, 1, 0, 0.1568628, 1,
1.862047, 1.000823, 0.4564023, 1, 0, 0.1490196, 1,
1.862294, 0.7286421, 2.242261, 1, 0, 0.145098, 1,
1.864963, 0.6287524, 2.163498, 1, 0, 0.1372549, 1,
1.868556, 0.1987926, 3.604514, 1, 0, 0.1333333, 1,
1.883298, 0.6194518, 1.939486, 1, 0, 0.1254902, 1,
1.897371, 1.133636, 2.522488, 1, 0, 0.1215686, 1,
1.902536, -0.01813527, 1.786066, 1, 0, 0.1137255, 1,
1.907968, -2.352686, 3.540575, 1, 0, 0.1098039, 1,
1.932594, -1.430604, 1.503166, 1, 0, 0.1019608, 1,
1.941602, 0.3432899, -0.1815428, 1, 0, 0.09411765, 1,
1.971457, 0.86965, 0.7195047, 1, 0, 0.09019608, 1,
1.97323, 0.8800842, 0.5649028, 1, 0, 0.08235294, 1,
2.036856, 0.2004117, 2.994998, 1, 0, 0.07843138, 1,
2.043865, -0.1407282, 0.989312, 1, 0, 0.07058824, 1,
2.056349, 0.04679189, 1.556096, 1, 0, 0.06666667, 1,
2.059784, -0.1147278, 1.668378, 1, 0, 0.05882353, 1,
2.14417, -0.0446615, 3.366437, 1, 0, 0.05490196, 1,
2.159082, 0.9439689, 2.249189, 1, 0, 0.04705882, 1,
2.176159, 0.04465308, 1.042941, 1, 0, 0.04313726, 1,
2.215237, 2.27167, 0.04266762, 1, 0, 0.03529412, 1,
2.282326, 0.4046705, 2.073226, 1, 0, 0.03137255, 1,
2.324423, -1.291986, 2.395347, 1, 0, 0.02352941, 1,
2.579593, -1.09053, 2.994844, 1, 0, 0.01960784, 1,
2.826585, 0.8463976, 0.9186039, 1, 0, 0.01176471, 1,
3.700151, 1.109605, 2.062462, 1, 0, 0.007843138, 1
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
0.1670977, -3.683491, -8.133722, 0, -0.5, 0.5, 0.5,
0.1670977, -3.683491, -8.133722, 1, -0.5, 0.5, 0.5,
0.1670977, -3.683491, -8.133722, 1, 1.5, 0.5, 0.5,
0.1670977, -3.683491, -8.133722, 0, 1.5, 0.5, 0.5
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
-4.563661, 0.003531098, -8.133722, 0, -0.5, 0.5, 0.5,
-4.563661, 0.003531098, -8.133722, 1, -0.5, 0.5, 0.5,
-4.563661, 0.003531098, -8.133722, 1, 1.5, 0.5, 0.5,
-4.563661, 0.003531098, -8.133722, 0, 1.5, 0.5, 0.5
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
-4.563661, -3.683491, -0.4587018, 0, -0.5, 0.5, 0.5,
-4.563661, -3.683491, -0.4587018, 1, -0.5, 0.5, 0.5,
-4.563661, -3.683491, -0.4587018, 1, 1.5, 0.5, 0.5,
-4.563661, -3.683491, -0.4587018, 0, 1.5, 0.5, 0.5
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
-2, -2.832639, -6.362564,
2, -2.832639, -6.362564,
-2, -2.832639, -6.362564,
-2, -2.974448, -6.657757,
0, -2.832639, -6.362564,
0, -2.974448, -6.657757,
2, -2.832639, -6.362564,
2, -2.974448, -6.657757
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
"0",
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
-2, -3.258065, -7.248143, 0, -0.5, 0.5, 0.5,
-2, -3.258065, -7.248143, 1, -0.5, 0.5, 0.5,
-2, -3.258065, -7.248143, 1, 1.5, 0.5, 0.5,
-2, -3.258065, -7.248143, 0, 1.5, 0.5, 0.5,
0, -3.258065, -7.248143, 0, -0.5, 0.5, 0.5,
0, -3.258065, -7.248143, 1, -0.5, 0.5, 0.5,
0, -3.258065, -7.248143, 1, 1.5, 0.5, 0.5,
0, -3.258065, -7.248143, 0, 1.5, 0.5, 0.5,
2, -3.258065, -7.248143, 0, -0.5, 0.5, 0.5,
2, -3.258065, -7.248143, 1, -0.5, 0.5, 0.5,
2, -3.258065, -7.248143, 1, 1.5, 0.5, 0.5,
2, -3.258065, -7.248143, 0, 1.5, 0.5, 0.5
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
-3.471947, -2, -6.362564,
-3.471947, 2, -6.362564,
-3.471947, -2, -6.362564,
-3.6539, -2, -6.657757,
-3.471947, -1, -6.362564,
-3.6539, -1, -6.657757,
-3.471947, 0, -6.362564,
-3.6539, 0, -6.657757,
-3.471947, 1, -6.362564,
-3.6539, 1, -6.657757,
-3.471947, 2, -6.362564,
-3.6539, 2, -6.657757
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
-4.017804, -2, -7.248143, 0, -0.5, 0.5, 0.5,
-4.017804, -2, -7.248143, 1, -0.5, 0.5, 0.5,
-4.017804, -2, -7.248143, 1, 1.5, 0.5, 0.5,
-4.017804, -2, -7.248143, 0, 1.5, 0.5, 0.5,
-4.017804, -1, -7.248143, 0, -0.5, 0.5, 0.5,
-4.017804, -1, -7.248143, 1, -0.5, 0.5, 0.5,
-4.017804, -1, -7.248143, 1, 1.5, 0.5, 0.5,
-4.017804, -1, -7.248143, 0, 1.5, 0.5, 0.5,
-4.017804, 0, -7.248143, 0, -0.5, 0.5, 0.5,
-4.017804, 0, -7.248143, 1, -0.5, 0.5, 0.5,
-4.017804, 0, -7.248143, 1, 1.5, 0.5, 0.5,
-4.017804, 0, -7.248143, 0, 1.5, 0.5, 0.5,
-4.017804, 1, -7.248143, 0, -0.5, 0.5, 0.5,
-4.017804, 1, -7.248143, 1, -0.5, 0.5, 0.5,
-4.017804, 1, -7.248143, 1, 1.5, 0.5, 0.5,
-4.017804, 1, -7.248143, 0, 1.5, 0.5, 0.5,
-4.017804, 2, -7.248143, 0, -0.5, 0.5, 0.5,
-4.017804, 2, -7.248143, 1, -0.5, 0.5, 0.5,
-4.017804, 2, -7.248143, 1, 1.5, 0.5, 0.5,
-4.017804, 2, -7.248143, 0, 1.5, 0.5, 0.5
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
-3.471947, -2.832639, -6,
-3.471947, -2.832639, 4,
-3.471947, -2.832639, -6,
-3.6539, -2.974448, -6,
-3.471947, -2.832639, -4,
-3.6539, -2.974448, -4,
-3.471947, -2.832639, -2,
-3.6539, -2.974448, -2,
-3.471947, -2.832639, 0,
-3.6539, -2.974448, 0,
-3.471947, -2.832639, 2,
-3.6539, -2.974448, 2,
-3.471947, -2.832639, 4,
-3.6539, -2.974448, 4
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
-4.017804, -3.258065, -6, 0, -0.5, 0.5, 0.5,
-4.017804, -3.258065, -6, 1, -0.5, 0.5, 0.5,
-4.017804, -3.258065, -6, 1, 1.5, 0.5, 0.5,
-4.017804, -3.258065, -6, 0, 1.5, 0.5, 0.5,
-4.017804, -3.258065, -4, 0, -0.5, 0.5, 0.5,
-4.017804, -3.258065, -4, 1, -0.5, 0.5, 0.5,
-4.017804, -3.258065, -4, 1, 1.5, 0.5, 0.5,
-4.017804, -3.258065, -4, 0, 1.5, 0.5, 0.5,
-4.017804, -3.258065, -2, 0, -0.5, 0.5, 0.5,
-4.017804, -3.258065, -2, 1, -0.5, 0.5, 0.5,
-4.017804, -3.258065, -2, 1, 1.5, 0.5, 0.5,
-4.017804, -3.258065, -2, 0, 1.5, 0.5, 0.5,
-4.017804, -3.258065, 0, 0, -0.5, 0.5, 0.5,
-4.017804, -3.258065, 0, 1, -0.5, 0.5, 0.5,
-4.017804, -3.258065, 0, 1, 1.5, 0.5, 0.5,
-4.017804, -3.258065, 0, 0, 1.5, 0.5, 0.5,
-4.017804, -3.258065, 2, 0, -0.5, 0.5, 0.5,
-4.017804, -3.258065, 2, 1, -0.5, 0.5, 0.5,
-4.017804, -3.258065, 2, 1, 1.5, 0.5, 0.5,
-4.017804, -3.258065, 2, 0, 1.5, 0.5, 0.5,
-4.017804, -3.258065, 4, 0, -0.5, 0.5, 0.5,
-4.017804, -3.258065, 4, 1, -0.5, 0.5, 0.5,
-4.017804, -3.258065, 4, 1, 1.5, 0.5, 0.5,
-4.017804, -3.258065, 4, 0, 1.5, 0.5, 0.5
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
-3.471947, -2.832639, -6.362564,
-3.471947, 2.839701, -6.362564,
-3.471947, -2.832639, 5.44516,
-3.471947, 2.839701, 5.44516,
-3.471947, -2.832639, -6.362564,
-3.471947, -2.832639, 5.44516,
-3.471947, 2.839701, -6.362564,
-3.471947, 2.839701, 5.44516,
-3.471947, -2.832639, -6.362564,
3.806143, -2.832639, -6.362564,
-3.471947, -2.832639, 5.44516,
3.806143, -2.832639, 5.44516,
-3.471947, 2.839701, -6.362564,
3.806143, 2.839701, -6.362564,
-3.471947, 2.839701, 5.44516,
3.806143, 2.839701, 5.44516,
3.806143, -2.832639, -6.362564,
3.806143, 2.839701, -6.362564,
3.806143, -2.832639, 5.44516,
3.806143, 2.839701, 5.44516,
3.806143, -2.832639, -6.362564,
3.806143, -2.832639, 5.44516,
3.806143, 2.839701, -6.362564,
3.806143, 2.839701, 5.44516
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
var radius = 8.002023;
var distance = 35.60191;
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
mvMatrix.translate( -0.1670977, -0.003531098, 0.4587018 );
mvMatrix.scale( 1.188766, 1.525286, 0.7327359 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.60191);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
secbumeton<-read.table("secbumeton.xyz")
```

```
## Error in read.table("secbumeton.xyz"): no lines available in input
```

```r
x<-secbumeton$V2
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
```

```r
y<-secbumeton$V3
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
```

```r
z<-secbumeton$V4
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
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
-3.365956, -0.4687982, -1.223846, 0, 0, 1, 1, 1,
-3.182289, 0.1016145, -2.359123, 1, 0, 0, 1, 1,
-3.123674, -1.023185, -2.24643, 1, 0, 0, 1, 1,
-3.058647, 1.014995, -2.50143, 1, 0, 0, 1, 1,
-2.899591, 0.9125116, -1.865358, 1, 0, 0, 1, 1,
-2.722469, -1.121315, -1.467725, 1, 0, 0, 1, 1,
-2.614012, -1.064468, -2.39683, 0, 0, 0, 1, 1,
-2.511262, -0.9310563, -1.169384, 0, 0, 0, 1, 1,
-2.370627, -0.316448, -2.655449, 0, 0, 0, 1, 1,
-2.30685, -0.5241014, -1.73725, 0, 0, 0, 1, 1,
-2.297744, -2.423914, -3.311541, 0, 0, 0, 1, 1,
-2.293729, 0.7270305, -0.4399305, 0, 0, 0, 1, 1,
-2.290393, -0.4036079, -1.646023, 0, 0, 0, 1, 1,
-2.217834, -1.000621, -2.137493, 1, 1, 1, 1, 1,
-2.164027, 2.659138, -0.9230155, 1, 1, 1, 1, 1,
-2.15334, -0.5713059, -0.6948696, 1, 1, 1, 1, 1,
-2.130441, -1.212313, -1.190742, 1, 1, 1, 1, 1,
-2.084304, 0.6183771, -2.131563, 1, 1, 1, 1, 1,
-2.049804, 0.2315001, -2.488781, 1, 1, 1, 1, 1,
-2.008186, 0.7516943, -1.765066, 1, 1, 1, 1, 1,
-1.997752, -0.2306069, -3.414798, 1, 1, 1, 1, 1,
-1.963037, -1.691493, -2.446691, 1, 1, 1, 1, 1,
-1.938895, 0.1462867, -2.5973, 1, 1, 1, 1, 1,
-1.925779, -0.3604876, -1.383809, 1, 1, 1, 1, 1,
-1.91963, -0.6353379, -0.5439667, 1, 1, 1, 1, 1,
-1.918596, -0.7203487, -1.563, 1, 1, 1, 1, 1,
-1.912902, 0.2414908, -2.61989, 1, 1, 1, 1, 1,
-1.880809, 0.3464486, -0.843477, 1, 1, 1, 1, 1,
-1.866382, 0.5327252, -1.323481, 0, 0, 1, 1, 1,
-1.86428, 0.8119489, -0.04892016, 1, 0, 0, 1, 1,
-1.859629, -0.1149833, -2.640263, 1, 0, 0, 1, 1,
-1.847378, -0.7896571, -1.745501, 1, 0, 0, 1, 1,
-1.830858, -1.295941, -0.9382622, 1, 0, 0, 1, 1,
-1.830425, 0.870182, -1.686843, 1, 0, 0, 1, 1,
-1.817498, 0.3351079, -2.064382, 0, 0, 0, 1, 1,
-1.799747, -0.202787, -1.750459, 0, 0, 0, 1, 1,
-1.798798, 1.960186, -0.5849849, 0, 0, 0, 1, 1,
-1.795788, 0.2755524, 0.09779295, 0, 0, 0, 1, 1,
-1.791308, -1.210067, -1.370382, 0, 0, 0, 1, 1,
-1.787081, 0.5415662, -1.934454, 0, 0, 0, 1, 1,
-1.757832, -0.1027696, -1.156545, 0, 0, 0, 1, 1,
-1.753169, -0.2287057, -0.1128587, 1, 1, 1, 1, 1,
-1.736038, -2.38092, -3.28711, 1, 1, 1, 1, 1,
-1.732912, 0.9214551, -2.560319, 1, 1, 1, 1, 1,
-1.729342, -0.5411081, -1.655029, 1, 1, 1, 1, 1,
-1.72472, 0.7173886, -0.1474968, 1, 1, 1, 1, 1,
-1.695369, 0.02058998, -0.9904433, 1, 1, 1, 1, 1,
-1.694319, -0.6046849, -2.399478, 1, 1, 1, 1, 1,
-1.693133, -0.01151794, -0.3153378, 1, 1, 1, 1, 1,
-1.681836, -0.9224489, -2.495863, 1, 1, 1, 1, 1,
-1.679598, -1.472319, -1.988667, 1, 1, 1, 1, 1,
-1.674269, -0.3819709, 0.0843704, 1, 1, 1, 1, 1,
-1.631013, -0.1368282, 0.37287, 1, 1, 1, 1, 1,
-1.623925, 1.302275, 0.07061128, 1, 1, 1, 1, 1,
-1.622606, -0.1782516, -1.685094, 1, 1, 1, 1, 1,
-1.620345, 1.545816, -0.3211416, 1, 1, 1, 1, 1,
-1.592638, 2.139673, -0.03182224, 0, 0, 1, 1, 1,
-1.569426, 0.1600879, -2.087977, 1, 0, 0, 1, 1,
-1.565564, 0.4802509, -0.998749, 1, 0, 0, 1, 1,
-1.565513, -1.206405, -1.84865, 1, 0, 0, 1, 1,
-1.562492, -0.9800689, -2.789057, 1, 0, 0, 1, 1,
-1.557993, 0.003475299, -1.859204, 1, 0, 0, 1, 1,
-1.553845, 0.6046993, -1.619492, 0, 0, 0, 1, 1,
-1.545198, -1.467888, -3.083061, 0, 0, 0, 1, 1,
-1.537487, -0.7331653, -0.7442343, 0, 0, 0, 1, 1,
-1.533822, 1.207047, 0.307833, 0, 0, 0, 1, 1,
-1.517671, -0.5207657, -0.5820831, 0, 0, 0, 1, 1,
-1.513827, 0.6473095, -0.07609859, 0, 0, 0, 1, 1,
-1.511795, -0.288314, -0.4970922, 0, 0, 0, 1, 1,
-1.503982, 0.9756179, -1.180252, 1, 1, 1, 1, 1,
-1.489213, -0.06131444, -2.083995, 1, 1, 1, 1, 1,
-1.475396, -0.9017017, -2.231597, 1, 1, 1, 1, 1,
-1.470421, 0.8654722, 0.6459503, 1, 1, 1, 1, 1,
-1.465999, 1.297285, 0.9328652, 1, 1, 1, 1, 1,
-1.457555, -0.540298, -0.9396268, 1, 1, 1, 1, 1,
-1.445151, -0.2803237, -1.005669, 1, 1, 1, 1, 1,
-1.441716, -0.7310495, -0.7566171, 1, 1, 1, 1, 1,
-1.436726, 0.2473371, -1.915363, 1, 1, 1, 1, 1,
-1.433206, -0.2455743, -2.447563, 1, 1, 1, 1, 1,
-1.426575, -0.8832068, -2.477781, 1, 1, 1, 1, 1,
-1.422755, -0.5694829, -3.741013, 1, 1, 1, 1, 1,
-1.422337, 0.6126134, -0.874065, 1, 1, 1, 1, 1,
-1.413889, -0.3737004, -3.606057, 1, 1, 1, 1, 1,
-1.404844, -0.1441359, -1.823136, 1, 1, 1, 1, 1,
-1.393594, -0.7042235, -2.896809, 0, 0, 1, 1, 1,
-1.383343, -1.817144, -1.644652, 1, 0, 0, 1, 1,
-1.380367, -1.055262, -1.577674, 1, 0, 0, 1, 1,
-1.37413, -1.634493, -2.629972, 1, 0, 0, 1, 1,
-1.352746, -1.197184, -2.373326, 1, 0, 0, 1, 1,
-1.352309, 1.121303, 0.2256274, 1, 0, 0, 1, 1,
-1.34687, 1.195592, 0.5319803, 0, 0, 0, 1, 1,
-1.343417, -1.084763, -2.341694, 0, 0, 0, 1, 1,
-1.341254, -0.01306827, 0.7942799, 0, 0, 0, 1, 1,
-1.335549, -0.7022807, -1.097376, 0, 0, 0, 1, 1,
-1.33456, 0.1887141, -0.361459, 0, 0, 0, 1, 1,
-1.331135, 0.3150918, 0.3605562, 0, 0, 0, 1, 1,
-1.322539, -1.165586, -2.01909, 0, 0, 0, 1, 1,
-1.317646, -0.7635463, -2.70942, 1, 1, 1, 1, 1,
-1.316539, 0.5277507, -1.844602, 1, 1, 1, 1, 1,
-1.310767, 0.1118976, 0.8785525, 1, 1, 1, 1, 1,
-1.306319, -0.4737736, -2.862428, 1, 1, 1, 1, 1,
-1.305085, -0.2398543, -1.931274, 1, 1, 1, 1, 1,
-1.302398, -1.071836, -3.031921, 1, 1, 1, 1, 1,
-1.279689, 0.5536783, -0.5332404, 1, 1, 1, 1, 1,
-1.27768, -0.3339405, -1.10608, 1, 1, 1, 1, 1,
-1.275833, -0.1946915, -1.654135, 1, 1, 1, 1, 1,
-1.256478, -0.2363939, -1.93817, 1, 1, 1, 1, 1,
-1.250449, -0.4598535, -0.6801429, 1, 1, 1, 1, 1,
-1.248688, 1.110558, 0.4074818, 1, 1, 1, 1, 1,
-1.242829, -1.029545, -2.413313, 1, 1, 1, 1, 1,
-1.242355, 0.3110119, -1.431747, 1, 1, 1, 1, 1,
-1.240384, 0.3685869, -1.00486, 1, 1, 1, 1, 1,
-1.231001, -1.03494, -1.018888, 0, 0, 1, 1, 1,
-1.229446, -0.4574821, -2.398547, 1, 0, 0, 1, 1,
-1.224945, -0.376053, -2.306481, 1, 0, 0, 1, 1,
-1.224015, -1.792345, -2.163352, 1, 0, 0, 1, 1,
-1.222527, -1.293284, -2.003493, 1, 0, 0, 1, 1,
-1.222051, 0.223024, -2.110435, 1, 0, 0, 1, 1,
-1.219154, -1.262832, -2.67664, 0, 0, 0, 1, 1,
-1.216297, 0.952803, -0.4863594, 0, 0, 0, 1, 1,
-1.215703, -0.4753525, -1.76569, 0, 0, 0, 1, 1,
-1.214171, -0.4442655, -1.377912, 0, 0, 0, 1, 1,
-1.213956, -0.6926284, -2.691251, 0, 0, 0, 1, 1,
-1.208739, -1.255735, -0.9139011, 0, 0, 0, 1, 1,
-1.206499, -0.2312911, -0.6432347, 0, 0, 0, 1, 1,
-1.204172, -0.1878639, -2.309434, 1, 1, 1, 1, 1,
-1.203276, -0.03298851, -0.7409742, 1, 1, 1, 1, 1,
-1.20066, -0.6922459, -1.072925, 1, 1, 1, 1, 1,
-1.199346, -0.6449616, -2.089734, 1, 1, 1, 1, 1,
-1.183964, -1.565531, -1.082713, 1, 1, 1, 1, 1,
-1.177644, -0.9107608, -2.687159, 1, 1, 1, 1, 1,
-1.169923, -1.555923, -2.631618, 1, 1, 1, 1, 1,
-1.165761, 0.1287336, -2.41446, 1, 1, 1, 1, 1,
-1.161376, 0.2235045, -2.640756, 1, 1, 1, 1, 1,
-1.159822, -0.6084478, -0.1622985, 1, 1, 1, 1, 1,
-1.15701, 0.3003144, -0.5498136, 1, 1, 1, 1, 1,
-1.156145, -0.6363139, -3.606954, 1, 1, 1, 1, 1,
-1.150747, 0.05581801, -0.8224457, 1, 1, 1, 1, 1,
-1.147967, -2.209726, -0.5753425, 1, 1, 1, 1, 1,
-1.135677, -0.4987203, -1.380114, 1, 1, 1, 1, 1,
-1.133696, -1.1142, -1.172705, 0, 0, 1, 1, 1,
-1.132287, 0.4372716, -0.2959108, 1, 0, 0, 1, 1,
-1.131195, -0.4396718, 0.7181307, 1, 0, 0, 1, 1,
-1.127281, -0.3106239, -2.762248, 1, 0, 0, 1, 1,
-1.125989, -2.147477, -1.396884, 1, 0, 0, 1, 1,
-1.125584, 1.571912, -1.097683, 1, 0, 0, 1, 1,
-1.124904, 2.482872, -0.1392875, 0, 0, 0, 1, 1,
-1.122135, 0.4744712, 0.4138489, 0, 0, 0, 1, 1,
-1.120587, -1.570064, -4.213801, 0, 0, 0, 1, 1,
-1.119911, 1.890306, -0.9539814, 0, 0, 0, 1, 1,
-1.11988, -0.5064943, -0.5183697, 0, 0, 0, 1, 1,
-1.115311, 0.371085, -1.93169, 0, 0, 0, 1, 1,
-1.103956, 0.1074291, -1.763266, 0, 0, 0, 1, 1,
-1.097178, 0.3019552, -2.724638, 1, 1, 1, 1, 1,
-1.092378, -0.6768163, -1.451, 1, 1, 1, 1, 1,
-1.090971, -0.3187984, -1.032863, 1, 1, 1, 1, 1,
-1.085611, 1.704718, -1.56547, 1, 1, 1, 1, 1,
-1.080004, -0.2103254, -1.755072, 1, 1, 1, 1, 1,
-1.077404, -0.9875729, -2.600821, 1, 1, 1, 1, 1,
-1.07168, -1.021862, -0.6750945, 1, 1, 1, 1, 1,
-1.071277, 0.9388021, -1.03443, 1, 1, 1, 1, 1,
-1.070127, -1.436845, -1.139351, 1, 1, 1, 1, 1,
-1.064338, -1.585768, -2.786728, 1, 1, 1, 1, 1,
-1.063735, 0.9911227, 1.412163, 1, 1, 1, 1, 1,
-1.060665, -1.001443, -1.545277, 1, 1, 1, 1, 1,
-1.059921, -0.2689862, -3.557678, 1, 1, 1, 1, 1,
-1.059836, -0.8579098, -3.221678, 1, 1, 1, 1, 1,
-1.051567, -0.1232674, -2.969953, 1, 1, 1, 1, 1,
-1.038058, -0.2044457, -1.394028, 0, 0, 1, 1, 1,
-1.020828, 1.985097, -0.7670733, 1, 0, 0, 1, 1,
-1.016406, -0.3137956, -3.174882, 1, 0, 0, 1, 1,
-1.008321, -0.178606, -1.341823, 1, 0, 0, 1, 1,
-1.001016, 0.169707, -2.160336, 1, 0, 0, 1, 1,
-0.9886051, -0.03119897, -1.444352, 1, 0, 0, 1, 1,
-0.9842799, 0.03170871, -3.694462, 0, 0, 0, 1, 1,
-0.9832791, 0.4713821, -1.442082, 0, 0, 0, 1, 1,
-0.9812657, 0.9912992, -0.4035683, 0, 0, 0, 1, 1,
-0.9760553, 0.9340236, -1.431451, 0, 0, 0, 1, 1,
-0.97497, -2.316475, -4.169415, 0, 0, 0, 1, 1,
-0.9709565, -0.7333711, -2.148689, 0, 0, 0, 1, 1,
-0.9605688, 0.6010191, -2.399765, 0, 0, 0, 1, 1,
-0.9479288, -0.3260565, -0.5133495, 1, 1, 1, 1, 1,
-0.947013, 0.8737245, 0.002477618, 1, 1, 1, 1, 1,
-0.9385212, 0.6655223, 0.3649996, 1, 1, 1, 1, 1,
-0.9363378, -1.744333, -2.892641, 1, 1, 1, 1, 1,
-0.9335811, -0.1211194, -1.177701, 1, 1, 1, 1, 1,
-0.9281077, -1.305729, -3.004716, 1, 1, 1, 1, 1,
-0.917364, -2.330571, -2.37342, 1, 1, 1, 1, 1,
-0.9106275, 0.7750574, -1.736759, 1, 1, 1, 1, 1,
-0.910605, -0.09617235, -3.594746, 1, 1, 1, 1, 1,
-0.9040892, -0.2811388, -1.942147, 1, 1, 1, 1, 1,
-0.9036465, 1.109286, 0.05857364, 1, 1, 1, 1, 1,
-0.8951572, -1.723515, -2.780333, 1, 1, 1, 1, 1,
-0.8915191, 2.275775, 0.2633263, 1, 1, 1, 1, 1,
-0.8913567, 0.2564386, -0.1614154, 1, 1, 1, 1, 1,
-0.8911375, -1.557197, -1.468726, 1, 1, 1, 1, 1,
-0.8847364, -0.03970059, -0.7349576, 0, 0, 1, 1, 1,
-0.8838611, 0.4681143, -1.205226, 1, 0, 0, 1, 1,
-0.8820372, 0.3595372, -2.226501, 1, 0, 0, 1, 1,
-0.8756918, -2.099109, -2.714701, 1, 0, 0, 1, 1,
-0.8727379, 0.6999246, 1.15356, 1, 0, 0, 1, 1,
-0.871139, 0.3998466, 0.1901652, 1, 0, 0, 1, 1,
-0.8702742, -0.4301668, -2.976432, 0, 0, 0, 1, 1,
-0.8643298, 0.966836, -1.044622, 0, 0, 0, 1, 1,
-0.8636387, -0.6230973, -1.004526, 0, 0, 0, 1, 1,
-0.8633823, 0.0142509, -0.8497417, 0, 0, 0, 1, 1,
-0.8627446, -0.3853453, -1.237807, 0, 0, 0, 1, 1,
-0.8584931, 1.611809, 0.2999879, 0, 0, 0, 1, 1,
-0.8543408, -0.3302326, -2.644145, 0, 0, 0, 1, 1,
-0.8533167, 1.262011, -0.1800433, 1, 1, 1, 1, 1,
-0.8517798, -1.140456, -3.619024, 1, 1, 1, 1, 1,
-0.8515113, 0.2853688, -1.832678, 1, 1, 1, 1, 1,
-0.8462677, -0.4783596, -1.822185, 1, 1, 1, 1, 1,
-0.8426666, 0.1601636, -1.410195, 1, 1, 1, 1, 1,
-0.8391013, -0.01271282, -0.5261164, 1, 1, 1, 1, 1,
-0.8381528, 0.6058017, -0.01259565, 1, 1, 1, 1, 1,
-0.8368726, -1.023667, -2.406474, 1, 1, 1, 1, 1,
-0.8235164, 0.8075958, -0.1948287, 1, 1, 1, 1, 1,
-0.8198241, -0.2501047, -1.467739, 1, 1, 1, 1, 1,
-0.81728, 1.015184, -1.573764, 1, 1, 1, 1, 1,
-0.8155187, -1.75724, -1.813637, 1, 1, 1, 1, 1,
-0.8103366, 0.1104207, -0.6833041, 1, 1, 1, 1, 1,
-0.8024225, 0.5079384, -2.307451, 1, 1, 1, 1, 1,
-0.8003122, -1.222673, -1.931453, 1, 1, 1, 1, 1,
-0.7965619, 1.79694, 0.8842506, 0, 0, 1, 1, 1,
-0.795328, -1.547496, -3.447013, 1, 0, 0, 1, 1,
-0.7870937, -1.817455, -2.188549, 1, 0, 0, 1, 1,
-0.7839922, 0.9975592, -2.095733, 1, 0, 0, 1, 1,
-0.7837628, 0.7730725, -2.940571, 1, 0, 0, 1, 1,
-0.7814088, 0.08712933, -3.315838, 1, 0, 0, 1, 1,
-0.7739877, -0.150204, -0.1874105, 0, 0, 0, 1, 1,
-0.7720355, -0.3500645, -1.486351, 0, 0, 0, 1, 1,
-0.7655867, 1.188998, -2.322819, 0, 0, 0, 1, 1,
-0.761252, 1.323598, -0.7872548, 0, 0, 0, 1, 1,
-0.7600861, 0.7891966, -0.6172711, 0, 0, 0, 1, 1,
-0.7593601, -1.314081, -1.223203, 0, 0, 0, 1, 1,
-0.7558107, 0.8876022, -1.873514, 0, 0, 0, 1, 1,
-0.753207, -0.9770817, -2.142603, 1, 1, 1, 1, 1,
-0.752689, 0.4327641, -1.58991, 1, 1, 1, 1, 1,
-0.7508489, 0.361211, -0.2831738, 1, 1, 1, 1, 1,
-0.7484235, 0.9029142, -0.827021, 1, 1, 1, 1, 1,
-0.745038, 0.795172, 1.479086, 1, 1, 1, 1, 1,
-0.744266, -0.2151967, -1.173234, 1, 1, 1, 1, 1,
-0.743331, 0.1589557, -2.8251, 1, 1, 1, 1, 1,
-0.7425653, 0.9845424, -0.2523099, 1, 1, 1, 1, 1,
-0.7416519, 2.114824, 0.5130969, 1, 1, 1, 1, 1,
-0.7399492, -2.38454, -2.848256, 1, 1, 1, 1, 1,
-0.7340613, -1.146144, -2.450385, 1, 1, 1, 1, 1,
-0.7334203, 0.02336695, -2.947825, 1, 1, 1, 1, 1,
-0.7325136, 1.042776, -0.2471871, 1, 1, 1, 1, 1,
-0.7304749, -0.175209, -2.098197, 1, 1, 1, 1, 1,
-0.7258648, 1.384328, -2.455452, 1, 1, 1, 1, 1,
-0.7255015, 0.7607267, -1.525687, 0, 0, 1, 1, 1,
-0.7249413, -0.3256416, -1.677245, 1, 0, 0, 1, 1,
-0.7248563, 0.3622032, -1.536708, 1, 0, 0, 1, 1,
-0.7198085, 0.3124963, -2.017453, 1, 0, 0, 1, 1,
-0.7181029, -0.2721014, -2.91877, 1, 0, 0, 1, 1,
-0.7109631, 1.304018, -1.995352, 1, 0, 0, 1, 1,
-0.7072825, -0.4925108, -1.824348, 0, 0, 0, 1, 1,
-0.704622, 1.293504, 0.5461242, 0, 0, 0, 1, 1,
-0.702502, -2.09041, -2.637356, 0, 0, 0, 1, 1,
-0.7009798, -0.8609176, -2.67961, 0, 0, 0, 1, 1,
-0.7008603, -1.141429, -2.049634, 0, 0, 0, 1, 1,
-0.6948525, -1.803789, -6.190607, 0, 0, 0, 1, 1,
-0.6940705, 0.5879829, -0.8800746, 0, 0, 0, 1, 1,
-0.6911867, -1.348274, -3.352671, 1, 1, 1, 1, 1,
-0.6880385, -0.4347773, -1.422268, 1, 1, 1, 1, 1,
-0.6876741, 1.072238, -0.3305293, 1, 1, 1, 1, 1,
-0.687643, -0.2585264, -2.639791, 1, 1, 1, 1, 1,
-0.6832955, -0.3950916, -3.49309, 1, 1, 1, 1, 1,
-0.6803181, 0.3158308, -1.13075, 1, 1, 1, 1, 1,
-0.6773987, -2.11971, -2.660479, 1, 1, 1, 1, 1,
-0.6594499, 1.732292, -0.4687327, 1, 1, 1, 1, 1,
-0.659111, 0.5222182, -1.885222, 1, 1, 1, 1, 1,
-0.6583735, -0.8826488, -3.465775, 1, 1, 1, 1, 1,
-0.6582774, -0.5290202, -1.819205, 1, 1, 1, 1, 1,
-0.6574808, 0.4029487, -1.844552, 1, 1, 1, 1, 1,
-0.6558357, 0.7540368, -1.445488, 1, 1, 1, 1, 1,
-0.6527289, 1.037944, -1.90684, 1, 1, 1, 1, 1,
-0.6476151, -0.9854631, -4.394803, 1, 1, 1, 1, 1,
-0.6459069, 1.053455, -1.623922, 0, 0, 1, 1, 1,
-0.6453097, 0.1915383, -1.477342, 1, 0, 0, 1, 1,
-0.6404224, 0.3871786, -1.202309, 1, 0, 0, 1, 1,
-0.6308551, 1.610129, 0.6385732, 1, 0, 0, 1, 1,
-0.628063, -0.08066058, -1.104133, 1, 0, 0, 1, 1,
-0.6256168, 0.7578443, 0.8787004, 1, 0, 0, 1, 1,
-0.618517, -1.314479, -2.054185, 0, 0, 0, 1, 1,
-0.6159378, 0.9356202, -0.3761111, 0, 0, 0, 1, 1,
-0.6157021, -2.142203, -3.671163, 0, 0, 0, 1, 1,
-0.6148825, -0.404224, -1.908933, 0, 0, 0, 1, 1,
-0.6113134, -0.8458624, -0.8337322, 0, 0, 0, 1, 1,
-0.6065555, 1.503671, -2.423067, 0, 0, 0, 1, 1,
-0.6061792, 1.709907, 0.8293638, 0, 0, 0, 1, 1,
-0.6058452, 1.108272, 0.05450895, 1, 1, 1, 1, 1,
-0.6037317, -0.398629, -1.32232, 1, 1, 1, 1, 1,
-0.5899133, 2.575238, 0.4320509, 1, 1, 1, 1, 1,
-0.5837756, -1.156663, -3.096287, 1, 1, 1, 1, 1,
-0.577708, 0.4902253, -1.174813, 1, 1, 1, 1, 1,
-0.5737153, 0.2513583, -3.991253, 1, 1, 1, 1, 1,
-0.5719814, 0.4717691, -2.291884, 1, 1, 1, 1, 1,
-0.5711091, -1.597436, -2.464227, 1, 1, 1, 1, 1,
-0.5681372, -0.3929725, -2.261393, 1, 1, 1, 1, 1,
-0.5664021, -0.6573837, -0.7042408, 1, 1, 1, 1, 1,
-0.5621008, 0.1666777, -1.19581, 1, 1, 1, 1, 1,
-0.5580769, -0.01681089, -2.474552, 1, 1, 1, 1, 1,
-0.5558193, -1.123825, -1.999093, 1, 1, 1, 1, 1,
-0.5548961, -1.059105, -2.927194, 1, 1, 1, 1, 1,
-0.5481454, 0.154921, -1.565599, 1, 1, 1, 1, 1,
-0.54535, -0.6399401, 0.07945481, 0, 0, 1, 1, 1,
-0.5450535, -1.258494, -3.953241, 1, 0, 0, 1, 1,
-0.5431433, -1.878493, -2.382025, 1, 0, 0, 1, 1,
-0.5399008, 0.1692856, -1.605058, 1, 0, 0, 1, 1,
-0.539689, 0.2009171, -1.301058, 1, 0, 0, 1, 1,
-0.5298967, 0.4735067, -0.1801065, 1, 0, 0, 1, 1,
-0.525016, -0.6627235, -3.009128, 0, 0, 0, 1, 1,
-0.5205612, -0.2940708, -0.8130155, 0, 0, 0, 1, 1,
-0.5194511, -0.7462358, -3.315853, 0, 0, 0, 1, 1,
-0.5191234, -0.06667887, -2.183806, 0, 0, 0, 1, 1,
-0.5183814, -0.8870845, -0.4802056, 0, 0, 0, 1, 1,
-0.513864, -0.0927018, -2.953267, 0, 0, 0, 1, 1,
-0.5091067, -1.153094, -3.86796, 0, 0, 0, 1, 1,
-0.5088316, -0.9045506, -2.043006, 1, 1, 1, 1, 1,
-0.5085613, 0.2476325, -0.9389769, 1, 1, 1, 1, 1,
-0.5054277, -0.3612528, -2.272126, 1, 1, 1, 1, 1,
-0.5038646, 0.223793, -0.4692139, 1, 1, 1, 1, 1,
-0.5037997, 1.000005, -0.8066794, 1, 1, 1, 1, 1,
-0.5008214, 0.6722519, -0.8249552, 1, 1, 1, 1, 1,
-0.4985331, 2.362579, -0.1805477, 1, 1, 1, 1, 1,
-0.4963132, 0.7555097, -1.254032, 1, 1, 1, 1, 1,
-0.4947309, 0.1240393, -1.066867, 1, 1, 1, 1, 1,
-0.4916013, -0.6982535, -2.720549, 1, 1, 1, 1, 1,
-0.4907786, 0.5385277, -1.443115, 1, 1, 1, 1, 1,
-0.4903205, 1.985831, -1.706847, 1, 1, 1, 1, 1,
-0.4887568, 0.2701362, -1.620935, 1, 1, 1, 1, 1,
-0.4884937, 0.125069, -1.080986, 1, 1, 1, 1, 1,
-0.488134, 0.4911056, -0.7125654, 1, 1, 1, 1, 1,
-0.4749396, -0.4671125, -1.398186, 0, 0, 1, 1, 1,
-0.4739946, 1.623335, -1.032111, 1, 0, 0, 1, 1,
-0.4682039, -0.7081434, -3.306582, 1, 0, 0, 1, 1,
-0.4663668, 0.6829803, -1.005473, 1, 0, 0, 1, 1,
-0.4654648, 1.052111, -1.044822, 1, 0, 0, 1, 1,
-0.4650425, 1.283751, -0.1142158, 1, 0, 0, 1, 1,
-0.4645106, -0.4966518, -0.6664983, 0, 0, 0, 1, 1,
-0.46436, 1.189846, 0.0679259, 0, 0, 0, 1, 1,
-0.4557634, -0.9043511, -1.658537, 0, 0, 0, 1, 1,
-0.4539744, -0.9728473, -3.834067, 0, 0, 0, 1, 1,
-0.4434564, -0.5923751, -2.191214, 0, 0, 0, 1, 1,
-0.4424039, 0.2805589, -0.4435536, 0, 0, 0, 1, 1,
-0.4389801, -0.6356652, -1.267748, 0, 0, 0, 1, 1,
-0.4344477, 2.106663, -1.077943, 1, 1, 1, 1, 1,
-0.4336095, 0.4212244, -0.05516509, 1, 1, 1, 1, 1,
-0.4291531, 0.1124662, -2.660691, 1, 1, 1, 1, 1,
-0.4288881, -0.5535671, -1.541149, 1, 1, 1, 1, 1,
-0.4282564, -1.973665, -2.046843, 1, 1, 1, 1, 1,
-0.4279874, -0.3162305, -2.88925, 1, 1, 1, 1, 1,
-0.4259225, 0.05251202, -1.901919, 1, 1, 1, 1, 1,
-0.4255896, -0.4360054, -4.238384, 1, 1, 1, 1, 1,
-0.4166971, 1.568874, 0.09499333, 1, 1, 1, 1, 1,
-0.4092763, -0.01035577, 0.3719805, 1, 1, 1, 1, 1,
-0.4084959, 0.0003961966, -2.365415, 1, 1, 1, 1, 1,
-0.4084634, 0.5617736, -2.380589, 1, 1, 1, 1, 1,
-0.4068161, 1.532961, -1.704188, 1, 1, 1, 1, 1,
-0.4056732, 0.1866965, -1.533855, 1, 1, 1, 1, 1,
-0.3993779, 1.282726, -1.437959, 1, 1, 1, 1, 1,
-0.3987701, -1.180785, -3.793407, 0, 0, 1, 1, 1,
-0.3979434, 0.8287197, 0.9332577, 1, 0, 0, 1, 1,
-0.3944125, -0.3483269, -3.492635, 1, 0, 0, 1, 1,
-0.39387, 1.204357, -1.571073, 1, 0, 0, 1, 1,
-0.3928076, 0.4775838, -1.305981, 1, 0, 0, 1, 1,
-0.3896776, -1.419998, -3.181586, 1, 0, 0, 1, 1,
-0.3875151, -0.2182085, -2.816101, 0, 0, 0, 1, 1,
-0.3849302, 0.036881, 0.1069787, 0, 0, 0, 1, 1,
-0.381084, -0.54907, -2.278739, 0, 0, 0, 1, 1,
-0.3785911, -0.8675027, -2.542922, 0, 0, 0, 1, 1,
-0.3731948, 1.500733, 0.4560629, 0, 0, 0, 1, 1,
-0.3676119, 1.193846, -1.989503, 0, 0, 0, 1, 1,
-0.3669364, -1.619335, -4.001808, 0, 0, 0, 1, 1,
-0.3663889, 0.1766437, -1.550827, 1, 1, 1, 1, 1,
-0.3599696, 0.4860947, -1.286589, 1, 1, 1, 1, 1,
-0.3592375, -1.843134, -3.717355, 1, 1, 1, 1, 1,
-0.3581054, 1.222544, -0.9505035, 1, 1, 1, 1, 1,
-0.3579919, -0.7975957, -1.873872, 1, 1, 1, 1, 1,
-0.3577659, 1.802684, -1.72983, 1, 1, 1, 1, 1,
-0.3566271, 0.08776543, -1.315414, 1, 1, 1, 1, 1,
-0.356178, 0.255565, -1.727023, 1, 1, 1, 1, 1,
-0.3547843, 2.378211, -0.1060635, 1, 1, 1, 1, 1,
-0.3545067, 0.2718175, -0.1559627, 1, 1, 1, 1, 1,
-0.3537816, -2.112364, -3.49929, 1, 1, 1, 1, 1,
-0.3528756, 1.661973, 0.9269338, 1, 1, 1, 1, 1,
-0.3503893, 0.5219494, -2.782723, 1, 1, 1, 1, 1,
-0.3501618, 0.02153548, -2.582565, 1, 1, 1, 1, 1,
-0.3491398, 0.3439445, -1.940105, 1, 1, 1, 1, 1,
-0.3471516, -0.2275684, -1.449186, 0, 0, 1, 1, 1,
-0.3469423, 0.5216442, 0.5262072, 1, 0, 0, 1, 1,
-0.3410104, -1.506219, -3.952284, 1, 0, 0, 1, 1,
-0.3365241, -1.32169, -3.43637, 1, 0, 0, 1, 1,
-0.3326568, -1.464127, -2.863917, 1, 0, 0, 1, 1,
-0.3221591, -0.1197155, -0.8688585, 1, 0, 0, 1, 1,
-0.3188587, -0.3637306, -2.487638, 0, 0, 0, 1, 1,
-0.3100919, 0.25434, -0.9476811, 0, 0, 0, 1, 1,
-0.3098632, 0.3065866, 0.1017225, 0, 0, 0, 1, 1,
-0.3097933, 1.082469, 2.393697, 0, 0, 0, 1, 1,
-0.3081056, 2.138806, -0.5165114, 0, 0, 0, 1, 1,
-0.3055383, -0.266142, -2.203976, 0, 0, 0, 1, 1,
-0.3029212, 2.016338, 1.796669, 0, 0, 0, 1, 1,
-0.3013135, 1.955197, -2.005832, 1, 1, 1, 1, 1,
-0.2983009, -1.790164, -1.914356, 1, 1, 1, 1, 1,
-0.2963361, -0.7674635, -3.43573, 1, 1, 1, 1, 1,
-0.2956844, -0.4048653, -2.946315, 1, 1, 1, 1, 1,
-0.2941996, -0.5556149, -2.168358, 1, 1, 1, 1, 1,
-0.2934236, -0.5054069, -1.935979, 1, 1, 1, 1, 1,
-0.2933892, 0.1542281, -2.110433, 1, 1, 1, 1, 1,
-0.2897168, -0.3045583, -2.466194, 1, 1, 1, 1, 1,
-0.2869121, 0.2217027, -0.5566761, 1, 1, 1, 1, 1,
-0.2831412, 1.080042, 3.168398, 1, 1, 1, 1, 1,
-0.2815264, -0.7877793, -3.913482, 1, 1, 1, 1, 1,
-0.2805685, -0.4251753, -2.431194, 1, 1, 1, 1, 1,
-0.2802964, -0.08461697, -2.317661, 1, 1, 1, 1, 1,
-0.27689, 1.008446, 0.7026315, 1, 1, 1, 1, 1,
-0.2751561, 0.05921692, -0.4032545, 1, 1, 1, 1, 1,
-0.2745197, 1.528358, 0.8505341, 0, 0, 1, 1, 1,
-0.2729952, -0.692424, -3.685124, 1, 0, 0, 1, 1,
-0.2673092, -0.3391607, -2.405956, 1, 0, 0, 1, 1,
-0.2659871, -1.911606, -1.891116, 1, 0, 0, 1, 1,
-0.2658908, -1.020089, -1.093513, 1, 0, 0, 1, 1,
-0.261669, -0.1303234, -2.077465, 1, 0, 0, 1, 1,
-0.2566341, 0.6208988, -0.6923832, 0, 0, 0, 1, 1,
-0.2547905, 0.4031383, -0.9067909, 0, 0, 0, 1, 1,
-0.2541827, 2.373347, -1.51296, 0, 0, 0, 1, 1,
-0.2530428, -1.305283, -2.602541, 0, 0, 0, 1, 1,
-0.2506658, 0.8766896, 0.6780403, 0, 0, 0, 1, 1,
-0.2504869, 0.8064867, 1.286053, 0, 0, 0, 1, 1,
-0.2492308, 1.053238, -1.175378, 0, 0, 0, 1, 1,
-0.2480341, 1.544933, -1.4349, 1, 1, 1, 1, 1,
-0.2479016, -1.203658, -0.5252384, 1, 1, 1, 1, 1,
-0.2437739, -0.6063058, -2.222675, 1, 1, 1, 1, 1,
-0.2404344, 1.262008, -2.827181, 1, 1, 1, 1, 1,
-0.2389807, -0.1640318, -1.009065, 1, 1, 1, 1, 1,
-0.2382759, -0.4319404, -3.163151, 1, 1, 1, 1, 1,
-0.2326238, 0.3284316, -0.7035624, 1, 1, 1, 1, 1,
-0.2307028, 0.3770168, 0.07565586, 1, 1, 1, 1, 1,
-0.2216257, -2.155668, -3.149292, 1, 1, 1, 1, 1,
-0.2142072, -2.080286, -3.083434, 1, 1, 1, 1, 1,
-0.2109655, 0.7216827, -1.551941, 1, 1, 1, 1, 1,
-0.2098002, 1.079097, -1.135748, 1, 1, 1, 1, 1,
-0.2069114, -1.163176, -2.790375, 1, 1, 1, 1, 1,
-0.2059049, 0.1838929, -0.9838084, 1, 1, 1, 1, 1,
-0.202233, -0.8681049, -2.932651, 1, 1, 1, 1, 1,
-0.2016044, 0.319704, -0.5380655, 0, 0, 1, 1, 1,
-0.1962495, -1.883817, -2.462728, 1, 0, 0, 1, 1,
-0.1955877, 0.8099638, 2.324175, 1, 0, 0, 1, 1,
-0.1955135, 1.009505, 0.3053804, 1, 0, 0, 1, 1,
-0.1947242, 0.1437362, -1.36533, 1, 0, 0, 1, 1,
-0.1901173, -0.4657112, -3.052852, 1, 0, 0, 1, 1,
-0.1896198, -1.588245, -3.25655, 0, 0, 0, 1, 1,
-0.1876732, 0.5675886, -1.92079, 0, 0, 0, 1, 1,
-0.1839839, -0.5691713, -1.819296, 0, 0, 0, 1, 1,
-0.1824455, -0.6164432, -1.612674, 0, 0, 0, 1, 1,
-0.1739899, 0.9897891, -0.07295964, 0, 0, 0, 1, 1,
-0.1722067, -1.273303, -3.786935, 0, 0, 0, 1, 1,
-0.1720442, 1.51294, 0.981573, 0, 0, 0, 1, 1,
-0.1700196, 1.514512, 1.107303, 1, 1, 1, 1, 1,
-0.1636212, -0.2844337, -3.214494, 1, 1, 1, 1, 1,
-0.1622857, 0.3055698, 1.002756, 1, 1, 1, 1, 1,
-0.1611768, 0.1743773, -2.007855, 1, 1, 1, 1, 1,
-0.1562293, 0.5151774, -1.327291, 1, 1, 1, 1, 1,
-0.1537415, 0.2119528, -0.729291, 1, 1, 1, 1, 1,
-0.1531785, 0.4051379, -0.2831228, 1, 1, 1, 1, 1,
-0.1501002, 1.831769, -0.05540236, 1, 1, 1, 1, 1,
-0.1460421, 0.1826376, -0.9997818, 1, 1, 1, 1, 1,
-0.1456181, 0.1023872, -0.1523708, 1, 1, 1, 1, 1,
-0.1446426, -0.2454002, -0.9373028, 1, 1, 1, 1, 1,
-0.1442536, 0.6050526, -1.479308, 1, 1, 1, 1, 1,
-0.1432498, 0.3660384, -0.6408138, 1, 1, 1, 1, 1,
-0.1403842, -2.750032, -3.126076, 1, 1, 1, 1, 1,
-0.1398659, -1.173323, -3.538804, 1, 1, 1, 1, 1,
-0.1398485, 0.3435776, 0.2334305, 0, 0, 1, 1, 1,
-0.1382331, -0.1804938, -3.777404, 1, 0, 0, 1, 1,
-0.1352875, -0.7451242, -3.560817, 1, 0, 0, 1, 1,
-0.130336, 1.807771, -1.236544, 1, 0, 0, 1, 1,
-0.1287001, -0.4826773, -2.538893, 1, 0, 0, 1, 1,
-0.1269366, 0.2731128, 1.045579, 1, 0, 0, 1, 1,
-0.1259174, 0.8906832, -0.2080069, 0, 0, 0, 1, 1,
-0.1253741, -1.686185, -1.679573, 0, 0, 0, 1, 1,
-0.1181922, -1.475946, -4.068483, 0, 0, 0, 1, 1,
-0.1155432, -1.037374, -3.458441, 0, 0, 0, 1, 1,
-0.1142856, -0.2502083, -2.441138, 0, 0, 0, 1, 1,
-0.1125229, -0.09114842, -3.089437, 0, 0, 0, 1, 1,
-0.1107584, -0.2147889, -1.746411, 0, 0, 0, 1, 1,
-0.1022327, -1.206781, -3.527234, 1, 1, 1, 1, 1,
-0.09672519, 0.09527156, -0.8554435, 1, 1, 1, 1, 1,
-0.09627412, 0.09807421, -0.9874684, 1, 1, 1, 1, 1,
-0.09433533, 1.249699, -0.2125073, 1, 1, 1, 1, 1,
-0.09273812, -0.5038841, -5.588383, 1, 1, 1, 1, 1,
-0.08935084, 1.15642, -0.1623466, 1, 1, 1, 1, 1,
-0.08926336, 0.1117756, -0.7753147, 1, 1, 1, 1, 1,
-0.08865046, 0.3009475, 0.3956671, 1, 1, 1, 1, 1,
-0.08859462, 0.2428516, 0.2342547, 1, 1, 1, 1, 1,
-0.08691379, 0.6521074, -0.4927104, 1, 1, 1, 1, 1,
-0.08459137, 0.06776358, -2.038729, 1, 1, 1, 1, 1,
-0.08398221, -0.8530784, -1.883912, 1, 1, 1, 1, 1,
-0.0813958, 1.896145, -0.8025479, 1, 1, 1, 1, 1,
-0.08018965, 0.8818174, -0.1867926, 1, 1, 1, 1, 1,
-0.08003747, -0.9411861, -4.428132, 1, 1, 1, 1, 1,
-0.07575344, 0.5046759, 1.550493, 0, 0, 1, 1, 1,
-0.07559447, -0.5672503, -2.772289, 1, 0, 0, 1, 1,
-0.07552588, -0.3201721, -3.455198, 1, 0, 0, 1, 1,
-0.07258841, -0.2120262, -2.955496, 1, 0, 0, 1, 1,
-0.07165332, -1.336508, -3.070166, 1, 0, 0, 1, 1,
-0.0662836, 0.2282711, -0.4727349, 1, 0, 0, 1, 1,
-0.06311996, -0.0008662093, -1.154176, 0, 0, 0, 1, 1,
-0.06056378, -0.08566358, -2.951662, 0, 0, 0, 1, 1,
-0.05618693, -1.120822, -4.425605, 0, 0, 0, 1, 1,
-0.05553775, 0.6327534, -0.8966151, 0, 0, 0, 1, 1,
-0.05276849, -0.9405801, -4.444062, 0, 0, 0, 1, 1,
-0.05173076, 1.075574, -1.556518, 0, 0, 0, 1, 1,
-0.05096608, 0.4029456, -0.1630547, 0, 0, 0, 1, 1,
-0.05085956, 1.178997, 0.246742, 1, 1, 1, 1, 1,
-0.04464225, 0.005615018, -1.919387, 1, 1, 1, 1, 1,
-0.04425365, 0.8831295, -0.1227302, 1, 1, 1, 1, 1,
-0.03834084, -0.7608182, -2.191504, 1, 1, 1, 1, 1,
-0.03587807, -0.02026022, -2.430715, 1, 1, 1, 1, 1,
-0.03220115, -0.7110516, -3.054253, 1, 1, 1, 1, 1,
-0.0298128, 0.2696512, -2.547213, 1, 1, 1, 1, 1,
-0.0236084, -0.2114406, -3.609886, 1, 1, 1, 1, 1,
-0.01891216, -2.29116, -4.022473, 1, 1, 1, 1, 1,
-0.0149498, 0.6545085, 1.012106, 1, 1, 1, 1, 1,
-0.01490388, -1.509624, -3.180523, 1, 1, 1, 1, 1,
-0.01332342, -0.8934625, -1.886416, 1, 1, 1, 1, 1,
-0.01266292, 0.2170844, -0.785719, 1, 1, 1, 1, 1,
-0.01158108, -1.429548, -2.904723, 1, 1, 1, 1, 1,
-0.009953656, -0.3375295, -3.697709, 1, 1, 1, 1, 1,
-0.00971315, 0.549673, -0.6129643, 0, 0, 1, 1, 1,
-0.003367371, -1.14368, -2.343614, 1, 0, 0, 1, 1,
0.003556465, -0.8797405, 4.470656, 1, 0, 0, 1, 1,
0.00469923, -0.2644729, 3.313993, 1, 0, 0, 1, 1,
0.005254415, -0.8738114, 3.627881, 1, 0, 0, 1, 1,
0.008546758, -0.2022263, 3.099199, 1, 0, 0, 1, 1,
0.010353, 1.176742, -0.0780887, 0, 0, 0, 1, 1,
0.01077875, 0.4471456, 0.5675984, 0, 0, 0, 1, 1,
0.01485875, -1.052009, 2.872258, 0, 0, 0, 1, 1,
0.01627829, 2.757095, 0.8922809, 0, 0, 0, 1, 1,
0.02410758, 0.6960669, -1.217063, 0, 0, 0, 1, 1,
0.02435872, 0.2774242, 0.5427564, 0, 0, 0, 1, 1,
0.02460451, -1.177997, 3.455897, 0, 0, 0, 1, 1,
0.0248403, 1.975146, 0.8265917, 1, 1, 1, 1, 1,
0.02630324, 1.592623, 0.2024088, 1, 1, 1, 1, 1,
0.03121036, 1.924613, -0.6136847, 1, 1, 1, 1, 1,
0.03308163, 0.4072115, -0.1691007, 1, 1, 1, 1, 1,
0.0339858, 0.4793858, -0.3297076, 1, 1, 1, 1, 1,
0.03500797, 0.1469437, 1.199897, 1, 1, 1, 1, 1,
0.03765326, -0.1636111, 1.551595, 1, 1, 1, 1, 1,
0.03784416, 0.9798515, -0.7407542, 1, 1, 1, 1, 1,
0.04128212, 1.440786, -0.4681398, 1, 1, 1, 1, 1,
0.0432316, -1.19152, 1.595977, 1, 1, 1, 1, 1,
0.04497005, 1.419835, -0.731799, 1, 1, 1, 1, 1,
0.04593311, -1.378215, 4.107603, 1, 1, 1, 1, 1,
0.04736007, 0.9173496, -0.6826584, 1, 1, 1, 1, 1,
0.05287411, -0.3703494, 2.56903, 1, 1, 1, 1, 1,
0.05368408, 0.8134899, 0.1949167, 1, 1, 1, 1, 1,
0.05408979, 1.249778, 2.559782, 0, 0, 1, 1, 1,
0.06213047, -0.03804678, 3.037061, 1, 0, 0, 1, 1,
0.0630803, 1.026538, 0.4516074, 1, 0, 0, 1, 1,
0.06324998, -0.9937065, 2.690747, 1, 0, 0, 1, 1,
0.06454217, 1.721261, 0.598401, 1, 0, 0, 1, 1,
0.07269417, 0.04757877, 0.364548, 1, 0, 0, 1, 1,
0.07585565, 0.816134, 0.136237, 0, 0, 0, 1, 1,
0.07599978, -0.03731655, 2.370557, 0, 0, 0, 1, 1,
0.08019536, -2.022713, 2.474903, 0, 0, 0, 1, 1,
0.08114112, 0.5235419, -0.8120666, 0, 0, 0, 1, 1,
0.0815405, 0.483131, -0.09837454, 0, 0, 0, 1, 1,
0.08605535, 0.7201856, 0.8999442, 0, 0, 0, 1, 1,
0.08641228, -0.6489506, 4.846506, 0, 0, 0, 1, 1,
0.09094192, 0.08857714, 0.3342858, 1, 1, 1, 1, 1,
0.09173486, 1.156588, 0.01199259, 1, 1, 1, 1, 1,
0.09279475, -0.1148576, 2.131314, 1, 1, 1, 1, 1,
0.0935811, 1.144272, 1.302701, 1, 1, 1, 1, 1,
0.09404353, -0.9561947, 3.697925, 1, 1, 1, 1, 1,
0.09414743, 2.281223, 0.9019561, 1, 1, 1, 1, 1,
0.09596111, -0.7601186, 2.774088, 1, 1, 1, 1, 1,
0.09749819, 1.060572, 0.7600316, 1, 1, 1, 1, 1,
0.1136139, 0.4919912, -0.06016773, 1, 1, 1, 1, 1,
0.1165539, -0.5819222, 2.632872, 1, 1, 1, 1, 1,
0.1170409, -0.9326892, 2.716055, 1, 1, 1, 1, 1,
0.1175546, 0.7598638, 0.5455928, 1, 1, 1, 1, 1,
0.1228156, 0.4243941, 0.6452575, 1, 1, 1, 1, 1,
0.1246832, -0.1392542, 3.79502, 1, 1, 1, 1, 1,
0.1247606, -1.360369, 3.826506, 1, 1, 1, 1, 1,
0.1258948, 1.457997, -0.7087508, 0, 0, 1, 1, 1,
0.126338, -0.703358, 2.365776, 1, 0, 0, 1, 1,
0.1308973, 0.5269353, 3.141477, 1, 0, 0, 1, 1,
0.1364188, -0.7759624, 1.87325, 1, 0, 0, 1, 1,
0.139281, 0.1146801, 0.6126657, 1, 0, 0, 1, 1,
0.1444904, -0.2916351, 3.570975, 1, 0, 0, 1, 1,
0.147289, 0.8982885, -1.262074, 0, 0, 0, 1, 1,
0.1485717, 0.5257886, 1.665649, 0, 0, 0, 1, 1,
0.1496622, -2.077525, 2.776416, 0, 0, 0, 1, 1,
0.1548927, -0.3235372, 2.660175, 0, 0, 0, 1, 1,
0.1580259, 1.181413, 0.1917257, 0, 0, 0, 1, 1,
0.158519, -2.668674, 2.795089, 0, 0, 0, 1, 1,
0.1587452, 0.6142388, -0.08211552, 0, 0, 0, 1, 1,
0.1626639, 0.1865442, -1.541537, 1, 1, 1, 1, 1,
0.1627824, 0.03288865, 2.730146, 1, 1, 1, 1, 1,
0.1634765, 0.2458047, 0.7167425, 1, 1, 1, 1, 1,
0.1676137, -0.396429, 1.05976, 1, 1, 1, 1, 1,
0.1688641, -0.05882867, 2.340411, 1, 1, 1, 1, 1,
0.1701368, 1.113748, 2.449284, 1, 1, 1, 1, 1,
0.1704908, 2.18448, -1.107475, 1, 1, 1, 1, 1,
0.17431, -0.366673, 3.153111, 1, 1, 1, 1, 1,
0.1756446, -0.1538026, 2.45369, 1, 1, 1, 1, 1,
0.1771223, 1.323559, 0.6406516, 1, 1, 1, 1, 1,
0.1797958, -0.8305622, 2.714839, 1, 1, 1, 1, 1,
0.18235, -1.080834, 5.273203, 1, 1, 1, 1, 1,
0.1873078, 1.619488, 0.3192485, 1, 1, 1, 1, 1,
0.1929494, 0.7985895, -0.391076, 1, 1, 1, 1, 1,
0.1932297, 1.780006, -0.09438696, 1, 1, 1, 1, 1,
0.1977422, -0.2427967, 2.433517, 0, 0, 1, 1, 1,
0.2017908, 1.918698, -0.071148, 1, 0, 0, 1, 1,
0.2088314, -0.8564332, 2.441842, 1, 0, 0, 1, 1,
0.2124319, 0.4723611, 0.2570588, 1, 0, 0, 1, 1,
0.214121, 1.313764, -0.7545199, 1, 0, 0, 1, 1,
0.2164378, -1.036023, 2.600828, 1, 0, 0, 1, 1,
0.2188243, -0.176607, 2.716979, 0, 0, 0, 1, 1,
0.2237151, 1.054062, 1.052638, 0, 0, 0, 1, 1,
0.2261884, -0.8179551, 3.069835, 0, 0, 0, 1, 1,
0.2273577, 0.2839155, 0.4341215, 0, 0, 0, 1, 1,
0.2286496, 0.5678897, 0.6258001, 0, 0, 0, 1, 1,
0.228896, 0.4256751, -0.8159051, 0, 0, 0, 1, 1,
0.2299764, 2.189239, 0.6107267, 0, 0, 0, 1, 1,
0.2312498, 0.2343874, -0.6722688, 1, 1, 1, 1, 1,
0.2345124, -0.6160752, 3.739273, 1, 1, 1, 1, 1,
0.2348094, -0.291158, 1.61888, 1, 1, 1, 1, 1,
0.2412718, -2.043594, 1.705489, 1, 1, 1, 1, 1,
0.243907, 0.2663783, 0.7456867, 1, 1, 1, 1, 1,
0.2491387, -2.428609, 3.185952, 1, 1, 1, 1, 1,
0.2492116, 0.6949327, 0.1496338, 1, 1, 1, 1, 1,
0.2492138, 0.9324776, 0.8322973, 1, 1, 1, 1, 1,
0.2531132, 1.989994, -0.05384351, 1, 1, 1, 1, 1,
0.2551181, 0.6375242, 1.592959, 1, 1, 1, 1, 1,
0.2564667, -1.007123, 3.116281, 1, 1, 1, 1, 1,
0.2613127, -0.02238242, 0.957433, 1, 1, 1, 1, 1,
0.2618626, -1.45648, 2.38032, 1, 1, 1, 1, 1,
0.2634334, -0.9493588, 1.650411, 1, 1, 1, 1, 1,
0.2635358, 0.6184222, -0.4082032, 1, 1, 1, 1, 1,
0.2640787, -1.231687, 2.338799, 0, 0, 1, 1, 1,
0.2646723, -0.1015216, 2.457609, 1, 0, 0, 1, 1,
0.2658179, -0.7074694, 1.939906, 1, 0, 0, 1, 1,
0.269705, -1.112344, 3.043761, 1, 0, 0, 1, 1,
0.27164, 0.1971808, 0.9804758, 1, 0, 0, 1, 1,
0.2729626, 1.2366, 1.349413, 1, 0, 0, 1, 1,
0.2756421, -1.244874, 4.037855, 0, 0, 0, 1, 1,
0.2760446, 1.050003, -0.4961652, 0, 0, 0, 1, 1,
0.2774279, 1.005516, 1.517567, 0, 0, 0, 1, 1,
0.2779419, -1.492868, 2.860262, 0, 0, 0, 1, 1,
0.2794396, -1.191627, 2.153406, 0, 0, 0, 1, 1,
0.2829354, -0.5166528, -0.1253751, 0, 0, 0, 1, 1,
0.2837822, 0.8107486, 1.634902, 0, 0, 0, 1, 1,
0.2841284, -1.169571, 3.229298, 1, 1, 1, 1, 1,
0.2876874, 0.6187858, 0.3142234, 1, 1, 1, 1, 1,
0.2877956, 0.6188761, 1.003145, 1, 1, 1, 1, 1,
0.2884914, -0.547191, 2.080634, 1, 1, 1, 1, 1,
0.2916415, -0.6416379, 3.462178, 1, 1, 1, 1, 1,
0.298334, -2.400676, 2.535201, 1, 1, 1, 1, 1,
0.3016686, -0.9690762, 2.57662, 1, 1, 1, 1, 1,
0.3029429, -0.04159584, 1.275624, 1, 1, 1, 1, 1,
0.303963, 0.3889809, 2.134176, 1, 1, 1, 1, 1,
0.3062854, -0.9773952, 2.369461, 1, 1, 1, 1, 1,
0.3095337, -2.035255, 3.232985, 1, 1, 1, 1, 1,
0.3121758, -0.6861727, 1.486821, 1, 1, 1, 1, 1,
0.3219615, 0.8441134, -0.6434014, 1, 1, 1, 1, 1,
0.323954, -0.1586274, 1.910012, 1, 1, 1, 1, 1,
0.3241211, 0.7624931, -1.570538, 1, 1, 1, 1, 1,
0.3387555, -1.233809, 2.759851, 0, 0, 1, 1, 1,
0.342714, 0.7502509, 0.06161888, 1, 0, 0, 1, 1,
0.3445879, 0.5544155, -0.2727078, 1, 0, 0, 1, 1,
0.3449277, -0.4935128, 2.47698, 1, 0, 0, 1, 1,
0.3471359, -0.006001229, 2.387792, 1, 0, 0, 1, 1,
0.3486304, -1.525466, 2.443689, 1, 0, 0, 1, 1,
0.3488994, 0.01651348, 2.360553, 0, 0, 0, 1, 1,
0.3500699, -0.006375221, 0.5203393, 0, 0, 0, 1, 1,
0.3521255, -0.09091961, 2.180198, 0, 0, 0, 1, 1,
0.3563319, -0.04513108, 2.468739, 0, 0, 0, 1, 1,
0.357555, 0.827754, 0.5196878, 0, 0, 0, 1, 1,
0.363665, -1.722484, 3.381974, 0, 0, 0, 1, 1,
0.3678044, 0.8444388, 0.6424496, 0, 0, 0, 1, 1,
0.3704737, 0.3066315, 1.223485, 1, 1, 1, 1, 1,
0.3780231, -0.09020638, 2.444471, 1, 1, 1, 1, 1,
0.3853022, 0.7988427, 1.534025, 1, 1, 1, 1, 1,
0.3868703, 0.03504641, 0.4586661, 1, 1, 1, 1, 1,
0.3913629, -0.8980184, 1.803212, 1, 1, 1, 1, 1,
0.3939381, -0.4628065, 1.897171, 1, 1, 1, 1, 1,
0.3946702, -0.9280897, 2.21929, 1, 1, 1, 1, 1,
0.3953271, -0.3719122, 3.7557, 1, 1, 1, 1, 1,
0.3959847, -1.05148, 2.575234, 1, 1, 1, 1, 1,
0.4018795, 0.08152041, 1.800879, 1, 1, 1, 1, 1,
0.4049306, 0.3733766, 1.053369, 1, 1, 1, 1, 1,
0.406924, -1.330683, 1.118979, 1, 1, 1, 1, 1,
0.4086643, -0.7856334, 2.758793, 1, 1, 1, 1, 1,
0.409069, -0.7865632, 4.163769, 1, 1, 1, 1, 1,
0.411094, 2.194103, -1.030074, 1, 1, 1, 1, 1,
0.4172626, -0.8049608, 2.078296, 0, 0, 1, 1, 1,
0.4213826, 0.8783644, 1.828555, 1, 0, 0, 1, 1,
0.42557, -0.4484874, 1.73193, 1, 0, 0, 1, 1,
0.4287123, -0.2173073, 0.7983738, 1, 0, 0, 1, 1,
0.4328023, 0.9318556, 0.6753352, 1, 0, 0, 1, 1,
0.4358366, 0.9235401, 0.7779105, 1, 0, 0, 1, 1,
0.4372571, -0.1675759, 1.731711, 0, 0, 0, 1, 1,
0.4386607, 0.6684798, 0.5160784, 0, 0, 0, 1, 1,
0.444194, 0.9537204, -0.4829374, 0, 0, 0, 1, 1,
0.446304, -0.006695446, 2.524149, 0, 0, 0, 1, 1,
0.4477871, -1.181862, 2.287071, 0, 0, 0, 1, 1,
0.4553789, -0.4195455, 1.55053, 0, 0, 0, 1, 1,
0.4643505, 0.4696039, 2.32121, 0, 0, 0, 1, 1,
0.4666017, 2.643305, 0.4337587, 1, 1, 1, 1, 1,
0.4670742, -0.9507758, 3.182445, 1, 1, 1, 1, 1,
0.4750447, 0.2115338, 1.11671, 1, 1, 1, 1, 1,
0.4763904, 1.549259, 0.7685286, 1, 1, 1, 1, 1,
0.4811071, 0.7200532, -0.8689782, 1, 1, 1, 1, 1,
0.4826466, 1.809283, 0.2666797, 1, 1, 1, 1, 1,
0.4840087, 0.1096977, 1.985838, 1, 1, 1, 1, 1,
0.486885, -1.390706, 4.197797, 1, 1, 1, 1, 1,
0.4909612, 1.890224, -0.5919259, 1, 1, 1, 1, 1,
0.4944204, 0.1927544, 1.653653, 1, 1, 1, 1, 1,
0.4969075, 0.6029784, -0.08408213, 1, 1, 1, 1, 1,
0.4984214, 1.79975, 0.4761386, 1, 1, 1, 1, 1,
0.4993231, -0.6781559, 1.859652, 1, 1, 1, 1, 1,
0.505867, -0.9422143, 4.219942, 1, 1, 1, 1, 1,
0.5072522, 2.603411, 0.116957, 1, 1, 1, 1, 1,
0.5106872, 0.6128024, 1.706949, 0, 0, 1, 1, 1,
0.5149117, -0.2991215, 3.019533, 1, 0, 0, 1, 1,
0.5193633, -1.094933, 2.884325, 1, 0, 0, 1, 1,
0.5207973, -0.5040062, 1.970126, 1, 0, 0, 1, 1,
0.5258434, -1.949852, 3.957086, 1, 0, 0, 1, 1,
0.5275899, 1.092332, 1.895646, 1, 0, 0, 1, 1,
0.5290052, 1.656705, -1.318904, 0, 0, 0, 1, 1,
0.5309029, -0.4987413, 3.067141, 0, 0, 0, 1, 1,
0.5353634, 0.0009414285, 2.184058, 0, 0, 0, 1, 1,
0.5375393, -0.604256, 2.813863, 0, 0, 0, 1, 1,
0.5403798, -0.02705807, 2.936081, 0, 0, 0, 1, 1,
0.5410231, 0.7086135, 0.7932835, 0, 0, 0, 1, 1,
0.5443026, 0.993716, 1.178691, 0, 0, 0, 1, 1,
0.5454174, 0.5909787, 0.1351288, 1, 1, 1, 1, 1,
0.5454993, -0.9051501, 1.651498, 1, 1, 1, 1, 1,
0.5461918, -2.347859, 3.48123, 1, 1, 1, 1, 1,
0.550217, 0.9888607, 0.8927425, 1, 1, 1, 1, 1,
0.551703, -0.2315398, 3.176485, 1, 1, 1, 1, 1,
0.5519862, 0.8547875, 0.9864584, 1, 1, 1, 1, 1,
0.5527543, 0.4258425, 0.5506266, 1, 1, 1, 1, 1,
0.5622485, 1.43105, -1.339558, 1, 1, 1, 1, 1,
0.5626569, 1.872107, 1.654739, 1, 1, 1, 1, 1,
0.5627227, -1.171342, 2.2649, 1, 1, 1, 1, 1,
0.565329, 0.2903241, 3.429049, 1, 1, 1, 1, 1,
0.5702835, -0.1676087, 0.8018366, 1, 1, 1, 1, 1,
0.5713108, 0.2587081, 1.591146, 1, 1, 1, 1, 1,
0.5761303, -1.480186, 4.468729, 1, 1, 1, 1, 1,
0.5768644, -0.6254639, 1.706216, 1, 1, 1, 1, 1,
0.5864999, 0.4304565, 1.742592, 0, 0, 1, 1, 1,
0.5928751, -1.452233, 1.246107, 1, 0, 0, 1, 1,
0.5943999, -0.5147536, 1.425717, 1, 0, 0, 1, 1,
0.595284, -0.1398469, 0.8285403, 1, 0, 0, 1, 1,
0.5959341, 1.590978, 1.419073, 1, 0, 0, 1, 1,
0.6035259, -0.346017, 1.840831, 1, 0, 0, 1, 1,
0.621121, 0.3751017, 1.557411, 0, 0, 0, 1, 1,
0.6238212, 0.0722378, 3.365415, 0, 0, 0, 1, 1,
0.6259218, -0.710191, 0.6388415, 0, 0, 0, 1, 1,
0.632786, -2.155375, 3.623469, 0, 0, 0, 1, 1,
0.6343837, -1.531608, 3.85404, 0, 0, 0, 1, 1,
0.6410534, -0.2145571, 0.9129499, 0, 0, 0, 1, 1,
0.6417452, -0.879112, 3.07292, 0, 0, 0, 1, 1,
0.6421303, 0.8930001, 0.5999937, 1, 1, 1, 1, 1,
0.6459436, 1.027366, 0.7723593, 1, 1, 1, 1, 1,
0.6464118, -0.6706926, 2.663888, 1, 1, 1, 1, 1,
0.6465532, 0.5219377, -0.2850823, 1, 1, 1, 1, 1,
0.65266, -1.125993, 2.515597, 1, 1, 1, 1, 1,
0.6563651, 0.7455524, -0.2730027, 1, 1, 1, 1, 1,
0.6648058, -0.04903885, 1.824551, 1, 1, 1, 1, 1,
0.6658919, -0.538705, 4.010369, 1, 1, 1, 1, 1,
0.6679122, -0.4263661, 2.616112, 1, 1, 1, 1, 1,
0.6726806, 0.7846093, 0.1627808, 1, 1, 1, 1, 1,
0.683139, 0.8404142, -1.39635, 1, 1, 1, 1, 1,
0.6910309, 0.2616419, -0.5996383, 1, 1, 1, 1, 1,
0.6918986, 0.4545748, 1.385942, 1, 1, 1, 1, 1,
0.6993788, -2.505468, 3.485434, 1, 1, 1, 1, 1,
0.7017307, 0.7618175, 0.5420284, 1, 1, 1, 1, 1,
0.7043113, -0.9743155, 2.694819, 0, 0, 1, 1, 1,
0.7044586, -0.2295125, 3.31215, 1, 0, 0, 1, 1,
0.7072052, 1.330828, 2.240874, 1, 0, 0, 1, 1,
0.7220201, -0.3173423, 1.149895, 1, 0, 0, 1, 1,
0.7220791, -0.7531282, 3.775109, 1, 0, 0, 1, 1,
0.722387, 1.044959, 1.004499, 1, 0, 0, 1, 1,
0.7238345, -0.9418744, 3.127658, 0, 0, 0, 1, 1,
0.7255285, 0.5447544, 0.6730009, 0, 0, 0, 1, 1,
0.7290266, -0.9958452, 2.942024, 0, 0, 0, 1, 1,
0.7328887, 0.9256401, -0.3849152, 0, 0, 0, 1, 1,
0.7331569, -0.1367984, 0.9721547, 0, 0, 0, 1, 1,
0.7378573, 0.898828, 1.068442, 0, 0, 0, 1, 1,
0.7416649, -1.502244, 1.416839, 0, 0, 0, 1, 1,
0.7430236, -0.7444099, 2.115741, 1, 1, 1, 1, 1,
0.7491268, -1.266313, 3.102828, 1, 1, 1, 1, 1,
0.7545083, -0.2252939, 1.185131, 1, 1, 1, 1, 1,
0.7549438, 0.6353852, -0.1618427, 1, 1, 1, 1, 1,
0.7652693, 1.50476, 0.03044092, 1, 1, 1, 1, 1,
0.7746409, 0.06840303, 1.715494, 1, 1, 1, 1, 1,
0.7750643, 0.6575798, 0.4826455, 1, 1, 1, 1, 1,
0.7761796, 0.6716207, 0.7196825, 1, 1, 1, 1, 1,
0.7821155, 0.5651412, 1.142808, 1, 1, 1, 1, 1,
0.7848767, -0.05126052, 3.413857, 1, 1, 1, 1, 1,
0.7859257, -0.04767372, 0.4729506, 1, 1, 1, 1, 1,
0.7896679, -0.5792817, 3.149064, 1, 1, 1, 1, 1,
0.7944337, 0.06264579, -0.3930607, 1, 1, 1, 1, 1,
0.8001898, 1.198864, 1.050623, 1, 1, 1, 1, 1,
0.8024578, -0.4115821, 2.991325, 1, 1, 1, 1, 1,
0.8064131, -0.5516334, 2.816466, 0, 0, 1, 1, 1,
0.8070338, -0.3568583, 0.06214668, 1, 0, 0, 1, 1,
0.8070989, 0.0339315, 2.58737, 1, 0, 0, 1, 1,
0.8085677, 0.3920245, 0.7326605, 1, 0, 0, 1, 1,
0.8086674, -0.7807819, 3.828762, 1, 0, 0, 1, 1,
0.8148011, 2.73774, 1.71744, 1, 0, 0, 1, 1,
0.8161097, -0.6144862, 0.8400668, 0, 0, 0, 1, 1,
0.8186493, 1.042256, 1.068251, 0, 0, 0, 1, 1,
0.818725, -0.1728437, 2.906117, 0, 0, 0, 1, 1,
0.8193365, -2.529866, 1.35236, 0, 0, 0, 1, 1,
0.8194776, -0.09471443, 2.258099, 0, 0, 0, 1, 1,
0.8258567, -0.8243537, -0.01767801, 0, 0, 0, 1, 1,
0.8272444, 0.6859385, 0.3450325, 0, 0, 0, 1, 1,
0.8360054, -0.5106795, 1.152219, 1, 1, 1, 1, 1,
0.8362834, 0.7023662, 0.7472756, 1, 1, 1, 1, 1,
0.8365046, 0.6292672, 1.213198, 1, 1, 1, 1, 1,
0.8368371, -0.9307786, 2.546312, 1, 1, 1, 1, 1,
0.8466421, -0.5898082, 1.793635, 1, 1, 1, 1, 1,
0.8478141, -0.1479687, 1.184262, 1, 1, 1, 1, 1,
0.8519815, 0.2283187, 0.5766048, 1, 1, 1, 1, 1,
0.8550292, -1.497367, 2.336421, 1, 1, 1, 1, 1,
0.8627103, 1.153489, -0.4147057, 1, 1, 1, 1, 1,
0.8629, -0.181785, -0.3990223, 1, 1, 1, 1, 1,
0.864396, -0.1468596, 1.493523, 1, 1, 1, 1, 1,
0.8648983, -0.08008354, -0.1211513, 1, 1, 1, 1, 1,
0.8729515, -0.9633226, 1.691985, 1, 1, 1, 1, 1,
0.881918, 0.4790783, 0.7284753, 1, 1, 1, 1, 1,
0.8829194, -0.4049891, 1.652321, 1, 1, 1, 1, 1,
0.8829783, -0.4681834, -0.4017315, 0, 0, 1, 1, 1,
0.8836225, -2.740041, 0.7782667, 1, 0, 0, 1, 1,
0.8919571, 1.343944, 0.8205802, 1, 0, 0, 1, 1,
0.8959399, -1.109771, 1.825916, 1, 0, 0, 1, 1,
0.900162, -0.2991767, 1.768095, 1, 0, 0, 1, 1,
0.9011893, 0.3573569, 2.279591, 1, 0, 0, 1, 1,
0.9083871, -1.009325, 3.040457, 0, 0, 0, 1, 1,
0.9138607, 0.3799688, 1.294271, 0, 0, 0, 1, 1,
0.9165375, -0.2361249, 1.106219, 0, 0, 0, 1, 1,
0.9186177, 0.2688849, 0.5911152, 0, 0, 0, 1, 1,
0.9207708, 0.4006904, 0.4201307, 0, 0, 0, 1, 1,
0.9219498, 0.2888384, 0.5710617, 0, 0, 0, 1, 1,
0.9314094, -0.3227839, 1.951575, 0, 0, 0, 1, 1,
0.9347348, -0.05969508, 0.4160996, 1, 1, 1, 1, 1,
0.935751, 0.3332069, 0.7934301, 1, 1, 1, 1, 1,
0.939992, 1.151996, 1.599536, 1, 1, 1, 1, 1,
0.9432492, -1.086233, 2.980942, 1, 1, 1, 1, 1,
0.9459807, -1.553516, 2.774971, 1, 1, 1, 1, 1,
0.9494459, 1.53872, -0.2473511, 1, 1, 1, 1, 1,
0.9548336, -1.263298, 1.628772, 1, 1, 1, 1, 1,
0.9548934, -1.103682, 3.864853, 1, 1, 1, 1, 1,
0.9572833, -1.059367, 1.827425, 1, 1, 1, 1, 1,
0.9591891, -0.572973, 1.863549, 1, 1, 1, 1, 1,
0.9662873, 1.027575, -0.9654498, 1, 1, 1, 1, 1,
0.970179, -0.03044472, 2.700812, 1, 1, 1, 1, 1,
0.9749207, 1.089573, 0.7315782, 1, 1, 1, 1, 1,
0.9773813, -1.945751, 3.27002, 1, 1, 1, 1, 1,
0.9799824, -0.05526475, 1.006138, 1, 1, 1, 1, 1,
0.9824272, -0.01481231, 2.006715, 0, 0, 1, 1, 1,
0.9890738, 0.433886, 0.3384684, 1, 0, 0, 1, 1,
0.9893409, 1.789917, -0.08224922, 1, 0, 0, 1, 1,
0.9918076, 1.553844, 0.8354105, 1, 0, 0, 1, 1,
0.9962984, -1.516905, 1.843519, 1, 0, 0, 1, 1,
1.000226, 0.6954963, -0.2148939, 1, 0, 0, 1, 1,
1.006458, -0.248883, -0.07236796, 0, 0, 0, 1, 1,
1.012769, -0.7977948, 1.964726, 0, 0, 0, 1, 1,
1.015278, -0.8416428, 2.528283, 0, 0, 0, 1, 1,
1.021926, -0.7013238, 2.330265, 0, 0, 0, 1, 1,
1.026907, -0.7352057, 2.710674, 0, 0, 0, 1, 1,
1.028933, 1.709211, -0.8009654, 0, 0, 0, 1, 1,
1.038199, 0.7063236, 1.857247, 0, 0, 0, 1, 1,
1.041798, -1.071429, 2.450986, 1, 1, 1, 1, 1,
1.046555, 1.041164, 0.8703641, 1, 1, 1, 1, 1,
1.051045, -0.7548978, 2.811637, 1, 1, 1, 1, 1,
1.060013, -1.34522, 3.404237, 1, 1, 1, 1, 1,
1.061166, -0.2899986, 0.4547847, 1, 1, 1, 1, 1,
1.065356, -1.674406, 2.120596, 1, 1, 1, 1, 1,
1.069047, -0.7638364, 1.716244, 1, 1, 1, 1, 1,
1.083691, -1.492151, 3.322124, 1, 1, 1, 1, 1,
1.086071, 0.7177751, 1.363273, 1, 1, 1, 1, 1,
1.093851, 0.2702159, 2.322579, 1, 1, 1, 1, 1,
1.1037, -1.420273, 3.737387, 1, 1, 1, 1, 1,
1.108389, 0.544638, 0.6239535, 1, 1, 1, 1, 1,
1.110364, 0.2820865, 3.389575, 1, 1, 1, 1, 1,
1.112145, 0.09487996, 0.3372704, 1, 1, 1, 1, 1,
1.112249, -0.06253729, 2.346281, 1, 1, 1, 1, 1,
1.135808, 0.1952441, 1.253245, 0, 0, 1, 1, 1,
1.138986, 2.300956, -1.01414, 1, 0, 0, 1, 1,
1.139021, -0.4454813, 2.422727, 1, 0, 0, 1, 1,
1.140823, -1.312871, 2.13025, 1, 0, 0, 1, 1,
1.147999, 0.3006212, 2.304486, 1, 0, 0, 1, 1,
1.149304, -0.443748, 1.255819, 1, 0, 0, 1, 1,
1.149664, 0.6704847, 1.336173, 0, 0, 0, 1, 1,
1.151145, 2.450803, 0.6608462, 0, 0, 0, 1, 1,
1.154972, -0.6328174, 2.709204, 0, 0, 0, 1, 1,
1.158441, -0.7838235, 1.916965, 0, 0, 0, 1, 1,
1.159897, -0.619033, 0.7375686, 0, 0, 0, 1, 1,
1.167714, 0.8878999, 1.367418, 0, 0, 0, 1, 1,
1.169834, -0.9217691, 1.916031, 0, 0, 0, 1, 1,
1.169888, -0.3705566, 1.171317, 1, 1, 1, 1, 1,
1.171783, -0.7917613, 0.4263969, 1, 1, 1, 1, 1,
1.198233, 0.1978775, 1.671783, 1, 1, 1, 1, 1,
1.20064, 0.8971277, 1.848557, 1, 1, 1, 1, 1,
1.213917, 1.915848, -1.568405, 1, 1, 1, 1, 1,
1.214634, -0.861512, 1.66722, 1, 1, 1, 1, 1,
1.215531, -1.157754, 2.214869, 1, 1, 1, 1, 1,
1.230722, -0.4037623, 1.187943, 1, 1, 1, 1, 1,
1.23951, 1.076041, 1.249212, 1, 1, 1, 1, 1,
1.249978, 0.4505484, 1.027644, 1, 1, 1, 1, 1,
1.255705, 0.3381786, 2.59263, 1, 1, 1, 1, 1,
1.257944, -0.788696, 4.179038, 1, 1, 1, 1, 1,
1.272713, 0.1246844, -0.6877277, 1, 1, 1, 1, 1,
1.278104, -1.749645, 0.7301745, 1, 1, 1, 1, 1,
1.2851, 0.6731459, -0.2769413, 1, 1, 1, 1, 1,
1.285157, -1.300706, 4.620913, 0, 0, 1, 1, 1,
1.289909, 0.6029238, -0.02140809, 1, 0, 0, 1, 1,
1.293805, 2.159142, 1.066274, 1, 0, 0, 1, 1,
1.299075, -1.036301, 2.11214, 1, 0, 0, 1, 1,
1.305174, 0.8599316, 2.640547, 1, 0, 0, 1, 1,
1.308641, -0.05115613, 2.014301, 1, 0, 0, 1, 1,
1.3172, 2.693935, 0.9354848, 0, 0, 0, 1, 1,
1.326401, 1.013469, 1.271391, 0, 0, 0, 1, 1,
1.339644, 0.9461332, 0.7805894, 0, 0, 0, 1, 1,
1.35138, 1.230861, 1.155665, 0, 0, 0, 1, 1,
1.356251, -0.4874289, 1.6516, 0, 0, 0, 1, 1,
1.372722, -0.7871929, 1.590848, 0, 0, 0, 1, 1,
1.375912, -0.8534811, 3.250475, 0, 0, 0, 1, 1,
1.380924, 0.8162536, 0.5223143, 1, 1, 1, 1, 1,
1.40052, -0.5646457, 2.275868, 1, 1, 1, 1, 1,
1.40107, 0.956872, 1.144192, 1, 1, 1, 1, 1,
1.406245, 0.07219958, 0.5884593, 1, 1, 1, 1, 1,
1.411827, -0.7180659, 1.797609, 1, 1, 1, 1, 1,
1.421276, -1.145039, 1.41828, 1, 1, 1, 1, 1,
1.422172, 0.7644443, 0.7680637, 1, 1, 1, 1, 1,
1.424904, -0.07326169, -0.05807125, 1, 1, 1, 1, 1,
1.42932, -0.7787175, 1.222694, 1, 1, 1, 1, 1,
1.434248, -1.106561, 2.909463, 1, 1, 1, 1, 1,
1.451709, -1.364749, 2.777749, 1, 1, 1, 1, 1,
1.480601, -0.773394, 1.124225, 1, 1, 1, 1, 1,
1.485425, 0.2991443, 1.691231, 1, 1, 1, 1, 1,
1.492792, -0.9625742, 2.511584, 1, 1, 1, 1, 1,
1.509166, 0.6167023, 0.3421031, 1, 1, 1, 1, 1,
1.521478, -0.08426011, 1.729285, 0, 0, 1, 1, 1,
1.526102, -2.536166, 3.403324, 1, 0, 0, 1, 1,
1.530535, 1.973225, 0.2204332, 1, 0, 0, 1, 1,
1.539103, -1.174535, 2.722023, 1, 0, 0, 1, 1,
1.545068, -1.479419, 2.20085, 1, 0, 0, 1, 1,
1.55511, -0.2189536, 2.010671, 1, 0, 0, 1, 1,
1.564383, 0.1930089, 2.206765, 0, 0, 0, 1, 1,
1.619059, -2.291307, 2.692446, 0, 0, 0, 1, 1,
1.627131, -1.573327, 2.832635, 0, 0, 0, 1, 1,
1.634796, 0.4415862, 1.463032, 0, 0, 0, 1, 1,
1.635583, 1.267982, 0.08799423, 0, 0, 0, 1, 1,
1.639522, -0.114662, -0.2043968, 0, 0, 0, 1, 1,
1.65997, 1.257647, 2.799356, 0, 0, 0, 1, 1,
1.663103, 0.4812752, 1.005852, 1, 1, 1, 1, 1,
1.671603, -0.7141523, 1.777654, 1, 1, 1, 1, 1,
1.679941, 1.281962, 1.995945, 1, 1, 1, 1, 1,
1.711668, 0.5813093, 1.666919, 1, 1, 1, 1, 1,
1.753906, -0.1109397, 3.243879, 1, 1, 1, 1, 1,
1.770343, -0.01378307, 0.5479694, 1, 1, 1, 1, 1,
1.77106, 0.6577623, 1.102445, 1, 1, 1, 1, 1,
1.791182, 1.649763, 0.3546838, 1, 1, 1, 1, 1,
1.802427, 0.3797054, 0.4359606, 1, 1, 1, 1, 1,
1.815674, -0.5084934, 1.031471, 1, 1, 1, 1, 1,
1.862047, 1.000823, 0.4564023, 1, 1, 1, 1, 1,
1.862294, 0.7286421, 2.242261, 1, 1, 1, 1, 1,
1.864963, 0.6287524, 2.163498, 1, 1, 1, 1, 1,
1.868556, 0.1987926, 3.604514, 1, 1, 1, 1, 1,
1.883298, 0.6194518, 1.939486, 1, 1, 1, 1, 1,
1.897371, 1.133636, 2.522488, 0, 0, 1, 1, 1,
1.902536, -0.01813527, 1.786066, 1, 0, 0, 1, 1,
1.907968, -2.352686, 3.540575, 1, 0, 0, 1, 1,
1.932594, -1.430604, 1.503166, 1, 0, 0, 1, 1,
1.941602, 0.3432899, -0.1815428, 1, 0, 0, 1, 1,
1.971457, 0.86965, 0.7195047, 1, 0, 0, 1, 1,
1.97323, 0.8800842, 0.5649028, 0, 0, 0, 1, 1,
2.036856, 0.2004117, 2.994998, 0, 0, 0, 1, 1,
2.043865, -0.1407282, 0.989312, 0, 0, 0, 1, 1,
2.056349, 0.04679189, 1.556096, 0, 0, 0, 1, 1,
2.059784, -0.1147278, 1.668378, 0, 0, 0, 1, 1,
2.14417, -0.0446615, 3.366437, 0, 0, 0, 1, 1,
2.159082, 0.9439689, 2.249189, 0, 0, 0, 1, 1,
2.176159, 0.04465308, 1.042941, 1, 1, 1, 1, 1,
2.215237, 2.27167, 0.04266762, 1, 1, 1, 1, 1,
2.282326, 0.4046705, 2.073226, 1, 1, 1, 1, 1,
2.324423, -1.291986, 2.395347, 1, 1, 1, 1, 1,
2.579593, -1.09053, 2.994844, 1, 1, 1, 1, 1,
2.826585, 0.8463976, 0.9186039, 1, 1, 1, 1, 1,
3.700151, 1.109605, 2.062462, 1, 1, 1, 1, 1
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
var radius = 9.836015;
var distance = 34.54858;
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
mvMatrix.translate( -0.1670978, -0.003531098, 0.4587018 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.54858);
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
