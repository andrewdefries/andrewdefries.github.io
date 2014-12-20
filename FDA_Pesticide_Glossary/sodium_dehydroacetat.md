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
-3.453308, 0.04674377, -0.7378969, 1, 0, 0, 1,
-3.451436, -0.1905718, -1.084765, 1, 0.007843138, 0, 1,
-3.032571, -0.1047221, -1.143569, 1, 0.01176471, 0, 1,
-2.933011, -1.007232, -2.048123, 1, 0.01960784, 0, 1,
-2.811839, 1.289467, -0.776925, 1, 0.02352941, 0, 1,
-2.546013, -1.637922, -1.422632, 1, 0.03137255, 0, 1,
-2.510798, 0.4048428, -1.01839, 1, 0.03529412, 0, 1,
-2.401693, 1.161476, -2.018244, 1, 0.04313726, 0, 1,
-2.262933, 2.254365, 0.7819781, 1, 0.04705882, 0, 1,
-2.26251, -0.8210615, -1.059113, 1, 0.05490196, 0, 1,
-2.262011, 0.09142903, -1.787074, 1, 0.05882353, 0, 1,
-2.254736, 0.09772294, -0.9430816, 1, 0.06666667, 0, 1,
-2.198166, -2.333363, -3.237115, 1, 0.07058824, 0, 1,
-2.197759, 1.412218, 0.1036275, 1, 0.07843138, 0, 1,
-2.108247, 1.665015, -0.1491702, 1, 0.08235294, 0, 1,
-2.055098, 0.09111978, -0.6263182, 1, 0.09019608, 0, 1,
-2.023598, -0.826336, -2.42755, 1, 0.09411765, 0, 1,
-2.011536, -1.02242, -2.311064, 1, 0.1019608, 0, 1,
-2.010493, -1.474236, -2.307803, 1, 0.1098039, 0, 1,
-2.005131, 0.05971459, -0.5375561, 1, 0.1137255, 0, 1,
-2.002503, -0.7285236, -1.873648, 1, 0.1215686, 0, 1,
-1.9629, -0.2780002, -3.055182, 1, 0.1254902, 0, 1,
-1.957311, 0.07679571, 0.1845881, 1, 0.1333333, 0, 1,
-1.953528, 0.3941368, -1.127992, 1, 0.1372549, 0, 1,
-1.941918, 1.007609, -2.031408, 1, 0.145098, 0, 1,
-1.934969, 1.576947, -1.200011, 1, 0.1490196, 0, 1,
-1.931331, 0.6746261, -0.8863646, 1, 0.1568628, 0, 1,
-1.892295, -0.6404818, -1.584675, 1, 0.1607843, 0, 1,
-1.890878, 0.425502, -0.5347342, 1, 0.1686275, 0, 1,
-1.889983, -1.443547, -2.350843, 1, 0.172549, 0, 1,
-1.888916, -1.248586, -0.8065665, 1, 0.1803922, 0, 1,
-1.853835, -0.5383414, -1.77965, 1, 0.1843137, 0, 1,
-1.820507, 1.675777, -1.325097, 1, 0.1921569, 0, 1,
-1.799559, 1.156647, -0.9740245, 1, 0.1960784, 0, 1,
-1.789561, 2.053383, -1.448401, 1, 0.2039216, 0, 1,
-1.789226, -0.6506091, -3.307005, 1, 0.2117647, 0, 1,
-1.787121, -0.05050569, -0.8189357, 1, 0.2156863, 0, 1,
-1.782806, 0.06053628, -3.164845, 1, 0.2235294, 0, 1,
-1.779513, 0.592577, -1.291205, 1, 0.227451, 0, 1,
-1.779383, 0.01602845, -0.4662572, 1, 0.2352941, 0, 1,
-1.771592, -0.5659135, -1.700127, 1, 0.2392157, 0, 1,
-1.771304, 0.3401011, -1.910203, 1, 0.2470588, 0, 1,
-1.769429, 2.477168, -2.186043, 1, 0.2509804, 0, 1,
-1.76929, 1.127016, -1.35642, 1, 0.2588235, 0, 1,
-1.757637, 0.9523858, -2.007545, 1, 0.2627451, 0, 1,
-1.735608, -0.08978689, -1.256267, 1, 0.2705882, 0, 1,
-1.719932, -1.285745, -3.186759, 1, 0.2745098, 0, 1,
-1.717086, -1.107085, -2.240352, 1, 0.282353, 0, 1,
-1.69325, 1.226987, 0.06497675, 1, 0.2862745, 0, 1,
-1.64284, 2.011343, 0.09885313, 1, 0.2941177, 0, 1,
-1.634665, -0.4190995, -2.095255, 1, 0.3019608, 0, 1,
-1.628593, 1.153516, -0.2556524, 1, 0.3058824, 0, 1,
-1.626832, -0.7131137, -0.7309583, 1, 0.3137255, 0, 1,
-1.62427, -0.1769855, -0.2827803, 1, 0.3176471, 0, 1,
-1.613534, -0.1991633, -1.890002, 1, 0.3254902, 0, 1,
-1.610947, -0.8630422, -0.3316317, 1, 0.3294118, 0, 1,
-1.598208, -0.3436656, -1.159959, 1, 0.3372549, 0, 1,
-1.593559, -1.930596, -2.694585, 1, 0.3411765, 0, 1,
-1.583494, -0.738222, -1.646079, 1, 0.3490196, 0, 1,
-1.571677, 0.9214203, -1.956837, 1, 0.3529412, 0, 1,
-1.565198, 0.4778737, -0.8541295, 1, 0.3607843, 0, 1,
-1.545603, -1.276308, -3.159702, 1, 0.3647059, 0, 1,
-1.545428, 0.2148847, -1.286226, 1, 0.372549, 0, 1,
-1.539569, -1.278665, -1.561585, 1, 0.3764706, 0, 1,
-1.536302, 0.2826365, -1.724991, 1, 0.3843137, 0, 1,
-1.521926, 0.6964658, -0.9996682, 1, 0.3882353, 0, 1,
-1.520139, 0.004529718, -1.56636, 1, 0.3960784, 0, 1,
-1.514611, -0.1226384, -0.8889691, 1, 0.4039216, 0, 1,
-1.503695, 0.8734567, -0.5767095, 1, 0.4078431, 0, 1,
-1.488297, 0.3607376, -1.450957, 1, 0.4156863, 0, 1,
-1.482419, 1.364408, -0.7136924, 1, 0.4196078, 0, 1,
-1.48217, 0.7609492, -1.610117, 1, 0.427451, 0, 1,
-1.481576, 0.434253, -1.469664, 1, 0.4313726, 0, 1,
-1.479058, -1.157784, -3.095549, 1, 0.4392157, 0, 1,
-1.478737, -1.17014, -3.768145, 1, 0.4431373, 0, 1,
-1.473926, -0.1396076, 0.2302158, 1, 0.4509804, 0, 1,
-1.453135, 1.344098, -2.66007, 1, 0.454902, 0, 1,
-1.452578, 0.6630926, -0.3909248, 1, 0.4627451, 0, 1,
-1.452108, 1.491199, -0.694077, 1, 0.4666667, 0, 1,
-1.448944, -0.785425, -0.8256053, 1, 0.4745098, 0, 1,
-1.447721, -0.1963932, -1.741769, 1, 0.4784314, 0, 1,
-1.439255, -0.8166196, -0.4516543, 1, 0.4862745, 0, 1,
-1.438462, -1.204961, -0.8862432, 1, 0.4901961, 0, 1,
-1.435999, 0.7191022, 0.3292821, 1, 0.4980392, 0, 1,
-1.434812, -1.934691, -2.113731, 1, 0.5058824, 0, 1,
-1.429589, 0.07886138, -1.006989, 1, 0.509804, 0, 1,
-1.428127, -0.3270461, -2.935448, 1, 0.5176471, 0, 1,
-1.424867, 0.08024333, -0.1105575, 1, 0.5215687, 0, 1,
-1.422861, 2.393707, 0.6499866, 1, 0.5294118, 0, 1,
-1.403915, -0.3898896, -3.146916, 1, 0.5333334, 0, 1,
-1.401039, -0.06937339, 0.07105246, 1, 0.5411765, 0, 1,
-1.399496, 0.402513, -2.846245, 1, 0.5450981, 0, 1,
-1.396957, -1.084401, -0.7447816, 1, 0.5529412, 0, 1,
-1.396855, -1.325903, -1.079306, 1, 0.5568628, 0, 1,
-1.390688, -1.032663, -0.7485533, 1, 0.5647059, 0, 1,
-1.383197, 1.673025, 0.2247534, 1, 0.5686275, 0, 1,
-1.38047, -1.550326, -5.09833, 1, 0.5764706, 0, 1,
-1.373062, -0.2599922, -1.366755, 1, 0.5803922, 0, 1,
-1.364736, 0.6284987, -2.113775, 1, 0.5882353, 0, 1,
-1.361928, 0.2850073, -3.181686, 1, 0.5921569, 0, 1,
-1.344799, 0.5170835, -1.188208, 1, 0.6, 0, 1,
-1.340415, -0.6357952, -0.343154, 1, 0.6078432, 0, 1,
-1.325988, -0.00239725, -2.552955, 1, 0.6117647, 0, 1,
-1.32515, -0.1327325, -3.612832, 1, 0.6196079, 0, 1,
-1.321885, -0.4238954, -2.373628, 1, 0.6235294, 0, 1,
-1.318995, 2.581141, 1.496031, 1, 0.6313726, 0, 1,
-1.312605, -0.003557431, -1.952332, 1, 0.6352941, 0, 1,
-1.307079, 1.470497, -0.7247733, 1, 0.6431373, 0, 1,
-1.305031, 1.328273, -1.381306, 1, 0.6470588, 0, 1,
-1.30354, 1.456602, -0.6311167, 1, 0.654902, 0, 1,
-1.300801, -1.114694, -2.72717, 1, 0.6588235, 0, 1,
-1.290222, -0.1397618, -0.1543217, 1, 0.6666667, 0, 1,
-1.288462, 0.6208317, -1.202938, 1, 0.6705883, 0, 1,
-1.26678, 0.492012, -2.216863, 1, 0.6784314, 0, 1,
-1.263636, -0.7222619, -0.983597, 1, 0.682353, 0, 1,
-1.262643, 1.884343, 0.3496804, 1, 0.6901961, 0, 1,
-1.261537, 1.109053, -1.541128, 1, 0.6941177, 0, 1,
-1.260824, -0.9103915, -1.302137, 1, 0.7019608, 0, 1,
-1.256867, 0.1497395, -2.035094, 1, 0.7098039, 0, 1,
-1.251478, 0.9664676, -0.2673337, 1, 0.7137255, 0, 1,
-1.249202, -0.02269717, -1.971058, 1, 0.7215686, 0, 1,
-1.246296, -0.5244156, -1.820822, 1, 0.7254902, 0, 1,
-1.239289, 0.6757097, -0.2761655, 1, 0.7333333, 0, 1,
-1.208748, -0.2852156, -2.300942, 1, 0.7372549, 0, 1,
-1.198846, 0.1206454, -2.052053, 1, 0.7450981, 0, 1,
-1.196325, -0.9071167, -2.646824, 1, 0.7490196, 0, 1,
-1.195334, 0.02683646, 0.2678757, 1, 0.7568628, 0, 1,
-1.194097, -3.406222, -3.302032, 1, 0.7607843, 0, 1,
-1.188383, 0.3300705, -0.1244673, 1, 0.7686275, 0, 1,
-1.181496, 0.6573375, -3.072278, 1, 0.772549, 0, 1,
-1.180626, -1.22471, -1.244044, 1, 0.7803922, 0, 1,
-1.180297, -0.4294868, -0.5079369, 1, 0.7843137, 0, 1,
-1.165835, -0.2416039, -2.18363, 1, 0.7921569, 0, 1,
-1.162314, -1.061963, -2.933292, 1, 0.7960784, 0, 1,
-1.157625, -0.7200263, -2.082586, 1, 0.8039216, 0, 1,
-1.157174, 0.0679348, -0.9034768, 1, 0.8117647, 0, 1,
-1.141856, 1.656911, -0.3109587, 1, 0.8156863, 0, 1,
-1.140293, 0.08298921, -3.45044, 1, 0.8235294, 0, 1,
-1.132553, 0.9782341, -0.950264, 1, 0.827451, 0, 1,
-1.127434, -0.1776367, -0.8314549, 1, 0.8352941, 0, 1,
-1.125571, 1.312476, -0.5160018, 1, 0.8392157, 0, 1,
-1.125458, -0.1086346, -0.6475277, 1, 0.8470588, 0, 1,
-1.124256, 1.09704, -1.374677, 1, 0.8509804, 0, 1,
-1.123078, -0.3236946, -0.6396955, 1, 0.8588235, 0, 1,
-1.121031, -0.5208588, -1.061845, 1, 0.8627451, 0, 1,
-1.120205, 0.5040137, -0.8862743, 1, 0.8705882, 0, 1,
-1.119691, 1.013828, 0.8934439, 1, 0.8745098, 0, 1,
-1.107273, 1.636527, -1.06501, 1, 0.8823529, 0, 1,
-1.104946, 2.669327, -1.316169, 1, 0.8862745, 0, 1,
-1.099741, -1.105981, -2.455044, 1, 0.8941177, 0, 1,
-1.099528, -0.7970014, -1.950993, 1, 0.8980392, 0, 1,
-1.094877, -0.8302073, -0.6697219, 1, 0.9058824, 0, 1,
-1.07698, 0.6890872, -0.9551243, 1, 0.9137255, 0, 1,
-1.070379, 0.7312769, -1.076963, 1, 0.9176471, 0, 1,
-1.065348, 1.862762, -1.369757, 1, 0.9254902, 0, 1,
-1.065093, 0.2117769, -0.8517208, 1, 0.9294118, 0, 1,
-1.055667, 0.9698644, 0.4532482, 1, 0.9372549, 0, 1,
-1.053971, -0.6274388, -2.255108, 1, 0.9411765, 0, 1,
-1.05232, 0.9360533, -2.438472, 1, 0.9490196, 0, 1,
-1.047351, 2.326396, -0.3959938, 1, 0.9529412, 0, 1,
-1.045575, -1.055931, -3.016558, 1, 0.9607843, 0, 1,
-1.041308, 1.246582, -0.2579149, 1, 0.9647059, 0, 1,
-1.029096, 0.0838244, -0.5807716, 1, 0.972549, 0, 1,
-1.014644, 0.8977423, 0.7959419, 1, 0.9764706, 0, 1,
-1.014092, 0.1090517, -0.275833, 1, 0.9843137, 0, 1,
-1.011924, -0.5835296, -3.168246, 1, 0.9882353, 0, 1,
-1.009919, 0.01202746, -1.969177, 1, 0.9960784, 0, 1,
-1.008505, 1.396966, 2.134541, 0.9960784, 1, 0, 1,
-1.008433, 2.132081, -0.2470064, 0.9921569, 1, 0, 1,
-1.002904, -0.1660686, -1.064846, 0.9843137, 1, 0, 1,
-0.9974239, -1.819928, -3.950967, 0.9803922, 1, 0, 1,
-0.992983, -0.2477233, -1.822313, 0.972549, 1, 0, 1,
-0.9926108, -0.3142818, -1.501241, 0.9686275, 1, 0, 1,
-0.976272, 1.887532, 0.5605436, 0.9607843, 1, 0, 1,
-0.9730901, 0.5306097, 0.2348952, 0.9568627, 1, 0, 1,
-0.9705365, -0.06341322, -0.913586, 0.9490196, 1, 0, 1,
-0.9654043, 2.366916, -0.8933718, 0.945098, 1, 0, 1,
-0.9638531, 0.04785975, -1.090681, 0.9372549, 1, 0, 1,
-0.963574, -0.7001719, -2.222518, 0.9333333, 1, 0, 1,
-0.9620591, 0.3345565, -0.9153697, 0.9254902, 1, 0, 1,
-0.9558573, -2.066824, -2.864721, 0.9215686, 1, 0, 1,
-0.9541456, -0.110069, -1.305898, 0.9137255, 1, 0, 1,
-0.9504891, -0.09643044, -1.626401, 0.9098039, 1, 0, 1,
-0.9493989, 1.289972, -1.70792, 0.9019608, 1, 0, 1,
-0.9490614, 0.2603056, -1.892973, 0.8941177, 1, 0, 1,
-0.9473736, -0.1133578, -3.465674, 0.8901961, 1, 0, 1,
-0.9441649, -1.217792, -1.678225, 0.8823529, 1, 0, 1,
-0.9425849, -0.2733082, -0.9979771, 0.8784314, 1, 0, 1,
-0.9372666, 0.1400236, -1.589809, 0.8705882, 1, 0, 1,
-0.9354761, -0.2847441, -3.520232, 0.8666667, 1, 0, 1,
-0.9313927, 0.9191829, -0.4218906, 0.8588235, 1, 0, 1,
-0.9293384, 0.9422581, -1.875977, 0.854902, 1, 0, 1,
-0.9116771, -0.4624701, -0.2389894, 0.8470588, 1, 0, 1,
-0.9086964, -1.625318, -1.514951, 0.8431373, 1, 0, 1,
-0.9085371, 1.066218, -1.373212, 0.8352941, 1, 0, 1,
-0.9084381, -0.2770711, -1.89579, 0.8313726, 1, 0, 1,
-0.9075431, -0.030465, -1.943353, 0.8235294, 1, 0, 1,
-0.9063083, -1.245239, -3.262265, 0.8196079, 1, 0, 1,
-0.8967906, -1.286339, -2.311308, 0.8117647, 1, 0, 1,
-0.8959571, -0.4639851, -1.912384, 0.8078431, 1, 0, 1,
-0.8959559, 1.749109, -1.419957, 0.8, 1, 0, 1,
-0.8953573, -1.072024, -2.65244, 0.7921569, 1, 0, 1,
-0.8893588, 0.8987969, -0.8048228, 0.7882353, 1, 0, 1,
-0.8887476, -1.666856, -2.888209, 0.7803922, 1, 0, 1,
-0.8817642, 0.1204175, -1.465826, 0.7764706, 1, 0, 1,
-0.8808976, 0.8846225, -0.4564429, 0.7686275, 1, 0, 1,
-0.8800739, -0.3748104, -2.199202, 0.7647059, 1, 0, 1,
-0.8776227, -1.394666, -3.017481, 0.7568628, 1, 0, 1,
-0.8736578, -1.204996, -3.787586, 0.7529412, 1, 0, 1,
-0.873381, -0.8320688, -2.086212, 0.7450981, 1, 0, 1,
-0.8686149, -0.5094123, -1.279137, 0.7411765, 1, 0, 1,
-0.8669291, 1.020622, -2.006748, 0.7333333, 1, 0, 1,
-0.8591439, 0.6107295, -0.7279562, 0.7294118, 1, 0, 1,
-0.8551681, -0.1691741, -1.637076, 0.7215686, 1, 0, 1,
-0.8531413, 1.492186, -0.4512319, 0.7176471, 1, 0, 1,
-0.8491669, 1.317288, -0.2244583, 0.7098039, 1, 0, 1,
-0.8487724, 0.3246152, -1.653607, 0.7058824, 1, 0, 1,
-0.8428792, -0.04655218, -0.5289273, 0.6980392, 1, 0, 1,
-0.8406979, 0.284346, -1.944965, 0.6901961, 1, 0, 1,
-0.8404043, -1.065895, -1.880466, 0.6862745, 1, 0, 1,
-0.8362514, 0.01195048, -0.6419541, 0.6784314, 1, 0, 1,
-0.8340484, -0.9865519, -2.432493, 0.6745098, 1, 0, 1,
-0.8303962, -0.4130679, -3.561329, 0.6666667, 1, 0, 1,
-0.82301, 1.080469, -0.6356749, 0.6627451, 1, 0, 1,
-0.8149962, 0.8276953, -0.8973135, 0.654902, 1, 0, 1,
-0.8130954, -1.045525, -2.52533, 0.6509804, 1, 0, 1,
-0.8129032, -0.9307135, -0.3160413, 0.6431373, 1, 0, 1,
-0.8111122, 0.5875705, -0.819176, 0.6392157, 1, 0, 1,
-0.810096, 1.00179, -0.6742419, 0.6313726, 1, 0, 1,
-0.8070965, 0.3188188, -1.558793, 0.627451, 1, 0, 1,
-0.8047954, 3.13262, -0.02284354, 0.6196079, 1, 0, 1,
-0.8009585, -1.526945, -1.526181, 0.6156863, 1, 0, 1,
-0.8001779, -0.1740092, -1.303569, 0.6078432, 1, 0, 1,
-0.7983505, -0.5585095, -2.153463, 0.6039216, 1, 0, 1,
-0.797272, -0.3332842, -2.571804, 0.5960785, 1, 0, 1,
-0.7941264, 0.6600928, 0.5683407, 0.5882353, 1, 0, 1,
-0.7938817, 0.316628, -1.416866, 0.5843138, 1, 0, 1,
-0.7871452, -1.423053, -3.067131, 0.5764706, 1, 0, 1,
-0.7821016, -0.5938376, -1.544387, 0.572549, 1, 0, 1,
-0.7807126, 1.730288, 0.5130844, 0.5647059, 1, 0, 1,
-0.7799671, -1.651802, -1.387687, 0.5607843, 1, 0, 1,
-0.7792777, 1.149793, -1.117107, 0.5529412, 1, 0, 1,
-0.7787116, 1.263137, -0.1774662, 0.5490196, 1, 0, 1,
-0.7719157, 1.775042, -0.557776, 0.5411765, 1, 0, 1,
-0.7691048, -1.229876, -4.047185, 0.5372549, 1, 0, 1,
-0.7684463, 0.8366165, -1.73355, 0.5294118, 1, 0, 1,
-0.7630804, -0.1318621, -0.6298076, 0.5254902, 1, 0, 1,
-0.7627686, -1.015964, -2.096004, 0.5176471, 1, 0, 1,
-0.7621347, 1.186628, 0.5576853, 0.5137255, 1, 0, 1,
-0.7582448, -0.5824842, -2.406727, 0.5058824, 1, 0, 1,
-0.7559009, 1.919188, -1.482352, 0.5019608, 1, 0, 1,
-0.7553445, -0.3175905, -0.857384, 0.4941176, 1, 0, 1,
-0.751667, 0.9359289, -0.3364087, 0.4862745, 1, 0, 1,
-0.7495351, 0.1314911, 0.588257, 0.4823529, 1, 0, 1,
-0.7424185, 0.4377267, -1.089192, 0.4745098, 1, 0, 1,
-0.7407548, 0.8663225, -0.4856586, 0.4705882, 1, 0, 1,
-0.7389567, -0.1779917, -2.649534, 0.4627451, 1, 0, 1,
-0.7365206, 1.907315, -1.003701, 0.4588235, 1, 0, 1,
-0.7334442, -0.8145315, -1.489177, 0.4509804, 1, 0, 1,
-0.7333448, -0.03841288, -0.4295616, 0.4470588, 1, 0, 1,
-0.7308388, 0.5475266, 0.5181862, 0.4392157, 1, 0, 1,
-0.7288102, -0.8940727, -2.70838, 0.4352941, 1, 0, 1,
-0.7256498, 1.027564, -2.301873, 0.427451, 1, 0, 1,
-0.7254798, -0.2698472, -2.39673, 0.4235294, 1, 0, 1,
-0.7172447, -1.342703, -3.578765, 0.4156863, 1, 0, 1,
-0.7153005, 1.218407, -1.558563, 0.4117647, 1, 0, 1,
-0.7145077, 0.398226, -1.8851, 0.4039216, 1, 0, 1,
-0.7092279, 1.800414, -2.034568, 0.3960784, 1, 0, 1,
-0.7026863, -0.4157043, -2.875926, 0.3921569, 1, 0, 1,
-0.6956727, -1.236058, -2.532377, 0.3843137, 1, 0, 1,
-0.695067, 0.1818876, -1.057303, 0.3803922, 1, 0, 1,
-0.6941198, -0.21599, -3.073513, 0.372549, 1, 0, 1,
-0.6937032, -1.214192, -2.769939, 0.3686275, 1, 0, 1,
-0.6934181, 0.2468835, -0.5862328, 0.3607843, 1, 0, 1,
-0.6860123, -0.7824559, -1.995636, 0.3568628, 1, 0, 1,
-0.6846825, -1.564936, -1.012146, 0.3490196, 1, 0, 1,
-0.680757, -0.159443, -0.08013274, 0.345098, 1, 0, 1,
-0.6787438, -1.357314, -2.656725, 0.3372549, 1, 0, 1,
-0.677804, -0.4742201, -2.849073, 0.3333333, 1, 0, 1,
-0.6692633, -0.9837403, -3.159429, 0.3254902, 1, 0, 1,
-0.6636166, -1.439584, -1.688131, 0.3215686, 1, 0, 1,
-0.6601804, 0.4837267, 0.2727239, 0.3137255, 1, 0, 1,
-0.6564891, -0.469208, -2.181053, 0.3098039, 1, 0, 1,
-0.6512506, 0.7711465, 1.220273, 0.3019608, 1, 0, 1,
-0.6490784, 0.9790319, 0.186712, 0.2941177, 1, 0, 1,
-0.6445044, 0.441015, -1.395088, 0.2901961, 1, 0, 1,
-0.6256763, 2.44442, -0.05337207, 0.282353, 1, 0, 1,
-0.6253836, 0.832321, -0.7434065, 0.2784314, 1, 0, 1,
-0.6252961, -0.6782751, -2.364923, 0.2705882, 1, 0, 1,
-0.6224651, -0.6731886, -2.601242, 0.2666667, 1, 0, 1,
-0.6173611, 0.5402532, -1.461136, 0.2588235, 1, 0, 1,
-0.616956, -0.1276493, -1.568542, 0.254902, 1, 0, 1,
-0.6131861, -2.20571, -4.247969, 0.2470588, 1, 0, 1,
-0.6060128, 0.5558532, 0.2173727, 0.2431373, 1, 0, 1,
-0.6018744, 0.9927722, 1.749495, 0.2352941, 1, 0, 1,
-0.6003267, -1.077582, -1.887547, 0.2313726, 1, 0, 1,
-0.5988556, -0.5297809, -2.890741, 0.2235294, 1, 0, 1,
-0.5977755, 1.00336, 0.2118986, 0.2196078, 1, 0, 1,
-0.5950499, -0.07490918, -1.541301, 0.2117647, 1, 0, 1,
-0.5941144, -0.1629786, -3.57642, 0.2078431, 1, 0, 1,
-0.5923759, 1.055028, 0.1806206, 0.2, 1, 0, 1,
-0.5911944, -0.1670379, -2.813075, 0.1921569, 1, 0, 1,
-0.591186, -0.4409283, -2.728561, 0.1882353, 1, 0, 1,
-0.588412, 0.5342345, -2.761652, 0.1803922, 1, 0, 1,
-0.5882648, 1.012127, -0.1549455, 0.1764706, 1, 0, 1,
-0.5876773, 0.6511438, 0.3595034, 0.1686275, 1, 0, 1,
-0.5869749, -1.353003, -3.352248, 0.1647059, 1, 0, 1,
-0.586535, 0.6581514, -1.33379, 0.1568628, 1, 0, 1,
-0.5843264, 0.8988136, -1.475513, 0.1529412, 1, 0, 1,
-0.5823705, -0.04172487, 0.3069968, 0.145098, 1, 0, 1,
-0.5767968, -0.3680262, -2.653332, 0.1411765, 1, 0, 1,
-0.57527, 0.122435, 0.1711966, 0.1333333, 1, 0, 1,
-0.5719776, -0.9162769, -2.978604, 0.1294118, 1, 0, 1,
-0.5686289, 0.6488806, -1.831994, 0.1215686, 1, 0, 1,
-0.5664255, -0.3938933, -1.71189, 0.1176471, 1, 0, 1,
-0.5586626, 0.4805681, -0.5510961, 0.1098039, 1, 0, 1,
-0.5554335, 0.2399483, -1.331431, 0.1058824, 1, 0, 1,
-0.5545643, -1.208091, -3.49677, 0.09803922, 1, 0, 1,
-0.5513447, -0.2153155, -1.57021, 0.09019608, 1, 0, 1,
-0.543497, -0.9153274, -0.6601498, 0.08627451, 1, 0, 1,
-0.5420767, -1.261367, -3.966239, 0.07843138, 1, 0, 1,
-0.5415885, 1.071205, 0.06003001, 0.07450981, 1, 0, 1,
-0.5399451, 0.1554003, -1.086725, 0.06666667, 1, 0, 1,
-0.5365216, 1.727965, -0.661595, 0.0627451, 1, 0, 1,
-0.530487, -0.1467353, -0.2072029, 0.05490196, 1, 0, 1,
-0.5300857, -0.9470921, -3.382075, 0.05098039, 1, 0, 1,
-0.5286182, -0.4950013, -3.348675, 0.04313726, 1, 0, 1,
-0.5277827, -2.795462, -3.559973, 0.03921569, 1, 0, 1,
-0.5257633, 0.7068279, -0.3632253, 0.03137255, 1, 0, 1,
-0.5235975, -1.508334, -3.668378, 0.02745098, 1, 0, 1,
-0.5170894, -0.9929017, -2.038863, 0.01960784, 1, 0, 1,
-0.5170874, 0.920335, -0.1466017, 0.01568628, 1, 0, 1,
-0.5084031, 0.6769745, -1.248482, 0.007843138, 1, 0, 1,
-0.5066614, -0.9744655, -3.932206, 0.003921569, 1, 0, 1,
-0.5016336, -1.581821, -1.174854, 0, 1, 0.003921569, 1,
-0.4997402, 0.3051801, -2.407812, 0, 1, 0.01176471, 1,
-0.4946647, -0.03836733, -2.420373, 0, 1, 0.01568628, 1,
-0.4928654, 0.5343458, 1.187474, 0, 1, 0.02352941, 1,
-0.4899135, 0.7763227, -2.392073, 0, 1, 0.02745098, 1,
-0.4822764, -0.1369109, -1.217235, 0, 1, 0.03529412, 1,
-0.4793126, 0.1105276, -0.5523561, 0, 1, 0.03921569, 1,
-0.4787444, -1.134821, -1.053572, 0, 1, 0.04705882, 1,
-0.4785041, 0.001559811, 0.6281595, 0, 1, 0.05098039, 1,
-0.4704003, 0.8264559, 0.4472767, 0, 1, 0.05882353, 1,
-0.4700204, -0.03390715, -2.65222, 0, 1, 0.0627451, 1,
-0.4631163, 0.6671322, -0.569306, 0, 1, 0.07058824, 1,
-0.4614015, -0.324398, -2.593664, 0, 1, 0.07450981, 1,
-0.459957, -2.128864, -3.168228, 0, 1, 0.08235294, 1,
-0.4562248, 1.973922, -1.350918, 0, 1, 0.08627451, 1,
-0.4511489, -1.074189, -1.719244, 0, 1, 0.09411765, 1,
-0.4497504, -1.308617, -3.348071, 0, 1, 0.1019608, 1,
-0.44974, 1.52888, -0.3784141, 0, 1, 0.1058824, 1,
-0.448887, -1.984241, -2.339544, 0, 1, 0.1137255, 1,
-0.4465209, 0.3434994, -0.6572009, 0, 1, 0.1176471, 1,
-0.4457394, 0.8940529, -1.669954, 0, 1, 0.1254902, 1,
-0.4442647, -0.1057129, -0.146185, 0, 1, 0.1294118, 1,
-0.4423535, 0.2817062, -0.6589903, 0, 1, 0.1372549, 1,
-0.4398685, -0.0463064, -3.118611, 0, 1, 0.1411765, 1,
-0.4379966, -0.7324396, -2.505071, 0, 1, 0.1490196, 1,
-0.4308201, 1.744753, -1.380313, 0, 1, 0.1529412, 1,
-0.4307158, 0.1109723, -2.011999, 0, 1, 0.1607843, 1,
-0.4299836, -0.2801125, -3.196999, 0, 1, 0.1647059, 1,
-0.4283328, 0.5081894, 1.099677, 0, 1, 0.172549, 1,
-0.4172159, -0.1075657, -2.676541, 0, 1, 0.1764706, 1,
-0.4124865, 0.7722408, 1.165293, 0, 1, 0.1843137, 1,
-0.4086519, 0.5719544, -0.7802996, 0, 1, 0.1882353, 1,
-0.3960128, -1.640679, -2.537757, 0, 1, 0.1960784, 1,
-0.3955452, 0.244507, -0.8414301, 0, 1, 0.2039216, 1,
-0.3935648, 1.198637, -0.3647968, 0, 1, 0.2078431, 1,
-0.3906622, -1.415082, -2.093531, 0, 1, 0.2156863, 1,
-0.3898302, 0.243225, 0.1269203, 0, 1, 0.2196078, 1,
-0.3896697, 0.09626374, -2.28679, 0, 1, 0.227451, 1,
-0.3892234, -0.4410805, -2.915519, 0, 1, 0.2313726, 1,
-0.389057, -0.03702008, -0.8609134, 0, 1, 0.2392157, 1,
-0.3888307, 0.3172722, -0.3815406, 0, 1, 0.2431373, 1,
-0.3864702, 0.6773878, 0.5146194, 0, 1, 0.2509804, 1,
-0.3840598, -0.4332828, -1.842247, 0, 1, 0.254902, 1,
-0.3812833, -1.488273, -3.207001, 0, 1, 0.2627451, 1,
-0.3797983, 0.2206996, -0.4790418, 0, 1, 0.2666667, 1,
-0.3794636, -0.5270154, -0.3100784, 0, 1, 0.2745098, 1,
-0.3768883, 0.1548794, -1.920038, 0, 1, 0.2784314, 1,
-0.3752112, -0.7035177, -4.219627, 0, 1, 0.2862745, 1,
-0.3735601, 0.9313275, -0.1628694, 0, 1, 0.2901961, 1,
-0.3716497, -0.409976, -0.158154, 0, 1, 0.2980392, 1,
-0.3671743, 1.615303, -0.1352419, 0, 1, 0.3058824, 1,
-0.3652323, -0.02427858, -0.8978831, 0, 1, 0.3098039, 1,
-0.364876, -0.852143, -3.994642, 0, 1, 0.3176471, 1,
-0.3635367, -1.328968, -4.763943, 0, 1, 0.3215686, 1,
-0.3596419, 2.19805, -1.843924, 0, 1, 0.3294118, 1,
-0.3586019, 0.388934, -0.7659704, 0, 1, 0.3333333, 1,
-0.3584029, -0.9786721, -3.0766, 0, 1, 0.3411765, 1,
-0.3555466, -0.5655137, -2.261115, 0, 1, 0.345098, 1,
-0.3543099, 1.643106, -2.439465, 0, 1, 0.3529412, 1,
-0.3508385, -1.764865, -4.50384, 0, 1, 0.3568628, 1,
-0.3488977, -0.0844155, -3.017216, 0, 1, 0.3647059, 1,
-0.3418031, -0.8684783, -3.232375, 0, 1, 0.3686275, 1,
-0.3384387, -0.01608592, -1.104619, 0, 1, 0.3764706, 1,
-0.3377461, -0.1860984, -1.552624, 0, 1, 0.3803922, 1,
-0.3359768, -0.1438747, -1.304032, 0, 1, 0.3882353, 1,
-0.332262, -0.7707191, -0.6654502, 0, 1, 0.3921569, 1,
-0.3321886, 0.04771257, -1.54105, 0, 1, 0.4, 1,
-0.331882, -0.6492881, -1.47857, 0, 1, 0.4078431, 1,
-0.3313892, -0.2272307, -1.661058, 0, 1, 0.4117647, 1,
-0.3305217, -0.6859602, -2.967598, 0, 1, 0.4196078, 1,
-0.3302833, 0.1933175, -2.116359, 0, 1, 0.4235294, 1,
-0.3253445, 0.8895042, -0.1340067, 0, 1, 0.4313726, 1,
-0.3242664, -0.9137129, -3.792547, 0, 1, 0.4352941, 1,
-0.3242404, 0.7713539, -3.649488, 0, 1, 0.4431373, 1,
-0.3159887, -0.687977, -3.300811, 0, 1, 0.4470588, 1,
-0.311362, -0.9061311, -2.949546, 0, 1, 0.454902, 1,
-0.3077764, -0.9854783, -2.207426, 0, 1, 0.4588235, 1,
-0.304857, -0.8495991, -3.106645, 0, 1, 0.4666667, 1,
-0.3024517, 1.284713, -0.9911332, 0, 1, 0.4705882, 1,
-0.2983667, -0.0264955, -0.9654137, 0, 1, 0.4784314, 1,
-0.2946997, 0.5173801, 0.9098254, 0, 1, 0.4823529, 1,
-0.2884409, -0.8843877, -3.411185, 0, 1, 0.4901961, 1,
-0.2877452, 1.746183, 1.259658, 0, 1, 0.4941176, 1,
-0.2852984, -0.18666, -2.236841, 0, 1, 0.5019608, 1,
-0.2842995, -0.0003835111, -0.283414, 0, 1, 0.509804, 1,
-0.2827522, -0.4743087, -3.189122, 0, 1, 0.5137255, 1,
-0.2796052, -0.5584229, -4.401719, 0, 1, 0.5215687, 1,
-0.2768717, -0.9200999, -3.749583, 0, 1, 0.5254902, 1,
-0.268995, -0.548926, -3.445453, 0, 1, 0.5333334, 1,
-0.2640665, -0.2390777, -2.798505, 0, 1, 0.5372549, 1,
-0.2637476, 0.3581578, 0.8442761, 0, 1, 0.5450981, 1,
-0.2631148, 0.2644997, 0.03971315, 0, 1, 0.5490196, 1,
-0.263039, 0.4929585, 0.4952854, 0, 1, 0.5568628, 1,
-0.254803, -0.7078989, -1.78703, 0, 1, 0.5607843, 1,
-0.2531064, -0.796908, -3.716601, 0, 1, 0.5686275, 1,
-0.2481349, 0.7574131, 0.1451421, 0, 1, 0.572549, 1,
-0.2422269, 0.4383387, -1.768696, 0, 1, 0.5803922, 1,
-0.2415972, 0.8883638, 0.4374625, 0, 1, 0.5843138, 1,
-0.2346527, -0.956677, -4.234991, 0, 1, 0.5921569, 1,
-0.2331088, 0.3574469, -1.764, 0, 1, 0.5960785, 1,
-0.231571, -1.832413, -3.010715, 0, 1, 0.6039216, 1,
-0.2279368, -1.179299, -4.257028, 0, 1, 0.6117647, 1,
-0.227415, -0.3829512, -2.559315, 0, 1, 0.6156863, 1,
-0.22406, -0.3637657, -2.569273, 0, 1, 0.6235294, 1,
-0.2229225, 0.7722937, -0.01016533, 0, 1, 0.627451, 1,
-0.2150122, -0.2225467, -1.803566, 0, 1, 0.6352941, 1,
-0.2057069, -2.375495, -2.908299, 0, 1, 0.6392157, 1,
-0.1953455, 0.2450917, -1.381143, 0, 1, 0.6470588, 1,
-0.1930356, -1.126497, -2.420919, 0, 1, 0.6509804, 1,
-0.1917499, -0.1068802, -2.745693, 0, 1, 0.6588235, 1,
-0.188604, -0.729448, -3.620545, 0, 1, 0.6627451, 1,
-0.186981, 1.286582, -1.582456, 0, 1, 0.6705883, 1,
-0.1865985, 0.1725333, -1.102835, 0, 1, 0.6745098, 1,
-0.1849268, 0.6444846, -1.481317, 0, 1, 0.682353, 1,
-0.183817, 0.8884575, -0.225246, 0, 1, 0.6862745, 1,
-0.1805268, 0.4751903, -0.9105158, 0, 1, 0.6941177, 1,
-0.1794108, -0.04619449, -2.246549, 0, 1, 0.7019608, 1,
-0.1726268, 1.357861, -1.28595, 0, 1, 0.7058824, 1,
-0.1713035, -0.9580284, -4.53664, 0, 1, 0.7137255, 1,
-0.1704628, 1.412863, -0.9023378, 0, 1, 0.7176471, 1,
-0.1696878, 1.141575, 0.4193971, 0, 1, 0.7254902, 1,
-0.1655432, 0.1581976, -0.1155705, 0, 1, 0.7294118, 1,
-0.1637101, 0.7280218, -0.9735641, 0, 1, 0.7372549, 1,
-0.1628505, -1.248068, -2.835685, 0, 1, 0.7411765, 1,
-0.1589341, 1.335339, 1.174852, 0, 1, 0.7490196, 1,
-0.1563802, 1.136421, -0.9020606, 0, 1, 0.7529412, 1,
-0.1510001, -0.452516, -3.091161, 0, 1, 0.7607843, 1,
-0.1503816, 0.8300786, 0.08074453, 0, 1, 0.7647059, 1,
-0.1478368, 0.630777, -0.4415453, 0, 1, 0.772549, 1,
-0.1444426, 0.9083828, -1.650437, 0, 1, 0.7764706, 1,
-0.1432592, 0.7522689, -0.563958, 0, 1, 0.7843137, 1,
-0.1403039, 0.2528922, -1.490898, 0, 1, 0.7882353, 1,
-0.1363523, 1.412811, 0.8592021, 0, 1, 0.7960784, 1,
-0.1341679, 0.4164298, -1.677868, 0, 1, 0.8039216, 1,
-0.1328741, 0.1197332, -1.465946, 0, 1, 0.8078431, 1,
-0.1299336, -0.4697814, -2.398336, 0, 1, 0.8156863, 1,
-0.128471, -0.8079826, -4.494325, 0, 1, 0.8196079, 1,
-0.1284538, -0.5025674, -3.35735, 0, 1, 0.827451, 1,
-0.1246881, 0.350556, 0.3040157, 0, 1, 0.8313726, 1,
-0.1230396, 0.01338821, -0.4522255, 0, 1, 0.8392157, 1,
-0.1226188, -0.8685308, -3.237155, 0, 1, 0.8431373, 1,
-0.1056272, -0.1688319, -2.905544, 0, 1, 0.8509804, 1,
-0.1024653, 0.10369, -1.666246, 0, 1, 0.854902, 1,
-0.1011369, -0.6338785, -2.916271, 0, 1, 0.8627451, 1,
-0.09977052, -1.074041, -5.051435, 0, 1, 0.8666667, 1,
-0.09920103, 0.1516513, 0.6361365, 0, 1, 0.8745098, 1,
-0.09180213, 2.324483, -0.8866309, 0, 1, 0.8784314, 1,
-0.08835293, 1.229048, 1.158928, 0, 1, 0.8862745, 1,
-0.08659842, 0.6416553, -0.4754856, 0, 1, 0.8901961, 1,
-0.08498405, 0.5183676, 0.2349525, 0, 1, 0.8980392, 1,
-0.08434249, 0.873929, -0.1219781, 0, 1, 0.9058824, 1,
-0.08339523, 1.614934, -0.1210195, 0, 1, 0.9098039, 1,
-0.07863229, 0.5690051, -0.1887113, 0, 1, 0.9176471, 1,
-0.07576811, -1.093207, -4.570159, 0, 1, 0.9215686, 1,
-0.07411646, 0.8538023, 0.3083318, 0, 1, 0.9294118, 1,
-0.06974035, -0.421519, -2.087844, 0, 1, 0.9333333, 1,
-0.06848374, -0.1663686, -3.129111, 0, 1, 0.9411765, 1,
-0.06729248, -1.45317, -3.665152, 0, 1, 0.945098, 1,
-0.06497215, -0.2586172, -1.64897, 0, 1, 0.9529412, 1,
-0.06385372, 1.547482, 0.2411886, 0, 1, 0.9568627, 1,
-0.05924357, -1.509648, -2.612184, 0, 1, 0.9647059, 1,
-0.05590276, -2.190907, -1.921148, 0, 1, 0.9686275, 1,
-0.05168757, 0.4815723, -0.7981433, 0, 1, 0.9764706, 1,
-0.04910576, 0.5481001, -0.1257645, 0, 1, 0.9803922, 1,
-0.04870092, 0.02638701, -0.9185641, 0, 1, 0.9882353, 1,
-0.04593059, 0.6220368, 1.017257, 0, 1, 0.9921569, 1,
-0.04457746, -1.001102, -0.9145139, 0, 1, 1, 1,
-0.04442415, -0.1848365, -1.602918, 0, 0.9921569, 1, 1,
-0.04240834, -0.246689, -2.433433, 0, 0.9882353, 1, 1,
-0.0395649, -1.364935, -4.262162, 0, 0.9803922, 1, 1,
-0.03795091, 0.142973, -1.538756, 0, 0.9764706, 1, 1,
-0.03571251, 0.2367295, -0.8089417, 0, 0.9686275, 1, 1,
-0.03474878, -0.3931929, -0.7216752, 0, 0.9647059, 1, 1,
-0.02995276, 0.8413526, 1.130245, 0, 0.9568627, 1, 1,
-0.0282625, -2.071441, -1.382104, 0, 0.9529412, 1, 1,
-0.02756956, 0.07043489, 0.1256986, 0, 0.945098, 1, 1,
-0.02673187, 0.2972488, -2.251906, 0, 0.9411765, 1, 1,
-0.02646378, -0.3888662, -2.229304, 0, 0.9333333, 1, 1,
-0.02359809, 0.03219305, 0.1593203, 0, 0.9294118, 1, 1,
-0.02320031, 0.8946468, -0.3322878, 0, 0.9215686, 1, 1,
-0.02200222, 1.306032, 0.7445626, 0, 0.9176471, 1, 1,
-0.02182797, 0.09354901, 0.9923084, 0, 0.9098039, 1, 1,
-0.0154851, -0.8814384, -2.608545, 0, 0.9058824, 1, 1,
-0.0147684, -0.1318794, -2.246967, 0, 0.8980392, 1, 1,
-0.007125557, 0.006055953, -0.3388926, 0, 0.8901961, 1, 1,
-0.003760383, 0.3852563, -0.3548579, 0, 0.8862745, 1, 1,
-0.001862223, -0.09818104, -4.553965, 0, 0.8784314, 1, 1,
0.008997658, 0.1867712, 2.437138, 0, 0.8745098, 1, 1,
0.01382798, 1.022027, 0.7380967, 0, 0.8666667, 1, 1,
0.01444241, 0.6963411, 0.1719979, 0, 0.8627451, 1, 1,
0.01600406, -2.022317, 4.597841, 0, 0.854902, 1, 1,
0.01797667, -0.3594636, 3.663495, 0, 0.8509804, 1, 1,
0.02786192, 1.199754, -0.7178766, 0, 0.8431373, 1, 1,
0.03161437, -0.004962584, 1.303628, 0, 0.8392157, 1, 1,
0.03169359, 0.7995998, -1.368484, 0, 0.8313726, 1, 1,
0.03251003, 1.452305, -0.2720902, 0, 0.827451, 1, 1,
0.03554337, 1.040713, 1.527507, 0, 0.8196079, 1, 1,
0.03613231, 3.074322, 0.3462667, 0, 0.8156863, 1, 1,
0.03639062, -1.9949, 2.223436, 0, 0.8078431, 1, 1,
0.04065562, -1.34473, 3.323141, 0, 0.8039216, 1, 1,
0.04355275, 0.3089278, -0.004369784, 0, 0.7960784, 1, 1,
0.04543256, -1.061949, 3.851321, 0, 0.7882353, 1, 1,
0.04550004, 0.7806684, -1.010799, 0, 0.7843137, 1, 1,
0.04832596, -0.7441499, 2.773574, 0, 0.7764706, 1, 1,
0.05057732, 1.25852, -0.8420869, 0, 0.772549, 1, 1,
0.0534688, -0.2280249, 4.053681, 0, 0.7647059, 1, 1,
0.06358943, -1.672283, 3.825576, 0, 0.7607843, 1, 1,
0.06586166, 0.7313201, -0.46964, 0, 0.7529412, 1, 1,
0.06934958, -0.5136604, 1.836068, 0, 0.7490196, 1, 1,
0.07139951, 1.288497, 0.530474, 0, 0.7411765, 1, 1,
0.07574783, 0.5079617, 0.2235989, 0, 0.7372549, 1, 1,
0.07666522, -0.8413941, 1.32831, 0, 0.7294118, 1, 1,
0.0818601, 0.1583414, 0.724309, 0, 0.7254902, 1, 1,
0.08371129, 0.3474592, 2.528187, 0, 0.7176471, 1, 1,
0.09366165, -1.853027, 2.435781, 0, 0.7137255, 1, 1,
0.1067782, -1.46792, 4.936486, 0, 0.7058824, 1, 1,
0.1099766, 0.703738, 0.02539204, 0, 0.6980392, 1, 1,
0.1108191, 0.6844274, 1.511907, 0, 0.6941177, 1, 1,
0.1118946, 1.17093, -1.238141, 0, 0.6862745, 1, 1,
0.1120869, 2.09124, -0.1837767, 0, 0.682353, 1, 1,
0.1133866, 0.9187075, 1.415553, 0, 0.6745098, 1, 1,
0.1154651, 0.1653177, 1.139784, 0, 0.6705883, 1, 1,
0.1156803, 0.3269671, 0.9618767, 0, 0.6627451, 1, 1,
0.1233584, 0.007489204, 1.561449, 0, 0.6588235, 1, 1,
0.1240024, -0.6440884, 2.043078, 0, 0.6509804, 1, 1,
0.1275216, 0.6248468, 1.719529, 0, 0.6470588, 1, 1,
0.1338979, -0.16462, 3.114825, 0, 0.6392157, 1, 1,
0.1359971, 0.08742295, 2.041269, 0, 0.6352941, 1, 1,
0.139017, 0.7214257, 1.116263, 0, 0.627451, 1, 1,
0.1392239, -1.347702, 1.585369, 0, 0.6235294, 1, 1,
0.1422339, -0.93136, 3.006209, 0, 0.6156863, 1, 1,
0.1458133, 0.2106455, -0.593145, 0, 0.6117647, 1, 1,
0.14721, 1.597542, 0.3973503, 0, 0.6039216, 1, 1,
0.1486439, 1.397612, 0.3805647, 0, 0.5960785, 1, 1,
0.1492639, -2.253374, 3.095041, 0, 0.5921569, 1, 1,
0.1533721, 1.433633, 2.33189, 0, 0.5843138, 1, 1,
0.1542304, -0.5053906, 0.6460083, 0, 0.5803922, 1, 1,
0.1552598, -0.003817196, 1.36628, 0, 0.572549, 1, 1,
0.1621203, 1.292115, -0.03624053, 0, 0.5686275, 1, 1,
0.1630322, 1.035082, 1.130364, 0, 0.5607843, 1, 1,
0.1633334, -1.481717, 4.19586, 0, 0.5568628, 1, 1,
0.1643519, 1.121096, -0.3833808, 0, 0.5490196, 1, 1,
0.165881, -1.828801, 3.324493, 0, 0.5450981, 1, 1,
0.1680649, -1.169628, 3.743085, 0, 0.5372549, 1, 1,
0.1702832, -0.9236724, 3.376537, 0, 0.5333334, 1, 1,
0.1718162, 0.180464, 1.096652, 0, 0.5254902, 1, 1,
0.176192, 0.3622278, 0.4632622, 0, 0.5215687, 1, 1,
0.1778012, 0.1149885, 1.490996, 0, 0.5137255, 1, 1,
0.1787835, -0.5637136, 1.240148, 0, 0.509804, 1, 1,
0.1819301, -0.3262051, 2.296814, 0, 0.5019608, 1, 1,
0.1886326, -1.925172, 4.17407, 0, 0.4941176, 1, 1,
0.1909218, 1.269244, 1.605028, 0, 0.4901961, 1, 1,
0.1928628, 0.9409731, 0.1027616, 0, 0.4823529, 1, 1,
0.1969823, 0.6259027, -0.5163234, 0, 0.4784314, 1, 1,
0.1976579, 0.3942986, 0.6204205, 0, 0.4705882, 1, 1,
0.2061321, 1.806561, 0.3767786, 0, 0.4666667, 1, 1,
0.2061507, -0.04057525, 1.77849, 0, 0.4588235, 1, 1,
0.2127517, 1.393619, -1.36804, 0, 0.454902, 1, 1,
0.2156714, -0.931967, 2.441655, 0, 0.4470588, 1, 1,
0.2180408, -1.254714, 3.619107, 0, 0.4431373, 1, 1,
0.219503, 0.3567899, -0.6223664, 0, 0.4352941, 1, 1,
0.2302506, -0.8564022, 3.211515, 0, 0.4313726, 1, 1,
0.2309211, 0.5237969, 1.181825, 0, 0.4235294, 1, 1,
0.2328199, -1.484887, 3.070264, 0, 0.4196078, 1, 1,
0.2343501, 1.380297, 1.93459, 0, 0.4117647, 1, 1,
0.2417403, 0.4346943, 0.9523014, 0, 0.4078431, 1, 1,
0.2461027, 0.1029579, 1.368509, 0, 0.4, 1, 1,
0.2467368, 0.872422, 1.005448, 0, 0.3921569, 1, 1,
0.2479362, -0.08973533, 2.019606, 0, 0.3882353, 1, 1,
0.2504981, -1.008495, 3.204885, 0, 0.3803922, 1, 1,
0.2507593, -0.4589423, 3.732085, 0, 0.3764706, 1, 1,
0.2508121, -0.6228834, 2.773005, 0, 0.3686275, 1, 1,
0.2603011, -1.103612, 2.746483, 0, 0.3647059, 1, 1,
0.262896, 1.756996, 0.5181314, 0, 0.3568628, 1, 1,
0.2647229, -1.536402, 4.659025, 0, 0.3529412, 1, 1,
0.2659513, -2.186157, 3.257784, 0, 0.345098, 1, 1,
0.2678036, -1.20253, 3.805137, 0, 0.3411765, 1, 1,
0.2738189, -1.083034, 2.322121, 0, 0.3333333, 1, 1,
0.2765709, 0.03559652, -0.4079346, 0, 0.3294118, 1, 1,
0.2771416, 0.6714947, -0.2939, 0, 0.3215686, 1, 1,
0.2804959, 0.0851004, 0.8148807, 0, 0.3176471, 1, 1,
0.2828055, 2.202384, -0.3451161, 0, 0.3098039, 1, 1,
0.2846334, -0.01271186, 2.701905, 0, 0.3058824, 1, 1,
0.2865547, 0.08547877, -0.415327, 0, 0.2980392, 1, 1,
0.2916363, 0.6954358, 0.8448727, 0, 0.2901961, 1, 1,
0.2939821, -1.365282, 1.993249, 0, 0.2862745, 1, 1,
0.2940378, 1.516745, 0.5374176, 0, 0.2784314, 1, 1,
0.2945037, 0.3542234, -0.5216509, 0, 0.2745098, 1, 1,
0.2946097, 1.850199, 0.09454561, 0, 0.2666667, 1, 1,
0.2957101, -0.1588483, 2.048416, 0, 0.2627451, 1, 1,
0.3019921, -1.076293, 1.466787, 0, 0.254902, 1, 1,
0.3033086, -0.6508916, 3.640079, 0, 0.2509804, 1, 1,
0.3095175, -0.4827604, 1.934463, 0, 0.2431373, 1, 1,
0.311386, 0.9454093, 0.4819248, 0, 0.2392157, 1, 1,
0.3163674, 1.815436, -0.2948495, 0, 0.2313726, 1, 1,
0.3178907, -0.7431123, 3.018639, 0, 0.227451, 1, 1,
0.3200681, -0.2268291, 1.203977, 0, 0.2196078, 1, 1,
0.3269502, -0.4354683, 3.351617, 0, 0.2156863, 1, 1,
0.3280131, 1.955375, -0.2981783, 0, 0.2078431, 1, 1,
0.3287748, -0.3080048, 2.321505, 0, 0.2039216, 1, 1,
0.3306838, 0.925514, -0.09578493, 0, 0.1960784, 1, 1,
0.3315641, 0.8836967, -1.150449, 0, 0.1882353, 1, 1,
0.33267, -0.3612235, 1.907346, 0, 0.1843137, 1, 1,
0.334884, -2.129225, 3.438669, 0, 0.1764706, 1, 1,
0.3349446, -1.407111, 1.751796, 0, 0.172549, 1, 1,
0.3356116, -0.3389223, 2.3113, 0, 0.1647059, 1, 1,
0.3371134, 0.1573462, 2.508714, 0, 0.1607843, 1, 1,
0.3393524, -1.436179, 2.670545, 0, 0.1529412, 1, 1,
0.3394182, 0.2934014, 1.090745, 0, 0.1490196, 1, 1,
0.3431089, 0.3831134, 2.687991, 0, 0.1411765, 1, 1,
0.3457589, -0.08649493, -0.3504622, 0, 0.1372549, 1, 1,
0.346152, 0.8630077, 0.1117892, 0, 0.1294118, 1, 1,
0.3485781, 2.137618, 2.461264, 0, 0.1254902, 1, 1,
0.348882, 2.038336, -0.45085, 0, 0.1176471, 1, 1,
0.3504386, -1.235187, 4.207733, 0, 0.1137255, 1, 1,
0.3563351, -2.39887, 2.287983, 0, 0.1058824, 1, 1,
0.358369, 0.06088941, 0.02062578, 0, 0.09803922, 1, 1,
0.3622122, 0.3847861, -0.3150742, 0, 0.09411765, 1, 1,
0.3643076, 0.4652082, -0.412748, 0, 0.08627451, 1, 1,
0.3661941, 0.9024166, -0.9188949, 0, 0.08235294, 1, 1,
0.3678573, 0.1700456, 0.5850063, 0, 0.07450981, 1, 1,
0.3714063, -0.9513387, 1.910531, 0, 0.07058824, 1, 1,
0.3822165, -1.09969, 2.915482, 0, 0.0627451, 1, 1,
0.3829153, 0.003323537, 2.737089, 0, 0.05882353, 1, 1,
0.3836607, 2.552675, -0.9411023, 0, 0.05098039, 1, 1,
0.3903073, 0.3366664, 1.301905, 0, 0.04705882, 1, 1,
0.3925208, -0.2104468, 2.890188, 0, 0.03921569, 1, 1,
0.393621, 0.9186183, -0.1441658, 0, 0.03529412, 1, 1,
0.3942574, -0.877256, 1.196814, 0, 0.02745098, 1, 1,
0.3972618, 1.624742, 1.463903, 0, 0.02352941, 1, 1,
0.3984014, -0.6742523, 2.253021, 0, 0.01568628, 1, 1,
0.4002842, 0.1639021, 2.495421, 0, 0.01176471, 1, 1,
0.4014955, 1.257705, 0.7514206, 0, 0.003921569, 1, 1,
0.4035542, -0.1438674, 4.048644, 0.003921569, 0, 1, 1,
0.4092446, 0.5618773, 0.1605452, 0.007843138, 0, 1, 1,
0.4134457, -2.021774, 4.294893, 0.01568628, 0, 1, 1,
0.413768, -1.147158, 4.017179, 0.01960784, 0, 1, 1,
0.4151909, 0.3766332, 2.990273, 0.02745098, 0, 1, 1,
0.4178426, -1.29714, 2.074707, 0.03137255, 0, 1, 1,
0.4277673, 0.7487103, 1.165624, 0.03921569, 0, 1, 1,
0.4286722, 0.4392326, 1.189768, 0.04313726, 0, 1, 1,
0.4311146, 1.410325, -0.9167601, 0.05098039, 0, 1, 1,
0.4334774, -1.032174, 2.417318, 0.05490196, 0, 1, 1,
0.441583, 1.568361, 0.9079698, 0.0627451, 0, 1, 1,
0.442882, -0.7977207, 3.329702, 0.06666667, 0, 1, 1,
0.4455469, 0.7546678, 1.43277, 0.07450981, 0, 1, 1,
0.4461371, 0.2951562, 2.56829, 0.07843138, 0, 1, 1,
0.448333, -1.355654, 4.103756, 0.08627451, 0, 1, 1,
0.4495659, -0.58222, 4.964501, 0.09019608, 0, 1, 1,
0.4586149, 0.6442046, 0.6909191, 0.09803922, 0, 1, 1,
0.4651815, 0.08829264, 0.1896288, 0.1058824, 0, 1, 1,
0.4690728, -0.5126323, 0.8152258, 0.1098039, 0, 1, 1,
0.4733329, 0.1168523, 1.479633, 0.1176471, 0, 1, 1,
0.4789122, -0.6000087, 1.923653, 0.1215686, 0, 1, 1,
0.4802909, 0.329168, 1.184422, 0.1294118, 0, 1, 1,
0.4838313, -0.2080554, 1.62275, 0.1333333, 0, 1, 1,
0.4905745, 1.83062, -0.4113594, 0.1411765, 0, 1, 1,
0.5112229, -0.3475152, 2.006387, 0.145098, 0, 1, 1,
0.5124308, -0.09754235, 1.708775, 0.1529412, 0, 1, 1,
0.5142226, 0.05241249, 2.43755, 0.1568628, 0, 1, 1,
0.5147249, 0.4678968, -0.1865872, 0.1647059, 0, 1, 1,
0.5186115, -0.7610551, 1.916692, 0.1686275, 0, 1, 1,
0.5202526, -0.6237087, 3.82529, 0.1764706, 0, 1, 1,
0.5223615, 0.4500288, 2.376341, 0.1803922, 0, 1, 1,
0.5256409, -1.505187, 2.094948, 0.1882353, 0, 1, 1,
0.5320854, -0.4680224, 1.826614, 0.1921569, 0, 1, 1,
0.5329753, 0.2802114, 0.2470147, 0.2, 0, 1, 1,
0.5343344, 1.351478, -0.01984431, 0.2078431, 0, 1, 1,
0.5347075, 0.2269046, -0.3154266, 0.2117647, 0, 1, 1,
0.5347327, -0.02308356, 1.967291, 0.2196078, 0, 1, 1,
0.5349876, 2.041655, -0.9586065, 0.2235294, 0, 1, 1,
0.5423873, 1.834694, 2.630855, 0.2313726, 0, 1, 1,
0.5450503, 3.334006, 0.6996739, 0.2352941, 0, 1, 1,
0.5451695, 0.3179804, 0.6959893, 0.2431373, 0, 1, 1,
0.5455969, -1.318854, 3.678536, 0.2470588, 0, 1, 1,
0.5533395, 0.4041239, 0.1536205, 0.254902, 0, 1, 1,
0.5598838, -0.333198, 3.052218, 0.2588235, 0, 1, 1,
0.5620255, 1.024937, -0.1755682, 0.2666667, 0, 1, 1,
0.5630181, -0.7199261, 3.955528, 0.2705882, 0, 1, 1,
0.5659978, -2.150988, 1.888192, 0.2784314, 0, 1, 1,
0.5661464, 0.7298269, -1.954763, 0.282353, 0, 1, 1,
0.5674077, 0.1361154, 1.338613, 0.2901961, 0, 1, 1,
0.5689797, 1.36981, 1.41276, 0.2941177, 0, 1, 1,
0.5733766, 0.8036152, 0.6201314, 0.3019608, 0, 1, 1,
0.575705, -1.16254, 2.814678, 0.3098039, 0, 1, 1,
0.5783784, -0.1752044, 0.7427385, 0.3137255, 0, 1, 1,
0.5817115, 0.2753201, 3.398613, 0.3215686, 0, 1, 1,
0.5893344, -1.841563, 3.583618, 0.3254902, 0, 1, 1,
0.5916761, 1.850946, 0.5854743, 0.3333333, 0, 1, 1,
0.5991699, -0.9554595, 2.066561, 0.3372549, 0, 1, 1,
0.6005064, -0.8373939, 2.503017, 0.345098, 0, 1, 1,
0.6009328, 0.1137479, 2.59748, 0.3490196, 0, 1, 1,
0.602062, -0.38532, 2.415802, 0.3568628, 0, 1, 1,
0.6165305, -0.4466428, 3.413645, 0.3607843, 0, 1, 1,
0.6172022, -0.3045342, 2.128036, 0.3686275, 0, 1, 1,
0.6173772, -0.2437116, 2.21157, 0.372549, 0, 1, 1,
0.6174009, 1.297603, 0.3343352, 0.3803922, 0, 1, 1,
0.620019, -1.222094, 3.636285, 0.3843137, 0, 1, 1,
0.6232228, 0.05555101, 0.167235, 0.3921569, 0, 1, 1,
0.6232234, -1.138648, 2.561604, 0.3960784, 0, 1, 1,
0.6267526, -0.9546778, 2.983156, 0.4039216, 0, 1, 1,
0.6281495, 0.6385369, 2.280653, 0.4117647, 0, 1, 1,
0.6326485, 0.02247415, 0.4620984, 0.4156863, 0, 1, 1,
0.633152, -0.3077291, 1.957728, 0.4235294, 0, 1, 1,
0.633288, 1.083018, 1.003858, 0.427451, 0, 1, 1,
0.6333495, 1.920903, 0.2569742, 0.4352941, 0, 1, 1,
0.6334925, 0.5009794, -0.5659608, 0.4392157, 0, 1, 1,
0.6378021, 1.574615, 1.472087, 0.4470588, 0, 1, 1,
0.6393148, -1.574057, 2.806207, 0.4509804, 0, 1, 1,
0.6439588, -0.7066008, 3.462006, 0.4588235, 0, 1, 1,
0.6482859, -0.6252764, 3.637669, 0.4627451, 0, 1, 1,
0.6498551, 0.3572063, 0.2817973, 0.4705882, 0, 1, 1,
0.6521623, -0.6623496, 3.391644, 0.4745098, 0, 1, 1,
0.652366, 0.6383588, 0.2347786, 0.4823529, 0, 1, 1,
0.6524075, -1.14498, 3.175701, 0.4862745, 0, 1, 1,
0.6541381, -0.6194901, 2.595846, 0.4941176, 0, 1, 1,
0.6582763, -0.5844679, 3.415715, 0.5019608, 0, 1, 1,
0.6588771, -1.721287, 3.639245, 0.5058824, 0, 1, 1,
0.6602994, -0.4492853, 2.934078, 0.5137255, 0, 1, 1,
0.6607624, -1.614644, 3.832587, 0.5176471, 0, 1, 1,
0.6610389, -0.6946766, 1.32794, 0.5254902, 0, 1, 1,
0.6641982, -0.1932569, 2.574627, 0.5294118, 0, 1, 1,
0.6646939, -0.6126385, 1.232915, 0.5372549, 0, 1, 1,
0.6682674, -0.08087788, 0.7079349, 0.5411765, 0, 1, 1,
0.6712089, -0.9435313, 3.750019, 0.5490196, 0, 1, 1,
0.6722489, 0.2170195, 1.29279, 0.5529412, 0, 1, 1,
0.6750065, -0.758918, 1.6972, 0.5607843, 0, 1, 1,
0.6812418, -0.2295305, 1.950527, 0.5647059, 0, 1, 1,
0.6826889, -1.018272, 1.592487, 0.572549, 0, 1, 1,
0.694992, 0.3125419, 0.8194624, 0.5764706, 0, 1, 1,
0.6957175, 0.2440824, 0.6785817, 0.5843138, 0, 1, 1,
0.6958227, -0.3897218, 2.714143, 0.5882353, 0, 1, 1,
0.7075529, -0.0363245, 3.50005, 0.5960785, 0, 1, 1,
0.7085248, 1.050836, 0.1918915, 0.6039216, 0, 1, 1,
0.7102331, 0.01557042, 2.064675, 0.6078432, 0, 1, 1,
0.7212084, -0.9523559, 3.120418, 0.6156863, 0, 1, 1,
0.7228044, -0.194774, 1.932235, 0.6196079, 0, 1, 1,
0.7265145, 0.2735151, 1.05861, 0.627451, 0, 1, 1,
0.7304756, 1.219763, 0.8053955, 0.6313726, 0, 1, 1,
0.7369559, 0.6857971, 1.756828, 0.6392157, 0, 1, 1,
0.7395768, -0.6754591, 2.463303, 0.6431373, 0, 1, 1,
0.7421234, -1.049842, 4.066467, 0.6509804, 0, 1, 1,
0.7442935, -0.5331547, 2.662237, 0.654902, 0, 1, 1,
0.7450871, 0.2852453, 0.2076161, 0.6627451, 0, 1, 1,
0.7550063, -0.1573959, 1.768935, 0.6666667, 0, 1, 1,
0.75502, 0.3174776, 0.149401, 0.6745098, 0, 1, 1,
0.7552988, -0.07477185, 1.932782, 0.6784314, 0, 1, 1,
0.7648929, 1.65864, 0.7031833, 0.6862745, 0, 1, 1,
0.765241, -0.9484218, 3.126672, 0.6901961, 0, 1, 1,
0.7658908, 1.19126, 0.7420406, 0.6980392, 0, 1, 1,
0.7665119, -0.7335352, 1.499334, 0.7058824, 0, 1, 1,
0.7711626, -0.4302892, 2.984543, 0.7098039, 0, 1, 1,
0.7843033, 1.292009, 0.0619481, 0.7176471, 0, 1, 1,
0.7859492, -0.9953082, 1.109142, 0.7215686, 0, 1, 1,
0.7899646, -0.2303505, 2.273624, 0.7294118, 0, 1, 1,
0.7928993, 0.3486365, 0.6167001, 0.7333333, 0, 1, 1,
0.7961949, -1.339406, 2.27219, 0.7411765, 0, 1, 1,
0.7976798, 0.5251583, 0.4407083, 0.7450981, 0, 1, 1,
0.7998809, -1.482621, 3.621542, 0.7529412, 0, 1, 1,
0.8041468, -0.7572151, 0.9445752, 0.7568628, 0, 1, 1,
0.8076972, -0.04138253, 0.1217814, 0.7647059, 0, 1, 1,
0.8088275, 0.7026873, 0.8078238, 0.7686275, 0, 1, 1,
0.8094594, -2.816602, 2.443021, 0.7764706, 0, 1, 1,
0.8099989, 0.22006, 2.785027, 0.7803922, 0, 1, 1,
0.8107808, 1.21375, 2.167623, 0.7882353, 0, 1, 1,
0.8111812, -2.297772, 3.230909, 0.7921569, 0, 1, 1,
0.8132135, -1.012996, 2.288194, 0.8, 0, 1, 1,
0.8132577, -0.7475256, 2.333011, 0.8078431, 0, 1, 1,
0.8204241, -0.9567385, 2.38853, 0.8117647, 0, 1, 1,
0.8383785, 0.6653033, -0.2411257, 0.8196079, 0, 1, 1,
0.8385699, -0.5733165, 0.1346253, 0.8235294, 0, 1, 1,
0.8392096, 0.7601454, 1.226291, 0.8313726, 0, 1, 1,
0.8405144, -0.1406877, 2.396598, 0.8352941, 0, 1, 1,
0.8466548, 2.006697, 0.7868436, 0.8431373, 0, 1, 1,
0.8495553, -1.909546, 4.14196, 0.8470588, 0, 1, 1,
0.8517187, 1.205186, -0.2946347, 0.854902, 0, 1, 1,
0.8543671, -1.352459, 2.995928, 0.8588235, 0, 1, 1,
0.8550742, 1.481323, 3.485148, 0.8666667, 0, 1, 1,
0.8608215, 2.417085, 0.599715, 0.8705882, 0, 1, 1,
0.8647947, -0.751047, 0.5631506, 0.8784314, 0, 1, 1,
0.8681013, -1.410164, 3.093469, 0.8823529, 0, 1, 1,
0.8693827, 0.4440898, 2.351102, 0.8901961, 0, 1, 1,
0.8711641, -0.1310295, 1.358449, 0.8941177, 0, 1, 1,
0.8713791, -0.8510933, 2.697882, 0.9019608, 0, 1, 1,
0.8731583, -0.6607964, 1.322167, 0.9098039, 0, 1, 1,
0.8777838, 2.773307, 0.9674749, 0.9137255, 0, 1, 1,
0.8803309, -0.9705964, 2.318734, 0.9215686, 0, 1, 1,
0.8812091, -0.6965948, 0.1417374, 0.9254902, 0, 1, 1,
0.8836433, 1.913174, 0.2485384, 0.9333333, 0, 1, 1,
0.888129, 0.3559303, -0.6576942, 0.9372549, 0, 1, 1,
0.8892519, 0.4651738, 2.331408, 0.945098, 0, 1, 1,
0.8900996, 0.6674534, 0.4732946, 0.9490196, 0, 1, 1,
0.8990886, 0.6204401, 0.1005038, 0.9568627, 0, 1, 1,
0.9016249, -0.2815059, 3.057597, 0.9607843, 0, 1, 1,
0.9046455, 0.5479114, 1.260338, 0.9686275, 0, 1, 1,
0.9064528, 0.4276896, 0.8314332, 0.972549, 0, 1, 1,
0.9079643, -0.8544303, 1.263969, 0.9803922, 0, 1, 1,
0.9121808, -0.1597867, 1.525267, 0.9843137, 0, 1, 1,
0.9167162, -0.4615235, 2.762728, 0.9921569, 0, 1, 1,
0.9179315, -0.4208702, 1.386002, 0.9960784, 0, 1, 1,
0.9276032, -1.653825, 2.684913, 1, 0, 0.9960784, 1,
0.9283295, -1.070016, 1.808313, 1, 0, 0.9882353, 1,
0.9305402, -1.67347, 0.8320968, 1, 0, 0.9843137, 1,
0.9328849, -0.5617484, 3.58098, 1, 0, 0.9764706, 1,
0.9345295, 1.233954, -1.504757, 1, 0, 0.972549, 1,
0.9394081, -0.1580438, 0.9428825, 1, 0, 0.9647059, 1,
0.9418839, -1.706969, 3.472958, 1, 0, 0.9607843, 1,
0.9440828, 0.1303477, 2.616889, 1, 0, 0.9529412, 1,
0.9467391, -0.9633847, 2.618171, 1, 0, 0.9490196, 1,
0.9519335, 0.6274992, -0.8280956, 1, 0, 0.9411765, 1,
0.9535642, -1.815411, 2.699787, 1, 0, 0.9372549, 1,
0.9548657, -0.727261, 1.589793, 1, 0, 0.9294118, 1,
0.9581202, -0.5965564, 0.2382359, 1, 0, 0.9254902, 1,
0.9584805, -0.035776, 0.7582981, 1, 0, 0.9176471, 1,
0.9629992, -0.4185821, 3.517251, 1, 0, 0.9137255, 1,
0.9643594, 1.163917, 2.139804, 1, 0, 0.9058824, 1,
0.9703947, 1.573401, 0.256889, 1, 0, 0.9019608, 1,
0.9743946, -0.7646201, 3.730937, 1, 0, 0.8941177, 1,
0.9759211, 1.023161, -0.6697867, 1, 0, 0.8862745, 1,
0.9770752, 0.5526422, 1.154576, 1, 0, 0.8823529, 1,
0.9778718, 0.8614759, 0.2965732, 1, 0, 0.8745098, 1,
0.9814922, 1.433494, -0.1787479, 1, 0, 0.8705882, 1,
0.9838551, -0.9520229, 2.321276, 1, 0, 0.8627451, 1,
0.9886322, 0.8358041, 0.3106008, 1, 0, 0.8588235, 1,
0.9913198, -0.3101583, 0.3052425, 1, 0, 0.8509804, 1,
0.9924098, 1.000976, 3.152092, 1, 0, 0.8470588, 1,
0.9945298, -1.454748, 3.433964, 1, 0, 0.8392157, 1,
0.9983388, -0.7596348, 2.614, 1, 0, 0.8352941, 1,
1.005627, 0.5495859, 2.474626, 1, 0, 0.827451, 1,
1.008684, 0.1928054, 0.3666045, 1, 0, 0.8235294, 1,
1.00938, 0.6480702, 0.1666932, 1, 0, 0.8156863, 1,
1.014581, -2.382626, 2.822731, 1, 0, 0.8117647, 1,
1.014807, 0.2660291, 2.285408, 1, 0, 0.8039216, 1,
1.0202, -0.3653899, 2.788502, 1, 0, 0.7960784, 1,
1.02196, 0.8273993, 1.602676, 1, 0, 0.7921569, 1,
1.025063, 0.1765106, 1.171303, 1, 0, 0.7843137, 1,
1.030898, 0.9206924, 0.08743092, 1, 0, 0.7803922, 1,
1.058778, 0.3299898, -0.1891318, 1, 0, 0.772549, 1,
1.060869, -0.2361037, 0.8394367, 1, 0, 0.7686275, 1,
1.066095, -0.2565423, 0.910638, 1, 0, 0.7607843, 1,
1.069651, -1.284002, 1.991851, 1, 0, 0.7568628, 1,
1.095815, 1.538668, 2.45768, 1, 0, 0.7490196, 1,
1.096008, -0.3365552, 2.83053, 1, 0, 0.7450981, 1,
1.099305, 1.352756, 1.075147, 1, 0, 0.7372549, 1,
1.10481, 0.4851331, -0.8369361, 1, 0, 0.7333333, 1,
1.108532, 0.651955, 1.525298, 1, 0, 0.7254902, 1,
1.113829, 0.3534902, 2.150966, 1, 0, 0.7215686, 1,
1.114951, 0.2105813, 2.182635, 1, 0, 0.7137255, 1,
1.117834, -0.2190195, 2.149544, 1, 0, 0.7098039, 1,
1.120647, 0.8316806, 0.2371019, 1, 0, 0.7019608, 1,
1.123544, -1.610678, 2.976795, 1, 0, 0.6941177, 1,
1.1245, -0.7133654, 2.516364, 1, 0, 0.6901961, 1,
1.124524, 0.9373398, 0.067078, 1, 0, 0.682353, 1,
1.130729, -0.730705, 1.620929, 1, 0, 0.6784314, 1,
1.131244, 0.2866944, 1.706859, 1, 0, 0.6705883, 1,
1.135581, 1.425986, 2.135143, 1, 0, 0.6666667, 1,
1.141622, 1.351761, 1.042595, 1, 0, 0.6588235, 1,
1.143236, -0.05783878, 1.885971, 1, 0, 0.654902, 1,
1.143269, -0.1557651, 0.7984481, 1, 0, 0.6470588, 1,
1.146057, 0.3143836, 0.8696922, 1, 0, 0.6431373, 1,
1.155777, -0.2788365, 2.649016, 1, 0, 0.6352941, 1,
1.163302, -0.9230619, 1.558497, 1, 0, 0.6313726, 1,
1.167726, 0.7976204, 2.02222, 1, 0, 0.6235294, 1,
1.176128, 0.02686819, -0.3797566, 1, 0, 0.6196079, 1,
1.177553, -0.5792543, 1.804344, 1, 0, 0.6117647, 1,
1.178062, 0.918834, 0.8340164, 1, 0, 0.6078432, 1,
1.19051, 0.6746042, 1.559484, 1, 0, 0.6, 1,
1.192837, -0.843684, 1.224093, 1, 0, 0.5921569, 1,
1.194028, 2.158957, 0.6798438, 1, 0, 0.5882353, 1,
1.194155, 1.204839, -1.062834, 1, 0, 0.5803922, 1,
1.20121, -0.2516538, 2.471391, 1, 0, 0.5764706, 1,
1.203589, -1.017975, 1.673872, 1, 0, 0.5686275, 1,
1.207217, 0.6622528, 1.205271, 1, 0, 0.5647059, 1,
1.233572, 0.4932336, 1.251477, 1, 0, 0.5568628, 1,
1.243385, 0.3757735, 1.434369, 1, 0, 0.5529412, 1,
1.245493, -1.602327, 4.564388, 1, 0, 0.5450981, 1,
1.273391, 0.4688174, 0.7055844, 1, 0, 0.5411765, 1,
1.276423, -0.2288655, 0.9341925, 1, 0, 0.5333334, 1,
1.278449, 1.905816, -0.6978942, 1, 0, 0.5294118, 1,
1.284386, -0.2658642, 2.3075, 1, 0, 0.5215687, 1,
1.284995, -0.00898993, 2.201185, 1, 0, 0.5176471, 1,
1.285688, 0.5364695, 2.251763, 1, 0, 0.509804, 1,
1.289386, -0.2900954, 2.143199, 1, 0, 0.5058824, 1,
1.293954, 0.1386677, 0.7180189, 1, 0, 0.4980392, 1,
1.304483, 0.1608527, 1.685963, 1, 0, 0.4901961, 1,
1.306745, 2.215138, 2.233878, 1, 0, 0.4862745, 1,
1.307925, -1.336221, 2.432336, 1, 0, 0.4784314, 1,
1.308368, -1.861722, 2.407986, 1, 0, 0.4745098, 1,
1.31878, 0.1224388, 1.637611, 1, 0, 0.4666667, 1,
1.319846, -0.2820352, 2.413404, 1, 0, 0.4627451, 1,
1.320027, -2.20952, 2.068771, 1, 0, 0.454902, 1,
1.327228, -1.121365, 3.637526, 1, 0, 0.4509804, 1,
1.329279, 1.109392, 0.5832262, 1, 0, 0.4431373, 1,
1.332242, 0.8773128, 0.6985279, 1, 0, 0.4392157, 1,
1.346161, 1.584789, 0.5431469, 1, 0, 0.4313726, 1,
1.354387, 1.234395, -0.0845897, 1, 0, 0.427451, 1,
1.357783, -1.45537, -0.009708094, 1, 0, 0.4196078, 1,
1.357893, 1.087588, 1.431343, 1, 0, 0.4156863, 1,
1.369487, -0.316006, 1.813488, 1, 0, 0.4078431, 1,
1.371253, -0.5286645, 1.980391, 1, 0, 0.4039216, 1,
1.379548, 0.6233026, 2.270014, 1, 0, 0.3960784, 1,
1.384125, -0.5042243, 0.7436455, 1, 0, 0.3882353, 1,
1.407358, 0.4679659, 0.3680387, 1, 0, 0.3843137, 1,
1.41198, -0.6105412, 3.991993, 1, 0, 0.3764706, 1,
1.417981, 0.1336197, 3.080549, 1, 0, 0.372549, 1,
1.442763, 0.2364608, 1.071263, 1, 0, 0.3647059, 1,
1.463606, -1.128888, 1.482796, 1, 0, 0.3607843, 1,
1.492096, 1.660257, 0.02255489, 1, 0, 0.3529412, 1,
1.526322, -0.8140211, 1.72367, 1, 0, 0.3490196, 1,
1.53718, -2.306335, 1.542897, 1, 0, 0.3411765, 1,
1.546118, -0.2663164, 1.775241, 1, 0, 0.3372549, 1,
1.547568, -1.126558, 1.823344, 1, 0, 0.3294118, 1,
1.56089, 0.1682157, 1.955664, 1, 0, 0.3254902, 1,
1.562585, 0.5637243, 1.838119, 1, 0, 0.3176471, 1,
1.596726, 0.1100447, 0.3590668, 1, 0, 0.3137255, 1,
1.601174, 1.41347, 1.134612, 1, 0, 0.3058824, 1,
1.604017, 0.2140005, 1.554761, 1, 0, 0.2980392, 1,
1.633844, 1.259677, 1.1748, 1, 0, 0.2941177, 1,
1.635902, 1.596911, 0.3055785, 1, 0, 0.2862745, 1,
1.643316, 0.3755206, 0.6876453, 1, 0, 0.282353, 1,
1.738577, 1.360187, 2.461938, 1, 0, 0.2745098, 1,
1.758433, -0.3884394, 2.853912, 1, 0, 0.2705882, 1,
1.776551, 0.5724933, 0.07913774, 1, 0, 0.2627451, 1,
1.782414, -1.548337, 1.541293, 1, 0, 0.2588235, 1,
1.804214, 1.610494, 1.571554, 1, 0, 0.2509804, 1,
1.810132, -0.386227, 2.880505, 1, 0, 0.2470588, 1,
1.81762, 0.1013049, 2.094929, 1, 0, 0.2392157, 1,
1.818203, -0.4190401, 2.199548, 1, 0, 0.2352941, 1,
1.827465, -0.9093578, 2.504453, 1, 0, 0.227451, 1,
1.836847, 2.058941, 0.2278869, 1, 0, 0.2235294, 1,
1.839967, 1.046044, -0.6889136, 1, 0, 0.2156863, 1,
1.848877, -1.625558, 3.301947, 1, 0, 0.2117647, 1,
1.860603, -2.391429, 3.028525, 1, 0, 0.2039216, 1,
1.865214, -0.6698866, 2.384912, 1, 0, 0.1960784, 1,
1.879155, -2.346383, 3.716286, 1, 0, 0.1921569, 1,
1.937368, 0.6475844, 0.9925958, 1, 0, 0.1843137, 1,
1.939455, -0.485081, 3.084822, 1, 0, 0.1803922, 1,
1.946248, 0.7601119, 1.390923, 1, 0, 0.172549, 1,
1.946471, 0.02501278, 2.366822, 1, 0, 0.1686275, 1,
1.955932, -0.2449893, 1.52687, 1, 0, 0.1607843, 1,
1.976868, -1.168087, 1.994463, 1, 0, 0.1568628, 1,
1.983967, -1.225774, 2.306295, 1, 0, 0.1490196, 1,
1.997008, 1.250398, 1.427432, 1, 0, 0.145098, 1,
2.055241, 0.7299758, 0.7357123, 1, 0, 0.1372549, 1,
2.057029, -0.2312711, 2.392946, 1, 0, 0.1333333, 1,
2.071247, -0.8258586, 2.782247, 1, 0, 0.1254902, 1,
2.071481, 0.5775204, 1.618888, 1, 0, 0.1215686, 1,
2.10143, -0.1902711, 0.8434356, 1, 0, 0.1137255, 1,
2.104295, -0.9960619, 2.916735, 1, 0, 0.1098039, 1,
2.143828, 0.1300923, 0.9077765, 1, 0, 0.1019608, 1,
2.148718, 0.8637388, 0.7291506, 1, 0, 0.09411765, 1,
2.149743, -2.186096, 1.807756, 1, 0, 0.09019608, 1,
2.156686, 0.4102182, 0.3279549, 1, 0, 0.08235294, 1,
2.17854, -0.4193611, 2.226119, 1, 0, 0.07843138, 1,
2.194348, 0.9228321, 2.179467, 1, 0, 0.07058824, 1,
2.265288, 1.106855, -0.1424838, 1, 0, 0.06666667, 1,
2.340035, 0.8467246, 1.198126, 1, 0, 0.05882353, 1,
2.397892, 0.1148258, 1.200718, 1, 0, 0.05490196, 1,
2.405507, 0.3314699, -0.1227068, 1, 0, 0.04705882, 1,
2.430504, -0.8415958, 2.015875, 1, 0, 0.04313726, 1,
2.449912, -1.272926, 2.958678, 1, 0, 0.03529412, 1,
2.507095, -1.954641, 2.017007, 1, 0, 0.03137255, 1,
2.608655, -0.3065925, 3.792835, 1, 0, 0.02352941, 1,
2.795636, -1.647279, 0.6824689, 1, 0, 0.01960784, 1,
3.361717, 1.199793, 1.303092, 1, 0, 0.01176471, 1,
3.516631, -0.5152863, 2.757693, 1, 0, 0.007843138, 1
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
0.03166151, -4.548691, -6.80398, 0, -0.5, 0.5, 0.5,
0.03166151, -4.548691, -6.80398, 1, -0.5, 0.5, 0.5,
0.03166151, -4.548691, -6.80398, 1, 1.5, 0.5, 0.5,
0.03166151, -4.548691, -6.80398, 0, 1.5, 0.5, 0.5
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
-4.634713, -0.03610814, -6.80398, 0, -0.5, 0.5, 0.5,
-4.634713, -0.03610814, -6.80398, 1, -0.5, 0.5, 0.5,
-4.634713, -0.03610814, -6.80398, 1, 1.5, 0.5, 0.5,
-4.634713, -0.03610814, -6.80398, 0, 1.5, 0.5, 0.5
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
-4.634713, -4.548691, -0.06691456, 0, -0.5, 0.5, 0.5,
-4.634713, -4.548691, -0.06691456, 1, -0.5, 0.5, 0.5,
-4.634713, -4.548691, -0.06691456, 1, 1.5, 0.5, 0.5,
-4.634713, -4.548691, -0.06691456, 0, 1.5, 0.5, 0.5
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
-3, -3.507326, -5.249273,
3, -3.507326, -5.249273,
-3, -3.507326, -5.249273,
-3, -3.680887, -5.508391,
-2, -3.507326, -5.249273,
-2, -3.680887, -5.508391,
-1, -3.507326, -5.249273,
-1, -3.680887, -5.508391,
0, -3.507326, -5.249273,
0, -3.680887, -5.508391,
1, -3.507326, -5.249273,
1, -3.680887, -5.508391,
2, -3.507326, -5.249273,
2, -3.680887, -5.508391,
3, -3.507326, -5.249273,
3, -3.680887, -5.508391
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
-3, -4.028008, -6.026627, 0, -0.5, 0.5, 0.5,
-3, -4.028008, -6.026627, 1, -0.5, 0.5, 0.5,
-3, -4.028008, -6.026627, 1, 1.5, 0.5, 0.5,
-3, -4.028008, -6.026627, 0, 1.5, 0.5, 0.5,
-2, -4.028008, -6.026627, 0, -0.5, 0.5, 0.5,
-2, -4.028008, -6.026627, 1, -0.5, 0.5, 0.5,
-2, -4.028008, -6.026627, 1, 1.5, 0.5, 0.5,
-2, -4.028008, -6.026627, 0, 1.5, 0.5, 0.5,
-1, -4.028008, -6.026627, 0, -0.5, 0.5, 0.5,
-1, -4.028008, -6.026627, 1, -0.5, 0.5, 0.5,
-1, -4.028008, -6.026627, 1, 1.5, 0.5, 0.5,
-1, -4.028008, -6.026627, 0, 1.5, 0.5, 0.5,
0, -4.028008, -6.026627, 0, -0.5, 0.5, 0.5,
0, -4.028008, -6.026627, 1, -0.5, 0.5, 0.5,
0, -4.028008, -6.026627, 1, 1.5, 0.5, 0.5,
0, -4.028008, -6.026627, 0, 1.5, 0.5, 0.5,
1, -4.028008, -6.026627, 0, -0.5, 0.5, 0.5,
1, -4.028008, -6.026627, 1, -0.5, 0.5, 0.5,
1, -4.028008, -6.026627, 1, 1.5, 0.5, 0.5,
1, -4.028008, -6.026627, 0, 1.5, 0.5, 0.5,
2, -4.028008, -6.026627, 0, -0.5, 0.5, 0.5,
2, -4.028008, -6.026627, 1, -0.5, 0.5, 0.5,
2, -4.028008, -6.026627, 1, 1.5, 0.5, 0.5,
2, -4.028008, -6.026627, 0, 1.5, 0.5, 0.5,
3, -4.028008, -6.026627, 0, -0.5, 0.5, 0.5,
3, -4.028008, -6.026627, 1, -0.5, 0.5, 0.5,
3, -4.028008, -6.026627, 1, 1.5, 0.5, 0.5,
3, -4.028008, -6.026627, 0, 1.5, 0.5, 0.5
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
-3.557858, -3, -5.249273,
-3.557858, 3, -5.249273,
-3.557858, -3, -5.249273,
-3.737333, -3, -5.508391,
-3.557858, -2, -5.249273,
-3.737333, -2, -5.508391,
-3.557858, -1, -5.249273,
-3.737333, -1, -5.508391,
-3.557858, 0, -5.249273,
-3.737333, 0, -5.508391,
-3.557858, 1, -5.249273,
-3.737333, 1, -5.508391,
-3.557858, 2, -5.249273,
-3.737333, 2, -5.508391,
-3.557858, 3, -5.249273,
-3.737333, 3, -5.508391
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
-4.096285, -3, -6.026627, 0, -0.5, 0.5, 0.5,
-4.096285, -3, -6.026627, 1, -0.5, 0.5, 0.5,
-4.096285, -3, -6.026627, 1, 1.5, 0.5, 0.5,
-4.096285, -3, -6.026627, 0, 1.5, 0.5, 0.5,
-4.096285, -2, -6.026627, 0, -0.5, 0.5, 0.5,
-4.096285, -2, -6.026627, 1, -0.5, 0.5, 0.5,
-4.096285, -2, -6.026627, 1, 1.5, 0.5, 0.5,
-4.096285, -2, -6.026627, 0, 1.5, 0.5, 0.5,
-4.096285, -1, -6.026627, 0, -0.5, 0.5, 0.5,
-4.096285, -1, -6.026627, 1, -0.5, 0.5, 0.5,
-4.096285, -1, -6.026627, 1, 1.5, 0.5, 0.5,
-4.096285, -1, -6.026627, 0, 1.5, 0.5, 0.5,
-4.096285, 0, -6.026627, 0, -0.5, 0.5, 0.5,
-4.096285, 0, -6.026627, 1, -0.5, 0.5, 0.5,
-4.096285, 0, -6.026627, 1, 1.5, 0.5, 0.5,
-4.096285, 0, -6.026627, 0, 1.5, 0.5, 0.5,
-4.096285, 1, -6.026627, 0, -0.5, 0.5, 0.5,
-4.096285, 1, -6.026627, 1, -0.5, 0.5, 0.5,
-4.096285, 1, -6.026627, 1, 1.5, 0.5, 0.5,
-4.096285, 1, -6.026627, 0, 1.5, 0.5, 0.5,
-4.096285, 2, -6.026627, 0, -0.5, 0.5, 0.5,
-4.096285, 2, -6.026627, 1, -0.5, 0.5, 0.5,
-4.096285, 2, -6.026627, 1, 1.5, 0.5, 0.5,
-4.096285, 2, -6.026627, 0, 1.5, 0.5, 0.5,
-4.096285, 3, -6.026627, 0, -0.5, 0.5, 0.5,
-4.096285, 3, -6.026627, 1, -0.5, 0.5, 0.5,
-4.096285, 3, -6.026627, 1, 1.5, 0.5, 0.5,
-4.096285, 3, -6.026627, 0, 1.5, 0.5, 0.5
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
-3.557858, -3.507326, -4,
-3.557858, -3.507326, 4,
-3.557858, -3.507326, -4,
-3.737333, -3.680887, -4,
-3.557858, -3.507326, -2,
-3.737333, -3.680887, -2,
-3.557858, -3.507326, 0,
-3.737333, -3.680887, 0,
-3.557858, -3.507326, 2,
-3.737333, -3.680887, 2,
-3.557858, -3.507326, 4,
-3.737333, -3.680887, 4
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
-4.096285, -4.028008, -4, 0, -0.5, 0.5, 0.5,
-4.096285, -4.028008, -4, 1, -0.5, 0.5, 0.5,
-4.096285, -4.028008, -4, 1, 1.5, 0.5, 0.5,
-4.096285, -4.028008, -4, 0, 1.5, 0.5, 0.5,
-4.096285, -4.028008, -2, 0, -0.5, 0.5, 0.5,
-4.096285, -4.028008, -2, 1, -0.5, 0.5, 0.5,
-4.096285, -4.028008, -2, 1, 1.5, 0.5, 0.5,
-4.096285, -4.028008, -2, 0, 1.5, 0.5, 0.5,
-4.096285, -4.028008, 0, 0, -0.5, 0.5, 0.5,
-4.096285, -4.028008, 0, 1, -0.5, 0.5, 0.5,
-4.096285, -4.028008, 0, 1, 1.5, 0.5, 0.5,
-4.096285, -4.028008, 0, 0, 1.5, 0.5, 0.5,
-4.096285, -4.028008, 2, 0, -0.5, 0.5, 0.5,
-4.096285, -4.028008, 2, 1, -0.5, 0.5, 0.5,
-4.096285, -4.028008, 2, 1, 1.5, 0.5, 0.5,
-4.096285, -4.028008, 2, 0, 1.5, 0.5, 0.5,
-4.096285, -4.028008, 4, 0, -0.5, 0.5, 0.5,
-4.096285, -4.028008, 4, 1, -0.5, 0.5, 0.5,
-4.096285, -4.028008, 4, 1, 1.5, 0.5, 0.5,
-4.096285, -4.028008, 4, 0, 1.5, 0.5, 0.5
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
-3.557858, -3.507326, -5.249273,
-3.557858, 3.43511, -5.249273,
-3.557858, -3.507326, 5.115444,
-3.557858, 3.43511, 5.115444,
-3.557858, -3.507326, -5.249273,
-3.557858, -3.507326, 5.115444,
-3.557858, 3.43511, -5.249273,
-3.557858, 3.43511, 5.115444,
-3.557858, -3.507326, -5.249273,
3.621181, -3.507326, -5.249273,
-3.557858, -3.507326, 5.115444,
3.621181, -3.507326, 5.115444,
-3.557858, 3.43511, -5.249273,
3.621181, 3.43511, -5.249273,
-3.557858, 3.43511, 5.115444,
3.621181, 3.43511, 5.115444,
3.621181, -3.507326, -5.249273,
3.621181, 3.43511, -5.249273,
3.621181, -3.507326, 5.115444,
3.621181, 3.43511, 5.115444,
3.621181, -3.507326, -5.249273,
3.621181, -3.507326, 5.115444,
3.621181, 3.43511, -5.249273,
3.621181, 3.43511, 5.115444
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
var radius = 7.685673;
var distance = 34.19443;
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
mvMatrix.translate( -0.03166151, 0.03610814, 0.06691456 );
mvMatrix.scale( 1.157523, 1.196972, 0.8017489 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19443);
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
sodium_dehydroacetat<-read.table("sodium_dehydroacetat.xyz")
```

```
## Error in read.table("sodium_dehydroacetat.xyz"): no lines available in input
```

```r
x<-sodium_dehydroacetat$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
```

```r
y<-sodium_dehydroacetat$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
```

```r
z<-sodium_dehydroacetat$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
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
-3.453308, 0.04674377, -0.7378969, 0, 0, 1, 1, 1,
-3.451436, -0.1905718, -1.084765, 1, 0, 0, 1, 1,
-3.032571, -0.1047221, -1.143569, 1, 0, 0, 1, 1,
-2.933011, -1.007232, -2.048123, 1, 0, 0, 1, 1,
-2.811839, 1.289467, -0.776925, 1, 0, 0, 1, 1,
-2.546013, -1.637922, -1.422632, 1, 0, 0, 1, 1,
-2.510798, 0.4048428, -1.01839, 0, 0, 0, 1, 1,
-2.401693, 1.161476, -2.018244, 0, 0, 0, 1, 1,
-2.262933, 2.254365, 0.7819781, 0, 0, 0, 1, 1,
-2.26251, -0.8210615, -1.059113, 0, 0, 0, 1, 1,
-2.262011, 0.09142903, -1.787074, 0, 0, 0, 1, 1,
-2.254736, 0.09772294, -0.9430816, 0, 0, 0, 1, 1,
-2.198166, -2.333363, -3.237115, 0, 0, 0, 1, 1,
-2.197759, 1.412218, 0.1036275, 1, 1, 1, 1, 1,
-2.108247, 1.665015, -0.1491702, 1, 1, 1, 1, 1,
-2.055098, 0.09111978, -0.6263182, 1, 1, 1, 1, 1,
-2.023598, -0.826336, -2.42755, 1, 1, 1, 1, 1,
-2.011536, -1.02242, -2.311064, 1, 1, 1, 1, 1,
-2.010493, -1.474236, -2.307803, 1, 1, 1, 1, 1,
-2.005131, 0.05971459, -0.5375561, 1, 1, 1, 1, 1,
-2.002503, -0.7285236, -1.873648, 1, 1, 1, 1, 1,
-1.9629, -0.2780002, -3.055182, 1, 1, 1, 1, 1,
-1.957311, 0.07679571, 0.1845881, 1, 1, 1, 1, 1,
-1.953528, 0.3941368, -1.127992, 1, 1, 1, 1, 1,
-1.941918, 1.007609, -2.031408, 1, 1, 1, 1, 1,
-1.934969, 1.576947, -1.200011, 1, 1, 1, 1, 1,
-1.931331, 0.6746261, -0.8863646, 1, 1, 1, 1, 1,
-1.892295, -0.6404818, -1.584675, 1, 1, 1, 1, 1,
-1.890878, 0.425502, -0.5347342, 0, 0, 1, 1, 1,
-1.889983, -1.443547, -2.350843, 1, 0, 0, 1, 1,
-1.888916, -1.248586, -0.8065665, 1, 0, 0, 1, 1,
-1.853835, -0.5383414, -1.77965, 1, 0, 0, 1, 1,
-1.820507, 1.675777, -1.325097, 1, 0, 0, 1, 1,
-1.799559, 1.156647, -0.9740245, 1, 0, 0, 1, 1,
-1.789561, 2.053383, -1.448401, 0, 0, 0, 1, 1,
-1.789226, -0.6506091, -3.307005, 0, 0, 0, 1, 1,
-1.787121, -0.05050569, -0.8189357, 0, 0, 0, 1, 1,
-1.782806, 0.06053628, -3.164845, 0, 0, 0, 1, 1,
-1.779513, 0.592577, -1.291205, 0, 0, 0, 1, 1,
-1.779383, 0.01602845, -0.4662572, 0, 0, 0, 1, 1,
-1.771592, -0.5659135, -1.700127, 0, 0, 0, 1, 1,
-1.771304, 0.3401011, -1.910203, 1, 1, 1, 1, 1,
-1.769429, 2.477168, -2.186043, 1, 1, 1, 1, 1,
-1.76929, 1.127016, -1.35642, 1, 1, 1, 1, 1,
-1.757637, 0.9523858, -2.007545, 1, 1, 1, 1, 1,
-1.735608, -0.08978689, -1.256267, 1, 1, 1, 1, 1,
-1.719932, -1.285745, -3.186759, 1, 1, 1, 1, 1,
-1.717086, -1.107085, -2.240352, 1, 1, 1, 1, 1,
-1.69325, 1.226987, 0.06497675, 1, 1, 1, 1, 1,
-1.64284, 2.011343, 0.09885313, 1, 1, 1, 1, 1,
-1.634665, -0.4190995, -2.095255, 1, 1, 1, 1, 1,
-1.628593, 1.153516, -0.2556524, 1, 1, 1, 1, 1,
-1.626832, -0.7131137, -0.7309583, 1, 1, 1, 1, 1,
-1.62427, -0.1769855, -0.2827803, 1, 1, 1, 1, 1,
-1.613534, -0.1991633, -1.890002, 1, 1, 1, 1, 1,
-1.610947, -0.8630422, -0.3316317, 1, 1, 1, 1, 1,
-1.598208, -0.3436656, -1.159959, 0, 0, 1, 1, 1,
-1.593559, -1.930596, -2.694585, 1, 0, 0, 1, 1,
-1.583494, -0.738222, -1.646079, 1, 0, 0, 1, 1,
-1.571677, 0.9214203, -1.956837, 1, 0, 0, 1, 1,
-1.565198, 0.4778737, -0.8541295, 1, 0, 0, 1, 1,
-1.545603, -1.276308, -3.159702, 1, 0, 0, 1, 1,
-1.545428, 0.2148847, -1.286226, 0, 0, 0, 1, 1,
-1.539569, -1.278665, -1.561585, 0, 0, 0, 1, 1,
-1.536302, 0.2826365, -1.724991, 0, 0, 0, 1, 1,
-1.521926, 0.6964658, -0.9996682, 0, 0, 0, 1, 1,
-1.520139, 0.004529718, -1.56636, 0, 0, 0, 1, 1,
-1.514611, -0.1226384, -0.8889691, 0, 0, 0, 1, 1,
-1.503695, 0.8734567, -0.5767095, 0, 0, 0, 1, 1,
-1.488297, 0.3607376, -1.450957, 1, 1, 1, 1, 1,
-1.482419, 1.364408, -0.7136924, 1, 1, 1, 1, 1,
-1.48217, 0.7609492, -1.610117, 1, 1, 1, 1, 1,
-1.481576, 0.434253, -1.469664, 1, 1, 1, 1, 1,
-1.479058, -1.157784, -3.095549, 1, 1, 1, 1, 1,
-1.478737, -1.17014, -3.768145, 1, 1, 1, 1, 1,
-1.473926, -0.1396076, 0.2302158, 1, 1, 1, 1, 1,
-1.453135, 1.344098, -2.66007, 1, 1, 1, 1, 1,
-1.452578, 0.6630926, -0.3909248, 1, 1, 1, 1, 1,
-1.452108, 1.491199, -0.694077, 1, 1, 1, 1, 1,
-1.448944, -0.785425, -0.8256053, 1, 1, 1, 1, 1,
-1.447721, -0.1963932, -1.741769, 1, 1, 1, 1, 1,
-1.439255, -0.8166196, -0.4516543, 1, 1, 1, 1, 1,
-1.438462, -1.204961, -0.8862432, 1, 1, 1, 1, 1,
-1.435999, 0.7191022, 0.3292821, 1, 1, 1, 1, 1,
-1.434812, -1.934691, -2.113731, 0, 0, 1, 1, 1,
-1.429589, 0.07886138, -1.006989, 1, 0, 0, 1, 1,
-1.428127, -0.3270461, -2.935448, 1, 0, 0, 1, 1,
-1.424867, 0.08024333, -0.1105575, 1, 0, 0, 1, 1,
-1.422861, 2.393707, 0.6499866, 1, 0, 0, 1, 1,
-1.403915, -0.3898896, -3.146916, 1, 0, 0, 1, 1,
-1.401039, -0.06937339, 0.07105246, 0, 0, 0, 1, 1,
-1.399496, 0.402513, -2.846245, 0, 0, 0, 1, 1,
-1.396957, -1.084401, -0.7447816, 0, 0, 0, 1, 1,
-1.396855, -1.325903, -1.079306, 0, 0, 0, 1, 1,
-1.390688, -1.032663, -0.7485533, 0, 0, 0, 1, 1,
-1.383197, 1.673025, 0.2247534, 0, 0, 0, 1, 1,
-1.38047, -1.550326, -5.09833, 0, 0, 0, 1, 1,
-1.373062, -0.2599922, -1.366755, 1, 1, 1, 1, 1,
-1.364736, 0.6284987, -2.113775, 1, 1, 1, 1, 1,
-1.361928, 0.2850073, -3.181686, 1, 1, 1, 1, 1,
-1.344799, 0.5170835, -1.188208, 1, 1, 1, 1, 1,
-1.340415, -0.6357952, -0.343154, 1, 1, 1, 1, 1,
-1.325988, -0.00239725, -2.552955, 1, 1, 1, 1, 1,
-1.32515, -0.1327325, -3.612832, 1, 1, 1, 1, 1,
-1.321885, -0.4238954, -2.373628, 1, 1, 1, 1, 1,
-1.318995, 2.581141, 1.496031, 1, 1, 1, 1, 1,
-1.312605, -0.003557431, -1.952332, 1, 1, 1, 1, 1,
-1.307079, 1.470497, -0.7247733, 1, 1, 1, 1, 1,
-1.305031, 1.328273, -1.381306, 1, 1, 1, 1, 1,
-1.30354, 1.456602, -0.6311167, 1, 1, 1, 1, 1,
-1.300801, -1.114694, -2.72717, 1, 1, 1, 1, 1,
-1.290222, -0.1397618, -0.1543217, 1, 1, 1, 1, 1,
-1.288462, 0.6208317, -1.202938, 0, 0, 1, 1, 1,
-1.26678, 0.492012, -2.216863, 1, 0, 0, 1, 1,
-1.263636, -0.7222619, -0.983597, 1, 0, 0, 1, 1,
-1.262643, 1.884343, 0.3496804, 1, 0, 0, 1, 1,
-1.261537, 1.109053, -1.541128, 1, 0, 0, 1, 1,
-1.260824, -0.9103915, -1.302137, 1, 0, 0, 1, 1,
-1.256867, 0.1497395, -2.035094, 0, 0, 0, 1, 1,
-1.251478, 0.9664676, -0.2673337, 0, 0, 0, 1, 1,
-1.249202, -0.02269717, -1.971058, 0, 0, 0, 1, 1,
-1.246296, -0.5244156, -1.820822, 0, 0, 0, 1, 1,
-1.239289, 0.6757097, -0.2761655, 0, 0, 0, 1, 1,
-1.208748, -0.2852156, -2.300942, 0, 0, 0, 1, 1,
-1.198846, 0.1206454, -2.052053, 0, 0, 0, 1, 1,
-1.196325, -0.9071167, -2.646824, 1, 1, 1, 1, 1,
-1.195334, 0.02683646, 0.2678757, 1, 1, 1, 1, 1,
-1.194097, -3.406222, -3.302032, 1, 1, 1, 1, 1,
-1.188383, 0.3300705, -0.1244673, 1, 1, 1, 1, 1,
-1.181496, 0.6573375, -3.072278, 1, 1, 1, 1, 1,
-1.180626, -1.22471, -1.244044, 1, 1, 1, 1, 1,
-1.180297, -0.4294868, -0.5079369, 1, 1, 1, 1, 1,
-1.165835, -0.2416039, -2.18363, 1, 1, 1, 1, 1,
-1.162314, -1.061963, -2.933292, 1, 1, 1, 1, 1,
-1.157625, -0.7200263, -2.082586, 1, 1, 1, 1, 1,
-1.157174, 0.0679348, -0.9034768, 1, 1, 1, 1, 1,
-1.141856, 1.656911, -0.3109587, 1, 1, 1, 1, 1,
-1.140293, 0.08298921, -3.45044, 1, 1, 1, 1, 1,
-1.132553, 0.9782341, -0.950264, 1, 1, 1, 1, 1,
-1.127434, -0.1776367, -0.8314549, 1, 1, 1, 1, 1,
-1.125571, 1.312476, -0.5160018, 0, 0, 1, 1, 1,
-1.125458, -0.1086346, -0.6475277, 1, 0, 0, 1, 1,
-1.124256, 1.09704, -1.374677, 1, 0, 0, 1, 1,
-1.123078, -0.3236946, -0.6396955, 1, 0, 0, 1, 1,
-1.121031, -0.5208588, -1.061845, 1, 0, 0, 1, 1,
-1.120205, 0.5040137, -0.8862743, 1, 0, 0, 1, 1,
-1.119691, 1.013828, 0.8934439, 0, 0, 0, 1, 1,
-1.107273, 1.636527, -1.06501, 0, 0, 0, 1, 1,
-1.104946, 2.669327, -1.316169, 0, 0, 0, 1, 1,
-1.099741, -1.105981, -2.455044, 0, 0, 0, 1, 1,
-1.099528, -0.7970014, -1.950993, 0, 0, 0, 1, 1,
-1.094877, -0.8302073, -0.6697219, 0, 0, 0, 1, 1,
-1.07698, 0.6890872, -0.9551243, 0, 0, 0, 1, 1,
-1.070379, 0.7312769, -1.076963, 1, 1, 1, 1, 1,
-1.065348, 1.862762, -1.369757, 1, 1, 1, 1, 1,
-1.065093, 0.2117769, -0.8517208, 1, 1, 1, 1, 1,
-1.055667, 0.9698644, 0.4532482, 1, 1, 1, 1, 1,
-1.053971, -0.6274388, -2.255108, 1, 1, 1, 1, 1,
-1.05232, 0.9360533, -2.438472, 1, 1, 1, 1, 1,
-1.047351, 2.326396, -0.3959938, 1, 1, 1, 1, 1,
-1.045575, -1.055931, -3.016558, 1, 1, 1, 1, 1,
-1.041308, 1.246582, -0.2579149, 1, 1, 1, 1, 1,
-1.029096, 0.0838244, -0.5807716, 1, 1, 1, 1, 1,
-1.014644, 0.8977423, 0.7959419, 1, 1, 1, 1, 1,
-1.014092, 0.1090517, -0.275833, 1, 1, 1, 1, 1,
-1.011924, -0.5835296, -3.168246, 1, 1, 1, 1, 1,
-1.009919, 0.01202746, -1.969177, 1, 1, 1, 1, 1,
-1.008505, 1.396966, 2.134541, 1, 1, 1, 1, 1,
-1.008433, 2.132081, -0.2470064, 0, 0, 1, 1, 1,
-1.002904, -0.1660686, -1.064846, 1, 0, 0, 1, 1,
-0.9974239, -1.819928, -3.950967, 1, 0, 0, 1, 1,
-0.992983, -0.2477233, -1.822313, 1, 0, 0, 1, 1,
-0.9926108, -0.3142818, -1.501241, 1, 0, 0, 1, 1,
-0.976272, 1.887532, 0.5605436, 1, 0, 0, 1, 1,
-0.9730901, 0.5306097, 0.2348952, 0, 0, 0, 1, 1,
-0.9705365, -0.06341322, -0.913586, 0, 0, 0, 1, 1,
-0.9654043, 2.366916, -0.8933718, 0, 0, 0, 1, 1,
-0.9638531, 0.04785975, -1.090681, 0, 0, 0, 1, 1,
-0.963574, -0.7001719, -2.222518, 0, 0, 0, 1, 1,
-0.9620591, 0.3345565, -0.9153697, 0, 0, 0, 1, 1,
-0.9558573, -2.066824, -2.864721, 0, 0, 0, 1, 1,
-0.9541456, -0.110069, -1.305898, 1, 1, 1, 1, 1,
-0.9504891, -0.09643044, -1.626401, 1, 1, 1, 1, 1,
-0.9493989, 1.289972, -1.70792, 1, 1, 1, 1, 1,
-0.9490614, 0.2603056, -1.892973, 1, 1, 1, 1, 1,
-0.9473736, -0.1133578, -3.465674, 1, 1, 1, 1, 1,
-0.9441649, -1.217792, -1.678225, 1, 1, 1, 1, 1,
-0.9425849, -0.2733082, -0.9979771, 1, 1, 1, 1, 1,
-0.9372666, 0.1400236, -1.589809, 1, 1, 1, 1, 1,
-0.9354761, -0.2847441, -3.520232, 1, 1, 1, 1, 1,
-0.9313927, 0.9191829, -0.4218906, 1, 1, 1, 1, 1,
-0.9293384, 0.9422581, -1.875977, 1, 1, 1, 1, 1,
-0.9116771, -0.4624701, -0.2389894, 1, 1, 1, 1, 1,
-0.9086964, -1.625318, -1.514951, 1, 1, 1, 1, 1,
-0.9085371, 1.066218, -1.373212, 1, 1, 1, 1, 1,
-0.9084381, -0.2770711, -1.89579, 1, 1, 1, 1, 1,
-0.9075431, -0.030465, -1.943353, 0, 0, 1, 1, 1,
-0.9063083, -1.245239, -3.262265, 1, 0, 0, 1, 1,
-0.8967906, -1.286339, -2.311308, 1, 0, 0, 1, 1,
-0.8959571, -0.4639851, -1.912384, 1, 0, 0, 1, 1,
-0.8959559, 1.749109, -1.419957, 1, 0, 0, 1, 1,
-0.8953573, -1.072024, -2.65244, 1, 0, 0, 1, 1,
-0.8893588, 0.8987969, -0.8048228, 0, 0, 0, 1, 1,
-0.8887476, -1.666856, -2.888209, 0, 0, 0, 1, 1,
-0.8817642, 0.1204175, -1.465826, 0, 0, 0, 1, 1,
-0.8808976, 0.8846225, -0.4564429, 0, 0, 0, 1, 1,
-0.8800739, -0.3748104, -2.199202, 0, 0, 0, 1, 1,
-0.8776227, -1.394666, -3.017481, 0, 0, 0, 1, 1,
-0.8736578, -1.204996, -3.787586, 0, 0, 0, 1, 1,
-0.873381, -0.8320688, -2.086212, 1, 1, 1, 1, 1,
-0.8686149, -0.5094123, -1.279137, 1, 1, 1, 1, 1,
-0.8669291, 1.020622, -2.006748, 1, 1, 1, 1, 1,
-0.8591439, 0.6107295, -0.7279562, 1, 1, 1, 1, 1,
-0.8551681, -0.1691741, -1.637076, 1, 1, 1, 1, 1,
-0.8531413, 1.492186, -0.4512319, 1, 1, 1, 1, 1,
-0.8491669, 1.317288, -0.2244583, 1, 1, 1, 1, 1,
-0.8487724, 0.3246152, -1.653607, 1, 1, 1, 1, 1,
-0.8428792, -0.04655218, -0.5289273, 1, 1, 1, 1, 1,
-0.8406979, 0.284346, -1.944965, 1, 1, 1, 1, 1,
-0.8404043, -1.065895, -1.880466, 1, 1, 1, 1, 1,
-0.8362514, 0.01195048, -0.6419541, 1, 1, 1, 1, 1,
-0.8340484, -0.9865519, -2.432493, 1, 1, 1, 1, 1,
-0.8303962, -0.4130679, -3.561329, 1, 1, 1, 1, 1,
-0.82301, 1.080469, -0.6356749, 1, 1, 1, 1, 1,
-0.8149962, 0.8276953, -0.8973135, 0, 0, 1, 1, 1,
-0.8130954, -1.045525, -2.52533, 1, 0, 0, 1, 1,
-0.8129032, -0.9307135, -0.3160413, 1, 0, 0, 1, 1,
-0.8111122, 0.5875705, -0.819176, 1, 0, 0, 1, 1,
-0.810096, 1.00179, -0.6742419, 1, 0, 0, 1, 1,
-0.8070965, 0.3188188, -1.558793, 1, 0, 0, 1, 1,
-0.8047954, 3.13262, -0.02284354, 0, 0, 0, 1, 1,
-0.8009585, -1.526945, -1.526181, 0, 0, 0, 1, 1,
-0.8001779, -0.1740092, -1.303569, 0, 0, 0, 1, 1,
-0.7983505, -0.5585095, -2.153463, 0, 0, 0, 1, 1,
-0.797272, -0.3332842, -2.571804, 0, 0, 0, 1, 1,
-0.7941264, 0.6600928, 0.5683407, 0, 0, 0, 1, 1,
-0.7938817, 0.316628, -1.416866, 0, 0, 0, 1, 1,
-0.7871452, -1.423053, -3.067131, 1, 1, 1, 1, 1,
-0.7821016, -0.5938376, -1.544387, 1, 1, 1, 1, 1,
-0.7807126, 1.730288, 0.5130844, 1, 1, 1, 1, 1,
-0.7799671, -1.651802, -1.387687, 1, 1, 1, 1, 1,
-0.7792777, 1.149793, -1.117107, 1, 1, 1, 1, 1,
-0.7787116, 1.263137, -0.1774662, 1, 1, 1, 1, 1,
-0.7719157, 1.775042, -0.557776, 1, 1, 1, 1, 1,
-0.7691048, -1.229876, -4.047185, 1, 1, 1, 1, 1,
-0.7684463, 0.8366165, -1.73355, 1, 1, 1, 1, 1,
-0.7630804, -0.1318621, -0.6298076, 1, 1, 1, 1, 1,
-0.7627686, -1.015964, -2.096004, 1, 1, 1, 1, 1,
-0.7621347, 1.186628, 0.5576853, 1, 1, 1, 1, 1,
-0.7582448, -0.5824842, -2.406727, 1, 1, 1, 1, 1,
-0.7559009, 1.919188, -1.482352, 1, 1, 1, 1, 1,
-0.7553445, -0.3175905, -0.857384, 1, 1, 1, 1, 1,
-0.751667, 0.9359289, -0.3364087, 0, 0, 1, 1, 1,
-0.7495351, 0.1314911, 0.588257, 1, 0, 0, 1, 1,
-0.7424185, 0.4377267, -1.089192, 1, 0, 0, 1, 1,
-0.7407548, 0.8663225, -0.4856586, 1, 0, 0, 1, 1,
-0.7389567, -0.1779917, -2.649534, 1, 0, 0, 1, 1,
-0.7365206, 1.907315, -1.003701, 1, 0, 0, 1, 1,
-0.7334442, -0.8145315, -1.489177, 0, 0, 0, 1, 1,
-0.7333448, -0.03841288, -0.4295616, 0, 0, 0, 1, 1,
-0.7308388, 0.5475266, 0.5181862, 0, 0, 0, 1, 1,
-0.7288102, -0.8940727, -2.70838, 0, 0, 0, 1, 1,
-0.7256498, 1.027564, -2.301873, 0, 0, 0, 1, 1,
-0.7254798, -0.2698472, -2.39673, 0, 0, 0, 1, 1,
-0.7172447, -1.342703, -3.578765, 0, 0, 0, 1, 1,
-0.7153005, 1.218407, -1.558563, 1, 1, 1, 1, 1,
-0.7145077, 0.398226, -1.8851, 1, 1, 1, 1, 1,
-0.7092279, 1.800414, -2.034568, 1, 1, 1, 1, 1,
-0.7026863, -0.4157043, -2.875926, 1, 1, 1, 1, 1,
-0.6956727, -1.236058, -2.532377, 1, 1, 1, 1, 1,
-0.695067, 0.1818876, -1.057303, 1, 1, 1, 1, 1,
-0.6941198, -0.21599, -3.073513, 1, 1, 1, 1, 1,
-0.6937032, -1.214192, -2.769939, 1, 1, 1, 1, 1,
-0.6934181, 0.2468835, -0.5862328, 1, 1, 1, 1, 1,
-0.6860123, -0.7824559, -1.995636, 1, 1, 1, 1, 1,
-0.6846825, -1.564936, -1.012146, 1, 1, 1, 1, 1,
-0.680757, -0.159443, -0.08013274, 1, 1, 1, 1, 1,
-0.6787438, -1.357314, -2.656725, 1, 1, 1, 1, 1,
-0.677804, -0.4742201, -2.849073, 1, 1, 1, 1, 1,
-0.6692633, -0.9837403, -3.159429, 1, 1, 1, 1, 1,
-0.6636166, -1.439584, -1.688131, 0, 0, 1, 1, 1,
-0.6601804, 0.4837267, 0.2727239, 1, 0, 0, 1, 1,
-0.6564891, -0.469208, -2.181053, 1, 0, 0, 1, 1,
-0.6512506, 0.7711465, 1.220273, 1, 0, 0, 1, 1,
-0.6490784, 0.9790319, 0.186712, 1, 0, 0, 1, 1,
-0.6445044, 0.441015, -1.395088, 1, 0, 0, 1, 1,
-0.6256763, 2.44442, -0.05337207, 0, 0, 0, 1, 1,
-0.6253836, 0.832321, -0.7434065, 0, 0, 0, 1, 1,
-0.6252961, -0.6782751, -2.364923, 0, 0, 0, 1, 1,
-0.6224651, -0.6731886, -2.601242, 0, 0, 0, 1, 1,
-0.6173611, 0.5402532, -1.461136, 0, 0, 0, 1, 1,
-0.616956, -0.1276493, -1.568542, 0, 0, 0, 1, 1,
-0.6131861, -2.20571, -4.247969, 0, 0, 0, 1, 1,
-0.6060128, 0.5558532, 0.2173727, 1, 1, 1, 1, 1,
-0.6018744, 0.9927722, 1.749495, 1, 1, 1, 1, 1,
-0.6003267, -1.077582, -1.887547, 1, 1, 1, 1, 1,
-0.5988556, -0.5297809, -2.890741, 1, 1, 1, 1, 1,
-0.5977755, 1.00336, 0.2118986, 1, 1, 1, 1, 1,
-0.5950499, -0.07490918, -1.541301, 1, 1, 1, 1, 1,
-0.5941144, -0.1629786, -3.57642, 1, 1, 1, 1, 1,
-0.5923759, 1.055028, 0.1806206, 1, 1, 1, 1, 1,
-0.5911944, -0.1670379, -2.813075, 1, 1, 1, 1, 1,
-0.591186, -0.4409283, -2.728561, 1, 1, 1, 1, 1,
-0.588412, 0.5342345, -2.761652, 1, 1, 1, 1, 1,
-0.5882648, 1.012127, -0.1549455, 1, 1, 1, 1, 1,
-0.5876773, 0.6511438, 0.3595034, 1, 1, 1, 1, 1,
-0.5869749, -1.353003, -3.352248, 1, 1, 1, 1, 1,
-0.586535, 0.6581514, -1.33379, 1, 1, 1, 1, 1,
-0.5843264, 0.8988136, -1.475513, 0, 0, 1, 1, 1,
-0.5823705, -0.04172487, 0.3069968, 1, 0, 0, 1, 1,
-0.5767968, -0.3680262, -2.653332, 1, 0, 0, 1, 1,
-0.57527, 0.122435, 0.1711966, 1, 0, 0, 1, 1,
-0.5719776, -0.9162769, -2.978604, 1, 0, 0, 1, 1,
-0.5686289, 0.6488806, -1.831994, 1, 0, 0, 1, 1,
-0.5664255, -0.3938933, -1.71189, 0, 0, 0, 1, 1,
-0.5586626, 0.4805681, -0.5510961, 0, 0, 0, 1, 1,
-0.5554335, 0.2399483, -1.331431, 0, 0, 0, 1, 1,
-0.5545643, -1.208091, -3.49677, 0, 0, 0, 1, 1,
-0.5513447, -0.2153155, -1.57021, 0, 0, 0, 1, 1,
-0.543497, -0.9153274, -0.6601498, 0, 0, 0, 1, 1,
-0.5420767, -1.261367, -3.966239, 0, 0, 0, 1, 1,
-0.5415885, 1.071205, 0.06003001, 1, 1, 1, 1, 1,
-0.5399451, 0.1554003, -1.086725, 1, 1, 1, 1, 1,
-0.5365216, 1.727965, -0.661595, 1, 1, 1, 1, 1,
-0.530487, -0.1467353, -0.2072029, 1, 1, 1, 1, 1,
-0.5300857, -0.9470921, -3.382075, 1, 1, 1, 1, 1,
-0.5286182, -0.4950013, -3.348675, 1, 1, 1, 1, 1,
-0.5277827, -2.795462, -3.559973, 1, 1, 1, 1, 1,
-0.5257633, 0.7068279, -0.3632253, 1, 1, 1, 1, 1,
-0.5235975, -1.508334, -3.668378, 1, 1, 1, 1, 1,
-0.5170894, -0.9929017, -2.038863, 1, 1, 1, 1, 1,
-0.5170874, 0.920335, -0.1466017, 1, 1, 1, 1, 1,
-0.5084031, 0.6769745, -1.248482, 1, 1, 1, 1, 1,
-0.5066614, -0.9744655, -3.932206, 1, 1, 1, 1, 1,
-0.5016336, -1.581821, -1.174854, 1, 1, 1, 1, 1,
-0.4997402, 0.3051801, -2.407812, 1, 1, 1, 1, 1,
-0.4946647, -0.03836733, -2.420373, 0, 0, 1, 1, 1,
-0.4928654, 0.5343458, 1.187474, 1, 0, 0, 1, 1,
-0.4899135, 0.7763227, -2.392073, 1, 0, 0, 1, 1,
-0.4822764, -0.1369109, -1.217235, 1, 0, 0, 1, 1,
-0.4793126, 0.1105276, -0.5523561, 1, 0, 0, 1, 1,
-0.4787444, -1.134821, -1.053572, 1, 0, 0, 1, 1,
-0.4785041, 0.001559811, 0.6281595, 0, 0, 0, 1, 1,
-0.4704003, 0.8264559, 0.4472767, 0, 0, 0, 1, 1,
-0.4700204, -0.03390715, -2.65222, 0, 0, 0, 1, 1,
-0.4631163, 0.6671322, -0.569306, 0, 0, 0, 1, 1,
-0.4614015, -0.324398, -2.593664, 0, 0, 0, 1, 1,
-0.459957, -2.128864, -3.168228, 0, 0, 0, 1, 1,
-0.4562248, 1.973922, -1.350918, 0, 0, 0, 1, 1,
-0.4511489, -1.074189, -1.719244, 1, 1, 1, 1, 1,
-0.4497504, -1.308617, -3.348071, 1, 1, 1, 1, 1,
-0.44974, 1.52888, -0.3784141, 1, 1, 1, 1, 1,
-0.448887, -1.984241, -2.339544, 1, 1, 1, 1, 1,
-0.4465209, 0.3434994, -0.6572009, 1, 1, 1, 1, 1,
-0.4457394, 0.8940529, -1.669954, 1, 1, 1, 1, 1,
-0.4442647, -0.1057129, -0.146185, 1, 1, 1, 1, 1,
-0.4423535, 0.2817062, -0.6589903, 1, 1, 1, 1, 1,
-0.4398685, -0.0463064, -3.118611, 1, 1, 1, 1, 1,
-0.4379966, -0.7324396, -2.505071, 1, 1, 1, 1, 1,
-0.4308201, 1.744753, -1.380313, 1, 1, 1, 1, 1,
-0.4307158, 0.1109723, -2.011999, 1, 1, 1, 1, 1,
-0.4299836, -0.2801125, -3.196999, 1, 1, 1, 1, 1,
-0.4283328, 0.5081894, 1.099677, 1, 1, 1, 1, 1,
-0.4172159, -0.1075657, -2.676541, 1, 1, 1, 1, 1,
-0.4124865, 0.7722408, 1.165293, 0, 0, 1, 1, 1,
-0.4086519, 0.5719544, -0.7802996, 1, 0, 0, 1, 1,
-0.3960128, -1.640679, -2.537757, 1, 0, 0, 1, 1,
-0.3955452, 0.244507, -0.8414301, 1, 0, 0, 1, 1,
-0.3935648, 1.198637, -0.3647968, 1, 0, 0, 1, 1,
-0.3906622, -1.415082, -2.093531, 1, 0, 0, 1, 1,
-0.3898302, 0.243225, 0.1269203, 0, 0, 0, 1, 1,
-0.3896697, 0.09626374, -2.28679, 0, 0, 0, 1, 1,
-0.3892234, -0.4410805, -2.915519, 0, 0, 0, 1, 1,
-0.389057, -0.03702008, -0.8609134, 0, 0, 0, 1, 1,
-0.3888307, 0.3172722, -0.3815406, 0, 0, 0, 1, 1,
-0.3864702, 0.6773878, 0.5146194, 0, 0, 0, 1, 1,
-0.3840598, -0.4332828, -1.842247, 0, 0, 0, 1, 1,
-0.3812833, -1.488273, -3.207001, 1, 1, 1, 1, 1,
-0.3797983, 0.2206996, -0.4790418, 1, 1, 1, 1, 1,
-0.3794636, -0.5270154, -0.3100784, 1, 1, 1, 1, 1,
-0.3768883, 0.1548794, -1.920038, 1, 1, 1, 1, 1,
-0.3752112, -0.7035177, -4.219627, 1, 1, 1, 1, 1,
-0.3735601, 0.9313275, -0.1628694, 1, 1, 1, 1, 1,
-0.3716497, -0.409976, -0.158154, 1, 1, 1, 1, 1,
-0.3671743, 1.615303, -0.1352419, 1, 1, 1, 1, 1,
-0.3652323, -0.02427858, -0.8978831, 1, 1, 1, 1, 1,
-0.364876, -0.852143, -3.994642, 1, 1, 1, 1, 1,
-0.3635367, -1.328968, -4.763943, 1, 1, 1, 1, 1,
-0.3596419, 2.19805, -1.843924, 1, 1, 1, 1, 1,
-0.3586019, 0.388934, -0.7659704, 1, 1, 1, 1, 1,
-0.3584029, -0.9786721, -3.0766, 1, 1, 1, 1, 1,
-0.3555466, -0.5655137, -2.261115, 1, 1, 1, 1, 1,
-0.3543099, 1.643106, -2.439465, 0, 0, 1, 1, 1,
-0.3508385, -1.764865, -4.50384, 1, 0, 0, 1, 1,
-0.3488977, -0.0844155, -3.017216, 1, 0, 0, 1, 1,
-0.3418031, -0.8684783, -3.232375, 1, 0, 0, 1, 1,
-0.3384387, -0.01608592, -1.104619, 1, 0, 0, 1, 1,
-0.3377461, -0.1860984, -1.552624, 1, 0, 0, 1, 1,
-0.3359768, -0.1438747, -1.304032, 0, 0, 0, 1, 1,
-0.332262, -0.7707191, -0.6654502, 0, 0, 0, 1, 1,
-0.3321886, 0.04771257, -1.54105, 0, 0, 0, 1, 1,
-0.331882, -0.6492881, -1.47857, 0, 0, 0, 1, 1,
-0.3313892, -0.2272307, -1.661058, 0, 0, 0, 1, 1,
-0.3305217, -0.6859602, -2.967598, 0, 0, 0, 1, 1,
-0.3302833, 0.1933175, -2.116359, 0, 0, 0, 1, 1,
-0.3253445, 0.8895042, -0.1340067, 1, 1, 1, 1, 1,
-0.3242664, -0.9137129, -3.792547, 1, 1, 1, 1, 1,
-0.3242404, 0.7713539, -3.649488, 1, 1, 1, 1, 1,
-0.3159887, -0.687977, -3.300811, 1, 1, 1, 1, 1,
-0.311362, -0.9061311, -2.949546, 1, 1, 1, 1, 1,
-0.3077764, -0.9854783, -2.207426, 1, 1, 1, 1, 1,
-0.304857, -0.8495991, -3.106645, 1, 1, 1, 1, 1,
-0.3024517, 1.284713, -0.9911332, 1, 1, 1, 1, 1,
-0.2983667, -0.0264955, -0.9654137, 1, 1, 1, 1, 1,
-0.2946997, 0.5173801, 0.9098254, 1, 1, 1, 1, 1,
-0.2884409, -0.8843877, -3.411185, 1, 1, 1, 1, 1,
-0.2877452, 1.746183, 1.259658, 1, 1, 1, 1, 1,
-0.2852984, -0.18666, -2.236841, 1, 1, 1, 1, 1,
-0.2842995, -0.0003835111, -0.283414, 1, 1, 1, 1, 1,
-0.2827522, -0.4743087, -3.189122, 1, 1, 1, 1, 1,
-0.2796052, -0.5584229, -4.401719, 0, 0, 1, 1, 1,
-0.2768717, -0.9200999, -3.749583, 1, 0, 0, 1, 1,
-0.268995, -0.548926, -3.445453, 1, 0, 0, 1, 1,
-0.2640665, -0.2390777, -2.798505, 1, 0, 0, 1, 1,
-0.2637476, 0.3581578, 0.8442761, 1, 0, 0, 1, 1,
-0.2631148, 0.2644997, 0.03971315, 1, 0, 0, 1, 1,
-0.263039, 0.4929585, 0.4952854, 0, 0, 0, 1, 1,
-0.254803, -0.7078989, -1.78703, 0, 0, 0, 1, 1,
-0.2531064, -0.796908, -3.716601, 0, 0, 0, 1, 1,
-0.2481349, 0.7574131, 0.1451421, 0, 0, 0, 1, 1,
-0.2422269, 0.4383387, -1.768696, 0, 0, 0, 1, 1,
-0.2415972, 0.8883638, 0.4374625, 0, 0, 0, 1, 1,
-0.2346527, -0.956677, -4.234991, 0, 0, 0, 1, 1,
-0.2331088, 0.3574469, -1.764, 1, 1, 1, 1, 1,
-0.231571, -1.832413, -3.010715, 1, 1, 1, 1, 1,
-0.2279368, -1.179299, -4.257028, 1, 1, 1, 1, 1,
-0.227415, -0.3829512, -2.559315, 1, 1, 1, 1, 1,
-0.22406, -0.3637657, -2.569273, 1, 1, 1, 1, 1,
-0.2229225, 0.7722937, -0.01016533, 1, 1, 1, 1, 1,
-0.2150122, -0.2225467, -1.803566, 1, 1, 1, 1, 1,
-0.2057069, -2.375495, -2.908299, 1, 1, 1, 1, 1,
-0.1953455, 0.2450917, -1.381143, 1, 1, 1, 1, 1,
-0.1930356, -1.126497, -2.420919, 1, 1, 1, 1, 1,
-0.1917499, -0.1068802, -2.745693, 1, 1, 1, 1, 1,
-0.188604, -0.729448, -3.620545, 1, 1, 1, 1, 1,
-0.186981, 1.286582, -1.582456, 1, 1, 1, 1, 1,
-0.1865985, 0.1725333, -1.102835, 1, 1, 1, 1, 1,
-0.1849268, 0.6444846, -1.481317, 1, 1, 1, 1, 1,
-0.183817, 0.8884575, -0.225246, 0, 0, 1, 1, 1,
-0.1805268, 0.4751903, -0.9105158, 1, 0, 0, 1, 1,
-0.1794108, -0.04619449, -2.246549, 1, 0, 0, 1, 1,
-0.1726268, 1.357861, -1.28595, 1, 0, 0, 1, 1,
-0.1713035, -0.9580284, -4.53664, 1, 0, 0, 1, 1,
-0.1704628, 1.412863, -0.9023378, 1, 0, 0, 1, 1,
-0.1696878, 1.141575, 0.4193971, 0, 0, 0, 1, 1,
-0.1655432, 0.1581976, -0.1155705, 0, 0, 0, 1, 1,
-0.1637101, 0.7280218, -0.9735641, 0, 0, 0, 1, 1,
-0.1628505, -1.248068, -2.835685, 0, 0, 0, 1, 1,
-0.1589341, 1.335339, 1.174852, 0, 0, 0, 1, 1,
-0.1563802, 1.136421, -0.9020606, 0, 0, 0, 1, 1,
-0.1510001, -0.452516, -3.091161, 0, 0, 0, 1, 1,
-0.1503816, 0.8300786, 0.08074453, 1, 1, 1, 1, 1,
-0.1478368, 0.630777, -0.4415453, 1, 1, 1, 1, 1,
-0.1444426, 0.9083828, -1.650437, 1, 1, 1, 1, 1,
-0.1432592, 0.7522689, -0.563958, 1, 1, 1, 1, 1,
-0.1403039, 0.2528922, -1.490898, 1, 1, 1, 1, 1,
-0.1363523, 1.412811, 0.8592021, 1, 1, 1, 1, 1,
-0.1341679, 0.4164298, -1.677868, 1, 1, 1, 1, 1,
-0.1328741, 0.1197332, -1.465946, 1, 1, 1, 1, 1,
-0.1299336, -0.4697814, -2.398336, 1, 1, 1, 1, 1,
-0.128471, -0.8079826, -4.494325, 1, 1, 1, 1, 1,
-0.1284538, -0.5025674, -3.35735, 1, 1, 1, 1, 1,
-0.1246881, 0.350556, 0.3040157, 1, 1, 1, 1, 1,
-0.1230396, 0.01338821, -0.4522255, 1, 1, 1, 1, 1,
-0.1226188, -0.8685308, -3.237155, 1, 1, 1, 1, 1,
-0.1056272, -0.1688319, -2.905544, 1, 1, 1, 1, 1,
-0.1024653, 0.10369, -1.666246, 0, 0, 1, 1, 1,
-0.1011369, -0.6338785, -2.916271, 1, 0, 0, 1, 1,
-0.09977052, -1.074041, -5.051435, 1, 0, 0, 1, 1,
-0.09920103, 0.1516513, 0.6361365, 1, 0, 0, 1, 1,
-0.09180213, 2.324483, -0.8866309, 1, 0, 0, 1, 1,
-0.08835293, 1.229048, 1.158928, 1, 0, 0, 1, 1,
-0.08659842, 0.6416553, -0.4754856, 0, 0, 0, 1, 1,
-0.08498405, 0.5183676, 0.2349525, 0, 0, 0, 1, 1,
-0.08434249, 0.873929, -0.1219781, 0, 0, 0, 1, 1,
-0.08339523, 1.614934, -0.1210195, 0, 0, 0, 1, 1,
-0.07863229, 0.5690051, -0.1887113, 0, 0, 0, 1, 1,
-0.07576811, -1.093207, -4.570159, 0, 0, 0, 1, 1,
-0.07411646, 0.8538023, 0.3083318, 0, 0, 0, 1, 1,
-0.06974035, -0.421519, -2.087844, 1, 1, 1, 1, 1,
-0.06848374, -0.1663686, -3.129111, 1, 1, 1, 1, 1,
-0.06729248, -1.45317, -3.665152, 1, 1, 1, 1, 1,
-0.06497215, -0.2586172, -1.64897, 1, 1, 1, 1, 1,
-0.06385372, 1.547482, 0.2411886, 1, 1, 1, 1, 1,
-0.05924357, -1.509648, -2.612184, 1, 1, 1, 1, 1,
-0.05590276, -2.190907, -1.921148, 1, 1, 1, 1, 1,
-0.05168757, 0.4815723, -0.7981433, 1, 1, 1, 1, 1,
-0.04910576, 0.5481001, -0.1257645, 1, 1, 1, 1, 1,
-0.04870092, 0.02638701, -0.9185641, 1, 1, 1, 1, 1,
-0.04593059, 0.6220368, 1.017257, 1, 1, 1, 1, 1,
-0.04457746, -1.001102, -0.9145139, 1, 1, 1, 1, 1,
-0.04442415, -0.1848365, -1.602918, 1, 1, 1, 1, 1,
-0.04240834, -0.246689, -2.433433, 1, 1, 1, 1, 1,
-0.0395649, -1.364935, -4.262162, 1, 1, 1, 1, 1,
-0.03795091, 0.142973, -1.538756, 0, 0, 1, 1, 1,
-0.03571251, 0.2367295, -0.8089417, 1, 0, 0, 1, 1,
-0.03474878, -0.3931929, -0.7216752, 1, 0, 0, 1, 1,
-0.02995276, 0.8413526, 1.130245, 1, 0, 0, 1, 1,
-0.0282625, -2.071441, -1.382104, 1, 0, 0, 1, 1,
-0.02756956, 0.07043489, 0.1256986, 1, 0, 0, 1, 1,
-0.02673187, 0.2972488, -2.251906, 0, 0, 0, 1, 1,
-0.02646378, -0.3888662, -2.229304, 0, 0, 0, 1, 1,
-0.02359809, 0.03219305, 0.1593203, 0, 0, 0, 1, 1,
-0.02320031, 0.8946468, -0.3322878, 0, 0, 0, 1, 1,
-0.02200222, 1.306032, 0.7445626, 0, 0, 0, 1, 1,
-0.02182797, 0.09354901, 0.9923084, 0, 0, 0, 1, 1,
-0.0154851, -0.8814384, -2.608545, 0, 0, 0, 1, 1,
-0.0147684, -0.1318794, -2.246967, 1, 1, 1, 1, 1,
-0.007125557, 0.006055953, -0.3388926, 1, 1, 1, 1, 1,
-0.003760383, 0.3852563, -0.3548579, 1, 1, 1, 1, 1,
-0.001862223, -0.09818104, -4.553965, 1, 1, 1, 1, 1,
0.008997658, 0.1867712, 2.437138, 1, 1, 1, 1, 1,
0.01382798, 1.022027, 0.7380967, 1, 1, 1, 1, 1,
0.01444241, 0.6963411, 0.1719979, 1, 1, 1, 1, 1,
0.01600406, -2.022317, 4.597841, 1, 1, 1, 1, 1,
0.01797667, -0.3594636, 3.663495, 1, 1, 1, 1, 1,
0.02786192, 1.199754, -0.7178766, 1, 1, 1, 1, 1,
0.03161437, -0.004962584, 1.303628, 1, 1, 1, 1, 1,
0.03169359, 0.7995998, -1.368484, 1, 1, 1, 1, 1,
0.03251003, 1.452305, -0.2720902, 1, 1, 1, 1, 1,
0.03554337, 1.040713, 1.527507, 1, 1, 1, 1, 1,
0.03613231, 3.074322, 0.3462667, 1, 1, 1, 1, 1,
0.03639062, -1.9949, 2.223436, 0, 0, 1, 1, 1,
0.04065562, -1.34473, 3.323141, 1, 0, 0, 1, 1,
0.04355275, 0.3089278, -0.004369784, 1, 0, 0, 1, 1,
0.04543256, -1.061949, 3.851321, 1, 0, 0, 1, 1,
0.04550004, 0.7806684, -1.010799, 1, 0, 0, 1, 1,
0.04832596, -0.7441499, 2.773574, 1, 0, 0, 1, 1,
0.05057732, 1.25852, -0.8420869, 0, 0, 0, 1, 1,
0.0534688, -0.2280249, 4.053681, 0, 0, 0, 1, 1,
0.06358943, -1.672283, 3.825576, 0, 0, 0, 1, 1,
0.06586166, 0.7313201, -0.46964, 0, 0, 0, 1, 1,
0.06934958, -0.5136604, 1.836068, 0, 0, 0, 1, 1,
0.07139951, 1.288497, 0.530474, 0, 0, 0, 1, 1,
0.07574783, 0.5079617, 0.2235989, 0, 0, 0, 1, 1,
0.07666522, -0.8413941, 1.32831, 1, 1, 1, 1, 1,
0.0818601, 0.1583414, 0.724309, 1, 1, 1, 1, 1,
0.08371129, 0.3474592, 2.528187, 1, 1, 1, 1, 1,
0.09366165, -1.853027, 2.435781, 1, 1, 1, 1, 1,
0.1067782, -1.46792, 4.936486, 1, 1, 1, 1, 1,
0.1099766, 0.703738, 0.02539204, 1, 1, 1, 1, 1,
0.1108191, 0.6844274, 1.511907, 1, 1, 1, 1, 1,
0.1118946, 1.17093, -1.238141, 1, 1, 1, 1, 1,
0.1120869, 2.09124, -0.1837767, 1, 1, 1, 1, 1,
0.1133866, 0.9187075, 1.415553, 1, 1, 1, 1, 1,
0.1154651, 0.1653177, 1.139784, 1, 1, 1, 1, 1,
0.1156803, 0.3269671, 0.9618767, 1, 1, 1, 1, 1,
0.1233584, 0.007489204, 1.561449, 1, 1, 1, 1, 1,
0.1240024, -0.6440884, 2.043078, 1, 1, 1, 1, 1,
0.1275216, 0.6248468, 1.719529, 1, 1, 1, 1, 1,
0.1338979, -0.16462, 3.114825, 0, 0, 1, 1, 1,
0.1359971, 0.08742295, 2.041269, 1, 0, 0, 1, 1,
0.139017, 0.7214257, 1.116263, 1, 0, 0, 1, 1,
0.1392239, -1.347702, 1.585369, 1, 0, 0, 1, 1,
0.1422339, -0.93136, 3.006209, 1, 0, 0, 1, 1,
0.1458133, 0.2106455, -0.593145, 1, 0, 0, 1, 1,
0.14721, 1.597542, 0.3973503, 0, 0, 0, 1, 1,
0.1486439, 1.397612, 0.3805647, 0, 0, 0, 1, 1,
0.1492639, -2.253374, 3.095041, 0, 0, 0, 1, 1,
0.1533721, 1.433633, 2.33189, 0, 0, 0, 1, 1,
0.1542304, -0.5053906, 0.6460083, 0, 0, 0, 1, 1,
0.1552598, -0.003817196, 1.36628, 0, 0, 0, 1, 1,
0.1621203, 1.292115, -0.03624053, 0, 0, 0, 1, 1,
0.1630322, 1.035082, 1.130364, 1, 1, 1, 1, 1,
0.1633334, -1.481717, 4.19586, 1, 1, 1, 1, 1,
0.1643519, 1.121096, -0.3833808, 1, 1, 1, 1, 1,
0.165881, -1.828801, 3.324493, 1, 1, 1, 1, 1,
0.1680649, -1.169628, 3.743085, 1, 1, 1, 1, 1,
0.1702832, -0.9236724, 3.376537, 1, 1, 1, 1, 1,
0.1718162, 0.180464, 1.096652, 1, 1, 1, 1, 1,
0.176192, 0.3622278, 0.4632622, 1, 1, 1, 1, 1,
0.1778012, 0.1149885, 1.490996, 1, 1, 1, 1, 1,
0.1787835, -0.5637136, 1.240148, 1, 1, 1, 1, 1,
0.1819301, -0.3262051, 2.296814, 1, 1, 1, 1, 1,
0.1886326, -1.925172, 4.17407, 1, 1, 1, 1, 1,
0.1909218, 1.269244, 1.605028, 1, 1, 1, 1, 1,
0.1928628, 0.9409731, 0.1027616, 1, 1, 1, 1, 1,
0.1969823, 0.6259027, -0.5163234, 1, 1, 1, 1, 1,
0.1976579, 0.3942986, 0.6204205, 0, 0, 1, 1, 1,
0.2061321, 1.806561, 0.3767786, 1, 0, 0, 1, 1,
0.2061507, -0.04057525, 1.77849, 1, 0, 0, 1, 1,
0.2127517, 1.393619, -1.36804, 1, 0, 0, 1, 1,
0.2156714, -0.931967, 2.441655, 1, 0, 0, 1, 1,
0.2180408, -1.254714, 3.619107, 1, 0, 0, 1, 1,
0.219503, 0.3567899, -0.6223664, 0, 0, 0, 1, 1,
0.2302506, -0.8564022, 3.211515, 0, 0, 0, 1, 1,
0.2309211, 0.5237969, 1.181825, 0, 0, 0, 1, 1,
0.2328199, -1.484887, 3.070264, 0, 0, 0, 1, 1,
0.2343501, 1.380297, 1.93459, 0, 0, 0, 1, 1,
0.2417403, 0.4346943, 0.9523014, 0, 0, 0, 1, 1,
0.2461027, 0.1029579, 1.368509, 0, 0, 0, 1, 1,
0.2467368, 0.872422, 1.005448, 1, 1, 1, 1, 1,
0.2479362, -0.08973533, 2.019606, 1, 1, 1, 1, 1,
0.2504981, -1.008495, 3.204885, 1, 1, 1, 1, 1,
0.2507593, -0.4589423, 3.732085, 1, 1, 1, 1, 1,
0.2508121, -0.6228834, 2.773005, 1, 1, 1, 1, 1,
0.2603011, -1.103612, 2.746483, 1, 1, 1, 1, 1,
0.262896, 1.756996, 0.5181314, 1, 1, 1, 1, 1,
0.2647229, -1.536402, 4.659025, 1, 1, 1, 1, 1,
0.2659513, -2.186157, 3.257784, 1, 1, 1, 1, 1,
0.2678036, -1.20253, 3.805137, 1, 1, 1, 1, 1,
0.2738189, -1.083034, 2.322121, 1, 1, 1, 1, 1,
0.2765709, 0.03559652, -0.4079346, 1, 1, 1, 1, 1,
0.2771416, 0.6714947, -0.2939, 1, 1, 1, 1, 1,
0.2804959, 0.0851004, 0.8148807, 1, 1, 1, 1, 1,
0.2828055, 2.202384, -0.3451161, 1, 1, 1, 1, 1,
0.2846334, -0.01271186, 2.701905, 0, 0, 1, 1, 1,
0.2865547, 0.08547877, -0.415327, 1, 0, 0, 1, 1,
0.2916363, 0.6954358, 0.8448727, 1, 0, 0, 1, 1,
0.2939821, -1.365282, 1.993249, 1, 0, 0, 1, 1,
0.2940378, 1.516745, 0.5374176, 1, 0, 0, 1, 1,
0.2945037, 0.3542234, -0.5216509, 1, 0, 0, 1, 1,
0.2946097, 1.850199, 0.09454561, 0, 0, 0, 1, 1,
0.2957101, -0.1588483, 2.048416, 0, 0, 0, 1, 1,
0.3019921, -1.076293, 1.466787, 0, 0, 0, 1, 1,
0.3033086, -0.6508916, 3.640079, 0, 0, 0, 1, 1,
0.3095175, -0.4827604, 1.934463, 0, 0, 0, 1, 1,
0.311386, 0.9454093, 0.4819248, 0, 0, 0, 1, 1,
0.3163674, 1.815436, -0.2948495, 0, 0, 0, 1, 1,
0.3178907, -0.7431123, 3.018639, 1, 1, 1, 1, 1,
0.3200681, -0.2268291, 1.203977, 1, 1, 1, 1, 1,
0.3269502, -0.4354683, 3.351617, 1, 1, 1, 1, 1,
0.3280131, 1.955375, -0.2981783, 1, 1, 1, 1, 1,
0.3287748, -0.3080048, 2.321505, 1, 1, 1, 1, 1,
0.3306838, 0.925514, -0.09578493, 1, 1, 1, 1, 1,
0.3315641, 0.8836967, -1.150449, 1, 1, 1, 1, 1,
0.33267, -0.3612235, 1.907346, 1, 1, 1, 1, 1,
0.334884, -2.129225, 3.438669, 1, 1, 1, 1, 1,
0.3349446, -1.407111, 1.751796, 1, 1, 1, 1, 1,
0.3356116, -0.3389223, 2.3113, 1, 1, 1, 1, 1,
0.3371134, 0.1573462, 2.508714, 1, 1, 1, 1, 1,
0.3393524, -1.436179, 2.670545, 1, 1, 1, 1, 1,
0.3394182, 0.2934014, 1.090745, 1, 1, 1, 1, 1,
0.3431089, 0.3831134, 2.687991, 1, 1, 1, 1, 1,
0.3457589, -0.08649493, -0.3504622, 0, 0, 1, 1, 1,
0.346152, 0.8630077, 0.1117892, 1, 0, 0, 1, 1,
0.3485781, 2.137618, 2.461264, 1, 0, 0, 1, 1,
0.348882, 2.038336, -0.45085, 1, 0, 0, 1, 1,
0.3504386, -1.235187, 4.207733, 1, 0, 0, 1, 1,
0.3563351, -2.39887, 2.287983, 1, 0, 0, 1, 1,
0.358369, 0.06088941, 0.02062578, 0, 0, 0, 1, 1,
0.3622122, 0.3847861, -0.3150742, 0, 0, 0, 1, 1,
0.3643076, 0.4652082, -0.412748, 0, 0, 0, 1, 1,
0.3661941, 0.9024166, -0.9188949, 0, 0, 0, 1, 1,
0.3678573, 0.1700456, 0.5850063, 0, 0, 0, 1, 1,
0.3714063, -0.9513387, 1.910531, 0, 0, 0, 1, 1,
0.3822165, -1.09969, 2.915482, 0, 0, 0, 1, 1,
0.3829153, 0.003323537, 2.737089, 1, 1, 1, 1, 1,
0.3836607, 2.552675, -0.9411023, 1, 1, 1, 1, 1,
0.3903073, 0.3366664, 1.301905, 1, 1, 1, 1, 1,
0.3925208, -0.2104468, 2.890188, 1, 1, 1, 1, 1,
0.393621, 0.9186183, -0.1441658, 1, 1, 1, 1, 1,
0.3942574, -0.877256, 1.196814, 1, 1, 1, 1, 1,
0.3972618, 1.624742, 1.463903, 1, 1, 1, 1, 1,
0.3984014, -0.6742523, 2.253021, 1, 1, 1, 1, 1,
0.4002842, 0.1639021, 2.495421, 1, 1, 1, 1, 1,
0.4014955, 1.257705, 0.7514206, 1, 1, 1, 1, 1,
0.4035542, -0.1438674, 4.048644, 1, 1, 1, 1, 1,
0.4092446, 0.5618773, 0.1605452, 1, 1, 1, 1, 1,
0.4134457, -2.021774, 4.294893, 1, 1, 1, 1, 1,
0.413768, -1.147158, 4.017179, 1, 1, 1, 1, 1,
0.4151909, 0.3766332, 2.990273, 1, 1, 1, 1, 1,
0.4178426, -1.29714, 2.074707, 0, 0, 1, 1, 1,
0.4277673, 0.7487103, 1.165624, 1, 0, 0, 1, 1,
0.4286722, 0.4392326, 1.189768, 1, 0, 0, 1, 1,
0.4311146, 1.410325, -0.9167601, 1, 0, 0, 1, 1,
0.4334774, -1.032174, 2.417318, 1, 0, 0, 1, 1,
0.441583, 1.568361, 0.9079698, 1, 0, 0, 1, 1,
0.442882, -0.7977207, 3.329702, 0, 0, 0, 1, 1,
0.4455469, 0.7546678, 1.43277, 0, 0, 0, 1, 1,
0.4461371, 0.2951562, 2.56829, 0, 0, 0, 1, 1,
0.448333, -1.355654, 4.103756, 0, 0, 0, 1, 1,
0.4495659, -0.58222, 4.964501, 0, 0, 0, 1, 1,
0.4586149, 0.6442046, 0.6909191, 0, 0, 0, 1, 1,
0.4651815, 0.08829264, 0.1896288, 0, 0, 0, 1, 1,
0.4690728, -0.5126323, 0.8152258, 1, 1, 1, 1, 1,
0.4733329, 0.1168523, 1.479633, 1, 1, 1, 1, 1,
0.4789122, -0.6000087, 1.923653, 1, 1, 1, 1, 1,
0.4802909, 0.329168, 1.184422, 1, 1, 1, 1, 1,
0.4838313, -0.2080554, 1.62275, 1, 1, 1, 1, 1,
0.4905745, 1.83062, -0.4113594, 1, 1, 1, 1, 1,
0.5112229, -0.3475152, 2.006387, 1, 1, 1, 1, 1,
0.5124308, -0.09754235, 1.708775, 1, 1, 1, 1, 1,
0.5142226, 0.05241249, 2.43755, 1, 1, 1, 1, 1,
0.5147249, 0.4678968, -0.1865872, 1, 1, 1, 1, 1,
0.5186115, -0.7610551, 1.916692, 1, 1, 1, 1, 1,
0.5202526, -0.6237087, 3.82529, 1, 1, 1, 1, 1,
0.5223615, 0.4500288, 2.376341, 1, 1, 1, 1, 1,
0.5256409, -1.505187, 2.094948, 1, 1, 1, 1, 1,
0.5320854, -0.4680224, 1.826614, 1, 1, 1, 1, 1,
0.5329753, 0.2802114, 0.2470147, 0, 0, 1, 1, 1,
0.5343344, 1.351478, -0.01984431, 1, 0, 0, 1, 1,
0.5347075, 0.2269046, -0.3154266, 1, 0, 0, 1, 1,
0.5347327, -0.02308356, 1.967291, 1, 0, 0, 1, 1,
0.5349876, 2.041655, -0.9586065, 1, 0, 0, 1, 1,
0.5423873, 1.834694, 2.630855, 1, 0, 0, 1, 1,
0.5450503, 3.334006, 0.6996739, 0, 0, 0, 1, 1,
0.5451695, 0.3179804, 0.6959893, 0, 0, 0, 1, 1,
0.5455969, -1.318854, 3.678536, 0, 0, 0, 1, 1,
0.5533395, 0.4041239, 0.1536205, 0, 0, 0, 1, 1,
0.5598838, -0.333198, 3.052218, 0, 0, 0, 1, 1,
0.5620255, 1.024937, -0.1755682, 0, 0, 0, 1, 1,
0.5630181, -0.7199261, 3.955528, 0, 0, 0, 1, 1,
0.5659978, -2.150988, 1.888192, 1, 1, 1, 1, 1,
0.5661464, 0.7298269, -1.954763, 1, 1, 1, 1, 1,
0.5674077, 0.1361154, 1.338613, 1, 1, 1, 1, 1,
0.5689797, 1.36981, 1.41276, 1, 1, 1, 1, 1,
0.5733766, 0.8036152, 0.6201314, 1, 1, 1, 1, 1,
0.575705, -1.16254, 2.814678, 1, 1, 1, 1, 1,
0.5783784, -0.1752044, 0.7427385, 1, 1, 1, 1, 1,
0.5817115, 0.2753201, 3.398613, 1, 1, 1, 1, 1,
0.5893344, -1.841563, 3.583618, 1, 1, 1, 1, 1,
0.5916761, 1.850946, 0.5854743, 1, 1, 1, 1, 1,
0.5991699, -0.9554595, 2.066561, 1, 1, 1, 1, 1,
0.6005064, -0.8373939, 2.503017, 1, 1, 1, 1, 1,
0.6009328, 0.1137479, 2.59748, 1, 1, 1, 1, 1,
0.602062, -0.38532, 2.415802, 1, 1, 1, 1, 1,
0.6165305, -0.4466428, 3.413645, 1, 1, 1, 1, 1,
0.6172022, -0.3045342, 2.128036, 0, 0, 1, 1, 1,
0.6173772, -0.2437116, 2.21157, 1, 0, 0, 1, 1,
0.6174009, 1.297603, 0.3343352, 1, 0, 0, 1, 1,
0.620019, -1.222094, 3.636285, 1, 0, 0, 1, 1,
0.6232228, 0.05555101, 0.167235, 1, 0, 0, 1, 1,
0.6232234, -1.138648, 2.561604, 1, 0, 0, 1, 1,
0.6267526, -0.9546778, 2.983156, 0, 0, 0, 1, 1,
0.6281495, 0.6385369, 2.280653, 0, 0, 0, 1, 1,
0.6326485, 0.02247415, 0.4620984, 0, 0, 0, 1, 1,
0.633152, -0.3077291, 1.957728, 0, 0, 0, 1, 1,
0.633288, 1.083018, 1.003858, 0, 0, 0, 1, 1,
0.6333495, 1.920903, 0.2569742, 0, 0, 0, 1, 1,
0.6334925, 0.5009794, -0.5659608, 0, 0, 0, 1, 1,
0.6378021, 1.574615, 1.472087, 1, 1, 1, 1, 1,
0.6393148, -1.574057, 2.806207, 1, 1, 1, 1, 1,
0.6439588, -0.7066008, 3.462006, 1, 1, 1, 1, 1,
0.6482859, -0.6252764, 3.637669, 1, 1, 1, 1, 1,
0.6498551, 0.3572063, 0.2817973, 1, 1, 1, 1, 1,
0.6521623, -0.6623496, 3.391644, 1, 1, 1, 1, 1,
0.652366, 0.6383588, 0.2347786, 1, 1, 1, 1, 1,
0.6524075, -1.14498, 3.175701, 1, 1, 1, 1, 1,
0.6541381, -0.6194901, 2.595846, 1, 1, 1, 1, 1,
0.6582763, -0.5844679, 3.415715, 1, 1, 1, 1, 1,
0.6588771, -1.721287, 3.639245, 1, 1, 1, 1, 1,
0.6602994, -0.4492853, 2.934078, 1, 1, 1, 1, 1,
0.6607624, -1.614644, 3.832587, 1, 1, 1, 1, 1,
0.6610389, -0.6946766, 1.32794, 1, 1, 1, 1, 1,
0.6641982, -0.1932569, 2.574627, 1, 1, 1, 1, 1,
0.6646939, -0.6126385, 1.232915, 0, 0, 1, 1, 1,
0.6682674, -0.08087788, 0.7079349, 1, 0, 0, 1, 1,
0.6712089, -0.9435313, 3.750019, 1, 0, 0, 1, 1,
0.6722489, 0.2170195, 1.29279, 1, 0, 0, 1, 1,
0.6750065, -0.758918, 1.6972, 1, 0, 0, 1, 1,
0.6812418, -0.2295305, 1.950527, 1, 0, 0, 1, 1,
0.6826889, -1.018272, 1.592487, 0, 0, 0, 1, 1,
0.694992, 0.3125419, 0.8194624, 0, 0, 0, 1, 1,
0.6957175, 0.2440824, 0.6785817, 0, 0, 0, 1, 1,
0.6958227, -0.3897218, 2.714143, 0, 0, 0, 1, 1,
0.7075529, -0.0363245, 3.50005, 0, 0, 0, 1, 1,
0.7085248, 1.050836, 0.1918915, 0, 0, 0, 1, 1,
0.7102331, 0.01557042, 2.064675, 0, 0, 0, 1, 1,
0.7212084, -0.9523559, 3.120418, 1, 1, 1, 1, 1,
0.7228044, -0.194774, 1.932235, 1, 1, 1, 1, 1,
0.7265145, 0.2735151, 1.05861, 1, 1, 1, 1, 1,
0.7304756, 1.219763, 0.8053955, 1, 1, 1, 1, 1,
0.7369559, 0.6857971, 1.756828, 1, 1, 1, 1, 1,
0.7395768, -0.6754591, 2.463303, 1, 1, 1, 1, 1,
0.7421234, -1.049842, 4.066467, 1, 1, 1, 1, 1,
0.7442935, -0.5331547, 2.662237, 1, 1, 1, 1, 1,
0.7450871, 0.2852453, 0.2076161, 1, 1, 1, 1, 1,
0.7550063, -0.1573959, 1.768935, 1, 1, 1, 1, 1,
0.75502, 0.3174776, 0.149401, 1, 1, 1, 1, 1,
0.7552988, -0.07477185, 1.932782, 1, 1, 1, 1, 1,
0.7648929, 1.65864, 0.7031833, 1, 1, 1, 1, 1,
0.765241, -0.9484218, 3.126672, 1, 1, 1, 1, 1,
0.7658908, 1.19126, 0.7420406, 1, 1, 1, 1, 1,
0.7665119, -0.7335352, 1.499334, 0, 0, 1, 1, 1,
0.7711626, -0.4302892, 2.984543, 1, 0, 0, 1, 1,
0.7843033, 1.292009, 0.0619481, 1, 0, 0, 1, 1,
0.7859492, -0.9953082, 1.109142, 1, 0, 0, 1, 1,
0.7899646, -0.2303505, 2.273624, 1, 0, 0, 1, 1,
0.7928993, 0.3486365, 0.6167001, 1, 0, 0, 1, 1,
0.7961949, -1.339406, 2.27219, 0, 0, 0, 1, 1,
0.7976798, 0.5251583, 0.4407083, 0, 0, 0, 1, 1,
0.7998809, -1.482621, 3.621542, 0, 0, 0, 1, 1,
0.8041468, -0.7572151, 0.9445752, 0, 0, 0, 1, 1,
0.8076972, -0.04138253, 0.1217814, 0, 0, 0, 1, 1,
0.8088275, 0.7026873, 0.8078238, 0, 0, 0, 1, 1,
0.8094594, -2.816602, 2.443021, 0, 0, 0, 1, 1,
0.8099989, 0.22006, 2.785027, 1, 1, 1, 1, 1,
0.8107808, 1.21375, 2.167623, 1, 1, 1, 1, 1,
0.8111812, -2.297772, 3.230909, 1, 1, 1, 1, 1,
0.8132135, -1.012996, 2.288194, 1, 1, 1, 1, 1,
0.8132577, -0.7475256, 2.333011, 1, 1, 1, 1, 1,
0.8204241, -0.9567385, 2.38853, 1, 1, 1, 1, 1,
0.8383785, 0.6653033, -0.2411257, 1, 1, 1, 1, 1,
0.8385699, -0.5733165, 0.1346253, 1, 1, 1, 1, 1,
0.8392096, 0.7601454, 1.226291, 1, 1, 1, 1, 1,
0.8405144, -0.1406877, 2.396598, 1, 1, 1, 1, 1,
0.8466548, 2.006697, 0.7868436, 1, 1, 1, 1, 1,
0.8495553, -1.909546, 4.14196, 1, 1, 1, 1, 1,
0.8517187, 1.205186, -0.2946347, 1, 1, 1, 1, 1,
0.8543671, -1.352459, 2.995928, 1, 1, 1, 1, 1,
0.8550742, 1.481323, 3.485148, 1, 1, 1, 1, 1,
0.8608215, 2.417085, 0.599715, 0, 0, 1, 1, 1,
0.8647947, -0.751047, 0.5631506, 1, 0, 0, 1, 1,
0.8681013, -1.410164, 3.093469, 1, 0, 0, 1, 1,
0.8693827, 0.4440898, 2.351102, 1, 0, 0, 1, 1,
0.8711641, -0.1310295, 1.358449, 1, 0, 0, 1, 1,
0.8713791, -0.8510933, 2.697882, 1, 0, 0, 1, 1,
0.8731583, -0.6607964, 1.322167, 0, 0, 0, 1, 1,
0.8777838, 2.773307, 0.9674749, 0, 0, 0, 1, 1,
0.8803309, -0.9705964, 2.318734, 0, 0, 0, 1, 1,
0.8812091, -0.6965948, 0.1417374, 0, 0, 0, 1, 1,
0.8836433, 1.913174, 0.2485384, 0, 0, 0, 1, 1,
0.888129, 0.3559303, -0.6576942, 0, 0, 0, 1, 1,
0.8892519, 0.4651738, 2.331408, 0, 0, 0, 1, 1,
0.8900996, 0.6674534, 0.4732946, 1, 1, 1, 1, 1,
0.8990886, 0.6204401, 0.1005038, 1, 1, 1, 1, 1,
0.9016249, -0.2815059, 3.057597, 1, 1, 1, 1, 1,
0.9046455, 0.5479114, 1.260338, 1, 1, 1, 1, 1,
0.9064528, 0.4276896, 0.8314332, 1, 1, 1, 1, 1,
0.9079643, -0.8544303, 1.263969, 1, 1, 1, 1, 1,
0.9121808, -0.1597867, 1.525267, 1, 1, 1, 1, 1,
0.9167162, -0.4615235, 2.762728, 1, 1, 1, 1, 1,
0.9179315, -0.4208702, 1.386002, 1, 1, 1, 1, 1,
0.9276032, -1.653825, 2.684913, 1, 1, 1, 1, 1,
0.9283295, -1.070016, 1.808313, 1, 1, 1, 1, 1,
0.9305402, -1.67347, 0.8320968, 1, 1, 1, 1, 1,
0.9328849, -0.5617484, 3.58098, 1, 1, 1, 1, 1,
0.9345295, 1.233954, -1.504757, 1, 1, 1, 1, 1,
0.9394081, -0.1580438, 0.9428825, 1, 1, 1, 1, 1,
0.9418839, -1.706969, 3.472958, 0, 0, 1, 1, 1,
0.9440828, 0.1303477, 2.616889, 1, 0, 0, 1, 1,
0.9467391, -0.9633847, 2.618171, 1, 0, 0, 1, 1,
0.9519335, 0.6274992, -0.8280956, 1, 0, 0, 1, 1,
0.9535642, -1.815411, 2.699787, 1, 0, 0, 1, 1,
0.9548657, -0.727261, 1.589793, 1, 0, 0, 1, 1,
0.9581202, -0.5965564, 0.2382359, 0, 0, 0, 1, 1,
0.9584805, -0.035776, 0.7582981, 0, 0, 0, 1, 1,
0.9629992, -0.4185821, 3.517251, 0, 0, 0, 1, 1,
0.9643594, 1.163917, 2.139804, 0, 0, 0, 1, 1,
0.9703947, 1.573401, 0.256889, 0, 0, 0, 1, 1,
0.9743946, -0.7646201, 3.730937, 0, 0, 0, 1, 1,
0.9759211, 1.023161, -0.6697867, 0, 0, 0, 1, 1,
0.9770752, 0.5526422, 1.154576, 1, 1, 1, 1, 1,
0.9778718, 0.8614759, 0.2965732, 1, 1, 1, 1, 1,
0.9814922, 1.433494, -0.1787479, 1, 1, 1, 1, 1,
0.9838551, -0.9520229, 2.321276, 1, 1, 1, 1, 1,
0.9886322, 0.8358041, 0.3106008, 1, 1, 1, 1, 1,
0.9913198, -0.3101583, 0.3052425, 1, 1, 1, 1, 1,
0.9924098, 1.000976, 3.152092, 1, 1, 1, 1, 1,
0.9945298, -1.454748, 3.433964, 1, 1, 1, 1, 1,
0.9983388, -0.7596348, 2.614, 1, 1, 1, 1, 1,
1.005627, 0.5495859, 2.474626, 1, 1, 1, 1, 1,
1.008684, 0.1928054, 0.3666045, 1, 1, 1, 1, 1,
1.00938, 0.6480702, 0.1666932, 1, 1, 1, 1, 1,
1.014581, -2.382626, 2.822731, 1, 1, 1, 1, 1,
1.014807, 0.2660291, 2.285408, 1, 1, 1, 1, 1,
1.0202, -0.3653899, 2.788502, 1, 1, 1, 1, 1,
1.02196, 0.8273993, 1.602676, 0, 0, 1, 1, 1,
1.025063, 0.1765106, 1.171303, 1, 0, 0, 1, 1,
1.030898, 0.9206924, 0.08743092, 1, 0, 0, 1, 1,
1.058778, 0.3299898, -0.1891318, 1, 0, 0, 1, 1,
1.060869, -0.2361037, 0.8394367, 1, 0, 0, 1, 1,
1.066095, -0.2565423, 0.910638, 1, 0, 0, 1, 1,
1.069651, -1.284002, 1.991851, 0, 0, 0, 1, 1,
1.095815, 1.538668, 2.45768, 0, 0, 0, 1, 1,
1.096008, -0.3365552, 2.83053, 0, 0, 0, 1, 1,
1.099305, 1.352756, 1.075147, 0, 0, 0, 1, 1,
1.10481, 0.4851331, -0.8369361, 0, 0, 0, 1, 1,
1.108532, 0.651955, 1.525298, 0, 0, 0, 1, 1,
1.113829, 0.3534902, 2.150966, 0, 0, 0, 1, 1,
1.114951, 0.2105813, 2.182635, 1, 1, 1, 1, 1,
1.117834, -0.2190195, 2.149544, 1, 1, 1, 1, 1,
1.120647, 0.8316806, 0.2371019, 1, 1, 1, 1, 1,
1.123544, -1.610678, 2.976795, 1, 1, 1, 1, 1,
1.1245, -0.7133654, 2.516364, 1, 1, 1, 1, 1,
1.124524, 0.9373398, 0.067078, 1, 1, 1, 1, 1,
1.130729, -0.730705, 1.620929, 1, 1, 1, 1, 1,
1.131244, 0.2866944, 1.706859, 1, 1, 1, 1, 1,
1.135581, 1.425986, 2.135143, 1, 1, 1, 1, 1,
1.141622, 1.351761, 1.042595, 1, 1, 1, 1, 1,
1.143236, -0.05783878, 1.885971, 1, 1, 1, 1, 1,
1.143269, -0.1557651, 0.7984481, 1, 1, 1, 1, 1,
1.146057, 0.3143836, 0.8696922, 1, 1, 1, 1, 1,
1.155777, -0.2788365, 2.649016, 1, 1, 1, 1, 1,
1.163302, -0.9230619, 1.558497, 1, 1, 1, 1, 1,
1.167726, 0.7976204, 2.02222, 0, 0, 1, 1, 1,
1.176128, 0.02686819, -0.3797566, 1, 0, 0, 1, 1,
1.177553, -0.5792543, 1.804344, 1, 0, 0, 1, 1,
1.178062, 0.918834, 0.8340164, 1, 0, 0, 1, 1,
1.19051, 0.6746042, 1.559484, 1, 0, 0, 1, 1,
1.192837, -0.843684, 1.224093, 1, 0, 0, 1, 1,
1.194028, 2.158957, 0.6798438, 0, 0, 0, 1, 1,
1.194155, 1.204839, -1.062834, 0, 0, 0, 1, 1,
1.20121, -0.2516538, 2.471391, 0, 0, 0, 1, 1,
1.203589, -1.017975, 1.673872, 0, 0, 0, 1, 1,
1.207217, 0.6622528, 1.205271, 0, 0, 0, 1, 1,
1.233572, 0.4932336, 1.251477, 0, 0, 0, 1, 1,
1.243385, 0.3757735, 1.434369, 0, 0, 0, 1, 1,
1.245493, -1.602327, 4.564388, 1, 1, 1, 1, 1,
1.273391, 0.4688174, 0.7055844, 1, 1, 1, 1, 1,
1.276423, -0.2288655, 0.9341925, 1, 1, 1, 1, 1,
1.278449, 1.905816, -0.6978942, 1, 1, 1, 1, 1,
1.284386, -0.2658642, 2.3075, 1, 1, 1, 1, 1,
1.284995, -0.00898993, 2.201185, 1, 1, 1, 1, 1,
1.285688, 0.5364695, 2.251763, 1, 1, 1, 1, 1,
1.289386, -0.2900954, 2.143199, 1, 1, 1, 1, 1,
1.293954, 0.1386677, 0.7180189, 1, 1, 1, 1, 1,
1.304483, 0.1608527, 1.685963, 1, 1, 1, 1, 1,
1.306745, 2.215138, 2.233878, 1, 1, 1, 1, 1,
1.307925, -1.336221, 2.432336, 1, 1, 1, 1, 1,
1.308368, -1.861722, 2.407986, 1, 1, 1, 1, 1,
1.31878, 0.1224388, 1.637611, 1, 1, 1, 1, 1,
1.319846, -0.2820352, 2.413404, 1, 1, 1, 1, 1,
1.320027, -2.20952, 2.068771, 0, 0, 1, 1, 1,
1.327228, -1.121365, 3.637526, 1, 0, 0, 1, 1,
1.329279, 1.109392, 0.5832262, 1, 0, 0, 1, 1,
1.332242, 0.8773128, 0.6985279, 1, 0, 0, 1, 1,
1.346161, 1.584789, 0.5431469, 1, 0, 0, 1, 1,
1.354387, 1.234395, -0.0845897, 1, 0, 0, 1, 1,
1.357783, -1.45537, -0.009708094, 0, 0, 0, 1, 1,
1.357893, 1.087588, 1.431343, 0, 0, 0, 1, 1,
1.369487, -0.316006, 1.813488, 0, 0, 0, 1, 1,
1.371253, -0.5286645, 1.980391, 0, 0, 0, 1, 1,
1.379548, 0.6233026, 2.270014, 0, 0, 0, 1, 1,
1.384125, -0.5042243, 0.7436455, 0, 0, 0, 1, 1,
1.407358, 0.4679659, 0.3680387, 0, 0, 0, 1, 1,
1.41198, -0.6105412, 3.991993, 1, 1, 1, 1, 1,
1.417981, 0.1336197, 3.080549, 1, 1, 1, 1, 1,
1.442763, 0.2364608, 1.071263, 1, 1, 1, 1, 1,
1.463606, -1.128888, 1.482796, 1, 1, 1, 1, 1,
1.492096, 1.660257, 0.02255489, 1, 1, 1, 1, 1,
1.526322, -0.8140211, 1.72367, 1, 1, 1, 1, 1,
1.53718, -2.306335, 1.542897, 1, 1, 1, 1, 1,
1.546118, -0.2663164, 1.775241, 1, 1, 1, 1, 1,
1.547568, -1.126558, 1.823344, 1, 1, 1, 1, 1,
1.56089, 0.1682157, 1.955664, 1, 1, 1, 1, 1,
1.562585, 0.5637243, 1.838119, 1, 1, 1, 1, 1,
1.596726, 0.1100447, 0.3590668, 1, 1, 1, 1, 1,
1.601174, 1.41347, 1.134612, 1, 1, 1, 1, 1,
1.604017, 0.2140005, 1.554761, 1, 1, 1, 1, 1,
1.633844, 1.259677, 1.1748, 1, 1, 1, 1, 1,
1.635902, 1.596911, 0.3055785, 0, 0, 1, 1, 1,
1.643316, 0.3755206, 0.6876453, 1, 0, 0, 1, 1,
1.738577, 1.360187, 2.461938, 1, 0, 0, 1, 1,
1.758433, -0.3884394, 2.853912, 1, 0, 0, 1, 1,
1.776551, 0.5724933, 0.07913774, 1, 0, 0, 1, 1,
1.782414, -1.548337, 1.541293, 1, 0, 0, 1, 1,
1.804214, 1.610494, 1.571554, 0, 0, 0, 1, 1,
1.810132, -0.386227, 2.880505, 0, 0, 0, 1, 1,
1.81762, 0.1013049, 2.094929, 0, 0, 0, 1, 1,
1.818203, -0.4190401, 2.199548, 0, 0, 0, 1, 1,
1.827465, -0.9093578, 2.504453, 0, 0, 0, 1, 1,
1.836847, 2.058941, 0.2278869, 0, 0, 0, 1, 1,
1.839967, 1.046044, -0.6889136, 0, 0, 0, 1, 1,
1.848877, -1.625558, 3.301947, 1, 1, 1, 1, 1,
1.860603, -2.391429, 3.028525, 1, 1, 1, 1, 1,
1.865214, -0.6698866, 2.384912, 1, 1, 1, 1, 1,
1.879155, -2.346383, 3.716286, 1, 1, 1, 1, 1,
1.937368, 0.6475844, 0.9925958, 1, 1, 1, 1, 1,
1.939455, -0.485081, 3.084822, 1, 1, 1, 1, 1,
1.946248, 0.7601119, 1.390923, 1, 1, 1, 1, 1,
1.946471, 0.02501278, 2.366822, 1, 1, 1, 1, 1,
1.955932, -0.2449893, 1.52687, 1, 1, 1, 1, 1,
1.976868, -1.168087, 1.994463, 1, 1, 1, 1, 1,
1.983967, -1.225774, 2.306295, 1, 1, 1, 1, 1,
1.997008, 1.250398, 1.427432, 1, 1, 1, 1, 1,
2.055241, 0.7299758, 0.7357123, 1, 1, 1, 1, 1,
2.057029, -0.2312711, 2.392946, 1, 1, 1, 1, 1,
2.071247, -0.8258586, 2.782247, 1, 1, 1, 1, 1,
2.071481, 0.5775204, 1.618888, 0, 0, 1, 1, 1,
2.10143, -0.1902711, 0.8434356, 1, 0, 0, 1, 1,
2.104295, -0.9960619, 2.916735, 1, 0, 0, 1, 1,
2.143828, 0.1300923, 0.9077765, 1, 0, 0, 1, 1,
2.148718, 0.8637388, 0.7291506, 1, 0, 0, 1, 1,
2.149743, -2.186096, 1.807756, 1, 0, 0, 1, 1,
2.156686, 0.4102182, 0.3279549, 0, 0, 0, 1, 1,
2.17854, -0.4193611, 2.226119, 0, 0, 0, 1, 1,
2.194348, 0.9228321, 2.179467, 0, 0, 0, 1, 1,
2.265288, 1.106855, -0.1424838, 0, 0, 0, 1, 1,
2.340035, 0.8467246, 1.198126, 0, 0, 0, 1, 1,
2.397892, 0.1148258, 1.200718, 0, 0, 0, 1, 1,
2.405507, 0.3314699, -0.1227068, 0, 0, 0, 1, 1,
2.430504, -0.8415958, 2.015875, 1, 1, 1, 1, 1,
2.449912, -1.272926, 2.958678, 1, 1, 1, 1, 1,
2.507095, -1.954641, 2.017007, 1, 1, 1, 1, 1,
2.608655, -0.3065925, 3.792835, 1, 1, 1, 1, 1,
2.795636, -1.647279, 0.6824689, 1, 1, 1, 1, 1,
3.361717, 1.199793, 1.303092, 1, 1, 1, 1, 1,
3.516631, -0.5152863, 2.757693, 1, 1, 1, 1, 1
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
var radius = 9.563729;
var distance = 33.59219;
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
mvMatrix.translate( -0.03166151, 0.03610802, 0.06691456 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.59219);
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
