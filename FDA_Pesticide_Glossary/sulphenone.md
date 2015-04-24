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
-3.532672, -1.411889, -2.819798, 1, 0, 0, 1,
-2.971067, 0.9787849, -0.4536462, 1, 0.007843138, 0, 1,
-2.889125, -0.06293056, -1.616502, 1, 0.01176471, 0, 1,
-2.851752, -1.302048, -3.538266, 1, 0.01960784, 0, 1,
-2.797952, -1.03119, -0.6512002, 1, 0.02352941, 0, 1,
-2.741937, 0.4847222, 0.0259103, 1, 0.03137255, 0, 1,
-2.67506, 1.257547, -2.407707, 1, 0.03529412, 0, 1,
-2.669768, 0.7208868, -0.8726869, 1, 0.04313726, 0, 1,
-2.622211, 0.8900845, -1.435961, 1, 0.04705882, 0, 1,
-2.475793, -0.7773914, -2.247459, 1, 0.05490196, 0, 1,
-2.433755, -1.224526, -0.2744826, 1, 0.05882353, 0, 1,
-2.329936, -0.1094049, -1.117998, 1, 0.06666667, 0, 1,
-2.267057, 0.6613579, -2.470431, 1, 0.07058824, 0, 1,
-2.262136, 0.8436334, -1.455821, 1, 0.07843138, 0, 1,
-2.245084, -1.37036, -1.910761, 1, 0.08235294, 0, 1,
-2.231265, -1.936082, -1.70644, 1, 0.09019608, 0, 1,
-2.21105, 0.6803726, 1.183024, 1, 0.09411765, 0, 1,
-2.165558, -2.141888, -3.138451, 1, 0.1019608, 0, 1,
-2.108011, 1.82006, -1.196712, 1, 0.1098039, 0, 1,
-2.089185, 0.4195447, -1.961146, 1, 0.1137255, 0, 1,
-2.045346, 0.724042, 0.2268744, 1, 0.1215686, 0, 1,
-2.020236, 0.2419842, -1.898185, 1, 0.1254902, 0, 1,
-2.018114, -0.8434961, -2.944361, 1, 0.1333333, 0, 1,
-2.011196, -0.160916, -1.834849, 1, 0.1372549, 0, 1,
-1.997782, -0.3991351, -0.3564902, 1, 0.145098, 0, 1,
-1.983846, 0.9596643, -1.083694, 1, 0.1490196, 0, 1,
-1.983772, -0.3771104, -3.518949, 1, 0.1568628, 0, 1,
-1.98081, 1.538399, -0.7790573, 1, 0.1607843, 0, 1,
-1.977039, -0.3729439, -1.17975, 1, 0.1686275, 0, 1,
-1.963889, 0.2599851, -0.02783609, 1, 0.172549, 0, 1,
-1.899687, -1.728612, -2.360719, 1, 0.1803922, 0, 1,
-1.898737, -0.7061091, -2.639689, 1, 0.1843137, 0, 1,
-1.898192, -1.067546, -2.147915, 1, 0.1921569, 0, 1,
-1.893306, 0.7086601, -0.007050673, 1, 0.1960784, 0, 1,
-1.839714, 0.462351, -2.085459, 1, 0.2039216, 0, 1,
-1.835543, 1.091838, -0.7621932, 1, 0.2117647, 0, 1,
-1.826581, -0.5951847, -0.1194673, 1, 0.2156863, 0, 1,
-1.807403, 0.2728812, -1.664684, 1, 0.2235294, 0, 1,
-1.787908, -2.842072, -4.685061, 1, 0.227451, 0, 1,
-1.774083, 1.122788, -1.656984, 1, 0.2352941, 0, 1,
-1.762051, -2.041366, -1.317932, 1, 0.2392157, 0, 1,
-1.754893, 1.317946, -0.8509066, 1, 0.2470588, 0, 1,
-1.745408, 0.7129257, -0.2862143, 1, 0.2509804, 0, 1,
-1.735725, -0.7052718, -0.6411607, 1, 0.2588235, 0, 1,
-1.709153, -0.0448315, -1.468629, 1, 0.2627451, 0, 1,
-1.706092, 0.378543, -1.134092, 1, 0.2705882, 0, 1,
-1.695058, -0.6416063, -0.3827987, 1, 0.2745098, 0, 1,
-1.69233, -0.1450484, -1.266661, 1, 0.282353, 0, 1,
-1.691691, -2.358692, -2.512568, 1, 0.2862745, 0, 1,
-1.680519, -0.9830751, -1.609357, 1, 0.2941177, 0, 1,
-1.66877, -0.1403647, -1.710555, 1, 0.3019608, 0, 1,
-1.666978, 0.2796039, -1.326932, 1, 0.3058824, 0, 1,
-1.666185, -0.1703739, -1.659444, 1, 0.3137255, 0, 1,
-1.647669, 0.9419311, -0.3501551, 1, 0.3176471, 0, 1,
-1.642264, -0.4135727, -1.790438, 1, 0.3254902, 0, 1,
-1.619634, -0.2976847, -2.905564, 1, 0.3294118, 0, 1,
-1.609418, -1.699516, -3.430979, 1, 0.3372549, 0, 1,
-1.608637, 0.9517326, -1.018266, 1, 0.3411765, 0, 1,
-1.601639, 0.2340883, -1.665927, 1, 0.3490196, 0, 1,
-1.58984, 1.56692, -0.2984761, 1, 0.3529412, 0, 1,
-1.5884, -0.4705399, -0.9331195, 1, 0.3607843, 0, 1,
-1.576491, -0.9438241, -2.021578, 1, 0.3647059, 0, 1,
-1.570638, -2.630266, -1.980428, 1, 0.372549, 0, 1,
-1.562724, -0.1184143, 0.1496135, 1, 0.3764706, 0, 1,
-1.562247, -0.7162746, -1.06927, 1, 0.3843137, 0, 1,
-1.551282, -0.9411418, -1.805778, 1, 0.3882353, 0, 1,
-1.550525, -2.08121, -3.006896, 1, 0.3960784, 0, 1,
-1.544529, 0.6211674, -1.469713, 1, 0.4039216, 0, 1,
-1.530506, 1.373292, -1.248216, 1, 0.4078431, 0, 1,
-1.514608, 0.1943169, -1.700765, 1, 0.4156863, 0, 1,
-1.507399, -0.323099, -0.8911828, 1, 0.4196078, 0, 1,
-1.501796, -0.3534923, -1.543763, 1, 0.427451, 0, 1,
-1.500539, -0.04827126, -3.234501, 1, 0.4313726, 0, 1,
-1.488334, -0.2697717, -0.1840334, 1, 0.4392157, 0, 1,
-1.465003, -0.3353395, -2.324031, 1, 0.4431373, 0, 1,
-1.431935, 0.1039625, 0.1219066, 1, 0.4509804, 0, 1,
-1.426158, 0.1132433, -2.695457, 1, 0.454902, 0, 1,
-1.42443, -1.522434, -2.859389, 1, 0.4627451, 0, 1,
-1.39668, 1.401993, -1.792506, 1, 0.4666667, 0, 1,
-1.394638, -0.02296138, -3.104718, 1, 0.4745098, 0, 1,
-1.389655, -0.6874585, -3.063512, 1, 0.4784314, 0, 1,
-1.388211, 1.087683, 0.4026996, 1, 0.4862745, 0, 1,
-1.385314, 0.7555891, 1.93418, 1, 0.4901961, 0, 1,
-1.369755, -1.654355, -4.594188, 1, 0.4980392, 0, 1,
-1.369434, 0.6807429, 0.2279442, 1, 0.5058824, 0, 1,
-1.366227, -2.936284, -4.099872, 1, 0.509804, 0, 1,
-1.364679, -0.8732426, -2.565271, 1, 0.5176471, 0, 1,
-1.354843, -0.6333613, -2.350285, 1, 0.5215687, 0, 1,
-1.354379, -0.3236237, -0.1464764, 1, 0.5294118, 0, 1,
-1.351675, -0.4834791, -2.190705, 1, 0.5333334, 0, 1,
-1.351127, 1.224394, -0.1004768, 1, 0.5411765, 0, 1,
-1.348085, 2.389486, -0.6388333, 1, 0.5450981, 0, 1,
-1.344051, 1.411023, -1.409151, 1, 0.5529412, 0, 1,
-1.332189, 1.396349, -1.727589, 1, 0.5568628, 0, 1,
-1.325579, -0.3993092, -0.7156, 1, 0.5647059, 0, 1,
-1.319286, 0.5102662, -0.6029938, 1, 0.5686275, 0, 1,
-1.31906, 0.528888, -1.433774, 1, 0.5764706, 0, 1,
-1.317946, 2.097247, -3.842361, 1, 0.5803922, 0, 1,
-1.308999, -0.1875138, -4.026213, 1, 0.5882353, 0, 1,
-1.305792, -1.493696, -1.31309, 1, 0.5921569, 0, 1,
-1.30554, -0.6068953, -1.806442, 1, 0.6, 0, 1,
-1.305329, 0.2876816, -0.5855798, 1, 0.6078432, 0, 1,
-1.3034, -0.02392612, -0.9563102, 1, 0.6117647, 0, 1,
-1.279356, 0.5002158, 0.2503676, 1, 0.6196079, 0, 1,
-1.2743, -0.8692921, -0.2937082, 1, 0.6235294, 0, 1,
-1.273509, -0.6617591, -3.249052, 1, 0.6313726, 0, 1,
-1.271878, 1.552719, -0.6184157, 1, 0.6352941, 0, 1,
-1.268434, 1.548796, -1.326154, 1, 0.6431373, 0, 1,
-1.266346, 1.261001, 0.4564338, 1, 0.6470588, 0, 1,
-1.264869, 1.930221, 0.2840916, 1, 0.654902, 0, 1,
-1.263087, -1.164582, -1.042928, 1, 0.6588235, 0, 1,
-1.259935, -0.4867112, -4.15649, 1, 0.6666667, 0, 1,
-1.255384, -0.1752042, -2.43925, 1, 0.6705883, 0, 1,
-1.249095, -0.7886559, -0.2475145, 1, 0.6784314, 0, 1,
-1.247995, 0.1129273, -3.370942, 1, 0.682353, 0, 1,
-1.233998, -0.9914551, -3.713647, 1, 0.6901961, 0, 1,
-1.232193, -1.068416, -1.836889, 1, 0.6941177, 0, 1,
-1.226265, 0.4069806, -2.799915, 1, 0.7019608, 0, 1,
-1.223758, -1.981207, -3.151822, 1, 0.7098039, 0, 1,
-1.217254, 0.5518785, -1.37454, 1, 0.7137255, 0, 1,
-1.216676, -1.262676, -1.439254, 1, 0.7215686, 0, 1,
-1.215309, 0.09454154, -0.8023455, 1, 0.7254902, 0, 1,
-1.211013, 1.438683, -0.9753436, 1, 0.7333333, 0, 1,
-1.192333, -1.958566, -2.583135, 1, 0.7372549, 0, 1,
-1.189253, -1.741708, -1.725159, 1, 0.7450981, 0, 1,
-1.180687, -0.3786523, -1.197127, 1, 0.7490196, 0, 1,
-1.177363, -0.4874358, -2.906724, 1, 0.7568628, 0, 1,
-1.174377, -0.1708982, -0.7294204, 1, 0.7607843, 0, 1,
-1.169154, 0.5326509, -2.713259, 1, 0.7686275, 0, 1,
-1.163012, 3.23516, 2.678534, 1, 0.772549, 0, 1,
-1.160049, -0.2812382, -2.203206, 1, 0.7803922, 0, 1,
-1.159665, 0.640051, -1.111478, 1, 0.7843137, 0, 1,
-1.154996, 2.656965, -0.6717964, 1, 0.7921569, 0, 1,
-1.154263, 1.521835, 1.790416, 1, 0.7960784, 0, 1,
-1.152473, 0.3502645, -1.087381, 1, 0.8039216, 0, 1,
-1.146383, -0.1306318, -0.2148663, 1, 0.8117647, 0, 1,
-1.146244, -0.2713472, -2.195562, 1, 0.8156863, 0, 1,
-1.141142, -0.2984465, -2.834378, 1, 0.8235294, 0, 1,
-1.138605, 1.994686, 0.05944684, 1, 0.827451, 0, 1,
-1.135998, -0.4096903, -0.4284267, 1, 0.8352941, 0, 1,
-1.135396, 2.849622, 0.5244824, 1, 0.8392157, 0, 1,
-1.134309, -1.841481, -3.468098, 1, 0.8470588, 0, 1,
-1.129972, -0.5496396, -2.20013, 1, 0.8509804, 0, 1,
-1.122346, -0.1860117, -2.154036, 1, 0.8588235, 0, 1,
-1.116107, 1.169891, -2.220579, 1, 0.8627451, 0, 1,
-1.103884, -0.5595065, -3.067979, 1, 0.8705882, 0, 1,
-1.103394, -1.372528, -2.319275, 1, 0.8745098, 0, 1,
-1.099493, 1.09392, -0.1633683, 1, 0.8823529, 0, 1,
-1.095212, 0.3966689, -0.232019, 1, 0.8862745, 0, 1,
-1.094869, 0.6420034, 0.3344063, 1, 0.8941177, 0, 1,
-1.093472, 1.147894, -2.052425, 1, 0.8980392, 0, 1,
-1.090757, 0.3378902, -4.61525, 1, 0.9058824, 0, 1,
-1.088243, -0.296081, -0.587687, 1, 0.9137255, 0, 1,
-1.075833, 0.4579299, -2.831772, 1, 0.9176471, 0, 1,
-1.075294, 0.1237457, -1.482438, 1, 0.9254902, 0, 1,
-1.07506, 0.9622345, -1.18623, 1, 0.9294118, 0, 1,
-1.065171, 1.281151, -0.9733281, 1, 0.9372549, 0, 1,
-1.064992, 1.47087, 0.07530875, 1, 0.9411765, 0, 1,
-1.060615, -0.1099341, 0.02881977, 1, 0.9490196, 0, 1,
-1.059929, 0.6748888, -0.127488, 1, 0.9529412, 0, 1,
-1.046315, 0.3033977, -0.6736755, 1, 0.9607843, 0, 1,
-1.045993, 1.233627, -2.506256, 1, 0.9647059, 0, 1,
-1.039733, -0.1521218, -3.909801, 1, 0.972549, 0, 1,
-1.037724, -0.0998987, -2.419807, 1, 0.9764706, 0, 1,
-1.035863, 0.2343384, 0.2608345, 1, 0.9843137, 0, 1,
-1.032552, 2.063966, -0.879961, 1, 0.9882353, 0, 1,
-1.029374, 0.263051, -1.295532, 1, 0.9960784, 0, 1,
-1.0247, -3.349731, -2.758623, 0.9960784, 1, 0, 1,
-1.020111, -1.918578, -2.226808, 0.9921569, 1, 0, 1,
-1.019245, -0.3762362, -1.158547, 0.9843137, 1, 0, 1,
-1.016619, 0.9084328, -1.579416, 0.9803922, 1, 0, 1,
-1.011285, -1.550628, -2.174964, 0.972549, 1, 0, 1,
-1.008483, -0.5511011, -0.1934284, 0.9686275, 1, 0, 1,
-0.996217, -1.235833, -1.880963, 0.9607843, 1, 0, 1,
-0.9943123, -0.5939529, -2.649002, 0.9568627, 1, 0, 1,
-0.9942255, -0.4042964, -2.877911, 0.9490196, 1, 0, 1,
-0.9897221, -0.02482771, -0.6112012, 0.945098, 1, 0, 1,
-0.9881917, 0.2848094, -1.539394, 0.9372549, 1, 0, 1,
-0.9825438, 0.05762721, -1.35318, 0.9333333, 1, 0, 1,
-0.9817327, -0.004633785, -1.881706, 0.9254902, 1, 0, 1,
-0.9799659, 0.7470241, -2.114782, 0.9215686, 1, 0, 1,
-0.9759028, -0.8792375, -2.387044, 0.9137255, 1, 0, 1,
-0.9746749, 0.6160163, -1.461377, 0.9098039, 1, 0, 1,
-0.9744155, 0.3205106, -0.6361726, 0.9019608, 1, 0, 1,
-0.9537705, 0.3591049, -0.04701266, 0.8941177, 1, 0, 1,
-0.9467854, -1.47721, -2.048048, 0.8901961, 1, 0, 1,
-0.9437042, -0.1358294, -1.746987, 0.8823529, 1, 0, 1,
-0.9418169, -0.1493163, -1.97954, 0.8784314, 1, 0, 1,
-0.939755, -1.101367, -1.979403, 0.8705882, 1, 0, 1,
-0.9382401, -0.1770412, -0.834803, 0.8666667, 1, 0, 1,
-0.9375852, -0.4730124, -0.1382679, 0.8588235, 1, 0, 1,
-0.9299858, 1.734695, -0.3163999, 0.854902, 1, 0, 1,
-0.9286125, 0.2685956, -1.91845, 0.8470588, 1, 0, 1,
-0.9281512, -0.6380259, -1.565367, 0.8431373, 1, 0, 1,
-0.9257348, -1.141718, -3.537335, 0.8352941, 1, 0, 1,
-0.9220502, 0.8936412, -1.379327, 0.8313726, 1, 0, 1,
-0.9146875, 1.717444, -2.043872, 0.8235294, 1, 0, 1,
-0.9112526, 0.37388, -2.245795, 0.8196079, 1, 0, 1,
-0.9072151, -0.5442312, -2.479023, 0.8117647, 1, 0, 1,
-0.9024391, -0.6434177, -1.040524, 0.8078431, 1, 0, 1,
-0.8998581, -0.6703176, -3.903233, 0.8, 1, 0, 1,
-0.8987404, -1.319102, -3.817037, 0.7921569, 1, 0, 1,
-0.891282, -0.4299721, -0.6667279, 0.7882353, 1, 0, 1,
-0.8896111, -0.2945061, -0.1767385, 0.7803922, 1, 0, 1,
-0.887917, -0.6625342, -2.02192, 0.7764706, 1, 0, 1,
-0.8872174, 1.165005, 0.1959734, 0.7686275, 1, 0, 1,
-0.8715506, 0.1057708, -2.376779, 0.7647059, 1, 0, 1,
-0.8590373, -0.9611045, -2.133289, 0.7568628, 1, 0, 1,
-0.8578314, -2.120682, -3.509947, 0.7529412, 1, 0, 1,
-0.8529284, 0.236444, -1.960382, 0.7450981, 1, 0, 1,
-0.8497529, -0.9264445, -2.675068, 0.7411765, 1, 0, 1,
-0.8407069, 0.7492737, 1.192753, 0.7333333, 1, 0, 1,
-0.8341482, 0.3717621, 0.6511915, 0.7294118, 1, 0, 1,
-0.8341313, -2.616184, -4.169757, 0.7215686, 1, 0, 1,
-0.8305815, -0.1583144, -2.116205, 0.7176471, 1, 0, 1,
-0.8175054, 0.8197676, -1.056399, 0.7098039, 1, 0, 1,
-0.8152031, -0.03530473, 0.02770941, 0.7058824, 1, 0, 1,
-0.8099402, -1.72228, -2.856494, 0.6980392, 1, 0, 1,
-0.8059254, -1.896496, -2.166763, 0.6901961, 1, 0, 1,
-0.8032219, 0.05706098, -1.813953, 0.6862745, 1, 0, 1,
-0.8001186, -0.4273689, -1.524292, 0.6784314, 1, 0, 1,
-0.7978194, -0.6111978, -1.191615, 0.6745098, 1, 0, 1,
-0.7946904, -0.6194189, -1.123874, 0.6666667, 1, 0, 1,
-0.7921321, -0.3207566, -1.535799, 0.6627451, 1, 0, 1,
-0.7855052, 0.3081544, -0.2463222, 0.654902, 1, 0, 1,
-0.7854092, -1.844983, -1.41827, 0.6509804, 1, 0, 1,
-0.7841666, 0.4461756, -2.635758, 0.6431373, 1, 0, 1,
-0.782775, 0.852547, 0.2821816, 0.6392157, 1, 0, 1,
-0.7813984, -0.1666821, -1.062924, 0.6313726, 1, 0, 1,
-0.7809881, 1.787262, -0.309904, 0.627451, 1, 0, 1,
-0.780496, 1.013656, -0.5755427, 0.6196079, 1, 0, 1,
-0.7804921, 1.540559, -2.710135, 0.6156863, 1, 0, 1,
-0.7723819, 0.8664983, -0.7454153, 0.6078432, 1, 0, 1,
-0.7702936, -0.3455333, -1.378924, 0.6039216, 1, 0, 1,
-0.7631853, -0.9729991, -2.328131, 0.5960785, 1, 0, 1,
-0.7616938, 0.8244938, -0.831135, 0.5882353, 1, 0, 1,
-0.7597548, 2.766112, 0.04815785, 0.5843138, 1, 0, 1,
-0.7557603, -1.256149, -2.826176, 0.5764706, 1, 0, 1,
-0.754788, -0.187371, -1.540683, 0.572549, 1, 0, 1,
-0.7500763, -2.045831, -1.524839, 0.5647059, 1, 0, 1,
-0.7483802, 1.011399, -0.9058642, 0.5607843, 1, 0, 1,
-0.7475756, -1.222298, -4.534813, 0.5529412, 1, 0, 1,
-0.7444427, -0.6239277, -2.205626, 0.5490196, 1, 0, 1,
-0.7386774, 0.8679221, -0.863818, 0.5411765, 1, 0, 1,
-0.7324995, 0.2711048, -1.66302, 0.5372549, 1, 0, 1,
-0.7317103, -0.206021, -2.840915, 0.5294118, 1, 0, 1,
-0.7266173, 0.6808327, -1.495678, 0.5254902, 1, 0, 1,
-0.7262109, 0.04713742, -0.2568564, 0.5176471, 1, 0, 1,
-0.7150514, -0.03857286, -1.457618, 0.5137255, 1, 0, 1,
-0.7098235, -0.4035773, -1.459764, 0.5058824, 1, 0, 1,
-0.7066326, -1.196892, -1.293733, 0.5019608, 1, 0, 1,
-0.7006534, 1.112968, -1.194988, 0.4941176, 1, 0, 1,
-0.6935505, 0.7193793, -2.633857, 0.4862745, 1, 0, 1,
-0.6892257, 2.332019, 2.422866, 0.4823529, 1, 0, 1,
-0.6838371, 2.899177, -0.7524489, 0.4745098, 1, 0, 1,
-0.6811564, -0.8148791, -3.763251, 0.4705882, 1, 0, 1,
-0.6771346, -0.5693173, -0.8521034, 0.4627451, 1, 0, 1,
-0.676352, 0.6419179, -0.2898779, 0.4588235, 1, 0, 1,
-0.6722011, 2.212448, -0.5221176, 0.4509804, 1, 0, 1,
-0.671873, -1.358612, -2.669206, 0.4470588, 1, 0, 1,
-0.6655202, 0.1547979, -2.196215, 0.4392157, 1, 0, 1,
-0.6636884, -0.211685, -0.9361211, 0.4352941, 1, 0, 1,
-0.6635508, -0.6060582, -2.726518, 0.427451, 1, 0, 1,
-0.6620269, -1.220474, -1.687498, 0.4235294, 1, 0, 1,
-0.6546519, 2.26533, -0.03978524, 0.4156863, 1, 0, 1,
-0.6480946, -0.6185763, -2.664822, 0.4117647, 1, 0, 1,
-0.6427557, -0.1069068, -1.487589, 0.4039216, 1, 0, 1,
-0.6395946, 0.9516826, -1.35449, 0.3960784, 1, 0, 1,
-0.6393396, -0.1145732, -0.8686721, 0.3921569, 1, 0, 1,
-0.6360496, 0.8011944, 0.949445, 0.3843137, 1, 0, 1,
-0.633582, -0.320415, -2.680958, 0.3803922, 1, 0, 1,
-0.6311038, 0.3600065, -0.495113, 0.372549, 1, 0, 1,
-0.6233979, -0.7836974, -2.019499, 0.3686275, 1, 0, 1,
-0.6071876, 0.5627979, -1.442556, 0.3607843, 1, 0, 1,
-0.6033184, -0.2014358, -2.675495, 0.3568628, 1, 0, 1,
-0.5985862, 0.8481306, -0.729567, 0.3490196, 1, 0, 1,
-0.5964426, 0.3397402, -1.730062, 0.345098, 1, 0, 1,
-0.5887449, -0.3538715, -1.701105, 0.3372549, 1, 0, 1,
-0.577461, -0.2731622, -2.089144, 0.3333333, 1, 0, 1,
-0.5740417, -0.2260739, -1.25168, 0.3254902, 1, 0, 1,
-0.5735506, -0.4818377, -2.74939, 0.3215686, 1, 0, 1,
-0.5705236, 0.8585475, -0.3889254, 0.3137255, 1, 0, 1,
-0.5670928, 1.961578, -1.492349, 0.3098039, 1, 0, 1,
-0.5665443, -1.899702, -2.108839, 0.3019608, 1, 0, 1,
-0.5657021, -0.4890533, -3.641459, 0.2941177, 1, 0, 1,
-0.5643208, 0.4348928, -0.8232418, 0.2901961, 1, 0, 1,
-0.5639394, -0.2669529, -1.844529, 0.282353, 1, 0, 1,
-0.5602427, 2.376453, -0.9427373, 0.2784314, 1, 0, 1,
-0.5569474, -0.6158718, -3.904202, 0.2705882, 1, 0, 1,
-0.5564344, 1.705495, -1.345838, 0.2666667, 1, 0, 1,
-0.5544807, -0.5744993, -2.810893, 0.2588235, 1, 0, 1,
-0.5525339, 1.2199, -1.191196, 0.254902, 1, 0, 1,
-0.5509733, -0.5993278, -2.42029, 0.2470588, 1, 0, 1,
-0.548071, -0.3499825, -2.258874, 0.2431373, 1, 0, 1,
-0.5445267, -0.9569299, -4.337733, 0.2352941, 1, 0, 1,
-0.5416024, -1.986371, -2.95627, 0.2313726, 1, 0, 1,
-0.5382691, -0.5097568, -2.263455, 0.2235294, 1, 0, 1,
-0.5226098, -1.224712, -4.345541, 0.2196078, 1, 0, 1,
-0.5154713, -0.1109348, -1.481395, 0.2117647, 1, 0, 1,
-0.5107819, -1.539788, -2.812646, 0.2078431, 1, 0, 1,
-0.5098366, -0.3613383, -1.836266, 0.2, 1, 0, 1,
-0.5060691, 0.7332239, -2.207565, 0.1921569, 1, 0, 1,
-0.5004815, 0.5235929, -0.3896692, 0.1882353, 1, 0, 1,
-0.4972759, -0.3229111, -2.139212, 0.1803922, 1, 0, 1,
-0.4913877, 1.290035, -1.978091, 0.1764706, 1, 0, 1,
-0.4858378, 0.2425021, -0.4749385, 0.1686275, 1, 0, 1,
-0.4809697, -0.1888865, -1.805229, 0.1647059, 1, 0, 1,
-0.4790927, 0.2672693, -1.914058, 0.1568628, 1, 0, 1,
-0.4772919, -0.8015128, -1.556115, 0.1529412, 1, 0, 1,
-0.4717859, 0.07271104, -2.075728, 0.145098, 1, 0, 1,
-0.4711233, 0.7500616, -0.3487554, 0.1411765, 1, 0, 1,
-0.4696637, 0.1492777, -2.63103, 0.1333333, 1, 0, 1,
-0.4625019, -1.135486, -3.696328, 0.1294118, 1, 0, 1,
-0.4624033, -1.196457, -2.805825, 0.1215686, 1, 0, 1,
-0.4570377, 3.412808, -0.01016465, 0.1176471, 1, 0, 1,
-0.4528891, -0.4870731, -1.320759, 0.1098039, 1, 0, 1,
-0.4508528, 0.001877659, -0.6216114, 0.1058824, 1, 0, 1,
-0.4474345, 0.04364643, -1.197564, 0.09803922, 1, 0, 1,
-0.4466628, -0.1207437, -1.015407, 0.09019608, 1, 0, 1,
-0.4438331, -0.6370781, -4.866543, 0.08627451, 1, 0, 1,
-0.443778, -0.4301974, -1.776825, 0.07843138, 1, 0, 1,
-0.4434808, -0.4996622, -2.554942, 0.07450981, 1, 0, 1,
-0.4382647, 0.949784, -0.1872636, 0.06666667, 1, 0, 1,
-0.4380903, 0.04268034, -2.43158, 0.0627451, 1, 0, 1,
-0.4372783, 0.3963827, -1.315753, 0.05490196, 1, 0, 1,
-0.430514, 1.251531, 1.838858, 0.05098039, 1, 0, 1,
-0.4228603, 0.3177438, -1.185176, 0.04313726, 1, 0, 1,
-0.4218035, 0.5747692, 0.6380348, 0.03921569, 1, 0, 1,
-0.4155675, -0.2196813, -2.236961, 0.03137255, 1, 0, 1,
-0.4098627, 0.4452259, -1.214963, 0.02745098, 1, 0, 1,
-0.4060291, -0.9127088, -3.433189, 0.01960784, 1, 0, 1,
-0.3998223, -0.6879237, -1.731501, 0.01568628, 1, 0, 1,
-0.3970081, -0.397378, -2.343508, 0.007843138, 1, 0, 1,
-0.3962007, 0.7627455, 0.2608211, 0.003921569, 1, 0, 1,
-0.3954915, -2.196808, -1.576927, 0, 1, 0.003921569, 1,
-0.3925441, -1.61111, -2.452153, 0, 1, 0.01176471, 1,
-0.3895, -1.738043, -3.416506, 0, 1, 0.01568628, 1,
-0.3890746, -0.5370388, -3.11592, 0, 1, 0.02352941, 1,
-0.3888286, 0.8002296, -0.620661, 0, 1, 0.02745098, 1,
-0.3882998, -0.07801639, -0.8514808, 0, 1, 0.03529412, 1,
-0.3863007, 1.494064, 1.108048, 0, 1, 0.03921569, 1,
-0.384471, 0.766369, -1.801895, 0, 1, 0.04705882, 1,
-0.3752134, 0.9707332, -2.075165, 0, 1, 0.05098039, 1,
-0.373449, 0.7884886, -1.136532, 0, 1, 0.05882353, 1,
-0.3680766, -0.5991352, -3.220085, 0, 1, 0.0627451, 1,
-0.3662889, 0.7599535, -0.4373012, 0, 1, 0.07058824, 1,
-0.3636677, 0.2765731, -0.4576801, 0, 1, 0.07450981, 1,
-0.363663, -0.619364, -4.104213, 0, 1, 0.08235294, 1,
-0.3581727, 0.9567614, -0.3423878, 0, 1, 0.08627451, 1,
-0.3554958, 0.6647258, -0.8851108, 0, 1, 0.09411765, 1,
-0.3542221, -0.9178795, -5.149865, 0, 1, 0.1019608, 1,
-0.3514447, -0.3813981, -3.093756, 0, 1, 0.1058824, 1,
-0.3500449, 1.225287, -1.981914, 0, 1, 0.1137255, 1,
-0.3437187, 2.63978, 0.2343327, 0, 1, 0.1176471, 1,
-0.3432289, 0.5498125, -1.091384, 0, 1, 0.1254902, 1,
-0.342502, 0.4771091, -0.5414622, 0, 1, 0.1294118, 1,
-0.3420334, -0.7314592, -1.074991, 0, 1, 0.1372549, 1,
-0.3195397, 0.2187151, 0.5927081, 0, 1, 0.1411765, 1,
-0.3180559, -1.947095, -2.143477, 0, 1, 0.1490196, 1,
-0.3165538, 0.9636219, -1.053189, 0, 1, 0.1529412, 1,
-0.3147855, 0.1560492, -1.021936, 0, 1, 0.1607843, 1,
-0.3112245, 0.9165276, -0.7088758, 0, 1, 0.1647059, 1,
-0.3110821, -1.86958, -2.407637, 0, 1, 0.172549, 1,
-0.3084417, 0.5354028, -1.475692, 0, 1, 0.1764706, 1,
-0.3052372, -0.9252935, -5.062086, 0, 1, 0.1843137, 1,
-0.3019164, 0.1840123, -1.192558, 0, 1, 0.1882353, 1,
-0.3013387, -1.448258, -2.655191, 0, 1, 0.1960784, 1,
-0.2949369, -0.6861787, -1.97587, 0, 1, 0.2039216, 1,
-0.2938364, -0.3739855, -3.099236, 0, 1, 0.2078431, 1,
-0.2925069, -0.2755737, -1.882949, 0, 1, 0.2156863, 1,
-0.2924562, -2.581325, -4.044318, 0, 1, 0.2196078, 1,
-0.2904293, 1.247252, -1.223043, 0, 1, 0.227451, 1,
-0.2883363, -0.2826035, -2.573884, 0, 1, 0.2313726, 1,
-0.2767052, 0.4295213, 0.6300107, 0, 1, 0.2392157, 1,
-0.2765783, -0.5142341, -1.403749, 0, 1, 0.2431373, 1,
-0.272254, 1.169472, 0.2518629, 0, 1, 0.2509804, 1,
-0.2722496, 0.9727424, -0.500097, 0, 1, 0.254902, 1,
-0.2647876, 0.6551428, 0.5219384, 0, 1, 0.2627451, 1,
-0.264314, -1.678918, -2.744745, 0, 1, 0.2666667, 1,
-0.2625776, 1.315442, -0.6165524, 0, 1, 0.2745098, 1,
-0.2516963, -0.4366614, -3.557847, 0, 1, 0.2784314, 1,
-0.2512056, -1.239745, -2.1632, 0, 1, 0.2862745, 1,
-0.2510306, -0.1530948, -1.955375, 0, 1, 0.2901961, 1,
-0.2503225, 0.3922693, -0.4536169, 0, 1, 0.2980392, 1,
-0.2468181, 0.08701129, -1.830735, 0, 1, 0.3058824, 1,
-0.2347848, 0.293283, -1.537264, 0, 1, 0.3098039, 1,
-0.2338975, -0.7489527, -3.353451, 0, 1, 0.3176471, 1,
-0.2332141, 0.9556497, -0.7395536, 0, 1, 0.3215686, 1,
-0.2309811, 1.12376, 0.3985224, 0, 1, 0.3294118, 1,
-0.2242706, 0.1254483, -1.854, 0, 1, 0.3333333, 1,
-0.2212909, 1.099058, -0.04802665, 0, 1, 0.3411765, 1,
-0.2211085, -0.941499, -1.282177, 0, 1, 0.345098, 1,
-0.2206993, -0.1301046, -2.002356, 0, 1, 0.3529412, 1,
-0.2180748, 0.4468313, -1.819138, 0, 1, 0.3568628, 1,
-0.2175219, 1.41054, 1.19208, 0, 1, 0.3647059, 1,
-0.2173247, 0.3883506, -0.006106217, 0, 1, 0.3686275, 1,
-0.2157987, -0.596247, -1.624143, 0, 1, 0.3764706, 1,
-0.2157644, 0.6030666, -0.3145351, 0, 1, 0.3803922, 1,
-0.2122704, 0.5776486, -1.283386, 0, 1, 0.3882353, 1,
-0.2099531, 0.8970344, -1.308423, 0, 1, 0.3921569, 1,
-0.1973334, -2.040992, -2.796085, 0, 1, 0.4, 1,
-0.1951024, 0.05565358, -1.204398, 0, 1, 0.4078431, 1,
-0.1919994, -0.3587251, -4.063844, 0, 1, 0.4117647, 1,
-0.1919075, 0.1986441, -1.854111, 0, 1, 0.4196078, 1,
-0.186829, -1.212887, -3.060175, 0, 1, 0.4235294, 1,
-0.1865117, -1.68492, -2.820848, 0, 1, 0.4313726, 1,
-0.1820716, -2.029376, -3.33822, 0, 1, 0.4352941, 1,
-0.1815237, -0.1731707, -0.2934427, 0, 1, 0.4431373, 1,
-0.1804853, -0.07843485, -3.041806, 0, 1, 0.4470588, 1,
-0.179379, 1.697109, -1.16715, 0, 1, 0.454902, 1,
-0.1792005, -0.5517099, -2.815746, 0, 1, 0.4588235, 1,
-0.1785049, -1.041301, -4.350045, 0, 1, 0.4666667, 1,
-0.1781172, -0.4345975, -4.061561, 0, 1, 0.4705882, 1,
-0.1763762, -0.4508418, -3.516513, 0, 1, 0.4784314, 1,
-0.1746489, -0.06923179, -1.526871, 0, 1, 0.4823529, 1,
-0.1743479, 0.6992383, -0.7217753, 0, 1, 0.4901961, 1,
-0.1682279, 2.102012, 0.05523267, 0, 1, 0.4941176, 1,
-0.1678885, -0.6100754, -0.9611509, 0, 1, 0.5019608, 1,
-0.1596547, -0.110434, -4.256094, 0, 1, 0.509804, 1,
-0.159618, -0.04493726, -3.451454, 0, 1, 0.5137255, 1,
-0.1585483, -2.341388, -2.56703, 0, 1, 0.5215687, 1,
-0.1564026, 0.6600789, -2.066822, 0, 1, 0.5254902, 1,
-0.1540187, -0.4282181, -0.04413661, 0, 1, 0.5333334, 1,
-0.1488318, 0.1129605, 1.588776, 0, 1, 0.5372549, 1,
-0.1484984, 1.822787, 1.423009, 0, 1, 0.5450981, 1,
-0.1474738, 1.22591, -0.125304, 0, 1, 0.5490196, 1,
-0.1472802, -1.289444, -1.775509, 0, 1, 0.5568628, 1,
-0.1467652, 0.3002607, 1.109343, 0, 1, 0.5607843, 1,
-0.1424871, -0.8596284, -2.098035, 0, 1, 0.5686275, 1,
-0.141047, -1.09505, -2.760274, 0, 1, 0.572549, 1,
-0.1402267, -0.2348453, -2.310602, 0, 1, 0.5803922, 1,
-0.1392016, -0.3562627, -3.215017, 0, 1, 0.5843138, 1,
-0.1373248, -1.06704, -3.735924, 0, 1, 0.5921569, 1,
-0.1370203, 0.3033753, -0.9380597, 0, 1, 0.5960785, 1,
-0.1358988, 3.378761, -1.828054, 0, 1, 0.6039216, 1,
-0.1346828, 0.9175285, -0.2823261, 0, 1, 0.6117647, 1,
-0.1339402, -2.121172, -2.229067, 0, 1, 0.6156863, 1,
-0.1320564, -0.7703106, -2.615026, 0, 1, 0.6235294, 1,
-0.130878, -0.8395901, -1.863937, 0, 1, 0.627451, 1,
-0.1305715, -1.30322, -4.738915, 0, 1, 0.6352941, 1,
-0.1239899, 0.3636782, -0.2581056, 0, 1, 0.6392157, 1,
-0.1208301, 0.5278586, -0.1616064, 0, 1, 0.6470588, 1,
-0.1130609, -2.053973, -4.703676, 0, 1, 0.6509804, 1,
-0.1121108, -1.703914, -3.781682, 0, 1, 0.6588235, 1,
-0.1077575, 0.5377903, -0.6179553, 0, 1, 0.6627451, 1,
-0.1060968, -0.8456209, -3.05281, 0, 1, 0.6705883, 1,
-0.1042101, 0.07306879, -1.018715, 0, 1, 0.6745098, 1,
-0.1040737, 1.08901, -2.206145, 0, 1, 0.682353, 1,
-0.1030666, 1.719353, -0.06518042, 0, 1, 0.6862745, 1,
-0.1025449, 1.488126, -0.1395656, 0, 1, 0.6941177, 1,
-0.1008471, 0.853775, 2.057076, 0, 1, 0.7019608, 1,
-0.1005692, 0.8791649, -0.9968999, 0, 1, 0.7058824, 1,
-0.1002688, -0.6643477, -1.334898, 0, 1, 0.7137255, 1,
-0.09433034, -0.3947058, -4.024485, 0, 1, 0.7176471, 1,
-0.08421458, 0.4467425, -0.2249211, 0, 1, 0.7254902, 1,
-0.07997937, -0.7464293, -2.930878, 0, 1, 0.7294118, 1,
-0.07939629, 1.417813, 1.226438, 0, 1, 0.7372549, 1,
-0.07614364, 0.631596, -1.079929, 0, 1, 0.7411765, 1,
-0.07092842, 0.4523396, 1.241043, 0, 1, 0.7490196, 1,
-0.06383473, 0.2123333, 0.7387278, 0, 1, 0.7529412, 1,
-0.06188244, -0.8667012, -3.17869, 0, 1, 0.7607843, 1,
-0.0563141, -1.115046, -3.234569, 0, 1, 0.7647059, 1,
-0.05547824, 0.1190861, -0.6508023, 0, 1, 0.772549, 1,
-0.05466892, 1.110907, 0.3429656, 0, 1, 0.7764706, 1,
-0.05189972, -1.684763, -4.409258, 0, 1, 0.7843137, 1,
-0.05010092, -0.4076246, -1.402697, 0, 1, 0.7882353, 1,
-0.0480047, -1.68786, -4.010943, 0, 1, 0.7960784, 1,
-0.0463012, 1.327406, -1.359818, 0, 1, 0.8039216, 1,
-0.04368974, 0.1706126, -1.509659, 0, 1, 0.8078431, 1,
-0.04071176, -0.06065412, -3.849962, 0, 1, 0.8156863, 1,
-0.04024585, 0.7764121, -0.4758528, 0, 1, 0.8196079, 1,
-0.03915787, 0.334902, -0.594345, 0, 1, 0.827451, 1,
-0.03757166, -1.473075, -3.066814, 0, 1, 0.8313726, 1,
-0.03741601, 0.03921976, -1.356216, 0, 1, 0.8392157, 1,
-0.03648579, 0.6919336, -0.5910628, 0, 1, 0.8431373, 1,
-0.03208226, -1.588632, -1.913196, 0, 1, 0.8509804, 1,
-0.03200656, -0.5270305, -3.086731, 0, 1, 0.854902, 1,
-0.0283384, 0.3342488, 0.3590206, 0, 1, 0.8627451, 1,
-0.02483574, -1.007225, -2.101804, 0, 1, 0.8666667, 1,
-0.01642137, 0.0259276, -1.074117, 0, 1, 0.8745098, 1,
-0.01065373, -1.469975, -2.392685, 0, 1, 0.8784314, 1,
-0.008477211, 1.70519, -1.866287, 0, 1, 0.8862745, 1,
-0.006962084, -2.227707, -2.157, 0, 1, 0.8901961, 1,
-0.003415586, -1.374591, -3.876641, 0, 1, 0.8980392, 1,
0.004765898, 0.9069955, -0.608961, 0, 1, 0.9058824, 1,
0.0100868, -1.985598, 3.356376, 0, 1, 0.9098039, 1,
0.01152202, -0.5544528, 3.740285, 0, 1, 0.9176471, 1,
0.01251277, 0.7354538, -0.7753594, 0, 1, 0.9215686, 1,
0.01783632, 0.7870953, -0.5437209, 0, 1, 0.9294118, 1,
0.01925066, -2.41259, 2.074025, 0, 1, 0.9333333, 1,
0.02109884, -0.4204735, 2.886215, 0, 1, 0.9411765, 1,
0.02363577, -1.892232, 2.107034, 0, 1, 0.945098, 1,
0.02882832, 0.6075628, 2.345836, 0, 1, 0.9529412, 1,
0.03023166, -0.1609627, 3.233283, 0, 1, 0.9568627, 1,
0.03068609, 0.9648106, 0.08423632, 0, 1, 0.9647059, 1,
0.03742734, -0.6124904, 4.579161, 0, 1, 0.9686275, 1,
0.04139221, -1.389022, 1.866485, 0, 1, 0.9764706, 1,
0.04338595, 0.2836284, 1.436481, 0, 1, 0.9803922, 1,
0.04543305, -0.5304502, 4.338428, 0, 1, 0.9882353, 1,
0.04686717, -0.2730983, 2.109582, 0, 1, 0.9921569, 1,
0.04693601, 0.7768683, -1.807815, 0, 1, 1, 1,
0.05233779, 1.384671, -0.7757087, 0, 0.9921569, 1, 1,
0.05646551, -0.3540797, 4.134021, 0, 0.9882353, 1, 1,
0.05700739, 0.03674649, 1.142149, 0, 0.9803922, 1, 1,
0.06023952, -1.189012, 3.496782, 0, 0.9764706, 1, 1,
0.06046477, 2.101842, -0.004115823, 0, 0.9686275, 1, 1,
0.06054721, -0.7527509, 4.383628, 0, 0.9647059, 1, 1,
0.07068321, -0.2445337, 0.6875838, 0, 0.9568627, 1, 1,
0.0719459, 0.9836285, 0.4105182, 0, 0.9529412, 1, 1,
0.07630485, -0.8376086, 3.238206, 0, 0.945098, 1, 1,
0.07788131, 0.5457774, -0.9543139, 0, 0.9411765, 1, 1,
0.08016488, 0.6362275, 0.1121345, 0, 0.9333333, 1, 1,
0.08016932, -0.4758662, 1.753538, 0, 0.9294118, 1, 1,
0.08020156, -1.994203, 1.843818, 0, 0.9215686, 1, 1,
0.08773567, -0.04753227, 2.670305, 0, 0.9176471, 1, 1,
0.08840832, 0.4110936, 1.08266, 0, 0.9098039, 1, 1,
0.0899375, -0.2099932, 2.404944, 0, 0.9058824, 1, 1,
0.09513942, 0.5679012, -0.3763425, 0, 0.8980392, 1, 1,
0.09614233, -0.8818423, 2.263454, 0, 0.8901961, 1, 1,
0.09771804, -0.6539806, 2.948343, 0, 0.8862745, 1, 1,
0.09835886, -0.006716727, 1.108394, 0, 0.8784314, 1, 1,
0.09893022, -3.037416, 3.731831, 0, 0.8745098, 1, 1,
0.1082144, -0.4633979, 2.229341, 0, 0.8666667, 1, 1,
0.1084899, -0.5375301, 4.469325, 0, 0.8627451, 1, 1,
0.109038, 0.2021525, 0.948568, 0, 0.854902, 1, 1,
0.1164542, -1.04069, 4.47816, 0, 0.8509804, 1, 1,
0.119333, 0.08335708, 1.175895, 0, 0.8431373, 1, 1,
0.1255461, -0.8782693, 2.489786, 0, 0.8392157, 1, 1,
0.1272195, -0.5231661, 3.121588, 0, 0.8313726, 1, 1,
0.1289465, 0.05714539, -0.8309719, 0, 0.827451, 1, 1,
0.1302878, -0.5929211, 1.322622, 0, 0.8196079, 1, 1,
0.1389733, -0.9424078, 2.959324, 0, 0.8156863, 1, 1,
0.1391922, -1.276397, 2.801762, 0, 0.8078431, 1, 1,
0.144757, 1.003835, 0.5626424, 0, 0.8039216, 1, 1,
0.1458461, -1.634807, 1.898675, 0, 0.7960784, 1, 1,
0.1476812, -0.8566164, 3.459852, 0, 0.7882353, 1, 1,
0.1481367, 0.1676054, 0.955169, 0, 0.7843137, 1, 1,
0.1518929, 0.4794846, 0.3793157, 0, 0.7764706, 1, 1,
0.154015, -0.3607369, 2.111547, 0, 0.772549, 1, 1,
0.1543351, 1.240919, -0.09472357, 0, 0.7647059, 1, 1,
0.1546116, 1.236502, 0.9185406, 0, 0.7607843, 1, 1,
0.15498, 0.909797, -0.004355683, 0, 0.7529412, 1, 1,
0.156247, -0.346822, 3.390845, 0, 0.7490196, 1, 1,
0.1604748, 0.2005195, 1.930268, 0, 0.7411765, 1, 1,
0.1622145, 1.836687, 0.8092805, 0, 0.7372549, 1, 1,
0.1667665, -0.7015457, 1.194801, 0, 0.7294118, 1, 1,
0.1709938, 1.438316, -1.032508, 0, 0.7254902, 1, 1,
0.1713653, 1.416447, 0.1883388, 0, 0.7176471, 1, 1,
0.1749612, -1.00146, 4.532242, 0, 0.7137255, 1, 1,
0.1768525, -0.8135901, 3.768407, 0, 0.7058824, 1, 1,
0.1800217, 0.6111063, -0.1517356, 0, 0.6980392, 1, 1,
0.1837822, 1.362678, 0.6975924, 0, 0.6941177, 1, 1,
0.1845706, 1.034726, -1.077996, 0, 0.6862745, 1, 1,
0.1866869, 0.8576104, 0.4116974, 0, 0.682353, 1, 1,
0.1870322, -1.536337, 1.151058, 0, 0.6745098, 1, 1,
0.1876219, -0.6976207, 4.464908, 0, 0.6705883, 1, 1,
0.1921286, 0.1123752, 0.9462804, 0, 0.6627451, 1, 1,
0.1928207, -0.2547563, 2.655163, 0, 0.6588235, 1, 1,
0.1944138, 1.55892, -0.6640221, 0, 0.6509804, 1, 1,
0.1952524, 0.2731073, 0.5150214, 0, 0.6470588, 1, 1,
0.2104568, 1.195303, -1.110882, 0, 0.6392157, 1, 1,
0.2124986, 1.010325, -0.2720963, 0, 0.6352941, 1, 1,
0.2125732, 0.1942772, 2.286858, 0, 0.627451, 1, 1,
0.2131629, -0.8886132, 1.944443, 0, 0.6235294, 1, 1,
0.2149236, 0.06720178, 2.979944, 0, 0.6156863, 1, 1,
0.2197586, -0.4210723, 3.385686, 0, 0.6117647, 1, 1,
0.2199783, -1.009681, 4.913245, 0, 0.6039216, 1, 1,
0.2202022, 0.7443351, 1.96834, 0, 0.5960785, 1, 1,
0.2217509, -0.6011716, 2.642499, 0, 0.5921569, 1, 1,
0.2222409, 0.1512899, -0.1924469, 0, 0.5843138, 1, 1,
0.222363, -0.2308287, 3.957664, 0, 0.5803922, 1, 1,
0.2234811, -0.1503596, 3.969285, 0, 0.572549, 1, 1,
0.2271191, -0.8984796, 2.143397, 0, 0.5686275, 1, 1,
0.2289907, -0.9157118, 2.92207, 0, 0.5607843, 1, 1,
0.2335259, -0.3196751, 2.142646, 0, 0.5568628, 1, 1,
0.2340849, 0.6067315, 0.8828036, 0, 0.5490196, 1, 1,
0.2343015, 0.6338307, -0.2200032, 0, 0.5450981, 1, 1,
0.234941, 0.5674045, -0.3736176, 0, 0.5372549, 1, 1,
0.2351206, -2.185047, 3.877967, 0, 0.5333334, 1, 1,
0.2353307, 1.243788, -0.840335, 0, 0.5254902, 1, 1,
0.2367414, -0.4940481, 3.415501, 0, 0.5215687, 1, 1,
0.2373834, 0.4692402, 1.166083, 0, 0.5137255, 1, 1,
0.2377075, -0.9748344, 2.814233, 0, 0.509804, 1, 1,
0.2377172, -1.463579, 3.036992, 0, 0.5019608, 1, 1,
0.2400122, -0.4308769, 0.6183117, 0, 0.4941176, 1, 1,
0.2422383, 1.408638, 0.4808157, 0, 0.4901961, 1, 1,
0.2472793, 0.1280624, 0.2423819, 0, 0.4823529, 1, 1,
0.2494244, 2.089826, -0.1684834, 0, 0.4784314, 1, 1,
0.2502332, 0.6506212, 2.247543, 0, 0.4705882, 1, 1,
0.2532338, 0.5463338, -1.020144, 0, 0.4666667, 1, 1,
0.255111, 1.187275, -1.210146, 0, 0.4588235, 1, 1,
0.256303, 0.2456239, 0.6118532, 0, 0.454902, 1, 1,
0.2579177, 0.3282994, 0.8332954, 0, 0.4470588, 1, 1,
0.259977, -0.1889033, 2.363254, 0, 0.4431373, 1, 1,
0.26351, -0.5749803, 2.025946, 0, 0.4352941, 1, 1,
0.2635165, 0.06159023, 1.829856, 0, 0.4313726, 1, 1,
0.2728606, -0.4239702, 2.376071, 0, 0.4235294, 1, 1,
0.2750678, -0.3834581, 3.272327, 0, 0.4196078, 1, 1,
0.2827435, -1.171994, 3.825119, 0, 0.4117647, 1, 1,
0.2831587, -1.889495, 3.142524, 0, 0.4078431, 1, 1,
0.2848225, 1.410028, 1.275391, 0, 0.4, 1, 1,
0.2877952, 1.184231, 0.5942073, 0, 0.3921569, 1, 1,
0.2900252, 0.6756094, 2.548569, 0, 0.3882353, 1, 1,
0.2903744, -0.5772416, 1.441124, 0, 0.3803922, 1, 1,
0.2906334, -0.08266571, 1.808789, 0, 0.3764706, 1, 1,
0.2911354, -0.4967395, 2.118507, 0, 0.3686275, 1, 1,
0.2962504, -1.668973, 3.782367, 0, 0.3647059, 1, 1,
0.2971839, 0.1784232, 1.570476, 0, 0.3568628, 1, 1,
0.2979698, 1.432277, -0.2450611, 0, 0.3529412, 1, 1,
0.301898, 1.471834, -0.6869192, 0, 0.345098, 1, 1,
0.3020364, -1.473968, 2.74439, 0, 0.3411765, 1, 1,
0.3024096, -0.7166134, 2.097929, 0, 0.3333333, 1, 1,
0.3060354, 1.097937, 0.6492133, 0, 0.3294118, 1, 1,
0.3116939, -0.1253381, 1.999445, 0, 0.3215686, 1, 1,
0.313119, -0.5630811, -0.06893343, 0, 0.3176471, 1, 1,
0.3141429, 1.232248, -0.1468005, 0, 0.3098039, 1, 1,
0.3159936, -0.2366171, 2.866632, 0, 0.3058824, 1, 1,
0.3187097, -0.1183776, 2.591632, 0, 0.2980392, 1, 1,
0.3192271, 1.739969, 1.980812, 0, 0.2901961, 1, 1,
0.3206423, 0.5786205, 0.2727831, 0, 0.2862745, 1, 1,
0.3241873, 0.8077244, 1.231262, 0, 0.2784314, 1, 1,
0.3269629, 1.781555, 0.2980187, 0, 0.2745098, 1, 1,
0.3350707, 2.029382, 0.5791783, 0, 0.2666667, 1, 1,
0.33785, -0.2492699, 2.335752, 0, 0.2627451, 1, 1,
0.3383175, -0.4538511, 1.892619, 0, 0.254902, 1, 1,
0.340889, 0.02015951, 2.023134, 0, 0.2509804, 1, 1,
0.3491547, -1.986745, 1.766059, 0, 0.2431373, 1, 1,
0.3504657, 0.02787433, 3.41802, 0, 0.2392157, 1, 1,
0.3596383, -0.1034631, 1.442523, 0, 0.2313726, 1, 1,
0.3596729, -0.05387988, 0.3811855, 0, 0.227451, 1, 1,
0.3660117, -0.5026914, 2.969995, 0, 0.2196078, 1, 1,
0.3676082, 2.276006, -0.4831019, 0, 0.2156863, 1, 1,
0.3710733, -1.390926, 1.258456, 0, 0.2078431, 1, 1,
0.3760447, 0.1098225, 1.683401, 0, 0.2039216, 1, 1,
0.3775231, 1.174599, -0.1506484, 0, 0.1960784, 1, 1,
0.3815529, 1.267327, 0.6447067, 0, 0.1882353, 1, 1,
0.3844332, 1.142144, -0.3151975, 0, 0.1843137, 1, 1,
0.385757, -1.300365, 3.062308, 0, 0.1764706, 1, 1,
0.3919888, -0.1549903, 1.858563, 0, 0.172549, 1, 1,
0.3923548, 1.32521, 0.804933, 0, 0.1647059, 1, 1,
0.3925974, 0.3387577, 1.397182, 0, 0.1607843, 1, 1,
0.39369, 1.042596, 0.7325512, 0, 0.1529412, 1, 1,
0.398052, -0.6270153, 3.414591, 0, 0.1490196, 1, 1,
0.4015175, 1.267689, -0.2242388, 0, 0.1411765, 1, 1,
0.4134889, 0.7706546, 0.6099923, 0, 0.1372549, 1, 1,
0.4219337, -0.05404697, 0.5913071, 0, 0.1294118, 1, 1,
0.4241128, -1.554674, 3.280775, 0, 0.1254902, 1, 1,
0.4256258, 0.7020565, 1.564058, 0, 0.1176471, 1, 1,
0.4257028, 1.217132, -0.281179, 0, 0.1137255, 1, 1,
0.429148, -1.429367, 2.67343, 0, 0.1058824, 1, 1,
0.4299329, 0.2051892, 0.6387882, 0, 0.09803922, 1, 1,
0.4402194, 0.3005677, -1.145831, 0, 0.09411765, 1, 1,
0.440798, -0.3091379, 2.207403, 0, 0.08627451, 1, 1,
0.4440557, -0.8193371, 3.368559, 0, 0.08235294, 1, 1,
0.4441103, -0.5773278, 2.75352, 0, 0.07450981, 1, 1,
0.4445402, -0.4280916, 1.410412, 0, 0.07058824, 1, 1,
0.4457068, -0.5015935, 2.339666, 0, 0.0627451, 1, 1,
0.4464725, 1.125484, 1.918027, 0, 0.05882353, 1, 1,
0.4487854, 0.09398422, 1.856358, 0, 0.05098039, 1, 1,
0.4492748, -0.2485956, 1.947657, 0, 0.04705882, 1, 1,
0.4532906, -0.1417101, 0.102635, 0, 0.03921569, 1, 1,
0.4570209, 0.1389915, 0.6169301, 0, 0.03529412, 1, 1,
0.4690663, 0.112108, 2.03788, 0, 0.02745098, 1, 1,
0.474361, -1.43254, 2.093926, 0, 0.02352941, 1, 1,
0.4750987, -0.4005631, 3.010203, 0, 0.01568628, 1, 1,
0.4761852, 0.4714147, -1.92456, 0, 0.01176471, 1, 1,
0.4786633, -1.254878, 2.833238, 0, 0.003921569, 1, 1,
0.4789079, 1.634442, 0.2004678, 0.003921569, 0, 1, 1,
0.4794554, -0.4552459, 1.259315, 0.007843138, 0, 1, 1,
0.4802493, -0.5601234, 1.567747, 0.01568628, 0, 1, 1,
0.4810585, -0.6387166, 1.790803, 0.01960784, 0, 1, 1,
0.4816284, 0.1700546, 0.5611349, 0.02745098, 0, 1, 1,
0.4828011, -0.3582541, 1.506832, 0.03137255, 0, 1, 1,
0.4842585, 0.2952538, 1.019242, 0.03921569, 0, 1, 1,
0.4845948, 0.629531, -0.5990106, 0.04313726, 0, 1, 1,
0.4855727, -0.5957441, 1.344941, 0.05098039, 0, 1, 1,
0.4898522, -0.1452352, 1.165097, 0.05490196, 0, 1, 1,
0.4902873, 0.4618778, 0.7816488, 0.0627451, 0, 1, 1,
0.4917921, -0.2190244, 2.124789, 0.06666667, 0, 1, 1,
0.4960701, -0.8364245, 2.912597, 0.07450981, 0, 1, 1,
0.4967583, 0.6438003, -0.8256198, 0.07843138, 0, 1, 1,
0.498213, -0.6265336, 1.832477, 0.08627451, 0, 1, 1,
0.5020967, -0.02339435, 1.70569, 0.09019608, 0, 1, 1,
0.5025966, -0.4290447, 0.7604614, 0.09803922, 0, 1, 1,
0.5031526, 0.1177758, 1.799768, 0.1058824, 0, 1, 1,
0.5054577, -1.183486, 2.443639, 0.1098039, 0, 1, 1,
0.5081541, -1.503649, 3.756952, 0.1176471, 0, 1, 1,
0.5120021, -0.3456612, 1.528862, 0.1215686, 0, 1, 1,
0.5130447, 0.9234512, 1.672344, 0.1294118, 0, 1, 1,
0.5163664, -0.4240045, 2.051151, 0.1333333, 0, 1, 1,
0.5176851, -0.5646162, 3.610573, 0.1411765, 0, 1, 1,
0.526585, 1.420108, -0.2733344, 0.145098, 0, 1, 1,
0.5316932, 0.0560578, 1.632368, 0.1529412, 0, 1, 1,
0.5337048, 0.01619039, 0.7538851, 0.1568628, 0, 1, 1,
0.5353577, -0.1678829, 1.65285, 0.1647059, 0, 1, 1,
0.5359053, -0.8060376, 3.533731, 0.1686275, 0, 1, 1,
0.5369955, -0.5236287, 3.216056, 0.1764706, 0, 1, 1,
0.5392914, -0.2792329, 1.758065, 0.1803922, 0, 1, 1,
0.5412828, -0.9751404, 3.778024, 0.1882353, 0, 1, 1,
0.5450798, -0.5722739, 3.65644, 0.1921569, 0, 1, 1,
0.5450854, -0.2775397, 2.285629, 0.2, 0, 1, 1,
0.5468468, -1.541542, 2.544691, 0.2078431, 0, 1, 1,
0.5497841, 0.5957399, 1.507888, 0.2117647, 0, 1, 1,
0.5546291, -1.022539, 1.918295, 0.2196078, 0, 1, 1,
0.5654045, -0.2378756, 2.594238, 0.2235294, 0, 1, 1,
0.5661633, 0.07099976, 2.117956, 0.2313726, 0, 1, 1,
0.5670436, 1.05995, -0.6320112, 0.2352941, 0, 1, 1,
0.56736, 1.186041, 1.509913, 0.2431373, 0, 1, 1,
0.5675095, -0.7988239, 2.773829, 0.2470588, 0, 1, 1,
0.5708244, -1.502389, 2.992822, 0.254902, 0, 1, 1,
0.5712684, -0.1433333, 1.04976, 0.2588235, 0, 1, 1,
0.5759083, 0.9831301, 1.193908, 0.2666667, 0, 1, 1,
0.5795952, 0.2383372, 1.225734, 0.2705882, 0, 1, 1,
0.5834162, -0.3265344, 1.86871, 0.2784314, 0, 1, 1,
0.5854966, 0.5638002, 0.372495, 0.282353, 0, 1, 1,
0.5897182, 0.5781369, 0.7645784, 0.2901961, 0, 1, 1,
0.5912837, -0.9420503, 4.02289, 0.2941177, 0, 1, 1,
0.5947696, -1.374761, 4.277501, 0.3019608, 0, 1, 1,
0.5962555, -1.053233, 1.61631, 0.3098039, 0, 1, 1,
0.5967938, 0.3564804, 2.912542, 0.3137255, 0, 1, 1,
0.5977452, -0.6559513, 0.9656298, 0.3215686, 0, 1, 1,
0.5984512, -0.3375916, 1.106847, 0.3254902, 0, 1, 1,
0.5986545, 1.506696, 1.060464, 0.3333333, 0, 1, 1,
0.6006194, 0.9202822, 2.510816, 0.3372549, 0, 1, 1,
0.6067914, -0.2026646, -0.5012233, 0.345098, 0, 1, 1,
0.6096864, 0.7559015, -1.236075, 0.3490196, 0, 1, 1,
0.6119946, -1.362986, 3.902415, 0.3568628, 0, 1, 1,
0.6185217, 0.5769014, 1.62853, 0.3607843, 0, 1, 1,
0.6192723, 1.325975, 1.26761, 0.3686275, 0, 1, 1,
0.6201762, -0.5898369, 0.1531193, 0.372549, 0, 1, 1,
0.6228752, -0.8185415, -0.009908488, 0.3803922, 0, 1, 1,
0.6246375, 0.3697731, 1.170142, 0.3843137, 0, 1, 1,
0.6267407, 0.2766012, 0.3417271, 0.3921569, 0, 1, 1,
0.6290067, -0.7403867, 4.129299, 0.3960784, 0, 1, 1,
0.6373084, -0.3396697, 3.236164, 0.4039216, 0, 1, 1,
0.6428121, -0.5782417, 3.691203, 0.4117647, 0, 1, 1,
0.6447389, -0.1473367, 1.350344, 0.4156863, 0, 1, 1,
0.6453744, -0.2463634, 2.470225, 0.4235294, 0, 1, 1,
0.645798, -1.093933, 2.82856, 0.427451, 0, 1, 1,
0.6458381, -1.594458, 2.984031, 0.4352941, 0, 1, 1,
0.6470814, -0.2193445, 1.897963, 0.4392157, 0, 1, 1,
0.6510491, -1.44255, 2.553091, 0.4470588, 0, 1, 1,
0.658338, -0.8572519, 0.08546809, 0.4509804, 0, 1, 1,
0.66123, -0.1239204, 2.933681, 0.4588235, 0, 1, 1,
0.6655897, 0.3331976, 2.56416, 0.4627451, 0, 1, 1,
0.671113, -1.350312, 2.887662, 0.4705882, 0, 1, 1,
0.6755861, -0.9152367, 1.284829, 0.4745098, 0, 1, 1,
0.6802489, 0.8707911, 0.1848421, 0.4823529, 0, 1, 1,
0.6822007, 0.9268214, -0.9214069, 0.4862745, 0, 1, 1,
0.6846899, -1.770559, 3.379949, 0.4941176, 0, 1, 1,
0.6889138, 0.5406861, -0.04882572, 0.5019608, 0, 1, 1,
0.6920859, -0.7747519, 3.235256, 0.5058824, 0, 1, 1,
0.6954126, 1.029046, -0.8013545, 0.5137255, 0, 1, 1,
0.6965995, 0.762353, -0.4225955, 0.5176471, 0, 1, 1,
0.6982834, 0.54635, 1.706879, 0.5254902, 0, 1, 1,
0.701939, 1.225911, -0.1139552, 0.5294118, 0, 1, 1,
0.7029431, 1.059731, 0.4638454, 0.5372549, 0, 1, 1,
0.7081931, -1.61579, 2.140871, 0.5411765, 0, 1, 1,
0.7125014, 0.4621841, 0.93908, 0.5490196, 0, 1, 1,
0.7217862, 0.7817387, 0.5879554, 0.5529412, 0, 1, 1,
0.7219049, 1.184312, 1.992952, 0.5607843, 0, 1, 1,
0.7232109, -0.1240476, 1.140314, 0.5647059, 0, 1, 1,
0.7240368, 0.5380146, 0.7712046, 0.572549, 0, 1, 1,
0.7292098, 0.08093848, 0.3361523, 0.5764706, 0, 1, 1,
0.7319322, -0.1010033, -0.05919274, 0.5843138, 0, 1, 1,
0.7382727, 0.9490865, -0.07042476, 0.5882353, 0, 1, 1,
0.7434645, -0.3795199, 2.616701, 0.5960785, 0, 1, 1,
0.7445858, -0.7774991, 1.631947, 0.6039216, 0, 1, 1,
0.7452715, -0.6750596, 3.09102, 0.6078432, 0, 1, 1,
0.7585066, 0.2602963, 1.490715, 0.6156863, 0, 1, 1,
0.7641475, 0.9331027, 1.972928, 0.6196079, 0, 1, 1,
0.7713861, 1.075618, 1.141407, 0.627451, 0, 1, 1,
0.7785726, 0.7002147, 3.007674, 0.6313726, 0, 1, 1,
0.7844368, 0.5615194, 2.139048, 0.6392157, 0, 1, 1,
0.7846245, -0.2356541, 1.016573, 0.6431373, 0, 1, 1,
0.7891402, 0.9381872, 1.557925, 0.6509804, 0, 1, 1,
0.7952082, 0.6890606, 1.066948, 0.654902, 0, 1, 1,
0.7977443, -1.672414, 2.334254, 0.6627451, 0, 1, 1,
0.7994768, 0.548162, 1.238316, 0.6666667, 0, 1, 1,
0.8015603, 1.084263, 2.104608, 0.6745098, 0, 1, 1,
0.8071781, -0.3571816, 0.2116995, 0.6784314, 0, 1, 1,
0.8099857, -2.347639, 3.921266, 0.6862745, 0, 1, 1,
0.8242053, 1.159827, 1.720602, 0.6901961, 0, 1, 1,
0.831017, 1.736204, 1.477097, 0.6980392, 0, 1, 1,
0.8319461, 0.2466284, 0.6996677, 0.7058824, 0, 1, 1,
0.8348128, -0.9581658, 0.1859602, 0.7098039, 0, 1, 1,
0.8359251, 0.8507538, -1.054844, 0.7176471, 0, 1, 1,
0.839075, -0.130067, 1.902492, 0.7215686, 0, 1, 1,
0.8399747, 0.3946356, -0.03969573, 0.7294118, 0, 1, 1,
0.850859, -1.124991, 2.665835, 0.7333333, 0, 1, 1,
0.8515972, 0.3701973, 0.7631037, 0.7411765, 0, 1, 1,
0.8526728, 0.3020408, 0.7365247, 0.7450981, 0, 1, 1,
0.8581763, 0.3162778, 0.9794985, 0.7529412, 0, 1, 1,
0.8604496, -0.2794045, 1.35583, 0.7568628, 0, 1, 1,
0.8632631, -0.2899098, 2.44437, 0.7647059, 0, 1, 1,
0.8639068, 0.5161241, 1.248787, 0.7686275, 0, 1, 1,
0.8718019, -0.7036034, 2.195261, 0.7764706, 0, 1, 1,
0.8836526, 1.049632, -0.7783377, 0.7803922, 0, 1, 1,
0.8857755, -0.2702879, 1.095934, 0.7882353, 0, 1, 1,
0.8867882, -0.3836283, 1.339616, 0.7921569, 0, 1, 1,
0.9044752, 0.1264331, 2.922719, 0.8, 0, 1, 1,
0.9071226, -0.3023947, 0.09341159, 0.8078431, 0, 1, 1,
0.9246952, 0.743728, 1.780842, 0.8117647, 0, 1, 1,
0.9322686, -0.1159209, 0.4572062, 0.8196079, 0, 1, 1,
0.9366022, 1.085772, 1.702441, 0.8235294, 0, 1, 1,
0.9493957, 0.09778664, 2.474738, 0.8313726, 0, 1, 1,
0.949852, 0.3177594, 1.199765, 0.8352941, 0, 1, 1,
0.9560025, -1.328986, 2.569826, 0.8431373, 0, 1, 1,
0.957659, -0.6739048, 2.024799, 0.8470588, 0, 1, 1,
0.9602016, -1.701356, 3.518253, 0.854902, 0, 1, 1,
0.9609443, -0.6388636, 1.608868, 0.8588235, 0, 1, 1,
0.9613305, -1.559552, 1.915146, 0.8666667, 0, 1, 1,
0.9626409, -0.3550979, 1.743263, 0.8705882, 0, 1, 1,
0.971438, -0.399082, 1.534117, 0.8784314, 0, 1, 1,
0.9722669, -0.1025692, 1.477193, 0.8823529, 0, 1, 1,
0.9736825, 0.7545231, 3.979388, 0.8901961, 0, 1, 1,
0.9784337, -1.13359, 3.298969, 0.8941177, 0, 1, 1,
0.9803736, -1.257933, 2.464574, 0.9019608, 0, 1, 1,
0.9852982, 1.14518, 3.392735, 0.9098039, 0, 1, 1,
0.9967233, 0.3791816, 3.542463, 0.9137255, 0, 1, 1,
0.9981902, -0.1832232, 3.008019, 0.9215686, 0, 1, 1,
1.000839, -0.06161078, 1.598783, 0.9254902, 0, 1, 1,
1.00247, -0.9843152, 1.956217, 0.9333333, 0, 1, 1,
1.004133, -0.4292577, 1.862047, 0.9372549, 0, 1, 1,
1.012058, 0.8154556, 1.039029, 0.945098, 0, 1, 1,
1.012533, -0.06491829, 1.409648, 0.9490196, 0, 1, 1,
1.012577, -2.108962, 4.363155, 0.9568627, 0, 1, 1,
1.018543, -0.8247095, 1.658812, 0.9607843, 0, 1, 1,
1.018777, -0.4550707, 2.649316, 0.9686275, 0, 1, 1,
1.02626, 0.03274067, 0.2928923, 0.972549, 0, 1, 1,
1.026417, -0.06797035, 0.6033347, 0.9803922, 0, 1, 1,
1.034826, -0.489878, 2.09575, 0.9843137, 0, 1, 1,
1.039522, 0.6073338, 1.373863, 0.9921569, 0, 1, 1,
1.053144, 0.3654573, 2.622874, 0.9960784, 0, 1, 1,
1.060821, -0.8031384, 2.110172, 1, 0, 0.9960784, 1,
1.062682, -0.03482752, 2.330603, 1, 0, 0.9882353, 1,
1.063911, -0.7978173, 1.657739, 1, 0, 0.9843137, 1,
1.064603, -0.7346075, 2.429326, 1, 0, 0.9764706, 1,
1.075386, -1.513379, 1.906868, 1, 0, 0.972549, 1,
1.078482, 1.040552, 1.141305, 1, 0, 0.9647059, 1,
1.078946, 0.4547036, 2.442943, 1, 0, 0.9607843, 1,
1.080796, -1.156421, 1.414638, 1, 0, 0.9529412, 1,
1.085155, -1.516079, 2.789107, 1, 0, 0.9490196, 1,
1.092004, -0.9033046, 2.033933, 1, 0, 0.9411765, 1,
1.103812, -0.3287012, 1.910892, 1, 0, 0.9372549, 1,
1.107523, -0.837245, 1.437196, 1, 0, 0.9294118, 1,
1.112638, -0.1794519, 2.416605, 1, 0, 0.9254902, 1,
1.118794, -0.1798064, 1.891348, 1, 0, 0.9176471, 1,
1.122046, 0.1470251, 1.681638, 1, 0, 0.9137255, 1,
1.122372, -0.8789467, 3.638999, 1, 0, 0.9058824, 1,
1.123065, -0.0417443, -0.5041016, 1, 0, 0.9019608, 1,
1.12503, -0.1261304, 0.9063454, 1, 0, 0.8941177, 1,
1.130019, -1.345716, 2.658157, 1, 0, 0.8862745, 1,
1.132544, -1.805405, 2.154858, 1, 0, 0.8823529, 1,
1.13342, -0.7973672, 2.784828, 1, 0, 0.8745098, 1,
1.141995, -0.3859069, 3.775968, 1, 0, 0.8705882, 1,
1.144779, 0.6728092, 0.5443998, 1, 0, 0.8627451, 1,
1.147993, 0.2355253, 1.202551, 1, 0, 0.8588235, 1,
1.150473, -1.030538, 3.152523, 1, 0, 0.8509804, 1,
1.153075, -0.3275535, 2.030437, 1, 0, 0.8470588, 1,
1.155437, 1.706986, -0.1671509, 1, 0, 0.8392157, 1,
1.157867, -0.1634185, 0.8867552, 1, 0, 0.8352941, 1,
1.160012, -1.220361, 1.031665, 1, 0, 0.827451, 1,
1.160978, 0.3788391, 1.82312, 1, 0, 0.8235294, 1,
1.161181, 1.316845, -0.1328081, 1, 0, 0.8156863, 1,
1.16711, 1.114064, -1.668069, 1, 0, 0.8117647, 1,
1.176888, 0.4117244, 1.154164, 1, 0, 0.8039216, 1,
1.177008, -1.134143, 2.423019, 1, 0, 0.7960784, 1,
1.179456, 1.226477, 1.263557, 1, 0, 0.7921569, 1,
1.181301, -1.611789, 4.407941, 1, 0, 0.7843137, 1,
1.181879, -1.542289, 1.176969, 1, 0, 0.7803922, 1,
1.18413, 0.2417502, -0.004962494, 1, 0, 0.772549, 1,
1.189265, -1.256708, 0.9703245, 1, 0, 0.7686275, 1,
1.194747, 0.3412547, 0.2753018, 1, 0, 0.7607843, 1,
1.204049, -1.429446, 2.734574, 1, 0, 0.7568628, 1,
1.205263, -0.8426623, 1.986865, 1, 0, 0.7490196, 1,
1.206358, -0.7138766, 2.576662, 1, 0, 0.7450981, 1,
1.208637, -0.1490135, 1.198486, 1, 0, 0.7372549, 1,
1.209194, 3.436723, -0.4062285, 1, 0, 0.7333333, 1,
1.223721, -2.862419, 5.231111, 1, 0, 0.7254902, 1,
1.227337, -0.6471223, 1.676484, 1, 0, 0.7215686, 1,
1.232916, -0.05675624, -0.8371649, 1, 0, 0.7137255, 1,
1.235744, 0.5065272, 0.2449061, 1, 0, 0.7098039, 1,
1.241273, -1.818449, 2.529817, 1, 0, 0.7019608, 1,
1.241308, -0.04060658, 2.066563, 1, 0, 0.6941177, 1,
1.255516, 2.010128, 1.682176, 1, 0, 0.6901961, 1,
1.255569, -0.1158066, 2.232128, 1, 0, 0.682353, 1,
1.258644, -0.175042, 1.909521, 1, 0, 0.6784314, 1,
1.261935, -1.297112, 2.463896, 1, 0, 0.6705883, 1,
1.262824, 0.1785863, 2.132569, 1, 0, 0.6666667, 1,
1.26364, 1.421777, -0.1408292, 1, 0, 0.6588235, 1,
1.29275, -2.394253, 2.7166, 1, 0, 0.654902, 1,
1.295598, 0.7797925, 0.882194, 1, 0, 0.6470588, 1,
1.303447, -0.4462668, 2.255165, 1, 0, 0.6431373, 1,
1.316249, 1.045919, 0.1151571, 1, 0, 0.6352941, 1,
1.318886, -1.62074, 3.129406, 1, 0, 0.6313726, 1,
1.322038, -0.2572443, 2.178156, 1, 0, 0.6235294, 1,
1.328896, -0.09509963, 2.536784, 1, 0, 0.6196079, 1,
1.334158, 0.7267146, 1.919081, 1, 0, 0.6117647, 1,
1.335846, -1.768553, 4.22429, 1, 0, 0.6078432, 1,
1.340352, 0.07759115, 1.893712, 1, 0, 0.6, 1,
1.342202, -0.516924, 2.095766, 1, 0, 0.5921569, 1,
1.34435, 0.7812467, 1.237951, 1, 0, 0.5882353, 1,
1.347194, -1.211344, 2.232653, 1, 0, 0.5803922, 1,
1.351147, 0.6945077, 1.812847, 1, 0, 0.5764706, 1,
1.354572, -0.6856274, 3.24174, 1, 0, 0.5686275, 1,
1.354697, -0.7318757, 2.017504, 1, 0, 0.5647059, 1,
1.356182, -2.051142, 2.632449, 1, 0, 0.5568628, 1,
1.363873, -0.8044763, 2.241989, 1, 0, 0.5529412, 1,
1.364845, 0.8122984, 0.8123791, 1, 0, 0.5450981, 1,
1.383383, 0.23237, 0.7571338, 1, 0, 0.5411765, 1,
1.386478, 0.02787742, 3.311594, 1, 0, 0.5333334, 1,
1.403891, -1.053599, 2.769722, 1, 0, 0.5294118, 1,
1.413249, 2.782323, 0.7578232, 1, 0, 0.5215687, 1,
1.414556, -0.9863396, 1.011463, 1, 0, 0.5176471, 1,
1.415932, -0.01711991, 1.318786, 1, 0, 0.509804, 1,
1.423738, -0.6178212, -0.05581767, 1, 0, 0.5058824, 1,
1.426668, -1.002516, 3.248238, 1, 0, 0.4980392, 1,
1.427569, -0.3263841, 1.613555, 1, 0, 0.4901961, 1,
1.427893, 0.3807108, 2.528605, 1, 0, 0.4862745, 1,
1.435936, 1.603058, 0.5941747, 1, 0, 0.4784314, 1,
1.441365, -0.7358935, 2.094933, 1, 0, 0.4745098, 1,
1.457223, 1.101565, 0.7407198, 1, 0, 0.4666667, 1,
1.462297, 0.8475231, 1.145253, 1, 0, 0.4627451, 1,
1.493401, -1.631064, 0.4025045, 1, 0, 0.454902, 1,
1.496488, -0.1675207, 1.180288, 1, 0, 0.4509804, 1,
1.498453, -0.9926209, 1.939387, 1, 0, 0.4431373, 1,
1.502792, 1.265928, 0.9488322, 1, 0, 0.4392157, 1,
1.505951, -1.414656, 2.688951, 1, 0, 0.4313726, 1,
1.506337, 0.6254414, 1.951947, 1, 0, 0.427451, 1,
1.507051, -0.1487805, 1.392246, 1, 0, 0.4196078, 1,
1.513971, 1.062927, 2.363591, 1, 0, 0.4156863, 1,
1.530365, -1.048205, 2.310349, 1, 0, 0.4078431, 1,
1.53099, 0.06009052, -0.4669908, 1, 0, 0.4039216, 1,
1.544934, -0.7274086, 1.539135, 1, 0, 0.3960784, 1,
1.548101, 1.046364, -0.05358937, 1, 0, 0.3882353, 1,
1.564129, -0.6316077, 1.598205, 1, 0, 0.3843137, 1,
1.564887, 2.087455, 1.112836, 1, 0, 0.3764706, 1,
1.571194, 0.7511523, 1.639565, 1, 0, 0.372549, 1,
1.573902, 1.72953, 1.094064, 1, 0, 0.3647059, 1,
1.574993, -0.3407416, 1.903841, 1, 0, 0.3607843, 1,
1.583669, 1.6904, 2.965504, 1, 0, 0.3529412, 1,
1.584528, 1.322928, 1.217381, 1, 0, 0.3490196, 1,
1.585738, 0.4928292, 0.9854226, 1, 0, 0.3411765, 1,
1.588545, 0.04286719, 2.559418, 1, 0, 0.3372549, 1,
1.613277, -0.7477147, 1.499574, 1, 0, 0.3294118, 1,
1.615026, 3.277602, -1.591526, 1, 0, 0.3254902, 1,
1.616991, 0.6943603, 1.465719, 1, 0, 0.3176471, 1,
1.639978, -1.126301, 2.247391, 1, 0, 0.3137255, 1,
1.648057, -0.2658302, 0.9698909, 1, 0, 0.3058824, 1,
1.657979, -2.011051, 2.715603, 1, 0, 0.2980392, 1,
1.699562, -0.1878989, 2.374968, 1, 0, 0.2941177, 1,
1.703406, -0.3990679, 3.209137, 1, 0, 0.2862745, 1,
1.742822, 0.03667233, 2.849921, 1, 0, 0.282353, 1,
1.746478, -1.990872, 2.841521, 1, 0, 0.2745098, 1,
1.808286, 0.01734733, 0.6260276, 1, 0, 0.2705882, 1,
1.810006, 0.3379334, 0.9684171, 1, 0, 0.2627451, 1,
1.811789, -1.938166, 4.108152, 1, 0, 0.2588235, 1,
1.82309, 0.573899, -1.24268, 1, 0, 0.2509804, 1,
1.839385, -0.7756329, 1.189804, 1, 0, 0.2470588, 1,
1.843446, -0.6459752, 2.194085, 1, 0, 0.2392157, 1,
1.890984, 0.4504283, 1.26464, 1, 0, 0.2352941, 1,
1.938455, -0.04984003, 2.037097, 1, 0, 0.227451, 1,
1.9491, -0.5457185, 2.629893, 1, 0, 0.2235294, 1,
1.974617, 1.684567, 1.13598, 1, 0, 0.2156863, 1,
1.99115, 0.3021368, -0.3240084, 1, 0, 0.2117647, 1,
1.993225, -0.4227357, 0.9523875, 1, 0, 0.2039216, 1,
1.996817, 0.4767025, 0.01298803, 1, 0, 0.1960784, 1,
2.011026, -0.02447956, 0.5372706, 1, 0, 0.1921569, 1,
2.017412, -0.3139181, 1.658826, 1, 0, 0.1843137, 1,
2.021649, 0.1876391, 1.918637, 1, 0, 0.1803922, 1,
2.034424, 1.273712, 2.245089, 1, 0, 0.172549, 1,
2.051107, 0.4737004, 1.846701, 1, 0, 0.1686275, 1,
2.068588, -0.4227104, 2.471036, 1, 0, 0.1607843, 1,
2.071075, -0.08676096, 2.043716, 1, 0, 0.1568628, 1,
2.078048, 2.007699, -1.634306, 1, 0, 0.1490196, 1,
2.12072, 0.2160933, 2.332676, 1, 0, 0.145098, 1,
2.123256, -0.2449493, 0.932606, 1, 0, 0.1372549, 1,
2.12627, -1.67649, 3.648206, 1, 0, 0.1333333, 1,
2.130078, -0.6006476, 1.706212, 1, 0, 0.1254902, 1,
2.145829, 1.602658, 0.5189408, 1, 0, 0.1215686, 1,
2.146422, -0.7571748, -0.005415718, 1, 0, 0.1137255, 1,
2.157116, 0.7913692, 0.5412336, 1, 0, 0.1098039, 1,
2.171108, 1.027978, 1.071191, 1, 0, 0.1019608, 1,
2.197427, 0.4195182, 3.864115, 1, 0, 0.09411765, 1,
2.220589, -0.8726796, 3.105472, 1, 0, 0.09019608, 1,
2.25306, 1.873477, 1.285287, 1, 0, 0.08235294, 1,
2.319231, 0.4471233, 4.012856, 1, 0, 0.07843138, 1,
2.332395, -0.2663187, 0.9280502, 1, 0, 0.07058824, 1,
2.355848, -0.1558554, 2.79079, 1, 0, 0.06666667, 1,
2.369045, -0.4650128, 1.917775, 1, 0, 0.05882353, 1,
2.369699, 0.01801052, 1.87691, 1, 0, 0.05490196, 1,
2.391389, -0.6012455, 2.039108, 1, 0, 0.04705882, 1,
2.543206, 0.3505998, 1.346285, 1, 0, 0.04313726, 1,
2.64474, 0.2730057, 2.387881, 1, 0, 0.03529412, 1,
2.656584, 1.041847, 1.635618, 1, 0, 0.03137255, 1,
2.793472, 0.6829052, 0.8133217, 1, 0, 0.02352941, 1,
2.953943, 0.7398844, 0.9078335, 1, 0, 0.01960784, 1,
3.024239, 0.5726151, 1.693222, 1, 0, 0.01176471, 1,
3.160193, -1.577661, 2.594386, 1, 0, 0.007843138, 1
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
-0.1862394, -4.500035, -6.90944, 0, -0.5, 0.5, 0.5,
-0.1862394, -4.500035, -6.90944, 1, -0.5, 0.5, 0.5,
-0.1862394, -4.500035, -6.90944, 1, 1.5, 0.5, 0.5,
-0.1862394, -4.500035, -6.90944, 0, 1.5, 0.5, 0.5
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
-4.667112, 0.04349577, -6.90944, 0, -0.5, 0.5, 0.5,
-4.667112, 0.04349577, -6.90944, 1, -0.5, 0.5, 0.5,
-4.667112, 0.04349577, -6.90944, 1, 1.5, 0.5, 0.5,
-4.667112, 0.04349577, -6.90944, 0, 1.5, 0.5, 0.5
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
-4.667112, -4.500035, 0.04062295, 0, -0.5, 0.5, 0.5,
-4.667112, -4.500035, 0.04062295, 1, -0.5, 0.5, 0.5,
-4.667112, -4.500035, 0.04062295, 1, 1.5, 0.5, 0.5,
-4.667112, -4.500035, 0.04062295, 0, 1.5, 0.5, 0.5
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
-3, -3.451528, -5.305579,
3, -3.451528, -5.305579,
-3, -3.451528, -5.305579,
-3, -3.626279, -5.572889,
-2, -3.451528, -5.305579,
-2, -3.626279, -5.572889,
-1, -3.451528, -5.305579,
-1, -3.626279, -5.572889,
0, -3.451528, -5.305579,
0, -3.626279, -5.572889,
1, -3.451528, -5.305579,
1, -3.626279, -5.572889,
2, -3.451528, -5.305579,
2, -3.626279, -5.572889,
3, -3.451528, -5.305579,
3, -3.626279, -5.572889
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
-3, -3.975782, -6.10751, 0, -0.5, 0.5, 0.5,
-3, -3.975782, -6.10751, 1, -0.5, 0.5, 0.5,
-3, -3.975782, -6.10751, 1, 1.5, 0.5, 0.5,
-3, -3.975782, -6.10751, 0, 1.5, 0.5, 0.5,
-2, -3.975782, -6.10751, 0, -0.5, 0.5, 0.5,
-2, -3.975782, -6.10751, 1, -0.5, 0.5, 0.5,
-2, -3.975782, -6.10751, 1, 1.5, 0.5, 0.5,
-2, -3.975782, -6.10751, 0, 1.5, 0.5, 0.5,
-1, -3.975782, -6.10751, 0, -0.5, 0.5, 0.5,
-1, -3.975782, -6.10751, 1, -0.5, 0.5, 0.5,
-1, -3.975782, -6.10751, 1, 1.5, 0.5, 0.5,
-1, -3.975782, -6.10751, 0, 1.5, 0.5, 0.5,
0, -3.975782, -6.10751, 0, -0.5, 0.5, 0.5,
0, -3.975782, -6.10751, 1, -0.5, 0.5, 0.5,
0, -3.975782, -6.10751, 1, 1.5, 0.5, 0.5,
0, -3.975782, -6.10751, 0, 1.5, 0.5, 0.5,
1, -3.975782, -6.10751, 0, -0.5, 0.5, 0.5,
1, -3.975782, -6.10751, 1, -0.5, 0.5, 0.5,
1, -3.975782, -6.10751, 1, 1.5, 0.5, 0.5,
1, -3.975782, -6.10751, 0, 1.5, 0.5, 0.5,
2, -3.975782, -6.10751, 0, -0.5, 0.5, 0.5,
2, -3.975782, -6.10751, 1, -0.5, 0.5, 0.5,
2, -3.975782, -6.10751, 1, 1.5, 0.5, 0.5,
2, -3.975782, -6.10751, 0, 1.5, 0.5, 0.5,
3, -3.975782, -6.10751, 0, -0.5, 0.5, 0.5,
3, -3.975782, -6.10751, 1, -0.5, 0.5, 0.5,
3, -3.975782, -6.10751, 1, 1.5, 0.5, 0.5,
3, -3.975782, -6.10751, 0, 1.5, 0.5, 0.5
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
-3.633065, -3, -5.305579,
-3.633065, 3, -5.305579,
-3.633065, -3, -5.305579,
-3.805406, -3, -5.572889,
-3.633065, -2, -5.305579,
-3.805406, -2, -5.572889,
-3.633065, -1, -5.305579,
-3.805406, -1, -5.572889,
-3.633065, 0, -5.305579,
-3.805406, 0, -5.572889,
-3.633065, 1, -5.305579,
-3.805406, 1, -5.572889,
-3.633065, 2, -5.305579,
-3.805406, 2, -5.572889,
-3.633065, 3, -5.305579,
-3.805406, 3, -5.572889
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
-4.150089, -3, -6.10751, 0, -0.5, 0.5, 0.5,
-4.150089, -3, -6.10751, 1, -0.5, 0.5, 0.5,
-4.150089, -3, -6.10751, 1, 1.5, 0.5, 0.5,
-4.150089, -3, -6.10751, 0, 1.5, 0.5, 0.5,
-4.150089, -2, -6.10751, 0, -0.5, 0.5, 0.5,
-4.150089, -2, -6.10751, 1, -0.5, 0.5, 0.5,
-4.150089, -2, -6.10751, 1, 1.5, 0.5, 0.5,
-4.150089, -2, -6.10751, 0, 1.5, 0.5, 0.5,
-4.150089, -1, -6.10751, 0, -0.5, 0.5, 0.5,
-4.150089, -1, -6.10751, 1, -0.5, 0.5, 0.5,
-4.150089, -1, -6.10751, 1, 1.5, 0.5, 0.5,
-4.150089, -1, -6.10751, 0, 1.5, 0.5, 0.5,
-4.150089, 0, -6.10751, 0, -0.5, 0.5, 0.5,
-4.150089, 0, -6.10751, 1, -0.5, 0.5, 0.5,
-4.150089, 0, -6.10751, 1, 1.5, 0.5, 0.5,
-4.150089, 0, -6.10751, 0, 1.5, 0.5, 0.5,
-4.150089, 1, -6.10751, 0, -0.5, 0.5, 0.5,
-4.150089, 1, -6.10751, 1, -0.5, 0.5, 0.5,
-4.150089, 1, -6.10751, 1, 1.5, 0.5, 0.5,
-4.150089, 1, -6.10751, 0, 1.5, 0.5, 0.5,
-4.150089, 2, -6.10751, 0, -0.5, 0.5, 0.5,
-4.150089, 2, -6.10751, 1, -0.5, 0.5, 0.5,
-4.150089, 2, -6.10751, 1, 1.5, 0.5, 0.5,
-4.150089, 2, -6.10751, 0, 1.5, 0.5, 0.5,
-4.150089, 3, -6.10751, 0, -0.5, 0.5, 0.5,
-4.150089, 3, -6.10751, 1, -0.5, 0.5, 0.5,
-4.150089, 3, -6.10751, 1, 1.5, 0.5, 0.5,
-4.150089, 3, -6.10751, 0, 1.5, 0.5, 0.5
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
-3.633065, -3.451528, -4,
-3.633065, -3.451528, 4,
-3.633065, -3.451528, -4,
-3.805406, -3.626279, -4,
-3.633065, -3.451528, -2,
-3.805406, -3.626279, -2,
-3.633065, -3.451528, 0,
-3.805406, -3.626279, 0,
-3.633065, -3.451528, 2,
-3.805406, -3.626279, 2,
-3.633065, -3.451528, 4,
-3.805406, -3.626279, 4
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
-4.150089, -3.975782, -4, 0, -0.5, 0.5, 0.5,
-4.150089, -3.975782, -4, 1, -0.5, 0.5, 0.5,
-4.150089, -3.975782, -4, 1, 1.5, 0.5, 0.5,
-4.150089, -3.975782, -4, 0, 1.5, 0.5, 0.5,
-4.150089, -3.975782, -2, 0, -0.5, 0.5, 0.5,
-4.150089, -3.975782, -2, 1, -0.5, 0.5, 0.5,
-4.150089, -3.975782, -2, 1, 1.5, 0.5, 0.5,
-4.150089, -3.975782, -2, 0, 1.5, 0.5, 0.5,
-4.150089, -3.975782, 0, 0, -0.5, 0.5, 0.5,
-4.150089, -3.975782, 0, 1, -0.5, 0.5, 0.5,
-4.150089, -3.975782, 0, 1, 1.5, 0.5, 0.5,
-4.150089, -3.975782, 0, 0, 1.5, 0.5, 0.5,
-4.150089, -3.975782, 2, 0, -0.5, 0.5, 0.5,
-4.150089, -3.975782, 2, 1, -0.5, 0.5, 0.5,
-4.150089, -3.975782, 2, 1, 1.5, 0.5, 0.5,
-4.150089, -3.975782, 2, 0, 1.5, 0.5, 0.5,
-4.150089, -3.975782, 4, 0, -0.5, 0.5, 0.5,
-4.150089, -3.975782, 4, 1, -0.5, 0.5, 0.5,
-4.150089, -3.975782, 4, 1, 1.5, 0.5, 0.5,
-4.150089, -3.975782, 4, 0, 1.5, 0.5, 0.5
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
-3.633065, -3.451528, -5.305579,
-3.633065, 3.53852, -5.305579,
-3.633065, -3.451528, 5.386825,
-3.633065, 3.53852, 5.386825,
-3.633065, -3.451528, -5.305579,
-3.633065, -3.451528, 5.386825,
-3.633065, 3.53852, -5.305579,
-3.633065, 3.53852, 5.386825,
-3.633065, -3.451528, -5.305579,
3.260586, -3.451528, -5.305579,
-3.633065, -3.451528, 5.386825,
3.260586, -3.451528, 5.386825,
-3.633065, 3.53852, -5.305579,
3.260586, 3.53852, -5.305579,
-3.633065, 3.53852, 5.386825,
3.260586, 3.53852, 5.386825,
3.260586, -3.451528, -5.305579,
3.260586, 3.53852, -5.305579,
3.260586, -3.451528, 5.386825,
3.260586, 3.53852, 5.386825,
3.260586, -3.451528, -5.305579,
3.260586, -3.451528, 5.386825,
3.260586, 3.53852, -5.305579,
3.260586, 3.53852, 5.386825
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
var radius = 7.751197;
var distance = 34.48595;
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
mvMatrix.translate( 0.1862394, -0.04349577, -0.04062295 );
mvMatrix.scale( 1.215719, 1.198954, 0.7838036 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48595);
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
sulphenone<-read.table("sulphenone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulphenone$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulphenone' not found
```

```r
y<-sulphenone$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulphenone' not found
```

```r
z<-sulphenone$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulphenone' not found
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
-3.532672, -1.411889, -2.819798, 0, 0, 1, 1, 1,
-2.971067, 0.9787849, -0.4536462, 1, 0, 0, 1, 1,
-2.889125, -0.06293056, -1.616502, 1, 0, 0, 1, 1,
-2.851752, -1.302048, -3.538266, 1, 0, 0, 1, 1,
-2.797952, -1.03119, -0.6512002, 1, 0, 0, 1, 1,
-2.741937, 0.4847222, 0.0259103, 1, 0, 0, 1, 1,
-2.67506, 1.257547, -2.407707, 0, 0, 0, 1, 1,
-2.669768, 0.7208868, -0.8726869, 0, 0, 0, 1, 1,
-2.622211, 0.8900845, -1.435961, 0, 0, 0, 1, 1,
-2.475793, -0.7773914, -2.247459, 0, 0, 0, 1, 1,
-2.433755, -1.224526, -0.2744826, 0, 0, 0, 1, 1,
-2.329936, -0.1094049, -1.117998, 0, 0, 0, 1, 1,
-2.267057, 0.6613579, -2.470431, 0, 0, 0, 1, 1,
-2.262136, 0.8436334, -1.455821, 1, 1, 1, 1, 1,
-2.245084, -1.37036, -1.910761, 1, 1, 1, 1, 1,
-2.231265, -1.936082, -1.70644, 1, 1, 1, 1, 1,
-2.21105, 0.6803726, 1.183024, 1, 1, 1, 1, 1,
-2.165558, -2.141888, -3.138451, 1, 1, 1, 1, 1,
-2.108011, 1.82006, -1.196712, 1, 1, 1, 1, 1,
-2.089185, 0.4195447, -1.961146, 1, 1, 1, 1, 1,
-2.045346, 0.724042, 0.2268744, 1, 1, 1, 1, 1,
-2.020236, 0.2419842, -1.898185, 1, 1, 1, 1, 1,
-2.018114, -0.8434961, -2.944361, 1, 1, 1, 1, 1,
-2.011196, -0.160916, -1.834849, 1, 1, 1, 1, 1,
-1.997782, -0.3991351, -0.3564902, 1, 1, 1, 1, 1,
-1.983846, 0.9596643, -1.083694, 1, 1, 1, 1, 1,
-1.983772, -0.3771104, -3.518949, 1, 1, 1, 1, 1,
-1.98081, 1.538399, -0.7790573, 1, 1, 1, 1, 1,
-1.977039, -0.3729439, -1.17975, 0, 0, 1, 1, 1,
-1.963889, 0.2599851, -0.02783609, 1, 0, 0, 1, 1,
-1.899687, -1.728612, -2.360719, 1, 0, 0, 1, 1,
-1.898737, -0.7061091, -2.639689, 1, 0, 0, 1, 1,
-1.898192, -1.067546, -2.147915, 1, 0, 0, 1, 1,
-1.893306, 0.7086601, -0.007050673, 1, 0, 0, 1, 1,
-1.839714, 0.462351, -2.085459, 0, 0, 0, 1, 1,
-1.835543, 1.091838, -0.7621932, 0, 0, 0, 1, 1,
-1.826581, -0.5951847, -0.1194673, 0, 0, 0, 1, 1,
-1.807403, 0.2728812, -1.664684, 0, 0, 0, 1, 1,
-1.787908, -2.842072, -4.685061, 0, 0, 0, 1, 1,
-1.774083, 1.122788, -1.656984, 0, 0, 0, 1, 1,
-1.762051, -2.041366, -1.317932, 0, 0, 0, 1, 1,
-1.754893, 1.317946, -0.8509066, 1, 1, 1, 1, 1,
-1.745408, 0.7129257, -0.2862143, 1, 1, 1, 1, 1,
-1.735725, -0.7052718, -0.6411607, 1, 1, 1, 1, 1,
-1.709153, -0.0448315, -1.468629, 1, 1, 1, 1, 1,
-1.706092, 0.378543, -1.134092, 1, 1, 1, 1, 1,
-1.695058, -0.6416063, -0.3827987, 1, 1, 1, 1, 1,
-1.69233, -0.1450484, -1.266661, 1, 1, 1, 1, 1,
-1.691691, -2.358692, -2.512568, 1, 1, 1, 1, 1,
-1.680519, -0.9830751, -1.609357, 1, 1, 1, 1, 1,
-1.66877, -0.1403647, -1.710555, 1, 1, 1, 1, 1,
-1.666978, 0.2796039, -1.326932, 1, 1, 1, 1, 1,
-1.666185, -0.1703739, -1.659444, 1, 1, 1, 1, 1,
-1.647669, 0.9419311, -0.3501551, 1, 1, 1, 1, 1,
-1.642264, -0.4135727, -1.790438, 1, 1, 1, 1, 1,
-1.619634, -0.2976847, -2.905564, 1, 1, 1, 1, 1,
-1.609418, -1.699516, -3.430979, 0, 0, 1, 1, 1,
-1.608637, 0.9517326, -1.018266, 1, 0, 0, 1, 1,
-1.601639, 0.2340883, -1.665927, 1, 0, 0, 1, 1,
-1.58984, 1.56692, -0.2984761, 1, 0, 0, 1, 1,
-1.5884, -0.4705399, -0.9331195, 1, 0, 0, 1, 1,
-1.576491, -0.9438241, -2.021578, 1, 0, 0, 1, 1,
-1.570638, -2.630266, -1.980428, 0, 0, 0, 1, 1,
-1.562724, -0.1184143, 0.1496135, 0, 0, 0, 1, 1,
-1.562247, -0.7162746, -1.06927, 0, 0, 0, 1, 1,
-1.551282, -0.9411418, -1.805778, 0, 0, 0, 1, 1,
-1.550525, -2.08121, -3.006896, 0, 0, 0, 1, 1,
-1.544529, 0.6211674, -1.469713, 0, 0, 0, 1, 1,
-1.530506, 1.373292, -1.248216, 0, 0, 0, 1, 1,
-1.514608, 0.1943169, -1.700765, 1, 1, 1, 1, 1,
-1.507399, -0.323099, -0.8911828, 1, 1, 1, 1, 1,
-1.501796, -0.3534923, -1.543763, 1, 1, 1, 1, 1,
-1.500539, -0.04827126, -3.234501, 1, 1, 1, 1, 1,
-1.488334, -0.2697717, -0.1840334, 1, 1, 1, 1, 1,
-1.465003, -0.3353395, -2.324031, 1, 1, 1, 1, 1,
-1.431935, 0.1039625, 0.1219066, 1, 1, 1, 1, 1,
-1.426158, 0.1132433, -2.695457, 1, 1, 1, 1, 1,
-1.42443, -1.522434, -2.859389, 1, 1, 1, 1, 1,
-1.39668, 1.401993, -1.792506, 1, 1, 1, 1, 1,
-1.394638, -0.02296138, -3.104718, 1, 1, 1, 1, 1,
-1.389655, -0.6874585, -3.063512, 1, 1, 1, 1, 1,
-1.388211, 1.087683, 0.4026996, 1, 1, 1, 1, 1,
-1.385314, 0.7555891, 1.93418, 1, 1, 1, 1, 1,
-1.369755, -1.654355, -4.594188, 1, 1, 1, 1, 1,
-1.369434, 0.6807429, 0.2279442, 0, 0, 1, 1, 1,
-1.366227, -2.936284, -4.099872, 1, 0, 0, 1, 1,
-1.364679, -0.8732426, -2.565271, 1, 0, 0, 1, 1,
-1.354843, -0.6333613, -2.350285, 1, 0, 0, 1, 1,
-1.354379, -0.3236237, -0.1464764, 1, 0, 0, 1, 1,
-1.351675, -0.4834791, -2.190705, 1, 0, 0, 1, 1,
-1.351127, 1.224394, -0.1004768, 0, 0, 0, 1, 1,
-1.348085, 2.389486, -0.6388333, 0, 0, 0, 1, 1,
-1.344051, 1.411023, -1.409151, 0, 0, 0, 1, 1,
-1.332189, 1.396349, -1.727589, 0, 0, 0, 1, 1,
-1.325579, -0.3993092, -0.7156, 0, 0, 0, 1, 1,
-1.319286, 0.5102662, -0.6029938, 0, 0, 0, 1, 1,
-1.31906, 0.528888, -1.433774, 0, 0, 0, 1, 1,
-1.317946, 2.097247, -3.842361, 1, 1, 1, 1, 1,
-1.308999, -0.1875138, -4.026213, 1, 1, 1, 1, 1,
-1.305792, -1.493696, -1.31309, 1, 1, 1, 1, 1,
-1.30554, -0.6068953, -1.806442, 1, 1, 1, 1, 1,
-1.305329, 0.2876816, -0.5855798, 1, 1, 1, 1, 1,
-1.3034, -0.02392612, -0.9563102, 1, 1, 1, 1, 1,
-1.279356, 0.5002158, 0.2503676, 1, 1, 1, 1, 1,
-1.2743, -0.8692921, -0.2937082, 1, 1, 1, 1, 1,
-1.273509, -0.6617591, -3.249052, 1, 1, 1, 1, 1,
-1.271878, 1.552719, -0.6184157, 1, 1, 1, 1, 1,
-1.268434, 1.548796, -1.326154, 1, 1, 1, 1, 1,
-1.266346, 1.261001, 0.4564338, 1, 1, 1, 1, 1,
-1.264869, 1.930221, 0.2840916, 1, 1, 1, 1, 1,
-1.263087, -1.164582, -1.042928, 1, 1, 1, 1, 1,
-1.259935, -0.4867112, -4.15649, 1, 1, 1, 1, 1,
-1.255384, -0.1752042, -2.43925, 0, 0, 1, 1, 1,
-1.249095, -0.7886559, -0.2475145, 1, 0, 0, 1, 1,
-1.247995, 0.1129273, -3.370942, 1, 0, 0, 1, 1,
-1.233998, -0.9914551, -3.713647, 1, 0, 0, 1, 1,
-1.232193, -1.068416, -1.836889, 1, 0, 0, 1, 1,
-1.226265, 0.4069806, -2.799915, 1, 0, 0, 1, 1,
-1.223758, -1.981207, -3.151822, 0, 0, 0, 1, 1,
-1.217254, 0.5518785, -1.37454, 0, 0, 0, 1, 1,
-1.216676, -1.262676, -1.439254, 0, 0, 0, 1, 1,
-1.215309, 0.09454154, -0.8023455, 0, 0, 0, 1, 1,
-1.211013, 1.438683, -0.9753436, 0, 0, 0, 1, 1,
-1.192333, -1.958566, -2.583135, 0, 0, 0, 1, 1,
-1.189253, -1.741708, -1.725159, 0, 0, 0, 1, 1,
-1.180687, -0.3786523, -1.197127, 1, 1, 1, 1, 1,
-1.177363, -0.4874358, -2.906724, 1, 1, 1, 1, 1,
-1.174377, -0.1708982, -0.7294204, 1, 1, 1, 1, 1,
-1.169154, 0.5326509, -2.713259, 1, 1, 1, 1, 1,
-1.163012, 3.23516, 2.678534, 1, 1, 1, 1, 1,
-1.160049, -0.2812382, -2.203206, 1, 1, 1, 1, 1,
-1.159665, 0.640051, -1.111478, 1, 1, 1, 1, 1,
-1.154996, 2.656965, -0.6717964, 1, 1, 1, 1, 1,
-1.154263, 1.521835, 1.790416, 1, 1, 1, 1, 1,
-1.152473, 0.3502645, -1.087381, 1, 1, 1, 1, 1,
-1.146383, -0.1306318, -0.2148663, 1, 1, 1, 1, 1,
-1.146244, -0.2713472, -2.195562, 1, 1, 1, 1, 1,
-1.141142, -0.2984465, -2.834378, 1, 1, 1, 1, 1,
-1.138605, 1.994686, 0.05944684, 1, 1, 1, 1, 1,
-1.135998, -0.4096903, -0.4284267, 1, 1, 1, 1, 1,
-1.135396, 2.849622, 0.5244824, 0, 0, 1, 1, 1,
-1.134309, -1.841481, -3.468098, 1, 0, 0, 1, 1,
-1.129972, -0.5496396, -2.20013, 1, 0, 0, 1, 1,
-1.122346, -0.1860117, -2.154036, 1, 0, 0, 1, 1,
-1.116107, 1.169891, -2.220579, 1, 0, 0, 1, 1,
-1.103884, -0.5595065, -3.067979, 1, 0, 0, 1, 1,
-1.103394, -1.372528, -2.319275, 0, 0, 0, 1, 1,
-1.099493, 1.09392, -0.1633683, 0, 0, 0, 1, 1,
-1.095212, 0.3966689, -0.232019, 0, 0, 0, 1, 1,
-1.094869, 0.6420034, 0.3344063, 0, 0, 0, 1, 1,
-1.093472, 1.147894, -2.052425, 0, 0, 0, 1, 1,
-1.090757, 0.3378902, -4.61525, 0, 0, 0, 1, 1,
-1.088243, -0.296081, -0.587687, 0, 0, 0, 1, 1,
-1.075833, 0.4579299, -2.831772, 1, 1, 1, 1, 1,
-1.075294, 0.1237457, -1.482438, 1, 1, 1, 1, 1,
-1.07506, 0.9622345, -1.18623, 1, 1, 1, 1, 1,
-1.065171, 1.281151, -0.9733281, 1, 1, 1, 1, 1,
-1.064992, 1.47087, 0.07530875, 1, 1, 1, 1, 1,
-1.060615, -0.1099341, 0.02881977, 1, 1, 1, 1, 1,
-1.059929, 0.6748888, -0.127488, 1, 1, 1, 1, 1,
-1.046315, 0.3033977, -0.6736755, 1, 1, 1, 1, 1,
-1.045993, 1.233627, -2.506256, 1, 1, 1, 1, 1,
-1.039733, -0.1521218, -3.909801, 1, 1, 1, 1, 1,
-1.037724, -0.0998987, -2.419807, 1, 1, 1, 1, 1,
-1.035863, 0.2343384, 0.2608345, 1, 1, 1, 1, 1,
-1.032552, 2.063966, -0.879961, 1, 1, 1, 1, 1,
-1.029374, 0.263051, -1.295532, 1, 1, 1, 1, 1,
-1.0247, -3.349731, -2.758623, 1, 1, 1, 1, 1,
-1.020111, -1.918578, -2.226808, 0, 0, 1, 1, 1,
-1.019245, -0.3762362, -1.158547, 1, 0, 0, 1, 1,
-1.016619, 0.9084328, -1.579416, 1, 0, 0, 1, 1,
-1.011285, -1.550628, -2.174964, 1, 0, 0, 1, 1,
-1.008483, -0.5511011, -0.1934284, 1, 0, 0, 1, 1,
-0.996217, -1.235833, -1.880963, 1, 0, 0, 1, 1,
-0.9943123, -0.5939529, -2.649002, 0, 0, 0, 1, 1,
-0.9942255, -0.4042964, -2.877911, 0, 0, 0, 1, 1,
-0.9897221, -0.02482771, -0.6112012, 0, 0, 0, 1, 1,
-0.9881917, 0.2848094, -1.539394, 0, 0, 0, 1, 1,
-0.9825438, 0.05762721, -1.35318, 0, 0, 0, 1, 1,
-0.9817327, -0.004633785, -1.881706, 0, 0, 0, 1, 1,
-0.9799659, 0.7470241, -2.114782, 0, 0, 0, 1, 1,
-0.9759028, -0.8792375, -2.387044, 1, 1, 1, 1, 1,
-0.9746749, 0.6160163, -1.461377, 1, 1, 1, 1, 1,
-0.9744155, 0.3205106, -0.6361726, 1, 1, 1, 1, 1,
-0.9537705, 0.3591049, -0.04701266, 1, 1, 1, 1, 1,
-0.9467854, -1.47721, -2.048048, 1, 1, 1, 1, 1,
-0.9437042, -0.1358294, -1.746987, 1, 1, 1, 1, 1,
-0.9418169, -0.1493163, -1.97954, 1, 1, 1, 1, 1,
-0.939755, -1.101367, -1.979403, 1, 1, 1, 1, 1,
-0.9382401, -0.1770412, -0.834803, 1, 1, 1, 1, 1,
-0.9375852, -0.4730124, -0.1382679, 1, 1, 1, 1, 1,
-0.9299858, 1.734695, -0.3163999, 1, 1, 1, 1, 1,
-0.9286125, 0.2685956, -1.91845, 1, 1, 1, 1, 1,
-0.9281512, -0.6380259, -1.565367, 1, 1, 1, 1, 1,
-0.9257348, -1.141718, -3.537335, 1, 1, 1, 1, 1,
-0.9220502, 0.8936412, -1.379327, 1, 1, 1, 1, 1,
-0.9146875, 1.717444, -2.043872, 0, 0, 1, 1, 1,
-0.9112526, 0.37388, -2.245795, 1, 0, 0, 1, 1,
-0.9072151, -0.5442312, -2.479023, 1, 0, 0, 1, 1,
-0.9024391, -0.6434177, -1.040524, 1, 0, 0, 1, 1,
-0.8998581, -0.6703176, -3.903233, 1, 0, 0, 1, 1,
-0.8987404, -1.319102, -3.817037, 1, 0, 0, 1, 1,
-0.891282, -0.4299721, -0.6667279, 0, 0, 0, 1, 1,
-0.8896111, -0.2945061, -0.1767385, 0, 0, 0, 1, 1,
-0.887917, -0.6625342, -2.02192, 0, 0, 0, 1, 1,
-0.8872174, 1.165005, 0.1959734, 0, 0, 0, 1, 1,
-0.8715506, 0.1057708, -2.376779, 0, 0, 0, 1, 1,
-0.8590373, -0.9611045, -2.133289, 0, 0, 0, 1, 1,
-0.8578314, -2.120682, -3.509947, 0, 0, 0, 1, 1,
-0.8529284, 0.236444, -1.960382, 1, 1, 1, 1, 1,
-0.8497529, -0.9264445, -2.675068, 1, 1, 1, 1, 1,
-0.8407069, 0.7492737, 1.192753, 1, 1, 1, 1, 1,
-0.8341482, 0.3717621, 0.6511915, 1, 1, 1, 1, 1,
-0.8341313, -2.616184, -4.169757, 1, 1, 1, 1, 1,
-0.8305815, -0.1583144, -2.116205, 1, 1, 1, 1, 1,
-0.8175054, 0.8197676, -1.056399, 1, 1, 1, 1, 1,
-0.8152031, -0.03530473, 0.02770941, 1, 1, 1, 1, 1,
-0.8099402, -1.72228, -2.856494, 1, 1, 1, 1, 1,
-0.8059254, -1.896496, -2.166763, 1, 1, 1, 1, 1,
-0.8032219, 0.05706098, -1.813953, 1, 1, 1, 1, 1,
-0.8001186, -0.4273689, -1.524292, 1, 1, 1, 1, 1,
-0.7978194, -0.6111978, -1.191615, 1, 1, 1, 1, 1,
-0.7946904, -0.6194189, -1.123874, 1, 1, 1, 1, 1,
-0.7921321, -0.3207566, -1.535799, 1, 1, 1, 1, 1,
-0.7855052, 0.3081544, -0.2463222, 0, 0, 1, 1, 1,
-0.7854092, -1.844983, -1.41827, 1, 0, 0, 1, 1,
-0.7841666, 0.4461756, -2.635758, 1, 0, 0, 1, 1,
-0.782775, 0.852547, 0.2821816, 1, 0, 0, 1, 1,
-0.7813984, -0.1666821, -1.062924, 1, 0, 0, 1, 1,
-0.7809881, 1.787262, -0.309904, 1, 0, 0, 1, 1,
-0.780496, 1.013656, -0.5755427, 0, 0, 0, 1, 1,
-0.7804921, 1.540559, -2.710135, 0, 0, 0, 1, 1,
-0.7723819, 0.8664983, -0.7454153, 0, 0, 0, 1, 1,
-0.7702936, -0.3455333, -1.378924, 0, 0, 0, 1, 1,
-0.7631853, -0.9729991, -2.328131, 0, 0, 0, 1, 1,
-0.7616938, 0.8244938, -0.831135, 0, 0, 0, 1, 1,
-0.7597548, 2.766112, 0.04815785, 0, 0, 0, 1, 1,
-0.7557603, -1.256149, -2.826176, 1, 1, 1, 1, 1,
-0.754788, -0.187371, -1.540683, 1, 1, 1, 1, 1,
-0.7500763, -2.045831, -1.524839, 1, 1, 1, 1, 1,
-0.7483802, 1.011399, -0.9058642, 1, 1, 1, 1, 1,
-0.7475756, -1.222298, -4.534813, 1, 1, 1, 1, 1,
-0.7444427, -0.6239277, -2.205626, 1, 1, 1, 1, 1,
-0.7386774, 0.8679221, -0.863818, 1, 1, 1, 1, 1,
-0.7324995, 0.2711048, -1.66302, 1, 1, 1, 1, 1,
-0.7317103, -0.206021, -2.840915, 1, 1, 1, 1, 1,
-0.7266173, 0.6808327, -1.495678, 1, 1, 1, 1, 1,
-0.7262109, 0.04713742, -0.2568564, 1, 1, 1, 1, 1,
-0.7150514, -0.03857286, -1.457618, 1, 1, 1, 1, 1,
-0.7098235, -0.4035773, -1.459764, 1, 1, 1, 1, 1,
-0.7066326, -1.196892, -1.293733, 1, 1, 1, 1, 1,
-0.7006534, 1.112968, -1.194988, 1, 1, 1, 1, 1,
-0.6935505, 0.7193793, -2.633857, 0, 0, 1, 1, 1,
-0.6892257, 2.332019, 2.422866, 1, 0, 0, 1, 1,
-0.6838371, 2.899177, -0.7524489, 1, 0, 0, 1, 1,
-0.6811564, -0.8148791, -3.763251, 1, 0, 0, 1, 1,
-0.6771346, -0.5693173, -0.8521034, 1, 0, 0, 1, 1,
-0.676352, 0.6419179, -0.2898779, 1, 0, 0, 1, 1,
-0.6722011, 2.212448, -0.5221176, 0, 0, 0, 1, 1,
-0.671873, -1.358612, -2.669206, 0, 0, 0, 1, 1,
-0.6655202, 0.1547979, -2.196215, 0, 0, 0, 1, 1,
-0.6636884, -0.211685, -0.9361211, 0, 0, 0, 1, 1,
-0.6635508, -0.6060582, -2.726518, 0, 0, 0, 1, 1,
-0.6620269, -1.220474, -1.687498, 0, 0, 0, 1, 1,
-0.6546519, 2.26533, -0.03978524, 0, 0, 0, 1, 1,
-0.6480946, -0.6185763, -2.664822, 1, 1, 1, 1, 1,
-0.6427557, -0.1069068, -1.487589, 1, 1, 1, 1, 1,
-0.6395946, 0.9516826, -1.35449, 1, 1, 1, 1, 1,
-0.6393396, -0.1145732, -0.8686721, 1, 1, 1, 1, 1,
-0.6360496, 0.8011944, 0.949445, 1, 1, 1, 1, 1,
-0.633582, -0.320415, -2.680958, 1, 1, 1, 1, 1,
-0.6311038, 0.3600065, -0.495113, 1, 1, 1, 1, 1,
-0.6233979, -0.7836974, -2.019499, 1, 1, 1, 1, 1,
-0.6071876, 0.5627979, -1.442556, 1, 1, 1, 1, 1,
-0.6033184, -0.2014358, -2.675495, 1, 1, 1, 1, 1,
-0.5985862, 0.8481306, -0.729567, 1, 1, 1, 1, 1,
-0.5964426, 0.3397402, -1.730062, 1, 1, 1, 1, 1,
-0.5887449, -0.3538715, -1.701105, 1, 1, 1, 1, 1,
-0.577461, -0.2731622, -2.089144, 1, 1, 1, 1, 1,
-0.5740417, -0.2260739, -1.25168, 1, 1, 1, 1, 1,
-0.5735506, -0.4818377, -2.74939, 0, 0, 1, 1, 1,
-0.5705236, 0.8585475, -0.3889254, 1, 0, 0, 1, 1,
-0.5670928, 1.961578, -1.492349, 1, 0, 0, 1, 1,
-0.5665443, -1.899702, -2.108839, 1, 0, 0, 1, 1,
-0.5657021, -0.4890533, -3.641459, 1, 0, 0, 1, 1,
-0.5643208, 0.4348928, -0.8232418, 1, 0, 0, 1, 1,
-0.5639394, -0.2669529, -1.844529, 0, 0, 0, 1, 1,
-0.5602427, 2.376453, -0.9427373, 0, 0, 0, 1, 1,
-0.5569474, -0.6158718, -3.904202, 0, 0, 0, 1, 1,
-0.5564344, 1.705495, -1.345838, 0, 0, 0, 1, 1,
-0.5544807, -0.5744993, -2.810893, 0, 0, 0, 1, 1,
-0.5525339, 1.2199, -1.191196, 0, 0, 0, 1, 1,
-0.5509733, -0.5993278, -2.42029, 0, 0, 0, 1, 1,
-0.548071, -0.3499825, -2.258874, 1, 1, 1, 1, 1,
-0.5445267, -0.9569299, -4.337733, 1, 1, 1, 1, 1,
-0.5416024, -1.986371, -2.95627, 1, 1, 1, 1, 1,
-0.5382691, -0.5097568, -2.263455, 1, 1, 1, 1, 1,
-0.5226098, -1.224712, -4.345541, 1, 1, 1, 1, 1,
-0.5154713, -0.1109348, -1.481395, 1, 1, 1, 1, 1,
-0.5107819, -1.539788, -2.812646, 1, 1, 1, 1, 1,
-0.5098366, -0.3613383, -1.836266, 1, 1, 1, 1, 1,
-0.5060691, 0.7332239, -2.207565, 1, 1, 1, 1, 1,
-0.5004815, 0.5235929, -0.3896692, 1, 1, 1, 1, 1,
-0.4972759, -0.3229111, -2.139212, 1, 1, 1, 1, 1,
-0.4913877, 1.290035, -1.978091, 1, 1, 1, 1, 1,
-0.4858378, 0.2425021, -0.4749385, 1, 1, 1, 1, 1,
-0.4809697, -0.1888865, -1.805229, 1, 1, 1, 1, 1,
-0.4790927, 0.2672693, -1.914058, 1, 1, 1, 1, 1,
-0.4772919, -0.8015128, -1.556115, 0, 0, 1, 1, 1,
-0.4717859, 0.07271104, -2.075728, 1, 0, 0, 1, 1,
-0.4711233, 0.7500616, -0.3487554, 1, 0, 0, 1, 1,
-0.4696637, 0.1492777, -2.63103, 1, 0, 0, 1, 1,
-0.4625019, -1.135486, -3.696328, 1, 0, 0, 1, 1,
-0.4624033, -1.196457, -2.805825, 1, 0, 0, 1, 1,
-0.4570377, 3.412808, -0.01016465, 0, 0, 0, 1, 1,
-0.4528891, -0.4870731, -1.320759, 0, 0, 0, 1, 1,
-0.4508528, 0.001877659, -0.6216114, 0, 0, 0, 1, 1,
-0.4474345, 0.04364643, -1.197564, 0, 0, 0, 1, 1,
-0.4466628, -0.1207437, -1.015407, 0, 0, 0, 1, 1,
-0.4438331, -0.6370781, -4.866543, 0, 0, 0, 1, 1,
-0.443778, -0.4301974, -1.776825, 0, 0, 0, 1, 1,
-0.4434808, -0.4996622, -2.554942, 1, 1, 1, 1, 1,
-0.4382647, 0.949784, -0.1872636, 1, 1, 1, 1, 1,
-0.4380903, 0.04268034, -2.43158, 1, 1, 1, 1, 1,
-0.4372783, 0.3963827, -1.315753, 1, 1, 1, 1, 1,
-0.430514, 1.251531, 1.838858, 1, 1, 1, 1, 1,
-0.4228603, 0.3177438, -1.185176, 1, 1, 1, 1, 1,
-0.4218035, 0.5747692, 0.6380348, 1, 1, 1, 1, 1,
-0.4155675, -0.2196813, -2.236961, 1, 1, 1, 1, 1,
-0.4098627, 0.4452259, -1.214963, 1, 1, 1, 1, 1,
-0.4060291, -0.9127088, -3.433189, 1, 1, 1, 1, 1,
-0.3998223, -0.6879237, -1.731501, 1, 1, 1, 1, 1,
-0.3970081, -0.397378, -2.343508, 1, 1, 1, 1, 1,
-0.3962007, 0.7627455, 0.2608211, 1, 1, 1, 1, 1,
-0.3954915, -2.196808, -1.576927, 1, 1, 1, 1, 1,
-0.3925441, -1.61111, -2.452153, 1, 1, 1, 1, 1,
-0.3895, -1.738043, -3.416506, 0, 0, 1, 1, 1,
-0.3890746, -0.5370388, -3.11592, 1, 0, 0, 1, 1,
-0.3888286, 0.8002296, -0.620661, 1, 0, 0, 1, 1,
-0.3882998, -0.07801639, -0.8514808, 1, 0, 0, 1, 1,
-0.3863007, 1.494064, 1.108048, 1, 0, 0, 1, 1,
-0.384471, 0.766369, -1.801895, 1, 0, 0, 1, 1,
-0.3752134, 0.9707332, -2.075165, 0, 0, 0, 1, 1,
-0.373449, 0.7884886, -1.136532, 0, 0, 0, 1, 1,
-0.3680766, -0.5991352, -3.220085, 0, 0, 0, 1, 1,
-0.3662889, 0.7599535, -0.4373012, 0, 0, 0, 1, 1,
-0.3636677, 0.2765731, -0.4576801, 0, 0, 0, 1, 1,
-0.363663, -0.619364, -4.104213, 0, 0, 0, 1, 1,
-0.3581727, 0.9567614, -0.3423878, 0, 0, 0, 1, 1,
-0.3554958, 0.6647258, -0.8851108, 1, 1, 1, 1, 1,
-0.3542221, -0.9178795, -5.149865, 1, 1, 1, 1, 1,
-0.3514447, -0.3813981, -3.093756, 1, 1, 1, 1, 1,
-0.3500449, 1.225287, -1.981914, 1, 1, 1, 1, 1,
-0.3437187, 2.63978, 0.2343327, 1, 1, 1, 1, 1,
-0.3432289, 0.5498125, -1.091384, 1, 1, 1, 1, 1,
-0.342502, 0.4771091, -0.5414622, 1, 1, 1, 1, 1,
-0.3420334, -0.7314592, -1.074991, 1, 1, 1, 1, 1,
-0.3195397, 0.2187151, 0.5927081, 1, 1, 1, 1, 1,
-0.3180559, -1.947095, -2.143477, 1, 1, 1, 1, 1,
-0.3165538, 0.9636219, -1.053189, 1, 1, 1, 1, 1,
-0.3147855, 0.1560492, -1.021936, 1, 1, 1, 1, 1,
-0.3112245, 0.9165276, -0.7088758, 1, 1, 1, 1, 1,
-0.3110821, -1.86958, -2.407637, 1, 1, 1, 1, 1,
-0.3084417, 0.5354028, -1.475692, 1, 1, 1, 1, 1,
-0.3052372, -0.9252935, -5.062086, 0, 0, 1, 1, 1,
-0.3019164, 0.1840123, -1.192558, 1, 0, 0, 1, 1,
-0.3013387, -1.448258, -2.655191, 1, 0, 0, 1, 1,
-0.2949369, -0.6861787, -1.97587, 1, 0, 0, 1, 1,
-0.2938364, -0.3739855, -3.099236, 1, 0, 0, 1, 1,
-0.2925069, -0.2755737, -1.882949, 1, 0, 0, 1, 1,
-0.2924562, -2.581325, -4.044318, 0, 0, 0, 1, 1,
-0.2904293, 1.247252, -1.223043, 0, 0, 0, 1, 1,
-0.2883363, -0.2826035, -2.573884, 0, 0, 0, 1, 1,
-0.2767052, 0.4295213, 0.6300107, 0, 0, 0, 1, 1,
-0.2765783, -0.5142341, -1.403749, 0, 0, 0, 1, 1,
-0.272254, 1.169472, 0.2518629, 0, 0, 0, 1, 1,
-0.2722496, 0.9727424, -0.500097, 0, 0, 0, 1, 1,
-0.2647876, 0.6551428, 0.5219384, 1, 1, 1, 1, 1,
-0.264314, -1.678918, -2.744745, 1, 1, 1, 1, 1,
-0.2625776, 1.315442, -0.6165524, 1, 1, 1, 1, 1,
-0.2516963, -0.4366614, -3.557847, 1, 1, 1, 1, 1,
-0.2512056, -1.239745, -2.1632, 1, 1, 1, 1, 1,
-0.2510306, -0.1530948, -1.955375, 1, 1, 1, 1, 1,
-0.2503225, 0.3922693, -0.4536169, 1, 1, 1, 1, 1,
-0.2468181, 0.08701129, -1.830735, 1, 1, 1, 1, 1,
-0.2347848, 0.293283, -1.537264, 1, 1, 1, 1, 1,
-0.2338975, -0.7489527, -3.353451, 1, 1, 1, 1, 1,
-0.2332141, 0.9556497, -0.7395536, 1, 1, 1, 1, 1,
-0.2309811, 1.12376, 0.3985224, 1, 1, 1, 1, 1,
-0.2242706, 0.1254483, -1.854, 1, 1, 1, 1, 1,
-0.2212909, 1.099058, -0.04802665, 1, 1, 1, 1, 1,
-0.2211085, -0.941499, -1.282177, 1, 1, 1, 1, 1,
-0.2206993, -0.1301046, -2.002356, 0, 0, 1, 1, 1,
-0.2180748, 0.4468313, -1.819138, 1, 0, 0, 1, 1,
-0.2175219, 1.41054, 1.19208, 1, 0, 0, 1, 1,
-0.2173247, 0.3883506, -0.006106217, 1, 0, 0, 1, 1,
-0.2157987, -0.596247, -1.624143, 1, 0, 0, 1, 1,
-0.2157644, 0.6030666, -0.3145351, 1, 0, 0, 1, 1,
-0.2122704, 0.5776486, -1.283386, 0, 0, 0, 1, 1,
-0.2099531, 0.8970344, -1.308423, 0, 0, 0, 1, 1,
-0.1973334, -2.040992, -2.796085, 0, 0, 0, 1, 1,
-0.1951024, 0.05565358, -1.204398, 0, 0, 0, 1, 1,
-0.1919994, -0.3587251, -4.063844, 0, 0, 0, 1, 1,
-0.1919075, 0.1986441, -1.854111, 0, 0, 0, 1, 1,
-0.186829, -1.212887, -3.060175, 0, 0, 0, 1, 1,
-0.1865117, -1.68492, -2.820848, 1, 1, 1, 1, 1,
-0.1820716, -2.029376, -3.33822, 1, 1, 1, 1, 1,
-0.1815237, -0.1731707, -0.2934427, 1, 1, 1, 1, 1,
-0.1804853, -0.07843485, -3.041806, 1, 1, 1, 1, 1,
-0.179379, 1.697109, -1.16715, 1, 1, 1, 1, 1,
-0.1792005, -0.5517099, -2.815746, 1, 1, 1, 1, 1,
-0.1785049, -1.041301, -4.350045, 1, 1, 1, 1, 1,
-0.1781172, -0.4345975, -4.061561, 1, 1, 1, 1, 1,
-0.1763762, -0.4508418, -3.516513, 1, 1, 1, 1, 1,
-0.1746489, -0.06923179, -1.526871, 1, 1, 1, 1, 1,
-0.1743479, 0.6992383, -0.7217753, 1, 1, 1, 1, 1,
-0.1682279, 2.102012, 0.05523267, 1, 1, 1, 1, 1,
-0.1678885, -0.6100754, -0.9611509, 1, 1, 1, 1, 1,
-0.1596547, -0.110434, -4.256094, 1, 1, 1, 1, 1,
-0.159618, -0.04493726, -3.451454, 1, 1, 1, 1, 1,
-0.1585483, -2.341388, -2.56703, 0, 0, 1, 1, 1,
-0.1564026, 0.6600789, -2.066822, 1, 0, 0, 1, 1,
-0.1540187, -0.4282181, -0.04413661, 1, 0, 0, 1, 1,
-0.1488318, 0.1129605, 1.588776, 1, 0, 0, 1, 1,
-0.1484984, 1.822787, 1.423009, 1, 0, 0, 1, 1,
-0.1474738, 1.22591, -0.125304, 1, 0, 0, 1, 1,
-0.1472802, -1.289444, -1.775509, 0, 0, 0, 1, 1,
-0.1467652, 0.3002607, 1.109343, 0, 0, 0, 1, 1,
-0.1424871, -0.8596284, -2.098035, 0, 0, 0, 1, 1,
-0.141047, -1.09505, -2.760274, 0, 0, 0, 1, 1,
-0.1402267, -0.2348453, -2.310602, 0, 0, 0, 1, 1,
-0.1392016, -0.3562627, -3.215017, 0, 0, 0, 1, 1,
-0.1373248, -1.06704, -3.735924, 0, 0, 0, 1, 1,
-0.1370203, 0.3033753, -0.9380597, 1, 1, 1, 1, 1,
-0.1358988, 3.378761, -1.828054, 1, 1, 1, 1, 1,
-0.1346828, 0.9175285, -0.2823261, 1, 1, 1, 1, 1,
-0.1339402, -2.121172, -2.229067, 1, 1, 1, 1, 1,
-0.1320564, -0.7703106, -2.615026, 1, 1, 1, 1, 1,
-0.130878, -0.8395901, -1.863937, 1, 1, 1, 1, 1,
-0.1305715, -1.30322, -4.738915, 1, 1, 1, 1, 1,
-0.1239899, 0.3636782, -0.2581056, 1, 1, 1, 1, 1,
-0.1208301, 0.5278586, -0.1616064, 1, 1, 1, 1, 1,
-0.1130609, -2.053973, -4.703676, 1, 1, 1, 1, 1,
-0.1121108, -1.703914, -3.781682, 1, 1, 1, 1, 1,
-0.1077575, 0.5377903, -0.6179553, 1, 1, 1, 1, 1,
-0.1060968, -0.8456209, -3.05281, 1, 1, 1, 1, 1,
-0.1042101, 0.07306879, -1.018715, 1, 1, 1, 1, 1,
-0.1040737, 1.08901, -2.206145, 1, 1, 1, 1, 1,
-0.1030666, 1.719353, -0.06518042, 0, 0, 1, 1, 1,
-0.1025449, 1.488126, -0.1395656, 1, 0, 0, 1, 1,
-0.1008471, 0.853775, 2.057076, 1, 0, 0, 1, 1,
-0.1005692, 0.8791649, -0.9968999, 1, 0, 0, 1, 1,
-0.1002688, -0.6643477, -1.334898, 1, 0, 0, 1, 1,
-0.09433034, -0.3947058, -4.024485, 1, 0, 0, 1, 1,
-0.08421458, 0.4467425, -0.2249211, 0, 0, 0, 1, 1,
-0.07997937, -0.7464293, -2.930878, 0, 0, 0, 1, 1,
-0.07939629, 1.417813, 1.226438, 0, 0, 0, 1, 1,
-0.07614364, 0.631596, -1.079929, 0, 0, 0, 1, 1,
-0.07092842, 0.4523396, 1.241043, 0, 0, 0, 1, 1,
-0.06383473, 0.2123333, 0.7387278, 0, 0, 0, 1, 1,
-0.06188244, -0.8667012, -3.17869, 0, 0, 0, 1, 1,
-0.0563141, -1.115046, -3.234569, 1, 1, 1, 1, 1,
-0.05547824, 0.1190861, -0.6508023, 1, 1, 1, 1, 1,
-0.05466892, 1.110907, 0.3429656, 1, 1, 1, 1, 1,
-0.05189972, -1.684763, -4.409258, 1, 1, 1, 1, 1,
-0.05010092, -0.4076246, -1.402697, 1, 1, 1, 1, 1,
-0.0480047, -1.68786, -4.010943, 1, 1, 1, 1, 1,
-0.0463012, 1.327406, -1.359818, 1, 1, 1, 1, 1,
-0.04368974, 0.1706126, -1.509659, 1, 1, 1, 1, 1,
-0.04071176, -0.06065412, -3.849962, 1, 1, 1, 1, 1,
-0.04024585, 0.7764121, -0.4758528, 1, 1, 1, 1, 1,
-0.03915787, 0.334902, -0.594345, 1, 1, 1, 1, 1,
-0.03757166, -1.473075, -3.066814, 1, 1, 1, 1, 1,
-0.03741601, 0.03921976, -1.356216, 1, 1, 1, 1, 1,
-0.03648579, 0.6919336, -0.5910628, 1, 1, 1, 1, 1,
-0.03208226, -1.588632, -1.913196, 1, 1, 1, 1, 1,
-0.03200656, -0.5270305, -3.086731, 0, 0, 1, 1, 1,
-0.0283384, 0.3342488, 0.3590206, 1, 0, 0, 1, 1,
-0.02483574, -1.007225, -2.101804, 1, 0, 0, 1, 1,
-0.01642137, 0.0259276, -1.074117, 1, 0, 0, 1, 1,
-0.01065373, -1.469975, -2.392685, 1, 0, 0, 1, 1,
-0.008477211, 1.70519, -1.866287, 1, 0, 0, 1, 1,
-0.006962084, -2.227707, -2.157, 0, 0, 0, 1, 1,
-0.003415586, -1.374591, -3.876641, 0, 0, 0, 1, 1,
0.004765898, 0.9069955, -0.608961, 0, 0, 0, 1, 1,
0.0100868, -1.985598, 3.356376, 0, 0, 0, 1, 1,
0.01152202, -0.5544528, 3.740285, 0, 0, 0, 1, 1,
0.01251277, 0.7354538, -0.7753594, 0, 0, 0, 1, 1,
0.01783632, 0.7870953, -0.5437209, 0, 0, 0, 1, 1,
0.01925066, -2.41259, 2.074025, 1, 1, 1, 1, 1,
0.02109884, -0.4204735, 2.886215, 1, 1, 1, 1, 1,
0.02363577, -1.892232, 2.107034, 1, 1, 1, 1, 1,
0.02882832, 0.6075628, 2.345836, 1, 1, 1, 1, 1,
0.03023166, -0.1609627, 3.233283, 1, 1, 1, 1, 1,
0.03068609, 0.9648106, 0.08423632, 1, 1, 1, 1, 1,
0.03742734, -0.6124904, 4.579161, 1, 1, 1, 1, 1,
0.04139221, -1.389022, 1.866485, 1, 1, 1, 1, 1,
0.04338595, 0.2836284, 1.436481, 1, 1, 1, 1, 1,
0.04543305, -0.5304502, 4.338428, 1, 1, 1, 1, 1,
0.04686717, -0.2730983, 2.109582, 1, 1, 1, 1, 1,
0.04693601, 0.7768683, -1.807815, 1, 1, 1, 1, 1,
0.05233779, 1.384671, -0.7757087, 1, 1, 1, 1, 1,
0.05646551, -0.3540797, 4.134021, 1, 1, 1, 1, 1,
0.05700739, 0.03674649, 1.142149, 1, 1, 1, 1, 1,
0.06023952, -1.189012, 3.496782, 0, 0, 1, 1, 1,
0.06046477, 2.101842, -0.004115823, 1, 0, 0, 1, 1,
0.06054721, -0.7527509, 4.383628, 1, 0, 0, 1, 1,
0.07068321, -0.2445337, 0.6875838, 1, 0, 0, 1, 1,
0.0719459, 0.9836285, 0.4105182, 1, 0, 0, 1, 1,
0.07630485, -0.8376086, 3.238206, 1, 0, 0, 1, 1,
0.07788131, 0.5457774, -0.9543139, 0, 0, 0, 1, 1,
0.08016488, 0.6362275, 0.1121345, 0, 0, 0, 1, 1,
0.08016932, -0.4758662, 1.753538, 0, 0, 0, 1, 1,
0.08020156, -1.994203, 1.843818, 0, 0, 0, 1, 1,
0.08773567, -0.04753227, 2.670305, 0, 0, 0, 1, 1,
0.08840832, 0.4110936, 1.08266, 0, 0, 0, 1, 1,
0.0899375, -0.2099932, 2.404944, 0, 0, 0, 1, 1,
0.09513942, 0.5679012, -0.3763425, 1, 1, 1, 1, 1,
0.09614233, -0.8818423, 2.263454, 1, 1, 1, 1, 1,
0.09771804, -0.6539806, 2.948343, 1, 1, 1, 1, 1,
0.09835886, -0.006716727, 1.108394, 1, 1, 1, 1, 1,
0.09893022, -3.037416, 3.731831, 1, 1, 1, 1, 1,
0.1082144, -0.4633979, 2.229341, 1, 1, 1, 1, 1,
0.1084899, -0.5375301, 4.469325, 1, 1, 1, 1, 1,
0.109038, 0.2021525, 0.948568, 1, 1, 1, 1, 1,
0.1164542, -1.04069, 4.47816, 1, 1, 1, 1, 1,
0.119333, 0.08335708, 1.175895, 1, 1, 1, 1, 1,
0.1255461, -0.8782693, 2.489786, 1, 1, 1, 1, 1,
0.1272195, -0.5231661, 3.121588, 1, 1, 1, 1, 1,
0.1289465, 0.05714539, -0.8309719, 1, 1, 1, 1, 1,
0.1302878, -0.5929211, 1.322622, 1, 1, 1, 1, 1,
0.1389733, -0.9424078, 2.959324, 1, 1, 1, 1, 1,
0.1391922, -1.276397, 2.801762, 0, 0, 1, 1, 1,
0.144757, 1.003835, 0.5626424, 1, 0, 0, 1, 1,
0.1458461, -1.634807, 1.898675, 1, 0, 0, 1, 1,
0.1476812, -0.8566164, 3.459852, 1, 0, 0, 1, 1,
0.1481367, 0.1676054, 0.955169, 1, 0, 0, 1, 1,
0.1518929, 0.4794846, 0.3793157, 1, 0, 0, 1, 1,
0.154015, -0.3607369, 2.111547, 0, 0, 0, 1, 1,
0.1543351, 1.240919, -0.09472357, 0, 0, 0, 1, 1,
0.1546116, 1.236502, 0.9185406, 0, 0, 0, 1, 1,
0.15498, 0.909797, -0.004355683, 0, 0, 0, 1, 1,
0.156247, -0.346822, 3.390845, 0, 0, 0, 1, 1,
0.1604748, 0.2005195, 1.930268, 0, 0, 0, 1, 1,
0.1622145, 1.836687, 0.8092805, 0, 0, 0, 1, 1,
0.1667665, -0.7015457, 1.194801, 1, 1, 1, 1, 1,
0.1709938, 1.438316, -1.032508, 1, 1, 1, 1, 1,
0.1713653, 1.416447, 0.1883388, 1, 1, 1, 1, 1,
0.1749612, -1.00146, 4.532242, 1, 1, 1, 1, 1,
0.1768525, -0.8135901, 3.768407, 1, 1, 1, 1, 1,
0.1800217, 0.6111063, -0.1517356, 1, 1, 1, 1, 1,
0.1837822, 1.362678, 0.6975924, 1, 1, 1, 1, 1,
0.1845706, 1.034726, -1.077996, 1, 1, 1, 1, 1,
0.1866869, 0.8576104, 0.4116974, 1, 1, 1, 1, 1,
0.1870322, -1.536337, 1.151058, 1, 1, 1, 1, 1,
0.1876219, -0.6976207, 4.464908, 1, 1, 1, 1, 1,
0.1921286, 0.1123752, 0.9462804, 1, 1, 1, 1, 1,
0.1928207, -0.2547563, 2.655163, 1, 1, 1, 1, 1,
0.1944138, 1.55892, -0.6640221, 1, 1, 1, 1, 1,
0.1952524, 0.2731073, 0.5150214, 1, 1, 1, 1, 1,
0.2104568, 1.195303, -1.110882, 0, 0, 1, 1, 1,
0.2124986, 1.010325, -0.2720963, 1, 0, 0, 1, 1,
0.2125732, 0.1942772, 2.286858, 1, 0, 0, 1, 1,
0.2131629, -0.8886132, 1.944443, 1, 0, 0, 1, 1,
0.2149236, 0.06720178, 2.979944, 1, 0, 0, 1, 1,
0.2197586, -0.4210723, 3.385686, 1, 0, 0, 1, 1,
0.2199783, -1.009681, 4.913245, 0, 0, 0, 1, 1,
0.2202022, 0.7443351, 1.96834, 0, 0, 0, 1, 1,
0.2217509, -0.6011716, 2.642499, 0, 0, 0, 1, 1,
0.2222409, 0.1512899, -0.1924469, 0, 0, 0, 1, 1,
0.222363, -0.2308287, 3.957664, 0, 0, 0, 1, 1,
0.2234811, -0.1503596, 3.969285, 0, 0, 0, 1, 1,
0.2271191, -0.8984796, 2.143397, 0, 0, 0, 1, 1,
0.2289907, -0.9157118, 2.92207, 1, 1, 1, 1, 1,
0.2335259, -0.3196751, 2.142646, 1, 1, 1, 1, 1,
0.2340849, 0.6067315, 0.8828036, 1, 1, 1, 1, 1,
0.2343015, 0.6338307, -0.2200032, 1, 1, 1, 1, 1,
0.234941, 0.5674045, -0.3736176, 1, 1, 1, 1, 1,
0.2351206, -2.185047, 3.877967, 1, 1, 1, 1, 1,
0.2353307, 1.243788, -0.840335, 1, 1, 1, 1, 1,
0.2367414, -0.4940481, 3.415501, 1, 1, 1, 1, 1,
0.2373834, 0.4692402, 1.166083, 1, 1, 1, 1, 1,
0.2377075, -0.9748344, 2.814233, 1, 1, 1, 1, 1,
0.2377172, -1.463579, 3.036992, 1, 1, 1, 1, 1,
0.2400122, -0.4308769, 0.6183117, 1, 1, 1, 1, 1,
0.2422383, 1.408638, 0.4808157, 1, 1, 1, 1, 1,
0.2472793, 0.1280624, 0.2423819, 1, 1, 1, 1, 1,
0.2494244, 2.089826, -0.1684834, 1, 1, 1, 1, 1,
0.2502332, 0.6506212, 2.247543, 0, 0, 1, 1, 1,
0.2532338, 0.5463338, -1.020144, 1, 0, 0, 1, 1,
0.255111, 1.187275, -1.210146, 1, 0, 0, 1, 1,
0.256303, 0.2456239, 0.6118532, 1, 0, 0, 1, 1,
0.2579177, 0.3282994, 0.8332954, 1, 0, 0, 1, 1,
0.259977, -0.1889033, 2.363254, 1, 0, 0, 1, 1,
0.26351, -0.5749803, 2.025946, 0, 0, 0, 1, 1,
0.2635165, 0.06159023, 1.829856, 0, 0, 0, 1, 1,
0.2728606, -0.4239702, 2.376071, 0, 0, 0, 1, 1,
0.2750678, -0.3834581, 3.272327, 0, 0, 0, 1, 1,
0.2827435, -1.171994, 3.825119, 0, 0, 0, 1, 1,
0.2831587, -1.889495, 3.142524, 0, 0, 0, 1, 1,
0.2848225, 1.410028, 1.275391, 0, 0, 0, 1, 1,
0.2877952, 1.184231, 0.5942073, 1, 1, 1, 1, 1,
0.2900252, 0.6756094, 2.548569, 1, 1, 1, 1, 1,
0.2903744, -0.5772416, 1.441124, 1, 1, 1, 1, 1,
0.2906334, -0.08266571, 1.808789, 1, 1, 1, 1, 1,
0.2911354, -0.4967395, 2.118507, 1, 1, 1, 1, 1,
0.2962504, -1.668973, 3.782367, 1, 1, 1, 1, 1,
0.2971839, 0.1784232, 1.570476, 1, 1, 1, 1, 1,
0.2979698, 1.432277, -0.2450611, 1, 1, 1, 1, 1,
0.301898, 1.471834, -0.6869192, 1, 1, 1, 1, 1,
0.3020364, -1.473968, 2.74439, 1, 1, 1, 1, 1,
0.3024096, -0.7166134, 2.097929, 1, 1, 1, 1, 1,
0.3060354, 1.097937, 0.6492133, 1, 1, 1, 1, 1,
0.3116939, -0.1253381, 1.999445, 1, 1, 1, 1, 1,
0.313119, -0.5630811, -0.06893343, 1, 1, 1, 1, 1,
0.3141429, 1.232248, -0.1468005, 1, 1, 1, 1, 1,
0.3159936, -0.2366171, 2.866632, 0, 0, 1, 1, 1,
0.3187097, -0.1183776, 2.591632, 1, 0, 0, 1, 1,
0.3192271, 1.739969, 1.980812, 1, 0, 0, 1, 1,
0.3206423, 0.5786205, 0.2727831, 1, 0, 0, 1, 1,
0.3241873, 0.8077244, 1.231262, 1, 0, 0, 1, 1,
0.3269629, 1.781555, 0.2980187, 1, 0, 0, 1, 1,
0.3350707, 2.029382, 0.5791783, 0, 0, 0, 1, 1,
0.33785, -0.2492699, 2.335752, 0, 0, 0, 1, 1,
0.3383175, -0.4538511, 1.892619, 0, 0, 0, 1, 1,
0.340889, 0.02015951, 2.023134, 0, 0, 0, 1, 1,
0.3491547, -1.986745, 1.766059, 0, 0, 0, 1, 1,
0.3504657, 0.02787433, 3.41802, 0, 0, 0, 1, 1,
0.3596383, -0.1034631, 1.442523, 0, 0, 0, 1, 1,
0.3596729, -0.05387988, 0.3811855, 1, 1, 1, 1, 1,
0.3660117, -0.5026914, 2.969995, 1, 1, 1, 1, 1,
0.3676082, 2.276006, -0.4831019, 1, 1, 1, 1, 1,
0.3710733, -1.390926, 1.258456, 1, 1, 1, 1, 1,
0.3760447, 0.1098225, 1.683401, 1, 1, 1, 1, 1,
0.3775231, 1.174599, -0.1506484, 1, 1, 1, 1, 1,
0.3815529, 1.267327, 0.6447067, 1, 1, 1, 1, 1,
0.3844332, 1.142144, -0.3151975, 1, 1, 1, 1, 1,
0.385757, -1.300365, 3.062308, 1, 1, 1, 1, 1,
0.3919888, -0.1549903, 1.858563, 1, 1, 1, 1, 1,
0.3923548, 1.32521, 0.804933, 1, 1, 1, 1, 1,
0.3925974, 0.3387577, 1.397182, 1, 1, 1, 1, 1,
0.39369, 1.042596, 0.7325512, 1, 1, 1, 1, 1,
0.398052, -0.6270153, 3.414591, 1, 1, 1, 1, 1,
0.4015175, 1.267689, -0.2242388, 1, 1, 1, 1, 1,
0.4134889, 0.7706546, 0.6099923, 0, 0, 1, 1, 1,
0.4219337, -0.05404697, 0.5913071, 1, 0, 0, 1, 1,
0.4241128, -1.554674, 3.280775, 1, 0, 0, 1, 1,
0.4256258, 0.7020565, 1.564058, 1, 0, 0, 1, 1,
0.4257028, 1.217132, -0.281179, 1, 0, 0, 1, 1,
0.429148, -1.429367, 2.67343, 1, 0, 0, 1, 1,
0.4299329, 0.2051892, 0.6387882, 0, 0, 0, 1, 1,
0.4402194, 0.3005677, -1.145831, 0, 0, 0, 1, 1,
0.440798, -0.3091379, 2.207403, 0, 0, 0, 1, 1,
0.4440557, -0.8193371, 3.368559, 0, 0, 0, 1, 1,
0.4441103, -0.5773278, 2.75352, 0, 0, 0, 1, 1,
0.4445402, -0.4280916, 1.410412, 0, 0, 0, 1, 1,
0.4457068, -0.5015935, 2.339666, 0, 0, 0, 1, 1,
0.4464725, 1.125484, 1.918027, 1, 1, 1, 1, 1,
0.4487854, 0.09398422, 1.856358, 1, 1, 1, 1, 1,
0.4492748, -0.2485956, 1.947657, 1, 1, 1, 1, 1,
0.4532906, -0.1417101, 0.102635, 1, 1, 1, 1, 1,
0.4570209, 0.1389915, 0.6169301, 1, 1, 1, 1, 1,
0.4690663, 0.112108, 2.03788, 1, 1, 1, 1, 1,
0.474361, -1.43254, 2.093926, 1, 1, 1, 1, 1,
0.4750987, -0.4005631, 3.010203, 1, 1, 1, 1, 1,
0.4761852, 0.4714147, -1.92456, 1, 1, 1, 1, 1,
0.4786633, -1.254878, 2.833238, 1, 1, 1, 1, 1,
0.4789079, 1.634442, 0.2004678, 1, 1, 1, 1, 1,
0.4794554, -0.4552459, 1.259315, 1, 1, 1, 1, 1,
0.4802493, -0.5601234, 1.567747, 1, 1, 1, 1, 1,
0.4810585, -0.6387166, 1.790803, 1, 1, 1, 1, 1,
0.4816284, 0.1700546, 0.5611349, 1, 1, 1, 1, 1,
0.4828011, -0.3582541, 1.506832, 0, 0, 1, 1, 1,
0.4842585, 0.2952538, 1.019242, 1, 0, 0, 1, 1,
0.4845948, 0.629531, -0.5990106, 1, 0, 0, 1, 1,
0.4855727, -0.5957441, 1.344941, 1, 0, 0, 1, 1,
0.4898522, -0.1452352, 1.165097, 1, 0, 0, 1, 1,
0.4902873, 0.4618778, 0.7816488, 1, 0, 0, 1, 1,
0.4917921, -0.2190244, 2.124789, 0, 0, 0, 1, 1,
0.4960701, -0.8364245, 2.912597, 0, 0, 0, 1, 1,
0.4967583, 0.6438003, -0.8256198, 0, 0, 0, 1, 1,
0.498213, -0.6265336, 1.832477, 0, 0, 0, 1, 1,
0.5020967, -0.02339435, 1.70569, 0, 0, 0, 1, 1,
0.5025966, -0.4290447, 0.7604614, 0, 0, 0, 1, 1,
0.5031526, 0.1177758, 1.799768, 0, 0, 0, 1, 1,
0.5054577, -1.183486, 2.443639, 1, 1, 1, 1, 1,
0.5081541, -1.503649, 3.756952, 1, 1, 1, 1, 1,
0.5120021, -0.3456612, 1.528862, 1, 1, 1, 1, 1,
0.5130447, 0.9234512, 1.672344, 1, 1, 1, 1, 1,
0.5163664, -0.4240045, 2.051151, 1, 1, 1, 1, 1,
0.5176851, -0.5646162, 3.610573, 1, 1, 1, 1, 1,
0.526585, 1.420108, -0.2733344, 1, 1, 1, 1, 1,
0.5316932, 0.0560578, 1.632368, 1, 1, 1, 1, 1,
0.5337048, 0.01619039, 0.7538851, 1, 1, 1, 1, 1,
0.5353577, -0.1678829, 1.65285, 1, 1, 1, 1, 1,
0.5359053, -0.8060376, 3.533731, 1, 1, 1, 1, 1,
0.5369955, -0.5236287, 3.216056, 1, 1, 1, 1, 1,
0.5392914, -0.2792329, 1.758065, 1, 1, 1, 1, 1,
0.5412828, -0.9751404, 3.778024, 1, 1, 1, 1, 1,
0.5450798, -0.5722739, 3.65644, 1, 1, 1, 1, 1,
0.5450854, -0.2775397, 2.285629, 0, 0, 1, 1, 1,
0.5468468, -1.541542, 2.544691, 1, 0, 0, 1, 1,
0.5497841, 0.5957399, 1.507888, 1, 0, 0, 1, 1,
0.5546291, -1.022539, 1.918295, 1, 0, 0, 1, 1,
0.5654045, -0.2378756, 2.594238, 1, 0, 0, 1, 1,
0.5661633, 0.07099976, 2.117956, 1, 0, 0, 1, 1,
0.5670436, 1.05995, -0.6320112, 0, 0, 0, 1, 1,
0.56736, 1.186041, 1.509913, 0, 0, 0, 1, 1,
0.5675095, -0.7988239, 2.773829, 0, 0, 0, 1, 1,
0.5708244, -1.502389, 2.992822, 0, 0, 0, 1, 1,
0.5712684, -0.1433333, 1.04976, 0, 0, 0, 1, 1,
0.5759083, 0.9831301, 1.193908, 0, 0, 0, 1, 1,
0.5795952, 0.2383372, 1.225734, 0, 0, 0, 1, 1,
0.5834162, -0.3265344, 1.86871, 1, 1, 1, 1, 1,
0.5854966, 0.5638002, 0.372495, 1, 1, 1, 1, 1,
0.5897182, 0.5781369, 0.7645784, 1, 1, 1, 1, 1,
0.5912837, -0.9420503, 4.02289, 1, 1, 1, 1, 1,
0.5947696, -1.374761, 4.277501, 1, 1, 1, 1, 1,
0.5962555, -1.053233, 1.61631, 1, 1, 1, 1, 1,
0.5967938, 0.3564804, 2.912542, 1, 1, 1, 1, 1,
0.5977452, -0.6559513, 0.9656298, 1, 1, 1, 1, 1,
0.5984512, -0.3375916, 1.106847, 1, 1, 1, 1, 1,
0.5986545, 1.506696, 1.060464, 1, 1, 1, 1, 1,
0.6006194, 0.9202822, 2.510816, 1, 1, 1, 1, 1,
0.6067914, -0.2026646, -0.5012233, 1, 1, 1, 1, 1,
0.6096864, 0.7559015, -1.236075, 1, 1, 1, 1, 1,
0.6119946, -1.362986, 3.902415, 1, 1, 1, 1, 1,
0.6185217, 0.5769014, 1.62853, 1, 1, 1, 1, 1,
0.6192723, 1.325975, 1.26761, 0, 0, 1, 1, 1,
0.6201762, -0.5898369, 0.1531193, 1, 0, 0, 1, 1,
0.6228752, -0.8185415, -0.009908488, 1, 0, 0, 1, 1,
0.6246375, 0.3697731, 1.170142, 1, 0, 0, 1, 1,
0.6267407, 0.2766012, 0.3417271, 1, 0, 0, 1, 1,
0.6290067, -0.7403867, 4.129299, 1, 0, 0, 1, 1,
0.6373084, -0.3396697, 3.236164, 0, 0, 0, 1, 1,
0.6428121, -0.5782417, 3.691203, 0, 0, 0, 1, 1,
0.6447389, -0.1473367, 1.350344, 0, 0, 0, 1, 1,
0.6453744, -0.2463634, 2.470225, 0, 0, 0, 1, 1,
0.645798, -1.093933, 2.82856, 0, 0, 0, 1, 1,
0.6458381, -1.594458, 2.984031, 0, 0, 0, 1, 1,
0.6470814, -0.2193445, 1.897963, 0, 0, 0, 1, 1,
0.6510491, -1.44255, 2.553091, 1, 1, 1, 1, 1,
0.658338, -0.8572519, 0.08546809, 1, 1, 1, 1, 1,
0.66123, -0.1239204, 2.933681, 1, 1, 1, 1, 1,
0.6655897, 0.3331976, 2.56416, 1, 1, 1, 1, 1,
0.671113, -1.350312, 2.887662, 1, 1, 1, 1, 1,
0.6755861, -0.9152367, 1.284829, 1, 1, 1, 1, 1,
0.6802489, 0.8707911, 0.1848421, 1, 1, 1, 1, 1,
0.6822007, 0.9268214, -0.9214069, 1, 1, 1, 1, 1,
0.6846899, -1.770559, 3.379949, 1, 1, 1, 1, 1,
0.6889138, 0.5406861, -0.04882572, 1, 1, 1, 1, 1,
0.6920859, -0.7747519, 3.235256, 1, 1, 1, 1, 1,
0.6954126, 1.029046, -0.8013545, 1, 1, 1, 1, 1,
0.6965995, 0.762353, -0.4225955, 1, 1, 1, 1, 1,
0.6982834, 0.54635, 1.706879, 1, 1, 1, 1, 1,
0.701939, 1.225911, -0.1139552, 1, 1, 1, 1, 1,
0.7029431, 1.059731, 0.4638454, 0, 0, 1, 1, 1,
0.7081931, -1.61579, 2.140871, 1, 0, 0, 1, 1,
0.7125014, 0.4621841, 0.93908, 1, 0, 0, 1, 1,
0.7217862, 0.7817387, 0.5879554, 1, 0, 0, 1, 1,
0.7219049, 1.184312, 1.992952, 1, 0, 0, 1, 1,
0.7232109, -0.1240476, 1.140314, 1, 0, 0, 1, 1,
0.7240368, 0.5380146, 0.7712046, 0, 0, 0, 1, 1,
0.7292098, 0.08093848, 0.3361523, 0, 0, 0, 1, 1,
0.7319322, -0.1010033, -0.05919274, 0, 0, 0, 1, 1,
0.7382727, 0.9490865, -0.07042476, 0, 0, 0, 1, 1,
0.7434645, -0.3795199, 2.616701, 0, 0, 0, 1, 1,
0.7445858, -0.7774991, 1.631947, 0, 0, 0, 1, 1,
0.7452715, -0.6750596, 3.09102, 0, 0, 0, 1, 1,
0.7585066, 0.2602963, 1.490715, 1, 1, 1, 1, 1,
0.7641475, 0.9331027, 1.972928, 1, 1, 1, 1, 1,
0.7713861, 1.075618, 1.141407, 1, 1, 1, 1, 1,
0.7785726, 0.7002147, 3.007674, 1, 1, 1, 1, 1,
0.7844368, 0.5615194, 2.139048, 1, 1, 1, 1, 1,
0.7846245, -0.2356541, 1.016573, 1, 1, 1, 1, 1,
0.7891402, 0.9381872, 1.557925, 1, 1, 1, 1, 1,
0.7952082, 0.6890606, 1.066948, 1, 1, 1, 1, 1,
0.7977443, -1.672414, 2.334254, 1, 1, 1, 1, 1,
0.7994768, 0.548162, 1.238316, 1, 1, 1, 1, 1,
0.8015603, 1.084263, 2.104608, 1, 1, 1, 1, 1,
0.8071781, -0.3571816, 0.2116995, 1, 1, 1, 1, 1,
0.8099857, -2.347639, 3.921266, 1, 1, 1, 1, 1,
0.8242053, 1.159827, 1.720602, 1, 1, 1, 1, 1,
0.831017, 1.736204, 1.477097, 1, 1, 1, 1, 1,
0.8319461, 0.2466284, 0.6996677, 0, 0, 1, 1, 1,
0.8348128, -0.9581658, 0.1859602, 1, 0, 0, 1, 1,
0.8359251, 0.8507538, -1.054844, 1, 0, 0, 1, 1,
0.839075, -0.130067, 1.902492, 1, 0, 0, 1, 1,
0.8399747, 0.3946356, -0.03969573, 1, 0, 0, 1, 1,
0.850859, -1.124991, 2.665835, 1, 0, 0, 1, 1,
0.8515972, 0.3701973, 0.7631037, 0, 0, 0, 1, 1,
0.8526728, 0.3020408, 0.7365247, 0, 0, 0, 1, 1,
0.8581763, 0.3162778, 0.9794985, 0, 0, 0, 1, 1,
0.8604496, -0.2794045, 1.35583, 0, 0, 0, 1, 1,
0.8632631, -0.2899098, 2.44437, 0, 0, 0, 1, 1,
0.8639068, 0.5161241, 1.248787, 0, 0, 0, 1, 1,
0.8718019, -0.7036034, 2.195261, 0, 0, 0, 1, 1,
0.8836526, 1.049632, -0.7783377, 1, 1, 1, 1, 1,
0.8857755, -0.2702879, 1.095934, 1, 1, 1, 1, 1,
0.8867882, -0.3836283, 1.339616, 1, 1, 1, 1, 1,
0.9044752, 0.1264331, 2.922719, 1, 1, 1, 1, 1,
0.9071226, -0.3023947, 0.09341159, 1, 1, 1, 1, 1,
0.9246952, 0.743728, 1.780842, 1, 1, 1, 1, 1,
0.9322686, -0.1159209, 0.4572062, 1, 1, 1, 1, 1,
0.9366022, 1.085772, 1.702441, 1, 1, 1, 1, 1,
0.9493957, 0.09778664, 2.474738, 1, 1, 1, 1, 1,
0.949852, 0.3177594, 1.199765, 1, 1, 1, 1, 1,
0.9560025, -1.328986, 2.569826, 1, 1, 1, 1, 1,
0.957659, -0.6739048, 2.024799, 1, 1, 1, 1, 1,
0.9602016, -1.701356, 3.518253, 1, 1, 1, 1, 1,
0.9609443, -0.6388636, 1.608868, 1, 1, 1, 1, 1,
0.9613305, -1.559552, 1.915146, 1, 1, 1, 1, 1,
0.9626409, -0.3550979, 1.743263, 0, 0, 1, 1, 1,
0.971438, -0.399082, 1.534117, 1, 0, 0, 1, 1,
0.9722669, -0.1025692, 1.477193, 1, 0, 0, 1, 1,
0.9736825, 0.7545231, 3.979388, 1, 0, 0, 1, 1,
0.9784337, -1.13359, 3.298969, 1, 0, 0, 1, 1,
0.9803736, -1.257933, 2.464574, 1, 0, 0, 1, 1,
0.9852982, 1.14518, 3.392735, 0, 0, 0, 1, 1,
0.9967233, 0.3791816, 3.542463, 0, 0, 0, 1, 1,
0.9981902, -0.1832232, 3.008019, 0, 0, 0, 1, 1,
1.000839, -0.06161078, 1.598783, 0, 0, 0, 1, 1,
1.00247, -0.9843152, 1.956217, 0, 0, 0, 1, 1,
1.004133, -0.4292577, 1.862047, 0, 0, 0, 1, 1,
1.012058, 0.8154556, 1.039029, 0, 0, 0, 1, 1,
1.012533, -0.06491829, 1.409648, 1, 1, 1, 1, 1,
1.012577, -2.108962, 4.363155, 1, 1, 1, 1, 1,
1.018543, -0.8247095, 1.658812, 1, 1, 1, 1, 1,
1.018777, -0.4550707, 2.649316, 1, 1, 1, 1, 1,
1.02626, 0.03274067, 0.2928923, 1, 1, 1, 1, 1,
1.026417, -0.06797035, 0.6033347, 1, 1, 1, 1, 1,
1.034826, -0.489878, 2.09575, 1, 1, 1, 1, 1,
1.039522, 0.6073338, 1.373863, 1, 1, 1, 1, 1,
1.053144, 0.3654573, 2.622874, 1, 1, 1, 1, 1,
1.060821, -0.8031384, 2.110172, 1, 1, 1, 1, 1,
1.062682, -0.03482752, 2.330603, 1, 1, 1, 1, 1,
1.063911, -0.7978173, 1.657739, 1, 1, 1, 1, 1,
1.064603, -0.7346075, 2.429326, 1, 1, 1, 1, 1,
1.075386, -1.513379, 1.906868, 1, 1, 1, 1, 1,
1.078482, 1.040552, 1.141305, 1, 1, 1, 1, 1,
1.078946, 0.4547036, 2.442943, 0, 0, 1, 1, 1,
1.080796, -1.156421, 1.414638, 1, 0, 0, 1, 1,
1.085155, -1.516079, 2.789107, 1, 0, 0, 1, 1,
1.092004, -0.9033046, 2.033933, 1, 0, 0, 1, 1,
1.103812, -0.3287012, 1.910892, 1, 0, 0, 1, 1,
1.107523, -0.837245, 1.437196, 1, 0, 0, 1, 1,
1.112638, -0.1794519, 2.416605, 0, 0, 0, 1, 1,
1.118794, -0.1798064, 1.891348, 0, 0, 0, 1, 1,
1.122046, 0.1470251, 1.681638, 0, 0, 0, 1, 1,
1.122372, -0.8789467, 3.638999, 0, 0, 0, 1, 1,
1.123065, -0.0417443, -0.5041016, 0, 0, 0, 1, 1,
1.12503, -0.1261304, 0.9063454, 0, 0, 0, 1, 1,
1.130019, -1.345716, 2.658157, 0, 0, 0, 1, 1,
1.132544, -1.805405, 2.154858, 1, 1, 1, 1, 1,
1.13342, -0.7973672, 2.784828, 1, 1, 1, 1, 1,
1.141995, -0.3859069, 3.775968, 1, 1, 1, 1, 1,
1.144779, 0.6728092, 0.5443998, 1, 1, 1, 1, 1,
1.147993, 0.2355253, 1.202551, 1, 1, 1, 1, 1,
1.150473, -1.030538, 3.152523, 1, 1, 1, 1, 1,
1.153075, -0.3275535, 2.030437, 1, 1, 1, 1, 1,
1.155437, 1.706986, -0.1671509, 1, 1, 1, 1, 1,
1.157867, -0.1634185, 0.8867552, 1, 1, 1, 1, 1,
1.160012, -1.220361, 1.031665, 1, 1, 1, 1, 1,
1.160978, 0.3788391, 1.82312, 1, 1, 1, 1, 1,
1.161181, 1.316845, -0.1328081, 1, 1, 1, 1, 1,
1.16711, 1.114064, -1.668069, 1, 1, 1, 1, 1,
1.176888, 0.4117244, 1.154164, 1, 1, 1, 1, 1,
1.177008, -1.134143, 2.423019, 1, 1, 1, 1, 1,
1.179456, 1.226477, 1.263557, 0, 0, 1, 1, 1,
1.181301, -1.611789, 4.407941, 1, 0, 0, 1, 1,
1.181879, -1.542289, 1.176969, 1, 0, 0, 1, 1,
1.18413, 0.2417502, -0.004962494, 1, 0, 0, 1, 1,
1.189265, -1.256708, 0.9703245, 1, 0, 0, 1, 1,
1.194747, 0.3412547, 0.2753018, 1, 0, 0, 1, 1,
1.204049, -1.429446, 2.734574, 0, 0, 0, 1, 1,
1.205263, -0.8426623, 1.986865, 0, 0, 0, 1, 1,
1.206358, -0.7138766, 2.576662, 0, 0, 0, 1, 1,
1.208637, -0.1490135, 1.198486, 0, 0, 0, 1, 1,
1.209194, 3.436723, -0.4062285, 0, 0, 0, 1, 1,
1.223721, -2.862419, 5.231111, 0, 0, 0, 1, 1,
1.227337, -0.6471223, 1.676484, 0, 0, 0, 1, 1,
1.232916, -0.05675624, -0.8371649, 1, 1, 1, 1, 1,
1.235744, 0.5065272, 0.2449061, 1, 1, 1, 1, 1,
1.241273, -1.818449, 2.529817, 1, 1, 1, 1, 1,
1.241308, -0.04060658, 2.066563, 1, 1, 1, 1, 1,
1.255516, 2.010128, 1.682176, 1, 1, 1, 1, 1,
1.255569, -0.1158066, 2.232128, 1, 1, 1, 1, 1,
1.258644, -0.175042, 1.909521, 1, 1, 1, 1, 1,
1.261935, -1.297112, 2.463896, 1, 1, 1, 1, 1,
1.262824, 0.1785863, 2.132569, 1, 1, 1, 1, 1,
1.26364, 1.421777, -0.1408292, 1, 1, 1, 1, 1,
1.29275, -2.394253, 2.7166, 1, 1, 1, 1, 1,
1.295598, 0.7797925, 0.882194, 1, 1, 1, 1, 1,
1.303447, -0.4462668, 2.255165, 1, 1, 1, 1, 1,
1.316249, 1.045919, 0.1151571, 1, 1, 1, 1, 1,
1.318886, -1.62074, 3.129406, 1, 1, 1, 1, 1,
1.322038, -0.2572443, 2.178156, 0, 0, 1, 1, 1,
1.328896, -0.09509963, 2.536784, 1, 0, 0, 1, 1,
1.334158, 0.7267146, 1.919081, 1, 0, 0, 1, 1,
1.335846, -1.768553, 4.22429, 1, 0, 0, 1, 1,
1.340352, 0.07759115, 1.893712, 1, 0, 0, 1, 1,
1.342202, -0.516924, 2.095766, 1, 0, 0, 1, 1,
1.34435, 0.7812467, 1.237951, 0, 0, 0, 1, 1,
1.347194, -1.211344, 2.232653, 0, 0, 0, 1, 1,
1.351147, 0.6945077, 1.812847, 0, 0, 0, 1, 1,
1.354572, -0.6856274, 3.24174, 0, 0, 0, 1, 1,
1.354697, -0.7318757, 2.017504, 0, 0, 0, 1, 1,
1.356182, -2.051142, 2.632449, 0, 0, 0, 1, 1,
1.363873, -0.8044763, 2.241989, 0, 0, 0, 1, 1,
1.364845, 0.8122984, 0.8123791, 1, 1, 1, 1, 1,
1.383383, 0.23237, 0.7571338, 1, 1, 1, 1, 1,
1.386478, 0.02787742, 3.311594, 1, 1, 1, 1, 1,
1.403891, -1.053599, 2.769722, 1, 1, 1, 1, 1,
1.413249, 2.782323, 0.7578232, 1, 1, 1, 1, 1,
1.414556, -0.9863396, 1.011463, 1, 1, 1, 1, 1,
1.415932, -0.01711991, 1.318786, 1, 1, 1, 1, 1,
1.423738, -0.6178212, -0.05581767, 1, 1, 1, 1, 1,
1.426668, -1.002516, 3.248238, 1, 1, 1, 1, 1,
1.427569, -0.3263841, 1.613555, 1, 1, 1, 1, 1,
1.427893, 0.3807108, 2.528605, 1, 1, 1, 1, 1,
1.435936, 1.603058, 0.5941747, 1, 1, 1, 1, 1,
1.441365, -0.7358935, 2.094933, 1, 1, 1, 1, 1,
1.457223, 1.101565, 0.7407198, 1, 1, 1, 1, 1,
1.462297, 0.8475231, 1.145253, 1, 1, 1, 1, 1,
1.493401, -1.631064, 0.4025045, 0, 0, 1, 1, 1,
1.496488, -0.1675207, 1.180288, 1, 0, 0, 1, 1,
1.498453, -0.9926209, 1.939387, 1, 0, 0, 1, 1,
1.502792, 1.265928, 0.9488322, 1, 0, 0, 1, 1,
1.505951, -1.414656, 2.688951, 1, 0, 0, 1, 1,
1.506337, 0.6254414, 1.951947, 1, 0, 0, 1, 1,
1.507051, -0.1487805, 1.392246, 0, 0, 0, 1, 1,
1.513971, 1.062927, 2.363591, 0, 0, 0, 1, 1,
1.530365, -1.048205, 2.310349, 0, 0, 0, 1, 1,
1.53099, 0.06009052, -0.4669908, 0, 0, 0, 1, 1,
1.544934, -0.7274086, 1.539135, 0, 0, 0, 1, 1,
1.548101, 1.046364, -0.05358937, 0, 0, 0, 1, 1,
1.564129, -0.6316077, 1.598205, 0, 0, 0, 1, 1,
1.564887, 2.087455, 1.112836, 1, 1, 1, 1, 1,
1.571194, 0.7511523, 1.639565, 1, 1, 1, 1, 1,
1.573902, 1.72953, 1.094064, 1, 1, 1, 1, 1,
1.574993, -0.3407416, 1.903841, 1, 1, 1, 1, 1,
1.583669, 1.6904, 2.965504, 1, 1, 1, 1, 1,
1.584528, 1.322928, 1.217381, 1, 1, 1, 1, 1,
1.585738, 0.4928292, 0.9854226, 1, 1, 1, 1, 1,
1.588545, 0.04286719, 2.559418, 1, 1, 1, 1, 1,
1.613277, -0.7477147, 1.499574, 1, 1, 1, 1, 1,
1.615026, 3.277602, -1.591526, 1, 1, 1, 1, 1,
1.616991, 0.6943603, 1.465719, 1, 1, 1, 1, 1,
1.639978, -1.126301, 2.247391, 1, 1, 1, 1, 1,
1.648057, -0.2658302, 0.9698909, 1, 1, 1, 1, 1,
1.657979, -2.011051, 2.715603, 1, 1, 1, 1, 1,
1.699562, -0.1878989, 2.374968, 1, 1, 1, 1, 1,
1.703406, -0.3990679, 3.209137, 0, 0, 1, 1, 1,
1.742822, 0.03667233, 2.849921, 1, 0, 0, 1, 1,
1.746478, -1.990872, 2.841521, 1, 0, 0, 1, 1,
1.808286, 0.01734733, 0.6260276, 1, 0, 0, 1, 1,
1.810006, 0.3379334, 0.9684171, 1, 0, 0, 1, 1,
1.811789, -1.938166, 4.108152, 1, 0, 0, 1, 1,
1.82309, 0.573899, -1.24268, 0, 0, 0, 1, 1,
1.839385, -0.7756329, 1.189804, 0, 0, 0, 1, 1,
1.843446, -0.6459752, 2.194085, 0, 0, 0, 1, 1,
1.890984, 0.4504283, 1.26464, 0, 0, 0, 1, 1,
1.938455, -0.04984003, 2.037097, 0, 0, 0, 1, 1,
1.9491, -0.5457185, 2.629893, 0, 0, 0, 1, 1,
1.974617, 1.684567, 1.13598, 0, 0, 0, 1, 1,
1.99115, 0.3021368, -0.3240084, 1, 1, 1, 1, 1,
1.993225, -0.4227357, 0.9523875, 1, 1, 1, 1, 1,
1.996817, 0.4767025, 0.01298803, 1, 1, 1, 1, 1,
2.011026, -0.02447956, 0.5372706, 1, 1, 1, 1, 1,
2.017412, -0.3139181, 1.658826, 1, 1, 1, 1, 1,
2.021649, 0.1876391, 1.918637, 1, 1, 1, 1, 1,
2.034424, 1.273712, 2.245089, 1, 1, 1, 1, 1,
2.051107, 0.4737004, 1.846701, 1, 1, 1, 1, 1,
2.068588, -0.4227104, 2.471036, 1, 1, 1, 1, 1,
2.071075, -0.08676096, 2.043716, 1, 1, 1, 1, 1,
2.078048, 2.007699, -1.634306, 1, 1, 1, 1, 1,
2.12072, 0.2160933, 2.332676, 1, 1, 1, 1, 1,
2.123256, -0.2449493, 0.932606, 1, 1, 1, 1, 1,
2.12627, -1.67649, 3.648206, 1, 1, 1, 1, 1,
2.130078, -0.6006476, 1.706212, 1, 1, 1, 1, 1,
2.145829, 1.602658, 0.5189408, 0, 0, 1, 1, 1,
2.146422, -0.7571748, -0.005415718, 1, 0, 0, 1, 1,
2.157116, 0.7913692, 0.5412336, 1, 0, 0, 1, 1,
2.171108, 1.027978, 1.071191, 1, 0, 0, 1, 1,
2.197427, 0.4195182, 3.864115, 1, 0, 0, 1, 1,
2.220589, -0.8726796, 3.105472, 1, 0, 0, 1, 1,
2.25306, 1.873477, 1.285287, 0, 0, 0, 1, 1,
2.319231, 0.4471233, 4.012856, 0, 0, 0, 1, 1,
2.332395, -0.2663187, 0.9280502, 0, 0, 0, 1, 1,
2.355848, -0.1558554, 2.79079, 0, 0, 0, 1, 1,
2.369045, -0.4650128, 1.917775, 0, 0, 0, 1, 1,
2.369699, 0.01801052, 1.87691, 0, 0, 0, 1, 1,
2.391389, -0.6012455, 2.039108, 0, 0, 0, 1, 1,
2.543206, 0.3505998, 1.346285, 1, 1, 1, 1, 1,
2.64474, 0.2730057, 2.387881, 1, 1, 1, 1, 1,
2.656584, 1.041847, 1.635618, 1, 1, 1, 1, 1,
2.793472, 0.6829052, 0.8133217, 1, 1, 1, 1, 1,
2.953943, 0.7398844, 0.9078335, 1, 1, 1, 1, 1,
3.024239, 0.5726151, 1.693222, 1, 1, 1, 1, 1,
3.160193, -1.577661, 2.594386, 1, 1, 1, 1, 1
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
var radius = 9.621955;
var distance = 33.79671;
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
mvMatrix.translate( 0.1862392, -0.04349566, -0.04062295 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79671);
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