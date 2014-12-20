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
-3.078989, 0.8718562, -1.784436, 1, 0, 0, 1,
-2.71625, -1.133551, -3.37151, 1, 0.007843138, 0, 1,
-2.697407, 1.897337, -0.6849235, 1, 0.01176471, 0, 1,
-2.620672, -0.5042816, -1.61942, 1, 0.01960784, 0, 1,
-2.546413, 0.7581728, -3.139614, 1, 0.02352941, 0, 1,
-2.542381, 1.891322, 0.2734926, 1, 0.03137255, 0, 1,
-2.526695, 0.002939196, -1.626676, 1, 0.03529412, 0, 1,
-2.435097, 0.212961, -1.458684, 1, 0.04313726, 0, 1,
-2.427738, -1.717724, -2.494426, 1, 0.04705882, 0, 1,
-2.376007, -0.6171588, -1.667215, 1, 0.05490196, 0, 1,
-2.2347, -0.2649683, -1.589337, 1, 0.05882353, 0, 1,
-2.232512, 0.7111652, -2.111232, 1, 0.06666667, 0, 1,
-2.230033, -0.3772172, -2.112952, 1, 0.07058824, 0, 1,
-2.167331, 1.788506, 0.1191638, 1, 0.07843138, 0, 1,
-2.133765, -1.730252, -5.031765, 1, 0.08235294, 0, 1,
-2.069614, -0.8137783, -0.5154887, 1, 0.09019608, 0, 1,
-2.069402, 0.8583114, -0.77147, 1, 0.09411765, 0, 1,
-2.014692, 0.2818397, -0.5131069, 1, 0.1019608, 0, 1,
-1.98904, -0.01428713, -1.866237, 1, 0.1098039, 0, 1,
-1.982442, 0.09791383, -0.9202607, 1, 0.1137255, 0, 1,
-1.955285, 0.7959503, -0.3249247, 1, 0.1215686, 0, 1,
-1.952517, -0.9396223, -3.223254, 1, 0.1254902, 0, 1,
-1.950236, 0.6710293, -2.202703, 1, 0.1333333, 0, 1,
-1.945722, 1.227633, -1.441188, 1, 0.1372549, 0, 1,
-1.902181, 0.1682742, -2.256116, 1, 0.145098, 0, 1,
-1.874446, -1.493621, -2.311626, 1, 0.1490196, 0, 1,
-1.866493, 1.848583, -0.567729, 1, 0.1568628, 0, 1,
-1.862158, -2.662429, -1.451672, 1, 0.1607843, 0, 1,
-1.848198, -0.07572579, -1.362044, 1, 0.1686275, 0, 1,
-1.842585, 0.8613433, 0.5315291, 1, 0.172549, 0, 1,
-1.830589, -0.05145925, -2.245193, 1, 0.1803922, 0, 1,
-1.79264, -0.2291367, -2.499466, 1, 0.1843137, 0, 1,
-1.784875, 0.6375763, -1.728483, 1, 0.1921569, 0, 1,
-1.77571, 1.10014, -1.996182, 1, 0.1960784, 0, 1,
-1.754913, 0.7354357, -0.3229055, 1, 0.2039216, 0, 1,
-1.734854, -0.8248331, -0.1559546, 1, 0.2117647, 0, 1,
-1.724774, -1.775452, -3.380883, 1, 0.2156863, 0, 1,
-1.722046, -0.8463158, -3.358715, 1, 0.2235294, 0, 1,
-1.72033, -1.676096, -4.34601, 1, 0.227451, 0, 1,
-1.716336, 1.110528, -1.07957, 1, 0.2352941, 0, 1,
-1.715238, 0.3176333, 0.5722809, 1, 0.2392157, 0, 1,
-1.702686, 0.9583922, -1.558707, 1, 0.2470588, 0, 1,
-1.685072, -0.5004872, -1.185375, 1, 0.2509804, 0, 1,
-1.682857, -1.149871, -4.380254, 1, 0.2588235, 0, 1,
-1.681154, 0.05093167, -2.213551, 1, 0.2627451, 0, 1,
-1.67781, 0.7999521, 0.6459419, 1, 0.2705882, 0, 1,
-1.64876, -0.2157313, -1.788434, 1, 0.2745098, 0, 1,
-1.641705, 0.2433953, -2.965083, 1, 0.282353, 0, 1,
-1.596382, -1.662764, -3.010548, 1, 0.2862745, 0, 1,
-1.567982, 0.1606812, -2.60953, 1, 0.2941177, 0, 1,
-1.562547, -0.5708871, -1.327165, 1, 0.3019608, 0, 1,
-1.557685, -2.064125, -0.8802199, 1, 0.3058824, 0, 1,
-1.543075, 0.5582558, -1.472242, 1, 0.3137255, 0, 1,
-1.539948, -0.1833925, -1.502247, 1, 0.3176471, 0, 1,
-1.538058, -1.476626, -1.369617, 1, 0.3254902, 0, 1,
-1.536161, 0.204525, -1.518901, 1, 0.3294118, 0, 1,
-1.517649, 1.859164, 0.5909126, 1, 0.3372549, 0, 1,
-1.512764, 0.4083001, 0.2426873, 1, 0.3411765, 0, 1,
-1.507911, -0.8866033, -1.898631, 1, 0.3490196, 0, 1,
-1.47188, 0.2805485, -2.889385, 1, 0.3529412, 0, 1,
-1.469266, 1.009436, -1.566917, 1, 0.3607843, 0, 1,
-1.446352, 0.5806937, -1.547778, 1, 0.3647059, 0, 1,
-1.444771, 0.258441, 0.6946387, 1, 0.372549, 0, 1,
-1.426903, 0.4001283, -1.34463, 1, 0.3764706, 0, 1,
-1.425603, 0.8726641, -1.575887, 1, 0.3843137, 0, 1,
-1.41574, -0.8085153, -2.416808, 1, 0.3882353, 0, 1,
-1.414268, -1.696832, -2.821538, 1, 0.3960784, 0, 1,
-1.410394, 0.003756038, -1.250227, 1, 0.4039216, 0, 1,
-1.399016, 0.1706534, -0.7402647, 1, 0.4078431, 0, 1,
-1.39421, -1.936115, -2.45241, 1, 0.4156863, 0, 1,
-1.389664, 1.646088, -0.02929217, 1, 0.4196078, 0, 1,
-1.372266, 1.72647, -1.497782, 1, 0.427451, 0, 1,
-1.365683, -2.410558, -1.626288, 1, 0.4313726, 0, 1,
-1.358472, 0.11668, -0.432264, 1, 0.4392157, 0, 1,
-1.354402, -0.3136711, -2.831283, 1, 0.4431373, 0, 1,
-1.349965, -1.55005, -1.517388, 1, 0.4509804, 0, 1,
-1.34945, -0.1510933, -0.08589711, 1, 0.454902, 0, 1,
-1.3453, 1.212361, -1.091701, 1, 0.4627451, 0, 1,
-1.327645, -0.6525208, -1.930555, 1, 0.4666667, 0, 1,
-1.322823, 1.356664, -0.438262, 1, 0.4745098, 0, 1,
-1.309767, -1.155121, -0.9302575, 1, 0.4784314, 0, 1,
-1.296246, 0.9090557, -1.486323, 1, 0.4862745, 0, 1,
-1.293275, -0.3639354, -1.126575, 1, 0.4901961, 0, 1,
-1.290118, -0.4209726, -0.531559, 1, 0.4980392, 0, 1,
-1.287129, -2.163813, -2.938289, 1, 0.5058824, 0, 1,
-1.283291, -0.9442424, -2.762401, 1, 0.509804, 0, 1,
-1.271501, -0.1657701, -2.72936, 1, 0.5176471, 0, 1,
-1.269109, 0.2881602, -1.82457, 1, 0.5215687, 0, 1,
-1.266387, -0.2335472, -2.521903, 1, 0.5294118, 0, 1,
-1.263647, 0.3338629, -1.949104, 1, 0.5333334, 0, 1,
-1.263388, 1.302486, -0.4504208, 1, 0.5411765, 0, 1,
-1.260022, 1.286917, -2.183695, 1, 0.5450981, 0, 1,
-1.256753, -1.203989, -2.371014, 1, 0.5529412, 0, 1,
-1.240071, -1.049019, -2.970245, 1, 0.5568628, 0, 1,
-1.238487, -0.6513869, -2.546688, 1, 0.5647059, 0, 1,
-1.233283, -0.6386442, -0.4574713, 1, 0.5686275, 0, 1,
-1.232439, -0.9572728, -3.343037, 1, 0.5764706, 0, 1,
-1.229863, -0.2118122, -1.03285, 1, 0.5803922, 0, 1,
-1.229331, 2.27096, 0.06670065, 1, 0.5882353, 0, 1,
-1.224136, 0.8085964, -1.888282, 1, 0.5921569, 0, 1,
-1.204513, 0.4733795, -1.761607, 1, 0.6, 0, 1,
-1.200695, 0.9025752, -2.2131, 1, 0.6078432, 0, 1,
-1.198521, 0.5636691, -0.04249411, 1, 0.6117647, 0, 1,
-1.19404, 0.771197, -0.4596595, 1, 0.6196079, 0, 1,
-1.187948, 0.191463, -0.6320006, 1, 0.6235294, 0, 1,
-1.185161, 1.254228, -1.655825, 1, 0.6313726, 0, 1,
-1.177385, -0.857763, -2.828601, 1, 0.6352941, 0, 1,
-1.169687, -0.9953282, -3.023745, 1, 0.6431373, 0, 1,
-1.159853, -1.208429, -2.099522, 1, 0.6470588, 0, 1,
-1.15985, -1.475867, -2.372343, 1, 0.654902, 0, 1,
-1.154657, 1.02636, -2.372818, 1, 0.6588235, 0, 1,
-1.152756, 0.1861327, -2.492355, 1, 0.6666667, 0, 1,
-1.15048, 0.8434147, -0.9146481, 1, 0.6705883, 0, 1,
-1.148255, 0.6975934, -2.423635, 1, 0.6784314, 0, 1,
-1.143706, 0.9304191, 0.178203, 1, 0.682353, 0, 1,
-1.138193, 1.432705, 0.3125111, 1, 0.6901961, 0, 1,
-1.136171, 1.802116, -0.1576692, 1, 0.6941177, 0, 1,
-1.125972, -1.194828, -5.11946, 1, 0.7019608, 0, 1,
-1.119407, -1.097161, -1.330329, 1, 0.7098039, 0, 1,
-1.115329, -0.6216551, -2.43667, 1, 0.7137255, 0, 1,
-1.114724, 1.003627, -1.677159, 1, 0.7215686, 0, 1,
-1.103275, -0.827801, -2.40544, 1, 0.7254902, 0, 1,
-1.0985, -0.783254, 0.2600442, 1, 0.7333333, 0, 1,
-1.084199, 1.364218, 1.020731, 1, 0.7372549, 0, 1,
-1.079064, 1.532857, 1.287957, 1, 0.7450981, 0, 1,
-1.078563, 0.2288744, -0.7464126, 1, 0.7490196, 0, 1,
-1.075842, 0.7017086, -1.638519, 1, 0.7568628, 0, 1,
-1.072211, -0.295778, -1.084713, 1, 0.7607843, 0, 1,
-1.069641, 0.7843022, -1.34615, 1, 0.7686275, 0, 1,
-1.061099, -0.5569305, -1.773509, 1, 0.772549, 0, 1,
-1.054073, 0.2165433, -2.84934, 1, 0.7803922, 0, 1,
-1.049964, 0.8351632, -0.1247232, 1, 0.7843137, 0, 1,
-1.046945, -0.4532174, -4.306187, 1, 0.7921569, 0, 1,
-1.035685, -0.8790489, -1.919839, 1, 0.7960784, 0, 1,
-1.032553, -1.846998, -0.7637577, 1, 0.8039216, 0, 1,
-1.025492, 1.752551, -1.661487, 1, 0.8117647, 0, 1,
-1.011987, -1.852433, -0.6725635, 1, 0.8156863, 0, 1,
-1.001566, -0.3732219, -0.5464375, 1, 0.8235294, 0, 1,
-1.000539, -0.6426308, -0.8010397, 1, 0.827451, 0, 1,
-0.9969717, -0.4723443, -1.793327, 1, 0.8352941, 0, 1,
-0.9929524, 0.9929389, 1.317649, 1, 0.8392157, 0, 1,
-0.9922468, 0.5468559, -0.6120322, 1, 0.8470588, 0, 1,
-0.9859524, 1.317001, -0.1685555, 1, 0.8509804, 0, 1,
-0.9809843, 1.113639, -1.225422, 1, 0.8588235, 0, 1,
-0.9773875, -1.991976, -0.8056309, 1, 0.8627451, 0, 1,
-0.9727726, -1.126353, -2.993526, 1, 0.8705882, 0, 1,
-0.9686555, 2.838523, 0.04878191, 1, 0.8745098, 0, 1,
-0.9686518, 0.4071598, -1.459546, 1, 0.8823529, 0, 1,
-0.9675794, 0.4576084, -0.7332019, 1, 0.8862745, 0, 1,
-0.9672388, 0.4788578, -0.5901989, 1, 0.8941177, 0, 1,
-0.9643956, 1.105672, -2.045941, 1, 0.8980392, 0, 1,
-0.9618589, 1.538509, 0.4267111, 1, 0.9058824, 0, 1,
-0.9611715, -1.085422, -2.623121, 1, 0.9137255, 0, 1,
-0.9551477, 0.1027783, -1.514173, 1, 0.9176471, 0, 1,
-0.9518017, 0.6744687, -2.155116, 1, 0.9254902, 0, 1,
-0.9429086, -0.4416806, -2.338895, 1, 0.9294118, 0, 1,
-0.9427099, 0.9455163, -1.121228, 1, 0.9372549, 0, 1,
-0.9409681, 0.1554625, -2.649123, 1, 0.9411765, 0, 1,
-0.9405928, 0.6119181, -1.803168, 1, 0.9490196, 0, 1,
-0.9366111, 0.8594422, -0.2249667, 1, 0.9529412, 0, 1,
-0.9337144, 0.5102799, -0.8910325, 1, 0.9607843, 0, 1,
-0.9315439, 0.8183933, -0.6543396, 1, 0.9647059, 0, 1,
-0.9268957, 0.3230243, -0.5595043, 1, 0.972549, 0, 1,
-0.9263759, 1.253182, -1.511639, 1, 0.9764706, 0, 1,
-0.9200884, -0.5589418, -0.9212632, 1, 0.9843137, 0, 1,
-0.9190567, 0.30157, -0.9356471, 1, 0.9882353, 0, 1,
-0.9158903, 0.412258, -2.074589, 1, 0.9960784, 0, 1,
-0.91132, 0.700975, -3.23517, 0.9960784, 1, 0, 1,
-0.9049551, 0.7320228, -1.812728, 0.9921569, 1, 0, 1,
-0.8828524, -0.2658718, -1.458511, 0.9843137, 1, 0, 1,
-0.8818612, -0.03244641, 0.1903775, 0.9803922, 1, 0, 1,
-0.8795261, -0.5866242, -3.645957, 0.972549, 1, 0, 1,
-0.8770961, 1.992863, -1.166491, 0.9686275, 1, 0, 1,
-0.8714645, 0.2365001, -1.886529, 0.9607843, 1, 0, 1,
-0.8710172, 0.3102347, -0.5729524, 0.9568627, 1, 0, 1,
-0.867992, 0.3256084, -2.451355, 0.9490196, 1, 0, 1,
-0.8625291, 1.153578, -0.182609, 0.945098, 1, 0, 1,
-0.8519994, -0.2483861, -0.9482627, 0.9372549, 1, 0, 1,
-0.8504422, -0.1804763, -1.29661, 0.9333333, 1, 0, 1,
-0.846454, -1.775537, -2.750718, 0.9254902, 1, 0, 1,
-0.8455266, 0.1239129, 0.3369799, 0.9215686, 1, 0, 1,
-0.8375798, 0.9048657, -0.2620557, 0.9137255, 1, 0, 1,
-0.8372348, -1.71339, -2.505371, 0.9098039, 1, 0, 1,
-0.8300696, 0.527522, -1.884347, 0.9019608, 1, 0, 1,
-0.8294807, 0.427379, -1.472254, 0.8941177, 1, 0, 1,
-0.8240005, -1.270138, -2.684772, 0.8901961, 1, 0, 1,
-0.8236622, 1.178092, -1.597913, 0.8823529, 1, 0, 1,
-0.819445, 1.934682, -1.405549, 0.8784314, 1, 0, 1,
-0.816233, -0.09793571, -0.2554003, 0.8705882, 1, 0, 1,
-0.8127558, 0.3453399, -0.9592248, 0.8666667, 1, 0, 1,
-0.8106378, 1.751382, -0.7006159, 0.8588235, 1, 0, 1,
-0.8033896, -2.217427, -2.057332, 0.854902, 1, 0, 1,
-0.7950082, 1.151165, -2.082426, 0.8470588, 1, 0, 1,
-0.786428, 0.5143857, -0.650329, 0.8431373, 1, 0, 1,
-0.7821363, 0.4072045, -0.5876662, 0.8352941, 1, 0, 1,
-0.7790665, 0.4987729, -1.091422, 0.8313726, 1, 0, 1,
-0.7694424, -1.413852, -2.613183, 0.8235294, 1, 0, 1,
-0.7690082, 2.17876, -2.050365, 0.8196079, 1, 0, 1,
-0.7681581, 0.2315835, -1.050409, 0.8117647, 1, 0, 1,
-0.7662373, 0.2999938, -1.274545, 0.8078431, 1, 0, 1,
-0.7659805, 0.200209, -1.77785, 0.8, 1, 0, 1,
-0.7654949, 2.177344, -1.023161, 0.7921569, 1, 0, 1,
-0.761333, -0.6105374, -2.965722, 0.7882353, 1, 0, 1,
-0.7606204, -0.9178194, -3.136164, 0.7803922, 1, 0, 1,
-0.7605587, 0.2099778, 0.3904589, 0.7764706, 1, 0, 1,
-0.7575249, 0.3709121, 0.7781937, 0.7686275, 1, 0, 1,
-0.7552813, -0.7911691, -3.714109, 0.7647059, 1, 0, 1,
-0.7518516, -1.153695, -1.17399, 0.7568628, 1, 0, 1,
-0.7502847, 0.5090597, -1.472786, 0.7529412, 1, 0, 1,
-0.7448668, -0.2244947, -1.078581, 0.7450981, 1, 0, 1,
-0.7408522, -1.037416, -2.231567, 0.7411765, 1, 0, 1,
-0.7385741, -0.5850644, -2.183854, 0.7333333, 1, 0, 1,
-0.7385469, -0.6999476, -2.151099, 0.7294118, 1, 0, 1,
-0.7380748, -0.6656367, -1.782681, 0.7215686, 1, 0, 1,
-0.7230634, 0.01794954, -1.864711, 0.7176471, 1, 0, 1,
-0.7218668, -1.900014, -1.53497, 0.7098039, 1, 0, 1,
-0.7218409, -0.8010261, -1.950179, 0.7058824, 1, 0, 1,
-0.718042, -1.005944, -3.871406, 0.6980392, 1, 0, 1,
-0.7133492, 0.03356973, -1.181385, 0.6901961, 1, 0, 1,
-0.710363, -2.058073, -2.971323, 0.6862745, 1, 0, 1,
-0.7086107, -0.3750829, -1.139654, 0.6784314, 1, 0, 1,
-0.7053282, 0.2913413, -0.2167982, 0.6745098, 1, 0, 1,
-0.702342, 1.168892, -0.1002994, 0.6666667, 1, 0, 1,
-0.6995831, -1.163759, -3.644528, 0.6627451, 1, 0, 1,
-0.6934587, -0.5007458, -2.818704, 0.654902, 1, 0, 1,
-0.6901339, 0.3820206, -1.988681, 0.6509804, 1, 0, 1,
-0.6842183, 0.3974594, -0.9188132, 0.6431373, 1, 0, 1,
-0.6801679, -0.7410756, -2.631173, 0.6392157, 1, 0, 1,
-0.677803, -0.4329801, -1.75905, 0.6313726, 1, 0, 1,
-0.6776252, 0.5088307, -2.127685, 0.627451, 1, 0, 1,
-0.6737776, -0.3804024, -1.807753, 0.6196079, 1, 0, 1,
-0.6661425, 0.2744429, -2.240392, 0.6156863, 1, 0, 1,
-0.6634312, -0.5342481, -2.626934, 0.6078432, 1, 0, 1,
-0.6621124, -1.010266, -2.905457, 0.6039216, 1, 0, 1,
-0.6555802, -0.8036469, -5.102387, 0.5960785, 1, 0, 1,
-0.6421555, 1.105911, -0.4260484, 0.5882353, 1, 0, 1,
-0.6402736, -0.414766, -2.349853, 0.5843138, 1, 0, 1,
-0.6360568, 1.201194, -1.978038, 0.5764706, 1, 0, 1,
-0.6358997, 0.254947, -2.088588, 0.572549, 1, 0, 1,
-0.6248333, -0.7594892, -3.397306, 0.5647059, 1, 0, 1,
-0.6214078, 1.817534, 0.2117931, 0.5607843, 1, 0, 1,
-0.6178085, 0.09116686, -1.216096, 0.5529412, 1, 0, 1,
-0.6172262, 0.682864, 0.6960747, 0.5490196, 1, 0, 1,
-0.6143576, 1.764843, -1.140409, 0.5411765, 1, 0, 1,
-0.6136848, -0.8355185, -4.879276, 0.5372549, 1, 0, 1,
-0.6108454, 0.4445142, -0.5050575, 0.5294118, 1, 0, 1,
-0.6082684, -0.3378412, -2.099588, 0.5254902, 1, 0, 1,
-0.6067862, -0.5523074, -1.351462, 0.5176471, 1, 0, 1,
-0.5985546, -0.916705, -2.163879, 0.5137255, 1, 0, 1,
-0.59762, 1.060576, -2.182831, 0.5058824, 1, 0, 1,
-0.5961609, -1.278785, -2.96481, 0.5019608, 1, 0, 1,
-0.5946424, -0.9876644, -3.974363, 0.4941176, 1, 0, 1,
-0.5923605, -0.0003708446, -3.669592, 0.4862745, 1, 0, 1,
-0.5876793, 0.3179926, -0.3841372, 0.4823529, 1, 0, 1,
-0.5823629, -0.3947649, -1.152042, 0.4745098, 1, 0, 1,
-0.5822777, 0.3846943, -0.1598866, 0.4705882, 1, 0, 1,
-0.5782561, -0.7131664, -2.261566, 0.4627451, 1, 0, 1,
-0.5769556, -1.894132, -2.687676, 0.4588235, 1, 0, 1,
-0.572297, -0.1247117, -0.9925447, 0.4509804, 1, 0, 1,
-0.569593, -0.9332093, -2.027749, 0.4470588, 1, 0, 1,
-0.5692984, 0.01923413, -0.6169872, 0.4392157, 1, 0, 1,
-0.5668486, -0.3280172, -3.373004, 0.4352941, 1, 0, 1,
-0.5660188, -0.5949764, -2.162073, 0.427451, 1, 0, 1,
-0.5626379, 0.4515796, -0.9332683, 0.4235294, 1, 0, 1,
-0.5587398, -0.2440455, -2.262754, 0.4156863, 1, 0, 1,
-0.5570049, -0.4724149, -1.683758, 0.4117647, 1, 0, 1,
-0.5559494, -1.027934, -3.546591, 0.4039216, 1, 0, 1,
-0.5551762, -0.3404868, -2.923388, 0.3960784, 1, 0, 1,
-0.5545362, -0.8914346, -3.664378, 0.3921569, 1, 0, 1,
-0.5479583, -1.096003, -3.019418, 0.3843137, 1, 0, 1,
-0.5474019, 2.754473, 0.6701102, 0.3803922, 1, 0, 1,
-0.5467818, 0.7546098, -0.6434259, 0.372549, 1, 0, 1,
-0.5414879, 2.068553, -1.613708, 0.3686275, 1, 0, 1,
-0.5340788, 1.366577, -0.6827233, 0.3607843, 1, 0, 1,
-0.5276995, 0.1899121, -1.880032, 0.3568628, 1, 0, 1,
-0.5261275, 0.008332858, -1.356456, 0.3490196, 1, 0, 1,
-0.5252283, 0.4587462, -1.126785, 0.345098, 1, 0, 1,
-0.5218676, 0.3246078, -0.04797549, 0.3372549, 1, 0, 1,
-0.5208493, -2.268944, -3.999508, 0.3333333, 1, 0, 1,
-0.5196367, 1.472275, -0.4971195, 0.3254902, 1, 0, 1,
-0.5121604, -1.089257, -3.67228, 0.3215686, 1, 0, 1,
-0.5021737, -0.6278446, -4.281587, 0.3137255, 1, 0, 1,
-0.5004928, 0.1509174, -1.091325, 0.3098039, 1, 0, 1,
-0.5000435, -1.645077, -3.215325, 0.3019608, 1, 0, 1,
-0.4993511, 0.5944862, -0.8636963, 0.2941177, 1, 0, 1,
-0.4940743, 0.2343182, -2.643548, 0.2901961, 1, 0, 1,
-0.4938241, -1.536248, -3.655373, 0.282353, 1, 0, 1,
-0.4933983, 0.04651814, -0.5558144, 0.2784314, 1, 0, 1,
-0.4922279, 0.01626753, -1.666824, 0.2705882, 1, 0, 1,
-0.4911991, -0.520397, -2.402523, 0.2666667, 1, 0, 1,
-0.4837724, 0.5875183, -0.9560078, 0.2588235, 1, 0, 1,
-0.4817082, -0.4122804, 0.1482244, 0.254902, 1, 0, 1,
-0.4804047, 0.9700046, -2.193427, 0.2470588, 1, 0, 1,
-0.4795608, -1.229416, -4.146841, 0.2431373, 1, 0, 1,
-0.4768316, -0.02847232, -1.552812, 0.2352941, 1, 0, 1,
-0.4762366, -0.0237917, -1.351694, 0.2313726, 1, 0, 1,
-0.4759085, -0.5424329, -2.778658, 0.2235294, 1, 0, 1,
-0.4757875, -0.7013725, -3.932107, 0.2196078, 1, 0, 1,
-0.4733565, -0.6303341, -2.172523, 0.2117647, 1, 0, 1,
-0.4722227, 0.2719188, -1.161201, 0.2078431, 1, 0, 1,
-0.4679313, 0.1030585, -1.629483, 0.2, 1, 0, 1,
-0.4658867, -1.283465, -1.761994, 0.1921569, 1, 0, 1,
-0.4655106, 0.6002471, 0.3514852, 0.1882353, 1, 0, 1,
-0.4624999, 2.063717, -1.419314, 0.1803922, 1, 0, 1,
-0.4598906, -0.6057385, -3.337591, 0.1764706, 1, 0, 1,
-0.4555091, 1.553269, -0.3633648, 0.1686275, 1, 0, 1,
-0.4490871, -0.7078408, -2.355273, 0.1647059, 1, 0, 1,
-0.4466663, 0.1513049, -0.9214404, 0.1568628, 1, 0, 1,
-0.4438608, 0.7663686, -1.847686, 0.1529412, 1, 0, 1,
-0.4406182, 0.7278099, -1.313988, 0.145098, 1, 0, 1,
-0.4389275, 0.2268649, -1.332249, 0.1411765, 1, 0, 1,
-0.438571, -1.875842, -1.575568, 0.1333333, 1, 0, 1,
-0.438251, -0.2878865, -3.055634, 0.1294118, 1, 0, 1,
-0.4316079, -0.2412211, -1.375489, 0.1215686, 1, 0, 1,
-0.4295256, 0.6326973, 1.047605, 0.1176471, 1, 0, 1,
-0.4220824, 0.7738505, -0.3159533, 0.1098039, 1, 0, 1,
-0.4190163, -1.026734, -3.533153, 0.1058824, 1, 0, 1,
-0.418669, 1.080776, -0.1219921, 0.09803922, 1, 0, 1,
-0.4180349, -0.1532377, -1.213585, 0.09019608, 1, 0, 1,
-0.4165719, 0.3701822, -1.150659, 0.08627451, 1, 0, 1,
-0.4163747, 0.9040298, -0.5037611, 0.07843138, 1, 0, 1,
-0.4135428, -0.3506293, -1.422538, 0.07450981, 1, 0, 1,
-0.4122599, -0.7913902, -2.491244, 0.06666667, 1, 0, 1,
-0.4117425, 0.6698, -0.510564, 0.0627451, 1, 0, 1,
-0.4096803, -1.191097, -2.216311, 0.05490196, 1, 0, 1,
-0.4088076, 1.17201, -1.312281, 0.05098039, 1, 0, 1,
-0.402589, -0.2787596, -3.019839, 0.04313726, 1, 0, 1,
-0.4013412, -2.576067, -1.542887, 0.03921569, 1, 0, 1,
-0.4005441, -1.513471, -2.364267, 0.03137255, 1, 0, 1,
-0.3971574, -0.2188287, -1.07394, 0.02745098, 1, 0, 1,
-0.3942082, 0.8227974, -1.371104, 0.01960784, 1, 0, 1,
-0.3928301, -1.862153, -3.217092, 0.01568628, 1, 0, 1,
-0.3887674, 0.898574, -0.9940636, 0.007843138, 1, 0, 1,
-0.3876652, 0.2188529, -1.188841, 0.003921569, 1, 0, 1,
-0.3805564, -0.9939961, -2.824666, 0, 1, 0.003921569, 1,
-0.3702457, -0.7220957, -1.904068, 0, 1, 0.01176471, 1,
-0.3675979, 1.402335, 0.347809, 0, 1, 0.01568628, 1,
-0.367431, 1.047849, 0.1061378, 0, 1, 0.02352941, 1,
-0.3670429, 0.3056418, -0.395295, 0, 1, 0.02745098, 1,
-0.3640953, 0.08403685, -2.591088, 0, 1, 0.03529412, 1,
-0.3586657, 0.7147761, -1.400045, 0, 1, 0.03921569, 1,
-0.3571755, -1.670492, -1.774414, 0, 1, 0.04705882, 1,
-0.3503007, -0.7280285, -2.50171, 0, 1, 0.05098039, 1,
-0.3465436, 0.248336, -2.36497, 0, 1, 0.05882353, 1,
-0.3439019, 0.459422, 0.9472243, 0, 1, 0.0627451, 1,
-0.343308, -0.02806188, -3.073592, 0, 1, 0.07058824, 1,
-0.3412417, 1.051182, 0.6253152, 0, 1, 0.07450981, 1,
-0.3393639, 0.8728926, 0.8448467, 0, 1, 0.08235294, 1,
-0.3391432, 0.2300288, 0.6838296, 0, 1, 0.08627451, 1,
-0.3385079, -2.208188, -3.06866, 0, 1, 0.09411765, 1,
-0.3372833, -0.1164962, -1.509892, 0, 1, 0.1019608, 1,
-0.3357036, 0.2215511, -2.869706, 0, 1, 0.1058824, 1,
-0.3353563, -0.799135, -2.196965, 0, 1, 0.1137255, 1,
-0.3347286, 0.09844843, -2.740447, 0, 1, 0.1176471, 1,
-0.3325841, 1.053177, -0.2498749, 0, 1, 0.1254902, 1,
-0.3317992, 0.4896829, 0.1489961, 0, 1, 0.1294118, 1,
-0.3187923, -0.04415355, -1.834379, 0, 1, 0.1372549, 1,
-0.3184991, 0.01193298, -2.240515, 0, 1, 0.1411765, 1,
-0.3156298, 1.001256, -1.487277, 0, 1, 0.1490196, 1,
-0.3149259, 1.290811, -0.428629, 0, 1, 0.1529412, 1,
-0.3126309, 0.1307983, 0.1561849, 0, 1, 0.1607843, 1,
-0.3120871, -1.375427, -2.491837, 0, 1, 0.1647059, 1,
-0.3120309, -0.3597153, -2.891534, 0, 1, 0.172549, 1,
-0.3063196, -0.7212344, -2.933621, 0, 1, 0.1764706, 1,
-0.3047144, -0.5787632, -1.529202, 0, 1, 0.1843137, 1,
-0.2910345, -2.195576, -3.641663, 0, 1, 0.1882353, 1,
-0.2896168, -0.4080636, -3.48138, 0, 1, 0.1960784, 1,
-0.2895226, 0.7589574, -1.130995, 0, 1, 0.2039216, 1,
-0.2889347, -0.5923275, -3.095147, 0, 1, 0.2078431, 1,
-0.2836445, 0.006919712, -2.409413, 0, 1, 0.2156863, 1,
-0.2808045, 0.8824248, -2.098579, 0, 1, 0.2196078, 1,
-0.2791336, 0.5475699, -0.4721139, 0, 1, 0.227451, 1,
-0.2752249, 0.3296903, -0.297434, 0, 1, 0.2313726, 1,
-0.2736143, 0.3982562, 0.1928535, 0, 1, 0.2392157, 1,
-0.2735473, 0.2138773, -1.862641, 0, 1, 0.2431373, 1,
-0.2735159, 0.8049564, -0.4420668, 0, 1, 0.2509804, 1,
-0.273209, -0.7165231, -3.337893, 0, 1, 0.254902, 1,
-0.2719748, 1.892817, 0.2271856, 0, 1, 0.2627451, 1,
-0.2700671, -1.856946, -3.857286, 0, 1, 0.2666667, 1,
-0.2693343, 0.7403398, -1.48788, 0, 1, 0.2745098, 1,
-0.2687272, -0.7315882, -3.991274, 0, 1, 0.2784314, 1,
-0.2663135, 0.9777659, 0.4735884, 0, 1, 0.2862745, 1,
-0.265744, -0.2661174, -1.80644, 0, 1, 0.2901961, 1,
-0.2617139, 0.2063779, -0.07157703, 0, 1, 0.2980392, 1,
-0.2611942, 1.492369, -0.05404212, 0, 1, 0.3058824, 1,
-0.2544099, 0.1791768, -0.8132498, 0, 1, 0.3098039, 1,
-0.2529282, -0.5099683, -2.812402, 0, 1, 0.3176471, 1,
-0.2474349, 0.7643839, 0.3214733, 0, 1, 0.3215686, 1,
-0.2459524, 0.06912392, -1.360117, 0, 1, 0.3294118, 1,
-0.2418944, 0.3760963, -0.3187933, 0, 1, 0.3333333, 1,
-0.2411214, 0.9721119, -0.8822916, 0, 1, 0.3411765, 1,
-0.2385244, 0.3874433, 1.520282, 0, 1, 0.345098, 1,
-0.2379175, 1.069828, 0.4563192, 0, 1, 0.3529412, 1,
-0.2350125, 1.014628, 0.4645357, 0, 1, 0.3568628, 1,
-0.2338258, 0.5599093, 1.238536, 0, 1, 0.3647059, 1,
-0.2333235, 0.1929799, -1.055414, 0, 1, 0.3686275, 1,
-0.226375, 0.5942957, -0.01394025, 0, 1, 0.3764706, 1,
-0.219229, 0.4239035, -0.5818412, 0, 1, 0.3803922, 1,
-0.2110749, 2.633274, 1.271516, 0, 1, 0.3882353, 1,
-0.2098174, -0.8701478, -2.992018, 0, 1, 0.3921569, 1,
-0.2097311, -0.5709783, -2.984876, 0, 1, 0.4, 1,
-0.2048543, -0.4473839, -3.446514, 0, 1, 0.4078431, 1,
-0.2035387, 0.50275, -0.4104225, 0, 1, 0.4117647, 1,
-0.2027858, -1.06278, -1.310332, 0, 1, 0.4196078, 1,
-0.2017156, 0.2435369, -0.958649, 0, 1, 0.4235294, 1,
-0.2015737, -0.9744174, -3.682097, 0, 1, 0.4313726, 1,
-0.1952458, -1.004976, -3.564253, 0, 1, 0.4352941, 1,
-0.1948243, 0.1622285, 0.2492576, 0, 1, 0.4431373, 1,
-0.1937035, 1.19146, 0.2932266, 0, 1, 0.4470588, 1,
-0.190595, -0.3951104, -2.759552, 0, 1, 0.454902, 1,
-0.1773147, 0.3777983, 0.216644, 0, 1, 0.4588235, 1,
-0.1726024, 1.378142, 0.5281063, 0, 1, 0.4666667, 1,
-0.1721912, -0.2696147, -3.209216, 0, 1, 0.4705882, 1,
-0.1639473, 0.6650569, -1.451411, 0, 1, 0.4784314, 1,
-0.1632158, 2.30859, 1.380261, 0, 1, 0.4823529, 1,
-0.1582319, 2.127702, 0.4504118, 0, 1, 0.4901961, 1,
-0.156976, -0.1615817, -2.839089, 0, 1, 0.4941176, 1,
-0.1569251, -0.8772725, -3.508134, 0, 1, 0.5019608, 1,
-0.1560596, 0.39248, 0.2951353, 0, 1, 0.509804, 1,
-0.155737, 1.489598, 0.2678977, 0, 1, 0.5137255, 1,
-0.1504295, -0.08587953, -1.627329, 0, 1, 0.5215687, 1,
-0.1475602, -0.7294563, -1.506715, 0, 1, 0.5254902, 1,
-0.1474273, 0.3445009, -0.1404201, 0, 1, 0.5333334, 1,
-0.144418, -0.4247305, -4.310706, 0, 1, 0.5372549, 1,
-0.1439364, -0.8171216, -2.050071, 0, 1, 0.5450981, 1,
-0.1429465, 0.3815113, 0.09750789, 0, 1, 0.5490196, 1,
-0.1382663, 0.0424769, -1.128837, 0, 1, 0.5568628, 1,
-0.1350616, 0.640299, 1.042796, 0, 1, 0.5607843, 1,
-0.1344635, -0.03573419, -2.411913, 0, 1, 0.5686275, 1,
-0.1344261, 0.8479687, -0.9914923, 0, 1, 0.572549, 1,
-0.1321391, -0.242119, -4.04683, 0, 1, 0.5803922, 1,
-0.1272219, -0.9206153, -3.675888, 0, 1, 0.5843138, 1,
-0.1208947, 0.4867816, 0.6405212, 0, 1, 0.5921569, 1,
-0.1196897, 0.263399, 0.6372202, 0, 1, 0.5960785, 1,
-0.1150779, -2.340467, -3.741663, 0, 1, 0.6039216, 1,
-0.1139263, 2.197123, -0.2327695, 0, 1, 0.6117647, 1,
-0.1138355, -0.1100282, -2.223907, 0, 1, 0.6156863, 1,
-0.1124507, -0.9702793, -3.505146, 0, 1, 0.6235294, 1,
-0.1122175, -0.8684931, -2.396033, 0, 1, 0.627451, 1,
-0.1101771, 2.272595, 0.4821602, 0, 1, 0.6352941, 1,
-0.1096234, -0.7055435, -2.295651, 0, 1, 0.6392157, 1,
-0.1095737, 0.1252646, 0.8417435, 0, 1, 0.6470588, 1,
-0.1086732, 0.06911282, -2.43287, 0, 1, 0.6509804, 1,
-0.1083572, 1.677685, -0.187739, 0, 1, 0.6588235, 1,
-0.1073768, -1.185939, -2.114772, 0, 1, 0.6627451, 1,
-0.1022559, 0.4832759, -0.3301474, 0, 1, 0.6705883, 1,
-0.1002395, -0.3382599, -4.544654, 0, 1, 0.6745098, 1,
-0.09948269, 1.443645, -1.03099, 0, 1, 0.682353, 1,
-0.09946844, -0.07289184, -2.561788, 0, 1, 0.6862745, 1,
-0.09678549, 1.660425, -1.934662, 0, 1, 0.6941177, 1,
-0.08984337, 1.394127, 1.164814, 0, 1, 0.7019608, 1,
-0.08976409, 0.2614155, 1.015742, 0, 1, 0.7058824, 1,
-0.08804633, 0.4018555, 0.6709222, 0, 1, 0.7137255, 1,
-0.08270472, -0.1374741, -1.259106, 0, 1, 0.7176471, 1,
-0.08119836, -0.4037919, -2.233265, 0, 1, 0.7254902, 1,
-0.08067303, 1.173813, 0.6014118, 0, 1, 0.7294118, 1,
-0.07681728, -0.2928013, -3.891538, 0, 1, 0.7372549, 1,
-0.06932069, 2.078374, 0.879869, 0, 1, 0.7411765, 1,
-0.06813489, -0.7463178, -2.148893, 0, 1, 0.7490196, 1,
-0.06100341, -0.06139662, -3.436074, 0, 1, 0.7529412, 1,
-0.05951734, -1.31416, -3.511572, 0, 1, 0.7607843, 1,
-0.05752246, 0.8789951, -0.3228863, 0, 1, 0.7647059, 1,
-0.0560456, 0.2383695, 1.419034, 0, 1, 0.772549, 1,
-0.05498123, 0.4810755, -0.5269872, 0, 1, 0.7764706, 1,
-0.05111974, -0.3520885, -5.162457, 0, 1, 0.7843137, 1,
-0.04328888, 0.5187042, -0.8959404, 0, 1, 0.7882353, 1,
-0.04317716, -1.120618, -2.185157, 0, 1, 0.7960784, 1,
-0.04293882, 0.8633943, 0.4070866, 0, 1, 0.8039216, 1,
-0.04242683, 1.946458, 0.2673744, 0, 1, 0.8078431, 1,
-0.04199529, -1.83816, -3.902936, 0, 1, 0.8156863, 1,
-0.04053008, -0.524128, -5.296625, 0, 1, 0.8196079, 1,
-0.03394196, 1.280145, -0.2665489, 0, 1, 0.827451, 1,
-0.03257108, 1.321812, -1.580535, 0, 1, 0.8313726, 1,
-0.02927193, 0.6571925, 0.4769668, 0, 1, 0.8392157, 1,
-0.02550462, 0.3808358, 0.5220983, 0, 1, 0.8431373, 1,
-0.02544416, 1.819756, 0.01284666, 0, 1, 0.8509804, 1,
-0.02285357, 1.978021, -0.2894534, 0, 1, 0.854902, 1,
-0.02202097, -0.4034776, -4.370133, 0, 1, 0.8627451, 1,
-0.02094623, -1.557564, -2.754096, 0, 1, 0.8666667, 1,
-0.01850072, -1.247221, -1.462327, 0, 1, 0.8745098, 1,
-0.01834589, -1.996819, -3.777185, 0, 1, 0.8784314, 1,
-0.0168589, -0.4187309, -4.177021, 0, 1, 0.8862745, 1,
-0.01470645, -0.0535002, -2.486286, 0, 1, 0.8901961, 1,
-0.01201006, -1.211606, -3.285467, 0, 1, 0.8980392, 1,
-0.005022492, 0.3904804, 0.8738629, 0, 1, 0.9058824, 1,
-0.0005106717, -0.3026922, -3.723607, 0, 1, 0.9098039, 1,
-2.184886e-05, 0.3662127, 0.2713079, 0, 1, 0.9176471, 1,
0.003817916, 1.245893, 0.3067086, 0, 1, 0.9215686, 1,
0.009805285, 0.9167498, 0.196191, 0, 1, 0.9294118, 1,
0.01730955, -0.2063161, 4.007266, 0, 1, 0.9333333, 1,
0.01788635, 0.9394168, 2.526491, 0, 1, 0.9411765, 1,
0.01853129, 1.026392, 1.027481, 0, 1, 0.945098, 1,
0.02623208, -0.0352764, 0.9586521, 0, 1, 0.9529412, 1,
0.02756252, -0.3739876, 3.534506, 0, 1, 0.9568627, 1,
0.02796147, -0.4190513, 3.657168, 0, 1, 0.9647059, 1,
0.0292565, -0.982605, 3.499665, 0, 1, 0.9686275, 1,
0.02990519, 1.059286, -1.10953, 0, 1, 0.9764706, 1,
0.03119326, -1.623486, 2.343918, 0, 1, 0.9803922, 1,
0.03159365, -0.07234643, 3.020599, 0, 1, 0.9882353, 1,
0.0412257, -0.05002102, 2.579256, 0, 1, 0.9921569, 1,
0.04140739, 0.1114378, 1.173721, 0, 1, 1, 1,
0.04639682, -0.1874352, 3.204653, 0, 0.9921569, 1, 1,
0.0470336, 0.4909897, -0.2586522, 0, 0.9882353, 1, 1,
0.05562032, -0.7449054, 2.466504, 0, 0.9803922, 1, 1,
0.05871616, 0.6070764, 1.139787, 0, 0.9764706, 1, 1,
0.05930571, 2.27697, -0.1589276, 0, 0.9686275, 1, 1,
0.06522305, -0.3426775, 3.118817, 0, 0.9647059, 1, 1,
0.06662943, -2.06907, 4.346584, 0, 0.9568627, 1, 1,
0.06745524, 0.5110891, 0.826993, 0, 0.9529412, 1, 1,
0.06843033, 1.390567, -0.7012543, 0, 0.945098, 1, 1,
0.0779293, -0.1906417, 3.006886, 0, 0.9411765, 1, 1,
0.07820778, 0.8282881, -1.34956, 0, 0.9333333, 1, 1,
0.07901485, -0.7866743, 3.322383, 0, 0.9294118, 1, 1,
0.07955633, -0.1104104, 1.92221, 0, 0.9215686, 1, 1,
0.07959791, 0.1810312, -0.6030428, 0, 0.9176471, 1, 1,
0.083307, -2.027282, 4.609527, 0, 0.9098039, 1, 1,
0.08673114, -0.7250179, 2.468186, 0, 0.9058824, 1, 1,
0.09434162, -0.5087097, 4.573073, 0, 0.8980392, 1, 1,
0.09445222, -0.4410117, 1.942748, 0, 0.8901961, 1, 1,
0.09641589, 1.179311, -0.136866, 0, 0.8862745, 1, 1,
0.09978318, -0.3214747, 3.217917, 0, 0.8784314, 1, 1,
0.1036707, 0.4730314, -0.04298817, 0, 0.8745098, 1, 1,
0.1047693, 0.3444423, -0.06284963, 0, 0.8666667, 1, 1,
0.1049115, -0.7057135, 1.97827, 0, 0.8627451, 1, 1,
0.1057591, -0.5033064, 2.843538, 0, 0.854902, 1, 1,
0.1071391, -0.8191518, 3.590305, 0, 0.8509804, 1, 1,
0.1073964, 0.5308844, 0.5065594, 0, 0.8431373, 1, 1,
0.1108246, -1.229584, 1.947182, 0, 0.8392157, 1, 1,
0.1134724, 0.07738002, 1.317758, 0, 0.8313726, 1, 1,
0.11482, -0.4568287, 2.823576, 0, 0.827451, 1, 1,
0.1180987, -1.115369, 2.929859, 0, 0.8196079, 1, 1,
0.1184469, 0.1149757, 1.233696, 0, 0.8156863, 1, 1,
0.1186098, -0.7496022, 4.093612, 0, 0.8078431, 1, 1,
0.1190635, 0.5780664, 0.1813662, 0, 0.8039216, 1, 1,
0.1236396, -0.8257219, 3.11917, 0, 0.7960784, 1, 1,
0.1263379, 0.232924, 1.262905, 0, 0.7882353, 1, 1,
0.1307032, -0.08862604, 3.643034, 0, 0.7843137, 1, 1,
0.1341781, -2.434106, 2.752903, 0, 0.7764706, 1, 1,
0.1381132, -1.278606, 4.011185, 0, 0.772549, 1, 1,
0.1382531, -2.142282, 2.373262, 0, 0.7647059, 1, 1,
0.1418283, -1.600386, 2.482367, 0, 0.7607843, 1, 1,
0.1435892, -0.2686455, 2.215504, 0, 0.7529412, 1, 1,
0.1453713, 1.444282, -0.5057759, 0, 0.7490196, 1, 1,
0.1475937, -0.4425057, 2.681947, 0, 0.7411765, 1, 1,
0.1515009, -1.092145, 1.910013, 0, 0.7372549, 1, 1,
0.1523868, -0.6982712, 1.839813, 0, 0.7294118, 1, 1,
0.1547645, -0.7118591, 2.007621, 0, 0.7254902, 1, 1,
0.1581054, 1.362931, -1.166373, 0, 0.7176471, 1, 1,
0.1581865, -1.343634, 2.441739, 0, 0.7137255, 1, 1,
0.163683, 1.509952, -1.197507, 0, 0.7058824, 1, 1,
0.1680135, 0.2586914, 1.202129, 0, 0.6980392, 1, 1,
0.1686683, 0.08618581, -1.499363, 0, 0.6941177, 1, 1,
0.1701264, 0.5943437, -0.00921216, 0, 0.6862745, 1, 1,
0.1704877, 2.402229, 2.126156, 0, 0.682353, 1, 1,
0.1710845, 0.3818042, 1.483289, 0, 0.6745098, 1, 1,
0.1715479, -1.02157, 3.094626, 0, 0.6705883, 1, 1,
0.1755899, -0.5425187, 3.661977, 0, 0.6627451, 1, 1,
0.1775021, 2.070129, 0.4314499, 0, 0.6588235, 1, 1,
0.1846399, 1.625235, -0.1904507, 0, 0.6509804, 1, 1,
0.187411, 1.023249, -0.1052921, 0, 0.6470588, 1, 1,
0.1897948, 0.308111, 2.254313, 0, 0.6392157, 1, 1,
0.1942552, -0.2049291, 2.256932, 0, 0.6352941, 1, 1,
0.1967751, 0.2092487, 1.162188, 0, 0.627451, 1, 1,
0.2001345, -1.219194, 2.458064, 0, 0.6235294, 1, 1,
0.2034632, -1.037757, 2.604949, 0, 0.6156863, 1, 1,
0.2102984, 0.3613223, 0.2754235, 0, 0.6117647, 1, 1,
0.2260132, 1.050415, -0.2904175, 0, 0.6039216, 1, 1,
0.2340753, -2.102955, 3.199175, 0, 0.5960785, 1, 1,
0.2392012, 0.1071749, -0.4216465, 0, 0.5921569, 1, 1,
0.2418554, -1.066926, 3.585786, 0, 0.5843138, 1, 1,
0.2421845, -0.5493699, 2.411749, 0, 0.5803922, 1, 1,
0.2443372, -1.260794, 3.281248, 0, 0.572549, 1, 1,
0.2474761, 0.07038467, 0.140582, 0, 0.5686275, 1, 1,
0.2486434, 0.7675898, -0.8864303, 0, 0.5607843, 1, 1,
0.2509431, 1.494959, 0.6237512, 0, 0.5568628, 1, 1,
0.2525006, 1.904796, -0.7723767, 0, 0.5490196, 1, 1,
0.253914, 0.1427525, 1.84471, 0, 0.5450981, 1, 1,
0.2555091, -0.3891437, 3.038391, 0, 0.5372549, 1, 1,
0.2582672, 0.06363605, 2.123135, 0, 0.5333334, 1, 1,
0.2583095, -2.073636, 3.920133, 0, 0.5254902, 1, 1,
0.2599589, 0.004262731, 1.487004, 0, 0.5215687, 1, 1,
0.2647958, -1.141065, 2.725387, 0, 0.5137255, 1, 1,
0.2662233, 0.7575589, -0.1671266, 0, 0.509804, 1, 1,
0.2668516, -1.674205, 2.097672, 0, 0.5019608, 1, 1,
0.2733102, -0.3484013, 1.179541, 0, 0.4941176, 1, 1,
0.2734473, 0.2299462, 0.00914847, 0, 0.4901961, 1, 1,
0.2794207, 0.1073538, 0.7442849, 0, 0.4823529, 1, 1,
0.280225, -0.2072855, 2.167582, 0, 0.4784314, 1, 1,
0.2807538, -1.347555, 4.307209, 0, 0.4705882, 1, 1,
0.2810312, -0.6354423, 2.556505, 0, 0.4666667, 1, 1,
0.2856394, 1.618013, -2.94173, 0, 0.4588235, 1, 1,
0.2909907, -0.3221379, -0.1904002, 0, 0.454902, 1, 1,
0.2952647, 0.6611636, 0.7789806, 0, 0.4470588, 1, 1,
0.2972716, -0.6550821, 2.507977, 0, 0.4431373, 1, 1,
0.3045597, -0.2607998, 2.590549, 0, 0.4352941, 1, 1,
0.3052359, 1.230407, -0.8122733, 0, 0.4313726, 1, 1,
0.3067744, 0.6994573, 0.3550542, 0, 0.4235294, 1, 1,
0.3091345, 0.8391767, 0.3654338, 0, 0.4196078, 1, 1,
0.3113464, 0.1379249, 2.793205, 0, 0.4117647, 1, 1,
0.3122509, -2.532866, 1.865899, 0, 0.4078431, 1, 1,
0.3146318, 0.579614, 0.8320035, 0, 0.4, 1, 1,
0.3147196, -1.50933, 2.755454, 0, 0.3921569, 1, 1,
0.3176295, -1.586416, 4.684516, 0, 0.3882353, 1, 1,
0.318618, -0.9809811, 3.435551, 0, 0.3803922, 1, 1,
0.3186502, -0.4499332, 2.535353, 0, 0.3764706, 1, 1,
0.3204961, 1.253508, -1.100704, 0, 0.3686275, 1, 1,
0.320829, 1.148625, -0.889838, 0, 0.3647059, 1, 1,
0.3247236, 0.6760536, 0.6932687, 0, 0.3568628, 1, 1,
0.324786, -0.8450359, 2.128177, 0, 0.3529412, 1, 1,
0.3267679, 0.3842716, -0.582076, 0, 0.345098, 1, 1,
0.3286996, -1.60459, 2.33995, 0, 0.3411765, 1, 1,
0.3316506, -0.4507692, 2.525191, 0, 0.3333333, 1, 1,
0.3340476, 0.06264433, 0.8928509, 0, 0.3294118, 1, 1,
0.3358294, -0.1507912, 0.7573013, 0, 0.3215686, 1, 1,
0.3361552, -0.2590014, 3.421795, 0, 0.3176471, 1, 1,
0.336492, 0.5861223, 1.512215, 0, 0.3098039, 1, 1,
0.3377415, -0.2135915, 2.250036, 0, 0.3058824, 1, 1,
0.3402717, -1.101468, 3.741954, 0, 0.2980392, 1, 1,
0.3502155, -0.5343796, 1.580737, 0, 0.2901961, 1, 1,
0.3554554, -1.373209, 2.730056, 0, 0.2862745, 1, 1,
0.3596748, 1.218903, -0.7177451, 0, 0.2784314, 1, 1,
0.3600881, -0.3565535, 2.737468, 0, 0.2745098, 1, 1,
0.3647547, -0.2305862, 3.930212, 0, 0.2666667, 1, 1,
0.3648407, -2.156443, 4.854611, 0, 0.2627451, 1, 1,
0.3686407, 0.9647434, -0.06813628, 0, 0.254902, 1, 1,
0.3687901, -2.689991, 1.721705, 0, 0.2509804, 1, 1,
0.374491, -0.3800516, 1.618733, 0, 0.2431373, 1, 1,
0.3754967, 0.6318189, 0.04673503, 0, 0.2392157, 1, 1,
0.3783866, -0.4199342, 1.728006, 0, 0.2313726, 1, 1,
0.3796028, 0.9355782, -0.2573625, 0, 0.227451, 1, 1,
0.3811806, -0.5431688, 5.411194, 0, 0.2196078, 1, 1,
0.3874682, -0.2329521, 1.496053, 0, 0.2156863, 1, 1,
0.3894758, 0.5624112, 3.015871, 0, 0.2078431, 1, 1,
0.3906827, 1.598429, -0.09385005, 0, 0.2039216, 1, 1,
0.392148, -1.753909, 2.503423, 0, 0.1960784, 1, 1,
0.3931009, 1.327827, -1.21525, 0, 0.1882353, 1, 1,
0.3976174, 0.2483317, 0.60273, 0, 0.1843137, 1, 1,
0.3990066, -0.8126984, 4.837121, 0, 0.1764706, 1, 1,
0.3996927, -0.110927, 0.5415749, 0, 0.172549, 1, 1,
0.4012189, -1.002703, 2.530094, 0, 0.1647059, 1, 1,
0.4046682, -2.280653, 3.670238, 0, 0.1607843, 1, 1,
0.4100928, -0.685233, 2.373141, 0, 0.1529412, 1, 1,
0.4112571, -2.191087, 5.185208, 0, 0.1490196, 1, 1,
0.4116249, 1.051476, -1.342433, 0, 0.1411765, 1, 1,
0.4131919, 0.04621628, 4.255058, 0, 0.1372549, 1, 1,
0.4143549, 1.227318, 0.9324307, 0, 0.1294118, 1, 1,
0.4182685, 0.3864284, 0.02529423, 0, 0.1254902, 1, 1,
0.4198909, -0.6366478, 1.65558, 0, 0.1176471, 1, 1,
0.423272, 1.39344, 0.5572121, 0, 0.1137255, 1, 1,
0.4268449, 0.89278, 1.221833, 0, 0.1058824, 1, 1,
0.4279004, 0.98605, -0.1153812, 0, 0.09803922, 1, 1,
0.4287687, 0.8872113, -0.1515406, 0, 0.09411765, 1, 1,
0.4290039, 1.257268, -0.6657849, 0, 0.08627451, 1, 1,
0.4323698, -0.2419548, 1.062184, 0, 0.08235294, 1, 1,
0.4343451, -0.2188738, 1.38902, 0, 0.07450981, 1, 1,
0.4357008, 0.785266, -0.2043756, 0, 0.07058824, 1, 1,
0.4375475, -0.1366267, 2.05366, 0, 0.0627451, 1, 1,
0.4390218, 0.3724825, 0.2886669, 0, 0.05882353, 1, 1,
0.4392781, 0.5343052, 0.5311902, 0, 0.05098039, 1, 1,
0.440355, 0.4634198, 2.926329, 0, 0.04705882, 1, 1,
0.4415855, 1.166157, 1.734292, 0, 0.03921569, 1, 1,
0.455342, 1.268845, 0.009418312, 0, 0.03529412, 1, 1,
0.4566998, -1.041336, 3.954806, 0, 0.02745098, 1, 1,
0.4584388, 0.6405806, 0.8342492, 0, 0.02352941, 1, 1,
0.4598564, -0.8915577, 2.189672, 0, 0.01568628, 1, 1,
0.4608591, -1.276185, 2.992848, 0, 0.01176471, 1, 1,
0.4615274, 1.589258, 0.4503767, 0, 0.003921569, 1, 1,
0.4630735, 0.5628199, -0.8183594, 0.003921569, 0, 1, 1,
0.4654061, -1.218287, 2.960829, 0.007843138, 0, 1, 1,
0.4697468, -0.1657043, 4.7848, 0.01568628, 0, 1, 1,
0.4703346, 0.6660728, -0.774106, 0.01960784, 0, 1, 1,
0.4714865, -0.9064957, 2.467935, 0.02745098, 0, 1, 1,
0.4721628, 2.835849, 0.8120319, 0.03137255, 0, 1, 1,
0.4721881, -0.1005093, 1.779692, 0.03921569, 0, 1, 1,
0.4772293, 0.2296776, 2.244532, 0.04313726, 0, 1, 1,
0.4789245, 0.7246621, 1.064249, 0.05098039, 0, 1, 1,
0.4789498, 0.2938734, 0.4812772, 0.05490196, 0, 1, 1,
0.480376, 1.793253, -0.2503331, 0.0627451, 0, 1, 1,
0.4817289, 0.07084323, 2.581282, 0.06666667, 0, 1, 1,
0.4858144, -1.393926, 4.137272, 0.07450981, 0, 1, 1,
0.4868648, 0.9124811, 1.81453, 0.07843138, 0, 1, 1,
0.4899731, 0.9882556, 0.1404095, 0.08627451, 0, 1, 1,
0.4903167, -0.4756076, 1.390664, 0.09019608, 0, 1, 1,
0.4936077, 1.050971, 1.021958, 0.09803922, 0, 1, 1,
0.4960318, 0.388015, 3.397642, 0.1058824, 0, 1, 1,
0.4977863, 0.4292179, 1.408332, 0.1098039, 0, 1, 1,
0.4992975, -0.907127, 2.634779, 0.1176471, 0, 1, 1,
0.4993123, -0.5646857, 1.387515, 0.1215686, 0, 1, 1,
0.5031592, 1.858131, 0.865797, 0.1294118, 0, 1, 1,
0.5035266, 0.4722227, -1.406464, 0.1333333, 0, 1, 1,
0.5053759, 1.131903, 0.3042561, 0.1411765, 0, 1, 1,
0.5065182, 1.192993, 1.54642, 0.145098, 0, 1, 1,
0.5098129, 1.211657, -0.3655527, 0.1529412, 0, 1, 1,
0.5105502, 0.4229268, -0.8395793, 0.1568628, 0, 1, 1,
0.5152585, 0.7317259, 2.410758, 0.1647059, 0, 1, 1,
0.5175297, -1.339161, 2.641111, 0.1686275, 0, 1, 1,
0.5176417, 0.6841224, 1.577608, 0.1764706, 0, 1, 1,
0.5281434, -1.363419, 2.510413, 0.1803922, 0, 1, 1,
0.5410091, 0.5939716, -0.2191732, 0.1882353, 0, 1, 1,
0.5509825, -0.7894128, 3.092083, 0.1921569, 0, 1, 1,
0.55796, 1.475205, 0.1543318, 0.2, 0, 1, 1,
0.5583186, -1.999496, 3.40047, 0.2078431, 0, 1, 1,
0.5603077, -0.09269141, 2.664424, 0.2117647, 0, 1, 1,
0.5656105, 0.1358233, 2.565461, 0.2196078, 0, 1, 1,
0.5663353, -0.4771583, 2.210944, 0.2235294, 0, 1, 1,
0.5674001, -0.35869, 1.975141, 0.2313726, 0, 1, 1,
0.5683367, -0.0009100154, 0.808945, 0.2352941, 0, 1, 1,
0.5755824, -1.292192, 1.222386, 0.2431373, 0, 1, 1,
0.578248, 1.581322, 1.255665, 0.2470588, 0, 1, 1,
0.5847291, 0.0881964, 2.059084, 0.254902, 0, 1, 1,
0.5942259, 0.3414847, 0.3641762, 0.2588235, 0, 1, 1,
0.5992708, -1.518639, 2.01594, 0.2666667, 0, 1, 1,
0.6083741, 0.3011185, 0.9969057, 0.2705882, 0, 1, 1,
0.6089085, 0.9859689, 0.5359139, 0.2784314, 0, 1, 1,
0.6120133, 0.1654071, 0.6506501, 0.282353, 0, 1, 1,
0.6146848, 1.35642, 0.8702829, 0.2901961, 0, 1, 1,
0.6152134, -0.1440614, 1.243496, 0.2941177, 0, 1, 1,
0.6165972, 0.1625403, 1.052077, 0.3019608, 0, 1, 1,
0.6177954, -0.1307623, 2.169765, 0.3098039, 0, 1, 1,
0.6224308, -0.5294442, 3.18422, 0.3137255, 0, 1, 1,
0.6245768, -0.8218471, 3.260004, 0.3215686, 0, 1, 1,
0.6274349, -1.389214, 5.026647, 0.3254902, 0, 1, 1,
0.6276642, 1.843308, -0.04731485, 0.3333333, 0, 1, 1,
0.6317261, -0.7369392, 1.698033, 0.3372549, 0, 1, 1,
0.6333252, 0.7202649, 0.305236, 0.345098, 0, 1, 1,
0.6455885, -0.6597555, 2.988753, 0.3490196, 0, 1, 1,
0.6483027, 1.357564, -1.102032, 0.3568628, 0, 1, 1,
0.6486774, 0.8510864, 0.3787546, 0.3607843, 0, 1, 1,
0.652401, -0.801973, 3.306693, 0.3686275, 0, 1, 1,
0.6528937, -0.07909509, 0.9837577, 0.372549, 0, 1, 1,
0.6589775, -1.319721, 2.883886, 0.3803922, 0, 1, 1,
0.6605763, -0.07583419, 2.76974, 0.3843137, 0, 1, 1,
0.6616645, 1.262107, 1.74245, 0.3921569, 0, 1, 1,
0.6663135, 0.3966846, 1.601553, 0.3960784, 0, 1, 1,
0.67173, 1.185029, -1.372835, 0.4039216, 0, 1, 1,
0.6829934, -0.2456161, 2.03135, 0.4117647, 0, 1, 1,
0.6862682, 0.4272629, 0.6165069, 0.4156863, 0, 1, 1,
0.6893577, -0.5761006, 3.265636, 0.4235294, 0, 1, 1,
0.6974398, 0.4604601, 2.650666, 0.427451, 0, 1, 1,
0.7010998, -1.212608, 3.18454, 0.4352941, 0, 1, 1,
0.7017391, -0.4876267, 0.319737, 0.4392157, 0, 1, 1,
0.7035017, -0.3165342, 2.84142, 0.4470588, 0, 1, 1,
0.70362, -0.3913085, 2.42427, 0.4509804, 0, 1, 1,
0.706849, 0.1824652, 0.3113751, 0.4588235, 0, 1, 1,
0.7112834, -1.239688, 3.703339, 0.4627451, 0, 1, 1,
0.7127974, -0.6771637, 3.397758, 0.4705882, 0, 1, 1,
0.7165626, 1.663726, 1.159684, 0.4745098, 0, 1, 1,
0.7191558, 1.431711, 0.5153731, 0.4823529, 0, 1, 1,
0.7192593, 0.7327968, 0.5686898, 0.4862745, 0, 1, 1,
0.7268134, 0.6927865, -0.6965638, 0.4941176, 0, 1, 1,
0.7269582, 0.6015952, 1.270104, 0.5019608, 0, 1, 1,
0.727016, 2.178043, -0.4257306, 0.5058824, 0, 1, 1,
0.72735, -0.7852948, 2.400491, 0.5137255, 0, 1, 1,
0.7282303, -0.3723221, 1.197651, 0.5176471, 0, 1, 1,
0.7282738, -1.326931, 1.861286, 0.5254902, 0, 1, 1,
0.7376922, -0.1162821, 0.006697095, 0.5294118, 0, 1, 1,
0.739542, -0.9159615, 2.241144, 0.5372549, 0, 1, 1,
0.7417957, 0.7824815, 2.004153, 0.5411765, 0, 1, 1,
0.7449033, 0.3440329, 1.746389, 0.5490196, 0, 1, 1,
0.7495319, 1.553557, -0.1336601, 0.5529412, 0, 1, 1,
0.7560835, -1.876315, 1.165776, 0.5607843, 0, 1, 1,
0.7625999, -0.4846673, 3.469794, 0.5647059, 0, 1, 1,
0.763372, -0.3021584, 0.6760013, 0.572549, 0, 1, 1,
0.7655737, 0.6814263, 1.928566, 0.5764706, 0, 1, 1,
0.7658668, 1.914545, -0.1012965, 0.5843138, 0, 1, 1,
0.7706683, 0.01454651, 0.2281993, 0.5882353, 0, 1, 1,
0.7722247, 0.728802, 2.763082, 0.5960785, 0, 1, 1,
0.7770293, -1.000945, 3.293494, 0.6039216, 0, 1, 1,
0.7773921, -0.9306284, 3.943216, 0.6078432, 0, 1, 1,
0.7828113, -1.308156, 2.505908, 0.6156863, 0, 1, 1,
0.7893447, 0.9245352, 0.8365238, 0.6196079, 0, 1, 1,
0.7921712, 1.783624, 0.3274948, 0.627451, 0, 1, 1,
0.7924159, -0.4710125, 4.140241, 0.6313726, 0, 1, 1,
0.7993581, 0.2111381, 1.552874, 0.6392157, 0, 1, 1,
0.8102199, 1.267195, 0.3389708, 0.6431373, 0, 1, 1,
0.8120062, -0.3173787, 1.142329, 0.6509804, 0, 1, 1,
0.8130239, 0.471835, 2.747232, 0.654902, 0, 1, 1,
0.8131709, -0.6605889, 2.544789, 0.6627451, 0, 1, 1,
0.8137935, -2.086324, 2.715102, 0.6666667, 0, 1, 1,
0.8150685, 0.4605298, 1.898219, 0.6745098, 0, 1, 1,
0.8187135, 0.7547902, 1.183234, 0.6784314, 0, 1, 1,
0.8195865, -0.4432414, 2.078268, 0.6862745, 0, 1, 1,
0.8198956, -1.032556, 2.033921, 0.6901961, 0, 1, 1,
0.8205932, -0.251244, 1.236376, 0.6980392, 0, 1, 1,
0.8206568, -0.06500949, 2.787761, 0.7058824, 0, 1, 1,
0.8208927, 1.378969, 0.8875856, 0.7098039, 0, 1, 1,
0.8274088, -0.876093, 0.5585241, 0.7176471, 0, 1, 1,
0.8283806, -0.3539442, 2.941979, 0.7215686, 0, 1, 1,
0.8299465, 0.03471652, 1.009281, 0.7294118, 0, 1, 1,
0.8302154, 0.6797091, 2.610097, 0.7333333, 0, 1, 1,
0.837763, -0.6891809, 2.877851, 0.7411765, 0, 1, 1,
0.8389438, 0.09585954, 2.730306, 0.7450981, 0, 1, 1,
0.8422652, 0.852556, 0.4199444, 0.7529412, 0, 1, 1,
0.8442815, -0.1824592, 2.192198, 0.7568628, 0, 1, 1,
0.8456035, 0.6763652, 1.049101, 0.7647059, 0, 1, 1,
0.8457852, 0.3141876, 2.460759, 0.7686275, 0, 1, 1,
0.8487146, -0.9733195, 2.93671, 0.7764706, 0, 1, 1,
0.8490757, -0.5961812, 2.100786, 0.7803922, 0, 1, 1,
0.8511676, 1.837451, -0.4990465, 0.7882353, 0, 1, 1,
0.8672945, -0.1778851, 2.157671, 0.7921569, 0, 1, 1,
0.8678779, 0.6874034, 0.02683391, 0.8, 0, 1, 1,
0.8681448, 0.3794896, -0.4264165, 0.8078431, 0, 1, 1,
0.8770772, 1.364925, 2.245564, 0.8117647, 0, 1, 1,
0.8780594, 1.026914, 1.100227, 0.8196079, 0, 1, 1,
0.8794276, -0.6949649, 1.091742, 0.8235294, 0, 1, 1,
0.88355, -0.08350283, 2.045219, 0.8313726, 0, 1, 1,
0.8876433, 0.2841476, 0.7107269, 0.8352941, 0, 1, 1,
0.8978537, 0.1742485, 0.1225467, 0.8431373, 0, 1, 1,
0.9098743, 0.3208631, 1.729201, 0.8470588, 0, 1, 1,
0.9103358, 0.2594737, -1.56829, 0.854902, 0, 1, 1,
0.9129712, 1.066071, 1.631279, 0.8588235, 0, 1, 1,
0.9167858, 0.6507753, 0.7513384, 0.8666667, 0, 1, 1,
0.9201776, -0.09087047, 2.283842, 0.8705882, 0, 1, 1,
0.9219164, -0.08990593, 3.138958, 0.8784314, 0, 1, 1,
0.924855, -1.471963, 2.353488, 0.8823529, 0, 1, 1,
0.9297987, -1.239303, 1.82562, 0.8901961, 0, 1, 1,
0.933597, -1.019848, 2.275851, 0.8941177, 0, 1, 1,
0.9379804, 1.268344, -0.2655352, 0.9019608, 0, 1, 1,
0.9392543, -2.039984, 1.125407, 0.9098039, 0, 1, 1,
0.9403825, -0.1096121, -1.124722, 0.9137255, 0, 1, 1,
0.9407931, -0.4666929, 3.621349, 0.9215686, 0, 1, 1,
0.9408234, 1.238983, 0.5367489, 0.9254902, 0, 1, 1,
0.941514, 2.10139, 0.5797578, 0.9333333, 0, 1, 1,
0.9479647, -1.112374, 0.9937971, 0.9372549, 0, 1, 1,
0.9489502, -1.56947, 2.572155, 0.945098, 0, 1, 1,
0.9524634, 0.4091183, 0.1835977, 0.9490196, 0, 1, 1,
0.9534937, -0.3986146, 0.2238346, 0.9568627, 0, 1, 1,
0.9578997, 0.09107161, 1.1597, 0.9607843, 0, 1, 1,
0.9666634, 0.9956664, 0.09623545, 0.9686275, 0, 1, 1,
0.967136, 1.352406, 1.757024, 0.972549, 0, 1, 1,
0.9762771, -0.1524847, 2.361468, 0.9803922, 0, 1, 1,
0.9800312, -0.4019446, 1.095235, 0.9843137, 0, 1, 1,
0.9974611, 0.4259452, 1.804142, 0.9921569, 0, 1, 1,
1.005853, -0.02251591, 1.82772, 0.9960784, 0, 1, 1,
1.006611, -0.1752121, 2.682314, 1, 0, 0.9960784, 1,
1.010473, 0.02994632, 1.945998, 1, 0, 0.9882353, 1,
1.011683, 1.441011, 1.670804, 1, 0, 0.9843137, 1,
1.019913, -0.2177628, 2.158121, 1, 0, 0.9764706, 1,
1.023967, -0.8713902, 2.064599, 1, 0, 0.972549, 1,
1.028495, 0.4250507, 0.6757216, 1, 0, 0.9647059, 1,
1.028749, -1.342349, 1.395286, 1, 0, 0.9607843, 1,
1.032506, 0.2830752, 1.700906, 1, 0, 0.9529412, 1,
1.038098, -0.9206957, 3.324045, 1, 0, 0.9490196, 1,
1.044259, -1.919125, 1.026095, 1, 0, 0.9411765, 1,
1.046453, 0.4944852, 2.42177, 1, 0, 0.9372549, 1,
1.048864, -0.6181355, 2.630513, 1, 0, 0.9294118, 1,
1.049667, -1.302378, 2.010454, 1, 0, 0.9254902, 1,
1.050913, 0.4018975, 0.7051737, 1, 0, 0.9176471, 1,
1.058091, -0.02171935, 3.284019, 1, 0, 0.9137255, 1,
1.05992, -0.6665952, 1.325519, 1, 0, 0.9058824, 1,
1.060475, 0.1387378, 0.8891497, 1, 0, 0.9019608, 1,
1.063684, 1.238358, 2.60793, 1, 0, 0.8941177, 1,
1.071596, -1.565827, 2.128036, 1, 0, 0.8862745, 1,
1.072854, -1.202614, 2.032284, 1, 0, 0.8823529, 1,
1.073149, 1.688005, 1.746483, 1, 0, 0.8745098, 1,
1.078099, 1.28326, 0.4538539, 1, 0, 0.8705882, 1,
1.087859, 1.022381, -1.182806, 1, 0, 0.8627451, 1,
1.088469, 1.278904, 2.747109, 1, 0, 0.8588235, 1,
1.088775, 0.2601396, 2.735804, 1, 0, 0.8509804, 1,
1.088891, 0.7992541, 1.556296, 1, 0, 0.8470588, 1,
1.093859, 1.245492, 0.2808911, 1, 0, 0.8392157, 1,
1.095132, 0.5574719, 2.589649, 1, 0, 0.8352941, 1,
1.095778, -0.9704507, 1.582609, 1, 0, 0.827451, 1,
1.097698, -1.266443, 3.186779, 1, 0, 0.8235294, 1,
1.100255, -0.3231471, 1.38299, 1, 0, 0.8156863, 1,
1.109421, -0.3607897, 2.405065, 1, 0, 0.8117647, 1,
1.109513, 1.737335, -0.7354301, 1, 0, 0.8039216, 1,
1.11745, -0.2778857, 0.8611668, 1, 0, 0.7960784, 1,
1.119231, 0.6603646, 2.576462, 1, 0, 0.7921569, 1,
1.123026, -0.4720772, 2.559946, 1, 0, 0.7843137, 1,
1.124657, 0.1458497, 1.352239, 1, 0, 0.7803922, 1,
1.149949, 1.191705, 1.036832, 1, 0, 0.772549, 1,
1.150965, -0.4070628, 2.33258, 1, 0, 0.7686275, 1,
1.155439, -0.02734258, -0.4919752, 1, 0, 0.7607843, 1,
1.158381, -0.3399469, 3.054618, 1, 0, 0.7568628, 1,
1.160317, 0.4277996, 2.102825, 1, 0, 0.7490196, 1,
1.16394, -0.5311791, 2.423006, 1, 0, 0.7450981, 1,
1.166895, -0.883306, 2.690183, 1, 0, 0.7372549, 1,
1.172579, 1.203498, 0.09284358, 1, 0, 0.7333333, 1,
1.192072, -0.3365237, 0.2898204, 1, 0, 0.7254902, 1,
1.19603, -0.3069173, 2.43042, 1, 0, 0.7215686, 1,
1.21078, 1.939395, 1.495929, 1, 0, 0.7137255, 1,
1.213943, 0.06632212, 2.378331, 1, 0, 0.7098039, 1,
1.2182, -1.37311, 3.35343, 1, 0, 0.7019608, 1,
1.219634, 1.533971, 1.796843, 1, 0, 0.6941177, 1,
1.2269, -1.297266, 2.428399, 1, 0, 0.6901961, 1,
1.22854, -0.1479957, 1.917515, 1, 0, 0.682353, 1,
1.231009, 1.843569, 0.5791096, 1, 0, 0.6784314, 1,
1.235084, -1.523723, 4.358225, 1, 0, 0.6705883, 1,
1.236003, -0.230117, 0.7960982, 1, 0, 0.6666667, 1,
1.241016, 0.2109309, 2.27147, 1, 0, 0.6588235, 1,
1.242954, -1.733212, 1.41041, 1, 0, 0.654902, 1,
1.268423, 1.421959, 0.1021631, 1, 0, 0.6470588, 1,
1.274463, -0.8236856, 1.416471, 1, 0, 0.6431373, 1,
1.27698, -0.4438735, 1.127158, 1, 0, 0.6352941, 1,
1.277749, 0.346029, 1.291814, 1, 0, 0.6313726, 1,
1.278186, 0.003891472, 3.038713, 1, 0, 0.6235294, 1,
1.283714, -0.07769704, 3.076707, 1, 0, 0.6196079, 1,
1.290499, -0.6829811, 0.3511775, 1, 0, 0.6117647, 1,
1.29096, 0.4300125, 1.638195, 1, 0, 0.6078432, 1,
1.29372, 1.318619, 0.5069172, 1, 0, 0.6, 1,
1.294788, 1.059675, 2.184602, 1, 0, 0.5921569, 1,
1.294845, -1.2865, 2.27172, 1, 0, 0.5882353, 1,
1.296018, -1.045362, 1.928627, 1, 0, 0.5803922, 1,
1.297132, -0.5018397, 1.597333, 1, 0, 0.5764706, 1,
1.297752, 0.07419661, 0.9490793, 1, 0, 0.5686275, 1,
1.29989, -0.8064764, 2.401639, 1, 0, 0.5647059, 1,
1.309249, -0.306856, 1.807209, 1, 0, 0.5568628, 1,
1.313042, -0.7776232, 0.3098432, 1, 0, 0.5529412, 1,
1.320532, 1.012593, 1.583332, 1, 0, 0.5450981, 1,
1.32854, -0.9282293, 2.809356, 1, 0, 0.5411765, 1,
1.329191, 0.08763344, 2.137769, 1, 0, 0.5333334, 1,
1.334162, 0.6643798, 0.2387679, 1, 0, 0.5294118, 1,
1.337897, -1.101086, 2.04963, 1, 0, 0.5215687, 1,
1.340583, -1.562257, 2.219407, 1, 0, 0.5176471, 1,
1.349522, 0.7089749, -0.201487, 1, 0, 0.509804, 1,
1.360975, 0.350045, 1.093399, 1, 0, 0.5058824, 1,
1.381427, 0.4272623, 1.642591, 1, 0, 0.4980392, 1,
1.387775, -0.3894122, 3.379436, 1, 0, 0.4901961, 1,
1.398381, 0.7872059, 1.910912, 1, 0, 0.4862745, 1,
1.403371, -0.2157151, 2.315367, 1, 0, 0.4784314, 1,
1.413641, 0.1427556, 0.4762271, 1, 0, 0.4745098, 1,
1.426489, -1.726562, 3.595981, 1, 0, 0.4666667, 1,
1.428226, -0.4057271, 2.137249, 1, 0, 0.4627451, 1,
1.445818, 1.317659, 0.528345, 1, 0, 0.454902, 1,
1.44976, 0.2469601, 3.400166, 1, 0, 0.4509804, 1,
1.454991, -0.1425971, 2.564298, 1, 0, 0.4431373, 1,
1.461783, 0.3326763, 2.372358, 1, 0, 0.4392157, 1,
1.472097, 1.097329, 0.5809206, 1, 0, 0.4313726, 1,
1.473193, -0.08636204, 1.159878, 1, 0, 0.427451, 1,
1.473235, -1.551995, 2.878805, 1, 0, 0.4196078, 1,
1.503412, -0.637496, 2.914667, 1, 0, 0.4156863, 1,
1.517471, 0.6083639, 2.46076, 1, 0, 0.4078431, 1,
1.536191, 0.9563412, 0.8236734, 1, 0, 0.4039216, 1,
1.554282, -1.654276, 1.947992, 1, 0, 0.3960784, 1,
1.561369, -0.5697799, 3.017998, 1, 0, 0.3882353, 1,
1.572097, -1.175702, 2.31074, 1, 0, 0.3843137, 1,
1.584254, -1.270352, 3.659621, 1, 0, 0.3764706, 1,
1.597862, 0.6488743, 1.085658, 1, 0, 0.372549, 1,
1.599036, -0.4840299, 1.34068, 1, 0, 0.3647059, 1,
1.601365, -0.9318724, 0.7663136, 1, 0, 0.3607843, 1,
1.603728, -0.3077785, 2.892889, 1, 0, 0.3529412, 1,
1.606125, 0.7178836, -0.7426085, 1, 0, 0.3490196, 1,
1.649775, 0.2830293, 2.101878, 1, 0, 0.3411765, 1,
1.658475, 0.6779494, 1.021428, 1, 0, 0.3372549, 1,
1.676309, 1.603303, 1.195565, 1, 0, 0.3294118, 1,
1.698429, 0.5341324, 2.102629, 1, 0, 0.3254902, 1,
1.705487, -0.2048039, 1.209142, 1, 0, 0.3176471, 1,
1.708047, -1.07718, 1.563134, 1, 0, 0.3137255, 1,
1.7093, -0.9140326, 1.033906, 1, 0, 0.3058824, 1,
1.709922, -1.785055, 0.9554774, 1, 0, 0.2980392, 1,
1.712967, 0.7635181, 0.7256068, 1, 0, 0.2941177, 1,
1.717768, 0.08891613, 3.32609, 1, 0, 0.2862745, 1,
1.75165, -1.258415, 3.173366, 1, 0, 0.282353, 1,
1.754383, -1.0368, 3.125609, 1, 0, 0.2745098, 1,
1.778351, 0.2654076, 1.143683, 1, 0, 0.2705882, 1,
1.795375, 0.5026985, 0.2394713, 1, 0, 0.2627451, 1,
1.841913, 1.175769, 2.315082, 1, 0, 0.2588235, 1,
1.842125, -0.4675893, 1.772987, 1, 0, 0.2509804, 1,
1.844961, -0.7273591, 3.204189, 1, 0, 0.2470588, 1,
1.847981, 0.5431771, 1.405753, 1, 0, 0.2392157, 1,
1.84961, 1.433897, -0.02906172, 1, 0, 0.2352941, 1,
1.877071, -0.09542441, 1.372715, 1, 0, 0.227451, 1,
1.881043, 0.5425047, 1.073329, 1, 0, 0.2235294, 1,
1.887041, 0.2652462, 1.336435, 1, 0, 0.2156863, 1,
1.890785, -0.7220449, 2.133025, 1, 0, 0.2117647, 1,
1.90584, -0.08692241, 1.461034, 1, 0, 0.2039216, 1,
1.908929, 0.4487222, 1.993221, 1, 0, 0.1960784, 1,
1.925455, 0.7236926, 0.4463626, 1, 0, 0.1921569, 1,
1.968522, 0.08869999, 1.534908, 1, 0, 0.1843137, 1,
1.990147, 0.08817285, 0.2767553, 1, 0, 0.1803922, 1,
1.996406, 0.9258826, 1.874297, 1, 0, 0.172549, 1,
2.002409, -2.711305, 2.028368, 1, 0, 0.1686275, 1,
2.012663, 0.6226525, 0.9468371, 1, 0, 0.1607843, 1,
2.027681, -0.2586609, -0.3281284, 1, 0, 0.1568628, 1,
2.035971, 1.279818, 2.401985, 1, 0, 0.1490196, 1,
2.037722, -0.6847796, 2.692391, 1, 0, 0.145098, 1,
2.052562, -1.127964, 2.436344, 1, 0, 0.1372549, 1,
2.054775, 1.288814, 1.242752, 1, 0, 0.1333333, 1,
2.060114, -0.6917886, 2.331285, 1, 0, 0.1254902, 1,
2.069141, -1.287075, 2.894747, 1, 0, 0.1215686, 1,
2.072488, 1.05831, 2.279691, 1, 0, 0.1137255, 1,
2.099736, -0.7181081, 0.6518207, 1, 0, 0.1098039, 1,
2.129341, -0.4020747, 2.586941, 1, 0, 0.1019608, 1,
2.151607, -1.191716, 1.566839, 1, 0, 0.09411765, 1,
2.154491, 0.1956427, 0.8589727, 1, 0, 0.09019608, 1,
2.290485, 0.6919311, 0.6587281, 1, 0, 0.08235294, 1,
2.40001, 1.533111, 1.227343, 1, 0, 0.07843138, 1,
2.478072, -0.4755182, 2.296263, 1, 0, 0.07058824, 1,
2.480592, 1.088716, 2.342309, 1, 0, 0.06666667, 1,
2.494873, -2.058092, 2.94332, 1, 0, 0.05882353, 1,
2.589522, 0.09209332, 2.49059, 1, 0, 0.05490196, 1,
2.616585, 0.7067235, 2.756562, 1, 0, 0.04705882, 1,
2.725742, 0.05141816, 0.373794, 1, 0, 0.04313726, 1,
2.745837, -0.3601791, 0.6649668, 1, 0, 0.03529412, 1,
2.82018, -0.5268285, -0.624576, 1, 0, 0.03137255, 1,
2.868352, 1.805404, 2.293305, 1, 0, 0.02352941, 1,
3.119827, 0.7601149, 0.7390379, 1, 0, 0.01960784, 1,
3.514631, 1.166749, -0.7284459, 1, 0, 0.01176471, 1,
3.583532, -1.352339, 2.610962, 1, 0, 0.007843138, 1
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
0.2522715, -3.652001, -7.1116, 0, -0.5, 0.5, 0.5,
0.2522715, -3.652001, -7.1116, 1, -0.5, 0.5, 0.5,
0.2522715, -3.652001, -7.1116, 1, 1.5, 0.5, 0.5,
0.2522715, -3.652001, -7.1116, 0, 1.5, 0.5, 0.5
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
-4.208286, 0.063609, -7.1116, 0, -0.5, 0.5, 0.5,
-4.208286, 0.063609, -7.1116, 1, -0.5, 0.5, 0.5,
-4.208286, 0.063609, -7.1116, 1, 1.5, 0.5, 0.5,
-4.208286, 0.063609, -7.1116, 0, 1.5, 0.5, 0.5
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
-4.208286, -3.652001, 0.05728436, 0, -0.5, 0.5, 0.5,
-4.208286, -3.652001, 0.05728436, 1, -0.5, 0.5, 0.5,
-4.208286, -3.652001, 0.05728436, 1, 1.5, 0.5, 0.5,
-4.208286, -3.652001, 0.05728436, 0, 1.5, 0.5, 0.5
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
-3, -2.794552, -5.457242,
3, -2.794552, -5.457242,
-3, -2.794552, -5.457242,
-3, -2.93746, -5.732969,
-2, -2.794552, -5.457242,
-2, -2.93746, -5.732969,
-1, -2.794552, -5.457242,
-1, -2.93746, -5.732969,
0, -2.794552, -5.457242,
0, -2.93746, -5.732969,
1, -2.794552, -5.457242,
1, -2.93746, -5.732969,
2, -2.794552, -5.457242,
2, -2.93746, -5.732969,
3, -2.794552, -5.457242,
3, -2.93746, -5.732969
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
-3, -3.223277, -6.284421, 0, -0.5, 0.5, 0.5,
-3, -3.223277, -6.284421, 1, -0.5, 0.5, 0.5,
-3, -3.223277, -6.284421, 1, 1.5, 0.5, 0.5,
-3, -3.223277, -6.284421, 0, 1.5, 0.5, 0.5,
-2, -3.223277, -6.284421, 0, -0.5, 0.5, 0.5,
-2, -3.223277, -6.284421, 1, -0.5, 0.5, 0.5,
-2, -3.223277, -6.284421, 1, 1.5, 0.5, 0.5,
-2, -3.223277, -6.284421, 0, 1.5, 0.5, 0.5,
-1, -3.223277, -6.284421, 0, -0.5, 0.5, 0.5,
-1, -3.223277, -6.284421, 1, -0.5, 0.5, 0.5,
-1, -3.223277, -6.284421, 1, 1.5, 0.5, 0.5,
-1, -3.223277, -6.284421, 0, 1.5, 0.5, 0.5,
0, -3.223277, -6.284421, 0, -0.5, 0.5, 0.5,
0, -3.223277, -6.284421, 1, -0.5, 0.5, 0.5,
0, -3.223277, -6.284421, 1, 1.5, 0.5, 0.5,
0, -3.223277, -6.284421, 0, 1.5, 0.5, 0.5,
1, -3.223277, -6.284421, 0, -0.5, 0.5, 0.5,
1, -3.223277, -6.284421, 1, -0.5, 0.5, 0.5,
1, -3.223277, -6.284421, 1, 1.5, 0.5, 0.5,
1, -3.223277, -6.284421, 0, 1.5, 0.5, 0.5,
2, -3.223277, -6.284421, 0, -0.5, 0.5, 0.5,
2, -3.223277, -6.284421, 1, -0.5, 0.5, 0.5,
2, -3.223277, -6.284421, 1, 1.5, 0.5, 0.5,
2, -3.223277, -6.284421, 0, 1.5, 0.5, 0.5,
3, -3.223277, -6.284421, 0, -0.5, 0.5, 0.5,
3, -3.223277, -6.284421, 1, -0.5, 0.5, 0.5,
3, -3.223277, -6.284421, 1, 1.5, 0.5, 0.5,
3, -3.223277, -6.284421, 0, 1.5, 0.5, 0.5
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
-3.178927, -2, -5.457242,
-3.178927, 2, -5.457242,
-3.178927, -2, -5.457242,
-3.350487, -2, -5.732969,
-3.178927, -1, -5.457242,
-3.350487, -1, -5.732969,
-3.178927, 0, -5.457242,
-3.350487, 0, -5.732969,
-3.178927, 1, -5.457242,
-3.350487, 1, -5.732969,
-3.178927, 2, -5.457242,
-3.350487, 2, -5.732969
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
-3.693606, -2, -6.284421, 0, -0.5, 0.5, 0.5,
-3.693606, -2, -6.284421, 1, -0.5, 0.5, 0.5,
-3.693606, -2, -6.284421, 1, 1.5, 0.5, 0.5,
-3.693606, -2, -6.284421, 0, 1.5, 0.5, 0.5,
-3.693606, -1, -6.284421, 0, -0.5, 0.5, 0.5,
-3.693606, -1, -6.284421, 1, -0.5, 0.5, 0.5,
-3.693606, -1, -6.284421, 1, 1.5, 0.5, 0.5,
-3.693606, -1, -6.284421, 0, 1.5, 0.5, 0.5,
-3.693606, 0, -6.284421, 0, -0.5, 0.5, 0.5,
-3.693606, 0, -6.284421, 1, -0.5, 0.5, 0.5,
-3.693606, 0, -6.284421, 1, 1.5, 0.5, 0.5,
-3.693606, 0, -6.284421, 0, 1.5, 0.5, 0.5,
-3.693606, 1, -6.284421, 0, -0.5, 0.5, 0.5,
-3.693606, 1, -6.284421, 1, -0.5, 0.5, 0.5,
-3.693606, 1, -6.284421, 1, 1.5, 0.5, 0.5,
-3.693606, 1, -6.284421, 0, 1.5, 0.5, 0.5,
-3.693606, 2, -6.284421, 0, -0.5, 0.5, 0.5,
-3.693606, 2, -6.284421, 1, -0.5, 0.5, 0.5,
-3.693606, 2, -6.284421, 1, 1.5, 0.5, 0.5,
-3.693606, 2, -6.284421, 0, 1.5, 0.5, 0.5
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
-3.178927, -2.794552, -4,
-3.178927, -2.794552, 4,
-3.178927, -2.794552, -4,
-3.350487, -2.93746, -4,
-3.178927, -2.794552, -2,
-3.350487, -2.93746, -2,
-3.178927, -2.794552, 0,
-3.350487, -2.93746, 0,
-3.178927, -2.794552, 2,
-3.350487, -2.93746, 2,
-3.178927, -2.794552, 4,
-3.350487, -2.93746, 4
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
-3.693606, -3.223277, -4, 0, -0.5, 0.5, 0.5,
-3.693606, -3.223277, -4, 1, -0.5, 0.5, 0.5,
-3.693606, -3.223277, -4, 1, 1.5, 0.5, 0.5,
-3.693606, -3.223277, -4, 0, 1.5, 0.5, 0.5,
-3.693606, -3.223277, -2, 0, -0.5, 0.5, 0.5,
-3.693606, -3.223277, -2, 1, -0.5, 0.5, 0.5,
-3.693606, -3.223277, -2, 1, 1.5, 0.5, 0.5,
-3.693606, -3.223277, -2, 0, 1.5, 0.5, 0.5,
-3.693606, -3.223277, 0, 0, -0.5, 0.5, 0.5,
-3.693606, -3.223277, 0, 1, -0.5, 0.5, 0.5,
-3.693606, -3.223277, 0, 1, 1.5, 0.5, 0.5,
-3.693606, -3.223277, 0, 0, 1.5, 0.5, 0.5,
-3.693606, -3.223277, 2, 0, -0.5, 0.5, 0.5,
-3.693606, -3.223277, 2, 1, -0.5, 0.5, 0.5,
-3.693606, -3.223277, 2, 1, 1.5, 0.5, 0.5,
-3.693606, -3.223277, 2, 0, 1.5, 0.5, 0.5,
-3.693606, -3.223277, 4, 0, -0.5, 0.5, 0.5,
-3.693606, -3.223277, 4, 1, -0.5, 0.5, 0.5,
-3.693606, -3.223277, 4, 1, 1.5, 0.5, 0.5,
-3.693606, -3.223277, 4, 0, 1.5, 0.5, 0.5
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
-3.178927, -2.794552, -5.457242,
-3.178927, 2.92177, -5.457242,
-3.178927, -2.794552, 5.571811,
-3.178927, 2.92177, 5.571811,
-3.178927, -2.794552, -5.457242,
-3.178927, -2.794552, 5.571811,
-3.178927, 2.92177, -5.457242,
-3.178927, 2.92177, 5.571811,
-3.178927, -2.794552, -5.457242,
3.68347, -2.794552, -5.457242,
-3.178927, -2.794552, 5.571811,
3.68347, -2.794552, 5.571811,
-3.178927, 2.92177, -5.457242,
3.68347, 2.92177, -5.457242,
-3.178927, 2.92177, 5.571811,
3.68347, 2.92177, 5.571811,
3.68347, -2.794552, -5.457242,
3.68347, 2.92177, -5.457242,
3.68347, -2.794552, 5.571811,
3.68347, 2.92177, 5.571811,
3.68347, -2.794552, -5.457242,
3.68347, -2.794552, 5.571811,
3.68347, 2.92177, -5.457242,
3.68347, 2.92177, 5.571811
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
var radius = 7.578177;
var distance = 33.71616;
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
mvMatrix.translate( -0.2522715, -0.063609, -0.05728436 );
mvMatrix.scale( 1.193996, 1.433382, 0.7429172 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.71616);
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
triclopyr<-read.table("triclopyr.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triclopyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'triclopyr' not found
```

```r
y<-triclopyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'triclopyr' not found
```

```r
z<-triclopyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'triclopyr' not found
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
-3.078989, 0.8718562, -1.784436, 0, 0, 1, 1, 1,
-2.71625, -1.133551, -3.37151, 1, 0, 0, 1, 1,
-2.697407, 1.897337, -0.6849235, 1, 0, 0, 1, 1,
-2.620672, -0.5042816, -1.61942, 1, 0, 0, 1, 1,
-2.546413, 0.7581728, -3.139614, 1, 0, 0, 1, 1,
-2.542381, 1.891322, 0.2734926, 1, 0, 0, 1, 1,
-2.526695, 0.002939196, -1.626676, 0, 0, 0, 1, 1,
-2.435097, 0.212961, -1.458684, 0, 0, 0, 1, 1,
-2.427738, -1.717724, -2.494426, 0, 0, 0, 1, 1,
-2.376007, -0.6171588, -1.667215, 0, 0, 0, 1, 1,
-2.2347, -0.2649683, -1.589337, 0, 0, 0, 1, 1,
-2.232512, 0.7111652, -2.111232, 0, 0, 0, 1, 1,
-2.230033, -0.3772172, -2.112952, 0, 0, 0, 1, 1,
-2.167331, 1.788506, 0.1191638, 1, 1, 1, 1, 1,
-2.133765, -1.730252, -5.031765, 1, 1, 1, 1, 1,
-2.069614, -0.8137783, -0.5154887, 1, 1, 1, 1, 1,
-2.069402, 0.8583114, -0.77147, 1, 1, 1, 1, 1,
-2.014692, 0.2818397, -0.5131069, 1, 1, 1, 1, 1,
-1.98904, -0.01428713, -1.866237, 1, 1, 1, 1, 1,
-1.982442, 0.09791383, -0.9202607, 1, 1, 1, 1, 1,
-1.955285, 0.7959503, -0.3249247, 1, 1, 1, 1, 1,
-1.952517, -0.9396223, -3.223254, 1, 1, 1, 1, 1,
-1.950236, 0.6710293, -2.202703, 1, 1, 1, 1, 1,
-1.945722, 1.227633, -1.441188, 1, 1, 1, 1, 1,
-1.902181, 0.1682742, -2.256116, 1, 1, 1, 1, 1,
-1.874446, -1.493621, -2.311626, 1, 1, 1, 1, 1,
-1.866493, 1.848583, -0.567729, 1, 1, 1, 1, 1,
-1.862158, -2.662429, -1.451672, 1, 1, 1, 1, 1,
-1.848198, -0.07572579, -1.362044, 0, 0, 1, 1, 1,
-1.842585, 0.8613433, 0.5315291, 1, 0, 0, 1, 1,
-1.830589, -0.05145925, -2.245193, 1, 0, 0, 1, 1,
-1.79264, -0.2291367, -2.499466, 1, 0, 0, 1, 1,
-1.784875, 0.6375763, -1.728483, 1, 0, 0, 1, 1,
-1.77571, 1.10014, -1.996182, 1, 0, 0, 1, 1,
-1.754913, 0.7354357, -0.3229055, 0, 0, 0, 1, 1,
-1.734854, -0.8248331, -0.1559546, 0, 0, 0, 1, 1,
-1.724774, -1.775452, -3.380883, 0, 0, 0, 1, 1,
-1.722046, -0.8463158, -3.358715, 0, 0, 0, 1, 1,
-1.72033, -1.676096, -4.34601, 0, 0, 0, 1, 1,
-1.716336, 1.110528, -1.07957, 0, 0, 0, 1, 1,
-1.715238, 0.3176333, 0.5722809, 0, 0, 0, 1, 1,
-1.702686, 0.9583922, -1.558707, 1, 1, 1, 1, 1,
-1.685072, -0.5004872, -1.185375, 1, 1, 1, 1, 1,
-1.682857, -1.149871, -4.380254, 1, 1, 1, 1, 1,
-1.681154, 0.05093167, -2.213551, 1, 1, 1, 1, 1,
-1.67781, 0.7999521, 0.6459419, 1, 1, 1, 1, 1,
-1.64876, -0.2157313, -1.788434, 1, 1, 1, 1, 1,
-1.641705, 0.2433953, -2.965083, 1, 1, 1, 1, 1,
-1.596382, -1.662764, -3.010548, 1, 1, 1, 1, 1,
-1.567982, 0.1606812, -2.60953, 1, 1, 1, 1, 1,
-1.562547, -0.5708871, -1.327165, 1, 1, 1, 1, 1,
-1.557685, -2.064125, -0.8802199, 1, 1, 1, 1, 1,
-1.543075, 0.5582558, -1.472242, 1, 1, 1, 1, 1,
-1.539948, -0.1833925, -1.502247, 1, 1, 1, 1, 1,
-1.538058, -1.476626, -1.369617, 1, 1, 1, 1, 1,
-1.536161, 0.204525, -1.518901, 1, 1, 1, 1, 1,
-1.517649, 1.859164, 0.5909126, 0, 0, 1, 1, 1,
-1.512764, 0.4083001, 0.2426873, 1, 0, 0, 1, 1,
-1.507911, -0.8866033, -1.898631, 1, 0, 0, 1, 1,
-1.47188, 0.2805485, -2.889385, 1, 0, 0, 1, 1,
-1.469266, 1.009436, -1.566917, 1, 0, 0, 1, 1,
-1.446352, 0.5806937, -1.547778, 1, 0, 0, 1, 1,
-1.444771, 0.258441, 0.6946387, 0, 0, 0, 1, 1,
-1.426903, 0.4001283, -1.34463, 0, 0, 0, 1, 1,
-1.425603, 0.8726641, -1.575887, 0, 0, 0, 1, 1,
-1.41574, -0.8085153, -2.416808, 0, 0, 0, 1, 1,
-1.414268, -1.696832, -2.821538, 0, 0, 0, 1, 1,
-1.410394, 0.003756038, -1.250227, 0, 0, 0, 1, 1,
-1.399016, 0.1706534, -0.7402647, 0, 0, 0, 1, 1,
-1.39421, -1.936115, -2.45241, 1, 1, 1, 1, 1,
-1.389664, 1.646088, -0.02929217, 1, 1, 1, 1, 1,
-1.372266, 1.72647, -1.497782, 1, 1, 1, 1, 1,
-1.365683, -2.410558, -1.626288, 1, 1, 1, 1, 1,
-1.358472, 0.11668, -0.432264, 1, 1, 1, 1, 1,
-1.354402, -0.3136711, -2.831283, 1, 1, 1, 1, 1,
-1.349965, -1.55005, -1.517388, 1, 1, 1, 1, 1,
-1.34945, -0.1510933, -0.08589711, 1, 1, 1, 1, 1,
-1.3453, 1.212361, -1.091701, 1, 1, 1, 1, 1,
-1.327645, -0.6525208, -1.930555, 1, 1, 1, 1, 1,
-1.322823, 1.356664, -0.438262, 1, 1, 1, 1, 1,
-1.309767, -1.155121, -0.9302575, 1, 1, 1, 1, 1,
-1.296246, 0.9090557, -1.486323, 1, 1, 1, 1, 1,
-1.293275, -0.3639354, -1.126575, 1, 1, 1, 1, 1,
-1.290118, -0.4209726, -0.531559, 1, 1, 1, 1, 1,
-1.287129, -2.163813, -2.938289, 0, 0, 1, 1, 1,
-1.283291, -0.9442424, -2.762401, 1, 0, 0, 1, 1,
-1.271501, -0.1657701, -2.72936, 1, 0, 0, 1, 1,
-1.269109, 0.2881602, -1.82457, 1, 0, 0, 1, 1,
-1.266387, -0.2335472, -2.521903, 1, 0, 0, 1, 1,
-1.263647, 0.3338629, -1.949104, 1, 0, 0, 1, 1,
-1.263388, 1.302486, -0.4504208, 0, 0, 0, 1, 1,
-1.260022, 1.286917, -2.183695, 0, 0, 0, 1, 1,
-1.256753, -1.203989, -2.371014, 0, 0, 0, 1, 1,
-1.240071, -1.049019, -2.970245, 0, 0, 0, 1, 1,
-1.238487, -0.6513869, -2.546688, 0, 0, 0, 1, 1,
-1.233283, -0.6386442, -0.4574713, 0, 0, 0, 1, 1,
-1.232439, -0.9572728, -3.343037, 0, 0, 0, 1, 1,
-1.229863, -0.2118122, -1.03285, 1, 1, 1, 1, 1,
-1.229331, 2.27096, 0.06670065, 1, 1, 1, 1, 1,
-1.224136, 0.8085964, -1.888282, 1, 1, 1, 1, 1,
-1.204513, 0.4733795, -1.761607, 1, 1, 1, 1, 1,
-1.200695, 0.9025752, -2.2131, 1, 1, 1, 1, 1,
-1.198521, 0.5636691, -0.04249411, 1, 1, 1, 1, 1,
-1.19404, 0.771197, -0.4596595, 1, 1, 1, 1, 1,
-1.187948, 0.191463, -0.6320006, 1, 1, 1, 1, 1,
-1.185161, 1.254228, -1.655825, 1, 1, 1, 1, 1,
-1.177385, -0.857763, -2.828601, 1, 1, 1, 1, 1,
-1.169687, -0.9953282, -3.023745, 1, 1, 1, 1, 1,
-1.159853, -1.208429, -2.099522, 1, 1, 1, 1, 1,
-1.15985, -1.475867, -2.372343, 1, 1, 1, 1, 1,
-1.154657, 1.02636, -2.372818, 1, 1, 1, 1, 1,
-1.152756, 0.1861327, -2.492355, 1, 1, 1, 1, 1,
-1.15048, 0.8434147, -0.9146481, 0, 0, 1, 1, 1,
-1.148255, 0.6975934, -2.423635, 1, 0, 0, 1, 1,
-1.143706, 0.9304191, 0.178203, 1, 0, 0, 1, 1,
-1.138193, 1.432705, 0.3125111, 1, 0, 0, 1, 1,
-1.136171, 1.802116, -0.1576692, 1, 0, 0, 1, 1,
-1.125972, -1.194828, -5.11946, 1, 0, 0, 1, 1,
-1.119407, -1.097161, -1.330329, 0, 0, 0, 1, 1,
-1.115329, -0.6216551, -2.43667, 0, 0, 0, 1, 1,
-1.114724, 1.003627, -1.677159, 0, 0, 0, 1, 1,
-1.103275, -0.827801, -2.40544, 0, 0, 0, 1, 1,
-1.0985, -0.783254, 0.2600442, 0, 0, 0, 1, 1,
-1.084199, 1.364218, 1.020731, 0, 0, 0, 1, 1,
-1.079064, 1.532857, 1.287957, 0, 0, 0, 1, 1,
-1.078563, 0.2288744, -0.7464126, 1, 1, 1, 1, 1,
-1.075842, 0.7017086, -1.638519, 1, 1, 1, 1, 1,
-1.072211, -0.295778, -1.084713, 1, 1, 1, 1, 1,
-1.069641, 0.7843022, -1.34615, 1, 1, 1, 1, 1,
-1.061099, -0.5569305, -1.773509, 1, 1, 1, 1, 1,
-1.054073, 0.2165433, -2.84934, 1, 1, 1, 1, 1,
-1.049964, 0.8351632, -0.1247232, 1, 1, 1, 1, 1,
-1.046945, -0.4532174, -4.306187, 1, 1, 1, 1, 1,
-1.035685, -0.8790489, -1.919839, 1, 1, 1, 1, 1,
-1.032553, -1.846998, -0.7637577, 1, 1, 1, 1, 1,
-1.025492, 1.752551, -1.661487, 1, 1, 1, 1, 1,
-1.011987, -1.852433, -0.6725635, 1, 1, 1, 1, 1,
-1.001566, -0.3732219, -0.5464375, 1, 1, 1, 1, 1,
-1.000539, -0.6426308, -0.8010397, 1, 1, 1, 1, 1,
-0.9969717, -0.4723443, -1.793327, 1, 1, 1, 1, 1,
-0.9929524, 0.9929389, 1.317649, 0, 0, 1, 1, 1,
-0.9922468, 0.5468559, -0.6120322, 1, 0, 0, 1, 1,
-0.9859524, 1.317001, -0.1685555, 1, 0, 0, 1, 1,
-0.9809843, 1.113639, -1.225422, 1, 0, 0, 1, 1,
-0.9773875, -1.991976, -0.8056309, 1, 0, 0, 1, 1,
-0.9727726, -1.126353, -2.993526, 1, 0, 0, 1, 1,
-0.9686555, 2.838523, 0.04878191, 0, 0, 0, 1, 1,
-0.9686518, 0.4071598, -1.459546, 0, 0, 0, 1, 1,
-0.9675794, 0.4576084, -0.7332019, 0, 0, 0, 1, 1,
-0.9672388, 0.4788578, -0.5901989, 0, 0, 0, 1, 1,
-0.9643956, 1.105672, -2.045941, 0, 0, 0, 1, 1,
-0.9618589, 1.538509, 0.4267111, 0, 0, 0, 1, 1,
-0.9611715, -1.085422, -2.623121, 0, 0, 0, 1, 1,
-0.9551477, 0.1027783, -1.514173, 1, 1, 1, 1, 1,
-0.9518017, 0.6744687, -2.155116, 1, 1, 1, 1, 1,
-0.9429086, -0.4416806, -2.338895, 1, 1, 1, 1, 1,
-0.9427099, 0.9455163, -1.121228, 1, 1, 1, 1, 1,
-0.9409681, 0.1554625, -2.649123, 1, 1, 1, 1, 1,
-0.9405928, 0.6119181, -1.803168, 1, 1, 1, 1, 1,
-0.9366111, 0.8594422, -0.2249667, 1, 1, 1, 1, 1,
-0.9337144, 0.5102799, -0.8910325, 1, 1, 1, 1, 1,
-0.9315439, 0.8183933, -0.6543396, 1, 1, 1, 1, 1,
-0.9268957, 0.3230243, -0.5595043, 1, 1, 1, 1, 1,
-0.9263759, 1.253182, -1.511639, 1, 1, 1, 1, 1,
-0.9200884, -0.5589418, -0.9212632, 1, 1, 1, 1, 1,
-0.9190567, 0.30157, -0.9356471, 1, 1, 1, 1, 1,
-0.9158903, 0.412258, -2.074589, 1, 1, 1, 1, 1,
-0.91132, 0.700975, -3.23517, 1, 1, 1, 1, 1,
-0.9049551, 0.7320228, -1.812728, 0, 0, 1, 1, 1,
-0.8828524, -0.2658718, -1.458511, 1, 0, 0, 1, 1,
-0.8818612, -0.03244641, 0.1903775, 1, 0, 0, 1, 1,
-0.8795261, -0.5866242, -3.645957, 1, 0, 0, 1, 1,
-0.8770961, 1.992863, -1.166491, 1, 0, 0, 1, 1,
-0.8714645, 0.2365001, -1.886529, 1, 0, 0, 1, 1,
-0.8710172, 0.3102347, -0.5729524, 0, 0, 0, 1, 1,
-0.867992, 0.3256084, -2.451355, 0, 0, 0, 1, 1,
-0.8625291, 1.153578, -0.182609, 0, 0, 0, 1, 1,
-0.8519994, -0.2483861, -0.9482627, 0, 0, 0, 1, 1,
-0.8504422, -0.1804763, -1.29661, 0, 0, 0, 1, 1,
-0.846454, -1.775537, -2.750718, 0, 0, 0, 1, 1,
-0.8455266, 0.1239129, 0.3369799, 0, 0, 0, 1, 1,
-0.8375798, 0.9048657, -0.2620557, 1, 1, 1, 1, 1,
-0.8372348, -1.71339, -2.505371, 1, 1, 1, 1, 1,
-0.8300696, 0.527522, -1.884347, 1, 1, 1, 1, 1,
-0.8294807, 0.427379, -1.472254, 1, 1, 1, 1, 1,
-0.8240005, -1.270138, -2.684772, 1, 1, 1, 1, 1,
-0.8236622, 1.178092, -1.597913, 1, 1, 1, 1, 1,
-0.819445, 1.934682, -1.405549, 1, 1, 1, 1, 1,
-0.816233, -0.09793571, -0.2554003, 1, 1, 1, 1, 1,
-0.8127558, 0.3453399, -0.9592248, 1, 1, 1, 1, 1,
-0.8106378, 1.751382, -0.7006159, 1, 1, 1, 1, 1,
-0.8033896, -2.217427, -2.057332, 1, 1, 1, 1, 1,
-0.7950082, 1.151165, -2.082426, 1, 1, 1, 1, 1,
-0.786428, 0.5143857, -0.650329, 1, 1, 1, 1, 1,
-0.7821363, 0.4072045, -0.5876662, 1, 1, 1, 1, 1,
-0.7790665, 0.4987729, -1.091422, 1, 1, 1, 1, 1,
-0.7694424, -1.413852, -2.613183, 0, 0, 1, 1, 1,
-0.7690082, 2.17876, -2.050365, 1, 0, 0, 1, 1,
-0.7681581, 0.2315835, -1.050409, 1, 0, 0, 1, 1,
-0.7662373, 0.2999938, -1.274545, 1, 0, 0, 1, 1,
-0.7659805, 0.200209, -1.77785, 1, 0, 0, 1, 1,
-0.7654949, 2.177344, -1.023161, 1, 0, 0, 1, 1,
-0.761333, -0.6105374, -2.965722, 0, 0, 0, 1, 1,
-0.7606204, -0.9178194, -3.136164, 0, 0, 0, 1, 1,
-0.7605587, 0.2099778, 0.3904589, 0, 0, 0, 1, 1,
-0.7575249, 0.3709121, 0.7781937, 0, 0, 0, 1, 1,
-0.7552813, -0.7911691, -3.714109, 0, 0, 0, 1, 1,
-0.7518516, -1.153695, -1.17399, 0, 0, 0, 1, 1,
-0.7502847, 0.5090597, -1.472786, 0, 0, 0, 1, 1,
-0.7448668, -0.2244947, -1.078581, 1, 1, 1, 1, 1,
-0.7408522, -1.037416, -2.231567, 1, 1, 1, 1, 1,
-0.7385741, -0.5850644, -2.183854, 1, 1, 1, 1, 1,
-0.7385469, -0.6999476, -2.151099, 1, 1, 1, 1, 1,
-0.7380748, -0.6656367, -1.782681, 1, 1, 1, 1, 1,
-0.7230634, 0.01794954, -1.864711, 1, 1, 1, 1, 1,
-0.7218668, -1.900014, -1.53497, 1, 1, 1, 1, 1,
-0.7218409, -0.8010261, -1.950179, 1, 1, 1, 1, 1,
-0.718042, -1.005944, -3.871406, 1, 1, 1, 1, 1,
-0.7133492, 0.03356973, -1.181385, 1, 1, 1, 1, 1,
-0.710363, -2.058073, -2.971323, 1, 1, 1, 1, 1,
-0.7086107, -0.3750829, -1.139654, 1, 1, 1, 1, 1,
-0.7053282, 0.2913413, -0.2167982, 1, 1, 1, 1, 1,
-0.702342, 1.168892, -0.1002994, 1, 1, 1, 1, 1,
-0.6995831, -1.163759, -3.644528, 1, 1, 1, 1, 1,
-0.6934587, -0.5007458, -2.818704, 0, 0, 1, 1, 1,
-0.6901339, 0.3820206, -1.988681, 1, 0, 0, 1, 1,
-0.6842183, 0.3974594, -0.9188132, 1, 0, 0, 1, 1,
-0.6801679, -0.7410756, -2.631173, 1, 0, 0, 1, 1,
-0.677803, -0.4329801, -1.75905, 1, 0, 0, 1, 1,
-0.6776252, 0.5088307, -2.127685, 1, 0, 0, 1, 1,
-0.6737776, -0.3804024, -1.807753, 0, 0, 0, 1, 1,
-0.6661425, 0.2744429, -2.240392, 0, 0, 0, 1, 1,
-0.6634312, -0.5342481, -2.626934, 0, 0, 0, 1, 1,
-0.6621124, -1.010266, -2.905457, 0, 0, 0, 1, 1,
-0.6555802, -0.8036469, -5.102387, 0, 0, 0, 1, 1,
-0.6421555, 1.105911, -0.4260484, 0, 0, 0, 1, 1,
-0.6402736, -0.414766, -2.349853, 0, 0, 0, 1, 1,
-0.6360568, 1.201194, -1.978038, 1, 1, 1, 1, 1,
-0.6358997, 0.254947, -2.088588, 1, 1, 1, 1, 1,
-0.6248333, -0.7594892, -3.397306, 1, 1, 1, 1, 1,
-0.6214078, 1.817534, 0.2117931, 1, 1, 1, 1, 1,
-0.6178085, 0.09116686, -1.216096, 1, 1, 1, 1, 1,
-0.6172262, 0.682864, 0.6960747, 1, 1, 1, 1, 1,
-0.6143576, 1.764843, -1.140409, 1, 1, 1, 1, 1,
-0.6136848, -0.8355185, -4.879276, 1, 1, 1, 1, 1,
-0.6108454, 0.4445142, -0.5050575, 1, 1, 1, 1, 1,
-0.6082684, -0.3378412, -2.099588, 1, 1, 1, 1, 1,
-0.6067862, -0.5523074, -1.351462, 1, 1, 1, 1, 1,
-0.5985546, -0.916705, -2.163879, 1, 1, 1, 1, 1,
-0.59762, 1.060576, -2.182831, 1, 1, 1, 1, 1,
-0.5961609, -1.278785, -2.96481, 1, 1, 1, 1, 1,
-0.5946424, -0.9876644, -3.974363, 1, 1, 1, 1, 1,
-0.5923605, -0.0003708446, -3.669592, 0, 0, 1, 1, 1,
-0.5876793, 0.3179926, -0.3841372, 1, 0, 0, 1, 1,
-0.5823629, -0.3947649, -1.152042, 1, 0, 0, 1, 1,
-0.5822777, 0.3846943, -0.1598866, 1, 0, 0, 1, 1,
-0.5782561, -0.7131664, -2.261566, 1, 0, 0, 1, 1,
-0.5769556, -1.894132, -2.687676, 1, 0, 0, 1, 1,
-0.572297, -0.1247117, -0.9925447, 0, 0, 0, 1, 1,
-0.569593, -0.9332093, -2.027749, 0, 0, 0, 1, 1,
-0.5692984, 0.01923413, -0.6169872, 0, 0, 0, 1, 1,
-0.5668486, -0.3280172, -3.373004, 0, 0, 0, 1, 1,
-0.5660188, -0.5949764, -2.162073, 0, 0, 0, 1, 1,
-0.5626379, 0.4515796, -0.9332683, 0, 0, 0, 1, 1,
-0.5587398, -0.2440455, -2.262754, 0, 0, 0, 1, 1,
-0.5570049, -0.4724149, -1.683758, 1, 1, 1, 1, 1,
-0.5559494, -1.027934, -3.546591, 1, 1, 1, 1, 1,
-0.5551762, -0.3404868, -2.923388, 1, 1, 1, 1, 1,
-0.5545362, -0.8914346, -3.664378, 1, 1, 1, 1, 1,
-0.5479583, -1.096003, -3.019418, 1, 1, 1, 1, 1,
-0.5474019, 2.754473, 0.6701102, 1, 1, 1, 1, 1,
-0.5467818, 0.7546098, -0.6434259, 1, 1, 1, 1, 1,
-0.5414879, 2.068553, -1.613708, 1, 1, 1, 1, 1,
-0.5340788, 1.366577, -0.6827233, 1, 1, 1, 1, 1,
-0.5276995, 0.1899121, -1.880032, 1, 1, 1, 1, 1,
-0.5261275, 0.008332858, -1.356456, 1, 1, 1, 1, 1,
-0.5252283, 0.4587462, -1.126785, 1, 1, 1, 1, 1,
-0.5218676, 0.3246078, -0.04797549, 1, 1, 1, 1, 1,
-0.5208493, -2.268944, -3.999508, 1, 1, 1, 1, 1,
-0.5196367, 1.472275, -0.4971195, 1, 1, 1, 1, 1,
-0.5121604, -1.089257, -3.67228, 0, 0, 1, 1, 1,
-0.5021737, -0.6278446, -4.281587, 1, 0, 0, 1, 1,
-0.5004928, 0.1509174, -1.091325, 1, 0, 0, 1, 1,
-0.5000435, -1.645077, -3.215325, 1, 0, 0, 1, 1,
-0.4993511, 0.5944862, -0.8636963, 1, 0, 0, 1, 1,
-0.4940743, 0.2343182, -2.643548, 1, 0, 0, 1, 1,
-0.4938241, -1.536248, -3.655373, 0, 0, 0, 1, 1,
-0.4933983, 0.04651814, -0.5558144, 0, 0, 0, 1, 1,
-0.4922279, 0.01626753, -1.666824, 0, 0, 0, 1, 1,
-0.4911991, -0.520397, -2.402523, 0, 0, 0, 1, 1,
-0.4837724, 0.5875183, -0.9560078, 0, 0, 0, 1, 1,
-0.4817082, -0.4122804, 0.1482244, 0, 0, 0, 1, 1,
-0.4804047, 0.9700046, -2.193427, 0, 0, 0, 1, 1,
-0.4795608, -1.229416, -4.146841, 1, 1, 1, 1, 1,
-0.4768316, -0.02847232, -1.552812, 1, 1, 1, 1, 1,
-0.4762366, -0.0237917, -1.351694, 1, 1, 1, 1, 1,
-0.4759085, -0.5424329, -2.778658, 1, 1, 1, 1, 1,
-0.4757875, -0.7013725, -3.932107, 1, 1, 1, 1, 1,
-0.4733565, -0.6303341, -2.172523, 1, 1, 1, 1, 1,
-0.4722227, 0.2719188, -1.161201, 1, 1, 1, 1, 1,
-0.4679313, 0.1030585, -1.629483, 1, 1, 1, 1, 1,
-0.4658867, -1.283465, -1.761994, 1, 1, 1, 1, 1,
-0.4655106, 0.6002471, 0.3514852, 1, 1, 1, 1, 1,
-0.4624999, 2.063717, -1.419314, 1, 1, 1, 1, 1,
-0.4598906, -0.6057385, -3.337591, 1, 1, 1, 1, 1,
-0.4555091, 1.553269, -0.3633648, 1, 1, 1, 1, 1,
-0.4490871, -0.7078408, -2.355273, 1, 1, 1, 1, 1,
-0.4466663, 0.1513049, -0.9214404, 1, 1, 1, 1, 1,
-0.4438608, 0.7663686, -1.847686, 0, 0, 1, 1, 1,
-0.4406182, 0.7278099, -1.313988, 1, 0, 0, 1, 1,
-0.4389275, 0.2268649, -1.332249, 1, 0, 0, 1, 1,
-0.438571, -1.875842, -1.575568, 1, 0, 0, 1, 1,
-0.438251, -0.2878865, -3.055634, 1, 0, 0, 1, 1,
-0.4316079, -0.2412211, -1.375489, 1, 0, 0, 1, 1,
-0.4295256, 0.6326973, 1.047605, 0, 0, 0, 1, 1,
-0.4220824, 0.7738505, -0.3159533, 0, 0, 0, 1, 1,
-0.4190163, -1.026734, -3.533153, 0, 0, 0, 1, 1,
-0.418669, 1.080776, -0.1219921, 0, 0, 0, 1, 1,
-0.4180349, -0.1532377, -1.213585, 0, 0, 0, 1, 1,
-0.4165719, 0.3701822, -1.150659, 0, 0, 0, 1, 1,
-0.4163747, 0.9040298, -0.5037611, 0, 0, 0, 1, 1,
-0.4135428, -0.3506293, -1.422538, 1, 1, 1, 1, 1,
-0.4122599, -0.7913902, -2.491244, 1, 1, 1, 1, 1,
-0.4117425, 0.6698, -0.510564, 1, 1, 1, 1, 1,
-0.4096803, -1.191097, -2.216311, 1, 1, 1, 1, 1,
-0.4088076, 1.17201, -1.312281, 1, 1, 1, 1, 1,
-0.402589, -0.2787596, -3.019839, 1, 1, 1, 1, 1,
-0.4013412, -2.576067, -1.542887, 1, 1, 1, 1, 1,
-0.4005441, -1.513471, -2.364267, 1, 1, 1, 1, 1,
-0.3971574, -0.2188287, -1.07394, 1, 1, 1, 1, 1,
-0.3942082, 0.8227974, -1.371104, 1, 1, 1, 1, 1,
-0.3928301, -1.862153, -3.217092, 1, 1, 1, 1, 1,
-0.3887674, 0.898574, -0.9940636, 1, 1, 1, 1, 1,
-0.3876652, 0.2188529, -1.188841, 1, 1, 1, 1, 1,
-0.3805564, -0.9939961, -2.824666, 1, 1, 1, 1, 1,
-0.3702457, -0.7220957, -1.904068, 1, 1, 1, 1, 1,
-0.3675979, 1.402335, 0.347809, 0, 0, 1, 1, 1,
-0.367431, 1.047849, 0.1061378, 1, 0, 0, 1, 1,
-0.3670429, 0.3056418, -0.395295, 1, 0, 0, 1, 1,
-0.3640953, 0.08403685, -2.591088, 1, 0, 0, 1, 1,
-0.3586657, 0.7147761, -1.400045, 1, 0, 0, 1, 1,
-0.3571755, -1.670492, -1.774414, 1, 0, 0, 1, 1,
-0.3503007, -0.7280285, -2.50171, 0, 0, 0, 1, 1,
-0.3465436, 0.248336, -2.36497, 0, 0, 0, 1, 1,
-0.3439019, 0.459422, 0.9472243, 0, 0, 0, 1, 1,
-0.343308, -0.02806188, -3.073592, 0, 0, 0, 1, 1,
-0.3412417, 1.051182, 0.6253152, 0, 0, 0, 1, 1,
-0.3393639, 0.8728926, 0.8448467, 0, 0, 0, 1, 1,
-0.3391432, 0.2300288, 0.6838296, 0, 0, 0, 1, 1,
-0.3385079, -2.208188, -3.06866, 1, 1, 1, 1, 1,
-0.3372833, -0.1164962, -1.509892, 1, 1, 1, 1, 1,
-0.3357036, 0.2215511, -2.869706, 1, 1, 1, 1, 1,
-0.3353563, -0.799135, -2.196965, 1, 1, 1, 1, 1,
-0.3347286, 0.09844843, -2.740447, 1, 1, 1, 1, 1,
-0.3325841, 1.053177, -0.2498749, 1, 1, 1, 1, 1,
-0.3317992, 0.4896829, 0.1489961, 1, 1, 1, 1, 1,
-0.3187923, -0.04415355, -1.834379, 1, 1, 1, 1, 1,
-0.3184991, 0.01193298, -2.240515, 1, 1, 1, 1, 1,
-0.3156298, 1.001256, -1.487277, 1, 1, 1, 1, 1,
-0.3149259, 1.290811, -0.428629, 1, 1, 1, 1, 1,
-0.3126309, 0.1307983, 0.1561849, 1, 1, 1, 1, 1,
-0.3120871, -1.375427, -2.491837, 1, 1, 1, 1, 1,
-0.3120309, -0.3597153, -2.891534, 1, 1, 1, 1, 1,
-0.3063196, -0.7212344, -2.933621, 1, 1, 1, 1, 1,
-0.3047144, -0.5787632, -1.529202, 0, 0, 1, 1, 1,
-0.2910345, -2.195576, -3.641663, 1, 0, 0, 1, 1,
-0.2896168, -0.4080636, -3.48138, 1, 0, 0, 1, 1,
-0.2895226, 0.7589574, -1.130995, 1, 0, 0, 1, 1,
-0.2889347, -0.5923275, -3.095147, 1, 0, 0, 1, 1,
-0.2836445, 0.006919712, -2.409413, 1, 0, 0, 1, 1,
-0.2808045, 0.8824248, -2.098579, 0, 0, 0, 1, 1,
-0.2791336, 0.5475699, -0.4721139, 0, 0, 0, 1, 1,
-0.2752249, 0.3296903, -0.297434, 0, 0, 0, 1, 1,
-0.2736143, 0.3982562, 0.1928535, 0, 0, 0, 1, 1,
-0.2735473, 0.2138773, -1.862641, 0, 0, 0, 1, 1,
-0.2735159, 0.8049564, -0.4420668, 0, 0, 0, 1, 1,
-0.273209, -0.7165231, -3.337893, 0, 0, 0, 1, 1,
-0.2719748, 1.892817, 0.2271856, 1, 1, 1, 1, 1,
-0.2700671, -1.856946, -3.857286, 1, 1, 1, 1, 1,
-0.2693343, 0.7403398, -1.48788, 1, 1, 1, 1, 1,
-0.2687272, -0.7315882, -3.991274, 1, 1, 1, 1, 1,
-0.2663135, 0.9777659, 0.4735884, 1, 1, 1, 1, 1,
-0.265744, -0.2661174, -1.80644, 1, 1, 1, 1, 1,
-0.2617139, 0.2063779, -0.07157703, 1, 1, 1, 1, 1,
-0.2611942, 1.492369, -0.05404212, 1, 1, 1, 1, 1,
-0.2544099, 0.1791768, -0.8132498, 1, 1, 1, 1, 1,
-0.2529282, -0.5099683, -2.812402, 1, 1, 1, 1, 1,
-0.2474349, 0.7643839, 0.3214733, 1, 1, 1, 1, 1,
-0.2459524, 0.06912392, -1.360117, 1, 1, 1, 1, 1,
-0.2418944, 0.3760963, -0.3187933, 1, 1, 1, 1, 1,
-0.2411214, 0.9721119, -0.8822916, 1, 1, 1, 1, 1,
-0.2385244, 0.3874433, 1.520282, 1, 1, 1, 1, 1,
-0.2379175, 1.069828, 0.4563192, 0, 0, 1, 1, 1,
-0.2350125, 1.014628, 0.4645357, 1, 0, 0, 1, 1,
-0.2338258, 0.5599093, 1.238536, 1, 0, 0, 1, 1,
-0.2333235, 0.1929799, -1.055414, 1, 0, 0, 1, 1,
-0.226375, 0.5942957, -0.01394025, 1, 0, 0, 1, 1,
-0.219229, 0.4239035, -0.5818412, 1, 0, 0, 1, 1,
-0.2110749, 2.633274, 1.271516, 0, 0, 0, 1, 1,
-0.2098174, -0.8701478, -2.992018, 0, 0, 0, 1, 1,
-0.2097311, -0.5709783, -2.984876, 0, 0, 0, 1, 1,
-0.2048543, -0.4473839, -3.446514, 0, 0, 0, 1, 1,
-0.2035387, 0.50275, -0.4104225, 0, 0, 0, 1, 1,
-0.2027858, -1.06278, -1.310332, 0, 0, 0, 1, 1,
-0.2017156, 0.2435369, -0.958649, 0, 0, 0, 1, 1,
-0.2015737, -0.9744174, -3.682097, 1, 1, 1, 1, 1,
-0.1952458, -1.004976, -3.564253, 1, 1, 1, 1, 1,
-0.1948243, 0.1622285, 0.2492576, 1, 1, 1, 1, 1,
-0.1937035, 1.19146, 0.2932266, 1, 1, 1, 1, 1,
-0.190595, -0.3951104, -2.759552, 1, 1, 1, 1, 1,
-0.1773147, 0.3777983, 0.216644, 1, 1, 1, 1, 1,
-0.1726024, 1.378142, 0.5281063, 1, 1, 1, 1, 1,
-0.1721912, -0.2696147, -3.209216, 1, 1, 1, 1, 1,
-0.1639473, 0.6650569, -1.451411, 1, 1, 1, 1, 1,
-0.1632158, 2.30859, 1.380261, 1, 1, 1, 1, 1,
-0.1582319, 2.127702, 0.4504118, 1, 1, 1, 1, 1,
-0.156976, -0.1615817, -2.839089, 1, 1, 1, 1, 1,
-0.1569251, -0.8772725, -3.508134, 1, 1, 1, 1, 1,
-0.1560596, 0.39248, 0.2951353, 1, 1, 1, 1, 1,
-0.155737, 1.489598, 0.2678977, 1, 1, 1, 1, 1,
-0.1504295, -0.08587953, -1.627329, 0, 0, 1, 1, 1,
-0.1475602, -0.7294563, -1.506715, 1, 0, 0, 1, 1,
-0.1474273, 0.3445009, -0.1404201, 1, 0, 0, 1, 1,
-0.144418, -0.4247305, -4.310706, 1, 0, 0, 1, 1,
-0.1439364, -0.8171216, -2.050071, 1, 0, 0, 1, 1,
-0.1429465, 0.3815113, 0.09750789, 1, 0, 0, 1, 1,
-0.1382663, 0.0424769, -1.128837, 0, 0, 0, 1, 1,
-0.1350616, 0.640299, 1.042796, 0, 0, 0, 1, 1,
-0.1344635, -0.03573419, -2.411913, 0, 0, 0, 1, 1,
-0.1344261, 0.8479687, -0.9914923, 0, 0, 0, 1, 1,
-0.1321391, -0.242119, -4.04683, 0, 0, 0, 1, 1,
-0.1272219, -0.9206153, -3.675888, 0, 0, 0, 1, 1,
-0.1208947, 0.4867816, 0.6405212, 0, 0, 0, 1, 1,
-0.1196897, 0.263399, 0.6372202, 1, 1, 1, 1, 1,
-0.1150779, -2.340467, -3.741663, 1, 1, 1, 1, 1,
-0.1139263, 2.197123, -0.2327695, 1, 1, 1, 1, 1,
-0.1138355, -0.1100282, -2.223907, 1, 1, 1, 1, 1,
-0.1124507, -0.9702793, -3.505146, 1, 1, 1, 1, 1,
-0.1122175, -0.8684931, -2.396033, 1, 1, 1, 1, 1,
-0.1101771, 2.272595, 0.4821602, 1, 1, 1, 1, 1,
-0.1096234, -0.7055435, -2.295651, 1, 1, 1, 1, 1,
-0.1095737, 0.1252646, 0.8417435, 1, 1, 1, 1, 1,
-0.1086732, 0.06911282, -2.43287, 1, 1, 1, 1, 1,
-0.1083572, 1.677685, -0.187739, 1, 1, 1, 1, 1,
-0.1073768, -1.185939, -2.114772, 1, 1, 1, 1, 1,
-0.1022559, 0.4832759, -0.3301474, 1, 1, 1, 1, 1,
-0.1002395, -0.3382599, -4.544654, 1, 1, 1, 1, 1,
-0.09948269, 1.443645, -1.03099, 1, 1, 1, 1, 1,
-0.09946844, -0.07289184, -2.561788, 0, 0, 1, 1, 1,
-0.09678549, 1.660425, -1.934662, 1, 0, 0, 1, 1,
-0.08984337, 1.394127, 1.164814, 1, 0, 0, 1, 1,
-0.08976409, 0.2614155, 1.015742, 1, 0, 0, 1, 1,
-0.08804633, 0.4018555, 0.6709222, 1, 0, 0, 1, 1,
-0.08270472, -0.1374741, -1.259106, 1, 0, 0, 1, 1,
-0.08119836, -0.4037919, -2.233265, 0, 0, 0, 1, 1,
-0.08067303, 1.173813, 0.6014118, 0, 0, 0, 1, 1,
-0.07681728, -0.2928013, -3.891538, 0, 0, 0, 1, 1,
-0.06932069, 2.078374, 0.879869, 0, 0, 0, 1, 1,
-0.06813489, -0.7463178, -2.148893, 0, 0, 0, 1, 1,
-0.06100341, -0.06139662, -3.436074, 0, 0, 0, 1, 1,
-0.05951734, -1.31416, -3.511572, 0, 0, 0, 1, 1,
-0.05752246, 0.8789951, -0.3228863, 1, 1, 1, 1, 1,
-0.0560456, 0.2383695, 1.419034, 1, 1, 1, 1, 1,
-0.05498123, 0.4810755, -0.5269872, 1, 1, 1, 1, 1,
-0.05111974, -0.3520885, -5.162457, 1, 1, 1, 1, 1,
-0.04328888, 0.5187042, -0.8959404, 1, 1, 1, 1, 1,
-0.04317716, -1.120618, -2.185157, 1, 1, 1, 1, 1,
-0.04293882, 0.8633943, 0.4070866, 1, 1, 1, 1, 1,
-0.04242683, 1.946458, 0.2673744, 1, 1, 1, 1, 1,
-0.04199529, -1.83816, -3.902936, 1, 1, 1, 1, 1,
-0.04053008, -0.524128, -5.296625, 1, 1, 1, 1, 1,
-0.03394196, 1.280145, -0.2665489, 1, 1, 1, 1, 1,
-0.03257108, 1.321812, -1.580535, 1, 1, 1, 1, 1,
-0.02927193, 0.6571925, 0.4769668, 1, 1, 1, 1, 1,
-0.02550462, 0.3808358, 0.5220983, 1, 1, 1, 1, 1,
-0.02544416, 1.819756, 0.01284666, 1, 1, 1, 1, 1,
-0.02285357, 1.978021, -0.2894534, 0, 0, 1, 1, 1,
-0.02202097, -0.4034776, -4.370133, 1, 0, 0, 1, 1,
-0.02094623, -1.557564, -2.754096, 1, 0, 0, 1, 1,
-0.01850072, -1.247221, -1.462327, 1, 0, 0, 1, 1,
-0.01834589, -1.996819, -3.777185, 1, 0, 0, 1, 1,
-0.0168589, -0.4187309, -4.177021, 1, 0, 0, 1, 1,
-0.01470645, -0.0535002, -2.486286, 0, 0, 0, 1, 1,
-0.01201006, -1.211606, -3.285467, 0, 0, 0, 1, 1,
-0.005022492, 0.3904804, 0.8738629, 0, 0, 0, 1, 1,
-0.0005106717, -0.3026922, -3.723607, 0, 0, 0, 1, 1,
-2.184886e-05, 0.3662127, 0.2713079, 0, 0, 0, 1, 1,
0.003817916, 1.245893, 0.3067086, 0, 0, 0, 1, 1,
0.009805285, 0.9167498, 0.196191, 0, 0, 0, 1, 1,
0.01730955, -0.2063161, 4.007266, 1, 1, 1, 1, 1,
0.01788635, 0.9394168, 2.526491, 1, 1, 1, 1, 1,
0.01853129, 1.026392, 1.027481, 1, 1, 1, 1, 1,
0.02623208, -0.0352764, 0.9586521, 1, 1, 1, 1, 1,
0.02756252, -0.3739876, 3.534506, 1, 1, 1, 1, 1,
0.02796147, -0.4190513, 3.657168, 1, 1, 1, 1, 1,
0.0292565, -0.982605, 3.499665, 1, 1, 1, 1, 1,
0.02990519, 1.059286, -1.10953, 1, 1, 1, 1, 1,
0.03119326, -1.623486, 2.343918, 1, 1, 1, 1, 1,
0.03159365, -0.07234643, 3.020599, 1, 1, 1, 1, 1,
0.0412257, -0.05002102, 2.579256, 1, 1, 1, 1, 1,
0.04140739, 0.1114378, 1.173721, 1, 1, 1, 1, 1,
0.04639682, -0.1874352, 3.204653, 1, 1, 1, 1, 1,
0.0470336, 0.4909897, -0.2586522, 1, 1, 1, 1, 1,
0.05562032, -0.7449054, 2.466504, 1, 1, 1, 1, 1,
0.05871616, 0.6070764, 1.139787, 0, 0, 1, 1, 1,
0.05930571, 2.27697, -0.1589276, 1, 0, 0, 1, 1,
0.06522305, -0.3426775, 3.118817, 1, 0, 0, 1, 1,
0.06662943, -2.06907, 4.346584, 1, 0, 0, 1, 1,
0.06745524, 0.5110891, 0.826993, 1, 0, 0, 1, 1,
0.06843033, 1.390567, -0.7012543, 1, 0, 0, 1, 1,
0.0779293, -0.1906417, 3.006886, 0, 0, 0, 1, 1,
0.07820778, 0.8282881, -1.34956, 0, 0, 0, 1, 1,
0.07901485, -0.7866743, 3.322383, 0, 0, 0, 1, 1,
0.07955633, -0.1104104, 1.92221, 0, 0, 0, 1, 1,
0.07959791, 0.1810312, -0.6030428, 0, 0, 0, 1, 1,
0.083307, -2.027282, 4.609527, 0, 0, 0, 1, 1,
0.08673114, -0.7250179, 2.468186, 0, 0, 0, 1, 1,
0.09434162, -0.5087097, 4.573073, 1, 1, 1, 1, 1,
0.09445222, -0.4410117, 1.942748, 1, 1, 1, 1, 1,
0.09641589, 1.179311, -0.136866, 1, 1, 1, 1, 1,
0.09978318, -0.3214747, 3.217917, 1, 1, 1, 1, 1,
0.1036707, 0.4730314, -0.04298817, 1, 1, 1, 1, 1,
0.1047693, 0.3444423, -0.06284963, 1, 1, 1, 1, 1,
0.1049115, -0.7057135, 1.97827, 1, 1, 1, 1, 1,
0.1057591, -0.5033064, 2.843538, 1, 1, 1, 1, 1,
0.1071391, -0.8191518, 3.590305, 1, 1, 1, 1, 1,
0.1073964, 0.5308844, 0.5065594, 1, 1, 1, 1, 1,
0.1108246, -1.229584, 1.947182, 1, 1, 1, 1, 1,
0.1134724, 0.07738002, 1.317758, 1, 1, 1, 1, 1,
0.11482, -0.4568287, 2.823576, 1, 1, 1, 1, 1,
0.1180987, -1.115369, 2.929859, 1, 1, 1, 1, 1,
0.1184469, 0.1149757, 1.233696, 1, 1, 1, 1, 1,
0.1186098, -0.7496022, 4.093612, 0, 0, 1, 1, 1,
0.1190635, 0.5780664, 0.1813662, 1, 0, 0, 1, 1,
0.1236396, -0.8257219, 3.11917, 1, 0, 0, 1, 1,
0.1263379, 0.232924, 1.262905, 1, 0, 0, 1, 1,
0.1307032, -0.08862604, 3.643034, 1, 0, 0, 1, 1,
0.1341781, -2.434106, 2.752903, 1, 0, 0, 1, 1,
0.1381132, -1.278606, 4.011185, 0, 0, 0, 1, 1,
0.1382531, -2.142282, 2.373262, 0, 0, 0, 1, 1,
0.1418283, -1.600386, 2.482367, 0, 0, 0, 1, 1,
0.1435892, -0.2686455, 2.215504, 0, 0, 0, 1, 1,
0.1453713, 1.444282, -0.5057759, 0, 0, 0, 1, 1,
0.1475937, -0.4425057, 2.681947, 0, 0, 0, 1, 1,
0.1515009, -1.092145, 1.910013, 0, 0, 0, 1, 1,
0.1523868, -0.6982712, 1.839813, 1, 1, 1, 1, 1,
0.1547645, -0.7118591, 2.007621, 1, 1, 1, 1, 1,
0.1581054, 1.362931, -1.166373, 1, 1, 1, 1, 1,
0.1581865, -1.343634, 2.441739, 1, 1, 1, 1, 1,
0.163683, 1.509952, -1.197507, 1, 1, 1, 1, 1,
0.1680135, 0.2586914, 1.202129, 1, 1, 1, 1, 1,
0.1686683, 0.08618581, -1.499363, 1, 1, 1, 1, 1,
0.1701264, 0.5943437, -0.00921216, 1, 1, 1, 1, 1,
0.1704877, 2.402229, 2.126156, 1, 1, 1, 1, 1,
0.1710845, 0.3818042, 1.483289, 1, 1, 1, 1, 1,
0.1715479, -1.02157, 3.094626, 1, 1, 1, 1, 1,
0.1755899, -0.5425187, 3.661977, 1, 1, 1, 1, 1,
0.1775021, 2.070129, 0.4314499, 1, 1, 1, 1, 1,
0.1846399, 1.625235, -0.1904507, 1, 1, 1, 1, 1,
0.187411, 1.023249, -0.1052921, 1, 1, 1, 1, 1,
0.1897948, 0.308111, 2.254313, 0, 0, 1, 1, 1,
0.1942552, -0.2049291, 2.256932, 1, 0, 0, 1, 1,
0.1967751, 0.2092487, 1.162188, 1, 0, 0, 1, 1,
0.2001345, -1.219194, 2.458064, 1, 0, 0, 1, 1,
0.2034632, -1.037757, 2.604949, 1, 0, 0, 1, 1,
0.2102984, 0.3613223, 0.2754235, 1, 0, 0, 1, 1,
0.2260132, 1.050415, -0.2904175, 0, 0, 0, 1, 1,
0.2340753, -2.102955, 3.199175, 0, 0, 0, 1, 1,
0.2392012, 0.1071749, -0.4216465, 0, 0, 0, 1, 1,
0.2418554, -1.066926, 3.585786, 0, 0, 0, 1, 1,
0.2421845, -0.5493699, 2.411749, 0, 0, 0, 1, 1,
0.2443372, -1.260794, 3.281248, 0, 0, 0, 1, 1,
0.2474761, 0.07038467, 0.140582, 0, 0, 0, 1, 1,
0.2486434, 0.7675898, -0.8864303, 1, 1, 1, 1, 1,
0.2509431, 1.494959, 0.6237512, 1, 1, 1, 1, 1,
0.2525006, 1.904796, -0.7723767, 1, 1, 1, 1, 1,
0.253914, 0.1427525, 1.84471, 1, 1, 1, 1, 1,
0.2555091, -0.3891437, 3.038391, 1, 1, 1, 1, 1,
0.2582672, 0.06363605, 2.123135, 1, 1, 1, 1, 1,
0.2583095, -2.073636, 3.920133, 1, 1, 1, 1, 1,
0.2599589, 0.004262731, 1.487004, 1, 1, 1, 1, 1,
0.2647958, -1.141065, 2.725387, 1, 1, 1, 1, 1,
0.2662233, 0.7575589, -0.1671266, 1, 1, 1, 1, 1,
0.2668516, -1.674205, 2.097672, 1, 1, 1, 1, 1,
0.2733102, -0.3484013, 1.179541, 1, 1, 1, 1, 1,
0.2734473, 0.2299462, 0.00914847, 1, 1, 1, 1, 1,
0.2794207, 0.1073538, 0.7442849, 1, 1, 1, 1, 1,
0.280225, -0.2072855, 2.167582, 1, 1, 1, 1, 1,
0.2807538, -1.347555, 4.307209, 0, 0, 1, 1, 1,
0.2810312, -0.6354423, 2.556505, 1, 0, 0, 1, 1,
0.2856394, 1.618013, -2.94173, 1, 0, 0, 1, 1,
0.2909907, -0.3221379, -0.1904002, 1, 0, 0, 1, 1,
0.2952647, 0.6611636, 0.7789806, 1, 0, 0, 1, 1,
0.2972716, -0.6550821, 2.507977, 1, 0, 0, 1, 1,
0.3045597, -0.2607998, 2.590549, 0, 0, 0, 1, 1,
0.3052359, 1.230407, -0.8122733, 0, 0, 0, 1, 1,
0.3067744, 0.6994573, 0.3550542, 0, 0, 0, 1, 1,
0.3091345, 0.8391767, 0.3654338, 0, 0, 0, 1, 1,
0.3113464, 0.1379249, 2.793205, 0, 0, 0, 1, 1,
0.3122509, -2.532866, 1.865899, 0, 0, 0, 1, 1,
0.3146318, 0.579614, 0.8320035, 0, 0, 0, 1, 1,
0.3147196, -1.50933, 2.755454, 1, 1, 1, 1, 1,
0.3176295, -1.586416, 4.684516, 1, 1, 1, 1, 1,
0.318618, -0.9809811, 3.435551, 1, 1, 1, 1, 1,
0.3186502, -0.4499332, 2.535353, 1, 1, 1, 1, 1,
0.3204961, 1.253508, -1.100704, 1, 1, 1, 1, 1,
0.320829, 1.148625, -0.889838, 1, 1, 1, 1, 1,
0.3247236, 0.6760536, 0.6932687, 1, 1, 1, 1, 1,
0.324786, -0.8450359, 2.128177, 1, 1, 1, 1, 1,
0.3267679, 0.3842716, -0.582076, 1, 1, 1, 1, 1,
0.3286996, -1.60459, 2.33995, 1, 1, 1, 1, 1,
0.3316506, -0.4507692, 2.525191, 1, 1, 1, 1, 1,
0.3340476, 0.06264433, 0.8928509, 1, 1, 1, 1, 1,
0.3358294, -0.1507912, 0.7573013, 1, 1, 1, 1, 1,
0.3361552, -0.2590014, 3.421795, 1, 1, 1, 1, 1,
0.336492, 0.5861223, 1.512215, 1, 1, 1, 1, 1,
0.3377415, -0.2135915, 2.250036, 0, 0, 1, 1, 1,
0.3402717, -1.101468, 3.741954, 1, 0, 0, 1, 1,
0.3502155, -0.5343796, 1.580737, 1, 0, 0, 1, 1,
0.3554554, -1.373209, 2.730056, 1, 0, 0, 1, 1,
0.3596748, 1.218903, -0.7177451, 1, 0, 0, 1, 1,
0.3600881, -0.3565535, 2.737468, 1, 0, 0, 1, 1,
0.3647547, -0.2305862, 3.930212, 0, 0, 0, 1, 1,
0.3648407, -2.156443, 4.854611, 0, 0, 0, 1, 1,
0.3686407, 0.9647434, -0.06813628, 0, 0, 0, 1, 1,
0.3687901, -2.689991, 1.721705, 0, 0, 0, 1, 1,
0.374491, -0.3800516, 1.618733, 0, 0, 0, 1, 1,
0.3754967, 0.6318189, 0.04673503, 0, 0, 0, 1, 1,
0.3783866, -0.4199342, 1.728006, 0, 0, 0, 1, 1,
0.3796028, 0.9355782, -0.2573625, 1, 1, 1, 1, 1,
0.3811806, -0.5431688, 5.411194, 1, 1, 1, 1, 1,
0.3874682, -0.2329521, 1.496053, 1, 1, 1, 1, 1,
0.3894758, 0.5624112, 3.015871, 1, 1, 1, 1, 1,
0.3906827, 1.598429, -0.09385005, 1, 1, 1, 1, 1,
0.392148, -1.753909, 2.503423, 1, 1, 1, 1, 1,
0.3931009, 1.327827, -1.21525, 1, 1, 1, 1, 1,
0.3976174, 0.2483317, 0.60273, 1, 1, 1, 1, 1,
0.3990066, -0.8126984, 4.837121, 1, 1, 1, 1, 1,
0.3996927, -0.110927, 0.5415749, 1, 1, 1, 1, 1,
0.4012189, -1.002703, 2.530094, 1, 1, 1, 1, 1,
0.4046682, -2.280653, 3.670238, 1, 1, 1, 1, 1,
0.4100928, -0.685233, 2.373141, 1, 1, 1, 1, 1,
0.4112571, -2.191087, 5.185208, 1, 1, 1, 1, 1,
0.4116249, 1.051476, -1.342433, 1, 1, 1, 1, 1,
0.4131919, 0.04621628, 4.255058, 0, 0, 1, 1, 1,
0.4143549, 1.227318, 0.9324307, 1, 0, 0, 1, 1,
0.4182685, 0.3864284, 0.02529423, 1, 0, 0, 1, 1,
0.4198909, -0.6366478, 1.65558, 1, 0, 0, 1, 1,
0.423272, 1.39344, 0.5572121, 1, 0, 0, 1, 1,
0.4268449, 0.89278, 1.221833, 1, 0, 0, 1, 1,
0.4279004, 0.98605, -0.1153812, 0, 0, 0, 1, 1,
0.4287687, 0.8872113, -0.1515406, 0, 0, 0, 1, 1,
0.4290039, 1.257268, -0.6657849, 0, 0, 0, 1, 1,
0.4323698, -0.2419548, 1.062184, 0, 0, 0, 1, 1,
0.4343451, -0.2188738, 1.38902, 0, 0, 0, 1, 1,
0.4357008, 0.785266, -0.2043756, 0, 0, 0, 1, 1,
0.4375475, -0.1366267, 2.05366, 0, 0, 0, 1, 1,
0.4390218, 0.3724825, 0.2886669, 1, 1, 1, 1, 1,
0.4392781, 0.5343052, 0.5311902, 1, 1, 1, 1, 1,
0.440355, 0.4634198, 2.926329, 1, 1, 1, 1, 1,
0.4415855, 1.166157, 1.734292, 1, 1, 1, 1, 1,
0.455342, 1.268845, 0.009418312, 1, 1, 1, 1, 1,
0.4566998, -1.041336, 3.954806, 1, 1, 1, 1, 1,
0.4584388, 0.6405806, 0.8342492, 1, 1, 1, 1, 1,
0.4598564, -0.8915577, 2.189672, 1, 1, 1, 1, 1,
0.4608591, -1.276185, 2.992848, 1, 1, 1, 1, 1,
0.4615274, 1.589258, 0.4503767, 1, 1, 1, 1, 1,
0.4630735, 0.5628199, -0.8183594, 1, 1, 1, 1, 1,
0.4654061, -1.218287, 2.960829, 1, 1, 1, 1, 1,
0.4697468, -0.1657043, 4.7848, 1, 1, 1, 1, 1,
0.4703346, 0.6660728, -0.774106, 1, 1, 1, 1, 1,
0.4714865, -0.9064957, 2.467935, 1, 1, 1, 1, 1,
0.4721628, 2.835849, 0.8120319, 0, 0, 1, 1, 1,
0.4721881, -0.1005093, 1.779692, 1, 0, 0, 1, 1,
0.4772293, 0.2296776, 2.244532, 1, 0, 0, 1, 1,
0.4789245, 0.7246621, 1.064249, 1, 0, 0, 1, 1,
0.4789498, 0.2938734, 0.4812772, 1, 0, 0, 1, 1,
0.480376, 1.793253, -0.2503331, 1, 0, 0, 1, 1,
0.4817289, 0.07084323, 2.581282, 0, 0, 0, 1, 1,
0.4858144, -1.393926, 4.137272, 0, 0, 0, 1, 1,
0.4868648, 0.9124811, 1.81453, 0, 0, 0, 1, 1,
0.4899731, 0.9882556, 0.1404095, 0, 0, 0, 1, 1,
0.4903167, -0.4756076, 1.390664, 0, 0, 0, 1, 1,
0.4936077, 1.050971, 1.021958, 0, 0, 0, 1, 1,
0.4960318, 0.388015, 3.397642, 0, 0, 0, 1, 1,
0.4977863, 0.4292179, 1.408332, 1, 1, 1, 1, 1,
0.4992975, -0.907127, 2.634779, 1, 1, 1, 1, 1,
0.4993123, -0.5646857, 1.387515, 1, 1, 1, 1, 1,
0.5031592, 1.858131, 0.865797, 1, 1, 1, 1, 1,
0.5035266, 0.4722227, -1.406464, 1, 1, 1, 1, 1,
0.5053759, 1.131903, 0.3042561, 1, 1, 1, 1, 1,
0.5065182, 1.192993, 1.54642, 1, 1, 1, 1, 1,
0.5098129, 1.211657, -0.3655527, 1, 1, 1, 1, 1,
0.5105502, 0.4229268, -0.8395793, 1, 1, 1, 1, 1,
0.5152585, 0.7317259, 2.410758, 1, 1, 1, 1, 1,
0.5175297, -1.339161, 2.641111, 1, 1, 1, 1, 1,
0.5176417, 0.6841224, 1.577608, 1, 1, 1, 1, 1,
0.5281434, -1.363419, 2.510413, 1, 1, 1, 1, 1,
0.5410091, 0.5939716, -0.2191732, 1, 1, 1, 1, 1,
0.5509825, -0.7894128, 3.092083, 1, 1, 1, 1, 1,
0.55796, 1.475205, 0.1543318, 0, 0, 1, 1, 1,
0.5583186, -1.999496, 3.40047, 1, 0, 0, 1, 1,
0.5603077, -0.09269141, 2.664424, 1, 0, 0, 1, 1,
0.5656105, 0.1358233, 2.565461, 1, 0, 0, 1, 1,
0.5663353, -0.4771583, 2.210944, 1, 0, 0, 1, 1,
0.5674001, -0.35869, 1.975141, 1, 0, 0, 1, 1,
0.5683367, -0.0009100154, 0.808945, 0, 0, 0, 1, 1,
0.5755824, -1.292192, 1.222386, 0, 0, 0, 1, 1,
0.578248, 1.581322, 1.255665, 0, 0, 0, 1, 1,
0.5847291, 0.0881964, 2.059084, 0, 0, 0, 1, 1,
0.5942259, 0.3414847, 0.3641762, 0, 0, 0, 1, 1,
0.5992708, -1.518639, 2.01594, 0, 0, 0, 1, 1,
0.6083741, 0.3011185, 0.9969057, 0, 0, 0, 1, 1,
0.6089085, 0.9859689, 0.5359139, 1, 1, 1, 1, 1,
0.6120133, 0.1654071, 0.6506501, 1, 1, 1, 1, 1,
0.6146848, 1.35642, 0.8702829, 1, 1, 1, 1, 1,
0.6152134, -0.1440614, 1.243496, 1, 1, 1, 1, 1,
0.6165972, 0.1625403, 1.052077, 1, 1, 1, 1, 1,
0.6177954, -0.1307623, 2.169765, 1, 1, 1, 1, 1,
0.6224308, -0.5294442, 3.18422, 1, 1, 1, 1, 1,
0.6245768, -0.8218471, 3.260004, 1, 1, 1, 1, 1,
0.6274349, -1.389214, 5.026647, 1, 1, 1, 1, 1,
0.6276642, 1.843308, -0.04731485, 1, 1, 1, 1, 1,
0.6317261, -0.7369392, 1.698033, 1, 1, 1, 1, 1,
0.6333252, 0.7202649, 0.305236, 1, 1, 1, 1, 1,
0.6455885, -0.6597555, 2.988753, 1, 1, 1, 1, 1,
0.6483027, 1.357564, -1.102032, 1, 1, 1, 1, 1,
0.6486774, 0.8510864, 0.3787546, 1, 1, 1, 1, 1,
0.652401, -0.801973, 3.306693, 0, 0, 1, 1, 1,
0.6528937, -0.07909509, 0.9837577, 1, 0, 0, 1, 1,
0.6589775, -1.319721, 2.883886, 1, 0, 0, 1, 1,
0.6605763, -0.07583419, 2.76974, 1, 0, 0, 1, 1,
0.6616645, 1.262107, 1.74245, 1, 0, 0, 1, 1,
0.6663135, 0.3966846, 1.601553, 1, 0, 0, 1, 1,
0.67173, 1.185029, -1.372835, 0, 0, 0, 1, 1,
0.6829934, -0.2456161, 2.03135, 0, 0, 0, 1, 1,
0.6862682, 0.4272629, 0.6165069, 0, 0, 0, 1, 1,
0.6893577, -0.5761006, 3.265636, 0, 0, 0, 1, 1,
0.6974398, 0.4604601, 2.650666, 0, 0, 0, 1, 1,
0.7010998, -1.212608, 3.18454, 0, 0, 0, 1, 1,
0.7017391, -0.4876267, 0.319737, 0, 0, 0, 1, 1,
0.7035017, -0.3165342, 2.84142, 1, 1, 1, 1, 1,
0.70362, -0.3913085, 2.42427, 1, 1, 1, 1, 1,
0.706849, 0.1824652, 0.3113751, 1, 1, 1, 1, 1,
0.7112834, -1.239688, 3.703339, 1, 1, 1, 1, 1,
0.7127974, -0.6771637, 3.397758, 1, 1, 1, 1, 1,
0.7165626, 1.663726, 1.159684, 1, 1, 1, 1, 1,
0.7191558, 1.431711, 0.5153731, 1, 1, 1, 1, 1,
0.7192593, 0.7327968, 0.5686898, 1, 1, 1, 1, 1,
0.7268134, 0.6927865, -0.6965638, 1, 1, 1, 1, 1,
0.7269582, 0.6015952, 1.270104, 1, 1, 1, 1, 1,
0.727016, 2.178043, -0.4257306, 1, 1, 1, 1, 1,
0.72735, -0.7852948, 2.400491, 1, 1, 1, 1, 1,
0.7282303, -0.3723221, 1.197651, 1, 1, 1, 1, 1,
0.7282738, -1.326931, 1.861286, 1, 1, 1, 1, 1,
0.7376922, -0.1162821, 0.006697095, 1, 1, 1, 1, 1,
0.739542, -0.9159615, 2.241144, 0, 0, 1, 1, 1,
0.7417957, 0.7824815, 2.004153, 1, 0, 0, 1, 1,
0.7449033, 0.3440329, 1.746389, 1, 0, 0, 1, 1,
0.7495319, 1.553557, -0.1336601, 1, 0, 0, 1, 1,
0.7560835, -1.876315, 1.165776, 1, 0, 0, 1, 1,
0.7625999, -0.4846673, 3.469794, 1, 0, 0, 1, 1,
0.763372, -0.3021584, 0.6760013, 0, 0, 0, 1, 1,
0.7655737, 0.6814263, 1.928566, 0, 0, 0, 1, 1,
0.7658668, 1.914545, -0.1012965, 0, 0, 0, 1, 1,
0.7706683, 0.01454651, 0.2281993, 0, 0, 0, 1, 1,
0.7722247, 0.728802, 2.763082, 0, 0, 0, 1, 1,
0.7770293, -1.000945, 3.293494, 0, 0, 0, 1, 1,
0.7773921, -0.9306284, 3.943216, 0, 0, 0, 1, 1,
0.7828113, -1.308156, 2.505908, 1, 1, 1, 1, 1,
0.7893447, 0.9245352, 0.8365238, 1, 1, 1, 1, 1,
0.7921712, 1.783624, 0.3274948, 1, 1, 1, 1, 1,
0.7924159, -0.4710125, 4.140241, 1, 1, 1, 1, 1,
0.7993581, 0.2111381, 1.552874, 1, 1, 1, 1, 1,
0.8102199, 1.267195, 0.3389708, 1, 1, 1, 1, 1,
0.8120062, -0.3173787, 1.142329, 1, 1, 1, 1, 1,
0.8130239, 0.471835, 2.747232, 1, 1, 1, 1, 1,
0.8131709, -0.6605889, 2.544789, 1, 1, 1, 1, 1,
0.8137935, -2.086324, 2.715102, 1, 1, 1, 1, 1,
0.8150685, 0.4605298, 1.898219, 1, 1, 1, 1, 1,
0.8187135, 0.7547902, 1.183234, 1, 1, 1, 1, 1,
0.8195865, -0.4432414, 2.078268, 1, 1, 1, 1, 1,
0.8198956, -1.032556, 2.033921, 1, 1, 1, 1, 1,
0.8205932, -0.251244, 1.236376, 1, 1, 1, 1, 1,
0.8206568, -0.06500949, 2.787761, 0, 0, 1, 1, 1,
0.8208927, 1.378969, 0.8875856, 1, 0, 0, 1, 1,
0.8274088, -0.876093, 0.5585241, 1, 0, 0, 1, 1,
0.8283806, -0.3539442, 2.941979, 1, 0, 0, 1, 1,
0.8299465, 0.03471652, 1.009281, 1, 0, 0, 1, 1,
0.8302154, 0.6797091, 2.610097, 1, 0, 0, 1, 1,
0.837763, -0.6891809, 2.877851, 0, 0, 0, 1, 1,
0.8389438, 0.09585954, 2.730306, 0, 0, 0, 1, 1,
0.8422652, 0.852556, 0.4199444, 0, 0, 0, 1, 1,
0.8442815, -0.1824592, 2.192198, 0, 0, 0, 1, 1,
0.8456035, 0.6763652, 1.049101, 0, 0, 0, 1, 1,
0.8457852, 0.3141876, 2.460759, 0, 0, 0, 1, 1,
0.8487146, -0.9733195, 2.93671, 0, 0, 0, 1, 1,
0.8490757, -0.5961812, 2.100786, 1, 1, 1, 1, 1,
0.8511676, 1.837451, -0.4990465, 1, 1, 1, 1, 1,
0.8672945, -0.1778851, 2.157671, 1, 1, 1, 1, 1,
0.8678779, 0.6874034, 0.02683391, 1, 1, 1, 1, 1,
0.8681448, 0.3794896, -0.4264165, 1, 1, 1, 1, 1,
0.8770772, 1.364925, 2.245564, 1, 1, 1, 1, 1,
0.8780594, 1.026914, 1.100227, 1, 1, 1, 1, 1,
0.8794276, -0.6949649, 1.091742, 1, 1, 1, 1, 1,
0.88355, -0.08350283, 2.045219, 1, 1, 1, 1, 1,
0.8876433, 0.2841476, 0.7107269, 1, 1, 1, 1, 1,
0.8978537, 0.1742485, 0.1225467, 1, 1, 1, 1, 1,
0.9098743, 0.3208631, 1.729201, 1, 1, 1, 1, 1,
0.9103358, 0.2594737, -1.56829, 1, 1, 1, 1, 1,
0.9129712, 1.066071, 1.631279, 1, 1, 1, 1, 1,
0.9167858, 0.6507753, 0.7513384, 1, 1, 1, 1, 1,
0.9201776, -0.09087047, 2.283842, 0, 0, 1, 1, 1,
0.9219164, -0.08990593, 3.138958, 1, 0, 0, 1, 1,
0.924855, -1.471963, 2.353488, 1, 0, 0, 1, 1,
0.9297987, -1.239303, 1.82562, 1, 0, 0, 1, 1,
0.933597, -1.019848, 2.275851, 1, 0, 0, 1, 1,
0.9379804, 1.268344, -0.2655352, 1, 0, 0, 1, 1,
0.9392543, -2.039984, 1.125407, 0, 0, 0, 1, 1,
0.9403825, -0.1096121, -1.124722, 0, 0, 0, 1, 1,
0.9407931, -0.4666929, 3.621349, 0, 0, 0, 1, 1,
0.9408234, 1.238983, 0.5367489, 0, 0, 0, 1, 1,
0.941514, 2.10139, 0.5797578, 0, 0, 0, 1, 1,
0.9479647, -1.112374, 0.9937971, 0, 0, 0, 1, 1,
0.9489502, -1.56947, 2.572155, 0, 0, 0, 1, 1,
0.9524634, 0.4091183, 0.1835977, 1, 1, 1, 1, 1,
0.9534937, -0.3986146, 0.2238346, 1, 1, 1, 1, 1,
0.9578997, 0.09107161, 1.1597, 1, 1, 1, 1, 1,
0.9666634, 0.9956664, 0.09623545, 1, 1, 1, 1, 1,
0.967136, 1.352406, 1.757024, 1, 1, 1, 1, 1,
0.9762771, -0.1524847, 2.361468, 1, 1, 1, 1, 1,
0.9800312, -0.4019446, 1.095235, 1, 1, 1, 1, 1,
0.9974611, 0.4259452, 1.804142, 1, 1, 1, 1, 1,
1.005853, -0.02251591, 1.82772, 1, 1, 1, 1, 1,
1.006611, -0.1752121, 2.682314, 1, 1, 1, 1, 1,
1.010473, 0.02994632, 1.945998, 1, 1, 1, 1, 1,
1.011683, 1.441011, 1.670804, 1, 1, 1, 1, 1,
1.019913, -0.2177628, 2.158121, 1, 1, 1, 1, 1,
1.023967, -0.8713902, 2.064599, 1, 1, 1, 1, 1,
1.028495, 0.4250507, 0.6757216, 1, 1, 1, 1, 1,
1.028749, -1.342349, 1.395286, 0, 0, 1, 1, 1,
1.032506, 0.2830752, 1.700906, 1, 0, 0, 1, 1,
1.038098, -0.9206957, 3.324045, 1, 0, 0, 1, 1,
1.044259, -1.919125, 1.026095, 1, 0, 0, 1, 1,
1.046453, 0.4944852, 2.42177, 1, 0, 0, 1, 1,
1.048864, -0.6181355, 2.630513, 1, 0, 0, 1, 1,
1.049667, -1.302378, 2.010454, 0, 0, 0, 1, 1,
1.050913, 0.4018975, 0.7051737, 0, 0, 0, 1, 1,
1.058091, -0.02171935, 3.284019, 0, 0, 0, 1, 1,
1.05992, -0.6665952, 1.325519, 0, 0, 0, 1, 1,
1.060475, 0.1387378, 0.8891497, 0, 0, 0, 1, 1,
1.063684, 1.238358, 2.60793, 0, 0, 0, 1, 1,
1.071596, -1.565827, 2.128036, 0, 0, 0, 1, 1,
1.072854, -1.202614, 2.032284, 1, 1, 1, 1, 1,
1.073149, 1.688005, 1.746483, 1, 1, 1, 1, 1,
1.078099, 1.28326, 0.4538539, 1, 1, 1, 1, 1,
1.087859, 1.022381, -1.182806, 1, 1, 1, 1, 1,
1.088469, 1.278904, 2.747109, 1, 1, 1, 1, 1,
1.088775, 0.2601396, 2.735804, 1, 1, 1, 1, 1,
1.088891, 0.7992541, 1.556296, 1, 1, 1, 1, 1,
1.093859, 1.245492, 0.2808911, 1, 1, 1, 1, 1,
1.095132, 0.5574719, 2.589649, 1, 1, 1, 1, 1,
1.095778, -0.9704507, 1.582609, 1, 1, 1, 1, 1,
1.097698, -1.266443, 3.186779, 1, 1, 1, 1, 1,
1.100255, -0.3231471, 1.38299, 1, 1, 1, 1, 1,
1.109421, -0.3607897, 2.405065, 1, 1, 1, 1, 1,
1.109513, 1.737335, -0.7354301, 1, 1, 1, 1, 1,
1.11745, -0.2778857, 0.8611668, 1, 1, 1, 1, 1,
1.119231, 0.6603646, 2.576462, 0, 0, 1, 1, 1,
1.123026, -0.4720772, 2.559946, 1, 0, 0, 1, 1,
1.124657, 0.1458497, 1.352239, 1, 0, 0, 1, 1,
1.149949, 1.191705, 1.036832, 1, 0, 0, 1, 1,
1.150965, -0.4070628, 2.33258, 1, 0, 0, 1, 1,
1.155439, -0.02734258, -0.4919752, 1, 0, 0, 1, 1,
1.158381, -0.3399469, 3.054618, 0, 0, 0, 1, 1,
1.160317, 0.4277996, 2.102825, 0, 0, 0, 1, 1,
1.16394, -0.5311791, 2.423006, 0, 0, 0, 1, 1,
1.166895, -0.883306, 2.690183, 0, 0, 0, 1, 1,
1.172579, 1.203498, 0.09284358, 0, 0, 0, 1, 1,
1.192072, -0.3365237, 0.2898204, 0, 0, 0, 1, 1,
1.19603, -0.3069173, 2.43042, 0, 0, 0, 1, 1,
1.21078, 1.939395, 1.495929, 1, 1, 1, 1, 1,
1.213943, 0.06632212, 2.378331, 1, 1, 1, 1, 1,
1.2182, -1.37311, 3.35343, 1, 1, 1, 1, 1,
1.219634, 1.533971, 1.796843, 1, 1, 1, 1, 1,
1.2269, -1.297266, 2.428399, 1, 1, 1, 1, 1,
1.22854, -0.1479957, 1.917515, 1, 1, 1, 1, 1,
1.231009, 1.843569, 0.5791096, 1, 1, 1, 1, 1,
1.235084, -1.523723, 4.358225, 1, 1, 1, 1, 1,
1.236003, -0.230117, 0.7960982, 1, 1, 1, 1, 1,
1.241016, 0.2109309, 2.27147, 1, 1, 1, 1, 1,
1.242954, -1.733212, 1.41041, 1, 1, 1, 1, 1,
1.268423, 1.421959, 0.1021631, 1, 1, 1, 1, 1,
1.274463, -0.8236856, 1.416471, 1, 1, 1, 1, 1,
1.27698, -0.4438735, 1.127158, 1, 1, 1, 1, 1,
1.277749, 0.346029, 1.291814, 1, 1, 1, 1, 1,
1.278186, 0.003891472, 3.038713, 0, 0, 1, 1, 1,
1.283714, -0.07769704, 3.076707, 1, 0, 0, 1, 1,
1.290499, -0.6829811, 0.3511775, 1, 0, 0, 1, 1,
1.29096, 0.4300125, 1.638195, 1, 0, 0, 1, 1,
1.29372, 1.318619, 0.5069172, 1, 0, 0, 1, 1,
1.294788, 1.059675, 2.184602, 1, 0, 0, 1, 1,
1.294845, -1.2865, 2.27172, 0, 0, 0, 1, 1,
1.296018, -1.045362, 1.928627, 0, 0, 0, 1, 1,
1.297132, -0.5018397, 1.597333, 0, 0, 0, 1, 1,
1.297752, 0.07419661, 0.9490793, 0, 0, 0, 1, 1,
1.29989, -0.8064764, 2.401639, 0, 0, 0, 1, 1,
1.309249, -0.306856, 1.807209, 0, 0, 0, 1, 1,
1.313042, -0.7776232, 0.3098432, 0, 0, 0, 1, 1,
1.320532, 1.012593, 1.583332, 1, 1, 1, 1, 1,
1.32854, -0.9282293, 2.809356, 1, 1, 1, 1, 1,
1.329191, 0.08763344, 2.137769, 1, 1, 1, 1, 1,
1.334162, 0.6643798, 0.2387679, 1, 1, 1, 1, 1,
1.337897, -1.101086, 2.04963, 1, 1, 1, 1, 1,
1.340583, -1.562257, 2.219407, 1, 1, 1, 1, 1,
1.349522, 0.7089749, -0.201487, 1, 1, 1, 1, 1,
1.360975, 0.350045, 1.093399, 1, 1, 1, 1, 1,
1.381427, 0.4272623, 1.642591, 1, 1, 1, 1, 1,
1.387775, -0.3894122, 3.379436, 1, 1, 1, 1, 1,
1.398381, 0.7872059, 1.910912, 1, 1, 1, 1, 1,
1.403371, -0.2157151, 2.315367, 1, 1, 1, 1, 1,
1.413641, 0.1427556, 0.4762271, 1, 1, 1, 1, 1,
1.426489, -1.726562, 3.595981, 1, 1, 1, 1, 1,
1.428226, -0.4057271, 2.137249, 1, 1, 1, 1, 1,
1.445818, 1.317659, 0.528345, 0, 0, 1, 1, 1,
1.44976, 0.2469601, 3.400166, 1, 0, 0, 1, 1,
1.454991, -0.1425971, 2.564298, 1, 0, 0, 1, 1,
1.461783, 0.3326763, 2.372358, 1, 0, 0, 1, 1,
1.472097, 1.097329, 0.5809206, 1, 0, 0, 1, 1,
1.473193, -0.08636204, 1.159878, 1, 0, 0, 1, 1,
1.473235, -1.551995, 2.878805, 0, 0, 0, 1, 1,
1.503412, -0.637496, 2.914667, 0, 0, 0, 1, 1,
1.517471, 0.6083639, 2.46076, 0, 0, 0, 1, 1,
1.536191, 0.9563412, 0.8236734, 0, 0, 0, 1, 1,
1.554282, -1.654276, 1.947992, 0, 0, 0, 1, 1,
1.561369, -0.5697799, 3.017998, 0, 0, 0, 1, 1,
1.572097, -1.175702, 2.31074, 0, 0, 0, 1, 1,
1.584254, -1.270352, 3.659621, 1, 1, 1, 1, 1,
1.597862, 0.6488743, 1.085658, 1, 1, 1, 1, 1,
1.599036, -0.4840299, 1.34068, 1, 1, 1, 1, 1,
1.601365, -0.9318724, 0.7663136, 1, 1, 1, 1, 1,
1.603728, -0.3077785, 2.892889, 1, 1, 1, 1, 1,
1.606125, 0.7178836, -0.7426085, 1, 1, 1, 1, 1,
1.649775, 0.2830293, 2.101878, 1, 1, 1, 1, 1,
1.658475, 0.6779494, 1.021428, 1, 1, 1, 1, 1,
1.676309, 1.603303, 1.195565, 1, 1, 1, 1, 1,
1.698429, 0.5341324, 2.102629, 1, 1, 1, 1, 1,
1.705487, -0.2048039, 1.209142, 1, 1, 1, 1, 1,
1.708047, -1.07718, 1.563134, 1, 1, 1, 1, 1,
1.7093, -0.9140326, 1.033906, 1, 1, 1, 1, 1,
1.709922, -1.785055, 0.9554774, 1, 1, 1, 1, 1,
1.712967, 0.7635181, 0.7256068, 1, 1, 1, 1, 1,
1.717768, 0.08891613, 3.32609, 0, 0, 1, 1, 1,
1.75165, -1.258415, 3.173366, 1, 0, 0, 1, 1,
1.754383, -1.0368, 3.125609, 1, 0, 0, 1, 1,
1.778351, 0.2654076, 1.143683, 1, 0, 0, 1, 1,
1.795375, 0.5026985, 0.2394713, 1, 0, 0, 1, 1,
1.841913, 1.175769, 2.315082, 1, 0, 0, 1, 1,
1.842125, -0.4675893, 1.772987, 0, 0, 0, 1, 1,
1.844961, -0.7273591, 3.204189, 0, 0, 0, 1, 1,
1.847981, 0.5431771, 1.405753, 0, 0, 0, 1, 1,
1.84961, 1.433897, -0.02906172, 0, 0, 0, 1, 1,
1.877071, -0.09542441, 1.372715, 0, 0, 0, 1, 1,
1.881043, 0.5425047, 1.073329, 0, 0, 0, 1, 1,
1.887041, 0.2652462, 1.336435, 0, 0, 0, 1, 1,
1.890785, -0.7220449, 2.133025, 1, 1, 1, 1, 1,
1.90584, -0.08692241, 1.461034, 1, 1, 1, 1, 1,
1.908929, 0.4487222, 1.993221, 1, 1, 1, 1, 1,
1.925455, 0.7236926, 0.4463626, 1, 1, 1, 1, 1,
1.968522, 0.08869999, 1.534908, 1, 1, 1, 1, 1,
1.990147, 0.08817285, 0.2767553, 1, 1, 1, 1, 1,
1.996406, 0.9258826, 1.874297, 1, 1, 1, 1, 1,
2.002409, -2.711305, 2.028368, 1, 1, 1, 1, 1,
2.012663, 0.6226525, 0.9468371, 1, 1, 1, 1, 1,
2.027681, -0.2586609, -0.3281284, 1, 1, 1, 1, 1,
2.035971, 1.279818, 2.401985, 1, 1, 1, 1, 1,
2.037722, -0.6847796, 2.692391, 1, 1, 1, 1, 1,
2.052562, -1.127964, 2.436344, 1, 1, 1, 1, 1,
2.054775, 1.288814, 1.242752, 1, 1, 1, 1, 1,
2.060114, -0.6917886, 2.331285, 1, 1, 1, 1, 1,
2.069141, -1.287075, 2.894747, 0, 0, 1, 1, 1,
2.072488, 1.05831, 2.279691, 1, 0, 0, 1, 1,
2.099736, -0.7181081, 0.6518207, 1, 0, 0, 1, 1,
2.129341, -0.4020747, 2.586941, 1, 0, 0, 1, 1,
2.151607, -1.191716, 1.566839, 1, 0, 0, 1, 1,
2.154491, 0.1956427, 0.8589727, 1, 0, 0, 1, 1,
2.290485, 0.6919311, 0.6587281, 0, 0, 0, 1, 1,
2.40001, 1.533111, 1.227343, 0, 0, 0, 1, 1,
2.478072, -0.4755182, 2.296263, 0, 0, 0, 1, 1,
2.480592, 1.088716, 2.342309, 0, 0, 0, 1, 1,
2.494873, -2.058092, 2.94332, 0, 0, 0, 1, 1,
2.589522, 0.09209332, 2.49059, 0, 0, 0, 1, 1,
2.616585, 0.7067235, 2.756562, 0, 0, 0, 1, 1,
2.725742, 0.05141816, 0.373794, 1, 1, 1, 1, 1,
2.745837, -0.3601791, 0.6649668, 1, 1, 1, 1, 1,
2.82018, -0.5268285, -0.624576, 1, 1, 1, 1, 1,
2.868352, 1.805404, 2.293305, 1, 1, 1, 1, 1,
3.119827, 0.7601149, 0.7390379, 1, 1, 1, 1, 1,
3.514631, 1.166749, -0.7284459, 1, 1, 1, 1, 1,
3.583532, -1.352339, 2.610962, 1, 1, 1, 1, 1
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
var radius = 9.42296;
var distance = 33.09775;
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
mvMatrix.translate( -0.2522714, -0.063609, -0.05728436 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.09775);
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
