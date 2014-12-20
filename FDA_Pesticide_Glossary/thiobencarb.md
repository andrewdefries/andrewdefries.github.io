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
-3.147659, 2.071378, -1.161986, 1, 0, 0, 1,
-2.580271, -1.469352, -0.1015534, 1, 0.007843138, 0, 1,
-2.484174, -0.4463282, -1.288091, 1, 0.01176471, 0, 1,
-2.429596, 0.6222811, -2.912709, 1, 0.01960784, 0, 1,
-2.409627, -0.3379273, -2.334677, 1, 0.02352941, 0, 1,
-2.409096, 1.080621, -1.646548, 1, 0.03137255, 0, 1,
-2.378405, 0.2298516, -1.301246, 1, 0.03529412, 0, 1,
-2.312605, 0.4304205, -1.939013, 1, 0.04313726, 0, 1,
-2.311299, -0.1688913, -2.052308, 1, 0.04705882, 0, 1,
-2.311048, 0.6201461, -1.351777, 1, 0.05490196, 0, 1,
-2.284528, -1.592007, -1.1086, 1, 0.05882353, 0, 1,
-2.282148, 0.04758681, -0.7077922, 1, 0.06666667, 0, 1,
-2.281072, 0.1315526, -2.345039, 1, 0.07058824, 0, 1,
-2.27996, 0.2356402, -0.8642792, 1, 0.07843138, 0, 1,
-2.252825, -1.343564, -2.034935, 1, 0.08235294, 0, 1,
-2.186522, -0.1649858, -2.477293, 1, 0.09019608, 0, 1,
-2.127776, -0.2265003, -1.46878, 1, 0.09411765, 0, 1,
-2.101786, -0.5254877, -2.795507, 1, 0.1019608, 0, 1,
-2.092439, 2.125797, -0.002921646, 1, 0.1098039, 0, 1,
-2.089525, 1.586083, -1.550869, 1, 0.1137255, 0, 1,
-2.087872, -0.470237, -4.13536, 1, 0.1215686, 0, 1,
-2.076503, -1.190328, -1.151951, 1, 0.1254902, 0, 1,
-2.071129, 1.348015, -0.8589092, 1, 0.1333333, 0, 1,
-2.044342, -0.1438688, -1.749194, 1, 0.1372549, 0, 1,
-2.033226, 0.6862783, -0.3287801, 1, 0.145098, 0, 1,
-1.993667, -0.2502894, -0.913339, 1, 0.1490196, 0, 1,
-1.977219, 2.13551, -1.538635, 1, 0.1568628, 0, 1,
-1.960642, 0.7326162, -0.2782587, 1, 0.1607843, 0, 1,
-1.958541, -0.1468279, -2.799253, 1, 0.1686275, 0, 1,
-1.915734, 0.6792418, -1.860675, 1, 0.172549, 0, 1,
-1.913028, 0.6754649, -1.855844, 1, 0.1803922, 0, 1,
-1.886739, 0.7444465, -1.704855, 1, 0.1843137, 0, 1,
-1.880083, 0.06335776, -2.962187, 1, 0.1921569, 0, 1,
-1.869966, -0.6272144, -2.523944, 1, 0.1960784, 0, 1,
-1.86987, -0.5990409, -4.31103, 1, 0.2039216, 0, 1,
-1.865907, 0.1737696, -3.62198, 1, 0.2117647, 0, 1,
-1.838797, -0.7603277, -2.830135, 1, 0.2156863, 0, 1,
-1.829417, -0.2553891, -1.524445, 1, 0.2235294, 0, 1,
-1.821945, 0.4932435, 0.01001322, 1, 0.227451, 0, 1,
-1.819365, -0.9583999, -1.718801, 1, 0.2352941, 0, 1,
-1.817226, 1.785882, -0.9762357, 1, 0.2392157, 0, 1,
-1.804227, -1.948565, -2.420016, 1, 0.2470588, 0, 1,
-1.799996, -0.559397, -2.815829, 1, 0.2509804, 0, 1,
-1.78711, -0.124797, -3.323105, 1, 0.2588235, 0, 1,
-1.783962, -1.082724, -0.3707435, 1, 0.2627451, 0, 1,
-1.778115, 0.8136312, 1.425546, 1, 0.2705882, 0, 1,
-1.771009, -0.6398942, -2.01351, 1, 0.2745098, 0, 1,
-1.762437, -0.7496395, -1.827786, 1, 0.282353, 0, 1,
-1.751114, -1.377569, -2.420222, 1, 0.2862745, 0, 1,
-1.745463, 3.103955, -0.4179331, 1, 0.2941177, 0, 1,
-1.743158, -0.1207546, -3.057167, 1, 0.3019608, 0, 1,
-1.688575, 0.4839983, -1.582139, 1, 0.3058824, 0, 1,
-1.676364, 0.706609, -0.3778753, 1, 0.3137255, 0, 1,
-1.667403, 0.3792889, -1.01649, 1, 0.3176471, 0, 1,
-1.655524, 1.58429, -0.812831, 1, 0.3254902, 0, 1,
-1.653937, 2.352423, -0.2897132, 1, 0.3294118, 0, 1,
-1.646448, -1.631677, -3.322713, 1, 0.3372549, 0, 1,
-1.644215, 0.2752698, -1.177351, 1, 0.3411765, 0, 1,
-1.634961, -0.6071877, -2.156927, 1, 0.3490196, 0, 1,
-1.633225, 0.7804259, 0.7810724, 1, 0.3529412, 0, 1,
-1.612673, -1.291345, -3.520077, 1, 0.3607843, 0, 1,
-1.596771, -0.6249976, -2.381215, 1, 0.3647059, 0, 1,
-1.592141, 0.04788479, -1.133689, 1, 0.372549, 0, 1,
-1.588211, -0.4198852, -0.8905814, 1, 0.3764706, 0, 1,
-1.578748, -1.879414, -3.78694, 1, 0.3843137, 0, 1,
-1.567646, -0.6028637, -1.990071, 1, 0.3882353, 0, 1,
-1.566592, 1.25104, -0.4041606, 1, 0.3960784, 0, 1,
-1.557622, -0.2540815, -2.59555, 1, 0.4039216, 0, 1,
-1.550261, 0.2589357, -4.353307, 1, 0.4078431, 0, 1,
-1.549482, 1.652527, -1.305615, 1, 0.4156863, 0, 1,
-1.543589, -0.08369653, -0.1228598, 1, 0.4196078, 0, 1,
-1.542797, 1.029387, -1.550748, 1, 0.427451, 0, 1,
-1.522587, -0.02778787, -1.64958, 1, 0.4313726, 0, 1,
-1.514851, -1.748811, -2.990779, 1, 0.4392157, 0, 1,
-1.514523, 0.6696604, -1.460901, 1, 0.4431373, 0, 1,
-1.513744, 0.4659047, 0.5864549, 1, 0.4509804, 0, 1,
-1.503855, -0.1516517, -2.093987, 1, 0.454902, 0, 1,
-1.497977, 0.06689817, -1.388776, 1, 0.4627451, 0, 1,
-1.492476, -0.9707502, -1.662734, 1, 0.4666667, 0, 1,
-1.484003, -0.9690233, -2.368013, 1, 0.4745098, 0, 1,
-1.483429, -0.5733744, -3.978226, 1, 0.4784314, 0, 1,
-1.479974, -0.3852361, -3.147891, 1, 0.4862745, 0, 1,
-1.476964, 1.035161, -1.029181, 1, 0.4901961, 0, 1,
-1.472942, 0.08029698, -0.472327, 1, 0.4980392, 0, 1,
-1.46779, 0.7288951, 1.567995, 1, 0.5058824, 0, 1,
-1.467173, 0.1817429, -2.987773, 1, 0.509804, 0, 1,
-1.443781, -0.9675645, -2.312763, 1, 0.5176471, 0, 1,
-1.422396, -1.043565, -1.653313, 1, 0.5215687, 0, 1,
-1.421555, 0.5111178, -0.4858293, 1, 0.5294118, 0, 1,
-1.40528, -0.8003701, -2.230236, 1, 0.5333334, 0, 1,
-1.402427, 2.175179, 0.1108382, 1, 0.5411765, 0, 1,
-1.401792, 0.5857718, -2.482579, 1, 0.5450981, 0, 1,
-1.392823, -1.526222, -2.861035, 1, 0.5529412, 0, 1,
-1.391111, -0.3173367, -2.161004, 1, 0.5568628, 0, 1,
-1.384236, -0.1952808, -1.292995, 1, 0.5647059, 0, 1,
-1.377338, 1.399714, -1.190664, 1, 0.5686275, 0, 1,
-1.367263, 0.3829986, -2.245768, 1, 0.5764706, 0, 1,
-1.361855, -0.2204194, -2.878726, 1, 0.5803922, 0, 1,
-1.359446, -0.7370369, -2.844947, 1, 0.5882353, 0, 1,
-1.358763, -0.964994, -3.208483, 1, 0.5921569, 0, 1,
-1.358544, -0.5076917, -3.710091, 1, 0.6, 0, 1,
-1.35806, -0.4657955, -3.635848, 1, 0.6078432, 0, 1,
-1.348128, 0.7639585, -2.006837, 1, 0.6117647, 0, 1,
-1.347481, 0.05592992, -2.104246, 1, 0.6196079, 0, 1,
-1.346885, 0.3043324, -1.06129, 1, 0.6235294, 0, 1,
-1.328136, -1.122016, -1.966216, 1, 0.6313726, 0, 1,
-1.327232, 0.1112821, -3.406175, 1, 0.6352941, 0, 1,
-1.324957, -1.125035, -1.321938, 1, 0.6431373, 0, 1,
-1.323614, -2.457741, -2.726638, 1, 0.6470588, 0, 1,
-1.316815, -0.8670633, -2.576157, 1, 0.654902, 0, 1,
-1.313172, 0.5355883, -0.6366449, 1, 0.6588235, 0, 1,
-1.310758, 0.2254981, -2.079423, 1, 0.6666667, 0, 1,
-1.305922, 2.314336, -0.323393, 1, 0.6705883, 0, 1,
-1.299986, 0.1048299, -0.4850917, 1, 0.6784314, 0, 1,
-1.29158, -1.673811, -2.995722, 1, 0.682353, 0, 1,
-1.288712, 0.2476203, -0.8369305, 1, 0.6901961, 0, 1,
-1.286883, 1.2354, -1.133614, 1, 0.6941177, 0, 1,
-1.279378, 0.7329678, -0.4177068, 1, 0.7019608, 0, 1,
-1.273937, 0.02186672, -0.5972411, 1, 0.7098039, 0, 1,
-1.273213, -1.556044, -2.620147, 1, 0.7137255, 0, 1,
-1.273019, -0.09127705, -0.2304216, 1, 0.7215686, 0, 1,
-1.27271, -0.1992208, -1.017009, 1, 0.7254902, 0, 1,
-1.259242, 1.830064, -0.3416345, 1, 0.7333333, 0, 1,
-1.253055, -0.06094886, -0.3260907, 1, 0.7372549, 0, 1,
-1.249627, -0.4476134, -2.844559, 1, 0.7450981, 0, 1,
-1.238175, 0.6218192, -1.408684, 1, 0.7490196, 0, 1,
-1.2371, -0.2427736, 0.2366085, 1, 0.7568628, 0, 1,
-1.236111, -1.946187, -1.75273, 1, 0.7607843, 0, 1,
-1.215053, 0.3624405, -1.187458, 1, 0.7686275, 0, 1,
-1.213195, -0.09332031, -3.164733, 1, 0.772549, 0, 1,
-1.194541, -0.09337149, -1.002383, 1, 0.7803922, 0, 1,
-1.174244, 1.102348, -0.8984843, 1, 0.7843137, 0, 1,
-1.173891, 0.6415344, -1.710904, 1, 0.7921569, 0, 1,
-1.161378, 0.380323, -0.4870135, 1, 0.7960784, 0, 1,
-1.151262, 0.6151601, -1.363021, 1, 0.8039216, 0, 1,
-1.147034, 0.4567752, -2.422948, 1, 0.8117647, 0, 1,
-1.146327, -0.6525357, -1.122147, 1, 0.8156863, 0, 1,
-1.142896, -0.6548647, -2.846473, 1, 0.8235294, 0, 1,
-1.139943, 0.6144989, -0.8031114, 1, 0.827451, 0, 1,
-1.131468, 1.915481, -0.6913458, 1, 0.8352941, 0, 1,
-1.12901, 1.595034, -0.05834313, 1, 0.8392157, 0, 1,
-1.123189, 0.2287775, -1.761702, 1, 0.8470588, 0, 1,
-1.115251, -0.3095966, -1.781038, 1, 0.8509804, 0, 1,
-1.109686, -0.3850396, -2.133132, 1, 0.8588235, 0, 1,
-1.107679, 1.934441, 0.9637033, 1, 0.8627451, 0, 1,
-1.103512, 0.5257908, -0.1227561, 1, 0.8705882, 0, 1,
-1.087437, -0.4777577, -1.468252, 1, 0.8745098, 0, 1,
-1.084619, -1.751483, -1.896378, 1, 0.8823529, 0, 1,
-1.081263, 0.7091383, -2.764365, 1, 0.8862745, 0, 1,
-1.077603, -0.6840128, 0.09492526, 1, 0.8941177, 0, 1,
-1.075865, 0.4670151, -2.460432, 1, 0.8980392, 0, 1,
-1.069306, -1.090151, -2.928818, 1, 0.9058824, 0, 1,
-1.067993, -0.08986839, -3.114319, 1, 0.9137255, 0, 1,
-1.066363, -0.8897777, -1.731061, 1, 0.9176471, 0, 1,
-1.065642, 0.2278822, -1.296017, 1, 0.9254902, 0, 1,
-1.063951, -1.464183, -3.38262, 1, 0.9294118, 0, 1,
-1.062541, -0.5119562, -0.6781735, 1, 0.9372549, 0, 1,
-1.058259, 0.1015333, -0.4999781, 1, 0.9411765, 0, 1,
-1.057104, 0.5408539, -0.1080477, 1, 0.9490196, 0, 1,
-1.056428, -1.226569, -2.269572, 1, 0.9529412, 0, 1,
-1.055871, -1.224943, -2.053158, 1, 0.9607843, 0, 1,
-1.053461, 0.3913037, -0.8075938, 1, 0.9647059, 0, 1,
-1.041448, 0.8393976, -1.631558, 1, 0.972549, 0, 1,
-1.039346, 0.5104336, -2.547092, 1, 0.9764706, 0, 1,
-1.032348, -1.979181, -2.657754, 1, 0.9843137, 0, 1,
-1.028263, -1.249649, -3.625199, 1, 0.9882353, 0, 1,
-1.02404, -1.874918, -1.61839, 1, 0.9960784, 0, 1,
-1.023166, 1.241179, 1.195876, 0.9960784, 1, 0, 1,
-1.018469, -0.6286734, -1.109052, 0.9921569, 1, 0, 1,
-1.017994, -2.409364, -3.768744, 0.9843137, 1, 0, 1,
-1.017406, 0.6190838, -0.5025985, 0.9803922, 1, 0, 1,
-1.017226, 0.9112327, 1.198537, 0.972549, 1, 0, 1,
-1.016146, 0.1061204, -0.6818309, 0.9686275, 1, 0, 1,
-1.009971, 0.08892019, -0.9257805, 0.9607843, 1, 0, 1,
-1.000014, -1.022152, -3.520149, 0.9568627, 1, 0, 1,
-0.9976698, 0.01314288, -1.780585, 0.9490196, 1, 0, 1,
-0.9972482, 1.385143, -2.089917, 0.945098, 1, 0, 1,
-0.9925517, 0.06439557, -0.9401956, 0.9372549, 1, 0, 1,
-0.9916848, 1.018289, -1.64353, 0.9333333, 1, 0, 1,
-0.9911137, -0.3782928, -0.5265388, 0.9254902, 1, 0, 1,
-0.9883451, -0.2020391, -1.723244, 0.9215686, 1, 0, 1,
-0.9867321, 0.5233828, -1.476632, 0.9137255, 1, 0, 1,
-0.9773992, -1.472791, -1.65119, 0.9098039, 1, 0, 1,
-0.9720337, -0.6302819, -2.830257, 0.9019608, 1, 0, 1,
-0.96973, -0.6796465, -4.281265, 0.8941177, 1, 0, 1,
-0.9565061, -1.115166, -3.02535, 0.8901961, 1, 0, 1,
-0.9548927, 1.606695, -1.603572, 0.8823529, 1, 0, 1,
-0.9520634, -0.2323026, -2.654798, 0.8784314, 1, 0, 1,
-0.949406, -0.7976241, -1.529022, 0.8705882, 1, 0, 1,
-0.9463812, -2.081318, -3.202742, 0.8666667, 1, 0, 1,
-0.9404095, -0.6232021, -3.085934, 0.8588235, 1, 0, 1,
-0.9371662, 0.409341, -0.8246694, 0.854902, 1, 0, 1,
-0.9359718, 1.971277, -2.83718, 0.8470588, 1, 0, 1,
-0.9358714, 0.08342177, -1.397118, 0.8431373, 1, 0, 1,
-0.9331192, -2.310097, -3.132153, 0.8352941, 1, 0, 1,
-0.9279231, 0.6375003, 0.4302783, 0.8313726, 1, 0, 1,
-0.9233952, 0.2589249, -1.006312, 0.8235294, 1, 0, 1,
-0.9233556, 1.39041, -1.331948, 0.8196079, 1, 0, 1,
-0.9146633, -2.380978, -2.868595, 0.8117647, 1, 0, 1,
-0.909592, 0.3364598, -2.718957, 0.8078431, 1, 0, 1,
-0.9092423, -0.07505692, -1.46295, 0.8, 1, 0, 1,
-0.9088876, -0.1732658, -1.266433, 0.7921569, 1, 0, 1,
-0.9077424, -1.007898, -3.425617, 0.7882353, 1, 0, 1,
-0.9041619, 1.699982, -0.5021147, 0.7803922, 1, 0, 1,
-0.9024671, -1.820408, -1.712543, 0.7764706, 1, 0, 1,
-0.8991431, 1.620804, -1.713867, 0.7686275, 1, 0, 1,
-0.8990711, -1.377164, -2.827868, 0.7647059, 1, 0, 1,
-0.8978453, -0.5564414, -3.485581, 0.7568628, 1, 0, 1,
-0.894994, -1.124342, -2.879092, 0.7529412, 1, 0, 1,
-0.8935327, -0.6498388, -2.065659, 0.7450981, 1, 0, 1,
-0.8932579, -0.7314425, -1.895175, 0.7411765, 1, 0, 1,
-0.8879815, -1.77793, -3.163188, 0.7333333, 1, 0, 1,
-0.8675272, -0.5435745, -1.202414, 0.7294118, 1, 0, 1,
-0.8668312, 1.627243, 0.4506576, 0.7215686, 1, 0, 1,
-0.8543973, -0.5818614, -2.395041, 0.7176471, 1, 0, 1,
-0.8440701, -0.06736398, -2.537565, 0.7098039, 1, 0, 1,
-0.8440021, 0.1517692, -0.9122316, 0.7058824, 1, 0, 1,
-0.842059, 0.6792982, -0.2713055, 0.6980392, 1, 0, 1,
-0.8409138, -1.525728, -4.205659, 0.6901961, 1, 0, 1,
-0.8405854, -0.9300203, -2.77915, 0.6862745, 1, 0, 1,
-0.84052, -1.45103, -0.2937233, 0.6784314, 1, 0, 1,
-0.8350261, 0.9682751, -0.3897555, 0.6745098, 1, 0, 1,
-0.8289359, -0.1968106, -0.8984188, 0.6666667, 1, 0, 1,
-0.8278722, 0.1867806, -1.573598, 0.6627451, 1, 0, 1,
-0.8263739, 1.321711, 0.08291113, 0.654902, 1, 0, 1,
-0.817386, 0.2436444, -2.933454, 0.6509804, 1, 0, 1,
-0.815578, 0.9923717, -1.682792, 0.6431373, 1, 0, 1,
-0.8151803, -0.2323694, -1.44224, 0.6392157, 1, 0, 1,
-0.8128871, -0.6045351, -2.4776, 0.6313726, 1, 0, 1,
-0.8124039, -0.4416132, -2.750872, 0.627451, 1, 0, 1,
-0.8071293, 1.253496, 0.2376509, 0.6196079, 1, 0, 1,
-0.8014821, 1.31743, -0.6550987, 0.6156863, 1, 0, 1,
-0.7936625, 0.1779992, -1.342051, 0.6078432, 1, 0, 1,
-0.7914812, -0.244289, -2.550247, 0.6039216, 1, 0, 1,
-0.7900218, -0.01921708, -2.234237, 0.5960785, 1, 0, 1,
-0.7879482, 0.6984432, -2.323812, 0.5882353, 1, 0, 1,
-0.7870997, 0.457059, -0.1993387, 0.5843138, 1, 0, 1,
-0.7868304, -1.29057, -2.796888, 0.5764706, 1, 0, 1,
-0.7856332, -0.2400614, -2.078606, 0.572549, 1, 0, 1,
-0.783518, -0.289086, -2.293815, 0.5647059, 1, 0, 1,
-0.7812545, -0.2864487, -2.083729, 0.5607843, 1, 0, 1,
-0.7639779, 1.058358, -0.4594043, 0.5529412, 1, 0, 1,
-0.7603006, -0.6985089, -1.981205, 0.5490196, 1, 0, 1,
-0.7592292, 0.6896861, -1.884332, 0.5411765, 1, 0, 1,
-0.7583136, 0.6786941, -0.02378087, 0.5372549, 1, 0, 1,
-0.7547716, -0.3050329, -0.2312713, 0.5294118, 1, 0, 1,
-0.7469088, -1.043378, -1.352883, 0.5254902, 1, 0, 1,
-0.7459781, -1.502881, -2.58491, 0.5176471, 1, 0, 1,
-0.74502, 0.1145928, -1.772985, 0.5137255, 1, 0, 1,
-0.7446018, 0.3518209, 0.3047926, 0.5058824, 1, 0, 1,
-0.7445123, 1.129283, -1.754515, 0.5019608, 1, 0, 1,
-0.7416487, -0.6664495, -1.931295, 0.4941176, 1, 0, 1,
-0.7413333, -1.476251, -2.237665, 0.4862745, 1, 0, 1,
-0.7368392, 0.6962695, -1.404548, 0.4823529, 1, 0, 1,
-0.7310991, 1.602102, 1.064137, 0.4745098, 1, 0, 1,
-0.72188, -0.6460975, -1.963342, 0.4705882, 1, 0, 1,
-0.7191408, 0.7759838, -1.125002, 0.4627451, 1, 0, 1,
-0.7146666, 0.2047856, -1.63749, 0.4588235, 1, 0, 1,
-0.7146564, 0.4971944, -0.5334578, 0.4509804, 1, 0, 1,
-0.7146526, 2.602411, -1.722485, 0.4470588, 1, 0, 1,
-0.7132456, 0.08759267, -0.3323695, 0.4392157, 1, 0, 1,
-0.7106786, -0.848592, -1.714929, 0.4352941, 1, 0, 1,
-0.7076228, -1.061441, -3.88545, 0.427451, 1, 0, 1,
-0.7072854, 1.109322, -1.211636, 0.4235294, 1, 0, 1,
-0.70587, -0.9741254, -1.311073, 0.4156863, 1, 0, 1,
-0.7027112, 0.8290551, -1.374356, 0.4117647, 1, 0, 1,
-0.6982215, -0.9179389, -0.5651235, 0.4039216, 1, 0, 1,
-0.6906707, -0.3084655, -1.980502, 0.3960784, 1, 0, 1,
-0.6895266, 0.6270335, -0.7564148, 0.3921569, 1, 0, 1,
-0.6878933, -1.081822, -1.788031, 0.3843137, 1, 0, 1,
-0.6840319, -0.2462104, -1.700139, 0.3803922, 1, 0, 1,
-0.6801046, -0.6552089, -2.481061, 0.372549, 1, 0, 1,
-0.6769648, -0.1744562, -1.582483, 0.3686275, 1, 0, 1,
-0.6758214, 0.1881213, -0.7908479, 0.3607843, 1, 0, 1,
-0.6757663, 1.336633, -0.3163304, 0.3568628, 1, 0, 1,
-0.6747657, 0.3238306, -2.096089, 0.3490196, 1, 0, 1,
-0.6734766, -2.049896, -4.371068, 0.345098, 1, 0, 1,
-0.6716817, 2.241751, -0.8336709, 0.3372549, 1, 0, 1,
-0.6699577, 0.1816929, -1.440263, 0.3333333, 1, 0, 1,
-0.6690729, 1.345518, -0.8541495, 0.3254902, 1, 0, 1,
-0.6689765, 0.8957931, -0.5806781, 0.3215686, 1, 0, 1,
-0.6683511, 0.8662816, -0.7753946, 0.3137255, 1, 0, 1,
-0.6644685, 0.3901174, 0.2317027, 0.3098039, 1, 0, 1,
-0.6584292, 0.5926788, -0.8029034, 0.3019608, 1, 0, 1,
-0.6579564, -1.927272, -4.611697, 0.2941177, 1, 0, 1,
-0.6567803, -2.824967, -3.566761, 0.2901961, 1, 0, 1,
-0.6505299, 0.4623862, -1.160835, 0.282353, 1, 0, 1,
-0.6442485, -1.696011, -2.305816, 0.2784314, 1, 0, 1,
-0.6410106, 0.4405451, -0.05993693, 0.2705882, 1, 0, 1,
-0.6393457, -0.1651955, -2.17123, 0.2666667, 1, 0, 1,
-0.6379297, 0.2684177, -0.08062914, 0.2588235, 1, 0, 1,
-0.6367913, 0.9689828, -1.595698, 0.254902, 1, 0, 1,
-0.6305246, 1.27306, 0.8511842, 0.2470588, 1, 0, 1,
-0.628659, -1.041889, -0.6008961, 0.2431373, 1, 0, 1,
-0.6284156, -0.8259003, -0.6103701, 0.2352941, 1, 0, 1,
-0.6263234, 0.6040772, -0.5563841, 0.2313726, 1, 0, 1,
-0.6216739, 0.7204235, -0.9394225, 0.2235294, 1, 0, 1,
-0.6209943, 0.4879662, -0.2578153, 0.2196078, 1, 0, 1,
-0.6136346, 1.748395, -1.076536, 0.2117647, 1, 0, 1,
-0.6116805, 0.2566589, -0.06384048, 0.2078431, 1, 0, 1,
-0.609622, -1.493232, -4.540301, 0.2, 1, 0, 1,
-0.6060386, 0.01236895, -2.629064, 0.1921569, 1, 0, 1,
-0.6058279, -0.5568421, -2.074552, 0.1882353, 1, 0, 1,
-0.6052985, -0.4754423, -2.728189, 0.1803922, 1, 0, 1,
-0.6047568, -0.4260678, -0.9531646, 0.1764706, 1, 0, 1,
-0.6028093, 0.06235083, -1.863363, 0.1686275, 1, 0, 1,
-0.6023818, 0.4459566, -0.03045999, 0.1647059, 1, 0, 1,
-0.5983393, -0.4538985, -0.4124627, 0.1568628, 1, 0, 1,
-0.5952941, -0.2385627, -1.876935, 0.1529412, 1, 0, 1,
-0.5924473, -1.075976, -2.33952, 0.145098, 1, 0, 1,
-0.5862194, -0.6587892, -2.223767, 0.1411765, 1, 0, 1,
-0.5683967, -1.014763, -2.532725, 0.1333333, 1, 0, 1,
-0.5650857, 0.5389492, -0.1451754, 0.1294118, 1, 0, 1,
-0.5646905, -0.5605096, -1.546018, 0.1215686, 1, 0, 1,
-0.5640767, 0.6038457, 0.1339041, 0.1176471, 1, 0, 1,
-0.5634949, 0.1435125, -1.192878, 0.1098039, 1, 0, 1,
-0.5632219, -0.3529682, -3.003664, 0.1058824, 1, 0, 1,
-0.5622891, -1.969157, -2.356904, 0.09803922, 1, 0, 1,
-0.5608658, -1.248477, -3.898572, 0.09019608, 1, 0, 1,
-0.5599548, -1.642596, -2.876839, 0.08627451, 1, 0, 1,
-0.5561668, -0.8583961, -3.085626, 0.07843138, 1, 0, 1,
-0.5550883, 0.6882651, -0.6898447, 0.07450981, 1, 0, 1,
-0.5546463, 0.05195545, -1.463791, 0.06666667, 1, 0, 1,
-0.5514791, -0.08262461, -2.432282, 0.0627451, 1, 0, 1,
-0.5444475, 0.5182465, -0.0216106, 0.05490196, 1, 0, 1,
-0.5427172, -0.1514964, -0.6986796, 0.05098039, 1, 0, 1,
-0.5416873, 1.270991, 0.1139758, 0.04313726, 1, 0, 1,
-0.536438, 0.4861457, -2.76014, 0.03921569, 1, 0, 1,
-0.5342919, 1.801747, -1.236955, 0.03137255, 1, 0, 1,
-0.5340884, 0.1103615, -0.686563, 0.02745098, 1, 0, 1,
-0.5285803, -1.730883, -4.769581, 0.01960784, 1, 0, 1,
-0.5177343, 0.4202497, -2.02311, 0.01568628, 1, 0, 1,
-0.5176021, -0.1516201, -2.741373, 0.007843138, 1, 0, 1,
-0.5174187, 0.3928145, 0.4311622, 0.003921569, 1, 0, 1,
-0.5171926, 0.254502, -1.462841, 0, 1, 0.003921569, 1,
-0.5136368, 0.5677503, 0.710573, 0, 1, 0.01176471, 1,
-0.5119894, -1.02905, -4.281208, 0, 1, 0.01568628, 1,
-0.5081512, 1.310398, 0.7478163, 0, 1, 0.02352941, 1,
-0.5074574, -0.4993831, -2.250364, 0, 1, 0.02745098, 1,
-0.4984405, 1.722127, 0.02091564, 0, 1, 0.03529412, 1,
-0.4974927, 0.6766906, -0.5225163, 0, 1, 0.03921569, 1,
-0.4974924, -0.1181877, -0.8979614, 0, 1, 0.04705882, 1,
-0.4972731, 0.6611382, -1.784129, 0, 1, 0.05098039, 1,
-0.4930761, -0.1943386, -2.087888, 0, 1, 0.05882353, 1,
-0.4865264, 0.0592785, -1.179814, 0, 1, 0.0627451, 1,
-0.4829048, -1.823929, -3.070024, 0, 1, 0.07058824, 1,
-0.4770218, 0.1598437, -0.7954161, 0, 1, 0.07450981, 1,
-0.4714285, 0.1193597, -0.2368244, 0, 1, 0.08235294, 1,
-0.4672674, 2.617435, -1.456148, 0, 1, 0.08627451, 1,
-0.4630723, 2.088731, -0.1611567, 0, 1, 0.09411765, 1,
-0.4534207, -0.6340609, -5.032217, 0, 1, 0.1019608, 1,
-0.4531872, -0.5188742, -2.868278, 0, 1, 0.1058824, 1,
-0.4501062, -2.300237, -2.646318, 0, 1, 0.1137255, 1,
-0.448327, 1.083067, 0.7949736, 0, 1, 0.1176471, 1,
-0.4416933, 0.26217, -1.247353, 0, 1, 0.1254902, 1,
-0.4389376, 0.972574, -1.048788, 0, 1, 0.1294118, 1,
-0.4264669, -0.8312314, -3.590964, 0, 1, 0.1372549, 1,
-0.4254948, 2.210293, -0.7023867, 0, 1, 0.1411765, 1,
-0.4193724, 2.204911, -0.797482, 0, 1, 0.1490196, 1,
-0.4174121, -0.6007788, -1.991401, 0, 1, 0.1529412, 1,
-0.4171441, 0.07273527, -1.956857, 0, 1, 0.1607843, 1,
-0.4119482, 0.9370468, -0.02773234, 0, 1, 0.1647059, 1,
-0.4111827, -0.9056619, -3.679051, 0, 1, 0.172549, 1,
-0.4071114, 0.3421455, -1.948356, 0, 1, 0.1764706, 1,
-0.4068695, -1.249036, -3.593927, 0, 1, 0.1843137, 1,
-0.4027051, -1.304067, -1.587257, 0, 1, 0.1882353, 1,
-0.4014599, 0.7478898, 1.36373, 0, 1, 0.1960784, 1,
-0.4013967, -1.002878, -1.314777, 0, 1, 0.2039216, 1,
-0.4005962, 2.3787, 0.2866479, 0, 1, 0.2078431, 1,
-0.3989525, 1.688028, 0.1443445, 0, 1, 0.2156863, 1,
-0.3970724, 2.03485, 0.7532438, 0, 1, 0.2196078, 1,
-0.3968496, 0.4690674, -1.462107, 0, 1, 0.227451, 1,
-0.3918416, 0.6314819, 0.09032752, 0, 1, 0.2313726, 1,
-0.391479, -0.433059, -1.181132, 0, 1, 0.2392157, 1,
-0.3908616, -0.7319237, -3.257155, 0, 1, 0.2431373, 1,
-0.3898126, -1.001313, -3.336039, 0, 1, 0.2509804, 1,
-0.3866169, 0.195741, -1.545944, 0, 1, 0.254902, 1,
-0.3830079, -0.04520061, -1.331079, 0, 1, 0.2627451, 1,
-0.3772471, 0.6340137, 1.723114, 0, 1, 0.2666667, 1,
-0.3772291, -0.003984666, -1.401837, 0, 1, 0.2745098, 1,
-0.3756467, -1.747789, -2.727712, 0, 1, 0.2784314, 1,
-0.3732456, -0.8068186, -2.535673, 0, 1, 0.2862745, 1,
-0.3652278, -0.8349109, -1.840444, 0, 1, 0.2901961, 1,
-0.365012, 0.113542, -1.927353, 0, 1, 0.2980392, 1,
-0.3649554, -0.5728397, -2.324513, 0, 1, 0.3058824, 1,
-0.3533467, 0.5779271, 0.2516637, 0, 1, 0.3098039, 1,
-0.3474047, -0.3550873, -2.964259, 0, 1, 0.3176471, 1,
-0.3443177, -1.44778, -2.026664, 0, 1, 0.3215686, 1,
-0.3395073, -0.2448511, -2.054243, 0, 1, 0.3294118, 1,
-0.3393748, 1.2058, 0.3890784, 0, 1, 0.3333333, 1,
-0.3372318, 0.5491665, -2.009939, 0, 1, 0.3411765, 1,
-0.3363541, 0.8516502, -0.7474801, 0, 1, 0.345098, 1,
-0.335987, 1.176054, 1.933668, 0, 1, 0.3529412, 1,
-0.3304188, 0.0416902, -0.6490835, 0, 1, 0.3568628, 1,
-0.3256358, 0.2318497, -0.9113532, 0, 1, 0.3647059, 1,
-0.3172392, 1.456718, -2.278341, 0, 1, 0.3686275, 1,
-0.3146997, -1.622429, -4.040975, 0, 1, 0.3764706, 1,
-0.3129299, -0.1796104, -0.6633482, 0, 1, 0.3803922, 1,
-0.3110423, 0.2927005, -0.7904289, 0, 1, 0.3882353, 1,
-0.3106124, -0.2536132, -1.294439, 0, 1, 0.3921569, 1,
-0.3084062, -0.136884, -2.147113, 0, 1, 0.4, 1,
-0.3041371, 0.222695, -0.4381851, 0, 1, 0.4078431, 1,
-0.3026051, -0.7749264, -3.013619, 0, 1, 0.4117647, 1,
-0.3024323, 0.2468962, 0.4824514, 0, 1, 0.4196078, 1,
-0.3012794, 0.5365838, -0.5022296, 0, 1, 0.4235294, 1,
-0.2971855, -0.2118933, -1.748628, 0, 1, 0.4313726, 1,
-0.2964036, 1.976944, -0.7933273, 0, 1, 0.4352941, 1,
-0.2944771, 0.7197761, -0.6493114, 0, 1, 0.4431373, 1,
-0.2927845, 0.1571672, -1.039852, 0, 1, 0.4470588, 1,
-0.2911143, 0.6820396, -1.302694, 0, 1, 0.454902, 1,
-0.286816, -1.110968, -2.035302, 0, 1, 0.4588235, 1,
-0.2839125, -0.9196227, -1.981726, 0, 1, 0.4666667, 1,
-0.2823549, 1.045038, -0.9738961, 0, 1, 0.4705882, 1,
-0.2823144, -5.235036e-05, -2.150506, 0, 1, 0.4784314, 1,
-0.2748011, -2.370191, -1.570388, 0, 1, 0.4823529, 1,
-0.2741935, 0.5219375, -1.516369, 0, 1, 0.4901961, 1,
-0.2692614, -0.9403312, -3.41217, 0, 1, 0.4941176, 1,
-0.2691635, -0.5179039, -2.330314, 0, 1, 0.5019608, 1,
-0.2620199, -2.206133, -4.383276, 0, 1, 0.509804, 1,
-0.2605716, -0.2621717, -3.012159, 0, 1, 0.5137255, 1,
-0.2591625, -0.7429108, -5.141633, 0, 1, 0.5215687, 1,
-0.2590319, 0.7142842, 1.349839, 0, 1, 0.5254902, 1,
-0.2571277, 1.014346, 0.4813726, 0, 1, 0.5333334, 1,
-0.2480811, -1.090362, -2.785757, 0, 1, 0.5372549, 1,
-0.2439015, -0.3878253, -4.28489, 0, 1, 0.5450981, 1,
-0.2391393, 1.146538, -0.3560003, 0, 1, 0.5490196, 1,
-0.2366449, -0.3787358, -0.585661, 0, 1, 0.5568628, 1,
-0.2364297, 1.11061, 0.5986207, 0, 1, 0.5607843, 1,
-0.2342125, 0.8409691, 0.2538482, 0, 1, 0.5686275, 1,
-0.2342114, -1.389547, -3.069499, 0, 1, 0.572549, 1,
-0.2283797, -0.9150868, -3.828203, 0, 1, 0.5803922, 1,
-0.227449, -1.52229, -4.45757, 0, 1, 0.5843138, 1,
-0.2273369, 0.2380647, -1.30221, 0, 1, 0.5921569, 1,
-0.2257698, 1.312544, -1.175322, 0, 1, 0.5960785, 1,
-0.2243343, -0.4902023, -3.526601, 0, 1, 0.6039216, 1,
-0.2221328, -0.5004112, -2.245218, 0, 1, 0.6117647, 1,
-0.2184562, 0.9433978, -1.044005, 0, 1, 0.6156863, 1,
-0.2183851, 1.602849, -1.802469, 0, 1, 0.6235294, 1,
-0.2176547, 1.174489, 0.8199493, 0, 1, 0.627451, 1,
-0.211382, 0.3255692, 0.2587253, 0, 1, 0.6352941, 1,
-0.2073952, 0.1735983, -2.187401, 0, 1, 0.6392157, 1,
-0.2038729, 1.036593, 0.2153003, 0, 1, 0.6470588, 1,
-0.2005863, -1.707652, -3.561097, 0, 1, 0.6509804, 1,
-0.1975741, 1.690214, -0.2606995, 0, 1, 0.6588235, 1,
-0.1952976, 1.071584, 1.231864, 0, 1, 0.6627451, 1,
-0.1945079, -0.8704018, -2.289169, 0, 1, 0.6705883, 1,
-0.1905107, -1.102575, -3.501144, 0, 1, 0.6745098, 1,
-0.1865306, -1.216094, -2.583279, 0, 1, 0.682353, 1,
-0.1855134, 2.15294, -0.02784877, 0, 1, 0.6862745, 1,
-0.1799009, 1.364278, 0.6778296, 0, 1, 0.6941177, 1,
-0.1796607, 1.948616, 0.1855719, 0, 1, 0.7019608, 1,
-0.1794102, -0.1531101, -1.367673, 0, 1, 0.7058824, 1,
-0.1794035, -0.6069492, -2.340395, 0, 1, 0.7137255, 1,
-0.1779053, 0.5076182, -2.416706, 0, 1, 0.7176471, 1,
-0.1765815, 0.6458819, -0.7710043, 0, 1, 0.7254902, 1,
-0.176493, -0.6433435, -3.356982, 0, 1, 0.7294118, 1,
-0.1675474, -1.345787, -1.990994, 0, 1, 0.7372549, 1,
-0.165312, 1.224718, 1.376751, 0, 1, 0.7411765, 1,
-0.1591236, 0.2304918, 0.3140728, 0, 1, 0.7490196, 1,
-0.1540898, 1.604045, -1.621839, 0, 1, 0.7529412, 1,
-0.1422547, -2.18646, -3.573537, 0, 1, 0.7607843, 1,
-0.1410154, -0.07654954, -0.1987084, 0, 1, 0.7647059, 1,
-0.1405887, -0.5619496, -2.864639, 0, 1, 0.772549, 1,
-0.1386401, 0.1954052, -1.375283, 0, 1, 0.7764706, 1,
-0.1354306, -0.6542106, -3.318134, 0, 1, 0.7843137, 1,
-0.1296481, 0.7175339, 0.3117111, 0, 1, 0.7882353, 1,
-0.1267594, 0.1502738, -0.1968824, 0, 1, 0.7960784, 1,
-0.1170343, 1.938852, -0.8874686, 0, 1, 0.8039216, 1,
-0.1160381, 1.866466, -0.9449139, 0, 1, 0.8078431, 1,
-0.1156599, -1.377742, -0.8114905, 0, 1, 0.8156863, 1,
-0.108444, 1.973986, 0.1601118, 0, 1, 0.8196079, 1,
-0.1076729, 0.1845382, -0.5451401, 0, 1, 0.827451, 1,
-0.107494, 0.361211, -0.4489707, 0, 1, 0.8313726, 1,
-0.1071392, -0.4533662, -2.638417, 0, 1, 0.8392157, 1,
-0.1061422, -1.035715, -3.421684, 0, 1, 0.8431373, 1,
-0.104993, -0.7784732, -3.452969, 0, 1, 0.8509804, 1,
-0.1035514, 0.06612439, -1.207748, 0, 1, 0.854902, 1,
-0.102971, -0.2943767, -3.16065, 0, 1, 0.8627451, 1,
-0.097869, -0.5240728, -1.220489, 0, 1, 0.8666667, 1,
-0.09234368, -0.860835, -3.705421, 0, 1, 0.8745098, 1,
-0.08056553, -2.227046, -1.784608, 0, 1, 0.8784314, 1,
-0.07920527, -0.7508701, -1.415372, 0, 1, 0.8862745, 1,
-0.07773535, -1.848694, -2.726203, 0, 1, 0.8901961, 1,
-0.07651748, 0.3629925, 0.5095577, 0, 1, 0.8980392, 1,
-0.07475242, -0.5089262, -2.950531, 0, 1, 0.9058824, 1,
-0.05881854, 0.4767281, -0.553341, 0, 1, 0.9098039, 1,
-0.05794193, -0.6291862, -3.281258, 0, 1, 0.9176471, 1,
-0.05622586, -1.63692, -2.666987, 0, 1, 0.9215686, 1,
-0.05317833, -0.5758787, -4.853917, 0, 1, 0.9294118, 1,
-0.05226668, -0.6207688, -1.626295, 0, 1, 0.9333333, 1,
-0.04512702, 0.9042478, 0.3355044, 0, 1, 0.9411765, 1,
-0.04231699, -0.4538988, -3.567924, 0, 1, 0.945098, 1,
-0.03928957, 0.3003407, -0.4150112, 0, 1, 0.9529412, 1,
-0.0360403, -0.5638287, -2.417795, 0, 1, 0.9568627, 1,
-0.03461264, -0.4123677, -2.801857, 0, 1, 0.9647059, 1,
-0.02438505, 0.1594663, -1.298884, 0, 1, 0.9686275, 1,
-0.01981017, -0.5350675, -3.978839, 0, 1, 0.9764706, 1,
-0.01879077, 0.4288449, 1.694344, 0, 1, 0.9803922, 1,
-0.01301738, 1.814957, -0.3033716, 0, 1, 0.9882353, 1,
-0.01082624, 0.510366, -1.105491, 0, 1, 0.9921569, 1,
-0.01075286, -1.247269, -3.365199, 0, 1, 1, 1,
-0.00788184, 0.3987831, 1.823766, 0, 0.9921569, 1, 1,
-0.007411203, -0.02953095, -4.067685, 0, 0.9882353, 1, 1,
-0.005879799, -0.05849345, -3.753632, 0, 0.9803922, 1, 1,
-0.004922296, 0.4423054, 0.1844348, 0, 0.9764706, 1, 1,
-0.004291203, 1.457729, -0.1760619, 0, 0.9686275, 1, 1,
-0.003388277, 1.173631, -0.9228895, 0, 0.9647059, 1, 1,
-0.002838544, 0.6865166, 0.7790217, 0, 0.9568627, 1, 1,
-0.002263254, -1.774469, -2.944678, 0, 0.9529412, 1, 1,
0.005699213, -0.1061573, 3.669492, 0, 0.945098, 1, 1,
0.007922158, -0.5462995, 3.573621, 0, 0.9411765, 1, 1,
0.01220634, -1.567231, 1.986852, 0, 0.9333333, 1, 1,
0.01378721, -0.8738354, 4.93422, 0, 0.9294118, 1, 1,
0.01437595, -0.2326632, 1.253184, 0, 0.9215686, 1, 1,
0.0163636, -0.318495, 4.237079, 0, 0.9176471, 1, 1,
0.02304972, 2.195218, -0.2038529, 0, 0.9098039, 1, 1,
0.03085001, -0.3604331, 3.651479, 0, 0.9058824, 1, 1,
0.03665926, -0.7988833, 2.396431, 0, 0.8980392, 1, 1,
0.0373625, 0.159745, -2.607208, 0, 0.8901961, 1, 1,
0.03791721, -0.1353258, 2.203917, 0, 0.8862745, 1, 1,
0.03849391, -0.6898689, 2.385526, 0, 0.8784314, 1, 1,
0.0397268, -0.3068686, 2.730527, 0, 0.8745098, 1, 1,
0.04203409, -1.183632, 3.799337, 0, 0.8666667, 1, 1,
0.04344898, -0.7413584, 3.279696, 0, 0.8627451, 1, 1,
0.04430569, -0.4456395, 2.627401, 0, 0.854902, 1, 1,
0.04507814, -2.398062, 2.100991, 0, 0.8509804, 1, 1,
0.05005474, 0.5142676, 0.6425864, 0, 0.8431373, 1, 1,
0.05022114, -0.3948393, 2.306894, 0, 0.8392157, 1, 1,
0.05085038, 0.6457349, -0.3969145, 0, 0.8313726, 1, 1,
0.05167776, -0.7432577, 2.7259, 0, 0.827451, 1, 1,
0.05262775, -0.4600762, 0.2675307, 0, 0.8196079, 1, 1,
0.05514092, 0.5502417, 0.68831, 0, 0.8156863, 1, 1,
0.05891182, -0.2674773, 3.639936, 0, 0.8078431, 1, 1,
0.06043996, -0.2543101, 1.946903, 0, 0.8039216, 1, 1,
0.06606315, 0.0986689, 1.429099, 0, 0.7960784, 1, 1,
0.06642094, 0.8085514, 1.368448, 0, 0.7882353, 1, 1,
0.06721553, 0.189155, 1.7233, 0, 0.7843137, 1, 1,
0.06944623, -1.935052, 5.186306, 0, 0.7764706, 1, 1,
0.07190133, 0.2700022, -0.3805492, 0, 0.772549, 1, 1,
0.07565694, 0.6277662, -0.2007175, 0, 0.7647059, 1, 1,
0.07598828, -1.11917, 2.288605, 0, 0.7607843, 1, 1,
0.0827038, -0.3587834, 2.475773, 0, 0.7529412, 1, 1,
0.08744808, -0.565394, 2.081209, 0, 0.7490196, 1, 1,
0.08782504, 0.6419249, -0.07861859, 0, 0.7411765, 1, 1,
0.09061657, 0.5998185, 0.9856768, 0, 0.7372549, 1, 1,
0.09209485, -1.025397, 3.413002, 0, 0.7294118, 1, 1,
0.09934647, 0.7581222, -0.4479294, 0, 0.7254902, 1, 1,
0.1013438, -0.5973278, 2.894607, 0, 0.7176471, 1, 1,
0.105196, -0.9582596, 2.130214, 0, 0.7137255, 1, 1,
0.1160411, 0.9538198, 0.3215427, 0, 0.7058824, 1, 1,
0.1181132, -0.1304234, 2.222563, 0, 0.6980392, 1, 1,
0.1264369, 0.2170804, 1.136248, 0, 0.6941177, 1, 1,
0.1269697, 1.231196, -0.292562, 0, 0.6862745, 1, 1,
0.1294209, -0.193979, 2.803525, 0, 0.682353, 1, 1,
0.1336881, -1.241404, 2.429564, 0, 0.6745098, 1, 1,
0.1356412, 0.228971, 0.7060323, 0, 0.6705883, 1, 1,
0.1364943, 0.8454605, 0.0150047, 0, 0.6627451, 1, 1,
0.1371506, -1.048543, 2.392455, 0, 0.6588235, 1, 1,
0.138944, -1.754534, 4.890573, 0, 0.6509804, 1, 1,
0.1398405, 0.0002531248, 0.7794321, 0, 0.6470588, 1, 1,
0.1438212, -0.009145585, 4.496709, 0, 0.6392157, 1, 1,
0.1474213, -0.02236222, 1.644139, 0, 0.6352941, 1, 1,
0.1478397, -0.4017778, 3.151527, 0, 0.627451, 1, 1,
0.1482055, 0.4773598, 1.05973, 0, 0.6235294, 1, 1,
0.1539687, -1.387923, 2.799608, 0, 0.6156863, 1, 1,
0.1562068, -1.391838, 3.434999, 0, 0.6117647, 1, 1,
0.1578552, 0.4171944, -1.367598, 0, 0.6039216, 1, 1,
0.1615988, 0.1651277, 1.043009, 0, 0.5960785, 1, 1,
0.1622408, 0.5415336, 1.589877, 0, 0.5921569, 1, 1,
0.1693988, 0.3359064, 2.034512, 0, 0.5843138, 1, 1,
0.1708872, 1.520626, -0.8463024, 0, 0.5803922, 1, 1,
0.1735698, -0.137846, 3.151375, 0, 0.572549, 1, 1,
0.1778035, -0.1458598, 3.518038, 0, 0.5686275, 1, 1,
0.1786207, -0.1062546, 2.350404, 0, 0.5607843, 1, 1,
0.179434, -0.03980169, 0.7457759, 0, 0.5568628, 1, 1,
0.1806604, 0.4609531, -1.323034, 0, 0.5490196, 1, 1,
0.1842429, -0.7833687, 1.379658, 0, 0.5450981, 1, 1,
0.18455, -1.28872, 3.566361, 0, 0.5372549, 1, 1,
0.1845971, -0.4021673, 3.10305, 0, 0.5333334, 1, 1,
0.1864855, -0.2923812, 2.397457, 0, 0.5254902, 1, 1,
0.1869363, -0.05637603, 2.24342, 0, 0.5215687, 1, 1,
0.1877615, -0.2009799, 3.043386, 0, 0.5137255, 1, 1,
0.1921226, 0.2347514, 1.297933, 0, 0.509804, 1, 1,
0.1952706, -1.089437, 2.095123, 0, 0.5019608, 1, 1,
0.1954324, -0.4057798, 2.132755, 0, 0.4941176, 1, 1,
0.205645, -0.6955995, 1.310968, 0, 0.4901961, 1, 1,
0.2059908, 1.469977, 0.6056433, 0, 0.4823529, 1, 1,
0.2091885, 1.033962, 0.5586888, 0, 0.4784314, 1, 1,
0.2111537, 0.4216547, 1.24528, 0, 0.4705882, 1, 1,
0.2112058, -0.80666, 3.986423, 0, 0.4666667, 1, 1,
0.2113132, -0.3542089, 2.792798, 0, 0.4588235, 1, 1,
0.2126657, 0.2106047, 0.2140708, 0, 0.454902, 1, 1,
0.2145782, -0.3381692, 2.912477, 0, 0.4470588, 1, 1,
0.218644, 1.170669, 0.1078259, 0, 0.4431373, 1, 1,
0.221395, 0.2278155, 1.309654, 0, 0.4352941, 1, 1,
0.222529, -0.11828, 1.618336, 0, 0.4313726, 1, 1,
0.2249259, 0.9365441, -0.2172582, 0, 0.4235294, 1, 1,
0.2286591, 0.6168507, 1.628333, 0, 0.4196078, 1, 1,
0.2296723, -0.3174443, 1.367553, 0, 0.4117647, 1, 1,
0.2405418, 1.440274, 0.3266025, 0, 0.4078431, 1, 1,
0.2428676, -1.952666, 2.461264, 0, 0.4, 1, 1,
0.2430771, -0.4897796, 3.531731, 0, 0.3921569, 1, 1,
0.2442311, 0.9054842, 0.8816072, 0, 0.3882353, 1, 1,
0.2446868, -1.017667, 2.710354, 0, 0.3803922, 1, 1,
0.2466649, 1.078634, 1.50562, 0, 0.3764706, 1, 1,
0.2467772, -1.826865, 1.41917, 0, 0.3686275, 1, 1,
0.2493395, 0.2412966, 0.3374301, 0, 0.3647059, 1, 1,
0.2512802, -1.218148, 2.996152, 0, 0.3568628, 1, 1,
0.2522581, -2.168887, 1.24826, 0, 0.3529412, 1, 1,
0.2557918, 0.4943074, -0.9154885, 0, 0.345098, 1, 1,
0.2603298, 0.3145401, -0.9299482, 0, 0.3411765, 1, 1,
0.2661796, 0.2441854, 1.415789, 0, 0.3333333, 1, 1,
0.2675592, 1.935095, -0.2118944, 0, 0.3294118, 1, 1,
0.2678994, -1.441422, 2.818942, 0, 0.3215686, 1, 1,
0.2685926, -0.3151238, 2.405531, 0, 0.3176471, 1, 1,
0.2704153, -1.967808, 5.097445, 0, 0.3098039, 1, 1,
0.271076, 0.7215515, 2.063633, 0, 0.3058824, 1, 1,
0.2734965, 0.704023, -0.2425598, 0, 0.2980392, 1, 1,
0.2775316, -0.2072859, 1.529852, 0, 0.2901961, 1, 1,
0.2815887, 0.7683598, 0.2453721, 0, 0.2862745, 1, 1,
0.2826906, 0.4805391, -0.5633317, 0, 0.2784314, 1, 1,
0.2830442, 1.022218, 1.526291, 0, 0.2745098, 1, 1,
0.2843824, -0.1614538, 1.725969, 0, 0.2666667, 1, 1,
0.2844302, 1.233231, 0.6755366, 0, 0.2627451, 1, 1,
0.293381, -0.4587714, 2.846205, 0, 0.254902, 1, 1,
0.2951025, -0.161638, 0.7429769, 0, 0.2509804, 1, 1,
0.2969648, 0.9488029, -0.1280324, 0, 0.2431373, 1, 1,
0.3020199, -1.464433, 4.601231, 0, 0.2392157, 1, 1,
0.302975, -0.5538281, 2.928066, 0, 0.2313726, 1, 1,
0.3032081, 0.5590386, 0.5849772, 0, 0.227451, 1, 1,
0.3037619, -0.3334911, 3.08985, 0, 0.2196078, 1, 1,
0.3038946, 0.9598557, 0.1369558, 0, 0.2156863, 1, 1,
0.3039643, 0.3554394, 1.091686, 0, 0.2078431, 1, 1,
0.3048533, -0.217458, 1.241849, 0, 0.2039216, 1, 1,
0.3069836, 0.521306, 0.5815966, 0, 0.1960784, 1, 1,
0.3094072, 0.4315657, -0.2663108, 0, 0.1882353, 1, 1,
0.3094949, 0.5807553, 0.8380651, 0, 0.1843137, 1, 1,
0.3127255, -1.305388, 3.622432, 0, 0.1764706, 1, 1,
0.3141981, 1.042565, -0.1507536, 0, 0.172549, 1, 1,
0.3189898, 1.355237, -0.1156553, 0, 0.1647059, 1, 1,
0.3271228, -1.224667, 2.488287, 0, 0.1607843, 1, 1,
0.340825, -0.8570095, 1.513081, 0, 0.1529412, 1, 1,
0.3425664, 0.7538355, -0.4331976, 0, 0.1490196, 1, 1,
0.3435141, 0.007188356, 1.470804, 0, 0.1411765, 1, 1,
0.3479848, -0.1047805, 2.056642, 0, 0.1372549, 1, 1,
0.3539453, -0.2676015, 1.716609, 0, 0.1294118, 1, 1,
0.3555287, -0.1696691, 3.141078, 0, 0.1254902, 1, 1,
0.3568098, -0.4047503, 2.335585, 0, 0.1176471, 1, 1,
0.3586241, -1.59275, 2.18107, 0, 0.1137255, 1, 1,
0.36025, -1.167405, 1.869234, 0, 0.1058824, 1, 1,
0.36076, -0.1835644, 1.602412, 0, 0.09803922, 1, 1,
0.3632364, -0.8450224, 3.828631, 0, 0.09411765, 1, 1,
0.3648142, 0.6537165, 0.2013182, 0, 0.08627451, 1, 1,
0.382885, 0.3116363, 2.842716, 0, 0.08235294, 1, 1,
0.3879677, 0.7314764, -1.345869, 0, 0.07450981, 1, 1,
0.3879967, -1.327142, 2.376788, 0, 0.07058824, 1, 1,
0.3977434, 0.6146911, 1.125512, 0, 0.0627451, 1, 1,
0.4017546, -0.299181, 3.602451, 0, 0.05882353, 1, 1,
0.4029381, -0.01981548, 0.8862624, 0, 0.05098039, 1, 1,
0.406877, 0.594384, -0.5418767, 0, 0.04705882, 1, 1,
0.4091922, 0.9234561, 1.023982, 0, 0.03921569, 1, 1,
0.409381, -1.91669, 2.464569, 0, 0.03529412, 1, 1,
0.4104391, 0.06228519, 0.3974248, 0, 0.02745098, 1, 1,
0.4112652, -0.4333303, 1.691216, 0, 0.02352941, 1, 1,
0.4135105, -1.95113, 3.909764, 0, 0.01568628, 1, 1,
0.4155365, 0.09671881, 1.465749, 0, 0.01176471, 1, 1,
0.416737, 0.2384974, 0.1547464, 0, 0.003921569, 1, 1,
0.4178799, 0.6445889, 0.5340263, 0.003921569, 0, 1, 1,
0.4183104, 0.5040063, 1.000606, 0.007843138, 0, 1, 1,
0.4193826, 0.001830919, 2.0907, 0.01568628, 0, 1, 1,
0.420613, 1.015548, 0.5928013, 0.01960784, 0, 1, 1,
0.4231466, 0.2715736, 1.238501, 0.02745098, 0, 1, 1,
0.4237952, -0.531886, 2.377736, 0.03137255, 0, 1, 1,
0.4279115, 0.1507139, 0.5249903, 0.03921569, 0, 1, 1,
0.4290124, -1.842461, 1.96828, 0.04313726, 0, 1, 1,
0.4442211, -1.115005, 2.778814, 0.05098039, 0, 1, 1,
0.4496858, 0.4775905, -0.1131663, 0.05490196, 0, 1, 1,
0.4601698, 0.3536755, 1.309454, 0.0627451, 0, 1, 1,
0.4635103, 1.466411, -0.9362048, 0.06666667, 0, 1, 1,
0.4651617, -1.489401, 2.931398, 0.07450981, 0, 1, 1,
0.4657424, -1.014141, 2.216371, 0.07843138, 0, 1, 1,
0.4661504, 1.4886, -1.177476, 0.08627451, 0, 1, 1,
0.4759839, 1.768138, 1.977957, 0.09019608, 0, 1, 1,
0.4774304, -0.685168, 3.945043, 0.09803922, 0, 1, 1,
0.4794209, -0.1053001, 0.8348701, 0.1058824, 0, 1, 1,
0.4817826, 0.1417625, 1.707989, 0.1098039, 0, 1, 1,
0.4879615, 1.364499, -0.2005781, 0.1176471, 0, 1, 1,
0.4944717, -0.6332018, 3.970471, 0.1215686, 0, 1, 1,
0.4952222, 0.9586013, 1.84011, 0.1294118, 0, 1, 1,
0.4987625, -0.349186, 1.693033, 0.1333333, 0, 1, 1,
0.5014207, -0.2314225, 1.447008, 0.1411765, 0, 1, 1,
0.502255, 0.06153076, -0.2568459, 0.145098, 0, 1, 1,
0.5138693, -0.2418336, 0.6264247, 0.1529412, 0, 1, 1,
0.514644, 0.943621, 0.01367651, 0.1568628, 0, 1, 1,
0.5148729, 0.09205622, 2.160145, 0.1647059, 0, 1, 1,
0.5159431, 0.6070576, 1.52853, 0.1686275, 0, 1, 1,
0.5162113, 1.468068, -0.9966036, 0.1764706, 0, 1, 1,
0.5181027, -0.8387492, 2.508219, 0.1803922, 0, 1, 1,
0.5189112, -0.5362355, 2.864222, 0.1882353, 0, 1, 1,
0.5196889, 2.12456, 0.4953798, 0.1921569, 0, 1, 1,
0.5203933, -0.5106509, 2.825423, 0.2, 0, 1, 1,
0.5247774, -0.8793794, 3.014692, 0.2078431, 0, 1, 1,
0.5288867, -0.2745999, 4.043637, 0.2117647, 0, 1, 1,
0.532016, -1.372639, 1.804543, 0.2196078, 0, 1, 1,
0.5336521, -0.508101, 3.80806, 0.2235294, 0, 1, 1,
0.5392309, -0.1624807, 1.953814, 0.2313726, 0, 1, 1,
0.5399015, -1.645191, 3.997183, 0.2352941, 0, 1, 1,
0.5416529, -0.1694487, 2.336745, 0.2431373, 0, 1, 1,
0.5443571, -0.7299114, 2.82646, 0.2470588, 0, 1, 1,
0.5476555, 0.06005524, 1.144212, 0.254902, 0, 1, 1,
0.5520366, -1.795705, 3.39892, 0.2588235, 0, 1, 1,
0.5527509, 0.3774953, 1.688023, 0.2666667, 0, 1, 1,
0.5560287, -0.8506118, 1.48981, 0.2705882, 0, 1, 1,
0.5582575, 0.2072678, 1.316966, 0.2784314, 0, 1, 1,
0.5607967, -0.8338132, 2.462385, 0.282353, 0, 1, 1,
0.561901, 0.4385213, 1.923723, 0.2901961, 0, 1, 1,
0.5619062, 1.387122, -1.178933, 0.2941177, 0, 1, 1,
0.5623068, 0.5375257, -0.9358952, 0.3019608, 0, 1, 1,
0.5636257, 0.7179115, 0.8872788, 0.3098039, 0, 1, 1,
0.5674975, -1.236907, 2.899467, 0.3137255, 0, 1, 1,
0.5685067, 1.186526, 1.889907, 0.3215686, 0, 1, 1,
0.571599, -0.5348192, 2.260915, 0.3254902, 0, 1, 1,
0.5749522, -0.9882481, 2.822739, 0.3333333, 0, 1, 1,
0.5753762, 0.8947035, 0.2649884, 0.3372549, 0, 1, 1,
0.576216, 0.5264689, 1.823494, 0.345098, 0, 1, 1,
0.5798262, -0.4107544, 1.030377, 0.3490196, 0, 1, 1,
0.584968, 0.6174927, -0.4583556, 0.3568628, 0, 1, 1,
0.5915356, -1.946164, 3.16461, 0.3607843, 0, 1, 1,
0.5919018, -1.600874, 3.532852, 0.3686275, 0, 1, 1,
0.5929813, -0.4282936, 1.63009, 0.372549, 0, 1, 1,
0.5989801, 0.8492268, -0.4156505, 0.3803922, 0, 1, 1,
0.6025158, 0.9806203, 1.821906, 0.3843137, 0, 1, 1,
0.6061741, 0.06825879, 0.6785544, 0.3921569, 0, 1, 1,
0.606248, 1.264946, -0.8789801, 0.3960784, 0, 1, 1,
0.6069252, 0.4710156, 0.8158137, 0.4039216, 0, 1, 1,
0.6086093, -0.6430458, 1.75277, 0.4117647, 0, 1, 1,
0.6090374, 0.6826008, 2.189749, 0.4156863, 0, 1, 1,
0.6118019, 0.6125442, 0.9701365, 0.4235294, 0, 1, 1,
0.615736, 1.307161, 0.1839617, 0.427451, 0, 1, 1,
0.6165185, 1.386488, 0.05053622, 0.4352941, 0, 1, 1,
0.6248601, 0.1309625, -0.4102905, 0.4392157, 0, 1, 1,
0.6267903, -1.564126, 2.739087, 0.4470588, 0, 1, 1,
0.6277638, -1.645669, 2.563323, 0.4509804, 0, 1, 1,
0.6290722, 0.1817609, 1.073631, 0.4588235, 0, 1, 1,
0.6301108, -0.00618779, 0.6764659, 0.4627451, 0, 1, 1,
0.6361774, 0.3393519, 0.9393618, 0.4705882, 0, 1, 1,
0.6379119, -0.376279, 2.238634, 0.4745098, 0, 1, 1,
0.638892, -0.4020036, 1.869297, 0.4823529, 0, 1, 1,
0.6408255, -0.05377519, 1.199463, 0.4862745, 0, 1, 1,
0.646332, 0.08922474, 1.62194, 0.4941176, 0, 1, 1,
0.6473677, -0.7803215, 1.282625, 0.5019608, 0, 1, 1,
0.6522087, -0.5978467, 3.002797, 0.5058824, 0, 1, 1,
0.660477, 1.423805, 1.449463, 0.5137255, 0, 1, 1,
0.6709269, 0.5929101, -1.305901, 0.5176471, 0, 1, 1,
0.6730555, -0.140874, 1.401209, 0.5254902, 0, 1, 1,
0.6777672, -1.083441, 1.86799, 0.5294118, 0, 1, 1,
0.6789156, -1.888407, 4.092276, 0.5372549, 0, 1, 1,
0.6789654, -0.3333738, 0.9172627, 0.5411765, 0, 1, 1,
0.680893, -0.3826119, 0.6267189, 0.5490196, 0, 1, 1,
0.6827876, -0.4559256, 2.471196, 0.5529412, 0, 1, 1,
0.6874742, -0.2481114, 1.544838, 0.5607843, 0, 1, 1,
0.6880153, 0.9022971, 0.881686, 0.5647059, 0, 1, 1,
0.689943, -0.1934374, 0.273212, 0.572549, 0, 1, 1,
0.6902451, 0.6859806, -0.8378021, 0.5764706, 0, 1, 1,
0.690462, 0.6298352, 0.1097395, 0.5843138, 0, 1, 1,
0.6935505, 1.772697, 0.2811866, 0.5882353, 0, 1, 1,
0.6950603, -1.690888, 1.513842, 0.5960785, 0, 1, 1,
0.6955359, 0.1856283, 0.9859009, 0.6039216, 0, 1, 1,
0.698184, 0.6468509, -0.3817474, 0.6078432, 0, 1, 1,
0.7006848, 0.3371154, 1.060723, 0.6156863, 0, 1, 1,
0.7039235, 1.775898, 0.01380737, 0.6196079, 0, 1, 1,
0.7045757, -0.1183292, 3.040639, 0.627451, 0, 1, 1,
0.7051133, 0.8441952, 1.050827, 0.6313726, 0, 1, 1,
0.7091898, -0.558159, 1.595512, 0.6392157, 0, 1, 1,
0.7284473, 0.2330622, 1.80662, 0.6431373, 0, 1, 1,
0.728798, -1.005938, 1.906592, 0.6509804, 0, 1, 1,
0.7324097, -0.745605, 3.341095, 0.654902, 0, 1, 1,
0.7339836, -0.1391046, 1.88089, 0.6627451, 0, 1, 1,
0.7354571, 2.321853, -0.6289476, 0.6666667, 0, 1, 1,
0.7382601, -0.2580053, 2.897596, 0.6745098, 0, 1, 1,
0.7443044, -0.663719, 0.8526027, 0.6784314, 0, 1, 1,
0.74503, 0.9014515, 1.503707, 0.6862745, 0, 1, 1,
0.7483074, 0.03687092, 1.441028, 0.6901961, 0, 1, 1,
0.7484145, 0.101148, 0.002576934, 0.6980392, 0, 1, 1,
0.7493151, 0.07537739, 0.496375, 0.7058824, 0, 1, 1,
0.751082, -0.619185, 3.52273, 0.7098039, 0, 1, 1,
0.7514287, -0.7335536, 2.459428, 0.7176471, 0, 1, 1,
0.7545959, 0.5312314, 0.02943728, 0.7215686, 0, 1, 1,
0.7568201, -1.368518, 3.52169, 0.7294118, 0, 1, 1,
0.7589287, 0.2655776, 2.002308, 0.7333333, 0, 1, 1,
0.7632009, 0.9873084, 0.3987876, 0.7411765, 0, 1, 1,
0.7712796, 0.1076614, -0.2501561, 0.7450981, 0, 1, 1,
0.7770157, -0.6846354, 2.067934, 0.7529412, 0, 1, 1,
0.7774227, -0.2479617, 0.5006523, 0.7568628, 0, 1, 1,
0.778294, 0.7047589, 1.445162, 0.7647059, 0, 1, 1,
0.7798614, 1.089402, -1.118157, 0.7686275, 0, 1, 1,
0.7833041, 0.08885448, 1.655663, 0.7764706, 0, 1, 1,
0.7893496, 0.08382376, 0.9022603, 0.7803922, 0, 1, 1,
0.7940652, 0.5806228, 0.1138951, 0.7882353, 0, 1, 1,
0.7945318, 1.283111, 0.1109422, 0.7921569, 0, 1, 1,
0.7952867, -0.514373, 2.429533, 0.8, 0, 1, 1,
0.7983372, -0.06839141, 2.981755, 0.8078431, 0, 1, 1,
0.8003333, -0.7293586, 1.429529, 0.8117647, 0, 1, 1,
0.8026315, 1.844007, 0.5273492, 0.8196079, 0, 1, 1,
0.8061802, 0.5110821, 1.050645, 0.8235294, 0, 1, 1,
0.820794, -1.144125, 4.139508, 0.8313726, 0, 1, 1,
0.8285263, 2.203764, 0.2239559, 0.8352941, 0, 1, 1,
0.8329416, -2.133811, 1.673703, 0.8431373, 0, 1, 1,
0.8332462, 0.5732903, 0.2179479, 0.8470588, 0, 1, 1,
0.841437, 2.055126, -0.638106, 0.854902, 0, 1, 1,
0.8420606, 1.292811, 0.6784553, 0.8588235, 0, 1, 1,
0.8425004, 0.5513697, 0.2026715, 0.8666667, 0, 1, 1,
0.843648, 0.2448031, 2.74575, 0.8705882, 0, 1, 1,
0.8459129, 1.871698, 0.8709705, 0.8784314, 0, 1, 1,
0.8470898, -0.639903, 2.0347, 0.8823529, 0, 1, 1,
0.8475615, -0.4200693, 0.7513502, 0.8901961, 0, 1, 1,
0.8620808, 0.6207694, -0.5670438, 0.8941177, 0, 1, 1,
0.8656617, -0.7541526, 3.683345, 0.9019608, 0, 1, 1,
0.8680177, -0.2313662, 1.08425, 0.9098039, 0, 1, 1,
0.8772765, 1.021278, -0.0388725, 0.9137255, 0, 1, 1,
0.8805685, -0.9828464, -0.2037186, 0.9215686, 0, 1, 1,
0.8831936, -1.549198, 2.007987, 0.9254902, 0, 1, 1,
0.8866419, -0.3095806, 0.9742814, 0.9333333, 0, 1, 1,
0.8878617, -1.584237, 1.094779, 0.9372549, 0, 1, 1,
0.8915225, -0.2402548, 1.485899, 0.945098, 0, 1, 1,
0.8922745, -1.121833, 2.114943, 0.9490196, 0, 1, 1,
0.9025243, 0.4250575, 1.765837, 0.9568627, 0, 1, 1,
0.9135726, -0.6723488, 0.2876343, 0.9607843, 0, 1, 1,
0.9280633, 0.3463427, 0.7686338, 0.9686275, 0, 1, 1,
0.9299221, -2.456291, 1.493508, 0.972549, 0, 1, 1,
0.9317467, 1.532744, -0.6180702, 0.9803922, 0, 1, 1,
0.9397509, 3.120534, -0.3485644, 0.9843137, 0, 1, 1,
0.9429728, -1.585833, -0.3378169, 0.9921569, 0, 1, 1,
0.9443465, 0.6764753, 2.099247, 0.9960784, 0, 1, 1,
0.9486126, 0.5352038, -0.2302577, 1, 0, 0.9960784, 1,
0.9492255, -0.7304925, 1.872093, 1, 0, 0.9882353, 1,
0.9641283, -0.06315745, 2.061229, 1, 0, 0.9843137, 1,
0.9784827, -1.390122, 3.245179, 1, 0, 0.9764706, 1,
0.9849705, 0.06346191, 1.868705, 1, 0, 0.972549, 1,
0.9856446, 0.2556481, 0.8210332, 1, 0, 0.9647059, 1,
0.9979208, -0.695085, 1.284642, 1, 0, 0.9607843, 1,
1.000111, -2.098287, 1.92417, 1, 0, 0.9529412, 1,
1.008522, -0.5159294, 0.9327793, 1, 0, 0.9490196, 1,
1.009207, 0.6107487, 0.431792, 1, 0, 0.9411765, 1,
1.010342, -0.2263971, 2.276811, 1, 0, 0.9372549, 1,
1.012074, 0.6685194, -0.1442063, 1, 0, 0.9294118, 1,
1.01318, -0.9173158, 1.625767, 1, 0, 0.9254902, 1,
1.016218, -0.6242315, 2.27805, 1, 0, 0.9176471, 1,
1.019929, 0.9940477, -0.7842495, 1, 0, 0.9137255, 1,
1.024433, -0.972242, 1.431315, 1, 0, 0.9058824, 1,
1.026893, 0.91817, 1.629335, 1, 0, 0.9019608, 1,
1.027782, -1.898642, 1.932253, 1, 0, 0.8941177, 1,
1.03058, -1.416918, 2.497027, 1, 0, 0.8862745, 1,
1.0327, 0.4669656, 0.1268471, 1, 0, 0.8823529, 1,
1.039231, -0.04174279, 3.030056, 1, 0, 0.8745098, 1,
1.060223, 0.7428668, 1.028901, 1, 0, 0.8705882, 1,
1.06792, 1.213921, 1.361073, 1, 0, 0.8627451, 1,
1.070306, 1.897351, 0.4826054, 1, 0, 0.8588235, 1,
1.086866, 0.6402843, 1.539479, 1, 0, 0.8509804, 1,
1.089656, 0.6145127, 1.327265, 1, 0, 0.8470588, 1,
1.095174, -0.4097643, 2.184384, 1, 0, 0.8392157, 1,
1.104397, -1.931732, 3.760918, 1, 0, 0.8352941, 1,
1.106854, 0.1030638, 1.639958, 1, 0, 0.827451, 1,
1.115569, -0.6285065, 2.864422, 1, 0, 0.8235294, 1,
1.119616, -1.710768, 1.524672, 1, 0, 0.8156863, 1,
1.120537, 0.3150342, 1.15892, 1, 0, 0.8117647, 1,
1.125025, -2.339654, 3.157258, 1, 0, 0.8039216, 1,
1.13237, 0.9412013, 1.956499, 1, 0, 0.7960784, 1,
1.134226, -1.434465, 1.555778, 1, 0, 0.7921569, 1,
1.136449, -0.3206886, 3.194647, 1, 0, 0.7843137, 1,
1.139718, 0.7064102, 0.06509753, 1, 0, 0.7803922, 1,
1.147506, 0.1515221, 1.248355, 1, 0, 0.772549, 1,
1.150411, 0.7486097, 2.050586, 1, 0, 0.7686275, 1,
1.152064, 1.370115, 1.212649, 1, 0, 0.7607843, 1,
1.154582, -0.05534175, 1.32371, 1, 0, 0.7568628, 1,
1.16313, -1.513721, 0.8679869, 1, 0, 0.7490196, 1,
1.165393, 2.964143, 1.477334, 1, 0, 0.7450981, 1,
1.168401, -0.3885303, 2.475791, 1, 0, 0.7372549, 1,
1.168702, 0.7050686, 0.8968763, 1, 0, 0.7333333, 1,
1.191411, 0.8747973, 2.692802, 1, 0, 0.7254902, 1,
1.192061, -0.5858001, 2.680826, 1, 0, 0.7215686, 1,
1.193699, -1.078549, 1.627871, 1, 0, 0.7137255, 1,
1.208704, -0.3974414, 1.863884, 1, 0, 0.7098039, 1,
1.209135, 0.1742852, -0.4455549, 1, 0, 0.7019608, 1,
1.216332, -1.18118, 2.965155, 1, 0, 0.6941177, 1,
1.217749, 0.0681361, 1.89177, 1, 0, 0.6901961, 1,
1.226115, 0.6277378, 0.8666548, 1, 0, 0.682353, 1,
1.22628, -2.658645, 0.6575847, 1, 0, 0.6784314, 1,
1.227493, -2.707556, 2.624259, 1, 0, 0.6705883, 1,
1.249401, -1.719068, 3.432305, 1, 0, 0.6666667, 1,
1.258896, -2.091488, 3.400297, 1, 0, 0.6588235, 1,
1.261131, -0.6847155, 0.207353, 1, 0, 0.654902, 1,
1.262295, 0.1869238, 2.090204, 1, 0, 0.6470588, 1,
1.27014, -1.114668, 3.114836, 1, 0, 0.6431373, 1,
1.271816, -1.42134, 2.216789, 1, 0, 0.6352941, 1,
1.293897, 0.8168027, 0.3202634, 1, 0, 0.6313726, 1,
1.295084, -0.4540522, 4.218674, 1, 0, 0.6235294, 1,
1.296724, -0.3557838, 1.427026, 1, 0, 0.6196079, 1,
1.301119, 0.08820078, 1.782575, 1, 0, 0.6117647, 1,
1.317981, -1.305342, 2.280647, 1, 0, 0.6078432, 1,
1.324283, 0.480882, 1.076777, 1, 0, 0.6, 1,
1.326577, 0.9661782, 1.24949, 1, 0, 0.5921569, 1,
1.327962, 0.8889189, 1.587486, 1, 0, 0.5882353, 1,
1.328786, -0.6153477, 0.9468837, 1, 0, 0.5803922, 1,
1.337718, -1.073101, 1.216668, 1, 0, 0.5764706, 1,
1.341058, -0.2362951, 0.3451082, 1, 0, 0.5686275, 1,
1.349667, -1.430163, 2.648141, 1, 0, 0.5647059, 1,
1.349921, -1.026685, 1.698847, 1, 0, 0.5568628, 1,
1.358084, -0.4754084, 1.173592, 1, 0, 0.5529412, 1,
1.364168, 0.01215969, 0.553077, 1, 0, 0.5450981, 1,
1.365713, 0.2166877, -0.1212909, 1, 0, 0.5411765, 1,
1.369118, -0.8593568, 2.552754, 1, 0, 0.5333334, 1,
1.372615, -1.079102, 3.046776, 1, 0, 0.5294118, 1,
1.375469, 0.9066416, -0.1595262, 1, 0, 0.5215687, 1,
1.376344, -0.2323067, 2.44426, 1, 0, 0.5176471, 1,
1.389288, 1.62622, 2.6521, 1, 0, 0.509804, 1,
1.401567, -1.538925, 2.754577, 1, 0, 0.5058824, 1,
1.409845, -0.1229368, 1.047847, 1, 0, 0.4980392, 1,
1.445264, -0.3742253, 1.575198, 1, 0, 0.4901961, 1,
1.44865, -0.9842585, 1.125648, 1, 0, 0.4862745, 1,
1.466833, 0.952304, 0.2853072, 1, 0, 0.4784314, 1,
1.471855, -3.236218, 4.581481, 1, 0, 0.4745098, 1,
1.477741, -0.5119267, 3.608508, 1, 0, 0.4666667, 1,
1.48508, 0.9169185, 0.1158256, 1, 0, 0.4627451, 1,
1.485373, 0.9204711, 1.328085, 1, 0, 0.454902, 1,
1.490087, 0.9185176, 0.8245224, 1, 0, 0.4509804, 1,
1.493877, -0.0727051, 2.235646, 1, 0, 0.4431373, 1,
1.494842, 0.7626398, 1.518736, 1, 0, 0.4392157, 1,
1.498044, -1.509027, 2.144957, 1, 0, 0.4313726, 1,
1.506168, -1.540473, 1.68972, 1, 0, 0.427451, 1,
1.513384, 0.3848455, 0.9746363, 1, 0, 0.4196078, 1,
1.514325, 0.7428054, 0.3547181, 1, 0, 0.4156863, 1,
1.517919, 1.408956, -0.4216781, 1, 0, 0.4078431, 1,
1.518138, 0.169629, 1.616915, 1, 0, 0.4039216, 1,
1.522188, 1.101139, 2.387078, 1, 0, 0.3960784, 1,
1.524003, 0.1820134, 0.8475967, 1, 0, 0.3882353, 1,
1.526234, 1.3685, 2.951485, 1, 0, 0.3843137, 1,
1.538013, -0.3921391, -0.8109196, 1, 0, 0.3764706, 1,
1.546465, 0.5653519, 0.5151768, 1, 0, 0.372549, 1,
1.548075, -1.384282, 3.016283, 1, 0, 0.3647059, 1,
1.560135, 0.27838, 2.736568, 1, 0, 0.3607843, 1,
1.58503, 0.1066607, -1.267915, 1, 0, 0.3529412, 1,
1.586081, 1.455753, -1.314834, 1, 0, 0.3490196, 1,
1.598798, 0.9029313, 0.706953, 1, 0, 0.3411765, 1,
1.600079, -1.587697, 0.5603525, 1, 0, 0.3372549, 1,
1.600669, -0.3926193, 2.824043, 1, 0, 0.3294118, 1,
1.612107, 0.515467, 1.324139, 1, 0, 0.3254902, 1,
1.616569, -1.546914, 2.689912, 1, 0, 0.3176471, 1,
1.620075, -0.5623254, 2.636856, 1, 0, 0.3137255, 1,
1.631223, -1.477806, 3.088249, 1, 0, 0.3058824, 1,
1.653083, 0.6306887, 1.762763, 1, 0, 0.2980392, 1,
1.679279, -0.8135177, 1.400554, 1, 0, 0.2941177, 1,
1.699169, 0.858692, 0.3517511, 1, 0, 0.2862745, 1,
1.737221, 1.080347, 1.033977, 1, 0, 0.282353, 1,
1.768446, -1.085675, 2.603827, 1, 0, 0.2745098, 1,
1.775027, -0.6239732, 2.321894, 1, 0, 0.2705882, 1,
1.805642, 1.595516, 0.693083, 1, 0, 0.2627451, 1,
1.837105, -0.218785, 1.71798, 1, 0, 0.2588235, 1,
1.844775, -0.9952853, 2.690634, 1, 0, 0.2509804, 1,
1.845718, 1.160103, 0.613196, 1, 0, 0.2470588, 1,
1.879247, 1.2887, 1.733385, 1, 0, 0.2392157, 1,
1.882036, 0.0545431, 1.576596, 1, 0, 0.2352941, 1,
1.906956, 1.055083, 0.2604285, 1, 0, 0.227451, 1,
1.924582, -0.09136131, 1.261463, 1, 0, 0.2235294, 1,
1.928834, 2.225378, 2.968775, 1, 0, 0.2156863, 1,
1.952304, 0.00920302, 1.121475, 1, 0, 0.2117647, 1,
1.974767, 1.251272, 1.858588, 1, 0, 0.2039216, 1,
1.99478, -0.8791887, 2.574758, 1, 0, 0.1960784, 1,
2.027674, -0.2543862, 2.080597, 1, 0, 0.1921569, 1,
2.063691, -0.06848815, 2.148005, 1, 0, 0.1843137, 1,
2.079934, 1.178095, 2.837256, 1, 0, 0.1803922, 1,
2.086307, -0.5760658, 1.791053, 1, 0, 0.172549, 1,
2.100068, -0.07346162, 1.196592, 1, 0, 0.1686275, 1,
2.135532, 0.08657992, 1.61075, 1, 0, 0.1607843, 1,
2.153379, -0.7032076, 1.484884, 1, 0, 0.1568628, 1,
2.153551, 0.6162198, 0.5342678, 1, 0, 0.1490196, 1,
2.170703, -0.1639374, 1.609202, 1, 0, 0.145098, 1,
2.173905, 0.1220714, 0.6894295, 1, 0, 0.1372549, 1,
2.183926, -0.03443791, 1.95074, 1, 0, 0.1333333, 1,
2.18855, -0.944267, 1.640195, 1, 0, 0.1254902, 1,
2.203779, -0.3186868, 4.063432, 1, 0, 0.1215686, 1,
2.205743, 0.8376485, 1.366431, 1, 0, 0.1137255, 1,
2.212761, 0.04952943, 1.653362, 1, 0, 0.1098039, 1,
2.279799, 0.1002852, 0.9672347, 1, 0, 0.1019608, 1,
2.282251, 0.1324531, 2.289114, 1, 0, 0.09411765, 1,
2.303381, 1.794392, 2.076578, 1, 0, 0.09019608, 1,
2.355691, -0.5654899, 1.33211, 1, 0, 0.08235294, 1,
2.389275, 0.8384718, 1.07109, 1, 0, 0.07843138, 1,
2.394751, -0.7739415, 1.030024, 1, 0, 0.07058824, 1,
2.501473, 0.9193294, 1.35615, 1, 0, 0.06666667, 1,
2.510735, 1.08926, 1.306201, 1, 0, 0.05882353, 1,
2.535847, 0.6658999, 0.7709771, 1, 0, 0.05490196, 1,
2.599094, -0.2418713, -0.6047992, 1, 0, 0.04705882, 1,
2.652474, -0.04798371, 3.095609, 1, 0, 0.04313726, 1,
2.692842, -1.556009, 2.307657, 1, 0, 0.03529412, 1,
2.75838, -0.8960154, 2.295266, 1, 0, 0.03137255, 1,
2.782916, -2.930645, 2.368813, 1, 0, 0.02352941, 1,
2.957355, -1.406064, 0.7795308, 1, 0, 0.01960784, 1,
3.196881, -1.085612, 2.309849, 1, 0, 0.01176471, 1,
3.252668, -0.6419749, 0.5604444, 1, 0, 0.007843138, 1
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
0.05250454, -4.313687, -6.892218, 0, -0.5, 0.5, 0.5,
0.05250454, -4.313687, -6.892218, 1, -0.5, 0.5, 0.5,
0.05250454, -4.313687, -6.892218, 1, 1.5, 0.5, 0.5,
0.05250454, -4.313687, -6.892218, 0, 1.5, 0.5, 0.5
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
-4.232514, -0.05784202, -6.892218, 0, -0.5, 0.5, 0.5,
-4.232514, -0.05784202, -6.892218, 1, -0.5, 0.5, 0.5,
-4.232514, -0.05784202, -6.892218, 1, 1.5, 0.5, 0.5,
-4.232514, -0.05784202, -6.892218, 0, 1.5, 0.5, 0.5
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
-4.232514, -4.313687, 0.02233672, 0, -0.5, 0.5, 0.5,
-4.232514, -4.313687, 0.02233672, 1, -0.5, 0.5, 0.5,
-4.232514, -4.313687, 0.02233672, 1, 1.5, 0.5, 0.5,
-4.232514, -4.313687, 0.02233672, 0, 1.5, 0.5, 0.5
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
-3, -3.331569, -5.296552,
3, -3.331569, -5.296552,
-3, -3.331569, -5.296552,
-3, -3.495256, -5.562496,
-2, -3.331569, -5.296552,
-2, -3.495256, -5.562496,
-1, -3.331569, -5.296552,
-1, -3.495256, -5.562496,
0, -3.331569, -5.296552,
0, -3.495256, -5.562496,
1, -3.331569, -5.296552,
1, -3.495256, -5.562496,
2, -3.331569, -5.296552,
2, -3.495256, -5.562496,
3, -3.331569, -5.296552,
3, -3.495256, -5.562496
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
-3, -3.822628, -6.094385, 0, -0.5, 0.5, 0.5,
-3, -3.822628, -6.094385, 1, -0.5, 0.5, 0.5,
-3, -3.822628, -6.094385, 1, 1.5, 0.5, 0.5,
-3, -3.822628, -6.094385, 0, 1.5, 0.5, 0.5,
-2, -3.822628, -6.094385, 0, -0.5, 0.5, 0.5,
-2, -3.822628, -6.094385, 1, -0.5, 0.5, 0.5,
-2, -3.822628, -6.094385, 1, 1.5, 0.5, 0.5,
-2, -3.822628, -6.094385, 0, 1.5, 0.5, 0.5,
-1, -3.822628, -6.094385, 0, -0.5, 0.5, 0.5,
-1, -3.822628, -6.094385, 1, -0.5, 0.5, 0.5,
-1, -3.822628, -6.094385, 1, 1.5, 0.5, 0.5,
-1, -3.822628, -6.094385, 0, 1.5, 0.5, 0.5,
0, -3.822628, -6.094385, 0, -0.5, 0.5, 0.5,
0, -3.822628, -6.094385, 1, -0.5, 0.5, 0.5,
0, -3.822628, -6.094385, 1, 1.5, 0.5, 0.5,
0, -3.822628, -6.094385, 0, 1.5, 0.5, 0.5,
1, -3.822628, -6.094385, 0, -0.5, 0.5, 0.5,
1, -3.822628, -6.094385, 1, -0.5, 0.5, 0.5,
1, -3.822628, -6.094385, 1, 1.5, 0.5, 0.5,
1, -3.822628, -6.094385, 0, 1.5, 0.5, 0.5,
2, -3.822628, -6.094385, 0, -0.5, 0.5, 0.5,
2, -3.822628, -6.094385, 1, -0.5, 0.5, 0.5,
2, -3.822628, -6.094385, 1, 1.5, 0.5, 0.5,
2, -3.822628, -6.094385, 0, 1.5, 0.5, 0.5,
3, -3.822628, -6.094385, 0, -0.5, 0.5, 0.5,
3, -3.822628, -6.094385, 1, -0.5, 0.5, 0.5,
3, -3.822628, -6.094385, 1, 1.5, 0.5, 0.5,
3, -3.822628, -6.094385, 0, 1.5, 0.5, 0.5
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
-3.243664, -3, -5.296552,
-3.243664, 3, -5.296552,
-3.243664, -3, -5.296552,
-3.408472, -3, -5.562496,
-3.243664, -2, -5.296552,
-3.408472, -2, -5.562496,
-3.243664, -1, -5.296552,
-3.408472, -1, -5.562496,
-3.243664, 0, -5.296552,
-3.408472, 0, -5.562496,
-3.243664, 1, -5.296552,
-3.408472, 1, -5.562496,
-3.243664, 2, -5.296552,
-3.408472, 2, -5.562496,
-3.243664, 3, -5.296552,
-3.408472, 3, -5.562496
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
-3.738089, -3, -6.094385, 0, -0.5, 0.5, 0.5,
-3.738089, -3, -6.094385, 1, -0.5, 0.5, 0.5,
-3.738089, -3, -6.094385, 1, 1.5, 0.5, 0.5,
-3.738089, -3, -6.094385, 0, 1.5, 0.5, 0.5,
-3.738089, -2, -6.094385, 0, -0.5, 0.5, 0.5,
-3.738089, -2, -6.094385, 1, -0.5, 0.5, 0.5,
-3.738089, -2, -6.094385, 1, 1.5, 0.5, 0.5,
-3.738089, -2, -6.094385, 0, 1.5, 0.5, 0.5,
-3.738089, -1, -6.094385, 0, -0.5, 0.5, 0.5,
-3.738089, -1, -6.094385, 1, -0.5, 0.5, 0.5,
-3.738089, -1, -6.094385, 1, 1.5, 0.5, 0.5,
-3.738089, -1, -6.094385, 0, 1.5, 0.5, 0.5,
-3.738089, 0, -6.094385, 0, -0.5, 0.5, 0.5,
-3.738089, 0, -6.094385, 1, -0.5, 0.5, 0.5,
-3.738089, 0, -6.094385, 1, 1.5, 0.5, 0.5,
-3.738089, 0, -6.094385, 0, 1.5, 0.5, 0.5,
-3.738089, 1, -6.094385, 0, -0.5, 0.5, 0.5,
-3.738089, 1, -6.094385, 1, -0.5, 0.5, 0.5,
-3.738089, 1, -6.094385, 1, 1.5, 0.5, 0.5,
-3.738089, 1, -6.094385, 0, 1.5, 0.5, 0.5,
-3.738089, 2, -6.094385, 0, -0.5, 0.5, 0.5,
-3.738089, 2, -6.094385, 1, -0.5, 0.5, 0.5,
-3.738089, 2, -6.094385, 1, 1.5, 0.5, 0.5,
-3.738089, 2, -6.094385, 0, 1.5, 0.5, 0.5,
-3.738089, 3, -6.094385, 0, -0.5, 0.5, 0.5,
-3.738089, 3, -6.094385, 1, -0.5, 0.5, 0.5,
-3.738089, 3, -6.094385, 1, 1.5, 0.5, 0.5,
-3.738089, 3, -6.094385, 0, 1.5, 0.5, 0.5
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
-3.243664, -3.331569, -4,
-3.243664, -3.331569, 4,
-3.243664, -3.331569, -4,
-3.408472, -3.495256, -4,
-3.243664, -3.331569, -2,
-3.408472, -3.495256, -2,
-3.243664, -3.331569, 0,
-3.408472, -3.495256, 0,
-3.243664, -3.331569, 2,
-3.408472, -3.495256, 2,
-3.243664, -3.331569, 4,
-3.408472, -3.495256, 4
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
-3.738089, -3.822628, -4, 0, -0.5, 0.5, 0.5,
-3.738089, -3.822628, -4, 1, -0.5, 0.5, 0.5,
-3.738089, -3.822628, -4, 1, 1.5, 0.5, 0.5,
-3.738089, -3.822628, -4, 0, 1.5, 0.5, 0.5,
-3.738089, -3.822628, -2, 0, -0.5, 0.5, 0.5,
-3.738089, -3.822628, -2, 1, -0.5, 0.5, 0.5,
-3.738089, -3.822628, -2, 1, 1.5, 0.5, 0.5,
-3.738089, -3.822628, -2, 0, 1.5, 0.5, 0.5,
-3.738089, -3.822628, 0, 0, -0.5, 0.5, 0.5,
-3.738089, -3.822628, 0, 1, -0.5, 0.5, 0.5,
-3.738089, -3.822628, 0, 1, 1.5, 0.5, 0.5,
-3.738089, -3.822628, 0, 0, 1.5, 0.5, 0.5,
-3.738089, -3.822628, 2, 0, -0.5, 0.5, 0.5,
-3.738089, -3.822628, 2, 1, -0.5, 0.5, 0.5,
-3.738089, -3.822628, 2, 1, 1.5, 0.5, 0.5,
-3.738089, -3.822628, 2, 0, 1.5, 0.5, 0.5,
-3.738089, -3.822628, 4, 0, -0.5, 0.5, 0.5,
-3.738089, -3.822628, 4, 1, -0.5, 0.5, 0.5,
-3.738089, -3.822628, 4, 1, 1.5, 0.5, 0.5,
-3.738089, -3.822628, 4, 0, 1.5, 0.5, 0.5
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
-3.243664, -3.331569, -5.296552,
-3.243664, 3.215885, -5.296552,
-3.243664, -3.331569, 5.341225,
-3.243664, 3.215885, 5.341225,
-3.243664, -3.331569, -5.296552,
-3.243664, -3.331569, 5.341225,
-3.243664, 3.215885, -5.296552,
-3.243664, 3.215885, 5.341225,
-3.243664, -3.331569, -5.296552,
3.348673, -3.331569, -5.296552,
-3.243664, -3.331569, 5.341225,
3.348673, -3.331569, 5.341225,
-3.243664, 3.215885, -5.296552,
3.348673, 3.215885, -5.296552,
-3.243664, 3.215885, 5.341225,
3.348673, 3.215885, 5.341225,
3.348673, -3.331569, -5.296552,
3.348673, 3.215885, -5.296552,
3.348673, -3.331569, 5.341225,
3.348673, 3.215885, 5.341225,
3.348673, -3.331569, -5.296552,
3.348673, -3.331569, 5.341225,
3.348673, 3.215885, -5.296552,
3.348673, 3.215885, 5.341225
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
var radius = 7.541998;
var distance = 33.5552;
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
mvMatrix.translate( -0.05250454, 0.05784202, -0.02233672 );
mvMatrix.scale( 1.236975, 1.245454, 0.7665658 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.5552);
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
thiobencarb<-read.table("thiobencarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiobencarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
```

```r
y<-thiobencarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
```

```r
z<-thiobencarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
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
-3.147659, 2.071378, -1.161986, 0, 0, 1, 1, 1,
-2.580271, -1.469352, -0.1015534, 1, 0, 0, 1, 1,
-2.484174, -0.4463282, -1.288091, 1, 0, 0, 1, 1,
-2.429596, 0.6222811, -2.912709, 1, 0, 0, 1, 1,
-2.409627, -0.3379273, -2.334677, 1, 0, 0, 1, 1,
-2.409096, 1.080621, -1.646548, 1, 0, 0, 1, 1,
-2.378405, 0.2298516, -1.301246, 0, 0, 0, 1, 1,
-2.312605, 0.4304205, -1.939013, 0, 0, 0, 1, 1,
-2.311299, -0.1688913, -2.052308, 0, 0, 0, 1, 1,
-2.311048, 0.6201461, -1.351777, 0, 0, 0, 1, 1,
-2.284528, -1.592007, -1.1086, 0, 0, 0, 1, 1,
-2.282148, 0.04758681, -0.7077922, 0, 0, 0, 1, 1,
-2.281072, 0.1315526, -2.345039, 0, 0, 0, 1, 1,
-2.27996, 0.2356402, -0.8642792, 1, 1, 1, 1, 1,
-2.252825, -1.343564, -2.034935, 1, 1, 1, 1, 1,
-2.186522, -0.1649858, -2.477293, 1, 1, 1, 1, 1,
-2.127776, -0.2265003, -1.46878, 1, 1, 1, 1, 1,
-2.101786, -0.5254877, -2.795507, 1, 1, 1, 1, 1,
-2.092439, 2.125797, -0.002921646, 1, 1, 1, 1, 1,
-2.089525, 1.586083, -1.550869, 1, 1, 1, 1, 1,
-2.087872, -0.470237, -4.13536, 1, 1, 1, 1, 1,
-2.076503, -1.190328, -1.151951, 1, 1, 1, 1, 1,
-2.071129, 1.348015, -0.8589092, 1, 1, 1, 1, 1,
-2.044342, -0.1438688, -1.749194, 1, 1, 1, 1, 1,
-2.033226, 0.6862783, -0.3287801, 1, 1, 1, 1, 1,
-1.993667, -0.2502894, -0.913339, 1, 1, 1, 1, 1,
-1.977219, 2.13551, -1.538635, 1, 1, 1, 1, 1,
-1.960642, 0.7326162, -0.2782587, 1, 1, 1, 1, 1,
-1.958541, -0.1468279, -2.799253, 0, 0, 1, 1, 1,
-1.915734, 0.6792418, -1.860675, 1, 0, 0, 1, 1,
-1.913028, 0.6754649, -1.855844, 1, 0, 0, 1, 1,
-1.886739, 0.7444465, -1.704855, 1, 0, 0, 1, 1,
-1.880083, 0.06335776, -2.962187, 1, 0, 0, 1, 1,
-1.869966, -0.6272144, -2.523944, 1, 0, 0, 1, 1,
-1.86987, -0.5990409, -4.31103, 0, 0, 0, 1, 1,
-1.865907, 0.1737696, -3.62198, 0, 0, 0, 1, 1,
-1.838797, -0.7603277, -2.830135, 0, 0, 0, 1, 1,
-1.829417, -0.2553891, -1.524445, 0, 0, 0, 1, 1,
-1.821945, 0.4932435, 0.01001322, 0, 0, 0, 1, 1,
-1.819365, -0.9583999, -1.718801, 0, 0, 0, 1, 1,
-1.817226, 1.785882, -0.9762357, 0, 0, 0, 1, 1,
-1.804227, -1.948565, -2.420016, 1, 1, 1, 1, 1,
-1.799996, -0.559397, -2.815829, 1, 1, 1, 1, 1,
-1.78711, -0.124797, -3.323105, 1, 1, 1, 1, 1,
-1.783962, -1.082724, -0.3707435, 1, 1, 1, 1, 1,
-1.778115, 0.8136312, 1.425546, 1, 1, 1, 1, 1,
-1.771009, -0.6398942, -2.01351, 1, 1, 1, 1, 1,
-1.762437, -0.7496395, -1.827786, 1, 1, 1, 1, 1,
-1.751114, -1.377569, -2.420222, 1, 1, 1, 1, 1,
-1.745463, 3.103955, -0.4179331, 1, 1, 1, 1, 1,
-1.743158, -0.1207546, -3.057167, 1, 1, 1, 1, 1,
-1.688575, 0.4839983, -1.582139, 1, 1, 1, 1, 1,
-1.676364, 0.706609, -0.3778753, 1, 1, 1, 1, 1,
-1.667403, 0.3792889, -1.01649, 1, 1, 1, 1, 1,
-1.655524, 1.58429, -0.812831, 1, 1, 1, 1, 1,
-1.653937, 2.352423, -0.2897132, 1, 1, 1, 1, 1,
-1.646448, -1.631677, -3.322713, 0, 0, 1, 1, 1,
-1.644215, 0.2752698, -1.177351, 1, 0, 0, 1, 1,
-1.634961, -0.6071877, -2.156927, 1, 0, 0, 1, 1,
-1.633225, 0.7804259, 0.7810724, 1, 0, 0, 1, 1,
-1.612673, -1.291345, -3.520077, 1, 0, 0, 1, 1,
-1.596771, -0.6249976, -2.381215, 1, 0, 0, 1, 1,
-1.592141, 0.04788479, -1.133689, 0, 0, 0, 1, 1,
-1.588211, -0.4198852, -0.8905814, 0, 0, 0, 1, 1,
-1.578748, -1.879414, -3.78694, 0, 0, 0, 1, 1,
-1.567646, -0.6028637, -1.990071, 0, 0, 0, 1, 1,
-1.566592, 1.25104, -0.4041606, 0, 0, 0, 1, 1,
-1.557622, -0.2540815, -2.59555, 0, 0, 0, 1, 1,
-1.550261, 0.2589357, -4.353307, 0, 0, 0, 1, 1,
-1.549482, 1.652527, -1.305615, 1, 1, 1, 1, 1,
-1.543589, -0.08369653, -0.1228598, 1, 1, 1, 1, 1,
-1.542797, 1.029387, -1.550748, 1, 1, 1, 1, 1,
-1.522587, -0.02778787, -1.64958, 1, 1, 1, 1, 1,
-1.514851, -1.748811, -2.990779, 1, 1, 1, 1, 1,
-1.514523, 0.6696604, -1.460901, 1, 1, 1, 1, 1,
-1.513744, 0.4659047, 0.5864549, 1, 1, 1, 1, 1,
-1.503855, -0.1516517, -2.093987, 1, 1, 1, 1, 1,
-1.497977, 0.06689817, -1.388776, 1, 1, 1, 1, 1,
-1.492476, -0.9707502, -1.662734, 1, 1, 1, 1, 1,
-1.484003, -0.9690233, -2.368013, 1, 1, 1, 1, 1,
-1.483429, -0.5733744, -3.978226, 1, 1, 1, 1, 1,
-1.479974, -0.3852361, -3.147891, 1, 1, 1, 1, 1,
-1.476964, 1.035161, -1.029181, 1, 1, 1, 1, 1,
-1.472942, 0.08029698, -0.472327, 1, 1, 1, 1, 1,
-1.46779, 0.7288951, 1.567995, 0, 0, 1, 1, 1,
-1.467173, 0.1817429, -2.987773, 1, 0, 0, 1, 1,
-1.443781, -0.9675645, -2.312763, 1, 0, 0, 1, 1,
-1.422396, -1.043565, -1.653313, 1, 0, 0, 1, 1,
-1.421555, 0.5111178, -0.4858293, 1, 0, 0, 1, 1,
-1.40528, -0.8003701, -2.230236, 1, 0, 0, 1, 1,
-1.402427, 2.175179, 0.1108382, 0, 0, 0, 1, 1,
-1.401792, 0.5857718, -2.482579, 0, 0, 0, 1, 1,
-1.392823, -1.526222, -2.861035, 0, 0, 0, 1, 1,
-1.391111, -0.3173367, -2.161004, 0, 0, 0, 1, 1,
-1.384236, -0.1952808, -1.292995, 0, 0, 0, 1, 1,
-1.377338, 1.399714, -1.190664, 0, 0, 0, 1, 1,
-1.367263, 0.3829986, -2.245768, 0, 0, 0, 1, 1,
-1.361855, -0.2204194, -2.878726, 1, 1, 1, 1, 1,
-1.359446, -0.7370369, -2.844947, 1, 1, 1, 1, 1,
-1.358763, -0.964994, -3.208483, 1, 1, 1, 1, 1,
-1.358544, -0.5076917, -3.710091, 1, 1, 1, 1, 1,
-1.35806, -0.4657955, -3.635848, 1, 1, 1, 1, 1,
-1.348128, 0.7639585, -2.006837, 1, 1, 1, 1, 1,
-1.347481, 0.05592992, -2.104246, 1, 1, 1, 1, 1,
-1.346885, 0.3043324, -1.06129, 1, 1, 1, 1, 1,
-1.328136, -1.122016, -1.966216, 1, 1, 1, 1, 1,
-1.327232, 0.1112821, -3.406175, 1, 1, 1, 1, 1,
-1.324957, -1.125035, -1.321938, 1, 1, 1, 1, 1,
-1.323614, -2.457741, -2.726638, 1, 1, 1, 1, 1,
-1.316815, -0.8670633, -2.576157, 1, 1, 1, 1, 1,
-1.313172, 0.5355883, -0.6366449, 1, 1, 1, 1, 1,
-1.310758, 0.2254981, -2.079423, 1, 1, 1, 1, 1,
-1.305922, 2.314336, -0.323393, 0, 0, 1, 1, 1,
-1.299986, 0.1048299, -0.4850917, 1, 0, 0, 1, 1,
-1.29158, -1.673811, -2.995722, 1, 0, 0, 1, 1,
-1.288712, 0.2476203, -0.8369305, 1, 0, 0, 1, 1,
-1.286883, 1.2354, -1.133614, 1, 0, 0, 1, 1,
-1.279378, 0.7329678, -0.4177068, 1, 0, 0, 1, 1,
-1.273937, 0.02186672, -0.5972411, 0, 0, 0, 1, 1,
-1.273213, -1.556044, -2.620147, 0, 0, 0, 1, 1,
-1.273019, -0.09127705, -0.2304216, 0, 0, 0, 1, 1,
-1.27271, -0.1992208, -1.017009, 0, 0, 0, 1, 1,
-1.259242, 1.830064, -0.3416345, 0, 0, 0, 1, 1,
-1.253055, -0.06094886, -0.3260907, 0, 0, 0, 1, 1,
-1.249627, -0.4476134, -2.844559, 0, 0, 0, 1, 1,
-1.238175, 0.6218192, -1.408684, 1, 1, 1, 1, 1,
-1.2371, -0.2427736, 0.2366085, 1, 1, 1, 1, 1,
-1.236111, -1.946187, -1.75273, 1, 1, 1, 1, 1,
-1.215053, 0.3624405, -1.187458, 1, 1, 1, 1, 1,
-1.213195, -0.09332031, -3.164733, 1, 1, 1, 1, 1,
-1.194541, -0.09337149, -1.002383, 1, 1, 1, 1, 1,
-1.174244, 1.102348, -0.8984843, 1, 1, 1, 1, 1,
-1.173891, 0.6415344, -1.710904, 1, 1, 1, 1, 1,
-1.161378, 0.380323, -0.4870135, 1, 1, 1, 1, 1,
-1.151262, 0.6151601, -1.363021, 1, 1, 1, 1, 1,
-1.147034, 0.4567752, -2.422948, 1, 1, 1, 1, 1,
-1.146327, -0.6525357, -1.122147, 1, 1, 1, 1, 1,
-1.142896, -0.6548647, -2.846473, 1, 1, 1, 1, 1,
-1.139943, 0.6144989, -0.8031114, 1, 1, 1, 1, 1,
-1.131468, 1.915481, -0.6913458, 1, 1, 1, 1, 1,
-1.12901, 1.595034, -0.05834313, 0, 0, 1, 1, 1,
-1.123189, 0.2287775, -1.761702, 1, 0, 0, 1, 1,
-1.115251, -0.3095966, -1.781038, 1, 0, 0, 1, 1,
-1.109686, -0.3850396, -2.133132, 1, 0, 0, 1, 1,
-1.107679, 1.934441, 0.9637033, 1, 0, 0, 1, 1,
-1.103512, 0.5257908, -0.1227561, 1, 0, 0, 1, 1,
-1.087437, -0.4777577, -1.468252, 0, 0, 0, 1, 1,
-1.084619, -1.751483, -1.896378, 0, 0, 0, 1, 1,
-1.081263, 0.7091383, -2.764365, 0, 0, 0, 1, 1,
-1.077603, -0.6840128, 0.09492526, 0, 0, 0, 1, 1,
-1.075865, 0.4670151, -2.460432, 0, 0, 0, 1, 1,
-1.069306, -1.090151, -2.928818, 0, 0, 0, 1, 1,
-1.067993, -0.08986839, -3.114319, 0, 0, 0, 1, 1,
-1.066363, -0.8897777, -1.731061, 1, 1, 1, 1, 1,
-1.065642, 0.2278822, -1.296017, 1, 1, 1, 1, 1,
-1.063951, -1.464183, -3.38262, 1, 1, 1, 1, 1,
-1.062541, -0.5119562, -0.6781735, 1, 1, 1, 1, 1,
-1.058259, 0.1015333, -0.4999781, 1, 1, 1, 1, 1,
-1.057104, 0.5408539, -0.1080477, 1, 1, 1, 1, 1,
-1.056428, -1.226569, -2.269572, 1, 1, 1, 1, 1,
-1.055871, -1.224943, -2.053158, 1, 1, 1, 1, 1,
-1.053461, 0.3913037, -0.8075938, 1, 1, 1, 1, 1,
-1.041448, 0.8393976, -1.631558, 1, 1, 1, 1, 1,
-1.039346, 0.5104336, -2.547092, 1, 1, 1, 1, 1,
-1.032348, -1.979181, -2.657754, 1, 1, 1, 1, 1,
-1.028263, -1.249649, -3.625199, 1, 1, 1, 1, 1,
-1.02404, -1.874918, -1.61839, 1, 1, 1, 1, 1,
-1.023166, 1.241179, 1.195876, 1, 1, 1, 1, 1,
-1.018469, -0.6286734, -1.109052, 0, 0, 1, 1, 1,
-1.017994, -2.409364, -3.768744, 1, 0, 0, 1, 1,
-1.017406, 0.6190838, -0.5025985, 1, 0, 0, 1, 1,
-1.017226, 0.9112327, 1.198537, 1, 0, 0, 1, 1,
-1.016146, 0.1061204, -0.6818309, 1, 0, 0, 1, 1,
-1.009971, 0.08892019, -0.9257805, 1, 0, 0, 1, 1,
-1.000014, -1.022152, -3.520149, 0, 0, 0, 1, 1,
-0.9976698, 0.01314288, -1.780585, 0, 0, 0, 1, 1,
-0.9972482, 1.385143, -2.089917, 0, 0, 0, 1, 1,
-0.9925517, 0.06439557, -0.9401956, 0, 0, 0, 1, 1,
-0.9916848, 1.018289, -1.64353, 0, 0, 0, 1, 1,
-0.9911137, -0.3782928, -0.5265388, 0, 0, 0, 1, 1,
-0.9883451, -0.2020391, -1.723244, 0, 0, 0, 1, 1,
-0.9867321, 0.5233828, -1.476632, 1, 1, 1, 1, 1,
-0.9773992, -1.472791, -1.65119, 1, 1, 1, 1, 1,
-0.9720337, -0.6302819, -2.830257, 1, 1, 1, 1, 1,
-0.96973, -0.6796465, -4.281265, 1, 1, 1, 1, 1,
-0.9565061, -1.115166, -3.02535, 1, 1, 1, 1, 1,
-0.9548927, 1.606695, -1.603572, 1, 1, 1, 1, 1,
-0.9520634, -0.2323026, -2.654798, 1, 1, 1, 1, 1,
-0.949406, -0.7976241, -1.529022, 1, 1, 1, 1, 1,
-0.9463812, -2.081318, -3.202742, 1, 1, 1, 1, 1,
-0.9404095, -0.6232021, -3.085934, 1, 1, 1, 1, 1,
-0.9371662, 0.409341, -0.8246694, 1, 1, 1, 1, 1,
-0.9359718, 1.971277, -2.83718, 1, 1, 1, 1, 1,
-0.9358714, 0.08342177, -1.397118, 1, 1, 1, 1, 1,
-0.9331192, -2.310097, -3.132153, 1, 1, 1, 1, 1,
-0.9279231, 0.6375003, 0.4302783, 1, 1, 1, 1, 1,
-0.9233952, 0.2589249, -1.006312, 0, 0, 1, 1, 1,
-0.9233556, 1.39041, -1.331948, 1, 0, 0, 1, 1,
-0.9146633, -2.380978, -2.868595, 1, 0, 0, 1, 1,
-0.909592, 0.3364598, -2.718957, 1, 0, 0, 1, 1,
-0.9092423, -0.07505692, -1.46295, 1, 0, 0, 1, 1,
-0.9088876, -0.1732658, -1.266433, 1, 0, 0, 1, 1,
-0.9077424, -1.007898, -3.425617, 0, 0, 0, 1, 1,
-0.9041619, 1.699982, -0.5021147, 0, 0, 0, 1, 1,
-0.9024671, -1.820408, -1.712543, 0, 0, 0, 1, 1,
-0.8991431, 1.620804, -1.713867, 0, 0, 0, 1, 1,
-0.8990711, -1.377164, -2.827868, 0, 0, 0, 1, 1,
-0.8978453, -0.5564414, -3.485581, 0, 0, 0, 1, 1,
-0.894994, -1.124342, -2.879092, 0, 0, 0, 1, 1,
-0.8935327, -0.6498388, -2.065659, 1, 1, 1, 1, 1,
-0.8932579, -0.7314425, -1.895175, 1, 1, 1, 1, 1,
-0.8879815, -1.77793, -3.163188, 1, 1, 1, 1, 1,
-0.8675272, -0.5435745, -1.202414, 1, 1, 1, 1, 1,
-0.8668312, 1.627243, 0.4506576, 1, 1, 1, 1, 1,
-0.8543973, -0.5818614, -2.395041, 1, 1, 1, 1, 1,
-0.8440701, -0.06736398, -2.537565, 1, 1, 1, 1, 1,
-0.8440021, 0.1517692, -0.9122316, 1, 1, 1, 1, 1,
-0.842059, 0.6792982, -0.2713055, 1, 1, 1, 1, 1,
-0.8409138, -1.525728, -4.205659, 1, 1, 1, 1, 1,
-0.8405854, -0.9300203, -2.77915, 1, 1, 1, 1, 1,
-0.84052, -1.45103, -0.2937233, 1, 1, 1, 1, 1,
-0.8350261, 0.9682751, -0.3897555, 1, 1, 1, 1, 1,
-0.8289359, -0.1968106, -0.8984188, 1, 1, 1, 1, 1,
-0.8278722, 0.1867806, -1.573598, 1, 1, 1, 1, 1,
-0.8263739, 1.321711, 0.08291113, 0, 0, 1, 1, 1,
-0.817386, 0.2436444, -2.933454, 1, 0, 0, 1, 1,
-0.815578, 0.9923717, -1.682792, 1, 0, 0, 1, 1,
-0.8151803, -0.2323694, -1.44224, 1, 0, 0, 1, 1,
-0.8128871, -0.6045351, -2.4776, 1, 0, 0, 1, 1,
-0.8124039, -0.4416132, -2.750872, 1, 0, 0, 1, 1,
-0.8071293, 1.253496, 0.2376509, 0, 0, 0, 1, 1,
-0.8014821, 1.31743, -0.6550987, 0, 0, 0, 1, 1,
-0.7936625, 0.1779992, -1.342051, 0, 0, 0, 1, 1,
-0.7914812, -0.244289, -2.550247, 0, 0, 0, 1, 1,
-0.7900218, -0.01921708, -2.234237, 0, 0, 0, 1, 1,
-0.7879482, 0.6984432, -2.323812, 0, 0, 0, 1, 1,
-0.7870997, 0.457059, -0.1993387, 0, 0, 0, 1, 1,
-0.7868304, -1.29057, -2.796888, 1, 1, 1, 1, 1,
-0.7856332, -0.2400614, -2.078606, 1, 1, 1, 1, 1,
-0.783518, -0.289086, -2.293815, 1, 1, 1, 1, 1,
-0.7812545, -0.2864487, -2.083729, 1, 1, 1, 1, 1,
-0.7639779, 1.058358, -0.4594043, 1, 1, 1, 1, 1,
-0.7603006, -0.6985089, -1.981205, 1, 1, 1, 1, 1,
-0.7592292, 0.6896861, -1.884332, 1, 1, 1, 1, 1,
-0.7583136, 0.6786941, -0.02378087, 1, 1, 1, 1, 1,
-0.7547716, -0.3050329, -0.2312713, 1, 1, 1, 1, 1,
-0.7469088, -1.043378, -1.352883, 1, 1, 1, 1, 1,
-0.7459781, -1.502881, -2.58491, 1, 1, 1, 1, 1,
-0.74502, 0.1145928, -1.772985, 1, 1, 1, 1, 1,
-0.7446018, 0.3518209, 0.3047926, 1, 1, 1, 1, 1,
-0.7445123, 1.129283, -1.754515, 1, 1, 1, 1, 1,
-0.7416487, -0.6664495, -1.931295, 1, 1, 1, 1, 1,
-0.7413333, -1.476251, -2.237665, 0, 0, 1, 1, 1,
-0.7368392, 0.6962695, -1.404548, 1, 0, 0, 1, 1,
-0.7310991, 1.602102, 1.064137, 1, 0, 0, 1, 1,
-0.72188, -0.6460975, -1.963342, 1, 0, 0, 1, 1,
-0.7191408, 0.7759838, -1.125002, 1, 0, 0, 1, 1,
-0.7146666, 0.2047856, -1.63749, 1, 0, 0, 1, 1,
-0.7146564, 0.4971944, -0.5334578, 0, 0, 0, 1, 1,
-0.7146526, 2.602411, -1.722485, 0, 0, 0, 1, 1,
-0.7132456, 0.08759267, -0.3323695, 0, 0, 0, 1, 1,
-0.7106786, -0.848592, -1.714929, 0, 0, 0, 1, 1,
-0.7076228, -1.061441, -3.88545, 0, 0, 0, 1, 1,
-0.7072854, 1.109322, -1.211636, 0, 0, 0, 1, 1,
-0.70587, -0.9741254, -1.311073, 0, 0, 0, 1, 1,
-0.7027112, 0.8290551, -1.374356, 1, 1, 1, 1, 1,
-0.6982215, -0.9179389, -0.5651235, 1, 1, 1, 1, 1,
-0.6906707, -0.3084655, -1.980502, 1, 1, 1, 1, 1,
-0.6895266, 0.6270335, -0.7564148, 1, 1, 1, 1, 1,
-0.6878933, -1.081822, -1.788031, 1, 1, 1, 1, 1,
-0.6840319, -0.2462104, -1.700139, 1, 1, 1, 1, 1,
-0.6801046, -0.6552089, -2.481061, 1, 1, 1, 1, 1,
-0.6769648, -0.1744562, -1.582483, 1, 1, 1, 1, 1,
-0.6758214, 0.1881213, -0.7908479, 1, 1, 1, 1, 1,
-0.6757663, 1.336633, -0.3163304, 1, 1, 1, 1, 1,
-0.6747657, 0.3238306, -2.096089, 1, 1, 1, 1, 1,
-0.6734766, -2.049896, -4.371068, 1, 1, 1, 1, 1,
-0.6716817, 2.241751, -0.8336709, 1, 1, 1, 1, 1,
-0.6699577, 0.1816929, -1.440263, 1, 1, 1, 1, 1,
-0.6690729, 1.345518, -0.8541495, 1, 1, 1, 1, 1,
-0.6689765, 0.8957931, -0.5806781, 0, 0, 1, 1, 1,
-0.6683511, 0.8662816, -0.7753946, 1, 0, 0, 1, 1,
-0.6644685, 0.3901174, 0.2317027, 1, 0, 0, 1, 1,
-0.6584292, 0.5926788, -0.8029034, 1, 0, 0, 1, 1,
-0.6579564, -1.927272, -4.611697, 1, 0, 0, 1, 1,
-0.6567803, -2.824967, -3.566761, 1, 0, 0, 1, 1,
-0.6505299, 0.4623862, -1.160835, 0, 0, 0, 1, 1,
-0.6442485, -1.696011, -2.305816, 0, 0, 0, 1, 1,
-0.6410106, 0.4405451, -0.05993693, 0, 0, 0, 1, 1,
-0.6393457, -0.1651955, -2.17123, 0, 0, 0, 1, 1,
-0.6379297, 0.2684177, -0.08062914, 0, 0, 0, 1, 1,
-0.6367913, 0.9689828, -1.595698, 0, 0, 0, 1, 1,
-0.6305246, 1.27306, 0.8511842, 0, 0, 0, 1, 1,
-0.628659, -1.041889, -0.6008961, 1, 1, 1, 1, 1,
-0.6284156, -0.8259003, -0.6103701, 1, 1, 1, 1, 1,
-0.6263234, 0.6040772, -0.5563841, 1, 1, 1, 1, 1,
-0.6216739, 0.7204235, -0.9394225, 1, 1, 1, 1, 1,
-0.6209943, 0.4879662, -0.2578153, 1, 1, 1, 1, 1,
-0.6136346, 1.748395, -1.076536, 1, 1, 1, 1, 1,
-0.6116805, 0.2566589, -0.06384048, 1, 1, 1, 1, 1,
-0.609622, -1.493232, -4.540301, 1, 1, 1, 1, 1,
-0.6060386, 0.01236895, -2.629064, 1, 1, 1, 1, 1,
-0.6058279, -0.5568421, -2.074552, 1, 1, 1, 1, 1,
-0.6052985, -0.4754423, -2.728189, 1, 1, 1, 1, 1,
-0.6047568, -0.4260678, -0.9531646, 1, 1, 1, 1, 1,
-0.6028093, 0.06235083, -1.863363, 1, 1, 1, 1, 1,
-0.6023818, 0.4459566, -0.03045999, 1, 1, 1, 1, 1,
-0.5983393, -0.4538985, -0.4124627, 1, 1, 1, 1, 1,
-0.5952941, -0.2385627, -1.876935, 0, 0, 1, 1, 1,
-0.5924473, -1.075976, -2.33952, 1, 0, 0, 1, 1,
-0.5862194, -0.6587892, -2.223767, 1, 0, 0, 1, 1,
-0.5683967, -1.014763, -2.532725, 1, 0, 0, 1, 1,
-0.5650857, 0.5389492, -0.1451754, 1, 0, 0, 1, 1,
-0.5646905, -0.5605096, -1.546018, 1, 0, 0, 1, 1,
-0.5640767, 0.6038457, 0.1339041, 0, 0, 0, 1, 1,
-0.5634949, 0.1435125, -1.192878, 0, 0, 0, 1, 1,
-0.5632219, -0.3529682, -3.003664, 0, 0, 0, 1, 1,
-0.5622891, -1.969157, -2.356904, 0, 0, 0, 1, 1,
-0.5608658, -1.248477, -3.898572, 0, 0, 0, 1, 1,
-0.5599548, -1.642596, -2.876839, 0, 0, 0, 1, 1,
-0.5561668, -0.8583961, -3.085626, 0, 0, 0, 1, 1,
-0.5550883, 0.6882651, -0.6898447, 1, 1, 1, 1, 1,
-0.5546463, 0.05195545, -1.463791, 1, 1, 1, 1, 1,
-0.5514791, -0.08262461, -2.432282, 1, 1, 1, 1, 1,
-0.5444475, 0.5182465, -0.0216106, 1, 1, 1, 1, 1,
-0.5427172, -0.1514964, -0.6986796, 1, 1, 1, 1, 1,
-0.5416873, 1.270991, 0.1139758, 1, 1, 1, 1, 1,
-0.536438, 0.4861457, -2.76014, 1, 1, 1, 1, 1,
-0.5342919, 1.801747, -1.236955, 1, 1, 1, 1, 1,
-0.5340884, 0.1103615, -0.686563, 1, 1, 1, 1, 1,
-0.5285803, -1.730883, -4.769581, 1, 1, 1, 1, 1,
-0.5177343, 0.4202497, -2.02311, 1, 1, 1, 1, 1,
-0.5176021, -0.1516201, -2.741373, 1, 1, 1, 1, 1,
-0.5174187, 0.3928145, 0.4311622, 1, 1, 1, 1, 1,
-0.5171926, 0.254502, -1.462841, 1, 1, 1, 1, 1,
-0.5136368, 0.5677503, 0.710573, 1, 1, 1, 1, 1,
-0.5119894, -1.02905, -4.281208, 0, 0, 1, 1, 1,
-0.5081512, 1.310398, 0.7478163, 1, 0, 0, 1, 1,
-0.5074574, -0.4993831, -2.250364, 1, 0, 0, 1, 1,
-0.4984405, 1.722127, 0.02091564, 1, 0, 0, 1, 1,
-0.4974927, 0.6766906, -0.5225163, 1, 0, 0, 1, 1,
-0.4974924, -0.1181877, -0.8979614, 1, 0, 0, 1, 1,
-0.4972731, 0.6611382, -1.784129, 0, 0, 0, 1, 1,
-0.4930761, -0.1943386, -2.087888, 0, 0, 0, 1, 1,
-0.4865264, 0.0592785, -1.179814, 0, 0, 0, 1, 1,
-0.4829048, -1.823929, -3.070024, 0, 0, 0, 1, 1,
-0.4770218, 0.1598437, -0.7954161, 0, 0, 0, 1, 1,
-0.4714285, 0.1193597, -0.2368244, 0, 0, 0, 1, 1,
-0.4672674, 2.617435, -1.456148, 0, 0, 0, 1, 1,
-0.4630723, 2.088731, -0.1611567, 1, 1, 1, 1, 1,
-0.4534207, -0.6340609, -5.032217, 1, 1, 1, 1, 1,
-0.4531872, -0.5188742, -2.868278, 1, 1, 1, 1, 1,
-0.4501062, -2.300237, -2.646318, 1, 1, 1, 1, 1,
-0.448327, 1.083067, 0.7949736, 1, 1, 1, 1, 1,
-0.4416933, 0.26217, -1.247353, 1, 1, 1, 1, 1,
-0.4389376, 0.972574, -1.048788, 1, 1, 1, 1, 1,
-0.4264669, -0.8312314, -3.590964, 1, 1, 1, 1, 1,
-0.4254948, 2.210293, -0.7023867, 1, 1, 1, 1, 1,
-0.4193724, 2.204911, -0.797482, 1, 1, 1, 1, 1,
-0.4174121, -0.6007788, -1.991401, 1, 1, 1, 1, 1,
-0.4171441, 0.07273527, -1.956857, 1, 1, 1, 1, 1,
-0.4119482, 0.9370468, -0.02773234, 1, 1, 1, 1, 1,
-0.4111827, -0.9056619, -3.679051, 1, 1, 1, 1, 1,
-0.4071114, 0.3421455, -1.948356, 1, 1, 1, 1, 1,
-0.4068695, -1.249036, -3.593927, 0, 0, 1, 1, 1,
-0.4027051, -1.304067, -1.587257, 1, 0, 0, 1, 1,
-0.4014599, 0.7478898, 1.36373, 1, 0, 0, 1, 1,
-0.4013967, -1.002878, -1.314777, 1, 0, 0, 1, 1,
-0.4005962, 2.3787, 0.2866479, 1, 0, 0, 1, 1,
-0.3989525, 1.688028, 0.1443445, 1, 0, 0, 1, 1,
-0.3970724, 2.03485, 0.7532438, 0, 0, 0, 1, 1,
-0.3968496, 0.4690674, -1.462107, 0, 0, 0, 1, 1,
-0.3918416, 0.6314819, 0.09032752, 0, 0, 0, 1, 1,
-0.391479, -0.433059, -1.181132, 0, 0, 0, 1, 1,
-0.3908616, -0.7319237, -3.257155, 0, 0, 0, 1, 1,
-0.3898126, -1.001313, -3.336039, 0, 0, 0, 1, 1,
-0.3866169, 0.195741, -1.545944, 0, 0, 0, 1, 1,
-0.3830079, -0.04520061, -1.331079, 1, 1, 1, 1, 1,
-0.3772471, 0.6340137, 1.723114, 1, 1, 1, 1, 1,
-0.3772291, -0.003984666, -1.401837, 1, 1, 1, 1, 1,
-0.3756467, -1.747789, -2.727712, 1, 1, 1, 1, 1,
-0.3732456, -0.8068186, -2.535673, 1, 1, 1, 1, 1,
-0.3652278, -0.8349109, -1.840444, 1, 1, 1, 1, 1,
-0.365012, 0.113542, -1.927353, 1, 1, 1, 1, 1,
-0.3649554, -0.5728397, -2.324513, 1, 1, 1, 1, 1,
-0.3533467, 0.5779271, 0.2516637, 1, 1, 1, 1, 1,
-0.3474047, -0.3550873, -2.964259, 1, 1, 1, 1, 1,
-0.3443177, -1.44778, -2.026664, 1, 1, 1, 1, 1,
-0.3395073, -0.2448511, -2.054243, 1, 1, 1, 1, 1,
-0.3393748, 1.2058, 0.3890784, 1, 1, 1, 1, 1,
-0.3372318, 0.5491665, -2.009939, 1, 1, 1, 1, 1,
-0.3363541, 0.8516502, -0.7474801, 1, 1, 1, 1, 1,
-0.335987, 1.176054, 1.933668, 0, 0, 1, 1, 1,
-0.3304188, 0.0416902, -0.6490835, 1, 0, 0, 1, 1,
-0.3256358, 0.2318497, -0.9113532, 1, 0, 0, 1, 1,
-0.3172392, 1.456718, -2.278341, 1, 0, 0, 1, 1,
-0.3146997, -1.622429, -4.040975, 1, 0, 0, 1, 1,
-0.3129299, -0.1796104, -0.6633482, 1, 0, 0, 1, 1,
-0.3110423, 0.2927005, -0.7904289, 0, 0, 0, 1, 1,
-0.3106124, -0.2536132, -1.294439, 0, 0, 0, 1, 1,
-0.3084062, -0.136884, -2.147113, 0, 0, 0, 1, 1,
-0.3041371, 0.222695, -0.4381851, 0, 0, 0, 1, 1,
-0.3026051, -0.7749264, -3.013619, 0, 0, 0, 1, 1,
-0.3024323, 0.2468962, 0.4824514, 0, 0, 0, 1, 1,
-0.3012794, 0.5365838, -0.5022296, 0, 0, 0, 1, 1,
-0.2971855, -0.2118933, -1.748628, 1, 1, 1, 1, 1,
-0.2964036, 1.976944, -0.7933273, 1, 1, 1, 1, 1,
-0.2944771, 0.7197761, -0.6493114, 1, 1, 1, 1, 1,
-0.2927845, 0.1571672, -1.039852, 1, 1, 1, 1, 1,
-0.2911143, 0.6820396, -1.302694, 1, 1, 1, 1, 1,
-0.286816, -1.110968, -2.035302, 1, 1, 1, 1, 1,
-0.2839125, -0.9196227, -1.981726, 1, 1, 1, 1, 1,
-0.2823549, 1.045038, -0.9738961, 1, 1, 1, 1, 1,
-0.2823144, -5.235036e-05, -2.150506, 1, 1, 1, 1, 1,
-0.2748011, -2.370191, -1.570388, 1, 1, 1, 1, 1,
-0.2741935, 0.5219375, -1.516369, 1, 1, 1, 1, 1,
-0.2692614, -0.9403312, -3.41217, 1, 1, 1, 1, 1,
-0.2691635, -0.5179039, -2.330314, 1, 1, 1, 1, 1,
-0.2620199, -2.206133, -4.383276, 1, 1, 1, 1, 1,
-0.2605716, -0.2621717, -3.012159, 1, 1, 1, 1, 1,
-0.2591625, -0.7429108, -5.141633, 0, 0, 1, 1, 1,
-0.2590319, 0.7142842, 1.349839, 1, 0, 0, 1, 1,
-0.2571277, 1.014346, 0.4813726, 1, 0, 0, 1, 1,
-0.2480811, -1.090362, -2.785757, 1, 0, 0, 1, 1,
-0.2439015, -0.3878253, -4.28489, 1, 0, 0, 1, 1,
-0.2391393, 1.146538, -0.3560003, 1, 0, 0, 1, 1,
-0.2366449, -0.3787358, -0.585661, 0, 0, 0, 1, 1,
-0.2364297, 1.11061, 0.5986207, 0, 0, 0, 1, 1,
-0.2342125, 0.8409691, 0.2538482, 0, 0, 0, 1, 1,
-0.2342114, -1.389547, -3.069499, 0, 0, 0, 1, 1,
-0.2283797, -0.9150868, -3.828203, 0, 0, 0, 1, 1,
-0.227449, -1.52229, -4.45757, 0, 0, 0, 1, 1,
-0.2273369, 0.2380647, -1.30221, 0, 0, 0, 1, 1,
-0.2257698, 1.312544, -1.175322, 1, 1, 1, 1, 1,
-0.2243343, -0.4902023, -3.526601, 1, 1, 1, 1, 1,
-0.2221328, -0.5004112, -2.245218, 1, 1, 1, 1, 1,
-0.2184562, 0.9433978, -1.044005, 1, 1, 1, 1, 1,
-0.2183851, 1.602849, -1.802469, 1, 1, 1, 1, 1,
-0.2176547, 1.174489, 0.8199493, 1, 1, 1, 1, 1,
-0.211382, 0.3255692, 0.2587253, 1, 1, 1, 1, 1,
-0.2073952, 0.1735983, -2.187401, 1, 1, 1, 1, 1,
-0.2038729, 1.036593, 0.2153003, 1, 1, 1, 1, 1,
-0.2005863, -1.707652, -3.561097, 1, 1, 1, 1, 1,
-0.1975741, 1.690214, -0.2606995, 1, 1, 1, 1, 1,
-0.1952976, 1.071584, 1.231864, 1, 1, 1, 1, 1,
-0.1945079, -0.8704018, -2.289169, 1, 1, 1, 1, 1,
-0.1905107, -1.102575, -3.501144, 1, 1, 1, 1, 1,
-0.1865306, -1.216094, -2.583279, 1, 1, 1, 1, 1,
-0.1855134, 2.15294, -0.02784877, 0, 0, 1, 1, 1,
-0.1799009, 1.364278, 0.6778296, 1, 0, 0, 1, 1,
-0.1796607, 1.948616, 0.1855719, 1, 0, 0, 1, 1,
-0.1794102, -0.1531101, -1.367673, 1, 0, 0, 1, 1,
-0.1794035, -0.6069492, -2.340395, 1, 0, 0, 1, 1,
-0.1779053, 0.5076182, -2.416706, 1, 0, 0, 1, 1,
-0.1765815, 0.6458819, -0.7710043, 0, 0, 0, 1, 1,
-0.176493, -0.6433435, -3.356982, 0, 0, 0, 1, 1,
-0.1675474, -1.345787, -1.990994, 0, 0, 0, 1, 1,
-0.165312, 1.224718, 1.376751, 0, 0, 0, 1, 1,
-0.1591236, 0.2304918, 0.3140728, 0, 0, 0, 1, 1,
-0.1540898, 1.604045, -1.621839, 0, 0, 0, 1, 1,
-0.1422547, -2.18646, -3.573537, 0, 0, 0, 1, 1,
-0.1410154, -0.07654954, -0.1987084, 1, 1, 1, 1, 1,
-0.1405887, -0.5619496, -2.864639, 1, 1, 1, 1, 1,
-0.1386401, 0.1954052, -1.375283, 1, 1, 1, 1, 1,
-0.1354306, -0.6542106, -3.318134, 1, 1, 1, 1, 1,
-0.1296481, 0.7175339, 0.3117111, 1, 1, 1, 1, 1,
-0.1267594, 0.1502738, -0.1968824, 1, 1, 1, 1, 1,
-0.1170343, 1.938852, -0.8874686, 1, 1, 1, 1, 1,
-0.1160381, 1.866466, -0.9449139, 1, 1, 1, 1, 1,
-0.1156599, -1.377742, -0.8114905, 1, 1, 1, 1, 1,
-0.108444, 1.973986, 0.1601118, 1, 1, 1, 1, 1,
-0.1076729, 0.1845382, -0.5451401, 1, 1, 1, 1, 1,
-0.107494, 0.361211, -0.4489707, 1, 1, 1, 1, 1,
-0.1071392, -0.4533662, -2.638417, 1, 1, 1, 1, 1,
-0.1061422, -1.035715, -3.421684, 1, 1, 1, 1, 1,
-0.104993, -0.7784732, -3.452969, 1, 1, 1, 1, 1,
-0.1035514, 0.06612439, -1.207748, 0, 0, 1, 1, 1,
-0.102971, -0.2943767, -3.16065, 1, 0, 0, 1, 1,
-0.097869, -0.5240728, -1.220489, 1, 0, 0, 1, 1,
-0.09234368, -0.860835, -3.705421, 1, 0, 0, 1, 1,
-0.08056553, -2.227046, -1.784608, 1, 0, 0, 1, 1,
-0.07920527, -0.7508701, -1.415372, 1, 0, 0, 1, 1,
-0.07773535, -1.848694, -2.726203, 0, 0, 0, 1, 1,
-0.07651748, 0.3629925, 0.5095577, 0, 0, 0, 1, 1,
-0.07475242, -0.5089262, -2.950531, 0, 0, 0, 1, 1,
-0.05881854, 0.4767281, -0.553341, 0, 0, 0, 1, 1,
-0.05794193, -0.6291862, -3.281258, 0, 0, 0, 1, 1,
-0.05622586, -1.63692, -2.666987, 0, 0, 0, 1, 1,
-0.05317833, -0.5758787, -4.853917, 0, 0, 0, 1, 1,
-0.05226668, -0.6207688, -1.626295, 1, 1, 1, 1, 1,
-0.04512702, 0.9042478, 0.3355044, 1, 1, 1, 1, 1,
-0.04231699, -0.4538988, -3.567924, 1, 1, 1, 1, 1,
-0.03928957, 0.3003407, -0.4150112, 1, 1, 1, 1, 1,
-0.0360403, -0.5638287, -2.417795, 1, 1, 1, 1, 1,
-0.03461264, -0.4123677, -2.801857, 1, 1, 1, 1, 1,
-0.02438505, 0.1594663, -1.298884, 1, 1, 1, 1, 1,
-0.01981017, -0.5350675, -3.978839, 1, 1, 1, 1, 1,
-0.01879077, 0.4288449, 1.694344, 1, 1, 1, 1, 1,
-0.01301738, 1.814957, -0.3033716, 1, 1, 1, 1, 1,
-0.01082624, 0.510366, -1.105491, 1, 1, 1, 1, 1,
-0.01075286, -1.247269, -3.365199, 1, 1, 1, 1, 1,
-0.00788184, 0.3987831, 1.823766, 1, 1, 1, 1, 1,
-0.007411203, -0.02953095, -4.067685, 1, 1, 1, 1, 1,
-0.005879799, -0.05849345, -3.753632, 1, 1, 1, 1, 1,
-0.004922296, 0.4423054, 0.1844348, 0, 0, 1, 1, 1,
-0.004291203, 1.457729, -0.1760619, 1, 0, 0, 1, 1,
-0.003388277, 1.173631, -0.9228895, 1, 0, 0, 1, 1,
-0.002838544, 0.6865166, 0.7790217, 1, 0, 0, 1, 1,
-0.002263254, -1.774469, -2.944678, 1, 0, 0, 1, 1,
0.005699213, -0.1061573, 3.669492, 1, 0, 0, 1, 1,
0.007922158, -0.5462995, 3.573621, 0, 0, 0, 1, 1,
0.01220634, -1.567231, 1.986852, 0, 0, 0, 1, 1,
0.01378721, -0.8738354, 4.93422, 0, 0, 0, 1, 1,
0.01437595, -0.2326632, 1.253184, 0, 0, 0, 1, 1,
0.0163636, -0.318495, 4.237079, 0, 0, 0, 1, 1,
0.02304972, 2.195218, -0.2038529, 0, 0, 0, 1, 1,
0.03085001, -0.3604331, 3.651479, 0, 0, 0, 1, 1,
0.03665926, -0.7988833, 2.396431, 1, 1, 1, 1, 1,
0.0373625, 0.159745, -2.607208, 1, 1, 1, 1, 1,
0.03791721, -0.1353258, 2.203917, 1, 1, 1, 1, 1,
0.03849391, -0.6898689, 2.385526, 1, 1, 1, 1, 1,
0.0397268, -0.3068686, 2.730527, 1, 1, 1, 1, 1,
0.04203409, -1.183632, 3.799337, 1, 1, 1, 1, 1,
0.04344898, -0.7413584, 3.279696, 1, 1, 1, 1, 1,
0.04430569, -0.4456395, 2.627401, 1, 1, 1, 1, 1,
0.04507814, -2.398062, 2.100991, 1, 1, 1, 1, 1,
0.05005474, 0.5142676, 0.6425864, 1, 1, 1, 1, 1,
0.05022114, -0.3948393, 2.306894, 1, 1, 1, 1, 1,
0.05085038, 0.6457349, -0.3969145, 1, 1, 1, 1, 1,
0.05167776, -0.7432577, 2.7259, 1, 1, 1, 1, 1,
0.05262775, -0.4600762, 0.2675307, 1, 1, 1, 1, 1,
0.05514092, 0.5502417, 0.68831, 1, 1, 1, 1, 1,
0.05891182, -0.2674773, 3.639936, 0, 0, 1, 1, 1,
0.06043996, -0.2543101, 1.946903, 1, 0, 0, 1, 1,
0.06606315, 0.0986689, 1.429099, 1, 0, 0, 1, 1,
0.06642094, 0.8085514, 1.368448, 1, 0, 0, 1, 1,
0.06721553, 0.189155, 1.7233, 1, 0, 0, 1, 1,
0.06944623, -1.935052, 5.186306, 1, 0, 0, 1, 1,
0.07190133, 0.2700022, -0.3805492, 0, 0, 0, 1, 1,
0.07565694, 0.6277662, -0.2007175, 0, 0, 0, 1, 1,
0.07598828, -1.11917, 2.288605, 0, 0, 0, 1, 1,
0.0827038, -0.3587834, 2.475773, 0, 0, 0, 1, 1,
0.08744808, -0.565394, 2.081209, 0, 0, 0, 1, 1,
0.08782504, 0.6419249, -0.07861859, 0, 0, 0, 1, 1,
0.09061657, 0.5998185, 0.9856768, 0, 0, 0, 1, 1,
0.09209485, -1.025397, 3.413002, 1, 1, 1, 1, 1,
0.09934647, 0.7581222, -0.4479294, 1, 1, 1, 1, 1,
0.1013438, -0.5973278, 2.894607, 1, 1, 1, 1, 1,
0.105196, -0.9582596, 2.130214, 1, 1, 1, 1, 1,
0.1160411, 0.9538198, 0.3215427, 1, 1, 1, 1, 1,
0.1181132, -0.1304234, 2.222563, 1, 1, 1, 1, 1,
0.1264369, 0.2170804, 1.136248, 1, 1, 1, 1, 1,
0.1269697, 1.231196, -0.292562, 1, 1, 1, 1, 1,
0.1294209, -0.193979, 2.803525, 1, 1, 1, 1, 1,
0.1336881, -1.241404, 2.429564, 1, 1, 1, 1, 1,
0.1356412, 0.228971, 0.7060323, 1, 1, 1, 1, 1,
0.1364943, 0.8454605, 0.0150047, 1, 1, 1, 1, 1,
0.1371506, -1.048543, 2.392455, 1, 1, 1, 1, 1,
0.138944, -1.754534, 4.890573, 1, 1, 1, 1, 1,
0.1398405, 0.0002531248, 0.7794321, 1, 1, 1, 1, 1,
0.1438212, -0.009145585, 4.496709, 0, 0, 1, 1, 1,
0.1474213, -0.02236222, 1.644139, 1, 0, 0, 1, 1,
0.1478397, -0.4017778, 3.151527, 1, 0, 0, 1, 1,
0.1482055, 0.4773598, 1.05973, 1, 0, 0, 1, 1,
0.1539687, -1.387923, 2.799608, 1, 0, 0, 1, 1,
0.1562068, -1.391838, 3.434999, 1, 0, 0, 1, 1,
0.1578552, 0.4171944, -1.367598, 0, 0, 0, 1, 1,
0.1615988, 0.1651277, 1.043009, 0, 0, 0, 1, 1,
0.1622408, 0.5415336, 1.589877, 0, 0, 0, 1, 1,
0.1693988, 0.3359064, 2.034512, 0, 0, 0, 1, 1,
0.1708872, 1.520626, -0.8463024, 0, 0, 0, 1, 1,
0.1735698, -0.137846, 3.151375, 0, 0, 0, 1, 1,
0.1778035, -0.1458598, 3.518038, 0, 0, 0, 1, 1,
0.1786207, -0.1062546, 2.350404, 1, 1, 1, 1, 1,
0.179434, -0.03980169, 0.7457759, 1, 1, 1, 1, 1,
0.1806604, 0.4609531, -1.323034, 1, 1, 1, 1, 1,
0.1842429, -0.7833687, 1.379658, 1, 1, 1, 1, 1,
0.18455, -1.28872, 3.566361, 1, 1, 1, 1, 1,
0.1845971, -0.4021673, 3.10305, 1, 1, 1, 1, 1,
0.1864855, -0.2923812, 2.397457, 1, 1, 1, 1, 1,
0.1869363, -0.05637603, 2.24342, 1, 1, 1, 1, 1,
0.1877615, -0.2009799, 3.043386, 1, 1, 1, 1, 1,
0.1921226, 0.2347514, 1.297933, 1, 1, 1, 1, 1,
0.1952706, -1.089437, 2.095123, 1, 1, 1, 1, 1,
0.1954324, -0.4057798, 2.132755, 1, 1, 1, 1, 1,
0.205645, -0.6955995, 1.310968, 1, 1, 1, 1, 1,
0.2059908, 1.469977, 0.6056433, 1, 1, 1, 1, 1,
0.2091885, 1.033962, 0.5586888, 1, 1, 1, 1, 1,
0.2111537, 0.4216547, 1.24528, 0, 0, 1, 1, 1,
0.2112058, -0.80666, 3.986423, 1, 0, 0, 1, 1,
0.2113132, -0.3542089, 2.792798, 1, 0, 0, 1, 1,
0.2126657, 0.2106047, 0.2140708, 1, 0, 0, 1, 1,
0.2145782, -0.3381692, 2.912477, 1, 0, 0, 1, 1,
0.218644, 1.170669, 0.1078259, 1, 0, 0, 1, 1,
0.221395, 0.2278155, 1.309654, 0, 0, 0, 1, 1,
0.222529, -0.11828, 1.618336, 0, 0, 0, 1, 1,
0.2249259, 0.9365441, -0.2172582, 0, 0, 0, 1, 1,
0.2286591, 0.6168507, 1.628333, 0, 0, 0, 1, 1,
0.2296723, -0.3174443, 1.367553, 0, 0, 0, 1, 1,
0.2405418, 1.440274, 0.3266025, 0, 0, 0, 1, 1,
0.2428676, -1.952666, 2.461264, 0, 0, 0, 1, 1,
0.2430771, -0.4897796, 3.531731, 1, 1, 1, 1, 1,
0.2442311, 0.9054842, 0.8816072, 1, 1, 1, 1, 1,
0.2446868, -1.017667, 2.710354, 1, 1, 1, 1, 1,
0.2466649, 1.078634, 1.50562, 1, 1, 1, 1, 1,
0.2467772, -1.826865, 1.41917, 1, 1, 1, 1, 1,
0.2493395, 0.2412966, 0.3374301, 1, 1, 1, 1, 1,
0.2512802, -1.218148, 2.996152, 1, 1, 1, 1, 1,
0.2522581, -2.168887, 1.24826, 1, 1, 1, 1, 1,
0.2557918, 0.4943074, -0.9154885, 1, 1, 1, 1, 1,
0.2603298, 0.3145401, -0.9299482, 1, 1, 1, 1, 1,
0.2661796, 0.2441854, 1.415789, 1, 1, 1, 1, 1,
0.2675592, 1.935095, -0.2118944, 1, 1, 1, 1, 1,
0.2678994, -1.441422, 2.818942, 1, 1, 1, 1, 1,
0.2685926, -0.3151238, 2.405531, 1, 1, 1, 1, 1,
0.2704153, -1.967808, 5.097445, 1, 1, 1, 1, 1,
0.271076, 0.7215515, 2.063633, 0, 0, 1, 1, 1,
0.2734965, 0.704023, -0.2425598, 1, 0, 0, 1, 1,
0.2775316, -0.2072859, 1.529852, 1, 0, 0, 1, 1,
0.2815887, 0.7683598, 0.2453721, 1, 0, 0, 1, 1,
0.2826906, 0.4805391, -0.5633317, 1, 0, 0, 1, 1,
0.2830442, 1.022218, 1.526291, 1, 0, 0, 1, 1,
0.2843824, -0.1614538, 1.725969, 0, 0, 0, 1, 1,
0.2844302, 1.233231, 0.6755366, 0, 0, 0, 1, 1,
0.293381, -0.4587714, 2.846205, 0, 0, 0, 1, 1,
0.2951025, -0.161638, 0.7429769, 0, 0, 0, 1, 1,
0.2969648, 0.9488029, -0.1280324, 0, 0, 0, 1, 1,
0.3020199, -1.464433, 4.601231, 0, 0, 0, 1, 1,
0.302975, -0.5538281, 2.928066, 0, 0, 0, 1, 1,
0.3032081, 0.5590386, 0.5849772, 1, 1, 1, 1, 1,
0.3037619, -0.3334911, 3.08985, 1, 1, 1, 1, 1,
0.3038946, 0.9598557, 0.1369558, 1, 1, 1, 1, 1,
0.3039643, 0.3554394, 1.091686, 1, 1, 1, 1, 1,
0.3048533, -0.217458, 1.241849, 1, 1, 1, 1, 1,
0.3069836, 0.521306, 0.5815966, 1, 1, 1, 1, 1,
0.3094072, 0.4315657, -0.2663108, 1, 1, 1, 1, 1,
0.3094949, 0.5807553, 0.8380651, 1, 1, 1, 1, 1,
0.3127255, -1.305388, 3.622432, 1, 1, 1, 1, 1,
0.3141981, 1.042565, -0.1507536, 1, 1, 1, 1, 1,
0.3189898, 1.355237, -0.1156553, 1, 1, 1, 1, 1,
0.3271228, -1.224667, 2.488287, 1, 1, 1, 1, 1,
0.340825, -0.8570095, 1.513081, 1, 1, 1, 1, 1,
0.3425664, 0.7538355, -0.4331976, 1, 1, 1, 1, 1,
0.3435141, 0.007188356, 1.470804, 1, 1, 1, 1, 1,
0.3479848, -0.1047805, 2.056642, 0, 0, 1, 1, 1,
0.3539453, -0.2676015, 1.716609, 1, 0, 0, 1, 1,
0.3555287, -0.1696691, 3.141078, 1, 0, 0, 1, 1,
0.3568098, -0.4047503, 2.335585, 1, 0, 0, 1, 1,
0.3586241, -1.59275, 2.18107, 1, 0, 0, 1, 1,
0.36025, -1.167405, 1.869234, 1, 0, 0, 1, 1,
0.36076, -0.1835644, 1.602412, 0, 0, 0, 1, 1,
0.3632364, -0.8450224, 3.828631, 0, 0, 0, 1, 1,
0.3648142, 0.6537165, 0.2013182, 0, 0, 0, 1, 1,
0.382885, 0.3116363, 2.842716, 0, 0, 0, 1, 1,
0.3879677, 0.7314764, -1.345869, 0, 0, 0, 1, 1,
0.3879967, -1.327142, 2.376788, 0, 0, 0, 1, 1,
0.3977434, 0.6146911, 1.125512, 0, 0, 0, 1, 1,
0.4017546, -0.299181, 3.602451, 1, 1, 1, 1, 1,
0.4029381, -0.01981548, 0.8862624, 1, 1, 1, 1, 1,
0.406877, 0.594384, -0.5418767, 1, 1, 1, 1, 1,
0.4091922, 0.9234561, 1.023982, 1, 1, 1, 1, 1,
0.409381, -1.91669, 2.464569, 1, 1, 1, 1, 1,
0.4104391, 0.06228519, 0.3974248, 1, 1, 1, 1, 1,
0.4112652, -0.4333303, 1.691216, 1, 1, 1, 1, 1,
0.4135105, -1.95113, 3.909764, 1, 1, 1, 1, 1,
0.4155365, 0.09671881, 1.465749, 1, 1, 1, 1, 1,
0.416737, 0.2384974, 0.1547464, 1, 1, 1, 1, 1,
0.4178799, 0.6445889, 0.5340263, 1, 1, 1, 1, 1,
0.4183104, 0.5040063, 1.000606, 1, 1, 1, 1, 1,
0.4193826, 0.001830919, 2.0907, 1, 1, 1, 1, 1,
0.420613, 1.015548, 0.5928013, 1, 1, 1, 1, 1,
0.4231466, 0.2715736, 1.238501, 1, 1, 1, 1, 1,
0.4237952, -0.531886, 2.377736, 0, 0, 1, 1, 1,
0.4279115, 0.1507139, 0.5249903, 1, 0, 0, 1, 1,
0.4290124, -1.842461, 1.96828, 1, 0, 0, 1, 1,
0.4442211, -1.115005, 2.778814, 1, 0, 0, 1, 1,
0.4496858, 0.4775905, -0.1131663, 1, 0, 0, 1, 1,
0.4601698, 0.3536755, 1.309454, 1, 0, 0, 1, 1,
0.4635103, 1.466411, -0.9362048, 0, 0, 0, 1, 1,
0.4651617, -1.489401, 2.931398, 0, 0, 0, 1, 1,
0.4657424, -1.014141, 2.216371, 0, 0, 0, 1, 1,
0.4661504, 1.4886, -1.177476, 0, 0, 0, 1, 1,
0.4759839, 1.768138, 1.977957, 0, 0, 0, 1, 1,
0.4774304, -0.685168, 3.945043, 0, 0, 0, 1, 1,
0.4794209, -0.1053001, 0.8348701, 0, 0, 0, 1, 1,
0.4817826, 0.1417625, 1.707989, 1, 1, 1, 1, 1,
0.4879615, 1.364499, -0.2005781, 1, 1, 1, 1, 1,
0.4944717, -0.6332018, 3.970471, 1, 1, 1, 1, 1,
0.4952222, 0.9586013, 1.84011, 1, 1, 1, 1, 1,
0.4987625, -0.349186, 1.693033, 1, 1, 1, 1, 1,
0.5014207, -0.2314225, 1.447008, 1, 1, 1, 1, 1,
0.502255, 0.06153076, -0.2568459, 1, 1, 1, 1, 1,
0.5138693, -0.2418336, 0.6264247, 1, 1, 1, 1, 1,
0.514644, 0.943621, 0.01367651, 1, 1, 1, 1, 1,
0.5148729, 0.09205622, 2.160145, 1, 1, 1, 1, 1,
0.5159431, 0.6070576, 1.52853, 1, 1, 1, 1, 1,
0.5162113, 1.468068, -0.9966036, 1, 1, 1, 1, 1,
0.5181027, -0.8387492, 2.508219, 1, 1, 1, 1, 1,
0.5189112, -0.5362355, 2.864222, 1, 1, 1, 1, 1,
0.5196889, 2.12456, 0.4953798, 1, 1, 1, 1, 1,
0.5203933, -0.5106509, 2.825423, 0, 0, 1, 1, 1,
0.5247774, -0.8793794, 3.014692, 1, 0, 0, 1, 1,
0.5288867, -0.2745999, 4.043637, 1, 0, 0, 1, 1,
0.532016, -1.372639, 1.804543, 1, 0, 0, 1, 1,
0.5336521, -0.508101, 3.80806, 1, 0, 0, 1, 1,
0.5392309, -0.1624807, 1.953814, 1, 0, 0, 1, 1,
0.5399015, -1.645191, 3.997183, 0, 0, 0, 1, 1,
0.5416529, -0.1694487, 2.336745, 0, 0, 0, 1, 1,
0.5443571, -0.7299114, 2.82646, 0, 0, 0, 1, 1,
0.5476555, 0.06005524, 1.144212, 0, 0, 0, 1, 1,
0.5520366, -1.795705, 3.39892, 0, 0, 0, 1, 1,
0.5527509, 0.3774953, 1.688023, 0, 0, 0, 1, 1,
0.5560287, -0.8506118, 1.48981, 0, 0, 0, 1, 1,
0.5582575, 0.2072678, 1.316966, 1, 1, 1, 1, 1,
0.5607967, -0.8338132, 2.462385, 1, 1, 1, 1, 1,
0.561901, 0.4385213, 1.923723, 1, 1, 1, 1, 1,
0.5619062, 1.387122, -1.178933, 1, 1, 1, 1, 1,
0.5623068, 0.5375257, -0.9358952, 1, 1, 1, 1, 1,
0.5636257, 0.7179115, 0.8872788, 1, 1, 1, 1, 1,
0.5674975, -1.236907, 2.899467, 1, 1, 1, 1, 1,
0.5685067, 1.186526, 1.889907, 1, 1, 1, 1, 1,
0.571599, -0.5348192, 2.260915, 1, 1, 1, 1, 1,
0.5749522, -0.9882481, 2.822739, 1, 1, 1, 1, 1,
0.5753762, 0.8947035, 0.2649884, 1, 1, 1, 1, 1,
0.576216, 0.5264689, 1.823494, 1, 1, 1, 1, 1,
0.5798262, -0.4107544, 1.030377, 1, 1, 1, 1, 1,
0.584968, 0.6174927, -0.4583556, 1, 1, 1, 1, 1,
0.5915356, -1.946164, 3.16461, 1, 1, 1, 1, 1,
0.5919018, -1.600874, 3.532852, 0, 0, 1, 1, 1,
0.5929813, -0.4282936, 1.63009, 1, 0, 0, 1, 1,
0.5989801, 0.8492268, -0.4156505, 1, 0, 0, 1, 1,
0.6025158, 0.9806203, 1.821906, 1, 0, 0, 1, 1,
0.6061741, 0.06825879, 0.6785544, 1, 0, 0, 1, 1,
0.606248, 1.264946, -0.8789801, 1, 0, 0, 1, 1,
0.6069252, 0.4710156, 0.8158137, 0, 0, 0, 1, 1,
0.6086093, -0.6430458, 1.75277, 0, 0, 0, 1, 1,
0.6090374, 0.6826008, 2.189749, 0, 0, 0, 1, 1,
0.6118019, 0.6125442, 0.9701365, 0, 0, 0, 1, 1,
0.615736, 1.307161, 0.1839617, 0, 0, 0, 1, 1,
0.6165185, 1.386488, 0.05053622, 0, 0, 0, 1, 1,
0.6248601, 0.1309625, -0.4102905, 0, 0, 0, 1, 1,
0.6267903, -1.564126, 2.739087, 1, 1, 1, 1, 1,
0.6277638, -1.645669, 2.563323, 1, 1, 1, 1, 1,
0.6290722, 0.1817609, 1.073631, 1, 1, 1, 1, 1,
0.6301108, -0.00618779, 0.6764659, 1, 1, 1, 1, 1,
0.6361774, 0.3393519, 0.9393618, 1, 1, 1, 1, 1,
0.6379119, -0.376279, 2.238634, 1, 1, 1, 1, 1,
0.638892, -0.4020036, 1.869297, 1, 1, 1, 1, 1,
0.6408255, -0.05377519, 1.199463, 1, 1, 1, 1, 1,
0.646332, 0.08922474, 1.62194, 1, 1, 1, 1, 1,
0.6473677, -0.7803215, 1.282625, 1, 1, 1, 1, 1,
0.6522087, -0.5978467, 3.002797, 1, 1, 1, 1, 1,
0.660477, 1.423805, 1.449463, 1, 1, 1, 1, 1,
0.6709269, 0.5929101, -1.305901, 1, 1, 1, 1, 1,
0.6730555, -0.140874, 1.401209, 1, 1, 1, 1, 1,
0.6777672, -1.083441, 1.86799, 1, 1, 1, 1, 1,
0.6789156, -1.888407, 4.092276, 0, 0, 1, 1, 1,
0.6789654, -0.3333738, 0.9172627, 1, 0, 0, 1, 1,
0.680893, -0.3826119, 0.6267189, 1, 0, 0, 1, 1,
0.6827876, -0.4559256, 2.471196, 1, 0, 0, 1, 1,
0.6874742, -0.2481114, 1.544838, 1, 0, 0, 1, 1,
0.6880153, 0.9022971, 0.881686, 1, 0, 0, 1, 1,
0.689943, -0.1934374, 0.273212, 0, 0, 0, 1, 1,
0.6902451, 0.6859806, -0.8378021, 0, 0, 0, 1, 1,
0.690462, 0.6298352, 0.1097395, 0, 0, 0, 1, 1,
0.6935505, 1.772697, 0.2811866, 0, 0, 0, 1, 1,
0.6950603, -1.690888, 1.513842, 0, 0, 0, 1, 1,
0.6955359, 0.1856283, 0.9859009, 0, 0, 0, 1, 1,
0.698184, 0.6468509, -0.3817474, 0, 0, 0, 1, 1,
0.7006848, 0.3371154, 1.060723, 1, 1, 1, 1, 1,
0.7039235, 1.775898, 0.01380737, 1, 1, 1, 1, 1,
0.7045757, -0.1183292, 3.040639, 1, 1, 1, 1, 1,
0.7051133, 0.8441952, 1.050827, 1, 1, 1, 1, 1,
0.7091898, -0.558159, 1.595512, 1, 1, 1, 1, 1,
0.7284473, 0.2330622, 1.80662, 1, 1, 1, 1, 1,
0.728798, -1.005938, 1.906592, 1, 1, 1, 1, 1,
0.7324097, -0.745605, 3.341095, 1, 1, 1, 1, 1,
0.7339836, -0.1391046, 1.88089, 1, 1, 1, 1, 1,
0.7354571, 2.321853, -0.6289476, 1, 1, 1, 1, 1,
0.7382601, -0.2580053, 2.897596, 1, 1, 1, 1, 1,
0.7443044, -0.663719, 0.8526027, 1, 1, 1, 1, 1,
0.74503, 0.9014515, 1.503707, 1, 1, 1, 1, 1,
0.7483074, 0.03687092, 1.441028, 1, 1, 1, 1, 1,
0.7484145, 0.101148, 0.002576934, 1, 1, 1, 1, 1,
0.7493151, 0.07537739, 0.496375, 0, 0, 1, 1, 1,
0.751082, -0.619185, 3.52273, 1, 0, 0, 1, 1,
0.7514287, -0.7335536, 2.459428, 1, 0, 0, 1, 1,
0.7545959, 0.5312314, 0.02943728, 1, 0, 0, 1, 1,
0.7568201, -1.368518, 3.52169, 1, 0, 0, 1, 1,
0.7589287, 0.2655776, 2.002308, 1, 0, 0, 1, 1,
0.7632009, 0.9873084, 0.3987876, 0, 0, 0, 1, 1,
0.7712796, 0.1076614, -0.2501561, 0, 0, 0, 1, 1,
0.7770157, -0.6846354, 2.067934, 0, 0, 0, 1, 1,
0.7774227, -0.2479617, 0.5006523, 0, 0, 0, 1, 1,
0.778294, 0.7047589, 1.445162, 0, 0, 0, 1, 1,
0.7798614, 1.089402, -1.118157, 0, 0, 0, 1, 1,
0.7833041, 0.08885448, 1.655663, 0, 0, 0, 1, 1,
0.7893496, 0.08382376, 0.9022603, 1, 1, 1, 1, 1,
0.7940652, 0.5806228, 0.1138951, 1, 1, 1, 1, 1,
0.7945318, 1.283111, 0.1109422, 1, 1, 1, 1, 1,
0.7952867, -0.514373, 2.429533, 1, 1, 1, 1, 1,
0.7983372, -0.06839141, 2.981755, 1, 1, 1, 1, 1,
0.8003333, -0.7293586, 1.429529, 1, 1, 1, 1, 1,
0.8026315, 1.844007, 0.5273492, 1, 1, 1, 1, 1,
0.8061802, 0.5110821, 1.050645, 1, 1, 1, 1, 1,
0.820794, -1.144125, 4.139508, 1, 1, 1, 1, 1,
0.8285263, 2.203764, 0.2239559, 1, 1, 1, 1, 1,
0.8329416, -2.133811, 1.673703, 1, 1, 1, 1, 1,
0.8332462, 0.5732903, 0.2179479, 1, 1, 1, 1, 1,
0.841437, 2.055126, -0.638106, 1, 1, 1, 1, 1,
0.8420606, 1.292811, 0.6784553, 1, 1, 1, 1, 1,
0.8425004, 0.5513697, 0.2026715, 1, 1, 1, 1, 1,
0.843648, 0.2448031, 2.74575, 0, 0, 1, 1, 1,
0.8459129, 1.871698, 0.8709705, 1, 0, 0, 1, 1,
0.8470898, -0.639903, 2.0347, 1, 0, 0, 1, 1,
0.8475615, -0.4200693, 0.7513502, 1, 0, 0, 1, 1,
0.8620808, 0.6207694, -0.5670438, 1, 0, 0, 1, 1,
0.8656617, -0.7541526, 3.683345, 1, 0, 0, 1, 1,
0.8680177, -0.2313662, 1.08425, 0, 0, 0, 1, 1,
0.8772765, 1.021278, -0.0388725, 0, 0, 0, 1, 1,
0.8805685, -0.9828464, -0.2037186, 0, 0, 0, 1, 1,
0.8831936, -1.549198, 2.007987, 0, 0, 0, 1, 1,
0.8866419, -0.3095806, 0.9742814, 0, 0, 0, 1, 1,
0.8878617, -1.584237, 1.094779, 0, 0, 0, 1, 1,
0.8915225, -0.2402548, 1.485899, 0, 0, 0, 1, 1,
0.8922745, -1.121833, 2.114943, 1, 1, 1, 1, 1,
0.9025243, 0.4250575, 1.765837, 1, 1, 1, 1, 1,
0.9135726, -0.6723488, 0.2876343, 1, 1, 1, 1, 1,
0.9280633, 0.3463427, 0.7686338, 1, 1, 1, 1, 1,
0.9299221, -2.456291, 1.493508, 1, 1, 1, 1, 1,
0.9317467, 1.532744, -0.6180702, 1, 1, 1, 1, 1,
0.9397509, 3.120534, -0.3485644, 1, 1, 1, 1, 1,
0.9429728, -1.585833, -0.3378169, 1, 1, 1, 1, 1,
0.9443465, 0.6764753, 2.099247, 1, 1, 1, 1, 1,
0.9486126, 0.5352038, -0.2302577, 1, 1, 1, 1, 1,
0.9492255, -0.7304925, 1.872093, 1, 1, 1, 1, 1,
0.9641283, -0.06315745, 2.061229, 1, 1, 1, 1, 1,
0.9784827, -1.390122, 3.245179, 1, 1, 1, 1, 1,
0.9849705, 0.06346191, 1.868705, 1, 1, 1, 1, 1,
0.9856446, 0.2556481, 0.8210332, 1, 1, 1, 1, 1,
0.9979208, -0.695085, 1.284642, 0, 0, 1, 1, 1,
1.000111, -2.098287, 1.92417, 1, 0, 0, 1, 1,
1.008522, -0.5159294, 0.9327793, 1, 0, 0, 1, 1,
1.009207, 0.6107487, 0.431792, 1, 0, 0, 1, 1,
1.010342, -0.2263971, 2.276811, 1, 0, 0, 1, 1,
1.012074, 0.6685194, -0.1442063, 1, 0, 0, 1, 1,
1.01318, -0.9173158, 1.625767, 0, 0, 0, 1, 1,
1.016218, -0.6242315, 2.27805, 0, 0, 0, 1, 1,
1.019929, 0.9940477, -0.7842495, 0, 0, 0, 1, 1,
1.024433, -0.972242, 1.431315, 0, 0, 0, 1, 1,
1.026893, 0.91817, 1.629335, 0, 0, 0, 1, 1,
1.027782, -1.898642, 1.932253, 0, 0, 0, 1, 1,
1.03058, -1.416918, 2.497027, 0, 0, 0, 1, 1,
1.0327, 0.4669656, 0.1268471, 1, 1, 1, 1, 1,
1.039231, -0.04174279, 3.030056, 1, 1, 1, 1, 1,
1.060223, 0.7428668, 1.028901, 1, 1, 1, 1, 1,
1.06792, 1.213921, 1.361073, 1, 1, 1, 1, 1,
1.070306, 1.897351, 0.4826054, 1, 1, 1, 1, 1,
1.086866, 0.6402843, 1.539479, 1, 1, 1, 1, 1,
1.089656, 0.6145127, 1.327265, 1, 1, 1, 1, 1,
1.095174, -0.4097643, 2.184384, 1, 1, 1, 1, 1,
1.104397, -1.931732, 3.760918, 1, 1, 1, 1, 1,
1.106854, 0.1030638, 1.639958, 1, 1, 1, 1, 1,
1.115569, -0.6285065, 2.864422, 1, 1, 1, 1, 1,
1.119616, -1.710768, 1.524672, 1, 1, 1, 1, 1,
1.120537, 0.3150342, 1.15892, 1, 1, 1, 1, 1,
1.125025, -2.339654, 3.157258, 1, 1, 1, 1, 1,
1.13237, 0.9412013, 1.956499, 1, 1, 1, 1, 1,
1.134226, -1.434465, 1.555778, 0, 0, 1, 1, 1,
1.136449, -0.3206886, 3.194647, 1, 0, 0, 1, 1,
1.139718, 0.7064102, 0.06509753, 1, 0, 0, 1, 1,
1.147506, 0.1515221, 1.248355, 1, 0, 0, 1, 1,
1.150411, 0.7486097, 2.050586, 1, 0, 0, 1, 1,
1.152064, 1.370115, 1.212649, 1, 0, 0, 1, 1,
1.154582, -0.05534175, 1.32371, 0, 0, 0, 1, 1,
1.16313, -1.513721, 0.8679869, 0, 0, 0, 1, 1,
1.165393, 2.964143, 1.477334, 0, 0, 0, 1, 1,
1.168401, -0.3885303, 2.475791, 0, 0, 0, 1, 1,
1.168702, 0.7050686, 0.8968763, 0, 0, 0, 1, 1,
1.191411, 0.8747973, 2.692802, 0, 0, 0, 1, 1,
1.192061, -0.5858001, 2.680826, 0, 0, 0, 1, 1,
1.193699, -1.078549, 1.627871, 1, 1, 1, 1, 1,
1.208704, -0.3974414, 1.863884, 1, 1, 1, 1, 1,
1.209135, 0.1742852, -0.4455549, 1, 1, 1, 1, 1,
1.216332, -1.18118, 2.965155, 1, 1, 1, 1, 1,
1.217749, 0.0681361, 1.89177, 1, 1, 1, 1, 1,
1.226115, 0.6277378, 0.8666548, 1, 1, 1, 1, 1,
1.22628, -2.658645, 0.6575847, 1, 1, 1, 1, 1,
1.227493, -2.707556, 2.624259, 1, 1, 1, 1, 1,
1.249401, -1.719068, 3.432305, 1, 1, 1, 1, 1,
1.258896, -2.091488, 3.400297, 1, 1, 1, 1, 1,
1.261131, -0.6847155, 0.207353, 1, 1, 1, 1, 1,
1.262295, 0.1869238, 2.090204, 1, 1, 1, 1, 1,
1.27014, -1.114668, 3.114836, 1, 1, 1, 1, 1,
1.271816, -1.42134, 2.216789, 1, 1, 1, 1, 1,
1.293897, 0.8168027, 0.3202634, 1, 1, 1, 1, 1,
1.295084, -0.4540522, 4.218674, 0, 0, 1, 1, 1,
1.296724, -0.3557838, 1.427026, 1, 0, 0, 1, 1,
1.301119, 0.08820078, 1.782575, 1, 0, 0, 1, 1,
1.317981, -1.305342, 2.280647, 1, 0, 0, 1, 1,
1.324283, 0.480882, 1.076777, 1, 0, 0, 1, 1,
1.326577, 0.9661782, 1.24949, 1, 0, 0, 1, 1,
1.327962, 0.8889189, 1.587486, 0, 0, 0, 1, 1,
1.328786, -0.6153477, 0.9468837, 0, 0, 0, 1, 1,
1.337718, -1.073101, 1.216668, 0, 0, 0, 1, 1,
1.341058, -0.2362951, 0.3451082, 0, 0, 0, 1, 1,
1.349667, -1.430163, 2.648141, 0, 0, 0, 1, 1,
1.349921, -1.026685, 1.698847, 0, 0, 0, 1, 1,
1.358084, -0.4754084, 1.173592, 0, 0, 0, 1, 1,
1.364168, 0.01215969, 0.553077, 1, 1, 1, 1, 1,
1.365713, 0.2166877, -0.1212909, 1, 1, 1, 1, 1,
1.369118, -0.8593568, 2.552754, 1, 1, 1, 1, 1,
1.372615, -1.079102, 3.046776, 1, 1, 1, 1, 1,
1.375469, 0.9066416, -0.1595262, 1, 1, 1, 1, 1,
1.376344, -0.2323067, 2.44426, 1, 1, 1, 1, 1,
1.389288, 1.62622, 2.6521, 1, 1, 1, 1, 1,
1.401567, -1.538925, 2.754577, 1, 1, 1, 1, 1,
1.409845, -0.1229368, 1.047847, 1, 1, 1, 1, 1,
1.445264, -0.3742253, 1.575198, 1, 1, 1, 1, 1,
1.44865, -0.9842585, 1.125648, 1, 1, 1, 1, 1,
1.466833, 0.952304, 0.2853072, 1, 1, 1, 1, 1,
1.471855, -3.236218, 4.581481, 1, 1, 1, 1, 1,
1.477741, -0.5119267, 3.608508, 1, 1, 1, 1, 1,
1.48508, 0.9169185, 0.1158256, 1, 1, 1, 1, 1,
1.485373, 0.9204711, 1.328085, 0, 0, 1, 1, 1,
1.490087, 0.9185176, 0.8245224, 1, 0, 0, 1, 1,
1.493877, -0.0727051, 2.235646, 1, 0, 0, 1, 1,
1.494842, 0.7626398, 1.518736, 1, 0, 0, 1, 1,
1.498044, -1.509027, 2.144957, 1, 0, 0, 1, 1,
1.506168, -1.540473, 1.68972, 1, 0, 0, 1, 1,
1.513384, 0.3848455, 0.9746363, 0, 0, 0, 1, 1,
1.514325, 0.7428054, 0.3547181, 0, 0, 0, 1, 1,
1.517919, 1.408956, -0.4216781, 0, 0, 0, 1, 1,
1.518138, 0.169629, 1.616915, 0, 0, 0, 1, 1,
1.522188, 1.101139, 2.387078, 0, 0, 0, 1, 1,
1.524003, 0.1820134, 0.8475967, 0, 0, 0, 1, 1,
1.526234, 1.3685, 2.951485, 0, 0, 0, 1, 1,
1.538013, -0.3921391, -0.8109196, 1, 1, 1, 1, 1,
1.546465, 0.5653519, 0.5151768, 1, 1, 1, 1, 1,
1.548075, -1.384282, 3.016283, 1, 1, 1, 1, 1,
1.560135, 0.27838, 2.736568, 1, 1, 1, 1, 1,
1.58503, 0.1066607, -1.267915, 1, 1, 1, 1, 1,
1.586081, 1.455753, -1.314834, 1, 1, 1, 1, 1,
1.598798, 0.9029313, 0.706953, 1, 1, 1, 1, 1,
1.600079, -1.587697, 0.5603525, 1, 1, 1, 1, 1,
1.600669, -0.3926193, 2.824043, 1, 1, 1, 1, 1,
1.612107, 0.515467, 1.324139, 1, 1, 1, 1, 1,
1.616569, -1.546914, 2.689912, 1, 1, 1, 1, 1,
1.620075, -0.5623254, 2.636856, 1, 1, 1, 1, 1,
1.631223, -1.477806, 3.088249, 1, 1, 1, 1, 1,
1.653083, 0.6306887, 1.762763, 1, 1, 1, 1, 1,
1.679279, -0.8135177, 1.400554, 1, 1, 1, 1, 1,
1.699169, 0.858692, 0.3517511, 0, 0, 1, 1, 1,
1.737221, 1.080347, 1.033977, 1, 0, 0, 1, 1,
1.768446, -1.085675, 2.603827, 1, 0, 0, 1, 1,
1.775027, -0.6239732, 2.321894, 1, 0, 0, 1, 1,
1.805642, 1.595516, 0.693083, 1, 0, 0, 1, 1,
1.837105, -0.218785, 1.71798, 1, 0, 0, 1, 1,
1.844775, -0.9952853, 2.690634, 0, 0, 0, 1, 1,
1.845718, 1.160103, 0.613196, 0, 0, 0, 1, 1,
1.879247, 1.2887, 1.733385, 0, 0, 0, 1, 1,
1.882036, 0.0545431, 1.576596, 0, 0, 0, 1, 1,
1.906956, 1.055083, 0.2604285, 0, 0, 0, 1, 1,
1.924582, -0.09136131, 1.261463, 0, 0, 0, 1, 1,
1.928834, 2.225378, 2.968775, 0, 0, 0, 1, 1,
1.952304, 0.00920302, 1.121475, 1, 1, 1, 1, 1,
1.974767, 1.251272, 1.858588, 1, 1, 1, 1, 1,
1.99478, -0.8791887, 2.574758, 1, 1, 1, 1, 1,
2.027674, -0.2543862, 2.080597, 1, 1, 1, 1, 1,
2.063691, -0.06848815, 2.148005, 1, 1, 1, 1, 1,
2.079934, 1.178095, 2.837256, 1, 1, 1, 1, 1,
2.086307, -0.5760658, 1.791053, 1, 1, 1, 1, 1,
2.100068, -0.07346162, 1.196592, 1, 1, 1, 1, 1,
2.135532, 0.08657992, 1.61075, 1, 1, 1, 1, 1,
2.153379, -0.7032076, 1.484884, 1, 1, 1, 1, 1,
2.153551, 0.6162198, 0.5342678, 1, 1, 1, 1, 1,
2.170703, -0.1639374, 1.609202, 1, 1, 1, 1, 1,
2.173905, 0.1220714, 0.6894295, 1, 1, 1, 1, 1,
2.183926, -0.03443791, 1.95074, 1, 1, 1, 1, 1,
2.18855, -0.944267, 1.640195, 1, 1, 1, 1, 1,
2.203779, -0.3186868, 4.063432, 0, 0, 1, 1, 1,
2.205743, 0.8376485, 1.366431, 1, 0, 0, 1, 1,
2.212761, 0.04952943, 1.653362, 1, 0, 0, 1, 1,
2.279799, 0.1002852, 0.9672347, 1, 0, 0, 1, 1,
2.282251, 0.1324531, 2.289114, 1, 0, 0, 1, 1,
2.303381, 1.794392, 2.076578, 1, 0, 0, 1, 1,
2.355691, -0.5654899, 1.33211, 0, 0, 0, 1, 1,
2.389275, 0.8384718, 1.07109, 0, 0, 0, 1, 1,
2.394751, -0.7739415, 1.030024, 0, 0, 0, 1, 1,
2.501473, 0.9193294, 1.35615, 0, 0, 0, 1, 1,
2.510735, 1.08926, 1.306201, 0, 0, 0, 1, 1,
2.535847, 0.6658999, 0.7709771, 0, 0, 0, 1, 1,
2.599094, -0.2418713, -0.6047992, 0, 0, 0, 1, 1,
2.652474, -0.04798371, 3.095609, 1, 1, 1, 1, 1,
2.692842, -1.556009, 2.307657, 1, 1, 1, 1, 1,
2.75838, -0.8960154, 2.295266, 1, 1, 1, 1, 1,
2.782916, -2.930645, 2.368813, 1, 1, 1, 1, 1,
2.957355, -1.406064, 0.7795308, 1, 1, 1, 1, 1,
3.196881, -1.085612, 2.309849, 1, 1, 1, 1, 1,
3.252668, -0.6419749, 0.5604444, 1, 1, 1, 1, 1
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
var radius = 9.404499;
var distance = 33.0329;
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
mvMatrix.translate( -0.05250454, 0.05784202, -0.02233672 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.0329);
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
