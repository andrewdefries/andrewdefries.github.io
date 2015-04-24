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
-3.030143, 0.2979897, -2.070349, 1, 0, 0, 1,
-2.896452, 1.667344, 0.1807424, 1, 0.007843138, 0, 1,
-2.769485, 0.04571099, -2.978263, 1, 0.01176471, 0, 1,
-2.725401, 0.5125579, -1.300843, 1, 0.01960784, 0, 1,
-2.647734, -1.551663, -3.120363, 1, 0.02352941, 0, 1,
-2.513912, -0.7802402, -2.636735, 1, 0.03137255, 0, 1,
-2.487681, -0.2267155, -2.60366, 1, 0.03529412, 0, 1,
-2.467745, 0.6149942, 0.4798209, 1, 0.04313726, 0, 1,
-2.364357, -0.07705141, -0.7723624, 1, 0.04705882, 0, 1,
-2.35435, 0.3843592, -2.241675, 1, 0.05490196, 0, 1,
-2.350912, 1.505971, 0.3378496, 1, 0.05882353, 0, 1,
-2.329069, -1.005703, -2.290389, 1, 0.06666667, 0, 1,
-2.205153, 0.4075017, -1.465376, 1, 0.07058824, 0, 1,
-2.053443, 0.5496552, -2.134404, 1, 0.07843138, 0, 1,
-2.026347, -0.07728255, -1.912589, 1, 0.08235294, 0, 1,
-1.972396, -1.138173, -2.085609, 1, 0.09019608, 0, 1,
-1.968254, 0.1169976, -0.5717955, 1, 0.09411765, 0, 1,
-1.959944, 3.092118, -0.1214669, 1, 0.1019608, 0, 1,
-1.926206, -0.1833256, -0.62897, 1, 0.1098039, 0, 1,
-1.911903, 0.277242, -0.8734279, 1, 0.1137255, 0, 1,
-1.897653, 0.3178864, -0.940201, 1, 0.1215686, 0, 1,
-1.893531, -0.1969237, -0.3223691, 1, 0.1254902, 0, 1,
-1.836766, -1.461051, -1.780761, 1, 0.1333333, 0, 1,
-1.782237, 1.820841, -1.246731, 1, 0.1372549, 0, 1,
-1.779131, 0.3938301, -0.9667845, 1, 0.145098, 0, 1,
-1.764049, -1.057124, -3.462092, 1, 0.1490196, 0, 1,
-1.758677, 1.205306, -1.427666, 1, 0.1568628, 0, 1,
-1.755767, -1.940176, -3.124749, 1, 0.1607843, 0, 1,
-1.725888, 1.41638, -1.793393, 1, 0.1686275, 0, 1,
-1.713225, -1.105032, -0.967893, 1, 0.172549, 0, 1,
-1.707197, 0.1429129, -0.4078112, 1, 0.1803922, 0, 1,
-1.702723, 0.4516548, 1.225068, 1, 0.1843137, 0, 1,
-1.69401, 1.543454, -0.8919873, 1, 0.1921569, 0, 1,
-1.691264, 0.06419118, -2.260139, 1, 0.1960784, 0, 1,
-1.686939, -0.1921354, 1.671028, 1, 0.2039216, 0, 1,
-1.68105, 1.178929, -0.3620115, 1, 0.2117647, 0, 1,
-1.679001, -1.560869, -4.408547, 1, 0.2156863, 0, 1,
-1.658174, 0.1160517, -0.8485066, 1, 0.2235294, 0, 1,
-1.649732, 1.561392, -0.4615429, 1, 0.227451, 0, 1,
-1.643442, 0.4093117, 0.7676683, 1, 0.2352941, 0, 1,
-1.630034, -1.633663, -1.438439, 1, 0.2392157, 0, 1,
-1.599981, 0.5601953, 0.6557537, 1, 0.2470588, 0, 1,
-1.593076, -0.7282219, -1.434092, 1, 0.2509804, 0, 1,
-1.593017, -0.1118614, -3.358809, 1, 0.2588235, 0, 1,
-1.583624, -1.964823, -3.174784, 1, 0.2627451, 0, 1,
-1.576748, -0.3651086, -3.431215, 1, 0.2705882, 0, 1,
-1.569793, -0.9492947, -1.75564, 1, 0.2745098, 0, 1,
-1.543521, -0.2341791, -2.499258, 1, 0.282353, 0, 1,
-1.523824, -1.055648, -1.327786, 1, 0.2862745, 0, 1,
-1.501883, -0.06253068, -0.9586159, 1, 0.2941177, 0, 1,
-1.499352, 0.3537579, -1.642591, 1, 0.3019608, 0, 1,
-1.488387, 0.2283479, -0.6195003, 1, 0.3058824, 0, 1,
-1.481402, -0.6877263, -2.656898, 1, 0.3137255, 0, 1,
-1.477762, 0.252237, 0.1696514, 1, 0.3176471, 0, 1,
-1.476567, -0.4980417, -1.49608, 1, 0.3254902, 0, 1,
-1.474676, -0.5209217, -2.886495, 1, 0.3294118, 0, 1,
-1.474499, -0.07992376, 0.392592, 1, 0.3372549, 0, 1,
-1.471952, -1.47882, -2.213185, 1, 0.3411765, 0, 1,
-1.46412, 0.3052564, -2.753138, 1, 0.3490196, 0, 1,
-1.450394, 0.4089526, -4.413971, 1, 0.3529412, 0, 1,
-1.44846, 0.6092898, -0.8218938, 1, 0.3607843, 0, 1,
-1.433927, -0.7952935, -2.605337, 1, 0.3647059, 0, 1,
-1.425734, -0.5291536, -2.206766, 1, 0.372549, 0, 1,
-1.425575, 0.8727683, -2.045508, 1, 0.3764706, 0, 1,
-1.423782, 0.9053701, -1.797532, 1, 0.3843137, 0, 1,
-1.420666, 0.5200284, -0.9553344, 1, 0.3882353, 0, 1,
-1.411212, -0.04998225, -3.121974, 1, 0.3960784, 0, 1,
-1.402798, -1.810815, -4.926331, 1, 0.4039216, 0, 1,
-1.401793, -0.9121778, -2.335607, 1, 0.4078431, 0, 1,
-1.398645, -1.033103, -3.970386, 1, 0.4156863, 0, 1,
-1.39737, -0.4899921, -3.257198, 1, 0.4196078, 0, 1,
-1.393865, -0.3851374, -1.081456, 1, 0.427451, 0, 1,
-1.388956, 1.802658, -0.1323055, 1, 0.4313726, 0, 1,
-1.37497, -0.08046541, -1.392307, 1, 0.4392157, 0, 1,
-1.367546, -0.7252039, -1.687651, 1, 0.4431373, 0, 1,
-1.36572, 0.9217659, -1.482558, 1, 0.4509804, 0, 1,
-1.359595, -0.02913318, -1.873531, 1, 0.454902, 0, 1,
-1.329947, 0.1296639, -0.2673672, 1, 0.4627451, 0, 1,
-1.322616, -0.1578516, -0.4845726, 1, 0.4666667, 0, 1,
-1.320544, 0.7863217, -2.11492, 1, 0.4745098, 0, 1,
-1.293013, -0.8422089, -2.3662, 1, 0.4784314, 0, 1,
-1.271973, -1.590729, -2.714554, 1, 0.4862745, 0, 1,
-1.261899, -0.573588, -3.910209, 1, 0.4901961, 0, 1,
-1.259546, -0.4560477, -0.893996, 1, 0.4980392, 0, 1,
-1.248509, 0.1673697, -0.4369135, 1, 0.5058824, 0, 1,
-1.233184, 1.45364, -0.3953961, 1, 0.509804, 0, 1,
-1.232394, 0.8572245, -0.9156923, 1, 0.5176471, 0, 1,
-1.20439, 1.064158, -1.152126, 1, 0.5215687, 0, 1,
-1.201383, 0.1539548, -1.383642, 1, 0.5294118, 0, 1,
-1.200679, 0.8790375, -0.0995867, 1, 0.5333334, 0, 1,
-1.1995, -0.8256937, -1.439691, 1, 0.5411765, 0, 1,
-1.19507, -0.6326003, -1.518469, 1, 0.5450981, 0, 1,
-1.19207, -0.3497619, -1.845911, 1, 0.5529412, 0, 1,
-1.18714, 1.014172, -0.3521784, 1, 0.5568628, 0, 1,
-1.17963, 1.077302, -2.705288, 1, 0.5647059, 0, 1,
-1.174234, 0.08515207, -1.696229, 1, 0.5686275, 0, 1,
-1.170319, 0.1986477, -1.976886, 1, 0.5764706, 0, 1,
-1.161385, -0.3217488, -1.200005, 1, 0.5803922, 0, 1,
-1.151477, -1.223402, -1.411699, 1, 0.5882353, 0, 1,
-1.14757, -1.184103, -1.2618, 1, 0.5921569, 0, 1,
-1.145454, 0.2664863, -1.199378, 1, 0.6, 0, 1,
-1.141703, 0.79943, 0.4074463, 1, 0.6078432, 0, 1,
-1.140499, 0.1757336, -2.868834, 1, 0.6117647, 0, 1,
-1.137369, 0.6718541, -0.6523028, 1, 0.6196079, 0, 1,
-1.136445, 0.4540365, -0.6285784, 1, 0.6235294, 0, 1,
-1.135429, -3.495344, -2.073072, 1, 0.6313726, 0, 1,
-1.126333, -1.647505, -3.47522, 1, 0.6352941, 0, 1,
-1.123096, 0.6227002, -1.086623, 1, 0.6431373, 0, 1,
-1.114321, 0.1642305, -1.467486, 1, 0.6470588, 0, 1,
-1.114138, -1.459095, -0.768608, 1, 0.654902, 0, 1,
-1.106487, -0.7701967, -0.5194218, 1, 0.6588235, 0, 1,
-1.09074, 0.6100796, -2.582029, 1, 0.6666667, 0, 1,
-1.089888, 1.653171, -0.2676554, 1, 0.6705883, 0, 1,
-1.087881, -0.8330215, 0.0264241, 1, 0.6784314, 0, 1,
-1.084454, 0.8156332, -3.298262, 1, 0.682353, 0, 1,
-1.08174, -0.7561458, -3.314468, 1, 0.6901961, 0, 1,
-1.080203, -0.4843005, -1.773489, 1, 0.6941177, 0, 1,
-1.077661, 1.881283, 0.5875835, 1, 0.7019608, 0, 1,
-1.077094, -0.1849975, -2.463539, 1, 0.7098039, 0, 1,
-1.068976, -0.1782453, -1.168177, 1, 0.7137255, 0, 1,
-1.0684, -0.8951505, -2.362706, 1, 0.7215686, 0, 1,
-1.067575, 1.075215, -0.6843974, 1, 0.7254902, 0, 1,
-1.06692, 0.6068844, -1.636052, 1, 0.7333333, 0, 1,
-1.066875, 0.5510665, -0.9214336, 1, 0.7372549, 0, 1,
-1.065269, 1.259211, -0.5551944, 1, 0.7450981, 0, 1,
-1.064662, -1.942349, -5.328296, 1, 0.7490196, 0, 1,
-1.051881, 0.5029011, -1.035463, 1, 0.7568628, 0, 1,
-1.051823, -1.523121, 0.659143, 1, 0.7607843, 0, 1,
-1.048303, 1.305235, -0.2055936, 1, 0.7686275, 0, 1,
-1.040719, 0.2722879, -0.9196299, 1, 0.772549, 0, 1,
-1.034122, 1.933254, -0.6652501, 1, 0.7803922, 0, 1,
-1.029095, 1.017847, -0.7938633, 1, 0.7843137, 0, 1,
-1.029006, 0.7574433, 0.8809792, 1, 0.7921569, 0, 1,
-1.025632, 0.2001479, -0.3248395, 1, 0.7960784, 0, 1,
-1.010118, 0.1062769, -1.098867, 1, 0.8039216, 0, 1,
-1.008928, -0.3521268, -2.185607, 1, 0.8117647, 0, 1,
-1.007456, -0.3397843, -3.757427, 1, 0.8156863, 0, 1,
-1.006824, 0.03132361, -1.862349, 1, 0.8235294, 0, 1,
-1.006018, 0.7932322, 0.05446409, 1, 0.827451, 0, 1,
-0.9826351, -0.2775223, -3.820028, 1, 0.8352941, 0, 1,
-0.9548275, 0.03866941, -2.002423, 1, 0.8392157, 0, 1,
-0.9540924, 0.2519954, -1.276486, 1, 0.8470588, 0, 1,
-0.9526245, -0.2483056, -1.335946, 1, 0.8509804, 0, 1,
-0.9495429, -0.2038579, -3.047467, 1, 0.8588235, 0, 1,
-0.9470626, 0.6233146, -0.6945252, 1, 0.8627451, 0, 1,
-0.9417523, 0.1806497, -3.214323, 1, 0.8705882, 0, 1,
-0.9384368, -0.772622, -2.780349, 1, 0.8745098, 0, 1,
-0.9384125, 1.301487, -2.360552, 1, 0.8823529, 0, 1,
-0.9361864, -0.470115, -2.234624, 1, 0.8862745, 0, 1,
-0.9355312, 0.3421358, -0.8236748, 1, 0.8941177, 0, 1,
-0.9327884, -0.3879381, -1.165077, 1, 0.8980392, 0, 1,
-0.9271894, 0.216348, -1.084472, 1, 0.9058824, 0, 1,
-0.9253794, 0.4922272, -1.931411, 1, 0.9137255, 0, 1,
-0.9174815, -1.068567, -1.894346, 1, 0.9176471, 0, 1,
-0.9158942, -0.6104148, -2.649467, 1, 0.9254902, 0, 1,
-0.9133764, -0.5021538, -2.75865, 1, 0.9294118, 0, 1,
-0.9105076, 0.01482346, -0.7855224, 1, 0.9372549, 0, 1,
-0.9067629, -0.8742244, -2.488154, 1, 0.9411765, 0, 1,
-0.9024473, -0.8786435, -3.344958, 1, 0.9490196, 0, 1,
-0.8990178, -2.760412, -3.265248, 1, 0.9529412, 0, 1,
-0.8984953, 0.5212323, -3.060326, 1, 0.9607843, 0, 1,
-0.8934172, 0.6401877, -0.9176021, 1, 0.9647059, 0, 1,
-0.8933626, 0.5278924, -0.6092631, 1, 0.972549, 0, 1,
-0.8861502, 0.05216859, -3.091759, 1, 0.9764706, 0, 1,
-0.8856493, 1.226686, -0.3601689, 1, 0.9843137, 0, 1,
-0.8830602, -0.06895929, -2.450541, 1, 0.9882353, 0, 1,
-0.8810099, -0.2017089, -1.731712, 1, 0.9960784, 0, 1,
-0.8800449, 0.8162464, -2.020377, 0.9960784, 1, 0, 1,
-0.8794149, -1.332323, -3.353542, 0.9921569, 1, 0, 1,
-0.8745701, 0.07667663, -0.4884301, 0.9843137, 1, 0, 1,
-0.871334, 0.1224037, -2.33244, 0.9803922, 1, 0, 1,
-0.8712226, -0.5548143, -0.8857023, 0.972549, 1, 0, 1,
-0.861494, 1.533564, 0.9365022, 0.9686275, 1, 0, 1,
-0.8577513, 0.07634743, -0.7045248, 0.9607843, 1, 0, 1,
-0.8552528, 1.572256, 0.06849054, 0.9568627, 1, 0, 1,
-0.8534397, 1.66125, -0.1736315, 0.9490196, 1, 0, 1,
-0.8479985, 0.2503969, -1.167018, 0.945098, 1, 0, 1,
-0.8452341, 1.789454, -0.4620623, 0.9372549, 1, 0, 1,
-0.843193, 0.2484271, -0.1913138, 0.9333333, 1, 0, 1,
-0.842711, 1.625513, -1.408766, 0.9254902, 1, 0, 1,
-0.8367861, -0.01421721, -1.7592, 0.9215686, 1, 0, 1,
-0.8318528, -0.5488406, -0.7168372, 0.9137255, 1, 0, 1,
-0.8206697, 1.026698, 1.097031, 0.9098039, 1, 0, 1,
-0.8191242, -0.5902384, -3.21431, 0.9019608, 1, 0, 1,
-0.815176, 0.3160071, -0.8511496, 0.8941177, 1, 0, 1,
-0.8131214, -1.190522, -0.8559083, 0.8901961, 1, 0, 1,
-0.8126898, -0.540192, -2.221308, 0.8823529, 1, 0, 1,
-0.811816, 0.286179, 1.503358, 0.8784314, 1, 0, 1,
-0.8101119, 0.01704041, -1.83761, 0.8705882, 1, 0, 1,
-0.8023396, -0.3188488, -0.3558691, 0.8666667, 1, 0, 1,
-0.8011637, -1.565001, -1.958831, 0.8588235, 1, 0, 1,
-0.7994294, -0.6163352, -2.14044, 0.854902, 1, 0, 1,
-0.7911853, -0.5406769, -2.454592, 0.8470588, 1, 0, 1,
-0.788057, -0.2054325, -1.812014, 0.8431373, 1, 0, 1,
-0.7879423, -0.8658912, -3.043781, 0.8352941, 1, 0, 1,
-0.7850209, -1.339695, -3.622632, 0.8313726, 1, 0, 1,
-0.7755361, -0.8854975, -1.884376, 0.8235294, 1, 0, 1,
-0.7734622, 1.74597, 1.143003, 0.8196079, 1, 0, 1,
-0.7662597, 1.274764, -1.607983, 0.8117647, 1, 0, 1,
-0.764328, -0.5936143, -1.234218, 0.8078431, 1, 0, 1,
-0.7628711, 1.200407, -1.18927, 0.8, 1, 0, 1,
-0.7605373, 0.5456467, -1.694907, 0.7921569, 1, 0, 1,
-0.7595036, -0.5117953, -1.85918, 0.7882353, 1, 0, 1,
-0.7530515, -0.03689619, -2.981952, 0.7803922, 1, 0, 1,
-0.7511339, 0.7246912, -0.9248592, 0.7764706, 1, 0, 1,
-0.7464945, 1.766483, -1.100167, 0.7686275, 1, 0, 1,
-0.7424767, 2.090635, -0.07558384, 0.7647059, 1, 0, 1,
-0.7379889, -0.5436072, -1.140883, 0.7568628, 1, 0, 1,
-0.73745, 0.4676562, -0.9404657, 0.7529412, 1, 0, 1,
-0.7334576, -0.1939272, -1.872675, 0.7450981, 1, 0, 1,
-0.7329862, 1.160046, -0.1116671, 0.7411765, 1, 0, 1,
-0.7304949, -1.2932, -3.044366, 0.7333333, 1, 0, 1,
-0.7304832, 1.213259, 0.9452361, 0.7294118, 1, 0, 1,
-0.7249994, -0.4952609, -1.544913, 0.7215686, 1, 0, 1,
-0.7234852, 0.8654273, -0.5761946, 0.7176471, 1, 0, 1,
-0.7183121, 0.8908911, -3.404648, 0.7098039, 1, 0, 1,
-0.7166457, -0.7353804, -1.370443, 0.7058824, 1, 0, 1,
-0.7165934, 0.5459539, -0.8378378, 0.6980392, 1, 0, 1,
-0.7142019, -0.07931636, -1.393018, 0.6901961, 1, 0, 1,
-0.7130279, -0.9249734, -2.403256, 0.6862745, 1, 0, 1,
-0.7056672, -1.204097, -1.763229, 0.6784314, 1, 0, 1,
-0.702931, 0.7306373, -0.3292771, 0.6745098, 1, 0, 1,
-0.699663, -1.717587, -3.105877, 0.6666667, 1, 0, 1,
-0.6981725, -0.1126854, -2.823919, 0.6627451, 1, 0, 1,
-0.679853, -0.423015, -4.017641, 0.654902, 1, 0, 1,
-0.6767913, -1.581309, -4.304684, 0.6509804, 1, 0, 1,
-0.6755304, -0.2159462, -1.394701, 0.6431373, 1, 0, 1,
-0.6753343, 0.2989221, -1.268286, 0.6392157, 1, 0, 1,
-0.6740893, 1.690975, 0.0384941, 0.6313726, 1, 0, 1,
-0.6740133, 0.7426677, -0.9167694, 0.627451, 1, 0, 1,
-0.6692171, -1.048292, 0.3685502, 0.6196079, 1, 0, 1,
-0.6617373, 0.05389858, -2.950548, 0.6156863, 1, 0, 1,
-0.6587584, 0.2940139, -2.01445, 0.6078432, 1, 0, 1,
-0.6574867, -0.02272167, 0.286213, 0.6039216, 1, 0, 1,
-0.6551161, -0.747825, -3.811152, 0.5960785, 1, 0, 1,
-0.6514528, -0.25046, -4.759336, 0.5882353, 1, 0, 1,
-0.6484616, 0.3936912, -1.55004, 0.5843138, 1, 0, 1,
-0.6423907, -0.6837458, -1.006919, 0.5764706, 1, 0, 1,
-0.6395758, -0.3195496, -2.215554, 0.572549, 1, 0, 1,
-0.6385874, 0.9349288, 0.7362403, 0.5647059, 1, 0, 1,
-0.6376609, -2.249744, -3.075938, 0.5607843, 1, 0, 1,
-0.6371092, -0.8293552, -1.357794, 0.5529412, 1, 0, 1,
-0.6340281, 2.686418, -1.577219, 0.5490196, 1, 0, 1,
-0.6313394, -0.6571794, -1.149799, 0.5411765, 1, 0, 1,
-0.6264981, -0.2042381, -2.32808, 0.5372549, 1, 0, 1,
-0.6260632, -1.101834, -2.877509, 0.5294118, 1, 0, 1,
-0.6257331, -0.8119287, -4.002219, 0.5254902, 1, 0, 1,
-0.6188667, 0.5227093, -0.4845776, 0.5176471, 1, 0, 1,
-0.6168403, 0.5694625, -0.9829617, 0.5137255, 1, 0, 1,
-0.6148762, 1.603177, -0.1841337, 0.5058824, 1, 0, 1,
-0.6136445, -0.4130035, -1.442752, 0.5019608, 1, 0, 1,
-0.61075, 1.205424, 0.1933639, 0.4941176, 1, 0, 1,
-0.6102091, 0.8081369, -1.542825, 0.4862745, 1, 0, 1,
-0.606161, 1.175961, 0.2328862, 0.4823529, 1, 0, 1,
-0.6031384, -0.9584379, -1.99464, 0.4745098, 1, 0, 1,
-0.6021003, 0.3151236, 0.2937368, 0.4705882, 1, 0, 1,
-0.5995977, 0.04025211, 1.10083, 0.4627451, 1, 0, 1,
-0.5982547, -2.878422, -3.753873, 0.4588235, 1, 0, 1,
-0.5960586, -1.25269, -3.661112, 0.4509804, 1, 0, 1,
-0.5956488, -0.4341171, -2.619048, 0.4470588, 1, 0, 1,
-0.5890619, 0.2745652, -0.4886174, 0.4392157, 1, 0, 1,
-0.5871506, -0.4879737, -2.882096, 0.4352941, 1, 0, 1,
-0.577855, 0.9918737, -0.3692973, 0.427451, 1, 0, 1,
-0.5770071, -0.3715519, -1.414991, 0.4235294, 1, 0, 1,
-0.575643, 1.095759, 0.1746105, 0.4156863, 1, 0, 1,
-0.572301, -0.695466, -1.101779, 0.4117647, 1, 0, 1,
-0.5721779, 0.226819, -1.460383, 0.4039216, 1, 0, 1,
-0.5673889, 0.8872876, -1.444964, 0.3960784, 1, 0, 1,
-0.5670693, 0.9729455, 0.3814512, 0.3921569, 1, 0, 1,
-0.563356, -1.942154, -2.756132, 0.3843137, 1, 0, 1,
-0.5606354, -0.3733386, -3.333082, 0.3803922, 1, 0, 1,
-0.5533916, -2.077163, -1.182345, 0.372549, 1, 0, 1,
-0.5521483, 0.4781879, 0.4357724, 0.3686275, 1, 0, 1,
-0.5515772, 0.6034229, -1.413248, 0.3607843, 1, 0, 1,
-0.5379252, -1.722747, -3.353279, 0.3568628, 1, 0, 1,
-0.5356917, 0.310575, -0.9310872, 0.3490196, 1, 0, 1,
-0.5341622, 0.993116, -0.7193615, 0.345098, 1, 0, 1,
-0.5336619, 0.5731142, -0.08569928, 0.3372549, 1, 0, 1,
-0.5306537, 0.05960273, -1.648926, 0.3333333, 1, 0, 1,
-0.5306129, 0.8831258, -1.498029, 0.3254902, 1, 0, 1,
-0.5252711, 1.506276, 0.1365842, 0.3215686, 1, 0, 1,
-0.5203617, -1.012033, -3.740264, 0.3137255, 1, 0, 1,
-0.5188308, -0.1161561, -1.976882, 0.3098039, 1, 0, 1,
-0.5084085, 0.1464195, -0.9315799, 0.3019608, 1, 0, 1,
-0.50837, -0.1795685, -1.875508, 0.2941177, 1, 0, 1,
-0.5079595, 1.605319, 0.889662, 0.2901961, 1, 0, 1,
-0.5065639, 1.485222, -1.636596, 0.282353, 1, 0, 1,
-0.5054926, -0.7794721, -2.20966, 0.2784314, 1, 0, 1,
-0.5027015, -0.9292788, -2.465021, 0.2705882, 1, 0, 1,
-0.4958559, 0.1624714, -3.188813, 0.2666667, 1, 0, 1,
-0.4925991, 1.461233, 0.6595553, 0.2588235, 1, 0, 1,
-0.4917386, -0.0921544, -1.442952, 0.254902, 1, 0, 1,
-0.486755, 0.1085232, -1.163907, 0.2470588, 1, 0, 1,
-0.480992, 0.09788478, -1.231135, 0.2431373, 1, 0, 1,
-0.477845, 0.8360726, -0.2185615, 0.2352941, 1, 0, 1,
-0.4778056, -2.120582, -1.802463, 0.2313726, 1, 0, 1,
-0.4765211, 0.1449722, -0.8212625, 0.2235294, 1, 0, 1,
-0.476489, 0.1873967, 0.04847895, 0.2196078, 1, 0, 1,
-0.4721121, -0.7783298, -2.89868, 0.2117647, 1, 0, 1,
-0.4720812, -0.2052639, -3.381534, 0.2078431, 1, 0, 1,
-0.4708519, 0.3455938, -0.6308574, 0.2, 1, 0, 1,
-0.4696063, 0.08694584, -0.04544359, 0.1921569, 1, 0, 1,
-0.4684086, 1.524235, -0.8012327, 0.1882353, 1, 0, 1,
-0.4631539, -0.525934, -3.389646, 0.1803922, 1, 0, 1,
-0.4625709, 0.9339435, -0.7495342, 0.1764706, 1, 0, 1,
-0.4594062, 1.300252, -1.881798, 0.1686275, 1, 0, 1,
-0.4582888, -0.03684846, -0.6095777, 0.1647059, 1, 0, 1,
-0.4560036, -1.013822, -2.96804, 0.1568628, 1, 0, 1,
-0.4498042, -1.322821, -3.375814, 0.1529412, 1, 0, 1,
-0.4491739, 0.9099803, -0.8971902, 0.145098, 1, 0, 1,
-0.4489486, -1.507956, -3.943143, 0.1411765, 1, 0, 1,
-0.4485616, -0.5327352, -1.792324, 0.1333333, 1, 0, 1,
-0.443983, 0.2703231, -0.8823546, 0.1294118, 1, 0, 1,
-0.4422523, -0.2405416, -0.9792868, 0.1215686, 1, 0, 1,
-0.4403875, -0.8730356, -1.371249, 0.1176471, 1, 0, 1,
-0.4398987, -0.4002179, -2.847397, 0.1098039, 1, 0, 1,
-0.4398527, -0.6159456, -2.072999, 0.1058824, 1, 0, 1,
-0.439418, -0.7458714, -4.225379, 0.09803922, 1, 0, 1,
-0.4386045, 0.4270983, -0.1986964, 0.09019608, 1, 0, 1,
-0.4369091, 1.505757, 0.1614105, 0.08627451, 1, 0, 1,
-0.4356972, 0.5833685, -0.8331894, 0.07843138, 1, 0, 1,
-0.4352973, -2.093328, -2.815768, 0.07450981, 1, 0, 1,
-0.4350955, 1.64423, 1.439576, 0.06666667, 1, 0, 1,
-0.4298315, 0.2376992, -1.63093, 0.0627451, 1, 0, 1,
-0.4292395, -0.04231662, -0.7047393, 0.05490196, 1, 0, 1,
-0.4287367, 2.022016, -0.6307628, 0.05098039, 1, 0, 1,
-0.4258883, -0.8765749, -4.23361, 0.04313726, 1, 0, 1,
-0.4239768, -0.7905137, -1.788265, 0.03921569, 1, 0, 1,
-0.4226924, 0.9700075, -2.059151, 0.03137255, 1, 0, 1,
-0.4218442, -0.4882477, -2.15793, 0.02745098, 1, 0, 1,
-0.419498, -0.1399319, -1.154222, 0.01960784, 1, 0, 1,
-0.4187282, -1.737939, -2.783586, 0.01568628, 1, 0, 1,
-0.4173496, -0.8787665, -3.968419, 0.007843138, 1, 0, 1,
-0.4167957, 0.0882277, -1.434057, 0.003921569, 1, 0, 1,
-0.4129767, 1.036235, -1.514107, 0, 1, 0.003921569, 1,
-0.4126296, 0.1565548, -0.2365015, 0, 1, 0.01176471, 1,
-0.4092288, -0.120859, -1.896017, 0, 1, 0.01568628, 1,
-0.4047546, 1.01346, -0.8182029, 0, 1, 0.02352941, 1,
-0.4006505, -0.06181171, -2.712023, 0, 1, 0.02745098, 1,
-0.3984109, 0.7295745, 0.4512934, 0, 1, 0.03529412, 1,
-0.3976801, -0.1573272, -2.133595, 0, 1, 0.03921569, 1,
-0.3945996, -0.0386865, -1.038778, 0, 1, 0.04705882, 1,
-0.39371, -2.750429, -2.055566, 0, 1, 0.05098039, 1,
-0.3931557, -0.3309895, -2.860568, 0, 1, 0.05882353, 1,
-0.3891812, 1.604435, -0.5474629, 0, 1, 0.0627451, 1,
-0.3878994, -0.6719109, -1.165619, 0, 1, 0.07058824, 1,
-0.3872791, -1.310149, -3.385221, 0, 1, 0.07450981, 1,
-0.3871767, -0.6395046, -2.982015, 0, 1, 0.08235294, 1,
-0.3806916, 0.280484, 0.1939267, 0, 1, 0.08627451, 1,
-0.3701497, 0.5835471, -0.4933439, 0, 1, 0.09411765, 1,
-0.36845, 0.3622845, -1.971617, 0, 1, 0.1019608, 1,
-0.3677061, -0.939004, -2.04645, 0, 1, 0.1058824, 1,
-0.3668179, 1.151557, -1.108203, 0, 1, 0.1137255, 1,
-0.3661115, -0.9973484, -4.153563, 0, 1, 0.1176471, 1,
-0.3582881, -1.140294, -3.161122, 0, 1, 0.1254902, 1,
-0.3580546, 1.572756, -1.329301, 0, 1, 0.1294118, 1,
-0.3554569, 0.3982514, -0.3811581, 0, 1, 0.1372549, 1,
-0.3513224, -0.9944209, -2.73368, 0, 1, 0.1411765, 1,
-0.3476231, 1.244931, -2.195676, 0, 1, 0.1490196, 1,
-0.3474688, -0.6108415, -1.080311, 0, 1, 0.1529412, 1,
-0.3463406, -0.5781945, -2.590256, 0, 1, 0.1607843, 1,
-0.3423938, -0.8309543, -3.033912, 0, 1, 0.1647059, 1,
-0.3418312, 0.6813744, -0.6285555, 0, 1, 0.172549, 1,
-0.3386785, 0.4669895, -2.132272, 0, 1, 0.1764706, 1,
-0.3351661, 1.074894, -0.01862259, 0, 1, 0.1843137, 1,
-0.3328419, 0.04224136, -0.7462904, 0, 1, 0.1882353, 1,
-0.3319091, -0.9556613, -2.369301, 0, 1, 0.1960784, 1,
-0.3271345, 1.106144, -0.6730536, 0, 1, 0.2039216, 1,
-0.3220136, 0.06029627, -2.844024, 0, 1, 0.2078431, 1,
-0.3203545, 1.02425, -0.8503618, 0, 1, 0.2156863, 1,
-0.316499, -0.550341, -2.145111, 0, 1, 0.2196078, 1,
-0.3161926, -0.4916443, -3.36068, 0, 1, 0.227451, 1,
-0.3148436, -1.125771, -1.133301, 0, 1, 0.2313726, 1,
-0.3137473, -1.119206, -1.986567, 0, 1, 0.2392157, 1,
-0.3102279, -0.7612618, -3.232035, 0, 1, 0.2431373, 1,
-0.3095661, 0.8695581, -0.515527, 0, 1, 0.2509804, 1,
-0.3095596, 1.948864, -0.009733386, 0, 1, 0.254902, 1,
-0.3070076, -1.194372, -2.891239, 0, 1, 0.2627451, 1,
-0.2968959, 0.2441545, -2.561314, 0, 1, 0.2666667, 1,
-0.2946315, 0.3020519, -0.4160024, 0, 1, 0.2745098, 1,
-0.291014, -0.3926058, -2.281148, 0, 1, 0.2784314, 1,
-0.2880644, 0.5082852, -0.4821759, 0, 1, 0.2862745, 1,
-0.2868855, 0.3363164, -0.9756786, 0, 1, 0.2901961, 1,
-0.283833, -0.3076243, -1.680227, 0, 1, 0.2980392, 1,
-0.2818748, 0.5566406, 1.755059, 0, 1, 0.3058824, 1,
-0.2798402, -1.007478, -4.141915, 0, 1, 0.3098039, 1,
-0.2748229, 0.875762, -0.4252595, 0, 1, 0.3176471, 1,
-0.2733213, 0.112718, -3.141236, 0, 1, 0.3215686, 1,
-0.2725264, 0.8592096, 0.2783868, 0, 1, 0.3294118, 1,
-0.2715647, 0.02314304, -0.3244504, 0, 1, 0.3333333, 1,
-0.2694904, 0.7363522, -1.33571, 0, 1, 0.3411765, 1,
-0.2678036, 0.3269795, -1.459792, 0, 1, 0.345098, 1,
-0.263281, 1.743424, -1.563111, 0, 1, 0.3529412, 1,
-0.2592659, -0.4216682, -2.982133, 0, 1, 0.3568628, 1,
-0.2572619, -1.315817, -1.259541, 0, 1, 0.3647059, 1,
-0.2569221, 1.307282, 0.3493643, 0, 1, 0.3686275, 1,
-0.2509817, -0.8372321, -2.360267, 0, 1, 0.3764706, 1,
-0.2501209, -0.2967497, -4.410094, 0, 1, 0.3803922, 1,
-0.2476464, -1.258508, -1.950631, 0, 1, 0.3882353, 1,
-0.246994, -0.2519437, -2.52681, 0, 1, 0.3921569, 1,
-0.2466179, 0.5422015, -0.990533, 0, 1, 0.4, 1,
-0.2361134, -1.460977, -5.553584, 0, 1, 0.4078431, 1,
-0.2319953, -0.08964371, -2.480128, 0, 1, 0.4117647, 1,
-0.2304929, 0.6155882, -0.407951, 0, 1, 0.4196078, 1,
-0.2232315, -0.3145832, -4.76007, 0, 1, 0.4235294, 1,
-0.222524, 0.4195892, -1.620275, 0, 1, 0.4313726, 1,
-0.2208803, 0.4502487, -1.298197, 0, 1, 0.4352941, 1,
-0.2157628, 0.7894889, -1.158317, 0, 1, 0.4431373, 1,
-0.2049929, -0.9786228, -2.685368, 0, 1, 0.4470588, 1,
-0.2047416, 0.1212639, -1.748026, 0, 1, 0.454902, 1,
-0.2042287, -0.6289151, -4.124453, 0, 1, 0.4588235, 1,
-0.2028744, -1.009645, -4.441759, 0, 1, 0.4666667, 1,
-0.20179, -1.425148, -2.606294, 0, 1, 0.4705882, 1,
-0.1998056, -1.279526, -3.332498, 0, 1, 0.4784314, 1,
-0.1990546, -1.05507, -3.176616, 0, 1, 0.4823529, 1,
-0.1987656, -0.08626005, -1.340145, 0, 1, 0.4901961, 1,
-0.1986037, -0.01931976, -0.8381339, 0, 1, 0.4941176, 1,
-0.1969107, -0.3397741, -3.725843, 0, 1, 0.5019608, 1,
-0.1910738, 0.4355, 0.5342245, 0, 1, 0.509804, 1,
-0.1906387, -0.580284, -1.560871, 0, 1, 0.5137255, 1,
-0.1876532, 0.5335727, 0.5011512, 0, 1, 0.5215687, 1,
-0.1829755, 0.7392293, -1.685031, 0, 1, 0.5254902, 1,
-0.1803422, 1.026344, 0.215144, 0, 1, 0.5333334, 1,
-0.1764302, -1.620693, -3.915538, 0, 1, 0.5372549, 1,
-0.1755792, 1.373763, 0.4336863, 0, 1, 0.5450981, 1,
-0.1746481, -0.6532293, -3.009441, 0, 1, 0.5490196, 1,
-0.1742145, 0.6578996, 0.2889226, 0, 1, 0.5568628, 1,
-0.1724863, 1.477422, -0.6621025, 0, 1, 0.5607843, 1,
-0.1710128, 0.8087156, -2.027758, 0, 1, 0.5686275, 1,
-0.1518869, 0.882621, -0.1077863, 0, 1, 0.572549, 1,
-0.1511655, 1.15565, 0.8439178, 0, 1, 0.5803922, 1,
-0.1505385, -0.733907, -2.966434, 0, 1, 0.5843138, 1,
-0.150034, 0.1460788, -1.145116, 0, 1, 0.5921569, 1,
-0.149577, -0.3468699, -4.346637, 0, 1, 0.5960785, 1,
-0.1366884, -0.7496606, -4.093024, 0, 1, 0.6039216, 1,
-0.1339806, 1.103095, 0.08582201, 0, 1, 0.6117647, 1,
-0.1327379, 0.7145614, -1.546289, 0, 1, 0.6156863, 1,
-0.1304919, 0.3260609, -0.3684796, 0, 1, 0.6235294, 1,
-0.1304857, -0.6992056, -2.28568, 0, 1, 0.627451, 1,
-0.1301728, -1.280651, -3.340703, 0, 1, 0.6352941, 1,
-0.1284632, -0.9859915, -2.557914, 0, 1, 0.6392157, 1,
-0.1278529, 0.3962598, -0.8078411, 0, 1, 0.6470588, 1,
-0.1273978, -1.775213, -1.677828, 0, 1, 0.6509804, 1,
-0.1238394, 1.253449, -1.19702, 0, 1, 0.6588235, 1,
-0.1194305, -1.458725, -2.792234, 0, 1, 0.6627451, 1,
-0.1188648, 1.066634, -0.6990985, 0, 1, 0.6705883, 1,
-0.1150296, -0.2472437, -2.603816, 0, 1, 0.6745098, 1,
-0.1105561, 0.7659662, -0.3543328, 0, 1, 0.682353, 1,
-0.106622, -1.468634, -2.919827, 0, 1, 0.6862745, 1,
-0.101744, 0.2548008, -0.6073953, 0, 1, 0.6941177, 1,
-0.09051698, 1.269425, -1.509105, 0, 1, 0.7019608, 1,
-0.08596614, 0.6388569, 0.383012, 0, 1, 0.7058824, 1,
-0.08442158, -0.805455, -3.885748, 0, 1, 0.7137255, 1,
-0.08269101, 1.718751, -0.9498042, 0, 1, 0.7176471, 1,
-0.08198503, 1.395645, -0.7006848, 0, 1, 0.7254902, 1,
-0.07272174, -0.6578459, -5.69792, 0, 1, 0.7294118, 1,
-0.0725754, 1.461575, -1.332329, 0, 1, 0.7372549, 1,
-0.0723452, 1.325044, -0.9145281, 0, 1, 0.7411765, 1,
-0.07108705, -1.125487, -4.20697, 0, 1, 0.7490196, 1,
-0.07091338, -0.1524144, -1.738255, 0, 1, 0.7529412, 1,
-0.06863695, -0.06635895, -2.752342, 0, 1, 0.7607843, 1,
-0.06362031, 0.8810971, -0.7196344, 0, 1, 0.7647059, 1,
-0.06223872, -0.441745, -2.531637, 0, 1, 0.772549, 1,
-0.06130396, 0.8267201, 0.6705576, 0, 1, 0.7764706, 1,
-0.06087483, 0.340876, -1.883952, 0, 1, 0.7843137, 1,
-0.06050278, -2.221502, -2.752278, 0, 1, 0.7882353, 1,
-0.05970022, -0.4644479, -3.821351, 0, 1, 0.7960784, 1,
-0.05906778, -0.3684091, -2.948175, 0, 1, 0.8039216, 1,
-0.05886184, 1.09623, -2.39907, 0, 1, 0.8078431, 1,
-0.04963272, 2.645914, -1.225822, 0, 1, 0.8156863, 1,
-0.0439947, -1.009366, -1.260067, 0, 1, 0.8196079, 1,
-0.04385013, -1.759347, -3.232752, 0, 1, 0.827451, 1,
-0.03881032, 2.223504, -1.717927, 0, 1, 0.8313726, 1,
-0.03474049, 2.812018, 0.2681645, 0, 1, 0.8392157, 1,
-0.03102993, -0.3454862, -3.03482, 0, 1, 0.8431373, 1,
-0.03072188, 0.1791624, 0.7254802, 0, 1, 0.8509804, 1,
-0.03032443, -0.2010233, -1.460435, 0, 1, 0.854902, 1,
-0.02816956, 0.1775397, -0.6294953, 0, 1, 0.8627451, 1,
-0.02531965, -0.1993746, -4.326869, 0, 1, 0.8666667, 1,
-0.02103098, 3.032052, -0.5077783, 0, 1, 0.8745098, 1,
-0.0207971, 0.4376391, 1.07635, 0, 1, 0.8784314, 1,
-0.01978274, -0.8122483, -3.236259, 0, 1, 0.8862745, 1,
-0.01731505, 0.4450405, -0.1554474, 0, 1, 0.8901961, 1,
-0.01720457, -0.2080004, -1.173066, 0, 1, 0.8980392, 1,
-0.01696515, 0.3585777, -0.4786556, 0, 1, 0.9058824, 1,
-0.01438561, 0.07856116, 1.082, 0, 1, 0.9098039, 1,
-0.01137852, -0.09868991, -3.308086, 0, 1, 0.9176471, 1,
-0.01132248, -0.1686551, -1.704715, 0, 1, 0.9215686, 1,
-0.0110369, 2.195984, 0.4875341, 0, 1, 0.9294118, 1,
-0.01051706, -0.1798255, -3.967141, 0, 1, 0.9333333, 1,
-0.008410696, -1.049459, -0.8479428, 0, 1, 0.9411765, 1,
-0.006922684, 0.650782, 0.71837, 0, 1, 0.945098, 1,
-0.004638397, -0.1978754, -1.488042, 0, 1, 0.9529412, 1,
-0.00352146, -0.9587271, -3.932994, 0, 1, 0.9568627, 1,
-0.001537785, -0.9828188, -1.656793, 0, 1, 0.9647059, 1,
0.006070997, 1.75874, -0.01498096, 0, 1, 0.9686275, 1,
0.007372102, 0.7703774, -0.09073933, 0, 1, 0.9764706, 1,
0.01238857, 0.3536409, 0.6943687, 0, 1, 0.9803922, 1,
0.013854, -0.1617772, 2.151189, 0, 1, 0.9882353, 1,
0.01436989, 0.994496, 1.165548, 0, 1, 0.9921569, 1,
0.01475895, 0.2088672, 0.3648769, 0, 1, 1, 1,
0.02113078, 0.8718727, -0.9207845, 0, 0.9921569, 1, 1,
0.03264784, -0.6912284, 3.63837, 0, 0.9882353, 1, 1,
0.03302196, -0.903006, 2.041067, 0, 0.9803922, 1, 1,
0.0343243, -0.4942478, 4.173697, 0, 0.9764706, 1, 1,
0.04217304, -1.346116, 2.03929, 0, 0.9686275, 1, 1,
0.04235569, 0.9953504, -1.154348, 0, 0.9647059, 1, 1,
0.04664639, 0.2666274, 1.138976, 0, 0.9568627, 1, 1,
0.05363564, 0.727134, -1.628935, 0, 0.9529412, 1, 1,
0.05568676, -0.2389527, 4.111359, 0, 0.945098, 1, 1,
0.06089334, -0.5446126, 2.668512, 0, 0.9411765, 1, 1,
0.06609244, 1.206493, 0.5657952, 0, 0.9333333, 1, 1,
0.07314648, -0.9631054, 4.613409, 0, 0.9294118, 1, 1,
0.0762651, -1.461322, 3.483169, 0, 0.9215686, 1, 1,
0.07636584, 1.041676, -0.2035827, 0, 0.9176471, 1, 1,
0.08219008, 0.1045276, 1.263032, 0, 0.9098039, 1, 1,
0.08454833, -1.175949, 2.928677, 0, 0.9058824, 1, 1,
0.08463571, -0.3274632, 2.11368, 0, 0.8980392, 1, 1,
0.08640689, 0.3422834, 0.5723986, 0, 0.8901961, 1, 1,
0.08962287, -0.5052543, 4.062533, 0, 0.8862745, 1, 1,
0.09018505, -0.8453962, 4.076072, 0, 0.8784314, 1, 1,
0.09216224, -0.5824886, 1.640832, 0, 0.8745098, 1, 1,
0.09660238, 1.058402, -0.7643058, 0, 0.8666667, 1, 1,
0.0973121, -0.404764, 3.425019, 0, 0.8627451, 1, 1,
0.09910189, -1.010157, 2.892072, 0, 0.854902, 1, 1,
0.1022758, 1.859656, -0.8851012, 0, 0.8509804, 1, 1,
0.1048611, -1.589799, 3.213028, 0, 0.8431373, 1, 1,
0.1084316, -0.311916, 2.330508, 0, 0.8392157, 1, 1,
0.1101487, 0.2272947, -1.758607, 0, 0.8313726, 1, 1,
0.1110223, 0.7864192, 0.5892023, 0, 0.827451, 1, 1,
0.1149385, 0.1760065, 0.5595898, 0, 0.8196079, 1, 1,
0.1193843, 0.1471834, 0.7822673, 0, 0.8156863, 1, 1,
0.1200139, 0.2860925, 1.308673, 0, 0.8078431, 1, 1,
0.1217636, -1.251518, 3.247646, 0, 0.8039216, 1, 1,
0.1218852, 1.28057, 1.133388, 0, 0.7960784, 1, 1,
0.1232347, -2.036304, 1.526164, 0, 0.7882353, 1, 1,
0.1253709, -2.112983, 3.124168, 0, 0.7843137, 1, 1,
0.1283782, 0.5804338, 0.6470934, 0, 0.7764706, 1, 1,
0.1295837, -1.661547, 3.429716, 0, 0.772549, 1, 1,
0.1305055, -0.9845924, 2.681137, 0, 0.7647059, 1, 1,
0.1307244, 1.611212, 0.4203802, 0, 0.7607843, 1, 1,
0.1329582, -0.8386524, 4.953198, 0, 0.7529412, 1, 1,
0.1330327, -2.11961, 4.596451, 0, 0.7490196, 1, 1,
0.1363189, -0.779897, 2.780947, 0, 0.7411765, 1, 1,
0.1435496, 0.7969651, -1.349127, 0, 0.7372549, 1, 1,
0.1447602, 0.7961465, 0.27204, 0, 0.7294118, 1, 1,
0.1526801, -0.1523425, 4.923188, 0, 0.7254902, 1, 1,
0.1543281, -0.5300987, 2.039471, 0, 0.7176471, 1, 1,
0.1561299, 1.118673, 0.4665633, 0, 0.7137255, 1, 1,
0.1605442, 0.2931348, 0.9708524, 0, 0.7058824, 1, 1,
0.1622353, 0.3755955, 1.023524, 0, 0.6980392, 1, 1,
0.1629771, -0.9853559, 3.890349, 0, 0.6941177, 1, 1,
0.1657703, -1.541945, 2.727657, 0, 0.6862745, 1, 1,
0.1754037, 1.128551, -0.2433463, 0, 0.682353, 1, 1,
0.176267, 0.2920163, 0.7327222, 0, 0.6745098, 1, 1,
0.1780841, -1.076323, 3.890529, 0, 0.6705883, 1, 1,
0.1781319, 0.4932055, -0.477101, 0, 0.6627451, 1, 1,
0.1783152, 0.7159446, -0.1061648, 0, 0.6588235, 1, 1,
0.1858577, -1.04335, 3.940124, 0, 0.6509804, 1, 1,
0.1908597, 0.07032035, -0.27474, 0, 0.6470588, 1, 1,
0.1972086, 0.04473194, 1.254543, 0, 0.6392157, 1, 1,
0.1994192, 0.06707196, 1.540923, 0, 0.6352941, 1, 1,
0.2007692, 0.5704351, 0.3655336, 0, 0.627451, 1, 1,
0.2023971, 0.04547732, 1.127851, 0, 0.6235294, 1, 1,
0.2029927, 0.9910554, -1.704412, 0, 0.6156863, 1, 1,
0.203667, -1.07853, 2.131427, 0, 0.6117647, 1, 1,
0.205586, -0.5719662, 1.649855, 0, 0.6039216, 1, 1,
0.2067902, -0.5684074, 1.96565, 0, 0.5960785, 1, 1,
0.207474, 1.550181, -0.8827775, 0, 0.5921569, 1, 1,
0.2080877, -0.1306904, 1.923285, 0, 0.5843138, 1, 1,
0.2135977, -1.630138, 3.24192, 0, 0.5803922, 1, 1,
0.2139984, 0.09943911, 1.187484, 0, 0.572549, 1, 1,
0.2194042, -0.436933, 2.49043, 0, 0.5686275, 1, 1,
0.2216814, -1.769343, 3.357661, 0, 0.5607843, 1, 1,
0.2256172, -0.4129032, 0.8043698, 0, 0.5568628, 1, 1,
0.2261977, -1.51561, 2.696409, 0, 0.5490196, 1, 1,
0.2262853, -0.8223777, 3.644131, 0, 0.5450981, 1, 1,
0.2306739, -0.4796948, 1.875295, 0, 0.5372549, 1, 1,
0.2328056, 0.4288534, 0.5176267, 0, 0.5333334, 1, 1,
0.2345755, 0.3689055, 1.101688, 0, 0.5254902, 1, 1,
0.2368205, 0.37089, -0.5852718, 0, 0.5215687, 1, 1,
0.23932, 0.7579554, 1.65576, 0, 0.5137255, 1, 1,
0.2394109, -1.193888, 1.324737, 0, 0.509804, 1, 1,
0.2400467, -1.473797, 4.03218, 0, 0.5019608, 1, 1,
0.2407144, -0.01335786, 1.730075, 0, 0.4941176, 1, 1,
0.2451992, -0.7210343, 4.338712, 0, 0.4901961, 1, 1,
0.2455938, -1.205091, 3.472405, 0, 0.4823529, 1, 1,
0.2528801, -1.097677, 1.453562, 0, 0.4784314, 1, 1,
0.2531281, -1.201104, 4.10868, 0, 0.4705882, 1, 1,
0.253595, 0.08531714, 2.599693, 0, 0.4666667, 1, 1,
0.2598915, -1.692967, 3.272896, 0, 0.4588235, 1, 1,
0.2610251, -0.5649499, 3.166541, 0, 0.454902, 1, 1,
0.2623104, 0.272795, 0.1372811, 0, 0.4470588, 1, 1,
0.2664619, 2.148006, 1.032533, 0, 0.4431373, 1, 1,
0.2691095, -0.3509796, 3.109962, 0, 0.4352941, 1, 1,
0.2739753, -1.059495, 3.555358, 0, 0.4313726, 1, 1,
0.2746946, 1.453249, 1.001111, 0, 0.4235294, 1, 1,
0.2748008, 0.01575176, 2.036458, 0, 0.4196078, 1, 1,
0.2757876, 0.4894343, 0.8238303, 0, 0.4117647, 1, 1,
0.2769139, 1.638396, -0.06845395, 0, 0.4078431, 1, 1,
0.2868514, 0.245073, -0.53933, 0, 0.4, 1, 1,
0.2933387, -0.1858189, 2.249574, 0, 0.3921569, 1, 1,
0.2962609, 1.281476, 0.490821, 0, 0.3882353, 1, 1,
0.2971559, 0.04077092, 2.396703, 0, 0.3803922, 1, 1,
0.3061357, 2.707905, 0.2048694, 0, 0.3764706, 1, 1,
0.3070155, 0.5449821, 1.127571, 0, 0.3686275, 1, 1,
0.3095175, -0.586519, 1.683306, 0, 0.3647059, 1, 1,
0.3095531, -0.4560655, 2.128378, 0, 0.3568628, 1, 1,
0.3101752, -0.3804339, 0.2078799, 0, 0.3529412, 1, 1,
0.3128657, 0.7629243, 1.808099, 0, 0.345098, 1, 1,
0.3132985, 0.5016991, -1.615187, 0, 0.3411765, 1, 1,
0.3178357, 1.594381, -2.106729, 0, 0.3333333, 1, 1,
0.3178555, 0.2004676, 0.6334149, 0, 0.3294118, 1, 1,
0.322607, -0.4667219, 3.474416, 0, 0.3215686, 1, 1,
0.3241491, 1.332254, 0.20516, 0, 0.3176471, 1, 1,
0.3246775, 1.124565, 0.2714101, 0, 0.3098039, 1, 1,
0.3265727, -1.327248, 4.501904, 0, 0.3058824, 1, 1,
0.3341183, -0.735854, 3.118626, 0, 0.2980392, 1, 1,
0.3362719, -0.3105321, 0.7856424, 0, 0.2901961, 1, 1,
0.3363388, 0.2092932, 1.453365, 0, 0.2862745, 1, 1,
0.3399351, 1.23391, -2.297754, 0, 0.2784314, 1, 1,
0.344558, -0.5052429, 1.658903, 0, 0.2745098, 1, 1,
0.3455777, 0.347656, 1.348769, 0, 0.2666667, 1, 1,
0.3475082, -0.3383343, 2.830351, 0, 0.2627451, 1, 1,
0.3493039, -0.5556777, 1.946466, 0, 0.254902, 1, 1,
0.3501541, -0.2282039, 2.694643, 0, 0.2509804, 1, 1,
0.3504049, 0.1729038, 0.3478022, 0, 0.2431373, 1, 1,
0.3523017, -2.213748, 1.970821, 0, 0.2392157, 1, 1,
0.3590946, 0.2612877, 0.6673832, 0, 0.2313726, 1, 1,
0.3592495, -1.417248, 4.002265, 0, 0.227451, 1, 1,
0.3595807, 0.5318307, 0.4284112, 0, 0.2196078, 1, 1,
0.3598274, -0.05988123, 1.769968, 0, 0.2156863, 1, 1,
0.3604254, 0.4180368, 0.8949976, 0, 0.2078431, 1, 1,
0.3604526, 1.201276, -1.696781, 0, 0.2039216, 1, 1,
0.360743, -0.2744406, 2.531138, 0, 0.1960784, 1, 1,
0.3618971, -0.1452054, 0.4256746, 0, 0.1882353, 1, 1,
0.3650784, 0.6642172, 1.465891, 0, 0.1843137, 1, 1,
0.3716495, -1.383119, 2.600269, 0, 0.1764706, 1, 1,
0.3739812, -0.3896658, 3.149941, 0, 0.172549, 1, 1,
0.380115, 0.1170672, -0.6648136, 0, 0.1647059, 1, 1,
0.382848, -0.9996421, 2.300723, 0, 0.1607843, 1, 1,
0.3847529, 0.4479371, 1.535696, 0, 0.1529412, 1, 1,
0.3853656, -0.8905001, 2.462206, 0, 0.1490196, 1, 1,
0.3913397, -1.349032, 2.548508, 0, 0.1411765, 1, 1,
0.3913768, -0.5050011, 3.899634, 0, 0.1372549, 1, 1,
0.3982306, 0.2201972, 1.225162, 0, 0.1294118, 1, 1,
0.3982457, -0.5760998, 3.399658, 0, 0.1254902, 1, 1,
0.4000843, 0.2256426, 0.7111835, 0, 0.1176471, 1, 1,
0.405056, -1.552682, 2.941342, 0, 0.1137255, 1, 1,
0.4179723, 1.020625, 0.1535511, 0, 0.1058824, 1, 1,
0.4215786, 0.7619472, 1.140035, 0, 0.09803922, 1, 1,
0.4220599, -0.4598761, 2.988907, 0, 0.09411765, 1, 1,
0.4250746, 0.6388562, 2.311788, 0, 0.08627451, 1, 1,
0.4265152, -0.332589, 1.232799, 0, 0.08235294, 1, 1,
0.4283052, -1.842318, 2.482036, 0, 0.07450981, 1, 1,
0.4344399, -1.337571, 1.445567, 0, 0.07058824, 1, 1,
0.4369976, -1.160661, 2.588166, 0, 0.0627451, 1, 1,
0.4371571, 0.2104979, -0.2113854, 0, 0.05882353, 1, 1,
0.4380412, 0.5862314, 1.557512, 0, 0.05098039, 1, 1,
0.4406363, -0.7635491, 1.012609, 0, 0.04705882, 1, 1,
0.444706, -1.645652, 3.977102, 0, 0.03921569, 1, 1,
0.4493725, 1.220165, 1.34918, 0, 0.03529412, 1, 1,
0.45456, -0.08253247, 2.404318, 0, 0.02745098, 1, 1,
0.4641825, 0.2032024, 0.2944756, 0, 0.02352941, 1, 1,
0.4691591, 0.6169342, 1.020095, 0, 0.01568628, 1, 1,
0.471375, -0.1559191, 3.053934, 0, 0.01176471, 1, 1,
0.4746858, -1.101563, 3.838671, 0, 0.003921569, 1, 1,
0.4755805, 0.8283022, -0.528461, 0.003921569, 0, 1, 1,
0.4769071, 0.6300584, -0.7208303, 0.007843138, 0, 1, 1,
0.478921, -1.286268, 2.450936, 0.01568628, 0, 1, 1,
0.4816293, -0.4986139, 2.251886, 0.01960784, 0, 1, 1,
0.4851458, 0.8673791, 1.778816, 0.02745098, 0, 1, 1,
0.4853125, 1.370449, 1.349038, 0.03137255, 0, 1, 1,
0.4878958, 0.1758304, 2.097594, 0.03921569, 0, 1, 1,
0.4883911, -1.369909, 2.6854, 0.04313726, 0, 1, 1,
0.4923475, 0.3287165, 1.327927, 0.05098039, 0, 1, 1,
0.4946733, 0.3069509, 0.280216, 0.05490196, 0, 1, 1,
0.5021983, 0.4308202, 1.43505, 0.0627451, 0, 1, 1,
0.5026368, 0.3580013, 0.2687218, 0.06666667, 0, 1, 1,
0.5033999, 1.068153, -1.809163, 0.07450981, 0, 1, 1,
0.5037065, 0.1248274, 1.298918, 0.07843138, 0, 1, 1,
0.5072036, -1.358256, 3.647213, 0.08627451, 0, 1, 1,
0.5078171, -0.3723656, 0.8604674, 0.09019608, 0, 1, 1,
0.5081248, -0.0922117, 5.259595, 0.09803922, 0, 1, 1,
0.5143021, -0.4991343, 2.665149, 0.1058824, 0, 1, 1,
0.5161337, -0.9830155, 2.983926, 0.1098039, 0, 1, 1,
0.5206112, -0.925617, 1.886307, 0.1176471, 0, 1, 1,
0.5247201, 0.5668397, 0.6254001, 0.1215686, 0, 1, 1,
0.5266186, 0.9345797, 0.4376515, 0.1294118, 0, 1, 1,
0.5293146, -0.2884782, 1.716697, 0.1333333, 0, 1, 1,
0.5314981, 0.4060143, 0.5300083, 0.1411765, 0, 1, 1,
0.5358118, 0.1681574, -0.2344818, 0.145098, 0, 1, 1,
0.5369749, -0.6195269, 2.379494, 0.1529412, 0, 1, 1,
0.5389429, 0.8464565, 2.984096, 0.1568628, 0, 1, 1,
0.5417709, -0.09872692, 2.537208, 0.1647059, 0, 1, 1,
0.5447922, -0.757313, 2.95004, 0.1686275, 0, 1, 1,
0.5455223, -0.02754613, 2.761763, 0.1764706, 0, 1, 1,
0.5478721, 1.24688, 2.432781, 0.1803922, 0, 1, 1,
0.552841, 0.4954596, 2.483871, 0.1882353, 0, 1, 1,
0.555168, -1.016014, 4.140144, 0.1921569, 0, 1, 1,
0.5576349, -0.972715, 3.521299, 0.2, 0, 1, 1,
0.5612419, 0.2636245, 1.030679, 0.2078431, 0, 1, 1,
0.5659447, -0.3378803, 1.514995, 0.2117647, 0, 1, 1,
0.5676559, -0.1869111, 1.136637, 0.2196078, 0, 1, 1,
0.5770013, 0.9018408, 0.4328043, 0.2235294, 0, 1, 1,
0.577605, 1.488295, -0.885082, 0.2313726, 0, 1, 1,
0.5806389, 0.04431132, 0.4186645, 0.2352941, 0, 1, 1,
0.5835817, -0.5760472, 4.003143, 0.2431373, 0, 1, 1,
0.5847229, -1.083789, 3.061549, 0.2470588, 0, 1, 1,
0.5849703, 1.88835, -0.140895, 0.254902, 0, 1, 1,
0.5851322, -0.3727674, 2.553493, 0.2588235, 0, 1, 1,
0.5864234, 0.582536, -0.2079519, 0.2666667, 0, 1, 1,
0.5914594, 0.4984427, 1.529574, 0.2705882, 0, 1, 1,
0.5972935, 1.621471, -0.07851323, 0.2784314, 0, 1, 1,
0.5978038, -0.1444796, 1.970428, 0.282353, 0, 1, 1,
0.597945, 0.1791133, 0.7548552, 0.2901961, 0, 1, 1,
0.5987498, 2.346764, 0.640726, 0.2941177, 0, 1, 1,
0.6006631, 0.4974537, -0.009479878, 0.3019608, 0, 1, 1,
0.6051323, 0.4910265, 0.1640875, 0.3098039, 0, 1, 1,
0.6063835, -1.582847, 2.424388, 0.3137255, 0, 1, 1,
0.6106667, -0.2459339, 2.44945, 0.3215686, 0, 1, 1,
0.6115528, -0.3641295, 2.405695, 0.3254902, 0, 1, 1,
0.6137409, 0.003038032, 1.274175, 0.3333333, 0, 1, 1,
0.6162016, -0.5111375, 1.948855, 0.3372549, 0, 1, 1,
0.6190215, -0.4192088, 4.100849, 0.345098, 0, 1, 1,
0.6197924, 0.05625458, 0.4866472, 0.3490196, 0, 1, 1,
0.6241937, 0.7194322, -0.8417351, 0.3568628, 0, 1, 1,
0.6245019, -1.258911, 1.73177, 0.3607843, 0, 1, 1,
0.6270427, 0.7062961, 0.6186532, 0.3686275, 0, 1, 1,
0.6327852, 0.5233486, 1.303731, 0.372549, 0, 1, 1,
0.6488063, -0.03708561, 1.06959, 0.3803922, 0, 1, 1,
0.6542535, 0.04285055, 1.306131, 0.3843137, 0, 1, 1,
0.6554391, 2.074531, 0.8369363, 0.3921569, 0, 1, 1,
0.6642643, 0.4262284, 0.1147182, 0.3960784, 0, 1, 1,
0.6714484, -1.268381, 2.55025, 0.4039216, 0, 1, 1,
0.671458, -0.2694764, 2.039353, 0.4117647, 0, 1, 1,
0.6734721, -1.792943, 2.664858, 0.4156863, 0, 1, 1,
0.6756111, -0.9594147, 2.888506, 0.4235294, 0, 1, 1,
0.6772782, -2.329054e-05, 2.016125, 0.427451, 0, 1, 1,
0.6792001, 0.6569692, 1.399585, 0.4352941, 0, 1, 1,
0.679877, -1.285884, 0.6112315, 0.4392157, 0, 1, 1,
0.6812236, 0.3120203, 2.227047, 0.4470588, 0, 1, 1,
0.6830406, -0.7091798, 1.452397, 0.4509804, 0, 1, 1,
0.6882788, 1.509534, 0.5210454, 0.4588235, 0, 1, 1,
0.6944619, 0.1705163, 1.542152, 0.4627451, 0, 1, 1,
0.6960412, 0.2512865, 1.906897, 0.4705882, 0, 1, 1,
0.7009462, -0.3447244, 1.431574, 0.4745098, 0, 1, 1,
0.7023583, -2.154655, 2.394992, 0.4823529, 0, 1, 1,
0.7037702, 0.1302921, 1.287421, 0.4862745, 0, 1, 1,
0.7051015, 0.3868338, 0.4015394, 0.4941176, 0, 1, 1,
0.7082112, -1.767586, 2.576471, 0.5019608, 0, 1, 1,
0.7087202, 0.03203712, 2.359043, 0.5058824, 0, 1, 1,
0.7134706, -0.6099957, 0.3916625, 0.5137255, 0, 1, 1,
0.7136654, 0.9750862, 1.063985, 0.5176471, 0, 1, 1,
0.7234341, -1.034189, 3.614692, 0.5254902, 0, 1, 1,
0.7257769, -0.9007955, 2.673176, 0.5294118, 0, 1, 1,
0.7279392, 0.6128029, -1.439519, 0.5372549, 0, 1, 1,
0.7288619, -1.717777, 2.317917, 0.5411765, 0, 1, 1,
0.7328994, 0.2049449, 0.6557927, 0.5490196, 0, 1, 1,
0.7366295, -0.1976297, 2.627446, 0.5529412, 0, 1, 1,
0.7369534, 0.4934032, 1.464491, 0.5607843, 0, 1, 1,
0.7407554, 0.7631523, 0.7335117, 0.5647059, 0, 1, 1,
0.7432824, -1.251031, 2.446523, 0.572549, 0, 1, 1,
0.7433684, -0.8426173, 0.4993947, 0.5764706, 0, 1, 1,
0.7452838, 0.6455398, 0.3154926, 0.5843138, 0, 1, 1,
0.745407, 0.2498457, 1.099514, 0.5882353, 0, 1, 1,
0.745667, -0.3804615, 2.11732, 0.5960785, 0, 1, 1,
0.7465668, -1.086926, 2.446743, 0.6039216, 0, 1, 1,
0.7467562, 1.535547, 0.52258, 0.6078432, 0, 1, 1,
0.7482775, 0.5451534, 1.407465, 0.6156863, 0, 1, 1,
0.7512938, 0.9842042, 2.653846, 0.6196079, 0, 1, 1,
0.7515283, 0.5133432, 2.90646, 0.627451, 0, 1, 1,
0.7546641, 0.4866761, 0.7001914, 0.6313726, 0, 1, 1,
0.7644108, 0.1446292, 0.6808728, 0.6392157, 0, 1, 1,
0.7650712, -0.1993484, 2.154415, 0.6431373, 0, 1, 1,
0.7662569, 0.7045518, 1.697159, 0.6509804, 0, 1, 1,
0.7688047, 0.4788907, 0.347239, 0.654902, 0, 1, 1,
0.7690891, 0.7101216, 1.032228, 0.6627451, 0, 1, 1,
0.7711748, 0.2144548, 1.817773, 0.6666667, 0, 1, 1,
0.7782804, 1.617735, 1.46619, 0.6745098, 0, 1, 1,
0.7914804, -1.253083, 2.977691, 0.6784314, 0, 1, 1,
0.7919461, 0.8421934, 0.9700847, 0.6862745, 0, 1, 1,
0.7990166, 0.8467005, 0.6563175, 0.6901961, 0, 1, 1,
0.8013391, -1.569933, 1.400791, 0.6980392, 0, 1, 1,
0.8023082, 0.1556244, 1.900559, 0.7058824, 0, 1, 1,
0.8078845, -1.866772, 1.875659, 0.7098039, 0, 1, 1,
0.8099402, 0.4181136, 1.732566, 0.7176471, 0, 1, 1,
0.8111461, -0.3422235, 2.474855, 0.7215686, 0, 1, 1,
0.8147815, 0.8008425, 0.5216692, 0.7294118, 0, 1, 1,
0.8181052, -1.960935, 2.735329, 0.7333333, 0, 1, 1,
0.8190516, -1.497929, 3.417374, 0.7411765, 0, 1, 1,
0.8212683, 1.549677, 1.837548, 0.7450981, 0, 1, 1,
0.8216329, 1.16187, -1.62822, 0.7529412, 0, 1, 1,
0.826272, 1.671089, 1.157282, 0.7568628, 0, 1, 1,
0.8319322, 0.9755363, 0.2333135, 0.7647059, 0, 1, 1,
0.8382156, 0.5125009, -0.9344515, 0.7686275, 0, 1, 1,
0.8406265, 0.8308301, 0.9351262, 0.7764706, 0, 1, 1,
0.8421062, -1.134456, 2.614302, 0.7803922, 0, 1, 1,
0.8421283, 0.3605744, -0.7527602, 0.7882353, 0, 1, 1,
0.8469556, 0.8125497, 0.4884949, 0.7921569, 0, 1, 1,
0.8493784, 0.459255, 1.395802, 0.8, 0, 1, 1,
0.850174, 0.04159262, -0.4712037, 0.8078431, 0, 1, 1,
0.8509968, 0.2673071, 2.654262, 0.8117647, 0, 1, 1,
0.8545427, -0.9920004, 1.121078, 0.8196079, 0, 1, 1,
0.8560822, -0.4507921, 3.221964, 0.8235294, 0, 1, 1,
0.8574678, 1.844232, -0.3459903, 0.8313726, 0, 1, 1,
0.8625438, -0.2028015, 0.8378813, 0.8352941, 0, 1, 1,
0.8657382, -1.410067, 3.337281, 0.8431373, 0, 1, 1,
0.8665226, -0.2401515, 1.376457, 0.8470588, 0, 1, 1,
0.873067, 1.412449, -1.868804, 0.854902, 0, 1, 1,
0.8764485, 0.4054229, 0.727898, 0.8588235, 0, 1, 1,
0.8805608, 0.7580332, 1.470239, 0.8666667, 0, 1, 1,
0.8807424, -0.8434914, 3.340494, 0.8705882, 0, 1, 1,
0.8820988, 1.021879, -0.6216368, 0.8784314, 0, 1, 1,
0.8849804, 0.4764672, -0.2304301, 0.8823529, 0, 1, 1,
0.8852208, 0.6113429, 0.2214262, 0.8901961, 0, 1, 1,
0.8905739, -0.4925578, 1.952357, 0.8941177, 0, 1, 1,
0.8910367, -0.2910252, 2.296273, 0.9019608, 0, 1, 1,
0.8930526, 0.2419288, 1.683773, 0.9098039, 0, 1, 1,
0.8945854, 0.8778237, 2.527381, 0.9137255, 0, 1, 1,
0.9026147, -3.002457, 2.373308, 0.9215686, 0, 1, 1,
0.9098765, -1.074652, 2.38942, 0.9254902, 0, 1, 1,
0.9150517, -0.4109465, 2.433616, 0.9333333, 0, 1, 1,
0.9200553, -0.297751, 1.074381, 0.9372549, 0, 1, 1,
0.9276981, 0.4072101, 1.715204, 0.945098, 0, 1, 1,
0.9300649, -1.781508, 4.652761, 0.9490196, 0, 1, 1,
0.9327292, -2.240867, 1.172894, 0.9568627, 0, 1, 1,
0.9362052, 1.842, 0.5338796, 0.9607843, 0, 1, 1,
0.9408453, 0.02501207, 2.992662, 0.9686275, 0, 1, 1,
0.9416, -0.2355379, -0.6758389, 0.972549, 0, 1, 1,
0.9448096, 1.842507, -0.8604355, 0.9803922, 0, 1, 1,
0.948802, -0.3157824, 1.322289, 0.9843137, 0, 1, 1,
0.9508716, -0.9294446, 2.472221, 0.9921569, 0, 1, 1,
0.9659656, -1.036437, 1.412055, 0.9960784, 0, 1, 1,
0.9676833, 0.262495, 3.330892, 1, 0, 0.9960784, 1,
0.9689859, 1.089068, -0.1981089, 1, 0, 0.9882353, 1,
0.9693306, 2.208189, 2.13689, 1, 0, 0.9843137, 1,
0.9830843, -0.4933855, 0.8048543, 1, 0, 0.9764706, 1,
0.9835644, -0.4141623, 1.754796, 1, 0, 0.972549, 1,
0.9854366, 0.1152778, 1.247236, 1, 0, 0.9647059, 1,
0.9856291, -0.5201604, 2.96445, 1, 0, 0.9607843, 1,
0.9884079, 1.039135, 0.8580147, 1, 0, 0.9529412, 1,
0.9952275, 0.2960173, 0.9608318, 1, 0, 0.9490196, 1,
1.000169, -3.394616, 3.247139, 1, 0, 0.9411765, 1,
1.004643, 1.393277, 0.5052025, 1, 0, 0.9372549, 1,
1.007304, -1.201842, 3.206637, 1, 0, 0.9294118, 1,
1.015997, -0.1016791, 1.584183, 1, 0, 0.9254902, 1,
1.019647, -0.1524149, 0.9775537, 1, 0, 0.9176471, 1,
1.021993, 0.2194919, 2.501187, 1, 0, 0.9137255, 1,
1.033289, -1.627832, 2.411757, 1, 0, 0.9058824, 1,
1.034355, 0.5562623, 0.4230429, 1, 0, 0.9019608, 1,
1.040433, -0.07249531, 2.702613, 1, 0, 0.8941177, 1,
1.044651, -0.4075838, 0.2669326, 1, 0, 0.8862745, 1,
1.054157, 1.137777, 0.2969286, 1, 0, 0.8823529, 1,
1.069653, 1.000446, 1.067792, 1, 0, 0.8745098, 1,
1.076134, 0.713038, -0.850512, 1, 0, 0.8705882, 1,
1.091889, -2.304832, 1.498795, 1, 0, 0.8627451, 1,
1.094539, 1.14707, 1.092685, 1, 0, 0.8588235, 1,
1.103135, -1.516867, 3.333754, 1, 0, 0.8509804, 1,
1.10701, 1.085011, 2.111552, 1, 0, 0.8470588, 1,
1.116865, -0.8228636, 3.337163, 1, 0, 0.8392157, 1,
1.12594, -0.9911672, 3.95593, 1, 0, 0.8352941, 1,
1.142816, 0.4847821, 1.302994, 1, 0, 0.827451, 1,
1.142945, -0.944805, 3.338103, 1, 0, 0.8235294, 1,
1.147088, 0.3116134, 2.254354, 1, 0, 0.8156863, 1,
1.15602, -1.828372, 2.833705, 1, 0, 0.8117647, 1,
1.159299, 0.8309104, 0.1925632, 1, 0, 0.8039216, 1,
1.160873, -0.2261212, 3.05134, 1, 0, 0.7960784, 1,
1.167875, 1.017409, 0.6554342, 1, 0, 0.7921569, 1,
1.169294, -1.063742, 3.030804, 1, 0, 0.7843137, 1,
1.169636, 0.6062453, 1.525917, 1, 0, 0.7803922, 1,
1.16982, 0.3038884, 1.237963, 1, 0, 0.772549, 1,
1.173369, -0.6472045, 5.07282, 1, 0, 0.7686275, 1,
1.180309, -1.122373, 2.903865, 1, 0, 0.7607843, 1,
1.180926, -0.1321372, 2.032775, 1, 0, 0.7568628, 1,
1.187306, -0.3967831, -0.3070261, 1, 0, 0.7490196, 1,
1.192573, 0.2645497, 1.194735, 1, 0, 0.7450981, 1,
1.197535, -0.253923, -0.1065577, 1, 0, 0.7372549, 1,
1.210326, -1.212741, 2.852983, 1, 0, 0.7333333, 1,
1.219748, 0.537959, 1.728246, 1, 0, 0.7254902, 1,
1.221142, -0.7815904, 2.938299, 1, 0, 0.7215686, 1,
1.229298, 0.5323502, 2.360175, 1, 0, 0.7137255, 1,
1.23211, 2.784703, 2.053282, 1, 0, 0.7098039, 1,
1.233287, 0.9606782, 2.311944, 1, 0, 0.7019608, 1,
1.243648, -0.1965785, 2.703052, 1, 0, 0.6941177, 1,
1.249656, -0.9286174, 1.25775, 1, 0, 0.6901961, 1,
1.251492, -1.340537, 4.141387, 1, 0, 0.682353, 1,
1.258153, 0.5104452, 0.6140103, 1, 0, 0.6784314, 1,
1.2633, -1.515842, 2.377605, 1, 0, 0.6705883, 1,
1.274749, 0.6188051, 3.476509, 1, 0, 0.6666667, 1,
1.275884, 0.2167925, 1.276735, 1, 0, 0.6588235, 1,
1.286141, -0.08902578, 1.936264, 1, 0, 0.654902, 1,
1.305011, 0.718233, 0.07611688, 1, 0, 0.6470588, 1,
1.321154, -1.387707, 3.555629, 1, 0, 0.6431373, 1,
1.329212, 0.6829093, 2.544247, 1, 0, 0.6352941, 1,
1.33574, 0.8975888, 0.0756176, 1, 0, 0.6313726, 1,
1.344683, -1.567728, 2.579861, 1, 0, 0.6235294, 1,
1.365292, -0.1628581, 0.2606685, 1, 0, 0.6196079, 1,
1.372409, -0.9217821, 1.768284, 1, 0, 0.6117647, 1,
1.375337, 0.4050388, 1.674554, 1, 0, 0.6078432, 1,
1.375874, 0.01238008, 2.876005, 1, 0, 0.6, 1,
1.383829, -0.6176675, 2.259798, 1, 0, 0.5921569, 1,
1.385799, -1.012605, 1.656308, 1, 0, 0.5882353, 1,
1.405516, -0.3705693, 1.974498, 1, 0, 0.5803922, 1,
1.407613, -0.02837735, 1.336265, 1, 0, 0.5764706, 1,
1.413377, -2.272875, 0.9022367, 1, 0, 0.5686275, 1,
1.41997, -0.5490394, 2.256367, 1, 0, 0.5647059, 1,
1.43248, -1.35779, 1.995804, 1, 0, 0.5568628, 1,
1.435543, 0.8132109, 1.26111, 1, 0, 0.5529412, 1,
1.439223, 0.179299, 3.332017, 1, 0, 0.5450981, 1,
1.443471, -1.606396, 2.40639, 1, 0, 0.5411765, 1,
1.448206, 0.3752458, 1.391048, 1, 0, 0.5333334, 1,
1.450489, 0.0290908, 1.036133, 1, 0, 0.5294118, 1,
1.453085, -0.828613, 3.190106, 1, 0, 0.5215687, 1,
1.457097, -0.3507028, 2.709592, 1, 0, 0.5176471, 1,
1.458456, -0.480622, 0.1391253, 1, 0, 0.509804, 1,
1.464659, 1.033284, 0.005866287, 1, 0, 0.5058824, 1,
1.484739, -0.4390804, 1.364249, 1, 0, 0.4980392, 1,
1.496072, 2.306811, 0.2959194, 1, 0, 0.4901961, 1,
1.497316, 0.5734862, 2.04822, 1, 0, 0.4862745, 1,
1.512267, 1.360698, 0.6122348, 1, 0, 0.4784314, 1,
1.51815, 1.28259, 1.139451, 1, 0, 0.4745098, 1,
1.526551, -0.4440444, 0.3798274, 1, 0, 0.4666667, 1,
1.542675, -0.982098, 3.023027, 1, 0, 0.4627451, 1,
1.546772, -0.3474553, 1.702717, 1, 0, 0.454902, 1,
1.552389, -0.01470224, -0.2253634, 1, 0, 0.4509804, 1,
1.55613, 1.319834, 1.232201, 1, 0, 0.4431373, 1,
1.557309, 0.470264, 0.676503, 1, 0, 0.4392157, 1,
1.559298, -0.17461, 3.178809, 1, 0, 0.4313726, 1,
1.561135, -1.240463, 2.115374, 1, 0, 0.427451, 1,
1.561215, 0.488946, 1.015713, 1, 0, 0.4196078, 1,
1.577295, -0.276004, 0.6257707, 1, 0, 0.4156863, 1,
1.589425, -1.73268, 3.702508, 1, 0, 0.4078431, 1,
1.593331, 0.5353933, 3.103485, 1, 0, 0.4039216, 1,
1.603104, 0.4809546, 0.8273932, 1, 0, 0.3960784, 1,
1.61388, -0.304075, 1.597292, 1, 0, 0.3882353, 1,
1.619192, 1.914296, 3.042386, 1, 0, 0.3843137, 1,
1.625352, -1.662368, 2.473316, 1, 0, 0.3764706, 1,
1.641343, -0.5531031, 4.161766, 1, 0, 0.372549, 1,
1.660927, 1.720052, -0.3237849, 1, 0, 0.3647059, 1,
1.661859, -0.7738641, 0.3294191, 1, 0, 0.3607843, 1,
1.678611, -0.04228869, 0.6851131, 1, 0, 0.3529412, 1,
1.683546, 0.09794235, 2.258141, 1, 0, 0.3490196, 1,
1.687564, 0.5927254, 1.406076, 1, 0, 0.3411765, 1,
1.693316, -1.192621, 2.046809, 1, 0, 0.3372549, 1,
1.693765, 1.836313, -1.082712, 1, 0, 0.3294118, 1,
1.707037, 2.361124, 1.048004, 1, 0, 0.3254902, 1,
1.707105, -1.255293, 2.862239, 1, 0, 0.3176471, 1,
1.72015, 0.1381071, 2.215313, 1, 0, 0.3137255, 1,
1.721838, -0.3726439, 1.342032, 1, 0, 0.3058824, 1,
1.727616, 0.848444, 1.681041, 1, 0, 0.2980392, 1,
1.74844, -0.7014443, 2.70256, 1, 0, 0.2941177, 1,
1.75013, -0.353399, 0.6350977, 1, 0, 0.2862745, 1,
1.776078, 0.1347163, 0.7881343, 1, 0, 0.282353, 1,
1.783853, -0.5193046, 2.765705, 1, 0, 0.2745098, 1,
1.819281, -0.8696336, 0.9314036, 1, 0, 0.2705882, 1,
1.846507, -0.8257983, 1.100378, 1, 0, 0.2627451, 1,
1.855173, -0.2977927, -0.309783, 1, 0, 0.2588235, 1,
1.890758, -1.51958, 0.7777512, 1, 0, 0.2509804, 1,
1.891498, -1.215278, 3.878299, 1, 0, 0.2470588, 1,
1.896174, -0.9005821, 1.834692, 1, 0, 0.2392157, 1,
1.902146, 1.511572, 2.194365, 1, 0, 0.2352941, 1,
1.912967, 2.164923, 1.456811, 1, 0, 0.227451, 1,
1.929512, 0.561508, 0.164645, 1, 0, 0.2235294, 1,
1.931009, 1.486625, 2.247567, 1, 0, 0.2156863, 1,
1.945536, -0.1587254, 1.676657, 1, 0, 0.2117647, 1,
1.953693, 0.9988183, 1.266745, 1, 0, 0.2039216, 1,
1.98924, 1.383869, 1.079013, 1, 0, 0.1960784, 1,
2.000537, -0.2076482, 1.98578, 1, 0, 0.1921569, 1,
2.007636, 0.9188046, 1.618938, 1, 0, 0.1843137, 1,
2.014128, -0.1914123, -0.3249103, 1, 0, 0.1803922, 1,
2.018431, -0.3377607, 3.877116, 1, 0, 0.172549, 1,
2.068016, -0.6020104, 2.062799, 1, 0, 0.1686275, 1,
2.073232, 1.445591, -0.07655437, 1, 0, 0.1607843, 1,
2.092347, 0.4680447, 1.530777, 1, 0, 0.1568628, 1,
2.098583, -1.184812, 1.644661, 1, 0, 0.1490196, 1,
2.135895, -1.060798, 2.596398, 1, 0, 0.145098, 1,
2.144425, -0.323583, 1.101335, 1, 0, 0.1372549, 1,
2.148158, -0.09237242, 3.016049, 1, 0, 0.1333333, 1,
2.151305, -1.156156, 1.744898, 1, 0, 0.1254902, 1,
2.161919, -0.2147513, 1.816308, 1, 0, 0.1215686, 1,
2.176144, -0.8979881, 2.623856, 1, 0, 0.1137255, 1,
2.179157, 0.7778119, 0.2503704, 1, 0, 0.1098039, 1,
2.192292, -0.7432468, 0.3264617, 1, 0, 0.1019608, 1,
2.196854, 1.271345, 1.909647, 1, 0, 0.09411765, 1,
2.205413, -0.4084501, 1.726071, 1, 0, 0.09019608, 1,
2.268058, -0.6926072, 0.07396267, 1, 0, 0.08235294, 1,
2.273748, -1.140239, 2.942395, 1, 0, 0.07843138, 1,
2.364715, 0.8019205, -0.9890487, 1, 0, 0.07058824, 1,
2.397733, 0.8001351, 0.4843325, 1, 0, 0.06666667, 1,
2.417781, -0.5029998, 1.203299, 1, 0, 0.05882353, 1,
2.448116, -1.521101, 4.834924, 1, 0, 0.05490196, 1,
2.473806, -0.5497722, 3.134587, 1, 0, 0.04705882, 1,
2.494578, -0.1691866, 1.653563, 1, 0, 0.04313726, 1,
2.497101, -0.9615319, 1.549982, 1, 0, 0.03529412, 1,
2.539885, -0.08144975, 0.7346303, 1, 0, 0.03137255, 1,
2.592013, 1.043687, 3.673964, 1, 0, 0.02352941, 1,
2.690668, -1.027344, 1.066631, 1, 0, 0.01960784, 1,
3.100231, -0.6715764, 2.55558, 1, 0, 0.01176471, 1,
3.313154, -0.4597184, 1.52604, 1, 0, 0.007843138, 1
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
0.1415051, -4.611919, -7.555219, 0, -0.5, 0.5, 0.5,
0.1415051, -4.611919, -7.555219, 1, -0.5, 0.5, 0.5,
0.1415051, -4.611919, -7.555219, 1, 1.5, 0.5, 0.5,
0.1415051, -4.611919, -7.555219, 0, 1.5, 0.5, 0.5
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
-4.105332, -0.2016131, -7.555219, 0, -0.5, 0.5, 0.5,
-4.105332, -0.2016131, -7.555219, 1, -0.5, 0.5, 0.5,
-4.105332, -0.2016131, -7.555219, 1, 1.5, 0.5, 0.5,
-4.105332, -0.2016131, -7.555219, 0, 1.5, 0.5, 0.5
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
-4.105332, -4.611919, -0.2191627, 0, -0.5, 0.5, 0.5,
-4.105332, -4.611919, -0.2191627, 1, -0.5, 0.5, 0.5,
-4.105332, -4.611919, -0.2191627, 1, 1.5, 0.5, 0.5,
-4.105332, -4.611919, -0.2191627, 0, 1.5, 0.5, 0.5
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
-3, -3.594156, -5.862283,
3, -3.594156, -5.862283,
-3, -3.594156, -5.862283,
-3, -3.763783, -6.144439,
-2, -3.594156, -5.862283,
-2, -3.763783, -6.144439,
-1, -3.594156, -5.862283,
-1, -3.763783, -6.144439,
0, -3.594156, -5.862283,
0, -3.763783, -6.144439,
1, -3.594156, -5.862283,
1, -3.763783, -6.144439,
2, -3.594156, -5.862283,
2, -3.763783, -6.144439,
3, -3.594156, -5.862283,
3, -3.763783, -6.144439
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
-3, -4.103038, -6.708751, 0, -0.5, 0.5, 0.5,
-3, -4.103038, -6.708751, 1, -0.5, 0.5, 0.5,
-3, -4.103038, -6.708751, 1, 1.5, 0.5, 0.5,
-3, -4.103038, -6.708751, 0, 1.5, 0.5, 0.5,
-2, -4.103038, -6.708751, 0, -0.5, 0.5, 0.5,
-2, -4.103038, -6.708751, 1, -0.5, 0.5, 0.5,
-2, -4.103038, -6.708751, 1, 1.5, 0.5, 0.5,
-2, -4.103038, -6.708751, 0, 1.5, 0.5, 0.5,
-1, -4.103038, -6.708751, 0, -0.5, 0.5, 0.5,
-1, -4.103038, -6.708751, 1, -0.5, 0.5, 0.5,
-1, -4.103038, -6.708751, 1, 1.5, 0.5, 0.5,
-1, -4.103038, -6.708751, 0, 1.5, 0.5, 0.5,
0, -4.103038, -6.708751, 0, -0.5, 0.5, 0.5,
0, -4.103038, -6.708751, 1, -0.5, 0.5, 0.5,
0, -4.103038, -6.708751, 1, 1.5, 0.5, 0.5,
0, -4.103038, -6.708751, 0, 1.5, 0.5, 0.5,
1, -4.103038, -6.708751, 0, -0.5, 0.5, 0.5,
1, -4.103038, -6.708751, 1, -0.5, 0.5, 0.5,
1, -4.103038, -6.708751, 1, 1.5, 0.5, 0.5,
1, -4.103038, -6.708751, 0, 1.5, 0.5, 0.5,
2, -4.103038, -6.708751, 0, -0.5, 0.5, 0.5,
2, -4.103038, -6.708751, 1, -0.5, 0.5, 0.5,
2, -4.103038, -6.708751, 1, 1.5, 0.5, 0.5,
2, -4.103038, -6.708751, 0, 1.5, 0.5, 0.5,
3, -4.103038, -6.708751, 0, -0.5, 0.5, 0.5,
3, -4.103038, -6.708751, 1, -0.5, 0.5, 0.5,
3, -4.103038, -6.708751, 1, 1.5, 0.5, 0.5,
3, -4.103038, -6.708751, 0, 1.5, 0.5, 0.5
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
-3.125293, -3, -5.862283,
-3.125293, 3, -5.862283,
-3.125293, -3, -5.862283,
-3.288633, -3, -6.144439,
-3.125293, -2, -5.862283,
-3.288633, -2, -6.144439,
-3.125293, -1, -5.862283,
-3.288633, -1, -6.144439,
-3.125293, 0, -5.862283,
-3.288633, 0, -6.144439,
-3.125293, 1, -5.862283,
-3.288633, 1, -6.144439,
-3.125293, 2, -5.862283,
-3.288633, 2, -6.144439,
-3.125293, 3, -5.862283,
-3.288633, 3, -6.144439
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
-3.615312, -3, -6.708751, 0, -0.5, 0.5, 0.5,
-3.615312, -3, -6.708751, 1, -0.5, 0.5, 0.5,
-3.615312, -3, -6.708751, 1, 1.5, 0.5, 0.5,
-3.615312, -3, -6.708751, 0, 1.5, 0.5, 0.5,
-3.615312, -2, -6.708751, 0, -0.5, 0.5, 0.5,
-3.615312, -2, -6.708751, 1, -0.5, 0.5, 0.5,
-3.615312, -2, -6.708751, 1, 1.5, 0.5, 0.5,
-3.615312, -2, -6.708751, 0, 1.5, 0.5, 0.5,
-3.615312, -1, -6.708751, 0, -0.5, 0.5, 0.5,
-3.615312, -1, -6.708751, 1, -0.5, 0.5, 0.5,
-3.615312, -1, -6.708751, 1, 1.5, 0.5, 0.5,
-3.615312, -1, -6.708751, 0, 1.5, 0.5, 0.5,
-3.615312, 0, -6.708751, 0, -0.5, 0.5, 0.5,
-3.615312, 0, -6.708751, 1, -0.5, 0.5, 0.5,
-3.615312, 0, -6.708751, 1, 1.5, 0.5, 0.5,
-3.615312, 0, -6.708751, 0, 1.5, 0.5, 0.5,
-3.615312, 1, -6.708751, 0, -0.5, 0.5, 0.5,
-3.615312, 1, -6.708751, 1, -0.5, 0.5, 0.5,
-3.615312, 1, -6.708751, 1, 1.5, 0.5, 0.5,
-3.615312, 1, -6.708751, 0, 1.5, 0.5, 0.5,
-3.615312, 2, -6.708751, 0, -0.5, 0.5, 0.5,
-3.615312, 2, -6.708751, 1, -0.5, 0.5, 0.5,
-3.615312, 2, -6.708751, 1, 1.5, 0.5, 0.5,
-3.615312, 2, -6.708751, 0, 1.5, 0.5, 0.5,
-3.615312, 3, -6.708751, 0, -0.5, 0.5, 0.5,
-3.615312, 3, -6.708751, 1, -0.5, 0.5, 0.5,
-3.615312, 3, -6.708751, 1, 1.5, 0.5, 0.5,
-3.615312, 3, -6.708751, 0, 1.5, 0.5, 0.5
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
-3.125293, -3.594156, -4,
-3.125293, -3.594156, 4,
-3.125293, -3.594156, -4,
-3.288633, -3.763783, -4,
-3.125293, -3.594156, -2,
-3.288633, -3.763783, -2,
-3.125293, -3.594156, 0,
-3.288633, -3.763783, 0,
-3.125293, -3.594156, 2,
-3.288633, -3.763783, 2,
-3.125293, -3.594156, 4,
-3.288633, -3.763783, 4
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
-3.615312, -4.103038, -4, 0, -0.5, 0.5, 0.5,
-3.615312, -4.103038, -4, 1, -0.5, 0.5, 0.5,
-3.615312, -4.103038, -4, 1, 1.5, 0.5, 0.5,
-3.615312, -4.103038, -4, 0, 1.5, 0.5, 0.5,
-3.615312, -4.103038, -2, 0, -0.5, 0.5, 0.5,
-3.615312, -4.103038, -2, 1, -0.5, 0.5, 0.5,
-3.615312, -4.103038, -2, 1, 1.5, 0.5, 0.5,
-3.615312, -4.103038, -2, 0, 1.5, 0.5, 0.5,
-3.615312, -4.103038, 0, 0, -0.5, 0.5, 0.5,
-3.615312, -4.103038, 0, 1, -0.5, 0.5, 0.5,
-3.615312, -4.103038, 0, 1, 1.5, 0.5, 0.5,
-3.615312, -4.103038, 0, 0, 1.5, 0.5, 0.5,
-3.615312, -4.103038, 2, 0, -0.5, 0.5, 0.5,
-3.615312, -4.103038, 2, 1, -0.5, 0.5, 0.5,
-3.615312, -4.103038, 2, 1, 1.5, 0.5, 0.5,
-3.615312, -4.103038, 2, 0, 1.5, 0.5, 0.5,
-3.615312, -4.103038, 4, 0, -0.5, 0.5, 0.5,
-3.615312, -4.103038, 4, 1, -0.5, 0.5, 0.5,
-3.615312, -4.103038, 4, 1, 1.5, 0.5, 0.5,
-3.615312, -4.103038, 4, 0, 1.5, 0.5, 0.5
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
-3.125293, -3.594156, -5.862283,
-3.125293, 3.19093, -5.862283,
-3.125293, -3.594156, 5.423958,
-3.125293, 3.19093, 5.423958,
-3.125293, -3.594156, -5.862283,
-3.125293, -3.594156, 5.423958,
-3.125293, 3.19093, -5.862283,
-3.125293, 3.19093, 5.423958,
-3.125293, -3.594156, -5.862283,
3.408303, -3.594156, -5.862283,
-3.125293, -3.594156, 5.423958,
3.408303, -3.594156, 5.423958,
-3.125293, 3.19093, -5.862283,
3.408303, 3.19093, -5.862283,
-3.125293, 3.19093, 5.423958,
3.408303, 3.19093, 5.423958,
3.408303, -3.594156, -5.862283,
3.408303, 3.19093, -5.862283,
3.408303, -3.594156, 5.423958,
3.408303, 3.19093, 5.423958,
3.408303, -3.594156, -5.862283,
3.408303, -3.594156, 5.423958,
3.408303, 3.19093, -5.862283,
3.408303, 3.19093, 5.423958
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
var radius = 7.849778;
var distance = 34.92455;
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
mvMatrix.translate( -0.1415051, 0.2016131, 0.2191627 );
mvMatrix.scale( 1.29903, 1.250881, 0.7520071 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92455);
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
toxaphene<-read.table("toxaphene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-toxaphene$V2
```

```
## Error in eval(expr, envir, enclos): object 'toxaphene' not found
```

```r
y<-toxaphene$V3
```

```
## Error in eval(expr, envir, enclos): object 'toxaphene' not found
```

```r
z<-toxaphene$V4
```

```
## Error in eval(expr, envir, enclos): object 'toxaphene' not found
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
-3.030143, 0.2979897, -2.070349, 0, 0, 1, 1, 1,
-2.896452, 1.667344, 0.1807424, 1, 0, 0, 1, 1,
-2.769485, 0.04571099, -2.978263, 1, 0, 0, 1, 1,
-2.725401, 0.5125579, -1.300843, 1, 0, 0, 1, 1,
-2.647734, -1.551663, -3.120363, 1, 0, 0, 1, 1,
-2.513912, -0.7802402, -2.636735, 1, 0, 0, 1, 1,
-2.487681, -0.2267155, -2.60366, 0, 0, 0, 1, 1,
-2.467745, 0.6149942, 0.4798209, 0, 0, 0, 1, 1,
-2.364357, -0.07705141, -0.7723624, 0, 0, 0, 1, 1,
-2.35435, 0.3843592, -2.241675, 0, 0, 0, 1, 1,
-2.350912, 1.505971, 0.3378496, 0, 0, 0, 1, 1,
-2.329069, -1.005703, -2.290389, 0, 0, 0, 1, 1,
-2.205153, 0.4075017, -1.465376, 0, 0, 0, 1, 1,
-2.053443, 0.5496552, -2.134404, 1, 1, 1, 1, 1,
-2.026347, -0.07728255, -1.912589, 1, 1, 1, 1, 1,
-1.972396, -1.138173, -2.085609, 1, 1, 1, 1, 1,
-1.968254, 0.1169976, -0.5717955, 1, 1, 1, 1, 1,
-1.959944, 3.092118, -0.1214669, 1, 1, 1, 1, 1,
-1.926206, -0.1833256, -0.62897, 1, 1, 1, 1, 1,
-1.911903, 0.277242, -0.8734279, 1, 1, 1, 1, 1,
-1.897653, 0.3178864, -0.940201, 1, 1, 1, 1, 1,
-1.893531, -0.1969237, -0.3223691, 1, 1, 1, 1, 1,
-1.836766, -1.461051, -1.780761, 1, 1, 1, 1, 1,
-1.782237, 1.820841, -1.246731, 1, 1, 1, 1, 1,
-1.779131, 0.3938301, -0.9667845, 1, 1, 1, 1, 1,
-1.764049, -1.057124, -3.462092, 1, 1, 1, 1, 1,
-1.758677, 1.205306, -1.427666, 1, 1, 1, 1, 1,
-1.755767, -1.940176, -3.124749, 1, 1, 1, 1, 1,
-1.725888, 1.41638, -1.793393, 0, 0, 1, 1, 1,
-1.713225, -1.105032, -0.967893, 1, 0, 0, 1, 1,
-1.707197, 0.1429129, -0.4078112, 1, 0, 0, 1, 1,
-1.702723, 0.4516548, 1.225068, 1, 0, 0, 1, 1,
-1.69401, 1.543454, -0.8919873, 1, 0, 0, 1, 1,
-1.691264, 0.06419118, -2.260139, 1, 0, 0, 1, 1,
-1.686939, -0.1921354, 1.671028, 0, 0, 0, 1, 1,
-1.68105, 1.178929, -0.3620115, 0, 0, 0, 1, 1,
-1.679001, -1.560869, -4.408547, 0, 0, 0, 1, 1,
-1.658174, 0.1160517, -0.8485066, 0, 0, 0, 1, 1,
-1.649732, 1.561392, -0.4615429, 0, 0, 0, 1, 1,
-1.643442, 0.4093117, 0.7676683, 0, 0, 0, 1, 1,
-1.630034, -1.633663, -1.438439, 0, 0, 0, 1, 1,
-1.599981, 0.5601953, 0.6557537, 1, 1, 1, 1, 1,
-1.593076, -0.7282219, -1.434092, 1, 1, 1, 1, 1,
-1.593017, -0.1118614, -3.358809, 1, 1, 1, 1, 1,
-1.583624, -1.964823, -3.174784, 1, 1, 1, 1, 1,
-1.576748, -0.3651086, -3.431215, 1, 1, 1, 1, 1,
-1.569793, -0.9492947, -1.75564, 1, 1, 1, 1, 1,
-1.543521, -0.2341791, -2.499258, 1, 1, 1, 1, 1,
-1.523824, -1.055648, -1.327786, 1, 1, 1, 1, 1,
-1.501883, -0.06253068, -0.9586159, 1, 1, 1, 1, 1,
-1.499352, 0.3537579, -1.642591, 1, 1, 1, 1, 1,
-1.488387, 0.2283479, -0.6195003, 1, 1, 1, 1, 1,
-1.481402, -0.6877263, -2.656898, 1, 1, 1, 1, 1,
-1.477762, 0.252237, 0.1696514, 1, 1, 1, 1, 1,
-1.476567, -0.4980417, -1.49608, 1, 1, 1, 1, 1,
-1.474676, -0.5209217, -2.886495, 1, 1, 1, 1, 1,
-1.474499, -0.07992376, 0.392592, 0, 0, 1, 1, 1,
-1.471952, -1.47882, -2.213185, 1, 0, 0, 1, 1,
-1.46412, 0.3052564, -2.753138, 1, 0, 0, 1, 1,
-1.450394, 0.4089526, -4.413971, 1, 0, 0, 1, 1,
-1.44846, 0.6092898, -0.8218938, 1, 0, 0, 1, 1,
-1.433927, -0.7952935, -2.605337, 1, 0, 0, 1, 1,
-1.425734, -0.5291536, -2.206766, 0, 0, 0, 1, 1,
-1.425575, 0.8727683, -2.045508, 0, 0, 0, 1, 1,
-1.423782, 0.9053701, -1.797532, 0, 0, 0, 1, 1,
-1.420666, 0.5200284, -0.9553344, 0, 0, 0, 1, 1,
-1.411212, -0.04998225, -3.121974, 0, 0, 0, 1, 1,
-1.402798, -1.810815, -4.926331, 0, 0, 0, 1, 1,
-1.401793, -0.9121778, -2.335607, 0, 0, 0, 1, 1,
-1.398645, -1.033103, -3.970386, 1, 1, 1, 1, 1,
-1.39737, -0.4899921, -3.257198, 1, 1, 1, 1, 1,
-1.393865, -0.3851374, -1.081456, 1, 1, 1, 1, 1,
-1.388956, 1.802658, -0.1323055, 1, 1, 1, 1, 1,
-1.37497, -0.08046541, -1.392307, 1, 1, 1, 1, 1,
-1.367546, -0.7252039, -1.687651, 1, 1, 1, 1, 1,
-1.36572, 0.9217659, -1.482558, 1, 1, 1, 1, 1,
-1.359595, -0.02913318, -1.873531, 1, 1, 1, 1, 1,
-1.329947, 0.1296639, -0.2673672, 1, 1, 1, 1, 1,
-1.322616, -0.1578516, -0.4845726, 1, 1, 1, 1, 1,
-1.320544, 0.7863217, -2.11492, 1, 1, 1, 1, 1,
-1.293013, -0.8422089, -2.3662, 1, 1, 1, 1, 1,
-1.271973, -1.590729, -2.714554, 1, 1, 1, 1, 1,
-1.261899, -0.573588, -3.910209, 1, 1, 1, 1, 1,
-1.259546, -0.4560477, -0.893996, 1, 1, 1, 1, 1,
-1.248509, 0.1673697, -0.4369135, 0, 0, 1, 1, 1,
-1.233184, 1.45364, -0.3953961, 1, 0, 0, 1, 1,
-1.232394, 0.8572245, -0.9156923, 1, 0, 0, 1, 1,
-1.20439, 1.064158, -1.152126, 1, 0, 0, 1, 1,
-1.201383, 0.1539548, -1.383642, 1, 0, 0, 1, 1,
-1.200679, 0.8790375, -0.0995867, 1, 0, 0, 1, 1,
-1.1995, -0.8256937, -1.439691, 0, 0, 0, 1, 1,
-1.19507, -0.6326003, -1.518469, 0, 0, 0, 1, 1,
-1.19207, -0.3497619, -1.845911, 0, 0, 0, 1, 1,
-1.18714, 1.014172, -0.3521784, 0, 0, 0, 1, 1,
-1.17963, 1.077302, -2.705288, 0, 0, 0, 1, 1,
-1.174234, 0.08515207, -1.696229, 0, 0, 0, 1, 1,
-1.170319, 0.1986477, -1.976886, 0, 0, 0, 1, 1,
-1.161385, -0.3217488, -1.200005, 1, 1, 1, 1, 1,
-1.151477, -1.223402, -1.411699, 1, 1, 1, 1, 1,
-1.14757, -1.184103, -1.2618, 1, 1, 1, 1, 1,
-1.145454, 0.2664863, -1.199378, 1, 1, 1, 1, 1,
-1.141703, 0.79943, 0.4074463, 1, 1, 1, 1, 1,
-1.140499, 0.1757336, -2.868834, 1, 1, 1, 1, 1,
-1.137369, 0.6718541, -0.6523028, 1, 1, 1, 1, 1,
-1.136445, 0.4540365, -0.6285784, 1, 1, 1, 1, 1,
-1.135429, -3.495344, -2.073072, 1, 1, 1, 1, 1,
-1.126333, -1.647505, -3.47522, 1, 1, 1, 1, 1,
-1.123096, 0.6227002, -1.086623, 1, 1, 1, 1, 1,
-1.114321, 0.1642305, -1.467486, 1, 1, 1, 1, 1,
-1.114138, -1.459095, -0.768608, 1, 1, 1, 1, 1,
-1.106487, -0.7701967, -0.5194218, 1, 1, 1, 1, 1,
-1.09074, 0.6100796, -2.582029, 1, 1, 1, 1, 1,
-1.089888, 1.653171, -0.2676554, 0, 0, 1, 1, 1,
-1.087881, -0.8330215, 0.0264241, 1, 0, 0, 1, 1,
-1.084454, 0.8156332, -3.298262, 1, 0, 0, 1, 1,
-1.08174, -0.7561458, -3.314468, 1, 0, 0, 1, 1,
-1.080203, -0.4843005, -1.773489, 1, 0, 0, 1, 1,
-1.077661, 1.881283, 0.5875835, 1, 0, 0, 1, 1,
-1.077094, -0.1849975, -2.463539, 0, 0, 0, 1, 1,
-1.068976, -0.1782453, -1.168177, 0, 0, 0, 1, 1,
-1.0684, -0.8951505, -2.362706, 0, 0, 0, 1, 1,
-1.067575, 1.075215, -0.6843974, 0, 0, 0, 1, 1,
-1.06692, 0.6068844, -1.636052, 0, 0, 0, 1, 1,
-1.066875, 0.5510665, -0.9214336, 0, 0, 0, 1, 1,
-1.065269, 1.259211, -0.5551944, 0, 0, 0, 1, 1,
-1.064662, -1.942349, -5.328296, 1, 1, 1, 1, 1,
-1.051881, 0.5029011, -1.035463, 1, 1, 1, 1, 1,
-1.051823, -1.523121, 0.659143, 1, 1, 1, 1, 1,
-1.048303, 1.305235, -0.2055936, 1, 1, 1, 1, 1,
-1.040719, 0.2722879, -0.9196299, 1, 1, 1, 1, 1,
-1.034122, 1.933254, -0.6652501, 1, 1, 1, 1, 1,
-1.029095, 1.017847, -0.7938633, 1, 1, 1, 1, 1,
-1.029006, 0.7574433, 0.8809792, 1, 1, 1, 1, 1,
-1.025632, 0.2001479, -0.3248395, 1, 1, 1, 1, 1,
-1.010118, 0.1062769, -1.098867, 1, 1, 1, 1, 1,
-1.008928, -0.3521268, -2.185607, 1, 1, 1, 1, 1,
-1.007456, -0.3397843, -3.757427, 1, 1, 1, 1, 1,
-1.006824, 0.03132361, -1.862349, 1, 1, 1, 1, 1,
-1.006018, 0.7932322, 0.05446409, 1, 1, 1, 1, 1,
-0.9826351, -0.2775223, -3.820028, 1, 1, 1, 1, 1,
-0.9548275, 0.03866941, -2.002423, 0, 0, 1, 1, 1,
-0.9540924, 0.2519954, -1.276486, 1, 0, 0, 1, 1,
-0.9526245, -0.2483056, -1.335946, 1, 0, 0, 1, 1,
-0.9495429, -0.2038579, -3.047467, 1, 0, 0, 1, 1,
-0.9470626, 0.6233146, -0.6945252, 1, 0, 0, 1, 1,
-0.9417523, 0.1806497, -3.214323, 1, 0, 0, 1, 1,
-0.9384368, -0.772622, -2.780349, 0, 0, 0, 1, 1,
-0.9384125, 1.301487, -2.360552, 0, 0, 0, 1, 1,
-0.9361864, -0.470115, -2.234624, 0, 0, 0, 1, 1,
-0.9355312, 0.3421358, -0.8236748, 0, 0, 0, 1, 1,
-0.9327884, -0.3879381, -1.165077, 0, 0, 0, 1, 1,
-0.9271894, 0.216348, -1.084472, 0, 0, 0, 1, 1,
-0.9253794, 0.4922272, -1.931411, 0, 0, 0, 1, 1,
-0.9174815, -1.068567, -1.894346, 1, 1, 1, 1, 1,
-0.9158942, -0.6104148, -2.649467, 1, 1, 1, 1, 1,
-0.9133764, -0.5021538, -2.75865, 1, 1, 1, 1, 1,
-0.9105076, 0.01482346, -0.7855224, 1, 1, 1, 1, 1,
-0.9067629, -0.8742244, -2.488154, 1, 1, 1, 1, 1,
-0.9024473, -0.8786435, -3.344958, 1, 1, 1, 1, 1,
-0.8990178, -2.760412, -3.265248, 1, 1, 1, 1, 1,
-0.8984953, 0.5212323, -3.060326, 1, 1, 1, 1, 1,
-0.8934172, 0.6401877, -0.9176021, 1, 1, 1, 1, 1,
-0.8933626, 0.5278924, -0.6092631, 1, 1, 1, 1, 1,
-0.8861502, 0.05216859, -3.091759, 1, 1, 1, 1, 1,
-0.8856493, 1.226686, -0.3601689, 1, 1, 1, 1, 1,
-0.8830602, -0.06895929, -2.450541, 1, 1, 1, 1, 1,
-0.8810099, -0.2017089, -1.731712, 1, 1, 1, 1, 1,
-0.8800449, 0.8162464, -2.020377, 1, 1, 1, 1, 1,
-0.8794149, -1.332323, -3.353542, 0, 0, 1, 1, 1,
-0.8745701, 0.07667663, -0.4884301, 1, 0, 0, 1, 1,
-0.871334, 0.1224037, -2.33244, 1, 0, 0, 1, 1,
-0.8712226, -0.5548143, -0.8857023, 1, 0, 0, 1, 1,
-0.861494, 1.533564, 0.9365022, 1, 0, 0, 1, 1,
-0.8577513, 0.07634743, -0.7045248, 1, 0, 0, 1, 1,
-0.8552528, 1.572256, 0.06849054, 0, 0, 0, 1, 1,
-0.8534397, 1.66125, -0.1736315, 0, 0, 0, 1, 1,
-0.8479985, 0.2503969, -1.167018, 0, 0, 0, 1, 1,
-0.8452341, 1.789454, -0.4620623, 0, 0, 0, 1, 1,
-0.843193, 0.2484271, -0.1913138, 0, 0, 0, 1, 1,
-0.842711, 1.625513, -1.408766, 0, 0, 0, 1, 1,
-0.8367861, -0.01421721, -1.7592, 0, 0, 0, 1, 1,
-0.8318528, -0.5488406, -0.7168372, 1, 1, 1, 1, 1,
-0.8206697, 1.026698, 1.097031, 1, 1, 1, 1, 1,
-0.8191242, -0.5902384, -3.21431, 1, 1, 1, 1, 1,
-0.815176, 0.3160071, -0.8511496, 1, 1, 1, 1, 1,
-0.8131214, -1.190522, -0.8559083, 1, 1, 1, 1, 1,
-0.8126898, -0.540192, -2.221308, 1, 1, 1, 1, 1,
-0.811816, 0.286179, 1.503358, 1, 1, 1, 1, 1,
-0.8101119, 0.01704041, -1.83761, 1, 1, 1, 1, 1,
-0.8023396, -0.3188488, -0.3558691, 1, 1, 1, 1, 1,
-0.8011637, -1.565001, -1.958831, 1, 1, 1, 1, 1,
-0.7994294, -0.6163352, -2.14044, 1, 1, 1, 1, 1,
-0.7911853, -0.5406769, -2.454592, 1, 1, 1, 1, 1,
-0.788057, -0.2054325, -1.812014, 1, 1, 1, 1, 1,
-0.7879423, -0.8658912, -3.043781, 1, 1, 1, 1, 1,
-0.7850209, -1.339695, -3.622632, 1, 1, 1, 1, 1,
-0.7755361, -0.8854975, -1.884376, 0, 0, 1, 1, 1,
-0.7734622, 1.74597, 1.143003, 1, 0, 0, 1, 1,
-0.7662597, 1.274764, -1.607983, 1, 0, 0, 1, 1,
-0.764328, -0.5936143, -1.234218, 1, 0, 0, 1, 1,
-0.7628711, 1.200407, -1.18927, 1, 0, 0, 1, 1,
-0.7605373, 0.5456467, -1.694907, 1, 0, 0, 1, 1,
-0.7595036, -0.5117953, -1.85918, 0, 0, 0, 1, 1,
-0.7530515, -0.03689619, -2.981952, 0, 0, 0, 1, 1,
-0.7511339, 0.7246912, -0.9248592, 0, 0, 0, 1, 1,
-0.7464945, 1.766483, -1.100167, 0, 0, 0, 1, 1,
-0.7424767, 2.090635, -0.07558384, 0, 0, 0, 1, 1,
-0.7379889, -0.5436072, -1.140883, 0, 0, 0, 1, 1,
-0.73745, 0.4676562, -0.9404657, 0, 0, 0, 1, 1,
-0.7334576, -0.1939272, -1.872675, 1, 1, 1, 1, 1,
-0.7329862, 1.160046, -0.1116671, 1, 1, 1, 1, 1,
-0.7304949, -1.2932, -3.044366, 1, 1, 1, 1, 1,
-0.7304832, 1.213259, 0.9452361, 1, 1, 1, 1, 1,
-0.7249994, -0.4952609, -1.544913, 1, 1, 1, 1, 1,
-0.7234852, 0.8654273, -0.5761946, 1, 1, 1, 1, 1,
-0.7183121, 0.8908911, -3.404648, 1, 1, 1, 1, 1,
-0.7166457, -0.7353804, -1.370443, 1, 1, 1, 1, 1,
-0.7165934, 0.5459539, -0.8378378, 1, 1, 1, 1, 1,
-0.7142019, -0.07931636, -1.393018, 1, 1, 1, 1, 1,
-0.7130279, -0.9249734, -2.403256, 1, 1, 1, 1, 1,
-0.7056672, -1.204097, -1.763229, 1, 1, 1, 1, 1,
-0.702931, 0.7306373, -0.3292771, 1, 1, 1, 1, 1,
-0.699663, -1.717587, -3.105877, 1, 1, 1, 1, 1,
-0.6981725, -0.1126854, -2.823919, 1, 1, 1, 1, 1,
-0.679853, -0.423015, -4.017641, 0, 0, 1, 1, 1,
-0.6767913, -1.581309, -4.304684, 1, 0, 0, 1, 1,
-0.6755304, -0.2159462, -1.394701, 1, 0, 0, 1, 1,
-0.6753343, 0.2989221, -1.268286, 1, 0, 0, 1, 1,
-0.6740893, 1.690975, 0.0384941, 1, 0, 0, 1, 1,
-0.6740133, 0.7426677, -0.9167694, 1, 0, 0, 1, 1,
-0.6692171, -1.048292, 0.3685502, 0, 0, 0, 1, 1,
-0.6617373, 0.05389858, -2.950548, 0, 0, 0, 1, 1,
-0.6587584, 0.2940139, -2.01445, 0, 0, 0, 1, 1,
-0.6574867, -0.02272167, 0.286213, 0, 0, 0, 1, 1,
-0.6551161, -0.747825, -3.811152, 0, 0, 0, 1, 1,
-0.6514528, -0.25046, -4.759336, 0, 0, 0, 1, 1,
-0.6484616, 0.3936912, -1.55004, 0, 0, 0, 1, 1,
-0.6423907, -0.6837458, -1.006919, 1, 1, 1, 1, 1,
-0.6395758, -0.3195496, -2.215554, 1, 1, 1, 1, 1,
-0.6385874, 0.9349288, 0.7362403, 1, 1, 1, 1, 1,
-0.6376609, -2.249744, -3.075938, 1, 1, 1, 1, 1,
-0.6371092, -0.8293552, -1.357794, 1, 1, 1, 1, 1,
-0.6340281, 2.686418, -1.577219, 1, 1, 1, 1, 1,
-0.6313394, -0.6571794, -1.149799, 1, 1, 1, 1, 1,
-0.6264981, -0.2042381, -2.32808, 1, 1, 1, 1, 1,
-0.6260632, -1.101834, -2.877509, 1, 1, 1, 1, 1,
-0.6257331, -0.8119287, -4.002219, 1, 1, 1, 1, 1,
-0.6188667, 0.5227093, -0.4845776, 1, 1, 1, 1, 1,
-0.6168403, 0.5694625, -0.9829617, 1, 1, 1, 1, 1,
-0.6148762, 1.603177, -0.1841337, 1, 1, 1, 1, 1,
-0.6136445, -0.4130035, -1.442752, 1, 1, 1, 1, 1,
-0.61075, 1.205424, 0.1933639, 1, 1, 1, 1, 1,
-0.6102091, 0.8081369, -1.542825, 0, 0, 1, 1, 1,
-0.606161, 1.175961, 0.2328862, 1, 0, 0, 1, 1,
-0.6031384, -0.9584379, -1.99464, 1, 0, 0, 1, 1,
-0.6021003, 0.3151236, 0.2937368, 1, 0, 0, 1, 1,
-0.5995977, 0.04025211, 1.10083, 1, 0, 0, 1, 1,
-0.5982547, -2.878422, -3.753873, 1, 0, 0, 1, 1,
-0.5960586, -1.25269, -3.661112, 0, 0, 0, 1, 1,
-0.5956488, -0.4341171, -2.619048, 0, 0, 0, 1, 1,
-0.5890619, 0.2745652, -0.4886174, 0, 0, 0, 1, 1,
-0.5871506, -0.4879737, -2.882096, 0, 0, 0, 1, 1,
-0.577855, 0.9918737, -0.3692973, 0, 0, 0, 1, 1,
-0.5770071, -0.3715519, -1.414991, 0, 0, 0, 1, 1,
-0.575643, 1.095759, 0.1746105, 0, 0, 0, 1, 1,
-0.572301, -0.695466, -1.101779, 1, 1, 1, 1, 1,
-0.5721779, 0.226819, -1.460383, 1, 1, 1, 1, 1,
-0.5673889, 0.8872876, -1.444964, 1, 1, 1, 1, 1,
-0.5670693, 0.9729455, 0.3814512, 1, 1, 1, 1, 1,
-0.563356, -1.942154, -2.756132, 1, 1, 1, 1, 1,
-0.5606354, -0.3733386, -3.333082, 1, 1, 1, 1, 1,
-0.5533916, -2.077163, -1.182345, 1, 1, 1, 1, 1,
-0.5521483, 0.4781879, 0.4357724, 1, 1, 1, 1, 1,
-0.5515772, 0.6034229, -1.413248, 1, 1, 1, 1, 1,
-0.5379252, -1.722747, -3.353279, 1, 1, 1, 1, 1,
-0.5356917, 0.310575, -0.9310872, 1, 1, 1, 1, 1,
-0.5341622, 0.993116, -0.7193615, 1, 1, 1, 1, 1,
-0.5336619, 0.5731142, -0.08569928, 1, 1, 1, 1, 1,
-0.5306537, 0.05960273, -1.648926, 1, 1, 1, 1, 1,
-0.5306129, 0.8831258, -1.498029, 1, 1, 1, 1, 1,
-0.5252711, 1.506276, 0.1365842, 0, 0, 1, 1, 1,
-0.5203617, -1.012033, -3.740264, 1, 0, 0, 1, 1,
-0.5188308, -0.1161561, -1.976882, 1, 0, 0, 1, 1,
-0.5084085, 0.1464195, -0.9315799, 1, 0, 0, 1, 1,
-0.50837, -0.1795685, -1.875508, 1, 0, 0, 1, 1,
-0.5079595, 1.605319, 0.889662, 1, 0, 0, 1, 1,
-0.5065639, 1.485222, -1.636596, 0, 0, 0, 1, 1,
-0.5054926, -0.7794721, -2.20966, 0, 0, 0, 1, 1,
-0.5027015, -0.9292788, -2.465021, 0, 0, 0, 1, 1,
-0.4958559, 0.1624714, -3.188813, 0, 0, 0, 1, 1,
-0.4925991, 1.461233, 0.6595553, 0, 0, 0, 1, 1,
-0.4917386, -0.0921544, -1.442952, 0, 0, 0, 1, 1,
-0.486755, 0.1085232, -1.163907, 0, 0, 0, 1, 1,
-0.480992, 0.09788478, -1.231135, 1, 1, 1, 1, 1,
-0.477845, 0.8360726, -0.2185615, 1, 1, 1, 1, 1,
-0.4778056, -2.120582, -1.802463, 1, 1, 1, 1, 1,
-0.4765211, 0.1449722, -0.8212625, 1, 1, 1, 1, 1,
-0.476489, 0.1873967, 0.04847895, 1, 1, 1, 1, 1,
-0.4721121, -0.7783298, -2.89868, 1, 1, 1, 1, 1,
-0.4720812, -0.2052639, -3.381534, 1, 1, 1, 1, 1,
-0.4708519, 0.3455938, -0.6308574, 1, 1, 1, 1, 1,
-0.4696063, 0.08694584, -0.04544359, 1, 1, 1, 1, 1,
-0.4684086, 1.524235, -0.8012327, 1, 1, 1, 1, 1,
-0.4631539, -0.525934, -3.389646, 1, 1, 1, 1, 1,
-0.4625709, 0.9339435, -0.7495342, 1, 1, 1, 1, 1,
-0.4594062, 1.300252, -1.881798, 1, 1, 1, 1, 1,
-0.4582888, -0.03684846, -0.6095777, 1, 1, 1, 1, 1,
-0.4560036, -1.013822, -2.96804, 1, 1, 1, 1, 1,
-0.4498042, -1.322821, -3.375814, 0, 0, 1, 1, 1,
-0.4491739, 0.9099803, -0.8971902, 1, 0, 0, 1, 1,
-0.4489486, -1.507956, -3.943143, 1, 0, 0, 1, 1,
-0.4485616, -0.5327352, -1.792324, 1, 0, 0, 1, 1,
-0.443983, 0.2703231, -0.8823546, 1, 0, 0, 1, 1,
-0.4422523, -0.2405416, -0.9792868, 1, 0, 0, 1, 1,
-0.4403875, -0.8730356, -1.371249, 0, 0, 0, 1, 1,
-0.4398987, -0.4002179, -2.847397, 0, 0, 0, 1, 1,
-0.4398527, -0.6159456, -2.072999, 0, 0, 0, 1, 1,
-0.439418, -0.7458714, -4.225379, 0, 0, 0, 1, 1,
-0.4386045, 0.4270983, -0.1986964, 0, 0, 0, 1, 1,
-0.4369091, 1.505757, 0.1614105, 0, 0, 0, 1, 1,
-0.4356972, 0.5833685, -0.8331894, 0, 0, 0, 1, 1,
-0.4352973, -2.093328, -2.815768, 1, 1, 1, 1, 1,
-0.4350955, 1.64423, 1.439576, 1, 1, 1, 1, 1,
-0.4298315, 0.2376992, -1.63093, 1, 1, 1, 1, 1,
-0.4292395, -0.04231662, -0.7047393, 1, 1, 1, 1, 1,
-0.4287367, 2.022016, -0.6307628, 1, 1, 1, 1, 1,
-0.4258883, -0.8765749, -4.23361, 1, 1, 1, 1, 1,
-0.4239768, -0.7905137, -1.788265, 1, 1, 1, 1, 1,
-0.4226924, 0.9700075, -2.059151, 1, 1, 1, 1, 1,
-0.4218442, -0.4882477, -2.15793, 1, 1, 1, 1, 1,
-0.419498, -0.1399319, -1.154222, 1, 1, 1, 1, 1,
-0.4187282, -1.737939, -2.783586, 1, 1, 1, 1, 1,
-0.4173496, -0.8787665, -3.968419, 1, 1, 1, 1, 1,
-0.4167957, 0.0882277, -1.434057, 1, 1, 1, 1, 1,
-0.4129767, 1.036235, -1.514107, 1, 1, 1, 1, 1,
-0.4126296, 0.1565548, -0.2365015, 1, 1, 1, 1, 1,
-0.4092288, -0.120859, -1.896017, 0, 0, 1, 1, 1,
-0.4047546, 1.01346, -0.8182029, 1, 0, 0, 1, 1,
-0.4006505, -0.06181171, -2.712023, 1, 0, 0, 1, 1,
-0.3984109, 0.7295745, 0.4512934, 1, 0, 0, 1, 1,
-0.3976801, -0.1573272, -2.133595, 1, 0, 0, 1, 1,
-0.3945996, -0.0386865, -1.038778, 1, 0, 0, 1, 1,
-0.39371, -2.750429, -2.055566, 0, 0, 0, 1, 1,
-0.3931557, -0.3309895, -2.860568, 0, 0, 0, 1, 1,
-0.3891812, 1.604435, -0.5474629, 0, 0, 0, 1, 1,
-0.3878994, -0.6719109, -1.165619, 0, 0, 0, 1, 1,
-0.3872791, -1.310149, -3.385221, 0, 0, 0, 1, 1,
-0.3871767, -0.6395046, -2.982015, 0, 0, 0, 1, 1,
-0.3806916, 0.280484, 0.1939267, 0, 0, 0, 1, 1,
-0.3701497, 0.5835471, -0.4933439, 1, 1, 1, 1, 1,
-0.36845, 0.3622845, -1.971617, 1, 1, 1, 1, 1,
-0.3677061, -0.939004, -2.04645, 1, 1, 1, 1, 1,
-0.3668179, 1.151557, -1.108203, 1, 1, 1, 1, 1,
-0.3661115, -0.9973484, -4.153563, 1, 1, 1, 1, 1,
-0.3582881, -1.140294, -3.161122, 1, 1, 1, 1, 1,
-0.3580546, 1.572756, -1.329301, 1, 1, 1, 1, 1,
-0.3554569, 0.3982514, -0.3811581, 1, 1, 1, 1, 1,
-0.3513224, -0.9944209, -2.73368, 1, 1, 1, 1, 1,
-0.3476231, 1.244931, -2.195676, 1, 1, 1, 1, 1,
-0.3474688, -0.6108415, -1.080311, 1, 1, 1, 1, 1,
-0.3463406, -0.5781945, -2.590256, 1, 1, 1, 1, 1,
-0.3423938, -0.8309543, -3.033912, 1, 1, 1, 1, 1,
-0.3418312, 0.6813744, -0.6285555, 1, 1, 1, 1, 1,
-0.3386785, 0.4669895, -2.132272, 1, 1, 1, 1, 1,
-0.3351661, 1.074894, -0.01862259, 0, 0, 1, 1, 1,
-0.3328419, 0.04224136, -0.7462904, 1, 0, 0, 1, 1,
-0.3319091, -0.9556613, -2.369301, 1, 0, 0, 1, 1,
-0.3271345, 1.106144, -0.6730536, 1, 0, 0, 1, 1,
-0.3220136, 0.06029627, -2.844024, 1, 0, 0, 1, 1,
-0.3203545, 1.02425, -0.8503618, 1, 0, 0, 1, 1,
-0.316499, -0.550341, -2.145111, 0, 0, 0, 1, 1,
-0.3161926, -0.4916443, -3.36068, 0, 0, 0, 1, 1,
-0.3148436, -1.125771, -1.133301, 0, 0, 0, 1, 1,
-0.3137473, -1.119206, -1.986567, 0, 0, 0, 1, 1,
-0.3102279, -0.7612618, -3.232035, 0, 0, 0, 1, 1,
-0.3095661, 0.8695581, -0.515527, 0, 0, 0, 1, 1,
-0.3095596, 1.948864, -0.009733386, 0, 0, 0, 1, 1,
-0.3070076, -1.194372, -2.891239, 1, 1, 1, 1, 1,
-0.2968959, 0.2441545, -2.561314, 1, 1, 1, 1, 1,
-0.2946315, 0.3020519, -0.4160024, 1, 1, 1, 1, 1,
-0.291014, -0.3926058, -2.281148, 1, 1, 1, 1, 1,
-0.2880644, 0.5082852, -0.4821759, 1, 1, 1, 1, 1,
-0.2868855, 0.3363164, -0.9756786, 1, 1, 1, 1, 1,
-0.283833, -0.3076243, -1.680227, 1, 1, 1, 1, 1,
-0.2818748, 0.5566406, 1.755059, 1, 1, 1, 1, 1,
-0.2798402, -1.007478, -4.141915, 1, 1, 1, 1, 1,
-0.2748229, 0.875762, -0.4252595, 1, 1, 1, 1, 1,
-0.2733213, 0.112718, -3.141236, 1, 1, 1, 1, 1,
-0.2725264, 0.8592096, 0.2783868, 1, 1, 1, 1, 1,
-0.2715647, 0.02314304, -0.3244504, 1, 1, 1, 1, 1,
-0.2694904, 0.7363522, -1.33571, 1, 1, 1, 1, 1,
-0.2678036, 0.3269795, -1.459792, 1, 1, 1, 1, 1,
-0.263281, 1.743424, -1.563111, 0, 0, 1, 1, 1,
-0.2592659, -0.4216682, -2.982133, 1, 0, 0, 1, 1,
-0.2572619, -1.315817, -1.259541, 1, 0, 0, 1, 1,
-0.2569221, 1.307282, 0.3493643, 1, 0, 0, 1, 1,
-0.2509817, -0.8372321, -2.360267, 1, 0, 0, 1, 1,
-0.2501209, -0.2967497, -4.410094, 1, 0, 0, 1, 1,
-0.2476464, -1.258508, -1.950631, 0, 0, 0, 1, 1,
-0.246994, -0.2519437, -2.52681, 0, 0, 0, 1, 1,
-0.2466179, 0.5422015, -0.990533, 0, 0, 0, 1, 1,
-0.2361134, -1.460977, -5.553584, 0, 0, 0, 1, 1,
-0.2319953, -0.08964371, -2.480128, 0, 0, 0, 1, 1,
-0.2304929, 0.6155882, -0.407951, 0, 0, 0, 1, 1,
-0.2232315, -0.3145832, -4.76007, 0, 0, 0, 1, 1,
-0.222524, 0.4195892, -1.620275, 1, 1, 1, 1, 1,
-0.2208803, 0.4502487, -1.298197, 1, 1, 1, 1, 1,
-0.2157628, 0.7894889, -1.158317, 1, 1, 1, 1, 1,
-0.2049929, -0.9786228, -2.685368, 1, 1, 1, 1, 1,
-0.2047416, 0.1212639, -1.748026, 1, 1, 1, 1, 1,
-0.2042287, -0.6289151, -4.124453, 1, 1, 1, 1, 1,
-0.2028744, -1.009645, -4.441759, 1, 1, 1, 1, 1,
-0.20179, -1.425148, -2.606294, 1, 1, 1, 1, 1,
-0.1998056, -1.279526, -3.332498, 1, 1, 1, 1, 1,
-0.1990546, -1.05507, -3.176616, 1, 1, 1, 1, 1,
-0.1987656, -0.08626005, -1.340145, 1, 1, 1, 1, 1,
-0.1986037, -0.01931976, -0.8381339, 1, 1, 1, 1, 1,
-0.1969107, -0.3397741, -3.725843, 1, 1, 1, 1, 1,
-0.1910738, 0.4355, 0.5342245, 1, 1, 1, 1, 1,
-0.1906387, -0.580284, -1.560871, 1, 1, 1, 1, 1,
-0.1876532, 0.5335727, 0.5011512, 0, 0, 1, 1, 1,
-0.1829755, 0.7392293, -1.685031, 1, 0, 0, 1, 1,
-0.1803422, 1.026344, 0.215144, 1, 0, 0, 1, 1,
-0.1764302, -1.620693, -3.915538, 1, 0, 0, 1, 1,
-0.1755792, 1.373763, 0.4336863, 1, 0, 0, 1, 1,
-0.1746481, -0.6532293, -3.009441, 1, 0, 0, 1, 1,
-0.1742145, 0.6578996, 0.2889226, 0, 0, 0, 1, 1,
-0.1724863, 1.477422, -0.6621025, 0, 0, 0, 1, 1,
-0.1710128, 0.8087156, -2.027758, 0, 0, 0, 1, 1,
-0.1518869, 0.882621, -0.1077863, 0, 0, 0, 1, 1,
-0.1511655, 1.15565, 0.8439178, 0, 0, 0, 1, 1,
-0.1505385, -0.733907, -2.966434, 0, 0, 0, 1, 1,
-0.150034, 0.1460788, -1.145116, 0, 0, 0, 1, 1,
-0.149577, -0.3468699, -4.346637, 1, 1, 1, 1, 1,
-0.1366884, -0.7496606, -4.093024, 1, 1, 1, 1, 1,
-0.1339806, 1.103095, 0.08582201, 1, 1, 1, 1, 1,
-0.1327379, 0.7145614, -1.546289, 1, 1, 1, 1, 1,
-0.1304919, 0.3260609, -0.3684796, 1, 1, 1, 1, 1,
-0.1304857, -0.6992056, -2.28568, 1, 1, 1, 1, 1,
-0.1301728, -1.280651, -3.340703, 1, 1, 1, 1, 1,
-0.1284632, -0.9859915, -2.557914, 1, 1, 1, 1, 1,
-0.1278529, 0.3962598, -0.8078411, 1, 1, 1, 1, 1,
-0.1273978, -1.775213, -1.677828, 1, 1, 1, 1, 1,
-0.1238394, 1.253449, -1.19702, 1, 1, 1, 1, 1,
-0.1194305, -1.458725, -2.792234, 1, 1, 1, 1, 1,
-0.1188648, 1.066634, -0.6990985, 1, 1, 1, 1, 1,
-0.1150296, -0.2472437, -2.603816, 1, 1, 1, 1, 1,
-0.1105561, 0.7659662, -0.3543328, 1, 1, 1, 1, 1,
-0.106622, -1.468634, -2.919827, 0, 0, 1, 1, 1,
-0.101744, 0.2548008, -0.6073953, 1, 0, 0, 1, 1,
-0.09051698, 1.269425, -1.509105, 1, 0, 0, 1, 1,
-0.08596614, 0.6388569, 0.383012, 1, 0, 0, 1, 1,
-0.08442158, -0.805455, -3.885748, 1, 0, 0, 1, 1,
-0.08269101, 1.718751, -0.9498042, 1, 0, 0, 1, 1,
-0.08198503, 1.395645, -0.7006848, 0, 0, 0, 1, 1,
-0.07272174, -0.6578459, -5.69792, 0, 0, 0, 1, 1,
-0.0725754, 1.461575, -1.332329, 0, 0, 0, 1, 1,
-0.0723452, 1.325044, -0.9145281, 0, 0, 0, 1, 1,
-0.07108705, -1.125487, -4.20697, 0, 0, 0, 1, 1,
-0.07091338, -0.1524144, -1.738255, 0, 0, 0, 1, 1,
-0.06863695, -0.06635895, -2.752342, 0, 0, 0, 1, 1,
-0.06362031, 0.8810971, -0.7196344, 1, 1, 1, 1, 1,
-0.06223872, -0.441745, -2.531637, 1, 1, 1, 1, 1,
-0.06130396, 0.8267201, 0.6705576, 1, 1, 1, 1, 1,
-0.06087483, 0.340876, -1.883952, 1, 1, 1, 1, 1,
-0.06050278, -2.221502, -2.752278, 1, 1, 1, 1, 1,
-0.05970022, -0.4644479, -3.821351, 1, 1, 1, 1, 1,
-0.05906778, -0.3684091, -2.948175, 1, 1, 1, 1, 1,
-0.05886184, 1.09623, -2.39907, 1, 1, 1, 1, 1,
-0.04963272, 2.645914, -1.225822, 1, 1, 1, 1, 1,
-0.0439947, -1.009366, -1.260067, 1, 1, 1, 1, 1,
-0.04385013, -1.759347, -3.232752, 1, 1, 1, 1, 1,
-0.03881032, 2.223504, -1.717927, 1, 1, 1, 1, 1,
-0.03474049, 2.812018, 0.2681645, 1, 1, 1, 1, 1,
-0.03102993, -0.3454862, -3.03482, 1, 1, 1, 1, 1,
-0.03072188, 0.1791624, 0.7254802, 1, 1, 1, 1, 1,
-0.03032443, -0.2010233, -1.460435, 0, 0, 1, 1, 1,
-0.02816956, 0.1775397, -0.6294953, 1, 0, 0, 1, 1,
-0.02531965, -0.1993746, -4.326869, 1, 0, 0, 1, 1,
-0.02103098, 3.032052, -0.5077783, 1, 0, 0, 1, 1,
-0.0207971, 0.4376391, 1.07635, 1, 0, 0, 1, 1,
-0.01978274, -0.8122483, -3.236259, 1, 0, 0, 1, 1,
-0.01731505, 0.4450405, -0.1554474, 0, 0, 0, 1, 1,
-0.01720457, -0.2080004, -1.173066, 0, 0, 0, 1, 1,
-0.01696515, 0.3585777, -0.4786556, 0, 0, 0, 1, 1,
-0.01438561, 0.07856116, 1.082, 0, 0, 0, 1, 1,
-0.01137852, -0.09868991, -3.308086, 0, 0, 0, 1, 1,
-0.01132248, -0.1686551, -1.704715, 0, 0, 0, 1, 1,
-0.0110369, 2.195984, 0.4875341, 0, 0, 0, 1, 1,
-0.01051706, -0.1798255, -3.967141, 1, 1, 1, 1, 1,
-0.008410696, -1.049459, -0.8479428, 1, 1, 1, 1, 1,
-0.006922684, 0.650782, 0.71837, 1, 1, 1, 1, 1,
-0.004638397, -0.1978754, -1.488042, 1, 1, 1, 1, 1,
-0.00352146, -0.9587271, -3.932994, 1, 1, 1, 1, 1,
-0.001537785, -0.9828188, -1.656793, 1, 1, 1, 1, 1,
0.006070997, 1.75874, -0.01498096, 1, 1, 1, 1, 1,
0.007372102, 0.7703774, -0.09073933, 1, 1, 1, 1, 1,
0.01238857, 0.3536409, 0.6943687, 1, 1, 1, 1, 1,
0.013854, -0.1617772, 2.151189, 1, 1, 1, 1, 1,
0.01436989, 0.994496, 1.165548, 1, 1, 1, 1, 1,
0.01475895, 0.2088672, 0.3648769, 1, 1, 1, 1, 1,
0.02113078, 0.8718727, -0.9207845, 1, 1, 1, 1, 1,
0.03264784, -0.6912284, 3.63837, 1, 1, 1, 1, 1,
0.03302196, -0.903006, 2.041067, 1, 1, 1, 1, 1,
0.0343243, -0.4942478, 4.173697, 0, 0, 1, 1, 1,
0.04217304, -1.346116, 2.03929, 1, 0, 0, 1, 1,
0.04235569, 0.9953504, -1.154348, 1, 0, 0, 1, 1,
0.04664639, 0.2666274, 1.138976, 1, 0, 0, 1, 1,
0.05363564, 0.727134, -1.628935, 1, 0, 0, 1, 1,
0.05568676, -0.2389527, 4.111359, 1, 0, 0, 1, 1,
0.06089334, -0.5446126, 2.668512, 0, 0, 0, 1, 1,
0.06609244, 1.206493, 0.5657952, 0, 0, 0, 1, 1,
0.07314648, -0.9631054, 4.613409, 0, 0, 0, 1, 1,
0.0762651, -1.461322, 3.483169, 0, 0, 0, 1, 1,
0.07636584, 1.041676, -0.2035827, 0, 0, 0, 1, 1,
0.08219008, 0.1045276, 1.263032, 0, 0, 0, 1, 1,
0.08454833, -1.175949, 2.928677, 0, 0, 0, 1, 1,
0.08463571, -0.3274632, 2.11368, 1, 1, 1, 1, 1,
0.08640689, 0.3422834, 0.5723986, 1, 1, 1, 1, 1,
0.08962287, -0.5052543, 4.062533, 1, 1, 1, 1, 1,
0.09018505, -0.8453962, 4.076072, 1, 1, 1, 1, 1,
0.09216224, -0.5824886, 1.640832, 1, 1, 1, 1, 1,
0.09660238, 1.058402, -0.7643058, 1, 1, 1, 1, 1,
0.0973121, -0.404764, 3.425019, 1, 1, 1, 1, 1,
0.09910189, -1.010157, 2.892072, 1, 1, 1, 1, 1,
0.1022758, 1.859656, -0.8851012, 1, 1, 1, 1, 1,
0.1048611, -1.589799, 3.213028, 1, 1, 1, 1, 1,
0.1084316, -0.311916, 2.330508, 1, 1, 1, 1, 1,
0.1101487, 0.2272947, -1.758607, 1, 1, 1, 1, 1,
0.1110223, 0.7864192, 0.5892023, 1, 1, 1, 1, 1,
0.1149385, 0.1760065, 0.5595898, 1, 1, 1, 1, 1,
0.1193843, 0.1471834, 0.7822673, 1, 1, 1, 1, 1,
0.1200139, 0.2860925, 1.308673, 0, 0, 1, 1, 1,
0.1217636, -1.251518, 3.247646, 1, 0, 0, 1, 1,
0.1218852, 1.28057, 1.133388, 1, 0, 0, 1, 1,
0.1232347, -2.036304, 1.526164, 1, 0, 0, 1, 1,
0.1253709, -2.112983, 3.124168, 1, 0, 0, 1, 1,
0.1283782, 0.5804338, 0.6470934, 1, 0, 0, 1, 1,
0.1295837, -1.661547, 3.429716, 0, 0, 0, 1, 1,
0.1305055, -0.9845924, 2.681137, 0, 0, 0, 1, 1,
0.1307244, 1.611212, 0.4203802, 0, 0, 0, 1, 1,
0.1329582, -0.8386524, 4.953198, 0, 0, 0, 1, 1,
0.1330327, -2.11961, 4.596451, 0, 0, 0, 1, 1,
0.1363189, -0.779897, 2.780947, 0, 0, 0, 1, 1,
0.1435496, 0.7969651, -1.349127, 0, 0, 0, 1, 1,
0.1447602, 0.7961465, 0.27204, 1, 1, 1, 1, 1,
0.1526801, -0.1523425, 4.923188, 1, 1, 1, 1, 1,
0.1543281, -0.5300987, 2.039471, 1, 1, 1, 1, 1,
0.1561299, 1.118673, 0.4665633, 1, 1, 1, 1, 1,
0.1605442, 0.2931348, 0.9708524, 1, 1, 1, 1, 1,
0.1622353, 0.3755955, 1.023524, 1, 1, 1, 1, 1,
0.1629771, -0.9853559, 3.890349, 1, 1, 1, 1, 1,
0.1657703, -1.541945, 2.727657, 1, 1, 1, 1, 1,
0.1754037, 1.128551, -0.2433463, 1, 1, 1, 1, 1,
0.176267, 0.2920163, 0.7327222, 1, 1, 1, 1, 1,
0.1780841, -1.076323, 3.890529, 1, 1, 1, 1, 1,
0.1781319, 0.4932055, -0.477101, 1, 1, 1, 1, 1,
0.1783152, 0.7159446, -0.1061648, 1, 1, 1, 1, 1,
0.1858577, -1.04335, 3.940124, 1, 1, 1, 1, 1,
0.1908597, 0.07032035, -0.27474, 1, 1, 1, 1, 1,
0.1972086, 0.04473194, 1.254543, 0, 0, 1, 1, 1,
0.1994192, 0.06707196, 1.540923, 1, 0, 0, 1, 1,
0.2007692, 0.5704351, 0.3655336, 1, 0, 0, 1, 1,
0.2023971, 0.04547732, 1.127851, 1, 0, 0, 1, 1,
0.2029927, 0.9910554, -1.704412, 1, 0, 0, 1, 1,
0.203667, -1.07853, 2.131427, 1, 0, 0, 1, 1,
0.205586, -0.5719662, 1.649855, 0, 0, 0, 1, 1,
0.2067902, -0.5684074, 1.96565, 0, 0, 0, 1, 1,
0.207474, 1.550181, -0.8827775, 0, 0, 0, 1, 1,
0.2080877, -0.1306904, 1.923285, 0, 0, 0, 1, 1,
0.2135977, -1.630138, 3.24192, 0, 0, 0, 1, 1,
0.2139984, 0.09943911, 1.187484, 0, 0, 0, 1, 1,
0.2194042, -0.436933, 2.49043, 0, 0, 0, 1, 1,
0.2216814, -1.769343, 3.357661, 1, 1, 1, 1, 1,
0.2256172, -0.4129032, 0.8043698, 1, 1, 1, 1, 1,
0.2261977, -1.51561, 2.696409, 1, 1, 1, 1, 1,
0.2262853, -0.8223777, 3.644131, 1, 1, 1, 1, 1,
0.2306739, -0.4796948, 1.875295, 1, 1, 1, 1, 1,
0.2328056, 0.4288534, 0.5176267, 1, 1, 1, 1, 1,
0.2345755, 0.3689055, 1.101688, 1, 1, 1, 1, 1,
0.2368205, 0.37089, -0.5852718, 1, 1, 1, 1, 1,
0.23932, 0.7579554, 1.65576, 1, 1, 1, 1, 1,
0.2394109, -1.193888, 1.324737, 1, 1, 1, 1, 1,
0.2400467, -1.473797, 4.03218, 1, 1, 1, 1, 1,
0.2407144, -0.01335786, 1.730075, 1, 1, 1, 1, 1,
0.2451992, -0.7210343, 4.338712, 1, 1, 1, 1, 1,
0.2455938, -1.205091, 3.472405, 1, 1, 1, 1, 1,
0.2528801, -1.097677, 1.453562, 1, 1, 1, 1, 1,
0.2531281, -1.201104, 4.10868, 0, 0, 1, 1, 1,
0.253595, 0.08531714, 2.599693, 1, 0, 0, 1, 1,
0.2598915, -1.692967, 3.272896, 1, 0, 0, 1, 1,
0.2610251, -0.5649499, 3.166541, 1, 0, 0, 1, 1,
0.2623104, 0.272795, 0.1372811, 1, 0, 0, 1, 1,
0.2664619, 2.148006, 1.032533, 1, 0, 0, 1, 1,
0.2691095, -0.3509796, 3.109962, 0, 0, 0, 1, 1,
0.2739753, -1.059495, 3.555358, 0, 0, 0, 1, 1,
0.2746946, 1.453249, 1.001111, 0, 0, 0, 1, 1,
0.2748008, 0.01575176, 2.036458, 0, 0, 0, 1, 1,
0.2757876, 0.4894343, 0.8238303, 0, 0, 0, 1, 1,
0.2769139, 1.638396, -0.06845395, 0, 0, 0, 1, 1,
0.2868514, 0.245073, -0.53933, 0, 0, 0, 1, 1,
0.2933387, -0.1858189, 2.249574, 1, 1, 1, 1, 1,
0.2962609, 1.281476, 0.490821, 1, 1, 1, 1, 1,
0.2971559, 0.04077092, 2.396703, 1, 1, 1, 1, 1,
0.3061357, 2.707905, 0.2048694, 1, 1, 1, 1, 1,
0.3070155, 0.5449821, 1.127571, 1, 1, 1, 1, 1,
0.3095175, -0.586519, 1.683306, 1, 1, 1, 1, 1,
0.3095531, -0.4560655, 2.128378, 1, 1, 1, 1, 1,
0.3101752, -0.3804339, 0.2078799, 1, 1, 1, 1, 1,
0.3128657, 0.7629243, 1.808099, 1, 1, 1, 1, 1,
0.3132985, 0.5016991, -1.615187, 1, 1, 1, 1, 1,
0.3178357, 1.594381, -2.106729, 1, 1, 1, 1, 1,
0.3178555, 0.2004676, 0.6334149, 1, 1, 1, 1, 1,
0.322607, -0.4667219, 3.474416, 1, 1, 1, 1, 1,
0.3241491, 1.332254, 0.20516, 1, 1, 1, 1, 1,
0.3246775, 1.124565, 0.2714101, 1, 1, 1, 1, 1,
0.3265727, -1.327248, 4.501904, 0, 0, 1, 1, 1,
0.3341183, -0.735854, 3.118626, 1, 0, 0, 1, 1,
0.3362719, -0.3105321, 0.7856424, 1, 0, 0, 1, 1,
0.3363388, 0.2092932, 1.453365, 1, 0, 0, 1, 1,
0.3399351, 1.23391, -2.297754, 1, 0, 0, 1, 1,
0.344558, -0.5052429, 1.658903, 1, 0, 0, 1, 1,
0.3455777, 0.347656, 1.348769, 0, 0, 0, 1, 1,
0.3475082, -0.3383343, 2.830351, 0, 0, 0, 1, 1,
0.3493039, -0.5556777, 1.946466, 0, 0, 0, 1, 1,
0.3501541, -0.2282039, 2.694643, 0, 0, 0, 1, 1,
0.3504049, 0.1729038, 0.3478022, 0, 0, 0, 1, 1,
0.3523017, -2.213748, 1.970821, 0, 0, 0, 1, 1,
0.3590946, 0.2612877, 0.6673832, 0, 0, 0, 1, 1,
0.3592495, -1.417248, 4.002265, 1, 1, 1, 1, 1,
0.3595807, 0.5318307, 0.4284112, 1, 1, 1, 1, 1,
0.3598274, -0.05988123, 1.769968, 1, 1, 1, 1, 1,
0.3604254, 0.4180368, 0.8949976, 1, 1, 1, 1, 1,
0.3604526, 1.201276, -1.696781, 1, 1, 1, 1, 1,
0.360743, -0.2744406, 2.531138, 1, 1, 1, 1, 1,
0.3618971, -0.1452054, 0.4256746, 1, 1, 1, 1, 1,
0.3650784, 0.6642172, 1.465891, 1, 1, 1, 1, 1,
0.3716495, -1.383119, 2.600269, 1, 1, 1, 1, 1,
0.3739812, -0.3896658, 3.149941, 1, 1, 1, 1, 1,
0.380115, 0.1170672, -0.6648136, 1, 1, 1, 1, 1,
0.382848, -0.9996421, 2.300723, 1, 1, 1, 1, 1,
0.3847529, 0.4479371, 1.535696, 1, 1, 1, 1, 1,
0.3853656, -0.8905001, 2.462206, 1, 1, 1, 1, 1,
0.3913397, -1.349032, 2.548508, 1, 1, 1, 1, 1,
0.3913768, -0.5050011, 3.899634, 0, 0, 1, 1, 1,
0.3982306, 0.2201972, 1.225162, 1, 0, 0, 1, 1,
0.3982457, -0.5760998, 3.399658, 1, 0, 0, 1, 1,
0.4000843, 0.2256426, 0.7111835, 1, 0, 0, 1, 1,
0.405056, -1.552682, 2.941342, 1, 0, 0, 1, 1,
0.4179723, 1.020625, 0.1535511, 1, 0, 0, 1, 1,
0.4215786, 0.7619472, 1.140035, 0, 0, 0, 1, 1,
0.4220599, -0.4598761, 2.988907, 0, 0, 0, 1, 1,
0.4250746, 0.6388562, 2.311788, 0, 0, 0, 1, 1,
0.4265152, -0.332589, 1.232799, 0, 0, 0, 1, 1,
0.4283052, -1.842318, 2.482036, 0, 0, 0, 1, 1,
0.4344399, -1.337571, 1.445567, 0, 0, 0, 1, 1,
0.4369976, -1.160661, 2.588166, 0, 0, 0, 1, 1,
0.4371571, 0.2104979, -0.2113854, 1, 1, 1, 1, 1,
0.4380412, 0.5862314, 1.557512, 1, 1, 1, 1, 1,
0.4406363, -0.7635491, 1.012609, 1, 1, 1, 1, 1,
0.444706, -1.645652, 3.977102, 1, 1, 1, 1, 1,
0.4493725, 1.220165, 1.34918, 1, 1, 1, 1, 1,
0.45456, -0.08253247, 2.404318, 1, 1, 1, 1, 1,
0.4641825, 0.2032024, 0.2944756, 1, 1, 1, 1, 1,
0.4691591, 0.6169342, 1.020095, 1, 1, 1, 1, 1,
0.471375, -0.1559191, 3.053934, 1, 1, 1, 1, 1,
0.4746858, -1.101563, 3.838671, 1, 1, 1, 1, 1,
0.4755805, 0.8283022, -0.528461, 1, 1, 1, 1, 1,
0.4769071, 0.6300584, -0.7208303, 1, 1, 1, 1, 1,
0.478921, -1.286268, 2.450936, 1, 1, 1, 1, 1,
0.4816293, -0.4986139, 2.251886, 1, 1, 1, 1, 1,
0.4851458, 0.8673791, 1.778816, 1, 1, 1, 1, 1,
0.4853125, 1.370449, 1.349038, 0, 0, 1, 1, 1,
0.4878958, 0.1758304, 2.097594, 1, 0, 0, 1, 1,
0.4883911, -1.369909, 2.6854, 1, 0, 0, 1, 1,
0.4923475, 0.3287165, 1.327927, 1, 0, 0, 1, 1,
0.4946733, 0.3069509, 0.280216, 1, 0, 0, 1, 1,
0.5021983, 0.4308202, 1.43505, 1, 0, 0, 1, 1,
0.5026368, 0.3580013, 0.2687218, 0, 0, 0, 1, 1,
0.5033999, 1.068153, -1.809163, 0, 0, 0, 1, 1,
0.5037065, 0.1248274, 1.298918, 0, 0, 0, 1, 1,
0.5072036, -1.358256, 3.647213, 0, 0, 0, 1, 1,
0.5078171, -0.3723656, 0.8604674, 0, 0, 0, 1, 1,
0.5081248, -0.0922117, 5.259595, 0, 0, 0, 1, 1,
0.5143021, -0.4991343, 2.665149, 0, 0, 0, 1, 1,
0.5161337, -0.9830155, 2.983926, 1, 1, 1, 1, 1,
0.5206112, -0.925617, 1.886307, 1, 1, 1, 1, 1,
0.5247201, 0.5668397, 0.6254001, 1, 1, 1, 1, 1,
0.5266186, 0.9345797, 0.4376515, 1, 1, 1, 1, 1,
0.5293146, -0.2884782, 1.716697, 1, 1, 1, 1, 1,
0.5314981, 0.4060143, 0.5300083, 1, 1, 1, 1, 1,
0.5358118, 0.1681574, -0.2344818, 1, 1, 1, 1, 1,
0.5369749, -0.6195269, 2.379494, 1, 1, 1, 1, 1,
0.5389429, 0.8464565, 2.984096, 1, 1, 1, 1, 1,
0.5417709, -0.09872692, 2.537208, 1, 1, 1, 1, 1,
0.5447922, -0.757313, 2.95004, 1, 1, 1, 1, 1,
0.5455223, -0.02754613, 2.761763, 1, 1, 1, 1, 1,
0.5478721, 1.24688, 2.432781, 1, 1, 1, 1, 1,
0.552841, 0.4954596, 2.483871, 1, 1, 1, 1, 1,
0.555168, -1.016014, 4.140144, 1, 1, 1, 1, 1,
0.5576349, -0.972715, 3.521299, 0, 0, 1, 1, 1,
0.5612419, 0.2636245, 1.030679, 1, 0, 0, 1, 1,
0.5659447, -0.3378803, 1.514995, 1, 0, 0, 1, 1,
0.5676559, -0.1869111, 1.136637, 1, 0, 0, 1, 1,
0.5770013, 0.9018408, 0.4328043, 1, 0, 0, 1, 1,
0.577605, 1.488295, -0.885082, 1, 0, 0, 1, 1,
0.5806389, 0.04431132, 0.4186645, 0, 0, 0, 1, 1,
0.5835817, -0.5760472, 4.003143, 0, 0, 0, 1, 1,
0.5847229, -1.083789, 3.061549, 0, 0, 0, 1, 1,
0.5849703, 1.88835, -0.140895, 0, 0, 0, 1, 1,
0.5851322, -0.3727674, 2.553493, 0, 0, 0, 1, 1,
0.5864234, 0.582536, -0.2079519, 0, 0, 0, 1, 1,
0.5914594, 0.4984427, 1.529574, 0, 0, 0, 1, 1,
0.5972935, 1.621471, -0.07851323, 1, 1, 1, 1, 1,
0.5978038, -0.1444796, 1.970428, 1, 1, 1, 1, 1,
0.597945, 0.1791133, 0.7548552, 1, 1, 1, 1, 1,
0.5987498, 2.346764, 0.640726, 1, 1, 1, 1, 1,
0.6006631, 0.4974537, -0.009479878, 1, 1, 1, 1, 1,
0.6051323, 0.4910265, 0.1640875, 1, 1, 1, 1, 1,
0.6063835, -1.582847, 2.424388, 1, 1, 1, 1, 1,
0.6106667, -0.2459339, 2.44945, 1, 1, 1, 1, 1,
0.6115528, -0.3641295, 2.405695, 1, 1, 1, 1, 1,
0.6137409, 0.003038032, 1.274175, 1, 1, 1, 1, 1,
0.6162016, -0.5111375, 1.948855, 1, 1, 1, 1, 1,
0.6190215, -0.4192088, 4.100849, 1, 1, 1, 1, 1,
0.6197924, 0.05625458, 0.4866472, 1, 1, 1, 1, 1,
0.6241937, 0.7194322, -0.8417351, 1, 1, 1, 1, 1,
0.6245019, -1.258911, 1.73177, 1, 1, 1, 1, 1,
0.6270427, 0.7062961, 0.6186532, 0, 0, 1, 1, 1,
0.6327852, 0.5233486, 1.303731, 1, 0, 0, 1, 1,
0.6488063, -0.03708561, 1.06959, 1, 0, 0, 1, 1,
0.6542535, 0.04285055, 1.306131, 1, 0, 0, 1, 1,
0.6554391, 2.074531, 0.8369363, 1, 0, 0, 1, 1,
0.6642643, 0.4262284, 0.1147182, 1, 0, 0, 1, 1,
0.6714484, -1.268381, 2.55025, 0, 0, 0, 1, 1,
0.671458, -0.2694764, 2.039353, 0, 0, 0, 1, 1,
0.6734721, -1.792943, 2.664858, 0, 0, 0, 1, 1,
0.6756111, -0.9594147, 2.888506, 0, 0, 0, 1, 1,
0.6772782, -2.329054e-05, 2.016125, 0, 0, 0, 1, 1,
0.6792001, 0.6569692, 1.399585, 0, 0, 0, 1, 1,
0.679877, -1.285884, 0.6112315, 0, 0, 0, 1, 1,
0.6812236, 0.3120203, 2.227047, 1, 1, 1, 1, 1,
0.6830406, -0.7091798, 1.452397, 1, 1, 1, 1, 1,
0.6882788, 1.509534, 0.5210454, 1, 1, 1, 1, 1,
0.6944619, 0.1705163, 1.542152, 1, 1, 1, 1, 1,
0.6960412, 0.2512865, 1.906897, 1, 1, 1, 1, 1,
0.7009462, -0.3447244, 1.431574, 1, 1, 1, 1, 1,
0.7023583, -2.154655, 2.394992, 1, 1, 1, 1, 1,
0.7037702, 0.1302921, 1.287421, 1, 1, 1, 1, 1,
0.7051015, 0.3868338, 0.4015394, 1, 1, 1, 1, 1,
0.7082112, -1.767586, 2.576471, 1, 1, 1, 1, 1,
0.7087202, 0.03203712, 2.359043, 1, 1, 1, 1, 1,
0.7134706, -0.6099957, 0.3916625, 1, 1, 1, 1, 1,
0.7136654, 0.9750862, 1.063985, 1, 1, 1, 1, 1,
0.7234341, -1.034189, 3.614692, 1, 1, 1, 1, 1,
0.7257769, -0.9007955, 2.673176, 1, 1, 1, 1, 1,
0.7279392, 0.6128029, -1.439519, 0, 0, 1, 1, 1,
0.7288619, -1.717777, 2.317917, 1, 0, 0, 1, 1,
0.7328994, 0.2049449, 0.6557927, 1, 0, 0, 1, 1,
0.7366295, -0.1976297, 2.627446, 1, 0, 0, 1, 1,
0.7369534, 0.4934032, 1.464491, 1, 0, 0, 1, 1,
0.7407554, 0.7631523, 0.7335117, 1, 0, 0, 1, 1,
0.7432824, -1.251031, 2.446523, 0, 0, 0, 1, 1,
0.7433684, -0.8426173, 0.4993947, 0, 0, 0, 1, 1,
0.7452838, 0.6455398, 0.3154926, 0, 0, 0, 1, 1,
0.745407, 0.2498457, 1.099514, 0, 0, 0, 1, 1,
0.745667, -0.3804615, 2.11732, 0, 0, 0, 1, 1,
0.7465668, -1.086926, 2.446743, 0, 0, 0, 1, 1,
0.7467562, 1.535547, 0.52258, 0, 0, 0, 1, 1,
0.7482775, 0.5451534, 1.407465, 1, 1, 1, 1, 1,
0.7512938, 0.9842042, 2.653846, 1, 1, 1, 1, 1,
0.7515283, 0.5133432, 2.90646, 1, 1, 1, 1, 1,
0.7546641, 0.4866761, 0.7001914, 1, 1, 1, 1, 1,
0.7644108, 0.1446292, 0.6808728, 1, 1, 1, 1, 1,
0.7650712, -0.1993484, 2.154415, 1, 1, 1, 1, 1,
0.7662569, 0.7045518, 1.697159, 1, 1, 1, 1, 1,
0.7688047, 0.4788907, 0.347239, 1, 1, 1, 1, 1,
0.7690891, 0.7101216, 1.032228, 1, 1, 1, 1, 1,
0.7711748, 0.2144548, 1.817773, 1, 1, 1, 1, 1,
0.7782804, 1.617735, 1.46619, 1, 1, 1, 1, 1,
0.7914804, -1.253083, 2.977691, 1, 1, 1, 1, 1,
0.7919461, 0.8421934, 0.9700847, 1, 1, 1, 1, 1,
0.7990166, 0.8467005, 0.6563175, 1, 1, 1, 1, 1,
0.8013391, -1.569933, 1.400791, 1, 1, 1, 1, 1,
0.8023082, 0.1556244, 1.900559, 0, 0, 1, 1, 1,
0.8078845, -1.866772, 1.875659, 1, 0, 0, 1, 1,
0.8099402, 0.4181136, 1.732566, 1, 0, 0, 1, 1,
0.8111461, -0.3422235, 2.474855, 1, 0, 0, 1, 1,
0.8147815, 0.8008425, 0.5216692, 1, 0, 0, 1, 1,
0.8181052, -1.960935, 2.735329, 1, 0, 0, 1, 1,
0.8190516, -1.497929, 3.417374, 0, 0, 0, 1, 1,
0.8212683, 1.549677, 1.837548, 0, 0, 0, 1, 1,
0.8216329, 1.16187, -1.62822, 0, 0, 0, 1, 1,
0.826272, 1.671089, 1.157282, 0, 0, 0, 1, 1,
0.8319322, 0.9755363, 0.2333135, 0, 0, 0, 1, 1,
0.8382156, 0.5125009, -0.9344515, 0, 0, 0, 1, 1,
0.8406265, 0.8308301, 0.9351262, 0, 0, 0, 1, 1,
0.8421062, -1.134456, 2.614302, 1, 1, 1, 1, 1,
0.8421283, 0.3605744, -0.7527602, 1, 1, 1, 1, 1,
0.8469556, 0.8125497, 0.4884949, 1, 1, 1, 1, 1,
0.8493784, 0.459255, 1.395802, 1, 1, 1, 1, 1,
0.850174, 0.04159262, -0.4712037, 1, 1, 1, 1, 1,
0.8509968, 0.2673071, 2.654262, 1, 1, 1, 1, 1,
0.8545427, -0.9920004, 1.121078, 1, 1, 1, 1, 1,
0.8560822, -0.4507921, 3.221964, 1, 1, 1, 1, 1,
0.8574678, 1.844232, -0.3459903, 1, 1, 1, 1, 1,
0.8625438, -0.2028015, 0.8378813, 1, 1, 1, 1, 1,
0.8657382, -1.410067, 3.337281, 1, 1, 1, 1, 1,
0.8665226, -0.2401515, 1.376457, 1, 1, 1, 1, 1,
0.873067, 1.412449, -1.868804, 1, 1, 1, 1, 1,
0.8764485, 0.4054229, 0.727898, 1, 1, 1, 1, 1,
0.8805608, 0.7580332, 1.470239, 1, 1, 1, 1, 1,
0.8807424, -0.8434914, 3.340494, 0, 0, 1, 1, 1,
0.8820988, 1.021879, -0.6216368, 1, 0, 0, 1, 1,
0.8849804, 0.4764672, -0.2304301, 1, 0, 0, 1, 1,
0.8852208, 0.6113429, 0.2214262, 1, 0, 0, 1, 1,
0.8905739, -0.4925578, 1.952357, 1, 0, 0, 1, 1,
0.8910367, -0.2910252, 2.296273, 1, 0, 0, 1, 1,
0.8930526, 0.2419288, 1.683773, 0, 0, 0, 1, 1,
0.8945854, 0.8778237, 2.527381, 0, 0, 0, 1, 1,
0.9026147, -3.002457, 2.373308, 0, 0, 0, 1, 1,
0.9098765, -1.074652, 2.38942, 0, 0, 0, 1, 1,
0.9150517, -0.4109465, 2.433616, 0, 0, 0, 1, 1,
0.9200553, -0.297751, 1.074381, 0, 0, 0, 1, 1,
0.9276981, 0.4072101, 1.715204, 0, 0, 0, 1, 1,
0.9300649, -1.781508, 4.652761, 1, 1, 1, 1, 1,
0.9327292, -2.240867, 1.172894, 1, 1, 1, 1, 1,
0.9362052, 1.842, 0.5338796, 1, 1, 1, 1, 1,
0.9408453, 0.02501207, 2.992662, 1, 1, 1, 1, 1,
0.9416, -0.2355379, -0.6758389, 1, 1, 1, 1, 1,
0.9448096, 1.842507, -0.8604355, 1, 1, 1, 1, 1,
0.948802, -0.3157824, 1.322289, 1, 1, 1, 1, 1,
0.9508716, -0.9294446, 2.472221, 1, 1, 1, 1, 1,
0.9659656, -1.036437, 1.412055, 1, 1, 1, 1, 1,
0.9676833, 0.262495, 3.330892, 1, 1, 1, 1, 1,
0.9689859, 1.089068, -0.1981089, 1, 1, 1, 1, 1,
0.9693306, 2.208189, 2.13689, 1, 1, 1, 1, 1,
0.9830843, -0.4933855, 0.8048543, 1, 1, 1, 1, 1,
0.9835644, -0.4141623, 1.754796, 1, 1, 1, 1, 1,
0.9854366, 0.1152778, 1.247236, 1, 1, 1, 1, 1,
0.9856291, -0.5201604, 2.96445, 0, 0, 1, 1, 1,
0.9884079, 1.039135, 0.8580147, 1, 0, 0, 1, 1,
0.9952275, 0.2960173, 0.9608318, 1, 0, 0, 1, 1,
1.000169, -3.394616, 3.247139, 1, 0, 0, 1, 1,
1.004643, 1.393277, 0.5052025, 1, 0, 0, 1, 1,
1.007304, -1.201842, 3.206637, 1, 0, 0, 1, 1,
1.015997, -0.1016791, 1.584183, 0, 0, 0, 1, 1,
1.019647, -0.1524149, 0.9775537, 0, 0, 0, 1, 1,
1.021993, 0.2194919, 2.501187, 0, 0, 0, 1, 1,
1.033289, -1.627832, 2.411757, 0, 0, 0, 1, 1,
1.034355, 0.5562623, 0.4230429, 0, 0, 0, 1, 1,
1.040433, -0.07249531, 2.702613, 0, 0, 0, 1, 1,
1.044651, -0.4075838, 0.2669326, 0, 0, 0, 1, 1,
1.054157, 1.137777, 0.2969286, 1, 1, 1, 1, 1,
1.069653, 1.000446, 1.067792, 1, 1, 1, 1, 1,
1.076134, 0.713038, -0.850512, 1, 1, 1, 1, 1,
1.091889, -2.304832, 1.498795, 1, 1, 1, 1, 1,
1.094539, 1.14707, 1.092685, 1, 1, 1, 1, 1,
1.103135, -1.516867, 3.333754, 1, 1, 1, 1, 1,
1.10701, 1.085011, 2.111552, 1, 1, 1, 1, 1,
1.116865, -0.8228636, 3.337163, 1, 1, 1, 1, 1,
1.12594, -0.9911672, 3.95593, 1, 1, 1, 1, 1,
1.142816, 0.4847821, 1.302994, 1, 1, 1, 1, 1,
1.142945, -0.944805, 3.338103, 1, 1, 1, 1, 1,
1.147088, 0.3116134, 2.254354, 1, 1, 1, 1, 1,
1.15602, -1.828372, 2.833705, 1, 1, 1, 1, 1,
1.159299, 0.8309104, 0.1925632, 1, 1, 1, 1, 1,
1.160873, -0.2261212, 3.05134, 1, 1, 1, 1, 1,
1.167875, 1.017409, 0.6554342, 0, 0, 1, 1, 1,
1.169294, -1.063742, 3.030804, 1, 0, 0, 1, 1,
1.169636, 0.6062453, 1.525917, 1, 0, 0, 1, 1,
1.16982, 0.3038884, 1.237963, 1, 0, 0, 1, 1,
1.173369, -0.6472045, 5.07282, 1, 0, 0, 1, 1,
1.180309, -1.122373, 2.903865, 1, 0, 0, 1, 1,
1.180926, -0.1321372, 2.032775, 0, 0, 0, 1, 1,
1.187306, -0.3967831, -0.3070261, 0, 0, 0, 1, 1,
1.192573, 0.2645497, 1.194735, 0, 0, 0, 1, 1,
1.197535, -0.253923, -0.1065577, 0, 0, 0, 1, 1,
1.210326, -1.212741, 2.852983, 0, 0, 0, 1, 1,
1.219748, 0.537959, 1.728246, 0, 0, 0, 1, 1,
1.221142, -0.7815904, 2.938299, 0, 0, 0, 1, 1,
1.229298, 0.5323502, 2.360175, 1, 1, 1, 1, 1,
1.23211, 2.784703, 2.053282, 1, 1, 1, 1, 1,
1.233287, 0.9606782, 2.311944, 1, 1, 1, 1, 1,
1.243648, -0.1965785, 2.703052, 1, 1, 1, 1, 1,
1.249656, -0.9286174, 1.25775, 1, 1, 1, 1, 1,
1.251492, -1.340537, 4.141387, 1, 1, 1, 1, 1,
1.258153, 0.5104452, 0.6140103, 1, 1, 1, 1, 1,
1.2633, -1.515842, 2.377605, 1, 1, 1, 1, 1,
1.274749, 0.6188051, 3.476509, 1, 1, 1, 1, 1,
1.275884, 0.2167925, 1.276735, 1, 1, 1, 1, 1,
1.286141, -0.08902578, 1.936264, 1, 1, 1, 1, 1,
1.305011, 0.718233, 0.07611688, 1, 1, 1, 1, 1,
1.321154, -1.387707, 3.555629, 1, 1, 1, 1, 1,
1.329212, 0.6829093, 2.544247, 1, 1, 1, 1, 1,
1.33574, 0.8975888, 0.0756176, 1, 1, 1, 1, 1,
1.344683, -1.567728, 2.579861, 0, 0, 1, 1, 1,
1.365292, -0.1628581, 0.2606685, 1, 0, 0, 1, 1,
1.372409, -0.9217821, 1.768284, 1, 0, 0, 1, 1,
1.375337, 0.4050388, 1.674554, 1, 0, 0, 1, 1,
1.375874, 0.01238008, 2.876005, 1, 0, 0, 1, 1,
1.383829, -0.6176675, 2.259798, 1, 0, 0, 1, 1,
1.385799, -1.012605, 1.656308, 0, 0, 0, 1, 1,
1.405516, -0.3705693, 1.974498, 0, 0, 0, 1, 1,
1.407613, -0.02837735, 1.336265, 0, 0, 0, 1, 1,
1.413377, -2.272875, 0.9022367, 0, 0, 0, 1, 1,
1.41997, -0.5490394, 2.256367, 0, 0, 0, 1, 1,
1.43248, -1.35779, 1.995804, 0, 0, 0, 1, 1,
1.435543, 0.8132109, 1.26111, 0, 0, 0, 1, 1,
1.439223, 0.179299, 3.332017, 1, 1, 1, 1, 1,
1.443471, -1.606396, 2.40639, 1, 1, 1, 1, 1,
1.448206, 0.3752458, 1.391048, 1, 1, 1, 1, 1,
1.450489, 0.0290908, 1.036133, 1, 1, 1, 1, 1,
1.453085, -0.828613, 3.190106, 1, 1, 1, 1, 1,
1.457097, -0.3507028, 2.709592, 1, 1, 1, 1, 1,
1.458456, -0.480622, 0.1391253, 1, 1, 1, 1, 1,
1.464659, 1.033284, 0.005866287, 1, 1, 1, 1, 1,
1.484739, -0.4390804, 1.364249, 1, 1, 1, 1, 1,
1.496072, 2.306811, 0.2959194, 1, 1, 1, 1, 1,
1.497316, 0.5734862, 2.04822, 1, 1, 1, 1, 1,
1.512267, 1.360698, 0.6122348, 1, 1, 1, 1, 1,
1.51815, 1.28259, 1.139451, 1, 1, 1, 1, 1,
1.526551, -0.4440444, 0.3798274, 1, 1, 1, 1, 1,
1.542675, -0.982098, 3.023027, 1, 1, 1, 1, 1,
1.546772, -0.3474553, 1.702717, 0, 0, 1, 1, 1,
1.552389, -0.01470224, -0.2253634, 1, 0, 0, 1, 1,
1.55613, 1.319834, 1.232201, 1, 0, 0, 1, 1,
1.557309, 0.470264, 0.676503, 1, 0, 0, 1, 1,
1.559298, -0.17461, 3.178809, 1, 0, 0, 1, 1,
1.561135, -1.240463, 2.115374, 1, 0, 0, 1, 1,
1.561215, 0.488946, 1.015713, 0, 0, 0, 1, 1,
1.577295, -0.276004, 0.6257707, 0, 0, 0, 1, 1,
1.589425, -1.73268, 3.702508, 0, 0, 0, 1, 1,
1.593331, 0.5353933, 3.103485, 0, 0, 0, 1, 1,
1.603104, 0.4809546, 0.8273932, 0, 0, 0, 1, 1,
1.61388, -0.304075, 1.597292, 0, 0, 0, 1, 1,
1.619192, 1.914296, 3.042386, 0, 0, 0, 1, 1,
1.625352, -1.662368, 2.473316, 1, 1, 1, 1, 1,
1.641343, -0.5531031, 4.161766, 1, 1, 1, 1, 1,
1.660927, 1.720052, -0.3237849, 1, 1, 1, 1, 1,
1.661859, -0.7738641, 0.3294191, 1, 1, 1, 1, 1,
1.678611, -0.04228869, 0.6851131, 1, 1, 1, 1, 1,
1.683546, 0.09794235, 2.258141, 1, 1, 1, 1, 1,
1.687564, 0.5927254, 1.406076, 1, 1, 1, 1, 1,
1.693316, -1.192621, 2.046809, 1, 1, 1, 1, 1,
1.693765, 1.836313, -1.082712, 1, 1, 1, 1, 1,
1.707037, 2.361124, 1.048004, 1, 1, 1, 1, 1,
1.707105, -1.255293, 2.862239, 1, 1, 1, 1, 1,
1.72015, 0.1381071, 2.215313, 1, 1, 1, 1, 1,
1.721838, -0.3726439, 1.342032, 1, 1, 1, 1, 1,
1.727616, 0.848444, 1.681041, 1, 1, 1, 1, 1,
1.74844, -0.7014443, 2.70256, 1, 1, 1, 1, 1,
1.75013, -0.353399, 0.6350977, 0, 0, 1, 1, 1,
1.776078, 0.1347163, 0.7881343, 1, 0, 0, 1, 1,
1.783853, -0.5193046, 2.765705, 1, 0, 0, 1, 1,
1.819281, -0.8696336, 0.9314036, 1, 0, 0, 1, 1,
1.846507, -0.8257983, 1.100378, 1, 0, 0, 1, 1,
1.855173, -0.2977927, -0.309783, 1, 0, 0, 1, 1,
1.890758, -1.51958, 0.7777512, 0, 0, 0, 1, 1,
1.891498, -1.215278, 3.878299, 0, 0, 0, 1, 1,
1.896174, -0.9005821, 1.834692, 0, 0, 0, 1, 1,
1.902146, 1.511572, 2.194365, 0, 0, 0, 1, 1,
1.912967, 2.164923, 1.456811, 0, 0, 0, 1, 1,
1.929512, 0.561508, 0.164645, 0, 0, 0, 1, 1,
1.931009, 1.486625, 2.247567, 0, 0, 0, 1, 1,
1.945536, -0.1587254, 1.676657, 1, 1, 1, 1, 1,
1.953693, 0.9988183, 1.266745, 1, 1, 1, 1, 1,
1.98924, 1.383869, 1.079013, 1, 1, 1, 1, 1,
2.000537, -0.2076482, 1.98578, 1, 1, 1, 1, 1,
2.007636, 0.9188046, 1.618938, 1, 1, 1, 1, 1,
2.014128, -0.1914123, -0.3249103, 1, 1, 1, 1, 1,
2.018431, -0.3377607, 3.877116, 1, 1, 1, 1, 1,
2.068016, -0.6020104, 2.062799, 1, 1, 1, 1, 1,
2.073232, 1.445591, -0.07655437, 1, 1, 1, 1, 1,
2.092347, 0.4680447, 1.530777, 1, 1, 1, 1, 1,
2.098583, -1.184812, 1.644661, 1, 1, 1, 1, 1,
2.135895, -1.060798, 2.596398, 1, 1, 1, 1, 1,
2.144425, -0.323583, 1.101335, 1, 1, 1, 1, 1,
2.148158, -0.09237242, 3.016049, 1, 1, 1, 1, 1,
2.151305, -1.156156, 1.744898, 1, 1, 1, 1, 1,
2.161919, -0.2147513, 1.816308, 0, 0, 1, 1, 1,
2.176144, -0.8979881, 2.623856, 1, 0, 0, 1, 1,
2.179157, 0.7778119, 0.2503704, 1, 0, 0, 1, 1,
2.192292, -0.7432468, 0.3264617, 1, 0, 0, 1, 1,
2.196854, 1.271345, 1.909647, 1, 0, 0, 1, 1,
2.205413, -0.4084501, 1.726071, 1, 0, 0, 1, 1,
2.268058, -0.6926072, 0.07396267, 0, 0, 0, 1, 1,
2.273748, -1.140239, 2.942395, 0, 0, 0, 1, 1,
2.364715, 0.8019205, -0.9890487, 0, 0, 0, 1, 1,
2.397733, 0.8001351, 0.4843325, 0, 0, 0, 1, 1,
2.417781, -0.5029998, 1.203299, 0, 0, 0, 1, 1,
2.448116, -1.521101, 4.834924, 0, 0, 0, 1, 1,
2.473806, -0.5497722, 3.134587, 0, 0, 0, 1, 1,
2.494578, -0.1691866, 1.653563, 1, 1, 1, 1, 1,
2.497101, -0.9615319, 1.549982, 1, 1, 1, 1, 1,
2.539885, -0.08144975, 0.7346303, 1, 1, 1, 1, 1,
2.592013, 1.043687, 3.673964, 1, 1, 1, 1, 1,
2.690668, -1.027344, 1.066631, 1, 1, 1, 1, 1,
3.100231, -0.6715764, 2.55558, 1, 1, 1, 1, 1,
3.313154, -0.4597184, 1.52604, 1, 1, 1, 1, 1
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
var radius = 9.703289;
var distance = 34.08239;
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
mvMatrix.translate( -0.141505, 0.2016129, 0.2191627 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.08239);
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