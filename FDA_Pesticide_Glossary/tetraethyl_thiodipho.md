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
-3.288091, -1.284397, -1.383263, 1, 0, 0, 1,
-3.279691, -0.3200635, -0.9114363, 1, 0.007843138, 0, 1,
-2.906949, -0.5750362, -1.814625, 1, 0.01176471, 0, 1,
-2.77551, 0.07969577, -2.130372, 1, 0.01960784, 0, 1,
-2.709198, -0.9719918, -1.67245, 1, 0.02352941, 0, 1,
-2.695029, -1.574245, -0.8568718, 1, 0.03137255, 0, 1,
-2.693853, -1.318196, -1.791873, 1, 0.03529412, 0, 1,
-2.661371, -0.5562068, -1.849265, 1, 0.04313726, 0, 1,
-2.551799, -0.06262161, -1.894069, 1, 0.04705882, 0, 1,
-2.534554, 1.799786, -0.6247676, 1, 0.05490196, 0, 1,
-2.531274, -0.6863303, -2.718541, 1, 0.05882353, 0, 1,
-2.499742, 0.04180706, -2.473759, 1, 0.06666667, 0, 1,
-2.477623, -1.93897, -2.259682, 1, 0.07058824, 0, 1,
-2.443832, -1.403859, -1.002501, 1, 0.07843138, 0, 1,
-2.438092, 0.1718622, -0.6328431, 1, 0.08235294, 0, 1,
-2.38419, -0.1805754, -2.363759, 1, 0.09019608, 0, 1,
-2.342738, 0.1420647, -1.464216, 1, 0.09411765, 0, 1,
-2.262652, -1.418674, -1.636172, 1, 0.1019608, 0, 1,
-2.218654, -0.92235, -1.924172, 1, 0.1098039, 0, 1,
-2.215195, 0.09924927, -0.7960358, 1, 0.1137255, 0, 1,
-2.210393, -1.03096, -1.25847, 1, 0.1215686, 0, 1,
-2.20292, 0.5067321, -2.365009, 1, 0.1254902, 0, 1,
-2.201544, -0.2175948, -1.515602, 1, 0.1333333, 0, 1,
-2.185644, -0.8999903, -1.062111, 1, 0.1372549, 0, 1,
-2.166979, 1.451719, -0.6790167, 1, 0.145098, 0, 1,
-2.144012, 0.3277081, -1.561871, 1, 0.1490196, 0, 1,
-2.103245, -1.341802, -1.728344, 1, 0.1568628, 0, 1,
-2.044519, -1.025744, -1.696234, 1, 0.1607843, 0, 1,
-2.01182, 1.33079, -0.9722888, 1, 0.1686275, 0, 1,
-1.98498, 0.3372618, -1.167754, 1, 0.172549, 0, 1,
-1.935137, 0.6960686, -1.433523, 1, 0.1803922, 0, 1,
-1.918708, 1.23998, 0.6570885, 1, 0.1843137, 0, 1,
-1.903736, -1.475482, -1.351336, 1, 0.1921569, 0, 1,
-1.891277, -1.228967, -1.454963, 1, 0.1960784, 0, 1,
-1.870349, 0.3475132, -1.165611, 1, 0.2039216, 0, 1,
-1.867482, -1.166216, -3.220572, 1, 0.2117647, 0, 1,
-1.865331, -0.4827345, -0.4557274, 1, 0.2156863, 0, 1,
-1.852436, 0.2234595, -0.4918045, 1, 0.2235294, 0, 1,
-1.850249, 0.1292631, -1.468598, 1, 0.227451, 0, 1,
-1.819575, 0.3764485, -0.7136781, 1, 0.2352941, 0, 1,
-1.803844, 0.2473121, 0.8277133, 1, 0.2392157, 0, 1,
-1.78938, -0.1218877, -2.745565, 1, 0.2470588, 0, 1,
-1.787929, -1.015825, -2.851567, 1, 0.2509804, 0, 1,
-1.776571, 1.88041, 0.0293879, 1, 0.2588235, 0, 1,
-1.761891, -0.08693223, -3.351718, 1, 0.2627451, 0, 1,
-1.754613, 0.3195114, -2.039206, 1, 0.2705882, 0, 1,
-1.752236, -0.3323518, -1.457401, 1, 0.2745098, 0, 1,
-1.730546, 2.088522, 1.020244, 1, 0.282353, 0, 1,
-1.699517, 0.6870088, -0.4711215, 1, 0.2862745, 0, 1,
-1.697827, -1.005026, -0.1856898, 1, 0.2941177, 0, 1,
-1.671841, 0.4839274, -2.327083, 1, 0.3019608, 0, 1,
-1.663904, -1.282403, -2.703664, 1, 0.3058824, 0, 1,
-1.655273, 0.4088047, -0.009366944, 1, 0.3137255, 0, 1,
-1.630746, -0.5628572, -1.656176, 1, 0.3176471, 0, 1,
-1.621281, -0.8812522, -1.288873, 1, 0.3254902, 0, 1,
-1.615732, -0.9829255, -2.197268, 1, 0.3294118, 0, 1,
-1.615296, -0.2018903, -3.217539, 1, 0.3372549, 0, 1,
-1.611422, 0.2905001, -0.7881243, 1, 0.3411765, 0, 1,
-1.604042, -0.08250394, -1.358671, 1, 0.3490196, 0, 1,
-1.599912, 0.5057381, -1.294926, 1, 0.3529412, 0, 1,
-1.591073, -0.4618781, -2.447644, 1, 0.3607843, 0, 1,
-1.589167, 0.09324306, -0.9261946, 1, 0.3647059, 0, 1,
-1.586069, 0.3235849, -2.056921, 1, 0.372549, 0, 1,
-1.579183, 2.606904, -1.831189, 1, 0.3764706, 0, 1,
-1.569397, -0.7402387, -2.396776, 1, 0.3843137, 0, 1,
-1.556606, 1.648663, 0.5373712, 1, 0.3882353, 0, 1,
-1.53338, 1.026755, -3.43017, 1, 0.3960784, 0, 1,
-1.525759, -1.602776, -2.357198, 1, 0.4039216, 0, 1,
-1.519045, -0.07683536, -2.459727, 1, 0.4078431, 0, 1,
-1.515044, -0.7264999, -1.072829, 1, 0.4156863, 0, 1,
-1.494706, -1.940539, -1.384609, 1, 0.4196078, 0, 1,
-1.461712, 0.7267017, -1.435735, 1, 0.427451, 0, 1,
-1.44324, 1.382755, 0.2249854, 1, 0.4313726, 0, 1,
-1.44219, -1.368386, -1.58426, 1, 0.4392157, 0, 1,
-1.438663, 0.4794403, -1.019573, 1, 0.4431373, 0, 1,
-1.438042, -0.9614299, -0.8390356, 1, 0.4509804, 0, 1,
-1.436211, 0.5174238, -1.443529, 1, 0.454902, 0, 1,
-1.429601, 0.3905018, -1.543363, 1, 0.4627451, 0, 1,
-1.412168, 0.04980931, -0.1486108, 1, 0.4666667, 0, 1,
-1.410606, -0.09540655, -3.067364, 1, 0.4745098, 0, 1,
-1.398244, 0.3837342, 0.6609685, 1, 0.4784314, 0, 1,
-1.38662, -1.443111, -2.798072, 1, 0.4862745, 0, 1,
-1.379848, 0.9092999, -0.9828044, 1, 0.4901961, 0, 1,
-1.373774, 1.178393, -0.7900608, 1, 0.4980392, 0, 1,
-1.352942, 0.8235031, -2.306968, 1, 0.5058824, 0, 1,
-1.340583, -0.4643156, -1.793251, 1, 0.509804, 0, 1,
-1.333248, -1.139022, -3.435095, 1, 0.5176471, 0, 1,
-1.332193, -1.810919, -3.233592, 1, 0.5215687, 0, 1,
-1.329739, 0.8086303, -1.277874, 1, 0.5294118, 0, 1,
-1.329598, 0.583345, -0.7839386, 1, 0.5333334, 0, 1,
-1.307089, 0.8095734, -1.483915, 1, 0.5411765, 0, 1,
-1.28977, -0.05379599, -1.067534, 1, 0.5450981, 0, 1,
-1.276227, -0.646643, -0.9497267, 1, 0.5529412, 0, 1,
-1.267305, 0.05913046, -1.349853, 1, 0.5568628, 0, 1,
-1.262244, 0.5704018, -1.133882, 1, 0.5647059, 0, 1,
-1.261501, 0.1851736, -1.442081, 1, 0.5686275, 0, 1,
-1.258554, -0.9383857, -0.8056699, 1, 0.5764706, 0, 1,
-1.252291, 1.8526, -1.855228, 1, 0.5803922, 0, 1,
-1.248678, -1.24012, -2.69996, 1, 0.5882353, 0, 1,
-1.245791, -1.17234, -1.534251, 1, 0.5921569, 0, 1,
-1.243159, 0.4371687, -2.108207, 1, 0.6, 0, 1,
-1.241846, 1.010486, 0.4714936, 1, 0.6078432, 0, 1,
-1.236612, -0.1925287, -2.377147, 1, 0.6117647, 0, 1,
-1.232598, -0.3183667, -2.469975, 1, 0.6196079, 0, 1,
-1.228575, -0.6249813, -0.9026006, 1, 0.6235294, 0, 1,
-1.227512, -1.253539, -1.009069, 1, 0.6313726, 0, 1,
-1.212369, -0.9002923, -1.397912, 1, 0.6352941, 0, 1,
-1.208583, -0.3446012, -2.60282, 1, 0.6431373, 0, 1,
-1.192055, -0.1046074, -0.9144145, 1, 0.6470588, 0, 1,
-1.186704, 0.3223452, -2.750761, 1, 0.654902, 0, 1,
-1.184315, -0.4217933, -1.694505, 1, 0.6588235, 0, 1,
-1.172902, 1.280432, -0.3759007, 1, 0.6666667, 0, 1,
-1.171419, 0.3856953, -0.0649888, 1, 0.6705883, 0, 1,
-1.170668, -0.3291455, -1.288367, 1, 0.6784314, 0, 1,
-1.16764, 1.048582, -0.1443828, 1, 0.682353, 0, 1,
-1.163311, 0.2540209, -2.282757, 1, 0.6901961, 0, 1,
-1.16047, -0.2896963, -1.042605, 1, 0.6941177, 0, 1,
-1.160233, -0.5741099, -0.06829172, 1, 0.7019608, 0, 1,
-1.157762, 0.8369818, -1.295611, 1, 0.7098039, 0, 1,
-1.156533, -2.233752, -1.289844, 1, 0.7137255, 0, 1,
-1.156273, 1.899442, -0.5452467, 1, 0.7215686, 0, 1,
-1.152765, -0.5956782, -0.8436165, 1, 0.7254902, 0, 1,
-1.149855, -0.3651363, -1.871994, 1, 0.7333333, 0, 1,
-1.141849, -0.9676244, -2.566681, 1, 0.7372549, 0, 1,
-1.125719, 1.541606, 0.0270117, 1, 0.7450981, 0, 1,
-1.118868, -0.05859735, -2.471726, 1, 0.7490196, 0, 1,
-1.118064, -2.055684, -1.5547, 1, 0.7568628, 0, 1,
-1.116167, -0.2701502, -0.7388681, 1, 0.7607843, 0, 1,
-1.114361, -1.46127, -2.505226, 1, 0.7686275, 0, 1,
-1.110634, -1.936481, -4.167079, 1, 0.772549, 0, 1,
-1.106965, -0.5957243, -2.568512, 1, 0.7803922, 0, 1,
-1.097924, -0.4114597, -4.482336, 1, 0.7843137, 0, 1,
-1.094646, 0.5596554, -1.086031, 1, 0.7921569, 0, 1,
-1.087765, 0.7803393, -0.891779, 1, 0.7960784, 0, 1,
-1.084119, 0.03813261, -0.9781471, 1, 0.8039216, 0, 1,
-1.078995, -2.009683, -1.451381, 1, 0.8117647, 0, 1,
-1.076398, 0.4897378, -0.3726784, 1, 0.8156863, 0, 1,
-1.074996, 1.727097, -1.073705, 1, 0.8235294, 0, 1,
-1.061831, 0.7154524, -2.248819, 1, 0.827451, 0, 1,
-1.058202, -1.476099, -2.233039, 1, 0.8352941, 0, 1,
-1.055142, -0.9514742, -2.353687, 1, 0.8392157, 0, 1,
-1.053825, -0.240518, -2.826276, 1, 0.8470588, 0, 1,
-1.053242, -1.014514, -3.543451, 1, 0.8509804, 0, 1,
-1.043626, -0.3016469, -2.806561, 1, 0.8588235, 0, 1,
-1.038855, -0.02328727, -1.37809, 1, 0.8627451, 0, 1,
-1.038681, -1.978944, -1.235543, 1, 0.8705882, 0, 1,
-1.036898, 0.3321077, -1.469977, 1, 0.8745098, 0, 1,
-1.034767, 1.78338, -0.5693861, 1, 0.8823529, 0, 1,
-1.033718, -0.5426432, -1.099983, 1, 0.8862745, 0, 1,
-1.026412, -2.328829, -3.430463, 1, 0.8941177, 0, 1,
-1.025917, 0.009012741, -1.168542, 1, 0.8980392, 0, 1,
-1.024277, -0.2983359, -3.731579, 1, 0.9058824, 0, 1,
-1.022327, -0.5977134, -2.512787, 1, 0.9137255, 0, 1,
-1.010602, 0.4450237, 1.035659, 1, 0.9176471, 0, 1,
-1.002687, -0.504158, -1.200389, 1, 0.9254902, 0, 1,
-1.002457, -0.0484235, 0.4196069, 1, 0.9294118, 0, 1,
-1.002116, -0.727682, -2.37366, 1, 0.9372549, 0, 1,
-1.000108, 1.687443, -1.213068, 1, 0.9411765, 0, 1,
-0.9960551, 0.7135092, 0.1321179, 1, 0.9490196, 0, 1,
-0.9920876, -0.348968, -3.320212, 1, 0.9529412, 0, 1,
-0.9846916, -0.6920437, -2.161535, 1, 0.9607843, 0, 1,
-0.9827007, 0.5490233, 0.1741912, 1, 0.9647059, 0, 1,
-0.9822894, 2.412625, 0.1732551, 1, 0.972549, 0, 1,
-0.9782978, 0.4203285, -0.4702486, 1, 0.9764706, 0, 1,
-0.9706005, 0.08491398, -0.2102475, 1, 0.9843137, 0, 1,
-0.9688972, 0.5023066, -0.2748635, 1, 0.9882353, 0, 1,
-0.9682301, -1.688217, -3.490792, 1, 0.9960784, 0, 1,
-0.9643753, 0.6583873, -2.773464, 0.9960784, 1, 0, 1,
-0.9542378, -0.03822017, -1.019445, 0.9921569, 1, 0, 1,
-0.9526516, 0.2685494, -0.3901637, 0.9843137, 1, 0, 1,
-0.9518549, 0.5440007, -0.6829091, 0.9803922, 1, 0, 1,
-0.9482529, 1.121607, -0.2117238, 0.972549, 1, 0, 1,
-0.9406565, -0.211464, -2.280881, 0.9686275, 1, 0, 1,
-0.9401658, -0.1921236, -2.002174, 0.9607843, 1, 0, 1,
-0.9354232, 0.1390238, -2.476138, 0.9568627, 1, 0, 1,
-0.9307845, -0.5628441, -3.452153, 0.9490196, 1, 0, 1,
-0.9268165, 1.867922, -1.762872, 0.945098, 1, 0, 1,
-0.9252092, -0.4711062, -0.526519, 0.9372549, 1, 0, 1,
-0.9243202, -0.2259576, -0.597599, 0.9333333, 1, 0, 1,
-0.9228097, 0.8143879, -1.792549, 0.9254902, 1, 0, 1,
-0.9222083, -0.4232072, -3.592011, 0.9215686, 1, 0, 1,
-0.9166185, 0.5938616, -1.584958, 0.9137255, 1, 0, 1,
-0.9103363, -0.8086305, -1.870681, 0.9098039, 1, 0, 1,
-0.9087754, -1.123809, -1.985896, 0.9019608, 1, 0, 1,
-0.8857676, 0.273666, -1.409021, 0.8941177, 1, 0, 1,
-0.8830062, 0.1326756, -0.8412522, 0.8901961, 1, 0, 1,
-0.8816546, -2.123503, -2.264545, 0.8823529, 1, 0, 1,
-0.8782198, 0.2938312, -2.157245, 0.8784314, 1, 0, 1,
-0.8775898, -0.2578782, -2.705268, 0.8705882, 1, 0, 1,
-0.8730725, 0.8125286, 0.3856387, 0.8666667, 1, 0, 1,
-0.8723844, -0.7618681, -3.820619, 0.8588235, 1, 0, 1,
-0.8701687, -1.324835, -2.976969, 0.854902, 1, 0, 1,
-0.8698977, 0.1957421, -2.32984, 0.8470588, 1, 0, 1,
-0.8659824, -0.09993092, -1.555624, 0.8431373, 1, 0, 1,
-0.8607495, -1.234238, -2.1403, 0.8352941, 1, 0, 1,
-0.8607332, -0.2752872, -2.298826, 0.8313726, 1, 0, 1,
-0.8593925, -1.514933, -1.959246, 0.8235294, 1, 0, 1,
-0.8538256, 1.480812, -0.9716114, 0.8196079, 1, 0, 1,
-0.8521442, -1.607086, -4.975446, 0.8117647, 1, 0, 1,
-0.8358355, 0.1739106, -1.759867, 0.8078431, 1, 0, 1,
-0.8356478, 0.05947644, -1.349382, 0.8, 1, 0, 1,
-0.8346573, -0.363732, -1.883522, 0.7921569, 1, 0, 1,
-0.8325301, -0.1636852, -3.317046, 0.7882353, 1, 0, 1,
-0.830297, -0.6998383, -3.069642, 0.7803922, 1, 0, 1,
-0.8240264, 0.02884531, -2.656226, 0.7764706, 1, 0, 1,
-0.8235369, -1.229442, -1.43931, 0.7686275, 1, 0, 1,
-0.8174241, 0.4180555, -0.2610627, 0.7647059, 1, 0, 1,
-0.8136178, -1.138568, -1.163714, 0.7568628, 1, 0, 1,
-0.8100177, 0.5376864, -1.417732, 0.7529412, 1, 0, 1,
-0.8065547, -0.06190689, -1.21711, 0.7450981, 1, 0, 1,
-0.8047836, 0.3834916, -1.83652, 0.7411765, 1, 0, 1,
-0.8037955, -0.07748862, -2.286273, 0.7333333, 1, 0, 1,
-0.8013699, -0.8770398, -4.012792, 0.7294118, 1, 0, 1,
-0.7974633, -1.302662, -1.850086, 0.7215686, 1, 0, 1,
-0.7970936, 0.8098705, 0.2483204, 0.7176471, 1, 0, 1,
-0.7948747, 0.2905951, 1.906597, 0.7098039, 1, 0, 1,
-0.794728, 0.3947909, -1.485584, 0.7058824, 1, 0, 1,
-0.793472, 0.6279681, -1.398721, 0.6980392, 1, 0, 1,
-0.7877011, -0.3227589, -3.90015, 0.6901961, 1, 0, 1,
-0.7869213, 0.3390955, -2.139324, 0.6862745, 1, 0, 1,
-0.781193, -0.742196, -2.368149, 0.6784314, 1, 0, 1,
-0.7784235, -0.09194814, -1.385607, 0.6745098, 1, 0, 1,
-0.7777128, 1.275548, -1.649613, 0.6666667, 1, 0, 1,
-0.7769414, -0.4366084, -2.086087, 0.6627451, 1, 0, 1,
-0.7732289, 1.40807, 0.6709595, 0.654902, 1, 0, 1,
-0.7708535, 0.5254474, 0.3154264, 0.6509804, 1, 0, 1,
-0.7705902, 0.04646436, -1.944455, 0.6431373, 1, 0, 1,
-0.7675197, 0.2845188, -1.645999, 0.6392157, 1, 0, 1,
-0.7624811, -0.6670341, -1.708076, 0.6313726, 1, 0, 1,
-0.7607364, 0.09582897, -0.7596325, 0.627451, 1, 0, 1,
-0.7562252, 0.4987153, -3.341525, 0.6196079, 1, 0, 1,
-0.754593, -2.062078, -2.375613, 0.6156863, 1, 0, 1,
-0.752358, 1.189279, -1.907419, 0.6078432, 1, 0, 1,
-0.7521404, -0.4634847, -2.778058, 0.6039216, 1, 0, 1,
-0.7483749, -0.5327259, -3.999613, 0.5960785, 1, 0, 1,
-0.7408071, 0.05816143, -0.3676471, 0.5882353, 1, 0, 1,
-0.7389237, -2.253496, -3.527921, 0.5843138, 1, 0, 1,
-0.7379036, 0.246228, -0.6149177, 0.5764706, 1, 0, 1,
-0.7369711, -0.643569, -4.27202, 0.572549, 1, 0, 1,
-0.7362994, -1.744951, -2.755323, 0.5647059, 1, 0, 1,
-0.7341033, 0.3846527, -0.616824, 0.5607843, 1, 0, 1,
-0.7324505, -0.9246999, -3.675344, 0.5529412, 1, 0, 1,
-0.7315164, 1.922098, -0.6108636, 0.5490196, 1, 0, 1,
-0.7297425, 0.9148289, 0.6314374, 0.5411765, 1, 0, 1,
-0.7283554, 0.006232149, -2.909499, 0.5372549, 1, 0, 1,
-0.7271101, 0.3963535, 0.1447887, 0.5294118, 1, 0, 1,
-0.726606, -0.2055751, -1.929629, 0.5254902, 1, 0, 1,
-0.7242436, -0.04182353, -1.121618, 0.5176471, 1, 0, 1,
-0.7207626, 1.496001, -0.5279515, 0.5137255, 1, 0, 1,
-0.7168337, -0.1808483, -2.401877, 0.5058824, 1, 0, 1,
-0.7166244, 0.1536569, 0.2548737, 0.5019608, 1, 0, 1,
-0.7078475, -0.7683196, -3.365101, 0.4941176, 1, 0, 1,
-0.7066687, 1.118105, 0.07899655, 0.4862745, 1, 0, 1,
-0.7003497, 1.243467, -1.050063, 0.4823529, 1, 0, 1,
-0.6995152, -0.6869016, -4.563546, 0.4745098, 1, 0, 1,
-0.6979739, 0.04592961, -0.4344541, 0.4705882, 1, 0, 1,
-0.6943721, 0.0323363, -1.526764, 0.4627451, 1, 0, 1,
-0.6858281, -1.308985, -1.723459, 0.4588235, 1, 0, 1,
-0.6838565, 0.50951, 0.08769386, 0.4509804, 1, 0, 1,
-0.6756389, -1.903839, -2.048272, 0.4470588, 1, 0, 1,
-0.6736841, -0.7960995, -3.693158, 0.4392157, 1, 0, 1,
-0.6712704, -0.05725885, -1.550565, 0.4352941, 1, 0, 1,
-0.6702519, 1.409603, -0.1038983, 0.427451, 1, 0, 1,
-0.6685169, -0.7829562, -2.702224, 0.4235294, 1, 0, 1,
-0.665715, -1.137938, -2.304427, 0.4156863, 1, 0, 1,
-0.6648605, -1.04719, -3.405185, 0.4117647, 1, 0, 1,
-0.6646729, 0.750764, -0.2703543, 0.4039216, 1, 0, 1,
-0.6613349, -0.9779264, -5.159953, 0.3960784, 1, 0, 1,
-0.6612074, -0.7807272, -2.340305, 0.3921569, 1, 0, 1,
-0.6601102, 0.56892, -1.031457, 0.3843137, 1, 0, 1,
-0.65842, -1.614969, -2.994855, 0.3803922, 1, 0, 1,
-0.6555563, -0.4341858, -2.388208, 0.372549, 1, 0, 1,
-0.6481639, 0.6719382, -1.036552, 0.3686275, 1, 0, 1,
-0.6420445, -1.69944, -2.300084, 0.3607843, 1, 0, 1,
-0.6366106, -0.6206791, -1.464341, 0.3568628, 1, 0, 1,
-0.635786, -1.717832, -2.079544, 0.3490196, 1, 0, 1,
-0.6345349, 0.05878967, 0.2923147, 0.345098, 1, 0, 1,
-0.6298529, 1.724424, -1.76229, 0.3372549, 1, 0, 1,
-0.6280015, -1.478531, -2.069976, 0.3333333, 1, 0, 1,
-0.623809, 0.01417713, -1.999901, 0.3254902, 1, 0, 1,
-0.622348, 0.9276103, 0.6491768, 0.3215686, 1, 0, 1,
-0.6208226, 1.202673, 1.871248, 0.3137255, 1, 0, 1,
-0.6181002, -1.484431, -3.296021, 0.3098039, 1, 0, 1,
-0.6179368, 0.09583821, -1.389383, 0.3019608, 1, 0, 1,
-0.6129647, -0.9987491, -2.342603, 0.2941177, 1, 0, 1,
-0.6101842, 1.349893, -1.722989, 0.2901961, 1, 0, 1,
-0.6081023, 0.6882438, 0.7658255, 0.282353, 1, 0, 1,
-0.6038644, 0.6265072, -0.8345664, 0.2784314, 1, 0, 1,
-0.6008308, -0.1223858, -1.794601, 0.2705882, 1, 0, 1,
-0.5982295, -1.906837, -4.444115, 0.2666667, 1, 0, 1,
-0.5964374, 0.8322508, 1.147691, 0.2588235, 1, 0, 1,
-0.591728, 0.8047094, -0.5438744, 0.254902, 1, 0, 1,
-0.5913648, -0.3745852, -1.662405, 0.2470588, 1, 0, 1,
-0.5908188, -0.9997003, -2.842094, 0.2431373, 1, 0, 1,
-0.5889769, -0.8863918, -3.501678, 0.2352941, 1, 0, 1,
-0.5884415, -1.386698, -3.791147, 0.2313726, 1, 0, 1,
-0.5840279, 0.1478681, -0.2730515, 0.2235294, 1, 0, 1,
-0.5803252, -0.242532, -2.09951, 0.2196078, 1, 0, 1,
-0.57948, 2.629426, -0.8895484, 0.2117647, 1, 0, 1,
-0.5768244, -1.315972, -5.000696, 0.2078431, 1, 0, 1,
-0.5763605, 1.655233, 0.3549509, 0.2, 1, 0, 1,
-0.5717348, -0.8970607, -1.499424, 0.1921569, 1, 0, 1,
-0.5694847, 1.797518, -0.6700752, 0.1882353, 1, 0, 1,
-0.5693761, 1.439659, -0.2486828, 0.1803922, 1, 0, 1,
-0.564929, -0.8847193, -2.768779, 0.1764706, 1, 0, 1,
-0.5628852, 0.2492404, -1.476103, 0.1686275, 1, 0, 1,
-0.559493, 1.025653, -1.119625, 0.1647059, 1, 0, 1,
-0.5539714, 0.2415132, -1.699656, 0.1568628, 1, 0, 1,
-0.5530175, -0.6648866, -2.159214, 0.1529412, 1, 0, 1,
-0.5523432, 0.6451432, 0.1322107, 0.145098, 1, 0, 1,
-0.548277, 0.2492763, 0.4560898, 0.1411765, 1, 0, 1,
-0.5452924, 0.2185543, -1.811233, 0.1333333, 1, 0, 1,
-0.5439939, -0.8012799, -2.767624, 0.1294118, 1, 0, 1,
-0.5405418, -0.7590242, -4.564744, 0.1215686, 1, 0, 1,
-0.5386335, 0.2260525, -1.289407, 0.1176471, 1, 0, 1,
-0.5364475, -0.7993502, -1.983344, 0.1098039, 1, 0, 1,
-0.5364412, -0.6867763, -2.917501, 0.1058824, 1, 0, 1,
-0.5321868, 0.1786212, -1.765097, 0.09803922, 1, 0, 1,
-0.5280719, -0.8552728, -1.873835, 0.09019608, 1, 0, 1,
-0.5193747, -0.5444023, -2.237701, 0.08627451, 1, 0, 1,
-0.5130227, -0.6616663, -4.351591, 0.07843138, 1, 0, 1,
-0.5128872, 0.1151324, -0.3683495, 0.07450981, 1, 0, 1,
-0.5103461, 0.3418903, -1.301676, 0.06666667, 1, 0, 1,
-0.5097732, -0.6538256, -4.627871, 0.0627451, 1, 0, 1,
-0.5017921, 0.01507297, -1.335739, 0.05490196, 1, 0, 1,
-0.498995, -0.1077541, -2.378166, 0.05098039, 1, 0, 1,
-0.4975648, -0.4720712, -2.871443, 0.04313726, 1, 0, 1,
-0.497026, -0.1001763, -2.72929, 0.03921569, 1, 0, 1,
-0.4926794, 1.378264, 0.2641619, 0.03137255, 1, 0, 1,
-0.4879979, -2.001836, -3.598405, 0.02745098, 1, 0, 1,
-0.4846514, 0.2317777, 0.6369317, 0.01960784, 1, 0, 1,
-0.4846154, 0.09241801, -0.5985488, 0.01568628, 1, 0, 1,
-0.4828819, -0.9235313, -5.215413, 0.007843138, 1, 0, 1,
-0.4718881, -0.01833633, -2.990329, 0.003921569, 1, 0, 1,
-0.470069, 0.4423545, -2.307353, 0, 1, 0.003921569, 1,
-0.4668125, 0.5218994, -1.913698, 0, 1, 0.01176471, 1,
-0.4652022, -0.5987179, -2.301116, 0, 1, 0.01568628, 1,
-0.4647534, 0.3967956, -0.3540204, 0, 1, 0.02352941, 1,
-0.460427, 0.62776, 0.5930463, 0, 1, 0.02745098, 1,
-0.4601619, 1.03622, 0.1641279, 0, 1, 0.03529412, 1,
-0.4542825, -1.882062, -3.104217, 0, 1, 0.03921569, 1,
-0.4524012, -1.257025, -2.44727, 0, 1, 0.04705882, 1,
-0.4495093, -0.1991174, -2.255708, 0, 1, 0.05098039, 1,
-0.4467044, 1.138171, -0.1047614, 0, 1, 0.05882353, 1,
-0.4454497, -1.898951, -1.281247, 0, 1, 0.0627451, 1,
-0.4434618, -1.459602, -4.244047, 0, 1, 0.07058824, 1,
-0.4431245, 0.9316392, -1.695567, 0, 1, 0.07450981, 1,
-0.4381415, -1.392034, -0.2662027, 0, 1, 0.08235294, 1,
-0.437733, 0.7983659, -0.003837205, 0, 1, 0.08627451, 1,
-0.4250997, -0.5489478, -2.752239, 0, 1, 0.09411765, 1,
-0.4241395, 0.4418251, -2.869882, 0, 1, 0.1019608, 1,
-0.4204115, -0.7520037, -4.967283, 0, 1, 0.1058824, 1,
-0.4171907, -1.258936, -3.418288, 0, 1, 0.1137255, 1,
-0.4164947, 0.1280527, -2.241585, 0, 1, 0.1176471, 1,
-0.416278, -0.7341732, -0.8749123, 0, 1, 0.1254902, 1,
-0.4082902, -0.6275283, -1.131676, 0, 1, 0.1294118, 1,
-0.406703, 0.6446329, -0.06101996, 0, 1, 0.1372549, 1,
-0.4064024, 0.2208604, -0.5557628, 0, 1, 0.1411765, 1,
-0.3937028, 0.3146164, -1.268527, 0, 1, 0.1490196, 1,
-0.3933932, -0.3240751, -2.291572, 0, 1, 0.1529412, 1,
-0.391983, -1.404623, -2.229798, 0, 1, 0.1607843, 1,
-0.386676, 0.9017417, -0.9847336, 0, 1, 0.1647059, 1,
-0.3813008, 1.734619, 1.925783, 0, 1, 0.172549, 1,
-0.3805249, 0.1060514, -1.191423, 0, 1, 0.1764706, 1,
-0.377443, 0.8157856, -0.8209888, 0, 1, 0.1843137, 1,
-0.3757854, 0.1271976, -0.4660772, 0, 1, 0.1882353, 1,
-0.3727283, 0.1255746, -0.2185734, 0, 1, 0.1960784, 1,
-0.3714144, -1.384865, -3.008945, 0, 1, 0.2039216, 1,
-0.3685365, -1.238687, -3.30865, 0, 1, 0.2078431, 1,
-0.363123, 0.61035, -1.783523, 0, 1, 0.2156863, 1,
-0.3629505, 0.7655122, -0.6822236, 0, 1, 0.2196078, 1,
-0.3587102, -0.5000371, -2.271448, 0, 1, 0.227451, 1,
-0.3582137, -0.3867288, -2.369217, 0, 1, 0.2313726, 1,
-0.3536817, -0.5538174, -2.969101, 0, 1, 0.2392157, 1,
-0.3510951, -1.651967, -2.637125, 0, 1, 0.2431373, 1,
-0.3492146, 0.5411061, -0.9552754, 0, 1, 0.2509804, 1,
-0.3455909, 1.324645, -2.593843, 0, 1, 0.254902, 1,
-0.34345, -1.190993, -4.281317, 0, 1, 0.2627451, 1,
-0.3418859, -1.268292, -2.111273, 0, 1, 0.2666667, 1,
-0.3410032, 1.760852, -0.150006, 0, 1, 0.2745098, 1,
-0.33687, -0.5799152, -0.8811328, 0, 1, 0.2784314, 1,
-0.3339936, 0.3223957, -2.706834, 0, 1, 0.2862745, 1,
-0.3315794, -0.8181264, -2.089537, 0, 1, 0.2901961, 1,
-0.3288242, 1.632757, -2.084841, 0, 1, 0.2980392, 1,
-0.326739, 2.860169, -0.03302925, 0, 1, 0.3058824, 1,
-0.3211768, -0.7448524, -3.095484, 0, 1, 0.3098039, 1,
-0.3074967, 1.504194, -1.307063, 0, 1, 0.3176471, 1,
-0.3023647, 0.9101695, -1.066343, 0, 1, 0.3215686, 1,
-0.295504, 1.451682, -0.3160728, 0, 1, 0.3294118, 1,
-0.2954418, 0.8894384, 1.256512, 0, 1, 0.3333333, 1,
-0.2931667, 0.3559755, -0.06417271, 0, 1, 0.3411765, 1,
-0.2844552, 0.1112925, -0.9758264, 0, 1, 0.345098, 1,
-0.2814606, -1.479252, -1.956281, 0, 1, 0.3529412, 1,
-0.2784151, -1.268687, -1.720535, 0, 1, 0.3568628, 1,
-0.2767232, -0.5257329, -2.033589, 0, 1, 0.3647059, 1,
-0.2765952, 0.3806041, -1.290825, 0, 1, 0.3686275, 1,
-0.2742827, 0.09807625, -1.350123, 0, 1, 0.3764706, 1,
-0.2717373, 0.9899536, -1.496851, 0, 1, 0.3803922, 1,
-0.2695119, -1.301713, -2.67448, 0, 1, 0.3882353, 1,
-0.2666306, -0.8984748, -1.495777, 0, 1, 0.3921569, 1,
-0.2651185, 0.7235793, -1.221573, 0, 1, 0.4, 1,
-0.2641871, -0.9420133, -2.891035, 0, 1, 0.4078431, 1,
-0.2605411, -0.8546205, -3.458283, 0, 1, 0.4117647, 1,
-0.2578547, 1.614078, -1.164321, 0, 1, 0.4196078, 1,
-0.2559997, 0.1908879, -1.383687, 0, 1, 0.4235294, 1,
-0.2527334, -1.401222, -3.381235, 0, 1, 0.4313726, 1,
-0.2520734, 1.01913, 1.245906, 0, 1, 0.4352941, 1,
-0.2506645, -0.1288676, -0.0257096, 0, 1, 0.4431373, 1,
-0.2501638, 0.8235815, -0.2622121, 0, 1, 0.4470588, 1,
-0.2500213, 0.03901135, 0.2132296, 0, 1, 0.454902, 1,
-0.2473782, -0.6045179, -4.38594, 0, 1, 0.4588235, 1,
-0.2461487, -1.681915, -3.175654, 0, 1, 0.4666667, 1,
-0.2456316, 0.4995608, -1.021508, 0, 1, 0.4705882, 1,
-0.2439567, -0.5188863, -2.150463, 0, 1, 0.4784314, 1,
-0.2432005, 0.6648823, -0.6564866, 0, 1, 0.4823529, 1,
-0.2386976, -0.2937579, -1.702001, 0, 1, 0.4901961, 1,
-0.2383792, -0.3296325, -2.986869, 0, 1, 0.4941176, 1,
-0.2317039, -1.004327, -1.814951, 0, 1, 0.5019608, 1,
-0.2313624, -1.004666, -0.6133505, 0, 1, 0.509804, 1,
-0.2271443, -1.305374, -1.86652, 0, 1, 0.5137255, 1,
-0.2184537, 0.1101804, -1.152985, 0, 1, 0.5215687, 1,
-0.2107726, -0.4008481, -2.389469, 0, 1, 0.5254902, 1,
-0.203026, -1.930387, -2.982627, 0, 1, 0.5333334, 1,
-0.1983282, -0.03254837, -1.630892, 0, 1, 0.5372549, 1,
-0.1974993, 0.2661534, -0.7705743, 0, 1, 0.5450981, 1,
-0.1974195, -0.9038779, -3.301575, 0, 1, 0.5490196, 1,
-0.1958295, -0.1001054, -1.063177, 0, 1, 0.5568628, 1,
-0.1926771, -0.9964859, -2.646692, 0, 1, 0.5607843, 1,
-0.1895825, -1.319215, -2.525104, 0, 1, 0.5686275, 1,
-0.1876974, -0.4217992, -3.375386, 0, 1, 0.572549, 1,
-0.182435, 0.3635392, -0.09160443, 0, 1, 0.5803922, 1,
-0.1781219, -1.135891, -4.625909, 0, 1, 0.5843138, 1,
-0.1751456, -1.096385, -3.881614, 0, 1, 0.5921569, 1,
-0.1741781, -0.8195199, -3.960005, 0, 1, 0.5960785, 1,
-0.1736001, 1.645528, -0.6939519, 0, 1, 0.6039216, 1,
-0.1715363, 0.02135359, -1.111749, 0, 1, 0.6117647, 1,
-0.1709614, -0.6122057, -3.305277, 0, 1, 0.6156863, 1,
-0.1686782, -0.1922514, -1.293938, 0, 1, 0.6235294, 1,
-0.1620402, -0.8873137, -3.37809, 0, 1, 0.627451, 1,
-0.1584878, -0.07900313, -0.7352602, 0, 1, 0.6352941, 1,
-0.1560195, 1.470186, -1.290324, 0, 1, 0.6392157, 1,
-0.1516374, -0.2407335, -1.610733, 0, 1, 0.6470588, 1,
-0.149848, -1.590875, -2.663785, 0, 1, 0.6509804, 1,
-0.1473786, -0.1947515, -4.165925, 0, 1, 0.6588235, 1,
-0.1410422, -0.3549398, -2.213515, 0, 1, 0.6627451, 1,
-0.1408622, -0.4322619, -2.792485, 0, 1, 0.6705883, 1,
-0.1404388, 0.2707346, -2.022951, 0, 1, 0.6745098, 1,
-0.139036, -0.7372538, -2.799705, 0, 1, 0.682353, 1,
-0.1363713, -0.9759501, -2.660323, 0, 1, 0.6862745, 1,
-0.1354993, 0.9961199, 1.307334, 0, 1, 0.6941177, 1,
-0.1345683, -0.6139202, -1.734374, 0, 1, 0.7019608, 1,
-0.1331759, -0.1387389, -1.635904, 0, 1, 0.7058824, 1,
-0.1315806, -0.8380815, -4.102151, 0, 1, 0.7137255, 1,
-0.127683, 0.987326, 0.106736, 0, 1, 0.7176471, 1,
-0.124442, -0.732417, -1.87294, 0, 1, 0.7254902, 1,
-0.1176307, -1.29871, -2.560764, 0, 1, 0.7294118, 1,
-0.1175246, -0.02308257, -2.384902, 0, 1, 0.7372549, 1,
-0.1174778, -0.6218423, -2.76941, 0, 1, 0.7411765, 1,
-0.1145188, 1.324235, 0.03804103, 0, 1, 0.7490196, 1,
-0.1079222, 0.1571623, -1.084462, 0, 1, 0.7529412, 1,
-0.1077832, 1.932094, 0.2432565, 0, 1, 0.7607843, 1,
-0.1067608, 1.0238, -0.9264037, 0, 1, 0.7647059, 1,
-0.09889564, -0.635904, -4.250699, 0, 1, 0.772549, 1,
-0.09070256, -2.184383, -3.797605, 0, 1, 0.7764706, 1,
-0.08716077, 0.8725654, -1.566687, 0, 1, 0.7843137, 1,
-0.07654565, -1.458981, -3.921385, 0, 1, 0.7882353, 1,
-0.07349429, -0.6220652, -2.728622, 0, 1, 0.7960784, 1,
-0.07154321, -0.4197167, -2.815033, 0, 1, 0.8039216, 1,
-0.07038493, 1.075999, 1.554713, 0, 1, 0.8078431, 1,
-0.06769007, -1.174393, -2.984207, 0, 1, 0.8156863, 1,
-0.0562345, -1.291521, -3.704, 0, 1, 0.8196079, 1,
-0.05172426, 1.347082, 0.4678069, 0, 1, 0.827451, 1,
-0.04997493, 1.159518, 0.767176, 0, 1, 0.8313726, 1,
-0.04893688, 0.260796, -1.075134, 0, 1, 0.8392157, 1,
-0.04350594, 0.8977783, -1.172171, 0, 1, 0.8431373, 1,
-0.04299272, 1.144253, 0.1213245, 0, 1, 0.8509804, 1,
-0.03977496, 0.5253523, -0.425947, 0, 1, 0.854902, 1,
-0.03931863, 0.8102432, -0.1886102, 0, 1, 0.8627451, 1,
-0.03365126, -2.537084, -3.568702, 0, 1, 0.8666667, 1,
-0.03304033, 1.203052, -1.14769, 0, 1, 0.8745098, 1,
-0.03068102, -1.19429, -5.0316, 0, 1, 0.8784314, 1,
-0.02986028, -0.600715, -4.294779, 0, 1, 0.8862745, 1,
-0.02845731, -1.648188, -4.496102, 0, 1, 0.8901961, 1,
-0.0282221, 1.186496, -1.049624, 0, 1, 0.8980392, 1,
-0.02743171, 0.3084821, 1.051215, 0, 1, 0.9058824, 1,
-0.02696984, -0.6493669, -3.140646, 0, 1, 0.9098039, 1,
-0.02622383, -1.23931, -3.009299, 0, 1, 0.9176471, 1,
-0.02245033, -0.1406014, -2.400155, 0, 1, 0.9215686, 1,
-0.02082206, -0.7957543, -3.830528, 0, 1, 0.9294118, 1,
-0.01297096, 0.4106354, 0.7843493, 0, 1, 0.9333333, 1,
-0.01103678, 1.855251, -1.135494, 0, 1, 0.9411765, 1,
-0.01080452, -0.8137071, -3.714544, 0, 1, 0.945098, 1,
-0.01039565, -1.01667, -3.647276, 0, 1, 0.9529412, 1,
-0.01031755, -1.220829, -2.050439, 0, 1, 0.9568627, 1,
-0.008460212, -0.635588, -3.975743, 0, 1, 0.9647059, 1,
-0.002700545, -0.02266354, -3.10601, 0, 1, 0.9686275, 1,
0.00237228, 0.4655545, 0.4662315, 0, 1, 0.9764706, 1,
0.002730975, 1.117657, 0.5051693, 0, 1, 0.9803922, 1,
0.007736197, -0.24335, 2.506626, 0, 1, 0.9882353, 1,
0.009569188, 0.08547756, -1.450183, 0, 1, 0.9921569, 1,
0.01016284, -0.8329695, 4.011211, 0, 1, 1, 1,
0.01023127, -1.195796, 2.988403, 0, 0.9921569, 1, 1,
0.01238974, -0.1474762, 4.237376, 0, 0.9882353, 1, 1,
0.01248912, -0.3144898, 2.513494, 0, 0.9803922, 1, 1,
0.01385914, 1.178387, -0.7267462, 0, 0.9764706, 1, 1,
0.01639412, 0.385991, -0.5463749, 0, 0.9686275, 1, 1,
0.01842492, -1.085299, 1.310875, 0, 0.9647059, 1, 1,
0.0199457, 0.004817255, 0.66926, 0, 0.9568627, 1, 1,
0.02103304, 1.295887, -0.2658251, 0, 0.9529412, 1, 1,
0.02261475, -0.4664908, 2.664083, 0, 0.945098, 1, 1,
0.02663394, 0.7814609, 0.7113599, 0, 0.9411765, 1, 1,
0.02672324, 1.376972, 0.4311213, 0, 0.9333333, 1, 1,
0.02869067, 1.667644, 0.04825946, 0, 0.9294118, 1, 1,
0.03010015, 0.7379637, 0.5836262, 0, 0.9215686, 1, 1,
0.03197818, 1.045274, 0.9661168, 0, 0.9176471, 1, 1,
0.03215811, 0.8930907, -1.069736, 0, 0.9098039, 1, 1,
0.03395277, -2.13997, 3.281623, 0, 0.9058824, 1, 1,
0.03819541, 0.3407184, 0.5704101, 0, 0.8980392, 1, 1,
0.03949271, -0.8021758, 3.527637, 0, 0.8901961, 1, 1,
0.04283733, -1.245424, 3.543496, 0, 0.8862745, 1, 1,
0.0490867, -0.5131254, 2.311902, 0, 0.8784314, 1, 1,
0.05064776, -0.499006, 2.125164, 0, 0.8745098, 1, 1,
0.05418504, 0.7726473, 1.235674, 0, 0.8666667, 1, 1,
0.05967881, 1.09248, -0.1238734, 0, 0.8627451, 1, 1,
0.06318971, -0.2473733, 3.425066, 0, 0.854902, 1, 1,
0.06364329, -0.7094694, 1.735507, 0, 0.8509804, 1, 1,
0.0639473, -1.27193, 2.008724, 0, 0.8431373, 1, 1,
0.06560659, 1.113984, -0.8962064, 0, 0.8392157, 1, 1,
0.06946302, 0.7818204, 0.1220107, 0, 0.8313726, 1, 1,
0.07047708, -0.1108884, 2.780427, 0, 0.827451, 1, 1,
0.07149895, 0.6207884, 0.9441413, 0, 0.8196079, 1, 1,
0.07179494, 0.6285671, 0.7709301, 0, 0.8156863, 1, 1,
0.07259271, 0.6658303, 0.9796054, 0, 0.8078431, 1, 1,
0.07490292, -1.437038, 4.359941, 0, 0.8039216, 1, 1,
0.07834336, -0.2753618, 3.373966, 0, 0.7960784, 1, 1,
0.07930817, 0.5434937, 2.660388, 0, 0.7882353, 1, 1,
0.09195501, -1.48085, 0.7701039, 0, 0.7843137, 1, 1,
0.09405265, -0.06760385, 2.51792, 0, 0.7764706, 1, 1,
0.09435733, 0.02395725, -0.4117242, 0, 0.772549, 1, 1,
0.0973781, -1.522231, 4.643138, 0, 0.7647059, 1, 1,
0.09841004, -0.3968862, 4.671904, 0, 0.7607843, 1, 1,
0.1046024, 2.646746, -0.5419934, 0, 0.7529412, 1, 1,
0.1061412, 1.013363, 0.3807636, 0, 0.7490196, 1, 1,
0.1068869, 0.6136205, 0.08821455, 0, 0.7411765, 1, 1,
0.1091776, 0.6752915, -0.2958415, 0, 0.7372549, 1, 1,
0.1100313, 0.6851943, 0.2083078, 0, 0.7294118, 1, 1,
0.1117439, -1.297073, 3.058374, 0, 0.7254902, 1, 1,
0.1153619, -0.673946, 2.569328, 0, 0.7176471, 1, 1,
0.1165037, -0.9247455, 2.838703, 0, 0.7137255, 1, 1,
0.1165304, -1.728298, 3.808029, 0, 0.7058824, 1, 1,
0.1174545, 0.06274338, -0.3495957, 0, 0.6980392, 1, 1,
0.1200491, 0.8924698, 1.389449, 0, 0.6941177, 1, 1,
0.1216816, 0.7857785, -0.4447077, 0, 0.6862745, 1, 1,
0.1265959, 0.1973338, 0.3076652, 0, 0.682353, 1, 1,
0.1277706, 0.2887968, -0.6445837, 0, 0.6745098, 1, 1,
0.1312217, 0.4488378, 0.4918217, 0, 0.6705883, 1, 1,
0.1315375, 0.9294477, 0.3495398, 0, 0.6627451, 1, 1,
0.1319332, 0.1541144, 2.348393, 0, 0.6588235, 1, 1,
0.1356913, -0.9710487, 3.936782, 0, 0.6509804, 1, 1,
0.1375161, -0.9490183, 3.749802, 0, 0.6470588, 1, 1,
0.1449717, -1.891437, 2.954013, 0, 0.6392157, 1, 1,
0.1471608, 0.7969338, 1.197507, 0, 0.6352941, 1, 1,
0.14824, -0.2579369, 2.926815, 0, 0.627451, 1, 1,
0.1488463, -0.2165595, 4.323123, 0, 0.6235294, 1, 1,
0.1499007, 0.4381752, 0.1956059, 0, 0.6156863, 1, 1,
0.1509832, 0.05068071, 0.6501097, 0, 0.6117647, 1, 1,
0.1515526, 1.755899, 0.002402018, 0, 0.6039216, 1, 1,
0.1527421, -0.1424935, 2.987842, 0, 0.5960785, 1, 1,
0.1546704, 2.055012, -1.726629, 0, 0.5921569, 1, 1,
0.1589451, 0.8543604, 1.612653, 0, 0.5843138, 1, 1,
0.1610034, 0.3482907, 0.8664308, 0, 0.5803922, 1, 1,
0.1641401, -0.9023522, 2.568874, 0, 0.572549, 1, 1,
0.1657567, 0.02754614, 0.3382822, 0, 0.5686275, 1, 1,
0.1669523, -1.37764, 3.042253, 0, 0.5607843, 1, 1,
0.1684126, 1.486731, 0.1757302, 0, 0.5568628, 1, 1,
0.1770523, 1.341532, 1.071369, 0, 0.5490196, 1, 1,
0.1824809, 0.2446087, 1.068093, 0, 0.5450981, 1, 1,
0.1829793, 0.07649641, 0.5697982, 0, 0.5372549, 1, 1,
0.1832032, -2.509321, 3.519003, 0, 0.5333334, 1, 1,
0.1859347, 0.6251384, -0.4786024, 0, 0.5254902, 1, 1,
0.1860115, 0.2939782, 1.12937, 0, 0.5215687, 1, 1,
0.1901359, -0.7393096, 1.561035, 0, 0.5137255, 1, 1,
0.1931208, 1.576201, -0.117995, 0, 0.509804, 1, 1,
0.1969715, -1.125082, 5.265718, 0, 0.5019608, 1, 1,
0.199609, 0.297288, 0.9214719, 0, 0.4941176, 1, 1,
0.2011047, -0.06297543, 1.528452, 0, 0.4901961, 1, 1,
0.203368, -0.02214069, 0.8884224, 0, 0.4823529, 1, 1,
0.2052216, -0.02346484, 1.718558, 0, 0.4784314, 1, 1,
0.2116135, -1.860849, 1.913467, 0, 0.4705882, 1, 1,
0.2124882, -0.06289802, 3.15005, 0, 0.4666667, 1, 1,
0.2191923, 0.9736943, 3.061078, 0, 0.4588235, 1, 1,
0.2212186, -1.109435, 3.806645, 0, 0.454902, 1, 1,
0.2226052, 0.1589765, 0.3888583, 0, 0.4470588, 1, 1,
0.2316879, -0.7334674, 3.101424, 0, 0.4431373, 1, 1,
0.2321694, -1.84778, 3.444801, 0, 0.4352941, 1, 1,
0.2412209, 0.7902724, -0.05032703, 0, 0.4313726, 1, 1,
0.2422701, 0.1630616, 1.07062, 0, 0.4235294, 1, 1,
0.2484298, -1.633702, 1.258064, 0, 0.4196078, 1, 1,
0.249422, 0.9184909, -0.9081585, 0, 0.4117647, 1, 1,
0.2529446, -0.9690448, 3.198696, 0, 0.4078431, 1, 1,
0.2544149, -0.5624484, 1.55128, 0, 0.4, 1, 1,
0.2548635, 0.6573108, 0.3007544, 0, 0.3921569, 1, 1,
0.2551645, 1.074037, 0.05610169, 0, 0.3882353, 1, 1,
0.2558735, -0.4036993, 3.910576, 0, 0.3803922, 1, 1,
0.2597678, -0.1415137, 1.193087, 0, 0.3764706, 1, 1,
0.2610957, -0.2720703, 4.339565, 0, 0.3686275, 1, 1,
0.2619387, -1.120076, 2.651848, 0, 0.3647059, 1, 1,
0.2620325, -0.2457349, 1.186969, 0, 0.3568628, 1, 1,
0.2657852, -0.1874072, 2.427258, 0, 0.3529412, 1, 1,
0.2694415, -0.1225149, 1.934289, 0, 0.345098, 1, 1,
0.2724009, 1.278062, -1.532825, 0, 0.3411765, 1, 1,
0.276493, 0.2662833, 3.859154, 0, 0.3333333, 1, 1,
0.2788969, -0.3625875, 3.453979, 0, 0.3294118, 1, 1,
0.2806583, 1.319008, -1.160975, 0, 0.3215686, 1, 1,
0.2816752, -0.3105781, 2.752516, 0, 0.3176471, 1, 1,
0.2846507, -0.1525653, 3.989845, 0, 0.3098039, 1, 1,
0.2898856, -0.6891781, 3.202718, 0, 0.3058824, 1, 1,
0.2907381, -0.282066, 2.048235, 0, 0.2980392, 1, 1,
0.2947675, 0.09214992, -0.0512301, 0, 0.2901961, 1, 1,
0.2982316, 0.87059, -1.135582, 0, 0.2862745, 1, 1,
0.3003921, -1.003461, 2.704416, 0, 0.2784314, 1, 1,
0.3050613, 0.1169737, 0.6895762, 0, 0.2745098, 1, 1,
0.3188953, -1.0085, 2.078293, 0, 0.2666667, 1, 1,
0.3214524, -1.44943, 2.959042, 0, 0.2627451, 1, 1,
0.3220862, 0.8262604, 1.304815, 0, 0.254902, 1, 1,
0.3224716, -1.762572, 3.427324, 0, 0.2509804, 1, 1,
0.3241344, -1.243716, 3.738862, 0, 0.2431373, 1, 1,
0.3264117, 0.3940865, -1.020779, 0, 0.2392157, 1, 1,
0.3270609, -0.7872055, 3.72266, 0, 0.2313726, 1, 1,
0.3279773, 0.8915496, 1.228547, 0, 0.227451, 1, 1,
0.3298188, -0.4159433, 2.423312, 0, 0.2196078, 1, 1,
0.3359218, 1.026631, -0.08514425, 0, 0.2156863, 1, 1,
0.3396917, -0.8905306, 3.746717, 0, 0.2078431, 1, 1,
0.3407259, -1.393917, 2.211542, 0, 0.2039216, 1, 1,
0.344041, 1.41343, -0.6344837, 0, 0.1960784, 1, 1,
0.3443128, -0.2814108, 1.898441, 0, 0.1882353, 1, 1,
0.3484837, 0.3819729, -1.012429, 0, 0.1843137, 1, 1,
0.349189, 0.247849, 1.785333, 0, 0.1764706, 1, 1,
0.3496027, -1.834103, 3.97074, 0, 0.172549, 1, 1,
0.3524153, -1.001155, 3.301275, 0, 0.1647059, 1, 1,
0.3548982, -0.3755651, 1.573178, 0, 0.1607843, 1, 1,
0.3564413, -0.5120184, 4.202945, 0, 0.1529412, 1, 1,
0.3606805, -0.3216454, 1.283767, 0, 0.1490196, 1, 1,
0.3613575, 0.7996868, -1.575229, 0, 0.1411765, 1, 1,
0.3645391, 0.2375149, -1.413268, 0, 0.1372549, 1, 1,
0.3703863, -0.4457353, 1.026624, 0, 0.1294118, 1, 1,
0.3713003, 1.135564, 0.2772227, 0, 0.1254902, 1, 1,
0.3742428, 0.5559573, 0.1924953, 0, 0.1176471, 1, 1,
0.3747293, 1.593128, -0.3167046, 0, 0.1137255, 1, 1,
0.3848779, 1.239962, 0.5229064, 0, 0.1058824, 1, 1,
0.3875928, 0.5111614, 0.7879837, 0, 0.09803922, 1, 1,
0.3886573, 0.2893427, -0.825234, 0, 0.09411765, 1, 1,
0.3895321, -0.4894756, 2.933223, 0, 0.08627451, 1, 1,
0.3908148, -0.1672493, 2.159583, 0, 0.08235294, 1, 1,
0.3937179, 1.963244, 0.2813316, 0, 0.07450981, 1, 1,
0.3939838, 1.239504, 1.27955, 0, 0.07058824, 1, 1,
0.3989376, -0.1984504, 2.706841, 0, 0.0627451, 1, 1,
0.4003637, 1.34155, 0.8888643, 0, 0.05882353, 1, 1,
0.4004487, 0.6482928, 1.834501, 0, 0.05098039, 1, 1,
0.4030448, 0.1350368, 0.8260561, 0, 0.04705882, 1, 1,
0.4063502, -1.774687, 3.402175, 0, 0.03921569, 1, 1,
0.4067236, 1.767443, -2.239079, 0, 0.03529412, 1, 1,
0.4116478, 0.04623095, 0.8318903, 0, 0.02745098, 1, 1,
0.4129969, 0.1325012, -0.5092203, 0, 0.02352941, 1, 1,
0.4214227, 0.5583681, 1.60347, 0, 0.01568628, 1, 1,
0.4308599, -0.1869412, 1.468959, 0, 0.01176471, 1, 1,
0.4313393, 0.04664886, 0.7078288, 0, 0.003921569, 1, 1,
0.4332707, 0.5623954, 1.059471, 0.003921569, 0, 1, 1,
0.4372882, -1.370327, 1.885418, 0.007843138, 0, 1, 1,
0.4417192, -0.2704021, 1.789253, 0.01568628, 0, 1, 1,
0.442957, 0.3073184, 3.944843, 0.01960784, 0, 1, 1,
0.4439951, -0.1787255, 1.631112, 0.02745098, 0, 1, 1,
0.4470842, 0.176303, 2.183225, 0.03137255, 0, 1, 1,
0.4484433, -0.9889131, 2.312826, 0.03921569, 0, 1, 1,
0.4488496, -0.632762, 2.010566, 0.04313726, 0, 1, 1,
0.4510044, 0.3982521, 1.615539, 0.05098039, 0, 1, 1,
0.4513263, 0.5466908, 1.354614, 0.05490196, 0, 1, 1,
0.4518493, -1.778204, 2.972447, 0.0627451, 0, 1, 1,
0.4522171, -0.1968753, 2.003356, 0.06666667, 0, 1, 1,
0.4537857, 1.60596, 0.3800491, 0.07450981, 0, 1, 1,
0.4567646, 1.630888, 0.5900033, 0.07843138, 0, 1, 1,
0.4613532, -0.07719167, 1.640773, 0.08627451, 0, 1, 1,
0.4616601, 2.108912, -0.1090062, 0.09019608, 0, 1, 1,
0.463208, -0.5870043, 3.587463, 0.09803922, 0, 1, 1,
0.4713461, -1.519657, 5.378929, 0.1058824, 0, 1, 1,
0.4714667, 0.7606369, -0.6893721, 0.1098039, 0, 1, 1,
0.4715563, -1.342448, 3.380641, 0.1176471, 0, 1, 1,
0.4728331, -0.371246, 1.049576, 0.1215686, 0, 1, 1,
0.4729695, -1.086702, 4.057069, 0.1294118, 0, 1, 1,
0.4754224, -0.3032222, 2.950842, 0.1333333, 0, 1, 1,
0.4768798, 1.549421, -0.03112497, 0.1411765, 0, 1, 1,
0.4791589, -0.4629565, 2.252128, 0.145098, 0, 1, 1,
0.4796416, 0.5373782, -0.6360647, 0.1529412, 0, 1, 1,
0.4829228, 1.651026, -0.2449279, 0.1568628, 0, 1, 1,
0.490117, 1.069865, 1.245694, 0.1647059, 0, 1, 1,
0.5137113, -0.7154216, 1.501131, 0.1686275, 0, 1, 1,
0.5168404, 1.056885, -0.02191401, 0.1764706, 0, 1, 1,
0.5258512, 1.150716, -1.636947, 0.1803922, 0, 1, 1,
0.5314058, 2.13549, -0.5148558, 0.1882353, 0, 1, 1,
0.5327656, -1.230582, 3.289248, 0.1921569, 0, 1, 1,
0.5372792, 1.445727, 0.181368, 0.2, 0, 1, 1,
0.5392644, -0.3049417, 0.8823782, 0.2078431, 0, 1, 1,
0.5516456, -0.5059784, 3.478371, 0.2117647, 0, 1, 1,
0.5602655, 0.9427696, 0.4210172, 0.2196078, 0, 1, 1,
0.5625433, -0.1220462, 1.624932, 0.2235294, 0, 1, 1,
0.5652538, -0.1358164, 1.851255, 0.2313726, 0, 1, 1,
0.5671617, 0.1589004, 1.915535, 0.2352941, 0, 1, 1,
0.5734966, -1.002745, 3.290625, 0.2431373, 0, 1, 1,
0.5786059, 0.7118952, 0.3164743, 0.2470588, 0, 1, 1,
0.5811503, -0.4657397, 1.468597, 0.254902, 0, 1, 1,
0.5830527, -0.3545716, 2.946229, 0.2588235, 0, 1, 1,
0.5844924, 0.2227845, 1.969789, 0.2666667, 0, 1, 1,
0.5861337, -0.1030777, 1.029958, 0.2705882, 0, 1, 1,
0.5866054, 1.84776, 0.4710099, 0.2784314, 0, 1, 1,
0.5875158, 0.7010504, 0.5020813, 0.282353, 0, 1, 1,
0.5890464, -1.233657, 0.9840219, 0.2901961, 0, 1, 1,
0.5891587, 0.4037987, 2.120178, 0.2941177, 0, 1, 1,
0.5951191, 0.3827019, 0.7885062, 0.3019608, 0, 1, 1,
0.595371, -1.459524, 2.612844, 0.3098039, 0, 1, 1,
0.5967997, -1.254593, 4.417111, 0.3137255, 0, 1, 1,
0.6008967, -1.835857, 4.38639, 0.3215686, 0, 1, 1,
0.6012997, 0.3993371, 1.21971, 0.3254902, 0, 1, 1,
0.6015193, -0.9218926, 2.32543, 0.3333333, 0, 1, 1,
0.6052957, -0.2098888, 3.252734, 0.3372549, 0, 1, 1,
0.6063541, 0.1361746, 1.197496, 0.345098, 0, 1, 1,
0.6070176, 1.656155, -1.478772, 0.3490196, 0, 1, 1,
0.6109697, 0.9289958, 0.5122993, 0.3568628, 0, 1, 1,
0.6168235, -0.4094337, 2.425869, 0.3607843, 0, 1, 1,
0.6198829, -0.5416113, 2.687904, 0.3686275, 0, 1, 1,
0.6213408, -0.5948094, 3.944919, 0.372549, 0, 1, 1,
0.6213785, 0.1273642, 1.662321, 0.3803922, 0, 1, 1,
0.631627, 1.479436, 0.3766981, 0.3843137, 0, 1, 1,
0.6320272, 0.2611672, 3.658803, 0.3921569, 0, 1, 1,
0.6327931, -0.5256108, 1.674468, 0.3960784, 0, 1, 1,
0.6372699, -1.455338, 2.987713, 0.4039216, 0, 1, 1,
0.6373344, 1.939054, -0.07689592, 0.4117647, 0, 1, 1,
0.6375892, 0.7639555, 2.006038, 0.4156863, 0, 1, 1,
0.6448674, -1.035371, 3.970832, 0.4235294, 0, 1, 1,
0.6454506, -1.173495, 3.582068, 0.427451, 0, 1, 1,
0.6464415, 1.590349, -0.6082558, 0.4352941, 0, 1, 1,
0.6479984, -1.051523, 2.880857, 0.4392157, 0, 1, 1,
0.6518489, -0.1477141, 2.314865, 0.4470588, 0, 1, 1,
0.6566198, 1.270135, -1.272421, 0.4509804, 0, 1, 1,
0.6597973, -0.1019577, 0.444688, 0.4588235, 0, 1, 1,
0.6601138, 0.5207863, 0.5215868, 0.4627451, 0, 1, 1,
0.6682308, -0.3678473, 2.813663, 0.4705882, 0, 1, 1,
0.6694415, 0.5565113, 1.274655, 0.4745098, 0, 1, 1,
0.6696922, -0.1494626, 3.527174, 0.4823529, 0, 1, 1,
0.673381, -0.182782, 2.653258, 0.4862745, 0, 1, 1,
0.6743454, 0.2779711, 1.814865, 0.4941176, 0, 1, 1,
0.6821254, 1.208549, 0.6388459, 0.5019608, 0, 1, 1,
0.6826985, -0.05835412, 1.625934, 0.5058824, 0, 1, 1,
0.6845798, -1.282017, 2.125147, 0.5137255, 0, 1, 1,
0.6882605, 0.4282522, 0.1747921, 0.5176471, 0, 1, 1,
0.6932452, -2.197933, 2.258139, 0.5254902, 0, 1, 1,
0.7022709, 1.346516, -1.817069, 0.5294118, 0, 1, 1,
0.7045396, 0.2959012, 2.015615, 0.5372549, 0, 1, 1,
0.7084131, 0.1540635, 0.3484023, 0.5411765, 0, 1, 1,
0.7088282, 1.722816, 0.6667479, 0.5490196, 0, 1, 1,
0.7099959, 1.228059, 1.612938, 0.5529412, 0, 1, 1,
0.7113578, 0.6149504, -0.2170579, 0.5607843, 0, 1, 1,
0.7122038, 0.6878108, 1.131532, 0.5647059, 0, 1, 1,
0.7180654, 0.6211715, 0.8789549, 0.572549, 0, 1, 1,
0.7196935, -0.9643612, 2.327129, 0.5764706, 0, 1, 1,
0.7240229, -0.7101467, 1.0658, 0.5843138, 0, 1, 1,
0.7242475, 0.7681892, 0.9482183, 0.5882353, 0, 1, 1,
0.7249684, -0.7397177, 3.806906, 0.5960785, 0, 1, 1,
0.7318525, -0.1615268, 0.8950324, 0.6039216, 0, 1, 1,
0.7323154, -0.1226005, 1.237045, 0.6078432, 0, 1, 1,
0.732357, -0.7747004, 2.819177, 0.6156863, 0, 1, 1,
0.7348479, 0.3858597, 0.7301725, 0.6196079, 0, 1, 1,
0.7348516, -0.6055469, 1.875529, 0.627451, 0, 1, 1,
0.7376101, -0.5835515, 2.249318, 0.6313726, 0, 1, 1,
0.7386357, -0.03490353, 3.761975, 0.6392157, 0, 1, 1,
0.741761, 0.16665, 2.093035, 0.6431373, 0, 1, 1,
0.7479042, 0.1247504, 0.4373896, 0.6509804, 0, 1, 1,
0.748951, 0.5178565, 0.2564284, 0.654902, 0, 1, 1,
0.7516726, 0.08319292, 0.885348, 0.6627451, 0, 1, 1,
0.7537296, -0.08438494, 0.8594093, 0.6666667, 0, 1, 1,
0.7542805, 0.1058789, 1.212941, 0.6745098, 0, 1, 1,
0.7544367, 0.002113883, 0.9226784, 0.6784314, 0, 1, 1,
0.7557065, 0.7405635, 2.006068, 0.6862745, 0, 1, 1,
0.7564634, -0.6242515, 2.681148, 0.6901961, 0, 1, 1,
0.7604682, -2.152614, 2.591139, 0.6980392, 0, 1, 1,
0.7610859, -0.1497267, 1.884951, 0.7058824, 0, 1, 1,
0.7621008, -0.7281393, 2.662246, 0.7098039, 0, 1, 1,
0.7625712, -1.095636, 2.480312, 0.7176471, 0, 1, 1,
0.7742184, -0.7130607, 1.825321, 0.7215686, 0, 1, 1,
0.7760194, -0.3594527, 2.512397, 0.7294118, 0, 1, 1,
0.7771276, 1.196054, -0.510789, 0.7333333, 0, 1, 1,
0.7795532, -1.672093, 0.5339717, 0.7411765, 0, 1, 1,
0.7868053, -0.031435, 3.173425, 0.7450981, 0, 1, 1,
0.7874683, 0.6036887, 1.07861, 0.7529412, 0, 1, 1,
0.7901614, -1.049307, 1.826282, 0.7568628, 0, 1, 1,
0.792951, -3.17144, 3.275954, 0.7647059, 0, 1, 1,
0.7959154, -0.2961981, 1.569904, 0.7686275, 0, 1, 1,
0.8020333, -0.1414776, 2.86682, 0.7764706, 0, 1, 1,
0.8054373, -0.4064645, 2.348633, 0.7803922, 0, 1, 1,
0.8133246, 0.9744647, -0.4783658, 0.7882353, 0, 1, 1,
0.8161306, 0.3604254, 0.8269465, 0.7921569, 0, 1, 1,
0.8208509, -0.6198699, 3.052194, 0.8, 0, 1, 1,
0.8219652, -0.6476725, 1.933423, 0.8078431, 0, 1, 1,
0.8247583, -0.2776143, -0.455406, 0.8117647, 0, 1, 1,
0.8338413, -0.7508357, 0.2824332, 0.8196079, 0, 1, 1,
0.8371671, -0.02419707, 1.280918, 0.8235294, 0, 1, 1,
0.8388484, 0.08510016, 0.8283227, 0.8313726, 0, 1, 1,
0.8434307, -0.4342343, 0.7298732, 0.8352941, 0, 1, 1,
0.8454, -0.1211656, 2.756679, 0.8431373, 0, 1, 1,
0.8481203, 0.845634, 0.5778442, 0.8470588, 0, 1, 1,
0.8527709, -1.23116, 3.145117, 0.854902, 0, 1, 1,
0.8610442, 0.8753813, 1.29027, 0.8588235, 0, 1, 1,
0.8639045, 1.284636, 1.144445, 0.8666667, 0, 1, 1,
0.8642143, 2.166033, 1.075467, 0.8705882, 0, 1, 1,
0.880008, -0.6252736, 1.601345, 0.8784314, 0, 1, 1,
0.8806399, -0.2160775, 1.084198, 0.8823529, 0, 1, 1,
0.8808403, 0.8731803, -0.9830338, 0.8901961, 0, 1, 1,
0.8839999, -2.108068, 3.22933, 0.8941177, 0, 1, 1,
0.8911218, -0.6206495, 1.54718, 0.9019608, 0, 1, 1,
0.894448, -1.793497, 1.843472, 0.9098039, 0, 1, 1,
0.8958827, 1.215642, 2.386015, 0.9137255, 0, 1, 1,
0.8994303, 0.600748, 1.434798, 0.9215686, 0, 1, 1,
0.9003088, -0.01815996, 0.2914495, 0.9254902, 0, 1, 1,
0.9055972, -1.6405, 3.811041, 0.9333333, 0, 1, 1,
0.9059882, 0.09089454, 2.118286, 0.9372549, 0, 1, 1,
0.9060146, -0.03096744, 0.5242435, 0.945098, 0, 1, 1,
0.9104425, 0.265354, 0.4367213, 0.9490196, 0, 1, 1,
0.9136504, 0.7006302, -0.6336874, 0.9568627, 0, 1, 1,
0.9182063, -0.4151578, 1.373744, 0.9607843, 0, 1, 1,
0.9217296, -1.643676, 2.705784, 0.9686275, 0, 1, 1,
0.9225468, 1.259164, -0.2500264, 0.972549, 0, 1, 1,
0.9229952, 3.620785, 2.423514, 0.9803922, 0, 1, 1,
0.927261, -0.1029535, 0.9779288, 0.9843137, 0, 1, 1,
0.9304748, 1.012373, 0.8146868, 0.9921569, 0, 1, 1,
0.9317487, -0.1963435, 1.313576, 0.9960784, 0, 1, 1,
0.9463298, -0.002082367, 2.593378, 1, 0, 0.9960784, 1,
0.9630886, 0.4359164, 1.620846, 1, 0, 0.9882353, 1,
0.9679235, 0.1635465, 0.007980675, 1, 0, 0.9843137, 1,
0.9775937, -0.02777796, 2.155047, 1, 0, 0.9764706, 1,
0.9806295, -0.0910736, 0.8234344, 1, 0, 0.972549, 1,
0.9834238, -1.72889, 4.634319, 1, 0, 0.9647059, 1,
0.9896942, -0.02331968, 1.622348, 1, 0, 0.9607843, 1,
0.9964374, 0.1714264, -0.183374, 1, 0, 0.9529412, 1,
0.9981182, -0.5114031, 3.630679, 1, 0, 0.9490196, 1,
0.9988358, -0.08178419, 2.322062, 1, 0, 0.9411765, 1,
0.999724, 0.4855041, -1.096413, 1, 0, 0.9372549, 1,
1.014763, 1.233231, -0.5714872, 1, 0, 0.9294118, 1,
1.014834, -1.019736, 3.661162, 1, 0, 0.9254902, 1,
1.025177, 1.905943, 1.316884, 1, 0, 0.9176471, 1,
1.032326, -0.7136971, 2.161633, 1, 0, 0.9137255, 1,
1.035005, 1.099549, 1.144702, 1, 0, 0.9058824, 1,
1.045769, 0.09077593, 0.8922461, 1, 0, 0.9019608, 1,
1.053339, 0.06661396, 1.814227, 1, 0, 0.8941177, 1,
1.055816, 1.72459, 0.124926, 1, 0, 0.8862745, 1,
1.056096, -1.600084, 2.404559, 1, 0, 0.8823529, 1,
1.057698, -0.7501627, 1.241286, 1, 0, 0.8745098, 1,
1.058185, -0.8229453, 1.453895, 1, 0, 0.8705882, 1,
1.059251, 0.8230301, 1.721755, 1, 0, 0.8627451, 1,
1.065822, -2.766733, 4.598318, 1, 0, 0.8588235, 1,
1.066607, -1.41188, 2.424731, 1, 0, 0.8509804, 1,
1.069617, 0.8801335, 0.7047319, 1, 0, 0.8470588, 1,
1.070072, 0.1750626, 1.665349, 1, 0, 0.8392157, 1,
1.072053, -0.588679, 2.728008, 1, 0, 0.8352941, 1,
1.074621, -0.348613, 1.48213, 1, 0, 0.827451, 1,
1.081936, -2.095295, 0.8884513, 1, 0, 0.8235294, 1,
1.093952, -1.331551, 2.914724, 1, 0, 0.8156863, 1,
1.101453, -1.295344, 3.838524, 1, 0, 0.8117647, 1,
1.102194, 1.037306, 0.8370342, 1, 0, 0.8039216, 1,
1.1152, -0.01585848, 1.293694, 1, 0, 0.7960784, 1,
1.115586, -3.192897, 2.597827, 1, 0, 0.7921569, 1,
1.117217, 0.1955687, 1.93448, 1, 0, 0.7843137, 1,
1.120844, 1.481704, -0.3035559, 1, 0, 0.7803922, 1,
1.121457, -1.583862, 1.862986, 1, 0, 0.772549, 1,
1.12445, 1.623753, 0.0499474, 1, 0, 0.7686275, 1,
1.124703, -0.9417324, 3.302324, 1, 0, 0.7607843, 1,
1.126634, 0.01616899, 2.826131, 1, 0, 0.7568628, 1,
1.128441, 0.1912148, 1.960252, 1, 0, 0.7490196, 1,
1.13636, 0.18375, 1.5161, 1, 0, 0.7450981, 1,
1.138092, -0.7275069, 2.150202, 1, 0, 0.7372549, 1,
1.140152, 0.1116546, 1.530768, 1, 0, 0.7333333, 1,
1.146976, -0.4039919, 0.6540651, 1, 0, 0.7254902, 1,
1.148943, 1.114442, 0.447083, 1, 0, 0.7215686, 1,
1.160277, 0.2484348, 1.50539, 1, 0, 0.7137255, 1,
1.163767, -0.1958154, 2.719167, 1, 0, 0.7098039, 1,
1.164172, 0.3995515, 0.2652558, 1, 0, 0.7019608, 1,
1.165738, 1.429051, 0.7088117, 1, 0, 0.6941177, 1,
1.16699, 0.492676, 1.827754, 1, 0, 0.6901961, 1,
1.181143, -0.6190285, 4.012456, 1, 0, 0.682353, 1,
1.182854, -0.3704286, 2.968489, 1, 0, 0.6784314, 1,
1.186028, 0.4884264, -0.3571063, 1, 0, 0.6705883, 1,
1.186264, 0.206621, 1.131906, 1, 0, 0.6666667, 1,
1.189773, 0.8553263, 1.830697, 1, 0, 0.6588235, 1,
1.191745, -1.158248, 1.504746, 1, 0, 0.654902, 1,
1.193073, 2.204063, 1.627896, 1, 0, 0.6470588, 1,
1.200105, -0.5183911, 1.364279, 1, 0, 0.6431373, 1,
1.207306, -0.2610542, 0.845507, 1, 0, 0.6352941, 1,
1.210839, 1.146886, 2.084847, 1, 0, 0.6313726, 1,
1.214099, 0.4926366, 0.4369648, 1, 0, 0.6235294, 1,
1.218701, 0.6054604, -1.086497, 1, 0, 0.6196079, 1,
1.21906, 1.447038, 1.182408, 1, 0, 0.6117647, 1,
1.221433, -1.177339, 2.386534, 1, 0, 0.6078432, 1,
1.226704, -0.7422433, 1.912668, 1, 0, 0.6, 1,
1.228998, 1.211619, -0.4497326, 1, 0, 0.5921569, 1,
1.229943, 1.916988, 1.16046, 1, 0, 0.5882353, 1,
1.236364, -1.693605, 1.960526, 1, 0, 0.5803922, 1,
1.256535, 0.01367047, 3.051093, 1, 0, 0.5764706, 1,
1.267334, 1.120164, 1.692135, 1, 0, 0.5686275, 1,
1.267654, -1.309324, 2.237151, 1, 0, 0.5647059, 1,
1.268603, 1.011966, 1.607999, 1, 0, 0.5568628, 1,
1.286444, -0.01902719, 1.5272, 1, 0, 0.5529412, 1,
1.28732, -2.441891, 2.469009, 1, 0, 0.5450981, 1,
1.288252, 1.313364, 0.418997, 1, 0, 0.5411765, 1,
1.299031, 0.2380162, 4.5025, 1, 0, 0.5333334, 1,
1.308804, 0.8598782, 2.915741, 1, 0, 0.5294118, 1,
1.314531, 0.7240432, 1.078043, 1, 0, 0.5215687, 1,
1.318086, -1.126679, 4.537998, 1, 0, 0.5176471, 1,
1.319942, -0.6718273, 2.252289, 1, 0, 0.509804, 1,
1.320538, 2.925112, -0.2831184, 1, 0, 0.5058824, 1,
1.329353, -2.048556, 2.260575, 1, 0, 0.4980392, 1,
1.329996, 0.7197096, 1.711627, 1, 0, 0.4901961, 1,
1.330673, 1.591177, -0.7577499, 1, 0, 0.4862745, 1,
1.334137, 0.5466796, 2.112644, 1, 0, 0.4784314, 1,
1.335318, 1.225124, 0.558512, 1, 0, 0.4745098, 1,
1.358677, -0.07614001, 1.92222, 1, 0, 0.4666667, 1,
1.364929, 0.9607755, 2.278918, 1, 0, 0.4627451, 1,
1.388349, 0.3425581, 2.482933, 1, 0, 0.454902, 1,
1.407096, -0.06270377, 1.659456, 1, 0, 0.4509804, 1,
1.407979, -1.474804, 3.143315, 1, 0, 0.4431373, 1,
1.422585, 0.2848216, 0.2032529, 1, 0, 0.4392157, 1,
1.432555, 2.065459, -2.501548, 1, 0, 0.4313726, 1,
1.451019, 0.5916873, 2.170169, 1, 0, 0.427451, 1,
1.45145, -1.401693, 3.541449, 1, 0, 0.4196078, 1,
1.46755, -1.330598, 3.689939, 1, 0, 0.4156863, 1,
1.478366, -0.9422978, 1.482617, 1, 0, 0.4078431, 1,
1.504885, -0.2125394, 3.140793, 1, 0, 0.4039216, 1,
1.516541, -0.6635163, 0.2115848, 1, 0, 0.3960784, 1,
1.516695, -0.7005981, 1.357235, 1, 0, 0.3882353, 1,
1.520922, 0.6329612, 0.4639608, 1, 0, 0.3843137, 1,
1.522276, -0.3262493, 2.312608, 1, 0, 0.3764706, 1,
1.522584, -0.2434907, 1.620422, 1, 0, 0.372549, 1,
1.527797, -1.062205, 2.866596, 1, 0, 0.3647059, 1,
1.541442, 0.6162499, -0.7864901, 1, 0, 0.3607843, 1,
1.565155, -0.1499444, 1.939043, 1, 0, 0.3529412, 1,
1.580196, 1.189226, 0.419562, 1, 0, 0.3490196, 1,
1.586219, -0.4565308, 3.316684, 1, 0, 0.3411765, 1,
1.589216, -0.8159348, 1.347868, 1, 0, 0.3372549, 1,
1.600827, -0.1800634, 1.771312, 1, 0, 0.3294118, 1,
1.627384, -1.498384, 2.24259, 1, 0, 0.3254902, 1,
1.635413, -0.3785737, 2.312813, 1, 0, 0.3176471, 1,
1.63847, -0.9418641, 0.5572745, 1, 0, 0.3137255, 1,
1.638859, 0.7382202, 2.087023, 1, 0, 0.3058824, 1,
1.640054, -0.6430475, 2.680571, 1, 0, 0.2980392, 1,
1.65371, 0.145353, 0.8438126, 1, 0, 0.2941177, 1,
1.666464, -1.069697, 2.037848, 1, 0, 0.2862745, 1,
1.66836, -0.6163222, 1.803221, 1, 0, 0.282353, 1,
1.679017, 1.012802, 1.163648, 1, 0, 0.2745098, 1,
1.700521, -0.2822022, 2.290864, 1, 0, 0.2705882, 1,
1.73053, -1.188524, 2.891554, 1, 0, 0.2627451, 1,
1.737028, 0.6222647, 1.044107, 1, 0, 0.2588235, 1,
1.740116, -0.5545381, 0.5855195, 1, 0, 0.2509804, 1,
1.756653, -0.2572219, 0.691926, 1, 0, 0.2470588, 1,
1.764477, 1.122537, 1.40567, 1, 0, 0.2392157, 1,
1.794461, -0.6850014, 0.3766958, 1, 0, 0.2352941, 1,
1.816927, 0.9695587, 2.374448, 1, 0, 0.227451, 1,
1.820786, 0.5820154, 1.624964, 1, 0, 0.2235294, 1,
1.821658, -1.221797, 2.032859, 1, 0, 0.2156863, 1,
1.831546, -0.7947414, 3.86598, 1, 0, 0.2117647, 1,
1.837666, -1.250241, 3.348269, 1, 0, 0.2039216, 1,
1.874187, -0.2164287, 1.486491, 1, 0, 0.1960784, 1,
1.884892, 1.462693, 0.4235791, 1, 0, 0.1921569, 1,
1.895617, 0.1934722, 1.743243, 1, 0, 0.1843137, 1,
1.924871, 0.4995293, 1.429087, 1, 0, 0.1803922, 1,
1.961277, 0.7990076, 0.7276182, 1, 0, 0.172549, 1,
2.011487, -2.402781, 2.262965, 1, 0, 0.1686275, 1,
2.021183, 0.4952835, 1.929422, 1, 0, 0.1607843, 1,
2.023134, 1.92399, 1.310248, 1, 0, 0.1568628, 1,
2.045636, 0.2994224, 0.5237364, 1, 0, 0.1490196, 1,
2.10401, 0.6756988, 3.197544, 1, 0, 0.145098, 1,
2.11306, 1.094641, 0.8809909, 1, 0, 0.1372549, 1,
2.142087, 0.04847278, 2.483555, 1, 0, 0.1333333, 1,
2.172103, -1.828245, 2.511372, 1, 0, 0.1254902, 1,
2.182075, -0.6296557, 2.054436, 1, 0, 0.1215686, 1,
2.184033, 1.299739, 0.9216591, 1, 0, 0.1137255, 1,
2.186619, 1.87375, 0.9107371, 1, 0, 0.1098039, 1,
2.1877, 1.093467, 1.271622, 1, 0, 0.1019608, 1,
2.189141, 1.303157, 3.2231, 1, 0, 0.09411765, 1,
2.216154, 0.5049705, 1.450636, 1, 0, 0.09019608, 1,
2.22463, 1.064051, 1.267636, 1, 0, 0.08235294, 1,
2.287616, -1.485519, 2.128219, 1, 0, 0.07843138, 1,
2.298461, -1.363683, 2.030524, 1, 0, 0.07058824, 1,
2.309685, 0.9984508, -0.3460803, 1, 0, 0.06666667, 1,
2.311893, -0.1408646, 2.172177, 1, 0, 0.05882353, 1,
2.340749, -0.5361147, 2.218579, 1, 0, 0.05490196, 1,
2.350904, 0.1181537, 0.6373472, 1, 0, 0.04705882, 1,
2.384121, 0.4632585, 0.4644635, 1, 0, 0.04313726, 1,
2.427119, 0.3540086, 0.2850944, 1, 0, 0.03529412, 1,
2.44729, -0.5088289, 2.080393, 1, 0, 0.03137255, 1,
2.547362, 1.585769, 1.299743, 1, 0, 0.02352941, 1,
2.61528, 0.6310835, 0.7414152, 1, 0, 0.01960784, 1,
2.666426, 0.8966955, 0.6652548, 1, 0, 0.01176471, 1,
2.712268, -0.8059272, 1.354802, 1, 0, 0.007843138, 1
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
-0.2879115, -4.347816, -7.011154, 0, -0.5, 0.5, 0.5,
-0.2879115, -4.347816, -7.011154, 1, -0.5, 0.5, 0.5,
-0.2879115, -4.347816, -7.011154, 1, 1.5, 0.5, 0.5,
-0.2879115, -4.347816, -7.011154, 0, 1.5, 0.5, 0.5
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
-4.305152, 0.2139438, -7.011154, 0, -0.5, 0.5, 0.5,
-4.305152, 0.2139438, -7.011154, 1, -0.5, 0.5, 0.5,
-4.305152, 0.2139438, -7.011154, 1, 1.5, 0.5, 0.5,
-4.305152, 0.2139438, -7.011154, 0, 1.5, 0.5, 0.5
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
-4.305152, -4.347816, 0.08175826, 0, -0.5, 0.5, 0.5,
-4.305152, -4.347816, 0.08175826, 1, -0.5, 0.5, 0.5,
-4.305152, -4.347816, 0.08175826, 1, 1.5, 0.5, 0.5,
-4.305152, -4.347816, 0.08175826, 0, 1.5, 0.5, 0.5
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
-3, -3.295102, -5.374328,
2, -3.295102, -5.374328,
-3, -3.295102, -5.374328,
-3, -3.470555, -5.647132,
-2, -3.295102, -5.374328,
-2, -3.470555, -5.647132,
-1, -3.295102, -5.374328,
-1, -3.470555, -5.647132,
0, -3.295102, -5.374328,
0, -3.470555, -5.647132,
1, -3.295102, -5.374328,
1, -3.470555, -5.647132,
2, -3.295102, -5.374328,
2, -3.470555, -5.647132
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
-3, -3.821459, -6.19274, 0, -0.5, 0.5, 0.5,
-3, -3.821459, -6.19274, 1, -0.5, 0.5, 0.5,
-3, -3.821459, -6.19274, 1, 1.5, 0.5, 0.5,
-3, -3.821459, -6.19274, 0, 1.5, 0.5, 0.5,
-2, -3.821459, -6.19274, 0, -0.5, 0.5, 0.5,
-2, -3.821459, -6.19274, 1, -0.5, 0.5, 0.5,
-2, -3.821459, -6.19274, 1, 1.5, 0.5, 0.5,
-2, -3.821459, -6.19274, 0, 1.5, 0.5, 0.5,
-1, -3.821459, -6.19274, 0, -0.5, 0.5, 0.5,
-1, -3.821459, -6.19274, 1, -0.5, 0.5, 0.5,
-1, -3.821459, -6.19274, 1, 1.5, 0.5, 0.5,
-1, -3.821459, -6.19274, 0, 1.5, 0.5, 0.5,
0, -3.821459, -6.19274, 0, -0.5, 0.5, 0.5,
0, -3.821459, -6.19274, 1, -0.5, 0.5, 0.5,
0, -3.821459, -6.19274, 1, 1.5, 0.5, 0.5,
0, -3.821459, -6.19274, 0, 1.5, 0.5, 0.5,
1, -3.821459, -6.19274, 0, -0.5, 0.5, 0.5,
1, -3.821459, -6.19274, 1, -0.5, 0.5, 0.5,
1, -3.821459, -6.19274, 1, 1.5, 0.5, 0.5,
1, -3.821459, -6.19274, 0, 1.5, 0.5, 0.5,
2, -3.821459, -6.19274, 0, -0.5, 0.5, 0.5,
2, -3.821459, -6.19274, 1, -0.5, 0.5, 0.5,
2, -3.821459, -6.19274, 1, 1.5, 0.5, 0.5,
2, -3.821459, -6.19274, 0, 1.5, 0.5, 0.5
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
-3.378097, -3, -5.374328,
-3.378097, 3, -5.374328,
-3.378097, -3, -5.374328,
-3.532606, -3, -5.647132,
-3.378097, -2, -5.374328,
-3.532606, -2, -5.647132,
-3.378097, -1, -5.374328,
-3.532606, -1, -5.647132,
-3.378097, 0, -5.374328,
-3.532606, 0, -5.647132,
-3.378097, 1, -5.374328,
-3.532606, 1, -5.647132,
-3.378097, 2, -5.374328,
-3.532606, 2, -5.647132,
-3.378097, 3, -5.374328,
-3.532606, 3, -5.647132
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
-3.841624, -3, -6.19274, 0, -0.5, 0.5, 0.5,
-3.841624, -3, -6.19274, 1, -0.5, 0.5, 0.5,
-3.841624, -3, -6.19274, 1, 1.5, 0.5, 0.5,
-3.841624, -3, -6.19274, 0, 1.5, 0.5, 0.5,
-3.841624, -2, -6.19274, 0, -0.5, 0.5, 0.5,
-3.841624, -2, -6.19274, 1, -0.5, 0.5, 0.5,
-3.841624, -2, -6.19274, 1, 1.5, 0.5, 0.5,
-3.841624, -2, -6.19274, 0, 1.5, 0.5, 0.5,
-3.841624, -1, -6.19274, 0, -0.5, 0.5, 0.5,
-3.841624, -1, -6.19274, 1, -0.5, 0.5, 0.5,
-3.841624, -1, -6.19274, 1, 1.5, 0.5, 0.5,
-3.841624, -1, -6.19274, 0, 1.5, 0.5, 0.5,
-3.841624, 0, -6.19274, 0, -0.5, 0.5, 0.5,
-3.841624, 0, -6.19274, 1, -0.5, 0.5, 0.5,
-3.841624, 0, -6.19274, 1, 1.5, 0.5, 0.5,
-3.841624, 0, -6.19274, 0, 1.5, 0.5, 0.5,
-3.841624, 1, -6.19274, 0, -0.5, 0.5, 0.5,
-3.841624, 1, -6.19274, 1, -0.5, 0.5, 0.5,
-3.841624, 1, -6.19274, 1, 1.5, 0.5, 0.5,
-3.841624, 1, -6.19274, 0, 1.5, 0.5, 0.5,
-3.841624, 2, -6.19274, 0, -0.5, 0.5, 0.5,
-3.841624, 2, -6.19274, 1, -0.5, 0.5, 0.5,
-3.841624, 2, -6.19274, 1, 1.5, 0.5, 0.5,
-3.841624, 2, -6.19274, 0, 1.5, 0.5, 0.5,
-3.841624, 3, -6.19274, 0, -0.5, 0.5, 0.5,
-3.841624, 3, -6.19274, 1, -0.5, 0.5, 0.5,
-3.841624, 3, -6.19274, 1, 1.5, 0.5, 0.5,
-3.841624, 3, -6.19274, 0, 1.5, 0.5, 0.5
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
-3.378097, -3.295102, -4,
-3.378097, -3.295102, 4,
-3.378097, -3.295102, -4,
-3.532606, -3.470555, -4,
-3.378097, -3.295102, -2,
-3.532606, -3.470555, -2,
-3.378097, -3.295102, 0,
-3.532606, -3.470555, 0,
-3.378097, -3.295102, 2,
-3.532606, -3.470555, 2,
-3.378097, -3.295102, 4,
-3.532606, -3.470555, 4
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
-3.841624, -3.821459, -4, 0, -0.5, 0.5, 0.5,
-3.841624, -3.821459, -4, 1, -0.5, 0.5, 0.5,
-3.841624, -3.821459, -4, 1, 1.5, 0.5, 0.5,
-3.841624, -3.821459, -4, 0, 1.5, 0.5, 0.5,
-3.841624, -3.821459, -2, 0, -0.5, 0.5, 0.5,
-3.841624, -3.821459, -2, 1, -0.5, 0.5, 0.5,
-3.841624, -3.821459, -2, 1, 1.5, 0.5, 0.5,
-3.841624, -3.821459, -2, 0, 1.5, 0.5, 0.5,
-3.841624, -3.821459, 0, 0, -0.5, 0.5, 0.5,
-3.841624, -3.821459, 0, 1, -0.5, 0.5, 0.5,
-3.841624, -3.821459, 0, 1, 1.5, 0.5, 0.5,
-3.841624, -3.821459, 0, 0, 1.5, 0.5, 0.5,
-3.841624, -3.821459, 2, 0, -0.5, 0.5, 0.5,
-3.841624, -3.821459, 2, 1, -0.5, 0.5, 0.5,
-3.841624, -3.821459, 2, 1, 1.5, 0.5, 0.5,
-3.841624, -3.821459, 2, 0, 1.5, 0.5, 0.5,
-3.841624, -3.821459, 4, 0, -0.5, 0.5, 0.5,
-3.841624, -3.821459, 4, 1, -0.5, 0.5, 0.5,
-3.841624, -3.821459, 4, 1, 1.5, 0.5, 0.5,
-3.841624, -3.821459, 4, 0, 1.5, 0.5, 0.5
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
-3.378097, -3.295102, -5.374328,
-3.378097, 3.72299, -5.374328,
-3.378097, -3.295102, 5.537844,
-3.378097, 3.72299, 5.537844,
-3.378097, -3.295102, -5.374328,
-3.378097, -3.295102, 5.537844,
-3.378097, 3.72299, -5.374328,
-3.378097, 3.72299, 5.537844,
-3.378097, -3.295102, -5.374328,
2.802274, -3.295102, -5.374328,
-3.378097, -3.295102, 5.537844,
2.802274, -3.295102, 5.537844,
-3.378097, 3.72299, -5.374328,
2.802274, 3.72299, -5.374328,
-3.378097, 3.72299, 5.537844,
2.802274, 3.72299, 5.537844,
2.802274, -3.295102, -5.374328,
2.802274, 3.72299, -5.374328,
2.802274, -3.295102, 5.537844,
2.802274, 3.72299, 5.537844,
2.802274, -3.295102, -5.374328,
2.802274, -3.295102, 5.537844,
2.802274, 3.72299, -5.374328,
2.802274, 3.72299, 5.537844
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
var radius = 7.673843;
var distance = 34.1418;
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
mvMatrix.translate( 0.2879115, -0.2139438, -0.08175826 );
mvMatrix.scale( 1.342494, 1.182246, 0.7603537 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.1418);
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
tetraethyl_thiodipho<-read.table("tetraethyl_thiodipho.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetraethyl_thiodipho$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_thiodipho' not found
```

```r
y<-tetraethyl_thiodipho$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_thiodipho' not found
```

```r
z<-tetraethyl_thiodipho$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_thiodipho' not found
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
-3.288091, -1.284397, -1.383263, 0, 0, 1, 1, 1,
-3.279691, -0.3200635, -0.9114363, 1, 0, 0, 1, 1,
-2.906949, -0.5750362, -1.814625, 1, 0, 0, 1, 1,
-2.77551, 0.07969577, -2.130372, 1, 0, 0, 1, 1,
-2.709198, -0.9719918, -1.67245, 1, 0, 0, 1, 1,
-2.695029, -1.574245, -0.8568718, 1, 0, 0, 1, 1,
-2.693853, -1.318196, -1.791873, 0, 0, 0, 1, 1,
-2.661371, -0.5562068, -1.849265, 0, 0, 0, 1, 1,
-2.551799, -0.06262161, -1.894069, 0, 0, 0, 1, 1,
-2.534554, 1.799786, -0.6247676, 0, 0, 0, 1, 1,
-2.531274, -0.6863303, -2.718541, 0, 0, 0, 1, 1,
-2.499742, 0.04180706, -2.473759, 0, 0, 0, 1, 1,
-2.477623, -1.93897, -2.259682, 0, 0, 0, 1, 1,
-2.443832, -1.403859, -1.002501, 1, 1, 1, 1, 1,
-2.438092, 0.1718622, -0.6328431, 1, 1, 1, 1, 1,
-2.38419, -0.1805754, -2.363759, 1, 1, 1, 1, 1,
-2.342738, 0.1420647, -1.464216, 1, 1, 1, 1, 1,
-2.262652, -1.418674, -1.636172, 1, 1, 1, 1, 1,
-2.218654, -0.92235, -1.924172, 1, 1, 1, 1, 1,
-2.215195, 0.09924927, -0.7960358, 1, 1, 1, 1, 1,
-2.210393, -1.03096, -1.25847, 1, 1, 1, 1, 1,
-2.20292, 0.5067321, -2.365009, 1, 1, 1, 1, 1,
-2.201544, -0.2175948, -1.515602, 1, 1, 1, 1, 1,
-2.185644, -0.8999903, -1.062111, 1, 1, 1, 1, 1,
-2.166979, 1.451719, -0.6790167, 1, 1, 1, 1, 1,
-2.144012, 0.3277081, -1.561871, 1, 1, 1, 1, 1,
-2.103245, -1.341802, -1.728344, 1, 1, 1, 1, 1,
-2.044519, -1.025744, -1.696234, 1, 1, 1, 1, 1,
-2.01182, 1.33079, -0.9722888, 0, 0, 1, 1, 1,
-1.98498, 0.3372618, -1.167754, 1, 0, 0, 1, 1,
-1.935137, 0.6960686, -1.433523, 1, 0, 0, 1, 1,
-1.918708, 1.23998, 0.6570885, 1, 0, 0, 1, 1,
-1.903736, -1.475482, -1.351336, 1, 0, 0, 1, 1,
-1.891277, -1.228967, -1.454963, 1, 0, 0, 1, 1,
-1.870349, 0.3475132, -1.165611, 0, 0, 0, 1, 1,
-1.867482, -1.166216, -3.220572, 0, 0, 0, 1, 1,
-1.865331, -0.4827345, -0.4557274, 0, 0, 0, 1, 1,
-1.852436, 0.2234595, -0.4918045, 0, 0, 0, 1, 1,
-1.850249, 0.1292631, -1.468598, 0, 0, 0, 1, 1,
-1.819575, 0.3764485, -0.7136781, 0, 0, 0, 1, 1,
-1.803844, 0.2473121, 0.8277133, 0, 0, 0, 1, 1,
-1.78938, -0.1218877, -2.745565, 1, 1, 1, 1, 1,
-1.787929, -1.015825, -2.851567, 1, 1, 1, 1, 1,
-1.776571, 1.88041, 0.0293879, 1, 1, 1, 1, 1,
-1.761891, -0.08693223, -3.351718, 1, 1, 1, 1, 1,
-1.754613, 0.3195114, -2.039206, 1, 1, 1, 1, 1,
-1.752236, -0.3323518, -1.457401, 1, 1, 1, 1, 1,
-1.730546, 2.088522, 1.020244, 1, 1, 1, 1, 1,
-1.699517, 0.6870088, -0.4711215, 1, 1, 1, 1, 1,
-1.697827, -1.005026, -0.1856898, 1, 1, 1, 1, 1,
-1.671841, 0.4839274, -2.327083, 1, 1, 1, 1, 1,
-1.663904, -1.282403, -2.703664, 1, 1, 1, 1, 1,
-1.655273, 0.4088047, -0.009366944, 1, 1, 1, 1, 1,
-1.630746, -0.5628572, -1.656176, 1, 1, 1, 1, 1,
-1.621281, -0.8812522, -1.288873, 1, 1, 1, 1, 1,
-1.615732, -0.9829255, -2.197268, 1, 1, 1, 1, 1,
-1.615296, -0.2018903, -3.217539, 0, 0, 1, 1, 1,
-1.611422, 0.2905001, -0.7881243, 1, 0, 0, 1, 1,
-1.604042, -0.08250394, -1.358671, 1, 0, 0, 1, 1,
-1.599912, 0.5057381, -1.294926, 1, 0, 0, 1, 1,
-1.591073, -0.4618781, -2.447644, 1, 0, 0, 1, 1,
-1.589167, 0.09324306, -0.9261946, 1, 0, 0, 1, 1,
-1.586069, 0.3235849, -2.056921, 0, 0, 0, 1, 1,
-1.579183, 2.606904, -1.831189, 0, 0, 0, 1, 1,
-1.569397, -0.7402387, -2.396776, 0, 0, 0, 1, 1,
-1.556606, 1.648663, 0.5373712, 0, 0, 0, 1, 1,
-1.53338, 1.026755, -3.43017, 0, 0, 0, 1, 1,
-1.525759, -1.602776, -2.357198, 0, 0, 0, 1, 1,
-1.519045, -0.07683536, -2.459727, 0, 0, 0, 1, 1,
-1.515044, -0.7264999, -1.072829, 1, 1, 1, 1, 1,
-1.494706, -1.940539, -1.384609, 1, 1, 1, 1, 1,
-1.461712, 0.7267017, -1.435735, 1, 1, 1, 1, 1,
-1.44324, 1.382755, 0.2249854, 1, 1, 1, 1, 1,
-1.44219, -1.368386, -1.58426, 1, 1, 1, 1, 1,
-1.438663, 0.4794403, -1.019573, 1, 1, 1, 1, 1,
-1.438042, -0.9614299, -0.8390356, 1, 1, 1, 1, 1,
-1.436211, 0.5174238, -1.443529, 1, 1, 1, 1, 1,
-1.429601, 0.3905018, -1.543363, 1, 1, 1, 1, 1,
-1.412168, 0.04980931, -0.1486108, 1, 1, 1, 1, 1,
-1.410606, -0.09540655, -3.067364, 1, 1, 1, 1, 1,
-1.398244, 0.3837342, 0.6609685, 1, 1, 1, 1, 1,
-1.38662, -1.443111, -2.798072, 1, 1, 1, 1, 1,
-1.379848, 0.9092999, -0.9828044, 1, 1, 1, 1, 1,
-1.373774, 1.178393, -0.7900608, 1, 1, 1, 1, 1,
-1.352942, 0.8235031, -2.306968, 0, 0, 1, 1, 1,
-1.340583, -0.4643156, -1.793251, 1, 0, 0, 1, 1,
-1.333248, -1.139022, -3.435095, 1, 0, 0, 1, 1,
-1.332193, -1.810919, -3.233592, 1, 0, 0, 1, 1,
-1.329739, 0.8086303, -1.277874, 1, 0, 0, 1, 1,
-1.329598, 0.583345, -0.7839386, 1, 0, 0, 1, 1,
-1.307089, 0.8095734, -1.483915, 0, 0, 0, 1, 1,
-1.28977, -0.05379599, -1.067534, 0, 0, 0, 1, 1,
-1.276227, -0.646643, -0.9497267, 0, 0, 0, 1, 1,
-1.267305, 0.05913046, -1.349853, 0, 0, 0, 1, 1,
-1.262244, 0.5704018, -1.133882, 0, 0, 0, 1, 1,
-1.261501, 0.1851736, -1.442081, 0, 0, 0, 1, 1,
-1.258554, -0.9383857, -0.8056699, 0, 0, 0, 1, 1,
-1.252291, 1.8526, -1.855228, 1, 1, 1, 1, 1,
-1.248678, -1.24012, -2.69996, 1, 1, 1, 1, 1,
-1.245791, -1.17234, -1.534251, 1, 1, 1, 1, 1,
-1.243159, 0.4371687, -2.108207, 1, 1, 1, 1, 1,
-1.241846, 1.010486, 0.4714936, 1, 1, 1, 1, 1,
-1.236612, -0.1925287, -2.377147, 1, 1, 1, 1, 1,
-1.232598, -0.3183667, -2.469975, 1, 1, 1, 1, 1,
-1.228575, -0.6249813, -0.9026006, 1, 1, 1, 1, 1,
-1.227512, -1.253539, -1.009069, 1, 1, 1, 1, 1,
-1.212369, -0.9002923, -1.397912, 1, 1, 1, 1, 1,
-1.208583, -0.3446012, -2.60282, 1, 1, 1, 1, 1,
-1.192055, -0.1046074, -0.9144145, 1, 1, 1, 1, 1,
-1.186704, 0.3223452, -2.750761, 1, 1, 1, 1, 1,
-1.184315, -0.4217933, -1.694505, 1, 1, 1, 1, 1,
-1.172902, 1.280432, -0.3759007, 1, 1, 1, 1, 1,
-1.171419, 0.3856953, -0.0649888, 0, 0, 1, 1, 1,
-1.170668, -0.3291455, -1.288367, 1, 0, 0, 1, 1,
-1.16764, 1.048582, -0.1443828, 1, 0, 0, 1, 1,
-1.163311, 0.2540209, -2.282757, 1, 0, 0, 1, 1,
-1.16047, -0.2896963, -1.042605, 1, 0, 0, 1, 1,
-1.160233, -0.5741099, -0.06829172, 1, 0, 0, 1, 1,
-1.157762, 0.8369818, -1.295611, 0, 0, 0, 1, 1,
-1.156533, -2.233752, -1.289844, 0, 0, 0, 1, 1,
-1.156273, 1.899442, -0.5452467, 0, 0, 0, 1, 1,
-1.152765, -0.5956782, -0.8436165, 0, 0, 0, 1, 1,
-1.149855, -0.3651363, -1.871994, 0, 0, 0, 1, 1,
-1.141849, -0.9676244, -2.566681, 0, 0, 0, 1, 1,
-1.125719, 1.541606, 0.0270117, 0, 0, 0, 1, 1,
-1.118868, -0.05859735, -2.471726, 1, 1, 1, 1, 1,
-1.118064, -2.055684, -1.5547, 1, 1, 1, 1, 1,
-1.116167, -0.2701502, -0.7388681, 1, 1, 1, 1, 1,
-1.114361, -1.46127, -2.505226, 1, 1, 1, 1, 1,
-1.110634, -1.936481, -4.167079, 1, 1, 1, 1, 1,
-1.106965, -0.5957243, -2.568512, 1, 1, 1, 1, 1,
-1.097924, -0.4114597, -4.482336, 1, 1, 1, 1, 1,
-1.094646, 0.5596554, -1.086031, 1, 1, 1, 1, 1,
-1.087765, 0.7803393, -0.891779, 1, 1, 1, 1, 1,
-1.084119, 0.03813261, -0.9781471, 1, 1, 1, 1, 1,
-1.078995, -2.009683, -1.451381, 1, 1, 1, 1, 1,
-1.076398, 0.4897378, -0.3726784, 1, 1, 1, 1, 1,
-1.074996, 1.727097, -1.073705, 1, 1, 1, 1, 1,
-1.061831, 0.7154524, -2.248819, 1, 1, 1, 1, 1,
-1.058202, -1.476099, -2.233039, 1, 1, 1, 1, 1,
-1.055142, -0.9514742, -2.353687, 0, 0, 1, 1, 1,
-1.053825, -0.240518, -2.826276, 1, 0, 0, 1, 1,
-1.053242, -1.014514, -3.543451, 1, 0, 0, 1, 1,
-1.043626, -0.3016469, -2.806561, 1, 0, 0, 1, 1,
-1.038855, -0.02328727, -1.37809, 1, 0, 0, 1, 1,
-1.038681, -1.978944, -1.235543, 1, 0, 0, 1, 1,
-1.036898, 0.3321077, -1.469977, 0, 0, 0, 1, 1,
-1.034767, 1.78338, -0.5693861, 0, 0, 0, 1, 1,
-1.033718, -0.5426432, -1.099983, 0, 0, 0, 1, 1,
-1.026412, -2.328829, -3.430463, 0, 0, 0, 1, 1,
-1.025917, 0.009012741, -1.168542, 0, 0, 0, 1, 1,
-1.024277, -0.2983359, -3.731579, 0, 0, 0, 1, 1,
-1.022327, -0.5977134, -2.512787, 0, 0, 0, 1, 1,
-1.010602, 0.4450237, 1.035659, 1, 1, 1, 1, 1,
-1.002687, -0.504158, -1.200389, 1, 1, 1, 1, 1,
-1.002457, -0.0484235, 0.4196069, 1, 1, 1, 1, 1,
-1.002116, -0.727682, -2.37366, 1, 1, 1, 1, 1,
-1.000108, 1.687443, -1.213068, 1, 1, 1, 1, 1,
-0.9960551, 0.7135092, 0.1321179, 1, 1, 1, 1, 1,
-0.9920876, -0.348968, -3.320212, 1, 1, 1, 1, 1,
-0.9846916, -0.6920437, -2.161535, 1, 1, 1, 1, 1,
-0.9827007, 0.5490233, 0.1741912, 1, 1, 1, 1, 1,
-0.9822894, 2.412625, 0.1732551, 1, 1, 1, 1, 1,
-0.9782978, 0.4203285, -0.4702486, 1, 1, 1, 1, 1,
-0.9706005, 0.08491398, -0.2102475, 1, 1, 1, 1, 1,
-0.9688972, 0.5023066, -0.2748635, 1, 1, 1, 1, 1,
-0.9682301, -1.688217, -3.490792, 1, 1, 1, 1, 1,
-0.9643753, 0.6583873, -2.773464, 1, 1, 1, 1, 1,
-0.9542378, -0.03822017, -1.019445, 0, 0, 1, 1, 1,
-0.9526516, 0.2685494, -0.3901637, 1, 0, 0, 1, 1,
-0.9518549, 0.5440007, -0.6829091, 1, 0, 0, 1, 1,
-0.9482529, 1.121607, -0.2117238, 1, 0, 0, 1, 1,
-0.9406565, -0.211464, -2.280881, 1, 0, 0, 1, 1,
-0.9401658, -0.1921236, -2.002174, 1, 0, 0, 1, 1,
-0.9354232, 0.1390238, -2.476138, 0, 0, 0, 1, 1,
-0.9307845, -0.5628441, -3.452153, 0, 0, 0, 1, 1,
-0.9268165, 1.867922, -1.762872, 0, 0, 0, 1, 1,
-0.9252092, -0.4711062, -0.526519, 0, 0, 0, 1, 1,
-0.9243202, -0.2259576, -0.597599, 0, 0, 0, 1, 1,
-0.9228097, 0.8143879, -1.792549, 0, 0, 0, 1, 1,
-0.9222083, -0.4232072, -3.592011, 0, 0, 0, 1, 1,
-0.9166185, 0.5938616, -1.584958, 1, 1, 1, 1, 1,
-0.9103363, -0.8086305, -1.870681, 1, 1, 1, 1, 1,
-0.9087754, -1.123809, -1.985896, 1, 1, 1, 1, 1,
-0.8857676, 0.273666, -1.409021, 1, 1, 1, 1, 1,
-0.8830062, 0.1326756, -0.8412522, 1, 1, 1, 1, 1,
-0.8816546, -2.123503, -2.264545, 1, 1, 1, 1, 1,
-0.8782198, 0.2938312, -2.157245, 1, 1, 1, 1, 1,
-0.8775898, -0.2578782, -2.705268, 1, 1, 1, 1, 1,
-0.8730725, 0.8125286, 0.3856387, 1, 1, 1, 1, 1,
-0.8723844, -0.7618681, -3.820619, 1, 1, 1, 1, 1,
-0.8701687, -1.324835, -2.976969, 1, 1, 1, 1, 1,
-0.8698977, 0.1957421, -2.32984, 1, 1, 1, 1, 1,
-0.8659824, -0.09993092, -1.555624, 1, 1, 1, 1, 1,
-0.8607495, -1.234238, -2.1403, 1, 1, 1, 1, 1,
-0.8607332, -0.2752872, -2.298826, 1, 1, 1, 1, 1,
-0.8593925, -1.514933, -1.959246, 0, 0, 1, 1, 1,
-0.8538256, 1.480812, -0.9716114, 1, 0, 0, 1, 1,
-0.8521442, -1.607086, -4.975446, 1, 0, 0, 1, 1,
-0.8358355, 0.1739106, -1.759867, 1, 0, 0, 1, 1,
-0.8356478, 0.05947644, -1.349382, 1, 0, 0, 1, 1,
-0.8346573, -0.363732, -1.883522, 1, 0, 0, 1, 1,
-0.8325301, -0.1636852, -3.317046, 0, 0, 0, 1, 1,
-0.830297, -0.6998383, -3.069642, 0, 0, 0, 1, 1,
-0.8240264, 0.02884531, -2.656226, 0, 0, 0, 1, 1,
-0.8235369, -1.229442, -1.43931, 0, 0, 0, 1, 1,
-0.8174241, 0.4180555, -0.2610627, 0, 0, 0, 1, 1,
-0.8136178, -1.138568, -1.163714, 0, 0, 0, 1, 1,
-0.8100177, 0.5376864, -1.417732, 0, 0, 0, 1, 1,
-0.8065547, -0.06190689, -1.21711, 1, 1, 1, 1, 1,
-0.8047836, 0.3834916, -1.83652, 1, 1, 1, 1, 1,
-0.8037955, -0.07748862, -2.286273, 1, 1, 1, 1, 1,
-0.8013699, -0.8770398, -4.012792, 1, 1, 1, 1, 1,
-0.7974633, -1.302662, -1.850086, 1, 1, 1, 1, 1,
-0.7970936, 0.8098705, 0.2483204, 1, 1, 1, 1, 1,
-0.7948747, 0.2905951, 1.906597, 1, 1, 1, 1, 1,
-0.794728, 0.3947909, -1.485584, 1, 1, 1, 1, 1,
-0.793472, 0.6279681, -1.398721, 1, 1, 1, 1, 1,
-0.7877011, -0.3227589, -3.90015, 1, 1, 1, 1, 1,
-0.7869213, 0.3390955, -2.139324, 1, 1, 1, 1, 1,
-0.781193, -0.742196, -2.368149, 1, 1, 1, 1, 1,
-0.7784235, -0.09194814, -1.385607, 1, 1, 1, 1, 1,
-0.7777128, 1.275548, -1.649613, 1, 1, 1, 1, 1,
-0.7769414, -0.4366084, -2.086087, 1, 1, 1, 1, 1,
-0.7732289, 1.40807, 0.6709595, 0, 0, 1, 1, 1,
-0.7708535, 0.5254474, 0.3154264, 1, 0, 0, 1, 1,
-0.7705902, 0.04646436, -1.944455, 1, 0, 0, 1, 1,
-0.7675197, 0.2845188, -1.645999, 1, 0, 0, 1, 1,
-0.7624811, -0.6670341, -1.708076, 1, 0, 0, 1, 1,
-0.7607364, 0.09582897, -0.7596325, 1, 0, 0, 1, 1,
-0.7562252, 0.4987153, -3.341525, 0, 0, 0, 1, 1,
-0.754593, -2.062078, -2.375613, 0, 0, 0, 1, 1,
-0.752358, 1.189279, -1.907419, 0, 0, 0, 1, 1,
-0.7521404, -0.4634847, -2.778058, 0, 0, 0, 1, 1,
-0.7483749, -0.5327259, -3.999613, 0, 0, 0, 1, 1,
-0.7408071, 0.05816143, -0.3676471, 0, 0, 0, 1, 1,
-0.7389237, -2.253496, -3.527921, 0, 0, 0, 1, 1,
-0.7379036, 0.246228, -0.6149177, 1, 1, 1, 1, 1,
-0.7369711, -0.643569, -4.27202, 1, 1, 1, 1, 1,
-0.7362994, -1.744951, -2.755323, 1, 1, 1, 1, 1,
-0.7341033, 0.3846527, -0.616824, 1, 1, 1, 1, 1,
-0.7324505, -0.9246999, -3.675344, 1, 1, 1, 1, 1,
-0.7315164, 1.922098, -0.6108636, 1, 1, 1, 1, 1,
-0.7297425, 0.9148289, 0.6314374, 1, 1, 1, 1, 1,
-0.7283554, 0.006232149, -2.909499, 1, 1, 1, 1, 1,
-0.7271101, 0.3963535, 0.1447887, 1, 1, 1, 1, 1,
-0.726606, -0.2055751, -1.929629, 1, 1, 1, 1, 1,
-0.7242436, -0.04182353, -1.121618, 1, 1, 1, 1, 1,
-0.7207626, 1.496001, -0.5279515, 1, 1, 1, 1, 1,
-0.7168337, -0.1808483, -2.401877, 1, 1, 1, 1, 1,
-0.7166244, 0.1536569, 0.2548737, 1, 1, 1, 1, 1,
-0.7078475, -0.7683196, -3.365101, 1, 1, 1, 1, 1,
-0.7066687, 1.118105, 0.07899655, 0, 0, 1, 1, 1,
-0.7003497, 1.243467, -1.050063, 1, 0, 0, 1, 1,
-0.6995152, -0.6869016, -4.563546, 1, 0, 0, 1, 1,
-0.6979739, 0.04592961, -0.4344541, 1, 0, 0, 1, 1,
-0.6943721, 0.0323363, -1.526764, 1, 0, 0, 1, 1,
-0.6858281, -1.308985, -1.723459, 1, 0, 0, 1, 1,
-0.6838565, 0.50951, 0.08769386, 0, 0, 0, 1, 1,
-0.6756389, -1.903839, -2.048272, 0, 0, 0, 1, 1,
-0.6736841, -0.7960995, -3.693158, 0, 0, 0, 1, 1,
-0.6712704, -0.05725885, -1.550565, 0, 0, 0, 1, 1,
-0.6702519, 1.409603, -0.1038983, 0, 0, 0, 1, 1,
-0.6685169, -0.7829562, -2.702224, 0, 0, 0, 1, 1,
-0.665715, -1.137938, -2.304427, 0, 0, 0, 1, 1,
-0.6648605, -1.04719, -3.405185, 1, 1, 1, 1, 1,
-0.6646729, 0.750764, -0.2703543, 1, 1, 1, 1, 1,
-0.6613349, -0.9779264, -5.159953, 1, 1, 1, 1, 1,
-0.6612074, -0.7807272, -2.340305, 1, 1, 1, 1, 1,
-0.6601102, 0.56892, -1.031457, 1, 1, 1, 1, 1,
-0.65842, -1.614969, -2.994855, 1, 1, 1, 1, 1,
-0.6555563, -0.4341858, -2.388208, 1, 1, 1, 1, 1,
-0.6481639, 0.6719382, -1.036552, 1, 1, 1, 1, 1,
-0.6420445, -1.69944, -2.300084, 1, 1, 1, 1, 1,
-0.6366106, -0.6206791, -1.464341, 1, 1, 1, 1, 1,
-0.635786, -1.717832, -2.079544, 1, 1, 1, 1, 1,
-0.6345349, 0.05878967, 0.2923147, 1, 1, 1, 1, 1,
-0.6298529, 1.724424, -1.76229, 1, 1, 1, 1, 1,
-0.6280015, -1.478531, -2.069976, 1, 1, 1, 1, 1,
-0.623809, 0.01417713, -1.999901, 1, 1, 1, 1, 1,
-0.622348, 0.9276103, 0.6491768, 0, 0, 1, 1, 1,
-0.6208226, 1.202673, 1.871248, 1, 0, 0, 1, 1,
-0.6181002, -1.484431, -3.296021, 1, 0, 0, 1, 1,
-0.6179368, 0.09583821, -1.389383, 1, 0, 0, 1, 1,
-0.6129647, -0.9987491, -2.342603, 1, 0, 0, 1, 1,
-0.6101842, 1.349893, -1.722989, 1, 0, 0, 1, 1,
-0.6081023, 0.6882438, 0.7658255, 0, 0, 0, 1, 1,
-0.6038644, 0.6265072, -0.8345664, 0, 0, 0, 1, 1,
-0.6008308, -0.1223858, -1.794601, 0, 0, 0, 1, 1,
-0.5982295, -1.906837, -4.444115, 0, 0, 0, 1, 1,
-0.5964374, 0.8322508, 1.147691, 0, 0, 0, 1, 1,
-0.591728, 0.8047094, -0.5438744, 0, 0, 0, 1, 1,
-0.5913648, -0.3745852, -1.662405, 0, 0, 0, 1, 1,
-0.5908188, -0.9997003, -2.842094, 1, 1, 1, 1, 1,
-0.5889769, -0.8863918, -3.501678, 1, 1, 1, 1, 1,
-0.5884415, -1.386698, -3.791147, 1, 1, 1, 1, 1,
-0.5840279, 0.1478681, -0.2730515, 1, 1, 1, 1, 1,
-0.5803252, -0.242532, -2.09951, 1, 1, 1, 1, 1,
-0.57948, 2.629426, -0.8895484, 1, 1, 1, 1, 1,
-0.5768244, -1.315972, -5.000696, 1, 1, 1, 1, 1,
-0.5763605, 1.655233, 0.3549509, 1, 1, 1, 1, 1,
-0.5717348, -0.8970607, -1.499424, 1, 1, 1, 1, 1,
-0.5694847, 1.797518, -0.6700752, 1, 1, 1, 1, 1,
-0.5693761, 1.439659, -0.2486828, 1, 1, 1, 1, 1,
-0.564929, -0.8847193, -2.768779, 1, 1, 1, 1, 1,
-0.5628852, 0.2492404, -1.476103, 1, 1, 1, 1, 1,
-0.559493, 1.025653, -1.119625, 1, 1, 1, 1, 1,
-0.5539714, 0.2415132, -1.699656, 1, 1, 1, 1, 1,
-0.5530175, -0.6648866, -2.159214, 0, 0, 1, 1, 1,
-0.5523432, 0.6451432, 0.1322107, 1, 0, 0, 1, 1,
-0.548277, 0.2492763, 0.4560898, 1, 0, 0, 1, 1,
-0.5452924, 0.2185543, -1.811233, 1, 0, 0, 1, 1,
-0.5439939, -0.8012799, -2.767624, 1, 0, 0, 1, 1,
-0.5405418, -0.7590242, -4.564744, 1, 0, 0, 1, 1,
-0.5386335, 0.2260525, -1.289407, 0, 0, 0, 1, 1,
-0.5364475, -0.7993502, -1.983344, 0, 0, 0, 1, 1,
-0.5364412, -0.6867763, -2.917501, 0, 0, 0, 1, 1,
-0.5321868, 0.1786212, -1.765097, 0, 0, 0, 1, 1,
-0.5280719, -0.8552728, -1.873835, 0, 0, 0, 1, 1,
-0.5193747, -0.5444023, -2.237701, 0, 0, 0, 1, 1,
-0.5130227, -0.6616663, -4.351591, 0, 0, 0, 1, 1,
-0.5128872, 0.1151324, -0.3683495, 1, 1, 1, 1, 1,
-0.5103461, 0.3418903, -1.301676, 1, 1, 1, 1, 1,
-0.5097732, -0.6538256, -4.627871, 1, 1, 1, 1, 1,
-0.5017921, 0.01507297, -1.335739, 1, 1, 1, 1, 1,
-0.498995, -0.1077541, -2.378166, 1, 1, 1, 1, 1,
-0.4975648, -0.4720712, -2.871443, 1, 1, 1, 1, 1,
-0.497026, -0.1001763, -2.72929, 1, 1, 1, 1, 1,
-0.4926794, 1.378264, 0.2641619, 1, 1, 1, 1, 1,
-0.4879979, -2.001836, -3.598405, 1, 1, 1, 1, 1,
-0.4846514, 0.2317777, 0.6369317, 1, 1, 1, 1, 1,
-0.4846154, 0.09241801, -0.5985488, 1, 1, 1, 1, 1,
-0.4828819, -0.9235313, -5.215413, 1, 1, 1, 1, 1,
-0.4718881, -0.01833633, -2.990329, 1, 1, 1, 1, 1,
-0.470069, 0.4423545, -2.307353, 1, 1, 1, 1, 1,
-0.4668125, 0.5218994, -1.913698, 1, 1, 1, 1, 1,
-0.4652022, -0.5987179, -2.301116, 0, 0, 1, 1, 1,
-0.4647534, 0.3967956, -0.3540204, 1, 0, 0, 1, 1,
-0.460427, 0.62776, 0.5930463, 1, 0, 0, 1, 1,
-0.4601619, 1.03622, 0.1641279, 1, 0, 0, 1, 1,
-0.4542825, -1.882062, -3.104217, 1, 0, 0, 1, 1,
-0.4524012, -1.257025, -2.44727, 1, 0, 0, 1, 1,
-0.4495093, -0.1991174, -2.255708, 0, 0, 0, 1, 1,
-0.4467044, 1.138171, -0.1047614, 0, 0, 0, 1, 1,
-0.4454497, -1.898951, -1.281247, 0, 0, 0, 1, 1,
-0.4434618, -1.459602, -4.244047, 0, 0, 0, 1, 1,
-0.4431245, 0.9316392, -1.695567, 0, 0, 0, 1, 1,
-0.4381415, -1.392034, -0.2662027, 0, 0, 0, 1, 1,
-0.437733, 0.7983659, -0.003837205, 0, 0, 0, 1, 1,
-0.4250997, -0.5489478, -2.752239, 1, 1, 1, 1, 1,
-0.4241395, 0.4418251, -2.869882, 1, 1, 1, 1, 1,
-0.4204115, -0.7520037, -4.967283, 1, 1, 1, 1, 1,
-0.4171907, -1.258936, -3.418288, 1, 1, 1, 1, 1,
-0.4164947, 0.1280527, -2.241585, 1, 1, 1, 1, 1,
-0.416278, -0.7341732, -0.8749123, 1, 1, 1, 1, 1,
-0.4082902, -0.6275283, -1.131676, 1, 1, 1, 1, 1,
-0.406703, 0.6446329, -0.06101996, 1, 1, 1, 1, 1,
-0.4064024, 0.2208604, -0.5557628, 1, 1, 1, 1, 1,
-0.3937028, 0.3146164, -1.268527, 1, 1, 1, 1, 1,
-0.3933932, -0.3240751, -2.291572, 1, 1, 1, 1, 1,
-0.391983, -1.404623, -2.229798, 1, 1, 1, 1, 1,
-0.386676, 0.9017417, -0.9847336, 1, 1, 1, 1, 1,
-0.3813008, 1.734619, 1.925783, 1, 1, 1, 1, 1,
-0.3805249, 0.1060514, -1.191423, 1, 1, 1, 1, 1,
-0.377443, 0.8157856, -0.8209888, 0, 0, 1, 1, 1,
-0.3757854, 0.1271976, -0.4660772, 1, 0, 0, 1, 1,
-0.3727283, 0.1255746, -0.2185734, 1, 0, 0, 1, 1,
-0.3714144, -1.384865, -3.008945, 1, 0, 0, 1, 1,
-0.3685365, -1.238687, -3.30865, 1, 0, 0, 1, 1,
-0.363123, 0.61035, -1.783523, 1, 0, 0, 1, 1,
-0.3629505, 0.7655122, -0.6822236, 0, 0, 0, 1, 1,
-0.3587102, -0.5000371, -2.271448, 0, 0, 0, 1, 1,
-0.3582137, -0.3867288, -2.369217, 0, 0, 0, 1, 1,
-0.3536817, -0.5538174, -2.969101, 0, 0, 0, 1, 1,
-0.3510951, -1.651967, -2.637125, 0, 0, 0, 1, 1,
-0.3492146, 0.5411061, -0.9552754, 0, 0, 0, 1, 1,
-0.3455909, 1.324645, -2.593843, 0, 0, 0, 1, 1,
-0.34345, -1.190993, -4.281317, 1, 1, 1, 1, 1,
-0.3418859, -1.268292, -2.111273, 1, 1, 1, 1, 1,
-0.3410032, 1.760852, -0.150006, 1, 1, 1, 1, 1,
-0.33687, -0.5799152, -0.8811328, 1, 1, 1, 1, 1,
-0.3339936, 0.3223957, -2.706834, 1, 1, 1, 1, 1,
-0.3315794, -0.8181264, -2.089537, 1, 1, 1, 1, 1,
-0.3288242, 1.632757, -2.084841, 1, 1, 1, 1, 1,
-0.326739, 2.860169, -0.03302925, 1, 1, 1, 1, 1,
-0.3211768, -0.7448524, -3.095484, 1, 1, 1, 1, 1,
-0.3074967, 1.504194, -1.307063, 1, 1, 1, 1, 1,
-0.3023647, 0.9101695, -1.066343, 1, 1, 1, 1, 1,
-0.295504, 1.451682, -0.3160728, 1, 1, 1, 1, 1,
-0.2954418, 0.8894384, 1.256512, 1, 1, 1, 1, 1,
-0.2931667, 0.3559755, -0.06417271, 1, 1, 1, 1, 1,
-0.2844552, 0.1112925, -0.9758264, 1, 1, 1, 1, 1,
-0.2814606, -1.479252, -1.956281, 0, 0, 1, 1, 1,
-0.2784151, -1.268687, -1.720535, 1, 0, 0, 1, 1,
-0.2767232, -0.5257329, -2.033589, 1, 0, 0, 1, 1,
-0.2765952, 0.3806041, -1.290825, 1, 0, 0, 1, 1,
-0.2742827, 0.09807625, -1.350123, 1, 0, 0, 1, 1,
-0.2717373, 0.9899536, -1.496851, 1, 0, 0, 1, 1,
-0.2695119, -1.301713, -2.67448, 0, 0, 0, 1, 1,
-0.2666306, -0.8984748, -1.495777, 0, 0, 0, 1, 1,
-0.2651185, 0.7235793, -1.221573, 0, 0, 0, 1, 1,
-0.2641871, -0.9420133, -2.891035, 0, 0, 0, 1, 1,
-0.2605411, -0.8546205, -3.458283, 0, 0, 0, 1, 1,
-0.2578547, 1.614078, -1.164321, 0, 0, 0, 1, 1,
-0.2559997, 0.1908879, -1.383687, 0, 0, 0, 1, 1,
-0.2527334, -1.401222, -3.381235, 1, 1, 1, 1, 1,
-0.2520734, 1.01913, 1.245906, 1, 1, 1, 1, 1,
-0.2506645, -0.1288676, -0.0257096, 1, 1, 1, 1, 1,
-0.2501638, 0.8235815, -0.2622121, 1, 1, 1, 1, 1,
-0.2500213, 0.03901135, 0.2132296, 1, 1, 1, 1, 1,
-0.2473782, -0.6045179, -4.38594, 1, 1, 1, 1, 1,
-0.2461487, -1.681915, -3.175654, 1, 1, 1, 1, 1,
-0.2456316, 0.4995608, -1.021508, 1, 1, 1, 1, 1,
-0.2439567, -0.5188863, -2.150463, 1, 1, 1, 1, 1,
-0.2432005, 0.6648823, -0.6564866, 1, 1, 1, 1, 1,
-0.2386976, -0.2937579, -1.702001, 1, 1, 1, 1, 1,
-0.2383792, -0.3296325, -2.986869, 1, 1, 1, 1, 1,
-0.2317039, -1.004327, -1.814951, 1, 1, 1, 1, 1,
-0.2313624, -1.004666, -0.6133505, 1, 1, 1, 1, 1,
-0.2271443, -1.305374, -1.86652, 1, 1, 1, 1, 1,
-0.2184537, 0.1101804, -1.152985, 0, 0, 1, 1, 1,
-0.2107726, -0.4008481, -2.389469, 1, 0, 0, 1, 1,
-0.203026, -1.930387, -2.982627, 1, 0, 0, 1, 1,
-0.1983282, -0.03254837, -1.630892, 1, 0, 0, 1, 1,
-0.1974993, 0.2661534, -0.7705743, 1, 0, 0, 1, 1,
-0.1974195, -0.9038779, -3.301575, 1, 0, 0, 1, 1,
-0.1958295, -0.1001054, -1.063177, 0, 0, 0, 1, 1,
-0.1926771, -0.9964859, -2.646692, 0, 0, 0, 1, 1,
-0.1895825, -1.319215, -2.525104, 0, 0, 0, 1, 1,
-0.1876974, -0.4217992, -3.375386, 0, 0, 0, 1, 1,
-0.182435, 0.3635392, -0.09160443, 0, 0, 0, 1, 1,
-0.1781219, -1.135891, -4.625909, 0, 0, 0, 1, 1,
-0.1751456, -1.096385, -3.881614, 0, 0, 0, 1, 1,
-0.1741781, -0.8195199, -3.960005, 1, 1, 1, 1, 1,
-0.1736001, 1.645528, -0.6939519, 1, 1, 1, 1, 1,
-0.1715363, 0.02135359, -1.111749, 1, 1, 1, 1, 1,
-0.1709614, -0.6122057, -3.305277, 1, 1, 1, 1, 1,
-0.1686782, -0.1922514, -1.293938, 1, 1, 1, 1, 1,
-0.1620402, -0.8873137, -3.37809, 1, 1, 1, 1, 1,
-0.1584878, -0.07900313, -0.7352602, 1, 1, 1, 1, 1,
-0.1560195, 1.470186, -1.290324, 1, 1, 1, 1, 1,
-0.1516374, -0.2407335, -1.610733, 1, 1, 1, 1, 1,
-0.149848, -1.590875, -2.663785, 1, 1, 1, 1, 1,
-0.1473786, -0.1947515, -4.165925, 1, 1, 1, 1, 1,
-0.1410422, -0.3549398, -2.213515, 1, 1, 1, 1, 1,
-0.1408622, -0.4322619, -2.792485, 1, 1, 1, 1, 1,
-0.1404388, 0.2707346, -2.022951, 1, 1, 1, 1, 1,
-0.139036, -0.7372538, -2.799705, 1, 1, 1, 1, 1,
-0.1363713, -0.9759501, -2.660323, 0, 0, 1, 1, 1,
-0.1354993, 0.9961199, 1.307334, 1, 0, 0, 1, 1,
-0.1345683, -0.6139202, -1.734374, 1, 0, 0, 1, 1,
-0.1331759, -0.1387389, -1.635904, 1, 0, 0, 1, 1,
-0.1315806, -0.8380815, -4.102151, 1, 0, 0, 1, 1,
-0.127683, 0.987326, 0.106736, 1, 0, 0, 1, 1,
-0.124442, -0.732417, -1.87294, 0, 0, 0, 1, 1,
-0.1176307, -1.29871, -2.560764, 0, 0, 0, 1, 1,
-0.1175246, -0.02308257, -2.384902, 0, 0, 0, 1, 1,
-0.1174778, -0.6218423, -2.76941, 0, 0, 0, 1, 1,
-0.1145188, 1.324235, 0.03804103, 0, 0, 0, 1, 1,
-0.1079222, 0.1571623, -1.084462, 0, 0, 0, 1, 1,
-0.1077832, 1.932094, 0.2432565, 0, 0, 0, 1, 1,
-0.1067608, 1.0238, -0.9264037, 1, 1, 1, 1, 1,
-0.09889564, -0.635904, -4.250699, 1, 1, 1, 1, 1,
-0.09070256, -2.184383, -3.797605, 1, 1, 1, 1, 1,
-0.08716077, 0.8725654, -1.566687, 1, 1, 1, 1, 1,
-0.07654565, -1.458981, -3.921385, 1, 1, 1, 1, 1,
-0.07349429, -0.6220652, -2.728622, 1, 1, 1, 1, 1,
-0.07154321, -0.4197167, -2.815033, 1, 1, 1, 1, 1,
-0.07038493, 1.075999, 1.554713, 1, 1, 1, 1, 1,
-0.06769007, -1.174393, -2.984207, 1, 1, 1, 1, 1,
-0.0562345, -1.291521, -3.704, 1, 1, 1, 1, 1,
-0.05172426, 1.347082, 0.4678069, 1, 1, 1, 1, 1,
-0.04997493, 1.159518, 0.767176, 1, 1, 1, 1, 1,
-0.04893688, 0.260796, -1.075134, 1, 1, 1, 1, 1,
-0.04350594, 0.8977783, -1.172171, 1, 1, 1, 1, 1,
-0.04299272, 1.144253, 0.1213245, 1, 1, 1, 1, 1,
-0.03977496, 0.5253523, -0.425947, 0, 0, 1, 1, 1,
-0.03931863, 0.8102432, -0.1886102, 1, 0, 0, 1, 1,
-0.03365126, -2.537084, -3.568702, 1, 0, 0, 1, 1,
-0.03304033, 1.203052, -1.14769, 1, 0, 0, 1, 1,
-0.03068102, -1.19429, -5.0316, 1, 0, 0, 1, 1,
-0.02986028, -0.600715, -4.294779, 1, 0, 0, 1, 1,
-0.02845731, -1.648188, -4.496102, 0, 0, 0, 1, 1,
-0.0282221, 1.186496, -1.049624, 0, 0, 0, 1, 1,
-0.02743171, 0.3084821, 1.051215, 0, 0, 0, 1, 1,
-0.02696984, -0.6493669, -3.140646, 0, 0, 0, 1, 1,
-0.02622383, -1.23931, -3.009299, 0, 0, 0, 1, 1,
-0.02245033, -0.1406014, -2.400155, 0, 0, 0, 1, 1,
-0.02082206, -0.7957543, -3.830528, 0, 0, 0, 1, 1,
-0.01297096, 0.4106354, 0.7843493, 1, 1, 1, 1, 1,
-0.01103678, 1.855251, -1.135494, 1, 1, 1, 1, 1,
-0.01080452, -0.8137071, -3.714544, 1, 1, 1, 1, 1,
-0.01039565, -1.01667, -3.647276, 1, 1, 1, 1, 1,
-0.01031755, -1.220829, -2.050439, 1, 1, 1, 1, 1,
-0.008460212, -0.635588, -3.975743, 1, 1, 1, 1, 1,
-0.002700545, -0.02266354, -3.10601, 1, 1, 1, 1, 1,
0.00237228, 0.4655545, 0.4662315, 1, 1, 1, 1, 1,
0.002730975, 1.117657, 0.5051693, 1, 1, 1, 1, 1,
0.007736197, -0.24335, 2.506626, 1, 1, 1, 1, 1,
0.009569188, 0.08547756, -1.450183, 1, 1, 1, 1, 1,
0.01016284, -0.8329695, 4.011211, 1, 1, 1, 1, 1,
0.01023127, -1.195796, 2.988403, 1, 1, 1, 1, 1,
0.01238974, -0.1474762, 4.237376, 1, 1, 1, 1, 1,
0.01248912, -0.3144898, 2.513494, 1, 1, 1, 1, 1,
0.01385914, 1.178387, -0.7267462, 0, 0, 1, 1, 1,
0.01639412, 0.385991, -0.5463749, 1, 0, 0, 1, 1,
0.01842492, -1.085299, 1.310875, 1, 0, 0, 1, 1,
0.0199457, 0.004817255, 0.66926, 1, 0, 0, 1, 1,
0.02103304, 1.295887, -0.2658251, 1, 0, 0, 1, 1,
0.02261475, -0.4664908, 2.664083, 1, 0, 0, 1, 1,
0.02663394, 0.7814609, 0.7113599, 0, 0, 0, 1, 1,
0.02672324, 1.376972, 0.4311213, 0, 0, 0, 1, 1,
0.02869067, 1.667644, 0.04825946, 0, 0, 0, 1, 1,
0.03010015, 0.7379637, 0.5836262, 0, 0, 0, 1, 1,
0.03197818, 1.045274, 0.9661168, 0, 0, 0, 1, 1,
0.03215811, 0.8930907, -1.069736, 0, 0, 0, 1, 1,
0.03395277, -2.13997, 3.281623, 0, 0, 0, 1, 1,
0.03819541, 0.3407184, 0.5704101, 1, 1, 1, 1, 1,
0.03949271, -0.8021758, 3.527637, 1, 1, 1, 1, 1,
0.04283733, -1.245424, 3.543496, 1, 1, 1, 1, 1,
0.0490867, -0.5131254, 2.311902, 1, 1, 1, 1, 1,
0.05064776, -0.499006, 2.125164, 1, 1, 1, 1, 1,
0.05418504, 0.7726473, 1.235674, 1, 1, 1, 1, 1,
0.05967881, 1.09248, -0.1238734, 1, 1, 1, 1, 1,
0.06318971, -0.2473733, 3.425066, 1, 1, 1, 1, 1,
0.06364329, -0.7094694, 1.735507, 1, 1, 1, 1, 1,
0.0639473, -1.27193, 2.008724, 1, 1, 1, 1, 1,
0.06560659, 1.113984, -0.8962064, 1, 1, 1, 1, 1,
0.06946302, 0.7818204, 0.1220107, 1, 1, 1, 1, 1,
0.07047708, -0.1108884, 2.780427, 1, 1, 1, 1, 1,
0.07149895, 0.6207884, 0.9441413, 1, 1, 1, 1, 1,
0.07179494, 0.6285671, 0.7709301, 1, 1, 1, 1, 1,
0.07259271, 0.6658303, 0.9796054, 0, 0, 1, 1, 1,
0.07490292, -1.437038, 4.359941, 1, 0, 0, 1, 1,
0.07834336, -0.2753618, 3.373966, 1, 0, 0, 1, 1,
0.07930817, 0.5434937, 2.660388, 1, 0, 0, 1, 1,
0.09195501, -1.48085, 0.7701039, 1, 0, 0, 1, 1,
0.09405265, -0.06760385, 2.51792, 1, 0, 0, 1, 1,
0.09435733, 0.02395725, -0.4117242, 0, 0, 0, 1, 1,
0.0973781, -1.522231, 4.643138, 0, 0, 0, 1, 1,
0.09841004, -0.3968862, 4.671904, 0, 0, 0, 1, 1,
0.1046024, 2.646746, -0.5419934, 0, 0, 0, 1, 1,
0.1061412, 1.013363, 0.3807636, 0, 0, 0, 1, 1,
0.1068869, 0.6136205, 0.08821455, 0, 0, 0, 1, 1,
0.1091776, 0.6752915, -0.2958415, 0, 0, 0, 1, 1,
0.1100313, 0.6851943, 0.2083078, 1, 1, 1, 1, 1,
0.1117439, -1.297073, 3.058374, 1, 1, 1, 1, 1,
0.1153619, -0.673946, 2.569328, 1, 1, 1, 1, 1,
0.1165037, -0.9247455, 2.838703, 1, 1, 1, 1, 1,
0.1165304, -1.728298, 3.808029, 1, 1, 1, 1, 1,
0.1174545, 0.06274338, -0.3495957, 1, 1, 1, 1, 1,
0.1200491, 0.8924698, 1.389449, 1, 1, 1, 1, 1,
0.1216816, 0.7857785, -0.4447077, 1, 1, 1, 1, 1,
0.1265959, 0.1973338, 0.3076652, 1, 1, 1, 1, 1,
0.1277706, 0.2887968, -0.6445837, 1, 1, 1, 1, 1,
0.1312217, 0.4488378, 0.4918217, 1, 1, 1, 1, 1,
0.1315375, 0.9294477, 0.3495398, 1, 1, 1, 1, 1,
0.1319332, 0.1541144, 2.348393, 1, 1, 1, 1, 1,
0.1356913, -0.9710487, 3.936782, 1, 1, 1, 1, 1,
0.1375161, -0.9490183, 3.749802, 1, 1, 1, 1, 1,
0.1449717, -1.891437, 2.954013, 0, 0, 1, 1, 1,
0.1471608, 0.7969338, 1.197507, 1, 0, 0, 1, 1,
0.14824, -0.2579369, 2.926815, 1, 0, 0, 1, 1,
0.1488463, -0.2165595, 4.323123, 1, 0, 0, 1, 1,
0.1499007, 0.4381752, 0.1956059, 1, 0, 0, 1, 1,
0.1509832, 0.05068071, 0.6501097, 1, 0, 0, 1, 1,
0.1515526, 1.755899, 0.002402018, 0, 0, 0, 1, 1,
0.1527421, -0.1424935, 2.987842, 0, 0, 0, 1, 1,
0.1546704, 2.055012, -1.726629, 0, 0, 0, 1, 1,
0.1589451, 0.8543604, 1.612653, 0, 0, 0, 1, 1,
0.1610034, 0.3482907, 0.8664308, 0, 0, 0, 1, 1,
0.1641401, -0.9023522, 2.568874, 0, 0, 0, 1, 1,
0.1657567, 0.02754614, 0.3382822, 0, 0, 0, 1, 1,
0.1669523, -1.37764, 3.042253, 1, 1, 1, 1, 1,
0.1684126, 1.486731, 0.1757302, 1, 1, 1, 1, 1,
0.1770523, 1.341532, 1.071369, 1, 1, 1, 1, 1,
0.1824809, 0.2446087, 1.068093, 1, 1, 1, 1, 1,
0.1829793, 0.07649641, 0.5697982, 1, 1, 1, 1, 1,
0.1832032, -2.509321, 3.519003, 1, 1, 1, 1, 1,
0.1859347, 0.6251384, -0.4786024, 1, 1, 1, 1, 1,
0.1860115, 0.2939782, 1.12937, 1, 1, 1, 1, 1,
0.1901359, -0.7393096, 1.561035, 1, 1, 1, 1, 1,
0.1931208, 1.576201, -0.117995, 1, 1, 1, 1, 1,
0.1969715, -1.125082, 5.265718, 1, 1, 1, 1, 1,
0.199609, 0.297288, 0.9214719, 1, 1, 1, 1, 1,
0.2011047, -0.06297543, 1.528452, 1, 1, 1, 1, 1,
0.203368, -0.02214069, 0.8884224, 1, 1, 1, 1, 1,
0.2052216, -0.02346484, 1.718558, 1, 1, 1, 1, 1,
0.2116135, -1.860849, 1.913467, 0, 0, 1, 1, 1,
0.2124882, -0.06289802, 3.15005, 1, 0, 0, 1, 1,
0.2191923, 0.9736943, 3.061078, 1, 0, 0, 1, 1,
0.2212186, -1.109435, 3.806645, 1, 0, 0, 1, 1,
0.2226052, 0.1589765, 0.3888583, 1, 0, 0, 1, 1,
0.2316879, -0.7334674, 3.101424, 1, 0, 0, 1, 1,
0.2321694, -1.84778, 3.444801, 0, 0, 0, 1, 1,
0.2412209, 0.7902724, -0.05032703, 0, 0, 0, 1, 1,
0.2422701, 0.1630616, 1.07062, 0, 0, 0, 1, 1,
0.2484298, -1.633702, 1.258064, 0, 0, 0, 1, 1,
0.249422, 0.9184909, -0.9081585, 0, 0, 0, 1, 1,
0.2529446, -0.9690448, 3.198696, 0, 0, 0, 1, 1,
0.2544149, -0.5624484, 1.55128, 0, 0, 0, 1, 1,
0.2548635, 0.6573108, 0.3007544, 1, 1, 1, 1, 1,
0.2551645, 1.074037, 0.05610169, 1, 1, 1, 1, 1,
0.2558735, -0.4036993, 3.910576, 1, 1, 1, 1, 1,
0.2597678, -0.1415137, 1.193087, 1, 1, 1, 1, 1,
0.2610957, -0.2720703, 4.339565, 1, 1, 1, 1, 1,
0.2619387, -1.120076, 2.651848, 1, 1, 1, 1, 1,
0.2620325, -0.2457349, 1.186969, 1, 1, 1, 1, 1,
0.2657852, -0.1874072, 2.427258, 1, 1, 1, 1, 1,
0.2694415, -0.1225149, 1.934289, 1, 1, 1, 1, 1,
0.2724009, 1.278062, -1.532825, 1, 1, 1, 1, 1,
0.276493, 0.2662833, 3.859154, 1, 1, 1, 1, 1,
0.2788969, -0.3625875, 3.453979, 1, 1, 1, 1, 1,
0.2806583, 1.319008, -1.160975, 1, 1, 1, 1, 1,
0.2816752, -0.3105781, 2.752516, 1, 1, 1, 1, 1,
0.2846507, -0.1525653, 3.989845, 1, 1, 1, 1, 1,
0.2898856, -0.6891781, 3.202718, 0, 0, 1, 1, 1,
0.2907381, -0.282066, 2.048235, 1, 0, 0, 1, 1,
0.2947675, 0.09214992, -0.0512301, 1, 0, 0, 1, 1,
0.2982316, 0.87059, -1.135582, 1, 0, 0, 1, 1,
0.3003921, -1.003461, 2.704416, 1, 0, 0, 1, 1,
0.3050613, 0.1169737, 0.6895762, 1, 0, 0, 1, 1,
0.3188953, -1.0085, 2.078293, 0, 0, 0, 1, 1,
0.3214524, -1.44943, 2.959042, 0, 0, 0, 1, 1,
0.3220862, 0.8262604, 1.304815, 0, 0, 0, 1, 1,
0.3224716, -1.762572, 3.427324, 0, 0, 0, 1, 1,
0.3241344, -1.243716, 3.738862, 0, 0, 0, 1, 1,
0.3264117, 0.3940865, -1.020779, 0, 0, 0, 1, 1,
0.3270609, -0.7872055, 3.72266, 0, 0, 0, 1, 1,
0.3279773, 0.8915496, 1.228547, 1, 1, 1, 1, 1,
0.3298188, -0.4159433, 2.423312, 1, 1, 1, 1, 1,
0.3359218, 1.026631, -0.08514425, 1, 1, 1, 1, 1,
0.3396917, -0.8905306, 3.746717, 1, 1, 1, 1, 1,
0.3407259, -1.393917, 2.211542, 1, 1, 1, 1, 1,
0.344041, 1.41343, -0.6344837, 1, 1, 1, 1, 1,
0.3443128, -0.2814108, 1.898441, 1, 1, 1, 1, 1,
0.3484837, 0.3819729, -1.012429, 1, 1, 1, 1, 1,
0.349189, 0.247849, 1.785333, 1, 1, 1, 1, 1,
0.3496027, -1.834103, 3.97074, 1, 1, 1, 1, 1,
0.3524153, -1.001155, 3.301275, 1, 1, 1, 1, 1,
0.3548982, -0.3755651, 1.573178, 1, 1, 1, 1, 1,
0.3564413, -0.5120184, 4.202945, 1, 1, 1, 1, 1,
0.3606805, -0.3216454, 1.283767, 1, 1, 1, 1, 1,
0.3613575, 0.7996868, -1.575229, 1, 1, 1, 1, 1,
0.3645391, 0.2375149, -1.413268, 0, 0, 1, 1, 1,
0.3703863, -0.4457353, 1.026624, 1, 0, 0, 1, 1,
0.3713003, 1.135564, 0.2772227, 1, 0, 0, 1, 1,
0.3742428, 0.5559573, 0.1924953, 1, 0, 0, 1, 1,
0.3747293, 1.593128, -0.3167046, 1, 0, 0, 1, 1,
0.3848779, 1.239962, 0.5229064, 1, 0, 0, 1, 1,
0.3875928, 0.5111614, 0.7879837, 0, 0, 0, 1, 1,
0.3886573, 0.2893427, -0.825234, 0, 0, 0, 1, 1,
0.3895321, -0.4894756, 2.933223, 0, 0, 0, 1, 1,
0.3908148, -0.1672493, 2.159583, 0, 0, 0, 1, 1,
0.3937179, 1.963244, 0.2813316, 0, 0, 0, 1, 1,
0.3939838, 1.239504, 1.27955, 0, 0, 0, 1, 1,
0.3989376, -0.1984504, 2.706841, 0, 0, 0, 1, 1,
0.4003637, 1.34155, 0.8888643, 1, 1, 1, 1, 1,
0.4004487, 0.6482928, 1.834501, 1, 1, 1, 1, 1,
0.4030448, 0.1350368, 0.8260561, 1, 1, 1, 1, 1,
0.4063502, -1.774687, 3.402175, 1, 1, 1, 1, 1,
0.4067236, 1.767443, -2.239079, 1, 1, 1, 1, 1,
0.4116478, 0.04623095, 0.8318903, 1, 1, 1, 1, 1,
0.4129969, 0.1325012, -0.5092203, 1, 1, 1, 1, 1,
0.4214227, 0.5583681, 1.60347, 1, 1, 1, 1, 1,
0.4308599, -0.1869412, 1.468959, 1, 1, 1, 1, 1,
0.4313393, 0.04664886, 0.7078288, 1, 1, 1, 1, 1,
0.4332707, 0.5623954, 1.059471, 1, 1, 1, 1, 1,
0.4372882, -1.370327, 1.885418, 1, 1, 1, 1, 1,
0.4417192, -0.2704021, 1.789253, 1, 1, 1, 1, 1,
0.442957, 0.3073184, 3.944843, 1, 1, 1, 1, 1,
0.4439951, -0.1787255, 1.631112, 1, 1, 1, 1, 1,
0.4470842, 0.176303, 2.183225, 0, 0, 1, 1, 1,
0.4484433, -0.9889131, 2.312826, 1, 0, 0, 1, 1,
0.4488496, -0.632762, 2.010566, 1, 0, 0, 1, 1,
0.4510044, 0.3982521, 1.615539, 1, 0, 0, 1, 1,
0.4513263, 0.5466908, 1.354614, 1, 0, 0, 1, 1,
0.4518493, -1.778204, 2.972447, 1, 0, 0, 1, 1,
0.4522171, -0.1968753, 2.003356, 0, 0, 0, 1, 1,
0.4537857, 1.60596, 0.3800491, 0, 0, 0, 1, 1,
0.4567646, 1.630888, 0.5900033, 0, 0, 0, 1, 1,
0.4613532, -0.07719167, 1.640773, 0, 0, 0, 1, 1,
0.4616601, 2.108912, -0.1090062, 0, 0, 0, 1, 1,
0.463208, -0.5870043, 3.587463, 0, 0, 0, 1, 1,
0.4713461, -1.519657, 5.378929, 0, 0, 0, 1, 1,
0.4714667, 0.7606369, -0.6893721, 1, 1, 1, 1, 1,
0.4715563, -1.342448, 3.380641, 1, 1, 1, 1, 1,
0.4728331, -0.371246, 1.049576, 1, 1, 1, 1, 1,
0.4729695, -1.086702, 4.057069, 1, 1, 1, 1, 1,
0.4754224, -0.3032222, 2.950842, 1, 1, 1, 1, 1,
0.4768798, 1.549421, -0.03112497, 1, 1, 1, 1, 1,
0.4791589, -0.4629565, 2.252128, 1, 1, 1, 1, 1,
0.4796416, 0.5373782, -0.6360647, 1, 1, 1, 1, 1,
0.4829228, 1.651026, -0.2449279, 1, 1, 1, 1, 1,
0.490117, 1.069865, 1.245694, 1, 1, 1, 1, 1,
0.5137113, -0.7154216, 1.501131, 1, 1, 1, 1, 1,
0.5168404, 1.056885, -0.02191401, 1, 1, 1, 1, 1,
0.5258512, 1.150716, -1.636947, 1, 1, 1, 1, 1,
0.5314058, 2.13549, -0.5148558, 1, 1, 1, 1, 1,
0.5327656, -1.230582, 3.289248, 1, 1, 1, 1, 1,
0.5372792, 1.445727, 0.181368, 0, 0, 1, 1, 1,
0.5392644, -0.3049417, 0.8823782, 1, 0, 0, 1, 1,
0.5516456, -0.5059784, 3.478371, 1, 0, 0, 1, 1,
0.5602655, 0.9427696, 0.4210172, 1, 0, 0, 1, 1,
0.5625433, -0.1220462, 1.624932, 1, 0, 0, 1, 1,
0.5652538, -0.1358164, 1.851255, 1, 0, 0, 1, 1,
0.5671617, 0.1589004, 1.915535, 0, 0, 0, 1, 1,
0.5734966, -1.002745, 3.290625, 0, 0, 0, 1, 1,
0.5786059, 0.7118952, 0.3164743, 0, 0, 0, 1, 1,
0.5811503, -0.4657397, 1.468597, 0, 0, 0, 1, 1,
0.5830527, -0.3545716, 2.946229, 0, 0, 0, 1, 1,
0.5844924, 0.2227845, 1.969789, 0, 0, 0, 1, 1,
0.5861337, -0.1030777, 1.029958, 0, 0, 0, 1, 1,
0.5866054, 1.84776, 0.4710099, 1, 1, 1, 1, 1,
0.5875158, 0.7010504, 0.5020813, 1, 1, 1, 1, 1,
0.5890464, -1.233657, 0.9840219, 1, 1, 1, 1, 1,
0.5891587, 0.4037987, 2.120178, 1, 1, 1, 1, 1,
0.5951191, 0.3827019, 0.7885062, 1, 1, 1, 1, 1,
0.595371, -1.459524, 2.612844, 1, 1, 1, 1, 1,
0.5967997, -1.254593, 4.417111, 1, 1, 1, 1, 1,
0.6008967, -1.835857, 4.38639, 1, 1, 1, 1, 1,
0.6012997, 0.3993371, 1.21971, 1, 1, 1, 1, 1,
0.6015193, -0.9218926, 2.32543, 1, 1, 1, 1, 1,
0.6052957, -0.2098888, 3.252734, 1, 1, 1, 1, 1,
0.6063541, 0.1361746, 1.197496, 1, 1, 1, 1, 1,
0.6070176, 1.656155, -1.478772, 1, 1, 1, 1, 1,
0.6109697, 0.9289958, 0.5122993, 1, 1, 1, 1, 1,
0.6168235, -0.4094337, 2.425869, 1, 1, 1, 1, 1,
0.6198829, -0.5416113, 2.687904, 0, 0, 1, 1, 1,
0.6213408, -0.5948094, 3.944919, 1, 0, 0, 1, 1,
0.6213785, 0.1273642, 1.662321, 1, 0, 0, 1, 1,
0.631627, 1.479436, 0.3766981, 1, 0, 0, 1, 1,
0.6320272, 0.2611672, 3.658803, 1, 0, 0, 1, 1,
0.6327931, -0.5256108, 1.674468, 1, 0, 0, 1, 1,
0.6372699, -1.455338, 2.987713, 0, 0, 0, 1, 1,
0.6373344, 1.939054, -0.07689592, 0, 0, 0, 1, 1,
0.6375892, 0.7639555, 2.006038, 0, 0, 0, 1, 1,
0.6448674, -1.035371, 3.970832, 0, 0, 0, 1, 1,
0.6454506, -1.173495, 3.582068, 0, 0, 0, 1, 1,
0.6464415, 1.590349, -0.6082558, 0, 0, 0, 1, 1,
0.6479984, -1.051523, 2.880857, 0, 0, 0, 1, 1,
0.6518489, -0.1477141, 2.314865, 1, 1, 1, 1, 1,
0.6566198, 1.270135, -1.272421, 1, 1, 1, 1, 1,
0.6597973, -0.1019577, 0.444688, 1, 1, 1, 1, 1,
0.6601138, 0.5207863, 0.5215868, 1, 1, 1, 1, 1,
0.6682308, -0.3678473, 2.813663, 1, 1, 1, 1, 1,
0.6694415, 0.5565113, 1.274655, 1, 1, 1, 1, 1,
0.6696922, -0.1494626, 3.527174, 1, 1, 1, 1, 1,
0.673381, -0.182782, 2.653258, 1, 1, 1, 1, 1,
0.6743454, 0.2779711, 1.814865, 1, 1, 1, 1, 1,
0.6821254, 1.208549, 0.6388459, 1, 1, 1, 1, 1,
0.6826985, -0.05835412, 1.625934, 1, 1, 1, 1, 1,
0.6845798, -1.282017, 2.125147, 1, 1, 1, 1, 1,
0.6882605, 0.4282522, 0.1747921, 1, 1, 1, 1, 1,
0.6932452, -2.197933, 2.258139, 1, 1, 1, 1, 1,
0.7022709, 1.346516, -1.817069, 1, 1, 1, 1, 1,
0.7045396, 0.2959012, 2.015615, 0, 0, 1, 1, 1,
0.7084131, 0.1540635, 0.3484023, 1, 0, 0, 1, 1,
0.7088282, 1.722816, 0.6667479, 1, 0, 0, 1, 1,
0.7099959, 1.228059, 1.612938, 1, 0, 0, 1, 1,
0.7113578, 0.6149504, -0.2170579, 1, 0, 0, 1, 1,
0.7122038, 0.6878108, 1.131532, 1, 0, 0, 1, 1,
0.7180654, 0.6211715, 0.8789549, 0, 0, 0, 1, 1,
0.7196935, -0.9643612, 2.327129, 0, 0, 0, 1, 1,
0.7240229, -0.7101467, 1.0658, 0, 0, 0, 1, 1,
0.7242475, 0.7681892, 0.9482183, 0, 0, 0, 1, 1,
0.7249684, -0.7397177, 3.806906, 0, 0, 0, 1, 1,
0.7318525, -0.1615268, 0.8950324, 0, 0, 0, 1, 1,
0.7323154, -0.1226005, 1.237045, 0, 0, 0, 1, 1,
0.732357, -0.7747004, 2.819177, 1, 1, 1, 1, 1,
0.7348479, 0.3858597, 0.7301725, 1, 1, 1, 1, 1,
0.7348516, -0.6055469, 1.875529, 1, 1, 1, 1, 1,
0.7376101, -0.5835515, 2.249318, 1, 1, 1, 1, 1,
0.7386357, -0.03490353, 3.761975, 1, 1, 1, 1, 1,
0.741761, 0.16665, 2.093035, 1, 1, 1, 1, 1,
0.7479042, 0.1247504, 0.4373896, 1, 1, 1, 1, 1,
0.748951, 0.5178565, 0.2564284, 1, 1, 1, 1, 1,
0.7516726, 0.08319292, 0.885348, 1, 1, 1, 1, 1,
0.7537296, -0.08438494, 0.8594093, 1, 1, 1, 1, 1,
0.7542805, 0.1058789, 1.212941, 1, 1, 1, 1, 1,
0.7544367, 0.002113883, 0.9226784, 1, 1, 1, 1, 1,
0.7557065, 0.7405635, 2.006068, 1, 1, 1, 1, 1,
0.7564634, -0.6242515, 2.681148, 1, 1, 1, 1, 1,
0.7604682, -2.152614, 2.591139, 1, 1, 1, 1, 1,
0.7610859, -0.1497267, 1.884951, 0, 0, 1, 1, 1,
0.7621008, -0.7281393, 2.662246, 1, 0, 0, 1, 1,
0.7625712, -1.095636, 2.480312, 1, 0, 0, 1, 1,
0.7742184, -0.7130607, 1.825321, 1, 0, 0, 1, 1,
0.7760194, -0.3594527, 2.512397, 1, 0, 0, 1, 1,
0.7771276, 1.196054, -0.510789, 1, 0, 0, 1, 1,
0.7795532, -1.672093, 0.5339717, 0, 0, 0, 1, 1,
0.7868053, -0.031435, 3.173425, 0, 0, 0, 1, 1,
0.7874683, 0.6036887, 1.07861, 0, 0, 0, 1, 1,
0.7901614, -1.049307, 1.826282, 0, 0, 0, 1, 1,
0.792951, -3.17144, 3.275954, 0, 0, 0, 1, 1,
0.7959154, -0.2961981, 1.569904, 0, 0, 0, 1, 1,
0.8020333, -0.1414776, 2.86682, 0, 0, 0, 1, 1,
0.8054373, -0.4064645, 2.348633, 1, 1, 1, 1, 1,
0.8133246, 0.9744647, -0.4783658, 1, 1, 1, 1, 1,
0.8161306, 0.3604254, 0.8269465, 1, 1, 1, 1, 1,
0.8208509, -0.6198699, 3.052194, 1, 1, 1, 1, 1,
0.8219652, -0.6476725, 1.933423, 1, 1, 1, 1, 1,
0.8247583, -0.2776143, -0.455406, 1, 1, 1, 1, 1,
0.8338413, -0.7508357, 0.2824332, 1, 1, 1, 1, 1,
0.8371671, -0.02419707, 1.280918, 1, 1, 1, 1, 1,
0.8388484, 0.08510016, 0.8283227, 1, 1, 1, 1, 1,
0.8434307, -0.4342343, 0.7298732, 1, 1, 1, 1, 1,
0.8454, -0.1211656, 2.756679, 1, 1, 1, 1, 1,
0.8481203, 0.845634, 0.5778442, 1, 1, 1, 1, 1,
0.8527709, -1.23116, 3.145117, 1, 1, 1, 1, 1,
0.8610442, 0.8753813, 1.29027, 1, 1, 1, 1, 1,
0.8639045, 1.284636, 1.144445, 1, 1, 1, 1, 1,
0.8642143, 2.166033, 1.075467, 0, 0, 1, 1, 1,
0.880008, -0.6252736, 1.601345, 1, 0, 0, 1, 1,
0.8806399, -0.2160775, 1.084198, 1, 0, 0, 1, 1,
0.8808403, 0.8731803, -0.9830338, 1, 0, 0, 1, 1,
0.8839999, -2.108068, 3.22933, 1, 0, 0, 1, 1,
0.8911218, -0.6206495, 1.54718, 1, 0, 0, 1, 1,
0.894448, -1.793497, 1.843472, 0, 0, 0, 1, 1,
0.8958827, 1.215642, 2.386015, 0, 0, 0, 1, 1,
0.8994303, 0.600748, 1.434798, 0, 0, 0, 1, 1,
0.9003088, -0.01815996, 0.2914495, 0, 0, 0, 1, 1,
0.9055972, -1.6405, 3.811041, 0, 0, 0, 1, 1,
0.9059882, 0.09089454, 2.118286, 0, 0, 0, 1, 1,
0.9060146, -0.03096744, 0.5242435, 0, 0, 0, 1, 1,
0.9104425, 0.265354, 0.4367213, 1, 1, 1, 1, 1,
0.9136504, 0.7006302, -0.6336874, 1, 1, 1, 1, 1,
0.9182063, -0.4151578, 1.373744, 1, 1, 1, 1, 1,
0.9217296, -1.643676, 2.705784, 1, 1, 1, 1, 1,
0.9225468, 1.259164, -0.2500264, 1, 1, 1, 1, 1,
0.9229952, 3.620785, 2.423514, 1, 1, 1, 1, 1,
0.927261, -0.1029535, 0.9779288, 1, 1, 1, 1, 1,
0.9304748, 1.012373, 0.8146868, 1, 1, 1, 1, 1,
0.9317487, -0.1963435, 1.313576, 1, 1, 1, 1, 1,
0.9463298, -0.002082367, 2.593378, 1, 1, 1, 1, 1,
0.9630886, 0.4359164, 1.620846, 1, 1, 1, 1, 1,
0.9679235, 0.1635465, 0.007980675, 1, 1, 1, 1, 1,
0.9775937, -0.02777796, 2.155047, 1, 1, 1, 1, 1,
0.9806295, -0.0910736, 0.8234344, 1, 1, 1, 1, 1,
0.9834238, -1.72889, 4.634319, 1, 1, 1, 1, 1,
0.9896942, -0.02331968, 1.622348, 0, 0, 1, 1, 1,
0.9964374, 0.1714264, -0.183374, 1, 0, 0, 1, 1,
0.9981182, -0.5114031, 3.630679, 1, 0, 0, 1, 1,
0.9988358, -0.08178419, 2.322062, 1, 0, 0, 1, 1,
0.999724, 0.4855041, -1.096413, 1, 0, 0, 1, 1,
1.014763, 1.233231, -0.5714872, 1, 0, 0, 1, 1,
1.014834, -1.019736, 3.661162, 0, 0, 0, 1, 1,
1.025177, 1.905943, 1.316884, 0, 0, 0, 1, 1,
1.032326, -0.7136971, 2.161633, 0, 0, 0, 1, 1,
1.035005, 1.099549, 1.144702, 0, 0, 0, 1, 1,
1.045769, 0.09077593, 0.8922461, 0, 0, 0, 1, 1,
1.053339, 0.06661396, 1.814227, 0, 0, 0, 1, 1,
1.055816, 1.72459, 0.124926, 0, 0, 0, 1, 1,
1.056096, -1.600084, 2.404559, 1, 1, 1, 1, 1,
1.057698, -0.7501627, 1.241286, 1, 1, 1, 1, 1,
1.058185, -0.8229453, 1.453895, 1, 1, 1, 1, 1,
1.059251, 0.8230301, 1.721755, 1, 1, 1, 1, 1,
1.065822, -2.766733, 4.598318, 1, 1, 1, 1, 1,
1.066607, -1.41188, 2.424731, 1, 1, 1, 1, 1,
1.069617, 0.8801335, 0.7047319, 1, 1, 1, 1, 1,
1.070072, 0.1750626, 1.665349, 1, 1, 1, 1, 1,
1.072053, -0.588679, 2.728008, 1, 1, 1, 1, 1,
1.074621, -0.348613, 1.48213, 1, 1, 1, 1, 1,
1.081936, -2.095295, 0.8884513, 1, 1, 1, 1, 1,
1.093952, -1.331551, 2.914724, 1, 1, 1, 1, 1,
1.101453, -1.295344, 3.838524, 1, 1, 1, 1, 1,
1.102194, 1.037306, 0.8370342, 1, 1, 1, 1, 1,
1.1152, -0.01585848, 1.293694, 1, 1, 1, 1, 1,
1.115586, -3.192897, 2.597827, 0, 0, 1, 1, 1,
1.117217, 0.1955687, 1.93448, 1, 0, 0, 1, 1,
1.120844, 1.481704, -0.3035559, 1, 0, 0, 1, 1,
1.121457, -1.583862, 1.862986, 1, 0, 0, 1, 1,
1.12445, 1.623753, 0.0499474, 1, 0, 0, 1, 1,
1.124703, -0.9417324, 3.302324, 1, 0, 0, 1, 1,
1.126634, 0.01616899, 2.826131, 0, 0, 0, 1, 1,
1.128441, 0.1912148, 1.960252, 0, 0, 0, 1, 1,
1.13636, 0.18375, 1.5161, 0, 0, 0, 1, 1,
1.138092, -0.7275069, 2.150202, 0, 0, 0, 1, 1,
1.140152, 0.1116546, 1.530768, 0, 0, 0, 1, 1,
1.146976, -0.4039919, 0.6540651, 0, 0, 0, 1, 1,
1.148943, 1.114442, 0.447083, 0, 0, 0, 1, 1,
1.160277, 0.2484348, 1.50539, 1, 1, 1, 1, 1,
1.163767, -0.1958154, 2.719167, 1, 1, 1, 1, 1,
1.164172, 0.3995515, 0.2652558, 1, 1, 1, 1, 1,
1.165738, 1.429051, 0.7088117, 1, 1, 1, 1, 1,
1.16699, 0.492676, 1.827754, 1, 1, 1, 1, 1,
1.181143, -0.6190285, 4.012456, 1, 1, 1, 1, 1,
1.182854, -0.3704286, 2.968489, 1, 1, 1, 1, 1,
1.186028, 0.4884264, -0.3571063, 1, 1, 1, 1, 1,
1.186264, 0.206621, 1.131906, 1, 1, 1, 1, 1,
1.189773, 0.8553263, 1.830697, 1, 1, 1, 1, 1,
1.191745, -1.158248, 1.504746, 1, 1, 1, 1, 1,
1.193073, 2.204063, 1.627896, 1, 1, 1, 1, 1,
1.200105, -0.5183911, 1.364279, 1, 1, 1, 1, 1,
1.207306, -0.2610542, 0.845507, 1, 1, 1, 1, 1,
1.210839, 1.146886, 2.084847, 1, 1, 1, 1, 1,
1.214099, 0.4926366, 0.4369648, 0, 0, 1, 1, 1,
1.218701, 0.6054604, -1.086497, 1, 0, 0, 1, 1,
1.21906, 1.447038, 1.182408, 1, 0, 0, 1, 1,
1.221433, -1.177339, 2.386534, 1, 0, 0, 1, 1,
1.226704, -0.7422433, 1.912668, 1, 0, 0, 1, 1,
1.228998, 1.211619, -0.4497326, 1, 0, 0, 1, 1,
1.229943, 1.916988, 1.16046, 0, 0, 0, 1, 1,
1.236364, -1.693605, 1.960526, 0, 0, 0, 1, 1,
1.256535, 0.01367047, 3.051093, 0, 0, 0, 1, 1,
1.267334, 1.120164, 1.692135, 0, 0, 0, 1, 1,
1.267654, -1.309324, 2.237151, 0, 0, 0, 1, 1,
1.268603, 1.011966, 1.607999, 0, 0, 0, 1, 1,
1.286444, -0.01902719, 1.5272, 0, 0, 0, 1, 1,
1.28732, -2.441891, 2.469009, 1, 1, 1, 1, 1,
1.288252, 1.313364, 0.418997, 1, 1, 1, 1, 1,
1.299031, 0.2380162, 4.5025, 1, 1, 1, 1, 1,
1.308804, 0.8598782, 2.915741, 1, 1, 1, 1, 1,
1.314531, 0.7240432, 1.078043, 1, 1, 1, 1, 1,
1.318086, -1.126679, 4.537998, 1, 1, 1, 1, 1,
1.319942, -0.6718273, 2.252289, 1, 1, 1, 1, 1,
1.320538, 2.925112, -0.2831184, 1, 1, 1, 1, 1,
1.329353, -2.048556, 2.260575, 1, 1, 1, 1, 1,
1.329996, 0.7197096, 1.711627, 1, 1, 1, 1, 1,
1.330673, 1.591177, -0.7577499, 1, 1, 1, 1, 1,
1.334137, 0.5466796, 2.112644, 1, 1, 1, 1, 1,
1.335318, 1.225124, 0.558512, 1, 1, 1, 1, 1,
1.358677, -0.07614001, 1.92222, 1, 1, 1, 1, 1,
1.364929, 0.9607755, 2.278918, 1, 1, 1, 1, 1,
1.388349, 0.3425581, 2.482933, 0, 0, 1, 1, 1,
1.407096, -0.06270377, 1.659456, 1, 0, 0, 1, 1,
1.407979, -1.474804, 3.143315, 1, 0, 0, 1, 1,
1.422585, 0.2848216, 0.2032529, 1, 0, 0, 1, 1,
1.432555, 2.065459, -2.501548, 1, 0, 0, 1, 1,
1.451019, 0.5916873, 2.170169, 1, 0, 0, 1, 1,
1.45145, -1.401693, 3.541449, 0, 0, 0, 1, 1,
1.46755, -1.330598, 3.689939, 0, 0, 0, 1, 1,
1.478366, -0.9422978, 1.482617, 0, 0, 0, 1, 1,
1.504885, -0.2125394, 3.140793, 0, 0, 0, 1, 1,
1.516541, -0.6635163, 0.2115848, 0, 0, 0, 1, 1,
1.516695, -0.7005981, 1.357235, 0, 0, 0, 1, 1,
1.520922, 0.6329612, 0.4639608, 0, 0, 0, 1, 1,
1.522276, -0.3262493, 2.312608, 1, 1, 1, 1, 1,
1.522584, -0.2434907, 1.620422, 1, 1, 1, 1, 1,
1.527797, -1.062205, 2.866596, 1, 1, 1, 1, 1,
1.541442, 0.6162499, -0.7864901, 1, 1, 1, 1, 1,
1.565155, -0.1499444, 1.939043, 1, 1, 1, 1, 1,
1.580196, 1.189226, 0.419562, 1, 1, 1, 1, 1,
1.586219, -0.4565308, 3.316684, 1, 1, 1, 1, 1,
1.589216, -0.8159348, 1.347868, 1, 1, 1, 1, 1,
1.600827, -0.1800634, 1.771312, 1, 1, 1, 1, 1,
1.627384, -1.498384, 2.24259, 1, 1, 1, 1, 1,
1.635413, -0.3785737, 2.312813, 1, 1, 1, 1, 1,
1.63847, -0.9418641, 0.5572745, 1, 1, 1, 1, 1,
1.638859, 0.7382202, 2.087023, 1, 1, 1, 1, 1,
1.640054, -0.6430475, 2.680571, 1, 1, 1, 1, 1,
1.65371, 0.145353, 0.8438126, 1, 1, 1, 1, 1,
1.666464, -1.069697, 2.037848, 0, 0, 1, 1, 1,
1.66836, -0.6163222, 1.803221, 1, 0, 0, 1, 1,
1.679017, 1.012802, 1.163648, 1, 0, 0, 1, 1,
1.700521, -0.2822022, 2.290864, 1, 0, 0, 1, 1,
1.73053, -1.188524, 2.891554, 1, 0, 0, 1, 1,
1.737028, 0.6222647, 1.044107, 1, 0, 0, 1, 1,
1.740116, -0.5545381, 0.5855195, 0, 0, 0, 1, 1,
1.756653, -0.2572219, 0.691926, 0, 0, 0, 1, 1,
1.764477, 1.122537, 1.40567, 0, 0, 0, 1, 1,
1.794461, -0.6850014, 0.3766958, 0, 0, 0, 1, 1,
1.816927, 0.9695587, 2.374448, 0, 0, 0, 1, 1,
1.820786, 0.5820154, 1.624964, 0, 0, 0, 1, 1,
1.821658, -1.221797, 2.032859, 0, 0, 0, 1, 1,
1.831546, -0.7947414, 3.86598, 1, 1, 1, 1, 1,
1.837666, -1.250241, 3.348269, 1, 1, 1, 1, 1,
1.874187, -0.2164287, 1.486491, 1, 1, 1, 1, 1,
1.884892, 1.462693, 0.4235791, 1, 1, 1, 1, 1,
1.895617, 0.1934722, 1.743243, 1, 1, 1, 1, 1,
1.924871, 0.4995293, 1.429087, 1, 1, 1, 1, 1,
1.961277, 0.7990076, 0.7276182, 1, 1, 1, 1, 1,
2.011487, -2.402781, 2.262965, 1, 1, 1, 1, 1,
2.021183, 0.4952835, 1.929422, 1, 1, 1, 1, 1,
2.023134, 1.92399, 1.310248, 1, 1, 1, 1, 1,
2.045636, 0.2994224, 0.5237364, 1, 1, 1, 1, 1,
2.10401, 0.6756988, 3.197544, 1, 1, 1, 1, 1,
2.11306, 1.094641, 0.8809909, 1, 1, 1, 1, 1,
2.142087, 0.04847278, 2.483555, 1, 1, 1, 1, 1,
2.172103, -1.828245, 2.511372, 1, 1, 1, 1, 1,
2.182075, -0.6296557, 2.054436, 0, 0, 1, 1, 1,
2.184033, 1.299739, 0.9216591, 1, 0, 0, 1, 1,
2.186619, 1.87375, 0.9107371, 1, 0, 0, 1, 1,
2.1877, 1.093467, 1.271622, 1, 0, 0, 1, 1,
2.189141, 1.303157, 3.2231, 1, 0, 0, 1, 1,
2.216154, 0.5049705, 1.450636, 1, 0, 0, 1, 1,
2.22463, 1.064051, 1.267636, 0, 0, 0, 1, 1,
2.287616, -1.485519, 2.128219, 0, 0, 0, 1, 1,
2.298461, -1.363683, 2.030524, 0, 0, 0, 1, 1,
2.309685, 0.9984508, -0.3460803, 0, 0, 0, 1, 1,
2.311893, -0.1408646, 2.172177, 0, 0, 0, 1, 1,
2.340749, -0.5361147, 2.218579, 0, 0, 0, 1, 1,
2.350904, 0.1181537, 0.6373472, 0, 0, 0, 1, 1,
2.384121, 0.4632585, 0.4644635, 1, 1, 1, 1, 1,
2.427119, 0.3540086, 0.2850944, 1, 1, 1, 1, 1,
2.44729, -0.5088289, 2.080393, 1, 1, 1, 1, 1,
2.547362, 1.585769, 1.299743, 1, 1, 1, 1, 1,
2.61528, 0.6310835, 0.7414152, 1, 1, 1, 1, 1,
2.666426, 0.8966955, 0.6652548, 1, 1, 1, 1, 1,
2.712268, -0.8059272, 1.354802, 1, 1, 1, 1, 1
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
var radius = 9.531108;
var distance = 33.47761;
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
mvMatrix.translate( 0.2879117, -0.213944, -0.08175826 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47761);
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