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
-3.816001, 0.3243061, -0.9664217, 1, 0, 0, 1,
-3.199963, -0.8014033, -3.679739, 1, 0.007843138, 0, 1,
-3.173633, -1.608594, -0.7399089, 1, 0.01176471, 0, 1,
-2.752209, 0.06928002, -1.781542, 1, 0.01960784, 0, 1,
-2.736227, 1.365471, -1.908189, 1, 0.02352941, 0, 1,
-2.66687, -1.204176, -1.071388, 1, 0.03137255, 0, 1,
-2.632631, -0.4435878, -0.4831349, 1, 0.03529412, 0, 1,
-2.612685, 2.086208, -1.035441, 1, 0.04313726, 0, 1,
-2.608491, 1.441333, -1.661887, 1, 0.04705882, 0, 1,
-2.421264, 0.6674378, -1.567917, 1, 0.05490196, 0, 1,
-2.355906, 0.1896052, -1.389306, 1, 0.05882353, 0, 1,
-2.346517, 1.819277, -0.03655716, 1, 0.06666667, 0, 1,
-2.330986, -1.556132, -1.639852, 1, 0.07058824, 0, 1,
-2.315423, 0.7232261, 0.3737967, 1, 0.07843138, 0, 1,
-2.296016, -0.2812481, -3.015832, 1, 0.08235294, 0, 1,
-2.248765, -2.845916, -3.148315, 1, 0.09019608, 0, 1,
-2.246852, 1.027634, -0.096672, 1, 0.09411765, 0, 1,
-2.237999, -3.069141, -1.781821, 1, 0.1019608, 0, 1,
-2.223072, -0.6223956, -3.19561, 1, 0.1098039, 0, 1,
-2.186353, -0.2438219, -2.055105, 1, 0.1137255, 0, 1,
-2.159972, -1.625459, -3.042921, 1, 0.1215686, 0, 1,
-2.115012, 0.06005662, -0.3282784, 1, 0.1254902, 0, 1,
-2.087631, 0.6678598, -0.3490838, 1, 0.1333333, 0, 1,
-2.059615, 1.144838, -1.003544, 1, 0.1372549, 0, 1,
-1.987935, -1.000022, -0.5306088, 1, 0.145098, 0, 1,
-1.948205, 1.036323, -1.661783, 1, 0.1490196, 0, 1,
-1.94792, -0.4673227, -1.299105, 1, 0.1568628, 0, 1,
-1.940574, -0.2970988, -2.957151, 1, 0.1607843, 0, 1,
-1.937621, 0.8368285, -1.423774, 1, 0.1686275, 0, 1,
-1.922343, 0.7234135, -2.188696, 1, 0.172549, 0, 1,
-1.84917, 0.4711033, -0.2219342, 1, 0.1803922, 0, 1,
-1.847031, -0.4267302, -0.9419606, 1, 0.1843137, 0, 1,
-1.840603, -0.4285161, -1.080437, 1, 0.1921569, 0, 1,
-1.838506, 0.6909878, -2.11839, 1, 0.1960784, 0, 1,
-1.836584, 1.161834, -0.8971915, 1, 0.2039216, 0, 1,
-1.833693, 0.8467696, -2.33084, 1, 0.2117647, 0, 1,
-1.831782, -0.1269918, -2.377061, 1, 0.2156863, 0, 1,
-1.831022, -1.919662, -2.038227, 1, 0.2235294, 0, 1,
-1.825375, -0.235292, -1.906327, 1, 0.227451, 0, 1,
-1.809191, -0.7083488, -0.8885605, 1, 0.2352941, 0, 1,
-1.757364, -0.1323794, 0.1813799, 1, 0.2392157, 0, 1,
-1.754869, 0.7839316, -1.589415, 1, 0.2470588, 0, 1,
-1.753592, -0.9324952, -1.231071, 1, 0.2509804, 0, 1,
-1.741961, 0.6425474, -0.4329875, 1, 0.2588235, 0, 1,
-1.729985, 1.853468, -2.956554, 1, 0.2627451, 0, 1,
-1.716706, -0.2356714, -0.3495592, 1, 0.2705882, 0, 1,
-1.711126, -0.4968474, -2.729665, 1, 0.2745098, 0, 1,
-1.703012, -1.827685, -2.421427, 1, 0.282353, 0, 1,
-1.695624, 0.4586617, 0.3357602, 1, 0.2862745, 0, 1,
-1.692526, 0.2300962, -2.912415, 1, 0.2941177, 0, 1,
-1.691493, -0.1898201, -1.355766, 1, 0.3019608, 0, 1,
-1.68346, 0.5986369, -2.29107, 1, 0.3058824, 0, 1,
-1.673909, -0.4391544, -2.577664, 1, 0.3137255, 0, 1,
-1.664286, 0.7407358, -2.059189, 1, 0.3176471, 0, 1,
-1.646603, 0.1904583, -0.9128096, 1, 0.3254902, 0, 1,
-1.644974, -0.02666122, -1.126782, 1, 0.3294118, 0, 1,
-1.641493, 0.1744624, -1.305211, 1, 0.3372549, 0, 1,
-1.616696, 1.876118, -2.349358, 1, 0.3411765, 0, 1,
-1.615023, 1.87889, -0.9631209, 1, 0.3490196, 0, 1,
-1.602285, 0.9094262, -0.0394141, 1, 0.3529412, 0, 1,
-1.599566, -1.290785, -1.874872, 1, 0.3607843, 0, 1,
-1.58154, -1.565307, -1.177551, 1, 0.3647059, 0, 1,
-1.575779, -1.11898, -2.98826, 1, 0.372549, 0, 1,
-1.575416, 0.2715316, -1.936842, 1, 0.3764706, 0, 1,
-1.571027, 1.173038, 0.802578, 1, 0.3843137, 0, 1,
-1.557106, -0.9853415, 0.3255928, 1, 0.3882353, 0, 1,
-1.556924, -0.07930683, -1.168151, 1, 0.3960784, 0, 1,
-1.535315, 0.7934565, -0.7788277, 1, 0.4039216, 0, 1,
-1.519701, -1.982505, -2.43589, 1, 0.4078431, 0, 1,
-1.511576, 0.966127, -1.200152, 1, 0.4156863, 0, 1,
-1.511521, -0.9955229, -3.122854, 1, 0.4196078, 0, 1,
-1.508775, 1.217829, 0.108762, 1, 0.427451, 0, 1,
-1.491171, 1.867307, 1.315294, 1, 0.4313726, 0, 1,
-1.462303, -0.4081774, -2.613843, 1, 0.4392157, 0, 1,
-1.460152, -0.1003882, -2.042201, 1, 0.4431373, 0, 1,
-1.449458, -0.5610305, -2.047767, 1, 0.4509804, 0, 1,
-1.446504, -0.8842521, -4.28174, 1, 0.454902, 0, 1,
-1.442427, -1.108808, -2.543774, 1, 0.4627451, 0, 1,
-1.440479, -0.09972656, -0.3147384, 1, 0.4666667, 0, 1,
-1.439971, 1.069724, -1.325227, 1, 0.4745098, 0, 1,
-1.439013, -0.507843, -2.638539, 1, 0.4784314, 0, 1,
-1.438171, 1.613485, -0.6252623, 1, 0.4862745, 0, 1,
-1.438104, -1.031559, -3.032428, 1, 0.4901961, 0, 1,
-1.436696, -2.019901, -2.240555, 1, 0.4980392, 0, 1,
-1.430788, -0.2614369, -0.2684291, 1, 0.5058824, 0, 1,
-1.424716, -0.1837271, -2.254959, 1, 0.509804, 0, 1,
-1.422292, -0.7895643, -2.885794, 1, 0.5176471, 0, 1,
-1.41499, -2.031784, -2.592602, 1, 0.5215687, 0, 1,
-1.413236, 0.9734448, -0.5747886, 1, 0.5294118, 0, 1,
-1.406469, -1.787566, -2.957929, 1, 0.5333334, 0, 1,
-1.402626, -0.7953548, -1.659455, 1, 0.5411765, 0, 1,
-1.401635, -0.1820835, -0.2450396, 1, 0.5450981, 0, 1,
-1.392711, -0.8529457, -2.090173, 1, 0.5529412, 0, 1,
-1.375351, 0.3699367, 0.5358313, 1, 0.5568628, 0, 1,
-1.368536, -1.509019, -3.121758, 1, 0.5647059, 0, 1,
-1.368023, -0.240342, -2.309639, 1, 0.5686275, 0, 1,
-1.359778, 0.117513, -2.714785, 1, 0.5764706, 0, 1,
-1.333799, -0.4679727, -1.564878, 1, 0.5803922, 0, 1,
-1.320051, -1.514208, -1.639668, 1, 0.5882353, 0, 1,
-1.294617, -0.1778245, -0.4461108, 1, 0.5921569, 0, 1,
-1.285269, 0.2668391, -1.825383, 1, 0.6, 0, 1,
-1.284458, -0.228164, -2.664068, 1, 0.6078432, 0, 1,
-1.282223, 0.1554051, -0.9361808, 1, 0.6117647, 0, 1,
-1.273313, -1.833391, -3.75932, 1, 0.6196079, 0, 1,
-1.261124, -1.284401, -1.017473, 1, 0.6235294, 0, 1,
-1.258658, -0.2718382, -2.583359, 1, 0.6313726, 0, 1,
-1.253731, -0.9276006, -3.088704, 1, 0.6352941, 0, 1,
-1.243212, 1.484538, -1.773938, 1, 0.6431373, 0, 1,
-1.242312, -0.5722679, -2.603664, 1, 0.6470588, 0, 1,
-1.233726, 1.704312, -1.041264, 1, 0.654902, 0, 1,
-1.232599, 0.5878794, -1.335799, 1, 0.6588235, 0, 1,
-1.231915, 0.3349659, -0.668318, 1, 0.6666667, 0, 1,
-1.231788, -0.2891304, -1.041536, 1, 0.6705883, 0, 1,
-1.229127, -0.3704791, -2.361267, 1, 0.6784314, 0, 1,
-1.225647, -1.118933, -2.932622, 1, 0.682353, 0, 1,
-1.217067, -1.307902, -2.739225, 1, 0.6901961, 0, 1,
-1.213559, 0.9704484, -2.533736, 1, 0.6941177, 0, 1,
-1.210531, 0.980802, 1.188195, 1, 0.7019608, 0, 1,
-1.198478, -0.7406523, -1.398295, 1, 0.7098039, 0, 1,
-1.19093, -0.6225253, -1.699286, 1, 0.7137255, 0, 1,
-1.177659, 0.04159959, -0.5625653, 1, 0.7215686, 0, 1,
-1.175385, 0.3765443, -1.738358, 1, 0.7254902, 0, 1,
-1.174662, -1.281276, -1.434417, 1, 0.7333333, 0, 1,
-1.166782, 2.203539, -0.7022053, 1, 0.7372549, 0, 1,
-1.166029, 0.1468088, -1.866189, 1, 0.7450981, 0, 1,
-1.163655, 0.2148632, -4.16064, 1, 0.7490196, 0, 1,
-1.158107, 0.4412806, -0.9082803, 1, 0.7568628, 0, 1,
-1.1558, 1.160984, -0.683514, 1, 0.7607843, 0, 1,
-1.149488, -0.187295, -1.380955, 1, 0.7686275, 0, 1,
-1.144497, 0.5604379, -1.809505, 1, 0.772549, 0, 1,
-1.142647, 1.354263, 0.1036134, 1, 0.7803922, 0, 1,
-1.123412, -0.09334734, -1.835825, 1, 0.7843137, 0, 1,
-1.111235, 0.9505934, -1.362261, 1, 0.7921569, 0, 1,
-1.109938, 0.3869794, -1.724289, 1, 0.7960784, 0, 1,
-1.107844, -0.1904812, -1.405272, 1, 0.8039216, 0, 1,
-1.103504, 1.178898, -2.066494, 1, 0.8117647, 0, 1,
-1.101691, 0.2305077, -0.6605166, 1, 0.8156863, 0, 1,
-1.100611, 0.6063552, -0.3866929, 1, 0.8235294, 0, 1,
-1.099317, 0.03015891, -2.289086, 1, 0.827451, 0, 1,
-1.091758, 0.3551489, -1.231623, 1, 0.8352941, 0, 1,
-1.08356, 1.423285, 0.9236656, 1, 0.8392157, 0, 1,
-1.080492, -0.9957047, -3.717246, 1, 0.8470588, 0, 1,
-1.07761, 0.6648556, -0.895623, 1, 0.8509804, 0, 1,
-1.06719, 1.308213, -1.678933, 1, 0.8588235, 0, 1,
-1.063276, 0.278225, 0.9691719, 1, 0.8627451, 0, 1,
-1.052867, -1.688622, -3.528485, 1, 0.8705882, 0, 1,
-1.038464, 0.09644077, -0.3717257, 1, 0.8745098, 0, 1,
-1.036348, -0.4272115, -3.591679, 1, 0.8823529, 0, 1,
-1.035468, -1.722965, -2.725045, 1, 0.8862745, 0, 1,
-1.034542, -0.6498124, -1.506818, 1, 0.8941177, 0, 1,
-1.034323, -0.4448453, -2.343537, 1, 0.8980392, 0, 1,
-1.02228, -0.492486, -1.415658, 1, 0.9058824, 0, 1,
-1.014456, -0.2747233, -2.420181, 1, 0.9137255, 0, 1,
-1.012707, 0.8389874, -1.003789, 1, 0.9176471, 0, 1,
-1.006626, 1.833536, -0.3271341, 1, 0.9254902, 0, 1,
-1.000917, 0.8136751, -0.5800312, 1, 0.9294118, 0, 1,
-0.9991559, -1.034523, -4.006174, 1, 0.9372549, 0, 1,
-0.9975172, -1.765561, -2.884449, 1, 0.9411765, 0, 1,
-0.9950259, -1.330182, -3.722861, 1, 0.9490196, 0, 1,
-0.9945502, -1.73283, -1.317439, 1, 0.9529412, 0, 1,
-0.9907287, 0.8498772, -2.376871, 1, 0.9607843, 0, 1,
-0.9860369, 1.131534, -1.282337, 1, 0.9647059, 0, 1,
-0.985477, -0.7172724, -0.5795512, 1, 0.972549, 0, 1,
-0.9824324, -1.066405, -1.968292, 1, 0.9764706, 0, 1,
-0.9819905, 1.074557, -2.3208, 1, 0.9843137, 0, 1,
-0.9728222, -0.9197515, -4.963515, 1, 0.9882353, 0, 1,
-0.9711216, -1.084745, -1.485611, 1, 0.9960784, 0, 1,
-0.9676632, -1.0188, -1.604405, 0.9960784, 1, 0, 1,
-0.9648787, -0.2696295, -1.393902, 0.9921569, 1, 0, 1,
-0.9602145, 0.04287156, -3.474833, 0.9843137, 1, 0, 1,
-0.9554378, 0.6688926, -1.182089, 0.9803922, 1, 0, 1,
-0.953095, 0.2598611, -0.6729217, 0.972549, 1, 0, 1,
-0.9514474, 1.158725, -1.117889, 0.9686275, 1, 0, 1,
-0.9476553, 0.09737045, -2.653085, 0.9607843, 1, 0, 1,
-0.9463445, -1.115319, -3.30227, 0.9568627, 1, 0, 1,
-0.9453371, 0.6841586, -1.22337, 0.9490196, 1, 0, 1,
-0.944314, 0.99855, -0.8753739, 0.945098, 1, 0, 1,
-0.9378913, 0.5211613, -1.623492, 0.9372549, 1, 0, 1,
-0.9372327, -0.3160899, -4.011093, 0.9333333, 1, 0, 1,
-0.9354486, -0.6424534, -2.980037, 0.9254902, 1, 0, 1,
-0.9300737, 0.6395217, -0.71263, 0.9215686, 1, 0, 1,
-0.925967, -0.8364388, -2.884881, 0.9137255, 1, 0, 1,
-0.9044424, -1.75755, -1.727735, 0.9098039, 1, 0, 1,
-0.9040028, -1.348759, -2.72834, 0.9019608, 1, 0, 1,
-0.8971841, -0.5854971, -2.916732, 0.8941177, 1, 0, 1,
-0.8968829, -1.961105, -2.107622, 0.8901961, 1, 0, 1,
-0.8906676, -0.2781128, -2.94017, 0.8823529, 1, 0, 1,
-0.8841668, 0.4783553, -3.774522, 0.8784314, 1, 0, 1,
-0.8790261, 0.129566, -0.139581, 0.8705882, 1, 0, 1,
-0.8780551, 1.13054, -1.485807, 0.8666667, 1, 0, 1,
-0.8655601, -1.438835, -1.148189, 0.8588235, 1, 0, 1,
-0.8652255, 0.4196355, -2.226233, 0.854902, 1, 0, 1,
-0.8650404, 1.493064, 0.6390898, 0.8470588, 1, 0, 1,
-0.863916, 0.03220028, -1.634424, 0.8431373, 1, 0, 1,
-0.8617196, -0.5790023, -2.087368, 0.8352941, 1, 0, 1,
-0.8612493, 1.346021, -0.9491789, 0.8313726, 1, 0, 1,
-0.8578171, -0.8478932, -2.037074, 0.8235294, 1, 0, 1,
-0.8527882, 1.401664, 0.7047114, 0.8196079, 1, 0, 1,
-0.8517567, 1.49321, 0.1307077, 0.8117647, 1, 0, 1,
-0.8489811, 0.503481, -2.096918, 0.8078431, 1, 0, 1,
-0.842736, 0.1166163, -2.19493, 0.8, 1, 0, 1,
-0.8411217, 0.5616516, -0.9462906, 0.7921569, 1, 0, 1,
-0.8333341, 0.9363288, -2.423014, 0.7882353, 1, 0, 1,
-0.8298607, -0.6354346, -1.042779, 0.7803922, 1, 0, 1,
-0.8284046, 0.9921311, -1.023464, 0.7764706, 1, 0, 1,
-0.8232231, 0.5381204, -2.909694, 0.7686275, 1, 0, 1,
-0.821834, 0.6160906, 0.251032, 0.7647059, 1, 0, 1,
-0.8206648, 0.5277175, -2.585433, 0.7568628, 1, 0, 1,
-0.81669, 2.221083, 0.4215474, 0.7529412, 1, 0, 1,
-0.8160412, 0.2263813, 0.1116498, 0.7450981, 1, 0, 1,
-0.8139359, 0.05643835, -0.6371886, 0.7411765, 1, 0, 1,
-0.8086844, -0.2363939, -1.305541, 0.7333333, 1, 0, 1,
-0.799315, 1.538431, 0.9515411, 0.7294118, 1, 0, 1,
-0.7977695, 2.83687, 0.8177285, 0.7215686, 1, 0, 1,
-0.7896032, 0.4584392, -0.2676697, 0.7176471, 1, 0, 1,
-0.7891362, 0.8746551, -1.010635, 0.7098039, 1, 0, 1,
-0.787626, -0.466867, -1.849026, 0.7058824, 1, 0, 1,
-0.784762, 0.4485361, 0.5960931, 0.6980392, 1, 0, 1,
-0.7810756, -0.6819862, -3.892445, 0.6901961, 1, 0, 1,
-0.7779469, 0.09503715, -2.42667, 0.6862745, 1, 0, 1,
-0.7765861, 0.1939508, -0.3041018, 0.6784314, 1, 0, 1,
-0.7765841, 2.088047, -0.5899478, 0.6745098, 1, 0, 1,
-0.7741541, -3.045662, -3.7835, 0.6666667, 1, 0, 1,
-0.7732692, -0.02270643, -1.082123, 0.6627451, 1, 0, 1,
-0.772011, -0.3436325, -2.728478, 0.654902, 1, 0, 1,
-0.7712482, -0.2399099, -1.464627, 0.6509804, 1, 0, 1,
-0.7672231, -0.2366233, -2.893783, 0.6431373, 1, 0, 1,
-0.7611964, -0.3376052, -0.7781903, 0.6392157, 1, 0, 1,
-0.7605615, -0.7273208, -4.242466, 0.6313726, 1, 0, 1,
-0.7579171, -1.340156, -2.632271, 0.627451, 1, 0, 1,
-0.7568825, -0.4875853, -2.920808, 0.6196079, 1, 0, 1,
-0.7556203, -0.5821794, -3.921204, 0.6156863, 1, 0, 1,
-0.7517325, -0.4318227, -2.124443, 0.6078432, 1, 0, 1,
-0.749144, -1.59916, -1.664813, 0.6039216, 1, 0, 1,
-0.7446536, -0.2075101, -2.094659, 0.5960785, 1, 0, 1,
-0.7426408, 0.4819401, -0.3251314, 0.5882353, 1, 0, 1,
-0.7413459, 0.1070593, -2.629292, 0.5843138, 1, 0, 1,
-0.739068, 1.953774, 0.1354509, 0.5764706, 1, 0, 1,
-0.7320604, 0.007219263, -2.323854, 0.572549, 1, 0, 1,
-0.7307498, -0.7241549, -2.569368, 0.5647059, 1, 0, 1,
-0.7270256, -0.2484605, -0.6696917, 0.5607843, 1, 0, 1,
-0.7252461, -1.531563, 0.6670262, 0.5529412, 1, 0, 1,
-0.7187065, 0.8901802, -1.25539, 0.5490196, 1, 0, 1,
-0.7044616, 0.08095567, -2.063305, 0.5411765, 1, 0, 1,
-0.7025229, 0.697294, -2.384085, 0.5372549, 1, 0, 1,
-0.7000143, -0.04552279, -2.281883, 0.5294118, 1, 0, 1,
-0.6979296, 0.2570153, 0.2490647, 0.5254902, 1, 0, 1,
-0.6965353, -0.4941624, -2.478458, 0.5176471, 1, 0, 1,
-0.6911144, 0.8332298, -0.8945009, 0.5137255, 1, 0, 1,
-0.6910626, -1.014783, -2.271099, 0.5058824, 1, 0, 1,
-0.69103, 1.269368, -2.541136, 0.5019608, 1, 0, 1,
-0.6874623, -0.4113545, -1.202034, 0.4941176, 1, 0, 1,
-0.6809446, -0.0234024, -0.9758165, 0.4862745, 1, 0, 1,
-0.680795, -2.550751, -2.718253, 0.4823529, 1, 0, 1,
-0.6671305, 2.737682, 1.613697, 0.4745098, 1, 0, 1,
-0.6656362, 0.1600554, -2.35802, 0.4705882, 1, 0, 1,
-0.6565571, -0.09436184, -2.401584, 0.4627451, 1, 0, 1,
-0.6563811, -0.2739346, -2.2592, 0.4588235, 1, 0, 1,
-0.6538705, 1.575737, 0.4976189, 0.4509804, 1, 0, 1,
-0.6530176, -1.609466, -2.456415, 0.4470588, 1, 0, 1,
-0.6498263, -0.6547948, -2.635844, 0.4392157, 1, 0, 1,
-0.642983, -0.3051189, -0.03657927, 0.4352941, 1, 0, 1,
-0.6375105, -0.3507949, -1.918147, 0.427451, 1, 0, 1,
-0.6334807, -0.5044844, -1.989385, 0.4235294, 1, 0, 1,
-0.6303263, 0.8116064, -0.5654339, 0.4156863, 1, 0, 1,
-0.6275449, -0.3639118, -1.708332, 0.4117647, 1, 0, 1,
-0.6254344, -0.7716326, -2.641337, 0.4039216, 1, 0, 1,
-0.6252297, -0.3570172, -3.389266, 0.3960784, 1, 0, 1,
-0.6174628, -0.2410004, -2.931713, 0.3921569, 1, 0, 1,
-0.6173914, -0.1728802, -1.102598, 0.3843137, 1, 0, 1,
-0.6145608, 1.905751, -0.1491657, 0.3803922, 1, 0, 1,
-0.6128334, -0.5719525, -4.003215, 0.372549, 1, 0, 1,
-0.6096325, -0.5502918, -3.192581, 0.3686275, 1, 0, 1,
-0.6087937, -0.03160282, -0.5850449, 0.3607843, 1, 0, 1,
-0.6055943, 0.6803136, -1.062578, 0.3568628, 1, 0, 1,
-0.6021246, -0.5174903, -1.486567, 0.3490196, 1, 0, 1,
-0.6020973, -0.2570666, -2.364077, 0.345098, 1, 0, 1,
-0.6018166, -0.4645133, -1.955593, 0.3372549, 1, 0, 1,
-0.6012573, 0.7617123, -0.1712208, 0.3333333, 1, 0, 1,
-0.5841227, -0.1688055, -0.8202345, 0.3254902, 1, 0, 1,
-0.5831501, -0.7025979, -1.908523, 0.3215686, 1, 0, 1,
-0.5783055, 1.558046, -1.248093, 0.3137255, 1, 0, 1,
-0.5743877, 0.8534851, 0.2020908, 0.3098039, 1, 0, 1,
-0.574356, -1.028499, -1.898967, 0.3019608, 1, 0, 1,
-0.5716674, -1.329622, -2.751533, 0.2941177, 1, 0, 1,
-0.5630919, 1.01694, 0.7068196, 0.2901961, 1, 0, 1,
-0.5630625, 1.968397, -2.756559, 0.282353, 1, 0, 1,
-0.5625657, -0.8310668, -2.068542, 0.2784314, 1, 0, 1,
-0.5557492, -0.4449092, -2.609401, 0.2705882, 1, 0, 1,
-0.5550625, -0.4431238, -2.279271, 0.2666667, 1, 0, 1,
-0.5500258, -0.6886105, -3.389991, 0.2588235, 1, 0, 1,
-0.5399069, -0.6627515, -2.792109, 0.254902, 1, 0, 1,
-0.5385631, -0.6890177, -4.128118, 0.2470588, 1, 0, 1,
-0.5272247, -0.7900378, -2.622562, 0.2431373, 1, 0, 1,
-0.5243647, 0.8357739, -0.8863127, 0.2352941, 1, 0, 1,
-0.5234264, 0.1724369, -0.5963324, 0.2313726, 1, 0, 1,
-0.5164421, -0.6110525, -0.4824977, 0.2235294, 1, 0, 1,
-0.5145364, 0.4400007, 0.7830387, 0.2196078, 1, 0, 1,
-0.5130321, -0.2910523, -0.9266546, 0.2117647, 1, 0, 1,
-0.5127922, 2.044179, 1.579737, 0.2078431, 1, 0, 1,
-0.5120581, 1.200936, -1.570869, 0.2, 1, 0, 1,
-0.5101315, 1.389134, 0.02648244, 0.1921569, 1, 0, 1,
-0.508246, -0.01004836, -1.641322, 0.1882353, 1, 0, 1,
-0.5044376, -0.2163852, -0.3607571, 0.1803922, 1, 0, 1,
-0.504284, 1.604745, -1.627614, 0.1764706, 1, 0, 1,
-0.5016876, 0.9613797, -1.198814, 0.1686275, 1, 0, 1,
-0.498049, -0.6020958, -2.783373, 0.1647059, 1, 0, 1,
-0.4882964, 0.1542129, -1.973877, 0.1568628, 1, 0, 1,
-0.4879299, -0.768653, -1.611999, 0.1529412, 1, 0, 1,
-0.4867775, -0.8172583, -0.977415, 0.145098, 1, 0, 1,
-0.4866596, 2.273012, 0.3746931, 0.1411765, 1, 0, 1,
-0.4842162, 1.337947, 0.4764678, 0.1333333, 1, 0, 1,
-0.4812994, -0.9554709, -2.845544, 0.1294118, 1, 0, 1,
-0.4811237, 1.189045, -1.657426, 0.1215686, 1, 0, 1,
-0.4769909, -1.532683, -3.355907, 0.1176471, 1, 0, 1,
-0.4698228, -0.7546322, -1.005174, 0.1098039, 1, 0, 1,
-0.4691028, 0.3307374, -2.243719, 0.1058824, 1, 0, 1,
-0.4672659, 0.3364676, -2.620909, 0.09803922, 1, 0, 1,
-0.4656794, -0.5554506, -1.824051, 0.09019608, 1, 0, 1,
-0.4649425, 0.8541002, -0.9970968, 0.08627451, 1, 0, 1,
-0.4621936, -1.848018, -3.483938, 0.07843138, 1, 0, 1,
-0.4556574, 0.4148368, -2.940145, 0.07450981, 1, 0, 1,
-0.4555591, 0.6565961, 1.121707, 0.06666667, 1, 0, 1,
-0.4529141, 0.6375898, -0.1856622, 0.0627451, 1, 0, 1,
-0.4527254, -0.3679764, -2.783352, 0.05490196, 1, 0, 1,
-0.4512185, -0.720315, -2.071538, 0.05098039, 1, 0, 1,
-0.448435, -0.004694996, -2.307764, 0.04313726, 1, 0, 1,
-0.441155, 0.7944084, -0.8664395, 0.03921569, 1, 0, 1,
-0.437048, 1.724088, 0.8165677, 0.03137255, 1, 0, 1,
-0.4357447, -0.5179092, -4.061287, 0.02745098, 1, 0, 1,
-0.4342152, -0.917595, -2.212719, 0.01960784, 1, 0, 1,
-0.431915, -0.2916191, -1.055749, 0.01568628, 1, 0, 1,
-0.4315891, 0.9375083, -1.513021, 0.007843138, 1, 0, 1,
-0.431149, 0.5421672, -1.093109, 0.003921569, 1, 0, 1,
-0.4223652, 0.2464875, -0.5738598, 0, 1, 0.003921569, 1,
-0.4174309, 0.7583741, -0.3761423, 0, 1, 0.01176471, 1,
-0.4139839, 0.3410653, -2.759187, 0, 1, 0.01568628, 1,
-0.4062817, 0.4232246, -2.309907, 0, 1, 0.02352941, 1,
-0.4019008, -0.3443809, -3.412844, 0, 1, 0.02745098, 1,
-0.4010048, -1.598004, -3.618047, 0, 1, 0.03529412, 1,
-0.3968937, -0.2310765, -1.6268, 0, 1, 0.03921569, 1,
-0.3951009, 0.1998187, -0.7500858, 0, 1, 0.04705882, 1,
-0.390592, -0.05264256, -3.399955, 0, 1, 0.05098039, 1,
-0.389258, 1.404667, 0.1183634, 0, 1, 0.05882353, 1,
-0.3861771, 1.045693, -1.179512, 0, 1, 0.0627451, 1,
-0.385157, -0.218463, -2.310416, 0, 1, 0.07058824, 1,
-0.3822795, -1.177421, -2.446953, 0, 1, 0.07450981, 1,
-0.3814943, 0.9276798, 0.204185, 0, 1, 0.08235294, 1,
-0.38146, -3.123298, -4.310106, 0, 1, 0.08627451, 1,
-0.3789603, 0.3543615, -1.027914, 0, 1, 0.09411765, 1,
-0.3764976, -0.05864551, -1.135072, 0, 1, 0.1019608, 1,
-0.3728705, 1.085877, -1.113942, 0, 1, 0.1058824, 1,
-0.3726298, -0.1380745, -1.883205, 0, 1, 0.1137255, 1,
-0.3724098, -3.018087, -2.269539, 0, 1, 0.1176471, 1,
-0.3654337, 0.0815507, -2.175121, 0, 1, 0.1254902, 1,
-0.3638983, -0.5896571, -1.90236, 0, 1, 0.1294118, 1,
-0.3633306, -0.4175431, -1.541799, 0, 1, 0.1372549, 1,
-0.3597426, 0.01233777, -1.455673, 0, 1, 0.1411765, 1,
-0.3590322, 0.3806461, -1.67371, 0, 1, 0.1490196, 1,
-0.3589146, -1.110135, -4.095522, 0, 1, 0.1529412, 1,
-0.3559483, 1.477849, 1.014464, 0, 1, 0.1607843, 1,
-0.350794, 0.7465385, 0.6573794, 0, 1, 0.1647059, 1,
-0.3468935, -1.020959, -2.293134, 0, 1, 0.172549, 1,
-0.3454501, -0.7293455, -1.500795, 0, 1, 0.1764706, 1,
-0.3428609, -1.259963, -3.752587, 0, 1, 0.1843137, 1,
-0.3427665, 0.8364488, 0.2158977, 0, 1, 0.1882353, 1,
-0.3405949, -0.4415906, -2.921959, 0, 1, 0.1960784, 1,
-0.3364836, 0.6514481, 0.5487849, 0, 1, 0.2039216, 1,
-0.3312628, 1.654463, -0.6761145, 0, 1, 0.2078431, 1,
-0.3272081, 1.041873, -0.6830377, 0, 1, 0.2156863, 1,
-0.3271216, -0.5610194, -1.792598, 0, 1, 0.2196078, 1,
-0.325755, -0.5256776, -2.426429, 0, 1, 0.227451, 1,
-0.323779, -0.2309354, -1.98629, 0, 1, 0.2313726, 1,
-0.3226556, -1.606317, -1.340106, 0, 1, 0.2392157, 1,
-0.3190128, 1.259755, -0.2443537, 0, 1, 0.2431373, 1,
-0.3086201, -0.3216639, -3.224534, 0, 1, 0.2509804, 1,
-0.3080333, 3.45743, -1.732767, 0, 1, 0.254902, 1,
-0.3069622, -0.4444793, -4.088534, 0, 1, 0.2627451, 1,
-0.3065186, -2.030397, -4.689033, 0, 1, 0.2666667, 1,
-0.3030386, 1.233981, 1.011675, 0, 1, 0.2745098, 1,
-0.3025057, 0.1653605, -1.9367, 0, 1, 0.2784314, 1,
-0.286036, -0.1000333, -1.6649, 0, 1, 0.2862745, 1,
-0.283983, -0.2798824, -2.49954, 0, 1, 0.2901961, 1,
-0.2817951, 1.029587, -0.1755701, 0, 1, 0.2980392, 1,
-0.2814072, 0.04901515, -0.0164803, 0, 1, 0.3058824, 1,
-0.2789197, 0.9550039, 0.7353408, 0, 1, 0.3098039, 1,
-0.2703216, -0.184343, -2.754117, 0, 1, 0.3176471, 1,
-0.2687284, -0.1954468, -1.875718, 0, 1, 0.3215686, 1,
-0.2680551, 1.469956, 0.5566617, 0, 1, 0.3294118, 1,
-0.2679192, 0.4666668, -0.1841463, 0, 1, 0.3333333, 1,
-0.2669814, 1.331966, 0.07866372, 0, 1, 0.3411765, 1,
-0.2632931, 0.006156879, -0.669715, 0, 1, 0.345098, 1,
-0.2603197, -1.313138, -3.344889, 0, 1, 0.3529412, 1,
-0.2601103, 0.5643886, 0.288629, 0, 1, 0.3568628, 1,
-0.2595133, -0.5768082, -3.947786, 0, 1, 0.3647059, 1,
-0.2587747, -1.171754, -2.2658, 0, 1, 0.3686275, 1,
-0.2580162, 1.364588, 0.9148136, 0, 1, 0.3764706, 1,
-0.256196, -0.6530921, -2.936017, 0, 1, 0.3803922, 1,
-0.2546784, -0.3200774, -2.534136, 0, 1, 0.3882353, 1,
-0.2490245, -0.5277376, -3.076914, 0, 1, 0.3921569, 1,
-0.2464308, -1.976522, -2.762765, 0, 1, 0.4, 1,
-0.2416584, 0.7700281, -0.6520574, 0, 1, 0.4078431, 1,
-0.2382568, -0.5183269, -3.154042, 0, 1, 0.4117647, 1,
-0.236241, 1.509138, -0.1064024, 0, 1, 0.4196078, 1,
-0.2319308, 0.318412, 0.917668, 0, 1, 0.4235294, 1,
-0.2305342, 1.844268, 1.692353, 0, 1, 0.4313726, 1,
-0.2226585, -0.6482027, -2.656976, 0, 1, 0.4352941, 1,
-0.2222515, 1.230935, -0.6252218, 0, 1, 0.4431373, 1,
-0.2201933, -1.064016, -3.125103, 0, 1, 0.4470588, 1,
-0.2192651, -0.7556207, -0.7467651, 0, 1, 0.454902, 1,
-0.2186849, -0.5676351, -3.441502, 0, 1, 0.4588235, 1,
-0.2179572, 2.266525, 1.421976, 0, 1, 0.4666667, 1,
-0.2152979, 2.662997, 0.6894091, 0, 1, 0.4705882, 1,
-0.2152655, 0.1308662, -1.175728, 0, 1, 0.4784314, 1,
-0.2145382, -0.1934176, -1.788177, 0, 1, 0.4823529, 1,
-0.2137321, -1.818781, -4.425703, 0, 1, 0.4901961, 1,
-0.2095042, -0.2193511, -0.4716474, 0, 1, 0.4941176, 1,
-0.2026955, -1.043736, -2.473208, 0, 1, 0.5019608, 1,
-0.1989368, 0.2302628, 0.6259428, 0, 1, 0.509804, 1,
-0.1969469, 2.487393, 0.400974, 0, 1, 0.5137255, 1,
-0.1939976, 0.969537, 1.166056, 0, 1, 0.5215687, 1,
-0.1902039, -0.5731957, -4.453017, 0, 1, 0.5254902, 1,
-0.1896093, -0.049908, -1.496375, 0, 1, 0.5333334, 1,
-0.18799, -0.7811242, -3.020063, 0, 1, 0.5372549, 1,
-0.1877438, -1.30981, -2.850687, 0, 1, 0.5450981, 1,
-0.1865028, -0.1526876, -1.942709, 0, 1, 0.5490196, 1,
-0.1850806, -1.093265, -4.655684, 0, 1, 0.5568628, 1,
-0.1812872, -0.3542851, -3.75362, 0, 1, 0.5607843, 1,
-0.1800507, -0.4488104, -2.518215, 0, 1, 0.5686275, 1,
-0.1767078, 0.09727799, -2.495764, 0, 1, 0.572549, 1,
-0.175769, -0.6609595, -2.468343, 0, 1, 0.5803922, 1,
-0.1700896, -0.8593929, -2.61319, 0, 1, 0.5843138, 1,
-0.1698043, -1.020772, -2.811631, 0, 1, 0.5921569, 1,
-0.1604958, 1.334976, -0.3942159, 0, 1, 0.5960785, 1,
-0.1564875, -0.8974231, -3.546884, 0, 1, 0.6039216, 1,
-0.1510898, -0.2324685, -2.350666, 0, 1, 0.6117647, 1,
-0.1493779, 2.263637, -1.776028, 0, 1, 0.6156863, 1,
-0.136566, -0.01748279, -1.760183, 0, 1, 0.6235294, 1,
-0.1355189, 0.8755457, 1.702935, 0, 1, 0.627451, 1,
-0.1325501, 0.5800705, -1.429374, 0, 1, 0.6352941, 1,
-0.1325306, 0.905807, -0.4031919, 0, 1, 0.6392157, 1,
-0.1295916, -0.1879294, -3.20542, 0, 1, 0.6470588, 1,
-0.1263004, 0.2100304, 1.679563, 0, 1, 0.6509804, 1,
-0.1260527, 0.6236308, 0.5037355, 0, 1, 0.6588235, 1,
-0.1226824, 0.6568733, -0.5798845, 0, 1, 0.6627451, 1,
-0.1205417, -0.9221501, -4.421299, 0, 1, 0.6705883, 1,
-0.1195386, -0.8252822, -1.758785, 0, 1, 0.6745098, 1,
-0.1158662, -0.6175094, -4.073744, 0, 1, 0.682353, 1,
-0.1129382, -1.075762, -2.804463, 0, 1, 0.6862745, 1,
-0.1085163, 1.874985, -0.5447285, 0, 1, 0.6941177, 1,
-0.1056933, -0.9930754, -0.7027961, 0, 1, 0.7019608, 1,
-0.1055172, -0.5902422, -3.580718, 0, 1, 0.7058824, 1,
-0.103215, 1.090876, -0.894998, 0, 1, 0.7137255, 1,
-0.1021546, 1.248258, -1.16287, 0, 1, 0.7176471, 1,
-0.09693837, 1.417809, -0.9170898, 0, 1, 0.7254902, 1,
-0.09465162, 0.4635813, 0.5883619, 0, 1, 0.7294118, 1,
-0.09158254, -0.4523888, -3.586448, 0, 1, 0.7372549, 1,
-0.09136944, -0.1988227, -2.111509, 0, 1, 0.7411765, 1,
-0.07902368, -0.8246898, -2.296984, 0, 1, 0.7490196, 1,
-0.07482573, -0.1352809, -3.104693, 0, 1, 0.7529412, 1,
-0.06806526, 0.3449219, 0.865249, 0, 1, 0.7607843, 1,
-0.06486711, -0.6439038, -1.609105, 0, 1, 0.7647059, 1,
-0.06349603, 1.332681, -0.9247785, 0, 1, 0.772549, 1,
-0.06327477, -0.2379993, -3.29792, 0, 1, 0.7764706, 1,
-0.06094333, -0.8244621, -4.523604, 0, 1, 0.7843137, 1,
-0.06029138, -1.493223, -2.292023, 0, 1, 0.7882353, 1,
-0.06005459, -0.210304, -2.596768, 0, 1, 0.7960784, 1,
-0.05980045, 0.4660823, 1.130605, 0, 1, 0.8039216, 1,
-0.0583649, 1.531027, -0.4536421, 0, 1, 0.8078431, 1,
-0.05615455, -0.3279031, -3.649223, 0, 1, 0.8156863, 1,
-0.04999506, -0.875701, -2.795043, 0, 1, 0.8196079, 1,
-0.04808758, 0.1818346, -0.3980108, 0, 1, 0.827451, 1,
-0.04282543, -0.156692, -3.695503, 0, 1, 0.8313726, 1,
-0.04131515, 2.295644, 0.373427, 0, 1, 0.8392157, 1,
-0.04084897, 0.3412414, 0.5213726, 0, 1, 0.8431373, 1,
-0.03656003, -0.3496692, -5.610049, 0, 1, 0.8509804, 1,
-0.03352045, -0.01252687, -1.641081, 0, 1, 0.854902, 1,
-0.03309429, 0.1391456, -1.085194, 0, 1, 0.8627451, 1,
-0.0194869, -0.4480671, -2.907287, 0, 1, 0.8666667, 1,
-0.01782236, -1.903229, -3.168164, 0, 1, 0.8745098, 1,
-0.01729031, -1.080881, -3.522715, 0, 1, 0.8784314, 1,
-0.0154719, 0.6470931, 1.240977, 0, 1, 0.8862745, 1,
-0.007858125, 1.386638, 0.1410195, 0, 1, 0.8901961, 1,
-0.006083825, 0.8586769, -1.455396, 0, 1, 0.8980392, 1,
-0.002025913, 0.4465691, 1.117102, 0, 1, 0.9058824, 1,
-0.001483334, -1.106167, -2.164702, 0, 1, 0.9098039, 1,
0.000759106, -0.2566045, 2.761158, 0, 1, 0.9176471, 1,
0.006628088, 0.6404233, -0.2508027, 0, 1, 0.9215686, 1,
0.009941846, 0.02626087, 0.3216607, 0, 1, 0.9294118, 1,
0.009984124, -1.100471, 2.721834, 0, 1, 0.9333333, 1,
0.01254808, 1.03128, 0.7868604, 0, 1, 0.9411765, 1,
0.01578846, -0.07721361, 1.899779, 0, 1, 0.945098, 1,
0.01928715, 0.6113746, 0.3989152, 0, 1, 0.9529412, 1,
0.02194863, 0.9943414, 1.646463, 0, 1, 0.9568627, 1,
0.02294086, 0.07781824, -1.642095, 0, 1, 0.9647059, 1,
0.02933341, -1.264013, 4.022265, 0, 1, 0.9686275, 1,
0.02936189, -0.2531008, 3.675265, 0, 1, 0.9764706, 1,
0.03130686, -1.282982, 4.427078, 0, 1, 0.9803922, 1,
0.03137979, 1.414353, -0.5762215, 0, 1, 0.9882353, 1,
0.0320399, 0.4027815, -0.3851643, 0, 1, 0.9921569, 1,
0.032206, 1.141643, -0.5743005, 0, 1, 1, 1,
0.03239325, 2.749264, 0.445927, 0, 0.9921569, 1, 1,
0.03337836, 0.4502902, 2.09317, 0, 0.9882353, 1, 1,
0.03394974, 0.3963831, 0.003480421, 0, 0.9803922, 1, 1,
0.03667533, -1.758275, 3.608268, 0, 0.9764706, 1, 1,
0.0401636, -0.501458, 1.867605, 0, 0.9686275, 1, 1,
0.04244472, -0.1131028, 2.92114, 0, 0.9647059, 1, 1,
0.04481845, -0.2301874, 4.556062, 0, 0.9568627, 1, 1,
0.05001289, -0.6921043, 3.914602, 0, 0.9529412, 1, 1,
0.05250296, -0.7812678, 2.358345, 0, 0.945098, 1, 1,
0.05327266, 0.6844747, 1.510918, 0, 0.9411765, 1, 1,
0.05470625, 0.793835, -0.01024836, 0, 0.9333333, 1, 1,
0.06454141, -0.3125148, 2.129117, 0, 0.9294118, 1, 1,
0.06753028, -0.9417165, 2.777589, 0, 0.9215686, 1, 1,
0.0687639, 0.4824883, 0.9047054, 0, 0.9176471, 1, 1,
0.06940947, 1.068908, 1.676358, 0, 0.9098039, 1, 1,
0.07032899, 1.387052, -0.1738497, 0, 0.9058824, 1, 1,
0.07049241, -1.016407, 3.875152, 0, 0.8980392, 1, 1,
0.07401235, 0.853025, -0.8827537, 0, 0.8901961, 1, 1,
0.09047817, 0.1894297, 1.056107, 0, 0.8862745, 1, 1,
0.09124424, -1.496738, 3.551555, 0, 0.8784314, 1, 1,
0.09131861, -0.09810669, 1.43066, 0, 0.8745098, 1, 1,
0.09381802, -1.385961, 3.159796, 0, 0.8666667, 1, 1,
0.09447235, -0.4090354, 3.713096, 0, 0.8627451, 1, 1,
0.09528949, -0.2894908, 2.982878, 0, 0.854902, 1, 1,
0.09590013, 1.288089, 1.283567, 0, 0.8509804, 1, 1,
0.09908424, 1.021074, 0.3174188, 0, 0.8431373, 1, 1,
0.09947668, -1.338886, 2.052629, 0, 0.8392157, 1, 1,
0.1037693, -1.107887, 2.609305, 0, 0.8313726, 1, 1,
0.1047361, -0.6026062, 4.029188, 0, 0.827451, 1, 1,
0.1048791, 0.1879362, -0.3215712, 0, 0.8196079, 1, 1,
0.105846, -0.4585017, 2.975725, 0, 0.8156863, 1, 1,
0.1073935, -0.8490104, 5.008523, 0, 0.8078431, 1, 1,
0.1077496, 0.961217, -0.2834091, 0, 0.8039216, 1, 1,
0.1084372, -1.262034, 3.37826, 0, 0.7960784, 1, 1,
0.1099387, 0.2557009, 1.295415, 0, 0.7882353, 1, 1,
0.1105917, 0.7213478, -0.7337494, 0, 0.7843137, 1, 1,
0.1184325, 0.8932962, 0.9049343, 0, 0.7764706, 1, 1,
0.1203053, 1.351906, -1.164041, 0, 0.772549, 1, 1,
0.1248609, 0.5088965, 1.861575, 0, 0.7647059, 1, 1,
0.1258917, -0.9350629, 2.308573, 0, 0.7607843, 1, 1,
0.1265276, 0.3262548, 1.1995, 0, 0.7529412, 1, 1,
0.1320125, -0.1574856, 3.027383, 0, 0.7490196, 1, 1,
0.1336237, -1.261316, 5.200309, 0, 0.7411765, 1, 1,
0.1460417, -0.8894083, 1.898296, 0, 0.7372549, 1, 1,
0.1491994, 0.6977268, 0.09879611, 0, 0.7294118, 1, 1,
0.150204, -0.640547, 2.394053, 0, 0.7254902, 1, 1,
0.1530285, -0.004731306, 2.652575, 0, 0.7176471, 1, 1,
0.1530713, -1.64996, 4.884775, 0, 0.7137255, 1, 1,
0.1544878, -0.1856101, 1.212409, 0, 0.7058824, 1, 1,
0.159356, -2.14451, 0.9288593, 0, 0.6980392, 1, 1,
0.1649595, 0.5353647, 0.4579579, 0, 0.6941177, 1, 1,
0.1650774, -0.07094076, 3.99822, 0, 0.6862745, 1, 1,
0.1655006, -1.487659, 3.457416, 0, 0.682353, 1, 1,
0.1747525, 0.5605473, 0.8721301, 0, 0.6745098, 1, 1,
0.1763537, 1.562277, 0.4156545, 0, 0.6705883, 1, 1,
0.1788945, -0.5972109, 2.247289, 0, 0.6627451, 1, 1,
0.1802062, 0.1999336, 0.5903087, 0, 0.6588235, 1, 1,
0.1828196, 1.176846, 0.06240397, 0, 0.6509804, 1, 1,
0.1842294, 0.8500323, 1.152198, 0, 0.6470588, 1, 1,
0.1845179, -0.4788497, 3.9612, 0, 0.6392157, 1, 1,
0.1850695, -0.2349177, 2.848713, 0, 0.6352941, 1, 1,
0.190885, -2.191285, 3.497521, 0, 0.627451, 1, 1,
0.1938353, 0.5221531, 0.3834736, 0, 0.6235294, 1, 1,
0.1951472, 1.70148, -0.7596973, 0, 0.6156863, 1, 1,
0.201297, -0.8434204, 1.053288, 0, 0.6117647, 1, 1,
0.2015777, 1.021012, 1.428165, 0, 0.6039216, 1, 1,
0.2029912, 1.508065, 0.241612, 0, 0.5960785, 1, 1,
0.2101915, -0.3292687, 2.548955, 0, 0.5921569, 1, 1,
0.2138735, 0.3779456, 0.2280956, 0, 0.5843138, 1, 1,
0.2144918, -0.985822, 2.435484, 0, 0.5803922, 1, 1,
0.2150421, 0.1015389, 1.524408, 0, 0.572549, 1, 1,
0.2170259, -0.2266306, 2.93672, 0, 0.5686275, 1, 1,
0.2170578, 0.4001388, -1.022978, 0, 0.5607843, 1, 1,
0.2182856, 0.8476645, 1.536503, 0, 0.5568628, 1, 1,
0.2185376, -0.1705522, 1.516766, 0, 0.5490196, 1, 1,
0.2187902, 0.6646398, 0.474572, 0, 0.5450981, 1, 1,
0.2195475, 2.070928, 0.9607996, 0, 0.5372549, 1, 1,
0.2199923, -0.3092314, 1.64068, 0, 0.5333334, 1, 1,
0.2228732, -0.1991083, 2.137403, 0, 0.5254902, 1, 1,
0.2268285, -0.2171184, 3.262294, 0, 0.5215687, 1, 1,
0.2271227, 0.9296585, 1.264431, 0, 0.5137255, 1, 1,
0.2286088, -0.5958607, 0.6729769, 0, 0.509804, 1, 1,
0.2305149, 0.4995115, -1.02545, 0, 0.5019608, 1, 1,
0.2322135, -1.0238, 2.784827, 0, 0.4941176, 1, 1,
0.2383538, 1.363856, -0.861967, 0, 0.4901961, 1, 1,
0.2426038, -1.162582, 2.610706, 0, 0.4823529, 1, 1,
0.2426582, -0.5125899, 1.771729, 0, 0.4784314, 1, 1,
0.244282, -0.5858766, 2.265588, 0, 0.4705882, 1, 1,
0.2452524, 0.2481367, 0.1523472, 0, 0.4666667, 1, 1,
0.2453729, 0.3917892, 0.5673441, 0, 0.4588235, 1, 1,
0.2454276, -0.4605295, 2.765183, 0, 0.454902, 1, 1,
0.2525848, -0.28012, 3.867551, 0, 0.4470588, 1, 1,
0.253586, 0.4777888, 0.1748021, 0, 0.4431373, 1, 1,
0.2558075, 0.1588056, 0.6769289, 0, 0.4352941, 1, 1,
0.2558959, 1.818275, -0.1848944, 0, 0.4313726, 1, 1,
0.2580711, 0.6051822, 2.507395, 0, 0.4235294, 1, 1,
0.2585359, 0.1869097, -0.2990652, 0, 0.4196078, 1, 1,
0.261334, -0.7060248, 4.28777, 0, 0.4117647, 1, 1,
0.2628188, 1.089612, -0.3814951, 0, 0.4078431, 1, 1,
0.2635537, 0.2442258, -0.2621316, 0, 0.4, 1, 1,
0.2639236, -0.8540503, 2.573787, 0, 0.3921569, 1, 1,
0.2710406, -0.2321375, 2.543133, 0, 0.3882353, 1, 1,
0.2747741, -0.8744652, 4.042122, 0, 0.3803922, 1, 1,
0.2765336, 0.2801603, -1.001376, 0, 0.3764706, 1, 1,
0.2778946, 0.1845531, 1.587602, 0, 0.3686275, 1, 1,
0.2785467, 1.43607, -0.1781225, 0, 0.3647059, 1, 1,
0.2791765, -1.105471, 3.438009, 0, 0.3568628, 1, 1,
0.281153, -0.4027491, 2.863525, 0, 0.3529412, 1, 1,
0.2815883, 1.658807, 0.04421971, 0, 0.345098, 1, 1,
0.2818576, -0.4255767, 2.786622, 0, 0.3411765, 1, 1,
0.285958, -0.6167017, 2.486874, 0, 0.3333333, 1, 1,
0.2878149, -1.011706, 3.97586, 0, 0.3294118, 1, 1,
0.291004, 0.1094951, -0.3663726, 0, 0.3215686, 1, 1,
0.292399, 0.7945222, 0.9330669, 0, 0.3176471, 1, 1,
0.2944148, 0.03331516, 1.445297, 0, 0.3098039, 1, 1,
0.2982842, 0.1301511, 1.362937, 0, 0.3058824, 1, 1,
0.300352, -0.07935344, 1.374369, 0, 0.2980392, 1, 1,
0.3011149, -0.2038281, 3.85254, 0, 0.2901961, 1, 1,
0.3013765, 0.2770025, -0.1161257, 0, 0.2862745, 1, 1,
0.3048238, -0.1182356, -1.333329, 0, 0.2784314, 1, 1,
0.3053731, -1.018501, 0.9128703, 0, 0.2745098, 1, 1,
0.305969, -1.403434, 3.897178, 0, 0.2666667, 1, 1,
0.3060497, -0.6763229, 2.802471, 0, 0.2627451, 1, 1,
0.3077843, 1.754589, 1.275771, 0, 0.254902, 1, 1,
0.31067, -1.335248, 2.50837, 0, 0.2509804, 1, 1,
0.3128166, -1.277602, 2.927838, 0, 0.2431373, 1, 1,
0.3129099, -0.1918086, 2.063474, 0, 0.2392157, 1, 1,
0.31646, 0.1296315, 2.638454, 0, 0.2313726, 1, 1,
0.3174603, 0.5155329, -0.2948855, 0, 0.227451, 1, 1,
0.3196425, -0.3224722, 3.435536, 0, 0.2196078, 1, 1,
0.3247832, 0.2855545, 2.52176, 0, 0.2156863, 1, 1,
0.326737, 2.025623, 0.494053, 0, 0.2078431, 1, 1,
0.3345446, -0.6617367, 4.664434, 0, 0.2039216, 1, 1,
0.3364112, 1.334132, 1.220013, 0, 0.1960784, 1, 1,
0.3381177, -0.5858912, 1.78003, 0, 0.1882353, 1, 1,
0.3394437, -0.5464487, 2.247801, 0, 0.1843137, 1, 1,
0.3420933, 0.6401207, -0.07592289, 0, 0.1764706, 1, 1,
0.3447221, -0.1853569, 0.3986344, 0, 0.172549, 1, 1,
0.3473896, 0.1856463, 0.1831616, 0, 0.1647059, 1, 1,
0.3481045, -0.6066636, 1.62504, 0, 0.1607843, 1, 1,
0.3501045, -0.3436173, 2.257097, 0, 0.1529412, 1, 1,
0.3509513, 0.1635083, 1.711756, 0, 0.1490196, 1, 1,
0.3511063, 0.5383654, -0.2834914, 0, 0.1411765, 1, 1,
0.3519449, -1.271462, 2.944324, 0, 0.1372549, 1, 1,
0.3521303, 0.6237192, 1.017246, 0, 0.1294118, 1, 1,
0.3578864, 1.070369, -0.5703213, 0, 0.1254902, 1, 1,
0.3590658, 0.2471652, 1.085452, 0, 0.1176471, 1, 1,
0.3738887, 0.1619741, 0.5529634, 0, 0.1137255, 1, 1,
0.3741785, -0.785138, 3.183525, 0, 0.1058824, 1, 1,
0.3752961, -0.1366662, 2.444821, 0, 0.09803922, 1, 1,
0.3758634, 3.210974, 0.3432866, 0, 0.09411765, 1, 1,
0.3809783, 0.6972762, -0.6398281, 0, 0.08627451, 1, 1,
0.3890384, -0.9740745, 2.326313, 0, 0.08235294, 1, 1,
0.3914809, -0.3571529, 2.693848, 0, 0.07450981, 1, 1,
0.3921872, 2.186409, -1.007807, 0, 0.07058824, 1, 1,
0.3941727, -0.3583029, 0.57489, 0, 0.0627451, 1, 1,
0.3977771, -1.560047, 2.912563, 0, 0.05882353, 1, 1,
0.3978837, -0.1786943, 1.094711, 0, 0.05098039, 1, 1,
0.3987822, -0.7809789, 2.279489, 0, 0.04705882, 1, 1,
0.403235, 0.02737698, 0.9287241, 0, 0.03921569, 1, 1,
0.4033288, 0.1687276, -0.182737, 0, 0.03529412, 1, 1,
0.4056182, -0.6734522, 2.781317, 0, 0.02745098, 1, 1,
0.4067135, 0.5188951, -0.02868385, 0, 0.02352941, 1, 1,
0.4069788, -0.6964153, 1.107738, 0, 0.01568628, 1, 1,
0.4091433, -1.411375, 3.521252, 0, 0.01176471, 1, 1,
0.4105119, 2.44825, 1.004848, 0, 0.003921569, 1, 1,
0.4130781, -2.478248, 1.853172, 0.003921569, 0, 1, 1,
0.4198511, -0.5524026, 0.5227421, 0.007843138, 0, 1, 1,
0.4245966, 0.3935633, 0.9126658, 0.01568628, 0, 1, 1,
0.4307502, -0.476902, 3.423956, 0.01960784, 0, 1, 1,
0.4356313, 0.3117742, 2.297062, 0.02745098, 0, 1, 1,
0.4361858, 1.15427, 0.394562, 0.03137255, 0, 1, 1,
0.4413003, 0.7576505, 0.08058099, 0.03921569, 0, 1, 1,
0.4422667, 0.1016977, 1.588375, 0.04313726, 0, 1, 1,
0.442542, 0.3149074, 1.120439, 0.05098039, 0, 1, 1,
0.4465285, 1.572904, -0.2186031, 0.05490196, 0, 1, 1,
0.4469958, 1.536216, 0.7059487, 0.0627451, 0, 1, 1,
0.4471881, -0.5838366, 2.135355, 0.06666667, 0, 1, 1,
0.4587792, -0.3532928, 2.858996, 0.07450981, 0, 1, 1,
0.4590513, 0.6917388, 1.309356, 0.07843138, 0, 1, 1,
0.463205, 1.332161, 1.025838, 0.08627451, 0, 1, 1,
0.4655577, -0.6081899, 0.5882254, 0.09019608, 0, 1, 1,
0.4705735, -0.3612728, -0.1080367, 0.09803922, 0, 1, 1,
0.4710683, 1.00807, 0.2919251, 0.1058824, 0, 1, 1,
0.4718205, 1.236883, 0.7179818, 0.1098039, 0, 1, 1,
0.4720589, -0.6370719, 2.210572, 0.1176471, 0, 1, 1,
0.4810894, 0.7101343, -0.1845854, 0.1215686, 0, 1, 1,
0.4855162, -0.02762789, 1.384463, 0.1294118, 0, 1, 1,
0.4906253, -1.989338, 1.336081, 0.1333333, 0, 1, 1,
0.4914529, -1.309986, 5.137529, 0.1411765, 0, 1, 1,
0.4995254, 1.181599, 0.6627245, 0.145098, 0, 1, 1,
0.5018322, 0.4644673, 0.40789, 0.1529412, 0, 1, 1,
0.5088282, 0.7669333, 0.5996736, 0.1568628, 0, 1, 1,
0.511373, -0.1160793, 1.619865, 0.1647059, 0, 1, 1,
0.5138607, 0.7425743, 1.089087, 0.1686275, 0, 1, 1,
0.5150145, -0.8303522, 1.514217, 0.1764706, 0, 1, 1,
0.5228453, 1.088567, -0.7241002, 0.1803922, 0, 1, 1,
0.524198, 0.6220222, 0.493425, 0.1882353, 0, 1, 1,
0.5250423, 0.2069675, 0.7754477, 0.1921569, 0, 1, 1,
0.5254387, -1.099784, 2.430012, 0.2, 0, 1, 1,
0.5261415, 0.5761819, 2.439104, 0.2078431, 0, 1, 1,
0.5274893, 0.2668869, 2.427823, 0.2117647, 0, 1, 1,
0.529593, -0.1262666, 2.806149, 0.2196078, 0, 1, 1,
0.5309312, -0.3930786, 2.177564, 0.2235294, 0, 1, 1,
0.5511577, -0.2048188, 2.473391, 0.2313726, 0, 1, 1,
0.5569856, -2.125879, 3.650871, 0.2352941, 0, 1, 1,
0.5594693, -0.6701183, 1.789479, 0.2431373, 0, 1, 1,
0.5603014, 0.7487456, 1.96321, 0.2470588, 0, 1, 1,
0.5629886, 0.5781816, 0.01673937, 0.254902, 0, 1, 1,
0.5638108, 0.4995658, -0.3226491, 0.2588235, 0, 1, 1,
0.5664367, -0.8378444, 4.502274, 0.2666667, 0, 1, 1,
0.5722886, -0.03321778, 2.061039, 0.2705882, 0, 1, 1,
0.574248, -0.4311039, 1.622468, 0.2784314, 0, 1, 1,
0.5789312, 0.3742775, -0.5975476, 0.282353, 0, 1, 1,
0.5794542, 1.324933, 0.7538437, 0.2901961, 0, 1, 1,
0.5808123, 0.760471, -0.4697575, 0.2941177, 0, 1, 1,
0.581904, -0.2549216, 2.578618, 0.3019608, 0, 1, 1,
0.585076, -0.7662919, 0.8114106, 0.3098039, 0, 1, 1,
0.5853725, 0.7003633, -1.476063, 0.3137255, 0, 1, 1,
0.587227, 0.3307427, 1.448034, 0.3215686, 0, 1, 1,
0.593288, -0.6325523, 2.14605, 0.3254902, 0, 1, 1,
0.596731, -0.7830425, 2.068897, 0.3333333, 0, 1, 1,
0.5986863, -1.683134, 2.85373, 0.3372549, 0, 1, 1,
0.6015162, -0.05773596, 1.152848, 0.345098, 0, 1, 1,
0.614235, -1.572208, 2.662783, 0.3490196, 0, 1, 1,
0.6157508, 0.2056016, 2.405639, 0.3568628, 0, 1, 1,
0.6161372, -0.2016589, 1.327462, 0.3607843, 0, 1, 1,
0.6168299, 0.3704582, 0.8092999, 0.3686275, 0, 1, 1,
0.6209367, -1.266772, 2.424841, 0.372549, 0, 1, 1,
0.6224148, 0.6423827, 1.670721, 0.3803922, 0, 1, 1,
0.6234766, -2.127478, 3.510144, 0.3843137, 0, 1, 1,
0.6254401, -0.9064817, 2.723059, 0.3921569, 0, 1, 1,
0.6256999, 0.8910587, 1.843824, 0.3960784, 0, 1, 1,
0.63749, 0.2017382, 0.3068544, 0.4039216, 0, 1, 1,
0.6403493, -0.4225962, 0.1193294, 0.4117647, 0, 1, 1,
0.6430294, -1.011018, 3.086814, 0.4156863, 0, 1, 1,
0.6495257, 1.622851, 1.324487, 0.4235294, 0, 1, 1,
0.6500062, 1.136595, 0.4264819, 0.427451, 0, 1, 1,
0.6558993, 0.5301099, -0.4665097, 0.4352941, 0, 1, 1,
0.6568975, 0.6676946, -1.93045, 0.4392157, 0, 1, 1,
0.6650352, -3.94537, 2.991629, 0.4470588, 0, 1, 1,
0.6659231, 0.7528167, -0.06395999, 0.4509804, 0, 1, 1,
0.6682689, -0.2631638, 2.321585, 0.4588235, 0, 1, 1,
0.6687802, -0.2379786, 1.010308, 0.4627451, 0, 1, 1,
0.6718325, -0.8269901, 1.614503, 0.4705882, 0, 1, 1,
0.675511, -0.6570124, 2.509822, 0.4745098, 0, 1, 1,
0.6780461, -1.198337, 3.043011, 0.4823529, 0, 1, 1,
0.6839035, 0.5704517, 0.09209037, 0.4862745, 0, 1, 1,
0.6870385, 1.128521, 2.502853, 0.4941176, 0, 1, 1,
0.6921818, -0.5507447, 2.064944, 0.5019608, 0, 1, 1,
0.6969407, 1.33225, 2.164263, 0.5058824, 0, 1, 1,
0.7004794, 0.05882391, -0.3052808, 0.5137255, 0, 1, 1,
0.7049843, 0.5283268, 1.362132, 0.5176471, 0, 1, 1,
0.7158473, 0.3434654, 1.627522, 0.5254902, 0, 1, 1,
0.7185368, -0.01644478, 2.716329, 0.5294118, 0, 1, 1,
0.7218989, -0.7946522, 2.07088, 0.5372549, 0, 1, 1,
0.722303, 0.6316181, 0.5735604, 0.5411765, 0, 1, 1,
0.7241037, 0.5981839, 0.7034376, 0.5490196, 0, 1, 1,
0.7320268, -0.5506926, 0.1130196, 0.5529412, 0, 1, 1,
0.7351686, -0.04731672, 2.113497, 0.5607843, 0, 1, 1,
0.7435378, -1.152751, 2.432608, 0.5647059, 0, 1, 1,
0.7475139, -0.814132, 2.697743, 0.572549, 0, 1, 1,
0.7580318, 1.269095, 0.8638808, 0.5764706, 0, 1, 1,
0.764833, -0.8463584, 1.307651, 0.5843138, 0, 1, 1,
0.7669445, -0.4475542, 1.174001, 0.5882353, 0, 1, 1,
0.7683395, 0.8580589, 1.620797, 0.5960785, 0, 1, 1,
0.7724144, -0.2317916, 1.91927, 0.6039216, 0, 1, 1,
0.7736996, 0.6908491, 1.332209, 0.6078432, 0, 1, 1,
0.7742003, -1.287626, 1.843006, 0.6156863, 0, 1, 1,
0.7782002, 1.193982, 1.020938, 0.6196079, 0, 1, 1,
0.779234, -0.8354436, 3.984864, 0.627451, 0, 1, 1,
0.7887412, -0.5000288, 1.453489, 0.6313726, 0, 1, 1,
0.7922339, 0.3685165, 1.180092, 0.6392157, 0, 1, 1,
0.7950506, 0.08729456, 3.603462, 0.6431373, 0, 1, 1,
0.7958727, -1.104082, 2.590807, 0.6509804, 0, 1, 1,
0.8031319, 1.289144, 0.1031154, 0.654902, 0, 1, 1,
0.8059732, 0.8096468, 1.178934, 0.6627451, 0, 1, 1,
0.8118936, 0.8755904, 1.323095, 0.6666667, 0, 1, 1,
0.816691, 0.5139033, 1.793702, 0.6745098, 0, 1, 1,
0.8210763, -0.4894473, 2.779263, 0.6784314, 0, 1, 1,
0.8285757, 1.480647, 2.320075, 0.6862745, 0, 1, 1,
0.8334473, -1.429507, 2.574119, 0.6901961, 0, 1, 1,
0.8335807, 2.378017, -0.4807363, 0.6980392, 0, 1, 1,
0.8343117, 0.4572673, 1.924076, 0.7058824, 0, 1, 1,
0.8349729, 0.4942591, 1.350236, 0.7098039, 0, 1, 1,
0.8396299, -0.2595091, 4.136533, 0.7176471, 0, 1, 1,
0.8408081, 0.737586, 2.93494, 0.7215686, 0, 1, 1,
0.8516704, -1.113719, 2.213435, 0.7294118, 0, 1, 1,
0.8573296, -0.3627315, 4.036923, 0.7333333, 0, 1, 1,
0.8576245, -0.568309, 0.2327397, 0.7411765, 0, 1, 1,
0.8643606, -0.2757705, 2.235766, 0.7450981, 0, 1, 1,
0.8683612, 0.2779245, 2.151791, 0.7529412, 0, 1, 1,
0.871483, 0.8508584, 2.205406, 0.7568628, 0, 1, 1,
0.8727469, -0.159463, 1.191789, 0.7647059, 0, 1, 1,
0.8787416, 1.531611, 0.7185365, 0.7686275, 0, 1, 1,
0.881373, -0.9909116, 2.627524, 0.7764706, 0, 1, 1,
0.8859869, 0.9054583, 3.132524, 0.7803922, 0, 1, 1,
0.8876222, -0.8228962, 0.7684178, 0.7882353, 0, 1, 1,
0.8906584, 0.1467368, 0.2397826, 0.7921569, 0, 1, 1,
0.8939907, 0.3897292, 1.351275, 0.8, 0, 1, 1,
0.9004109, -1.545095, 2.500222, 0.8078431, 0, 1, 1,
0.9007316, 1.132016, 0.3071645, 0.8117647, 0, 1, 1,
0.9012015, 0.2579763, 0.05531192, 0.8196079, 0, 1, 1,
0.902207, -0.8980032, 2.937395, 0.8235294, 0, 1, 1,
0.9045774, -2.161795, 3.111394, 0.8313726, 0, 1, 1,
0.9123687, -1.598906, 2.717631, 0.8352941, 0, 1, 1,
0.914111, 0.2670996, 1.643516, 0.8431373, 0, 1, 1,
0.9150909, 0.2816756, -0.4421822, 0.8470588, 0, 1, 1,
0.9154177, 0.2216938, 1.46995, 0.854902, 0, 1, 1,
0.916438, 0.6181909, -0.0970019, 0.8588235, 0, 1, 1,
0.9168842, 1.960203, -1.040864, 0.8666667, 0, 1, 1,
0.9194198, -0.2969184, 1.35898, 0.8705882, 0, 1, 1,
0.9236571, -0.3463449, 2.532359, 0.8784314, 0, 1, 1,
0.9363661, 0.07657443, 2.647202, 0.8823529, 0, 1, 1,
0.9397027, -1.537869, 5.203361, 0.8901961, 0, 1, 1,
0.9401929, -0.5492379, 4.567779, 0.8941177, 0, 1, 1,
0.9465956, 0.4582298, 3.298265, 0.9019608, 0, 1, 1,
0.9636775, -0.4001162, 1.419829, 0.9098039, 0, 1, 1,
0.976136, -0.3600115, -0.5019084, 0.9137255, 0, 1, 1,
0.9763311, -1.942303, 1.776109, 0.9215686, 0, 1, 1,
0.9765787, -0.948322, 2.078559, 0.9254902, 0, 1, 1,
0.9775774, -0.7084916, 2.734434, 0.9333333, 0, 1, 1,
0.9906715, -0.2087156, 2.58075, 0.9372549, 0, 1, 1,
0.9956387, 0.7731432, 0.5875066, 0.945098, 0, 1, 1,
0.9994753, -0.6682147, 1.246017, 0.9490196, 0, 1, 1,
1.003465, 0.8154665, 1.410188, 0.9568627, 0, 1, 1,
1.012582, -0.4639247, 3.875109, 0.9607843, 0, 1, 1,
1.016006, 0.8814214, 0.5208496, 0.9686275, 0, 1, 1,
1.017971, 1.993643, 1.128261, 0.972549, 0, 1, 1,
1.026186, -1.323912, 0.9193658, 0.9803922, 0, 1, 1,
1.026208, 0.03142123, 2.532518, 0.9843137, 0, 1, 1,
1.040971, 0.8805763, 0.7266445, 0.9921569, 0, 1, 1,
1.046661, 0.661271, 1.953019, 0.9960784, 0, 1, 1,
1.047484, -1.32501, 3.918752, 1, 0, 0.9960784, 1,
1.051264, 1.184696, 0.6909903, 1, 0, 0.9882353, 1,
1.051873, -0.07262297, 0.7375361, 1, 0, 0.9843137, 1,
1.054176, -0.5298527, 1.671864, 1, 0, 0.9764706, 1,
1.056907, 2.09516, -0.04832051, 1, 0, 0.972549, 1,
1.062139, -0.608223, 2.00452, 1, 0, 0.9647059, 1,
1.07069, -0.2225755, 2.843485, 1, 0, 0.9607843, 1,
1.072395, -0.315385, 1.05587, 1, 0, 0.9529412, 1,
1.078001, 1.180464, 3.119741, 1, 0, 0.9490196, 1,
1.082624, -0.265377, 0.931859, 1, 0, 0.9411765, 1,
1.088749, 0.3637158, -1.400094, 1, 0, 0.9372549, 1,
1.090582, 1.165716, -0.4875287, 1, 0, 0.9294118, 1,
1.091121, -1.199676, 2.60286, 1, 0, 0.9254902, 1,
1.095047, -0.5304704, 1.705621, 1, 0, 0.9176471, 1,
1.104656, 0.3851625, 1.475699, 1, 0, 0.9137255, 1,
1.106757, -0.5472077, 2.182422, 1, 0, 0.9058824, 1,
1.120319, 0.9225918, 1.152603, 1, 0, 0.9019608, 1,
1.128489, -0.8334126, 1.956795, 1, 0, 0.8941177, 1,
1.130797, 0.5590317, -0.6491433, 1, 0, 0.8862745, 1,
1.134182, -0.7814149, 2.404255, 1, 0, 0.8823529, 1,
1.134257, -0.1527389, 0.74709, 1, 0, 0.8745098, 1,
1.138065, 1.745257, -0.6717392, 1, 0, 0.8705882, 1,
1.148875, -0.9261, 2.325045, 1, 0, 0.8627451, 1,
1.156308, 0.02106448, 0.6059393, 1, 0, 0.8588235, 1,
1.171358, 0.6737262, 1.254647, 1, 0, 0.8509804, 1,
1.18805, 0.8714419, 2.974597, 1, 0, 0.8470588, 1,
1.190209, 1.391579, 2.221048, 1, 0, 0.8392157, 1,
1.194593, -1.143561, 2.811875, 1, 0, 0.8352941, 1,
1.19573, -0.1142458, 0.1074722, 1, 0, 0.827451, 1,
1.209321, -0.8940915, 2.56513, 1, 0, 0.8235294, 1,
1.215683, -0.4022993, 1.16151, 1, 0, 0.8156863, 1,
1.215748, 0.376579, 2.926558, 1, 0, 0.8117647, 1,
1.215868, -1.012677, 0.567241, 1, 0, 0.8039216, 1,
1.21651, 0.9667191, 1.156852, 1, 0, 0.7960784, 1,
1.221717, -0.1367179, 2.436587, 1, 0, 0.7921569, 1,
1.225072, 0.6673273, -0.282169, 1, 0, 0.7843137, 1,
1.229177, 0.5371786, 0.6550849, 1, 0, 0.7803922, 1,
1.230642, 1.754868, 2.708937, 1, 0, 0.772549, 1,
1.239572, -1.579966, 2.866722, 1, 0, 0.7686275, 1,
1.242763, -0.2766974, 0.8094359, 1, 0, 0.7607843, 1,
1.244369, -2.061402, 2.261687, 1, 0, 0.7568628, 1,
1.249395, 1.167849, 2.417526, 1, 0, 0.7490196, 1,
1.258265, 1.285318, 0.01680911, 1, 0, 0.7450981, 1,
1.265688, 0.1312616, 0.6828691, 1, 0, 0.7372549, 1,
1.272388, -0.1571586, 2.449046, 1, 0, 0.7333333, 1,
1.281999, -0.1570709, 0.4371423, 1, 0, 0.7254902, 1,
1.290182, -1.060989, 3.23045, 1, 0, 0.7215686, 1,
1.295761, 1.703802, 2.364891, 1, 0, 0.7137255, 1,
1.296124, -1.869244, 2.215029, 1, 0, 0.7098039, 1,
1.301475, 0.04612805, 2.810642, 1, 0, 0.7019608, 1,
1.302266, -0.0851352, 0.7618869, 1, 0, 0.6941177, 1,
1.307608, 2.050513, -0.7362683, 1, 0, 0.6901961, 1,
1.310936, 0.4543363, 0.06771169, 1, 0, 0.682353, 1,
1.316989, 0.6257566, -0.006878459, 1, 0, 0.6784314, 1,
1.319925, 0.09761146, 1.543866, 1, 0, 0.6705883, 1,
1.321842, 2.461071, -0.7215058, 1, 0, 0.6666667, 1,
1.324653, -0.7101815, 1.81962, 1, 0, 0.6588235, 1,
1.327065, 0.803314, 1.983565, 1, 0, 0.654902, 1,
1.332487, -0.1200331, 2.973136, 1, 0, 0.6470588, 1,
1.348887, 1.30438, 0.4286945, 1, 0, 0.6431373, 1,
1.371531, 1.038971, -1.16666, 1, 0, 0.6352941, 1,
1.376061, 0.1714303, 0.05190685, 1, 0, 0.6313726, 1,
1.376608, 0.1375357, 0.4706109, 1, 0, 0.6235294, 1,
1.380919, -0.7083321, 2.033773, 1, 0, 0.6196079, 1,
1.389429, -0.5018588, 4.108907, 1, 0, 0.6117647, 1,
1.392511, -0.488576, 1.987764, 1, 0, 0.6078432, 1,
1.392515, 0.9218122, 0.7205166, 1, 0, 0.6, 1,
1.407436, 0.2422391, 0.7086247, 1, 0, 0.5921569, 1,
1.410467, 0.6105934, 1.87832, 1, 0, 0.5882353, 1,
1.421915, 1.350921, 1.261032, 1, 0, 0.5803922, 1,
1.428946, -0.1319592, 2.892753, 1, 0, 0.5764706, 1,
1.431948, 0.762921, -1.285279, 1, 0, 0.5686275, 1,
1.432921, 0.2850031, 0.9541098, 1, 0, 0.5647059, 1,
1.433666, -0.6748652, 0.8538879, 1, 0, 0.5568628, 1,
1.446144, 0.585903, 1.72385, 1, 0, 0.5529412, 1,
1.450172, 2.167235, -1.789741, 1, 0, 0.5450981, 1,
1.453149, -0.2481741, 2.977317, 1, 0, 0.5411765, 1,
1.455382, 0.4987685, -0.2130337, 1, 0, 0.5333334, 1,
1.470757, -0.7955458, 2.644586, 1, 0, 0.5294118, 1,
1.490817, 0.8166206, 0.8546709, 1, 0, 0.5215687, 1,
1.492507, 1.441968, 0.2409662, 1, 0, 0.5176471, 1,
1.499874, 0.9798906, 0.175435, 1, 0, 0.509804, 1,
1.523015, -0.07249475, 1.897746, 1, 0, 0.5058824, 1,
1.523331, -0.9261029, 3.047715, 1, 0, 0.4980392, 1,
1.533429, 0.1618077, 0.7918308, 1, 0, 0.4901961, 1,
1.53384, -1.333395, 3.246717, 1, 0, 0.4862745, 1,
1.534106, 0.2104591, 1.625269, 1, 0, 0.4784314, 1,
1.539916, -0.4415949, 2.138742, 1, 0, 0.4745098, 1,
1.543762, 0.4437865, 1.58209, 1, 0, 0.4666667, 1,
1.545208, -1.448984, 0.8260276, 1, 0, 0.4627451, 1,
1.547101, 0.1115809, 0.5375865, 1, 0, 0.454902, 1,
1.551022, -0.7656532, 1.007064, 1, 0, 0.4509804, 1,
1.555633, 1.775192, 2.791219, 1, 0, 0.4431373, 1,
1.561367, -0.2088469, 2.516735, 1, 0, 0.4392157, 1,
1.564119, -0.07685526, 1.411412, 1, 0, 0.4313726, 1,
1.567154, -0.7675841, 1.308932, 1, 0, 0.427451, 1,
1.586019, -0.9820099, 1.837701, 1, 0, 0.4196078, 1,
1.599523, -0.4268781, 3.769667, 1, 0, 0.4156863, 1,
1.606812, -0.5641553, 1.60727, 1, 0, 0.4078431, 1,
1.617294, 0.7430627, 0.6165791, 1, 0, 0.4039216, 1,
1.633359, -0.6667029, 2.217111, 1, 0, 0.3960784, 1,
1.636438, -0.3023332, 1.005454, 1, 0, 0.3882353, 1,
1.637697, 0.4161912, 0.07501906, 1, 0, 0.3843137, 1,
1.641518, -0.7494059, 0.9534135, 1, 0, 0.3764706, 1,
1.643143, 0.6840887, 2.135371, 1, 0, 0.372549, 1,
1.644463, -0.9107372, 1.931466, 1, 0, 0.3647059, 1,
1.646199, -0.5121683, 2.071861, 1, 0, 0.3607843, 1,
1.647184, -0.1109271, 1.582654, 1, 0, 0.3529412, 1,
1.651874, 1.797287, 1.407628, 1, 0, 0.3490196, 1,
1.655236, -0.1359357, 2.770389, 1, 0, 0.3411765, 1,
1.655651, -0.9361535, 1.550469, 1, 0, 0.3372549, 1,
1.657418, 0.9844913, 1.784722, 1, 0, 0.3294118, 1,
1.658152, -0.3190134, 1.931961, 1, 0, 0.3254902, 1,
1.658596, 1.547652, -1.256559, 1, 0, 0.3176471, 1,
1.666337, 0.336721, 2.994685, 1, 0, 0.3137255, 1,
1.671943, 0.3969327, -0.8247104, 1, 0, 0.3058824, 1,
1.675113, -1.867343, 2.614986, 1, 0, 0.2980392, 1,
1.695478, 0.5287242, 1.038045, 1, 0, 0.2941177, 1,
1.703829, 1.015641, 1.274043, 1, 0, 0.2862745, 1,
1.704964, 0.9884767, 2.035879, 1, 0, 0.282353, 1,
1.71623, -0.9799857, 0.6530306, 1, 0, 0.2745098, 1,
1.722085, -1.753924, 1.460919, 1, 0, 0.2705882, 1,
1.736651, 1.575827, 1.134211, 1, 0, 0.2627451, 1,
1.737452, -3.724313, 4.026, 1, 0, 0.2588235, 1,
1.741477, 0.1734463, 1.090468, 1, 0, 0.2509804, 1,
1.746736, 1.362878, 1.278201, 1, 0, 0.2470588, 1,
1.757829, 0.6729787, 1.559456, 1, 0, 0.2392157, 1,
1.758016, -0.5615624, 2.493658, 1, 0, 0.2352941, 1,
1.801383, 0.169288, 1.338494, 1, 0, 0.227451, 1,
1.811771, 1.797077, 0.9932299, 1, 0, 0.2235294, 1,
1.816512, -1.211744, 1.79643, 1, 0, 0.2156863, 1,
1.830868, 1.69727, -0.3664669, 1, 0, 0.2117647, 1,
1.861797, -1.37435, 2.582905, 1, 0, 0.2039216, 1,
1.875683, -1.116755, 0.754604, 1, 0, 0.1960784, 1,
1.903932, 0.8308589, -0.06282534, 1, 0, 0.1921569, 1,
1.90577, -0.2466378, 0.1976894, 1, 0, 0.1843137, 1,
1.907735, 1.292205, 0.03432449, 1, 0, 0.1803922, 1,
1.93009, 0.1861752, 0.5836038, 1, 0, 0.172549, 1,
1.967615, 1.845677, 0.9372109, 1, 0, 0.1686275, 1,
2.023021, 0.7546885, 0.1577999, 1, 0, 0.1607843, 1,
2.027482, 0.8498337, 1.024762, 1, 0, 0.1568628, 1,
2.032223, -0.9588294, 0.8656448, 1, 0, 0.1490196, 1,
2.033452, -0.2494885, 1.594464, 1, 0, 0.145098, 1,
2.04576, 1.518144, 0.7751995, 1, 0, 0.1372549, 1,
2.048096, -0.5320647, 4.279871, 1, 0, 0.1333333, 1,
2.071619, 0.3269245, 0.218964, 1, 0, 0.1254902, 1,
2.073217, -1.567663, 1.728593, 1, 0, 0.1215686, 1,
2.078068, 0.2399115, -0.03645772, 1, 0, 0.1137255, 1,
2.129008, 1.531448, 0.2496226, 1, 0, 0.1098039, 1,
2.159094, -0.7147487, 1.188484, 1, 0, 0.1019608, 1,
2.219517, -0.7120832, 2.544895, 1, 0, 0.09411765, 1,
2.231699, -0.4339006, 2.363113, 1, 0, 0.09019608, 1,
2.261832, -1.665593, 2.720601, 1, 0, 0.08235294, 1,
2.264408, -1.807436, 1.721663, 1, 0, 0.07843138, 1,
2.356689, 1.717418, 1.690884, 1, 0, 0.07058824, 1,
2.378779, 0.4824015, 1.619123, 1, 0, 0.06666667, 1,
2.471394, 0.653992, 0.8632278, 1, 0, 0.05882353, 1,
2.524642, 1.006698, 1.688657, 1, 0, 0.05490196, 1,
2.56991, 0.6051319, 1.955466, 1, 0, 0.04705882, 1,
2.615952, -2.308141, 2.095487, 1, 0, 0.04313726, 1,
2.638671, 0.8746093, 1.454329, 1, 0, 0.03529412, 1,
2.643575, -1.18669, 2.091962, 1, 0, 0.03137255, 1,
2.699991, 1.248953, 1.59512, 1, 0, 0.02352941, 1,
2.721436, 0.8453259, 1.149679, 1, 0, 0.01960784, 1,
2.813978, -1.873701, 1.468747, 1, 0, 0.01176471, 1,
3.326411, 2.120837, 0.1645269, 1, 0, 0.007843138, 1
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
-0.244795, -5.200145, -7.442922, 0, -0.5, 0.5, 0.5,
-0.244795, -5.200145, -7.442922, 1, -0.5, 0.5, 0.5,
-0.244795, -5.200145, -7.442922, 1, 1.5, 0.5, 0.5,
-0.244795, -5.200145, -7.442922, 0, 1.5, 0.5, 0.5
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
-5.02664, -0.24397, -7.442922, 0, -0.5, 0.5, 0.5,
-5.02664, -0.24397, -7.442922, 1, -0.5, 0.5, 0.5,
-5.02664, -0.24397, -7.442922, 1, 1.5, 0.5, 0.5,
-5.02664, -0.24397, -7.442922, 0, 1.5, 0.5, 0.5
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
-5.02664, -5.200145, -0.2033443, 0, -0.5, 0.5, 0.5,
-5.02664, -5.200145, -0.2033443, 1, -0.5, 0.5, 0.5,
-5.02664, -5.200145, -0.2033443, 1, 1.5, 0.5, 0.5,
-5.02664, -5.200145, -0.2033443, 0, 1.5, 0.5, 0.5
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
-2, -4.056412, -5.77225,
2, -4.056412, -5.77225,
-2, -4.056412, -5.77225,
-2, -4.247034, -6.050696,
0, -4.056412, -5.77225,
0, -4.247034, -6.050696,
2, -4.056412, -5.77225,
2, -4.247034, -6.050696
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
-2, -4.628278, -6.607586, 0, -0.5, 0.5, 0.5,
-2, -4.628278, -6.607586, 1, -0.5, 0.5, 0.5,
-2, -4.628278, -6.607586, 1, 1.5, 0.5, 0.5,
-2, -4.628278, -6.607586, 0, 1.5, 0.5, 0.5,
0, -4.628278, -6.607586, 0, -0.5, 0.5, 0.5,
0, -4.628278, -6.607586, 1, -0.5, 0.5, 0.5,
0, -4.628278, -6.607586, 1, 1.5, 0.5, 0.5,
0, -4.628278, -6.607586, 0, 1.5, 0.5, 0.5,
2, -4.628278, -6.607586, 0, -0.5, 0.5, 0.5,
2, -4.628278, -6.607586, 1, -0.5, 0.5, 0.5,
2, -4.628278, -6.607586, 1, 1.5, 0.5, 0.5,
2, -4.628278, -6.607586, 0, 1.5, 0.5, 0.5
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
-3.923138, -2, -5.77225,
-3.923138, 2, -5.77225,
-3.923138, -2, -5.77225,
-4.107055, -2, -6.050696,
-3.923138, 0, -5.77225,
-4.107055, 0, -6.050696,
-3.923138, 2, -5.77225,
-4.107055, 2, -6.050696
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
-4.474889, -2, -6.607586, 0, -0.5, 0.5, 0.5,
-4.474889, -2, -6.607586, 1, -0.5, 0.5, 0.5,
-4.474889, -2, -6.607586, 1, 1.5, 0.5, 0.5,
-4.474889, -2, -6.607586, 0, 1.5, 0.5, 0.5,
-4.474889, 0, -6.607586, 0, -0.5, 0.5, 0.5,
-4.474889, 0, -6.607586, 1, -0.5, 0.5, 0.5,
-4.474889, 0, -6.607586, 1, 1.5, 0.5, 0.5,
-4.474889, 0, -6.607586, 0, 1.5, 0.5, 0.5,
-4.474889, 2, -6.607586, 0, -0.5, 0.5, 0.5,
-4.474889, 2, -6.607586, 1, -0.5, 0.5, 0.5,
-4.474889, 2, -6.607586, 1, 1.5, 0.5, 0.5,
-4.474889, 2, -6.607586, 0, 1.5, 0.5, 0.5
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
-3.923138, -4.056412, -4,
-3.923138, -4.056412, 4,
-3.923138, -4.056412, -4,
-4.107055, -4.247034, -4,
-3.923138, -4.056412, -2,
-4.107055, -4.247034, -2,
-3.923138, -4.056412, 0,
-4.107055, -4.247034, 0,
-3.923138, -4.056412, 2,
-4.107055, -4.247034, 2,
-3.923138, -4.056412, 4,
-4.107055, -4.247034, 4
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
-4.474889, -4.628278, -4, 0, -0.5, 0.5, 0.5,
-4.474889, -4.628278, -4, 1, -0.5, 0.5, 0.5,
-4.474889, -4.628278, -4, 1, 1.5, 0.5, 0.5,
-4.474889, -4.628278, -4, 0, 1.5, 0.5, 0.5,
-4.474889, -4.628278, -2, 0, -0.5, 0.5, 0.5,
-4.474889, -4.628278, -2, 1, -0.5, 0.5, 0.5,
-4.474889, -4.628278, -2, 1, 1.5, 0.5, 0.5,
-4.474889, -4.628278, -2, 0, 1.5, 0.5, 0.5,
-4.474889, -4.628278, 0, 0, -0.5, 0.5, 0.5,
-4.474889, -4.628278, 0, 1, -0.5, 0.5, 0.5,
-4.474889, -4.628278, 0, 1, 1.5, 0.5, 0.5,
-4.474889, -4.628278, 0, 0, 1.5, 0.5, 0.5,
-4.474889, -4.628278, 2, 0, -0.5, 0.5, 0.5,
-4.474889, -4.628278, 2, 1, -0.5, 0.5, 0.5,
-4.474889, -4.628278, 2, 1, 1.5, 0.5, 0.5,
-4.474889, -4.628278, 2, 0, 1.5, 0.5, 0.5,
-4.474889, -4.628278, 4, 0, -0.5, 0.5, 0.5,
-4.474889, -4.628278, 4, 1, -0.5, 0.5, 0.5,
-4.474889, -4.628278, 4, 1, 1.5, 0.5, 0.5,
-4.474889, -4.628278, 4, 0, 1.5, 0.5, 0.5
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
-3.923138, -4.056412, -5.77225,
-3.923138, 3.568472, -5.77225,
-3.923138, -4.056412, 5.365561,
-3.923138, 3.568472, 5.365561,
-3.923138, -4.056412, -5.77225,
-3.923138, -4.056412, 5.365561,
-3.923138, 3.568472, -5.77225,
-3.923138, 3.568472, 5.365561,
-3.923138, -4.056412, -5.77225,
3.433548, -4.056412, -5.77225,
-3.923138, -4.056412, 5.365561,
3.433548, -4.056412, 5.365561,
-3.923138, 3.568472, -5.77225,
3.433548, 3.568472, -5.77225,
-3.923138, 3.568472, 5.365561,
3.433548, 3.568472, 5.365561,
3.433548, -4.056412, -5.77225,
3.433548, 3.568472, -5.77225,
3.433548, -4.056412, 5.365561,
3.433548, 3.568472, 5.365561,
3.433548, -4.056412, -5.77225,
3.433548, -4.056412, 5.365561,
3.433548, 3.568472, -5.77225,
3.433548, 3.568472, 5.365561
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
var radius = 8.20856;
var distance = 36.52081;
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
mvMatrix.translate( 0.244795, 0.24397, 0.2033443 );
mvMatrix.scale( 1.206421, 1.163986, 0.7968581 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.52081);
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
validamycin_A<-read.table("validamycin_A.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-validamycin_A$V2
```

```
## Error in eval(expr, envir, enclos): object 'validamycin_A' not found
```

```r
y<-validamycin_A$V3
```

```
## Error in eval(expr, envir, enclos): object 'validamycin_A' not found
```

```r
z<-validamycin_A$V4
```

```
## Error in eval(expr, envir, enclos): object 'validamycin_A' not found
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
-3.816001, 0.3243061, -0.9664217, 0, 0, 1, 1, 1,
-3.199963, -0.8014033, -3.679739, 1, 0, 0, 1, 1,
-3.173633, -1.608594, -0.7399089, 1, 0, 0, 1, 1,
-2.752209, 0.06928002, -1.781542, 1, 0, 0, 1, 1,
-2.736227, 1.365471, -1.908189, 1, 0, 0, 1, 1,
-2.66687, -1.204176, -1.071388, 1, 0, 0, 1, 1,
-2.632631, -0.4435878, -0.4831349, 0, 0, 0, 1, 1,
-2.612685, 2.086208, -1.035441, 0, 0, 0, 1, 1,
-2.608491, 1.441333, -1.661887, 0, 0, 0, 1, 1,
-2.421264, 0.6674378, -1.567917, 0, 0, 0, 1, 1,
-2.355906, 0.1896052, -1.389306, 0, 0, 0, 1, 1,
-2.346517, 1.819277, -0.03655716, 0, 0, 0, 1, 1,
-2.330986, -1.556132, -1.639852, 0, 0, 0, 1, 1,
-2.315423, 0.7232261, 0.3737967, 1, 1, 1, 1, 1,
-2.296016, -0.2812481, -3.015832, 1, 1, 1, 1, 1,
-2.248765, -2.845916, -3.148315, 1, 1, 1, 1, 1,
-2.246852, 1.027634, -0.096672, 1, 1, 1, 1, 1,
-2.237999, -3.069141, -1.781821, 1, 1, 1, 1, 1,
-2.223072, -0.6223956, -3.19561, 1, 1, 1, 1, 1,
-2.186353, -0.2438219, -2.055105, 1, 1, 1, 1, 1,
-2.159972, -1.625459, -3.042921, 1, 1, 1, 1, 1,
-2.115012, 0.06005662, -0.3282784, 1, 1, 1, 1, 1,
-2.087631, 0.6678598, -0.3490838, 1, 1, 1, 1, 1,
-2.059615, 1.144838, -1.003544, 1, 1, 1, 1, 1,
-1.987935, -1.000022, -0.5306088, 1, 1, 1, 1, 1,
-1.948205, 1.036323, -1.661783, 1, 1, 1, 1, 1,
-1.94792, -0.4673227, -1.299105, 1, 1, 1, 1, 1,
-1.940574, -0.2970988, -2.957151, 1, 1, 1, 1, 1,
-1.937621, 0.8368285, -1.423774, 0, 0, 1, 1, 1,
-1.922343, 0.7234135, -2.188696, 1, 0, 0, 1, 1,
-1.84917, 0.4711033, -0.2219342, 1, 0, 0, 1, 1,
-1.847031, -0.4267302, -0.9419606, 1, 0, 0, 1, 1,
-1.840603, -0.4285161, -1.080437, 1, 0, 0, 1, 1,
-1.838506, 0.6909878, -2.11839, 1, 0, 0, 1, 1,
-1.836584, 1.161834, -0.8971915, 0, 0, 0, 1, 1,
-1.833693, 0.8467696, -2.33084, 0, 0, 0, 1, 1,
-1.831782, -0.1269918, -2.377061, 0, 0, 0, 1, 1,
-1.831022, -1.919662, -2.038227, 0, 0, 0, 1, 1,
-1.825375, -0.235292, -1.906327, 0, 0, 0, 1, 1,
-1.809191, -0.7083488, -0.8885605, 0, 0, 0, 1, 1,
-1.757364, -0.1323794, 0.1813799, 0, 0, 0, 1, 1,
-1.754869, 0.7839316, -1.589415, 1, 1, 1, 1, 1,
-1.753592, -0.9324952, -1.231071, 1, 1, 1, 1, 1,
-1.741961, 0.6425474, -0.4329875, 1, 1, 1, 1, 1,
-1.729985, 1.853468, -2.956554, 1, 1, 1, 1, 1,
-1.716706, -0.2356714, -0.3495592, 1, 1, 1, 1, 1,
-1.711126, -0.4968474, -2.729665, 1, 1, 1, 1, 1,
-1.703012, -1.827685, -2.421427, 1, 1, 1, 1, 1,
-1.695624, 0.4586617, 0.3357602, 1, 1, 1, 1, 1,
-1.692526, 0.2300962, -2.912415, 1, 1, 1, 1, 1,
-1.691493, -0.1898201, -1.355766, 1, 1, 1, 1, 1,
-1.68346, 0.5986369, -2.29107, 1, 1, 1, 1, 1,
-1.673909, -0.4391544, -2.577664, 1, 1, 1, 1, 1,
-1.664286, 0.7407358, -2.059189, 1, 1, 1, 1, 1,
-1.646603, 0.1904583, -0.9128096, 1, 1, 1, 1, 1,
-1.644974, -0.02666122, -1.126782, 1, 1, 1, 1, 1,
-1.641493, 0.1744624, -1.305211, 0, 0, 1, 1, 1,
-1.616696, 1.876118, -2.349358, 1, 0, 0, 1, 1,
-1.615023, 1.87889, -0.9631209, 1, 0, 0, 1, 1,
-1.602285, 0.9094262, -0.0394141, 1, 0, 0, 1, 1,
-1.599566, -1.290785, -1.874872, 1, 0, 0, 1, 1,
-1.58154, -1.565307, -1.177551, 1, 0, 0, 1, 1,
-1.575779, -1.11898, -2.98826, 0, 0, 0, 1, 1,
-1.575416, 0.2715316, -1.936842, 0, 0, 0, 1, 1,
-1.571027, 1.173038, 0.802578, 0, 0, 0, 1, 1,
-1.557106, -0.9853415, 0.3255928, 0, 0, 0, 1, 1,
-1.556924, -0.07930683, -1.168151, 0, 0, 0, 1, 1,
-1.535315, 0.7934565, -0.7788277, 0, 0, 0, 1, 1,
-1.519701, -1.982505, -2.43589, 0, 0, 0, 1, 1,
-1.511576, 0.966127, -1.200152, 1, 1, 1, 1, 1,
-1.511521, -0.9955229, -3.122854, 1, 1, 1, 1, 1,
-1.508775, 1.217829, 0.108762, 1, 1, 1, 1, 1,
-1.491171, 1.867307, 1.315294, 1, 1, 1, 1, 1,
-1.462303, -0.4081774, -2.613843, 1, 1, 1, 1, 1,
-1.460152, -0.1003882, -2.042201, 1, 1, 1, 1, 1,
-1.449458, -0.5610305, -2.047767, 1, 1, 1, 1, 1,
-1.446504, -0.8842521, -4.28174, 1, 1, 1, 1, 1,
-1.442427, -1.108808, -2.543774, 1, 1, 1, 1, 1,
-1.440479, -0.09972656, -0.3147384, 1, 1, 1, 1, 1,
-1.439971, 1.069724, -1.325227, 1, 1, 1, 1, 1,
-1.439013, -0.507843, -2.638539, 1, 1, 1, 1, 1,
-1.438171, 1.613485, -0.6252623, 1, 1, 1, 1, 1,
-1.438104, -1.031559, -3.032428, 1, 1, 1, 1, 1,
-1.436696, -2.019901, -2.240555, 1, 1, 1, 1, 1,
-1.430788, -0.2614369, -0.2684291, 0, 0, 1, 1, 1,
-1.424716, -0.1837271, -2.254959, 1, 0, 0, 1, 1,
-1.422292, -0.7895643, -2.885794, 1, 0, 0, 1, 1,
-1.41499, -2.031784, -2.592602, 1, 0, 0, 1, 1,
-1.413236, 0.9734448, -0.5747886, 1, 0, 0, 1, 1,
-1.406469, -1.787566, -2.957929, 1, 0, 0, 1, 1,
-1.402626, -0.7953548, -1.659455, 0, 0, 0, 1, 1,
-1.401635, -0.1820835, -0.2450396, 0, 0, 0, 1, 1,
-1.392711, -0.8529457, -2.090173, 0, 0, 0, 1, 1,
-1.375351, 0.3699367, 0.5358313, 0, 0, 0, 1, 1,
-1.368536, -1.509019, -3.121758, 0, 0, 0, 1, 1,
-1.368023, -0.240342, -2.309639, 0, 0, 0, 1, 1,
-1.359778, 0.117513, -2.714785, 0, 0, 0, 1, 1,
-1.333799, -0.4679727, -1.564878, 1, 1, 1, 1, 1,
-1.320051, -1.514208, -1.639668, 1, 1, 1, 1, 1,
-1.294617, -0.1778245, -0.4461108, 1, 1, 1, 1, 1,
-1.285269, 0.2668391, -1.825383, 1, 1, 1, 1, 1,
-1.284458, -0.228164, -2.664068, 1, 1, 1, 1, 1,
-1.282223, 0.1554051, -0.9361808, 1, 1, 1, 1, 1,
-1.273313, -1.833391, -3.75932, 1, 1, 1, 1, 1,
-1.261124, -1.284401, -1.017473, 1, 1, 1, 1, 1,
-1.258658, -0.2718382, -2.583359, 1, 1, 1, 1, 1,
-1.253731, -0.9276006, -3.088704, 1, 1, 1, 1, 1,
-1.243212, 1.484538, -1.773938, 1, 1, 1, 1, 1,
-1.242312, -0.5722679, -2.603664, 1, 1, 1, 1, 1,
-1.233726, 1.704312, -1.041264, 1, 1, 1, 1, 1,
-1.232599, 0.5878794, -1.335799, 1, 1, 1, 1, 1,
-1.231915, 0.3349659, -0.668318, 1, 1, 1, 1, 1,
-1.231788, -0.2891304, -1.041536, 0, 0, 1, 1, 1,
-1.229127, -0.3704791, -2.361267, 1, 0, 0, 1, 1,
-1.225647, -1.118933, -2.932622, 1, 0, 0, 1, 1,
-1.217067, -1.307902, -2.739225, 1, 0, 0, 1, 1,
-1.213559, 0.9704484, -2.533736, 1, 0, 0, 1, 1,
-1.210531, 0.980802, 1.188195, 1, 0, 0, 1, 1,
-1.198478, -0.7406523, -1.398295, 0, 0, 0, 1, 1,
-1.19093, -0.6225253, -1.699286, 0, 0, 0, 1, 1,
-1.177659, 0.04159959, -0.5625653, 0, 0, 0, 1, 1,
-1.175385, 0.3765443, -1.738358, 0, 0, 0, 1, 1,
-1.174662, -1.281276, -1.434417, 0, 0, 0, 1, 1,
-1.166782, 2.203539, -0.7022053, 0, 0, 0, 1, 1,
-1.166029, 0.1468088, -1.866189, 0, 0, 0, 1, 1,
-1.163655, 0.2148632, -4.16064, 1, 1, 1, 1, 1,
-1.158107, 0.4412806, -0.9082803, 1, 1, 1, 1, 1,
-1.1558, 1.160984, -0.683514, 1, 1, 1, 1, 1,
-1.149488, -0.187295, -1.380955, 1, 1, 1, 1, 1,
-1.144497, 0.5604379, -1.809505, 1, 1, 1, 1, 1,
-1.142647, 1.354263, 0.1036134, 1, 1, 1, 1, 1,
-1.123412, -0.09334734, -1.835825, 1, 1, 1, 1, 1,
-1.111235, 0.9505934, -1.362261, 1, 1, 1, 1, 1,
-1.109938, 0.3869794, -1.724289, 1, 1, 1, 1, 1,
-1.107844, -0.1904812, -1.405272, 1, 1, 1, 1, 1,
-1.103504, 1.178898, -2.066494, 1, 1, 1, 1, 1,
-1.101691, 0.2305077, -0.6605166, 1, 1, 1, 1, 1,
-1.100611, 0.6063552, -0.3866929, 1, 1, 1, 1, 1,
-1.099317, 0.03015891, -2.289086, 1, 1, 1, 1, 1,
-1.091758, 0.3551489, -1.231623, 1, 1, 1, 1, 1,
-1.08356, 1.423285, 0.9236656, 0, 0, 1, 1, 1,
-1.080492, -0.9957047, -3.717246, 1, 0, 0, 1, 1,
-1.07761, 0.6648556, -0.895623, 1, 0, 0, 1, 1,
-1.06719, 1.308213, -1.678933, 1, 0, 0, 1, 1,
-1.063276, 0.278225, 0.9691719, 1, 0, 0, 1, 1,
-1.052867, -1.688622, -3.528485, 1, 0, 0, 1, 1,
-1.038464, 0.09644077, -0.3717257, 0, 0, 0, 1, 1,
-1.036348, -0.4272115, -3.591679, 0, 0, 0, 1, 1,
-1.035468, -1.722965, -2.725045, 0, 0, 0, 1, 1,
-1.034542, -0.6498124, -1.506818, 0, 0, 0, 1, 1,
-1.034323, -0.4448453, -2.343537, 0, 0, 0, 1, 1,
-1.02228, -0.492486, -1.415658, 0, 0, 0, 1, 1,
-1.014456, -0.2747233, -2.420181, 0, 0, 0, 1, 1,
-1.012707, 0.8389874, -1.003789, 1, 1, 1, 1, 1,
-1.006626, 1.833536, -0.3271341, 1, 1, 1, 1, 1,
-1.000917, 0.8136751, -0.5800312, 1, 1, 1, 1, 1,
-0.9991559, -1.034523, -4.006174, 1, 1, 1, 1, 1,
-0.9975172, -1.765561, -2.884449, 1, 1, 1, 1, 1,
-0.9950259, -1.330182, -3.722861, 1, 1, 1, 1, 1,
-0.9945502, -1.73283, -1.317439, 1, 1, 1, 1, 1,
-0.9907287, 0.8498772, -2.376871, 1, 1, 1, 1, 1,
-0.9860369, 1.131534, -1.282337, 1, 1, 1, 1, 1,
-0.985477, -0.7172724, -0.5795512, 1, 1, 1, 1, 1,
-0.9824324, -1.066405, -1.968292, 1, 1, 1, 1, 1,
-0.9819905, 1.074557, -2.3208, 1, 1, 1, 1, 1,
-0.9728222, -0.9197515, -4.963515, 1, 1, 1, 1, 1,
-0.9711216, -1.084745, -1.485611, 1, 1, 1, 1, 1,
-0.9676632, -1.0188, -1.604405, 1, 1, 1, 1, 1,
-0.9648787, -0.2696295, -1.393902, 0, 0, 1, 1, 1,
-0.9602145, 0.04287156, -3.474833, 1, 0, 0, 1, 1,
-0.9554378, 0.6688926, -1.182089, 1, 0, 0, 1, 1,
-0.953095, 0.2598611, -0.6729217, 1, 0, 0, 1, 1,
-0.9514474, 1.158725, -1.117889, 1, 0, 0, 1, 1,
-0.9476553, 0.09737045, -2.653085, 1, 0, 0, 1, 1,
-0.9463445, -1.115319, -3.30227, 0, 0, 0, 1, 1,
-0.9453371, 0.6841586, -1.22337, 0, 0, 0, 1, 1,
-0.944314, 0.99855, -0.8753739, 0, 0, 0, 1, 1,
-0.9378913, 0.5211613, -1.623492, 0, 0, 0, 1, 1,
-0.9372327, -0.3160899, -4.011093, 0, 0, 0, 1, 1,
-0.9354486, -0.6424534, -2.980037, 0, 0, 0, 1, 1,
-0.9300737, 0.6395217, -0.71263, 0, 0, 0, 1, 1,
-0.925967, -0.8364388, -2.884881, 1, 1, 1, 1, 1,
-0.9044424, -1.75755, -1.727735, 1, 1, 1, 1, 1,
-0.9040028, -1.348759, -2.72834, 1, 1, 1, 1, 1,
-0.8971841, -0.5854971, -2.916732, 1, 1, 1, 1, 1,
-0.8968829, -1.961105, -2.107622, 1, 1, 1, 1, 1,
-0.8906676, -0.2781128, -2.94017, 1, 1, 1, 1, 1,
-0.8841668, 0.4783553, -3.774522, 1, 1, 1, 1, 1,
-0.8790261, 0.129566, -0.139581, 1, 1, 1, 1, 1,
-0.8780551, 1.13054, -1.485807, 1, 1, 1, 1, 1,
-0.8655601, -1.438835, -1.148189, 1, 1, 1, 1, 1,
-0.8652255, 0.4196355, -2.226233, 1, 1, 1, 1, 1,
-0.8650404, 1.493064, 0.6390898, 1, 1, 1, 1, 1,
-0.863916, 0.03220028, -1.634424, 1, 1, 1, 1, 1,
-0.8617196, -0.5790023, -2.087368, 1, 1, 1, 1, 1,
-0.8612493, 1.346021, -0.9491789, 1, 1, 1, 1, 1,
-0.8578171, -0.8478932, -2.037074, 0, 0, 1, 1, 1,
-0.8527882, 1.401664, 0.7047114, 1, 0, 0, 1, 1,
-0.8517567, 1.49321, 0.1307077, 1, 0, 0, 1, 1,
-0.8489811, 0.503481, -2.096918, 1, 0, 0, 1, 1,
-0.842736, 0.1166163, -2.19493, 1, 0, 0, 1, 1,
-0.8411217, 0.5616516, -0.9462906, 1, 0, 0, 1, 1,
-0.8333341, 0.9363288, -2.423014, 0, 0, 0, 1, 1,
-0.8298607, -0.6354346, -1.042779, 0, 0, 0, 1, 1,
-0.8284046, 0.9921311, -1.023464, 0, 0, 0, 1, 1,
-0.8232231, 0.5381204, -2.909694, 0, 0, 0, 1, 1,
-0.821834, 0.6160906, 0.251032, 0, 0, 0, 1, 1,
-0.8206648, 0.5277175, -2.585433, 0, 0, 0, 1, 1,
-0.81669, 2.221083, 0.4215474, 0, 0, 0, 1, 1,
-0.8160412, 0.2263813, 0.1116498, 1, 1, 1, 1, 1,
-0.8139359, 0.05643835, -0.6371886, 1, 1, 1, 1, 1,
-0.8086844, -0.2363939, -1.305541, 1, 1, 1, 1, 1,
-0.799315, 1.538431, 0.9515411, 1, 1, 1, 1, 1,
-0.7977695, 2.83687, 0.8177285, 1, 1, 1, 1, 1,
-0.7896032, 0.4584392, -0.2676697, 1, 1, 1, 1, 1,
-0.7891362, 0.8746551, -1.010635, 1, 1, 1, 1, 1,
-0.787626, -0.466867, -1.849026, 1, 1, 1, 1, 1,
-0.784762, 0.4485361, 0.5960931, 1, 1, 1, 1, 1,
-0.7810756, -0.6819862, -3.892445, 1, 1, 1, 1, 1,
-0.7779469, 0.09503715, -2.42667, 1, 1, 1, 1, 1,
-0.7765861, 0.1939508, -0.3041018, 1, 1, 1, 1, 1,
-0.7765841, 2.088047, -0.5899478, 1, 1, 1, 1, 1,
-0.7741541, -3.045662, -3.7835, 1, 1, 1, 1, 1,
-0.7732692, -0.02270643, -1.082123, 1, 1, 1, 1, 1,
-0.772011, -0.3436325, -2.728478, 0, 0, 1, 1, 1,
-0.7712482, -0.2399099, -1.464627, 1, 0, 0, 1, 1,
-0.7672231, -0.2366233, -2.893783, 1, 0, 0, 1, 1,
-0.7611964, -0.3376052, -0.7781903, 1, 0, 0, 1, 1,
-0.7605615, -0.7273208, -4.242466, 1, 0, 0, 1, 1,
-0.7579171, -1.340156, -2.632271, 1, 0, 0, 1, 1,
-0.7568825, -0.4875853, -2.920808, 0, 0, 0, 1, 1,
-0.7556203, -0.5821794, -3.921204, 0, 0, 0, 1, 1,
-0.7517325, -0.4318227, -2.124443, 0, 0, 0, 1, 1,
-0.749144, -1.59916, -1.664813, 0, 0, 0, 1, 1,
-0.7446536, -0.2075101, -2.094659, 0, 0, 0, 1, 1,
-0.7426408, 0.4819401, -0.3251314, 0, 0, 0, 1, 1,
-0.7413459, 0.1070593, -2.629292, 0, 0, 0, 1, 1,
-0.739068, 1.953774, 0.1354509, 1, 1, 1, 1, 1,
-0.7320604, 0.007219263, -2.323854, 1, 1, 1, 1, 1,
-0.7307498, -0.7241549, -2.569368, 1, 1, 1, 1, 1,
-0.7270256, -0.2484605, -0.6696917, 1, 1, 1, 1, 1,
-0.7252461, -1.531563, 0.6670262, 1, 1, 1, 1, 1,
-0.7187065, 0.8901802, -1.25539, 1, 1, 1, 1, 1,
-0.7044616, 0.08095567, -2.063305, 1, 1, 1, 1, 1,
-0.7025229, 0.697294, -2.384085, 1, 1, 1, 1, 1,
-0.7000143, -0.04552279, -2.281883, 1, 1, 1, 1, 1,
-0.6979296, 0.2570153, 0.2490647, 1, 1, 1, 1, 1,
-0.6965353, -0.4941624, -2.478458, 1, 1, 1, 1, 1,
-0.6911144, 0.8332298, -0.8945009, 1, 1, 1, 1, 1,
-0.6910626, -1.014783, -2.271099, 1, 1, 1, 1, 1,
-0.69103, 1.269368, -2.541136, 1, 1, 1, 1, 1,
-0.6874623, -0.4113545, -1.202034, 1, 1, 1, 1, 1,
-0.6809446, -0.0234024, -0.9758165, 0, 0, 1, 1, 1,
-0.680795, -2.550751, -2.718253, 1, 0, 0, 1, 1,
-0.6671305, 2.737682, 1.613697, 1, 0, 0, 1, 1,
-0.6656362, 0.1600554, -2.35802, 1, 0, 0, 1, 1,
-0.6565571, -0.09436184, -2.401584, 1, 0, 0, 1, 1,
-0.6563811, -0.2739346, -2.2592, 1, 0, 0, 1, 1,
-0.6538705, 1.575737, 0.4976189, 0, 0, 0, 1, 1,
-0.6530176, -1.609466, -2.456415, 0, 0, 0, 1, 1,
-0.6498263, -0.6547948, -2.635844, 0, 0, 0, 1, 1,
-0.642983, -0.3051189, -0.03657927, 0, 0, 0, 1, 1,
-0.6375105, -0.3507949, -1.918147, 0, 0, 0, 1, 1,
-0.6334807, -0.5044844, -1.989385, 0, 0, 0, 1, 1,
-0.6303263, 0.8116064, -0.5654339, 0, 0, 0, 1, 1,
-0.6275449, -0.3639118, -1.708332, 1, 1, 1, 1, 1,
-0.6254344, -0.7716326, -2.641337, 1, 1, 1, 1, 1,
-0.6252297, -0.3570172, -3.389266, 1, 1, 1, 1, 1,
-0.6174628, -0.2410004, -2.931713, 1, 1, 1, 1, 1,
-0.6173914, -0.1728802, -1.102598, 1, 1, 1, 1, 1,
-0.6145608, 1.905751, -0.1491657, 1, 1, 1, 1, 1,
-0.6128334, -0.5719525, -4.003215, 1, 1, 1, 1, 1,
-0.6096325, -0.5502918, -3.192581, 1, 1, 1, 1, 1,
-0.6087937, -0.03160282, -0.5850449, 1, 1, 1, 1, 1,
-0.6055943, 0.6803136, -1.062578, 1, 1, 1, 1, 1,
-0.6021246, -0.5174903, -1.486567, 1, 1, 1, 1, 1,
-0.6020973, -0.2570666, -2.364077, 1, 1, 1, 1, 1,
-0.6018166, -0.4645133, -1.955593, 1, 1, 1, 1, 1,
-0.6012573, 0.7617123, -0.1712208, 1, 1, 1, 1, 1,
-0.5841227, -0.1688055, -0.8202345, 1, 1, 1, 1, 1,
-0.5831501, -0.7025979, -1.908523, 0, 0, 1, 1, 1,
-0.5783055, 1.558046, -1.248093, 1, 0, 0, 1, 1,
-0.5743877, 0.8534851, 0.2020908, 1, 0, 0, 1, 1,
-0.574356, -1.028499, -1.898967, 1, 0, 0, 1, 1,
-0.5716674, -1.329622, -2.751533, 1, 0, 0, 1, 1,
-0.5630919, 1.01694, 0.7068196, 1, 0, 0, 1, 1,
-0.5630625, 1.968397, -2.756559, 0, 0, 0, 1, 1,
-0.5625657, -0.8310668, -2.068542, 0, 0, 0, 1, 1,
-0.5557492, -0.4449092, -2.609401, 0, 0, 0, 1, 1,
-0.5550625, -0.4431238, -2.279271, 0, 0, 0, 1, 1,
-0.5500258, -0.6886105, -3.389991, 0, 0, 0, 1, 1,
-0.5399069, -0.6627515, -2.792109, 0, 0, 0, 1, 1,
-0.5385631, -0.6890177, -4.128118, 0, 0, 0, 1, 1,
-0.5272247, -0.7900378, -2.622562, 1, 1, 1, 1, 1,
-0.5243647, 0.8357739, -0.8863127, 1, 1, 1, 1, 1,
-0.5234264, 0.1724369, -0.5963324, 1, 1, 1, 1, 1,
-0.5164421, -0.6110525, -0.4824977, 1, 1, 1, 1, 1,
-0.5145364, 0.4400007, 0.7830387, 1, 1, 1, 1, 1,
-0.5130321, -0.2910523, -0.9266546, 1, 1, 1, 1, 1,
-0.5127922, 2.044179, 1.579737, 1, 1, 1, 1, 1,
-0.5120581, 1.200936, -1.570869, 1, 1, 1, 1, 1,
-0.5101315, 1.389134, 0.02648244, 1, 1, 1, 1, 1,
-0.508246, -0.01004836, -1.641322, 1, 1, 1, 1, 1,
-0.5044376, -0.2163852, -0.3607571, 1, 1, 1, 1, 1,
-0.504284, 1.604745, -1.627614, 1, 1, 1, 1, 1,
-0.5016876, 0.9613797, -1.198814, 1, 1, 1, 1, 1,
-0.498049, -0.6020958, -2.783373, 1, 1, 1, 1, 1,
-0.4882964, 0.1542129, -1.973877, 1, 1, 1, 1, 1,
-0.4879299, -0.768653, -1.611999, 0, 0, 1, 1, 1,
-0.4867775, -0.8172583, -0.977415, 1, 0, 0, 1, 1,
-0.4866596, 2.273012, 0.3746931, 1, 0, 0, 1, 1,
-0.4842162, 1.337947, 0.4764678, 1, 0, 0, 1, 1,
-0.4812994, -0.9554709, -2.845544, 1, 0, 0, 1, 1,
-0.4811237, 1.189045, -1.657426, 1, 0, 0, 1, 1,
-0.4769909, -1.532683, -3.355907, 0, 0, 0, 1, 1,
-0.4698228, -0.7546322, -1.005174, 0, 0, 0, 1, 1,
-0.4691028, 0.3307374, -2.243719, 0, 0, 0, 1, 1,
-0.4672659, 0.3364676, -2.620909, 0, 0, 0, 1, 1,
-0.4656794, -0.5554506, -1.824051, 0, 0, 0, 1, 1,
-0.4649425, 0.8541002, -0.9970968, 0, 0, 0, 1, 1,
-0.4621936, -1.848018, -3.483938, 0, 0, 0, 1, 1,
-0.4556574, 0.4148368, -2.940145, 1, 1, 1, 1, 1,
-0.4555591, 0.6565961, 1.121707, 1, 1, 1, 1, 1,
-0.4529141, 0.6375898, -0.1856622, 1, 1, 1, 1, 1,
-0.4527254, -0.3679764, -2.783352, 1, 1, 1, 1, 1,
-0.4512185, -0.720315, -2.071538, 1, 1, 1, 1, 1,
-0.448435, -0.004694996, -2.307764, 1, 1, 1, 1, 1,
-0.441155, 0.7944084, -0.8664395, 1, 1, 1, 1, 1,
-0.437048, 1.724088, 0.8165677, 1, 1, 1, 1, 1,
-0.4357447, -0.5179092, -4.061287, 1, 1, 1, 1, 1,
-0.4342152, -0.917595, -2.212719, 1, 1, 1, 1, 1,
-0.431915, -0.2916191, -1.055749, 1, 1, 1, 1, 1,
-0.4315891, 0.9375083, -1.513021, 1, 1, 1, 1, 1,
-0.431149, 0.5421672, -1.093109, 1, 1, 1, 1, 1,
-0.4223652, 0.2464875, -0.5738598, 1, 1, 1, 1, 1,
-0.4174309, 0.7583741, -0.3761423, 1, 1, 1, 1, 1,
-0.4139839, 0.3410653, -2.759187, 0, 0, 1, 1, 1,
-0.4062817, 0.4232246, -2.309907, 1, 0, 0, 1, 1,
-0.4019008, -0.3443809, -3.412844, 1, 0, 0, 1, 1,
-0.4010048, -1.598004, -3.618047, 1, 0, 0, 1, 1,
-0.3968937, -0.2310765, -1.6268, 1, 0, 0, 1, 1,
-0.3951009, 0.1998187, -0.7500858, 1, 0, 0, 1, 1,
-0.390592, -0.05264256, -3.399955, 0, 0, 0, 1, 1,
-0.389258, 1.404667, 0.1183634, 0, 0, 0, 1, 1,
-0.3861771, 1.045693, -1.179512, 0, 0, 0, 1, 1,
-0.385157, -0.218463, -2.310416, 0, 0, 0, 1, 1,
-0.3822795, -1.177421, -2.446953, 0, 0, 0, 1, 1,
-0.3814943, 0.9276798, 0.204185, 0, 0, 0, 1, 1,
-0.38146, -3.123298, -4.310106, 0, 0, 0, 1, 1,
-0.3789603, 0.3543615, -1.027914, 1, 1, 1, 1, 1,
-0.3764976, -0.05864551, -1.135072, 1, 1, 1, 1, 1,
-0.3728705, 1.085877, -1.113942, 1, 1, 1, 1, 1,
-0.3726298, -0.1380745, -1.883205, 1, 1, 1, 1, 1,
-0.3724098, -3.018087, -2.269539, 1, 1, 1, 1, 1,
-0.3654337, 0.0815507, -2.175121, 1, 1, 1, 1, 1,
-0.3638983, -0.5896571, -1.90236, 1, 1, 1, 1, 1,
-0.3633306, -0.4175431, -1.541799, 1, 1, 1, 1, 1,
-0.3597426, 0.01233777, -1.455673, 1, 1, 1, 1, 1,
-0.3590322, 0.3806461, -1.67371, 1, 1, 1, 1, 1,
-0.3589146, -1.110135, -4.095522, 1, 1, 1, 1, 1,
-0.3559483, 1.477849, 1.014464, 1, 1, 1, 1, 1,
-0.350794, 0.7465385, 0.6573794, 1, 1, 1, 1, 1,
-0.3468935, -1.020959, -2.293134, 1, 1, 1, 1, 1,
-0.3454501, -0.7293455, -1.500795, 1, 1, 1, 1, 1,
-0.3428609, -1.259963, -3.752587, 0, 0, 1, 1, 1,
-0.3427665, 0.8364488, 0.2158977, 1, 0, 0, 1, 1,
-0.3405949, -0.4415906, -2.921959, 1, 0, 0, 1, 1,
-0.3364836, 0.6514481, 0.5487849, 1, 0, 0, 1, 1,
-0.3312628, 1.654463, -0.6761145, 1, 0, 0, 1, 1,
-0.3272081, 1.041873, -0.6830377, 1, 0, 0, 1, 1,
-0.3271216, -0.5610194, -1.792598, 0, 0, 0, 1, 1,
-0.325755, -0.5256776, -2.426429, 0, 0, 0, 1, 1,
-0.323779, -0.2309354, -1.98629, 0, 0, 0, 1, 1,
-0.3226556, -1.606317, -1.340106, 0, 0, 0, 1, 1,
-0.3190128, 1.259755, -0.2443537, 0, 0, 0, 1, 1,
-0.3086201, -0.3216639, -3.224534, 0, 0, 0, 1, 1,
-0.3080333, 3.45743, -1.732767, 0, 0, 0, 1, 1,
-0.3069622, -0.4444793, -4.088534, 1, 1, 1, 1, 1,
-0.3065186, -2.030397, -4.689033, 1, 1, 1, 1, 1,
-0.3030386, 1.233981, 1.011675, 1, 1, 1, 1, 1,
-0.3025057, 0.1653605, -1.9367, 1, 1, 1, 1, 1,
-0.286036, -0.1000333, -1.6649, 1, 1, 1, 1, 1,
-0.283983, -0.2798824, -2.49954, 1, 1, 1, 1, 1,
-0.2817951, 1.029587, -0.1755701, 1, 1, 1, 1, 1,
-0.2814072, 0.04901515, -0.0164803, 1, 1, 1, 1, 1,
-0.2789197, 0.9550039, 0.7353408, 1, 1, 1, 1, 1,
-0.2703216, -0.184343, -2.754117, 1, 1, 1, 1, 1,
-0.2687284, -0.1954468, -1.875718, 1, 1, 1, 1, 1,
-0.2680551, 1.469956, 0.5566617, 1, 1, 1, 1, 1,
-0.2679192, 0.4666668, -0.1841463, 1, 1, 1, 1, 1,
-0.2669814, 1.331966, 0.07866372, 1, 1, 1, 1, 1,
-0.2632931, 0.006156879, -0.669715, 1, 1, 1, 1, 1,
-0.2603197, -1.313138, -3.344889, 0, 0, 1, 1, 1,
-0.2601103, 0.5643886, 0.288629, 1, 0, 0, 1, 1,
-0.2595133, -0.5768082, -3.947786, 1, 0, 0, 1, 1,
-0.2587747, -1.171754, -2.2658, 1, 0, 0, 1, 1,
-0.2580162, 1.364588, 0.9148136, 1, 0, 0, 1, 1,
-0.256196, -0.6530921, -2.936017, 1, 0, 0, 1, 1,
-0.2546784, -0.3200774, -2.534136, 0, 0, 0, 1, 1,
-0.2490245, -0.5277376, -3.076914, 0, 0, 0, 1, 1,
-0.2464308, -1.976522, -2.762765, 0, 0, 0, 1, 1,
-0.2416584, 0.7700281, -0.6520574, 0, 0, 0, 1, 1,
-0.2382568, -0.5183269, -3.154042, 0, 0, 0, 1, 1,
-0.236241, 1.509138, -0.1064024, 0, 0, 0, 1, 1,
-0.2319308, 0.318412, 0.917668, 0, 0, 0, 1, 1,
-0.2305342, 1.844268, 1.692353, 1, 1, 1, 1, 1,
-0.2226585, -0.6482027, -2.656976, 1, 1, 1, 1, 1,
-0.2222515, 1.230935, -0.6252218, 1, 1, 1, 1, 1,
-0.2201933, -1.064016, -3.125103, 1, 1, 1, 1, 1,
-0.2192651, -0.7556207, -0.7467651, 1, 1, 1, 1, 1,
-0.2186849, -0.5676351, -3.441502, 1, 1, 1, 1, 1,
-0.2179572, 2.266525, 1.421976, 1, 1, 1, 1, 1,
-0.2152979, 2.662997, 0.6894091, 1, 1, 1, 1, 1,
-0.2152655, 0.1308662, -1.175728, 1, 1, 1, 1, 1,
-0.2145382, -0.1934176, -1.788177, 1, 1, 1, 1, 1,
-0.2137321, -1.818781, -4.425703, 1, 1, 1, 1, 1,
-0.2095042, -0.2193511, -0.4716474, 1, 1, 1, 1, 1,
-0.2026955, -1.043736, -2.473208, 1, 1, 1, 1, 1,
-0.1989368, 0.2302628, 0.6259428, 1, 1, 1, 1, 1,
-0.1969469, 2.487393, 0.400974, 1, 1, 1, 1, 1,
-0.1939976, 0.969537, 1.166056, 0, 0, 1, 1, 1,
-0.1902039, -0.5731957, -4.453017, 1, 0, 0, 1, 1,
-0.1896093, -0.049908, -1.496375, 1, 0, 0, 1, 1,
-0.18799, -0.7811242, -3.020063, 1, 0, 0, 1, 1,
-0.1877438, -1.30981, -2.850687, 1, 0, 0, 1, 1,
-0.1865028, -0.1526876, -1.942709, 1, 0, 0, 1, 1,
-0.1850806, -1.093265, -4.655684, 0, 0, 0, 1, 1,
-0.1812872, -0.3542851, -3.75362, 0, 0, 0, 1, 1,
-0.1800507, -0.4488104, -2.518215, 0, 0, 0, 1, 1,
-0.1767078, 0.09727799, -2.495764, 0, 0, 0, 1, 1,
-0.175769, -0.6609595, -2.468343, 0, 0, 0, 1, 1,
-0.1700896, -0.8593929, -2.61319, 0, 0, 0, 1, 1,
-0.1698043, -1.020772, -2.811631, 0, 0, 0, 1, 1,
-0.1604958, 1.334976, -0.3942159, 1, 1, 1, 1, 1,
-0.1564875, -0.8974231, -3.546884, 1, 1, 1, 1, 1,
-0.1510898, -0.2324685, -2.350666, 1, 1, 1, 1, 1,
-0.1493779, 2.263637, -1.776028, 1, 1, 1, 1, 1,
-0.136566, -0.01748279, -1.760183, 1, 1, 1, 1, 1,
-0.1355189, 0.8755457, 1.702935, 1, 1, 1, 1, 1,
-0.1325501, 0.5800705, -1.429374, 1, 1, 1, 1, 1,
-0.1325306, 0.905807, -0.4031919, 1, 1, 1, 1, 1,
-0.1295916, -0.1879294, -3.20542, 1, 1, 1, 1, 1,
-0.1263004, 0.2100304, 1.679563, 1, 1, 1, 1, 1,
-0.1260527, 0.6236308, 0.5037355, 1, 1, 1, 1, 1,
-0.1226824, 0.6568733, -0.5798845, 1, 1, 1, 1, 1,
-0.1205417, -0.9221501, -4.421299, 1, 1, 1, 1, 1,
-0.1195386, -0.8252822, -1.758785, 1, 1, 1, 1, 1,
-0.1158662, -0.6175094, -4.073744, 1, 1, 1, 1, 1,
-0.1129382, -1.075762, -2.804463, 0, 0, 1, 1, 1,
-0.1085163, 1.874985, -0.5447285, 1, 0, 0, 1, 1,
-0.1056933, -0.9930754, -0.7027961, 1, 0, 0, 1, 1,
-0.1055172, -0.5902422, -3.580718, 1, 0, 0, 1, 1,
-0.103215, 1.090876, -0.894998, 1, 0, 0, 1, 1,
-0.1021546, 1.248258, -1.16287, 1, 0, 0, 1, 1,
-0.09693837, 1.417809, -0.9170898, 0, 0, 0, 1, 1,
-0.09465162, 0.4635813, 0.5883619, 0, 0, 0, 1, 1,
-0.09158254, -0.4523888, -3.586448, 0, 0, 0, 1, 1,
-0.09136944, -0.1988227, -2.111509, 0, 0, 0, 1, 1,
-0.07902368, -0.8246898, -2.296984, 0, 0, 0, 1, 1,
-0.07482573, -0.1352809, -3.104693, 0, 0, 0, 1, 1,
-0.06806526, 0.3449219, 0.865249, 0, 0, 0, 1, 1,
-0.06486711, -0.6439038, -1.609105, 1, 1, 1, 1, 1,
-0.06349603, 1.332681, -0.9247785, 1, 1, 1, 1, 1,
-0.06327477, -0.2379993, -3.29792, 1, 1, 1, 1, 1,
-0.06094333, -0.8244621, -4.523604, 1, 1, 1, 1, 1,
-0.06029138, -1.493223, -2.292023, 1, 1, 1, 1, 1,
-0.06005459, -0.210304, -2.596768, 1, 1, 1, 1, 1,
-0.05980045, 0.4660823, 1.130605, 1, 1, 1, 1, 1,
-0.0583649, 1.531027, -0.4536421, 1, 1, 1, 1, 1,
-0.05615455, -0.3279031, -3.649223, 1, 1, 1, 1, 1,
-0.04999506, -0.875701, -2.795043, 1, 1, 1, 1, 1,
-0.04808758, 0.1818346, -0.3980108, 1, 1, 1, 1, 1,
-0.04282543, -0.156692, -3.695503, 1, 1, 1, 1, 1,
-0.04131515, 2.295644, 0.373427, 1, 1, 1, 1, 1,
-0.04084897, 0.3412414, 0.5213726, 1, 1, 1, 1, 1,
-0.03656003, -0.3496692, -5.610049, 1, 1, 1, 1, 1,
-0.03352045, -0.01252687, -1.641081, 0, 0, 1, 1, 1,
-0.03309429, 0.1391456, -1.085194, 1, 0, 0, 1, 1,
-0.0194869, -0.4480671, -2.907287, 1, 0, 0, 1, 1,
-0.01782236, -1.903229, -3.168164, 1, 0, 0, 1, 1,
-0.01729031, -1.080881, -3.522715, 1, 0, 0, 1, 1,
-0.0154719, 0.6470931, 1.240977, 1, 0, 0, 1, 1,
-0.007858125, 1.386638, 0.1410195, 0, 0, 0, 1, 1,
-0.006083825, 0.8586769, -1.455396, 0, 0, 0, 1, 1,
-0.002025913, 0.4465691, 1.117102, 0, 0, 0, 1, 1,
-0.001483334, -1.106167, -2.164702, 0, 0, 0, 1, 1,
0.000759106, -0.2566045, 2.761158, 0, 0, 0, 1, 1,
0.006628088, 0.6404233, -0.2508027, 0, 0, 0, 1, 1,
0.009941846, 0.02626087, 0.3216607, 0, 0, 0, 1, 1,
0.009984124, -1.100471, 2.721834, 1, 1, 1, 1, 1,
0.01254808, 1.03128, 0.7868604, 1, 1, 1, 1, 1,
0.01578846, -0.07721361, 1.899779, 1, 1, 1, 1, 1,
0.01928715, 0.6113746, 0.3989152, 1, 1, 1, 1, 1,
0.02194863, 0.9943414, 1.646463, 1, 1, 1, 1, 1,
0.02294086, 0.07781824, -1.642095, 1, 1, 1, 1, 1,
0.02933341, -1.264013, 4.022265, 1, 1, 1, 1, 1,
0.02936189, -0.2531008, 3.675265, 1, 1, 1, 1, 1,
0.03130686, -1.282982, 4.427078, 1, 1, 1, 1, 1,
0.03137979, 1.414353, -0.5762215, 1, 1, 1, 1, 1,
0.0320399, 0.4027815, -0.3851643, 1, 1, 1, 1, 1,
0.032206, 1.141643, -0.5743005, 1, 1, 1, 1, 1,
0.03239325, 2.749264, 0.445927, 1, 1, 1, 1, 1,
0.03337836, 0.4502902, 2.09317, 1, 1, 1, 1, 1,
0.03394974, 0.3963831, 0.003480421, 1, 1, 1, 1, 1,
0.03667533, -1.758275, 3.608268, 0, 0, 1, 1, 1,
0.0401636, -0.501458, 1.867605, 1, 0, 0, 1, 1,
0.04244472, -0.1131028, 2.92114, 1, 0, 0, 1, 1,
0.04481845, -0.2301874, 4.556062, 1, 0, 0, 1, 1,
0.05001289, -0.6921043, 3.914602, 1, 0, 0, 1, 1,
0.05250296, -0.7812678, 2.358345, 1, 0, 0, 1, 1,
0.05327266, 0.6844747, 1.510918, 0, 0, 0, 1, 1,
0.05470625, 0.793835, -0.01024836, 0, 0, 0, 1, 1,
0.06454141, -0.3125148, 2.129117, 0, 0, 0, 1, 1,
0.06753028, -0.9417165, 2.777589, 0, 0, 0, 1, 1,
0.0687639, 0.4824883, 0.9047054, 0, 0, 0, 1, 1,
0.06940947, 1.068908, 1.676358, 0, 0, 0, 1, 1,
0.07032899, 1.387052, -0.1738497, 0, 0, 0, 1, 1,
0.07049241, -1.016407, 3.875152, 1, 1, 1, 1, 1,
0.07401235, 0.853025, -0.8827537, 1, 1, 1, 1, 1,
0.09047817, 0.1894297, 1.056107, 1, 1, 1, 1, 1,
0.09124424, -1.496738, 3.551555, 1, 1, 1, 1, 1,
0.09131861, -0.09810669, 1.43066, 1, 1, 1, 1, 1,
0.09381802, -1.385961, 3.159796, 1, 1, 1, 1, 1,
0.09447235, -0.4090354, 3.713096, 1, 1, 1, 1, 1,
0.09528949, -0.2894908, 2.982878, 1, 1, 1, 1, 1,
0.09590013, 1.288089, 1.283567, 1, 1, 1, 1, 1,
0.09908424, 1.021074, 0.3174188, 1, 1, 1, 1, 1,
0.09947668, -1.338886, 2.052629, 1, 1, 1, 1, 1,
0.1037693, -1.107887, 2.609305, 1, 1, 1, 1, 1,
0.1047361, -0.6026062, 4.029188, 1, 1, 1, 1, 1,
0.1048791, 0.1879362, -0.3215712, 1, 1, 1, 1, 1,
0.105846, -0.4585017, 2.975725, 1, 1, 1, 1, 1,
0.1073935, -0.8490104, 5.008523, 0, 0, 1, 1, 1,
0.1077496, 0.961217, -0.2834091, 1, 0, 0, 1, 1,
0.1084372, -1.262034, 3.37826, 1, 0, 0, 1, 1,
0.1099387, 0.2557009, 1.295415, 1, 0, 0, 1, 1,
0.1105917, 0.7213478, -0.7337494, 1, 0, 0, 1, 1,
0.1184325, 0.8932962, 0.9049343, 1, 0, 0, 1, 1,
0.1203053, 1.351906, -1.164041, 0, 0, 0, 1, 1,
0.1248609, 0.5088965, 1.861575, 0, 0, 0, 1, 1,
0.1258917, -0.9350629, 2.308573, 0, 0, 0, 1, 1,
0.1265276, 0.3262548, 1.1995, 0, 0, 0, 1, 1,
0.1320125, -0.1574856, 3.027383, 0, 0, 0, 1, 1,
0.1336237, -1.261316, 5.200309, 0, 0, 0, 1, 1,
0.1460417, -0.8894083, 1.898296, 0, 0, 0, 1, 1,
0.1491994, 0.6977268, 0.09879611, 1, 1, 1, 1, 1,
0.150204, -0.640547, 2.394053, 1, 1, 1, 1, 1,
0.1530285, -0.004731306, 2.652575, 1, 1, 1, 1, 1,
0.1530713, -1.64996, 4.884775, 1, 1, 1, 1, 1,
0.1544878, -0.1856101, 1.212409, 1, 1, 1, 1, 1,
0.159356, -2.14451, 0.9288593, 1, 1, 1, 1, 1,
0.1649595, 0.5353647, 0.4579579, 1, 1, 1, 1, 1,
0.1650774, -0.07094076, 3.99822, 1, 1, 1, 1, 1,
0.1655006, -1.487659, 3.457416, 1, 1, 1, 1, 1,
0.1747525, 0.5605473, 0.8721301, 1, 1, 1, 1, 1,
0.1763537, 1.562277, 0.4156545, 1, 1, 1, 1, 1,
0.1788945, -0.5972109, 2.247289, 1, 1, 1, 1, 1,
0.1802062, 0.1999336, 0.5903087, 1, 1, 1, 1, 1,
0.1828196, 1.176846, 0.06240397, 1, 1, 1, 1, 1,
0.1842294, 0.8500323, 1.152198, 1, 1, 1, 1, 1,
0.1845179, -0.4788497, 3.9612, 0, 0, 1, 1, 1,
0.1850695, -0.2349177, 2.848713, 1, 0, 0, 1, 1,
0.190885, -2.191285, 3.497521, 1, 0, 0, 1, 1,
0.1938353, 0.5221531, 0.3834736, 1, 0, 0, 1, 1,
0.1951472, 1.70148, -0.7596973, 1, 0, 0, 1, 1,
0.201297, -0.8434204, 1.053288, 1, 0, 0, 1, 1,
0.2015777, 1.021012, 1.428165, 0, 0, 0, 1, 1,
0.2029912, 1.508065, 0.241612, 0, 0, 0, 1, 1,
0.2101915, -0.3292687, 2.548955, 0, 0, 0, 1, 1,
0.2138735, 0.3779456, 0.2280956, 0, 0, 0, 1, 1,
0.2144918, -0.985822, 2.435484, 0, 0, 0, 1, 1,
0.2150421, 0.1015389, 1.524408, 0, 0, 0, 1, 1,
0.2170259, -0.2266306, 2.93672, 0, 0, 0, 1, 1,
0.2170578, 0.4001388, -1.022978, 1, 1, 1, 1, 1,
0.2182856, 0.8476645, 1.536503, 1, 1, 1, 1, 1,
0.2185376, -0.1705522, 1.516766, 1, 1, 1, 1, 1,
0.2187902, 0.6646398, 0.474572, 1, 1, 1, 1, 1,
0.2195475, 2.070928, 0.9607996, 1, 1, 1, 1, 1,
0.2199923, -0.3092314, 1.64068, 1, 1, 1, 1, 1,
0.2228732, -0.1991083, 2.137403, 1, 1, 1, 1, 1,
0.2268285, -0.2171184, 3.262294, 1, 1, 1, 1, 1,
0.2271227, 0.9296585, 1.264431, 1, 1, 1, 1, 1,
0.2286088, -0.5958607, 0.6729769, 1, 1, 1, 1, 1,
0.2305149, 0.4995115, -1.02545, 1, 1, 1, 1, 1,
0.2322135, -1.0238, 2.784827, 1, 1, 1, 1, 1,
0.2383538, 1.363856, -0.861967, 1, 1, 1, 1, 1,
0.2426038, -1.162582, 2.610706, 1, 1, 1, 1, 1,
0.2426582, -0.5125899, 1.771729, 1, 1, 1, 1, 1,
0.244282, -0.5858766, 2.265588, 0, 0, 1, 1, 1,
0.2452524, 0.2481367, 0.1523472, 1, 0, 0, 1, 1,
0.2453729, 0.3917892, 0.5673441, 1, 0, 0, 1, 1,
0.2454276, -0.4605295, 2.765183, 1, 0, 0, 1, 1,
0.2525848, -0.28012, 3.867551, 1, 0, 0, 1, 1,
0.253586, 0.4777888, 0.1748021, 1, 0, 0, 1, 1,
0.2558075, 0.1588056, 0.6769289, 0, 0, 0, 1, 1,
0.2558959, 1.818275, -0.1848944, 0, 0, 0, 1, 1,
0.2580711, 0.6051822, 2.507395, 0, 0, 0, 1, 1,
0.2585359, 0.1869097, -0.2990652, 0, 0, 0, 1, 1,
0.261334, -0.7060248, 4.28777, 0, 0, 0, 1, 1,
0.2628188, 1.089612, -0.3814951, 0, 0, 0, 1, 1,
0.2635537, 0.2442258, -0.2621316, 0, 0, 0, 1, 1,
0.2639236, -0.8540503, 2.573787, 1, 1, 1, 1, 1,
0.2710406, -0.2321375, 2.543133, 1, 1, 1, 1, 1,
0.2747741, -0.8744652, 4.042122, 1, 1, 1, 1, 1,
0.2765336, 0.2801603, -1.001376, 1, 1, 1, 1, 1,
0.2778946, 0.1845531, 1.587602, 1, 1, 1, 1, 1,
0.2785467, 1.43607, -0.1781225, 1, 1, 1, 1, 1,
0.2791765, -1.105471, 3.438009, 1, 1, 1, 1, 1,
0.281153, -0.4027491, 2.863525, 1, 1, 1, 1, 1,
0.2815883, 1.658807, 0.04421971, 1, 1, 1, 1, 1,
0.2818576, -0.4255767, 2.786622, 1, 1, 1, 1, 1,
0.285958, -0.6167017, 2.486874, 1, 1, 1, 1, 1,
0.2878149, -1.011706, 3.97586, 1, 1, 1, 1, 1,
0.291004, 0.1094951, -0.3663726, 1, 1, 1, 1, 1,
0.292399, 0.7945222, 0.9330669, 1, 1, 1, 1, 1,
0.2944148, 0.03331516, 1.445297, 1, 1, 1, 1, 1,
0.2982842, 0.1301511, 1.362937, 0, 0, 1, 1, 1,
0.300352, -0.07935344, 1.374369, 1, 0, 0, 1, 1,
0.3011149, -0.2038281, 3.85254, 1, 0, 0, 1, 1,
0.3013765, 0.2770025, -0.1161257, 1, 0, 0, 1, 1,
0.3048238, -0.1182356, -1.333329, 1, 0, 0, 1, 1,
0.3053731, -1.018501, 0.9128703, 1, 0, 0, 1, 1,
0.305969, -1.403434, 3.897178, 0, 0, 0, 1, 1,
0.3060497, -0.6763229, 2.802471, 0, 0, 0, 1, 1,
0.3077843, 1.754589, 1.275771, 0, 0, 0, 1, 1,
0.31067, -1.335248, 2.50837, 0, 0, 0, 1, 1,
0.3128166, -1.277602, 2.927838, 0, 0, 0, 1, 1,
0.3129099, -0.1918086, 2.063474, 0, 0, 0, 1, 1,
0.31646, 0.1296315, 2.638454, 0, 0, 0, 1, 1,
0.3174603, 0.5155329, -0.2948855, 1, 1, 1, 1, 1,
0.3196425, -0.3224722, 3.435536, 1, 1, 1, 1, 1,
0.3247832, 0.2855545, 2.52176, 1, 1, 1, 1, 1,
0.326737, 2.025623, 0.494053, 1, 1, 1, 1, 1,
0.3345446, -0.6617367, 4.664434, 1, 1, 1, 1, 1,
0.3364112, 1.334132, 1.220013, 1, 1, 1, 1, 1,
0.3381177, -0.5858912, 1.78003, 1, 1, 1, 1, 1,
0.3394437, -0.5464487, 2.247801, 1, 1, 1, 1, 1,
0.3420933, 0.6401207, -0.07592289, 1, 1, 1, 1, 1,
0.3447221, -0.1853569, 0.3986344, 1, 1, 1, 1, 1,
0.3473896, 0.1856463, 0.1831616, 1, 1, 1, 1, 1,
0.3481045, -0.6066636, 1.62504, 1, 1, 1, 1, 1,
0.3501045, -0.3436173, 2.257097, 1, 1, 1, 1, 1,
0.3509513, 0.1635083, 1.711756, 1, 1, 1, 1, 1,
0.3511063, 0.5383654, -0.2834914, 1, 1, 1, 1, 1,
0.3519449, -1.271462, 2.944324, 0, 0, 1, 1, 1,
0.3521303, 0.6237192, 1.017246, 1, 0, 0, 1, 1,
0.3578864, 1.070369, -0.5703213, 1, 0, 0, 1, 1,
0.3590658, 0.2471652, 1.085452, 1, 0, 0, 1, 1,
0.3738887, 0.1619741, 0.5529634, 1, 0, 0, 1, 1,
0.3741785, -0.785138, 3.183525, 1, 0, 0, 1, 1,
0.3752961, -0.1366662, 2.444821, 0, 0, 0, 1, 1,
0.3758634, 3.210974, 0.3432866, 0, 0, 0, 1, 1,
0.3809783, 0.6972762, -0.6398281, 0, 0, 0, 1, 1,
0.3890384, -0.9740745, 2.326313, 0, 0, 0, 1, 1,
0.3914809, -0.3571529, 2.693848, 0, 0, 0, 1, 1,
0.3921872, 2.186409, -1.007807, 0, 0, 0, 1, 1,
0.3941727, -0.3583029, 0.57489, 0, 0, 0, 1, 1,
0.3977771, -1.560047, 2.912563, 1, 1, 1, 1, 1,
0.3978837, -0.1786943, 1.094711, 1, 1, 1, 1, 1,
0.3987822, -0.7809789, 2.279489, 1, 1, 1, 1, 1,
0.403235, 0.02737698, 0.9287241, 1, 1, 1, 1, 1,
0.4033288, 0.1687276, -0.182737, 1, 1, 1, 1, 1,
0.4056182, -0.6734522, 2.781317, 1, 1, 1, 1, 1,
0.4067135, 0.5188951, -0.02868385, 1, 1, 1, 1, 1,
0.4069788, -0.6964153, 1.107738, 1, 1, 1, 1, 1,
0.4091433, -1.411375, 3.521252, 1, 1, 1, 1, 1,
0.4105119, 2.44825, 1.004848, 1, 1, 1, 1, 1,
0.4130781, -2.478248, 1.853172, 1, 1, 1, 1, 1,
0.4198511, -0.5524026, 0.5227421, 1, 1, 1, 1, 1,
0.4245966, 0.3935633, 0.9126658, 1, 1, 1, 1, 1,
0.4307502, -0.476902, 3.423956, 1, 1, 1, 1, 1,
0.4356313, 0.3117742, 2.297062, 1, 1, 1, 1, 1,
0.4361858, 1.15427, 0.394562, 0, 0, 1, 1, 1,
0.4413003, 0.7576505, 0.08058099, 1, 0, 0, 1, 1,
0.4422667, 0.1016977, 1.588375, 1, 0, 0, 1, 1,
0.442542, 0.3149074, 1.120439, 1, 0, 0, 1, 1,
0.4465285, 1.572904, -0.2186031, 1, 0, 0, 1, 1,
0.4469958, 1.536216, 0.7059487, 1, 0, 0, 1, 1,
0.4471881, -0.5838366, 2.135355, 0, 0, 0, 1, 1,
0.4587792, -0.3532928, 2.858996, 0, 0, 0, 1, 1,
0.4590513, 0.6917388, 1.309356, 0, 0, 0, 1, 1,
0.463205, 1.332161, 1.025838, 0, 0, 0, 1, 1,
0.4655577, -0.6081899, 0.5882254, 0, 0, 0, 1, 1,
0.4705735, -0.3612728, -0.1080367, 0, 0, 0, 1, 1,
0.4710683, 1.00807, 0.2919251, 0, 0, 0, 1, 1,
0.4718205, 1.236883, 0.7179818, 1, 1, 1, 1, 1,
0.4720589, -0.6370719, 2.210572, 1, 1, 1, 1, 1,
0.4810894, 0.7101343, -0.1845854, 1, 1, 1, 1, 1,
0.4855162, -0.02762789, 1.384463, 1, 1, 1, 1, 1,
0.4906253, -1.989338, 1.336081, 1, 1, 1, 1, 1,
0.4914529, -1.309986, 5.137529, 1, 1, 1, 1, 1,
0.4995254, 1.181599, 0.6627245, 1, 1, 1, 1, 1,
0.5018322, 0.4644673, 0.40789, 1, 1, 1, 1, 1,
0.5088282, 0.7669333, 0.5996736, 1, 1, 1, 1, 1,
0.511373, -0.1160793, 1.619865, 1, 1, 1, 1, 1,
0.5138607, 0.7425743, 1.089087, 1, 1, 1, 1, 1,
0.5150145, -0.8303522, 1.514217, 1, 1, 1, 1, 1,
0.5228453, 1.088567, -0.7241002, 1, 1, 1, 1, 1,
0.524198, 0.6220222, 0.493425, 1, 1, 1, 1, 1,
0.5250423, 0.2069675, 0.7754477, 1, 1, 1, 1, 1,
0.5254387, -1.099784, 2.430012, 0, 0, 1, 1, 1,
0.5261415, 0.5761819, 2.439104, 1, 0, 0, 1, 1,
0.5274893, 0.2668869, 2.427823, 1, 0, 0, 1, 1,
0.529593, -0.1262666, 2.806149, 1, 0, 0, 1, 1,
0.5309312, -0.3930786, 2.177564, 1, 0, 0, 1, 1,
0.5511577, -0.2048188, 2.473391, 1, 0, 0, 1, 1,
0.5569856, -2.125879, 3.650871, 0, 0, 0, 1, 1,
0.5594693, -0.6701183, 1.789479, 0, 0, 0, 1, 1,
0.5603014, 0.7487456, 1.96321, 0, 0, 0, 1, 1,
0.5629886, 0.5781816, 0.01673937, 0, 0, 0, 1, 1,
0.5638108, 0.4995658, -0.3226491, 0, 0, 0, 1, 1,
0.5664367, -0.8378444, 4.502274, 0, 0, 0, 1, 1,
0.5722886, -0.03321778, 2.061039, 0, 0, 0, 1, 1,
0.574248, -0.4311039, 1.622468, 1, 1, 1, 1, 1,
0.5789312, 0.3742775, -0.5975476, 1, 1, 1, 1, 1,
0.5794542, 1.324933, 0.7538437, 1, 1, 1, 1, 1,
0.5808123, 0.760471, -0.4697575, 1, 1, 1, 1, 1,
0.581904, -0.2549216, 2.578618, 1, 1, 1, 1, 1,
0.585076, -0.7662919, 0.8114106, 1, 1, 1, 1, 1,
0.5853725, 0.7003633, -1.476063, 1, 1, 1, 1, 1,
0.587227, 0.3307427, 1.448034, 1, 1, 1, 1, 1,
0.593288, -0.6325523, 2.14605, 1, 1, 1, 1, 1,
0.596731, -0.7830425, 2.068897, 1, 1, 1, 1, 1,
0.5986863, -1.683134, 2.85373, 1, 1, 1, 1, 1,
0.6015162, -0.05773596, 1.152848, 1, 1, 1, 1, 1,
0.614235, -1.572208, 2.662783, 1, 1, 1, 1, 1,
0.6157508, 0.2056016, 2.405639, 1, 1, 1, 1, 1,
0.6161372, -0.2016589, 1.327462, 1, 1, 1, 1, 1,
0.6168299, 0.3704582, 0.8092999, 0, 0, 1, 1, 1,
0.6209367, -1.266772, 2.424841, 1, 0, 0, 1, 1,
0.6224148, 0.6423827, 1.670721, 1, 0, 0, 1, 1,
0.6234766, -2.127478, 3.510144, 1, 0, 0, 1, 1,
0.6254401, -0.9064817, 2.723059, 1, 0, 0, 1, 1,
0.6256999, 0.8910587, 1.843824, 1, 0, 0, 1, 1,
0.63749, 0.2017382, 0.3068544, 0, 0, 0, 1, 1,
0.6403493, -0.4225962, 0.1193294, 0, 0, 0, 1, 1,
0.6430294, -1.011018, 3.086814, 0, 0, 0, 1, 1,
0.6495257, 1.622851, 1.324487, 0, 0, 0, 1, 1,
0.6500062, 1.136595, 0.4264819, 0, 0, 0, 1, 1,
0.6558993, 0.5301099, -0.4665097, 0, 0, 0, 1, 1,
0.6568975, 0.6676946, -1.93045, 0, 0, 0, 1, 1,
0.6650352, -3.94537, 2.991629, 1, 1, 1, 1, 1,
0.6659231, 0.7528167, -0.06395999, 1, 1, 1, 1, 1,
0.6682689, -0.2631638, 2.321585, 1, 1, 1, 1, 1,
0.6687802, -0.2379786, 1.010308, 1, 1, 1, 1, 1,
0.6718325, -0.8269901, 1.614503, 1, 1, 1, 1, 1,
0.675511, -0.6570124, 2.509822, 1, 1, 1, 1, 1,
0.6780461, -1.198337, 3.043011, 1, 1, 1, 1, 1,
0.6839035, 0.5704517, 0.09209037, 1, 1, 1, 1, 1,
0.6870385, 1.128521, 2.502853, 1, 1, 1, 1, 1,
0.6921818, -0.5507447, 2.064944, 1, 1, 1, 1, 1,
0.6969407, 1.33225, 2.164263, 1, 1, 1, 1, 1,
0.7004794, 0.05882391, -0.3052808, 1, 1, 1, 1, 1,
0.7049843, 0.5283268, 1.362132, 1, 1, 1, 1, 1,
0.7158473, 0.3434654, 1.627522, 1, 1, 1, 1, 1,
0.7185368, -0.01644478, 2.716329, 1, 1, 1, 1, 1,
0.7218989, -0.7946522, 2.07088, 0, 0, 1, 1, 1,
0.722303, 0.6316181, 0.5735604, 1, 0, 0, 1, 1,
0.7241037, 0.5981839, 0.7034376, 1, 0, 0, 1, 1,
0.7320268, -0.5506926, 0.1130196, 1, 0, 0, 1, 1,
0.7351686, -0.04731672, 2.113497, 1, 0, 0, 1, 1,
0.7435378, -1.152751, 2.432608, 1, 0, 0, 1, 1,
0.7475139, -0.814132, 2.697743, 0, 0, 0, 1, 1,
0.7580318, 1.269095, 0.8638808, 0, 0, 0, 1, 1,
0.764833, -0.8463584, 1.307651, 0, 0, 0, 1, 1,
0.7669445, -0.4475542, 1.174001, 0, 0, 0, 1, 1,
0.7683395, 0.8580589, 1.620797, 0, 0, 0, 1, 1,
0.7724144, -0.2317916, 1.91927, 0, 0, 0, 1, 1,
0.7736996, 0.6908491, 1.332209, 0, 0, 0, 1, 1,
0.7742003, -1.287626, 1.843006, 1, 1, 1, 1, 1,
0.7782002, 1.193982, 1.020938, 1, 1, 1, 1, 1,
0.779234, -0.8354436, 3.984864, 1, 1, 1, 1, 1,
0.7887412, -0.5000288, 1.453489, 1, 1, 1, 1, 1,
0.7922339, 0.3685165, 1.180092, 1, 1, 1, 1, 1,
0.7950506, 0.08729456, 3.603462, 1, 1, 1, 1, 1,
0.7958727, -1.104082, 2.590807, 1, 1, 1, 1, 1,
0.8031319, 1.289144, 0.1031154, 1, 1, 1, 1, 1,
0.8059732, 0.8096468, 1.178934, 1, 1, 1, 1, 1,
0.8118936, 0.8755904, 1.323095, 1, 1, 1, 1, 1,
0.816691, 0.5139033, 1.793702, 1, 1, 1, 1, 1,
0.8210763, -0.4894473, 2.779263, 1, 1, 1, 1, 1,
0.8285757, 1.480647, 2.320075, 1, 1, 1, 1, 1,
0.8334473, -1.429507, 2.574119, 1, 1, 1, 1, 1,
0.8335807, 2.378017, -0.4807363, 1, 1, 1, 1, 1,
0.8343117, 0.4572673, 1.924076, 0, 0, 1, 1, 1,
0.8349729, 0.4942591, 1.350236, 1, 0, 0, 1, 1,
0.8396299, -0.2595091, 4.136533, 1, 0, 0, 1, 1,
0.8408081, 0.737586, 2.93494, 1, 0, 0, 1, 1,
0.8516704, -1.113719, 2.213435, 1, 0, 0, 1, 1,
0.8573296, -0.3627315, 4.036923, 1, 0, 0, 1, 1,
0.8576245, -0.568309, 0.2327397, 0, 0, 0, 1, 1,
0.8643606, -0.2757705, 2.235766, 0, 0, 0, 1, 1,
0.8683612, 0.2779245, 2.151791, 0, 0, 0, 1, 1,
0.871483, 0.8508584, 2.205406, 0, 0, 0, 1, 1,
0.8727469, -0.159463, 1.191789, 0, 0, 0, 1, 1,
0.8787416, 1.531611, 0.7185365, 0, 0, 0, 1, 1,
0.881373, -0.9909116, 2.627524, 0, 0, 0, 1, 1,
0.8859869, 0.9054583, 3.132524, 1, 1, 1, 1, 1,
0.8876222, -0.8228962, 0.7684178, 1, 1, 1, 1, 1,
0.8906584, 0.1467368, 0.2397826, 1, 1, 1, 1, 1,
0.8939907, 0.3897292, 1.351275, 1, 1, 1, 1, 1,
0.9004109, -1.545095, 2.500222, 1, 1, 1, 1, 1,
0.9007316, 1.132016, 0.3071645, 1, 1, 1, 1, 1,
0.9012015, 0.2579763, 0.05531192, 1, 1, 1, 1, 1,
0.902207, -0.8980032, 2.937395, 1, 1, 1, 1, 1,
0.9045774, -2.161795, 3.111394, 1, 1, 1, 1, 1,
0.9123687, -1.598906, 2.717631, 1, 1, 1, 1, 1,
0.914111, 0.2670996, 1.643516, 1, 1, 1, 1, 1,
0.9150909, 0.2816756, -0.4421822, 1, 1, 1, 1, 1,
0.9154177, 0.2216938, 1.46995, 1, 1, 1, 1, 1,
0.916438, 0.6181909, -0.0970019, 1, 1, 1, 1, 1,
0.9168842, 1.960203, -1.040864, 1, 1, 1, 1, 1,
0.9194198, -0.2969184, 1.35898, 0, 0, 1, 1, 1,
0.9236571, -0.3463449, 2.532359, 1, 0, 0, 1, 1,
0.9363661, 0.07657443, 2.647202, 1, 0, 0, 1, 1,
0.9397027, -1.537869, 5.203361, 1, 0, 0, 1, 1,
0.9401929, -0.5492379, 4.567779, 1, 0, 0, 1, 1,
0.9465956, 0.4582298, 3.298265, 1, 0, 0, 1, 1,
0.9636775, -0.4001162, 1.419829, 0, 0, 0, 1, 1,
0.976136, -0.3600115, -0.5019084, 0, 0, 0, 1, 1,
0.9763311, -1.942303, 1.776109, 0, 0, 0, 1, 1,
0.9765787, -0.948322, 2.078559, 0, 0, 0, 1, 1,
0.9775774, -0.7084916, 2.734434, 0, 0, 0, 1, 1,
0.9906715, -0.2087156, 2.58075, 0, 0, 0, 1, 1,
0.9956387, 0.7731432, 0.5875066, 0, 0, 0, 1, 1,
0.9994753, -0.6682147, 1.246017, 1, 1, 1, 1, 1,
1.003465, 0.8154665, 1.410188, 1, 1, 1, 1, 1,
1.012582, -0.4639247, 3.875109, 1, 1, 1, 1, 1,
1.016006, 0.8814214, 0.5208496, 1, 1, 1, 1, 1,
1.017971, 1.993643, 1.128261, 1, 1, 1, 1, 1,
1.026186, -1.323912, 0.9193658, 1, 1, 1, 1, 1,
1.026208, 0.03142123, 2.532518, 1, 1, 1, 1, 1,
1.040971, 0.8805763, 0.7266445, 1, 1, 1, 1, 1,
1.046661, 0.661271, 1.953019, 1, 1, 1, 1, 1,
1.047484, -1.32501, 3.918752, 1, 1, 1, 1, 1,
1.051264, 1.184696, 0.6909903, 1, 1, 1, 1, 1,
1.051873, -0.07262297, 0.7375361, 1, 1, 1, 1, 1,
1.054176, -0.5298527, 1.671864, 1, 1, 1, 1, 1,
1.056907, 2.09516, -0.04832051, 1, 1, 1, 1, 1,
1.062139, -0.608223, 2.00452, 1, 1, 1, 1, 1,
1.07069, -0.2225755, 2.843485, 0, 0, 1, 1, 1,
1.072395, -0.315385, 1.05587, 1, 0, 0, 1, 1,
1.078001, 1.180464, 3.119741, 1, 0, 0, 1, 1,
1.082624, -0.265377, 0.931859, 1, 0, 0, 1, 1,
1.088749, 0.3637158, -1.400094, 1, 0, 0, 1, 1,
1.090582, 1.165716, -0.4875287, 1, 0, 0, 1, 1,
1.091121, -1.199676, 2.60286, 0, 0, 0, 1, 1,
1.095047, -0.5304704, 1.705621, 0, 0, 0, 1, 1,
1.104656, 0.3851625, 1.475699, 0, 0, 0, 1, 1,
1.106757, -0.5472077, 2.182422, 0, 0, 0, 1, 1,
1.120319, 0.9225918, 1.152603, 0, 0, 0, 1, 1,
1.128489, -0.8334126, 1.956795, 0, 0, 0, 1, 1,
1.130797, 0.5590317, -0.6491433, 0, 0, 0, 1, 1,
1.134182, -0.7814149, 2.404255, 1, 1, 1, 1, 1,
1.134257, -0.1527389, 0.74709, 1, 1, 1, 1, 1,
1.138065, 1.745257, -0.6717392, 1, 1, 1, 1, 1,
1.148875, -0.9261, 2.325045, 1, 1, 1, 1, 1,
1.156308, 0.02106448, 0.6059393, 1, 1, 1, 1, 1,
1.171358, 0.6737262, 1.254647, 1, 1, 1, 1, 1,
1.18805, 0.8714419, 2.974597, 1, 1, 1, 1, 1,
1.190209, 1.391579, 2.221048, 1, 1, 1, 1, 1,
1.194593, -1.143561, 2.811875, 1, 1, 1, 1, 1,
1.19573, -0.1142458, 0.1074722, 1, 1, 1, 1, 1,
1.209321, -0.8940915, 2.56513, 1, 1, 1, 1, 1,
1.215683, -0.4022993, 1.16151, 1, 1, 1, 1, 1,
1.215748, 0.376579, 2.926558, 1, 1, 1, 1, 1,
1.215868, -1.012677, 0.567241, 1, 1, 1, 1, 1,
1.21651, 0.9667191, 1.156852, 1, 1, 1, 1, 1,
1.221717, -0.1367179, 2.436587, 0, 0, 1, 1, 1,
1.225072, 0.6673273, -0.282169, 1, 0, 0, 1, 1,
1.229177, 0.5371786, 0.6550849, 1, 0, 0, 1, 1,
1.230642, 1.754868, 2.708937, 1, 0, 0, 1, 1,
1.239572, -1.579966, 2.866722, 1, 0, 0, 1, 1,
1.242763, -0.2766974, 0.8094359, 1, 0, 0, 1, 1,
1.244369, -2.061402, 2.261687, 0, 0, 0, 1, 1,
1.249395, 1.167849, 2.417526, 0, 0, 0, 1, 1,
1.258265, 1.285318, 0.01680911, 0, 0, 0, 1, 1,
1.265688, 0.1312616, 0.6828691, 0, 0, 0, 1, 1,
1.272388, -0.1571586, 2.449046, 0, 0, 0, 1, 1,
1.281999, -0.1570709, 0.4371423, 0, 0, 0, 1, 1,
1.290182, -1.060989, 3.23045, 0, 0, 0, 1, 1,
1.295761, 1.703802, 2.364891, 1, 1, 1, 1, 1,
1.296124, -1.869244, 2.215029, 1, 1, 1, 1, 1,
1.301475, 0.04612805, 2.810642, 1, 1, 1, 1, 1,
1.302266, -0.0851352, 0.7618869, 1, 1, 1, 1, 1,
1.307608, 2.050513, -0.7362683, 1, 1, 1, 1, 1,
1.310936, 0.4543363, 0.06771169, 1, 1, 1, 1, 1,
1.316989, 0.6257566, -0.006878459, 1, 1, 1, 1, 1,
1.319925, 0.09761146, 1.543866, 1, 1, 1, 1, 1,
1.321842, 2.461071, -0.7215058, 1, 1, 1, 1, 1,
1.324653, -0.7101815, 1.81962, 1, 1, 1, 1, 1,
1.327065, 0.803314, 1.983565, 1, 1, 1, 1, 1,
1.332487, -0.1200331, 2.973136, 1, 1, 1, 1, 1,
1.348887, 1.30438, 0.4286945, 1, 1, 1, 1, 1,
1.371531, 1.038971, -1.16666, 1, 1, 1, 1, 1,
1.376061, 0.1714303, 0.05190685, 1, 1, 1, 1, 1,
1.376608, 0.1375357, 0.4706109, 0, 0, 1, 1, 1,
1.380919, -0.7083321, 2.033773, 1, 0, 0, 1, 1,
1.389429, -0.5018588, 4.108907, 1, 0, 0, 1, 1,
1.392511, -0.488576, 1.987764, 1, 0, 0, 1, 1,
1.392515, 0.9218122, 0.7205166, 1, 0, 0, 1, 1,
1.407436, 0.2422391, 0.7086247, 1, 0, 0, 1, 1,
1.410467, 0.6105934, 1.87832, 0, 0, 0, 1, 1,
1.421915, 1.350921, 1.261032, 0, 0, 0, 1, 1,
1.428946, -0.1319592, 2.892753, 0, 0, 0, 1, 1,
1.431948, 0.762921, -1.285279, 0, 0, 0, 1, 1,
1.432921, 0.2850031, 0.9541098, 0, 0, 0, 1, 1,
1.433666, -0.6748652, 0.8538879, 0, 0, 0, 1, 1,
1.446144, 0.585903, 1.72385, 0, 0, 0, 1, 1,
1.450172, 2.167235, -1.789741, 1, 1, 1, 1, 1,
1.453149, -0.2481741, 2.977317, 1, 1, 1, 1, 1,
1.455382, 0.4987685, -0.2130337, 1, 1, 1, 1, 1,
1.470757, -0.7955458, 2.644586, 1, 1, 1, 1, 1,
1.490817, 0.8166206, 0.8546709, 1, 1, 1, 1, 1,
1.492507, 1.441968, 0.2409662, 1, 1, 1, 1, 1,
1.499874, 0.9798906, 0.175435, 1, 1, 1, 1, 1,
1.523015, -0.07249475, 1.897746, 1, 1, 1, 1, 1,
1.523331, -0.9261029, 3.047715, 1, 1, 1, 1, 1,
1.533429, 0.1618077, 0.7918308, 1, 1, 1, 1, 1,
1.53384, -1.333395, 3.246717, 1, 1, 1, 1, 1,
1.534106, 0.2104591, 1.625269, 1, 1, 1, 1, 1,
1.539916, -0.4415949, 2.138742, 1, 1, 1, 1, 1,
1.543762, 0.4437865, 1.58209, 1, 1, 1, 1, 1,
1.545208, -1.448984, 0.8260276, 1, 1, 1, 1, 1,
1.547101, 0.1115809, 0.5375865, 0, 0, 1, 1, 1,
1.551022, -0.7656532, 1.007064, 1, 0, 0, 1, 1,
1.555633, 1.775192, 2.791219, 1, 0, 0, 1, 1,
1.561367, -0.2088469, 2.516735, 1, 0, 0, 1, 1,
1.564119, -0.07685526, 1.411412, 1, 0, 0, 1, 1,
1.567154, -0.7675841, 1.308932, 1, 0, 0, 1, 1,
1.586019, -0.9820099, 1.837701, 0, 0, 0, 1, 1,
1.599523, -0.4268781, 3.769667, 0, 0, 0, 1, 1,
1.606812, -0.5641553, 1.60727, 0, 0, 0, 1, 1,
1.617294, 0.7430627, 0.6165791, 0, 0, 0, 1, 1,
1.633359, -0.6667029, 2.217111, 0, 0, 0, 1, 1,
1.636438, -0.3023332, 1.005454, 0, 0, 0, 1, 1,
1.637697, 0.4161912, 0.07501906, 0, 0, 0, 1, 1,
1.641518, -0.7494059, 0.9534135, 1, 1, 1, 1, 1,
1.643143, 0.6840887, 2.135371, 1, 1, 1, 1, 1,
1.644463, -0.9107372, 1.931466, 1, 1, 1, 1, 1,
1.646199, -0.5121683, 2.071861, 1, 1, 1, 1, 1,
1.647184, -0.1109271, 1.582654, 1, 1, 1, 1, 1,
1.651874, 1.797287, 1.407628, 1, 1, 1, 1, 1,
1.655236, -0.1359357, 2.770389, 1, 1, 1, 1, 1,
1.655651, -0.9361535, 1.550469, 1, 1, 1, 1, 1,
1.657418, 0.9844913, 1.784722, 1, 1, 1, 1, 1,
1.658152, -0.3190134, 1.931961, 1, 1, 1, 1, 1,
1.658596, 1.547652, -1.256559, 1, 1, 1, 1, 1,
1.666337, 0.336721, 2.994685, 1, 1, 1, 1, 1,
1.671943, 0.3969327, -0.8247104, 1, 1, 1, 1, 1,
1.675113, -1.867343, 2.614986, 1, 1, 1, 1, 1,
1.695478, 0.5287242, 1.038045, 1, 1, 1, 1, 1,
1.703829, 1.015641, 1.274043, 0, 0, 1, 1, 1,
1.704964, 0.9884767, 2.035879, 1, 0, 0, 1, 1,
1.71623, -0.9799857, 0.6530306, 1, 0, 0, 1, 1,
1.722085, -1.753924, 1.460919, 1, 0, 0, 1, 1,
1.736651, 1.575827, 1.134211, 1, 0, 0, 1, 1,
1.737452, -3.724313, 4.026, 1, 0, 0, 1, 1,
1.741477, 0.1734463, 1.090468, 0, 0, 0, 1, 1,
1.746736, 1.362878, 1.278201, 0, 0, 0, 1, 1,
1.757829, 0.6729787, 1.559456, 0, 0, 0, 1, 1,
1.758016, -0.5615624, 2.493658, 0, 0, 0, 1, 1,
1.801383, 0.169288, 1.338494, 0, 0, 0, 1, 1,
1.811771, 1.797077, 0.9932299, 0, 0, 0, 1, 1,
1.816512, -1.211744, 1.79643, 0, 0, 0, 1, 1,
1.830868, 1.69727, -0.3664669, 1, 1, 1, 1, 1,
1.861797, -1.37435, 2.582905, 1, 1, 1, 1, 1,
1.875683, -1.116755, 0.754604, 1, 1, 1, 1, 1,
1.903932, 0.8308589, -0.06282534, 1, 1, 1, 1, 1,
1.90577, -0.2466378, 0.1976894, 1, 1, 1, 1, 1,
1.907735, 1.292205, 0.03432449, 1, 1, 1, 1, 1,
1.93009, 0.1861752, 0.5836038, 1, 1, 1, 1, 1,
1.967615, 1.845677, 0.9372109, 1, 1, 1, 1, 1,
2.023021, 0.7546885, 0.1577999, 1, 1, 1, 1, 1,
2.027482, 0.8498337, 1.024762, 1, 1, 1, 1, 1,
2.032223, -0.9588294, 0.8656448, 1, 1, 1, 1, 1,
2.033452, -0.2494885, 1.594464, 1, 1, 1, 1, 1,
2.04576, 1.518144, 0.7751995, 1, 1, 1, 1, 1,
2.048096, -0.5320647, 4.279871, 1, 1, 1, 1, 1,
2.071619, 0.3269245, 0.218964, 1, 1, 1, 1, 1,
2.073217, -1.567663, 1.728593, 0, 0, 1, 1, 1,
2.078068, 0.2399115, -0.03645772, 1, 0, 0, 1, 1,
2.129008, 1.531448, 0.2496226, 1, 0, 0, 1, 1,
2.159094, -0.7147487, 1.188484, 1, 0, 0, 1, 1,
2.219517, -0.7120832, 2.544895, 1, 0, 0, 1, 1,
2.231699, -0.4339006, 2.363113, 1, 0, 0, 1, 1,
2.261832, -1.665593, 2.720601, 0, 0, 0, 1, 1,
2.264408, -1.807436, 1.721663, 0, 0, 0, 1, 1,
2.356689, 1.717418, 1.690884, 0, 0, 0, 1, 1,
2.378779, 0.4824015, 1.619123, 0, 0, 0, 1, 1,
2.471394, 0.653992, 0.8632278, 0, 0, 0, 1, 1,
2.524642, 1.006698, 1.688657, 0, 0, 0, 1, 1,
2.56991, 0.6051319, 1.955466, 0, 0, 0, 1, 1,
2.615952, -2.308141, 2.095487, 1, 1, 1, 1, 1,
2.638671, 0.8746093, 1.454329, 1, 1, 1, 1, 1,
2.643575, -1.18669, 2.091962, 1, 1, 1, 1, 1,
2.699991, 1.248953, 1.59512, 1, 1, 1, 1, 1,
2.721436, 0.8453259, 1.149679, 1, 1, 1, 1, 1,
2.813978, -1.873701, 1.468747, 1, 1, 1, 1, 1,
3.326411, 2.120837, 0.1645269, 1, 1, 1, 1, 1
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
var radius = 10.08436;
var distance = 35.4209;
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
mvMatrix.translate( 0.2447951, 0.2439699, 0.2033443 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.4209);
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
